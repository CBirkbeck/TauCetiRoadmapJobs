# Review of ReductiveGroups (pull request #1807 at 3adc047)

**Verdict:** needs changes

The push gate fails at this head (blob 7, sorry-data 5, imports 1, mathlib-subimports 1), and seven findings block. In this folder the pull request changes three README lines (Layer 7g, lines 977–980). As the brief requires, this is a full review of the folder: README, `Suggested.lean` and the seven companion Lean files.

## R01 (P2) — ReductiveGroups and ReductiveGroupsPartII still supply each other; two more two-way supplies with open roadmaps

**Location.** `TauCetiRoadmap/ReductiveGroups/README.md:692`: "**Supplier:** ReductiveGroupsPartII RG2.3.7 owns ordinary q-Frobenius Lang surjectivity … This layer consumes *lang-theorem* and *fixed-coset-lifting*". The same supplier is cited again at lines 715–722 (Layer 7a) and 839 (Layer 7d). Line 1077 (Layer 8) consumes "ReductiveGroupsPartII RG2.0a.1–2".

**Claim.** Layers 7a, 7d and 8 take Lang's theorem, fixed-coset lifting and Weil restriction from ReductiveGroupsPartII. The edit at line 977 drops one of these citations but leaves the other four.

**Witness.** ReductiveGroupsPartII on main has a supplier section "From TauCetiRoadmap.ReductiveGroups" (line 341). Its RG2.3.7 *lang-theorem* has "*Needs:* ReductiveGroups layer 3" (line 5214), and its RG2.3 Dependencies list "ReductiveGroups layers 0, 2, 3, 5, 6 and 7" (line 5501). So the two roadmaps supply each other.

