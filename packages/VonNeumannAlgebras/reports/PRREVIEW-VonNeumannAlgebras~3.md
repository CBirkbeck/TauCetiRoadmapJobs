# Review of VonNeumannAlgebras (pull request #889 at 50bdeb4)

**Verdict:** needs changes

This head repairs the supply cycles, the Hecke citations, the crossed-product convention and most of the form findings of the previous review, and the mathematics of the 1,085 changed lines holds up under the computed pass below. What still blocks acceptance is unchanged from the previous round: the folder re-plans four foundations that `OperatorTheory` on main already plans, and a second open pull request by the same author builds the same folder with the same declarations.

**Repair status of the previous review (d6a00eb → 50bdeb4).**

| Previous | Status at 50bdeb4 | Evidence |
| --- | --- | --- |
| R01 (P1) two supply cycles (CStarAlgebras, BanachAlgebras A7) | Repaired. `CStarAlgebras` appears only as a consumer ("BanachAlgebras and CStarAlgebras are consumers of this roadmap … so nothing here is taken from either", README:59–61) and in Downstream (:3991); the `L²` regular representation is owned in V8.RegularL2 (:1798), the spatial norm in V13b.SpatialNorm (:3536), the `L¹` convolution and kernels are consumed from AmenableGroups Layer 7 (:180–188), C1's Gelfand input from Mathlib (:127–130). grep for `A7`, `C1`–`C5` as suppliers: 0 hits. Main `AmenableGroups/README.md:470–476` does state the convolution, translation continuity and kernels `h_U` cited. | |
| R02 (P1) OperatorTheory foundations re-planned | Not repaired: README:28–39, V2.PolarDecomposition :470, V2.BorelCalculus :479, V4.Core :875, V10.ClosedOperators :2068 unchanged in substance. See R01 below. | |
| R03 (P2) two pull requests build the folder | Not repaired: `roadmaps list` still shows `#1041 VonNeumannAlgebras (new) 8b00f8a`. See R02 below. | |
| R04 (P3) companion Lean files | Not repaired: `git diff --stat d6a00eb HEAD` touches `README.md` only. See R03 below. | |
| R05 (P3) `VonNeumannAlgebra.CrossedProduct`, Hecke declarations | Repaired: the convention now defines `M ⋊_α G` as the V8 regular crossed product (:79–82); the five Hecke-ring declarations are under "From Tau Ceti" with their modules (:165–170), and each exists at the pin (`TauCeti/NumberTheory/HeckeRing/Multiplication.lean:124`, `Multiplicity/Basic.lean:70`, `Commutativity.lean:79`, `:135`, `:459`). | |
| R06 (P3) form, locators, references | Repaired in substance: 115 `*Needs:*` lines (was 4), 29 `**Checks.**` blocks (was 8); Layers 6, 7, 9 and 13.1 now carry locators (Peterson 4.9.4, Anantharaman–Popa 8.2.2–8.6.2, Goodman–de la Harpe–Jones §3.3, Arveson 1969 1.2.3, Tomiyama 1957 Thm 1, Peterson 6.2.1); "Grundling" and the handwritten notes are gone (grep: 0); the Jones notes now resolve (`jones2009`, Berkeley author page). Residual locator defects are R05 below. | |

## R01 (P1) — Four foundations are planned here although `OperatorTheory` on main plans them

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:28–35` ("OperatorTheory is a consumer of this roadmap … so nothing here is taken from it. The Hilbert-space inputs of the theory are owned here: bounded polar decomposition (V2.PolarDecomposition), the bounded Borel calculus … (V2.BorelCalculus), trace class … (V4.Core), and closed operators, Cayley transforms and the multiplier-form unbounded spectral theorem (V10.ClosedOperators)"); targets at `:470–477`, `:479–496`, `:875–880`, `:2068–2095`.

**Claim:** Re-raised: R02 of the previous review. What another roadmap plans is imported, never planned again; the four targets are planned, with ids, on main:

| This README | Main `OperatorTheory` |
| --- | --- |
| V2.PolarDecomposition: `|x|=(x*x)^(1/2)`, `x=v|x|`, initial and final spaces, uniqueness, `|x*|=v|x|v*` (:470–476) | `PolarDecomposition/README.md:292` "Part B — polar decomposition and partial isometries"; `:365–372` "Complete-space rectangular polar decomposition … PD-B23 initial space of the bounded polar factor" through PD-B34 |
| V2.BorelCalculus: `f(a)` for bounded Borel `f`, spectral projections, scalar measures, cyclic multiplication model (:479–496) | `SelfAdjointSpectralTheory/README.md:293` "SA-B05 — Borel functional calculus. For normal bounded `a`, define `borelCalculus a` …", `:320` SA-B14 projection-valued measure, `:676` SA-B85 cyclic multiplication models |
| V4.Core: trace class with `‖x‖₁=∑⟨|x|e_i,e_i⟩`, Hilbert–Schmidt class, canonical trace (:875–880) | `OperatorIdeals/README.md:349–351` OI-B29 nuclear gauge, OI-B30 trace-class family; `:530` "Part C — Hilbert–Schmidt operators as an `ℓ²` space of columns" |
| V10.ClosedOperators: `T±i` bijective, resolvent bound, Cayley transform and inverse, multiplier-form spectral theorem (:2068–2088) | `SelfAdjointSpectralTheory/README.md:781` Part C closed operators, `:1041` Part D resolvents, `:1127` SA-D24 Cayley transform, `:1186` Part E spectral measure, `:1303` packaged spectral theorems |

The author's own open `OperatorTheory/UnboundedOperators` (pull request 1027) treats this folder as the owner ("the polar decomposition of a closed normal operator, specializing VNA V10's general polar decomposition", UO-B01; UO-A07 consumes "V10.ClosedOperators' cyclic multiplier-form theorem"), so at the heads there are two planned owners of the polar decomposition and the multiplier theorem.

**Witness:** `SelfAdjointSpectralTheory/README.md:255`, `:690`, `:1391` consume "VonNeumannAlgebras V4.0.Fields" at commit `4831498`, the foundations-only folder of pull request 1041; main already fixes the order VNA foundations → OperatorTheory → everything needing the Borel calculus.

**Repair:** As before: keep the foundations prefix (V0–V4 with V4.0.Fields, the scope main `OperatorTheory` consumes) as the supplier roadmap, and make this pull request the Part II starting at V5, consuming `PolarDecomposition` PD-B23–B34, `SelfAdjointSpectralTheory` SA-B05–B14, SA-B85, Parts C–E, and `OperatorIdeals` OI-B29–B30 and Part C by id; delete V2.PolarDecomposition, V2.BorelCalculus, the trace-class/Hilbert–Schmidt paragraph of V4.Core and V10.ClosedOperators, keeping only the membership and affiliation adapters (`f(a)∈W*(a)`, `v∈M`, affiliation) that :38–39 already describes. Control: after the edit the only mentions of polar decomposition, Borel calculus, trace class and Cayley transform are citations of OperatorTheory ids, and `OperatorTheory` is listed under `## Exact supplier contracts`.

