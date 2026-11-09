# Review of ClassFieldTheory (pull request #1411 at 5d0d7c6)

**Verdict:** needs changes

This is an incremental re-review of 0 changed lines since 5bfdf39. The two commits since then touch only the sibling folders `TauCetiRoadmap/IntegralLattices/` and `TauCetiRoadmap/QuadraticFormInvariants/`. Both P3 findings of the previous review are still open, and neither is in this folder's text: one is in the pull request description, the other is the edit to `Completed/LocalGaloisGroups`. Nothing inside `TauCetiRoadmap/ClassFieldTheory/` needs to change.

## R01 (P3) — The merge-order paragraph still names the old theorem `closure_map_artinMap_unitFiltration`

Carried from the previous R01; not repaired.

**Location.** The pull request description, *Merge order*: "this head's definition name `localAbsoluteUpperRamificationGroup` and its theorem names `map_unitFiltration_normResidue` and `closure_map_artinMap_unitFiltration` survive, and #1215's renamed copies are dropped on rebase".

**Claim.** The folder declares `map_artinMap_unitFiltration` (`TauCetiRoadmap/ClassFieldTheory/Suggested.lean:540`), and the old name occurs nowhere in it. Whoever rebases #1215 or #617 against this head is told to keep a declaration that does not exist.

**Witness.** `roadmaps grep 'closure_map_artinMap_unitFiltration'` finds the old name only in #1215 `TauCetiRoadmap/ClassFieldTheory/README.md:302`, a rename row that maps it to `map_artinMap_unitFiltration_eq_upper`. It finds no occurrence at this head. #1215 and this head give the same theorem two different new names.

**Repair.** Change the paragraph to: "its theorem names `map_unitFiltration_normResidue` and `map_artinMap_unitFiltration` survive, and #1215's copies `normResidue_map_unitFiltration` and `map_artinMap_unitFiltration_eq_upper` are dropped on rebase". Every name in that sentence resolves:
- `Suggested.lean:503`, `:524` and `:540` at this head;
- #1215 `README.md:301–302` and #1215 `Suggested.lean:97`.

## R02 (P3) — The forced edit to `Completed/LocalGaloisGroups` is still outside the folders recorded for this pull request

Carried from the previous R02; not repaired.

**Location.** `Completed/LocalGaloisGroups/Suggested.lean:326` and `:485`, as changed against main:
- "`⟨ClassFieldTheory.h2MuEquivZMod_mixed p F n hn⟩`"
- "`⟨ClassFieldTheory.h2FpEquivZMod_of_mu p F _ (muNRepIsoTrivialFp p F ζ hζ)⟩`"

**Claim.** The folders this review is told belong to the pull request are `ClassFieldTheory`, `IntegralLattices` and `QuadraticFormInvariants`. `Completed/LocalGaloisGroups` is not among them. The edit adapts that consumer to this folder's canonical `h2MuEquivZMod_mixed` (`Suggested.lean:322`) and `h2FpEquivZMod_of_mu` (`:333`).

**Witness.**
- `git diff --stat origin/main...HEAD`, restricted to paths outside the three folders, lists `Completed/LocalGaloisGroups/Suggested.lean | 4 ++--`.
- The targeted build covers `TauCetiRoadmap.ClassFieldTheory.Suggested` and `TauCetiRoadmap.GlobalQuadraticForms.Suggested`. It does not build `Completed.LocalGaloisGroups.Suggested`.
- The open-pull-request index lists LocalGaloisGroups among #1411's folders, but the board's folder list for this review does not.

**Repair.** No change inside this folder. Have `Completed/LocalGaloisGroups` recorded as one of this pull request's folders where the board reads them, so that the two lines are reviewed and built with this head. Keep the two lines: reverting to `Nonempty`-valued declarations would contradict the README's rule at lines 588–591 ("no arbitrary `Nonempty (X ≃ Y)` where a canonical map is required").

## Previous findings

- R01 — not repaired: the description still says "its theorem names `map_unitFiltration_normResidue` and `closure_map_artinMap_unitFiltration` survive", while `Suggested.lean:540` declares `map_artinMap_unitFiltration`. Carried as R01.
- R02 — not repaired: `Completed/LocalGaloisGroups/Suggested.lean | 4 ++--` is still changed outside the three recorded folders. Carried as R02.

## Verified sound

