# Review of QuantumFoundations (pull request #1771 at 944ed3c)

**Verdict:** accepted

Incremental re-review of the 11 lines of `TauCetiRoadmap/QuantumFoundations/README.md` changed since ccf4051 (6 insertions, 5 deletions: lines 118, 586, 887, 898, 976 and 1095 at this head). `Suggested.lean` is byte-identical to the file reviewed at ccf4051 (`git diff ccf4051..HEAD -- Suggested.lean` is empty), the folder still holds only `README.md`, `Suggested.lean` and `metadata.toml`, and the pull request changes nothing outside the folder (`git diff --stat origin/main...HEAD` excluding the folder is empty). No finding of this round; the four findings of the previous review are all repaired, and no repair introduced a new problem.

## Previous findings

- R01 — repaired: line 887 now states the kernel on `L²(ℝⁿ)` as `(4π|t|)^(−n/2)e^(−inπ sgn(t)/4)∫_(ℝⁿ)exp(i|x−y|²/(4t))ψ(y)dy`, "the prefactor being `(4πit)^(−n/2)` with the principal root (Teschl, equation (7.30))"; the second Check (line 898) now computes the two-dimensional Gaussian, which refutes the exponent `−1/2`. Both recomputed (table).
- R02 — repaired: line 118 is a fourth Check of §0.2, the `ℂ²` model with a wild involutive automorphism `σ`, `h(x,y) = σ(x₁)y₁ + σ(x₂)y₂`, trivial intersection from `h(x,x) = Σ(a_j²+b_j²)` in the real closed fixed field, and the refutation through `projectiveCollineation_unique_scalar`; the dimension-one and real cases are addressed. Every step recomputed (table).
- R03 — repaired: line 586 reads "the one-atom criterion is not a type I criterion on nonfactors (`ℂ ⊕ R_(II₁)` has an atom and is not type I, while `ℂ²` has an atom and is type I)"; line 976 attaches Theorem 8.4 to the `L²(ℝ³)` spectra and Theorem 10.7, with the `|m| ≤ ℓ` eigenbasis and R8.1's dimension, to the `L²(S²)` multiplicity.
- R04 — repaired: line 1095 is phrased as what RelativisticQuantumFieldTheory needs from this roadmap, by milestone kind rather than by label, and records that the Whitehead `H¹` statement it names is NoncompactQuantumSymmetry P.4; checked against that roadmap at its open head d5f595e (below).

## Verified sound

