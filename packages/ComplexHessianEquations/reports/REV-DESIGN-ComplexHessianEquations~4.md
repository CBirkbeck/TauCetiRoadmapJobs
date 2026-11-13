<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13754#issuecomment-6849125776 -->
Review (claude) of 489bcbf

Verdict: needs_changes

1. **F01** (P1) A symmetric hyperbolic polynomial's cone need not contain `Γ_n`

   **Location.** `packages/ComplexHessianEquations/design/README.md:223`: "For symmetric `p` of degree `m ≥ 1` hyperbolic in `e`, the cone contains `Γ_n` and lies in the half-space `σ_1 > 0`". Also `packages/ComplexHessianEquations/design/plan.json:573`.

   **Claim.** `Γ_n ⊆ Γ(p, e)` for every symmetric `p` hyperbolic in `e`.

   **Witness.** `p = 2xy − 0.9(x² + y²)` on `ℝ²`: `p(e) = 0.2`, `p(x + te) = 0.2t² + 0.2(x + y)t + p(x)`, discriminant `0.76(x − y)² ≥ 0`. But `p(1, 0.1) = −0.709`, so `(1, 0.1) ∈ Γ_2 \ Γ(p, e)`.

   At `(1, 0.1)` the roots in `t` are `1.41` and `−2.51`, one of them positive. The cone is `{x + y > 0, 2xy > 0.9(x² + y²)}`, a sector around the diagonal with `0.627 < y/x < 1.595`. The claim is taken from spruck2005 Corollary 2.4(i) (line 11225–11228), which is false as stated; its part (ii) fails on the same example (`∂_x p(1, 0.7) = −0.4` at a point of the cone, where `p = 0.059` and both roots are negative). The half-space clause is true: the permutation average `(σ_1(λ)/n)·e` of a point of the convex symmetric cone lies in the cone, and neither `0` nor `−e` does.

   Nothing downstream uses the false clause. `Γ_n ⊆ Γ_k ⊆ Γ_1` at line 225 follows from the definition of `Γ_k`, and `∂_iσ_k > 0` on `Γ_k` is a separate statement.

   **Exact repair.** In both files replace the sentence by: "For symmetric `p` of degree `m ≥ 1` hyperbolic in `e`, the cone `Γ(p, e)` is symmetric and lies in the half-space `σ_1 > 0`. It contains `Γ_n` if and only if every coordinate vector `e_i` lies in its closure; this is a hypothesis, not a consequence. Under it, `∂_i p > 0` on `Γ(p, e)` (spruck2005 Corollary 2.4, line 11225–11235, which omits the hypothesis)." Route for the last clause: for `x` in the cone, `t ↦ p(x + te_i)` is a limit of real-rooted polynomials, positive for `t ≥ 0`, so it is either real-rooted with negative roots, giving a positive derivative at `0`, or constant, which would keep the whole line in the cone although `σ_1 → −∞` on it. Add the witness as a Check of §2.2 and as a plan test: `p = 2xy − 0.9(x² + y²)` is symmetric and hyperbolic in `e`, `(1, 0.1) ∈ Γ_2` is outside its cone, and `∂_x p(1, 0.7) < 0` inside it. On the witness the repaired statement holds: `e_1 = (1, 0)` has `p = −0.9` and is not in the closure, so neither side of the equivalence holds. For `σ_k` the hypothesis holds, since `Γ_n ⊆ Γ_k` by definition, and the repaired clause gives `σ_{k−1;i} > 0` on `Γ_k`, the API bullet at line 233.

