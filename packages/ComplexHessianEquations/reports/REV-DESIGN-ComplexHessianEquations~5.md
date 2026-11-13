<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13754#issuecomment-6849818912 -->
Review (claude) of b2c8cf4

Verdict: needs_changes

1. **F01** (P2) §3.1 plans the Levi form again, although the pinned Tau Ceti has it

   **Location.** `packages/ComplexHessianEquations/design/README.md:321`: "Define `i∂∂̄u` for `u ∈ C²(X)` chartwise … Prove that `i∂∂̄u` is independent of the holomorphic chart … Prove the second-order maximum lemma"; API bullets at lines 327–328; the Conventions at line 32; `design/plan.json` targets 3.1.2 and 3.1.3.

   **Claim.** The Hermitian form of `i∂∂̄u`, its chart independence, its sum, composition and pullback rules and its sign at a local maximum are targets of this roadmap, and the Tau Ceti contract (lines 57–64) lists everything the pin supplies.

   **Witness.** At the pin `2fd255d9…`:

   - `TauCeti/Analysis/Complex/LeviForm.lean:119`, `TauCeti.leviForm f x : V →ₗ⋆[ℂ] V →ₗ[ℂ] ℂ`, with `Re L(v, w) = (D²f(v, w) + D²f(Iv, Iw))/4` (line 128) and `Im L(v, w) = (D²f(Iv, w) − D²f(v, Iw))/4` (line 135).
   - `TauCeti/Geometry/Manifold/Complex/LeviForm.lean:106`, `TauCeti.manifoldLeviForm E f x`, on a complex manifold modelled on `𝓘(ℂ, E)`.
   - Chart independence: `TauCeti.leviForm_comp_symm_apply_of_mem_maximalAtlas` (same file, line 292).
   - Rules: `TauCeti.manifoldLeviForm_add` (172), `TauCeti.manifoldLeviForm_scalar_comp_apply` (206), `TauCeti.manifoldLeviForm_comp_apply` (241), `TauCeti.isSymm_manifoldLeviForm` (165).
   - Local maximum: `TauCeti.re_leviForm_nonpos_of_isLocalMax` (`Analysis/Complex/LeviForm.lean:150`) and `TauCeti.re_leviForm_mfderiv_nonpos_of_isLocalMax` (`TauCeti/Geometry/Manifold/Complex/MaximumPrinciple.lean:64`).
   - `TauCeti.leviForm_re_eq_zero` (270) and `TauCeti.leviForm_norm_sq` (`Analysis/Complex/QuadraticLeviForm.lean:187`).

   The two objects agree up to the factor `2`. With the README's `(i∂∂̄u)(v, w) = (1/2)(D²u(Jv, w) − D²u(v, Jw))` and `H_α(u, v) = α(u, Jv) + i·α(u, v)`:

       H_{i∂∂̄u}(v, w) = (1/2)(D²u(v, w) + D²u(Jv, Jw)) + (i/2)(D²u(Jv, w) − D²u(v, Jw)) = 2·L_u(v, w),

   both conjugate-linear in the first slot. On `|z|²`: `leviForm_norm_sq` gives `L = ⟨·,·⟩ = h`, so `H = 2h` and `λ = 2e`, the Conventions' witness. On `x_1²`: `Re L(e_1, e_1) = (2 + 0)/4 = 1/2`, so `H(e_1, e_1) = 1` and `Δ_ω(x_1²) = 1`, the §3.1 Check. The README and the plan never name `leviForm`.

   **Exact repair.**

   1. Add to "From Tau Ceti": "`TauCeti.leviForm` (`TauCeti/Analysis/Complex/LeviForm.lean`) and `TauCeti.manifoldLeviForm` (`TauCeti/Geometry/Manifold/Complex/LeviForm.lean`): the Levi form `L_u` of a real function on a complex normed space and on a complex manifold, conjugate-linear in the first slot, with `Re L_u(v, w) = (D²u(v, w) + D²u(Iv, Iw))/4` and `Im L_u(v, w) = (D²u(Iv, w) − D²u(v, Iw))/4`. Consumed for `C²` functions: Hermitian symmetry (`TauCeti.isSymm_manifoldLeviForm`), independence of the holomorphic chart (`TauCeti.leviForm_comp_symm_apply_of_mem_maximalAtlas`), the sum, composition and pullback rules (`TauCeti.manifoldLeviForm_add`, `TauCeti.manifoldLeviForm_scalar_comp_apply`, `TauCeti.manifoldLeviForm_comp_apply`), nonpositivity on the diagonal at a local maximum (`TauCeti.re_leviForm_nonpos_of_isLocalMax`, and `TauCeti.re_leviForm_mfderiv_nonpos_of_isLocalMax` in `TauCeti/Geometry/Manifold/Complex/MaximumPrinciple.lean`), `TauCeti.leviForm_re_eq_zero` and `TauCeti.leviForm_norm_sq`. Not included: the two-form `i∂∂̄u` as a continuous section, a non-strict plurisubharmonicity predicate (the pin has only `TauCeti.IsManifoldStrictlyPlurisubharmonicAt`), and the comparison with ComplexKahlerGeometry K2."
   2. In the Conventions (line 32) and §3.1 define `H_{i∂∂̄u}(x) = 2·L_u(x)` with `L_u = TauCeti.manifoldLeviForm`, and `(i∂∂̄u)(v, w) = Im H_{i∂∂̄u}(v, w)`; state the chart formula as its value, not as the definition.
   3. In §3.1 delete the two targets "independent of the holomorphic chart" and "second-order maximum lemma" and the API bullets for additivity, `γ ∘ u` and pullback; cite the declarations instead. Keep as targets: continuity of the section `x ↦ i∂∂̄u(x)` for `u ∈ C²`, vanishing on constants, agreement with K2 on smooth functions, and `Δ_ω`. Put the Tau Ceti names on the `*Needs:*` lines of §§3.1, 4.1 and 7.1 and in the Layer 3 Dependencies.
   4. In `plan.json`: target 3.1.2 gains the prerequisite `tauceti:TauCeti.manifoldLeviForm` and loses the api entries `iddbar_chart_independent`, `iddbar_add`, `iddbar_comp`, `iddbar_pullback`; target 3.1.3 is deleted and its consumers take `tauceti:TauCeti.re_leviForm_nonpos_of_isLocalMax`.
   5. Add the Check: "`TauCeti.leviForm_norm_sq` gives `L_{|z|²} = ⟨·,·⟩`, so `H_{i∂∂̄|z|²} = 2h` and `λ = 2e`; the definition `H = L`, without the factor `2`, would give `λ = e` and `Δ_ω|z|² = n` instead of `2n`."

   Tested on the instance: with `H = 2L`, `|z|²` gives `2e` and `x_1²` gives `(1, 0, …, 0)`, the values of the present Checks at lines 332–334; the saddle `x_1² − y_1² = Re z_1²` gives `0` by `leviForm_re_eq_zero`.

