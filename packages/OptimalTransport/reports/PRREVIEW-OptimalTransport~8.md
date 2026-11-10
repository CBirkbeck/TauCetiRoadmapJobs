# Review of OptimalTransport (pull request #950 at 7112ecf)

**Verdict:** needs changes

This is a full review: the folder changed by 848 lines since `55f4658`. It has seven findings: three P2 and four P3. All eight findings of the previous review are repaired. The gate passes at this head, and so does the dependency check.

## Status of the previous review's findings (read at `55f4658`)

- **R01 (P3, pin of the Tau Ceti contracts): repaired.** `README.md:335–337` now reads "Declaration names and paths are those of Tau Ceti at revision `2fd255d9` with Mathlib `1b1ccf4b`". `Suggested.lean:23` says the seventeen headlines are "proved in Tau Ceti at revision `2fd255d9`". At `2fd255d` all 334 backticked Tau Ceti names in the README resolve, and so do all 181 cited paths. All 35 names in the docstring resolve, except Mathlib's two Brownian predicates, which exist at both Mathlib pins.
- **R02 (P3, implemented targets uncited): repaired for every target it listed.** Each listed subsection now cites its declarations in the text and on its *Needs:* line: 2.1 (`:1324–1325`), 2.5 (`:1450–1456`), 5.8 (`:2110–2111`), 10.4 (`:3306–3308`), 11.4 (`:3526–3533`), 11.6 (`:3597–3604`), 12.7 (`:3859–3861`), 13.3 (`:4019–4024`), 13.7 (`:4194–4197`), 13.8 (`:4222–4224`) and 13.9 (`:4243–4247`). Some residue remains, which this round's sample found in 4.2 (R04 below). 34 of the 185 files under `TauCeti/MeasureTheory/OptimalTransport/` still have no cited declaration, down from 130.
- **R03 (P3, 2.5): repaired.** `:1408–1468` defines `P^ε` and `P^rel` and states five results with locators. Every locator was read: `bls-general-duality` lines 120, 131, 141–151, 123, 389, 401, 442, 449, 91; `beiglbock-schachermayer-borel` lines 60, 112. The three Checks recompute (table).
- **R04 (P3, 5.7): repaired.** `:2048–2087` states Definitions 1.23 and 1.25, Theorem 1.24 and the two-sided Theorem 1.26. They are at `ambrosio-gigli-guide` lines 876 (p. 15), 886, 890 and 896 (p. 16).
- **R05 (P3, 7.2–7.3 noncompact locators): repaired.** 7.2 cites Figalli–Gigli Theorem 1, p. 2 (`figalli-gigli-semiconvexity` line 71). 7.3 cites Fathi–Figalli Theorems 4.2 (pp. 14–15) and 4.3 (p. 16) (`fathi-figalli-noncompact` lines 551–558, 602–614). The docstring of `exists_isKantorovichOptimalTransportMap_riemannian` cites the same theorems.
- **R06 (P3, 11.4): repaired.** `:3486–3551` defines the Fréchet, strong and tangent subdifferentials separately, with locators (`ambrosio-gigli-guide` line 3593, p. 69, for the tangent one). The rotation-field Check is now stated about the Fréchet notion.
- **R07 (P3, 9.3 and 14.6): repaired.** 9.3 cites Ambrosio–Gigli Definition 3.16, p. 59 (line 3107) and Lott–Villani Definition 3.15. 14.6 cites Sturm I Theorem 4.9 (`sturm-mms-i` line 1428, preprint p. 32) and Sturm II Theorem 1.7 (i), (ii) (`sturm-mms-ii` line 385, p. 7). I recomputed the translation of part (ii) to `Hess V − dV⊗dV/N′ ≥ K′` for `W = e^{−V}` (table).
- **R08 (P3, 12.7 at `n = 0`): repaired.** The Check at `:3869–3870` now treats `n − 1 = −1`. The remark on truncated subtraction has moved to the docstring (`Suggested.lean:250`).

## R01 (P2) — 8.9: the lower bound is attributed to the wrong theorem, and the stated generality has no source

**Location.** `README.md:2951–2952`: "For `μ₀,μ₁ ∈ P_p(M)` prove `W_p(μ₀,μ₁)^p = min ∫₀¹ ∫ |vₜ|^p dμₜ dt` … The lower bound uses item 3's superposition on `(M,d)`".

**Claim.** Every distributional solution with finite action costs at least `W_p^p`, and item 3 (Lisini) supplies this, for `1 < p < ∞` on a complete, possibly noncompact `M`.

