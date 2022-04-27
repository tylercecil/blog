---
title: You Can Contract If You Wanna
subtitle: The Story of Wanna-Contraction
abstract:
  Syntax textbooks everywhere love, need, and wanna explain what's up with
  "wanna".
update:
note:
bibliography: wanna.bib
header-includes: >
  <style>
    .bad {
      color: red;
    }

    .bad::before {
      content: "*";
    }

    .good {
      color: green;
    }

    .good::before {
      content: "✔";
    }

    .t1 {
      color: green;
    }

    .t2 {
      color: blue;
    }

    .s {
      opacity: 50%;
    }

  .tree .node rect {
    opacity: 0;
  }

  .tree .links {
    stroke: black;
    opacity:1;
  }

  .example > .example {
    font-size: 100%;
    border: none;
  }

  .therapy {
    padding: 0 4rem;

  }

  .toc {
    max-width: 80%;
  }

  .toc td:first-child {
    text-align: center;
  }
  </style>
---

Most English speakers, I think, would agree that these two sentences are
essentially the same:

(@party) I *want to* go to the party! $\Leftrightarrow$ I *wanna* go to the
  party!

Now, I need to make a confession: *I don't know a single thing about phonetics
or phonology.* But, in my ignorance, I wouldn't have thought twice about
(@party) --- I would have just said something like:

> This is some basic phonetic thing! The more frequently you say something, the
> more you can fudge the pronunciation. No big deal.

That is... until last month. You see, **there are times when *"wanna"* is
flat-out wrong.**

(@pup-g) Who do you *want to* kiss that puppy? (I want Douglas to kiss that puppy!)
(@pup-b) [Who do you *wanna* kiss that puppy?]{.bad}

Would I *understand* someone who said it? Of course. But, if I were speaking
naturally, I just wouldn't say it. Try saying both the sentences in (@party)
slowly; now try (@pup-b) --- it just sounds strange.

And it's not simply that *some sentences* can't use "wanna" --- the *meaning*
of the sentence seems to matter! For example, let's say you and your friends
are going to watch a very exciting basketball game.

(@win1-g) Let's watch the game! Who do you *want to* win? (I want the 76ers to
win!)
(@win1-b) Let's watch the game! [Who do you *wanna* win?]{.bad}

But now, picture some very shady team owners, gambling their players away.

(@win1-g) Who do you *want to* win? (I want to win Joel Embiid!)
(@win1-b) Who do you *wanna* win? (I wanna win Joel Embiid!)

Clearly **just because "want" and "to" are near each other doesn't mean you can
use "wanna"!** This isn't a phonological property of English; there are grammar
rules dictating when and where "wanna" can pop up in a sentence! **The question
is, what are those rules?**

Today's post will try and tackle that question in three acts.

<table class="toc">
<colgroup>
  <col style="width: 25%">
  <col style="width: 75%">
