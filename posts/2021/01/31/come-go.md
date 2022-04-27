---
title: Let's Come Somewhere Else
subtitle: The Semantics of "Come" and "Go"
abstract:
update:
note: |
  **Note:** This post is a small adaptaion of a paper I wrote for the
  University of Washington's *Ling 578* course. If you'd rather read the paper,
  you can find it [here](/static/posts/come-go/paper.pdf).
bibliography: come-go.bib
header-includes: >
  <style>
    img.fig {
      display: inline-block;
      max-width: 25%;
      min-width: 150px;
      padding: 0 1em;
    }

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

    #pronouns {
      border-collapse: collapse;
    }
    #pronouns td {
      border: 1px solid black;
    }

    #pronouns td:last-child {
      padding-right: 15px;
    }

    #pronouns td:first-child {
      padding-left: 15px;
    }

    #pronouns em {
      font-style: normal;
      font-variant: small-caps;
    }

    .vens img {
      width: 100%;
    }
    .vens figure {
      width: 90%;
    }
  </style>
---

:::comment
$$
\newcommand{\w}[1]{\text{#1}}
\newcommand{\cont}{\mathcal{C}}
\newcommand{\ucont}{\hat{\cont}}
\newcommand{\dis}[1]{\cont\left[{#1}\right]}
\newcommand{\udis}[1]{\ucont\left[{#1}\right]}
\newcommand{\cat}[1]{\text{#1}}
\newcommand{\speaker}{\cat{+speaker}}
\newcommand{\hearer}{\cat{+hearer}}
\newcommand{\participant}{\cat{+participant}}
\newcommand{\coloneqq}{≔}
$$
:::

Define "come" and "go" to yourself. Go ahead, say it out loud --- I won't
comment on how funny your voice sounds. Does your definition look something
like this?

:::center
![](/images/posts/come-go/come.svg){.fig}
![](/images/posts/come-go/go.svg){.fig}
:::

Interesting. Well you're wrong (and your voice *does* sound a little funny).

Most people usually think of ingress and egress --- moving either towards or
away from the speaker. And in some ways that's true!

(@) [Come towards me!]{.good}
(@) [Come away from me!]{.bad}
(@) [Go towards me!]{.bad} [^stipulation]
(@) [Go away from me!]{.good}

The problem is sentences like this:

(@e1) [I'm coming over to your house.]{.good}

If (@e1) is said over the phone, with the listener sitting in their own home,
it works just fine. But if both speaker and listener are at the park talking,
(@e1) no longer makes sense! It's almost as if the speaker is taking the point
of view of the listener, thinking "what verb would *they* use?", and conforming
to that.

Is this just a psychology thing? Well... not all languages work this way, so
not exactly.

To me, the conclusion is that **the English words "come" and "go" have more
complicated semantics than ingress or egress.** With a little bit of trial and
error, we can pretty succinctly describe those rules. Before we do that,
though, let's take this opportunity to learn a new word!

[^stipulation]: This sentence actually doesn't *sound* bad --- it just can't be
  "go towards me, the actual speaker, where I am now". It makes sense if "me"
  is some kind of avatar, or maybe where the speaker will be in the future.
  I'll get back to this, don't worry.

# Deixis

Deixis
: Language's ability to "point" to the world in context.\
  A word is deictic if its *semantic meaning* is fixed, but its *denotation*
  depends on the context.\
  **i.e.** *"this"* and *"that"* are the linguistic equivalents to (and often
  accompanied by) physical pointing.

This dips heavily into the forbidden art of psychology. But, even though deixis
gets messy, there is a sense that the *kind* of deixis available to us is more
or less universal.

Typically deictic expressions are oriented around **the deictic center**. Along
all kinds of axes like person, time, and location, there is a center, and
points radiating outward.

:::center
![In modern English, orientation around the deictic center looks like
this.](/images/posts/come-go/center.svg){.fig}
:::

This picture isn't exactly complete, though! For example, in Japanese there is
actually a third outer-ring missing from the picture above!

<!--
  Speaker Hearer 3rd Person
  ------- ------ ----------
  Here    There  There (Middle English "yonder")
  ここ    そこ   あそこ
  This    That   That
  これ    それ   あれ
-->

<table>
<thead class="center">
  <tr class="header">
    <th></th>
    <th>Proximal</th>
    <th>Medial</th>
    <th>Distal</th>
  </tr>
</thead>

<tbody class="center">
  <tr class="odd">
    <td rowspan="2"> **Place** </td>
    <td>Here</td>
    <td>There</td>
    <td>There *(Middle English "yonder")*</td>
  </tr>
  <tr class="even">
    <td>ここ<br>(ko·ko)</td>
    <td>そこ<br>(so·ko)</td>
    <td>あそこ<br>(a·so·ko)</td>
  </tr>
  <tr class="odd">
    <td rowspan="2"> **Object** </td>
    <td>This</td>
    <td>That</td>
    <td>That</td>
  </tr>
  <tr class="even">
    <td>これ<br>(ko·re)</td>
    <td>それ<br>(so·re)</td>
    <td>あれ<br>(a·re)</td>
  </tr>
</tbody>
</table>

That is *あそこ* is a version of *there* meaning "neither location of speaker
nor hearer". And three levels isn't the limit --- Sinhala (spoken in Sri Lanka)
has four, distinguishing between a "visible" and "out-of-sight" 3rd person.
And, I kid you not, the Canadian Inuit language has claim to fourteen different
spatial deictic terms [@denny1982]!

Even the axes of deixis vary! Honorifics are a kind of deixis encoding the
difference in social status between speaker and listener --- common in many
languages, totally absent in others. The *direction* of motion is sometimes
also captured, as is the case with the German hin/her prefixes (related to the
archaic "hither"/"thither" in English).

But we're always on this hunt for a universal picture. Some theorize that all
deixis boils down to a foreground/background mechanic. "Foregrounded" items are
near, salient, or recent, whereas "backgrounded" are far, oblique, or past. I
find that interesting when you think about axis of *information*.

> Consider this: "this" can refer to things you're about to say. And if you
> think *that* was interesting, "that" can refer to things you've already said.

Obviously there is a lot to say about deixis, so I would *highly* recommend
*Spatial Deixis-The Use of Spatial Co-ordinates in Spoken Language* by Barbara
Cairns -@cairns1991 --- it's just a good introduction on the subject, full of
surprising uses of language.

## Formally Encoding Deixis

Typically deictic expressions aren't actually 1-to-1 with denotations, and act
more like "filters". Take English pronouns as an example:

<div class="example">

**English Pronouns:** each pronoun can be seen as a series of constraints.

<table id="pronouns" class="center">
<tbody>
  <tr>
    <td colspan="5">_+participant_</td>
  </tr>
  <tr>
    <td colspan="2">_+speaker<br>-hearer_</td>
    <td>_+speaker<br>+hearer_</td>
    <td colspan="2">_-speaker<br>+hearer_</td>
  <tr>
  <tr>
    <td>Singular <br> _I_ </td>
    <td>Plural <br> _we_ </td>
    <td>Plural <br> _we_ </td>
    <td>Singular <br> _you_ </td>
    <td>Plural <br> _you_ </td>
  <tr>
</tbody>
</table>

These constraints can then be called upon in the semantics of a sentence. "I
see you" could be written as

$$
\text{SEE}(\dis{+speaker,-hearer},\dis{-speaker,+hearer})
$$
</div>

$\cont$ here is the "context", where we lookup information. We'll use this
idea of constraints to express *come* and *go.*


# The Real Rules of Coming and Going

To find the *real* rules governing "come" and "go", basically I wrote down a
*lot* of sentences. I started with a template sentence:

(@) I am coming/going to New York!

Then I tweaked a bunch of parameters, like person, tense, who *was* and *was
not* in New York, and looked at which made sense.

In the present tense, we can look at the results as a bunch of Venn diagrams.
**Each circle of the Venn Diagram shows if someone is or isn't in New York.**
We have a "Speaker" circle, "Hearer" circle, and maybe a "3rd Person" circle.

<div class="vens multicol">
![**"I am coming to New York!"**](/images/posts/come-go/pres_1_come.svg)

![**"I am going to New York!"**](/images/posts/come-go/pres_1_go.svg)

![**"You are coming to New York!"**](/images/posts/come-go/pres_2_come.svg)

![**"You are going to New York!"**](/images/posts/come-go/pres_2_go.svg)

![**"Sven is coming to New York!"**](/images/posts/come-go/pres_3_come.svg)

![**"Sven is going to New York!"**](/images/posts/come-go/pres_3_go.svg)
</div>

Now we can see that "I am coming to New York" works if the listener is in New
York. "I am *going* to New York" works as long as *I* am not already *in New
York* (though using *come* is often a bit more natural).

## Formalization

Formally, our naïve *come* and *go* definition looked something like
this^["Agent" here means "person coming/going", and "goal" is "where they are
coming/going to".]:

:::example
**Naïve Come and Go:**
$$
\begin{align*}
  \|\textrm{come}\| &≔ \text{MOVE}(agent, goal) \wedge
                               \text{PROXIMAL}(goal, \dis{\speaker})\\
  \|\textrm{go}\| &≔ \text{MOVE}(agent, goal) \wedge
                             \neg\text{PROXIMAL}(goal, \dis{\speaker})
\end{align*}
$$
:::

Now we want to take the data above, and make some new rules! I should note,
these rules are going to look a lot like (though are a slight improvement on)
those developed by @fillmore1966. Looking at the Venn diagrams, there's one
pretty obvious rule[^fil]:

:::example
**Rule 1**
$$
\neg\text{PRESENT}(agent, goal)
$$
:::

You can't go somewhere you already are! Next, there is a clear rule governing
*go*: the speaker cannot be present at the goal.

:::example
**Rule 2 (Go Rule)**
$$
\neg\text{PRESENT}(\dis{\cat{+speaker}}, goal)
$$
:::

The rule for *come* is a little trickier: either speaker or hearer must be
present at the goal (this matches the point-of-view intuitions).

:::example
**Rule 3: (Come Rule)**
$$
\text{PRESENT}(\dis{\cat{+participant}}, goal)
$$
:::

Ok. Cool. ... ... Are we done?

[^fil]:Actually, Fillmore did not include this rule (not that he would disagree
  with it, it just was left unstated). Including, it turns out, greatly
  simplifies things.

## What About Tense?

Ok, I kinda left something out here. It turns out **tense matters when using
come or go!** Consider this little example:

:::example
**P1:** I'll be in New York this Christmas. I'm going to miss you!\
**P2:** Don't worry! I'll come to New York to see you!
:::

In this example, **neither speaker or hearer are in New York, but *come* was
used!** It seemed to matter more that the hearer *would be* in New York when
the action was going to take place. But then there is this example:

:::example
**P1:** Did you hear about Duncan? He came here last night!\
**P2:** While we were out shopping?
:::

**Now neither participant was present at action time!**

## The Final Rules

We can clean up our rules by adding this temporal constraint on things. I'll
use "$@ \text{time}$" to mean "true at a time". Gluing everything together
gives us these rules:

:::example
**Rule 1: (come \& go)**

$$
  \neg\text{PRESENT}(agent, goal) @(\dis{\cat{+event-time}})
$$

**Rule 2: (go)**
$$
\neg\text{PRESENT}(\dis{\cat{+speaker}}, goal) @
  (\dis{\cat{+event-time}})
$$

**Rule 3: (come)**
$$
  \begin{align*}
  \text{PRESENT}&(\dis{\cat{+participant}}, goal) @
  (\dis{\cat{+event-time}}) \\
    \vee
    \text{PRESENT}&(\dis{\cat{+participant}}, goal) @
    (\dis{\cat{+speech-time}}) \\
  \end{align*}
$$
::::

# Parting Notes

I found these rules pretty surprising! They're far more complicated than what
one would think for two words as "simple" as *come* and *go*!

I've been spending a lot of time thinking about these words, their rules,
exceptions and edge cases, and have been really fascinated by their
intricacies --- *especially* cross-linguistically! For the sake of time,
though, let me just leave you with some teasers:

* These rules seem to hold for the words "bring" and "take".
* I said the speaker "takes the point of view of the listener" --- there is
  actually psychological data for this! For example, children with Autism seem
  to use *come* and *go* differently than other children [@hobson2010].
* These rules don't seem to be exactly complete. *"I'll come with!"* is one
  example that confuses me. Interrogatives and modals seem to also have odd
  behaviors.

I'll leave you all with some further reading, if anyone is interested!

* This post is a micro version of [a paper I
  wrote](/static/posts/come-go/paper.pdf) for a semantics course.
* Again, @cairns1991 is a great introduction to Deixis, and a thoroughly
  enjoyable read.
* @fillmore1966 is *the* paper on "Come" and "Go".
* @wilkins1995 is a paper on "Come" and "Go" in two very different languages.
  The paper challenges just how "basic" these words really are.

# References
:::refs
:::
