<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17047#issuecomment-6901957249 -->
Review (claude) of 0cf1df5

Verdict: accepted
Conditional on the announced gaps: `sigma-finite-hilbert-schmidt-kernels`, `semifinite-martingale-bmo-interpolation`

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

No finding. The one finding of round 3 is repaired, the repaired passages and the rest of the
package pass the adversarial pass, `Suggested.lean` elaborates with `sorry` as its only warning,
nothing in it is padding, every citation resolves where it is cited, and the fifteen sampled
locators agree with the texts. The acceptance is conditional on the two declared supplier gaps
`sigma-finite-hilbert-schmidt-kernels` and `semifinite-martingale-bmo-interpolation`.

## Previous findings

- **F01 of round 3 (bare `§` numbers of suppliers that read as this roadmap's own sections) —
  repaired.** The four places named by the finding:
  (a) §1.3, `packages/SchattenClassesAndSchurMultipliers/README.md` lines 680–684: "the
  regularisation of NoncommutativeIntegration §2.3 identifies `[S_{p₀}, S_∞]_θ = … = S_{p_θ}`
  (NoncommutativeIntegration §2.5 with its §1.5), and the operator estimate of
  NoncommutativeIntegration §2.3 applies";
  (b) §9.3, lines 1873–1876: "whose `Lᵖ` norm on bounded `g` is `‖g‖_{Lᵖ(S_p^k)}` because `|g|^p`
  is computed pointwise (NoncommutativeIntegration §1.5 at `k = 1`), and for the couple
  `(S₁, B)(L²(F)^k)` (NoncommutativeIntegration §1.5 for `B(H)`)";
  (c) Layer 4 Dependencies, lines 1308–1309: "through §1.3 of Layer 1, NoncommutativeIntegration
  §1.5, §2.3, §2.5 and §2.6";
  (d) Scope, lines 120–121: "§7.1 applies BochnerSpaces §7.5 …; §11.3 uses BochnerSpaces §4.2 at
  `p = 2`".
  The Conventions bullet "Section references" (lines 198–203) states the rule with the witness §2.3
  (Transposition here, the complex method in NoncommutativeIntegration).

Pattern search over the whole README, by script: every `§a.b` whose number is not one of the 45
sections of this roadmap (24 occurrences: §0.8, §0.9, §0.10, §1.5, §2.6, §4.4, §7.4, §7.5, §8.4,
§13.2) is either preceded by its roadmap's name or "its", continues a list that starts with the
name inside one semicolon-delimited item, or is a bullet key under that supplier's
"From TauCetiRoadmap.X" heading. Every reference to a number that both this roadmap and a supplier
have (§1.3, §1.4, §2.1, §2.3, §2.5, §4.2, §4.3, §5.1, §7.3) was read in context: 18 carry the
supplier's name directly, the others are this roadmap's sections. No bare supplier number is left.

## Verified sound

**Principles.** No route-specific shortcut, no re-planned roadmap, no upward or cyclic supply, no
copied passage, no algorithm, no sorry'd data, no `set_option`. The organisation is the roadmap's
own (arrangement check below).

**Elaboration.** `lake env lean` on `packages/SchattenClassesAndSchurMultipliers/Suggested.lean`
from the content repository: 11 warnings, each "declaration uses `sorry`" (lines 97, 107, 120, 130,
143, 165, 177, 196, 207, 247, 276), no error, no other message. 8 definitions with real bodies, 11
theorems, no `lemma`, `example`, `#eval`, `#synth`, `set_option`. Header: `module`, `import Mathlib`,
five `TauCeti.*` modules, each used (`schattenGauge`, `lpSchattenNorm`, `fourierMultiplierCbNorm`
with the Frobenius inner product, and `IsAtom`). The elaborated types of the worker's signature
file were compared with the README statements: every Schur theorem keeps `[SigmaFinite μ]`, the two
continuous-symbol theorems keep `LocallyCompactSpace`, `T2Space`, `BorelSpace`,
`IsFiniteMeasureOnCompacts`, `InnerRegularCompactLTTop`, and `schurNorm_le_hmsNorm` keeps `1 ≤ n`,
`1 < p`, `p ≠ ∞`. No binder is lost; nothing changed.

**Padding probe, all 11 theorems.** Two scratch copies with every `sorry` replaced by one
alternative of tactics. First: `rfl`, `simp`, `infer_instance`, `exact le_rfl`, `trivial`,
`exact Iff.rfl`, `constructor <;> rfl`, `norm_num`. Second: `simp` with the eight definitions
unfolded, `unfold schurNorm schurCbNorm; rfl`, `exact ⟨0, by simp⟩`, `aesop`,
`refine ⟨?_, ?_⟩ <;> simp`, `le_antisymm (by simp) (by simp)`. Each run: 11 errors, one per
theorem. None restates a definition, mirrors a Check, computes a small value or treats a boundary
case.

**Headline theorems** (README lines 11–30) and their statements: isometry on `S₂`
(`schurNorm_two_eq`); invariance under `p ↦ p'` and transposition
(`schurNorm_eq_of_holderConjugate`); log-convexity and monotonicity (`schurNorm_interpolation`,
`schurNorm_mono_of_abs_inv_sub_le`); Schur product theorem (`schurNorm_of_posSemidef`);
Grothendieck–Haagerup (`schurNorm_eq_haagerupNorm`); atomless theorem
(`schurNorm_eq_schurCbNorm_of_forall_not_isAtom`); continuous symbols
(`schurNorm_le_iff_of_continuous`, `schurCbNorm_le_iff_of_continuous`); transference
(`schurCbNorm_toeplitz_eq_fourierMultiplierCbNorm`); Hörmander–Mikhlin–Schur
(`schurNorm_le_hmsNorm`). The one headline not stated, multiplicativity and `*`-compatibility of
`M ↦ S_M`, is named in the module docstring with its missing carrier (the kernel of a
Hilbert–Schmidt operator on a σ-finite space); a statement through pairs of kernels would be a
stand-in. All 19 backticked names the README attributes to this roadmap are declared, and every
Lean name appears in the README.

**Adversarial table** (repaired passages, the fifteen sampled targets, the headlines; values
recomputed in this round).

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.2 norming | finite-rank `X = Σ s_i u_i ⊗ v_i*`; `X = E₁₂`, `p = 2`; `X ∉ S_p` | `‖Y‖_{p'} = (Σ s_i^p)^{1/p'}/‖X‖_p^{p−1} = 1`, `Tr(XY) = Σ s_i^p/‖X‖_p^{p−1} = ‖X‖_p`; `|X|u* = E₂₁`, `Tr(XE₂₁) = 1`, `u*|X| = 0`; both sides `∞` through the compression bound | holds | none |
| §1.3 interpolation (repaired route) | `T(A) = Tr(A)E₁₁` on `M_n`; closure of `S₁` in `B(ℓ²)` | `C₀ = 1`, `C₁ = n`, bound `n^{1−1/p}`, attained at `1` (`‖1‖_p = n^{1/p}`); exchanged exponents give `n^{1/4}` against `n^{3/4}` at `p = 4`; `‖1 − F‖ ≥ 1` for finite-rank `F`, so the closure is `S_∞` | holds; regularisation needed and now attributed | none |
| §1.4 cb norms | transpose on `M_n`; `T` fixing `w₀ = diag(1/(j+1))` | flip `Σ E_{ij} ⊗ E_{ji}` ↦ `Σ E_{ij} ⊗ E_{ij}`, `n` times a projection; `‖T‖₁ = 0`, `‖T‖₂ = ∞`, `‖T‖_{4/3} ≥ 1` | holds; finiteness hypothesis present | none |
| §2.1 kernels | `min(x, y)` on `[0,1]`; `1_{(1,2)}` on `{1,2}`; diagonal of `[0,1]²` | `Σ((j+½)π)^{−4} = (16/π⁴)(π⁴/96) = 1/6 = 2∫₀¹ x³/3 dx`; `E₁₂δ₂ = δ₁`; null, operator `0` | holds | none |
| §2.2 trace formula | `A = iE₁₂`, `C = E₂₁` | `k_{A*} = −i·1_{(2,1)}`, `⟨k_{A*}, k_C⟩ = conj(−i) = i = Tr(AC)`; without conjugation `−i` | holds | none |
| §2.4 change of measure, sub-σ-algebras | `dν = h dμ`; `B = u ⊗ v*`; `k = u_iu_j`, `u_j = 1/(j+1)` | `∫|g|²h dμ = ∫|g|² dν`; kernel `√h(x) k(x,y) √h(y)`; `V*BV = (Qu) ⊗ (Qv)*`; `‖k‖₂ = π²/6`, `Σk = ∞` | holds | none |
| §2.5 `L^∞` expectation | masses `(1, 3)`, trivial `𝒜`; density `(3, 1)`; adjoint of `g ↦ g(1)·1` | `(a + 3b)/4`; `(a + b)/2`, `1/2` against `1/4` at `(1, 0)`; `ψ = (φ(1) + 3φ(2), 0)`, sends `1` to `(4, 0)` | holds | none |
| §3.2 algebra on `S₂` | `M = 1_{(1,2)}` | `M̃ = 1_{(2,1)}`, `S_M(E₁₂)* = E₂₁ = S_{M̃}(E₂₁)`, `S_{M̃}(E₁₂) = 0`; kernel of `S_M(A)*` is `conj(M(y,x)k_A(y,x))` | holds | none |
| §3.3 norms and extension | `p ≥ 2`, truncations `A_k`; change of `M` on a null set | `‖A_k‖_p ≤ ‖A‖_p`, `S_MA_k → S_MA` in `S₂`; sections of a `μ ⊗ μ`-null set are null for almost every `x` | holds | none |
| §3.4 triangular truncation | unitaries `[[c, s], [−s, c]]` (diagonal unitaries commute with `S_M`) | `σ_max² = (1 + u + √(1 + 2u − 3u²))/2` with `u = c²`, maximal at `u = 2/3`, value `4/3`; numeric maximum `1.1547005 = 2/√3` | holds, with the upper bound | none |
| §3.5 `schurNorm_two_eq` | `[[1,2],[3,4]]`; `[[1,2],[2,1]] = (3/2)J − (1/2)vvᵀ`; `μ = 0` | `4` at `E₂₂`; diagonal `3/2 − 1/2 = 1`, off-diagonal `3/2 + 1/2 = 2`; `0 = 0` | holds | none |
| §3.7 invariances | masses `(1, 3)`; `M^t`, `M̄` | matrix `[[k₁₁, √3k₁₂], [√3k₂₁, 3k₂₂]]`; kernel of `S_M(A^T)^T` is `M(y,x)k(x,y)`, of `JS_M(JAJ)J` is `conj M · k` | holds | none |
| §4.1 `schurNorm_eq_of_holderConjugate` | `M = 1_{(1,2)}` | `Tr(S_M(A)B) = A₁₂B₂₁ = Tr(AS_{M^t}(B))`, `Tr(AS_M(B)) = A₂₁B₁₂` | holds | none |
| §4.2 interpolation, monotonicity | zero endpoint norm; `θ ∈ {0, 1}` in the monotonicity route; `p = 4` | rank-one `A` gives `M(x,y)f(x)g(y) = 0`, so `M = 0` and `0·∞` never occurs with a positive left side; `p = q` and `p = q'`; `(2/√3)^{1/2} = 1.0746` | holds | none |
| §4.3 weak-* extension | `M = 1`; `1_{x=y}` on `ℕ` | identity; diagonal projection; norm `‖S_{M^t}‖₁ = ‖S_M‖_∞` | holds | none |
| §5.1, §5.2 | trivial `𝒜` on `{1,2}`; dyadic `1_{x<y}` | averages `3/2 ≤ 2`, `3/4 ≤ 2/√3`, `1/4 ≤ 1`; `f₀ = 1/2`, `f₁ = [[1/2, 1], [0, 1/2]]` of norm `≥ 1` | holds | none |
| §5.3 ambient σ-algebra | `{1,2,3,4}`, blocks `[[1,2],[2,1]]` | `2 × 2` matrix and its Kronecker product with `J₂`; both cb norms `2` | holds; cb norms only, as the source | none |
| §6.1 `schurNorm_of_posSemidef` | `[[2,1],[1,1]]`; `[[1,2],[2,1]]`; empty `ι` | `(M ⊙ A)_{ij} = Σ_k v_k(i) conj v_k(j) A_{ij}`; `2` at `E₁₁`; eigenvalue `−1`, diagonal `1`, norm `2`; `⨆ ∅ = 0` | holds | none |
| §6.2 `haagerupNorm` | `[[1,2],[2,1]]`; `ξ = 0`, `η` unbounded; `dim K` | `⟨ξ_j, η_k⟩ = 3/2 − v_jv_k/2`, `‖ξ_j‖² = 2`; `0·∞ = 0` with `M = 0`; projecting `η_j` on `span ξ_i` gives `dim ≤ |ι| ≤ 2|ι|` | holds | none |
| §6.3 finite case | `α = (1,i)/√2`, `β = (1,1)/√2`, `a = I`, `M = diag(1,i)` | `Σψ_{ij}M_{ij} = 1/2 + i·i/2 = 0 = ⟨ᾱ, S_M(a)β⟩`; without the conjugate `1` | holds | none |
| §6.4 `schurNorm_eq_haagerupNorm` | `cos(x−y)`; coordinates; ultraproduct | `ξ = η = (e^{ix}, e^{−ix})/√2`, norms `1`; `⟨g, S_MAf⟩ = Σ_j⟨c_jg, A(d_jf)⟩`, `Σ‖c_jg‖² = ∫‖ξ‖²|g|²`; `⟨∫uξ_n, ∫vη_n⟩ = ∫∫ conj u · v · M_n` | holds | none |
| §7.1 atomless measures | σ-finite atom; product with σ-finite `ν`; `A = [0,2]`, `t = 1/2` | `μ(A) ≤ μ(S_n) < ∞`; an atom of mass `c` meets one strip `A_i × Ω'` of mass `≤ εν(Ω') < c`; ratio `1/4` | holds | none |
| §7.3 atomless theorem | two countable–cocountable copies; `μ = 0` | `L² ≅ ℂ²`, null singletons; both sides `0` | `IsAtom` hypothesis is the right one | none |
| §8.2 continuous symbols | `μ = 0`; `C = 0`; discrete `X` beyond the continuum; `M(x,y) = x` | support empty, only `N = 0`, both sides true; `M = 0` a.e. iff `M = 0` on `supp μ × supp μ ⊆ supp(μ ⊗ μ)`; class `1`, norm `1`; second side only with `C = ∞` | holds; `MemLp` conjunct, injectivity and finite `C` needed | none |
| §9.1–§9.3 | `V_t`; `m = cos`; `Λ_F` | kernel of `V_t⁻¹S_{M_m}(V_tA)` is `m(x−t−y)k(x,y)`; `S(u ⊗ u*) = cu ⊗ cu* + su ⊗ su*`; `‖Λ_F(h)‖₂² = ∫|ȟ(u)|²|F ∩ (F+u)|du`, `Tr(Λ(g)Λ(h)) = ∫tr(ǧ(u)ȟ(−u))|F ∩ (F+u)|du` | holds | none |
| §9.3 repaired clause | `k = 2`, `g = diag(2,1)1_{[0,1]}` | `∫Tr|g|^p = 2^p + 1`; the pointwise operator norm would give `2^p` | holds | none |
| §9.4 approximate identities | `p = 1`; `p = ∞`, `n = 1`; `1 < p < ∞` | `R^{−n}(R^{−2} + T^{−2})^{−n/2} = (1 + R²/T²)^{−n/2}`; `R(R² + T²)^{−1/2}`: `0.995` at `T = R/10`, `0.0995` at `T = 10R`; `f_R^{p−1} ∝ γ_{R/√(p−1)}` | holds | none |
| §9.5 transference | `n = 0`, `m = 2i`; `m = e_a`; `p = ∞` | both `2`; both `1`; `‖RT_mRg‖_∞ ≤ liminf‖S_{M_m}(Λ_Qg)‖_∞ ≤ ‖S_{M_m}‖_∞‖g‖_∞` for `g ∈ L² ∩ L^∞` | holds for every `m ∈ L^∞`, values in `[0, ∞]` | none |
| §10.1 column and row BMO | `f = Σ1_{I_k}E_{k1}`, `N = 4` | column `(1 − Σa_k²)E₁₁`, `0.866`; row `diag(a) − aaᵀ`, `0.707` at `a = (½, ½, 0, 0)` | holds | none |
| §10.3 threshold | `|p_k(x) − x| ≤ √n 8^{−k}` | `2^{−k} − 2√n 8^{−k} ≥ 2^{−k}/2` iff `4^k ≥ 4√n`; mean zero iff `√n 8^{−k} ≤ 2^{−k}` | thresholds correct | none |
| §10.4 operator form | `Ψ(z) = C_∞^{z−1}C₂^{−z}T(U|A|^{pz/2})`; `n = 0` | `‖Ψ(it)‖_{BMO} ≤ 1`, `‖Ψ(1+it)‖₂ ≤ 1`, `Ψ(2/p) = C_∞^{2/p−1}C₂^{−2/p}TA`; `e^{−R/2} ≤ 4C e^{−R}` fails for large `R` | holds for `n ≥ 1` | none |
| §11.1 `hmsNorm` | `φ(ξ) = ξ/√(1+ξ²)`; `M = 1`; range of the sum | `2 + 2·(1/√2)(3/2)^{−3/2} = 2 + 0.770`; `2`; `Finset.range (n/2 + 2)` is `k = 0, …, σ_n` | holds | none |
| §11.2 Littlewood–Paley | `N = 1`; supports | `k_j(s) = 2^{jn}ψ̌(2^js)`, `∫|s|^{2σ}|k_j|² = 2^{j(n−2σ)}∫|u|^{2σ}|ψ̌|²`; `supp ψ_j ⊆ {2^{j−1} ≤ |ξ| ≤ 2^{j+1}}`; `|∂^γ(ξ_iψ_jN)| ≲ B2^{j(1−σ)}` on volume `2^{jn}` | three exponents exact | none |
| §11.3 twisted multipliers | entry `(x, y)`; counting measure on `{1,2}` | `M_c(x, x−y) = M(x,y)`, `M_r(y−x, y) = M(x,y)`; `2·4 = 8 = 2³` | holds | none |
| §11.4 column and row parts | `M = sin y₁` | `|||M|||_r = 1`, `|||M|||_c = ∞` (`|x−y||cos y₁|` unbounded) | holds | none |
| §11.5 `schurNorm_le_hmsNorm` | `M = 1`; `p ↦ p'`; route | `1 ≤ C·4·2`; `p²/(p−1) = pp'`; `C_n p |||M|||^{1−2/p}(|||M|||/2)^{2/p}` | holds; `C` chosen before `M` and `p` | none |
| Layer 11 Examples | `sin t₁`, `x = 0`, `y = (R, 0)` | `R²|sin(R/D) + R cos(R/D)|/D² = 5.703, 54.60, 540.9` at `R = 10, 100, 1000` | as stated | none |

**Sources: the seeded sample** (all fifteen read at their locators; the author flagged none as
unverified).

- §1.2: `caspers-delasalle-2015` lines 638–642 (bilinear duality `Tr(AB)`);
  `lafforgue-delasalle-2011` line 400, estimate (9).
- §2.1: `lafforgue-delasalle-2011` lines 226–232.
- §2.4: lines 346–349 (with the misprint the README corrects) and 366–381.
- §3.2: lines 230–232 and 267–268; `cgpt-2023` lines 224–226.
- §3.3: lines 233–238, 397–413, 433–438; `cgpt-2023` lines 226–229.
- §4.3: `caspers-delasalle-2015` lines 28–34; `cgpt-2023` lines 89–93.
- §5.3: Lemma 1.13 at line 415, proof 419–439, Question 1.14 at line 442.
- §6.2, §6.4: Theorem 1.7 at lines 274–278, proof from 286 (the claim (5) at line 289 carries the
  completely bounded norm); `cgpt-2023` lines 89–94; `pisier-grothendieck-2012` (3.9) at line 656,
  (3.10) at 663.
- §7.1: lines 487–488.
- §8.2: Theorem 1.19 at line 524, the consequence on isolated points at 532–534, proof from 535;
  `cgpt-2023` lines 231–237; `caspers-delasalle-2015` Theorem 3.1 at line 282.
- §9.4: `caspers-delasalle-2015` Lemma 4.1 at line 449 (`1 < p < ∞`, `p/q` rational, as the README
  says), Theorem 4.2 at 485, proof from 494.
- §9.5: `cgpt-2023` (FS) lines 71–72; `caspers-delasalle-2015` Theorems 4.2 (485), 5.1 (529),
  5.2 (543), Corollary 5.3 (626); `neuwirth-ricard-2011` Theorem 2.7 at line 516.
- §11.2: `cgpt-2023` (2.12) at line 770 with `ψ_j` at 768, (2.13) at 793, lines 866–894, 967–972,
  995–1015.
- §11.3: (2.2) at lines 572–582, (2.5) at 595–608, lines 668–680, (2.8) at 704, (2.9) at 705–718.

Also read: Remarks 1.3–1.6 and Lemma 1.5 (lines 244–268), Lemma 1.11 and Remark 1.12 (383–394),
Lemma 1.17 (489), Theorem 1.18 with its proof (505–520); `cgpt-2023` Theorem A (149–154), Theorem
1.1 (313), Lemmas 1.2–1.4 (326, 379, 471), lines 348–378 and 485–512, Remark 2.1 (1042). No locator
slip. All 16 cited works are in `packages/SchattenClassesAndSchurMultipliers/sources.toml` (7
certified, 9 uncertified); I added no entry and requested no text.

**Library declarations at the pins.** One scratch file with `#check @name` for the backticked
library names of the README: every Mathlib name and every Tau Ceti name of the five imported
modules resolves. The eight Tau Ceti names outside those modules were opened in source:
`TauCeti.OperatorIdealFamily.hilbertSchmidt` (`TauCeti/Analysis/OperatorIdeal/Family/HilbertSchmidt.lean`
line 65) with `schatten_two`; `traceClass` and `schatten_one`
(`…/Family/TraceClass.lean` lines 59, 90); `ContDiffBump.littlewoodPaleyPiece` and
`exists_norm_iteratedFDeriv_littlewoodPaleyPiece_le`
(`TauCeti/Analysis/Distribution/SchwartzSpace/LittlewoodPaley.lean` lines 87, 196, for symbols
`ContDiffOn ℝ ∞` off the origin, as the README says);
`MeasureTheory.Measure.exists_subset_measure_eq_of_nullSingleton`
(`TauCeti/MeasureTheory/Measure/AtomlessStandardBorel/Transport.lean` line 115);
`TauCeti.exists_eLpNorm_fourierMultiplierCLM_le_of_norm_iteratedFDeriv_le`
(`TauCeti/Analysis/Fourier/MihlinHormander.lean` line 300). All 46 library file paths written in
full in the README exist at the pins, and so do the five abbreviated ones.

**Duplication audit.** Neither pinned library has a Schur multiplier on operators, a kernel
operator of an `L²` kernel, a compact Schatten endpoint or an operator-valued BMO seminorm (the
worker's near-match list has no same-name hit, and its candidates are statements about other
objects). Across the roadmaps on main and the open heads: Schatten families for finite `p` are
OperatorIdeals' (cited); `Lᵖ(B(H), Tr) = S_p`, duality and interpolation are
NoncommutativeIntegration's (cited); completely bounded maps of operator spaces are CStarAlgebras
C3.2 (cited, compared at `p = ∞`); the kernel operator is AutomorphicSpectralTheory §0.8 (cited;
the σ-finite form is a declared gap); the `L^∞` conditional expectation, divisibility and the
Fubini isometry are BochnerSpaces §7.4, §7.5, §4.2 (cited). The overlap list has no second copy,
no dropped id, no id only a revision defines and no conflicting pull request. The two open
revisions that touch suppliers were read at their heads: the VonNeumannAlgebras revision keeps
V2.RectangularL2, V4.Core, V13b and §13.2; the BanachSpaceTheory revision keeps B4.0 with its
density `m = μ.withDensityᵥ h`. No declaration of `Suggested.lean` has the fully qualified name of
a declaration of a roadmap I could read.

Overlap check: read NoncommutativeIntegration, OperatorTheory/OperatorIdeals, NoncommutativeGeometry, BochnerSpaces, BanachSpaceTheory, VonNeumannAlgebras, and searched QuantumFoundations and ClassicalErgodicTheory by object; shared objects and owners: Schatten families for `1 ≤ p < ∞` and the `B(H)` family at `p = ∞` — OperatorIdeals (cited), the compact endpoint — this roadmap; `Lᵖ(B(H), Tr) = S_p`, duality, interpolation, martingale BMO — NoncommutativeIntegration (cited; the semifinite BMO inequality a declared gap); the `L^∞` conditional expectation, divisibility of atomless measures, the Fubini isometry — BochnerSpaces (cited); the Bochner density of a vector measure — BanachSpaceTheory B4.0 (cited); Hilbert tensor products and the ultraproduct — VonNeumannAlgebras (cited); nothing has two owners.

**Supplier-order audit.** Output of the dependency check:

    depcheck: 240 roadmaps, 2259 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. Citations resolved in this round:
NoncommutativeIntegration §1.3, §1.4, §1.5, §2.1, §2.3, §2.5, §2.6, §4.3, §4.4, §7.3, §8.4
(headings on main, lines 286–1423; §4.4 is stated for a probability space, and §10.3 uses it on
`𝕋ⁿ`); VonNeumannAlgebras completed Hilbert tensor products (line 974), V2.RectangularL2
(line 1006), V4.Core (line 1299), §13.2 (V13b, line 4692; the Hilbert-space ultraproduct at
line 5183); CStarAlgebras C1.6 (line 435), C3.2 (line 918); BanachSpaceTheory B4.0 (line 359, the
density and its variation formula in the second paragraph of the section); OperatorIdeals
OI-A12 … OI-C14 (21 ids, all present); UnboundedOperators §5.1, UO-E01 (line 900);
AutomorphicSpectralTheory §0.8 with `kernel_apply`, `kernel_unique`, `kernel_norm`, §0.9, §0.10 at
its open head, earlier in the merge order; BochnerSpaces §4.2 (`exists_fubiniEquiv`, σ-finite
`μ`, `ν`, `1 ≤ p < ∞`), §7.4 (the `L¹` projection with positivity, idempotence, range and tower
law, and under a σ-finite trim the `L^∞` contraction as its adjoint) and §7.5 (a measurable subset
of measure `tμ(A)` for an atomless finite measure and `0 ≤ t ≤ 1`) at the head of its open pull
request, a new roadmap folder of another author. The headings of BochnerSpaces §7.4 and §7.5 name
other topics of the same sections ("Stability and separable determination", "Universality of the
unit interval"); the cited statements are in their text. No roadmap of the never-cite list is
cited. Each `*Needs:*` line was read against the statement and route of its section; the
section-level references that a `*Needs:*` line omits are reached through a listed section (§9.5
uses the restriction of §3.7 through §9.1 and §9.3) or occur in Checks.

**Declared gaps.** `sigma-finite-hilbert-schmidt-kernels` (AutomorphicSpectralTheory §0.8) and
`semifinite-martingale-bmo-interpolation` (NoncommutativeIntegration, Part II): both slugs are in
`packages/SchattenClassesAndSchurMultipliers/design/plan.json` with these suppliers and in the
README in the required form (lines 463 and 497). Each is precise (hypotheses, norms and the
inequality written out) and minimal: AutomorphicSpectralTheory §0.8 is stated for standard Borel
spaces at its head, and NoncommutativeIntegration §8.4 is finite-tracial on main. The trace formula
is explicitly not requested (§2.2 derives it). Not findings; the acceptance is conditional on both.

**Shape and style.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to
read the build, eleven layers each with Examples and Dependencies, Downstream consumers,
References. Every definition (extended gauge, cb norm by amplification, kernel, transposition,
`L^∞` expectation, `S_M`, cb norm of a symbol, `‖M‖_H`, atomless, Toeplitz symbol, Fourier cb
norm, column and row BMO, matrix BMO, HMS norm) has its API bullets and at least three
discriminating Checks; every theorem has its hypotheses and a locator. No LaTeX delimiter,
pull-request number, date, anchor, machine path or process word in the README or the Lean file
(searched; "lemma" occurs only as the English word in "Fatou's lemma", "Urysohn's lemma",
"Smith's lemma"); `theorem` only; no numbering table.

**Copyright.** Wording: 20 passages set beside their sources at the locators above (the fifteen
sampled statements, and the routes of §5.2, §7.3, §8.2, §10.3 and §11.4 against the proofs of
Lemma 1.11, Theorem 1.18, Theorem 1.19, Lemma 1.3 and step 5); the longest shared run is a formula
or a standard name, at most three consecutive words of prose. The routes of §7.3 and §8.2 use the
ideas of the source's proofs in the order the logic forces, in the roadmap's own sentences and
with its own additions (the zero measure, the tower law, the measurability step). Arrangement:
`lafforgue-delasalle-2011` §1 has subsections 1.1–1.5 (lines 180, 212, 338, 352, 521). No
one-to-one run: 1.1 ↔ §1.4 only; 1.2 ↔ Layer 3, §4.1, §4.2 and §6.4; 1.3 ↔ §2.4 and §3.7;
1.4 ↔ §2.4, §2.5, Layers 5 and 7; 1.5 ↔ Layer 8; Layers 2, 4, 6, 9, 10, 11 have no counterpart
there. The order of Layers 5, 7, 8 is forced by "Layer 7 needs Layers 2, 3 and 5" and "Layer 8
needs Layers 1, 3 and 5". `cgpt-2023` §1.2 and §2 correspond to Layers 10 and 11, in the order
that "Layer 11 needs Layers 2, 3, 4, 7 and 10" forces, each layer with further material of its own
(§10.1, the operator form of §10.4, §11.1). Reuse: none (no table, figure or list taken over).

Source independence: 20 passages compared with 5 sources, none shared; largest share lafforgue-delasalle-2011, 42 of 108 source citations; contents compared with lafforgue-delasalle-2011: independent.

## Not verifiable

- `pisier-similarity-2001`, `grafakos-classical-2014`, `simon-trace-ideals-2005`,
  `gohberg-krein-1969`, `reed-simon-1-1980`, `paulsen-2002`, `horn-johnson-topics-1991`,
  `musat-2003`, `jrwz-2020`: uncertified in the manifest; their locators were not read. No end
  theorem rests on one of them alone.
- The journal versions of the arXiv texts: not compared; every locator is a line of the arXiv
  version the manifest records.
- BochnerSpaces is not among the names of this job's list of open pull requests; it was read
  through `roadmaps show` at its indexed head, and ownership against open pull requests outside
  the index was not checked.
- The order `O(p)` of the constant in the declared gap `semifinite-martingale-bmo-interpolation`
  rests on `musat-2003` and `jrwz-2020` (uncertified) and on `cgpt-2023` Lemma 1.4 (lines
  471–484), which I read; the two uncertified texts were not.

## Source issues

- **Misprint** in lafforgue-delasalle-2011 at Remark 1.4, printed page 6 (line 249): the source says the class at the larger exponent interpolates between the classes at the smaller exponent and its conjugate; it should be the smaller-exponent class between the larger one and its conjugate; affects nothing.
- **Misprint** in lafforgue-delasalle-2011 at the proof of Lemma 1.9, printed page 8 (line 348): the source says the conjugation embeds the Schatten class for the smaller measure into itself; it should be into the class for the dominating measure; affects nothing.
- **Error** in lafforgue-delasalle-2011 at Remark 1.6, printed page 7 (line 262): the source says the stabilised symbol has the same completely bounded norm for any σ-finite second factor; it should exclude the zero measure, where every norm is zero; affects nothing.
- **Gap** in lafforgue-delasalle-2011 at §1.4 before Lemma 1.17, printed page 12 (lines 487–488): the source says an atom is a measurable set not splitting into two sets of positive measure; it should also require positive measure, or every null set is an atom; affects nothing.
- **Error** in cgpt-2023 at §1.2 before Lemma 1.3, printed page 8 (lines 375–378): the source says the periodised operator has mean zero for every index; it should be only once the grid cubes have diameter at most the strip width; affects the proof.
- **Misprint** in cgpt-2023 at §1.2 before Lemma 1.3, printed page 8 (line 378): the source says the nonvanishing frequencies lie in the nonzero integers; it should be the nonzero integer vectors of the dimension; affects nothing.
- **Gap** in cgpt-2023 at the proof of Theorem 1.1, printed page 10 (line 506): the source says the Schatten norm equals the limit of the norms after removing the diagonal strip; it should claim only the lower-semicontinuity inequality, which suffices; affects the proof.

## For the human reviewers

- **Licence.** Every locator is a line of an arXiv version; `packages/SchattenClassesAndSchurMultipliers/sources.toml` records the version read for each, and the journal numbering was not compared.
- **Licence.** Nine of the sixteen sources are uncertified (paywalled books and two articles), cited by chapter or theorem number only; their text was not read in any round.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0cf1df530fd157bd1a821a276b5ce097b33c16a3", "job": "REV-PKG-SchattenClassesAndSchurMultipliers~4", "model": "fable", "worker": "chris-x30"} -->
