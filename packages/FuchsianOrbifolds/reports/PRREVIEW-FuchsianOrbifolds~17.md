# Review of FuchsianOrbifolds (pull request #1168 at e7671f7)

**Verdict:** needs changes

This is an incremental re-review of the 52 changed lines since `c8c06eb`. The head edits only `README.md`:

- the Conventions pointer (242);
- Layer 3 item 4, which loses its atlas clause (593–596);
- Layer 4 item 3, which gains it (627–632);
- the *Needs:* lines of Layer 5 items 6 and 7 (754, 789) and Layer 4a items 1 and 2 (851–855, 886–890);
- the dependency table rows L2 and L4a (949, 954) and the paragraph under the table (956–964).

The previous R02 is repaired, and the repair introduced no problem. The previous R01 is not repaired: `Suggested.lean` is unchanged, so R01 is carried below. There is no new finding. The one remaining finding is P3, nothing blocks, and the gate passes.

## R01 (P3) — The compatibility block in `Suggested.lean` has no consumer once main is merged

*Carried from R01 of reviews ~6 to ~16.* No repair report on the board marks it not actionable. `Suggested.lean` is unchanged since `cafadfb` (`git diff c8c06eb HEAD -- …/Suggested.lean` is empty).

- **Location.**
  - `TauCetiRoadmap/FuchsianOrbifolds/Suggested.lean`:
    - 64–75: the Layer 4 section comment, `abbrev CompactifiedQuotient (Γ : Subgroup PSL(2, ℝ)) : Type := Γ.CompactifiedQuotient` and `noncomputable abbrev compactifiedChartedSpace … := inferInstance`;
    - 163–169: the comment, `namespace RiemannSurface` and `export TauCeti.RiemannSurface (FiniteHolomorphicMap localMultiplicity degree degree_comp divisorPullback biholomorphOfDegreeEqOne biholomorphOfDegreeEqOne_toFun)`;
    - import line 7 (`TauCeti.Analysis.Complex.RiemannSurface.Divisor.Basic`);
    - docstring 18–20.
  - `TauCetiRoadmap/FuchsianOrbifolds/README.md` 181–185, from "It also declares `CompactifiedQuotient`" to "under the same short names `RiemannSurface.*`."
- **Claim.**
  - No headline uses either abbreviation, and each one only renames a pinned Tau Ceti declaration. The form rules allow a definition only where a headline needs it.
  - The first `export` is a catalogue that gives seven library names new names.
  - The block's only user is this branch's merge-base copy of `TauCetiRoadmap/ModularForms/Suggested.lean`, which main has replaced.
- **Witness.**
  - The branch's `TauCetiRoadmap/ModularForms/Suggested.lean` imports this module (line 2) and `#check`s the names (lines 89–99).
  - Main (`1bea835`) has no such line. Neither does the tree of `git merge-tree --write-tree HEAD origin/main`, which merges cleanly (exit 0); its ModularForms file has 0 occurrences of `FuchsianOrbifolds`.
  - On main and at every open head, `roadmaps grep` finds no match for `TauCetiRoadmap.FuchsianOrbifolds.Suggested` or `FuchsianOrbifolds.CompactifiedQuotient`. For `compactifiedChartedSpace` it finds only this file, this README and main's old copy of this file.
- **Repair** (unchanged from ~16):
  1. Merge `origin/main` into the branch, so that `TauCetiRoadmap/ModularForms/Suggested.lean` becomes main's file. Without this step the targeted build of `TauCetiRoadmap.ModularForms.Suggested` breaks. If the repair job may not merge, the operator does this step.
  2. In `Suggested.lean`:
     - delete lines 64–75 and import line 7;
     - delete lines 163–169 (the comment, `namespace RiemannSurface` and the first `export`);
     - after `end TauCetiRoadmap.FuchsianOrbifolds`, write the comment "The short names `RiemannSurface.genus` and `RiemannSurface.riemannHurwitz`.", then `namespace RiemannSurface`, then the existing `export TauCetiRoadmap.FuchsianOrbifolds (genus riemannHurwitz)`, then `end RiemannSurface`.
     - These two short names stay because roadmaps on main cite `RiemannSurface.genus`: NoncongruenceModularForms and PseudoholomorphicCurveAnalysis.
  3. In docstring 18–20, replace everything after "the one definition they need," with "`genus`, and exports `genus` and `riemannHurwitz` as `RiemannSurface.genus` and `RiemannSurface.riemannHurwitz`."
  4. In the README, delete 181–185 from "It also declares" to "short names `RiemannSurface.*`.". Keep the next sentence, "The carrier written `CompactifiedQuotient Γ` in other roadmaps is Tau Ceti's `Γ.CompactifiedQuotient`".

  I retested steps 2 and 3 on a scratch copy at this head (157 lines):
  - it elaborates with 8 `sorry` warnings and nothing else;
  - `#check @RiemannSurface.genus` and `#check @RiemannSurface.riemannHurwitz` resolve;
  - `riemannHurwitz` elaborates against `TauCeti.RiemannSurface.FiniteHolomorphicMap`, `TauCeti.RiemannSurface.degree` and `TauCeti.RiemannSurface.ramificationDegree`.