**Witness.** Item 3 (`:2793–2797`) maps an absolutely continuous curve to a law on paths; it never shows that a solution of the continuity equation is absolutely continuous. Ambrosio–Gigli prove the `≤` direction from their Theorem 2.29(B) (`ambrosio-gigli-guide` lines 2335–2337 and 2355–2357, pp. 44–45). They prove 2.29(B) on compact `M` by a Nash embedding (lines 2451–2467, pp. 46–47), and their §2.3 assumes `M` compact (line 2141). No roadmap on main owns a continuity equation on manifolds or the isometric embedding theorem.

**Repair.**
1. Add to 8.9 the following target. For complete `M` and `1 < p < ∞`:
   - (A) every `ACᵖ` curve in `P_p(M)` has a Borel field solving the continuity equation with `‖vₜ‖_{Lᵖ(μₜ)} ≤ |μ̇|(t)` for a.e. `t`;
   - (B) a narrowly continuous distributional solution with `∫₀¹ ‖vₜ‖_{Lᵖ(μₜ)} dt < ∞` is absolutely continuous, with `|μ̇|(t) ≤ ‖vₜ‖_{Lᵖ(μₜ)}` for a.e. `t`.

   Locator: Ambrosio–Gigli Theorem 2.29, p. 44, for `p = 2`.
2. Replace the quoted sentence with: "The lower bound applies (B) and `W_p(μ₀,μ₁) ≤ ∫₀¹ |μ̇|(t) dt`; the minimizer applies (A) to a constant-speed geodesic of item 4."
3. Name the route of (B). Either use an isometric embedding into `ℝᴰ` with item 7, as on pp. 46–47 (the embedding theorem then becomes a target here), or transport 8.8's subsolution bound to `M` through the Hopf–Lax semigroup of `dᵖ`.
4. Either restrict the displayed formula to `p = 2`, the locator's case, or cite a source for `1 < p < ∞` on complete noncompact `M`. Add item 1 and the new target to the *Needs:* line.

**Check.** On the circle, `μₜ = δ_{tθ}` with `v ≡ θ∂_θ` gives `|μ̇| = |θ| = ‖vₜ‖`, so (B) holds with equality. The curve `δ_{t·3π/2}` has action `(3π/2)² ≥ W₂² = (π/2)²`, consistent with the existing Checks.

## R02 (P2) — 11.7, listed as a headline, states no theorem

**Location.** `README.md:3614–3616`: "Prove convergence of JKO schemes to Wasserstein gradient flows and then to weak PDE solutions for the named energies." `Suggested.lean:87` lists it as a headline whose carriers are missing at the branch pin.

**Claim.** Every theorem carries exact hypotheses and a locator, and a named milestone states its quantifiers.

**Witness.** The text names no space, energy class, convexity hypothesis, initial datum, step range, topology of convergence or rate. Its *Needs:* line omits 10.3 and 11.2, which the docstring says the statement needs. A readable source states exactly such a theorem: Ambrosio–Gigli Theorem 3.25, second bullet, p. 64 (`ambrosio-gigli-guide` lines 3358–3370, under Assumption 3.24 at line 3340).

**Repair.** Rewrite 11.7 in two parts.

1. *Metric convergence.* Let `Φ : P₂(ℝⁿ) → (−∞,∞]` be lower semicontinuous and `λ`-convex along the generalized geodesics of 9.4 (11.6's hypothesis), and let `μ₀ ∈ D(Φ)`. For `0 < τ < 1/λ⁻`, every family of JKO discrete solutions from `μ₀` converges in `W₂`, locally uniformly in `t ≥ 0`, as `τ ↓ 0`. The limit is the unique `EVI_λ` solution of 10.3 from `μ₀`. For `λ ≥ 0` it obeys the a priori estimate (3.32). Locator: Ambrosio–Gigli Theorem 3.25, p. 64, with Assumption 3.24 supplied by 9.4.
2. *PDE identification.* For `Φ = Ent + ∫V`, with `V ∈ C²(ℝⁿ)` and `Hess V ≥ λ`, the limit solves `∂ₜρ = Δρ + div(ρ∇V)` in distributions. Locator: Theorem 3.35, p. 74, Propositions 3.36 and 3.38, pp. 74–75, and the example on p. 76 (lines 3827, 3881, 3934, 3967–3974). The power-law energies are 11.8's tiers.

*Needs:* Layers 9.4, 10.3, 10.5, 11.2 and 11.4–11.6.

**Check.** For `Φ(ν) = ∫ x²/2 dν` on `ℝ` and `μ₀ = δ_a` (`λ = 1`), 11.6's steps are `δ_{a(1+τ)^{-k}}`. At `t = kτ` fixed they converge to `δ_{ae^{-t}}`, which is the `EVI_1` solution (10.3's first Check). The `W₂` gap `|a|·|e^{-t} − (1+t/k)^{-k}|` tends to `0`.

