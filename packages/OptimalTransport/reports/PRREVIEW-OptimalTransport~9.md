# Review of OptimalTransport (pull request #950 at 3ba79e2)

**Verdict:** needs changes

This is a full review: the folder changed by 417 lines since `7112ecf`. It has four findings, all P3. All seven findings of the previous review are repaired. The gate passes at this head, and so does the dependency check.

## Status of the previous review's findings (read at `7112ecf`)

- **R01 (P2, 8.9 lower bound and generality): repaired.** `README.md:3075–3108` now states the two halves (A) and (B) as targets with Ambrosio–Gigli Theorem 2.29, p. 44, as locator. (A) is on complete `M` through Lisini's superposition; (B) and the formula are on compact `M`, "where their route is complete". The route of (B) names its embedding: Mathlib's `exists_embedding_euclidean_of_compact` (`Mathlib/Geometry/Manifold/WhitneyEmbedding.lean:131` at the branch pin), which gives a smooth closed embedding with injective differential, as the README says. The lower bound now reads "applies (B) and `W_p(μ₀,μ₁) ≤ ∫₀¹ |μ̇|(t) dt ≤ (∫₀¹ |μ̇|(t)^p dt)^{1/p}`". The source statements are at `ambrosio-gigli-guide` lines 2141 (p. 40, compact standing assumption), 2328–2337 (Theorem 2.29, p. 44), 2346 (Proposition 2.30, p. 45) and 2451–2467 (Nash embedding, pp. 46–47). Scope (`:91–94`), the *Needs:* line, the layer Dependencies and the docstring (`Suggested.lean:68`) agree.
- **R02 (P2, 11.7 states no theorem): repaired.** `README.md:3766–3815` states the metric convergence and the Fokker–Planck identification with hypotheses, step range `1 + λτ > 0`, topology and locators. I read Assumption 3.24 and Theorem 3.25 (`ambrosio-gigli-guide` lines 3340–3378, p. 64), Proposition 3.28 (line 3634, p. 70), (3.43) (line 3679, p. 71), Theorem 3.35 (line 3827, p. 74), Propositions 3.36 and 3.38 (lines 3881, 3934) and the example on p. 76 (lines 3967–3974). The README's reduction of Assumption 3.24 to convexity along generalized geodesics is correct only for `λ ≥ 0`, and it says so (table). The *Needs:* line now lists 9.4, 9.5, 10.3, 10.4 and 10.5.
- **R03 (P2, 6.14 hypotheses of FKM): repaired.** `README.md:2575–2620` states (B0)–(B3) and (B2)s with both `U_ỹ` and `V_x̃` strongly convex, the two density ratios and the dependence of the exponent, matching `fkm-holder` lines 165–191 (pp. 4–5) and 214–222 (Theorem 2.1, p. 6). Loeper's theorem is stated as the four equivalent conditions of the survey's Theorem 4.6 with the `c`-convexity caveat, matching `depf-survey` lines 1712–1744 (p. 38) and 1857–1860 (p. 40).
- **R04 (P3, implemented targets uncited): repaired for every target it listed.** 4.2, 3.5, 3.6, 3.8, 3.2 and 4.3 now cite their declarations in the text, on the *Needs:* line and in "From Tau Ceti". The hypothesis `MeasurableSingletonClass Y` is gone from 4.2. All names resolve at `2fd255d` (below). The same residue remains in four targets of this round's sample: R01.
- **R05 (P3, 11.9): repaired.** `:3879–3899` states `V ∈ C²(ℝⁿ)` with `∇²V ≥ λI`, the three conclusions, the invariant law under `∫ e^{-V} < ∞`, and locators. "Confining" is gone from 11.9 and from the layer Examples.
- **R06 (P3, 12.3–12.5 locators): repaired.** Lemma 7 and Theorem 8 carry `p. 11`, 12.4 cites Theorem 3, p. 7, and 12.5 cites Theorem 2, p. 6 (`legouic-loubes` lines 410, 430, 256–262, 214).
- **R07 (P3, duplicate references): repaired.** The two works appear once, at `:5379–5382`.

## R01 (P3) — four sampled targets do not cite the Tau Ceti declarations that implement them, and 5.2 calls an implemented theorem a "new prerequisite"

