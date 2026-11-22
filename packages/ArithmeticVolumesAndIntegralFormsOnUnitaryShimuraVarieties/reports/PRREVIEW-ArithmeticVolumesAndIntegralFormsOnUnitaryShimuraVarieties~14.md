# Review of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (pull request #2923 at e9a2cf5)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties/`
**Verdict:** accepted

**Summary.** Accepted, on an incremental re-review of the 8 lines changed since `dc0d3ed`: the small correction of the previous review is repaired (RowTowerAndRallisIdentities §5.10a is now in the supplier contract and in the Dependencies paragraph), and the reworded sentence of 8.16 (a) on the cusp weight now has the direction of the formal statement it credits: the potential `−log‖e‖` is increased by `U/2`. No finding, no small correction and no format note. The human reviewers keep the scope question and the two licence questions.

## Previous findings

The previous review, of `dc0d3ed`, had no finding (no R-numbered remark); its one small correction, against this head:

- C01 — repaired: the contract reads "§5.10a (the rational structure of the model forms and its identification at the extremal vector)" (line 2701), and the Dependencies paragraph "RowTowerAndRallisIdentities §§5.1, 5.3, 5.7, 5.9, 5.10a, 5.11, 5.12" (line 2497).

## Verified sound

| Statement | Instances tried | README side (computed) | Other side (computed) | Result | Change |
|---|---|---|---|---|---|
| 8.16 (a), the corrected norm | sign of the correction; modular-curve cusp (`‖dz‖² ~ Im τ`, `U ~ log Im τ`); `U = 0` | norm × `exp(−U/2)`: `−log‖e‖ ↦ −log‖e‖ + U/2`; at the cusp `−½log Im τ + ½log Im τ` bounded; `U = 0`: Hodge norm | [FormalProof] `corrW = phMu + U/2`, `phMu = log` of the cone metric of the line, bounded above and `≥ −C·log logR` near the boundary | agree; the earlier `exp(U/2)` on the metric was the opposite direction | none |
| 8.16 (a), heights of points | a point over a field of degree `d`, `U` constant `= u` at all embeddings | height rises by `(1/d)·Σ_σ u/2 = u/2`, "the mean of `U/2` over the embeddings" | normalised height `= (1/d)(finite part − Σ_σ log‖s‖_σ)`; each `−log‖s‖_σ` rises by `u/2` | agree | none |
| 8.16 (a), thresholds and bound | `B`, bad primes, `ε = p/q` | `B ≥ max(4|Φ|+2, 4|Φ|N²)`, at most `4|Φ|N²` bad primes, height `≥ −C|Φ|j′Λ_E(B) − ε·K_𝒜` | `PosU`: `4f+2 ≤ B`; `HtU`: `4fN² ≤ B`, bound `−(Ch·f·j′·abelian₂) − (p/q)·KA`; `admitted`: `S₀.card ≤ 4fN²` | agree | none |
| 8.16 (c), route "removing the correction `U/2` at the cost of `½·mean(U)`" | consistency with the new sentence of (a) | corrected height = uncorrected + `½·mean(U)` per unit of degree; removing it lowers the bound by `½·mean(U)`, bounded by (b) | (a): potential raised by `U/2`, `U ≥ 0` | agree with the new direction | none |
| Supplier contract, RowTowerAndRallisIdentities §5.10a | heading and subject at that roadmap's open head | "the rational structure of the model forms and its identification at the extremal vector" | heading "5.10a The rational structure of the model forms"; evaluation at the extremal vector identifies `𝒞(W_j)` | resolves; says what the section states | none |

The rows for the statements the change does not touch stand as in the previous review, of `dc0d3ed`.

- Source locators checked against the text: 1 (8.16 of the seeded sample, the only sampled target in a changed passage): `GlobalTheory.CompanionTheory.Ar.Cusp.NineGeoU` in `Development/AutomorphicSpectrum/Statements/GeometryStatements/NineGeoU.lean` exists at the first commit of [FormalProof]; `corrW`, `PosU`, `HtU`, `MeanU`, `admitted` read there, and `phMu`, `MuFrameAt.norm`, `MUc`, `htMUc` in the files that define them.
- Library declarations opened at the pin: none (the change names none; `Suggested.lean` is unchanged).
- Cross-roadmap citations resolved: 1 (RowTowerAndRallisIdentities §5.10a at the head of its open pull request).
- Automatic checks: all passed. Dependency check: `depcheck: 133 roadmaps, 1498 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives the `sorry` warning only (line 68); the file is unchanged since `dc0d3ed`, so the signatures and the one-tactic probes stand.
- Outside the folder: nothing changed since `dc0d3ed`; against the base, only the folder and the family index.
- The description was read against the head: the change adds no supplier (RowTowerAndRallisIdentities is already named as one that merges first), no section and no headline; no sentence is contradicted.
- Overlap check: read GluedTargetAndDivisionInequality, RowTowerAndRallisIdentities, HeightsRationalPointsAndObstructionsPartII, ArakelovGeometryAndAbelianHeights, ShimuraCompactifications, ArakelovGeometryAndAbelianHeightsPartII (scopes as read in the previous reviews; RowTowerAndRallisIdentities §5.10a again); the rational structure `𝒞(W_j)_𝕃` is owned by RowTowerAndRallisIdentities §5.10a and cited here; nothing else shared.
- Source independence: changed passages only; 1 passage compared with 1 source (the sentence of 8.16 (a) against [FormalProof], which is Lean code and no prose), none shared; largest share [FormalProof], 132 of 140 locators; the diff adds, removes and reorders no layer, so the arrangement was not compared again.
- Research link: 8.5 is the Chowla–Selberg formula (Chowla–Selberg 1967); 8.19b–8.19d are CM-value results after Damerell (1970), Shimura and Hecke; 8.19a′ (d) extends Mumford's basis by translates (1966); 8.15–8.17 are arithmetic proportionality for flag bundles; all serve Alpöge's formal proof (2026). Rests on the README References and the four texts read.

## Not verifiable

- [Announcement] (README References): not read.
- The definition of `abelian₂` in [FormalProof] (the quantity 8.16 writes `Λ_E(B)`) was not opened in this round; the sentence that defines `Λ_E(B)` is unchanged.
- Whether the formal proof discharges `ChartIndepSt2` and the six hypotheses of `abelian_cm_comp_laws_bound`: not traced to hypothesis-free theorems.

## Source issues

- none

## For the human reviewers

- Scope: most targets are marked *NEW* and specify the mathematics of a formal Lean proof announced on 2026-11-20 by one author (README References, [FormalProof], [Announcement]); no refereed source states them. Chowla–Selberg 1967, Damerell 1970 and Mumford 1966 are published.
- Licence: the family index says the formal proof "was published without a license" and is mirrored for verification only; the README names 132 of its files and declarations and restates their statements in its own words.
- Licence: `chowlaSelberg_classMean` in `Suggested.lean` has the hypotheses and the conclusion of `GlobalTheory.chowla_selberg_eta` in leanprover-community/riemann-hypothesis (`src/Development/AbelianVarietyTheory/Proofs/HomogeneousIdeals/DedekindZetaEqSumRealEisenstein.lean`); names differ.
- Not tested: [Announcement] was not read; wording was not compared with it.
