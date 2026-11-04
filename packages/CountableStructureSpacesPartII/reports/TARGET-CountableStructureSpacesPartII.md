# Triage report: TARGET-CountableStructureSpacesPartII

**Verdict:** part-ii. **Name:** CountableStructureSpacesPartII. **Base:** CountableStructureSpaces
(pull request #1316). The brief is `packages/CountableStructureSpacesPartII/target.md`; the
manifest is `packages/CountableStructureSpacesPartII/sources.toml`.

## What was searched

- **The base.** `TauCetiRoadmap/CountableStructureSpaces/README.md` and `Suggested.lean` at the
  head of #1316, read in full. The base owns the relational coding space, S∞ as a Polish group, the
  logic action, `structureIsoSetoid` as the orbit relation, model classes, trees and the
  boundedness theorem, Borel back-and-forth, Scott height, López–Escobar and the well-order class.
  Its out-of-scope list names "Borel completeness of isomorphism of countable graphs or linear
  orders", "Borel reducibility, smoothness and E₀" (BorelEquivalenceRelations) and "the
  Becker–Kechris theorem ... general Polish group actions beyond the logic action of S∞" (a
  separate roadmap). The board report `packages/CountableStructureSpaces/reports/PRREVIEW-CountableStructureSpaces~1.md`
  records 13 findings, 6 blocking, none about scope.
- **Open targets and designs on the board.** Every entry in the brief's list was compared by
  object: all are in analysis, geometry, algebra, number theory, homotopy theory or physics; none
  concerns descriptive set theory, equivalence relations, Polish groups or countable structures.
  No merge.
