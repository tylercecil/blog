---
title: May, Might, Modality
subtitle: Probable Words about Possible Worlds
abstract: >
  An introduction to linguistic modality, as modeled by possible worlds. In
  particular, what is the difference between the worlds "may" and "might"?
update:
note: >
  **Note:** I've been on a bit of a hiatus, but it's important to me that I get
  back to writing! This post is a bit less polished than I'd like, but it's
  short, which I think is a good way to keep me writing on a regular schedule.
bibliography: may-might.bib
header-includes: >
  <style>
    .bad { color: red; }
    .good { color: green; }
    .meh { color: orange; }
    .example * { margin-bottom: 0em; }
  </style>
---

The expert steps in, and gives an assessment of the situation:

(@survive) "They might have survived", they explain.

Now tell me, with what little context you have, how do *you* read (@survive)?
*Did* they die? *Could* they still be out there? Was there something we could
have done to save them?

> If you assumed they died, you are a pessimist, and likely a drain on the
> people around you. If you assumed they lived, you're wrong --- they were all
> eaten alive by lions.

Today's very short post is about the **semantics of modality.** Really though,
it's just an excuse for me to share some amusing sentences, focused around
usage of the English words *may* and *might*; two words, I would venture, that
the average native English speaker has trouble defining, and, in fact, whose
meanings appear to be changing in modern English. [^fine-print]

[^fine-print]: Of course, modality is a very large topic. This is just a brief
  introduction. A good, more thorough introduction would be @kearns2011
  [chapter 5].

# Modality

First, what exactly was the ambiguity in (@survive)?

(@log) "They might have survived if the lions hadn't found them."
(@epi) "They might have survived --- we haven't found any bodies."

In (@log), it is clear that our heros met an unsavory end. However, (@epi) is
markedly more positive, expressing uncertainty about their fate. In both cases,
though, **the expert did not say they necessarily survived.** So then, how do
we model these logically?

