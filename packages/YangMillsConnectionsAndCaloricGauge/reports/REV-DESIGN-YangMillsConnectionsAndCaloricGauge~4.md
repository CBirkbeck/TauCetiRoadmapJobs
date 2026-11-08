<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7643#issuecomment-6721157083 -->
Review (claude) of 5b101ca

Verdict: needs_changes

1. **F01** (P3) 10.4's chart condition restates Mathlib's smooth embedding

   - Location: `packages/YangMillsConnectionsAndCaloricGauge/design/README.md` lines 1648–1651: "a `C¹`
     map `φ : V → 𝔅` that is a homeomorphism onto `S ∩ U` with injective derivative of closed
     complemented range".
   - Claim: the condition on the chart is stated as this roadmap's own.
   - Witness: pinned Mathlib `Geometry/Manifold/SmoothEmbedding.lean:70`, `structure IsSmoothEmbedding`
     (a `C^n` immersion that is a topological embedding), and `Geometry/Manifold/Immersion.lean:191`,
     `IsImmersionAt` (local normal form with a closed complement `F`), for maps between charted spaces,
     which `V ⊆ E` and `𝔅` are with the trivial models.
   - Repair: in 10.4 say that the chart `φ` is a `C¹` smooth embedding in Mathlib's sense
     (`IsSmoothEmbedding` at `n = 1`, trivial models on `V` and `𝔅`) with image `S ∩ U`, keep the
     tangent-space clause, and list `IsSmoothEmbedding` and `IsImmersion` in the Mathlib contract. Tested
     on 10.4's Checks: the sphere chart `v ↦ (e + v)/‖e + v‖` on `e^⊥` has derivative the inclusion of
     `e^⊥`, closed and complemented by `ℝe`, and is a homeomorphism onto a neighbourhood in the sphere,
     so it is a `C¹` smooth embedding; the graph of `|x₁|` admits no `C¹` immersive chart at `0` and the
     cross no chart at all, so both stay excluded.

   Files reviewed: `packages/YangMillsConnectionsAndCaloricGauge/design/README.md` (1752 lines, 10
   layers, 52 targets), `design/plan.json` (52 targets, 119 tests, 4 declared gaps), `sources.toml` (12
   entries; this round changed one locator and one `cited_for`). Previous review:
   REV-DESIGN-YangMillsConnectionsAndCaloricGauge~3 (F01 P2, F02 P3), repair report
   FIX-DESIGN-YangMillsConnectionsAndCaloricGauge~4. Elaboration: not available (this lane does not
   elaborate; a design has no `Suggested.lean`). No finding re-raises a settled one.

One finding (R01, P3), no blocking finding. Both round-3 findings are repaired; the repaired
passages were re-derived and checked against the source text; no new blocking defect was found. The
one repair below is what stands between this design and acceptance; the four declared supplier gaps
are contracts, not findings, and the acceptance that follows the repair is conditional on them.

## Verified sound

**Round-3 findings, repair by repair.**

| Finding | Repaired passage | Status |
|---|---|---|
| F01 (P2) 9.5's route used a decay of homogeneous covariant-heat solutions that no target stated | 8.3 (README lines 1322–1329): the `L¹` clause now reads "`‖DB‖_{ℓ²L¹Ḣ^σ} ≲ ‖B(0)‖_{Ḣ^{σ−1}} + ‖G‖_{L¹Ḣ^{σ−1}}`" with its envelope version, then "for `J = [0, ∞)`, decay: if `−2 < σ < 2`, `B(0) ∈ Ḣ^σ`, `G ∈ L¹Ḣ^σ` and `H ∈ L²Ḣ^σ`, then `B(s) → 0` in `Ḣ^σ`", and the function and 2-form versions with `R(F, B)`; source note (1331–1334); "Route for the decay" (1336–1349); three new Checks (1358–1369); `*Needs:*` gains PDE §7.2 and the Sobolev inequality. 9.5 (1511–1527) cites "the decay clause of 8.3" for `F_{0j}` and, through the 2-form version with `H = DΔ_A^{−1}(…)`, for `curl_A B`; `A₀` converges block by block from `ℓ²L¹`. `plan.json` 8.3 and 9.5 updated; Conventions define `ℓ^pY` (166–168) | Repaired, differently from the suggested route and correctly: the `L¹L²` form the suggested route relied on is false (the Check at 1358–1361, recomputed below), so the repair's own route is the right one. Every step recomputed below |
| F02 (P3) 5.6's second locator pointed at a table-of-contents line | 5.6 (line 968): "(OhTataru-Threshold line 1074)"; `plan.json` 5.6 `where` is "line 1074"; "5.6" dropped from the OhTataru-TopClass `cited_for` | Repaired. OhTataru-Threshold line 1074 identifies the topological class with the homotopy class of `O : S³ → G`; OhTataru-TopClass line 53 is the contents entry "4.1. Solvability results for the inhomogeneous Gauss equation" |

