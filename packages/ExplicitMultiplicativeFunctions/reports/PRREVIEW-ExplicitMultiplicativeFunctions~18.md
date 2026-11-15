# Review of ExplicitMultiplicativeFunctions (pull request #1946 at 1739d7f)

**Verdict:** accepted

Incremental re-review of 0 changed lines since `1739d7f`: the folder is unchanged; this round read the pull request's title and description, as they stand now, against the head. No finding.

## Previous findings

- R01 — repaired: the description now reads "At the pins, Tau Ceti has Mertens' first and second theorems (over any number field) with `O`-remainders and the divisor bound `σ_k(n) ≤ n^s ζ(s)` for `k ≤ s` and `s > 1`; neither Mathlib nor Tau Ceti has a bound of any shape for a summatory function of `μ` …".

## Verified sound

### The pull request's text against the head

| Sentence of the description | What the head and the pins show | Result |
|---|---|---|
| Title "ExplicitMultiplicativeFunctions: roadmap" | folder not on main; 5060 insertions, 0 deletions; `README.md`, `Suggested.lean`, `metadata.toml` | agrees |
| Summary block (Möbius and Liouville sums, transfers, averages, products, pointwise bounds, `n ≥ 89 693²`, consumers, reuse) | README Layers 1–9 headings, 1.6a, 9.3a, "Downstream consumers"; unchanged since the previous review's table | agrees |
| "Tau Ceti has Mertens' first and second theorems (over any number field) with `O`-remainders" | `TauCeti/NumberTheory/LFunctions/Mertens.lean:375` (`=O[atTop] 1`), `:552` (`=O[atTop] (log x)⁻¹`), both for a number field `K` | agrees |
| "the divisor bound `σ_k(n) ≤ n^s ζ(s)` for `k ≤ s` and `s > 1`" | `TauCeti/NumberTheory/ArithmeticFunction/DivisorBounds.lean:52`, hypotheses `(k : ℝ) ≤ s`, `1 < s`, right side `n^s · ∑' d, (d^s)⁻¹` | agrees |
| "neither Mathlib nor Tau Ceti has a bound of any shape for a summatory function of `μ`" | no sum of `μ` over an interval in either library's `NumberTheory`; `TauCeti/NumberTheory/ArithmeticDirichletSeries/Moebius.lean` has pointwise and convolution statements only | agrees |
| "… a remainder for an average of the divisor function" | `Mathlib/NumberTheory/ArithmeticFunction/Misc.lean:440` is the identity `Σ σ₀(n) = Σ ⌊N/n⌋`, with the hyperbola method left as a TODO at line 437 | agrees |
| "… or an asymptotic for Mertens' product" | `TauCeti/NumberTheory/SumPrimeReciprocals.lean:58` gives divergence only; the docstring of `Mertens.lean` names the product as not yet reached | agrees |
| "planned in AnalyticNumberTheoryPartI: … (§1.2), … (§3.22), … (§0.26)" | main, `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md` lines 951, 2601, 691; §1.2 is the uniform bound in `α`, and `α = 0` gives `M(y)` (README line 400) | agrees |
| First prose paragraph: averages of `μ²`, `τ_k`, `φ`, Piltz remainders, finite Euler products, pointwise bounds for `ω`, `τ_k`, `σ`, `n/φ(n)` | README 7.1–7.2, 7.5, 7.7, 7.9, 8.1–8.3, 9.1, 9.2, 9.3, 9.4 | agrees |
| "named propositions are hypotheses, not computations performed here" | README Layer 0.7; `MoebiusTableVerified`, `RamareTransferComputations` in `Suggested.lean` | agrees |

No section, headline or declaration is removed and no supplier is dropped by this pull request; the generated `depends-on` and `merge-order` blocks are outside this check.