2. **F02** (P2) The Sobolev inequality is taken from a roadmap although the pinned Tau Ceti declares it

   **Location.** `packages/ComplexHessianEquations/design/README.md:84–86`: "Y1.1: the closed-manifold Sobolev inequality `‖u‖_{L^{2m/(m−2)}} ≤ C(‖du‖_{L²} + ‖u‖_{L²})`"; also lines 21, 459 and 488, and `plan.json:1457,2271–2275`.

   **Claim.** The inequality is supplied by Yamabe Y1.1 and by nothing at the pins.

   **Witness.** `TauCeti/Geometry/Manifold/Riemannian/Sobolev.lean:185`, `TauCeti.Manifold.exists_eLpNorm_le_mul_eLpNorm_mgradient_two_add`: compact boundaryless, `2 < finrank ℝ E`, every `C¹` function, exponent `2n/(n − 2)`, measure `riemannianVolume`.

   The only consumer is the Moser iteration of §6.2, which applies the inequality to powers of the smooth positive function `sup φ − φ + 1`; these are `C¹`, so the pinned statement suffices and the `H¹` extension that Yamabe plans is not needed. Second ground, from `scratch/overlaps.md`, checked at the head: the open revision of Yamabe (pull request 2248) turns item 1 of "Y1. Closed-manifold analytic interfaces" (main, `TauCetiRoadmap/Yamabe/README.md:113`) into a subsection "1.1 Sobolev carriers" under "Y1", which itself consumes this pinned declaration "and extend[s] it to H¹". The citation "Yamabe Y1.1" is therefore both a supplier citation of an id a revision restructures and a detour around a declaration at the pin.

   **Exact repair.** Delete the subsection "From TauCetiRoadmap.Yamabe" and the word "Yamabe" at lines 21, 459 and 488. Add to "From Tau Ceti": "`TauCeti.Manifold.exists_eLpNorm_le_mul_eLpNorm_mgradient_two_add` (`TauCeti/Geometry/Manifold/Riemannian/Sobolev.lean`): on a compact boundaryless manifold of real dimension `m > 2` with a continuous Riemannian metric, `‖u‖_{L^{2m/(m−2)}} ≤ C(‖∇u‖_{L²} + ‖u‖_{L²})` for every `C¹` function `u`, norms for `TauCeti.riemannianVolume`. It is applied at `m = 2n`, `n ≥ 2`, to `C¹` functions only." In §5.3 write "Record the Sobolev inequality … for `C¹` functions (Tau Ceti `…_two_add`)", and put the declaration in the `*Needs:*` lines of §5.3 and §6.2 and in the Layer 5 Dependencies. In `plan.json` replace `roadmap:Yamabe Y1.1` by the declaration and delete the Yamabe supplier entry. Tested on the instance: at `n = 2` the hypothesis reads `2 < 4` and the exponent is `2·4/(4 − 2) = 4`, the value of the §5.3 Check; at `n = 1` it reads `2 < 2`, false, in agreement with §6.2's exclusion of `n = 1`. The dependency check then has one supplier fewer and no new edge.

3. **F03** (P2) Maclaurin's inequality has a second owner at an open head

   **Location.** `packages/ComplexHessianEquations/design/README.md:15`: "No roadmap on the content repository and no board package owns any of these objects"; §2.1, line 208, the Maclaurin inequalities.

   **Claim.** The Scope section accounts for every other owner of the objects of Layer 2.

   **Witness.** NumberFieldEnumeration (open pull request 1718), `TauCetiRoadmap/NumberFieldEnumeration/README.md:194`: "Prove Maclaurin's bound for a multiset of `n > 0` nonnegative reals and `0 ≤ k ≤ n`: `e_k(x) / C(n,k) ≤ (e_1(x)/n)^k`".

   That target is the case `S_k^{1/k} ≤ S_1` of §2.1, on the closed orthant. The round-4 repair report names the overlap under "For the maintainer" and leaves it unsettled; the README says nothing. Neither roadmap is in the merge order and neither supplies the other, so nothing here can be repointed; what this package can do is make §2.1 the general statement and say how the two differ.

   **Exact repair.** (i) In Scope and ownership add: "NumberFieldEnumeration §1.1 proves the case `S_k ≤ S_1^k` of Maclaurin's inequality for nonnegative reals, by a smoothing argument on the simplex. Section 2.1 differs in comparing every pair `1 ≤ k ≤ l` on the cone `Γ_l`, which contains vectors with negative entries, and in the Newton and generalized forms; it does not import NumberFieldEnumeration." (ii) In §2.1 and plan target 2.1 add the closed-orthant form, so that §2.1 contains the other statement: "for `λ` with all `λ_i ≥ 0` and `1 ≤ k ≤ l ≤ n`, `S_k^{1/k} ≥ S_l^{1/l}`, by continuity from `Γ_n`". Check on the boundary instance: `λ = (1, 0, 0)` gives `S_1 = 1/3 ≥ S_2^{1/2} = 0 ≥ S_3^{1/3} = 0`; `λ = (1, 1, 0)` gives `2/3 ≥ (1/3)^{1/2} ≈ 0.577 ≥ 0`. For the maintainer: once both are accepted, NumberFieldEnumeration §1.1 should cite §2.1 rather than prove its case again.