- **Roadmaps on main, open pull requests, board packages** through `roadmaps grep` for
  `Borel[- ]complete`, `Friedman`, `Becker`, `Paolini|torsion-free abelian`,
  `essentially countable|countable Borel equivalence|hyperfinite`, `BorelReducible|Borel reduc`.
  Hits in the descriptive-set-theory sense: only `BorelEquivalenceRelations` (main; #1616 is a
  repair of the same roadmap), `CountableStructureSpaces` (#1316, the out-of-scope line) and
  `CountableModelCounting` (main). The other hits ("Borel-complete genuine spectra" in
  RefinedTraceMethods, "Borel reduction" of a G-bundle in FormalConnectionsOpers and
  LocalGaloisDeformationRings, "torsion-free abelian group" as an algebraic adjective) are
  unrelated meanings. The package index in the job's scratch lists four imported packages
  (AnalyticNumberTheory, AutomorphicCongruences, LawrenceVenkateshMethod,
  LogicAndDefinabilityInNumberTheory), none relevant; the board folders
  `packages/BorelEquivalenceRelations`, `packages/CountableStructureSpaces` and
  `packages/InfinitaryModelExistence` hold only review reports.
- **BorelEquivalenceRelations** (main), §5: owns `BorelReducible` for setoids on measurable spaces
  with reflexivity, transitivity, the injection on quotients and reductions between equalities;
  `IsSmooth`; Silver in reducibility form; `eZero` with its non-smoothness. Its out-of-scope list
  puts countable Borel equivalence relations, hyperfiniteness, Polish group actions in general,
  and "everything about spaces of countable structures" elsewhere. It does not define Borel
  completeness, restriction of a reduction to a Borel subset, or set-reducibility.
- **CountableModelCounting** (main), §4e: "Borel complete invariant" there means a Borel
  isomorphism-invariant map into a countably separated space, a smoothness-type notion, not Borel
  completeness. No overlap.
- **InfinitaryModelExistence** (main), Layer 6: the graph translation of function symbols
  (`graphLanguage`, `graphAxioms`, `relationalize`), which the Part II consumes for classes of
  groups, fields and Boolean algebras. **Completed/InfinitaryLogic**: relational only; invariant
  descriptive set theory out of scope.
- **Libraries at the pins.** Tau Ceti `358314d4`: no `ModelTheory/Infinitary`, `BackAndForth` or
  `Scott` modules (only `ModelTheory/Algebra` and `OrderedRing`), no structure space, no Borel
  reducibility. Mathlib `f6090c70`: `PolishSpace`, `StandardBorelSpace`, `AnalyticSet`,
  `Descriptive.tree`, `Language.graph` with `SimpleGraph.structure`; no Borel reducibility, no
  topology on `Equiv.Perm ℕ`.
- **Merge order** `merge-order/ORDER.txt`: none of the three suppliers is listed (two are on
  main, the base is another author's open pull request), so the Part II can be inserted anywhere;
  the design chooses.

## What was found

Borel reducibility between isomorphism relations, Borel completeness, the Friedman–Stanley
theorem, the Becker–Kechris universality of the logic action and the Paolini–Shelah theorem are
owned by no roadmap, pull request, package or library. The target continues
CountableStructureSpaces in the same direction (the isomorphism relation on `StructureSpace L`,
compared across languages) and starts exactly where the base stops, so it is a Part II, not a new
design and not a duplicate. The suggested name is free.

The filed statement is already at the general level the sources support. The brief fixes three
generality points: Borel completeness quantified over relational languages is to be proved
equivalent to the quantifier over all countable languages through the graph translation; the
S∞-completeness characterisation is for Borel actions on standard Borel spaces; continuous
reductions are recorded as strengthenings where a source gives one.

## Sources

Fetched through the sources service, read, and cited by line in the brief:

- paolini-shelah-tfab (arXiv 2102.12371v6): Definitions 1.2–1.6, Remark 1.5, Fact 1.7,
  Convention 1.9 at lines 70–121; the Friedman–Stanley summary at lines 125–128; Main Theorem at
  lines 169–171 (a continuous reduction from graphs to torsion-free abelian groups).
- becker-kechris-bams (arXiv math/9304208v1): Borel embeddings and universality at lines
  126–131, Theorem 2.1 at line 132, Corollary 2.2 at lines 174–177 (the logic action on the
  language with one n-ary relation per n is a universal Borel S∞-space), proof sketches at lines
  222–262. An announcement: full proofs are in the 1996 book.
- camerlo-gao-boolean (AMS open archive): definitions and the equivalence with S∞-completeness
  at lines 79–110, the classical list at lines 111–118, Theorem 1 (atomic Boolean algebras, from
  graphs) at lines 405–553, the main theorem at line 555. The first fetch by citation failed
  because the AMS landing page is in no licence class; the PDF URL was fetched with
  `--licence-class publisher-open` after checking that Transactions back issues are in the AMS
  open archive.

Paywalled, recorded `uncertified` with DOI and locator, per the issue form's "cite by locator
only": friedman-stanley-1989 (10.2307/2274750), gao-idst (10.1201/9781584887942),
becker-kechris-1996 (10.1017/CBO9780511735264), kechris-cdst (10.1007/978-1-4612-4190-4),
hjorth-2000 (10.1090/surv/075), hjorth-kechris-1996 (10.1016/S0168-0072(96)00006-1), mekler-1981
(10.2307/2273227). Section and theorem numbers for these are from memory and so marked in the
manifest. A Project Euclid URL for Friedman–Stanley returned a blocked-request page, not the
paper; the service had recorded that fetch as certified, and the entry was corrected to
uncertified. No text is listed in `needs-references.toml`: the service's missing entries for the
paywalled works were replaced by uncertified manifest entries, and the file was removed.

## Why the verdict

- Not `merge-into`: no open target or design shares an object with it.
- Not `duplicate`: no roadmap or library owns any of its targets; the base and
  BorelEquivalenceRelations both name the material as belonging elsewhere.
- Not `design`: it is the continuation of CountableStructureSpaces, consuming its coding space,
  action and isomorphism relation and adding the next classical chapter.
- `part-ii`, name CountableStructureSpacesPartII, base CountableStructureSpaces.

## Points for the design

1. The base is still under review with blocking findings; consume only Layers 0–3, 4.1, 4.3 and
   6.2 and re-check names at its head.
2. Nothing infinitary exists at the pins; `Suggested.lean` must state every headline with Mathlib
   plus its own simple definitions, which is possible for all eight targets.
3. The Paolini–Shelah theorem and the torsion-abelian-group obstruction are stated targets whose
   proofs are out of reach here (an Annals paper; Ulm's theorem); keep them out of
   `Suggested.lean` unless their proofs are planned.
4. The two general reducibility lemmas (restriction; `≤_B` versus `≤_R`) belong naturally to
   BorelEquivalenceRelations §5.1; state them against its `BorelReducible` and mark them as
   upstream candidates.
5. Essentially countable relations are owned by no one; keep the contrast layer to what
   BorelEquivalenceRelations owns, or define the notion only with the remark that such relations
   are Borel.

Nothing suspicious was found in any fetched text or roadmap file.