2. **F02** (P3) The superadditivity of the geometric mean is pinned, and cited to a source only

   **Location.** `packages/ComplexHessianEquations/design/README.md:268`: "The constant comes from the superadditivity `∏(x_j + y_j)^{1/n} ≥ ∏x_j^{1/n} + ∏y_j^{1/n}` for positive `x, y` (spruck2005 line 11314)."

   **Claim.** The route input has an owner.

   **Witness.** `TauCeti/Analysis/MeanInequalities.lean:68`, `Real.prod_rpow_add_prod_rpow_le_prod_add_rpow`: weights `w_i ≥ 0` with sum `1`, nonnegative `a, b`, `∏a_i^{w_i} + ∏b_i^{w_i} ≤ ∏(a_i + b_i)^{w_i}`. Target 2.4.4 of the plan lists no prerequisite for it.

   **Exact repair.** Replace the parenthesis by "(Tau Ceti `Real.prod_rpow_add_prod_rpow_le_prod_add_rpow` at weights `1/n`; spruck2005 line 11314)", add the declaration to the Tau Ceti contract, to the `*Needs:*` lines of §§2.3 and 2.4 (Lemma 2.12 of spruck2005 uses the same inequality) and to plan targets 2.3 and 2.4.4. In the first Check of §1.4 add that for `𝕜 = ℝ` the concavity of `det^{1/n}` is the pinned `LinearMap.concaveOn_det_rpow` (`TauCeti/Analysis/Matrix/MinkowskiDeterminant.lean:159`). Instance: `x = (1, 4)`, `y = (4, 1)`, `n = 2` gives `2 + 2 = 4 ≤ (5·5)^{1/2} = 5`.

3. **F03** (P3) §2.1 and §2.2 name each other in their `*Needs:*` lines

   **Location.** `packages/ComplexHessianEquations/design/README.md:207`: "*Needs:* Mathlib `MvPolynomial.esymm`, `Polynomial.card_roots_le_derivative`; §2.2 for the description of `Γ_l` used by Maclaurin." Line 225: "*Needs:* §2.1; §1.4 for the operator version."

   **Claim.** Each target needs only earlier ones.

   **Witness.** §2.2 uses §2.1's shift expansion, and §2.1 names §2.2. Maclaurin on `Γ_l` uses only `S_1, …, S_l > 0`, which is the definition of `Γ_l` in the Conventions (line 34), and Newton's inequalities. Plan target 2.1 has no prerequisite on 2.2.

   **Exact repair.** Delete "; §2.2 for the description of `Γ_l` used by Maclaurin" from line 207. In the last Check of the closure clause (line 214) replace "(§2.2)" by the computation "`σ_1 = 3 > 0`, `σ_2 = 0`". After the edit the README's edges among §§2.1–2.2 are those of the plan: 2.2 needs 2.1 only.

