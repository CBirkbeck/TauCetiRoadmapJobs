# GATE-HyperbolicDynamicsAndThermodynamicFormalism~1: answers to the review of head 5441548

One review (kim-em, 2026-11-19T01:03:36Z), split into 16 points in the order they appear. Repairs
are in commit `842acc3c` on top of `5441548`. Line numbers refer to
`TauCetiRoadmap/HyperbolicDynamicsAndThermodynamicFormalism/README.md` and `Suggested.lean` at
`842acc3c`. Library names were checked at the roadmap's pins (Mathlib `1b1ccf4b`, Tau Ceti
`2fd255d9`, the pins of `lake-manifest.json` and of the README's supplier contracts), not at the
commits the review names (Tau Ceti `91942aa9ff`, Mathlib `048fffa1`).

## H01 (kim-em) — disputed

The roadmap does not add a section on the class of `C^{k,α}` maps between manifolds, with composites, inverses and chart independence: no target here needs that class. §8.7, the only place that uses Hölder regularity of the derivative, now states a local hypothesis on chart representatives (see H02). No roadmap on main or in an open pull request plans `C^{k,α}` maps between manifolds, so none can be named as owner. The nearest are PDE §1.7 (`C^{k,α}(Ω)`, `C^{k,α}_loc(Ω)` on Euclidean open sets), PseudodifferentialOperators §5.4 (`C^{k,α}` sections of a bundle over a compact base) and LorentzianGeometry §2.3 (chartwise `C^{k,α}_loc` metrics); Tau Ceti has `TauCeti.CkHolderSpace` only for maps between normed spaces. The Scope's "Not part of this roadmap" list now names the class (line 942): "the classes C^(k,α) of maps between manifolds and of diffeomorphisms and flows, with their composites, inverses and independence of the charts (§8.7 assumes only that the chart representatives of the derivative are α-Hölder near Λ)".

## H02 (kim-em) — applied

§8.7 (line 642): "a C² diffeomorphism or C² flow (C^(1+α) suffices)" → "a C¹ diffeomorphism or C¹ flow with α-Hölder derivative near Λ". This hypothesis is now defined in the same paragraph: every point z near Λ has a neighbourhood on which the representative of f in the extended charts at z and f z has α-Hölder derivative (Mathlib `HolderOnWith`); for flows the condition is on g^1 and g^(−1); C² is the case α = 1. The route sentence now takes a common Hölder constant from finitely many charts by compactness. The last Check now reads "Hölder only for systems with Hölder derivative, such as the C² flows of Layer 11". The Needs line (651) and the Mathlib contract (`HolderOnWith`) are updated.

## H03 (kim-em) — applied

Downstream consumers (line 929) gains a bullet for Dolgopyat–Kanigowski–Rodriguez-Hertz. It states their theorem (DKRH2024, Theorem 1.1, lines 12–31: a C^(1+α) diffeomorphism preserving a smooth measure and exponentially mixing for C^r observables is Bernoulli) and says that its regularity class, exponential mixing, the Pesin theory of its proof (lines 159–161) and the Bernoulli property are outside this roadmap (Scope). It also says that its examples, skew products over volume-preserving Anosov diffeomorphisms (lines 2043–2054), use §7.1. In the version read (arXiv:2106.03147v1) the main theorem is stated for diffeomorphisms only, so the bullet does not mention flows.

## H04 (kim-em) — applied

The Tsujii–Zhang bullet (line 927) now names the test-function class. Test functions lie in C^β(M), and the estimate for one β > 0 gives it for every β (TsujiiZhang2023, lines 110–121). So some β ∈ (0, 1) suffices, and for such β, C^β(M) is the class of β-Hölder functions for the Riemannian distance (`HolderWith`). The bullet also says that the flows are `IsAnosovFlow` with a dense orbit, that E^s and E^u are lines (§8.6(b)), and that exponential mixing itself is outside the roadmap.

## H05 (kim-em) — applied