The same holds for two open roadmaps:
- README line 1964 consumes FormalConnectionsOpers F4.3, while that roadmap's "From TauCetiRoadmap.ReductiveGroups" section (#1056 head, line 261) consumes Layers 0–9, 3A.5 and 6B.
- README line 1972 consumes InverseGaloisAndArithmeticFundamentalGroups IG.5.1, whose *Needs* lines cite ReductiveGroups Layers 0, 3 and 6 (#850 head, lines 412 and 1506).

The dependency check reports `0 problem(s)` because roadmaps on main are exempt. That is a false negative for a loop between two roadmaps on main.

**Repair.**
1. Own *lang-theorem* in Layer 7a, with locators milne-iag Prop. 27.54 (p. 487; `milne-iag` line 20248) and Cor. 27.55 (p. 488; line 20264). Milne's proof uses only the closed-orbit lemma, which the pin already has as `TauCeti.SchemeAction.exists_isClosed_orbit`.
2. Own *fixed-coset-lifting* (needs only Mathlib `MulAut`) in Layer 7a as well. Replace the citations at lines 692–696, 715–722 and 839 with these Layer 7a targets.
3. In ReductiveGroupsPartII RG2.3.7, cite ReductiveGroups Layer 7a instead of owning the theorem. Add that folder to this pull request.
4. For line 1077, either state the `Res_{K/k} 𝔾_m` unit functor `R ↦ (K ⊗_k R)ˣ` directly as a Layer 8 target, or move the pseudo-reductive example into ReductiveGroupsPartII.
5. Move Layer 11 into a later Part placed after FormalConnectionsOpers and InverseGaloisAndArithmeticFundamentalGroups. Layer 11 is the only consumer of F4.3 and IG.5.1 (and also of DGFloer, LieGroups Layer 8 and ReflectionInvariantTheory).

## R02 (P2) — `Suggested.lean` has sorry'd data (gate `sorry-data`, 5 hits)

**Location.** `Suggested.lean:134`: "noncomputable def characterKernelEquiv : … (Q →* ℤˣ) ≃* (projection S ρ).ker := by sorry". The other hits are `liftSubgroup` (:89), `characterTwist` (:119), `characterInclusion` (:127) and `liftableExtension` (:143), whose proof fields are `sorry`. The theorem `characterKernelEquiv_value` (:138) is stated about the sorry'd equivalence.

**Claim.** These are data declarations with `sorry` bodies, and `characterKernelEquiv` is an entirely sorry'd group isomorphism. The section also carries a redundant hypothesis `hc` (centrality).

**Witness.**
- The gate output lists all five as sorry-data.
- My scratch probe `probe_central` proves `S.inl s * e = e * S.inl s` for every `S : GroupExtension ℤˣ E Q`, with no `hc`, and it elaborates. A normal subgroup of order two is central.

**Repair.** Delete lines 78–155 (`namespace …CoverLifts` through `end`) and the import `Mathlib.GroupTheory.GroupExtension.Basic`. README 9A.1a-L keeps the lift-group targets. `CoverLiftTargets.lean` imports this block, so it goes too (R04).

## R03 (P2) — `Suggested.lean` states no headline theorem, and its docstring names none

**Location.** `Suggested.lean:17`: "The declarations below are two native signature examples only".

**Claim.** The file is meant to be the roadmap's acceptance test. Here it states no headline theorem and does not say which headlines are unstatable.

**Witness.** README line 628 lists conjugacy of maximal tori as a Layer 7 target, and the pin does not prove it unconditionally: `isMaximalTorus_iff_exists_eq_conjugate` at `TauCeti/Algebra/AlgebraicGroup/Torus/Conjugation.lean:126` carries an extra conjugation hypothesis. The headline is statable on pinned carriers: `HopfIdeal.IsMaximalTorus` (`Torus/Maximal.lean:50`) and `HopfIdeal.conjugate` (`HopfIdeal/Conjugation.lean:75`). My scratch file `SuggestedRepair.lean` states it and elaborates with only the `sorry` warning.

**Repair.**
1. List the headlines in the docstring: maximal-torus conjugacy, Bruhat decomposition, Levi decomposition of parabolic `k`-subgroups, characteristic-zero Levi complements, Lang–Steinberg, the Mackey formula, common-Levi independence, the isomorphism and existence theorems, the Chevalley–Demazure construction, classification of simple modules by `X⁺`, and Brieskorn's theorem.
2. State the statable ones. For example, add `theorem exists_conjugate_eq_of_isMaximalTorus` with `[Field k] [IsAlgClosed k]`, `[Algebra.FiniteType k H]`, `smoothCommHopfAlgProperty`, `geometricallyConnectedCommHopfAlgProperty`, `hI`, `hJ` and conclusion `∃ g : WithConv (H →ₐ[k] k), I.conjugate g = J` (tested).
3. For each headline left unstated, name the missing carrier.

## R04 (P2) — The seven companion Lean files break every `Suggested.lean` form rule (40 sorry'd data definitions)

**Location.**
- `CoverLiftTargets.lean` (5: `isometryGroup`, `isometryMulAction`, `rootEquiv`, `carrierEquiv`, `lieEquiv`)
- `FoldingADETargets.lean` (12, for example `smithKernelEquiv`)
- `IntegralRationalTargets.lean` (3: `integralPBWBasis`, `finiteOrderDistributions`, `jetDualToDistributions`)
- `SignedADETargets.lean` (11, for example `lieRing`, `extension`)
- `SpectralWeylTargets.lean` (9, for example `arrangementArtinEquiv`, `spectralFundamentalEquiv`, `arrangementAction`)

**Claim.** The brief applies the Lean form rules to every listed `.lean` file. These files carry sorry'd data and have further defects:
- They import `Mathlib.*` submodules and this roadmap's own modules (for example `CoverLiftTargets.lean:1` imports `TauCetiRoadmap.ReductiveGroups.SignedADETargets`).
- `BruhatCoordinateTargets.lean` is padding: `upper3_mul` and `wrong_left_complement_overlaps` compute small A2 values.
- `OrbitGeometryTargets.lean:64–69` re-declares `geometricOrbit`, `orbitClosure` and `orbitBoundary`.

**Witness.**
- Tau Ceti already has `TauCeti.SchemeAction.orbit`, `orbitClosure` and `orbitBoundary` (`TauCeti/AlgebraicGeometry/GroupAction/Orbit/Basic.lean:49,62,65`).
- It proves `exists_isClosed_orbit` (`GroupAction/ClosedOrbit.lean:178`) without the `[Smooth G.hom]` and `[IsSeparated X.hom]` that `OrbitGeometryTargets.lean:158` assumes.
- README line 678 calls `coveringHomeomorph` "native", but it is defined in `BruhatCoordinateTargets.lean`.

**Repair.** Delete the seven companion files; the README keeps every statement. Remove the README references to them at lines 121, 151–169, 427–429, 688, 1269–1270, 1297–1299 and 1967–1968.

## R05 (P2) — The README restates as targets theorems the pinned Tau Ceti already proves, and says the library lacks them

**Location.**
- `README.md:202`: "the group-scheme representation map and closed-immersion theorem require their own statements and proofs at full hypotheses".
- `README.md:2043`: "its injectivity remains that lower written target".
- Also lines 206–210, 279–333, 464, 471–477, 621–622, 628, 702–714 and 1064–1069.

**Claim.** The README asks contributors to prove results that are already proved at the pin, and never names those declarations.

**Witness** (all at the Tau Ceti pin, under `TauCeti/`):

| README target | Pinned declaration |
|---|---|
| Embedding into GLₙ (lines 191–210) | `TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear` (`Algebra/AlgebraicGroup/Representation/Embedding.lean:212`) |
| Faithful iff closed immersion (lines 191–205) | `isClosedImmersion_coordinateGroupSchemeHom_iff` (`Representation/Embedding.lean:173`) |
| Orbit local closedness, 3A.2 | `isLocallyClosed_orbit` (`AlgebraicGeometry/GroupAction/LocallyClosed.lean:177`) |
| Closed orbits, 3A.4 | `exists_isClosed_orbit_subset_orbitClosure` (`ClosedOrbit.lean:150`) |
| Cartier smoothness, 5P | `smooth_of_grpObj_of_charZero` (`AlgebraicGeometry/Group/Cartier.lean:32`) |
| Reductive iff linearly reductive in characteristic 0, Layer 6 | `reductiveCommHopfAlgProperty_iff_linearlyReductive` (`Reductive/CompleteReducibility.lean:118`) |
| GLₙ/G quotient, 6B | `isIso_fppfHomogeneousQuotientToCoinvariantsPoints_ker_coordinateBialgHom` (`Fppf/Quotient/Homogeneous/GeneralLinear.lean:56`) |
| Borel conjugacy, Layer 7 | `HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq` (`Borel/Conjugacy/Existence.lean:133`) |
| `G^F ≃ G₀(F_q)`, finiteness and naturality for every 𝔽_q-form, 7a | `FiniteField.rationalPointsMulEquivFixedSubgroupGeometricFrobenius` (`Frobenius/FiniteField.lean:434`) and `finite_fixedSubgroup_frobeniusPoints` (`:299`) |
| Pseudo-reductive predicate and reductive ⇒ pseudo-reductive, Layer 8 | `PseudoReductive/Basic.lean:80, 133, 139` |
| Injectivity of the Weyl–Coxeter map, 11B | `weylCoxeterHom_injective` (`LinearAlgebra/RootSystem/Coxeter/Presentation.lean:158`) |

**Repair.** Name each declaration in a "From Tau Ceti" supplier contract and delete the restated targets. Where a target is genuinely more general than the pinned theorem, keep only that difference as a named target:
- pseudo-reductive equals reductive over perfect fields (the pin has it only over algebraically closed fields);
- Matsushima's quotient for a general reductive pair `A/H` (the pin has `GLₙ/G`).

## R06 (P2) — Layer 3 contradicts its own reference on connectedness and π₀

**Location.** `README.md:243–244`: "geometric connectedness (`A ⊗ k̄` has no nontrivial idempotents, *stronger* than over `k`). Under smoothness (and over a perfect field, or suitable hypotheses) `π₀(G)` is finite étale."

**Claim.** The first sentence says geometric connectedness is stronger than connectedness. The second says π₀(G) is finite étale only under smoothness or similar hypotheses.

**Witness.**
- For an algebraic group, connected ⇔ geometrically connected: `milne-iag` line 785–786 (Prop. 1.14, p. 21) and line 821–824 (Summary 1.17, p. 22). Instances: μ₃ over ℚ is disconnected over both ℚ and ℚ̄; SO(2) over ℝ is connected over both ℝ and ℂ.
- For every affine algebraic group there is an exact sequence `G° → G → π₀(G)` with π₀(G) étale, with no smoothness or perfectness hypothesis: `milne-iag` line 3734–3738 (p. 94). Milne calls it the connected-étale exact sequence. Instance: μ₂ × ℤ/2 over 𝔽₂ is not smooth, has `G° = μ₂`, and π₀ = ℤ/2 is étale.

**Repair.** State that for algebraic groups over a field, connected, geometrically connected and irreducible are equivalent (Milne Summary 1.17). State the identity-component sequence with π₀(G) finite étale for every affine group of finite type (Milne p. 94). Drop "or suitable hypotheses" and the restriction of the term "connected–étale" to finite group schemes.

## R07 (P2) — The fppf and descent prerequisite has no owner (seeded sample "Cross-cutting prerequisite: sheaves and descent")

**Location.** `README.md:124–127`, and `:172–174`: "Develop the fppf sheaf, faithfully-flat descent, torsor, and representability machinery in the cross-cutting lane". Line 1059: "Build the needed sheaf-torsor and descent API here from Layer0 if no lower supplier has it."

**Claim.** No layer of this roadmap is the "cross-cutting lane", and the Layer 8 clause makes ownership conditional. The paragraph carries no locator and no supplier citation.

**Witness.** The prerequisite already has owners:
- SchemeAndStackFoundations §1.1 (descent of quasi-coherent modules and sheaves), §1.15 (torsors) and §2.3 (torsor classes and `H¹`). Its README does not cite ReductiveGroups, so citing it creates no cycle.
- Mathlib `AlgebraicGeometry.Scheme.fppfTopology` (`Mathlib/AlgebraicGeometry/Sites/Fpqc.lean:54`).
- Tau Ceti `CommAlgCat.fppfTopology` (`TauCeti/Algebra/Category/CommAlgCat/Fppf.lean:61`), `fppfQuotientSheaf` (`Algebra/AlgebraicGroup/Fppf/Quotient/Basic.lean:151`) and `faithfullyFlatDescentMulEquiv` (`Algebra/AlgebraicGroup/FaithfullyFlatDescent.lean:143`).

**Repair.** Replace the paragraph and the two clauses with supplier contracts citing those sections and declarations. Keep as targets here only the group-specific results they do not cover: representability of `G/H` and relative descent of reductive group schemes.

## R08 (P3) — Cross-roadmap citations that do not resolve as written

**Location and witness.**
- `README.md:342–343` names ComplexComparisonPartII C−1.1's `.complexPoints`, `.closedSubspace`, `.proper`, `.separatedHausdorff` and `.smooth`. None of these strings occurs at its head (#848); C−1.1 defines `complexSchemeAnalytification`.
- `:357` cites "LieGroupoidsPoisson G0.1 regular-fibre-product prerequisite". LieGroupoidsPoisson line 2028 says SmoothBundlesConnections B1.0 supplies the regular fibres and fibre products that ReductiveGroups cites.
- `:654`, `:1132`, `:1274` and `:2041` use RootSystems' old numbering (Layers 1–4, Layers 5–6, 4A, Layer 2). RootSystems on main maps these to native declarations and §§5.1–5.2 in its table at line 1139.
- `:2111` takes the based fibration long exact sequence from DGFloer Layer 1.2. This same pull request makes AlgebraicTopology Stage 5.5 the owner (AlgebraicTopology README lines 105 and 1022).
- `:380` (AlgebraicVectorBundles) and `:2034` (AlgebraicTopology) give no section.

**Repair.**
- Name C−1.1's actual `complexSchemeAnalytification` and its complex-points, open-subspace and fibre-product comparisons.
- Cite SmoothBundlesConnections B1.0.
- Cite `TauCeti.weylCoxeterSystem`, `TauCeti.DynkinType.simplyConnectedRootDatum` and RootSystems §§5.1–5.2.
- Cite AlgebraicTopology Stage 5.5.
- Add section numbers to the two section-less citations.

## R09 (P3) — Links pinned to commits (gate `blob`, 7 hits)

**Location.** `README.md:521, 1077, 1210, 1388, 1762, 1918, 1972`. For example, `[GroebnerGeometry G5](https://github.com/…/blob/d21bc1c…/README.md)`.

**Witness.** The gate output lists all seven under the blob rule.

**Repair.** Write the roadmap and section as text, for example "GroebnerGeometry §G5" or "IntegralHeckeAndGaloisDeterminants §0.7", or link a path on main.

## R10 (P3) — `Suggested.lean` import header (gates `imports` and `mathlib-subimports`)

**Location.** `Suggested.lean:1–3`: "import TauCeti.RepresentationTheory.Induction.FiniteDimensional.Basic / import Mathlib / import Mathlib.GroupTheory.GroupExtension.Basic".

**Witness.** The gate requires `import Mathlib` first, then only the `TauCeti.*` modules used, and never a `Mathlib.*` submodule.

**Repair.** Use the header of my scratch `SuggestedRepair.lean`: `import Mathlib` followed by the four `TauCeti.Algebra.AlgebraicGroup.*` modules the headline uses. It elaborates.

## R11 (P3) — Padding in `Suggested.lean`

**Location.**
- `Suggested.lean:34` `globalSectionsHopfAlgebra`: its body is the Mathlib instance named in full.
- `:42` `specGroupObject := inferInstance`.
- `:55/:60` `indFromProjectedLevi` and `finrank_indFromProjectedLevi`, proved by `exact TauCeti.finrank_indFDRep`.
- `:99–116` `projection`, `coverAutomorphism`, `coverAction` and `coverAction_projection := l.property.2 e`.

**Witness.** My probe closes `specGroupObject`'s type by `infer_instance`. The other declarations are a one-lemma `exact` or restate the subgroup's defining property.

**Repair.** Delete them from `Suggested.lean`, and delete the embedded Lean block at README lines 154–164. The README keeps the statements.

## R12 (P3) — The README is not in roadmap form

**Location.** Whole file. Headings run `## Standing hypotheses`, `## Remaining roadmap targets` (line 66), `### Layer k`. The README has 0 `**Checks.**` lists, 0 `*Needs:*` lines and 0 `### Examples` or `### Dependencies` sections.

**Witness.** The brief's README shape requires a `**Summary.**`, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, and `## Layer k` sections each ending with Examples and Dependencies. Every definition needs at least three Checks. The README also has:
- status language: "The remaining targets are" (line 101), "do not yet exist" (1652);
- process sections: "Design notes (from Zulip)" and "Acknowledgements" citing a Mathlib pull-request number;
- single-line paragraphs of 2671 and 2147 characters (lines 464 and 678);
- a computation prescribed as proof: "Construct kernel-checkable rational certificates" (line 1464).

**Repair.** Restructure into the house shape: one `*Needs:*` line per target, Checks per definition (the Verified sound section below has computed values ready to use as Checks), Examples and Dependencies per layer. Delete the status and process text. Replace the certificate passage by the generation and Serre-relation theorem for the D4-triality and E6 folds, with a source locator.

## R13 (P3) — Most theorems have no locator

**Location.** Layers 2, 4, 5, 6, 8, 9B and 10 have no theorem-level locators. `README.md:2168–2169` names "Brieskorn's finite-reflection-complement presentation, Salvetti's face/chamber model" without numbers. Gros–Kaneda (line 1714) is a bare link.

**Witness.** The roadmap's `sources.toml` records `brieskorn` Proposition 1, `salvetti` Theorem 1, `gros-kaneda` §1 and `conrad-rgs` Theorem 6.1.16. None of these appears in the README.

**Repair.** Put the recorded locator in parentheses at each claim, for example "(Brieskorn, Proposition 1)" at 11B. Add locators for the Layer 4–6 standard theorems, for example Milne iAG for diagonalizable groups and Nagata's theorem.

## R14 (P3) — No stated order against other open pull requests that change this roadmap

**Location.** The pull request's merge-order paragraph says only "No open pull request must merge before this one."

**Witness.** `scratch/overlaps.md` reports conflicts with this head:
- #1332 and #1676 conflict in `README.md`, `OrbitGeometryTargets.lean` and `SpectralWeylTargets.lean`;
- #1797 conflicts in `README.md`.

**Repair.** In the merge-order paragraph, say which of #1332, #1676 and #1797 is rebased on this pull request (or the reverse).

## Verified sound

**Gate and checks.**
- Worker's gate line at 3adc047: `set_option=0 blob=7 … sorry-data=5 … imports=1 mathlib-subimports=1 … build=0 FAIL`. My re-run gives the same failures.
- My re-run also lists outside-folder files, but they are all among the 13 roadmap folders the brief names as this pull request's own. The brief's diff command shows no other change.
- Dependency check: `depcheck: 238 roadmaps, 2345 edges, 0 problem(s)`, with no UPWARD or CYCLE line. This misses the main-to-main loop (R01).
- `lake env lean Suggested.lean`: only `declaration uses 'sorry'` warnings, at lines 89, 119, 127, 134, 138 and 143.
- `#check @name` for all 15 declarations: no section binder is lost. The README's `finrank ℂ` (line 823) is the complex case of the Lean statement, which holds over any field `k`.

**Probes elaborated in scratch.**
- `Headline.lean` and `SuggestedRepair.lean` (maximal-torus conjugacy) elaborate with only the `sorry` warning.
- `Probe2.lean` closes `specGroupObject` by `infer_instance` and proves centrality for every extension by `ℤˣ` (`probe_central`).

**Seeded sample.**
- "Supplier:" (line 692): RG2.3.7 *lang-theorem* and *fixed-coset-lifting* exist on main (ReductiveGroupsPartII lines 5203, 5260). Their hypotheses (smooth, geometrically connected, finite type) and locators match `milne-iag` line 20248 (Prop. 27.54, p. 487, the Steinberg-endomorphism form) and line 20264 (Cor. 27.55, p. 488). Milne's map `g ↦ gF(g)⁻¹` and the README's `x ↦ x⁻¹F(x)` have the same image (put h = g⁻¹). The locator is sound; the direction of supply is not (R01).
- "Cross-cutting prerequisite": no owner (R07).

**Other locators checked against the source text.**
- Dudas–Michel Prop. 8.9 (`dudas-michel` line 1457–1467, pp. 31–32) matches 7b: same common-torus hypothesis, conclusions (i) and (ii), and uniqueness.
- Dudas–Michel Prop. 8.7(ii) (line 1426) matches the uniqueness clause of 7b.
- Dudas–Michel Thm 9.6 (line 1665–1671, p. 37) matches the 7d Mackey formula: composition order and index set `L^F\S(L,M)^F/M^F`.
- Dudas–Michel Thm 10.1 (line 1808–1813, p. 41) attributes the coefficient-ring case to Howlett–Lehrer and Dipper–Du, as 7e does.
- Conrad–Feng Prop. 12.3.1 (`conrad-feng` line 5345, p. 127) and Appendix H.1 (line 10375–10386, pp. 238–239) match Layer 7.

**Cross-roadmap citations resolved.**
- On main: SchemeAndStackFoundations §§0.3, 0.7, 2.6; SmoothBundlesConnections B1.4; LieGroups Layers 6–8; LieHighestWeight Layers 3, 4 and 7; GroebnerGeometry G5; InductionRestriction Layer 2.1, including `Gassmann.almostConjugate_iff_permutation_equiv` (its `Suggested.lean:729`, so the citations lead is a roadmap name, not a missing library name); ReflectionInvariantTheory; RootSystems via its id map.
- At open heads: IntegralHeckeAndGaloisDeterminants §0.7 (#1689, line 1114: rational cohomology and cofree resolution); ComplexComparisonPartII C−1.1 (#848); FormalConnectionsOpers F4.3 and F6 (#1056); InverseGaloisAndArithmeticFundamentalGroups IG.5.1 and IG.3.2 (#850).

**Ownership against open pull requests.** Checked with `roadmaps show` for ChevalleyGroups, RootSystemsPartII, SpringerResolutionAndCharacteristicCycles, ClassicalGroupsPartII and SchubertGeometry. Each defers to or consumes this roadmap; none owns its objects a second time. Their declared gaps on this roadmap (`lie-invariants`, `regular-borel-torsor`, `generated-vector-base-change`) are their contracts, not findings here.

**Library declarations opened at the pins.**
- Tau Ceti, the declarations listed in R05 and R07, plus `HopfIdeal.IsMaximalTorus` (`Torus/Maximal.lean:50`), `HopfIdeal.conjugate` (`HopfIdeal/Conjugation.lean:75`), `isMaximalTorus_iff_exists_eq_conjugate` (`Torus/Conjugation.lean:126`), `smoothCommHopfAlgProperty` (`Smooth/CommHopfAlgCat.lean:34`), `geometricallyConnectedCommHopfAlgProperty` (`Connected/CommHopfAlgCat.lean:59`) and `GroupAction/Orbit/Basic.lean:49–65`.
- Mathlib: `Sites/Fpqc.lean:54` and `Topology/Homotopy/Lifting.lean`, which has no covering-homeomorphism declaration.

**Adversarial table** (values computed by hand or by `decide`/elaboration):

| # | Statement | Instances | Values on each side | Result |
|---|---|---|---|---|
| 1 | `characterKernelEquiv` (S:134) | Q₈→V₄; ℤ/4→ℤ/2; ℤˣ×ℤ/2 | Hom(Q,±1) has order 4, 2, 2; the kernel is Inn(Q₈) of order 4, {id, x↦−x}, and {id, (s,a)↦(s(−1)^a,a)} | holds; `hc` redundant (R02) |
| 2 | `finrank_indFromProjectedLevi` (S:60) | S₃⊃A₃→ℤ/3, dim M=1; P=G | 2·1=2=dim Ind; 1·d=d | holds; padding (R11) |
| 3 | maximal-torus conjugacy (L7) | GL₂/ℚ̄ with D and gDg⁻¹; 𝔾_a; trivial group | conjugate by g; unique trivial torus; unique | holds; statable (R03) |
| 4 | Lang map (7a) | 𝔾_m/𝔽_q; μ₂/𝔽₃ | x↦x^{q−1} is onto 𝔽̄_q^×; x↦x²=1 misses −1 | connectedness needed and stated |
| 5 | connected vs geometrically connected (L3) | μ₃/ℚ; SO(2)/ℝ | disconnected/disconnected; connected/connected | README claim false (R06) |
| 6 | π₀ finite étale (L3) | μ₂×ℤ/2 over 𝔽₂ | G°=μ₂, π₀=ℤ/2 étale, not smooth | hypothesis unneeded (R06) |
| 7 | rank-one formula (7C, line 657) | SL₂ | LHS [[1+ab,a],[b,1]]; RHS [[c,a],[b,(ab+1)/c]] with c=1+ab | equal |
| 8 | `n_α(a)` (line 658) | SL₂ | [[0,a],[−1/a,0]] | normalizes T |
| 9 | `A_w`, `I_w` (7C.2) | A2, w=s₁ | A_{s₁}={α₂,α₁+α₂}; A_{w₀s₁}={α₂}; I_{s₁}=A_{s₁w₀}={α₁}; A_{s_iw₀}={α_i} | matches README and the `decide` lemmas |
| 10 | cocycle ε (9A.1a) | A2 | ε(α₁+α₂,−α₁−α₂)=(−1)^{−1}=−1; ε(α₁,α₂)/ε(α₂,α₁)=−1=(−1)^{B(α₁,α₂)}; (a,s)(−a,sε(a,−a))=(0,1) | holds |
| 11 | folded Cartan, H-rows (9A.1b) | A3, A4, D4 | A3: c_O=1, [[2,−2],[−1,2]]; A4: c_P=2, [[2,−1],[−2,2]]; D4: [[2,−3],[−1,2]]; A3: B(β_O,β_O)=1=d_O/\|O\| | holds; fixed vertex long |
| 12 | A2 exchange basis | — | [e,f]=h; [h,e]=(2−1)e; index of ⟨E,F,H⟩ is 1·2·2=4; s_γ(α+β)=−1, so the fixed dimension is 3 | holds |
| 13 | γY example | — | γY³=I; Smith form of γY−I is diag(1,3); kernel over ℤ is 0; over 𝔽₃, (1,−1)↦(0,0) | holds |
| 14 | divided-power rule (9A.3) | a=b=1; a=2, b=1 | EF=FE+H; E^(2)F=FE^(2)+(H−1)E, also directly from E²F=FE²+2HE−2E | holds |
| 15 | μ₀ eigenvalues (9C) | p=3, n=0..3; p=2, n=0,1 | 1,0,0,1; 1,0 | projects onto pX; non-monoidal: weights 1 and p−1 go to 0, weight p to 1 |
| 16 | `dim L(n)` (10C) | p=3: n=3, 4, 5 | 2<4; 4<5 (socle x⁴,x³y,xy³,y⁴); 6=n+1 with 5=2·3−1 | criterion `(a+1)p^m−1` holds |
| 17 | char 2, n=2 (10C) | g=[[1,0],[1,1]] | y² ↦ span(x²,y²); xy ↦ −u²+uv | holds |
| 18 | SL₂/N⁺ charts (10D) | — | det s_a = det s_c = 1; t=−1/(ac); u_c=u_a+1/(ac) | holds |
| 19 | extension signs (6A.3) | V=0; a(g)=g·v−v | c_b=c+db with db(g,h)=g·b(h)−b(gh)+b(g); s_a=i(−v)s₀i(v) | holds |
| 20 | `*R` as invariants (7c) | Λ=𝔽_p, U=ℤ/p, N=Λ[U] | coinvariants→invariants is the zero map; README assumes p∈Λˣ | hypothesis needed and stated |
| 21 | unit argument (7e) | general; U=V | ts=e_U; (st)²=st; st·z_V=z_V gives st=e_V; for U=V, t=s=e_U | holds |
| 22 | Gassmann count (7f) | S₃, H=⟨(12)⟩, g=(12), e, (123); Q₈, H=⟨i⟩, g=i, j | 1·2=2·1; 3·2=6·1; 0=0; 2·4=4·2; 0=0 | holds |
| 23 | GL₃ example (7f) | q=2 | GL₂(𝔽₂) is transitive on the 3 lines of ⟨e₂,e₃⟩; a lower unipotent moves e₁+v | P^F, Q^F not conjugate |
| 24 | B_n→S_n nonsplit (11A) | n=2; n=0,1 | ℤ→ℤ/2 has no order-2 lift; trivial | holds |
| 25 | regular nilpotent in GL₂ (11C) | — | centralizer {[[a,b],[0,a]]} ≅ ℂ*×ℂ | holds |
| 26 | SU₂ Weyl lift (11D) | — | [[0,z],[−z̄,0]]² = −I | order 4 |
| 27 | GL₁ coefficients (L1) | 𝔾_m→GL₁ | t generates k[t] ≠ k[t,t⁻¹]; with det⁻¹ it generates k[t,t⁻¹] | holds |

## Not verifiable

- Howlett–Lehrer (J. Algebra 1994), Dipper–Du (Crelle 1993), Carter, Lang (1956), Steinberg (Memoirs 1968), Serre and Gassmann (1926), all cited at README lines 1012–1021. They are not in `sources.toml`, have no theorem locators, and the journals are paywalled; not fetched. The coefficient-ring claim of 7e was checked through `dudas-michel` line 1811–1813 instead.
- `borel`, `springer` and `waterhouse` are settled as uncertified and were not requested.
- Locators of `mcninch`, `gros-kaneda`, `heden`, `brieskorn`, `salvetti` and the other certified manifest entries outside the seeded sample were not opened.
- The three companion files that depend on other roadmap modules (`SignedADETargets`, `FoldingADETargets`, `CoverLiftTargets`) were not elaborated separately. The brief's build covers only `Suggested.lean`.

## Source issues

- none
