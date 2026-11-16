# Review of SchrodingerOperatorsAndSpectralTypes (pull request #2424 at 9710150)

**Verdict:** accepted

## Verified sound

| Target | Instances tried | Statement side (computed) | Other side (computed) | Result |
|---|---|---|---|---|
| 1.1 `IsSpectralMeasureOf` (sample) | `A = 2` on `ℂ` with `δ₂`, `δ₃` at `z = i`; `A = i` at `z = 2i` | `(i − 2)⁻¹ = (−2 − i)/5`; `R_A(2i) = −i` | `δ₃`: `(−3 − i)/10`; `Im (2i − s)⁻¹ = −2/(s² + 4) ∈ [−1/2, 0)`, never `−1` | holds; kernel `(z − s)⁻¹` has `Im < 0` on both sides |
| 1.2 `diag_spectralType_components` (sample) | `M_x ⊕ 1/2`, `f = (1, 1)`; cross terms for types ac/sc/pp | `μ_f = Leb|[0,1] + δ_{1/2}`; atoms `{1/2}` | restrict to atoms `δ_{1/2}`; `|μ_{f,g}(B)|² ≤ μ_f(B)μ_g(B)` kills cross terms on a null carrier | holds; hypotheses force the three vectors into orthogonal invariant subspaces |
| 1.4 `acSpectrum`, `perfect_acSpectrum_and_mem_iff` (sample) | `ℋ = 0`; `diag(q_n)`; isolated `t`; annuli `J_m` | `∅` is perfect; `σ_ac = ∅`; ac `μ_f({t}) = 0` so mass sits on `I_ε ∖ {t}` | `⋃_{m ≥ n} J_m = I_{1/n} ∖ {t}`, disjoint, so one `f = Σ c_k g_k` works | holds |
| 1.5 `Icc_subset_acSpectrum_iff` (sample) | `a = b`, `P` of `A = 0`; `M_x` on `L²([0,1] ∪ [2,3])` | `a = b`: left false (`σ_ac = ∅`) | right vacuous, true; with `a < b`: `(1,2)` has mass `0`, `(0,1)` mass `> 0` | holds for `a < b`; teschl line 4326, Lemma 3.15, p. 104 |
| 1.6 `minMax_principle` | `ℋ = 0`; `diag(1,3,5)`, `c = 4`; `0` on `ℓ²`; padding obstacles by `0` | values `⊤`; `(1,3,5,⊤)`, count `2`; all `0`, `Σ = 0` | finrank `0`; `2`; no `c < 0` charged, count `0 = 0` | holds; teschl line 5044, Theorem 4.10 |
| 1.7 wave operators (sample) | `H₁ = H₂`; `0`, `1` on `ℂ`; Hardy space under `e^{−isx}` | `Ω = 1`; `e^{it}ψ` converges iff `ψ = 0` | Fourier support moves to `[−s/2π, ∞)`: invariant iff `s ≤ 0` | holds; teschl lines 10585–10620 |
| 1.8 Rosenblum's lemma | `M_λ`, `x = m·1_{[0,1]}`, rank-one `C`; `|λ|^{−1/4}1_{[−1,1]}` | `∫|⟨φ, e^{−itλ}x⟩|² dt = 2πm²`; tail `∫_{|λ|<m⁻⁴}|λ|^{−1/2} = 4/m²` | bound `2πm²·1`; kato57 line 96 has `2πm²‖A‖²` | equality; factor `2π` right |
| 1.9 `pearson_tendsto` | `J = 0`; inclusion `L² → L² ⊕ ℂ`, `H₂ = M_x ⊕ 5`; direct-sum reduction | `C = 0`, limit `0`; `⟨xψ₁, φ⟩ − ⟨ψ₁, xφ⟩ = 0`, vectors constant `Jx` | reduction: `⟨H₂ψ₂, Jφ₁⟩ − ⟨ψ₂, JH₁φ₁⟩ = ⟨ψ₂, Cφ₁⟩` | holds; yafaev04 line 193, Theorem 1.8 |
| 1.9 `katoRosenblum` | `V = 0` on `diag(1,2)`; `diag(1/n²)`, `V = −diag(1/n²)`; `M_x + c` | ac subspaces `0`, all clauses vacuous or `∅ = ∅` | `e^{itc}` has no limit: `c·1` is not trace class, excluded | holds; kato57 lines 21–35 |
| 2.2 bounded perturbations (sample) | `A = diag(0,1)`, `V = diag(1,−1)`; `V = c` | `λ₀(A + V) = 0` | bounds `0 + (−1) ≤ 0 ≤ 0 + 1`; `c`: equality both sides | holds; teschl line 5704, Theorem 6.4 |
| 2.3 `katoRellich_lowerBound_hasCore` | `a = 1, b = 1/2, γ = 0`; `b = 0`; scalar `A = λ`, `V = −(a + b|λ|)` | bound `−2`; bound `γ − a`; `sup_{λ ≥ γ} |λ|/(λ − μ) = max(1, |γ|/d)` | `a/d + b·max(1, |γ|/d) < 1` iff `d > max(a/(1 − b), a + b|γ|)` | holds; teschl line 5709–5711 prints `b/(a − 1)` |
| 3.1 `complexLaplacian` (sample) | `yˢ` on `ℍ`; `e^{inθ}` | `−y²·s(s − 1)y^{s−2} = s(1 − s)yˢ`; `s = 2`: `−2y²` | Green: `2πn² = 2πn²`; without conjugation `0` | holds |
| 3.2 initial operator (sample) | `(0,1)`; discrete `X` | `−(e^{±x})'' = −e^{±x}`, both in `L²(0,1)` | deficiency `(2,2)`; discrete: `Δ₀ = 0` | holds; bms02 lines 151–157 |
| 3.3 maximal operator (sample) | `e^{−|x|}` on `ℝ` | `u'' = u − 2δ₀`, so `Δu = −u + 2δ₀ ∉ L²` | `u ∈ H¹` | holds; bms02 line 179, Theorem 2.3(i) at `V = 0` |
| 3.5 Gaffney cutoffs (sample) | step `φ`; `(0,1)` | rise `1` over `3/4`: slope `4/3 < 2`; `|grad χ_k| ≤ 2·(2/k)` | `(0,1)`: `1 ≤ (4/k)(1/2)` fails for `k > 2` | holds |
| 3.6 `gaffney_isSelfAdjoint_closure` (sample) | routes (a), (b) by Young; dimension `0`; `M = ∅` | (a) `∫χ²|du|² ≤ 2‖Δu‖‖u‖ + 4 sup|∇χ|²‖u‖²` | (b) `∫χ²|u|² ≤ sup|∇χ|²‖u‖² ≤ 16k⁻²‖u‖²`; `T = 0`, `w = 0` | holds; bms02 line 245, Corollary 2.10; connected at line 128 |
| 3.7 `exists_mem_domain_closure_eq_zero_iff` (sample) | `⊔ S¹_j`; a point; `ℝ` | `∫ conj(Δφ)·1_{X_j} = 0` per component | `λ₁⁺ = 1 ≠ 0 = λ₁`; point: `⊤ = ⊤`; `ℝ`: `0 = 0` | holds; hm23 lines 41–43 |
| 3.9 `laplacian_add_potential_isSelfAdjoint_closure` | circle, `V = 1_{[0,π)}`; one point; `M = ∅` | Rayleigh quotient of `1`: `1/2`; `T − T* = 2is·TT*` | `(1 − λ)u′(0) = −λu′(0)` gives `u′(0) = 0`; `i + i⁻¹ = 0`; `essInf` junk `0` on trivial space | holds |
| 3.10 `Ici_quarter_subset_essentialSpectrum` (sample) | `u_n = y^{1/2+it}ψ((log y − n)/n)` | `−(∂_r² − ∂_r)(e^{r/2}f) = e^{r/2}(1/4 − ∂_r²)f`; `‖u_n‖² = wn‖ψ‖²` | residual `−y^{1/2+it}(2itψ′/n + ψ″/n²)`; `3·2^j < 2^{j+2}` | holds; lp80 lines 251–256 |
| 3.10 `IsStandardCuspEnd`, `cuspRegion` | `Γ₀(2)` matrix `(1,−1;2,−1)`; `Γ(2)` | `det = 1`, trace `0`, fixed point `2z² − 2z + 1 = 0`, `z = (1 + i)/2` | area `6·π/3 = 2π`; `∫_a^∞ y^{2Re s − 2}dy < ∞` iff `Re s < 1/2` | holds |
| 4.1 `H²` descriptions | Gaussian, `d = 1` | `‖u″‖² = (3π² − 4π² + 4π²)/√2 = 3π²/√2` | `‖ξ²𝓕u‖² = 3/(16π²√2)`; ratio `16π⁴` | holds |
| 4.2 free Laplacian | Gaussian, `d = 1` | density `2·e^{−λ/(2π)}/(4π√λ)`, mass `Γ(1/2)(2π)^{1/2}/(2π) = 2^{−1/2}` | `‖ψ‖² = 2^{−1/2}`; `q(u) = 4π²/(4π√2) = π/√2` | holds; agrees with QuantumFoundations §8.2 at `n = 1` |
| 4.3 local compactness | scalar identity at `s`; sign slip at `s = 0` | `(s + 1)⁻¹(1 + (1 + i)/(s − i)) = (s − i)⁻¹` | bracket modulus `(s + 1)/√(s² + 1) ≤ √2`; slip gives `2 − i` | holds; teschl line 7213, Lemma 7.11, p. 170 |
| 4.4 `schrodinger_isSelfAdjoint_closure` (sample) | `V = −1_{[−1,1]}`, `d = 1`; `V = 1`; `d = 0` | `k = 0.739`: `k tan k = 0.6735` | `√(1 − k²) = 0.6737`, `E ≈ −0.454 ∈ [−1, 0)`; `σ_ess = [1, ∞)`; `d = 0`: `∅` | holds; teschl line 9578, Theorem 10.2, p. 222 |
| 4.5 quasi-periodic potentials (sample) | `ω = (1, √2)`; `V_{±e₁} = i` | `cos x + cos √2x`, `|V| ≤ 2` | `−2` needs `(2a + 1)√2 = 2b + 1`, impossible; `2i cos x` not real | holds; kps26 lines 26–39, 47–50 |
| `essentialSpectrum` | `0` on `ℂ`; `0` on `ℓ²` | `∅`; `{0}` | unfolds to UnboundedOperators `Suggested.lean` lines 168–178, another namespace | holds |

