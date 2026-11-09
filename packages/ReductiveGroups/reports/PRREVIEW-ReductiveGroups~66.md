# Review of ReductiveGroups (pull request #1854 at 1ccc517)

**Verdict:** needs changes

The pull request changes three lines of this folder (Layer 7g, `README.md` lines 977–980). This is a full review of the folder at that head: `README.md`, `Suggested.lean` and the seven companion `*Targets.lean` files.

## R01 (P2) — ReductiveGroups and ReductiveGroupsPartII supply each other

**Location.** `TauCetiRoadmap/ReductiveGroups/README.md` line 692: “**Supplier:** ReductiveGroupsPartII RG2.3.7 owns ordinary q-Frobenius Lang surjectivity, its quotient/H¹ consequences, and generic fixed-coset lifting.” The same citation appears at lines 715–722 (Layer 7a), line 839 (Layer 7d) and lines 1076–1078 (Layer 8, “ReductiveGroupsPartII RG2.0a.1–2”).

**Claim.** Layers 7a, 7d and 8 consume ReductiveGroupsPartII, which extends this roadmap and consumes its Layers 0–9. The two roadmaps therefore cite each other as suppliers (defect class 14). There is no cycle between layers, only between the two roadmaps. RG2.3.7 needs Layer 3 and RG2.0a needs Layer 0; Layers 7a, 7d and 8 here then consume RG2.3.7 and RG2.0a. This pull request's Layer 7g edit removes one sentence that cited RG2.3.7, but these four citations remain. The dependency check prints `0 problem(s)` because it never flags a roadmap on main as an upward supplier, so it cannot see this pair.

**Witness.** ReductiveGroupsPartII README on main:
- line 341 opens “From TauCetiRoadmap.ReductiveGroups: Layer 0 is assumed …”;
- line 5214 (RG2.3.7 *lang-theorem*) reads “*Needs:* ReductiveGroups layer 3”;
- line 977 (RG2.0a) reads “*Needs:* ReductiveGroups layer 0”.

**Repair.**
- **Lang's theorem.** Own the q-Frobenius Lang theorem in Layer 7a, as the Frobenius case of Layer 7g's Lang–Steinberg target. Hypotheses: smooth, geometrically connected, finite type. Locators: `milne-iag` line 20248 (Prop. 27.54, p. 487, Steinberg endomorphisms) and line 20264 (Cor. 27.55, p. 488). Add the constant group μ₂ over `F_q`, `q` odd, as a Check: there the Lang map is `z ↦ z^{q−1} = 1` and misses `−1` (`milne-iag` line 20275).
- **Fixed-coset lifting.** Own it in Layer 7a as an elementary group-theory target. It has no smoothness hypothesis, so line 694's wording ("under their stated smoothness and geometric connectedness hypotheses") is wrong for it. Add `ℤ/4`, `σ = −1`, `J = {0,2}` as a Check.
- **Layer 8.** Replace the RG2.0a citation with the pinned `TauCeti.Algebra.WeilRestriction.multiplicativeGroupPoints` and `instSmooth` (`TauCeti/Algebra/AlgebraicGroup/MultiplicativeGroup/WeilRestriction/Basic.lean:65`), `geometricallyConnectedCommHopfAlgProperty_multiplicativeGroup` (`…/WeilRestriction/Connected.lean:233`), and ModularCurves §0F for general finite-locally-free Weil restriction.
- Then delete all four ReductiveGroupsPartII citations. RG2.3.7 becomes a consumer of Layer 7a.

## R02 (P2) — Supply in both directions with FormalConnectionsOpers, InverseGaloisAndArithmeticFundamentalGroups and LieGroups

**Location.** `README.md`:
- line 1964: “The lower smooth/holomorphic dictionary of FormalConnectionsOpers F4.3 … is a prerequisite for the analytic charts here”;
- lines 1972 and 1996: IG.5.1 and IG.3.2;
- line 358: LieGroups Layer 6; line 606: LieGroups Layer 7; line 2104: LieGroups Layer 8.

**Claim.** Each of these three roadmaps consumes this one, and this one cites each of them as a supplier.

**Witness.**
- FormalConnectionsOpers (head of its open pull request) line 1641, §4.3: “*Needs:* … ReductiveGroups Layers 0–4 (3A.5 included), 6–9”.
- InverseGaloisAndArithmeticFundamentalGroups (open head) line 412: “ReductiveGroups Layers 0, 3 and 6”.
- LieGroups (main) line 1428: “ReductiveGroups Layers 0–4, 6 and 7C”.

**Repair.**
- Move Layer 11 into a ReductiveGroups Part placed after FormalConnectionsOpers and InverseGaloisAndArithmeticFundamentalGroups. Layer 11 is the only consumer of F4.3, IG.5.1, IG.3.2 and LieGroups Layer 8.
- Delete the LieGroups comparisons at lines 354–358 (3A.5) and 604–607 (6A), or hand them to LieGroups, which already consumes Layers 3A and 6.
- After this, no layer of this roadmap cites these three roadmaps.

