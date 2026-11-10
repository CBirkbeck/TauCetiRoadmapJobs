# Review of OptimalTransport (pull request #950 at 51115d5)

**Verdict:** needs changes

This is a full review: the folder changed by 362 lines since `8e44152`. Both findings of the previous review are repaired, and the seven new statements in `Suggested.lean` are correct on their carriers. What remains:

- Four headline theorems that can be stated at the pins are stated nowhere (R01, R02).
- Two sampled targets restate theorems the pin proves (R03).
- Layer 16.1 prescribes namespaces the implementation does not use (R04).
- One sentence of the docstring understates Mathlib (R05).

## R01 (P2) — 14.8's essentially non-branching `MCP(K,N)` theorem is statable at the pins, but the docstring files all of 14.8 as not statable

**Location.** `TauCetiRoadmap/OptimalTransport/Suggested.lean:101–103`: "The Gigli–Rajala–Sturm optimal-map theorem (Layer 14.8) needs the `RCD*(K,N)` condition … neither library has a curvature-dimension condition with finite `N`." `README.md:5258–5260` (14.8): "For `1 < N < ∞`, separately add the essentially nonbranching `MCP(K,N)` version, with its boundedly-finite/full-support reference, moment, and source-absolute-continuity hypotheses all visible."

**Claim.** The nonsmooth optimal-map headline of 14.8, the named completion target "nonsmooth map-induced optimal transport", cannot be stated at the pins.

**Witness.** The pin has `TauCeti.MetricMeasureSpace.MeasureContraction` (`TauCeti/MeasureTheory/OptimalTransport/MetricMeasure/MeasureContraction.lean:104`) and `TauCeti.MetricMeasureSpace.EssentiallyNonbranching` (`…/MetricMeasure/Nonbranching.lean:60`). 14.2 already lists both. Cavalletti–Mondino, arXiv:1609.00782, Theorem 1.1 (p. 2), needs nothing else.

**Repair.** Add the following under `/-! ## Layer 14 … -/`, after the `RCD(K,∞)` theorem, and import `TauCeti.MeasureTheory.OptimalTransport.MetricMeasure.MeasureContraction` and `TauCeti.MeasureTheory.OptimalTransport.MetricMeasure.Nonbranching`. The draft elaborates at the pins with `sorry` as its only warning, once the targeted build has built those two modules (neither olean was built before):

```lean
/-- **Optimal maps on essentially nonbranching `MCP(K, N)` spaces** (Cavalletti–Mondino,
arXiv:1609.00782, Theorem 1.1, p. 2). On a proper metric-measure space with full support that is
essentially nonbranching and satisfies `MCP(K, N)` for some `1 < N < ∞`, the quadratic optimal
coupling from a law absolutely continuous with respect to the reference measure to any law of
finite second moment is unique and induced by a map. -/
theorem exists_isKantorovichOptimalTransportMap_of_measureContraction
    {X : Type*} [MetricSpace X] [MeasurableSpace X] [CompleteSpace X]
    [SecondCountableTopology X] [BorelSpace X] [ProperSpace X]
    (M : TauCeti.MetricMeasureSpace X) (hsupp : M.support = univ) {K N : ℝ} (hN : 1 < N)
    (hMCP : M.MeasureContraction K N) (hENB : M.EssentiallyNonbranching)
    (μ ν : Measure X) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    (hμ2 : TauCeti.HasFiniteMoment 2 μ) (hν2 : TauCeti.HasFiniteMoment 2 ν)
    (hμ : μ ≪ M.reference) :
    ∃ T : X → X, TauCeti.IsKantorovichOptimalTransportMap (fun z => edist z.1 z.2 ^ 2) μ ν T ∧
      ∀ γ, TauCeti.IsOptimalCoupling (fun z => edist z.1 z.2 ^ 2) γ μ ν ↔
        γ = μ.map fun x => (x, T x) := by
  sorry
```

Name the theorem in 14.8 where the `MCP(K,N)` version is stated. Cite Cavalletti–Mondino Theorem 1.1, whose standing assumptions (a proper complete separable space and a reference measure finite on bounded sets) are on p. 2. Then narrow the docstring entry to the `RCD*(K,N)` form: that form needs a finite-`N` curvature-dimension condition, which neither library has, and it is contained in the stated theorem, because `RCD*(K,N)` spaces are essentially nonbranching `MCP(K,N)` spaces.

