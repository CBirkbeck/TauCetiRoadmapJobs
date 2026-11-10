# Review of DeRhamCohomologyAndDuality (pull request #2085 at cca26c2)

**Verdict:** needs changes

This is a full review of the head that the previous review read. The folder has not changed since then: `changes.md` shows 0 changed lines. The gate passes, and so do the dependency check and the elaboration of `Suggested.lean`. Both findings are P3, so neither is blocking.

- **R01** is the previous R01, and it is still not repaired.
- **R02** is new. It is a *Needs:*-line omission in §§4.1–4.2, found by reading the whole README.

## R01 (P3) — The pull-request title and description contradict the head

This is the previous review's R01, which was R03 and, before that, R02. It is not repaired, and no repair report marks it as not actionable.

**Location.** This is in the pull-request text, not in a file of the folder.

- The title reads "DeRhamCohomologyAndDuality: ComplexKahlerGeometry K6.1 is a supplier, not a consumer".
- The description reads "the README no longer names K6.1 as a consumer and cites ComplexKahlerGeometry only as a supplier".

**Claim.** Both statements are false at this head. The README names K6.1 as the consumer of §§2.4, 3.1–3.3 and 4.1, at `README.md:1312–1319` and `:120–122`. It cites ComplexKahlerGeometry in no *Needs:* line and in no supplier contract. Its only mentions are at `:112`, `:121`, `:557`, `:1312` and `:1318`.

The description also gives this as the reason: "a roadmap on main cannot consume" this one. But DeRhamCohomologyAndDuality is itself on main (f8836c4), and main's README already names K6.1 as a consumer, at its line 695.

**Witness.** `README.md:1312`: "ComplexKahlerGeometry K6.1 (analytic cycles) consumes the boundaryless instances of §§2.4, 3.1–3.3 and 4.1". Main's ComplexKahlerGeometry README cites "DG8.4's open-pair cone" at `:1382` and "DG9.3's compactly supported relative integration formula and DG8.3's" at `:1396`.

**Repair.** Nothing changes in the folder. Retitle the pull request and rewrite its description so that they describe this head against main. Name the changes that the grep below confirms:

- Layer 1 rests on `TauCeti.IsPrimitiveOn` and `TauCeti.PrimitiveSpace`, with headline `exists_isPrimitiveOn_univ_of_simplyConnectedSpace`.
- §2.3's transfer has a hypothesis for its smooth-chain homotopy, and it is proved through retracts in the homotopy category.
- §2.4 is stated as `quasiIso_smoothPairToSingular`.
- The manifold Haar-null theorem is stated with `IsTransverseAt`.
- §4.1 uses AlgebraicTopology 6.3's point generator.
- §4.2 assumes `M` is Hausdorff.
- K6.1 remains a consumer.

Keep the merge-order block unchanged.

**Tested.** `git show origin/main:…/README.md | grep -n K6.1` gives `:75`, `:695` and `:700`. The same grep on this head gives `:121`, `:1312` and `:1318`. So K6.1 is a consumer on both main and the head, and the description's sentence is false on both.

## R02 (P3) — The *Needs:* lines of §4.1 and §4.2 omit declarations that their statements and routes use

**Location.** `README.md:991–999` (§4.1) and `README.md:1041–1043` (§4.2).

- §4.1 ends "*Needs:* Layer 3; DifferentialGeometry 8.4; Tau Ceti `TauCeti.integralTopForm`, `TauCeti.integralTopForm_add`, … `TopPair.isIso_singularHomologyMap_excisionMap_of_isClosed_subset`; AlgebraicTopology 6.3".
- §4.2 ends "*Needs:* §4.1, §3.3; Tau Ceti `TauCeti.boundaryOrientation`, `TauCeti.integralTopForm_mextDeriv`, `TauCeti.IsLocallyCollared.isCollared`; AlgebraicTopology 6.3".

**Claim.** The house rule asks a target's *Needs:* line to list what its statement and its route need, item by item. These two lines leave out declarations that the statements themselves use, as well as inputs to the routes. Every other *Needs:* line in the README lists its route inputs; §2.3 and the compact-source bullets of §5.3 are examples. So these two are inconsistent with the rest of the document.

**Witness.** Each name below is used in the section's text and is absent from its *Needs:* line. Every one of them exists at the pins.

