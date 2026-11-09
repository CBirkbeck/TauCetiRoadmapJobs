# Review of FuchsianOrbifolds (pull request #1168 at cafadfb)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/FuchsianOrbifolds/` at `cafadfb`. The folder is unchanged since review ~12, and nothing changes outside it. There are three findings, all P3, so nothing is blocking:

- R01 carries R01 of reviews ~6 to ~12. It is not repaired.
- R02 and R03 are new. Both concern cross-roadmap citations in prose that earlier rounds did not compare section by section.

The gate passes on this head. `Suggested.lean` elaborates with 8 `sorry` warnings and nothing else. The mathematics checks out on every instance tried; see the adversarial table.

## R01 (P3) — The compatibility block in `Suggested.lean` has no consumer once main is merged

*Carried from R01 of reviews ~6 to ~12.* The board has no repair report that marks it not actionable, and the head is unchanged since ~12.

- **Location.**
  - `TauCetiRoadmap/FuchsianOrbifolds/Suggested.lean`:
    - 64–75: `abbrev CompactifiedQuotient (Γ : Subgroup PSL(2, ℝ)) : Type := Γ.CompactifiedQuotient` and `noncomputable abbrev compactifiedChartedSpace … := inferInstance`;
    - 163–169: `export TauCeti.RiemannSurface (FiniteHolomorphicMap localMultiplicity degree degree_comp divisorPullback biholomorphOfDegreeEqOne biholomorphOfDegreeEqOne_toFun)`;
    - import line 7;
    - docstring 17–20.
  - `README.md` 172–176, from "It also declares `CompactifiedQuotient`" to "under the same short names `RiemannSurface.*`."
- **Claim.**
  - No headline uses either abbreviation, and both restate pinned Tau Ceti declarations. The form rules allow definitions only where a headline needs them.
  - The first `export` is a catalogue of seven renamed library declarations.
  - The only user of the block is this branch's merge-base copy of `TauCetiRoadmap/ModularForms/Suggested.lean`, and main has replaced that file.
- **Witness.** The branch's `ModularForms/Suggested.lean` imports this module (line 2) and `#check`s the nine names (lines 89–99). Main's copy imports neither. `git merge-tree --write-tree HEAD origin/main` is clean, and the merged copy has 0 occurrences of them.
- **Repair.**
  1. Merge `origin/main` into the branch, so that `TauCetiRoadmap/ModularForms/Suggested.lean` becomes main's file. Without this step the targeted build of `TauCetiRoadmap.ModularForms.Suggested` breaks. If the repair job may not merge, the operator does this step.
  2. In `Suggested.lean`:
     - delete lines 64–75 and import line 7;
     - delete 163–169, the comment and the first `export`;
     - after `end TauCetiRoadmap.FuchsianOrbifolds`, keep `namespace RiemannSurface` / `export TauCetiRoadmap.FuchsianOrbifolds (genus riemannHurwitz)` / `end RiemannSurface`, under the comment "The short names `RiemannSurface.genus` and `RiemannSurface.riemannHurwitz`." NoncongruenceModularForms (README 651, 1400) and PseudoholomorphicCurveAnalysis (README 194, 1317, 1378) cite `RiemannSurface.genus`.
  3. In docstring 17–20, replace everything after "the one definition they need, `genus`" with ", and exports `genus` and `riemannHurwitz` as `RiemannSurface.genus` and `RiemannSurface.riemannHurwitz`."
  4. In the README, delete 172–176 from "It also declares" to "short names `RiemannSurface.*`.". Keep the next sentence, "The carrier written `CompactifiedQuotient Γ` in other roadmaps is Tau Ceti's `Γ.CompactifiedQuotient`", which serves NoncongruenceModularForms README 90, 652 and 1252.

  Retested this round on a scratch copy with steps 2 and 3 applied:
  - the copy elaborates with 8 `sorry` warnings and nothing else;
  - `#check @RiemannSurface.genus` and `#check @RiemannSurface.riemannHurwitz` resolve;
  - `riemannHurwitz` still elaborates against `TauCeti.RiemannSurface.FiniteHolomorphicMap` through `open TauCeti`.

