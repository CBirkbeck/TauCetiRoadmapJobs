# Review of FuchsianOrbifolds (pull request #1168 at ed1a829)

**Verdict:** needs changes

This is an incremental re-review of the 42 changed lines since `d7cd3ac`. Two findings remain, both P3 and neither blocking:

- R01 is carried, not repaired.
- R02 is new. It is in the dependency table that this head edits.

The gate passes.

## R01 (P3) — The compatibility block in `Suggested.lean` has no consumer once main is merged

*Carried from R01 of reviews ~6 to ~14.* No repair report on the board marks it not actionable. `Suggested.lean` is unchanged since `cafadfb`, and this head changes only `README.md`.

- **Location.**
  - `TauCetiRoadmap/FuchsianOrbifolds/Suggested.lean`:
    - 64–75: `abbrev CompactifiedQuotient (Γ : Subgroup PSL(2, ℝ)) : Type := Γ.CompactifiedQuotient` and `noncomputable abbrev compactifiedChartedSpace … := inferInstance`;
    - 163–169: the comment and `export TauCeti.RiemannSurface (FiniteHolomorphicMap localMultiplicity degree degree_comp divisorPullback biholomorphOfDegreeEqOne biholomorphOfDegreeEqOne_toFun)`;
    - import line 7;
    - docstring 18–20.
  - `TauCetiRoadmap/FuchsianOrbifolds/README.md` 181–185, from "It also declares `CompactifiedQuotient`" to "under the same short names `RiemannSurface.*`."
- **Claim.**
  - No headline uses either abbreviation, and each one restates a pinned Tau Ceti declaration. The form rules allow a definition only where a headline needs it.
  - The first `export` is a catalogue of seven library names under new names.
  - The block's only user is this branch's merge-base copy of `TauCetiRoadmap/ModularForms/Suggested.lean`, and main has replaced that file.
- **Witness.** The branch's `TauCetiRoadmap/ModularForms/Suggested.lean` imports this module (line 2) and `#check`s the names (lines 89–99). Main (`11b9f2e`) and the clean `git merge-tree --write-tree HEAD origin/main` tree contain no such line, and no open head imports this module.
- **Repair.**
  1. Merge `origin/main` into the branch, so that `TauCetiRoadmap/ModularForms/Suggested.lean` becomes main's file. Without this step the targeted build of `TauCetiRoadmap.ModularForms.Suggested` breaks. If the repair job may not merge, the operator does this step.
  2. In `Suggested.lean`:
     - delete lines 64–75 and import line 7;
     - delete lines 163–169 (the comment and the first `export`);
     - after `end TauCetiRoadmap.FuchsianOrbifolds`, keep `namespace RiemannSurface` / `export TauCetiRoadmap.FuchsianOrbifolds (genus riemannHurwitz)` / `end RiemannSurface`, under the comment "The short names `RiemannSurface.genus` and `RiemannSurface.riemannHurwitz`."
     - These two short names stay because roadmaps on main cite `RiemannSurface.genus`: NoncongruenceModularForms (README 651 and 1400) and PseudoholomorphicCurveAnalysis (README 194, 1317 and 1378).
     - No roadmap cites the seven degree-API short names. Every occurrence outside this folder is `TauCeti.`-qualified: TeichmullerGeometry README 9, 66, 814, 822, 951 and 959, at its open head.
  3. In docstring 18–20, replace everything after "the one definition they need," with "`genus`, and exports `genus` and `riemannHurwitz` as `RiemannSurface.genus` and `RiemannSurface.riemannHurwitz`."
  4. In the README, delete 181–185 from "It also declares" to "short names `RiemannSurface.*`.". Keep the next sentence, "The carrier written `CompactifiedQuotient Γ` in other roadmaps is Tau Ceti's `Γ.CompactifiedQuotient`".

  I retested the repair this round on a scratch copy with steps 2 and 3 applied:
  - it elaborates with 8 `sorry` warnings and nothing else;
  - `#check @RiemannSurface.genus` and `#check @RiemannSurface.riemannHurwitz` resolve;
  - `riemannHurwitz` elaborates against `TauCeti.RiemannSurface.FiniteHolomorphicMap`, `TauCeti.RiemannSurface.degree` and `TauCeti.RiemannSurface.ramificationDegree`.

