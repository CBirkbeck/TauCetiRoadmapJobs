# Review of ReductiveGroups (pull request #1854 at 30817b1)

**Verdict:** needs changes

This is an incremental re-review. `TauCetiRoadmap/ReductiveGroups/` is byte-identical at 30817b1 and at 1ccc517, the head the previous review read (`git diff 1ccc517..HEAD -- TauCetiRoadmap/ReductiveGroups` is empty). The pull request's only hunk in this folder is still the three-line Layer 7g edit at `README.md` lines 977–980. So none of the previous review's 17 findings has been repaired. I re-checked each witness that depends on text outside the folder (main at 8d9e0a0, the open heads, the pins, the pull request's description and the gate), and every one still holds. Each finding is carried below with its repair. Line numbers are unchanged from the previous review.

## R01 (P2) — ReductiveGroups and ReductiveGroupsPartII supply each other

**Location.** `README.md` line 692: “**Supplier:** ReductiveGroupsPartII RG2.3.7 owns ordinary q-Frobenius Lang surjectivity, its quotient/H¹ consequences, and generic fixed-coset lifting.” The same citation appears at lines 716 (7a), 839 (7d) and 1077 (Layer 8, RG2.0a.1–2).

**Claim.** This roadmap consumes its own Part II, and Part II consumes this roadmap's Layers 0 and 3, so the two roadmaps supply each other. The dependency check cannot see this because both roadmaps are on main. The Layer 7g hunk changes only how the dependency is worded: line 977 still says the Lang statement is “consumed in Layer 7a”, and Layer 7a still consumes it from RG2.3.7.

**Witness.** ReductiveGroupsPartII `README.md` on main: line 5214 (*lang-theorem*) reads “*Needs:* ReductiveGroups layer 3”; line 977 (RG2.0a) reads “*Needs:* ReductiveGroups layer 0”; line 341 is the heading “From TauCetiRoadmap.ReductiveGroups”.

**Repair.**
- Make the q-Frobenius Lang theorem a Layer 7a target: smooth, geometrically connected, finite type over `F_q`. Cite `milne-iag` line 20248 (Prop. 27.54, p. 487) and line 20264 (Cor. 27.55, p. 488).
- Add a negative Check: μ₂ over `F_q` with `q` odd. The Lang map is `z ↦ z^{q−1} = 1`, which misses −1 (`milne-iag` line 20275).
- Make fixed-coset lifting a Layer 7a group-theory target with no smoothness hypothesis. Add the Check `ℤ/4`, `σ = −1`, `J = {0,2}`.
- In Layer 8, replace RG2.0a with the pinned `TauCeti.Algebra.WeilRestriction.multiplicativeGroupPoints`/`instSmooth` (`TauCeti/Algebra/AlgebraicGroup/MultiplicativeGroup/WeilRestriction/Basic.lean:65`) and `geometricallyConnectedCommHopfAlgProperty_multiplicativeGroup` (`…/Connected.lean:233`).
- Then delete all four citations of ReductiveGroupsPartII.

## R02 (P2) — Supply runs both ways with FormalConnectionsOpers, InverseGaloisAndArithmeticFundamentalGroups and LieGroups

**Location.** `README.md` line 1964: “The lower smooth/holomorphic dictionary of [FormalConnectionsOpers F4.3] … is a prerequisite”. Also lines 1972 and 1996 (IG.5.1, IG.3.2), line 358 (LieGroups Layer 6), line 606 (Layer 7) and line 2104 (Layer 8).

**Claim.** Each of these three roadmaps consumes this one, and this one cites each of them as a supplier.

**Witness.**
- FormalConnectionsOpers, open head, line 1640: “*Needs:* … ReductiveGroups Layers 0–4 (3A.5 included), 6–9”.
- InverseGaloisAndArithmeticFundamentalGroups, open head, line 411: “ReductiveGroups Layers 0, 3 and 6”.
- LieGroups on main, line 1428: “ReductiveGroups Layers 0–4, 6 and 7C”.

**Repair.**
- Move Layer 11 into a ReductiveGroups Part placed after FormalConnectionsOpers and InverseGaloisAndArithmeticFundamentalGroups. Layer 11 is the only consumer of F4.3, IG.5.1, IG.3.2 and LieGroups Layer 8.
- Delete the LieGroups comparisons at lines 354–358 and 604–607, or hand them to LieGroups, which already consumes Layers 3A and 6.

## R03 (P2) — Theorems proved at the Tau Ceti pin are restated as targets

**Location.** `README.md`:
- line 206: “Prove that every affine group scheme of finite type has a faithful finite-dimensional representation / closed immersion into GLₙ”;
- lines 324–333 (closed orbits), 471–477 (reductive ⇔ linearly reductive in characteristic 0), 621–622, 628, 702–704 and 1079–1080;
- line 66 lists these under “Remaining roadmap targets”.

**Witness.** At Tau Ceti 2fd255d:
- `TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear` (`Algebra/AlgebraicGroup/Representation/Embedding.lean:212`);
- `TauCeti.SchemeAction.exists_isClosed_orbit` (`AlgebraicGeometry/GroupAction/ClosedOrbit.lean:178`);
- `IsBorelOverAlgClosed.exists_conjugate_eq` (`Borel/Conjugacy/Existence.lean:133`);
- `reductiveCommHopfAlgProperty_iff_linearlyReductive` (`Reductive/CompleteReducibility.lean:118`).

**Repair.**
- Move each item into a “From Tau Ceti” contract under its exact name and file, and delete it as a target. Besides the four above, cite:
  - `rationalPointsMulEquivFixedSubgroupGeometricFrobenius` (`Frobenius/FiniteField.lean:434`);
  - `smooth_of_grpObj_of_charZero` (`AlgebraicGeometry/Group/Cartier.lean:32`);
  - `isIso_fppfHomogeneousQuotientToCoinvariantsPoints_ker_coordinateBialgHom` (`Fppf/Quotient/Homogeneous/GeneralLinear.lean:56`);
  - the Weil-restriction declarations of R01.
- Keep as targets only:
  - Matsushima for general reductive `A`;
  - pseudo-reductivity and non-reductivity of `Res_{K/k} G_m`;
  - the Lang adapters.

## R04 (P2) — Layer 7f restates the pinned fixed-coset identity and the GL₃ example, and calls them unproved

**Location.** `README.md` lines 954–964: “this roadmap does not treat it as already proved … The target identity is …”. Also lines 996–1004 (the GL₃ example) and lines 950–952 (`Gassmann.AlmostConjugate`).

**Witness.**
- `Subgroup.natCard_fixedBy_mul_natCard` (`TauCeti/GroupTheory/QuotientGroup/Basic.lean:177`) is the displayed identity.
- `TauCeti.almostConjugate_lineStabilizer_hyperplaneStabilizer` (`LinearAlgebra/Matrix/GeneralLinearGroup/LineHyperplane.lean:241`) is the GL₃ example at `n = 3`.
- `Gassmann.almostConjugate_iff_permutation_equiv` exists at neither pin (the worker's `citations.md`).

**Repair.**
- Delete the identity block and the “not … already proved” sentence, and cite the pinned theorem.
- Use `Subgroup.AlmostConjugate` and `Subgroup.almostConjugate_iff_forall_natCard_fixedBy_eq` (`TauCeti/GroupTheory/AlmostConjugate.lean:92`, `:231`).
- Turn the GL₃ example into a Check citing the line/hyperplane theorem. At `q = 2`, both stabilizers have order 24 and index 7 in a group of order 168.

## R05 (P2) — RootSystems citations use retired ids and say Tits' injectivity is unproved

**Location.** `README.md` lines 2042–2044: “Native `weylCoxeterHom` supplies the map and surjectivity, but its injectivity remains that lower written target.” Also lines 654 (“Layers1–4”), 1132 (“Layers5–6”), 1274 (“RootSystems4A”) and 2041 (“Layer2”).

**Witness.**
- `TauCeti.weylCoxeterHom_injective` (`LinearAlgebra/RootSystem/Coxeter/Presentation.lean:158`) and `weylCoxeterSystem` (`:167`).
- The RootSystems README on main, line 1139: “4A: Weyl/based factorization | §5.1, with §5.2 for diagrams”.

**Repair.**
- Cite `TauCeti.weylCoxeterSystem` and `TauCeti.weylCoxeterHom_injective`, and delete the “remains that lower written target” clause.
- Point line 1274 at RootSystems §5.1 and §5.2.
- Replace the old layer ids with the native declarations that the RootSystems table names.

## R06 (P2) — The sampled “Cross-cutting prerequisite: sheaves and descent” has a second owner and no locator

**Location.** `README.md` lines 123–126: “The functor-of-points comparison, quotients, torsors and representability use the fppf topology and faithfully-flat descent …”. Also lines 172–174 and lines 1059–1060 (“… here from Layer0 if no lower supplier has it”).

**Claim.** This makes the roadmap the owner of generic fppf descent, sheafification and torsors, with no locator. The “if no lower supplier has it” clause leaves the scope undecided.

**Witness.**
- SchemeAndStackFoundations at this head: §1.1 (line 2071, `qcoh_fpqc_descent`), §1.5 (line 2167) and §1.15 (line 2502, `IsTorsor`).
- Pinned Tau Ceti `Algebra/AlgebraicGroup/Fppf/Quotient/Torsor.lean` and `AlgebraicGeometry/Descent/Affine.lean`.

**Repair.**
- Replace the paragraph, the Layer 0 bullet and lines 1059–1060 with a supplier contract naming SchemeAndStackFoundations §1.1, §1.5 and §1.15, ModularCurves §0E, and the Tau Ceti Fppf and Descent modules by declaration.
- Keep here only the group-specific comparisons, each with a locator.

## R07 (P2) — Layer 9A.1b prescribes computational certificates

**Location.** `README.md` lines 1464–1470: “Construct kernel-checkable rational certificates: for every surviving root-orbit basis vector record a finite Lie word expansion …”.

**Witness.** The prescribed records cover the 72 roots of E6 and a fixed algebra of dimension 52. The uniform folding argument at lines 1371–1410 already gives generation for every type.

**Repair.**
- Delete the certificate paragraph.
- State the G₂ (dimension 14) and F₄ (dimension 52) identifications as consequences of the uniform folding theorem, with a locator.
- Keep the counts 24/12, 72/36 and 14/52 as Checks.

## R08 (P2) — Suggested.lean states no headline theorem, and its docstring names none as not statable

**Location.** `Suggested.lean` lines 16–22 (the docstring) and every declaration (lines 34–150).

**Claim.** The file holds library abbrevs, a dimension identity and a generic API for lifts to central extensions, and none of these is a README headline. Statable headlines are absent, for example Lang–Steinberg (7a/7g) and Brieskorn's presentation (11B).

**Witness.**
- ReductiveGroupsPartII `Suggested.lean:212` states `Lang.lang_surjective` at these pins, using `TauCeti.FiniteTypeCommHopfAlgCat`, `smoothCommHopfAlgProperty` and `geometricallyConnectedCommHopfAlgProperty`.
- `TauCeti.ArtinGroup` and `TauCeti.coxeterMatrixOfBase` (`Coxeter/Matrix.lean:278`) exist at the pin.

**Repair.**
- List the headlines in the docstring, naming the missing carrier for each one that is not statable.
- State Lang once R01 makes it this roadmap's own.
- State Brieskorn's theorem as `Nonempty (FundamentalGroup B b ≃* TauCeti.ArtinGroup (TauCeti.coxeterMatrixOfBase P base))`, over a real-bodied orbit-space carrier.
- State 11D as bijectivity of `FundamentalGroup.map`.

## R09 (P2) — Sorry'd data in Suggested.lean and in the companion files

**Location.**
- `Suggested.lean` line 134: `noncomputable def characterKernelEquiv … := by sorry`, a `MulEquiv`, which line 138 uses.
- Defs with sorry'd fields at lines 89, 119, 127 and 143.
- 17 companion-file defs or instances whose body is `sorry`, e.g. `SpectralWeylTargets.lean:263` (`arrangementAction`).

**Witness.** The gate reports `sorry-data` 5. My `lake env lean` run reports `declaration uses sorry` at lines 89, 119, 127, 134, 138 and 143.

**Repair.**
- Delete these definitions, and state any headline among them as a `theorem` over real-bodied carriers.
- Delete the companion files, or cut each to the real-bodied definitions that a headline needs.
- The README keeps the targets.

## R10 (P3) — Imports break the single `import Mathlib` rule

**Location.** `Suggested.lean` lines 1–3: `import TauCeti.RepresentationTheory.Induction.FiniteDimensional.Basic`, `import Mathlib`, `import Mathlib.GroupTheory.GroupExtension.Basic`. Every companion file also imports `Mathlib.<submodule>` lines.

**Witness.** Gate `imports` 1 and `mathlib-subimports` 1.

**Repair.** Put `import Mathlib` first, then only the `TauCeti.*` modules actually used. Any companion file that survives R09 follows the same rule.

## R11 (P3) — Padding in Suggested.lean

**Location.**
- line 34, `globalSectionsHopfAlgebra`; line 42, `specGroupObject`;
- lines 55–64, `indFromProjectedLevi` and `finrank_indFromProjectedLevi`;
- lines 99–116, `projection`, `coverAutomorphism`, `coverAction` and `coverAction_projection`.

**Witness.** In a scratch copy with the `change` line removed, `finrank_indFromProjectedLevi` closes by the single term `TauCeti.finrank_indFDRep (A := FDRep.of (M.ρ.comp π))` with no error. `coverAction_projection` is `l.property.2 e`. `specGroupObject` is `inferInstance`.

**Repair.** Delete them from `Suggested.lean`; the README keeps the statements.

## R12 (P3) — Links pinned to commits

**Location.**
- `README.md` lines 521, 1077, 1210, 1388, 1762, 1918 and 1972 link the roadmap repository at fixed commits.
- Lines 464, 678 and 1249 link Mathlib at 6b7abb3, and line 103 links Tau Ceti at a91d3aa.

**Witness.**
- Gate `blob` 7.
- At the Mathlib pin 1b1ccf4, `IsCoveringMap.existsUnique_continuousMap_lifts` is at `Topology/Homotopy/Lifting.lean:489`, but the README anchor is `#L477`.
- `IsNilpotent.exp` is at `RingTheory/Nilpotent/Exp.lean:51`, but the anchor is `#L50`.

**Repair.** Cite roadmaps by name and section (IntegralHeckeAndGaloisDeterminants §0.7, LieHighestWeight Layer 7, GroebnerGeometry G5, InverseGaloisAndArithmeticFundamentalGroups IG.5.1). Cite library declarations by name and file, with no commit links.

## R13 (P3) — Edits outside the pull request's own folders

**Location.** The diff changes `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`.

**Witness.** The worker's gate reports `outside-folder` 2 for these two files. Neither folder is among the pull request's own folders. The description explains both cuts, but that does not make them reviewed folders.

**Repair.** Move the two cuts into their own pull request, or declare both folders as this pull request's own so that each is reviewed.

## R14 (P3) — No stated order relative to three open pull requests that change this README

**Location.** `README.md` lines 977–980, this pull request's only hunk in the folder. The description's merge-order paragraph names only #1101, #1807 and #1808.

**Witness.**
- #1332, #1676 and #1797 conflict with this head in `ReductiveGroups/README.md` (`overlaps.md`).
- #1332's line 2420 already reads “Lang statement in Layer 7a covers the standard-Frobenius case”.
- #1797's Scope section says “Layer 7a owns Lang's theorem”.

**Repair.** State in the merge-order paragraph which of #1797, #1332, #1676 and this pull request merges first, and rebase the others on it. Alternatively, drop this hunk and leave the change of Lang ownership to #1797.

## R15 (P3) — README shape, Checks, *Needs:* lines, locators, timelessness

**Location.** The whole README. Its top-level headings are “Standing hypotheses”, “Three synchronized models”, “Mathlib foundations to use”, “Remaining roadmap targets” (line 66), “The build, in layers” and “Design notes (from Zulip)” (line 2183).

**Claim.**
- There is no `**Summary.**`, Scope and ownership, Conventions, Exact supplier contracts or How to read the build section.
- No layer ends with Examples and Dependencies.
- No definition has `**Checks.**`, and there are no `*Needs:*` lines.
- Most theorems have no locator: Mostow (6A), Bruhat (7), the classification (8), the Steinberg module (10B) and Brieskorn (11B).
- Process words: “done” (line 1638), “that do not yet exist” (line 1652), “remain construction targets until proved” (line 2171).

**Witness.** Compare CFSGStatement on main, headings at lines 1, 12, 47, 89, 185, 195, 226 and 232.

**Repair.** Rewrite in house shape: prose targets, a `*Needs:*` line per target, Checks with computed values (from lines 1171–1173, 1498–1500, 1534–1536 and 1839–1842), and Examples and Dependencies for each layer. Delete the process words.

## R16 (P3) — The ⚠ note on characters overstates the converse

**Location.** `README.md` lines 447–449: “a *connected unipotent* group has no nontrivial characters; the converse needs solvability.”

**Witness.** `SO(2) = {x² + y² = 1}` over ℝ is connected and solvable and has no nontrivial ℝ-characters, but it is a torus, not unipotent.

**Repair.** Write “no nontrivial characters over `k̄`”, and add `SO(2)` over ℝ as a negative Check.

## R17 (P3) — Dead pointers into CFSGStatement

**Location.** `README.md` line 1102 and line 2207 (“milestone L5”); lines 1644, 1645 and 1650 (“the CFSG roadmap's carrier plan records the reason”).

**Witness.** CFSGStatement on main has Layers 1–5, and neither “L5” nor “carrier plan” occurs in it (`grep -c` gives 0 for each). Its section “From TauCetiRoadmap.ReductiveGroups” (line 162) is a consumer contract.

**Repair.** State the G₂ and F₄ carrier constructions, and the reason for working over the prime field, here with a locator. Cite CFSGStatement only as a consumer, by its present layer number.

## Previous findings

- R01 — not repaired: line 692 still reads “**Supplier:** ReductiveGroupsPartII RG2.3.7 owns ordinary q-Frobenius Lang surjectivity”, and lines 716, 839 and 1077 are unchanged.
- R02 — not repaired: line 1964 still names “[FormalConnectionsOpers F4.3] … is a prerequisite”, and lines 358, 606, 1972, 1996 and 2104 are unchanged.
- R03 — not repaired: line 206 still reads “Prove that every affine group scheme of finite type has a faithful finite-dimensional representation”, and line 66 is “## Remaining roadmap targets”.
- R04 — not repaired: lines 954–964 still say “this roadmap does not treat it as already proved”, and line 951 cites `Gassmann.almostConjugate_iff_permutation_equiv`.
- R05 — not repaired: lines 2042–2044 still say “its injectivity remains that lower written target”.
- R06 — not repaired: lines 123–126 still read “**Cross-cutting prerequisite: sheaves and descent.** The functor-of-points comparison, quotients, torsors and representability use the fppf topology …”.
- R07 — not repaired: line 1464 still reads “Construct kernel-checkable rational certificates: for every surviving root-orbit basis vector record a finite Lie word expansion”.
- R08 — not repaired: the `Suggested.lean` docstring (lines 16–22) still describes “two native signature examples only” and states no headline.
- R09 — not repaired: `Suggested.lean` line 134 still reads `noncomputable def characterKernelEquiv … := by sorry`, and the gate reports `sorry-data` 5.
- R10 — not repaired: `Suggested.lean` lines 1–3 still import a `TauCeti` module, `Mathlib` and `Mathlib.GroupTheory.GroupExtension.Basic`, in that order.
- R11 — not repaired: `globalSectionsHopfAlgebra`, `specGroupObject`, `finrank_indFromProjectedLevi` and `coverAction_projection` are still declared at lines 34, 42, 60 and 114.
- R12 — not repaired: the gate still reports `blob` 7 (lines 521 to 1972), and lines 464, 678 and 1249 still link Mathlib 6b7abb3.
- R13 — not repaired: the worker's gate still reports `outside-folder` 2, for `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`.
- R14 — not repaired: the description's merge order still reads “#1101 → #1807 → this pull request … #1808 is independent”, and it does not mention #1332, #1676 or #1797.
- R15 — not repaired: the headings are still “Standing hypotheses … Remaining roadmap targets … Design notes (from Zulip)”, with no Summary, Scope, Conventions or supplier contracts.
- R16 — not repaired: lines 447–449 still read “a *connected unipotent* group has no nontrivial characters; the converse needs solvability.”
- R17 — not repaired: line 1102 still reads “Its milestone L5 depends on”, and line 1645 still reads “carrier plan records the reason”.

No repair report marks any of these as “not actionable in this package”, so none is settled. None of them is a re-raise.

## Verified sound

**Change set.**
- `git diff 1ccc517..HEAD -- TauCetiRoadmap/ReductiveGroups` is empty. The only changes since 1ccc517 are in AlgebraicCurves, BordismFormalGroups and LocalPurity, and none of them cites a ReductiveGroups id that this folder changes.
- `git diff origin/main...HEAD -- TauCetiRoadmap/ReductiveGroups` is still the three-line Layer 7g hunk.
- The pins are unchanged: Mathlib 1b1ccf4 and Tau Ceti 2fd255d.

**Gate.**
- My rerun gives `blob=7 sorry-data=5 imports=1 mathlib-subimports=1 statement-hygiene=0 stray-files=0 depcheck=0 FAIL`, which matches the worker's gate.
- My run reports `outside-folder=35` only because the invocation has no list of the pull request's own folders. The worker's gate, with that list, gives 2.
- The worker's targeted build passes (`build=0`).

**Elaboration.**
- `lake env lean TauCetiRoadmap/ReductiveGroups/Suggested.lean` finishes in 7.3 s. The only warnings are `declaration uses sorry` at lines 89, 119, 127, 134, 138 and 143.
- `#check @…` in one scratch file for the 11 non-abbrev declarations shows every explicit binder in each elaborated type (`hc`, `[P.FiniteIndex]`, `S`, `ρ`, `χ`). This agrees with `signatures.md`: 16 declarations, none missing a binder.
- The one-term probe of R11 elaborates without error.

**Dependency check.** Output, verbatim: `depcheck: 239 roadmaps, 2349 edges, 0 problem(s)`. It misses the two-way pairs of R01 and R02 because roadmaps on main are never treated as upward suppliers. FormalConnectionsOpers is at merge-order line 40, InverseGaloisAndArithmeticFundamentalGroups at line 54, and ReductiveGroups, ReductiveGroupsPartII and LieGroups are on main.

**Seeded sample.**
- “Supplier:” (line 692): `milne-iag` line 20240 is Def. 27.53 (Steinberg endomorphism). Line 20248 is Prop. 27.54 (p. 487). Line 20264 is Cor. 27.55, after the `=== page 488 ===` marker at line 20262. Line 20269 is Cor. 27.56, and line 20275 is the failure for `ℤ/2ℤ`.
  - Hypotheses: Milne's “connected group variety” is smooth and connected, which matches line 716. The locator is correct; the defect is the direction of supply (R01).
  - RG2.3.7 is on main: ReductiveGroupsPartII README line 5201, *lang-theorem* at 5203, *fixed-coset-lifting* at 5260, and `Lang.lang_surjective` at `Suggested.lean:212`.
- “Cross-cutting prerequisite” (line 123) has no locator. Its ownership claim, checked against SchemeAndStackFoundations at this head (lines 2071, 2167 and 2502) and the Tau Ceti `Fppf/Quotient/Torsor.lean` and `Descent/Affine.lean`, gives R06.

**Library declarations re-opened at the pins (14 files, 17 lines).**
- Tau Ceti:
  - `Representation/Embedding.lean:212`;
  - `GroupAction/ClosedOrbit.lean:178`;
  - `Borel/Conjugacy/Existence.lean:133`;
  - `Reductive/CompleteReducibility.lean:118`;
  - `Frobenius/FiniteField.lean:434`;
  - `Group/Cartier.lean:32`;
  - `QuotientGroup/Basic.lean:177`;
  - `AlmostConjugate.lean:92` and `:231`;
  - `LineHyperplane.lean:241`;
  - `Coxeter/Presentation.lean:158` and `:167`;
  - `Coxeter/Matrix.lean:278`;
  - `BaseChange/Pi.lean:127`.
- Mathlib: `Topology/Homotopy/Lifting.lean:489` and `RingTheory/Nilpotent/Exp.lean:51`.

**Cross-roadmap citations re-resolved (8).**
- On main:
  - ReductiveGroupsPartII lines 341, 977, 5201 and 5214;
  - LieGroups line 1428;
  - RootSystems line 1139;
  - CFSGStatement headings at lines 12–232, and line 162.
- At open heads:
  - FormalConnectionsOpers line 1640;
  - InverseGaloisAndArithmeticFundamentalGroups line 411;
  - ReductiveGroups at #1797 (Scope) and at #1332 (line 2420).
- `citations.md` lists no cross-roadmap citation found nowhere. Its one Lean-name lead, `Gassmann.almostConjugate_iff_permutation_equiv`, is R04.

**Overlaps.**
- `overlaps.md` lists no dropped or revision-only ids.
- #1332, #1676 and #1797 conflict in this README (R14).
- #1807 and #1808 conflict only outside this folder.
- The closest open roadmaps in vocabulary (SchubertGeometry, RootSystemsPartII, ChevalleyGroups, ClassicalGroupsPartII, SpringerResolutionAndCharacteristicCycles) were checked by the previous review and are unchanged against this folder.

**Adversarial table.** The diff changes no statement, so every row is carried from the previous review (r66) with the values it computed. The sampled Lang row was recomputed.

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 7a Lang (sampled; `milne-iag` l. 20264, recomputed) | `G_m`, `G_a`, μ₂ over `F_q`, q odd | `x↦x^{q−1}` is onto `F̄^×`; `x↦x^q−x` is onto `F̄`; on μ₂, `z↦z^{q−1}=1` misses −1 | true; connectedness needed | R01 |
| 7g Steinberg endomorphism (r66) | `Frob_q` on `GL_n`; identity; τ on Sp₄ in char 2 | fixed points `GL_n(F_q)`; identity is excluded (no power is a Frobenius); `τ²=Frob₂` is included | determines the class | none |
| Fixed-coset lifting (r66) | `ℤ/4`, σ=−1, J={0,2}; J=1 | Lang map on J is 0; coset {1,3} is σ-stable while the σ-fixed elements are {0,2}; J=1 is trivial | Lang hypothesis needed; no smoothness | R01 |
| Cross-cutting descent (sampled, r66) | owners | SchemeAndStackFoundations l. 2071, 2502; Tau Ceti `Fppf/Quotient/Torsor.lean` | second owner | R06 |
| Layer 1 faithfulness (r66) | `G_m→GL₁`; μ_p ⊂ G_m in char p | `t` generates `k[t]`, not `k[t^±]`; with `det⁻¹` it does; `μ_p(k)=1`, yet `k[t^±]→k[t]/(t^p−1)` is onto | true; pinned | R03 |
| 3A.4 closed orbits (r66) | `G_m` on P¹; C₂ swap | {0} and {∞} closed, dimension 0; open orbit of dimension 1 with boundary of dimension 0; {0,∞} closed and disconnected | true; pinned | R03 |
| 6 reductive ⇔ lin. reductive (r66) | `G_m`; `G_a` in char 0; `SL₂` in char p | `G_m`: both true; `G_a`: `[[1,t],[0,1]]` not completely reducible; `∇(p)` indecomposable and not simple | true as scoped; pinned | R03 |
| 6A.3 cocycle (r66) | `(v,g)(w,h)` | `c_b=c+db`; `i(−v)s₀(g)i(v)=i(g·v−v)s₀(g)` | holds | none |
| 6A Levi stabilizer (r66) | `L×G_a` | `C_U(L)=U`; one complement | holds | none |
| 7C.2 root subsets (r66) | A2, w=s₁ | `A_{s₁}={α₂,α₁+α₂}`, `I_{s₁}={α₁}`, `A_{s_iw₀}={α_i}` | holds | none |
| 7C.5 GL₂ big cell (r66) | `u(a)n₀e₁` | `(a,1)↦[a:1]`, inverse `x/y`; `u(a)B⁺` constant | holds | none |
| 7b Prop. 8.9 (r66; `dudas-michel` l. 1457) | hypothesis and conclusion | common T; unique factorization; connected | matches | none |
| 7e corner algebra (r66) | `t=e_Ue_V`, `s=e_Ve_Uz_U⁻¹`; U=V | `ts=e_U`; `(st)²=st`; `st=e_V`; U=V gives `t=s=e_U` | holds | none |
| 7f identity (r66) | S₃, `H=⟨(12)⟩`; g=(12), (123), 1 | `1·2=2·1`; `0·2=3·0`; `3·2=6·1` | true; pinned | R04 |
| GL₃ example, q=2 (r66) | line vs plane stabilizer | orders 24 and 24; index 7 = 7 | true; pinned | R04 |
| 9A.1a cocycle, A2 (r66) | α₁<α₂ | `ε(α₁,α₂)=1`, `ε(α₂,α₁)=−1`; `[E₁₃,−E₃₁]=−H_{α₁+α₂}` | holds | none |
| Lift kernel order (r66) | rank 0; A2 | 1; 4=2² | holds | none |
| Folded Cartan matrices (r66) | A3, A4, D4 | `[[2,−2],[−1,2]]`, `[[2,−1],[−2,2]]`, `[[2,−3],[−1,2]]` | holds | none |
| A2 exchange (r66) | e, f, h | `[e,f]=h`; `[h,e]=e`; index of `⟨E,2f,2h⟩` is 4 | holds | none |
| Order-3 Smith form (r66) | `γY=[[0,−1],[1,−1]]` | `γY³=I`; `det(γY−I)=3`; kernel 0 over ℤ, (1,−1) over F₃ | holds | none |
| D_n plus space vs `JB` (r66) | `JB=fromBlocks (2•1) 0 0 JD` | `B(u_n+v_n,u_n+v_n)=2` | holds | none |
| μ₀ projector (r66) | p=2; p=3 | `binom(−4,2)=10≡1`, `binom(−2,2)=3≡0` (mod 3) | holds | none |
| Contraction not monoidal (r66) | `G_m`, weights 1 and p−1 | each contracts to 0; product weight p contracts to 1 | holds | none |
| 10C binary forms (r66) | p=3, n=4; p=2, n=2, 3 | dim L(4)=4; p=2: n=3 gives 4=4, n=2 gives 2≠3 | holds | none |
| 10D `SL₂/N⁺` charts (r66) | `[[a,b],[c,d]]` | `s_a·n(−1/(ac))=s_c`; `d/c−b/a=1/(ac)` | holds | none |
| 11A `P_n→B_n→S_n` (r66) | n=2 | `B₂=ℤ→ℤ/2` has no order-2 lift | holds | none |
| 11B Brieskorn, headline (r66) | A1, A2, B2 | `ℂ*/±1≅ℂ*`, π₁=ℤ; `B₃=Art(A2)`; `stst=tsts` | consistent; absent from Lean | R08 |
| 11C/11D (r66) | GL₂; SL₂ | centralizer `≅ℂ*×ℂ`; `π₁(𝔤_rs)=ℤ` | holds | none |
| π₁ product (r66) | `FundamentalGroup.mul_def` | `p*q=q.trans p` | line 1993 correct | none |
| `characterKernelEquiv` (r66) | `E=ℤˣ×ℤ/2`; `E=ℤ/4` | 2 = 2 twists; 2 = 2 | true; sorry'd data | R09 |
| `finrank_indFromProjectedLevi` (recomputed) | one-term probe | closes by `TauCeti.finrank_indFDRep`; no error | padding | R11 |
| Layer 5 converse (r66) | `SO(2)` over ℝ | `X*(T)(ℝ)=0`; not unipotent | false for k-characters | R16 |
| Layer 8 centre (r66) | `SL_p` in char p | `Z=μ_p`, not smooth | correct | none |
| `Res_{K/k}G_m` (r66) | `K=k(a^{1/p})` | `K⊗k̄=k̄[ε]/(ε^p)`; unipotent part of dimension `p−1` | holds | none |

**Remark on untouched text** (no R-number): none beyond the carried findings.

## Not verifiable

- Howlett–Lehrer (J. Algebra 165, 1994) and Dipper–Du (Crelle 437, 1993) are paywalled and not in the manifest. Layer 7e's common-Levi independence over a general Λ rests on them; `dudas-michel` line 1811 attributes that case to them and proves only Λ = ℂ. Unchanged since the previous review.
- Steinberg's Memoir 80 and Carter's *Finite Groups of Lie Type* are paywalled and cited without locators (R15). No finding depends on them.

## Source issues

- none
