# Review of PolicyGradientMethods (pull request #2565 at bca8dc2)

**Verdict:** accepted

**Summary.** Accepted: both findings of the previous review are repaired, the two sentences are now true as written, and the Check added to 4.1 was recomputed and is correct. No theorem and no line of `Suggested.lean` changed; the file still elaborates with the eight `sorry` warnings only. There is one format note, not blocking, and the two questions left to a human are the same as before (scope, and a licence comparison that was not made).

## N01 — In 2.1, the sentence on the least `C` has no meaning when `S` is empty.

With `S` empty the condition "`μ s > 0` for every `s`" holds vacuously, every real `C` is admissible, and the maximum in `max_s d^{π'}_ρ(s) / μ(s)` is over the empty set (README 2.1, line 182). Writing "when `S` is nonempty and `μ s > 0` for every `s`" would cover it; the theorem itself is unaffected (both sides are `0`).

## Previous findings

- R01 — repaired: 2.1 now reads "when `μ s > 0` for every `s`, the least such `C` is `max_s d^{π'}_ρ(s) / μ(s)`"; with `d ≥ 0` the condition is `C ≥ d(s)/μ(s)` for all `s`.
- R02 — repaired: 3.1 now reads "a policy for every `θ : S → A → ℝ` when `A` is nonempty (for an empty `A` it is the empty table, whose row sums are `0`)".
- N01 (previous) — taken up: 4.1 has a new Check at `θ = (t, 0)` with the values suggested; recomputed below.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.1 remark on least `C` (changed) | `μ = (1, 2)`, `d = (1, 1)`; `μ = −1`, `d = 1`; `S` empty | admissible `C ≥ 1 = max(1, 1/2)`; negative `μ` now excluded by the hypothesis; `S` empty: all `C` admissible, empty max | true for nonempty `S` | N01 |
| 3.1 "softmax is a policy when `A` is nonempty" (changed) | `A` one point; `A` empty, `S` nonempty; `S` empty | one point: row `(1)`, sum 1; `A` empty: row sum `0 ≠ 1`, as the parenthesis says; `S` empty: vacuous | true | none |
| 4.1 new Check, bandit at `θ = (t, 0)`, `γ = 0`, `μ = 1` | `t = 0, 1.3, −2`; Penrose identities | `F = c[[1,−1],[−1,1]]`, `c = σ(1−σ)`; `F† = [[1,−1],[−1,1]]/(4c)`: `F F† F − F = 0`, `F† F F† − F† = 0`; `F†∇V = (0.5, −0.5)`; `A = (0.2142, −0.7858)` at `t = 1.3`; difference `σ − 1/2 = 0.2858` in both entries | true; agrees with the first Check at `t = 0` and with `softmax_npgStep` | none |
| 4.1 `softmax_npgStep` (cited by the new Check) | same bandit, `η = 1`, `t = 1.3` | new `θ = (1.8, −0.5)`, softmax `0.9089`; `mwStep`: `σ e^{1−σ}/(σ e^{1−σ} + (1−σ) e^{−σ}) = 0.9089` | equal | none |

The rows for the untouched statements stand as in the previous review, of `7a5357d`.

- Changed lines read: 10 of 10 (README lines 182, 230–231, 358–362); no file changed outside the folder, and no Lean declaration changed.
- Source locators re-opened for the changed passages: AKLM2021 lines 122 and 141 (the name of the mismatch coefficient), 942 and 3159–3182 (the pseudoinverse step and its proof, which concedes the constant per state that the new Check exhibits).
- Library declarations: `softmax`, `IsPolicy`, `fisher`, `npgStep`, `mwStep` re-read in `TauCetiRoadmap/PolicyGradientMethods/Suggested.lean` (lines 49–55, 148–163) against the new sentences; `[Nonempty A]` is not assumed there, which the new wording of 3.1 matches.
- Cross-roadmap citations: none added or changed; the citation resolver reports nothing unresolved at this head, and no open pull request drops an id cited here.
- Dependency check output: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with eight `declaration uses sorry` warnings and nothing else. The worker's automatic checks all passed.
- The text of the pull request: title and description read against this head; no sentence is contradicted by the three changed passages and they add nothing a reader of the description must be told.

Overlap check: read MarkovDecisionProcesses (main and its open revision), RegretMinimizationAndEquilibria, MultiArmedBandits, OnlineConvexOptimization, StatisticalLearningTheory; nothing shared (the change adds no object; ownership stands as in the previous review).

Source independence: changed passages only: 2 passages compared with 1 source (AKLM2021), none shared; largest share AKLM2021, 12 of 17 locators; the change adds, removes or reorders no layer, so the contents comparison stands: independent.

Research link: The headline targets are the exact-gradient results of Agarwal, Kakade, Lee and Mahajan (2021) and the Łojasiewicz inequality of Mei, Xiao, Szepesvári and Schuurmans (2020), which those papers use for the rates of projected and softmax gradient ascent that the README's scope names as not treated; rests on the README and on both texts.

## Not verifiable

- The README's statement that the repository rl-theory-in-lean contains no policy-gradient material: the repository was not opened.
- The description's numerical tests on random MDPs were not rerun (no numerical library on the worker); the values of the new Check were recomputed in plain Python.

## Source issues

- **Error** in AKLM2021 at Lemma 15, printed page 21: the source says the pseudoinverse update adds exactly the advantage times `η/(1 − γ)` to the parameter; it should be that this holds up to a constant per state, at reachable states, as its own proof in Appendix C.3 concedes; affects nothing.

## For the human reviewers

- Scope: the subject is optimization theory for reinforcement learning (tagged math.OC); the four sources are refereed (J. Mach. Learn. Res. 2021, ICML 2020, NeurIPS 1999 and 2001). Whether this is within the project's scope is yours to decide.
- Licence: `Suggested.lean` was not compared with the public repositories the description names (rl-theory-in-lean, lean4-mlir); the description says neither was used.
