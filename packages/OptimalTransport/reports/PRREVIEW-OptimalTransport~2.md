# Review of OptimalTransport (pull request #950 at 48ffacf)

**Verdict:** needs changes

## Status of the previous review's findings (read at 10d59fd)

| Id | Status at 48ffacf | Evidence at this head |
|---|---|---|
| R01 (`W_∞` measurability) | repaired | The local declaration is gone. README:184–190 consumes `TauCeti.wassersteinEDist_top` "for a jointly measurable ground distance" and keeps the trivial-σ-algebra negative control (README:186–190, :823–825). At the pin, `TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Basic.lean:165` carries `hd : Measurable fun z ↦ edist z.1 z.2`. |
| R02 (`< n−1` barycenter predicate) | repaired | README:1918–1919 now reads "whose Hausdorff dimension is at most `n-1`", and the Lean has `dimH A ≤ ((n - 1 : ℕ) : ℝ≥0∞)` (`Suggested.lean:136`). The two-segment control is at README:1970–1974. This matches `agueh-carlier` line 617. |
| R03 (entropy change of reference, `∞−∞`) | repaired | README:1731–1740: "Prove this identity for finite measures with `∫d(x,x₀)²dμ < ∞`". It keeps the heavy-tail counterexample and the `μ = 2m_a` value `2 log 2 − 1`, which I recomputed on both sides. |
| R04 (BV speed interval) | repaired | README:1429–1434 uses `J_{t,h} = [min(t,t+h), max(t,t+h)]` and states the càdlàg convention (Remark 2.20). `abedi-li-schultz` line 967 is the source's (3.6). |
| R05 (supplier contracts) | partly | README:322–346 now names six pinned declarations, and 6.6 consumes GeometricMeasureTheory G2 (README:1102–1104). Several pinned implementations are still uncited, and 13.2 is narrower than the pin: see R05 below. The StochasticCalculus S1.2 citation asked for earlier cannot be added, because this roadmap is on main and StochasticCalculus is not; no change is needed for that part. |
| R06 (missing statable headlines) | partly | The module docstring now has a per-headline list and the file states six headlines. Layer 12.5's population barycenters and the 15.10 GW items are still absent: see R01. |
| R07 (computational deliverables) | repaired | No floating-point wrapper or log-domain iteration is left. 13.9 (README:2112–2123) states theorems and exact Checks. |
| R08 (GW barycenter objective) | repaired | README:2495–2510 writes the objective, carrier, `ε ≥ 0`, the existence claim and the `p = 1` non-uniqueness example. |
| R09 (Sinkhorn restatement) | partly | The Lean restatement is deleted. The README cites the declaration under a file that does not exist: see R06. |
| R10 (shape) | partly | The Summary, Scope, Conventions, supplier contracts, How-to-read section, per-layer Examples and Dependencies, and the docstring are fixed. There are still no `*Needs:*` lines and no `**Checks.**` lists: see R08. |
| R11 (locators) | partly | Many locators were added, for example Villani 5.10 in 2.4, Gangbo–McCann 1.2, the BMNN numbers and Léonard Proposition 3.4. Twelve of the fifteen sampled targets still have none: see R07. |
| R12 (TeX), R13 (residue) | repaired | The gate reports `tex=0` and `residue=0`. |

## R01 (P2) — Statable headlines are missing from `Suggested.lean`, and the docstring's "not statable" list is incomplete and partly wrong

Location: `TauCetiRoadmap/OptimalTransport/Suggested.lean:26–28`, "The Figalli–Kim–McCann Hölder theorem and De Philippis–Figalli partial regularity (Layer 6.13–6.15) need `c`-convexity of domains and the Ma–Trudinger–Wang conditions on a `C⁴` cost." The relevant summits are listed at README:2584–2608.

Claim: every headline not stated in the file needs a missing carrier.

Witness: a scratch copy elaborates 7.6 (Figalli distance cost), 12.5 (Le Gouic–Loubes) and 2.7 (Schachermayer–Teichmann) at the pins, with no new definitions and only `sorry` warnings. De Philippis–Figalli Theorem 1.3 (`depf-partial` lines 61–72) assumes no MTW condition, and README:1207 says "without MTW".

