# Review of ReductiveGroups (pull request #1676 at 73b05b0)

**Verdict:** needs changes

AI review of the ten specified files at `73b05b06ccced1b657dd073c590a2370881fc5e0`. The PR adds 49 README lines and one 27-line companion; it changes nothing outside this folder. Findings below assess the whole requested folder, including inherited defects. No PR file was changed.

The supplied previous report identifies itself as a review of #1332 at `f536cbd`, despite the brief's “change … none” description. I checked its claims against this head rather than assuming those snapshots coincide. No repair report marking findings “not actionable in this package” was supplied.

| Previous finding | Current passage or witness | Repair status |
|---|---|---|
| R01 properness | README:53, “proper group schemes are commutative” | Not repaired; current R01. |
| R02 reciprocal suppliers | README:692, “ReductiveGroupsPartII RG2.3.7 owns ordinary q-Frobenius Lang surjectivity” | Not repaired; current R02; reciprocal contracts reopened at their authorized versions. |
| R03 admitted data | Suggested:134, “noncomputable def characterKernelEquiv”; SpecialLinearCoordinateTargets:16, “noncomputable def coordinatePresentation” | Not repaired; current R04. The absent Chevalley companion is replaced in the scoped count by the new SL companion. |
| R04 weak simply-connected substitute | The previous location, `ChevalleyModelTargets.lean`, is absent from this head. | That specific defect is absent, so it is not repeated. This does not certify the replacement construction; current R03 records missing prerequisite sections. |
| R05 headline coverage | Suggested:16, “two native signature examples only” | Not repaired; current R05. |
| R06 descent ownership | README:172, “Develop the fppf sheaf, faithfully-flat descent, torsor, and representability machinery” | Not repaired; current R06. |
| R07 pinned links | README:1633, “9B.1's integral Weyl-translated chart cover” | Not repaired; eight links still fail the gate; current R07. |
| R08 imports | Suggested:3, “import Mathlib.GroupTheory.GroupExtension.Basic” | Not repaired; current R08 also covers the new companion. |
| R09 padding | Suggested:114, `coverAction_projection`, proved by `l.property.2 e` | Not repaired; current R09. The absent Chevalley specialization is not counted. |
| R10 form, locators, Checks | README:124, “Cross-cutting prerequisite: sheaves and descent” | Not repaired; no source locator there, no required supplier-contract section or Needs clauses; current R10. |
| R11 computational certificates | README:1463, “Construct kernel-checkable rational certificates” | Not repaired; current R11 treats this as blocking under the brief's explicit mathematical-scope principle. |

## R01 (P1) — Properness does not imply commutativity

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:52–53`, “proper group schemes are commutative”.

**Claim:** This misstates the imported rigidity theorem by omitting geometric integrality and its field setting.

**Witness:** The constant group scheme S₃ over ℂ is finite étale and proper, but (12)(23)=(123) and (23)(12)=(132). `Mathlib/AlgebraicGeometry/Group/Abelian.lean:132` explicitly assumes `GeometricallyIntegral`.

**Exact repair:** Give the field and geometric-integrality hypotheses of `AlgebraicGeometry.isCommMonObj_of_isProper_of_geometricallyIntegral`; add constant S₃ as a negative control. S₃ has six geometric components and is excluded; the trivial group and abelian varieties remain included. Do not silently replace the pinned condition by connectedness over arbitrary bases.

## R02 (P1) — Break the reciprocal supplier contracts

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:692–696`, “ReductiveGroupsPartII RG2.3.7 owns ordinary q-Frobenius Lang surjectivity”.

**Claim:** This roadmap consumes a theorem from its own consumer, contrary to the required single direction between roadmaps. Ordering individual layers does not remove that roadmap-level cycle.

**Witness:** `TauCetiRoadmap/ReductiveGroupsPartII/README.md:5203–5214` on main states Lang and ends with “Needs: ReductiveGroups layer 3”. This README supplies the reverse edge at line 692.

**Exact repair:** Move ordinary Lang, fixed-coset lifting and their prerequisites to the base or an independent earlier owner; make Part II consume that owner. Resolve the same reciprocal contracts for Weil restriction (README:1077; Part II RG2.0a.1–2), IntegralHeckeAndGaloisDeterminants §0.7 (README:521,1786; supplier contract:470–483 and Needs:1205,1268), and FormalConnectionsOpers §4.3 (README:1989; supplier contract:240–252). Moving merge-order positions alone cannot fix a cycle. Preserve Lang's smooth, geometrically connected finite-type hypotheses: θ²−θ=1 for θ∈𝔽₄ with θ²+θ+1=0, while the disconnected constant C₂ has Lang image {1}.

The required dependency command prints no cycle; its exact output is below. These are explicit semantic edges it did not report, not invented UPWARD lines.