## R02 (P3) — The dependency table's Feeds column still disagrees with its Depends column in three places

- **Location.** `TauCetiRoadmap/FuchsianOrbifolds/README.md` 947–952, the table whose Feeds cells this head edits:
  - row L0: "| L0 effective action and free locus | Mathlib, ComplexManifolds Milestone 4 | L1–L4, L6 |";
  - row L4: "| L4 compactification | L1–L3 | L5–L6 |";
  - row L5: its Depends cell ends "…, L2, L4".
- **Claim.** This head edits the Feeds cells of L0 and L2 so that Feeds match Depends. Three entries still do not match:
  - row L0 feeds L4, but row L4 depends only on L1–L3;
  - rows L1 and L3 each feed L5 (`L4–L6`), but row L5 lists neither of them.

  The Feeds cells are the accurate side, and the Depends cells of L4 and L5 are incomplete.
- **Witness.**
  - L5.4 (734) cites L1.5's `Subgroup.existsUnique_mdifferentiable_quotientMk` (402) and L3.5's q-expansion criterion.
  - L5.7's *Needs:* (794) cites L3.1's `finite_cuspOrbit`.
  - L4.4's `ellipticRamificationIndex_eq_index` assumes L0.4's finite stabilizers.
- **Repair.** Leave every Feeds cell unchanged and edit two Depends cells:
  - in row L4, replace "L1–L3" with "L0–L3";
  - in row L5, replace "L2, L4" with "L1–L4".

  I tested the repaired table by inverting its Depends cells:
  - L0 → {L1, L2, L3, L4, L6}
  - L1 → {L4, L5, L6}
  - L2 → {L3, L4, L5, L6}
  - L3 → {L4, L5, L6}
  - L4 → {L5, L6}
  - L5 → {L4a, L6}

  Each set equals its row's Feeds cell. The paragraph under the table, "items 4–7 begin after Layer 4", stays true.

## Previous findings

- R01 — not repaired: `Suggested.lean` 68 still reads `abbrev CompactifiedQuotient (Γ : Subgroup PSL(2, ℝ)) : Type := Γ.CompactifiedQuotient`; 167–169 still export `TauCeti.RiemannSurface (FiniteHolomorphicMap localMultiplicity degree …)`; README 181–185 still describes them. Carried above as R01.

## Verified sound

**Gate, dependencies and build.**

- Gate rerun on this head: `set_option=0 blob=0 latex=0 … layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate, including the targeted build of both modules (`build=0`), also passed.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- Depcheck output: `depcheck: 235 roadmaps, 2259 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
  - FuchsianOrbifolds is line 49 of the merge order.
  - Its consumers ArithmeticFuchsianGroups, TeichmullerGeometry and FuchsianOrbifoldsPartII are at lines 286, 287 and 303.
- `lake env lean` on `Suggested.lean`: 8 `sorry` warnings (lines 61, 89, 99, 113, 125, 133, 144 and 153) and nothing else.
- `roadmaps resolve` gives one lead, `RiemannSurface.riemannHurwitz` (README 180). It is this file's own export, and `#check @RiemannSurface.riemannHurwitz` resolves it.
- `roadmaps overlaps`: no other pull request changes this roadmap, and no cited id is dropped or defined only by an open revision.

**What the change is.** I replaced `–` with `--` in both heads and diffed. Two lines remain:

- the Feeds cell of L0 (`L1--L4` → `L1--L4, L6`);
- the Feeds cell of L2 (`L3--L4, L6` → `L3--L6`).

The other 19 changed lines are dash-only. They are:

- README 141 and 205 ("Riemann–Roch"), 2 lines;
- the seven changed "Source spine:" statements, on 8 lines (818–819 is one statement);
- the 5 other table rows (948, 950–953);
- the parallel-work paragraph (959);
- three reference entries (1003, 1005, 1007).

Both new edges are correct:

