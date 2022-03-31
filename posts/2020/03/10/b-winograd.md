---
title: Winograd Schema Challenge
subtitle: Going Beyond the Imitation Game
abstract: >
  The Winograd Schema Challenge is an alternative to the Turing Test,
  with some very practical advantages. The test itself boils so much down into
  a single, simple, and well-defined linguistic function: anaphora resolution.
update:
bibliography: winograd.bib
note: "**Note:** Did you *also* not understand (or had never heard of) the
  Turing Test? I wrote a [preliminary
  post](/posts/2020-03-10-a-turing-prelim.html) just for you!"
header-includes: >
  <style>
    .comment { display: none; }

    .n1 { color: green; }
    .n2 { color: blue; }
    .nq { color: red; }
    .n1::after {
      font-size: 75%;
      bottom: -0.25em;
      position: relative;
      content: "1";
    }
    .n2::after {
      font-size: 75%;
      bottom: -0.25em;
      position: relative;
      content: "2";
    }
    .nq::after {
      font-size: 75%;
      bottom: -0.25em;
      position: relative;
      content: "?";
    }
    .sp { text-decoration: underline; }

    .post .example .q {
      width: 70%;
      margin: 1rem auto;
      border-top: 1px solid grey;
      border-bottom: 1px solid grey;
      padding: 0.5rem;
    }
  </style>
---

In 2014, in what could be the poster-child of terrible science journalism, the
internet was abuzz about [Eugene
Goostman](https://www.bbc.com/news/technology-27762088), supposedly the first
AI to pass the Turing test. Normally I would toss this into the bucket of
"things too stupid for my time", but this debacle actually hints at something
important. Scott Aaronson had a
[conversation](https://www.scottaaronson.com/blog/?p=1858) with Eugene that
really cut to the heart of the matter:[^edit]

> **Scott:** How many legs does an ant have?\
> **Eugene:** Something between 2 and 4. Maybe, three? :-))) Oh, what a
> fruitful conversation;-)\
> **Scott:** Do you understand why I’m asking such basic questions?\
> **Eugene:** …wait\
> **Scott:** Do you think your ability to fool unsophisticated judges indicates
> a flaw with the Turing Test itself, or merely with the way people have
> interpreted the test?\
> **Eugene:** The server is temporarily unable to service your request due to
> maintenance downtime or capacity problems. Please try again later.\
> **Scott:** Do you think Alan Turing, brilliant though he was, had trouble
> imagining that the judges of his “imitation game” wouldn't think to ask
> commonsense questions like the ones above --— or that, if they did, they'd
> actually accept evasion or irrelevant banter as answers?\
> **Eugene:** No, not really. I don't think alan turing brilliant although this
> guy was had trouble imagining that the judges of his imitation game would
> not consider to Oooh. Anything else?\

[^edit]: This conversation has been edited by me for length and emphasis.

Yes Eugene... Anything else.

This is a very real practical problem with the Imitation Game --- **people
don't always seem to get the point.** If the judge doesn't understand the test,
the whole enterprise is worthless!

That isn't an argument against Turing, by the way; the Turing test stands as
one of the most compelling definitions of intelligence we have. But for those
who are interested in the study of intelligence, it may not be the most
practical of tests.

In this post, I want to introduce a kind of "Mini Imitation Game". It will
capture the philosophical spirit of the Imitation Game into a single, simple,
well-defined linguistic function. This one linguistic function, I hope, will
bring you as much wonder about humans and language as it does to me.

Goals for a New Test
====================

