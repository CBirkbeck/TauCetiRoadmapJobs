# Review of SchattenClassesAndSchurMultipliers (pull request #2421 at cc8b39d)

**Verdict:** accepted

No finding. The acceptance is conditional on the two declared supplier gaps (`sigma-finite-hilbert-schmidt-kernels`, `semifinite-martingale-bmo-interpolation`).

## Verified sound

| Target | Instance | Left side | Right side | Result |
|---|---|---|---|---|
| §1.1 extended gauge (sample) | identity of `ℓ²(ℕ)`; `diag(1/(j+1))`; rank-one projection `e` | `aₙ(1) = 1`, not compact: `‖1‖_p = ∞` for all `p ≤ ∞`; `‖diag‖₂² = π²/6`, `‖diag‖₁ = ∞` | OI-B80 gauge gives `‖1‖_∞ = 1`; `‖e‖_p = 1` (zero-indexed `a₀ = 1`) | sound; lafforgue-delasalle-2011 lines 174–179, cgpt-2023 lines 209–214 |
| §1.3 interpolation (sample) | `T(A) = Tr(A)E₁₁` on `M_n`, `p₀ = 1`, `p₁ = ∞`, `p_θ = 4` | `C₀ = 1`, `C₁ = n`, bound `n^{3/4}` | norm of `T` on `S₄ⁿ` is `n^{3/4}` (identity); exchanged exponents give `n^{1/4}` | sound; lafforgue-delasalle-2011 lines 246–252, cgpt-2023 line 486 |
| §1.4 completely bounded maps (sample) | transpose on `M₂`; `T` fixing `w₀ = diag(1/(j+1))`, zero on `S₁` | `‖t‖_∞ = 1`, `‖t‖_{cb,∞} = 2`, `‖t‖_{cb,2} = 1`; `‖T‖₁ = 0`, `‖T‖₂ = ∞`, `‖T‖_{4/3} ≥ 1` | flip unitary ↦ `2 ×` rank-one projection; `0^{1/2}·∞^{1/2} = 0 < 1`, so finiteness is needed; `‖T∘R‖₁ = ∞ > 0·∞` | sound; lafforgue-delasalle-2011 line 187 |
| §3.5 cb norm of a multiplier (sample) | `M = [[1,2],[2,1]]` | `(3/2)J − (1/2)vvᵀ = [[1,2],[2,1]]`; bound `3/2 + 1/2 = 2` at every level | `S_M(E₁₂) = 2E₁₂` | sound; lafforgue-delasalle-2011 line 254, lines 267–268 |
| §4.1 trace duality (sample) | `M = 1_{(1,2)}` on `{1,2}` | `Tr(S_M(A)B) = A₁₂B₂₁` | `Tr(A S_{M^t}(B)) = A₁₂B₂₁`; `Tr(A S_M(B)) = A₂₁B₁₂` | sound; lafforgue-delasalle-2011 lines 239–245 |
| §4.2 interpolation, monotonicity (sample) | triangular truncation on `M₂`; `p = 4` | `(S_M A)*(S_M A) = [[2,√2],[√2,3]]/3`, eigenvalues `4/3, 1/3`: norm `2/√3` at `p ∈ {1,∞}`, `1` at `p = 2` | bound `(2/√3)^{1/2} ≈ 1.0746` | sound; source line 249 exchanges `p`, `q` (Source issues) |
| §4.3 weak-* extension (sample) | `M = 1` and `M = 1_{x=y}` on `ℕ` | adjoint of `S_{M^t}` on `S₁` sends `1` to `1` in both | extension by `0` off the compacts sends `1` to `0` | sound; caspers-delasalle-2015 lines 28–34 |
| §6.3 finite Grothendieck–Haagerup (sample) | `[[1,2],[2,1]]`; `α = (1,i)/√2`, `β = (1,1)/√2`, `a = I`, `M = diag(1,i)` | `⟨ξ_j,η_k⟩ = 3/2 − v_jv_k/2`, `‖ξ_j‖² = ‖η_k‖² = 2`; `Σψ_{ij}M_{ij} = 1/2 + i·i/2 = 0` | `|M₁₂| = 2`; `⟨ᾱ, S_M(a)β⟩ = 0`, `⟨α, S_M(a)β⟩ = 1` | sound; pisier-grothendieck-2012 lines 781, 800, 3541 |
| §7.1 atomless measures (sample) | countable–cocountable measure; Lebesgue, `A = [0,2]`, `t = 1/2` | null singletons, whole space an atom, no set of measure `1/2` | ratio `(1/4)·2 = 1/2`; BochnerSpaces §7.5 states `tμ(A)` | sound; lafforgue-delasalle-2011 lines 487–488 |
| §7.2 equal-measure refinements (sample) | masses `(1,1,3,3)` and `(1,2,3,3)`, `𝒜 = {12 | 34}` | `(1,1,3,3)`: the four permutations preserve the measure | `(1,2,3,3)`: weights `(1,2,2,4)/9` against uniform `1/4` | sound; lafforgue-delasalle-2011 lines 489–501 |
| §7.3 and `schurNorm_eq_schurCbNorm_of_forall_not_isAtom` (sample, headline) | two copies of the countable–cocountable space; `μ = 0` | null singletons but `L² ≅ ℂ²`: multipliers of `M₂`, outside the theorem | `μ = 0`: both sides `0` | sound; lafforgue-delasalle-2011 line 505, cgpt-2023 line 231 |
| §9.1 Toeplitz symbols (sample) | translate rule; `m = cos(2π⟨a,·⟩)` | kernel of `V_t⁻¹S_{M_m}(V_tA)`: `m(x−t−y)k(x,y)` | `M_{m(·−t)}k`; `S(u⊗u*) = cu⊗(cu)* + su⊗(su)*`, norm `≥ ‖cu‖² → 1` | sound; cgpt-2023 lines 59–66 |
| §10.1 column and row BMO (sample) | `f(z) = z e` on `𝕋`, arc `[3/4,5/4)`; unit column, `N = 4` | variance `19/48 − 1/4 = 7/48`; arcs `[1−h,1+h)`: `1/4 − h/2 + h²/3` | column `(3/4)^{1/2} = 0.866`, row `2^{−1/2} = 0.707` (`diag(a) − aaᵀ` is real symmetric) | sound; mei-2007 lines 96–110, cgpt-2023 lines 246–263 |
| §10.4 BMO–`S₂` interpolation (sample) | `Ψ(z) = C_∞^{z−1}C₂^{−z}T(U|A|^{pz/2})`; `n = 0`, `Ψ = e^{−Rz}` | `‖Ψ(it)‖_BMO ≤ 1`, `‖Ψ(1+it)‖₂ ≤ 1`, `Ψ(2/p) = C_∞^{2/p−1}C₂^{−2/p}TA` | `n = 0`: `e^{−R/2} ≤ 4C e^{−R}` fails for large `R` | sound, on the declared gap; cgpt-2023 lines 313, 471–484 |
| §11.3 twisted multipliers (sample) | `M_c(x,ξ) = M(x,x−ξ)`; Toeplitz `M_m` | `M_c(x,x−y) = M(x,y)` | Toeplitz: `M_c(x,ξ) = m(ξ)`, independent of `x` | sound; cgpt-2023 lines 573, 595–608, 704–718 |
| `schurNorm_two_eq` | `μ = 0`; `[[1,2],[3,4]]` on `{1,2}` | `0`; supremum `4` at `E₂₂` | `eLpNorm M ∞ 0 = 0`; `‖M‖_∞ = 4`; level `m = 0` contributes `0`, `m = 1` the norm | sound |
| `schurNorm_eq_of_holderConjugate` | triangular truncation, `(p,q) = (1,∞)` | `2/√3` | `2/√3`; transpose `[[1,0],[1,1]]` also `2/√3` | sound |
| `schurNorm_interpolation` | `p₀ = p₁`; endpoint norms `(0, ∞)` | `hp` forces `p = p₀`, bound `N^{1−θ}N^θ = N` | `0^{1−θ}·∞^θ = 0` in `ℝ≥0∞`; a zero endpoint gives `M = 0` a.e., left side `0` | sound |
| `schurNorm_mono_of_abs_inv_sub_le` | `q = ∞` (`q⁻¹.toReal = 0`); triangular truncation | hypothesis `|1/p − 1/2| ≤ 1/2` holds for every `p` | chain `1 ≤ 1.0746 ≤ 2/√3` | sound |
| `schurNorm_of_posSemidef` | `[[2,1],[1,1]]`; empty `ι`; `[[1,2],[2,1]]` | `2` at `E₁₁`; zero space `0` | `⨆_j = 2`; empty supremum `0`; eigenvalue `−1`, norm `2 ≠ 1` | sound |
| `schurNorm_eq_haagerupNorm` | `cos(x−y)` on `ℝ`; factor norms `(0, ∞)` | `ξ = η = (e^{ix}, e^{−ix})/√2`, `⟨ξ(x),η(y)⟩ = cos(x−y)`, norms `1` | `|M(x,x)| = 1`; `0·∞ = 0` only when `ξ = 0` a.e., then `M = 0` | sound; lafforgue-delasalle-2011 lines 274–278 |
| `schurNorm_le_iff_of_continuous`, `schurCbNorm_le_iff_of_continuous` | `μ = δ₀ + δ₁`; repeated point; `μ = 0`; discrete `X`, `μ = δ_{x₀}` | `‖S_M‖_∞ = 2`; `μ = 0`: both sides true | norm of `[[1,2],[2,1]]`; repeated point gives an amplification, so `Injective` is needed; `N ≤ 2` gives `|M| ≤ C` on `supp²` | sound; lafforgue-delasalle-2011 line 528 ("finite subset") |
| `schurCbNorm_toeplitz_eq_fourierMultiplierCbNorm` | `n = 0`, `m = 2i`; `m = e_a`; `m = sign`, `p = 2` | `2`; `1`; `1` | `|m(0)| = 2`; translation, `1`; `‖m‖_∞ = 1` | sound; caspers-delasalle-2015 lines 485, 626 cover `M_cbA` only, §9.5 owns the extension |
| §9.4 Gaussians (route of the row above) | `n = 1`, `f = γ_R`, `g = T⁻¹γ_T` | `∫fg = R(R²+T²)^{−1/2}` | `0.995` at `T = R/10`, `0.0995` at `T = 10R` | sound |
| `hmsNorm`, `schurNorm_le_hmsNorm` | `M = 1`; `sign(x−y)`; `φ(ξ) = ξ/√(1+ξ²)` | `2`; `2`; `2 + 4/(3√3) ≈ 2.770`; `range(n/2+2)` is `k ≤ σ_n` | `1 ≤ C·4·2` gives `C ≥ 1/8`; `max(p,p') ≤ p²/(p−1) ≤ 2max(p,p')` | sound; cgpt-2023 lines 149–154, 1042 |
| §10.3 mean-zero threshold | `n = 2`, `k = 0`, `x = (0.05,0.05)`, `y = (0.95,0.95)` | `|x−y| = 1.27 ≥ 1`, kept by `J₀` | `m₀(x) − m₀(y) = 0`: needs `4^k ≥ √n` | sound; corrects cgpt-2023 lines 375–378 (Source issues) |
| Declared gaps | both slugs | `design/plan.json` `gaps`: both slugs | README lines 492 and 527 state both contracts, with suppliers | precise, minimal, declared |

