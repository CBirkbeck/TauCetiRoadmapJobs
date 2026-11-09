# Review of FuchsianOrbifolds (pull request #1168 at b80ce34)

**Verdict:** needs changes

This is a full review: the folder changed by 229 lines since `f997c5f`. There are four findings, all P3, so none is blocking:

- R01 carries the previous review's R01, which is still unrepaired.
- R02 is the part of the previous R02 that was not done (the manifest).
- R03 and R04 are new defects in text this head added. Both came in through repairs the previous review proposed: the `(4, 0, 2, 1)` Check, and the *Needs:* line suggested for L2.1(b).

The gate passes. `Suggested.lean` elaborates with eight `sorry` warnings and nothing else. The depcheck reports 0 problems.

## R01 (P3) — The compatibility block in `Suggested.lean` still has no consumer once main is merged

- **Location.**
  - `TauCetiRoadmap/FuchsianOrbifolds/Suggested.lean`:
    - import line 7, `TauCeti.Analysis.Complex.RiemannSurface.Divisor.Basic`;
    - docstring 17–20, "It also names Tau Ceti's compactified carrier and its atlas … exports the native degree API";
    - 65–73, `abbrev CompactifiedQuotient` and `noncomputable abbrev compactifiedChartedSpace … := inferInstance`;
    - comment 162–163;
    - 166–168, `export TauCeti.RiemannSurface (FiniteHolomorphicMap localMultiplicity degree degree_comp divisorPullback biholomorphOfDegreeEqOne biholomorphOfDegreeEqOne_toFun)`.
  - README 172–176, "It also declares `CompactifiedQuotient` … under the same short names `RiemannSurface.*`".
- **Claim.**
  - No headline uses either abbreviation, and `compactifiedChartedSpace` restates the pinned `Subgroup.CompactifiedQuotient.instChartedSpace`.
  - The first `export` is a catalogue of seven renamed Tau Ceti names.
  - Commit `f997c5f` restored the block because "the branch's ModularForms copy checks them". That reason does not survive a merge of main. The copy is the merge-base version of `TauCetiRoadmap/ModularForms/Suggested.lean` (line 2 imports this module; lines 89–99 `#check` the names), and main has replaced it.
- **Witness.**
  - On main (`154c04a`), `TauCetiRoadmap/ModularForms/Suggested.lean` imports only Mathlib and three `TauCeti.*` modules.
  - `roadmaps grep` over main and the 465 open heads finds no import of this module. The only short names cited are `RiemannSurface.genus` (PseudoholomorphicCurveAnalysis README 194, 1317, 1378; NoncongruenceModularForms README 651, 1400) and `RiemannSurface.riemannHurwitz` (this README).
  - `git merge-tree --write-tree HEAD origin/main` is clean. `lake-manifest.json` and `lean-toolchain` are identical on both sides.
- **Repair.**
  1. Merge `origin/main` into the branch. If the repair job may not merge, the operator does this step. Without it, the gate's targeted build of the branch's ModularForms copy fails on the deleted names.
  2. Delete import line 7, lines 65–74 and lines 166–169.
  3. Replace docstring 17–20 from "It also names" to the end of that paragraph with: "It exports `genus` and `riemannHurwitz` as `RiemannSurface.genus` and `RiemannSurface.riemannHurwitz`."
  4. Replace comment 162–163 with: "The short names `RiemannSurface.genus` and `RiemannSurface.riemannHurwitz` of this roadmap's genus and Riemann–Hurwitz theorem."
  5. In the README, delete from "It also declares" (172) to "short names `RiemannSurface.*`." (176).

  I tested steps 2–3 on a scratch copy of this head. It elaborates with eight `sorry` warnings and nothing else. `#check @RiemannSurface.genus` and `#check @RiemannSurface.riemannHurwitz` resolve, and `riemannHurwitz` still elaborates against `TauCeti.RiemannSurface.FiniteHolomorphicMap`.

## R02 (P3) — The package manifest still carries the Farkas–Kra and Diamond–Shurman locators that the README dropped

- **Location.** `packages/FuchsianOrbifolds/sources.toml`:
  - `FarkasKra1992` has `locator = "Chapter I §§4-5"` and `cited_for = ["1"]`;
  - `DiamondShurman2005` has `locator = "§§2.3-2.5"` and `cited_for = ["3"]`.
