# Review of RelativeFarguesFontainePartII (pull request #1825 at 3a7b7c1)

**Verdict:** needs changes

Incremental re-review of the 12 changed lines since a4f22ee (all in `TauCetiRoadmap/RelativeFarguesFontainePartII/README.md`, §§1.8–1.10), and a first reading of the pull request's title and description against this head. One P3 finding, in the changed passage. The title and description give no finding.

## R01 (P3) — §1.9 and §1.10 are no longer subsections, and "§1.8" now names two things

**Location:** `TauCetiRoadmap/RelativeFarguesFontainePartII/README.md` lines 470–472, 487, 504: "### 1.8 Classical annulus coordinates on period annuli … the q-power annulus tower over the monomial model (§1.8), on which the cyclotomic coordinates (§1.9) and the equal-characteristic exchange of variables (§1.10) build".

**Claim:** Targets 1.9 and 1.10 are now bold run-in paragraphs inside §1.8, not `### k.n` subsections, so the Layer 1 headings run 1.7, 1.8, 1.11. "§1.8" denotes both the whole section and its first target, which makes the two `*Needs:* … §1.8` lines self-referential.

**Witness:** Line 502 (`*Needs:* §0.10; §1.8; …`, target 1.9) and line 515 (`*Needs:* §1.8; …`, target 1.10) both sit under the heading `### 1.8` of line 470. `grep '^### 1\.'` gives 1.1–1.8, then 1.11–1.15. Lines 11 and 2274 cite §1.10 and §1.9 as sections.

**Repair:** Restore the three headings, each naming its own target: `### 1.8 Perfected annulus towers and norm powers`, `### 1.9 Cyclotomic coordinates on period annuli`, `### 1.10 Equal-characteristic exchange of variables`. Delete line 472 and, if the grouping is wanted, add to the Layer 1 introduction (line 344): "Sections 1.8–1.10 compare annular period rings with ordinary annuli in three coordinates: the q-power annulus tower over the monomial model (§1.8), and on it the cyclotomic coordinates (§1.9) and the equal-characteristic exchange of variables (§1.10); in each the numerical norms differ by the r-th power." With this every `§1.8` in a Needs line again names the tower comparison only.

## Previous findings

- none to account for: the previous report (of a4f22ee) was an acceptance with no finding; its R01 bullet recorded the repair of the ST02 page locators in §8.4 (line 1780), which this head leaves unchanged.

## Verified sound

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| Line 472, "in each the numerical norms differ by the r-th power", on the tower comparison (first target of §1.8) | q=2, r=2, on X and on π | ordinary radius 2^(−1/2); ‖X‖² = 1/2 = \|T\|_ρ; ‖π‖² = (1/2)² = 1/4 = ρ = \|π\|_ρ | true; the literal isometry fails on π (1/2 ≠ 1/4) | none |
| Same sentence on target 1.9 (E=ℚ_p) | threshold transport s=q^(−1/r); p=2 | s > q^(−q/(q−1)) ⇔ r > (q−1)/q ⇔ ρ < q^(−(q−1)/q); p=2: 1/4 and 2^(−1/2); ‖f‖_s = \|i(f)\|_ρ^(1/r) | true, strict range as stated | none |
| Same sentence on target 1.10 | u²v³ at general r and r=2 | valuations 2r+3 and 2+3/r; r·(2+3/r) = 2r+3; at r=2: 7 and 3.5 | true | none |
| Line 472, "on which … (§1.9) and … (§1.10) build" | the two Needs lines | line 502 lists §1.8; line 515 lists §1.8 | true as a dependency; the id is ambiguous (R01) | R01 |
| Line 472, "Worked example 2 cites §1.9 for the ramified coefficient case" | line 2274 | "The ramified coefficient case is the coordinate theorem in §1.9." | true | none |

The rows of every other statement stand as in the previous review, of a4f22ee: the diff changes no mathematical statement and no Lean declaration.

- Source locators of the changed passages read at the text (FF17, PDF page = printed page + 10): §1.7.2 at FF17 line 3335 and Lemma 1.7.2 at line 3387, printed p. 81, continuing to p. 82 (README: pp. 80–82); Proposition 1.7.3 at line 3442, p. 82, proof p. 83 (pp. 82–83); Example 1.6.5 at line 2905, p. 70; Proposition 1.7.4 at line 3469, p. 83, Remark 1.7.5 at lines 3488–3496, pp. 83–84. All agree. No target of the seeded sample falls in the changed passages.
- Gate re-run on 3a7b7c1: every check 0, `OK` (the worker's run on the same head also records `build=0`). Dependency check: `depcheck: 242 roadmaps, 2246 edges, 0 problem(s)`; no UPWARD or CYCLE line; the roadmap is at merge-order line 362, after its last supplier LubinTateFormalModulesAndQuasiCanonicalLifts (line 360).
- Elaboration: `lake env lean` on `Suggested.lean` gives three `sorry` warnings (lines 65, 87, 102) and nothing else; the file is byte-identical to the one read at a4f22ee, and the worker's elaborated signatures show no lost binder.
- Cross-roadmap citations: the diff adds none. §1.8, §1.9 and §1.10 of this roadmap still resolve at this head (resolver probe; a control citation of §1.77 is reported missing). No roadmap on main or at an open head cites a section of this roadmap (`roadmaps grep`: one mention, as a consumer, in LubinTateFormalModulesAndQuasiCanonicalLifts line 2594), so the renamed §1.8 heading breaks no citation.
- Files changed outside the folder: none (`git diff --stat origin/main...HEAD` outside it is empty).
- Title and description against this head, 14 claims checked, none contradicted: the pull request adds the roadmap (three files, 2402 insertions); three theorems and one proved instance in `Suggested.lean`; seventeen not-statable headlines in the module docstring (counted: 17); θ specialising to `WittVector.fontaineTheta` (README line 699; Mathlib `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean` line 165); the p=2 root argument replaced by the untilt equivalence (line 753); `Cl(Be_F) ≅ Hom_cont(G_F,E×)` (line 1645); the Layer 11 examples (§§11.1–11.5); the consumers named (line 2267); carriers from VectorBundlesAndIsocrystals and RelativeFarguesFontaine (lines 53–63). The description names no section title, so the change since a4f22ee leaves nothing in it unstated.
- Overlap check: read RelativeFarguesFontaine, VectorBundlesAndIsocrystals, PadicHodgeTheory, PadicDifferentialEquationsAndRigidCohomology, FarguesFontaineDiamonds, PerfectoidSpaces, NewtonPolygons (scope as cited in lines 7–15); nothing shared by the changed passages; the worker's overlap list has no shared roadmap, dropped id or second copy.
- Source independence: changed passages only; 2 passages (the new §1.8 heading and line 472) compared with 1 source (FF17 lines 3335–3336, 3434–3435, 3463, the titles of §§1.7.2–1.7.4), none shared; the locator share and the arrangement were not recomputed, the diff adding, removing or reordering no layer.
- Remark (untouched text, no change asked): the six supplier contracts at lines 59–97 are labelled by a descriptive phrase ("the degree-two obstruction contract") and not by their `gap:` slug.

## Not verifiable

- none. FF17 is in the cache and was read at the lines above.

## Source issues

- none new in this round.

## For the human reviewers

- none
