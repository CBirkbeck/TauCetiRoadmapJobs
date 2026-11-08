# Review of ReductiveGroups (pull request #1807 at 70140e6)

**Verdict:** needs changes

This pull request changes three lines of `TauCetiRoadmap/ReductiveGroups/README.md` (Layer 7g, lines 977–980). The review covers the whole folder at the head. The gate fails on four rules (R02, R08, R09). The supply edges to ReductiveGroupsPartII that this pull request's edit was meant to cut are still there (R01). And the README and its companion Lean files plan, with `sorry`, a large block of results that the pinned Tau Ceti already proves (R03).

## R01 (P1) — Supply cycle with ReductiveGroupsPartII; the Layer 7g edit does not cut it

**Location.** `TauCetiRoadmap/ReductiveGroups/README.md` 692 ("**Supplier:** ReductiveGroupsPartII RG2.3.7 owns ordinary q-Frobenius Lang surjectivity…"), 715–716, 839 (Layers 7a and 7d), 1076–1078 ("[ReductiveGroupsPartII RG2.0a.1–2] … whose lower dependencies are Layer0 and ModularCurves0F").

**Claim.** This roadmap consumes ReductiveGroupsPartII RG2.3.7 and RG2.0a.1–2. ReductiveGroupsPartII extends this roadmap and consumes it, so the two roadmaps form a two-roadmap cycle. The edit at 977 deletes one sentence that names RG2.3.7 but leaves all four supplier edges. The dependency check misses this because both roadmaps are on main, which it treats as never upward. Line 1078 also misstates the supplier's dependencies. And Layer 8 (1079–1086) plans again the `Res_{K/k} G_m` example that RG2.0a.2 already owns.

**Witness.** ReductiveGroupsPartII README on main: 341 "### From TauCetiRoadmap.ReductiveGroups"; 5214 (*lang-theorem*) "*Needs:* ReductiveGroups layer 3"; 1442 (RG2.0a Dependencies) "ReductiveGroups layers 0, 4, 6 and 7"; 1232–1237 state that `Res_{k'/k} G_m` is smooth, connected and commutative but not reductive.

**Repair.** Make Layer 7a the owner of two results:

- Lang's theorem for the q-Frobenius of a smooth geometrically connected finite-type 𝔽_q-group (Milne, *Algebraic Groups* v2.00, Cor. 27.55, p. 488, milne-iag line 20264; the Steinberg-endomorphism form is Prop. 27.54, p. 487, line 20248).
- The abstract fixed-coset lifting lemma.

ReductiveGroupsPartII RG2.3.7 then cites Layer 7a; that change to ReductiveGroupsPartII records the old → new ids. Delete Layer 8's `Res_{K/k} G_m` paragraph (1076–1090): that example belongs to RG2.0a.2, a consumer of this roadmap. Test: afterwards `ReductiveGroupsPartII` occurs in this README only as a downstream consumer. The open revisions #1332, #1676 and #1797 of this README already move Lang into Layer 7a. Either make the move here, or drop this pull request's ReductiveGroups hunk and say so in the merge-order paragraph (R16).

## R02 (P2) — 45 data declarations with `sorry` bodies (gate: sorry-data)

**Location.** Five in `Suggested.lean`: 89 `liftSubgroup` (`one_mem' := by sorry`), 119 `characterTwist`, 127 `characterInclusion`, 134 `characterKernelEquiv` (`:= by sorry`), 143 `liftableExtension`. Forty more in the companion files:

| File | Count | Examples |
|---|---|---|
| SignedADETargets.lean | 11 | 87 `instance coverGroup … Group.ofLeftAxioms (by sorry) …`; 143 `rootLineQuotientEquiv … := by sorry`; 172 `lieRing` |
| FoldingADETargets.lean | 12 | — |
| SpectralWeylTargets.lean | 9 | 63 `centerHomeomorph … := sorry`; 77 `planeBraidEquiv … := sorry` |
| CoverLiftTargets.lean | 5 | — |
| IntegralRationalTargets.lean | 3 | 107 `integralPBWBasis … := by sorry` |

**Claim.** These are data declarations with `sorry` bodies, which the principles make blocking. The gate fails on the five in `Suggested.lean`.

**Witness.** Gate: "sorry-data: line 89: def liftSubgroup (S : GroupExtension ℤˣ E Q) (ρ : A →* MulAut Q) :" (five hits). A per-declaration scan of the eight `.lean` files finds 45.