## R02 (P3) — The list of what ArithmeticFuchsianGroups takes omits Layer 2 item 3

- **Location.** `README.md` 35–36: "it takes Layer 0 items 1–3, Layer 2 items 1, 4 and 5, Layer 4 item 5, Layer 4a and Layer 5 items 5–7".
- **Claim.** ArithmeticFuchsianGroups also consumes Layer 2 item 3, Poincaré's polygon theorem with its side-pairing presentation, so this list of the downstream contract is incomplete. TeichmullerGeometry's list on lines 32–33 matches its contract exactly.
- **Witness.** ArithmeticFuchsianGroups README, at its open head: its contract "From TauCetiRoadmap.FuchsianOrbifolds" (lines 269–274) takes "item 3 (Poincaré's polygon theorem with the side-pairing presentation…)". Its Dependencies (line 1002) read "Layers 0, 2 (items 1 and 3–5), 4 (item 5), 4a and 5 (item 7)".
- **Repair.** Replace "Layer 2 items 1, 4 and 5" with "Layer 2 items 1 and 3–5". The list then matches that contract item by item: L0.1–L0.3, L2.1 and L2.3–L2.5, L4.5, L4a, and L5.5–L5.7. Retested on a scratch copy: depcheck reports 0 problems, and `roadmaps resolve` finds every citation.

## R03 (P3) — Two completed suppliers are cited without their roadmap names or sections

- **Location.**
  - `README.md` 109–114: "**The universal-covers roadmap (completed) owns universal covers, deck groups, …**" and "**The conformal-mapping roadmap (completed) owns the Riemann mapping theorem, …** These are consumed in polygon uniformization…".
  - 288–289: "The universal-covers roadmap's covering and deck-transformation results." and "The conformal-mapping roadmap's Riemann mapping and Schwarz-reflection results."
  - 942, the dependency row "L0, conformal mapping, Tau Ceti half-space model".
- **Claim.** These are supplier citations, and the README says they are consumed. They name neither the roadmap nor a section, so an implementer cannot tell which targets are meant. The house rule is that a cross-roadmap citation names the roadmap and its section. Every other supplier here does: ComplexManifolds Milestones, AlgebraicTopology Stage items, ModularForms §§10A–10D, ComplexKahlerGeometry K7.
- **Witness.**
  - `Completed/UniversalCovers/README.md` on main: Stage 0 (line 63, the cover and the deck group), Stage 1 (89), Stage 2 (98, lifting criterion), Stage 3 (126, higher homotopy).
  - `Completed/ConformalMapping/README.md` on main: Layer 3 (580, Riemann mapping) and Layer 4 (618, continuation and reflection).
- **Repair.**
  - In 109–110, replace the bold sentence with "**UniversalCovers (completed) owns universal covers and deck groups (Stages 0–1), lifting criteria (Stage 2) and induced maps on homotopy groups (Stage 3).**"
  - In 112–113, replace the bold sentence with "**ConformalMapping (completed) owns the Riemann mapping theorem (Layer 3), and analytic continuation and Schwarz reflection (Layer 4).**"
  - Replace 288 with "UniversalCovers Stages 0–2: covering and deck-transformation results." and 289 with "ConformalMapping Layers 3 and 4: the Riemann mapping theorem and Schwarz reflection."
  - In 942, replace "conformal mapping" with "ConformalMapping Layers 3–4".

  Retested on a scratch copy with R02 applied as well:
  - depcheck: `depcheck: 235 roadmaps, 2257 edges, 0 problem(s)`;
  - `roadmaps resolve`: no cross-roadmap citation and no Lean name is found nowhere.

## Previous findings

