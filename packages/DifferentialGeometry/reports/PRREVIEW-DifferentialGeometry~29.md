# Review of DifferentialGeometry (pull request #886 at bd8a8c3)

**Verdict:** needs changes

This is an incremental re-review of the 57 changed README lines since 4753cef. `Suggested.lean` is byte-identical to 4753cef. The previous R01 is repaired. Two P3 findings are left, both in passages this repair rewrote:

- One dropped name is mapped to the wrong Tau Ceti native.
- The rewritten ComplexKahlerGeometry consumer entry leaves out most of what that roadmap cites.

The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with its 36 `sorry` warnings and nothing else.

## R01 (P3) — The dropped name `integralTopForm_of_tsupport_subset_chart` is mapped to the wrong Tau Ceti native

**Location.** README 1713–1714 (5.2): "any representing lift (`TauCeti.integralTopForm_eq_chartIntegral`, the chart formula that consumers cite as integralTopForm_of_tsupport_subset_chart)".

**Claim.** The head identifies the consumers' name with `TauCeti.integralTopForm_eq_chartIntegral`. But the pinned Tau Ceti declares `TauCeti.integralTopForm_of_tsupport_subset_chart` under that exact name, with the statement main's DG declared. The mapped theorem differs in both its hypotheses and its conclusion:

- It asks for `IntegrableTopForm φ` instead of a `C⁰` form with compact `tsupport`.
- Its right side is the opaque `l.chartIntegral φ α`, not the explicit coefficient integral.

QuaternionicAnalysis on main (README 160, 810) applies the name "coefficientwise on that chart", that is, it uses the explicit formula. DeRhamCohomologyAndDuality (README 252, 980, 1006 at its open head) already cites the native by its full name.

**Witness.** `Integration/Regularity.lean:67`: `IsSmoothForm I 0 φ`, compact `tsupport ⊆ (chartAt H α).source`, `b.orientation = l.modelOrientation` give `∫ y in target, signAt · mpullback … φ y b ∂b.addHaar`. This is hypothesis for hypothesis main DG `Suggested.lean:1779`. `TopForm.lean:722` differs.

**Repair.** At README 1713–1714, replace the parenthesis with the following text:

> (`TauCeti.integralTopForm_eq_chartIntegral`); for a compactly supported `C⁰` form whose support lies in one chart, that integral is the Haar integral over the chart target of the lift's sign times the pulled-back coefficient on a positively oriented basis (`TauCeti.integralTopForm_of_tsupport_subset_chart`, `DifferentialForm/Integration/Regularity.lean`, the chart formula consumers cite under that name)

I tested this on a scratch copy of the README. `roadmaps resolve` reports no cross-roadmap citation and no Lean name found nowhere, and the backticked name exists at Tau Ceti `2fd255d9`.

## R02 (P3) — The rewritten ComplexKahlerGeometry consumer entry leaves out most of the DG sections that roadmap cites

**Location.** README 3151–3154: "**ComplexKahlerGeometry**: the forms and wedge of layers 0–1 with 0.4's two-form migration, 2.1's orientations, 5.5a's `Density` with its scaling, … 12.4's comparison … and layer 12's sign convention for the Laplacian."

**Claim.** The repair rewrote this entry as an item-by-item list of what ComplexKahlerGeometry consumes. The list omits 2.2, 5.4, 6.2, 8.3–8.5, 9.3 and 12.1, which ComplexKahlerGeometry on main cites by number. Among them are the de Rham theorem and the duality layer. The section's own preamble says it records consumption "by layer or section", so a renumbering of 8.3–8.5 or 9.3 would not show up as touching this consumer.

**Witness.** The ComplexKahlerGeometry README on main (`08d58bb`, unchanged at `71c8f21`) cites:
- "DG 2.2's pullback" (:111)
- "DG8.4's existing … simplex/chain integrals" (:922)
- "DG6.2's … primitive … DG5.4's" (:953)
- "DG12.1's pullback" (:1293)
- "DG9.3's general fundamental-class integration" (:1328)
- "DG8.3–8.5/9.3/12.1" (:1666)

