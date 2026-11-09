# Review of FuchsianOrbifolds (pull request #1168 at c8c06eb)

**Verdict:** needs changes

This is an incremental re-review of the 31 changed lines since `ed1a829`. The head edits only `README.md`:

- the two Layer 4a *Needs:* lines (852, 887);
- the dependency table rows L3, L4, L5 and L4a (950–954);
- the paragraph under the table (956–966).

The previous R02 is repaired. The previous R01 is not, and is carried as R01. R02 below is new: the rewritten dependency section leaves out two edges that it states itself. Both findings are P3, neither blocks, and the gate passes.

## R01 (P3) — The compatibility block in `Suggested.lean` has no consumer once main is merged

*Carried from R01 of reviews ~6 to ~15.* No repair report on the board marks it not actionable. `Suggested.lean` is unchanged since `cafadfb`.

- **Location.**
  - `TauCetiRoadmap/FuchsianOrbifolds/Suggested.lean`:
    - 64–75: `abbrev CompactifiedQuotient (Γ : Subgroup PSL(2, ℝ)) : Type := Γ.CompactifiedQuotient` and `noncomputable abbrev compactifiedChartedSpace … := inferInstance`;
    - 163–169: the comment and `export TauCeti.RiemannSurface (FiniteHolomorphicMap localMultiplicity degree degree_comp divisorPullback biholomorphOfDegreeEqOne biholomorphOfDegreeEqOne_toFun)`;
    - import line 7 (`TauCeti.Analysis.Complex.RiemannSurface.Divisor.Basic`);
    - docstring 18–20.
  - `TauCetiRoadmap/FuchsianOrbifolds/README.md` 181–185, from "It also declares `CompactifiedQuotient`" to "under the same short names `RiemannSurface.*`."
- **Claim.**
  - No headline uses either abbreviation, and each one only renames a pinned Tau Ceti declaration. The form rules allow a definition only where a headline needs it.
  - The first `export` is a catalogue that gives seven library names new names.
  - The block's only user is this branch's merge-base copy of `TauCetiRoadmap/ModularForms/Suggested.lean`, which main has replaced.
- **Witness.**
  - The branch's `TauCetiRoadmap/ModularForms/Suggested.lean` imports this module (line 2) and `#check`s the names (lines 89–99).
  - Main (now `1bea835`) and the clean `git merge-tree --write-tree HEAD origin/main` tree (exit 0) contain no such line.
  - No open head imports this module.
- **Repair** (unchanged from ~15):
  1. Merge `origin/main` into the branch, so that `TauCetiRoadmap/ModularForms/Suggested.lean` becomes main's file. Without this step the targeted build of `TauCetiRoadmap.ModularForms.Suggested` breaks. If the repair job may not merge, the operator does this step.
  2. In `Suggested.lean`:
     - delete lines 64–75 and import line 7;
     - delete lines 163–169 (the comment, `namespace RiemannSurface` and the first `export`);
     - after `end TauCetiRoadmap.FuchsianOrbifolds`, write the comment "The short names `RiemannSurface.genus` and `RiemannSurface.riemannHurwitz`.", then `namespace RiemannSurface`, then the existing `export TauCetiRoadmap.FuchsianOrbifolds (genus riemannHurwitz)`, then `end RiemannSurface`.
     - These two short names stay because roadmaps on main cite `RiemannSurface.genus`: NoncongruenceModularForms and PseudoholomorphicCurveAnalysis.
  3. In docstring 18–20, replace everything after "the one definition they need," with "`genus`, and exports `genus` and `riemannHurwitz` as `RiemannSurface.genus` and `RiemannSurface.riemannHurwitz`."
  4. In the README, delete 181–185 from "It also declares" to "short names `RiemannSurface.*`.". Keep the next sentence, "The carrier written `CompactifiedQuotient Γ` in other roadmaps is Tau Ceti's `Γ.CompactifiedQuotient`".

  I retested steps 2 and 3 on a scratch copy at this head:
  - it elaborates with 8 `sorry` warnings and nothing else;
  - `#check @RiemannSurface.genus` and `#check @RiemannSurface.riemannHurwitz` resolve;
  - `riemannHurwitz` elaborates against `TauCeti.RiemannSurface.FiniteHolomorphicMap`, `TauCeti.RiemannSurface.degree` and `TauCeti.RiemannSurface.ramificationDegree`.

## R02 (P3) — The rewritten dependency section leaves out two edges that it states itself

New in this round. It is not the previous R02, which is repaired. Both defects are in text this head adds.

