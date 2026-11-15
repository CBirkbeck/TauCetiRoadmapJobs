# Review of PadicDifferentialEquationsAndRigidCohomology (pull request #1002 at 457e49f)

**Verdict:** needs changes

## R01 (P3) — The description's dependency paragraph denies suppliers the README names

**Location:** pull request description, paragraph "Dependencies": "Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite."

**Claim:** The paragraph names two section-level suppliers that are not on main (MotivesAndAlgebraicCycles, FormalConnectionsOpers) and calls every other roadmap not on main a consumer. The head has fifteen more suppliers that are not on main.

**Witness:** `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md` lines 99–165, "All of the following are roadmaps built before this one": NoncommutativeAndEquivariantIwasawa §F.6 (112), DerivedDeRhamCohomology §PD.6 (125), CongruenceSpectralGap §§4.2a–4.2b (126), CrystallineCohomology §CR.6.4 (129); none is on main.

**Repair:** Replace the paragraph's last three sentences by: "By section, the README's suppliers that are not yet on main are: MotivesAndAlgebraicCycles §§6.1–6.3 (neutral Tannaka reconstruction, imported in RD.2.52); FormalConnectionsOpers §6.2 (cyclic vectors, applied in RD.1.7, RD.1.10, RD.1.52 and RD.6.52a); NoncommutativeAndEquivariantIwasawa §F.6 stages 1–2 (Robba carriers); CrystallineCohomology §§CR.1.2, CR.4.7, CR.6.4–CR.6.5; DerivedDeRhamCohomology §PD.6; CongruenceSpectralGap §§4.2a–4.2b; LocallyAnalyticDistributions Layer 0; ArithmeticGaloisRepresentations Layers 3 and 6, §2.6; DeligneWeightsAndPurity Layers 0–1, §§0.10, 1.10, 2.7, 4.3–4.4, 7.15; InverseGaloisAndArithmeticFundamentalGroups §§IG.0.3, IG.0.T4, IG.1.2; LefschetzPencilsAndVanishingCycles §1.3; AbelianSchemesAndArithmeticModuli §§A5.7, A6.11; PadicPeriodRings §§4.1–4.3; ModularCurvesPartII Layers 2–5, 7 and §11.1; AdicCoefficientsAndComparisons §L2; ClassicalAdicEtaleCohomology §§4.1–4.2; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.2–R07.3.3. Roadmaps on main are cited by name and section in the README's supplier contracts. The roadmaps named under 'What builds on it' and 'Downstream consumers' are consumers." This list agrees with the seventeen entries of the generated depends-on block.

## Previous findings

- none: the previous report (of this same head) carried no finding of its own; its six "repaired" bullets stand, the folder being unchanged.

## Verified sound

| Statement or changed target | Instances tried | Values computed on both sides | Result; change |
| --- | --- | --- | --- |
| RD.1.7 (cited by the description as the use of FormalConnectionsOpers §6.2) | Rank 0; rank 1; trivial rank 2 with v=(1,t); ∂=0 control | Empty basis; v=1 cyclic; det[[1,t],[0,1]]=1≠0; with ∂=0, ∂v=0 so no cyclic vector in rank 2 | Holds; hypothesis ∂t=1 excludes the control; supplier §6.2 states `exists_cyclicVector` with CharZero and ∂≠0 |
| RD.0.55(b), `hasFiniteFreeResolution_iff_isStablyFree` (the summary's "finite free resolutions") | M=0 over ℤ; zero ring; I=(2,1+√−5) over ℤ[√−5] | M=0: length 0, stably free with N=0; zero ring: both true; I: class of order 2 in Pic, so neither stably free nor resolvable | Both directions agree |
| Summary block: Weil factors "written with `Matrix.charpolyRev`" | 1×1 matrix (q), q=4 | charpoly=T−4; charpolyRev=1−4T=det(1−4T) | Agrees with README line 67 and 8 uses in the README |
| Description: "RD.2.52" as the Tannaka import; "Target RD.6.64 is now §RD.2.52" | Heading lookup | README line 5625 "RD.2.52 Neutral Tannakian recognition theorem"; no other roadmap cites RD.6.64 (overlap list empty) | Consistent |

Untouched statement rows stand as in the previous review, of `457e49f`.

- Folder diff since the previous review: 0 lines; 0 files changed outside the folder; worktree clean at `457e49f`.
- Title equals the README's first heading. Summary block and the two prose paragraphs before "Dependencies" checked sentence by sentence against README lines 1–48 and 50–186: coefficient field, Frobenius generality, owned commutative algebra (RD.0.55, RD.0.56, RD.3.27), Robba owner, Tau Ceti dagger carriers, crystalline supplier: no contradiction other than R01.
- The description's Lean claims checked: 18 declarations, none restates the cyclic-vector theorem, single `import Mathlib` plus `TauCeti.*`, no `set_option`.
- 5 cross-roadmap citations resolved at the suppliers' open heads: FormalConnectionsOpers §6.2 (`exists_cyclicVector`), MotivesAndAlgebraicCycles §§6.1–6.3, CrystallineCohomology §CR.6.4 (*Rigid cohomology of smooth strata* is a block of that section), NoncommutativeAndEquivariantIwasawa §F.6 stages 1–2, CongruenceSpectralGap §§4.2a–4.2b; 17 not-on-main suppliers checked against main's folder list.
- Elaboration of `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/Suggested.lean`: 14 `sorry` warnings, 0 errors, no other message.
- Gate: the worker's gate at this head passes every check including the targeted build. Dependency check with the supplied merge order: "depcheck: 247 roadmaps, 2255 edges, 0 problem(s)".
- Rerunning the gate with the default (unmoved) order prints "UPWARD: PadicDifferentialEquationsAndRigidCohomology (#122) -> CongruenceSpectralGap (#159)"; the supplied order places CongruenceSpectralGap (line 122) directly before this roadmap (line 123), so this is the order's pending move, not a roadmap defect.

Overlap check: read PadicDifferentialEquationsAndRigidCohomologyPartII, CrystallineCohomology, NoncommutativeAndEquivariantIwasawa; Part II consumes this roadmap and owns bounded quotients and minimal slopes only; constant-coefficient rigid cohomology of smooth schemes belongs to CrystallineCohomology §CR.6.4; Robba carriers to NoncommutativeAndEquivariantIwasawa §F.6. The other lists stand as read in the previous review.

Source independence: changed passages only; the folder has 0 changed passages, so 0 passages compared with 0 sources this round; the previous comparison (largest share Kedlaya-Finiteness; arrangement independent) stands, no layer added, removed or reordered.

## Not verifiable

- The description's statement of AI assistance and author-side red-team passes: provenance, not checkable from the head.

## Source issues

- none

## For the human reviewers

- none
