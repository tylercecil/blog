---
title: Go C-Command Yourself!
subtitle: An Introduction to Binding
abstract: When do we use "himself/herself" instead of "him/her"? It's a more
  tricky story than you might think, and it all comes down to a simple (albeit
  unsual) relationship with trees.
update: 2020-08-31
note: "
  **Note**: 'Wait, why are you drawing trees this way?! That's all wrong!!' Yes,
  it is all wrong. Because of the introductory-nature of this post, I've chosen
  to use very over-simplified flat trees. If you know something about syntax, I
  hope you can ignore this, and if you're wanting to learn why I organized the
  trees I did... maybe don't!

  <br>

  **Update**: I've improved the Tree rendering with a new library I wrote,
  [ChomTree](https://github.com/tylercecil/chomTree)! Let me know if you notice
  any bugs!
  "
bibliography: binding.bib
header-includes: >
  <style>

  .i {
    color: green;
  }

  .i::after {
    font-size: 75%;
    bottom: -0.25em;
    position: relative;
    content: "i";
  }

  .j {
    color: blue;
  }

  .j::after {
    font-size: 75%;
    bottom: -0.25em;
    position: relative;
    content: "j";
  }

  .ij {
    color: orange;
  }

  .ij::after {
    font-size: 75%;
    bottom: -0.25em;
    position: relative;
    content: "i/j";
  }

  .bad::before {
    color: red;
    content: "*";
  }

  .bad {
    text-decoration: underline;
    text-decoration-color: red;
  }

  .tree .node rect {
    opacity: 0;
  }

  .tree .node.selected rect.pBox {
    fill: red;
    opacity: 0.25;
  }

  .tree .node.commanded rect.pBox {
    fill: green;
    opacity: 0.25;
  }

  .tree .node.hover rect.pBox {
    fill: gray;
    opacity: 0.25;
  }

  .tree .links {
    stroke: black;
    opacity:1;
  }

  </style>
---

I have a puzzle for you: **when would use him/her/them vs
himself/herself/themselves? Can you ever swap one out for the other?**

> Got an answer in your head? Cool!

In this post, I hope to break whatever answer you came up with, and replace it
with a surprising yet simple answer! You'll laugh. You'll cry. And maybe...
just maybe, you'll learn yourself something.

Definitions
===========

First, let's define some terms. For our purposes there are three types of noun
phrases:

R-Expression
: Referse to something specific or concrete.[^ref]\
    *i.e.* "The cat", "Tom", "My hopes and dreams"

Pronoun
: May (or may not) refere to another NP in the sentence (or discourse).\
    *i.e.* he/him, she/her, they/them

Anaphor[^ana]
: *Must* refere to another NP in the sentence.\
    *i.e.* himself, herself, themselves

Here's an example to make that a bit more concrete. We'll use an index to mark
what each NP could be referring to.

(@jer-1) [Jeremy]{.i} fooled [himself]{.i} into thinking [he]{.ij} could love
  another man.

NP        Type         Index
--------- ------------ -----------
"Jeremy"  R-Expression $i$
"himself" Anaphor      $i$
"he"      Pronoun      $i$ or $j$

Note how "he" could refer to Jeremy (likely how you read it without context),
*or* it could refer to some other man, like Kyle!

(@) [Jeremy]{.i} fooled [himself]{.i} into thinking [Kyle]{.j} could love
  another man.

It's that flexibility that makes "he" a pronoun, and the lack of flexibility
"himself" an anaphor.

[^ref]: [Well, kinda](/posts/2020-02-13-reference.html)... but that's not the
  point right now!
[^ana]: I've used the word anaphor in my post on [Winograd
  schema](/posts/2020-03-10-b-winograd.html). I have to admit, I think I may
  have been using it incorrectly / confusingly. Consider this an updated
  definition.
[^dist]: "Governs the distribution" might sound a bit technical, but it's
  nothing special. The "distribution" of a class of words defines,
  syntactically, where they occur. For example, "adjectives are placed before
  nouns".

The Puzzle
==========

So, let me phrase our riddle a bit more exactly: **what syntactic rule governs
the distribution[^dist] of pronouns and anaphora?**

Indexing
--------

First thing I want to point out that *the index matters!* While a pronoun *can*
refer to multiple things, when actually used there is an intended meaning. For
example...

(@r-good) [Roberto]{.i} taught [himself]{.i} to fly.\
  [Roberto]{.i} taught [him]{.j} to fly.

Using "him" to refer to some $j \not= i$ works just fine. However, if "him"
means "Roberto", things don't work!