## R03 (P1) — The new applications consume nonexistent sections 9B.1–9B.3

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:1633–1644`, “Consume … 9B.1's integral Weyl-translated chart cover”; also lines 2223–2226, “In9B.2 take the standard representation”.

**Claim:** The local-ring generation proof assumes an integral open-chart cover and inverse maps, and the realization comparison assumes a finite-index-weight central-isogeny theorem and based-datum comparison. The cited numbered constructions are not present in this README or ReductiveGroups on main. The commit-pinned link is not a permitted substitute for a current owner.

**Witness:** The actual §9B runs from README:1610 to 1681 as unnumbered bullets; §9C follows at 1683. Searching `9B.1`, `9B.2`, `9B.3` finds only the five new consuming references, no supplying target.

**Exact repair:** Resolve these prerequisites to precise, existing owner sections, or supply their missing constructions in the appropriate extension roadmap before these applications. Specify Ω, its inverse, coverage by the chosen integral Weyl translates, the actual lattice map and central kernel, and the pinned comparison. Do not import an unmerged revision of an existing roadmap by snapshot link. Test the repaired contract on SL₂: Ω=D(a), its Weyl translate supplies D(c), and `ad−bc=1` implies `(a,c)=A`; over a local ring one of a,c is a unit. For ℤ/4 all 48 determinant-one matrices satisfy that test. For SL₂→PGL₂ over ℚ the kernel is μ₂ and the class of diag(2,1) still has no rational lift. These calculations validate the intended applications, not the absent general supplier.

## R04 (P2) — Remove all admitted data constructions

**Location:** `TauCetiRoadmap/ReductiveGroups/Suggested.lean:89,119,127,134,143`; new `SpecialLinearCoordinateTargets.lean:16–20`, “noncomputable def coordinatePresentation … := by sorry”.

**Claim:** Acceptance files admit data, including whole bases and equivalences. Admitting laws inside a data definition is also prohibited by the supplied form rule. Later equations do not make an admitted value an executable definition.

**Witness:** `coordinatePresentation` admits an algebra equivalence outright. `characterKernelEquiv` admits an entire family of group equivalences. Neither has a body from which its values can be evaluated.

**Exact repair:** Keep only simple necessary definitions with real bodies. Express construction results as existence/uniqueness or properties of specified native maps; move heavy constructions to README targets and name their missing carriers in the module docstring. Delete dependent substitutes. For SLₙ, a theorem asserting an algebra equivalence with the required generator equations is statable using the polynomial quotient already written; no admitted data definition is necessary. At n=0 its relation is 1−1=0 and the quotient is ℤ; at n=1 it is x−1 and again ℤ. Preserve these cases.

There are **46** data declarations with admissions: Suggested 5, IntegralRational 3, SignedADE 11, FoldingADE 12, CoverLift 5, SpectralWeyl 9, SpecialLinearCoordinate 1; BruhatCoordinate and OrbitGeometry have none. The gate scans Suggested and reports five; inspection of all scoped companions gives the larger count.

## R05 (P2) — Put statable headline theorems in Suggested

**Location:** `TauCetiRoadmap/ReductiveGroups/Suggested.lean:6–20`, “two native signature examples only”; compare `OrbitGeometryTargets.lean:104–173` and `SpecialLinearCoordinateTargets.lean:16–20`.

**Claim:** The acceptance module contains wrappers and a cover-kernel evaluation rule instead of the roadmap's deep endpoints. Statable results in unimported companions are not checked by its targeted build, and its docstring does not identify every unstatable endpoint and missing carrier.

**Witness:** `OrbitGeometry.exists_closed_orbit`, lines 158–164, already states a genuine endpoint on native scheme/action carriers with algebraic-closure, smoothness, finite-type, separatedness and nonemptiness assumptions. Suggested contains no such statement.

**Exact repair:** Consolidate genuine headline statements and their few necessary simple definitions in Suggested. Include the statable orbit results and SL polynomial-presentation theorem; explicitly account for integral PBW, pinned-group existence/classification, highest weights and spectral monodromy. For endpoints requiring heavy carriers, name the missing carrier rather than supply a stand-in. On Gₘ acting on ℙ¹, the open orbit has dimension 1 and two boundary fixed points have dimension 0; an empty action space must not satisfy an unconditional existence conclusion.

## R06 (P2) — Import generic descent instead of planning it again

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:124–127,170–174,1049–1059`, “Build the needed sheaf-torsor and descent API here from Layer0 if no lower supplier has it”.

**Claim:** Generic fppf/fpqc descent and sheaf foundations have owners already. The conditional wording leaves overlapping ownership and fails to separate them from new group-specific quotient representability.

**Witness:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2071–2083` owns quasi-coherent fpqc descent and the sheaf-stack theorem. `TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Basic.lean:154` defines the normal-Hopf-ideal quotient sheaf, explicitly without representability.

**Exact repair:** Cite precise existing contracts in Scope/Exact supplier contracts, delete generic reconstruction promises, and retain only the required adapters and new group-specific representability theorems with hypotheses. For Gₘ/μ₂, 2 is not a square over ℚ but becomes one over the finite faithfully flat extension ℚ(√2). The sheaf quotient handles this; it must not be replaced by pointwise surjectivity or mistaken for a representability proof.

## R07 (P3) — Replace the eight commit-pinned roadmap links

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:521,1077,1210,1388,1633,1786,1942,1996`; for example, “IntegralHeckeAndGaloisDeterminants0.7”.

**Claim:** All eight links fail the gate's `blob` rule. A stale snapshot can also conceal an absent supplier, as in R03.

**Witness:** Line 1633 resolves its purported internal construction through a commit link, while the construction is absent in this head. The seven other links similarly pin roadmap content to commits.

**Exact repair:** Use roadmap names plus exact sections, or repository-relative links, resolving each against its authorized main/new-roadmap version. Repair ownership and missing contracts before replacing link syntax. The Gₘ/SL₂ chart and Lang tests above remain the controls; link replacement alone does not prove those targets.

## R08 (P3) — Apply the import rule to every scoped Lean file

**Location:** `TauCetiRoadmap/ReductiveGroups/Suggested.lean:1–3`, “import Mathlib.GroupTheory.GroupExtension.Basic”; `SpecialLinearCoordinateTargets.lean:1` imports only Tau Ceti.

**Claim:** Suggested fails both `imports` and `mathlib-subimports`. Other companions import roadmap modules or Mathlib submodules; the new companion lacks the required `import Mathlib`.

**Witness:** CoverLift line 1 imports `TauCetiRoadmap.ReductiveGroups.SignedADETargets`. The required header permits only one leading `import Mathlib` and actually used individual pinned Tau Ceti modules.

**Exact repair:** Normalize headers and consolidate permitted simple headline definitions so companions do not require roadmap imports. Remove the extra Mathlib submodule line. The unmodified Suggested elaborates now, so this is a form failure, not a claimed compiler failure. Preserve the finite-index and centrality binders verified below.

## R09 (P3) — Delete API padding from the acceptance files

**Location:** `TauCetiRoadmap/ReductiveGroups/Suggested.lean:34–62,114–141`; `IntegralRationalTargets.lean:204–208`.

**Claim:** Instance aliases, an existing induction dimension formula, stored projection equations and coefficient-contraction evaluation are API, not headline theorems. Bruhat's small matrix controls and several folding evaluation laws likewise belong in README Checks/API.

**Witness:** `coverAction_projection` is `l.property.2 e`; `rationalDistributionAction_apply` closes by `rfl` in the scratch probe. The dimension formula is the pinned `TauCeti.finrank_indFDRep`, `TauCeti/RepresentationTheory/Induction/FiniteDimensional/Basic.lean:487`.

**Exact repair:** Delete it from `Suggested.lean`; apply the same acceptance-file rule to companion padding. Keep useful mathematical statements as README API or Checks and cite their owner. Do not prove padding in place. The S₃/C₂ induction test gives 3=3·1, and contraction on a Gₘ weight-3 line gives 3m on both sides; these are valid Checks of supplied operations.

