# Review of FuchsianOrbifolds (pull request #1168 at 6c607a2)

**Verdict:** needs changes

This is an incremental re-review of 0 changed lines since `e7671f7`. The head `6c607a2` merges main (`1bea835`) into the branch:

- `git diff e7671f7 HEAD -- TauCetiRoadmap/FuchsianOrbifolds` is empty;
- `git diff --stat origin/main...HEAD` outside the folder is empty.

The merge carries out step 1 of the previous R01 repair. Steps 2–4, the edits to `Suggested.lean` and the README, are not done, so R01 is carried below. It is the only finding. It is P3, nothing blocks, and the gate passes.

## R01 (P3) — The compatibility block in `Suggested.lean` has no consumer

*Carried from R01 of reviews ~6 to ~17.* No repair report on the board marks it not actionable; the package's `reports/` folder holds only review reports.

- **Location.**
  - `TauCetiRoadmap/FuchsianOrbifolds/Suggested.lean`:
    - 64–75: `abbrev CompactifiedQuotient (Γ : Subgroup PSL(2, ℝ)) : Type := Γ.CompactifiedQuotient` and `noncomputable abbrev compactifiedChartedSpace … := inferInstance`;
    - 163–169: `export TauCeti.RiemannSurface (FiniteHolomorphicMap localMultiplicity degree degree_comp divisorPullback biholomorphOfDegreeEqOne biholomorphOfDegreeEqOne_toFun)`;
    - import line 7;
    - docstring 18–20.
  - `TauCetiRoadmap/FuchsianOrbifolds/README.md` 181–185, "It also declares `CompactifiedQuotient` … under the same short names `RiemannSurface.*`."
- **Claim.**
  - No headline uses either abbreviation, and each one only renames a pinned Tau Ceti declaration. The form rules allow a definition only where a headline needs it.
  - The first `export` is a catalogue of seven renamed library names.
  - At this head nothing uses the block. The merge replaced its last user, the branch's old copy of `TauCetiRoadmap/ModularForms/Suggested.lean`.
- **Witness.** At this head `TauCetiRoadmap/ModularForms/Suggested.lean` equals main's (empty diff) and contains `Fuchsian` 0 times. No `.lean` file outside the folder names `TauCetiRoadmap.FuchsianOrbifolds`. `roadmaps grep` finds `compactifiedChartedSpace` only here and in main's superseded copy.
- **Repair.** Step 1 is done. What remains are steps 2–4 of ~17:
  1. In `Suggested.lean`:
     - delete lines 64–75 and import line 7 (`TauCeti.Analysis.Complex.RiemannSurface.Divisor.Basic`);
     - delete lines 163–169: the comment, `namespace RiemannSurface` and the first `export`;
     - after `end TauCetiRoadmap.FuchsianOrbifolds`, write the comment "The short names `RiemannSurface.genus` and `RiemannSurface.riemannHurwitz`.", then `namespace RiemannSurface`, the existing `export TauCetiRoadmap.FuchsianOrbifolds (genus riemannHurwitz)` and `end RiemannSurface`.
     - These two short names stay because NoncongruenceModularForms (651, 1400) and PseudoholomorphicCurveAnalysis (194, 1317, 1378) on main cite `RiemannSurface.genus`.
  2. In the docstring, replace everything after "the one definition they need," with "`genus`, and exports `genus` and `riemannHurwitz` as `RiemannSurface.genus` and `RiemannSurface.riemannHurwitz`."
  3. In the README, delete 181–185 from "It also declares" to "short names `RiemannSurface.*`.". Keep the next sentence, "The carrier written `CompactifiedQuotient Γ` in other roadmaps is Tau Ceti's `Γ.CompactifiedQuotient`".

  I retested the repair on a scratch copy at this head (154 lines):
  - `lake env lean` gives 8 `sorry` warnings and nothing else;
  - `#check @RiemannSurface.genus` and `#check @RiemannSurface.riemannHurwitz` resolve;
  - `riemannHurwitz` elaborates to the same term as at the head. The head prints `RiemannSurface.FiniteHolomorphicMap` and `RiemannSurface.degree` through the export aliases; the copy prints the same constants, `TauCeti.RiemannSurface.FiniteHolomorphicMap` and `TauCeti.RiemannSurface.degree`.

## Previous findings

- R01 — not repaired: `Suggested.lean` 68 still reads `abbrev CompactifiedQuotient (Γ : Subgroup PSL(2, ℝ)) : Type := Γ.CompactifiedQuotient`, and 167–169 still export seven `TauCeti.RiemannSurface` names. The merge (step 1) is done; steps 2–4 are not. Carried above as R01.

## Verified sound

**Gate, dependencies and build.**

