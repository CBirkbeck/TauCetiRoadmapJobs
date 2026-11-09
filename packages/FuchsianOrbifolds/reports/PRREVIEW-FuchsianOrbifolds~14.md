# Review of FuchsianOrbifolds (pull request #1168 at d7cd3ac)

**Verdict:** needs changes

This is an incremental re-review of the 43 changed lines since `cafadfb`. Only `README.md` changed, and nothing changed outside the folder. One finding remains, P3 and not blocking: R01, which has not been repaired. R02 and R03 are repaired. The changed passages introduce no new defect. The gate passes, and `Suggested.lean` elaborates with 8 `sorry` warnings and nothing else.

## R01 (P3) — The compatibility block in `Suggested.lean` has no consumer once main is merged

*Carried from R01 of reviews ~6 to ~13.* The board holds no repair report that marks it not actionable, and `Suggested.lean` is unchanged since `cafadfb`.

- **Location.**
  - `TauCetiRoadmap/FuchsianOrbifolds/Suggested.lean`:
    - 64–75: `abbrev CompactifiedQuotient (Γ : Subgroup PSL(2, ℝ)) : Type := Γ.CompactifiedQuotient` and `noncomputable abbrev compactifiedChartedSpace … := inferInstance`;
    - 163–169: `export TauCeti.RiemannSurface (FiniteHolomorphicMap localMultiplicity degree degree_comp divisorPullback biholomorphOfDegreeEqOne biholomorphOfDegreeEqOne_toFun)`;
    - import line 7;
    - docstring 18–20.
  - `README.md` 181–185, from "It also declares `CompactifiedQuotient`" to "under the same short names `RiemannSurface.*`."
- **Claim.**
  - No headline uses either abbreviation, and each one restates a pinned Tau Ceti declaration. The form rules allow definitions only where a headline needs them.
  - The first `export` is a catalogue of seven renamed library names.
  - The block's only user is this branch's merge-base copy of `TauCetiRoadmap/ModularForms/Suggested.lean`, and main has replaced that file.
- **Witness.**
  - The branch's `ModularForms/Suggested.lean` imports this module (line 2) and `#check`s the names (lines 89–99). Main's copy does neither.
  - `git merge-tree --write-tree HEAD origin/main` is clean, and the merged tree contains 0 occurrences.
  - `roadmaps grep` finds no other importer and no other Lean user at the 457 open heads.
- **Repair.**
  1. Merge `origin/main` into the branch, so that `TauCetiRoadmap/ModularForms/Suggested.lean` becomes main's file. Without this step the targeted build of `TauCetiRoadmap.ModularForms.Suggested` breaks. If the repair job may not merge, the operator does this step.
  2. In `Suggested.lean`:
     - delete lines 64–75 and import line 7;
     - delete lines 163–169, which hold the comment and the first `export`;
     - after `end TauCetiRoadmap.FuchsianOrbifolds`, keep `namespace RiemannSurface` / `export TauCetiRoadmap.FuchsianOrbifolds (genus riemannHurwitz)` / `end RiemannSurface`, under the comment "The short names `RiemannSurface.genus` and `RiemannSurface.riemannHurwitz`."
     - These short names stay because NoncongruenceModularForms (README 651, 1400) and PseudoholomorphicCurveAnalysis (README 194, 1317, 1378) cite `RiemannSurface.genus` on main. No roadmap cites the seven degree-API short names: every hit outside this folder is `TauCeti.`-qualified.
  3. In docstring 18–20, replace everything after "the one definition they need, `genus`" with ", and exports `genus` and `riemannHurwitz` as `RiemannSurface.genus` and `RiemannSurface.riemannHurwitz`."
  4. In the README, delete 181–185 from "It also declares" to "short names `RiemannSurface.*`.". Keep the next sentence, "The carrier written `CompactifiedQuotient Γ` in other roadmaps is Tau Ceti's `Γ.CompactifiedQuotient`". NoncongruenceModularForms README 652 and 1252 rely on it.

  Retested this round on a scratch copy with steps 2 and 3 applied:
  - the copy elaborates with 8 `sorry` warnings and nothing else;
  - `#check @RiemannSurface.genus` and `#check @RiemannSurface.riemannHurwitz` resolve;
  - `riemannHurwitz` elaborates against `TauCeti.RiemannSurface.FiniteHolomorphicMap` and `TauCeti.RiemannSurface.degree`.