## R10 (P3) — Supply exact locators, dependencies and discriminating Checks

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:1–127,227–232,2250–2286`, including the unsourced “Cross-cutting prerequisite: sheaves and descent”.

**Claim:** The required Summary, Scope and ownership, Conventions, Exact supplier contracts and How to read the build sections are absent. No `*Needs:*` lines occur. Many early definitions lack API and three discriminating Checks; layers lack their final Examples/Dependencies sections. Bibliographic titles alone are not theorem locators. Module and declaration documentation often describes prototypes rather than target signatures.

**Witness:** Layer 2 names tangent space, differential, adjoint action and dimension tools in two bullets without exact hypotheses, source locators or three Checks per definition. The source sample at lines 124–127 has no locator to verify as written.

**Exact repair:** Recast the retained mathematics into the required prose form without reducing its scope. Give every retained definition its API and at least three discriminating Checks, every theorem its exact hypotheses and legal locator, and every route its itemized prerequisites. Register cited works once in `sources.toml`; remove process/design narrative. Replace unexplained source-discrepancy comments at lines 1503 and 1869 with an identified source locator or remove the comments. Keep root-free, A₁, characteristic-2 thickening and nonsplit examples; they discriminate hypotheses rather than repeat a definition. The same requirements apply to the new E/GE definitions and SL comparison.

## R11 (P2) — Replace mandatory computational certificates by mathematical targets

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:1457–1474`, “Construct kernel-checkable rational certificates”.

**Claim:** Requiring complete enumerations, coefficient-vector certificates for every root-orbit vector, and row-by-row exact-arithmetic verification makes a computational deliverable part of the roadmap. The brief explicitly makes computational algorithms a blocking scope defect.

**Witness:** Lines 1463–1468 prescribe a finite Lie-word certificate for every surviving basis vector and verification of every row, substantially beyond small mathematical Checks.

**Exact repair:** State generation, the Serre relations and the G₂/F₄ comparison with exact hypotheses, sources and mathematical proof inputs. Leave a particular certificate format or enumeration procedure to implementation. Keep small discriminating Checks: D₄ has 24 roots and fixed dimension 14; E₆ has 72 roots and fixed dimension 52. These recomputed counts do not, on their own, establish generation, so retain that theorem explicitly.

## R12 (P2) — Reuse the pinned bilinear-form isometry subgroup

**Location:** `TauCetiRoadmap/ReductiveGroups/CoverLiftTargets.lean:13–17`, “def isometryGroup … : Subgroup …”; README:1229–1234.

**Claim:** The companion rebuilds the generic subgroup of linear automorphisms preserving a bilinear form, including admitted closure proofs, although the pin supplies exactly that object. The new ADE lift action should consume it.

**Witness:** `TauCeti/LinearAlgebra/BilinearForm/Isometry.lean:153–168` defines `TauCeti.BilinForm.isometryGroup B` and characterizes membership by `∀ x y, B (e x) (e y) = B x y`, the identical condition for `latticeForm D`.

**Exact repair:** Delete the duplicate subgroup definition; specialize the pinned group to the actual lattice form and retain only the genuinely new cover/root/Lie-action results. Record its exact name and file in the supplier contract. On A₁ both descriptions have precisely n↦n and n↦−n; n↦2n fails preservation since 8≠2. On the empty lattice both give the trivial group. No positive-definite or ADE hypothesis is needed for the supplied subgroup construction itself.

## Verified sound

I read the normative README/CONTRIBUTING, all ten scoped files, and the main-branch SchemeAndStackFoundations and ReflectionInvariantTheory roadmaps for comparison. The new text extends the existing programme rather than replacing its basic scope, so the mere existence of ReductiveGroups on main is not grounds for rejection. The all-field goals retain bad primes; characteristic-zero exp/log and rational folding are explicitly separate routes. No `set_option`, admitted example, outside-folder change, copied source passage or stray-file violation was found by the supplied gate. The unresolved mathematical and ownership issues above prevent acceptance.

### Gate, elaboration and binders

The worker's gate at this exact head is **FAIL**:

```text
gate ReductiveGroups: set_option=0 blob=8 latex=0 tex=0 prnum=0 sorry-data=5 sorry-examples=0 residue=0 private-paths=0 imports=1 mathlib-subimports=1 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 FAIL
```

R04, R07 and R08 cover every failing rule. I independently elaborated `Suggested.lean` with `lake env lean`: exit 0, only six `sorry` warnings. I elaborated a scratch copy with `#check @name` for all **15 actual declarations**, comparing each signature to its intended README use. The supplied extraction's sixteenth entry, `and`, comes from prose, not a declaration. No required binder disappeared: finite index stays on induction; extension, action and centrality stay on the character constructions. The induction signature is over an arbitrary field while its README use is explicitly the complex specialization. Nothing was changed.

I attempted `rfl`, `simp` and `infer_instance` on **all 88 sorried theorem statements**, using scratch copies with unchanged dependency definitions and isolated sections. The completed probe elaborated without errors, recording an explicit admitted fallback for 87 targets; only `rationalDistributionAction_apply` closed. The failed attempts do not certify truth or depth. Reading the explicit one-library-lemma and projection proofs supplies the additional padding evidence in R09. The new SL equivalence is a `def`, not a sorried theorem, and is counted under R04 instead. The probe's test-only trace/linter output is not a warning from the original module.

The required dependency command returned:

```text
depcheck: 204 roadmaps, 1496 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. R02 gives explicit reciprocal contracts missed by that output. The README has no Needs lines to scan; supplier citations embedded in prose were inspected instead. No declared gap or readable design plan licenses the missing sections in R03.

### Seeded sources and source hypotheses

- **Cross-cutting prerequisite: sheaves and descent.** The README gives no exact locator. I fetched and read Milne's 2017 author copy, §5j, Definition 5.65, Example 5.66 and Proposition 5.68, printed p.116: `milne` (2017) lines 4985–5017. It supplies flat sheaves, representable sheaves and universal sheafification. It does not by itself specify all effective descent, torsors and quotient representability promised in the sample. The flat topology there is not an exact citation for every fppf assertion. R06/R10 require the distinction and exact owners.
- **Supplier: ordinary Lang.** I reopened ReductiveGroupsPartII RG2.3.7 on main, including its Needs line, and fetched Milne v2.00. Proposition 27.54 and Corollaries 27.55–27.56, printed pp.487–488, are at `milne` (v2.00) lines 20240–20275. They concern a connected group variety and Steinberg/Frobenius; the supplied smooth geometrically connected finite-type specialization is supported. The source uses gF(g⁻¹); substituting g⁻¹ gives g⁻¹F(g), preserving surjectivity but not literal equality of the maps. Its disconnected C₂ counterexample matches the table. The two Milne editions are one work/key with different numbered locators, not interchangeable page numbers.
- **Supplier: fixed cosets.** Main Part II:5260–5273 states the abstract group result with surjectivity of the Lang map on J. Its He citation is a deduction from a proof, not a general theorem stated there. I fetched arXiv v3 and read Lemma 4.5, p.13, `he-2018` lines 551–558. It works with Iwahori congruence subgroups in its specific Frobenius setting. The abstract deduction is valid separately: if h⁻¹σ(h)=j=z⁻¹σ(z), then σ(hz⁻¹)=hz⁻¹. Pro-p alone must not replace that hypothesis. The ℤ/4 example in the table tests this distinction.
- **Existence versus the missing constructor.** Conrad, Theorems 6.1.16–6.1.17, printed pp.196–197, `conrad` lines 8159–8182, supports existence and pinned classification over a nonempty base scheme. Lines 8192–8200 use birational group laws in the existence route. This does not supply the absent numbered integral chart/realization targets in R03 merely by bibliographic association.
- **Further spot checks.** Dudas–Michel Proposition 8.9, p.32, `dudas-michel` lines 1457–1467, requires both Levis to contain the common torus and states the four-factor intersection and uniqueness. Conrad–Feng Proposition 12.3.1, printed p.127, `conrad-feng` lines 5334–5346, gives simple transitivity for parabolic Levi factors; that does not imply uniqueness for general Levi complements in Layer6A. Dudas–Michel's Theorem 10.1, p.41, `dudas-michel` lines 1808–1814, uses complex coefficients in its proof and refers elsewhere for general coefficients; I do not count it as a proof of the entire coefficient-general corner-unit construction.

All identifiable bibliography works were submitted through the sources service. Eight distinct works have readable legal text, with two Milne versions; five resolved as uncertified publisher citations and ten were unavailable. No manifest was edited and no source text was copied into the repository or report.

### Pinned APIs and ownership resolved

Pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following **14 object/API groups** were opened at these pins:

| Object | Pinned file:line | Scope checked |
|---|---|---|
| `hopfSpec`, fully faithful, essential image | `Mathlib/AlgebraicGeometry/Group/Affine.lean:177,187,482` | Affineness; no automatic smoothness/finite type. |
| Proper rigidity | `Mathlib/AlgebraicGeometry/Group/Abelian.lean:132` | Field and geometric integrality. |
| `fppfQuotientSheaf` | `TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Basic.lean:154` | Normal Hopf ideal; no representability conclusion. |
| `Derivation.adRepresentation` | `TauCeti/Algebra/AlgebraicGroup/Tangent/Adjoint.lean:177` | Actual counit-algebra derivations. |
| Reductivity | `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean:70,79` | Smooth, geometrically connected; geometric unipotent radical condition. |
| Maximal torus | `TauCeti/Algebra/AlgebraicGroup/Torus/Maximal.lean:50` | Minimal torus Hopf ideal; subgroup order reversed. |
| `finrank_indFDRep` | `TauCeti/RepresentationTheory/Induction/FiniteDimensional/Basic.lean:487` | Field and finite index. |
| Convolution action/evaluation | `TauCeti/Algebra/Coalgebra/Comodule/Convolution.lean:49,91` | Right-coaction contraction. |
| `BilinForm.isometryGroup` | `TauCeti/LinearAlgebra/BilinearForm/Isometry.lean:153,162,166` | Generic form-preservation subgroup; R12. |
| SL Hopf quotient/coordinate map | `TauCeti/Algebra/AlgebraicGroup/SpecialLinear/Basic.lean:195,201,215,225` | Determinant-one kernel; n=0/zero ring allowed. |
| SL points/naturality | `TauCeti/Algebra/AlgebraicGroup/SpecialLinear/Basic.lean:380,445,574` | All commutative coefficient algebras. |
| SL root points | `TauCeti/Algebra/AlgebraicGroup/SpecialLinear/RootSubgroup/Basic.lean:93` | Transvections with i≠j. |
| SL datum | `TauCeti/Algebra/AlgebraicGroup/SpecialLinear/DiagonalTorus/RootDatum.lean:108` | Rank r describes SL_(r+1); n−1 is correct when n≥1. |
| `weylCoxeterHom` | `TauCeti/LinearAlgebra/RootSystem/Coxeter/Presentation.lean:57,82` | Map and surjectivity; presentation is a separate target. |

SL Basic:34–36 explicitly excludes the polynomial-presentation theorem. Thus reusing its carrier is appropriate; the new equivalence is not already proved by the points dictionary.

Object searches used authorized roadmap grep/show, main, board packages and supplied open checkouts for descent, Lang, cofree resolutions, SL coordinates, signed folding, exp/log and configurations. RootSystemsPartII's open README:9,57–59 explicitly defers signed ADE folding here; ClassicalGroups §3.4 owns representation restriction, not the integral SL quotient. No new companion name collision appeared. The resolver's Gassmann lead resolves to `TauCetiRoadmap.RepresentationTheory.InductionRestriction.Gassmann.almostConjugate_iff_permutation_equiv`, `TauCetiRoadmap/RepresentationTheory/InductionRestriction/Suggested.lean:728` on main.

Cross-roadmap contracts reopened: SchemeAndStackFoundations main §§0.3:551,0.7:755,1.1:2071,2.6:3437 (Proj/dimension/descent/cohomology); RootSystems main Layers1–6 (Coxeter contract:183); LieHighestWeight main Layers3–4 and Layer7:1159–1186 (split-field Serre injectivity and transpose); IntegralLattices main:833–840 (integral form); ReductiveGroupsPartII main RG2.0a:963,1128 and RG2.3.7:5201,5260; IntegralHeckeAndGaloisDeterminants indexed §0.7:1156–1268 and contract:470–483; FormalConnectionsOpers supplied head §4.3 and contract:240–252; ComplexComparisonPartII indexed C−1.1:724–814 (nilpotents/classical topology/properness); SmoothBundlesConnections main B1.1:315/B1.4:421; LieGroupoidsPoisson supplied G0.1:299; LieGroups main Layers6–8 and flag cells:428–450; InverseGaloisAndArithmeticFundamentalGroups indexed IG.3.2:2678/IG.5.1:5317–5368; AlgebraicTopology main van Kampen/CW programme; DGFloer main Layer1 item2 and contract:129–148; GroebnerGeometry main G5:394–420; SchubertGeometry main conventions:9 and S3:49–52; AlgebraicVectorBundles main scope:416–425; CFSGStatement main L0/L5 scope:32–63. File locators in this paragraph mean each named roadmap's `README.md` under `TauCetiRoadmap/`, with RootSystems/LieHighestWeight/LieGroups under `RepresentationTheory/`.

One attribution needs clarification: LieGroupoidsPoisson G0.1 supplies the split-derivative/normal-form comparison and explicitly assigns regular fibre products themselves to SmoothBundlesConnections B1.0. The latter is the precise owner for that input. These resolutions establish sections and contracts, not all of their general proofs. This roadmap owns its group-specific signed Lie and integral realization comparisons; R06/R12 identify the generic duplication.

### Headline coverage and computed adversarial pass

The README endpoints are: the affine Hopf/scheme/points and representation/comodule dictionaries; faithful embedding and Tannakian comparison; orbit local closedness, boundary dimension and closed-orbit existence; unipotent/reductive structure and Levi splitting; Bruhat coordinates; finite-field Lang, Harish–Chandra adjunction/Mackey/common-Levi independence; root-datum existence/classification and relative forms; signed ADE Lie algebra, all cover lifts and fixed folding; integral PBW and rational comparison; pinned integral groups and arbitrary-ring specialization; distributions/Frobenius/contraction; highest-weight classification, Steinberg modules and algebraic Peter–Weyl; spectral/cameral fundamental groups and finite Weyl monodromy. The new contributions add E/GE point generation and the integral SL polynomial/Hopf presentation. Suggested does not supply this acceptance coverage; the missing-carrier rule is not a license to replace it with API padding.

The table retains concrete instances for the seeded sources, headline results and findings; routine declaration-by-declaration rows are omitted. “Model” means evaluation of the displayed mathematical specification; it is not evaluation of an opaque `sorry` value. Values are finite checks, not proofs of the general theorem. I rechecked the prior table's retained calculations against these definitions, removed its absent Chevalley-constructor rows and corrected its `cycleDefect` sign: this file defines μ−1, hence −2 on a negative cycle. New SL and fixed-coset rows follow the retained rows.

An independent exact-integer reflection/bracket calculation generated A₁–A₅, D₄ and E₆ roots from their Gram matrices and evaluated the specified reversal signs. It tested all 27, 512 and 3375 basis triples for A₁, A₂ and A₃ Jacobi, with zero nonzero Jacobi sums. Fixed ranks were 3,3,10,10,21,14,52 respectively; characteristic-2 fixed dimensions were 3,5,10,14,21,14,52. Exhaustive SL₂ enumeration over the zero ring, 𝔽₂, 𝔽₃ and ℤ/4 gave point/generated-group cardinalities 1/1, 6/6, 24/24 and 48/48, and zero adjugate-inverse failures.

| Statement / convention | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| Proper ⇒ commutative (R01) | Constant S₃/ℂ | ab=(123), ba=(132); proper=true, commutative=false | Fails; R01. |
| Smoothness vs geometric reducedness | μ₂/F₂; Gₘ/F₂ | μ₂: (t−1)²=0, tangent dimension 1, dimension 0; both smooth/reduced false. Gₘ: both true | Agrees. |
| Hopf points and convolution | Gₐ, Gₘ; points 2,3 | Gₐ: Δx=x⊗1+1⊗x gives 5=2+3; Gₘ: Δt=t⊗t gives 6=2·3 | Agrees. |
| Noncommutative points vs GroupLike | Upper/lower elementary GL₂ matrices | products [[2,1],[1,1]] and [[1,1],[1,2]] differ | Agrees. |
| Affine scheme/Hopf/representable dictionary | Gₘ | algebra map t↦2; inverse point t↦1/2; scheme point has the same coordinate 2 | Agrees. |
| `globalSectionsHopfAlgebra` | Gₘ over ℚ | counit t↦1; Δt=t⊗t in both presentations | See R09. |
| `specGroupObject` | additive Hopf algebra ℚ[x] | multiplication evaluates x at a+b; a=2,b=3 gives 5 on both sides | See R09. |
| Cross-cutting sheaf prerequisite (sample) | Gₘ/μ₂, A=ℚ | 2 is not a square in A; it is (√2)² after finite flat extension | See R06. |
| Faithfully flat descent of modules | ℝ→ℂ, line with conjugation | descended fixed vectors ℝ; ℂ⊗ℝℝ=ℂ, complex dimension 1 | Agrees. |
| Representation/comodule dictionary | Gₘ weight 2 line | coaction m↦m⊗t²; point 3 acts by 9; (2·3)²=4·9=36 | Agrees. |
| Faithful coefficient-generated embedding | Gₘ weights {1} vs {2} | kernel of t↦t is 1; kernel of t↦t² is μ₂ | Agrees. |
| Lie algebra at the identity | μ₂/F₂; trivial group | tangent dimensions 1 and 0; μ₂ point set has only 1 | Agrees. |
| Adjoint representation | SL₂, h=diag(2,1/2), E=E₁₂ | hEh⁻¹=4E; character α(h)=4 | Agrees. |
| Hopf ideal / subgroup | μ₂⊂Gₘ over F₂ | ideal (t²−1)=(t−1)²; quotient has dimension 2, not reduced dimension 1 | Agrees. |
| Components | Constant S₃ | G°=1, π₀ has 6 elements; dimension 0 on all components | Agrees. |
| `orbit_locallyClosed` | Same | open immersion for nonzero orbit; closed immersion for zero orbit | Agrees. |
| `boundary_dimension_lt` | Same | 0<1 and −∞<0 | Agrees. |
| `exists_closed_orbit_in_closure` | x=1 | y=0, {0}⊆A¹ and {0} closed | Agrees. |
| `exists_closed_orbit` | A¹ vs empty scheme | A¹ has witness 0; empty scheme has no points and fails input hypothesis | See R05. |
| `minimal_dimension_orbit_closed` | Gₘ on ℙ¹ | minimal dimension 0, orbits {0},{∞} closed; open orbit dimension 1 | Agrees. |
| Nonconnected orbit dimension | C₂ interchanging 0,∞ in ℙ¹ | orbit size 2, dimension 0, boundary ∅, −∞<0 | Agrees. |
| Inseparable orbit map | Gₘ on Gₘ via t², characteristic 2 | derivative 0, stabilizer μ₂, image all geometric points | Agrees. |
| `compact_complexPoints` | ℙ¹ vs A¹ | ℙ¹(ℂ) compact; A¹(ℂ)=ℂ not compact and not proper | Agrees. |
| `hausdorff_complexPoints` | A¹ vs doubled-origin line | A¹ is Hausdorff; two origins inseparable, scheme not separated | Agrees. |
| Jordan / diagonalizable / torus distinctions | μ₂/F₂; norm-one torus over ℝ | μ₂ has 1 geometric point but length 2; real norm-one torus has circle of real points, not ℝˣ | Agrees. |
| Unipotent exponential/logarithm | N=E₁₂, characteristic 0 | N²=0; exp(N)=I+N; log(I+N)=N | Agrees. |
| Heisenberg exponential denominator | N=aE₁₂+bE₂₃ | N²=abE₁₃; exp(N)₁₃=ab/2; a=b=1 gives 1/2 | Agrees. |
| Reductive vs linearly reductive | Gₘ/F₂, SL₂/F₂ | torus weight decompositions split; Sym² for SL₂ contains nonsplit Frobenius submodule of dimension 2 in dimension 3 | Agrees. |
| Levi product convention | Gₐ⋊Gₘ | (1,2)(3,5)=(7,10); direct-product formula gives (4,10) | Agrees. |
| Levi conjugacy vs uniqueness | L×Gₐ | every u in Gₐ centralizes L; conjugate complement remains L | Agrees. |
| Reductive coset affineness | SL₂/T; SL₂/U | SL₂/T affine; SL₂/U=A²\{0} not affine | Agrees. |
| Bruhat cells | SL₂ | Weyl lengths 0,1; cells have dimensions 0,1 in G/B=ℙ¹ | Agrees. |
| Rank-one Gauss formula | x₊(2)x₋(3) | [[7,2],[3,1]]=x₋(3/7)diag(7,1/7)x₊(2/7) | Agrees. |
| `coveringHomeomorph`, application | identity ℝ→ℝ vs z↦z² on ℂˣ | identity fibre size 1; square-cover fibre size 2 and base not simply connected | Agrees. |
| Lang ordinary Frobenius (sample) | Gₐ/F₂; constant C₂ | θ²−θ=1 in F₄; C₂ image={1}, misses other point | See R02. |
| Lang sign convention | Gₘ, q=3 | gF(g⁻¹)=g⁻²; replacing g by g⁻¹ gives g²=g⁻¹F(g) | Agrees. |
| Rational exactness with connected kernel | square map Gₘ→Gₘ over F₃ | squares={1}, misses −1; kernel μ₂ disconnected | Agrees. |
| Parabolic/Levi intersections | Opposite SL₂ Borels | L∩M=T; other three factors=1; intersection=T | Agrees. |
| Harish–Chandra averaging/biadjunction | U=C₂, coefficients ℂ | e=(1+u)/2, e²=(2+2u)/4=e | Agrees. |
| `indFromProjectedLevi`, dimension | GL₂(F₂)=S₃, P=C₂ | index=3; induced trivial module dimension 3=3·1 | See R09. |
| Specialized Mackey | S₃, H=C₂ | two double cosets sizes 2 and 4; restriction decomposes dimensions 1+2=3 | Agrees. |
| Common-Levi independence | Opposite Borels in GL₂(F₂) | both induce the same 3-point permutation representation | Agrees. |
| Trivial induction / Gassmann | S₃,H=C₂, transposition and 3-cycle | fixed-coset counts 1 and 0; 1·2=2·1, 0·2=3·0 | Agrees. |
| Steinberg power condition | F ordinary q=2 on Gₐ | fixed points {0,1}; F² fixes F₄ with 4 points | Agrees. |
| Root datum / isogeny distinction | SL₂ vs PGL₂ | root is 2ω vs a primitive character; lattice index 2 | Agrees. |
| Pseudo-reductive warning | Res K/k Gₘ, purely inseparable [K:k]=2 | after algebraic closure dimensions 2 total, 1 unipotent radical | Agrees. |
| `latticeForm`, `latticeForm_symmetric` | A₂,e₁,e₂ | B(e₁,e₂)=−1=B(e₂,e₁); B(e₁,e₁)=2 | See R04. |
| `epsilon_cocycle` | a=e₁,b=e₂,c=e₁ | left (+1)(−1)=−1; right (−1)(+1)=−1 | Agrees. |
| `epsilon_commutator` | a=e₁,b=e₂ | (+1)/(−1)=−1=(−1)^(−1) | Agrees. |
| `coverGroup`, `tau`, `sectionLift` | A₂; rank zero | τ²=(0,1); rank-zero cover has 2 elements | See R04. |
| `simpleReflection`, `root_generated` | A₂ | s₁(e₂)=e₁+e₂; s₁(e₁)=−e₁ | Agrees. |
| `rootLineQuotientEquiv`, `rootLineQuotientEquiv_generator` | Same | intended images +δe₁ and −δe₁; sum 0 | Model; R04. |
| `lieRing`, `lieAlgebra`, `bracket_jacobi` | e₁,e₂,e_−(e₁+e₂) | three Jacobi terms −H₁,−H₂,H₁+H₂ sum to 0 | Agrees. |
| `normalized_opposite` | Same | [e_a,−e_−a]=H_a | Agrees. |
| `normalizationEquiv`, `normalizationEquiv_apply` | coefficient 3 on −a | intended output −3 on −a; applying twice gives 3 | Model; R04. |
| `FullCartanData`, `FullCarrier`, full bracket | Root-free Y=ℤ; A₁ coroot 2y | root-free carrier ℤ, bracket 0; A₁ [e,f]=2H_y | Agrees. |
| `fullFrameMap`, `exists_full_frame_comparison` | A₁ with Y generated by h | images h,E,F are independent, rank 3; [E,F]=h | Model; R04. |
| `coverAction_projection` | Same | quotient of (−1,1)=1; identity action on quotient gives 1 | See R09. |
| `characterTwist`, inverse | χ(n)=(−1)ⁿ | (1,1)↦(−1,1)↦(1,1); n=2 unchanged | See R04. |
| `characterKernelEquiv`, `characterKernelEquiv_value` | Split extension above | character group size 2; projection kernel size 2; nontrivial value (−1,1) | Model; R04. |
| `liftableExtension` | Same | kernel size 2, lift group size 2, image size 1 | See R04. |
| `projection_surjective` | A₁ | two sign twists over each ± isometry | Agrees. |
| `faithful_integral_action` | A₁; zero rank | three nonidentity lifts alter H or E; rank-zero lift group is 1 | Agrees. |
| `signedLinearMap_bracket` | [E₁,E₂] | φ(E₁₂)=−E₁₂=[E₂,E₁] | Agrees. |
| `fixedIntegralBasis`, `fixedIntegralBasis_cartan` | A₂ | H₁+H₂; rank 1 Cartan part | Model; R04. |
| `fixedIntegralBasis_root` | A₂ | E₁+E₂ and F₁+F₂; total rank 3 | Model; R04. |
| `signedPermutation`, `signedPermutation_fixed_iff` | One coordinate, sign −1 | over ℤ: x=−x iff x=0; over F₂ all x satisfy it | Agrees. |
| `cycleDefect` | Same | defect (−1)−1=−2; kernel over ℤ is 0, over F₂ is F₂ | Agrees. |
| `signedCycleEquiv`, `signedCycleEquiv_eval` | Two-cycle signs −1,−1 | fixed vectors (a,−a); defect 0 and reconstructed values a,−a | Model; R04. |
| `foldedCartan` | A₃; A₄ | A₃ [[2,−2],[−1,2]]; A₄ [[2,−1],[−2,2]] | Agrees. |
| `foldedSystem` | A₂ | [E,F]=H; [H,E]=2E; [H,F]=−2F | Agrees. |
| `foldedMap_E` | A₂ | simple positive generator maps to e | Model; R04. |
| `foldedMap_H` | A₂ | simple coroot maps to 2h | Model; R04. |
| `foldedMap_F` | A₂ | negative generator maps to 2f | Model; R04. |
| `foldedMap_surjective` | A₂ over ℚ | h=(1/2)H,f=(1/2)F, hence image dimension 3 | Agrees. |
| `foldedMap_injective`, `foldedEquiv` | A₂ | three independent images, rank 3, kernel dimension 0 | Agrees. |
| Exceptional folding counts | D₄ triality; E₆ reversal | D₄: 24 roots, 12 positive-sign cycles+2 Cartan=14; E₆:72 roots,48+4=52 | Agrees. |
| Folding arbitrary-ring base change | A₂; A₄ modulo 2 | A₂ fixed dimension 5 vs integral rank 3; A₄ dimension 14 vs rank 10 | Agrees. |
| `fixedCartan`, kernel identity | γ=[[0,−1],[1,−1]] | det(γ−1)=3; ker over ℤ=0, ker over F₃=span(1,−1) | Agrees. |
| `exists_map_diagonalization` | γ−1; zero 1×1 matrix | Smith entries 1,3; zero matrix entry 0 | Agrees. |
| `smithKernelEquiv`, `smithKernelEquiv_reconstruct` | diag(1,3), A=F₃ | kernel {(0,a)}; reconstructed vector (0,a), dimension 1 | Model; R04. |
| Full reductive frame | Root-free rank 1; A₁ | ambient ranks 1 and 3; A₁ root-zero vectors fail ambientBasis | Agrees. |
| `integralPBWBasis`, `integralPBWBasis_apply` | A₁ zero exponent and (1,0,1) | intended basis values 1 and FE | Model; R04. |
| `frame_lie_generates` | A₁; root-free rank 1 | span{E,F,H} dimension 3=L; span{H} dimension 1=L | Agrees. |
| `rationalFormComparison` | Root-free rank 1 | rational span of binom(H,n) contains H²=2binom(H,2)+H | Agrees. |
| `finiteOrderDistributions` | Gₐ, evaluation δ₀ and first derivative D | δ₀ kills (x), D kills (x²), D(x)=1; D²(x²)=2 | Agrees. |
| `exists_jetDual_preimage` | derivative at identity | n=1 and φ(a+b(t−1))=b recover D | Agrees. |
| `rationalDistributionAction_on_weight` | Same; characteristic 3 | result 3m over ℚ; 0 over F₃ | Agrees. |
| Integral chart / pinning | SL₂ over F₂[ε]/ε² | x₊(ε)≠I, parameter ε recovered; doubled root generator maps 1 to I | Agrees. |
| Generated points vs quotient scheme | SL₂→PGL₂ over ℚ | diag(2,1) has determinant class 2, no SL₂ rational lift | Agrees. |
| Frobenius distribution map | p=2, root indices 1,2 | index 1→0; E^(2)→E^(1) | Agrees. |
| Frobenius kernel dimension | SL₂ and Gₘ, p=2,r=1 | dimensions 2³=8 and 2¹=2 | Agrees. |
| Toral idempotent μ₀ | Gₘ,p=3, weights 0,1,2,3 | binom(weight−1,2) mod3 =1,0,0,1 | Agrees. |
| Corner section unit | Same | φ(1)=μ₀ acts 0 on weight 1, while identity acts 1 | Agrees. |
| Contraction, nonmonoidality | p=3, weights 1 and 2 | each contraction dimension 0; tensor weight 3 contracts to weight 1, dimension 1 | Agrees. |
| Weyl/dual-Weyl/simple distinctions | SL₂, char2, degree2 | Sym² dimension3; span{x²,y²} dimension2; quotient dimension1 | Agrees. |
| Binary-form characteristic exercise | SL₂, char3, degree4 | dimension5; Lucas nonzero coefficients at 0,1,3,4 give simple submodule dimension4 | Agrees. |
| Ordinary vs contravariant dual | Gₘ weight1 | ordinary dual weight−1; transpose-style contravariant dual weight1 | Agrees. |
| Peter–Weyl coefficient coproduct | SL₂ matrix coefficient c₁₁ | Δc₁₁=c₁₁⊗c₁₁+c₁₂⊗c₂₁; x₊(2)x₋(3) gives 1+6=7 | Agrees. |
| SL₂/U chart transition | a=2,c=3,b=14,d=43/2 | ad−bc=1; u_a=7, u_c=43/6; difference 1/(ac)=1/6 | Agrees. |
| `centerHomeomorph_fst` | Same n=2 | intended first component2=centroid | Model; R04. |
| `centerHomeomorph_snd` | Same | intended second component (−1,1)=z−2 | Model; R04. |
| `planeBraidEquiv`, `planePureEquiv` | n=0,1,2 | groups 1,1,ℤ; pure subgroup at n=2 is 2ℤ≅ℤ | Model; R04. |
| `orderedCover_pi1` | n=2 | π₁ map ℤ→ℤ is m↦2m | Agrees. |
| `planeMonodromy`, `planeMonodromy_endpoint` | n=2 half twist; n=3 two adjacent twists | transposition; endpoints compose as (123), reverse order gives (132) | Agrees. |
| `permutation_extension_nonsplit` | n=2 | section would require 2x=0 in ℤ and x odd; only x=0 satisfies first | Agrees. |
| `SimpleSpectrum`, `matrixSpectrum`, `matrixSpectrum_charpoly` | diag(1,3); repeated eigenvalue1 | polynomial (X−1)(X−3), distinct multiset {1,3}; repeated case not separable | Model; R04. |
| `cameralEquiv_apply` | (gT,tH), g=1,t=2 | intended first coordinate2H=Ad(1)(2H) | Model; R04. |
| `cameralEquiv_second` | Same | second coordinate2H | Model; R04. |
| `simplyConnected_flagCoset` | SL₂/T | deformation retract S², π₁=0 | Agrees. |
| `spectralFundamentalEquiv`, `spectralFundamentalEquiv_toMonoidHom` | sl₂ regular locus→ℂˣ | π₁=ℤ on both; projection induces generator↦generator | Model; R04. |
| `arrangementArtinEquiv`, Weyl projection | A₁ | Artin group ℤ, Weyl C₂; m↦m mod2 | Model; R04. |
| `arrangementMonodromy_endpoint` | A₁ loop winding once in quotient | lift starting1 ends−1; monodromy nontrivial element of C₂ | Agrees. |
| Fixed-coset lifting (sample) | H=ℤ/4, σ=−1, J={0,2} | fixed coset {1,3} contains 0 fixed points; Lang(J)={0}, not J | Required hypothesis fails. |
| Fixed-coset formula | j=h⁻¹σ(h)=z⁻¹σ(z) | σ(hz⁻¹)=h·j·σ(z)⁻¹=h·z⁻¹ | Abstract deduction agrees. |
| `E_G(A)` | Root-free Gₘ; SL₂(𝔽₂) | root-free E={1}, Gₘ(ℚ)=ℚˣ; SL₂: E has 6 elements=G | Roots alone omit central tori. |
| `GE_G(A)` | Gₘ; SL₂(ℤ/4) | E·T=ℚˣ for Gₘ(ℚ); E=GE=G has 48 elements for SL₂ | Model agrees. |
| Torus normalization | SL₂, t=diag(2,1/2), x₊(3) | tx₊(3)t⁻¹=[[1,12],[0,1]]=x₊(4·3) | Agrees. |
| Weyl integral lift | SL₂, n=x₊(1)x₋(−1)x₊(1) | n=[[0,1],[−1,0]], det n=1; n²=−I | Lift is not an order-two section. |
| Chart inverse/field generation | g=[[2,3],[1,2]] | det=1; x₋(1/2)diag(2,1/2)x₊(3/2)=g | Model; supplier missing R03. |
| Local-ring chart cover | SL₂(ℤ/4) | 48 points; none has both first-column entries even; D(a)∪D(c) covers them | Model; R03. |
| General-ring open-cover distinction | g=[[2,1],[3,2]] over ℤ | det=1; neither 2 nor 3 a unit, but (2,3)=ℤ | Local-ring inference cannot be globalized. |
| Central-isogeny elementary image | SL₂→PGL₂ over ℚ | each root x(a) lifts; diag(2,1) has determinant class 2≠1 mod squares | Root surjection; whole-point surjection false. |
| Infinitesimal root parameter | SL₂ over 𝔽₂[ε]/ε² | x₊(ε)−I=εE₁₂≠0; doubled generator gives 0 | Scheme-level test. |
| `determinantRelation` | n=0,1,2 | 0; x−1; ad−bc−1, respectively | Native empty determinant=1. |
| `coordinatePresentation` | n=0,1,2 | intended quotients ℤ,ℤ,ℤ[a,b,c,d]/(ad−bc−1) | Model only; R04/R05. |
| SL coordinate coproduct | x₊(2),x₋(3) | Δa evaluates to 1·1+2·3=7; product (1,1)-entry=7 | Left-factor-first convention. |
| SL coordinate counit | n=0,1,2 | no generators; ε(x)=1; ε(a,b,c,d)=(1,0,0,1) | Identity values. |
| SL antipode | g=[[2,3],[1,2]] | adj g=[[2,−3],[−1,2]]; both inverse products=I | No extra transpose. |
| SL points/base change | same g modulo 2 | image [[0,1],[1,0]], determinant −1=1; quotient determinant relation maps to 0 | Naturality agrees. |
| SL datum/standard weights | n=1,2 | X=0; X=ℤ with weights ±1 generating X and root 2 | n−1 convention agrees. |
| SL root subgroup | n=2 over 𝔽₂ and zero ring | x₊(1)≠I over 𝔽₂; zero ring has I=0 and one point | All-ring formula agrees. |
| Native isometry group (R12) | A₁; empty lattice | norm(±1)=2=norm(1); norm(2)=8≠2; group sizes 2,1 | Same object as private subgroup. |
| Signed Jacobi exhaustive control | A₁,A₂,A₃ basis triples | 27,512,3375 sums tested; every sum=0=RHS | Finite check, not general proof. |
| A₅ reversal | 30 roots, simple orbits {1,5},{2,4},{3} | 18 positive-sign cycles+3 Cartan=21; middle full sum=2α₃ | Normalization agrees. |

## Not verifiable

- Admitted bases, actions, equivalences and continuous maps have no evaluable implementations. Model calculations do not verify the selected `sorry` values. The absent 9B.1–9B.3 contracts cannot be certified from a general existence citation.
- Legal-source fetches failed for Jantzen, SGA3, Conrad–Gabber–Prasad, Dipper–Du, Carter, Lang, Steinberg, Gassmann, Brieskorn and Salvetti. Bibliographic/DOI resolution was tried; CGP reached Cambridge, Lang JSTOR and Steinberg AMS landing pages without an available legal file. These are recorded together in the job's missing-reference record. Waterhouse, Borel, Springer, Howlett–Lehrer and Serre resolved as uncertified publisher citations; no access restrictions were bypassed.
- No exact passage identifies the source-discrepancy remarks about punctuation/proof announcements or the binary-form divisibility phrase. No source error is attributed to an unidentified passage. There is no README locator explicitly marked “unverified”; numerous claims instead lack exact locators entirely (R10).
- Source sampling, finite calculations and elaboration do not certify every general proof route, particularly integral charts, all-coefficient common-Levi corner units, quotient representability and spectral comparison constructions. Open-work ownership was checked in the supplied/readable files and authorized index; ownership against other open pull requests was not checked. Missing search matches are not proof of absence.

## Source issues

- **Misprint** in dudas-michel at Proposition 8.9 proof, printed p.32, dudas-michel line 1477: the source says the second factor in the decomposition of U∩Q repeats U∩Q; it should be U∩V; affects the proof.
- **Misprint** in dudas-michel at §10.1, printed p.41, dudas-michel lines 1828–1830: the source says the relevant Levi subgroups complement F-stable Levi subgroups; it should be they complement F-stable parabolic subgroups; affects nothing.
