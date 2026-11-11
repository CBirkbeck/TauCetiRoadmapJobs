<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12830#issuecomment-6788311536 -->
Red team round 2 pass b (claude) of bcf08f7

Verdict: needs_changes

1. **F01** (P2) 8.2 does not state the `ℓ¹L² → ℓ¹Ḣ²` solution operator that 10.2 and 10.4 consume

   - **Location.** 1659–1661: "for `0 < σ < 2` and `F ∈ Ḣ^{σ−2}` there is a unique `B ∈ Ḣ^σ` … if moreover
     `∂^j A_j ∈ ℓ¹L²`, then `‖B‖_{ℓ¹Ḣ²} ≲ ‖F‖_{ℓ¹L²}`"; consumers 2091 ("`ψ ∈ ℓ¹Ḣ² ⊂ C₀`, by §8.2") and
     2179 ("`Δ_a⁻¹` … the solution operator of 8.2 on `ℓ¹L²`").
   - **Claim.** 8.2 supplies, for every `F ∈ ℓ¹L²`, a solution `B ∈ ℓ¹Ḣ²` of `Δ_A B = F`.
   - **Witness.** `F` with blocks `‖P_k F‖₂ ≈ k⁻²` for `k ≤ −1`, `0` otherwise: `Σ k⁻² < ∞`, but
     `Σ 2^{2|k|(2−σ)} k⁻⁴ = ∞` for every `σ < 2`, so 8.2 gives no `B`. In 10.2 the forcing lies in
     `L² = Ḣ⁰`, the excluded `σ = 2`. OhTataru-YMHF line 963–967 has the same gap.
   - **Repair.** In 8.2 replace the clause "if moreover `∂^j A_j ∈ ℓ¹L²`, then `‖B‖_{ℓ¹Ḣ²} ≲ ‖F‖_{ℓ¹L²}`
     with a constant depending on `‖A‖_{Ḣ¹}` and `‖∂^j A_j‖_{ℓ¹L²}`" by: "if moreover `∂^j A_j ∈ ℓ¹L²`,
     then for every `F ∈ ℓ¹L²` there is a unique `B ∈ ℓ¹Ḣ²` (realised in `𝒮'_h` by 8.1, endpoint
     `s = 4/p`, `q = 1`, so `B ∈ C₀`) with `Δ_A B = F`; it satisfies `‖B‖_{ℓ¹Ḣ²} ≲ ‖F‖_{ℓ¹L²}` with a
     constant depending on `‖A‖_{Ḣ¹}` and `‖∂^j A_j‖_{ℓ¹L²}`, and it is the `Ḣ^σ` solution whenever `F`
     also lies in `Ḣ^{σ−2}`. Route: the bound for the finite block sums `Σ_{|k|≤N} P_k F`, which lie in
     `Ḣ^{−1}` and converge to `F` in `ℓ¹L²`, and completeness of `ℓ¹Ḣ²`; uniqueness because a solution
     `z ∈ ℓ¹Ḣ² ⊂ C₀` of `Δ_A z = 0` has `Δ|z|² = 2|D z|² ≥ 0` and vanishes by the weak maximum principle
     on large balls (PDE §3.2)." Add "PDE §3.2" to 8.2's *Needs* and the Check: "`‖P_k F‖₂ = k⁻²` for
     `k ≤ −1`: `F ∈ ℓ¹L²` and `F ∉ Ḣ^{σ−2}` for every `σ < 2`, so the `ℓ¹` clause is not a corollary of
     the first." Tested on the witness: the finite block sums of that `F` are in `Ḣ^{−1}`, the solutions
     are Cauchy in `ℓ¹Ḣ²`, and the limit solves the equation.

2. **F02** (P3) 8.1 cites the nonhomogeneous items of the textbook for homogeneous statements

   - **Location.** 1503–1504 ("BahouriCheminDanchin-FourierAnalysis, Definition 2.68 and Proposition
     2.71") for the realisation in `𝒮'_h`; 1547–1548 ("homogeneous Bony calculus …, Theorems 2.82 and
     2.85"); References 2300–2302; `sources.toml`, the `BahouriCheminDanchin-FourierAnalysis` locator
     ("homogeneous paraproduct and remainder estimates").
   - **Witness.** `TauCetiRoadmap/PDE/README.md` 2790–2800 cites Theorems 2.82 and 2.85 for the
     inhomogeneous decomposition (`S_j = 0` for `j ≤ 0`), and 2723–2725 pairs Definition 2.15 with the
     homogeneous space. In the book §2.3 and §2.6 are homogeneous; §2.7–§2.8, where 2.68–2.85 lie, are
     nonhomogeneous.
   - **Repair.** At 1503–1504 write "(BahouriCheminDanchin-FourierAnalysis, §2.3, Definition 2.15 and
     the completeness theorem for `s < d/p`, or `s = d/p` and `r = 1`; cited by locator)"; at 1547–1548
     write "(BahouriCheminDanchin-FourierAnalysis, §2.6, the homogeneous paraproduct and remainder
     theorems; cited by locator; §2.8, Theorems 2.82 and 2.85, is the nonhomogeneous analogue PDE §7.3
     uses)". Change the References entry and the `sources.toml` locator to "§2.3 and §2.6". The text is
     uncertified; I recall the homogeneous theorems as 2.25, 2.47 and 2.52 but did not read them: add
     theorem numbers only after checking them (see Not verifiable).