- **Claim.** The README now cites:
  - Farkas–Kra §IV.9 (Layer 1, line 400) and §§I.2 and III.1 (Layer 5, line 796; References 988);
  - Diamond–Shurman §2.4 (lines 595, 648) and §§2.3–2.4 (line 917; References 984).

  The manifest locators point at sections the README no longer cites. This is the manifest half of the previous R02, which was not done.
- **Witness** (published tables of contents):
  - Farkas–Kra I.4 is "Integration Formulae", and there is no I.5.
  - Diamond–Shurman §2.5 is "Modular Curves and Modularity"; the genus is §3.1.
  - The README's new sections are I.2 "Topology of Riemann Surfaces", III.1 "Intersection Theory on Compact Surfaces" and IV.9 "Discontinuous Groups and Branched Coverings".
- **Repair.**
  - `FarkasKra1992`: set `locator = "§§I.2, III.1 and IV.9"` and `cited_for = ["1", "5"]`.
  - `DiamondShurman2005`: set `locator = "§§2.3-2.4"` and `cited_for = ["3", "4", "6"]`.

  Both stay `uncertified`. Every README occurrence of either key matches the new locators.

## R03 (P3) — The L5.7 Check's `(4, 0, 2, 1)` quadrilateral is not a convex polygon at the pin

- **Location.** README 777–780: "the same region with the arc split at `i` into two paired sides is `(4, 0, 2, 1)` and gives `2` again … gives `1` on the first polygon and `2` on the second".
- **Claim.**
  - The cell count of L5.7 is stated for "a convex `n`-gon `P`", that is Tau Ceti's `ConvexPolygon`. The pinned `SidePairing.covolume_eq_two_pi_mul` and `SidePairing.natCard_cuspOrbit` take the same carrier.
  - In the split-arc quadrilateral with vertices `∞, ρ, i, ρ + 1`, the vertex `ρ + 1` lies on the geodesic through `ρ` and `i`. That geodesic is the unit circle, since `|ρ + 1| = |1/2 + i√3/2| = 1`.
  - So the field `vertex_mem_extLeftHalfPlane`, which requires every vertex off a side to lie strictly to its left, fails. The second instance of the Check is therefore outside the target.
- **Witness.**
  - `ConvexPolygon.vertex_mem_extLeftHalfPlane` is at `Polygon/Convex.lean` 95.
  - `extLeftHalfPlane` (`Geodesic/FromTo.lean` 314–316) is "strictly to the left: the open left half-plane", that is `g • {re < 0}` (`HalfPlane.lean` 93).
- **Repair.** Replace the text from "the same region with the arc split" through "so it is not an invariant of `X(Γ)`." with:

  > genus `0`, which is `χ(X(1)) = 2` (`TauCeti.ModularGroup.eulerChar_compactifiedQuotient`). Leaving the midpoints of the self-paired sides out of the vertices, the count `V + c + 1 − (n + k)/2`, gives `1` on this polygon, not `χ(X(1))`.

  Tested on `(3, 1, 1, 1)`, which is strictly convex (each vertex lies off the opposite side): the correct count is `1 + 1 + 1 − 1 = 2`, the pinned `χ(X(1))`; the wrong count is `1 + 1 + 1 − 2 = 1`. So the wrong model is still refuted.

## R04 (P3) — L2.1(b)'s *Needs:* omits the invariance of the Riemannian distance its route uses

- **Location.** README 433–438: "the `PSL(2,ℝ)` action, by Riemannian isometries (a) … moves an arbitrary pair to a vertical pair … *Needs:* (a); Tau Ceti `IsIsometricSMul PSL(2, ℝ) ℍ`; Mathlib `UpperHalfPlane.dist_eq`, `IsRiemannianManifold`."
- **Claim.**
  - Moving the pair changes `riemannianEDist`, not just `dist`. The route needs `riemannianEDist (g z) (g w) = riemannianEDist z w` for the Riemannian isometries of (a).
  - That is Tau Ceti's `TauCeti.RiemannianIsometry.riemannianEDist_eq`. (a) produces elements of `TauCeti.Isom 𝓘(ℝ, ℂ) ℍ`, which is by definition `RiemannianIsometry I I M M`.
  - The name appears only in (d)'s *Needs:*.
