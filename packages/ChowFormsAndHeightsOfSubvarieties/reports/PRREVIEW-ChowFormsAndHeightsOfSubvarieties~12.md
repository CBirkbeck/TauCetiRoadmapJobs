# Review of ChowFormsAndHeightsOfSubvarieties (pull request #3027 at cd123f8)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ChowFormsAndHeightsOfSubvarieties/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 128 changed lines since `74a09b7`. It is accepted with three small corrections and one format note, none blocking; there is no finding. The changed passages (the origin, method and corollary labels of 5.1, 6.1 and 6.2, the routes, the Scope, the supplier contracts and the References) were checked against the readable sources at their locators and against HeightsRationalPointsAndObstructions §§5.17a.1, 5.9b.1 and 5.9b.2 at this head, and the values of the statements they touch were recomputed. Two corrections concern which proof the routes of 5.1 and 6.2 plan, and one the pull request's description, which does not say that this roadmap gains DiophantineApproximationAndTranscendence as a supplier. A human still has to settle two points: Bost–Gillet–Soulé could not be read, and the licence of the formal proof was not checked.

## C01 — The route of 6.2 deduces only the decomposition of (a7) from HeightsRationalPointsAndObstructions §5.9b.2, but the `*Corollary of:*` line and the Scope give all of (a7) to §5.9b.2, including the value and the bound of the height of `ℙ^{N−1}`

