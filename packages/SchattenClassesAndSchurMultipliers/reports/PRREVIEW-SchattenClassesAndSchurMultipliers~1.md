# Review of SchattenClassesAndSchurMultipliers (pull request #2421 at 7cdcea4)

**Verdict:** needs changes

## R01 (P3) — Supplier contract credits NoncommutativeIntegration §2.1 with a norming element it does not state

**Location:** `TauCetiRoadmap/SchattenClassesAndSchurMultipliers/README.md:470–475` (From TauCetiRoadmap.NoncommutativeIntegration, bullet §2.1): "The norming element of a nonzero `X` with polar decomposition `X = u|X|` is consumed in the form `|X|^{p−1}u*/‖X‖_p^{p−1}`".

**Claim:** §2.1 does not supply this element. The form §2.1 does state is the one this bullet goes on to show fails, so the contract cites §2.1 for something §2.1 does not say.

**Witness:** `TauCetiRoadmap/NoncommutativeIntegration/README.md:456–457` on main (51d880d): "Supply the norming element `y=u*|x|^(p−1)/‖x‖_p^(p−1)`". For `x = E₁₂`, `p = 2`: `u*|x| = E₂₁E₂₂ = 0`, so `τ(xy) = 0 ≠ 1 = ‖x‖₂`.

**Repair:** In that bullet, after "cyclicity `τ(XY) = τ(YX)`.", replace the rest of the bullet (through "finite-rank `X`.") with: "From §2.1 this roadmap consumes only the isometry and cyclicity. §2.1 writes the norming element as `u*|x|^{p−1}/‖x‖_p^{p−1}`, which does not norm: for `X = E₁₂` in `M₂`, `u = E₁₂`, `|X| = E₂₂` and `u*|X| = E₂₁E₂₂ = 0`. §1.2 constructs the norming element `|X|^{p−1}u*/‖X‖_p^{p−1}` (`u*` at `p = 1`) itself for finite-rank `X`, with pairing `τ(|X|^p u*u)/‖X‖_p^{p−1} = ‖X‖_p`; for `X = E₁₂` it is `E₂₂E₂₁ = E₂₁` and `Tr(X E₂₁) = 1 = ‖X‖₂`."

## R02 (P3) — The description's dependency sentence is contradicted by the head, and the declared gaps go unmentioned

**Location:** Pull-request description, dependency paragraph: "Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite."

**Claim:** The README names NoncommutativeIntegration, Part II as a supplier, and it is neither on main nor in the merge order. §10.4, and through it the headline §11.5, rests on that supplier. The description mentions neither of the two declared supplier gaps.

**Witness:** `README.md:492–493` "What NoncommutativeIntegration must provide (gap:semifinite-martingale-bmo-interpolation): in a Part II extending its §7.3 and §8.4"; `README.md:2333–2334`, §10.4 *Needs:* "Part II (gap `semifinite-martingale-bmo-interpolation`)".

**Repair:** Replace the sentence with: "It consumes, on main, OperatorTheory (OperatorIdeals Parts A–C), VonNeumannAlgebras (V2, V2.RectangularL2, V4.Core, V13b), NoncommutativeIntegration (§1.3–§1.5, §2.1, §2.3, §2.5, §2.6, §3.5, §4.4), CStarAlgebras (C1.6, C3.2) and BanachSpaceTheory (B4.0). It declares two supplier gaps: `sigma-finite-hilbert-schmidt-kernels` on AutomorphicSpectralTheory §0.8 (Layers 2, 5 and 7) and `semifinite-martingale-bmo-interpolation` on a proposed NoncommutativeIntegration, Part II (§10.4, hence the Hörmander–Mikhlin–Schur theorem of §11.5). The roadmaps under Downstream consumers are consumers."

## Verified sound