- **Witness.**
  - `riemannianEDist_eq` is at `Riemannian/Isometry/Distance.lean` 58; `abbrev Isom` is at `Riemannian/Isometry/Group.lean` 49–51.
  - On `(i, 1 + i)` the route's lower bound `≥ arcosh(3/2) ≈ 0.9624` is read on the vertical image pair, with height ratio `e^0.9624 ≈ 2.618`. It reaches the original pair only through that equality.
- **Repair.** In 437, change the Tau Ceti list to "Tau Ceti `IsIsometricSMul PSL(2, ℝ) ℍ`, `TauCeti.RiemannianIsometry.riemannianEDist_eq`". Its signature takes a bare `RiemannianIsometry I J M N`, so it applies to every element of (a).

## Previous findings (review of `f997c5f`)

- **R01 — not repaired.** `Suggested.lean` 65–73 and 166–168 and README 172–176 read as before (now at shifted line numbers). Carried as R01.
- **R02 — partly repaired.**
  - Done in the README: 400 "**Source spine:** Farkas--Kra, §IV.9; Miranda, Chapter III §§3--4; Katok, §2.4."; 595 "Diamond--Shurman, §2.4."; 648 "Katok, Chapter 4; Diamond--Shurman, §2.4."; 796 "Farkas--Kra, §§I.2 and III.1".
  - Not done in the manifest: carried as R02.
- **R03 — repaired.** 689–695: "The finite CW type of the punctured target is this roadmap's own step: triangulate `Y` … `AbstractSimplicialComplex.instFiniteCWTypeComplVertexImage` … `Homeomorph.finiteCWType` carries it". Both names, with `finite_branchValues`, are in the *Needs:* (699–703). The new punctured-step Check (705–709) computes `0 = 2 · 0`.
- **R04 — repaired.**
  - 752–760 state the cell count `TauCeti.eulerChar X(Γ) = V + c + 1 − (n − k)/2` with `V = Nat.card σ.FiniteVertexCycle` and `c = Nat.card σ.IdealVertexCycle`. They define the polygon genus by `2 − 2h = V + c + 1 − (n − k)/2`, and item 5 (525–527) now defers to it.
  - The previous review's own `(4, 0, 2, 1)` Check instance is defective: see R03.
- **R05 — repaired.** README 798 reads "## Layer 4a: minimal areas of cofinite Fuchsian groups", matching `Suggested.lean` 119. No roadmap links the old anchor.
- **R06 — repaired.**
  - Completion criterion item 10 (72–77) is added.
  - `isRiemannianManifold_upperHalfPlane` is stated at `Suggested.lean` 60, under a Layer 2 section comment.
  - It is named at README 429 and in the docstring 34–35.
- **R07 — repaired.**
  - 415–467 split L2.1 into (a)–(f), each with its own *Needs:*. The half-space model (c) and curvature (e) no longer wait on Layer 0 item 2 or on (b).
  - (b)'s *Needs:*, as the previous review proposed it, lacks one input: see R04.

## Verified sound

**Gate and supply** (rerun on this head):

```
gate FuchsianOrbifolds: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 239 roadmaps, 2321 edges, 0 problem(s)
```

- The depcheck has no UPWARD, CYCLE or moved line. FuchsianOrbifolds is line 49 of the order; its consumers ArithmeticFuchsianGroups and TeichmullerGeometry are at 284 and 285. Every supplier it names (ComplexManifolds, AlgebraicTopology, ComplexKahlerGeometry, ModularForms, AlgebraicCurves, Completed/UniversalCovers, Completed/ConformalMapping) is on main.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- `PROGRESS.md`, `STATUS.md` and `metadata.toml` are on main and unchanged; the gate reports `stray-files=0`.

**Lean** (all at the pins):

- **Elaboration.** `lake env lean` on `Suggested.lean` takes 12 s and gives `sorry` warnings at 60, 88, 98, 112, 124, 132, 143 and 152, and nothing else.
- **Signatures.** I `#check @`-ed all ten declarations, together with `RiemannSurface.genus` and `RiemannSurface.riemannHurwitz`, in one scratch file. Each matches `signatures.md` and its README statement:
  - `riemannHurwitz` has one universe `u`, as in the pinned branched-cover formula;
  - `covolume_eq_two_pi_mul_signature` and both `…_iff` theorems carry `[DiscreteTopology Γ]` and `[FiniteCWType Γ.CompactifiedQuotient]` explicitly;
  - no section binder is lost.