## R03 (P2) — 6.14: the README narrows FKM's (B2)s to the target and does not state the density hypotheses

**Location.** `README.md:2490–2494`: "A3w, and strong target `c*`-convexity conditions (B0--B3 and B2s); on open `U' ⊆ U`, both density ratios are essentially bounded in the theorem's stated domains … with the exponent's dependence recorded."

**Claim.** (B2)s is strong convexity on the target side only, and the density hypotheses are left to the source.

**Witness.** In Figalli–Kim–McCann, arXiv:1107.1014v1, (B2)s requires both `U_ỹ = −D_y c(U,ỹ)` and `V_x̃ = −D_x c(x̃,V)` to be strongly convex (lines 169 and 184, p. 5). Their Theorem 2.1 (lines 214–222, p. 6) assumes `f⁺/f⁻ ∈ L∞(U×V)` and `f⁻/f⁺ ∈ L∞(U′×V)`. It gives an exponent depending only on `n` and `‖log(f⁺/f⁻)‖_{L∞(U′×V)}`. For `c = ‖x−y‖²/2`, `U_ỹ = U − ỹ`, so a square source with a disc target satisfies the README's wording and fails (B2)s. Loeper's maximum principle and the necessity of A3w also have no locator.

**Repair.** Replace the passage with: "`c ∈ C⁴(cl(U×V))` satisfies (B0)–(B3) and (B2)s, the last asking that both `U_ỹ` and `V_x̃` be strongly convex for every `(x̃,ỹ)`. The densities satisfy `f⁺/f⁻ ∈ L∞(U×V)`, and `f⁻/f⁺ ∈ L∞(U′×V)` for an open `U′ ⊆ U`. Then the optimal map is locally Hölder and one-to-one on `U′`, with exponent depending only on `n` and `‖log(f⁺/f⁻)‖_{L∞(U′×V)}` (Figalli–Kim–McCann, arXiv:1107.1014v1, Theorem 2.1, p. 6)." For Loeper, cite the De Philippis–Figalli survey with its hypotheses (C0)–(C3): Theorem 4.5 for the discontinuous maps when a `c`-subdifferential is disconnected, and Theorem 4.6 for the equivalence of the maximum principle (4.12) with MTW(0) (`depf-survey` lines 1712 and 1720, p. 38). These are also the hypotheses of the FKM headline that `Suggested.lean:84–86` plans to state at main's pin.

**Check.** The square source above is excluded by (B2)s as rewritten. A disc source and a disc target for the quadratic cost satisfy every hypothesis.

## R04 (P3) — implemented targets are still uncited, starting with the sampled 4.2

**Location.** `README.md:1823–1824`: "Under `MeasurableSingletonClass Y`, for a point atom `x`, every transport map satisfies `ν({T x}) ≥ μ({x})`". The *Needs:* line (`:1833`) names only Mathlib.

**Claim.** Scope (`:61–64`) and `:594–595` say that implemented targets cite their Tau Ceti declarations.

**Witness.** Tau Ceti at `2fd255d` implements 4.2 in full:
- `ProbabilityTheory.HasLaw.measure_singleton_le` (`TauCeti/Probability/HasLaw.lean:124`, with no hypothesis on `Y`);
- `ProbabilityTheory.HasLaw.exists_measure_atom_le_measure_singleton` (`:97`, standard Borel `Y`);
- `AEMeasurable.exists_map_restrict_eq_smul_dirac_of_atom` (`TauCeti/MeasureTheory/Measure/Atom.lean:105`);
- `MeasureTheory.Measure.exists_measurePreserving_of_nullSingleton` (`TauCeti/MeasureTheory/Measure/AtomlessStandardBorel/Transport.lean:46`);
- `TauCeti.mongeCost_eq_top_of_measure_atom` (`TauCeti/MeasureTheory/OptimalTransport/Monge.lean:485`).

Other implemented results are also uncited:
- the maximum forms of 3.6 (`:1709–1714`): `TauCeti.wassersteinEDist_top_prod` and `TauCeti.wassersteinEDist_top_finset_sum_smul_le` (`…/Wasserstein/Infinity/Operations.lean:45, 101`);
- the bounded-Lipschitz variant of 3.8 (`:1762`): `TauCeti.tendsto_probabilityMeasure_iff_iSup_abs_integral_sub_integral_boundedLipschitz` (`…/Wasserstein/BoundedLipschitz.lean:131`).

**Repair.**
1. In 4.2, delete "Under `MeasurableSingletonClass Y`": the library proves the point bound without it.
2. Cite the five declarations in 4.2's text and *Needs:* line, and add them to the Layers 4–6 bullet of "From Tau Ceti".
3. Do the same for 3.6 and 3.8 in the Layer 3 bullet.
4. Check the other uncited files for README targets they implement: among them `Cost/Product.lean`, `Wasserstein/Measurable.lean`, `Wasserstein/Monge.lean` and `L1Convergence.lean`.