**Gate, build and order.**
- The worker's gate at this head passes every check, including `build=0` (`scratch/gate.md`).
- My rerun of `gate … ClassFieldTheory --base origin/main` gives 0 on every check inside the folder. It reports `outside-folder=5`, and all five are in the declared sibling folders: `IntegralLattices/{README.md,Suggested.lean}` and `QuadraticFormInvariants/{NativeCompletion.md,README.md,Suggested.lean}`. This matches the previous round.
- Dependency check, verbatim: `depcheck: 235 roadmaps, 2264 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- `lake env lean TauCetiRoadmap/ClassFieldTheory/Suggested.lean` exits 0. Its only output is five `declaration uses sorry` warnings, at lines 401, 503, 540, 687 and 697.
- `lake-manifest.json` is unchanged since 5bfdf39, so the pins are the same.

**Signatures.** I ran `#check @` on a scratch copy for the five sorried theorems and for the two abbreviations `scratch/signatures.md` flags. Each elaborated type is identical to `scratch/signatures.md` and to the previous report:
- `algebraMap_vle_algebraMap_iff_of_finite_padic`
- `map_unitFiltration_normResidue`, with `[IsAbelianGalois K L]` and `[ValuativeExtension K L]` present
- `map_artinMap_unitFiltration`, with no characteristic hypothesis
- `isPrincipal_map_hilbertClassField`
- `relDiscr_eq_finprod_abelianConductor`

`restrictAbsolute` and `absoluteGaloisGroupExtend` are flagged as dropping the local-field binders. That is correct: both are restriction and extension maps of absolute Galois groups, and need only `[Field K] [Field L] [Algebra K L] [Module.Finite K L]` (plus `[IsGalois K L]` for the first). This is a remark on untouched text, not a finding.

**One-tactic probe.** On a scratch copy I replaced each of the five `sorry`s with `by first | rfl | (simp; done) | infer_instance | trivial | (simp_all; done) | exact?`. All five fail with "`exact?` could not close the goal", so none of them is padding. A first run with a bare `simp` at line 511 left unsolved goals, so I reran that line with `(simp; done)`.

**Sibling folders changed since 5bfdf39, where they rely on this roadmap.**
- `QuadraticFormInvariants/README.md:302–320` now says three things about this roadmap. Each matches this head:
  - "Its `H` … Mathlib's `continuousCohomology`" matches `Suggested.lean:238–240`.
  - "Its `kummerClass_eq_kummerCocycleClass` is Tau Ceti's `…kummerClass_eq_muNRepH1Equiv_kummerCocycleClass`, read through that roadmap's `kummerClass`, which is Tau Ceti's Kummer class where `n` is invertible … and `0` otherwise" matches `Suggested.lean:294–305`. The Tau Ceti theorem is at `NumberTheory/ClassFieldTheory/MuNRep.lean:300`.
  - The Layer 14 abbreviations `finiteHilbertInvariantAt`, `infiniteHilbertInvariantAt`, `finiteHilbertSupport` and `hilbertProductFormula` are at `Suggested.lean:737`, `:743`, `:748` and `:754`.
- Layers 5 and 14 exist under those headings (README 931 and 2344).
- The `IntegralLattices` diff changes no line that mentions ClassFieldTheory. Its unchanged rows (README 141, 489, 511, 1235) cite Tau Ceti's `ringClassField`, `ringClassArtinEquiv` and `hilbertProductFormula` directly.

**Citations and overlaps.**
- `scratch/citations.md` lists 13 Lean names found nowhere. Ten are the "Former label" column of the rename table (README 203–212), which names declarations that no longer exist by design.
- The other three resolve on main:
  - `ProfiniteCohomology.cd_p_le_scd_p` at `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean:3069`;
  - `ProfiniteCohomology.cd_p_le_of_isClosed` at `:3126` (namespace `TauCetiRoadmap.ProfiniteCohomology`, `:194`);
  - `ProfiniteProPGroups.cd_p_eq_of_isProPSylow` at `Completed/ProfiniteProPGroups/Suggested.lean:3758`.
- `roadmaps overlaps ClassFieldTheory` (rerun):
  - #617 and #1215 change this roadmap and conflict with this head. The description states the rebase order; its one stale name is R01.
  - No id this README cites is dropped by an open pull request or defined only by an open revision.
- The description says #1410 and #1474 consume this layer. Both cite "ClassFieldTheory Layer 7" by layer: #1410 README 19 and 125, and #1474 README 207, 1392 and 1511. Neither names a declaration that this head renamed.

**Seeded sample.** None of the sampled targets lies in changed text, and the README flags no locator as unverified. I spot-checked four sampled targets in untouched text:
- *The principal ideal theorem* (README 2205): milne-cft V Theorem 3.17 is on printed p. 161 (milne-cft line 7252), and the group-theoretic Theorem 3.19 is on p. 163 (line 7323), as cited. The Tau Ceti inputs are at the pin:
  - `ClassFormation.groundInclusion_mem_normSubgroup_of_range_eq_commutator` (`Formation/PrincipalIdeal.lean:67`);
  - `MonoidHom.transfer_commutator_eq_one` (`GroupTheory/Transfer/Commutator.lean:303`);
  - `hilbertClassArtinEquiv` (`ClassFields/RayClassField.lean:262`) and `fieldRange_le_hilbertClassField_iff` (`:362`).
