# Review of ArithmeticKTheory (pull request #1418 at d682d86)

**Verdict:** needs changes

## R01 (P3) — The description names a removed direct supplier

**Location:** PR description, dependency paragraph (`scratch/pull-request.md:26`): “Direct prerequisites are the supplier stages in the README's Exact supplier contracts, including HomotopySpheres Stage 9, item 2 (#284 or #1287).”
**Claim:** This names a direct dependency absent from the head and conceals the replacement ownership of the fourth-stem input.
**Witness:** `TauCetiRoadmap/ArithmeticKTheory/README.md:71` assigns the odd-primary fourth stem to §7.5; line 547 imports BP and Adams–Novikov machinery from BordismFormalGroups F3–F4. The README contains zero HomotopySpheres citations.
**Repair:** Replace the quoted sentence with: “Direct prerequisites are the README's Exact supplier contracts. Section 7.5 proves the odd-primary fourth-stem vanishing using BordismFormalGroups F3–F4; HomotopySpheres Stage 9 is not a direct prerequisite.” Remove the obsolete “with T1.5–T1.6 also → HomotopySpheres” tail from this dependency description.

## R02 (P3) — State the finite-S restriction in the summary

**Location:** PR description, `roadmap-summary` block (`scratch/pull-request.md:15`): “give finite generation of every K_n(O_(F,S)) and its rank”.
**Claim:** The description omits the finite-S hypothesis of this conclusion, although denominator localization also treats arbitrary S.
**Witness:** `TauCetiRoadmap/ArithmeticKTheory/README.md:110` requires finite S by default. For F=ℚ and S all finite primes, O_(F,S)=ℚ and K₁(ℚ)=ℚ×≅ℤ/2⊕⊕_pℤ, which is not finitely generated.
**Repair:** Write: “For finite S, localization, Quillen's rank filtration and Borel's invariant-form comparison give finite generation of every K_n(O_(F,S)), n≥0, and its rank. Denominator localization also treats arbitrary S under the stated class-group hypothesis.”

## R03 (P3) — Distinguish finite generation from finite groups

**Location:** PR description, `roadmap-summary` block (`scratch/pull-request.md:17`): “Hermitian computations draw on the finiteness of the L-groups and Grothendieck–Witt groups.” The prose at line 22 similarly says “integral finiteness”.
**Claim:** The head promises finite generation, not finite cardinality; real places can contribute positive rank.
**Witness:** `TauCetiRoadmap/ArithmeticKTheory/README.md:1574` gives L⁽ˢ⁾₀(ℤ)=ℤ. Lines 1611–1636 assert finite generation. The source agrees: hermitian line 2217, Corollary 2.3.16, pp. 47–48.
**Repair:** Replace the quoted sentence with: “Hermitian computations draw on finite generation of the L-groups and Grothendieck–Witt groups.” At line 22 replace “derives integral finiteness” with “proves integral finite generation”. For ℤ this permits the required infinite cyclic L⁽ˢ⁾₀.

## Previous findings

- R01 — repaired: the finding recorded as repaired in the previous report remains repaired; `TauCetiRoadmap/ArithmeticKTheory/README.md:977` names GeneralAlgebraicKTheory §13.8c for finite-field even vanishing, matching its supplier contract and the supplier's head. The previous report raised no unresolved findings.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Description's direct-supplier assertion | HomotopySpheres Stage 9 | Description: one direct-supplier assertion; README: zero citations, zero contracts. Replacement: BordismFormalGroups F3–F4. | Mismatch | R01 |
| Finite generation of K₁(O_(ℚ,S)) | S=∅; S={2}; S=all primes | Groups: ℤ/2; ℤ/2⊕ℤ; ℤ/2⊕⊕_pℤ. Free ranks: 0; 1; infinite. Finite generation: yes; yes; no. | Finite-S restriction necessary | R02 |
| Hermitian group finiteness | R=ℤ, ε=+1, degrees 0–3 | Symmetric L-groups: ℤ, ℤ/2, 0, 0. Cardinalities: infinite, 2, 1, 1. All four are finitely generated. | Cardinal finiteness fails | R03 |
| Summary's golden-field order test, §8.9 | g={−1,−1}, h={−1,ε} | Sign images: (−1,−1), (1,−1); span order 4. Presentation upper bound 4; sign lower bound 4; 4/120=1/30. | Agrees | None |

The other adversarial rows stand as in the previous review of d682d86.

- Scope: AI incremental re-review of 0 changed folder lines; 0 seeded-sample targets touched; title and description compared with all 3 added files, 5330 insertions, 0 removed headings/declarations and 0 outside-folder changes.
- Sources: 1 additional locator checked, hermitian Corollary 2.3.16, pp. 47–48, lines 2217–2226; 0 new source requests.
- Citations: GeneralAlgebraicKTheory §13.8c and BordismFormalGroups F3–F4 resolved; 7 closest-roadmap scopes read; supplied overlap data lists 0 competing heads or dropped ids.
- Gate rerun: all 28 reported checks zero, `OK`; worker gate also records `build=0`.
- Dependency-check output: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Targeted build and direct `lake env lean` elaboration: exit 0; only 4 `sorry` warnings.
- Scratch `#check @name` probe: all 6 actual declarations elaborate; README hypotheses retained, 0 lost binders. The supplied signatures report's seventh entry, `-number`, is a docstring parsing artifact.

Overlap check: read KTheoryFiniteLocalFields (local groups and motivic foundations), CyclotomicClassGroupsAndStickelberger (class modules and regularity), K2SymbolsBrauerPartII (Tate-symbol comparisons), K3BlochGroups (Bloch and indecomposable comparisons), EllipticKTheory (curve K-theory), StableHomotopyKTheory (generic homotopy and coefficients), ClassicalArithmeticCompletion (arithmetic symbols). ArithmeticKTheory retains S-integer comparisons, arithmetic K₃ tables and the Dedekind/Steinberg finiteness inputs consumed by those later roadmaps.

Source independence: changed passages only; 0 roadmap passages changed, 1 PR-summary passage compared with 1 source (hermitian), with no copied expression found. No layer was added, removed or reordered; source-locator shares and the contents comparison were not reopened.

## Not verifiable

- none in this round's reviewed passages; previously waived and uncertified locators remain settled.

## Source issues

- none

## For the human reviewers

- none
