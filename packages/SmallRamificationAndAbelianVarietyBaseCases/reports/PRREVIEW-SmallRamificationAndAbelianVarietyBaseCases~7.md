# Review of SmallRamificationAndAbelianVarietyBaseCases (pull request #2517 at 2deaafc)

**Verdict:** accepted

**Summary.** Accepted: no finding. The 27 changed lines repair the three small corrections of the previous review: the notes on later users now agree with the *Needs* lines of the roadmaps they name, the description's two inaccurate sentences are corrected, and §5.12 with its table row now says that §5.11 leaves the Paso 6 hypotheses empty, which was recomputed and is true. The title and description agree with this head. Two format notes are carried over unchanged, none blocking, and one licence question is left for a human.

## N01 — `RankTwoOrdinaryEndpoints` (lines 169, 2099, 2587) is in code font but is declared nowhere

LocalGaloisDeformationRings on main has §0.3 “Ordinary period comparisons and rank-two endpoints” and no identifier of this name. Writing the section's title in prose would let a reader see that it is not a declaration.

## N02 — Three slips of wording

“by §5.0d and §5.0d” (§5.11, line 2498) repeats one reference; “ClassicalArithmeticCompletion ClassicalArithmeticCompletion §5.1” (Dependencies of Layer 4, lines 1813–1814) repeats the name; and the *Needs:* line of the quaternionic Jacobian target is run into the last Check bullet of §5.0c (line 1977).

## Previous findings

The previous report had no finding (no R01); its small corrections and format notes are accounted for here.

- C01 — repaired: “Its Layer S3 uses the level-one dihedral exception of §5.6. Its Layer S4 uses Layers 2 and 4 and §§5.3–5.4, 5.6–5.7, 5.9 and 5.12”; the `p+1` row now reads “S4 at `p = 5`”.
- C02 — repaired: the description now says “R26.5 and R33.4 no longer exist, and R26.1 no longer uses these base cases” and “§5.9 at p = 5 is used by SerreModularityByCompatibleSystems S4”.
- C03 — repaired: “By §5.11 these hypotheses are never met … that corollary rests on §§5.7–5.9 and not on this section”; the table row adds “by §5.11 no such system exists”.
- N01 — not repaired: `RankTwoOrdinaryEndpoints` is still in code font at lines 169, 2099 and 2587; N01 above.
- N02 — not repaired: the three slips stand at lines 2498, 1813–1814 and 1977; N02 above.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| §5.12, new sentence: the Paso 6 hypotheses are never met | system with `S = ∅`, 5-adic member odd, residual (A1); the three conditions of §2.1 | §5.0d (line 2038): members unramified outside `S` and residue characteristic, so outside 5; (A1) gives absolute irreducibility; `det ρ̄(c) = −1`; finite field of characteristic 5 | Level one at `p = 5`; `not_isLevelOneResidual_of_mem_two_three_five_seven` (`5 ∈ {2,3,5,7}`) excludes it |
| §5.12: “rests on §§5.7–5.9 and not on this section” | `p = 5`: normalised even weights `2 ≤ k ≤ p+1 = 6` | `k = 2`: §5.8; `k = 4`: §5.0d, Tate–Serre, §5.7 at (3,4); `k = 6 = p+1`: §5.9 at 5; §5.11 (lines 2496–2506) cites no §5.12 | No circularity |
| §6.1 Paso 6 row: “by §5.11 no such system exists” | same hypotheses as the row | row's hypotheses equal those of §5.12; conclusion vacuous-true on both branches, impossible at weight six | Consistent with §5.12 and §5.11 |
| §6.1 `p+1` row: “S4 at `p = 5`” | *Needs* line of the S4 terminal target at the open head of SerreModularityByCompatibleSystems | lists §§5.12, 5.6, 5.3, 5.4, 5.9, 5.7, Layer 4, Layer 2; `5 ∈ {5,7,13}` | Agrees |
| Opening and *Downstream consumers*: S3 and S4 | *Needs* lines in Layers S3 and S4 of SerreModularityByCompatibleSystems | S3 target: §5.6 only; S4 target: the eight items above | Agree with the README's list exactly |
| *Downstream consumers*: Part II | SmallRamificationAndAbelianVarietyBaseCasesPartII on main, supplier contract (line 89) and line 444 | “Consume §§1.1, 1.7 and 1.9”; row (b) of §1.9 | Agrees |
| *Downstream consumers*: AutomorphicGaloisRepresentationsPartII, ClassicalSerreModularity | main (lines 92, 434, 473 and eleven more); open head of ClassicalSerreModularity, supplier table and three *Needs* lines | §5.0d only; “§§5.0b–5.0e and 5.1–5.4”, with §5.0e, §5.0d and §§5.0b, 5.0d, 5.1–5.4 in the *Needs* lines | Agree |
| Description: line and section counts | diff against the merge base | 33 insertions, 20 deletions; 2751 lines before, 2764 after; 0 headings, 0 Lean declarations changed; `README.md` only | Agrees |

