# Review of StokesReciprocity (pull request #3049 at 36462c9)

**Verdict:** accepted

**Summary.** Accepted: no finding. The previous round's one finding and its small corrections are repaired, every identity, sign convention and worked example I recomputed is correct, the ten sorried statements are true as written (including the new general-domain reciprocity on `WithLp 2 (ℝ × E)`), and all supplier citations resolve on main and at the pins. There are three small corrections and two format notes, none blocking. The two cited books could not be read legally, so their four locators are unverified, and the scope question is left to the human reviewers.

## C01 — The dissipation and general boundary-work identities are stated in `Suggested.lean` on boxes only, although their Lipschitz-domain forms are statable with the definitions already in the file

The summary of the README states "Work and dissipation" with `∫Ω`, and Layer 5 lists the general boundary-work identity and the dissipation identity on `Ω` as targets, but the Lean file states them only as `box_boundary_work` and `box_dissipation`; the module docstring (lines 23–25) says the Layer 5 forms are "the statements of Layers 3–4 with `domainBoundaryWork` in place of `boxBoundaryWork`". That is not literally so: the box statements use `contraction`, `symGradientMatrix` and `velocityGradient` on `Fin d → ℝ`, none of which exists on `WithLp 2 (ℝ × E)`. The domain forms are statable at the pins: with `S u x = (fderiv ℝ u x + adjoint (fderiv ℝ u x))/2` and `e(u):e(v) = LinearMap.trace ℝ X (adjoint (S u x) ∘L S v x)`, the general identity reads `domainBoundaryWork Ω μ v u p + ∫ x in Ω, ⟪v x, f x⟫ = ∫ x in Ω, (2 * μ * e(u):e(v) − p x * divergence v x)`. I do not hold this as blocking, since each headline is stated in one of its two settings and `domain_reciprocity` already tests the Layer 5 machinery. Either add that one statement (dissipation is its case `v = u`), or reword the docstring sentence to say that the domain forms use the coordinate-free strain contraction, which the file does not define.

## C02 — Worked example 3 asks for nonnegative dissipation without the sign of `μ`

Example 3 (line 259) says "verify that dissipation is nonnegative" for planar shear with no condition on `μ`. For `u = γ x₂ e₁` the dissipation is `2μ ∫ e(u):e(u) = μ γ² |Q|`, which is negative for `μ < 0`; the conventions (line 63) and example 6 both carry `μ ≥ 0`. Add "when `μ ≥ 0`".

## C03 — The pull request's description describes an earlier head

The description speaks of "S1–S4" and "S5", says "`Suggested.lean` shows a subset of the interfaces" and "It contains six intentional `sorry`s", and "There has been no independent review yet". At this head the layers are Layer 1 to Layer 5, the file states the headline theorems of all five layers (general-domain reciprocity included), and it has ten `sorry`s. Text that would be right: "Layers 1–4: stress and contraction algebra, differential identities, box boundary work and Lorentz reciprocity, box dissipation and the boundary-response matrix, on Mathlib alone. Layer 5: the same results on bounded Lipschitz domains, from PDE §1.6 and GeometricMeasureTheory §6.1–§6.2. `Suggested.lean` states the headline theorems of each layer; its ten `sorry`s are targets."

## N01 — The layers have no numbered subsections and no dependency lines

Each layer is continuous prose with no `### k.n` subsections and no `*Needs:*` lines, so tools that count and sample targets find none, and a reader must infer from the summary and the supplier contracts which target needs which supplier (only "Layer 5 only" and "Layers 3–4 use…" say so). Subsections such as `### 3.1 Boundary work on a box`, `### 3.2 Lorentz reciprocity`, each ending with its needs, would fix both.

## N02 — "Layer k is complete with …" in the scope section reads as a progress report

Lines 294–299 ("Layers 1–2 are complete with their definitions …") are meant as the criterion for a layer to count as done, but read as a statement that the work is done. "Layer k is not complete without …" would be unambiguous.

## Verified sound

Earlier findings at this head: R01 repaired (`box_dissipation`, `boxResponseMatrix_isSymm`, `boxResponseMatrix_quadratic`, `boxResponseMatrix_posSemidef` and `domain_reciprocity` are stated; README line 30 now says the file "states the headline theorems"). C01 repaired (Layer 4, line 190: "For an incompressible solution `(u,p)` with force `f`", and line 198 gives the term `− p div u`; Layer 2, line 130, likewise). C02 repaired (`contraction_eq_sum` is marked "sanity check, not a target"). C03 repaired (line 309–311 names both Mathlib files). N01–N03 repaired (single `import Mathlib` plus two Tau Ceti modules, namespace `TauCetiRoadmap.StokesReciprocity`, docstrings; locators at the claims; "§1.6 (A6)").