## Previous findings

- R01 — not repaired: `Suggested.lean` 68 still has `abbrev CompactifiedQuotient (Γ : Subgroup PSL(2, ℝ)) : Type := Γ.CompactifiedQuotient`; 167–169 still has `export TauCeti.RiemannSurface (FiniteHolomorphicMap localMultiplicity degree …)`; README 181–185 still describes them. It is carried above as R01.
- R02 — repaired: README 36 now reads "it takes Layer 0 items 1–3, Layer 2 items 1 and 3–5, Layer 4 item 5, Layer 4a and Layer 5 items 5–7".
- R03 — repaired: README 109–121 cite "UniversalCovers (completed) … (Stages 0–1) … (Stage 2) … (Stage 3)" and "ConformalMapping (completed) … (Layer 3) … (Layer 4)", then "No layer here consumes them". Row L2 reads "L0, Tau Ceti half-space model".

R03 was repaired by another route than the one proposed: the README now states that no layer consumes the two roadmaps, instead of citing them as suppliers. I checked that this claim holds; see "Changed passages" below.

## Verified sound

**Gate, dependencies and build.**

- Gate rerun on this head: `set_option=0 blob=0 latex=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate, including the targeted build of both modules, also passed.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- Depcheck output: `depcheck: 235 roadmaps, 2258 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
  - FuchsianOrbifolds is line 49 of the merge order.
  - Its consumers ArithmeticFuchsianGroups, TeichmullerGeometry and FuchsianOrbifoldsPartII are at lines 286, 287 and 303.
  - Every supplier it still names is on main: ComplexManifolds, AlgebraicTopology, and ComplexKahlerGeometry (cited only as another route).
- `lake env lean` on `Suggested.lean`: 8 `sorry` warnings (lines 61, 89, 99, 113, 125, 133, 144, 153) and nothing else.
- `roadmaps resolve`: no cross-roadmap citation and no Lean name is found nowhere. The earlier lead `RiemannSurface.riemannHurwitz` is this file's own export, and it resolves.
- `roadmaps overlaps`: no other pull request changes this roadmap, and no cited id is dropped or defined only by an open revision.

**Elaborated signatures.** One scratch file `#check @`s the 11 declarations and the 2 exports.

- All are identical to `signatures.md` and to review ~13. The file is unchanged since `cafadfb` and has no `variable` block.
- The same file also resolves the names that the changed passages cite: `TauCeti.isCoveringMap_quotientMk_freeLocus`, `TauCeti.Subgroup.CuspDatum.meridian_lift_endpoint`, `…meridian_neg`, `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.meridian_lift_endpoint_eq_pairingHom_cycleWord_zpow_smul`, `Subgroup.isLocalDiffeomorph_quotientMk_freeLocus`, `TauCeti.Subgroup.CuspDatum.analyticAt_cuspExtension_zero`, `TauCeti.Fuchsian.exists_meromorphicAt_comp_ofQuotient`, `TauCeti.ModularGroup.jQuotient`, `…jCompactified`, `…meromorphicAt_jCompactified` and `OnePoint.instChartedSpace`.

**Changed passages: the claim that no layer consumes UniversalCovers or ConformalMapping.** I opened these pinned declarations:

- `TauCeti.isCoveringMap_quotientMk_freeLocus` (`Topology/Algebra/GroupAction/FreeLocus.lean` 122) is derived from Mathlib's `isQuotientCoveringMap_quotientMk_of_properlyDiscontinuousSMul`, through the file's import of `Mathlib.Topology.Covering.Quotient`. No UniversalCovers material enters.
- `meridian_lift_endpoint` (`Fuchsian/Cusp/Meridian.lean` 107) follows from uniqueness of lifts in the q-coordinate (`eq_meridianLift_of_qCoordinate_eq`, 97).
- Layer 2 item 5's polygon form (`Fuchsian/Cusp/Polygon.lean` 90) rewrites with `meridian_lift_endpoint` (line 101). So the README's "(Pinned conventions, Layer 2 item 5)" is the same Tau Ceti fact.
- `analyticAt_cuspExtension_zero` (L3.5) assumes boundedness at `i∞` and concludes analyticity at `q = 0`. `exists_meromorphicAt_comp_ofQuotient` (L5.4) assumes growth `O(exp(2πk Im z/w))` at every cusp and concludes meromorphy on `X(Γ)`. `meromorphicAt_jCompactified` (L6.2) is the level-one case. All three are removable-singularity and q-expansion statements, as the README says.

