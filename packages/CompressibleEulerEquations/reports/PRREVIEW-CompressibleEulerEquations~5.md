# Review of CompressibleEulerEquations (pull request #2442 at 4ae1090)

**Verdict:** accepted

**Summary.** Accepted: no finding at this head. This is an incremental re-review of the 31 lines of `TauCetiRoadmap/CompressibleEulerEquations/README.md` changed since `a16a9e6`, and of the pull request's title and description. The change moves the time orientation by `[B]` from LorentzianGeometry §7.3 to its §8.1 in five places, and each now agrees with LorentzianGeometry at its open head; the description's sentence on real Sobolev orders now agrees with the README. There is one small correction (the description calls MathematicalStatisticsNonparametric "still open"; it is on main) and one format note; neither blocks. Two points remain for the human reviewers (Majda1984 could not be read; LukNotes is unpublished).

## C01 — The description says MathematicalStatisticsNonparametric is "still open"; it is on main

A reader of the description who looks for an open pull request of that roadmap finds none, and the sentence groups it with a roadmap that really is open. The description says "PDE and ComplexKahlerGeometry, on main, and MathematicalStatisticsNonparametric and RelativisticQuantumFieldTheory, still open, are named only to mark scope boundaries". `TauCetiRoadmap/MathematicalStatisticsNonparametric/README.md` is on main (its §6.2, "Periodic Sobolev classes as ellipsoids", is the section README.md:2299 names), and no open pull request adds it; RelativisticQuantumFieldTheory is open. Nothing in the README depends on this: it consumes nothing of either.

The text that would be right: "PDE, ComplexKahlerGeometry and MathematicalStatisticsNonparametric, on main, and RelativisticQuantumFieldTheory, still open, are named only to mark scope boundaries".

## N01 — LorentzianGeometry §8.1 is now named in three places but has no line in the supplier contracts

The Conventions (README.md:150), §3.1 (README.md:423) and Scope and ownership (README.md:2245) name LorentzianGeometry §8.1 for the orientation by `[B]`, while "From TauCetiRoadmap.LorentzianGeometry" lists §6.1, §6.3, §7.3, §8.2 and §12.6 only. Nothing of §8.1 is consumed (§3.2 uses the field of §12.6, which asks only for a timelike `B`), so a clause in the §7.3 contract line saying that §8.1 is named for comparison only would save a reader the search.

## Previous findings

The previous review, of `a16a9e6`, had no finding (no R01). Its two small corrections:

- C01 (real Sobolev orders "are deferred") — repaired: the description now reads "real orders lie outside this roadmap and its Part II", as README.md:2285–2286 says.
- C02 (orientation by `[B]` attributed to LorentzianGeometry §7.3) — repaired: "its §7.3 makes `B = (1, v)` a timelike field, continuous when `c` and `v` are, and its §8.1 orients time by `[B]`" (README.md:149–151); likewise at 423, 565, 2245, 2565.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions, signature and time orientation (README.md:142–153, changed) | `B = (1, v)`, `X = (τ, ξ)` general; `n = 1`, `c = 1`, `v = 0`, `X = (1, 1/2)`; `c = 2`, `v = 0`, `X = (1, 0)` | `g(B, X) = −c²τ + (v − v)·(ξ − τv) = −c²τ`; `−1 + 0 = −1 < 0`; `g(X, X) = −3/4`; ours `−4`, Luk–Speck `−1` | holds; future for `[B]` iff `τ > 0` since `c > 0` | none |
| §3.1 acoustical form, pointer to §7.3 and §8.1 (README.md:420–426, changed) | `n = 2`, `c = 2`, `v = (1, 0)`: `B = (1, 1, 0)`; `X = (1, 3, 0)`, `(1, 4, 0)` | `g(B, B) = −4 + 0 = −4 < 0`; `g(X, X) = −4 + 4 = 0`; `−4 + 9 = 5`; `g(B, (1, 3, 0)) = −4 = −c²τ` | holds; §7.3 at LorentzianGeometry's head proves `B` continuous timelike where `c > 0`, §8.1 orients by `[B]` | none |
| §3.2 *Needs* (README.md:565, changed) and `TimeOrientedLorentzianFieldOn D` | sound-cone field `(c, v)` continuous on `D`, `c > 0` | §12.6 asks for a Lorentzian form field and a timelike field, both continuous on `D`; §7.3 gives `g(B, B) = −c² < 0` | holds; no orientation needed beyond `B` timelike | none |
| Scope and supplier contract for §7.3 (README.md:2243–2248, 2560–2567, changed) | each clause against LorentzianGeometry §7.3, §8.1 at its head | §7.3: form, inverse, `B`, causal vectors, Lorentzian, `B` timelike; §8.1 Check: acoustical metric time oriented by `B` | agrees | N01 |
| Description, summary block and prose | each sentence against the head | fourteen theorems in `Suggested.lean` (14 `sorry` warnings); suppliers LorentzianGeometry and SymmetricHyperbolicSystems, both open; MathematicalStatisticsNonparametric on main | one sentence out of date | C01 |