4. **F04** (P3) The labels T1–T4 are never defined

   **Location.** `packages/ComplexHessianEquations/design/README.md:97`: "together they deliver the pointwise half of the target (T1)"; also lines 417 "Prove (T2)", 559 "Prove (T3, the Kähler case)", 646 and 684 "Prove (T4, …)".

   **Claim.** Every term is standard or defined where it first appears.

   **Witness.** The four labels occur six times and are defined nowhere in the README; they are the labels of `packages/ComplexHessianEquations/target.md` (line 27, "**(T1) The spectral function.**"), a file the roadmap does not include.

   **Exact repair.** Delete the six parenthetical labels and name the theorems instead: "the spectral-function theorem", "the uniqueness theorem", "Yau's theorem", "the Guo–Phong–Tong estimate". After the edit, a search of the README for `(T` followed by a digit returns nothing.

Four findings: one P1, two P2, one P3; three blocking. All seven round-3 findings are repaired. The design is repairable with local edits; no section number or target id needs to move. This is a design review: there is no `Suggested.lean`, and no Lean command was run.

## Previous findings and repairs

Quotations are from `packages/ComplexHessianEquations/design/README.md` unless `plan.json` is named.

| Round-3 finding | Repaired passage and what I recomputed | Status |
| --- | --- | --- |
| R01, uniform degree `−1` | Line 506: "each identity is homogeneous, of one of three degrees"; line 515: "the value `32π⁴` becomes `8π⁴`". Recomputed on the torus with `g = 1/2`: `S'' (0) = q''²/q³`, `Δ_{ω_φ}S = 8π⁴a²/(1 − a)⁴ = 32π⁴` at `a = 1/2`; doubled metrics give a quarter. `plan.json:1558,1583` match. | Repaired |
| R02, signed entropy moment | Line 673: "`∫ F dμ ≤ Ent_1(F) ≤ 1 + Ent_{p'}(F)` for `p' ≥ 1` (§3.4), not by `Ent_{p'}(F)` itself"; negative control at line 680; `plan.json:2117`. `|F| ≤ 1 + |F|^{p'}` holds for `p' ≥ 1` and fails at `p' = 1/2`, `F = 4` (`4 ≤ 3`). | Repaired |
| R03, weak-Harnack contract | Line 93: "`q` finite, `q ≥ 1` and `q > m/2` … `ess inf_{B_r} u`"; the plan's `detail` and `needs` carry the same hypotheses. The test-function form has the right sign: `div(a∇u) ≤ f` is `∫ a∇u·∇v ≥ −∫ f v` for `v ≥ 0`. | Repaired |
| R04, generalized Newton–Maclaurin | Line 208: "for integers `0 ≤ s < r ≤ n` and `0 ≤ l < k ≤ r` with `l ≤ s`, and `λ ∈ Γ_r`"; `plan.json:363`. Chord-slope route checked: slope over `[l, k]` ≥ slope over `[l, r]` ≥ slope over `[s, r]`. | Repaired |
| R05, `isHyperbolic_sigma` guard | `plan.json:453`: "for 1 ≤ k ≤ n, σ_k is hyperbolic in e"; README line 241 has the out-of-range Check. | Repaired |
| R06, sorted torus vector | Line 524: "`λ[ω_φ] = (max(q, 1), min(q, 1))`"; `(1, 1/2)` at `x_1 = 0`, `(3/2, 1)` at `x_1 = 1/2`. | Repaired |
| R07, admissible-cone API and Checks | Lines 272–274 (three API bullets) and 284–287 (four cone Checks); `plan.json:675,1314` say "non-convex cone of 1.4" with increment `(0.01, 0.25)`. | Repaired |

Adversarial pass on the repaired text: the new statements hold on the instances in the table below. The repaired patterns were searched in the rest of the design; the one new false statement (R01) is in text no repair touched and no earlier table row tested.

## Verified sound

### Principles and shape