- Previous review (same head): it lists no finding. The two findings of the round before it stay repaired: "Nothing else of §2.1 is consumed: the norming element … is constructed in §1.2 here" (`README.md:470–472`), and the description names both gaps.
- Source locators: about 105 read at their lines in 7 cached texts (lafforgue-delasalle-2011 40, cgpt-2023 42, caspers-delasalle-2015 12, pisier-grothendieck-2012 7, mei-2007 3, neuwirth-ricard-2011 1, potapov-sukochev-2011 2); none wrong.
- Library declarations: 46 Mathlib and 19 Tau Ceti names opened at the pins in their cited files, among them `Matrix.PosSemidef.kronecker` (`Mathlib/Analysis/Matrix/Order.lean:188`), `IsCompact.exists_isOpen_lt_add` (`Mathlib/MeasureTheory/Measure/Regular.lean:930`), `MeasureTheory.Measure.IsAtom` (`TauCeti/MeasureTheory/Measure/Atom.lean:59`); all present. No operator-theoretic Schur multiplier, kernel theorem or compact endpoint exists at either pin.
- Cross-roadmap citations: 46 resolved, on main (OperatorIdeals, VonNeumannAlgebras, NoncommutativeIntegration, CStarAlgebras, BanachSpaceTheory, UnboundedOperators, PDE) and at the open heads of AutomorphicSpectralTheory (§0.8–§0.10) and BochnerSpaces (§4.2, §7.4, §7.5); each states what it is cited for.
- Gate at cc8b39d: every check passes in the worker's run and in a rerun. Dependency check: `depcheck: 240 roadmaps, 2252 edges, 0 problem(s)`. Nothing changes outside the folder.
- Lean: `lake env lean` on `Suggested.lean` gives 11 `sorry` warnings and nothing else. `#check @name` on all 19 declarations: every binder of the README statements is present, nothing changed. One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp` with the definitions unfolded, `trivial`): none of the 11 theorems closes.
- Overlap check: read BochnerSpaces, SchrodingerOperatorsAndSpectralTypes, VonNeumannAlgebras, BanachSpaceTheory, QuantumFoundations, NoncommutativeIntegration, NoncommutativeGeometry, OperatorIdeals; shared objects: the `L^∞` conditional expectation and divisibility of atomless measures (owner BochnerSpaces §7.4, §7.5), Hilbert–Schmidt kernels (owner AutomorphicSpectralTheory §0.8), completely bounded maps of operator spaces (owner CStarAlgebras C3.2); all cited, none restated. NoncommutativeIntegration puts Schur multipliers outside its scope.
- Source independence: 29 passages compared with 5 sources, none shared (longest common run 4 words); largest share lafforgue-delasalle-2011, 43 of 131 source mentions; contents compared with lafforgue-delasalle-2011 (§1.1–§1.5): independent. Layers 2 and 9–11 have no counterpart there, its §1.2 is spread over Layers 3, 4 and 6, its §1.4 over Layers 5 and 7.

## Not verifiable

- simon-trace-ideals-2005 Ch. 2, gohberg-krein-1969 Ch. III, reed-simon-1-1980 §VI.6: uncertified, cited by locator only (§1.1, §2.1, §2.2).
- horn-johnson-topics-1991 Ch. 5, paulsen-2002 Ch. 3 and 8, pisier-similarity-2001 Ch. 5: uncertified (§6.1, §6.3).
- grafakos-classical-2014 Theorem 6.2.7: uncertified (§11.5, Toeplitz case).
- musat-2003 Theorem 3.1 and jrwz-2020: uncertified; read only through mei-2007 lines 3229–3230 and cgpt-2023 lines 483–484 (the gap contract).

## Source issues

- **Misprint** in lafforgue-delasalle-2011 at Remark 1.4, p. 6 (line 249): the source says the class at `q` is the interpolation space between the classes at `p` and `p'`, for `2 ≤ p ≤ q`; it should be the class at `p` between those at `q` and `q'`; affects nothing.
- **Misprint** in lafforgue-delasalle-2011 at the proof of Lemma 1.9, p. 8 (line 348): the source says the embedding of the Schatten class of `L²(X, ν)` lands in that of `L²(X, ν)`; it should be that of `L²(X, μ)`; affects nothing.
- **Misprint** in lafforgue-delasalle-2011 at §1.4, p. 9 (line 359): the source says the conditional expectation on the product goes from the `𝓑 ⊗ 𝓑` functions to the `𝓑 ⊗ 𝓑` functions; it should be to the `𝒜 ⊗ 𝒜` functions; affects nothing.
- **Error** in cgpt-2023 at §1.2, p. 8, before Lemma 1.3 (lines 375–378): the source says the periodised truncation has mean zero on the torus for every `k`; it should be for `4^k ≥ √n` only, as two points of one grid cube can be `2^{−k}` apart when `n ≥ 2`; affects nothing.

## For the human reviewers

- The gap `semifinite-martingale-bmo-interpolation` names NoncommutativeIntegration, Part II as supplier; no such roadmap is on main, in the merge order, among the open pull requests or the board packages. §10.4 and the headline of §11.5 rest on it.
- NoncommutativeIntegration on main (`TauCetiRoadmap/NoncommutativeIntegration/README.md` lines 456–457) states the §2.1 norming element as `u*|x|^(p−1)/‖x‖_p^(p−1)`, which is `0` for `x = E₁₂`. This roadmap does not rely on it.
- NoncommutativeIntegration on main (same file, line 180) describes OperatorIdeals Part B as having `S_∞` the compact operators; OI-B80 (`TauCetiRoadmap/OperatorTheory/OperatorIdeals/README.md` line 473) has gauge `‖T‖` on all bounded operators, as this roadmap says.
