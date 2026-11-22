# Review of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (pull request #2923 at dc0d3ed)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties/`
**Verdict:** accepted

**Summary.** Accepted, on an incremental re-review of the 10 lines changed since `045bf11`: the two small corrections and the format note of the previous review are repaired, and the new citation in 8.19 (c) of RowTowerAndRallisIdentities §5.10a resolves at that roadmap's open head and says what (c) attributes to it. No finding. One small correction (the new supplier section is cited in 8.19 but missing from the supplier contract and from the Dependencies paragraph), not blocking. The human reviewers keep the scope question and the two licence questions.

## C01 — 8.19 now consumes RowTowerAndRallisIdentities §5.10a, but the supplier contract and the Dependencies paragraph still list §§5.1, 5.3, 5.7, 5.9, 5.11, 5.12 only

A reader who takes the contract as the complete list of what this roadmap assumes of RowTowerAndRallisIdentities does not learn that 8.19 (c) rests on the rational structure `𝒞(W_j)_𝕃` and its identification at the extremal vector. The change adds "the identification of RowTowerAndRallisIdentities §5.10a" to 8.19 (c) (lines 1724–1725) and §5.10a to the *Needs:* line of 8.19 (line 1807); the subsection "From RowTowerAndRallisIdentities" (line 2699) and the sentence "RowTowerAndRallisIdentities §§5.1, 5.3, 5.7, 5.9, 5.11, 5.12" of the Dependencies (line 2495) were not changed with them. Adding "§5.10a (the rational structure of the model forms: the identification at the extremal vector)" to the contract, and "5.10a" to the list of the Dependencies, would make the three places agree.

## Previous findings

The previous review, of `045bf11`, had no finding (no R-numbered remark); its small corrections and format note, against this head:

- C01 — repaired: the description now reads "Six of the family's suppliers are added only by #2954: SlopesOfHermitianVectorBundles, FiniteReductiveGroups, SingularHermitianMetricsAndL2Methods, ChowFormsAndHeightsOfSubvarieties, MultiplierIdealsOfPairsAndPointSeparation and TaylorBoundsAndDepthsOnHeightTwoFormalGroups."
- C02 — repaired: "(`GlobalTheory.T.exists_thetaGenerator_reading_ne_zero_all_frames`, which takes one named statement as a hypothesis)" (line 2208).
- N01 — repaired: the family index no longer says that each roadmap's reference names the commit; it says the files "are to be looked up at that first commit, under its directory `src/`", which the entry [FormalProof] (line 2776) agrees with.

## Verified sound

| Statement | Instances tried | README side (computed) | Other side (computed) | Result | Change |
|---|---|---|---|---|---|
| 8.19 (c), the identification | supplier §5.10a at its open head; extremal vector rescaled by `b`, `|b| = 1`; `j < m` and `j = m` | identification "of §5.10a, with the extremal vector of the normalisation of §5.11"; target `𝕃`-rational forms of §5.11 | §5.10a: evaluation at the extremal vector identifies `𝒞(W_j)`; rescaling by `b` multiplies `𝒞(W_j)_𝕃` by `b⁻¹`; vector fixed by §5.11 (`κ_rat = 1`); `j = m`: algebraic forms | agree; the parenthesis removes the `b⁻¹` ambiguity | none |
| 8.19, *Needs:* | each section named by the changed line | §§5.1, 5.3, 5.7, 5.9, 5.10a, 5.11 of RowTowerAndRallisIdentities | all six headings exist at that head (5.10a "The rational structure of the model forms"); supplier is earlier in the merge order | resolves; contract and Dependencies lack 5.10a | C01 |
| 8.19a″ (b), credit | hypothesis count of the credited theorem | "takes one named statement as a hypothesis" | the theorem has the form `…ChartIndepSt2 → ∀ …, D.R.r ≤ w.n → 3 * DF w + 2 ≤ M → …`: 1 named statement (as read for the previous review; not opened again) | agree | none |

The rows for the statements the change does not touch stand as in the previous review, of `045bf11`.

- Source locators checked against the text: none new; the changed credit repeats the count the previous review read in [FormalProof]. No target of the seeded sample falls in a changed passage.
- Library declarations opened at the pin: none (the change names none; `Suggested.lean` is unchanged).
- Cross-roadmap citations resolved: 2 (RowTowerAndRallisIdentities §5.10a and §5.11, read in full at the head of its open pull request); 5.10a's own statement that its extremal vector "is that of the normalisation of 5.11" matches the parenthesis added here.
- Automatic checks: all passed. Dependency check: `depcheck: 133 roadmaps, 1498 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives the `sorry` warning only (line 68); the file is unchanged since `045bf11`, so the signatures and the one-tactic probes stand.
- Outside the folder: the family index only (six lines reworded in the paragraph on the formal proof's repository; no supplier, order or statement changed); nothing outside the folder and the family index against the base.
- The description was read against the head: it names RowTowerAndRallisIdentities among the suppliers that merge first, and the change adds no supplier, section or headline; no sentence is contradicted.
- Overlap check: read GluedTargetAndDivisionInequality, RowTowerAndRallisIdentities, HeightsRationalPointsAndObstructionsPartII, ArakelovGeometryAndAbelianHeights, ShimuraCompactifications, ArakelovGeometryAndAbelianHeightsPartII (scopes as read in the previous reviews; RowTowerAndRallisIdentities §§5.10a, 5.11 again); the rational structure `𝒞(W_j)_𝕃` is owned by RowTowerAndRallisIdentities §5.10a and cited here; nothing else shared.
- Source independence: changed passages only; 2 passages compared with 1 source (RowTowerAndRallisIdentities §5.10a is a roadmap, not a source; the credit against [FormalProof], Lean code and no prose), none shared; largest share [FormalProof], 132 of 140 locators; the diff adds, removes and reorders no layer, so the arrangement was not compared again.
- Research link: 8.5 is the Chowla–Selberg formula (Chowla–Selberg 1967); 8.19b–8.19d are CM-value results after Damerell (1970), Shimura and Hecke; 8.19a′ (d) extends Mumford's basis by translates (1966); 8.15–8.17 are arithmetic proportionality for flag bundles; all serve Alpöge's formal proof (2026). Rests on the README References and the four texts read.

## Not verifiable

- [Announcement] (README References): not read.
- The statement of `GlobalTheory.T.exists_thetaGenerator_reading_ne_zero_all_frames` was not opened again in this round; the count of one named hypothesis is the previous review's reading of its file.
- Whether the formal proof discharges that hypothesis (`ChartIndepSt2`) and the six hypotheses of `abelian_cm_comp_laws_bound`: not traced to hypothesis-free theorems.

## Source issues

- none

## For the human reviewers

- Scope: most targets are marked *NEW* and specify the mathematics of a formal Lean proof announced on 2026-11-20 by one author (README References, [FormalProof], [Announcement]); no refereed source states them. Chowla–Selberg 1967, Damerell 1970 and Mumford 1966 are published.
- Licence: the family index says the formal proof "was published without a license" and is mirrored for verification only; the README names 132 of its files and declarations and restates their statements in its own words.
- Licence: `chowlaSelberg_classMean` in `Suggested.lean` has the hypotheses and the conclusion of `GlobalTheory.chowla_selberg_eta` in leanprover-community/riemann-hypothesis (`src/Development/AbelianVarietyTheory/Proofs/HomogeneousIdeals/DedekindZetaEqSumRealEisenstein.lean`); names differ.
- Not tested: [Announcement] was not read; wording was not compared with it.
