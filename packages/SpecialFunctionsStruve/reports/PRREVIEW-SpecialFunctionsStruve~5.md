# Review of SpecialFunctionsStruve (pull request #2129 at 83a3d1d)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: README 39–40 "The roadmap states the corrected forms of DLMF 11.4.15, 11.7.12, 11.11.6 and 11.11.18–11.11.19 (see [Prior formalization](#prior-formalization)) and the corrected sector of 11.11.8 (8.3)."

## Verified sound

| Statement | Instances and values | Result |
|---|---|---|
| README 39–40, the two pointers | Prior formalization (heading 1125, lines 1129–1131) lists 11.4.15, 11.7.12, 11.11.6, 11.11.18–11.11.19: 4 of 4. 8.3 states 11.11.8 at line 986. "(8.3)" matches the style of lines 46, 48, 50 | each number is at its target |
| Each listed correction is stated as corrected | 11.4.15 at line 413, 11.7.12 at 705, 11.11.6 at 966, 11.11.8 at 986, 11.11.18–11.11.19 at 1052 ("for real `ν → +∞` only") | 5 of 5 |
| `isBigO_angerWeberA_scaled`, `λ = ½`, edge | `μ(½) = −0.4509325`, `θ(½) = 0.1425625`, edge `π − θ = 2.9990301` | — |
| same, `ph ν = 2.60` (inside) | remainder after two terms × `|ν|⁵` at `|ν| = 20, 40, 60, 80`: `0.032508, 0.032578, 0.032591, 0.032596`; `4! a₂(½)/π = 0.0326024` | tends to the next term |
| same, `ph ν = 2.90` (inside, near the edge) | `1165, 49.36, 0.5915, 0.0356`; decay rate over `|ν| = 40 → 60` is `−0.3124`; README exponent `−μ cos ψ − π|sin ψ|` gives `−0.3138` | bounded |
| same, `ph ν = 3.10` (outside) | `3.7×10⁸, 5.0×10¹², 1.9×10¹⁶, 4.1×10¹⁹`; `|𝐀_ν(λν)| = 1.25×10¹⁰` at `|ν| = 80`; rate `0.3199`, predicted `0.3199` | fails, as stated |
| 11.4.15 as the README says DLMF prints it | TeX of DLMF-11.4 line 484 has `−1` inside `exp`, as README 416 quotes. Corrected bound `(2/3)(e^{|z|²/(4d)} − 1)`; values carried from `27b55fb` | quote exact |
| `integral_struveH_mul_struveH` hypotheses | integrand at `∞` splits into `t^{−2}`, oscillation × `t^{−ν−3/2}`, oscillation × `t^{−μ−3/2}`, and `t^{−μ−ν−1}` | — |
| same, consequence | the Lean limit of `∫ 0..R` converges iff `Re μ, Re ν > −3/2` and `Re(μ+ν) > 0`; at `μ = 3`, `ν = −2` the integrand is `t^{1/2}` × oscillation | hypotheses exact |
| 11.11.6 as cited (README 968–969) | `ν = ½ + 10i`, `z = 1`: error × `|ν|²` is `1.0500×10¹³` (README "about 1.05 × 10¹³"); divided by `e^{π|Im ν|}` it is `0.2385` | printed form fails, corrected one bounded |
| 11.11.18 as cited (README 1052–1055) | `𝐉_ν(ν)` over the leading term: `0.99975` at `ν = 20`, `2.797×10⁶` at `ν = 20e^{0.3i}` (README "about 2.8 × 10⁶") | real-order restriction needed |

The rows for statements this diff leaves untouched stand as in the previous review, of `27b55fb`.

- **Source locators.** I checked 7 locators against DLMF Release 1.2.8, fetched this round, against the page TeX: DLMF-11.4 lines 482–484 and 505–506; DLMF-11.7 lines 409–413; DLMF-11.11 lines 264–266, 351, 843, 887 and 919–922.
- **Gate.** Rerun with the candidate merge order and `--build`: every scanner `0`, `build=0`, `OK`. The diff since `27b55fb` touches only README (+2/−2). Nothing changed outside the folder against `origin/main`.
- **Dependency check** (the brief's command): `depcheck: 237 roadmaps, 2140 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean` on `Suggested.lean`: 26 `declaration uses sorry` warnings and 13 pinned `#check` outputs, no error. The file is unchanged since `27b55fb`, so the previous signature check and padding probe stand.
- **The pull request's text.** I read the title and description against this head. They list the errata-note corrections (11.4.15, 11.7.12, 11.11.6, 11.11.18–11.11.19) and put 11.11.8's sector in a separate paragraph. Both match README 39–40, 986–988 and 1129–1131. The change adds or removes no section, declaration or supplier.
- **Overlaps.** `overlaps.md` lists none, and the changed sentence cites no other roadmap. The nine names in `citations.md` lie in untouched text and were resolved in earlier reviews (remark only).

## Not verifiable

- I did not fetch DLMF's secondary sources for 11.11.8 and 11.11.18–11.11.19 (Nemes 2014b/c, Olver 1997b, Watson 1944). The corrected forms rest on the computations above.

## Source issues

- **Misprint** in DLMF-11.4 at the sentence after 11.4.15, §11.4(ii) (DLMF-11.4 lines 505–506): the source takes `|ν₀ + 3/2|` as the smallest of `|ν + 3/2|`, `|ν + 5/2|`, `|ν + 9/2|`, …; it should be `|ν + 3/2|`, `|ν + 5/2|`, `|ν + 7/2|`, …; affects nothing.
- **Error** in DLMF-11.7 at 11.7.12, §11.7(ii) (DLMF-11.7 line 413): the source requires only `Re(μ + ν) > 0`; it should also require `Re μ > −3/2` and `Re ν > −3/2` (at `μ = 3`, `ν = −2` the integral diverges); affects a stated result.
- **Error** in DLMF-11.11 at 11.11.6, §11.11(ii) (DLMF-11.11 line 266): the source puts `O(ν^{−2})` in the bracket for complex `ν`; it should be `O(e^{π|Im ν|} ν^{−2})`; affects a stated result.
- **Error** in DLMF-11.11 at 11.11.8, §11.11(iii) (DLMF-11.11 line 351): the source gives the sector `|ph ν| ≤ π − δ` for every fixed `λ > 0`; it should be `|ph ν| ≤ π − arctan(−μ(λ)/π) − δ` for `0 < λ < 1`; affects a stated result.
- **Error** in DLMF-11.11 at 11.11.18–11.11.19, §11.11(iii) (DLMF-11.11 lines 919–922): the 1.1.2 clarification extends them to `|ph ν| ≤ π − δ`; they should hold only as `ν → +∞` through real values, since `sin(νπ) 𝐀_ν(ν)` dominates off the axis; affects a stated result.
- **Misprint** in DLMF-11.11 at the proof sketch of 11.11.18–11.11.19 (DLMF-11.11 line 908): the source writes "Dervivable"; it should be "Derivable"; affects nothing.
