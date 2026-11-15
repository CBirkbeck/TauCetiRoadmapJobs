# Review of AlgebraicTopologyPartII (pull request #1694 at ccdd821)

**Verdict:** accepted

No finding. This is an incremental re-review of the 2 lines changed since ed88288 (the README Summary), together with the pull request's title and description read against this head.

## Previous findings

- R01 — repaired: the description now has "A fourth develops Thom–Mather theory through the first isotopy lemma (`firstIsotopyLemma`)", a Layer 16 paragraph ("Layer 16 holds 17 of the 38 declarations"), and "StratifiedSpacesAndTameTopology consumes §§16.1a–16.1e from this roadmap".
- R02 — repaired: "the real-locus strand takes its semialgebraic site, purity and duality from MotivesAndAlgebraicCycles, which specializes SchemeAndStackFoundations' equivariant sheaves, with singular and Borel comparisons only over ℝ".
- R03 — repaired: the Dependencies paragraph now lists the suppliers on main, the four open ones, the 14 declared gaps by supplier, and "QWittVectors §1.4a … MotivesAndAlgebraicCycles Layer 2 …; neither is consumed".

## Verified sound

| Statement | Instances | Values, left side | Values, right side | Result |
|---|---|---|---|---|
| `firstIsotopyLemma` (§16.1e; named by the changed Summary) | A = closed disc × ℝ in ℝ³, strata of dimensions 3 and 2, f=z; cone x²+y²=z² with strata {0} and the rest, f=z; N a point, A compact; A=∅, ι=∅ | `hsub` holds, rank 1 on both strata, preimage of [a,b] compact; `hsub` fails at {0} (rank 0<1); rank 0=m, `hp` is compactness; all hypotheses hold vacuously | h(x,y,z)=(z,(x,y,b)) keeps both strata; fibres: point over 0, circle elsewhere, so no trivialization; h is the identity of A; source and target both ∅ | holds; `hsub` is needed |
| `ControlData.exists_flow` (§16.1d; "controlled flows" in the changed Summary) | ℝ², strata {0} and ℝ²∖0, π₀=0, ρ₀=x²+y²: rotation field; inward unit radial field | dρ₀(−y,x)=−2xy+2xy=0, controlled; dρ₀=−2√ρ₀≠0, not controlled | flow R_t·v on D=ℝ×X, open; orbit of v ends at t=∣v∣, D not open at (1,0) | holds; the control condition is needed |
| Changed Summary sentence against the headings | §§16.1, 16.1a–16.1e, 16.2 | "equivariant smooth and stratified-pair transport"; "Whitney stratifications, control data and their existence, controlled flows and Thom's first isotopy lemma" | headings at README lines 1523, 1673; 1539, 1571, 1596, 1617, 1647; ownership at lines 7 and 21; build paragraph line 425 | agree |
| §16.1a locator (seeded sample, cited by the changed sentence) | MATHER line 206 | §5 heading on PDF p.10; locally finite, frontier condition, condition (b) at lines 209–214 | README: "MATHER §5, PDF p.10, MATHER line 206", the same three conditions | agree |
| §16.1d locators (seeded sample, cited by the changed sentence) | MATHER lines 715, 727, 825 | controlled submersion and Proposition 9.1 on PDF p.26; Proposition 10.1 on PDF p.29 | README: p.26 line 715; p.26 line 727; p.29 line 825 | agree |
| Description: dependency list against the README | every `TauCetiRoadmap.<X>` citation of the README (19 roadmaps) | description: 14 on main, 4 open, QWittVectors and MotivesAndAlgebraicCycles Layer 2 not consumed; 14 gaps as 9+1+1+1+1+1 | README: the same sections for each (for example AffineMorseLefschetz A2–A3, A4.0, A4.1; CharacteristicClasses §§C2.3, C3.2, §C3); 14 "must provide" contracts, 9 on MotivesAndAlgebraicCycles | agree |

The rows for the other statements stand as in the previous review, of ed88288.

- **Gate**, run on this head: every check is 0, ending `outside-folder=0 source-material=0 OK`; the worker's gate also reports `build=0`.
- **Dependency check:** `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean` gives 14 ``declaration uses `sorry` `` warnings (lines 69, 108, 165, 174, 189, 215, 231, 250, 374, 403, 418, 472, 489, 505) and no other message. `Suggested.lean` is unchanged since ed88288, so the binder comparison and the padding probe stand.
- **Outside the folder:** the diff touches 0 paths; the folder against the base is 3 files and 2278 insertions, as the description says.
- **Description claims checked against the head:** 31, all hold: the four strands and their six named declarations, the generality sentences (README lines 13, 21, 180, 233), the 19 dependency entries, the gap counts, the six Validation counts (they match the gate), the Layer 16 count (17 of 38), and the AI-assistance sentence against the commit trailers (1 port commit, 1 by Fable 5.1, 10 by Opus 5.5).
- **Citations resolved:** on main at 276e711, 14 supplier roadmaps (RealAlgebraicGeometry under `Completed/`); open: ComplexComparisonPartII, InverseGaloisAndArithmeticFundamentalGroups, EtaleDualityAndPerverseSheaves, MotivesAndAlgebraicCycles, all earlier in the merge order; consumer StratifiedSpacesAndTameTopology cites §§16.1a–16.1e at its README line 47.
- **Remarks on untouched text** (no change asked): the gap contract at README line 132 names EtaleDualityAndPerverseSheaves §§3.5–3.7, while the declared gap list reads §§3.5–3.8 and §6.5. In the description's summary block, "A second proves…" has no noun before it ("strand").

Overlap check: read StratifiedSpacesAndTameTopology, ExponentialSumsAndCircleMethodPartII, AlgebraicTopology, CharacteristicClasses, DGFloerPartII, TangentialBordism, AffineMorseLefschetz, HomotopySpheres. The owners are as in the review of ed88288: §§16.1a–16.1e and §§2.1, 3.5 belong to this roadmap, and every other shared object to the supplier cited. The changed sentence moves no ownership.

Source independence: changed passages only. I compared 1 passage (the new Summary clause) with 1 source (MATHER, section headings at lines 206, 701, 963); nothing is shared beyond standard names. The largest share of locators is BW, about 75 of 206. Contents were not compared again, because no layer was added, removed or reordered.

## Not verifiable

- Uncertified, cited by locator only: HILTON Theorem A, DIMCA Lemma 4, BRUMFIEL pp.163–169, SCHEIDERER Corollary 18.11, BCR Theorem 9.3.2.
- Waived: KRASNOV Theorem 2.1.
- MATHER was read through the cached OCR text only, which is noisy. At MATHER line 896 the proof of Corollary 10.2 appears to cite Proposition 10.1 for the lifting step that is Proposition 9.1; the OCR does not settle whether this is in the source.

## Source issues

- none

## For the human reviewers

- **Licence:** MILNOR-STASHEFF is read from a copy on A. Ranicki's Edinburgh pages (`webhomes.maths.ed.ac.uk/~v1ranick/papers/milnstas.pdf`), recorded `institutional`. The book is Princeton University Press's, and the host is not one of its authors.
- **Licence:** MATHER (about 39 locators, the second-largest share) is read from the Princeton departmental scan of the 1970 notes, recorded `author-page`. The notes appeared in Bull. AMS 49 (2012), 475–506, which the README does not cite.