**Check.** The full-support hypothesis cannot be dropped. Take `X = [0,1] × {0} ∪ {p, q} ⊆ ℝ²` with `p = (1/2, 1)`, `q = (1/2, -1)`, and `m` Lebesgue measure on the segment.
- Tau Ceti's `MCP(0,N)` (for every `N ≥ 1`, so also with `1 < N`) and essential non-branching hold, since both only see geodesics inside `supp m`. For `N = 2`, the weight `τ_{0,2}^{(1−t)}(θ)² = (1−t)²` is at most the `1−t` that the one-dimensional contraction needs.
- From `μ = m` to `ν = (δ_p + δ_q)/2`, every coupling costs `∫(x - 1/2)² dx + 1`, so the product coupling is optimal and is not a graph.

Add this as a negative-control Check in 14.8.

## R02 (P2) — three more statable headlines appear neither in `Suggested.lean` nor in the docstring's two lists

**Location.** `Suggested.lean:50–103` (the two lists) and the description: "Its docstring sorts every other headline of the README into two lists." Absent are:
- `README.md:4182` (11.8): "for `m>1` prove the porous-medium flow". The named completion target is "the Wasserstein JKO constructions for heat, Fokker–Planck, and nonlinear diffusion".
- `:3096` (7.7): "Prove De Philippis--Figalli's Riemannian theorem".
- `:2536–2537` (6.4): "there is a unique convex `u ∈ C(cl Ω)` with `MA_u = μ`".

**Claim.** Every other headline of the README is either proved at the pin or not statable there.

**Witness.** The pin has no porous-medium, Riemannian partial-regularity or Dirichlet-existence theorem. Of 6.4 it has only the uniqueness half (`TauCeti.eqOn_of_mongeAmpereMeasure_eq_of_eqOn_frontier`, `TauCeti/Analysis/Convex/MongeAmpere/Comparison.lean:239`). Each draft below elaborates at the pins with `sorry` as its only warning.

**Repair.** State the three theorems under the existing section comments for Layers 6, 7 and 11, in README order. Add `TauCeti.Analysis.Convex.MongeAmpere.Basic` to the imports; the others are already there. Name each theorem in its subsection, and correct the description's sentence.