## R03 (P2) — Theorems already proved at the Tau Ceti pin are restated as targets

**Location.** `README.md`:
- line 206: “Embedding theorem. Prove that every affine group scheme of finite type has a faithful finite-dimensional representation / closed immersion into GLₙ”;
- lines 324–333: 3A.4, closed orbits;
- lines 471–477: reductive ⇔ linearly reductive in characteristic 0;
- lines 621–622: Matsushima for `GL_n/G`;
- line 628: Borel conjugacy;
- lines 702–704: `G^F ≃ G₀(F_q)`;
- lines 1079–1080: `Res_{K/k} G_m` is smooth, connected and commutative.

**Claim.** All of these are written as “prove/construct” targets, and line 66 lists them under "Remaining roadmap targets". The pinned Tau Ceti (2fd255d) already proves each of them.

**Witness.**
- `TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear` (`Algebra/AlgebraicGroup/Representation/Embedding.lean:212`)
- `TauCeti.SchemeAction.exists_isClosed_orbit` (`AlgebraicGeometry/GroupAction/ClosedOrbit.lean:178`)
- `TauCeti.HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq` (`Borel/Conjugacy/Existence.lean:133`)

**Repair.**
- Move each item into a “From Tau Ceti” supplier contract under its exact name and file, and delete it as a target. The pinned declarations:
  - `reductiveCommHopfAlgProperty_iff_linearlyReductive` (`Reductive/CompleteReducibility.lean:118`);
  - `TauCeti.Comodule.isIso_fppfHomogeneousQuotientToCoinvariantsPoints_ker_coordinateBialgHom` (`Fppf/Quotient/Homogeneous/GeneralLinear.lean:56`);
  - `TauCeti.FiniteField.rationalPointsMulEquivFixedSubgroupGeometricFrobenius` (`Frobenius/FiniteField.lean:434`);
  - `TauCeti.AlgebraicGeometry.smooth_of_grpObj_of_charZero` (`AlgebraicGeometry/Group/Cartier.lean:32`);
  - the Weil-restriction declarations listed in R01.
- Keep as targets only what the pin lacks:
  - Matsushima for a general reductive `A`, since the pin covers `A = GL_n` only;
  - pseudo-reductivity and non-reductivity of `Res_{K/k} G_m`;
  - the Lang application adapters.

## R04 (P2) — Layer 7f restates the pinned fixed-coset identity and the GL₃ example, and says neither is proved

**Location.** `README.md` lines 954–964: “The arithmetic identity below is an independent target of that layer; this roadmap does not treat it as already proved … The target identity is …”. Also lines 996–1004 (the GL₃ worked example) and lines 950–952 (`Gassmann.AlmostConjugate`).

**Claim.** The displayed identity is a theorem at the Tau Ceti pin with exactly this statement, so the README's statement that it is not yet proved is false. The GL₃ example is the case `n = 3` of a pinned theorem.

**Witness.**
- `Subgroup.natCard_fixedBy_mul_natCard` (`TauCeti/GroupTheory/QuotientGroup/Basic.lean:177`) states the identity verbatim.
- `TauCeti.almostConjugate_lineStabilizer_hyperplaneStabilizer` (`LinearAlgebra/Matrix/GeneralLinearGroup/LineHyperplane.lean:241`) covers the line and hyperplane stabilizers of `GL_n(K)` for finite `K`.

**Repair.**
- Delete the identity block and the "does not treat it as already proved" sentence, and cite `Subgroup.natCard_fixedBy_mul_natCard`.
- Use the pinned `Subgroup.AlmostConjugate` and `Subgroup.almostConjugate_iff_forall_natCard_fixedBy_eq` (`TauCeti/GroupTheory/AlmostConjugate.lean:92`, `:231`). Replace `Gassmann.AlmostConjugate` and `Gassmann.almostConjugate_iff_permutation_equiv`; the latter is only an InductionRestriction target (its `Suggested.lean:729`).
- Make the GL₃ example a Check of the Harish–Chandra adapter that cites the pinned line/hyperplane theorem. At `q = 2` both subgroups have order 24 and index 7 in a group of order 168.
- Layer 7f then owns only the Harish–Chandra-to-permutation adapter.

## R05 (P2) — RootSystems citations use retired ids and say Tits' injectivity is unproved

**Location.** `README.md` lines 2042–2044: “Native `weylCoxeterHom` supplies the map and surjectivity, but its injectivity remains that lower written target.” Also line 654 (“RootSystems Layers1–4”), line 1132 (“Layers5–6”), line 1274 (“RootSystems4A”) and line 2041 (“Layer2”).

**Claim.**
- RootSystems has replaced its six-layer numbering. Its table maps the old ids to native declarations and to §5.1.
- Injectivity of `weylCoxeterHom` is already proved at the pin.