Repair:
1. Add the three elaborated headlines; none is pinned (STATUS lists the Schachermayer–Teichmann converse and Layer 12 items 3–8 as open):
   - 7.6: the McCann binders, `HasFiniteMoment 1` for both laws, and the conclusion `IsKantorovichOptimalTransportMap (fun z => edist z.1 z.2) μ ν T`.
   - 12.5: `P : Measure (Measure X)` with `[ProperSpace X]`, midpoints, and finite `p`-moment; conclude that `ν ↦ ∫⁻ μ, W_p(ν,μ)^p ∂P` attains its minimum.
   - 2.7: a finite lsc cost, a coupling concentrated on a measurable `TauCeti.IsCyclicallyMonotone` set (`Cost/CyclicalMonotonicity.lean:76`), and the conclusion `IsOptimalCoupling`.
2. State De Philippis–Figalli Theorem 1.3 with its exact hypotheses (see R02). Its carriers are `ContDiffOn`, injectivity of `y ↦ -fderiv … x`, `det ≠ 0` and `HolderOnWith`. Keep only Figalli–Kim–McCann in the "needs MTW" bullet.
3. Several named milestones (README:9–11, 2594–2599) appear neither in the file nor in its docstring: Benamou–Brenier (8.8), Lisini superposition (8.3), Brenier's polar factorization (5.9) and the finite GW barycenter (15.10). State each one, or name it in the docstring with its missing carrier.

Check on the instance that motivated the original R06: for the population law `(δ_{δ₀}+δ_{δ₂})/2` at `p = 2`, the stated barycenter theorem must select `δ₁` with value `1`.

## R02 (P2) — 6.15 drops the global hypotheses of De Philippis–Figalli and has no locator

Location: `TauCetiRoadmap/OptimalTransport/README.md:1207–1210`, "`c ∈ C²,α_loc` satisfying A1/A1* and A2, bounded Euclidean domains, and **continuous** source and target probability densities locally bounded away from zero and infinity."

Claim: the partial-regularity theorem holds under local bounds and a `C²,α_loc` cost.

Witness: `depf-partial` line 61 requires `c ∈ C²` with a finite `C²(X×Y)` norm. Theorem 1.3 (lines 66–68, p. 82) requires densities bounded away from zero and infinity on X and Y. "Locally" appears only in the manifold Theorem 1.4 (line 74).

Repair: the survey states the same hypotheses (`depf-survey` line 2119, p. 45), and `C²,α_loc` is only the `k = 0` case of the higher-regularity clause. State Theorem 1.3 exactly, with locator "De Philippis–Figalli 2015, Theorem 1.3, p. 82":
- `X, Y` bounded open;
- `f, g` continuous with `λ ≤ f, g ≤ λ⁻¹` on `X`, `Y`;
- `c ∈ C²` with bounded `C²` norm, together with (C1), (C2), (C3);
- the conclusion is a `C⁰,β_loc` homeomorphism off relatively closed null sets.

Keep `c ∈ C^{k+2,α}_loc` only for the `C^{k+1,α}` clause. A localized Euclidean version is a separate target with its own proof route.

## R03 (P2) — The conditional KL chain rule is stated without Markov kernels, and the Mathlib contract omits its hypotheses

Location: `TauCetiRoadmap/OptimalTransport/README.md:1699–1700`, "the conditional form `klDiv (μ ⊗ₘ κ) (ν ⊗ₘ η) = klDiv μ ν + ∫⁻ x, klDiv (κ x) (η x) ∂μ`". It is stated for "probability/finite references" (:1696). README:260–262 also describes `klDiv_compProd_eq_add` as holding "with no hypotheses on the measurable spaces".

Witness: on one-point spaces with `μ = 2δ`, `ν = δ` and constant kernels `κ = 2δ`, `η = δ`, the left side is `klDiv(4δ,δ) = 8 log 2 − 3` and the right side is `(2 log 2 − 1) + 2(2 log 2 − 1) = 6 log 2 − 3`.

Repair: Mathlib's `ChainRule.lean:87–89` assumes `[IsFiniteMeasure μ] [IsFiniteMeasure ν] [IsMarkovKernel κ] [IsMarkovKernel η]`. Add "for finite `μ, ν` and Markov kernels `κ, η`" both to the conditional form (README:1699, :271) and to the contract sentence (README:260–262). Check: with `κ = η = δ`, both sides equal `2 log 2 − 1`.