- L0 → L6: Layer 6 item 1 (911) applies "Layers 0–4" to the level-one group.
- L2 → L5: Layer 5 item 7's *Needs:* (790) lists "Layer 2 items 4 and 5".

No `--` remains in the README outside the two table-rule lines, 878 and 946. The remark of ~14 on README 141 is resolved: the line now reads "Riemann–Roch".

**Elaborated signatures.** A scratch copy `#check @`s the 11 declarations and the 2 exports.

- All are identical to `signatures.md` and to ~14. The file is unchanged and has no `variable` block.
- A second scratch file resolves the names that R02 cites, at the Tau Ceti pin:
  - `Subgroup.existsUnique_mdifferentiable_quotientMk` (`Fuchsian/Descent.lean` 138), which assumes `ProperlyDiscontinuousSMul Γ ℍ`;
  - `Subgroup.existsUnique_meromorphicAt_quotientMk` (`Fuchsian/MeromorphicDescent.lean` 140);
  - `Subgroup.IsCofinite.finite_cuspOrbit` (`Fuchsian/Cusp/Finite.lean` 241);
  - `Subgroup.ellipticRamificationIndex_eq_index` (`Fuchsian/Elliptic/Ramification.lean` 128), which assumes `[Finite (stabilizer Γ z)]`;
  - `TauCeti.Fuchsian.exists_meromorphicAt_comp_ofQuotient`;
  - `TauCeti.Subgroup.CuspDatum.analyticAt_cuspExtension_zero`.

**Users of the R01 block, checked this round.**

- The branch's ModularForms copy: 11 `#check` lines and 1 import.
- Main `11b9f2e`: 0. Its ModularForms supplier contract "From TauCetiRoadmap.FuchsianOrbifolds" (README 285–293) names layers, not these Lean names.
- The merged tree: 0 in `TauCetiRoadmap/ModularForms/Suggested.lean`.
- `roadmaps grep --fixed`:
  - "import TauCetiRoadmap.FuchsianOrbifolds": no match on main or at the 457 heads;
  - "FuchsianOrbifolds.CompactifiedQuotient": no match;
  - "compactifiedChartedSpace": only this folder, on main and at this head.

**Sources: the seeded sample.** The 8 "Source spine:" lines are at README 369, 407, 565, 609, 662, 818, 903 and 940.

- Seven changed only from `--` to `–`. After normalisation each one is identical to the `d7cd3ac` text, with every chapter and section number unchanged. Line 903 is untouched.
- The cited books are recorded as uncertified, as in ~13 and ~14.
- The library files the spine lines cite exist at the pins: Mathlib's `Analysis/Complex/UpperHalfPlane/ProperAction.lean` and `FixedPoints.lean`, and Tau Ceti's `Analysis/Complex/ModularForms/LevelOne/JInputs.lean`.
- I re-read Martin2013, the one certified text, this round:
  - lines 199–204: `μ(2)` is the infimum over all lattices;
  - lines 212–214 (p. 6, Theorem 2.1): `μ(2) = π/21`, attained only by the `(2,3,7)` triangle group;
  - lines 217–227 (Theorem 2.2): the signature area formula.

  Line 903's "Martin, Theorems 2.1 and 2.2" matches.