Gate, dependency check and elaboration. Worker's gate at 944ed3c: every check passes (`set_option=0 … depcheck=0 … build=0 OK`). Dependency check run by me with the merge-order candidate and `--movable`: `depcheck: 205 roadmaps, 1669 edges, 0 problem(s)`, no `moved:`, `UPWARD` or `CYCLE` line; this roadmap is line 198 of the candidate order, after VonNeumannAlgebras (5), NoncompactQuantumSymmetry (141) and CompactQuantumMetricSpaces (197); RelativisticQuantumFieldTheory is not in the order and cites this roadmap in one direction only. `lake env lean TauCetiRoadmap/QuantumFoundations/Suggested.lean` at this head: exit 0, exactly the 7 `declaration uses sorry` warnings (lines 53, 62, 74, 86, 107, 124, 139), no error, no module-system advisory. Since the Lean file is unchanged since ccf4051, the previous review's one-tactic probe (`simp` closes none of the seven theorems), its `#check @` of all 10 declarations against the README statements (no dropped section binder; worker's `signatures.md` agrees) and its 23 library `#check`s at the pins (Mathlib f6090c7, Tau Ceti 358314d) stand; the 10 Lean names still occur in the README and no new backticked name of the roadmap's own was added (the new Check names only `projectiveCollineation_unique_scalar`, declared at `Suggested.lean` line 62 with the hypothesis `2 ≤ Module.rank K V` the Check invokes as "rank two suffices"). The worker's `citations.md` lists four Lean-name leads (`M4.SpatialLocalization`, `M5.AffineG5`, `V2.BorelCalculus`, `V2.NonmodularProjectionLattice`): all four are supplier section labels, not Lean names, resolved at NoncompactQuantumSymmetry 777a2fe lines 2348 and 5889 and VonNeumannAlgebras dee8088 lines 531 and 871 in the previous review and untouched by this change.

The changed passages, read in full. Line 118 (§0.2 fourth Check): recomputed step by step (table rows "§0.2 Check 4 …"). Line 586 (§5.2 one-atom sentence): both instances recomputed. Lines 887 and 898 (§8.2 kernel and Check): checked against TESCHL_MMQM line 7165, display (7.30), `(4πit)^(−n/2)∫_(ℝⁿ)exp(i|x−y|²/(4t))ψ(y)dⁿy` for `t ≠ 0` and `ψ ∈ L¹ ∩ L²` (the README's Schwartz hypothesis is contained in Teschl's, and its `L²` extension by unitarity is Teschl's "understood as a limit" at line 7169); the bound (7.31) at line 7174 with `|4πt|^(−n/2)`. Line 976 (§9.3, a sampled target): TESCHL_MMQM line 7512, Theorem 8.4, in Section 8.2's setting of `L = x∧p` on `L²(ℝ³)` (lines 7427–7430): an orthonormal basis of simultaneous eigenvectors of `L²` and `L_j`, `σ(L²) = {l(l+1)}`, `σ(L₃) = ℤ`; line 9782, Theorem 10.7, on `L²((0,π),sin θ dθ) ⊗ L²((0,2π))`: pure point `σ(L²) = {l(l+1)}`, the `Y_l^m` with `|m| ≤ l` an orthonormal basis with `L²Y = l(l+1)Y`, `L₃Y = mY` (lines 9785–9794); neither theorem states a multiplicity, and the README now derives `2ℓ+1` from the eigenbasis and from RiemannianGeometry R8.1 (main 929496d, lines 1406–1416: `dim H_d = C(m+d,d) − C(m+d−2,d−2)`, which for `m = 2` is `2d+1`, computed in the table). Line 1095 (Downstream consumers): RelativisticQuantumFieldTheory #1772 at d5f595e (read with `roadmaps show`): milestones RQFT0 "conventions, test functions and exact solution carriers" (line 37), RQFT2 "Lorentz spinors …" (242), RQFT3 "free fields as operator-valued tempered distributions" (394), RQFT9 "electromagnetic examples and perturbative QED" (3612), RQFT10 "Shale implementability and inequivalent free representations" (3790); it consumes this roadmap's Fock and second-quantization interface at RQFT2, RQFT3 and RQFT10 (line 35), the Kummer/Tricomi interface and terminating identity at RQFT9 (lines 35, 3614), the Schrödinger comparison at RQFT0/RQFT1 and RQFT9 (lines 39, 141, 160, 3667), and at RQFT10 deduces the pairwise inequivalence of the representations precomposed with `S_t = cosh(t)I + sinh(t)C` (line 3806), which is §9.9's family; it names a "finite-dimensional Whitehead `H¹` theorem" of this roadmap at line 1571, and that statement is NoncompactQuantumSymmetry 777a2fe P.4, line 453 (`H¹(g,V) = 0` for finite-dimensional semisimple `g` and finite-dimensional `V` over a characteristic-zero field), which this README's scope (line 22) already assigns to P.4. The paragraph is therefore accurate as a statement of needs. RQFT's line 35 also asserts that this roadmap "consumes the terminal photon, spin-statistics and implementability exports at RQFT3/4/10"; nothing in this README does (its `*Needs:*` lines and supplier contracts never name RelativisticQuantumFieldTheory, and the dependency check is clean), so that is a statement for RQFT's own review, recorded here as in the earlier rounds.

Adversarial table (values computed on each side). New rows for every changed statement first; the rows for untouched statements are carried from the review at ccf4051, each marked.

| Statement | Instances | Computed | Result |
|---|---|---|---|
| §0.2 Check 4, choice of `σ` | `σ = τ∘conj∘τ⁻¹`, `τ ∉ {id, conj}` | if `τ(ℝ) = ℝ` then `τ|ℝ` is an automorphism of ℝ, hence the identity (squares to squares), `τ(i) = ±i`, `τ ∈ {id, conj}`; so `τ(ℝ) ≠ ℝ`; fixed field of `σ` is `τ(ℝ) ≠ ℝ`, so `σ ≠ conj`; `σ² = id` | as stated |
| §0.2 Check 4, `σ` on `F(i)` | `τ(i) = ±i` | `τ⁻¹(i) = ±i`, `conj` gives `∓i`, `τ(∓i) = −i`; so `σ(i) = −i`, `σ(a+bi) = a−bi` for `a,b ∈ F = τ(ℝ)`; `F ≅ ℝ` real closed, `ℂ = F(i)` | as stated |
| §0.2 Check 4, symmetry and involution | `h(x,y) = σ(x₁)y₁ + σ(x₂)y₂` | `h(y,x) = σ(y₁)x₁ + σ(y₂)x₂ = σ(h(x,y))`; `h(x,·) = 0 ⇒ x = 0`; `y ↦ h(·,y)` is a linear bijection onto the `σ`-semilinear functionals, so `dim X⊥ = 2 − dim X`; `X ⊆ X⊥⊥` by symmetry, equality by dimension | order-reversing involution |
| §0.2 Check 4, trivial intersection | `x_j = a_j + b_j i`, `a_j,b_j ∈ F` | `σ(x_j)x_j = (a_j − b_j i)(a_j + b_j i) = a_j² + b_j²`; a sum of squares in the ordered field `F` vanishes only when all terms do | `X ∩ X⊥ = 0` |
| §0.2 Check 4, point map | `S(x) = (−σ(x₂), σ(x₁))` | `h(x,Sx) = −σ(x₁)σ(x₂) + σ(x₂)σ(x₁) = 0`, so `ℂS(x) = (ℂx)⊥` (both lines); `S(cx) = σ(c)S(x)`, bijective | `σ`-semilinear |
| §0.2 Check 4, inner-product complement | Gram matrix `G` Hermitian positive, `⟨x,y⟩ = x̄ᵀGy` | `(ℂx)⊥ = {y : uᵀy = 0}`, `u = conj(Gx)`, `= ℂ(−u₂,u₁)`; `x ↦ (−u₂,u₁)` is conjugate-semilinear bijective | conj-semilinear |
| §0.2 Check 4, refutation | `projectiveCollineation_unique_scalar` with `K = ℂ`, `V = W = ℂ²`, rank `2 ≥ 2` | two semilinear bijections inducing the same point map have equal automorphisms: `σ = conj`, contradicting the choice; the Lean conclusion of `kakutaniMackey_complex` pulled back along `e` is an inner product on `ℂ²`, so the three hypotheses hold on `ℂ²` while the conclusion fails | `¬FiniteDimensional` necessary; Check sound |
| §0.2 Check 4, dimension one | `B = ℂ` | `ℂ ∩ perp(ℂ) = 0` forces `perp(ℂ) = 0`, then `perp(0) = perp(perp(ℂ)) = ℂ`; the usual inner product has this complement | holds trivially, as stated |
| §0.2 Check 4, real case | `Aut(ℝ) = {id}` | no involutive automorphism other than the identity exists; §0.3 (line 122) is stated for finite or infinite dimension with `3 ≤ rank` | consistent with §0.3 |
| §5.2 one-atom sentence (changed) | `ℂ²`; `ℂ ⊕ R_(II₁)` | `ℂ²`: atom `(1,0)`, type I; `ℂ ⊕ R`: atom `(1,0)`, the `R` summand has no abelian projection | "not a criterion on nonfactors" exact |
| §8.2 kernel prefactor (changed) | `4πit = 4π|t|e^(iπ sgn(t)/2)` | principal power `(4πit)^(−n/2) = (4π|t|)^(−n/2)e^(−inπ sgn(t)/4)`; `n = 1`, `t = 1`: `(4π)^(−1/2)e^(−iπ/4)`, the old formula | equals Teschl (7.30) line 7165 |
| §8.2 kernel hypotheses (changed) | Schwartz ψ vs Teschl's `L¹ ∩ L²` | `𝒮 ⊂ L¹ ∩ L²`; the `L²` extension is by unitarity (Teschl line 7169) | source supports statement |
| §8.2 general mass (changed) | `H₀ = −Δ/(2m)` | `e^(−itH₀) = e^(−i(t/(2m))(−Δ))` | `t ↦ t/(2m)` right |
| §8.2 Check 2, `n = 2` (new) | `ψ = e^(−|y|²)`, `t = 1`, `m = 1/2` | `ψ̂ = πe^(−π²|ξ|²)`; `F⁻¹[e^(−4π²i|ξ|²)ψ̂] = π·(π(1+4i))^(−1)e^(−|x|²/(1+4i)) = (1+4i)^(−1)e^(−|x|²/(1+4i))` | as stated |
| §8.2 Check 2, kernel integral (new) | per coordinate `∫exp(−(1−i/4)y² − (ix/2)y + ix²/4)dy` | `= √(4π/(4−i))·exp(−x²/(16(1−i/4)) + ix²/4) = √(4π/(4−i))exp(ix²/(4−i))`; squared: `(4π/(4−i))exp(i|x|²/(4−i))`; `(4πi)^(−1)·4π/(4−i) = 1/(4i+1)`; `i/(4−i) = (−1+4i)/17 = −1/(1+4i)` | reproduces `(1+4i)^(−1)e^(−|x|²/(1+4i))` |
| §8.2 Check 2, wrong prefactor (new) | `(4πi)^(−1/2)` on the same integral | modulus `√(4π)/√17` against the required `1/√17` | refutes `−1/2`, as the Check says |
| §9.3 `L²(ℝ³)` spectra (changed locator) | Teschl Thm 8.4, line 7512–7514 | `σ(L²) = {l(l+1) : l ∈ ℕ₀}`, `σ(L₃) = ℤ`, simultaneous eigenbasis, on `L²(ℝ³)` (7427–7430) | locator right |
| §9.3 `L²(S²)` multiplicity (changed) | Teschl Thm 10.7, line 9782–9794; R8.1 | eigenbasis `Y_l^m`, `|m| ≤ l`: `#{m} = 2l+1`; also `L₃Y = mY` gives `σ(L₃) = ℤ` on `L²(S²)`; R8.1 with `m = 2`: `C(d+2,2) − C(d,2) = ((d+2)(d+1) − d(d−1))/2 = 2d+1` | `2ℓ+1`, both routes agree |
| Downstream paragraph (changed) | RQFT d5f595e lines 35, 37, 242, 394, 1571, 3612, 3614, 3667, 3790, 3806 | needs: Fock interface at RQFT2/3/10; Kummer/Tricomi at RQFT9; Schrödinger comparison at RQFT0/1/9; `S_t` inequivalence at RQFT10; Whitehead `H¹` named at 1571 = NQS P.4 line 453 | paragraph accurate |
| §0.1 rank hypothesis (Check 1) | `ℙ ℝ ℝ²`, swap of `e₁`,`e₂` | a linear map fixing `e₁+e₂`, `e₁−e₂`, `e₁+2e₂` is scalar; the swap is not induced | sharp (table of the review at ccf4051) |
| §0.1 Check 2 | `diag(1,2,3)` on `ℙ ℝ ℝ³` | linear maps inducing the identity are scalars (test on `e₁,e₂,e₃,e₁+e₂+e₃`) | sound (table of the review at ccf4051) |
| §0.1 scalar uniqueness | `V = K`, `S = σ`, `S′ = σ′` | one point, both induce the identity with `σ ≠ σ′`; `2 ≤ rank` forces `σ = σ′` | `2 ≤` right (table of the review at ccf4051) |
| §0.2 Pankov 3.16 vs Lean | hypotheses and conclusion | order reversal, involution, trivial intersection, `¬FiniteDimensional`; `v ∈ perp X ↔ e v ⊥ e(X)` | agree (table of the review at ccf4051) |
| §0.2 Check 3 | `J = diag(1,−1,1,…)`, `X⊥ = (JX)ᗮ` | `⟨J(e₁+e₂),e₁+e₂⟩ = 1−1 = 0` | trivial intersection needed (table of the review at ccf4051) |
| §0.3 dimension two (Check 1) | discontinuous fixed-point-free involution of `ℙ¹` | inner-product involutions are conjugate to `θ ↦ θ+π/2` | fails, rank sharp (table of the review at ccf4051) |
| §0.5 Check 3 | `x^(k) = (1,…,1,0,…)` | `‖x^(k)−x^(l)‖² = |k−l|`; coordinatewise limit `(1,1,…) ∉ ℓ²` | topologies differ (table of the review at ccf4051) |
| §0.5 normability | `ℝ^ℕ` | a norm ball contains `{|x_1|,…,|x_k| < ε} ⊇ ℝe_(k+1)` | not normable (table of the review at ccf4051) |
| §1.4 wreath law | `p = id`, `q = (12)`, `e = (1,0)`, `f = (0,0)`, `i = 1` | `(p,e)(q,f)(1,b) = (2, b + 0 + e₂) = (2,b)`; the wrong law gives `(2,b+1)` | formula right (table of the review at ccf4051) |
| §1.4 `MO₂ ⊂ P(M₂(ℂ))` | `p = diag(1,0)`, `q = ½[[1,1],[1,1]]` | `p∧q = 0`, `p∨q = 1`; a state with `ω(p) = 1` has `ρ = p`, `ω(q) = ½ ≠ 0` | vertex not normal (table of the review at ccf4051) |
| §1.5 Check 2 | `w ∈ [1/10,1/5]` | `w ≤ 1−w` gives `(1,0) ≤_M (0,1)`; at `w = 1`, `1 ≤ 0` false | not order-determining (table of the review at ccf4051) |
| §1.5 Check 3 | `w ∈ [1/4,3/4]` | `m_w(−1,3) = 3−4w ≥ 0`; `sup|2w−1| = 1/2 < 1`; `m_w((1,−1)²) = 1 ≠ 1/4` | sound (table of the review at ccf4051) |
| §1.5 norming ⇔ order-determining | `z` with `m(z) ≥ 0` on `M`, `c = ‖z‖` | `c−m(z) ∈ [0,c]`, `‖c1−z‖ ≤ c`, `φ(z) ≥ c − ‖c1−z‖ ≥ 0`; converse `−r1 ≤ x ≤ r1` gives `‖x‖ ≤ r` | sound (table of the review at ccf4051) |
| §1.6 Peirce lemma | `x ≥ 0`, `U_px = 0` | `U_(sp+p′)x = s·x_(1/2) + x_0 ≥ 0` for all `s`; `s → ±∞` gives `±x_(1/2) ≥ 0` | `x_(1/2) = 0` (table of the review at ccf4051) |
| §1.6 Check 2 | `a = σ_x`, `b = diag(1,0)` | `aba = diag(0,1) ≥ 0` | sound (table of the review at ccf4051) |
| §1.6 Check 3 | `x = σ_x`, `y = σ_z` | `(x±y)² = 2·1`, `x∘ₛy = 0`; `x∘ₚy = ½(2−1−1) = 0`; `xy = −iσ_y ≠ yx` | sound (table of the review at ccf4051) |
| §1.6 Iochum–Loupias locators | lines 133, 149, 473, 492 | I.4 bilinearity/continuity/`‖1‖=1`; I.5 power-associativity from `A²·A² = A⁴`; V.1 JB; V.3 bilinear case | agree (table of the review at ccf4051) |
| §2.1 Check 1 | `ρ = ½(1+r·σ)`, `E = ½(1+½σ_x)` | `Tr(ρE_±) = (1±r₃)/2`; `E² = ¼(5/4 + σ_x) ≠ E` | sound (table of the review at ccf4051) |
| §2.1 Check 2, trine | `E_k = (2/3)|v_k⟩⟨v_k|`, `|⟨v_j,v_k⟩| = 1/2` | a PVM term with positive weight is `≤ E_k`, so `Q_k ∈ {0,|v_k⟩⟨v_k|}`; `ΣQ_k = 1` needs two orthogonal `v`'s | not a mixture of PVMs (table of the review at ccf4051) |
| §2.1 Check 3 | `E(S) = Σ_(n∈S)e_ne_n*` on `ℓ²` | `‖E({n})‖ = 1` for all `n`, norm series diverges | weak-operator additivity only (table of the review at ccf4051) |
| §2.2 trine dilation (Check 1) | `Vξ = (√(2/3)⟨v_k,ξ⟩)_k` | `V*V = (2/3)Σ|v_k⟩⟨v_k| = 1`; `V*Q_kV = E_k`; `Σ rank E_k = 3` | sound (table of the review at ccf4051) |
| §2.2 minimal `m` | `E_i = (Q_iV)*(Q_iV)` | `rank E_i = rank(Q_iV)`, `dim K = Σ rank(Q_iV) ≤ n·outcomes` | bound right (table of the review at ccf4051) |
| `naimark_dilation_finite` degenerate | `n = 0`; `outcomes = 0`, `n ≥ 1` | `m = 0` works; `FinitePOVM` empty (`Σ_∅ = 0 ≠ 1`) | not false (table of the review at ccf4051) |
| §2.3 Check 1 | `E₁ = diag(1,½,0)`, `I₁(ρ) = Tr(E₁ρ)|e₁⟩⟨e₁|` | `I₁∘I₁ = I₁` (`Tr(E₁|e₁⟩⟨e₁|) = 1`), `I₂∘I₁ = 0`, `E₁+E₂ = 1`, `E₁² ≠ E₁` | strong repeatability, not sharp (table of the review at ccf4051) |
| §2.3 Check 2 | `ψ = (e₁+e₂)/√2` | `P₁ρP₁+P₂ρP₂ = ½·1 ≠ ρ = P({1,2})ρP({1,2})` | not additive (table of the review at ccf4051) |
| §3.1 Check 2 | `ψ = Σ2^(−n/2)e_n` | `‖ψ‖² = Σ2^(−n) = 1`, `m_ψ(ℂe_n) = 2^(−n)` | sound (table of the review at ccf4051) |
| §3.3 Checks | `ρ = Σ2^(−n)e_ne_n*` | `‖ρ − Σ_(n≤N)‖₁ = 2^(−N)`; Layer 3 Example `m(ℂψ) = Σ4^(−n) = 1/3` | sound (table of the review at ccf4051) |
| §3.2 Check 4 | `a ≰ b`, unit `ψ ∈ ran a`, `‖bψ‖ < 1` | `Tr(ρ_ε(a−b)) = (1−ε)(1−‖bψ‖²) + ε(Tr a − Tr b)/3 > 0` for small `ε` | full proper subfamily (table of the review at ccf4051) |
| §4.1 Checks 1–2 | `ψ = (1+|x|)^(−2)/c`, `(1+|x|)^(−1)/c` | `|ψ|² ~ x^(−4)`: `∫x² < ∞`, `∫x⁴ = ∞`; `|ψ|² ~ x^(−2)`: `∫|x| = ∞` | domains as stated (table of the review at ccf4051) |
| §4.1 Check 3 | `A = σ_z`, `ψ = (e₁+e₂)/√2` | law `(δ₁+δ₋₁)/2`, mean `0`, variance `1`, `A²` law `δ₁` | sound (table of the review at ccf4051) |
| §4.2 Teschl 8.2 | line 7377–7396 | `ψ ∈ D(AB)∩D(BA)`, `≥ ½|E_ψ([A,B])|`, equality needs `Re z = 0` | agree (table of the review at ccf4051) |
| §4.2 Check 1 | `ψ = (2πσ²)^(−1/4)e^(−x²/(4σ²))` | `ΔQ = σ`, `Pψ = (ix/(2σ²))ψ`, `ΔP = 1/(2σ)`, product `1/2` | sound (table of the review at ccf4051) |
| §4.2 Check 2 | `‖ψ‖ = 1/2` | `|⟨ψ,[Q,P]ψ⟩| = ‖ψ‖² = 1/4`, bound `1/8` | homogeneous form right (table of the review at ccf4051) |
| §4.2 Check 3 | `σ_x,σ_y`, `ψ = e₁` | `[σ_x,σ_y] = 2iσ_z`, `½|2i| = 1`, `ΔA = ΔB = 1`, `σ_ye₁ = ie₂ = i·σ_xe₁` | equality, `μ = 1` (table of the review at ccf4051) |
| §4.2 real proportionality | `B̂ψ = zÂψ`, `z ∈ ℝ∖0` | `Im⟨Âψ,B̂ψ⟩ = 0` while `ΔAΔB = |z|‖Âψ‖² > 0` | not sufficient (table of the review at ccf4051) |
| §4.3 Check 1 | `H = σ_z`, `A = σ_x` | `e^(itσ_z)σ_xe^(−itσ_z) = [[0,e^(2it)],[e^(−2it),0]] = cos2t σ_x − sin2t σ_y`; derivative `−2σ_y = i[σ_z,σ_x]` | sign right (table of the review at ccf4051) |
| §4.5 first-moment lemma | bands `|t| ≥ 2^(2n)`, weights `2^(−n)` | `Σ2^(−n)2^(2n) = Σ2^n = ∞`, `Σ2^(−n) = 1` | sound (table of the review at ccf4051) |
| §4.5 Check 2 | `T = diag(1,2)` | `Tr(ρT) ≤ 2`; polarization recovers `⟨e₁,Te₂⟩ = 0`, `1`, `2` | sound (table of the review at ccf4051) |
| §5.1 Check 2 | `M = M₂(ℂ)⊕ℂ` | `P(M) = P(ℂ²)×{0,1}`; state space `conv(B³ ∪ {pt})` | sound (table of the review at ccf4051) |
| §5.1 Check 3 | `K(H)+ℂ1`, projection onto `span{e_(2n)}` | infinite rank and corank, not compact plus scalar | `≠ B(H)` (table of the review at ccf4051) |
| §5.3 bracket identity | `a = σ_z`, `b = σ_x`, `c = σ_z` | `[L_a,L_b]c = ¼[[a,b],c] = ¼[2iσ_y,σ_z] = −σ_x`; `[ψ_a,ψ_b]c = −¼[[a,b],c] = +σ_x` | opposite signs as stated (table of the review at ccf4051) |
| §5.3 Check 1 | `ψ_a(b) = (i/2)[σ_z,σ_x]` | `= (i/2)(2iσ_y) = −σ_y`; `a·b = 0 − i(−σ_y) = iσ_y = σ_zσ_x` | associative product (table of the review at ccf4051) |
| §5.4 Check 1 | `p = (1+σ_z)/2` | `(U_p+U_(p′))` keeps the diagonal: `(x,y,z) ↦ (0,0,z)`; `2(…)−I`: `(−x,−y,z)` | half-turn about `z` (table of the review at ccf4051) |
| §5.4 Check 2 | `J(a) = Tr(a)I − a` | `J(σ_x)J(σ_y) = iσ_z`, `J(iσ_z) = −iσ_z`; `σ_yσ_xᵀσ_y = −σ_x`, `σ_y(−σ_y)σ_y = −σ_y`, `σ_yσ_zσ_y = −σ_z` | `= Ad(σ_y)∘ᵀ`, not multiplicative (table of the review at ccf4051) |
| §5.5 Check 2 | `Φ(x)(y) = xy + yx*`, `x = i·1` | `iy − iy = 0`; `x = σ_z`: `e^(tσ_z)ye^(tσ_z) ≥ 0` for `y ≥ 0` | kernel and positivity (table of the review at ccf4051) |
| §5.5 Check 3 | `Φ(σ_z) ∓ iΦ(iσ_z)` | `Φ(iσ_z)(y) = i[σ_z,y]`; `Φ(σ_z)−iΦ(iσ_z) = 2σ_z·`, `Φ(σ_z)+iΦ(iσ_z) = 2·σ_z` (right) | `M_(I_M) = M`, `M_(−I_M) = M′` (table of the review at ccf4051) |
| §5.6 Bloch pullback (Check 2) | `φ(n) = (x,y,2z)/‖·‖`, Born state `r` | `n ↦ (1+r·φ(n))/2` is not affine in `n`; V12.J.Bloch line 3610: disagrees at `n = (1/√2,0,1/√2)` | frame function, not normal (table of the review at ccf4051) |
| §5.6 Check 3 | `(x,y) ↦ (x,yᵀ)` on `M₃⊕M₃` | `(e₁₂,e₁₂)(e₂₃,e₂₃) ↦ (e₁₃,e₃₁)`; images multiply to `(e₁₃,0)`, antimultiply to `(0,e₃₁)` | neither (table of the review at ccf4051) |
| §5.7 Check 1 | HS space, `J(y) = y*`, `R_z` | `JR_z*J = L_z`; `W(y) = yᵀ` has `WR_zW⁻¹ = L_(zᵀ)`; `A = WJ: y ↦ ȳ`, `Ax*A⁻¹ = L_(xᵀ)` | sound (table of the review at ccf4051) |
| §6.2 dimensions (Check 1) | `dim H = 2`, `n = 3` | `dim Sym³ = C(4,3) = 4`, `Λ³ = 0`, `8−4 = 4` | sound (table of the review at ccf4051) |
| §6.2 `n = 0,1` | NQS P.6 line 557–560 | `P₊ = P₋ = Id`; `P₋ = Id−P₊` would give `Λ¹ = 0` | matches P.6's Check (table of the review at ccf4051) |
| §6.3 Check 2 | `c_n = 1/(n+1)`, `(n+1)^(−3/2)` | `Σn/(n+1)² = ∞`; `Σn(n+1)^(−3) < ∞`, `Σn²(n+1)^(−3) = ∞` | domains as stated (table of the review at ccf4051) |
| §6.4 field bound (Check 2) | `ψ = e`, `f−g = e` | `Φ(e)e = (Ω+√2e⊗e)/√2`, norm `√(3/2) ≤ √2·√2 = 2`; coefficient `1/√2` gives `1 < √(3/2)` | bound right, `1/√2` false (table of the review at ccf4051) |
| §6.4 translation conjugation | `W(f)W(sh)W(f)*`, D8's sign | `= e^(−is Im⟨f,h⟩)W(sh)`; `f = ith`: `Im⟨ith,h⟩ = −t‖h‖²` | `Φ(h)+t‖h‖²` (table of the review at ccf4051) |
| §6.4 bounded-calculus identity | `W = e^(iΦ)` | `‖(W−1)ψ‖² = ∫(2−2cosλ)dμ`, `‖(W+1)ψ‖² = ∫(2+2cosλ)dμ`, sum `4‖ψ‖²` | sound (table of the review at ccf4051) |
| §6.5 Check 1 | `(ξ−∂)He_n` | `= ξHe_n − nHe_(n−1) = He_(n+1)` | sound (table of the review at ccf4051) |
| §6.5 Check 2 | `α = (1,1)` | `‖ξ₀ξ₁‖_(L²(γ)) = 1`; `a†(e₀)a†(e₁)Ω = √2P_s(e₀⊗e₁)`, `‖P_s(e₀⊗e₁)‖² = ½` | both norm `1` (table of the review at ccf4051) |
| §6.5 transported fields | `Φ(ie_i) = (−ia(e_i)+ia†(e_i))/√2` | `↦ i(ξ−∂−∂)/√2 = i(ξ−2∂)/√2` | formula right (table of the review at ccf4051) |
| §6.6 nonregular multiplier (Check 1) | `W₊(q,p)W₊(q′,p′)e_x` | phase exponent difference `pq′ − pq′/2 − p′q/2 = (pq′−p′q)/2` | `exp(+iB/2)` (table of the review at ccf4051) |
| §6.6 Schrödinger sign (Check 2) | `W(q,p)ψ(x) = e^(ip(x+q/2))ψ(x+q)` | direct: phase difference `(p′q−pq′)/2 = −B/2`; `W(q,0)W(0,p) = e^(ipq)W(0,p)W(q,0)` both ways | D8's sign (table of the review at ccf4051) |
| §6.6 Check 3 | `z = p+iq` | `Im((p−iq)(p′+iq′)) = pq′−qp′ = B` | sound (table of the review at ccf4051) |
| §6.7 Checks | `N = 1`; `Q = σ_z`, `P = σ_x` | `[a₁,a₁†] = |0⟩⟨0|−|1⟩⟨1| = 1−2|1⟩⟨1|`; `[σ_x,σ_z] = −2iσ_y`; `n|c| ≤ 2` fails at `n = 3` | sound (table of the review at ccf4051) |
| §7.1 Check 1 | swap of two antipodal pairs on `ℙ(ℂ²)` | `ℂe₁`–`ℂ(e₁+2e₂)`: `1/5 ↦ 9/10` | not Wigner (table of the review at ccf4051) |
| §7.1 Check 3 | `V = A⁻¹U` antiunitary fixing rays | `Ve₁ = ce₁`, `Ve₂ = ce₂`, `V(e₁+ie₂) = c(e₁−ie₂) ∉ ℂ(e₁+ie₂)` | unitary ≠ antiunitary (table of the review at ccf4051) |
| §7.2 antiunitary rephasing | `U′_g = b(g)U_g` | `U′_gU′_h = b(g)(g·b(h))ω(g,h)U_(gh)`, `g·b = b^((−1)^ε(g))` | P.3's coboundary (table of the review at ccf4051) |
| §7.2 image criterion | spin class of SO(3) | continuous section of `E_ω → G` ⇔ globally continuous representative; `π₁(U(2)) = ℤ ≠ π₁(𝕋×SO(3))` | not in the image (table of the review at ccf4051) |
| §7.3 Check 1 | `I₁I₂`, `I₂I₁` | `(i/4)(−E₁₁+E₂₂)`, `(i/4)(E₁₁−E₂₂)`; `[I₁,I₂] = −I₃` | sound (table of the review at ccf4051) |
| §7.3 charges | `Q = H(1/3,−2/3)`, `I₃ = H(1/2,−1/2)` | weights `(1,0),(0,1),(−1,−1)` give `1/3,−2/3,1/3` and `1/2,−1/2,0` | sound (table of the review at ccf4051) |
| §7.3 Check 3 | `J_a = ℏ(1/i)dπ(I_a)` | `[J₁,J₂] = −ℏ²dπ(−I₃) = ℏ²dπ(I₃) = iℏJ₃` | sound (table of the review at ccf4051) |
| §8.1 adapter | `D_ℏg(p) = (2πℏ)^(−n/2)g(p/(2πℏ))` | `‖D_ℏg‖² = (2πℏ)^(−n)(2πℏ)^n‖g‖²`; `F_ℏψ(p) = (2πℏ)^(−n/2)(Fψ)(p/(2πℏ))` | unitary, `F_ℏ = D_ℏ∘F` (table of the review at ccf4051) |
| §8.1 Gaussian Check | `e^(−|x|²/2)` | `F`: `(2π)^(n/2)e^(−2π²|ξ|²)`; `D₁` of it: `e^(−|p|²/2)` | fixed by `F₁` only (table of the review at ccf4051) |
| §8.2 spectral measure | `ξ = rω`, `λ = 4π²r²` | `r^(n−1)dr = ½(2π)^(−n)λ^(n/2−1)dλ` | formula at 886 right (table of the review at ccf4051) |
| §8.2 Check 2 | `ψ = e^(−y²)`, `t = 1`, `n = 1` | `ψ̂ = √πe^(−π²ξ²)`; inverse of `e^(−4π²iξ²)ψ̂` is `(1+4i)^(−1/2)e^(−x²/(1+4i))` | sound in `n = 1` (table of the review at ccf4051) |
| §8.3 route | `h = conj(B*f)g − conj(f)Bg` | `ĥ(a) = ⟨f,BM_(χ_a)g⟩ − ⟨f,M_(χ_a)Bg⟩` | identity right (table of the review at ccf4051) |
| §8.3 Checks | `(−Δ)²`; `P` in `n = 1`; `1_({0})` | `λ²` not affine; `2πξ` odd; `ν({0}) = 0` | sound (table of the review at ccf4051) |
| §9.1 Check 2 | `s = s_z(θ)` | `e^(−iθσ_z/2)σ_xe^(iθσ_z/2) = cosθσ_x + sinθσ_y`; `R_s(1,0,0) = (cosθ,sinθ,0)` | covariance (table of the review at ccf4051) |
| §9.2 `H = 2N+1` | `a = (Q+iP)/√2` | `a†a = (Q²+P²+i[Q,P])/2 = (Q²+P²−1)/2` | sound (table of the review at ccf4051) |
| §9.2 Checks 1–3 | `e₀,e₁,h₁`; `a_n = 1/(λ−2n−1)` | `‖e₁‖² = 2√π`; `a†h₀ = √2xh₀ = h₁`; `(2n+1)a_n → −1 ∉ ℓ²` | sound (table of the review at ccf4051) |
| §9.3 Checks | `Y_10`, `Y_(2,±2)`; `[L_x,L_y]` | `(3/4π)·2π·(2/3) = 1`; `(15/16)(16/15) = 1`; `−iyP_x + ixP_y = iL_z` | sound (table of the review at ccf4051) |
| §9.4 recurrence for every `b` | `c_k = (a)_k/(k!Γ(b+k))` | `(k+1)(k+b)c_(k+1) = (k+a)c_k` ⇔ `(k+b)/Γ(b+k+1) = 1/Γ(b+k)`, true as entire functions | Kummer equation for all `a,b` (table of the review at ccf4051) |
| §9.4 Check 3 | `b = −1`, `a = 1` | `c₀ = c₁ = 0`, `c₂ = 1`, `ℳ = z²e^z`: `z(2+4z+z²) − (1+z)(2z+z²) − z² = 0`; `k = 1`: `0 = 2c₁ = −2c₀` | sound (table of the review at ccf4051) |
| §9.5 Kummer reduction | `u = e^(−βr)(2βr)^(ℓ+1)w(2βr)` | `xw″ + (2ℓ+2−x)w′ − (ℓ+1+μα/β)w = 0`; bound states `a = −n_r`, `β = 1/n`, `E = −μα²/(2n²)` for `μ = 1`, `α = −1` | sound (table of the review at ccf4051) |
| §9.5 Wronskian | `W_x(φ,ψ) = e^(−x)x^bΓ(b)W(𝐌,U)` | `= −Γ(2ℓ+2)/Γ(a)`; `W_r = 2β·W_x = −2βΓ(2ℓ+2)/Γ(a_z)` | formula right (table of the review at ccf4051) |
| §9.5 boundary values at `α = 0`, `ℓ = 0` | `U(1,2,x) = 1/x`, `M(1,2,x) = (e^x−1)/x` | `ψ_z = e^(−βr) → e^(ikr) = H₀⁺(0,kr)`; `φ_z = 2sinh(βr)`; kernel `(2μ/k)sin(kr_<)e^(ikr_>)`, imaginary part `/π` `= (2μ/(πk))sin(kr)sin(ks)` | jump formula right (table of the review at ccf4051) |
| §9.5 Check 1, 3 | `μ = ½`, `α = −1`; `η = 0` | `−1/(4n²)`, multiplicities `1`, `4`; `F₀(0,ρ) = ρe^(iρ)(e^(−2iρ)−1)/(−2iρ) = sinρ` | sound (table of the review at ccf4051) |
| §9.6 Checks | `(−1)ⁿ`, `1−1/n²`, `1−1/n` | tails alternate; `Σ1/n² < ∞`; `∏(1−1/n) → 0` | matches V2 695–720 (table of the review at ccf4051) |
| §9.7 Checks | `n = 1`; `σ_x,σ_y`; slit plane | `[−i∂,M_f] = −if′`; eigenvalues `±2π|ξ|`; Euclidean `2ε`, intrinsic `≥ 2` | sound (table of the review at ccf4051) |
| §9.8 Check 1 | `ω = q₂p₁−q₁p₂`, `B = p₂q₁−q₂p₁` | `ω = −B` | sign dictionary right (table of the review at ccf4051) |
| §9.8 Check 2 (changed) | `c_f(g₂,g₁)` vs `τ(g₂,g₁)` | `τ(g₂,g₁) = v₂·R₂a₁ + (t₁/2)|v₂|²`; `c_f = −v₂·R₂a₁ − σ₁|v₂|²/2 = −τ(g₂,g₁)` at `σ₁ = t₁` | order and sign, as stated (table of the review at ccf4051) |
| §9.9 (restored) | `S_t = cosh t + sinh t·C` | `Im⟨S_tx,S_ty⟩ = (cosh²−sinh²)Im⟨x,y⟩`; `S_tS_s = S_(t+s)` by `C² = 1`; column energy `d·sinh²t` | sound (table of the review at ccf4051) |
| `uhlhorn` two-sidedness | `hf` | `IsOrthogonal (f x) (f y) ↔ IsOrthogonal x y` for all `x,y` | Uhlhorn's hypothesis (table of the review at ccf4051) |
| `regularizedHGFun_kummer_equation` | `a = 0` | `ℳ = 1/Γ(b)` constant, `0+0−0 = 0` | consistent (table of the review at ccf4051) |

Ownership and the sample. The seeded sample (§0.4, §3.3, §6.1, §6.3, §6.4, §6.5, §6.7, §7.3, §8.1, §8.3, §9.1, §9.2, §9.3, §9.4, §9.9) meets the change set only at §9.3, checked above; the other sampled sections are untouched since the full reviews at d682450, 85584d9 and ccf4051, which verified them against Pulmannová, Pankov, Connes, Iochum–Loupias, Gehér, Hairer, the DLMF chapters and Teschl at the locators recorded there. The change set introduces no new object, supplier citation or Lean declaration, so the ownership search of the previous review (by object, over main 929496d, the board's packages and the `roadmaps grep` index of 440 open pull requests) stands; ownership against open pull requests whose files the brief does not give was checked only through that index. VonNeumannAlgebras remains carried by two open pull requests (#889 at dee8088, whose V-labels this README cites, and #1041 at d9e53b3), recorded as before.

## Not verifiable

- Alfsen–Shultz 1978 and 1998, Alfsen–Shultz–Størmer 1978, Iochum–Shultz 1983, Davies–Lewis 1970, Łuczak–Podsędkowska 2015, Gudder–Boyce 1970: settled uncertified in the manifest; cited by locator, untouched by this change.
- Kakutani–Mackey 1944 (Theorems 1–2, cited at §0.3), Ozawa 1984, Segal 1947, Uhlhorn 1963: paywalled (JSTOR, AIP). The new §0.2 Check relies on no source: every step is computed above.
- Artin, Paulsen, Janson, Mackey 1963, Davies 1976, Reed–Simon: books without an open copy, cited for standard facts, untouched.

## Source issues

- none