- *The conductor–discriminant formula* (README 2236): milne-cft V Theorem 3.27 and Remark 3.28 are on printed p. 165 (lines 7423 and 7436). Remark 3.28 identifies the conductor of `χ` with that of the fixed field of `ker χ`, which is the form stated here. The Tau Ceti inputs are at the pin:
  - `finsum_artinConductorExponent_eq_discriminantExponent` (`LocalField/Discriminant/Conductor.lean:58`);
  - `conductorExponent_fixedField_ker` (`Local/Conductor/UpperNumbering.lean:130`);
  - `isAdmissibleModulus_iff_abelianConductor_dvd` (`Global/AdmissibleModulus/Basic.lean:200`).
- *The coordinates of `H²(F, μ_n)`* (README 1027): `h2MuEquivZMod` (`Brauer/RootsOfUnity.lean:89`) and `h2EquivZModOfMuNRepIso` (`:156`).
- *The Tate dual* (README 1089): `InternalHom.evalPairing` (`Topology/Algebra/GroupAction/InternalHom/Basic.lean:350`) and `tateDual_ρ_eq_self_iff` (`Local/Duality/Basic.lean:170`).

**Adversarial pass.** No statement changed. Rows 1–28 are carried from the previous report (r44), which carried rows 10 onwards from r40. Rows 29–31 are new: I computed them here for the sampled targets I spot-checked.

