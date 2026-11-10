# Review of ZerosOfLFunctions (pull request #1907 at facf136)

**Verdict:** needs changes

Incremental re-review of the 103 lines changed since `123254c`. Both findings of the previous review are repaired, the gate passes and `Suggested.lean` elaborates with `sorry` as the only warning. One P3 finding, in a sentence the repair of 7.5 rewrote; no blocking finding.

## R01 (P3) — 7.5 says Trudgian's constants are smaller; the leading one is larger

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`:1527–1528: "Trudgian, Theorem 2, states the same count with smaller constants, but Bennett, Martin, O'Bryant and Rechnitzer (§1, p. 2) report that the proofs … are incomplete".

**Claim.** Each constant of Trudgian's Theorem 2 is smaller than the corresponding constant of Hasanalizade–Shen–Wong, Theorem 1.1.

**Witness.** `trudgian2015` line 27 (Theorem 2, `T ≥ 1`): error `0.317 (log d_K + n_K log T) + 6.333 n_K + 3.482`. `hasanalizade2022` line 54: `0.22737`, `23.02528`, `4.51954`. The leading constant `0.317` is larger than `0.22737`; only the other two are smaller. At `n = 1`, `d = 1`, `T = 10¹⁰⁰`: Trudgian `0.317 · 230.26 + 9.815 = 82.81`, against `0.22737 · 228.42 + 27.545 = 79.48` (plus `¼` for `r₁/4`).

**Repair.** Replace "states the same count with smaller constants" by "states the same count with the error `0.317 (log |d_K| + n log T) + 6.333 n + 3.482` for `T ≥ 1` (a larger leading constant and smaller secondary ones)". Tested on the instance above: the new sentence makes no claim that `82.81 < 79.73`. Nothing else in 7.5 or in `Suggested.lean` changes.

## Previous findings

- R01 — repaired: README:1300–1302 "For a primitive nonprincipal `χ` of conductor `q` (real or not; necessarily `q ≥ 3` …)"; `finite_zero_sum_le_logDeriv` has neither `hreal` nor `hq`; a non-real Check is added (README:1351–1355).
- R02 — repaired: README:1512–1532 cites Hasanalizade–Shen–Wong, Theorem 1.1, p. 2, with the derivation of `C = 41`; `riemannVonMangoldt_dedekindZeta` chooses `C` before `K`; the paper is in the References (README:1970–1974). The rewritten Trudgian sentence is R01 above.

## Verified sound

**Gate and build.**
- The gate, run again at `facf136`, prints every counter `0` and `OK` (the worker's line also has `build=0`).
- `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean`: 19 warnings, all `declaration uses 'sorry'`, no error. Pins unchanged: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ZerosOfLFunctions'` is empty.
- No import, `set_option`, definition or docstring form changed in the diff.

**Dependency check.** Output: `depcheck: 236 roadmaps, 2270 edges, 0 problem(s)`. The new sentence at README:1320–1321 names Analytic Number Theory Part I §0.34b as a consumer, outside any `*Needs:*` line; the `*Needs:*` lines of 6.4a and 7.5 are unchanged.

**Signatures of the changed statements** (`#check` on a scratch copy, compared with the README).
- `finite_zero_sum_le_logDeriv : ∀ {q} [NeZero q] (χ : DirichletCharacter ℂ q), χ.IsPrimitive → χ ≠ 1 → ∀ S, (∀ ρ ∈ S, 0 < ρ.re ∧ ρ.re < 1 ∧ χ.LFunction ρ = 0) → ∀ σ, 1 < σ → σ ≤ 2 → … ≤ (logDeriv χ.LFunction σ).re + Real.log q / 2 + gammaLogDerivBound`: the README's statement at 1307–1311, real part on the right, no reality hypothesis.
- `riemannVonMangoldt_dedekindZeta : ∃ C, ∀ (K : Type u_1) [Field K] [NumberField K] (T : ℝ), 2 ≤ T → …` with the exponent `Module.finrank ℚ K`: `C` precedes the field and the degree, as README:1512–1513 and 1540 say.
- `riemannVonMangoldt_heckeLFunction` is unchanged: `∀ n, ∃ C, ∀ K, finrank = n → …`, as README:1514–1515 and 1541 say.
- The module docstring's Layer 7 bullet agrees with the three statements.