§10.1 has a new API item (line 756). For a C¹ Anosov diffeomorphism or flow of a nonempty compact manifold, three conditions are equivalent: transitivity in signed time (equivalently, by Baire, a dense orbit), transitivity in forward time, and being a basic set with Λ = M.

The proof covers each case:
- **Periodic dense orbit:** the orbit is all of M and is also the forward orbit.
- **Otherwise:** finite orbit segments are nowhere dense.
  - For maps, M is infinite, so it has no isolated points.
  - For flows, dim M = 1 forces every orbit to be periodic (§8.6(b)); for dim M ≥ 2, `DifferentiableOn.dense_compl_image_of_dimH_lt_finrank` applies in charts.
- **Conclusion:** long returns plus closing (§6.2/§8.4, §6.6/§8.5) make periodic points dense, and the converse item of §10.1 applies.

The item points to the existing monotone-shift Check as the failure for Λ ≠ M. Conventions (line 24): "it is weaker and is never a hypothesis here" → "it is weaker in general, and it is a hypothesis here only for Anosov systems of a compact manifold, for which the two notions agree (§10.1)". The Needs line (771) adds Layer 8.6, `DifferentiableOn.dense_compl_image_of_dimH_lt_finrank` and `extChartAt`.

## H06 (kim-em) — applied differently

`Suggested.lean` now declares `IsAnosovFlow` (line 383), a C¹ flow (joint `ContMDiff … 1`) for which `univ` is an `IsFlowHyperbolicSet`, so M is compact. The README names it at §7.2 (line 436), "Call a C¹ flow g Anosov (`IsAnosovFlow`)". The new headline of H07 uses it. No `IsAnosovDiffeomorph` is added. For diffeomorphisms the Anosov condition is `IsHyperbolicSet I f univ` with `f : M ≃ₘ^1⟮I, I⟯ M`, whose type already carries C¹, and no diffeomorphism headline on M needs a separate name. The acceptance test admits a definition only where a headline needs it.

## H07 (kim-em) — applied

New headline `existsUnique_isFlowEquilibriumState_of_isAnosovFlow` (`Suggested.lean` line 609; README §10.3, line 787). Its hypotheses: the truncated Riemannian distance on M, `IsAnosovFlow I ϕ`, a dense orbit (the textbook hypothesis of Theorem 96.5 and Tsujii–Zhang, made usable by H05), and `F : C(M, ℝ)` Hölder. Its conclusion: F has exactly one equilibrium state among `ProbabilityMeasure M`. That state is flow-ergodic, positive on nonempty open sets and lower Gibbs at every scale, and it is the equilibrium state of `F + c + Lψ` for every ψ differentiable along the flow with continuous derivative. It needs no restriction to `univ` and no `hinv`. The README sentence "In particular a transitive C¹ Anosov flow … have exactly one equilibrium state" is replaced by this statement.

## H08 (kim-em) — applied differently

The C¹ hypothesis is now part of `IsAnosovFlow`, not of `IsFlowHyperbolicSet`. The junk values of `IsFlowHyperbolicSet` can only do limited harm: if `mfderiv I I (ϕ t) x = 0` at some x ∈ Λ, the invariance clause forces `Es = Eu = ⊥` at `ϕ t x`, and then `T = ℝX` there. So in dimension ≥ 2 the definition already forces every time map to be differentiable at every point of Λ. In dimension 1 a non-C¹ flow can satisfy it (the conjugate of the circle rotation by a differentiable homeomorphism with discontinuous positive derivative, such as x + x² sin(1/x)/4 near 0). That flow fails `IsAnosovFlow`. Every theorem that consumes `IsFlowHyperbolicSet` carries `hϕ : ContMDiff … 1`. The docstring of `IsFlowHyperbolicSet` (line 366) now says so.

## H09 (kim-em) — applied

