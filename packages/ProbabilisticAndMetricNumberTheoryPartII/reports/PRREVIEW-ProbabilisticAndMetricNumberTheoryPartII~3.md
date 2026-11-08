# Review of ProbabilisticAndMetricNumberTheoryPartII (pull request #1838 at edc1aee)

**Verdict:** accepted

This is an incremental re-review of the 50 lines changed since 4820065. All of them are in `TauCetiRoadmap/ProbabilisticAndMetricNumberTheoryPartII/README.md`:

- the Scope paragraph on Laplace transforms;
- the Mathlib and Tau Ceti supplier contracts;
- the §2.5 locator, Checks and *Needs:* line;
- one §3.5 Check;
- the References.

`Suggested.lean` and `metadata.toml` are unchanged. Both earlier findings are repaired, and this round found nothing new.

## Previous findings

- R01 — repaired: §2.5 now reads "holomorphy on `a < Re s < b` is Mathlib's `mellin_differentiableAt_of_isBigO_rpow` through the Mellin bullet … PNT+ … `Phi_analyticOnNhd`, is the case of a continuous scalar `f` … on the strip `−(1 + c) < Re s < c`", and the *Needs:* line names the Mathlib declaration.
- R02 — repaired: the References entry now reads "`Phi_analyticOnNhd`. Cited for §2.5."; the IEANTN entry is gone; the board's `sources.toml` records `PNT+` (status `certified`, `cited_for = ["§2.5"]`).

## Verified sound

### Gate, elaboration, dependency direction

- **Worker's gate at edc1aee:** every check is 0 (`set_option`, `blob`, `latex`, `tex`, `prnum`, `sorry-data`, `sorry-examples`, `residue`, `private-paths`, `imports`, `mathlib-subimports`, `no-import-mathlib`, `lean-lines`, `statement-hygiene`, `forbidden`, `dropped`, `readme-ids-missing`, `empty-sections`, `round-labels`, `long-fences`, `layer-ids`, `target-ids`, `depcheck`, `metadata`, `stray-files`, `dirty`, `outside-folder`, `source-material`, `build`), result OK.
- **Gate re-run by this review** (`gate … --base origin/main` on this head): the same counts, all 0, result OK. This invocation prints no `build` field, so the build was checked by elaboration (next bullet).
- **Elaboration:** `lake env lean` on `TauCetiRoadmap/ProbabilisticAndMetricNumberTheoryPartII/Suggested.lean` exits 0 with 0 errors. It prints 16 warnings, all `declaration uses sorry`, at lines 100, 125, 140, 159, 176, 197, 220, 240, 250, 265, 283, 292, 306, 313, 323 and 331, one per theorem.
- **Dependency check** (`gate --depcheck … --movable`): `depcheck: 238 roadmaps, 2349 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. In `ORDER.txt`, ProbabilisticAndMetricNumberTheory is line 60, ArithmeticDirichletSeriesPartII line 90 and this roadmap line 91.
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ProbabilisticAndMetricNumberTheoryPartII'` is empty. The whole pull request is the folder's `README.md` (+1624), `Suggested.lean` (+336) and `metadata.toml` (+1).
- **Carried forward because `Suggested.lean` is unchanged** (`git diff 4820065 HEAD` touches `README.md` only):
  - the earlier comparison of the 25 elaborated signatures with the README;
  - the one-tactic padding probe, in which none of the 16 theorems closed;
  - the headline coverage: `conformal_exponent`, `uniform_counting` and `counting_three` are stated, together with the general theorems `schauder_tychonoff`, `birkhoff_contraction`, `hennion_essential_radius`, `simple_eigenvalue_analytic` and `uniform_renewal_tauberian`, and the module docstring names the two headlines that are not statable (lines 33 and 38).

  `signatures.md` reports 0 lost section binders.

### The changed passages