The worker's seeded sample named no target (the README has no numbered targets, N01), so the table covers every sorried statement and every displayed identity and example.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `reciprocal_contraction` | general `A,B`; `d=0` | LHS `−p trB + q trA + μΣ(AᵢⱼBᵢⱼ+AⱼᵢBᵢⱼ−BᵢⱼAᵢⱼ−BⱼᵢAᵢⱼ)`, last sum 0; `d=0`: `0=0`; one-tactic probe fails | true, not padding | none |
| `dissipation_contraction` | `A=E₁₂` | LHS `μ(A:A + Aᵀ:A) = μ`; RHS `2μ·½ = μ`; probe fails | true | none |
| `contraction_eq_sum` | proved in file | `tr(AᵀB)=ΣᵢΣⱼAⱼᵢBⱼᵢ` | marked sanity check | none |
| Bridge `Div σ = −∇p + μΔu + μ∇div u` | components | `Σⱼ∂ⱼ(−pδᵢⱼ+μ(∂ⱼuᵢ+∂ᵢuⱼ)) = −∂ᵢp+μΔuᵢ+μ∂ᵢ div u` | true for `C²` | none |
| `local_reciprocity`, `div J` formula | product rule | `div(σᵀv)=v·Divσ+σ:Dv`, `σ(u,p):Dv=−p div v+2μe(u):e(v)`; difference `u·g−v·f` when both divergences vanish at `x` | true | none |
| Single-flow identity (Layer 2) | `v=u` | `div(σᵀu)=−u·f+2μe(u):e(u)−p div u` | true | none |
| `boxBoundaryWork` vs Mathlib box theorem | faces, signs | same `insertNth (b i)`/`insertNth (a i)` over `Icc (a∘succAbove) (b∘succAbove)`; `+` front, `−` back; integrand `Σⱼvⱼσⱼᵢ=v·σeᵢ` | matches | none |
| `box_boundary_work` | example 4 with `v=e₁`; `u=x,p=1,μ=0,f=0,v=u` | Ex. 4: `B=2μ|Q|`, `∫v·f=−2μ|Q|`, RHS 0. Second: LHS `−d|Q|`, RHS `−d|Q|` | true | none |
| `box_reciprocity` | example 4; `n=0`; `aᵢ>bᵢ` | Ex. 4 both sides 0; `n=0`: each side `−v(p(b)−p(a))+v∫p'=0`; reversed interval: `B≠0`, volume 0, so `hab` needed | true | none |
| `box_dissipation` | `u=x₂e₁,p=0,f=0`; non-incompressible `u=x` | `B=μ|Q|`, RHS `2μ·½|Q|`; `u=x,p=1,μ=0`: LHS `−d|Q|`≠0, excluded by `hu0` | true | none |
| `boxResponseMatrix_isSymm` | example 6 | `Rₐᵦ=B(uₐ;uᵦ,pᵦ)`, zero-force reciprocity gives `Rₐᵦ=Rᵦₐ`; Ex. 6: `R=μ|Q|[[1,1],[1,1]]` | true, any real `μ` | none |
| `boxResponseMatrix_quadratic` | `c=(1,1)`, `c=(1,−1)` in example 6 | `cᵀRc=4μ|Q|`, `2μ∫e(w):e(w)=2μ·2|Q|`; `(1,−1)`: 0 both sides (rigid rotation) | true | none |
| `boxResponseMatrix_posSemidef` | `μ<0` | quadratic form `2μ∫e:e ≤ 0` for `μ<0`, so `hμ` needed; `≥0` for `μ≥0` | true | none |
| Congruence `CᵀRC` (Layer 4) | example 6 | `C=[[1,1],[1,−1]]`: `CᵀRC=μ|Q|diag(4,0)`; direct `B(ũ₁;ũ₁)=4μ|Q|` | true | none |
| `domain_reciprocity` | `E=0` (`d=1`), interval; ball | `μHE[0]` counting measure, normals `±1`: each side `−v(p(b)−p(a))+v(p(b)−p(a))=0`; `IsLipschitzDomainWith` includes `IsOpen` | true | none |
| `(Div σ)·a = div(σa)` (Layer 5) | symmetric `σ` | `Σⱼ∂ⱼ(Σᵢσⱼᵢaᵢ)=Σᵢaᵢ Σⱼ∂ⱼσᵢⱼ` using `σⱼᵢ=σᵢⱼ` | true | none |
| `domainBoundaryWork`, normal and measure | supplier definitions | `outerNormal volume ⊤ Ω` is minus the polar density of `Dχ_Ω`; GMT §6.2 gives outward normal and `|Dχ_Ω|=Hᵈ⁻¹⌊∂Ω`; `μHE[d]=volume` in dimension `d` | intended object | none |
| Example 5 (ball, annulus) | sphere moments | `∫_{S_R}xᵢ²dS=R|B_R|`; outer `2μ·2R|B_R|/R=4μ|B_R|`, inner `−4μ|B_r|`, sum `4μ|Ω|=2μ·2|Ω|` | true | none |
| Example 3 (shear) | `μ<0` | dissipation `μγ²|Q|<0` | needs `μ≥0` | C02 |
| Example 4 force | `u=(x₂²,0,…)` | `Div σ=μΔu=(2μ,0,…)`, so `f=(−2μ,0,…)` | true | none |
| Pressure-shift invariance (Layer 3) | `p→p+c` | `B` changes by `−c∫_{∂Q}v·n=−c∫div v` | true for incompressible `v` | none |
| Orthogonal covariance (Layers 1, 2) | `A↦OAOᵀ` | `σ↦OσOᵀ`, `σn↦Oσn`, `tr((OAOᵀ)ᵀOBOᵀ)=tr(AᵀB)` | true, reflections included | none |
| Layer 5 domain forms in the Lean file | carriers | `contraction`, `symGradientMatrix` live on `Fin d → ℝ`; no strain contraction on `WithLp 2 (ℝ × E)` | statable, not stated | C01 |