The rows for the untouched statements stand as in the previous review, of `a16a9e6`; `Suggested.lean` is unchanged since that head.

- Cross-roadmap citations resolved at LorentzianGeometry's open head: §7.3 (acoustical form, `B` a continuous timelike field where `c > 0` and `c`, `v` continuous, "§8.1 time orients it by `[B]`"), §8.1 (time orientations; Check that the acoustical metric is time oriented by `B`), §12.6 (`TimeOrientedLorentzianFieldOn D`). Its Downstream consumers lists §6.1, §6.3, §7.3, §8.2, §12.6 for this roadmap.
- Dependency check: `depcheck: 132 roadmaps, 1473 edges, 0 problem(s)`; no UPWARD or CYCLE line. The automatic checks all pass. The diff outside the folder is empty.
- Elaboration of `Suggested.lean`: 14 `declaration uses sorry` warnings (lines 257–535) and nothing else. No statement changed, so the `#check @name` comparison and the one-tactic probe of the previous review stand.
- Seeded sample: none of the sampled targets (§§1.3, 2.1, 2.2, 3.3, 5.1–5.4, 6.1, 6.2, 7.1, 8.1–8.4) lies in a changed passage; no source locator changed; the README flags no locator as unverified.
- Duplication: the change adds no object; no layer added, removed or reordered.
- Pull request text: title and description read against the head; C01 is the one sentence the head and main contradict. The roadmap is new (not on main), as the description says; the headline count, the suppliers and the folder's files are as stated.

Overlap check: read CompressibleEulerEquationsPartII, LorentzianGeometry, SymmetricHyperbolicSystems, IncompressibleFluids, PDE, SobolevPolynomialApproximation, YangMillsConnectionsAndCaloricGauge (scopes as read for `a16a9e6`; LorentzianGeometry §7.3, §8.1 and §12.6 read again at its head). The acoustical form, its time orientation, causal curves and domains of dependence in subsets are LorentzianGeometry's, cited. Linear systems and their classical energy theory are SymmetricHyperbolicSystems', cited. Nothing else is shared; the change moves no ownership.

Source independence: changed passages only: 5 passages compared with 3 sources (ChristodoulouMiao2014 line 988, LukSpeck2018 lines 2218 and 2257, Minguzzi2019 lines 439–440), none shared; largest share Majda1984, 18 of 113 locators, whose text and contents could not be read; the arrangement was not compared again, the diff adding, removing and reordering no layer.

Research link: §7.2 and §§8.2–8.4 are the well-posedness, maximal-development and null-boundary statements on which Christodoulou–Miao 2014, Luk–Speck 2018, Abbrescia–Speck 2022 (shock formation) and Luo–Yu 2025 (rarefaction waves) pose their theorems; §8.2 takes up Eperon–Reall–Sbierski 2019 on non-unique maximal developments. Rests on the README's Downstream consumers and the cached texts.

## Not verifiable

- Majda1984, Kato1975 and Dafermos2016: uncertified, no legal text; no changed passage cites them.
- Friedrichs1954, Christodoulou2007, HawkingEllis1973 and ONeill1983: waived, cited by locator alone; no changed passage cites them.

## Source issues

- **Gap** in ChristodoulouMiao2014 at §2.1.2, printed pp. 24–25: the source says two developments of the same data agree on the whole intersection of their domains, so the union of all developments is the unique maximal one; it should be that they agree on the points whose acoustical causal past lies in both domains, uniqueness of a maximal development needing a separate argument; affects a stated result.

## For the human reviewers

- **Not tested.** Majda1984 holds the largest share of locators (18 of 113, `TauCetiRoadmap/CompressibleEulerEquations/README.md`). Its text and table of contents could not be read legally, so wording and arrangement were not checked against it.
- **Licence.** LukNotes is unpublished lecture notes read from the author's page (manifest `licence_class` author-page). It is cited for standard facts in README.md §§4.2, 4.3, 5.1–5.4, 6.1 and 7.1.
