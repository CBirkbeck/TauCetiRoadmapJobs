# GATE-DifferentialGeometry~1: answers to human review on `TauCetiRoadmap/DifferentialGeometry/`

Repair commits `57496534`, `44a879a3` and `f941c3d7` on top of `f3756b4`. Files edited: `TauCetiRoadmap/DifferentialGeometry/README.md` and `TauCetiRoadmap/DifferentialGeometry/Suggested.lean`.

## H01 (roed-math) — answered
The strict face-fixing smoothing lemma is false for targets with boundary, and the half-line 3-simplex counterexample checks out: the three coordinate faces force second derivatives 2 and −3/2 at the origin, so `τ(r,r,r) = −(3/2)r² + o(r²) < 0`. The repaired statement carries `BoundarylessManifold I M`: README 8.3, "Boundaryless smoothing", states the relative smoothing lemma for a finite-dimensional T2 σ-compact target with `BoundarylessManifold I M`, and gives the half-line counterexample. The Lean declaration `exists_smoothSimplex_homotopicRel` was removed in `f941c3d7` along with the smooth singular chain complex it is stated on (see the sorry-data section below), so the lemma is now a README target.

## H02 (roed-math) — answered
The smoothing equivalence for general corner models is assigned in the head: 3.6 provides inward domination (`smoothInteriorOpen` with the instance `smoothInterior_boundaryless`, `Suggested.lean` lines 1353–1357), and in the README Ordering section generic-corner smoothing 8.3 uses 3.6 while boundaryless smoothing 8.3 does not. The repair asked for is already in place.

## H03 (kim-em) — answered
This comment reports the changes behind H01/H02 and makes no new claim. Those changes are present at the head as described: the boundaryless face-fixing lemma, inward transfer through the interior, and the open-pair comparison through the absolute constructions.

## H04 (roed-math) — answered
An arbitrary `ModelWithCorners` gives no smooth faces; the `y ≥ |x|^(3/2)` model shows this. The head splits 5.5 into 5.5a, densities for every finite-dimensional model, and 5.5b, which requires explicit compatible quadrant/face chart data (README "5.5a"/"5.5b" bullets in Layer 5; scope paragraph at README lines 83–96). This is the reviewer's route 1. No further change.

## H05 (roed-math) — answered
Without a support hypothesis the divergence theorem with boundary is false; the half-line with `X = +∂x` gives `0 ≠ −1`. The head states it with `hSupport : IsCompact univ ∨ ∃ K, IsCompact K ∧ ∀ x ∉ K, X x = 0` and both integrability statements as conclusions (`integrable_divergence_and_boundaryFlux`, `integral_divergence_eq_boundaryFlux`, `Suggested.lean` lines 2938–2963). Recomputed for a compactly supported `X` on `[0,∞)`: `∫ X' = −X(0) = ⟨X(0), −∂x⟩`.

## H06 (roed-math) — applied differently
The dependency cycle is gone at the head: the 5.6/12.5 comparison is now 12.6, downstream of both, and 12.4 consumes 5.5a, not 5.5b. In the README `## Ordering` section, layer numbers were glued to the preceding word (`Orientations2`, `gate5.5a`, `need 0–1;6.3`). Spaces were restored so the stated DAG reads unambiguously, e.g. `consumes AT6.3 … follows DG2/5.1` → `consumes AT 6.3 … follows DG 2 and DG 5.1`.

## H07 (roed-math) — applied
The pin-history prose was already gone at the head, but two Tau Ceti names in it are absent at the pinned Tau Ceti `a91d3aaf`. The first is `TauCeti.IsRegularDistribution` (README line 256) → `TauCeti.IsContMDiffDistribution` (`TauCeti/Geometry/Manifold/Distribution.lean`). The second is `TauCeti.Manifold.riemannianGradient` with `contMDiff_riemannianGradient` (README 12.2 and the paragraph after the distribution contract): there is no `Riemannian/Gradient.lean` at the pin, so 12.2 now defines `mgradient` as the Riesz dual through the pinned `Riemannian.Tensor.rieszDual` (`TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Riesz.lean`), with smoothness from `contMDiffAt_rieszDual` under that lemma's `C^(n+1)`-manifold / `C^n`-metric hypotheses. Off-pin commit links were replaced by pinned file paths, the self-referential pull-request link `[layer 5.6](…/pull/826)` became "layer 5.6", and the `mgradient` docstring no longer calls it compatibility notation.