**Repair.** Delete these declarations. Where one carries a headline (the integral PBW basis, the Brieskorn isomorphism), restate it as a `theorem` in `Suggested.lean` (R04). The statements I computed are true (table rows 18, 24, 25), so this repairs form, not mathematics. In the `CoverLifts` signatures the centrality hypothesis `hc` is redundant: a normal subgroup of order 2 is central, and `range S.inl = ker S.rightHom` is normal of order 2 for every `GroupExtension ℤˣ E Q`.

## R03 (P2) — README and companion files re-plan results the pinned Tau Ceti already proves

**Claim.** The README states these as open targets, and the companion files give them `sorry`'d Lean forms. The pinned Tau Ceti already proves them, and the folder names none of the declarations below. A search of the folder for `ShellLieAlgebra`, `SignCover`, `SchemeAction`, `exists_isClosedImmersion_generalLinear` and `commHopfAlgCatOpEquivAffineGroupSchemeCat` finds nothing.

**Witness.** Declarations at the Tau Ceti pin:

- **Layer 0 anti-equivalence (README 139–141):** `TauCeti.commHopfAlgCatOpEquivAffineGroupSchemeCat`, `TauCeti/AlgebraicGeometry/AffineGroupScheme/Equivalence.lean:42`.
- **Layer 1 embedding theorem (206–210) and coordinate criterion (191–201):**
  - `TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear`, `TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.lean:212`.
  - `coordinateBialgHom_surjective_iff_matrixCoefficientSubalgebra_sup_antipode_eq_top`, `…/Representation/Faithful/Basic.lean:166`.
- **Layer 3A.2–3A.4 (279–333) and the algebraic part of `OrbitGeometryTargets.lean`:**
  - `TauCeti.SchemeAction.isLocallyClosed_orbit`, `TauCeti/AlgebraicGeometry/GroupAction/LocallyClosed.lean:177`. It needs only locally finite type and quasi-compactness of `G`, not smoothness.
  - `topologicalKrullDim_orbitBoundary_lt` (`:213`).
  - `exists_isClosed_orbit_subset_orbitClosure` and `exists_isClosed_orbit` (`ClosedOrbit.lean:150, 178`).
- **Layer 6 characteristic-zero equivalence (471–477):** `TauCeti.reductiveCommHopfAlgProperty_iff_linearlyReductive`, `…/Reductive/CompleteReducibility.lean:118`.
- **Layer 7 Borel conjugacy (628):** `TauCeti.HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq`, `…/Borel/Conjugacy/Existence.lean:133`.
- **9A.1a–9A.1b (1125–1547), `SignedADETargets.lean`, `CoverLiftTargets.lean`, `FoldingADETargets.lean` and `Suggested.lean` `CoverLifts`:**
  - `Matrix.SignCover` (`TauCeti/LinearAlgebra/Matrix/OrderedSignCover.lean:181`).
  - `Matrix.ShellLieAlgebra.lie_jacobi` and `lieRing` (`TauCeti/Algebra/Lie/NormTwoShell/Basic.lean:676, 715`): Jacobi over ℤ for positive-definite even `B`.
  - `coverEquiv`, `coverEquiv_eq_refl_iff` and `coverLieEquiv` (`NormTwoShell/CoverLift.lean:89, 243, 269`).
  - `isSerreSystem_folded` (`NormTwoShell/Folding.lean:249`).
  - `monodromy` and `negativeCycleEquiv` (`NormTwoShell/FixedBasis.lean:122, 190`).
  - The D₄ root enumeration `natCard_roots = 24` (`TauCeti/LinearAlgebra/Matrix/NormTwoShell/TrialityD4.lean:81`).
- **9B special isogenies (1633–1657, whose carriers the README says "do not yet exist"):**
  - F₄: `specialIsogenyHom_comp_self : specialIsogenyHom ≫ specialIsogenyHom = frobeniusHom` (`TauCeti/Algebra/Lie/F4/ShortRoot/PrimeField/QuotientSpecialIsogeny.lean:297`).
  - G₂: `TauCeti/Algebra/Lie/G2/ShortRoot/PrimeField/SpecialIsogeny.lean`.

**Repair.** Delete these targets and their Lean forms. List each declaration, with its file and hypotheses, in a "From Tau Ceti" supplier contract. Keep only what they do not state. Examples:

- the complex-point comparisons of 3A.5;
- the full-Y comparisons;
- maximal-torus conjugacy without the containment hypotheses that `exists_conjugate_eq_of_isMaximalTorus` (`…/Torus/Conjugation.lean:149`) still carries.

## R04 (P2) — `Suggested.lean` states no headline theorem; statable headlines are absent; the rest is padding

