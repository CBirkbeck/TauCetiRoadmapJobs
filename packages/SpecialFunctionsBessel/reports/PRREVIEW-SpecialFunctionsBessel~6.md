# Review of SpecialFunctionsBessel (pull request #1987 at d095480)

**Verdict:** accepted

Incremental re-review of the 8 lines changed since `a310139` (all in `TauCetiRoadmap/SpecialFunctionsBessel/README.md`, section 8.3). No finding. The single finding of the previous review is repaired, the repair introduces no new problem, the gate passes and `Suggested.lean` (unchanged) elaborates with `sorry` as the only warning.

## Previous findings

- R01 — repaired: lines 1294–1296 state 10.22.74 for `A > 0` and `A < 0`, give `0` at `A = 0` only for `Re ν > ½`, and state nothing for `−½ < Re ν ≤ ½`; lines 1302–1305 add the negative control at `(3, 2, 1)`.

## Verified sound

**The changed passage (8.3, lines 1294–1296 and 1302–1305), recomputed independently of the previous report.**
- *`A = 0`, `Re ν > ½` gives `0`.* The integrand is `O(t^{2 Re ν + 1})` at `0` and `O(t^{−Re ν − 1/2})` at infinity, uniformly for `a` in a compact subset of `(0, ∞)`, so it is absolutely integrable exactly when `Re ν > ½` and the integral is continuous in `a` by dominated convergence. From `A > 0` the value has modulus proportional to `A^{Re ν − 1/2} → 0`; from `A < 0` it is `0`. Both one-sided limits agree, as the README says. The statement is symmetric in `a, b, c`, so the boundary `a = |b − c|` is covered by the same argument.
- *The constant term.* With `a = b + c` and `φ = νπ/2 + π/4`, `cos(at − φ) cos(bt − φ) cos(ct − φ) = ¼[cos((a+b+c)t − 3φ) + cos(2bt − φ) + cos(2ct − φ) + cos φ]`: the non-oscillating term is `¼ cos(νπ/2 + π/4)`, as written. At `ν = 0` it is `¼ cos(π/4) ≠ 0` against `t^{1−ν} · t^{−3/2} = t^{−1/2}`: divergence. At `ν = ½` it vanishes, consistent with the conditional convergence there.
- *The value at `ν = ½`.* With `J_{1/2}(x) = (2/(πx))^{1/2} sin x` and `sin at · sin bt · sin ct = ¼[sin 2bt + sin 2ct − sin 2at]` for `a = b + c`, the integral is `(2/π)^{3/2} (abc)^{−1/2} · ¼ · (π/2) = 1/(2 (2π abc)^{1/2})`; at `abc = 6` this is `1/(2 (12π)^{1/2}) = 0.08143 37519 838…`, and the `A > 0` formula `1/(2π abc)^{1/2}` gives `0.16286 75039 68…`. Both printed values are correct to every digit shown.
- 8.3 has no counterpart in `Suggested.lean` (grep for `10.22.7` in the Lean file: no hit), so no Lean statement depends on the changed text. The scope table row at line 113 (10.22.73–10.22.75 in 8.1–8.3) and the `*Needs:* 8.2` line are unaffected. Nothing else in the README cites the `A ≤ 0` case.

**Adversarial table: the changed statement.** Plain Python, double precision (series for `x < 12`, Hankel asymptotics beyond, closed form at `ν = ½`; composite Simpson, step `0.01`).