4. **F04** (P3) The locator of the first `L¹` bound covers the Kähler case only

   **Location.** `packages/ComplexHessianEquations/design/README.md:473`: "Let `X` be compact connected with a Hermitian metric `ω` and `ω̂` a continuous real (1,1)-form. Then there is `C` … (guedj-zeriahi2005 Proposition 1.7, line 255–274)."

   **Claim.** The source supports the statement as written.

   **Witness.** guedj-zeriahi2005 line 255–274 is a compactness statement for `ω`-plurisubharmonic functions on a compact Kähler manifold with `ω` closed, giving `sup φ − C_μ ≤ ∫ φ dμ`. The Hermitian metric and the continuous non-closed `ω̂` are the roadmap's own, proved by the stated route.

   **Exact repair.** Write the locator as "(guedj-zeriahi2005 Proposition 1.7, line 255–274, for a closed form on a compact Kähler manifold; the route below needs neither closedness nor the Kähler condition)", the wording §4.2 and §7.2 already use for their sources. Plan target 5.4.1 takes the same qualifier.

Four findings: one P2 and three P3; one blocking. All four round-4 findings are repaired, and the repaired statements hold on every instance I computed. The blocking finding is new: §3.1 plans a definition and four statements that the pinned Tau Ceti already has, which no earlier round found. The repair is local to the Tau Ceti contract, the Conventions, §3.1 and three plan targets; no section number moves. This is a design review: there is no `Suggested.lean`, and no Lean command was run.

## Previous findings and repairs

Quotations are from `packages/ComplexHessianEquations/design/README.md` unless `plan.json` is named.

| Round-4 finding | Repaired passage and what I recomputed | Status |
| --- | --- | --- |
| F01, symmetric cone and `Γ_n` | Line 223: "Such a cone contains `Γ_n` if and only if every coordinate vector `e_i` lies in its closure … Under this condition, `∂_i p > 0`". Half-space clause: the permutation average is `(σ_1(x)/n)e`, and `p(−se + te) = (t − s)^m p(e)` vanishes at `t = s ≥ 0`. Derivative route: `h = p(x + te_i)^{1/m}` concave on `t ≥ 0`, `h'(0) ≤ 0` forces `0 < p ≤ p(x)`, a bounded polynomial is constant, and then `σ_1 = σ_1(x) + t < 0` on the line. Two Checks at lines 245–246; `plan.json` 2.2.3 carries the equivalence. | Repaired |
| F02, Sobolev from the pin | Line 64: the Tau Ceti bullet; line 461: "it is `TauCeti.Manifold.exists_eLpNorm_le_mul_eLpNorm_mgradient_two_add` at real dimension `2n`". Opened at `TauCeti/Geometry/Manifold/Riemannian/Sobolev.lean:185`: `[CompactSpace M]`, `2 < finrank ℝ E`, every `ContMDiff I 𝓘(ℝ) 1` function, exponent `2m/(m − 2)`. "Yamabe" occurs in neither file. | Repaired |
| F03, Maclaurin's second owner | Line 17: "NumberFieldEnumeration §1.1 proves, for nonnegative reals, the case `S_k ≤ S_1^k` … it does not import NumberFieldEnumeration"; line 207: "By continuity they hold on the closure `Γ̄_l`". The open head still has the target at its README line 195. The dependency check shows no edge to NumberFieldEnumeration. | Repaired |
| F04, labels T1–T4 | Line 96 "the pointwise theory: Lewis's theorem …", 419 "the uniqueness theorem", 561 "Yau's theorem", 648 and 686 "the Guo–Phong–Tong estimate on …". A search of both files for `(T` followed by a digit returns nothing. | Repaired |

The repaired patterns were searched in the rest of the design. F02's pattern (a pinned declaration not consumed) recurs twice: R01 and R02. F01's pattern (a containment inferred from symmetry) does not recur: §1.4 and §2.4 assume `Γ_n ⊆ Γ`.

## Verified sound

### Principles and shape