**Witness.**
- `TauCeti.weylCoxeterHom_injective` (`LinearAlgebra/RootSystem/Coxeter/Presentation.lean:157`) and `TauCeti.weylCoxeterSystem` (`:167`).
- RootSystems README (main) line 1139: “4A: Weyl/based factorization | §5.1, with §5.2 for diagrams”.

**Repair.**
- In 11B, cite `TauCeti.weylCoxeterSystem` and `TauCeti.weylCoxeterHom_injective` and delete the "remains that lower written target" clause.
- Point line 1274 at RootSystems §5.1 and §5.2.
- Replace “Layers1–4” and “Layers5–6” with the native declarations the RootSystems table lists:
  - old Layers 1–4: `TauCeti.posRoots`, `TauCeti.inversions`, `RootPairing.dominantChamber`;
  - old Layers 5–6: `TauCeti.existsUnique_dynkinType`, `TauCeti.DynkinType.simplyConnectedRootDatum`.

## R06 (P2) — The sampled “Cross-cutting prerequisite: sheaves and descent” has a second owner and no locator

**Location.** `README.md`:
- lines 124–127: “The functor-of-points comparison, quotients, torsors and representability use the fppf topology and faithfully-flat descent …”;
- lines 172–174: “Develop the fppf sheaf, faithfully-flat descent, torsor, and representability machinery in the cross-cutting lane”;
- lines 1059–1060: “Build the needed sheaf-torsor and descent API here from Layer0 if no lower supplier has it.”

**Claim.**
- These lines make this roadmap the owner of generic fppf/fpqc descent, sheafification and torsors, with no locator and no supplier.
- SchemeAndStackFoundations already owns this material, and the pin has much of it.
- The "if no lower supplier has it" clause leaves the scope undecided.

**Witness.**
- SchemeAndStackFoundations at this head: §1.1 (line 2071, `qcoh_fpqc_descent`, `sheaf_stack`) and §1.15 (line 2502, `IsTorsor`).
- Tau Ceti modules `Algebra/AlgebraicGroup/Fppf/Quotient/Torsor.lean` and `AlgebraicGeometry/Descent/Affine.lean`.

**Repair.**
- Replace the paragraph, the Layer 0 bullet and lines 1059–1060 with a supplier contract naming:
  - SchemeAndStackFoundations §1.1, §1.5 and §1.15;
  - ModularCurves §0E for effective affine descent;
  - the Tau Ceti Fppf and Descent modules, by declaration.
- Keep here only the group-specific comparisons (Hopf/points carriers, and the vector-group torsors of 6A.1), each with a locator.

## R07 (P2) — Layer 9A.1b prescribes computational certificates

**Location.** `README.md` lines 1464–1470: “Construct kernel-checkable rational certificates: for every surviving root-orbit basis vector record a finite Lie word expansion … Verify all rows through the ambient integral bracket laws and exact rational arithmetic”.

**Claim.** This makes a large finite computation the proof of D4-triality → G₂ and E6-reversal → F₄. That is a computational algorithm, which the principles exclude.

**Witness.** The prescribed records cover the 72 roots of E6 and a 52-dimensional fixed algebra. The uniform argument at lines 1371–1410 already gives generation through orbit-sum bracket words and the Serre relations for every type.

**Repair.**
- Delete the certificate paragraph.
- State that the fixed algebra is of type G₂ (dimension 14) for D4 under triality and of type F₄ (dimension 52) for E6 under reversal. Make these consequences of the uniform folding theorem, with a source locator.
- Keep the counts 24/12, 72/36 and 14/52 as Checks.

## R08 (P2) — Suggested.lean states no headline theorem, and its docstring names none as not statable

**Location.** `Suggested.lean` lines 16–22 (the docstring) and every declaration (lines 34–150).

**Claim.** The file holds two library abbrevs, a finite-induction dimension identity and a generic API for lifts to central extensions. None of these is a README headline. The README's headlines include:
- Lang–Steinberg (7a/7g);
- the characteristic-zero Levi decomposition (6A);
- the Bruhat decomposition (7);
- the parabolic Mackey formula and common-Levi independence (7d/7e);
- the isomorphism and existence theorems (8);
- `Dist_A(G_A) ≃ A ⊗ U_ℤ` (9C);
- the classification of simples by `X⁺` and the Steinberg module (10B);
- Brieskorn's presentation (11B);
- `π₁(𝔤_rs) ≅ π₁(B_W)` (11D).

At least two of these are statable at the pins.

**Witness.**
- ReductiveGroupsPartII `Suggested.lean:212` states `Lang.lang_surjective` against the same pins (Tau Ceti 2fd255d, Mathlib 1b1ccf4). It uses `TauCeti.FiniteTypeCommHopfAlgCat`, `smoothCommHopfAlgProperty` and `geometricallyConnectedCommHopfAlgProperty`.
- The carriers for Brieskorn's theorem exist at the pin: `TauCeti.ArtinGroup`, `TauCeti.coxeterMatrixOfBase` and `TauCeti.rootPairingBaseChange`, as used in `SpectralWeylTargets.lean:253–291`.

