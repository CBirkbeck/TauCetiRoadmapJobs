# Review of OptimalTransport (pull request #950 at 3639528)

**Verdict:** needs changes

This is a full review. The folder changed by 226 lines since `6446de1`, all in `TauCetiRoadmap/OptimalTransport/README.md`, and `Suggested.lean` is unchanged. Every passage was read, including the unchanged ones. The branch still pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3`. Main pins Tau Ceti `2fd255d`.

## Status of the previous review's findings (read at `6446de1`)

- **R01 (P2, the docstring's "proved in the pinned Tau Ceti" list): not repaired.** `Suggested.lean:23–24` is unchanged and `lake-manifest.json` still pins `a91d3aa`. Held as R02 below (Re-raised: H01).
- **R02 (P3, contract names absent at the branch pin): not repaired.** The contracts gain more `2fd255d`-only names in this head. Held as R03 below (Re-raised: H02).
- **R03 (P3, 4.5 sign): repaired.** `README.md:1303–1307` now reads "the first-order condition `∇φ(x) = Dₓc(x,y)` … `x' ↦ c(x',y) - φ(x')` is minimal at `x`". It adds the worked instance `c - φ - ψ = (x-y+1)²/2` with `∇φ = -1 = Dₓc(x,x+1)`, and notes the survey's `u = -φ` convention. Recomputed: `(x-y)²/2 + x - y + 1/2 = (x-y+1)²/2`, which vanishes on `y = x+1`, where `Dₓc = x - y = -1`.
- **R04 (P3, uncited Tau Ceti theorems in 3.7, 4.5–4.6, 6.5–6.7, 9.1, 9.4, 9.6, 11.6, 12.8): repaired.** Each subsection now names the declarations in its text and on its *Needs:* line, and "From Tau Ceti" lists them (`README.md:360–519`). I opened every one at `2fd255d` and compared the hypotheses the README records (list under Verified sound); they match. 6.7 keeps only the inclusion `∂u(X) ⊆ closure Y` as this roadmap's own clause (`:1693–1697`). The earlier remarks are also addressed: 13.13's *Needs:* now lists Layer 11.2 (`:3403`), and 6.5 cites `TauCeti.mongeAmpereMeasure_eq_of_hasLaw`.

## R01 (P2) — 13.5 claims the zero-temperature limit for "integrably dominated" costs; a bounded lower semicontinuous cost refutes it

**Location.** `README.md:3211–3213`, 13.5: "Prove the zero-temperature limit: Γ-convergence/equicoercivity of regularized problems, convergence of values, and optimality of weak cluster points under continuous or integrably dominated costs."

**Claim.** For a continuous cost, or for an integrably dominated cost, the values `C_ε = inf_π ∫c dπ + ε klDiv π (μ⊗ν)` converge to `C₀`, and weak cluster points of the optimizers are optimal.

**Witness.** On `[0,1]²` with Lebesgue marginals, `c = 1` off the diagonal and `0` on it is bounded and lower semicontinuous. `C₀ = 0` (diagonal coupling), but finite-entropy couplings are `≪ Leb²`, so `C_ε = 1` with optimizer `μ⊗ν`, which is not optimal.

**Supporting evidence.** Nutz proves convergence of values only for continuous bounded `c` (`nutz-eot` line 1791, Corollary 5.4, p. 43) or for continuous `c ≤ c₁ ⊕ c₂` (line 1954, Theorem 5.10, p. 47). Main's Tau Ceti records the same failure for a `0`/`∞` cost (`TauCeti/MeasureTheory/OptimalTransport/Entropic/ZeroTemperature.lean`, module docstring, at `2fd255d`). 13.5 also has no locator, and it does not cite the Tau Ceti theorems that prove it at main's pin.

**Repair.** Rewrite 13.5 as follows.

1. On Polish `X`, `Y`, for continuous `c` with `c ≤ c₁ ⊕ c₂`, `c₁ ∈ L¹(μ)`, `c₂ ∈ L¹(ν)`:
   - `C_ε → C₀` (Nutz, *Introduction to Entropic Optimal Transport*, Theorem 5.10, p. 47; Corollary 5.4, p. 43, for bounded continuous `c`);
   - every weak cluster point of the optimizers is optimal (Theorem 5.10(b)).
2. For lower semicontinuous `c` with `C_ε → C₀`, weak cluster points are optimal (Proposition 5.9, p. 46).
3. If some optimal plan has finite `klDiv (·) (μ⊗ν)` and `C_ε → C₀`, the optimizers converge in variation to the unique optimal plan of least `klDiv (·) (μ⊗ν)` (Theorem 5.5, p. 44).
4. Cite Tau Ceti at main's pin:
   - `TauCeti.tendsto_entropicTransportCost_transportCost_of_le_add` (`…/Entropic/ZeroTemperature.lean:477`);
   - `TauCeti.isOptimalCoupling_of_tendsto_of_entropicTransportCost` (`:504`);
   - `TauCeti.tendsto_of_entropicTransportCost_eq` (`…/Entropic/Selection.lean:178`).
5. Add the off-diagonal cost as a negative-control Check: `C_ε = 1` for every `ε > 0`, while `C₀ = 0`.

**Check on the refuting instance.** The repaired hypotheses exclude it, because the off-diagonal cost is not continuous. For `c = |x - y|` on the same marginals, a continuous cost, `C₀ = 0` and `C_ε → 0`.

## R02 (P2) — The branch still pins Tau Ceti `a91d3aa`, so the docstring's "proved in the pinned Tau Ceti" list is false at the pin

Re-raised: H01

**Location.** `Suggested.lean:23–24`: "The following headline theorems of `README.md` are proved in the pinned Tau Ceti, so they are not restated here."

**Claim.** Each of the fifteen listed headlines is proved at the Tau Ceti that this file's manifest pins.

**Witness.** `lake-manifest.json` pins Tau Ceti `a91d3aa`. Nine of the fifteen names exist in no file there, among them:
- `isOptimalCoupling_iff_exists_isCyclicallyMonotone`;
- `mongeCost_eq_transportCost_of_continuous`;
- `exists_hasLaw_and_ae_eq_gradient_comp`;
- `GromovWassersteinSpace.instMetricSpace`.

All four are at `2fd255d`: `SchachermayerTeichmann.lean:103`, `Pratelli.lean:337`, `PolarFactorization.lean:160` and `GromovWasserstein/Space.lean:162`.

**Why H01's reason does not settle it.** The reason is that a folder-only repair cannot merge `origin/main`. That is true, and it says who has to act. It does not make the folder correct at the pin it builds against. The pull-request description's sentence "Fifteen are proved in Tau Ceti and are not restated" is likewise false at this head's pin.

**Repair (unchanged).**
1. Merge `origin/main`.
2. Rebuild `TauCetiRoadmap.OptimalTransport.Suggested` at Tau Ceti `2fd255d` and Mathlib `1b1ccf4`.
3. State the six third-list headlines on the carriers the docstring names, and delete the third list.

**Check.** After the merge, `TauCeti/MeasureTheory/OptimalTransport/Pratelli.lean` declares `mongeCost_eq_transportCost_of_continuous`.

## R03 (P3) — The README's Tau Ceti contracts name declarations that the branch's pinned Tau Ceti does not have

Re-raised: H02

**Location.** `README.md:360–361`: "The following theorems of Tau Ceti prove targets of the layers below, which cite them".

**Claim.** The cited declarations exist at the pin.

**Witness.** Of the 99 Tau Ceti names the folder cites, 59 occur in no declaration at `a91d3aa`, and all 99 resolve at `2fd255d`. This head adds more, for example `TauCeti.mongeAmpereMeasure_eq_withDensity_inv_add`.

**Repair.** The merge of R02. No README sentence needs to change for this finding.

## R04 (P3) — 1.2–1.3, 2.2 and 4.3–4.4 restate theorems the branch's pinned Tau Ceti proves, and 2.2 calls one of them missing

**Location.**
- `README.md:874–877`, 2.2: "Build the missing reusable theorem that every analytic subset of a Polish space is measurable in `η.completion` for every finite Borel measure `η`".
- Also `:770–771` (1.2), `:787–796` (1.3), `:1266–1269` (4.3) and `:1283–1286` (4.4).

**Claim.** The Scope rule (`:60–63`) keeps implemented targets as their specification. The layer then cites the Tau Ceti declaration that proves the target, as 2.4, 3.7, 4.5 and 9.4 now do.

**Witness.** These prove the targets at `a91d3aa`, uncited:
- `TauCeti.MeasureTheory.AnalyticSet.nullMeasurableSet` (`MeasureTheory/MeasurableSpace/Analytic.lean:312`);
- `TauCeti.analyticSet_setOf_cTransform_lt` (`…/CTransform/Analytic.lean:55`);
- `TauCeti.isClosed_setOfPred_isCoupling` (`…/Compactness.lean:93`);
- `TauCeti.Coupling.dense_graphPlans` (`…/GraphPlanDensity.lean:149`);
- `TauCeti.tendsto_map_prodMk_self_iff_tendstoInMeasure` (`…/GraphPlan/Convergence.lean:142`).

**Repair.** Add these to "From Tau Ceti", with the hypotheses they carry, and to the *Needs:* line and text of each subsection:
- **1.2:** `TauCeti.isClosed_setOfPred_isCoupling` (`T1Space (ProbabilityMeasure _)` on both factors).
- **1.3:** `TauCeti.isCompact_setOfPred_isCoupling` (tight marginals; `…/Compactness.lean:186`).
- **2.2:**
  - `TauCeti.analyticSet_setOf_cTransform_lt` and `TauCeti.nullMeasurable_cTransform` (Polish `X`, `Y`, Borel integrand sublevel; `:55`, `:89`).
  - `TauCeti.MeasureTheory.AnalyticSet.nullMeasurableSet`, which covers metrizable spaces with an s-finite measure.
  - Delete "missing".
- **4.3:** `TauCeti.Coupling.dense_graphPlans` (atomless source, through `NullSingletonClass`).
- **4.4:** `TauCeti.tendsto_map_prodMk_self_iff_tendstoInMeasure`, with its outer-approximability and second-countable-target hypotheses.

All six names also resolve at `2fd255d` (`Compactness.lean:96/185`, `CTransform/Analytic.lean:123/157`, `GraphPlanDensity.lean:161`, `GraphPlan/Convergence.lean:143`), so the citations survive R02's merge.

**Check.** After the edit, the gate's `readme-ids-missing` stays `0` and `roadmaps resolve` finds every added name.

## R05 (P3) — Nine sampled targets have no locator, and 6.10 has no exact statement

**Location.**
- `README.md:1014–1016` (3.1): "Define `W_p` as the infimum, over couplings, of the `eLpNorm` of ground `edist`."
- `:1776–1783` (6.10), `:1795–1803` (6.12), `:1952–1974` (7.4), `:2643–2689` (11.2), `:3247–3254` (13.7), `:3524–3545` (14.6), `:3547–3569` (14.7), `:3690–3699` (15.4).

**Claim.** Every theorem has its exact hypotheses and a locator.

**Witness.** None of the nine cites a theorem, section or page; 7.4 names only McCann's paper. 6.10 promises "global boundary regularity and smooth-diffeomorphism results", with no conclusion. Overall, 84 of 141 subsections have no locator.

**Repair.** Verified locators where a legal text was available:

| Target | Statement and locator to add |
|---|---|
| 6.10 | For bounded, smooth, uniformly convex `X`, `Y`, and `f ∈ C^{k,β}(cl X)`, `g ∈ C^{k,β}(cl Y)` bounded away from `0` and `∞`, the Brenier map is a global `C^{k+1,β}` diffeomorphism `cl X → cl Y`. Locator: De Philippis–Figalli survey, Theorem 3.3, third assertion, p. 26 (`depf-survey` line 1106). |
| 6.12 | Survey (C0)–(C3), p. 29 (line 1275), and Definition 4.1, `MTW(K)`, p. 34 (line 1506). |
| 3.1 | Ambrosio–Gigli, *User's guide*, Theorem 2.2, p. 25 (`ambrosio-gigli-guide` line 1321), for `p = 2`. For general `p`, the theorem of Villani 2009, Chapter 6, that the README follows. |
| 11.2 | Ambrosio–Gigli–Savaré, *Calculus and heat flow* (arXiv:1106.2090v4), Definition 7.1, (7.3) and (7.5)–(7.6), pp. 55–56, for the reweighted reference and the lower semicontinuity with moments. |
| 13.7 | Nutz, Lemma 6.4 (p. 55), Proposition 6.5 and Corollary 6.6 (p. 56), for marginal convergence; Theorem 6.15 (p. 62), for potentials and couplings under exponential integrability. |
| 14.7 | AGS, arXiv:1109.0222v2: Theorem 5.1 (p. 40) for the EVI characterization and Theorem 6.2 (p. 45) for Bakry–Émery. AGS *Calculus*, Theorem 9.3, for the identification. Savaré's paper, with its theorem number, for `p ∈ [1,∞]`. |
| 15.4 | Bauer–Mémoli–Needham–Nishino, Theorem 29, p. 26: a metric on the weak-isomorphism quotient for separable `Z`. Add the source of the full-support reduction. |
| 7.4, 14.6 | The theorem and page in McCann 2001, and in the sources of the two smooth equivalences. I could not open these texts, so I propose no number. |

Because each round samples new targets, a single pass over all 84 subsections would end this cycle.

**Check.** 6.10 restated this way excludes the two-half-disc target of 6.7's Check, which is not convex, where the Brenier map jumps across the diameter.

## R06 (P3) — 14.5's AGS theorem numbers do not match the text the README links

**Location.** `README.md:3513–3515`: "convergence of heat flows (AGS Theorem 6.11), and prove nonbranching `ℓ²`-product tensorization (Theorem 6.13). Formalize the precise global-to-local and local-to-global statements of AGS Theorems 6.20 and 6.22".

**Claim.** These are the theorem numbers of the linked AGS paper (`arxiv.org/abs/1109.0222`, `:3637`).

**Witness.** In arXiv:1109.0222v2 the numbers are:
- stability, Theorem 6.10 (`1075f091…` line 2530);
- nonbranching tensorization, Theorem 6.11 (line 2584);
- global-to-local, Theorem 6.18 (line 2873);
- local-to-global, Theorem 6.20 (line 2896).

Theorem 6.10 gives stability of `RCD(K,∞)` only, with no heat-flow convergence.

**Repair.** Either cite arXiv v2's numbers (6.10, 6.11, 6.18, 6.20) with "arXiv:1109.0222v2", or name the published version whose numbering is 6.11, 6.13, 6.20 and 6.22. Give the heat-flow convergence its own locator.

**Check.** v2's Theorem 6.11 carries the nonbranching hypothesis the README states.

## R07 (P3) — 5.9 cites PDE §1.1 for weak derivatives on `Ω ⊆ ℝᵈ`, but §1.1 is the interval theory, and Tau Ceti provides the carrier

**Location.**
- `README.md:1504–1505`: "First consume PDE §1.1 (A1)'s weak derivatives to define the weighted space `W¹,p(Ω,P)`".
- Also `:79` (Scope: "PDE … owns weak-derivative Sobolev spaces"), `:537`, and the Layer 6 note at `:1716`.

**Claim.** PDE §1.1 supplies weak derivatives on domains of `ℝᵈ`.

**Witness.** PDE §1.1 is "Weak derivatives and Sobolev classes on intervals (A1)" (`PDE/README.md:677`). It consumes `TauCeti.HasWeakFDerivOn` and `TauCeti.W1p`, which are defined on open sets at both pins (`Analysis/Sobolev/WeakDeriv/Basic.lean:248`, `W1p/Basic.lean:375`).

**Repair.**
- Cite Tau Ceti `TauCeti.HasWeakFDerivOn` and `TauCeti.W1p` in 5.9, on its *Needs:* line and in "From Tau Ceti".
- Keep PDE §1.6 (A6) for Rellich–Kondrachov.
- In Scope, say that Tau Ceti implements weak derivatives and `W^{1,p}`, and that PDE Layers 1, 2 and 6 build on them.

**Check.** `TauCeti.HasWeakFDerivOn μ Ω u U` takes an arbitrary open `Ω : Opens E`, which covers 5.9's `Ω ⊂ ℝᵈ`.

## R08 (P3) — Three definitions have no Checks

**Location.**
- `README.md:2240–2243` (8.9): "Define distributional solutions of `∂ₜμₜ + div(vₜ μₜ)=0` on `M`".
- Also `:1505–1507` (5.9, the weighted `W¹,p(Ω,P)` and its norm) and `:2225–2227` (8.8, the Lagrangian flux and the barycentric velocity).

**Claim.** The pull-request description says "every definition has a `**Checks.**` list with computed values".

**Witness.** None of 5.9, 8.8 or 8.9 has a `**Checks.**` list. A script over all 141 subsections finds these three as the only defining subsections without Checks.

**Repair.** Add at least three discriminating Checks to each.
- **8.9:**
  - on flat `ℝⁿ` the definition is 8.7's;
  - on the circle, `μ_t = δ_{tθ}` with `v ≡ θ ∂_θ` solves it;
  - with the opposite sign, the same curve would need `v ≡ -θ ∂_θ`.
- **5.9:**
  - for `P` uniform on `(0,1)` and `v(x) = x`, the norm is `(1/(p+1) + 1)^(1/p)`;
  - `1_{(1/2,1)}` is not in the space;
  - for `P` normalized Lebesgue measure, the space is `W^{1,p}(Ω)`.
- **8.8:**
  - for `T(x) = x + w`, `v_t ≡ w`;
  - for `μ = (δ₀+δ₂)/2` and `T ≡ 1`, `F_{1/2}` is injective with `v_{1/2}(1/2) = 1` and `v_{1/2}(3/2) = -1`, while `F_1` is not injective;
  - the action bound is an equality for the optimal `T(x) = 2x` from `U[0,1]`, where both sides are `1/3` at `p = 2`.

**Check.** The 8.9 circle instance: `∫₀¹ (∂ₜφ + θ ∂_θ φ)(t, tθ) dt = φ(1,θ) - φ(0,0) = 0` for `φ` compactly supported in `(0,1) × M`.

## Verified sound

**Gate, build and diff.**
- The gate rerun on this head gives `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, and the worker's gate gives `build=0`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/OptimalTransport'` is empty.
- `lake env lean` on `Suggested.lean` exits 0 in 26 s with exactly eight `declaration uses 'sorry'` warnings (`:110, :134, :163, :199, :223, :245, :262, :284`).

**Dependency check.** The command printed:

```
depcheck: 233 roadmaps, 2263 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

**Signatures.**
- A scratch file with `#check @name` for all eight declarations elaborated.
- `Suggested.lean` has no `variable` block, so no binder can be lost. Each elaborated type matches its README statement.
- `TauCeti.IsKantorovichOptimalTransportMap` is `HasLaw` plus cost equality (`#print`). `TauCeti.HasFiniteMoment` is `∃ x, MemLp (edist x ·) p ν`.

**Padding probe.** On a scratch copy, every `sorry` was replaced by `first | rfl | infer_instance | (simp; done) | trivial | exact ⟨_, rfl⟩`. All eight fail, with 16 errors, so no headline closes in one tactic.

**Tau Ceti declarations opened (44).**
- At `2fd255d`:
  - `Wasserstein/Rearrangement.lean:154/223`;
  - `Twist/Basic.lean:135/245/283`;
  - `Twist/Map.lean:50`;
  - `MongeAmpere/Transport.lean:104/273/331`;
  - `Brenier.lean:670/701`;
  - `GeneralizedGeodesic/Basic.lean:97/146/170/260/286`;
  - `GeneralizedGeodesic/Convex.lean:100/178/258`;
  - `Quantile/Isometry.lean:130`;
  - `Quantile/Geodesic.lean:80`;
  - `Barycenter/Basic.lean:91/110/164/244/253/315`;
  - `FrechetMean/TwoPoint.lean:77/330/358`;
  - `Entropic/ZeroTemperature.lean:477/504`;
  - `Entropic/Selection.lean:178`.
- At `a91d3aa`:
  - `Duality/LowerSemicontinuous.lean:177`;
  - `CTransform/Analytic.lean:55/89`;
  - `Compactness.lean:93/186`;
  - `GraphPlanDensity.lean:149/168`;
  - `GraphPlan/Convergence.lean:142`;
  - `MeasurableSpace/Analytic.lean:312`;
  - `Sobolev/WeakDeriv/Basic.lean:248`;
  - `W1p/Basic.lean:375`.
- All 99 cited Tau Ceti names were resolved at both pins by a namespace-aware scan (59 absent at `a91d3aa`, 0 at `2fd255d`).

**Mathlib declarations opened at `6b7abb3` (19).**
- `KullbackLeibler/ChainRule.lean:87–89, 181, 203`: section hypotheses `[IsFiniteMeasure μ] [IsFiniteMeasure ν] [IsMarkovKernel κ] [IsMarkovKernel η]`, as the contract says.
- `klDiv_map_le`, `klDiv_trim_le`, `klDiv_comp_right_le` (`DataProcessing.lean`).
- `IsTightMeasureSet.prodMk` (`Tight.lean:143`).
- `traj_map_frestrictLe` and `isProjectiveLimit_nat_iff` (`IonescuTulcea/Traj.lean`).
- `eq_condKernel_of_measure_eq_compProd`, `compProd_map_condDistrib`, `IsCadlag`, `IsPreBrownianReal`, `IsBrownianReal`.
- `ConvexOn.locallyLipschitzOn_interior`, `LipschitzOnWith.ae_differentiableWithinAt`, `optimalGHInjl`, `levyProkhorovEDist`.
- `MeasureTheory.IsSeparable` (`SeparableMeasure.lean:338`).

**Cross-roadmap citations resolved on main (`69a3eff`).**
- RiemannianGeometry: R1 (`README.md:186`, curvature calculus and both Bianchi identities); R2 (`:322`); R3 (`:369`); R4 item 6 (`:717–738`, injectivity radius, cut locus, measurability, volume-nullity, smoothness of `d²` off the cut relation, "OptimalTransport Layer 7 consumes these").
- DifferentialGeometry 12.2–12.5 (`:916–935`).
- GeometricMeasureTheory G2.
- PDE §1.6 (`:905`), §1.7 (`:996`), §2.4 (`:1241`) and §6.3 (`:2309`); §1.1 is in R07.
- Hopf–Rinow Layers 1–4 (`Completed/HopfRinow/README.md:264–530`; Layer 4 has the metric length and geodesic-space API).
- OneParameterSemigroups Part A (`:90`).
- Downstream: RandomMatrices `:60`, StandardDistributions `:2622`, VonNeumannAlgebras `:60/:1293`, all citing this roadmap as stated.

**Ownership against open pull requests.**
- `overlaps.md` lists no conflicting head and no dropped id.
- `roadmaps grep` across all open heads for Wasserstein, Gromov–Wasserstein, Sinkhorn, Monge–Ampère, Brenier, Schrödinger bridge, JKO, Benamou, `RCD(K` and curvature-dimension finds no second owner:
  - CompactQuantumMetricSpaces consumes Tau Ceti's Kantorovich–Rubinstein theorem;
  - ManifoldOptimization consumes this roadmap's 13.8;
  - IncompressibleFlows (never a supplier) is not cited.

**Seeded sample, locators read at the text (15 targets).**

| Target | Locator in the README | Result |
|---|---|---|
| 2.4 | Villani 2009 Thm 5.10 (i), (iii); Tau Ceti `…_of_lowerSemicontinuous` | Tau Ceti hypotheses match (`LowerSemicontinuous c`, Polish/Borel, `LowerSemicontinuous.lean:138, 177`); Villani not verifiable |
| 3.1 | none | R05 |
| 6.10 | none | R05; survey Thm 3.3, third assertion, p. 26 supplies the statement |
| 6.12 | none | R05; Checks hold (below) |
| 7.4 | McCann 2001, no number | R05; statement checked on instances |
| 11.1 | Nutz Lemma 1.2 p. 4; Lemma 1.3 p. 5 | correct (`nutz-eot` lines 152, 172; printed pages 4, 5) |
| 11.2 | none | R05 |
| 12.7 | Agueh–Carlier Prop 2.3, Def 3.2, Prop 3.5, Thm 5.1, Rem 5.2 | correct (HAL `hal-00637399` lines 394, 617, 650, 1018, 1108); Def 3.2 says "less than or equal to `d−1`", as stated |
| 13.2 | Nutz Thm 2.1 p. 16; separability §2 p. 16 | correct (lines 641–650, 616, footnote 8 at 651) |
| 13.5 | none | R01 |
| 13.7 | none | R05; Nutz §6 supports the claims |
| 14.6 | none | R05 |
| 14.7 | none | R05 |
| 15.4 | none | R05; BMNN Thm 29, p. 26 |
| 16.4 | not a theorem | no mathematical claim to locate |

**Other locators read (15).**
- De Philippis–Figalli 2015, Theorems 1.3 and 1.4, p. 82 (`depf-partial` lines 61–78): (C0) asks only `C²` with bounded norm, densities continuous and bounded away from `0`, `∞`.
- Figalli 2007, Theorem 1.1, p. 3, and Remark 1.2, p. 4 (lines 112, 133–151).
- Gangbo–McCann, Theorem 1.2 and (H1)–(H3) (`1c5ef544…` lines 284–315).
- Álvarez-Esteban et al., Theorem 4.2 and Corollary 4.5 (lines 625, 773).
- Agueh–Carlier, Theorem 6.1 (line 1197).
- BMNN, Theorems 26, 39, 45, 50 and Propositions 36, 38.
- Survey, (C0)–(C3) at p. 29.

**Adversarial table.** It covers the sampled targets, the eight headlines, and every target a finding touches.

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| H1 Gangbo–McCann | `d=1`, `h=x²/2`, `U[0,1]→U[1,2]`; `h=\|x\|`; `d=0` | `T=x+1`, cost `1/2`, unique; `x+1` and `2-x` both cost `1`; the point space gives `T=id` | holds; `h_strict` load-bearing; (H2) with `r≤0` is the empty cone |
| H2 Caffarelli | `X=(0,1)`, `Y=(0,2)`, `f=1`, `g=1/2`, `l=1/2`; `X=(0,2)`, `Y=(0,1)∪(2,3)` | `T=2x`, Hölder `C=2`, `α=1`; jump `1` at `x=1` | holds; `hYc` load-bearing |
| H3 DPF 1.3 | `c=2-⟨x,y⟩` on `B₁×`(two half-discs); `c≡0` | `-Dₓc=y` injective, `det D_xy c=±1`; `-Dₓc=0` not injective | holds; twist excludes `c≡0`; matches (C0)–(C3) |
| H4 McCann | `ℝⁿ`; circle with source `δ₀` | `exp_x(-∇φ)=∇u`; `δ₀ ̸≪ vol` | holds; `hμ` load-bearing |
| H5 Figalli | `U[0,1]→U[1,2]`, `c=\|x-y\|` | `x+1` and `2-x` both cost `1` | existence only, as stated |
| H6 Agueh–Carlier | two segments in `ℝ²`; `n=0`; `n=1` | two optima, each `1/6`; `μ_j(univ)=0` contradicts probability, so vacuous; quantile average unique | holds |
| H7 Gaussian | `n=1`, `C=(1,4)`, weights `1/2`; `C=(1,0)` | `√S=(1+2)/2`, `S=9/4`; `S=1/4` | holds |
| H8 Nutz | `μ=ν=(δ₀+δ₁)/2`, `R=μ⊗ν`; diagonal `R` | `dπ/dR=1`, family `(a,-a)`; two free constants | holds; `hμνR` load-bearing |
| 2.4 | `δ₀`, `δ₂`, `(x-y)²` | primal `4`; dual `φ(0)=0`, `ψ(2)=4`, value `4` | holds |
| 3.1 Checks | `(δ₀+δ₁)/2` vs `δ₀`; `δ₀` vs `2δ₀` | `W₁=1/2`, `W₂=2^{-1/2}≈0.707`, `W_∞=1`; `∞` | hold |
| 6.10 (survey 3.3c) | `X=Y=B₁`, `f=g=1/π`; two half-discs | `T=id`, a `C^∞` diffeomorphism; `T` discontinuous on the diameter | restated form consistent (R05) |
| 6.12 Checks | `‖x-y‖²/2`, `n=1,2`; `‖x-y‖` | `-Dₓc=y-x`; MTW tensor `0`: A3w holds, A3s fails iff an orthogonal pair exists (`n≥2`); `(y-x)/‖y-x‖` constant on rays | hold |
| 7.4 Checks | `ℝⁿ`, `φ=‖x‖²/2-u`; circle `δ₀`, `-∇φ(0)=π/2` | `(1-t)x+t∇u(x)`; `δ_{tπ/2}`, `π/2<π`, unique geodesic | hold |
| 11.1 | one point, `μ=2δ`, `ν=δ`, `κ=2δ`, `η=δ`; `κ=η=δ` | `klDiv(4δ,δ)=8log2-3≈2.545` vs `6log2-3≈1.159`; both `2log2-1≈0.386` | Markov load-bearing |
| 11.2 | `U[0,2]`; `U[0,1]` vs `Leb[0,2]`; `2m_a`; `1/(x log²x)` | `-log 2`; `1=0+2-1`; both `2log2-1`; mass `1`, entropy `-∞` | hold |
| 12.7 | as H6 | as H6 | hold |
| 13.2 | `μ=ν=(δ₀+δ₁)/2`, `R=μ⊗ν`; unequal masses | minimizer `μ⊗ν`, value `0`; `Π=∅` | holds |
| 13.5 | off-diagonal `0/1` cost, `Leb²`; `c=\|x-y\|` | `C₀=0`, `C_ε=1`; `C₀=0`, `C_ε→0` | false as stated (R01) |
| 13.7 Checks | `K=[[2,1],[1,2]]`; `K=[[1,1],[0,1]]` | `[[1/3,1/6],[1/6,1/3]]`; entry `(0,1)` goes `1/4, 1/6, 1/8, 1/10 → 0` | hold |
| 14.6 | weighted `ℝ`, `V=x²/2`, `N=3` | `Ric+Hess V=1`; `1-x²/2<0` for `\|x\|>√2` | `RCD(1,∞)`, `RCD*(K,3)` for no `K` |
| 14.7 | `(ℝ, Leb)`, `K=0`; `f(x)=x` | `H_t^*δ_x=N(x,2t)`, `W_p=\|x-y\|`; `\|DH_t f\|=1=H_t(1)` | equality, consistent |
| 15.4 | two-point spaces `a=b`; one point vs `({0,1},` uniform, `0)` | `GW=0`; weakly isomorphic | holds |
| 16.4 / Layer 16 Examples | `δ₀`, `δ₂`, `(x-y)²`; `(δ₀+δ₂)/2` | cost `4`, `W₂=2`; barycenter `1`, radius `1` | hold |
| 1.3, 2.2, 4.3, 4.4 | Tau Ceti statements at `a91d3aa` | hypotheses match the README's | restated (R04) |
| 2.2 Checks | `{0,1}`, `\|x-y\|`, `φ=(0,1)` | `φᶜ=(0,-1)`, `φᶜᶜ=(0,1)`, contact set `{(0,0),(1,0),(1,1)}` | hold |
| 5.9, 8.8, 8.9 | proposed Checks (R08) | norm `(1/(p+1)+1)^{1/p}`; `v_{1/2}(1/2)=1`, `v_{1/2}(3/2)=-1`; `φ(1,θ)-φ(0,0)=0` | Checks missing (R08) |
| 14.5 | AGS v2 numbering | 6.10, 6.11, 6.18, 6.20 vs 6.11, 6.13, 6.20, 6.22 | mismatch (R06) |
| 4.5 (repaired) | `U[0,1]→U[1,2]`, `φ=-x`, `ψ=y-1/2` | slack `(x-y+1)²/2`; `∇φ=-1=Dₓc` | holds |
| 11.8 | `n=1,2,3`; `m=1/4`; `m=1/2` with `n=2` | thresholds `1/3`, `1/2`, `2/3`; second moment `5`, `∫ρ^{1/4}=∞`; `∫dr/(r log r)=∞` | holds |

## Not verifiable

- **Villani 2009** (2.4 Theorem 5.10, 4.5 Chapter 10, H4 Theorem 10.35) and **Villani 2003**: paywalled, and not in the sources cache.
- **McCann 2001** (7.4, H4): GAFA, paywalled. No copy in the cache or among the roadmap's legal sources.
- **Sturm 2006** (14.6) and **Savaré's self-improvement paper** (14.7): not in the cache. I did not fetch them, because this review edits no manifest.
- **The published Duke numbering of AGS RCD** (14.5): only arXiv v2 is cached (R06).
- **Ambrosio–Gigli–Savaré 2008, Kechris, Huang**: settled as uncertified, so cited by locator only.
- **Ownership against open pull requests** was checked by object grep and `overlaps.md`. The five closest open roadmaps were read only at their matching lines.

## Source issues

- none
