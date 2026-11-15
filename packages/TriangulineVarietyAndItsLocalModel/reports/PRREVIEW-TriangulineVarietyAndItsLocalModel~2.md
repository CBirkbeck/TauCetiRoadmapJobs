# Review of TriangulineVarietyAndItsLocalModel (pull request #1829 at 2da125a)

**Verdict:** needs changes

Incremental re-review of the 136 lines changed since 154076d. The folder's change is sound; both findings are in the pull request's description.

## R01 (P3) — The description says the Lean states definitions and theorems; it declares nothing

**Location:** pull request description, second and fourth prose paragraphs: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti" and "the targeted Lake build succeeds with `sorry` as the only warning".

**Claim:** A reader takes from these that `Suggested.lean` states headline theorems with `sorry`. At this head it has no declaration and no `sorry`, and the description does not say that no headline is statable.

**Witness:** `TauCetiRoadmap/TriangulineVarietyAndItsLocalModel/Suggested.lean` lines 66–68: an empty namespace; its docstring, lines 9–10: "None of them is statable there, so the file declares nothing". `lake env lean` on it prints nothing.

**Repair:** Replace the two clauses by: "`Suggested.lean` declares nothing: none of the headline theorems is statable against the pinned Mathlib and Tau Ceti, and its module docstring names, for each, the carrier that is missing; every target is in the README." and "Validation: the targeted Lake build succeeds with no warning; …".

## R02 (P3) — "everything else named in the README is a consumer" is contradicted by the README

**Location:** pull request description, third prose paragraph: "Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite."

**Claim:** The README names three further roadmaps that are neither suppliers on main nor consumers.

**Witness:** `README.md` line 19: PadicLocalLanglandsForGL2QpPartII §1.2 (with PadicDifferentialEquationsAndRigidCohomology §RD.2.43) "No target here uses them"; line 2223: PadicFamilies "consume none of its results". Only PadicHodgeParametersInLocallyAnalyticRepresentations (line 2221) is a consumer.

**Repair:** "Roadmaps on main are cited by name. Of the other roadmaps the README names, PadicHodgeParametersInLocallyAnalyticRepresentations is a consumer; PadicLocalLanglandsForGL2QpPartII, PadicDifferentialEquationsAndRigidCohomology and PadicFamilies are named only to mark the boundary of the scope. None is a prerequisite."

## Previous findings

The review of 154076d had no finding (verdict accepted); there is nothing to account for.

## Verified sound

| Statement (changed or cited by the change) | Instances | Values computed | Result |
|---|---|---|---|
| §6.1 new sentence "Its consumers are §§6.5–6.6, §6.9, §7.4, §8.1, §9.6 and §12.4" | every `*Needs:*` line and in-text § reference to §§6.1–6.4 from outside them | 6.5, 6.6, 6.9, 7.4 (→6.4); 8.1, 9.6 (→6.2); 12.4 (→6.1) | equal sets |
| §6.5 "consumers are §§7.4–7.5, §8.5, §8.7 and §9.2" | same, for §§6.5–6.9 | 7.4 (6.7, 6.8); 7.5 (6.6); 8.5, 8.7 (6.9); 9.2 (6.9, in its statement, line 1185) | equal sets |
| §10.1 "consumers are §§10.5–10.6, §11.2, §11.6, §§13.1–13.2, §13.5 and §13.10" | same, for §§10.1–10.4 | 10.5, 11.6, 13.1 (10.2); 10.6 (10.3, 10.4); 11.2 (10.1); 13.2 (10.3); 13.5 (10.4); 13.10 (10.4, proof route, line 2105) | equal sets |
| §11.1 "consumers are §§11.6–11.8, §12.1, §§12.6–12.7, §13.3 and §§13.6–13.9" | same, for §§11.1–11.5 | 11.6, 11.7, 11.8, 12.1, 12.6, 12.7, 13.3, 13.6 (11.1, line 2025), 13.7, 13.8, 13.9 | equal sets |
| §13.1 "consumers are §13.6, §13.9, §13.10 and §13.11" | same, for §§13.1–13.5 | 13.6 (13.1, 13.3); 13.9 (13.4); 13.10 (13.5); 13.11 (13.3) | equal sets |
| §13.6 "consumers are §§13.12–13.13 and §13.15, and §11.7 refers to §13.8" | same, for §§13.6–13.10 | 13.12 (13.6); 13.13 (13.9); 13.15 (13.10); 11.7 proof route (13.8, line 1699) | equal sets |
| §6.1 new summary: `X^pdR_(D,F)` formally smooth over the completion of X at x_pdR (§§6.3–6.4) | (n,d)=(2,1), (2,2), (1,2) | dn²+dn(n+1)/2 = 4+3=7, 8+6=14, 2+2=4; d(n²+n(n+1)/2) = 7, 14, 4 | agree with §6.3, §6.4 Checks |
| §13.6 new summary: 0→L→V→barExt¹(D,D)→0 (§13.10) | (n,d)=(2,1) | dim V = 2·(2+2)=8; dim barExt¹ = 3+2=5; dim L=3 = dim(Ext¹_F∩Ext¹_G) of §13.7 (4+4−5) | exact |
| §13.11 new summary: image rigidity carried to D_σ (Ding25 Prop. 2.35, line 1320) | n=3; n=2 | 1+(n−1)(n−2) = 3; 1 | agree with the §13.11 Checks |

