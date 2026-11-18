# Review of MultiArmedBandits (pull request #2493 at eaccbc7)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired. `envLaw_congr` is added as a target (true, and not a one-tactic consequence of the library), the second Check of 3.1 is now true, and the negative control is correct. There are two small corrections, both in the new text (the policy built in 3.1 to cover the source's algorithm is not `IsETC m` as described off the source's path; the last sentence of the new Check of 1.1 is false when the kernels differ at two histories), and one format note; none blocks. The same three points as before are left for a human.

## C01 — The policy that 3.1 builds to cover the source's algorithm does not satisfy `IsETC m` as described: off the source's path, "the same arm as the source" need not maximise `prefixSum`

The new paragraph of 3.1 (README lines 516–521) says that the policy playing "arm `t mod K` in round `t` when that arm has fewer than `m` plays, otherwise the least arm with fewer than `m` plays, and, when there is none, the same arm as the source" satisfies `IsETC m`. The source commits to an arm of largest empirical mean over the first `m K` rounds (LattimoreSzepesvari2020 lines 4144–4150), and at a history that the source never reaches this is not an arm of largest `prefixSum · m t ω`. Take `K = 2`, `m = 1`, `t = 3`, arms `(0, 0, 1)`, rewards `(1, −5, 0)`: no arm has fewer than one play, the empirical means over the first two rounds are `−2` for arm `0` and (unplayed) `0` for arm `1`, so the source's rule gives arm `1`; but `prefixSum 0 1 3 ω = 1 > 0 = prefixSum 1 1 3 ω`, so `S 3 ω = {0}`. An implementer who writes the policy as described cannot prove `IsETC m` for it. The conclusion (the bound holds for the source's policy, through the congruence item) is unaffected.

Smallest change: replace "the same arm as the source" by "an arm of largest `prefixSum · m t ω`, chosen by the source's tie-breaking rule", and add that on the source's own path every arm has exactly `m` plays at time `m K`, so this is the source's choice there. Also, the source's rounds start at `1` and its round `t` explores arm `(t mod k) + 1` (line 4148), so in the README's indexing the source explores arm `(t + 1) mod K` in round `t`, not `t mod K`; "the arm the source explores in round `t`" avoids the shift.

## C02 — In the new Check of 1.1, the laws of `A_1` can coincide when the kernels differ at more than one reachable history

The Check (README lines 239–241) ends: "If they differ at a history with `A_0 = 0` and reward `x`, and `ρ 0 0` gives `x` positive mass, the laws of `A_1` differ." Take `ρ 0 0 = ½ dirac 0 + ½ dirac 1`, `π.next 0` equal to `dirac 0` at `(0, 0)` and `dirac 1` at `(0, 1)`, and `π'.next 0` the reverse. The kernels differ at histories of positive mass, yet `A_1` is uniform on the two arms under both; what differs is the joint law: `P(X_0 = 0, A_1 = 0)` is `½` for `π` and `0` for `π'`. Either say "the laws of `(X_0, A_1)` differ", or say that the kernels differ at that one history only (then the laws of `A_1` differ by `ρ 0 0 {x}` times the difference of the two kernels there).

## N01 — "transfers results to a policy that obeys the rule only at almost every history" promises slightly more than the congruence item gives