- **Mathlib contract and Scope** (README lines 61–63, 171–173). At the pin, `mellin_differentiableAt_of_isBigO_rpow` (`Mathlib/Analysis/MellinTransform.lean` 401–405) takes:
  - `LocallyIntegrableOn f (Ioi 0)`;
  - `f =O[atTop] (· ^ (-a))` with `s.re < a`;
  - `f =O[𝓝[>] 0] (· ^ (-b))` with `b < s.re`.

  The ambient instances are `[NormedAddCommGroup E]` (line 180) and `[NormedSpace ℂ E]`, with no `CompleteSpace`. This matches the README's statement ("values in a complex normed space … `b < Re s < a`"). The Scope sentence correctly sets the §2.5 bullet apart by its weaker hypothesis; the spike Check below witnesses the gap.
- **Translation in §2.5** (lines 726–733). The README writes `g(u) = f(log u) = O(u^a)` at `∞` and `O(u^b)` at `0⁺`.
  - In Mathlib's parameters this is `a′ = −a` and `b′ = −b`, which gives differentiability on `−b < Re z < −a`.
  - At `z = −s` this is exactly `a < Re s < b`.
  - The sign `−s` agrees with the Mellin bullet: substituting `u = e^t` turns `u^{−s−1} f(log u) du` into `e^{−st} f(t) dt`.