## H08 (CBirkbeck) — applied
The counterexample is correct. The two real lines are glued by translations along disjoint intervals at `a_mn = 2^(−2^m(2n+1))` and `c_mn = 2^(−m) + 2^(−m−n−2)`. Every continuous `f` then has `f(0_B) = f(2^(−m)_B)`, so a global smooth primitive of `dy` has derivative 0 at `0_B`. The old conclusion `∃ U ∈ 𝓝 x, ∃ ψ : RoughForm I M F k, IsSmoothForm I ∞ ψ ∧ ∀ y ∈ U, mextDeriv ψ y = φ y` is therefore false with no `T2Space M`. It becomes `∃ U : TopologicalSpace.Opens M, x ∈ U ∧ ∃ ψ : RoughForm I U F k, IsSmoothForm I ∞ ψ ∧ mextDeriv ψ = φ.restrict U` (`exists_mextDeriv_eq_nhds`, `Suggested.lean` line 2064), using the existing `RoughForm.restrict` and Mathlib's open-subset manifold instance. README 6.2 says the primitive lives on `U`, and the example is added to the pitfalls list. No Lean consumer used the old global form: the only other mention is a docstring cross-reference in `homotopyOperator`.

## H09 (CBirkbeck) — answered
The docstring is wrong: `generalModelRelativeEvaluation` evaluates on the pair `(N, W)` with compact `Wᶜ`, not `(N, N\W)`. The fix is one line, `CompactIntegration/GeneralModelIntegration.lean` line 82: `` `(N,N\W)` `` → `` `(N,W)` ``. That file is outside the two files this repair round may edit, so the line is unchanged. No other occurrence exists in the README or `Suggested.lean`.

