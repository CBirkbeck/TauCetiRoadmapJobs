# Review of DeRhamCohomologyAndDuality (pull request #2085 at cca26c2)

**Verdict:** needs changes

This is an incremental re-review of the 29 lines of `README.md` that changed since 93d475d. The changes are the smooth-simplex bullet of the Tau Ceti contract, §2.3's route, its *Needs:* line and its first two Checks. `Suggested.lean` is unchanged. Previous R01 and R02 are repaired, and the repairs introduce no new defect. Previous R03 (the pull-request title and description) is not repaired and is carried below as R01. It is the only finding, and it is P3.

## R01 (P3) — The pull-request title and description still contradict the head

This is previous R03, which was R02 two rounds ago. It is not repaired. No repair report marks it as not actionable.

**Location.** The pull-request text, not a file in the folder:

- the title: "DeRhamCohomologyAndDuality: ComplexKahlerGeometry K6.1 is a supplier, not a consumer";
- the description: "the README no longer names K6.1 as a consumer and cites ComplexKahlerGeometry only as a supplier".

**Claim.** Both statements are false at this head.

- `README.md:1312–1319` names ComplexKahlerGeometry K6.1 as the consumer of §§2.4, 3.1–3.3 and 4.1.
- `README.md:116–122` makes this roadmap the single owner of those sections.
- ComplexKahlerGeometry appears in no *Needs:* line and in no supplier contract. Its only mentions are at `:112`, `:121`, `:557`, `:1312` and `:1318`.
- The description says that a roadmap on main cannot consume this one. But DeRhamCohomologyAndDuality is itself on main (f8836c4 has `TauCetiRoadmap/DeRhamCohomologyAndDuality/`). Main's README already names K6.1 as a consumer, at its line 695.

**Witness.** `README.md:1312`: "ComplexKahlerGeometry K6.1 (analytic cycles) consumes the boundaryless instances of §§2.4, 3.1–3.3 and 4.1". The open ComplexKahlerGeometry revision at af80ecf has the heading "From TauCetiRoadmap.DeRhamCohomologyAndDuality" at `README.md:284`, and its `:93`, `:2666` and `:2695` cite §§2.4, 3.1–3.3 and 4.1.

**Repair.** Nothing changes in the folder. Rewrite the title and description so that they describe this head against main:

- Layer 1 is rebuilt on `TauCeti.IsPrimitiveOn` and `TauCeti.PrimitiveSpace` for `C¹` manifolds over any model, with headline `exists_isPrimitiveOn_univ_of_simplyConnectedSpace`.
- §2.3's transfer takes its smooth-chain homotopy as a hypothesis and is proved through retracts in the homotopy category.
- §2.4 is stated as `quasiIso_smoothPairToSingular`.
- The manifold Haar-null theorem is stated with `IsTransverseAt`.
- §4.1 uses AlgebraicTopology 6.3's point generator.
- §4.2 assumes `M` is Hausdorff.
- K6.1 remains a consumer.

Keep the merge-order block as it is.

**Tested.** Each item of the suggested text is present at this head and absent from main's README. A grep gives these counts (main / head): `IsPrimitiveOn` 0 / 13, `PrimitiveSpace` 0 / 11, `exists_isPrimitiveOn_univ_of_simplyConnectedSpace` 0 / 1, `quasiIso_smoothPairToSingular` 0 / 1, `IsTransverseAt` 0 / 3, `RetractArrow` 0 / 3, "Hausdorff oriented" 0 / 1. The K6.1 consumer text is at `:1312` on the head and at `:695` on main.

## Previous findings

- R01 — repaired: the second §2.3 Check (`:683–692`) now uses "the smooth `1`-simplex `t ↦ t²`, the restriction of the smooth map `ℝ → [0, ∞)`, `t ↦ t²`, with boundary `[1] − [0]`". It also adds a negative control: `t ↦ t` is no smooth simplex of `[0, ∞)`.
- R02 — repaired: `TauCeti.smoothSingularSubcomplexMap_comp` is now in the route (`:660–662`, "once `(j ∘ r)_*` is rewritten as `r_*` followed by `j_*`") and in the *Needs:* line (`:671–673`). The contract bullet (`:315–317`) cites `_id` and `_comp`.
- R03 — not repaired: the title is still "ComplexKahlerGeometry K6.1 is a supplier, not a consumer", and the description still denies that K6.1 is a consumer. Carried as R01.