**Location.** `Suggested.lean` 5–23 (docstring: "This file is not the roadmap and is not exhaustive… two native signature examples only"), 34–43, 55–63, 82–150.

**Claim.** The acceptance test states none of the README's headline theorems (list under Verified sound). What it does declare is padding:

- `specGroupObject` is `inferInstance`.
- `globalSectionsHopfAlgebra` re-exports a library instance.
- `finrank_indFromProjectedLevi` closes with one library term.
- `projection`, `coverAutomorphism`, `coverAction` and `coverAction_projection` restate the subgroup's own fields.

The docstring names no unstatable headline. Eleven of its 15 declaration names occur nowhere in the README (`finrank_indFromProjectedLevi`, `liftSubgroup`, `LiftGroup`, `coverAction`, …). The exceptions are `globalSectionsHopfAlgebra`, `specGroupObject`, `indFromProjectedLevi` and the generic word `projection`.

**Witness.** One-tactic probe on a scratch copy, elaborated at the pins:

- `by infer_instance` proves `specGroupObject`'s type, via `AlgebraicGeometry.instGrpObjSpecAsOverSpec`.
- `TauCeti.finrank_indFDRep (A := FDRep.of (M.ρ.comp π))` proves `finrank_indFromProjectedLevi`.

**Repair.** Delete every current declaration (the README keeps the statements). State as `theorem`s with `sorry` the headlines that are statable at the pins and not already proved (R03):

- **Kostant's integral PBW theorem:** the ordered monomials of `IntegralRationalTargets.lean` 93–104 are linearly independent and span the Kostant form `TauCeti.UniversalEnvelopingAlgebra.kostantForm` over ℤ. Its carriers elaborate at the pins.
- **Brieskorn's presentation**, as `Nonempty (FundamentalGroup … ≃* TauCeti.ArtinGroup (coxeterMatrixOfBase P base))`. The carriers in `SpectralWeylTargets.lean` elaborate.

Add only the real-bodied definitions these need. The docstring should name each remaining headline that is not statable at the pins and the carrier it lacks.

## R05 (P2) — Seeded target "Cross-cutting prerequisite: sheaves and descent": no owner, and its objects already have owners

**Location.** README 124–127 ("The functor-of-points comparison, quotients, torsors and representability use the fppf topology and faithfully-flat descent…"), 172–174 ("Develop the fppf sheaf, faithfully-flat descent, torsor, and representability machinery in the cross-cutting lane…"), 1049–1051 and 1059 ("Build the needed sheaf-torsor and descent API here from Layer0 if no lower supplier has it").

**Claim.** No layer owns the "cross-cutting lane", and nothing in it carries a locator. Line 1059 makes ownership conditional. Every object the paragraph lists already exists at the pins or in an earlier roadmap.

**Witness.**

- Mathlib: `AlgebraicGeometry.fppfTopology` (`Mathlib/AlgebraicGeometry/Sites/Fpqc.lean:54`) and `Mathlib/RingTheory/Flat/FaithfullyFlat/Descent.lean`.
- Tau Ceti: `TauCeti.CommHopfAlgCat.fppfQuotientSheaf` (`TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Basic.lean:151`), a group in sheaves on `CommAlgCat.fppfTopology R` for a normal Hopf ideal; and `isPullback_fppfQuotientTorsor` (`…/Fppf/Quotient/Torsor.lean:406`).
- SchemeAndStackFoundations: §1.1 (fpqc descent), §1.15 (torsors), §1.17 (quotients).
- ModularCurves 0E: effective fpqc descent of affine schemes (cited at SchemeAndStackFoundations README 178).

**Repair.** Replace 124–127, 172–174, 1049–1051 and 1059 with a supplier contract naming these declarations and sections; Layer 8 applies them. Test: in characteristic p the cover `t ↦ t^p` of `𝔾_m` by `𝔾_m` is fppf but not étale; its quotient `𝔾_m/μ_p` is `fppfQuotientSheaf` at the normal Hopf ideal `(t^p − 1)`.

## R06 (P2) — 9A.1b prescribes a computational certificate

**Location.** README 1464–1470 ("Construct kernel-checkable rational certificates: for every surviving root-orbit basis vector record a finite Lie word expansion … Verify all rows through the ambient integral bracket laws and exact rational arithmetic").

**Claim.** This is a computation plan in place of mathematics. The principles exclude computational algorithms, and the house style excludes certificates and large computations.

**Witness.** For E₆ reversal the plan records a word expansion for each of the 48 root-orbit basis vectors of the 52-dimensional F₄ inside the 78-dimensional E₆.