**The repaired pattern elsewhere.** Every README line with `L¹Ḣ`, `L¹L²`, `ℓ²L¹`, "tends to", "→ 0" or
"decay" was read (grep): the only `L¹`-in-time conclusions are 8.3's `ℓ²L¹` clause and its envelope
version; every other `L¹Ḣ` is a datum (`G`). Every limit at `s = ∞` in Layers 9–10 (9.5's `F_{0j}`,
`curl_A B`, `A₀`; 10.5's `D(A(s))c → ∇c`) is routed through 8.3's decay clause, 9.5's limits or the
product bound; 9.4's limit at a finite `s₀` is the source's Theorem 5.10 and not of this pattern.

**Source text behind the repair** (OhTataru-YMHF): line 857 defines `‖u‖^p_{ℓ^pX} = Σ_k ‖P_k u‖^p_X`;
line 1290 prints Theorem 4.6's conclusion as `‖DB‖_{L¹Ḣ^σ}`; the proof (1297–1320) bounds
`‖P_k(DB)‖_{L¹L²} ≲ d_k` block by block and never sums in `L¹`; the applications at 2207 and 2546 write
`ℓ²L¹Ḣ^{σ+1}`; line 2204 gives the equation of `D^jF_{0j}` with right side `[DF, F_{0j}] + [F, DF_{0j}]`
(plus `D^jH_j + [F, G]`, zero here); line 2531 gives the equation of `curl_A B` with right side
`[F, DB] + [DF, B]`; lines 2534–2535 take `curl_A B → 0` from "the `L²` solvability"; line 2543 asserts
`F_{0j}` "vanishes at `s = ∞`"; lines 3402–3404 take `lim F_{0j} = 0` from Theorem 4.3, whose statement
(1187–1189) is the bound (4.10). Footnote 8 (line 1224): covariant derivatives on the left for `σ ≥ 1`,
on the right for `σ ≤ −1`.

**Gate.** Output of the dependency check, no UPWARD or CYCLE line:

```
candidate: YangMillsConnectionsAndCaloricGauge is not in the merge order yet; checked as if placed after GlaubermanZStar (the intake inserts it when its design is accepted)
depcheck: 237 roadmaps, 2344 edges, 0 problem(s)
```

**Citation resolver** (`roadmaps resolve` on the README, the worker's run): cross-roadmap citations
found nowhere: none; Lean names found nowhere: none.

**Principles.** General compact `G ⊆ U(N)`, not assumed connected; `d ≥ 3` wherever the sources allow
and `d = 4` only where criticality is used (Conventions, lines 111–116). No re-planned roadmap: PDE,
SmoothBundlesConnections, CharacteristicClasses, DifferentialGeometry, AlgebraicTopology, LieGroups and
Yamabe are consumed by section (resolved below), FourManifolds' `SU(2)` lemma is stated there as the
case `G = SU(2)`, `d = 4` of §4.1. No computational algorithm; no copied passage (the source notes
describe, they do not quote). Greps for LaTeX delimiters, pull-request numbers, dates, round labels,
machine paths and process words ("so far", "to be checked", "checkpoint", "handoff", "packet",
"deferred", "optional", "removed"): empty; the word "lemma" occurs only in "Uhlenbeck's lemma". No
backticked Lean name of the roadmap's own, as fits a design. Ten layers, each ending with
`### Examples` and `### Dependencies` (grep: 10 and 10).

**Supplier sections resolved on main** (`TauCetiRoadmap/<X>/README.md`, file lines). PDE: §1.2 (720,
Meyers–Serrin density on arbitrary open sets), §1.4 (803, Gagliardo–Nirenberg–Sobolev and Morrey,
domain-global operators on bounded Lipschitz domains), §1.5 (855, Poincaré), §1.6 (905, trace and
extension), §2.2 (1148), §2.3 (1187, Mihlin–Hörmander and Riesz transforms), Layer 5 (1827–2220:
§5.1–§5.7, interior and Dirichlet only; "Neumann" occurs only as the Neumann series, "Hardy" only as
Hardy–Littlewood), §6.1 (2221), §6.3 (2309), §7.1 (2668; heat-block estimate and the first Check
"the block carrying a frequency of size `2^j` is `P_{j−1}`"), §7.2 (2719; homogeneous `Ḃ^s_{p,q}`
modulo polynomials with reconstruction for `s < d/p`), §7.3 (2785; Bony's decomposition with estimates
in `𝒞^α` only, so the contract clause and the derivation of the `Ḣ^σ` product law here are exact).
SmoothBundlesConnections B3.1 (871), B4.1 (979), B4.2 (1010–1018: `u·A = Ad(u)A − du·u⁻¹`,
`F_{u·A} = Ad(u)F_A`). CharacteristicClasses C4 item 1 (1321–1329: Ad-invariant symmetric polynomial
forms, polarisation, pullback, evaluation on curvature, transgression). DifferentialGeometry Layer 0
(268), Layer 1 (311), 5.2–5.4 (503–527: `integralTopForm`, Stokes with outward-first orientation,
`homotopyOperator`), Layer 10 items 10.3–10.5 (877–896: `degreeAtRegularValue`, `∫ f*ω = deg·∫ ω`,
homotopy invariance, `degree_id`). AlgebraicTopology Stage 6 item 5 (1560–1567, homological
characterisation of the shared manifold degree) and Stage 8 item 3 (1684–1693, absolute Hurewicz
through pointed sphere maps, `π_n(X) ≅ H_n(X; ℤ)` for `(n−1)`-connected `X`, `n ≥ 2`). LieGroups is
`TauCetiRoadmap/RepresentationTheory/LieGroups/README.md`: Layer 0 (252), Layer 1 (301), Layer 2
(356, closed-subgroup theorem), Layer 6 (673, maximal tori, Weyl group and integration; no root
`𝔰𝔲(2)` item). Yamabe Y2 item 1 (150–158, `a_n∫|du|² ≥ Y(Sⁿ)(∫|u|^{p_n})^{2/p_n}`,
`Y(Sⁿ) = n(n−1)Vol(Sⁿ)^{2/n}`). FourManifolds at its open head: §5.3 (2542–2550) pins the unit-ball
`SU(2)` Coulomb gauge with `d*a = 0`, `a(ν) = 0`, `‖a‖_{W^{1,2}} + ‖a‖_{L⁴} ≤ C‖F‖_{L²}` modulo constants,
and line 2288 `E(A) = 8π²k + 2‖F_A⁺‖²`. Every `*Needs:*` line of the sampled targets and of 8.3, 9.5
and 10.5 resolves to a target, one of these sections, a pinned declaration or a declared gap.

**Pinned declarations opened** (`lake-manifest.json`: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`,
unchanged since round 3; paths under `Mathlib/`, `TauCeti/`): `Matrix.unitaryGroup`
(`LinearAlgebra/UnitaryGroup.lean:105`), `Matrix.specialUnitaryGroup` (`:278`),
`NormedSpace.expSeries`/`exp` (`Analysis/Normed/Algebra/Exponential.lean:108`),
`NormedSpace.exp_add_of_commute` (`:521`), `Matrix.isUnit_exp`
(`Analysis/Normed/Algebra/MatrixExponential.lean:145`), `ContinuousMap.Homotopic`
(`Topology/Homotopy/Basic.lean:333`) and `.equivalence` (`:354`), `HomotopyGroup`
(`Topology/Homotopy/HomotopyGroup.lean:441`), `MeasureTheory.eLpNorm_le_eLpNorm_fderiv_of_eq`
(`Analysis/FunctionalSpaces/SobolevInequality.lean:602`), `MeasureTheory.Measure.toSphere`
(`MeasureTheory/Constructions/HaarToSphere.lean:52`), `homeomorphUnitSphereProd`
(`Analysis/Normed/Module/Ball/RadialEquiv.lean:71`), `Submodule.ClosedComplemented`
(`Topology/Algebra/Module/Complement.lean:87`), `Orientation.volumeForm`
(`Analysis/InnerProductSpace/Orientation.lean:170`); `TauCeti.HasWeakFDerivOn`
(`Analysis/Sobolev/WeakDeriv/Basic.lean:251`), `TauCeti.Wkp` (`Analysis/Sobolev/Wkp/Basic.lean:145`),
`TauCeti.W1p` (`Analysis/Sobolev/W1p/Basic.lean`, with `W1p.valueL` at 380),
`TauCeti.W1p.morreyRepresentative` (`Analysis/Sobolev/W1p/Morrey.lean`),
`TauCeti.enorm_sub_le_of_mem_ball_of_finrank_lt` (`Analysis/Sobolev/Morrey.lean:181`),
`TauCeti.exists_isOpenEmbedding_normalTube` (`Geometry/Manifold/TubularNeighborhood/Euclidean.lean:351`,
`[I.Boundaryless] [IsManifold I 2 M] [CompactSpace M]`), `TauCeti.exists_contMDiffOn_normalRetraction`
(`Geometry/Manifold/TubularNeighborhood/LocalInverse.lean:46`), `Orientation.formHodgeStar`
(`Analysis/InnerProductSpace/HodgeStar/AlternatingForm.lean:76`), `wedge_formHodgeStar_apply` (`:111`),
`formHodgeStar_formHodgeStar_of_even` (`:157`), `TauCeti.heatKernel`
(`Analysis/PDE/HeatKernel/Basic.lean:76`). All 23 exist at the pins. Also opened for R01:
`IsSmoothEmbedding` (`Geometry/Manifold/SmoothEmbedding.lean:70`), `IsImmersionAt`
(`Geometry/Manifold/Immersion.lean:191`). Duplication greps by object: "Hardy" in Mathlib hits only
Hardy–Littlewood and continued fractions; "Neumann", "diamagnetic", "Hardy" in Tau Ceti hit nothing
relevant (von Neumann algebras); no Mathlib or Tau Ceti carrier for `Ḣ^σ`, `ℓ¹L²`, `ℋ`, covariant
Laplacians or the Yang–Mills heat flow.

**Sampled locators** (every one read at the cited lines this round):

| Target | Locator read | Result |
|---|---|---|
| 1.1 | OhTataru-YMHF 92–102 (bi-invariant inner product, `⟨[X,Y],Z⟩ = ⟨X,[Y,Z]⟩ ⇔ Ad-invariance, existence for compact `G`); OhTataru-TopClass 121–127 (same, by averaging), 976–979 (matrix realisation; the source uses orthogonal matrices, the README `U(N)`, a kept variant it states) | supports |
| 3.2 | OhTataru-TopClass 283–292 (`G^{k,p}_loc(X)`); OhTataru-YMHF 103–118 (gauge action and `F ↦ OFO⁻¹`), 124–130 (energy, gauge invariance) | supports |
| 4.3 | OhTataru-TopClass Lemma 3.13 (1418–1427), Lemma 3.17 (1487–1496) | supports; line 1423 prints `L^{d/(n+2)}` for `L^{d/(m+2)}`, as the README says |
| 6.3 | OhTataru-TopClass 860–868 (Hodge-star manipulation, `E ≥ 8π²|c₂|`, equality iff `F = ∓⋆F`), Lemma 1.31 (901–906); OhTataru-Threshold 237–246 (`χ = ∫−⟨f∧f⟩`, pointwise bound (1.5)); OhTataru-YMHF Lemma 6.7 (2860–2883, `χ = 0` on `Ḣ¹`) | supports |
| 6.4 | OhTataru-TopClass 256–264 (`c₂ = (8π²)⁻¹∫tr(F∧F)`, integrality), 852–860 (`c₂` equals the degree of `O`), 2365–2372 ("with the appropriate choices of the orientations"); OhTataru-YMHF 327–335, 2913–2915 (`χ = 8π²c₂` for `−tr`) | supports |
| 7.1 | OhTataru-YMHF (1.1)–(1.2) at 124–128; OhTataru-TopClass 829–834; OhTataru-Threshold 253–266 | supports |
| 7.3 | OhTataru-YMHF 315–320 (stereographic pullback, Uhlenbeck's removable singularity, extension to `S⁴`) | supports the removable-singularity clause; the decay rate is a consequence of the route (inversion), recomputed below |
| 7.4 | GurskyKelleherStreets-GapTheorem (2.1) at 134, Lemma 2.1 (139–153), Prop. 2.8 (242–286), (3.1)–(3.4) (293–308) | supports; their bracket (2.3) is `−𝔉` (below) |
| 7.5 | GurskyKelleherStreets-GapTheorem Theorem 1.1 (36–41), Corollary 1.2 (88–100); OhTataru-TopClass Theorem 1.30 (877–878), footnote 6 (894–896), Claim 6.3 and Lemma 6.4 (2373–2407); OhTataru-YMHF Theorem 2.5 (348–352) | supports; constants recomputed below |
| 7.7 | OhTataru-TopClass Theorem 1.32 (910–918), Step 1 (2268–2275), 2440–2451 (`E_i = 16π²/⟨α,α⟩`); OhTataru-YMHF Theorem 6.10 (2905–2910); OhTataru-Threshold Theorem 1.6 (277–283) | supports |
| 9.2 | OhTataru-YMHF Prop. 5.7 (1628–1647, `Q_n(‖F(s₀)‖_{L²}, Q)`, dynamic version), Corollary 5.8 (1791), Lemma 5.17 with Remarks 5.18–5.19 (1986–2000) | supports |
| 9.5 | OhTataru-YMHF Cor. 5.15 (1952–1957), Lemma 5.33 (2509–2520, 2525–2555), Lemma 5.23 Case 1 (2200–2208) | supports; the source's gaps at 2535 and 2543 are now closed by 8.3's decay clause |
| 9.7 | OhTataru-YMHF Theorem 6.6 (2833–2837), discussion 2841–2851 | supports |
| 10.2 | OhTataru-YMHF Def. 2.17 (564–568), Theorem 2.18 (571–574), Theorem 2.20 (591–592), Def. 7.1 and Prop. 7.2 (3000–3008), Prop. 7.4 (3213–3228), Cor. 7.6 (3275–3278), 3279–3282 | supports |
| 10.4 | OhTataru-YMHF Theorem 7.8 (3294–3296), slice (3301–3306), Step 2 (3338–3346) | supports |

Also read: OhTataru-YMHF Theorem 4.3 and proof (1187–1208), Corollary 4.4 and Theorem 4.5 (1211–1279),
(1.19) at 243, (5.11) at 1612–1619; OhTataru-TopClass Prop. 1.6 (397–405), Prop. 3.9 (1300–1309);
OhTataru-Threshold 1068–1076.

**Adversarial table** (repaired passages, sampled targets, headline theorems):

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions `ℓ^pY` and `‖u‖_{ℓ²L¹Ḣ^σ} ≲ ‖u‖_{L¹Ḣ^σ}` | Minkowski in `ℓ²(L¹) ≤ L¹(ℓ²)` | `(Σ_k(∫‖P_ku‖)²)^{1/2} ≤ ∫(Σ_k‖P_ku‖²)^{1/2} ≈ ∫‖u‖_{Ḣ^σ}`; definition matches OhTataru-YMHF line 857 | sound | none |
| 8.3 `ℓ²L¹` clause at `A = 0` | one block `P_kb`, any `σ` | heat-block and Bernstein: `‖∇e^{sΔ}P_kb‖_{L¹Ḣ^σ} ≲ 2^{k(σ+1)}(c4^k)^{−1}‖P_kb‖_{L²} ≈ ‖P_kb‖_{Ḣ^{σ−1}}`; `ℓ²` sum `≈ ‖b‖_{Ḣ^{σ−1}}`; forcing by Fubini and Minkowski `≤ ∫‖G‖_{Ḣ^{σ−1}}` | holds | none |
| 8.3 old `L¹Ḣ^σ` form (source line 1290) | `A = 0`, `σ = 0`, `b = Σ_{k≤K}b_k`, `‖b_k‖_{Ḣ^{−1}} = K^{−1/2}` | `‖b‖²_{Ḣ^{−1}} = K·K^{−1} = 1`; on `[4^{−k−1}, 4^{−k}]` (length `3·4^{−k−1}`) `s|ξ|² ≤ 4` so the multiplier is `≥ e^{−16π²}` and `‖∇e^{sΔ}b‖_{L²} ≥ ‖∇e^{sΔ}b_k‖ ≳ 2^k‖b_k‖_{L²} ≈ 4^kK^{−1/2}`; integral over the interval `≳ K^{−1/2}`, sum `≳ K^{1/2}` | false, as the Check says | none |
| 8.3 decay route, first step | `G = H = 0`, `B(0) ∈ L² ∩ Ḣ^{−1/2}` | `∫₀^∞‖DB‖²_{L²} ≲ ‖B(0)‖²_{L²} < ∞` ⇒ `liminf ‖DB(s)‖ = 0`; `‖B‖_{L⁴} ≲ ‖∇|B|‖_{L²} ≤ ‖DB‖_{L²}`; `‖∂B‖_{L²} ≤ ‖DB‖_{L²} + ‖A‖_{L⁴}‖B‖_{L⁴}` with `A ∈ L^∞Ḣ¹ ⊂ L^∞L⁴` | `‖B(s_n)‖_{Ḣ¹} → 0` | none |
| 8.3 decay route, interpolation | `0 = (1−θ)(−½) + θ·1` | `θ = 1/3`; Hölder on the Fourier side with exponents `3/2`, `3`: `|ξ|^{−2/3}·|ξ|^{2/3} = 1` | `‖u‖_{L²} ≤ ‖u‖^{2/3}_{Ḣ^{−1/2}}‖u‖^{1/3}_{Ḣ¹}` | none |
| 8.3 decay route, restart at `s_n` | constants of Theorem 4.3 | depend on `‖A‖_{L^∞Ḣ¹}`, `‖F‖_{L²Ḣ¹}`, `‖∂_sA‖_{L²L²}` and the number of subintervals on which `‖F‖_{L²Ḣ¹}` is small; each is no larger on `[s_n, ∞)` than on `[0, ∞)` | `sup_{s≥s_n}‖B(s)‖_{L²} ≲ ‖B(s_n)‖_{L²} → 0` | none |
| 8.3 decay route, other `σ` | `σ = 1.9, σ' = 1.95`; `σ = −1.5, σ' = −1.9` | `θ = σ/σ' = 38/39`, `15/19`; block sums `Σ_{|k|≤N}P_ku` lie in `L² ∩ Ḣ^{−1/2}` and converge in `Ḣ^σ` (tail of an `ℓ²` sum); `‖B_u − B_{u_N}‖_{L^∞Ḣ^σ} ≲ ‖u − u_N‖_{Ḣ^σ}` by linearity; for `|σ'| ≥ 1` the uniform bound is in the covariant norm, equivalent to the ordinary one for `A ∈ Ḣ¹` by 8.2: `‖φ‖_{Ḣ^s} ≈ ‖Δ_Aφ‖_{Ḣ^{s−2}} ≲ (1 + ‖A‖_{Ḣ¹})‖Dφ‖_{Ḣ^{s−1}}` (product `Ḣ¹ × Ḣ^{s−1} → Ḣ^{s−2}`: `1 + (s−1) − 2 = s − 2`, needs `s − 1 < 2`, `s > 0`) and `‖Dφ‖_{Ḣ^{s−1}} ≲ (1 + ‖A‖_{Ḣ¹})‖φ‖_{Ḣ^s}` for `0 < s < 2` | holds on `(−2, 2)`; 8.2 is in 8.3's `*Needs:*` | none |
| 8.3 decay with `G`, `H` | split at `S` | forced part `≲ ‖G‖_{L¹([S,∞);Ḣ^σ)} + ‖H‖_{L²([S,∞);Ḣ^σ)} → 0` as `S → ∞`; homogeneous part from `B(S) ∈ Ḣ^σ` decays by the previous rows | holds | none |
| 8.3 for functions and 2-forms | `R = 0`; `R = 2[F_j^k, B_k]`; `R` of `curl_A B` | `σ = 0` energy step: `|∫⟨R(F,B),B⟩| ≲ ‖F‖_{L⁴}‖B‖²_{L^{8/3}} ≲ ‖F‖_{Ḣ¹}‖B‖_{L²}‖DB‖_{L²} ≤ ½‖DB‖² + C‖F‖²_{Ḣ¹}‖B‖²`, Gronwall with `∫‖F‖²_{Ḣ¹} < ∞`; Leibniz by Jacobi; adjoint `⟨[F,B],C⟩ = −⟨B,[F,C]⟩` is again a bracket contraction, so the duality step for `σ < 0` carries over | the three proof inputs named in 8.3 suffice | none |
| 8.3 Check: decay at `A = 0`, no rate | `b̂` in `|ξ| ≤ 2^{1−m}`, `s = 4^m` | `s|ξ|² ≤ 4^m·4^{1−m} = 4`, multiplier `e^{−4π²s|ξ|²} ≥ e^{−16π²}`; dominated convergence with dominant `|2πξ|^{2σ}|b̂|²` | qualitative decay only, as stated | none |
| 8.3 Check: static instanton | `B_i = ξ^kF_{ki}`, BPST | Bianchi: `D_jB_i − D_iB_j = ξ^k(D_jF_{ki} + D_iF_{jk}) = −ξ^kD_kF_{ij}`; `D^ℓB_ℓ = −ξ^kD^ℓF_{ℓk} = 0`; `Δ_AB_i = D^j(D_iB_j − ξ^kD_kF_{ij}) = [F_{ji},B_j] − ξ^k[F_{jk},F_{ij}] = −[F_{ij},B_j] − [F_{ij},B_j] = −2[F_{ij},B_j]`; `|B| ≲ |ξ||x|^{−4}`, `∫|x|^{−8}r³dr < ∞` | nonzero stationary `L²` solution; `F ∉ L²([0,∞);Ḣ¹)` and `A_BPST ∉ Ḣ¹`, so two hypotheses fail, as the Check says | none |
| 9.5 right side `[DF, F_{0x}] + [F, DF_{0x}] ∈ L¹Ḣ^{σ−1}` | `σ = −½, 0, ½` | `L² × Ḣ^{σ+1} → Ḣ^{σ−1}` (`0 + σ + 1 − 2 = σ − 1`; needs `σ + 1 < 2`, `σ + 1 > 0`); `Ḣ¹ × Ḣ^σ → Ḣ^{σ−1}` (needs `σ < 2`, `1 + σ > 0`); time `L² · L² → L¹`; `DF ∈ L²L²` from `∂F ∈ L²L²` and `[A,F] ∈ L²L²` (`L⁴ · L⁴`); `F_{0x} ∈ L²Ḣ^{σ+1}` from `DF_{0x} ∈ L²Ḣ^σ` and the norm equivalence of the previous row; matches source line 2204 with `G = H = 0` | holds on `(−1, 1)` | none |
| 9.5 de Turck data | `A₀(0) = 0` | `F_{0j}(0) = ∂_tA_j − ∂_jA₀ + [A₀, A_j] = b_j` (source 2541–2542); `D^ℓF_{ℓ0}(0) = D^ℓb_ℓ ∈ Ḣ^{σ−1}` by `Ḣ¹ × Ḣ^σ → Ḣ^{σ−1}` | 8.3's `ℓ²L¹` hypotheses met | none |
| 9.5 convergence of `A₀` | tails `t_k(s) = ∫_s^∞‖P_kD^ℓF_{ℓ0}‖_{Ḣ^{σ+1}}` | `t_k(s) ≤ t_k(0)`, `Σ_kt_k(0)² < ∞`, `t_k(s) → 0`; `‖A₀(∞) − A₀(s)‖²_{Ḣ^{σ+1}} ≈ Σ_kt_k(s)² → 0` by dominated convergence in `ℓ²`; `σ + 1 ∈ (0, 2) < d/2` so `Ḣ^{σ+1}` is realised | holds (the source's step at 2546–2547) | none |
| 9.5 limit of `B` | `B_j = F_{0j} + D_jA₀` | `F_{0j} → 0` (decay clause); `∂_jA₀ → ∂_ja_{0,∞}` in `Ḣ^σ`; `[A_j, A₀] → [A_{∞,j}, a_{0,∞}]` by `Ḣ¹ × Ḣ^{σ+1} → Ḣ^σ` (`−2 < σ < 1`), `A → A_∞` in `Ḣ¹`, `A₀ → a_{0,∞}` in `Ḣ^{σ+1}` | `B_∞ = D(A_∞)a_{0,∞}`, curl-free since `F[A_∞] = 0` | none |
| 9.5 `σ = 1` route | `f = [F, DB] + [DF, B]` | `[F,DB] ∈ L²L^{4/3}` (`F ∈ L²L⁴`, `DB ∈ L^∞L²`), `[DF,B] ∈ L²L^{4/3}` (`DF ∈ L²L²`, `B ∈ L^∞L⁴`), `L^{4/3} ⊂ Ḣ^{−1}` (dual of `Ḣ¹ ⊂ L⁴`); `f = D^k(D_kΔ_A^{−1}f)` with `‖DΔ_A^{−1}f‖_{L²} ≲ ‖Δ_A^{−1}f‖_{Ḣ¹} ≲ ‖f‖_{Ḣ^{−1}}` (8.2 at `σ = 1`), so `H ∈ L²L²`; data `curl_ab ∈ L²` for `b ∈ Ḣ¹` (`∂b ∈ L²`, `[a,b] ∈ L⁴·L⁴`); hypotheses on `A` on `[0,∞)` from 9.4 | decay clause applies, `curl_AB → 0` in `L²` | none |
| 9.5 range | `σ = 1` included, `1 < σ < 2` excluded | Lemma 5.33(2) writes `0 ≤ σ ≤ 1` (2515–2516); Corollary 5.15 claims `−1 < σ < 2` (1954–1955); no proof for `(1, 2)` | `−1 < σ ≤ 1` is right (round 3, re-read) | none |
| 5.6 locator (F02) | OhTataru-Threshold 1074; OhTataru-TopClass 53 | 1074: topological class = homotopy class of `O : S³ → G`; 53: contents entry | repaired | none |
| 1.1 `SU(2)` Check | `i = [[0,1],[−1,0]]`, `j = [[0,i],[i,0]]`, `k = diag(i,−i)` | `ij = k`, `ji = −k`, `[i,j] = 2k`; `jk = i`, `kj = −i`, `[j,k] = 2i`; `ki = j`, `ik = −j`, `[k,i] = 2j`; `|i|² = −tr(i²) = −tr(−1) = 2` | sound | none |
| 1.1 `Ad`- versus `ad`-invariance | `T² ⋊ ℤ/2`, `|e₁|² = 1`, `|e₂|² = 2` | `ad = 0` so any inner product is `ad`-invariant; conjugation by `[[0,1],[1,0]]` swaps `e₁`, `e₂` and changes norms | excluded, as the Check says; shows the converse needs connected `G` | none |
| 3.2 | `U(1)`, `φ ∈ W^{2,d/2}_loc`; `O = Φ(x/|x|)`, `A = 0` on `ℝ⁴∖{0}` | `O·A = A − i dφ`, `F` unchanged; `O·0 = −O;x` with `|O;x| ≈ 1/|x|`, smooth off `0`, `F = 0 = Ad(O)·0`; `O·A ∈ W^{1,d/2}_loc` through 2.4 (`Ad(O)A`, `O;x ∈ W^{1,d/2}_loc`) | sound | none |
| 4.3 | `m = 0`; `d = 3`, `m = 1` | `m = 0`: hypothesis `F ∈ L^{d/2}`, `d/2 > 1` for `d ≥ 3`, conclusion `∂A ∈ L^{d/2}(λB)`; `d = 3`, `m = 1`: `d/(m+2) = 1` excluded, matching the Calderón–Zygmund endpoint; without `∂^ℓA_ℓ = 0` the gauge freedom `A + dψ`, `ψ ∈ W^{1,d/2}` only, breaks the conclusion | sound | none |
| 6.3 identities | from 1.5 | `|F|² = |F⁺|² + |F⁻|²`, `⋆⟨F∧F⟩ = |F⁺|² − |F⁻|²`, `χ = −∫⋆⟨F∧F⟩ = ∫|F⁻|² − ∫|F⁺|²`; `ℰ_e − χ = 2∫|F⁺|²`, `ℰ_e + χ = 2∫|F⁻|²`; absolute convergence since `|⟨F∧F⟩| ≤ |F|²` | sound; equality iff `F⁺ = 0` a.e. or `F⁻ = 0` a.e. | none |
| 6.3 Checks | BPST (anti-self-dual); `SU(2)` | `F⁺ = 0` so `χ = ∫|F⁻|² = ℰ_e = 8π²`, `c₂ = χ/8π² = 1`; `ℰ_e = 8π²c₂ + 2‖F⁺‖²` equals FourManifolds' `E(A) = 8π²k + 2‖F_A⁺‖²` (head line 2288) with `k = c₂` | consistent with 6.4 and 7.6 | none |
| 6.4 normalisation | `⟨·,·⟩ = −tr` | `χ = −∫⟨F∧F⟩ = ∫tr(F∧F) = 8π²c₂`, matching OhTataru-TopClass 259–262 and OhTataru-YMHF 2914; sign rows (`c₂ = −1` for `Φ`, `c₂ = 1` for BPST via the reflection of degree `(−1)³`) carried from round 3 with their values | sound | none |
| 7.1 weak form | first variation of `∫Σ_{ℓ<j}|F_ℓj|²` | `δF_ℓj = D_ℓφ_j − D_jφ_ℓ`; `Σ_{ℓ<j}⟨F_ℓj, D_ℓφ_j − D_jφ_ℓ⟩ = Σ_{ℓ≠j}⟨F_ℓj, D_ℓφ_j⟩ = Σ_{ℓ,j}⟨F_ℓj, D_ℓφ_j⟩`, so the variation is `2∫Σ_{j,ℓ}⟨F_ℓj, D_ℓφ_j⟩`, the README's form; integrable since `A ∈ W^{1,2}_loc ⊂ L⁴_loc`, `F ∈ L²_loc` | sound | none |
| 7.1 Checks | `A = (i/2)(x₁dx₂ − x₂dx₁)`; `F = iψ(x₁)dx¹∧dx²`; commutative `G` | `F₁₂ = i/2 + i/2 = i`, `∂^ℓF_ℓj = 0`, `∫|F|² = ∞`; `∂^ℓF_ℓ2 = iψ'(x₁)`; an `L²` 2-form with `dF = 0 = d*F` on `ℝ⁴` is harmonic componentwise, hence `0` | sound | none |
| 7.3 decay rate | inversion `ι(x) = x/|x|²`, smooth `F̃` near the pole | `|∂ι| ≈ |x|^{−2}`, `|∂²ι| ≈ |x|^{−3}`; `F = ι*F̃` gives `|F| ≈ |x|^{−4}|F̃∘ι|`, and each `x`-derivative costs `|x|^{−1}` (derivative on `∂ι`) or `|x|^{−2}` (on `F̃∘ι`), so `|D^{(n)}F| ≲ |x|^{−4−n}`; BPST: `|F|² = 6·(2√2)²(1+|x|²)^{−4} = 48(1+|x|²)^{−4}`, `|∂F| ≈ |x|^{−5}` | rate `(1+|x|)^{−4−n}` sharp on BPST | none |
| 7.4 sign of the curvature term | GKS (2.3) against 1.6's `𝔉` | GKS `[P,Q]_{ij} = Σ_k([P_{ik},Q_{jk}] − [P_{jk},Q_{ik}]) = −Σ_k([P_{ik},Q_{kj}] − [P_{jk},Q_{ki}]) = −𝔉_P(Q)_{ij}`, so GKS's `−⟨ω,[F⁺,ω]⟩` is the README's `+⟨ω,𝔉_{F⁺}(ω)⟩` | identity as stated | none |
| 7.4 constant | `c = (2√6/3)γ₀` from 1.6 | `½Δ|F⁺|² ≥ |∇F⁺|² − c|F⁺|³`; with `½Δ|F⁺|² = |F⁺|Δ|F⁺| + |∇|F⁺||²` and Kato `|∇F⁺|² ≥ (3/2)|∇|F⁺||²`: `|F⁺|Δ|F⁺| ≥ ½|∇|F⁺||² − c|F⁺|³`; `Δ|F⁺|^{1/2} = ½|F⁺|^{−1/2}Δ|F⁺| − ¼|F⁺|^{−3/2}|∇|F⁺||² ≥ −(c/2)|F⁺|^{3/2}` | `(√6/3)γ₀`, half of 1.6's constant, as stated; GKS (3.4) with `R = W⁺ = 0` reads `−(γ₁/2)|F⁺|^{3/2}` | none |
| 7.5 gap constant | `u = |F⁺|^{1/2}` | `∫|∇u|² ≤ (√6/3)γ₀∫u⁴`; Yamabe: `6∫|∇u|² ≥ 8√6π(∫u⁴)^{1/2}` (`Y(S⁴) = 12(8π²/3)^{1/2} = 8√6π`); so `8√6π(∫u⁴)^{1/2} ≤ 2√6γ₀∫u⁴`, `(∫u⁴)^{1/2} ≥ 4π/γ₀`, `∫|F⁺|² ≥ 16π²/γ₀²`; `SU(2)`: `γ₀ = √2`, bound `8π²`, attained by self-dual BPST | sound | none |
| 7.5 source constants | GKS (1.4) vs README | TopClass footnote 6: `ℰ_e = ½‖F‖²_{GKS}`, so `∫|F|²_{GKS} ≥ 16π²|κ| + 32π²` is `ℰ_e ≥ 8π²|c₂| + 16π²` (Theorem 1.30, Theorem 2.5); TopClass 2403–2405: `γ₀ = √2`, `γ₁ = (2/√3)γ₀ = 2√6/3` in GKS's norm, against `(2√6/3)γ₀ = 4/√3` here: the factor `√2` is the norm rescaling, and the BPST equality `24√2λ³ = (2√6/3)√2(6λ²)^{3/2}` pins the README's constant independently | consistent | none |
| 7.5 both parts nonzero | `𝔰𝔲(2) ⊕ 𝔰𝔲(2)`, charges `−1`, `1` | `ℰ_e = 8π² + 8π² = 16π²`, `χ = 8π² − 8π² = 0`, `|χ| + 32π²/γ₀² = 0 + 16π²` | equality, as the Check says | none |
| 7.7 upper bound | `𝔰 ≅ 𝔰𝔲(2)`, `⟨φX,φY⟩ = −c tr(XY)` | `γ₀(𝔰) = c^{−1/2}√2` (1.6 scaling); `ℰ_e(φ∘A_BPST) = 8π²c = 16π²/γ₀(𝔰)²`; with the gap's `γ₀(𝔰) = γ₀(𝔤)`: `E_GS ≤ 16π²/γ₀²`, and 7.5 gives `≥`; source `16π²/⟨α,α⟩` with `γ₀ = |α|` (Lemma 6.4, 2381–2397) | `E_GS = 16π²/γ₀²` | none |
| 7.7 second item | non-instanton; instanton | `ℰ_e ≥ |χ| + 32π²/γ₀² = |χ| + 2E_GS ≥ 2E_GS`; instanton: `|χ| = ℰ_e ≥ E_GS` | matches Theorem 1.32(2) | none |
| 9.2 | Prop. 5.7, Lemma 5.17 | `Q_n` depends on `‖F(s₀)‖_{L²}` and `Q` only; the `Ḣ¹` bound needs energy `≤ E` ((5.41)) and gives `1 + inf_s‖A(s)‖_{Ḣ¹}`; ball version is Remark 5.19 | hypotheses as stated | none |
| 9.7 | `SU(2)`; BPST; commutative `G` | threshold `2E_GS = 16π²`; BPST has `ℰ_e = 8π² < 16π²` but `∫|x|^{−4}r³dr = ∞` so `A_BPST ∉ L⁴`, not `Ḣ¹`, and `‖F‖_{L³([0,∞);L³)} = ∞` as a static flow; commutative `G` excluded (`E_GS = ∞`), where 9.3's `U(1)` Check gives global flows | hypotheses necessary and sufficient as stated | none |
| 10.2 envelope hypothesis | Prop. 7.4 needs a `(−1, S)` envelope | a frequency envelope of 8.1 satisfies `c_k/c_j ≳ 2^{−δ(j−k)} ≥ 2^{−(1−ε)(j−k)}` for `δ ≤ 1 − ε`, so it is `(−1, S)`-admissible for `S ≥ δ/(1−ε)`; no hypothesis is missing | sound | none |
| 10.2 Checks | `U(1)`; pure gauge; constants | `Cal(ã) = ã − ∇φ` has `∂^ℓa_ℓ = 0`; `Cal(−O;x) = O·(−O;x) = 0`; `d(Ad(c)a, a) = 0` | sound | none |
| 10.4 Checks | `U(1)`; sphere; cross and `|x₁|` | `ℋ = {a ∈ Ḣ¹ : div a ∈ ℓ¹L²}`, Helmholtz `a = ∇φ + a^{df}` with `Δφ = div a ∈ ℓ¹L²` and `a^{df} ∈ Ḣ¹` (Leray projection bounded on `Ḣ¹`), so `{∇φ : Δφ ∈ ℓ¹L²}` complements the divergence-free part; sphere chart derivative is the inclusion of `e^⊥`, complemented by `ℝe`; cross not locally a line, `|x₁|` has no `C¹` immersive chart at `0` | sound; the chart condition is Mathlib's `IsSmoothEmbedding` | R01 (P3) |
| 4.1 (headline) | `U(1)`; `A = 0`; `A_t(x) = tA(tx)` | `∂^ℓÃ_ℓ = ∂^ℓA_ℓ − iΔφ = 0` ⇒ `Δφ = −i∂^ℓA_ℓ`, `x^ℓÃ_ℓ = 0` ⇒ `∂_νφ = −ix^ℓA_ℓ`, compatibility by the divergence theorem; `A = 0`: `‖O;x‖ ≤ C₀·0` forces constants; `‖F[A_t]‖^{d/2}_{L^{d/2}(B₁)} = ∫_{B₁}t^d|F(tx)|^{d/2}dx = ‖F‖^{d/2}_{L^{d/2}(B_t)}`, nondecreasing in `t` | sound | none |
| 5.2 (headline) | flat; inversion | `F = 0`: `r_c = ∞`, `R_c = 0` (3.4), `O_(∞)` constant, `B = 0`; `ι(x) = x/|x|²`: `|ι*F|(x) = |x|^{−4}|F(ιx)|`, Jacobian `|x|^{−2d}`, `∫|ι*F|^{d/2} = ∫|x|^{−2d}|F(ιx)|^{d/2}dx = ∫|F|^{d/2}` | `‖F‖_{L^{d/2}}` preserved, as the route needs | none |
| 5.4–5.5 (headline) | `{±1}`; `O(4)`; `U(1)`; `−ηO;x` | `[S^{d−1}, {±1}]` has two points swapped by `c = −1`, quotient a point; conjugation by `q ↦ q̄` sends `L_u` to `R_ū`, swapping the summands of `π₃(SO(4)) ≅ ℤ⊕ℤ`; `π_{d−1}(S¹) = 0` for `d ≥ 3`; `χ(−ηO;x) = ∫_{S³}Φ*ω_f = −8π² ≠ 0 = χ|_{Ḣ¹}` and `χ` is gauge invariant | sound | none |
| 6.2 (headline) | smooth `A = −η'O_(∞);x + B`, `B` compactly supported | `∫_{B_ρ}dT_f(A) = ∫_{∂B_ρ}T_f(−O_(∞);x) = ∫_{∂B_ρ}O_(∞)*ω_f`, independent of `ρ` by homogeneity; constant `O_(∞)` gives `0`; odd `d`: `2k ≠ d` | sound | none |
| 9.3 (headline) | dilation; `U(1)` | parabolic scaling `A ↦ λA(λx, λ²s)` gives `s₀(λa(λ·)) = λ^{−2}s₀(a)`; `∂_sA = ΔA − ∇ div A`: `∇φ` static (`Δ∇φ − ∇Δφ = 0`), `a^{df}` follows the heat equation, global | sound | none |
| 9.6 (headline) | small energy; bubble energy | `ℰ_e(a) ≤ ε` gives `s₀ = ∞`, `Q < ∞` (9.4) while any bubble has `ℰ_e(Q) ≥ E_GS = 16π²/γ₀² > ε`; `ℰ_e(Q) ≤ ℰ_e(a)` by the energy identity and lower semicontinuity under `L²_loc` convergence; `r_n²F(x_n + r_nx, s_n + r_n²s)` is the curvature of `r_nA(x_n + r_nx, s_n + r_n²s)` | sound | none |
| 10.5 (headline) | rows of round 3 (`W(∞) = −∇c`, `c = −Δ⁻¹∂^ℓW(∞)_ℓ`, the three Checks) | re-read; values unchanged; the route uses 9.5's limit and the product bound, not a decay from bounds | sound | none |
| plan.json ↔ README | all 52 targets | 10 layers, 52 targets, 119 tests, 4 gaps; every definition has `≥ 3` tests; every `target:`/`gap:` prerequisite resolves; `neededBy` of the gaps (4.1; 4.1; 5.2, 5.3, 6.1; 7.7) equals the README's gap `*Needs:*` lines; 8.3's four new tests are the README's new Checks and the `σ = 2` Check; 8.3 and 9.5 statements match the README | sound | none |

**Overlaps (`scratch/overlaps.md`).** No open pull request changes this roadmap. The one dropped id,
DifferentialGeometry Layer 10 (README lines 276–278 and 1076), is unchanged from rounds 2–3: at the
DifferentialGeometry head the degree is listed among DeRhamCohomologyAndDuality's objects ("none of
them is a target here", head line 37; "which DeRhamCohomologyAndDuality's degree theory consumes",
head line 938), and the DeRhamCohomologyAndDuality head (lines 9 and 50) imports "the degree (layer
10)" from DifferentialGeometry and states none; the degree exists only on main (877–896), where the
README cites it. This is round 1's F01 part (ii), marked not actionable with a reason I re-verified;
not re-raised. No id of this roadmap is cited elsewhere. Closest open roadmaps: InstantonFloerTheory
(`SU(2)` consumer of FourManifolds), IncompressibleFlows (unrelated), FourManifolds (above),
SobolevDifferentialForms (head: Layer 7 is the `L²` Gaffney identity on the cube, and its scope line
48 excludes "the `Lᵖ` Hodge decomposition and closed range for `p ≠ 2`"; not earlier in the merge
order), PDE's open revision (Lane G item 31, head lines 582–592: the mixed and Neumann problems in the
`H¹` weak formulation with `L²` boundary data, so `gap:lp-neumann-ball` asks for nothing it provides,
and PDE is cited as on main). Second-owner greps with `roadmaps grep -i` over main and every open head: "caloric", "Yang–Mills heat", "covariant heat", "diamagnetic", "instanton number", "topological class of a connection": no match outside this roadmap; "Hardy's inequality": only RelativisticQuantumFieldTheory (head line 5175), which uses the one-dimensional radial inequality as a tool and owns nothing on `ℝ^d`; "Uhlenbeck" and "Coulomb gauge": FourManifolds (head lines 2499, 2544, 2554, its `SU(2)` lemma, the case stated in Scope), InstantonFloerTheory (head lines 88–177, consuming FourManifolds F5 for `SU(2)`/`SO(3)`), RelativisticQuantumFieldTheory §9.12 and SeibergWittenTheory SW5.4 (abelian Coulomb gauges), and Ornstein–Uhlenbeck processes elsewhere; none states the general-`G`, `d ≥ 3` lemma, the topological class or the heat flow. Ownership against the open pull requests named in the brief was checked with these tools.

**Declared gaps.** All four unchanged and re-read: `lp-neumann-ball` (precise: `1 < p < ∞`, `d ≥ 2`,
inhomogeneous Neumann data `∂_νu = ν·V`, compatibility, `W^{2,p}` solution unique up to constants with
the estimate; minimal: PDE Layer 5 on main is interior and Dirichlet only, the open revision is `H¹`),
`lp-divcurl-normal-ball` (precise; minimal: no owner at the pins, on main or earlier in the order;
SobolevDifferentialForms is `p = 2` and later), `hardy-inequality` (precise, constant `p/(d−p)`;
minimal: no Hardy inequality at the pins or in PDE), `compact-su2-subalgebra` (precise; minimal:
LieGroups Layer 6 has maximal tori and the Weyl group, no root `𝔰𝔲(2)`; true, since `γ₀` is the maximum
over simple ideals and is attained on the highest-root `𝔰𝔲(2)` by OhTataru-TopClass Lemma 6.4). Same
slug in `plan.json` and the README; none has supplier `none`.

**Shape.** Summary; Scope and ownership; Conventions; Exact supplier contracts; How to read the build;
ten layers each ending with Examples and Dependencies; Downstream consumers; References. Every theorem
carries its hypotheses in the sentence and a locator; every definition its API bullets and at least
three Checks (plan.json count confirms); Unicode throughout; every cited work is in `sources.toml`.

**Headline theorems** (from the Summary; for the package stage, which writes `Suggested.lean`): gauge
invariance of finite energy (3.2); Uhlenbeck's lemma for every compact `G`, `d ≥ 3` (4.1); the good
global gauge theorem (5.2); well-definedness, gauge invariance and locality of the topological class
(5.4) and the trivial class (5.5); topological invariance of characteristic numbers (6.2); the
Bogomol'nyi bound (6.3); integrality and completeness of `c₂` for `SU(2)` (6.4); the energy gap and
ground state (7.5, 7.7); local well-posedness, continuation and the flat limit (9.3–9.5); the Dichotomy
and Threshold Theorems (9.6, 9.7); existence and uniqueness of the caloric gauge (10.2); the caloric
manifold with its tangent spaces and div–curl decomposition (10.4, 10.5). Carriers at the pins:
`Matrix.unitaryGroup`, `Matrix.specialUnitaryGroup`, `HomotopyGroup`, `ContinuousMap.Homotopic`,
`IsSmoothEmbedding`, Tau Ceti's `W1p`/`Wkp`; not at the pins: `Ḣ¹`, `Ḣ^σ`, `ℓ¹L²`, `ℋ`, `𝒞` (PDE §7.1–7.2
planned, unbuilt), so the heat-flow and caloric headlines will need simple definitions or a docstring
note at the package stage. The one-tactic probe does not apply (no Lean file).