## Previous findings

- R01 — not repaired: `Suggested.lean` 68 still reads `abbrev CompactifiedQuotient (Γ : Subgroup PSL(2, ℝ)) : Type := Γ.CompactifiedQuotient`; 167–169 still export `TauCeti.RiemannSurface (FiniteHolomorphicMap localMultiplicity degree …)`; README 181–185 still describes them. Carried above as R01.
- R02 — repaired:
  - (a) Row L4a now reads "| L4a minimal areas | L2 item 1, L3 item 1, L4, L5 items 1 and 7, …", and row L2's Feeds cell is "L3–L6, L4a".
  - (b) The atlas clause now ends Layer 4 item 3 (628–632), and the "Likewise" sentence is gone.
  - The repair introduced no problem. Its extra *Needs:* edits (L5.6, L5.7, L4a.1, L4a.2) are checked below.

## Verified sound

**Gate, dependencies and build.**

- Gate rerun on this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate on this head, including the targeted build of both modules (`build=0`), also passed.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The dependency check prints `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
  - FuchsianOrbifolds is line 49 of the merge order. ArithmeticFuchsianGroups, TeichmullerGeometry and FuchsianOrbifoldsPartII are at lines 286, 287 and 303.
- `lake env lean` on `Suggested.lean` gives 8 `sorry` warnings (lines 61, 89, 99, 113, 125, 133, 144 and 153) and nothing else.
- `roadmaps resolve` gives one lead, `RiemannSurface.riemannHurwitz` (README 180). It is this file's own export, and `#check @RiemannSurface.riemannHurwitz` resolves it.
- `roadmaps overlaps`: the only pull request that changes this roadmap is this one. No cited id is dropped or defined only by an open revision.

**Elaborated signatures.** A scratch copy `#check @`s the 11 declarations and the 2 exports. All are identical to `signatures.md` and to ~16; the file has no `variable` block.

The same scratch file resolves the pinned names that the changed lines rely on:

- `Subgroup.CompactifiedQuotient.cuspChart_mem_atlas : ∀ (D : Γ.CuspDatum) {A : ℝ} (hA : D.width ≤ A), cuspChart D hA ∈ atlas ℂ Γ.CompactifiedQuotient` (`Fuchsian/Compactification/Manifold.lean` 153).
- `Subgroup.CompactifiedQuotient.instChartedSpace` (Manifold.lean 120). Its atlas is the transported coarse charts together with `{c | ∃ D A (hA : D.width ≤ A), cuspChart D hA = c}`, and `mem_atlas_iff` (143) says the atlas contains exactly these charts.
- `Subgroup.CompactifiedQuotient.instIsManifold : IsManifold 𝓘(ℂ) ⊤`, which is `ω` (Manifold.lean 260).
- `cuspChart`, defined in `Compactification/Cusp/Chart.lean` 231, has source `cuspNhd D A`. That set is the cusp orbit together with the image of `horodisc D A` (`Compactification/Basic.lean` 128).
- `TauCeti.cuspDatum_width_eq_mul` and `TauCeti.cuspDatum_coordinate_eq`. The coordinate factor is `Complex.exp (2 * π * I * b / (a * D.width))`.
- `MeasureTheory.covolume_eq_card_mul_covolume` (`MeasureTheory/Group/FundamentalDomain.lean` 382). It needs `Countable Γ`, `HasFundamentalDomain` and `Δ ≤ Γ`.
- `Subgroup.IsCofinite.finite_cuspOrbit`.
- By grep at the pin:
  - `Subgroup.IsCofinite.finite_ellipticOrbits` (`Fuchsian/Elliptic/Cofinite.lean` 287, namespace `Subgroup`);
  - `MeasureTheory.covolume_pos` (FundamentalDomain.lean 358);
  - `TauCeti.one_div_forty_two_le_hyperbolic_deficit` and `TauCeti.hyperbolic_deficit_two_three_seven` (`Data/Rat/BranchDeficit.lean` 116, 196);
  - `TauCeti.ModularGroup.covolume_psl2zToPSL2RRange` (`Fuchsian/LevelOne/Basic.lean` 99).