- **Padding probe.** Each of the eight theorems was tried with each of `rfl`, `simp`, `infer_instance`, `norm_num`, `positivity`, `aesop`, `simp_all`, `decide`, `omega` and `exact ⟨fun x y => by simp⟩`, each followed by `done`. That is 80 attempts, and none closes. `infer_instance` on the new theorem fails to synthesize `IsRiemannianManifold 𝓘(ℝ, ℂ) ℍ`. A grep of the Tau Ceti pin finds no `riemannianEDist` or `IsRiemannianManifold` result about `UpperHalfPlane`.
- **README names.** I extracted 229 backticked identifiers from the README and `#check`-ed all 204 that are declaration names, in one file importing the 151 defining Tau Ceti modules. There are 0 errors.
- **R01 repair.** Retested on this head, as described under R01.

**Library declarations opened** (Tau Ceti file:line unless marked Mathlib):

- **Mathlib.**
  - `IsRiemannianManifold` is `Geometry/Manifold/Riemannian/Basic.lean`:80. Its field is `edist x y = riemannianEDist I x y`.
  - `riemannianEDist` is `PathELength.lean`:208, the infimum over `C¹` paths `Path x y` of `∫⁻ ‖mfderiv γ t 1‖ₑ`. This matches the new docstring.
- **The Poincaré metric** (`UpperHalfPlane/PoincareMetric.lean`):
  - `poincareRiemannianMetric` :127 is the Euclidean tensor rescaled by `im⁻²`;
  - `poincareRiemannianMetric_inner` is :135;
  - the `RiemannianBundle` instance is :144, so the new headline refers to the Poincaré metric.
- **The half-space model.**
  - `UpperHalfSpace` is a `def` over `Opens` (`Hyperbolic/UpperHalfSpace/Basic.lean`:91). It has topological, charted, `T3` and Riemannian instances but no metric instance, so L2.1(d)'s `ofRiemannianMetric` is needed and there is no metric diamond.
  - `MetricSpace.ofRiemannianMetric` needs `T3Space` and `PreconnectedSpace`.
  - `RiemannianIsometry.riemannianEDist_eq` is `Isometry/Distance.lean`:58, and its `IsometryClass` instance is :78.
  - `Isom` is `RiemannianIsometry I I M M` (`Isometry/Group.lean`:49).
  - `hasConstantSectionalCurvature_iff` takes `T2Space` on both sides.
- **Riemann–Hurwitz route.**
  - The branched-cover formula is `Branch/EulerCharacteristic.lean`:130: one universe, `[FiniteCWType ↥f.branchValuesᶜ]`, `PreconnectedSpace` on both sides.
  - `finite_branchValues` is `Branch/Values.lean`:116 and needs `CompactSpace X` and `PreconnectedSpace X`.
  - `instFiniteCWTypeComplVertexImage` is `Realization/Complement.lean`:132 and gives `FiniteCWType {x // x ∉ K.vertex '' s}` for finitely many faces.
  - `Homeomorph.finiteCWType` works in one universe.
- **Cell count and area.**
  - `eulerChar_eq_cwEulerChar` is `Cellular/EulerCharacteristic/FiniteCWType.lean`:143 and needs a finite `CWComplex C` in a `T2` space and a homotopy equivalence.
  - `FiniteVertexCycle` is `SidePairing/Vertex/Orbit.lean`:84 and includes trivial cycle transformations, as the README says. `IdealVertexCycle` is `Vertex/Ideal.lean`:157.
  - `natCard_cuspOrbit` is `Cusp/VertexCycle.lean`:118. Its three hypotheses (maps in `Γ`, a locally finite family, disjoint interiors) are word for word those of README 745–747. It has the same hypotheses as `covolume_eq_two_pi_mul` (`Polygon/Area.lean`:129), whose bracket is `(n − k)/2 − 1 − V + Σ`.
  - `eulerChar_compactifiedQuotient` (`LevelOne/Signature.lean`:72) gives `χ(X(1)) = 2`.