A grep of the README for covering, deck, `π₁`, fundamental group, universal, Schwarz, reflection, Riemann mapping and conformal finds hits only at:

- lines 48, 229–230, 280, 365 and 967: the free-locus covering, which is the Tau Ceti fact above;
- 217 and 355: an `SL(2,ℝ)` lift;
- 245 and 547: meridian lifts, which are the Tau Ceti facts above;
- 340, 503 and 557: hyperbolic reflection isometries (`isometry_J_smul`, the triangle group);
- 109–121: the passage itself.

None of these is an input from UniversalCovers or ConformalMapping.

**Cross-roadmap citations resolved in the changed passages**, on main unless stated otherwise:

- Completed/UniversalCovers:
  - Stage 0 (63): the cover, the `π₁` action and `Deck p`;
  - Stage 1 (89): `Deck(proj) ≃* π₁`;
  - Stage 2 (98): the lifting criterion (item 6) and the covers–subgroups correspondence (items 7–8);
  - Stage 3 (126): the `π_n` API and `p_*` on `π_n` for `n ≥ 2`.
- Completed/ConformalMapping:
  - Layer 3 (580): the Riemann mapping theorem;
  - Layer 4 (618): continuation and monodromy in its pinned scope, analytic-arc charts (4.1), reflection across analytic arcs (4.2) and removability (4.3).
- AlgebraicCurves: Layer 0 (403), function fields, constant fields and places; Layer 12 (1468), the dictionary between function fields and curves.
- ModularForms:
  - Layers 0–9 (351–1143);
  - §10A (1150): congruence-subgroup specialization of `X(Γ)`, with *Needs:* FuchsianOrbifolds Layers 0–6;
  - §10B (1173): Riemann–Roch at 1206;
  - §10C (1247): automorphy sheaves and exact dimensions;
  - §10D (1313).
  - Its Scope (41–42) consumes `X(1) ≃ ℙ¹` only in §10A and §10D, which matches table rows L5 and L6. The heading "Ownership and dependencies" that README 41 points to exists (79).
- ComplexManifolds: Milestone 4 (238, smooth and complex quotients), Milestone 5 (267, compatible open gluing) and Milestone 6 (296, finite-gluing topology and proper maps), as in table rows L0 and L1.
- ArithmeticFuchsianGroups, at its open head:
  - its contract (267–284) takes L0.1–L0.3, L2.1, L2.3–L2.5, L4.5, L4a and L5.5–L5.7, which equals README 36 item by item;
  - its Dependencies (1002, 1388) are subsets of that list.
- Consumers that cite these two roadmaps cite them directly, not through this one:
  - TeichmullerGeometry cites Completed/UniversalCovers Stages 1–2 (its README 36 and 352);
  - FuchsianOrbifoldsPartII has its own ConformalMapping contract (101–103).

**Sources: the seeded sample.** The 8 "Source spine:" lines are at README 369, 407, 565, 609, 662, 818, 903 and 940. None of them falls in a changed passage, and each text is unchanged since ~13, so I carried the sample check forward from ~13:

- the books are uncertified;
- the cited Mathlib files and the `JInputs.lean` module exist at the pins.

This round I re-read Martin2013, the one certified text, at its locators. Lines 212–214 (p. 6) give `μ(2) = π/21`, attained only by the `(2,3,7)` triangle group, with `μ` the infimum over all lattices (199–204). Lines 217–227 give the signature area formula.