**Repair.**
- In the docstring, list the headlines, and for each one that is not statable name the missing carrier.
- State Lang–Steinberg once R01 makes it this roadmap's own.
- State Brieskorn's theorem as `theorem … : Nonempty (FundamentalGroup B b ≃* TauCeti.ArtinGroup (TauCeti.coxeterMatrixOfBase P base))`. Take `B` to be the image of the complement in the W-orbit space, built the same way as `SpectralBase` (`SpectralWeylTargets.lean:182`), so that no sorry'd action is needed.
- State 11D as bijectivity of `FundamentalGroup.map` of the spectral projection, not as a sorry'd equivalence.

## R09 (P2) — Sorry'd data in Suggested.lean and in the companion files

**Location.**
- `Suggested.lean`:
  - line 134: `characterKernelEquiv … := by sorry`, a `MulEquiv`, which line 138 mentions;
  - defs with sorry'd fields at line 89 (`liftSubgroup`), line 119 (`characterTwist`), line 127 (`characterInclusion`) and line 143 (`liftableExtension`). The gate reports `sorry-data` 5.
- Companion files: 17 defs or instances whose entire body is `sorry`, for example:
  - `SpectralWeylTargets.lean:263`, `arrangementAction`, a `MulAction` instance on which `ArrangementBase` and `arrangementArtinEquiv` depend;
  - `:234`, `spectralFundamentalEquiv`;
  - `FoldingADETargets.lean`: `fixedIntegralBasis`, `smithKernelEquiv`;
  - `SignedADETargets.lean`: `rootLineQuotientEquiv`, `normalizationEquiv`.

**Claim.** The principles forbid sorry'd data and anything that mentions it.

**Witness.** `lake env lean` on `Suggested.lean` reports `declaration uses sorry` at the defs on lines 89, 119, 127, 134 and 143, and at line 138.

**Repair.**
- Delete these definitions from `Suggested.lean`. State any headline among them as a `theorem` over real-bodied carriers (see R08).
- Delete the companion files, or cut each down to the few real-bodied definitions that a headline in `Suggested.lean` needs.
- The README keeps all the targets.

## R10 (P3) — Imports break the single `import Mathlib` rule

**Location.**
- `Suggested.lean` lines 1–3: `import TauCeti.RepresentationTheory.Induction.FiniteDimensional.Basic`, then `import Mathlib`, then `import Mathlib.GroupTheory.GroupExtension.Basic`.
- Every companion file imports `Mathlib.<submodule>` lines (e.g. `BruhatCoordinateTargets.lean:1–5`, `FoldingADETargets.lean:5–12`) and other companion modules.

**Witness.** Gate failures `imports` (1) and `mathlib-subimports` (1).

**Repair.** `import Mathlib` first, then only the `TauCeti.*` modules actually used. Any companion file that survives R09 follows the same rule.

## R11 (P3) — Padding in Suggested.lean

**Location.**
- line 34, `globalSectionsHopfAlgebra`: an abbrev for the native instance;
- line 42, `specGroupObject`: just `inferInstance`;
- lines 55–64: `indFromProjectedLevi` and `finrank_indFromProjectedLevi`;
- lines 99–116: `projection`, `coverAutomorphism`, `coverAction` and `coverAction_projection`.

**Claim.** Each of these restates a library declaration or follows in one term, and none is a headline.

**Witness.** One-term probe in a scratch copy, elaborated with no error: `finrank_indFromProjectedLevi` closes by `TauCeti.finrank_indFDRep (A := FDRep.of (M.ρ.comp π))`. `coverAction_projection` is the single term `l.property.2 e`.

**Repair.** Delete them from `Suggested.lean`; the README keeps the statements. Update the docstring to match.

## R12 (P3) — Links pinned to commits

**Location.**
- `README.md` lines 521, 1077, 1210, 1388, 1762, 1918 and 1972 link the roadmap repository at fixed commits (gate `blob`, 7).
- Lines 464, 678 and 1249 link Mathlib at 6b7abb3, and line 103 links Tau Ceti at a91d3aa. Neither is a pin (the pins are Mathlib 1b1ccf4 and Tau Ceti 2fd255d).

**Witness.**
- At the Mathlib pin, `IsCoveringMap.existsUnique_continuousMap_lifts` is at `Topology/Homotopy/Lifting.lean:489`, but the README's anchor is `#L477`.
- `IsNilpotent.exp` is at `RingTheory/Nilpotent/Exp.lean:51`, but the README's anchor is `#L50`.

