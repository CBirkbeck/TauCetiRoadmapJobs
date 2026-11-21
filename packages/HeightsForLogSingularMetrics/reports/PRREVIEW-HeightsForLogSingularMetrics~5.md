# Review of HeightsForLogSingularMetrics (pull request #2894 at 0a71895)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HeightsForLogSingularMetrics/`
**Verdict:** needs changes

**Summary.** Changes are needed for one point of mathematics: 16.1 is now stated only for abelian varieties with an action of the integers of a CM field "of the family" (with a prime `d ≡ 7 (mod 16)`), although its route never uses that action and the formal proof it cites also proves the bound for every principally polarised abelian variety, with a constant depending on `g`; that general bound is no longer a target. The four earlier small corrections are repaired and their new locators check against the texts; the format note stands. Two small corrections and one format note, none blocking; the points for the human reviewers are unchanged in substance.

## R01 (P2) — 16.1 is stated only for the CM fields of the family, with hypotheses its route never uses, and the general bound that the cited proof establishes is no longer a target

A library of slopes of tangent lattices needs the bound for every principally polarised abelian variety; a reader of 16.1 now finds it only under hypotheses that belong to one application, and cannot tell from the route whether they are needed. The statement (line 179) quantifies over "every CM field `E` of the family (it contains a square root of `−d` for a prime `d ≡ 7 (mod 16)` …)", an action of `O_E` on `G` and a condition on adjoints. The route (lines 183–187) uses the absolute Siegel lemma, the Moret–Bailly model of `(A, L, A[r²])` and the jets of the translates of `θ`: none of its three steps mentions `E`, the action or `d`, and it ends with "which is `O(log(2 + g + h⁺))`", an absolute constant for every principally polarised `A`. The References entry (line 272) says instead that this jet argument "proves the bound there with a constant depending on `g`" and that the absolute constant is obtained by another declaration, whose argument the route does not describe.

