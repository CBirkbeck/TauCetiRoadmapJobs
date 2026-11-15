# Review of ExplicitMultiplicativeFunctions (pull request #1946 at 1739d7f)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since `1739d7f`: the folder is unchanged, and this round read the pull request's title and description against the head. One P3 finding, in the description; nothing in the folder needs to change.

## R01 (P3) — the description's claim about the library is contradicted by the README

**Location:** pull request description, author's prose, "Why Tau Ceti wants it": "the library has the asymptotic forms but none with constants."

**Claim:** Both halves are false at the pins as the README itself records them: the library has no asymptotic form for the Möbius sums, and it does have one of the explicit bounds with a constant.

**Witness:** `TauCetiRoadmap/ExplicitMultiplicativeFunctions/README.md` lines 364–366 and 4122: `TauCeti.sigma_le_rpow_mul_tsum` (`σ_k(n) ≤ n^s Σ_d d^{−s}`, `TauCeti/NumberTheory/ArithmeticFunction/DivisorBounds.lean:52`) is 9.2's bound at `k = 2`; line 384: "no summatory bound for `μ`".

**Repair:** Replace the clause by: "the pinned libraries have Mertens' constant with a qualitative remainder and the divisor bound `σ_k(n) ≤ n^s ζ(s)`, but no summatory bound for `μ` and no explicit constant in any average or Euler product; the qualitative forms are those of AnalyticNumberTheoryPartI."

## Previous findings

- none: the previous report, of `1739d7f`, had no finding.

## Verified sound

### The pull request's text against the head

| Sentence of the description | What the head shows | Result |
|---|---|---|
| Title "ExplicitMultiplicativeFunctions: roadmap" | the folder is not on main; 5060 insertions, 0 deletions, 90 headings and 30 declarations added | agrees |
| Summary block: Möbius and Liouville sums, coprime restrictions, character twists | README Layers 1–4, 1.6, 1.6a, 2.4, 4.1 | agrees |
| Summary block: Ramaré's transfer, Balazard, comparison theorem, Levin–Fainleib, Hall–Tenenbaum | README 1.5, 2.2, 5.1, 5.5, 6.3 | agrees |
| Summary block: squarefree and divisor averages, Piltz remainders, Mertens products, Robin, Nicolas–Robin, Rosser–Schoenfeld | README Layers 7, 8.1–8.1a, 9.1, 9.2, 9.4 | agrees |
| Summary block: `lcm(1, …, n)` not highly abundant for `n ≥ 89 693²`, from Dusart's intervals | README 9.3a and lines 43–46; `log 89 693 = 11.4041 ≥ 5`, `89 693² = 8 044 834 249` | agrees |
| Summary block: consumers ExplicitNumberFields, later parts of ExplicitCharacterSumsAndSieves; progressions, large sieve, Selberg main terms | README "Downstream consumers", lines 4415–4430 | agrees |
| Summary block: reuses Mathlib's convolution, Euler products, characters; Tau Ceti's Abel summation and Mertens constant | README lines 287–323 (`EulerProduct.eulerProduct_hasProd`, `DirichletCharacter`), 353–361 | agrees |
| Prose: inputs "explicit parameters or named propositions", "hypotheses, not computations performed here" | README lines 15–17 and Layer 0.7; `MoebiusTableVerified`, `RamareTransferComputations` in `Suggested.lean` | agrees |
| Prose: "the library has the asymptotic forms but none with constants" | README lines 364–366, 384, 4122 | R01 |

The prose paragraph does not name the Liouville function, Layer 6 or 9.3a; the summary block above it does, so nothing a reader must know is left out. No section, headline or declaration is removed by this pull request and no supplier is dropped; the generated `depends-on` and `merge-order` blocks are outside this check.

