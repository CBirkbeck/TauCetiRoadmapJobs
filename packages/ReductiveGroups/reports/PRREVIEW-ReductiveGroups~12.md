# Review of ReductiveGroups (pull request #1676 at b4b5bc5)

**Verdict:** needs changes

Full review of the ten listed files at `b4b5bc5c0a05b2db0c5fca66e7d7609f5387e76e`. The pull request changes nothing outside `TauCetiRoadmap/ReductiveGroups/` (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ReductiveGroups'` is empty). Against main the folder differs in `README.md` (+563/−285 lines in total), `Suggested.lean` (rewritten) and the new `SpecialLinearCoordinateTargets.lean`; the seven other companion files are byte-identical to main. The worker's gate at this head passes every check; the dependency check prints `depcheck: 204 roadmaps, 1543 edges, 0 problem(s)`.

## Status of the previous review's findings (head 73b05b0)

| Previous | Passage at this head | Status |
|---|---|---|
| R01 proper ⇒ commutative | README 76–80 names `isCommMonObj_of_isProper_of_geometricallyIntegral` with both hypotheses; Check 172–175 gives S₃ | Repaired. |
| R02 reciprocal suppliers | README 798 “Supplier: ReductiveGroupsPartII RG2.3.7 owns ordinary q-Frobenius Lang surjectivity”; 2207 FormalConnectionsOpers F4.3 “is a prerequisite for the analytic charts here”; 2215 IG.5.1 | Not repaired for Lang, FCO and IG; repaired for Weil restriction (157–158 now cites ModularCurves §0F). R01 below. |
| R03 missing 9B.1–9B.3 | README 1753–1832 now state 9B.1–9B.3 with Conrad locators | Repaired. |
| R04 admitted data | `Suggested.lean` has none; `SpecialLinearCoordinateTargets.lean:16` and the six other companions keep 41 | Repaired in Suggested only. R04 below. |
| R05 headline coverage | `Suggested.lean` 69–138 states the five orbit theorems and the SL presentation; docstring 10–25 lists missing carriers | Partly repaired; two statable headlines still absent. R03 below. |
| R06 descent ownership | README 16–19, 146–158, 219–221 cite SchemeAndStackFoundations §1.1, §§1.5, 1.13–1.15 and ModularCurves §§0E–0F | Repaired; the sections exist on main (SSF 2071, 2167, 2418, 2458, 2502; MC 386, 412). |
| R07 commit-pinned links | gate `blob=0`; remaining blob links point at the pinned libraries only | Repaired. |
| R08 imports | `Suggested.lean` 1–2 is `import Mathlib` plus one Tau Ceti module; companions unchanged | Repaired in Suggested only. R04 below. |
| R09 padding | the instance aliases and `coverAction_projection` are deleted | Repaired in Suggested only. |
| R10 form, locators, Checks | Summary, Scope, Conventions, supplier contracts, How to read exist; most layers still lack Examples/Dependencies, Needs lines and Checks | Partly repaired. R07 below. |
| R11 computational certificates | “certificate” no longer occurs in the README | Repaired. |
| R12 isometry subgroup | README 21–22, 166–169, 1353–1354 cite `TauCeti.BilinForm.isometryGroup`; `CoverLiftTargets.lean:13` still defines its own | Repaired in README only. R04 below. |

No repair report marking any of these “not actionable in this package” was supplied; R01 and R04 are re-raised below with the reason the earlier repair is incomplete.

## R01 (P1) — Three suppliers also consume this roadmap

Re-raised: R02 of the previous review.

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:798` “Supplier: ReductiveGroupsPartII RG2.3.7 owns ordinary q-Frobenius Lang surjectivity”; also 821–825, 960–961, 1099–1100; `README.md:2207–2208` “FormalConnectionsOpers F4.3 … is a prerequisite for the analytic charts here”, 2324–2325, 2342–2343; `README.md:2214–2215` “Consume the early configuration contract InverseGaloisAndArithmeticFundamentalGroups IG.5.1”, 2239.

**Claim:** Each of these three roadmaps consumes ReductiveGroups, so each citation closes a cycle. A cycle between two roadmaps is a design defect whatever the layer order inside them.

**Witness:** `TauCetiRoadmap/ReductiveGroupsPartII/README.md` on main, line 25: “It extends the Reductive groups roadmap … which remains the owner of … layers 0–9”; line 5214 (RG2.3.7 *lang-theorem*): “Needs: ReductiveGroups layer 3”; line 5245: “Needs: lang-theorem; ReductiveGroups layer 0”. FormalConnectionsOpers at its open head, README 240–252 “From TauCetiRoadmap.ReductiveGroups: Layers 0–9 …” and 1575 (F4.3 itself): “Needs: §2.4; §4.2; ReductiveGroups Layers 1–4, 6–9”. InverseGaloisAndArithmeticFundamentalGroups at its open head, README 394 and 1453: “Needs: … ReductiveGroups Layer 6”.

The mechanical check reports no CYCLE because ReductiveGroups is a main roadmap outside `ORDER.txt` and these three citations are prose, not `*Needs:*` lines; the edges are nonetheless stated in both directions.

**Repair:** Make this roadmap the owner of what it needs, or move the consuming layers out. Concretely: (a) state Lang's theorem (smooth, geometrically connected, finite type over `F_q`, `x ↦ x⁻¹F(x)` onto geometric points) and fixed-coset lifting as Layer 7a targets with the Milne v2.00 locators the Part II section uses, and let Part II cite Layer 7a; (b) in Layer 11 replace the FCO F4.3 citation by ComplexComparisonPartII C−1.1 (which cites no ReductiveGroups section) plus the Layer 3A.5 point-map comparison already planned here, or move Layer 11 to a Part III placed after FormalConnectionsOpers; (c) in 11A replace IG.5.1/IG.3.2 by the native `TauCeti.BraidGroup`, `BraidGroup.pureSubgroup` and `permHom` (present at the pin) with the plane-configuration comparison as an 11A target. Test: with (a) the constant `C₂` over `F_2` (Lang image `{1}`, misses the other point) and `G_a` over `F_2` (`θ² − θ = 1` for `θ² + θ + 1 = 0` in `F_4`) remain the positive and negative controls of 7a's Checks 841–845.

## R02 (P2) — Layer 1 and Layer 6 plan theorems Tau Ceti proves at the pin

**Location:** `README.md:238–257` “Embedding theorem. Prove that every affine group scheme of finite type has a faithful finite-dimensional representation / closed immersion into GLₙ”; 249–252 “the group-scheme representation map and closed-immersion theorem require their own statements and proofs”; `README.md:577–583` (Layer 6, linear reductivity).

**Claim:** The embedding theorem, the faithful ⇔ closed-immersion ⇔ coefficient-generation criterion, and the implication “linearly reductive geometric fibre ⇒ reductive” are proved in the pinned Tau Ceti and must be cited in `## Exact supplier contracts`, not restated as targets.

**Witness:** `TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.lean:118` `TauCeti.Comodule.exists_coordinateBialgHom_surjective [Algebra.FiniteType k H]` (a finite-dimensional regular subcomodule with surjective `O(GLₙ) → H`), and the module's `exists_isClosedImmersion_coordinateGroupSchemeHom` and `TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear`; `Representation/Faithful/Basic.lean:221` `TauCeti.Comodule.IsFaithful`, 161 `coordinateBialgHom_surjective_iff_matrixCoefficientSubalgebra_sup_antipode_eq_top` (the `V ⊕ Vˇ` criterion of README 243–248), 249 `isClosedImmersion_coordinateGroupSchemeHom_iff_of_bases`; `Reductive/LinearlyReductive.lean` `of_smooth_of_geometricallyConnected_of_baseChange_linearlyReductive` (its docstring: “the converse implication in characteristic zero is a separate development”).

**Repair:** Delete the Layer 1 targets at 238–257 except the Tannakian transport (258–266), and list the four declarations above with their files under `### From Tau Ceti`, noting the pin's universe restriction (same universe for `k` and `H` in the group-scheme form). In Layer 6 cite the pinned implication and keep only the characteristic-zero converse as the target. Test: for `G_m` with the standard character the criterion at the pin needs the antipode image of `t`, i.e. `t⁻¹`, exactly as README 246–247 says; with it `k[t,t⁻¹]` is generated, without it only `k[t]`.

## R03 (P2) — Two statable headline theorems are absent from `Suggested.lean`

**Location:** `TauCetiRoadmap/ReductiveGroups/Suggested.lean:12–16` “Layers 2–8: represented homogeneous quotients, unipotent radicals, extracted root data and rational parabolic/Levi functors”; `README.md:734–735` “Borel subgroups and maximal tori, their conjugacy”; `README.md:580–583` “for smooth connected affine groups in characteristic 0, reductive ⇔ linearly reductive”.

**Claim:** Borel conjugacy over an algebraically closed field and the characteristic-zero implication reductive ⇒ linearly reductive are headline theorems whose carriers all exist at the pin; neither is stated and the docstring does not name them.

**Witness:** `TauCeti/Algebra/AlgebraicGroup/Borel/Basic.lean:148` `TauCeti.HopfIdeal.IsBorelOverAlgClosed k H I` for `H : FiniteTypeCommHopfAlgCat k`; `HopfIdeal/Conjugation.lean:66` `HopfIdeal.conjugate I g` for `g : WithConv (H →ₐ[k] k)`; the pin has only the conditional `Borel/Conjugation.lean:161` `exists_conjugate_eq_of_isBorelOverAlgClosed`, whose hypothesis is that every Borel conjugates into a given candidate. `Reductive/Basic.lean:70` `reductiveCommHopfAlgProperty k H`; `Coalgebra/Comodule/LinearlyReductive.lean:227` `Coalgebra.IsLinearlyReductive`.

**Repair:** Add to `Suggested.lean`, in a `/-! ## Layer 6 -/` and a `/-! ## Layer 7 -/` section:

```lean
theorem exists_conjugate_eq_of_isBorelOverAlgClosed {k : Type u} [Field k] [IsAlgClosed k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k) (I J : TauCeti.HopfIdeal k H)
    (hI : TauCeti.HopfIdeal.IsBorelOverAlgClosed k H I)
    (hJ : TauCeti.HopfIdeal.IsBorelOverAlgClosed k H J) :
    ∃ g : WithConv (H →ₐ[k] k), J = I.conjugate g := by sorry

theorem isLinearlyReductive_of_reductive {k : Type u} [Field k] [CharZero k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k)
    (h : TauCeti.reductiveCommHopfAlgProperty k H) :
    Coalgebra.IsLinearlyReductive k H.obj := by sorry
```

adjusting universe arguments to what `#check` prints, and name both in the README's Layer 6 and Layer 7 prose. Test: for the upper-triangular Borel ideal of `SL₂` over `k̄` and its lower-triangular conjugate by the Weyl element `[[0,1],[−1,0]]`, the witness `g` is that point; for `μ_p` in characteristic `p` the reductivity hypothesis fails (not smooth), so the second statement is not asserted there.

## R04 (P2) — The companion files still admit data, violate the import rule, and one no longer elaborates

Re-raised: R04, R08, R09 and R12 of the previous review; the repair touched `Suggested.lean` only.

**Location:** `SpecialLinearCoordinateTargets.lean:16–20` “noncomputable def coordinatePresentation … := by sorry” (new in this pull request); `CoverLiftTargets.lean:31` “CoverLifts.LiftGroup (extension o D) (isometryMulAction D)”; `CoverLiftTargets.lean:13` “def isometryGroup”; `SignedADETargets.lean:1`, `FoldingADETargets.lean:1–12`, `IntegralRationalTargets.lean:1–7`, `OrbitGeometryTargets.lean:1–9`, `SpectralWeylTargets.lean:1–12`, `BruhatCoordinateTargets.lean:1–5` (import headers).

**Claim:** The brief applies the Lean form rules to every listed `.lean` file. Sorry'd data is a blocking principle; the companions carry 41 such declarations (CoverLift 5, FoldingADE 12, IntegralRational 3, SignedADE 11, SpecialLinearCoordinate 1, SpectralWeyl 9). This head deleted the namespace `TauCetiRoadmap.ReductiveGroups.CoverLifts` from `Suggested.lean`, so `CoverLiftTargets.lean` now refers to `CoverLifts.LiftGroup` and `CoverLifts.projection` that exist nowhere in the folder and cannot elaborate. Every companion imports Mathlib submodules or roadmap modules, and the new file lacks `import Mathlib`. `SpecialLinearCoordinates.determinantRelation` (line 12) duplicates `SpecialLinearAcceptance.determinantRelation` (`Suggested.lean:123`).

**Witness:** `grep -n "LiftGroup" *.lean` returns only `CoverLiftTargets.lean:30–31`; the old definition was `Suggested.lean` at 73b05b0 (namespace `CoverLifts`, deleted in the change set). `CoverLiftTargets.lean:13–17` restates `TauCeti.BilinForm.isometryGroup` (`TauCeti/LinearAlgebra/BilinearForm/Isometry.lean:153`), which README 1353–1354 now consumes.

**Repair:** Delete the eight companion files; the README keeps every statement they sketch (README 26 already says they are not inputs to the acceptance module). Remove the sentences that point to them: README 533–535, 794 (“Keep this explicit rank-one chart … in the accompanying BruhatCoordinateTargets.lean”), 1394–1395, 1422–1424, 2211–2212. If a companion is kept, it must satisfy the same rules as `Suggested.lean`: one `import Mathlib`, no roadmap imports, no sorry'd `def`/`abbrev`/`instance`. Test: after deletion the targeted build of `Suggested.lean` is unchanged (it imports none of them) and the gate's `imports`, `mathlib-subimports` and `sorry-data` rules, applied to the folder, report zero.

## R05 (P3) — `coveringHomeomorph` is called native but is the roadmap's own sorried definition

**Location:** `README.md:784` “The accompanying native `coveringHomeomorph` constructs precisely this comparison”.

**Claim:** No declaration named `coveringHomeomorph` exists in the pinned Mathlib or Tau Ceti.

**Witness:** A single-pass search of both pinned trees for the name returns nothing; it is `BruhatCoordinateTargets.lean:101`, a `noncomputable def … := by sorry`. The two genuinely native inputs on the same line, `IsCoveringMap.existsUnique_continuousMap_lifts` (`Mathlib/Topology/Homotopy/Lifting.lean:477`, needs `SimplyConnectedSpace A`, `LocallyPathConnectedSpace A`) and `IsCoveringMap.eq_of_comp_eq` (`Mathlib/Topology/Covering/Basic.lean:367`, needs `PreconnectedSpace A`), are at the cited lines.

**Repair:** Replace “accompanying native” by “construct the homeomorphism from a connected covering of a simply connected, locally path-connected base with a chosen basepoint lift” and state it as a 7C.4 target with those three hypotheses.

## R06 (P3) — The regular-fibre-product input is attributed to the wrong supplier

**Location:** `README.md:462–464` “Consume SmoothBundlesConnections B1.1/1.4 and its independent LieGroupoidsPoisson G0.1 regular-fibre-product prerequisite”.

**Claim:** LieGroupoidsPoisson G0.1 does not own regular fibre products; it assigns them to SmoothBundlesConnections B1.0.

**Witness:** LieGroupoidsPoisson at its open head, README 2028: ReductiveGroups' regular fibres and fibre products are “which SmoothBundlesConnections B1.0 supplies”; SmoothBundlesConnections on main, README 221 “B1.0 Regular fibres, fibre products and kernel distributions of submersions”.

**Repair:** Cite SmoothBundlesConnections B1.0 for the fibre product and keep G0.1 only for the constant-rank comparison it actually states (its heading at that head: submersion comparisons and the constant-rank theorem).

## R07 (P3) — Shape: Examples, Dependencies, Needs lines and Checks are missing from most layers

Re-raised in part: R10 of the previous review.

**Location:** `README.md:191–270` (Layers 0–1), 304–323 (Layer 3), 538–565 (Layers 4–5), 572–583 (Layer 6), 733–756 (Layer 7), 1144–1212 (Layer 8).

**Claim:** Only Layers 2 and 7a end with `### Examples` and `### Dependencies`. Layers 0, 1, 3, 4, 5, 6, 7 and 8 define objects (points group, comodule dictionary, Hopf ideals and quotients, identity component, Jordan decomposition, diagonalizable groups, unipotent groups, the unipotent radical, radical and derived group, parabolics, root datum, relative reductive groups, pseudo-reductive groups) with no `**Checks.**` and, outside 215–216 and 282–284, no `*Needs:*` line; Layers 4, 5, 6 and 8 carry no source locator at all (“Lie–Kolchin”, “the unipotent radical … SGA3/Borel level”, “Nagata”-type statement at 582, the relative existence and isomorphism theorems at 1145–1148 which Conrad 6.1.16–6.1.17 would cover).

**Witness:** `grep -n "^### Examples\|^### Dependencies"` returns lines 286, 299, 838, 847 only; `grep -c "Needs:"` finds lines in Layers 0, 2, 3, 3A.1, 9A.1b, 9B.1–9B.3, the elementary section and the worked example only.

**Repair:** Give each of those layers three discriminating Checks per definition (for instance, for the unipotent radical: `G_a ⋊ G_m` has `R_u = G_a`; `SL₂` has `R_u = 1` though it has no characters; `Res_{K/k} G_m` for `K/k` purely inseparable has geometric `R_u` of dimension `[K:k]−1` that does not descend), a `*Needs:*` line per target, a locator per theorem (Conrad 6.1.16–6.1.17 for Layer 8's existence/isomorphism, Milne 2017 Chapter 17 for Borel conjugacy, SGA3 XIX or Conrad–Gabber–Prasad for pseudo-reductivity), and `### Examples`/`### Dependencies` at the end of every layer.

## R08 (P3) — The module docstring misstates what the pin lacks

**Location:** `Suggested.lean:15–16` “Layers 2–8: represented homogeneous quotients”; `Suggested.lean:22–25` (Layer 11).

**Claim:** The fppf homogeneous quotient of an affine group by any closed subgroup, its torsor structure and the coinvariant subalgebra all exist at the pin; what is missing for Matsushima (Layer 6B) is only the representability comparison. For Layer 11 the docstring does not name 11B (the finite Weyl-arrangement theorem `π₁(V_reg/W) ≃ ArtinGroup`), whose group-side carriers `TauCeti.ArtinGroup` (`TauCeti/GroupTheory/Coxeter/Artin.lean:121`), `coxeterMatrixOfBase` (`Coxeter/Matrix.lean:278`) and `rootPairingBaseChange` exist; the missing piece is the `W`-action carrier on the complexified complement.

**Witness:** `TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/Basic.lean:50` `homogeneousQuotientPresheaf` (“No normality is required”), `Homogeneous/Torsor.lean` (kernel pair `G × N`), `HopfIdeal/Coinvariants/Basic.lean:92` `HopfIdeal.coinvariants`.

**Repair:** Say in the docstring that the homogeneous quotient sheaf exists at the pin and that Layer 6B's representability by `Spec` of the coinvariants is not stated because no comparison map from that sheaf to a representable sheaf is available; name 11B and the missing complexified-arrangement action.

## R09 (P3) — A consumer's text is used as this roadmap's specification

**Location:** `README.md:1881–1895` “On the explicit carriers the CFSG roadmap's carrier plan designates … the CFSG roadmap's carrier plan records the construction in detail”; 1896–1902.

**Claim:** CFSGStatement consumes Layer 9 (its README 202, 312, 547 on main); specifying the `G₂`, `F₄` and tripled `D₄` carriers by reference to that consumer's plan makes a downstream roadmap the owner of this roadmap's construction.

**Witness:** `TauCetiRoadmap/CFSGStatement/README.md:215` lists “reductive groups Layer 9 for the pinned route” as its supplier; README 1894–1895 here defers the construction detail to it.

**Repair:** State the three carriers and their pinning equations here (module, torus, numbered simple root subgroups, the square relation `τ² = Frob_p`) and cite CFSGStatement only under `## Downstream consumers`.

## Verified sound

**Gate and elaboration.** The worker's gate line at this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`. I elaborated `Suggested.lean` with `lake env lean`: exit 0, six `declaration uses sorry` warnings (lines 69, 78, 89, 98, 108, 128) and nothing else. Pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` (the Tau Ceti commit `93d1fe5` named in the folder's generated `STATUS.md` is not an ancestor of the pin, so the orbit and Borel-conjugacy results it mentions are not at the pin, and the orbit statements in `Suggested.lean` are not duplicates).

**Dependency check.** `tauceti-roadmap … gate --depcheck … --movable` printed `depcheck: 204 roadmaps, 1543 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. R01 records the reciprocal prose citations this output does not see.

**Signatures and probe.** A scratch copy with `#check @` for all 13 declarations elaborated; every theorem carries `IsAlgClosed k`, `IsAffine G.left`, `Smooth G.hom`, `QuasiCompact G.hom`, `LocallyOfFiniteType X.hom`, `QuasiCompact X.hom`, `IsSeparated X.hom` explicitly, matching README 363–367; `exists_closed_orbit` takes `Nonempty (Points X)`; the SL theorem quantifies over all `n : ℕ` as README 2426 says. The one-tactic probe (`first | rfl | (simp; done) | infer_instance`) closed none of the six sorried theorems; none restates a definition or a Check. No padding found.

**Library declarations opened at the pins** (file:line): `CategoryTheory.ModObj` `Mathlib/CategoryTheory/Monoidal/Mod.lean:59` (left action of a monoid object, used as `γ[G, X]`); `Over.cartesianMonoidalCategory` `Mathlib/CategoryTheory/Monoidal/Cartesian/Over.lean:33` (an `abbrev` that Mathlib itself installs as a local instance, as `Suggested.lean:32` does); `topologicalKrullDim` `Mathlib/Topology/KrullDimension.lean:37` (`WithBot ℕ∞`, empty space `⊥`); `IsImmersion` `Morphisms/Immersion.lean:44`; `IsSeparated` `Morphisms/Separated.lean:43`; `Smooth` `Morphisms/Smooth.lean:59`; `smooth_of_grpObj [GeometricallyReduced f]` `Group/Smooth.lean:63` (README 98 states its hypotheses correctly); `isCommMonObj_of_isProper_of_geometricallyIntegral` `Group/Abelian.lean:132`; `instance [Algebra.FiniteType (𝒜 0) A] : IsProper (Proj.toSpecZero 𝒜)` `ProjectiveSpectrum/Proper.lean:372` (README 445 correct); `IsNilpotent.exp` `RingTheory/Nilpotent/Exp.lean:50`; `GroupExtension` `GroupTheory/GroupExtension/Defs.lean:73–83`; `IsCoveringMap.existsUnique_continuousMap_lifts` `Topology/Homotopy/Lifting.lean:477`; `IsCoveringMap.eq_of_comp_eq` `Topology/Covering/Basic.lean:367`. Tau Ceti: `SpecialLinear.coordinateHopfAlgebra` `SpecialLinear/Basic.lean:195` (quotient of `GeneralLinear.coordinateHopfAlgebra R n` by `definingHopfIdeal`, whose ideal is `(det − 1)` in `R[Xᵢⱼ][det⁻¹]`, `coordinateMap_ker`; the header states that no polynomial presentation is asserted, so `exists_coordinatePresentation` is new); `coordinateMap` 201; `coordinateMap_determinantGroupLike` 215; `pointsMulEquiv` 380; `pointsNatIso` 574; `Derivation.tangentScalarExtensionEquiv` `Tangent/Cotangent.lean:360` (finite projective cotangent, as README 137 says); `reductiveCommHopfAlgProperty` `Reductive/Basic.lean:70`; `IsBorelOverAlgClosed` `Borel/Basic.lean:148`; `HopfIdeal.conjugate` `HopfIdeal/Conjugation.lean:66`; `exists_coordinateBialgHom_surjective` `Representation/Embedding.lean:118`; `IsFaithful` `Faithful/Basic.lean:221`; `homogeneousQuotientPresheaf` `Fppf/Quotient/Homogeneous/Basic.lean:50`; `smoothCommHopfAlgProperty_of_charZero` `Smooth/CharZero.lean:148`; `BilinForm.isometryGroup` `BilinearForm/Isometry.lean:153`; `ArtinGroup` `Coxeter/Artin.lean:121`; `coxeterMatrixOfBase` `Coxeter/Matrix.lean:278`; `weylCoxeterHom` `Coxeter/Presentation.lean:57`. A single-pass search for the 97 further library names the README cites (from `baseChangePointsMulEquiv` to `kostantFormComul_ringChoose`, `serreDiagramAut_iterate_eq_id`, `geckLieEquivOfEquiv`, `DynkinType.diagramAut`, `SpStd.specialIsogeny`, `fundamentalGroupToMulOpposite`, `Rep.indCoindIso`, `exact_fixedMap_of_isLinearlyReductive`, `dense_smoothLocus_of_perfectField`, `pointEquivClosedPoint`, `jacobsonSpace`, `typeBEquivSo`, `soIndefiniteEquiv`, `finrank_indFDRep`, `indTrivialEquiv`, `frobeniusFixedPointsMulEquiv`, `pointsFunctorIsoTensorAutFunctor`) found every one of them at the pins; the only README name absent from both pins is `coveringHomeomorph` (R05).

**Cross-roadmap citations resolved** (main unless stated): SchemeAndStackFoundations §0.3 (551), §0.7 (755), §1.1 (2071), §1.5 (2167), §§1.13–1.15 (2418, 2458, 2502), §2.6 (3437); ModularCurves §0E (386), §0F (412); ReductiveGroupsPartII RG2.3.7 (5201–5280: *lang-theorem*, *lang-for-pro-algebraic-groups*, *fixed-coset-lifting*, *smooth-model-reduction*); IntegralHeckeAndGaloisDeterminants §0.7 (open head, 1115; it names ReductiveGroups only as owner of root data, with no Needs edge, so that supply is one-directional); FormalConnectionsOpers F4.3 (open head 1383) and F6 (1788); ComplexComparisonPartII C−1.1 (open head 724; no ReductiveGroups citation); InverseGalois IG.3.2 (2678), IG.5.1 (5317); LieGroupoidsPoisson G0.1 (open head 299); SmoothBundlesConnections B1.0 (221), B1.1 (315), B1.4 (421); RootSystems Layers 1–6 (218–356), `weylCoxeterSystem` (183), `simplyConnectedRootDatum`; LieHighestWeight Layers 3, 4, 7 (405, 537, 931); InductionRestriction Layer 2.1 (346), whose `almostConjugate_iff_permutation_equiv` resolves to that roadmap's `Suggested.lean` (the resolver's lead); GroebnerGeometry G5 (394); DGFloer Layer 1 item 2 (131); AlgebraicTopology van Kampen (25, 159); IntegralLattices `integralForm` (833); CFSGStatement L5 (32, 215); ReflectionInvariantTheory §§1–4; LieGroups Layers 6–8 (383, 407, 428; its line 9 mentions this roadmap as context only, no Needs edge); SchubertGeometry and NilpotentOrbits cite this roadmap as their supplier and are cited here only as consumers. The other twelve Lean-name leads in the resolver's list are this roadmap's own declarations in `Suggested.lean` (gate `readme-ids-missing=0`).