**Check.** For `δ₅ → (δ₀+δ₁)/2`, `measure_singleton_le` gives `1 = δ₅{5} ≤ ν{T 5} ≤ 1/2`, which is impossible. So there is no transport map, as 0.2's second Check says.

## R05 (P3) — 11.9 has no locator, and "confining" and "where EVI applies" are undefined

**Location.** `README.md:3670–3677`: "contraction/uniqueness where EVI applies … the Ornstein--Uhlenbeck/Fokker--Planck semigroup on `ℝⁿ` for a confining potential `V`, with generator `Δ - ∇V·∇`".

**Claim.** The hypotheses on `V` are fixed and the agreement theorems are sourced.

**Witness.** `V = (x²−1)²` on `ℝ` is confining with `Hess V = 12x² − 4 ≥ −4`. The text does not say whether EVI "applies" here, or with which `λ`. No theorem in 11.9 has a locator.

**Repair.** State the hypotheses as `V ∈ C²(ℝⁿ)` with `Hess V ≥ λI`, and `∫ e^{−V} < ∞` where the invariant law is used. Then state:
- the `W₂` gradient flow of `Ent + ∫V` is the `EVI_λ` flow;
- it solves `∂ₜρ = Δρ + div(ρ∇V)`;
- it contracts `W₂` by `e^{−λt}`.

Locators: Ambrosio–Gigli Theorem 3.35, p. 74; the Fokker–Planck example and contraction on p. 76 (lines 3967–3974); (3.31) of Theorem 3.25, p. 64. Say that `Δ − ∇V·∇` generates the Markov semigroup on functions, dual to the density flow. Then either define "confining" or delete the word.

**Check.** `V = x²/2` (`λ = 1`) gives the Ornstein–Uhlenbeck flow with invariant `N(0,1)` and contraction `e^{−t}`. `V = (x²−1)²` gives `λ = −4` and the bound `e^{4t}`.

## R06 (P3) — 12.4 and 12.5 do not give the theorem numbers they prove

**Location.** `README.md:3810–3812`: "define population Wasserstein barycenters and prove the Le Gouic--Loubes existence theorem". 12.4 (`:3799–3806`) has no locator.

**Claim.** Every theorem carries a locator.

**Witness.** In Le Gouic–Loubes, arXiv:1506.04153v2:
- Theorem 2, p. 6 (lines 214–220): existence for `P ∈ W_p(W_p(E))`, `E` separable, locally compact and geodesic;
- Theorem 3, p. 7 (lines 256–262): precompactness of barycenters of `P_j → P`, with every limit a barycenter of `P`;
- Lemma 7 and Theorem 8, p. 11 (lines 410, 430): cited in 12.3 without a page.

**Repair.** In 12.5 add "(Le Gouic–Loubes, arXiv:1506.04153v2, Theorem 2, p. 6, on separable locally compact geodesic spaces; the proper-space form is Tau Ceti's)". In 12.4 add "(their Theorem 3, p. 7)", and give 12.3's citations the page `p. 11`.

**Check.** 12.5's first Check is an instance of Theorem 2. For `P = (δ_{δ₀}+δ_{δ₂})/2` at `p = 2`, the functional is `∫(x−1)² dν + 1`, minimized at `δ₁`.

## R07 (P3) — the References list two works twice

**Location.** `README.md:5127–5130` and `:5147–5150`.

**Claim.** Each work appears once in References.

**Witness.** Both bullets cite Beiglböck–Schachermayer (arXiv:0807.1468) and Beiglböck–Léonard–Schachermayer. The first links EuDML 285844 for the second paper; the other bullet links arXiv:0911.4347.

**Repair.** Delete `:5127–5130`. Keep `:5147–5150`, adding the EuDML link there if wanted.

## Verified sound

**Gate, build, dependency check.**
- The worker's gate on this head: every counter `0`, `build=0`, `OK`.
- `lake env lean` on `Suggested.lean` at the branch pin (Mathlib `6b7abb3`, Tau Ceti `a91d3aa`): exit 0 in 28 s, with exactly eight `declaration uses 'sorry'` warnings, at `:115, :139, :168, :204, :228, :252, :269, :291`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/OptimalTransport'` is empty.
- The dependency check printed `depcheck: 233 roadmaps, 2263 edges, 0 problem(s)`, with no UPWARD or CYCLE line.

