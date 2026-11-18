# Review of FractalGeometry (pull request #2511 at 796bb9a)

**Verdict:** accepted

**Summary.** Accepted: this is an incremental re-review of the 17 lines changed since `35491a7`, and both points of the previous review are repaired without a new problem. The potential bound in the converse bullet of 3.3 is now stated for the measure of 3.2 before normalising, with the range of the sum and the factor `1/μ K` for the normalised energy, and it holds in the instance that refuted the earlier sentence; the cover bound that the Frostman route uses is now a bullet of 3.2 with its locator, which the source supports. There are no findings, no small corrections and no format notes; one fact about the main source is left for the human reviewers.

## Previous findings

- R01 — repaired: "For the measure `μ` of 3.2 itself, before normalising, and `x ∈ K` … `φ(x) ≤ Σ_{k ≥ k₀} 2^(t(k+1)) · 2^(−sk)` … the `t`-energy of the normalised measure is at most this sum divided by `μ K`."
- C01 (small correction) — repaired: "*Covers of any size.* If `A` is a subset of a metric space, `s ≥ 0` and `μH[s] A ≠ 0`, then the infimum of `Σ (diam U_i)^s` over all countable covers of `A` … is positive (Bishop and Peres, Proposition 1.2.6)."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 3.3 converse bullet, sketch (changed) | `K = [0, 1/10]`, `s = 1`, `t = 1/2`, `μ = λ/2`; `K = [0, 1]`, same `s`, `t` | `k₀ = 3`: `φ(0) = 0.316 ≤ 1.707`; normalised energy `8.43 ≤ 1.707 · 20 = 34.1`. `k₀ = 0`: `φ(1/2) = 1.414 ≤ 4.83`; energy `8/3 ≤ 9.66` | bound true; agrees with the energy Check `8/3` of 3.3 | none |
| 3.3 converse bullet, range and degenerate cases | `y ∈ K`, `y ≠ x`; `t = 0`; `diam K = 0`; closed form | `2^(−k−1) < dist ≤ diam K` forces `k ≥ k₀`; `φ(x) = μ K ≤ Σ 2^(−sk)`; one point has `μH[s] = 0` for `s > 0`, excluded; sum `2^t · 2^(−(s−t)k₀)/(1 − 2^(−(s−t)))` | every shell counted, series finite iff `t < s` | none |
| 3.3 `k₀` against the `k₀` of 3.2 | least `k` with `2^(−k−1) < diam K` | `k₀ − 1` fails, so `2^(−k₀) ≥ diam K`: the level condition of 3.2 | one meaning for `k₀` in both sections | none |
| 3.2 bullet, covers of any size (new) | `[0, 1]`, `s = 1`; `{x}`, `s = 0`; countable `A`, `s = 1/2`; a set of diameter `∞` in a cover | infimum `1`, `μH = 1`; sum `≥ 1` since `diam^0 = 1`; infimum `0` and `μH = 0`; term `∞` for `s > 0`, `1` for `s = 0` | sound in both cases `s > 0`, `s = 0` | none |
| 3.2 bullet as used by the route | sup-norm cubes covering `K = [0, 1]`, `k₀ = 0` | cube diameter equals its side, so `Σ (side Q)^s = Σ (diam Q)^s ≥` infimum `= 1 > 0` | the bullet is the form the route needs | none |
| 3.2 `exists_frostman_measure` (cited by both changed passages) | `r = 0`, `s > 0`; `s = 0` | `μ {x} ≤ 0^s = 0`, the no-atom step of 3.3; `t < s` forces `s > 0` in 3.3 | Lean statement unchanged; ball bound for all `x`, all real `r`, as 3.3 uses | none |

The rows for the untouched statements stand as in the previous review, of `35491a7`.

- Source locators checked against the text: 2 of 2 in the changed passages. Bishop and Peres, Proposition 1.2.6 (BishopPeres2015draft line 329, printed page 6: vanishing of Hausdorff measure and of the unrestricted content are equivalent in every metric space; its proof is the `δ^(1/α)` argument) and Theorem 3.4.2(i) (BishopPeres2015draft lines 4112 to 4113, printed page 94; the shell estimate of its proof is at lines 4122 to 4148). No sampled section other than 3.2 and 3.3 is touched by the change.
- Library declarations opened at the pin: the Hausdorff content of Tau Ceti (`TauCeti/MeasureTheory/Measure/Hausdorff.lean`, lines 89 to 95) is the content at a fixed scale with no statement on unrestricted covers; the pinned Mathlib has no Hausdorff content. The new bullet restates nothing at the pins.
- Cross-roadmap citations: none added or changed. No open roadmap pull request or roadmap on main states the cover bound or a Frostman lemma (searched by object).
- Dependency check: `depcheck: 200 roadmaps, 2183 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. Elaboration of `Suggested.lean` (unchanged since `35491a7`): 26 `sorry` warnings and nothing else.
- Pull request text read against the head: no sentence contradicted; the change adds no section, declaration or supplier, and nothing outside the folder changed.

Overlap check: read HyperbolicDynamicsAndThermodynamicFormalism, ProbabilisticAndMetricNumberTheoryPartII, ProbabilisticAndMetricNumberTheory, CompactQuantumMetricSpaces; nothing shared.

Source independence: changed passages only; 2 passages compared with 1 source (Bishop and Peres), none shared (the shell bound is written with strict shells, an explicit `k₀` and no constant, the cover bullet in two sentences of its own); largest share Bishop and Peres, 35 of 52 locators; no layer added, removed or reordered, so the contents were not compared again.

Research link: Layer 1 and Layer 4 state the theorems of Hutchinson (1981) and Moran (1946) on self-similar sets; Layer 3 is Frostman's (1935) lemma and capacity criterion; 5.5 is Marstrand's product theorem; the scope names Schief's converse (1994). Rests on the README's references and on Bishop and Peres, Theorems 2.2.2, 3.2.1, 3.4.2 and Section 2.9.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- **Licence.** Two thirds of the locators (35 of 52) go to the 1 December 2015 draft of Bishop and Peres on the first author's course page; the book was since published, and the README (References) claims only the draft's numbering.