The rows for the untouched statements stand as in the previous review, of 154076d.

- Change read in full: seven new `### k.n` group headings with a one-paragraph statement of contents and consumers each; 27 former `### k.n` headings become run-in `**k.n Title.**` paragraphs with number, title and body unchanged (diff compared line by line); no statement, `*Needs:*` line, locator or Check changed. Every one of the 91 numbered sections still has exactly one `*Needs:*` line.
- Source locators checked at the text, the sample where it falls in changed passages: 4 (§6.5: BHS19 line 2449, Cor. 3.5.9; §11.1: Ding25 (2.11), on p. 15; §13.1: Ding25 line 1136, (2.34), pp. 25–26; §13.11: Ding25 lines 1319–1325 and 1342, Prop. 2.35 and Cor. 2.36, pp. 30–31).
- Cross-roadmap citations resolved at the open heads for the regrouped numbers: PadicHodgeParametersInLocallyAnalyticRepresentations cites §§10.1–10.3, 10.5, 11.2–11.8, 12.1–12.2, 12.4, 12.7, 13.8, 13.16, SpringerResolutionAndCharacteristicCycles (line 1549) cites no section number of this roadmap; every cited number is kept. LocallyAnalyticRepresentationsOfLocalGroups now has an open head; its README maps LR.4/principal-series → §5.2, LR.5/orlik-strauch-irreducibility → §6.4, LR.5/orlik-strauch-jordan-holder → §6.5 (lines 146–158), so the gap citations stay valid.
- Gate rerun at 2da125a: every check 0, including build, depcheck, target-ids, layer-ids, outside-folder. Dependency check: `depcheck: 238 roadmaps, 2254 edges, 0 problem(s)`; no UPWARD or CYCLE line. Files changed outside the folder: none.
- Elaboration: `lake env lean` on `TauCetiRoadmap/TriangulineVarietyAndItsLocalModel/Suggested.lean` exits 0 with no output; the file is unchanged since 154076d, has no declaration, so the one-tactic probe and the `#check @name` comparison have an empty domain.
- Description, remaining prose and the summary block read against the head: the local-model statement (§7.4), normality and Cohen–Macaulayness (§7.5), flatness (§8.1), the companion criterion w_x≤w (§8.7), the Kazhdan–Lusztig identity (§9.2), the multiplicity formula (§9.8), Ding's recovery (Layers 10–13), the Newton–Thorne criteria (§§4.2, 4.4), the consumer named and the Mathlib carriers named all agree. The title says it adds the roadmap; it does (not on main, 0 headings removed).
- Remarks on untouched text, no change asked: §11.1's line locator "Ding25 line 627" is the first line of p. 15, the formula (2.11) is at line 661; §9.2 and §13.10 use §6.9 and §10.4 in their text without listing them on their `*Needs:*` lines; the README's "TR1–TR5" for PadicHodgeParametersInLocallyAnalyticRepresentations are not ids of that roadmap's open head, which numbers by §.
- Overlap check: read PadicHodgeParametersInLocallyAnalyticRepresentations, LocalGaloisDeformationRings, PhiGammaModulesAndIwasawaCohomology, PadicLocalLanglandsForGL2Qp, PadicHodgeTheory (the open list by vocabulary; the other two lists are empty); nothing shared: the first consumes Layers 10–13 by section, the others are suppliers cited by section.
- Source independence: 7 passages compared with 2 sources (changed passages only: the seven new paragraphs against BHS19 §§3.5–3.6 and Ding25 §§2.1, 2.3, 2.4), none shared; largest share BHS19, 63 of 127 line locators; contents not compared again, the change adds, removes and reorders no layer.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- none
