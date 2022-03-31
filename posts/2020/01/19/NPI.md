---
title: Words that Ever Play Well
subtitle: Part I on Negative Polarity Items
abstract: '"Any" is such a common word; with "for-all"-like semantic. "Any" has
    hardly ever troubled anyone. Then again... maybe "any" *has* troubled
    *anyone.*'
bibliography: npi.bib
header-includes: >
  <style>
    blockquote {
      margin-bottom: 2.5rem;
      margin-left: 0;
      margin-right: 0;
    }

    blockquote > ol, blockquote > p {
      margin: 0 .2rem;
      font-size: 110%;
      background: #F1F1F1;
      border: 1px solid #E1E1E1;
      border-radius: 4px;
      padding: 1rem 1.5rem;
    }

    /* I'll use ~~ ~~ to mark bad sentences */
    del {
      color: red;
      text-decoration: none;
    }
  </style>

update: 2020-01-24
note: "**Note:** be sure to read [Part II](/posts/2020-01-29-NPI2.html) once
  you've finished!"
---
Here's a wholly unremarkable English sentence:

> Nobody lifted a finger to stop him.

A week ago, I would have had nothing to say about this sentence. It *does* have
the idiom *"to lift a finger"*. Most English speakers would define that as "to
take action". If those have the same semantics, we should be able to swap them
out:

> Nobody took action to stop him.

Yup, seems to work! Now, we all know *someone* who's just not going to sit
around when there's villain-stopping to be done!

> Somebody took action to stop him.\
> ~~#Somebody lifted a finger to stop him.~~

That last sentence is objectively wrong (though subjectively entertaining). But
what *makes* that sentence wrong? What was missing in our definition of the
idiom that didn't carry over? You might be hoping for a simple answer; you
might be saying "ok Tyler, that expression only works in some fixed phrases".
Unfortunately, we just hit the tip of an iceberg --- this is one of those cases
where the more you look into something, the more complex and interesting it
gets.

So, take my hand, and let's jump down the rabbit hole that is **Negative
Polarity Items**!

Strange Lexical Items
=====================
Let's start by zooming out: "lift a finger" isn't going to be the only *lexical
item*^[A *lexical item* is just any "chunk" we can give a definition to. Think
words and idioms.] we're worried about. In fact, let's look at a set of
way more common items:

<div class="row">
<div class="one-half column">
1. ever
   - I don't ever want to go there.
   - ~~#I want to ever go there.~~
2. any
   - She didn't go to any of the meetings.
   - ~~#She went to any of the meetings.~~
</div>
<div class="one-half column">
3. yet
   - Dogs haven't learned to talk yet.
   - ~~#Dogs have learned to talk yet.~~
4. anymore
   - You shouldn't talk with her anymore.
   - ~~#You should talk with her anymore.~~
</div>
</div>

Hopefully this convinces you that these words form a special class. First
identified by @klima, he noted they only seem to be **licenced** by some kind
of **negative context** (go ahead and look --- only the "negative" sentences
seem to work!). This is where the name *Negative Polarity Item* comes from. And
like many great names, **NPI is completely misleading, and totally misses the
mark.**

How "Negative Context" Falls Short
------------------------------------
Finding counter-examples in linguistics just happens to be a hobby of mine.
Let's break this *"Negative Context"* hypothesis:

> No one has ever been to my house.\
> ~~#Someone has ever been to my house.~~\
> Exactly 10 people have ever been to my house.

Welp, there goes negativity! The last sentence seems pretty reasonable --- and
decidedly non-negative. The question, then, is still open: **under what
context would an NPI be accepted?**

Dissecting those sentences might point us in a direction...

+---------------+-----------------------------------------+
| No one...     | $\forall x \in$ People: $\neg$ Been($x$,|
|               | My House)                               |
+---------------+-----------------------------------------+
| Someone...    | $\exists x \in$ People: Been($x$, My    |
|               | House)                                  |
+---------------+-----------------------------------------+
| Exactly 10... | Exactly 10 $x \in$ People: Been($x$, My |
|               | House)                                  |
+---------------------------------------------------------+

The only difference between these sentences are the *quantifiers*^[We won't
cover quantifiers in this post. For now, a quantifier is anything that would
fill the blank in a sentence like **"{} boy/s dance"**.]. The next
step might be to test an NPI with a set of quantifiers.

### "Ever" and Some Quantifiers
"Ever" *could* show up in both the **Noun Phrase** and the **Verb Phrase** of a
sentence. We can test how both work with this example:

> **NP:** [ *Quantifier* ] who has **ever** seen the film will recommend it.\
> **VP:** [ *Quantifier* ] who has seen the film will **ever** recommend it.

Now we just try out some quantifiers, and see which sentences work. The
following table shows a few results.

Quantifier              *ever* in NP    *ever* in VP
-------------------   --------------  --------------
No one                Yes             Yes
Someone               ~~No~~          ~~No~~
Five people           ~~No~~          ~~No~~
Several People        ~~No~~          ~~No~~
Many                  ~~No~~          ~~No~~
Everyone              Yes             ~~No~~

Table: First row: "No one who has *ever* seen the film will recommend it" and
       "No one who has seen the film will *ever* recommend it".


Ok, great!... Now what? Is this getting us any closer to a unifying concept of
when these words are licenced?

Downward Entailment
===================