**Repair.** Replace the entry with the following text:

> **ComplexKahlerGeometry**: the forms and wedge of layers 0–1 with 0.4's two-form migration, 2.1's orientations and 2.2's pullback of orientations, 5.4's homotopy operator and 6.2's Poincaré lemma, 5.5a's `Density` with its scaling, rough densities, integral of densities and agreement with the integral of top forms, the smooth chains, chain integrals and de Rham theorem of 8.3–8.5, 9.3's duality, 12.1's pullback metrics, 12.4's comparison of the Riemannian measure with the Riemannian density, and layer 12's sign convention for the Laplacian.

I tested this on the same scratch copy as R01. `roadmaps resolve` lists nothing, and the headings of 2.2, 5.4, 6.2, 8.3, 9.3 and 12.1 are at README 1040, 1750, 2421, 2537, 2658 and 2794.

## Previous findings

- R01 — repaired: README 1879–1880 now reads "rough densities (a `Density (TangentSpace I x) m` at every point `x`, cited by consumers as RoughDensity)". Scope and ownership (README 38–39) still sends citations of 5.5 to 5.5a, so ComplexKahlerGeometry `README.md:629` ("DG 5.5's `RoughDensity`") resolves. The same repair also maps the previous report's remark (`SMul ℝ`, `integralTopForm_eq_integralDensity`, `integral_riemannianVolume_eq_integralDensity`). It introduced R01 above.

## Verified sound