- **Location.** `TauCetiRoadmap/FuchsianOrbifolds/README.md`:
  - (a) row L4a, 954: "| L4a minimal areas | L3 item 1, L4, L5 items 1 and 7, Tau Ceti deficit bound, AlgebraicTopology Stage 8 item 7, ComplexManifolds Milestone 1 |", and row L2, 949, whose Feeds cell is "L3–L6";
  - (b) 956: "The dependency order follows the table, except that Layers 2 and 3 interleave by item." and 961–962: "Likewise, the membership of every cusp chart in the compactified atlas, at the end of Layer 3 item 4, is a statement about the atlas of Layer 4 item 3."
- **Claim.**
  - (a) Row L4a lists Layer 3 item 1 because of the Tau Ceti lemma `Subgroup.IsCofinite.finite_cuspOrbit`. It omits Layer 2 item 1, which owns cofiniteness and covolume (README 415–418). All four Layer 4a theorems state a cofiniteness hypothesis and a bound on the covolume. The new paragraph itself counts "the cofiniteness of Layer 2 item 1" as a dependency of Layer 3. Rows L3–L6 all list L2.
  - (b) The lead sentence names one exception to the table, Layers 2 and 3. Lines 961–962 then give a second one: an item of Layer 3 that uses Layer 4 item 3, although row L4 depends on L3.
- **Witness.**
  - (a) `Suggested.lean` 125–126: `pi_div_twentyOne_le_covolume (Γ …) (hΓ : Γ.IsCofinite) : ENNReal.ofReal (π / 21) ≤ covolume Γ ℍ`. At the pin, `structure IsCofinite` is `Fuchsian/Covolume.lean` 117.
  - (b) `cuspChart_mem_atlas : cuspChart D hA ∈ atlas ℂ Γ.CompactifiedQuotient` (Tau Ceti `Fuchsian/Compactification/Manifold.lean` 153, namespace `Subgroup.CompactifiedQuotient`).
- **Repair.**
  - (a) In row L4a, replace "L3 item 1, L4" with "L2 item 1, L3 item 1, L4". In row L2, replace the Feeds cell "L3–L6" with "L3–L6, L4a".

    I tested the repaired table by inverting its Depends cells:
    - L0 → {L1, L2, L3, L4, L6}
    - L1 → {L4, L5, L6}
    - L2 → {L3, L4, L5, L6, L4a}
    - L3 → {L4, L5, L6, L4a}
    - L4 → {L5, L6, L4a}
    - L5 → {L6, L4a}

    Each set equals its row's Feeds cell.
  - (b) In 956, replace "except that Layers 2 and 3 interleave by item." with "except that Layers 2 and 3, and Layers 3 and 4, interleave by item."

    An equivalent repair moves the clause "and the chart of every datum lies in the atlas of the compactification (`cuspChart_mem_atlas`, …), so the compactified complex structure does not depend on the datum" from Layer 3 item 4 to the end of Layer 4 item 3, and deletes the "Likewise" sentence.

## Previous findings

- R01 — not repaired: `Suggested.lean` 68 still reads `abbrev CompactifiedQuotient (Γ : Subgroup PSL(2, ℝ)) : Type := Γ.CompactifiedQuotient`; 167–169 still export `TauCeti.RiemannSurface (FiniteHolomorphicMap localMultiplicity degree …)`; README 181–185 still describes them. Carried above as R01.
- R02 — repaired: row L4 now reads "| L4 compactification | L0–L3 | L4a, L5–L6 |" and row L5's Depends ends "…, L1–L4". Every Feeds cell now equals the inverse of the Depends cells (table below). The repair introduced no problem; the new paragraph's omissions are R02 above.

## Verified sound

**Gate, dependencies and build.**

- Gate rerun on this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 … readme-ids-missing=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate on this head, including the targeted build of both modules (`build=0`), also passed.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The dependency check prints `depcheck: 235 roadmaps, 2259 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
  - FuchsianOrbifolds is line 49 of the merge order.
  - ArithmeticFuchsianGroups, TeichmullerGeometry and FuchsianOrbifoldsPartII are at lines 286, 287 and 303.
- `lake env lean` on `Suggested.lean` gives 8 `sorry` warnings (lines 61, 89, 99, 113, 125, 133, 144 and 153) and nothing else.
- `roadmaps resolve` gives one lead, `RiemannSurface.riemannHurwitz` (README 180). It is this file's own export, and `#check @RiemannSurface.riemannHurwitz` resolves it.
- `roadmaps overlaps`: no other pull request changes this roadmap, and no cited id is dropped or defined only by an open revision.

**Elaborated signatures.** A scratch copy `#check @`s the 11 declarations and the 2 exports.