## Verified sound

### Gate, dependency check, Lean

- **Gate**, re-run at cca26c2 with `--base origin/main`: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's run on this head also has `build=0`.
- **Dependency check** (`--movable --pr 2085`). The full output is `depcheck: 235 roadmaps, 2266 edges, 0 problem(s)`. It has no UPWARD, CYCLE or `moved:` line. The roadmap is at merge-order line 398.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- **`Suggested.lean`.** `git diff --stat 93d475d HEAD` on it is empty. `lake env lean` exits 0 in 6 s, with six `declaration uses 'sorry'` warnings (lines 63, 83, 122, 158, 172, 217) and nothing else.
- **Binder check.** I elaborated a scratch copy with `#check @` for all 13 declarations. Every type matches the previous report.
  - The one signature lead flags `incidenceEquation`, whose `NormedSpace ℝ` binders are dropped. That is harmless: its body `F (x, p) − j y` needs only subtraction on `V`.
  - The three binder sets the previous report compared are the same: §2.4 (`X : Type`, `FiniteDimensional ℝ E`, `IsManifold I ∞ X`, `T2Space`, `SigmaCompactSpace`, `IsOpen W`), §2.2 and §5.3 manifold (`BoundarylessManifold` and `SecondCountableTopology` on `M` and `N`).
- **Padding probe.** Carried from the previous report, since the file is unchanged.

### The changed passages, against the pin

**Tau Ceti (pin 2fd255d), opened.** These are in `Geometry/Manifold/SmoothSingular/Basic.lean` unless noted.

- `smoothSingularSubcomplex` (`:77`) is `ContMDiffOnSubset I ∞` of the simplex read on `fullSimplex`.
- `ContMDiffOnSubset` (`ContMDiff/OnSubset.lean:58–60`) gives, near each point, `U ∈ 𝓝 x` and `g : E → M` with `ContMDiffOn 𝓘(𝕜, E) I n g U` and `g = f` on `s ∩ U`. Here `E` is `EuclideanSpace ℝ (Fin k)`. So "agree with a map into `M` that is smooth on a neighbourhood in `ℝᵏ`" is exact.
- `smoothSingularSubcomplexMap` (`:205`) needs only `ChartedSpace` and `ContMDiff I J ∞ φ`, so §2.3's "no manifold structure is used" holds.
- `smoothSingularSubcomplexMap_ι` (`:215`) is the restriction square.
- `smoothSingularSubcomplexMap_id` (`:222`) is `… id contMDiff_id = 𝟙 _`.
- `smoothSingularSubcomplexMap_comp` (`:230–237`) is `… (ψ ∘ φ) (hψ.comp hφ) = … φ hφ ≫ … ψ hψ`.
- All of `M`, `N`, `P` live in one universe `u`. Conventions (`:147`) put every space in `Type`.

**Tangency clause** (`:313–314`), computed. Take `g` smooth on `U ∈ 𝓝 x` with `g(x) ∈ ∂M`. Then `ContDiffWithinAt` on a neighbourhood is `ContDiffAt`. The boundary coordinate `(I ∘ chart ∘ g)₀ ≥ 0` vanishes at `x`, so it has a minimum there and its derivative is `0`. The image of `Dg(x)` therefore lies in `T∂M`, and the clause is correct.

No untouched passage uses a smooth simplex that meets a boundary transversally:

- §2.4's Checks are on `ℝ` and `ℝ²`.
- §4.1 is boundaryless.
- §4.2's Checks pair relative classes, not chosen simplices.
- The "must not enter" bullet (`:1288`) agrees with the clause.

**Route** (`:657–664`).

