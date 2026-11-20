# Review of ComparisonOfMarkovChains (pull request #2802 at 11a25c6)

**Verdict:** accepted

**Summary.** Accepted: no finding. All six theorems of `Suggested.lean` were tested on their degenerate cases (negative constants, point masses, one state, the trivial group, `n ≤ 1`, non-Markov kernels) and hold as stated, and every number in every Check was recomputed and agrees. There is one small correction and one format note, neither blocking. One licence question is left to the human reviewers; the three suppliers are roadmaps that are still open pull requests and must merge first, as the description says.

## C01 — The "direct paths" Check of 1.2 needs `β ≥ 0`

In the second Check of 1.2 (README line 134), "if `Q'(x, y) ≤ β Q(x, y)` for all `x ≠ y`, routing each such edge along itself gives `B = β`" fails for `β < 0` when `κ` has a loop edge: then no edge of `κ'` joins distinct states, every load is `0`, and the hypothesis of 1.2 at a loop `(z, z)` with `Q(z, z) > 0` reads `0 ≤ β Q(z, z) < 0`. The conclusion `E' ≤ β E` still holds there (both forms vanish), so no result is touched, but the next Check is precisely about negative `B`, so a reader will test this one against it. Writing "for `β ≥ 0`" makes the sentence true.

## N01 — `List.IsChain` is defined in Batteries

The supplier contracts place `List.IsChain` in `Mathlib/Data/List/Chain.lean`; that file holds its lemmas, and the inductive definition is in `Batteries/Data/List/Basic.lean` (line 593 at the pin). Naming both would let a reader find the definition.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 paths, flows, `edgeLoad` | `[a,b,a,b]`; `[x]`; step with `π(u)=0`; empty list | count `(a,b)`=2, length 3, term `6ν` (single count `3ν`); `[x]`: length 0, load 0; `[]`: `length−1 = 0` in ℕ | holds | none |
| 1.2 `dirichletForm_le_of_edgeLoad_le` | two-state pair; lazy chain; `B<0`; infinite `π` | `Q=3/40`, `Q'=1/4`, `B=10/3`, `E'=(1/4)d²=B·(3/40)d²`; `B<0` forces no edge of `κ`, `E=E'=0` | holds, equality in example | none (C01 on a Check) |
| 1.3 gap consequence | two-state pair; point-mass `π` control | `γ=2/5`, `γ'=1`, `c=3/2`: `1 ≤ 2`; control: `B=1/4`, `E=½d²`, `E'=⅛d²`, `γ'=1/2`, `γ=0` | holds; control fails as claimed | none |
| 1.4 `inv_le_spectralGap_of_edgeLoad_le` | lazy `n`-cycle, `n=3..8`; point mass; identity kernel | `B=4Σd²/n`: `4/3, 3, 4, 19/3, 8, 11`; `γ₃=3/4=1/B`; `n=6`: `3/19 ≤ 1/4`; `E'=Var_π` for `Kernel.const` | holds; `B>0` forced by a nonconstant `f` | none |
| 2.1 `spectralGap_randomWalk_le` | `ℤ/4` lazy vs uniform; split word; trivial group; word `s s⁻¹ s` | sums `5/4`, `1/4`, `B=5`, `1 ≤ 5/2`; split: `3/4`, `3/4`, `B=3`; trivial: `0 ≤ 0`; load `=|G|⁻¹Σ μ' ν N |w|` with multiplicity | holds | none |
| 2.2 `adjacentTransposition`, `spectralGap_randomTransposition_le` | `n=0,1,2,3,4,5` | `n≤1`: `0 ≤ 0`; exact `B = 1, 56/9, 15, 704/25` (sums 1; 7; 20; 44); `γ_rt=2/3`, `γ_adj=1/4`: `2/3 ≤ 14/9`; `n=4`: `(2−√2)/6` | holds; `B ≤ 4n(n−1) ≤ 4n²` | none |
| 3.1 `transitionEigenvalues`, `one_sub_transitionEigenvalues_le` | two-state pair; one state; `a<0`; `a=0`; zero kernel; point-mass `π` on four states | `[1,3/5]`, `[1,0]`: `k=1`: `1 ≤ 2`; `a<0` ⇒ both identity, `0 ≤ 0`; zero kernel: `0 ≤ −c` false (Markov needed); charpoly `(x−1)(x³−1)`: 2 real roots | holds with stated hypotheses | none |
| 3.2 entropy comparison | indicator, `π=(1/4,3/4)`, `π'` uniform; `m=0`; `g=0` | both entropies `(log 2)/2`, `c=3/2`; `m=0`: `0 ≤ c·Ent' `; minimum over `t` at `t=m` uses `Σπ=1` | holds | none |
| 3.2 `logSobolevConstant_le_of_dirichletForm_le` | two-state pair; point-mass `π`; `a<0`; `π'` with a zero | `α=1/(5 log 3)≈0.182`, `α'=1/2 ≤ 1/log 3≈0.910`; point mass: `E=0`, `α'=0`; controls give `1/2 ≤ 0` | holds; both controls fail as claimed | none |
| Copied definitions | `transitionMatrix`, `dirichletForm`, `spectralGap`, `randomWalk`, `randomTransposition`, two instances, `funEntropy`, `logSobolevConstant` | bodies identical to the owners' files at their open heads (MarkovChainMixing lines 90, 173, 178; RandomWalksOnFiniteGroups 63, 159–169; LogSobolevForMarkovChains 45, 51) | verbatim | none |
| Supplier statement used in 1.3, 2.1 | MarkovChainMixing `spectralGap_le_of_dirichletForm_le` | hypotheses there: `κ`, `κ'` Markov, `π` stationary probability, `π'` positive probability; same as 1.3 | agrees | none |