3. **F03** (P3) `Ḣ¹ ∩ Ḣ^σ` is used for `σ ≥ 2`, where 8.1 leaves `Ḣ^σ` a quotient

   - **Location.** 1855 ("`A ∈ C(J; Ḣ¹ ∩ Ḣ³)`"), 1862 ("`Ḣ¹ ∩ Ḣ^σ`, `σ ≥ 1`"), 1916, 2081; against
     1501–1502: "outside it the Besov space remains a quotient".
   - **Witness.** `Ḣ³(ℝ⁴) = Ḃ³_{2,2}` has `s = 3 > 4/p = 2`: its elements are classes modulo polynomials
     (`x₁` has every block `0`). An intersection of the function space `Ḣ¹` with a quotient is not
     defined, and neither is its norm.
   - **Repair.** Add to the Conventions, after the definition of `Ḣ^σ`: "For `σ ≥ 2`, `Ḣ¹ ∩ Ḣ^σ` (and
     `ℋ ∩ Ḣ^σ`) is the set of `u ∈ Ḣ¹` (resp. `ℋ`) with `‖u‖_{Ḣ^σ} = (Σ_k 2^{2kσ}‖P_k u‖²_{L²})^{1/2} < ∞`,
     normed by the sum; no polynomial ambiguity arises because `u ∈ L⁴`. It is complete." Tested:
     `u = x₁` is excluded (not in `L⁴`), and `u ∈ C_c^∞` has the finite norm `‖|D|³u‖_{L²}` up to
     constants.