**One-tactic probe** of the two changed theorems (`first | simp | rfl | positivity | exact le_rfl`, and `exact ⟨0, by simp⟩` for the count): both fail with unsolved goals. Neither is padding.

**Sources for the changed passages.**
- `hasanalizade2022` line 27 (the count: zeros of `ζ_K` with `0 < β < 1`, `|γ| ≤ T`, with multiplicity), lines 52–54 (Theorem 1.1, page 2 of arXiv v3: every number field, `T ≥ 1`, the term `+ r₁/4`, the constants `0.22737`, `23.02528`, `4.51954`, the argument `d_K (T + 2)^n/(2π)^n`), lines 40–41 and 49–51, 84–85 (the gap in Trudgian's argument and that this paper repairs the Dedekind case). The README's statement, page and version note agree.
- `trudgian2015` lines 25–27 (Theorem 2), for R01.
- 6.4a: `montgomery-vaughan2006` line 1315 (Corollary 10.18 assumes `χ` primitive modulo `q > 1`, no reality), as the previous report recorded; the new sentence "both sources assume only that `χ` is primitive modulo `q > 1`" agrees with it for Montgomery–Vaughan (Theorem 10.16 and Corollary 10.18).
- Seeded sample outside the diff (1.3, 1.4, 1.5, 3.1, 3.2, 3.4, 4.1, 4.5, 5.1, 5.6, 6.1, 7.4, 8.8): untouched text, passed by the previous report at `123254c` and its predecessor; not reread.

**Consistency of the change with the rest of the roadmap.**
- No other passage states the 6.4a inequalities for real characters only: README:1332 and 1950 (the consumer sentences) name §0.34b, which takes the real case; README:1247 ("for real `χ ≠ 1` the value `χ.LFunction σ` is real") is a separate comparison.
- No other passage gives the Dedekind count a degree-dependent constant: 7.6 and the Layer 7 example use only the `O`-form; 6.2 (README:1126) and 8.7 (README:1741) are other theorems and keep their dependence on `n`.

**Ownership and overlaps.** `overlaps.md`: no dropped id, no revision-only id; the other open pull request on this folder is #1913 and the description's merge-order block orders it first. The diff adds no declaration name, so the previous report's ownership search stands.

**Adversarial table: changed statements** (values computed at this head).

| Statement | Instance | Left / claimed | Right / computed | Result |
|---|---|---|---|---|
| 6.4a identity for non-real `χ` | MV (10.33), (10.36)–(10.38), `logDeriv Gammaℝ s = −½ log π + ½ ψ(s/2)` | `∑_ρ m_ρ Re 1/(σ − ρ)` | `Re L'/L(σ) + ½ log(q/π) + ½ ψ((σ+κ)/2) = Re L'/L + ½ log q + logDeriv Gammaℝ (σ + κ)` | ✓ |
| `finite_zero_sum_le_logDeriv` | quartic `χ` mod `5` (`χ(2) = i`, `χ(4) = −1`, odd), `σ = 2`, `S = ∅` | `0` | `≥ −0.5700 + 0.8047 + 1.5724 = 1.807` | ✓ |
| same, one zero kept | `ρ = ½ + 14i`, `σ = 2`, `m = 1` | `1.5/198.25 = 0.00757` | `≥ 1.807` | ✓ |
| "necessarily `q ≥ 3`" | `q = 1`, `q = 2` | `(ℤ/1)ˣ`, `(ℤ/2)ˣ` trivial | only the principal character; `hne` excludes both; `q = 0` excluded by `NeZero` | ✓ |
| *one_zero_le_logDeriv* for non-real `χ` | real zero `β`, multiplicity `m ≥ 1` | `1/(σ − β)` | one of the `m` equal nonnegative summands `Re 1/(σ − β)` of the full sum | ✓ |
| new Check, gamma term | `κ = 1`, `σ = 2` | `logDeriv Gammaℝ 3 = −0.5724 + 0.0182 = −0.554` | `≤ C_Γ = 1.5724` | ✓ |
| 7.5 derivation, `T ≥ 2` | `(T + 2)/(2π) ≤ T/π` | `T + 2 ≤ 2T` | holds iff `T ≥ 2`; so `log(d ((T+2)/2π)^n) ≤ L` | ✓ |
| 7.5 derivation, constants | `23.02528 + 4.51954 + 0.25` | `27.79482 ≤ 27.795` | `27.795/log 2 = 40.100`; `+ 0.22737 = 40.327 < 41`; `L ≥ n log 2 > 0` since `d ≥ 1`, `n ≥ 1` | ✓ |
| `riemannVonMangoldt_dedekindZeta` | `K = ℚ`, `T = 2` | count `0`; main `(2/π) log(2/17.079) = −1.365` | `1.365 ≤ 41 log 2 = 28.42` | ✓ |
| same | `K = ℚ`, `T = 100` | count `58`; main `56.255` | `1.745 ≤ 41 · 4.605`; Theorem 1.1 itself: `|58 − 56.255 + 0.25| = 1.995 ≤ 0.22737 · 2.787 + 27.545` | ✓ |
| same | `K = ℚ(i)`, `d = 4`, `n = 2`, `T = 100` | main `156.636` | `L = log(4 · 10⁴) = 10.597`; bound `434.5` | ✓ |
| same, junk values | continuation `0` | `zeroCount` of the zero function | not `≈ main`, so the statement needs the continuation, as the docstring says | ✓ |
| Trudgian against Hasanalizade–Shen–Wong | `n = 1`, `d = 1`, `T = 10¹⁰⁰` | `82.81` | `79.48` | R01 |

**Adversarial table: untouched statements.** The 43 rows of the previous report (PRREVIEW-ZerosOfLFunctions~40, "Adversarial table") for 1.1, 1.2, 1.4, 3.1, 4.1, 4.3, 4.5, 5.1, 5.2, 5.4, 6.1, 6.2, `completed_orderLE_one`, 7.1, 7.6, `riemannVonMangoldt`, `riemannVonMangoldt_dirichlet`, `riemannVonMangoldt_heckeLFunction`, the three zero-free regions, `hadamard_of_orderLE_one`, `dirichletLFunction_convexity`, `chebyshevPsi_explicitFormula`, 8.2–8.4, 8.6–8.8, the three effective prime counts and `zetaEntireCompletion` are carried forward: the diff touches none of these statements. Headline values from it: `gammaLogDerivBound = 1.572365 = 1 + ½ log π`; `N(100) = 29` against `28.127`; `Li(100)/2 = 14.540` against `13` and `11` primes; 3-4-1 at `θ = 2π/3` gives `½ = 2(1 + cos θ)²`.

**Remark on untouched text** (no change asked). README:1516–1517 still says both statements of 7.5 "are the argument of 7.4 run on *entireCompletion*"; the absolute Dedekind constant is then taken from the cited theorem, which is consistent.

## Not verifiable

- Davenport, *Multiplicative Number Theory* (`davenport2000`): settled as uncertified. The new sentence "both sources assume only that `χ` is primitive modulo `q > 1`" could be read as including Davenport §12; I checked it for Montgomery–Vaughan only.
- Titchmarsh, Lang (`lang1994`), Lagarias–Odlyzko, Iwaniec–Kowalski: as in the previous report; none is cited by a changed passage.
- The published (Math. Comp. 91) numbering of Hasanalizade–Shen–Wong: only arXiv v3 was read, and the README cites that version's numbering.

## Source issues

- **Gap** in trudgian2015 at Theorems 1 and 2, proofs §§4–5: the source treats one of the parameter inequalities of its argument as redundant; it should be verified, as Bennett–Martin–O'Bryant–Rechnitzer §1 and Hasanalizade–Shen–Wong §1 point out; affects a stated result; corrected in print at bennett2021 Corollary 1.2 (Dirichlet) and hasanalizade2022 Theorem 1.1 (Dedekind).