- Source locators checked against the text: 26 (LPW 14; Aldous–Fill 8, read in the PDF of the monograph on Aldous's page; DGJM 4); all agree in number, page and hypotheses.
- Library declarations opened at the pin: 12 (`Matrix.charpoly_units_conj` Charpoly/Basic.lean:291; `Matrix.IsHermitian.eigenvalues₀` Spectrum.lean:60; `sort_roots_charpoly_eq_eigenvalues₀` Spectrum.lean:174; `Finset.sum_mul_sq_le_sq_mul_sq` Ring/Finset.lean:171; `Kernel.Invariant`, `Kernel.IsReversible` Invariance.lean:39, 58; `Kernel.const`, `Kernel.ofFunOfCountable` Kernel/Basic.lean:178, 237; `Measure.uniformOfFinset` Uniform.lean:199 (empty sum for `∅`); `List.IsChain`; Tau Ceti `Kernel.toMatrix` Matrix.lean:44; `eigenvalues_eq_iSup_iInf_re_inner` CourantFischer.lean:251).
- Cross-roadmap citations resolved at the open heads: 9 (MarkovChainMixing 2.1, 2.3, 2.4; RandomWalksOnFiniteGroups 1.1, 4.2; LogSobolevForMarkovChains 1.1, 1.2, 2.1; MCMCAsymptoticVariance Layer 4), plus SpectralGraphBounds Layer 5 and ElectricalNetworksAndRandomWalks by heading.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/ComparisonOfMarkovChains/Suggested.lean`: exit 0, six `sorry` warnings and nothing else; single `import Mathlib` plus one Tau Ceti module; no `set_option`, no sorry'd data.
- Signatures: the elaborated types of all 20 declarations were compared with the README; the nine definitions drop `[MeasurableSingletonClass S]`, which their types do not need (the owners' copies drop it too); the six theorems keep every hypothesis. Nothing changed.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp_all`) on a copy: none of the six theorems closes; no padding.
- Headline theorems (README): comparison by paths (1.2), canonical paths (1.4), walks on groups (2.1), adjacent against random transpositions (2.2), eigenvalues one by one (3.1), logarithmic Sobolev constants (3.2); all six stated in Lean. The pull request's description agrees with the head (12 definitions, 2 instances, 6 theorems, 7 copied definitions).

Overlap check: read LogSobolevForMarkovChains, MarkovChainMixing, RandomWalksOnFiniteGroups, MCMCAsymptoticVariance, HittingAndCoverTimes; nothing shared (the first three each place this comparison outside their scope, MCMCAsymptoticVariance 4.1 orders asymptotic variances, a different quantity).

Source independence: 9 passages compared with 3 sources, none shared; largest share LPW, 14 of 26 locators; contents compared with LPW (§13.4, §13.4.1, §13.4.2, §16.1.1): independent — Layer 1 merges §13.4 and §13.4.1 into one statement with multiplicities, Layer 2 joins §13.4.2 with §16.1.1, Layer 3 has no counterpart there, and the order 1.2 → 2.1 → 2.2 is forced by the `*Needs:*` lines.

Research link: The comparison theorems are those of Diaconis and Saloff-Coste (1993) and the canonical-path method of Jerrum and Sinclair (1989) and Diaconis and Stroock (1991), used to bound spectral gaps of Glauber dynamics and shuffles; rests on the README's Downstream consumers, the notes of LPW p. 199 and DGJM p. 90.

## Not verifiable

- The papers of Diaconis and Saloff-Coste (1993), Jerrum and Sinclair (1989) and Diaconis and Stroock (1991): named for attribution only and marked "not consulted" in the README; no locator of theirs is cited, and they were not opened.
- Ownership against open pull requests was checked for the five closest roadmaps and by a search of all open heads for canonical paths, congestion and comparison of Dirichlet forms; no other owner was found.

## Source issues

- **Misprint** in LPW at Remark 13.25, p. 191: the source says `N(a, Γ)` is the number of times `a` appears in the expansion `Γ`, then uses `N(s, Γ)` in (13.21); it should be the number of times `s` appears; affects nothing.
- **Gap** in LPW at the proof of Corollary 13.24, p. 191: the source says the number of pairs whose path contains a given edge is exactly `N(s, a)`; it should be at most `N(s, a)`, equal only when passages are counted with multiplicity (a word such as `s s⁻¹ s` crosses one edge twice); affects the proof.

## For the human reviewers

- **Licence.** Aldous and Fill, *Reversible Markov chains and random walks on graphs*, is an unpublished draft monograph (Chapter 8 dated May 19, 1999) read from Aldous's own page; eight locators of Layers 1 and 3 rest on it (README References).
- **Merge order.** All three suppliers (MarkovChainMixing, RandomWalksOnFiniteGroups, LogSobolevForMarkovChains) are open pull requests of the same author, not on main; nine definitions and instances are copied verbatim from them into `TauCetiRoadmap/ComparisonOfMarkovChains/Suggested.lean`.
