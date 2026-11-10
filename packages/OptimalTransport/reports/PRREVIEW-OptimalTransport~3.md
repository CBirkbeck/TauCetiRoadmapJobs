# Review of OptimalTransport (pull request #950 at 9634d34)

**Verdict:** needs changes

## Status of the previous review's findings (read at 48ffacf)

| Id | Status at 9634d34 | Evidence at this head |
|---|---|---|
| R01 (missing statable headlines) | partly | `Suggested.lean` now states Figalli's distance-cost theorem (:185) and De Philippis–Figalli Theorem 1.3 (:126), and its docstring lists eleven headlines as proved in Tau Ceti (:26–45). Seven of those eleven declarations do not exist at the branch's pinned Tau Ceti, and the Figalli–Kim–McCann bullet was dropped from the "not statable" list: see R01 and R03. |
| R02 (6.15 hypotheses) | repaired | README:1668–1685 states bounded open `X, Y`, continuous densities with `λ ≤ f, g ≤ λ⁻¹` "on all of `X` and `Y`", (C0) "finite `C²(X × Y)` norm", A1, A1*, A2, with the locator "Theorem 1.3, p. 82". This matches `depf-partial` lines 61–72. |
| R03 (Markov kernels in the chain rule) | repaired | README:268–283 and :2364–2372 state "for finite `μ`, `ν` and Markov kernels `κ`, `η`" and keep the one-point counterexample `8 log 2 − 3` against `6 log 2 − 3`, which I recomputed. |
| R04 (GeometricTopology Layer 7) | repaired | No GeometricTopology citation is left. README:68–75, :439–446 cite RiemannianGeometry R1–R3, R4.6 and DifferentialGeometry Layer 12 (12.2–12.5); each resolves on main (below). |
| R05 (pinned implementations uncited, 13.2 too narrow) | repaired at main's pin | README:363–430 names each declaration with its hypotheses, and 13.2 (:2818–2825) is stated for finite measures with no separability. The declarations are those of Tau Ceti `2fd255d`, not of the branch pin: see R03. |
| R06 (`Matrix.exists_sinkhorn_scaling` path) | not at the branch pin | README:351 still writes `TauCeti/Data/Matrix/Scaling/Basic.lean`. That file exists at Tau Ceti `2fd255d` (theorem at :894) and not at the branch pin `a91d3aa` (`TauCeti/Data/Matrix/Scaling.lean:922`): see R03. |
| R07 (locators) | partly | 2.7, 3.3, 3.4, 5.5, 6.4, 6.9, 8.6, 8.7, 10.1, 11.1, 11.3 and 13.8 now carry locators, and the Gaussian docstring cites Theorem 4.2 and Corollary 4.5. The McCann docstring still says "Chapter 10": see R04. |
| R08 (`*Needs:*`, `**Checks.**`, Dependencies) | repaired | 141 `*Needs:*` lines and 62 `**Checks.**` lists; Layer 13's Dependencies name Layer 12 (:3107) and Layer 8's name Layer 4 (:2083). |
| R09 (links to completed roadmaps) | repaired | All six links use `../../Completed/HopfRinow/README.md` and `../../Completed/OneParameterSemigroups/README.md`. |
| R10 (indefinite scope, process narrative) | repaired | README:86–89 states the two non-targets; 8.9 is a target with DifferentialGeometry Layer 12; 11.9 builds the Ornstein–Uhlenbeck semigroup "here" (:2543–2545). No "Zulip", "landed", "audit" or "waits" is left. |
| R11 (description) | repaired | The description describes the rewritten README, the supplier contracts, the eight headlines and the pin difference. |

## R01 (P2) — Headlines that main's pin makes statable are absent, and the docstring leaves several named completion targets unclassified

Location: `TauCetiRoadmap/OptimalTransport/Suggested.lean:47–48`, "The following headline theorems of `README.md` are not statable at the pins; each needs the carrier named." Two bullets follow (8.5 and 13.12–13.13). The headlines are README:3611–3630.

Claim: every headline is stated, proved in Tau Ceti, or not statable for a named reason.

Witness: Figalli–Kim–McCann (6.14) is in none of the three lists. At Tau Ceti `2fd255d`, main's pin, `TauCeti.SatisfiesWeakMTW` (`TauCeti/MeasureTheory/OptimalTransport/Twist/MaTrudingerWang.lean:170`) and `TauCeti.IsCConvexSet` (`…/Twist/CExponential.lean:100`) exist. The pull-request description itself lists six headlines to state after the merge.

Repair, after the merge of R03:

1. State the headlines whose carriers exist at `2fd255d` and that Tau Ceti does not prove there:
   - Figalli–Kim–McCann Theorem 2.1 (6.14), on `SatisfiesWeakMTW` and `IsCConvexSet`;
   - Borel-cost duality through the relaxed primal (2.5), on `TauCeti.relaxedTransportCost` (`…/Cost/Partial/Basic.lean:126`); `…/Duality/Relaxed.lean` proves only the weak inequality and the lower-semicontinuous agreement (:129, :163);
   - convergence of the JKO scheme (11.7), on `TauCeti.boltzmannEntropy` (`…/Wasserstein/InternalEnergy/Basic.lean:203`), the Wasserstein resolvent (`…/Wasserstein/Resolvent.lean:115`) and `TauCeti.IsEVISolution` (`TauCeti/Analysis/GradientFlow/EVI/Basic.lean:96`);
   - the heat-flow identification on `CD(K,∞)` spaces (14.7), on `TauCeti.cheegerEnergy` (`TauCeti/MeasureTheory/Function/CheegerEnergy.lean:83`) and `CurvatureDimensionInfinity` (`…/MetricMeasure/CurvatureDimension.lean:170`);
   - metrization of weak convergence by the Sinkhorn divergence (13.4), on `TauCeti.sinkhornDivergence` (`…/Entropic/SinkhornDivergence.lean:86`); only nonnegativity and definiteness are proved there (:257, :271);
   - completeness of the Gromov–Wasserstein quotient exactly when `Z` is complete (15.5), on `GromovWassersteinSpace` (`…/GromovWasserstein/Space.lean:154`).
2. Add to the "proved" list the named completion targets that Tau Ceti already proves: completeness of `P_p(X)` (`TauCeti.WassersteinSpace.completeSpace`, `…/Wasserstein/Complete.lean:229`), lower-semicontinuous Kantorovich duality (`transportCost_eq_sSup_ofReal_kantorovichDualValue_continuous_of_lowerSemicontinuous`, `…/Duality/LowerSemicontinuous.lean:133`), Pratelli's theorem (`mongeCost_eq_transportCost_of_continuous`, `…/Pratelli.lean:337`) and the Gromov–Wasserstein quotient metric (`…/GromovWasserstein/Space.lean:162`).
3. Name in the "not statable" list the remaining summits of README:3611–3630 with the missing carrier: the Riemannian Benamou–Brenier formula (8.9: no continuity equation on a manifold, and the Riemannian gradient is a DifferentialGeometry target), the Gigli–Rajala–Sturm map theorem (14.8: no `RCD*(K,N)` predicate), and Caffarelli's global regularity (6.10) if no `C^{k,β}` diffeomorphism carrier is chosen.

Check on the instance that shows the gap: for `c = ‖x−y‖²/2` the pinned `satisfiesWeakMTW_norm_sub_sq_div_two` (`MaTrudingerWang.lean:262`) gives A3w, and `c`-convexity of the target is convexity, so the stated Figalli–Kim–McCann theorem must specialise to the Hölder statement already at `Suggested.lean:97`.

## R02 (P2) — 11.8 claims a lower bound for the fast-diffusion energy that fails for `n = 1`, `m ≤ 1/3` and at the endpoint `m = 1/2` for `n = 2`

Location: `TauCetiRoadmap/OptimalTransport/README.md:2513–2519`, "for `1-1/n<m<1` (read `0<m<1` when `n=1`) prove fast diffusion … prove the moment/energy bound that makes every JKO functional bounded below and coercive, including the endpoint bound".

Claim: for every `m` in that range, `ν ↦ ∫U_m(ρ_ν) + W₂(ν,μ)²/(2τ)` is bounded below on `P₂(ℝⁿ)`.

Witness: `n = 1`, `m = 1/4`, `ρ(x) = c|x|^{-7/2}` on `|x| ≥ 1`. `∫x²ρ = 2c∫₁^∞ x^{-3/2} dx = 4c < ∞`, while `∫ρ^{1/4} = 2c^{1/4}∫₁^∞ x^{-7/8} dx = ∞`, so `∫U_m(ρ) = -∞` inside `P₂(ℝ)`.

The mixtures `(1-ε)μ + εσ_k`, with `σ_k` the normalised truncations of `ρ` to `|x| ≤ k`, have bounded second moments and `∫ρ_k^m ≥ ε^m∫σ_k^m → ∞`, so the JKO functional has infimum `-∞` and no minimizer. The same happens for `n = 2` at the endpoint `m = 1/2` with `ρ ∝ |x|^{-4}(log|x|)^{-2}` on `|x| ≥ e`: `∫|x|²ρ ∝ ∫ dr/(r log² r) < ∞` and `∫ρ^{1/2} ∝ ∫ dr/(r log r) = ∞`.

Repair: McCann's condition `m ≥ 1 - 1/n` gives displacement convexity only. The lower bound needs `m > n/(n+2)`: by Hölder, `∫ρ^m ≤ (∫(1+|x|²)ρ)^m (∫(1+|x|²)^{-m/(1-m)} dx)^{1-m}`, and the last integral is finite exactly when `2m/(1-m) > n`.

