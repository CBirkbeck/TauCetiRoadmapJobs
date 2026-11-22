# Review of BaseChangeAndGaloisRepresentationsForUnitaryGroups (pull request #2890 at 210ed5d)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BaseChangeAndGaloisRepresentationsForUnitaryGroups/`
**Verdict:** accepted

**Summary.** Accepted: this was an incremental re-review of the 113 lines changed since `fd447f4`, and no finding remains. The three new statements (10.0a, 13.0a, 14.0a), the theorem on units in the route of 10.29a, the existence sentence for `r_{ℓ,ι}(π)` in the conventions and the forms of the formal proof added at 14.1, 15.1, 15.2 and 16.1 were each computed on small cases or read against the cited declaration, and they hold as written. There are four small corrections (14.0a is stated for totally complex fields only; the three published results name no publication; the description leaves out what this change adds; the family index still omits `src/`) and no format note. Three questions are left for the human reviewers (scope, licence, and a new section of the family index that sets a rule for reviews).

## C01 — 14.0a is stated for totally complex number fields, with no reason given for the restriction

In 14.0a (line 698) the statement begins "For a totally complex number field `E` and a cuspidal automorphic representation `π` of `GL_n(𝔸_E)`". The hypothesis is that of the formal declaration (`GlobalTheory.Published.GelfandKazhdanDual` carries `[IsTotallyComplex E]`), and 14.1 only uses it over a CM field, so nothing stated here is wrong. But the result is not special to such fields: for `n = 1` the functions `g ↦ χ(g⁻¹)` are `χ⁻¹ = χ^∨` over every number field, and the usual argument (the local statement `π_v∘(ᵗ·⁻¹) ≅ π_v^∨` at each place, then multiplicity one) does not use the absence of real places. A reader takes the restriction for a hypothesis the theorem needs.

It would be enough to state 14.0a for a number field and add that the form of the formal proof is the totally complex case; or, if the restriction is meant, to say in a clause why.

## C02 — The three statements marked as published results cite no publication

10.0a (line 106), 13.0a (line 554) and 14.0a (line 701) are each marked *KNOWN* with an author's name only ("Brauer", "Radford", "Gelfand–Kazhdan") and a file of the formal proof; the References have no entry for any of the three, and "*Route.* Not given here" leaves an implementer with the Lean file as the only place to look. For 10.0a the name also hides a step: Brauer's induction theorem (InductionRestriction Layer 6; `TauCeti.ClassFunction.indVirtualCharacters_eq_virtualCharacters_isElementary` at the pin, `TauCeti/RepresentationTheory/Induction/Brauer/Induction.lean` line 82) gives combinations of `Ind_H^G χ`, and the degree-zero form with the differences `Ind_H^G χ − Ind_H^G 1` is a further deduction.

Add a reference with a locator for each (I did not open candidates, so I name none as required), and it would help to list InductionRestriction Layer 6 as what 10.0a needs.

## C03 — The description does not say what this change adds