## Not verifiable

- `Uhlenbeck-LpCurvature` Theorem 1.3 and `Uhlenbeck-RemovableSingularities` Theorem 4.1 (settled
  uncertified): the design relies on their certified restatements OhTataru-TopClass Theorems 3.11–3.12.
- `FreedUhlenbeck-Instantons`, `DonaldsonKronheimer`, `Bogomolnyi-Stability`,
  `MimuraToda-TopologyLieGroups`: settled uncertified; no target depends on their text.
- Elaboration and the one-tactic probe: not available (this lane does not elaborate; no `Suggested.lean`
  at the design stage).
- The published numbering of the Oh–Tataru papers against the arXiv v2 texts read: not checked; the
  manifest records `version_note = "arXiv v2"` for each.

## Source issues

- **Error** in OhTataru-YMHF at Theorem 4.6, PDF page 29 (line 1290): the conclusion is printed in the
  norm `L¹Ḣ^σ`; it should be `ℓ²L¹Ḣ^σ`, which the block-by-block proof (lines 1297–1320) gives and the
  applications (lines 2207, 2546) use, the `L¹` form being false already for the heat equation; affects
  a stated result.
- **Gap** in OhTataru-YMHF at Lemma 5.33(2), proof, PDF page 55 (lines 2534–2535): `curl_A B → 0` in
  `L²` is taken from "the `L²` solvability"; it should be proved, since Theorem 4.3 gives bounds only;
  affects the proof.