```lean
/-- **The porous-medium and fast-diffusion equations as Wasserstein gradient flows**
(Ambrosio–Gigli, *A user's guide to optimal transport*, Theorem 3.35, p. 74, and Proposition
3.38, p. 75). For `1 < m`, or `max (1 - 1/n) (n/(n+2)) < m < 1`, every `EVI_0` solution in
`P₂(ℝⁿ)` of `μ ↦ ∫ U_m(ρ) dx`, `U_m(r) = r^m / (m - 1)`, solves `∂ₜρ = Δ(ρ^m)` in distributions
on `(0, ∞) × ℝⁿ`. -/
theorem integral_porousMedium_eq_zero_of_isEVISolution {n : ℕ} {m : ℝ}
    (hm : 1 < m ∨ (max (1 - 1 / (n : ℝ)) ((n : ℝ) / (n + 2)) < m ∧ m < 1))
    {u : ℝ → TauCeti.WassersteinSpace 2 (EuclideanSpace ℝ (Fin n))}
    (hu : TauCeti.IsEVISolution 0
      (fun μ : TauCeti.WassersteinSpace 2 (EuclideanSpace ℝ (Fin n)) =>
        TauCeti.internalEnergy (fun r => r ^ m / (m - 1)) volume
          ((μ : ProbabilityMeasure (EuclideanSpace ℝ (Fin n))) :
            Measure (EuclideanSpace ℝ (Fin n)))) u)
    (ζ : ℝ × EuclideanSpace ℝ (Fin n) → ℝ) (hζ : ContDiff ℝ (⊤ : ℕ∞) ζ)
    (hζ_supp : HasCompactSupport ζ) (hζ_pos : tsupport ζ ⊆ Ioi 0 ×ˢ univ) :
    ∫ t in Ioi (0 : ℝ), ∫ x,
      (deriv (fun s => ζ (s, x)) t *
          (((u t : ProbabilityMeasure (EuclideanSpace ℝ (Fin n))) :
            Measure (EuclideanSpace ℝ (Fin n))).rnDeriv volume x).toReal +
        (((u t : ProbabilityMeasure (EuclideanSpace ℝ (Fin n))) :
            Measure (EuclideanSpace ℝ (Fin n))).rnDeriv volume x).toReal ^ m *
          Laplacian.laplacian (fun y => ζ (t, y)) x) = 0 := by
  sorry

/-- **Riemannian partial regularity** (De Philippis–Figalli 2015, Theorem 1.4, p. 82). -/
theorem exists_homeomorph_holderOnWith_riemannian
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
    {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
    {M : Type*} [EMetricSpace M] [ChartedSpace H M] [IsManifold I (⊤ : ℕ∞) M]
    [MeasurableSpace M] [BorelSpace M] [SecondCountableTopology M]
    [Bundle.RiemannianBundle (fun x : M ↦ TangentSpace I x)]
    [IsContMDiffRiemannianBundle I (⊤ : ℕ∞) E (fun x : M ↦ TangentSpace I x)]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]
    [IsRiemannianManifold I M] [ConnectedSpace M] [CompleteSpace M]
    {f g : M → ℝ} (hf : Continuous f) (hg : Continuous g)
    (hfl : ∀ K, IsCompact K → ∃ l : ℝ, 0 < l ∧ ∀ x ∈ K, l ≤ f x ∧ f x ≤ l⁻¹)
    (hgl : ∀ K, IsCompact K → ∃ l : ℝ, 0 < l ∧ ∀ y ∈ K, l ≤ g y ∧ g y ≤ l⁻¹)
    [IsProbabilityMeasure ((TauCeti.riemannianVolume I M).withDensity fun x => ENNReal.ofReal (f x))]
    [IsProbabilityMeasure ((TauCeti.riemannianVolume I M).withDensity fun y => ENNReal.ofReal (g y))]
    (hμ2 : TauCeti.HasFiniteMoment 2
      ((TauCeti.riemannianVolume I M).withDensity fun x => ENNReal.ofReal (f x)))
    (hν2 : TauCeti.HasFiniteMoment 2
      ((TauCeti.riemannianVolume I M).withDensity fun y => ENNReal.ofReal (g y)))
    {T : M → M}
    (hT : TauCeti.IsKantorovichOptimalTransportMap (fun z => edist z.1 z.2 ^ 2 / 2)
      ((TauCeti.riemannianVolume I M).withDensity fun x => ENNReal.ofReal (f x))
      ((TauCeti.riemannianVolume I M).withDensity fun y => ENNReal.ofReal (g y)) T) :
    ∃ SX SY : Set M, IsClosed SX ∧ IsClosed SY ∧
      TauCeti.riemannianVolume I M SX = 0 ∧ TauCeti.riemannianVolume I M SY = 0 ∧
      ∃ h : ↥(SXᶜ) ≃ₜ ↥(SYᶜ),
        (∀ᵐ x ∂((TauCeti.riemannianVolume I M).withDensity fun x => ENNReal.ofReal (f x)),
          ∀ hx : x ∈ SXᶜ, (h ⟨x, hx⟩ : M) = T x) ∧
        ∀ β : ℝ≥0, β < 1 → ∀ K : Set ↥(SXᶜ), IsCompact K →
          ∃ C : ℝ≥0, HolderOnWith C β (fun x => (h x : M)) K := by
  sorry

/-- **The Dirichlet problem for Aleksandrov solutions** (Hartenstine 2006, Theorem 2.1, p. 2,
existence; uniqueness is `TauCeti.eqOn_of_mongeAmpereMeasure_eq_of_eqOn_frontier`). -/
theorem exists_mongeAmpereMeasure_eq_of_strictConvex_closure {n : ℕ} (hn : 0 < n)
    {Ω : Set (EuclideanSpace ℝ (Fin n))} [DecidablePred (· ∈ Ω)] (hΩo : IsOpen Ω)
    (hΩb : Bornology.IsBounded Ω) (hΩcv : Convex ℝ Ω) (hΩc : StrictConvex ℝ (closure Ω))
    (ν : Measure (EuclideanSpace ℝ (Fin n))) [IsFiniteMeasure ν] (hν : ν Ωᶜ = 0)
    {g : EuclideanSpace ℝ (Fin n) → ℝ} (hg : ContinuousOn g (frontier Ω)) :
    ∃ u : EuclideanSpace ℝ (Fin n) → ℝ, ConvexOn ℝ Ω u ∧ ContinuousOn u (closure Ω) ∧
      EqOn u g (frontier Ω) ∧
      TauCeti.mongeAmpereMeasure volume (fun x => if x ∈ Ω then (u x : EReal) else ⊤) = ν := by
  sorry
```

In 6.4, strict convexity has to be imposed on `closure Ω`. For an open `Ω`, Mathlib's `StrictConvex ℝ Ω` is just convexity (`IsOpen.strictConvex_iff`, checked at the pin).
`Convex ℝ Ω` is needed as well: the open disc minus its centre has a strictly convex closure but carries no `ConvexOn` function at all.

If the fast-diffusion half of 11.8 is not wanted in Lean, keep only `1 < m`. In that case the docstring has to say why fast diffusion is not stated.

## R03 (P3) — 0.1 and 3.5 restate theorems the pin proves, and 3.5 cites the wrong lemma for its mixture bound