## R02 (P2) — Two open pull requests build the same folder and declare the same names

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean:82`, `:110`, `:114`, `:119`, `:127`, `:133`, `:139`, `:145` against pull request 1041's `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean:24–83`; README Layers 0–4 (:230–1176) against pull request 1041's README headings V0–V4.

**Claim:** Re-raised: R03 of the previous review. `roadmaps list` shows `#889 VonNeumannAlgebras (new)` and `#1041 VonNeumannAlgebras (new) 8b00f8a`. Both files declare `IsFactor`, `ProjectionEquivalent`, `ProjectionSubequivalent`, `equivalent_of_subequivalent`, `double_commutant_iff_isClosed_image_ofCLM`, `IsCyclic`, `IsSeparating` and `isCyclic_iff_isSeparating_commutant` on `VonNeumannAlgebra H` (namespaces `VonNeumannAlgebra` and `TauCetiRoadmap.VonNeumannAlgebras`), and both READMEs plan V0–V4. One object has two owners, and main `OperatorTheory` cites the 1041 folder (R01).

**Witness:** `roadmaps show VonNeumannAlgebras --pr 1041 --file Suggested.lean` lines 24–83 (listed above); pull request 1041's README headings "V0. C*-algebra and state prerequisites" through "V4. Preduals, normality, and normal representations".

**Repair:** One owner per object, in the direction of R01: let 1041 be the foundations roadmap and this one its Part II (introduction says where the base stops; V0–V4 deleted here and cited by section), or close 1041 and split this folder into the same two pieces yourself. Control: exactly one open pull request declares `IsFactor` on `VonNeumannAlgebra H`.

## R03 (P3) — The two companion Lean files are unchanged: Mathlib sub-imports, duplicate statement, boundary theorem, diagonal-only signature

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/FiniteComplexModularTargets.lean:1–2`, `:4–9`, `:26`, `:34–38`; `TauCetiRoadmap/VonNeumannAlgebras/ProjectionClosureTargets.lean:1–3`, `:5–13`, `:34–37`, `:41–43`.

**Claim:** Re-raised: R04 of the previous review; both files are byte-identical to the previous head. They import Mathlib submodules instead of `import Mathlib`; their docstrings ("**This file is not the roadmap and is not exhaustive.** These are suggested forms") are not the "target signatures" form; `wot_closure_projections` (ProjectionClosureTargets:34) states verbatim the theorem already in `Suggested.lean:102`; `isClosed_projections_of_finiteDimensional` (:41) is the finite-dimensional boundary case the README keeps as a Check (:452–453); `diagonalModularPower_preserves_star_iff` takes `h : Fin n → ℝ`, so the README's non-diagonal admissible density (:2243–2248) is outside its signature; `diagonalModularPower_star` (:26) has no docstring.

**Witness:** `git diff --stat d6a00eb HEAD` lists `README.md` only; the README Check computes `β₁(e₁₁)=[[9/8,−3/8],[3/8,−1/8]]` for `h=[[1/2,1/6],[1/6,1/2]]`, which is not diagonal.

**Repair:** Delete both files; the README keeps every statement (the closure headline is in `Suggested.lean`, the finite-dimensional case and the two densities are Checks). Do not prove anything in place.

## R04 (P3) — The spatial norm now has an owner here, but the sibling `CStarAlgebras` head still builds it and says the reverse

**Location:** `README.md:65–67` ("C*-tensor norms other than the spatial norm … are left to CStarAlgebras"), `:3536–3559` (V13b.SpatialNorm), `:3991–3992` (Downstream: "its C6–C9 consume … the spatial norm of V13b").

**Claim:** This roadmap is the right owner (it precedes `CStarAlgebras`, which consumes V0–V4 and V13a, and the previous R01 asked for exactly this move). But pull request 860's `CStarAlgebras/README.md:47` says "V13b owns injectivity versus semidiscreteness and consumes C5's minimal tensor construction", and its C5 (`:546–556`) constructs the minimal norm "in faithful spatial representations on H⊗₂K; prove independence of the representations", the same object as V13b.SpatialNorm. Two open pull requests build the spatial norm.

**Witness:** `CStarAlgebras/README.md:47` and `:549–550` at head `1d4e2ed`, quoted above.

**Repair:** On this side, name C5 explicitly in Downstream ("CStarAlgebras C5 consumes V13b.SpatialNorm's spatial norm, representation independence, slice maps and inclusion functoriality, and adds the maximal norm and the C*-norm comparison"); the C5 text of pull request 860 must then cite V13b.SpatialNorm instead of rebuilding it. Not fixable in this folder alone, which is why it is P3 here.

## R05 (P3) — Locators: Anantharaman–Popa page numbers in Chapters 6 and 8 are PDF pages, a B1 citation for a theorem B1 does not state, and two overstatements

**Location:** `README.md:1198`, `:1208–1215`, `:1226–1227`, `:1336–1337`, `:1383–1385`, `:1507–1508`, `:1517–1518`, `:1576–1577`, `:1658–1659` (Anantharaman–Popa); `:174`, `:378`, `:1848`, `:3562` ("BanachSpaceTheory B1's Hahn–Banach separation"); `:2863` (Hiai, Theorem 6.6); `:3545–3547` (V13b.SpatialNorm).

**Claim:**

- In `anantharaman-popa` the printed page is the PDF page minus 6 (PDF page 94 carries the running head "88 6. FINITE FACTORS", `anantharaman-popa line 3992`; PDF page 134 carries "128 8. MODULES …", line 5888). The section locators use printed pages correctly (§2.4 p. 35, §5.4 p. 75, §7.1 p. 97, §9.1 p. 139, §10.2 p. 161, §11.2 p. 185, §12.5 p. 208, §15.2 p. 261, all confirmed), but the theorem locators of Chapters 6 and 8 use PDF pages: Theorem 6.2.8 is on printed p. 88 (line 4005), not 94; Theorems 6.3.4–6.3.5 on pp. 91–92 (lines 4188, 4228), not 97–98; Theorem 6.4.1 on p. 93 (line 4268), not 99; Theorem 6.4.4 on p. 95 (line 4341), not 101; Proposition 8.2.2 on p. 124 (line 5707), not 129–130; Definitions 8.3.1–8.3.2 on pp. 124–125 (lines 5742, 5765); Corollary 8.3.5 and Proposition 8.3.6 on p. 126, Proposition 8.3.8 on p. 127 (lines 5836–5862), not 132–133; Proposition 8.4.2 on p. 128 (line 5920), not 134; Definition 8.5.4 on p. 133 (line 6157) and Propositions 8.5.5, 8.6.1, 8.6.2 on p. 134 (lines 6182–6205), not 139–140. The statements themselves match the targets (see Verified sound).
- Main `BanachSpaceTheory/README.md` B1 (`:41–73`) has no Hahn–Banach separation target; its line 27 lists "Mathlib's Hahn–Banach theorem" as a prerequisite, and separation lemmas appear only as B2 intermediates (`:76`). Cite Mathlib (`geometric_hahn_banach_open_point`, `geometric_hahn_banach_closed_point`, `Analysis/NormedSpace/HahnBanach/Separation.lean`) or B2.
- `hiai2020 line 2698`: Theorem 6.6 is stated for a faithful normal **state** ω; the weight form at :2862–2866 is Takesaki II IX.4.2 (uncertified). Say which locator supports which case.
- `:3545–3547` says the vector states of a faithful representation "are weak-star dense in the state space", but the parenthetical proves only that their weak-star closed **convex hull** is the state space, which is all the route needs. Either weaken the sentence or cite Kadison–Ringrose Theorem 4.3.9 for the stronger form.

**Witness:** `anantharaman-popa line 3992` ("88 6. FINITE FACTORS" under the marker of PDF page 94); `BanachSpaceTheory/README.md:27`; `hiai2020 line 2698–2699`.

**Repair:** Subtract 6 from each Chapter 6 and 8 theorem page cited; repoint the four "B1's Hahn–Banach separation" citations; split the Theorem 6.6 citation; reword :3545.

## Verified sound

**Scope.** All 4,117 README lines and the three Lean files (200 + 43 + 45 lines) were read; the normative README and CONTRIBUTING; main `OperatorTheory` (PolarDecomposition, OperatorIdeals, SelfAdjointSpectralTheory), `BanachAlgebras`, `BanachSpaceTheory`, `AmenableGroups` (Layer 7 in full, `:415–500`), `OperatorAlgebraDynamics`, `TypeAHeckeAlgebras`, `RepresentationTheory/{CompactGroups,SemisimpleAlgebras,LieHighestWeight}`, `OptimalTransport`, `GlobalNumberFields`, `ModularForms`, `Completed/{ArithmeticDirichletSeries,OneParameterSemigroups}`; the open heads of `CStarAlgebras` (860), `NoncommutativeIntegration` (864), `Subfactors` (874), `OperatorTheory/UnboundedOperators` (1027) and `VonNeumannAlgebras` (1041). No file of the worktree was changed. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/VonNeumannAlgebras'` is empty. No algorithm target, `set_option`, admitted example, stray file, `lemma`, sorried data, LaTeX delimiter, pull-request number, process word, "Grundling", handwritten-notes citation, or machine path was found in the folder (grep counts 0).

