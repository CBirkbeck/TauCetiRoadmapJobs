# Review of OptimalTransport (pull request #950 at 9b14026)

**Verdict:** needs changes

This is a full review: the folder changed by 411 lines since `3ba79e2`. It has three findings, all P3. All four findings of the previous review are repaired. The gate passes at this head, and so does the dependency check.

## Status of the previous review's findings (read at `3ba79e2`)

- **R01 (P3, implemented targets uncited): repaired.**
  - 1.4 (`README.md:1385–1400`) cites `TauCeti.lowerSemicontinuous_lintegral_probabilityMeasure`, `TauCeti.le_liminf_lintegral_of_tendsto_probabilityMeasure` and `TauCeti.lowerSemicontinuous_planCostBddBelow`, with Ambrosio–Gigli Theorem 1.5, pp. 5–6, as locator.
  - 5.2 (`:2170–2181`) now reads "Alexandrov's twice-differentiability theorem is `ConvexOn.ae_existsUnique_isPositive_isLittleO`", and 6.2 (`:2451`) points to it.
  - 10.5 and 10.6 (`:3711`, `:3725`, `:3770–3777`) cite the three maximal-slope declarations.
  - 12.1–12.3 (`:4236–4253`, `:4277–4290`, `:4307–4318`) cite the Fréchet-mean declarations, and the two `WassersteinSpace` names stand in 12.3 only.
  - Every name resolves at Tau Ceti `2fd255d`, with the hypotheses the README records (files and lines below).
