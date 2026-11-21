# Review of ChowFormsAndHeightsOfSubvarieties (pull request #2891 at 431383e)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ChowFormsAndHeightsOfSubvarieties/`
**Verdict:** accepted

**Summary.** Accepted, with no finding. This is an incremental re-review of the 23 lines changed since `d8ade8a`: the five small corrections of the previous report are repaired, and the repairs are correct (the new [FormalProof] locators of 6.2 (a7) exist and carry the README's constants and signs; the exact height of `ℙ^{N−1}` follows from the recursion as now written; the consumer's use of 5.1 is at its head). The title and description agree with this head. One format note remains, not blocking. The human reviewers have Bost–Gillet–Soulé (not readable), the statements with no published source, and the standing of the formal proof to decide.

## N01 — `Chow.properPushforward` (line 565) is in code font, but SchemeAndStackFoundations §5.2 gives it as a prose name, and no library declaration has that name; write it as that roadmap does.

## Previous findings

The previous report had no finding (R); its small corrections and format note are accounted for here.

- C01 — repaired: the route of (a7) now names `ScaledExample.lean` with `DualTopMetricChange.Statement`, `DualTopLatticeChange.Statement`, `DualTopStandard.Statement`, and `StatementsGrassHeight.lean` with `GrassHeightBound.Statement`, proved as `GrassHeightBound.full` (lines 393–404).
- C02 — repaired as far as it can be: (a7) now derives the value from the recursion of its route, "for a standard basis vector `u`, `Σ_σ log ‖u‖_σ = 0` and each step adds `½·Σ_{k=1}^{N−1} 1/k`" (lines 316–319); the paper still has no theorem number (see the human reviewers).
- C03 — repaired: "for points of `ℙ¹` with the sup metric the torus measure is the right one" (line 224).
- C04 — repaired: the description now reads "cite no published statement except, in 6.2 (a7), the exact value of the height of `ℙ^{N−1}`" and lists the four further suppliers on main and §5.17f.
- C05 — repaired: "Its Layer 0 (0.4 (b), (c)) uses the change-of-metric formula 5.1" (line 521).
- N01 — not repaired: `Chow.properPushforward` is still in code font at line 565; written again above.

## Verified sound

| Statement | Instances tried | Values computed (this side / other side) | Result |
|---|---|---|---|
| 6.2 (a7), exact value from the recursion (lines 316–319) | `Ō_K^N`, `u` a basis vector, `N = 1, 2, 3, 4` | step `h(ℙ^{N−1}) = h(ℙ^{N−2}) + ½H_{N−1}`: `0, ½, 5/4, 13/6`; `(N/2)(H_N − 1)`: `0, ½, 5/4, 13/6` | holds |
| 6.2 (a7), bound `(N/2)·log N` | `N = 1, 2, 3, 4` | `0 ≤ 0`; `0.5 ≤ 0.693`; `1.25 ≤ 1.648`; `2.167 ≤ 2.773` | holds |
| (a7) decomposition against [FormalProof] `DualTop*.Statement` | sum of the three identities, lattice `F` of rank `i ≥ 1` | `II(F^∨ line) = [K:ℚ]·II_ℚ(ℙ^{i−1}) − deg(F)·geomDeg`; README × `[K:ℚ]`: `deĝ(J̄) + [K:ℚ]·h(ℙ^{N−1})` with `deĝ(J̄) = −deĝ(F)` | same identity, unnormalised |
| (a7) bound against [FormalProof] `GrassHeightBound.Statement` | `f = 1, j = 1, m = N − 1` | formal: `(fjm + 1)·((fj)/2)·log(1 + m)·geomDeg = N·½·log N`; hypothesis `SuccessiveMinimaUpperBound` in the statement | as the README says |
| `GrassHeightBound.full` | type | `GrassHeightBound.full : GrassHeightBound.Statement` in `Assembly.lean` line 81 | proves the statement with its hypothesis |
| 6.1 first Check, parenthesis (line 224) | `ℙ¹`; `[1:1:1] ∈ ℙ²` | `ℙ¹`: torus mean of `log|au_0 + bu_1|` is `log max(|a|,|b|)`; `ℙ²`: `0` vs `0.3230…`, now excluded by the wording | true as scoped |
| Downstream consumers, 5.1 (line 521) | HeightsForLogSingularMetrics at its head | cites "ChowFormsAndHeightsOfSubvarieties §5.1" in the *Needs* of its Layer 0 (its lines 47, 67) and has a contract section for this roadmap (its line 261) | bullet correct |
| (a7) against the consumer's §4.3b (a) | sign for `J̄ = Ē^∨` | consumer: `Ō(1)^n = −deĝ(Ē) + [K:ℚ]·h(ℙ^{n−1})`; here: `deĝ(Ē^∨) + [K:ℚ]·h` | agree |
| `Suggested.lean` | elaboration; no declaration | exit 0, no message; nothing to probe with one tactic or `#check` | holds |

The rows for the untouched statements stand as in the previous review, of `d8ade8a`.