- Previous R01: repaired. The description now reads "section 4.4 extends them to bounded real potentials on every `ℝ^d`, `d ≥ 1` … while unbounded potentials in `L²(ℝ³) + L^∞(ℝ³)` stay with UO-E06", which is README lines 127–133.
- Previous R02: repaired. The description now names QuantumFoundations §8.2 and AutomorphicSpectralTheory §0.8 as the open suppliers, calls CongruenceSpectralGap, AutomorphicSpectralTheory §1.16a and MaassForms comparisons, and says no roadmap is named as a consumer; `roadmaps grep` finds no roadmap citing this one.
- Source locators checked against the cached text: 44 line ranges (teschl 24, bms02 4, yafaev04 4, lp80 3, hm23 3, kato57 2, kps26 2, rosenblum57 2), covering all 15 sampled targets; 11 Teschl printed pages match (42, 80, 96, 104, 116, 135, 145, 168, 170, 222, 247).
- Library declarations opened at the pins: 58. Examples: Tau Ceti `LinearPMap.IsRelativelyBounded` (`RelativeBound.lean:56`, `‖Vx‖ ≤ a‖x‖ + b‖Ax‖`), `LinearPMap.resolvent_sub_resolvent` (`Resolvent/Basic.lean:280`), `Manifold.instRiemannianBundleOpen` (`Restriction.lean:209`, a scoped instance), `StronglyContinuousGroup.complexGenerator` (`Group/Unitary.lean:249`); Mathlib `Measure.eq_singularPart` (`Lebesgue.lean:404`), `MemSobolev` (`Sobolev.lean:153`).
- Cross-roadmap citations: `roadmaps resolve` lists none missing. Read on main: UnboundedOperators §1.1, §1.2, §2.3, §3.1–§3.3 and its Lean file, with all 13 cited ids located. Read at open heads: QuantumFoundations §8.2, AutomorphicSpectralTheory §0.8. Headings located: AutomorphicSpectralTheory §1.16a, §§4.1–4.4, CongruenceSpectralGap §0.2, §0.6, MaassForms §0.1, HilbertModules H6, SmoothBundlesConnections B2.2, PseudodifferentialOperators P1.0, FuchsianOrbifolds Layer 3.
- Declared gaps `weyl-criterion` and `spectral-integral-resolvent`: same slugs, supplier and sections in `design/plan.json` and in the README. UO-C02 uses Lemma 6.17 only inside its Fredholm proof, and UO-A02 inverts `z − A` only for `P_A`, so neither asks for something already stated. The acceptance is conditional on these two gaps.
- Gate: every check 0, OK. Dependency check: `depcheck: 241 roadmaps, 2261 edges, 0 problem(s)`. No change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 12 `sorry` warnings and nothing else. `#check @` on all 19 declarations: no lost binder. `first | rfl | (simp; done) | infer_instance` closes none of the 12 theorems. The three clauses the docstring names as not statable match the README.