Rows for the untouched statements stand as in the previous review, of `31d7cdb`.

- Source locators checked against the text: none new; the changed passages add no locator and change none (the Dieulefait–Pacetti Paso 6 locators of §5.12, p. 14 and p. 15, are untouched and were read in the previous review).
- Library declarations opened at the pins: none new; `IsLevelOneResidual` and `not_isLevelOneResidual_of_mem_two_three_five_seven` reread in `Suggested.lean` (lines 139 and 153) against the new sentence of §5.12.
- Cross-roadmap citations resolved: 11, at the open heads of SerreModularityByCompatibleSystems (Layers S2, S3, S4 exist; the S3 and S4 *Needs* lines) and ClassicalSerreModularity (R26.1 and R27.1 exist; R26.5 and R33.4 do not; its scope section maps former R33.2 to S2), and on main for the two Part II roadmaps.
- Automatic checks: all passed at this head. No change outside the folder; the folder holds `README.md`, `Suggested.lean` and `metadata.toml`. Dependency check output: `depcheck: 200 roadmaps, 2199 edges, 0 problem(s)`, no UPWARD or CYCLE line; the roadmaps not on main are named only as later users or as owners of other branches.
- Elaboration: `lake env lean` on `Suggested.lean` gives 13 `declaration uses sorry` warnings (lines 61, 72, 98, 143, 148, 153, 188, 209, 233, 236, 239, 242, 245) and nothing else; the file is unchanged since the previous review, so the signature comparison and the one-tactic probe stand as recorded there.
- Pull request text: title and every sentence of the description checked against the head and the diff; none contradicted, no change left unstated (it says the roadmap is a revision of main, that only `README.md` changes, and that no heading, section number, statement or Lean declaration changes).
- Headline theorems: unchanged; the 13 theorems of `Suggested.lean` stand as in the previous review.

Overlap check: read SerreModularityByCompatibleSystems and ClassicalSerreModularity (open) and SmallRamificationAndAbelianVarietyBaseCasesPartII and AutomorphicGaloisRepresentationsPartII (main); PotentialModularityAndCompatibleSystems, GL2ModularityLifting, EllipticCurveModularityPartIIGL2TypeAbelianVarieties, FiniteFlatGroupsAndIntegralPadicHodgeTheory, AlgebraicModularFormsAndSerreWeights and SerreWeightAndLevelOptimisation were not reopened this round (the change touches no object they share). The base cases, Snowden's realisation, the raw compatible-system data of §5.0d and the `GL₂`-type data of §5.1 are owned here and cited by the others; the terminal step at five is owned here (§5.12) and cited by SerreModularityByCompatibleSystems S4. No open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only; 4 passages (the opening sentence, the §5.12 remark, the Paso 6 row, *Downstream consumers*) compared with 1 source (dieulefait-pacetti, Paso 6, p. 14), none shared: the remark that the hypotheses are empty is the roadmap's own and is not in the source; largest share schoof, about 34 of 172 locators, as in the previous review; no layer added, removed or reordered, so the arrangement was not compared again: independent.

Research link: Layers 2–5 prove the base cases of Tate (1994), Serre, Fontaine (1985) and Schoof (2005) and Snowden's realisation (2009), on which Khare–Wintenberger (2009) and Dieulefait–Pacetti (2023) rest their proofs of Serre's modularity conjecture; README §§2.5, 5.12, 6.1 and dieulefait-pacetti §1.1 and Paso 6.

## Not verifiable

- None in the changed passages. Outside them, as in the previous review: Khare–Wintenberger's version of record (Theorem 5.4, p. 247) was not reopened.

## Source issues

- none

## For the human reviewers

- Licence: schoof was read (previous review) from the author's page, a copy carrying the publisher's download stamp, and Fontaine's paper from the author-hosted publisher scan the README links. Whether these two hosts are legal author copies is for a human to confirm.