**The moved atlas clause.**

- *Layer 4 item 3 states the pinned fact correctly.* "At any height at least the datum's width" is the hypothesis `hA : D.width ≤ A` of `cuspChart_mem_atlas`. The short name falls under Layer 4's opening sentence (610–612), which puts unqualified names in `Subgroup.CompactifiedQuotient`. "Layer 3 item 2" is the item that introduces `Subgroup.CuspDatum`.
- *The pointers follow the move.* The Conventions pointer (242) now names Layer 4 item 3, which now states the independence. Acceptance check 3 ("… but not the compactified atlas") agrees with it.
- *Layer 3 no longer looks ahead to Layer 4.* Its only remaining mention of a compactification is the file path `Fuchsian/Compactification/Polygon.lean` in item 3, which the table paragraph already lists as Layer 3 item 3's use of Layer 2 item 2.
- *No consumer cited the old place.* On main and at every open head, `roadmaps grep` finds no "FuchsianOrbifolds Layer 3 item 4", "§3.4", "L3.4", "Layer 4 item 3" or "L4.3". The consumers that cite this roadmap's Layer 3 cite it for cusp data, widths, q-coordinates or horodiscs, all of which stay in Layer 3:
  - ModularCurvesPartII 1515 and 3611;
  - FuchsianOrbifoldsPartII 192, 339 and 451;
  - NoncongruenceModularForms on main, 1174 and 1379.

  HabiroNahmSeries cites "Layers 3–5" for the cusp charts, and that range contains Layer 4 item 3. CongruenceSpectralGap cites "Layers 0–3" for the cusp coordinates, which stay in Layer 3 item 4.

**The single stated exception is now complete.** I listed every "Layer k" citation inside each layer section. Three point forward, and each is a pointer, not a use:

- L2.5 to L5.7, "computed … in Layer 5 item 7";
- L4.5 to L5.7, "its intrinsic form … is Layer 5 item 7's";
- L5.6 to L4a, "as in Layer 4a": the finite CW type comes through AlgebraicTopology Stage 8 item 7, which L5.6's *Needs:* lists directly.

None of the three is in this diff. Layer 3 has no forward citation left, so "except that Layers 2 and 3 interleave by item" is the only exception.

**Sources: the seeded sample.** The 8 "Source spine:" lines are now at 369, 407, 565, 606, 661, 817, 903 and 940. None lies in a changed hunk; 606 and 661 shifted by the deletion, with the same text.

- The moved clause stays within Diamond–Shurman §2.4, which both the Layer 3 spine (606) and the Layer 4 spine (661) cite.
- I re-read Martin2013 lines 212–225 this round:
  - Theorem 2.1 (line 213): `μ(2) = π/21`, attained only by the `(2,3,7)` triangle group;
  - Theorem 2.2 (lines 217–225): the signature area formula `2π(2g − 2 + N + Σ(1 − 1/mⱼ))`.
- So line 903's "Martin, Theorems 2.1 and 2.2" and the Layer 4a items' "Martin, Theorem 2.1" and "Theorem 2.2" match.

