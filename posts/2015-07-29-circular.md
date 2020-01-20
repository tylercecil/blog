---
title: Circular Programming
abstract: Or "How I Learned to Stop Worrying and Love Lazy Evaluation"
---
Remember how you felt the first time you saw a recursive function? Today I was
reminded... My mentor at LANL (a true functional guru) wrote a bit of code using
what he called "circular programming." He, of course, figured it was no big
deal, but it was more than my feeble little mind could take.  Based on
[this](http://stackoverflow.com/questions/29226483/circular-programming-replace-list-elements-by-minimum-value)
Stack Overflow post, I made this little run-through on what's going on, in order
to test my own understanding.

The Problem
===========
Let's say I want to replace every element of a list with the minimum element of
that list. The naive approach is to pass the list twice: once to find the minimum
element, and another to replace every value with it. (Obviously there are better
ways to do this, but bear with me... I want to start with an easy example).

How might we go about this with a single pass? If we were in C, the answer
would be fairly simple (provided our list was an array of pointers to our
elements): replace every pointer with a pointer to a common element, and store
the minimum element in this common placeholder. I will show you a way in
Haskell, using a very clever (and possibly existentially terrifying) trick
called [Circular Programming](https://wiki.haskell.org/Circular_programming).
Despite what some parts of the Internet will have you think, this has almost nothing to
do with Arrows, so don't worry. However it is conceptually identical to
[continuation passing style](https://en.wikipedia.org/wiki/Continuation-passing_style).

Two Functions, One Magic Trick
==============================
We start off with the magic... Try reading through this function.

### `trace`
```haskell
trace :: (a -> c -> (b, c)) -> a -> b
trace f a = b
  where (b, c) = f a c
```
Do you feel uneasy? Let's take a look at this where clause... `where (b, c) =
f a c`. So we are saying that `b` and `c` are return values of `f` when `f` is
applied to `a` and `c`. `c` is both a return value and a parameter of the
function `f`! At first glance this might seem like a time travel paradox!

We'll get back to this, but the hint for why this is possible is lazy
evaluation. Don't feel bad if this doesn't make sense yet --- we're going
to keep exploring

### `repminList'`
```haskell
repminList' :: (Ord a) => [a] -> a -> ([a], a)
repminList' [x] m = ([m], x)
repminList' (x:xs) m = let (replaced, m') = repminList' xs m
                       in (m : replaced, min x m')
```
Next we have `repminList'`, which is actually doing the work. This function
should be fairly understandable. The function gets a list `xs` and an element
`m`, and returns a tuple. The first element is the list `xs` with every element
replaced with `m`. The second element is the minimum element of `xs`.

Running in `ghci`:
```
 *Main> repminList' [1..10] 0
 ([0,0,0,0,0,0,0,0,0,0], 1)
```
See, I'm not lying!

### `repminList`
```haskell
repminList :: (Ord a) => [a] -> [a]
repminList = trace repminList'
```

Finally `repminList` performs our task for us, by using our magical function
`trace` and applying it to `repminList'`. Again, running in `ghci` we find:
```
*Main> repminList [1..10]
 [1,1,1,1,1,1,1,1,1,1]

```

Ok. Think things over a bit, and see if you can understand how the system
as a whole is working. Remember: the secret is lazy evaluation.

Call-by-Need
============
Some people seem to think of lazy evaluation as "Oh, the user needs the
return value! Go run the function!" But what does it mean to "run a function" in
Haskell? In lambda calculus we do not "run" lambda abstractions --- we take
applications, and apply \\(\\beta\\)-reductions.
\\[
(\lambda x . T) \:\: y \to T[x := y]
\\]
Of course, one can use a number of different reduction strategies in lambda
calculus (e.g. full reduction, normal order, call-by-value, ...); Haskell uses
what's known as
[call-by-need](http://homepages.inf.ed.ac.uk/wadler/papers/need-journal/need-journal.ps). In
this evaluation strategy, an idea of aliasing is employed. So for any lambda term
\\(T\\), applications such as
\\[
(\lambda x . x \: x) \:\: T \to T_1 \: T_2
\\]
result in \\(T_1\\) and \\(T_2\\) "referring" to the same value. So if at any
reduction step \\(T_1 \to T'\\), then \\(T_2 \to T'\\) occurs at the same step.
Call-by-need (or lazy-execution) is essentially creating a graph of how all
names depend on each other. Typically, we call the vertices of this graph
[thunks](https://wiki.haskell.org/Thunk). In Haskell each thunk knows its type,
what data constructor created it, and the thunks of its
components. Conceptually, Haskell definitions are creating an *abstract syntax
graph* (as opposed to a tree); computations are traversals and reductions of
this graph. (*Note that I necessarily don't mean this literally; I am no ghc
expert, and could not tell you exactly what's going on in the inner workings of
Haskell. I simply mean conceptually.*)

### An Example

Let's say we have `xs = [1, 2, 3]`. The *ASG* will look something like this:

<img src="/images/posts/circ/list_thunk.svg" width="100%">

So when we ask for the first element of a list `xs` in Haskell, this is
what really happens:

1. Inspect the `xs` thunk, and see what data constructor made it.
2. Hopefully `xs` was constructed with the `(:)` constructor. The only other
   list constructor is `[]`, which contains references to no other thunks.
3. The `(:)` refers to two other thunks: the `head` and the `tail`.
4. We can then return a reference to the head thunk.

So in order to calculate `head xs`, we only needed to "evaluate" two nodes: the
list constructor, and its head. Consider if `xs =
[1, undefined, undefined]`. `head xs` in this case would return the same result,
even though there are undefined thunks in our *ASG*.  In Haskell we can define
even more bizarre structures. For instance, a typical representation of a term
with type [\\(\bot\\)](https://wiki.haskell.org/Bottom) is `let bot = bot`.

<img src="/images/posts/circ/bot.svg" width="25%" style="margin-left:37.5%;">

If we ever want to evaluate `bot`, first `bot` must be evaluated. Therefore, if
we were to ask for this value, our code will hang. Lazy execution is what lets
us do dirty things like this. In general, whenever we have a cycle like this, we
have the *potential* for our code to hang.

For some deeper look into lazy-evaluation, I suggest looking at
[this post](https://hackhands.com/lazy-evaluation-works-haskell/) or
[the haskell wiki](https://wiki.haskell.org/Haskell/Lazy_evaluation).

Another Look at `trace`
=======================
Now that we have stronger background knowledge of Call-by-need, let's go back to
`trace`, the function which we have come to fear.  Specifically `(b, c) = f a
c`; this will test our understanding of lazy evaluation. Let's re-write this
function using better names than found in that Stack Overflow post, to try and
appeal to intuition a bit more.
```haskell
trace f init_thunk = ans_thunk
  where (ans_thunk, feedback_thunk) = f init_thunk feedback_thunk
```

We need to understand`(b, c) = f a c` is only asserting that the name `c` is
bound in the above way. Specifically "`f`'s second returned value will be
the same *thunk* as `f`'s second parameter." By inspecting  `repminList [1..10]`,
`trace` demands a value for `b`. In this case, `b = [c,c,c,c,c,c,c,c,c,c]`,
where `c` is just that --- whatever the value of `c` turns out to be. `c` itself
has yet to be needed, and therefore yet to be evaluated. So `b` depends on the
value of `c`, but not vice-versa, allowing our code not to hang. In the
process of finding the value for `b`, `repminList'` has calculated the minimum
element of the list, and bound that value back into `c`.

And that's that! We walk through the list, making a new list with a common
placeholder value (just like the C solution)! This all works because of the
laziness. This technique allows a whole host of computations that would normally
require multiple passes over a data-structure to be done in a single pass!

I strongly suggest playing with these functions to get a feel for what's going
on.

Corecursion
===========
We are correct in thinking *circular programming* is actually related to
recursion: it is, in fact, the *dual to recursion*!
[Richard Bird](http://link.springer.com/article/10.1007/BF00264249) and
[Lloyd Allison](http://www.csse.monash.edu.au/~lloyd/tildeFP/1989SPE/) were
responsible for some of the early development of the technique "circular
programming", which would later be generalized into something known as
[corecursion](https://en.wikipedia.org/wiki/Corecursion). In recursion we take a
big problem and break it down to it's base cases. The idea behind corecusion is
to start with the base cases, and build your data up. Corecursive algorithms
produce small chunks of data, and then use them to make more complex (possibly
infinite) data structures.

For a simple and cute example, let's consider generating a stream of the
Fibonacci numbers.
```haskell
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)
```
Instead of defining a function in terms of itself, we have defined data in
terms of itself! It's a pretty neat and useful idea. For more examples, I
suggest reading the Wikipedia post for corecursion --- it gives as good of a
treatment on the subject as I could.

Parting Notes
=============
That was a brief introduction to circular programming, lazy evaluation, and in
general how to define data in terms of itself (corecursion). Please let me know
what you think/are confused by! I wrote this not only to help my own
understanding, but hopefully to help others!