**Signatures and padding.**
- A scratch copy with `#check @name` for all eight declarations elaborated with exit 0. The file has no `variable` block, so no binder can be lost. Each elaborated type matches its README statement and hypotheses, including the continuous densities of De Philippis–Figalli Theorem 1.3 (`depf-partial` line 67) and Nutz's `R ∼ μ⊗ν` with separable marginals (`nutz-eot` lines 616, 646–656).
- On a second scratch copy every `sorry` was replaced by `first | rfl | infer_instance | (simp; done) | trivial | exact ⟨_, rfl⟩ | (intros; exact ⟨_, rfl⟩) | (intros; simp_all; done) | aesop`. All eight fail (eight errors), so no headline closes in one tactic.
- The third docstring list is correct: none of `relaxedTransportCost`, `SatisfiesWeakMTW`, `IsCConvexSet`, `boltzmannEntropy`, `IsEVISolution`, `sinkhornDivergence`, `cheegerEnergy`, `CurvatureDimensionInfinity` or `GromovWassersteinSpace` is defined at `a91d3aa`. All of them are defined at `2fd255d`.
- Mathlib at `6b7abb3` has `IsPreBrownianReal` and `IsBrownianReal` but no existence of Brownian motion, so the "not statable" entry for 13.12–13.13 stands.

**Library declarations opened (paths under `TauCeti/`, lines at `2fd255d` unless noted).**
- `MeasureTheory/OptimalTransport/Coupling.lean:120, 516, 656`;
- `…/Cost/BoundedBelow.lean:239, 408, 416`;
- `…/Compactness.lean:86–98, 176–198`;
- `…/Duality/SchachermayerTeichmann.lean:65–107`;
- `…/Wasserstein/PopulationBarycenter.lean:72, 301`;
- `…/Wasserstein/Infinity/Operations.lean:45, 101`;
- `…/Wasserstein/BoundedLipschitz.lean:53, 90, 131`;
- `…/Monge.lean:485`;
- `Probability/HasLaw.lean:97, 111, 124`;
- `MeasureTheory/Measure/Atom.lean:73, 105`;
- `MeasureTheory/Measure/AtomlessStandardBorel/Transport.lean:46, 59`.

Mathlib at `6b7abb3`:
- `NullSingletonClass` (`MeasureTheory/Measure/Typeclasses/NullSingletonClass.lean:30`);
- `klDiv` (`InformationTheory/KullbackLeibler/Basic.lean:56`);
- `LocallyLipschitzOn.exists_lipschitzOnWith_of_compact` (`Topology/Algebra/MetricSpace/Lipschitz.lean:58`);
- `Measure.disintegrate` (`Probability/Kernel/Disintegration/Basic.lean:62`);
- `IsPreBrownianReal` and `IsBrownianReal` (`Probability/BrownianMotion/Basic.lean:75, 302`).

All 94 dotted Mathlib-style names in the README have a declaration of that name at `6b7abb3`, apart from the Tau Ceti and module names.

**Cross-roadmap citations resolved on main (`71c8f21`).**
- Hopf–Rinow and OneParameterSemigroups Part A are under `Completed/` (`OneParameterSemigroups/README.md:90`).
- RiemannianGeometry: R1 at `:186`, R4 at `:629`, with item 6's cut locus at `:719`.
- DifferentialGeometry 12.2–12.5 at `:918–930`.
- PDE §1.6, §1.7, §2.4 and §6.3 at `:905, :996, :1241, :2309`.
- GeometricMeasureTheory G2 is cited only.
- The consumers RandomMatrices, StandardDistributions and VonNeumannAlgebras cite OptimalTransport Layers 0–3, 2 and 8.2, all of which exist.
- `overlaps.md` reports no conflicting head and no dropped id.
- I grepped every open head for "Wasserstein", "Sinkhorn", "Brenier", "Benamou" and "Kantorovich". The hits are CompactQuantumMetricSpaces, ManifoldOptimization, RandomMatrices and IncompressibleFlows, and all of them only consume. CompactQuantumMetricSpaces cites Tau Ceti's compact Kantorovich–Rubinstein declarations; ManifoldOptimization cites "Layer 13B item 8", which is 13.8 here. No second owner.

**Seeded sample, read at the text (15 targets).**