- All are identical to `signatures.md` and to ~15. The file is unchanged and has no `variable` block.
- A second scratch file resolves the pinned names that the changed text relies on:
  - `Subgroup.IsCofinite.finite_cuspOrbit : Γ.IsCofinite → Finite Γ.CuspOrbit` (`Fuchsian/Cusp/Finite.lean` 241);
  - `Subgroup.IsCofinite.finite_ellipticOrbits` (`Fuchsian/Elliptic/Cofinite.lean` 287);
  - `TauCeti.UpperHalfPlane.ConvexPolygon.isCompact_compl_iUnion_image_horodisc` (`Fuchsian/Compactification/Polygon.lean` 128), whose first explicit argument is a `ConvexPolygon n`;
  - `Subgroup.CompactifiedQuotient.cuspChart_mem_atlas` (`Compactification/Manifold.lean` 153);
  - `TauCeti.Subgroup.CuspDatum.disjoint_smul_horodisc` (`Cusp/Horodisc.lean` 299);
  - `TauCeti.Subgroup.CuspDatum.quotientHomeomorph` (`Cusp/Coordinate.lean` 218);
  - `MeasureTheory.covolume_pos`.

**The interleave paragraph (956–966), checked at the Tau Ceti pin `2fd255d`.**

- *Layer 3 uses no polygon, apart from item 3.* I computed the transitive `TauCeti.*` import closure of five modules:

  | Module | Modules in closure | Polygon, Dirichlet or SidePairing modules |
  |---|---|---|
  | `Cusp.Finite` | 75 | 0 |
  | `Cusp.Horodisc` | 55 | 0 |
  | `Cusp.Growth` | 48 | 0 |
  | `Cusp.ChangeScaling` | 46 | 0 |
  | `Cusp.Quotient` | 58 | 0 |

  `Cusp/Finite.lean` imports `Fuchsian/Covolume.lean`, Layer 2 item 1's file. So "the finiteness … also the cofiniteness of Layer 2 item 1, but no polygon" holds.
- *Layer 2 items 2, 5 and 6 state cusp facts.* The statements of `locallyFinite_smul_carrier_of_isCuspPoint`, `exists_cuspDatum_generator_eq_cycleMap`, `SidePairing.finite_cuspOrbit` and `natCard_cuspOrbit_of_doubleTriangle` mention `IsCuspPoint`, `CuspDatum` or `CuspOrbit`. The three statements of item 3 and the two of item 4 mention only `IsParabolic` and `IsCofinite`.
- *Only Layer 3 item 3 uses Layer 2 item 2.* `Compactification/Polygon.lean` imports `Polygon.Convex.Truncation` and `SidePairing.Tessellation`.
- The forward use of Layer 4 item 3 at the end of Layer 3 item 4 is real; it is R02(b).

**The changed *Needs:* lines (852, 887).**

- Layer 5 item 1 enters through `genus Γ.CompactifiedQuotient` in both equality cases.
- Layer 4 items 2 and 3 enter as the compactness and the analytic atlas that the layer's opening paragraph (827–829) feeds to AlgebraicTopology Stage 8 item 7.
- Both lines now match that paragraph, which settles the ~15 remark on row L4a.

**Sources: the seeded sample.** The 8 "Source spine:" lines are at 369, 407, 565, 609, 662, 818, 903 and 940.

- None lies in a changed hunk (852, 887, 950–954 and 956–966), so the ~15 verification carries over.
- I re-read Martin2013 lines 212–222 this round: Theorem 2.1 (`μ(2) = π/21`, attained only by the `(2,3,7)` triangle group) and Theorem 2.2 (the signature area formula). Line 903's "Martin, Theorems 2.1 and 2.2" matches.