**Adversarial table.** Rows marked "new" are computed this round for the changed passages. Rows marked "~14" are carried from review ~14, for statements the diff leaves untouched.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| new: table, Feeds of L0 (changed cell) | Depends cells of rows L1–L6 and L4a | stated `{L1, L2, L3, L4, L6}`; inverse of Depends `{L1, L2, L3, L6}` | extra L4 → R02 |
| new: table, Feeds of L2 (changed cell) | same | stated `{L3, L4, L5, L6}`; inverse `{L3, L4, L5, L6}` | equal |
| new: table, Feeds of L1 and L3 | same; L5 items 4 and 7 | both stated `{L4, L5, L6}`; inverse `{L4, L6}`; L5.4 uses L1.5 and L3.5, L5.7 uses L3.1 | Feeds right, L5 Depends short → R02 |
| new: table, Feeds of L4 and L5 | same | L4: `{L5, L6}` = `{L5, L6}`; L5: `{L4a, L6}` = `{L4a, L6}` | equal |
| new: table after the R02 repair | L4 Depends `L0–L3`, L5 Depends `L1–L4` | inverses: L0 `{1,2,3,4,6}`, L1 `{4,5,6}`, L2 `{3,4,5,6}`, L3 `{4,5,6}`, L4 `{5,6}`, L5 `{4a,6}`, all equal to Feeds | consistent |
| new: edges L0 → L6 and L2 → L5 | L6 item 1 (911); L5 item 7 *Needs:* (790) | "Layers 0–4 applied"; "Layer 2 items 4 and 5" | both real |
| new: the 21 changed lines | `–` → `--` normalisation of both heads | 21 changed lines leave 2 substantive lines (947, 949) | dash-only otherwise |
| new: 8 spine locators | 369, 407, 565, 609, 662, 818, 903, 940 | 7 changed, 0 locator tokens changed; Martin2013 Thm 2.1 at line 213, Thm 2.2 at line 217 | as before |
| ~14: README 36, what ArithmeticFuchsianGroups takes | AFG contract 267–284 | L0 `{1,2,3}`; L2 `{1,3,4,5}`; L4 `{5}`; L4a; L5 `{5,6,7}` | equal |
| ~14: README 109–116, the free-locus covering | `PSL(2,ℤ)` at `i`, `ρ`, `2i` | stabilizer orders `2`, `3`, `1`; covering only at `2i` | as stated |
| ~14: README 112–114, meridian endpoint | `PSL(2,ℤ)` at `∞`, `w = 1`, start `i` | `n = 1` ends at `1 + i = T·i`, while the inverse convention gives `−1 + i`; `n = −1` ends at `−1 + i` | matches `meridian_lift_endpoint` |
| ~14: README 117–121, cusp extensions | `exp(2πiz)`; `j` | `F(q) = q`, `F(0) = 0`; `j` has a pole of order `1` | removable singularity and q-expansion |
| ~14: `isRiemannianManifold_upperHalfPlane` | `(i,2i)`, `(i,3i)`, `(i,1+i)` | `log 2 = 0.693147`; `log 3 = 1.098612`; `0.962424 < 1` | holds |
| ~14: `genus` | `P¹`, torus, genus 3, `RP²`, `P¹ ⊔ P¹` | `0, 1, 3`; `RP²` gives `0` (junk); `P¹ ⊔ P¹` gives `0` (junk) | determines the genus |
| ~14: `eulerChar_eq_two_sub_two_mul_genus` | genus 3; `P¹ ⊔ P¹`; `ℂ`; `X(1)` | `−4 = 2−6`; `4 ≠ 2`; `χ(ℂ) = 1 ≠ 2`; `2 = 2−0` | holds; both hypotheses needed |
| ~14: `riemannHurwitz` | `z³`; `[2]` on `E`; genus 2 → `P¹`; sign error | `−2 = 3(−2)+4`; `0 = 0`; `2 = 2(−2)+6`; with `−R`, `−2` against `−6` | holds |
| ~14: L5.3 punctured step | tetrahedron, `z²` | `0 = 2·0`; the no-drop model gives `2 = 4` | holds |
| ~14: `covolume_eq_two_pi_mul_signature` | `PSL(2,ℤ)`, `Γ₀(2)`, `Γ(2)`, `(2,3,7)`, trivial group | `π/3`; `π`; `2π`; `π/21`; trivial group: RHS `0`, LHS `∞` | holds; `hΓ` needed |
| ~14: L5.7 cell count | `(3,1,1,1)`, `(4,0,0,3)`, `(4,0,0,1)`, `(8,0,1,0)` | `2, 2, 0, −2`; the wrong count gives `1` | holds |
| ~14: L5.6 | `Γ(2) ≤ PSL(2,ℤ)`, `d = 6` | `−2 = 6(−2)+10`; `−1 = 6(−1/6)` | holds |
| ~14: `pi_div_twentyOne_le_covolume` | `(2,3,7)`, `(2,3,8)`, `(2,4,5)`, `(3,3,4)`, `PSL(2,ℤ)` | `π/21, π/12, π/10, π/6, π/3`, all `≥ 0.1496` | holds |
| ~14: L4a.1 cases | `(2,3,m)` for `m = 6, 7, 8`; `(2,4,4)`; `(2,4,5)`; `(3,3,3)`; `(2,2,2,3)`; `(1;2)` | `0, 1/42, 1/24`; `0`; `1/20`; `0`; `1/6`; `1/2` | minimum `1/42` only at `(2,3,7)` |
| ~14: `covolume_eq_pi_div_twentyOne_iff` | `(2,3,7)`, `(2,3,8)`, `PSL(2,ℤ)` | T/T; F/F; F/F | agree both ways |
| ~14: `minimum_area_finite_area_orbifold` | `PSL(2,ℤ)`, `Γ₀(2)`, `(0;2,4;1)`, `(2,3,7)` | `π/3, π, π/2 ≥ 1.0472`; with no cusp, `π/21 < π/3` | holds; cusp needed |
| ~14: `covolume_eq_pi_div_three_iff` | `PSL(2,ℤ)`, `Γ₀(2)`, `(0;2,4;1)`, `(0;3,3;1)` | T/T; F/F; F/F; F/F | agree both ways |
| ~14: L2.1 tensor Checks, completeness | `diag(2,1)` at `i`; `−1/z` at `2i`; `i/n` | `1 = 4/4`; `1/4 = 1/4`; `dist(i/n, i/2n) = log 2` | conventions pinned |
| ~14: L0.1, L0.2 | discrete `PSL(2,ℝ)`; `diag(1,−1)` | uncountable, so not second countable; `1+i ↦ −1+i`, both distances `2 arsinh(1/2)` | as stated |
| ~14: cusp scaling, L1.2, L3.3, Layer 6 | `a=2, b=1, w=1`; `ε = log 3, m = 3`; `S(2i)`; `j` | `q′ = −q`; radius `1/8`; height `1/2`; orders `3, 2`, simple pole, degree 1 | holds |
| R01 block | users on main, at 457 heads, in the merged tree | branch copy: 11 `#check` lines; main: 0; merged tree: 0; repaired copy: 8 `sorry` warnings | R01 |

