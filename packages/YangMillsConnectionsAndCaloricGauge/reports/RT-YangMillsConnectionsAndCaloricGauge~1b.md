<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12830#issuecomment-6780847395 -->
Red team round 1 pass b (claude) of 4963861

Verdict: needs_changes

1. **F01** (P1) Fréchet `C¹` regularity of `Cal` is consumed by 10.4 but no target supplies it

   - **Location.** README:1794–1795 (9.5): "`C¹` along every `C¹` curve in these spaces with uniformly
     bounded `Q`, with derivative `B_∞`"; README:1913–1915 (10.2): "`C¹` in `ℋ` … along families with
     uniformly bounded `Q`"; README:1963–1964 and 1986 (10.4): the chart is
     `Manifold.IsSmoothEmbedding 𝓘(ℝ, E) 𝓘(ℝ, 𝔅) 1 φ`, "Route: `C¹` regularity from 10.2".
   - **Claim.** 10.4 needs the chart `b ↦ Cal(a + b)` to be `C¹` in Mathlib's sense (Fréchet
     differentiable with derivative continuous in the operator norm; `IsImmersion` is stated through
     `C¹` charts). 9.5 and 10.2, its only suppliers, give differentiability along `C¹` curves only.
     That is also all the source proves (OhTataru-YMHF line 2552–2555, 3062, 3230: one-parameter
     families).
   - **Witness.** `N(u) = sin u` on `L²(0,1)`: for every `C¹` curve `u_h`, `h ↦ N(u_h)` is `C¹` with
     derivative `cos(u_h)·u_h'` (dominated convergence), a bounded linear function of `u_h'`; yet `N`
     is Fréchet differentiable at no point (a Fréchet differentiable superposition operator
     `L² → L²` is affine). So "`C¹` along curves with linear bounded derivative" does not give
     `ContDiff ℝ 1`.
   - **Second defect, same place.** README:1915: "the map `ã ↦ O` is `C¹` from `ℋ` to
     `{O : O;x ∈ Ḣ¹} ∩ C⁰`". The target is a set of `G`-valued maps, not a normed space or a manifold
     defined in the roadmap, so `C¹` has no meaning there.
   - **Repair.**
     1. In 9.5 replace "and `C¹` along every `C¹` curve in these spaces with uniformly bounded `Q`,
        with derivative `B_∞`" by: "and continuously Fréchet differentiable (Mathlib `ContDiff ℝ 1`) on
        the open set `{a : Q(a) < ∞}` of each of these spaces, with derivative `b ↦ B_∞`. Prove it in
        two steps: (i) along every `C¹` curve `a_h` with uniformly bounded `Q`, `h ↦ A_∞(a_h)` is `C¹`
        with derivative `B_∞[a_h](∂_h a_h)` (OhTataru-YMHF line 2552–2555); (ii) operator-norm
        continuity: for `ã → a` in the space `X`, `sup_{‖b‖_X ≤ 1} ‖B_∞[ã]b − B_∞[a]b‖_X → 0`, from the
        equation of `B[ã]b − B[a]b`, which is the linearised flow around `A` with zero data and a
        source bilinear in `(Ã − A, B[ã]b)`, estimated by 8.3 and the Lipschitz bound of 9.4. A map
        that is Gâteaux differentiable with operator-norm continuous derivative is `ContDiff ℝ 1`.
        The set `{Q < ∞}` is open: at a large heat-time the energy is below the small-energy threshold
        of 9.4, and 9.4's stability transports this to nearby data." Step (ii) is not in the source;
        if its bilinear estimate cannot be closed at the regularity of `ℋ`, then 10.4 must state the
        weaker class it proves and not `Manifold.IsSmoothEmbedding … 1`.
     2. In 10.2 replace "`C¹` in `ℋ` and in `ℋ ∩ Ḣ^σ`, `σ > 1`, along families with uniformly bounded
        `Q`" by "continuously Fréchet differentiable on the open set `{Q < ∞}` of `ℋ` and of
        `ℋ ∩ Ḣ^σ`, `σ > 1` (from 9.5)", and replace the last clause by "the map `ã ↦ O − 1` is
        continuously Fréchet differentiable from `{ã ∈ ℋ : Q(ã) < ∞}` to the Banach space
        `{U ∈ C_b(ℝ⁴; M_N(ℂ)) : ∂U ∈ Ḣ¹}` with norm `‖U‖_∞ + ‖∂U‖_{Ḣ¹}`".
     3. Add to 10.4's Checks the negative control: "`u ↦ sin u` on `L²(0,1)` is `C¹` along every `C¹`
        curve and nowhere Fréchet differentiable, so curve-wise regularity of a chart does not give a
        `C¹` smooth embedding." Tested on the witness: the repaired 9.5 statement excludes it (its
        derivative `h ↦ cos(u)h` is not operator-norm continuous in `u`).