- General library: Layers 1–2 are stated over `RCLike 𝕜`, for every hyperbolic polynomial of positive degree and every admissible pair; Layers 3–4 need no Kähler hypothesis; Layer 6 holds in every dimension `n ≥ 1`. No route-specific shortcut, no algorithm, no copied passage, no `set_option`, no sorry'd data (there is no Lean file).
- Not a re-plan: the supplied indexes list no ComplexHessianEquations on main, at an open head or among the nine board packages. `scratch/overlaps.md` reports no second copy and no pull request changing this roadmap.
- Organisation: eight layers named by their mathematics. The order `C⁰`, `C²`, `C³` in Layer 6 is forced (§6.3 needs §6.2, §6.4 needs §6.3, §6.5 needs all three). No sentence says the roadmap follows a source.
- Shape: every layer ends with Examples and Dependencies; the definitions of §§1.1, 1.3, 2.2, 2.4, 3.1, 3.3 and 3.4 have API bullets and three to eight Checks; every theorem has a locator or a stated route. No LaTeX delimiters, pull-request numbers, dates, machine paths or HTML anchors (searched). The README advertises no Lean name of its own; `roadmaps resolve` found no citation and no name that resolves nowhere.
- K3Surfaces: settled in the round-3 repair report as not actionable in this package; the scope paragraph (line 15) and the consumer entry (line 718) state the relation, and §2.1 of K3Surfaces still exists at its open head. Not re-raised.

### Adversarial table