The sentence of 1.1 (README lines 182–184) would be exact as "transfers results between two policies whose kernels agree at almost every history": the congruence item needs a second policy that obeys the rule everywhere, which the sentence does not supply. (Likewise, in 3.1, the source's policy does satisfy `IsETC m` when `m = 0` or `K = 1`; "for `m ≥ 1` and `K ≥ 2`" would make the sentence exact.)

## Previous findings

- R01 — repaired: 1.1 now says the rule "constrains the kernels at every history", `envLaw_congr` is a target in the README and in `Suggested.lean`, the second Check of 3.1 is true and the negative control is added; one slip in the new paragraph of 3.1 is C01.
- N01 — repaired: the Provenance section reads "lean4-mlir (Lean 4, BSD-3) trains reinforcement-learning agents and contains no proofs on bandits".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `envLaw_congr` | induction on `n`; hypothesis asymmetric in `π`, `π'`; `first` equal, `next 0` differing on a null set | history laws agree at `n`; `μ_n ⊗ₘ κ_n = μ_n ⊗ₘ κ'_n` by `Measure.compProd_congr`; limit unique | true; elaborated type equals README statement | none |
| 1.1 new Check | `ρ 0 0 = ½δ_0 + ½δ_1`, kernels swapped at `(0,0)`, `(0,1)` | law of `A_1` uniform under both; `P(X_0=0, A_1=0)` is ½ against 0 | first sentence true; last false for two histories | C02 |
| 3.1 second Check | `m = 1`, two arms, least unplayed arm, then least argmax | unplayed arm has `pullCount < 1`; otherwise argmax of `prefixSum · 1` lies in `S t ω` | `IsETC 1` holds | none |
| 3.1 negative control | `first = dirac 0`, `next 0 ≡ dirac 1`, history with `A_0 = 1` | `pullCount 0 1 = 0`, `pullCount 1 1 = 1`, `S 1 ω = {0}`, kernel mass 0; differing histories have `first`-mass 0 | not `IsETC 1`; same law | none |
| 3.1 source-policy paragraph | `K = 2`, `m = 1`, `t = 3`, arms `(0,0,1)`, rewards `(1,−5,0)` | source rule: means `−2`, `0`, arm 1; `prefixSum` 1 against 0, `S 3 ω = {0}` | built policy not `IsETC 1` as described | C01 |
| 3.1 Check on `m K ≤ n` | `K = 2`, `m = 1`, `n = 1`, `ν = (dirac 0, dirac 1)`, arm 0 first | regret `1·1 − 0 = 1`; right side `1 + (1 − 2) exp(−1/(4c)) < 1` | true; such a policy exists (second Check) | none |
| 3.1 `etc_regret_le` for the source's policy | source path: round `s < mK` | arm explored has `⌊s/K⌋ < m` plays; at `mK` all have `m`, mean = `prefixSum / m` | transfer valid once C01 is made | C01 |

The rows for the statements the change does not touch stand as in the previous review, of `47eba90`.

- Source locators checked against the text: 3 in LattimoreSzepesvari2020 (Algorithm 1 at lines 4144–4151, Theorem 6.1 at line 4154, Proposition 4.8 at line 2937); they support the citations of the changed passages of 1.1 and 3.1, the two sampled targets the change falls in.
- Library declarations opened at the pins: `MeasureTheory.Measure.compProd_congr` (`Mathlib/Probability/Kernel/Composition/MeasureCompProd.lean` 73, s-finite kernels, almost-everywhere equality), `MeasureTheory.IsProjectiveLimit.unique` (`Mathlib/MeasureTheory/Constructions/Projective.lean` 150, finite measures). Neither states `envLaw_congr`.
- Cross-roadmap citations: none added or changed; no file changed outside the folder.
- Overlap check: read MarkovDecisionProcesses, RegretMinimizationAndEquilibria, DenoisingDiffusion; nothing shared (as in the previous review; the change adds no object another roadmap could own).
- Dependency check output: `depcheck: 214 roadmaps, 2294 edges, 0 problem(s)`.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (13 theorems). One-tactic probe on `envLaw_congr` in a copy (`rfl`, `simp` with the definition, `simp_all`, `congr`): none closes it. Its elaborated type was compared with the README item: same hypotheses, no binder lost.
- All automatic checks passed on this head.
- Pull request text: no sentence contradicted by this head; the description's list of targets is a summary and the new congruence target does not change what it says.

Source independence: changed passages only; 3 passages compared with 1 source (LattimoreSzepesvari2020), none shared; largest share LattimoreSzepesvari2020, 16 of 25 source mentions; the change adds, removes and reorders no layer, so the contents comparison stands as in the previous review: independent. AuerCesaBianchiFischer2002 could not be read.

Research link: The headline targets are the regret bounds of Auer, Cesa-Bianchi and Fischer 2002 (UCB), the Exp3 bound as in Bubeck and Cesa-Bianchi 2012, and the Lai–Robbins bound in the form of Garivier, Ménard and Stoltz 2019, as presented in Lattimore and Szepesvári 2020; this rests on the README's references and the three texts read.

## Not verifiable

- Auer, Cesa-Bianchi and Fischer 2002, Theorem 1 (cited in 3.2): paywalled; not in a changed passage.
- The simulated values of 3.1, 3.2, 4.2 and 5.3 were not recomputed (unchanged text).
- The LML library named under Coordination was not opened, so the Lean declarations, including the new `envLaw_congr`, were not compared with it.

## Source issues

- none

## For the human reviewers

- **Licence.** The README's Coordination and Provenance sections name the LML library (Apache-2.0) as prior work on Layers 1 to 3 and 4.1; `TauCetiRoadmap/MultiArmedBandits/Suggested.lean` was not compared with it, and names such as `pullCount`, `empMean`, `regret` could coincide.
- **Not tested.** AuerCesaBianchiFischer2002 is paywalled; it is cited once (3.2) and no statement depends on it.
- **Licence.** LattimoreSzepesvari2020 was read in the authors' online edition on an author's page; the README cites that edition's numbering.
