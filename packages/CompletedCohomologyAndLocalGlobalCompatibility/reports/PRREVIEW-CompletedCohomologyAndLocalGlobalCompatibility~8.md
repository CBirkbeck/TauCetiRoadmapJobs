# Review of CompletedCohomologyAndLocalGlobalCompatibility (pull request #1270 at 0c236a0)

**Verdict:** accepted

Incremental re-review: the folder is unchanged since the review of `0c236a0` (0 lines); this round reads the rewritten title and description against this head. No finding.

## Previous findings

- R01 — repaired: the "Dependencies" paragraph now lists, by section, every roadmap not on main that the README's supplier contracts and `*Needs:*` lines use (24 roadmaps), and names GL2ModularityLifting §10.1 as a supplier, its other sections as consumers.
- R02 — repaired: "`Suggested.lean` states no declaration: no headline theorem is statable against the pinned Mathlib and Tau Ceti, and its module docstring names, by README section, the carriers the headlines lack."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| Description: roadmaps "not yet on main" used by the README | every roadmap name in `README.md`, tested against main `1a19c9f` | README: 24 names not on main; description: the same 24. On main in README: 8; description names 7 (see remark) | Agrees |
| Description: section numbers per supplier | each "§" the description gives, against the README line citing it | PadicLocalLanglands §§0.1, 0.3–0.5, 1.7, 2.2–2.3, 3.2–3.3, 3.7–3.8, 4.1–4.4, 5.1–5.9, 5.12 = lines 118–125; PhiGamma §§1.1–1.2, 7.1, 7.5 = line 133; PadicFamilies §§2.4–2.10, 5.9a–5.10 = lines 1235, 1357; all others equal | Agrees |
| §5.7 (line 2133), cited by the description: Pan's Theorem 4.1.7 for the nice primes of GL2ModularityLifting §10.1 | `q = m`; q of characteristic 0; p = 3 with `χ̄|G_{F_v} = ω`; clauses against the supplier's | `q = m`: dim `T_m/q` = 0 ≠ 1, not nice. `p ∉ q`: fails (i). p = 3, ratio ω: excluded by hypothesis. Supplier §10.1 at its head: `p∈q`, dim 1, same four lattice clauses | Same predicate on both sides |
| Supplier-contract extension of CompletedCohomologyPartII §8.5 (line 153), cited by the description "to rank one and to tame levels with nontrivial stabilizers, for §5.1" | n = 1; n = 2 small level; n = 3 | n = 1: OverconvergentAutomorphicForms §0.7 assumes n ≥ 2, supplier §8.5 is the outer form of `GL_3`: neither covers it, extension needed. n = 2: imported from §0.7. Stabilizers: value in `W_s^{Γ_x}` on both sides | Agrees with README lines 39, 139, 153 |
| Description: "`Suggested.lean` states no declaration … empty namespace" | declarations in the file | 0 declarations; `import Mathlib` only; namespace opens and closes (lines 112–114) | Agrees |

Rows for the statements of the folder stand as in the previous reviews, of `0c236a0` and `1148c33`: no statement changed.

- Gate at this head (worker): every counter 0, `build=0 OK`. Re-run here: every counter 0, `OK`, exit 0. No file changes outside the folder.
- Dependency check (`--movable`): `depcheck: 246 roadmaps, 2267 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/Suggested.lean` exits 0 with no output. The file declares nothing, so the `#check @name` comparison and the one-tactic probe have nothing to test; the headlines remain not statable, as its docstring says.
- Cross-roadmap citations resolved at open heads for the description's claims: GL2ModularityLifting §§8.7, 9.1–9.3, 10.1, 10.6, 12.4; CompletedCohomologyPartII Layers 0–8 and §8.5; OverconvergentAutomorphicForms §§0.6–0.7 (head `b6ce911`). All exist with the content the description gives.
- Description sentences checked against README lines: ArithmeticGaloisRepresentations §5.10 (1128, 1136); GL2AutomorphicRepresentationsAndTransfer R17.3, §R16.1.8 in §3.7a, R17.5 for §§6.3–6.4 (15, 209, 1345, 1357, 2295); ClassicalSerreModularity §I.1, OrdinaryAutomorphicFormsAndModularityLifting §2.12(a), IntegralIwasawaTheory §§6.0–6.3 (1357); AlgebraicModularFormsAndSerreWeights §§3.1, 3.3, 3.10, 4.2–4.5 (162, 327, 827); EndoscopicTransferAndUnitaryTraceComparison §§12.3, 12.5–12.8 and DiamondEtaleCohomology C0–C1 in §0.6 (342, 352); ReductiveGroupsPartII RG2.0a, PerfectoidTowers P9, AdicEtaleGeometry A1.6 and A4.2a, AdelicAlgebraicGroups Layer 1 (459). Title, summary block, folder contents (three files) and "Validation" paragraph hold as in the previous review.
- Remarks (no change asked): README line 104 also takes Galois normalisations from ClassFieldTheory, on main, which the description's sentence on roadmaps on main does not list; it carries no merge-order consequence. README line 33 lists GL2ModularityLifting as a consumer while line 2150 cites its §10.1; the description now states this, and the dependency check reports no cycle.
- Overlap check: read GL2ModularityLifting, PadicLocalLanglandsForGL2Qp, CompletedCohomologyAndLocalGlobalCompatibilityPartII; nothing shared. The nice-prime predicate is GL2ModularityLifting §10.1's and Pan's Theorem 4.1.7 and Corollary 4.1.8 for it are §5.7's here; the local correspondence is PadicLocalLanglandsForGL2Qp's; no open pull request changes this roadmap and no cited id is dropped.
- Source independence: changed passages only; 0 passages changed in the folder, so none compared; the diff adds, removes or reorders no layer, so the arrangement was not compared again (the comparison of the review of `0c236a0` stands).

## Not verifiable

Carried from the previous reviews; none is in a passage changed since:
- CHT §3.3: no legal copy found.
- Shimura, *Introduction to the arithmetic theory of automorphic functions*, Proposition 3.3: no legal copy.
- Ribet 1990, Proposition 3.8, and Ribet 1995: paywalled, uncertified.
- González–Rotger, Theorem 3.1 and Table 3.2: not fetched.
- The description's sentence on AI assistance describes how the text was produced; nothing at the head can confirm or contradict it.

## Source issues

- none

## For the human reviewers

- none