**Adversarial table.** Rows marked "new" are computed this round. Rows marked "~15" are carried from review ~15 (most of them from ~14), for statements the diff leaves untouched.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| new: row L3 Feeds `L4–L6, L4a` | Depends cells of L4 `L0–L3`, L5 `L1–L4`, L6 `L0–L5`, L4a `L3 item 1` | inverse `{L4, L5, L6, L4a}`; stated `{L4, L5, L6, L4a}` | equal |
| new: row L4 Depends `L0–L3` | L4.4 `ellipticRamificationIndex_eq_index` (needs finite stabilizers, L0.4); L4.3 coarse charts (L1.3); L4.2 Dirichlet polygon (L2.4); L4.1 horodiscs (L3.3) | 4 of 4 layers used | as stated |
| new: row L4 Feeds `L4a, L5–L6` | Depends of L5, L6, L4a | inverse `{L5, L6, L4a}`; stated `{L5, L6, L4a}` | equal |
| new: row L5 Depends `L1–L4` | L5.4 uses L1.5 and L3.5; L5.7 uses L2 items 4–5 and L3.1; L5.5 uses L4.4 | 4 of 4 layers used | as stated |
| new: row L5 Feeds | Depends of L6, L4a | inverse `{L6, L4a}`; stated `{L4a, L6}` plus ModularForms | equal |
| new: row L4a Depends | `Suggested.lean` 125–126, 133–135, 144–146, 153–155; README 415–418 | every statement has `Γ.IsCofinite` and `covolume` (L2.1); row lists L3.1, L4, L5.1, L5.7 but not L2 | R02(a) |
| new: table after R02(a) | L4a Depends gains `L2 item 1`; L2 Feeds gains `L4a` | inverses L0 `{1,2,3,4,6}`, L1 `{4,5,6}`, L2 `{3,4,5,6,4a}`, L3 `{4,5,6,4a}`, L4 `{5,6,4a}`, L5 `{6,4a}`, all equal to Feeds | consistent |
| new: paragraph, L3 uses no polygon | import closures of 5 cusp modules | 75/55/48/46/58 modules, 0 polygon modules | holds |
| new: paragraph, L2 items 2, 5, 6 | statements of 4 cusp lemmas against 5 of items 3–4 | 4 mention cusp objects; 0 of 5 do | holds |
| new: paragraph, L3.3 alone uses L2.2 | `isCompact_compl_iUnion_image_horodisc` | takes `P : ConvexPolygon n` and a covering hypothesis on `P.carrier` | holds |
| new: paragraph, lead sentence | interleaves stated at 956 against those at 956–962 | 1 named (L2/L3); 2 described (L2/L3, L3/L4) | R02(b) |
| new: L4a.1 *Needs:* (852) | `(0;2,3,7)`, the equality case | `δ = −2 + 1/2 + 2/3 + 6/7 = 1/42`; iff uses `genus` (L5.1), finite CW type from compact (L4.2) analytic (L4.3) `X(Γ)` | as stated |
| new: L4a.2 *Needs:* (887) | `(0;2,3;1)` | `δ = −2 + 1/2 + 2/3 + 1 = 1/6`, covolume `π/3`; iff uses `genus` | as stated |
| ~15: README 36, what ArithmeticFuchsianGroups takes | AFG contract 267–284 | L0 `{1,2,3}`; L2 `{1,3,4,5}`; L4 `{5}`; L4a; L5 `{5,6,7}` | equal |
| ~15: README 109–116, the free-locus covering | `PSL(2,ℤ)` at `i`, `ρ`, `2i` | stabilizer orders `2`, `3`, `1`; covering only at `2i` | as stated |
| ~15: meridian endpoint | `PSL(2,ℤ)` at `∞`, `w = 1`, start `i` | `n = 1` ends at `1 + i = T·i`, while the inverse convention gives `−1 + i` | matches |
| ~15: cusp extensions | `exp(2πiz)`; `j` | `F(q) = q`, `F(0) = 0`; `j` has a pole of order `1` | as stated |
| ~15: `isRiemannianManifold_upperHalfPlane` | `(i,2i)`, `(i,3i)`, `(i,1+i)` | `log 2 = 0.693147`; `log 3 = 1.098612`; `0.962424 < 1` | holds |
| ~15: `genus` | `P¹`, torus, genus 3, `RP²`, `P¹ ⊔ P¹` | `0, 1, 3`; `RP²` gives `0` (junk); `P¹ ⊔ P¹` gives `0` (junk) | determines the genus |
| ~15: `eulerChar_eq_two_sub_two_mul_genus` | genus 3; `P¹ ⊔ P¹`; `ℂ`; `X(1)` | `−4 = 2−6`; `4 ≠ 2`; `χ(ℂ) = 1 ≠ 2`; `2 = 2−0` | holds; both hypotheses needed |
| ~15: `riemannHurwitz` | `z³`; `[2]` on `E`; genus 2 → `P¹`; sign error | `−2 = 3(−2)+4`; `0 = 0`; `2 = 2(−2)+6`; with `−R`, `−2` against `−6` | holds |
| ~15: L5.3 punctured step | tetrahedron, `z²` | `0 = 2·0`; the no-drop model gives `2 = 4` | holds |
| ~15: `covolume_eq_two_pi_mul_signature` | `PSL(2,ℤ)`, `Γ₀(2)`, `Γ(2)`, `(2,3,7)`, trivial group | `π/3`; `π`; `2π`; `π/21`; trivial group: RHS `0`, LHS `∞` | holds; `hΓ` needed |
| ~15: L5.7 cell count | `(3,1,1,1)`, `(4,0,0,3)`, `(4,0,0,1)`, `(8,0,1,0)` | `2, 2, 0, −2`; the wrong count gives `1` | holds |
| ~15: L5.6 | `Γ(2) ≤ PSL(2,ℤ)`, `d = 6` | `−2 = 6(−2)+10`; `−1 = 6(−1/6)` | holds |
| ~15: `pi_div_twentyOne_le_covolume` | `(2,3,7)`, `(2,3,8)`, `(2,4,5)`, `(3,3,4)`, `PSL(2,ℤ)` | `π/21, π/12, π/10, π/6, π/3`, all `≥ 0.1496` | holds |
| ~15: L4a.1 cases | `(2,3,m)` for `m = 6, 7, 8`; `(2,4,4)`; `(2,4,5)`; `(3,3,3)`; `(2,2,2,3)`; `(1;2)` | `0, 1/42, 1/24`; `0`; `1/20`; `0`; `1/6`; `1/2` | minimum `1/42` only at `(2,3,7)` |
| ~15: `covolume_eq_pi_div_twentyOne_iff` | `(2,3,7)`, `(2,3,8)`, `PSL(2,ℤ)` | T/T; F/F; F/F | agree both ways |
| ~15: `minimum_area_finite_area_orbifold` | `PSL(2,ℤ)`, `Γ₀(2)`, `(0;2,4;1)`, `(2,3,7)` | `π/3, π, π/2 ≥ 1.0472`; with no cusp, `π/21 < π/3` | holds; cusp needed |
| ~15: `covolume_eq_pi_div_three_iff` | `PSL(2,ℤ)`, `Γ₀(2)`, `(0;2,4;1)`, `(0;3,3;1)` | T/T; F/F; F/F; F/F | agree both ways |
| ~15: L2.1 tensor Checks, completeness | `diag(2,1)` at `i`; `−1/z` at `2i`; `i/n` | `1 = 4/4`; `1/4 = 1/4`; `dist(i/n, i/2n) = log 2` | conventions pinned |
| ~15: L0.1, L0.2 | discrete `PSL(2,ℝ)`; `diag(1,−1)` | uncountable, so not second countable; `1+i ↦ −1+i`, both distances `2 arsinh(1/2)` | as stated |
| ~15: cusp scaling, L1.2, L3.3, Layer 6 | `a=2, b=1, w=1`; `ε = log 3, m = 3`; `S(2i)`; `j` | `q′ = −q`; radius `1/8`; height `1/2`; orders `3, 2`, simple pole, degree 1 | holds |
| R01 block | users on main `1bea835`, at the open heads, in the merged tree | branch copy: 11 `#check` lines and 1 import; main: 0; merged tree: 0; `roadmaps grep` for the import and `FuchsianOrbifolds.CompactifiedQuotient`: no match; repaired copy: 8 `sorry` warnings | R01 |