**Location.**
- `README.md:1302–1305` (1.4): "prove lower semicontinuity of `π ↦ ∫⁻ c dπ` for nonnegative lower-semicontinuous `c` … Include a reusable theorem for costs bounded below by integrable marginal terms." Its *Needs:* line names only Mathlib, and it has no locator.
- `README.md:2061–2063` (5.2): "Alexandrov twice differentiability and positivity of the distributional Hessian remain new prerequisites".
- `README.md:3473–3480` (10.5) and `:3503–3513` (10.6).
- `README.md:3947–3963` (12.1), with `:3984–3987` (12.2) and `:4003–4006` (12.3).

**Claim.** Scope (`:61–64`) and `:600–601` say that implemented targets cite their Tau Ceti declarations. 5.2 says Alexandrov's theorem is not yet available.

**Witness.** Tau Ceti at `2fd255d` (the revision the README's contracts name) proves, with none of these names in the README:
- 1.4: `TauCeti.lowerSemicontinuous_lintegral_probabilityMeasure` and `TauCeti.le_liminf_lintegral_of_tendsto_probabilityMeasure` (`TauCeti/MeasureTheory/Measure/LowerSemicontinuousLintegral.lean:87, 97`, on a pseudometric space with measurable opens), and `TauCeti.lowerSemicontinuous_planCostBddBelow` (`TauCeti/MeasureTheory/OptimalTransport/Cost/BoundedBelow.lean:186`).
- 5.2: `ConvexOn.ae_differentiableAt_of_mem_interior` (`TauCeti/Analysis/Calculus/Rademacher.lean:96`), `TauCeti.convexOn_toReal` (`TauCeti/Analysis/Convex/EffectiveDomain.lean:59`), and Alexandrov's theorem `ConvexOn.ae_existsUnique_isPositive_isLittleO` (`TauCeti/Analysis/Convex/Alexandrov.lean:623`).
- 10.5 and 10.6: `TauCeti.isCurveOfMaximalSlope_of_forall_mem_moreauYosidaResolvent` (`TauCeti/Analysis/GradientFlow/MaximalSlope/MinimizingMovement.lean:156`), `TauCeti.IsEVISolution.isCurveOfMaximalSlope` (`…/EVI/MaximalSlope.lean:574`) and the Sandier–Serfaty limit `TauCeti.isCurveOfMaximalSlope_of_tendsto` (`…/MaximalSlope/Convergence.lean:105`).
- 12.1–12.3: `TauCeti.frechetRadius`, `TauCeti.frechetPower`, `TauCeti.frechetRadius_rpow_eq_frechetPower`, `TauCeti.isFrechetBarycenter_iff_forall_frechetPower_le` and `TauCeti.chebyshevRadius` (`TauCeti/MeasureTheory/Measure/FrechetMean/Basic.lean:58–146`); `TauCeti.frechetRadius_top_eq_iSup_support` (`…/FrechetMean/Support.lean:57`); `TauCeti.subsingleton_frechetBarycenters_two` (`…/FrechetMean/CATZero.lean:117`); `TauCeti.exists_measurable_isFrechetBarycenter_sum_smul_dirac` (`…/FrechetMean/Selection.lean:201`, the Borel barycenter application of Lemma 7 on a proper space).

12.1's "Implemented in Tau Ceti by" line names two `WassersteinSpace` theorems instead, which belong to 12.3.

**Repair.**
1. In each of 1.4, 5.2, 10.5, 10.6, 12.1, 12.2 and 12.3, cite these declarations in the text and on the *Needs:* line with the hypotheses they carry, and add them to the matching bullets of "From Tau Ceti".
2. In 5.2, replace the quoted sentence with: "Alexandrov's twice-differentiability theorem is Tau Ceti's `ConvexOn.ae_existsUnique_isPositive_isLittleO`; positivity of the distributional Hessian remains a target here." Give 6.2's mention of Alexandrov's theorem the same citation.
3. In 12.1, move the two `WassersteinSpace` names to 12.3 only.
4. Check the declarations' full names against the files before citing: I read the statements and the enclosing `namespace` lines, not the elaborated names.

**Check.** For `P = (δ₀+δ₂)/2` on `ℝ` at `p = 2`: `frechetPower` at `x` is `(x² + (x−2)²)/2 = (x−1)² + 1`, and `frechetRadius` is its square root; both are minimized at `x = 1`, with radius `1`, as 12.1's first Check says and as `frechetRadius_rpow_eq_frechetPower` requires.

## R02 (P3) — 10.5 names its hypotheses without stating them and has no locator

**Location.** `README.md:3473–3476`: "Prove compactness and convergence from coercivity, lower semicontinuity, and the exact compactness hypothesis on sublevels; prove convergence to a maximal-slope or EVI flow when the corresponding assumptions hold."

**Claim.** Every theorem carries exact hypotheses and a locator.

**Witness.** The text does not say which sets are compact, in which topology, or what "the corresponding assumptions" are. A readable source states them: Ambrosio–Gigli, Assumption 3.8 (p. 55), Assumption 3.13 and Theorem 3.14 (pp. 57–58), Theorem 3.20 (p. 62), Assumption 3.24 and Theorem 3.25 (p. 64) (`ambrosio-gigli-guide` lines 2911, 2988–3005, 3274, 3340–3378). Tau Ceti's `TauCeti.exists_isGeneralizedMinimizingMovement` (`TauCeti/Analysis/GradientFlow/MinimizingMovement.lean:606`) states the existence half with an auxiliary convergence.

**Repair.** Replace the two sentences with three statements.
1. *Existence.* Let `⇀` be a sequential convergence on `X` implied by metric convergence, for which `d` is jointly sequentially lower semicontinuous, `Φ` is sequentially lower semicontinuous along sequences of finite diameter, and every sequence of finite diameter with bounded energy has a `⇀`-convergent subsequence. Let `Φ` be coercive: `inf_y (Φ(y) + d(y,x₁)²/(2τ₀)) > -∞` for some `τ₀ > 0` and `x₁`. Then from every `x₀` with `Φ(x₀) < ∞` at finite distance from `x₁` a generalized minimizing movement starts, and it is `1/2`-Hölder on bounded time intervals (Tau Ceti's `TauCeti.exists_isGeneralizedMinimizingMovement`; Ambrosio–Gigli, Theorem 3.14, first assertion, pp. 57–58, for boundedly compact sublevels in the metric topology).
2. *Maximal slope.* If moreover `Φ` is bounded below, its descending slope is lower semicontinuous on the energy domain and is a strong upper gradient, every such limit is a curve of maximal slope (`TauCeti.isCurveOfMaximalSlope_of_forall_mem_moreauYosidaResolvent`; Ambrosio–Gigli, Assumption 3.13 and Theorem 3.14, second assertion, and Theorem 3.20, p. 62, under the geodesic-convexity Assumption 3.17).
3. *EVI.* Under Ambrosio–Gigli's Assumption 3.24 the discrete solutions converge locally uniformly to the `EVI_λ` solution, with no compactness hypothesis (Theorem 3.25, p. 64); Layer 11.7 is its Wasserstein instance.

Add Layers 10.1–10.3 to the *Needs:* line.

**Check.** `Φ(x) = x²/2` on `ℝ` satisfies all three sets of hypotheses, and the existing first Check computes the limit `e^{-t}x₀`. For `Φ(x) = -x⁴`, `inf_y (-y⁴ + (y-x)²/(2τ)) = -∞` for every `τ > 0`, so no step exists: coercivity cannot be dropped. Add this as a negative-control Check.

## R03 (P3) — 11.8 has no locator

**Location.** `README.md:3819–3843`, from "Deliver the canonical equations" to "under the named coercivity hypotheses of their component energies".

**Claim.** Every theorem carries a locator.

**Witness.** The subsection cites no source. Its three ingredients are in a readable one (`ambrosio-gigli-guide`):
- the growth condition with exponent above `d/(d+2)` and the same Hölder estimate against the second moment: Definition 3.32 with (3.44), p. 71, and the display after it, p. 72 (lines 3701–3730);
- McCann's condition and convexity along interpolating curves: (3.45) and Proposition 3.33 (iii), p. 72 (lines 3737–3738), with the power examples (3.47), p. 73, which require `α ≥ 1 - 1/d` (line 3807);
- the equation `∂ₜρ = div(ρ∇u′(ρ))`: Proposition 3.38, p. 75, stated for smooth densities (lines 3934–3940), and Theorem 3.35, p. 74, for existence of the flow when `λ ≥ 0`.

**Repair.** Add these locators at the three claims. Say in one clause that (3.47) writes the energy density as `(z^α - z)/(α - 1)`, which differs from `U_m` by `r/(m-1)`, a constant on probability densities. Cite a primary source for the fast-diffusion flows themselves, for example the Otto paper that the guide's bibliographical notes name (p. 76, lines 3988–3991); I did not read it, so take its locator from the text. The sharpness claim for `m ≤ n/(n+2)` has no source in the guide; mark it as proved here from the two existing negative-control Checks.

**Check.** For `u = U_m` with `m < 1`: `s ↦ sⁿU_m(s^{-n}) = -s^{n(1-m)}/(1-m)` is convex and nonincreasing exactly when `n(1-m) ≤ 1`, that is `m ≥ 1 - 1/n`, which is (3.47)'s range. The pressure is `rU_m′(r) - U_m(r) = r^m`, so Proposition 3.38's equation is `∂ₜρ = Δ(ρ^m)`, the README's identity `∫∫ (ρ ∂ₜζ + ρ^m Δζ) = 0`.

## R04 (P3) — References give the wrong initial for the first author of the `Z`-Gromov–Wasserstein paper

**Location.** `README.md:5470–5472`: "H. Bauer, F. Mémoli, T. Needham, and M. Nishino, [The `Z`-Gromov--Wasserstein distance]".

**Claim.** The first author is H. Bauer.

**Witness.** The paper's title page names Martin Bauer (`bmnn-zgw` line 7).

**Repair.** Write "M. Bauer".

## Verified sound

**Gate, build, dependency check.**
- The worker's gate on this head: every counter `0`, `build=0`, `OK`.
- `lake env lean` on `Suggested.lean` at the branch pin (Mathlib `6b7abb3`, Tau Ceti `a91d3aa`): exit 0 in 21 s, with exactly eight `declaration uses 'sorry'` warnings, at `:116, :140, :169, :205, :229, :253, :270, :292`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/OptimalTransport'` is empty.
- The dependency check printed `depcheck: 233 roadmaps, 2263 edges, 0 problem(s)`, with no UPWARD or CYCLE line.

**Signatures and padding.**
- A scratch copy with `#check @name` for all eight declarations elaborated with exit 0. The file has no `variable` block, so no binder can be lost. The Lean statements are unchanged since the previous review; only two docstring entries changed (8.9 and 11.7), and both agree with the README.
- On a second scratch copy every `sorry` was replaced by `first | rfl | infer_instance | (simp; done) | trivial | exact ⟨_, rfl⟩ | (intros; exact ⟨_, rfl⟩) | (intros; simp_all; done) | aesop | omega | (intros; positivity) | (intros; exact le_rfl)`. All eight fail (eight errors), so no headline closes in one tactic.
- Headlines: the README's headline theorems are the eight stated, the seventeen the docstring lists as proved at `2fd255d`, the five with no carrier in either library, and the six whose carriers the branch's pinned Tau Ceti lacks. The docstring names each of the last eleven with the carrier it needs. `TauCeti.GeneralizedGeodesicallyConvex` and `TauCeti.moreauYosidaResolvent`, added to the 11.7 entry, are absent at `a91d3aa` and present at `2fd255d`.

**Library declarations.**
- All 413 backticked names of the README with a library prefix (`TauCeti.`, `Matrix.`, `MeasureTheory.`, `ProbabilityTheory.`, `InformationTheory.`, `ConvexOn.`, `StrongConvexOn.`, `AEMeasurable.`, `CovariantDerivative.`, `GromovHausdorff.`, `LipschitzOnWith.`, `LocallyLipschitzOn.`) have a declaration of that name in Tau Ceti at `2fd255d` or Mathlib at `6b7abb3`, except the two namespace suggestions of 16.1.
- Opened at `2fd255d` (paths under `TauCeti/`): `MeasureTheory/OptimalTransport/Wasserstein/KantorovichRubinstein.lean:161, 304, 493, 505`; `…/Wasserstein/BoundedLipschitz.lean:131`; `…/Wasserstein/Measurable.lean:59, 75`; `…/Wasserstein/Borel.lean:127`; `…/Cost/Product.lean:93`; `…/Wasserstein/Monge.lean:45`; `…/Duality/LowerSemicontinuous.lean:183`; `…/Duality/BoundedAbove.lean:266`; `…/Cost/Quadratic.lean:74, 84`; `…/Wasserstein/PopulationBarycenter.lean:240`; `…/GromovWasserstein/Barycenter.lean:152`; `MeasureTheory/Measure/FrechetMean/Stability.lean:163`; `MeasureTheory/Measure/Atom.lean:105`; `Probability/HasLaw.lean:97, 124`; `Analysis/GradientFlow/MinimizingMovement.lean:455, 606`; and the files named in R01.
- Opened in Mathlib at `6b7abb3`: `Geometry/Manifold/WhitneyEmbedding.lean:131`; `MeasureTheory/Measure/Map.lean:225` (`le_map_apply_image`, for an almost everywhere measurable map, as 4.2 says).
- 28 of the 185 files under `TauCeti/MeasureTheory/OptimalTransport/` have no cited declaration (34 at the previous head); those I opened are auxiliary, apart from the ones in R01, which lie outside that folder.

**Cross-roadmap citations and ownership.**
- `overlaps.md` reports no conflicting head, no dropped id and no id that only an open revision defines; `citations.md` reports no unresolved citation or name.
- I grepped every open head and main for "Wasserstein", "Kantorovich", "Sinkhorn", "Benamou", "Fokker", "Ornstein" and "Whitney embedding". The hits outside this roadmap are consumers or unrelated objects: CompactQuantumMetricSpaces, ManifoldOptimization, IncompressibleFlows, RandomMatrices, DysonBrownianMotion (an Ornstein–Uhlenbeck drift for eigenvalue systems), StochasticCalculus (scalar Ornstein–Uhlenbeck equations, and four citations of "OptimalTransport §13C item 12", which is 13.12 here) and VonNeumannAlgebras (Layers 2 and 8.2, which exist). No second owner of an object of this roadmap.
- The supplier sections were resolved at the previous head and their citations are unchanged; the only new supplier is Mathlib's Whitney embedding.

**Seeded sample, read at the text (15 targets).**

| Target | Locator | Result |
|---|---|---|
| 1.4 | none | R01: implemented and uncited |
| 2.4 | Villani 2009 Thm 5.10 (i), (iii); Tau Ceti | Villani not readable; the five Tau Ceti statements match the README's regimes (`LowerSemicontinuous.lean:183`, `BoundedAbove.lean:266`) |
| 3.2 | Tau Ceti | `borelSpace` needs `p ≠ ∞` on a Polish space; `measurable_wassersteinEDist` holds for every `p`; `measurableSpace_le_borel` is one inclusion, as stated |
| 3.8 | Villani 2003 Thm 1.14; Villani 2009 Case 5.16; Tau Ceti | Villani not readable; the four Tau Ceti statements match, including the cap `2R` for the bound `R` |
| 5.2 | Mathlib names | the three Mathlib names exist; R01 for the Tau Ceti side |
| 5.4 | Tau Ceti | `isCyclicallyMonotone_norm_sub_sq_div_two_iff` is the stated dictionary |
| 6.6 | survey Thm 3.1 and (3.3), p. 23; Thm 3.2, p. 24; (3.4)–(3.5), p. 24; Step 1, p. 26 | correct (`depf-survey` lines 954–962, 1028, 1048–1050, 1111) |
| 6.8 | survey Thm 2.14, p. 15; Thm 2.21, p. 19; Thm 3.3, pp. 25–26 | correct (lines 614, 749, 1098) |
| 7.7 | De Philippis–Figalli 2015 Thm 1.4, p. 82 | correct (`depf-partial` lines 73–78): continuous densities locally bounded away from zero and infinity, closed null sets, `C^{0,β}_loc` for every `β < 1` |
| 10.5 | none | R02 |
| 11.8 | none | R03; every numerical claim recomputed (table) |
| 12.1 | Tau Ceti `TauCeti.IsFrechetBarycenter` | definition and Checks hold; R01 for the uncited API |
| 12.8 | Agueh–Carlier Thm 6.1; Álvarez-Esteban et al. Thm 4.2, Cor. 4.5; Tau Ceti | Agueh–Carlier not re-read; the two-point time formula recomputed (table) |
| 13.9 | Peyré–Cuturi Thm 4.1, p. 70; Thm 4.2, p. 71 | correct (`peyre-cuturi` lines 3092–3108, 3133–3140; printed page = PDF page − 4) |
| 15.4 | BMNN Thm 29, p. 26 | correct (`bmnn-zgw` line 1155): separable target |

**Adversarial table** (sample, headlines, the repaired targets, and every target a finding touches).

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| H1 Gangbo–McCann | `h = x²/2`, `U[0,1] → U[1,2]`; `d = 0` | `T = x+1`, cost `1/2`; one-point space, `T = id` | holds |
| H2 Caffarelli | `X = (0,1)`, `Y = (0,2)`, `f = 1`, `g = 1/2`, `l = 1/2` | `T = 2x`, Hölder exponent `1` | holds |
| H3 De Philippis–Figalli | `c = 2 − ⟨x,y⟩` on unit balls; `c ≡ 0` | `−Dₓc = y` injective, `D_yDₓc = −id`; `−Dₓc ≡ 0` not injective | twist excludes `c ≡ 0` |
| H4 McCann | `M = ℝ`, `U[0,1] → U[1,2]` | `T = x+1`, cost `1/2` | holds |
| H5 Figalli | `U[0,1] → U[1,2]`, `c = \|x−y\|` | `x+1` and `2−x` both cost `1` | existence only, as stated |
| H6 Agueh–Carlier | segments `{(s,0)}`, `{(0,t)}` in `ℝ²` | two midpoint laws, value `(1/4)(1/3+1/3) = 1/6`; each segment has dimension `1 = n−1` | excluded by `hsmall`, as needed |
| H7 Gaussian | `n = 1`, `C = (1,4)`, `w = (1/2,1/2)` | `√S = (1+2)/2`, `S = 9/4`; `(1/2)(√(9/4) + √9) = 9/4` | holds |
| H8 Schrödinger potentials | `μ = ν = (δ₀+δ₁)/2`, `R = μ⊗ν` | `dπ/dR = 1`, pairs `(a,−a)` | holds |
| 1.4 (R01) | `δ_{(1/n,1/n)} → δ_{(0,0)}`, `c = 1` off `(0,0)`, `0` at it | `∫c = 1` along the sequence, `0` at the limit: `0 ≤ liminf 1` | holds; uncited |
| 2.4 | `δ₀`, `δ₂`, `(x−y)²` | `φ(0) = 0`, `ψ(2) = 4`: dual value `4` = primal | holds |
| 3.2 | `(δ₀+δ₂)/2`, `x₀ = 0`, `p = 2` | `(4/2)^{1/2} = √2` | holds |
| 3.5 (new clause) | `δ₀⊗δ₀ → δ₁⊗δ₂`, `cᵢ = (x−y)²` | `1 + 4 = 5` on both sides | holds |
| 3.8 (new clause) | `δ₀`, `δ₅`, `R = 1` | cost of `min(d,2) = 2`; `f = 1 − x` clamped to `[−1,1]` gives `f(0) − f(5) = 1 − (−1) = 2` | holds, attained |
| 4.2 | `δ₅ → (δ₀+δ₁)/2`; `(δ₀+δ₁)/2 → δ₃`; `U[0,1]`, `1_{[1/2,1]}` | `1 ≤ 1/2` impossible; `1 ≥ 1/2`; law `(δ₀+δ₁)/2` | hold |
| 5.4 | diagonal and anti-diagonal of `{0,1}²` | pairing: `1 ≥ 0`, `−1 ≥ 0` false; cost: `0 ≤ 1`, `1 ≤ 0` false | the two notions agree |
| 6.6 | `U[0,1] → U[0,2]`, `u = x²` | `1 = (1/2)·2` | holds |
| 6.8 Checks | `‖x‖²/2`; `\|x\|`, `p ∈ (−1,1)` | radius `√(2h)`; `(−h/(1+p), h/(1−p))` | hold |
| 6.14 | quadratic cost, square `U`, disc `V`; `c = −⟨x,y⟩` | `U_ỹ = U − ỹ` square: (B2) holds, (B2)s fails; (4.12) is `⟨x−x̄,y_t⟩ ≤ max`, affine in `t` | README now excludes the square; Check holds |
| 7.7 | flat torus, `f = g = 1` | `T = id`, `Σ_X = Σ_Y = ∅` | holds |
| 8.9 | circle `δ_{tθ}`; uniform law with `v ≡ c∂_θ`; `δ₀ → δ_{3π/2}` | `\|μ̇\| = \|θ\| = ‖v‖`; `\|μ̇\| = 0 < \|c\|`; `(3π/2)² ≥ (π/2)²` | (B) is an inequality; formula holds |
| 10.5 (R02) | `Φ = x²/2`; `Φ = −x⁴` | `(1+t/k)^{−k} → e^{−t}`; resolvent infimum `−∞` for every `τ` | hypotheses unstated |
| 11.7 part 1 | `Φ = ∫x²/2`, `δ_a`; `Φ = −∫x²/2`, `δ_a` | steps `a(1+τ)^{−k} → ae^{−t}`; minimizer `a/(1−τ)` for `τ < 1`, integrand `a²/2 − ax` at `τ = 1` | holds; `1 + λτ > 0` needed |
| 11.7, Assumption 3.24 | generalized geodesic, remainder `∫‖x₂−x₃‖² dγ ≥ W₂²` | `−(λ/2)t(1−t)∫ ≤ −(λ/2)t(1−t)W₂²` iff `λ ≥ 0` | reduction valid for `λ ≥ 0` only, as stated |
| 11.7 part 2 | `V = x²/2`, `N(m,s²)`; `V = 0` | `(σ²)′ = 2 − 2σ²`: `1 + (s²−1)e^{−2t}`, mean `me^{−t}`; variance `s² + 2t` | hold |
| 11.8 (R03) | `n = 1,2,3`; `n = 1`, `m = 1/4`; `n = 2`, `m = 1/2` | `2m/(1−m) > n` iff `m > n/(n+2)`: `1/3`, `1/2`, `3/5 < 2/3`; mass `1`, moment `5`, `∫ρ^{1/4} = ∞`; moment `∫dr/(r log²r) = 1`, `∫dr/(r log r) = ∞` | hold; no locator |
| 11.9 Checks | `V = x²/2`; `V = 0`; `V = (x²−1)²` | `\|a−b\|e^{−t}`; `\|√(s²+2t) − √(r²+2t)\| ≤ \|s−r\|`; `V″ = 12x² − 4 ≥ −4` | hold |
| 12.1 | `(δ₀+δ₂)/2`, `p = 2`, `p = 1`; Cauchy | `(x−1)² + 1`, radius `1` at `1`; `(\|x\|+\|x−2\|)/2 = 1` on `[0,2]`; `∞` everywhere | hold |
| 12.4 Checks | `(1−1/j)δ_{δ₀} + (1/j)δ_{δ_j}`, `p = 2` | `W₂² = (1/j)j² = j`; barycenter mean `(1/j)·j = 1` | hold |
| 12.8 | two points, weights `1−t`, `t`, exponent `p` | `(1−t)s^{p−1} = t(1−s)^{p−1}` gives `s = t^{1/(p−1)}/((1−t)^{1/(p−1)} + t^{1/(p−1)})`; `s = t` at `p = 2` | holds |
| 13.9 | `[[2,1],[1,2]]`; `[[1,2],[3,6]]` | `Δ = log 4`, `(√4−1)/(√4+1) = 1/3 = tanh(log 4/4)`; `Δ = 0` | hold |
| 15.4 | one point vs two points with zero kernel | distortion `0`: distance `0` between different carriers | quotient needed, as stated |

## Not verifiable

- **Villani 2009** (Theorems 5.10 and 6.18, Particular Case 5.16, Chapters 10 and 29) and **Villani 2003** (Theorems 1.14 and 2.12): paywalled, not in the sources cache.
- **Ambrosio–Gigli–Savaré 2008** (including Theorem 4.0.4 and Assumption 4.0.1, which 11.7 now cites for `λ < 0`), **Kechris** and **Huang**: settled as uncertified and cited by locator only.
- **Loeper 2009**, **Ma–Trudinger–Wang 2005**, **Caffarelli 1990/1992**, **Jordan–Kinderlehrer–Otto 1998**, **Otto 2001**: publisher pages only.
- Not re-read this round, because they lie outside the sample: **Pratelli 2007**, **Gangbo–McCann 1996**, **Agueh–Carlier 2011**, **Léonard 2012**, **Bertrand**, **Gigli–Rajala–Sturm**, **Cavalletti–Mondino**, **Abedi–Li–Schultz**.
- **Elaboration at main's pin** was not run: this review runs Lean only from the pull-request worktree, whose manifest pins Tau Ceti `a91d3aa`. The Tau Ceti statements at `2fd255d` were read as source text.

## Source issues

- none
