# Port report: MotivicEtaleKTheory

Branch: `roadmap/motivic-etale-k-theory`.
Head commit: `9bcd1b65366c5ef35d8129c2793394e749f6af78`.
Base: `1759538`; the initial worktree was clean.

The commit contains exactly `TauCetiRoadmap/MotivicEtaleKTheory/README.md`, `TauCetiRoadmap/MotivicEtaleKTheory/Suggested.lean` and `TauCetiRoadmap/MotivicEtaleKTheory/metadata.toml`. The top-level roadmap list, library pins, tooling, suppliers and merge order are unchanged. No push or GitHub write was made.

## Validation

Command: `lake build TauCetiRoadmap.MotivicEtaleKTheory.Suggested`.

```text
✔ [8976/8976] Built TauCetiRoadmap.MotivicEtaleKTheory.Suggested (3.1s)
Build completed successfully (8976 jobs).
```

Exit 0; warning count **0**, including 0 sorry warnings. The acceptance module has no declarations. The build process has exited.

Final push-gate summary (exit 0):

```text
gate MotivicEtaleKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The gate requires a clean worktree: before the commit, every content counter was zero and only its dirty-worktree check failed. The final gate was run against the committed tree with `--base origin/main`.

The separate dependency command used `--name MotivicEtaleKTheory`, the supplied order and `--movable`. Its complete output was:

```text
depcheck: 31 roadmaps, 284 edges, 0 problem(s)
```

Exit 0; no UPWARD, CYCLE or moved line. Citation resolution against main `1759538` and the indexed 335 open heads found no missing cross-roadmap citation and no missing Lean name. The resolver says it does not check pinned Lake packages; the direct pin audit below covers those names. `git diff --check` passed. All 27 numbered subsections retain at least three Checks, and all seven layers retain Examples and Dependencies. Section 2.0a has ten Checks.

## Draft pull request body

Builds integral cubical and mixed higher-cycle models, the rational comparison with scheme K-theory, and the real Deligne–Beilinson regulator. The logarithmic theory handles arbitrary twists and singular closed supports, with compactification independence and products; its end theorems identify the universal regulator with the independently normalized Beilinson character and prove multiplicativity on integral higher Chow groups.

AI assistance: Codex (GPT-6).

## Suppliers still in open roadmap work

The direct suppliers adding new roadmap folders are **GeneralAlgebraicKTheory**, **SchemeKTheoryOperations**, **KTheoryFiniteLocalFields**, **MotivesAndAlgebraicCycles**, **ResolutionOfSingularitiesCharacteristicZero**, and **ComplexComparisonPartII**. All were read through the roadmap service at the indexed heads. Existing-roadmap revisions were not substituted for main.

| Supplier | Verified contract |
| --- | --- |
| GeneralAlgebraicKTheory | §3.12; §§4.6, 4.8, 4.14; §6.3; §§7.4–7.7; §§8.12–8.13: actual K-models, resolution, dévissage, localization, tensor pairings, transfers and the right-linear DVR boundary. The boundary sections state B[π]=+1 and the degree-n uniformizer-last adapter (−1)ⁿ⁻¹B, n≥1. |
| SchemeKTheoryOperations | §§2.1–2.6, 3.1–3.6, 4.3, 6.1, 6.7–6.9, 7.1–7.3: scheme and supported perfect K-theory, derived pullback, supported external spectrum pairing, actual classifying-sheaf comparison, pointed operations, finite rational weights and the degree-zero character. Section 6.9 includes regular-base A¹ representability and several-variable uniqueness. |
| KTheoryFiniteLocalFields | §3.0a, motivicCycles and motivicToK: arbitrary-field integral simplicial cycles, derived coefficients, localization, smooth incidence moving, finite-field transfer descent and the motivic-to-K tower. Section 6.10, diagonalChernMilnor, supplies the integral Chern construction and diagonal factorial. |
| MotivesAndAlgebraicCycles | §4.4; §§4.7–4.8a, 4.14, 4.17–4.18: functorial Tate complexes, shared-cycle adapters, relative-cycle specialization and motive comparisons. The perfect-field comparison of §4.17 has no resolution hypothesis; the separately resolution-dependent comparisons retain theirs. |
| ResolutionOfSingularitiesCharacteristicZero | §§5.1–5.6, 6.1–6.4: resolution preserving the smooth open and initial boundary, projective SNC compactification for quasi-projective inputs and étale SNC coordinates. Properness is not replaced by projectivity. |
| ComplexComparisonPartII | §§C−1.1, C−1.4, C5.1, C5.3–C5.6, C6.0: analytification, proper geometric Hodge comparison, native integration currents and ordinary Chern normalization, logarithmic comparison and stratified topology. In §C5.6 the trivial extension has residues 0, which satisfy the exclusion of positive integers. |
| SchemeAndStackFoundations, main | §§2.1–2.2, 4.12, 4.17, 5.1–5.8: cohomology, Chow domination, SNC geometry, native cycle subgroups, ordinary intersections and Chern theory. |
| EtaleCohomologyFoundations, main | §§G.1–G.3: compactification objects, existence, finite-diagram refinements and coherent comparisons. |
| EnhancedDerivedSheaves, main | §§0.1–0.4, E0.6, E1.4, E2.6: enhanced complexes, replacements, tensor, coherent diagram calculus and descent. |
| DifferentialGeometry, main | Layers 0–1 and 5–9: forms, pullback, integration, Stokes, de Rham comparison and duality. The two additional closed-jet contracts remain explicitly conditional; they are not attributed to existing sections. |
| ComplexKahlerGeometry; ComplexManifolds, main | K1–K2; Milestones 1–2: type calculus, conjugation, Dolbeault operators and the shared complex orientation, with finite-dimensional Hausdorff second-countable hypotheses. |
| AlgebraicTopology, main | Stages 2–3, Stage 6 items 1–4, Stage 8 item 2: relative topology, local duality and the Moore-homotopy comparison for simplicial abelian groups, including components. |
| Completed/HodgeStructures | Linear pure and mixed Hodge theory; the geometric logarithmic and Deligne constructions are not attributed to the linear structures. |

## Lean scope and binder audit

`Suggested.lean` is byte-for-byte the accepted package file: one `import Mathlib`, one module docstring, and the empty namespace `TauCetiRoadmap.MotivicEtaleKTheory`. Every geometric headline is identified in the docstring with its missing carriers. Native schemes, ordinary cycles, complexes, Dold–Kan and linear Hodge structures do not make those headlines statable by a few simple definitions. No scalar substitute, free predicate, assumed regulator or sorry'd carrier was introduced.

**Moved from Lean to README:** nothing. The package already separated all construction targets, APIs and Checks into the README. No statable headline was found missing from the acceptance module.

For the mechanical signature audit I stripped comments, inventoried every declaration, and prepared the scratch signature file with `#check @name` for every inventoried name. The inventory and the resulting list of checks are both empty. The targeted build elaborated that entire declaration-free content once. Thus there are zero elaborated declaration signatures to compare and no hypotheses or binders changed.