| Target | Locator | Result |
|---|---|---|
| 0.1 | Tau Ceti `IsCoupling`, `Coupling` | `structure IsCoupling` (`Coupling.lean:120`) is the two marginal equalities; the zero-mass branch of `isCoupling_inv_smul_prod` (`:516`) matches the README |
| 1.1 | Tau Ceti `transportCostBddBelow` | as described; split independence is `transportCostBddBelow_congr_lowerBound` (`Cost/BoundedBelow.lean:408`) |
| 1.2 | Tau Ceti `isClosed_setOfPred_isCoupling` | hypotheses `OpensMeasurableSpace` on factors and product plus `T1Space (ProbabilityMeasure _)` (`Compactness.lean:86–98`), as stated |
| 2.7 | Schachermayer–Teichmann Prop. 1 p. 3, Thm 2 p. 7, Cor. 1 p. 7, Ex. 1 p. 8 | correct (`schachermayer-teichmann` lines 157, 315, 351–356, 362); Tau Ceti statement matches; source misprint below |
| 4.2 | none | R04 |
| 6.5 | Tau Ceti `mongeAmpereMeasure_eq_of_hasLaw` | statement and Checks hold |
| 6.14 | FKM Thm 2.1 | R03 |
| 8.9 | Ambrosio–Gigli Prop. 2.30 p. 45 | number and page correct (line 2346); route and generality: R01 |
| 11.7 | none | R02 |
| 11.9 | none | R05 |
| 12.5 | Tau Ceti `WassersteinSpace.exists_isFrechetBarycenter` | hypotheses (proper metric, Borel, `1 ≤ p < ∞`, finite `p`-th moment) match (`PopulationBarycenter.lean:72, 301`); locator: R06 |
| 14.6 | Lott–Villani Def. 0.10, Thm 0.12, 7.3; Sturm I Thm 4.9; Sturm II Thm 1.7 | correct (`sturm-mms-i` line 1428; `sturm-mms-ii` lines 385–395) |
| 15.1 | Tau Ceti `AreWeaklyIsomorphicKernels` | definitions only; Checks hold |
| 16.3 | none | organizational; no mathematical claim |
| 16.5 | none | organizational; the Layer 16 Examples recompute |

**Other locators read (40).**
- De Philippis–Figalli survey: Theorems 2.8 and 2.9 (p. 8), 2.14 (p. 15), 2.19 and 2.20 (p. 18), 2.21 (p. 19), 3.1 (p. 23), 3.2 (p. 24), 3.3 (pp. 25–26, third assertion p. 26), 3.6 (p. 30); (C0)–(C3) (p. 29), (3.11) (p. 30), Step 4 (p. 32), (4.4) (p. 33), Definition 4.1 (p. 34), Theorem 4.11 (p. 45). These are `depf-survey` lines 280, 293, 614, 725, 734, 749, 954, 1028, 1098–1107, 1275–1278, 1310, 1326, 1422, 1497, 1506, 2119.
- De Philippis–Figalli 2015, Theorems 1.3 and 1.4, p. 82 (`depf-partial` lines 61–78).
- Figalli 2007, Theorem 1.1 and Remark 1.2 with the Lagrangian `(1+‖v‖²)/2`, pp. 3–4 (`figalli-noncompact` lines 112, 133, 147–151).
- Hartenstine, Theorems 1.1 (p. 1) and 2.1 (p. 2) (lines 31, 78).
- Álvarez-Esteban et al., Theorem 4.2 (p. 12) and Corollary 4.5 (p. 14) (lines 625, 773).
- Peyré–Cuturi: Remark 2.30 and (2.34)–(2.36) (pp. 31–32), (7.7) (p. 104), Remark 9.6 (p. 143) (lines 1422–1439, 4443, 6007; printed page = PDF page − 4).
- Ambrosio–Gigli–Savaré, *Calculus and heat flow*, Definition 7.1 and (7.3) (p. 55), (7.5)–(7.7) (p. 56), Theorem 9.3 (p. 68) (`ags-calculus` lines 2966, 2986, 2998, 3011, 3632).
- Savaré, Corollary 4.3 and Theorem 4.4 (p. 20) (lines 1350, 1365).
- Lisini 2016, Theorem 3.1, Proposition 4.1 and Theorem 4.2, with `ψ∞` admissible (`lisini-orlicz` lines 199, 476, 1181, 1229).
- Nutz, Theorem 2.1 and its separability footnote (p. 16) (lines 641–656).
- Ambrosio–Gigli, Assumption 3.24 and Theorem 3.25 (p. 64), Theorem 3.35 (p. 74) (lines 3340, 3358, 3827).