**Adversarial table.** Rows marked "~13" are carried from review ~13 for statements the diff leaves untouched. Rows marked "new" are recomputed this round for the changed passages.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| new: README 36, what ArithmeticFuchsianGroups takes | AFG contract 267–284 at its head | L0 `{1,2,3}` = `{1,2,3}`; L2 `{1,3,4,5}` = `{1,3,4,5}`; L4 `{5}`; L4a; L5 `{5,6,7}` = `{5,6,7}` | equal |
| new: README 109–116, the free-locus covering | `PSL(2,ℤ)`, points `i`, `ρ`, `2i` | `i` has stabilizer order 2, so it is not in the free locus, and its local multiplicity is `2` (`z ↦ z²`); `ρ` has order 3; `2i` has trivial stabilizer, so it lies in the free locus, where the projection is a local homeomorphism | covering only on the free locus, as stated |
| new: README 112–114, meridian endpoint | `PSL(2,ℤ)` at `∞`, `σ = id`, `w = 1`, `T = z ↦ z+1`, start `i` | `n = 1`: q-path `e^{−2π}e^{2πit}` is counterclockwise, the lift `i + t` ends at `1 + i = T·i`, while the inverse convention gives `−1 + i`; `n = −1`: ends at `−1 + i = T⁻¹·i` (`meridian_neg`) | matches `meridian_lift_endpoint` |
| new: README 117–121, cusp extensions | `f = exp(2πiz)`; `j` | `|f| = e^{−2π Im z} ≤ 1`, so `F(q) = q` extends with `F(0) = 0` (removable); `j`: growth `k = 1` gives a pole of order `≤ 1`, and the actual order is `1` (`q⁻¹`) | removable-singularity and q-expansion, with no Riemann map |
| new: README 136–138, ModularForms sections | MF headings | 0–9 at 351–1143; 10A 1150; 10B 1173 (RR 1206); 10C 1247; 10D 1313 | resolve |
| new: table L5 and L6 "Feeds" | MF 10A *Needs*, MF 41–42 | 10A needs Fuchsian 0–6; ℙ¹ is consumed in 10A and 10D only | consistent |
| new: README 152–153, AlgebraicCurves | AC headings | Layer 0 at 403; Layer 12 at 1468 | resolve |
| new: table L0 and L1 suppliers | CM headings | M4 at 238; M5 at 267; M6 at 296 | resolve |
| ~13 `isRiemannianManifold_upperHalfPlane` | `(i,2i)`, `(i,3i)`, `(i,1+i)`; Euclidean model | `0.693147 = log 2`; `1.098612 = log 3`; `0.962424 < 1`; `|i−3i| = 2 ≠ 1.0986` | holds |
| ~13 `genus` | `P¹`, torus, genus 3, `RP²`, `P¹ ⊔ P¹`; `(2−χ).toNat` | `0, 1, 3`; `RP²` gives `0` (junk); disjoint sum gives `0` (junk); the wrong model gives the torus `2` | determines the genus |
| ~13 `eulerChar_eq_two_sub_two_mul_genus` | genus 3; `P¹ ⊔ P¹`; `ℂ`; `X(1)` | `−4 = 2−6`; `4 ≠ 2`; `χ(ℂ) = 1 ≠ 2`; `2 = 2−0` | holds; both hypotheses do work |
| ~13 `riemannHurwitz` | `z³`; `[2]` on `E`; genus 2 → `P¹`; sign error | `−2 = 3(−2)+4`; `0 = 0`; `2 = 2(−2)+6`; with `−R`, `−2` against `−6` | holds |
| ~13 L5.3 punctured step | tetrahedron, `z²` | `0 = 2·0`; the no-drop model gives `2 = 4` | holds |
| ~13 `covolume_eq_two_pi_mul_signature` | `PSL(2,ℤ)`, `Γ₀(2)`, `Γ(2)`, `(2,3,7)`, trivial group | `π/3`; `π`; `2π`; `π/21`; trivial: RHS `0`, LHS `∞` | holds; `hΓ` needed |
| ~13 L5.7 cell count | `(3,1,1,1)`, `(4,0,0,3)`, `(4,0,0,1)`, `(8,0,1,0)` | `2, 2, 0, −2`; the wrong count gives `1` | holds |
| ~13 L5.6 | `Γ(2) ≤ PSL(2,ℤ)`, `d = 6` | `−2 = 6(−2)+10`; `−1 = 6(−1/6)` | holds |
| ~13 `pi_div_twentyOne_le_covolume` | `(2,3,7)`, `(2,3,8)`, `(2,4,5)`, `(3,3,4)`, `PSL(2,ℤ)` | `π/21, π/12, π/10, π/6, π/3`, all `≥ 0.1496` | holds |
| ~13 L4a.1 cases | `(2,3,m)` for `m = 6,7,8`; `(2,4,4)`; `(2,4,5)`; `(3,3,3)`; `(2,2,2,3)`; `(1;2)` | `0, 1/42, 1/24`; `0`; `1/20`; `0`; `1/6`; `1/2` | minimum `1/42` only at `(2,3,7)` |
| ~13 `covolume_eq_pi_div_twentyOne_iff` | `(2,3,7)`, `(2,3,8)`, `PSL(2,ℤ)` | T/T; F/F; F/F | agree both ways |
| ~13 `minimum_area_finite_area_orbifold` | `PSL(2,ℤ)`, `Γ₀(2)`, `(0;2,4;1)`, `(2,3,7)` | `π/3, π, π/2 ≥ 1.0472`; with no cusp, `π/21 < π/3` | holds; cusp needed |
| ~13 `covolume_eq_pi_div_three_iff` | `PSL(2,ℤ)`, `Γ₀(2)`, `(0;2,4;1)`, `(0;3,3;1)` | T/T; F (`π`)/F; F (`π/2`)/F; F (`2π/3`)/F | agree both ways |
| ~13 L2.1 tensor Checks, completeness | `diag(2,1)` at `i`; `−1/z` at `2i`; `i/n` | `1 = 4/4`; `1/4 = 1/4`; `dist(i/n, i/2n) = log 2` for every `n` | conventions pinned |
| ~13 L0.1, L0.2 | discrete `PSL(2,ℝ)`; `diag(1,−1)` | uncountable and discrete, so not second countable; `1+i ↦ −1+i`, both distances `2 arsinh(1/2)` | as stated |
| ~13 cusp scaling, L1.2, L3.3, Layer 6 | `a=2,b=1,w=1`; `ε = log 3, m = 3`; `S(2i)`; `j` | `q′ = −q`; radius `1/8`; height `1/2`; orders `3, 2`, simple pole, degree 1 | holds |
| R01 block | users on main, at 457 heads, in the merged tree | branch copy: 11 `#check` lines; main: 0 imports; merged tree: 0; repaired copy: 8 `sorry` warnings | R01 |