**Ownership.** The SL polynomial presentation, the orbit theorems, signed ADE folding and the spectral Weyl lane were searched by object in the sibling checkouts named by the brief and through `roadmaps show` for the three open suppliers above; RootSystemsPartII (open head) defers signed ADE folding here; ClassicalGroups owns representation restriction, not the integral SL quotient. No other open pull request declares `TauCetiRoadmap.ReductiveGroups.*`.

**Seeded sample (“Supplier:” at README 798) and other sources.** Part II RG2.3.7 on main states Lang's theorem for a smooth connected group over `F_q` with the q-Frobenius, `g ↦ g⁻¹F(g)` onto `H(F̄_q)`, with the Lean pin `Lang.lang_surjective` for smooth geometrically connected finite-type `H`, and *fixed-coset-lifting* for `σ ∈ Aut(H)`, `J ≤ H` with surjective Lang map on `J`; this is exactly what README 821–825 and 960–961 consume, with the same hypotheses. Its locator holds: `milne` (v2.00) lines 20248–20249, Proposition 27.54, PDF page 487 (Steinberg endomorphism of a connected group variety, `g ↦ gF(g⁻¹)` surjective); lines 20264–20270, Corollaries 27.55–27.56, page 488 (Frobenius relative to a finite field; `H¹(k,G) = 1`). The Part II text's `g⁻¹F(g)` is the composite of Milne's map with inversion, as its own text notes. Other locators: `milne` (2017) lines 1461–1475, Proposition 1.65(b),(c), printed pp. 26–27 (locally closed image under a transitive action; factorization through the reduced image by an immersion, which is `exists_reduced_orbit_model`); lines 1504–1514, Proposition 1.66, printed pp. 27–28 (boundary of smaller dimension; a closed orbit exists); chapter 10 sections b–e at printed pp. 188–195 (lines 7871, 7960, 8007, 8113), Theorem 10.23 at line 8076 (p. 193), Propositions 10.28–10.29 at lines 8143, 8160 (p. 195); §2.a “Affine algebraic groups” at line 1971 (printed p. 39, the `G_a`, `G_m`, matrix-group coordinate rings). `conrad` lines 6011–6019, Theorem 5.1.13, printed p. 143 (`U⁻ × T × U⁺ → G` an open immersion onto `Ω`, independence of enumeration, closed subgroup `T ⋉ U⁺`); lines 8159–8168, Theorem 6.1.16 (Isogeny and Existence Theorems) p. 196; lines 8173–8182, Theorem 6.1.17 (Isomorphism Theorem) p. 197. `mcninch` lines 138, 169, 236, 330, 399, 421, 448, 485, 507: §§2.2, 2.3, 3.1, 4.1, 4.3–4.5, 5.1–5.2 exist with the cited content (groups with a normal split unipotent subgroup; condition (L); Hochschild complex; group extensions; cohomology and extensions; conjugacy of complements; cohomological criteria). `dudas-michel` line 1457, Proposition 8.9, p. 32 (two parabolics whose Levis contain a common maximal torus); Propositions 7.5, 7.7, Lemma 7.6, Proposition 8.7, Theorem 9.6, Lemmas 9.9–9.11 at lines 1141–1718. `conrad-feng` line 2229 §6.3, line 5345 Proposition 12.3.1 (simple transitivity of `U(k)` on Levi factors of `P`), line 10345 Appendix H.1. `gros-kaneda` lines 23–26: the construction is extended to general reductive groups, as README 1958–1960 says. `heden` lines 91–93: `SL₂ → A²∖{0}` as a principal `G_a`-bundle, the comparison README 2173–2174 names.