New §7.2 API item (line 440): the generator of a C^r flow (1 ≤ r ≤ ∞) is a C^(r−1) section of TM. The section x ↦ (x, X(x)) is the composite of x ↦ ((0, x), ∂_t) with the tangent map of (t, x) ↦ g^t x, which is C^(r−1) by Mathlib `ContMDiff.contMDiff_tangentMap` (`Mathlib/Geometry/Manifold/ContMDiffMFDeriv.lean`, line 338). The item says that this continuity is what gives the bounds on |X| over Λ. The name is added to the Needs line (452) and the Mathlib contract.

## H10 (kim-em) — applied

New §7.2 API item (line 441). For a C^r field v on a compact manifold (complete by `TauCeti.isCompleteVectorField_of_compactSpace`), `TauCeti.globalFlow` v is a C^r flow (`TauCeti.contMDiff_globalFlow_uncurry`) with generator v (`TauCeti.isMIntegralCurve_globalFlow`). Conversely, orbits of a C¹ flow are integral curves of its generator. So a C¹ flow with C¹ generator v is `TauCeti.globalFlow` v, by `TauCeti.globalFlow_eq_of_isMIntegralCurve` (`TauCeti/Geometry/Manifold/IntegralCurve/GlobalFlow.lean`, line 136). Hence Layer 11's "C² flow with C² generator" means exactly the flows of C² vector fields. The Tau Ceti contract now lists `globalFlow_eq_of_isMIntegralCurve`.

## H11 (kim-em) — applied

§8.6(b) (line 626) now ends: "and on a compact 3-manifold dim E^s_x = dim E^u_x = 1 at every x, the two dimensions being positive with sum 2".

## H12 (kim-em) — applied

The Scope's "Not part of this roadmap" list (line 942) now includes "the Bernoulli property, isomorphism with a Bernoulli shift, and Ornstein's isomorphism theory". No roadmap on main or in an open pull request plans it: the search for Ornstein / Bernoulli property finds only ClassicalErgodicTheory's Ornstein–Weiss lemma, which is a different result.

## H13 (kim-em) — disputed

The README does not say that the excluded topics are left for a sequel. The house rules for roadmap READMEs require scope to be definite: nothing is "deferred" or "for later". An extension in this roadmap's direction is a separate "HyperbolicDynamicsAndThermodynamicFormalism, Part II", and its own introduction states where this roadmap stops. The "Not part of this roadmap" list already marks the boundary definitely.

## H14 (kim-em) — applied

All six names from the review were added to the Needs lines: `Submodule.orthogonalProjectionOnto` (§8.1, line 539), `Homeomorph.subtype` (§8.4, line 596), `Set.MapsTo.restrict` (§10.2, line 783), `Metric.infDist` (§10.1, line 771; §11.6, line 915), and `Matrix.gram` and `Module.finBasis` (§11.1, line 840).

A script then checked every supplier-contract entry that says which section uses it against that section's Needs line. It found five more gaps, now added:
- `Set.MapsTo.restrict` in §10.4 (line 808).
- `Flow.restrict` in §§8.5, 10.3 and 10.4 (lines 622, 796, 808). The Mathlib contract entry now names those sections.
- `piChartedSpace`, `ModelWithCorners.pi` and `TauCeti.extChartAt_pi` in §9.1 (line 680).
- `TauCeti.Manifold.IsJacobiFieldOn.eq_of_eq_of_alongCurveWithin_eq` in §9.3 (line 718). The connection-map route identifies the variation field with J by uniqueness from initial data.

The reverse check finds every library name in a Needs line in the contracts.

## H15 (kim-em) — disputed

`hinv : IsInvariant ϕ Λ` is the projection `hΛ.2.1.2.1`, so a caller passes it in one term. Since it is a `Prop`, any proof gives the same `ϕ.restrict hinv`. A derived lemma that follows by one projection is exactly what the acceptance test excludes from `Suggested.lean`; it belongs to the library built from the roadmap. The same holds for `hinv` in `hasFlowHyperbolicLocalProductStructure_of_isFlowLocallyMaximal` (`hΛ.2.1`), `pos_coverEntropy_of_isFlowBasicSet` (`hΛ.2.1.2.1`) and `srb_of_isFlowAttractor` (`hΛ.1.2.1.2.1`). For the Anosov case, which consumers use, the new headline of H07 is stated on M and has no such hypothesis.