- **R02 (P3, 10.5 hypotheses and locator): repaired.** `README.md:3690–3726` states three theorems. The existence statement matches `TauCeti.exists_isGeneralizedMinimizingMovement` hypothesis by hypothesis. The maximal-slope statement matches `TauCeti.isCurveOfMaximalSlope_of_forall_mem_moreauYosidaResolvent`, including the intermediate resolvent points and the measurability clause. The EVI statement is Ambrosio–Gigli's Assumption 3.24 and Theorem 3.25 (`ambrosio-gigli-guide` lines 3340–3378, p. 64), which the source states for every real `λ` with `0 < τ < 1/λ⁻`. The *Needs:* line reads "items 1--4; Layer 8.1", and the two negative-control Checks (`-x⁴`, `-x²`) are present and correct (table).
- **R03 (P3, 11.8 locators): repaired.** `README.md:4088–4119` cites (3.45) and Proposition 3.33 (iii), p. 72, (3.47), p. 73, Definition 3.32 with (3.44), p. 71, the display on p. 72, Theorem 3.35, p. 74, and Proposition 3.38, p. 75. All are at those places (`ambrosio-gigli-guide` lines 3701–3738, 3806–3809, 3827–3838, 3934–3940). The clause on `(z^α - z)/(α-1)` is there, and the sharpness claim is marked as proved here. The README's range `max(1-1/n, n/(n+2)) < m < 1` is right where the source's (3.47) is not: see Source issues.
- **R04 (P3, first author's initial): repaired.** `README.md:5775` reads "M. Bauer, F. Mémoli, T. Needham, and M. Nishino".

## R01 (P3) — 6.11 names two of its three regression examples without a statement or a locator

**Location.** `README.md:2722–2724`: "density bounds alone do not imply all `W²,p` estimates; and strict convexity cannot be omitted in higher dimensions."

**Claim.** Every target carries exact hypotheses and a locator. The first example of 6.11 does (Tau Ceti's `TauCeti.exists_isKantorovichOptimalTransportMap_gradient_and_not_continuousOn`); the other two say neither which function, which dimension, nor which estimate.

**Witness.** Both are in a readable source, `depf-survey` p. 18: the non-`C²` solution (2.26), for `n ≥ 3` (lines 709–714); the two-dimensional contrast (lines 719–720); the `W^{2,p}` counterexample (lines 740–741). The survey's determinant in (2.26) is wrong (Source issues), so the formula cannot be copied.

**Repair.** Replace the two clauses with these statements.

1. For every `p > 1` there is `f` with `0 < λ(p) ≤ f ≤ 1/λ(p)` and an Aleksandrov solution of `det D²u = f` that is not in `W^{2,p}_loc` (X.-J. Wang's counterexample, quoted in the De Philippis–Figalli survey, p. 18). This is why 6.9 asks for continuity of `f`, and why 6.8 stops at `W^{2,1+ε}`.
2. For `n ≥ 3` and `a = 2 - 2/n`, the function `u(x₁,x') = |x'|^a (1 + x₁²)` on `{x₁² < ρ²}`, for a fixed `ρ² < (n-2)/(3n-2)`, is convex, of class `C^{1,1-2/n}` and not `C²`. It is an Aleksandrov solution of `det D²u = 2a^{n-1}(1+x₁²)^{n-2}((a-1) - (a+1)x₁²)`, a smooth positive right-hand side. It vanishes on the segment `{x' = 0}`, so it is not strictly convex (survey, (2.26), p. 18, with the determinant corrected). In dimension two every Aleksandrov solution of `det D²u ≥ λ > 0` is strictly convex (Alexandrov, quoted there), which is what "higher dimensions" means.

Add the survey, p. 18, to the *Needs:* line.

**Check.** With `g = r^a`, `h = 1 + x₁²`: the Hessian has `n-2` tangential eigenvalues `a r^{a-2} h` and a `2×2` block of determinant `2a r^{2a-2}((a-1) - (a+1)x₁²)`; the powers of `r` cancel because `na - 2n + 2 = 0`. For `n = 3`: `(32/27)(1+x₁²)(1-7x₁²)`, which is `640/2187 > 0` at `x₁ = 1/3` and `-10/9 < 0` at `x₁ = 1/2`. For `n = 2` the same formula gives `-4x₁²`, so the function is not convex, as the two-dimensional theorem requires.

## R02 (P3) — 6.8 states the covering lemma without the hypotheses of the declaration it cites

**Location.** `README.md:2652–2654`: "The covering lemma is `TauCeti.exists_countable_pairwiseDisjoint_convexSection_measure_le`, a countable disjoint subfamily carrying a fixed fraction of the measure of the union."

**Claim.** The sentence before it (`:2644–2646`) gives the common hypotheses of "three parts of the package": `u` convex on an open `Ω`, a supporting slope, bounded sections with closure in `Ω`, constants depending only on the space and the measure. Read with them, the covering lemma holds for every convex `u`, with a fraction independent of `u`.

**Witness.** The declaration (`TauCeti/Analysis/Convex/MongeAmpere/Vitali.lean:246` at `2fd255d`) assumes more.
- `λ μ ≤ MA_u ≤ Λ μ` on `Ω`, with `λ > 0`.
- A set `D` containing the sections, whose sections of height `H` are bounded with closure in `Ω`.
- Heights with `4θh_i ≤ H` and `2θ²h_i ≤ H`, where `θ = 1 + CΛ/λ`.

Its conclusion is `μ(⋃_t S_i) ≤ √(A(2θ²)ⁿΛ/λ) μ(⋃_s S_j)`. The fraction tends to `0` as `Λ/λ → ∞`.

The same sentence over-states one hypothesis in the other direction: the lower volume estimate (`…/MongeAmpere/Section.lean:345`) needs no supporting slope. That is harmless.

**Repair.** Write: "The covering lemma is `TauCeti.exists_countable_pairwiseDisjoint_convexSection_measure_le`: when `λ dx ≤ MA_u ≤ Λ dx` on `Ω` with `λ > 0`, `θ = 1 + CΛ/λ`, and the sections of height `H` centred in a set `D` are bounded with closure in `Ω`, every family of sections `S_i ⊆ D` with supporting slopes and heights `4θh_i ≤ H`, `2θ²h_i ≤ H` has a countable disjoint subfamily with `|⋃ S_i| ≤ √(A(2θ²)ⁿΛ/λ) |⋃ S_j|`; `C` and `A` depend only on the space and the measure."

**Check.** For `u = ‖x‖²/2` on `ℝⁿ`: `MA_u = dx`, `λ = Λ = 1`, the sections are the balls of radius `√(2h)` (6.8's first Check), and the statement is the classical Vitali lemma with a constant depending on `n` alone.

## R03 (P3) — 13.13 cites Léonard's paper without pages or version, and Schilder's principle without a locator

**Location.** `README.md:4868–4875`: "build Schilder's path-space large-deviation principle in Laplace-principle form … (Léonard, *From the Schrödinger problem to the Monge--Kantorovich problem*, Proposition 3.4 and Theorems 3.6--3.7: …)". The References entry (`:5781–5782`) gives no version.

**Claim.** Every other arXiv citation of the roadmap gives the version read and the page. Schilder's principle, the first theorem of the subsection, has no locator at all.

**Witness.** In arXiv:1011.2564v1 (read through the sources service; it is not in the manifest):
- Proposition 3.4 is on p. 14 (the Γ-limit of `(1/k)H(·|R^{k,μ₀}) + ι_{P₀=μ₀}`, for a reference with a fixed initial law);
- Theorem 3.6 is on p. 15 (convergence of values and of minimizers along `μ₁ᵏ → μ₁`);
- Theorem 3.7 is on pp. 15–16 (the static cost `c(x,y) = inf C`, and the bridge mixture);
- Schilder's theorem is Theorem 3.9, p. 17: `x + √(1/k) B` satisfies the large-deviation principle in `C([0,1],ℝᵈ)` with scale `k` and rate `∫₀¹ |ω̇ₜ|²/2 dt`, with a pointer to Dembo–Zeitouni, Theorem 5.2.3.

The README's description of 3.4–3.7 is correct.

**Repair.** In 13.13 write "(Léonard, …, arXiv:1011.2564v1, Proposition 3.4, p. 14, Theorem 3.6, p. 15, and Theorem 3.7, pp. 15–16: …)". After "including exponential tightness" add "(Schilder's theorem as stated in the same paper, Theorem 3.9, p. 17, for `x + √ε B` with scale `1/ε` and rate `∫₀¹ |ω̇ₜ|²/2 dt`; proof in Dembo–Zeitouni, *Large Deviations Techniques and Applications*, Theorem 5.2.3)". Add "theorem numbers from arXiv v1" to the References entry, and Dembo–Zeitouni to the References.

**Check.** With `k = 1/ε` the process is the `√ε`-Brownian path of 13.12's generator `(ε/2)Δ`. The rate of `γ(t) = 2t` is `(1/2)·4 = 2`, the endpoint rate `|2-0|²/2` of the layer's Examples.

## Verified sound

**Gate, build, dependency check.**
- The worker's gate on this head: every counter `0`, `build=0`, `OK`.
- `lake env lean` on `Suggested.lean` at the branch pin (Mathlib `6b7abb3`, Tau Ceti `a91d3aa`): exit 0, with exactly eight `declaration uses 'sorry'` warnings, at `:116, :140, :169, :205, :229, :253, :270, :292`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/OptimalTransport'` is empty. The description's "It changes no other folder" is true.
- The dependency check printed `depcheck: 233 roadmaps, 2263 edges, 0 problem(s)`, with no UPWARD or CYCLE line.

**Signatures and padding.**
- A scratch copy with `#check @name` for all eight declarations elaborated with exit 0. The file has no `variable` block, so no binder can be lost. `Suggested.lean` is unchanged since `3ba79e2`. Each elaborated type agrees with its README statement. The one known difference is declared in the docstring: at `n = 0` the truncated `n - 1` makes the Agueh–Carlier hypothesis unsatisfiable.
- On a second scratch copy every `sorry` was replaced by `first | rfl | infer_instance | (simp; done) | trivial | exact ⟨_, rfl⟩ | (intros; exact ⟨_, rfl⟩) | (intros; simp_all; done) | aesop | omega | (intros; positivity) | (intros; exact le_rfl) | (exact?; done)`. All eight fail (eight errors), so no headline closes in one tactic.
- Each of the eight theorem names appears once in the README.
- Headlines: the eight stated, the seventeen the docstring lists as proved at `2fd255d`, the five with no carrier in either library, and the six whose carriers the branch's pinned Tau Ceti lacks. I checked eleven carriers of the last group (`relaxedTransportCost`, `SatisfiesWeakMTW`, `IsCConvexSet`, `IsEVISolution`, `GeneralizedGeodesicallyConvex`, `moreauYosidaResolvent`, `boltzmannEntropy`, `sinkhornDivergence`, `cheegerEnergy`, `CurvatureDimensionInfinity`, `GromovWassersteinSpace`): each has no declaration at `a91d3aa` and one at `2fd255d`. Mathlib at `6b7abb3` has `IsCadlag` (`Mathlib/Topology/Order/Cadlag.lean:104`) and the real Brownian predicates (`Mathlib/Probability/BrownianMotion/Basic.lean`), as the docstring says.
- `library-matches.md` lists no declaration with the same statement as a headline. In Tau Ceti at `2fd255d`, `IsKantorovichOptimalTransportMap` occurs in seven files; none proves the Gangbo–McCann, Caffarelli, De Philippis–Figalli, McCann or Figalli headline. No file under `…/OptimalTransport/` mentions `dimH`.

**Library declarations.**
- The README has 462 backticked names with a library prefix. 415 have a declaration of that final name in Tau Ceti at `2fd255d`. Of the other 47, two are the namespace suggestions of 16.1, and each of the 45 Mathlib names has a declaration of that final name in Mathlib at `6b7abb3` (matched by final name component, not by elaboration).
- Opened at `2fd255d` and compared with the README's hypotheses (paths under `TauCeti/`; `…/` is `MeasureTheory/OptimalTransport/`):
  - Layer 1: `…/Compactness.lean:96, 185`; `…/Existence/Basic.lean:226`; `…/Stability.lean:316, 356, 440`; `MeasureTheory/Measure/LowerSemicontinuousLintegral.lean:87, 97`; `…/Cost/BoundedBelow.lean:164, 186`.
  - Layer 2: `…/Cost/Partial/Basic.lean:48, 126`; `…/Duality/Relaxed.lean:129, 163`; `…/Cost/Partial/Integrable.lean:151, 163`; `…/Cost/Partial/Truncation.lean:96`.
  - Layers 5–6: `Analysis/Convex/FenchelMoreau.lean:221`; `Analysis/Convex/EffectiveDomain.lean:59`; `Analysis/Calculus/Rademacher.lean:96`; `Analysis/Convex/Alexandrov.lean:603, 623`; `Analysis/Convex/MongeAmpere/Basic.lean:231, 312, 515, 563`; `…/MongeAmpere/Cone.lean:234, 274`; `…/MongeAmpere/Comparison.lean:67, 129, 239`; `…/MongeAmpere/Convergence.lean:150, 225, 269`; `…/MongeAmpere/Viscosity.lean:115, 415, 432`; `…/MongeAmpere/Decomposition.lean:498, 542`; `…/MongeAmpere/Section.lean:345, 382`; `…/MongeAmpere/Engulfing.lean:166`; `…/MongeAmpere/Vitali.lean:246`; `…/DisconnectedTarget.lean:89`.
  - Layers 8–11: `…/Wasserstein/Superposition.lean:194`; `…/Wasserstein/Geodesic/Basic.lean:112, 305, 374, 441, 565`; `Analysis/GradientFlow/EVI/Basic.lean:96, 377, 407`; `Analysis/GradientFlow/EVI/Semigroup.lean:206`; `Analysis/GradientFlow/MinimizingMovement.lean:455, 606`; `Analysis/GradientFlow/MaximalSlope/MinimizingMovement.lean:156`; `Analysis/GradientFlow/MaximalSlope/Convergence.lean:105`; `Analysis/GradientFlow/MoreauYosida/Derivative.lean:140`; `…/Wasserstein/TangentSpace.lean:86, 131, 198`; `…/Wasserstein/GeneralizedGeodesic/Convex.lean:100`.
  - Layer 12: `MeasureTheory/Measure/FrechetMean/Basic.lean:58, 68, 78, 107, 128, 146, 161, 250, 270, 288`; `…/FrechetMean/Support.lean:57`; `…/FrechetMean/Selection.lean:201`; `…/FrechetMean/CATZero.lean:117`; `Topology/MetricSpace/CATZero.lean:68`; `…/Wasserstein/FrechetMean.lean:48`; `…/MultiMarginal/Barycenter.lean:478`.
- Apart from R02, each README description agrees with the declaration. Two examples. 1.4's "upper semicontinuous" split terms are the hypotheses `ha`, `hb` of `lowerSemicontinuous_planCostBddBelow`. 10.5's first theorem lists the five hypotheses `hl`, `hd`, `hφ`, `hcpt`, `h₀` of `exists_isGeneralizedMinimizingMovement`.

**Cross-roadmap citations and ownership.**
- `overlaps.md` reports no conflicting head, no dropped id and no id that only an open revision defines; `citations.md` reports no unresolved citation or name.
- Supplier sections resolved on main (six roadmaps, eighteen section ids): Hopf–Rinow Layers 1–4 (`Completed/HopfRinow/README.md:264, 427, 451, 495`); RiemannianGeometry R1–R3 (`:186, 322, 369`) and R4 item 6 (`:717`, injectivity radius, cut locus, measurability and volume-nullity); DifferentialGeometry 12.2–12.5 (`:918–930`); GeometricMeasureTheory G2 (`:148, 158`); PDE §1.6, §1.7, §2.4, §6.3 (`:905, 996, 1241, 2309`); OneParameterSemigroups Part A (`:90`).
- Consumers at open heads cite ids that exist here: CompactQuantumMetricSpaces (Layers 0–3), VonNeumannAlgebras (Layers 2 and 8.2), ManifoldOptimization (Layers 9, 10, 13A, 13B item 8), StochasticCalculus (§13C item 12), RiemannianGeometry (Layer 7).
- I grepped every open head and main for sixteen objects: Wasserstein, Kantorovich, Monge–Ampère, minimizing movement, evolution variational inequality, Cheeger energy, CAT(0), Fenchel–Moreau, Schrödinger bridge, curvature-dimension, Fréchet mean, Γ-convergence, Aleksandrov, Schilder, Jankov, relative entropy. No second owner of an object of this roadmap. PDE's "Aleksandrov" hits are the Aleksandrov–Bakelman–Pucci estimate, which PDE §3.2 proves without Alexandrov's theorem (`PDE/README.md:1417`). ReductiveGroupsPartII's CAT(0) hits are buildings.

**Seeded sample, read at the text (15 targets).**

| Target | Locator | Result |
|---|---|---|
| 1.2 | Tau Ceti `isClosed_setOfPred_isCoupling` | matches: measurable opens on factors and product, `T1` spaces of probability measures |
| 1.5 | Ambrosio–Gigli Thm 1.5, p. 5; Tau Ceti | correct (`ambrosio-gigli-guide` line 219: lower semicontinuous and bounded below) |
| 1.6 | Tau Ceti (`Stability.lean`) | the three statements match: liminf stability and recovery plans give convergence of values; subsequential optimal limits; lower semicontinuity in the marginals on Polish spaces |
| 2.5 | BLS (6), (7), pp. 2–3; Thm 1.2, p. 3; Cor. 3.1, 3.3, p. 7; Thm 3.4, 3.5, p. 8; Example 1.1, p. 2; BS Thm 1, 2, p. 2 | correct (`bls-general-duality` lines 91–103, 108–120, 131–151, 389–403, 442–457; `beiglbock-schachermayer-borel` lines 60–63, 112–118). The README keeps the "finite transport plan" hypothesis of BS Theorems 1–2 |
| 5.7 | Ambrosio–Gigli Def. 1.23, p. 15; Thm 1.24, Def. 1.25, Thm 1.26, p. 16 | correct (lines 876–902); Thm 1.24 is stated there without proof, as the README says |
| 6.1 | Tau Ceti | definition, local finiteness, `det(D²u) dx` and the cone match |
| 6.11 | Tau Ceti for the first example | R01 for the other two |
| 8.3 | Lisini 2007, Thm 5; Tau Ceti | Tau Ceti statement matches (`1 < p < ∞`, complete separable metric space, equality of actions and of speeds). Lisini 2016 calls the result "Theorem 5 of [8]" (`lisini-orlicz` lines 57, 471); the 2007 text was not read |
| 8.4 | Tau Ceti | the characterization for `1 < p < ∞` on a complete separable metric space and the least-action formula match; Ambrosio–Gigli Thm 2.10 is on p. 31 and Lemma 2.11 on p. 34, as 9.2 and 8.2 say |
| 10.3 | Muratori–Savaré Thm 3.5, pp. 18–19 | correct (`muratori-savare` lines 940–972): (3.10), (3.13), (3.17); the displayed estimate is (3.13) with the slope term dropped |
| 11.3 | AGS Def. 8.4.1, Lemma 8.4.2 (uncertified); Tau Ceti | the Tau Ceti definition is the closure of gradients of smooth compactly supported functions; the Dirac and orthogonality statements match |
| 12.1 | Tau Ceti | matches, including "for every measure" and the hereditarily Lindelöf support formula |
| 12.3 | Le Gouic–Loubes Lemma 7 and Thm 8, p. 11; Tau Ceti | correct (`legouic-loubes` lines 410–413, 430–440); the Tau Ceti selection is on a proper metric space, with no geodesicity |
| 13.13 | Léonard 2012 Prop. 3.4, Thm 3.6–3.7; survey Informal Statement 5.1 | statements correct in arXiv:1011.2564v1; `leonard-survey` line 1393 is the informal statement and points to that paper; R03 for the missing pages and the missing Schilder locator |
| 16.3 | none needed | an organizational target with no mathematical statement |

**Adversarial table** (sample, headlines, the repaired targets, and every target a finding touches).

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| H1 Gangbo–McCann | `h = x²/2`, `U[0,1] → U[1,2]`; `d = 0` | `T = x+1`, cost `1/2`; one point, `T = id`, cost `0` | holds |
| H2 Caffarelli | `X = (0,1)`, `Y = (0,2)`, `f = 1`, `g = 1/2`, `l = 1/2`; `n = 0`, `X = ∅` | `T = 2x`, exponent `1`; zero measure is not a probability | holds; vacuous on `∅` |
| H3 De Philippis–Figalli | `c = 2 − ⟨x,y⟩` on unit balls; `c ≡ 0` | `−Dₓc = y` injective, `D_yDₓc = −id`; `−Dₓc ≡ 0` | twist excludes `c ≡ 0` |
| H4 McCann | `M = ℝ`, `U[0,1] → U[1,2]` | `T = x+1`, cost `1/2` | holds |
| H5 Figalli | `U[0,1] → U[1,2]`, `c = \|x−y\|` | `x+1` costs `1`; `2−x` costs `∫₀¹ (2−2x) dx = 1` | existence only, as stated |
| H6 Agueh–Carlier | two segments in `ℝ²`; `n = 0` | two midpoint laws of value `(1/4)(1/3+1/3) = 1/6`; `dimH univ = 0 ≤ 0` forces `μ_j univ = 0` | excluded by `hsmall`; vacuous at `n = 0`, as the docstring says |
| H7 Gaussian | `n = 1`, `C = (1,4)`, `w = (1/2,1/2)` | `S = (1/2)√S + √S`, `√S = 3/2`, `S = 9/4` | holds |
| H8 Schrödinger potentials | one-point spaces | `dπ/dR = 1`, `φ + ψ = 0`, pairs `(a,−a)` | holds |
| 1.2 | `μ = ν = (δ₀+δ₁)/2`; `δ_{(1/n,1/n)}` | rows of `π_s`: `s + (1/2−s) = 1/2`, `s ∈ [0,1/2]`; weak limit `δ_{(0,0)}`, total variation `2` | holds |
| 1.4 | `δ_{(1/n,1/n)}`, `c = 1` off `(0,0)`; `c = 1` at `(0,0)` only | `1 → 0`: `0 ≤ liminf 1`; `0 → 1`: fails for the upper semicontinuous cost | hold |
| 1.5 | `c ≡ ∞` | every coupling optimal, value `∞` | attainment at `∞`, as stated |
| 1.6 | `δ_{1/n} → δ₀`, `ν = δ₁`, `c = \|x−y\|`; `c = 1_{x=0}` | values `1 − 1/n → 1`, plans `δ_{(1/n,1)} → δ_{(0,1)}`; values `0`, limit `1` | holds; liminf hypothesis is needed |
| 2.5 | BLS Example 1.1; `δ₀`, `δ₀`, `c ≡ 5` | `P = 1`, `P^ε = 0`, `P^rel = D = 0`; `P^ε = 5(1−ε)`, `P^rel = 5 = P` | hold |
| 5.7 | `ℝ`: `δ₀ → (δ₋₁+δ₁)/2`; `ℝ²`: segment to two segments | no map; value `1/2`, `P(σ = 1 \| s) = 1/2` forced, not an indicator | unique optimal plan, not a map |
| 6.1 | `‖x‖²/2`; `‖x‖` on `ℝ²`; `\|x\|` on `ℝ` | Lebesgue; `π δ₀`; `2δ₀` | hold |
| 6.2 | `F_k = √(x²+1/k)`; `Ω = (−1,1)`, `u = x²−1`, `v = \|x\|−1` | `2/√(1+1/k) → 2`, and `0` against `2` on `{0}`; masses `4 ≥ 2`, `v(1/2) = −1/2 > −3/4 = u(1/2)`; `1·2 ≤ 4·2` | hold |
| 6.8 (R02) | `‖x‖²/2`; fraction as `Λ/λ → ∞` | balls of radius `√(2h)`, `λ = Λ = 1`; `1/√(A(2θ²)ⁿΛ/λ) → 0` | hypotheses missing in the README sentence |
| 6.11 (R01) | `n = 3` at `x₁ = 1/3`, `1/2`; `n = 2` | `640/2187`; `−10/9`; `−4x₁²` | survey's domain `B_{1/2}` and factor `(1−x₁²)` are wrong; unstated in the README |
| 8.3 | `δ_{2t}`, `p = 2`; `(1−t)δ₀+tδ₁`, `p = 1` | lift `δ_γ`, `∫\|γ̇\|² dη = 4 = \|μ̇\|²`; no lift on continuous paths | `p > 1` needed, as stated |
| 8.4 | `(δ₀+δ₁)/2 → (δ₁+δ₂)/2` | monotone: distance `t`; antitone: `δ₁` at `t = 1/2`, distance `√(1/2) ≠ 1/2` | holds |
| 10.3 | `Φ = λx²/2`; `Φ = x²/2`, `y = 0`, `x₀ = 1` | both sides `(λ/2)(y² − x_t²)`; `e^{−2t}/2 ≤ (1 − e^{−t})/(2(e^t − 1)) = e^{−t}/2` | hold |
| 10.5 | `Φ = x²/2`; `−x⁴`; `−x²` | `(1+t/k)^{−k} → e^{−t}`; infimum `−∞`; step `x/(1−2τ)` for `τ < 1/2`, `(1−2t/k)^{−k} → e^{2t}` | hold; step range sharp |
| 11.3 | `δ₀`; uniform disc, `v = (−x₂,x₁)`; `δ_{2t}` | all of `ℝⁿ`; `∫⟨∇φ,v⟩ = 0`; velocity `2` | hold |
| 11.8 | `n = 3`; `n = 1`, `m = 1/4`; `n = 2`, `m = 1/2` | `1 − 1/3 = 2/3 > 3/5`; moment `5`, `∫ρ^{1/4} = ∞`; `∫dr/(r log²r) = 1`, `∫dr/(r log r) = ∞` | hold |
| 11.2 | `μ = 2m_a` | `klDiv = 2 log 2 + 1 − 2`; right side `Ent + a∫d² + 2 log Z_a + 1 − 2`, equal | holds |
| 12.1 | `(δ₀+δ₂)/2`, `p = 2`, `p = 1`; Cauchy | `(x−1)² + 1`, radius `1`; `(\|x\|+\|x−2\|)/2 = 1` on `[0,2]`; `∞` everywhere | hold |
| 12.3 | `ℤ ⊂ ℝ`, points `0`, `2`, weights `1/2` | `p = 2`: minimum `1` at `x = 1`; `p = 1`: value `1` at `0`, `1`, `2` | proper and not geodesic; a selection is needed |
| 12.4 | `(1−1/j)δ_{δ₀} + (1/j)δ_{δ_j}`, `p = 2` | `W₂² = j`; barycenter mean `(1/j)·j = 1` | holds |
| 13.13 | `π = N(0,I₂)`, `ε = 1`; `γ(t) = 2t` | identity: `1 − log(2πe) + (1/2)log(2π) = −(1/2)log(2π)`; direct integral `−(1/2)log(2π) − 1 + 1`; rate `2` | holds |

## Not verifiable

- **Villani 2009** (Theorems 5.10, 6.9, 6.18, Particular Case 5.16, Chapters 10 and 29) and **Villani 2003** (Theorems 1.14 and 2.12): paywalled, not in the sources cache.
- **Ambrosio–Gigli–Savaré 2008** (including §7.1, §8.1, Theorem 8.3.1, Definition 8.4.1, Lemma 8.4.2, Lemma 9.2.1, Definitions 10.1.1 and 10.3.1, Theorem 4.0.4), **Kechris** and **Huang**: settled as uncertified and cited by locator only.
- **Lisini 2007**: the sources service refused the landing page on `cvgmt.sns.it` (host in no licence class). The theorem number is confirmed only through Lisini 2016.
- **Dembo–Zeitouni**, Theorem 5.2.3, which R03's repair names: not read; the number is taken from arXiv:1011.2564v1, p. 17.
- **X.-J. Wang's counterexample** and **Alexandrov's two-dimensional theorem**, which R01's repair names: read only as quoted in the survey.
- Not re-read this round, because they lie outside the sample: **Pratelli 2007**, **Gangbo–McCann 1996**, **Agueh–Carlier 2011**, **Brenier 1991**, **Caffarelli 1990/1992**, **Loeper 2009**, **Ma–Trudinger–Wang 2005**, **Abedi–Li–Schultz**, **Bertrand**, **Gigli–Rajala–Sturm**, **Cavalletti–Mondino**, **Feydy et al.**
- **Elaboration at main's pin** was not run: this review runs Lean only from the pull-request worktree, whose manifest pins Tau Ceti `a91d3aa`. The Tau Ceti statements at `2fd255d` were read as source text.

## Source issues

- **Error** in depf-survey at (2.26), p. 18: the source says `|x'|^{2-2/n}(1+x₁²)` has Hessian determinant `c_n(1+x₁²)^{n-2}(1-x₁²)`, positive in `B_{1/2}`; it should be `c_n(1+x₁²)^{n-2}(1 - ((3n-2)/(n-2))x₁²)`, positive only for `x₁² < (n-2)/(3n-2)`; affects a stated result.
- **Error** in ambrosio-gigli-guide at (3.47), p. 73: the source says the powers `(z^α - z)/(α-1)` with `α ≥ 1 - 1/d` satisfy both (3.44) and (3.45); it should also require `α > d/(d+2)`, which fails for some such `α` when `d = 1, 2`; affects a stated result.
- **Misprint** in ambrosio-gigli-guide at Theorem 3.25, (3.31), p. 64: the source says squared distances contract with factor `e^{-λt}`; it should be `e^{-2λt}` (or unsquared distances, as on p. 76); affects nothing.
- **Misprint** in ambrosio-gigli-guide at Theorem 1.26 (i), p. 16: the source says there is only one transport plan from `μ` to `ν`; it should be only one optimal transport plan; affects nothing.