| Target | Instance | Left side | Right side | Result |
|---|---|---|---|---|
| §2.1 kernel (sample) | `min(x,y)` on `[0,1]`; `1_{(1,2)}` on `{1,2}` | `Σ((j+½)π)^{−4} = (16/π⁴)(π⁴/96) = 1/6`; `E₁₂δ₂ = δ₁` | `∫∫min(x,y)² = 1/6`; LdlS 226–232 bilinear identification | sound |
| §2.5 `E[·|𝒜]` (sample) | masses `(1,3)`, `𝒜` trivial; `ℕ` counting, `φ = 1` | `(a+3b)/4`; with `ρ = (3,1)`: `1/2` at `(1,0)` | `1/4` required (`ρ` not `𝒜`-measurable); `E[1|𝒜] = 1`, `condExp = 0` | sound; LdlS 356–359, 422–424 |
| §3.2 algebra (sample) | `M = 1_{(1,2)}` on `{1,2}` | `S_M(E₁₂) = E₁₂`, `S_{M̃}(E₁₂) = 0` | `S_M(E₁₂)* = E₂₁ = S_{M̃}(E₂₁)`; `‖S_M‖₂ = ‖M‖_∞` (LdlS 267–268) | sound |
| §3.3 norms (sample) | one point of mass `w`; `M₂`, `M = 1` | kernel of `a` is `a/w`; `‖S_M‖_p = |c|` | `‖S_M‖₁ = 1` against `sup{‖A‖₁ : ‖A‖₂ ≤ 1} = √2` | sound; LdlS 233–238, 400, 433–438 |
| §4.3 weak-* (sample) | `1_{x=y}` on `ℕ` | extension is the diagonal projection, `1 ↦ 1` | extension by `0` off compacts gives `1 ↦ 0` | sound; C-dlS 28–34 |
| §6.1 (sample) | `[[2,1],[1,1]]`; `[[1,2],[2,1]]`; empty `ι` | `max|M_ij| = 2`; `‖S_M‖_∞ = 2` | `max_j M_jj = 2`; diagonal max `1` (not PSD, excluded); `⨆∅ = 0` | sound; Pisier 767–772 |
| §6.3 (sample) | `ξ_j = (√(3/2), v_j/√2)`; `α = (1,i)/√2`, `β = (1,1)/√2`, `M = diag(1,i)` | `‖ξ_j‖² = 2`; `⟨ξ_j,η_k⟩ = 1` (`j = k`), `2` | `⟨ᾱ, S_M(I)β⟩ = 0 = Σψ_ij M_ij`; `⟨α,·⟩ = 1` | sound; Pisier 656–665, 781, 800, 3439, 3541 |
| §7.3 (sample) | Lebesgue `[0,1]`; two countable–cocountable copies | `1_{x<y}`, `p = 2`: both norms `1` | `L² ≅ ℂ²`, null singletons, has atoms: excluded | sound; LdlS 487–488, 505–520 |
| §8.1 (sample) | LdlS 555–559 | finitely supported probability measures in `supp μ`, vague convergence | README adds `C_c(X×X)` via Stone–Weierstrass and bounded mass | sound |
| §9.1 (sample) | `m = e_a`; `m = cos(2π⟨a,·⟩)`, `u` = ball indicator | `S = D_{e_a}·D_{e_a}*`, norm `1` | `(cu)⊗(cu)* + (su)⊗(su)*`, `‖cu‖² → 1` | sound; cgpt 59–66, LdlS 597 |
| §9.5 (sample) | `n = 0`, `m = 2i`; `n = 1`, `m = sign`, `p = 2` | Schur cb: `2` at levels `≥ 1`, `0` at level `0`; `1` | Fourier cb: `2`; `1` | sound; cgpt 71–72; C-dlS 485, 543, 626 |
| §10.2 (sample) | `n = 0`; `n = 1`, `A = 1_{[0,1]}⊗1_{[0,1]}*`, `z = ½` | `n = 0`: `‖·‖_BMO ≡ 0`, `‖1‖₂ = 1` | `(e^{πi(x−y)} − 1)1_{[0,1]²} ≠ 0`; `n = 0` excluded | sound; cgpt 264–285 |
| §10.3 (sample) | `n = 2`, `k = 0`, `x = (.05,.05)`, `y = (.95,.95)` | `|x − y| = 0.9√2 = 1.273 ≥ 1` | `m₀(x) = m₀(y)`: mean zero fails, so `4^k ≥ √n` is needed | sound; corrects cgpt 375–378 |
| §10.4 (sample) | operator form at `z = 2/p, it, 1+it`; `n = 0`, `p = 4`, `Ψ = e^{−Rz}` | `Ψ(2/p) = C_∞^{2/p−1}C₂^{−2/p}TA`; `e^{−R/2}` | boundary norms `≤ 1`; `4C e^{−R}` (fails, `n = 0` excluded) | sound; cgpt 313, 326, 485–539 |
| §11.4 (sample) | `M = sin y₁` | `|||M|||_r = 1` | `|||M|||_c = ∞`; source (2.6) row↔`∂_x`, (2.7) column↔`∂_y`, (2.10) factor `5^{n/2}` | sound; cgpt 629–634, 723 |
| `schurNorm_two_eq` | `μ = 0`; `{1,2}`, `[[1,2],[3,4]]` | `0`; `‖S_M(E₂₂)‖₂ = 4` | `0`; `ess sup |M| = 4` | sound |
| `schurNorm_eq_of_holderConjugate` | triangular truncation on `M₂`, unitary `[[√2,1],[−1,√2]]/√3` | `(S_MA)*(S_MA)` eigenvalues `4/3, 1/3`: `‖S_M‖_∞ = 2/√3` | `‖S_M‖₁ = 2/√3`; transpose `[[1,0],[1,1]]`: `2/√3` | sound |
| `schurNorm_interpolation` | same symbol, `p₀ = 2`, `p₁ = ∞`, `θ = ½`, so `p = 4` | `‖S_M‖₄` | bound `1^{½}(2/√3)^{½} = 1.0746`; a zero endpoint forces `M = 0` a.e. | sound |
| `schurNorm_mono_of_abs_inv_sub_le` | `p = ∞`: `p⁻¹.toReal = 0`; `[[1,2],[2,1]]` | `|0 − ½| = ½`, the maximum | every norm `2`; `‖M‖_∞ ≤ ‖S_M‖_p ≤ ‖S_M‖_∞` | sound |
| `schurNorm_of_posSemidef` | `[[2,1],[1,1]]`; empty `ι` | `2`; `0` | `⨆ Re M_jj = 2`; `⨆∅ = 0` | sound |
| `haagerupNorm`, `schurNorm_eq_haagerupNorm` | constant `1` on `ℕ`; `cos(x − y)` on `ℝ` | `‖S_1‖_∞ = 1`; `1` | `ξ = η = e₀`: `1`; `ξ = η = (e^{ix}, e^{−ix})/√2`: `1` | sound |
| `schurNorm_eq_schurCbNorm_of_forall_not_isAtom` | Tau Ceti `IsAtom` (`Atom.lean:59`) against LdlS 487–488 | a σ-finite atom has finite measure | the two notions agree; `gaussianReal m 0 = δ_m` has an atom | sound |
| `schurNorm_le_iff_of_continuous`, `schurCbNorm_le_iff_of_continuous` | `μ = 0`; `δ₀`; `M = x` on `ℝ`; discrete `|X| > 𝔠`, `δ_{x₀}`, `1_{x=y}` | `0 ≤ C`; `|M(0,0)|`; false; `1` | only `N = 0`; `|M(0,0)|`; false for finite `C`; `1×1` matrix `1` | sound |
| `schurCbNorm_toeplitz_eq_fourierMultiplierCbNorm` | `n = 0` (`volume = δ₀`); `m = e_a`; `m = cos`, `p ∈ {1,∞}` | `|m(0)|`; `1`; `1` | `|m(0)|`; `1`; `1` | sound |
| `hmsNorm`, `schurNorm_le_hmsNorm` | `M = 1`; `φ(x−y)`, `φ(ξ) = ξ/√(1+ξ²)`; `range(n/2+2)` | `|||1||| = 2`, `‖S_1‖_p = 1`, so `C_n ≥ 1/8`; `k = 1` term | `2·(1/√2)(3/2)^{−3/2} = 4/(3√3) = 0.770`; top index `σ_n` | sound |
| §1.2 supplier contract (R01) | `X = E₁₂`, `p = 2` | `|X|u* = E₂₁`, `Tr(XE₂₁) = 1` | NoncommutativeIntegration §2.1 form: `u*|X| = 0` | R01 |