Both actual library checkouts match the manifest: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Pinned source | Native declaration and boundary of the input |
| --- | --- |
| Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean line 44 | AlgebraicGeometry.AlgebraicCycle has body `Function.locallyFinsupp X R`; it contains no dimension or face-admissibility condition. |
| Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean line 69 | AlgebraicGeometry.AlgebraicCycle.map requires QuasiCompact and explicit weights; its coefficients use residue degrees. Properness for descent to higher Chow groups is additional. |
| Mathlib/AlgebraicGeometry/Scheme.lean line 40 | AlgebraicGeometry.Scheme extends LocallyRingedSpace with local_affine; separatedness, finite type, regularity and nonemptiness are not fields. |
| Mathlib/Algebra/Category/ModuleCat/Basic.lean line 56 | ModuleCat bundles an additive commutative group and an R-module, with R a ring. |
| Mathlib/Algebra/Homology/HomologicalComplex.lean line 59 and line 72 | HomologicalComplex and d_comp_d provide actual shaped square-zero complexes. |
| Mathlib/Algebra/Homology/DerivedCategory/Basic.lean line 87 | DerivedCategory is localization of integer cochain complexes at quasi-isomorphisms, not an enhanced diagram category. |
| Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean line 57, line 261 and line 269 | CochainComplex.mappingCone, mappingCone.inl_v_d and mappingCone.inr_f_d give the source-shift-first cone and the two differential components. |
| Mathlib/AlgebraicTopology/DoldKan/Equivalence.lean line 167 | CategoryTheory.Abelian.DoldKan.equivalence is `SimplicialObject A ≌ ChainComplex A ℕ`, with A abelian. |
| TauCeti/Algebra/Homology/GradedCochainComplex.lean line 59 | TauCeti.gradedCochainComplex takes graded submodules, a homogeneous linear endomorphism and a square-zero proof. |
| TauCeti/Geometry/Hodge/Structure.lean line 62; TauCeti/Geometry/Hodge/Morphism.lean line 69 | HodgeStructureOn uses opposed filtrations; IsMorphism requires both conjugation compatibility and filtration preservation. |
| TauCeti/Geometry/Hodge/Tate/Basic.lean line 91, line 100 and line 111 | tate, tate_F and tate_piece have type (−p,−p); this abstract lattice marking is distinct from the geometric factor (2πi)ᵖ. |
| TauCeti/Geometry/Hodge/Mixed/Basic.lean line 72; TauCeti/Geometry/Hodge/Mixed/Strictness.lean line 110 | MixedHodgeStructure and Hom.range_inf_F_eq_map_F provide linear mixed data and strictness for actual morphisms. |
| TauCeti/Geometry/Manifold/ContMDiffMap/WeakWhitney.lean line 87 | weakWhitneyJet differentiates an existing smooth map. It does not extend arbitrary closed-set jets or prove the real-analytic flat-ideal sum. |

## Ownership sweep and supplier replacements

The object searches covered main, Completed, the indexed open roadmap heads, all board package READMEs and design READMEs, and both library pins. They included higher Chow/Bloch cycles, mixed and cubical cycles, supported and multi-relative scheme K-theory, universal motivic Chern classes, real Deligne complexes and characters, logarithmic Dolbeault algebras, singular-support semipurity, Whitney jets and flat ideals. Narrow follow-up searches avoided the roadmap service's result cap. I also directly searched both files in all 30 specified sibling roadmap folders, with no unavailable folder.

The 30 direct sibling checks were HabiroNumberFields, HabiroCohomologyFoundationsPartII, BorelRegulators, SolidAnalyticRings, K2SymbolsBrauerPartII, K3BlochGroups, HabiroCohomologyFoundations, HabiroNahmSeries, HabiroRings, Polylogarithms, HeegnerPointEulerSystems, OverconvergentAutomorphicForms, ProbabilisticAndMetricNumberTheory, MultiquadraticPartII, PolynomialGaloisGroupsPartII, ArithmeticKTheory, ArithmeticDirichletSeriesPartII, ComputationalNumberTheory, ConformalMappingPartII, EffectiveClassNumbers, AbelianSchemesAndArithmeticModuliPartII, GanGrossPrasadUnitaryGroups, SelmerIwasawaCohomologyPartII, QSeriesPartitionsAndMockModularForms, K3SurfacesAndSymplecticBoundedness, CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers and ArithmeticDynamics. Deligne–Serre lifting and Weil–Deligne parameters found in arithmetic folders are different objects.