**Adversarial table** (sample, headlines, and every target a finding touches).

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| H1 Gangbo–McCann | `d = 0`; `r < 0` in `h_cone`; `h = x²/2`, `U[0,1] → U[1,2]` | point space, `T = id`; cone empty; `T = x+1`, cost `1/2` | holds |
| H2 Caffarelli | `X = (0,1)`, `Y = (0,2)`, `f = 1`, `g = 1/2`, `l = 1/2`; `X = ∅` | `T = 2x`, `α = 1`; the probability instance is false, so vacuous | holds |
| H3 De Philippis–Figalli | `c = 2 − ⟨x,y⟩` on unit balls; `c ≡ 0` | `−Dₓc = y`, `D_yDₓc = −id`; `−Dₓc ≡ 0` not injective | twist excludes `c ≡ 0`; matches Thm 1.3 incl. continuity |
| H4 McCann | `M = ℝ`, `U[0,1] → U[1,2]` | `T = x+1`, cost `1/2`; FF Thm 4.3 (`r = 2`) gives the map, Thm 4.2 graph concentration | holds |
| H5 Figalli | `U[0,1] → U[1,2]`, `c = \|x−y\|` | `x+1` and `2−x` both cost `1` | existence only, as stated |
| H6 Agueh–Carlier | segments `{(s,0)}`, `{(0,t)}` in `ℝ²`; Cantor law on `ℝ` | every coupling optimal, two midpoint laws, value `(1/4)(1/3+1/3) = 1/6`; segments have dimension `1 = n−1`, excluded | holds |
| H7 Gaussian | `n = 1`, `C = (1,4)`, `w = (1/2,1/2)` | `S = 9/4`: `(1/2)(√(9/4) + √(9)) = 9/4` | holds |
| H8 Schrödinger potentials | `μ = ν = (δ₀+δ₁)/2`, `R = μ⊗ν` | `dπ/dR = 1`, pairs `(a,−a)` | holds |
| 0.1 | `δ₀`, `2δ₀`; `2δ₀`, `2δ₁` | masses `1 ≠ 2`; `(μ⊗ν)/2 = 2δ_{(0,1)}`, raw `4δ_{(0,1)}` | holds |
| 1.1 | `δ₀`, `δ₂`, `(x−y)²`; `c ≡ −1` | `4`; splits `(−1/2,−1/2)`, `(−1,0)` give residual `0`, value `−1`; `0·∞ = 0 ≠ ∞` | holds |
| 1.2 | `μ = ν = (δ₀+δ₁)/2` | `π_s`: marginal at `0` is `s + (1/2−s) = 1/2`, `s ∈ [0,1/2]` | holds |
| 2.5 | BLS Ex. 1.1; `δ₀`, `δ₀`, `c ≡ 5` | `∫(x−y)dπ = 0` ⇒ diagonal, `P = 1`; shift plan mass `1−ε`, `P^ε = 0`; `P^ε = 5(1−ε)` → `5` | holds |
| 2.7 | diagonal and anti-diagonal on `{0,1}`; rotation example | `0 ≤ 2`; `2 ≤ 0` false; `k·α ≡ 0 mod 1` forces `k = 0`, so cyclic cost `2n` vs `1` diagonal | holds |
| 3.6 Checks | `(δ₀+δ₁)/2`, `δ₀`; `∑ 2^{-k}δ_k` | `W_p = (1/2)^{1/p} ↑ 1`; `W_∞ = ∞` to finite support, first moment `2` | hold |
| 4.2 (R04) | `δ₅ → (δ₀+δ₁)/2` | `1 ≤ ν{T5} ≤ 1/2` impossible | statement holds; uncited, hypothesis unneeded |
| 5.7 | `ℝ`; segment law on `{0}×[0,1]` | `c−c` sets are points; cost `≥ 1/2`, map would need density `1/2 = 1_{σ=1}` | holds |
| 5.9 Checks | `v = x`; `P = 2x dx`, `v = x^{-1/2}` | `(1/(p+1)+1)^{1/p}`; `4/3 + 2 = 10/3`, `∫\|v'\| dx = ∞` | hold |
| 6.5 | `u = x²`, `g = 1/2` on `[0,2]`; `u = \|x\|` | `∫_{2E} 1/2 = \|E\|`; `MA({0}) = 2` | holds |
| 6.7 | two half-discs | `∂u(0,x₂) = [−1,1]×{x₂}`, mass `2·2 = 4` on a null segment | holds |
| 6.8 Checks | `‖x‖²/2`; `\|x\|`, `p ∈ (−1,1)` | radius `√(2h)`; `(−h/(1+p), h/(1−p))` | hold |
| 6.13 | `c = −2⟨x,y⟩`, `u = ‖x‖²` | `\|∂ᶜu\|(E) = \|E\|` vs `2ⁿ\|E\|`, factor `\|det(−2I)\| = 2ⁿ` | holds |
| 6.14 (R03) | quadratic cost, square `U`, disc `V` | `U_ỹ = U − ỹ` square: not strongly convex | README gloss admits it; source excludes it |
| 8.8 Checks | `T = 2x` on `U[0,1]` | `v_t = y/(1+t)`, action `1/3 = W₂²` | hold |
| 8.9 (R01) | circle `δ_{tθ}`; `δ₀ → δ_{3π/2}` | `\|μ̇\| = \|θ\| = ‖v‖`; `(3π/2)² ≥ (π/2)²` | formula true; lower-bound input misattributed |
| 9.4 Checks | `μ = δ₀`, `δ_{−1}`, `δ₁` | `(2t−1)² = 1 − 4t(1−t)`; doubled remainder false at `1/2` | hold |
| 9.6 Checks | `δ₀`, `δ₂`; antitone `Q(1−s)` | barycenter `δ₁` value `1` vs mixture `2`; `L²` gap `2` | hold |
| 10.3 Check | `Φ = λx²/2` | `(1/2)(x−y)²' + (λ/2)(x−y)² = (λ/2)(y² − x²)` | holds |
| 11.2 Checks | uniform `[0,2]`; `μ = 2m_a`; `1/(x log²x)` | `−log 2`; both sides `2 log 2 − 1`; `Ent = −∞`, moment `∞` | hold |
| 11.7 (R02) | `Φ = ∫x²/2`, `δ_a` | `(1+t/k)^{-k} → e^{-t}` | no statement to test |
| 11.8 Checks | `n = 1`, `m = 1/4`; `n = 2`, `m = 1/2` | mass `1`, moment `5`, `∫ρ^{1/4} = ∞`; moment `∫dr/(r log²r) = 1`, `∫ρ^{1/2} = ∞` | hold |
| 11.9 (R05) | `V = x²/2`; `V = (x²−1)²` | `λ = 1`; `Hess V = 12x² − 4 ≥ −4` | hypotheses unstated |
| 12.5 | `(δ_{δ₀}+δ_{δ₂})/2`, `p = 2`, `p = 1` | `∫(x−1)²dν + 1`; `(\|x\|+\|x−2\|)/2 ≥ 1` on `[0,2]` | holds |
| 13.1 Check | `(δ₀+δ₁)/2`, `\|x−y\|`, `ε = 1` | `π₀₀ = 1/(2(1+e^{-1}))`, row sum `1/2` | holds |
| 13.7 Checks | `[[2,1],[1,2]]`; `[[1,1],[0,1]]` | `[[1/3,1/6],[1/6,1/3]]`; limit `[[1/2,0],[0,1/2]]` | hold |
| 13.13 Check | `π = N(0,I₂)`, `ε = 1` | `1 − log(2πe) + (1/2)log 2π = −(1/2)log 2π`, direct integral equal | holds |
| 14.6 | weighted `ℝ`, `V = x²/2`; Sturm II (ii) | `Ric+Hess V = 1`, `Ric_N = 1 − x²/(N−1)`; `Hess(e^{−V/N′}) ≤ −(K′/N′)e^{−V/N′}` ⇔ `Hess V − dV⊗dV/N′ ≥ K′` | holds |
| 15.1–15.2 | two-point spaces `a`, `b`; `a = 1`, `b = 0`, `p = 1` | `2^{-1/p}a`; `1/2` vs `1/4` | hold |
| 16 Examples | `δ₀`, `δ₂`, `(x−y)²` | cost `4`, `W₂ = 2`, barycenter `1`, radius `1` | hold |
| Supplier KL example | one point, `μ = 2δ`, `κ = 2δ`, `ν = η = δ` | `8 log 2 − 3` vs `6 log 2 − 3` | holds |