- Source locators: 101 read at their lines in 7 cached texts (lafforgue-delasalle-2011 38, cgpt-2023 41, caspers-delasalle-2015 9, pisier-grothendieck-2012 7, mei-2007 3, potapov-sukochev-2011 2, neuwirth-ricard-2011 1). All 15 sampled targets are supported as stated. The 7 source slips are listed below; the README already flags 4 of them.
- Libraries: 41 Mathlib and 19 Tau Ceti declarations located at the pins, among them `Integrable.tendsto_ae_condExp` (`Convergence.lean:361`, real-valued, `IsFiniteMeasure`), `fourier_gaussian_innerProductSpace` (`FourierTransform.lean:353`), `Lp.fourierMultiplierCLM` (`L2Multiplier.lean:88`) and `gauge_schatten` (`Schatten.lean:64`, all bounded maps). None of them already states a target.
- Cross-roadmap: 47 citations resolved. On main: OperatorIdeals (18 ids, OI-B80 is `B(H)`), CStarAlgebras C1.6/C3.2, VonNeumannAlgebras V2.RectangularL2/V4.Core/V13b, NoncommutativeIntegration (12 sections), BanachSpaceTheory B4.0, PDE §2.2–§2.4/§7.1 and UnboundedOperators §5.1. At open heads: AutomorphicSpectralTheory §0.8–§0.10 and BochnerSpaces §4.2/§7.4/§7.5. Both gap slugs match `packages/SchattenClassesAndSchurMultipliers/design/plan.json`.
- Gate at 7cdcea4: every check passed. The dependency check output is `depcheck: 236 roadmaps, 2232 edges, 0 problem(s)`. Nothing changes outside the folder.
- Elaboration of `Suggested.lean`: exit 0, with 11 `sorry` warnings and nothing else. The elaborated types of all 19 declarations match their README statements, with no lost binder. The one-tactic probe (`rfl`, `infer_instance`, `simp`) closed 0 of 11 theorems. Every headline statable at the pins is stated, and the unstated one (multiplicativity of `M ↦ S_M`) is named in the docstring.
- Overlap check: read BochnerSpaces, QuantumFoundations and ClassicalErgodicTheory (open), VonNeumannAlgebras and BanachSpaceTheory (main; their open revisions drop no cited id), NoncommutativeIntegration, NoncommutativeGeometry and OperatorIdeals (main); the results list is empty. Shared objects and their owners: `L^∞` expectation, atomless splitting and Bochner Fubini → BochnerSpaces §7.4/§7.5/§4.2; Hilbert tensors and ultraproduct → VonNeumannAlgebras; reflexive density → BanachSpaceTheory B4.0; martingale BMO → NoncommutativeIntegration §8.4; `S_p`, `p < ∞` → OperatorIdeals. Each is cited, none restated.
- Source independence: 24 passages compared with 5 sources; none shares more than 4 consecutive words, and those are forced phrases. Largest share: lafforgue-delasalle-2011, 42 of 115 locators. Contents compared with lafforgue-delasalle-2011 §1.1–§1.5 and cgpt-2023 §1.1–§2: independent. Layer 10 follows cgpt §1.2's order, but that order is forced by the *Needs* lines of §10.2→§10.1, §10.3→§10.1–§10.2 and §10.4→§10.1–§10.3.