- **§4.1, in the statement:**
  - `TauCeti.intToRealCoeff` at `:946`;
  - `TauCeti.HomologicalOrientation.eq_fundamentalClass` at `:951`;
  - `TauCeti.HomologicalOrientation.localHomologyRestriction_fundamentalClassOn_of_subset` at `:954`.
- **§4.1, in the route:**
  - `TauCeti.integralTopForm_ofFunction_zeroDim` at `:974`;
  - `TauCeti.integralTopForm_sum` and `TauCeti.isSmoothForm_zeroDim` at `:975`;
  - `TauCeti.IsSmoothForm.integrableTopForm` at `:976`;
  - `TauCeti.integralTopForm_mpullback_subtypeVal` at `:984`.
- **§4.2:**
  - Mathlib `ChartedSpace.secondCountable_of_sigmaCompact` at `:1030`;
  - `exists_contMDiffMap_one_nhds_of_subset_interior` at `:1037`.

**Repair.**

- **§4.1.** Append to its *Needs:* line the eight Tau Ceti names `TauCeti.intToRealCoeff`, `TauCeti.HomologicalOrientation.eq_fundamentalClass`, `TauCeti.HomologicalOrientation.localHomologyRestriction_fundamentalClassOn_of_subset`, `TauCeti.integralTopForm_ofFunction_zeroDim`, `TauCeti.integralTopForm_sum`, `TauCeti.isSmoothForm_zeroDim`, `TauCeti.IsSmoothForm.integrableTopForm` and `TauCeti.integralTopForm_mpullback_subtypeVal`.
- **§4.2.** Add "Mathlib `exists_contMDiffMap_one_nhds_of_subset_interior`, `ChartedSpace.secondCountable_of_sigmaCompact`".

**Tested.** I grepped each name in the README. Each occurs in the supplier contracts (`:212`, `:226`, `:250`–`:262`, `:341`–`:345`) and in its section's text at the lines given above, but not in the *Needs:* line. A declaration-line scan of the pinned Mathlib and Tau Ceti finds every name.

## Verified sound

### Gate, dependency check, Lean

