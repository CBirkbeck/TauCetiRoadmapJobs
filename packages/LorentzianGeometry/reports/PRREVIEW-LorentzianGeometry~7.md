# Review of LorentzianGeometry (pull request #2232 at fc070ae)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: the description now says "It also states, with `sorry`, one auxiliary theorem that is not a headline: lying in the same time cone is transitive (§6.2 (b), `IsLorentzian.neg_of_neg_of_neg`), and the proof that the relation defining a time orientation (§8.1) is an equivalence uses it."

## Verified sound

| Target | Instances | Roadmap value | Computed or source value | Result |
| --- | --- | --- | --- | --- |
| §6.2 (b) `IsLorentzian.neg_of_neg_of_neg` (the sentence added to the description) | `b = −t² + x² + y²`; `u = (1,0,0)`, `v = (2,1,1)`, `w = (3,2,−2)`; `dim V = 1`, `b = −t²` | timelike `u, v, w` with `b(u,v) < 0`, `b(v,w) < 0` have `b(u,w) < 0` | `b(v,v) = −2`, `b(w,w) = −1`; `b(u,v) = −2`, `b(v,w) = −6`, `b(u,w) = −3`. Dimension 1: `−uv < 0`, `−vw < 0` give equal signs, `−uw < 0` | sound |
| Same, negative controls | spacelike `v = (1,2,0)`, `w = (−1,−0.9,0)`; index two `b = −t² − s²`, `u = (1,0)`, `v = (1,1)`, `w = (−1,2)` | hypotheses "timelike `v`" and index one are needed | `b(u,v) = −1`, `b(v,w) = −0.8`, `b(u,w) = +1`; index two: `−1`, `−1`, `+1` with all three timelike | both hypotheses used |
| §8.1 `TimelikeVectorField.setoid` (use the description names) | `Suggested.lean` lines 211–218 | reflexive, symmetric, transitive by §6.2 (b) | `refl` is `b(T,T) < 0`; `symm` is `IsSymm`; `trans` calls line 151 with `g.property x`; README line 1366–1367 says the same | agrees |
| §13.3 Hawking, as the description states it | Milne `−dt² + t² dx²`, `n = 1`, slice `t = t₀`, reversed orientation | bound `n/|b|`; Lean `(finrank ℝ E − 1)/|b|` | `H = −1/t₀`, `b = −1/t₀`, `(2 − 1)/|b| = t₀`; the geodesic `t ↦ (t, x₀)` from `t₀` to `0` has length `t₀` | sound, bound attained |
| Description: "The 48 targets" | `### k.n` headings of the README | 48 | 48 | true |
| Description: stated and not-statable lists | module docstring lines 11–45 against the 8 `sorry` theorems | 7 headlines, 1 auxiliary, 4 not-statable groups | lines 304, 312, 323, 348, 358, 427, 473 are the seven; line 151 the auxiliary; the docstring's four groups match the description's | true |

The rows for the untouched statements stand as in the previous review, of `fc070ae`.

- Gate: the worker's run at `fc070ae` is OK (every check 0, build OK). Dependency check rerun: `depcheck: 245 roadmaps, 2234 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line; LorentzianGeometry is on line 219 of the candidate order, right after RelativisticQuantumFieldTheory (218). Nothing changed outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 0 errors and 8 `sorry` warnings (lines 151, 304, 312, 323, 348, 358, 427, 473), nothing else.
- Pull request text read against the head, sentence by sentence: the title; the summary block (Hawking and Penrose hypotheses against §13.3; quantitative Picard–Lindelöf and bi-Lipschitz normal neighbourhoods against §3.4, README lines 969–970; continuous metrics on subsets with boundary or corners against §12.6; null geodesic generators of `C¹` metrics and Filippov geodesics of locally Lipschitz ones against §12.7; consumers against "Downstream consumers"); "Part I (Layers 1–5)", "Part II (Layers 6–13)"; §7.3; the agreement with RiemannianGeometry R1.3, R2–R3 and R5a (README lines 54–57, 356–360); the Hawking sentence against `Suggested.lean` lines 445–485; "Only the new roadmap directory is included". No sentence is contradicted; the change is an added roadmap (0 headings and 0 declarations removed), which the text says.
- Suppliers the description names against the nine `From …` subsections and main at `1a19c9f`: Mathlib, Tau Ceti, HopfRinow (`Completed/HopfRinow`), RiemannianGeometry, PDE, LocalVariationalFieldTheory, DifferentialGeometry, SmoothBundlesConnections (folders on main), RelativisticQuantumFieldTheory (not on main, open). None missing, none extra.
- Cross-roadmap citations resolved this round: 1. RelativisticQuantumFieldTheory §1.1 at its open head `4395f35` is README line 309; its `Suggested.lean` lines 63, 69, 79, 84 declare `Spacetime`, `minkowskiSquare`, `causalFuture`, `causalPast`. The five own names the citation tool lists as found nowhere are declared in `Suggested.lean` (lines 98, 151, 175, 227, 232).
- Seeded sample and source locators: the folder has no changed passage, so none of the fifteen sampled sections falls in one; 0 locators re-read.
- Overlap check: read RiemannianGeometry, HopfRinow, RicciFlow, RelativisticQuantumFieldTheory; nothing shared (RelativisticQuantumFieldTheory §1.1 owns the flat `causalFuture` and `causalPast`, which §8.3 cites; the overlap tool lists no dropped id, no second copy and no other pull request changing this roadmap).
- Source independence: changed passages only; 0 passages compared with 0 sources, as the folder has no changed passage; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- The description's "Annals definitions 50 and 51" names a list that neither the folder nor the repository's top-level files identify; "Annals" does not occur in the folder.
- `oneill1983` is settled as uncertified: "Theorem 14.55A", on which the description's Hawking sentence rests through §13.3, was not read.

## Source issues

- none

## For the human reviewers

- none