Sampled targets, headline theorems and the targets the findings touch. Rows of the round-3 table that carry computed values were relied on for untouched text; the rows below were computed afresh.

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| §1.1 relative eigenvalues | Gram `diag(2, 1)`, form `diag(2, 3)`; `−a` | `g⁻¹a = diag(1, 3)`, `λ = (3, 1)`; Euclidean `(3, 2)`; `λ[−a] = (−1, −3)` | Holds |
| §1.1 `det(Id + tA)` | `A = diag(1, 2, 3)` | `1 + 6t + 11t² + 6t³`; `σ = (6, 11, 6)` | Holds |
| §1.4 concavity route, gradient order | `σ_2^{1/2}` at `(4, 1)` | `∂_1 = 1/4 ≤ ∂_2 = 1`; lower trace bound pairs increasing with decreasing | Holds |
| §1.4 monotonicity under `Γ + Γ_n ⊆ Γ` | `μ + d = (μ − εe) + (d + εe)`; `f = −σ_1`, `S = diag(1, 0) ≤ T = diag(2, 0)` | closure step valid by openness; `−1 > −2` without ellipticity | Holds |
| §2.1 identities | `n = 3`, `k = 2`, `λ = e`, `t = 1`; `k = 0` | shift `12 = 3 + 6 + 3`; `Σ_i σ_{0;i} = n = (n − 0)σ_0` | Holds |
| §2.1 Newton, Maclaurin | `(1, 2, 3)`; `(1, 0, 0)`; `−e` | `12 ≤ 121/9`; `2 ≥ 1.915 ≥ 1.817`; `0 = 0` off `Γ_n`; `S_1 = −1 < 1` off the cone | Holds |
| §2.1 generalized form | `(1, 2, 3)`: `(3,2,2,1)`, `(3,1,2,0)`; `(2,0,2,1)` | `18/11 ≤ 11/6`; `1.732 ≤ 1.915`; `1.915 > 1.833` when `l > s` | Holds |
| §2.1 closed orthant (R03) | `(1, 0, 0)`, `(1, 1, 0)` | `1/3 ≥ 0 ≥ 0`; `2/3 ≥ 0.577 ≥ 0` | Add |
| §2.2 symmetric cone contains `Γ_n` | `p = 2xy − 0.9(x² + y²)` | `p(e) = 0.2`; discriminant `0.76(x − y)²`; `p(1, 0.1) = −0.709`; roots `1.41`, `−2.51` | False: R01 |
| §2.2 repaired clause | same `p`; `σ_k` | `p(e_1) = −0.9`, so `e_1` is outside the closure; `∂_x p(1, 0.7) = −0.4`; for `σ_k`, `σ_k(λ + te_i) = σ_k + tσ_{k−1;i}` | Holds |
| §2.2 `Γ(σ_k, e) = Γ_k` | `(3, 3, −1)`; `−e` in `ℝ³` | `σ = (5, 3, −9)`: in `Γ_2 \ Γ_3`; `σ_2(−e) = 3` but `σ_1 = −3` | Holds |
| §2.3 quotient concavity, tangent | `σ_2/σ_1` at `(4, 1)`, `(1, 4)`, midpoint; `σ_2^{1/2}`, `λ = (1, 4)`, `μ = (4, 1)` | `0.8, 0.8, 1.25`; `2 ≤ 4·1 + 1·(1/4) = 4.25`; Gårding form `17 ≥ 8` | Holds |
| §2.3 differentiability | `min(x, y)` at `(1, 1)` and `(1, 2)` | `1 ≤ 0` false with zero derivative; `1 ≤ 2` at the smooth point | Holds |
| §2.4 Lemma 4 | `μ_i = (∏∂_j f)^{1/n}/∂_i f` | `n(∏∂_j f)^{1/n} ≥ f(μ) ≥ nγ^{1/n}` | Holds |
| §2.4 infinite intersection | `C_ε`, all `ε > 0` | intersection `{λ ≥ 0, λ ≠ 0}` contains `(1, 0)`, not open | Holds |
| §2.5 Hessian constant | `n = 3`, `k = 2` at `e`; general `k` | `∂_j = 3^{−1/2} = binom(3,2)^{1/2}/3`; `binom(n−1,k−1)/binom(n,k) = k/n` gives `binom(n,k)^{1/k}/n` | Holds, sharp |
| §2.5 pure quotient | `n = 2`, `(ε, 1)`; `n = 3`, `(M, 1, 1)` | `ε²/(1 + ε)⁴ → 0`; `∂_1 = 3/(M + 2)²`, `∂_2 = (M² + M + 1)/(M + 2)²`, product `≈ 3/M²` | Holds |
| §2.5 quotient plus `cσ_p^{1/p}` | `p = 1`, `n = 3` | every partial rises by `c`; `γ ≥ (c·3/3)³ = c³` | Holds |
| §3.3 constants | `χ = ω`, `F = 0`; `ℂP¹`, `χ = 2ω` | `c = 1`, `binom(n,k)^{1/k}`, `n`; `c·1 = 2` | Holds |
| §3.4 volume, energy, entropy | `χ = 0`; `χ = ω_X`; `F = a` | `V_t = t^nV`; `c_t^n/V_t = (1+t)^n/((1+t)^nV) = 1/V`; `e^{na} ≤ e^{na}|a|^p + e^n` in both ranges of `|a|` | Holds |
| §3.4 `Ent_q ≤ 1 + Ent_p` | normalized `F`, `q ≤ p` | `|F|^q ≤ 1 + |F|^p`, mass `1` | Holds |
| §4.1 comparison | `ψ = −|z|²/4`, `φ = 0`; non-convex cone with `f = σ_1`, `10σ_1` | `1/2 ≤ 1`; `f(1, −0.4) = 6 > f(1.01, 0.1) = 1.11` | Holds; hypothesis needed |
| §4.2 uniqueness | two components; `φ`, `φ + 1` | `(0, 0)` and `(0, −1)` both have `sup = 0`; unnormalized pair distinct | Holds; connectedness and normalization needed |
| §5.2 isomorphism | torus, `cos 2πx`; constant `1` | `Δ_ω⁻¹ cos = −cos/(2π²)`; `1` has mean `1`, not in the range | Holds |
| §5.3 exponent | `m = 2n`, `n = 2` | `2m/(m − 2) = 4 = 2n/(n − 1)` | Holds |
| §5.4 chart identity, gap use | flat `ℂ`; `u = −φ` | `∂_i(√g g^{ij}∂_j u) = 2√g Δ_ω u ≤ 2A√g`; `ess inf = 0` at a maximum of `φ` | Holds |
| Weak-Harnack contract | `u = 1` off a point; `u_ε = (x² + ε²)^{1/2} − ε` | `4π ≤ C·1`; `‖f_ε‖_{L¹} = [x/(x² + ε²)^{1/2}]_{−4}^{4} → 2`, `‖u_ε‖_{L¹(−2,2)} → 4` | Precise; `q ≥ 1` needed |
| §6.1 torus witness | `g = 1/2`, `q = 1 − a cos 2πx`, `x = 0`, `1/4` | `Δ' tr h = q''/(2q) = 2π²a/(1 − a) = Δ_ω F`; at `1/4`: `0 = −2π²a² + 2π²a²` | Holds |
| §6.1 `ℂP¹` | `g = (1 + |z|²)^{−2}` | `Γ = −2z̄/(1 + |z|²)`, `R = 2g`, `Ric = 2ω`, `s = B = 2` | Holds |
| §6.3 `C²` estimate | `λ = (4, 1/4)`; maximum-principle step | `4/17 ≤ 17/4`; at the maximum `tr h⁻¹ ≤ An`, so `tr h ≤ (An)^{n−1}e^{sup F}` | Holds; dependence as stated |
| §6.5 norms | `F = 0`, `φ = M`; `m = max(3, k + 1)` at `k = 0, 5` | unnormalized norm `≥ |M|`; data orders `3`, `6` | Holds |
| §6.6 Yau | `F = a`; `n = 1`, `F = ε cos 2πx`; derivative of `(φ, β) ↦ log(ω_φ^n/ω^n) − β` | `b = −a`; `b = −log I_0(ε)`; `(u, β) ↦ Δ_{ω_φ}u − β`, the isomorphism of §5.2 | Holds |
| §7.1 one variable | Jensen, Green, Harnack constants | `M ≤ 2πA/log(R/R')`; `α_1M/2π ≤ 1`; `∫_{D(0,r)}(2R'/|t − w|)^β ≤ 2π(2R')²/(2 − β)`; `e^{α_1C_HA} = (R/R')^{C_H}` | Holds |
| §7.1 local, radii | `x_0 ∈ B(0, 1/4)`, `R = 3/2`, `R' = 11/8`, `r = 5/4` | `1/4 + 7/4 = 2`; `R/R' = 12/11`; polar formula at `g = 1` gives `vol(S)ρ^{2n}/(2n)` | Holds |
| §7.1 negative control | `−(|x|² + ε)^{−1/2}` in `ℝ⁴` | `Δ = (r² + 4ε)(r² + ε)^{−5/2} > 0` | Holds |
| §8.1 auxiliary comparison | `φ_t ≡ 0`; `s = −inf φ_t` | `Ω_s = ∅`, `A_s = 0`; `0/0` excluded by `inf φ_t < −s` | Holds |
| §8.2 De Giorgi | iteration `r_j = 2^{−jδ_0}`; `1_{[0,1)}`; `e^{−s}` | `φ(s_{j+1}) ≤ B_0φ(s_0)^{δ_0}φ(s_j) < φ(s_j)/2`; `Σ r_j = 1/(1 − 2^{−δ_0})`; `re^{δ_0s − r}/B_0 → ∞`; at `δ_0 = 0`, `re^{−r} ≤ 1` | Holds |
| §8.3 degenerating bound | `s_0 = (2B_0)^{1/δ_0}Ē`; `n = 1` | Chebyshev on strict sublevels: `Φ(s_0) < Ē/s_0` unless `Φ(s_0) = 0`, so `Φ(s_0)^{δ_0} < 1/(2B_0)`; `δ_0 = (p − 1)/p` | Holds; the strict hypothesis of §8.2 is met |
| §8.4 energy via Jensen | `μ = V⁻¹e^{nF_t}ω_X^n` | `αE_t ≤ log(C/V) + n∫F_t dμ ≤ log(C/V) + n·Ent_1` | Holds |
| §8.5 ABP realification | `n = 1` | `Ĝ∂_z∂_z̄ = (Ĝ/4)Δ`, `det a = Ĝ²/16 = 4^{−2}Ĝ²` | Holds |
| §8.5(c) | `p' ≥ 1`; `p' = 1/2`, `F = 4` | `c∫(−φ)^N dμ ≤ log(C/V) + n(1 + Ent_{p'})`; `4 ≤ 3` false | Holds; `p' ≥ 1` needed |
| §8.6 fixed background | `χ = 0`, `t = 1`; `p' = n`, `N = 1` | `c_1 = 1`, `V_1 = V`; `Ent_n ≤ 1 + Ent_p` for `p > n` | Holds |
| §8.7 thresholds | `n = 2`, `k = 1` | `q' < 2`, `q > 2 = n/k`; `1/q + 1/q' = 1` at the endpoints | Holds |
| Conventions | `u = x_1²`; pss2012 dictionary | `(1/2)(D²u(∂_y, ∂_y) + D²u(∂_x, ∂_x)) = 1`; `Δ_ω = 2Δ_PSS`, `φ_PSS = 2φ`, `tr h = n + Δ_ω φ` | Holds |