**Location.** `README.md:1188–1193` (0.1): "Prove that a coupling forces equal total mass, … nonemptiness via product couplings for probabilities and normalized products for finite equal-mass measures (including the zero-mass case), swap, map/pushforward…". `:1835–1836` (3.5): "For a probability vector `(a_i)`, prove the mixture bound". `:733–737`: the contract files `TauCeti.wassersteinEDist_smul_add_smul_rpow_le` under "mixtures".

**Claim.** These targets are open. For 3.5, the mixture bound is the cited one-argument convexity lemma.

**Witness.**
- `TauCeti.wassersteinEDist_finset_sum_smul_rpow_le` (`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Mixture/Basic.lean:68`) is 3.5's bound, for any finite weights.
- `wassersteinEDist_smul_add_smul_rpow_le` (`:103`) is convexity in one argument only.
- 0.1's facts are in `…/OptimalTransport/Coupling.lean` (`:298`, `:503`, `:509`, `:516`, `:472`, `:478`, `:665`), and none of them is cited.

**Repair.**
- In 3.5 and in the contract line, cite `TauCeti.wassersteinEDist_finset_sum_smul_rpow_le` and the countable `TauCeti.wassersteinEDist_sum_smul_rpow_le` (`Mixture/Basic.lean:78`) for the mixture bound. Keep `wassersteinEDist_smul_add_smul_rpow_le` only as the one-argument convexity it is.
- In 0.1, add a "Tau Ceti declares or proves" line naming `TauCeti.IsCoupling.measure_univ_eq`, `TauCeti.isCoupling_zero`, `TauCeti.isCoupling_prod`, `TauCeti.isCoupling_inv_smul_prod`, `TauCeti.isCoupling_map_swap_iff`, `TauCeti.isCoupling_map_prodMap_iff` and `TauCeti.Coupling.ext`.

**Check.** 0.1's third Check is `isCoupling_inv_smul_prod` applied to `2δ₀`, `2δ₁`: `(μ⊗ν)/μ(univ) = 4δ_{(0,1)}/2 = 2δ_{(0,1)}`.

## R04 (P3) — 16.1 prescribes namespaces that the roadmap's own implementation does not use

**Location.** `README.md:5588–5591`: "Organize general material under stable namespaces such as `MeasureTheory.OptimalTransport`, `MeasureTheory.ProbabilityMeasure.Wasserstein`, `Analysis.Convex.MongeAmpere`, `Analysis.GradientFlow`, and `MetricGeometry.GromovWasserstein`, following upstream naming feedback."

**Claim.** The library's declarations belong in these namespaces.

**Witness.** Scope says Tau Ceti's library is this roadmap's implementation (`README.md:58–64`). Its files open `namespace TauCeti` 176 times, and none opens `MeasureTheory.OptimalTransport` or `MetricGeometry`. Gromov–Wasserstein lives in `…/MeasureTheory/OptimalTransport/GromovWasserstein/`.

**Repair.** Rewrite 16.1 against the implemented layout:
- declarations go in `TauCeti`;
- modules go under `TauCeti/MeasureTheory/OptimalTransport/`, `TauCeti/Analysis/Convex/MongeAmpere/`, `TauCeti/Analysis/GradientFlow/` and `TauCeti/MeasureTheory/OptimalTransport/GromovWasserstein/`.

Delete "following upstream naming feedback", which is process wording.

## R05 (P3) — the docstring says Mathlib has only the Brownian predicates

**Location.** `Suggested.lean:98–100`: "need the Brownian law on `C([0,1]; ℝⁿ)`; Mathlib has only the predicates `ProbabilityTheory.IsPreBrownianReal` and `ProbabilityTheory.IsBrownianReal` on real-valued processes."

**Claim.** Mathlib has nothing else for Brownian motion.

**Witness.** Mathlib also has `ProbabilityTheory.BrownianReal.projectiveFamily` (`Mathlib/Probability/BrownianMotion/GaussianProjectiveFamily.lean:81`), the Gaussian finite-dimensional laws. It has no law on path space, so the conclusion stands.

**Repair.** Replace the clause with: "Mathlib has the predicates `ProbabilityTheory.IsPreBrownianReal` and `ProbabilityTheory.IsBrownianReal` and the finite-dimensional laws `ProbabilityTheory.BrownianReal.projectiveFamily` of real Brownian motion, but no Brownian law on a path space".

## Previous findings (review of `8e44152`)

- **R01 (six headlines statable at the pins): repaired.** `Suggested.lean` now states 2.5 (`:122`), 6.14 (`:249`), 11.7 (`:334`, `:354`), 13.4 (`:442`), 14.7 (`:465`) and 15.5 (`:492`). The former third list is deleted, and the README names each theorem in its subsection (e.g. `README.md:1570`, "The equality is `relaxedTransportCost_eq_sSup_ofReal_kantorovichDualValue`"). The 15.5 statement is the one the previous review drafted.
- **R02 (description states pre-merge pins): repaired.** The description now reads "The branch pins Tau Ceti `2fd255d` and Mathlib `1b1ccf4`, as main does, and `Suggested.lean` builds there". Its Acceptance-test paragraph gives fifteen theorems, seventeen proved headlines and five not statable, which matches the file. The sentence quoted in R02 above is the one remaining inaccuracy.
- No repair report marks a finding as not actionable, so nothing is re-raised.

