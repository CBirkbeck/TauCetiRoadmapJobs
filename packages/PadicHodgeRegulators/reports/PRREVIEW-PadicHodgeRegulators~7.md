# Review of PadicHodgeRegulators (pull request #1498 at 0c9e8c6)

**Verdict:** needs changes

## R01 (P3) — The dependency paragraph names two of the open suppliers and calls the rest consumers

**Location:** Pull request #1498 description, dependency paragraph: “By section, the README uses: PadicDifferentialEquationsAndRigidCohomology, §RD.4.40; Polylogarithms, §§2.1,2.3. Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite.”
**Claim:** The head contradicts both sentences: the README consumes 22 further roadmaps that are still open pull requests, each by section or layer, and they are suppliers, not consumers.
**Witness:** `TauCetiRoadmap/PadicHodgeRegulators/README.md:7` “SchemeKTheoryOperations §7.3a constructs Chern classes…”; line 59 “From KTheoryFiniteLocalFields §§1.8,6.6–6.7 consume…”; line 83 “From ColemanIntegration §L3.Fa.1 consume…”. None of the three is on main (#1229, #1281, #1043).
**Repair:** Replace the two sentences with: “The README cites every open supplier of the task list below by name and section or layer, among them SchemeKTheoryOperations §7.3a and KTheoryFiniteLocalFields §1.8 (Chern classes and their étale instances), PadicDifferentialEquationsAndRigidCohomology §RD.4.40 and Polylogarithms §§2.1,2.3. PolylogarithmFunctions, PadicMeasuresIwasawaAlgebras, ProfiniteArithmetic, LocalGaloisGroups and EffectiveBounds are on main. HabiroNahmSeries, HabiroNumberFields and GrossZagierAndArithmeticHeights are consumers, not prerequisites.”

## Previous findings

- R01 — partly repaired: the description now states “Section 4.1 consumes the rigid Gysin isomorphism of PadicDifferentialEquationsAndRigidCohomology §RD.4.40” and lists both suppliers, but the rewritten paragraph drops all others (R01 of this report).
- R02 — repaired: “Polylogarithms supplies the calibrated Suslin–Bloch–Wigner evaluation used here to compare de Jeu’s classes with Suslin’s classes.”

## Verified sound

| Statement | Instances tried | Values computed on the two sides | Result / change |
|---|---|---|---|
| Summary block: tame root class [ζ] ↦ Li₂(ζ) ∈ p²𝒪_L (README §§5.4, 5.8, line 1131) | p=5, ζ=ω(2)≡57 mod 125, ζ⁵=ζ | li_(2,5)(2)/(2−1)⁵ = 2+1+2+1 ≡ 1 mod 5, so Li₂(ζ) ≡ 25 mod 125; README line 920 says 25 | Agrees; valuation exactly 2 |
| `residueDilogValue_spans` (the summary's “finite-residue dilogarithm argument”, p > 3) | p=5, s=1, x=2,3; control p=3, s=1 | x=2: 1; x=3: 3/2 ≡ 4; difference 3 ≠ 0 spans 𝔽₅. p=3: only x=2, difference set {0}, span ≠ ⊤ | Holds at p=5; `3 < p` excludes the failing p=3 |
| Summary block: “p > 3 retains the obstruction from 3-torsion at ℚ₃” | L=ℚ₃ (README line 399) | Completed group ℤ₃⊕ℤ/3 against torsion-free 9ℤ₃: no isomorphism | Description agrees with head |

Rows for untouched statements stand as in the previous review, of a63b5f6.

- Folder: 0 lines changed since a63b5f6 (`git diff --stat a63b5f6 HEAD` on the folder is empty); the branch merged main. Outside-folder diff against the merge base: 0 paths, as the description says.
- Description checked sentence by sentence against the head: title, summary block, prose, validation line. Validation line confirmed: targeted build succeeds with three `sorry` warnings and the Mathlib module-system advisory; 0 `set_option`; 0 sorry'd data.
- 5 cross-roadmap citations of the description resolved at the open heads: SchemeKTheoryOperations §7.3a, KTheoryFiniteLocalFields §1.8, PadicDifferentialEquationsAndRigidCohomology §RD.4.40, Polylogarithms §§2.1 and 2.3. The two citation leads are no defects: FontaineBPR1994 is a source id, and `KTheoryQ.dvr_localization_iso` is ColemanIntegration §L3.Fa.1's name at its open head.
- Gate at 0c9e8c6: every check passed. Elaboration of `TauCetiRoadmap/PadicHodgeRegulators/Suggested.lean` exits 0 with `sorry` at lines 43, 81, 102 as the only warnings. Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Headlines, padding probes, signatures and the seeded source sample stand as in the earlier reviews: no statement or locator changed.

Overlap check: read CohomologyComparisonsPartII, ColemanIntegration, PhiGammaModulesAndIwasawaCohomology, KatoEulerSystems, PadicHodgeTheory (no list names a roadmap on main); nothing shared. No conflicting head, dropped id or second copy is listed.

Source independence: changed passages only; the folder has no changed passage, so 0 passages compared with 0 sources; largest share LLZ2011, 43 of 297 keyed mentions, as counted in the previous review; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- Nothing in this round. The earlier extraction limits for Nakamura2014 Theorem 3.10(2) and RJ2018 Théorème I.10 are outside this change.

## Source issues

- none

## For the human reviewers

- none