### Source sample

All fifteen seeded sections were checked at their locators; the author flagged no locator as unverified.

| Section | What I read |
| --- | --- |
| 1.1 | szekelyhidi2018 line 17–24 (the endomorphism and `F(A) = f(λ)`); gpt2023 line 62–66; guo-phong2024 line 108–111. Supported. |
| 2.1 | spruck2005 line 11257–11293: Lemma 2.6, Proposition 2.7, Corollary 2.8, Lemma 2.10 with `r ≥ k`, `s ≥ l`; dinew-kolodziej2014 line 152–159. Supported; the equality clause is restricted here, correctly. |
| 2.3 | spruck2005 line 11295 (Theorem 2.11), 11347–11348 (Proposition 2.15), 11364–11365 (Theorem 2.16, `1 ≤ s < r ≤ n`); gpt2023 line 751–756; dinew-kolodziej2014 line 165–172. Supported; the case `l = 0` is §2.2's. |
| 2.5 | gpt2023 line 90–93 and 770–776; guo-phong2024 line 91–104. Supported; the README's `Γ_{max(k,p)}` and `l < k` correct the source. |
| 3.4 | gpt2023 line 101–119 (setting, (1.8), (1.9)), 82–83 (entropy, `n^pV` factor), 450–451 ((3.2), `p ≥ 1`), 785–803 (Lemma 5). Supported. |
| 4.1, 4.2 | tosatti-weinkove2010 line 36–47 (Corollary 1, the Monge–Ampère case). The general statement is the roadmap's own, with its route. |
| 5.2 | No readable source is cited beyond the supplier sections, which resolve (below); gilbarg-trudinger2001 Theorem 6.2 is uncertified. |
| 6.3 | pss2012 line 981–990 (Theorem 8 and its dependence list), 1026–1031. Supported. |
| 6.5 | twwy2015 line 134–136 (three derivatives of the data); tosatti-weinkove2010 line 93–99. Supported. |
| 6.6 | tosatti-weinkove2010 line 52–59 (the value of `b`); pss2012 line 170–179 (Theorem 1) and 216–233 (continuity method). Supported. |
| 8.1 | gpt2023 line 197–215 (Lemma 1, `A_s`, the `τ_k` and (2.3)). Supported; the README's exclusion of `A_s = 0` is an addition. |
| 8.2 | gpt2023 line 412–426. The source states existence of `S_∞`; the explicit bound is from its proof. Supported. |
| 8.3 | gpt2023 line 120–130 (Theorem 2), 384–387 ((2.15)), 397–407, 427–441 ((2.19)). Supported; the strict sublevels repair the source's continuity claim. |
| 8.5 | gpt2023 line 458–476 (Theorem 3 (a)–(c)). Supported; the Jensen step is the repaired one. |