State the fast-diffusion tier for `max(1 - 1/n, n/(n+2)) < m < 1`, that is `1/3 < m < 1` for `n = 1` and `1/2 < m < 1` for `n = 2`, and keep the endpoint `m = 1 - 1/n` only for `n ≥ 3`, where `1 - 1/n > n/(n+2)`. Add the two densities above as negative-control Checks. Check: `m = 1/4`, `n = 1` and `m = 1/2`, `n = 2` are now excluded; `m = 1/2`, `n = 1` is admitted, and there `∫(1+x²)^{-1} dx = π` bounds `∫ρ^{1/2}` by `(π(1+∫x²ρ))^{1/2}`.

## R03 (P3) — The README's Tau Ceti contracts and the docstring's "proved" list name declarations that the branch's pinned Tau Ceti does not have

Location: `TauCetiRoadmap/OptimalTransport/Suggested.lean:23–24`, "The following headline theorems of `README.md` are proved in the pinned Tau Ceti"; `README.md:366`, "`TauCeti.exists_isOptimalCoupling` (`…/OptimalTransport/Existence/Basic.lean`)".

Claim: the cited declarations and files exist at the pin of this branch's `lake-manifest.json`.

Witness: the branch pins Tau Ceti `a91d3aa`. There `…/OptimalTransport/Existence.lean:227` holds the theorem and no `Existence/` directory exists; `TauCeti.isLeast_lintegral_isContinuityEquation` and `…/ContinuityEquation/` are absent.

In all, 24 declarations that the README backticks and 14 of its file paths are absent at `a91d3aa` and present at `2fd255d`. Seven of the eleven "proved" bullets of the docstring are among them: the Schachermayer–Teichmann equivalence, polar factorization, Lisini's superposition, Benamou–Brenier, the conditional chain rule, the population barycenter and the Gromov–Wasserstein barycenter. The others include the Gaussian fixed-point pair, the four `klDiv` theorems of 11.1, `TauCeti.descendingSlope`, `TauCeti.IsStrongUpperGradient`, `TauCeti.mongeAmpereMeasure` and the entropic Gromov–Wasserstein theorems. The description says the same.

Repair: merge `origin/main` into the branch, which moves the pins to Tau Ceti `2fd255d` and Mathlib `1b1ccf4`. The merge conflicts only in `README.md` (main changed ten lines there, the five links this head already repairs), and resolves to this head's text. Rebuild `TauCetiRoadmap.OptimalTransport.Suggested` at the new pin. No README sentence needs to change: I resolved every cited declaration and path at `2fd255d` and compared the recorded hypotheses of sixteen of them with the source (listed under Verified sound). Check: after the merge, `…/OptimalTransport/Existence/Basic.lean:226` is `exists_isOptimalCoupling`, as README:366 says.

## R04 (P3) — Sampled targets without a locator, and one docstring locator that disagrees with the README

Location: `README.md:590` (0.4), "Prove the gluing lemma: couplings of `(μ,ν)` and `(ν,σ)` admit a joint law on `X × Y × Z`"; also 8.2 (:1897–1907), 10.3 (:2252–2266), 10.4 (:2280–2284), 11.6 (:2481–2491), 13.6 (:2919–2928), 13.9 (:2979–2988) and 13.12 (:3029–3043). `Suggested.lean:156`, "(McCann 2001; Villani 2009, Chapter 10)".

Claim: every theorem carries a locator.

Witness: none of these eight sampled subsections cites a theorem, section or page. The McCann docstring cites a chapter where README:1835–1836 cites "Chapter 10, Theorem 10.35".

Repair: add the locators. I checked these three against the texts:

- 10.3: Muratori–Savaré, *Gradient flows and evolution variational inequalities in metric spaces. I*, arXiv:1810.03939, Theorem 3.5, pp. 18–19. Its (3.10) is the contraction, (3.13) rearranges to the displayed regularization estimate with `E_λ = I_λ`, and (3.17) is the energy identity.
- 13.9: Peyré–Cuturi, *Computational Optimal Transport*, arXiv:1803.00567v4, Theorems 4.1 and 4.2. The factor there is `(√η − 1)/(√η + 1)` with `η = e^{Δ(K)}`, which equals `tanh(Δ(K)/4)`; for `K = [[2,1],[1,2]]` it is `(2−1)/(2+1) = 1/3`.
- 13.12: Léonard's survey, arXiv:1308.0215v1, Theorems 3.3–3.4 (pp. 16–17) for the bridge `f(X₀)g(X₁)R` and its marginals `f_t g_t`, and Proposition 4.1 (p. 21) for the Brownian reference.

