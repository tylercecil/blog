---
title: Making make Easy
abstract: How to write more general makefiles. An "easymake oven," if you
          will. Covers pointers for organizing your C / C++ projects.
---

If you come from a systems programming world, `make` is a pretty amazing tool.
Being able to keep track of a dependence graph of files, and using the last
modified time-stamp to automate tasks seems pretty clever and general. It's
small, composable, versatile --- a true unix tool.

But if you are something of a beginner to C/C++, you may feel a little indignant
that you are being forced to write your dependencies in two different places (both
the includes in your source files *and* the makefile itself). Yeah, it is
important to compile your project in chunks and link
later, but shouldn't `gcc` or `clang` be able to figure out how, all by itself?

There are reasons why things aren't this way, and many of them are legacy
reasons (and, yes, many of them are actually good reasons). All the same, I long
ago set out to make something of an "*automated general makefile.*" Many of my
students have asked me how exactly it works, so I decided to make this
step-by-step walk-through of making a general makefile that should work with
most simple C/C++ projects.

Typical Object and Executable Rules
===================================
For a typical project (especially for beginners), chances are most of your
makefiles look the same, and are probably broken into two main sets of rules:
object rules, and executable rules.

Object Rules
------------
*Most* rules in your makefile likely look something like this:
```makefile
mylib.o : mylib.c mylib.h
	$(CC) mylib.c -c -o mylib.o
```
This is stupidly redundant! Despite popular opinions, computers are supposed to
make your life easier. Makefiles provided a number of
[automatic variables](https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html)
to fix this. Here are arguably the three most important:

| Variable | Meaning |
|----------|---------|
| `$@`     | Name of the target.             |
| `$<`     | Name of the first prerequisite. |
| `$^`     | Name of all the prerequisites.  |