### Adversarial table

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| `TauCeti.sigma_le_rpow_mul_tsum`, as the description states it | `k = 1`, `s = 2`, `n = 6`; `n = 0` | `σ₁(6) = 12 ≤ 36·ζ(2) = 59.218`; `n = 0`: `0 ≤ 0` | sound | — |
| AnalyticNumberTheoryPartI §3.22, cited by the description, against Layer 7.4's remainder | `x = 100`, `x = 10⁴` | `Σ τ = 482`, main term `475.960`, difference `6.040 ≤ 10`; `93 668` against `93 647.717`, difference `20.283 ≤ 100` | sound | — |
| AnalyticNumberTheoryPartI §0.26, cited by the description, against Layer 8.1 | `x = 100`, `x = 10⁴` | product `8.31136` against `e^γ log x = 8.20214`, difference `0.109`; `16.42449` against `16.40428`, difference `0.020` | sound, `O(1)` and decaying | — |
| AnalyticNumberTheoryPartI §1.2 at `α = 0` (`M(y)`), cited by the description | `y = 100`, `y = 10⁴` | `M(100) = 1`, `M(10⁴) = −23`; `y/log² y = 4.715`, `117.88` | consistent with `A = 2`, `C_A = 1` | — |
| 9.3a instance `n ≥ 89 693²` (summary block) | `X₀ = 89 693` | `X₀² = 8 044 834 249`; `log X₀ = 11.40415` | sound | — |

The rows for the untouched statements stand as in the previous review, of `1739d7f`.

- Gate, run on this head: every counter 0 (`set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`), exit 0; the worker's `gate.md` adds `build=0`.
- Dependency check: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `Suggested.lean`: 16 warnings `declaration uses sorry` (lines 166, 198, 205, 210, 220, 235, 256, 274, 291, 314, 332, 358, 369, 385, 400, 411), nothing else; no statement changed, so the signatures stand as compared before.
- Library declarations opened at the pins: 5 (`DivisorBounds.lean:52`; `Mertens.lean:375, 552`; `SumPrimeReciprocals.lean:58`; Mathlib `ArithmeticFunction/Misc.lean:440`).
- Cross-roadmap citations resolved: 3 (AnalyticNumberTheoryPartI §§0.26, 1.2, 3.22, on main). No `Suggested.lean` definition name of this roadmap (7 searched) is declared in another roadmap, open or on main.
- Outside the folder: `git diff --stat origin/main...HEAD` is empty apart from the folder.
- Overlap check: read ExplicitPrimeCounting, ExplicitNumberFields, ExplicitZetaBounds, ExplicitCharacterSumsAndSieves (their passages naming this roadmap, at their open heads), AnalyticNumberTheoryPartI (main); nothing shared: each cites this roadmap as consumer or supplier of sections that exist (§§7.4, 7.5, 7.9), in the merge order's direction.
- Source independence: changed passages only; the folder's diff is empty, so 0 passages compared with 0 sources; largest share `ramare2015mc`, 33 of 344 backticked source citations, as counted in the previous review; arrangement not compared again (no layer added, removed or reordered).

Remark: the `citations.md` lead `HasPrimeInInterval.logPower` (README line 4520) is an IEANTN declaration cited as a locator, not a claim about the pins.

## Not verifiable

- Source locators of the seeded sample: none re-checked; the diff changes no passage, so the sample falls in none.
- `leong2026` (1.9, untouched): image-only on this worker, as in the previous reviews.
- The uncertified sources are cited by locator alone; none is in a changed passage.

## Source issues

Found by an earlier review of this head; no source was re-read in this round.

- **Error** in tao2025mo at answer 501229, the verification for `n ≥ 89693²`, line 294: the source says the reduced right side is at least `1 + 3.37ε − 0.01ε²`; it should be about `1 + 3.3668ε − 0.01ε²`, its own linear coefficient being `3.36687`; affects nothing.
- **Gap** in tao2025mo at answer 501229, lines 281–290: the source says bounding `1/log³√n` by `0.000675` absorbs the factor from `n + √n`; it should keep the factor `1/(1 + 1/89693)`, which gives `3.36683`; affects the proof.

## For the human reviewers

- **Licence.** `not_isHighlyAbundant_lcmUpto_of_primeGap` (`TauCetiRoadmap/ExplicitMultiplicativeFunctions/Suggested.lean`) states what `lcmUpto_not_highlyAbundant_of_primeGap` states in the public IEANTN repository (`IEANTN/Nodes/Lcm/v2/Conclusions.lean`, `ieantn`); names and binders differ; the README cites it (lines 4251, 4518).
- **Scope.** 9.3a's sources are a MathOverflow answer (`tao2025mo`) and two Lean repositories (`ieantn`, `primeNumberTheoremAnd`); no refereed source states its threshold theorem. The other layers cite refereed articles, with preprints beside them.
