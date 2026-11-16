# Review of CharacterSumsOverFiniteFields (pull request #1712 at cbf32cf)

**Verdict:** accepted

Incremental re-review of 44 changed lines since `52b794d`, all in `## Provenance` of `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md` (lines 2287–2340). No finding.

## Previous findings

- The previous review, of `52b794d`, raised no finding; there is none to account for.

## Verified sound

**The changed passage against the repositories it cites** (each file opened at the cited commit).

| Sentence of `## Provenance` | What the cited file shows | Result |
|---|---|---|
| Weil "requires the Apache-2.0 `AxiomMath/Stacks` at commit `012108f`" | `lake-manifest.json` of Weil at `27cdb20`: Stacks rev `012108f61d…`, Mathlib rev `16edf57de…`; Stacks `LICENSE` Apache 2.0 | agrees |
| `WeilBound.lean` (Stacks): same bound, smooth proper geometrically irreducible curve, every finite extension, Bombieri–Stepanov eigenvalue bound as input | `abs_natCard_fieldValuedPoints_sub_le`: `[IsProper f] [Smooth f] [GeometricallyIrreducible f] [IsCurve k f]`, any finite `K/k`; `|#X(K) − #K − 1| ≤ 2·genus·√#K`; docstring names that input | agrees |
| `HasseDerivPowChar.lean`: orders `0 < i < p^e` kill `p^e`-th powers; `(X − a)^m ∣ f` when derivatives of order `< m` vanish at `a` | `hasseDeriv_pow_char_pow` (`0 < i`, `i < p^e`, `CharP R p`); `X_sub_C_pow_dvd_of_hasseDeriv_eval_eq_zero` (any commutative ring) | agrees |
| `SmoothUpperBound.lean`: `N_m ≤ q^m + C√q^m`, smooth proper geometrically integral, `m ≥ m₀`, `d ∣ m`, `d ≠ 0`, constants depending on the curve | `exists_upper_bound_of_smooth`: `∃ C m₀ d, d ≠ 0 ∧ ∀ m ≥ m₀, d ∣ m → …`, stated after the curve | agrees |
| `LowerBoundCurve.lean`: `q^m ≤ N_m + C√q^m`, same quantifiers | `exists_lower_bound_of_isCurve`: proper curve with discrete valuation rings at coheight-1 points (wider than smooth); same `∃ C m₀ d` | agrees |
| `RiemannHypothesisBound.lean`: `‖∑ α_i^m‖ ≤ C B^m` on `m ≥ m₀`, `d ∣ m`, `B > 0`, forces `‖α_i‖ ≤ B`; sector argument | `norm_le_of_norm_sum_pow_le`, those hypotheses; docstring: sector lemma | agrees |
| `EulerProduct.lean` (weil-conjectures): "smooth geometrically connected affine curve", `H_c¹`, `H_c²` | `[IsAffine U]`, `[SmoothOfRelativeDimension 1 …]`, `[GeometricallyConnected …]`; `L · det(1 − Ft | H_c²) = det(1 − Ft | H_c¹)` | agrees |
| `LAdicTraceFormulaFinal.lean` (Weil): "given with a compactification" | `j : CompactificationOf (Over.mk f)` is data; separated, finite type over finite `k`; conclusion `L · Q = P`, `Q(0) = 1` | agrees |
| `HasseWeil.lean`: smooth proper geometrically integral | `[SmoothOfRelativeDimension 1 f] [IsProper f] [GeometricallyIntegral f]` | agrees |