## R04 (P2) — GeometricTopology Layer 7 no longer supplies Riemannian volume or curvature

Location: `TauCetiRoadmap/OptimalTransport/README.md:71–72`, "The geometric-topology roadmap, Layer 7, owns Riemannian volume and curvature". The same citation is at :356–357, :1241–1242, :1346, :1513, :2275 and :2684–2686 ("supply … bridges in return").

Witness: on main, `TauCetiRoadmap/GeometricTopology/README.md:6673` is now "Layer 7: hyperbolic structures, volume and rigidity", and it consumes the pinned `TauCeti.riemannianVolume` (:618). `TauCetiRoadmap/DifferentialGeometry/README.md:910` (Layer 12) and RiemannianGeometry R1 (:186–188) own the Riemannian calculus and curvature.

Repair: the GeometricTopology restructure postdates this branch, and that roadmap does not consume this one.
1. Cite DifferentialGeometry Layer 12 (12.2–12.4) for the Riemannian gradient, divergence, Hessian and volume density used in 8.9, 11.10 and 14.6.
2. Cite RiemannianGeometry R1 together with the pinned `TauCeti.ricciTensor` (`TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Ricci.lean:57`) for curvature.
3. Keep `TauCeti.riemannianVolume`, drop the GeometricTopology citations, and delete "in return".

Check: on weighted `ℝ` with `V = x²/2`, the README:2267 tensor `Ric + Hess V = 0 + 1` uses only these suppliers.

## R05 (P3) — Implemented targets are stated more narrowly than the pinned Tau Ceti declarations, and do not cite them

Location: `TauCetiRoadmap/OptimalTransport/README.md:2001–2003`, "Let `(X,ℱ_X,μ)` and `(Y,ℱ_Y,ν)` be separable probability spaces"; :2013–2014, "do not advertise arbitrary measurable spaces without a separate proof."

Witness: `TauCeti.existsUnique_isCoupling_klDiv_eq_schroedingerValue` (`TauCeti/MeasureTheory/OptimalTransport/Entropic.lean:301`) proves existence and uniqueness for a finite `μ` and a finite `R`, with no separability. The README names it nowhere.

The following pinned declarations are also not named at their targets:
- `exists_isKantorovichOptimalTransportMap_gradient` (`Brenier.lean:555`), for 5.5;
- `exists_isOptimalCoupling` (`Existence.lean:227`), for 1.5;
- `wassersteinEDist_two_multivariateGaussian` (`Wasserstein/Gaussian.lean:209`), for 5.3;
- `wassersteinEDist_one_eq_iSup` (`KantorovichRubinstein.lean:233`), for 3.8;
- `wassersteinEDist_top_eq_iSup` (`Infinity/Basic.lean:124`), for 3.6;
- `strictConvexOn_toReal_klDiv` (`InformationTheory/KullbackLeibler/Convex.lean:178`), for 11.1.

Repair: remove the separability restriction from 13.2's existence and uniqueness. Keep it for 13.3's potentials, where it is Nutz's standing assumption (`nutz-eot` line 616). Name each declaration above in "From Tau Ceti" and at its target. Check: for `μ = ν = (δ₀+δ₁)/2` and `R = μ⊗ν`, the pinned minimizer is `R`, with value `0`.

## R06 (P3) — Wrong file path for `Matrix.exists_sinkhorn_scaling`

Location: `TauCetiRoadmap/OptimalTransport/README.md:341`, "`Matrix.exists_sinkhorn_scaling` (`TauCeti/Data/Matrix/Scaling/Basic.lean`)".

Witness: the pin has no `Scaling/` directory. The theorem is at `TauCeti/Data/Matrix/Scaling.lean:922`, with hypotheses `0 < K i j`, `0 < a i`, `0 < b j` and equal total mass.

Repair: change the path to `TauCeti/Data/Matrix/Scaling.lean`. Check: for the 1×1 kernel `K = 2` with `a = b = 1`, take `u = 1/2`, `v = 1`.

## R07 (P3) — Sampled targets have no locator