- **Gap** in OhTataru-YMHF at Lemma 5.33(2), proof, PDF page 55 (line 2543): the homogeneous
  covariant-heat solution `F_{0j}` is said to vanish at `s = ∞` in `Ḣ^σ` without argument; it should be
  proved from the bounds (as 8.3's decay clause does); affects the proof.
- **Gap** in OhTataru-YMHF at Remark 7.10, PDF page 72 (lines 3402–3404): the `L²` decay of `F_{0j}` is
  taken from "the `L²` theory in Theorem 4.3"; it should note that Theorem 4.3 states bounds and supply
  the decay; affects the proof.
- **Gap** in OhTataru-YMHF at Corollary 5.15, PDF page 42 (lines 1954–1955): the linearised limit is
  claimed in `Ḣ^σ` for `−1 < σ < 2`; its proof, Lemma 5.33(2), writes `0 ≤ σ ≤ 1` and extends to
  `−1 < σ < 1` but not to `1 < σ < 2`; affects a stated result.
- **Misprint** in OhTataru-YMHF at (1.19), PDF page 6 (line 243), and Proposition 5.6, (5.11), PDF
  page 34 (lines 1612–1619): the dissipation term is printed with factor `1` for the energy
  `½∫⟨F_jk, F^{jk}⟩`; it should be `2∫Σ_k|D^ℓF_ℓk|²`; affects nothing.
- **Misprint** in OhTataru-TopClass at Proposition 3.9, PDF page 26 (line 1303): the global potential is
  said to lie in `W^{k,d/k}(B_R)`; it should be `W^{k−1,d/k}`, as line 1309 reads; affects nothing.
- **Misprint** in OhTataru-TopClass at Lemma 3.13, PDF page 29 (line 1423): the conclusion is printed
  as `L^{d/(n+2)}` with `n` undefined; it should be `L^{d/(m+2)}`; affects nothing.
- **Error** in OhTataru-TopClass at Proposition 1.6(1), PDF page 9 (line 401): for disconnected `G` the
  two gauges at infinity are homotopic only up to left and right constants; it should state connected
  `G` or the quotient by constants; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5b101ca32275b89e247278bd796cc89b0c028a8e", "job": "REV-DESIGN-YangMillsConnectionsAndCaloricGauge~4", "model": "fable", "worker": "chris-x10"} -->