For 0.4, 8.2, 10.4, 11.6 and 13.6, cite the theorem and page of the text each follows. In 6.9 (:1572–1576) the cited survey Theorems 2.19–2.20 cover Hölder and continuous `f` only (`depf-survey` lines 725–739), so the VMO tier needs its own locator. Make the McCann docstring cite the same theorem number as README:1836.

## R05 (P3) — 13.13: finite quadratic cost does not make the negative part of the plan entropy finite

Location: `TauCetiRoadmap/OptimalTransport/README.md:3070–3072`, "Define the plan domain by finite quadratic cost together with finite Boltzmann entropy `Ent_{vol⊗vol}(π)`, where the moment bound already forces the negative part to be finite".

Claim: `∫‖x−y‖² dπ < ∞` bounds the negative part of `∫ρ_π log ρ_π`.

Witness: on `ℝ × ℝ` let `π` be the law of `(X, X+Z)`, `X` with density `1/(x log² x)` on `[e,∞)` (the density of README:2414) and `Z` standard Gaussian, independent. The cost is `E Z² = 1`, and `Ent(π) = Ent(X) + Ent(Z) = −∞`.

Repair: the domain itself is sound, because it also requires finite entropy; only the clause is wrong. Replace it by "for `π` with both marginals in `P₂(ℝⁿ)`, the second-moment bound forces the negative part to be finite", which is 11.2's inequality `r log r ≥ r log s + r − s` with a Gaussian `s` on `ℝ²ⁿ`. Check: the plan above has no second moment in either marginal, so it is excluded, and for `π = N(0, I₂)` both parts are finite, `Ent = −log(2πe)`.

## Verified sound

