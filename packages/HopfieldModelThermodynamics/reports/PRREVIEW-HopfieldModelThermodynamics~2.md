# Review of HopfieldModelThermodynamics (pull request #3007 at af6708e)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review (the random-pattern Example of Layer 2, false for `P = 0` and `β > 1`) and its one small correction (the metric on `ι → Bool`) are both repaired, and the repairs introduce no new problem. The changed sentences were recomputed and are true; no statement, layer or supplier changed. There are no small corrections and no format notes. The two facts recorded for the human reviewers in the previous review stand.

## Previous findings

- R01 — repaired: "if `P ≥ 1`, the columns … are independent and uniform … For `P = 0` the partition function is `2^N`, so the limit is `log 2`, which is smaller than `pressure β 0` when `β > 1`"; the Layer 4 Example now also says `P ≥ 1`.
- C01 — repaired: "with the Hamming metric on Mathlib's type synonym `Hamming`: plain functions `ι → Bool` carry no metric in Mathlib."

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Layer 2 Example, random patterns (changed; cites 2.1 `tendsto_log_hopfieldPartition_div` and 2.2 `isMaxOn_pressureFunctional_uniform_iff`) | `P=0`; `P=1, β=1.5`, `N=50, 400`; `β=0.5, 1` | `P=0`: `Z=2^N`, limit `log 2=0.69315`; `pressure 1.5 0=0.80834`, `pressure 3 0=1.50251`; `P=1`: `(1/N)log Z=0.81282, 0.80883 → 0.80834`; `β≤1`: `pressure=0.69315=log 2` | true with `P ≥ 1`; the added `P = 0` sentence is true (strictly smaller exactly when `β > 1`) |
| Layer 4 Example, the gap between 4.1 and 4.2 (changed) | `P=1`; `P=3`; `P=0` | `P=1`: slow `β>1`, fast `∣β∣<1`, unsettled `β=1` only; `P=3`: unsettled `[1/3,1]`; `P=0` now excluded (4.1 needs `1 ≤ P`) | true; agrees with the `hP : 1 ≤ P` binder of `exp_le_mixingTime_glauber_hopfieldLaw` |
| 4.2 route, parenthesis on path coupling (changed) | pinned Mathlib | no `Dist`, `PseudoMetricSpace` or `MetricSpace` instance on `Bool` anywhere; `Hamming` instances at `Mathlib/InformationTheory/Hamming.lean:352, 360, 392`; MarkovChainMixing 4.2 `tvToStationary_le_pow_mul_diam` carries `[MetricSpace S]` | true |

The rows for the untouched statements stand as in the previous review, of `e04586d`.

- Changed passages reviewed: 3 (two Examples, one route parenthesis), 20 lines, README only; `Suggested.lean` is unchanged, so no elaborated signature changed.
- Library declarations opened at the pin: 3 (`Mathlib/InformationTheory/Hamming.lean:352, 360, 392`), plus a search of pinned Mathlib for a metric on `Bool` (none).
- Cross-roadmap citations resolved at the suppliers' open heads: 3 touched or flagged (MarkovChainMixing `tvToStationary_le_pow_mul_diam`, `Suggested.lean:275`; LargeDeviations `LargeDeviationPrinciple.exists_pos_eventually_log_le`, `Suggested.lean:118`, and `LargeDeviationPrinciple.tilted`, `Suggested.lean:232`); all exist.
- Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file outside the folder is changed.
- Automatic checks: all passed at this head. Elaboration: `Suggested.lean` elaborates with ten `sorry` warnings and nothing else.
- Pull request text: title and description read against this head; the change (two Examples and one parenthesis) alters nothing they describe, and no sentence is contradicted.
- No source locator lies in the changed passages; the seeded sample does not fall in them.

Overlap check: read CurieWeissModel, GlauberDynamicsOfTheIsingModel, HopfieldNetworks, LargeDeviations, RestrictedBoltzmannMachines; the one-pattern model is owned by CurieWeissModel (cited through the gauge, not restated); fast mixing on graphs is owned by GlauberDynamicsOfTheIsingModel 3.1 (4.2 here is the real-coupling generalisation and recovers it as a Check); Gaussian hidden units are outside RestrictedBoltzmannMachines' scope and owned here; nothing else shared. The change touches none of these objects.

Source independence: changed passages only; 3 passages compared with 3 sources, none shared (the changed sentences are the roadmap's own Examples and a remark on Mathlib, with no counterpart in a source); largest share BovierGayrard, 6 of 12 locator groups; arrangement not compared again, since the diff adds, removes and reorders no layer.

Research link: Layers 1–3 give, for a fixed number of patterns and deterministic column laws, the free energy and overlap large deviations that Bovier–Gayrard (1996) treat for random patterns; Layer 4 extends Levin–Peres (2017) Theorems 15.1 and 15.4 from graphs to Hebbian couplings. Rests on the README's citations and the three texts read.

## Not verifiable

- nothing: the changed passages cite no source, and the library and supplier facts they state were opened.

## Source issues

- none

## For the human reviewers

- **Scope.** By the description's own account, the routes of 2.1, 2.2, 3.1, 3.2, 4.1 (for `P ≥ 2`) and 4.2 (real couplings) are the author's proofs, not found in the cited sources in this form; the previous review rechecked each by hand and numerically.
- **Licence.** LPW was read from the copy on David Levin's own page (pages.uoregon.edu), an author's page; the README cites it as "the edition made available by the authors".