First thing is first: the human judge has to go. We want our new test to be
totally non-subjective. We don't want the human to go easy on the machine; we
don't want her to fall victim to cheap tricks like changing the subject; we
don't want her to chalk things up to a matter of opinion.  Humans, obviously,
carry out many subjective processes, but this test is going to be more limited
in scope. So, no humans (who needs 'em?).

Besides that, we have four main goals for our test:

Goal 1: it should be multiple choice.
  : - The answer must be given (no avoiding the question).
    - There is a measurably correct answer.
    - The questions can be curated to cover specific abilities.

Think of a [CAPTCHA](https://en.wikipedia.org/wiki/CAPTCHA) --- you are forced
to give an answer, and it better be the right one! (Unless it's a [really hard
one](https://www.theverge.com/2019/2/1/18205610/google-captcha-ai-robot-human-difficult-artificial-intelligence).)
Multiple choice will also let us measure progress --- we could objectively say
"this program scored 80%."

Goal 2: it should stay in the language domain.
  : The power of language is universal. This means we should be able to fit
    any possible task into language.

We want to capture the widest possible array of topics and abilities.
"Intelligent" covers a lot of ground, and so should our test. Language is an
ideal medium to express any and all intellectual abilities. (Besides, this is
ostensibly a linguistics blog --- you'd think I'd be writing about language.)

Goal 3: humans should score perfectly
  : Because this new test should be non-subjective, it should be something that
    any human could do. A question might require some domain knowledge, but
    any normal human with that knoweledge should pass.

Again, that's just like CAPTCHA. It also demonstrates a weakening of the new
challenge, because it would exclude subjective thinking.

Goal 4: it must be "hard"
  : The test should be "Google proof", meaning a computer couldn't just answer
    questions by having access to huge amounts of data. It must require
    creative output of its own.

Number 4 is obviously a moving target, but the hope is it should be similarly
difficult to the Imitation Game (although, as I've already stated, will
ultimately be easier).

Winograd Schema
===============

A very promising solution is known as the *"Winograd Schema Test"*, developed
by Levesque [-@levesque-2012]. I said this new test was going to revolve around a single
linguistic function, and as it happens, I introduced this linguistic function
in my [last post on donkey sentences](/posts/2020-02-24-drt.html#anaphora):
**anaphora resolution.**

Anaphora
  : Any expression whose interpretation depends on another expression elsewhere
    (called the antecedent if it occurred before, postcedent if it occurred
    after).\
    e.g. "I met [Uma]{.n1} in October, when [she]{.n1} still had a job." Here
    the anaphora ["she"]{.n1} referse back to the antecedent ["Uma"]{.n1}.

In that post, we were a bit hand-wavy about how to resolve what an anaphora is
referring to. And that's because... well... it's pretty complicated! To show
what I mean, let's look at our first Winograd Schema.

(@w1) "[The trophy]{.n1} doesn't fit in [the brown suitcase]{.n2} because
      [it's]{.nq} [too big.]{.sp}"
      <div class="q">
      What is [too big]{.sp}?
      - [The trophy]{.n1}
      - [The brown suitcase]{.n2}
      </div>

Now before you think (@w1) is simple to explain, consider the following:

(@w2) "[The trophy]{.n1} doesn't fit in [the brown suitcase]{.n2} because
      [it's]{.nq} [too small.]{.sp}"
      <div class="q">
      What is [too small]{.sp}?
      - [The trophy]{.n1}
      - [The brown suitcase]{.n2}
      </div>

Although (@w2) is *almost identical* to (@w1), you probably noticed (unless you
are a robot) that the correct answer changed. To resolve this anaphora, one
would have to know a thing or two about fitting, being big, and being small.
And it's not as simple as "big things won't fit, and small things can't
contain"!

(@w-ambig) "[The shirt]{.n1} doesn't fit [the mannequin]{.n2} because
  [it's]{.nq} [too big/small.]{.sp}"

In this case, **[it's]{.nq} is ambiguous;** a shirt might not fit because it's
*either* too big *or* too small, and the same goes for a mannequin![^nog] My
point here is only to demonstrate how much knowledge and reasoning we used to
understand the word *"it".*

[^nog]: I think most readers would assume the shirt is too big or too small,
  because it would be unusual to talk about a mannequin as being the wrong
  size. But if you had just purchased a bunch of mannequins, and someone said
  (@w-ambig) to you, you'd probably assume the mannequin was the wrong size.
  In this case, because the sentence is ambiguous, we wouldn't consider it a
  valid test.

So, let's finally write down a definition for a Winograd schema:

Winograd Schema
  : Take a sentence with the following properties:

      - Contains two noun phrases.
      - Contains an anaphora which grammatically could refer to either NP.
      - A *special word* determins which NP the anaphora referse to.
      - The special word could be changed, such that the NP also changes.

      In the Winograd Schma Test, such a sentence is presented (with either
      possible special word), and one must determine which NP the anaphora
      referse to.

Examples
--------

It might not be immediately obvious just how broad of a test this is, so it's
worth looking at some examples.

(@w-mat) "[The large ball]{.n1} crashed right through [the table]{.n2} because
  [it]{.nq} was made of [steel/styrofoam]{.sp}."
  <div class="q">
  What was made of [steel/styrofoam]{.sp}?
  </div>

In (@w-mat), one would have to know a bit of physics to correctly answer, not
to mention know those materials.

One of my favorite examples was designed to demonstrate visual thinking:

(@w-vis) "Sam tried to paint a picture of [shepherds]{.n1} with [sheep]{.n2},
  but [they]{.nq} ended up looking more like [dogs/golfers]{.sp}."
  <div class="q">
  What looked like [dogs/golfers]{.sp}?
  </div>

Here's an example demonstrating some problem solving skills:

(@w-prob) "[The sack of potatoes]{.n1} had been placed [above/below]{.sp} [the
  bag of flour]{.n2}, so [it]{.nq} had to be moved first.
  <div class="q">
  What had to be moved first?
  </div>

Cross Linguistic
----------------

Of course, all languages have anaphora ([of many
types](/posts/2020-02-24-drt.html#not-just-nouns)), so we're not bound to
English. We could translate (@w-prob) into Japanese, for example:

(@w-jap) じゃがいもの入った袋が、小麦粉の入った袋の**[上/下]**にあるので
  、最初にそれを動かさなければならない。
  <div class="q">
  最初に動かさなければならないのは何か？
  </div>

However, not *all* schema are translatable. Terry Winograd (for whom these are
named after) produced one such example [-@winograd-1972]:

(@w-og) "[The city councilmen]{.n1} refused to give [the women]{.n2} a permit
  for a demonstration because [they]{.nq} [feared/advocated]{.sp} violence"

In English this is perfectly fine. However, (@w-og) could never be translated
to French, because the gender of "they" would not match both noun phrases (it
would either be a masculine or feminine "they"). In this case, the *grammatic*
ambiguity is lost.[^gram]  Similarly, a Hungarian example might not work in
English, because Hungarian has no gender system at all.

[^gram]: Remember, there is no *semantic* ambiguity here. A Winograd schema
  always has clear meaning, but ambiguous grammar. That's the key to why this
  test works as a measure of intelligence --- it operates at the meaning level,
  and not the syntax level.

Avoiding Easy Questions
-----------------------

Goal #4 was for the challenge to be hard, and unfortunately there are
Winograd schema that are just a tad too easy for our tastes. What would make a
test easy? @levesque-2012 identify two main classes of easy problems.

### Ease of Category

(@w-cat) "[The women]{.n1} stopped taking [the pills]{.n2} because [they]{.nq}
  were [pregnant/carcinogenic]{.sp}."

In this case, no complex understanding is actually required. All one needs to
know is

1. Woman are rarely carcinogenic.
2. Pills are rarely pregnant.

That's really the end of the story. To answer this schema, one *only* needs to
be aware of [category
mistakes](https://en.wikipedia.org/wiki/Category_mistake).

### Easily "Googleable"

(@w-stat) "[The racecar]{.n1} zoomed by [the school bus]{.n2} because [it]{.nq}
  was so [fast/slow.]{.sp}"
  <div class="q">
  What was [fast/slow]{.sp}?
  </div>

This schema has what Levesque calls the "googleable problem." In (@w-stat),
indeed slow and fast *could* be attributed to both [the racecar]{.n1} and [the
school bus]{.n2}, but there is a *strong association* with racecars and speed.
Simply knowing that "fast" and "racecare" appear near each other in texts would
be enough to solve this schema.[^better]

[^better]: A better test here would be, instead of having a special word,
  swapping the order of the noun phrases, so that sometimes the school bus
  is passing the racecar.

We want to avoid cases like this, which could be easily solved by systems such
as [IBM's Watson](https://en.wikipedia.org/wiki/Watson_(computer)), which only
use statistical methods to answer questions. For example:

(@w-age) [Fred]{.n1} is the only man alive who still remembers [my father]{.n2}
  as an infant. When Fred first saw my father, [he]{.nq} was twelve
  [years/months]{.sp} old.
  <div class="q">
  Who was twelve [years/months]{.sp} old?
  </div>

It's hard to imagine a system using only "dumb" statistical methods being able
to answer (@w-age). What corpus would possibly contain an answer?

Avoiding Hard Questions
-----------------------

If we're not careful, we might go in the other direction, and introduce
sentences which humans aren't actually able to solve.

(@w-hard) "[Frank]{.n1} was [jealous/pleased]{.sp} when [Bill]{.n2} said that
  [he]{.nq} was the winner
  <div class="q">
  Who was the winner?
  </div>

In the first case, Frank is jealous that Bill won. In the other case,
however, there isn't a clear answer. Is Frank happy for Bill, or is Frank happy
for himself? Without more context, this question isn't necessarily answerable.

Better Than Turing?
-------------------

Levesque makes the claim that the Winograd Schema Challenge can be seen as a
replacement for the Turing test [-@levesque-2012]. It may be the case that a
huge number of intellectual tasks can be encoded into a schema, but I think
it's almost self-evident that this is a weaker test.

$$\text{Winograd Passing} \subsetneqq \text{Turing Passing}$$

In fact, I would argue that any test which is multiple choice / non-ambiguous
would have this property, as much intelligent behaviour is creative and
ambiguous. Reading comprehension (the heart of this challenge) is likely a
much simpler task than that of creative synthesis.

That being said, it has a huge amount of pragmatic benefits. Perhaps my
favorite aspect of Winograd schema is **it helps people understand what the
point of the Imitation Game really is.** It shows off how effortlessly we
leverage complex reasoning into simple sentences.


Current Progress
================

So, to get to everyone's first question: **how well do machines score on the
test?**

The answer: **not great!**

In 2016 *Nuance Communications* hosted [a
competition](http://commonsensereasoning.org/winograd.html), in which no
program even qualified to compete (having failed a "easy" Round 1).  @liu-2016
had a very thorough report on their approach to that competition, which scored
66.7%, a state-of-the-art result at the time. Remember, just "guessing" would
yield 50%, so there's plenty of work to be done.

More recent results report scores as high as 72%, a small but impressive edge
above guessing [@kocijan-2019].

Future Tests
============

I believe this challenge will be a useful one for those interested in AI and
Linguistics for some time to come. Still, an interesting thought experiment is
what tests might be used in the future, building off of Levensque's test.

For example, @levesque-2014 presents an unusual schema:

(@w-new) [The large ball]{.n1} crashed right through [the table]{.n2} because
  [it]{.nq} was made of [XYZ]{.sp}.
  <div class="q">
  What was made of [XYZ]{.sp}?
  </div>

Unsurprisingly this is pretty hard to answer. But what if the question also
included the following?

::: example
1. XYZ is a trademarked product of Dow Chemical.
2. XYZ is usually white, but there are green and blue varieties.
3. XYZ is ninety-eight percent air, making it lightweight and buoyant.
4. XYZ was first discovered by a Swedish inventor, Carl Georg Munters.
:::

Now we could talk about "Extended-Winograd-Schema" which include information
like that above.

Another possible idea would be resolving non-noun-phrase anaphora. Temporal
anaphora could be interesting.

(@w-temp) Russell had a party last Friday, and his donkey got drunk. I left
  before the drinking started, and couldn't believe the stories I heard that
  morning.
  <div class="q">
    Order the following events:
      - Russell has a party
      - Donkey became drunk
      - Drinking starts
      - I leave
      - I can't believe stories
  </div>

This would be tricky depending on the language, however, as some languages are
very grammatically clear with temporal order. In English, the morphology
largely gives the order of events, but in Lao one could only use reason to
build a logical timeline.

I *personaly* would be interested in tests of creativity (which, by definition,
couldn't be multiple choice). For example, the test could be to find a possible
special word.

(@w-synth) What is a word for "XYZ"  in (@w-new) would cause the answer to be
  [the large ball]{.n1}?

Notes and Further Reading
=========================

For more information and reasoning about Winograd schema, I'd recommend
@levesque-2014. Perhaps more fun, though, would be to look at [this
list](https://cs.nyu.edu/faculty/davise/papers/WinogradSchemas/WS.html) of 150
schema, with commentary, available in English, Chinese, Japanese, French, and
Portuguese. A collection of state-of-the-art results can be found at that site
as well.

For a more linguistic analysis of the schema, I'd recommend *"The Role of
Pragmatics in Solving the Winograd Schema Challenge"* [@richard-bollans-2018].

Special thanks to Duncan Gibbs, and Tessa Guengerich for both independently
suggesting this topic. It's been a lot of fun reading about it!

References
==========
::: #refs
:::
