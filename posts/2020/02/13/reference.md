---
title: What's In A Name?
subtitle: Problems with Reference
abstract: If two things are equal, they can always replace each other, no?
  Well, "the number of Godfather Movies" equals "3". My friend Alison only
  knows the first movie. Why is it that I might say *"Alison thinks the number
  of Godfather Movies is 1"*, but I wouldn't say *"Alison thinks 3 is 1"?*
note: |
  **News:** Comments exist now, powered by [Commento](https://commento.io/)!
  Leaving a comment would really mean a lot to me --- it will help keep me
  motivated to keep this research diary up!

  **News:** You can now subscribe via email, powered by
  [BlogTrottr](https://blogtrottr.com/) (really, that means if you don't know
  what to do with an RSS feed, I took care of it for you). Subscribing would
  mean a lot, too!

  *Thanks for the support!*

references:
- id: quine
  type: article-journal
  author:
  - family: Quine
    given: Willard V
  issued:
  - year: 1956
  title: Quantifiers and propositional attitudes
  container-title: the Journal of Philosophy
  publisher: JSTOR
  page: 177-187
  volume: '53'
  issue: '5'
  URL: https://www.uvm.edu/~lderosse/courses/lang/Quine(1956).pdf
- id: partee
  type: chapter
  author:
  - family: Hall-Partee
    given: Barbara
  editor:
  - family: Bäuerle
    given: Rainer
  - family: Egli
    given: Urs
  - family: Stechow
    given: Arnim
    dropping-particle: von
  issued:
  - year: 1979
  title: Semantics — mathematics or psychology?
  container-title: Semantics from different points of view
  publisher: Springer Berlin Heidelberg
  publisher-place: Berlin, Heidelberg
  page: 1-14
  URL: https://mafiadoc.com/semantics-mathematics-or-psychology-semantics-archive_5afc92418ead0edf118b456e.html
  DOI: 10.1007/978-3-642-67458-7_1
  ISBN: 978-3-642-67458-7
- id: kripke
  type: book
  author:
  - family: Kripke
    given: Saul A.
  issued:
  - year: 1980
  title: Naming and necessity
  publisher: Harvard University Press
header-includes: >
  <style>
    .rf {
      float: right;
      padding-left: 1rem;
    }
    .t {
      font-weight: bold;
      color: green;
    }
    .f {
      font-weight: bold;
      color: red;
    }
    .q {
      font-weight: bold;
      color: orange;
    }
  </style>
---

Most of us have this intuitive idea that **two equal things can substitute each
other without consequence.**[^ident] To show what I mean, consider Vladimir
Ulyanov, better known to the word simply as "Lenin".

[^ident]: This comes from [the Indiscernibility of
  Identicals](https://plato.stanford.edu/entries/identity-indiscernible/), also
  known as "Libniz' Law". Don't worry, we're not going to show it doesn't hold.
  Instead, we're going to show that, in language, it doesn't apply.

(@) [true]{.t .rf} Vladimir Ulyanov = Lenin.
(@) [true]{.t .rf} **Ulyanov** [ was the first Premier of the Soviet Union ].
(@) [true]{.t .rf} **Lenin** [ was the first Premier of the Soviet Union ].

Ulyanov and Lenin are the same person, therefore I can always swap them out.
And actually, we just found a new "name" for Lenin --- *"the first Premier of
the Soviet Union".*

(@) [true]{.t .rf} **Lenin** [ founded Iskra ].
(@) [true]{.t .rf} **The first Premier of the Soviet Union** [ founded Iskra ].

Of course, Lenin might not have been the leader he was --- perhaps Julius
Martov could have become the leader of the Soviets.

(@) [true]{.t .rf} Ulyanov might not have been the first Premier of the Soviet
  Union.
(@bad) [false]{.f .rf} Ulyanov might not have been Ulyanov.

Awesome... we broke it...

In this post, let's look at exactly how (@bad) just broke; was "the first
Premier" just a bad name, or do our problems go deeper? It might seem like a
pedantic question, but if we want to understand or model language, equality
would be a pretty important thing to nail down!

References
==========

The technical term we're discussing is
[**reference**](https://plato.stanford.edu/entries/reference/) --- a word (or
words) that "point" to something (if you have a CS background, your intuitions
might be useful here). Broadly speaking we could break references into two
categories: **names** and **descriptions**.

<div class="multicol">
<div>
- **Names**
  - Names, in general, are single lexical items.
  - e.g. *"Tyler Cecil"* refers to a (rather hansom) individual.
  - e.g. *"You"* refers to another attractive individual (though it requires
    context to know which).
</div>
<div>
- **(Definite) Descriptions**
  - A definite description is a description quantified by "the" (meaning there
    is only one).
  - e.g. *"The number of states in the USA"* refers to the number 50 (and no
    other number).
  - e.g. *"The Shinings's director"* refers to Stanley Kubrick.
</div>
</div>

The important note here is that **references are not the things themselves**.
If the word "rose" were a rose, then a rose by any other name would not be a
rose. And that's the root of our problems --- the space between our words, and
the world we're describing.

Linguists, philosophers, and logicians have had a knot in their stomachs about
reference for ages, but their conversations are not always the most accessible.
It doesn't need to be that way, though; a few good examples can demonstrate
just how sticky the topic is, and I think @quine did a great job providing
some.

He breaks down the usage of references into two categories: well behaved
**transparent references**, and the more problematic **opaque references**.

<div class="multicol">
<div>
- **Transparent References**
  - Seem to allow for substitution of "equal" references.
  - Are simple to model logically.
  - Don't tend to be ambiguous.
  - e.g. *"The first odd prime plus 2 is 5".* This sentence can easily be
    re-written using any other reference for 3.
</div>
<div>
- **Opaque References**
  - Do not always allow substitution of "equal" references.
  - Not obvious how to model logically.
  - Can often be ambiguous.
  - e.g. *"He thinks the first odd prime is 5".* Rewriting this sentence with
    some other reference for 3 wouldn't have the same meaning.
</div>
</div>

So, *when do opaque references occure?*

Modal
-----

Sentences with worlds like "must", "may", "could", and "might" are called
*modal sentences*. The modern way to think about modality is with two
operators: necessity, and possibility.[^kripke]

Necessity $\square P$
: In all possible words, $P$ must be true.

Possibility $\lozenge P$
: There exists a word in which $P$ is true.

[^kripke]: Together these form the basis of [Kripke
  semantics](https://plato.stanford.edu/entries/logic-modal/), which is a huge
  topic, well deserving of another post for another day.

We actually already saw an example of a modal reference with (@bad), and
could express it using "$\lozenge$".

$$
\begin{align*}
  &\text{Ulyanov} = \text{First Premier}               & \text{true}\\
  \lozenge & \text{Ulyanov} \not= \text{First Premier} & \text{true}\\
  \lozenge & \text{Ulyanov} \not= \text{Ulynov}        & \text{false}\\
\end{align*}
$$

Written out explicitly like this, it's more clear exactly how (@bad) failed.
References seem to operate slightly differently within the scope of
"$\lozenge$".^[More specifically, *referential names* behave differently than
*definite descriptions* within a modal scope.]

Here's another example, this time using necessity:

(@) [true]{.t .rf} The number of English letters is 26.
(@) [true]{.t .rf} Necessarily 26 should be 26.
(@nbad) [false]{.f .rf} Necessarily the number of English letters should be 26.

Now, written with our $\square$ operator:

$$
\begin{align*}
  n \, \text{letters}        &= 26 &\text{true}\\
  \square 26                 &= 26 &\text{true}\\
  \square n \,\text{letters} &= 26 &\text{false}
\end{align*}
$$

Again we see that "the number of English letters" under the scope of
"$\square$" can refer to different numbers, whereas the name "26", in all
possible words, can only refer to the number 26.

Propositional Attitudes
-----------------------

Propositional attitudes get at the relationship between some proposition $P$
and another person. For example:

(@) Li Na **claims** [ she doesn't know him ].
(@) Dolores **believes** [ they are seeing each other ].
(@) He **hopes** [ they will get a divorce ].

None of these sentences say that the proposition in brackets is true or false
--- they only say what the members of this love triangle *say, think, and
want*.

Right off the bat, we can see how such sentences have an issue with references:

(@jg) [true]{.t .rf} Jozefína *thinks* the number of English letters is
  46.[^slovak]
(@jb) [false]{.f .rf} Jozefína *thinks* 26 is 46.

[^slovak]: Fun fact, [Slovak](https://en.wikipedia.org/wiki/Slovak_orthography)
  has *way* too many letters.

In (@jg), Jozefína simply doesn't know how may letters English speakers use.
That certainly doesn't imply that she is totally ignorant of numbers!

### Names Fails As Well

Propositional attitudes work just as bad with names as they do with definite
descriptions.  Consider Omar, who has a test in his Russian history class. He
knows there will be an essay question, and he hopes it will be about Lenin. He
does not know, however, that Lenin's birth name was Ulyanov.

(@og) [true]{.t .rf} Omar hopes he will write about Lenin.
(@ob) [???]{.q .rf} Omar hopes he will write about Ulyanov.

\(@ob) is not true, in the sense that, when Omar sees an essay question about
Ulyanov, he will probably panic, walk out of the room, and change majors.

It gets more complicated, though. Let's say Omar's parents (both history
professors) are talking over breakfast. Omar's mother says "Omar hopes the
essay is about Ulyanov". Omar's father, knowing who Ulyanov is, would declare
this sentence to be true!

### Not Just Noun-Phrases

Everything we've done so far has been a noun-phrase, but consider my baby
cousin Grace, age two.

(@) [true]{.t .rf} Grace knows people have two legs.
(@) [true]{.t .rf} "Being bipedal" means "having two legs".
(@grace) [???]{.q .rf} Grace knows people are bipedal.

Grace may know people have two legs, so in some sense (@grace) is a true
statements. That being said, grace is a smart kid, but I wouldn't put a lot of
money on her coming up to me any time soon and saying "people are bipedal". So,
in another sense, (@grace) is false.

Possible Worlds
===============

Quine didn't have the tools he needed to understand these sentences, but we're
a luckier bunch. Here's my claim about the difference between transparent and
opaque references:

----------------  -------------------------------------------------------------
**Transparent:**  Talk about how the actual world $w$ is.
**Opaque:**       Talk about how some other worlds $W' \subseteq W$ are.
-------------------------------------------------------------------------------

That might be a little abstract, so here are some examples of what I mean:

Table: Here "$P @ w$" simply means "$P$ is true in world $w$".

--------------------  ---------------------------------------------------------
**$P$ must be**       In all worlds $w \in W$, $P @ w$ is true.
**$P$ might be**      There is a world $w \in W$ where $P @ w$ is true.
**She thinks $P$**    She believes in a world $w$ where $P @ w$ is true.
**He wants $P$**      He wants to be in any world $w$ in which $P @ w$ is true.
**I say $P$**         I speak of a world $w$ in which $P @ w$ is true.
-------------------------------------------------------------------------------

Once we make this revelation, it starts to become clear what was happening all
along: **references resolve within the context of a particular world $w$**,
and that world is not always the one in which we are living; it can be the one
about which we are speaking.

A Computational Connection
==========================

References are essentially a kind of program --- call it `ref`. If I say the
name "Le Guin", I'm asking you the listener to bring to mind the person who has
that name. `(ref "Le Guin")`. Similarly, if I say "the author of *The
Dispossessed"*, I'm asking you to bring to mind the person who fits that
description. `(ref "The author of The Dispossessed")`. I can only assume that,
in your mind, those should be the same individuals.

**But the result depends which "machine" runs `ref`!** Remember Jozefína?

```lisp
You-Machine> (ref "Num English Letters")
  26
Jozefína-Machína> (ref "Num English Letters")
  46
```

The programing language Lisp is famously able to "talk about programs".

Table: The single quote before a list signals that you are writing *about* code
  rather than *with* code.

------------------  -------------------------------------------------------
`(let x (+ 1 1))`   Assigns the *value* 2 to $x$.
`(let x '(+ 1 1))`  Assigns the *program* `(+ 1 1)` to $x$.
`(print (eval x))`  Prints the result of running the program stored in $x$.
---------------------------------------------------------------------------

In natural language, we also can easily switch between talking with words
(known as **de re** statements) and talking about words (known as **de dicto**
statements). If I want to say "Jozefína thinks the number of English letters is
26", there are two interpretations

```lisp
;; De Re Interpretation
;; (no normal speaker would parse this way).
(eq (eval-jozefína (ref "English Letters") 26)
;; De Dicto Interpretation
;; (the intended meaning).
(eq (eval-jozefína '(ref "English Letters") 26)
```

**De dicto** literally means "about words", so a de dicto reading means "this
person thinks/wants/believes *these exact words*".

**De re** means "about the thing", so a de re reading would be "this person
thinks/wants/believes *the things these words mean*".

Scope Is Always Tricky
======================

Natural language, unlike Lisp, doesn't have clear scope rules. If I say "all
students talked about a move", you could take that in one of two different
ways:

* $\forall k$, $\exists m$, $k$ talked about $m$. (Each kid talked about a
  movie.)
* $\exists m$, $\forall k$, $k$ talked about $m$. (There is a movie that all
  kids talked about.)

The way we manage this kind of ambiguity is ultimately a question of psychology
--- it's contextual[^prag]. And, as we've described it, we've made **reference
a problem of scope ambiguity**. When you hear a reference, you mind must
decided, "was that reference de dicto, or de re?" For example:

(@amb) Gloria thinks someone here is a murderer.

When you hear this sentence, there are two totally legitimate ways to interpret
it.

<div class="multicol">
<div>
- **De Dicto:**
  - Gloria thinks that, among the people here, one of them must be a
    murderer.
  - Here Gloria thinks *the words* "someone here is a murderer".
</div>
<div>
- **De Re:**
  - There is a person here, and Gloria thinks they are a murderer.
  - Here the speaker is saying "someone" to the listener, to describe what
    Gloria thinks.
</div>
</div>

[^prag]: The linguistic word for this part of language is
  [pragmatics](https://en.wikipedia.org/wiki/Pragmatics). Questions at the
  pragmatic level involve things like what "it" means in "she needs to get it".
  Also the "set of all possible worlds" being considered by "$\square$" and
  "$\lozenge$".

Let's drive this home with one last example. Consider Antonio and Yolanda, who
are visiting an art show. Yolanda points to one painting in particular, and
says:

(@) That painter is amazing!

Later that night, Antonio says to his sister:

(@am) Yolanda thinks the girl down the street is an amazing painter.

Antonio "translated" the reference *"that painter"* (which Antonio's sister
wouldn't understand) to *"the girl down the street"* (which Yolanda wouldn't
understand). Antonio's sister hears the sentence as:

```lisp
(think yolanda (is (ref "the girl down the street") amazing-painter))
```

And because Yolanda doesn't know who the girl down the street is, she would not
likely think:[^scope][^notation]

```lisp
(think yolanda '(is (ref "the girl down the street") amazing-painter))
```

We could also think back to (@ob) --- the de dicto reading is false, because
Omar didn't know who Ulyanov was. However, when his mother made the same
statement to a different audience, it was received with a de re meaning, and
was therefore true.

[^scope]: The scoping of "who is evaluating this reference" can become
  arbitrarily complicated, nesting partially evaluated / non-evaluated
  reference. You could even add a third person into a sentence.

[^notation]: In case it isn't obvious, the Lisp notation I'm using here is
  very wishy-washy. I'm only trying to spur the intuition. In particular, I
  could have quoted just the reference in this example, and not the entire
  predicate. Without really defining the semantics of this notation, however,
  it's a mute point.


Parting Notes
=============

I hope you enjoyed following along with me on my topic of the week. Referential
Opacity can seem a little abstract; historically the main problem had always
been that modeling language would never be possible without understanding
reference.  @quine is a remarkably entertaining paper, and I would highly
recommend it (it's a short read, full of great examples)! It and @partee do a
good job laying out why the problem matters.

One critical piece of required reading here that has been left unmentioned is
@kripke --- *"Naming and Necessity"* is *the* book on reference, which servers
as the modern foundation of the problem in Philosophy, Language, Logic, and
anyone else who may be interested. Before Kripke, this was considered a massive
open problem. It's considered to be required reading in these fields. The
computation connections are my own intuition, but they largely shadow the
thinking of Sual Kripke.

References
==========
:::refs
:::