**Repair.**
- Cite roadmaps by name and section: IntegralHeckeAndGaloisDeterminants §0.7, ReductiveGroupsPartII RG2.0a, LieHighestWeight Layer 7, GroebnerGeometry G5, InverseGaloisAndArithmeticFundamentalGroups IG.5.1.
- Cite library declarations by name and file, with no commit links.

## R13 (P3) — Edits outside the pull request's own folders

**Location.** The pull request's diff changes `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`.

**Witness.** Gate `outside-folder` (2). Neither folder is listed among this pull request's own folders.

**Repair.** Move these two loop cuts into their own pull request, or declare both folders as this pull request's own so that each is reviewed.

## R14 (P3) — No stated order relative to three open pull requests that change this README

**Location.** `README.md` lines 977–980, this pull request's only hunk in the folder. The description's merge-order paragraph names only #1101, #1807 and #1808.

**Claim.**
- #1332, #1676 and #1797 all change `ReductiveGroups/README.md`, and each conflicts with this head.
- #1332's head already contains the same Layer 7g sentence.
- #1797, by the same author, rewrites Lang ownership so that Layer 7a owns Lang's theorem.

**Witness.**
- ReductiveGroups README at #1332, line 2420: “Lang statement in Layer 7a covers the standard-Frobenius case”.
- At #1797, lines 13–15: “Layer 7a owns Lang's theorem … ReductiveGroupsPartII extends this roadmap and consumes it”.

**Repair.** In the description's merge-order paragraph, say which of #1797, #1332, #1676 and this pull request merges first, and rebase the others on it. Alternatively, drop this hunk and leave the Layer 7a/7g ownership change to #1797, without restating what that pull request already changes.

## R15 (P3) — README shape, Checks, *Needs:* lines, locators, timelessness

**Location.** The whole README.
- Missing sections: `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`.
- No layer ends with `### Examples` and `### Dependencies`.
- No definition has an API list or `**Checks.**`.
- There are no `*Needs:*` lines.
- Most theorems carry no locator: 6A (Mostow), 7 (Bruhat), 8 (classification), 10B (Steinberg module), and 11B (Brieskorn, lines 2168–2171).
- Process words: “Remaining roadmap targets” (line 66), “done” (line 1638), “that do not yet exist” (line 1652), “remain construction targets until proved” (line 2171), “Design notes (from Zulip)” (line 2183).

**Witness.** Compare CFSGStatement on main (lines 12, 47, 89, 185, 226, 232) or RootSystems.

**Repair.**
- Rewrite in house shape: per layer, prose targets, `*Needs:*` lines item by item, Checks with computed values, and Examples and Dependencies.
- The worked values already in the text become Checks, for example lines 1171–1173, 1498–1500, 1534–1536 and 1839–1842.
- Delete the process words.

## R16 (P3) — The ⚠ note on characters overstates the converse

**Location.** `README.md` lines 447–449: “a *connected unipotent* group has no nontrivial characters; the converse needs solvability.”

**Claim.** Read with characters over `k`, the converse ("a smooth connected solvable group with no nontrivial characters is unipotent") is false over any field that is not algebraically closed.

**Witness.** `SO(2) = {x² + y² = 1}` over ℝ is a connected solvable torus with no nontrivial ℝ-characters, and it is not unipotent. The norm-one torus of `F_{q²}/F_q` is another example.

**Repair.** Write “no nontrivial characters over `k̄`”, and add `SO(2)` over ℝ as a negative Check.

## R17 (P3) — Dead pointers into CFSGStatement