**Headline theorems and padding.** Both are carried from ~14 and ~15, because `Suggested.lean` is unchanged.

- Completion criterion items 1–5 and 7–8, and the branched-cover formula of item 6, are proved at the pin and named in the docstring.
- These are stated: `χ = 2 − 2g`, Riemann–Hurwitz, the area formula, the four minimal-area theorems and the distance comparison.
- All 8 sorried theorems stay open under the one-tactic probe of ~13.

**Remarks on untouched text** (no change requested):

- `Subgroup.IsCofinite.finite_ellipticOrbits` is cited in the *Needs:* lines of Layer 5 item 7 and Layer 4a. Unlike `finite_cuspOrbit` (Layer 3 item 1), no layer item names it as its own.

## Not verifiable

- These are recorded `uncertified` in the manifest and are cited by locator only: Beardon1983, Forster1981, FarkasKra1992, DiamondShurman2005, Serre1973, Stillwell1992 and Siegel1945. Siegel's statement was read through Martin2013, Theorem 2.1.
- Katok, *Fuchsian Groups* (1992), and Miranda, *Algebraic Curves and Riemann Surfaces* (1995), are cited without a key in the package's `sources.toml`. In ~13 the sources service found no legal copy of either.
- Ownership against open pull requests: the changed passages add no object. The ownership audit of ~13 stands. I re-checked the R01 block's users with the `roadmaps` tools.

## Source issues

- **Misprint** in Martin2013 at Theorem 2.2, p. 6 (lines 217–222): the source names the number of punctures with one letter and then writes a different letter for the cusp count in the area formula; it should use one letter for the number of cusps; affects nothing.