### Adversarial table

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| 1.5 instance `\|M(D)\| ≤ (0.0130/log D − 0.118/log² D) D`, `D ≥ 1 078 853` (cited by the description) | sieve of `μ` to `1.1·10⁶`; `D = 1 078 852`, `1 078 853`; all integers in `[1 078 853, 1.1·10⁶]` | `M(1 078 852) = 350 > 349.9150` (excluded); `M(1 078 853) = 349 ≤ 349.9153`; largest ratio on the range `0.99738`, at the threshold | sound, threshold sharp | — |
| 9.2 `τ_k(n) ≤ n^s ζ(s)^{k−1}` and `TauCeti.sigma_le_rpow_mul_tsum` at `k = 0` (touched by R01) | `n = 12`, `s = 2`, `k = 2, 3` | `τ(12) = 6 ≤ 144 ζ(2) = 236.87`; `τ₃(12) = 18 ≤ 144 ζ(2)² = 389.64`; the pinned theorem needs `k ≤ s`, `1 < s`: `0 ≤ 2`, `1 < 2` | sound | — |
| 9.3a instance `n ≥ 89 693²` (cited by the description) | `X₀ = 89 693` | `log X₀ = 11.40415 ≥ 5`; `X₀² = 8 044 834 249` | sound | — |

The rows for the untouched statements stand as in the previous review, of `1739d7f`.

- Gate, run on this head: `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0; the worker's `gate.md` adds `build=0`.
- Dependency check: `depcheck: 246 roadmaps, 2235 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Merge order: ExplicitZetaBounds, ExplicitPrimeCounting, ExplicitCharacterSumsAndSieves precede this roadmap; ExplicitNumberFields follows it.
- Elaboration of `Suggested.lean`: 16 warnings `declaration uses sorry` (lines 166, 198, 205, 210, 220, 235, 256, 274, 291, 314, 332, 358, 369, 385, 400, 411), nothing else. No statement changed, so the signatures stand as compared in the previous review.
- Outside the folder: `git diff --stat origin/main...HEAD` is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- Library declarations opened at the pin: 3 (`TauCeti/NumberTheory/ArithmeticFunction/DivisorBounds.lean:52`; `TauCeti/NumberTheory/LFunctions/Mertens.lean:545, 552`); `TauCeti/NumberTheory/ArithmeticDirichletSeries/Moebius.lean` has no summatory statement for `μ`, as README line 384 says.
- Source locators: none re-checked; the diff changes no passage and the seeded sample falls in none.
- Overlaps: `overlaps.md` lists no other pull request changing this roadmap, no dropped id and no id only a revision defines. Overlap check: read ExplicitPrimeCounting, ExplicitNumberFields, ExplicitZetaBounds, ExplicitCharacterSumsAndSieves, AnalyticNumberTheoryPartI, ZerosOfLFunctions (scope sections, as resolved in the previous review; the folder is unchanged); nothing shared.
- Source independence: changed passages only; the folder's diff is empty, so 0 passages compared with 0 sources; largest share `ramare2015mc`, 33 of 344 backticked source citations; arrangement not compared again (no layer added, removed or reordered).
- Remark: the `citations.md` lead `HasPrimeInInterval.logPower` (README line 4520) names an IEANTN declaration cited as a locator, as the previous review resolved.

## Not verifiable

- `leong2026` (1.9, untouched): image-only on this worker, as in the previous review.
- The uncertified sources are cited by locator alone, as in the previous review; none is in a changed passage.

## Source issues

Found by the previous review of this head; no source was re-read in this round.

- **Error** in tao2025mo at answer 501229, the verification for `n ≥ 89693²`, line 294: the source says the reduced right side is at least `1 + 3.37ε − 0.01ε²`; it should be about `1 + 3.3668ε − 0.01ε²`, its own linear coefficient being `3.36687`; affects nothing.
- **Gap** in tao2025mo at answer 501229, lines 281–290: the source says bounding `1/log³√n` by `0.000675` absorbs the factor from `n + √n`; it should keep the factor `1/(1 + 1/89693)`, which gives `3.36683`; affects the proof.

## For the human reviewers

- **Licence.** `not_isHighlyAbundant_lcmUpto_of_primeGap` (`TauCetiRoadmap/ExplicitMultiplicativeFunctions/Suggested.lean`) states what `lcmUpto_not_highlyAbundant_of_primeGap` states in the public IEANTN repository (`IEANTN/Nodes/Lcm/v2/Conclusions.lean`, `ieantn`); names and binders differ; the README cites it (lines 4251, 4518).
- **Scope.** 9.3a's sources are a MathOverflow answer (`tao2025mo`) and two Lean repositories (`ieantn`, `primeNumberTheoremAnd`); no refereed source states its threshold theorem. The other layers cite refereed articles, with preprints beside them.