@ladusaw1980 gave us a pretty reasonable answer, based on something called
**downward entailment**. This is a concept which merits its own post, so I'll
try and be brief. Here are two simple entailments:

> (@up) You are a father. $\vDash$ You are a man. \
> (@down) No man can swim. $\vDash$ No father can swim.

The set of fathers $F$ is a subset of the set of men $M$ (we typical write this
as $F \subseteq M$). The thing to note here is the direction of entailment. In
(@up), we go from subset *up to* superset. In (@down), we go from superset
*down to* subset. This is the most basic example of *upward and downward
entailment*.

Entailment and Quantifiers
--------------------------

The sentences we've been talking about have been of the form **"[Quantifier]
+ NP + VP"**, where NPs and VPs form sets.

"Every person I've ever met likes dogs"
: **NP**: The set of people I've met.
: **VP**: The set of things that like dogs.

Sentences gives us information about what entailments we can make from them.
If I thought "All apples are red", then anything I know about all red things
would be true for apples too. I would also, likely, have a very emotional
experience in the presence of a granny smith.

Every quantifier provides an *entailing environment* for NPs and VPs that could
either be *up* or *down* (to a superset or subset)^[Sometimes this is referd to
as monotonic increasing or decreasing.]. We can test these very simply with a
NP and a VP.

> **NP:** "Apples" $\subseteq$ "Fruits"\
> **VP:** "People who sing well" $\subseteq$ "People who sing"

Testing the quantifier "every", we get

> (@np) "Every fruit is red" $\vDash$ "Every apple is red"\
> (@vp) "Everyone sings well" $\vDash$ "Everyone sings"

In (@np), we go from superset to subset. That's *downward entailment!* In (@vp),
however, we go from subset to superset --- *upward entailment!* Try going
through our list of quantifiers, and seeing which entailment environments each
has. Here's a table of the results:


Quantifier                        NP              VP
-------------------   --------------  --------------
No                    Down            Down
Some                  ~~Up~~          ~~Up~~
Five                  ~~Up~~          ~~Up~~
Several               ~~Up~~          ~~Up~~
Many                  ~~Up~~          ~~Up~~
Every                 Down            ~~Up~~

**We've got a winner!** ... ... ... right?

Have We Found our Solution?
===========================
I was introduced to NPIs by Kate Kearns's book *"Semantics"* -@kearns in a
chapter on Generalized Quantifiers, so this was my first look at NPIs and
downward entailment. But it turns out that

1. There are actually other contexts that licence NPIs
2. Downward entailment still catches those

Well that was an emotional roller coaster. I'm not sure I want to give you a
list of these but... I'm going to go ahead and give you a list.

-------------------------------------------------------------------------------
Category                                                                Example
----------------------  -------------------------------------------------------
Quantification Adverbs  I **{ rarely / never / ~~often~~ / ~~always~~ }**
                        *ever* do that *anymore*.

Prepositions            You wrote every letter **{ ~~with~~ / without }** *any*
                        help.

Certain Verbs           He **{ doubted / ~~believed~~ }** I would *ever* find
                        *anyone*.

Certain Adjectives      It was **{ hard / ~~easy~~ }** to *ever* think about
                        *anyone* else.

Degree Words            She was **{ too smart / ~~smart enough~~ }** to *ever*
                        write me another letter.
-------------------------------------------------------------------------------

For more examples, see page 458 in Ladusaw (1980). In all of these
cases, you can see a natural direction of entailment.

> I rarely see movies $\vDash$ I rarely see action movies.\
> I often see movies $\not\vDash$ I often see action movies.

Try making tests for the other sentences in the table, and convince yourself
that only those with *downward entailment* are acceptable.

Summary
-------
The original question was **when can words like *ever*, *any*, or *yet* be
used?** These words and others form a class known as *Negative Polarity Items*.
In the end, the idea of *downward entailment* seemed to capture which
contexts allow NPIs.

Why would we need words like this in communication? They don't seem to add any
information --- just add emphasis. This is just my conjecture, but it could be
related to the un-intuitive nature of downward entailment. The more "normal"
direction is upward. The use of an NPI in a sentence may, in fact, signal that
the entailment direction in the sentence was *unusual*.

> I go to parks $\vDash$ I go outside.\
> I don't *ever* go outside $\vDash$ I don't *ever* go to parks.

Originally there was thinking that *ever* was bringing attention to the
negative polarity of the sentence (possibly making up for English's lack of
*negative concord*). Now we might think it's bringing attention to entailment
directions.

Finished?
---------
I've labeled this post as Part I, because, horror of horrors, we actually
haven't come up with an answer! Remember this sentence?

> Exactly 10 people have ever been to my house

This sentence doesn't exactly jive with our idea of downward entailment.
Actually... it doesn't jive with our idea of upward entailment either.

> Exactly 10 cool people have been to my house. \
> $\not\vDash$ Exactly 10 people have been to my house.\
> \
> Exactly 10 people have been to my house.\
> $\not\vDash$ Exactly 10 cool people have been to my house.

This is called a *non-monoton quantifier*. In Part II, we'll expand our
licencing context for NPIs even further, to include these (and some other
situations as well). And (hopefully) we will have enough time to get into
*Positive Polarity Items* and some cross-linguistic examples! No promises,
though!

**Read on to [Part II](/posts/2020-01-29-NPI2.html) once you've finished!**

References
==========
:::#refs
:::