- **R01 of ~12: not repaired.** The head is the one ~12 read. `Suggested.lean` 68 still reads `abbrev CompactifiedQuotient (Γ : Subgroup PSL(2, ℝ)) : Type := Γ.CompactifiedQuotient`, and 167–169 still `export TauCeti.RiemannSurface (FiniteHolomorphicMap localMultiplicity degree …)`. README 172–176 still describes them. It is carried as R01 above.

## Verified sound

**Gate, dependencies and build.**

- Gate rerun on this head: `set_option=0 … source-material=0 OK`. Every check is 0. The worker's gate, including the targeted build of both modules, also passed.
- `git diff --stat origin/main...HEAD` outside the folder is empty. `PROGRESS.md`, `STATUS.md` and `metadata.toml` are main's generated files, and the gate's `stray-files` check is 0.
- Depcheck output: `depcheck: 236 roadmaps, 2281 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
  - FuchsianOrbifolds is line 49 of the merge order.
  - Its suppliers are on main: ComplexManifolds, AlgebraicTopology, ComplexKahlerGeometry (cited only as another route), and Completed/UniversalCovers and Completed/ConformalMapping.
  - Its downstream consumers ArithmeticFuchsianGroups, TeichmullerGeometry and FuchsianOrbifoldsPartII are at lines 284, 285 and 301.
  - It cites no roadmap on the forbidden list, and it declares no supplier gaps.
- `lake env lean` on `Suggested.lean`: 8 `sorry` warnings (lines 61, 89, 99, 113, 125, 133, 144, 153) and nothing else.

**Elaborated signatures.** I `#check @`ed all 11 declarations and the two exports in one scratch file.

- Each matches `signatures.md` and its README statement at the same generality.
- The file has no `variable` block, so no binder can be lost.
- The headline `isRiemannianManifold_upperHalfPlane` elaborates against `TauCeti.UpperHalfPlane.instRiemannianBundle`, which is the Poincaré tensor (`PoincareMetric.lean` 127, 144), and Mathlib's `UpperHalfPlane.instMetricSpace`. It is therefore about the intended metric, not a flat one.
- At the pin, `#synth SecondCountableTopology PSL(2, ℝ)` and `infer_instance : IsRiemannianManifold 𝓘(ℝ, ℂ) ℍ` both fail. The README is right that L0.1 and L2.1(b) are open.

**Padding probe.** Each `sorry` was replaced by `first | rfl | infer_instance | decide | (norm_num; done) | (simp; done) | positivity | aesop | exact?` on a scratch copy. 8 of 8 stay open.

A grep of the pins finds no topological genus of a space; the only genera are on knot cobordisms, slice surfaces, permutation triples and ribbon graphs. It finds no genus-form Riemann–Hurwitz and no `π/21` or `π/3` bound.

**Names.** A scratch file `#check`s 203 names at the pins: every backticked dotted name of the README, the 9 namespaced short names of Layer 4 under `Subgroup.CompactifiedQuotient`, `t2Space_of_properlyDiscontinuousSMul_of_t2Space`, `IsRiemannianManifold` and `ProperSpace ℍ`. 202 resolve. The one error is `TauCeti.RiemannSurface`, which is a namespace. The lead `RiemannSurface.riemannHurwitz` in `citations.md` is this file's own export, and it resolves.

**Library declarations opened**, with what each says:

- Mathlib `UpperHalfPlane.J` (`Analysis/Complex/UpperHalfPlane/MoebiusAction.lean` 380): `!![-1, 0; 0, 1]`. `coe_J_smul` (382): `−conj τ`. Both agree with L0.2 and L2.1(a).
- Mathlib `IsRiemannianManifold` (`Geometry/Manifold/Riemannian/Basic.lean` 80–81): `edist x y = riemannianEDist I x y`.
- Mathlib `MeasureTheory.covolume` (`MeasureTheory/Group/FundamentalDomain.lean` 679–681): it is `0` without a fundamental domain, which is why every area theorem assumes `IsCofinite`.
- Mathlib `UpperHalfPlane.volume_def`: density `(1/Im z)²` against Lebesgue measure.
- Mathlib `QuotientGroup.instSecondCountableTopology`: it needs `SeparatelyContinuousMul G` and `SecondCountableTopology G`. `Matrix.SpecialLinearGroup.isClosedEmbedding_val` supplies the latter, as L0.1 says.
- Tau Ceti `Subgroup.IsCofinite` (`Fuchsian/Covolume.lean` 117–119): discreteness together with `covolume ≠ ∞`.
- Tau Ceti `Subgroup.ellipticOrbits` (`Fuchsian/Elliptic/Finite.lean` 74) and `TauCeti.cardStabilizerOnOrbit` (`GroupTheory/GroupAction/Stabilizer/Basic.lean` 270).
- Tau Ceti `TauCeti.FiniteCWType` (`Topology/CWComplex/Classical/FiniteCWType.lean` 74) is a `Prop` class.
- Tau Ceti `TauCeti.eulerChar_eq_cwEulerChar` (`Cellular/EulerCharacteristic/FiniteCWType.lean` 143): a homotopy equivalence to a finite CW complex in the same universe.
- Tau Ceti `SidePairing.covolume_eq_two_pi_mul` (`Fuchsian/Polygon/Area.lean` 129): `2π((n − k)/2 − 1 − V + Σₑ(1 − 1/mₑ))` in ℝ, under exactly the three polygon hypotheses that L5.7 restates.
- Tau Ceti `SidePairing.natCard_cuspOrbit` (`Fuchsian/Cusp/VertexCycle.lean` 118).
- Tau Ceti `TauCeti.one_div_forty_two_le_hyperbolic_deficit` (`Data/Rat/BranchDeficit.lean` 116): all orders `≥ 2` and positive deficit.
- Tau Ceti `hyperbolic_deficit_two_three_seven` (196): the value `1/42`.
- Tau Ceti `FiniteHolomorphicMap.eulerChar_eq_degree_mul_eulerChar_sub_ramificationDegree` (`RiemannSurface/Branch/EulerCharacteristic.lean` 117): one universe, and `FiniteCWType` of `X`, `Y` and `f.branchValuesᶜ`.
- Tau Ceti `AbstractSimplicialComplex.instFiniteCWTypeComplVertexImage` (`SimplicialComplex/Realization/Complement.lean` 132): it needs `Finite (Face K)`.
- Tau Ceti `MeasureTheory.covolume_pos` (358) and `covolume_eq_card_mul_covolume` (382): `Countable` and `HasFundamentalDomain`.
- Tau Ceti `RiemannianIsometry.riemannianEDist_eq` (`Riemannian/Isometry/Distance.lean` 58) and `hasConstantSectionalCurvature_iff` (`Riemannian/Isometry/Curvature.lean` 234); the latter needs smooth manifolds and smooth Riemannian bundles, which `PoincareMetric.lean` supplies.
- Tau Ceti `TauCeti.UpperHalfPlane.isometry_J_smul` (`Geodesic/Reflection.lean` 94).
- Tau Ceti `TauCeti.ModularGroup.finiteCWType_compactifiedQuotient` (`Fuchsian/LevelOne/Signature.lean` 64) is the only pinned `FiniteCWType` instance on a compactified quotient, as L5.6 says.

**Cross-roadmap citations resolved.** Suppliers, on main:

- ComplexManifolds Milestones 1, 2 and 4–6 (README 172, 197, 238, 267, 296): restriction of scalars, orientation, free quotients, gluing, and separation and properness.
- AlgebraicTopology:
  - Stage 6 item 4, Poincaré–Lefschetz duality (1515);
  - Stage 6 item 5, the intersection pairing (1560);
  - Stage 8 item 7: smooth manifolds have finite CW type in the compact case, with finitely many marked interior points (about 1811).
