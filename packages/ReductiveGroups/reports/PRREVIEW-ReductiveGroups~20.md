# Review of ReductiveGroups (pull request #1797 at 67b939d)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/ReductiveGroups/` at `67b939d24dba7679b90c0c70aaa2659d5fddbf4d`. The pull request folds the seven companion `*Targets.lean` files of this folder on main into `Suggested.lean` (159 → 1789 lines, 15 → 288 declarations) and edits five README sentences. The fold is faithful: a line-by-line comparison of the seven side files with the appended sections differs only in the docstring words "file" → "section" and in the section headers (`comm` on sorted, header-stripped line sets: no statement line differs). What the fold does is bring 273 declarations that the gate never scanned (its `sorry-data`, import and build checks read `Suggested.lean` only) under the acceptance-test rules, and they fail them: 45 sorry'd data declarations, an import header the gate refuses, and a build that fails on Lake's module-system warning. The README also carries two supply cycles and two upward supplier citations that the dependency check cannot parse because they are written as prose links; a simulation that rewrites them as `*Needs:*` lines prints the UPWARD and CYCLE lines (quoted under R03/R04).

## Previous findings

The previous review on file (PRREVIEW-ReductiveGroups~19) is of pull request #1676 at 92ab639, a different open revision of this folder with its own README (3702 lines) and `Suggested.lean`; its sole finding R01 concerned the McNinch §3.1 locator at that README's line 1179 and `Suggested.lean:195`. Neither passage exists in this branch, which starts from main. This README cites McNinch once, at `README.md:610`, as "McNinch §§2.2–2.3,3.1,4.1,4.3–4.5,5.1–5.2", the section list the repair left; `mcninch` line 230 is the page-6 marker, line 236 opens §3.1 and lines 237–243 define a Levi factor as a closed `k`-subgroup `M` with `M ⋉ R → G` an isomorphism, so the list is consistent with the text. Not applicable to this head; nothing to repair. (Data for the humans who merge: #1332 and #1676 are open revisions of this same folder and both rewrite `Suggested.lean`; this housekeeping change will conflict with them.)

## R01 (P1) — 45 definitions and instances with `sorry` in their bodies

Location: `TauCetiRoadmap/ReductiveGroups/Suggested.lean`, gate `sorry-data=45`; for example lines 106 (`liftSubgroup`), 288 (`integralPBWBasis`), 347 (`finiteOrderDistributions`), 436 (`latticeForm`), 478 (`coverGroup`), 534 (`rootLineQuotientEquiv`), 562/571/634 (`lieRing`, `lieAlgebra`, `fullLieRing`), 612 (`normalizationEquiv`), 688 (`isometryGroup`), 726/738 (`carrierEquiv`, `lieEquiv`), 963 (`fixedIntegralBasis`), 1006 (`signedCycleEquiv`), 1092 (`smithKernelEquiv`), 1480 (`centerHomeomorph`), 1497/1501 (`planeBraidEquiv`, `planePureEquiv`), 1535 (`matrixSpectrum`), 1629 (`cameralEquiv`), 1650 (`spectralFundamentalEquiv`), 1708 (`arrangementAction`), 1731 (`arrangementArtinEquiv`), 1746 (`baseChangeWeylEquiv`).

Claim: the file states target forms with "honest `sorry` construction targets" (docstring at lines 184–186 and the README at line 121).

Witness: the principle in force ("no sorry'd data and no `set_option`") and the gate rule "no `sorry` in the body of a `def`, `abbrev`, `instance` or `opaque`"; the five `CoverLifts` declarations (lines 106–168) were already on main's `Suggested.lean`, the other 40 arrive with the fold. Everything downstream of a sorry'd datum is also out of bounds (for instance every `*_apply` theorem about `integralPBWBasis`, `cameralEquiv` or `centerHomeomorph`, and the whole `section Rational` of `FoldingADE`, which takes `lieRing o D` as a local instance).

Repair, in three classes, each tested on one of its instances:

1. Routine proof fields inside definitions with real bodies: prove them in place, since a definition with a real body is kept. `liftSubgroup` (closure under `1`, `*`, `⁻¹` is immediate from the two defining equations), `characterTwist` (inverse: `S.inl (χ q)⁻¹ * S.inl (χ q) * e = e`; multiplicativity uses `hc` and `χ` a homomorphism), `latticeForm` (bilinearity of the finite double sum), `signInclusion`/`projection`/`extension` (`ε(0,a) = ε(a,0) = 1` since the exponent sum has a factor `a i * 0`), `coverGroup` (associativity is `epsilon_cocycle`, which is bimultiplicativity of `ε`; inverse law computed below in the table), `isometryGroup`, `isometryMulAction`, `rootEquiv`, `simpleRoot` (its obligation reduces to `D.gram i i = 2`, the `diagonal` field), `jetDualToDistributions`, `finiteOrderDistributions` (closure: `f` vanishing on `I^(a+1)` and `g` on `I^(b+1)` give `f * g` vanishing on `I^(a+b+2)` because `Δ(I^N) ⊆ ∑_(i+j=N) I^i ⊗ I^j`), `fullFrameMap`, `signedLinearMap`, `fullAction`, `rootAction`, `fixedH`/`fixedE`/`fixedF`.
2. Lie structures whose axioms are the roadmap's theorems (`lieRing`, `lieAlgebra`, `fullLieRing`, `lieEquiv`, `signedLieEquiv`, `rationalLieEquiv`, and `carrierEquiv`'s inverse laws): delete the instances; state the laws as theorems on the explicit `bracket`, as `bracket_jacobi` (line 578) already does, and restate `foldedSystem`, `foldedMap`, `foldedEquiv` and the bracket clause of `exists_full_frame_comparison` on `bracket`/`fullBracket`, or name them in the module docstring as not statable until the Lie instance is a library theorem.
3. Existence data defined by `sorry` (`integralPBWBasis`, `rootLineQuotientEquiv`, `normalizationEquiv`, `fixedIntegralBasis`, `signedCycleEquiv`, `smithKernelEquiv`, `centerHomeomorph`, `planeBraidEquiv`, `planePureEquiv`, `matrixSpectrum`, `cameralEquiv`, `spectralFundamentalEquiv`, `arrangementAction`, `arrangementArtinEquiv`, `baseChangeWeylEquiv`, `characterKernelEquiv`): restate each as a `theorem` asserting existence together with its characterising equation, for example

```lean
theorem exists_integralPBWBasis (base : P.Base) (D : ReductiveChevalleyFrame (r := r) (L := L) P) :
    ∃ b : Module.Basis (PBWExponent (r := r) base) ℤ (IntegralForm D),
      ∀ a, b a = orderedIntegralMonomial base D a := by sorry
```

   and delete the `_apply`/`_fst`/`_snd`/`_symm`/`_value`/`_reconstruct`/`_eval` corollaries and the definitions built on the datum (`specializedPBWBasis`, `integralProductCoefficients`, `spectralContinuousMap`, `arrangementMulAction`, `arrangementMonodromy`, `rootMonodromy`, `planeMonodromy`, `orderedCover_pi1`, …); the README keeps every one of them as a target or Check.

The Kostant basis statement above was checked on the frame of `𝔰𝔩₂` (`m = 2`, `r = 1`): the exponents are `(a, b, c) ∈ ℕ³`, the monomials `f^(a) · binom(h, b) · e^(c)`, and the equation `b a = orderedIntegralMonomial a` is exactly Kostant's theorem for that order.

## R02 (P1) — Layer 7a and ReductiveGroupsPartII RG2.3.7 supply each other

Location: `TauCetiRoadmap/ReductiveGroups/README.md:691–695`: "**Supplier:** ReductiveGroupsPartII RG2.3.7 owns ordinary q-Frobenius Lang surjectivity, its quotient/H¹ consequences, and generic fixed-coset lifting. This layer consumes *lang-theorem* and *fixed-coset-lifting* …".

Claim: Lang's theorem is supplied to this roadmap by its own Part II.

Witness: `ReductiveGroupsPartII/README.md` on main, line 5201 "### RG2.3.7 Lang's theorem and lifting", whose *lang-theorem* paragraph ends "*Needs:* ReductiveGroups layer 3; Mathlib `groupCohomology`" and whose *lang-for-pro-algebraic-groups* paragraph needs "ReductiveGroups layer 0"; that README cites ReductiveGroups 54 times in all. A base roadmap and its Part II are a single direction of supply by construction, and here each layer needs the other. The dependency check prints `0 problem(s)` because both roadmaps are on main; that is a false negative for this edge.

Repair: move the ownership down. Replace the Supplier paragraph by a Layer 7a target: for a smooth geometrically connected affine group `H` of finite type over `F_q` with `q`-Frobenius `F`, the map `g ↦ g⁻¹ F(g)` is onto `H(F̄_q)`, with `H¹(F_q, H) = 1` and the fixed-coset lifting along `1 → H′ → H → H″ → 1` with `H′` connected as its corollaries, keeping the non-example `μ₂` over odd `q` (Lang map `z ↦ z⁻¹ z^q = 1` misses `−1`), at the locator Part II records (Milne, *Algebraic Groups*, Prop. 27.54 and Cor. 27.55–27.56); ReductiveGroupsPartII RG2.3.7 then cites this layer, an edit to that folder which this review only records. Tested on the instance that refuted the original: with 7a owning *lang-theorem*, every `*Needs:*` of RG2.3.7 points into ReductiveGroups and nothing in ReductiveGroups points back.

## R03 (P1) — FormalConnectionsOpers F4.3 is cited as a prerequisite, and FormalConnectionsOpers consumes Layers 0–9

Location: `README.md:1963–1964`: "The lower smooth/holomorphic dictionary of FormalConnectionsOpers F4.3 uses those outputs and is a prerequisite for the analytic charts here."

Claim: Layer 11's analytic charts consume FormalConnectionsOpers §4.3.