- General library: Layers 1–2 over `RCLike 𝕜`, every hyperbolic polynomial of positive degree, every admissible pair; Layers 3–4 without a Kähler hypothesis; Yau's theorem in every dimension `n ≥ 1`. No route-specific shortcut, algorithm, copied passage, `set_option` or sorry'd data.
- Not a re-plan: no ComplexHessianEquations on main, at an open head (index of 2026-11-13) or among the three board packages listed; `scratch/overlaps.md` reports no second copy, no pull request changing this roadmap, no dropped id.
- Organisation: eight layers named by their mathematics; the order `C⁰`, `C²`, `C³` in Layer 6 is forced by the `*Needs:*` lines (6.3 needs 6.2, 6.4 needs 6.3). No sentence says the roadmap follows a source.
- Shape: every layer ends with Examples and Dependencies. Definitions with API and Checks: §1.1 (7 Checks), §1.2 (3), §1.3 (3), §2.2 (10), §2.4 (7), §3.1 (3), §3.3 (3), §3.4 (4). No LaTeX delimiters, pull-request numbers, dates, machine paths or HTML anchors. The README advertises no Lean name of its own.
- Plan: 48 targets; a walk of the `prerequisites` finds no forward edge and no cycle; every external prerequisite is a `mathlib:`, `tauceti:`, `roadmap:` or `gap:` entry. Baseline commits equal the pins.
- §6.5, note without change: `m = max(3, k + 1)` asks one derivative of `F` more than the bootstrap uses for `k ≥ 3` (`F ∈ C^{k,α}` suffices); the statement is true as written.
- K3Surfaces: settled in the round-3 repair report; §2.1 still exists at its open head (README line 528). Not re-raised.

### Adversarial table