Location:
- 2.7 (README:648–651): "prove the Schachermayer--Teichmann equivalence", with no theorem number.
- 3.3, 3.4, 5.5, 6.4, 6.9, 8.6, 8.7, 10.1, 11.1, 11.3 and 13.8 also have no theorem or page. Twelve of the fifteen sampled targets lack one; 6.15 is covered under R02.

Witness: `schachermayer-teichmann` Theorem 1 (line 94, p. 2), Proposition 1 (line 157, p. 3) and Theorem 2 (line 315, p. 7) support 2.7 as written. The README cites none of them.

Repair:
1. Add these locators, which I checked against the texts:
   - 2.7: the three Schachermayer–Teichmann results above.
   - 8.6: `lisini-orlicz` Theorem 3.1 (line 476, p. 677), Proposition 4.1 (line 1181, p. 685) and Theorem 4.2 (line 1229, p. 686).
   - 6.4: `depf-survey` Theorems 2.8–2.9 (lines 280, 293, p. 8) for zero-boundary stability and existence; the strictly convex `g ∈ C(∂Ω)` form needs its own citation.
   - 13.8: `sinkhorn-knopp` Theorem (line 58, p. 344).
2. For 3.3, 3.4, 5.5, 6.9, 8.7, 10.1, 11.1 and 11.3, cite the theorem and page of the text each follows.
3. In 11.3, name the generating class as gradients of compactly supported smooth functions, as 11.10 already does.
4. Align the docstring locators with the README: McCann's should say "Theorem 10.35", not "Chapter 10", and the Gaussian one should cite "Theorem 4.2 and Corollary 4.5".

## R08 (P3) — There are no `*Needs:*` lines and no `**Checks.**` lists, and two layers list incomplete dependencies

Location: `TauCetiRoadmap/OptimalTransport/README.md`, every target; for example 2.2 (:595) defines the `c`-transform with neither.

Witness: `grep -c 'Needs:'` and `grep -c '**Checks'` both give 0. The three 2.7 Checks (`0 ≤ 0`, `0 ≤ 2`, `2 ≤ 0` fails) sit in Layer 2's Examples (:671–674). Layer 13's Dependencies (:2209) omit Layer 12, which 13.6 uses.

Repair: 8.8 also uses Monge maps, which Layer 8's Dependencies omit. Add an itemized `*Needs:*` line to each `### k.n` subsection. Give each definition its API bullets and at least three `**Checks.**` bullets; for 2.7, move those three computed checks there. Add Layer 12 to Layer 13's Dependencies and Layer 4 to Layer 8's.

## R09 (P3) — Broken relative links to completed roadmaps

Location: `TauCetiRoadmap/OptimalTransport/README.md:1238`, :1351 and :2679 link `../HopfRinow/README.md`; :1809 and :2687 link `../OneParameterSemigroups/README.md`.

Witness: on main these exist only as `Completed/HopfRinow` and `Completed/OneParameterSemigroups`. The same README already uses `../../Completed/...` at :65 and :79.

Repair: use `../../Completed/HopfRinow/README.md` and `../../Completed/OneParameterSemigroups/README.md`.

## R10 (P3) — Indefinite scope and process narrative

Location:
- README:427–428: "open a Lean Zulip design thread before beginning Layer 0".
- :1812–1813: "here unless an explicit upstream dependency has landed".
- :2156: "only after their path-law and heat-kernel APIs have landed".
- The same pattern recurs at :368 ("the audit"), :1324, :1491–1494 and :2695 ("waits").

Witness: Layer 0 is already implemented: README:61–64 calls Tau Ceti's library this roadmap's implementation, and STATUS records Layers 0–1 as done. "Unless … has landed" leaves ownership of the Ornstein–Uhlenbeck semigroup undecided.

Repair:
1. Rewrite the coordination paragraph as provenance, without the instructions about timing.
2. In 8.9, cite DifferentialGeometry Layer 12 (R04) and state the Riemannian formula as a target.
3. Decide whether the Banach/nonsmooth Benamou–Brenier formula (8.9) and the manifold/Markov bridges (13.12) belong to a layer or are cut.
4. Have 11.9 build the Ornstein–Uhlenbeck semigroup here, unconditionally.

## R11 (P3) — The pull-request description no longer describes the head

Location: the pull-request description, "it carries only this roadmap's README ownership clauses" and "No Lean code changes."