## Not verifiable

- **Villani 2009** (Theorems 5.10 and 6.18, Particular Case 5.16, Chapters 10 and 29) and **Villani 2003** (Theorems 1.14 and 2.12): paywalled, not in the sources cache.
- **Ambrosio–Gigli–Savaré 2008**, **Kechris** and **Huang**: settled as uncertified and cited by locator only.
- **Loeper 2009**, **Ma–Trudinger–Wang 2005**, **Caffarelli 1990/1992**, **Jordan–Kinderlehrer–Otto 1998**: publisher pages only. None is cited by theorem number except through the survey.
- Not re-read this round, because they lie outside the sample: **Pratelli 2007** (Numdam), **Gangbo–McCann 1996**, **Agueh–Carlier 2011**, **Léonard 2012** (arXiv:1011.2564), **Bertrand**, **Gigli–Rajala–Sturm** and **Cavalletti–Mondino**.
- **FKM** (arXiv:1107.1014v1) and **Le Gouic–Loubes** (arXiv:1506.04153v2) were read from arXiv into a scratch copy of the manifest. The roadmap's `sources.toml` records neither.
- **Elaboration at main's pin** was not run. The object files of the Tau Ceti modules at `2fd255d` are missing, and this review runs Lean only from the pull-request worktree.

## Source issues

- **Misprint** in schachermayer-teichmann at Example 1, p. 8: the source says the cost is `2` where `x` equals `y` times `α`; it should be `2` where `y` equals `x` times `α`, which is what Γ₂ and equation (4) use; affects nothing.