- ComplexKahlerGeometry K7 (1405; `b₁ = 2g` at 1483–1485).
- ModularForms §§10A, 10B and 10D (1150, 1173, 1313). Its contract "From TauCetiRoadmap.FuchsianOrbifolds" (285–293) takes Layers 0–6 from here, so the direction is consistent.
- ComplexCurveModuli (line 13) says that FuchsianOrbifolds Layer 5 owns the topological genus and Riemann–Hurwitz.

Ids that roadmaps on main cite, checked against this head:

- NoncongruenceModularForms cites 0.5, 2.1, 2.3, 5.1, 5.3, 5.5–5.6 and 6.4. Each item still holds the content cited; main's Layer 5 items 1–6 keep their numbers, and item 7 is new.
- ConformalMappingPartII cites the heading anchors of Layers 0, 2 and 3, which are unchanged.
- PseudoholomorphicCurveAnalysis cites `RiemannSurface.genus`, which R01's repair keeps.

Consumers at their open heads:

- TeichmullerGeometry's contract (README 98) equals this Scope's list.
- ArithmeticFuchsianGroups' contract adds Layer 2 item 3 (R02).
- FuchsianOrbifoldsPartII consumes Layers 0–6 (README 7, 69, 255).
- GroupActionsOnRiemannSurfaces cites §§5.1–5.3, 5.6 and Layer 2 items 3–6.

None is cited here as a supplier. `overlaps.md` lists no dropped, conflicting or revision-only id, which I confirmed.

**Ownership.** Searched by object, with `roadmaps grep` on main and at all 459 open heads, and in the sibling checkouts:

- for `π/21`, `1/42` and Siegel 1945: hits only here, in TeichmullerGeometry §10.1 (which reads the equality case from Layer 4a), in ArithmeticFuchsianGroups and GroupActionsOnRiemannSurfaces (consumers), and in unrelated Bernoulli `B₆ = 1/42`;
- for Riemann–Hurwitz: the other owners are algebraic (AlgebraicCurves, ModularCurves Layer 10, SchemeAndStackFoundations §3.2), not the analytic genus form owned here;
- KleinianGroups (#432) is three-dimensional (Bianchi groups) and owns nothing here.

No other `Suggested.lean` declares a `TauCetiRoadmap.FuchsianOrbifolds.*` name, or the root `RiemannSurface.genus` or `RiemannSurface.riemannHurwitz`. No other roadmap imports this module.

**Sources: the seeded sample** (the 8 "Source spine:" lines).

| README line | Layer | Locators | Checked |
|---|---|---|---|
| 362 | 0 | Beardon Ch. 7–8; Katok §§2.1–2.4; Mathlib `UpperHalfPlane/ProperAction.lean`, `FixedPoints.lean` | both Mathlib files exist at the pin; books under Not verifiable |
| 400 | 1 | Farkas–Kra §IV.9; Miranda III §§3–4; Diamond–Shurman §§2.1–2.3 | Not verifiable (uncertified or no legal copy) |
| 558 | 2 | Beardon Ch. 9–11; Katok Ch. 3–4; Stillwell Ch. 5 | Not verifiable |
| 602 | 3 | Diamond–Shurman §2.4 | Not verifiable |
| 655 | 4 | Katok Ch. 4; Diamond–Shurman §2.4 | Not verifiable |
| 811 | 5 | Forster §§4, 17, 19; Miranda II §4, III §§3–4; Farkas–Kra §§I.2, III.1; Beardon §10.4; Katok §4.3 | Not verifiable |
| 896 | 4a | Siegel 1945; Martin Thms 2.1, 2.2; Beardon §10.4; Katok §4.3 | Martin2013 lines 212–227 (p. 6), see below |
| 933 | 6 | Diamond–Shurman §§2.3–2.4; Serre Ch. VII; Tau Ceti `JInputs.lean` | the module exists at the pin, and its 6 cited declarations resolve |

Martin2013, the one certified text, read at its locators:

- Theorem 2.1 (lines 212–214, p. 6) gives `μ(2) = π/21`, attained only by the `(2,3,7)` triangle group. Here `μ(n)` is the infimum of covolumes over all lattices of `Isom⁺(Hⁿ)` (lines 199–204), cusped ones included. That is the generality of `pi_div_twentyOne_le_covolume` and of the `iff`.
- Theorem 2.2 (lines 217–227) gives `A = 2π(2g − 2 + N + Σ(1 − 1/m_j))`, the formula of `covolume_eq_two_pi_mul_signature`.
- Siegel's paper is Martin's [92] (lines 3667–3668): *Ann. of Math.* 46 (1945), 708–718, the README's pages.
- The index-two relation between `Δ(2,3,7)` and the reflection group (lines 118–122) matches L2.6.

**Adversarial table.** Values were recomputed this round, on both sides.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `isRiemannianManifold_upperHalfPlane` | `(i,2i)`, `(i,3i)`, `(i,1+i)`; wrong model: Euclidean | `dist_eq`: `2 arsinh(1/(2√2)) = 0.693147` against vertical length `∫₁² dy/y = 0.693147`; `2 arsinh(1/√3) = 1.098612 = log 3`; `2 arsinh(1/2) = 0.962424` against horizontal segment length `1`; Euclidean `|i − 3i| = 2 ≠ 1.0986` | holds; instance is the Poincaré tensor |
| `genus` (definition) | `P¹`, torus, genus 3, `RP²`, `P¹ ⊔ P¹`; wrong model `(2 − χ).toNat` | `χ = 2, 0, −4 → 0, 1, 3`; `RP²`: `1/2 = 0` (junk); `P¹ ⊔ P¹`: `(−2)/2 = −1`, `toNat 0` (junk); wrong model gives torus `2` | determines the genus on closed orientable surfaces |
| `eulerChar_eq_two_sub_two_mul_genus` | genus 3; `P¹ ⊔ P¹`; `ℂ`; `X(1)` | `−4 = 2 − 6`; `4 ≠ 2 − 0`, so `ConnectedSpace` is needed; `ℂ`: `χ = 1 ≠ 2`, so `CompactSpace` is needed; pinned `χ(X(1)) = 2 = 2 − 0` | holds; both hypotheses do work |
| L5.1 route | torus, genus 2 | `b = (1, 2, 1)`, `χ = 0`; `b = (1, 4, 1)`, `χ = −2`; `b₁` even from the alternating nondegenerate pairing | consistent |
| `riemannHurwitz` | `z³` on `P¹`; `[2] : E → E`; genus 2 → `P¹` of degree 2; `z²` with sign error | `−2 = 3(−2) + 4`; `0 = 4·0 + 0`; `2 = 2(−2) + 6`; `−R` gives `−2` against `−6` | holds |
| L5.3 punctured step | tetrahedron triangulation of `P¹`, `z²` | `χ(P¹ ∖ {0,∞}) = 2 − 2 = 0`, `0 = 2·0`; no-drop model `2 = 2·2` false | holds |
| `covolume_eq_two_pi_mul_signature` | `PSL(2,ℤ)`, `Γ₀(2)`, `Γ(2)`, `(2,3,7)`, trivial group | `2π(1/6) = π/3`, the pinned `covolume_psl2zToPSL2RRange`; `2π(1/2) = π = 3·π/3`; `2π·1 = 6·π/3`; `2π/42 = π/21`; trivial group: `χ(ℍ) = 1`, genus 0, RHS `ofReal(−4π) = 0`, LHS `∞` | holds; `hΓ` needed |
| L5.7 cell count `V + c + 1 − (n−k)/2` | `(3,1,1,1)`, `(4,0,0,3)`, `(4,0,0,1)`, `(8,0,1,0)` | `2, 2, 0, −2`; cells: `V + c + k` vertices, `(n−k)/2 + k` edges, 1 face; wrong `(n+k)/2` gives `1` on `(3,1,1,1)`; polygon area `2π(1 − 1 − 1 + 7/6) = π/3` | holds |
| L5.6 Fuchsian Riemann–Hurwitz | `Γ(2) ≤ PSL(2,ℤ)`, `d = 6` | `R = 3 + 3 + 4 = 10`, `−2 = 6(−2) + 10`; `χ_orb`: `−1 = 6·(−1/6)` | holds; finite-CW supplier named |
| `pi_div_twentyOne_le_covolume` | `(0;2,3,7)`, `(0;2,3,8)`, `(0;2,4,5)`, `(0;3,3,4)`, `PSL(2,ℤ)` | `π/21, π/12, π/10, π/6, π/3`, all `≥ 0.1496` | holds |
| L4a.1 cases | `(2,3,m)`, `(2,4,4)`, `(2,4,5)`, `(2,5,5)`, `(3,3,3)`, `(3,3,4)`, `(2,2,2,3)`, `(1;2)`, `(2;−)` | `1/6 − 1/m`: `0, 1/42, 1/24` at `m = 6, 7, 8`; `0`; `1/20`; `1/10`; `0`; `1/12`; `1/6`; `1/2`; `2` | minimum `1/42` only at `(2,3,7)` |
| L4a.1 cusp replacement | `(0;2,3;1)`, `δ = 1/6`, `c/δ = 6` | `m = 7`: `1/6 − 1/7 = 1/42`; `m = 6`: `0`, outside the lemma's positivity | `m > c/δ` needed, as stated |
| `covolume_eq_pi_div_twentyOne_iff` | `(2,3,7)`, `(2,3,8)`, `PSL(2,ℤ)` | T/T (counts `1,1,1` at `2,3,7`; `0` at `m = 0, 1`); F (`π/12`)/F (count at `7` is `0`); F/F (`IsEmpty CuspOrbit` fails) | agree both ways |
| `minimum_area_finite_area_orbifold` | `PSL(2,ℤ)`, `Γ₀(2)`, `(0;2,4;1)`, `(2,3,7)` | `π/3, π, π/2 ≥ 1.0472`; no cusp: `π/21 < π/3` | holds; cusp needed |
| L4a.2 table | `c = 1`: `(2,2)`, `(2,3)`, `(2,4)`, `(2,5)`, `(3,3)`; `c = 2`; `c = 3`; `g = 1, 2` | `0, 1/6, 1/4, 3/10, 1/3`; `r = 0: 0`, `r ≥ 1: ≥ 1/2`; `≥ 1`; `≥ 1`, `≥ 3` | minimum `1/6` only at `(0;2,3;1)` |
| `covolume_eq_pi_div_three_iff` | `PSL(2,ℤ)`, `Γ₀(2)`, `(0;2,4;1)`, `(0;3,3;1)` | T/T; F (`π`)/F (2 cusps); F (`π/2`)/F (count at `3` is `0`); F (`2π/3`)/F (count at `2` is `0`) | agree both ways |
| L2.1 tensor Checks | `diag(2,1)` at `i`; `−1/z` at `2i`; half-space at `(0,2)` | `1 = 2²/2²`; derivative `1/(2i)² = −1/4`, `(1/16)/(1/4) = 1/4`; `1/4 = 1/4`; disc normalisation `4|dz|²/y²` gives `1` | conventions pinned |
| L2.1(f) completeness | `i/n` | `dist(i/n, i/2n) = log 2` for every `n`; Euclidean `1/(2n) → 0`, limit `0 ∉ ℍ` | holds |
| L0.2 negative determinant | `diag(1,−1)`; Mathlib `J = diag(−1,1)` | both act by `−conj z`; `1+i ↦ −1+i`; `dist(1+i, 2+i) = 2 arsinh(1/2) = dist(−1+i, −2+i)`; without conjugation `−1−i ∉ ℍ` | holds |
| L0.1 second countability | discrete topology on `PSL(2,ℝ)` | uncountable and discrete, so not second countable; `#synth` fails at the pin | open, as stated |
| Cusp scaling | `a = 2, b = 1, w = 1` | `w′ = 2`; `q′ = exp(πi)q = −q`; directly `exp(2πi(2σ+1)/2) = −exp(2πiσ)` | holds |
| L1.2 disc quotient | `ε = log 3`, `m = 3` | `tanh(ε/2) = 1/2`, radius `(1/2)³ = 1/8` | matches the pinned formula |
| L3.3 horodisc height | `PSL(2,ℤ)`, `w = 1`, `S` | `S(2i) = i/2`, height `1/2 < 1` | precisely invariant from height `w` |
| Layer 6 multiplicities | `ρ`, `i`, cusp | `ord_ρ j = 3 = 3·1`; `ord_i(j − 1728) = 2 = 2·1`; simple pole `q⁻¹`; degree `1` | holds |
| R01 block | users on main, at the open heads, in the merged tree | 0 imports; branch copy: 11 `#check` lines (89–99); merged tree: 0 occurrences; repaired copy: 8 `sorry` warnings | R01 |
| R02 Scope list | ArithmeticFuchsianGroups contract (269–274), Dependencies (1002) | contract: Layer 2 items `1, 3, 4, 5`; Scope: `1, 4, 5` | R02 |
| R03 supplier citations | README 109–114, 288–289, 942 | 0 section ids for two suppliers; the target headings exist on main (UniversalCovers 63, 89, 98, 126; ConformalMapping 580, 618) | R03 |

**Headline theorems** (completion criterion items 1–10).

- Items 1–5 and 7–8, and the branched-cover formula of item 6, are proved at the pin and named in the docstring.
- Stated in `Suggested.lean`:
  - `χ = 2 − 2g` and Riemann–Hurwitz (item 6);
  - the area formula and the four minimal-area theorems (item 9);
  - the distance comparison (item 10).
- The remaining parts of item 10 (L0.1, L0.2, L2.1(a, c–f)) are named in the docstring as derived targets. Each is a short composition of pinned declarations, so stating it would be padding.
- None is forced through a stand-in, and no theorem closes in one tactic.

**Shape.** The headings are those of the roadmap on main (`git show origin/main`), so this revision builds on existing work. Every open target has its hypotheses, *Needs:* and a locator or the statement "this roadmap's own derivation". The one definition, `genus`, has four Checks, including a wrong model on each of three surfaces.

## Not verifiable

- These are recorded `uncertified` (paywalled) in the manifest and are cited by locator only: Beardon1983, Forster1981, FarkasKra1992, DiamondShurman2005, Serre1973, Stillwell1992 and Siegel1945. Siegel's statement was read through Martin2013, Theorem 2.1.
- Katok, *Fuchsian Groups* (1992), and Miranda, *Algebraic Curves and Riemann Surfaces* (1995), are cited but have no key in the package's `sources.toml`.
  - This round the sources service, run against a scratch copy of the manifest, found no legal source for either.
  - This review edits no manifest. The worker should record both as `uncertified`.
  - The manifest's locators for FarkasKra1992 ("Chapter I §§4–5") and DiamondShurman2005 ("§§2.3–2.5") also lag the README's (§§I.2, III.1, IV.9 and §§2.1–2.4).
- Ownership against open pull requests was checked with the `roadmaps` tools at all 459 heads and in the sibling checkouts the brief lists.

## Source issues

- **Misprint** in Martin2013 at Theorem 2.2, p. 6 (lines 217–222): the source introduces the number of punctures with one letter and then writes a different letter for the cusp count in the area formula; it should use one letter for the number of cusps; affects nothing.
