# Review of AnalyticNumberTheoryPartIII (pull request #2008 at 69f498b)

**Verdict:** accepted

This is an incremental re-review of the 18 changed lines since `c919ce6` (11 insertions, 7 deletions, all in `TauCetiRoadmap/AnalyticNumberTheoryPartIII/README.md`; `Suggested.lean` and `metadata.toml` are unchanged). The single previous finding is repaired, the repair introduced no new problem, and the gate passes at this head. No finding remains.

## Previous findings

- R01 — repaired: lines 1365–1366, Layer 11 `### Dependencies`: "Mathlib arithmetic functions, `LSeries`, Euler products, `Ring.multichoose`; Tau Ceti's binomial series `TauCeti.hasSum_multichoose_mul_geometric_complex_of_norm_lt_one` (for 11.2); ProbabilisticAndMetricNumberTheory §0.1a; AnalyticNumberTheoryPartI §§3.3 and 3.24a and ArithmeticDirichletSeriesPartII §5.1 for Checks." The paragraph now names every supplier of the layer's two *Needs:* lines (11.2 at lines 1278–1284, 11.4).

## Verified sound

### The changed passages, one by one

The diff touches five passages. Each is a summary paragraph; I checked each against the *Needs:* lines it summarises and against the pinned Tau Ceti (`2fd255d99`, the pin of `lake-manifest.json`).

1. **From Tau Ceti bullet (lines 116–121).** Adds "the binomial series of `Ring.multichoose` on the complex open unit disc (`TauCeti.hasSum_multichoose_mul_geometric_complex_of_norm_lt_one`), the local factor of 11.2." The declaration is `TauCeti/Analysis/Analytic/Binomial.lean:46`, namespace `TauCeti`: for `r z : ℂ` with `‖z‖ < 1`, `HasSum (fun n => Ring.multichoose r n * z ^ n) (1 / (1 - z) ^ r)`. The gloss ("binomial series", "open unit disc") matches the hypothesis `‖z‖ < 1` and the sum exactly. The same name is listed under the From Tau Ceti contract at line 332 and in 11.2's *Needs:* at line 1282, so the bullet summarises an existing contract rather than adding one.
2. **Layer 7 Dependencies (lines 635–638).** Now names "the truncated Perron kernel `TauCeti.truncatedPerronKernel_one` (ArithmeticDirichletSeries §6.3, for the Perron instance and its Check)". `truncatedPerronKernel_one` is `TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/Basic.lean:204`, namespace `TauCeti`: `truncatedPerronKernel 1 c T = π⁻¹ arctan(T / c)` for `c ≠ 0`. It is the name 7.3's *Needs:* line (572) cites "for the instance", and the Check at line 556 uses it. ArithmeticDirichletSeries is on main under `Completed/`, and its §6.3 (README line 267, "Truncated Perron") is the section that defines that kernel, so the parenthesis points at the right owner. The old text's "ArithmeticDirichletSeries §6.3 for the Perron Check" is kept in substance.
3. **Layer 8 Dependencies (lines 841–843).** "Tau Ceti residue theorem" becomes "Tau Ceti residues and the residue theorem for null-homologous curves". The layer's *Needs:* lines (8.1 at line 686–687) cite `TauCeti.Contour.classicalResidueTheorem_nullHomologous` and `TauCeti.Contour.residue`; both exist at the pin (`Analysis/Contour/Residue/Cycle.lean:226`, namespace `TauCeti.Contour`, and `Analysis/Contour/Residue/Basic.lean:80`). The new wording names both objects the layer uses.
4. **Layer 10 Dependencies (lines 1134–1136).** Adds "and the finiteness of ray class groups". 10.3's *Needs:* (lines 1122–1124) cites `TauCeti.GlobalNumberFields.finite_rayClassGroup`, which is the instance at `NumberTheory/NumberField/Global/RayClass/Finite.lean:155`. The paragraph now matches the *Needs:* line.
5. **Layer 11 Dependencies (lines 1365–1366).** The R01 repair, checked above.

None of the changed passages alters a statement, a hypothesis, a locator or a supplier section; they are summaries, and each is now complete and accurate for the *Needs:* lines beneath it. The change adds no cross-roadmap citation beyond ArithmeticDirichletSeries §6.3, which was already cited at the same place.

### Gate, build, dependency check, elaboration

