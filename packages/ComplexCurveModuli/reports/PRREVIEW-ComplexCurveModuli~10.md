# Review of ComplexCurveModuli (pull request #2548 at 871cd82)

**Verdict:** accepted

**Summary.** Accepted: the one change since the previous review ends the neck Check of §6.1 at its displayed limit, and the Check that remains was recomputed and is correct. The description now states the strict cutoff of §6.2 and the changed bootstrap of §3.5, and it was read in full against this head. There is no finding; there is one small correction and one carried format note, both to the description, and neither blocks. Nothing is left for the human reviewers to decide.

## C01 — The description places ConformalMappingPartII's link to the old Layer 0 anchor at "README line 25"; on main it is at line 1097

A reader who opens ConformalMappingPartII's README at line 25 to confirm that "No link breaks" finds no link there. On main the only link to `#d0-smooth-curves-finite-type-and-the-classification-floor` is at line 1097 of `TauCetiRoadmap/ConformalMappingPartII/README.md` (in §"Reuse ComplexCurveModuli D0.4"); line 25 is where it stood at this pull request's merge base. The claim itself holds: the anchor stands at README line 127 here, directly before the Layer 0 heading, and no other roadmap on main links to a heading of this README.

The sentence would be right without the line number ("ConformalMappingPartII links to the old heading anchor …"), or with "line 1097".

## N01 — The description says the node-chart prototype "is kept unchanged", and its docstrings were reworded

Carried from the two previous reviews; the sentence is unchanged. The declarations and statements of the prototype are those on main, but most of its docstrings were rewritten and a few were added. The sentence would be exact as "…is kept, with its statements unchanged and its docstrings reworded".

## Questions for the author

- The References cite Wendl's notes as "version 3.3", and §3.5 cites its §§4.2–4.3. The copy that can be read openly is arXiv:1011.1690v2, which is version 3.2. Does version 3.3 keep this numbering? Version 3.3 could not be read; citing version 3.2 would make the locator verifiable. (Carried; the citation is unchanged.)

## Previous findings

- The previous review raised no finding (no R01).
- C01 of the previous review — repaired: the description now reads "is stated for lengths less than `2 arsinh(1)`; a Check gives two geodesics of exactly that length crossing on a once-punctured torus", as §6.2 does (README line 1334).
- C02 of the previous review — repaired: the description has the bullets "The old §3.5 bootstrapped any C¹ intertwining diffeomorphism to smoothness. Between structures of class `W^(k,p)` it now yields class `W^(k+1,p)`…" and "The neck estimate of §6.1 assumed 'uniform branch radii'…".
- N01 of the previous review — not repaired: "The proved topological prototype of the node chart and its base change is kept unchanged" (written again above as N01).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §6.1 Check (changed): neck modulus `log(1/ρ_a) = −log|a| + 2 log r`, and the radii `r = |a|^(1/4)` | fixed r; `|a| = 10⁻⁴`, `r = 0.1` | annulus `|a|/r < |x| < r`, ratio `r²/|a|`; `r² = 10⁻² > 10⁻⁴`; `log(1/ρ) = 4.605`, `−log|a| = 9.210`, error `−4.605 = (1/2) log|a|` | Check true as it now ends; the removed sentence stated nothing the Check needs | none |
| §6.1 body, which the Check tests: `log(1/ρ_a) = −log|a| + O(1)` for radii in `[c, C]`, `0 < c ≤ C` | r = c, r = C | error `2 log r ∈ [2 log c, 2 log C]`, bounded; unbounded below as `r → 0` | body and Check agree | none |
| Description: the seven added theorems and the one added definition | names and counts against `Suggested.lean` and its diff with main | 7 `sorry` theorems (lines 70, 81, 100, 118, 152, 166, 186); `HasGeodesicBoundary` added; `CircleSobolevCoefficients` and 8 `#print axioms` removed; namespace `TauCetiRoadmap.ComplexCurveModuli` | description agrees | none |
| Description: the old labels still resolve | `D0 item 1, 2, 3, 5`, `D3 item 5`, `D6 item 1, 4`, `D7 item 1, 2, 3` as cited by AnalyticStableMaps and GromovWittenTheory on main | §§0.1a–0.1f, 0.2, 0.3, 0.5, 3.5, 6.1, 6.4, 7.1, 7.2, 7.3 all exist at this head | description agrees | none |
| Description: the link from ConformalMappingPartII | grep of main for the anchor | one link, at line 1097 (line 25 at the merge base); anchor present at README line 127 | link lands; the line number is out of date | C01 |