The description is the text written for an earlier head. It leaves out: that the roadmap now states and owns three published results (10.0a Brauer's theorem in degree zero, 13.0a the shuffle algebra as a polynomial algebra on the Lyndon words, 14.0a the contragredient by transpose-inverse); that GL2AutomorphicRepresentationsAndTransfer §R16.1.7 (on main) is a new supplier, for the theorem on units in 10.29a; and that the family index has a new section, "When a roadmap is wrong", which it describes only as listing "the sub-roadmaps in merge order".

A sentence for each would do, for example: "The roadmap also states three published inputs of the formal proof (10.0a, 13.0a, 14.0a) and cites GL2AutomorphicRepresentationsAndTransfer §R16.1.7 for Chevalley's theorem on units. The family index has a section on what a contribution may do where a roadmap is wrong."

## C04 — The family index still sends the reader to the first commit without `src/`

The roadmap's own References now say that the paths are relative to `src/` of the first commit and link to that directory, which settles the matter for this roadmap. The sentence of `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md` (line 19), "they are to be looked up at that first commit", and its link to the root of that commit are unchanged. Adding "under its directory `src/`" there would finish it.

## Previous findings

- The previous report, of `fd447f4`, has no finding (R01, …). Its one small correction, C01 (paths of the formal proof resolve only under `src/`): partly repaired: References, line 1181, "The file paths given above are relative to the directory `src/` of the first commit of that repository"; the family index's sentence is unchanged (C04).

## Verified sound

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| 10.0a Brauer in degree zero | `G = 1`; `G = C₂`, `ρ` regular; `G = S₃`, `ρ` standard | `0 = 0`; `sgn − 1 = Ind_G^G(sgn − 1)`; `ρ − 2 = Ind_{C₃}(ω − 1) + (sgn − 1)` since `Ind_{C₃}1 = 1 + sgn` | holds; matches `BrauerDegreeZero` (finite `G`, complex `ρ`, integer coefficients) |
| 13.0a shuffle algebra on Lyndon words | empty alphabet; one letter, characteristic 0 and `p` | `K`, no generators; `a^{ш n} = n!·aⁿ`, so `≅ K[a]` in char 0; `a^{ш p} = 0` in char `p` | holds; characteristic zero needed and stated; matches `RadfordShufflePolynomial` (`Field`, `CharZero`, `LinearOrder`) |
| 14.0a contragredient by transpose-inverse | `n = 1`, any number field | `g ↦ χ(g⁻¹) = χ⁻¹ = χ^∨` | holds; formal form has `IsTotallyComplex`; restriction not needed (C01) |
| 10.29a route, theorem on units | `E = ℚ`, `m = 2`: `b = 1`, `b = 3`, `b = 2`; `m = 1` | `a = 3`: unit `≡ 1 (3)` is `1 = 1²`; `a = 1, 2` fail (`−1`); `b = 3`: `a = 4`; `b = 2`: `a = 3`; `m = 1`: `a = 1` | holds; `a` generating `𝔪 ∩ ℤ` lies in `𝔪`, prime to `b` as `𝔪` avoids `T`; R16.1.7 modulus has empty infinite part |
| Conventions: `r_{ℓ,ι}(π)` exists, unique, de Rham with weights `a_{τ,i} + n − i` | AG2.3, AG2.0, AG2.6 read on main | AG2.3: every CM field, `ℓ`, `ι`, unique semisimple; AG2.6: de Rham, `HT_τ = {a_{τ,i}+n−i}`, crystalline if spherical | as cited |
| 14.1, bound `n = 1` or `p > 16n²` | `IsQpBig`, `AwayB.tame0`, `Row0`, `Row0b` | `IsQpBig`: `n = 1 ∨ 16n² < g`; `Row0` (plain `IsQp`) proved, `Row0b` derived from it | as stated, including "also without that bound" |
| 15.1, form the family uses | `AboveB` | fields `crys`, `nice`: (`IsQpBig` ∧ tame ∧ squarefree) ∨ sum of characters, `N = 0` | the two cases the README lists |
| 15.2 weight symmetry | `PropsB.weights_conj`; `n = 1`, `w = 0` | `HT(τ∘c) = (HT τ).map (wt − ·)`; `n = 1`: `{−h}`, `wt = w + n − 1 = 0` | agrees |
| 16.1 weak base change of the formal proof | `E⁺ = ℚ`; fields of `IsBaseChangeN` | no CM `E/ℚ` unramified at all finite places, and `[E⁺:ℚ]` even by the product formula for `η(−1)`; fields `pos`, `discrete`, `csd`, `sub`, `unram`, `inert`, `split`, `weight` | consistent with `[E⁺:ℚ] ≥ 2` of §6.29; each clause of the paragraph has its field |

The rows for untouched statements stand as in the previous review, of `fd447f4`.

- Source locators checked against the text: 12 files of the formal proof opened at its first commit under `src/` (all ten paths the diff adds, plus two imports); every declaration the diff names exists there with the stated content: `BrauerDegreeZero`, `RadfordShufflePolynomial`, `GelfandKazhdanDual`, `Row0b`, `AboveB`, `PropsB`, `BaseChangeIsobaricN`, `IsBaseChangeN`, `CsdAsc`, `baseChangeN`, `galoisRepresentations_of_thetaLift`, `GeoOne`, `CstSmooth`, `HTBij`.
- Seeded sample: 10.0a, 14.0a, 14.1, 15.1, 15.2 and 16.1 fall in changed passages and are in the table; the other targets are untouched.
- Library declarations opened at the pin: `TauCeti/RepresentationTheory/Induction/Brauer/Induction.lean` line 82 (Brauer induction; no degree-zero form at the pin); no shuffle algebra or Lyndon word in Mathlib or Tau Ceti at the pins.
- Cross-roadmap citations resolved on main: GL2AutomorphicRepresentationsAndTransfer §R16.1.7 (line 309); AutomorphicGaloisRepresentationsPartII AG2.0, AG2.2, AG2.3, AG2.6 by title; EndoscopicTransferAndUnitaryTraceComparison §6.29 (line 2561).
- Dependency check: `depcheck: 1 roadmaps, 14 edges, 0 problem(s)`; no UPWARD or CYCLE line. GL2AutomorphicRepresentationsAndTransfer is on main.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output; unchanged since `fd447f4`: single `import Mathlib`, no declaration, no `sorry`, no `set_option`; no signature to compare and no one-tactic probe to run. The automatic checks all passed.
- Nothing outside the folder and the family index changed. The index gained the section "When a roadmap is wrong"; its entry for this roadmap is unchanged.
- Headlines: unchanged; 10.0a, 13.0a and 14.0a are inputs, not headlines.

Overlap check: read LocalFactorsOfTwistsAndTypes, HeckeIdealsAndTaylorWilesRelations, CongruenceModulesOfThetaLifts, ThetaKernelsForUnitaryDualPairs, UniformWildKernelBounds (open) and AutomorphicGaloisRepresentationsPartII, EndoscopicTransferAndUnitaryTraceComparison, PotentialAutomorphyInfrastructurePartII (main); nothing shared in the three new statements. Owners: Brauer induction, InductionRestriction Layer 6, with the degree-zero form here (10.0a); Lyndon words are defined in the open CombinatoricsOfWords, which has no shuffle algebra, so 13.0a is owned here; the transpose-inverse contragredient (14.0a) is owned here (GanGrossPrasadUnitaryGroups §2.1a is the local criterion for distributions, another statement). Objects shared before the change keep their owners as in the previous report.

Source independence: changed passages only: 10 passages compared with 1 source ([FormalProof], 12 Lean files) and with the cited sections of 3 roadmaps on main; the source is Lean code and no wording is shared; the paragraph of 16.1 lists the clauses of one formal structure in its order of fields, in the roadmap's own words (reported to the humans); largest share [FormalProof], as in the previous report; the arrangement was not compared again (items added, no layer added, removed or reordered). Kudla 1994, Harris–Kudla–Sweet 1996 and Labesse 2011 could not be read.

Research link: Layer 10 is the explicit depth-zero local Langlands correspondence (Henniart 1992; Bushnell–Henniart 2005) with Kottwitz's 1986 matching extended to functions from the residue field; Layers 14–16 apply Caraiani's and Labesse's (2011) results to definite unitary groups. Rests on the README; the family index says the family follows an unpublished formal proof.

## Not verifiable

- The outline of the formal proof's own construction of `r_{ℓ,ι}(π)` (Layer 14, lines 673–694): the four declarations it names were opened; the outline's steps (the fixed-point formula, the congruence relation, the weight families, the theta lifts, the patching) lie in files not opened.
- `AscEmb`, `infOfWeight`, `HasSatAt` and `LacWtAt` of the formal proof were not unfolded; the paragraph of 16.1 was compared with `IsBaseChangeN` field by field at the level of names and types.
- Publications for 10.0a, 13.0a and 14.0a: the README cites none, so none was opened (C02).
- The items of the previous report (Kudla 1994, Harris–Kudla–Sweet 1996, Labesse 2011, the published numbering of Caraiani–Scholze, the steps of 13.8a not given) stand as they were.

## Source issues

- none

## For the human reviewers

- Scope: the family index says the family follows a formal Lean proof of the Riemann hypothesis announced on 20 November 2026; I found no refereed source for it. Targets 10.33c, 10.33d, 13.8a and 15.1 cite no literature besides it.
- Licence: the README cites file paths and declaration names of that proof's repository, published without a licence; no code is reproduced. The new paragraph of 16.1 (lines 1004–1017) renders one formal structure clause by clause in prose.
- Governance: the family index's new section "When a roadmap is wrong" (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 45–75) says what a review of a library contribution may not block. Whether a roadmap index sets that rule is yours to decide.