**The adversarial table** (the statements the changed text cites; the diff changes no statement).

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 4.4 power-sum lemma, against the Stacks form at `d = 1` | roots `2, −2`, `ρ = 1`; the same on `d = 2`; roots `1, 1`, `ρ = 1` | odd sums `0`, even sums `2·2^n > C·1^n` eventually, so the hypothesis fails for all `n ≥ n₀` and on `2 ∣ n`; sums `2 ≤ 2·1^n`, norms `1 ≤ 1` | sound; the two forms agree at `d = 1` |
| 4.1 `hasseDeriv k (f^q) = 0`, `0 < k < q`, against the Stacks statement | `f = X`, `q = 4`, `k = 2`, characteristic `2`; `q = 2`, `k = 1`; `k = q = 2` | `C(4,2) X² = 6X² = 0`; `2X = 0`; `C(2,2) = 1 ≠ 0`, so the strict `k < q` is needed | sound |
| 4.9 affine count from the curve bound (Provenance, bullet 4.9) | `m` odd: `g = (m−1)/2`, one point at infinity; `m` even: `g = (m−2)/2`, `1 + η(a) ∈ {0, 2}` points | `|N_aff − q| ≤ 2g√q = (m−1)√q`; `N_aff − q = (N − q − 1) − η(a)`, so `≤ (m−2)√q + 1 ≤ (m−1)√q` as `√q ≥ 1` | sound |
| "constants chosen before the equation" (4.2–4.3) against "depending on the curve" (Stacks) | 4.2 as stated: `C, Q₀` from `(d, m)` only; Stacks: `∃ C m₀ d` after `X` | quantifier orders differ as the passage says; Stacks counts `X(K)` of a proper curve, 4.2 counts `E²`-solutions | the stated distinction holds |

The rows for the other statements stand as in the previous review, of `52b794d`.

- Gate, run on this head with `--base origin/main`: every scanner 0, `OK`.
- Dependency check: `depcheck: 233 roadmaps, 2228 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 35 `declaration uses sorry` warnings and nothing else; the file is unchanged since `52b794d`.
- Outside the folder: `git diff --stat origin/main...HEAD` is empty.
- Repository files opened at the cited commits: 9 (5 of Stacks at `012108f`, 2 of Weil at `27cdb20` including its manifest, 2 of weil-conjectures at `55abf46`); 9 sentences checked, 9 agree.
- The pull request's text: title, "8 layers and 49 milestones", the three files and the four suppliers still agree with the head; the change adds no section, target, declaration or supplier (the three repositories are stated not to be suppliers), so the description leaves nothing unstated.
- Seeded sample: all fifteen targets lie outside the changed lines; none re-read. Overlaps: no pull request changes this roadmap, no dropped id; no cross-roadmap citation is added or changed.
- Overlap check: read HypergeometricMotives, KloostermanMomentsAndPotentialAutomorphy, KloostermanSheavesAndBesselIsocrystals, FourierDeligneTransform, HalfIntegralWeightModularForms, QuadraticCharactersAndReduction, ClassicalArithmeticCompletion, SieveMethodsAndPrimePatterns; nothing shared (the change touches no owned object; ownership stands as in the previous review).

Source independence: changed passages only; 9 passages compared with 3 repositories (their statements and module docstrings as read at the cited commits), none shared beyond formulas and declaration hypotheses; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- The repository files were read through a page reader that reports statements and summarises docstrings; hypotheses and conclusions were checked, a word-for-word comparison with the docstrings was not possible.
- "Layers 0–2, 4.5 and 5–7 … have no counterpart in the modules above": checked for the modules the section names, not for the whole of the three repositories.
- The items of the earlier reviews (Ireland–Rosen, Lidl–Niederreiter, Iwaniec–Kowalski, Gross–Koblitz, Weil 1948, `schmidt1976` uncertified) are unchanged.

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md` `## Provenance` (lines 2287–2340) now maps targets to three Apache-2.0 Lean repositories (`AxiomMath/Weil`, `AxiomMath/Stacks`, `formal-arithmetic-geometry/weil-conjectures`) and says none is a supplier; the Stacks files opened carry no per-file licence header.
- **Licence.** No declaration of `Suggested.lean` was compared by name and binders with the three repositories; the Lean file is unchanged since the head the previous review read.
- **Not tested.** Several cited books (Ireland–Rosen, Lidl–Niederreiter, Iwaniec–Kowalski) and `schmidt1976` were not read by any review round; wording and arrangement were not compared with them.