## Not verifiable

- reed-simon-1-1980 §VI.6 (§2.1, §2.2): uncertified in the manifest (paywalled); cited by locator only.
- horn-johnson-topics-1991 Ch. 5 (§6.1): uncertified (paywalled).
- paulsen-2002 Ch. 3 and Ch. 8 (§6.1, §6.3): uncertified (paywalled).
- pisier-similarity-2001 Ch. 5 (§6.3): uncertified (paywalled).
- simon-trace-ideals-2005 Ch. 1–3 and gohberg-krein-1969 Ch. III (§1.1): uncertified (paywalled).
- grafakos-classical-2014 Theorem 6.2.7 (§11.5): uncertified (paywalled).
- musat-2003 Theorem 3.1 and jrwz-2020 (gap contract): uncertified (paywalled); checked only as cited at mei-2007 lines 3229–3230 and cgpt-2023 lines 483–484.

## Source issues

- **Misprint** in lafforgue-delasalle-2011 at Remark 1.4, p. 6 (line 249): the source says `S_q = [S_p, S_{p'}]_θ` with `1/q = θ/p' + (1−θ)/p`, which gives the reverse inequality; it should be `S_p = [S_q, S_{q'}]_θ`, `1/p = θ/q' + (1−θ)/q`; affects the proof.
- **Misprint** in lafforgue-delasalle-2011 at Lemma 1.9, proof, p. 8 (line 348): the source says the embedding lands in `S_p(L²(X, ν))`; it should be `S_p(L²(X, µ))`; affects nothing.
- **Misprint** in lafforgue-delasalle-2011 at §1.4, p. 9 (line 359): the source says the expectation goes from `L^∞(X×X, B⊗B)` to `L^∞(X×X, B⊗B)`; the target should be `L^∞(X×X, A⊗A)`; affects nothing.
- **Error** in lafforgue-delasalle-2011 at Remark 1.6, p. 7 (line 262): the source allows every σ-finite `(Ω, ν)`, but for `ν = 0` the amplified space is zero and the equality fails when `φ ≠ 0`; it should require `ν ≠ 0`; affects a stated result.
- **Error** in cgpt-2023 at §1.2, before Lemma 1.3, p. 8 (lines 375–378): the source says `π_k∘J_k(A)` has mean zero for every `k`, but for `n = 2`, `k = 0` two points of one unit cube can be at distance `≥ 1`; it should require `4^k ≥ √n`; affects nothing.
- **Misprint** in cgpt-2023 at step 4 of the proof of Theorem A, p. 15 (line 910): the source writes `∂_ξ^γ M_c(x, ξ)` as `(−1)^{|γ|}∂_ξ^γ M(x, x−ξ)`; it should be `(−1)^{|γ|}(∂_y^γ M)(x, x−ξ)`; affects nothing.
- **Misprint** in pisier-grothendieck-2012 at Proposition 3.3, proof, p. 15 (line 800): the source names the factor vectors `λ_i, µ_j`, which are introduced one line earlier as `α_i, β_j`; affects nothing.

## For the human reviewers

- NoncommutativeIntegration on main (`TauCetiRoadmap/NoncommutativeIntegration/README.md` lines 456–457) states the §2.1 norming element as `u*|x|^(p−1)/‖x‖_p^(p−1)`, which is `0` for `x = E₁₂`. No change to this pull request repairs that text.
