# Review of OptimalTransport (pull request #950 at e67f050)

**Verdict:** needs changes

## Status of the previous review's findings (read at 9634d34)

| Id | Status at e67f050 | Evidence at this head |
|---|---|---|
| R01 (P2, headlines statable at main's pin absent; unclassified summits) | partly | Items 2 and 3 are done: the docstring now lists fifteen headlines as proved (`Suggested.lean:23–52`) and names 6.10, 8.9 and 14.8 as not statable (:57–70). Item 1 is not: the branch still pins Tau Ceti `a91d3aa`, and the six headlines are moved to a third list "stated on carriers of Tau Ceti that the Tau Ceti pinned by this file's manifest does not contain" (:72–90) instead of being stated. See R01. |
| R02 (P2, fast-diffusion range) | repaired | `README.md:2557–2572` states `max(1-1/n, n/(n+2)) < m < 1`, the Hölder bound, sharpness, and the endpoint only for `n ≥ 3`; the two negative controls are Checks (:2591–2599). I recomputed all of them (table below). |
| R03 (P3, declarations absent at the branch pin) | not repaired | `lake-manifest.json` is unchanged (Tau Ceti `a91d3aa`, Mathlib `6b7abb3`). This head adds four more contract bullets, two of which (`TauCeti.mongeCost_eq_transportCost_of_continuous`, `TauCeti.GromovWassersteinSpace`) are also absent at that pin. See R01 and R02. |
| R04 (P3, sampled locators) | repaired | 0.4 (:608–609), 8.2 (:1930–1934), 10.3 (:2298–2301), 10.4 (:2319–2323), 11.6 (:2530–2535), 13.6 (:2989–2992), 13.9 (:3051–3054), 13.12 (:3113–3116), the VMO tier of 6.9 (:1599–1601) and the McCann docstring (`Suggested.lean:193`) now carry locators. I checked each against its text except Kechris and Huang (paywalled, cited by locator). One of the new sentences has a factor-two slip: R04. |
| R05 (P3, 13.13 negative part of the entropy) | repaired | `README.md:3144–3148` now says finite cost alone does not bound the negative part and second moments of both marginals do; the counterexample is a Check (:3171–3174). |

## R01 (P2) — The docstring's three lists use two different pins, so headlines are neither stated nor proved at either one

Location: `TauCetiRoadmap/OptimalTransport/Suggested.lean:23–24`, "The following headline theorems of `README.md` are proved in the pinned Tau Ceti, so they are not restated here", against :72–74, "the Tau Ceti pinned by this file's manifest does not contain".

Claim: every headline is stated, proved at the pin, or not statable at the pin.

Witness: at the branch pin `a91d3aa`, nine of the fifteen "proved" declarations do not exist: `isOptimalCoupling_iff_exists_isCyclicallyMonotone`, `mongeCost_eq_transportCost_of_continuous`, `exists_hasLaw_and_ae_eq_gradient_comp`, `exists_map_IccExtend_eq_lintegral_curveAction_eq`, `isLeast_lintegral_isContinuityEquation`, `klDiv_compProd_eq_add_lintegral`, `WassersteinSpace.exists_isFrechetBarycenter`, `GromovWassersteinSpace.instMetricSpace`, `exists_isMinOn_finiteGromovWassersteinBarycenterObjective` (no file of that Tau Ceti contains the names).

The lists contradict each other on one object: :48–49 says `TauCeti.GromovWassersteinSpace.instMetricSpace` is proved in the pinned Tau Ceti, and :89–90 says the pinned Tau Ceti lacks `TauCeti.GromovWassersteinSpace`.

So the file fails the headline rule at either pin.

- At `a91d3aa`: Pratelli's theorem (4.3) is statable (`TauCeti.mongeCost`, `Monge.lean:170`, and `TauCeti.transportCost` exist) and the Schachermayer–Teichmann equivalence (2.7) is statable (`TauCeti.IsCyclicallyMonotone`, `Cost/CyclicalMonotonicity.lean:76`). Neither is proved there, stated here, or listed as not statable. The same holds for polar factorization and the conditional chain rule, whose carriers are Mathlib's.
- At main's pin `2fd255d`, where the first list is true: the six headlines of the third list are statable and absent (2.5, 6.14, 11.7, 13.4, 14.7, 15.5), as the pull request's own description says.

Repair (unchanged from the previous review, and the only one that does not restate what Tau Ceti already proves):

1. Merge `origin/main` into the branch. The pins become Tau Ceti `2fd255d` and Mathlib `1b1ccf4`. The five imports of `Suggested.lean` exist there.
2. Rebuild `TauCetiRoadmap.OptimalTransport.Suggested` at that pin.
3. State the six headlines of the third list on the carriers the docstring already names, and delete the third list.

Check on the instances that refuted the head: at `2fd255d`, `TauCeti/MeasureTheory/OptimalTransport/Pratelli.lean:337` is `mongeCost_eq_transportCost_of_continuous` and `…/GromovWasserstein/Space.lean:162` is `GromovWassersteinSpace.instMetricSpace`, so the first list becomes true and the contradiction disappears.

## R02 (P3) — The README's Tau Ceti contracts name declarations and files that the branch's pinned Tau Ceti does not have

Location: `TauCetiRoadmap/OptimalTransport/README.md:363–364`, "The following theorems of Tau Ceti prove targets of the layers below, which cite them; each is consumed with exactly the hypotheses recorded here."

Claim: the cited declarations exist, in the cited files, at the pin of this branch's manifest.

Witness: 27 of the README's backticked `TauCeti.*` declarations are absent at `a91d3aa` and present at `2fd255d`. Examples: `TauCeti.mongeCost_eq_transportCost_of_continuous` (:391, no `Pratelli.lean` at the pin), `TauCeti.GromovWassersteinSpace` (:435), `TauCeti.klDiv_compProd_eq_add_lintegral` (:413), `TauCeti.mongeAmpereMeasure` (:1452), `TauCeti.descendingSlope` (:2250).

Paths differ too: `…/Existence/Basic.lean` (:366) is `Existence.lean:227` at the pin, `TauCeti/Data/Matrix/Scaling/Basic.lean` (:351) is `Scaling.lean:922`, `…/Entropic/Basic.lean` (:433) is `Entropic.lean:301`.

Repair: the merge of R01. No README sentence needs to change: every one of these names and paths resolves at `2fd255d` (I resolved all 64 backticked `TauCeti.*` names of the folder at both pins). Check: after the merge, `…/OptimalTransport/Existence/Basic.lean:226` is `exists_isOptimalCoupling`, as :366 says.

## R03 (P3) — 13.13 writes the entropy against the infinite reversible reference as `klDiv`, which Mathlib defines as a nonnegative quantity with a different value

Location: `TauCetiRoadmap/OptimalTransport/README.md:3150`, "`ε klDiv(π,R^ε₀₁) = (1/2)∫‖x-y‖²dπ + ε Ent_{vol⊗vol}(π) + ε(n/2)log(2πε)`", and the Check at :3166–3170, "`klDiv(π,R¹₀₁) = … = -(1/2)log(2π)` … It is negative because the reference has infinite mass."

Claim: the left side is the `klDiv` of the Conventions (:216–224, "Mathlib's nonnegative `InformationTheory.klDiv`").

Witness: Mathlib's `klDiv μ ν` is `ENNReal.ofReal (∫ llr μ ν ∂μ + ν.real univ - μ.real univ)` (`Mathlib/InformationTheory/KullbackLeibler/Basic.lean:56–59`). For the Check's `π = N(0,I₂)` and the infinite `R¹₀₁`, `ν.real univ = 0`, so it is `ofReal(-(1/2)log(2π) - 1) = 0`, not `-(1/2)log(2π) ≈ -0.919`.

Repair: the mathematics is right for the signed entropy; only the symbol is wrong. In 13.13 (the identity at :3150, the `limsup` and `liminf` at :3155–3156, the guardrail at :3143 and the three Checks) write Layer 11.2's signed functional with the σ-finite reference, `Ent_{R^ε₀₁}(π)`, which 13.12 (:3104–3105) already asks for as "the relative-entropy extension". Keep `klDiv` for finite references, as the Conventions say.

Check: with `Ent_{R¹₀₁}(N(0,I₂)) = ∫ log(dπ/dR¹₀₁) dπ = -(1/2)log(2π) - 1 + 1`, both sides of the identity are `-(1/2)log(2π)`; for `δ_a ⊗ δ_b` the value is `+∞` because `π` is not absolutely continuous, as the third Check needs.

## R04 (P3) — 11.6: the cited inequality gives `2`-convexity of `W₂(μ,·)²` in this README's convention, not `1`-convexity

Location: `TauCetiRoadmap/OptimalTransport/README.md:2533–2535`, "with Definition 3.29 and inequality (3.43), pp. 70--71, for the `1`-convexity of `W₂(μ,·)²` along interpolating curves with base `μ`".

Claim: `W₂(μ,·)²` is `1`-convex in the pinned convention `Φ(γ_t) ≤ (1-t)Φ(γ₀)+tΦ(γ₁)-(λ/2)t(1-t)d(γ₀,γ₁)²` (:210–215).

Witness: `ambrosio-gigli-guide` line 3679, (3.43), has the remainder `-t(1-t)W₂²(ν₀,ν₁)`, that is `λ/2 = 1`. On `ℝ` with `μ = ν₀ = δ₀`, `ν₁ = δ₁`: `W₂²(μ,ν_t) = t² = t - t(1-t)`, equality with `λ = 2`; with `λ = 1` the bound `t - t(1-t)/2` holds strictly, so `1` is not the constant.

Repair: write "for the `1`-convexity of `W₂(μ,·)²/2`", which is what :214–215 and the `(λ+1/τ)`-convexity of the JKO objective at :2527 use. Check: `t²/2 = t/2 - (1/2)t(1-t)`, equality with `λ = 1`, and `Φ + W₂²/(2τ)` gains `1/τ`.

## R05 (P3) — Sampled targets without a locator, and one without a statement

Location: `TauCetiRoadmap/OptimalTransport/README.md:1552–1554` (6.7), "Prove exactly when a Brenier solution is an Aleksandrov solution. Convexity of the target support is load-bearing"; also 4.5 (:1221–1225), 6.6 (:1540–1546), 9.4 (:2170–2173) and 9.6 (:2212–2215).

Claim: every theorem has its exact hypotheses and a locator.

Witness: 6.7 gives no hypotheses, no conclusion and no source. None of the other four sampled subsections cites a theorem, section or page, and 9.4 does not state the constant.

Repair:

- 6.7: state the theorem. For bounded open `X, Y ⊆ ℝⁿ`, densities with `λ ≤ f, g ≤ λ⁻¹` on `X`, `Y`, and `u` the Brenier potential: if `Y` is convex then `∂u(X) ⊆ cl Y` and `λ² Leb ≤ MA_u ≤ λ⁻² Leb` on `X`, so `u` is an Aleksandrov solution (De Philippis–Figalli survey, §3.2, p. 25; `depf-survey` lines 1091–1094, with the inclusion proved inside Theorem 3.3). Add the survey's negative control as a Check: for the disc and the two separated half-discs, `u = ‖x‖²/2 + |x₁|` has `det D²u = 1` almost everywhere while `MA_u` charges the diameter (`∂u(0,x₂)` is a segment of length `2`).
- 9.4: state the inequality with its constant, `W₂²(μ,ν_t) ≤ (1-t)W₂²(μ,ν₀) + tW₂²(μ,ν₁) - t(1-t)W₂²(ν₀,ν₁)` along generalized geodesics based at `μ`, and cite it: Ambrosio–Gigli, *A user's guide*, (3.43), p. 71, for a regular base (`ambrosio-gigli-guide` line 3679), and the Ambrosio–Gigli–Savaré lemma for a general base.
- 4.5, 6.6, 9.6: cite the theorem and page of the text each follows. I could not open a text for these three, so I propose no number.

Check on the instance: for the half-discs `Y` is not convex, so the restated 6.7 does not apply, and `MA_u({x₁=0} ∩ B₁) = 4 ≠ 0 = ∫ f` there, which is exactly the failure the hypothesis excludes.

## R06 (P3) — The supplier contract lists DifferentialGeometry 12.2–12.4, and 8.9 consumes 12.5

Location: `TauCetiRoadmap/OptimalTransport/README.md:461`, "[DifferentialGeometry] …, Layer 12, items 12.2--12.4"; the same range at :72. Against :2091–2092, "The divergence theorem of DifferentialGeometry Layer 12.5".

Claim: the contract names every section consumed.

Witness: DifferentialGeometry on main has "12.5 Divergence theorem and Green" (`TauCetiRoadmap/DifferentialGeometry/README.md:930`), distinct from 12.2–12.4 (:918–923). 8.9's `*Needs:*` (:2095–2096) names the divergence theorem.

Repair: write "items 12.2--12.5" at :72 and :461 and add "the divergence theorem" to the list at :462. Check: 8.9's citation then lies inside the contract.

## Verified sound

**Gate and build.** The worker's gate passes every rule at this head (`build=0`, `depcheck=0`, `outside-folder=0`, `stray-files=0`, `statement-hygiene=0`). `git diff --stat origin/main...HEAD` touches only `TauCetiRoadmap/OptimalTransport/README.md` and `Suggested.lean`. Elaborating `Suggested.lean` at the branch pins gives eight `sorry` warnings and nothing else; the file has a single `import Mathlib`, five `TauCeti.*` imports that exist at the pin, no `set_option`, no sorried data, no `lemma`.

**Signatures.** `#check @name` for all eight declarations in a scratch copy: no `variable` line, every binder explicit, each elaborated type equal to its README statement (5.8, 6.8, 6.15, 7.3, 7.6, 12.7, 12.8, 13.3). The Lean code is unchanged since `9634d34`; only docstrings changed.

**One-tactic probe.** `first | (simp; done) | rfl | infer_instance | exact ⟨_, rfl⟩ | trivial | assumption` closes none of the eight (eight errors, one per theorem). No padding.

**Dependency check.** The command printed:

```
depcheck: 233 roadmaps, 2259 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The roadmap is on main, and every supplier it names is on main.

**Ownership and overlaps.** `overlaps.md` lists no conflicting head, no dropped id and no id that only an open revision defines. No declaration of `Suggested.lean` shares a fully qualified name with another roadmap's file (namespace `TauCetiRoadmap.OptimalTransport`). The citing roadmaps on main still resolve: RandomMatrices (Layers 0–3, :60), StandardDistributions (:2622), VonNeumannAlgebras (Layers 2 and 8.2, :60, :1293), RiemannianGeometry R4.6 (:735).

**Cross-roadmap citations resolved on main (4820485), 14.**
- DifferentialGeometry Layer 12: 12.2 (:918), 12.3 (:920), 12.4 (:923), 12.5 (:930).
- RiemannianGeometry R1 (:186), R2 (:322), R3 (:369), R4 (:629) with item 6 (:717–737), which names "OptimalTransport Layer 7".
- GeometricMeasureTheory G2 (:148).
- PDE §1.1 A1 (:677), §1.6 A6 (:905), §1.7 A7 (:996), §2.4 B11 (:1241), §6.3 F26 (:2309).
- Completed/HopfRinow Layers 1–4 (:264, :427, :451, :495); Completed/OneParameterSemigroups Part A (:90).

**Library declarations opened at the branch pins.**

*Tau Ceti `a91d3aa` (present, 29 of the 64 names of the folder; the carriers and the six "proved" bullets that are true there):* `IsCoupling`, `Coupling` (`Coupling.lean`), `transportCost`, `IsOptimalCoupling` (`Cost/Basic.lean`), `IsKantorovichOptimalTransportMap`, `mongeCost` (`Monge.lean:170`), `wassersteinEDist`, `HasFiniteMoment` (`Wasserstein/Basic.lean`), `riemannianVolume` (`…/VolumeDensity/Volume.lean`), `IsCyclicallyMonotone` (`Cost/CyclicalMonotonicity.lean:76`), `exists_isOptimalCoupling` (`Existence.lean:227`), `transportCost_eq_sSup_ofReal_kantorovichDualValue_integrable_of_lowerSemicontinuous` (`Duality/LowerSemicontinuous.lean:177`: Polish, Borel, lower semicontinuous, integrable dual class, as :369–373 records), `WassersteinSpace.completeSpace` (`Wasserstein/Complete.lean:229`, `p ≠ ∞`), `wassersteinEDist_one_eq_iSup` (`Wasserstein/KantorovichRubinstein.lean:233`), `exists_isKantorovichOptimalTransportMap_gradient` (`Brenier.lean:555`), `existsUnique_isCoupling_klDiv_eq_schroedingerValue` (`Entropic.lean:301`), `Matrix.exists_sinkhorn_scaling` (`Data/Matrix/Scaling.lean:922`).

*Mathlib `6b7abb3` (26 names):* `klDiv` (`KullbackLeibler/Basic.lean:56`, quoted in R03), `klDiv_compProd_eq_add` (`ChainRule.lean:203`), `klDiv_compProd_left` (:181), `klDiv_map_le`, `klDiv_trim_le`, `klDiv_comp_right_le` (`DataProcessing.lean:159/179/185`), `ConvexOn.locallyLipschitzOn_interior` (`Analysis/Convex/Continuous.lean:205`), `LocallyLipschitzOn.exists_lipschitzOnWith_of_compact` (`Topology/Algebra/MetricSpace/Lipschitz.lean:58`), `LipschitzOnWith.ae_differentiableWithinAt` (`Analysis/Calculus/Rademacher.lean:375`), `intrinsicInterior` (`Analysis/Convex/Intrinsic.lean:61`), `MeasureTheory.IsSeparable` (`SeparableMeasure.lean:338`), `multivariateGaussian` (`Gaussian/Multivariate.lean:166`), `IsCadlag` (`Topology/Order/Cadlag.lean:104`), `MeasurePreserving.hasLaw` (`Probability/HasLaw.lean:79`), `Kernel.partialTraj` (`IonescuTulcea/PartialTraj.lean:102`), `Kernel.traj` (`Traj.lean:518`), `traj_map_frestrictLe` (:530), `trajMeasure` (:762), `isProjectiveLimit_nat_iff` (:160), `IsProjectiveMeasureFamily` (`Constructions/Projective.lean:45`), `IsTightMeasureSet.prodMk` (`Measure/Tight.lean:143`), `Subtype.instMeasurableSpace` (`MeasurableSpace/Constructions.lean:184`), `ProbabilityTheory.cdf` (`Probability/CDF.lean:56`), `levyProkhorovEDist` (`LevyProkhorovMetric.lean:53`), `ghDist_le_hausdorffDist` (`GromovHausdorff.lean:184`), `optimalGHInjl`/`optimalGHInjr` (`GromovHausdorffRealized.lean:484/492`).

**Sources: the seeded sample.**

| Target | Text and locator | Result |
|---|---|---|
| 2.4 | Villani 2009, Theorem 5.10 (i), (iii) (paywalled); `transportCost_eq_sSup_…_integrable_of_lowerSemicontinuous` | Book not opened; the pinned theorem's hypotheses match the contract |
| 3.4 | Villani 2009, Definition 6.8, Theorem 6.9 (paywalled) | Not opened; discriminating computation below |
| 4.1 | own definition | Three Checks recomputed below |
| 4.5 | no locator | Statement checked on two instances; locator missing (R05) |
| 5.2 | Mathlib bridge, no source | The three Mathlib lemmas resolve; three Checks recomputed |
| 5.8 | `gangbo-mccann` (author's copy linked at :1426): (H1)–(H3) l.284–293, printed p. 121; Theorem 1.2 l.308–319, pp. 121–122; Remark 4.7 l.970–974 | Supported: (H2) as restated, uniqueness "except when the cost is infinite", and `C^{1,1}_loc` for the rectifiable-null extension |
| 6.6 | no locator | Jacobian identity recomputed; locator missing (R05) |
| 6.7 | no locator; `depf-survey` l.1076–1094, p. 25 | Source supports "Y convex ⇒ Brenier solutions are Aleksandrov"; README states no theorem (R05) |
| 6.15 | `depf-partial` (C0) l.61, Theorem 1.3 l.66–72, printed p. 82; `depf-survey` Theorem 4.11 l.2119, p. 45 | Supported exactly as stated |
| 9.4 | no locator; `ambrosio-gigli-guide` (3.43) l.3679, p. 71 | Supported for a regular base; locator and constant missing (R05) |
| 9.6 | no locator | Quantile identity checked on an instance; locator missing (R05) |
| 13.1 | own definition | Gibbs identity derived and three Checks recomputed |
| 14.2 | own definitions | Three Checks recomputed |
| 15.5 | `bmnn` (JMLR copy linked at :3392): Proposition 36 l.1333, Proposition 38 l.1351, Theorem 39 l.1365 (p. 30), Theorem 45 l.1631 (p. 36) | Supported; the README's restriction to `p < ∞` for separability is needed (Source issues) |
| 16.3 | organisational, no claim | Nothing to verify |

**Locators added since the previous head, each opened.**
- `ambrosio-gigli-guide`: Lemma 2.1 l.1313 (p. 25); Theorem 2.10 l.1719 (p. 31) with its proof calling Lemma 2.11 at l.1726 (p. 32); Lemma 2.11 l.1866 (p. 34); §3.2.2 l.2902 (p. 55); Theorem 3.9 l.2921 (p. 56); Corollary 3.12 l.2979 (p. 57); Assumption 3.24 l.3340 and Theorem 3.25 l.3358–3361 (p. 64, uniqueness for `0 < τ < 1/λ⁻`); (3.43) l.3679 (p. 71).
- `muratori-savare`: Theorem 3.5 l.940 (p. 18).
- `peyre-cuturi`: Theorem 4.1 l.3092 (printed p. 70), Theorem 4.2 l.3133 (p. 71); `(√η-1)/(√η+1) = tanh(log η/4)`, which is `1/3` at `η = 4`.
- `leonard-survey`: Theorem 3.3 l.838 (p. 16), Proposition 4.1 l.1038 (p. 21).
- `chizat-doubly`: §1.1 l.52 and Definition 1.1 l.91 (p. 2), §1.3 l.125 (p. 3), Table 1 l.173 (p. 4).
- `nutz-eot`: Lemma 1.2 l.152, Lemma 1.3 l.172, standing separability l.616, Theorem 2.1 l.641–650 (printed p. 16).
- `sinkhorn-knopp`: Theorem l.58 (p. 344). `lisini-orlicz`: Theorem 3.1 l.476 (p. 677), Proposition 4.1 l.1181 (p. 685), Theorem 4.2 l.1229 (p. 686). `alvarez-esteban-barycenters`: Theorem 4.2 l.625, Corollary 4.5 l.773. `depf-survey`: Theorems 2.14 l.614, 2.19 l.725, 2.20 l.734, 2.21 l.749, 3.3 l.1098.

**Adversarial table (values computed on both sides).**

| Statement | Instance | Values | Result / change |
|---|---|---|---|
| H1 Gangbo–McCann (5.8) | `d=1`, `h=x²`, `U[0,1] → U[1,2]` | `T=x+1`, cost `1`; only optimal plan | holds |
| H1, hypothesis (H2) | `h=‖x‖²`, `z=-p`, `r=1`, `θ=π/2` | on the cone `‖x‖² = ‖p‖² - 2t‖p‖cos + t² ≤ ‖p‖²` iff `t ≤ 2‖p‖cos`; true once `‖p‖ ≥ r/(2cos²(θ/2)) = 1` | the Lean `h_cone` is satisfiable with `R = 1` |
| H1 | `h=\|x\|`, same laws | `x+1` and `2-x` both cost `1` | uniqueness fails without `h_strict` |
| H2 Caffarelli (6.8) | `X=(0,1)`, `Y=(0,2)`, `f=1`, `g=1/2`, `λ=1/2` | `T=2x`, Hölder with `α=1`, `C=2` | holds |
| H2 | `Y=(0,1)∪(2,3)` | `T=2x`, then `2x+1`: jump `1` at `1/2` | `hYc` load-bearing |
| H3 De Philippis–Figalli (6.15) | `c = 2 - ⟨x,y⟩`, unit disc to two separated half-discs, `f=g=1/π` | `-Dₓc = y` injective; `D_yDₓc = -I`; `T = x ± e₁` off the diameter | holds with `S_X` the diameter (null, relatively closed, nonempty), `S_Y = ∅` |
| H3 | `c ≡ 0` | `-Dₓc = 0`, not injective on two points | excluded by `hc_twist` |
| H4 McCann (7.3) | `M=ℝ`, `U[0,1] → δ₂` | `T≡2`, cost `∫₀¹(2-x)²/2 dx = 7/6`; unique coupling | holds |
| H4 | `μ=δ₀` on the circle, `ν` two atoms | no map; value finite | `hμ` load-bearing |
| H5 Figalli (7.6) | `ℝ`, `U[0,1] → U[1,2]`, `c=\|x-y\|` | `x+1` costs `1`; `2-x` costs `∫₀¹(2-2x)dx = 1` | existence holds; no uniqueness claimed (:1842) |
| H6 Agueh–Carlier (12.7) | `n=1`, `U[0,1]`, `δ₂`, weights `1/2` | quantile `(s+2)/2`: barycenter `U[1,3/2]`, objective `7/12` | holds |
| H6 | perpendicular segments in `ℝ²` | every coupling is optimal (`E⟨x,y⟩ = 0`); midpoint laws of `t=s`, `t=-s` both give `(1/4)(1/3+1/3) = 1/6` | excluded: each law gives mass `1` to a set of dimension `1 = n-1` |
| H6 | Cantor law on `ℝ` | `μ(B(x,r)) ≤ C r^{log 2/log 3}`, so positive mass forces dimension `> 0` | satisfies the predicate, singular: Check :2788 true |
| H7 Gaussian (12.8) | 1D, `C=(1,4)`, `w=1/2` | `√S = 3/2`, `S = 9/4`; `(1/2)(3/2) + (1/2)(3) = 9/4` | holds |
| H7 | 1D, `C=(1,0)` | `S = √S/2`, `S = 1/4 > 0` | holds with a degenerate input |
| H8 Nutz (13.3) | two-point uniform, `R=μ⊗ν` | density `1 = e^{0+0}`; other pairs `(a,-a)` | holds |
| H8 | diagonal `R` | `φᵢ+ψᵢ = 0` per `i`: two free constants | excluded by `hμνR` |
| 2.4 | `δ₀`, `(δ₀+δ₁)/2`, `c=\|x-y\|` | primal `1/2`; dual pair `φ(0)=0`, `ψ=(0,1)` gives `1/2` | equality |
| 3.4 | `(1-n⁻²)δ₀+n⁻²δ_n` | weak limit `δ₀`; `W₂² = 1`; `W₁ = 1/n → 0` | the `p`-moment clause discriminates |
| 4.1 | three Checks | Monge `∞` against Kantorovich `1/2`; `∫₀¹x²dx = 1/3`; identity `0` | hold |
| 4.5 | `c=(x-y)²/2`; `c=\|x-y\|` | `Dₓc = x-y` injective, fibre `{x-φ'(x)}`; `Dₓc = ±1`, fibre a ray | twist load-bearing |
| 5.2 | three Checks | `dom(-log) = (0,∞)`; representative `0` on `(0,1)`; segment in `ℝ²`: interior `∅`, intrinsic interior open | hold |
| 6.6 | `u=x²`, `U[0,1] → U[0,2]` | `f = 1 = (1/2)·2 = g(∇u) det D²u`; the reversed formula gives `1/2 = 2` | orientation pinned |
| 6.7 | half-discs, `u = ‖x‖²/2 + \|x₁\|` | `det D²u = 1` a.e.; `∂u(0,x₂)` has length `2`, so `MA_u` of the diameter is `4` | non-convex target: statement needed (R05) |
| 9.4 / 11.6 | `μ=ν₀=δ₀`, `ν₁=δ₁` | `W₂²(μ,ν_t) = t² = t - t(1-t)`: `λ = 2` for `W₂²`, `λ = 1` for `W₂²/2` | 11.6 writes `1` for `W₂²` (R04) |
| 9.6 | `(δ₀+δ₁)/2 → (δ₁+δ₂)/2` | quantiles differ by `1`: `W₂ = 1`, geodesic `(δ_t+δ_{1+t})/2` at distance `t` | holds; matches 9.1's Check |
| 11.8 | `n=1,2,3` | thresholds `max(0,1/3)`, `max(1/2,1/2)`, `max(2/3,3/5)`; `(n-1)(n+2) > n²` iff `n > 2` | range correct |
| 11.8 | `n=1`, `m=1/4`, `ρ=(5/4)\|x\|^{-7/2}` | mass `(5/2)(2/5) = 1`; second moment `5`; `∫ρ^{1/4} = ∞` | excluded, as stated |
| 11.8 | `n=2`, `m=1/2`, `ρ ∝ r^{-4}log^{-2}r` | second moment `∝ [-1/log r]_e^∞ = 1`; `∫ρ^{1/2} ∝ ∫dr/(r log r) = ∞` | endpoint excluded, as stated |
| 13.1 | Gibbs identity; `c≡k`; two-point `c=\|x-y\|`, `ε=1` | `ε KL(π\|R) = ε KL(π\|μ⊗ν) + ε log Z + ∫c dπ`; both sides `k + ε KL`; `s/(1/2-s) = e`, `s = 1/(2(1+e⁻¹))` | hold |
| 13.13 | `π=N(0,I₂)`, `ε=1` | signed value `-(1/2)log(2π)`; `1 - log(2πe) + (1/2)log(2π)` agrees; Mathlib `klDiv` gives `0` | identity true for `Ent`, not for `klDiv` (R03) |
| 13.13 | `(X, X+Z)`, `X ∼ 1/(x log²x)` | cost `1/2`; `Ent(X) = -∫dx/(x log x) - … = -∞` | outside the plan domain, as stated |
| 14.2 | three Checks | Gaussian line: `1 - x²/(N-1)` unbounded below; two points: no `W₂` geodesic from `δ_a` to `δ_b` | hold |
| 15.5 | uniform two-point spaces, distances `a`, `b` | `GW_p = 2^{-1/p}\|a-b\|`; a Cauchy sequence of `a_n` converges iff `ℝ` complete | consistent with Theorem 39 |

## Not verifiable

- Villani, *Optimal Transport: Old and New* (2009): Theorem 5.10 (2.4), Definition 6.8 and Theorems 6.9, 6.18 (3.3, 3.4), Particular Case 5.16 (3.8), Theorem 10.35 (7.3 and the McCann docstring). The book is paywalled and not in the sources cache; the author's preprint page did not answer (TLS error). The number 10.35 for the squared-distance theorem is unconfirmed; please compare it with the book.
- Villani, *Topics in Optimal Transportation* (2003): Theorems 1.14 and 2.12. Paywalled.
- Kechris, Theorem 18.1 (8.2) and Huang 2009 (6.9): recorded as uncertified, cited by locator.
- Ambrosio–Gigli–Savaré, *Gradient Flows* (§1.2, §7.1, §8.1, Theorem 8.3.1, §8.4): paywalled; not in the sample.
- Agueh–Carlier 2011 (12.7, 12.8) and Brenier 1991 (5.9): paywalled; not in the sample.
- Ownership against open pull requests was checked only through `overlaps.md` and the name search; I did not read the five closest open roadmaps in full.

## Source issues

- **Misprint** in depf-survey at §3.2, p. 25: the source says the Monge–Ampère measure of `|x|²/2 + |x₁|` on the unit disc is Lebesgue measure plus the length measure on the diameter; it should be Lebesgue measure plus twice that length measure, since each subdifferential there is a segment of length 2; affects nothing.
- **Error** in bmnn at Proposition 8(2) and Proposition 36, pp. 11 and 30: the source says the `Lᵖ` space of maps into a separable metric space, and hence the Gromov–Wasserstein quotient, is separable, with no restriction on `p`; it should be restricted to `p < ∞`; affects a stated result.
- **Misprint** in bmnn at Proposition 38, p. 30: the source says the set of all `n`-point networks, over all `n`, is countable; it should be that it is dense, and countable only after restricting kernel values to a countable dense subset of the target; affects nothing.