I opened the two declarations named there. `LieSlope` (`Development/AbelianVarietyTheory/Definitions/Divisors/TorusExt.lean`) reads: for every `g` there is `C ≥ 0` such that for every number field and every semi-abelian model of a principally polarised abelian variety of dimension at most `g`, the slopes of the tangent lattice are at most `C·log(2 + max(h, 0))`; it has no CM hypothesis. `SlopeBoundSt` has one constant for all data with a CM field and its host. So the source supports two statements, and the head keeps only the narrower one. Either the route as written proves the absolute constant for all `A` (then the hypotheses on `E` are superfluous, and by the Conventions paragraph on the statements of the formal proof the wider form is this roadmap's own and belongs beside the recorded one), or it gives only `C(g)` (then its last sentence overclaims, and the step where the action of `O_E` removes the dependence on `g` is missing). "Of the family" also refers to a family of fields that neither this README nor the family index defines.

The smallest change: state 16.1 for every semi-abelian scheme over `O_L` whose generic fibre is a principally polarised abelian variety, as the previous head did, with a constant depending on `g` if that is what the jet step gives ([FormalProof], `LieSlope`), or absolute if the route proves it; record beside it the form with an absolute constant for the CM case ([FormalProof], `SlopeBoundSt`), with the conditions on `E` written as hypotheses, and add to the route the step that uses the action. Headline (4) of the Summary, the opening of Layer 16, the scope paragraph and the fourth bullet of the `Suggested.lean` docstring follow.

## C01 — Hypothesis (iv) of 14.1 (c) is used nowhere in its route, and the next sentence says that no hypothesis on regularisations is made

14.1 (c) (line 134) now assumes that each log-log singular semipositive piece has "a close `C²` regularisation with loss at most `C·log log(1/t)/log(1/t)`", and continues: "The numbers of 0.4 (b) do not depend on the regularisations, so no further hypothesis on them is made." The route regularises by SingularHermitianMetricsAndL2Methods §7.7 (b), which needs no gradient bound and gives no closeness, and the convergence of both sides (0.4 (b), §7.8 (c), (d)) holds for every regularisation; closeness enters nowhere. A reader cannot tell whether (iv) is needed.

Would you state (c) without (iv), as the route proves it, and record after it that [FormalProof] has it under (iv)? That is what the Conventions paragraph announces for a wider form. The same question arises, more mildly, for the bound on the losses `ε_i(t)` added to 0.4 (c)(iii) (line 42), which the route of (iii) does not use.

## C02 — The description describes an earlier head in four places

- "it deduces an absolute Siegel lemma, with the constant `½(H_n − 1)`": the head states the lemma with `½·log n` and gives `½(H_n − 1)` as the improvement with the exact height of `ℙ^{n−1}`.
- "it bounds the maximal slope of the tangent lattice of an abelian variety by the logarithm of its height": the head states this only with an action of the integers of a CM field (R01).
- "The versions at the heads of those pull requests are not identical" and "the entry here for ChowFormsAndHeightsOfSubvarieties does not name the heights of cycles in the projective space of a Hermitian vector bundle": the index at this head names them (lines 122–125 of the family README) and is line for line the index of the ChowFormsAndHeightsOfSubvarieties, SingularHermitianMetricsAndL2Methods and MultiplierIdealsOfPairsAndPointSeparation pull requests.
- The description does not say that AlgebraicModuliForArithmeticGeometry (§§1.1, 1.3, on main) is now a supplier, replacing SchubertGeometry S3.5 for the Plücker embedding.

## N01 — `ZLattice` is a namespace at the pinned Mathlib, not a declaration

The last paragraph of the `Suggested.lean` docstring (line 66) still says Mathlib has `ZLattice`. At the pin the class is `IsZLattice` (`Mathlib/Algebra/Module/ZLattice/Basic.lean:434`); `ZLattice` is only the namespace of `ZLattice.covolume`. Write `IsZLattice`.

## Previous findings

The previous review, of `2c30dcc`, had no finding. Its remarks:

- C01 (locators) — repaired: "Theorem (5.2), p. 208, with Lemma (5.4), p. 209"; "Theorem 2.2, p. 6, and Theorem 8.1, p. 21"; each [FormalProof] credit names a file and a declaration. Checked below.
- C02 (identical family index) — repaired, and now out of date the other way: "The versions at the heads of those pull requests are not identical." C02 above.
- C03 (conventions of a later roadmap) — repaired: line 17 names three roadmaps, none later; line 7 reads "Layer 16 complements the bound of FaltingsFinitenessAndIsogenyTheoremsPartII".
- C04 (Moret-Bailly 1990) — repaired: "Compositio Math. 75 (1990), 203–217, Théorème 3.3, p. 216, resting on the monograph".
- N01 (`ZLattice`) — not repaired: "for which Mathlib has `ZLattice` and `ZLattice.covolume`". N01 above.
- The question on the error term of 16.1, step (3): answered by restricting the statement and leaving the route as it was; R01 above.

## Verified sound

| Statement | Instances tried | Values computed (roadmap / independent) | Result | Change |
|---|---|---|---|---|
| 4.3b (a), bound `h(ℙ^{n−1}) ≤ (n/2)·log n` | `n = 1, 2, 3, 4` | value `(n/2)(H_n−1)`: `0, ½, 5/4, 13/6`; bound: `0, 0.693, 1.648, 2.773` | holds; `[K:ℚ]·n·(−μ̂) = −deĝ` | none |
| 4.3b (b), constant `½·log n` | `n = 1`; `ℤ²`; the contradiction | `0`; `½log 2 = 0.347` against `¼`, `x = (1,0)` gives `0`; `Ō(1)^n − n·e·[K:ℚ] ≤ −nη[K:ℚ] < 0` | holds | none |
| 4.3b (b) against [FormalProof] | `LineOfLargeDegree.Statement` in `KernelsLattice.lean` | source: `slope − ½log i − ε ≤ lineDegree` for rank `i ≥ 1`; README: `mean log‖x‖ ≤ −μ̂ + ½log n + η` | same statement | none |
| 4.3b (c), comparison of constants | `s = 1, 2, 3, 4` | `½log s`: `0, 0.347, 0.549, 0.693`; `((s−1)/2)log 2`: `0, 0.347, 0.693, 1.040` | `≤`, equality for `s ≤ 2` | none |
| 4.3a (d) upper, against ArakelovGeometryAndAbelianHeightsPartII §4.8 | dense set of points of height `≤ e` | every open set meets it, so `e₁ ≤ e`; §4.8: `M̄^d/(d·deg) ≤ e₁` | first inequality gives the upper half | none |
| 4.3a (b), equality for nef | §0.3 (1), §4.3 (1) opened | "if `L̄` is nef then `vol^ = L̄^d`", model and adelic | citation correct | none |
| 0.4 (b), (c): change of metric | ChowFormsAndHeightsOfSubvarieties §5.1 | adds `Σ_σ∫f·c₁⋯c₁` for `e^{−f}‖·‖`; README: positive multiple of `∫(φ_t − φ_{t′})·c₁⋯` | sign and shape agree | none |
| 14.1 (c)(iv) | route of (c) | regularisations of §7.7 (b) (no closeness); limits by 0.4 (b), §7.8 (c), (d) for any regularisation | hypothesis unused | C01 |
| 16.1 statement against [FormalProof] | `LieSlope`, `SlopeBoundSt` | `∀ g ∃ C`, no CM field, bound `C·log(2 + max(h,0))`; one `C`, CM field with host, bound `C·log(2 + rank + max(−deg,0))` | general form not a target | R01 |
| 16.1 step (1) | `k ≤ g` | `½log k ≤ ½log g`; `C` becomes `C + 1` (`½log g ≤ log(2+g)`) | holds | none |
| Scope: slopes for `H` and `π·H` | rank `k` sub-lattice | `‖x‖²_{πH} = π‖x‖²_H`; degree drops by `(k/2)log π`, slope by `½log π = 0.572` | holds | none |
| Description: family index | index at three sibling heads | differing lines `0, 0, 0` | sentence out of date | C02 |

The rows of the previous review for the statements this change does not touch stand as in that review, of `2c30dcc`.

- Source locators checked against the text: zhang-1995 lines 868, 885–889 (Theorem (5.2), p. 208) and 906, 926–927 (Lemma (5.4), p. 209); roy-thunder-1996 lines 217, 243–245 (Theorem 2.2, p. 6) and 747, 760–762 (Theorem 8.1, p. 21); moret-bailly-1990 lines 423, 429 (Théorème 3.3, p. 216); bost-1996 lines 407, 446 (p. 130).
- [FormalProof]: three of the named files opened in the public repository, with the declarations `SlopeBoundSt`, `LieSlope`, `LineOfLargeDegree.Statement` where the README says; each is a `Prop`-valued definition.
- Cross-roadmap citations resolved (new or changed ones): HeightsRationalPointsAndObstructions §5.9b (`projectiveCycleHeight`); ChowFormsAndHeightsOfSubvarieties §5.1; AlgebraicModuliForArithmeticGeometry §1.1 (`projectiveBundle`), §1.3 (`grassmannSmoothness`, `plucker`, `flagBundle`); ArakelovGeometryAndAbelianHeightsPartII §§0.3 (1), 4.3 (1), 4.8; SingularHermitianMetricsAndL2Methods §§5.3, 5.5, 7.7 (the first route of (c)); FaltingsFinitenessAndIsogenyTheoremsPartII §2.3 (the second tangent-height input).
- Dependency check: `depcheck: 171 roadmaps, 1995 edges, 0 problem(s)`; no UPWARD or CYCLE line. AlgebraicModuliForArithmeticGeometry is on main and earlier in the merge order.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no message. The file declares nothing: no signature to compare, no one-tactic probe, nothing is padding.
- Headlines: (1) 0.4 (b)–(c); (2) 4.3b (b); (3) 14.1 (a), (c); (4) 16.1. None is statable at the pins; the docstring names each with what it lacks, in the wording of this head.
- Changes outside the folder: only the three family index files, the pull request's own; the index is identical to that of three sibling pull requests.
- The worker's automatic checks all passed at this head.

Overlap check: read ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, ChowFormsAndHeightsOfSubvarieties, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties, ArakelovGeometryAndAbelianHeights (scopes as in the previous review; of the changed passages, the change-of-metric formula is owned by ChowFormsAndHeightsOfSubvarieties §5.1 and cited here; projective bundles, Plücker embeddings and flag bundles by AlgebraicModuliForArithmeticGeometry §§1.1, 1.3, cited here; the Fubini–Study height of `ℙ^{n−1}` by HeightsRationalPointsAndObstructions §5.9b with its value in ChowFormsAndHeightsOfSubvarieties §6.2 (a7), cited here). Nothing else shared.

Source independence: changed passages only: 8 passages compared with 5 sources (the entries for zhang-1995, roy-thunder-1996, moret-bailly-1990 and bost-1996 at their locators; 4.3b (b), 16.1 and the References entry with three files of [FormalProof]; the Conventions paragraph), none shared; largest share [FormalProof], 22 of 27 located citations; the change adds no layer, so the arrangement was not compared again.

Research link: Layers 0 and 14 extend the intersection theory of Gillet–Soulé (1990) and Bost–Gillet–Soulé (1994) to log-log metrics, beside Burgos Gil–Kramer–Kühn (2007); 4.3a extends Moriwaki's generalised Hodge index theorem (2009); 4.3b follows Zhang (1995) and Roy–Thunder (1996); 16.1 complements Bost (1995). Rests on the README's References, moriwaki-2009 and Bost's exposé.

## Not verifiable

- [FormalProof]: the other files named in the README (nineteen file references) were not opened; the three opened are statements (`Prop`-valued definitions), and their proofs were not read.
- Bost–Gillet–Soulé 1994: not in the sources cache; not read.
- Whether the jet step of 16.1 gives an absolute constant for every principally polarised abelian variety: the route's error term rests on constants of ArakelovGeometryAndAbelianHeights §5.8 stated for a fixed `r`, and no written account of the argument exists (R01).

Automatic checks set aside as false positives: my own run of the checks without the worker's merge-order file reported that the roadmap is not yet placed in the merge order, and that the three family index files lie outside the folder; the first is expected for a roadmap placed after its last supplier, and the index files are this pull request's own.

## Source issues

- none

## For the human reviewers

- Scope: 0.4 (c)(iii), 14.1 (c) and 16.1 rest on a Lean formalisation announced on 20 November 2026; the README says 16.1 "is not attributed to a published source" (line 214), and the Announcement (lines 45–49) says no written account exists yet.
- Licence: the repository the README links for [FormalProof] states on its front page that the submission was published without a licence and is mirrored for verification only; the README now names 22 of its file paths and declarations.
- Licence: the Announcement was read at `alpo.ge`, recorded as the author's own page; please confirm the host.
- Not tested: [FormalProof], the source with the largest share of credits, is a Lean source tree; three of its files were opened, its arrangement (and the origin of the section ids 0.4, 4.3a, 4.3b, 14.1, 14.2, 16.1) was not compared.