- **Deficits.**
  - `one_div_forty_two_le_hyperbolic_deficit` needs `2 ≤ n` for each order and a positive deficit, which the L4a cusp replacement supplies through `m > c/δ`.
  - `hyperbolic_deficit_two_three_seven` is `2·0 − 2 + Σ = 1/42`.
- **Measure and action.**
  - `covolume_pos` needs `Countable` and `HasFundamentalDomain`.
  - `covolume_eq_card_mul_covolume` covers `Δ ≤ Γ`.
  - In Mathlib: `UpperHalfPlane.coe_J_smul` is `↑(J • τ) = −conj τ`; `dist_eq` is `2 arsinh(|z − w|/(2√(Im z Im w)))`; `QuotientGroup.instSecondCountableTopology` needs `SeparatelyContinuousMul` and a second-countable `G`; `isClosedEmbedding_val` holds for `SL`.

**Cross-roadmap citations resolved.**

- **On main** (`e1da019`):
  - ComplexManifolds Milestones 1–6 (172–296).
  - AlgebraicTopology Stage 6 item 4 (Poincaré–Lefschetz, 1515) and item 5 (the intersection pairing, 1560), and Stage 8 item 7 (1813–1817). Item 7 reaches finite CW type through GeometricTopology's triangulation, "include … finitely many prescribed interior marked points", which supports the marked-point reading of L5.3.
  - ComplexKahlerGeometry K7 (1405; `b₁ = 2g` at about 1485).
  - ModularForms §10A (1150), §10B (1173; analytic versus topological genus at 1228–1234) and §10D (1313).
  - Completed/UniversalCovers and Completed/ConformalMapping exist.
  - PseudoholomorphicCurveAnalysis cites `RiemannSurface.genus`.
- **At the open heads:**
  - TeichmullerGeometry (`417bd270`) cites L0.2, L0.3, L1, L2.1 (the comparison isometry `ℍ ≃ᵢ UpperHalfSpace ℝ`) and L4a. Its `Surface.eulerChar_eq_two_sub_two_mul_genus` is its own classification genus.
  - ArithmeticFuchsianGroups (`5fdb26da`) cites L0, L2.1, L2.4–5, L4.5, L4a, L5.5–7, `covolume_eq_two_pi_mul_signature` and `minimum_area_finite_area_orbifold`. All exist. Its "polygon genus" (276, 282, 801) is now defined in L5.7 (759–760).
  - NoncongruenceModularForms (`5342d2e7`) cites 5.1, 5.3, 5.5–5.6, 6.4 and `RiemannSurface.genus`.
  - FuchsianOrbifoldsPartII cites Layers 0–6, L2 items 1–3 and 5, L4.5 and L5.1.
  - `roadmaps overlaps`: no other pull request changes this folder, no id it cites is dropped, and this pull request drops no id that others cite.
- **One item for ModularForms' own review, needing no change here.** Main's ModularForms (38–41) says FuchsianOrbifolds Layer 6 is to construct `j`. The pinned `TauCeti.ModularForm.j` (`LevelOne/JInputs.lean`) now exists, and Layer 6 consumes it.

**Ownership.** I searched by object with `roadmaps grep` and the sibling checkouts:

- `IsRiemannianManifold` on `ℍ`, `poincareRiemannianMetric`, `ℍ ≃ᵢ UpperHalfSpace ℝ`, `π/21` and `π/3`.
- TeichmullerGeometry §10.1 rederives the `π/21` bound inline and cites L4a for the equality case. GroupActionsOnRiemannSurfaces cites TeichmullerGeometry §10.1 for it. Both consume; neither owns.
- No second owner of L2.1(b)–(f), the genus, or the minimal areas was found.

**Headlines** (completion criterion 1–10):

- **Proved at the pin and named in the docstring:** criteria 1–5, the polygon theorem and its converse, triangle groups, the compactification and `X(1) ≃ P¹`.
- **Stated:**
  - `χ = 2 − 2g` and Riemann–Hurwitz (criterion 6);
  - the area formula (criterion 7);
  - the four minimal-area theorems (criterion 9);
  - the distance comparison (criterion 10).