The rows for the untouched statements stand as in the previous review, of `7797601`.

- Changed passages: one, the last sentence of the Check of §6.1 (README line 1324), removed; `Suggested.lean` is unchanged. No layer, section, id, locator or *Needs:* line was added, removed or renumbered, and nothing else in the README referred to the removed sentence.
- Seeded sample: none of the sampled sections falls in the changed passage; the diff adds or changes no source locator, so no source text was reopened.
- Description against the head: checked the order of sections (overview, guide, Conventions, Layers 0–8, Downstream consumers, Scope and ownership, Exact supplier contracts, References), the 17 supplier subsections against the 17 suppliers it names, 56 Check bullets against "about 55", a *Needs:* line in every numbered section, the Robbin–Salamon locators 3.7–3.8, 5.3, 5.6, 6.5, 6.6, 9.1, 9.2, 11.4, 17.3, 17.4, 17.5 in the body, the table under Scope and ownership, the ids named in Downstream consumers, and the absence of the dropped names; one line number out of date (C01) and one carried sentence (N01).
- Cross-roadmap citations resolved for the description: GeometricTopology §1.7 and §3.3, RiemannianManifoldsWithConvexBoundary §1.4, ModularForms §10B (as cited in §0.1f) on main; ConformalMappingPartII on main (lines 1097 and 1194).
- Library declarations: none reopened, no statement having changed.
- Dependency check output: `depcheck: 171 roadmaps, 1993 edges, 0 problem(s)`. No UPWARD or CYCLE line. The pull request changes nothing outside `TauCetiRoadmap/ComplexCurveModuli/`.
- Elaboration of `TauCetiRoadmap/ComplexCurveModuli/Suggested.lean`: seven `sorry` warnings (lines 70, 81, 100, 118, 152, 166, 186) and nothing else.
- Automatic checks: all passed; none set aside.

Overlap check: read AnalyticStableMaps, GromovWittenTheory and ConformalMappingPartII (main) for their citations of this roadmap this round; the scopes of AnalyticStableMaps, GromovWittenTheory, HeegaardFloer and TeichmullerGeometry stand as read in the previous review; nothing shared, and the change touches no owned object. No open pull request changes this roadmap, no cited id is dropped and no id is dropped here that others cite.

Source independence: changed passages only; the change removes one sentence and adds none, so 0 passages were compared; largest share RobbinSalamon2006, 21 of 24 body locators, unchanged; no layer was added, removed or reordered, so the comparison of contents stands as in the previous review: independent. The corrigendum was not read.

Research link: Layers 3–6 are the analytic construction of the Deligne–Mumford orbifold of Robbin and Salamon (2006, corrigendum 2007), extended in §4.5 to all restricted families; AnalyticStableMaps and GromovWittenTheory build stable-map moduli and Gromov–Witten operations on it. Rests on the README's Downstream consumers and References and on RobbinSalamon2006 §§5–6, 17.

## Not verifiable

- Robbin–Salamon corrigendum (J. Eur. Math. Soc. 9 (2007), 901–905): behind a subscription, recorded as uncertified; not read.
- Wendl, version 3.3: not read; version 3.2 (arXiv v2) was read in the previous review (see the question above).
- The description's sentences about the README on main before this revision and about what the pinned Tau Ceti holds were not rechecked this round beyond the items listed above; the description is cut where the quoted text ends.

## Source issues

- **Error** in RobbinSalamon2006 at the proof of Theorem 17.5, printed page 79 of the arXiv version: the source says geodesics of length at most 2 arsinh(1) are pairwise disjoint; it should be length less than 2 arsinh(1), since on the square once-punctured torus two simple geodesics of exactly that length cross; affects the proof.

## For the human reviewers

- none
