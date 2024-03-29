---
title: Natural Deduction
subtitle: Notation for the Uninitiated
abstract: A beginners introduction into how the hell you read those proof trees
  that all the scary logicians keep using. Filled with lots of exercises to
  keep you busy!
update: 04-27-2020
note: "**Updated:** I've done a lot of work to simplify and clarify this post!
  If it stopped you in your tracks before, try again, and see if I've cleared
  some examples up!</br>

  **Note:** When you see math with a grey box around it, like \"$\\texttip{
  \\bbox[3px, border:1px dotted grey] {\\Gamma}} {Example}$\", that means I've
  added hover-over text.  I've been experimenting with how to make technical
  writing more accessible --- I'd be curious if you find this hover-over text
  useful!</br>

  **Note:** I hope everyone is doing well during the COVID crisis. Here's
  something to keep your minds busy and entertained while we all wait out the
  storm. Please be safe everyone!</br>"
header-includes: |
  <script>
  function toggleDisplay(id) {
    var e = document.getElementById(id);
    if (e.style.display === "" || e.style.display === "none") {
      e.style.display = "block";
    } else if (e.style.display === "block") {
      e.style.display = "none";
    }
  }
  </script>
  <style>
    .ans {
      display: none;
      border: 1px solid #bbb;
      border-radius: 4px;
      padding: 1rem 1.5rem;
      margin-bottom: 2.5rem;
    }
    .ans .math.display{
      font-size: 70%;
    }
    #rules {
      font-size: 80%;
    }
    #rules mjx-container {
      margin: 0;
    }
    .example mjx-container {
      margin: 0;
    }
    .example button {
      text-align: center;
      width: 100%;
    }
    .math.display > mjx-container {
      overflow-x: scroll;
      overflow-y: hidden;
    }
  </style>