**Repair.** Delete the certificate paragraph. Prove generation uniformly, componentwise, by the root-string propagation argument already in the same section (1390–1410). Keep as Checks the counts I recomputed: D₄ has 24 roots, 12 positive, fixed dimension 14; E₆ has 72 roots, 36 positive, fixed dimension 52. Tau Ceti already enumerates D₄ (R03).

## R07 (P2) — Layer 3: false "stronger" claim and needless hypotheses for π₀

**Location.** README 242–244 ("geometric connectedness (`A ⊗ k̄` has no nontrivial idempotents, *stronger* than over `k`). Under smoothness (and over a perfect field, or suitable hypotheses) `π₀(G)` is finite étale.")

**Claim.** For an algebraic group over a field the two notions of connectedness coincide, so "stronger" is false. And π₀(G) is finite étale with no smoothness or perfectness hypothesis.

**Witness.**

- milne-iag lines 785–786 (Prop. 1.14, p. 21) and 821–824 (Summary 1.17, p. 22): connected, geometrically connected and irreducible are equivalent.
- milne-iag lines 3689–3699 (Prop. 5.48, p. 93): `G → π₀(G)` is a quotient onto an étale algebraic group, for every algebraic group.
- Instance: μ_p over 𝔽_p is not smooth, yet it is connected and geometrically connected, and π₀ = Spec 𝔽_p.

**Repair.** Replace with: "For an affine group of finite type over k, connected, geometrically connected and irreducible are equivalent (Milne, Prop. 1.14, Summary 1.17); π₀(G) is a finite étale k-group, the kernel of `G → π₀(G)` is G°, and both commute with field extension (Prop. 5.48)." Tested on μ_p/𝔽_p (π₀ trivial) and μ_3/ℚ (π₀ = μ_3: two k-components, three geometric ones).

## R08 (P3) — Gate: seven links pinned to commits (blob)

**Location.** README 521, 1077, 1210, 1388, 1762, 1918, 1972.

**Witness.** Gate: "blob: line 521: … [IntegralHeckeAndGaloisDeterminants0.7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/1e875b1e…".

**Repair.** Name the roadmap and section instead:

- "IntegralHeckeAndGaloisDeterminants §0.7" (521, 1762);
- "LieHighestWeight Layer 7" via `../RepresentationTheory/LieHighestWeight/README.md` (1210, 1388);
- "GroebnerGeometry G5" (1918);
- "InverseGaloisAndArithmeticFundamentalGroups IG.5.1" (1972).

Line 1077 goes with R01.

## R09 (P3) — Gate: imports; the companion files import Mathlib submodules and sibling modules

**Location.** `Suggested.lean` 1–3; the import headers of all seven companion files: `BruhatCoordinateTargets.lean` 1–5, `OrbitGeometryTargets.lean` 1–9, `IntegralRationalTargets.lean` 1–7, `SignedADETargets.lean` 1–10, `FoldingADETargets.lean` 1–5, `CoverLiftTargets.lean` 1, `SpectralWeylTargets.lean` 1.

**Witness.** Gate: "found: `import TauCeti.RepresentationTheory.Induction.FiniteDimensional.Basic` (line 1), `import Mathlib` (line 2), `import Mathlib.GroupTheory.GroupExtension.Basic` (line 3)". The targeted build compiles only `Suggested.lean`, so `SignedADETargets`, `FoldingADETargets` and `CoverLiftTargets` are compiled by nothing.

**Repair.** In `Suggested.lean`, put `import Mathlib` first, followed only by the `TauCeti.*` modules it uses. Delete the companion files: their declarations fall under R02–R04, and the README keeps the targets.

## R10 (P3) — README is not in roadmap form

**Location.** Top-level headings 9–2225 (`## Standing hypotheses`, `## Remaining roadmap targets`, `## The build, in layers` containing `### Layer k`).

**Claim.** Missing throughout:

- the **Summary.** paragraph, Scope and ownership, Conventions, Exact supplier contracts, and How to read the build;
- any `**Checks.**` list, `*Needs:*` line, or per-layer `### Examples` / `### Dependencies` (zero of each).

Only 8 of 2237 lines carry a theorem or section locator; Layers 0–6, 8, 9B, 10 and 11 have none.

**Witness.** Counts by search of the README at this head.

**Repair.** Restructure into the standard shape: three Checks per definition, a locator at every theorem, Examples and Dependencies per layer. The open revisions #1332, #1676 and #1797 are already in this shape; settle the order (R16).

## R11 (P3) — Process narrative and a pull-request number

