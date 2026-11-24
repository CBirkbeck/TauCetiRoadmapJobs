# Review of ChowFormsAndHeightsOfSubvarieties (pull request #3027 at c832fa9)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ChowFormsAndHeightsOfSubvarieties/`
**Verdict:** accepted

**Summary.** This is a re-review of the 62 lines changed since `71bbefa`. It is accepted with two small corrections and one format note, none blocking. The earlier finding is repaired. HeightsRationalPointsAndObstructions §§5.17a.1, 5.9b.1 and 5.9b.2 are now the single owner of the change-of-metric formula, of the comparison identity and of the height of cycles in `ℙ(J^∨)`, and 6.2 (a) takes its height from §5.9b.2. The new origin of 6.1 (i) (Philippon 1991, §2, p. 266) and the corrected account of Soulé's 3.7 agree with the sources. The two small corrections are about which proof the routes plan. The route of 6.2 says that only the decomposition of (a7) is deduced from §5.9b.2, although its `*Corollary of:*` line also covers the value and the bound. The "second proofs" of 5.1 and of that decomposition are the supplier's own routes. A human still has to settle two points: Bost–Gillet–Soulé could not be read, and the licence of the formal proof was not checked.

## C01 — The route of 6.2 deduces only the decomposition of (a7) from HeightsRationalPointsAndObstructions §5.9b.2, but the `*Corollary of:*` line and the Scope give all of (a7) to §5.9b.2, including the value and the bound of the height of `ℙ^{N−1}`

