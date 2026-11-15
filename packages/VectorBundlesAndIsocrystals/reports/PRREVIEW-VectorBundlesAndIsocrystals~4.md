# Review of VectorBundlesAndIsocrystals (pull request #1205 at 6f2c340)

**Verdict:** needs changes

Incremental re-review of 10 changed lines since c7a0b33 (five reworded proof-plan paragraphs in `TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md`), plus the first check of the pull request's title and description against this head. The folder's files have no finding; both findings concern the description.

## R01 (P3) — The description's dependency paragraph names one supplier section and an id the README does not have

**Location:** pull request description, paragraph "Dependencies": "By section, the README uses: CrystallineCohomology CR.4.7: … consumed in VB0. Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite."

**Claim:** The head contradicts it: the README has no id `VB0`, and it consumes ten further open roadmaps by section as prerequisites.

**Witness:** `README.md` "Scope and ownership" and "Exact supplier contracts": PrismaticCohomologyPartIII §7.0 (37 mentions), PadicHodgeTheory §7.5, PadicDifferentialEquationsAndRigidCohomology §§RD.1.27, RD.1.32; `grep VB0 README.md` returns nothing.

**Repair:** Replace the two sentences with: "By section, the README consumes these open roadmaps: CrystallineCohomology §CR.4.7 and PadicDifferentialEquationsAndRigidCohomology §§RD.1.27, RD.1.32 (Layer 1's mixed-characteristic blocks and classification) and §§RD.2.3–RD.2.4 (polygon inequality and common filtration, Layer 6); PrismaticCohomologyPartIII §7.0 and AInfCohomology §AI.2.3 (absolute curve, GAGA and Robba comparison); PadicHodgeTheory §§0.2, 3.5, 7.5, 7.6; PadicPeriodRings §1.5; PhiGammaModulesAndIwasawaCohomology §§0.4, 1.0b; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.2.25–R07.2.28; DiamondEtaleCohomology C4; DiamondSixOperations S4–S5; FarguesFontaineDiamonds F4. Roadmaps on main are cited by name and section. VectorBundlesAndIsocrystalsPartII is a consumer, not a prerequisite."

## R02 (P3) — The summary says Layer 1 proves Dieudonné–Manin in every rank; the README imports the mixed-characteristic case

**Location:** pull request description, summary block: "Layer 1 proves Dieudonné–Manin in every rank, including `dieudonneManinEqualChar` in equal characteristic".

**Claim:** Layer 1 proves only the equal-characteristic classification; the mixed-characteristic classification is a supplier's, transported by a comparison.

**Witness:** `README.md` "Scope and ownership": CrystallineCohomology §CR.4.7 and PadicDifferentialEquationsAndRigidCohomology §§RD.1.27, RD.1.32 supply the blocks and classification; "Layer 1 transports these through the finite-isocrystal comparisons and proves the equal-characteristic extension."

**Repair:** Replace the sentence's first clause with: "Layer 1 transports the mixed-characteristic Dieudonné–Manin classification of CrystallineCohomology §CR.4.7 and PadicDifferentialEquationsAndRigidCohomology §§RD.1.27, RD.1.32 to finite isocrystals over Ĕ, proves the equal-characteristic classification in every rank (`dieudonneManinEqualChar`),".

## Previous findings

- none: the review of c7a0b33 was an acceptance with no finding; its two earlier repairs (its R01, R02) are in text this change does not touch.

## Verified sound

