# Review of SerreWeightAndLevelOptimisation (pull request #2518 at ff782c8)

**Verdict:** accepted

**Summary.** Accepted, with no finding. The one sentence changed since the previous review, the first paragraph of Downstream consumers, now agrees section by section with what SerreModularityByCompatibleSystems cites at its open head, and the title and description of the pull request agree with this head and with the change against main. There is one format note, carried over and not blocking. The status of the Gross scan remains with the human reviewers.

## N01 — Two of the renamed references still read awkwardly

In §5.11 (line 1337) a leftover label breaks the sentence: "is assigned to SerreModularityByCompatibleSystems, scalar dyadic completion and appears only in the export manifest"; "is assigned to the scalar dyadic completion of SerreModularityByCompatibleSystems and appears" would do. The Check of §6.11 (line 1668) lacks an article and a possessive: "nor final SerreModularityByCompatibleSystems Serre theorem".

## Previous findings

The previous report, of `79248cf`, had no finding; its two small corrections and its format note are accounted for here.

- C01 — repaired: line 1710 reads "consumes §2.13 with §§2.1 and 3.7 for odd p, §§5.2 and 5.9–5.10 for `p=2` with `k(ρ)=2`, §5.6 and Layer 6 for `p=2` with `k(ρ)=4`"; §3.8 is no longer attributed to that roadmap.
- C02 — repaired: the description says "It takes the descent to the full Serre level, Edixhoven's weight theorem and the dyadic optimisation from here, and proves only the scalar non-dihedral dyadic case itself, by a minimal lift."
- N01 — not repaired: lines 1337 and 1668 are unchanged (N01 above).

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| Downstream consumers, first paragraph (line 1710), odd p | SerreModularityByCompatibleSystems at its open head, `S6/strong-form-by-minimal-lifts`, first bullet and *Needs* | cites §2.13 followed by §3.7, and §2.1 for divisibility by `N(ρ̄)`; README: "§2.13 with §§2.1 and 3.7" | matches |
| Same, `p=2`, `k(ρ)=2` | second and third bullets of that target | nonscalar: §5.9 with §5.2; scalar dihedral: §5.10; scalar non-dihedral: Theorems 5.1(1) and 4.1, a minimal lift, citing §5.11 as the boundary | matches |
| Same, `p=2`, `k(ρ)=4` | `S6/strong-form-of-serre-conjecture`, third case and *Needs* | *Needs* lists §2.13, §5.6, Layer 6; the case uses Buzzard's lowering and the weight-2-to-4 passage | matches |
| Same, consequences | *Needs* lines of the later S6 and S7 targets | §4.1 once; §§3.1, 3.2, 3.5–3.6, 3.7 once together; §3.8: 0 citations in that README | matches |
| Same, "which §5.11 leaves open" | §5.11 of this README, lines 1337–1351 | §5.11 assigns the non-dihedral scalar completion to the later roadmap, "not a hypothesis of the results here"; *Needs* of §5.11: §§3.12, 5.10, 6.5 only | true |
| Section ids named in line 1710 | headings of this README | §2.1 (304), §2.13 (581), §§3.1–3.2 (613, 631), §§3.5–3.7 (689–729), §4.1 (947), §5.2 (1155), §5.6 (1243), §§5.9–5.11 (1299–1335), Layer 6 (1363) | all exist |
| Description, counts | diff against main | 18 insertions, 16 deletions; 1758 lines on main, 1760 at head; 0 headings and 0 Lean declarations changed; `README.md` only | matches |

The rows of the previous review, of `79248cf`, stand for every statement the change does not touch; the change alters no statement of the README's layers and none of `Suggested.lean`.

- Source locators checked against the texts: 0; the changed sentence carries none, and no target of the seeded sample falls in it.
- Cross-roadmap citations resolved: the 17 lines of SerreModularityByCompatibleSystems at its open head that cite this roadmap, read against line 1710; 14 section ids of this README confirmed as headings.
- Dependency check: `depcheck: 200 roadmaps, 2203 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. This roadmap is at position 177 of the merge order, ClassicalSerreModularity at 182, SerreModularityByCompatibleSystems at 266; both are named as consumers only.
- Elaboration: `lake env lean` on `Suggested.lean` gives four `declaration uses sorry` warnings (lines 74, 93, 108, 128) and nothing else; the file is the one on main.
- The automatic checks all pass at this head; nothing outside the folder changes.
- Pull request text: the title, the summary block and the prose were read against the head and the word-level diff against main (the renaming in Scope and ownership, §5.11, §§6.11–6.12 and Downstream consumers; §2.11 with §5.8; §6.10; the supplier contract); no sentence is contradicted and no change is left unstated.

Overlap check: read SerreModularityByCompatibleSystems at its open head; the readings of ClassicalSerreModularity, GL2ModularityLifting, GL2ModularityLiftingPartII, AutomorphicGaloisRepresentations, AlgebraicModularFormsAndSerreWeights, HilbertModularVarietiesAndShimuraCurves and ModularCurvesPartII stand from the previous reviews. The level `N(ρ̄)` in odd characteristic and the nonscalar and dihedral dyadic cases: owner this roadmap (§2.13 with §3.7, §§5.9–5.10), cited by SerreModularityByCompatibleSystems. The scalar non-dihedral dyadic completion and the unconditional theorem: owner SerreModularityByCompatibleSystems S6. Nothing else shared.

Source independence: changed passages only; 1 passage (Downstream consumers, first paragraph) which cites no source and was compared with the consumer roadmap's own text, nothing shared beyond section numbers; largest share ribet94, 29 of 102 locators; the change adds, removes and reorders no layer, so the contents were not compared again (independent, as in the previous reviews). The Gross scan was not read.

Research link: Layers 2–6 are the level and weight optimisation of Ribet (1990, 1994), Edixhoven (1992), Diamond (1995) and Buzzard (2000), and KW II §8 (2009); Khare–Wintenberger use it to pass from modularity to Serre's refined conjecture, and SerreModularityByCompatibleSystems S6 consumes it. Rests on the README and on kw2 §8.

## Not verifiable

- Nothing in the changed passage. The three items of the earlier reviews (Gross 1990, Propositions 12.8–12.9; Diamond 1995, Lemma 2.2 and Theorem 1.1; Kisin's standing assumption at the start of his §3.1) are in untouched text and stand as recorded there.

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md` line 1734 links Gross's Duke article as a scan of the published paper on a third party's seminar page (`math.purdue.edu/~tongliu/seminar/Mlift/Gross.pdf`), neither the publisher's nor the author's; its status as a legal copy was not settled, and it carries 7 locators.