- **Not stated:** second countability of `PSL(2,ℝ)` and the `GL(2,ℝ)` isometries. Each follows from two library facts, so I agree with the docstring that they are not headlines. The half-space isometry is (b) + (c) + `riemannianEDist_eq`.
- **No stand-in, no sorry'd data.**

**Shape.** The README keeps main's layout for this roadmap: the same top-level headings as main's version, and as AlgebraicTopology on main. I do not raise the newer template's headings against an existing roadmap. `genus` has four discriminating Checks. There are no process words and no LaTeX delimiters.

**Sources.**

- **Martin2013**, lines 212–227 (printed p. 6):
  - Theorem 2.1 gives `μ(2) = π/21` over lattices in `Isom⁺(H²)`, attained only by the `(2,3,7)` triangle group.
  - Theorem 2.2 gives `A = 2π(2g − 2 + N + Σ(1 − 1/mⱼ))`.
  - These support `pi_div_twentyOne_le_covolume`, `covolume_eq_pi_div_twentyOne_iff` and `covolume_eq_two_pi_mul_signature` as written. The cusp minimum is the roadmap's own case analysis, as it says.
- **The seeded sample: all eight `**Source spine:**` lines.** Textbooks are uncertified; this round I checked titles against published tables of contents.

| Line | Layer | Result |
|---|---|---|
| 362 | 0 | Beardon Ch. 7–8; Katok §§2.1–2.4; Mathlib files exist ✓ (titles checked in the previous round; unchanged) |
| 400 | 1 | Farkas–Kra IV.9 "Discontinuous Groups and Branched Coverings" ✓; Miranda III.3 "Group Actions on Riemann Surfaces" (quotient surface, ramification of the quotient map) and III.4 "Monodromy" ✓; Katok §2.4 ✓ |
| 551 | 2 | Beardon Ch. 9–11, Katok Ch. 3–4 (Dirichlet and Ford regions, signature), Stillwell Ch. 5 ✓ (unchanged). Katok §1.2 "Geodesics", cited at 436 for the vertical-segment and moving-pair route of (b), ✓ (§1.1 is "The hyperbolic metric") |
| 595 | 3 | Diamond–Shurman §2.4 "Cusps" ✓ |
| 648 | 4 | Katok Ch. 4 "Geometry of Fuchsian groups" ✓; Diamond–Shurman §2.4 ✓ |
| 795 | 5 | Forster §10 "The Integration of Differential Forms", §17 "The Serre Duality Theorem", §19 "Harmonic Differential Forms" ✓ by title; Miranda Ch. II §4 ✓; Farkas–Kra I.2 "Topology of Riemann Surfaces", III.1 "Intersection Theory on Compact Surfaces" ✓; Beardon §10.4 and Katok §4.3 "The signature of a Fuchsian group" ✓ |
| 880 | 4a | Siegel 1945 (uncertified; read in Martin, Theorem 2.1) ✓; Martin Theorems 2.1–2.2 ✓ as above |
| 917 | 6 | Diamond–Shurman §2.3 "Elliptic Points", §2.4 "Cusps" ✓ (§2.5 is "Modular Curves and Modularity", rightly dropped; see R02); Serre Ch. VII; `JInputs.lean` exists ✓ |

**Adversarial table** (computed this round):