**Headline theorems and padding.** Both are carried from ~13; `Suggested.lean` is unchanged.

- Completion criterion items 1–5 and 7–8, and the branched-cover formula of item 6, are proved at the pin and named in the docstring.
- `χ = 2 − 2g`, Riemann–Hurwitz, the area formula, the four minimal-area theorems and the distance comparison are stated.
- 8 of the 8 sorried theorems stay open under the one-tactic probe of ~13.

**Remarks on untouched text** (no change requested):

- README 141 writes "Riemann--Roch" in the same bullet in which the changed line 137 writes "Riemann–Roch".
- FuchsianOrbifoldsPartII's Dependencies (its README 255) say "ConformalMapping boundary charts through the parent". This roadmap does not pass them on, but PartII's own contract cites ConformalMapping L4 directly.

## Not verifiable

- These are recorded `uncertified` in the manifest and are cited by locator only: Beardon1983, Forster1981, FarkasKra1992, DiamondShurman2005, Serre1973, Stillwell1992 and Siegel1945. Siegel's statement was read through Martin2013, Theorem 2.1.
- Katok, *Fuchsian Groups* (1992), and Miranda, *Algebraic Curves and Riemann Surfaces* (1995), are cited without a key in the package's `sources.toml`. In ~13 the sources service found no legal copy of either. The worker should record both as `uncertified`.
- The manifest's locators for FarkasKra1992 and DiamondShurman2005 lag the README's, as noted in ~13.
- Ownership against open pull requests: the changed passages add no object. I re-checked the R01 block's users at all 457 open heads with the `roadmaps` tools, and the ownership audit of ~13 stands.

## Source issues

- **Misprint** in Martin2013 at Theorem 2.2, p. 6 (lines 217–222): the source introduces the number of punctures with one letter and then writes a different letter for the cusp count in the area formula; it should use one letter for the number of cusps; affects nothing.