Witness: at 48ffacf, `Suggested.lean` has 370 changed lines, including six new headline theorems, and README.md has 3371.

Repair: the "Depends on #935 … keep this PR in draft" item is also stale, since RiemannianGeometry R4.6 is on main (`TauCetiRoadmap/RiemannianGeometry/README.md:720–737`). Replace the description with a summary of the current change: the rewritten README shape, the Tau Ceti supplier contracts, and the six headlines. Drop the draft/dependency note.

## Verified sound

**Gate and build.** The worker gate passes every rule (`build=0`, `depcheck=0`, `outside-folder=0`, `stray-files=0`). `git diff --stat origin/main...HEAD` touches only `TauCetiRoadmap/OptimalTransport/` (README.md and Suggested.lean). Elaborating a scratch copy of `Suggested.lean` at the pins (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`) gives six `sorry` warnings and nothing else.

**Signatures.** `#check @name` for all six declarations shows each one carries its own binders; there are no section variables, so nothing was dropped. Each elaborated type matches its README statement: 5.8, 6.8, 7.3, 12.7, 12.8 and 13.3.

**One-tactic probe.** The probe `first | (simp; done) | rfl | infer_instance` closes none of the six. A search of the pinned Tau Ceti OT tree found no declaration proving any of them, so none is padding.

**Dependency check.** The depcheck command printed exactly:

```
depcheck: 235 roadmaps, 2268 edges, 0 problem(s)
```

There are no UPWARD or CYCLE lines.

**Ownership and overlaps.** `overlaps.md` lists no conflicting heads and no dropped ids. `roadmaps grep` for Schilder, Benamou, Agueh and Gromov–Wasserstein finds only this roadmap; IncompressibleFlows (README:99 at its head) explicitly leaves Benamou–Brenier here. Main roadmaps citing this one still resolve: RandomMatrices Layers 0–3 (:60), StandardDistributions 3.7/5.3/12.8 (:2622), VonNeumannAlgebras Layers 2 and 8.2 (:60, :1293), and Completed/HopfRinow (:45).

**Cross-roadmap citations resolved on main.**
- RiemannianGeometry R4.6 (:720–737) owns injectivity radius, cut-locus measurability and nullity, and says "OptimalTransport Layer 7 … owns its semiconcavity and measurable selections".
- GeometricMeasureTheory G2 (:148).
- PDE §1.1 A1 (:677), §1.6 A6 (:905), §1.7 A7 (:996), §2.4 B11 (:1241), §6.3 F26 (:2309).
- Completed/HopfRinow and Completed/OneParameterSemigroups exist (only the link paths are wrong: R09).

**Library declarations opened at the pin.**
- Tau Ceti `IsCoupling` (`Coupling.lean:110`), `transportCost` (`Cost/Basic.lean:111`), `IsOptimalCoupling` (`:300`), `IsKantorovichOptimalTransportMap` (`Monge.lean:239`), `HasFiniteMoment` (`Wasserstein/Basic.lean:415`) and `wassersteinEDist_top` (`:165`).
- Tau Ceti `IsCyclicallyMonotone` (`Cost/CyclicalMonotonicity.lean:76`), `existsUnique_isCoupling_klDiv_eq_schroedingerValue` (`Entropic.lean:301`), `exists_sinkhorn_scaling` (`Data/Matrix/Scaling.lean:922`) and `riemannianVolume`.
- Mathlib `multivariateGaussian` (`Probability/Distributions/Gaussian/Multivariate.lean:166`, covariance through `CFC.sqrt S`), `klDiv_compProd_eq_add` (`ChainRule.lean:203`, Markov context at `:87–89`), and `klDiv_map_le`, `klDiv_trim_le`, `klDiv_comp_right_le` (`DataProcessing.lean:159/179/185`).
- Mathlib `IsBrownianReal` only (no Wiener measure on path space), which supports the docstring's Brownian bullet.

**Sources: the seeded sample.**

| Target | Text and locator | Result |
|---|---|---|
| 2.7 | `schachermayer-teichmann` Thm 1 l.94, Prop 1 l.157, Thm 2 l.315 | Supported as stated for finite lsc costs; no locator in README (R07) |
| 3.3, 3.4 | no locator in README; Villani 2009 (Springer, uncertified) | Statement checked by computation below; locator missing (R07) |
| 5.5 | no locator; Brenier 1991 (Wiley) not opened | Computation below; pinned theorem uncited (R05) |
| 6.4 | `depf-survey` Thm 2.8 l.280, Thm 2.9 l.293 (p.8) | Stability and zero-boundary existence supported; strictly convex `g ∈ C(∂Ω)` form needs its own locator (R07) |
| 6.9 | no locator; Caffarelli 1990 not opened | Computation below (R07) |
| 6.15 | `depf-partial` Thm 1.3 l.66–72 (p.82); `depf-survey` Thm 4.11 l.2119 | Hypotheses dropped (R02) |
| 8.6 | `lisini-orlicz` ψ∞ admissible l.199; Thm 3.1 l.476; Prop 4.1 l.1181; Thm 4.2 l.1229–1240 | Supported, including "no geodesic sample paths without strict convexity"; no locator (R07) |
| 8.7 | no locator; AGS (Springer) uncertified | Computation below (R07) |
| 10.1 | no locator; AGS uncertified | Computation below (R07) |
| 11.1 | no locator; Mathlib `ChainRule.lean` | Markov hypothesis missing (R03) |
| 11.3 | no locator; AGS uncertified | Computation below (R07) |
| 12.3 | `legouic-loubes` geodesic space = complete + midpoints l.111–113; Lemma 7 l.410 (p.11); Thm 8 l.430 (p.11) | Supported, including the completeness and local-compactness regime |
| 13.8 | `sinkhorn-knopp` Theorem l.58–63 (p.344) | Total-support/fully-indecomposable clause supported; no locator (R07) |
| 15.5 | `bmnn` Prop 36 l.1333, Prop 38 l.1351, Thm 39 l.1365 (p.30), Thm 45 l.1631 (p.36) | Supported; README correctly restricts separability to `p<∞` and adds a measurable selector for Thm 45 (see Source issues) |

**Headline locators.**
- Gangbo–McCann Thm 1.2 (`gangbo-mccann` l.308–315, p.121), with (H1)–(H3) at l.284–293: the Lean cone and superlinearity match, and (iv)'s finite-cost exception is the Lean `hfin`.
- Survey Thm 3.3 (`depf-survey` l.1098–1104, pp.25–26).
- `agueh-carlier`: Prop 2.3 l.394 (p.7), Def 3.2 l.617 (p.10), Prop 3.5 l.650 (p.11), Thm 5.1 l.1018, Rem 5.2 l.1108, Thm 6.1 l.1197.
- `alvarez-esteban-barycenters`: Gaussian-barycenter argument l.564–575, Thm 4.2 l.625–643 (PSD with one PD), Cor 4.5 l.773 (means).
- `nutz-eot` Thm 2.1 l.641–650 (printed p.16), with separability as Section 2's standing assumption (l.616, footnote l.651); it matches `MeasureTheory.IsSeparable`.

**Adversarial table (values computed on both sides).**

| Statement | Instance | Values | Result / change |
|---|---|---|---|
| H1 Gangbo–McCann (5.8) | `d=1`, `h=x²`, `μ=U[0,1]`, `ν=U[1,2]` | `T=x+1`; cost `1=transportCost`; the graph is the only optimal plan | holds |
| H1 | `d=0` | `StrictConvexOn`, cobounded-limit and cone hypotheses all vacuous; `T=id`; the unique coupling is `δ(0,0)` | holds |
| H1 | `h=\|x\|` (not strictly convex), same laws | translation and monotone plans both cost `1` | uniqueness fails, so `h_strict` is load-bearing |
| H2 Caffarelli (6.8) | `X=(0,1)`, `Y=(0,2)`, `f=1`, `g=1/2` | `T=2x`, Hölder with `α=1` | holds |
| H2 | `Y=(0,1)∪(2,3)`, `g=1/2` | `T=2x` on `x<1/2`, `2x+1` after | jump of size 1, so `hYc` is load-bearing |
| H3 McCann (7.3) | `M=ℝ`, `μ=U[0,1]`, `ν=δ₂` | `T≡2`; cost `∫(2−x)²/2=7/6` | holds |
| H3 | `μ=δ₀` on the circle, `ν` = two antipodal-quarter atoms | no map; Kantorovich cost finite | `hμ` (AC) is load-bearing |
| H4 Agueh–Carlier (12.7) | `n=1`, `μ₁=U[0,1]`, `μ₂=δ₂`, weights `1/2` | barycenter `U[1,3/2]`, unique | holds |
| H4 | perpendicular segments in `ℝ²` | two midpoint laws, each with objective `1/6=(2/3)/4` | excluded: each segment has mass `1` on a set of dimension `1 ≤ n−1` |
| H4 | `n=0` | `μ_j{0}=1` with `dimH{0}=0≤0` | hypothesis unsatisfiable; the conclusion (`δ₀`) holds anyway |
| H5 Gaussian (12.8) | 1D, `C=(1,4)`, `w=1/2` | `S=(√S)/2+√S` gives `S=9/4=((1+2)/2)²` | holds |
| H5 | 1D, `C=(1,0)`, `w=1/2` | `S=√S/2`, so `S=1/4`, the quantile average `σ̄=1/2` | holds, PSD input allowed |
| H6 Nutz (13.3) | `X=Y={0,1}`, uniform, `R=μ⊗ν` | minimizer `R`; `dγ/dR=1=e^{0+0}`; other pairs `(a,−a)` | holds |
| H6 | diagonal `R` (only `R≪μ⊗ν`) | `φᵢ+ψᵢ=0` for each `i` separately: two free constants | `R∼μ⊗ν` is load-bearing (README:2026–2030 agrees) |
| 2.7 | `c=(x−y)²` on `{0,1}` | empty family `0≤0`; diagonal `0≤2`; anti-diagonal `2≤0` fails; diagonal plan cost `0` vs anti-diagonal `1` | equivalence consistent |
| 3.3 | `δ_{1/n}` in `X=(0,1)`; `U[0,1]` with `N` midpoints | Cauchy with `W_p=\|1/n−1/m\|` but no limit; quantization error `W₁=1/(4N)→0` | completeness is load-bearing; quantization holds |
| 3.4 | `(1−n⁻²)δ₀+n⁻²δ_n` | converges weakly to `δ₀`; `W₂²=1`; second moment `1` | moment clause discriminates |
| 5.5 | `U[0,1]→δ₂`; `δ₀→(δ₋₁+δ₁)/2` | `u=2x`, cost `7/3`; no map, cost `1` | AC is load-bearing |
| 6.4 | `Ω=(−1,1)`, `μ=dx`, `g=0`; square with `g=x(1−x)` on one edge | `u=(x²−1)/2`, `u''=1`, `u(±1)=0`; no convex `u` (a concave trace on a segment) | strict convexity is load-bearing |
| 6.9 | `u=x²/2+x⁴/12` | `f=u''=1+x²`, smooth, and `u` is smooth | `k`-bootstrap consistent |
| 6.15 | `c=−⟨x,y⟩`, disc to two disjoint discs | the map jumps on a null segment `Σ_X` | partial (not global) regularity; hypotheses per R02 |
| 8.5 | `μ_t=δ_t`, `γ(t)=t` | speed `1`; quotient over `J_{t,h}` is `1` for `h<0` (ordered interval: `0`) | repaired |
| 8.6 | `μ_t=δ_{2t}` | `W_∞(μ_s,μ_t)=2\|t−s\|`; ess-sup speed `2` | holds |
| 8.7, 8.8 | `μ_t=δ_{2t}`, `v≡2` | the CE test integral is `∫d/dt φ(t,2t)dt` (boundary terms only); `∫∫\|v\|^p=2^p=A_p(γ)=W_p^p` | holds; no `1/p` |
| 10.1 | `Φ=x²/2`, `x_t=e^{−t}` | `\|ẋ\|=e^{−t}=\|∂Φ\|(x_t)`; `Φ(1)−Φ(x_t)=(1−e^{−2t})/2=∫(½\|ẋ\|²+½\|∂Φ\|²)` | EDI equality holds |
| 11.1 | `μ=2δ`, `ν=δ`, `κ=2δ`, `η=δ` | `8log2−3` vs `6log2−3` | fails: R03 |
| 11.2 | `μ=2m_a`; heavy tail `1/(x log²x)` | `2log2−1` on both sides; `∞` vs `−∞` | repaired restriction holds |
| 11.3 | standard Gaussian in `ℝ²` with `v=Jx` (rotation) | CE holds with `μ_t≡μ`; the minimal-norm tangent field is `0`, so `\|μ′\|=0` | "closure of gradients" discriminates |
| 12.3 | `ℝ`, `δ₀,δ₂`, weights `1/2` | `p=2`: `T(0,2)=1`; `p=1`: every point of `[0,2]`, so a Borel selection is needed | holds |
| 12.5 (R01) | `P=(δ_{δ₀}+δ_{δ₂})/2`, `p=2` | barycenter `δ₁`, value `1`; `δ₀` gives `2` | statable; add |
| 12.8 time | weights `1−t,t`, exponent `p` | `(s/(1−s))^{p−1}=t/(1−t)` gives the README formula; `p=2` gives `s=t` | holds |
| 7.6 (R01) | `ℝ`, `U[0,1]→U[1,2]`, `c=\|x−y\|` | `T=x+1` optimal with cost `1`; other optimal plans exist | existence holds, uniqueness fails (README agrees) |
| 13.2 (R05) | `μ=ν=(δ₀+δ₁)/2`, `R=μ⊗ν` | Schrödinger value `0`, unique minimizer `R` | the pin covers it without separability |
| 13.8 | `K=[[2,1],[1,2]]`, `a=b=(½,½)`; `K=[[1,1],[0,1]]` | `3uv=½`; entry `(1,2)` lies on no positive diagonal, so no doubly stochastic scaling | holds |
| 13.9 | same `K` | `Δ=log4`; `tanh(log4/4)=1/3` | holds |
| 13.13 | `γ(t)=2t` | `½∫4=2=\|2\|²/2` | holds |
| 15.5 | one-point kernels `1/n` in `Z=(0,1)` | `GW_p=\|1/n−1/m\|`, no limit | "complete iff `Z` complete" holds |
| 15.10 | one-point kernels `0,2`; uniform two-point `a,b` | `p=1`: minimizers `[0,2]`; `p=2`: `(z−1)²+1`; `GW_p=2^{−1/p}\|a−b\|` (minimum over `πₐ` of `½\|a−b\|^p+4u(a^p+b^p−\|a−b\|^p)`) | holds |
| Layer 2 Examples | `c=\|x−y\|`, `φ=(0,1)` | `φᶜ=(0,−1)`; contact `{(0,0),(1,0),(1,1)}`; supremal `φᶜ(1)=1` violates `φ(1)+φᶜ(1)≤0` | holds |
| Layer 6/9 Examples | `u=‖x‖` on `ℝ²`; `V=x²/2` along `δ_{2t}` | `MA_u=πδ₀`; `2t²=2t²` with the ½ convention, and `½≤0` false without it at `t=½` | holds |

## Not verifiable

- **Paywalled texts, not opened:** Villani 2009, including "Theorem 10.35" for the noncompact McCann form, Def 6.8, Thm 6.9 and Thm 6.18; McCann 2001 (GAFA); the AGS book; Brenier 1991 (Wiley); Caffarelli 1990/1992; Villani 2003 (AMS). The McCann, 3.3, 3.4, 5.5, 6.9, 8.7, 10.1 and 11.3 statements were checked only by the computations above.
- **Numbering versions:** `legouic-loubes` was read at arXiv v2 and `depf-survey` at arXiv v1. Their numbering may differ from the published versions, and the README links the arXiv copies.

## Source issues

- **Gap** in bmnn at Theorem 45, printed p. 36: the proof chooses a geodesic of `Z` for each pair of kernel values with no measurable selection; it should use a Borel bicombing or a measurable selection so that the interpolated kernel is measurable; affects the proof.
- **Error** in bmnn at Proposition 36, printed p. 30: the proof takes a countable dense subset of metric-valued `Lᵖ` through Proposition 8 for every `p ∈ [1,∞]`; it should be restricted to finite `p`, because the `L∞` space is not separable; affects a stated result.
- **Misprint** in alvarez-esteban-barycenters at the proof of Theorem 4.2, printed p. 12: the source writes the weight `λ_k` inside a sum indexed by `j`; it should be `λ_j`; affects nothing.