- Gate rerun on this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate on this head, including the targeted build (`build=0`), also passed.
- The dependency check prints `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
  - FuchsianOrbifolds is line 49 of the merge order.
  - ArithmeticFuchsianGroups, TeichmullerGeometry and FuchsianOrbifoldsPartII are at lines 286, 287 and 303.
- `lake env lean` on `Suggested.lean` gives 8 `sorry` warnings (lines 61, 89, 99, 113, 125, 133, 144 and 153) and nothing else.

**Elaborated signatures.** A scratch file `#check @`s the 9 declarations the repair keeps, the 2 exports and 5 pinned names:

- 7 are textually identical to `signatures.md`: `genus`, `eulerChar_eq_two_sub_two_mul_genus`, the area formula and the four minimal-area theorems.
- `isRiemannianManifold_upperHalfPlane` matches up to the printed namespace prefix.
- `riemannHurwitz` matches up to the export aliases noted under R01.
- The file has no `variable` block, so no binder can be lost.
- Pinned at Tau Ceti:
  - `Subgroup.CompactifiedQuotient.instChartedSpace : [DiscreteTopology Γ] → ChartedSpace ℂ Γ.CompactifiedQuotient`;
  - `Subgroup.CompactifiedQuotient.cuspChart_mem_atlas (D : Γ.CuspDatum) (hA : D.width ≤ A)`;
  - `TauCeti.RiemannSurface.FiniteHolomorphicMap`, `TauCeti.RiemannSurface.degree` and `TauCeti.RiemannSurface.ramificationDegree`, each `(X → Y) → ℕ` or a type over two charted spaces.

**Citations after the merge.** The merge replaced the branch's copies of roadmaps this README cites, so the citations were re-resolved against those files (now identical to main `1bea835`).

- `roadmaps resolve`: no cross-roadmap citation is found nowhere. The one Lean-name lead, `RiemannSurface.riemannHurwitz` (README 180), is this file's own export and resolves under `#check`.
- `TauCetiRoadmap/ModularForms/README.md` (3218 lines changed by the merge):
  - "Layers 0–9" are at 351–1016;
  - §10A is at 1150. Its level-one Check (1169), `(d, ε₂, ε₃, ε∞) = (1,1,1,1)` giving genus `0`, is the "level-one Check of the genus formula" that README 920 cites;
  - §10B is at 1173. Its genus comparison (1228) compares `g_an = dim H¹(X, 𝒪)` with the topological genus, and its *Needs:* (1243) names FuchsianOrbifolds Layers 4–5, as README 134–135 states;
  - §10C is at 1247 and §10D at 1313. §10D's *Needs:* (1436) takes `X(1) ≃ ℙ¹` through §10A and "FuchsianOrbifolds Layers 3–4", consistent with README 138–140.
- README 179–181 says `RiemannSurface.genus` is the name PseudoholomorphicCurveAnalysis and NoncongruenceModularForms cite. Both cite it on main: PseudoholomorphicCurveAnalysis at 194, 1317 and 1378; NoncongruenceModularForms, which the merge added to the branch, at 651 and 1400.
- The merge changed only `PROGRESS.md` and `STATUS.md` of AlgebraicTopology, so README 122–127, 295 and 667–889, which cite Stage 6 items 4–5 and Stage 8 item 7, are unaffected.
- `roadmaps overlaps`: the only pull request that changes this roadmap is this one. No cited id is dropped or defined only by an open revision. The closest roadmaps in vocabulary are those listed in ~17: FuchsianOrbifoldsPartII, ArithmeticFuchsianGroups, TeichmullerGeometry, GroupActionsOnRiemannSurfaces and KleinianGroups.

**Sources: the seeded sample.** The 8 "Source spine:" lines are unchanged, at 369, 407, 565, 606, 661, 817, 903 and 940. I re-read Martin2013 lines 212–227 (page 6) this round:

- Theorem 2.1 (213–214): `μ(2) = π/21`, attained only by the `(2,3,7)` triangle group. This supports `pi_div_twentyOne_le_covolume` and `covolume_eq_pi_div_twentyOne_iff` with signature `(0; 2, 3, 7)`.
- Theorem 2.2 (217–227): the area `2π(2g − 2 + N + Σ(1 − 1/mⱼ))`. This supports `covolume_eq_two_pi_mul_signature` and line 903's "Martin, Theorems 2.1 and 2.2".