No additional mathematical target was deleted during this port. Scope and ownership retains all existing exclusions: the shared simplicial cycles and tower belong to KTheoryFiniteLocalFields; ordinary intersections to SchemeAndStackFoundations; generic scheme K and degree-zero characters to SchemeKTheoryOperations; motive adapters to MotivesAndAlgebraicCycles; ordinary comparisons/current calculus to ComplexComparisonPartII; linear Hodge theory to Completed/HodgeStructures. No Tau Ceti import replacement is necessary because the Lean module has no declarations.

The accepted ownership decisions are preserved: §2.0a owns the general supported multi-relative cube construction; §§3–4 and 7.1 own general Deligne realization; §§5–6 own the shared auxiliary complexes and abstract supported regulator. Their consumer specializations do not supply prerequisites back to this roadmap. No declaration can collide with another roadmap's fully qualified name because this acceptance namespace has no declarations.

The open-head sweep confirms the accepted review's companion-edit qualifications: ColemanIntegration §L3.Fa.2 still constructs the cube interface, SchemeKTheoryOperations' downstream paragraph still points there, Polylogarithms §5.2 still constructs shared auxiliary/support objects, and BorelRegulators §6.0a still constructs general Deligne objects. This report does not claim those external edits happened. Their outgoing import obligations are recorded in Scope and ownership and Downstream consumers. The old MotivicEtaleKTheory section labels in Polylogarithms are consumer citation repairs, outside this port. The ZagierConjecturePolylogarithms M.8 and MixedHodgeModulesAndIrregularHodgeTheory N/logarithmic-filtration consumer references were checked in their design READMEs.

## Final reviewer pass and changes

I reread the complete roadmap, including its conventions, all targets/APIs/Checks, the seven dependency summaries, consumers and references, against the unchanged acceptance docstring.

1. Corrected §2.3's localization-boundary locator from GeneralAlgebraicKTheory §§7.5–7.7 to §§8.12–8.13. The former sections concern products, units and transfers; the latter contain the DVR sign and right-module suspension law. Added §§8.12–8.13 to that target's Needs and the Layer 2 dependency summary.
2. Replaced §2.3's flat-pullback API citation of GeneralAlgebraicKTheory §§7.5–7.7 with SchemeKTheoryOperations §§2.2, 3.1–3.3, the actual scheme pullback/support interface. The Levine94 locators and the regular versus smooth domains are retained.
3. Replaced the References paragraph's reference to a nonexistent target-folder sources.toml with a self-contained description of the versioned bibliography. All twelve references, legal links, exact mathematical locators and accepted access qualifications remain in the README; the source package's sources.toml is unchanged.

No theorem, definition, hypothesis or computed Check needed a mathematical change. The accepted review has zero non-blocking package findings; its source errata are already reflected by the correct degree −1 associator homotopy, smooth scope where required, and consistent twist/support indices. The two announced analytic supplier contracts remain unchanged.

## Source verification and limits

The source locators retain the package's extraction identifiers and printed pagination, not the different line numbers assigned by the web renderer. Readable primary-source checks included Levine94 line 1101 and line 1223 (regular relative cycles and the cube splitting proof), Levine94 line 1405 (regular supported comparison), BFT line 961 (two axis quasi-isomorphisms), BF line 905 and line 961 (comparison and universal-class route), Burgos94 line 316, line 337, line 345 and line 379 (closed jets, flat ideals and local estimates), BKK line 4395 and line 4450 (normalized currents), DeligneHodgeII line 1142 and line 1242 (shifted weights and independence), MVW line 5827 (perfect-field comparison), KLM line 553 (logarithm), and the WeibelKBook references carried by the diagonal supplier. The regular cube argument uses coordinate projections and support enlargement; it does not assume regularity survives algebraic closure over an imperfect field. Source checks preserve the distinction between a theorem header and a step inside its proof.

The web extraction loses some scanned display glyphs in Burgos94 and Levine94. Screenshot requests did not provide a reliable display-level completion, so no new certification of those missing glyphs is claimed. Bloch86 §7 remains explicitly uncertified for the arbitrary-field universal Chern construction and its inverse identification. Beilinson85 remains an uncertified historical reference; Levine98 remains a waived chapter-level background reference. No source passage was copied. Public Mathlib/Zulip discovery searches gave no new usable carrier or API to replace the pinned audit; they are not evidence of global absence.

No suspicious instruction to execute fetched code, disclose credentials, contact a service or edit another roadmap was adopted.

## Adversarial mathematics pass

The following are my instantiated calculations, not proofs of the general results. P denotes a point, h the positive hyperplane class, L_ℓ=𝔽_ℓ(t)[s]/(s^ℓ−t), and φ(x)=exp(−1/x²), extended by 0 at 0. The table has 152 rows. Each row records values on the stated models or both sides of an identity. All arithmetic, signs and verdicts were evaluated for this port; the previous review's verdict was not used as a computation.