Rows computed this round: the sampled targets, the headline theorems, the repaired passages and the targets of the findings. For text no repair touched, the round-4 rows with computed values (§§1.1, 2.3, 6.1, 6.6, 7.1, 8.2, 8.5) were relied on after I re-derived the ones marked "re-derived".

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| §1.4 gradient order | `g(t) = f(μ + t(e_j − e_i))`, concave, symmetric about `t = (μ_i − μ_j)/2`; `σ_2^{1/2}` at `(4, 1)` | `g'(0) = ∂_j f − ∂_i f ≥ 0`; `1/4 ≤ 1` | Holds |
| §1.4 concavity | lower trace bound with `∂_i f` increasing, `λ_i(T)` decreasing; `det^{1/2}` at `diag(4,1)`, `diag(1,4)` | `dF(S)(T − S) ≥ Σ∂_i f·(λ_i(T) − λ_i(S)) ≥ F(T) − F(S)`; `2, 2`, midpoint `5/2` | Holds |
| §1.4 convexity of `Sym_Γ` | rearrangement `min_σ⟨σy, μ⟩ = ⟨y↑, μ↓⟩`; non-convex cone | `diag(1, −0.4)`, `diag(1, 0.1)` in, midpoint `(1, −0.15)` out | Holds; convexity needed |
| §1.4 monotonicity | `f = −σ_1`, `diag(1,0) ≤ diag(2,0)`; `λ(S) = λ(T)` | `−1 > −2`; `tr(T − S) = 0` with `T − S ≥ 0` gives `S = T` | Holds |
| §1.5 determinant, Euler | `σ_2^{1/2}`, `T = diag(1, 4)`; `σ_2` | `∇F = diag(1, 1/4)`, `det = 1/4`, `tr(∇F·T) = 2 = F`; degree two gives `8 = 2·4` | Holds |
| §1.5 trace AM–GM | `A = diag(1,4)`, `B = Id`, `B = A⁻¹` | `5 ≥ 4`; `2 = 2`; equality iff `A^{1/2}BA^{1/2} = c·Id` | Holds |
| §2.1 identities | `n = 3`, `k = 2`, `λ = e`, `t = 1`; `k = 0` | `12 = 3 + 6 + 3`; `Σσ_{0;i} = 3 = (3 − 0)·1` | Holds |
| §2.1 Newton, Maclaurin, closure | `(1,2,3)`; `(1,0,0)`; `(1,1,0)`; `(2,2,−1)`; `−e` | `12 ≤ 121/9`; `2 ≥ 1.915 ≥ 1.817`; `1/3 ≥ 0 ≥ 0`; `2/3 ≥ 0.577 ≥ 0`; `σ = (3, 0)`, `1 ≥ 0`; `−1 < 1` off the cone | Holds |
| §2.1 generalized form | `(3,2,2,1)`, `(3,1,2,0)`, `(2,0,2,1)` at `(1,2,3)` | `18/11 ≤ 11/6`; `1.732 ≤ 1.915`; `1.915 > 1.833` when `l > s` | Holds |
| §2.2 repaired equivalence | `p_c = (x_1+x_2)² − c(x_1−x_2)²`, `c = 1/4, 1, 19` | cone `x_1 + x_2 > √c·|x_1 − x_2|`; `e_1` in the closure iff `√c ≤ 1`; `Γ_2 ⊆` cone iff `c ≤ 1`; `p_19/20 = 2xy − 0.9(x² + y²)`; sector `0.627 < x_2/x_1 < 1.595` | Holds in both directions |
| §2.2 derivative clause | `p_{1/4}`; `p_19/20` at `(1, 0.7)`; `m = 1`, `p = σ_1` | `∂_1 p = 2(x_1+x_2) − (x_1−x_2)/2 > x_1 + x_2`; `p = 0.059`, `∂_x p = −0.4`; `h' = 1`, case never arises | Holds; condition needed |
| §2.2 `Γ(σ_k, e) = Γ_k` | `D_e^j σ_n = j!·σ_{n−j}`; `(3,3,−1)`; `−e` | `σ = (5, 3, −9)` in `Γ_2 \ Γ_3`; `σ_2(−e) = 3`, `σ_1 = −3` | Holds |
| §2.4 Lemma 4 (re-derived) | `μ_i = (∏∂_j f)^{1/n}/∂_i f` | `n(∏∂_j f)^{1/n} ≥ f(μ) ≥ nγ^{1/n}` | Holds |
| §2.5 Hessian constant | `n = 3`, `k = 2` at `e`; general | `∂_j = 3^{−1/2} = binom(3,2)^{1/2}/3`; `(1/k)binom(n,k)^{1/k−1}binom(n−1,k−1) = binom(n,k)^{1/k}/n` | Holds, sharp |
| §2.5 quotient pairs | `n = 2`, `(ε, 1)`; `n = 3`, `(M, 1, 1)`; plus `cσ_1` | `ε²/(1+ε)⁴ → 0`; `∂_1 = 3/(M+2)²`, `∂_2 = (M²+M+1)/(M+2)²`; bound `(c·3/3)³ = c³` | Holds |
| §3.1 `i∂∂̄` and `H` (R01) | `x_1²`, `|z|²`, `Re z_1²` against `TauCeti.leviForm` | `(i∂∂̄x_1²)(∂_x, ∂_y) = 1`; `H = 2L`: `Re L(e_1,e_1) = 1/2`, `L_{|z|²} = h`, `L_{Re z_1²} = 0` | Duplicate: R01 |
| §3.2 identities | `n = 2`, `λ = (4, 1)`; `k = 1` | `α∧ω = (5/2)ω²`, `α² = 4ω²`; `S_1 = 5/2 ≥ S_2^{1/2} = 2` | Holds |
| §3.3 constants | `χ = ω`, `F = 0`; `ℂP¹`, `χ = 2ω`; Hessian form | `c = 1`, `binom(n,k)^{1/k}`, `n`; `c = 2`; `χ_φ^k∧ω^{n−k} = binom⁻¹c^ke^{kF}ω^n` | Holds |
| §3.4 | `χ = ω_X`; `F = a`; `q ≤ p` | `c_t^n/V_t = (1+t)^n/((1+t)^nV)`; `e^{na} ≤ e^{na}|a|^p + e^n`; `|F|^q ≤ 1 + |F|^p` | Holds |
| §4.1–4.2 | wedge cone with `f = σ_1`, `10σ_1`; two components; `φ + 1` | `f(1, −0.4) = 6 > f(1.01, 0.1) = 1.11`; `(0, 0)` and `(0, −1)`; same `c` | Holds; hypotheses needed |
| §5.1 | `ω = e^ρω_0` on `ℂ²`, `ρ = u = x_1` | `Δ_g u = e^{−ρ}(Δ_0u + ⟨∇ρ, ∇u⟩)` at `m = 4`; difference `−e^{−x_1}` | Holds |
| §5.2 | `cos 2πx`; constant `1`; `j^{−α}sin jx` | `Δ_ω⁻¹ = −cos/(2π²)`; mean `1`; quotient `(2/π)^α` at distance `π/(2j)` | Holds |
| §5.3 | `n = 1, 2, 3` | `2 < 2` false; `8/2 = 4 = 2n/(n−1)`; `12/4 = 3` | Holds for `n ≥ 2` |
| §5.4 | chart identity; `ψ_ε` on `ℂP¹` | `∂_i(√g g^{ij}∂_j u) = 2√gΔ_ω u ≤ 2A√g`; `ω' + i∂∂̄ψ_ε = i∂∂̄log(|z|² + ε) ≥ 0`, `sup = 0` at `∞` | Holds |
| §6.2 torus | `ε = 1/(4π²)` | `i∂∂̄φ = −2π²ε cos·dx_1∧dy_1`; `λ = (1, 1/2)` at `0`, `(3/2, 1)` at `1/2`; `∫q = 1` | Holds |
| §6.3 `C²` estimate | `A = C_1 + Λ + 1`; `λ = (4, 1/4)` | `Δ'(log tr h − Aφ) ≥ tr h⁻¹ − An − C_2`; `tr h ≤ (tr h⁻¹)^{n−1}e^F`; `4/17 ≤ 17/4` | Holds; dependence as stated |
| §6.4 `C³` estimate | `ω_φ = ω`; torus of §6.2 | `S = 0`; `∂_{z_1}h_{11} = 2π³ε sin` , `S = O(ε²)` | Holds |
| §6.6 Yau | `F = a`; `n = 1`, `F = ε cos 2πx`; admissible-pair form | `b = −a`; `∫_0^1 e^{ε cos} = I_0(ε)`; `e^b = ∫χ^n/V = c^n` | Holds |
| §7.1 one variable (re-derived) | Green function bound; `α ≤ α_1` | `|R'² − tw̄| ≤ 2R'²`; `αM/2π ≤ 1`; `∫_{D(w,2R')}(2R'/|t−w|)^β = 2π(2R')²/(2−β)` | Holds |
| §7.1 local | radii; polar formula at `g = 1`; `u_ε` in `ℝ⁴` | `1/4 + 7/4 = 2`; `vol(S)ρ^{2n}/(2n)`; `Δ = (r² + 4ε)(r² + ε)^{−5/2}`, radial eigenvalue `(1/4)(2ε − r²)(…)^{−5/2}` | Holds |
| §7.2 global | `u = ψ + A|z|² − sup ψ − 4A` on `B(0, 2)`; `ℂP¹` | `u ≤ 0`, `∫(−u) ≤ ∫(sup ψ − ψ) + 4A·vol`; `∫|z|^{−2α}` finite iff `α < 1` | Holds |
| §8.1 | `φ_t ≡ 0`; `s = −inf φ_t`; maximum-point step | `Ω_s = ∅`; `0/0` excluded; `det G ≥ γf^{−n}`, `tr(G·h) = 1`, `G·ω_t ≥ 0` uses `χ ≥ 0` | Holds |
| §8.2 (re-derived) | `s_{j+1} − s_j < 2B_0φ(s_j)^{δ_0} ≤ 2^{−jδ_0}`; `s_0 = 0` | sum `1/(1 − 2^{−δ_0})`; right-continuity covers the endpoint | Holds |
| §8.3 | `s_0 = (2B_0)^{1/δ_0}Ē`; exponent | strict sublevel: `s·Φ(s) < E` unless `Φ(s) = 0`; `(1 + n)/(qn) = 1 + (p − n)/(pn)` | Holds |
| §8.4 | Jensen for `V⁻¹e^{nF}ω_X^n`; `χ = ω_X`, `F_t = 0` | `αE_t ≤ log(C/V) + n·Ent_1`; `c_t^n = (1+t)^n`, `V_t = (1+t)^nV` | Holds |
| §8.5 Check | `q = 1 − 0.03cos`, `n = 3` | `mean(q log q)/3 ≈ 0.03²/12 = 7.5·10⁻⁵`; `Ent_3 ≈ 0.03³·(4/3π)/27 = 4.24·10⁻⁷` | Holds |
| §8.6 | `χ = 0`, `t = 1`; `p' = n`, `N = 1` | `c_1 = 1`, `V_1 = V`; `Ent_n ≤ 1 + Ent_p` | Holds |
| §8.7 | `n = 2`, `k = 1`; background `a_0ω_X` | `q' < 2`, `q > 2`; `λ_{a_0ω_X} = a_0⁻¹λ_{ω_X}`, cone invariant | Holds |

