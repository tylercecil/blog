---
title: Paratype
subtitle: An Actor Model for Monomorphisers
abstract: A proof-of-concept experiment written in Go to
          understand static monomorphising. Given a program in a toy
          dummy language with a Haskell-like type system, Paratype
          will perform type inference and type checking. If type checking
          passed, it will generate a monomorphic code realization of the
          given program.
---

**This project is currently a prototype, written by neophytes of many
things.** It was written in haste, and generally needs more research
behind it. That being said, it served its purpose of letting me play
with Go and explore the idea of monomorphising. It may be elaborated
on in the future, but for the time being I would suggest checking out
[the design doc](https://github.com/izzycecil/Paratype/blob/master/documentation/design.tex)
if you want to more fully understand the project.

Paratype, outside of being an experiment for me and my groupmates own
benefit, is two things: an actor model of *type checking* a
*type-inferred system*, and an actor model of monomophising
polymorphic code.

The concept of monomorphising is simple --- take a polymorphic
function, and produce all specific instances of that function for a
set of given types. This is particularly useful for just-in-time
compilation, such as in
[javascript](http://mrale.ph/blog/2015/01/11/whats-up-with-monomorphism.html)
. In static situations, monomorphising is mostly useful if all
types that will be used are known at compile time (i.e. the code is
not going to be linked with any new code), or possibly if a known type
or types will be a dominant use-case. There are other applications
(briefly mentioned in the Paratype documentation on Github) that
exist in the broader area of type analysis as well, but are frankly
above me.

Type checking is of course a well documented field. With a
Hindley-Milner type system,
[Algorithm W](http://en.wikipedia.org/wiki/Hindley%E2%80%93Milner_type_system#Algorithm_W)
is the canonical algorithm for type inference and checking. Paratype,
however, sought a parallel way of type checking (100% because we felt
like it).

Our solution was to let every function be an actor, and types be
messages. Functions would communicate to each other type information
they have, and slowly build a list of their concrete (monomorphic)
types. This, unfortunately, does not mean the problem is as simple as
dataflow analysis, as the paper is sure to stress. To learn more, read
the paper linked above. Don't worry if this project seems absolutely
bonkers to you --- it is! We were just having some fun learning Go!