**Adversarial table.** Rows marked "new" are computed this round. Rows marked "~17" are carried from review ~17 (most from ~14 to ~16), because no statement changed.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| new: R01 block, users at `6c607a2` | tree at this head; main `1bea835`; open heads | `.lean` files outside the folder naming the module: 0; `Fuchsian` in ModularForms' `Suggested.lean`: 0 (was 1 import + 11 `#check`s before the merge); `compactifiedChartedSpace` outside this folder at open heads: 0; repaired copy: 8 `sorry` warnings, 0 errors | R01 |
| new: README 920 against ModularForms §10A | `X(1)`: `χ = 2`; §10A formula `1 + d/12 − ε₂/4 − ε₃/3 − ε∞/2` | `genus X(1) = ((2 − 2)/2).toNat = 0`; §10A: `1 + 1/12 − 1/4 − 1/3 − 1/2 = 0` | agree |
| new: §10A formula against `riemannHurwitz` | `X₀(2) → X(1)`: `d = 3`, `ε₂ = 1`, `ε₃ = 0`, `ε∞ = 2` | §10A: `1 + 1/4 − 1/4 − 0 − 1 = 0`. RH: `2·0 − 2 = 3(2·0 − 2) + R` forces `R = 4`. The fibres give `R = 4`: over `∞`, widths `1, 2` contribute `1`; over `i`, `e = 1, 2` contribute `1`; over `ρ`, one point with `e = 3` contributes `2` | consistent |
| new: README 179–181, users of `RiemannSurface.genus` | main after the merge | NoncongruenceModularForms: 2 citations; PseudoholomorphicCurveAnalysis: 3; other short names `RiemannSurface.{degree, localMultiplicity, …}` cited outside main's superseded copy: 0 | claim holds; the repair keeps both cited names |
| ~17: Conventions 242 and L3.4, scaling of a cusp datum | `σ′ = 2σ + 1`, `w = 1` | `w′ = 2`; factor `exp(πi) = −1`, so `q′ = −q`; pinned factor `exp(2π I b/(a·D.width))` gives `−1` | README formula = pin |
| ~17: L4.3, every cusp chart in the atlas | `D` with `A = w = 1`; `D′` with `A′ = w′ = 2`; transition `q ↦ −q` | `cuspChart_mem_atlas D le_rfl` and `D′ le_rfl` hold; the transition is linear | holds |
| ~17: L4.3, the cutoff "at least the width" | `PSL(2,ℤ)` at `∞`, `w = 1`; `z = 0.8i`, `Sz = −1/z` | at `A = 1/2`: `Im z = 0.8`, `Im Sz = 1.25`, not `T`-related, so not injective; at `A = 1`: `Im(gz) ≤ 1/y < 1` for `c ≠ 0` | cutoff needed and correct |
| ~17: L5.6 *Needs:* L2.1 | `Γ(2) ≤ PSL(2,ℤ)`, `d = 6` | `6 · π/3 = 2π`; `χ_orb = −1 = 6·(−1/6)` | holds |
| ~17: L5.7 *Needs:* L2.1 | `PSL(2,ℤ)`, `(0; 2, 3; 1)` | `2π(−2 + 1/2 + 2/3 + 1) = π/3 ≈ 1.0472` | holds |
| ~17: L4a.1–2 *Needs:* L2.1 | `(0;2,3,7)`; `(0;2,3;1)`; `(0;2;2)` | `δ = 1/42` gives `π/21 ≈ 0.1496`; `δ = 1/6` gives `π/3`; `δ = 1/2` gives `π` | holds |
| ~17: dependency table | Depends cells inverted | each equals its Feeds cell (L0–L5, L4a) | consistent |
| ~17: paragraph, one exception | forward citations inside layers | 1 real interleave (L2/L3), stated; 3 pointers (L2.5, L4.5, L5.6) are not uses | holds |
| ~17: README 36, what ArithmeticFuchsianGroups takes | AFG contract 267–284 | L0 `{1,2,3}`; L2 `{1,3,4,5}`; L4 `{5}`; L4a; L5 `{5,6,7}` | equal |
| ~17: README 109–116, free-locus covering | `PSL(2,ℤ)` at `i`, `ρ`, `2i` | stabilizer orders `2, 3, 1`; covering only at `2i` | as stated |
| ~17: meridian endpoint | `PSL(2,ℤ)` at `∞`, `w = 1`, start `i` | `n = 1` ends at `1 + i = T·i`; the inverse convention gives `−1 + i` | matches |
| ~17: cusp extensions | `exp(2πiz)`; `j` | `F(q) = q`, `F(0) = 0`; `j` has a pole of order `1` | as stated |
| ~17: `isRiemannianManifold_upperHalfPlane` | `(i,2i)`, `(i,3i)`, `(i,1+i)` | `log 2 = 0.693147`; `log 3 = 1.098612`; `0.962424 < 1` | holds |
| ~17: `genus` | `P¹`, torus, genus 3, `RP²`, `P¹ ⊔ P¹` | `0, 1, 3`; `RP²` gives `0` (junk); `P¹ ⊔ P¹` gives `0` (junk) | determines the genus |
| ~17: `eulerChar_eq_two_sub_two_mul_genus` | genus 3; `P¹ ⊔ P¹`; `ℂ`; `X(1)` | `−4 = 2−6`; `4 ≠ 2`; `χ(ℂ) = 1 ≠ 2`; `2 = 2−0` | holds; both hypotheses needed |
| ~17: `riemannHurwitz` | `z³`; `[2]` on `E`; genus 2 → `P¹`; sign error | `−2 = 3(−2)+4`; `0 = 0`; `2 = 2(−2)+6`; with `−R`, `−2` against `−6` | holds |
| ~17: L5.3 punctured step | tetrahedron, `z²` | `0 = 2·0`; the no-drop model gives `2 = 4` | holds |
| ~17: `covolume_eq_two_pi_mul_signature` | `PSL(2,ℤ)`, `Γ₀(2)`, `Γ(2)`, `(2,3,7)`, trivial group | `π/3`; `π`; `2π`; `π/21`; trivial group: RHS `0`, LHS `∞` | holds; `hΓ` needed |
| ~17: L5.7 cell count | `(3,1,1,1)`, `(4,0,0,3)`, `(4,0,0,1)`, `(8,0,1,0)` | `2, 2, 0, −2`; the wrong count gives `1` | holds |
| ~17: `pi_div_twentyOne_le_covolume` | `(2,3,7)`, `(2,3,8)`, `(2,4,5)`, `(3,3,4)`, `PSL(2,ℤ)` | `π/21, π/12, π/10, π/6, π/3`, all `≥ 0.1496` | holds |
| ~17: L4a.1 cases | `(2,3,m)`, `m = 6, 7, 8`; `(2,4,4)`; `(2,4,5)`; `(3,3,3)`; `(2,2,2,3)`; `(1;2)` | `0, 1/42, 1/24`; `0`; `1/20`; `0`; `1/6`; `1/2` | minimum `1/42` only at `(2,3,7)` |
| ~17: `covolume_eq_pi_div_twentyOne_iff` | `(2,3,7)`, `(2,3,8)`, `PSL(2,ℤ)` | T/T; F/F; F/F | agree both ways |
| ~17: `minimum_area_finite_area_orbifold` | `PSL(2,ℤ)`, `Γ₀(2)`, `(0;2,4;1)`, `(2,3,7)` | `π/3, π, π/2 ≥ 1.0472`; with no cusp, `π/21 < π/3` | holds; cusp needed |
| ~17: `covolume_eq_pi_div_three_iff` | `PSL(2,ℤ)`, `Γ₀(2)`, `(0;2,4;1)`, `(0;3,3;1)` | T/T; F/F; F/F; F/F | agree both ways |
| ~17: L2.1 tensor Checks, completeness | `diag(2,1)` at `i`; `−1/z` at `2i`; `i/n` | `1 = 4/4`; `1/4 = 1/4`; `dist(i/n, i/2n) = log 2` | conventions pinned |
| ~17: L0.1, L0.2 | discrete `PSL(2,ℝ)`; `diag(1,−1)` | uncountable, so not second countable; `1+i ↦ −1+i`, both distances `2 arsinh(1/2)` | as stated |
| ~17: L1.2, L3.3, Layer 6 | `ε = log 3, m = 3`; `S(2i)`; `j` | radius `1/8`; height `1/2`; orders `3, 2`, simple pole, degree 1 | holds |