### Pins, duplication and suppliers

- Pins: `lake-manifest.json` gives Tau Ceti `2fd255d9…` and Mathlib `1b1ccf4b…`, the commits of README lines 41 and 53.
- Declarations opened at the pins: `CourantFischer.lean:363` (`eigenvalue_mono`) and `:479` (`abs_eigenvalues_sub_le_opNorm`), `HoffmanWielandt/Basic.lean` (von Neumann), `KyFan.lean:99` (`kyFanSum`, the singular-value sum) and its Ky Fan principle, `Harmonic/MeanValue/Basic.lean` (sub-mean-value), `PDE/Regularity/Harnack.lean` (homogeneous weak Harnack only), `TwoForm/Basic.lean:37` (`SmoothTwoForm`), `Riemannian/Sobolev.lean:185` (R02); Mathlib `InnerProductSpace/Spectrum.lean:309`, `Matrix/Spectrum.lean:143,193,240`, `LocalExtr/Polynomial.lean`, `MeanInequalities.lean`, `Convex/Integral.lean:196`, `UniformSpace/Ascoli.lean:474`. All named declarations exist.
- By object: no Newton or Maclaurin inequality for `esymm`, no hyperbolic polynomial (Mathlib's `Matrix.IsHyperbolic` is a 2×2 matrix class), no spectral-function derivative at either pin. Across roadmaps, `roadmaps grep` for Maclaurin, hyperbolic polynomials, Gårding cones and spectral functions found only NumberFieldEnumeration (R03) and OperatorTheory's measurability of spectral functions of random matrices, a different statement.
- Supplier sections on main: PDE §3.2 (C13) line 1344, §5.4 (E23) line 1965, §5.6 (E25) line 2097; PseudodifferentialOperators §5.4 line 1337, §6.2 line 1523; ComplexKahlerGeometry K1 line 370, K2 line 558, K4 line 1091, K5a lines 1440–1948, K6.0 line 2321; DifferentialGeometry Layers 0, 1, 5, 12 lines 691, 862, 1644, 2796; ComplexManifolds Milestones 1–2 lines 172, 197; OptimalTransport Layer 6 line 2421. Scope citations at open heads: K3Surfaces §2.1 and ComplexComparisonPartII C5.4 exist.
- Overlap leads: the one lead of `scratch/overlaps.md` (Yamabe Y1.1 against pull request 2248) is R02. No id is defined only by an open revision; this package drops no id.
- Declared gap `gap:weak-harnack-supersolutions`: same slug in the README (lines 93, 474, 488, 673, 700, 714) and in the plan; supplier PDE §5.4 (E23), which exists. Precise (every hypothesis and the constant's dependence stated), minimal (the pin has only `f = 0`). Not a finding.

Overlap check: read Yamabe, ComplexKahlerGeometry, PDE (open); PDE, RicciFlow, OptimalTransport (main); the third list is empty. Shared objects: the closed-manifold Sobolev inequality, owned by the pinned Tau Ceti (R02); the Maclaurin inequality, shared with NumberFieldEnumeration §1.1 (R03); nothing else.

Dependency check, run on the candidate (exit 0):

```text
candidate: ComplexHessianEquations is not in the merge order yet; checked as if placed after ComplexComparisonPartII (the intake inserts it when its design is accepted)
depcheck: 206 roadmaps, 1898 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

### Headline theorems and padding

Headlines from the Summary: Lewis's derivative theorem and spectral concavity (§§1.3–1.4); Gårding's theorem and Hessian-quotient concavity with the structural constants (§§2.2–2.5); uniqueness (§4.2); Yau's theorem (§6.6); uniform exponential integrability (§7.2); the Guo–Phong–Tong estimates (§§8.3, 8.6, 8.7). Elaboration: not available (this lane does not elaborate). There is no `Suggested.lean` at the design stage, so there is nothing to probe for padding and no signature to compare; the finite-dimensional headlines are statable on native carriers and are owed at the package stage.

### Maintainer notes

None were left for this roadmap.

## Not verifiable

- The eight uncertified works (`cns1985`, `kolodziej1998`, `gilbarg-trudinger2001`, `yau1978`, `szekelyhidi2014`, `ckns1985`, `tian1987`, `hormander1990`) are settled and were not requested; their locators are unread. This covers §5.2's interior Schauder contract and the weak-Harnack contract (Theorems 6.2 and 8.18 of gilbarg-trudinger2001).
- Displayed formulas of spruck2005 are partly garbled by OCR (Corollary 2.8, Lemma 2.10); the hypotheses were legible and the inequalities were recomputed.
- Lean elaboration, the one-tactic probe and `#check` comparison: no Lean file exists and this lane does not elaborate.
- Open pull requests were searched through `roadmaps grep` and `roadmaps show` at the indexed heads; a head that moved after the index of 2026-11-13 was not seen.

## Source issues

- **Error** in spruck2005 at Corollary 2.4, printed p.289: the source says the cone of every symmetric polynomial hyperbolic in `(1, …, 1)` contains the positive cone and has positive partial derivatives; it should assume the coordinate vectors lie in the closed cone, as `2xy − 0.9(x² + y²)` shows; affects a stated result.
- **Error** in spruck2005 at Proposition 2.7, printed p.290: the source says equality in Newton's inequality forces equal coordinates for every real tuple; it should restrict the equality clause to positive tuples, since `(1, 0, 0)` gives equality; affects a stated result.
- **Error** in gpt2023 at the examples after Lemma 4, arXiv v1 p.17: the source places the quotient plus `cσ_p^{1/p}` on `Γ_k` for every `p`; it should use `Γ_{max(k,p)}`, where `σ_p` is positive; affects a stated result.
- **Misprint** in gpt2023 at the examples after Lemma 4, arXiv v1 p.17: the source allows `k = ℓ` in the exponent `1/(k − ℓ)`; it should require `ℓ < k`; affects a stated result.
- **Gap** in gpt2023 at the proof of Theorem 2, arXiv v1 p.9: the source calls the closed-sublevel mass function continuous; it should use strict sublevels, which give right-continuity when a level set has positive measure; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "489bcbf571a6b505b5b4eea3fe5da0a7ff3b0762", "job": "REV-DESIGN-ComplexHessianEquations~4", "model": "fable", "worker": "chris-x25"} -->