Witness: FormalConnectionsOpers at its open head (pull request #1056) line 68 "**ReductiveGroups Layers 0–9 and 6B** owns the Hopf/scheme/points dictionary …", line 241 "### From TauCetiRoadmap.ReductiveGroups", line 948 "*Needs:* … ReductiveGroups Layer 1", line 1123 "*Needs:* … ReductiveGroups Layers 4, 6, 9"; and this README at line 622 "FormalConnectionsOpers F6 consumes it". Appending the sentence `*Needs:* FormalConnectionsOpers F4.3.` to a scratch copy of the README makes the dependency check print

```text
UPWARD: ReductiveGroups (on main) -> FormalConnectionsOpers (#39) at README lines [2238]
CYCLE among: FormalConnectionsOpers, ReductiveGroups
```

so the `0 problem(s)` of the committed README is only the parser not reading a prose link.

Repair: the notion moves down. Layer 11 already builds its own evaluation topology on complex points (`Spectral.pointTopology`, `Suggested.lean:1561`); state the analytic inputs Layer 11 uses (the evaluation topology on `H →ₐ[ℂ] ℂ`, its agreement with the finite-type analytic topology, continuity of the adjoint action and of the spectral projection) as Layer 11 targets with hypotheses, and rewrite line 1963 as a consumer note ("FormalConnectionsOpers F4.3 refines this dictionary"), without "prerequisite", "supplies" or "*Needs:*". Tested: with that sentence rewritten the simulation prints no CYCLE line.

## R04 (P2) — IntegralHeckeAndGaloisDeterminants §0.7 and InverseGaloisAndArithmeticFundamentalGroups IG.5.1 are open roadmaps cited as suppliers

Location: `README.md:520` ("rational H-module V consume [IntegralHeckeAndGaloisDeterminants0.7](…)'s generic rational-cohomology construction"), `README.md:1761` ("Consume [IntegralHeckeAndGaloisDeterminants0.7](…)'s canonical arbitrary-base algebraic induction"), `README.md:1970–1971` ("Consume the early configuration contract [InverseGaloisAndArithmeticFundamentalGroups IG.5.1](…)"), and `Suggested.lean:1466` ("IG.5.1 supplies the generic configuration/disc comparison").

Claim: a roadmap on main consumes two roadmaps that are still pull requests (merge order lines 23 and 44).

Witness: the same simulation prints `UPWARD: ReductiveGroups (on main) -> IntegralHeckeAndGaloisDeterminants (#22)` and `UPWARD: ReductiveGroups (on main) -> InverseGaloisAndArithmeticFundamentalGroups (#43)`. The cited sections do exist (IHGD head line 1114 "### 0.7 Connected reductive invariant evaluations"; IGAFG head line 5317 "### IG.5.1 Configuration spaces"), and neither cites ReductiveGroups back, so these are upward edges, not cycles.

Repair: own the specialisations here. Rational cohomology of a comodule over a field (cofree resolutions, enough injectives, derived invariants, Jantzen I.4) belongs to Layer 1 as a target with its hypotheses; algebraic induction as the cotensor equalizer belongs to Layer 10B, where this README already states Weyl modules and induction. For 11A, the Spectral section already carries the injective-tuple carrier, its permutation quotient and base point (`OrderedPlane`, `UnorderedPlane`, `planeBase`, lines 1472–1491): make 11A the owner of the plane configuration space and its braid comparison, and delete the "contract" sentence and the docstring clause. Tested: with both sentences rewritten as targets the simulation prints no UPWARD line for either roadmap.

## R05 (P2) — the Levi-complement headline is statable at the pins and absent; the docstring names no unstatable headline

Location: `Suggested.lean:23–41` (module docstring) and the file as a whole; README Layer 6A (`README.md:478–610`).

Claim: the file "suggests Lean forms for particular milestones" and is "not exhaustive".

Witness: the 6A headline, "every smooth connected affine group over a field of characteristic zero has a Levi complement", is statable on the pinned carriers: `TauCeti.FiniteTypeCommHopfAlgCat`, `Algebra.Smooth k H`, `TauCeti.geometricallyConnectedCommHopfAlgProperty` (`Reductive/Basic.lean:78–82` at Tau Ceti 358314d uses both), `TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadicalDefiningIdeal` (`Unipotent/Radical/Construction.lean:72`) and `TauCeti.HopfIdeal`; the sibling revision of this folder states it in exactly this form (pull request #1676, `Suggested.lean:199–207`, `exists_levi_complement`). Nothing in this file states it, and the docstring does not say which headlines (Borel conjugacy, Bruhat decomposition, the isomorphism and existence theorems of Layer 8) are not statable and what carrier each lacks (root subgroups and the root datum of a group).

Repair: add the 6A headline with `[CharZero k]`, `Algebra.Smooth k H` and geometric connectedness in its own signature, as `∃ J : TauCeti.HopfIdeal k H, Function.Bijective ((Ideal.Quotient.mkₐ k J.toIdeal).comp (unipotentRadicalDefiningIdeal H).coinvariants.val)`; extend the docstring with the list of unstatable headlines and their missing carriers. Tested on the Borel subgroup of `SL₂` over `ℚ`: `O(B) = k[a,a⁻¹,b]`, right `R_u`-coinvariants `k[a,a⁻¹]`, `J = (b)`, composite the identity, bijective; the Hopf ideal `J = (a−1)` gives the composite `k[a,a⁻¹] → k[b]`, `a ↦ 1`, not injective, so the statement is not satisfied by every Hopf ideal.

## R06 (P3) — the gate's build fails: module-system header and one semireducible class definition

Location: `Suggested.lean:1` (plain `import`) and `Suggested.lean:1708` (`noncomputable def arrangementAction : … MulAction …`).

Claim: the file builds (pull request description: "zero errors").

Witness: the worker's gate `build=3 FAIL` with Lake's two warnings "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`" and the linter warning at 1706 "Definition `…Spectral.arrangementAction` of class type is semireducible … consider marking this definition with `@[instance_reducible]`". `lake env lean` never shows the Lake warning, which is why the description's elaboration was clean.

Repair: line 1 `module`, blank line, `public import Mathlib`, then `public import TauCeti.…` for each of the nineteen modules, the docstring, then `@[expose] public section` before `open …`; and `@[instance_reducible]` on `arrangementAction` (or delete it under R01, which removes it anyway). Tested on a scratch copy with that header; see "Verified sound" for the elaboration result.

## R07 (P3) — import header: `import Mathlib` is not first and a Mathlib submodule is imported

Location: `Suggested.lean:1–21`: nineteen `import TauCeti.…` lines, then `import Mathlib`, then `import Mathlib.GroupTheory.GroupExtension.Basic`.

Witness: gate `imports=1` ("`import Mathlib` first, then only the individual `TauCeti.*` modules") and `mathlib-subimports=1`; `GroupExtension` is reachable through `import Mathlib` (the fold's own description says so for the side files).

Repair: order as in R06 and delete line 21. The submodule line is on main already; the ordering is new.

## R08 (P3) — seven README links pinned to commits of the roadmap repository

Location: `README.md:520, 1076, 1209, 1387, 1761, 1917, 1971` (gate `blob=7`), for example line 1209 "[LieHighestWeight Layer7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/8e4c6c20…/TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md)".

Witness: the gate rule "no link into the roadmap repository pinned to a commit: link a path on main, or name the roadmap and section". All seven are on main already; they fail the gate at this head.

Repair: for main roadmaps link the relative path (`../RepresentationTheory/LieHighestWeight/README.md`, `../GroebnerGeometry/README.md`, `../ReductiveGroupsPartII/README.md`); lines 520, 1761 and 1971 are rewritten by R04.

## R09 (P3) — a README link to a file this pull request deletes

Location: `README.md:687`: "Keep this explicit rank-one chart and the A2 factor-order/non-normal-stabilizer regressions in the accompanying [BruhatCoordinateTargets.lean](BruhatCoordinateTargets.lean) examples."

Witness: `git ls-tree` at this head lists no `BruhatCoordinateTargets.lean`; the description says five sentences were updated, this sixth was not.

Repair: "… regressions as Checks of this layer" (the A2 values are already in the README at lines 663–667), with no file name, since R10 deletes those examples from `Suggested.lean`.

## R10 (P3) — padding: thirty declarations that compute small values, restate definitions or close in one tactic

Location and witness (one-tactic probe run against the built module, 27 s, and reading):

- closed by one tactic in the probe: `SignedADE.neg_root_norm` (line 583, `simpa [pairing] using a.property`), `SignedADE.integralBasis_cartan` (605, `simp [integralBasis, cartan]`), `SignedADE.integralBasis_root` (608), `FoldingADE.cycleCoefficient_succ` (949, `simp [cycleCoefficient, Finset.prod_range_succ]`), `Spectral.continuous_forgetOrder` (1507, `exact continuous_quotient_mk'`);
- proved in place by one lemma, `rfl` or `decide`: `FiniteHC.finrank_indFromProjectedLevi` (78), `CoverLifts.coverAction_projection` (131), `IntegralRational.jetDualToDistributions_apply` (366), `FoldingADE.mem_fixedLieSubalgebra` (790), `fixedLieSubalgebra_toSubmodule` (793), `fixedCartan_eq_kernel` (1062), `foldedMap_E`/`_H`/`_F` (1041–1056), `BruhatCoordinates.retained_or_inverted` (1125), `not_both` (1131), `wrong_left_complement_overlaps` (1139), `correct_right_complement_contains_alpha1` (1144), `upper3_mul` (1157), `complement_first` (1167), `stabilizer_first` (1171), `recover_assemble` (1179), `assemble_recover` (1185), `nonnormal_conjugation` (1191), `coveringHomeomorph_apply` (1219);
- definitions that exist only for those Checks: `s1`, `longest`, `alpha1`, `alpha2`, `upper3`, `stabilizerS1`, `complementS1`, `recoverComplementFirst`, `assembleComplementFirst` (1134–1177).

Repair: delete them from `Suggested.lean`; the README keeps each as a Check (the A2 values and the `upper3` factor order are already at `README.md:663–687`). Never prove them in place. Probes that did not close in one tactic, so are not padding on this evidence: `signedPermutation_fixed_iff`, `epsilon_cocycle`, `point_orbitMorphism`, `translation_point`, `latticeForm_symmetric`.

## R11 (P3) — Layer 0 plans fppf descent and torsors that SchemeAndStackFoundations owns on main

Location: `README.md:124–127` ("presheaves on `CommAlgCat k`, Yoneda/representability, fppf sheafification, torsors, and faithfully-flat descent"), `README.md:170–174` ("Develop the fppf sheaf, faithfully-flat descent, torsor, and representability machinery in the cross-cutting lane"), `README.md:1049–1058` ("build the fppf sheaf coequalizers, effective affine descent … Build the needed sheaf-torsor and descent API here from Layer0 if no lower supplier has it").

Witness: SchemeAndStackFoundations on main, "## Layer 1: descent, algebraic spaces and stacks" (line 2044), "### 1.1 Descent of quasi-coherent modules and of sheaves" (2071, fpqc descent of quasi-coherent modules by comonadicity), "### 1.2 Fppf descent of quasi-finite morphisms and of algebraic spaces" (2091), "### 1.15 Torsors, torsor classes and the multiplicative group" (2502); it cites ReductiveGroups nowhere, and this README already consumes it at lines 306, 337, 379 and 421.

Repair: cite SchemeAndStackFoundations §§1.1, 1.2 and 1.15 for sheafification, descent and torsors, and keep here only the Hopf-algebra specialisation (descent of a closed subgroup scheme along `k → k̄`, the Amitsur sequence at line 515) as targets. The glued names `SchemeAndStackFoundations0.3/0.7` and `ModularCurves0F` should carry a space so the dependency check reads them (harmless today: both are on main and neither cites back).

## R12 (P3) — README shape

Location: the whole README; headings at lines 9, 27, 43, 66, 83, 118.

Witness: the house shape (Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, layers with `*Needs:*` lines, `**Checks.**` lists, Examples and Dependencies per layer, Downstream consumers, References) is absent: there is no scope or conventions section, no supplier-contract section, no `*Needs:*` line and no `**Checks.**` list anywhere in 2236 lines (the three Checks per definition live in prose), and Layers 7a–7g carry "**Supplier:**" paragraphs instead. The file predates the shape rules and this pull request does not touch its structure.

Repair: a reshaping is a revision of the roadmap and belongs with the open revisions of this folder rather than this housekeeping change; the author may answer this finding as not actionable in this package with that reason, which this review accepts.

## Verified sound

**Gate at this head** (rerun; text scanners, with the worker's build count):

```text
gate ReductiveGroups: set_option=0 blob=7 latex=0 tex=0 prnum=0 sorry-data=45 sorry-examples=0 residue=0 private-paths=0 imports=1 mathlib-subimports=1 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=42 source-material=0 build=3 FAIL
```

`outside-folder=42` counts the four other folders the brief names as the pull request's own; the diff outside those five folders is empty. `set_option=0` was confirmed by grepping every `.lean` file in the folder (none), and main's seven side files also carried none.

**Dependency check** (`--movable`, board order, content checkout):

```text
depcheck: 224 roadmaps, 2101 edges, 0 problem(s)
```

No UPWARD or CYCLE line on the committed README; R02–R04 record the edges the parser does not see (prose links and main-to-main). Cross-roadmap citations resolved: ReductiveGroupsPartII RG2.0a.1–2 and RG2.3.7 (main, lines 428 and 5201), LieHighestWeight Layer 7 (main), GroebnerGeometry G5 (main line 394), SchemeAndStackFoundations 0.3/0.7 (main), ComplexComparisonPartII C-1.1 (open head, line 31), FormalConnectionsOpers F4.3 (open head, line 1384), IntegralHeckeAndGaloisDeterminants 0.7 (open head, line 1114), InverseGaloisAndArithmeticFundamentalGroups IG.5.1 (open head, line 5317), InductionRestriction Layer 2.1 (main line 346; `Gassmann.almostConjugate_iff_permutation_equiv` is that roadmap's own planned name, lines 198 and 378, so the resolver's single lead is not a missing dependency), RootSystems Layers 1–4 (main). Ownership against the open pull requests whose files the brief lists was checked through the roadmap index: no open roadmap other than the two revisions of this folder (#1332, #1676) declares the signed ADE cover, the Kostant frame or the cameral cover.

**Pins.** `lake-manifest.json`: Mathlib `f6090c70`, Tau Ceti `358314d4`; `.lake/packages` resolves to a tree at those revisions. Declarations opened at the pins: `reductiveCommHopfAlgProperty` and `reductiveCommHopfAlgProperty_iff` (`Reductive/Basic.lean:70–82`: smooth, geometrically connected, no nontrivial connected smooth unipotent normal subgroup after algebraic closure), `HopfIdeal.IsMaximalTorus` (`Torus/Maximal.lean:50–71`, minimality among torus Hopf ideals), `unipotentRadicalDefiningIdeal` (`Unipotent/Radical/Construction.lean:72`), `pointsFunctorIsoTensorAutFunctor` (`Tannaka/GroupFunctor.lean:138`, the README's line 108 link), `RootPairing.chainBotCoeff` (`RootSystem/Chain.lean:120–123`, junk value 0 when the two roots are linearly dependent), `IsNilpotent.exp` (`Nilpotent/Exp.lean`), `IsCoveringMap.existsUnique_continuousMap_lifts` and `eq_of_comp_eq` (used by the proved `coveringHomeomorph`), `IsBorel`/`IsBorelOverAlgClosed` (`Borel/Basic.lean:148,196`). The worker-built `Suggested.olean` (4.2 MB) imports cleanly: the probe file loaded it and elaborated in 27 s.

**Elaboration with the R06/R07 header.** A scratch copy with `module` / `public import Mathlib` / nineteen `public import TauCeti.…` lines / docstring / `@[expose] public section`, without `import Mathlib.GroupTheory.GroupExtension.Basic`, and with `@[instance_reducible]` on `arrangementAction`, was elaborated with `lake env lean --root=<scratch dir> <copy>` from the worktree: exit 0, 179 `declaration uses sorry` warnings and no other warning or error (12.8 s wall). So the header repair and the removal of the submodule import cost nothing, and the gate's three build warnings are the whole build failure.

**Binder audit.** The worker's `#check @name` table (288 declarations, 65 flagged) was read entry by entry. Every flagged binder is an instance the elaborated type does not need: `[P.IsCrystallographic]` on `PBWExponent` (a function type), `[DecidableEq I]` on `Datum`, `coverGroup`, `orbitD` and 36 others of `SignedADE`/`ADECoverLifts`/`FoldingADE`, `[Category.{v} C]` on the three `OrbitGeometry` Cartesian theorems (a false positive: it is carried by `CartesianMonoidalCategory`), `[Finite ι]` on `arrangementMulAction` and `baseChangeWeylEquiv` (the Weyl-group isomorphism under base change needs no finiteness). The twelve `OrbitGeometry.Algebraic` theorems carry `IsAlgClosed`, affine, smooth, quasi-compact, finite type and separated as named instances in their own signatures, as the README's 3A hypotheses require.

**Seeded sample.**

- "Cross-cutting prerequisite: sheaves and descent" (`README.md:124–127`): a prose prerequisite with no source locator; its owner is this roadmap's Layer 0 (`README.md:170–174`), and the sections of SchemeAndStackFoundations that already own the same objects are listed under R11. Nothing to verify against a text.
- "**Supplier:**" (`README.md:691–695`): the cited section exists on main (`ReductiveGroupsPartII/README.md:5201`) and says what the sentence says (surjectivity of `g ↦ g⁻¹F(g)` for smooth connected `H` over `F_q`, `H¹(F_q,H)=1`, lifting along `H ↠ H″` with connected kernel, the `μ₂` non-example); its own `*Needs:*` lines point back into this roadmap (R02). Its Milne locators (Prop. 27.54 p. 487, Cor. 27.55–27.56 p. 488) are Part II's and were not re-read here.

The README flags no locator as unverified.

**Adversarial calculations.** Values on each side; "Pass" means the statement holds on the instance with the hypotheses as written.

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| 7a Lang's theorem (as supplied) | `H = μ₂` over `F_q`, `q` odd | Lang map `z ↦ z⁻¹ z^q = z^(q−1) = 1` on `{±1}`; `−1` not hit; excluded by geometric connectedness | Pass (hypothesis needed and present) |
| `Datum` (signed ADE Gram data) | `I = ∅` | `gram` the empty matrix, `PosDef` vacuous, `Root D = ∅`, `Carrier D = 0` | Pass (empty diagram admitted as the docstring says) |
| `Datum` wrong model | `gram = [[2,−2],[−2,2]]` (affine `A₁⁽¹⁾`) | `off_diagonal` allows only `0` or `−1`; `−2` refused; also `PosDef` fails (`x = (1,1)` gives `0`) | Pass (two laws exclude it) |
| `epsilon_cocycle` | bilinear exponent `e` | both sides `(−1)^(e(a,b)+e(a,c)+e(b,c))` | Pass |
| `epsilon_commutator` | `exponent(a,b) + exponent(b,a) = ∑_(i≠j) (−g_ij) a_i b_j` | `= −⟨a,b⟩ + ∑_i 2 a_i b_i ≡ ⟨a,b⟩ (mod 2)` | Pass |
| `Cover` inverse | `e = (a, s)` | `e * e⁻¹ = (0, s·s·ε(a,−a)·ε(a,−a)) = (0,1)` | Pass |
| `sectionLift_inverse` | `(a,1)⁻¹` | `(−a, ε(a,−a))`; right side `(0,ε(a,−a))·(−a,1) = (−a, ε(a,−a)·ε(0,−a)) = (−a, ε(a,−a))` | Pass |
| `signInclusion_central` | `(0,s)·(a,t)` vs `(a,t)·(0,s)` | `(a, st·ε(0,a)) = (a, ts·ε(a,0))`, both exponents `0` | Pass |
| `normalized_opposite`, positive root | `a ≥ 0` | `ẽ_a = e_a`, `ẽ_(−a) = ε(a,−a) e_(−a)`, bracket `ε(a,−a)² h_a = h_a` | Pass |
| `normalized_opposite`, negative root | `a < 0` | `ẽ_a = ε(−a,a) e_a`, bracket `ε(−a,a) ε(a,−a) h_a`; by `epsilon_commutator` with `⟨a,−a⟩ = −2`, `ε(a,−a) = ε(−a,a)`, product `1` | Pass |
| `normalized_opposite`, simple root | `a = α_i` | `exponent(α_i, −α_i) = 0`, `ε = 1`, `[e_i, e_(−i)] = h_i` | Pass (Chevalley sign) |
| `rootLineQuotientEquiv_generator` | `e`, `τe` | `[e] + [τe] ↦ s·[a] + (−s)·[a] = 0`; quotient free on `Root D` | Pass |
| `bracket` conventions | `z = (h, 0)`, `w = (0, e_b)` | `bracket = ⟨h,b⟩ e_b`; `bracket (0,e_a) (h',0) = −⟨h',a⟩ e_a` | Pass (antisymmetric) |
| `root_constant_size` junk value | `root j = −root i`, or `j = i` | `root i + root j = 0` or `2·root i`, neither a root (`⟨root k, coroot k⟩ = 2`, reduced), so `chainBotCoeff` is only evaluated on independent pairs | Pass (junk value never reached) |
| `ReductiveChevalleyFrame` | `m = 0, r = 0` and `m = 0, r = 1` | `L = 0`; `L = 𝔱` one-dimensional, no root fields | Pass |
| `finiteOrderDistributions` closure | `f ∈ I^(a+1)^⊥`, `g ∈ I^(b+1)^⊥` | `f*g` kills `I^(a+b+2)` since `i+j = a+b+2` forces `i > a` or `j > b` | Pass (subalgebra) |
| `rationalDistributionAction_on_weight` | `coact m = m ⊗ c` | `f·m = f(c) m` | Pass |
| `epsilon_action` | `e(σa,σb) − e(a,b)` | `≡ ∑_(i<j, σj<σi) (−g_ij)(a_i b_j + a_j b_i) = r(a+b) − r(a) − r(b) (mod 2)` using `g` σ-invariant | Pass |
| `coverLift_simple` | `a = single i 1` | `r(a) = 0` (needs `i<j` with `a_i a_j ≠ 0`), sign `1`; `permQ σ a = single (σ i) 1` | Pass |
| `coverLift_iterate` | `σ = 1` | `r(a) = 0` for all `a`, `coverLift 1 = id` | Pass |
| `foldedCartan`, `A₃` folded by the flip | orbits `{1,3}`, `{2}` | `orbitD = 2, 2`, factors `1`; matrix `[[2,−2],[−1,2]]` | Pass (`B₂/C₂`) |
| `foldedCartan`, `A₂` folded | one orbit `{1,2}` | `orbitD = 2 + (−1) = 1`, factor `2`, entry `2·(2−1) = 2` | Pass (`A₁`) |
| `folded_HE`, `A₂` | `H = 2(h₁+h₂)`, `E = e₁+e₂` | `[H,E] = 2((2−1)e₁ + (−1+2)e₂) = 2E`; `[E, 2(f₁+f₂)] = 2(h₁+h₂) = H` | Pass |
| signed fixed subalgebra, `A₂` | `e₁₂ = [e₁,e₂]`, `a = (1,1)` | `r(a) = (−(−1))·1·1 = 1`, sign `−1`, so `e₁₂ ↦ −e₁₂`, not fixed; fixed part `⟨H,E,F⟩` three-dimensional | Pass (`𝔰𝔩₂`) |
| `orbitD_eq_one_or_two` | ADE forest | an orbit with two orbit-neighbours per vertex contains a cycle; `A_(2n)` middle pair gives `1` | Pass |
| `signedCycleEquiv` | `J = ℤ/m` cyclic, `s` | `f(ρ^r j₀) = (∏_(k<r) s_k) f(j₀)`, consistency `(∏ s) f(j₀) = f(j₀)` | Pass |
| `fixedIntegralBasis` index | root orbit with `monodromy = −1` | `c_(r+1) = sign_r c_r` forces `c₀ = −c₀ = 0` | Pass (excluded orbits contribute nothing) |
| `smithKernelEquiv` | `S = U⁻¹ D V⁻¹` | `x ∈ ker S ⇔ D(V⁻¹x) = 0 ⇔ d_i (V⁻¹x)_i = 0`; `d_i = 0` keeps a full factor | Pass |
| `retained`/`inverted`, `A₂` | `w = s₁`, `α₂ = (1,2)` | `s₁⁻¹1 = 0 < s₁⁻¹2 = 2`: retained; `(w₀s₁)⁻¹ = s₁w₀`: `1 ↦ 0`, `2 ↦ 1`: retained (overlap, `README.md:663`) | Pass |
| `correct_right_complement_contains_alpha1` | `w = s₁`, `α₁ = (0,1)` | `s₁⁻¹1 = 0 < s₁⁻¹0 = 1`: inverted; `(s₁w₀)⁻¹ = w₀s₁`: `0 ↦ 1`, `1 ↦ 2`: retained | Pass (`I_w = A_(w w₀)`) |
| `upper3_mul` | entries | `(1,3)` entry `c + c' + a b'` | Pass |
| `complement_first` | `a,b,c` | `upper3 a 0 0 · upper3 0 b (c−ab) = upper3 a b (c − ab + ab)` | Pass |
| `nonnormal_conjugation` | `u(1,0,0) u(0,1,0) u(−1,0,0)` | `= upper3 0 1 1 ∉ U_(α₂) = {upper3 0 b 0}` | Pass (docstring's claim) |
| `coveringHomeomorph` | hypotheses | total space preconnected, base simply connected and locally path-connected; `e₀` fixes the lift | Pass (proved) |
| `boundary_dimension_lt` | `G` with two components, `X = G` acting on itself | orbit `= X`, closure `= X`, boundary `∅`, `dim ∅ = ⊥ < dim X` | Pass (no connectedness needed) |
| `exists_closed_orbit` | `X = ∅` | `Points X = ∅`; excluded by `Nonempty (Points X)` | Pass (hypothesis needed and present) |
| `minimal_dimension_orbit_closed` | `G = 𝔾_m` on `𝔸¹` | orbits `{0}` (dim 0) and `𝔸¹∖0` (dim 1); the minimum is `{0}`, closed; the other is not | Pass (direction of the inequality) |
| `compact_complexPoints`, `hausdorff_complexPoints` | `X = ∅`, `X = Spec ℂ` | zero or one point | Pass |
| `TorusRegular` | `SL₂`, `t = diag(a,−a)` | `[t, e] = 2a e`; centraliser `= 𝔱` iff `a ≠ 0`; `t = 0` has centraliser `𝔤 ≠ 𝔱`, excluded | Pass |
| `TorusRegular`, torus | `G = T = 𝔾_m` | `𝔱 = 𝔤`, condition true for every `t` including `0`; `Cameral ≅ 𝔱`, `FlagCoset` a point, `cameralEquiv` the identity | Pass |
| `simplyConnected_flagCoset` | `G = O₂ ⊃ SO₂` | `G/T` two points, not simply connected; excluded because `reductiveCommHopfAlgProperty` includes geometric connectedness (`Reductive/Basic.lean:81`) | Pass (hypothesis carries it) |
| `simplyConnected_flagCoset` | `G` connected reductive | `π₁(T) → π₁(G)` onto (`π₁(G) = X_*(T)/coroots`), `π₀(T) = 0`, so `π₁(G/T) = 0` | Pass |
| `cameralEquiv` injectivity | `(gT,t)`, `(g'T,t)` with `Ad(g)t = Ad(g')t` | `g⁻¹g' ∈ Z_G(t) = T` for `t` regular | Pass |
| `centerHomeomorph` | `n = 0` | `OrderedPlane 0` a point, `ℂ × CenteredPlane 0 ≅ ℂ`; excluded by `0 < n` | Pass (hypothesis needed and present) |
| `permutation_extension_nonsplit` | `n = 2`; `n = 1` | `B₂ = ℤ` has no element of order 2; `n = 1`: `S₁` trivial, a section exists, excluded by `2 ≤ n` | Pass |
| `planeBraidEquiv`, `matrixSpectrum` | `n = 0` | both configuration spaces a point, `charpoly = 1` separable | Pass |
| `arrangementArtinEquiv` | `W` on the regular complement | `W` acts freely (Steinberg), quotient `π₁` the Artin group; fixed directions of a non-spanning pairing contribute a contractible factor | Pass |
| 6A Levi headline (R05) | Borel of `SL₂`, `J = (b)` vs `J = (a−1)` | composite bijective vs `a ↦ 1` not injective | Pass (excludes "any Hopf ideal") |

**Principles.** No copied passage, no algorithm, no process word, no pull-request number in README or Lean; `set_option` absent; the description's claim "no statement changes" verified by the line-set comparison. Two sources' numbering (Conrad–Feng handout, Jantzen) were not re-read: no sampled target cites them.

## Not verifiable

- Milne, *Algebraic Groups*, Prop. 27.54 and Cor. 27.55–27.56 (the locators ReductiveGroupsPartII records for Lang's theorem): a Cambridge University Press book, not in the sources cache; cited by locator under R02 as Part II records it.
- Conrad–Feng, *Reductive Groups over Fields* §6.3, Prop. 12.3.1, App. H.1; Jantzen; Waterhouse; Borel; Springer; SGA 3 Exp. XIX; Conrad–Gabber–Prasad: cited by locator only in the README; none is in the seeded sample and no finding touches them.
- Ownership against open pull requests whose files the brief does not give was checked only through the roadmap index (`roadmaps grep`), not by reading them.

## Source issues

- none