## Other changes made to pass the gate
- The five LaTeX display blocks in Layer 5.6 (README lines 909, 997, 1012, 1024, 1082) became Unicode indented code blocks with the same formulas.
- The 32 `import Mathlib.<submodule>` lines of `Suggested.lean` were replaced by the single `import Mathlib`, keeping the 27 `TauCeti.*` imports. `Suggested.lean` builds. Modules that import it (`SuggestedRelative.lean`, `SuggestedGreen.lean`, `SuggestedContinuousPaths.lean`, `CompactIntegration/Interface.lean`, and `Suggested.lean` of SymplecticGeometry/ContactGeometry, ComplexKahlerGeometry, MorseNovikov, AlgebraicTopology's orientation modules) now see all of Mathlib. They were not built in this round, because the only permitted Lean target is `Suggested`. CI should confirm there are no new name clashes.

## Adversarial pass on changed statements

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| `exists_mextDeriv_eq_nhds` (new form) | `M = ℝ`, `k = 0`, `φ = dx` | `U = ℝ`, `ψ = x`, `dψ = dx = φ|U` | holds | — |
| same | two-line non-Hausdorff gluing above, `x = 0_B`, `φ = dy` | old: global `ψ` forces `ψ'(0_B) = 0 ≠ 1`; new: `U` = second chart, `ψ = y`, `dψ = dy` | old false, new holds | statement localised |
| same | `M = [0,∞)`, `φ = f dx`, `x = 0` | `U = [0,1)`, `ψ(t) = ∫₀ᵗ f`, `dψ = f dx` on `U` | holds (boundary case) | — |
| same | `F = c₀₀` | primitive leaves `c₀₀` | excluded by `[CompleteSpace F]` | — |
| same | `dim E = 0` | every `(k+1)`-form is 0; `ψ = 0` | holds | — |
| `mgradient` (definition unchanged, docstring/README changed) | flat `E = ℝ²` with the standard inner product, `f = x² + y` | `rieszDual(df) = (2x, 1)` = Mathlib `gradient f` | agrees | — |
| `mgradient` regularity claim (README 12.2) | `contMDiffAt_rieszDual` hypotheses at the pin | needs `IsManifold I (n+1) M`, `IsContMDiffRiemannianBundle I n`, `FiniteDimensional ℝ E` | README now states exactly these | wording |
| `integral_divergence_eq_boundaryFlux` (H05, unchanged) | `[0,∞)`, `X = +∂x`; `X = g ∂x` with `g` compactly supported | first: excluded by `hSupport`; second: `∫ g' = −g(0)`, flux `⟨g(0)∂x, −∂x⟩ = −g(0)` | holds | — |

Signature check: the only changed Lean signature is `exists_mextDeriv_eq_nhds`. Its binders are the section variables it mentions (`I`, `M`, `F`, `k`, and `IsManifold I 1 M` / `IsManifold I ∞ M`, which `IsSmoothForm` and the open-subset instances need) plus the explicit `[CompleteSpace F]`. It elaborated in the build below. A separate `#check` scratch file was not elaborated, because the brief allows only the listed Lean command.

Ownership: no new carrier was introduced. `mgradient` already belonged to Layer 12.2, and `roadmaps grep` finds gradient uses only in consumers (HeegaardFloer, RicciFlow, MorseTheory, FukayaTheory), not as an owned construction. No citation was added, so `sources.toml` and `needs-references.toml` are untouched.

## Repairs to the worker's findings (sorry-data, build warnings)

Commit `44a879a3` cleared every build warning except `declaration uses 'sorry'` and proved the proof-only fields of nine definitions (sorry-data 69 → 60). Commit `f941c3d7`, "real bodies for ten definitions; remaining sorry'd data moved to README targets", takes sorry-data from 60 to 0. The previous round's dispute of these 60 is withdrawn: the acceptance-test rules forbid `sorry`'d data and anything that mentions it, whatever is on `origin/main`.

**Real bodies (10).** Each was checked against its pinning theorem, which stays as a `sorry` theorem.
- `wedgeWith` and `bundleWedgeWith`: `(k! l!)⁻¹ • alternatization` of the continuous multilinear map `v ↦ μ (φ (v ∘ castAdd)) (ψ (v ∘ natAdd))`. This is `MultilinearMap.uncurrySum` reindexed by `finSumFinEquiv`, then `ContinuousMultilinearMap.alternatization`. Continuity comes from `μ.continuous₂`, or from the explicit `hμ` in the bundle case.
- `smoothBundleForms`: the carrier is `{φ | IsSmoothBundleForm I F V ∞ φ}`, closed under the module operations by `contMDiff_zeroSection`, `ContMDiff.add_section` and `ContMDiff.const_smul_section`.
- `mextDerivWithin`: exactly the formula in its docstring.
  - Pull `φ` back to chart coordinates by `mfderivWithin 𝓘(ℝ,E) I (extChartAt I x).symm (range I)`.
  - Apply `extDerivWithin` on `(extChartAt I x).symm ⁻¹' s ∩ range I` at `extChartAt I x x`.
  - Compose with `mfderiv I 𝓘(ℝ,E) (extChartAt I x) x`.
- `orientationAt`: `Quotient.lift` of `if l.sign x ⟨x, _⟩ = 1 then l.modelOrientation else −l.modelOrientation`. The proof that it respects the relation checks the two cases `sign = ±1` by `Int.units_eq_one_or`.
- `deRhamCohomology.mk`: `(liftCycles (ofHom (closedForms I M k).subtype) … ≫ homologyπ k).hom`.
- `deRhamComplexMap` and `deRhamCohomology.map`: `CochainComplex.ofHom` of `mpullbackₗ`, then `homologyMap`. The commuting squares come from `mpullback_mextDeriv` at regularity 2 and 1, with `∞` lowered by `ContMDiff.of_le`.
  - `homologyMap` needs both complexes in one `ModuleCat` universe. The `DeRham` section therefore now takes `E E' : Type uE` and `M M' : Type uM`. README Conventions ("Universes and vocabulary") records this.
- `compactlySupportedForms`: the carrier is `{φ | IsCompact (φ : RoughForm I M ℝ k).tsupport}`, using `tsupport (φ + ψ) ⊆ tsupport φ ∪ tsupport ψ` and `tsupport (c • φ) ⊆ tsupport φ`.
- `immersionMetric`: inner product `g_{f x}(df u, df v)`.
  - Positivity comes from injectivity.
  - Continuity at 0 is `g.continuousAt` composed with `df`.
  - Von Neumann boundedness comes from the antilipschitz bound of an injective map out of a finite-dimensional space. This is the argument of Tau Ceti's private `isVonNBounded_pullbackInner` in `TauCeti/Geometry/Manifold/Riemannian/Induced.lean`, applied to an arbitrary target bundle metric.
  - This keeps the 12.5 divergence theorem with boundary (H05) stated in Lean.

**Removed (50 sorry'd definitions, plus every declaration mentioning one; 186 declarations in all).** Their construction is itself a theorem, so each is now a README target in prose, and the module docstring lists them by layer:
- 0.4: the migration equivalence from `TauCeti.SmoothTwoForm`.
- 1.4: the Lie derivative of forms.
- 2.2–2.4: the pullback orientation, the charted structure induced by a covering map, the topology and canonical orientation of the orientation cover.
- 3.2: the `Flow` of a complete field.
- 3.6: inward domination.
- 4.3: leaves of a distribution.
- 4.4: the coordinate contact distribution. It had two `sorry` proof fields; one of them, `exists_localFrame`, is a genuine construction.
- 5: integration of top forms and densities, the boundary orientation, and Stokes.
- 6.2: `H⁰ ≅ LocallyConstant`.
- 6.3: the homotopy operator.
- 6.4 and 7: the compactly supported complex, extension by zero, proper pullback, and both Mayer–Vietoris complexes.
- 8.3–8.4: the smooth singular chain complex, smoothing, and integration over simplices and chains. The de Rham homomorphism and the de Rham isomorphism go with them.
- 8.6: the relative comparison.
- 6.1 and 9: the cup product and Poincaré duality.
- 12.4: the Riemannian volume form and density.

The removal follows the dependency closure: a declaration was removed if it mentioned a removed one, either in its statement or in its proof term. The README now refers to each removed name by its mathematics (for example, `` `deRhamHom` `` became `I_dR`, `` `integralTopForm o ω` `` became `∫_M ω`), so every backticked name of this roadmap in the README is declared in `Suggested.lean` (`readme-ids-missing=0`).

**Changed or added statements.**
- The de Rham theorem is kept as `nonempty_deRhamEquiv`: `Nonempty (deRhamCohomology I M k ≃ₗ[ℝ] realSingularCohomology (TopCat.of M) k)`, under the former hypotheses `[T2Space M] [SigmaCompactSpace M] [FiniteDimensional ℝ E]`.
  - The docstring and README 8.5 say that the roadmap's isomorphism is the integration map, which needs integration over smooth simplices (a README target).
  - This is weaker than an isomorphism given by integration, but it is the strongest form statable with no `sorry`'d data.
- `closedForms_wedge_mem` was restated from "the packaged wedge lies in `closedForms`" to `mextDeriv (φ ∧ ψ) = 0`. The same mathematics; the packaged form timed out at `whnf` once `smoothBundleForms` had a real body, and its only consumer (`deRhamCohomology.wedge_mk`) is removed.
- Three Tau Ceti imports were dropped because nothing in the file uses them now: `TwoForm.Closed`, `Riemannian.Pullback` and `MeasureTheory.Function.MetricDerivative`.

**Consequences outside the editable files.** These files import `TauCetiRoadmap.DifferentialGeometry.Suggested` and use removed names, so they will not compile until their owners repair them. This job may not edit them.
- `DifferentialGeometry/SuggestedRelative.lean`: `deRhamHom`, `relativeDeRhamHom`, `relativeDeRhamCoordinates(Zero)`, `smoothChainMap`, `smoothing`, and others.
- `DifferentialGeometry/CompactIntegration/Interface.lean` and `CompactIntegration/RelativeIntegration.lean`: `integralTopForm`, `chainIntegral`, `fullSimplexEquivStdSimplex`, `simplexFace`.
- `ComplexKahlerGeometry/Suggested.lean`: `legacySmoothTwoFormEquiv`.
- `MorseNovikov/Suggested.lean`: `toFlow`.
- `AlgebraicTopology/GeneralModelOrientation.lean`: `Manifold.Orientation.pullback`.
- `AlgebraicTopology/OrientationComparison.lean`: `fullSimplexEquivStdSimplex`.

`SuggestedGreen.lean`, `SuggestedContinuousPaths.lean` and `SymplecticGeometry/ContactGeometry/Suggested.lean` use no removed name.

**Signature check.** No scratch `#check` file was elaborated: the only permitted Lean command is the target build.
- The ten new bodies keep their declared types.
- The only signature changes are:
  - the universe sharing in the `DeRham` section;
  - `closedForms_wedge_mem`;
  - the new `nonempty_deRhamEquiv`, whose binders are the `SmoothChains` section variables it mentions plus its explicit instance arguments.

**Ownership.** No new carrier was introduced. `immersionMetric` was already this roadmap's 12.1 target, and the construction above is a generalization: Tau Ceti's `inducedRiemannianMetric` only handles maps into an inner product space. Ownership against open pull requests was not re-checked this round, because no new object was introduced.

## Adversarial pass on the repair

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| `wedgeWith` body vs `wedgeWith_apply_one_one` | `k = l = 1` | `S₂` sum: `μ(φv₀)(ψv₁) − μ(φv₁)(ψv₀)`, factor `(1!1!)⁻¹ = 1` | agrees, no `½` | — |
| `wedgeWith` body | `k = 2, l = 0` | `½(φ(v₀,v₁) − φ(v₁,v₀))·ψ() = φ(v₀,v₁)ψ()` | no spurious factor | — |
| `wedgeWith` body | `k = l = 0` | `S₀ = {id}`: value `μ(φ())(ψ())` | degree zero is `μ` | — |
| `smoothBundleForms` | zero form; `φ` discontinuous at a point | zero section is `C^∞`; discontinuous `φ` is not `ContMDiff` | member / non-member | — |
| `mextDerivWithin` | model space `E`, chart `id`, `range I = univ` | `mfderiv id = id`, so the value is `extDeriv φ x` | agrees with `mextDeriv_eq_extDeriv` | — |
| `mextDerivWithin` | half-line `[0,∞)`, `x = 0`, `f = t²` | within-derivative on `range I`: `d f(0) = 0`, one-sided | boundary not junk | — |
| `orientationAt` | lift `l` with sign `1`, and its flip | `l ↦ mo`; flip: sign `−1`, so `−(−mo) = mo` | well defined | — |
| `orientationAt` | sign `−1` and its flip | `l ↦ −mo`; flip: sign `1`, so `−mo` | well defined | — |
| `deRhamCohomology.mk` | `k = 0` | `exactForms 0 = ⊥`, so `mk` is injective | consistent with `ker_mk` | — |
| `deRhamCohomology.map` | `f = id`; `g ∘ f` | `mpullback id φ = φ`; homology of `ofHom (mpullbackₗ)` is contravariant | matches `map_id` and the order in `map_comp` | universe sharing |
| `compactlySupportedForms` | `0`; `dx` on `ℝ`; bump `· dx` | `tsupport = ∅`; `ℝ` (not compact); compact | in / out / in | — |
| `immersionMetric` | `f x = (x, x²)`, `ℝ → ℝ²` | `g = 1 + 4x² > 0` | positive | — |
| `immersionMetric` | `f = x³` at `0` | `df₀ = 0` | excluded by `hinj` | — |
| `immersionMetric` | injective compact operator out of `ℓ²` | pulled-back unit ball unbounded | excluded by `[FiniteDimensional ℝ ES]` | — |
| `nonempty_deRhamEquiv` | point; `S¹`; `[0,∞)` | `H⁰ = ℝ`, `Hᵏ = 0` both sides; `H¹ = ℝ` both sides (`dθ`); contractible, `H⁰ = ℝ` both sides | holds | new |
| `nonempty_deRhamEquiv` | infinite-dimensional model | excluded by `[FiniteDimensional ℝ E]` | hypothesis needed | — |
| `closedForms_wedge_mem` (restated) | `k = 0`, `φ = c` constant, `ψ` closed | `d(cψ) = c·dψ = 0` | holds | restated |

## Build
`lake build TauCetiRoadmap.DifferentialGeometry.Suggested`: `Build completed successfully (9109 jobs).` The only warnings are `declaration uses 'sorry'`.

## Gate
`gate DifferentialGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`

The only remaining failure is `depcheck=1`, `NOT IN ORDER: DifferentialGeometry (insert it after its last supplier)`. This is a placement notice, not a direction defect.

Depcheck (`--movable`):
```
depcheck: 148 roadmaps, 999 edges, 0 problem(s)
```
No UPWARD or CYCLE line.