| Statement | Instances tried | Computed values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Universe and component conventions | Empty scheme; P⊔ℙ¹ | 0 components; CH⁰=ℤ², CH¹=0⊕ℤ | Pass; a scalar rank loses the pair | None |
| Motivic reindexing | (p,a)=(0,1),(1,1) | 2p−a=−1,1; groups 0,k× | Pass; no natural subtraction | None |
| Derived coefficients | ℤ/2⊗ᴸℤ/2; R=0 | [ℤ/2 --0→ ℤ/2] has H⁻¹=H⁰=ℤ/2; zero coefficients give 0 | Pass | None |
| Cube orientation | n=0,1,2; Γ_t | J=1,−1,1; ∂Γ_t=[0], δΓ_t=−[0] | Pass | None |
| Mixed convention | (n,m)=(1,1) | Two cross coefficients −1,+1; sum 0 | Pass over ℤ, including char 2 | None |
| Shift and fiber conventions | 0→ℝ[0]; A[1] | Fiber H¹=ℝ; A[1]⁻¹=A⁰ | Pass; shifts point in opposite directions | None |
| Boundary convention | d(Γ_t,0) | ([0],t); raw[t]=−[0], −raw[t]=+[0]=B[t] | Pass | Corrected supplier locator |
| Tate axes and cone arrow | p=−1,0,1; log 3 | Axes iℝ,ℝ,iℝ; quotient Re(log 3)=log 3 | Pass; 2πi≠0 | None |
| Critical differential convention | x=z z̄ | ∂∂̄x=dz∧dz̄; d_Dx=−2dz∧dz̄ | Pass | None |
| Orientation convention | One loop; ordered two disks | Period 2πi; ordered residues +1, swapped −1 | Pass | None |
| Total product convention | (n,s)=(1,1),(0,1),(1,2) | (−1)ⁿˢ=−1,+1,+1 | Pass | None |
| Logarithmic product convention | log 3 and log|t| | i log 3 darg t; period 2πi log 3 | Pass | None |
| Whitney extension contract | Taylor coefficients 1,1,2 | Derivatives (1,1,4), realized by 1+x+2x² | Pass | Conditional contract retained |
| Parametric Borel contract | ∂ₓᵐf(0,y)=(m!)²sin y; m=2,y=π/2 | Prescribed derivative 4; coefficients n! have derivative (n!)² and radius 0 | Pass; analytic extension insufficient | Conditional contract retained |
| Whitney endpoints and nonuniqueness | A=∅,A=U; zero jet at 0 | 0 constraints; original f; 0 and φ have equal jets but values 0,e⁻¹ at 1 | Pass; no uniqueness asserted | None |
| Flat-ideal sum contract | A=B={0}; A=∅,B=U; A=B=U | I=I+I; C∞=C∞+0; 0=0+0 | Pass in both inclusions on these cases | Conditional contract retained |
| Flat sum versus intersection | Coordinate axes; φ(x)+φ(y) | All origin jets 0; value at (0,1)=e⁻¹, whereas intersection-ideal functions vanish there | Pass; distinguishes wrong ideal | None |
| 1.1 cubical definition | P,p=0,n=0,1,2 | Raw groups ℤ,ℤ,ℤ; infinity normalization ℤ,0,0 | Pass | None |
| 1.1 normalization API | Constant cube in degree 1 | Infinity map 1↦1; kernel 0 equals degeneracy quotient ℤ/ℤ | Pass | None |
| 1.1 pushforward and pullback | ℙ¹→P; inseparable degree 2 field extension | Fundamental one-cycle pushes to 0; restriction/transfer on CH⁰ is 1↦1↦2 | Pass; weights and lengths matter | None |
| 1.1 J chain and product API | Degrees 1+1,1+2 | J₂=1=(−1)(−1); J₃=−1=(−1)(1); J₀∂=δJ₁=∂ | Pass | None |
| 1.1 native coefficient API | Reduced point, double point, p=−1 | Same generator group ℤ; coefficients 1,2; negative-codimension group 0 | Pass | None |
| 1.2 mixed definition | Total degrees 0,2 | 1 and 3 summands; d² cross term −T+T=0 | Pass | None |
| 1.2 axes API | Degree-zero cycle 3[V] | Both axis maps give coefficient 3 | Pass; neither zero nor doubled | None |
| 1.2 total universal property | Components 2,3,5 into ℤ | Sum image 10; all-zero components give 0 | Pass | None |
| 1.2 transport API | (n,m)=(1,0),(0,1),(1,1) | Multipliers −1,+1,−1 | Pass; total-degree sign would change simplex axis | None |
| 1.3 absolute comparison | P over 𝔽₂, p=0 | Both H₀=ℤ, Hₙ=0 for n>0; generator 1↦1 | Pass integrally | None |
| 1.3 support comparison | Z=∅,X | Both fibers 0; both full-support fibers C | Pass | None |
| 1.3 coefficient comparison | Mod-2 two-term resolution; R=0 | Both derived groups ℤ/2 in degrees −1,0; both zero for R=0 | Pass | None |
| 1.4 direct operations | 𝔽₂(t)/𝔽₂(t²) | Transfer after restriction gives 2 on both models | Pass; inseparability retained | None |
| 1.4 products and smooth pullback | Degrees (1,1),(0,1); P⊔ℙ¹ | Exchange signs −1,+1; CH¹=0⊕ℤ on both models | Pass | None |
| 1.4 support transport | Identity; square-zero point | Identity coefficient 1; reduced/thickened cycle groups ℤ,ℤ | Pass; no K nil-invariance inferred | None |
| 2.0a supported cube definition | n=0; S=Y or ∅ | K₀(k)=ℤ, rank-three class 3; empty support group 0 | Pass | None |
| 2.0a generalized weights | T=[[2,1],[0,2]] | (T−2)e₂=e₁≠0; (T−2)²=0; generalized dimension 2 versus eigen dimension 1 | Pass; distinction essential on opens | None |
| 2.0a integral Adams domain | k=ℚ; stable η on rank 1 | η·1=[−1]≠0; ψ²[−1]=0, while η·ψ²(1)=[−1] | Pass; pointed map is not a spectrum endomorphism | None |
| 2.0a relative-cycle quotient | V=Spec L_ℓ,D=∅,c=0 | Generator 1; a constant cycle vanishing at 1 has coefficient 0 at 0 | Pass; quotient remains ℚ after rationalization | None |
| 2.0a support-local map | V=𝔸¹,W={0},c=1 | Supported cycle 1↦[O₀]=1; forgetting support gives 1−1=0 | Pass; support cannot be discarded | None |
| 2.0a relative-cycle theorem | Spec L₂ and Spec L₃ | CH⁰⊗ℚ=ℚ=K₀^(0); 1↦1 for each | Pass on regular nonsmooth bases | None |
| 2.0a relative normalization | Cube point s over L_ℓ | [s]∈K₁(L_ℓ)⊗ℚ has s-adic valuation +1, versus 0 for zero map and −1 for inverse | Pass | None |
| 2.0a split-cover condition | z=t/(t−1); z,1−z | z+(1−z)=1; surviving face values 1 and 0 have constant retractions | Pass | None |
| 2.0a moving/incidence condition | Interior point W; W={z=0} | Interior W misses both faces; face-contained W has codim 1 in V but 0 in the face | Pass; second W excluded | None |
| 2.0a support-forgetting API | n=0; ∅⊂X | Source 0 maps to 0 in K₀(X); full-support rank 3 remains 3 | Pass | None |
| 2.0a common-base pairing API | Unit loops u,v over ℤ_(2),ℤ_(3) | ψ² product=4{u,v}=(2[u])(2[v]); ψ¹ multiplier 1 | Pass at both primes | None |
| 2.0a external-pairing domain | ℤ[i] self-product over ℤ | v(v+2i)=0; local dimension 1, cotangent dimension 2 at residue 𝔽₂ | Pass; singular product excluded | None |
| 2.0a coordinate map coherence | Identity; two projections on constant rank 3 | Both composite restrictions have rank 3; empty-support restriction is 0 | Pass | None |
| 2.0a ordered relativity API | n=1; face ranks (1,0),(0,1),(1,1) | Differences +1,−1,0; K₀(relative)=K₁(base) | Pass over ℚ,ℤ₂,ℤ₃ | None |
| 2.0a double-loop orientation | {u,v} over ℚ(u,v) | Consecutive last-slot residues +1; swapped coordinates −1; ψ² factor 4 | Pass | None |
| 2.0a open-cube scope | Remove t=2 over ℤ₃ | Trivial-line face ranks (1,1), difference 0; no full-cube delooping claimed | Pass | None |
| 2.0a rational decomposition | K₀(ℙ²),h³=0 | ψ²h=2h−h²; ψ²(2h+h²)=2(2h+h²); eigenlattice determinant 2 | Pass; integral direct sum fails | None |
| 2.0b universal Chern definition | Zero class; unit 3 | c₀,₀(0)=1, ch(0)=0; v₃(c₁,₁[3])=1 | Pass; higher map nonzero | None |
| 2.0b finite-field branch | 𝔾_m over 𝔽₂ | v_t(c₁,₁[t])=1; # (𝔸¹∖{0,1})(𝔽₂)=0 | Pass; no rational specialization available there | None |
| 2.0b stabilization/naturality API | O(1)⊕O(−1) on ℙ² | Total Chern 1−h²; c₂=−h² versus sum of individual c₂ values 0 | Pass; cₚ,₀ not additive | None |
| 2.0b diagonal API | n=1,2,3 | (−1)ⁿ⁻¹(n−1)!=1,−1,2 | Pass | None |
| 2.0b Newton character API | Same diagonal degrees | Factors 1,−1,1/2 compose with 1,−1,2 to give 1,1,1 | Pass; denominators 1,1,2 nonzero in ℚ | None |
| 2.1 geometric map definition | P; O_point on ℙ¹ | 3↦[k³]=3; point cycle↦1−[O(−1)] with Euler characteristic 1 | Pass | None |
| 2.1 additive/natural API | O(1)+O(−1); unit 3 | Character 2; positive-degree valuation 1 | Pass; distinguishes zero higher map | None |
| 2.1 components and emptiness | ∅; two points, ranks (3,1) | Groups 0; component output (3,1), not scalar 4 | Pass | None |
| 2.2 comparison and weights | Weights 0,1,2; a=2 | Eigenvalues 1,2,4; finite projector denominators −1,−3,−2 | Pass; no division by zero | None |
| 2.2 Adams identity | Unit 3; rank 3; a=1,2 | ψ²[3]=2[3], ch₁ multiplier 2; rank multiplier 1; ψ¹ multiplier 1 | Pass | None |
| 2.2 finite character | O(±1) on ℙ¹; two points | 1±h; sum 2; rank output (3,1) | Pass | None |
| 2.2 rationality | O(1) on ℙ² | ch₂=h²/2≠0; c₂=0 | Pass; integral character excluded | None |
| 2.2 universal-class equality API | O_point; unit 3 | Both give h; both degree-one valuations 1 | Pass on instances; general source qualification retained | None |
| 2.2 degree-two normalization | {3,t} | Last-slot residue [3] has v₃=1; native B gives −[3], v₃=−1; degree-two adapter restores +1 | Pass | None |
| 2.3 restriction-fiber definition | Z=∅,X | H(fib(id))=0; H(fib(M→0))=H(M) | Pass | None |
| 2.3 regular nonsmooth scope | L₂/k and L₃/k | dim=embdim=0; dim Ω¹=1; ε≠0 with ε²=0 or ε³=0 in self-base-change | Pass; not smooth | None |
| 2.3 supported and full comparisons | Spec L_ℓ; 𝔸¹_L supported at 0 | Both full groups ℚ,1↦1; both weight-one support groups ℚ,[0]↦[O₀]=1 | Pass for ℓ=2,3 | None |
| 2.3 singular support | V(xy)⊂𝔸² | Two leading coefficients (1,1); the crossing has no regular local ring | Pass; K(Z) not substituted | None |
| 2.3 flat-pullback API | Spec L_ℓ→Spec k | Cycle 1↦1; [k]↦[L_ℓ] of rank 1 | Pass | Corrected scheme supplier citation |
| 2.3 composition and enlargement API | {0}⊂{0,1}; identity | 1↦(1,0); identity 1↦1; direct/composite inclusions equal | Pass | None |
| 2.3 boundary dictionary API | Uniformizer u; {3,u} | B[u]=+1, raw[u]=−1; degree-two factors −1 turn −[3] into +[3] | Pass in characteristics 2 and 3 as well | Corrected boundary locator |
| 2.4 product theorem | Bundles ranks 3,4 | ch₀(E×F)=12=3·4; unit rank 1 fixes each component | Pass | None |
| 2.4 ordinary character agreement | O(a),O_point on ℙ¹ | ch=1+ah; ch(O_point)=1−(1−h)=h | Pass | None |
| 2.4 leading class may vanish | {0}⊂𝔸¹ | K₀ class 1−1=0; Chow class div(t)=0 | Pass; leading equality is 0=0 | None |
| 2.4 higher Newton coefficient | p=1,2,3 | 1,−1,1/2; ch₂,₂=−c₂,₂ | Pass | None |
| 2.4 internal product | ξ=1−O(−1) on ℙ¹ | ξ²=0; ch(ξ)²=h²=0 | Pass | None |
| 3.1 logarithmic algebra definition | z↦2z; boundary empty | Log changes by log 4; dlog changes by 0; empty boundary recovers smooth forms | Pass; chart change stays in image algebra | None |
| 3.1 differential API | log|z|² and z z̄ | dlog=dz/z+dz̄/z̄; ∂∂̄x=dz∧dz̄, ∂̄∂x=−dz∧dz̄ | Pass; anticommutator 0 | None |
| 3.1 pullback API | z² then z³; identity | dlog multipliers 2·3=6 and 1; composite z⁶ also gives 6 | Pass | None |
| 3.1 inclusion/unit API | W=∅; logarithmic f | All degrees 0; actual inclusion sends 1·f to f | Pass; no extra abstract kernel | None |
| 3.1 growth and orientation | z=e⁻ᴺ; loop and two disks | log|z|²=−2N versus |z|⁻²=e²ᴺ; period 2πi, residues ±1 | Pass; arbitrary poles excluded | None |
| 3.2 filtered comparison | P; 𝔾_m | Point weight 0; dlog residue level 1 plus degree 1 gives weight 2,type (1,1) | Pass | None |
| 3.2 refinement and degeneration | Boundary blowup compactifying 𝔾_m² | Betti dimensions (1,2,1) unchanged; boundary count 4→5 | Pass; no invariant residue E₁ diagram asserted | None |
| 3.2 monomial-division estimate API | exp(−1/|z|²)/z²; 1/z² | Flat quotient has zero jets and value e⁻¹ at 1; nonflat quotient diverges at 0 | Pass; flatness essential | None |
| 3.2 logarithmic-power estimate API | f log|z|²/(z w̄), f=exp(−1/|zw|²) | Axis jets 0; at (−2,1), value −e⁻¹ᐟ⁴ log 4/2; zero exponents give f | Pass | None |
| 3.3 Deligne cone/small definition | P,p=0,1,−1 | (H⁰,H¹)=(ℝ,0),(0,ℝ),(ℝ(−1),0) in both models | Pass; all twists retained | None |
| 3.3 retract API | P,p=1; log 3+iθ; A=0 | Projection-inclusion fixes r; reverse gives log 3, difference iθ a boundary; zero model 0 | Pass; homotopy versus equality distinguished | None |
| 3.3 naturality/sums/shift API | Two points; shift A[1] of point | H¹=ℝ²; unique shifted line has degree −1, so no integral r with 2r=−1 | Pass; shift applies to cochain comparison | None |
| 3.3 exactness API | Split ℝ→ℝ²→ℝ in type (0,0),p=1 | H¹ dimensions 1,2,1; a↦(a,0), (a,b)↦b; kernel=image | Pass | None |
| 3.3 critical-degree API | p=1,x=z z̄; x=1 | −2dz∧dz̄ and 0; ordinary degrees 0→2 | Pass | None |
| 3.3 arrow transport | z=3+4i,p=1,2,3 | Raw coordinates 3,4i,3; negation −3,−4i,−3; transported quotient restores originals | Pass | None |
| 3.4 geometric colimit definition | 𝔸¹,p=1; Re z | H¹=ℝ of constants; Re z values 0,1 but has pole growth at infinity | Pass; analytic sheafification would be wrong | None |
| 3.4 refinement/cocycle API | Torus boundary blowup x=e,y=eu | Pullback log|x|=log|e|; at (2,3), both log 2, not log 3 | Pass | None |
| 3.4 coherent pullback API | Power maps 2 then 3; identity | Loop-period multipliers 6 and 1, matching composites | Pass | None |
| 3.4 descent/disjoint-union API | Cover P by P,P; ∅; P⊔ℙ¹ | Equalizer diagonal ℝ; zero object; H⁰=ℝ² | Pass | None |
| 3.4 sheafified colimit/skeleton API | Two identical point choices | Compatible values (r,r) induce r from either choice | Pass; no unproved equality of section spaces | None |
| 3.4 product comparison | Ordered torus periods | dlog periods (2πi,0),(0,2πi); product (2πi)² on both choices | Pass | None |
| 4.1 low/low product definition | x=log 3,y=log|t|,p=q=1 | Product i log 3 darg t; swapped negative | Pass | None |
| 4.1 low/high below cutoff | Point x=log 3 at (a,p)=(1,1),y=4 at (b,q)=(0,0) | Type projection gives 4log 3 | Pass | None |
| 4.1 low/high above cutoff | x=log|z| at (1,1), y=i at (0,−1) | l=1≥0; r₁(x)y=−darg z; correction type (−1,1) is 0 | Pass; negative twist matters | None |
| 4.1 high/high branch | Weight-zero point constants 3,4 | Product 12 | Pass | None |
| 4.1 Leibniz/symmetry API | x=|z|²,y=1,p=q=1 | Product −z̄dz+z dz̄; differential −2dz∧dz̄ on both sides | Pass | None |
| 4.1 conditional unit/naturality API | tℝ[t]→ℝ[t] | coeff_t(et)=0 for every source e; coeff_t(1·t)=1 in target | Pass; nonunital source retained | None |
| 4.1 critical four-term API | Point log 3,log 5; log 3,log|t| | Point product 0; curve product i log 3 darg t | Pass including unclosed x=|z|² above | None |
| 4.2 associator homotopy | Weight-zero Re z,3,4 | Both bracketings 12Re z, value 12 at z=1; h=0 though dx≠0 | Pass; degree of h is −1 | None |
| 4.2 associative cohomology | Constants 3,4,5; three t factors | Both bracketings 60; both polynomial products t³ | Pass without source identity | None |
| 4.2 refinement compatibility | Two torus loops | Product periods (2πi)², swapped −(2πi)² before/after blowup | Pass | None |
| 5.1 support-fiber definition | Empty/full support; 0→ℝ[0] | 0; original complex; H¹=ℝ | Pass | None |
| 5.1 support-enlargement API | {0}⊂{0,1} | r↦(r,0); direct/composite equal | Pass; arrow direction fixed | None |
| 5.1 localization/excision API | Graph t; disjoint point supports | Raw class [(0,t)]=−[0]; separate coefficients (r,s) give union support | Pass | None |
| 5.1 support-product API | x=0 and x=1 in 𝔸² | Support intersection ∅; product class 0 | Pass | None |
| 5.1 pair-coordinate API | Pair (ω,g) | d² second coordinate=res(dω)−d(resω−dg)=0; cocycle iff dω=0,resω=dg | Pass in both directions | None |
| 5.2 singular semipurity | Axes and cusp in 𝔸²,p=1 | H²=ℝ² and ℝ; cycle coordinates (1,1) and 1; lower groups 0 | Pass | None |
| 5.2 Betti/type API | Origin in 𝔸²,p=1,2 | H² support 0; H⁴=ℝ with oriented coefficient 1,type (2,2) | Pass | None |
| 5.2 multiplicity/zero API | V(x),2V(x),zero cycle | Coordinates 1,2,0; class zero iff coefficient 0 | Pass in both directions | None |
| 5.2 current criterion and divisor API | f=t,d=p=1 | Form factor (2πi)⁻¹, point factor 1; d_D[−log|t|]=−δ₀; pair class +1 | Pass; opposite g gives −1 | None |
| 5.2 endpoint/codimension control | p=0,Z=X; P,p=1,Z=P | H⁰=ℝ per component; H¹(P,ℝ(1))=ℝ≠0 below 2 | Pass; codimension condition essential | None |
| 5.2 supported intersection witness | V(x)·V(y); double first divisor | Local lengths 1,2; Deligne coordinates 1,2 | Pass | None |
| 5.3 support-family definition | Supports {0},{1}; empty | Union {0,1}; coefficients (2,3) after inclusions, empty contribution 0 | Pass; directed union | None |
| 5.3 total-complex definitions | (r,n)=(2p,1),(2p−1,1) | Total degrees 2p−1,2p−2; cube signs +1,−1 | Pass | None |
| 5.3 cycle-class API | Origin; double origin | Cycle and supported-class coefficients 1,2 | Pass | None |
| 5.3 projection API | Top degree r=2p,cube degree n | Source degree 2p−n; Hₚ[−2p] degree also 2p−n | Pass | None |
| 5.3 forget-support/constant-cube API | P,p=0 | Constant generator 1↦1; positive normalized constant columns 0 | Pass | None |
| 5.3 colimit universal-property API | Representatives at {0},{1} | Both yield union coordinates (2,3); differing first coefficients 2 and 4 remain unequal | Pass; equality needs common support | None |
| 5.3 good truncation | Re(z₁)dz₂∧dz̄₂,p=1 | dω(∂ₓ₁,∂ₓ₂,∂ᵧ₂)=−2i≠0 | Pass; brutal truncation would add a cocycle | None |
| 5.3 J transport | n=1 | J₀∂=∂=(−∂)(−1)=δJ₁; form differential commutes with −1 | Pass | None |
| 5.4 cycle resolution | Origin at n=0,p=1 | Coefficient map 1↦1,2↦2; both top groups ℝ | Pass | None |
| 5.4 affine contraction | P→𝔸¹,p=0,1 | H⁰_D=ℝ,H¹_D=ℝ respectively on both sides; positive normalized cohomology 0 | Pass | None |
| 5.4 diagram/product compatibility | n=s=1; n=0 or s=2 | Total signs −1,+1,+1; unchanged by identical restriction | Pass | None |
| 6.1 regulator roof definition | P,p=n=0; integral rank 3 | Cycle 3 maps through class/forget-support/constant maps to 3∈ℝ | Pass; fixes nonzero scale | None |
| 6.1 lift-independence API | Lift of class 2; zero class | Supported/forgotten images both 2; zero lift gives 0 | Pass | None |
| 6.1 integral-source API | Units −1,i; rank 3 | Torsion regulators log 1=0; integral rank maps to 3 | Pass; no rational-only source | None |
| 6.1 geometric-class API | O(1),O(−1) on ℙ¹ | Normalized integrals +1,−1; raw periods ±2πi | Pass | None |
| 6.2 restriction-fiber theorem | Z=∅,X; identity | Zero map; absolute regulator; identity homotopy h=0 | Pass | None |
| 6.2 fiber-map API | A=A′=ℤ[0],B=0,B′=(ℤ --1→ ℤ),r=f′=h=1 | Correct (1,1) has differential (0,0); wrong (1,−1) gives (0,2) | Pass; plus h sign essential | None |
| 6.2 localization compatibility | t on punctured affine line | r(t)=log|t|; raw boundary −1; negative Green pair +1 | Pass; same adapter as 2.3 | None |
| 6.3 smooth-pullback theorem | Point→ℙ¹ applied to O(1) | CH¹(P)=0; H²_D(P,ℝ(1))=0 | Pass; raw support-containing cycle pullback not asserted | None |
| 6.3 compatible embeddings | Unit 3,ℚ→ℝ→ℂ and ℚ→ℂ | Both values log 3 | Pass | None |
| 6.3 cycle-model independence | Degrees n=0,1,2 | Axis degree-zero coefficient 1; J multipliers 1,−1,1 on source and target | Pass | None |
| 7.1 independent character | u=3eⁱθ and i | Re(log u)=log 3; Re(log i)=0; adding 2πi gives change 0 | Pass | None |
| 7.1 additive/product API | Zero class; ranks 3,4 | Images 0,3,4; tensor image 12=3·4 | Pass | None |
| 7.1 geometric agreement API | O(a) on ℙ¹ | Character 1+a h_D; normalized first-Chern integral a | Pass | None |
| 7.1 quotient normalization | z=3+4i,p=1,2,3 | πₚ₋₁ values 3,4i,3; adding ℝ(p) changes each by 0 | Pass; wrong parity does not descend | None |
| 7.1 Dold–Kan domain | Constant ℤ; constant S₃ | π₀=H₀=ℤ,positive groups 0; S₃ has nonabelian π₀ of order 6 | Pass; abelian comparison not extended to S₃ | None |
| 7.2 Beilinson identification | Rank 3; O_point on ℙ¹ | Both maps 3; both leading divisor classes h_D of normalized integral 1 | Pass on instances | None |
| 7.2 higher-degree identification | Unit 3; unit −1; weight 2 | Both log 3; both 0; Newton coefficient −1 on both sides | Pass on instances | None |
| 7.2 relative identification | Full/empty support; (𝔸¹,{0}) | Absolute/zero maps; raw logarithm boundary −1 on both sides | Pass | None |
| 7.3 integral product theorem | Units 3,t on 𝔾_m | Both sides i log 3 darg t; swapped negative; periods ±2πi log 3 | Pass | None |
| 7.3 unit/zero products | Weight-zero 1; zero/empty factor; point units 3,5 | Preserved class; 0; 0; degree-two regulator 0 | Pass | None |
| 7.3 geometric product | Rulings on ℙ¹×ℙ¹; double first ruling | Intersection and Deligne integrals 1,2 | Pass | None |
| 7.4 logarithm witness | u=2,v=3; 1,i,1/2 | log 6=log 2+log 3; values 0,0,−log 2 | Pass | None |
| 7.4 two-unit formula | f=3,g=t | i log 3 darg t; period 2πi log 3, reversed −2πi log 3 | Pass; factor i fixes Tate axis | None |
| 7.4 projective/Green witness | a=−1,0,1; f=tᵃ | Chern integrals −1,0,1; −a log|t| has divisor coordinate a | Pass; open unit logarithm has opposite sign | None |

## Unresolved matters retained from acceptance

- The supplier extensions `smooth-whitney-extension` and `flat-ideal-regular-situation` remain the two accepted conditional contracts for DifferentialGeometry, Part II: Whitney jets and flat functions. Their exact statements and three discriminating Checks each remain in the README. No nonexistent main theorem is asserted to discharge them.
- The outgoing companion edits in BorelRegulators, ColemanIntegration/SchemeKTheoryOperations and Polylogarithms remain outside this folder and this commit. No reverse dependency was added.
- Bloch86, Beilinson85 and Levine98 keep the source-access qualifications above; missing scanned display glyphs were not silently reconstructed as source evidence.
- No new mathematical, Lean elaboration, citation-resolution or dependency-order defect remains in this port. The clean-tree gate result is recorded above.


Pull request: #1470 (roadmap/motivic-etale-k-theory at 9bcd1b6)
