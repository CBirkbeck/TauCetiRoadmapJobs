# ConstructiveFieldTheoryPhi4 design repairs

I checked the three findings of the review `REV-DESIGN-ConstructiveFieldTheoryPhi4~5` against the README, the plan, the cached sources, the sibling roadmaps and the pinned Mathlib and Tau Ceti. All three are correct.

- F02 and F03 are applied as asked.
- F01 is applied with a different route in two places, and the transfer is stated for every coupling rather than only ferromagnetic ones. The reasons are given below.

The edits are in `packages/ConstructiveFieldTheoryPhi4/design/README.md`, `packages/ConstructiveFieldTheoryPhi4/design/plan.json` and `packages/ConstructiveFieldTheoryPhi4/sources.toml`. The roadmap gains one supplier edge, to ZerosOfLFunctions §5.5, which is on main. No layer was added, removed or renumbered.

## REV-DESIGN-ConstructiveFieldTheoryPhi4~5/F01 (P2) — applied differently

- **2.1, new target.** The Lee–Yang theorem: `Z^I_{V,J}(h) ≠ 0` for J ≥ 0 and Re h_x > 0, proved by Asano contraction.
- **2.1, new API fact.** The Lee–Yang property of block laws: `E = Π(1 + h²/a_j²)` with `Σa_j⁻² = ½∫φ²`; zero weights by Hurwitz's argument.
- **2.2.** A new tail-control target; the transfer is restated for every block sequence and every coupling.

The review's mathematics is correct; every step was rechecked. Three things differ from what it asked:

- **Step (d), the small zeros.** The weak-compactness argument is replaced by the direct bound `s_k(θ) log 2 ≤ θ log E_k(θ^{−1/2})`, since `log(1+u)/u` decreases on (0, 1]. With `E_ρ(h) ≤ Ce^{|h|^{α′}}` this gives `limsup_k s_k(θ) ≤ (θ log C + θ^{1−α′/2})/log 2 → 0`. No subsequences are needed.
- **Every coupling.** The transfer is stated for every coupling, not only ferromagnetic J, because 1.4 holds for every coupling.
- **Sources.**
  - Lee–Yang 1952 (APS) has no legal copy; the service found none.
  - The Lieb–Sokal fetch failed (network trouble, Springer DOI paywalled).
  - The theorem is therefore certified by the open Lebowitz–Ruelle–Speer: lines 62–69 and Lemma 2.4, lines 217–222.
  - The cumulant sign is cited from Sokal item (i), lines 428–433; the block-law property from Aizenman–Duminil-Copin, lines 387–388.

## REV-DESIGN-ConstructiveFieldTheoryPhi4~5/F02 (P3) — applied

In the §2.2 Check, "transfer must allow a suitable choice of approximants" became:

- α-moments of the approximants are not controlled by the limit;
- quadratic exponential moments are, `≤ (1 − 2c/log²N)^{−1/2}` (about 1.022 at c = 1, N = 1000);
- on two sites `1 ≤ Z(η_N) ≤ (1 − J/log²N)⁻¹ → 1`.

Plan test `bad_approximation_of_zero` became `shrinking_blocks_transfer`.

## REV-DESIGN-ConstructiveFieldTheoryPhi4~5/F03 (P3) — applied

Layer 0 Dependencies: added `ProbabilityTheory.integrableExpSet` and `MeasureTheory.Integrable.mono'`, matching the 0.1 *Needs:* line. Layer 2 Dependencies were updated with the new *Needs:* lines of 2.1 and 2.2.

## Pattern sweep

- **Other places changed for F01.**
  - README: the Summary, the Scope ownership sentence and the Scope line on Lee–Yang theory ("beyond the theorem of 2.1").
  - README: a Hadamard bullet under "Material consumed"; four Mathlib contract entries and a ZerosOfLFunctions contract section.
  - README: the 1.4 sentence on the transfer, the build paragraph, Layer 2 Dependencies, the downstream "Ising-type statistical mechanics" line, and References.
  - Plan: 2.1 and 2.2 (api, tests, prerequisites, locators) and the top-level `suppliers`.
- **"Suitable choice" or simultaneity of approximants.** Searched for "suitable", "simultaneous", "one sequence", "choice" and "by continuity" in both files.
  - The README had them at 1.4 (line 196), in the 2.2 transfer bullet and in the 2.2 Checks.
  - The plan had them in `gibbs_limit` and `finite_volume_transfer`.
  - All are rewritten. The "one sequence must serve … simultaneously" clause is deleted, because it now follows from "every sequence".
