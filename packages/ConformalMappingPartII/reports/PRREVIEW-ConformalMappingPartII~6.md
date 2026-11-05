# Review of ConformalMappingPartII (pull request #1407 at b8c0542)

**Verdict:** accepted

Incremental re-review of the 90 lines changed since 57f0e04 (README lines 107, 133, §4.6 at 644–665, §8.1 at 961–967, the §8.3 and §8.5 *Needs:* lines; `Suggested.lean` docstring, `zeroBalancedSeries`, `zero_balanced_connection`, `uniform_cusp_asymptotic`), the passages that cite them (§§4.4–4.5, 4.7–4.8, 5.3–5.5, 8.2, the Tau Ceti supplier contract), the two previous findings, the gate and the elaboration. No finding remains.

## Previous findings

- R01 — repaired: `zeroBalancedSeries` and `zero_balanced_connection` are stated at `Suggested.lean:192–204` with `∀ n : ℕ, 2 * a ≠ -(n : ℂ)`, named in README §4.6 with API and four Checks; `uniform_cusp_asymptotic` at lines 285–295 states §8.1 through that series; the docstring and README line 133 now call only the marked polygon unstatable.
- R02 — repaired: README line 107 reads “Consume `TauCeti.Subgroup.CuspDatum.disjoint_smul_horodisc_horodisc` and `TauCeti.Subgroup.CuspDatum.mem_stabilizer_of_mem_horodisc_of_smul_mem_horodisc`” with the discreteness and width hypotheses; the §8.3 and §8.5 *Needs:* lines cite the same two names.

Neither repair introduced a new problem (the checks below). No repair report marks a finding not actionable; the outside-folder diff at this head is empty.

## Verified sound

**Mechanical evidence.** HEAD is b8c0542c39b2f602acc55dab135e0abcd3eed2bd, the worktree is clean, `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ConformalMappingPartII'` is empty. The worker's gate at this head passes every scanner, the dependency check and the targeted build (`build=0 OK`). Fresh `lake env lean` on `TauCetiRoadmap/ConformalMappingPartII/Suggested.lean` exits 0 in 6.7 s with exactly 17 warnings, all `declaration uses sorry`, at lines 62, 72, 92, 108, 155, 165, 183, 201, 216, 223, 236, 250, 270, 285, 299, 311, 322 (the 15 of round 5 plus the new lines 201 and 285). Imports unchanged (`import Mathlib` plus three existing `TauCeti.*` modules); no `set_option`, no sorried data, no `lemma`; both new declarations carry docstrings; the file has 332 lines; the folder holds only `README.md`, `Suggested.lean`, `metadata.toml`.

The dependency command reports exactly

```text
depcheck: 233 roadmaps, 2129 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line; `ConformalMappingPartII` is line 233 of the merge order; the diff adds no supplier (its new citations are Mathlib's `Complex.Gamma`, `Complex.log`, `Real.eulerMascheroniConstant` and Tau Ceti names already in the contract).

**Elaborated signatures.** A scratch copy of the file with `#check @name` appended elaborated (exit 0). The new declarations keep every binder their README statements need: `zeroBalancedSeries : ℂ → ℂ → ℂ`; `zero_balanced_connection : ∀ (a : ℂ), (∀ (n : ℕ), 2 * a ≠ -↑n) → AnalyticOnNhd ℂ (zeroBalancedSeries a) (ball 0 1 \ {x | x.re ≤ 0 ∧ x.im = 0}) ∧ ∀ (x : ℂ), ‖x‖ < 1 → ‖1 - x‖ < 1 → ₂F₁ a a (2 * a) (1 - x) = zeroBalancedSeries a x`; `uniform_cusp_asymptotic : ∀ {M₀ : ℝ}, 0 < M₀ → ∃ C, 0 < C ∧ ∀ (N : ℕ), 2 ≤ N → ∀ (M : ℝ), M₀ ≤ M → ∀ (x : ℂ), x ≠ 0 → ‖x‖ < Real.exp (-(M * ↑N)) → …‖(1 - x) ^ (↑N)⁻¹ * (zeroBalancedSeries aPlus x / (↑(gammaRadius N) * zeroBalancedSeries aMinus x) − L₊/L₋)‖ ≤ C * ‖x‖ / ↑N` with `aPlus = (↑N + 1) / (2 * ↑N)`, `aMinus = (↑N − 1) / (2 * ↑N)` and `L± = −log x − 2·γ − 2·digamma a±`; the power is the complex `cpow`, hence the principal root. Nothing was changed. The quantifier order (one C for all N, M, x) matches §8.1.