## H16 (kim-em) — applied

References (line 1051): "DKRH2024 — D. Dolgopyat, A. Kanigowski, F. Rodriguez-Hertz, *Exponential mixing implies Bernoulli*, Ann. of Math. 199 (2024), no. 3, arXiv:2106.03147v1 (locators to this version). Theorem 1.1, Section 10." The text was read from arXiv (open repository) through the sources service. A first request by DOI found no legal PDF and wrote a `[[missing]]` entry to `scratch/needs-references.toml`. That file was deleted after the arXiv text was read, so no reference is outstanding. The roadmap's `sources.toml` is outside this job's files; it needs an entry for `DKRH2024` (arXiv 2106.03147v1, DOI 10.4007/annals.2024.199.3.5, locator scheme theorem, Theorem 1.1, cited for Downstream consumers).

## Adversarial pass on the added and changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §7.2: generator of a C^r flow is C^(r−1) | g^t x = e^t x on ℝ; unit-speed circle rotation; flow of X(x) = \|x\| on ℝ | X(x) = x and X = ∂_θ, both C^∞ from C^∞ flows; for X = \|x\|, g^t x = e^{±t}x has ∂_x g = e^t (x > 0) vs e^{−t} (x < 0), so the flow is not C¹ and the claim says nothing | holds | none |
| §7.2: globalFlow link, both directions | v = ∂_θ on ℝ/ℤ; a C¹ flow with only continuous generator | globalFlow v t θ = θ + t, generator ∂_θ; the converse needs a C¹ generator (`globalFlow` takes a C¹ field), as stated | holds | none |
| §8.6(b): dim E^s = dim E^u = 1 in dimension 3 | cat-map suspension; geodesic flow of a hyperbolic surface; dim E^s = 2, E^u = 0 | eigenlines 1 + 1 (1 + 1 + 1 = 3); horocyclic lines 1 + 1; 2 + 0 is excluded by (b) | holds | none |
| §8.7: α-Hölder derivative hypothesis, θ | f(x) = x + x² (C²); f(x) = x + \|x\|^{3/2}; cat map with α = 1/2 | f′ = 1 + 2x, Lipschitz constant 2 on [−1, 1], so α = 1; f′ = 1 + (3/2)\|x\|^{1/2}sgn x is 1/2-Hölder and not C¹ (old hypothesis excluded it, new admits it); θ = 0.5·0.9624/(0.5·0.9624 + 0.9624) = 1/3 ∈ (0, 1/2); α = 1 gives 1/2 as in the existing Check | holds | statement widened to C¹ with Hölder derivative |
| §10.1: signed ⇔ forward ⇔ basic set Λ = M (Anosov) | cat map; cat-map suspension; unit circle flow (dim 1); swap of 2 points (dim 0); identity of 2 points; 𝕋² ⊔ 𝕋² with the cat map on each; monotone-shift set in a horseshoe (Λ ≠ M); empty M | dense orbit and forward transitive (mixing Haar measure); dense orbit and forward transitive (not mixing); periodic dense orbit = M, forward transitive; one 2-cycle, forward transitive; no dense orbit and f^n{a} ∩ {b} = ∅ for all n ∈ ℤ, both notions false; neither; signed yes and forward no, consistent because Λ ≠ M; excluded by nonemptiness (vacuous signed transitivity, no dense orbit) | holds in all; the Λ ≠ M case is the documented failure | none |
| `IsAnosovFlow` (definition) | C^∞ cat-map suspension; constant vector field flow on 𝕋²; non-C¹ conjugate of the circle rotation (H08) | holds; fails (§7.2 Check: E^s = E^u = 0, dim T = 1 ≠ 2); `IsFlowHyperbolicSet univ` holds with Es = Eu = ⊥ but the C¹ conjunct fails | separates the intended class | new |
| `existsUnique_isFlowEquilibriumState_of_isAnosovFlow` | M empty; unit-speed circle of length 1 with any Hölder F; cat-map suspension with F = 0; F′ = F + 5 + L_gψ; F constant (C = 0) | excluded by `hdense` (∃ x); unique invariant probability = Lebesgue, P = ∫F, lower Gibbs constant C_ε = (2s_ε)e^{−2 max\|F\|} as in §10.3's Check; product of Haar and Lebesgue, entropy log((3+√5)/2) ≈ 0.9624; same equilibrium state, pressure + 5; the unique MME | holds | new |
| `IsFlowHyperbolicSet` docstring | — | text only | — | docstring sentence added |
| TZ observable class | β = 1/2 vs β = 2 | for β < 1, C^β = β-Hölder functions; for β ≥ 1 the class differs, but one β suffices (lines 120–121) | holds | none |