(@r-bad) [[Roberto]{.i} taught [himself]{.j} to fly.]{.bad}\
  [[Roberto]{.i} taught [him]{.i} to fly.]{.bad}

Word for word the sentences in (@r-bad) are the exact same sentences as
(@r-good). But these sentences syntactically cannot match with the semantics
being expressed. If Roberto has taught himself to fly, "Roberto taught him to
fly" just doesn't communicate the right idea!

It's also worth pointing out that duplicating the R-Expression is also
unnatural:

(@) [[Roberto]{.i} taught [Roberto]{.i} to fly.]{.bad}\
  [Roberto]{.i} taught [Roberto]{.j} to fly. (Two men named "Roberto")

So, whatever rule we come up with, it's going to have to keep the indices in
mind!

Word Order
---------

Ok, maybe you came up with a rule like this:

> "If a noun follows another noun, and they share indices, an anaphor must be
> used."

(@) [He]{.i} taught [Robert]{.j} to fly.\
  [[He]{.i} taught [Robert]{.i} to fly.]{.bad}\
  [He]{.i} taught [himself]{.i} to fly.

Seems reasonable, but it's a little too simple. Remember (@jer-1)? This was a
totally valid reading:

(@) [Jeremy]{.i} fooled [himself]{.i} into thinking [he]{.i} could love
  another man.