**Gate**, re-run on this head (text checks and dependency check; the worker's run on the same head also passed the targeted build, `build=0`):

    gate DifferentialGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

**Dependency check:**

    depcheck: 233 roadmaps, 2263 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the folder is empty, and `git merge-tree --write-tree HEAD origin/main` is clean. The overlap report lists #334 and #1187 on this folder. The description and its generated merge-order block order both after this pull request. The report shows no dropped or revision-only ids.

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with 36 `declaration uses sorry` warnings and no other diagnostic. `git diff --stat 4753cef HEAD` touches only the README. The 64 declarations, their signatures and the nine "dropped binder" leads of `signatures.md` are therefore exactly as the previous report checked them.

**The mapped names, checked against main's declarations.** Each "cited by consumers as X" phrase was compared with main DG's statement of X. All match except R01's name:

| Name | Main DG | Head text it maps to |
|---|---|---|
| legacySmoothTwoFormEquiv, …_isClosed_iff | `Suggested.lean:711, 716` | the identity of `abbrev SmoothTwoForm := SmoothForm I M ℝ 2` (Tau Ceti `TwoForm/Basic.lean:37`), closedness `mextDeriv form.1 = 0` (`DifferentialForm/Closed.lean:43`) |
| toFlow | `:1397`, `toFlow_apply = flowOf v t x` | 3.3's `Flow ℝ M`; Tau Ceti `globalFlow` (`GlobalFlow.lean:60`), `flowOf_eq_globalFlow` (`:85`) |
| `SMul ℝ` on `Density` | `:1905–1906`, `c * μ.toFun v` | `(c • μ).toFun v = c · μ.toFun v` |
| RoughDensity, toDensity | `:1915`, `:1921–1929` (`if b.orientation = orientationAt o x then φ x b else -φ x b`) | `Density (TangentSpace I x) m` at each `x`; `φ · sign_o` |
| integralDensity, integralTopForm_eq_integralDensity | `:1935`, `:1938` | 5.5a integral and `∫_o φ = ∫ φ · sign_o` |
| SmoothSimplex.integral_mextDeriv | `:2628` (`IsSmoothForm I 1 φ`, `[CompleteSpace F]`) | 8.4 Stokes "for a `C¹` form with complete coefficients"; no simplex Stokes native at the pin (`SmoothSingular/`) |
| circleLoop | `:2702`, `SmoothSimplex (𝓡 1) Circle 1`, `Circle.exp (2π x₀)`; period `2π` at `:2715` | 8.5 acceptance |
| riemannianDensity, integral_riemannianVolume_eq_integralDensity | `:3246, 3249` (value 1 on orthonormal bases), `:3266` (continuous, compactly supported `f`) | 12.4 `ρ_g` and `∫ f d(riemannianVolume I M) = ∫ f • ρ_g` |
| integralTopForm_of_tsupport_subset_chart | `:1779` | mismatched: R01 |

A sweep of the 393 declaration names of main DG's `Suggested.lean` found 188 that the head neither declares nor mentions. None of the distinctive ones is cited by another roadmap on main; the only hits are collisions of generic names such as `map_id` and `mk_surjective`.

**Consumers resolved** (main `08d58bb`; index main `71c8f21`):
- ComplexKahlerGeometry README 65–66, 629, 927–928, and its `Suggested.lean` 16–17.
- LieGroupoidsPoisson README 43–44, 192, 1207–1211.
- SymplecticGeometry/HamiltonianReduction README 21.
- QuaternionicAnalysis README 160, 810.
- SmoothBundlesConnections README 200, 1587, 1645 ("8.5's `circleLoop` acceptance", which matches the head's 8.5).

At open heads:
- MorseNovikov README 173 (`toFlow`).
- ComplexKahlerGeometry README 438–443 (`toDensity`, `riemannianDensity`).
- GeometryOfNumbersAndQuadraticArithmetic README 176.
- IntegralLattices README 544.
- DeRhamCohomologyAndDuality README 252, 980, 1006.

**Library declarations opened** (Tau Ceti `2fd255d9`, 13):
- `Integration/Regularity.lean:67` and `TopForm.lean:695, 722`.
- `Topology/Sphere/StandardCircle.lean:37` `TauCeti.circleLoop : C(Fin 1 → I, Sphere1)`, `t ↦ (cos 2πt, sin 2πt)`. This is as the head says: not a smooth simplex.
- `Geometry/Sphere/Circle.lean:54` `Sphere1`, the unit sphere of `EuclideanSpace ℝ (Fin 2)`.
- `Geometry/Convex/FullSimplex.lean:44, 49` (`fullSimplex 1 = [0, 1]`).
- `DeRham/Circle.lean:149` `pathIntegral_circleAngularForm_circleExp`.
- `TwoForm/Basic.lean:37`, `DifferentialForm/Closed.lean:43`, `Symplectic/Manifold/TwoForm.lean:29`.
- `VolumeDensity/Volume.lean:82` (explicit `I M`).
- `GlobalFlow.lean:60, 85`.

**Seeded sample.** The eight targets are at README 544, 1408, 1631, 2068, 2224, 2332, 2357 and 2372.

"Smooth 2-forms" (544–556) is the only one the diff touches. It has no source locator. Its new consumer list checks out (LieGroupoidsPoisson, HamiltonianReduction and ComplexKahlerGeometry each cite both names, as listed above), and its Tau Ceti claims match `TwoForm/Basic.lean:37` and `Closed.lean:43`.

The other seven are unchanged apart from line shifts, so the earlier verification stands. No locator is flagged as unverified.

**Ownership.** The changed lines add no owned object. They name existing targets under consumers' names. Ownership against open pull requests was checked only for the changed passages, through `roadmaps grep` of the mapped names and the overlap report's vocabulary list (#2085, #1807, #1808, #1854, #946).

**Remark** (untouched text, not a finding): README 1287 and 2594 were rewrapped past the 100-column width of the rest of the file.

**Adversarial table.** The first ten rows are this round's. Rows marked "r28" are carried from the report on 4753cef; their statements are untouched by the diff (rows marked "r27" there are carried with it).

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 5.2 mapping of integralTopForm_of_tsupport_subset_chart (1713–1714) | `φ = f dx` on `ℝ`, `f` continuous with compact support, chart `id`, `b = e₁`; `φ = 1_[0,1] dx` | native of that name: `∫ f`, hypotheses met; `integralTopForm_eq_chartIntegral`: `l.chartIntegral φ 0`; for the indicator, `IsSmoothForm I 0` fails and only the mapped theorem applies | different statements | R01 |
| 0.4 legacy two-form identity (551–556) | constant `dx∧dy` on `ℝ²` at `(e₁, e₂)`; closedness | `1` on both sides (same term); `mextDeriv φ = 0 ↔ mextDeriv φ = 0` | holds | none |
| 3.3 `Flow ℝ M` as toFlow (1284–1287) | `v = 1` on `ℝ`; `v = x²` | `x + t` both sides; not complete (`(t, 1)` in the domain only for `t < 1`), no flow | holds | none |
| 5.5a scaling `(c • μ).toFun v = c · μ.toFun v` (1879) | `ℝ²`, `μ = \|dx∧dy\|`, `T = diag(2, −1)`, `c = 2`, `c = −1`; wrong model `v ↦ μ(cv)` | `(2•μ)(Te) = 4 = \|−2\|·2`; `(−μ)(Te) = −2 = 2·(−1)`; `μ(2e) = 4 ≠ 2` | holds | none |
| 5.5a Check `2 • μ` (1903–1906) | as above | `2` on `e`, `2·\|det T\|` on `Te`; `μ(2e) = \|det(2·id)\| = 4` | holds | none |
| 5.5a `φ · sign_o` and `∫_o φ = ∫ φ · sign_o` (1880–1883) | `φ = dx` on `ℝ`, `v = −1`; `o` and `−o` with `f dx` | `(−1)(−1) = 1 = \|−1\|·1`; `∫ f = ∫ f`, `−∫ f = −∫ f` | holds | none |
| 8.4 Stokes as SmoothSimplex.integral_mextDeriv (2593) | `σ = id` on `Δ¹`, `0`-form `f` | `f(1) − f(0)` on both sides | holds | none |
| 8.5 acceptance period (2619–2622) | `σ(t) = exp(2πit)` on `fullSimplex 1 = [0, 1]`; reversed `exp(−2πit)` | `σ^*dθ = 2π dt`, period `2π`; `−2π` | holds | none |
| 12.4 `ρ_g` value `1` on orthonormal bases (2896–2898) | flat `ℝ²`; `g = diag(4, 1)` with orthonormal `(e₁/2, e₂)`; wrong model `det g` | `ρ(e) = 1`; `ρ(e) = \|det diag(2, 1)\|·1 = 2 = √det g`; `4 ≠ 2` | holds | none |
| 12.4 `∫ f d(riemannianVolume I M) = ∫ f • ρ_g` (2910–2912) | flat `ℝ²`; `g = diag(4, 1)`, `f` continuous with compact support | `∫ f dx` on both sides; `∫ f d(2·Leb) = ∫ 2f dx` | holds | none |
| Downstream ComplexKahlerGeometry entry (3151–3154) | ComplexKahlerGeometry on main | cites 2.2, 5.4, 6.2, 8.3–8.5, 9.3, 12.1; entry lists none of them | incomplete | R02 |
| 5.5a rough densities (r28) | `ℝ²`, `m = 2`, `T = diag(2, −1)`; `m = 1`; `dim 0`; `dx∧dy` | `2 = \|det T\|`; `1 ≠ 2`; `Density 0 0 ≅ ℝ`; `−2 ≠ 2` | holds | none |
| 5.5a Check: `\|ω\|` and the Riemannian density in degree `dim` (r28) | flat `ℝ²`, `T = diag(2, −1)` | `√det(TᵀT) = 2 = \|det T\|` | holds | none |
| Docstring: `immersionMetric`, `halfSpaceBoundaryMetric` as Tau Ceti instance forms (r28) | `n = 0`; flat half-plane | trivial fibre; `dy²` on both sides | holds | none |
| Docstring: `Density`, `planarRadialPrimitive`, `contractionAlongMap`, `familyContraction` without counterpart (r28) | `P = 1, Q = 0`; `ι_{e₁}(dx∧dy)` | `g = Re z` vs the 1-form `(x dy − y dx)/2`; `dy` | holds | none |
| 5.5a `Density` (r27, via r28) | `V = ℝ`, `m = 1`; `dx` | `toFun(−1) = toFun 1`; `dx(−1) = −1` | discriminates | none |
| 12.1 `immersionMetric` (r27, via r28) | `id`; `2x`; `x²` | metric; `4dx²`; `hinj` fails at `0` | body correct | none |
| 2.4 orientation cover (r27, via r28) | `∅`; `dim 0`; `S¹ ⊔ S¹`; `S¹ ⊔ B` | true/true ×3; false/false | holds | none |
| 2.4 averaging and `d` (r27, via r28) | `τ ≡ c`; `τ = id` | `df/2`; `dφ` | holds | none |
| 9.2 top compact cohomology (r27, via r28) | point; `ℝ`; open Möbius band | `ℝ`; `ℝ` by `∫`; `0` | holds | none |
| 9.3 `bijective_poincarePairing` (r27, via r28) | `∅`; discrete; `ℝ`; `[0, 1]` | `0 → 0`; `∏ℝ → (⊕ℝ)^*`; `1 ↦ ∫`; excluded | holds | none |
| 10.3–10.4 degree formula (r27, via r28) | `id` on `S¹`; constant; `o ↦ −o`; `n = 0` | `1·∫η`; `0`; negated; `±1` | holds | none |
| 4.2–4.4 Frobenius on `TauCeti.IntegralManifold` (r27, via r28) | constant; contact; rank 0; irrational line | affine; `∂z ∉ D`; points; dense | holds | none |
| 5.6 punctured-plane family and examples (r27, via r28) | general `α`; unit circle; ellipse | curl `2(1−α)ρ^(−α)`; `2π`; `πab` | holds | none |
| 12.5 divergence theorem and boundary metric (r27, via r28) | half-line; unit disc; `n = 0` | `−f(0)`; `2π`; trivial fibre | holds | none |
| 11 hairy ball (r27, via r28) | `n = 0, 1, 2` | `v = 0`; `ix` excluded; vanishes at poles | holds | none |
| 2.2 top form, atlas criterion, `pullbackSign` (r27, via r28) | `dim 0`; `ℝ`; `Icc 0 1`; charts `t`, `−t` | `φ = 1`; `dx(e₁) = 1`; excluded; `−1` | holds | none |
| 0.3 `isSmoothBundleForm_mpullback` (r27, via r28) | `f = id`; trivial bundle | `φ`; native case | holds | none |
| 3.1–3.5 flows (r27, via r28) | `v = 1`; `x²`; `ℓ²`, `Ax`; `v s x = s` | `x + t + u`; `1/(1/x − t)`; `e^{tA}x`; `x + (t² − s²)/2` | holds | none |
| 5.4 radial primitive, 5.4a moving pullback (r27, via r28) | `(y, x)`; `(−y, x)`; `x + t e₁`, `x dy` | `xy`; excluded; `dy = 0 + dy` | holds | none |
| 12.1 `volume_circle` (r27, via r28) | round metric | `2π` | holds | none |

## Not verifiable

- [Lee], GTM 218, is not in the sources cache and is not open access. The changed lines only rewrap its existing citations (Ch. 16 "Densities", Thm. 18.12, Thm. 18.14, Prop. 15.29), which are unchanged since 03882f5.
- The 3.3 and 8.4 mappings to MorseNovikov's and ComplexKahlerGeometry's open revisions were read at their heads in the `roadmaps grep` index. Those heads can move.

## Source issues

- none