**Adversarial pass.** Every value below was computed in this review.

| Statement / convention | Instances tried | Values on the two sides | Result |
|---|---|---|---|
| `orbit_locallyClosed`, image on all scheme points | `G_m` on `A¹` by scaling, `x = 1` | image = `A¹∖{0}` with its generic point; open | agrees |
| same | `G_m` on `A²` by `t·(a,b) = (ta, t⁻¹b)`, `x = (1,1)`; `x = (1,0)` | hyperbola `ab = 1`: closed; `{(a,0) : a ≠ 0}`: open in the closed line `b = 0` | agrees |
| same, Jacobson step (README 400–404) | constructible `E ⊆ U`, `U` finite type over `k̄`, `E ⊇` all closed points | `U∖E` constructible with no closed point, hence empty | agrees |
| same, nonreduced target | trivial `G` on `Spec k[ε]/(ε²)` | one point, closed; reduced model `Spec k` | agrees |
| same, disconnected group | constant `S₃` on itself | six closed points; boundary `∅` | agrees |
| `boundary_dimension_lt` | `G_m` on `A²`, `x = (1,0)` | boundary `{(0,0)}`: `0 < 1` | agrees |
| same | `G_m` on `ℙ¹`, `x = [1:1]` | boundary `{[0:1],[1:0]}`: `0 < 1`; closed orbits have boundary `⊥ < 0` | agrees |
| `exists_closed_orbit`, empty space | `X = ∅` | `Points X` empty, hypothesis fails, no assertion | agrees |
| `exists_closed_orbit_in_closure` | `G_m` on `A¹`, `x = 1` | `y = 0`, `{0} ⊆ A¹` closed | agrees |
| hypotheses vs Milne 1.66 | `G` smooth, `X` nonreduced | `G × X_red` reduced, so the action restricts to `X_red` with the same space; smoothness of `G` is what makes this reduction legitimate | agrees |
| `smooth_of_grpObj` hypotheses (README 98) | `μ_p` over `F_p`; `G_m` | `k[t]/(t^p − 1) = k[t]/((t−1)^p)` not reduced, not smooth; `G_m` both | agrees |
| `determinantRelation`, `exists_coordinatePresentation` | `n = 0, 1, 2` | relation `0`, `x − 1`, `ad − bc − 1`; quotients `ℤ`, `ℤ`, `ℤ[a,b,c,d]/(ad−bc−1)`; localization at `det` redundant since `det ↦ 1` | agrees |
| same, pinned ideal | `coordinateMap_ker` | `(det − 1)` in `R[Xᵢⱼ][det⁻¹]`, all `n`, all `R` | agrees |
| SL antipode Check (README 2457) | `[[1,1],[0,1]]` over `ℤ/4` | inverse `[[1,−1],[0,1]]`, entry `−1 = 3` | agrees |
| SL coproduct convention | `x₊(2)x₋(3)` | `Δa` evaluates to `1·1 + 2·3 = 7`; product entry `7` | agrees |
| 9B.1 chart inverse | `g = [[a,b],[c,d]]`, `a` a unit | `u₋(c/a)·diag(a,a⁻¹)·u₊(b/a) = [[a,b],[c,(1+bc)/a]]`, `(1+bc)/a = d` | agrees |
| 9B.1 Weyl representative | `x_α(1)x_{−α}(−1)x_α(1)` | `[[0,1],[−1,0]]`, determinant 1, square `−I` | agrees |
| 9B.1 translated chart | `sΩ` in `SL₂` | `(s⁻¹g)₁₁ = −c`, so `sΩ = D(c)` | agrees |
| 9B.1 cover of fibres | cell `B⁻n_wB⁺` vs `n_wΩ` | `n_w⁻¹U⁻n_w = U_{w⁻¹Φ⁻∩Φ⁻}·U_{w⁻¹Φ⁻∩Φ⁺} ⊆ U⁻U⁺`, so `B⁻n_wB⁺ ⊆ n_wU⁻TU⁺` | agrees |
| 9B.1 Checks | `SL₂(ℤ/4)` | `8·6 = 48` points; `[[0,1],[3,0]]` has `a = 0`, `c = 3` a unit | agrees |
| 9B.1 non-local ring | `[[2,1],[3,2]]` over `ℤ` | `det = 4 − 3 = 1`; neither entry a unit; `(2,3) = ℤ` | agrees |
| 9B.2 central isogeny | `SL₂ → PGL₂` | `X = ℤ`, `Λ = 2ℤ`, kernel `D(ℤ/2) = μ₂`; `diag(2,1)` has square class `2 ∉ (ℚˣ)²` | agrees |
| 9B.2 characteristic 2 | `μ₂` | `k[t]/(t²−1) = k[t]/((t−1)²)`, length 2 | agrees |
| 9B.3 pinning | `diag(2,1/2)` on `x_α(a)` | `x_α(4a)` | agrees |
| `E_G`, `GE_G` | `G_m/ℚ`; local `A` | `E = {1}`, `GE = ℚˣ`; `n_wΩ(A) ⊆ E_G(A)T(A)` since `n_w ∈ E_G(ℤ)` | agrees |
| 7C rank-one identity | `x_α(a)x_{−α}(b)` | both sides `[[1+ab, a],[b, 1]]` | agrees |
| 7C `n_α(a)` | `a ≠ 0` | `[[0,a],[−a⁻¹,0]]` | agrees |
| 9A.1a cocycle, commutator | `ε(a,b)/ε(b,a)` | `(−1)^{Σ_{i≠j} bond·a_ib_j} = (−1)^{B(a,b)}` | agrees |
| 9A.1a inverse | `(a,s)(−a, sε(a,−a))` | `(0, s²ε²) = (0,1)` | agrees |
| 9A.1a A₂ sign | `a = α₁+α₂`, order `α₁<α₂` | `ε(a,−a) = (−1)^{1·1·(−1)} = −1`; `[E₁₃, −E₃₁] = −(E₁₁−E₃₃)` | agrees |
| 9A.1b folded matrices | A₃ `{1,3},{2}`; A₄ `{1,4},{2,3}`; D₄ `{1,3,4},{2}` | `[[2,−2],[−1,2]]`; `d_P = 1`, `c_P = 2`, `[[2,−1],[−2,2]]`; `[[2,−3],[−1,2]]` | agrees |
| `B(β_O,β_O) = d_O/|O|` | general | `B(S_O,S_O) = |O|d_O` | agrees |
| D₄, E₆ counts | triality; reversal | `3` fixed positive roots → `6` fixed roots, `6` orbits of `3`: `12+2 = 14`; `48+4 = 52` | agrees |
| full-Y example (README 1661) | `γ = [[0,−1],[1,−1]]` | `γ³ = 1`; `det(γ−I) = 3`; `γ(1,−1) = (1,2) ≡ (1,−1)` mod 3 | agrees |
| 9C toral idempotent | `p = 3`, weights `0..3` | `binom(λ−1,2) mod 3 = 1,0,0,1` | agrees |
| 7e corner algebra | `t = e_Ue_V`, `s = e_Ve_Uz_U⁻¹` | `ts = z_Uz_U⁻¹ = e_U`; `(st)z_V = e_Ve_Uz_U⁻¹z_Ue_V = z_V`; `st = e_V` | agrees |
| 7f Gassmann identity | `S₃`, `H = ⟨(12)⟩`, `g = (12)`; `g = (123)` | `1·2 = 2·1`; `0·2 = 3·0` | agrees |
| 7c dimension formula | `S₃`, index-3 subgroup, trivial module | `3 = 3·1` | agrees |
| 10C Lucas | char 3, `n = 4`; char 2, `n = 2` | `binom(4,k) mod 3 = 1,1,0,1,1`: socle `x⁴,x³y,xy³,y⁴`, dimension `4 = (1+1)(1+1)`; `1,0,1`: `span(x²,y²)`; `xy ↦ cd u² + uv + ab v²` generates | agrees |
| 10C simplicity criterion | `n = (a+1)p^m − 1` | all base-`p` digits except the top equal `p−1`, so every `binom(n,k) ≠ 0` | agrees |
| 10D torsor charts | `s_a`, `s_c`, `u_a`, `u_c` | `det s_c = 1`; `u_c − u_a = 1/(ac)`; `s_a n(−1/(ac)) = s_c` | agrees |
| 11A nonsplit sequence | `n = 2` | transposition lift of order 2 needs exponent sum 0, but sign forces odd | agrees |
| 11E `n = 2` | centred `(z,−z)` | `ℂ*`, cover `z ↦ z²`, `B₂ ≃ ℤ`, pure part `2ℤ` | agrees |
| Lang sample | `G_a/F_2`, `θ²+θ+1 = 0`; constant `C₂` | `θ² − θ = 1`; image `{1}` | agrees |
| fixed cosets (Part II Check) | `ℤ/4`, `σ = −1`, `J = {0,2}` | Lang map on `J` is `0`, hypothesis fails; coset `{1,3}` has no fixed point | required hypothesis |
| proper ⇒ commutative (R01 old) | constant `S₃/ℂ` | `(12)(23) = (123) ≠ (132)`; six geometric components | hypothesis needed, stated |