| # | Statement | Instance | Left side / right side | Result |
|---|---|---|---|---|
| 1 | `map_artinMap_unitFiltration` (r44) | `K = ℚ_p`, `n = 0` | `Art(ℤ_pˣ)` = inertia of `ℚ_p^ab/ℚ_p` / image of `G_K^0` = image of inertia | holds |
| 2 | same (r44) | `ℚ_3`, `n = 1`, level `ℚ_3(ζ_9)` | `{1, 7, 4}` / `G^1 = {a ≡ 1 mod 3} = {1, 4, 7}` | holds |
| 3 | same, wrong model `U^n ↔ G^(n−1)` (r44) | as row 2 | order `3` / `G^0 = (ℤ/9)ˣ`, order `6` | shift excluded |
| 4 | same (r44) | `ℚ_2(ζ_8)`, `n = 2, 3` | `{1, 5}` / `{1, 5}`; `{1}` / `1` | holds |
| 5 | same, equal characteristic (r44) | `𝔽_p((t))`, `y^p − y = t⁻¹`, `n = 1, 2` | `ℤ/p` / `G^1 = G`; `1` / `1` | holds |
| 6 | same, closure (r44) | every `n` | LHS compact, `artinMap` continuous, `G_K^ab` T2, so LHS is closed | holds |
| 7 | same, normalization `Art⁻¹` (r44) | — | images of subgroups agree under `Art` and `Art⁻¹`; the sign is pinned by `unramifiedCoordinate_artinMap` | no change needed |
| 8 | depth-0, wrong model `G_K^0 = G_K` (r44) | `n = 0` | `unramifiedCoordinate(Art π)` = `zHat.gen` ≠ identity | excluded |
| 9 | Layer 5 nondegeneracy (r44) | `ℚ_7`, `n = 3`, `b = 7`, `a = 2`; `b = 8` | `2^2 = 4 ≢ 1 mod 7`, so `(2,7) ≠ 0`; `8 = 2³` pairs to zero | holds both ways |
| 9b | same (r44) | `ℚ_2`, `n = 2`, `b = 5`; `b = 17` | `(2,5)_2 = −1`; `17` is a square | holds |
| 9c | perfectness (r44) | `ℚ_7`, `n = 3` | `#ℚ_7ˣ/(ℚ_7ˣ)³ = 9` on both sides | perfect |
| 10 | `algebraMap_vle_algebraMap_iff_of_finite_padic` (r40) | `ℚ_2(i)`, `(2,1)`, `(1,2)` | true, false / true, false | holds |
| 11 | `map_unitFiltration_normResidue` (r40) | `L = K`; `ℚ_2(√2)`, `n = 2, 3` | `{1}/{1}`; `G/G`, `1/1` | holds |
| 12 | same (r40) | `ℚ_p(ζ_p)`, `n = 0, 1`; unramified | `G/G`, `1/1`; `1/1` | holds |
| 13 | same, lower numbering (r40) | `ℚ_2(ζ_8)`, depth 3 | `{1}` / `G_3 = ⟨σ_5⟩`, `G^3 = 1` | upper numbering right |
| 14 | same, non-abelian (r40) | `ℚ_2(∛2, ζ_3)`, `S_3` | `U^(0) ⊆ N` / `#G_0 = 3` | `IsAbelianGalois` needed |
| 15 | `localAbsoluteUpperRamificationGroup` (r40) | `u = −1`; `u ∈ (−1, 0]` | `G_K`; trivial restriction vs `G_K ↠ ℤ/f` | ceiling right |
| 16 | `isPrincipal_map_hilbertClassField` (r40) | `ℚ(√−5)`, `I = (2, 1+√−5)`, `H = K(i)` | `(I𝒪_H)² = (2) = ((1+i)²)` | holds |
| 17 | `relDiscr_eq_finprod_abelianConductor` (r40) | `ℚ(i)`; `ℚ(ζ_5)` | `(4) = (1)(4)`; `(5³)` = product vs `(5)` for lcm | product right |
| 18 | `eulerCharacteristic_finrank_fp` (r40) | `ℚ_p` odd; `ℚ_2` | `2 = 1+0+1`; `3 = 1+1+1` | holds |
| 19 | Layer 5 duality Check (r40) | `ℚ_2`, `μ_3`, `ℤ/3` | `(1,3,3)`, `(3,1,3)` | holds |
| 20 | `scd_p_absoluteGaloisGroup_eq_two` (r40) | `ℓ = p`, `ℓ ≠ p` | `2 / 2` | holds |
| 21 | `cyclotomicCharacter_artinMap_padic` (r40) | `p = 2`, `u = −3`, `μ_16` | `(−3)⁻¹ ≡ 5`, not `13` | sign pinned |
| 22 | `hilbertProductFormula` (r40) | `ℚ`: `(−1,−1)`, `(3,7)`, `(5,5)` | sums `0, 0, 0` | holds |
| 23 | `cyclicHasseNorm` (r40) | `ℚ(√13, √17)`, `x = 25` | local norm everywhere, not global | cyclic needed |
| 24 | `card_ideleClassNormQuotient` (r40) | `ℚ(i)/ℚ`; `L = K` | `2/2`; `1/1` | holds |
| 25 | Layer 7 conductor formula (r40) | `ℚ_2(√2)`, `ℚ_p(ζ_p)`, unramified | `3`, `1`, `0` | holds |
| 26 | Layer 12 Kummer degree (r40) | `ℚ`, `p = 2`, `S = {2}`; `ℚ(ζ_3)`, `p = 3` | `4 = 2²`; `9 = 3²` | holds |
| 27 | Layer 6 Frobenius (r40) | `ℚ_2(ζ_5)/ℚ_2` | `Art(2)(ζ_5) = ζ_5²`, not `ζ_5³` | holds |
| 28 | Layer 5 coordinate sign (r40) | `ℚ_7`, `n = 3` | `1` / negated `2` | holds |
| 29 | `relDiscr_eq_finprod_abelianConductor` | `L = ℚ(ζ_8)/ℚ`, `G = {1,3,5,7}` | characters cut out `ℚ`, `ℚ(i)`, `ℚ(√2)`, `ℚ(√−2)` with conductor finite parts `1, 4, 8, 8`; product `256 = 2⁸` / `disc ℚ(ζ_8) = 2^(4·2) = 2⁸`; the lcm model gives `8` | holds; the product, not the lcm |
| 30 | `isPrincipal_map_hilbertClassField` | `K = ℚ(√−6)`, `h = 2`, `𝔭 = (2, √−6)`, `H = K(√2) = K(√−3)` | `𝔭` is not principal in `K` (`a² + 6b² = 2` has no solution); `(𝔭𝒪_H)² = (2) = (√2)²`, so `𝔭𝒪_H = (√2)` by unique factorization of ideals | holds |
| 31 | `h2FpEquivZMod_of_mu`, hypothesis `e : μ_p ≅ T` | `p = 3`: `F = ℚ_3(ζ_3)`, `T = 𝔽_3`; `T = 0`; `F = ℚ_3`, `T = 𝔽_3` | `#H²(G_F, 𝔽_3) = #Br(F)[3] = 3` / `3`; `#H²(F, 0) = 1 ≠ 3`; over `ℚ_3`, `H²(ℤ/3)` is dual to `μ_3(ℚ_3) = 1`, so `1 ≠ 3` | hypothesis needed, as the README says |

## Not verifiable

- serre-local-fields (uncertified, paywalled), XV §2 Theorem 2 and Corollary 3 to Theorem 1: the locator of both unit-filtration statements. The statements were checked mathematically (rows 1–6, 11–14) and against milne-cft I 1.11 in earlier rounds.
- Whether `Completed/LocalGaloisGroups/Suggested.lean` builds at this head. Its imports `Completed.ProfiniteProPGroups.Suggested` and `Completed.LocalFieldsRamification.Suggested` are not built in this worktree, and the commands allowed here do not build them (see R02).
- Ownership against open pull requests was checked with `roadmaps grep` and `roadmaps overlaps` across all open heads (above). The files of #1410 and #1474 are not among those this brief names; I read them only through `roadmaps grep`.

## Source issues

- none
