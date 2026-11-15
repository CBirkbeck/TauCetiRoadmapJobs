# Review of LorentzianGeometry (pull request #2232 at fc070ae)

**Verdict:** needs changes

## R01 (P3) — The description omits the eighth `sorry` theorem of `Suggested.lean`

**Location:** pull request description, fourth paragraph: "`Suggested.lean` states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, with only the definitions their statements need and no `sorry` in any definition: Geroch's theorem, …".

**Claim:** The paragraph lists seven theorems and says the rest is definitions. The head has eight `sorry` theorems; the eighth is no headline, and a definition's proof field uses it.

**Witness:** `TauCetiRoadmap/LorentzianGeometry/Suggested.lean` line 151, `IsLorentzian.neg_of_neg_of_neg` (§6.2 (b)), `sorry`; line 217 uses it for `trans` in `TimelikeVectorField.setoid`, on which `TimeOrientation` (line 221) rests. Elaboration: 8 `sorry` warnings.

**Repair:** After the sentence ending "…and the Ricci tensor is Tau Ceti's Ricci tensor of the Levi-Civita connection." add: "It also states, with `sorry`, one auxiliary theorem that is not a headline: lying in the same time cone is transitive (§6.2 (b), `IsLorentzian.neg_of_neg_of_neg`); the proof that the relation defining a time orientation (§8.1) is an equivalence uses it."

## Previous findings

- The review of `fc070ae` had no findings; the folder has not changed since (0 lines).

## Verified sound

| Target | Instances | Roadmap value | Computed or source value | Result |
| --- | --- | --- | --- | --- |
| §6.2 (b) `IsLorentzian.neg_of_neg_of_neg` (R01) | `b = −ts + xy`; `u = (1,0)`, `v = (2,1)`, `w = (1,½)`; control `v = (1,2)` spacelike, `w = (−1,−0.9)` | `b(u,v) < 0`, `b(v,w) < 0` give `b(u,w) < 0` for timelike `u, v, w` | `b(u,v) = −2`, `b(v,w) = −1.5`, `b(u,w) = −1`. Control: `b(u,v) = −1`, `b(v,w) = −0.8`, `b(u,w) = +1`, so timelike `v` is needed | sound |
| §8.3 Minkowski comparison (cited by the description's supplier paragraph) | `p = 0` in `ℝ^{1,3}`; `x = (1,1,0,0)`, `(1,2,0,0)`, `(−1,0,0,0)` | `J^+(0) = {t ≥ \|x\|}` equals RelativisticQuantumFieldTheory `causalFuture {0}` | `{x₀ ≥ 0 ∧ x₀² − \|x\|² ≥ 0}`: `(1,1,0,0)` in (`0 ≥ 0`), `(1,2,0,0)` out (`−3`), `(−1,0,0,0)` out of `J^+`, in `causalPast {0}`; `0` in both, as `insert p` gives | sound |
| Description: "The 48 targets" | count of `### k.n` headings | 48 | 48 | true |
| Description: stated and not-statable lists | `Suggested.lean` docstring lines 16–45 against the 8 `sorry` theorems | 7 stated headlines; 4 not-statable groups | lines 304, 312, 323, 348, 358, 427, 473 are the seven listed; line 151 is not listed (R01); the four groups match | R01 |

The rows for the untouched statements stand as in the previous review, of `fc070ae`.

- Gate: the worker's run at `fc070ae` is OK (every check 0, build OK). Dependency check rerun against the candidate order: `depcheck: 245 roadmaps, 2232 edges, 0 problem(s)`; LorentzianGeometry is on line 218, right after RelativisticQuantumFieldTheory (217). No file changed outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 0 errors and 8 `sorry` warnings (lines 151, 304, 312, 323, 348, 358, 427, 473), nothing else.
- Pull request text checked against the head, sentence by sentence: the title; the summary block (Part I and II content, Hawking and Penrose hypotheses of §13.3, the bi-Lipschitz normal neighbourhoods of §3.4, the continuous metrics of §12.6, the `C¹` generators of §12.7, the consumers of "Downstream consumers"); "Part I (Layers 1–5)" and "Part II (Layers 6–13)"; §7.3, §12.6, §12.7; the agreement with RiemannianGeometry R1.3, R2–R3 and R5a (README lines 54–57, 356–360); "Only the new roadmap directory is included" (the diff outside the folder is empty); the Hawking paragraph against `Suggested.lean` lines 445–485. One sentence is incomplete: R01.
- Suppliers named by the description against the README's contracts and main: Mathlib, Tau Ceti, HopfRinow (under `Completed/` on main), RiemannianGeometry, PDE, LocalVariationalFieldTheory, DifferentialGeometry and SmoothBundlesConnections (each a folder on main at `1a19c9f`), and RelativisticQuantumFieldTheory (not on main; open). All nine match the nine `From …` subsections; none is missing or extra.
- Cross-roadmap citations resolved again this round: 1. RelativisticQuantumFieldTheory §1.1 at its open head is README line 309, "1.1 Klein–Gordon causal Green operators", and its `Suggested.lean` lines 63, 69, 79 and 84 declare `Spacetime`, `minkowskiSquare`, `causalFuture` and `causalPast`.
- Seeded sample and source locators: no passage of the folder changed, so none of the fifteen sampled sections falls in a changed passage; 0 locators re-read.
- Overlap check: the folder is unchanged and the lists of closest roadmaps name the same roadmaps as before; the result of the review of `fc070ae` stands (read RiemannianGeometry, HopfRinow, RicciFlow, PositiveMass; nothing shared). This round read RelativisticQuantumFieldTheory §1.1: it owns the flat `causalFuture` and `causalPast`, and §8.3 here cites them.
- Source independence: changed passages only; 0 passages compared, as the folder has no changed passage; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- The description's "Annals definitions 50 and 51" names no source that the README, the references or the repository's top-level files identify; neither "Annals" nor a Definition 50 or 51 occurs in the folder.
- `oneill1983` is settled as uncertified: "Theorem 14.55A", which the description's Hawking paragraph relies on through §13.3, was not read.

## Source issues

- none

## For the human reviewers

- none