## Verified sound

**Gate, dependency check, build.**
- Worker's gate at `51115d5`: every counter `0`, `build=0`, `OK`.
- My rerun of the gate on this head: every counter `0`, `OK`.
- The dependency check printed `depcheck: 233 roadmaps, 2263 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- `git diff --stat origin/main...HEAD` outside the folder is empty, per the worker's data. `PROGRESS.md`, `STATUS.md` and `metadata.toml` are main's files.

**Elaboration and signatures.**
- `lake env lean` on `Suggested.lean`: exit 0, exactly 15 `declaration uses 'sorry'` warnings (`:122 … :492`), nothing else.
- I compared the elaborated types in `signatures.md` (16 declarations, no `variable` block, no dropped binder) with each README statement: they agree.
- With `pp.universes`, 15.5 elaborates as `CompleteSpace.{max u_1 (u_2+1)} (TauCeti.GromovWassersteinSpace.{u_2,u_1} p Z) ↔ CompleteSpace Z`. The carrier universe is a free parameter.

**One-tactic probe.** On a scratch copy, each `sorry` was replaced by `first | (simp; done) | rfl | infer_instance | (intros; trivial) | sorry`. All 15 still report `sorry`, so none is padding. `IsStronglyCConvexSet` is the one definition, and the FKM statement needs it.

**Carriers opened at Tau Ceti `2fd255d`.** Each body matches what the README and the docstrings say:
- `relaxedTransportCost` and `partialTransportCost` (`Cost/Partial/Basic.lean:126`, `:48`): a supremum over `ε > 0` of plans with dominated marginals and `μ univ ≤ π univ + ε`. This is BLS (6)–(7).
- `DualFeasible` and `kantorovichDualValue` (`Duality/Basic.lean:75`, `:147`).
- `IsCConvexSet` (`Twist/CExponential.lean:100`), `SatisfiesWeakMTW` and `mtwTensor` (`Twist/MaTrudingerWang.lean:170`, `:120`).
- `IsEVISolution` (`Analysis/GradientFlow/EVI/Basic.lean:96`): continuous on `[0,∞)`, finite energy at `t > 0`, upper Dini form.
- `moreauYosidaResolvent` (`MoreauYosida/Basic.lean:124`).
- `GeneralizedGeodesicallyConvex` (`Wasserstein/GeneralizedGeodesic/Convex.lean:100`): some plan per pair, with remainder `(m/2)t(1−t)∫‖y₀−y₁‖²`.
- `boltzmannEntropy` (`InternalEnergy/Basic.lean:203`) and `potentialEnergy` (`PotentialEnergy.lean:115`).
- `sinkhornDivergence` (`Entropic/SinkhornDivergence.lean:86`) and `entropicTransportCost` (`Entropic/Basic.lean:443`), the latter with `ε·klDiv(π|μ⊗ν)`.
- `entropicGibbsKernel` (`Entropic/Duality.lean:192`) and `IsUniversalKernel` (`Analysis/PositiveDefinite/Kernel/Universal.lean:51`).
- `MetricMeasureSpace` (`MetricMeasure/Basic.lean:35`; complete, separable, finite on bounded sets) and `CurvatureDimensionInfinity` (`CurvatureDimension.lean:170`; full support, entropy may be `⊥`).
- `cheegerEnergy` (`MeasureTheory/Function/CheegerEnergy.lean:83`; `½`-normalised relaxation).
- `GromovWassersteinSpace` (`GromovWasserstein/Space.lean:154`; standard Borel carriers, a.e.-strongly measurable kernels).

**Mathlib at `1b1ccf4`.**
- `Matrix.PosSemidef` (`LinearAlgebra/Matrix/PosDef.lean:62`) quantifies over finitely supported vectors, so it is the kernel notion for an infinite `X`.
- `klDiv_compProd_eq_add` (`InformationTheory/KullbackLeibler/ChainRule.lean:203`, section hypotheses `:87–89`) is as the contract states. I recomputed its non-Markov Check: `8 log 2 − 3` against `6 log 2 − 3`.

**Library names.** A sweep of the 449 backticked library names in the README against the pins found a declaration for every final name component, apart from the two namespaces of R04.

**Cross-roadmap citations resolved on main.**
- RiemannianGeometry R1 (`## R1.`) and R4 item 6 (injectivity radius, cut locus, nullity).
- DifferentialGeometry Layer 12 items 12.2–12.5.
- GeometricMeasureTheory G2.
- PDE §1.7 (A7), §2.4 (B11) and §6.3 (F26).
- Hopf–Rinow and OneParameterSemigroups under `Completed/`.
- Downstream consumers: RandomMatrices, StandardDistributions (`:2622`), VonNeumannAlgebras (`:60`, `:1293`).

