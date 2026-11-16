# Review of ExceptionalThetaCorrespondencesForG2 (pull request #1736 at ad25a73)

**Verdict:** needs changes

Incremental re-review of the 18 lines changed since 496ccde (README lines 49, 51, 53, 63, 578, 589, 696 and 1626), the one finding of the previous report, the gate, the elaboration, and the pull request's title and description read against this head. The previous finding is repaired and the description needs no change. One locator in a changed sentence is stale at the merged Tau Ceti pin.

## R01 (P3) — The line number of `TauCeti.D4Tripled.groupScheme` is one short at the merged pin

**Location:** `TauCetiRoadmap/ExceptionalThetaCorrespondencesForG2/README.md` line 51: “the integral Kostant toral-closure carriers in TauCeti/Algebra/Lie/E7/Minuscule/Carrier.lean:188, TauCeti/Algebra/Lie/E6/Minuscule/GroupScheme.lean:109 and TauCeti/Algebra/Lie/D4/Tripled/GroupScheme.lean:119”.

**Claim:** the three carriers are declared on lines 188, 109 and 119 of those files at the pinned Tau Ceti.

**Witness:** at the pin of this head (Tau Ceti 2fd255d) `noncomputable abbrev groupScheme` is on line 120 of TauCeti/Algebra/Lie/D4/Tripled/GroupScheme.lean; line 119 is the second line of its docstring. It was line 119 at the pin of 496ccde (358314d). The other two are on 188 and 109.

**Repair:** in line 51 replace `TauCeti/Algebra/Lie/D4/Tripled/GroupScheme.lean:119` by `TauCeti/Algebra/Lie/D4/Tripled/GroupScheme.lean:120`. The same sentence's other five locators (Triality/Basic.lean:155, GraphAutomorphism.lean:479, ShortRoot/Basic.lean:173, Serre.lean:267, and the two above) need no change.

## Previous findings

- R01 — repaired: the description now reads “`Suggested.lean` states no declaration: no headline theorem is statable at the pinned Mathlib and Tau Ceti” and “the targeted Lake build succeeds with no warning (the file has no declaration and no `sorry`)”.

The repair introduced no new problem.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Line 49: `TauCeti.Algebra.exists_isSplittingField_isSeparable_finrank_eq_deg`, “a finite-dimensional central division algebra has a separable splitting subfield of degree deg D” | D=ℍ over ℝ; D=K; cubic division D over p-adic F | Pin: `[DivisionRing D] [Algebra.IsCentral K D] [FiniteDimensional K D]`, gives L, L→D, separable, finrank = deg, splitting. ℍ: L=ℂ, 2=2, ℂ⊗ℍ≅M₂(ℂ). K: 1=1. Cubic: 3=3 | agrees; old name absent at the pin | none |
| §2.2 proof route, line 578: D split by a subfield L of degree n, then n·inv_F(D)=0 | n=3, inv_F(D)=1/3; n=2, inv=1/2; E of degree n | inv_L(res D)=n·inv_F(D): 3·(1/3)=1≡0; 2·(1/2)=1≡0; the cited theorem supplies L with its embedding and degree, as used | agrees | none |
| Line 51: Jordan identity is the `IsCommJordan` instance, Jordan.lean:71, “over the same rings” | A=E₁, B=E₂; A=B=E₁; ring hypotheses | Pin line 71: `instance : IsCommJordan (AlbertAlgebra R)` under `[CommRing R] [Invertible (2 : R)]`. (A∘B)∘A²: 0 and 0; E₁ and E₁ | agrees | none |
| Line 63 and §10.1 line 1626: the Jordan identity no longer drawn from LieHighestWeight Layer 8 | every mention of “Jordan identity” in the README | 2 mentions (lines 51, 1626), both the pinned instance; line 63 now lists Lie models, positive real octonions, compact Albert algebra only | consistent | none |
| Line 51: locators of the native carriers and symmetries | 7 line numbers against the pin | 188, 109, 155, 479, 173, 267 match their declaration lines; D4 `groupScheme` is on 120, README says 119 | one stale | R01 |
| Line 53: `TauCeti.IsSmoothDiscrete`, `TauCeti.SmoothDiscreteTopRep` at SmoothDiscrete/Basic.lean:259,656 | both lines at the pin | 259: `structure IsSmoothDiscrete (X : TopRep R G) : Prop`; 656: `abbrev SmoothDiscreteTopRep`, full subcategory of `TopRep` | agrees | none |
| Description against the head | title; folder sentence; validation sentence; summary block | adds a roadmap: both; 0 declarations, 0 `sorry`: both; no-warning build: reproduced; the dichotomy, Howe duality, trichotomy and global headings the summary names exist (§§6.7, 8.3, 8.8, 10.4–10.6) | agrees | none |

The rows for the untouched statements stand as in the previous review, of 496ccde.

- Library declarations opened at the pin (Tau Ceti 2fd255d): all 31 backticked `TauCeti.*` declaration names of the README resolve in the files it names; 9 line-numbered locators compared, 8 exact, 1 stale (R01).
- Source locators: the diff adds or changes none; no target of the seeded sample falls in a changed passage.
- Cross-roadmap citations in the changed passages: RepresentationTheory/LieHighestWeight Layer 8, QuadraticFormInvariants §7B, ClassFieldTheory Layers 5–6, ReductiveGroups Layers 3 and 9, all on main; none added, one use of LieHighestWeight Layer 8 (the Jordan identity) removed in favour of the pin.
- Dependency check: `depcheck: 234 roadmaps, 2233 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Gate at ad25a73: every check 0, OK, build included in the worker's run. Elaboration of `Suggested.lean`: no output (no error, no warning; the file has no declaration, so the `#check` comparison and the one-tactic probe have nothing to act on).
- Files changed outside the folder against the base: none (the paths listed since 496ccde come from the merge of main). No Lean statement, heading, layer or supplier changed.
- Overlap check: read AutomorphicLFunctionsAndLocalFactorsPartII, MetaplecticAutomorphicForms, TwistedAutomorphicDescents, GanGrossPrasadUnitaryGroups, ModularityAndLanglandsExtensions, SmoothRepresentationsOfLocalGroups, LieHighestWeight as listed for this head (no dropped id, no second copy, no conflicting head); nothing shared by the changed passages; the split Albert Jordan identity is now cited from the pinned Tau Ceti instead of a roadmap.
- Source independence: 5 passages compared, changed passages only, with 0 sources (none cites or restates a source; the one restated library docstring shares a forced statement of under a dozen words); largest share GS, as in the previous review; contents not compared again, since the diff adds, removes or reorders no layer.

## Not verifiable

- HPS, GS05 (waived) and Var (uncertified): the diff does not touch the targets that cite them.
- The description's sentence on AI assistance (rounds of review on the job board) describes the process, not the head, and was not checked.

## Source issues

- none

## For the human reviewers

- none