[He]{.i} followed [himself]{.i} here, yet ["Jeremy fooled himself into thinking
himself could love another man"]{.bad} certainly didn't work.[^case]

> "Ok... if the last noun was an R-Expression with the same index..."

(@heidi) [[[[Heidi]]{.i}'s mother]]{.j} bopped [herself]{.j} on the head with a
  zucchini.\
  [[[[[Heidi]]{.i}'s mother]]{.j} bopped [herself]{.i} on the head with a
  zucchini.]{.bad}\
  [[[[Heidi]]{.i}'s mother]]{.j} bopped [her]{.i} on the head with a
  zucchini.\
  [[[[[Heidi]]{.i}'s mother]]{.j} bopped [her]{.j} on the head with a
  zucchini.]{.bad} [@carnie2013 Chapter 5]

Not bad, but what about this:

(@order) [[The mother of [[Heidi]]{.i}]]{.j} bopped [herslef]{.j} on the head
  with a zucchini.

In (@order), Heidi was the most recent R-Expression! Whatever rule we come up
with, we're going to need a bit more structure...

[^case]: You might have noticed that "himself" doesn't work well here, because
  it is the **nominative case**. That is, we have "he" and "him" in English,
  but not "heself" and "himself". Therefore, you would certainly be right if
  you noted "an anaphor may never be nominative".

Subject-Object Relationship
---------------------------

You might know anaphora as "reflexive-pronouns", so maybe you gave a rule like

> "If the object of a verb shares an index with the subject, an anaphor must
> be used. Otherwise, it can never be used."

This is a pretty good rule, but unfortunately it *under generates* (meaning
anaphora get used in more places than this rule would suggest). Consider:

(@) [She]{.i} told me all about [herself]{.i}.

"About herself" is a prepositional phrase, not exactly an object! We're close
though... One thing that seems to be true --- if an anaphor *can* be used, it
*must* be used.

Alright, enough playing around, let's take a more structured look at things!

C-Command
=========

Our solution is going to be rooted in the tree structure of our sentences.
Often with trees we use relationships like "parent", "child", "sibling",
"cousin", etc... The relationship we need here is just a tad richer ---
*c-command*.

C-Command
: *(Informal)* Node A c-commands its siblings and all of their decendents.\
  *(Formal)* Node A c-commands node B if every node branching dominating A also
  dominates B, and neither A nor B dominates the other.

To get a feel for this relationship, here is a very simple syntax tree[^xbar].
Click on any node, and it will show which nodes that node c-commands!

<div class="tree">
  [TP
    [NP [D The] [AdjP.Adj big] [Adj fat] [N man]]
    [VP [AdvP.Adv quickly] [V eats]
      [NP [AdjP.Adj tasty] [N cake.]]]]
</div>

In the formal definition I have to note that we calculate siblings from the
first "branching" ancestor. For example, in the above sentence you might notice
that "The" c-commands all nodes in the NP, even though it technically has no
siblings. It's like we skip-over D, and go strait to the NP root.

Now that we understand the c-command relationship, we should be able to come up
with a solution to our puzzle!

[^xbar]: Why did I draw this tree as I did? In fact, these are very
  over-simplified, and would universally be considered wrong. There's a rich
  conversation about what the structure of these trees should be. What I've
  drawn here is something you might see in an intro to linguistics course
  (specifically with flat trees, rather than binary trees). For more information
  maybe read up on the (now outmoded) [X-bar
  theory](https://en.wikipedia.org/wiki/X-bar_theory) --- that's a good place to
  start.

Binding Principals
==================

Let's look at the tree for (@heidi).

<div class="tree">
  [TP
    [NP [DP [N Heidi] [Gen 's]] [N mother]]
    [VP [V bopped]
      [NP.N herself]
      [PP [P on] [NP [D the] [N head]]]
      [PP [P with] [NP [D a] [N zucchini]]]]]
</div>

Now, we have a few notes we can make here:

- The NP "Heidi's mother" c-commands the entire VP.
- The N "Heidi" doesn't c-command the VP.
- "Herself" doesn't c-command the subject phrase.

We can use this information to come up with a pretty good set of rules! First,
to make our definitions a bit more clear, we should define the term "syntactic
binding".

Binding
: A binds B if A c-commands B, and A and B share the same index.\
  We say A is the **binder** and B is the **bindee**.\
  If A is unbound, we call it **free**.

Now, *finally*, let's look at our rules!

The Binding Principals
: **Anaphor:** An Anaphor must be bound.\
  **Pronoun:** A pronoun must be free.\
  **R-Expression:** An R-Expression must be free.

Look back at our examples thus far, and see if they work out!

Binding Domain
--------------

These binding principals describe things fairly well, solving the problems
we've seen thus far, but it needs one little revision! Let's look back at our
first example

(@jer-2) [Jeremy]{.i} fooled [himself]{.i} into thinking [he]{.ij} could love
  another man.

"Jeremy" is certainly free. "Himself" bound. But what about "he"? It looks like
"he" could be bound, or not, yet "he" seems to be ok in both cases! To address
this, we add one last idea --- a binding domain. Because "he could love another
man" is its own clause, we say "Jeremy" is outside the binding domain of "he".

It's as if, when choosing between "he" or "himself", we only look at the tree
for that clause:

<div class="tree">
  [TP
    [NP.N he] [T could] [VP [V love] [NP [D another] [N man]]]]
</div>

In this *subtree*, "he" is free, even though it is *bound* outside of this
clause.

At the same time, R-Expressions don't seem to have this binding domain!

(@jer-b) [[Jeremy]{.i} fooled [himself]{.i} into thinking [Jeremy]{.i} could
  love another man.]{.bad}

With all of this, we can revise our answer, and come up with a final rule.

The Binding Principals (Revised)
: **Anaphor:** An Anaphor must be bound in its binding domain.\
  **Pronoun:** A pronoun must be free in its binding domain.\
  **R-Expression:** An R-Expression must be globaly free.

**That, my friends, is our answer!**

Does this Cover Everything?
---------------------------

You may have found some examples which don't seem to fit our definition. For
example, sentences such as "she read the letter *herself"*. It turns out this
isn't as much of a problem, as this usage of "herself" is, in fact, acting as
an adverb / focus particle, and not actually a noun phrase. In some languages,
this focus particle would actually be a different word ("sie hat es selbst
gelessen" and not ["sie hat es sich gelessen"]{.bad}).

There are also some problems with our idea of binding domain, which muddies the
waters a bit --- clarifying it, however, would require some background in
[movement](https://en.wikipedia.org/wiki/Syntactic_movement), which I don't
want to get into.

Conclusions
===========

Early in my introduction to linguistics I learned about the *c-command*
relationship, only being told it was "very important" (which I didn't find to
be particularly helpful). Binding, however, was when I realized it really was
important!

Binding is a very well developed theory, and in fact [Government and Binding
Theory](https://en.wikipedia.org/wiki/Government_and_binding_theory) was an
early form of [The Minmalist
Program](https://en.wikipedia.org/wiki/Minimalist_program) (the current
dominant theoretical program in Transformational Grammar). For an introduction
to how binding operates in these frameworks, I'd recomend @chomsky1980 (but be
warned, this paper is very technical). @higginbotham1980 gives a similar (and
a bit more accessible) introduction to the idea, which only focuses on the uses
we touched on here. While Higginbotham uses complex theories of movement, I
think the paper is at least skimable to the beginner.

For a lighter introduction, I learned about binding from my first syntax book,
@carnie2013 [chaps. 5, 17]. For someone new to linguistics (which... if you
just read this post, that's probably you) I would strongly recommend that book.

Thanks for reading! Let me know if something didn't makes sense! I'd be
curious how these rules fit within your own languages!

References
==========
:::{#refs}
:::

<script src="/js/c-com/chomTree_dist.js"></script>
<script src="/js/c-com/c-com.js"></script>