**Ownership.** `overlaps.md` lists no conflicting head, dropped id or revision-only id. For the Brownian reference `R^ε_r`, StochasticCalculus (open revision, `README.md:40–43` and `:177–181` at its head) explicitly leaves it to this roadmap's 13.12, so there is one owner. Main's `#### 13C` item 12 is this head's 13.12, so that citation still lands.

**Seeded sample.** Every locator was checked at the text and page:
- **0.1:** no literature locator. Every claim is a Tau Ceti theorem (R03). All three Checks recomputed: masses `1 ≠ 2`; product and diagonal both couple `(δ₀+δ₁)/2`; `2δ_{(0,1)}`.
- **1.6:** implemented. `tendsto_transportCost` (`Stability.lean:316`) needs liminf-stability, recovery plans, tightness and weak convergence, as 1.6 states.
- **2.2:** the three names exist with the stated hypotheses (`CTransform/Analytic.lean:123`, `:157`; `MeasurableSpace/Analytic.lean:312`, metrizable space, s-finite measure). Checks: `φᶜ = (0,−1)`; the supremal transform gives `φ(1)+φᶜ(1) = 2 > 0`; `φᶜᶜ = (0,1) = φ`.
- **3.5:** product `rpow` identity at `Product.lean:77`; kernel bound at `Kernel/Basic.lean:239` (separable, standard Borel, `1 ≤ p < ∞`). The mixture bound is R03.
- **4.2:** all five names exist; Checks: `1 ≤ 1/2` impossible; `1 ≥ 1/2`; `1_{[1/2,1]}` reaches `(δ₀+δ₁)/2`.
- **6.1:** `mongeAmpereMeasure_mul_norm_sub` (`MongeAmpere/Cone.lean:234`) gives `πδ₀` for `‖x‖` on `ℝ²` and `2δ₀` for `|x|`. `…_ite_eq_withDensity_det` (`Basic.lean:515`) is the C² formula.
- **6.8:** the survey's Theorem 2.14 is on p. 15 (`depf-survey` line 614), 2.21 on p. 19 (line 749), 3.3 on pp. 25–26 (lines 1098–1107). The four section/covering names exist (`Vitali.lean:246` matches the covering paragraph). Checks: ball of radius `√(2h)`; `(−h/(1+p), h/(1−p))` for `|x|`.
- **6.10:** survey Theorem 3.3, third assertion, p. 26 (`depf-survey` line 1106): smooth, uniformly convex domains with `C^{k,β}` densities on the closures. As stated.
- **6.12:** (C1)–(C3), p. 29 (`depf-survey` lines 1275–1278); (3.11), p. 30 (line 1310); (4.4), p. 33 (line 1497); Definition 4.1, p. 34 (line 1506).
- **8.5:** read from arXiv:2209.04268 (not in the package manifest). Theorem 3.1 is on p. 18, Theorem 3.3 and (3.6) on p. 19, Remark 2.20 on p. 17, Remark 3.2 and Example 1.1 on pp. 3–4. The README's reading of `[t,t+h]` as the interval between `t` and `t+h` is correct; see Source issues.
- **9.4:** all three Checks recomputed; see the table.
- **12.5:** `legouic-loubes` Theorem 2, p. 6 (line 214): separable locally compact geodesic space.
- **13.3:** `nutz-eot` Theorem 2.1(a) on printed p. 16 (line 646); separability is footnote 8 (line 651); integrability under (2.2) is line 664.
- **13.8:** `sinkhorn-knopp` Theorem, p. 344 (lines 57–63).
- **13.12:** `leonard-survey` Theorem 3.3, p. 16 (line 838); Theorem 3.4, p. 17 (line 856); Proposition 4.1, p. 21 (line 1038).

**Locators of the new statements.**
- `bls-general-duality` Theorem 1.2, p. 3 (lines 141–146); the dual set is (3) (line 56), with `[−∞,∞)`-valued integrable pairs.
- `fkm-holder`: Theorem 2.1, p. 6 (line 214); (B0)–(B3) (lines 165–182); strong convexity (line 187); Corollary 9.6, p. 44 (line 1686).
- `feydy-sinkhorn-divergences` Theorem 1 (line 249).
- `agmr-sigma-finite`: Theorem 6.1, p. 30 (line 1507); Theorem 6.2, p. 31 (line 1535); Definition 4.1 (line 871).
- `sturm-mms-i` Theorem 4.24 (line 2108).
- `bmnn-zgw` Theorem 39, p. 30 (line 1365).
- `depf-partial` Theorem 1.3 on printed p. 82 (line 66).