</colgroup>
<tbody>
  <tr class="odd">
    <td>**[Act 1](#the-old-school-answer)**</td>
    <td>
    We look at a widely repeated, very popular, old-school answer.
    </td>
  </tr>
  <tr class="even">
    <td>**[Act 2](#problematic-data)**</td>
    <td>
    We present a list of (very alarming) sentences that the old-school answer
    doesn't explain.
    </td>
  </tr>
  <tr class="odd">
    <td>**[Act 3](#a-better-solution)**</td>
    <td>
    Finally, we arrive at a more satisfying answer to the wanna-question.
    </td>
  </tr>
</tbody>
</table>

The Old-School Answer
=====================

:::note
**Act 1** --- The explanation of "wanna" you are sure to find in your textbook.
:::

So-called **wanna-contraction** (or **to-contraction**) has been something of a
hot topic ever since the 1970's. At that time, some certain linguists at a
certain university in Massachusetts were developing pretty groundbreaking
theories about language.[^bfg] A prominent piece of those theories is something
called *movement*.

[Movement](https://en.wikipedia.org/wiki/Syntactic_movement)
  : In a syntax tree, certain rules may cause nodes to jump to different
  positions in the tree.\
  **e.g.** In English, questions cause verb movement:\
  "You can do it!" $\Rightarrow$ "Can you do it?"

Let's look at a very well-known type of movement: **wh-movement.**

:::example
  **Example:** Consider the sentence *"you do like him".* What if we
  didn't know *who* was liked?

  **"You do like him"[^do] $\Rightarrow$ "Who(m) do you like?"**

  ---------------------------  ------------------------------------------------
  You [do]{.t1} like him.      The auxiliary verb is "do".

  [Do]{.t1} you                In English, questions move the auxiliary verb to
  [$\square$]{.t1} like him?   the first position.

  [Do]{.t1} you                For our question we want to use "who(m)" instead
  [$\square$]{.t1} like        of "him".
  [whom]{.t2}?

  [Whom]{.t2} [do]{.t1} you    In English, "wh"-phrases get moved to the
  [$\square$]{.t1} like        beginning of the sentence (even before the
  [$\square$]{.t2}?            auxiliary verb).
  ---------------------------  ------------------------------------------------
:::

**Now what does this have to do with wanna-contraction?**

[^bfg]: I'm being facetious --- the linguists were Chomsky and his crew, and
  the school was MIT. They were developing what would become [the Minimalist
  Program](https://en.wikipedia.org/wiki/Minimalist_program) (sometimes called
  "MP" for short), which is still the most dominant theory (or more accurately
  "program") of syntax out there. Defining what the minimalist program is far
  beyond the scope of this post --- all that really matters right now is that
  *movement* is a key part of those theories.
  [^do]: "You like him", of course, would be a more natural sentence. I chose
  "You do like him" to avoid talking about why "do" suddenly appears in a
  question.

Silent Words
------------

I'm not sure who first noted the idiosyncrasies with "wanna" usage, but
@chomsky1978 were the first to provide a captivating explanation. You see, in
the theory of movement, words don't *just* move --- they leave something
behind!

[Trace](https://en.wikipedia.org/wiki/Syntactic_movement#Traces)
: A trace is a hypothetical *silent word*, which is left behind whenever
  movement occurs in a tree. Traces are usually marked with a "$t$".\
  **e.g.** In "[Who]{.t2} [do]{.t1} you [$t_{\text{do}}$]{.t1} like
  [$t_{\text{who}}$]{.t2}?", we see two traces, each corresponding to a different instance
  of movement.


Chomsky and Lasnik were looking for evidence that silent words[^emptycat]...
you know... actually existed. While doing so, they saw these problems with
"wanna", and made a pretty interesting observation:

:::example

**Whenever a trace is found between "want" and "to", it seems to "block"
contraction.**

--------------------------------------- ---------------------------------------
I want to kiss him.\                    There is no trace between "want" and
Who do I **want to** kiss               "to".
**$t_\text{who}$**?\
[Who do I wanna kiss?]{.good}

I want him to kiss the dog.\            There is a trace sitting between "want"
Who do I **want $t_\text{who}$ to**     and "to", which blocks the contraction!
kiss the dog?\
[Who do I **wanna** kiss the
dog?]{.bad}

I want him to win\                      Notice we have *"want him to"* in the
Who do I **want $t_{\text{who}}$ to**   first sentence. That "him" becomes a
win?\                                   trace in the question form.
[Who do I wanna win?]{.bad}

I want to win him\                      If "wanna" would work in the
Who do I **want to** win                non-question sentence, it will work in
$t_\text{who}$?\                        the question form as well.
[Who do I wanna win?]{.good}
--------------------------------------- ---------------------------------------

:::

That's what I'm calling the "old-school answer": **silent words are blocking
"want" and "to" from contracting!**

[^emptycat]: Traces aren't the only example of *silent words* --- they are just
  one instance of something known as an [empty
  category](https://en.wikipedia.org/wiki/Empty_category).

Problematic Data
================

:::note
**Act 2** --- A whole list of sentences the old-school answer doesn't seem to
address.
:::

The old-school answer (that traces are the reason "wanna" isn't always allowed)
can be found in basically any textbook on syntax [@falk2011]; I, for one,
learned about it from @carnie2013 [Chapter 5, p.369]. And that's frankly pretty
odd, **because it seems to be incorrect**.

I don't mean *movement* is dubious (that's a whole other debate). It just
doesn't explain what's going on with "wanna". You see, there's a whole host of
other situations where "wanna" just doesn't seem to fit.[^missing]

:::example
**Coordination**\
When "gluing" verbs together with "and" or "or" (known as *coordination*), we
find that wanna-contraction fails.

(@) [I don't expect, need, or wanna dance.]{.bad}
(@) [I don't wanna or expect to dance.]{.bad}

It's not clear why there would be a silent word blocking this contraction.
:::

:::example
**Noun-Form**\
There is a noun form of "want", such as in "my only want is to be remembered".
Even when to immediately follows this "want" we don't see any contraction.

(@) We cannot expect that want to be satisfied.
(@noun-bad) [We cannot expect that wanna be satisfied.]{.bad}

I find (@noun-bad) almost laughable. It's clear that "want" and "to" simply
being next to each other isn't enough for contraction to occur.
:::

:::example
**Intransitive Want**\
There is an intransitive form of "want", such as in the sentence "I am never
satisfied and always wanting". This form also doesn't seem to contract.

(@orig) *(In order)* to be an effective over-consumer, you have to really want.
(@posible) You have to really want *(in order)* to be an effective
  over-consumer.
(@cont) You have to really WANNA be an effective over-consumer.

You could read (@posible) without the parentheses, and it would be ambiguous
--- (@cont), however, is suddenly unambiguous!
:::

:::example
**Parentheticals**\
There are also more "random" reasons why "want" and "to" might be next to
each other, such as in an interjection. In these cases, contraction seems to
be blocked as well.

(@) I want, to be precise, a yellow four-door De Ville convertible.
(@) [I wanna, be precise, a yellow four-door De Ville convertible.]{.bad}
:::

**The old-school answer, that traces are the secret to wanna-contraction, just
can't be the whole story!**

[^missing]: I actually chose to skip over another pretty important problem ---
  within Chomsky's own theories there are actually *other* silent words! If you
  are familiar with the $PRO$ category, you may have noticed there were
  elements missing when we were explaining movement. A fuller expansion would
  be *"What do you want $PRO$ to read $t_\text{what}$"*. It seems a bit
  inconsistent that one silent word would block contraction, while the other
  would have no effect.

A Better Solution
=================

:::note
**Act 3** --- An improved answer to the question "what are the rules for
wanna?"
:::

Those previous examples were noted by @pullum1997, who developed a much more
convincing solution to our conundrum: **what if "wanna" is its own word?**

It isn't that extreme of a thought! It would certainly explain our data!
"Wanna" would be its own verb (distinct from "want"), which would have its own
(equally distinct) behaviors.[^verb-classes]

And it's not uncommon for phrases or contractions to become their own words (or
*lexicalize*). Take "don't" for example --- native speakers would agree "do
not" sounds *way* scarier than "don't". It doesn't matter if we're speaking
slowly or quickly, they're not exactly the same.

So, just as "do not" and "don't" are subtly different, maybe "want to" and
"wanna" are also different (though a bit *more* different).

[^verb-classes]: Think about the verbs "think" and "wonder". "Think" can take
  a finite non-question, like in "I think she is here." "Wonder" can take only
  take question clauses, as in "I wonder if she is here." You couldn't ever say
  "I think if she is here"! Verbs can be broken down into classes, each with
  rules describing these behaviours.

The Verb "Wanna"
----------------

OK, let's say "wanna" is its own verb... now we have a  new problem! If "wanna"
is a verb, shouldn't it conjugate like one?

Expanded         Contracted
---------------- ----------------
I want to go!    I wanna go!
She wants to go! [She wannas go!]{.bad}
She wants to go! [She wansta go!]{.good}
---------------- -----------------

Instead of "wanna" conjugating as if it were its own word, conjugation happens
at the expanded level. Of course, "wanna" could just be irregular, but that
seems a bit like cheating.

This is a problem for the theory that "wanna" is a new word. No fears,
though --- we can make a slight amendment!


The To-Postfix
--------------

Pullum makes a pretty clever jump: the secret is that **"to" isn't a *word*,
but a *morphological postfix!* **.

Postfix
: A postfix isn't a word on its own, but something you may attach to the end of
  a word to build a *new* word.\
  **e.g. "Dog" + "-s" = "Dogs"**\
  While "dogs" is clearly *derived* from "dog", it has new behavior distinct
  from the singular "dog".

The claim is that "want" may take the postfix "-to" and *create* a new word,
with these altered grammatical properties! This allows for the conjugation
pattern we saw before, while maintaining the theory that "wanna" is distinct
from "want".

We should expect the same thing to take place with other verbs as well --- "to"
should attach to some verbs, and modify their properties in a consistent way.
And lo and behold, such a set of verbs exists: the *therapy verbs*![^therapy]

<div class="row therapy">
<div class="one-half column">
- want + to $\Rightarrow$ **wanna**
- used + to $\Rightarrow$ **usta**
- got + to $\Rightarrow$ **gotta**
</div>
<div class="one-half column">
- going + to $\Rightarrow$ **gonna**
- have + to $\Rightarrow$ **hafta**
- supposed + to $\Rightarrow$ **supposta**
</div>
</div>

And just as predicted, all of these words are imbued with new behaviors,
different from that of the expanded forms. Let's look at two examples.

::: example
**"Going to" VS "Gonna"**\

(@going) I'm not going to annoy her.
(@gonna) I'm not gonna annoy her.

While (@going) has two possible meanings, (@gonna) only has one meaning: my
full intention of annoying her.  Only the "future" sense of the word may take
the "-to" postfix (and not the locative).
:::

:::example
**"Have to" VS "Hafta"**\
Similarly, only one sense of "have" may take the "-to" postfix --- the
necessity meaning.

(@have) There are some puzzles I have to work on.
(@hafta) There are some puzzles I hafta work on.

Again we see two possible readings for (@have), but only one for (@hafta).
What's more, "hafta" follows the same conjugation rules as "wanna":

(@haftas) [There are some puzzles she haftas work on.]{.bad}
(@hasta) [There are some puzzles she hasta work on]{.good}
:::

[^therapy]: Why the name "Therapy Verbs"? To quote Pullum "there are surely few
  of us who have never experienced a conflict between their wannas and their
  haftas."

Parting Notes
=============

So is this the end-all-be-all answer to why "wanna" is such a strange beast? Of
course not. I've completely skipped over the morphological rules that might
allow "to" to behave this way, and they aren't without controversy. But
hopefully, if I've convinced you of anything, it's that "wanna" (which we might
have thought was just our tongues being lazy) is actually a beautiful and
complex bit of language.[^data]

If you're looking for further reading, I *highly* recommend starting off with
the Pullum paper -@pullum1997. From there, you might be interested in some
other work in the area.

- Boas looks at "wanna" from a Constructivist viewpoint, a totally different
  linguistic framework. It gives a good view of other ways to look at the
  problem [@boas2004].
- There is research on how non-native speakers seem to learn these rules in
  ways different from native speakers [@kweon2011].
- Finally, an interesting paper by Zukowski and Larsen point out that children
  seem to use wanna in different ways than adults, and casts some doubt on
  modern thinking of "wanna" [@zukowski2011].

I'm curious what might have stood out to you? Are you a native speaker who
didn't agree with some of these judgments? Or maybe a non-native speaker who
never noticed how complicated this contraction was? Maybe you're aware of a
similarly odd verb class in your own language! As always let me know your
thoughts, and thanks for reading!

[^data]: Lt. Commander Data would be the first to tell you that [contractions
  aren't so simple](https://www.youtube.com/watch?v=yY1KdQNodN0).

References
==========
:::refs
:::