- Source locators checked against the text: 0 of 4 (neither book readable legally).
- Library declarations opened at the pin: 12 (`Set.IsLipschitzDomainWith` LipschitzDomain/Basic.lean:482; `TauCeti.isLipschitzDomainWith_of_contDiffAt` LipschitzDomain/ContDiff.lean:78; `TauCeti.reducedBoundary`, `TauCeti.outerNormal`, `TauCeti.integral_trace_fderiv_mul_indicator_eq_integral_inner_outerNormal` BoundedVariation/ReducedBoundary.lean:95, 106, 271; `MeasureTheory.Measure.euclideanHausdorffMeasure` Geometry/Euclidean/Volume/Measure.lean:68; `integral_divergence_of_hasFDerivAt_off_countable` DivergenceTheorem.lean:267; `PiLp.continuousLinearEquiv` PiLp.lean:1152; `PiLp.volume_preserving_ofLp`/`toLp` Haar/InnerProductSpace.lean:134, 139; `gradient` Gradient/Basic.lean:83; `Matrix.PosSemidef` PosDef.lean:62).
- Cross-roadmap citations resolved: 4 (GeometricMeasureTheory Layer 6, §6.1, §6.2; PDE §1.6 (A6)), all on main, each stating what the supplier contract says of it.
- Dependency check: `depcheck: 17 roadmaps, 205 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates with ten `sorry` warnings and nothing else; the 25 elaborated signatures were compared with the README. Two definitions (`divergence`, `stressField`) drop measurability binders their types do not mention, which their statements do not need; no theorem lost a hypothesis.
- One-tactic probe on a copy: none of the ten sorried theorems closes by `rfl` or `simp` with the definitions unfolded.
- Duplication: no stress, traction, strain or reciprocity object in the pinned Mathlib or Tau Ceti; Tau Ceti's flat Gauss–Green uses the same trace-of-`fderiv` divergence as Layer 5.
- Overlap check: read IncompressibleFlows, IncompressibleFluids, QuaternionicAnalysis, GeometricMeasureTheory, SobolevDifferentialForms; nothing shared (the first two are evolution theory on the whole space or torus without stress or boundary work; GeometricMeasureTheory and PDE are cited suppliers; LocalVariationalFieldTheory's stress tensor is the field-theoretic one).

Source independence: 0 passages compared with 0 sources (neither book could be read legally); largest share Kim–Karrila, 3 of 4 locators; its contents not read, but by the README's own locators dissipation (§2.2) precedes reciprocity (§2.3) there, the reverse of Layers 3–4, and Layers 1, 2 and 5 have no cited counterpart.

Research link: The Lorentz reciprocal theorem and the dissipation identity of Stokes flow, as cited from Kim–Karrila 1991 (§2.2–§2.3) and Happel–Brenner 1983 (§3-5), which the README says give the context of resistance and mobility relations (Kim–Karrila, Chapter 5); rests on the README's reference list only.

## Not verifiable

- Kim and Karrila, *Microhydrodynamics* (1991), §1.2, §2.2, §2.3: no legal copy found through the sources service.
- Happel and Brenner, *Low Reynolds Number Hydrodynamics* (1983), §3-5, p. 85: the publisher's pages are classed as paywalled and were not fetched.
- The description's claim that a repository script validates 107 roadmap entries was not run.
- Ownership against open pull requests was checked by searching their heads for the objects (stress, traction, reciprocity, Stokes flow) and reading the two closest, not by reading each.

## Source issues

- none

## For the human reviewers

- Scope: the headline results are classical textbook identities of low-Reynolds-number hydrodynamics; the only sources are two textbooks (1983, 1991), and Layers 1–4 are calculus identities on a box. Whether this is in scope is yours to decide.
- Not tested: Kim–Karrila carries three of the four locators; neither its text nor its contents page could be read, so wording and arrangement were not compared with it.
- The description states that the README and `Suggested.lean` were drafted by an AI system.