Overlap check: read UnboundedOperators, VariationalMethods, SelfAdjointSpectralTheory (main), CongruenceSpectralGap, QuantumFoundations, AutomorphicSpectralTheory, SchattenClassesAndSchurMultipliers (open). Shared objects and owners: essential spectrum, UnboundedOperators UO-C02; type subspaces, UO-C03; free Laplacian, QuantumFoundations §8.2; Hilbert–Schmidt kernels, AutomorphicSpectralTheory §0.8; congruence-quotient Laplacian, CongruenceSpectralGap §0.2 (a special case); compact-pair min–max, VariationalMethods 4.4 (a different object). No other roadmap states Kato–Rosenblum, Pearson's theorem, the Gaffney–Chernoff–Strichartz theorem or the cusp threshold.

Source independence: 22 passages compared with 8 sources, none shared; largest share teschl, 37 of 94 locators; contents compared with teschl: independent (Layer 1 draws on its Ch. 2, 3, 4 and 12, Layer 3 has no counterpart, Layer 4's order is forced by its *Needs:* lines).

## Not verifiable

- `strichartz83` Theorem 2.4, `chernoff73`, `gaffney54` (3.5, 3.6): settled as uncertified; locator only.
- `grigoryan09` Ch. 3, 4, 11; `chavel84` Ch. I; `iwaniec02` Ch. 4, 7, 11; `lp76` Ch. 1, 8: settled as uncertified.
- `rs1` §VII.2; `rs2` Ch. IX, §X.1, §X.2, Theorem X.12; `rs3` §XI.3, Theorems XI.7–XI.8; `kato76` Ch. V §4.1, Ch. X §4.4; `pearson78`; `cfks87` Ch. 1: settled as uncertified.
- `rosenblum57` §§3–4 and `lp80` §§4–7: cited as whole sections; only the lines listed above were read.
- `kps26`: the cached text is OCR; the bar in `V_n = conj(V_{−n})` at (1.3) and the `≤` at (1.4) are not legible there, and the README's reading is the only one that makes `V` real.

## Source issues

- **Error** in teschl at Theorem 6.4, (6.3), p. 135: the source says the lower bound of `A + B` is `γ − max(a|γ| + b, b/(a − 1))`, whose second term is negative for `a < 1`; it should be `b/(1 − a)`, as the estimate in the proof of Lemma 6.3 gives; affects a stated result.

## For the human reviewers

- Merge coordination: the description's prose names QuantumFoundations (#1771, another author) as a supplier that must merge first, while its generated merge-order block ends "It depends on no other author's open pull request".
- Not tested: the 13 sources settled as uncertified (list under Not verifiable) were not compared for wording; they carry 28 of the 94 locators.
