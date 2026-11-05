# Review of ReductiveGroups (pull request #1808 at ea43766)

**Verdict:** needs changes

The pull request changes three lines of this folder (Layer 7g, `TauCetiRoadmap/ReductiveGroups/README.md` lines 977–980: the Steinberg paragraph now points its ordinary-Lang citation at Layer 7a instead of naming ReductiveGroupsPartII directly). The brief asks for a full review of the folder, and the gate fails on the folder as it stands (`build=2`, `sorry-data=5`, `imports=1`, `mathlib-subimports=1`, `blob=7`, `outside-folder=2`), so the findings below cover the whole folder; R01 is the one the pull request's own change touches.

## R01 (P1) — ReductiveGroups and ReductiveGroupsPartII cite each other

**Location.** `TauCetiRoadmap/ReductiveGroups/README.md` line 692: "**Supplier:** ReductiveGroupsPartII RG2.3.7 owns ordinary q-Frobenius Lang surjectivity"; line 716 ("owned by ReductiveGroupsPartII, RG2.3.7 *lang-theorem*"); line 839 (Layer 7d consumes *lang-theorem* and *fixed-coset-lifting*); line 1077 (Layer 8 consumes RG2.0a.1–2 Weil restriction). The pull request's own edit (lines 977–980) routes Layer 7g to the same citation through Layer 7a.

**Claim.** Part II is a supplier of Part I.

**Witness.** `TauCetiRoadmap/ReductiveGroupsPartII/README.md` on main, "### From TauCetiRoadmap.ReductiveGroups" (line 341): it assumes ReductiveGroups layers 0, 2, 3, 4, 5, 6, 7 and 9. Its RG2.3.7 *lang-theorem* ends "*Needs:* ReductiveGroups layer 3" and *lang-for-pro-algebraic-groups* "*Needs:* *lang-theorem*; ReductiveGroups layer 0" (lines 5230–5246). So Layer 7a → RG2.3.7 → Layers 0 and 3 is a cycle between two roadmaps on main. The dependency check reports `0 problem(s)` only because its upward check exempts roadmaps on main; the cycle is real.

**Repair.** Lang's theorem is foundational to Part I's finite-field lane, so the notion moves down: state in Layer 7a, as this roadmap's own targets, (a) the ordinary q-Frobenius Lang theorem for a smooth geometrically connected finite-type group over `F_q` (Milne, *Algebraic Groups*, Prop. 27.54 and Cor. 27.55, as Part II cites them) and (b) the fixed-coset lifting lemma, and move the Lean statement into this roadmap's `Suggested.lean`: it is statable at the pins exactly as `TauCetiRoadmap/ReductiveGroupsPartII/Suggested.lean` states `Lang.lang_surjective` (with `TauCeti.FiniteTypeCommHopfAlgCat`, `TauCeti.smoothCommHopfAlgProperty`, `TauCeti.geometricallyConnectedCommHopfAlgProperty`, `WithConv` and the `q`-power map on `AlgebraicClosure F`). ReductiveGroupsPartII RG2.3.7 then cites ReductiveGroups Layer 7a. For line 1077, either state the finite-locally-free affine Weil restriction as a Layer 0 target here or move the pseudo-reductive examples (`Res_(K/k) G_m`) into Part II; never cite Part II from Part I. The pull request already edits other roadmaps on main for the same reason, so the Part II side of the move belongs in it.

## R02 (P1) — Layer 11 consumes FormalConnectionsOpers and InverseGaloisAndArithmeticFundamentalGroups, which consume this roadmap