| Statement | Instance | Computed (partial integrals to `R = 100, 400, 1600`) | README | Result |
|---|---|---|---|---|
| 10.22.74, `A = 0`, negative control | `(3, 2, 1)`, `ν = 0` | `0.73203, 1.46775, 2.93353` (doubling with `R^{1/2}`) | diverges; nothing stated | Check correct |
| 10.22.74, `A = 0`, negative control | `(3, 2, 1)`, `ν = ½` | `0.08129, 0.08150, 0.08145`; exact `0.0814337520` | `0.08143 37519 8…`, not `0`; nothing stated | Check correct |
| 10.22.74, `A = 0`, `Re ν > ½` | `(3, 2, 1)`, `ν = 1` | `0.00735, 0.00366, 0.00183` (halving with `R^{−1/2}`) | `0` | holds |
| 10.22.74, `A < 0` | `(4, 2, 1)`, `ν = ½` | `0.00041, −0.00010, −0.00003` | `0` | holds |
| 10.22.74, `A > 0` | `(2.9, 2, 1)`, `ν = ½`, `A = 0.27324` | `0.16643, 0.16595` at `R = 400, 1600` | `1/(2π · 5.8)^{1/2} = 0.16565` | holds; tends to `0.16287` as `a → 3⁻`, twice the boundary value |

**Adversarial table: untouched statements.** Carried forward unchanged: the 13 rows for the statements changed at `a310139` (report `PRREVIEW-SpecialFunctionsBessel~5`: 10.22.75 with its Checks, 9.8.9–9.8.12, the 10.40.1 Check, `gegenbauerC` against LaguerreJacobi F2) and the 48 rows of `PRREVIEW-SpecialFunctionsBessel~3` (`besselY`, `besselK`, Wronskians, recurrences, connection formulas, generating functions, `hasSum_besselJ_gegenbauer`, the integral representations, `tendsto_convs_besselJ`, the Kummer form, 10.40.2, Debye's expansions, the zeros and McMahon, `hasProd_besselJ`, 10.22.64, `exists_integral_cpow_mul_exp_mul_besselJ`, `integral_cpow_mul_besselK`, the spherical and Kelvin rows, Bickley, `O_n`, `airyAi_eq_besselK` with its control). The diff touches none of these passages and no Lean statement.

**Gate, order and build at `d095480`.**
- The worker's gate with the candidate merge order: every rule `0`, `OK`. My own run without that order differs only in `depcheck: NOT IN ORDER`, the placement of a roadmap the order does not list yet (not a finding).
- Dependency check with the candidate order and `--movable`: `depcheck: 234 roadmaps, 2265 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `lake env lean` of `TauCetiRoadmap/SpecialFunctionsBessel/Suggested.lean`: 49 warnings, all `declaration uses sorry`, the `#check` pins of library declarations, no error. The file is byte-identical to the one read at `a310139`, so the one-tactic probe and the comparison of the 86 elaborated signatures with the README (0 lost binders) stand as reported there.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml`; the pull request changes nothing outside it.
- Overlaps: no open pull request changes this roadmap, drops an id it cites, or cites an id it drops. The change adds no supplier citation and no object another roadmap could own (a grep for `10.22.7` over the Lean file and the README finds only 8.3 and the scope row).

**Seeded sample.** None of the sampled targets (1.1, 1.2, 1.5, 2.1, 2.2, 3.3, 4.2, 5.5, 7.6, 8.4, 9.2, 9.3, 10.1, 11.1, 11.3) falls in the changed passage; they were not re-read. The README flags no locator as unverified in the changed lines. The changed passage's own locator, DLMF 10.22.73–10.22.75 (§10.22(iv)), was checked against the text in the previous round; the new wording departs from the print deliberately and says so.

**Remark on untouched text (no change requested).** The description lists eight suppliers and then says "The README links into all seven"; the head has eight.

## Not verifiable

- **Watson 1944**, p. 411 (DLMF's source for 10.22.74–10.22.75): no legal open copy; not read. The `A = 0` statements rest on the derivation and the computations above.
- **Ownership against open pull requests** was checked this round only for the changed passage (the triple-product integrals); the other open roadmaps were not re-read.

## Source issues

- **Error** in DLMF-Bessel at 10.22.74, §10.22(iv), online Release 1.2.8: the source says the triple-product integral is zero whenever `A ≤ 0`, for all `Re ν > −½`; it should say `A < 0`, with `A = 0` giving zero only for `Re ν > ½` (divergent at `ν = 0`, half the `A > 0` value at `ν = ½`); affects a stated result.