2. **F02** (P1) the homogeneous `L²`-based product bounds are cited to PDE §7.3, which does not state them

   - **Location.** README:286–289 ("the `L²`-based product bounds of Layers 8–10 … follow from its
     decomposition"); README:1806–1807, 1831 (9.5 *Needs*: "PDE §7.1, §7.3 (the product bound)");
     README:1987–1988, 2021–2022 (10.4); README:2044, 2056 (10.5).
   - **Claim.** `‖[u, v]‖_{Ḣ^σ} ≲ ‖u‖_{Ḣ¹}‖v‖_{Ḣ^{σ+1}}` (`−2 < σ < 1`) and
     `‖[u, v]‖_{ℓ¹L²} ≲ ‖u‖_{Ḣ¹}‖v‖_{Ḣ¹}` on `ℝ⁴` are inputs of three proof plans, attributed to PDE.
   - **Witness.** `TauCetiRoadmap/PDE/README.md` §7.3 (lines 2785–2805): the decomposition is built on
     the inhomogeneous blocks ("`S_j = 0` for `j ≤ 0`") and the estimates are stated only in `𝒞^α`
     (`‖T_f g‖_{𝒞^β}`, `‖R(f,g)‖_{𝒞^{α+β}}`). No `Ḣ^σ` or `Ḃ⁰_{2,1}` bound and no homogeneous
     decomposition is there, and no layer of this roadmap states the bounds as a target.
   - **Repair.** Add to 8.1, after the list of properties of `Ẇ^{σ,p}`, the target: "**Homogeneous
     product bounds.** For `u, v ∈ 𝒮'_h(ℝ⁴)` put `T_u v = Σ_{k∈ℤ} P_{≤k−2}u · P_k v` and
     `R(u, v) = Σ_{|j−k|≤1} P_j u · P_k v` (the homogeneous form of PDE §7.3's decomposition). Prove
     that for `u ∈ Ḣ¹` and `v ∈ Ḣ^{σ+1}`, `−2 < σ < 1`, the three series converge in `𝒮'`, their sum
     is `uv`, and `‖uv‖_{Ḣ^σ} ≲_σ ‖u‖_{Ḣ¹}‖v‖_{Ḣ^{σ+1}}`; and that `‖uv‖_{ℓ¹L²} ≲ ‖u‖_{Ḣ¹}‖v‖_{Ḣ¹}`.
     Route for the second: `‖P_{≤k−2}u‖_∞ ≲ Σ_{j<k} 2^j‖P_j u‖_{Ḣ¹}` (Bernstein, PDE §7.1) gives
     `Σ_k ‖P_{≤k−2}u P_k v‖_{L²} ≲ Σ_k Σ_{j<k} 2^{j−k}‖P_j u‖_{Ḣ¹}‖P_k v‖_{Ḣ¹} ≲ ‖u‖_{Ḣ¹}‖v‖_{Ḣ¹}`
     (Schur), and `‖P_k(P_j u P_j v)‖_{L²} ≲ 2^{2k}‖P_j u P_j v‖_{L¹} ≤ 2^{2(k−j)}‖P_j u‖_{Ḣ¹}‖P_j v‖_{Ḣ¹}`
     for `k ≤ j + 3` sums to the same bound. Check: both sides of each bound have the same degree
     under `u(λ·), v(λ·)` (`λ^{σ−2}` and `λ^{−2}`); at `σ = 1` the first fails, since `Ḣ²(ℝ⁴) ⊄ L^∞`."
     Change the contract paragraph at README:286–289 to say that PDE §7.3 supplies only the form of
     the decomposition and PDE §7.1 Bernstein, and change the *Needs* lines of 9.5, 10.4 and 10.5 from
     "PDE §7.1, §7.3 (the product bound)" to "8.1 (homogeneous product bounds)". Tested on the
     instance: with the target in 8.1 the three proof plans have an owner for each bound.

3. **F03** (P3) two PDE citations are for more than PDE states

   - **Location.** README:283–285: "§7.1: the homogeneous blocks `P_k` … and the heat-block estimate
     `‖e^{sΔ}P_k f‖_p ≲ exp(−c4^k s)‖P_k f‖_p`; §7.2: homogeneous Besov spaces `Ḃ^s_{p,q}` with their
     realisation for `s < d/p`"; used at README:1473, 1608, 1644.
   - **Witness.** `TauCetiRoadmap/PDE/README.md` line 2691: the heat-block estimate is stated "for
     `j ≥ 1`" only; line 2722–2724: `Ḃ^s_{p,q}` is defined "as distributions modulo polynomials",
     with reconstruction "in `𝓢'` modulo polynomials". PDE has no realised space inside `𝒮'_h` and no
     estimate for the blocks `k ≤ 0`.
   - **Repair.** In the contract write "§7.1: … and the heat-block estimate for `j ≥ 1`; 8.1 extends
     it to every `k ∈ ℤ` by dilation" and "§7.2: homogeneous Besov spaces modulo polynomials; 8.1
     fixes the representative in `𝒮'_h`". Add to 8.1: "For `k ∈ ℤ` and `λ = 2^{k−1}`,
     `P_k f = (P_1 f(λ⁻¹·))(λ·)` and `e^{sΔ}(g(λ·)) = (e^{λ²sΔ}g)(λ·)`, so PDE §7.1's estimate at
     `j = 1` gives `‖e^{sΔ}P_k f‖_p ≤ C exp(−c4^k s)‖P_k f‖_p` with the same constants. For `s < 4/p`,
     or `s = 4/p` and `q = 1`, every class of PDE §7.2's `Ḃ^s_{p,q}` has exactly one representative
     in `𝒮'_h`, namely `Σ_k P_k f`; the realised space is the set of these representatives." Tested:
     the homogeneous block `k = 0`, `p = 2`: `‖e^{sΔ}P_0 f‖₂ ≤ e^{−4π²s}‖P_0 f‖₂`, since its symbol `ψ` is supported in `|ξ| ≥ 1`.

4. **F04** (P3) a Check of 5.2 and the route of 10.1 use a conclusion that 5.2 does not state

   - **Location.** README:1026–1027: "the theorem gives `O_(∞)` constant and `B = 0`"; README:1893:
     "Route: 5.2 for a flat connection, 4.3"; README:1900 (*Needs:* 4.3, 5.2, 8.1).
   - **Witness.** 5.2 as stated bounds `‖B‖_{Ẇ^{1,d/2}} ≲_{ε_*, R/r} 1` and `‖O_(∞)‖_{C^n}`; for
     `F = 0` these bounds do not give `B = 0`. The vanishing comes from 4.1, whose bound is
     `‖Ã‖_{W^{1,d/2}} ≤ C₀‖F‖_{L^{d/2}} = 0`.
   - **Repair.** Replace the Check by: "A flat connection on `ℝ^d` (`F = 0`): on every ball 4.1 gives a
     gauge with `‖Ã‖ ≤ C₀·0`, so the local potentials vanish, the transition maps satisfy `O;x = 0` and
     are constants on the connected overlaps, and 3.3 patches them to a global gauge with potential
     `0`; in the form of the theorem this is `(O_(∞), B) = (1, 0)`, with `r_c = ∞` and `R_c = 0`."
     In 10.1 replace the route by "4.1 on balls (the Coulomb potential of a flat connection is `0`),
     3.3 for the global gauge, 4.3 for the continuity of `O`" and the *Needs* line by
     "3.3, 4.1, 4.3, 8.1". Tested on `a = −O;x`, `O = exp(x₁² i)`: the local gauges are `cO⁻¹`.

5. **F05** (P3) a Check of 4.2 drops the theorem's global-potential hypothesis

   - **Location.** README:907–909: "Every connection with `F ∈ L^{d/2}(B'₁)` extends across the
     puncture".
   - **Witness.** 4.2 (README:896–897) and OhTataru-TopClass line 1398–1404 assume a global potential
     on `B'_{1+δ}`; 3.3 gives global gauges on `B_R` and `ℝ^d` only. For `d = 3`, `G = U(1)`, the
     bundles on `B'` are classified by `π₁(U(1)) = ℤ` and the nontrivial ones have no global
     potential, so the Check claims a case the theorem does not cover.
   - **Repair.** Replace "Every connection with `F ∈ L^{d/2}(B'₁)`" by "Every connection on `B'_{1+δ}`
     that has a global potential and `F ∈ L^{d/2}(B'₁)`", and add: "for `d = 3`, `G = U(1)` the monopole
     bundle of charge `n ≠ 0` has no global potential; its flux `2πn` through every sphere forces
     `|F| ≳ |n| r^{−2}` on average and `∫ |F|^{3/2} ≳ ∫₀¹ dr/r = ∞`, so it is outside the hypothesis
     on both counts."

6. **F06** (P3) notation used but not defined

   - **Location.** README:933: "`O;x ∈ ℓ¹W^{1,d/2}(B)`" and README:943–944 ("Besov sum", "the
     oscillating critical gauge of §2.1"); README:812–813: "covered by uniformly separated unit
     balls `B_α`".
   - **Witness.** The Conventions define `ℓ^pY` only for space-time norms on `ℝ⁴` (README:198–199);
     no norm `ℓ¹W^{1,d/2}` on a ball is defined, and 10.1 depends on this statement. The map of 2.1
     is `exp(log log(1/|x|) X)`, which the README nowhere calls oscillating. Balls that cover `B_R`
     are not separated.
   - **Repair.** In 4.3 write: "Here `ℓ¹W^{1,d/2}(B)` is the space of restrictions to `B` of elements
     of PDE §7.2's inhomogeneous Besov space `B^1_{d/2,1}(ℝ^d)`, with the quotient norm
     (OhTataru-TopClass line 1495 uses the extension)"; in the third Check replace "Besov sum `0`" by
     "norm `0` in `ℓ¹W^{1,d/2}(B)`" and "the oscillating critical gauge of §2.1" by "the map
     `exp(log log(1/|x|) X)` of 2.1, which has no continuous representative, so its `O;x` is not in
     `ℓ¹W^{1,d/2}`". In 3.3 replace "covered by uniformly separated unit balls `B_α`" by "covered by
     unit balls `B_α` whose centres are pairwise at distance at least `c(d) > 0` (so that each point
     lies in at most `C(d)` of them)".

7. **F07** (P3) the ownership sentence about FourManifolds leaves two owners

   - **Location.** README:112–117: "FourManifolds does not consume this roadmap. §4.1 here states the
     lemma for every compact `G` and every `d ≥ 3`, of which FourManifolds' statement is the case".
   - **Witness.** `TauCetiRoadmap/FourManifolds/README.md` at its open head, §5.3 (lines 2543–2547),
     proves the same lemma on the unit 4-ball for `SU(2)`, then removable singularities; this roadmap
     is earlier in `merge-order/ORDER.txt` (line 13 against line 135). One object, two proofs planned.
   - **Repair.** Replace "FourManifolds does not consume this roadmap." by "This roadmap is earlier in
     the merge order and owns the Euclidean statements: §4.1 (every compact `G`, every `d ≥ 3`), §4.2
     and §7.3 (removable singularities) and §7.6 (the potential on `ℝ⁴`). FourManifolds' unit-ball
     lemma is the case `G = SU(2)`, `d = 4` of §4.1 and can cite it; its `S⁴` carrier, moduli spaces
     and compactification are not planned here." No *Needs* line changes.

8. **F08** (P3) layer-level dependency lists omit layers that the `*Needs:*` lines use

   - **Location.** README:384 ("Layer 10 needs Layer 9"), README:2065–2066 (Layer 10 Dependencies:
     "Layers 8–9; Layer 7 …"), README:1882 (Layer 9), README:1250–1251 (Layer 6), README:1148 (Layer 5).
   - **Witness.** 10.1 needs 4.3 and 5.2 (README:1900); 9.1 needs 1.3 and 9.2 needs PDE §1.4
     (README:1705, 1730); 6.1 needs 3.2 (README:1173); 5.1 needs 1.3 (README:1003).
   - **Repair.** Layer 10 Dependencies: "Layers 8–9; Layers 3–5 for 10.1 (after R04: 3.3, 4.1, 4.3);
     Layer 7 for the subthreshold existence of `Cal`; …". "How to read the build": "Layer 10 needs
     Layer 9, and Layers 3–4 for 10.1". Layer 9: add "Layer 1 (1.3); PDE §1.4". Layer 6: "Layers 1, 3
     (3.2), 5". Layer 5: "Layers 1 (1.3), 2–4".

9. **F09** (P3) two text defects

   - README:1: "# Roadmap: yang–mills connections on Euclidean space and the caloric gauge". Repair:
     "# Roadmap: Yang–Mills connections on Euclidean space and the caloric gauge".
   - README:197: "Write `J ⊆ [0, ∞)` is an interval, and `L^p(J; X)` is Mathlib's Bochner space".
     Repair: "Here `J ⊆ [0, ∞)` is an interval, and `L^p(J; X)` is Mathlib's Bochner space".

Files: `packages/YangMillsConnectionsAndCaloricGauge/README.md` (2106 lines, read in full) and
`packages/YangMillsConnectionsAndCaloricGauge/Suggested.lean` (58 lines, read in full; it declares
nothing). Line numbers below are README lines unless a file is named.

## Verified sound

Counts: 0 Lean declarations (the file has none; module docstring read against the Summary's
headline list: every headline of README:13–22 is named under Layers 3–10 with its missing carrier;
no statable headline found: each needs the rough connection, weak curvature or homogeneous-space
carriers, and the only pin-statable by-product, `π₃(SU(2)) ≅ ℤ`, is not a headline of this roadmap);
52 bold targets read; 38 locators opened in the source texts; 61 Checks recomputed or tested; 31
cross-roadmap citations and 33 pinned library names resolved.

Dependency check (run as given, no edits made):
`depcheck: 236 roadmaps, 2135 edges, 0 problem(s)`.

Pull request contents: `git diff --stat origin/main...HEAD` shows only files under
`packages/YangMillsConnectionsAndCaloricGauge/`. No pull-request numbers, no `lemma`, no
`set_option`, no algorithm in the README or the Lean file.

Gaps: the five slugs of `design/plan.json` (`lp-neumann-ball`, `lp-divcurl-normal-ball`,
`hardy-inequality`, `compact-su2-subalgebra`, `vector-valued-wkp`) appear with the same supplier
and wording at README:291–301 and 359. Pinned Tau Ceti has no Hardy inequality on `ℝ^d`, no `L^p`
Neumann theory and only the real-valued `TauCeti.Wkp` (`Analysis/Sobolev/Wkp/Basic.lean`, header:
"real-valued"), so none asks for what exists.

Pinned names (each opened at the pin): `Matrix.unitaryGroup`, `Matrix.specialUnitaryGroup`
(submonoids, `LinearAlgebra/UnitaryGroup.lean`), `NormedSpace.exp_add_of_commute`,
`Matrix.isUnit_exp`, `ContinuousMap.Homotopic.equivalence`, `HomotopyGroup`,
`MeasureTheory.eLpNorm_le_eLpNorm_fderiv_of_eq`, `MeasureTheory.Measure.toSphere`,
`homeomorphUnitSphereProd`, `TemperedDistribution.fourierMultiplierCLM`,
`MeasureTheory.Lp.toTemperedDistribution`, `Submodule.ClosedComplemented`
(`Topology/Algebra/Module/Complement.lean`), `Manifold.IsSmoothEmbedding` (fields `isImmersion`,
`isEmbedding`), `Manifold.IsImmersion` (`∃ F` in the universe of the target model),
`Manifold.IsImmersion.isDiffImmersionAt` (needs `n ≠ 0`; `IsDiffImmersionAt` is
`mfderiv … HasLeftInverse`), `TopologicalSpace.Opens.instChartedSpace`,
`ContDiffAt.toOpenPartialHomeomorph`, `ContDiffAt.to_localInverse`; `TauCeti.HasWeakFDerivOn`,
`TauCeti.D1p0` and its seven cited declarations, `TauCeti.W1p.morreyRepresentative`,
`TauCeti.enorm_sub_le_of_mem_ball_of_finrank_lt`, `Orientation.formHodgeStar`,
`Orientation.wedge_formHodgeStar_apply`, `Orientation.formHodgeStar_formHodgeStar_of_even`,
`TauCeti.heatKernel`.

Supplier sections (each opened on main): PDE §1.2, §1.4, §1.5, §1.6, §2.3, §3.2, §6.1, §6.3,
§7.1–7.3; SmoothBundlesConnections B3.1 (`A′ = Ad_(g⁻¹)A + g⁻¹dg`), B4.1, B4.2
(`u·A = Ad(u)A − du·u⁻¹`; with `O = g⁻¹` the two formulas agree) and its Part II sentence;
CharacteristicClasses C4 item 1 and C5a.3 (`d_Wθ = Ω − ½[θ,θ]`, `CS_P`, `F_t`: identical);
RiemannianGeometry R6 (ε-tube inversion, nearest-point retraction, uniform radius); Yamabe Y2
item 1; LieGroups Layers 0–2, 5A and the two named Layer 6 blocks (at
`TauCetiRoadmap/RepresentationTheory/LieGroups/README.md`); DifferentialGeometry Layers 0, 1, 5,
10.3–10.5; AlgebraicTopology Stage 6 item 5 (= §6.5) and Stage 8 item 3 (= §8.3) through its
Stage-to-section table; FourManifolds §5.3 and Layer 5 at its open head (`E(A) = 8π²k + 2‖F_A⁺‖²`).

The adversarial pass (values computed on each side):

| Statement | Instance | Values | Result |
|---|---|---|---|
| Gauge sign (Conventions) | `U(1)`, `A = i x₁dx₂`, `O = e^{iφ}`; `SU(2)`, `O = e^{x₁i}e^{x₂j}` | `F₁₂ = i`, `O·A = A − i dφ`; `F[R] = 2R∧R`, `F₁₂ = 2[i,j] = 4k`, `F[−R] = −R∧R + R∧R = 0` | holds |
| `⟨F∧F⟩` coefficient | `F₁₂ = F₃₄ = X` | `2|X|²` against `|F|² = 2|X|²`; all-index form gives `8|X|²` | holds |
| 1.1 Check 2 | `i, j, k` matrices | `ij = k`, `[i,j] = 2k`, `|i|² = 2` | holds |
| 1.1 Check 4 | `T² ⋊ ℤ/2` | swap sends `|e₁|² = 1` to `|e₂|² = 2` | holds |
| 1.2 polar factor | `M_t = [[1,t],[0,1]]` | `UᵀM = s⁻¹[[2,t],[t,t²+2]]` symmetric positive; distance² `4 + t² − 2√(4+t²)`; `t = 1`: `0.528 < 1` | holds |
| 1.3 Leibniz correction | `g = e^{πk/4}`, `X = i`, `Y = j` | `Ad(g)i = j`; `[O;1, Ad(O)Y] = 2k`; source form `Ad(g)[j,j] = 0` | holds |
| 1.4 `T_f`, `ω_f` | `k = 2`, `f = tr` | `2∫₀¹ t = 1`, `2∫₀¹ t² = ⅔`; pure gauge `tr R³ − ⅔ tr R³ = ⅓ tr R³` | holds |
| 1.4 `∫Φ*ω_f` | frame `(k,i,j)` at `e₁` | `3(−2) − 3(2) = −12`; `−12·2π²/3 = −8π²` | holds |
| 1.4 C5a.3 match | `k = 2` | `∫(t²−t)/2 = −1/12`; `tr θΩ − ⅙ tr θ[θ,θ]` ↦ `tr(A dA + ⅔A³)` | holds |
| 1.5 | `X(dx¹²+dx³⁴)`; `X dx¹²` | `2|X|² = 2|X|²`; `|X|² > 0` | holds |
| 1.6 scaling | `c⟨·,·⟩` | ratio scales by `√c / c = c^{−1/2}` | holds |
| 1.6 identity `±6√2⟨ω¹,[ω²,ω³]⟩` | random self-dual `ω` in `𝔰𝔲(2)` (script) | `1.66823` against `−1.66823`: sign `−` in the stated basis | holds |
| 1.6 equality | `ω^a = 1.3(i,j,k)` (script) | `|ω|² = 10.14 = 6λ²`; pairing `−74.5687 = −24√2λ³` | holds |
| 1.6 `𝔉_F(ω) = 𝔉_{F⁺}(ω)` | anti-self-dual `F`, self-dual `ω` (script) | `𝔉_{F⁻}(ω) = 0` exactly | holds |
| 1.6 `γ₀(𝔰𝔲(2), −tr)` | 20000 random pairs (script) | max ratio `1.41421` | holds |
| 2.1 Check 1 | `φ = log log(1/r)`, `d = 4` | `∫ dr/(r log² )`, `∫ dr/(r log⁴)` finite | holds |
| 2.1 component claim | `ψ ∘ O`, `ψ` locally constant near `G` | `∇(ψ∘O) = Dψ(O)∇O = 0` a.e. | holds |
| 2.4 counterexample | `O = e^{√L i}`, `B = √L j` | `|∂O|⁴r³ = 1/(16 r L²)`: integral `1/16·∫₁^∞ L⁻²`; rotating part `2√L·(2√L r)⁻¹ = 1/r`, `∫ dr/r = ∞` | holds; source's `k' = k` case false |
| 2.5 exterior item | constant; `Φ(x/|x|)` | `∂O = 0`; `∫|∂O|^d = C∫ dr/r = ∞` | holds |
| 3.1 cocycle | `A_α = O_αβ·(O_βγ·A_γ)` | `(O_αβO_βγ)·A_γ = O_αγ·A_γ` by 1.3 | holds |
| 3.4 BPST radius | `∫₀^r 96π²s³(1+s²)⁻⁴` | `48π²[1/6 − ½(1+U)⁻² + ⅓(1+U)⁻³] = 8π²U²(U+3)/(1+U)³`, `U = r²`; small `r`: `24π²r⁴` | holds |
| 4.1 Check 1 | `U(1)` | `Δφ = −i∂^ℓA_ℓ`, `∂_νφ = −i x^ℓA_ℓ` | holds |
| 4.3 Check 2 | `A_n = n^{−3/2} sin(nx₁) i dx²` | `‖A_n‖_{W^{1,2}} ≈ n^{−1/2}`, `‖∂²A_n‖ ≈ n^{1/2}` | holds |
| 5.1 Check 3 | BPST off `B₂` | `1/(1+r²) − 1/r² = −1/(r²(1+r²))` | holds |
| 5.3 identity | general | `(PO);x = O';x + Ad(P)B − B'`, then `(O'⁻¹PO);x = Ad(O'⁻¹P)B − Ad(O'⁻¹)B'` | holds |
| 5.4 Check 1 | `A = −2x₁ i dx¹`, `b = j dx²/(1+r²)` | `F₁₂ = −2x₁j/(1+r²)² − 4x₁k/(1+r²)`; `∫ r dr = ∞` | holds |
| 5.4 `O(4)` Check | `c(q) = q̄` | `c L_u c⁻¹(q) = q ū` | holds |
| 6.1 difference bound | `A = −η'O;x + B` | `db`, `[O;x, b]` (Hardy), `[B, b]`, `[b, b]` give the four terms | holds |
| 6.3 | `χ = −∫⟨F∧F⟩` | `ℰ − χ = 2∫|F⁺|²`, `ℰ + χ = 2∫|F⁻|²` | holds |
| 6.4 sign | `O = Φ(x/|x|)`; BPST | `c₂ = −1`; `deg(x ↦ x̄) = −1`, `c₂ = 1` | holds |
| 7.4 Kato step | `w = |F⁺|` | `Δw^{1/2} = ½w^{−3/2}(wΔw − ½|∇w|²) ≥ −(√6/3)γ₀ w^{3/2}` | holds |
| 7.4 Check | `u = 48^{1/4}/(1+r²)` | `Δ(1+r²)⁻¹ = −8(1+r²)⁻³`; right side `−(2√3/3)(4√3)48^{1/4}(1+r²)⁻³`; centre: `½·48·(−32) = −768`, pairing `768` (script) | holds |
| 7.5 | Sobolev with `Y(S⁴) = 8√6π` | `8√6π‖F⁺‖ ≤ 2√6γ₀‖F⁺‖²`, `‖F⁺‖ ≥ 4π/γ₀` | holds |
| 7.5 Check 2 | `𝔰𝔲(2) ⊕ 𝔰𝔲(2)` | `ℰ = 16π²`, `χ = 0`, `32π²/2 = 16π²` | holds |
| 7.6 | `dx̄∧dx` | `Φ(i)`-part `2(dx¹² − dx³⁴)`; `|F|² = 6·8/(1+r²)⁴`; `96π²/12 = 8π²`; `O;x = −Im(x̄dx)/r²` for `O = x̄/|x|` | holds |
| 7.7 | `⟨φX,φY⟩ = −c tr` | `γ₀(𝔰) = √2/√c`, `8π²c = 16π²/γ₀²` | holds |
| 8.1 Riesz constant | `n = 4`, `α = 1` | `Γ(3/2)/(π²·2·Γ(1/2)) = 1/(4π²)` | holds |
| 8.1 shell Check | `|ξ| = 2^{k+1}` | `(2π·2^{k+1})^σ = (4π)^σ2^{kσ}` | holds |
| 8.1 Lemma 3.5 | general | first term by `σ̃ < σ(1−ε)`, second by a geometric sum: constant `1 + C‖c‖_∞` | holds |
| 8.3 `ℓ²L¹` Check | `K` blocks | each block `4^k K^{−1/2}·4^{−k}`; sum `K^{1/2}` | holds |
| 9.1 Check 2 | `A = (i, j, k, 0)` | `∂_sA₁ = −8i`, `∂_sA₂ = −8j`, `∂_sF₁₂ = −32k`; `Δ_AF₁₂ = −16k`; `−2[F₁₃,F₂₃] = −16k` | holds |
| 9.1 Check 1 | `U(1)` mode | `d/ds` of `4π²|ξ|²|α|²e^{−8π²|ξ|²s}` is `−2·16π⁴|ξ|⁴|α|²e^{…}` | holds |
| 9.2 weight | parabolic dilation | `λ^{2+n−4/q}·λ^{−2(n/2+1−2/q)} = 1` | holds |
| 10.3 Check 3 | `ξ = e₁`, `η = 2e₁` | `(1−4)/5·[i,j] = −6k/5` | holds |
| 10.4 projection | `Ph = h − DΔ_a⁻¹D^ℓh_ℓ` | `D^ℓ(Ph)_ℓ = 0`; `PLb = b` given `Δ_a⁻¹Δ_ac = c` | holds |
| 10.4 product bounds | Bony in `ℝ⁴` | both true (see R02 for the computation) | true, unowned |
| 10.5 | `a = 0` | `c = −Δ⁻¹∇·w`, `b = w − ∇Δ⁻¹∇·w` | holds |

Remark (no finding): in 9.2 the range "`n = 0` with `1/p + 2/q ≤ 1/2`" is the source's; with the
corrected weight the interpolation between `L^∞(ds/s; L²)` and `L²(ds/s; L⁴)` gives the larger
range `1/p + 2/q ≤ 1`, which contains the hypothesis `(p, q) = (3, 3)` itself.

Ownership against open pull requests: searched by object (Uhlenbeck, Coulomb gauge, caloric,
instanton number, Yang–Mills heat, nearest-point retraction, div–curl with normal component) with
`roadmaps grep` over main and the open heads. Only FourManifolds overlaps (R07);
InstantonFloerTheory consumes FourManifolds F5 and owns nothing stated here. No `Suggested.lean`
name can collide: the file declares none.

## Not verifiable

- `Uhlenbeck-LpCurvature` Theorem 1.3, `Uhlenbeck-RemovableSingularities` Theorem 4.1,
  `FreedUhlenbeck-Instantons` Ch. 3, `DonaldsonKronheimer` Ch. 3, `Bogomolnyi-Stability`,
  `MimuraToda-TopologyLieGroups`: recorded as uncertified, cited by locator only.
- The bilinear estimate needed for step (ii) of R01's repair: not in any source read; the finding
  stands without it (the regularity is unowned either way).
- 4.3's convergence clause for higher derivatives and 8.2–8.4's envelope bounds: the statements
  agree with OhTataru-TopClass Remark 3.15 and OhTataru-YMHF Theorems 4.1–4.8 as far as stated
  there; their proofs were not re-derived.
- `Suggested.lean` was not elaborated (no Lean run is permitted in this pass); it has no
  declaration to check.

## Source issues

- **Error** in OhTataru-TopClass at Lemma 3.4(2), printed page 22 (line 1116–1123): the source says the adjoint action is continuous on `W^{k',d/k}_loc` for all `0 ≤ k' ≤ k`; it should be `k' < k`, or bounded `B` at `k' = k` (`O = e^{√L i}`, `B = √L j`, `d = 4`); affects a stated result.
- **Misprint** in OhTataru-TopClass at Lemma 3.4(3), printed page 22 (line 1130): the source says the second term of the derivative of `Ad(O)B` is `Ad(O)[O;x, B]`; it should be `[O;x, Ad(O)B]`; affects a stated result.
- **Gap** in OhTataru-TopClass at Lemma 3.2, proof, printed page 21 (line 1049): the source says a smooth `h` equals `0` on `V` and `1` on `W`; that needs disjoint closures, and a cut-off positive on `W` suffices under `V ∩ W = ∅`; affects the proof.
- **Misprint** in OhTataru-TopClass at (1.26), printed page 17 (line 886): the source says the 4-form is the all-index sum of `⟨F_ij, F_kl⟩ dx^i∧dx^j∧dx^k∧dx^l`; it should carry the factor `¼`, as Lemma 1.31 requires; affects a stated result.
- **Error** in OhTataru-TopClass at Lemmas 3.21–3.22 and Proposition 1.6(1), printed pages 9 and 33 (lines 401, 1634, 1646): the source says the class is that of the identity and gauges at infinity are homotopic; for disconnected `G` only up to constants; affects a stated result.
- **Gap** in OhTataru-TopClass at Theorem 1.5, printed page 8 (line 371): the source says the cut-off is centred at the origin; the centre must be a point where the outer concentration radius is nearly attained; affects a stated result.
- **Misprint** in OhTataru-TopClass at Theorem 1.5, printed page 8 (line 374): the source says the higher-regularity hypothesis is on `B_R`; it should be on `ℝ^d` for a conclusion on `ℝ^d`; affects a stated result.
- **Error** in OhTataru-YMHF at Theorem 4.6, printed page 29 (line 1290): the source says `DB` is bounded in `L¹Ḣ^σ`; its proof gives, and the truth is, the `ℓ²L¹Ḣ^σ` norm (the `L¹` form fails for the free heat flow); affects a stated result.
- **Misprint** in OhTataru-YMHF at Theorem 4.8, (4.34), printed page 33 (line 1522): the source says the exponent is `1 − α/2`; it should be `1 − β`, as in (4.32); affects a stated result.
- **Misprint** in OhTataru-YMHF at Corollary 5.8, (5.17)–(5.18), printed page 38 (line 1792–1800): the source says the weight has an extra `1/4 − 1/p`; with the measure `ds/s` scaling forces the exponent `n/2 + 1 − 2/q`; affects a stated result.
- **Gap** in OhTataru-YMHF at Theorem 4.7, printed page 30 (line 1356): the source says the solution is continuous into `Ẇ^{σ,p}` for all `p ≤ ∞`; at `p = ∞` norm continuity at `s = 0` needs data in the heat-continuity subspace; affects a stated result.
- **Gap** in OhTataru-YMHF at Corollary 5.12(1), printed page 42 (line 1931): the source says a strictly larger interval exists; that needs `s₀ < ∞`; affects a stated result.
- **Gap** in OhTataru-YMHF at Corollary 5.15 against Lemma 5.33(2), printed pages 42 and 54 (lines 1955, 2516): the source says the linearised limit holds for `−1 < σ < 2`; the proof covers `σ ≤ 1` only; affects a stated result.
- **Gap** in OhTataru-YMHF at Lemma 5.33(1), Step 3, and Theorem 7.8, Step 1, printed pages 55 and 70 (lines 2552–2555, 3307–3312): the source says the maps are `C¹`; the argument differentiates along one-parameter families only, which does not give Fréchet differentiability; affects the proof.
- **Gap** in OhTataru-YMHF at Theorem 6.1, printed page 55 (line 2567): the source says the concentration points converge to a point `x₀`; the proof does not show it; affects a stated result.
- **Misprint** in OhTataru-YMHF at Proposition 7.7, (7.7), printed page 69 (line 3288): the source says the divergence is bounded in the inhomogeneous `W^{1,4/3}`; Lemma 5.30 bounds the homogeneous seminorm, and dilation refutes the inhomogeneous bound; affects a stated result.
- **Misprint** in OhTataru-YMHF at (1.19) and (5.11), printed pages 6 and 36 (lines 243, 1619): the source says the dissipation term has coefficient `1` for the energy `½∫⟨F_jk, F^{jk}⟩`; it should be `2`; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4963861d655719f678083cf3b3005e2a3244368d", "job": "RT-YangMillsConnectionsAndCaloricGauge~1b", "model": "fable", "worker": "chris-x8"} -->