The diff changes no statement; the rows are the statements whose proof plans it rewords.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Projectivized properness, proof plan (FS II.2.16; README 1172) | `E=O(1)` over `Spa C`; `E=O` | `E∨=O(−1)`: presentation `0→O(1)→O(1)→0`, `n=1>0`, `m′=0`; quotient `Div¹`. `E=O`: `(E̲∖{0})/E^×` a point | plan agrees with FS lines 2763–2771 | none |
| Two-term BC geometry, hypotheses paragraph (FS II.3.5; README 1206) | `[O(−1)→0]`; control `E₁=O` | `H⁰(O(−1))=0`, `BC=(A¹_{S♯})^◇/E`, dimension `1=−deg`. Control: `H⁰(O)=E̲≠0`, negativity needed | agrees with FS lines 3080–3088 | none |
| One-sign absolute BC spaces, proof plan (FS II.3.7; README 1230) | `D=(Ĕ,π⁻¹σ)`; simple rank 2, slope `∓1/2`; mixed `D₁⊕D₂` | `N=1`, `U=π⁻¹`; rank 2: `N=2`, `U=π^{∓1}·1`, diagonal. Mixed sign: neither `BC(D)` nor `BC(D[1])` punctured covers it, excluded | agrees with FS lines 3178–3193 | none |
| Artinian property of BC (CN Remark 3.15; README 1527) | `V₁ ⊇ ℚ_p·t ⊇ 0`; control `p^nℤ_p·t` | dims `1,0,0`, so `N=1`; `W₁/W₂=ℚ_p`, height `1 ≤ ht(W₁^{−∞})=1`; constant from `n=2`. Control: lattices never stabilize, not `ℚ_p`-subspaces | agrees with CN lines 764–772 | none |
| Cokernel of a generating image (CN Prop. 3.23; README 1611) | `ℚ_p→C` (`O→ι_∞C`); `θ: V₁→C` | kernel `O(−1)`, `H⁰=0`; cokernel `H¹(O(−1))=C/ℚ_p`, Dimension `(1,0)−(0,1)=(1,−1)`, height `−1<0`. `θ` surjective: cokernel 0, nothing claimed | agrees with CN lines 888–900 | none |

Rows for the untouched statements, `dieudonneManinEqualChar` included, stand as in the previous review, of c7a0b33.

- Source locators checked against the text: 5 (FS Propositions II.2.16 p. 72, II.3.5 pp. 79–80, II.3.7 pp. 82–83; CN Remark 3.15 p. 16, Proposition 3.23 p. 19); each reworded paragraph keeps the hypotheses and steps of the paragraph it replaces.
- Remark (untouched content, no change asked): the last sentence of README 1230, on surjectivity of the sum map through Proposition II.2.9, is a step of the proof of FS Proposition II.3.6 (FS lines 3157–3160), whose target the paragraph's `*Needs:*` already names.
- Cross-roadmap citations in the changed paragraphs: 1, DiamondEtaleCohomology C4 (unchanged by the rewording; resolved in the previous review). The worker's citation scan lists no cross-roadmap citation found nowhere; its five Lean-name leads are the supplier names of PrismaticCohomologyPartIII §7.0 and `Rigid.diamond_hom_bijective`, in untouched text.
- Gate, rerun on this head: every scanner 0, `OK`; worker's targeted build passed. Dependency check: `depcheck: 247 roadmaps, 2248 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean` (unchanged since c7a0b33): one warning, `declaration uses sorry` at line 79; the four elaborated signatures are those of the previous review. No statement changed, so the one-tactic probe was not rerun.
- Outside the folder: no file changed against the base. Title and the remaining description sentences (folder contents, validation line, summary block apart from R02) agree with the head: the pull request adds the roadmap, 3 files, 4 Lean declarations.
- Overlap check: the worker's overlap scan at this head lists no pull request changing this roadmap, no cited id dropped and none defined only by a revision; the scopes of VectorBundlesAndIsocrystalsPartII, RelativeFarguesFontaine and FarguesFontaineDiamonds were not read again, since the diff adds no object or citation: nothing shared beyond what the review of c7a0b33 recorded.
- Source independence: changed passages only; 5 passages compared with 2 sources (FS, CN), none shared: the longest common run is 6 words, forced notation (`BC(D)` resp. `BC(D[1])`; "and from there to"). Largest share FS, 43 of about 150 locators; no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- The fifteen seeded sample labels are all the same word ("API") and identify no target; none can be matched to the changed passages.
- ECD Proposition 11.24 and Rapoport–Zink Definition 1.8, cited inside the reworded paragraphs, were not opened: the rewording changes neither citation.

## Source issues

- none

## For the human reviewers

- none