**Location.** README lines 1964–1966 ("The lower smooth/holomorphic dictionary of FormalConnectionsOpers F4.3 … is a prerequisite for the analytic charts here"), 1972 (IG.5.1), 1996 (IG.3.2), 2082 and 2099 (FCO's analytification and inverse-function dictionaries).

**Claim.** FCO F4.3 and IG.5.1 are suppliers of Layer 11.

**Witness.** FormalConnectionsOpers at its open head has "### From TauCetiRoadmap.ReductiveGroups" (line 241) and `*Needs:*` lines 948, 1123, 1161, 1195 and 1260 consuming ReductiveGroups Layers 0–9 and 6B (line 68: "ReductiveGroups Layers 0–9 and 6B owns …"). InverseGaloisAndArithmeticFundamentalGroups at its head consumes ReductiveGroups Layers 0, 3 and 6 at lines 394, 1453, 1483, 4269, 4466 and 4573. Both are therefore consumers of Layers 0–9 and suppliers of Layer 11: a cycle at roadmap level.

**Repair.** Nothing in Layers 0–10 consumes Layer 11, and Layer 11 consumes only sibling roadmaps (FCO, IG, LieGroups Layer 8, DGFloer, AlgebraicTopology, ReflectionInvariantTheory). Split Layer 11 (with `SpectralWeylTargets.lean`) into a Part roadmap placed after FormalConnectionsOpers and InverseGaloisAndArithmeticFundamentalGroups in the merge order, whose introduction says that ReductiveGroups stops at Layer 10. With R01 this leaves ReductiveGroups with downward suppliers only.

## R03 (P1) — sorry'd data in `Suggested.lean` and in the six companion Lean files

**Location.** `TauCetiRoadmap/ReductiveGroups/Suggested.lean` lines 89 (`liftSubgroup`, three `sorry` proof fields), 119 (`characterTwist`), 127 (`characterInclusion`), 134 (`characterKernelEquiv : … := by sorry`), 143 (`liftableExtension`). Companion files, counted by reading each `def`/`instance`/`structure` body: `SignedADETargets.lean` 25 `sorry` lines (e.g. line 221 `def normalizationEquiv … := by sorry`, line 143 `def rootLineQuotientEquiv`, line 172 `def lieRing`), `CoverLiftTargets.lean` 17, `FoldingADETargets.lean` 16 (line 248 `def simpleRoot … ⟨Pi.single i 1, by sorry⟩`, line 190 `fixedIntegralBasis`), `IntegralRationalTargets.lean` 9, `SpectralWeylTargets.lean` 9 (line 118 `matrixSpectrum … := sorry`, line 63 `centerHomeomorph`). `BruhatCoordinateTargets.lean` and `OrbitGeometryTargets.lean` have none.

**Claim.** Honest "sorry construction targets" (README line 120).

**Witness.** The gate rule `sorry-data` (5 hits) and the brief's principle: no `def`, `abbrev`, `instance` or `opaque` whose body is `sorry`, and nothing that mentions one (`characterKernelEquiv_value`, line 138, mentions `characterKernelEquiv`). The companion files are not built by the gate, import `Mathlib.<submodule>` lines (every file except `SpectralWeylTargets.lean`, which has `import Mathlib` after eleven other imports) and are API catalogues.

**Repair.** Delete the five sorry'd definitions and `characterKernelEquiv_value` from `Suggested.lean` (the README's 9A.1a-L keeps the statements). Delete the six companion `*Targets.lean` files: the README already says it "remains definitive" (line 120), every one of their statements is a README target, and the file form admits only `Suggested.lean`. If any companion is kept, it must carry no sorry'd data, a single `import Mathlib` plus `TauCeti.*` modules, and no import of another file of this folder.

## R04 (P2) — `Suggested.lean` states no headline theorem; statable ones are absent, the rest is padding

**Location.** `Suggested.lean` lines 5–23 (docstring: "suggest Lean forms for particular milestones"), 34–43, 55–64, 99–116.

**Claim.** The file is the acceptance test of the roadmap.