**Adversarial table.**

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| 2.5 `P^rel = D` | BLS Example 1.1 | `P = 1`; `P^ε = 0` via `x ↦ x−ε` on `[ε,1]`; `P^rel = 0 = D` | holds; gap only unrelaxed |
| 2.5 | `δ₀`, `c ≡ 5` | `P^ε = 5(1−ε)`, `P^rel = 5`; one fixed `ε` gives `5(1−ε) < 5` | the Checks are right |
| 2.5 dual set | `a+b ≤ c`, `c ≥ 0` | `min(max(a,−k),m) + max(min(b,k),−m) ≤ c` in all four cases; values converge as `m → ∞`, then `k → ∞` | `[−∞,∞)` pairs give the same sup |
| 2.5 measurability | a.e.-measurable `φ` | `φ̃ = φ'` off a Borel null `N`, `−∞` on `N`, so `φ̃ ≤ φ` and the integral is unchanged | Lean `D` = BLS `D` |
| 6.14 FKM | `n=1`, `(x−y)²/2`, `U=(0,1)`, `V=(0,2)`, `f=1`, `g=1/2` | `T = 2x`, `T' = 2 ∈ [1/2,2]`, `α ≤ 1`; `R = ℓ/2`; MTW tensor `0` | holds |
| 6.14 `IsStronglyCConvexSet` | segment in `ℝ²`; a point | midpoint on a sphere forces both endpoints onto it, so not strongly convex; a point has `R = 0` | definition discriminates |
| 6.14 ratio hypotheses | `L < 1` | `f ≤ L²f` a.e. on `U'` forces `f = 0`, so `U'` must be empty | vacuous, not false |
| 11.7 JKO | `Φ = ∫x²/2`, `δ_a` | steps `δ_{a(1+τ)^{−k}}`; gap `\|a\|·\|e^{−t} − (1+t/k)^{−k}\|` → 0 | holds |
| 11.7 JKO | `Φ = −∫x²/2`, `λ = −1` | `τ < 1`: step `a/(1−τ)`, limit `δ_{ae^t}`; `τ = 1`: resolvent empty, hypothesis unsatisfiable | vacuous only for early `j`; tail unaffected |
| 11.7 JKO | `n = 0` | one law `δ`; EVI: `0 + 0 ≤ Φδ − Φδ = 0` | holds |
| 11.7 FP | sign | `∂ₜ∫ζρ = ∫(ζₜ + Δζ − ∇V·∇ζ)ρ` from `∂ₜρ = Δρ + div(ρ∇V)` | sign right |
| 11.7 FP | `V = x²/2`, `N(m,s²)`; `V = 0` | `N(me^{−t}, 1+(s²−1)e^{−2t})`; `N(0,s²+2t)` (vs `s²+t` for `Δ/2`) | Checks right |
| 11.7 FP | `⊥ + ⊤` | entropy `> −∞` on `P₂`; `V ≥ λ\|x\|²/2 + affine` | free energy never `⊥` |
| 13.4 | `μs i = μ` | `S_ε(μ,μ) = 0`; PSD ⇒ `k` symmetric ⇒ `c` symmetric; `c+a` scales `k` by `e^{−a/ε}`, `S_ε` unchanged | the `[0,∞)` restriction is harmless |
| 14.7 | one point, `m = δ` | `L² = ℝ`, `Ch ≡ 0`, `f ≡ 1`, `u ≡ δ`; EVI `0 ≤ 0` | holds |
| 14.7 | `(ℝ,Leb)`, `K = 0`; `ℓ^∞` plane | `N(0,s²) → N(0,s²+2t)`; parallelogram fails | holds; excluded |
| 14.7 | entropy `⊥` | Sturm Ex. 4.4: `m = e^{e^{x²}}dx` has `Ent = −∞`, but `−e^{x²}` is not `K`-convex; Thm 4.24 growth ⇒ `Ent > −∞` | EVI test points safe |
| 14.7 | two-point `m` | `¬CD(K,∞)` (`CurvatureDimension.lean:265`) | excluded |
| 15.5 | one point; `ℚ`; `Z = ∅` | one class; `Point.lean:84` gives incomplete; empty both sides | iff consistent |
| 15.5 | non-separable `Z` | Cauchy sequence lives in `GW(Z₀)`, `Z₀` = closure of countably many separable essential ranges, complete | true beyond BMNN's separable setting |
| Gangbo–McCann | `h = x²/2`, `U[0,1] → U[1,2]`; `d = 0` | `T = x+1`, cost `1/2`; cost `0` | holds |
| Caffarelli | `(0,1) → (0,2)`, `f = 1`, `g = 1/2` | `T = 2x`, exponent `1` | holds |
| DPF Thm 1.3 | `c = 2 − ⟨x,y⟩` on unit balls; `c ≡ 0` | `−Dₓc = y` injective; `≡ 0` fails (C1) | twist discriminates |
| McCann | `M = ℝ`, `U[0,1] → U[1,2]` | `T = x+1`, `d²/2` cost `1/2` | holds |
| Figalli | same laws, `c = d` | `x+1` and `2−x` both cost `1` | existence only, as stated |
| Agueh–Carlier | `n = 0` | `dimH A ≤ 0` forces `μ_j A = 0` for `A = univ` | vacuous, as the docstring says |
| Gaussian | `n=1`, `C=(1,4)`, `w=(½,½)` | `√S = ½√S + √S` ⇒ `√S = 3/2`, `S = 9/4` | holds |
| Nutz | one-point spaces | `dπ/dR = 1`, `φ+ψ = 0`, pairs `(a,−a)` | holds |
| 0.1 (R03) | `2δ₀`, `2δ₁`; `δ₀` vs `2δ₀` | `2δ_{(0,1)}`; masses `1 ≠ 2` | Checks right |
| 3.5 (R03) | `p = 1`, two Dirac mixtures | `W₁(½δ₀+½δ₂, ½δ₁+½δ₃) ≤ ½·1 + ½·1 = 1`; equality via shift by `1` | bound and pin agree |
| 6.4 (R02) | disc minus centre | closure strictly convex, `Ω` not convex, no `ConvexOn` | `Convex ℝ Ω` needed |
| 6.4 (R02) | open `Ω`, Mathlib `StrictConvex` | `IsOpen.strictConvex_iff` | condition goes on `closure Ω` |
| 11.8 (R02) | `n=3`; `n=1`, `m=1/4` | `2/3 > 3/5`; `ρ = (5/4)\|x\|^{−7/2}`: moment `(5/2)·2 = 5`, `∫ρ^{1/4} = ∞` | Checks right |
| 11.8 (R02) | `m = 2` | `U₂(r) = r²`; `sU₂(1/s) = 1/s` convex, nonincreasing; `ρ∇U₂′(ρ) = ∇ρ²` | equation `∂ₜρ = Δρ²` |
| 14.8 (R01) | `[0,1] ∪ {p,q}`, `m` on segment | every coupling costs `∫(x−½)²dx + 1` | full support needed |
| 13.9 | `[[2,1],[1,2]]`; `[[1,2],[3,6]]` | `Δ = log 4`, `tanh(log 4/4) = 1/3`; `Δ = 0` | Checks right |
| 10.5 | `Φ = −x²` | finite iff `τ < 1/2` ⟺ `1+λτ > 0`, step `x/(1−2τ)` | Check right |
| 9.4 | `δ₀,δ₀,δ₁`; `δ₀,δ_{−1},δ₁` | `t² = t − t(1−t)`; halved strict; doubled `1/4 ≤ 0`; `(2t−1)² = 1−4t(1−t)` | constant exact |
| 12.5 | `P = (δ_{δ₀}+δ_{δ₂})/2` | `∫(x−1)²dν + 1`, minimum at `δ₁`, value `1`; `p = 1`: value `1` on `[0,2]` | holds |
| 13.12 | `ε = t = 1`; generator `εΔ` | standard Gaussian; covariance `εt` vs `2εt` | Checks right |

## Not verifiable

- **Villani 2003 and 2009**, **Ambrosio–Gigli–Savaré 2008** (Theorems 4.0.4 and 11.2.8, cited by the two 11.7 docstrings), **Kechris**, **Huang**, **Dembo–Zeitouni**: recorded `uncertified` (paywalled); cited by locator only.
- **Agueh–Carlier 2011** (SIAM J. Math. Anal.) and **Jordan–Kinderlehrer–Otto 1998** (SIAM J. Math. Anal.): publisher-paywalled, and not in the manifest. Not re-read; the statements' instances are in the table.
- **Gangbo–McCann 1996** and **Caffarelli 1992**: not in the sample; carried from the earlier reviews.

## Source issues

- **Misprint** in abedi-li-schultz-bv (arXiv:2209.04268) at Theorem 3.3, display (3.6), p. 19: the source writes the variation over `[t,t+h]` for every small `h`, which is empty when `h < 0`; it should be the closed interval between `t` and `t+h`; affects nothing (the README already reads it so).