This is made more complicated if you are dealing with
[archives](https://www.gnu.org/software/make/manual/html_node/Archives.html#Archives),
or are dealing with duplicates in your linking process. I'm just going to cover
the basics. With this lovely information, let's rewrite this rule!
```makefile
mylib.o : mylib.c mylib.h
	$(CC) $< -c -o $@
```
There we go! Much more readable... Ok, maybe not more readable, but this will
help us start to generalize things.

Executable Rules
----------------
Just like object files, most simple projects have nearly identical final rules
for their executable.
```makefile
exec : thing1.o thing2.o thing3.o thing4.o thing5.o
	$(CC) thing1.o thing2.o thing3.o thing4.o thing5.o -o exec
```
Again, we can much more conciesly express this with
```makefile
exec : thing1.o thing2.o thing3.o thing4.o thing5.o
	$(CC) $^ -o $@
```

But These Rules Are Still Pretty Redundant!
===========================================
*Oh, yeah, totally*! Let's see how we can fix that... First thing is first ---
lets make a list of all the files we have!
```makefile
FILES := thing1.c thing2.c thing3.c thing4.c thing5.c
```
Ok, so now what? Well, we probably will have an object file for each one of
those source files.
```makefile
OBJECTS := $(FILES:.c=.o)
```
That little chunk of magic essentially says make a copy of `FILES`, replacing
the `.c` extension with `.o`. Note that the whitespace matters here (and in
general everywhere for makefiles).

Now that we have a list of files and objects, let's make a simple makefile which
builds every object file, and links them all together into one executable!
```makefile
# List our files
FILES := thing1.c thing2.c thing3.c thing4.c thing5.c
# Turn those files into a list of objects
OBJECTS := $(FILES:.c=.o)

all : exec

# Object file rules
%.o : %.c
	$(CC) $< -c -o $@

# Executable rule
exec : $(OBJECTS)
	$(CC) $^ -o $@
```
Yeah, now we be jammin'! So what's going on with the `%.o` rule? Well this is a
[pattern rule](https://www.gnu.org/software/make/manual/html_node/Pattern-Rules.html),
which does pretty much what you'd expect. Anything looking for a rule of the
form `stem.o` that doesn't exist will be matched, and will depend on
`stem.c`. *(Right now I am ignoring header files, don't worry!)*

Detecting Files
===============
Ok, we're getting somewhere, but chances are we probably want an object file for
every `.c` file in our project. Can we make `make` automatically build our `FILES`
list? Yes, of course we can, that's why I asked the question. While we're doing
this, let's try and clean things up a bit.
```makefile
# Compiler
CC       := clang

# Directories and targets
SRCDIR   := src
BUILDDIR := build
TARGET   := myprog

# Build a list of files automatically!
SRCEXT   := c
SOURCES  := $(shell find $(SRCDIR) -type f -name *.$(SRCEXT))
OBJECTS  := $(patsubst $(SRCDIR)/%, $(BUILDDIR)/%,$(SOURCES:.$(SRCEXT)=.o))

.SECONDEXPANSION:

all : $(TARGET)

$(TARGET) : $(OBJECTS)
	$(CC) $^ -o $@

$(BUILDDIR)/%.o : $(SRCDIR)/%.c
	@mkdir -p $$(dirname $@)
	$(CC) -o $@ -c $<
```
Starting to look pretty fancy, right? Other than the general cleaning, this adds
a way for `make` to automatically detect the source files that will be needed when
compiling.

`SOURCES := $(shell ...)` uses a `make` function called
[shell](https://www.gnu.org/software/make/manual/html_node/Shell-Function.html). Essentially
the function just runs it's arguments as a shell command, and evaluates to its
result. We used `find` to look for all files ending in `SRCEXT` in the `SRCDIR`
directory. Now `make` can know what files to compile, without us having to tell
it!

`OBJECTS := $(pathsubst ...)` uses the
[pathsubst](https://www.gnu.org/software/make/manual/html_node/Text-Functions.html)
function to make sure our object files go to `BUILDDIR` instead of
`SRCDIR`. This will make sure we don't have junk files everywhere when we make.

`.SECONDEXPANSION` and the `mkdir` are just housekeeping. It keeps our compiler
from complaining that there isn't a directory to put our object files. See the
`make` manual on
[secondary expansion](https://www.gnu.org/software/make/manual/html_node/Secondary-Expansion.html)
to get an idea of what is going on.

What about Headers?
===================
Right now, if you edit one of your `.c`/`.cc`/`.cpp` files, `make` will know to
recompile properly. But let's say you edit one of your header files --- none of
our rules depend on those header files!

We could try something like this:
```makefile
# A poor attempt at dealing with header files.
$(BUILDDIR)/%.o : $(SRCDIR)/%.c $(HDIR)/%.h
	$(CC) -o $@ -c $<
```
But this assumes that for every `.c` file there is a `.h` file. Even for small
and simple projects this is a pretty bad assumption! We are going to have to get
pretty fancy here. How can we automatically figure out what files are included
by a given source file?

The `-M` Compilation Flags
--------------------------
Luckily this is a solved problem. Consider the following C program
```c
// Dumb C Program
#include "myheader.h"
```
Pretty crazy, I know. Now check this out.
```bash
$ # Run your compiler with -M
$ clang -M new.c
new.o: new.c myheader.
```
The `-M` flag essentially says "read this file, and build me makefile rules!"
There are some variations on this flag, bug we will use just a few.

| Flag | Meaning |
|------|-----------------------------------------------------------------------|
| M    | Build makefile dependencies, and stop.                                |
| MM   | Build makefile dependencies, ignore files on the system path (like `stdio.h`). |
| MP   | Give a dumby rule for included files. Prevents `make` from spitting out an error if the header is deleted. |
| MD   | Compile the file like normal WHILE building makefile dependencies.    |
| MF   | Give a name to this "mini-makefile"                                   |

Using Sub-Makefiles
-------------------
So how is our makefile going to use this? With the
[include directive](https://www.gnu.org/software/make/manual/html_node/Include.html). By
simply including this files, `make` will know about these subtle
dependencies. Putting it together gives us something like:
```makefile
# Compiler
CC       := clang

# Directories and targets
SRCDIR   := src
BUILDDIR := build
TARGET   := myprog

# Build a list of files automatically!
SRCEXT   := c
SOURCES  := $(shell find $(SRCDIR) -type f -name *.$(SRCEXT))
OBJECTS  := $(patsubst $(SRCDIR)/%, $(BUILDDIR)/%,$(SOURCES:.$(SRCEXT)=.o))
DEPS     := $(OBJECTS:%.o=%.d)

.SECONDEXPANSION:

all : $(TARGET)

$(TARGET) : $(OBJECTS)
	$(CC) $^ -o $@

$(BUILDDIR)/%.o : $(SRCDIR)/%.c
	@mkdir -p $$(dirname $@)
	$(CC) -c -o $@ -MMD -MP -MF ${@:.o=.d} $<

# Include all dependence information from the last build
-include $(DEPS)
```

**Finally! We have a makefile that just... generally works!**

A Final Cleanup
===============
Before we call this good, let's do one last cleanup. Part of this cleanup should
involve our project structure. I am going to assume my project looks something
like this.
```
project
| -- src     (Source Files)
| -- include (Header Files)
| -- lib     (3rd Party Libraries)
| -- build   (Object Files)
| -- bin
|    | -- target
```
This is a pretty typical project layout --- if you're not sure how to organize
your simple C / C++ project, consider that layout. So, without really much
explanation, here is our final makefile:
```makefile
# Compiler and flags
CC       := clang
CFLAGS   := $(CLAGS) -Wall -Wextra -O3
INC      := -I include
LIB      := -lmath -pthread #For example

# Directories and targets
SRCDIR   := src
BUILDDIR := build
TARGET   := bin/myprog

# List of files
SRCEXT   := c
SOURCES  := $(shell find $(SRCDIR) -type f -name *.$(SRCEXT))
OBJECTS  := $(patsubst $(SRCDIR)/%, $(BUILDDIR)/%,$(SOURCES:.$(SRCEXT)=.o))
DEPS     := $(OBJECTS:%.o=%.d)

# Colors
GREEN  = \e[0;32m
YELLOW = \e[1;33m
RED    = \e[0;31m
NC     = \e[0m

.SECONDEXPANSION:
.PHONY: clean

all : $(TARGET)

$(TARGET) : $(OBJECTS)
	@echo -e "$(GREEN) Linking... $(NC)"
	$(CC) $(LIB) $^ -o $@

$(BUILDDIR)/%.o : $(SRCDIR)/%.c
	@echo -e "$(GREEN) Building $@... $(NC)"
	@mkdir -p $$(dirname $@)
	$(CC) $(CFLAGS) $(INC) -c -o $@ -MMD -MP -MF ${@:.o=.d} $<

clean:
	@echo -e "$(GREEN) Cleaning... $(NC)";
	$(RM) -r $(BUILDDIR) $(TARGET)

-include $(DEPS)
```
As long as your project is of the given simple structure, this will just
automatically work!

Limitations
===========
You might want to know why everyone doesn't do this. Just glossing through some
reasons quickly:

1. Sometimes it doesn't make sense to have a one-to-one relationship with source files and object files.
2. This will not yield a *fast* makefile. Now, if it's speed you need, consider investigating one of the alternative build systems, like [ninja](https://ninja-build.org/). This
   is more directed at smaller projects.
3. No support for the portability power that is provided by something like
   [cmake](https://cmake.org/) or [autotools](https://www.gnu.org/software/automake/manual/html_node/Autotools-Introduction.html).

What this file really does is give you a simple solution to build systems in C,
which is easily human editable if need be. Also, hopefully you've learned a few
things about how to write makefiles, and organize your C / C++ projects.