A reader cannot tell whether the value `½·Σ_{m=1}^{N−1} Σ_{k≤m} 1/k` and the bound `(N/2)·log N` are to be proved here (by Sombra's argument through HeightsRationalPointsAndObstructions §5.17f) or deduced from `projectiveSpaceHeight_value`. The route (line 427) reads "(a1)–(a7) and (b) are proved here, by these routes, except the decomposition of (a7), which is deduced from the general theorem". The `*Corollary of:*` line (lines 344–346) quotes the value and the bound and says "for (a7)"; the Scope (line 609) gives §5.9b.2 "the value and the bound of the height of `ℙ^{N−1}`"; and §5.9b.2 at this head states both in `projectiveSpaceHeight_value`. The overview (line 9) also says that Layer 6 "proves … its value on points and on the whole space".

A fix: "(a1)–(a6) and (b) are proved here, by these routes; (a7), with the value and the bound of the height of `ℙ^{N−1}`, is deduced from the general theorem that its `*Corollary of:*` line names (Conventions), and the routes written for it below are second proofs, as is that of the `*Method of the formal proof:*` label". In line 9, "deduces its value on the whole space" would replace "proves … on the whole space".

## C02 — The routes that 5.1 and the decomposition of (a7) call "second proofs" are the routes that HeightsRationalPointsAndObstructions gives for the general theorems

Under the convention of lines 33–35, a route that is not the deduction is a second proof, so an implementer reads 5.1 and (a7) as having two independent proofs, when the plan states one proof twice. In 5.1, the route of lines 83–86 is the route of HeightsRationalPointsAndObstructions §5.17a.1, step for step: multilinearity to reduce to a generated bundle, the Cartier recursion along a section whose divisor meets `𝒳` properly, and `‖s‖` replaced by `e^{−f}‖s‖`. In (a7), the route of lines 455–473 is the route of §5.9b.2: a finite extension to a free lattice, the point for `N = 1`, the recursion along a basis vector `u` onto `ℙ((J/Ku)^∨)` with the quotient metrics, the unitary invariance of `c_1^{N−1}`, `deĝ(J̄) = deĝ(J̄/u) − Σ_σ log ‖u‖_σ`, and induction on `N`. Only the Method labels describe a different proof, that of [FormalProof]. Line 75 would read "The route written here is that of HeightsRationalPointsAndObstructions §5.17a.1, recalled", and line 428 "the route written for it below is that of §5.9b.2".

## C03 — The pull request's description does not say that this roadmap gains a supplier

The README at the merge base does not name DiophantineApproximationAndTranscendence; this head has a contract "From TauCetiRoadmap.DiophantineApproximationAndTranscendence" (line 619) for §1.3a, the spherical height in which HeightsRationalPointsAndObstructions §5.9b.1 states the general theorem of 6.1, and §1.3a is itself a section this pull request adds. The description names the new suppliers of FiniteReductiveGroups, BaseChangeAndGaloisRepresentationsForUnitaryGroups, AdelicHeightsAndSuccessiveMinima and GluedTargetAndDivisionInequality, and of this roadmap says only that one sentence of §5.1 is corrected. A clause would do: "ChowFormsAndHeightsOfSubvarieties gains DiophantineApproximationAndTranscendence §1.3a (added here) as a supplier, through HeightsRationalPointsAndObstructions §5.9b.1, of which its 6.1 is a corollary".

## N01 — `Chow.properPushforward` (Exact supplier contracts, line 649) is in code font

SchemeAndStackFoundations §5.2 writes it in italics as a proposed name, and no declaration has that name at the pins. Write it the way that roadmap does.

## Previous findings

The previous review, of `c832fa9`, had no finding. The folder has not changed since that head, so its two small corrections and its format note stand unrepaired and are carried as C01, C02 and N01:

- C01 — not repaired: "(a1)–(a7) and (b) are proved here, by these routes, except the decomposition of (a7)" (line 427).
- C02 — not repaired: "The route written here is a second proof of the formula" (line 75).
- N01 — not repaired: "§5.2: `Chow.properPushforward`, with the residue-degree weights" (line 649).

## Verified sound

| Statement | Instances tried | Values computed (this side / other side) | Result |
|---|---|---|---|
| 5.1 against HeightsRationalPointsAndObstructions §5.17a.1; Check on `ℙ¹_ℤ` | `L̄_0` trivial, `f = |x_0|²/‖x‖²`, `L̄_1 = Ō(1)`; `f = t` | `∫ f·c_1 = ½` by the symmetry `f_0 + f_1 = 1`, `∫ c_1 = 1`; `f = t` gives `[K:ℚ]·t·deg` on both sides | same statement; holds |
| 5.1 Origin against CL10 1.2.5, (1.2.6), (1.3.10), 1.3.12 and CLT09 Théorème 1.4, §2 | recursion with `∫ log‖s_k‖^{−1}·c_1⋯c_1`; trivial bundle `‖1‖ = e^{−φ}` | CL10 lines 228–251, 610–615, 628–640; CLT09 lines 220–227, 414–415, 503 | supports the label |
| 6.1 identity against Soule91 Théorème 3, p. 366, and §5.9b.1 | `[1:1] ∈ ℙ¹(ℚ)`; `d = n = 1`, `Z = ℙ¹` | `½log 2` against `(½log 2 − ½) + ½`; `½` against `−½ + 1`; Soulé: constant `(n+1)·½·Σ_{j≤N} 1/j·[k:ℚ]·deg`, unnormalised | holds; agrees |
| 6.1 (iii) against Philippon91 Théorème 2, p. 256, and Corollaire 4, p. 272 | sign and constant | source: `m(ϱ_u(f)/f) = ∫ log(|U_0|/‖x‖)·Ω^{r−1} + Σ_{α≤n} 1/(2α)·deg V`; README: `m(F) = m(F(s,·)) − ∫ log‖s‖·c_1^d − ½H_n·deg` | same identity |
| 6.1 (i) against Philippon91 §2, p. 266 | `u_0 = (1, 0, …, 0)`, `V ⊄ {X_0 = 0}` | source lines 552–556: specialising one argument gives an elimination form of the section; README: over `K`, every `s` with `Z ⊄ H_s` | "adapted" is right |
| 6.2 (a7) against §5.9b.2 and Sombra05 Théorème 0.1, §3 | `N = 1, 2, 3` | value `0, ½, 5/4 = (N/2)(H_N − 1)`; bound `0, 0.693, 1.648`; Sombra lines 432–446: `h(ℙ^n) < (n+1)μ_1 = ((n+1)/2)·log(n+1)`, upper half of (3.1) | holds; route role unclear: C01 |
| 6.2 (a4), (a5), (a7) together | `N = 1`; `J̄(t)` | `N = 1`: point height `−deĝ_n(J̄^∨) = deĝ_n(J̄)`, `h(ℙ⁰) = 0`; `J̄(t)`: both sides of (a7) grow by `N·t` | consistent |
| 6.2 (b), whole-space Check | `ℤ²`, Gram `[[2,1],[1,3]]`; `ℚ(i)`, `det G = 23` | `½ − ½log 5 = −0.3047` both sides; `−1 − ½log 23 + 9/4 = −0.3177 = −½log 23 + 5/4`; `Σ_{m≤2} H_m = 5/2 = 3·H_2 − 2` | holds |
| DiophantineApproximationAndTranscendence §1.3a against the contract of line 621 | normalisations | both: largest coefficient at `𝔭`, `toSphere` normalised by `2N·vol(ball)`, division by `[K:ℚ]` | agree |

- Source locators checked against the text: 14 locators in 5 sources (Philippon91 lines 88–90, 552–556, 866–868; Soule91 lines 412–413, 529; CL10 lines 228–251, 610–615, 628–640; CLT09 lines 220–227, 315, 414, 503; Sombra05 lines 259, 432–446, 518), and GS90 Theorem 4.2.3 located (line 1827). Sombra05 line 442 confirms Lemma 3.3.1 of Bost–Gillet–Soulé as the height of `ℙ^n`, and line 518 its Proposition 4.1.2.
- Library declarations opened at the pins: `Polynomial.gaussNorm_mul` (`Mathlib/RingTheory/Polynomial/GaussNorm.lean:277`), `AlgebraicGeometry.AlgebraicCycle` (`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44`), `Polynomial.mahlerMeasure` (`Mathlib/Analysis/Polynomial/MahlerMeasure.lean:81`), `MeasureTheory.Measure.toSphere` (`Mathlib/MeasureTheory/Constructions/HaarToSphere.lean:52`), `TauCeti.height2` and `TauCeti.arakelovLogHeight` (`TauCeti/NumberTheory/Height/Arakelov/Basic.lean:65, 127`), `ChowGroup` (`TauCeti/AlgebraicGeometry/Chow/Basic.lean:295`).
- Cross-roadmap citations resolved at this head: HeightsRationalPointsAndObstructions §§5.9b, 5.9b.1, 5.9b.2, 5.17a, 5.17a.1, 5.17b, 5.17f; DiophantineApproximationAndTranscendence §1.3a; ComplexComparisonPartII C5.4 (`AnalyticCycleIntegration`, `lelongPoincareSection`, `chernFubiniStudyIntersection`) and ComplexKahlerGeometry K7.2, both changed since the previous review and still as cited; SchemeAndStackFoundations §§3.5, 5.2; the family index entry.
- Merge base against head: Layers 5 and 6 and sections 5.1, 6.1 and 6.2 keep their ids and statements; 6.2 (a) keeps the formula of its height and now names §5.9b.2 as its definition; no Lean declaration changed.
- Changes outside the folder: every other changed folder is one of this pull request's own; nothing changes outside the roadmap tree.
- Dependency check: `depcheck: 131 roadmaps, 1463 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: the worker's run passed every check. Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no message; the file declares nothing, so there is no signature to compare and no one-tactic probe to run, and its docstring names the three headlines as not statable with what each lacks.
- Overlap check: read HeightsForLogSingularMetrics, SlopesOfHermitianVectorBundles, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, MultiplierIdealsOfPairsAndPointSeparation (at this head), HeightsRationalPointsAndObstructionsPartII (open, as read for the previous review) and HeightsRationalPointsAndObstructions at this head. HeightsRationalPointsAndObstructions owns the change-of-metric formula, the comparison identity with Philippon's archimedean identity, and the height in `ℙ(J^∨)` with (a7); DiophantineApproximationAndTranscendence §1.3a and SlopesOfHermitianVectorBundles §6.6 own the spherical heights; this roadmap cites each. Nothing else is shared.

Source independence: changed passages only. Eight passages were compared with five sources: the Origin labels of 5.1, 6.1 and 6.2 and the References entries of Philippon, Soulé, Chambert-Loir–Thuillier, Chambert-Loir and Sombra, against Philippon91 lines 88–90, 552–556 and 866–868, Soule91 lines 412–413 and 529, CL10 lines 228–251 and 628–640, CLT09 lines 220–227 and Sombra05 lines 432–446. Nothing is shared beyond what the mathematics forces. The largest share is tied: BGS94 (unreadable) and Philippon91, 10 of about 34 mentions each. The arrangement was not compared, since no layer is added, removed or reordered.

Research link: 6.1 compares the Arakelov height of a projective cycle with Philippon's spherical height of its Chow form (Soulé 1991, Théorème 3; Philippon 1991, Théorème 2; Bost–Gillet–Soulé 1994). 6.2 (a7) is the height of projective space with Sombra's (2005) bound from successive minima. The line rests on the README's References and on Soule91, Philippon91 and Sombra05 as read.

## Not verifiable

- BGS94 (Proposition 3.2.1 (iv), (3.2.2), Lemma 3.3.1, §4.1, Proposition 4.1.2, (4.1.4), Theorem 4.3.2, (4.3.12), Theorem 4.3.8): no legal copy in the sources cache or through the sources service (an AMS host it does not classify). Only Lemma 3.3.1 and Proposition 4.1.2 are confirmed, at second hand, by Sombra05 lines 442 and 518.

## Source issues

- none

## For the human reviewers

- Not tested: BGS94 shares the largest number of source mentions (10 of about 34, with Philippon91) and could not be read. Its locators and wording were not compared, apart from two numbers that Sombra05 restates.
- The convention on corollaries (README lines 28–35) keeps in the family, with their own routes, statements that a general roadmap now owns: 5.1, the identity of 6.1 and the decomposition of (a7) are those of HeightsRationalPointsAndObstructions §§5.17a.1, 5.9b.1 and 5.9b.2.
- [FormalProof] (README line 668) is an external formalisation; its licence was not checked.