**Headline theorems and padding.** Both are carried from ~14 to ~17, because `Suggested.lean` is unchanged.

- Completion criterion items 1–5 and 7–8, and the branched-cover formula of item 6, are proved at the pin and named in the docstring.
- These are stated: `χ = 2 − 2g`, Riemann–Hurwitz, the area formula, the four minimal-area theorems and the distance comparison.
- All 8 sorried theorems stay open under the one-tactic probe of ~13.
- The two abbreviations of R01 are the only declarations no headline needs.

## Not verifiable

- These are recorded `uncertified` in the manifest and are cited by locator only: Beardon1983, Forster1981, FarkasKra1992, DiamondShurman2005, Serre1973, Stillwell1992 and Siegel1945. Siegel's statement was read through Martin2013, Theorem 2.1.
- Katok, *Fuchsian Groups* (1992), and Miranda, *Algebraic Curves and Riemann Surfaces* (1995), are cited without a key in the package's `sources.toml`. In ~13 the sources service found no legal copy of either.
- Ownership against open pull requests: the head adds no object to the folder, so the ownership audit of ~13 stands. The merge's effect on the users of the R01 block and on the cited ModularForms sections was re-checked with the `roadmaps` tools and the files at this head.

## Source issues

- **Misprint** in Martin2013 at Theorem 2.2, p. 6 (lines 217–222): the source names the number of punctures with one letter and then writes a different letter for the cusp count in the area formula; it should use one letter for the number of cusps; affects nothing.