4. **F04** (P3) the whole-space div–curl estimate is cited to PDE, which does not state it

   - **Location.** 278–280 ("§2.2 and §2.3: … for the whole-space div–curl estimate
     `‖∇u‖_p ≲ ‖div u‖_p + ‖curl u‖_p`"); 983 ("PDE §2.3 (whole-space div–curl estimate)"); used in
     §§4.3, 5.2, 8.2.
   - **Witness.** `TauCetiRoadmap/PDE/README.md` has no occurrence of "curl"; §2.3 (1187–1240) states
     Calderón–Zygmund operators, the Riesz transforms `R_j` with multiplier `−iξ_j/|ξ|` (line 1216) and
     Mihlin–Hörmander. No layer here states the estimate as a target.
   - **Repair.** Add to 4.3, before the Checks: "Whole-space div–curl estimate: for `1 < p < ∞` and
     `u ∈ C_c^∞(ℝ^d; ℝ^d)`, `∂_i u_j = −R_iR_j(∂^k u_k) − Σ_k R_iR_k(∂_k u_j − ∂_j u_k)` with the Riesz
     transforms of PDE §2.3, hence `‖∇u‖_p ≤ C(d, p)(‖∂^k u_k‖_p + ‖du‖_p)`, and the same on the closure
     of `C_c^∞` for the gradient norm." Change 983 to "PDE §2.3 (Riesz transforms)" and 279 to "from
     which §4.3 derives the whole-space div–curl estimate". Tested on `u = ∇φ`: the right side is
     `−R_iR_jΔφ`, with symbol `(ξ_iξ_j/|ξ|²)(−4π²|ξ|²) = −4π²ξ_iξ_j`, the symbol of `∂_i∂_jφ`.

5. **F05** (P3) the simple ideals are attributed to LieGroups Layer 5A, which does not produce them

   - **Location.** 362–363 ("Its semisimple derived ideal, decomposed into simple ideals, supplies the
     orthogonal factors used in §1.6"); 577–578 ("the maximum over the simple ideals from LieGroups
     Layer 5A"); 370–371.
   - **Witness.** `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md` 654–655: Layer 5A proves
     `𝔤 = z(𝔤) ⊕ [𝔤,𝔤]`, that `[𝔤,𝔤]` is a centerless semisimple ideal and that its Killing form is
     negative-definite; no decomposition into simple ideals and no orthogonality of them.
   - **Repair.** Add to "From Mathlib": "`LieAlgebra.IsKilling.instSemisimple` (`Algebra/Lie/Killing.lean`)
     and `LieAlgebra.IsSemisimple.isSimple_of_isAtom` (`Algebra/Lie/Semisimple/Basic.lean`): a
     finite-dimensional Lie algebra with nondegenerate Killing form is the independent supremum of its
     minimal ideals, which are simple; used in §1.6 for `[𝔤,𝔤]`." Replace 362–363 by "Its semisimple
     derived ideal has negative-definite Killing form; Mathlib decomposes it into simple ideals, and
     §1.6 proves that distinct simple ideals are orthogonal for every `ad`-invariant inner product
     (`⟨[X, Y], Z⟩ = ⟨X, [Y, Z]⟩ = 0` for `X, Y ∈ I`, `Z ∈ J`, since `I = [I, I]` and `[I, J] = 0`)", and
     577–578 by "the maximum over the simple ideals of `[𝔤,𝔤]`". Tested on `𝔰𝔲(2) ⊕ 𝔰𝔲(2)` with metrics
     `−tr` and `−4tr`: `γ₀ = max(√2, √2/2) = √2`.

6. **F06** (P3) the title lower-cases a proper name

   - **Location.** Line 1: "# Roadmap: yang–mills connections on Euclidean space and the caloric gauge".
   - **Witness.** Titles on main keep proper names: `TauCetiRoadmap/KacMoody/README.md` line 1 ("# Roadmap:
     Kac–Moody algebras, …"), `TauCetiRoadmap/MorseNovikov/README.md` line 1 ("# Roadmap: Morse–Novikov
     homology …"); the same line here writes "Euclidean" with a capital.
   - **Repair.** "# Roadmap: Yang–Mills connections on Euclidean space and the caloric gauge".

7. **F07** (P3) 9.5 asserts `L_X(a) : X → X` for `X = Ḣ¹ ∩ Ḣ^σ` without the linearised limit in that space

   - **Location.** 1912–1914 (limit `B_∞` stated for `b ∈ Ḣ^σ`, `−1 < σ ≤ 1`, and for `ℋ`); 1916–1920
     ("For each `X = Ḣ¹`, `ℋ`, or `Ḣ¹ ∩ Ḣ^σ` with `σ > 1` … `L_X(a) : X → X`, `b ↦ B_∞[a]b`"); 1962–1963.
   - **Witness.** For `X = Ḣ¹ ∩ Ḣ^σ`, `σ > 1`, the value `B_∞[a]b` must lie in `Ḣ^σ`; no sentence of 9.5
     gives that. The source has the clause: OhTataru-YMHF line 2520 (Lemma 5.33(2), last sentence) and
     line 2550–2551.
   - **Repair.** After "`D(A_∞)_k B_{∞,j} − D(A_∞)_j B_{∞,k} = 0`;" (1914) insert: "if moreover
     `a, b ∈ Ḣ¹ ∩ Ḣ^{σ'}` with `σ' > 1`, the limit exists in `Ḣ¹ ∩ Ḣ^{σ'}`, with
     `‖B_∞‖_{Ḣ^{σ'}} ≲_{Q,M₁} ‖b‖_{Ḣ^{σ'}} + ‖b‖_{Ḣ¹}‖a‖_{Ḣ^{σ'}}` (Lemma 5.33(2), line 2520, from the `Ḣ¹`
     case and the envelope bound of 9.4);". Keep 1962–1963, which concerns `b ∈ Ḣ^σ` alone. Tested on
     `G = U(1)`: `B_∞ = ∇ψ` is the gradient part of `b`, in `Ḣ¹ ∩ Ḣ^{σ'}` with norm at most that of `b`.

8. **F08** (P3) the scope paragraph on FourManifolds omits the energy identity both roadmaps state

   - **Location.** 113–118 (lists §§4.1–4.2, §7.3 and §7.6 against FourManifolds); 1246–1247 (6.3,
     Check: "FourManifolds Layer 5's normalisation `E(A) = 8π²k + 2‖F_A⁺‖²`").
   - **Witness.** `TauCetiRoadmap/FourManifolds/README.md` at its open head, 2285–2287, states the same
     identity on closed 4-manifolds; `TauCetiRoadmap/SmoothBundlesConnections/README.md` 88–90 on main
     assigns "the self-dual and anti-self-dual energy comparisons, the BPST solution" to FourManifolds.
     §1.5 and §6.3 here state them on `ℝ⁴`.
   - **Repair.** Append to the FourManifolds bullet (after "belong there."): "The energy identity
     `ℰ_e = 8π²c₂ + 2‖F⁺‖²` is stated here on `ℝ⁴` for finite-energy rough connections (§1.5, §6.3);
     the closed-manifold comparison and the BPST solution on `S⁴`, which SmoothBundlesConnections'
     scope assigns to FourManifolds, stay there." No *Needs* line changes.

Files read in full: `packages/YangMillsConnectionsAndCaloricGauge/README.md` (2306 lines) and
`packages/YangMillsConnectionsAndCaloricGauge/Suggested.lean` (60 lines; it declares nothing).
Line numbers are README lines unless a file is named. One finding is blocking (S01, P2); S02–S08
are P3.

## Earlier findings at this head

| Earlier finding | Status | Witness at bcf08f7 |
| --- | --- | --- |
| 1a/F01 zero envelope | repaired | 1572–1574: "majorizes exactly the data whose homogeneous blocks all vanish. In a realised space contained in `𝒮'_h` this means `u = 0`; in a homogeneous quotient it means the zero class"; Check 1613–1615 (`P_k 1 = 0`, `P_{≤k}1 = 1`). |
| 1a/F02 local Besov carrier | repaired | 949–959: "define `ℓ¹W^{1,p}(B)` as the restrictions to `B` of `B¹_{p,1}(ℝ^d)` … with norm `inf{‖U‖ : U|_B = u}`"; Checks 969–981. The carrier depends on the declared gap `inhomogeneous-besov-partition` (305–310; same slug in `design/plan.json`). |
| 1a/F03 strictness | repaired | 557–560 ("For `X ≠ 0`", "For `X = 0` every displayed quantity is `0`"); 1248–1251 (`ℰ_e − |χ| = 2 min(I₊, I₋)`; recomputed `(1,1) ↦ 2`, `(0,1) ↦ 0`). |
| 1a/F04 endpoint embedding | repaired | 257–258: "For an additive Haar measure, `p* ≠ ∞` and `1/p* + 1/dim E = 1/p`"; Check 1626–1631 (`∫₁^∞ t⁻⁴ dt = 1/3`). Pin: `TauCeti/Analysis/Sobolev/D1p0/Basic.lean:246` (`sobolevEmbeddingL`). |
| 1b/F01 Fréchet `C¹` | repaired | 1916–1923 (`ContDiff ℝ 1` on the open `Ω_X`, operator-norm continuity of `L_X`), 2060–2068 (the Banach space `𝔘`), 2088–2101 (derivative formulas). Recomputed: `δ(O⁻¹∂O) = D(q)ψ` for `δO = Oψ`; `dCal = Ad(O)(b − B_∞ + [ψ, ã − q])`; at a caloric base point this is `b − D(a)ψ`, the `L` of 2183. Two gaps left in the repair: S01 and S07. |
| 1b/F02 homogeneous products | repaired | 1540–1565. Recomputed the three kernels: `2^{j−k}` (low–high), `2^{(1−σ)(j−k)}` (high–low, summable iff `σ < 1`), `2^{(σ+2)(k−j)}` (high–high, summable iff `σ > −2`); pairs `(0,4)`, `(4,0)`, `(0,0)`, `(0,3)` each counted once. |
| 1b/F03 PDE citations | repaired | 284–288; 1506–1512. Recomputed `P_k f = (P_1(f(λ⁻¹·)))(λ·)` for `λ = 2^{k−1}`: symbol `ψ(ξ/(2λ)) = ψ(2^{−k}ξ)`. `TauCetiRoadmap/PDE/README.md` 2691–2692 states the heat-block bound "for `j ≥ 1`". |
| 1b/F04 flat case | repaired | 1063–1068; 2045–2049; *Needs* 2056 "3.3, 4.1, 4.3, 8.1". |
| 1b/F05 global potential | repaired | 918–925; Hölder on `S_r`: `∫|F|^{3/2} ≥ (2π|n|)^{3/2}/(4πr²)^{1/2}`, radial integral `∫₀¹ dr/r = ∞`. OhTataru-TopClass line 1398–1404 has the hypothesis. |
| 1b/F06 notation | repaired | 822–824 ("unit balls `B_α` whose centres are pairwise at distance at least `c(d) > 0`"); 970–971 names the map. |
| 1b/F07 FourManifolds | settled (not actionable), reason holds | FourManifolds is an open roadmap later in `merge-order/ORDER.txt` (line 135 against 13); 113–118 now state the split. A neighbouring omission in the same paragraph is S08. |
| 1b/F08 layer dependencies | repaired | 390–393, 1189, 1293–1294, 2034, 2263. |
| 1b/F09 text | partly repaired | 198 "Here `J ⊆ [0, ∞)` is an interval" is repaired. Line 1 still lower-cases a proper name: S06. |

No repair introduced a false statement that I could find; the two incomplete ones are S01 and S07.

## The pass: statements, instances and values

`Suggested.lean` has no declaration, section variable or instance; the table is of README targets.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| Conventions, gauge sign | `SU(2)`, `O = exp(x₁i)exp(x₂j)` at `0` | `R₁ = i`, `R₂ = j`, `(R∧R)₁₂ = [i,j] = 2k`; `F₁₂[R] = 4k`, `F₁₂[−R] = −2k + 2k = 0` | holds |
| Conventions, `Φ` | quaternion `i, j, k` | images `diag(i,−i)`, `[[0,1],[−1,0]]`, `[[0,i],[i,0]]`; `Φ(i)Φ(j) = Φ(k)` | homomorphism |
| 1.1 | `SU(2)`, `−tr` | `ij = k`, `[i,j] = 2k`, `|i|² = 2` | holds |
| 1.2 | `U(N)`, shear `t = 1` | `UᵀM = [[2,t],[t,t²+2]]/√(4+t²)` symmetric positive; distance² `5 − 2√5 ≈ 0.528 < 1` | holds |
| 1.3 Leibniz | `X = i`, `g = exp(πk/4)`, `Y = j` | `Ad(g)i = j`, `Ad(g)j = −i`; `[j, −i] = 2k`; misplaced form `0` | holds |
| 1.3 composition | general | `Ad(O)(Ad(O')A − O';x) − O;x = Ad(OO')A − (OO');x` | holds |
| 1.4 `SU(2)` forms | `k = 2`, `A = −θ_R` | `2(½tr(A dA) + ⅓tr(A³))`; `θ³ − ⅔θ³ = ⅓θ³` | holds |
| 1.4 integral | frame `(k,i,j)` | `tr(kij) = −2`, `tr(kji) = 2`, alternation `−12`; `−12·2π²/3 = −8π²` | holds |
| 1.5 | `F = X(dx¹²+dx³⁴)`; `X dx¹²` | `|F|² = 2|X|²`, coefficient `2|X|²`; second: `|X|²` against `0` | holds |
| 1.6 `𝔉` | `ω = Σ ω^a e_a` in the displayed basis | `𝔉₁₂ = −2[ω²,ω³]`; pairing `−6√2⟨ω¹,[ω²,ω³]⟩`; `ω^a = λ(i,j,k)`: `−24√2λ³` | holds |
| 1.6 `𝔉_{F⁻}(ω) = 0` | `F = X(dx¹²−dx³⁴)`, `ω = Y(dx¹³−dx²⁴)` | `𝔉₁₄ = −[X,Y] + [X,Y] = 0`, `𝔉₂₃ = 0` | holds |
| 1.6 cubic bound | AM–GM | `6√2/(3√3) = 2√6/3`; BPST point: `24√2|λ|³` both sides | sharp |
| 2.1 | `log log(1/|x|)`, `d = 4` | `∫₁^∞ L⁻² dL = 1`, `∫₁^∞ L⁻⁴ dL = 1/3`; `exp(tX)` has no limit for `X ≠ 0` | holds |
| 2.4 top order | `O = exp(√L i)`, `B = √L j` | rotating part `√L·(1/√L)·(1/r) = 1/r`; `∫ r⁻⁴ r³ dr = ∞` | qualification needed, present |
| 2.5 exterior | polar coordinates | `∫|∂O|^d dx ≥ ∫∫ |∂_ΘO|^d dΘ dr/r` | holds |
| 3.1 scaling | `λ`, `d = 3` | `‖F_λ‖²_{L²} = λ⁴λ⁻³ = λ` | holds |
| 3.4 BPST | radial integral | `48π²·T²(T+3)/(6(1+T)³)` at `T = r²`; small `r`: `24π²r⁴` | holds |
| 4.1 `U(1)` Check | `A = ia` | `Δφ = div a = −i∂^ℓA_ℓ`, `∂_νφ = x·a` | holds |
| 4.2 monopole | `n = 1`, `d = 3` | Hölder exponent `(2π)^{3/2}(4πr²)^{−1/2}` | holds |
| 5.1 BPST remainder | `O = Φ(x̄/|x|)` | `−O;x = Im(x̄dx)/|x|²`; `B = −Im(x̄dx)/(|x|²(1+|x|²))` | holds |
| 5.3 identity | general | bracket `−O';x + P;x + Ad(P)O;x = Ad(P)B − B'` | holds |
| 5.4 perturbation Check | `A₁ = −2x₁i`, `b₂ = j/(1+|x|²)` | `F₁₂ = −2x₁j/(1+|x|²)² − 4x₁k/(1+|x|²)`; `∫ r dr = ∞` | holds |
| 6.3 | `(I₊,I₋)` | `ℰ − χ = 2I₊`, `ℰ + χ = 2I₋`; anti-self-dual: `χ = ℰ` | holds |
| 6.4 sign | `Φ`, conjugation | degrees `1`, `−1`; `c₂ = −1`, `1` | agrees with 7.6 |
| 7.4 | self-dual BPST | `Δ(1+r²)⁻¹ = −8(1+r²)⁻³`; right side `−(2√3/3)(4√3) = −8`; centre `−768 = 0 − 768`; pulled-back curvature `−2√2(k,i,j)` in the basis of 1.6 | holds |
| 7.4 scalar inequality | `u = |ω|^{1/2}` | `2u³Δu + 6u²|∇u|² ≥ 6u²|∇u|² − (2√6/3)γ₀u⁶` | holds |
| 7.5 | Sobolev constant | `Y(S⁴) = 12(8π²/3)^{1/2} = 8√6π`; `8√6π‖F⁺‖ ≤ 2√6γ₀‖F⁺‖²` gives `4π/γ₀` | holds |
| 7.6 | `x = 0` | `i`-part of `dx̄∧dx`: `2(dx¹²−dx³⁴)`; `j`-part `2(dx¹³+dx²⁴)`; `96π²/12 = 8π²` | anti-self-dual |
| 7.7 | `SU(2)`; metric `×c` | `16π²/2 = 8π²`; `γ₀ = √2/√c`, `8π²c` | holds |
| gap `compact-su2-subalgebra` | `𝔰𝔲(2)`, `−tr` | root `α(k) = 2`, `|k| = √2`, length `√2 = γ₀` | consistent |
| gap `inhomogeneous-besov-partition` | `|ξ| = 2` | PDE's written blocks: `χ(ξ) + 1 − χ(ξ/2) = 0 + 1 − 1 = 0`; requested blocks: `1` | gap is real |
| gap `hardy-inequality` | `d = 4`, `p = 2` | constant `p/(d−p) = 1` | consistent |
| 8.1 `L^p ⊆ 𝒮'_h` | `p < ∞` | `‖P_{≤k}g‖_∞ ≤ ‖g‖_p‖φ_k‖_{p'} → 0` | holds |
| 8.1 Riesz constant | `n = 4`, `α = 1` | `Γ(3/2)/(π²·2·Γ(1/2)) = 1/(4π²)` | holds |
| 8.1 shell Check | `|ξ| = 2^{k+1}` | `(2π·2^{k+1})^σ/2^{kσ} = (4π)^σ` | holds |
| 8.1 endpoints | `σ = −2`; `σ = 1` | `∫ r⁻⁴r³ dr = ∞`; `v_N(0) = √Nφ(0)`, `‖v_N‖_{Ḣ²} ≍ 1` | both fail, as stated |
| 8.1 Lemma 3.5 | general | second term `≤ ‖c‖_∞ c_k Σ_i 2^{σ̃(i−k)}d_i · Σ_m 2^{−(σ(1−ε)−σ̃)m}` | holds |
| 8.2 | `F` of S01 | in `ℓ¹L²`, in no `Ḣ^{σ−2}` | S01 |
| 8.3 scaling | `λ` | `G`: `λ⁴λ⁻²λ⁻² = 1`; `DB`: `λ³λ⁻¹λ⁻² = 1` | holds |
| 8.3 stationary solution | harmonic `A`, `B_j = ξ^kF_kj` | `Δ_AB_i = −2[F_iℓ, B_ℓ]`, so `−Δ_AB − 2[F,B] = 0` | holds |
| 8.3 `ℓ²L¹` against `L¹` | `K` blocks | each `K^{−1/2}` on its time window; sum `K^{1/2}` | source form fails |
| 9.1 curvature equation | `A = (i,j,k,0)` | `∂_sA₁ = −8i`, `∂_sF₁₂ = −32k`, `Δ_AF₁₂ = −16k`, right side `−16k` | holds |
| 9.1 de Turck | general | `(∂_s − Δ_A)A_j = −[∂^ℓA_ℓ, A_j] − [A^ℓ, ∂_jA_ℓ]` | holds |
| 9.2 weight | free heat flow | `(p,q) = (∞,4)`: `s^{1/2}‖e^{sΔ}f‖₄ ≲ ‖f‖₂`; `(2,∞)`: `L² ⊆ Ḃ^{−2}_{∞,2}` | holds |
| 9.5 sine control | `u_n = π1_{(0,1/n)}` | `π/√n`, operator distance `2`, relative error `1` | holds |
| 10.2 derivative | `U(1)`, `ã_t = it dφ` | `ψ = iφ`, `dCal = 0` | holds |
| 10.3 symbol | `|ξ| = 1`, `|η| = 2` | `(1−4)/5·2k = −6k/5` | holds |
| 10.4 projection | general | `P(Lb) = b − Dc − DΔ_a⁻¹(−Δ_ac) = b` | holds, given S01 |
| 10.4 sphere chart | Hilbert space | inverse has norm `1 + t`; chart reads `v ↦ v + 0·e` | holds |
| 10.5 | `w = D(a)c₀` | `b = 0`, `c = −c₀` | holds |

## Dependency check

    depcheck: 236 roadmaps, 2135 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` lists eight files, all under
`packages/YangMillsConnectionsAndCaloricGauge/`.

## Verified sound

- **Counts.** Declarations read: 0 (none exist). README sections read: 52, each with a *Needs:*
  line. Checks recomputed: more than 70 (the table above shows the values). Source locators re-read
  in the cached texts this round: 38 (26 in OhTataru-YMHF, 12 in OhTataru-TopClass). Sibling
  citations resolved on main: 30. Pinned declarations located: 34.
- **`Suggested.lean`.** One `import Mathlib`, no `set_option`, no declaration, no sorry'd data; the
  docstring names every headline of the README's summary (Layers 3–10) with the missing carrier.
  The headlines need rough connections, weak curvature, `𝒮'_h`-realised spaces or the heat-flow
  solution carrier; I found none statable with a few native definitions, and no padding. No
  `#check @name` comparison was possible or needed.
- **Earlier findings.** Twelve repaired or settled, one partly (table above).
- **Suppliers on main.** PDE §§1.2, 1.4–1.6, 2.2–2.3, 3.2, 6.1, 6.3, 7.1–7.3; SmoothBundlesConnections
  B3.1, B4.1, B4.2 (`u·A = Ad(u)A − du·u⁻¹` at its line 1018); CharacteristicClasses C4 item 1 and
  C5a.3 (`CS_P`, `F_t` at 1556–1557); RiemannianGeometry R6; DifferentialGeometry Layers 0–1,
  5.2–5.4, 10.3–10.5; AlgebraicTopology Stage 6 item 5, Stage 8 item 3; LieGroups (the folder
  `TauCetiRoadmap/RepresentationTheory/LieGroups`) Layers 0–2, 5A and the two named Layer 6 blocks
  (750–751); Yamabe Y2 item 1 (157–158). All exist with the content cited, except as in S04, S05.
- **Gaps.** The six slugs agree between the README and `design/plan.json`; each names a supplier and
  a section. `TauCeti.Wkp` is real-valued at the pin (`Analysis/Sobolev/Wkp/Basic.lean:145`), so
  `vector-valued-wkp` asks for nothing provided; PDE has no Hardy inequality, Neumann `L^p` theory or
  normal-component div–curl estimate; PDE §7.1's written inhomogeneous blocks do miss `|ξ| = 2`.
- **Pins.** Every backticked Mathlib and Tau Ceti name of the README exists at the pins, including
  `Manifold.IsImmersion.isDiffImmersionAt` (`Geometry/Manifold/Immersion.lean:1008`; it needs
  `n ≠ 0`, met by `n = 1`) and `Manifold.IsDiffImmersionAt`, defined as a left inverse of the
  derivative (`Geometry/Manifold/ImmersionDiff.lean:65`), as line 2163 says.
- **Ownership against open work.** Searched by object (`roadmaps grep`) on main and at the open
  heads: frequency envelopes, the instanton number, the caloric gauge and the Yang–Mills heat flow
  have no other owner; Uhlenbeck's lemma and BPST overlap FourManifolds only (settled, and S08);
  InstantonFloerTheory reads FourManifolds' objects through its `SO(3)` adapter;
  RelativisticQuantumFieldTheory's "Coulomb gauge" is the Maxwell one. No `Suggested.lean` name can
  collide: none is declared.
- **Policy.** No pull-request number, process narrative or machine path in the README or the
  docstring; every target has a locator; every defined object has at least three Checks (2.3, 3.3
  and 7.2, which have none, define nothing).

## Not verifiable

- `BahouriCheminDanchin-FourierAnalysis`: uncertified; the publisher's page asks for a login, so the
  numbering in S02 rests on PDE's use of the same theorem numbers and on my recollection of the
  book's section order, not on the text.
- `Uhlenbeck-LpCurvature`, `Uhlenbeck-RemovableSingularities`, `FreedUhlenbeck-Instantons`,
  `DonaldsonKronheimer`, `Bogomolnyi-Stability`, `MimuraToda-TopologyLieGroups`: uncertified, cited
  by locator only.
- 4.3's interior bound "in terms of `m`, `‖D^{(m)}F‖`, `‖A‖_{L^d(B)}` and `λ`" for `m ≥ 1` agrees
  with OhTataru-TopClass line 1423–1427; I neither proved nor refuted that the lower-order
  curvature norms can be left out of the dependence.
- The operator-norm estimates behind 9.5 and 10.2 (the Fréchet targets) are in no source read; they
  are stated as targets with a route, which I did not carry out.
- The proofs of 8.2–8.4's envelope bounds, of OhTataru-YMHF Theorem 6.1 (including the omitted
  convergence of the centres) and of the Gursky–Kelleher–Streets normalisation conversion were not
  re-derived this round; the statements were compared with the sources.
- No Lean was run (read-only pass); there is no declaration to elaborate.

## Source issues

- **Misprint** in OhTataru-YMHF at Theorem 4.1, proof, printed page 23 (line 974): the source says the functional has the linear term with a minus sign; it should be a plus sign for the equation `Δ_A B = F`; affects the proof.
- **Gap** in OhTataru-YMHF at Theorem 4.1, (4.3), printed page 23 (line 966–967): the source says the `ℓ¹Ḣ²` bound holds for forcing in `ℓ¹L²`; existence and the uniqueness class for forcing in no `Ḣ^{σ−2}` are not addressed; affects a stated result.
- **Error** in OhTataru-YMHF at Theorem 4.6, printed page 29 (line 1290): the source says `DB` is bounded in `L¹Ḣ^σ`; it should be the dyadically summed `ℓ²L¹Ḣ^σ` norm, since `K` separated heat blocks give growth `K^{1/2}`; affects a stated result.
- **Error** in OhTataru-YMHF at Theorem 4.7, printed page 30 (line 1356): the source says the solution is continuous into `Ẇ^{σ,p}` up to `p = ∞`; it should require heat-continuous data at `p = ∞`; affects a stated result.
- **Misprint** in OhTataru-YMHF at Corollary 5.8, (5.17)–(5.18), printed page 38 (line 1792–1800): the source says the weight carries an extra `1/4 − 1/p`; it should be `n/2 + 1 − 2/q` for the measure `ds/s`, by parabolic scaling; affects a stated result.
- **Gap** in OhTataru-YMHF at Corollary 5.12(1), printed page 42 (line 1931): the source says a strictly larger interval exists; it should assume a finite endpoint `s₀`; affects a stated result.
- **Gap** in OhTataru-YMHF at Corollary 5.15 against Lemma 5.33(2), printed pages 42 and 54 (lines 1955, 2516): the source says the linearised limit holds for `−1 < σ < 2`; it should be the range its proof covers, at most `σ ≤ 1`; affects a stated result.
- **Gap** in OhTataru-YMHF at Lemma 5.33, Step 3, printed page 55 (line 2552–2555): the source says the limit map is `C¹`; it should add operator-norm continuity of the derivative, the argument differentiating along one-parameter families only; affects the proof.
- **Misprint** in OhTataru-YMHF at Proposition 7.7, (7.7), printed page 69 (line 3288): the source says the divergence is bounded in the inhomogeneous `W^{1,4/3}`; it should be the homogeneous seminorm, as dilation shows; affects a stated result.
- **Misprint** in OhTataru-TopClass at Lemma 3.13, printed page 29 (line 1423): the source says the conclusion is in `L^{d/(n+2)}` with `n` undefined; it should be `L^{d/(m+2)}`; affects a stated result.
- **Misprint** in OhTataru-TopClass at Theorem 1.5, printed page 8 (line 374): the source says the higher-regularity hypothesis is on `B_R`; it should be on `ℝ^d` for a conclusion on `ℝ^d`; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "bcf08f7a6f78a1f1ca22d4c6edbea69ee31e98a0", "job": "RT-YangMillsConnectionsAndCaloricGauge~2b", "model": "fable", "worker": "chris-x17"} -->