**Witness.** Headline theorems of the README: the embedding theorem (Layer 1), Nagata's theorem (Layer 6, line 475: over an algebraically closed field of characteristic `p` a smooth connected affine linearly reductive group is a torus), Levi complements in characteristic zero (6A), Lang's theorem (7a), the Bruhat decomposition (7), the Steinberg module `Δ((p−1)ρ) ≃ L ≃ ∇` of dimension `p^|Φ⁺|` (10B), classification of simples by `X⁺` (10B). Nagata is statable at the pins: `Coalgebra.IsLinearlyReductive` (`TauCeti/Algebra/Coalgebra/Comodule/LinearlyReductive.lean` line 227), `torusCommHopfAlgProperty` (`TauCeti/Algebra/AlgebraicGroup/Torus/Basic.lean` line 107), `smoothCommHopfAlgProperty` (`…/Smooth/CommHopfAlgCat.lean` line 40), `geometricallyConnectedCommHopfAlgProperty` (`…/Connected/CommHopfAlgCat.lean` line 61) and `FiniteTypeCommHopfAlgCat`; Lang is statable as Part II states it (R01). Neither is in the file. What is there: `globalSectionsHopfAlgebra` and `specGroupObject` are `inferInstance` restatements of pinned instances; `finrank_indFromProjectedLevi` is closed by the single library lemma `TauCeti.finrank_indFDRep` (its own proof, line 64); `coverAction_projection` is `l.property.2 e`, a restatement of the carrier; the README (line 823) states the dimension theorem over `ℂ` while the Lean has `[Field k]`. The signature check (`#check` of all 16 declarations, the worker's `signatures.md`) shows no dropped binder.

**Repair.** Rewrite `Suggested.lean` in the acceptance-test form: docstring "Reductive algebraic groups: target signatures" naming the headlines that are not statable (Bruhat, Steinberg module, highest-weight classification, Levi complements: the Weyl group of a group, Weyl modules and the unipotent radical as scheme carriers are missing at the pins), the Nagata and Lang statements with `sorry`, and nothing else; delete the four padding declarations (P3 on their own; the README keeps the statements).

## R05 (P1) — Citations of RootSystems sections that exist nowhere

**Location.** README line 654 ("[RootSystems Layers1–4]"), 1132 ("the actual finite realizations of [RootSystems Layers5–6]"), 1274 ("[RootSystems4A]'s actual Weyl/based factorization"), 1479 ("RootSystems' valid-type reindexing in low rank"), 2041 ("RootSystems Layer2's `weylCoxeterSystem`").

**Claim.** RootSystems supplies finite realizations (Layers 5–6), a Weyl/based factorization of unbased root automorphisms (4A) and Layer 4.

**Witness.** `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md` on main has exactly Layers 1 (geometric roots, line 248), 2 (the marked Weyl presentation, line 432) and 3 (classification and concrete Weyl groups, line 504); no Layer 4, 4A, 5 or 6. RootSystemsPartII (open pull request) has Layers 1–4 on integral dominance and folding and itself has "### From TauCetiRoadmap.ReductiveGroups" (its line 57), so it cannot be the supplier. `weylCoxeterSystem` is a pinned Tau Ceti declaration (`TauCeti/LinearAlgebra/RootSystem/Coxeter/Presentation.lean` line 41 names its injectivity as the remaining target), so line 2041 is sound once "Layer 2" is read as the injectivity target of RootSystems 2.1.

**Repair.** Repoint line 654 to RootSystems Layers 1–3 by section, and for lines 1132, 1274 and 1479 either cite the existing section that provides the object (Layer 1.4 integral comparison, Layer 3 classification) or state the missing finite realizations and the Weyl/based factorization as targets of 9A.1a here (the notion moves down).

## R06 (P2) — ComplexComparisonPartII C−1.1 does not offer the five interfaces named

**Location.** README lines 377–379: "consume ComplexComparisonPartII C−1.1's actual `.complexPoints`, `.closedSubspace`, `.proper`, `.separatedHausdorff` and `.smooth` interfaces".

**Witness.** ComplexComparisonPartII at its open head, §C-1.1 "Analytic local models and scheme analytification" (line 724), defines `complexSchemeAnalytification` on locally-finite-type schemes over `Spec ℂ` with its universal property and identifies the underlying space with `X(ℂ)` in the classical topology (lines 51–57 of the section). None of the five names occurs anywhere in that README; properness and compactness of complex points are not stated in C-1.1.

**Repair.** Cite `complexSchemeAnalytification` and its universal property by name; cite the "proper scheme has compact Hausdorff complex points" statement at the section of ComplexComparisonPartII that states it (Layer C2, "Projective and proper consequences of coherent GAGA") or state it as a target of 3A.5 here.

## R07 (P2) — The cross-cutting "sheaves and descent" lane re-plans pinned and owned work

**Location.** README lines 123–127 ("presheaves on `CommAlgCat k`, Yoneda/representability, fppf sheafification, torsors, and faithfully-flat descent"), 169–173 ("Develop the fppf sheaf, faithfully-flat descent, torsor, and representability machinery in the cross-cutting lane"), 514–516, 1048–1059 ("Build the needed sheaf-torsor and descent API here from Layer0 if no lower supplier has it").

**Witness.** At the Tau Ceti pin: `TauCeti/Algebra/AlgebraicGroup/Fppf/Basic.lean` (affine-group points on the affine fppf site, the topology induced from Mathlib's fppf topology), `Fppf/Quotient/Torsor.lean` (the fppf quotient `G → G/V(I)` as a torsor), `Fppf/Quotient/{Kernel,Cokernel,Exact,Finite,Homogeneous}.lean`, and `FaithfullyFlatDescent.lean` (points over `A` are the equalizer of points over `B ⇉ B ⊗_A B` for faithfully flat `A → B`, via `Algebra.IsEffective.of_faithfullyFlat`). SchemeAndStackFoundations at the pull request's head owns §1.1 (descent of quasi-coherent modules and sheaves, and by this pull request's own description effective fpqc descent of affine, finite locally free and closed subschemes), §1.15 (torsors and torsor classes) and §1.17 (categorical and geometric quotients). No locator or supplier is given for the lane.

**Repair.** Delete the lane's own construction; in a supplier-contracts section cite the pinned `TauCeti.Algebra.AlgebraicGroup.Fppf.*` modules and `TauCeti.Algebra.AlgebraicGroup.FaithfullyFlatDescent` by name and SchemeAndStackFoundations §1.1, §1.15 and §1.17 by section; keep only the Hopf-point comparison adapters that none of them states, each with a locator.

## R08 (P3) — README shape: no supplier contracts, no `*Needs:*` lines, no Checks, Layers 2–8 without locators

**Location.** Whole README: headings `## Standing hypotheses`, `## Three synchronized models`, `## Mathlib foundations to use`, `## Remaining roadmap targets`, `## Implemented foundations to consume`; Layers 2–8 (lines 227–247, 432–477, 627–651, 1023–1090) are bullet lists with no theorem or page locator; no layer has `### Examples`/`### Dependencies`; no definition has a `**Checks.**` list.

**Witness.** Compare `TauCetiRoadmap/ReductiveGroupsPartII/README.md` (Scope and ownership, Conventions, Exact supplier contracts, How to read the build, `*Needs:*` per target, Checks). Every theorem of Layers 2–7 ("Lie–Kolchin", "Jordan decomposition", "Borel conjugacy", "isomorphism and existence theorems") is stated without a locator.

**Repair.** Restructure to the house shape: `## Scope and ownership` (listing the deferrals of R01, R02, R07), `## Conventions`, `## Exact supplier contracts` (per supplier, the declarations and sections consumed, including every native name now scattered through the text), `## How to read the build`, and per target a locator and a `*Needs:*` line; at least three Checks per definition.

## R09 (P3) — Gate failures: commit-pinned links, import order, a Mathlib submodule import, a build warning, edits outside the pull request's folders

**Location.** README lines 521, 1077, 1210, 1388, 1762, 1918, 1972 (links of the form `github.com/TauCetiProject/TauCetiRoadmap/blob/<sha>/…`); `Suggested.lean` lines 1–3 (`import TauCeti.RepresentationTheory.Induction.FiniteDimensional.Basic` before `import Mathlib`, then `import Mathlib.GroupTheory.GroupExtension.Basic`); the targeted build's warning on line 3's import; the diff outside the pull request's named folders: `Completed/ArithmeticDirichletSeries/README.md` (one line) and `TauCetiRoadmap/SymplecticGeometry/README.md` (one line).

**Witness.** `gate.md` of this head; `git diff --stat origin/main...HEAD` excluding the named folders lists the two files. Elaboration with `lake env lean` of `Suggested.lean` gives six `declaration uses sorry` warnings and nothing else, so the second build warning is the submodule import and goes with it; the first ("imports `Mathlib` … consider adding `module`") is emitted for the plain `import Mathlib` line and I could not determine whether the gate treats it as a failure for every roadmap.

**Repair.** Replace each pinned link by the roadmap name and section (e.g. "IntegralHeckeAndGaloisDeterminants §0.7", "LieHighestWeight Layer 7", "GroebnerGeometry G5", "InverseGaloisAndArithmeticFundamentalGroups IG.5.1"); make the header `import Mathlib` followed by the `TauCeti.*` modules used and delete line 3 (`GroupExtension` is in `Mathlib`); drop the two one-line edits outside the folders from this pull request or name those folders as its own.

## R10 (P3) — Process narrative and references to work state

**Location.** README line 4 ("Suggested home: …"), 1638 ("`TauCeti.SpStd.specialIsogeny`, done"), 1652 ("carriers … that do not yet exist"), 2183 ("## Design notes (from Zulip)"), 2231 ("mathlib4#39281"), the headings "## Remaining roadmap targets" (66) and "## Implemented foundations to consume" (83), and 1637–1650, where the construction of the `G₂`/`F₄` special isogenies is deferred to "the CFSG roadmap's carrier plan", a consumer's document.

**Repair.** Timeless wording: state what is built, not what is done or missing; move the Zulip design notes to `## Design references` without the pull-request number; state the `G₂`/`F₄` isogeny constructions in 9B itself (a supplier's target is not specified by its consumer).

## R11 (P3) — Layer 3 overstates the hypothesis for the component group

**Location.** README lines 241–242: "Under smoothness (and over a perfect field, or suitable hypotheses) `π₀(G)` is finite étale."

**Witness.** For any group scheme of finite type over a field, `π₀(G)` is finite étale (the quotient `G/G°` is finite étale for every finite-type group scheme over a field; no smoothness enters). Instance: `μ_p` over `F_p` is not smooth and `π₀(μ_p) = 1` is finite étale; `G = μ_p × ℤ/2` likewise. The hypothesis is unused, not false.

**Repair.** State it for every finite-type group scheme over a field, with a locator.

## Verified sound

**Gate and dependency check.** Gate at ea43766: `FAIL` (counts above). Dependency check: `depcheck: 230 roadmaps, 2111 edges, 0 problem(s)`; no UPWARD or CYCLE line (the cycles of R01–R02 are between roadmaps on main or open heads that the check exempts). Elaboration: `lake env lean TauCetiRoadmap/ReductiveGroups/Suggested.lean` exits 0 with six `sorry` warnings only. Signatures: all 16 elaborated types in the worker's `signatures.md` compared with the README; none lost a binder; the one generality mismatch is in R04.

**Seeded sample.** (1) "Cross-cutting prerequisite: sheaves and descent" (README 123–127): no locator, no supplier; the objects exist at the pin and in SchemeAndStackFoundations: R07. (2) "**Supplier:** ReductiveGroupsPartII RG2.3.7" (README 692): the section exists on main (`TauCetiRoadmap/ReductiveGroupsPartII/README.md` line 5201), states Lang's theorem for a smooth connected group over `F_q` with the `q`-Frobenius, surjectivity on `H(F̄_q)`, with Milne AG Prop. 27.54/Cor. 27.55, and *fixed-coset-lifting* (line 5260) with the `S₄`/`ℤ/4` checks; the statement restated at README 716–718 ("smooth geometrically connected group of finite type over `F_q`") matches the supplier's hypotheses. The direction is the defect (R01).

**Sources opened.** `mcninch` (cached): §2.2 (line 138, groups with a normal split unipotent subgroup), §2.3 (169, condition (L)), §3.1 (236), §4.1 (330, Hochschild complex, with Jantzen I.4.16 at 343), §4.3 (399, group extensions), §4.4 (421: extensions of `G` by a vector group `V` are classified by `H²(G,V)`, split iff the class vanishes, with `E_α = G × V`, `(g,v)(g′,v′) = (gg′, v+v′+α(g,g′))`), §4.5 (448, conjugacy of complements by `Z¹`/`H¹`), §5.1 (485, conjugacy of Levi factors by `H¹` vanishing along a linearizable splitting sequence), §5.2 (507, existence by `H²`). All eight sections cited at README 611 exist and support the Layer 6A route. Dudas–Michel, *Lectures on finite reductive groups* (author page PDF, read via pdftotext): Prop. 8.7 p. 31 (unique Levi complement containing `T`; conjugacy under a unique element of `R_u(P)`), Prop. 8.9 p. 32 (hypothesis exactly "Levi complements `L` and `M` containing `T`"; `(P∩Q)·U` parabolic with Levi `L∩M`; `P∩Q` connected with the unique factorization `(L∩M) ⋉ ((L∩V)(M∩U)(U∩V))`), Prop. 7.5, Lemma 7.6 and Prop. 7.7 p. 25, Theorem 9.6 p. 37 (Mackey formula with `S(L,M)`), Lemmas 9.9–9.11 p. 38 (`P\G/Q ≃ W_L\W/W_M`; the transporter bijections; the piece bijection `L^F/(L∩xV)^F ×_{(L∩xM)^F} (xM∩U)^F\xM^F → U^F\P^F x Q^F/V^F`), Theorem 10.1 p. 41 (common-Levi independence, proved there for `Λ = ℂ` with the general case attributed to Howlett–Lehrer and Dipper–Du). Layers 7b–7e restate each with the same hypotheses.

**Cross-roadmap citations resolved.** On main: ReductiveGroupsPartII RG2.3.7, RG2.0a.1–2 (lines 963, 1128); LieHighestWeight Layers 3–4 (405, 537) and 7 (931); LieGroups Layers 6–8 (383, 407, 428; Layer 8 states Bruhat cells of complex dimension `ℓ(w)`); InductionRestriction Layer 2.1 (346; `Gassmann.almostConjugate_iff_permutation_equiv` is IR's own README target, line 378, so the citation tool's "found nowhere" lead is not a defect); SmoothBundlesConnections B1.1 (315), B1.4 (421); LieGroupoidsPoisson G0.1 (299); DGFloer Layer 1 item 2 (the fibration long exact sequence); GroebnerGeometry G5 (394); RootSystems Layers 1–3 (R05 for the rest); CFSGStatement L5; ModularCurves 0F (516); ChevalleyGroups on main cites ReductiveGroups Layer 9 as the constructor of `G_sc(t)`, so Layer 9 has a single owner. At the pull request's head: SchemeAndStackFoundations 0.3 (542), 0.7 (809), 2.6 (3623). At open heads: IntegralHeckeAndGaloisDeterminants §0.7 (lines 1114–1555) does contain the rational cohomology of a flat affine group scheme (cofree resolution, enough injectives) and algebraic induction as the cotensor equalizer with `F(hg)=hF(g)`, as Layers 6A and 10B cite; it does not consume ReductiveGroups. FormalConnectionsOpers F4.3 and F6 exist (R02 for direction). InverseGaloisAndArithmeticFundamentalGroups IG.5.1 (5317) and IG.3.2 (2678; its Hurwitz move is `(a,b) ↦ (aba⁻¹, a)` with inverse `(b, b⁻¹ab)`, as README 1996 says). ComplexComparisonPartII C-1.1 exists (R06 for its interfaces).

**Library declarations opened at the pins.** `Coalgebra.IsLinearlyReductive`, `torusCommHopfAlgProperty`, `smoothCommHopfAlgProperty`, `geometricallyConnectedCommHopfAlgProperty`, `FiniteTypeCommHopfAlgCat.baseChangePointsMulEquiv` (`FiniteType/BaseChange.lean` 290), `TauCeti.Bialgebra.iterateFrobeniusPoints` (`Frobenius/Points.lean` 66), `frobeniusFixedPointsMulEquiv` (`Frobenius/FixedPoints.lean` 174), `TauCeti.indFDRep`/`finrank_indFDRep` (`Induction/FiniteDimensional/Basic.lean` 298, 487), `ArtinGroup.exponentSum` (`GroupTheory/Coxeter/Artin.lean` 226), `weylCoxeterHom`, `coxeterMatrixOfBase`, `rootPairingBaseChange`, `IsQuotientCoveringMap.fundamentalGroupToMulOpposite`, `indTrivialEquiv`, `kostantFormComul_dividedPower`, `Comodule.Hom.exists_fixed_preimage_of_isLinearlyReductive`, `serreDiagramAut_iterate_eq_id`, `serreLift`, `geckLieEquivOfEquiv`, `DynkinType.diagramAut`, `DynkinType.simplyConnectedRootDatum`, `SpStd.specialIsogeny`, `pointsFunctorIsoTensorAutFunctor`, `exists_finite_subcomodule_matrixCoefficientSubalgebra_eq_top`; Mathlib `IsCoveringMap.eq_of_comp_eq` (`Topology/Covering/Basic.lean` 367), `dense_smoothLocus_of_perfectField`, `Rep.indCoindIso`. All sixteen `TauCeti.*` modules the companion files import exist at the pin. No native name cited by the README is missing at the pins.

**Adversarial table.** One row per statement checked; values computed on each side.

| Statement | Instances tried | Values | Result |
|---|---|---|---|
| 7C rank-one identity `x_α(a)x_−α(b) = x_−α(b/(1+ab)) α∨(1+ab) x_α(a/(1+ab))` (657) | SL₂, `x_α(a)=[[1,a],[0,1]]`, `x_−α(b)=[[1,0],[b,1]]`, `α∨(t)=diag(t,t⁻¹)` | LHS `[[1+ab,a],[b,1]]`; RHS `[[c, a],[b, (ab+1)/c]]` with `c=1+ab` → `[[1+ab,a],[b,1]]` | equal |
| `n_α(a) = x_α(a)x_−α(−a⁻¹)x_α(a)` (658) | SL₂, `a≠0` | `[[0,a],[−1/a,0]]`, normalizes the torus | sound |
| 7C.2 `A_w`, `I_w` partition `Φ⁺`; `I_w = A_(w w₀)`; A2 example (663–666) | A2, `w=s₁`, `w₀=s₁s₂s₁` | `A_{s₁}={α₂,α₁+α₂}`, `I_{s₁}={α₁}`; `ww₀=s₂s₁`, `A_{s₂s₁}={α₁}`; `w₀w=s₁s₂`, `A_{s₁s₂}={α₂}` | matches text: `H_{w₀w}` has root `α₂`, complement has `α₁` |
| 7C.2 `H_{s_i}` all positive roots except `α_i`; `H_{s_i w₀}=U_{α_i}`; `H_e=U⁺`, `H_{w₀}=1` (666) | general `W`, `s_i` | `A_{s_i}=Φ⁺∖{α_i}`; `A_{s_i w₀}={β>0: s_iβ<0}={α_i}`; `A_e=Φ⁺`, `A_{w₀}=∅` | sound |
| 7C.3 derivative `L_u:(X,Y)↦Ad(u⁻¹)X−Y` of `(h,j)·u=huj⁻¹` (669) | `d/dt` of `exp(tX)u exp(−tY)` at 0, left-trivialized | `u⁻¹(Xu−uY)=Ad(u⁻¹)X−Y`; invertible at `u=1` iff `Lie(H_w)⊕Lie(J_w)=Lie(U⁺)` | sound |
| 7C.5 cell dimension `|I_w|=ℓ(w)`; GL₂ chart `a↦[a:1]` (684, 688) | `w=s₁` in A2; GL₂ with `u(a)=[[1,a],[0,1]]`, `n₀e₁=±e₂` | `|I_{s₁}|=1=ℓ(s₁)`; `u(a)n₀e₁=±(a,1)`, inverse `x/y` on `y≠0`; `u(a)B⁺=B⁺` constant | sound |
| 6A `c_b=c+db` with `s_b=i(b)s`, `db(g,h)=g·b(h)−b(gh)+b(g)`; `s_a=i(−v)s₀ i(v)` for `a(g)=g·v−v` (564–570) | symbolic, `i(v)` central in the vector group | `s_b(g)s_b(h)=i(b(g)+g·b(h)+c(g,h)−b(gh))s_b(gh)`; `i(−v)s₀(g)i(v)=i(g·v−v)s₀(g)` | both identities hold |
| 6A `L×G_a`: stabilizer of `L` is `C_U(L)(k)=U(k)` (603) | `U=G_a` central | every `u∈U(k)` normalizes `L`, acts trivially on `Q` | conjugator nonunique, as stated |
| Layer 6 Nagata: linearly reductive smooth connected ⇒ torus in char `p` (476) | `G_a` (not lin. red.: `0→k→k²→k→0` nonsplit), `G_m` (torus), `SL₂` in char 2 (`∇(2)` nonsplit) | only tori survive | sound; absent from `Suggested.lean` (R04) |
| Layer 1 `𝔾_m→GL₁` coefficient `t` generates `k[t]≠k[t,t⁻¹]` (195) | `V=k` standard character | needs `t⁻¹=det(V)⁻¹` | sound |
| 7c `|U^F|∈Λˣ` from `p∈Λˣ` (794) | `U` connected unipotent over `F_q` | `|U^F|=q^{dim U}`, a power of `p` | sound |
| 7e corner identities `ts=e_U`, `st=e_V` (913–916) | `t=e_Ue_V`, `s=e_Ve_U z_U⁻¹`, `z_U=e_Ue_Ve_U`, `z_V=e_Ve_Ue_V` | `ts=e_Ue_Ve_Uz_U⁻¹=z_Uz_U⁻¹=e_U`; `(st)²=s(ts)t=st`; `(st)z_V=e_Ve_Uz_U⁻¹(e_Ue_Ve_U)e_V=e_Ve_Ue_V=z_V` ⇒ `st=e_V` | sound given `z_U,z_V` units |
| 7f identity `|Fix(g on G/H)|·|H| = |C_G(g)|·|g^G∩H|` (962) | `G=S₃`, `H=⟨(12)⟩`, `g=(12)`; `g=(123)`; `g=e` | `1·2=2·1`; `0·2=3·0`; `3·2=6·1` | sound |
| 7 worked example GL₃: `P`, `Q` not conjugate, common Levi (998–1003) | `q=2`: `GL₂(F₂)≅S₃` on the 3 lines of `⟨e₂,e₃⟩` | transitive, no invariant line in the plane; lines outside moved by `e₁↦e₁+v` | sound |
| 9A.1a `ε(a,b)ε(b,a)=(−1)^{B(a,b)}` (1147) | `ε(a,b)=(−1)^{Σ_{i>j}bond(i,j)a_ib_j}` | exponent sum `Σ_{i≠j}bond·a_ib_j = B(a,b)−2Σa_ib_i` | sound |
| 9A.1a inverse `(a,s)⁻¹=(−a,sε(a,−a))`; A2 `ε(α₁+α₂,−α₁−α₂)=−1` (1146, 1171) | `(a,s)(−a,sε(a,−a))`; `a=(1,1)`, `b=(−1,−1)`, order `α₁<α₂` | `(0, s²ε(a,−a)²)=(0,1)`; exponent `a₂b₁=−1` → `−1` | sound; matches `x_{−α₁−α₂}=−E₃₁` |
| 9A.1a section homomorphic iff no bonds (1155); kernel order `2^rank` (1287) | bond `{i,j}`, `a=e_i`, `b=e_j` (`i>j`) | `ε=−1`; `Hom(ℤ^r,±1)` has `2^r` elements | sound |
| 9A.1a `a+b∈Φ ⟺ B(a,b)=−1`; `B(a,b)=±2 ⟺ a=±b` (1141) | `B(a+b,a+b)=4+2B(a,b)`; positive definite | `=2` iff `B(a,b)=−1`; Cauchy–Schwarz equality | sound (needs positive-definite `B`, i.e. finite ADE) |
| 9A.1b cocycle `ε(a,b)s_γ(a+b)=s_γ(a)s_γ(b)ε(γa,γb)` (1305) | A2, `γ` swap, `s_γ(a)=(−1)^{a₁a₂}` | LHS exponent `a₂b₁+(a₁+b₁)(a₂+b₂)`; RHS `a₁a₂+b₁b₂+a₁b₂`; difference `2a₂b₁` | sound |
| 9A.1b even-A negative monodromy (1366) | A2 swap, root `α₁+α₂` fixed | `s_γ(α₁+α₂)=(−1)^{1}=−1`, orbit length 1, `μ=−1` | sound: fold is A1, not BC1 |
| 9A.1b folded matrices A3 `[[2,−2],[−1,2]]`, A4 `[[2,−1],[−2,2]]`, D4 `[[2,−3],[−1,2]]` (1498–1500) | `C_{O,P}=c_OΣ_{i∈O}B(α_i,α_j)`, `c_O=2/d_O` | A3: `d_{13}=2,d_2=2`, entries `−2`, `−1`; A4: `d_{14}=2`, `d_{23}=1⇒c=2`, entries `−1`, `−2`; D4: `d_{134}=2`, entries `−3`, `−1` | all three match |
| 9A.1b `B(β_O,β_O)=d_O/|O|`, `C_{O,P}=2B(β_O,β_P)/B(β_O,β_O)` (1381–1382) | `β_O=S_O/|O|`, `γ`-symmetry | `B(S_O,S_O)=|O|d_O`; `B(β_O,β_P)=|O|⁻¹Σ_{i∈O}B(α_i,α_j)` | sound |
| 9A.1b A2-exchange basis `[e,f]=h`, `[h,e]=e`, index 4 (1512–1514) | `e=x_α+x_β`, `f=x_{−α}+x_{−β}`, `h=H_α+H_β` | cross brackets 0 (`α−β∉Φ`); `[h,e]=(2−1)x_α+(−1+2)x_β`; `E=e,F=2f,H=2h` has `[E,F]=H`, index `1·2·2=4` | sound |
| 9A.1b `γ_Y=[[0,−1],[1,−1]]` example (1535) | char. poly `λ²+λ+1`; `γ_Y−I=[[−1,−1],[1,−2]]` | order 3; `det=3`, Smith `1,3`; integral kernel 0; over `F₃`: `γ(1,−1)=(1,2)=(1,−1)` | sound |
| 9A.1b `J` antidiagonal `(−1)^{i−1}`: `Jᵀ=(−1)^{m−1}J`, `J²=(−1)^{m−1}I` (1419) | entries `J_{i,m+1−i}`, `J_{m+1−i,i}` | ratio `(−1)^{m+1−2i}=(−1)^{m−1}`; `(J²)_{ii}=(−1)^{i−1+m−i}` | sound |
| 9A.2–3 `E^{(a)}E^{(b)}=binom(a+b,a)E^{(a+b)}`; `binom(H,m)E^{(r)}=E^{(r)}binom(H+r⟨α,y⟩,m)`; opposite-root rule (1565–1568) | `HE=E(H+⟨α,y⟩)`; Kostant's formula | standard, coefficients `binom(H_{α∨}−a−b+2r, r)` | sound |
| 9C toral idempotent `μ₀=Πbinom(H−1,p−1)` projects to weights in `pX` (1704) | Lucas on weight `λ` | `λ≡0`: `binom(p−1,p−1)=1`; `λ≢0`: `binom(λ₀−1,p−1)=0` | sound |
| 9C Frobenius kernel dimension `p^{r dim G}`; adjoint A1 `α∨=2y` (1690, 1676) | basis indices `<p^r` in each of `dim G` directions; adjoint `X=ℤα`, `⟨α,y⟩=1` | count `p^{r·dim G}`; `α∨=2y` | sound |
| 10B Steinberg dimension `p^{|Φ⁺|}` (1812) | Weyl dimension formula at `(p−1)ρ` | `Π_{α>0}⟨(p−1)ρ+ρ,α∨⟩/⟨ρ,α∨⟩ = Π p = p^{|Φ⁺|}` | sound |
| 10C `dim L(n)=Π(n_j+1)`; simplicity iff `n=(a+1)p^m−1`; char 3 `n=4`; char 2 `n=2` (1833–1841) | Steinberg tensor product; digits of `(a+1)p^m−1` are `(p−1,…,p−1,a)` | `Π=(a+1)p^m=n+1`; `L(4)=L(1)⊗L(1)^{[1]}=⟨x⁴,x³y,xy³,y⁴⟩` misses `x²y²`; `L(2)=L(1)^{[1]}=⟨x²,y²⟩`; `g·(xy)` has `uv` coefficient `ad+bc=1` and `u²` coefficient `−cd`, so `xy` generates `R₂` | sound |
| 10D coefficient action `(a,b)·c_{φ,v}=c_{a·φ,b·v}` (1855–1856) | `(a,b)f(g)=f(a⁻¹gb)` | `φ(a⁻¹gbv)=(a·φ)(g(bv))` | first factor on `V*`, second on `V`: sound |
| 10D `SL₂/N⁺` charts (1896–1900) | `s_a=[[a,0],[c,a⁻¹]]`, `s_c=[[a,−c⁻¹],[c,0]]`, `s_c=s_a n(τ)` | `det s_a=det s_c=1`; `aτ=−c⁻¹`, `cτ+a⁻¹=0` ⇒ `τ=−1/(ac)`; `d=cu_a+a⁻¹` ⇒ `u_c=u_a+1/(ac)` | sound |
| 11A `1→P_n→B_n→S_n→1` nonsplit for `n≥2` (2002) | `n=2`: `B₂=ℤ→ℤ/2` | no section; `n=0,1` trivial quotient | sound |
| 11B rank 1; 11E `n=2` (2051, 2134) | `V_reg=ℂ*`, `W=ℤ/2`; centered pairs `(z,−z)`, `z↦z²` | square cover; `B₂≃ℤ`, pure subgroup `2ℤ` | sound |
| 11C GL₂ regular nilpotent centralizer (2062) | `N=E₁₂` | `{aI+bN: a≠0}≅ℂ*×ℂ` | sound |
| 11D right `W` action `([g],t)·w=([gn_w],w⁻¹t)` on `E` (2090) | `Ad_{gn_w}(w⁻¹t)=Ad_g(t)` | well defined; `SU₂` lift `[[0,1],[−1,0]]` has order 4 | sound |
| 3A.7 `ℂ*` on `P¹` (1010–1013); char `p` twist | `t·[u:v]=[tu:v]`; `[t^pu:v]` | orbits `{0}`, `{∞}`, `ℂ*`; stabilizer `μ_p`, zero differential | sound |
| Layer 3 `π₀(G)` finite étale (241) | `μ_p` over `F_p` (nonsmooth) | `π₀=1`, finite étale without smoothness | hypothesis unused: R11 |
| Suggested.lean `characterTwist` is a group automorphism given centrality (119) | `e↦ι(χ(πe))e`; inverse `e↦ι(χ(πe))⁻¹e` | `π∘ι=1` so the inverse composes to `e`; `map_mul` uses `ι` central | consistent with README 1245 |
| `liftSubgroup` carrier = README 1233–1234 (`φ∘ι=ι`, `π∘φ=g∘π`) | fields of line 91–92 | same two equations | consistent |

**One-tactic probe.** The only `sorry`'d theorem, `characterKernelEquiv_value`, mentions the sorry'd `characterKernelEquiv`, so no tactic can close it; not probed. `finrank_indFromProjectedLevi` and `coverAction_projection` are already closed by one library lemma and by a projection (R04).

**Ownership.** ChevalleyGroups (on main) and CFSGStatement cite ReductiveGroups Layer 9 as the owner of the Chevalley–Demazure construction; NilpotentOrbits, SchubertGeometry, ShimuraData, EndoscopicTransferAndUnitaryTraceComparison, AdelicAlgebraicGroups cite Layers 0–9 as suppliers. The `roadmaps grep` over the 450 open pull requests for "lang-theorem" finds only consumers of ReductiveGroupsPartII RG2.3.7; no second owner of Layers 0–10 was found. Ownership of Layer 11's spectral quotient against open pull requests whose files the brief does not give was not checked beyond the grep.

## Not verifiable

- Milne, *Algebraic Groups*, Prop. 27.54, Cor. 27.55–27.56 (v2.00 pp. 487–488): cited through ReductiveGroupsPartII; the book is not legally available online and was not opened.
- Howlett–Lehrer, *J. Algebra* 165 (1994) and Dipper–Du, *Crelle* 437 (1993): paywalled; cited by locator only, consistent with Dudas–Michel's attribution at Theorem 10.1.
- Carter §1.17, Serre §§2.3, 3.3, Gassmann 1926, Jantzen, Borel, Springer, Waterhouse, SGA3 XIX, Conrad–Gabber–Prasad: standard texts cited without page-level claims; not opened.
- Conrad–Feng handout §6.3/Prop. 12.3.1/App. H.1, Gros–Kaneda (arXiv 1712.06835), Hedén (arXiv 1407.7638): not opened in this round; the README cites them for routes, not for stated hypotheses.
- Whether the gate's first build warning ("imports `Mathlib` … consider adding `module`") fails every roadmap's build or only this one: I could run the gate only for this folder.

## Source issues

- none