### Source sample

The author flagged no locator as unverified. All fifteen seeded sections were read at their locators.

| Section | What I read |
| --- | --- |
| 1.4 | spruck2005 line 11066–11100: Theorem 1.4, Lemma 1.5 and the concavity proof with the ordered gradient. Supported; the convexity of `Sym_Γ` is the roadmap's route. |
| 1.5 | gpt2023 line 241–260: `det G ≥ γ/f^n`, the Euler identity (249–250), the arithmetic–geometric step (255, 260). Supported. |
| 2.1 | spruck2005 line 11257–11293 (Lemma 2.6, Proposition 2.7, Corollary 2.8, Lemma 2.10 with `r ≥ k`, `s ≥ l`); dinew-kolodziej2014 line 152–159. Supported. |
| 2.2 | spruck2005 line 11182–11235 (Definition 2.1, Theorem 2.2, Proposition 2.3, Corollary 2.4); dinew-kolodziej2014 line 139–172. Supported; the README corrects Corollary 2.4. |
| 2.5 | gpt2023 line 90–93 and 770–776; guo-phong2024 line 76–104 (conditions (1)–(4), intersections and positive combinations). Supported. |
| 3.1 | gpt2023 line 62–66; szekelyhidi2018 line 17–24. Supported. |
| 5.2 | No readable source is cited beyond the supplier sections, which resolve; gilbarg-trudinger2001 Theorem 6.2 is uncertified. PDE §5.6 (E25) on main states the scaled interior estimate the contract quotes. |
| 5.4 | guedj-zeriahi2005 line 255–274 (Kähler case only: R04); gpt2023 line 689–692 (Green's formula, `n + Δφ > 0`, `sup φ = 0`). |
| 6.3 | pss2012 line 981–990 (Theorem 8), 994–1031 ((6.2)–(6.10)), 837–840 ((5.4)). Supported. |
| 6.4 | pss2012 line 1067–1081 ((7.5)–(7.7), Theorem 9); twwy2015 line 132–136. Supported. |
| 7.2 | pss2012 line 2943–2955 (Theorem 31, the `L^p` consequence); gpt2023 line 280–289. Supported; the README states that no Kähler hypothesis is needed and gives the route. |
| 8.1 | gpt2023 line 197–302 (Lemma 1, `τ_k`, (2.3)–(2.11)). Supported; constants depend on `n, ω_X, χ, γ` as stated. |
| 8.4 | gpt2023 line 785–850 (Lemmas 5–6, Theorem 4). Supported. |
| 8.6 | gpt2023 line 84–89 (Theorem 1), 442–457 ((3.1)–(3.3)). Supported; the README avoids the Hölder exponent `n/(n−1)` at `n = 1`. |
| 8.7 | gpt2023 line 861–952 (Lemmas 7–8, Theorem 5). Supported. |

Also read for the repairs: gpt2023 line 303–441 (Theorem 2's proof, Lemma 2), 713–736 (Theorem 3(c)), 744–776 (Lemma 4); pss2012 line 243–304.

### Pins, duplication and suppliers

- Pins: the checkouts are at Mathlib `1b1ccf4b…` and Tau Ceti `2fd255d9…`, the commits of README lines 43 and 55.
- Declarations opened at the pins, all present: Tau Ceti `CourantFischer.lean:251, 363, 440, 479`; `HoffmanWielandt/Basic.lean:78`; `KyFan.lean:99, 489`; `Harmonic/MeanValue/Basic.lean:464`; `Riemannian/Sobolev.lean:185`; `TwoForm/Basic.lean:37`; `Symplectic/Manifold/TwoForm.lean:174, 202, 231`; `VolumeDensity/Volume.lean:82`; `DifferentialForm/Smooth.lean:479`; `Analysis/PDE/Regularity/Harnack.lean:284`. Mathlib `InnerProductSpace/Spectrum.lean:277, 297, 309, 314, 384`; `Matrix/Spectrum.lean:67, 143, 193, 240`; `LocalExtr/Polynomial.lean:64`; `MeanInequalities.lean:129`; `InverseFunctionTheorem/FDeriv.lean:118`; `Convex/Integral.lean:196`; `UniformSpace/Ascoli.lean:474`; `Symmetric/Defs.lean:69, 202`. `HasStrictFDerivAt.implicitFunction` is in the `FiniteDimensional` section of `Calculus/Implicit.lean` (line 450–465), as line 48 says.
- By object at the pins: no Newton or Maclaurin inequality for `esymm`, no hyperbolic polynomial, no derivative of eigenvalue functions. Found and reported: the Levi form (R01), the superadditivity of the geometric mean and Minkowski's determinant inequality (R02). The pinned strong maximum principle (`Laplacian/StrongMaximumPrinciple.lean`) has identity principal part; §4.2 needs variable coefficients and cites PDE §3.2 (C13), which plans exactly that (main, README line 1356–1361).
- Supplier sections on main: PDE §3.2 (C13) line 1344, §5.4 (E23) line 1965, §5.6 (E25) line 2097; PseudodifferentialOperators §5.4 line 1337, §6.2 line 1523; ComplexKahlerGeometry K1 line 370, K2 line 558, K4 line 1091 (Chern connections line 1134), K5a lines 1440–1948 (Laplace-type theory line 1948), K6.0 line 2321; DifferentialGeometry Layers 0, 1, 5, 12 at lines 691, 862, 1644, 2796, with `integralTopForm_mextDeriv_eq_zero` (line 451) and `integral_mul_laplaceBeltrami` (line 432); ComplexManifolds Milestones 1–2 lines 172, 197; OptimalTransport Layer 6 line 2421; OperatorTheory PD-A51, PA-B32, MAJ-A27. Open heads: ComplexComparisonPartII C5.4, K3Surfaces §2.1, NumberFieldEnumeration §1.1 exist.
- Declared gap `gap:weak-harnack-supersolutions`: same slug in the README (lines 92, 476, 490, 675, 702, 716) and in the plan's `gaps`; supplier PDE §5.4 (E23). Precise and minimal: the pin and E23 have the homogeneous case only. Not a finding.
- Manifest: 19 entries, one per cited work; the References list the same 19 works.

Overlap check: read PDE, ComplexKahlerGeometry, MinimalSurfaces, RiemannianGeometry (open); PDE, Yamabe, RicciFlow (main); the third list is empty. Shared objects: the Levi form of a `C²` function, owned by the pinned Tau Ceti (R01); Maclaurin's inequality, shared with NumberFieldEnumeration §1.1 and settled in the Scope paragraph; nothing else.

Dependency check, run on the candidate (exit 0):

```text
candidate: ComplexHessianEquations is not in the merge order yet; checked as if placed after ComplexComparisonPartII (the intake inserts it when its design is accepted)
depcheck: 206 roadmaps, 1898 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

### Headline theorems and padding

Headlines from the Summary: Lewis's derivative theorem and spectral concavity (§§1.3–1.4); Gårding's theorem and Hessian-quotient concavity with the structural constants (§§2.2–2.5); uniqueness (§4.2); Yau's theorem (§6.6); uniform exponential integrability (§7.2); the Guo–Phong–Tong estimates (§§8.3, 8.6, 8.7). Elaboration: not available (this lane does not elaborate). There is no `Suggested.lean` at the design stage, so there is nothing to probe for padding and no signature to compare.

### Maintainer notes

None were left for this roadmap.

## Not verifiable

- The eight uncertified works (`cns1985`, `kolodziej1998`, `gilbarg-trudinger2001`, `yau1978`, `szekelyhidi2014`, `ckns1985`, `tian1987`, `hormander1990`) are settled and were not requested; their locators are unread. This covers the contracts quoted from gilbarg-trudinger2001 (Theorems 3.5, 6.2, 8.18, 9.1, Lemma 17.16).
- Displayed formulas of spruck2005 are partly garbled by OCR (Corollary 2.8, Lemma 2.10, Lemma 2.12); the hypotheses were legible and the inequalities were recomputed.
- Lean elaboration, the one-tactic probe and `#check` comparison: no Lean file exists and this lane does not elaborate. The pinned declarations were read, not elaborated.
- Open pull requests were read through `roadmaps grep` and `roadmaps show` at the indexed heads; a head that moved after the index of 2026-11-13 was not seen. The four open roadmaps of the closest list were compared by scope, not target by target.

## Source issues

- **Error** in spruck2005 at Corollary 2.4, printed p.289: the source says the cone of every symmetric polynomial hyperbolic in `(1, …, 1)` contains the positive cone and has positive partial derivatives; it should assume the coordinate vectors lie in the closed cone, as `2xy − 0.9(x² + y²)` shows; affects a stated result.
- **Error** in spruck2005 at Proposition 2.7, printed p.290: the source says equality in Newton's inequality forces equal coordinates for every real tuple; it should restrict the equality clause to positive tuples, since `(1, 0, 0)` gives equality; affects a stated result.
- **Error** in gpt2023 at the examples after Lemma 4, arXiv v1 p.17: the source places the quotient plus `cσ_p^{1/p}` on `Γ_k` for every `p`; it should use `Γ_{max(k,p)}`, where `σ_p` is positive; affects a stated result.
- **Misprint** in gpt2023 at the examples after Lemma 4, arXiv v1 p.17: the source allows `k = ℓ` in the exponent `1/(k − ℓ)`; it should require `ℓ < k`; affects a stated result.
- **Gap** in gpt2023 at the proof of Theorem 2, arXiv v1 p.9: the source calls the closed-sublevel mass function continuous; it should use strict sublevels, which give right-continuity when a level set has positive measure; affects the proof.
- **Gap** in gpt2023 at Lemma 1, arXiv v1 p.5: the source states the estimate for every `s > 0`; it should require `inf φ_t < −s`, since otherwise the normalizing energy `A_s` is zero; affects a stated result.
- **Gap** in gpt2023 at the proof of Theorem 3(c), arXiv v1 p.16: the source bounds the signed moment of `F` by the entropy alone; it should add a constant, since `|F| ≤ 1 + |F|^p` is what holds; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b2c8cf4c5499914bb4ea04032421b9be60d6cc9e", "job": "REV-DESIGN-ComplexHessianEquations~5", "model": "fable", "worker": "chris-x52"} -->