Context check (item 2 of the pass): the new theorem lives in section `BowenRuelle`. Its elaborated type keeps `[FiniteDimensional ℝ E]`, `[IsManifold I ∞ M]`, `[I.Boundaryless]`, `[SigmaCompactSpace M]`, `[MeasurableSpace M]`, `[BorelSpace M]`, `[RiemannianBundle …]` and `[IsContinuousRiemannianBundle …]`. Compactness of M comes from `IsAnosovFlow` (`IsCompact univ`).

## Elaborated signatures

`#check @name` lines for all 52 `def` and `theorem` declarations were appended temporarily to `Suggested.lean` and elaborated in one build of the module, then removed before the final build. The two new declarations, `IsAnosovFlow` and `existsUnique_isFlowEquilibriumState_of_isAnosovFlow`, keep every binder their statements need; their types are quoted in H06 and H07 and match the README.

The nine "looks dropped" leads of `scratch/signatures.md` are all harmless, and nothing was changed because of them:
- `[MeasurableSpace X]` on the non-measure definitions `iteratedPartitionLabel`, `pressureNetSum`, `topologicalPressure`, `flowTopologicalPressure`, `HasBowenProperty`, `IsExpansiveFlow` and `HasFlowBowenProperty`.
- `[UniformSpace X]` on `pressureNetSum`, which takes an arbitrary relation `U`.
- `[FiniteDimensional ℝ V]` on `hadamardPerronGraph`.
- `[FiniteDimensional ℝ E]` on `flowUnstableSubspace`, a span.

## Ownership

`IsAnosovFlow` and the Anosov-flow headline are this roadmap's. A search of main and the open roadmap pull requests for `IsAnosov` and "Anosov flow" finds only ClassicalErgodicTheory's Downstream consumers, which hands "a roadmap on uniformly hyperbolic dynamics" the Bowen–Ruelle theorem for transitive Anosov flows. The new name lives in this roadmap's namespace and clashes with no declaration in a readable roadmap.

The generator facts of §7.2 are API items on this roadmap's own `flowGenerator`. They cite Tau Ceti and Mathlib and restate nothing those libraries prove: Tau Ceti has no statement about generators of arbitrary C¹ flows.

## Dependency check

```
depcheck: 199 roadmaps, 2188 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

## Build and gate

`lake build TauCetiRoadmap.HyperbolicDynamicsAndThermodynamicFormalism.Suggested` at `842acc3c`: Build completed successfully (18284 jobs). There are 16 warnings, all "declaration uses `sorry`", one per theorem.

Gate (`--base origin/main`) at `842acc3c`:

```
gate HyperbolicDynamicsAndThermodynamicFormalism: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

`roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. That tool does not check names outside TauCetiRoadmap on this host. Every library name added here was checked at the pins by hand (file and line given above, or the contract file).
