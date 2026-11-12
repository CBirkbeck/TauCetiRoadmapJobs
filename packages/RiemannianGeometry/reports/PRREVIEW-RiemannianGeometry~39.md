# Review of RiemannianGeometry (pull request #2224 at c6b1b05)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: README:2229–2231 "smooth where `sW_w(t)` lies in `expDomain` by `TauCeti.Manifold.contMDiffOn_riemannianExp_tangentBundle`"; :2255 "`TauCeti.curvatureCosine κ ℓ / TauCeti.curvatureSine κ ℓ`"; :2277–2280 `hasDerivAt_energy`; *Needs:* :2350–2361 and Layer 4 Dependencies :3027 updated. None of the three missing names remains.
- R02 — repaired: `Suggested.lean:307` states `exists_upper_barrier_laplaceBeltrami_le` as proposed; the docstring lists it at :39; README:2261–2264 names it as the headline.
- R03 — repaired: README:486–514, a paragraph naming all nine declarations with their files and hypotheses, plus `hasDerivAt_curvatureSine` and `IsNormalDomain.contMDiffOn_riemannianLog`.
- R04 — repaired: R3 now owns the free-endpoint length formula (README:1569–1578). R4.1 cites it at :2286 "Apply R3's second variation of length with free endpoints", and the *Needs:* entry is "R3 (second variation of length with free endpoints; bulk index integral)".
- R05 — repaired: README:2301–2309 "Proposition B.1 and its proof, pp. 15–16, with constant weight and N=n … the constant written κ≥0 there is √k", with Wei §3 cited for every real κ; references at :4347–4360.
- R06 — repaired: the description's **Suppliers.** paragraph now names only pinned declarations plus SmoothBundlesConnections B5.0. Its **Edits.** paragraph lists the R3 formula, the contract paragraph, the Layer 4 sentence, Lynch and Wei, and the new headline.

## Verified sound

| Statement | Instance | Left side (computed) | Right side (computed) | Result |
|---|---|---|---|---|
| `exists_upper_barrier_laplaceBeltrami_le` | ℝ², κ=0, ℓ=2, f=\|x\| | Δ\|x\|(p̄)=(n−1)/ℓ=0.5 | 1·(curvatureCosine 0 2 / curvatureSine 0 2)=1/2 | equality, holds |
| same | hyperbolic plane, κ=−1, ℓ=1 | Δ dist(p,·)=coth 1=1.3130 | cosh 1/sinh 1=1.5431/1.1752=1.3130 | equality, holds |
| same | unit S², κ=1, ℓ=3π/4 | dist smooth, Δdist=−1, so every barrier has Δf≥−1 | cos(3π/4)/sin(3π/4)=−1 | equality forced, holds |
| same, n=1 (no n≥2 in Lean) | ℝ, γ(t)=t, κ=1, ℓ=1 | hRic: 0·1≤0; f(x)=x, Δf=0 | 0·cot 1=0 | holds |
| same, n=0 | E=0 | ‖v‖=0≠1, so `hunit` is unsatisfiable | — | vacuous only in dimension 0 |
| same, guard `hmodel` | unit S², κ=1, ℓ=π | curvatureSine 1 π=0, so the right side is the junk value 0 | f≡π≥dist, Δf=0 | excluded by the guard; true anyway |
| same, non-triviality | ℝ², f≡ℓ | dist(0,x)>ℓ just beyond p̄ | f≥dist fails | constant barrier refused; content is the comparison |
| same, one-tactic probe | `simp` in scratch copy | "`simp` made no progress" | — | not padding |
| R3 free-endpoint L″ (README:1573) | ℝ², Γ=((1+s²/ℓ)t,0), ℓ=2 | L=2+s², L″=2 | V=0; ⟨A,γ′⟩\|₀^ℓ=2−0=2 | agrees |
| same | unit S², equator, Γ_s at latitude s | L=ℓ cos s, L″=−ℓ | ∫(0−1)dt=−ℓ; A=0 (meridians geodesic) | agrees |
| "energy formula minus ∫⟨D_tV,γ′⟩²" | ℝ², Γ=((1+s)t,0) | L=ℓ(1+s), L″=0 | E″−∫1dt=ℓ−ℓ=0 | agrees |
| R4.1 gradient: L′(0)=E′(0) at unit speed | Γ=((1+s)t,0); then speed 2 | L′=ℓ; L′=2ℓ | E′=ℓ; E′=4ℓ | equal only at unit speed, which is stated |
| `hasDerivAt_energy` at W_w | W_w(ℓ)=w, W_w(0)=0, D_tγ′=0 | ⟨w,γ′(ℓ)⟩−0−0 | grad r̃(p̄)=γ′(ℓ) | agrees |
| Hessian with A=0 (README:2287–2290) | ℝⁿ, w⊥p̄, f=t/ℓ | Hess\|x\|(w,w)=\|w\|²/ℓ | ∫₀^ℓ\|w\|²/ℓ² dt=\|w\|²/ℓ | agrees |
| s_κ′/s_κ = curvatureCosine/curvatureSine | κ=4, ℓ=0.5 | cos 1/(sin 1/2)=1.2842 | 2 cot 1=1.2842 | agrees (Curvature.lean:89) |
| Lynch Prop. B.1, p. 15; proof p. 16 | his κ=√k, k=4 | Ric≥−(n−1)·4; Δr≤(n−1)·2coth(2r) | README: Ric≥−(n−1)k; (n−1)√k coth(√k r) | agrees; N=n allowed for constant ψ |
| Wei (3.1) p. 3; Lemma 3.4, Thm 3.6 p. 4 | unit Sⁿ, H=1 | Δr=(n−1)cot r off the cut locus | Δ_H r=(n−1)cot r | locators correct; complete manifolds, as stated |
| Contract: `hessian`, `ricciTensor_eq_sum_inner` | Laplacian.lean:135; Ricci.lean:88 | ⟨∇_v grad f,w⟩; Σ⟨b_i,R(b_i,u)v⟩ | README:496–502, same formulas | agree |
| Contract: `inner_eq_of_alongCurveWithin_eq_zero` | AlongCurve/Metric.lean:476 | UniqueDiffOn, IsPreconnected, MDifferentiableOn, both fields parallel | README:503–506 | agrees |