## Not verifiable

- The companion files were not elaborated: the brief permits only the targeted build of `Suggested.lean` and `lake env lean` on it; R04's non-elaboration claim rests on the absent definition, not on a compiler run.
- Milne 2017 items 10.6 and 10.14 (README 280, 309) could not be located by text search in the extraction (the numbered items in chapter 10 are OCR-broken); the surrounding sections b–e and the page range were verified.
- Jantzen, Waterhouse, Borel, Springer, SGA3 XIX, Conrad–Gabber–Prasad, Howlett–Lehrer, Dipper–Du, Carter §1.17, Lang 1956, Steinberg 1968, Serre, Gassmann, Brieskorn and Salvetti are cited without theorem locators or behind paywalls; none was read. The README cites them as background only.
- The Conrad, Conrad–Feng and Dudas–Michel texts were fetched from the authors' own pages with `--licence-class author-page`; the service first recorded them as missing in the job's `needs-references.toml` before the licence class was given.
- Ownership against open pull requests was checked only in the sibling checkouts the brief names and through `roadmaps show` for IntegralHeckeAndGaloisDeterminants, ComplexComparisonPartII and InverseGaloisAndArithmeticFundamentalGroups.

## Source issues

- **Error** in milne (2017) at Proposition 1.65(a), printed p. 26: the proof passes to the algebraic closure before choosing the open set U; it should choose U first and then pass to the algebraic closure; affects the proof; corrected in print at the author's errata list, PDF p. 657 (milne line 26822).