- **Consumers of the transfer.** These still read correctly against the stronger statement: 3.5 (route and *Needs:*), 3.7 (Newman's bound for the class, through 3.5), 4.1–4.3 (class inequalities in the limit), and 8.2. The plan's 3.5 `proof_route` ("Full GS transfer uses the theorem in 2.2") is unchanged and correct.
- **Lee–Yang in the scope.** "Lee–Yang" occurred in the README at line 19 (Scope) and line 716 (downstream consumers). Both now say "beyond the theorem of 2.1".
- **Needs against Dependencies.** Re-compared mechanically for every layer after the edits, every backticked name of each *Needs:* line against the layer's Dependencies.
  - No layer now lacks a name.
  - The only extras are names used in Checks and labelled so: `TauCeti.Probability.centralMoment_id_two_mul_gaussianReal` in Layer 3 and `MeasureTheory.Measure.infinitePi` in Layer 4.

## Adversarial pass on the added and changed statements

Values were computed by hand and confirmed numerically in a scratch script.

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| Lee–Yang theorem (2.1) | V = ∅; one site; two sites with equal fields, J ≥ 0 and J = −(ln 2)/2; boundary Re h = 0 | V = ∅: Z = 1. One site: cosh h, zeros iπ(k+½). Two sites: ½(e^J cosh 2h + e^{−J}). For J ≥ 0, cosh 2h = −e^{−2J} ∈ [−1, 0) forces Re h = 0. For J = −(ln 2)/2, zeros at h = ±0.6585 + 1.5708i (\|Z\| = 7.5e−17). cosh(iπ/2) = 0 | True as stated; strict Re h > 0 and ferromagnetism both needed; two Checks added |
| Pair polynomial and contraction (route) | a ∈ (0, 1]; a = 1, z₁ = −a | `\|1 + az₁\|² − \|a + z₁\|² = (1 − a²)(1 − \|z₁\|²) ≥ 0`. If a + z₁ = 0 then P = 1 − a² ≠ 0 for a < 1, and a = 1 needs z₁ = −1, outside the disc. Lemma 2.4 with K = {\|z\| ≥ 1}: −K·K = {\|z\| ≥ 1}. The contraction keeps consistent A and gives `Π_{x∈A, y∉A} a_xy` | Route valid at \|V\| ≥ 2; \|V\| = 1 is P = 1 + z |
| Lee–Yang property, product, mass, κ₄ (2.1) | N = 0 or q = 0; ρ_I; N = 1, q = (s); uniform on {−1, 0, 1}; q = (1, −1), K = (ln 3)/2 | δ₀: E ≡ 1, empty product, 0 = 0. ρ_I: Σ((k+½)π)⁻² = 0.4999999, κ₄ = −2 = −12·(1/6) (numerically 2.0000). Product at h = 1.3: 1.970914 vs cosh 1.3 = 1.970914. N = 1, q = (s): Σ s²/((k+½)π)² = s²/2. Uniform: Σa⁻² = 0.3333333, −12Σa⁻⁴ = −0.6667 = κ₄ = 2/3 − 4/3. Mixed signs: ε = 0.25, E = (3 + cosh 2h)/4, zero at ±0.8814 + 1.5708i (\|E\| = 1.4e−16), κ₄ = +1 | True for q ≥ 0; mixed signs fail as a negative control; four Checks added |
| Zero weights (Hurwitz step) | q = (1, 0), K₁₂ = K ≥ 0 | E(h) = Z(h, 0)/Z(0, 0); the weights (1 + ε, ε) give zero-free transforms in Re h > 0; E(0) = 1, so zeros are isolated; max modulus on reciprocals (`Complex.norm_le_of_forall_mem_frontier_norm_le`, read at the pin, AbsMax.lean:404) | Valid; uses only pinned declarations |
| Hadamard input | \|E(h)\| ≤ e^{\|h\|Σq}; E(0) = 1 | `OrderLE E 1` in ZerosOfLFunctions' sense (for every A′ > 1, O(exp ‖s‖^{A′})). e^a = 1. Evenness and the reindexing ρ ↦ −ρ give e^{2bh} = 1, so b = 0. Pairing (1 − h/(ia))(1 + h/(ia)) = 1 + h²/a² | Hypotheses of `hadamard_of_orderLE_one` met (main and the #1913 head both keep §5.5 verbatim) |
| Tail control (2.2) | X_N → δ₀; CLT blocks → N(0,1) (growth fails); constant blocks; mixtures (not blocks) | X_N, N = 1000, c = 1: exact 1.0216390 ≤ bound 1.0216395. CLT blocks: ∫e^{φ²/2}dη_N = 2.57, 4.36, 7.63 at N = 10, 100, 1000 (→ ∞); s_N(θ) = ½ once N ≥ 4/(π²θ). Step (d) on cosh(0.3h), θ = 0.05: 0.0312 ≤ 0.0357. Paley–Zygmund: ∫φ²1[φ² ≥ σ²/2] ≥ σ²/2 gives 1/12. S = 0: all η_k = δ₀ ("at most S/(2θ)" kept true; "fewer than" was wrong at S = 0 and fixed). Mixtures: moments ≤ (2n−1)!!, Z = ∞ at J ≥ 1 | True as stated; the growth hypothesis and the block hypothesis are both shown necessary by Checks |
| Transfer (2.2), every sequence, every coupling | V = ∅; J = 0; ½(δ_{−s_k} + δ_{s_k}), s_k → s, including s = 0; X_N two sites | V = ∅: Z = 1. J = 0: products. s_k² tanh(Js_k²) → s² tanh(Js²), and at s = 0 → 0. Z(η_1000) at J = 1: 1.00022 ≤ 1.02141 | True; follows from the tail control and 1.4, which holds for every coupling |
| X_N Check (F02) | N = 1000 | `N Σ((k+½)π√N log N)⁻² = 1/(2 log²N) = ½σ_N²`. α-moment ≥ 2^{1−N}exp(N^{α/2}/log^αN) | Values recomputed and recorded |
| 1.4 sentence | — | It now refers to the tail control of 2.2 | Consistent |

## Checks run

Dependency check:

```text
candidate: ConstructiveFieldTheoryPhi4 is not in the merge order yet; checked as if placed after RelativisticQuantumFieldTheory (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2231 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line. The new supplier, ZerosOfLFunctions, is on main.

`roadmaps resolve` on the README: no cross-roadmap citation and no Lean name is found nowhere. The tool did not check Lean names outside the roadmaps, so I opened every Mathlib name added this round at the pin:

| Declaration | Location |
|---|---|
| `Complex.norm_le_of_forall_mem_frontier_norm_le` | Mathlib/Analysis/Complex/AbsMax.lean:404, namespace Complex |
| `MeasureTheory.isTightMeasureSet_of_isCompact_closure` | Mathlib/MeasureTheory/Measure/Prokhorov.lean:636, namespace MeasureTheory |
| `Real.young_inequality` | Mathlib/Analysis/MeanInequalities.lean:547, namespace Real |
| `ProbabilityTheory.mgf_id_gaussianReal` | Mathlib/Probability/Distributions/Gaussian/Real.lean:503 |

`hadamard_of_orderLE_one` and `OrderLE` are declared in `TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` on main.

There are no gate failures listed for this round. The design has no `Suggested.lean`, so no Lean statement changed, no elaboration was run and there was no `#check` scratch file to compare.

## Sources, ownership and overlaps

- **Added to `sources.toml`:** `lebowitz-ruelle-speer-2012`, fetched by the sources service from arXiv (open-repository, certified, v2). The locator is Section 1, lines 62–69, and Lemma 2.4, lines 217–222. `sokal-1982` gains `cited_for` 2.1.
- **`needs-references.toml`.** The service wrote a `[[missing]]` entry for `lee-yang-1952` when it found no legal copy. I do not cite that paper, because Lebowitz–Ruelle–Speer certifies the statement and the route, so I removed the file, which I had created this run. No text is requested.
- **Ownership.**
  - The Lee–Yang theorem and the Lee–Yang property of block laws match nothing on main or in any open roadmap pull request: `roadmaps grep` for "Lee.Yang", "Laguerre.Pólya", "circle theorem" and "Asano". This roadmap is their owner.
  - Hurwitz's theorem on zeros of locally uniform limits is owned by no roadmap and is not at the pins. The Tau Ceti docstring of `TauCeti/Analysis/Analytic/ZeroCount.lean` mentions a `TauCeti.hurwitz`, but no such declaration exists at the pin. It is therefore used only as an argument from the pinned maximum modulus principle, not stated as a target.
  - Hadamard factorisation is imported from ZerosOfLFunctions §5.5, not planned again.
- **Overlaps.** ZerosOfLFunctions has an open revision, `#1913`. At its head §5.5 and `hadamard_of_orderLE_one` are unchanged, so the citation survives that merge. Ownership against the other open pull requests was checked with `roadmaps grep` over all 474 heads.

## For the maintainer

- **New supplier edge.** ZerosOfLFunctions §5.5 is now a supplier (README contracts, Layer 2 Dependencies, plan `suppliers`). ZerosOfLFunctions is on main, so the edge is downward.
- **Stronger transfer.** The transfer theorem of 2.2 now quantifies over every approximating Ising-block sequence and every coupling. ConstructiveFieldTheoryPhi4PartII, the only named consumer, exists nowhere yet. It may rely on the stronger form.
- **Scope.** The roadmap now owns the Lee–Yang theorem for ferromagnetic Ising pair interactions with complex fields of positive real part. Any future "Ising-type statistical mechanics" roadmap should cite 2.1 for it.
- **No names removed.** No name that other roadmaps cite was removed or renamed. The design has no Lean names.