**Location.** 66 "## Remaining roadmap targets"; 101 "The remaining targets are…"; 1638 "(`TauCeti.SpStd.specialIsogeny`, done)"; 1652 "that do not yet exist"; 2183 "## Design notes (from Zulip)"; 2231 "the convolution-product work in mathlib4#39281".

**Repair.** Delete these or rephrase them timelessly, and drop the pull-request number.

## R12 (P3) — Layer 11D cites DGFloer for the fibration sequence that this pull request gives to AlgebraicTopology

**Location.** README 2111 ("Apply [DGFloer Layer1.2](../DGFloer/README.md)'s based fiber sequence"), 2115, 2159 ("the based DGF LES").

**Witness.** AlgebraicTopology README at this head, 105: "Stage 5.5 owns the fibration homotopy long exact sequence on native `TauCeti.TopCat.serreFibrations`"; also 1022.

**Repair.** Cite AlgebraicTopology Stage 5.5. Separately, DGFloer at #1798 (line 4251) still has AlgebraicTopology consuming DGFloer's sequence. That two-owner conflict belongs to those folders' reviews.

## R13 (P3) — 9B leaves its construction to a "carrier plan" that the CFSG roadmap does not contain

**Location.** README 1637 ("the CFSG roadmap's carrier plan designates"), 1644, 1650 ("the CFSG roadmap's carrier plan records the construction in detail").

**Witness.** CFSGStatement README on main contains no "carrier plan". It consumes these very bullets ("From TauCetiRoadmap.ReductiveGroups", lines 162–170).

**Repair.** State the carriers and maps here, or cite the pinned Tau Ceti modules (R03), without referring to a consumer's text.

## R14 (P3) — `coveringHomeomorph` is called native

**Location.** README 678 ("The accompanying native `coveringHomeomorph` constructs precisely this comparison").

**Witness.** The name occurs nowhere in Mathlib or Tau Ceti at the pins; it is defined in `BruhatCoordinateTargets.lean:101`.

**Repair.** Delete the sentence. The Mathlib declarations already cited in the same paragraph, `IsCoveringMap.existsUnique_continuousMap_lifts` and `IsCoveringMap.eq_of_comp_eq`, carry the step.

## R15 (P3) — The Layer 7g Lang–Steinberg target has no locator

**Location.** README 978–980 ("the Steinberg Lang–Steinberg theorem and its restricted-subgroup applications are new targets here").