**Headline theorems and padding.** Both are carried from ~14, because `Suggested.lean` is unchanged.

- Completion criterion items 1–5 and 7–8, and the branched-cover formula of item 6, are proved at the pin and named in the docstring.
- These are stated: `χ = 2 − 2g`, Riemann–Hurwitz, the area formula, the four minimal-area theorems and the distance comparison.
- All 8 sorried theorems stay open under the one-tactic probe of ~13.

**Remarks on untouched text** (no change requested):

- Row L4a (954) depends on "L5 item 7, Tau Ceti deficit bound". Layer 4a's own text also uses Layer 4 items 2 and 3 (827–829), and its *Needs:* lines (855–856 and 889–890) also list AlgebraicTopology Stage 8 item 7 and ComplexManifolds Milestone 1. Row L4's Feeds correspondingly omits L4a.
- Layer 2 item 5 (538–549) states cusp-datum facts, and the cusp datum is Layer 3 item 2's `Subgroup.CuspDatum`, while row L3 depends on L2. Both layers are proved at the pin, so this loop blocks nothing.

## Not verifiable

- These are recorded `uncertified` in the manifest and are cited by locator only: Beardon1983, Forster1981, FarkasKra1992, DiamondShurman2005, Serre1973, Stillwell1992 and Siegel1945. Siegel's statement was read through Martin2013, Theorem 2.1.
- Katok, *Fuchsian Groups* (1992), and Miranda, *Algebraic Curves and Riemann Surfaces* (1995), are cited without a key in the package's `sources.toml`. In ~13 the sources service found no legal copy of either.
- Ownership against open pull requests: the changed passages add no object. I re-checked the R01 block's users at all 457 open heads with the `roadmaps` tools, and the ownership audit of ~13 stands.

## Source issues

- **Misprint** in Martin2013 at Theorem 2.2, p. 6 (lines 217–222): the source names the number of punctures with one letter and then writes a different letter for the cusp count in the area formula; it should use one letter for the number of cusps; affects nothing.