| Statement | Instances | Values (left / right) | Result | Change |
|---|---|---|---|---|
| `isRiemannianManifold_upperHalfPlane` | `(z, z)`; `(i, 2i)`; `(i, 1+i)`; wrong models: Euclidean tensor, disc normalisation `2\|dz\|/y`, Euclidean segment | `0 / 0`. `(i, 2i)`: `2 arsinh(1/(2√2)) = 0.6931 / ∫₁² dy/y = log 2 = 0.6931`; Euclidean `1`; disc `1.386`. `(i, 1+i)`: `2 arsinh(1/2) = 0.9624 / ∫dθ/sin θ = log 2.618 = 0.9624` on the circle of centre `1/2`, radius `√5/2`; horizontal segment `1`. | Holds; open at the pin (10 tactics fail) | R04 (*Needs*) |
| `genus` | `χ = 2, 0, −2, 1, 3, 4`; wrong models `2 − χ`, `(−χ/2).toNat` | `0, 1, 2, 0, 0, 0`. Torus: `2` and `0` from the wrong models, vs `1`. Genus 2: `4` and `1`, vs `2`. | Discriminated by Checks 666–674 | none |
| `eulerChar_eq_two_sub_two_mul_genus` | `P¹`, torus, genus 2; `RP²`, `S²⊔S²`, `ℂ`, `∅` | `2=2−0`, `0=2−2`, `−2=2−4`. `RP²`: `1` vs `2`, no complex atlas. `S²⊔S²`: `4` vs `2`, excluded by `ConnectedSpace`. `ℂ`: `1` vs `2`, excluded by `CompactSpace`. `∅` is excluded by `ConnectedSpace`. | Holds | none |
| `riemannHurwitz` | `id_{P¹}`, `z²`, `℘`, unramified genus 3 → 2, `X(2)→X(1)`; sign-flipped model | `−2=1·(−2)+0`, `−2=2·(−2)+2`, `0=2·(−2)+4`, `4=2·2+0`, `−2=6·(−2)+10`. Flipped sign on `z²`: `−2` vs `−6`. Constant maps are excluded by `FiniteHolomorphicMap`. | Holds | none |
| L5.3 punctured step | `z²` over `{0,∞}`; `℘` over 4 branch values; no-drop model | `0 = 2·0`; `χ(T∖4 pts) = −4 = 2·(2−4)`; no-drop: `2` vs `2·2 = 4` | Holds; inputs pinned | none |
| L5.7 cell count `V + c + 1 − (n−k)/2` | `(3,1,1,1)`, `(4,0,2,1)`, `(4,0,0,3)`, `(4,0,0,1)`, `(8,0,1,0)`; wrong `(n+k)/2` | `2, 2, 2, 0, −2`. `(4,0,2,1)` is not a `ConvexPolygon` (`\|ρ+1\| = 1`). Wrong model: `1` on `(3,1,1,1)` vs `χ(X(1)) = 2`. | Holds; one Check instance is outside the target | R03 |
| L5.7 bridge `(n−k)/2 − 1 − V = 2g − 2 + c` | the four valid polygons | `−1=−1`, `1=1`, `1=1`, `2=2` | Holds | none |
| `covolume_eq_two_pi_mul_signature` | `PSL(2,ℤ)`, `Γ₀(2)`, `Γ(2)`, commutator, `(2,3,7)`, genus-2 surface group, `⊥`; `SL` stabilizer orders | `π/3, π, 2π, 2π, π/21, 4π`. `⊥`: covolume `∞`, not cofinite. `SL` orders: `2π(−2+3/4+5/6+1) = 7π/6 ≠ π/3`. | Holds; the `PSL` convention is needed | none |
| `pi_div_twentyOne_le_covolume` | `(0;2,3,7)`, `(0;2,3,8)`, `(0;2,4,5)`, `(0;2,2,2,3)`, `PSL(2,ℤ)` | `π/21 ≤ π/21, π/12, π/10, π/3, π/3` | Holds, tight | none |
| `covolume_eq_pi_div_twentyOne_iff` | `(2,3,7)`, `(2,3,8)`, `PSL(2,ℤ)`, `(0;2,2,2,3)`; `m = 0, 1, 7` | T/T, F/F, F/F (cusp), F/F (count of `2` is `3`). `m=0,1`: `0=0`; `m=7`: `1=1`. | Both directions | none |
| `minimum_area_finite_area_orbifold` | `PSL(2,ℤ)`, `(0;2,4;1)`, `Γ₀(2)`, `Γ(2)`; `(2,3,7)` without a cusp | `π/3 ≤ π/3, π/2, π, 2π`; `π/21 < π/3` | The cusp hypothesis is needed | none |
| `covolume_eq_pi_div_three_iff` | `PSL(2,ℤ)`, `(0;2,4;1)`, `Γ₀(2)`, `(1;−;1)` | T/T, F/F, F/F (two cusps), F/F (genus 1) | Both directions | none |
| L4a item 1 cases | `g ≥ 2`; `g = 1`; `r ≤ 2`; `r ≥ 5`; `r = 4`; `(2,2,m)`, `(2,3,m)`, `(2,4,m)`, `(2,5,5)`, `(3,3,3)`, `(3,3,4)` | `≥2`; `≥1/2`; `<0`; `≥1/2`; `0` or `≥1/6`; `−1/m`; `1/6−1/m` (`1/42` at 7); `1/4−1/m ≥ 1/20`; `1/10`; `0`; `1/12` | Holds | none |
| L4a cusp replacement | `(0;2,3;1)`, `m = 7, 6` | `1/6 − 1/7 = 1/42 > 0`; `m = 6` gives `0`, so `m > c/δ = 6` is needed | Holds | none |
| L4a item 2 table | `g≥2`, `g=1`, `c≥3`, `c=2`, `c=1` with `r ≤ 1`, `r = 2` (`(2,2)`, `(2,3)`, `(2,4)`, `(3,3)`), `r ≥ 3` | `≥3`; `≥1`; `≥1`; `0` or `≥1/2`; `<0`; `0, 1/6, 1/4, 1/3`; `≥1/2` | Holds | none |
| L0.1 | instance search; discrete topology | No instance for `SL` or `PSL`. With the discrete topology `PSL(2,ℝ)` is uncountable, so not second countable. | Open; route matches the two Mathlib declarations | none |
| L0.2 | `diag(1,−1)` on `1+i`, `i`; model without conjugation; `dist(1+i, 2+i)` | `−1+i`; `i ↦ i`; `−1−i ∉ ℍ`; `2 arsinh(1/2) = 0.9624` on both sides | Holds | none |
| L2.1(a) | `diag(2,1)` at `i`; `S` at `2i`; `J` | `1 / 4/4 = 1`; `1/4 / (1/16)/(1/4) = 1/4`; `\|−conj v\| = \|v\|`, `Im` preserved | Holds | none |
| L2.1(c) | vector `1` at `2i`; disc normalisation; `(x, 2y)` | `1/4 / 1/4`; `1`; `1/16` | Discriminated | none |
| L2.1(d) | `(i, 2i)` ↦ `((0,1), (0,2))` | `log 2 / ∫₁² dt/t = log 2` | Holds | none |
| L2.1(f) | `i/n` | Euclidean Cauchy (limit `0 ∉ ℍ`); `dist(i/n, i/m) = \|log(m/n)\|` is not Cauchy | Discriminated | none |
| L5.6 Fuchsian RH | `Γ(2) ≤ PSL(2,ℤ)`, index 6 | `R = 3+3+4 = 10`, `−2 = 6·(−2)+10`; `χ_orb`: `−1 = 6·(−1/6)` | Holds | none |
| L1.2 radius, L3.4 scaling | `ε`, `m`; `σ' = aσ + b` | `tanh(ε/2)^m`; `w' = aw`, `q' = e^{2πib/(aw)} q`, as pinned | Matches the pins | none |
| Compatibility block | 9 names; consumers on main and at 465 heads | 0 consumers outside the stale branch copy | Unjustified | R01 |