**Gate and build.** The worker gate passes every rule (`build=0`, `depcheck=0`, `outside-folder=0`, `stray-files=0`, `statement-hygiene=0`). `git diff --stat origin/main...HEAD` touches only `TauCetiRoadmap/OptimalTransport/README.md` and `Suggested.lean`. Elaborating `Suggested.lean` at the branch pins (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`) gives eight `sorry` warnings and nothing else.

**Signatures.** `#check @name` for all eight declarations in a scratch copy: the file has no `variable` line, each declaration carries its own binders, and each elaborated type matches its README statement (5.8, 6.8, 6.15, 7.3, 7.6, 12.7, 12.8, 13.3). Nothing changed.

**One-tactic probe.** `first | (simp; done) | rfl | infer_instance | exact ⟨_, rfl⟩ | trivial | assumption` closes none of the eight. At Tau Ceti `2fd255d` none is proved either:
- `…/Twist/StrictConvex.lean:117–196` proves uniqueness on contact sets, not Gangbo–McCann existence;
- `…/Wasserstein/Barycenter/Uniqueness/Euclidean.lean:75` proves Agueh–Carlier uniqueness for an absolutely continuous input only, which 12.7's small-set predicate generalises;
- `…/Wasserstein/Gaussian/FixedPoint.lean:240, 261` assume the fixed point whose existence 12.8 states;
- `…/Entropic/SchroedingerSystem.lean:572` gives potentials for a bounded log-density only, where 13.3 assumes `R ∼ μ⊗ν`.

**Dependency check.** The command printed exactly:

```
depcheck: 234 roadmaps, 2263 edges, 0 problem(s)
```

There are no UPWARD or CYCLE lines.

**Ownership and overlaps.** `overlaps.md` lists no conflicting head and no dropped id. The citing roadmaps on main still resolve: RandomMatrices Layers 0–3 (:60), StandardDistributions 3.7/5.3/12.8 (:2622), VonNeumannAlgebras Layers 2 and 8.2 (:60, :1293), RiemannianGeometry R4.6 (:735) and Completed/HopfRinow (:45). No declaration of `Suggested.lean` shares a fully qualified name with another roadmap's file.

**Cross-roadmap citations resolved on main (4452ffa).**
- DifferentialGeometry Layer 12 (:910): 12.2 gradient `mgradient` (:918), 12.3 divergence and Hessian (:920), 12.4 volume through `TauCeti.riemannianVolume` (:923), 12.5 divergence theorem (:930).
- RiemannianGeometry R1 (:186), R2 (:322), R3 (:369), R4.6 (:720–737, which names "OptimalTransport Layer 7").
- GeometricMeasureTheory G2 (:148).
- PDE §1.1 A1 (:677), §1.6 A6 (:905), §1.7 A7 (:996), §2.4 B11 (:1241), §6.3 F26 (:2309).
- Completed/HopfRinow Layers 1–4 (:264, :427, :451, :495); Completed/OneParameterSemigroups Part A (:90).

**Library declarations opened.**

*Tau Ceti at `2fd255d`, hypotheses compared with README:363–430 (16):*
- `exists_isOptimalCoupling` (`Existence/Basic.lean:226`: Polish, Borel, lsc);
- `IsCoupling.isOptimalCoupling_iff_exists_isCyclicallyMonotone` (`Duality/SchachermayerTeichmann.lean:103`: lsc, `c ≠ ∞`, finite cost) and `…_of_isCyclicallyMonotone` (:75: measurable cost);
- `wassersteinEDist_top_eq_iSup` (`Wasserstein/Infinity/Basic.lean:124`: complete, second-countable);
- `wassersteinEDist_one_eq_iSup` (`Wasserstein/KantorovichRubinstein.lean:233`: second-countable pseudometric, standard Borel, finite first moments);
- `wassersteinEDist_two_multivariateGaussian` (`Wasserstein/Gaussian/Basic.lean:204`: `S₁` positive definite, `S₂` positive semidefinite);
- `exists_isKantorovichOptimalTransportMap_gradient` (`Brenier.lean:565`);
- `exists_hasLaw_and_ae_eq_gradient_comp` (`PolarFactorization.lean:160`);
- `exists_map_IccExtend_eq_lintegral_curveAction_eq` (`Wasserstein/Superposition.lean:194`: `1 < p < ∞`);
- `isLeast_lintegral_isContinuityEquation` (`ContinuityEquation/BenamouBrenier.lean:232`: `1 ≤ p < ∞`, finite `W_p`);
- `klDiv_compProd_eq_add_lintegral` (`InformationTheory/KullbackLeibler/ChainRule.lean:150`: finite measures, Markov kernels, `CountableOrCountablyGenerated`);
- `WassersteinSpace.exists_isFrechetBarycenter` (`Wasserstein/PopulationBarycenter.lean:301`: proper space, `p ≠ ∞`);
- `existsUnique_isCoupling_klDiv_eq_schroedingerValue` (`Entropic/Basic.lean:312`: finite `μ` and `R`, no separability);
- `exists_isMinOn_finiteGromovWassersteinBarycenterObjective` (`GromovWasserstein/Barycenter.lean:135`);
- `Matrix.exists_sinkhorn_scaling` (`Data/Matrix/Scaling/Basic.lean:894`);
- `CovariantDerivative.ricciTensor` (`…/Curvature/Ricci.lean:65`).

*Tau Ceti at the branch pin `a91d3aa` (the carriers of `Suggested.lean`):* `IsCoupling`, `transportCost` (`Cost/Basic.lean:111`), `IsOptimalCoupling` (:300), `IsKantorovichOptimalTransportMap` (`Monge.lean:239`), `wassersteinEDist` (`Wasserstein/Basic.lean:160`), `HasFiniteMoment` (:415, `∃ x, MemLp (edist x ·) p ν`), `riemannianVolume` (`…/VolumeDensity/Volume.lean:76`).

*Mathlib at `6b7abb3c` (41 names resolved):* among them `klDiv_compProd_eq_add` (`ChainRule.lean:203`), `klDiv_compProd_left` (:181), `klDiv_map_le`, `klDiv_trim_le`, `klDiv_comp_right_le` (`DataProcessing.lean:159/179/185`), `traj_map_frestrictLe` (`IonescuTulcea/Traj.lean:530`), `isProjectiveLimit_nat_iff` (:160), `IsTightMeasureSet.prodMk` (`Measure/Tight.lean:143`), `ProbabilityMeasure.continuous_map` (:672), `HasLaw.comp` (`HasLaw.lean:112`), `HasLaw.congr` (:71), `eq_condKernel_of_measure_eq_compProd` (`Disintegration/Unique.lean:82`), `IsCadlag` (`Topology/Order/Cadlag.lean:104`), `IsPreBrownianReal` and `IsBrownianReal` (`BrownianMotion/Basic.lean:75, 302`; no Wiener measure on path space), `MeasureTheory.IsSeparable` (`SeparableMeasure.lean:338`), `EReal.bot_add`, `GromovHausdorff.ghDist_le_hausdorffDist`, `optimalGHInjl`, `levyProkhorovEDist`.

**Sources: the seeded sample.**

| Target | Text and locator | Result |
|---|---|---|
| 0.4 | no locator in README | Statement checked: disintegrating the second coupling needs only `Z` standard Borel. Locator missing (R04) |
| 3.4 | Villani 2009, Definition 6.8, Theorem 6.9 (paywalled) | Not opened; discriminating computation below |
| 3.8 | Villani 2003 Thm 1.14; Villani 2009 Particular Case 5.16 (paywalled); `wassersteinEDist_one_eq_iSup` | Texts not opened; the pinned theorem's hypotheses match the README's contract |
| 3.9 | own definition | Three Checks computed below |
| 6.15 | `depf-partial` (C0)–(C3) l.61–64; Thm 1.3 l.66–72, printed p. 82; `depf-survey` Thm 4.11 l.2119, p. 45 | Supported exactly as stated; "locally" appears only in Thm 1.4 (l.73–78), which 7.7 states |
| 8.2 | no locator | Locator missing (R04) |
| 10.3 | no locator; `muratori-savare` (arXiv:1810.03939) Thm 3.5 l.940–974 | Estimate supported by (3.13); locator missing (R04) |
| 10.4 | no locator | Three Checks recomputed below; locator missing (R04) |
| 11.6 | no locator | Checks recomputed below; locator missing (R04) |
| 11.10 | `ags-heat` (arXiv:1106.2090v4) Thm 9.3 l.3632–3641 | Supported: on `CD(K,∞)` the two gradient flows coincide |
| 13.6 | no locator | Check recomputed below; locator missing (R04) |
| 13.9 | no locator; `peyre-cuturi` Thm 4.1 l.3092–3108, Thm 4.2 l.3133 | Factor supported; locator missing (R04) |
| 13.12 | no locator; `leonard-survey` Thm 3.3 l.838, Thm 3.4 l.856, Prop 4.1 l.1038 | Supported; both Fokker–Planck identities recomputed; locator missing (R04) |
| 15.8 | `bmnn` (arXiv:2408.08233v4) Def 49 l.1756–1767, Thm 50 l.1777–1787 | Supported: the three-step chain and the kernel-distribution bound, each with the factor `1/2` that the README converts |
| 16.2 | convention, no source | No mathematical claim |

**Other locators opened.**
- `figalli-noncompact`: Theorem 1.1 l.112–128 (p. 3) and Remark 1.2 l.133–151 (p. 4). The Lagrangian `(1+‖v‖²)/2` gives `c_T = T/2 + d²/(2T)`, minimised at `T = d` with value `d`.
- `schachermayer-teichmann`: Prop 1 l.157 (p. 3), Thm 2 l.315 (p. 7), Cor 1 l.351 (p. 7), Example 1 l.362 (p. 8).
- `hartenstine-dirichlet`: Thm 1.1 l.31 (p. 1), Thm 2.1 l.78 (p. 2).
- `depf-survey`: Thm 2.8 l.280 and 2.9 l.293 (p. 8), 2.14 l.614 (p. 15), 2.19 l.725 and 2.20 l.734 (p. 18), 2.21 l.749 (p. 19), 3.3 l.1098 (pp. 25–26).
- `nutz-eot`: Lemma 1.2 l.152 (p. 4), Lemma 1.3 l.172 (p. 5), standing separability l.616 and Thm 2.1 l.641–650 (p. 16), integrability under (2.2) l.664.
- `abedi-li-schultz`: Example 1.1 l.129, Remark 2.20 l.857, Thm 3.1 l.873, Remark 3.2 l.882, Thm 3.3 l.953, (3.6) l.967.
- `bmnn`: Thm 26 l.1074, Prop 36 l.1331, Prop 38 l.1349, Thm 39 l.1363, Thm 45 l.1629.

**Adversarial table (values computed on both sides).**

| Statement | Instance | Values | Result / change |
|---|---|---|---|
| H1 Gangbo–McCann (5.8) | `d=1`, `h=x²`, `U[0,1] → U[1,2]` | `T=x+1`, cost `1 = transportCost`; only optimal plan | holds |
| H1 | `h=\|x\|`, same laws | translation and the monotone rearrangement both cost `1` | uniqueness fails without `h_strict` |
| H1 | `d=0` | cobounded filter is `⊥`; `T=id`, unique coupling `δ` | holds |
| H2 Caffarelli (6.8) | `X=(0,1)`, `Y=(0,2)`, `f=1`, `g=1/2` | `T=2x`, Hölder with `α=1` | holds |
| H2 | `Y=(0,1)∪(2,3)` | `T=2x` then `2x+1`: jump `1` at `1/2` | `hYc` load-bearing |
| H3 De Philippis–Figalli (6.15) | `c = C − ⟨x,y⟩` with `C ≥ sup⟨x,y⟩`, unit disc to two separated half-discs | (C1): `−Dₓc = y` injective; (C3): `D_y Dₓ c = −I`, `det = (−1)ⁿ`; the Brenier map jumps across a diameter | holds with `S_X` the diameter: null and relatively closed, not empty |
| H3 | `n=0` | `X=Y={0}`, `f=g=1`, `S_X=S_Y=∅`, `h=id` | holds |
| H3 | `c ≡ 0` | `−Dₓc = 0` is not injective on `Y` with two points | excluded by `hc_twist` |
| H4 McCann (7.3) | `M=ℝ`, `U[0,1] → δ₂` | `T≡2`, cost `∫(2−x)²/2 = 7/6` | holds |
| H4 | `μ=δ₀` on the circle, `ν` two atoms | no map; Kantorovich value finite | `hμ` load-bearing |
| H5 Figalli (7.6) | `ℝ`, `U[0,1] → U[1,2]`, `c=\|x−y\|` | `T=x+1` costs `1`; `T'=2−x` costs `∫₀¹(2−2x)dx = 1` | existence holds, uniqueness fails (README:1813 agrees) |
| H5 | `μ=δ₀`, `ν=(δ₋₁+δ₁)/2` | no map; value `1` | `hμ` load-bearing |
| H6 Agueh–Carlier (12.7) | `n=1`, `U[0,1]`, `δ₂`, weights `1/2` | barycenter `U[1,3/2]`, unique | holds |
| H6 | perpendicular segments in `ℝ²` | two midpoint laws, objective `(1/4)(1/3+1/3) = 1/6` each | each segment has mass `1` and dimension `1 ≤ n−1`: excluded |
| H6 | `n=0` | `dimH{0} = 0 ≤ 0` and `μ{0}=1` | hypothesis unsatisfiable; conclusion `δ₀` true anyway |
| H7 Gaussian (12.8) | 1D, `C=(1,4)`, `w=1/2` | `√S = (1+2)/2`, `S = 9/4`; check `S = √S·(1/2+1)` | holds |
| H7 | 1D, `C=(1,0)` | `S = √S/2`, `S=1/4`, positive definite | holds with a degenerate input |
| H8 Nutz (13.3) | two-point uniform, `R=μ⊗ν` | minimizer `R`, density `1 = e^{0+0}`; other pairs `(a,−a)` | holds |
| H8 | diagonal `R` | `φᵢ+ψᵢ = 0` for each `i`: two free constants | excluded by `hμνR` |
| 0.4 | `μ=ν=σ=(δ₀+δ₁)/2`, diagonal and anti-diagonal couplings | glued law `(δ_{(0,0,1)}+δ_{(1,1,0)})/2`; marginals `(1,2)` diagonal, `(2,3)` anti-diagonal | holds |
| 3.4 | `(1−n⁻²)δ₀+n⁻²δ_n` | weak limit `δ₀`; `W₂² = 1`; second moments `1 ↛ 0` | moment clause discriminates |
| 3.8 | `δ₀`, `δ₂` on `ℝ` | `W₁=2`; `f(x)=−x`: `∫f dμ − ∫f dν = 2` | holds |
| 3.9 | `ℝ`, Lebesgue; `ℚ`, counting; `[0,2]`, Lebesgue on `[0,1]` | bounded sets finite; `[0,1]∩ℚ` infinite mass; support `[0,1]` | Checks hold |
| 8.2 | circle, `0 → π` | `δ_{γ₊}`, `δ_{γ₋}`, their mean: one endpoint coupling `δ_{(0,π)}` | Check holds |
| 10.3 | `Φ=λx²/2`, `x_t=e^{−λt}x₀` | `(x_t−y)(−λx_t) + (λ/2)(x_t−y)² = (λ/2)(y²−x_t²)` | EVI with equality |
| 10.3 estimate | integrate `d/dt(e^{λt}d²/2) ≤ e^{λt}(Φ(y)−Φ(x_t))` | `e^{λt}d_t²/2 − d₀²/2 ≤ I_λ(t)(Φ(y)−Φ(x_t))` | the displayed formula |
| 10.4 | `‖x‖²/2`; `\|x\|` on `ℝ` | `y+(y−x)/τ=0 ⇒ y=x/(1+τ)`; `y=sign(x)max(\|x\|−τ,0)` | Checks hold |
| 11.6 | `∫x²/2`, from `δ_a`; `∫gx` | `δ_{a/(1+τ)}`; `δ_{a−τg}` | Checks hold |
| 11.8 (R02) | `n=1`, `m=1/4`, `ρ∝\|x\|^{−7/2}` | second moment `4c`; `∫ρ^m = ∞` | lower bound fails: R02 |
| 11.8 | `m=2`, `n=1`; `r log r` | `sU(1/s)=1/s`; `−n log s`: convex, nonincreasing | McCann's condition holds |
| 11.10 | circle, `∂_θ` | `∫φ' dθ = 0` | orthogonal to gradients |
| 13.6 | inputs `δ₀`, `δ₂`, `p=2` | `F_ε(ν) = ∫x²/2 + ∫(x−2)²/2 = ∫(x−1)² + 1` | minimised at `δ₁` for every `ε` |
| 13.9 | `K=[[2,1],[1,2]]`; `[[1,2],[3,6]]` | `Δ=log 4`, `tanh(log 4/4) = 1/3`; `Δ = log 1 = 0` | Checks hold |
| 13.12 | `ρ=fg`, `∂_t f=(ε/2)Δf`, `∂_t g=−(ε/2)Δg` | `∂_tρ + ε div(f∇g) = (ε/2)(gΔf+fΔg)+ε∇f·∇g = (ε/2)Δρ`; the other sign gives `−(ε/2)Δρ` | both identities hold |
| 13.13 identity | `R^ε₀₁` density `(2πε)^{−n/2}e^{−\|x−y\|²/(2ε)}` | `ε∫log(dπ/dR) = ½∫\|x−y\|² + εEnt + ε(n/2)log(2πε)` | holds |
| 13.13 clause (R05) | law of `(X, X+Z)` | cost `1`, `Ent = −∞` | clause false: R05 |
| 15.8 | uniform two-point, distance `a` | section law `(δ₀+δ_a)/2`; eccentricity `(aᵖ/2)^{1/p}`; size `2^{−1/p}a` | Checks hold; chain tight for `a`, `b` |
| 11.2 | `μ=2m_a`; `U[0,1]` vs Lebesgue on `[0,2]` | `2 log 2 − 1` both sides; `klDiv = 0+2−1 = 1` | holds |
| 14.4 | `([0,1],U)` to a point | `∫d² ≥ ¼∫(1−2x)² = 1/12`, attained by `d=\|x−½\|` | Check holds |
| 14.6 | `V=x²/2`, `N>1` | `1 − x²/(N−1)` | negative for large `\|x\|` |
| 12.8 time | minimise `(1−t)sᵖ+t(1−s)ᵖ` | `(s/(1−s))^{p−1} = t/(1−t)` | README formula; `s=t` at `p=2` |
| 15.10 | one-point kernels `0`, `2` | `p=1`: `[0,2]`, value `1`; `p=2`: `(z−1)²+1` | holds |
| 6.3 | `u=‖x‖²/2+‖x‖` on `ℝ²` | eigenvalues `1`, `1+1/‖x‖`; `∂u(0)` = unit disc | singular part `πδ₀` |
| 6.13 | `c=−2⟨x,y⟩`, `u=‖x‖²` | `∂ᶜu(x)={x}`; `MA_u(E)=2ⁿ\|E\|` | factor `\|det D²_xy c\|=2ⁿ` |
| 9.1 | `(δ₀+δ₁)/2 → (δ₁+δ₂)/2` | monotone: distance `t`; antitone midpoint `δ₁` at `(1/2)^{1/2}` | Check holds |
| 3.5 | product, `ℓᵖ` metric | any coupling: `∫d₁ᵖ+∫d₂ᵖ ≥ W_p(μ₁,ν₁)ᵖ+W_p(μ₂,ν₂)ᵖ`; product coupling attains | equality holds |

## Not verifiable

- **Villani 2009 and 2003** (paywalled; the author's page did not answer): Definition 6.8, Theorems 6.9 and 6.18, Particular Case 5.16, Theorem 5.10, and "Theorem 10.35" for the complete noncompact form of McCann's theorem. I could not confirm the number 10.35; my recollection is that the square-distance statement of Chapter 10 has a later number, so it is worth checking against the book when R04 is repaired.
- **Other paywalled texts, not opened:** McCann 2001; the Ambrosio–Gigli–Savaré book (§1.2, §7.1, §8.1, Theorem 8.3.1, Definition 8.4.1, Lemma 8.4.2); Brenier 1991; Caffarelli 1990 and 1992; Gangbo–McCann 1996 at this round (read at the previous one); Lisini 2007, Theorem 5; Givens–Shortt, Proposition 1.
- **Elaboration at main's pin:** the statements of R01 were not elaborated at Tau Ceti `2fd255d`, since this review runs Lean only in the pull request's worktree. Their carriers were read in the pinned sources at the lines given.
- **Numbering versions:** `bmnn` was read at arXiv v4 (the README links the JMLR version; Theorems 26, 39, 45, 50 and Propositions 36, 38 carry the same numbers in v4), `depf-survey` at arXiv v1, `ags-heat` at arXiv v4 as the README says.

## Source issues

- **Gap** in bmnn at Theorem 45, printed p. 36: the proof chooses a geodesic of `Z` for each pair of kernel values with no measurable selection; it should use a Borel bicombing or a measurable selection so that the interpolated kernel is measurable; affects the proof.
- **Error** in bmnn at Proposition 8(2) and Proposition 36, printed p. 30: separability of metric-valued `Lᵖ`, and hence of the quotient, is asserted with no restriction on `p`; it should be restricted to finite `p`, because `L∞` is not separable; affects a stated result.
- **Misprint** in abedi-li-schultz at Theorem 3.3, equation (3.6), printed p. 19: the quotient is written over the interval from `t` to `t+h` in that order, which is empty for negative `h`; it should be the closed interval between the two times; affects nothing.