**Gate** (worker, at 50bdeb4): `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`. Every check passes; the gate does not look at the companion files' imports (R03).

**Dependency check** (verbatim):

```text
depcheck: 200 roadmaps, 1308 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `ORDER.txt` lists this roadmap third (after KacMoody and LefschetzPencilsAndVanishingCyclesPartII). Independently of the tool: none of the main suppliers cited (AmenableGroups, BanachSpaceTheory, CompactGroups, SemisimpleAlgebras, LieHighestWeight, OptimalTransport, GlobalNumberFields, ArithmeticDirichletSeries, OneParameterSemigroups, ModularForms) mentions `VonNeumannAlgebras` (grep count 0 in each), so the cycles of the previous R01 are gone. `roadmaps resolve`: no cross-roadmap citation and no Lean name found nowhere.

**Lean.** `lake env lean TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean` from the worktree: exit 0, exactly 10 `declaration uses sorry` warnings (lines 71, 82, 91, 102, 119, 139, 168, 176, 183, 192), nothing else. A scratch copy with `#check @name` for all 18 declarations elaborated; every elaborated type keeps its section binders (`[CompleteSpace H]` on all 17 `H`-declarations; `[μ.IsHaarMeasure] [μ.Regular] [Countable ↥Γ]` and `Dense ↑Γ` on `ergodicSMul_dense_subgroup`; `[Nontrivial A] [SeparableSpace A]` on the ℓ² theorem), and each agrees with its README statement (bicommutant :410–412, Kaplansky :423–425, projection closure :380–406, cyclic/separating :1038–1040, Schröder–Bernstein :1184–1185, trace uniqueness/existence :1215–1220, simplicity :1253, dense translations :1916). **18 signatures checked, no dropped binder, nothing changed.** One-tactic probe (`first | (simp; done) | rfl | infer_instance | (simp [all eight definitions]; done) | sorry`) on the same copy: all 10 theorems still report `sorry`; none closes, so no padding by that test. The companion files are byte-identical to the previous head (their 2 and 3 `sorry` warnings and absence of other diagnostics were established there and are unchanged).