- **PNT+ restatement** (lines 730–733) against PNT+ lines 319–324. The source takes continuous `φ : ℝ → ℂ` with `φ(x) e^{x/2} = O[cocompact] e^{−(1/2+b)|x|}`, the transform `∫ φ(y) e^{−sy} dy` (the README's convention), and the strip `−(1+b) < Re s < b`. The README renames `b` to `c`; nothing else differs.
- **Tau Ceti contract and the §3.5 Check** (lines 186–196, 937–942), checked against Tau Ceti at pin `2fd255d`:
  - `IsCompactOperator.finiteDimensional_eigenspace` (`Compact/Eigenspace.lean` 56) and `IsCompactOperator.finiteDimensional_genEigenspace_nat` (line 69) assume only `[NontriviallyNormedField 𝕜] [CompleteSpace 𝕜]` and a normed space `E` (lines 48–49), with `μ ≠ 0`.
  - `IsCompactOperator.isClosed_range_pow_one_sub` (`Compact/RieszTheory.lean` 160) and `IsCompactOperator.finiteDimensional_quotient_range_one_sub` (line 183) carry `[CompleteSpace 𝕜] [IsRCLikeNormedField 𝕜] [CompleteSpace X]` (lines 155–157), i.e. a Banach space over `ℝ` or `ℂ`. Both are declared with `_root_`, so the README names are the full names.
  - "At the scalar `1` the eigenspace is `ker(1 − K)`" follows from Mathlib `Module.End.eigenspace_def` (`Mathlib/LinearAlgebra/Eigenspace/Basic.lean` 426: `ker (f − μ • 1)`).
  - The names these replace, `IsCompactOperator.finiteDimensional_ker_one_sub` and `IsCompactOperator.isClosed_range_one_sub`, do not exist at the pin. A grep finds only `finiteDimensional_ker_one_sub_smul_formPerturbationOperator` (`Analysis/InnerProductSpace/Variational/Fredholm.lean` 121) and a PDE variant (`Analysis/PDE/FredholmAlternative.lean` 172). The change therefore repairs two dead citations.
- **References** (lines 1578–1581). In lines 1–1555 the occurrence counts are: GMR19 52, Lalley 4, Liverani 3, Morris 1, Kloeckner 3, Hennion 8, PNT+ 2, IEANTN 0, `meromorphicOrderAt` 0. Every remaining entry is cited. `roadmaps resolve` finds no unresolved citation or Lean name.
- **Dependents of §2.5.**
  - §6.2 cites §2.5 for the Mellin form; §6.4 cites it for the one-sided transform on `Re s > a`. Neither uses the changed locator.
  - §6.2 is also in this round's seeded sample, so it was checked at its locator against GMR19 §4.1, pp.790–791. The two-sided transform is defined at GMR19 lines 1907–1913, (4.2) with the `1/s` term at lines 1917–1925, (4.3) at line 1934, and (4.4) `N̂ = s^{−1}(1 − L_s)^{−1} 1` at line 1944.
  - The source sets convergence aside there; its footnote 18 (line 1962) points to Lemma 35 (line 1972), which treats only `L_s` on `C⁰` for `Re s > 1`. The README accordingly proves absolute convergence for `Re s > β` by its own route through §6.1. Locator and statement agree.
- **Seeded sample:** of the 15 targets (0.1, 0.4, 1.2, 2.1, 2.2, 3.2, 3.3, 4.2, 4.3, 5.1, 6.1, 6.2, 6.5, 6.6, 6.7), only 6.2 falls in the changed passages or cites them. It was verified as above. The others are covered by the carried-forward adversarial rows.
- **Unverified flags:** the README flags no locator as unverified (a grep for `unverified`, `not verified` and `uncertified` finds 0 hits).
- **Overlaps and ownership of what the change touches:**
  - `overlaps.md` lists no other pull request changing this roadmap and no dropped id.
  - `roadmaps grep` for `mellin_differentiableAt_of_isBigO_rpow`, `bilateral Laplace` and `two-sided Laplace` finds that AutomorphicLFunctionsAndLocalFactors, AsymptoticExpansions and AnalyticNumberTheoryPartIII cite the same Mathlib declaration, and that AnalyticNumberTheoryPartI uses a two-sided transform inside its explicit formula. None of them states strip holomorphy as a target.
  - ArithmeticDirichletSeriesPartII §0.1 (at its open head) owns `HasLaplace` without strip holomorphy, and its Gamma–Laplace adapter (AnalyticNumberTheoryPartII 4.5c) is a different statement.
  - So the §2.5 bullet has one owner.

### Adversarial table

Rows for the changed statements, computed this round:

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| §2.5 power-bound route through Mathlib | `f = e^{−|t|}`, `a = −1`, `b = 1`; `g = min(u, 1/u)` | `g = O(u^{−1})` at `∞`, `O(u)` at `0⁺`; Mathlib `a′ = 1`, `b′ = −1`, so `−1 < Re z < 1`, and `z = −s` gives `−1 < Re s < 1` | whole strip, as the Check says |
| §2.5 Check, `e^{−|t|}` values | `s = 1/2, −1/2, 0.9` | trapezoid on `|t| ≤ 60`: `2.6666667` at `±1/2` against `2/(1 − s²) = 8/3`; Mellin side `∫₀¹ u^{−1/2} + ∫₁^∞ u^{−5/2} = 2 + 2/3`; at `0.9`: `10.5015 +` tail `10e^{−6} = 0.0248` gives `10.5263 = 2/0.19` | consistent |
| §2.5 PNT+ restatement on `e^{−|t|}` | `c = 0, 0.1, −1/4`; `x = 50, 100` | ratio `|φ(x)e^{x/2}|/e^{−(1/2+c)|x|}`: `1, 1` (`c = 0`), `148.4, 22026` (`c = 0.1`), `3.7·10⁻⁶, 1.4·10⁻¹¹` (`c = −1/4`), so `c ≤ 0`; strips `(−1, 0)` at `c = 0`, `(−3/4, −1/4)` at `c = −1/4`; union `(−1, 0)` | Check's "only `−1 < Re s < 0`" holds |
| §2.5 spike Check `f = Σ e^{2n} 1_{[n, n+e^{−4n}]}` | `c = −1.5, −1.9, 0.5, −2`; `n = 1, 2, 5` | exact block `∫ e^{2n} e^{−ct}` against `e^{|c|}e^{−(c+2)n}`: `0.615 ≤ 2.718`, `0.368 ≤ 1.649`, `0.082 ≤ 0.368` (`c = −1.5`); `0.921 ≤ 6.05`, `0.819 ≤ 5.47`, `0.607 ≤ 4.06` (`c = −1.9`); `0.0817 ≤ 0.135`, `0.0067 ≤ 0.0111` (`c = 0.5`); at `c = −2` blocks `1.019, 1.000` (divergent, so `−2` is sharp); `f(n)/e^{1.9n} = 2.72, 148, 22026` at `n = 10, 50, 100` | hypothesis holds on `(−2, ∞)`; power bound only for `a ≥ 2` |
| Mathlib contract | statement at line 401 | hypotheses `=O[atTop] (·^(−a))`, `=O[𝓝[>] 0] (·^(−b))`, `b < Re s < a`, `NormedSpace ℂ E`, no completeness | matches |
| Tau Ceti contract | `K = diag(1, 0)` on `ℂ²`; `K = 0` on `ℓ²`, `μ = 0` | eigenspace at `1` = `ker(K − 1)` = `span e₁` = `ker(1 − K)`, dimension 1; `range(1 − K) = span e₂`, closed, cokernel dimension 1; at `μ = 0` the eigenspace of `0` is all of `ℓ²`, infinite-dimensional, which `μ ≠ 0` excludes | matches the pinned statements |
| §3.5 Check | compact `T`, `p = ‖·‖`, `k = 1`, `R = ‖T‖`, `r = 0` | `‖Tf‖ ≤ ‖T‖‖f‖ + 0¹‖f‖`; `(1 − K)^1 = 1 − K`, so `isClosed_range_pow_one_sub` at `n = 1` is closed range of `1 − K` | consistent |
| §6.2 (dependent, sampled) | `n = 3`, `w = (1/2, 1/2)`, `s = 3` | empty word `∫₀^∞ e^{−3r} dr = 1/3` (a Stieltjes convention gives `1`); length-one words `q_A = (A+3)/2`, `s^{−1} L₃1 = (8ζ(3) − 9)/3 = 0.20549`, direct sum `0.616455/3` | consistent |

Rows carried forward from the previous report (review of 4820065, adversarial table, itself carrying the review of 08e41f3); the diff leaves these statements untouched:

| Statement | Instances | Values |
|---|---|---|
| `orderedSimplex d` (0.1) | `d = 1, 2, 0` | `[0, 1/2]`; `(1/2, 1/2)` excluded (`w₃ = 0`); one point |
| §0.5 C¹ calculus | `f = g = x` on `[0,1]`; `Φ(x) = 2x` | `‖fg‖_{C¹} = 3 ≤ 4`; `‖f∘Φ‖_{C¹} = 3 ≤ 4` |
| §1.1 core and cusp | `n = 4`: `(1/5,1/5,3/5)`, `(0,0,1)`, `(0,1/2,1/2)` | both pieces; cusp only; core only |
| `branchDenom`, `branchMap` (0.2) | `n = 4`, `w = (1/6,1/3,1/2)`, `(0,1)` | `q = 11/6`, `F = (2/11, 3/11, 6/11)` |
| `wordDelay`, `wordCount` (0.3) | `w = (1/2,1/2)`, `r = log 2`; `r < 0`; `r = 0` | `N = 3`; `0`; `1` |
| `C1BoundedOn` (0.4) | `f = 2x₀ + 3` on `[0, 1/2]` | least bound `6` |
| `eventual_contraction` (1.3), §1.2 | single branch; blocks | `‖dγ₂‖₁ = 4/3`; `4/9`, `7/25`; `|det dγ₁| = 216/1331` |
| §1.4 attractor | `n = 3`, `u = [(0,1),(1,1)]` | fixed point `2 − √3 = 0.26795`; `x = 0` not coded |
| `transferOp` (2.1, 2.2) | `n = 3`, `s = 2`, `f = 1` | `ζ(2) − 1 = 0.6449`, upper `4(ζ(2) − 5/4) = 1.5797`; printed factor `2` gives `0.7899` |
| §2.4 derivatives | `w = (0,1)`, `s = 2` | `ζ′(2) = −0.9375`; `Σ(log k)²/k² = 1.9892` |
| `schauder_tychonoff` (3.1) | `C = ∅`; `[0,∞)` with `x + 1`; circle rotation | no fixed point in each negative control |
| `IsEigenprobability`, `eigenprobability_three` (3.2) | `ν = 2dw₁`, `f = w₁²` | both sides `1/12`; `δ₀` fails |
| `birkhoff_contraction` (3.3) | `K = [[2,1],[1,2]]` | `log 4`, `tanh(log 4/4) = 1/3`, `0.2231 ≤ 0.2310` |
| §3.4 `χ` | `B₁ + ∅` | `χ(∅) = 0 ≠ 1 = χ(B₁)` |
| `hennion_essential_radius` (3.5) | `r ≥ ρ(T)`; `(1/2)id` on `ℂ` | vacuous; spectrum `{1/2}` |
| `ruelle_perron_frobenius` (3.7) | `n = 3`, `σ = 2` | `λ = 1`, `∫h₂ dν₂ = 1.0000` |
| `simple_eigenvalue_analytic` (4.1, 4.2) | `T(z) = e^z`; `[[0,1],[z,0]]` | `ev′(0) = 1`; `±√z` excluded |
| `uniform_ruelle_perron_frobenius` (4.3) | `a > b` | vacuous; constants quantified before `σ` |
| §§5.1–5.2 non-lattice | as recorded there | gaps `0.4002, 0.3134` |
| `wielandt_separation` (5.3) | constant delays | radius `λ_σ` at `tc ∈ 2πℤ` |
| `pressure_eigenvalue` (5.4) | `n = 3`, `σ = 2` | `λ′₂ = −π²/(12 log 2) = −1.1866` |
| §6.1 bound | `w = (1/2,1/2)`, `r = log 2` | `N e^{−2r} = 3/4 > 6/π²` |
| `uniform_renewal_tauberian` (6.5) | one point, `α = e^{at}` | `F = 1/(s − a)`, `B = 1` |
| `conformal_exponent` (6.6) | `s ≤ 1` | impossible (native sum `0 = 1`) |
| `uniform_counting`, `counting_three` (6.7, 7.2) | `R = 150`, `w₁ = 0, 1/4, 1/2` | `N = 6858, 9124, 13699` against `6839.2, 9118.9, 13678.4` |
| `conformal_exponent_pseries` (7.4) | `n = 3, 4` | roots `1.72865`, `2.42411` enclose `2` |
| `conformal_exponent_mono` (7.5) | `w = (1/3, 2/3)` | `q_{(A,1)} = 1 + (A+1)(2/3) = q_{(A,2)}(0, 1/3, 2/3)` |
| 7.1, 7.3, Lalley (7.7) | as recorded there | `64/81`; Rauzy matrices; `(1−λ)⁻¹h + h` against `(1−λ)⁻¹h` |

### Library declarations opened at the pins this round (8)

- Mathlib `mellin_differentiableAt_of_isBigO_rpow` (`Mathlib/Analysis/MellinTransform.lean` 401), its variable blocks (42, 180), and `mellin_differentiableAt_of_isBigO_rpow_exp` (422).
- Mathlib `Module.End.eigenspace` (`Mathlib/LinearAlgebra/Eigenspace/Basic.lean` 423) and `eigenspace_def` (426).
- Tau Ceti `IsCompactOperator.finiteDimensional_eigenspace` (`TauCeti/Analysis/Normed/Operator/Compact/Eigenspace.lean` 56) and `finiteDimensional_genEigenspace_nat` (69).
- Tau Ceti `IsCompactOperator.isClosed_range_pow_one_sub` (`TauCeti/Analysis/Normed/Operator/Compact/RieszTheory.lean` 160) and `finiteDimensional_quotient_range_one_sub` (183).

## Not verifiable

- Nothing in the changed passages. The items recorded as not verifiable in earlier reports concern untouched text and stand as recorded there.

## Source issues

- none