**One-tactic probe.** On a second scratch copy, replacing the `sorry` of `zero_balanced_connection` by `simp` gives “simp made no progress”, and of `uniform_cusp_asymptotic` leaves the whole goal unsolved; `zeroBalancedSeries` has a real body (a `tsum` of native terms) on native carriers. No padding.

**Library declarations opened at the pins.** `Mathlib/Analysis/SpecialFunctions/OrdinaryHypergeometric.lean:71,81` (`ordinaryHypergeometric` is the sum of a formal multilinear series, junk 0 outside the radius and at the poles) and `:105` (`ordinaryHypergeometric_eq_tsum`); `Mathlib/Analysis/SpecialFunctions/Gamma/Digamma.lean:48,56,72,94` (`digamma := logDeriv Gamma`, `digamma_one : digamma 1 = -eulerMascheroniConstant`, `digamma_apply_add_nat`, `digamma_one_sub`); `Mathlib/NumberTheory/Harmonic/EulerMascheroni.lean:129`; `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean:439` (`Complex.Gamma_neg_nat_eq_zero`: the prefactor's totalization at the excluded parameters); `Mathlib/Analysis/SpecialFunctions/Complex/Arg.lean:245` (`arg_eq_pi_iff`: the principal logarithm on the negative axis is the limit from the upper half-plane, as §4.6 says); `TauCeti/Analysis/Complex/Fuchsian/Cusp/Horodisc.lean:78,209,224` (namespace `TauCeti.Subgroup.CuspDatum`; `disjoint_smul_horodisc_horodisc` assumes `[DiscreteTopology Γ]`, `0 ≤ A`, `D.width * D'.width ≤ A * A'`, `g • D'.cusp ≠ D.cusp`; `mem_stabilizer_of_mem_horodisc_of_smul_mem_horodisc` assumes `[DiscreteTopology Γ]`, `D.width ≤ A`): README line 107 describes exactly these hypotheses and conclusions.

**Ownership.** `roadmaps grep --lean-only` for `zeroBalancedSeries|zero_balanced_connection|uniform_cusp_asymptotic` over main and the 456 open heads hits only pull request #1407; a README grep for the zero-balanced formula, DLMF 15.8.10 or a hypergeometric connection formula finds no other owner (the hits are “connection formulas” of Riemannian, symplectic and parabolic-cylinder roadmaps). This roadmap is the owner.

**Changed passages against the sources.**

| Passage | Checked | Result |
|---|---|---|
| §4.6 and `zeroBalancedSeries` | CDT-journal lines 2654–2668 (Lemma 5.1.20, printed p.672; page marker line 2678 is printed 673): ₂F₁(a,a;2a;1−x) = Γ(2a)/Γ(a)² Σ (a)_k²/(k!)² x^k(−log x + 2(ψ(k+1) − ψ(k+a))) for |x| < 1, branches of the logarithm giving the branches of the function. DLMF-15-8 line 518 (15.8.10) at m = 0, b = a, z = 1 − x: 𝐅(a,a;2a;1−x) = (1/Γ(a)²) Σ (a)_k²/(k!)² x^k(−ln x + 2ψ(k+1) − 2ψ(a+k)), valid for |x| < 1, |ph x| < π; DLMF-15-2 line 147 (15.2.2): 𝐅 = ₂F₁/Γ(c). | The README's formula, branch condition and index ψ(k+1) agree with both; the README's hypothesis 2a ∉ ℤ≤0 is the right one (Source issues). |
| §8.1 and `uniform_cusp_asymptotic` | CDT-journal lines 2870–2900 (Lemma 5.2.9 and proof, printed p.676): for M ≥ M₀, |x| < e^{−MN}, |s_N(1−x)/γ_N − (1−x)^{1/N}·(quotient of the k = 0 coefficients)| ≪ |x|/N with the constant depending on M₀ only; proof line 2898 writes the coefficients as −log x + 2ψ(1) − 2ψ(a±). | Matches the README statement; the displayed (5.2.10) has +2γ for 2ψ(1) = −2γ (Source issues); the 1/N gain is the a-derivative step §4.8 supplies, which the source leaves as “from which the result follows”. |
| §8.1 identity s_N(1−x)/γ_N = (1−x)^{1/N} Z₊/(γ_N Z₋) | §5.4 defines s_N(x) = x^{1/N}₂F₁(a₊,a₊;2a₊;x)/₂F₁(a₋,a₋;2a₋;x); §4.6 continues each ₂F₁(a,a;2a;1−x) to Z(a,x); §5.3 gives γ_N = Γ(a₋)²Γ(1+1/N)/(Γ(a₊)²Γ(1−1/N)) = (Γ(2a₊)/Γ(a₊)²)/(Γ(2a₋)/Γ(a₋)²). | Consistent; values below. |
| Line 107, §8.3, §8.5 | The two Tau Ceti theorems above. | Names, namespace and hypotheses correct. |
| Docstring and README 133 | Marked polygon: Dirichlet-domain identification, as in round 5. Connection formula and cusp asymptotic now stated. | Consistent with the file. |

**Adversarial table.** New rows carry values computed in double precision with a pure-Python Lanczos Gamma, a digamma by recurrence and asymptotic series, and the native series (`witness6.py`, `witness6b.py` in the scratch directory; sanity: Γ(1/2)²/π = 1 − 1e−16, ψ(1) + γ = 6e−16, ψ(2) − ψ(3/2) = 0.38629436 = 2 log 2 − 1). Rows for statements the diff leaves untouched are carried from the round-5 and round-4 reports with their values abbreviated.

| Statement | Instances and values | Result |
|---|---|---|
| `zero_balanced_connection`, lens identity (§4.6 Checks 1–2) | native ₂F₁(a,a;2a;1−x) vs series: (1/2, 1/100) 2.352715816780 both; (3/4, 1/5) 1.702460198286 both; (−3/10, 3/10) 0.800342448329 both (2a = −3/5, Γ(−3/5) finite); (1/2+3i/10, 1/5+2i/5) 1.407489519808 − 0.173125437993i both, |x| = 0.447, |1−x| = 0.894. Max difference 1.2e−14. | keep |
| `zero_balanced_connection`, index ψ(k+1) (Check 3) | With ψ(k+2): 2.0908524470 at (1/2, 1/5) against native 1.4369815413; with ψ(k+1): equal. | keep |
| `zero_balanced_connection`, the slit (Check 4) | a = 1/2, x = −3/10: log from above gives 1.2241694440 − 0.9355074856i, from below 1.2241694440 + 0.9355074856i; Mathlib's `log (−0.3)` = −1.2040 + 3.1416i (arg = π), so `zeroBalancedSeries` takes the upper value; the two differ, so the function is not analytic across the axis and the set `ball 0 1 \ {re ≤ 0 ∧ im = 0}` is the right domain. | keep |
| `zero_balanced_connection`, degenerate a | a = 1: 2a = 2, series Σ x^k(−log x) = −log x/(1−x) = ₂F₁(1,1;2;1−x); a = −1/2: 2a = −1 is excluded (c = −1 is a pole of the native series, `Gamma (−1) = 0` totalizes the prefactor); a = 0: excluded by n = 0; a nonpositive integer forces 2a nonpositive, so Γ(a) and ψ(k+a) never hit their poles. | keep |
| `uniform_cusp_asymptotic`, prefactor quotient = γ_N | (Γ(2a₊)/Γ(a₊)²)/(Γ(2a₋)/Γ(a₋)²) vs `gammaRadius N`: N = 2: 4.376879230453 / 4.376879230453; N = 3: 2.581056539840 / 2.581056539840; N = 4: 2.019674148365 both; N = 10: 1.320306382656 both; N = 50: 1.057023124273 both (agreement to 4e−15). | keep |
| `uniform_cusp_asymptotic`, the bound and its uniformity | D = ‖(1−x)^{1/N}(Z₊/(γ_N Z₋) − L₊/L₋)‖·N/|x| in a cancellation-free form (δ± = tails, difference δ₊ − δ₋ summed termwise), sampled at |x| = e^{−M₀N}·{0.999, 0.5, 0.1, 10⁻³} and seven arguments including the negative axis: M₀ = 0.05: N = 2, 3, 5, 10, 30, 100, 400, 2000 give max D = 0.570, 0.699, 0.801, 0.882, 0.943, 0.974, 0.994, 0.9995; M₀ = 0.5: 0.593, 0.726, 0.833, 0.919, 0.979, 0.997, 0.9998; M₀ = 2: 0.655, 0.792, 0.894, 0.962, 0.994, 0.9994. Bounded by 1.0 at every sample, so C(M₀) = 2 serves at the samples; the 1/N scaling is genuine (D tends to 1, not to ∞). | keep |
| `uniform_cusp_asymptotic`, denominators | Re L₋ = −log|x| − 2γ − 2ψ(a₋) > 0: ψ(1/4) = −4.2275, ψ(1/3) = −3.1320, ψ(3/8) = −2.7540, ψ(9/20) = −2.2335, ψ(49/100) = −2.0137, all < −γ = −0.5772. Min |Z(a₋,x)| over 336 points of the disc up to |x| = 0.995: 1.0006 (a = 1/4), 1.0009 (1/3), 1.0012 (0.45), 1.0013 (0.495); min Re A(x) for A = ₂F₁(a,a;1;x) is 0.95, 0.92, 0.86, 0.84. A zero of the series on any logarithmic branch is a fixed point of exp(B/A) in the disc; min(|exp(B/A)| − |x|) = 697.4 (a = 1/4), 8.23 (a = 0.45), so no branch has a vanishing denominator in the disc, which is what §8.1's “satisfy the same bound” needs. | keep |
| `uniform_cusp_asymptotic`, degenerate instances | N = 1: a₋ = 0 makes the series' prefactor `Gamma 0 = 0`, excluded by `2 ≤ N`; M = M₀ allowed and sampled; x on the negative axis sampled (θ = π) with the principal logarithm on both sides. | keep |
| §4.6 coefficient at k = 0 (−2γ sign) | At a = 1/4, x = 10⁻⁶: Z/prefactor = 21.11598724; −log x − 2γ − 2ψ(1/4) = 21.11598629; with +2γ: 23.42484895. | keep; the source's (5.2.10) sign is a misprint |
| §8.1 Nth root | (1−x)^{1/N} by `cpow` is the principal root; for x on the negative axis 1 − x > 1 is real, so the root is unambiguous as the README says. | keep |
| `RootsCover.halfPlaneForm`, `free_deck_presentation`, §1.5, §6.3 N = 2 | Untouched by this diff; carried from the round-5 report with its values (h_N = 2cot(π/2N) = 2.000000, 3.464102, 4.828427, 12.627503; u = [[1,0],[−2,1]]; 13 120 reduced words with no stabilizer violation). | keep (round 5) |
| Conventions; 0.1–0.6; 1.1–1.4; 1.7; 1.8 `RootsCover`; 1.9–1.12; 2.1–2.9; 3.1–3.8; 4.1–4.5, 4.7–4.8; 5.1–5.8; 6.1, 6.2, 6.4–6.8; 7.1–7.10; 8.2–8.7; 9.1–9.19 | Untouched by the diff; carried from the round-4 report (`PRREVIEW-ConformalMappingPartII~4`, 59 rows) with its values: jet of z² is (0,0,2); S(z²)(1) = −3/2; J₂ = u + u³/4 + 2u⁵/15 + …; γ₂ = Γ(1/4)⁴/(4π²), γ₃ = 2.581056539840; N⁶E_N → ζ(3)²/8 = 0.1806; half rotation 1 − F₂(iz)² = 1/(1 − F₂(z)²) = 1.2111859623 at z = 0.1; T(1/(4z), 1/2) = −log 2; Shimizu minimum h₃ over words ≤ 6; cusp height 47.2 ≥ 20.3 at (N, M) = (10, 2); the three means at N = 2 differ by ≤ 0.0965 < log 4; C* = 7 for the finite completion. | keep (round 4) |

**Cross-roadmap and library citations in the changed passages, resolved at this head.** §8.1 *Needs:* Layer 4 §§4.6, 4.8 and Layer 5 §§5.1, 5.3 exist as written; Mathlib `Complex.digamma_one` and `Real.eulerMascheroniConstant` at the lines above. §4.6 *Needs:* `ordinaryHypergeometric`, `ordinaryHypergeometric_eq_tsum`, `Complex.digamma`, `Complex.Gamma`, `Complex.log`, all at the pin. §§8.3 and 8.5 cite FuchsianOrbifolds Layers 0 and 3 (`TauCetiRoadmap/FuchsianOrbifolds/README.md` on main, as in round 5). The `citations.md` leads are not findings: TeschlODE §1.2 (README 162) and McMullenRS §16 (README 336) are source citations, and the six Lean names are the roadmap's own, all declared in `Suggested.lean`.

**Source sample.** Of the seeded targets none falls in the changed passages; the changed §4.6 was read at CDT-journal line 2654 (Lemma 5.1.20, printed p.672) and DLMF-15-8 line 518, and §8.1 at CDT-journal lines 2870–2900 (Lemma 5.2.9, printed p.676; page marker line 2864 is printed 676). The seeded targets (0.2, 1.4, 1.6, 1.8, 2.6, 3.1–3.3, 4.2, 5.3, 7.6, 9.4, 9.8, 9.11, 9.14) are untouched by the diff and were read in rounds 1–5; §5.3's identity was recomputed above because §8.1 now depends on it.

## Not verifiable

- **Hem88**, Theorem 3.1 (pp.97–115): settled as waived; cited by locator only (§§1.7, 2.5), untouched by the diff.
- **KR16**, §1: settled as uncertified; cited by locator only (§8.7), untouched by the diff.
- The constant C(M₀) of §8.1 and the uniform constants of §§4.8, 8.2, 9.19 are proof targets; the sampled values are falsification checks, not certificates.

## Source issues

- **Gap** in CDT-journal at Lemma 5.1.20, printed p.672 (line 2654): the source assumes only that a is not a nonpositive integer; it should also exclude 2a from the nonpositive integers, since a = −1/2 makes the denominator parameter 2a = −1 a pole of the series and of Γ(2a); affects a stated result.
- **Misprint** in CDT-journal at Lemma 5.2.9, equation (5.2.10), printed p.676 (line 2873), repeated at the display after (5.2.15), printed p.677 (lines 2925, 2929): the source writes −log x + 2γ − 2ψ(1/2 ± 1/2N) for the two coefficients; it should be −log x − 2γ − 2ψ(1/2 ± 1/2N), as the proof's 2ψ(1) = −2γ gives (line 2898); affects a stated result.