- `_comp` with `ψ = j` and `φ = r` gives `(j ∘ r)^∞_* = r^∞_* ≫ j^∞_*` at the simplicial level.
- Mathlib's chain functor `map_comp` carries this to chains. That step is the "functoriality" the sentence names.
- On singular chains, `singularChainComplexFunctorObjMap` (Mathlib `AlgebraicTopology/SingularHomology/HomotopyInvariance.lean:49`) is a homotopy between `map (ofHom (j ∘ r))` and `map 𝟙`, and `map_comp` splits it.
- So in `K(ModuleCat ℝ)` the arrow-category identity `i ≫ r = 𝟙` holds componentwise by `eq_of_homotopy`.
- The inverse is `h.i.right ≫ inv g ≫ h.r.left` (`CategoryTheory/MorphismProperty/Retract.lean:55`), which is `Q r_* ≫ Q s ≫ Q j^∞_*`.

**Consumers.**

- `roadmaps grep 'DeRhamCohomologyAndDuality (§|Layer )?2\.3'` finds no match on main or in any open roadmap pull request.
- `smoothSingularSubcomplexMap_comp` occurs only in this README, at `:317`, `:662` and `:673`.
- `roadmaps resolve` and the overlap report list nothing: no dropped id, no other pull request changing this roadmap, and no id that only an open revision defines.

### Sources: the seeded sample

- **§2.3 and the contract bullet**, the changed passages, carry no external locator. Their algebra is Mathlib's and their objects are Tau Ceti's, opened above.
- **Hatcher**, re-read: Prop. 1.30 at `hatcher` line 2676 (page marker 69), Prop. 1.33 at line 2723 (marker 70) and Prop. 1.34 at line 2758 (marker 71). These match `README.md:476`.
- **The other sampled targets** (§§1.1–1.3, 2.1–2.2, 2.4–2.5, 3.1, 3.3, 4.1–4.2 and 5.1–5.3) are untouched. Their verification is carried from the previous reports.
- **Unverified locators.** The README flags none.

### Headline theorems

These are unchanged:

- **Stated:** 1.3 (`exists_isPrimitiveOn_univ_of_simplyConnectedSpace`), 2.2 (`exists_smooth_inward_deformation`), 2.4 (`quasiIso_smoothPairToSingular`), 5.2 (`addHaar_setOf_not_isRegularIncidenceParameter`) and 5.3 in flat and manifold forms.
- **Named in the docstring as not statable:** 3.3, 4.1 and 4.2. Each lacks `deRhamHom`, and 4.1 and 4.2 also lack AlgebraicTopology 6.3's classes.
- **§2.3** is not a headline.

### Adversarial table

Rows marked "r24" are carried from the previous report (`PRREVIEW-DeRhamCohomologyAndDuality~24`), whose statements the diff leaves untouched. Rows C1, C2 and 17a–17c are new or changed, and were computed this round.

| # | Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|---|
| 1 | §1.1 local primitives (r24) | `x dy` on a disc; `dx` | `∂ₓ∂_y g = 1`, `∂_y∂ₓ g = 0`; `g = Re` | `x dy` fails, `dx` passes |
| 2 | §1.1 regularity (r24) | `d(x² sin(1/x))` at `1/(2πn)`, `1/((2n+1)π)`, `0`; `d(|x|^(3/2))` | `−1`, `+1`, `0`; `(3/2)h^(−1/2) → ∞` | continuity not necessary |
| 3 | §1.2 covering without `T2` (r24) | sheets `graph(g + c)(U)` | one point per fibre; disjoint for `c ≠ c′` | no `T2` used |
| 4 | §1.2 integral (r24) | angular form: loop, double loop, reversal | `2π`, `4π`, `−2π` | holds |
| 5 | §1.2 subdivision (r24) | `dx` on `[0,3]`, split at `1`, primitives `Re`, `Re + 7` | `(1 − 0) + (10 − 8) = 3` | independent of choices |
| 6 | §1.2 agreement (r24) | `d(|x|^(3/2))`, `(0,0)` to `(1,0)` | ours `1`; `pathClassIntegral` `0` | needs closed `C¹` |
| 7 | §1.3 non-Hausdorff (r24) | branching line, `φ = dx` | `π₁ = 1`; primitive `x` per branch | holds without `T2` |
| 8 | §1.3 degenerate (r24) | `E = 0`, `M` a point | only form `0`; `g` constant | holds |
| 9 | §1.3 holomorphic Check (r24) | slit plane, `1/z`; `ℂ∖{0}` | principal `log`; `∮ dz/z = 2πi` | simple connectivity needed |
| 10 | §2.1 cone (r24) | `[0,∞)` at `0`, `v = 1, 0`; quadrant | `ball(t, t/2) ⊆ C`; `−εt/2 ∉ C` | as stated |
| 11 | §2.1 openness (r24) | `t₀ = δ/2` | radius `(ε/2)t` | uniform `(ε/2, δ/2)` |
| 12 | §2.1 interior anchor (r24) | `ball(q, 2ε₀) ⊆ C` | radius `ε₀t` | holds |
| 13 | §2.2 Lean (r24) | `[0,∞)`, `Φ(t,x) = x + (1−t)²`, `t = 0, 1, 3` | `1 = r(0)`; `x`; `Φ(3,0) = 4` | holds |
| 14 | §2.2 semiflow Check (r24) | `[0,1]`, `1/2 − x`; `x(1−x)` | `r(0) = 0.316`, `r(1) = 0.684`; `r(0) = 0` | vanishing field fails |
| 15 | §2.2 non-degeneracy (r24) | `M` with boundary | `r = id` misses the interior | no trivial witness |
| 16 | §2.2 corner Check (r24) | quadrant, `(0.3, 0.7)` | inverse `((0, 0.4), 0.3)`; `∂ₓ min` `1` / `0` | topological collar only |
| C1 | Contract: tangency clause (new) | `[0,∞)` with `σ(t) = t²`, `σ(t) = t` at vertex `0`; half-plane `{x₀ ≥ 0}`, `σ(t) = (t², t)` | `c = t²`: `c(0) = 0`, `c′(0) = 0`. `c = t` on `[0, ε)`: any `g ≥ 0` with `g(0) = 0` has `g′(0) = 0` but right quotient `1`, so there is no extension. Half-plane velocity at `0` is `(0, 1)`, normal part `0` | clause correct |
| C2 | Contract: `_ι`, `_id`, `_comp` (new) | pinned statements, `ψ = j`, `φ = r` | `:215`, `:222`, `:230`; `(j∘r)_* = r_* ≫ j_*`; `(id)_* = 𝟙` | as cited |
| 17a | §2.3 route (changed) | `i = (Q r^∞_*, Q r_*)`, `r = (Q j^∞_*, Q j_*)` | `i ≫ r = (Q r^∞_* ≫ Q j^∞_*, Q r_* ≫ Q j_*) = (𝟙, 𝟙)` by `_comp`, `map_comp`, `H`, `Φ`; inverse `Q r_* ≫ Q s ≫ Q j^∞_*` | holds; `_comp` cited |
| 17b | §2.3 Check `j = r = id`, `H = 0` (changed) | `_id`; Mathlib `Homotopy.comm` | `𝟙 = d∘0 + 0∘d + 𝟙`; inverse `𝟙 ≫ s ≫ 𝟙 = s` | holds |
| 17c | §2.3 Check `[0,∞) ⊇ (0,∞)` (changed) | `r_*[0]`; `s[1] = ½[2] + ½[3]`; `τ_p(t) = 1 + t(p−1)`; `σ(t) = t²` | `[1]`; total coefficient `1`; `s[1] − [1] = ∂(½τ₂ + ½τ₃)`, `τ₃` on `(−0.25, 1.25)` in `(0.5, 3.5)`; weights `(1−t, t)` (`FullSimplex.lean:96–118`), so `∂σ = [σ(1)] − [σ(0)] = [1] − [0]`; negative control `t ↦ t` rejected (C1), accepted by `ContDiffOn [0,1]` read on the simplex | holds; control discriminates |
| 17d | §2.3 Check `S¹`, `r` constant (r24) | `H₁(S¹; ℝ)` | factors through `H₁(pt) = 0` / iso on `ℝ` | homotopies needed |
| 17e | §2.3 Check: `Φ` does not give `H` (r24) | cube-root charts, `a = 0`, `b = 1`, `z = 1` | chart change not differentiable; `Dg = 3k²Dk = 0`; smooth `H₀ = ℝ^(ℝ)` / singular `ℝ` | Check correct |
| 17f | §2.3 degenerate (r24) | `M = ∅`; `N = M`, `Φ` constant | all complexes `0`; reduces to 17b | holds |
| 19 | §2.4 degenerate (r24) | `W = ∅`; `W = X` | absolute case; `0` | holds |
| 20 | §2.4 with boundary (r24) | `[0,∞) ⊇ (0,∞)` | all relative groups `0` | holds |
| 21 | §2.4 `(ℝ, ℝ∖{0})` (r24) | long exact sequence | `H₁ = ℝ`, `H₀ = 0`; `∂(t ↦ 2t−1) = [1] − [−1]` | holds |
| 22 | §2.4 openness (r24) | nowhere-differentiable graph | smooth relative `H₁` of dimension `𝔠` / `0` | `hW` needed |
| 23 | §2.5 route (r24) | `h = f + ρ(e − f)` | `‖h − f‖ < ε/2`; `h = e` near `A` | holds |
| 24 | §2.5 Checks (r24) | `r(2)`, `r(−1)`, `r(0.3)`, `r((3,4))`; `Q(t,t,t)` | `1`, `0`, `0.3`, `(0.6,0.8)`; `−0.03` at `t = 0.1` | holds |
| 25 | Must-not-enter `3`-simplex (r24) | Hessian on `(1,1,1)` | `−3t²` | smoothing false |
| 26 | §3.1 `d² = 0` (r24) | `(α, β)` | `(0, 0)` | holds |
| 27 | §3.1 sign of `δ` (r24) | `b = 1_{x>0}`, `c = [−1,1]` | ours `1`, singular `1`, opposite `−1` | holds |
| 28 | §3.2 comparison sign (r24) | `d(b̃, 0) = (db̃, b)` | `[(db̃,0)] = −[(0,b)]` | holds |
| 29 | §3.2 no canonical inverse (r24) | `t = 0`, `t = 5` | both `(0, k₂)` | as claimed |
| 30 | §3.2 evaluation (r24) | `ψ dx` | `1 − (1 − 0) = 0` | holds |
| 31 | §3.3 isomorphism (r24) | `(ℝ, ℝ∖0)`; `(ℝ², ℝ²∖0)`; `(S¹, S¹∖pt)` | `ℝ`; `2π`; `ℝ` | holds |
| 32 | §4.1 formulas (r24) | `ψ dx`, `K = [−1,1]`, `K′ = [−3,3]`; discrete `ℤ` | `1`; `1 = 1`; `1 + 2 = 3` | holds |
| 33 | §4.1 generator (r24) | Tau Ceti chart generator / 6.3's | `1 → −1` / `−1 → 1` | 6.3's is right |
| 34 | §4.2 boundary formula (r24) | `D¹`, `c₊ = 3`, `c₋ = 1`; `[0,1]`, `(dx, x)` | `−2`; `0` | holds |
| 35 | §4.2 Hausdorff (r24) | doubled origin | `a = b = a + b = s ⇒ s = 0` | `T2` needed |
| 36 | §5.1–5.2 (r24) | `x + p` at `((1,2),3)`; `x² + p`, `p = −1, 0, 1` | `2`; regular, not, regular | as stated |
| 37 | §5.3 (r24) | `β = x², p = 1, x = 2`; `S¹`, `cos θ`; discrete `N` | `4`; `{−1, 1}`; `∞` | holds |

### Remarks on untouched text

None.

## Not verifiable

- **Lee (`lee`) and Bott–Tu (`bott-tu`).** Both are settled as uncertified and were not read. The changed passages cite neither.
- **Ownership against open pull requests without a checkout** (#1187, #1797, #1807, #1808, #1854). These were checked only by `roadmaps grep`. No roadmap claims the §2.3 transfer, and none cites §2.3.

## Source issues

- none