- **Gate.** Rerun at this head: every counter is 0 (`set_option`, `latex`, `tex`, `prnum`, `sorry-data`, `imports`, `readme-ids-missing`, `statement-hygiene`, `round-labels`, `depcheck`, `stray-files`, `dirty`, `outside-folder`, `source-material` and the rest), result `OK`, exit 0. The worker's gate at this head reports `build=0` as well.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AnalyticNumberTheoryPartIII'` is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` only.
- **Dependency check.** Output: `depcheck: 238 roadmaps, 2352 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0; its only output is 27 "declaration uses `sorry`" warnings, one per sorried theorem, and nothing else.
- **Signatures and padding.** `git diff c919ce6 HEAD -- Suggested.lean` is empty, so the 35 elaborated signatures compared with the README in the previous report, and the one-tactic probe in which none of the 27 theorems closed, stand unchanged.

### Citations, overlaps, ownership

- The resolver lists one Lean name found nowhere: `IsCompletelyAdditive.powOfAdditive_mul` at README line 394, inside the ProbabilisticAndMetricNumberTheory §0.1a contract. It is stated at the open head of ProbabilisticAndMetricNumberTheory (`d311ebe1`), README line 323, in plain prose without backticks, which is why the resolver missed it. Not a defect, and the passage is untouched by the diff.
- The overlaps tool reports no open pull request that changes this roadmap, no dropped id and no id that only an open revision defines. The change adds no definition or carrier, so no new ownership question arises.
- In `ORDER.txt` this roadmap sits after every supplier it names (LFunctions, ZerosOfLFunctions, AnalyticNumberTheoryPartI, ProbabilisticAndMetricNumberTheory, ArithmeticDirichletSeriesPartII, ExplicitZetaBounds, ExplicitPrimeCounting); ArithmeticDirichletSeries, ContourIntegration and the Tau Ceti modules are on main or at the pin.

### Headline theorems

Unchanged by the diff: Fourier decay and principal-value inversion with its window (Layer 7); the rectangle residue theorem, the L-shaped shift, the derivative Borel–Carathéodory and Landau's lemma (Layer 8); the smoothed cutoff (Layer 9); the smoothed sum, the Ingham transfer and the Hecke `L′/L` bound (Layer 10); `σ_ν`, `d_z`, Ramanujan, and the four classical series (Layer 11); Hardy–Landau (Layer 12); Erdős 392 and the Goldbach interval transfer (Layer 13). All are stated in `Suggested.lean`, none through a stand-in.

### Sources

The diff changes no locator and no statement. The seeded targets (7.1–7.3, 8.1, 8.1b, 8.2, 8.3, 9.1–9.3, 10.1, 10.2, 11.2, 11.4, 13.2) fall in untouched text; their locators were verified in the previous reports and are not re-verified here. The only texts this round opened are the pinned Tau Ceti files named above and ArithmeticDirichletSeries' README on main.

### The adversarial pass

Rows marked "r3" are carried from the previous report, which computed them; their statements are untouched. The two new rows check the Tau Ceti inputs the changed paragraphs name, with values computed in scratch Python.

| Statement | Instances tried | Values computed (left vs right) | Result | Change |
|---|---|---|---|---|
| From Tau Ceti: binomial series `Σ mc(r, n) zⁿ = 1/(1 − z)^r` on `‖z‖ < 1` (new wording) | `r = ½, z = ¼`; `r = −1, z = ½` (the series terminates: `1 − z`) | `1.1547005` vs `(¾)^{−½} = 1.1547005`; `0.5` vs `1 − ½ = 0.5`; `mc(½, 3) = 0.3125` | the gloss matches the pinned statement | none |
| Layer 7 Dependencies: `truncatedPerronKernel 1 c T = π⁻¹ arctan(T/c)` (new name) | `c = 1, T = 1`; `c = 1, T = 10⁶` | `¼` vs `π⁻¹·(π/4) = ¼`; `0.4999997 → ½`, the half-weight 7.3's Check at line 556 states | matches the pin and ADS §6.3's endpoint value | none |
| r3: 7.3 windowed error | `h = 1_[0,1]`, `e^{−σu}1_{u≥0}`; 7.2 at `x = π` | `sup|h| = 1 ≤ V = 2`; `|π/2 − I(π)| = 0.2811 ≤ 0.6366` | holds | none |
| r3: 11.2 `d_z ⋆ d_w = d_{z+w}` | `z = ½, w = i, a = 3, 4` | `−0.4375 + 0.7916667i` both; `−0.5807292 + 0.5833333i` both | holds | none |
| r3: 11.2 `abscissaOfAbsConv_sigmaC` | `ν = 1 + 2i, −½ + i, 0, 2i` at small primes; `ν = i`, `σ → 1⁺` | `2.39454 ≥ 1`, `0.93054 ≥ 0.29289`, `2 = 2`, `0.07726 ≥ 0.00298`; cosine sums `0.197, 0.180, 0.165, 0.159` bounded | holds | none |
| r3: 11.2 `LSeries_generalizedDivisor` | `z = 0.3 + i, X = ¼`; `s = 2`, `z = ½, 0.3 + i, −1` | `1.0453382 + 0.3093053i` both; `1.2825491` vs `1.2825496`; `0.6079271` vs `1/ζ(2) = 0.6079273` | holds | none |
| r3: gloss of `eulerProduct_log_eq_LSeries` | trivial character, `s = 2` | `0.497700297` vs `L(Λ/log, 2) ≈ 0.497690` vs `log ζ(2) = 0.497700302` | holds | none |
| r3: 11.2 `abscissaOfAbsConv_generalizedDivisor` | `d_z(p)` at `z = 0.3 + i, −1`; `Σ_{p≤N} 1/p` | `2.1981, 2.7053, 3.0414` at `N = 10³, 10⁵, 10⁷`; `z = 0` gives `⊥` | holds; `z ≠ 0` needed | none |
| r3: 11.4 abscissas | `2^ω ≤ τ` to `2·10⁵`; `(p − 1)/p² ≥ 1/(2p)`; `Σ φ(n)/n²` | no violations; `4.897, 6.297, 7.696`, step `1.3996 ≈ (6/π²) log 10`; wrong abscissa `1` refuted by `37.9, 121.0, 383.9` | holds: `2` | none |
| r3: Conventions | `𝓕1_[0,1](½)`; `4^{½}`; `log ζ(2)`; Cesàro at `N = 2`; `LSeries 1 1` | `−2i/π`; `2`; `0.497700`; `½`; junk `0` | hold | none |
| r3: 7.1 decay, derivative and `C²` forms | `1_[0,1]` at `ξ = ½, 0`; `1_[0,∞)`; tent; `1/(1 + t²)` | `2/π = 2/π`; `1` vs junk `0`; `4/π² = 4/π²`; `π ≤ 6.442` | hold; `ξ ≠ 0` needed | none |
| r3: 7.2 | `x = 5, π, −1` | `0.020865 ≤ 0.4`; `1.85194 > π/2`; `2.517` vs `−2` | holds; `x > 0` needed | none |
| r3: 7.3 `tendsto_truncated_mellinInv` and windowed values | `1_(0,1]`, `σ = 1, T = 10`; `(σ, T) = (1, 10), (10, 1), (1000, 1)` | `0.46827 → ½`; `0.0317, 0.4683, 0.4997` vs `0.894, 8.94, 89.4` | holds | none |
| r3: 7.4 Brown | `W = 1`, `G = e^{−πiξ/2}` on `(1, 3)`, `t = ¼` | error `4` vs `4` | holds with equality | none |
| r3: 8.1, U-shaped, 8.1a, 8.1b | `1/s`, `1/s²`, `exp(1/s)`; `eˢ/s` at `w = 0.5 + 0.5i, T = 2` | `2πi`, `0`, `2πi` vs junk `0`; `π/2 = −π/2 − π + 2π`; `−0.852950 + 3.701501i` both | hold; meromorphy and disjointness needed | none |
| r3: 8.2, 8.3 | `−2z/(1 − z)`, `k = 0..3`; `(z − 0.3)e^{2z}` | `8, 32, 192` both; `1 ≤ 0` at `k = 0`; `M = 2.847`, left `2` | hold; `k ≥ 1` needed | none |
| r3: 9.1–9.4 | `e^{−t}`, `1_(0,1]`; `(x − 1)²(2 − x)²`; `ε = ½`; `ν = (2/3)x`, `s = 1.3 + 2i` | `0.8646647` both; `∫ν = 1/30`; support `[0.7071, 1.4142]`; `0.329708 − 0.303958i` both | hold | none |
| r3: 10.1–10.3 | `a ≡ 1, X = 2`; `η = 1/log t, log x = 100`; `η = c/log t`; `K = ℚ, χ = 1` | `½` vs `C(2ε + 1)`; `20`; `η(3) ≤ ½` iff `c ≤ 0.5493`; residue `+1 = δ_χ` | hold; `+1` needed | none |
| r3: 11.1, `sigmaC`, 11.3, 11.4 series | `λ, μ, μλ`; `(1, 6), (−1, 6), (½, 4)`; `α = 1, β = 0, s = 3`; `s = 3, 4` | `λ(4) = 1`, `μ(4) = 0`; `12, 2, 4.41421`; `3.770344` vs `3.770497`; `1.4203083, 1.1815649, 0.8463352, 1.1106265` | hold | none |
| r3: 12.1 | `(−1)ⁿ`; `aₙ = 1`; shift `a₀` | means `0.5`; divergence; both limits move by `d` | holds | none |
| r3: 13.1 | `(16, 4)`, `(4, 4)`, `B = n = 10`, `B = 100`; lower bound | `2, 3, 7, 4`; `t ≥ n/2 − n/(2 log n) + O(1)` | holds | none |
| r3: 13.2 | `H = 30, 33`; `Δ = 2, x₀ = 2`; `Δ ≤ 0`; Ramaré–Saouter; Kadiri–Lumley | `30 = 7 + 23`, `33 = 3 + 7 + 23`; `OddGoldbachUpTo 56`; empty windows; `e⁵⁹ < 1.1325·10²⁶ < e⁶⁰` | holds | none |

## Not verifiable

- The settled uncertified texts (`montgomeryvaughan2007`, `titchmarsh1986`, `iwanieckowalski2004`, `tenenbaum2015`, `apostol1976`, `hardy1949`, `katznelson2004`, `brown1967`) are cited only in text the diff leaves untouched; nothing in the change depends on them.
- `dlmf-ch6`: the cached extraction holds only the chapter's contents; the change cites nothing new from it.

## Source issues

- none