**Adversarial table.** Rows marked "new" are computed this round on the changed passages. Rows marked "~16" are carried from review ~16 (most from ~14 and ~15), for statements the diff leaves untouched.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| new: Conventions 242 and L3.4, scaling of a cusp datum | `σ′ = 2σ + 1`, `w = 1` | `w′ = a w = 2`; factor `exp(2πi·1/(2·1)) = exp(πi) = −1`, so `q′ = −q`; the pinned factor `exp(2π I b/(a·D.width))` gives the same `−1` | README formula = pin |
| new: L4.3, the cusp chart of every datum is in the atlas | `D` with `A = w = 1` and `D′` with `A′ = w′ = 2` (both satisfy `hA`); transition `q ↦ −q` | `cuspChart_mem_atlas D le_rfl` and `D′ le_rfl` both hold; the transition is linear, hence analytic | independence holds |
| new: L4.3, the cutoff "at least the width" | `PSL(2,ℤ)` at `∞`, `w = 1`; `z = 0.8i`, `S z = −1/z` | at `A = 1/2`, `Im z = 0.8` and `Im Sz = 1.25` both exceed `A`, yet `z` and `Sz` are not `T`-related, so the chart is not injective; at `A = 1`, `Im(gz) ≤ 1/y < 1` for `c ≠ 0` | cutoff needed and correct |
| new: L5.6 *Needs:* + L2.1 | `Γ(2) ≤ PSL(2,ℤ)`, `d = 6` | `covolume_eq_card_mul_covolume` needs `HasFundamentalDomain` (L2.1); `6 · π/3 = 2π`; `χ_orb = −2π/2π = −1 = 6·(−1/6)` | L2.1 is used |
| new: L5.7 *Needs:* + L2.1 | `PSL(2,ℤ)`, `(0; 2, 3; 1)` | `hΓ : Γ.IsCofinite` (L2.1); `2π(−2 + 1/2 + 2/3 + 1) = 2π/6 = π/3 ≈ 1.0472` | L2.1 is used |
| new: L4a.1 and L4a.2 *Needs:* + L2.1 | the four Lean statements; `(0;2,3,7)`; `(0;2,3;1)`; `(0;2;2)` | 4 of 4 statements take `hΓ : Γ.IsCofinite` and `covolume Γ ℍ`; `δ = 1/42` gives `π/21 ≈ 0.1496`; `δ = 1/6` gives `π/3`; `δ = −2 + 1/2 + 2 = 1/2` gives `π` | L2.1 is used |
| new: table rows L2 and L4a | Depends cells inverted | L0 → {L1, L2, L3, L4, L6}; L1 → {L4, L5, L6}; L2 → {L3, L4, L5, L6, L4a}; L3 → {L4, L5, L6, L4a}; L4 → {L5, L6, L4a}; L5 → {L6, L4a} | each equals its Feeds cell |
| new: table rows against *Needs:* lines | L4a row against L4a.1/L4a.2 *Needs:*; L5 row `L1–L4` against L5.6/L5.7 | L4a: L2.1, L4.2–3, L5.1, L5.7, and `finite_cuspOrbit` for L3.1; L5: L2.1, L2.4–5 and L4 all lie in `L1–L4` | consistent |
| new: paragraph, one exception | forward citations inside layers | at `c8c06eb`: 2 real interleaves (L2/L3, L3/L4); now 1 real (L2/L3), 1 stated; L2.5, L4.5 and L5.6 hold 3 pointers that are not uses | holds |
| ~16: paragraph, L3 uses no polygon except item 3 | import closures of 5 cusp modules | 75/55/48/46/58 modules, 0 polygon modules | holds |
| ~16: paragraph, L2 items 2, 5, 6 | statements of 4 cusp lemmas against 5 of items 3–4 | 4 mention cusp objects; 0 of 5 do | holds |
| ~16: README 36, what ArithmeticFuchsianGroups takes | AFG contract 267–284 | L0 `{1,2,3}`; L2 `{1,3,4,5}`; L4 `{5}`; L4a; L5 `{5,6,7}` | equal |
| ~16: README 109–116, the free-locus covering | `PSL(2,ℤ)` at `i`, `ρ`, `2i` | stabilizer orders `2`, `3`, `1`; covering only at `2i` | as stated |
| ~16: meridian endpoint | `PSL(2,ℤ)` at `∞`, `w = 1`, start `i` | `n = 1` ends at `1 + i = T·i`, while the inverse convention gives `−1 + i` | matches |
| ~16: cusp extensions | `exp(2πiz)`; `j` | `F(q) = q`, `F(0) = 0`; `j` has a pole of order `1` | as stated |
| ~16: `isRiemannianManifold_upperHalfPlane` | `(i,2i)`, `(i,3i)`, `(i,1+i)` | `log 2 = 0.693147`; `log 3 = 1.098612`; `0.962424 < 1` | holds |
| ~16: `genus` | `P¹`, torus, genus 3, `RP²`, `P¹ ⊔ P¹` | `0, 1, 3`; `RP²` gives `0` (junk); `P¹ ⊔ P¹` gives `0` (junk) | determines the genus |
| ~16: `eulerChar_eq_two_sub_two_mul_genus` | genus 3; `P¹ ⊔ P¹`; `ℂ`; `X(1)` | `−4 = 2−6`; `4 ≠ 2`; `χ(ℂ) = 1 ≠ 2`; `2 = 2−0` | holds; both hypotheses needed |
| ~16: `riemannHurwitz` | `z³`; `[2]` on `E`; genus 2 → `P¹`; sign error | `−2 = 3(−2)+4`; `0 = 0`; `2 = 2(−2)+6`; with `−R`, `−2` against `−6` | holds |
| ~16: L5.3 punctured step | tetrahedron, `z²` | `0 = 2·0`; the no-drop model gives `2 = 4` | holds |
| ~16: `covolume_eq_two_pi_mul_signature` | `PSL(2,ℤ)`, `Γ₀(2)`, `Γ(2)`, `(2,3,7)`, trivial group | `π/3`; `π`; `2π`; `π/21`; trivial group: RHS `0`, LHS `∞` | holds; `hΓ` needed |
| ~16: L5.7 cell count | `(3,1,1,1)`, `(4,0,0,3)`, `(4,0,0,1)`, `(8,0,1,0)` | `2, 2, 0, −2`; the wrong count gives `1` | holds |
| ~16: L5.6 | `Γ(2) ≤ PSL(2,ℤ)`, `d = 6` | `−2 = 6(−2)+10`; `−1 = 6(−1/6)` | holds |
| ~16: `pi_div_twentyOne_le_covolume` | `(2,3,7)`, `(2,3,8)`, `(2,4,5)`, `(3,3,4)`, `PSL(2,ℤ)` | `π/21, π/12, π/10, π/6, π/3`, all `≥ 0.1496` | holds |
| ~16: L4a.1 cases | `(2,3,m)` for `m = 6, 7, 8`; `(2,4,4)`; `(2,4,5)`; `(3,3,3)`; `(2,2,2,3)`; `(1;2)` | `0, 1/42, 1/24`; `0`; `1/20`; `0`; `1/6`; `1/2` | minimum `1/42` only at `(2,3,7)` |
| ~16: `covolume_eq_pi_div_twentyOne_iff` | `(2,3,7)`, `(2,3,8)`, `PSL(2,ℤ)` | T/T; F/F; F/F | agree both ways |
| ~16: `minimum_area_finite_area_orbifold` | `PSL(2,ℤ)`, `Γ₀(2)`, `(0;2,4;1)`, `(2,3,7)` | `π/3, π, π/2 ≥ 1.0472`; with no cusp, `π/21 < π/3` | holds; cusp needed |
| ~16: `covolume_eq_pi_div_three_iff` | `PSL(2,ℤ)`, `Γ₀(2)`, `(0;2,4;1)`, `(0;3,3;1)` | T/T; F/F; F/F; F/F | agree both ways |
| ~16: L2.1 tensor Checks, completeness | `diag(2,1)` at `i`; `−1/z` at `2i`; `i/n` | `1 = 4/4`; `1/4 = 1/4`; `dist(i/n, i/2n) = log 2` | conventions pinned |
| ~16: L0.1, L0.2 | discrete `PSL(2,ℝ)`; `diag(1,−1)` | uncountable, so not second countable; `1+i ↦ −1+i`, both distances `2 arsinh(1/2)` | as stated |
| ~16: L1.2, L3.3, Layer 6 | `ε = log 3, m = 3`; `S(2i)`; `j` | radius `1/8`; height `1/2`; orders `3, 2`, simple pole, degree 1 | holds |
| R01 block | users on main `1bea835`, at the open heads, in the merged tree | branch copy: 11 `#check` lines and 1 import; main: 0; merged tree: 0 occurrences; `roadmaps grep`: no outside user; repaired copy: 8 `sorry` warnings | R01 |