---
:::comment
$$
  \newcommand{\tip}[2]{\texttip{\bbox[3px, border:1px dotted grey]{#1}}{#2}}
  \newcommand{\h}[2]{\begin{array}[b]{c}\dfrac{}{#1}\scriptsize{#2}\end{array}}
  \newcommand{\hypo}[3]{\begin{array}[b]{c}
    \h{#1}{#2} \\ \vdots \\ #3
  \end{array}}

  \newcommand{\ul}[2]{{\color{#2} \underbrace{\color{black} #1}}}
  \newcommand{\ol}[2]{{\color{#2} \overbrace{\color{black}  #1}}}
  \newcommand{\mhl}[2]{\fcolorbox{#1}{white}{$#2$}}
$$
:::

Mathematical logic, despite being a bit obscure, gets used by a lot of other
fields. A computer scientist, linguist, and philosopher could conceivably be
reading something, and suddenly greeted by a mash of symbols like so

$$
\dfrac { \dfrac{ \dfrac{ \dfrac{}{A}u \quad \dfrac{}{B}w }
                       {A \wedge B} \wedge_I }
               {B \to A \wedge B} \to_{I^w}}
       { A \to B \to A \wedge B } \to_{I^u}
$$

The thing is, that same computer scientist, linguist, or philosopher could have
just as likely never taken a course on formal logic before, and might have just
audibly groaned out *"oooh nooo".* They might not even know how to Google what
the hell they're looking at right now.

> Well I'll tell you what you're looking at --- that's called a **natural
> deduction proof**, and it's nothing you need to be afraid of.

This post is for anyone in one of these logic-adjacent fields (or anyone bored
in COVID-Quarantine™) who might be new to this notation. We'll cover:

<div class="multicol">
<div>
1. [What natural deduction is for](#motivation)
2. [How to read it](#reading-natural-deduction)
</div>
<div>
3. [How to work with it](#writing-simple-proofs)
4. [The relation to lambda-calculus](#lambda-calculus) (for those who might
    care).
</div>
</div>

As always, skip over what you know, jump to what's new, skim liberally --- and
this time I've included some exercises to play around with! **Now let's get to
it!**

Motivation
==========

It's probably important to understand *why* natural deduction was invented, or
we'd just be talking about some random symbols with no context. Natural
deduction is a particular notation used in a field known as **proof theory**.

Proof Theory
: At a high level, proof theory is the mathematical study of *how we come to
  conclusions.* \
  **For example:** what would cause one to conclude *"the pope is catholic and
  water is wet"?* Well, first you would need to conclude both *"the pope is
  catholic"* **and** *"water is wet"*. It sounds obvious, but the goal here is
  to break down the obvious to give us incite into the not-so-obvious.

So where does natural deduction fit into proof theory? Because proof theory is
the *mathematical* study of conclusion-making, it is highly structured. Natural
deduction is one of those structures, known as a **formal proof system** or a
**proof calculus**.

Proof Calculus
: A proof calculus is a set of rules that describe how one can go from a set
  of assumptions (called **axioms**) to some conclusion.\
  It is called "formal" because these rules are syntactic --- that is, they
  only tell us how to move symbols around. We should be able to "mindlessly"
  read a formal proof, without making jumps of conclusions on our own.

Natural deduction, developed by the German mathematician Gerhard Gentzen in
1934, is what some might call "kinda a big deal". It[^sequent] rendered
older proof calculi[^hilbert] totally obsolete and has really been the gold
standard ever since.

Gentzen style systems can also be called **structural/analytic proofs**.
Normally in math, you write a proof *about* some mathematical object. In a
*structural proof*, the proof itself *is* a mathematical object. What the heck
does that mean? We can ask questions like *"is proof 1 equal to proof 2?"* or
*"can proof 1 combine with proof 2?"* Now we can **study the proofs
themselves.**

It is this structural property that makes Gentzen systems useful for computer
scientists, linguists, and philosophers.  For today, though, all we really need
to know is **natural deduction is a formal system for studying how we come to
conclusions.**

[^sequent]: I'm actually lying to you right now --- natural deduction has a
  brother called **the sequent calculus** which is *really* the gold standard.
  It's relatively similar, though, so no worries. At the end of this post I'll
  link to some resources on the sequent calculus.

[^hilbert]: What were these older proof calculi, and what was bad about them?
  They are usually referred to as *"Hilbert Systems",* and probably the most
  famous such system was the one in *Principia Mathematica*. The main
  difference between a Gentzen system and a Hilbert system was that a Hilbert
  system preferred to used *axioms* instead of *inference rules* (don't worry
  if you don't understand that --- you should probably just learn natural
  deduction first). That made them a bit difficult to deal with, which is why
  it took [Principia 379 pages to get to "1 + 1 =
  2".](https://quod.lib.umich.edu/cgi/t/text/pageviewer-idx?c=umhistmath&cc=umhistmath&idno=aat3201.0001.001&frm=frameset&view=image&seq=401)

Reading Natural Deduction
=========================

To read a natural deduction proof, we ultimately only need to know two things:
what is a judgment, and what is an inference.

Judgment and Inference
----------------------

Judgment
: A Judgment is anything that is *knowable*. A judgment $\Gamma$ might be
  formal, such as *"$A$ is true"*, or informal, such as *"Matha is in love"*.

That is meant to be as vague as possible. You may want to judge the type of a
program, the veracity of a mathematical statement, or the meaning of a sentence
in Navajo.

The Inference Line
: Let $\Gamma$ and $\Delta$ be judgements. We read $\cfrac{\Gamma}{\Delta}$ as
  *"$\Delta$ can be inferred from $\Gamma$".* $\Gamma$ is referred to as the
  **premise**, $\Delta$ as the **conclusion**, and the line as the **inference
  line**. There might be zero or more premises, and always one conclusion.

Now reading these trees becomes pretty easy! Remember, we are trying to capture
the essence of what it means to draw a conclusion.

<div class="example">
+------------------------------------+----------------------------------------+
|    Proof Tree                      |    English Interpretation              |
+====================================+========================================+
| $$ \cfrac{ \;A \quad B\; }         | **Premise:** $A$ is known and $B$ is   |
|          { A \tip{\wedge}{"and"} B}| known.\                                |
| $$                                 | **Conclusion:** $A \wedge B$ can be    |
|                                    | concluded.                             |
+------------------------------------+----------------------------------------+

This is exactly our example from before! Let $A$ be *"the pope is Catholic"*
and $B$ be *"water is wet"*. Because you know $A$ and $B$, you *could conclude*
the sentence *"the pope is Catholic and water is wet"*.
</div>

Once we can read that example, you might see how we might stack these little
proofs, to follow a longer "though process".

<div class="example">
+------------------------------------+----------------------------------------+
|    Proof Tree                      |    English Interpretation              |
+====================================+========================================+
|$$ \dfrac{\cfrac{ \;A \quad B\; }   | I know $A$ and $B$, and therefor could |
|                { A \wedge B }      | conclude $A \wedge B$. Now I know      |
|          \quad C}                  | $A \wedge B$, but I also know $C$.     |
|         {A \wedge B \wedge C}      | Finally I can conclude $A \wedge B     |
|$$                                  | \wedge C$.                             |
+------------------------------------+----------------------------------------+

</div>

Introduction and Elimination
----------------------------

OK, now that we can read the "flow" of a natural deduction proof, we need to
ask ourselves **"what conclusions are legal?"** This isn't 'Nam, there are
rules!

We will call those rules our **introduction and elimination rules**. The
example we've been playing with so far revolves around the word *"and"* (which
I'm going to refer to as *conjunction*). To explain what introduction and
elimination rules are, why don't we take a look at the rules for conjunction!

: The introduction and elimination rules for *conjunction.* The symbol to the
  right of each inference line is the name of the rule being defined.

+---------------------+-------------------------------------------------------+
| $\cfrac{A \quad B}  | **Introduction Rule**\                                |
|        {A \wedge B} | If I know $A$ and $B$, I may conclude $A \wedge B$.   |
| \wedge_I$           |                                                       |
+---------------------+-------------------------------------------------------+
| $\cfrac{A \wedge B} | **Elimination Rule 1**\                               |
|        {A}          | If I know $A \wedge B$, I may conclude $A$.           |
| \wedge_{E1}$        |                                                       |
+---------------------+-------------------------------------------------------+
| $\cfrac{A \wedge B} | **Elimination Rule 2**\                               |
|        {B}          | If I know $A \wedge B$, I may conclude $B$.           |
| \wedge_{E2}$        |                                                       |
+---------------------+-------------------------------------------------------+

**These three rules together define how conjunction works**. In fact, every
word/symbol/operator in our system will be defined by a set of rules. The
introduction rules defined **when we can add the word "and" into a
conclusion** (namely when we know two things). The elimination rules defined
**what simpler conclusions we can draw from a sentence with conjunction**.

Some might find those elimination rules confusing, so let me give a very short
English explanation.

:::example
**Elimination Rule Explanation**

Let's say I told you *"the pope is Catholic, and water is wet"*. What could you
conclude from that (other than I am clearly a conversational master)?

The answer is very little! You could, however, conclude "the pope is Catholic".
By doing that, we've "eliminated" the "and" part of the sentence, and are left
with a simpler idea!
:::

Alright, now it's your turn!

:::example

**Question:** What are the *Introduction Rules* for disjunction?[^dis] *(Hint:
there should be two).*

<button onclick="toggleDisplay('ans-1')">Show/Hide Answer</button>
:::::{.ans #ans-1}
---------------------------------------------  --------------------------------
$\cfrac{A}{A \tip{\vee}{and/or} B}\vee_{I1}$   **Introduction Rule 1**
$\cfrac{B}{A \vee B}\vee_{I2}$                 **Introduction Rule 2**
-------------------------------------------------------------------------------

That is, simply knowing either $A$ or $B$ is sufficient for knowing $A \vee B$.

For example, how could you come to the conclusion *"the pope is Catholic *or*
water is dry"?* Well just knowing "the pope is Catholic" is enough!
:::::
:::

[^dis]: *Disjunction*, of course, means "logical or". In English, reading $A
  \vee B$ would read as "$A$ and/or $B$".

Now what about the *Elimination Rule* for $\vee$? Can you come up with an
English explanation of the rule? To write the rule down formally, we need one
last bit of notation.

Hypotheticals
-------------

What's missing is we have no way of working with "hypothetical situations".
Something like *"if $A$ were true (and I'm not saying it is), $B$ would
follow".*

Hypothetical
: A hypothetical premise $\Gamma$ is written as so:
  $$ \cfrac{}{\Gamma} x$$
  Where $x$ is a number unique for this hypothetical situation.

Now we can write down an Elimination Rule for disjunction![^super]

[^super]: Did you notice we called the rule $\vee_{E^{1,2}}$? The "1,2" is
  there to note that "this rule used hypothetical situations 1 and 2". That way
  we can keep track of what each hypothetical situation is doing.

$$
  \cfrac{A\vee B\quad\hypo{A}{1}{C}\quad\hypo{B}{2}{C}}{C}\vee_{E^{1,2}}
$$

Here's that rule broken down into plain English.

+--------------------------------------------------+------------------+
|        I know                                    |   I conclude     |
+==================================================+==================+
| 1. $A \vee B$                                    | $C$ must be true.|
| 2. Hypothetically speaking, $A$ leads me to $C$. |                  |
| 3. Hypothetically speaking, $B$ leads me to $C$. |                  |
+--------------------------------------------------+------------------+

And just to *really* make sure we're all on the same page, here's a concrete
example.

:::example
**Disjuction Elimination Example**

What conclusion could I draw, if I knew *"Simon is either the Pope, or he goes
to church every week"*? In this case, I don't know if either half of this
sentence alone is true.

But, I do know that, if he is the Pope, he's religious. I also know that, if
he goes to church every week, he's religious.

Combining all three of these facts, I can conclude *"Simon is religious"*. It
doesn't matter whether he's the pope *or* he goes to church --- the conclusion
is the same.
:::

Now your turn!

:::example

**Question:** What are the Introduction and Elimination Rules for
  *implication*?[^imp]\
  *(Hint: You should need only 1 of each)*\
  *(Hint: You might notice that hypotheticals are already a kind of
  implication)*

<button onclick="toggleDisplay('ans-2')">Show/Hide Answer</button>
:::::{.ans #ans-2}
------------------------------------------    ---------------------------------
$\cfrac{\hypo{A}{1}{B}}{A \to B}\to_{I^1}$    **Introduction Rule 1**
$\cfrac{A\to B \quad A}{B}\to_{E}$            **Elimination Rule 1**
-----------------------------------------------------------------------------

In plain English:

------------------ ------------------------------------------------------------
**Introduction:**  *having a proof from $A$ to $B$ can demonstrate $A \to B$.*

**Elimination:**   *knowing $A$ and $A \to B$ can lead to $B$.*
-------------------------------------------------------------------------------

:::::
:::

[^imp]: Implication, written as $A \to B$, means "*knowing $A$ leads to $B$".*

Writing Simple Proofs
=====================

I think $\wedge$, $\vee$, and $\to$ should be enough to test what we've
learned.[^bool] Let's work through some example proofs. **At each step, we can
only use one of the introduction and elimination rules we've defined**,
relisted here:

[^bool]: You might be asking me, "isn't this just Boolean Algebra, but hard?
  Can't I just write out a truth table to do this? We could actual define much
  more complicated rules for things like $\forall$ and $\exists$ (and even
  more!) that a truth table would never be able to deal with. For now, though,
  I just wanted to keep things simple.

:::{#rules}

Table: Introduction and elimination rules for conjunction, disjunction, and
  implication.

-----------------------------------------  --------------------------------------
$$\dfrac{A \quad B}{A \wedge B}\wedge_I$$  $$\dfrac{A \wedge B}{A}\wedge_{E1}$$

$$\dfrac{A}{A \vee B}\vee_{I1}$$           $$\dfrac{A \wedge B}{B}\wedge_{E2}$$

$$\dfrac{B}{A \vee B}\vee_{I2}$$           $$\dfrac{A \vee B
                                                    \quad \hypo{A}{x}{C}
                                                    \quad \hypo{B}{y}{C}}
                                                   {C}\vee_{E^{x,y}}$$

$$\dfrac{\hypo{A}{x}{B}}{A \to B}          $$\dfrac{A \quad A \to B}{B}\to_E$$
\to_{I^x}$$
-------------------------------------------------------------------------------

:::

Each proof will take some starting point $\Gamma$ to some conclusion $\Delta$.
I'll write $\Gamma \vdash \Delta$ to mean "use $\Gamma$ to prove $\Delta$".
[^turn] Because I know not everyone can grock long chains of abstract symboles,
I've added hoverover text to these examples, which will give you a concrete
example, explaining what you are looking at.

[^turn]: Wait, another way to say *"from $x$ we conclude $y$"*, you ask? Don't
  get too caught up in this right now. I'm only going to use this notation to
  ask the question "can you prove this?" for the moment.

:::example
**Example 1:** prove that $A \to B,\; A \wedge C \vdash B$:

$$
\dfrac{\tip{\dfrac{A \wedge C}{A} \wedge_{E1}}
           {I know "you are the pope and water is wet", and conclude "you are the pope"}
       \quad
       \tip{A \to B}{If you are the pope, you are Catholic}}
      {\tip{B}{Finally, I can conclude you are Catholic}} \to_E
$$

:::

Make sure that you can read that, and that every step is justified. For the
next example, let's look at something using a hypothetical judgment. Again,
I've added a little bit of annotation, if it helps.

:::example
**Example 2:** prove that $A \to B, \; B \to C \vdash A \to C$:

$$
\dfrac{ \dfrac{ \tip{\h{A}{1}}{If I were to assume you were the pope...}
                \quad
                \tip{A \to B}{I know "if you are the pope, you are catholic}
                }{
                 \tip{B}
                    {I conclude you would be catholic (assuming you were the pope).}
                }\to_E
                \quad
                \tip{B \to C}{I know "if you are catholic, you go to church".}}
              { \dfrac{
                  \tip{C}{I conclude you would go to chruch (assuming you were the pope)}
                  }{
                   \tip{A \to C}{That means "if you are the pope, you go to church"}
                  }\to_{I^1} }\to_E
$$

:::

Notice how the hypothetical $\overline{A}^1$ gets used by the $\to_{I^1}$.
Every hypothetical must be eventualy used by some rule --- otherwise we would
just assume our goal and call it a day! **A proof tree with an unaccounted-for
hypothetical is an unfinished proof!**[^imp-ent]

[^imp-ent]: Have you noticed how a hypothetical like $\overline{A}^1$ and an
  implication like $A \to B$ seem to capture almost the same idea? Just, a
  proof from $\overline{A}^1$ to $B$ is a *reason* why you would conclude $B$
  from $A$. $A \to B$ is the sentence "I have a reason to conclude $B$ from
  $A$."

Here are a few more exercises to try your hand at. When working through them,
don't be afraid to work backwards! You could write down the goal, and work your
way to the assumptions, or vice versa.

:::example

**Question 1:** Prove $A \wedge B,\; B \to C \vdash A \wedge C$

<button onclick="toggleDisplay('ans-5')">Show/Hide Answer</button>
:::::{.ans #ans-5}
$$
\dfrac{ \dfrac{A \wedge B}{A}\wedge_{E1}
        \quad\quad
        \dfrac{ \dfrac{A \wedge B}{B}\wedge_{E2} \quad B \to C}{C}\to_E}
      {A \wedge C} \wedge_I
$$
:::::

**Question 2:** Prove $A \to B,\; B \to C \vdash A \to (B \wedge C)$

<button onclick="toggleDisplay('ans-4')">Show/Hide Answer</button>
:::::{.ans #ans-4}
$$
\dfrac{
      \dfrac{\h{A}{1} \quad A \to B}
            {B}\to_E
      \quad\quad
      \dfrac{\dfrac{ \h{A}{1} \quad A \to B }
                   {B}\to_E
             \quad
             B \to C}
            {C}\to_E}
      {\dfrac{B \wedge C}{A \to (B \wedge C)}\to_{I^1}} \wedge_I
$$

Note that here, we used one hypothesis $\overline{A}^1$ twice; once to give use $B$,
and again to give us $C$. It is, of course, only one hypothesis, even though
it appears twice.
:::::


**Question 3:** Prove $(A \to B) \vee (A \to C) \vdash A \to (B \vee C)$

<button onclick="toggleDisplay('ans-3')">Show/Hide Answer</button>
:::::{.ans #ans-3}
$$
\dfrac{
(A \to B) \vee (A \to C)
\quad
\dfrac{\dfrac{\dfrac{\h{A \to B}{1} \h{A}{2}}{B} \to_E}
             {B \vee C} \vee_{I1}}
      {A \to (B \vee C)} \to_{I^2}
\quad
\dfrac{\dfrac{\dfrac{\h{A \to C}{3} \h{A}{4}}{C} \to_E}
             {B \vee C} \vee_{I2}}
      {A \to (B \vee C)} \to_{I^4}
}{A \to (B \vee C)}\vee_{E^{1,3}}
$$
:::::

:::

Lambda Calculus
===============

There are a glut of reasons why you might run into a natural deduction proof.
Philosophers and linguists alike have been interested in trying to break down
exactly how our reasoning processes seem to operate.  Computer science's tie to
logic is rather obvious --- often the semantics of programming languages are
described in terms of natural deduction inferences, for example. And ever since
Montague, Linguists have been using logic to model semantics, and the study of
syntax can be just as formal and logical.

In each of these cases, there's another formal tool, which is a bit more common
place --- the $\lambda$-calculus![^lam] And as it happens, **natural deduction
and the $\lambda$-calculus are more similar than meets the eyes!**

[^lam]: Don't know what $\lambda$-calculus is? Then this section isn't for you!
  Consider reading a good introduction on the subject like [this
  one!](http://www.cse.chalmers.se/research/group/logic/TypesSS05/Extra/geuvers.pdf)

There is this idea known as **the Curry-Howard correspondence**, which very
loosely says one can convert between a proof and a program (meaning a lambda
term, in this case). Here, I want to look at the most simple case of how this
works, using only simply typed $\lambda$-calculus.

Simply Type Proofs
------------------

In simply typed $\lambda$-calculus we write $x : A \to B$ to mean *"the element
$x$ is of type $A$ to $B$".* Well this "$\to$" is, in fact, the same "$\to$"
we've been looking at in natural deduction!

Let's take a pretty meaty example, and break it down together. It might take
you a bit with a pen and paper to get it all, but don't worry, you have all the
time in the world! I won't be giving a test.

Let's start with two pre-defined terms $M$ and $N$.

$$
\begin{align*}
  &M: ((A \to B) \to C) \to D\\
  &N: (A \to E) \to C\\
\end{align*}
$$

Using only those two terms, can you write a lambda expression of type $(B \to
E) \to D$?  Probably you can!  But let me change the question...

:::example
**Question:** Prove
<div style="font-size:80%;">
$$
((A \to B) \to C) \to D,\; (A \to E) \to C) \vdash (B \to E) \to D
$$
</div>
*(Just a warning, this one is pretty tedious. )*

<button onclick="toggleDisplay('ans-6')">Show/Hide Answer</button>
:::::{.ans #ans-6}

$$
\dfrac{((A \to B) \to C) \to D
       \quad\quad
       \dfrac{(A \to E) \to C
              \quad\quad
              \dfrac{{\h{B \to E}{x}}
                     \quad
                     \dfrac{{\h{A\to B}{y}} \quad {\h{A}{z}}}{B}\to_E}
                    {\dfrac{E}{A \to E}{ \to_{Iz}}}\to_E
              }
             {\dfrac{C}{(A \to B) \to C}{\to_{Iy}}}\to_E
      }
      {\dfrac{D}{(B \to E) \to D}{\to_{Ix}}}\to_E
$$

:::::

:::

I want to zoom into the upper-right part of this tree really quick (there's
nothing magical about it, I arbitrarily chose this sub-tree).

$$
\mhl{blue}{
\dfrac{\mhl{orange}{\dfrac{\h{B \to E}{x}
                    \quad
                    \mhl{red}{\dfrac{\h{A\to B}{y} \quad \h{A}{z}}{B}\to_E}}
                   {E}\to_E}}
      {A \to E} \to_{Iz}
}
$$

**I want to show how we can re-write this proof as a $\lambda$-term.** I'm
going to use the following rules:

1. Every judgment $\Gamma$ will be a term of type $\Gamma$.
2. Hypothetical judgments like $\overline{A}^x$ will be unbound variables of
   that type (i.e. $x:\;A$).
3. A tree using the $\to_E$ rule will be converted to a function application.
   (i.e. $\frac{A \to B \quad A}{B}$ would be $f x: \; B$)
4. A tree using the $\to_I$ rule will be converted to a function abstraction,
   using the hypothesis as its variable.

Here's what we end up with, with a little bit of color to make things clearer.

$$
\ol{\lambda z. \ul{x \ol{(y z)}{red}}{orange}}{blue} : A \to E
$$

> *You probably want to stare at that, and see how it lines up. Notice, for
> example, $z$ must be of type $A$, and corresponds to $\overline{A}^z$.*

**We've converted a proof from assumptions to conclusions into a program from
input to output.** Implication introduction is the same as creating a
function, and implication elimination is the same as function application!

:::example
**Question:** Can you convert the rest of this proof into a lambda term? For
our starting assumptions, use the $M$ and $N$ terms we started with.

<button onclick="toggleDisplay('ans-7')">Show/Hide Answer</button>
:::::{.ans #ans-7}
<div style="font-size: 120%;">
$$
\ul{\lambda x. M ( \ol{\lambda y. N( \ul{\lambda z. x(y z)}{blue})}{orange})}{red}: (B \to E) \to D
$$
</div>

Just for clarity, I've highlighted each lambda abstraction on the original
proof.

$$
\dfrac{((A \to B) \to C) \to D
       \quad\quad
       \dfrac{(A \to E) \to C
              \quad\quad
              \dfrac{{\color{red}\h{B \to E}{x}}
                     \quad
                     \dfrac{{\color{orange}\h{A\to B}{y}} \quad {\color{blue}\h{A}{z}}}{B}\to_E}
                    {\dfrac{E}{A \to E}{\color{blue} \to_{Iz}}}\to_E
              }
             {\dfrac{C}{(A \to B) \to C}{\color{orange}\to_{Iy}}}\to_E
      }
      {\dfrac{D}{(B \to E) \to D}{\color{red}\to_{Ix}}}\to_E
$$

For more practice, try converting the other exercises in this post! You'll need
to think a bit about how you might treat $\wedge$ and $\vee$, though...
:::::

:::

Now if you're thinking to yourself, "Tyler... it would have been *way* easier
to just write the lambda terms without any of this gobbledygook."

> Yes, that might be true! But it works the other way, too!

**You could write a lambda expression, and convert it back to a proof**. The
key takeaway here is **judgments are types, and proofs are programs!** I can
tell we all have a little smoke coming out of our ears right now, so why don't
I just leave it at that.

If you'd like to learn more about the Curry-Howard correspondence, drop a
comment! I'd be happy to flesh these ideas out more. In the meantime, though,
I can point you all to some further resources.

Further Reading
===============

I know this was a long post, but it was also very elementary. I just wanted to
set people up to be able to access and understand other introductory resources
on proof theory, natural deduction notation, and related things.

From here, I would *highly* recommend three resources

* [Frank Pfenning's "Basic Proof Theory" lectures from OPLSS
  2015](https://www.cs.uoregon.edu/research/summerschool/summer15/curriculum.html)
  A world-class introduction to proof theory.
* [Interactive Tutorial of the Sequent
  Calculus](http://logitext.mit.edu/tutorial)
  A very short but fun introduction to the Sequent Calculus --- the "big
  brother" of what we've been working on. It's an easy read, and (as the title
  says) is interactive!
* [Software Foundations](https://softwarefoundations.cis.upenn.edu/) for a
  deeper look into the Curry-Howard correspondence.  Everything you do in Coq
  revolves around this switching between natural deduction and lambda calculus.

**As always thanks for reading!** Leave a comment with any questions you might
have --- I'd love feedback to improve this post!