The rows for untouched statements, including the seeded sample 1.1–2.3 (no change in the diff), stand as in the previous review of 55c157f.

- Source locators checked against the text: 4. Lynch, arXiv:2611.12758v1: Prop. B.1 p. 15 and its proof p. 16, read on the rendered page because the OCR confuses k and κ. Wei, `wei-ricci-lower-bound` lines 101–103, 144–145, 166–169.
- Pinned Tau Ceti 2fd255d, declarations opened: `Normal/Basic.lean:163, 225, 258`, `Exponential.lean:185, 193, 320`, `Laplacian.lean:135, 238, 601`, `MaximumPrinciple.lean:75, 82`, `Curvature/Ricci.lean:88`, `AlongCurve/Metric.lean:476`, `FirstVariation.lean:212`, `Trigonometric/Curvature.lean:40, 45, 89`, `Geodesic/Basic.lean:102`, `MFDeriv/Curve.lean:135`. All resolve. No parallel-transport declaration exists at the pin, which matches the description.
- Gate: every check passed, both the worker's run (build=0) and this review's run. Dependency check: `depcheck: 206 roadmaps, 1912 edges, 0 problem(s)`.
- Elaboration: `lake env lean Suggested.lean` gives 24 `sorry` warnings and nothing else. `#check @exists_upper_barrier_laplaceBeltrami_le` carries `FiniteDimensional`, `Boundaryless`, `MetricSpace`, `IsManifold ∞`, a smooth metric and `IsRiemannianManifold`, and matches README:2261–2264.
- Description against head: the change from main is five README hunks plus the docstring and theorem in `Suggested.lean`, exactly as **Edits.** lists. **Suppliers.**, **What the block owns.** and **Note for reviewers.** agree with the head. Nothing outside the folder is changed.
- Overlap check: read the scope of MinimalSurfaces (open), LorentzianGeometry (open) and PositiveMass (main), and grepped all of main and the open heads for upper barriers, barrier-sense comparisons, length second variation and Laplacian comparison (Surfaces, ManifoldOptimization, DGFloerPartII and RicciFlow have no hits). Owners:
  - smooth upper distance barrier: RiemannianGeometry R4.1 (MinimalSurfaces cites it);
  - free-endpoint second variation of length: RiemannianGeometry R3 (MinimalSurfaces 11.1 states the submanifold-endpoint form; LorentzianGeometry Layer 4 generalizes only the energy variations and matches R2–R3);
  - parallel transport: SmoothBundlesConnections B5.0.
- Remarks:
  - The R4.1 block assumes n≥2, while the Lean statement has no dimension bound. This is harmless: n=1 holds (row 4) and n=0 is vacuous.
  - The *Needs:* entry at :2350 names a subset of the Tau Ceti inputs, and the contract paragraph it points to names the rest.
  - Lynch is not yet in the package's `sources.toml`.

## Not verifiable

- `milnor-morse-theory` and `oneill-submersion`: settled as uncertified; the diff does not touch the passages that cite them.

## Source issues

- none