A reader cannot tell whether the value `½·Σ_{m=1}^{N−1} Σ_{k≤m} 1/k` and the bound `(N/2)·log N` are to be proved here (by Sombra's argument through HeightsRationalPointsAndObstructions §5.17f) or deduced from `projectiveSpaceHeight_value`. The route (line 427) reads "(a1)–(a7) and (b) are proved here, by these routes, except the decomposition of (a7), which is deduced from the general theorem". The `*Corollary of:*` line (lines 344–346) quotes the value and the bound and says "for (a7)". The Scope (line 609) gives §5.9b.2 "the value and the bound of the height of `ℙ^{N−1}`". At this head, §5.9b.2 states both in `projectiveSpaceHeight_value`. The overview (line 9) also says that Layer 6 "proves … its value on points and on the whole space".

A fix: "(a1)–(a6) and (b) are proved here, by these routes; (a7), with the value and the bound of the height of `ℙ^{N−1}`, is deduced from the general theorem that its `*Corollary of:*` line names (Conventions), and the routes written for it below are second proofs, as is that of the `*Method of the formal proof:*` label". In line 9, "deduces its value on the whole space" would replace "proves … on the whole space".

## C02 — The routes that 5.1 and the decomposition of (a7) call "second proofs" are the routes that HeightsRationalPointsAndObstructions gives for the general theorems

Under the new convention (lines 33–35), a route that is not the deduction is a second proof. An implementer therefore reads 5.1 and (a7) as having two independent proofs, when the plan states one proof twice. In 5.1, the route of lines 83–86 is the route of HeightsRationalPointsAndObstructions §5.17a.1 (its line 2817), step for step: the reduction by multilinearity to a generated bundle, the Cartier recursion along a section whose divisor meets `𝒳` properly, and `‖s‖` replaced by `e^{−f}‖s‖`. In (a7), the route of lines 455–473 is the route of §5.9b.2 (its line 2522): a finite extension to a free lattice, the point for `N = 1`, the recursion along a basis vector `u` onto `ℙ((J/Ku)^∨)` with the quotient metrics, the unitary invariance of `c_1^{N−1}`, `deĝ(J̄) = deĝ(J̄/u) − Σ_σ log ‖u‖_σ`, and induction on `N`. The only change is that the spherical mean is cited from SlopesOfHermitianVectorBundles §6.6 (vi) instead of §5.9b.1. Only the Method labels describe a different proof, that of [FormalProof]. Line 75 would read "The route written here is that of HeightsRationalPointsAndObstructions §5.17a.1, recalled", and line 428 "the route written for it below is that of §5.9b.2".

## N01 — `Chow.properPushforward` (Exact supplier contracts, line 649) is still in code font

SchemeAndStackFoundations writes it in italics as a proposed name, and no declaration has that name at the pins. Write it the way that roadmap does.

## Previous findings

- R01 — repaired: "Those general theorems, and the height of cycles in `ℙ(J^∨)` that 6.2 (a) uses, belong to the roadmap that states them" (line 607); 6.2 (a): "`projectiveCycleHeight_J̄` is the height of HeightsRationalPointsAndObstructions §5.9b.2" (line 360).
- C01 — repaired: "Soulé (1991, 3.7, p. 369) remarks that the identity also follows from Philippon's Théorème 2 …; the recursion written here gives such a deduction" (lines 165–167), and the References entry (line 664) matches.
- C02 — partly repaired: the convention (lines 28–35) and the routes of 5.1 and 6.1 now say which proof is the second one; the route of 6.2 (line 427) excepts only "the decomposition of (a7)". Carried as C01.
- C03 — repaired: "(i) is adapted from Philippon (1991), §2, p. 266 … (ii) for integral `s` is particular to this proof" (lines 112–114).
- C04 — repaired: "… divided by `[K:ℚ]`), which agrees with the spherical height `ht` of SlopesOfHermitianVectorBundles §6.6" (line 621).
- N01 — not repaired: "§5.2: `Chow.properPushforward`, with the residue-degree weights" (line 649). Carried as N01.

## Verified sound

| Statement | Instances tried | Values computed (this side / other side) | Result |
|---|---|---|---|
| 6.1 (i) against Philippon91 §2, p. 266 (lines 552–556) | conic `X_1² = 2X_0X_2`, `F = z_1² − 2z_0z_2`; `s = e_0` (Philippon's `u_0`) and `s = e_1` | `F(e_0, v)/v_2² = 1` (section `2·[0:0:1]`); `F(e_1, v)/(v_0v_2) = 2` (section `[1:0:0] + [0:0:1]`) | supports "adapted: over `K`, every `s`" |
| 6.1 route, Soule91 3.7 (line 529) and Théorème 3 (line 412, p. 366) | wording of the remark; reference [18] | source: one sentence, a consequence of Philippon's Théorème 2 ([18], the 1989 preprint); README: "remarks that the identity also follows" | agrees |
| 6.1 identity against HRPO §5.9b.1 with the height of DAT §1.3a | `[1:1] ∈ ℙ¹(ℚ)` | height `½log 2 = 0.3466`; `ht = ½log 2 − ½ = −0.1534` (Monte Carlo −0.1523); difference `½ = c(0,1)` on both sides | holds |
| DAT §1.3a against Slopes §6.6 (C04 repair) | normalisations; `u_0 + u_1` over `ℚ` | both: largest coefficient with ideal-normalised `|·|_𝔭`, `toSphere/(2N·vol B)`, `1/[K:ℚ]`; `ht = −0.1534` in both | agree |
| 5.1 against HRPO §5.17a.1 (C02) | `ℙ¹_ℤ`, `L̄_0` trivial, `f = |x_0|²/‖x‖²`, `L̄_1 = Ō(1)` | `∫ f·c_1 = ½` (Monte Carlo 0.4995) on both sides; route sentences of README lines 83–86 and HRPO line 2817 coincide step by step | same statement and route: C02 |
| 6.2 (a) against HRPO §5.9b.2's definition | `[1:2]` in `Ō_ℚ²`; `N = 1`, `J̄ = (ℤ, e^{−c}|·|)` | `½log 5 = 0.8047` on both sides; point height `c = deĝ_n(J̄) = −deĝ_n(J̄^∨)` (README (a5), HRPO Check) | identical |
| 6.2 (a7): `*Corollary of:*` line against the route (C01) | `N = 1…5` | value `0, ½, 5/4, 13/6, 77/24` (equal to `(N/2)(H_N − 1)`); bound `0, 0.693, 1.648, 2.773, 4.024`; HRPO: bound from `H_N ≤ 1 + log N`; README route: §5.17f | values agree; route role unclear: C01 |
| 6.2 (b), whole-space Check | `ℤ²`, Gram `[[2,1],[1,3]]` | both sides `½ − ½log 5 = −0.3047` | holds |

The rows for statements the change does not touch stand as in the previous review, of `71bbefa`.

- Source locators checked against the text: 3 locators in 2 sources. Philippon91 §2, p. 266 (lines 528–556); Soule91 Théorème 3, p. 366 (line 412), and 3.7, p. 369 (line 529).
- Cross-roadmap citations resolved at this head: HeightsRationalPointsAndObstructions §§5.9b.1, 5.9b.2 and 5.17a.1, with its Scope (line 64); DiophantineApproximationAndTranscendence §1.3a; SlopesOfHermitianVectorBundles §6.6; the citations of this roadmap in ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (§§8.18, 8.18e) and HeightsForLogSingularMetrics (§§0.4, 4.3b). A search of every README finds the Crofton formula, 6.1 (i) and 6.2 (b) stated nowhere else, so the Scope's "this roadmap's alone" holds.
- Merge base against head: both layers and all three sections keep their statements; no layer is removed or retitled; no Lean declaration changed; the pins have not changed since `71bbefa`.
- Changes outside the folder: every one of the 93 folders that `origin/main...HEAD` changes is one of this pull request's own.
- Dependency check: `depcheck: 131 roadmaps, 1467 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: the worker's run passed every check. A rerun flags only the changed files of the pull request's other roadmap folders.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no message. The file declares nothing, and its docstring (unchanged) is still accurate at the unchanged pins.
- Overlap check: read HeightsForLogSingularMetrics, SlopesOfHermitianVectorBundles, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, MultiplierIdealsOfPairsAndPointSeparation (at this head), HeightsRationalPointsAndObstructionsPartII (open), and HeightsRationalPointsAndObstructions at this head. HeightsRationalPointsAndObstructions owns the change-of-metric formula, the comparison identity with Philippon's archimedean identity, and the height in `ℙ(J^∨)` with (a7), and this roadmap cites it. DiophantineApproximationAndTranscendence §1.3a and SlopesOfHermitianVectorBundles §6.6 own the spherical heights, also cited. Nothing else is shared.

Source independence: changed passages only. Six passages were compared: the Origin of 6.1 (i) and the Philippon References entry against Philippon91 lines 552–556, and the Soulé sentence of the route of 6.1 and the Soulé References entry against Soule91 lines 412 and 529. The corollary convention, the routes of 5.1 and 6.2 and the Scope cite no source. Two sources were used, and nothing is shared beyond what the mathematics forces. The largest share is tied: BGS94 (unreadable) and Philippon91 have 10 of about 34 mentions each. The arrangement was not compared again, since no layer is added, removed or reordered.

Research link: 6.1 compares the Arakelov height of a projective cycle with Philippon's spherical height of its Chow form (Soulé 1991, Théorème 3; Philippon 1991, Théorème 2; Bost–Gillet–Soulé 1994). 6.2 (a7) is the height of projective space with Sombra's (2005) bound from successive minima. This line rests on the README's References and on Soule91, Philippon91 and Sombra05 as read.

## Not verifiable

- BGS94 (Proposition 3.2.1 (iv), (3.2.2), Lemma 3.3.1, §4.1, Proposition 4.1.2, (4.1.4), Theorem 4.3.2, (4.3.12), Theorem 4.3.8): the sources service resolves the DOI to a page on pubs.ams.org, a host it does not classify, and finds no legal copy.

Automatic checks set aside as false positives: the check that a pull request edits nothing outside the roadmap under review reports the 118 changed files of the other roadmap folders this pull request adds or revises. Each of those folders is this pull request's own, with a review of its own, and nothing else changes.

## Source issues

- none

## For the human reviewers

- Not tested: BGS94 shares the largest number of source mentions (10 of about 34, with Philippon91) and could not be read (an AMS host the sources service does not classify). Its locators and wording were not compared.
- The convention on corollaries (README lines 28–35) keeps in the family, with their own routes, statements that a general roadmap now owns. 5.1, the identity of 6.1 and the decomposition of (a7) are identical to HeightsRationalPointsAndObstructions §§5.17a.1, 5.9b.1 and 5.9b.2.
- [FormalProof] (README line 668) is an external formalisation; its licence was not checked.