To answer that, we need to understand *logical modality*. I've actually
[written about modality before](/posts/2020/02/13/reference.html#modal), but
let's recap.

There are things in this world that are true, like *"stop signs are red"*.
There are also things, however, that *could* be true, like *"stop signs could
be blue"*.[^blue] There are even things that *must* be true, like *"stop signs
must have been invented by someone"*.[^history][^subt]

[^blue]: Like [in
  Hawaii](https://www.reddit.com/r/mildlyinteresting/comments/87pigt/this_blue_stop_sign_in_hawaii/)

[^history]: Whoever it was, they were someone [in Detroit circa,
  1915.](https://www.nytimes.com/2011/12/11/magazine/stop-sign.html)

[^subt]: Note how this is subtly different than *"stop signs were invented by
  someone".*

In English, sentences with words like *shall, should, can, could, may, might,
would*, or *must* (as well as some other words and constructs) express
*modality*. In the simplest case, modality is logically represented with two
operators:

Necessity: $\square P$
  : $P$ *must* be true.\
    i.e. $\square \text{SURVIVE}(\text{they})$ could model *"they must have
    survived"*.

Possibility: $\lozenge P$
  : $P$ is possibly true.\
  i.e. $\lozenge \text{SURVIVE}(\text{they})$ could mode *"it is possible they
  survived"*.

Both of these are subtly different than claiming some $P$ is true. This gets
especially tricky with necessity --- is there a difference between saying
something *must be* true, and something *is* true? What's more, while this is
all well and good for (@epi), it's not exactly clear how this can be used to
model (@log). It's worth us diving into exactly how $\square$ and $\lozenge$
work.

## Possible Worlds

I need you to do a favor for me, and picture the set of all possible worlds.

> That wasn't so hard, was it?

Let's call this set $W$. With this new friend of ours, we can break down
our two new operators.

Necessity: $\square P$
  : $\forall w \in W,\; P @ w$ \
    *For all worlds in $W$, $P$ is true in that world.*

Possibility: $\lozenge P$
  : $\exists w \in W,\; P @ w$ \
    *There exists a world $w$ in the set of all worlds $W$, such that $P$ is
    true in that world $w$.*

The real magic here is this $@$ operator, which allows us to express that $P$
is true in some world. That world might be a world someone believes in (*"Li
believes she knows the answer"*), worlds across time (*"it has always been
true"*), or all logically conceivable worlds (*"no matter what, 1 + 1 must be
2!"*).

Modality is more than just possibility and necessity; **modality allows us to
talk about the worlds where propositions are true, and not just the
propositions themselves.**

## Types of Modality

"The set of all worlds" is kinda a tricky idea, of course. In fact, there are
a number of various *types* of modality, each corresponding to a different set
of worlds. Here are the most commonly discussed:

### Logical Modality

Logical modality deals with the set of all logically consistent worlds, and is
one of the strongest / most general modalities.

-------------   ----------------------------------  -------------------------------
**Possibility** *"The first prime can not be 4!"*   $\neg\lozenge_L$first prime is 4
**Necessity**   *"There must be infinite primes!"*  $\square_L$there are infinite primes
-------------   ----------------------------------  -------------------------------

### Epistemic Modality

Epistemic modality deals with a smaller set of worlds --- only those worlds
consistent with what the speaker knows. This is the "as-far-as-I-know" set. For
example, I might know someone has been stealing cookies, based on the state of
the cookie jar. It is not *logically necessary* that someone is stealing
cookies, but with the evidence at hand... there must be a cookie-thief among us.

---------------   --------------------------------------      ------------------------------
**Possibility**   *"It's possible he was at the party."*      $\lozenge_E$he was at party
**Necessity**     *"The gods must be crazy!"*                 $\square_E$gods are crazy
---------------   --------------------------------------      ------------------------------

In "the gods must be crazy", the meaning here is not that "logically speaking,
if there are gods, they must be crazy, in all possible words". Instead, it's
making a statement about a conclusion the speaker has come to. The speaker has
looked around them and said "I don't know everything about this world, but all
signs point towards some bonkers gods".

### Deontic Modality

Deontic modality is substantially different than the others[^illocution].
The set of worlds being described here are the worlds which are being declared
"allowed". I think an example could show this best:

-------------   ----------------------------------  -------------------------------
**Possibility** *"You may have one more slice"*     $\lozenge_D$you have one more slice
**Necessity**   *"you must come home"*              $\square_D$you come home
-------------   ----------------------------------  ------------------------------

In this case, the speaker isn't so much declaring conclusions about worlds, but
giving commands of a sort.

[^illocution]: One reason why deontic is significantly different than the
  others is because it has a different "intent" behind it. One uses it with the
  intention of eliciting a behavior from others. The categorization of a
  "speech act" is known as **illocutionary force**. Speech acts are a pretty
  fascinating topic that should probably be looked into more often in
  semantics [@austin2009].

# Might and May

Writing a little intro on modality, however, was really only an excuse to get
to a set of sentences I found to be mildly interesting. They come down to this
question: **what is the difference between "may" and "might"?**

At first glance, they are almost interchangeable (both express $\lozenge$,
modal possibility). On closer observation, however, each word is used with a
different set of modes.

                Mode Type  May                      Might
-------------------------  -----------------------  ---------------------------
  **Logical Possibility**  [Not Used]{.bad}         [Used]{.good}
**Epistemic Possibility**  [Used]{.good}            [Used]{.good}
  **Deontic Possibility**  [Used]{.good}            [Not Used]{.meh}[^might]
-------------------------  -----------------------  ---------------------------

Now you shouldn't just take my word for that. Instead, read these example
sentences taken from @kearns2011 [page 81], and see if you agree with the
judgments.

:::example
**Logical Possibility**

a. [She ***might*** have fallen down the cliff --- thank goodness the safety
   harness held.]{.good}
b. [\#She ***may*** have fallen down the cliff --- thank goodness the safety
   harness held.]{.bad}

**Epistemic Possibility**

a. [She ***may*** have fallen down the cliff --- we're still waiting for the
   rescue team's report.]{.good}
b. [She ***might*** have fallen down the cliff --- we're still waiting for
   the rescue team's report.]{.good}
:::

Interesting, no? @kearns2011 claims that this difference seems to be disappearing
in modern English. I haven't been able to find research supporting that claim,
but I've been thinking about how I might test it. If I find the time, I'd be
interested in doing a little follow up work.

If these judgments don't line up with your own, I'd love to hear more from you!
Or if you could point me to some research on this possible semantic drift in
English, that would be just as helpful!

Thanks as always for reading (especially this less-polished post)! Feel free to
leave a comment --- it always means a lot!

[^might]: Usage of a deontic "might" does exist, but it's a bit archaic. "Might
  I have another?" is typically judged to be correct, but with a feeling of
  over-formality or datedness. Getting data on these subtle differences strikes
  me as quite the challenge!

# References
:::refs
:::