**Location.** `README.md` lines 1102 and 2207 (“milestone L5”). Lines 1644, 1645 and 1650 (“the CFSG roadmap's carrier plan records the reason”, “… records the construction in detail”).

**Witness.** CFSGStatement on main has Layers 1–5 and no milestone called "L5". The phrase “carrier plan” does not occur in it. Its section “From TauCetiRoadmap.ReductiveGroups” (line 162) is a consumer contract.

**Repair.** Specify the G₂ and F₄ carrier constructions, and the reason for working over the prime field, here, with a locator. Cite CFSGStatement only as a consumer, by its present layer number.

## Verified sound

**Gate, build and elaboration.**
- The worker's gate at 1ccc517 fails on `blob` 7, `sorry-data` 5, `imports` 1, `mathlib-subimports` 1 and `outside-folder` 2. The build passes (`build=0`).
- My rerun of the gate reproduces the blob, sorry-data and import counts. It reports `outside-folder=34` only because my invocation was not given the pull request's own folder list.
- `lake env lean TauCetiRoadmap/ReductiveGroups/Suggested.lean` succeeds in 7 s. The only warnings are six `declaration uses sorry`.
- I ran `#check @…` in one scratch file for the 11 non-trivial declarations. Every explicit binder (`hc`, `[P.FiniteIndex]`, `S`, `ρ`) is present in the elaborated types, which agree with the worker's `signatures.md` (16 declarations, none missing a binder). I changed nothing.

**Dependency check.** Output: `depcheck: 238 roadmaps, 2343 edges, 0 problem(s)`. This misses the two-way pairs of R01 and R02, because roadmaps on main are never treated as upward suppliers.

**Sampled targets.**
- “Supplier:” (line 692): RG2.3.7 exists on main (ReductiveGroupsPartII README line 5201), with *lang-theorem* (line 5203) and *fixed-coset-lifting* (line 5260). Its Lean statement `Lang.lang_surjective` (ReductiveGroupsPartII `Suggested.lean:212`) assumes smoothness and geometric connectedness, matching README line 716. The source supports it: `milne-iag` line 20240 (Definition 27.53, Steinberg endomorphism), line 20248 (Prop. 27.54, p. 487), line 20264 (Cor. 27.55, p. 488), line 20269 (Cor. 27.56) and line 20275 (failure for `ℤ/2`). The locator is correct; the defect is the direction of supply (R01).
- “Cross-cutting prerequisite” (line 124): it has no locator. I checked its ownership claim against SchemeAndStackFoundations §1.1 (line 2071), §1.5 (line 2167) and §1.15 (line 2502) at this head, and against Tau Ceti `Fppf/Quotient/*` and `AlgebraicGeometry/Descent/*` (R06).

**Other locators checked.**
- `dudas-michel` line 1457, Prop. 8.9: the hypothesis that L and M contain a common T, the factorization, uniqueness and connectedness all match README lines 749–753.
- `dudas-michel` line 1808, Thm. 10.1: common-Levi independence, attributed over general Λ to Howlett–Lehrer and Dipper–Du and proved there for Λ = ℂ, matching lines 905–906.
- `conrad-feng` line 5345, Prop. 12.3.1, p. 127: U(k) acts simply transitively on Levi factors, and each maximal k-torus lies in a unique Levi, matching lines 637 and 744–745.

**Library declarations opened at the pins.**

Tau Ceti:
- `Representation/Embedding.lean:212`
- `GroupAction/ClosedOrbit.lean:178`
- `Borel/Conjugacy/Existence.lean:133`
- `Group/Cartier.lean:32`
- `Reductive/CompleteReducibility.lean:118`
- `Fppf/Quotient/Homogeneous/GeneralLinear.lean:56`
- `Frobenius/FiniteField.lean:434`
- `QuotientGroup/Basic.lean:177`
- `AlmostConjugate.lean:92` and `:231`
- `LineHyperplane.lean:241`
- `Coxeter/Presentation.lean:87`, `:157` and `:167`
- `Coxeter/Matrix.lean:278`
- `Coxeter/Artin.lean:121` and `:273`
- `MultiplicativeGroup/WeilRestriction/Basic.lean:65` and `Connected.lean:233`
- `Tannaka/GroupFunctor.lean:138`

Mathlib:
- `Topology/Homotopy/Lifting.lean:489`
- `Topology/Covering/Basic.lean:367`
- `RingTheory/Nilpotent/Exp.lean:51`
- `GroupTheory/GroupExtension/Defs.lean:73`
- `Algebra/Lie/Classical.lean`: `JB`, `JD`, `typeBEquivSo'` (line 373), `soIndefiniteEquiv` (line 224)
- `AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean:44` (`mul_def : p * q = .of (q.asHom.trans p.asHom)`, which confirms README line 1993)

Of the 135 backticked names in the README, all are found at the pins except `AlgPoints` and `LinearAlgebraicGroup` (named only as things to avoid), three mathematical variables, and `Gassmann.almostConjugate_iff_permutation_equiv` (an InductionRestriction target; see R04).

**Cross-roadmap citations resolved (24).**
- Resolve to the cited section:
  - IntegralHeckeAndGaloisDeterminants §0.7 (open head, line 1114)
  - SchemeAndStackFoundations 0.3, 0.7, 2.6 (lines 551, 755, 3437 at this head)
  - ComplexComparisonPartII C-1.1 (open head)
  - SmoothBundlesConnections B1.1 and B1.4 (lines 315, 421)
  - LieGroupoidsPoisson G0.1 (line 299)
  - LieGroups Layers 6–8 (main)
  - IntegralLattices (main)
  - LieHighestWeight Layers 3, 4 and 7 (lines 405, 537, 931)
  - InductionRestriction Layer 2.1 (line 346)
  - FormalConnectionsOpers F4.3 and F6 (lines 1414, 1860)
  - IG.5.1 and IG.3.2 (lines 5425, 2710)
  - AlgebraicTopology, ReflectionInvariantTheory (main)
  - DGFloer Layer 1, item 2 (main)
  - GroebnerGeometry G5 (line 394)
  - ModularCurves §0E and §0F (lines 839, 886)
  - ReductiveGroupsPartII RG2.3.7 and RG2.0a (main)
- Stale: RootSystems (R05) and CFSGStatement (R17).

**Ownership against the closest open roadmaps.** ChevalleyGroups (main) consumes Layer 9 and leaves the scheme-level special isogenies to 9B. SchubertGeometry, SpringerResolutionAndCharacteristicCycles (which declares a gap on this roadmap, `gap:lie-invariants`), RootSystemsPartII and ClassicalGroupsPartII all cite this roadmap as their supplier. I found no further double ownership.

**Adversarial table.**

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 7a Lang (sampled; `milne-iag` l. 20264) | `G_m`, `G_a`, `μ₂` over `F_q` with q odd | `x↦x^{q−1}` is onto `F̄^×`; `x↦x^q−x` is onto `F̄`; on μ₂, `z↦z^{q−1}=1` misses −1 | true; connectedness is needed | R01 (direction) |
| 7g Steinberg endomorphism (`milne-iag` l. 20240) | `Frob_q` on `GL_n`; identity; τ on Sp₄ in char 2 | fixed points `GL_n(F_q)`, finite; identity: no power is a Frobenius, so excluded; `τ²=Frob₂`, so included | definition determines the class | none |
| Fixed-coset lifting | `ℤ/4`, σ=−1, J={0,2}; J=1 | Lang map on J is 0, not onto J; coset {1,3} is σ-stable but the σ-fixed elements are {0,2}; J=1 is trivial | Lang hypothesis needed; no smoothness hypothesis | R01 wording |
| Cross-cutting descent (sampled) | owners | SchemeAndStackFoundations §1.1 l. 2071, §1.15 l. 2502; Tau Ceti `Fppf/Quotient/Torsor.lean` | second owner | R06 |
| Layer 1 faithfulness criterion | `G_m→GL₁`; `μ_p⊂G_m` in char p | `t` generates `k[t]` ≠ `k[t,t⁻¹]`; with `det⁻¹` it generates; `μ_p(k)=1`, yet `k[t^±]→k[t]/(t^p−1)` is onto | true; already pinned | R03 |
| 3A.4/3A.7 closed orbits | `G_m` on P¹ by `[tu:v]`; C₂ swap; `[t^p u:v]` | {0}, {∞} closed of dim 0; open orbit dim 1 with boundary {0,∞} of dim 0 < 1; {0,∞} is a closed disconnected orbit; scheme stabilizer μ_p | true; already pinned | R03 |
| 6 reductive ⇔ linearly reductive (char 0) | `G_m`, `G_a` (char 0), `SL₂` (char p) | `G_m`: both true; `G_a`: `t↦[[1,t],[0,1]]` not completely reducible, not reductive; `SL₂` in char p: `∇(p)` is indecomposable and not simple | true as scoped; already pinned | R03 |
| 6A.3 cocycle and coboundary | product `(v,g)(w,h)` | `s_b(g)s_b(h)=i(b(g)+g·b(h)+c(g,h)−b(gh))s_b(gh)`, so `c_b=c+db`; `i(−v)s₀(g)i(v)=i(g·v−v)s₀(g)` | both identities hold | none |
| 6A stabilizer of a Levi | `L×G_a` | `C_U(L)=U=G_a`; the complement set is one point | holds | none |
| 7C.2 root subsets | A2 with w=s₁; `s_iw₀` | `A_{s₁}={α₂,α₁+α₂}`, `I_{s₁}={α₁}`; `A_{w₀s₁}={α₂}` (overlap); `A_{s_iw₀}={α_i}` | holds | none |
| 7C.5 GL₂ big cell | `u(a)n₀e₁` | `=(a,1)↦[a:1]`, inverse `x/y`; `u(a)B⁺` constant | holds | none |
| 7b Prop. 8.9 (`dudas-michel` l. 1457) | hypothesis and conclusion | common T in L and M; unique factorization; connected | matches | none |
| 7e corner algebra | `t=e_Ue_V`, `s=e_Ve_Uz_U⁻¹`; U=V | `ts=e_U`; `(st)²=st`; `st·z_V=z_V`, so `st=e_V`; for U=V, `t=s=e_U` | holds, given the unit statements | none |
| 7e betweenness | `W=(W∩U)(W∩V)` | `e_Ae_B=e_W` since `|W|=|A||B|/|A∩B|`; hence `e_Ue_We_V=e_Ue_V` | holds | none |
| 7f identity | S₃, `H=⟨(12)⟩`, g = (12), (123), 1 | `1·2` vs `2·1`; `0·2` vs `3·0`; `3·2` vs `6·1` | true; already pinned | R04 |
| GL₃ example, q=2 | P stabilizes a line, Q a plane | both orders `1·6·4=24`; index 7 = number of lines = number of planes; Q^F has no invariant line | true; already pinned | R04 |
| 9A.1a cocycle (A2, α₁<α₂) | commutator; A2 rejection test | `ε(α₁,α₂)=1`, `ε(α₂,α₁)=−1`, ratio `−1=(−1)^{B}`; `ε(α₁+α₂,−α₁−α₂)=−1`; `[E₁₃,−E₃₁]=−H_{α₁+α₂}` | holds | none |
| Lift kernel order | rank 0; A2 | `1`; `4=2²` | holds | none |
| Section change σ | one reversed edge | `ε′/ε` exponent `a_ib_j+a_jb_i` = `(a+b)_i(a+b)_j−a_ia_j−b_ib_j` | holds | none |
| 9A.1b `ε(a,b)s_γ(a+b)=s_γ(a)s_γ(b)ε(γa,γb)` | general | the reversed-edge exponent sums agree mod 2 | holds | none |
| Folded Cartan matrices (H rows, E columns) | A3, A4, D4 triality | `[[2,−2],[−1,2]]`, `[[2,−1],[−2,2]]`, `[[2,−3],[−1,2]]`; for A4, `B(β,β)=1` and `1/2` | holds | none |
| A2 exchange | e, f, h | `[e,f]=h`; `[h,e]=(2−1)e`; index of `⟨E,2f,2h⟩` is 4; `x_{α+β}↦−x_{α+β}` (μ=−1) | holds | none |
| Root-free order-3 example | `γY=[[0,−1],[1,−1]]` | `γY³=I`; `det(γY−I)=3`, Smith form (1,3); kernel over ℤ is 0; over F₃ it is spanned by (1,−1) | holds | none |
| D_n plus space vs native `JB` | `JB = fromBlocks (2•1) 0 0 JD` | `B(u_n+v_n,u_n+v_n)=2` | holds | none |
| Kostant opposite-root rule | a=b=1 | r=0 gives `fe`; r=1 gives `binom(h,1)=h`; so `ef=fe+h` | holds | none |
| μ₀ projector | p=2; p=3 with n=−3, −1, 1, 3 | `binom(n−1,1)≡n−1 (mod 2)`; `binom(−4,2)=10≡1`, `binom(−2,2)=3≡0`, `binom(0,2)=0`, `binom(2,2)=1` | projects onto pX | none |
| Contraction is not monoidal | `G_m`, weights 1 and p−1 | both contract to 0; the tensor product has weight p, which contracts to weight 1 | holds | none |
| 10C binary forms | p=3, n=4; p=2, n=2; n=3 | dim L(4) = 2·2 = 4 (x⁴, x³y, xy³, y⁴); `(−cu+av)²=c²u²+a²v²`; p=2: n=3 gives 4=4 (simple), n=2 gives 2≠3 | holds | none |
| 10D `SL₂/N⁺` charts | `[[a,b],[c,d]]` | `s_a·n(−1/(ac))=[[a,−1/c],[c,0]]=s_c`; `d/c−b/a=1/(ac)` | holds | none |
| 11A disc map; `P_n→B_n→S_n` | n=2 | inverse map recomputed; `B₂=ℤ→ℤ/2` has no order-2 lift | holds | none |
| 11B Brieskorn (headline) | A1, A2, ∅, B2 | `ℂ*/±1≅ℂ*`, `π₁=ℤ=Art(A1)`; `B₃=Art(A2)`; a point; `⟨s,t \| stst=tsts⟩` | consistent; absent from Suggested.lean | R08 |
| 11C/11D | regular nilpotent in GL₂; SL₂ | centralizer `[[a,b],[0,a]]≅ℂ*×ℂ`; `B_W=ℂ*`; `SL₂/T` is simply connected, so `π₁(𝔤_rs)=ℤ` | holds | none |
| Mathlib π₁ product | `FundamentalGroup.mul_def` | `p*q=q.trans p` | README line 1993 correct | none |
| `characterKernelEquiv` | `E=ℤˣ×ℤ/2`; `E=ℤ/4` | `#Hom(ℤ/2,±1)=2`; kernel lifts {id, χ-twist} = 2; for ℤ/4, {id, x↦−x} = 2 | true; `hc` redundant (a normal subgroup of order 2 is central); sorry'd data | R09 |
| Layer 5 converse | `SO(2)` over ℝ | `X*(T)(ℝ)=0`, not unipotent | false for k-characters | R16 |
| Layer 8 centre | `SL_p` in char p | `Z=μ_p`, not smooth | README correct | none |
| `Res_{K/k}G_m` | `K=k(a^{1/p})` | `K⊗k̄=k̄[ε]/(ε^p)`; unipotent part has dimension `p−1=[K:k]−1` | holds | none |

## Not verifiable

- Howlett–Lehrer (J. Algebra 165, 1994) and Dipper–Du (Crelle 437, 1993): paywalled, and not in the manifest. Layer 7e relies on them for common-Levi independence over a general Λ with p invertible. `dudas-michel` line 1811 attributes that case to them and proves only Λ = ℂ. I did not look further.
- Steinberg, *Endomorphisms of Linear Algebraic Groups* (Memoirs AMS 80) and Carter, *Finite Groups of Lie Type*: paywalled. They are cited without theorem locators (R15), and no finding depends on them.

## Source issues

- none