- Source locators checked against the text: the 3 files and 5 declarations of [FormalProof] that the change adds, all found and read in the operator's copy of the repository (`ScaledExample.lean` lines 21, 31, 43; `StatementsGrassHeight.lean` line 56; `Assembly.lean` line 81). The seeded sample (5.1, 6.1, 6.2) was checked where it falls in the changed passages; the Philippon and Gillet–Soulé locators are untouched.
- Library declarations opened at the pins: none new; the change names no library declaration.
- Cross-roadmap citations resolved in the changed passages: HeightsForLogSingularMetrics Layer 0 and §4.3b (open head), ArithmeticDynamics §4.29 (open head, heading "Mahler formula for adelic heights"), SlopesOfHermitianVectorBundles §6.6 (vi) (open head); the seven suppliers the description says are on main are on main.
- Dependency check: `depcheck: 170 roadmaps, 1989 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: the worker's run on this head passed every check. Run without the family and the candidate order, the same checks report only the three files of the family index outside the folder and that the roadmap is not in the merge order, which is what the description says.
- Elaboration of `Suggested.lean`: exit 0, no message (no declaration, no `sorry`, single `import Mathlib`, no `set_option`). Signature check with `#check`: not applicable.
- Title and description against this head: adds a new roadmap (626 lines, no heading or declaration removed), suppliers and sections as in the README's Dependencies lines, the family index entry as quoted; no sentence contradicted, nothing a reader must know left unstated.
- Outside the folder: nothing but the family index, which belongs to this pull request. The roadmap is new: no layer comparison with a base README applies.

Overlap check: read HeightsForLogSingularMetrics, SlopesOfHermitianVectorBundles, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, MultiplierIdealsOfPairsAndPointSeparation (open) and ArakelovGeometryAndAbelianHeights (main), as in the previous review; the change moves no ownership. Spherical heights, `ν`, `ht_J̄`: owner SlopesOfHermitianVectorBundles §§6.6, 6.7a, cited. The height of cycles in `ℙ(J^∨)`, its value on the whole space and the comparison with the Chow form: owner this roadmap, cited by HeightsForLogSingularMetrics §4.3b and ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §§8.18, 8.18e. The change-of-metric formula: owner this roadmap (5.1), cited by HeightsForLogSingularMetrics Layer 0. Hermitian vector bundles and the Arakelov degree: owner ArakelovGeometryAndAbelianHeights. Chow forms: AlgebraicModuliForArithmeticGeometry §1.6. Nothing shared with ProjectiveModelsAndPeriodBoundsOnShimuraVarieties.

Source independence: changed passages only: 3 passages (the value of the height of `ℙ^{N−1}` in (a7), the two [FormalProof] sentences of its route, the parenthesis of the first Check of 6.1) compared with 1 source ([FormalProof], three files), none shared beyond file paths and declaration names; largest share [FormalProof], 18 of 23 locators at the previous head, and the change adds five more declaration names of it; no layer added, removed or reordered, so the contents were not compared again (previous result: independent). Bost–Gillet–Soulé could not be read.

Research link: 6.1 is the comparison of Bost–Gillet–Soulé (1994) between the height of a projective cycle and the height of its Chow form; its archimedean part is Philippon's Théorème 2 (1991). It feeds the Hilbert–Samuel inequalities of SlopesOfHermitianVectorBundles §6.7a in the family that follows Alpöge's formal proof (2026). Rests on the README and Philippon91 p. 256.

## Not verifiable

- Bost–Gillet–Soulé, J. Amer. Math. Soc. 7 (1994): no legal copy found. The value of the height of `ℙ^{N−1}` was checked by computation from the recursion, not against this text.
- [FormalProof]: the locators were checked in the operator's copy of the repository, read and not built. The definitions under the new statements (`dualLine`, `dualIdeal`, `geomDeg`, `IntersectionSystem`) were not traced, so the agreement of normalisations is checked on the statements as written (with `geomDeg` of `ℙ^{N−1}` taken to be `1`). The three `DualTop*` statements have proofs from further named statements, which the proof discharges in its assembly files; that chain was followed one step only.
- The description's sentences about the copies of the family index at other family heads were not checked: they concern other pull requests.

## Source issues

- none

## For the human reviewers

- Not tested: Bost–Gillet–Soulé (J. Amer. Math. Soc. 1994), credited for the identity of 6.1 and for the height of `ℙ^{N−1}` (README lines 3, 5, 116, 318, 577), could not be read and has no theorem number; wording and arrangement were not compared with it.
- Scope: 5.1 and 6.2 (a1)–(a7), (b) say they are proved here and cite no published statement except the value of the height of `ℙ^{N−1}`; routes and Checks were recomputed, not matched to a refereed source.
- Scope: [FormalProof] and [Announcement] (README lines 580–581) are a Lean formalization and a four-page announcement dated 20 November 2026; neither is refereed, and most of the README's locators point into the formalization.
- Licence: the licence of the repository behind [FormalProof] was not determined; the README takes from it file paths and declaration names only, and `Suggested.lean` declares nothing.