**Headline theorems and padding.** Both are carried from ~14 to ~16, because `Suggested.lean` is unchanged.

- Completion criterion items 1–5 and 7–8, and the branched-cover formula of item 6, are proved at the pin and named in the docstring.
- These are stated: `χ = 2 − 2g`, Riemann–Hurwitz, the area formula, the four minimal-area theorems and the distance comparison.
- All 8 sorried theorems stay open under the one-tactic probe of ~13.

**Remarks on untouched text** (no change requested):

- `Subgroup.IsCofinite.finite_ellipticOrbits` resolves at the pin (above). As in ~16, it is cited only as a Tau Ceti declaration, and no layer item names it as its own.

## Not verifiable

- These are recorded `uncertified` in the manifest and are cited by locator only: Beardon1983, Forster1981, FarkasKra1992, DiamondShurman2005, Serre1973, Stillwell1992 and Siegel1945. Siegel's statement was read through Martin2013, Theorem 2.1.
- Katok, *Fuchsian Groups* (1992), and Miranda, *Algebraic Curves and Riemann Surfaces* (1995), are cited without a key in the package's `sources.toml`. In ~13 the sources service found no legal copy of either.
- Ownership against open pull requests: the changed passages add no object. The ownership audit of ~13 stands. I re-checked consumers of the moved clause and the R01 block's users with the `roadmaps` tools.

## Source issues

- **Misprint** in Martin2013 at Theorem 2.2, p. 6 (lines 217–222): the source names the number of punctures with one letter and then writes a different letter for the cusp count in the area formula; it should use one letter for the number of cusps; affects nothing.