- **Gate.** I re-ran it at cca26c2 with `--base origin/main`. It printed `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK` and exited 0. The worker's `gate.md` agrees.
- **Dependency check** (`--movable --pr 2085`). The full output is `depcheck: 235 roadmaps, 2266 edges, 0 problem(s)`. It has no UPWARD, CYCLE or `moved:` line. The roadmap is at merge-order line 398, and it is on main.
- **Suppliers are on main.**
  - DifferentialGeometry and AlgebraicTopology are both on main (f8836c4), which is what a roadmap already on main requires.
  - TangentialBordism (open, #942) is cited only as an adjacent roadmap, never as a supplier.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- **Elaboration.** `lake env lean` on a scratch copy of `Suggested.lean` plus `#check @` for all 13 declarations exits with exactly six `declaration uses 'sorry'` warnings (lines 63, 83, 122, 158, 172, 217) and nothing else.
- **Binder check.** I compared every elaborated type with its README statement:
  - §1.3 has `[IsManifold I 1 M] [SimplyConnectedSpace M]`, with no finite-dimensionality, `T2Space` or completeness hypothesis.
  - §2.2 has `[FiniteDimensional ℝ E] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]`.
  - §2.4 has `X : Type`, the same four hypotheses and `IsOpen W`.
  - §5.2 has all four spaces finite-dimensional and `[μ.IsAddHaarMeasure]`.
  - §5.3, flat form: `E`, `V` and `W` are finite-dimensional.
  - §5.3, manifold form: `BoundarylessManifold` and `SecondCountableTopology` hold on `M` and `N`, and there is no `T2Space`.
  - The only signature lead is `incidenceEquation`, which drops its `NormedSpace ℝ` binders. That is harmless: its body `F (x, p) − j y` needs only `NormedAddCommGroup V`.
- **Padding probe.** I replaced every `sorry` with `first | rfl | infer_instance | simp | exact?`. None of the six closes. Four end in "`exact?` could not close the goal" (lines 67, 125, 166, 182). Two end in "unsolved goals" (lines 89, 226): the conjunction goal of §2.2 and the `μ {…} = 0` goal of the manifold theorem.
- **Statability.**
  - Tau Ceti has no Stokes theorem for smooth simplices. `SmoothSingular/Integral.lean` declares only `integral`, `_zero`, `_smul`, `_add`, `_smoothSingularSubcomplexMap_app` and `_ofFunction` (`:86–:196`), and `deRhamHom` and `chainIntegral` occur nowhere in Tau Ceti.
  - So the docstring is right to call §§3.3, 4.1 and 4.2 not statable.

### Library declarations opened at the pins

**Tau Ceti 2fd255d**

- `IsPrimitiveOn` (`Geometry/Manifold/DifferentialForm/LocalPrimitive.lean:70`) has an `isOpen` field. So `hφ` in §1.3 cannot be met by `U = {x}`. Without that field, `x dy` would "have local primitives" and the headline would be false.
- `PrimitiveSpace.isCoveringMap_proj` (`:280`) needs `IsSmoothForm I r φ` and closedness, which is exactly what §1.2 removes.
- `pathClassIntegral` (`Geometry/Manifold/DeRham/Period.lean:90–94`) is `if closed C¹ then … else 0`, which confirms the junk value `0` used in a §1.2 Check.
  - Its standing variables at `:79` are `[FiniteDimensional ℝ E] [T2Space M] [IsManifold I ∞ M] [CompleteSpace F]`.
  - `_mk_eq_pathIntegral` (`:197`) asks for a `C¹` curve.
- `IsRegularParameter` (`Analysis/Fredholm/LevelSet/GlobalParametric.lean:63`) is surjectivity of `fderiv f (x, l) ∘ inl` at each solution. `isMeagre_setOf_not_isRegularParameter` (`:83`) concludes meagreness only.
- `addHaar_image_criticalPoints_eq_zero` (`Analysis/Calculus/Sard/OutermostStratum.lean:347`) asks for `ContDiffAt` at the points of an arbitrary `U` and a threshold `(dim E)² + 1`.
- `levelSetChart` (`Analysis/Fredholm/LevelSet/Basic.lean:118`) asks for `HasStrictFDerivAt` at its centre only.
- `exists_contMDiffMap_isProperMap_nonneg` (`Geometry/Manifold/Exhaustion.lean:71`) holds for any model with corners.
- `relativeCoordinates_d` (`Algebra/Homology/HomotopyCategory/MappingCocone/Relative.lean:76`) gives `(a, b) ↦ (d a, f a − d b)`, and `quasiIso_lift_of_shortExact` is at `MappingCocone/Basic.lean:221`.
- `reducedSingularHomologySphereIso_inv_ι` (`AlgebraicTopology/Singular/Sphere.lean:498–502`) gives `[−b₀] − [b₀]`.
- `singularHomologyCubeBoundaryPairIso_one_inv` (`Singular/IntervalGenerator.lean:295`) is minus the class of `t ↦ t`.

**Mathlib**

- `Continuous.exists_contMDiff_approx_and_eqOn` (`Geometry/Manifold/SmoothApprox.lean:79`, variables `:43–:46`) holds for any real normed `F` and a map smooth on a neighbourhood of the closed set.
- `exists_contMDiffMap_one_nhds_of_subset_interior` (`Geometry/Manifold/PartitionOfUnity.lean:527`) asks for `[T2Space M] [NormalSpace M] [SigmaCompactSpace M]`.
- `exists_contMDiff_zero_iff_one_iff_of_isClosed` is at `:797`.
- `NormalSpace.of_paracompactSpace_r1Space` is at `Topology/Compactness/Paracompact.lean:298` and `paracompact_of_locallyCompact_sigmaCompact` at `:285`.
- `ChartedSpace.locallyCompactSpace` is at `Geometry/Manifold/ChartedSpace.lean:244`.

**Names and paths.** All 154 dotted backticked names in the README resolve to a declaration line in the pinned Mathlib or Tau Ceti. All 50 cited file paths exist; 15 of them are relative to a parent directory that the text names.

### Cross-roadmap citations resolved

**On main (f8836c4)**

- DifferentialGeometry:
  - 8.3 (`:836`) asks for `[IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M] [FiniteDimensional ℝ E]`, with no boundaryless hypothesis.
  - 8.4 (`:845`) provides `chainIntegral`, Stokes for chains and `deRhamHom`.
  - 8.5 (`:852`) provides `deRhamEquiv` for T2 σ-compact finite-dimensional `M`.
  - 9.3 is at `:872`, Layer 10 at `:877` and Layer 11 at `:898`.
- AlgebraicTopology Stage 6:
  - Item 1 is the cochains (`:1011`).
  - Item 3 (`:1180`) pins the generator `v₀ = −Σeᵢ`, `vᵢ = eᵢ` (`:1262`) and checks `∂[D¹] = [+1] − [−1]` (`:1423`, `:1461`).
  - It builds the relative class for `𝓡∂ m`, `m > 0`, Hausdorff and second countable, through Brown's collar (`:1361`).
  - It says "DG9.3 consumes this" (`:1320`).
  - Item 5 is the degree comparison (`:1560`).
- GeometricTopology §1.1 "Smooth collars" is at `:788`.
- HeegaardFloer F0.S is §2.1 (`:71`) and owns sharp finite-order Sard (`:20`).
- ComplexKahlerGeometry K5a has its heading at `:570` and computes `H¹_dR(ℂ∖{0}; ℂ) ≃ ℂ` at `:939`. K6.1 is at `:1274`, and its citations at `:1382` and `:1396` match `README.md:1318`.

**At an open head.** TangentialBordism §2.1 at #942 (`:535`) covers Hausdorff manifolds:

- parametric transversality to a closed embedded `Z`, with a `TauCeti.IsNullSet` of bad parameters (`:665–673`);
- relative smoothing into a compact boundaryless target (`:688`);
- relative transversality, including compact sources into a second-countable non-compact target (`:719–739`).

All three match `README.md:86–90`.

**Ownership.** `roadmaps grep` finds `IsTransverseAt`, `incidenceEquation`, `IsRegularIncidenceParameter` and `relativeTranslate` only in this roadmap, on main and at #2085. The open DifferentialGeometry revision (#886, `:98–104`, `:3081`) assigns relative de Rham theory, inward domination and relative transversality to this roadmap. The overlap report lists no dropped ids and no other pull request that changes this roadmap.

### Sources: the seeded sample

- **§1.2** cites Hatcher Prop. 1.30 (`hatcher` line 2676, PDF page 69) and Prop. 1.34 (line 2758, PDF page 71), the homotopy lifting and the uniqueness of lifts, as stated.
- **§1.3** cites Hatcher Prop. 1.33 (line 2723, PDF page 70). It asks for `Y` path-connected and locally path-connected, which the README's "simply connected, hence path-connected, and locally path-connected" supplies.
- **No external locator:** §§1.1, 2.1, 2.3, 2.5 and 3.2 are this roadmap's own targets. Their library inputs are opened above.
- **Lee and Bott–Tu.** §§1.2–1.3 (Lee Ch. 11), 2.2 (Lee Prop. 2.28, Thms. 9.24–9.26), 2.4 (Lee Thm. 18.7), 3.1 (Bott–Tu I §6), 3.3 (Lee Thm. 18.14), 4.1 (Bott–Tu §5) and 5.2–5.3 (Lee Thms. 6.35–6.36) cite these two uncertified texts; see *Not verifiable*.
- **Unverified locators:** the README flags none.

### Headline theorems

- **Stated:**
  - 1.3, `exists_isPrimitiveOn_univ_of_simplyConnectedSpace`;
  - 2.2, `exists_smooth_inward_deformation`;
  - 2.4, `quasiIso_smoothPairToSingular`;
  - 5.2, `addHaar_setOf_not_isRegularIncidenceParameter`;
  - 5.3 in its flat form and its manifold form.
- **Named in the docstring as not statable:** 3.3, 4.1 and 4.2. Each lacks the de Rham cochain map, and 4.1 and 4.2 also lack AlgebraicTopology 6.3's classes.
- **Not padding:** each of the six theorems failed the one-tactic probe.

### Adversarial table

Every row was computed this round.

| # | Statement | Instances | Values (left / right) | Result |
|---|---|---|---|---|
| 1 | §1.1 local primitives | `E = 0`; `x dy`; angular form | `Λ¹ = 0`, `g` constant; `∂ₓ∂_y g = 1`, `∂_y∂ₓ g = 0`; loop integral `2π ≠ 0` | passes / fails / local only |
| 2 | §1.3 Lean context | `hφ` with `U = {x}` | `IsPrimitiveOn.isOpen` rules out `{x}`, so `x dy` still fails | hypothesis not vacuous |
| 3 | §1.2 integral | angular form once, twice, reversed; `dx` split at `1` with `Re`, `Re + 7` | `2π`, `4π`, `−2π`; `(1 − 0) + (10 − 8) = 3` | holds |
| 4 | §1.2 agreement | `d(|x|^(3/2))`, `(0,0)` to `(1,0)` | ours `1`; `pathClassIntegral` `0` (`Period.lean:94`) | needs closed `C¹` |
| 5 | §1.3 | `M` a point; `ℝ` with `d(x² sin(1/x))`; `S¹` with `dθ` | `g` constant; `g = x² sin(1/x)`, `g′(0) = 0 = φ(0)`; `∮ dθ = 2π ≠ 0` | holds; simple connectivity needed |
| 6 | §1.3 holomorphic Check | slit plane `1/z`; `ℂ∖{0}` | principal `Log`; `∮ dz/z = 2πi ≠ 0` | holds |
| 7 | §2.1 cone | `[0,∞)` at `0`, `v = 1, 0, −1`; quadrant `(1,0)`; closed unit disc at `(1,0)`, `v = (−1,0)`, `(0,1)` | `ball(t, t/2) ⊆ C`; `−εt/2 ∈` ball; `(t, −εt/2) ∉ C`; `‖(1 − t/2, 0)‖ < 1`; `‖(1,t)‖ = √(1+t²) > 1` | cone `(0,∞)`; open quadrant; open half-plane `v₁ < 0` |
| 8 | §2.1 uniformity | `‖x′−x‖ ≤ εt₀/4`, `‖v′−v‖ ≤ ε/4` | radius `εt − εt/4 − εt/4 = εt/2` | uniform `(ε/2, t₀)` |
| 9 | §2.2 Lean | `[0,∞)`, `Φ = x + (1−t)²`, `t = 0, 1, 3`; `∂ₜΦ(1, x)` | `x + 1 = r(x)`; `x`; `Φ(3,0) = 4`; `0` | holds; `1 − t` would need `ψ(−2, ·)` |
| 10 | §2.2 Check | `[0,1]`, `1/2 − x`; `x(1−x)` | `r(0) = 0.3161`, `r(1) = 0.6839`; `r(0) = 0` | vanishing field fails the interior clause |
| 11 | §2.3 `[0,∞) ⊇ (0,∞)` | `r_*[0]`; `σ = t²`; `t ↦ t` | `[1]`; `∂σ = [1] − [0]`; smooth `g ≥ 0` with `g(0) = 0` has `g′(0) = 0 ≠ 1` | holds; negative control discriminates |
| 12 | §2.3 `S¹` | `r` constant | `H₁` map factors through `H₁(pt) = 0` / `ℝ` | homotopies needed |
| 13 | §2.3 cube-root charts | `z ↦ ∛(z³ + a − b)` | not differentiable at `z³ = b − a`; smooth `H₀ = ℝ^(ℝ)` / singular `ℝ`; `[1] − [0] ↦ 0` | `H` not supplied by `Φ` |
| 14 | §2.4 Lean | `W = ∅`; `W = X` | empty subcomplexes, so the absolute case; relative chains `0` on both sides | holds |
| 15 | §2.4 `(ℝ, ℝ∖0)` | long exact sequence; `t ↦ 2t − 1` | `H₁ = ker(ℝ² → ℝ) = ℝ`, `H₀ = 0`; `∂ = [1] − [−1]` | holds |
| 16 | §2.4 openness | graph of a nowhere-differentiable function | smooth relative `H₁` of dimension `𝔠` / singular `0` | `hW` needed |
| 17 | §2.5 route | `h = f + ρ(e − f)` | `‖h − f‖ = ρ‖e − f‖ < ε/2`; `‖g − f‖ < ε/2 + ε/2` | holds |
| 18 | §2.5 Checks | `r(2)`, `r(−1)`, `r(0.3)`, `r((3,4))`; `Q(t,t,t)` at `0.1`; `Q(0,y,z)`; `|sin θ|` at `0` | `1`, `0`, `0.3`, `(0.6, 0.8)`; `−0.03`; `(y−z)²`; one-sided slopes `±1` | holds |
| 19 | §3.1 | `d²(α, β)`; Mathlib coordinates with `g = −β` | `(0, dα|_W − dα|_W) = 0`; `(dα, −(α|_W − dβ))` | matches `relativeCoordinates_d` |
| 20 | §3.1 sign | `b = 1_{x>0}`, `c = [−1,1]` | `(0, b) ↦ 0 − (1 − 0) = −1`, so `δ[b] ↦ 1 = b̃(∂c)`; opposite convention `−1` | holds |
| 21 | §3.2 | `(A, B) − d(e, 0)`; `ψ dx`; kernel maps at `t = 0`, `t = 5` | `(A − de, 0)`; `1 − 1 = 0`; both send `((0,2),0) ↦ (0,2)` | holds; no canonical map |
| 22 | §3.3 | `(ℝ, ℝ∖0)`; `(ℝ², ℝ²∖0)` in degrees 2 and 1 | `δ[b] ↦ 1`; `−(0 − ∮dθ) = 2π`; `coker(ℝ ≅ ℝ) = 0` | holds |
| 23 | §4.1 compact | `S¹` counterclockwise, then reversed | `2π = 2π`; `−2π = −2π` | holds |
| 24 | §4.1 compact support | discrete `ℤ`, `K = {0,1}`; `ψ dx` with `t ↦ 4t−2`, `t ↦ 8t−4`; `t ↦ 2t−1` | `1 + 2 = 3`; `1`; `1`; endpoints `±1 ∈ K`, so no relative cycle | holds |
| 25 | §4.1 generator | AT 6.3 at `m = 1` (`v₀ = −1`, `v₁ = 1`); Tau Ceti `[−b₀] − [b₀]` | edge `2 > 0`, increasing path / `[γ(1)] − [γ(0)] = [−1] − [1]`, decreasing path | AT 6.3's is right; the other gives `1 = −1` |
| 26 | §4.2 | `D¹`, `c₊ = 3`, `c₋ = 1`; `[0,1]` with `(dx, x)`; doubled origin | `−(3 − 1) = −2` on both sides; `1 − 1 = 0`; `a = b = a + b = s` forces `s = 0` | holds; `T2` needed |
| 27 | §5.1 | `((1,2),3)` for `x + p`; `x² + p` at `p = −1, 0, 1` | `2`; derivatives `±2` / `0` / empty fibre | regular / not / regular |
| 28 | §5.2 Lean degenerate | `E = W = 0`, `F(0,p) = p`, `j = 0`; `V = 0`; `F = x²` | full derivative onto, slice not onto at `p = 0`, so bad set `{0}`; `∅`; full derivative `2xu` vanishes at `x = 0` | null; null; hypothesis fails |
| 29 | §5.2 linear algebra | full derivative onto | slice onto ⇔ `π|ker` onto, checked in both directions | as stated |
| 30 | §5.2 local form | `O = (1,2) × ℝ` | zeros `√(−p)` for `p ∈ (−4, −1)`, slopes `∈ (2, 4)` | bad set `∅` |
| 31 | §5.3 flat Lean | `f = β = x²`, `j = 0`; `β ≡ 1`, `f = x²` | `x²(1+p)` has a zero with slope `0` for every `p`; `p = 0` bad, `p = r/2` good | `hgood` needed; holds |
| 32 | §5.3 route, boundary | `M = [0,∞)`, `β = x`, `f = −x`, `j = 0` | `β′(0) = 1 ≠ 0` at the minimum; translate `x(p − 1)` is bad only at `p = 1` | route needs boundaryless; Lean assumes it |
| 33 | §5.3 manifold Lean | line with two origins; discrete `N = ℝ`, `j = id` | bad set `{0}`; every `p` bad, measure `∞` | `T2` not needed; second countability of `N` needed |
| 34 | §5.3 compact sources | `‖β‖_{C^k} = 3`, `ε = 1`, `‖p‖ < 1/4` | `‖βp‖ < 3/4 < 1`; with corners `‖g − f‖ < ‖p‖ + ε/2 < ε` | holds |
| 35 | `relativeTranslate` | `f = 0`, `β = x²`, `p = 1`, at `2` | `4`; equals `f` on `{0}` | holds |

## Not verifiable

- **Lee (`lee`) and Bott–Tu (`bott-tu`).** Both are settled as uncertified, so I did not read them.
  - This leaves unchecked §1.2 and §1.3 (Lee Ch. 11), §2.2 (Prop. 2.28, Thms. 9.24–9.26, pp. 222–223), §2.4 (Thm. 18.7), §3.1 (Bott–Tu I §6), §3.3 (Thm. 18.14), §4.1 (Bott–Tu §5) and §§5.2–5.3 (Thms. 6.35–6.36).
  - Each is cited as the classical source of a statement that this roadmap owns or imports by roadmap section, never for a hypothesis that a Lean statement here carries.
- **Ownership against open roadmaps without a checkout.** DifferentialGeometry #1187 and CalibratedGeometry #946 were checked only through `roadmaps grep`, which covers every open head. No other roadmap claims an object owned here.

## Source issues

- none