**Witness.** milne-iag lines 20240–20249: Def. 27.53 (some power of F is the Frobenius of a model over a finite subfield, which is 7g's hypothesis) and Prop. 27.54 (p. 487): `g ↦ gF(g⁻¹)` is surjective for every connected group variety.

**Repair.** Cite Milne Prop. 27.54, p. 487, at the target.

## R16 (P3) — Order with the other open pull requests that change this README is not stated

**Location.** This pull request's merge-order paragraph: "No open pull request must merge before this one."

**Witness.** Overlap report computed from the open heads: #1332, #1676 and #1797 conflict with #1807 in `TauCetiRoadmap/ReductiveGroups/README.md`; each rewrites the file (4452, 4095 and 4416 lines). #1854 carries a README identical to this head's.

**Repair.** State which merges first and which rebases. One option: this pull request first, with #1332, #1676 and #1797 rebased so that their Layer 7a ownership of Lang completes R01. The other: drop the ReductiveGroups hunk.

## R17 (P3) — Layer 7f restates InductionRestriction's fixed-coset identity

**Location.** README 959–966 (the display `Nat.card (MulAction.fixedBy (G ⧸ H) g) * Nat.card H = …`).

**Witness.** InductionRestriction README on main, Layer 2.1 (346–380), displays the same identity as its own target.

**Repair.** Cite "InductionRestriction Layer 2.1, fixed-coset identity" and delete the display.

## Verified sound

**Gate.** The worker's gate and my rerun agree:

```text
gate ReductiveGroups: … blob=7 … sorry-data=5 … imports=1 mathlib-subimports=1 … depcheck=0 … stray-files=0 … FAIL
```

The rerun also reports `outside-folder=21`. Those are the other roadmap folders of this pull request, which the brief names as its own, so they are not a finding. The worker's run also reports `build=0`.

**Dependency check.**

```text
depcheck: 239 roadmaps, 2424 edges, 0 problem(s)
```

The check exempts edges between roadmaps on main, so it does not see R01.

**Elaboration.**

- `lake env lean` on `Suggested.lean`: six `declaration uses 'sorry'` warnings, no error.
- `BruhatCoordinateTargets`, `OrbitGeometryTargets`, `IntegralRationalTargets` and `SpectralWeylTargets` elaborate, after `lake build` of their 18 `TauCeti.*` imports.
- `#check @` of all 15 `Suggested.lean` declarations: no binder lost. One generality difference: `finrank_indFromProjectedLevi` holds over any field `k`, while README 823 says ℂ. Its deletion is covered by R04.

**Seeded sample.**

- **"Supplier:" (README 692).** RG2.3.7 exists on main at ReductiveGroupsPartII README 5201. *lang-theorem* there is stated for smooth, geometrically connected groups of finite type and cites Milne Prop. 27.54 (p. 487) and Cor. 27.55 (p. 488). I checked both at milne-iag lines 20248–20268, where "group variety" means smooth. *fixed-coset-lifting* is at line 5260. The README's description of the hypotheses matches; the defect is the direction of supply (R01).
- **"Cross-cutting prerequisite: sheaves and descent".** No locator to verify; the owner gap is R05.

**Other locators checked.**

- dudas-michel: Prop. 8.7 (lines 1424–1427, p. 31) and Prop. 8.9 (lines 1457–1467, p. 32) match README 744–753. Thm 9.6 with (9.7)–(9.8) (lines 1665–1686, pp. 37–38) matches the Mackey statement and the piece bijection at 856–876. Thm 10.1 (lines 1808–1814, p. 41) matches 7e, and its proof sketch matches 891–896.
- conrad-feng: Prop. 12.3.1 (lines 5345–5346, p. 127) and the dynamic Levi existence (lines 5335–5339) match README 636–637.
- milne-iag: lines 781–786, 821–824 and 3689–3699 (R07).

**Library declarations opened at the pins.** Each is named, with file and line, in R03, R05 and R14. Also checked:

- Mathlib `RootPairing.chainBotCoeff` (`Mathlib/LinearAlgebra/RootSystem/Chain.lean:120`): q is the bottom of the α-string, so `|N_{α,β}| = q + 1` in `IntegralRationalTargets.lean` 56 is right.
- Mathlib `Aut` multiplication `x * y = y.trans x` (`Mathlib/CategoryTheory/Endomorphism.lean:145–146`), matching README 1992–1993.
- Tau Ceti `TauCeti.finrank_indFDRep`.
- 66 of the 67 README library names I checked resolve at the pins; the exception is `coveringHomeomorph` (R14).

**Cross-roadmap citations resolved.**

- ReductiveGroupsPartII RG2.3.7 (5201) and RG2.0a (943).
- IntegralHeckeAndGaloisDeterminants §0.7 (its head #1689, line 1114; 27th in the merge order).
- InductionRestriction Layer 2.1 (346), with `Gassmann.almostConjugate_iff_permutation_equiv` at its `Suggested.lean:729`. The resolver's "found nowhere" lead on this name is a false lead.
- SchemeAndStackFoundations §§0.3, 0.7, 2.6 at this head (551, 755, 3437).
- LieHighestWeight Layer 7 (931), LieGroups Layer 8 (428), SmoothBundlesConnections B1.4 (421), DGFloer Layer 1 (451).
- InverseGaloisAndArithmeticFundamentalGroups IG.5.1 (at its head, 5416).
- ChevalleyGroups and CFSGStatement consume Layer 9 and do not supply it.
- RootSystemsPartII (#1731, README 9) leaves §9A.1b to this roadmap.

**Ownership against open pull requests.** Searched by object (closed-orbit lemma, Brieskorn presentation, diagram folding, sign cover) in all 478 open heads. Only this roadmap's own revisions (#1332, #1676, #1797) and RootSystemsPartII (which defers to it) appear, so there is no second owner among new roadmaps.

**Headline theorems** (README), with their status at the pins:

1. Anti-equivalence of commutative Hopf algebras and affine group schemes: proved in Tau Ceti (R03).
2. Embedding into GLₙ, and the coordinate criterion for faithfulness: proved (R03).
3. Closed-orbit lemma: proved (R03).
4. Char 0: reductive ⇔ linearly reductive: proved (R03). Char p: a smooth connected linearly reductive group is a torus: statable, with no locator.
5. Levi decomposition in characteristic zero (6A): not checked for statability.
6. Matsushima's affineness of A/H (6B): not checked for statability.
7. Conjugacy of Borels: proved (R03). Bruhat decomposition, and the parabolic Levi theorem (Conrad–Feng 12.3.1): not stated.
8. Lang (supplier; R01) and Lang–Steinberg (R15).
9. Prop. 8.9, the Mackey formula and common-Levi independence (Dudas–Michel).
10. Isomorphism and existence theorems (Layer 8).
11. Chevalley–Demazure schemes, Kostant's integral PBW theorem (statable, R04), special isogenies (proved, R03).
12. Distribution algebras and Gros–Kaneda (9C).
13. The classification of simple modules by X⁺, and the Steinberg module.
14. dim L(n) for SL₂.
15. Algebraic Peter–Weyl.
16. Brieskorn's presentation (statable, R04).
17. Chevalley restriction and π₁ of the regular-semisimple locus `𝔤_rs`.

**Adversarial table**

| # | Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|---|
| 1 | 7a supplier *lang-theorem* | 𝔾_m, 𝔾_a, μ₂/𝔽₃ | 𝔾_m: `g^{q−1}` onto F̄_q^× (divisible); 𝔾_a: `g^q−g` onto F̄_q; μ₂: `z⁻¹z³ = z² = 1`, misses −1 | holds; connectedness needed | R01 (direction only) |
| 2 | *fixed-coset-lifting* | ℤ/4, σ=−1, J={0,2}; S₄, J=⟨(123)⟩, σ=conj (12) | coset {1,3} σ-stable, fixed points {0,2}; Lang on J = −2z = 0 (fails); S₄: z⁻¹σ(z) = z⁻² = z, bijective | holds, hypothesis sharp | none |
| 3 | Cross-cutting fppf/descent | 𝔾_m/μ_p, char p; G/1 | `t ↦ t^p` fppf, not étale; G/1 = G | owner missing | R05 |
| 4 | `G^F ≃ G₀(𝔽_q)` | GL₂, q=2 | fixed matrices = GL₂(𝔽₂), order 6 = (4−1)(4−2) | holds | none |
| 5 | DM Prop 8.9 | GL₃: P=Q=B; P=G | B∩B = T⋉U with L∩M=T, U∩V=U, others 1; G∩Q = M⋉V with L∩V=V, M∩U=1 | holds | none |
| 6 | 7e corner units | general; L=G | `ts = e_U e_V e_U z_U⁻¹ = z_U z_U⁻¹ = e_U`; `(st)z_V = e_V e_U e_V = z_V`; L=G gives e_U=e_V=t=s=1 | holds | none |
| 7 | 7f fixed-coset identity | S₃, H=⟨(12)⟩, g=e,(12),(123) | LHS 3·2, 1·2, 0·2; RHS 6·1, 2·1, 3·0 | holds | R17 (cite) |
| 8 | GL₃ worked example | q=2 | \|G/P\|=\|G/Q\|=7; GL₂(𝔽₂) transitive on 3 lines, so Q fixes no line | holds | none |
| 9 | 7C rank-one formula | SL₂ | LHS `[[1+ab,a],[b,1]]`; RHS with t=1+ab, `a'=a/t`, `b'=b/t` gives `[[t,a],[b, ab/t+1/t]] = [[t,a],[b,1]]`; `n_α(a) = [[0,a],[−a⁻¹,0]]` | holds | none |
| 10 | 7C.2 root sets | A₂, w=s₁ | `A_{s1}={α₂,α₁+α₂}`, `A_{w0 s1}={α₂}`, `I_{s1}={α₁}`; `I_w = A_{w w0}` | holds | none |
| 11 | 7C.3 contraction cocharacter | any base | `⟨α_i,ρ∨⟩ = 1`, so `⟨β,2ρ∨⟩ = 2 ht β > 0` | holds | none |
| 12 | Layer 1 coefficient criterion | `𝔾_m → GL₁` | coefficients give k[t] ≠ k[t,t⁻¹]; with the antipode, t⁻¹ is added | holds | R03 (already in Tau Ceti) |
| 13 | Layer 3 connectedness, π₀ | μ_p/𝔽_p, μ₃/ℚ | μ_p: one point, non-smooth, π₀ = Spec 𝔽_p; μ₃: Spec ℚ ⊔ Spec ℚ(ζ₃), three geometric points | "stronger" false; smoothness unneeded | R07 |
| 14 | Char-0 reductive ⇔ linearly reductive | 𝔾_a, 𝔾_m | 𝔾_a: `[[1,t],[0,1]]` not completely reducible, not reductive; 𝔾_m: both hold | holds | R03 |
| 15 | Closed-orbit lemma | ℂ* on P¹ by `t·[u:v]=[tu:v]`; char p `[t^p u:v]` | orbits {0},{∞} closed, dim 0 < 1 = dim ℂ*; char p: stabilizer μ_p, orbit-map differential 0 | holds | R03 |
| 16 | 9A.1a sign cover | A₂ with α₁<α₂; inverse | `ε(α₁+α₂,−α₁−α₂) = (−1)^{1·(−1)} = −1`; commutator `(−1)^{B(a,b)}`; `(a,s)(−a,sε(a,−a)) = (0,1)` | holds | R03 |
| 17 | 9A.1b folding | A₃, A₄, D₄; A₂; `γY=[[0,−1],[1,−1]]` | `C=[[2,−2],[−1,2]]`, `[[2,−1],[−2,2]]`, `[[2,−3],[−1,2]]`; A₂: [e,f]=h, [h,e]=e, index 4; `det(γY−I) = 3`, Smith (1,3), `(γY−I)(1,−1)ᵀ = (0,3) ≡ 0 mod 3`, `γY³ = I` | holds | R06 (certificate) |
| 18 | `Suggested.lean` `CoverLifts` | `E = ℤˣ×C₂`; Q=1; Q₈ | \|Hom(C₂,ℤˣ)\| = 2 = \|ker\|; Q=1: 1=1; closure laws of `liftSubgroup` verified by hand; ±1 central in Q₈ | true; `hc` redundant | R02/R04 (delete) |
| 19 | `finrank_indFromProjectedLevi` | P=G; P=1, L=1 | index 1, equal dimensions; index \|G\|, regular representation of dimension \|G\| | holds; one-term proof | R04 (padding) |
| 20 | 10C binary forms | p=3, n=4; p=2, n=2 | `binom(4,i) mod 3 = 1,1,0,1,1`, dim L(4) = 2·2 = 4; `g·xy = cd x² + xy + ab y²` generates R₂, y² only ⟨x²,y²⟩ | holds | none |
| 21 | 10D SL₂/N⁺ charts | overlap | `s_a n(t) = [[a,at],[c,ct+a⁻¹]]`, so t = −1/(ac) gives s_c; `u_c = u_a + 1/(ac)` | holds | none |
| 22 | 11A non-split `B_n → S_n` | n=2 | an order-2 section image has exponent sum 0 (even), but a transposition has sign −1 | holds | none |
| 23 | 11C/D remarks | GL₂ regular nilpotent; SU₂ | centralizer `{[[a,b],[0,a]]} ≅ ℂ*×ℂ`; `(nt)² = n² = −1`, order 4 | holds | none |
| 24 | Kostant integral PBW (headline) | 𝔾_m (no roots), adjoint A₁ | basis `binom(H,b)`; α∨ = 2y keeps all of Y | holds, statable | R04 |
| 25 | Brieskorn (headline) | rank 1, A_{n−1} | V_reg = ℂ*, W = ±1, quotient ℂ* via z ↦ z²; π₁ = ℤ = Art(A₁); type A gives B_n | holds, statable | R04 |
| 26 | Layer 8 `Res_{K/k} 𝔾_m` | K = k(a^{1/p}); K = k | unipotent kernel of dimension p−1; K = k gives 𝔾_m | holds; already in Part II RG2.0a.2 | R01 |
| 27 | 7g Lang–Steinberg | Milne Def. 27.53 | 7g's hypothesis is exactly Def. 27.53; Prop. 27.54 proves the statement | holds | R15 |
| 28 | 9B special isogeny | F₄, char 2 | Tau Ceti `τ ≫ τ = frobeniusHom` | holds, proved | R03, R13 |
| 29 | 11D π₁ isomorphism | fibre G/T | connected and simply connected, so π₁(𝔤_rs) ≅ π₁(B_W) | holds | R12 (supplier) |
| 30 | Layer 1 embedding theorem | μ_p, 𝔾_a | μ_p ⊂ GL₁ closed; `t ↦ [[1,t],[0,1]]` closed in GL₂ | holds, proved | R03 |

## Not verifiable

- **Howlett–Lehrer (J. Algebra 165, 1994) and Dipper–Du (Crelle 437, 1993).** Behind a paywall and not in the manifest; the README gives no theorem locator for them. The coefficient-general claim of 7e rests here only on Dudas–Michel's attribution (dudas-michel lines 1811–1813).
- **Lang 1956, Steinberg 1968, Carter §1.17, Serre §§2.3/3.3, Gassmann 1926.** No text in the cache and not in the sample. Waterhouse, Borel and Springer are settled as uncertified.
- **McNinch, Gros–Kaneda and Hedén locators.** Not in the seeded sample; not checked.
- **`SignedADETargets.lean`, `FoldingADETargets.lean` and `CoverLiftTargets.lean`.** Not elaborated: they import uncompiled `TauCetiRoadmap.ReductiveGroups.*` modules, and building those is outside the commands this review may run. The five definitions of `Suggested.lean` show the same pattern.

## Source issues

- none