**Pinned declarations opened** (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`; paths library-relative). New or re-cited at this head: `MeasureTheory/Group/ModularCharacter.lean:130` `Measure.modularCharacter : G →* ℝ≥0` (the README's `c`); `MeasureTheory/Function/LpSpace/Basic.lean:595` `Lp.compMeasurePreserving`; `MeasureTheory/Function/LpSpace/DomAct/Continuous.lean:48–53` `Lp.instContinuousSMulDomMulAct` with hypotheses `[IsLocallyFiniteMeasure μ] [μ.InnerRegularCompactLTTop]`, as the README states (:132–135); `MeasureTheory/Measure/Haar/Quotient.lean:262` `IsFundamentalDomain.QuotientMeasureEqMeasurePreimage_HaarMeasure`, `:378` `QuotientGroup.integral_eq_integral_automorphize`; `MeasureTheory/Group/FundamentalDomain.lean:675` `covolume`, `:747` `QuotientMeasureEqMeasurePreimage`, `HasFundamentalDomain`; `Dynamics/Ergodic/Action/Basic.lean:43` `ErgodicSMul` (extends `SMulInvariantMeasure`, so the Lean hypothesis set of `ergodicSMul_dense_subgroup` is complete); `Analysis/Matrix/Spectrum.lean:142` `Matrix.IsHermitian.spectral_theorem`; `Algebra/Algebra/Unitization.lean` `starLift`, `fstHom`; `Analysis/CStarAlgebra/CompletelyPositiveMap`, `CStarMatrix`; `Algebra/Algebra/Equiv.lean` `MulSemiringAction.toAlgEquiv`; `Algebra/Star/UnitaryStarAlgAut.lean` `conjStarAlgAut`; `LinearAlgebra/FreeModule` `SmithNormalForm`; `Algebra/ContinuedFractions` `GenContFract`; `Analysis/Fourier/AddCircle` `fourierBasis`; `NumberTheory/HeckeRing/Defs.lean` `IsHeckeTriple`; `NumberTheory/LSeries/PrimesInAP.lean` `vonMangoldt.residueClass`, `continuousOn_LFunctionResidueClassAux`, `eqOn_LFunctionResidueClassAux`; `RingTheory/DedekindDomain/FiniteAdeleRing.lean:94`; `Algebra/Group/Invertible/Defs.lean:190` `Invertible.copy`, `Basic.lean:135` `Invertible.map`; `Algebra/Jordan/Basic.lean:90` `IsCommJordan`; `Algebra/Star/StarProjection.lean:26` `IsStarProjection`; `RingTheory/Derivation/Basic.lean:45` `Derivation`; `Topology/Compactification/OnePoint`; `IsModularLattice`; `ENNReal.tsum_comm`; `gramSchmidt`; `Real.fourierIntegral`. Carried over and still at the pin: the declarations listed in the previous review (`ContinuousLinearMapWOT`, `PointwiseConvergenceCLM`, `banach_steinhaus`, GNS, `PositiveLinearMap.exists_norm_apply_le`, `dualEmbedding_surjective`, `rightDualEquiv`, `SeparatingDual`, `TensorProduct` inner product, `Measure.pi`, `infinitePi`, `iIndepFun_infinitePi`, Gelfand duality, `RealRMK.rieszMeasure`, `LinearPMap.adjoint`). Tau Ceti: `Analysis/Fourier/Pontryagin/{DualEval,Continuity,Measure,Uniqueness,StronglyContinuous}.lean` all exist; `StronglyContinuous.lean:283` `ContRepresentation.exists_pontryaginMeasureTransform_eq_inner`; `MeasureTheory/Measure/FiniteMeasureExt.lean:263` `ext_of_forall_mem_subalgebra_integral_eq_of_innerRegular`; `MeasureTheory.FiniteMeasure.ext_of_forall_pontryaginMeasureTransform_eq_of_innerRegular` (used at `Uniqueness.lean:263`, `:281`); `DualEval.lean:29` `continuous_coe_eval_const`; `Analysis/Semigroups/Group/Stone/Unbounded.lean`; `MeasureTheory/Function/StronglyMeasurable/InnerRegular.lean:51` and the `aestronglyMeasurable_smul` lemma; `RepresentationTheory/Continuous/Integrated/Basic.lean` `integratedOperatorL1`; the Hecke-ring declarations named under R05 of the previous review; `LSeries/WienerIkehara/SharpCutoff.lean`, `ArithmeticDirichletSeries/{Transfer,HigherPrimePowers}.lean`. Missing at the pin: nothing cited.

**Cross-roadmap citations resolved** (each opened at main or at the named head): AmenableGroups Layers 5–7 `:289`, `:391`, `:415`, with Layer 7's convolution `(h*k)(x)=∫h(y)k(y⁻¹x)dμ`, `L¹` translation continuity, kernels `h_U` with `‖h*h_U−h‖₁→0`, pushforward `∫f(xg)dμ=c(g)∫f dμ` and inversion `μ.map Inv.inv = μ.withDensity c` (`:457–488`), exactly the contract at README:180–188; BanachSpaceTheory B1 `:41`, B2 `:74` (James `:85`, Krein–Šmulian `:91`), B4 `:167` (nuclear operators `:210–226`, Schmidt series `:226–247`); CompactGroups, SemisimpleAlgebras, LieHighestWeight (`:348` Clebsch–Gordan); GlobalNumberFields Layer 4 (`:414` `FiniteAdeleRing (𝓞 K) K`); OptimalTransport `:459` (analytic-set completion measurability), `:1004` (Jankov–von Neumann); Completed/ArithmeticDirichletSeries Layer 9 `:105` (`wienerIkehara`); Completed/OneParameterSemigroups exists. Consumers named under Downstream resolve: SelfAdjointSpectralTheory `:255`, `:690`, `:1391`; OperatorAlgebraDynamics `:46–50`, `:158–162` (consumes V8/V11 for the weak-closure comparison, as README:1856 says); BanachAlgebras `:55`, `:449`, `:997` (consumes V11's closed embedding only); TypeAHeckeAlgebras H3 `:366`; CStarAlgebras head `:41–47`, `:265`; NoncommutativeIntegration head `:34`, `:310` (I4); Subfactors head `:46–58`; UnboundedOperators head `:9`, `:31`, `:77`. `FactorRigidity` (cited only as a consumer, R6/R7) is an open pull request, not on main; that is allowed for a consumer. Ownership search by object (`roadmaps grep` for bicommutant, Kaplansky density, Tomita, continuous core, property Γ, injective factor, spatial tensor norm): no roadmap other than pull requests 889, 1041 and 860 (spatial norm, R04) plans them. Ownership against open pull requests whose files the brief did not supply was not checked.

**Seeded sample (13.1, 13.2) and sampled locators.**

| Target | Text, locator, outcome |
| --- | --- |
| 13.1 Tomiyama (Peterson 6.2.1, p. 98) | `peterson2013 line 3948`, under the marker of p. 98: unital C*-algebra A, unital C*-subalgebra B, linear E with `E|B=id`, `‖E‖≤1` ⇒ conditional expectation (bimodular, completely positive). Supports README:3503–3506 as written. Tomiyama 1957 itself: Project Euclid returned a landing page only (not verifiable). |
| 13.1 Arveson 1969 Theorem 1.2.3 | Paywalled DOI, uncertified. Peterson Theorem 6.3.6 (`line 4114`, p. 102) states the same extension theorem for operator systems and `B(H)`-valued CP maps. |
| 13.1 Umegaki (Peterson 6.2.2, p. 98) for V7.Index | `line 3975`: finite M with normal faithful trace, unique normal τ-preserving expectation onto N. Supports README:1684–1687. |
| 13.2 Anantharaman–Popa §§10.2–10.3 (pp. 161–172, finite case) | §10.2 at printed p. 161 (`line 7180`); Theorem 10.2.8 Powers–Størmer (`line 7325`), Theorem 10.2.9 hypertrace/finite-rank criteria (`line 7333`), Theorem 10.3.1 Connes' finite-rank Følner criterion with `‖uPu*−P‖₂<ε‖P‖₂` (`line 7413`). Supports README:3641–3647. |
| 13.2 Anantharaman–Popa §11.1–11.2 (pp. 173–190), §12.5 (p. 208) | Theorem 11.1.3 (amenable finite ⇒ AFD, `line 7702`), Theorem 11.2.2 (separable II₁: amenable ⇔ AFD ⇔ increasing finite-dimensional subalgebras, `line 8294`), Theorem 12.5.2 (`line 9247`). Printed pages confirmed by running heads. |
| 13.2 Haagerup 2016 (arXiv 1606.03156v1) | Theorem 1.1 (`haagerup2016 line 49`), 1.2 (52), 2.4 Connes–Størmer transitivity (222), 2.8 δ-related tuples (284), 3.1 (313), Definition 4.1 Q-stability `Σu_iu_i*=1`, `φu_i=m⁻¹u_iφ` (628–634), Theorem 4.2 (635), Lemma 4.4 expected `R_∞` subfactor (669), Theorem 5.1 (868). All hypotheses (injective, III₁, separable predual) match README:3871–3961. |
| 13.2 Haagerup 1989 §2 | Theorem 2.3 (`haagerup1989 line 183`): uniform δ(n,ε) over all von Neumann algebras and normal bimodules; its proof uses a Hilbert ultraproduct (line 427). Supports README:3929–3938. |
| 13.2 Connes 1975 (ASENS) | Theorems 1 and 2 (`connes1975 line 70`, `:93`): outer conjugacy for factors `M≅M⊗R` with separable predual; supports the trace-scaling/outer-conjugacy citation at :4044. |
| 13.2 Connes, periodic automorphisms (OCR) | Definition 1.3 outer conjugacy (`connesperiodic1975 line 121`), minimal period and obstruction (`:264`, `:285`); statement-level support for :3822–3834. |
| 13.2 Connes–Feldman–Weiss, Takesaki III, Runde, Haagerup 1985/1987, Connes–Woods, Connes–Størmer | Not readable (see Not verifiable). |
| V13b.SpatialNorm, Takesaki I IV.4.9 | Uncertified (no legal text found). The statement is the standard representation-independence theorem; checked on the instances below. |
| V5 (Anantharaman–Popa 6.2.8, 6.3.4, 6.3.5, 6.4.1, 6.4.4; Peterson 4.7.10, 4.8.2) | Theorem 6.2.8 unique dimension function on a diffuse finite factor (`line 4005`); 6.3.4 extends to a normal faithful tracial state (`4188`); 6.3.5 factor has a norm-continuous tracial state iff finite, unique and faithful (`4228`), which is exactly `tracialState_unique` without normality; 6.4.1 Dixmier averaging (`4268`); 6.4.4 centre-valued expectation iff finite (`4341`); Peterson 4.7.10 (`peterson2013 line 2844`), 4.8.2 Dixmier property (`2956`). Pages: R05. |
| V6, V7 (Anantharaman–Popa 8.2.2, 8.3.1–8.3.8, 8.4.2, 8.5.4–8.6.2; Peterson 4.9.4, 4.9.5, 3.3.1, 3.3.2, 3.3.9) | 8.2.2 standard amplification `U:H→ℓ²(ℕ)⊗L²(M)`, footnote "without separability replace ℕ by a set I" (`line 5707–5750`), matching V7.StandardAmplifications; 8.3.1 trace axioms with `0·∞=0` (`5742`); 8.3.6 II∞ trace values `[0,∞]`, uniqueness up to scalar (`5838`); 8.3.8 `p≼q ↔ Tr(p)≤Tr(q)` for separable II∞ (`5862`); 8.4.2 canonical commutant trace `τ̂(TT*)=τ(T*T)` (`5920`); 8.5.4 `dim(H_M)=τ̂(1)` (`6157`); 8.6.2 bijection onto `[0,∞]` for separable II₁ (`6205`). Peterson 4.9.4 (`3080`), 4.9.5 (`3121`), 3.3.1 (`1893`), 3.3.2 (`1928`), 3.3.9 (`2028`). Pages: R05. |
| V8 (Peterson 5.1.3, 5.1.4, 5.1.6) | `peterson2013 lines 3221, 3233, 3271` (group von Neumann algebra, trace, ICC criterion), pp. 83–84 as cited. |
| V1, V12 (Jones 2009) | p. 13 remark "any positive self-adjoint a with ‖a‖≤1 is a weak limit of projections" (`jones2009 line 288–289`), stated without a dimension hypothesis as README:402–404 says; §7.3 two-projection exercises p. 46 (`line 1443`); Chapter 10 p. 61 (`1870`), Proposition 10.2.6 p. 66 (`2048`); Theorem 16.3.1 p. 108 (`3395–3400`) with the constant 14. Printed page = extraction page (checked at pp. 12, 45, 59–60, 107–108). |
| V10, V11 (Hiai) | Theorem 2.2 Tomita (`hiai2020 line 436`), 2.14 KMS (737), Proposition 3.8 (963), Theorems 3.12–3.13 (1158, 1167), 6.6 (2698, state form: R05), 7.6 cocycle (3268), 9.4 Pedersen–Takesaki with `(Dφ_A:Dφ)_t=A^(it)` (4223), 10.7 duality (4606), Propositions 13.6 (6778), 13.14 additivity (6980), 13.16 support (7047), Theorem 13.17 (7080), Remark 13.18 (7109). |
| V11 (Connes 1973) | Théorème 3.5.4, `λ∈]0,1/2[` (`connes1973 line 2676`); Théorème 3.6.1 (2770). |
| V12 (Connes, automorphismes §II) | `connes-automorphismes line 601–606`: §II, `Ct(M)` a normal subgroup of `Aut M`. |
| V12.J (Hamhalter 4.3; Bunce–Wright A/B) | `hamhalter2014 line 627–630` (orthoisomorphism from P(A), A without type I₂ summand, extends to a Jordan *-isomorphism); `bunce-wright1992 lines 53–59`, bound `‖β‖≤4 sup|β(p)|` (line 86). |

**Computed adversarial pass** (values on both sides; "retain" means the instance confirms the statement; no row changed a statement).

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| `exists_injective_nondegenerate_representation_lp` | A=ℂ; A=0 | ℂ by scalars on ℓ²: injective, orbit span = ℓ²; A=0: span {0}, not dense, excluded by `Nontrivial` | retain |
| V0 Checks | ℂ², `x=[[1,−1],[−1,1]]`, c₀ | segment with endpoints the two evaluations; eigenvalues 0,2 so x≥0 with x₁₂=−1; δ_n→0 weak-star, ‖0‖=0 | Checks correct |
| V0 GNS dimensions | tr/2 and x↦x₁₁ on M₂ | GNS spaces M₂ (dim 4, cyclic vector 1) and ℂ² (cyclic vector e₁) | Check correct |
| `double_commutant_iff_isClosed_image_ofCLM` | A=ℂI, M₂, H=0 | (ℂI)″=ℂI, M₂″=M₂, both WOT-closed; H=0 trivial | retain |
| Generation Check | S={e₁₂} | S′={aI+be₁₂}, S″=span{I,e₁₂} (dim 2) ≠ M₂; with e₂₁: e₁₂e₂₁=e₁₁ generates M₂ | Check correct |
| `closure_unitBall_eq_unitBall_double_centralizer` | A=ℂI; finite rank+ℂ on ℓ² | balls coincide; P_n→1 SOT with ‖P_n‖=1 puts 1 in the SOT closure | retain |
| `closure_isStarProjection_eq_positive_contractions` | C=1/4 on a line; H=ℂ; H=0 | P=[[1/4,√3/4],[√3/4,3/4]]: P²=P, P*=P, P₁₁=1/4; on ℂ projections {0,1}, 1/2 outside; H=0 both {0} | ¬FiniteDimensional necessary, retain |
| V2.RectangularL2 rectangle identity without σ-finiteness | cover A×B by A_n×B_n | pointwise ν(B)1_A(x)≤Σν(B_n)1_{A_n}(x) (for x∈A, B⊆⋃_{x∈A_n}B_n), integrate: μ(A)ν(B)≤Σμ(A_n)ν(B_n); trivial cover gives ≤ | retain |
| Two product conventions | μ=ν=∞·Lebesgue on [0,1], diagonal D | bind product ∫ν({x})dμ=∫∞·0=0; a rectangle cover of D with every rectangle having a null side projects [0,1] into a null set, so κ(D)=∞ | Check correct |
| ITP criteria | ζ_n=−e₁; cos(1/n); cos(1/√n) | Σ(1−|⟨ζ,η⟩|)=0 yet Ω_m=(−1)^m alternates; Σ(1−cos(1/n))≈Σ1/(2n²)<∞; Σ(1−cos(1/√n))≈Σ1/(2n)=∞ | Checks correct |
| V2.NonmodularProjectionLattice | D(x)_n=x_n/(n+1), y_n=1/(n+1) | Dx=y forces x_n=1∉ℓ²; B∧C=0; A∨B dense; A∨(B∧C)=A≠C=(A∨B)∧C | retain |
| V3 multiplicity matrix | (x,c)↦(diag(x,x,c),diag(x,c)) | rows M₅,M₃, columns M₂,ℂ: [[2,1],[1,1]]; 2·2+1·1=5, 1·2+1·1=3 | Check correct |
| V4.Core Checks | diag(1/n²), diag(1/n), shift | Σ1/n²=π²/6 trace class; Σ1/n=∞ not; |S|=1 so Σ⟨|S|e_i,e_i⟩=∞ | Checks correct |
| V4.PositivePredual norm formula | h=diag(2,−1) | ‖φ_h‖=3=‖h‖₁, h₊=diag(2,0), h₋=diag(0,1), masses 2+1 | retain |
| `IsCyclic`/`IsSeparating`/iff | M₂ on ℂ², ξ=e₁; diagonal algebra; H=0 | e₁ cyclic not separating (e₁₂e₁=0), separating for ℂI; (1,1) both, (1,0) neither; H=0 both true | both directions, retain |
| Faithful C*-state counterexample | A=C([0,1],M₂) | φ(a*a)=0 ⇒ each column vanishes on a dense set ⇒ a=0; projection at coordinate 0 onto v₀^⊥ kills Ω | retain |
| `ProjectionEquivalent`/`Subequivalent`/`equivalent_of_subequivalent` | v=e₂₁; M₂ e₁₁≼1; B(ℓ²) p=1, q=1−e₀e₀* | v*v=e₁₁, vv*=e₂₂; rank 2>1 so 1⋠e₁₁; S*S=1, SS*=q gives 1∼q with 1≠q | retain |
| `IsFactor`, `IsFinite`, `IsTypeIIOne` | M₂, diag(ℂ²), H=0; M_n, B(ℓ²); R | diag(1,0) central non-scalar; H=0 has 1=0; S*S=1≠SS*; rank-one projections minimal | retain |
| `tracialState_unique`, `exists_faithful_tracialState` | ℂ⊕ℂ; B(ℓ²); x↦x₁₁ on M₂ | t·pr₁+(1−t)·pr₂ tracial ∀t (factor needed); 1=SS*+e₀e₀* with both ∼1 ⇒ τ(1)=2τ(1)=0; τ(e₁₂e₂₁)=1≠0=τ(e₂₁e₁₂) | retain |
| `isSimpleRing_of_isTypeIIOne` extraction | a=diag(1,1/2), ε=1/2 | f_ε(a)=diag(1,2), a·f_ε(a)=I=1_[1/2,∞)(a)≠0 | retain |
| V6 Checks | B(ℓ²), R⊗̄B(ℓ²), ‖·‖ on positives | Tr(p)=rank, Tr(1)=∞; Tr(1⊗e₀₀)=1, Tr(p⊗1)=∞; ‖e₁₁+e₂₂‖=1≠2 | Checks correct |
| V6.LatticeTypes central formulas | R⊕B(ℓ²)⊕M_III | z_I=(0,1,0), z_sf=(1,1,0), z_fin=(1,0,0) ⇒ z_III=(0,0,1), z_II1=(1,0,0), z_IIinf=0 | retain |
| V7 dimension normalisation | N=M₂: L²(N), ℂ²; p=e₁₁; N=ℂ, ℓ²(I) uncountable | dim 1 and 1/2 (unnormalised: 2, 1); dim_(pNp)(pℂ²)=1=(1/2)/(1/2); Σ'1=∞ and no isometry into S_ℕ | Checks correct |
| V8.SubgroupCosets finite expansion | x=u_h, h∈Hg_j | E_H(u_h u_{g_i}*)=u_{hg_i⁻¹} iff i=j, else 0; sum returns u_h | retain |
| V8 group Checks | L(ℤ/2); Σ2^(−n)u_n; F₂ | circulant [[a,b],[b,a]]≅ℂ²; Σ4^(−n)=1/3; b^n a b^(−n) distinct | Checks correct |
| V8.RegularL2 norm bound | G=ℤ, f=δ_{−1}+iδ₀+δ₁ | f̂(e^(iθ))=2cosθ+i, |f̂|²=4cos²θ+1≤5, ‖λ(f)‖=√5<3=‖f‖₁ | Check correct, not an isometry |
| V8.RegularL2 nondegeneracy | G=ℝ, h_ε=(2ε)⁻¹1_[−ε,ε], f=1_[0,1] | λ(h_ε)f−f equals ±(ε∓r)/(2ε) on [−ε,0], [0,ε] and symmetrically at 1: four integrals of ε/12, total ε/3 | Check correct |
| V8.RegularL2 adjoint convention | affine group, left Haar da db/a², g=(α,β) | Jacobian of right translation α, so μ(Eg)=α⁻¹μ(E) and ∫f(xg)dμ=α∫f dμ, c(α,β)=α; (α,β)⁻¹=(1/α,−β/α); with c(s⁻¹)=1/α instead, λ(f)*≠λ(f*) | Check correct |
| V8.LCHRegularNormalBridge weak⇒strong* | orbit g↦α_g(x) ultraweakly continuous | ‖(α_g(x)−x)ξ‖²=ω_ξ(α_g(x*x))−2Re ω_ξ(x*α_g(x))+ω_ξ(x*x)→0 | retain |
| V8.LCHRegularNormalBridge James route | compact orbit set K, closed convex hull | sup of Re f (or |f|, B2's form) over the hull equals sup over K and is attained on K⊆hull | retain |
| V8 crossed-product Checks | ℤ/2 flip on ℂ²; trivial action on ℂ; Pauli | π(a,b)=diag(a,b), u=flip: M₂; L(ℤ/2)≅ℂ²; σ₁σ₂=iσ₃ no group implementation | Checks correct |
| `ergodicSMul_dense_subgroup` | Γ=ℚ⊂ℝ; Γ=ℤ⊂ℝ | G=⋃_γ γK° since g(K°)⁻¹ meets Γ; ⋃_n[n,n+1/2) ℤ-invariant not scalar | retain, density needed |
| V8.Bernoulli stabiliser | finite support F, f∈F; g of order 2 | g↦gf injects Stab(F) into Ff⁻¹, |Stab|≤|F|; k disjoint 2-cycles: equal-coordinate probability (Σp_i²)^k→0 | retain |
| V9 covolume and formal degree | G=ℝ, Γ=ℤ, θℤ; PSL₂(ℝ), n | covolume 1, θ; d_n·covol=(n−1)/(4π)·(π/3)=(n−1)/12 | Checks correct |
| V10.ClosedOperators Checks | mult. by t; T=0; diag(λ_n) | (t−i)/(t+i)=1 would need −i=i; T=0 ⇒ U=−1; i(1+U)(1−U)⁻¹=i·(2λ/(λ+i))·((λ+i)/(2i))=λ | Checks correct |
| V10.ClosedOperators spectra | Tf=f′ on L²[0,1] | zero-left-endpoint: Volterra inverse, spectrum ∅; periodic: e^(2πikx), 2πiℤ | retain |
| V10.Affiliation Check | T=t on L²(ℝ), ε>0; derivative vs L∞ | f_ε(T)=mult. by f_ε ≤1/ε, T f_ε(T)=1_[ε,∞)(t); (tf)′=f+tf′ so not affiliated | Checks correct |
| V10.FiniteComplexPowers | h=diag(2/3,1/3); h=[[1/2,1/6],[1/6,1/2]]; h central | β₁(e₁₂)=2e₁₂, β₁(e₁₂)*=2e₂₁≠e₂₁/2; det 2/9, h⁻¹=[[9/4,−3/4],[−3/4,9/4]], β₁(e₁₁)=[[9/8,−3/8],[3/8,−1/8]], adjoint=β_{−1}(e₁₁); β_z=id ∀z | Checks correct; companion signature cannot take the second (R03) |
| V10.KMS strip convention | h=diag(2/3,1/3), x=e₁₂, y=e₂₁ | σ_t(e₁₂)=2^(it)e₁₂; F(z)=(2/3)2^(iz); F(t)=φ(σ_t(x)y), F(t+i)=(1/3)2^(it)=φ(yσ_t(x)); uniqueness forces h₁₁/h₂₂=2 | Checks correct |
| V10.Hecke | g=(m/n,b), H={(1,k)}; Schur test | H∩gHg⁻¹={(1,k):k∈mℤ}: L=m, R=n; ‖λ(1_{HgH})‖≤√(R·L) | retain |
| V10.AffineHecke state | n=2 | s₂*s₂=1, φ(s₂s₂*)=1/2=m(2Ẑ) | retain |
| V11 Checks | B(ℓ²), M₂ with h=diag(2/3,1/3), p=e₁₁; ℓ∞ weight | n_Tr=S₂, m_Tr=S₁, σ^Tr=id; (Dφ:DTr)_t=h^(it) (Hiai 9.4 with A=h); θ_p(e₁₁)=Tr(he₁₁)=2/3, e₁₁ fixed by Ad(h^(it)); Σn·x_nn finite on finitely supported, unbounded | Checks correct |
| V11 core trace scaling | M=ℂ, u_t↦e^(itσ) | h=e^σ; (θ_s f)(σ)=f(σ+s) from θ_s(u_t)=e^(ist)u_t; Tr(θ_s f)=∫f(σ+s)e^(−σ)dσ=e^s Tr(f); with e^(−ist): e^(−s) | Check correct |
| V11.DoubleDualEmbedding | ε<1/3; injectivity; closed image | |p(g)−1|≤ε·ν(K)+2ν(K^c)<3ε<1; γ(g)=1 ∀γ ⇒ p(g)=1=‖ξ‖‖λ_gξ‖ ⇒ λ_gξ=ξ; gV∩V=∅ ⇒ λ_g1_V≠1_V; a locally compact dense subgroup of a Hausdorff group is open hence closed | retain |
| V11 Bochner Check | G=ℝ, ξ=1_[0,1] | ⟨ξ,λ_gξ⟩=|[0,1]∩[g,1+g]|=max(1−|g|,0), the inverse transform of (sin(t/2)/(t/2))²/(2π), whose integral is the value 1 at g=0 | Check correct |
| V11 ℤ/𝕋 Check | K=𝕋, ε<2; K⊆ℤ finite | |zⁿ−1|<ε ∀z forces n=0; finite K gives the usual neighbourhoods of 1 | Check correct |
| V11.UnitizationCharacters | A=0; γ_φ bounded | Ω=∅, Ω⁺={∞}; |γ_φ(x)|≤‖λ(L_xf)‖/|φ(λ(f))| bounded ⇒ |γ_φ|=1 | retain |
| V11 invariants | B(H); R_λ; M₃ with ρ=diag(1,λ,μ)/(1+λ+μ) | Δ_Tr=1 so S={1}, T=ℝ; S={0}∪λ^ℤ, T=(2π/log λ)ℤ; irrational log λ/log μ gives ratio set [0,∞) ⊋ λ^ℤμ^ℤ | Checks correct |
| V11 cocycle normalisation | φ=2ψ | (Dφ:Dψ)_t=2^(it) | retain |
| V12 two projections | p=e₁₁, q=½[[1,1],[1,1]] | (p−q)²=I/2 central; pqp=p/2 | retain |
| V12 R⊕ℂ regression | τ=(1/4)τ_R+(3/4)·, u_n at site n | dist² to centre ≥1/4; unitary (v,z): |τ|≥3/4−1/4=1/2 | not a Γ witness, retain |
| V12 ICC estimate Check | x=u_a∈L(F₂) | ‖x−τ(x)1‖₂=1; [u_a,u_b]=u_{ab}−u_{ba}, orthogonal, ‖·‖₂=√2; 1≤14√2 | Check correct |
| V12.J.Frame dim 2 | f=1/2+sgn(n₃)/4 | axis values 3/4,1/4,1/2 force the affine 1/2+n₃/4; at (1/√2,0,1/√2): 0.677≠3/4 | retain |
| V12.J.Bloch | n=(1/√2,0,1/√2) | image (1,0,2)/√5; pulled-back (1+2/√5)/2≈0.947 vs 0.854; images of the ±-pair have inner product −3/5 | retain |
| V12.J.Maps transpose | x=e₁₂, y=e₂₁ | (xy)ᵀ=e₁₁, xᵀyᵀ=e₂₂; Jordan products both I/2 | retain |
| 13.1 Checks | diagonal expectation; x↦x₁₁e₁₁+x₂₂e₂₂+x₁₂e₂₁; transpose; ρ=[[1/2,c],[c̄,1/2]] | CP, norm 1; x=[[1,1],[1,1]]≥0 ↦ [[1,0],[1,1]] not self-adjoint; Choi matrix of transpose has eigenvalue −1; ρ≥0 iff |c|≤1/2, restricts to (a+b)/2 | Checks correct |
| 13.2 Q-stability | Definition 4.1, Haagerup 2016 | `Σu_iu_i*=1`, `φu_i=m⁻¹u_iφ` — identical to README:3923–3925 | retain |
| 13.2 Powers–Størmer | h=diag(1,0), k=diag(1/4,0) | ‖h^(1/2)−k^(1/2)‖₂²=1/4≤‖h−k‖₁=3/4 | retain |
| 13.2 Checks | ℓ∞ truncations; B(ℓ²) via A_n; L(F₂) | norm distance 1 for x=(1,1,…); ⋃A_n weakly dense; L(F₂) lacks Γ so not R | Checks correct |
| V13b.SpatialNorm Checks | u=e₁₂⊗e₁₂+e₂₁⊗e₂₁; 1⊗1; C(X); ℂ² on ℂ² and ℂ³ | u swaps e₁⊗e₁,e₂⊗e₂ and kills the rest: u*u rank-2 projection, ‖u‖=1 vs 2; ‖1⊗1‖=1 vs 2; sup|f(x)−f(y)|=1 on δ_x⊗δ_y; projections of rank 2 and 3, both norm 1 | Checks correct |
| V13b.SpatialNorm route | faithful π, self-adjoint a | sup_ζ⟨ζ,π(a)ζ⟩=max σ(π(a))=max σ(a); separation shows the closed convex hull of vector states is S(A) (R05 wording) | retain |
| V10.AffineAP | d=4,a₀=1; d=3 pair | residue 1/2, π_(4,1)(20)=3; p=103,q=211≡1 mod 3, |q/p−2|=5/103<1/10 | retain |

## Not verifiable

- **Tomiyama 1957:** Project Euclid returned a landing page without the article text (`tomiyama1957`, 5 lines); Theorem 1 is cited through Peterson 6.2.1 instead.
- **Connes–Feldman–Weiss:** the IHES archive address returns a catalogue page without the text (102 lines); Definitions 5–6, Proposition 7, Lemmas 8–9, Theorem 10 unread.
- **Takesaki I (IV.4.9), II (VI–IX, XII), III (XIII, XV.3, XVI.1.9, XVII.3.12, XVIII), Runde 6.4.14 and 6.4.24–25, Arveson 1969 Theorem 1.2.3, Haagerup 1985 (JFA), Haagerup 1987 (Acta), Wassermann 1988, Bost–Connes Theorem 5, Goodman–de la Harpe–Jones §3.3:** the service resolved each only to a paywalled page (uncertified) or found no legal source; cited by locator, not read.
- **Araki–Woods 1968, Connes–Takesaki 1977, Høegh-Krohn–Landstad–Størmer 1981, Gleason 1957, Reed–Simon I:** landing pages on hosts in no licence class or no legal source (`needs-references.toml` lists them); not read.
- **Connes–Størmer 1978, Connes–Woods 1985, Haagerup 1979, Laca–Raeburn, Neshveyev, Sakai 4.1.6, Kadison–Ringrose, Conway, Rudin (both), Folland, Arveson's *Invitation*:** paywalled journals or textbooks cited by number, not fetched this round.
- **Connes 1985 (JOT):** an OCR text is in the cache from the previous round; it was not re-read this round, and the citation is statement-level only.

## Source issues

- **Error** in jones2009 at Chapter 3, printed p. 13: the source says every positive operator of norm at most one is a weak limit of projections, with no dimension hypothesis; it should be stated for infinite-dimensional H, since on ℂ the projections {0,1} are closed and 1/2 is not a limit; affects nothing (a parenthetical remark, already qualified in the roadmap).