## Not verifiable

- **Textbook statements beyond section titles.** Beardon, Siegel, Forster, Farkas–Kra, Diamond–Shurman, Serre and Stillwell are recorded as uncertified (paywalled) and are cited by locator. I checked titles against published tables of contents (library and bookseller listings, the publisher's listing for Katok).
- **Katok and Miranda** are cited but have no entry in `packages/FuchsianOrbifolds/sources.toml`. Earlier rounds found no legal copy, and this review edits no manifest.
- **Katok, Theorem 1.2.6** (the closed distance formulas) is placed in §1.2 from the section title and from memory, not from the text.
- **AlgebraicTopology Stage 6 item 5** lists "duality formulas for … the intersection pairing", but it states a graded-symmetry law only for the linking pairing. The alternating property that L5.1 uses may come from Stage 6 item 2's graded commutativity of cup products; I did not open Stage 6 further.
- **Ownership against open pull requests** was checked through `roadmaps grep` over the 465 indexed heads and the sibling checkouts this brief lists.

## Source issues

- **Misprint** in Martin2013 at Theorem 2.2, printed p. 6: the hypothesis names the cusp count with a lower-case letter, while the area formula uses an upper-case one; it should use one letter throughout; affects nothing.
- **Misprint** in Martin2013 at Theorem 2.2, printed p. 6: the conclusion begins with a doubled definite article; it should read "Then the hyperbolic area"; affects nothing.
