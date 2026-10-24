<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1047#issuecomment-6379893390 -->
Red team round 1 pass a (codex) of 1064583

Verdict: needs_changes

1. **F01** (P1) Integral Adams operations do not act on the K-spectrum diagram

   **Location:** packages/MotivicEtaleKTheory/README.md:200–202: “supported perfect K-spectra” followed by “Construct compatible Adams operations ψᵃ, a≥1, on this entire diagram and its total fiber”.

   **Claim:** The ordinary integral Adams operations lift to endomorphisms of the supported K-spectrum diagram, including its absolute vertex at n=0.

   **Witness:** At X=Spec ℚ, η·1=[−1]≠0 in K₁(ℚ). A spectrum map fixing 1 must fix η·1, but ψ²[−1]=[1]=0. WeibelKBook line 15979 identifies η with [−1]; Levine94 line 655–705 uses spaces/groups.

   **Exact repair text:** “Keep the supported K-spectra and their total-fiber pairings. Construct integral Adams operations on the associated pointed K-space diagrams and their homotopy fibers, using the supplied unstable operations and coherent restriction maps. All integral Adams identities below concern these pointed spaces and their nonnegative homotopy groups; no integral spectrum endomorphism is asserted. Construct spectrum-level Adams operations only after rationalization.” Apply this distinction also to the scope, relativity and downstream-contract sentences. Retain every prime and every integer a≥1.

   **Repair test:** At Spec ℚ the pointed operation fixes the rank-one component and sends the loop [−1] to 0 without requiring compatibility with stable η. After tensoring with ℚ, [−1]=0, so the spectral obstruction vanishes. The ordinary integral groups and their spectrum pairings remain available.

2. **F02** (P2) The leading structure-sheaf component need not be nonzero

   **Location:** packages/MotivicEtaleKTheory/README.md:311: “the first nonzero component of ch(O_V) is [V] in weight c”.

   **Claim:** Every integral codimension-c closed subvariety has a nonzero weight-c character component.

   **Witness:** Take V={0}⊂𝔸¹_k. The resolution 0→O --t→ O→O_V→0 gives [O_V]=0 in K₀(𝔸¹), and [V]=0 in CH¹(𝔸¹). Every character component is zero.

   **Exact repair text:** “For an integral codimension-c closed V⊂X, ch_j(O_V)=0 for j<c and ch_c(O_V)=[V]; this class may also vanish.” Add the Check: “For {0}⊂𝔸¹, both [O_{0}] in K₀ and [{0}] in CH¹ vanish, so the formula does not assert a nonzero component.”

   **Repair test:** The affine-line instance becomes 0=0; the existing projective-line instance still gives the nonzero class h with coefficient +1.

## Verified sound

Read all 736 lines of packages/MotivicEtaleKTheory/README.md and all 52 lines of packages/MotivicEtaleKTheory/Suggested.lean, together with the repository README.md and CONTRIBUTING.md. Coverage: **0 Lean declarations; 27 numbered primary targets; 50 API bullets; 91 inventory rows including conventions and embedded constructions; 115 Check bullets computed; 90 explicit source-line anchors located in seven available cited works; 19 named pinned declarations inspected; 12 direct roadmap supplier contracts and 5 consumer contracts resolved; 28 specifically supplied sibling folders searched by object.** The locator count does not certify illegible displays or the three settled unread references described below.

The computed instances support the retained regular/non-smooth comparison scope, componentwise grading, integral coefficients including the zero ring, inseparable transfers, cube and mixed-complex signs, pair-fiber suspension, positive valuation adapter, Tate parity, critical differential, shifted geometric weights, singular-support semipurity, current normalization and restriction-homotopy sign. Neither R01 nor R02 is a previously settled external-ownership finding.

The inspected head is 1064583686e6fc7de5bd3c3c648d490a62c5b3c1. The read-only comparison with origin/main lists seven changed files, all in packages/MotivicEtaleKTheory: README.md, Suggested.lean, metadata.toml, sources.toml and three pre-existing reports. No out-of-folder change appears. The acceptance file has one import, its prescribed namespace and module docstring, and no declarations, examples, assumptions, options, placeholder predicates or admitted data. No computational algorithm or process reference was found in the target README or Lean file. The review wrote only this report and scratch notes; the target README, Lean file, manifest, design and merge order were unchanged.

### Lean declaration/context and headline audit

| File portion | Declarations | Section variables / instances / universes retained by declarations | Result |
| --- | --- | --- | --- |
| Suggested.lean:1–52 | 0 definitions, instances, theorems, axioms or examples | None: import, module docstring and namespace only | No dropped binder, duplicate fully qualified declaration or padding candidate. There are no names for a scratch `#check @name` audit. |

The following are the deep acceptance statements identified in the README. All are named in the module docstring; the missing carriers were searched by object at the pins. Ordinary complexes, cycle functions and linear Hodge structures do not supply them. Defining these geometric theories would exceed the permitted few simple definitions, so no statable omitted headline was established.

| Headline sections | Missing carrier at the pins | Suggested.lean locator |
| --- | --- | --- |
| 1.3–1.4 integral model comparison and operations | Face-admissible higher-cycle complexes and shared higher Chow theory | 9–10 |
| 2.0a ordered relativity and Adams-compatible pairings | Supported scheme K-theory face diagrams, operations and their comparisons | 11–13; R01 also needs the spectrum/space distinction in this description |
| 2.0b universal integral motivic Chern operations | Higher scheme K-groups and universal classifying-sheaf motivic classes | 14–15 |
| 2.1–2.4 rational higher/support comparison and products | Higher cycle and supported K carriers and geometric comparison maps | 16–20 |
| 3.2 geometric bifiltered comparison and mixed Hodge data | Geometric logarithmic sheaves, residue filtration and realization | 21–23 |
| 3.3 small Deligne model and deformation retract | Real Dolbeault complex and constructed Deligne functor | 24–26 |
| 3.4 compactification-independent realization | SNC compactification diagrams and filtered logarithmic realization | 27–28 |
| 4.1–4.2 product and associativity homotopy | Deligne complexes and their Dolbeault product | 29–31 |
| 5.2 singular-support semipurity/current criterion | Geometric supported Deligne groups and current comparison | 32–33 |
| 5.4 supported cycle resolution and affine contraction | Incidence-support diagrams and auxiliary logarithmic complexes | 34–35 |
| 6.1–6.3 derived regulator and coherent naturality | Geometric motivic/Deligne restriction diagrams and realization | 36–38 |
| 7.1–7.2 independently normalized character and equality | Actual higher K-groups and independently constructed universal maps | 39–41 |
| 7.3 integral-source multiplicativity | Integral higher Chow groups, Deligne groups and regulator | 42–43 |

The flat-function estimates and §7.4 evaluations are supporting targets/Checks, not replacements for these headline theorems. They do not justify adding scalar or boundary-case padding to Suggested.lean.

### Supplier and ownership audit

Main was inspected at 6f49035bfffd3beed70feb15cf2f01db30a471be. Open suppliers were resolved with the roadmap service at its recorded heads, while the 28 explicitly supplied sibling checkouts were searched directly. The service's citation resolver found no missing cross-roadmap citation or roadmap Lean name. Its separate warning that it lacked pinned Lake packages was not used as a library check: the supplied pinned trees were inspected directly.

| Supplier contract | Verifiable current locator | Scope and instance comparison |
| --- | --- | --- |
| GeneralAlgebraicKTheory | TauCetiRoadmap/GeneralAlgebraicKTheory/README.md:627,795,827,925,1333,1623,1651,1669,1687,1938,1950 | All cited model, resolution, pairing and boundary sections exist. §§8.12–8.13 give B[π]=1 and degree-two last-slot adapter −B; on {2,t}, native B=−[2], adapted value +[2]. |
| SchemeKTheoryOperations | TauCetiRoadmap/SchemeKTheoryOperations/README.md:577,1627,1979,2031,2078,2225,2254,2280 | Perfect/support models, pointed operations, regular ample-family weights and degree-zero character are supplied. Line 2095 explicitly avoids integral spectrum-level Adams maps: the drift in this package is R01. Line 2276 gives a leading class, not nonvanishing: R02. |
| KTheoryFiniteLocalFields | TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:478,480,501,1468,1472 | `motivicCycles`, `motivicToK`, `diagonalChernMilnor` exist at the named sections. Arbitrary fields, integral moving/transfer, derived coefficients and diagonal coefficients 1,−1,2 match. No finite-coefficient étale theorem is rebuilt here. |
| MotivesAndAlgebraicCycles | TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:675,690,710,813,858,872 | §§4.7–4.8 import the same cycles; §4.8a supplies specialization. Perfect-field/resolution restrictions remain on the motive adapters, not the arbitrary-field cycle comparison. |
| SchemeAndStackFoundations | TauCetiRoadmap/SchemeAndStackFoundations/README.md:3265,3309,5613,6075,6567,6653,6701,6721,6768,6921,6987,7107 | Site cohomology, Chow domination, SNC data and ordinary intersection/Chern targets exist. The point/line Chow values and transverse intersection multiplicities 1,2 use these owners. |
| ResolutionOfSingularitiesCharacteristicZero | TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md:672,682,692,708,718,728,758,770,786,802 | Resolution preserves the stated open and initial boundary. Projectivity is confined to quasi-projective inputs. The general smooth separated case also uses Nagata compactification, rather than assuming projectivity. |
| EtaleCohomologyFoundations | TauCetiRoadmap/EtaleCohomologyFoundations/README.md:57,105,139 | G.1–G.3 provide compactification objects, existence and finite-diagram common refinements/coherent comparison. Identity refinement acts as 1 on point cohomology. |
| ComplexComparisonPartII | TauCetiRoadmap/ComplexComparisonPartII/README.md:699,856,2337,2895,2974,2994,3018,3401,3743,3850,3990 | Analytification, adapted charts, currents, proper Hodge theory and stratification exist. `properPureHodge` permits nonprojective proper schemes. `regularSingularDeRhamComparison` excludes positive integral residues, and the trivial residue 0 is allowed. The native current order and the package's reversed test-form order agree in the even degrees asserted. |
| EnhancedDerivedSheaves | TauCetiRoadmap/EnhancedDerivedSheaves/README.md:259,429,441,455,492,580,2293 | Enhanced categories, replacements, derived tensor, coherent maps, dg nerve and hypercover descent exist. Point-site module specialization and 0→ℝ[0] give the stated degree-one fiber. |
| DifferentialGeometry | TauCetiRoadmap/DifferentialGeometry/README.md:268,311,503,782,806,816,862 | Forms, integration, de Rham and duality are supplied. The two Whitney/flat-ideal extensions are declared gaps, not falsely claimed exports of these layers. |
| ComplexKahlerGeometry | TauCetiRoadmap/ComplexKahlerGeometry/README.md:96,193; TauCetiRoadmap/ComplexManifolds/README.md:172,197 | K1–K2 retain finite-dimensional Hausdorff second-countable hypotheses and the shared complex orientation. The local dz∧dz̄ and positive-circle signs agree with this package. |
| AlgebraicTopology | TauCetiRoadmap/AlgebraicTopology/README.md:1602,1667 | Stage 8 item 2 includes simplicial-group Kan and abelian Moore/homotopy comparison through degree zero. Constant ℤ has π₀=ℤ; constant S₃ has nonabelian π₀ and is excluded from the abelian comparison. Stages 2–3 and 6 supply the cited relative/cohomology infrastructure. |

Completed/HodgeStructures is the existing linear owner. Its Tate and mixed-Hodge claims are compared with the actual pinned Tau Ceti declarations below; no new linear Hodge library is proposed here.

The two gap slugs in packages/MotivicEtaleKTheory/design/plan.json agree with the contracts at README:83 and :91. Their common supplier is DifferentialGeometry, Part II: Whitney jets and flat functions. The Whitney extension includes the stated closed-set, finite-dimensional target and transverse-parameter hypotheses; the ideal identity restricts to relatively closed real-analytic subsets. Searches found no existing infinite-order closed-jet extension or this flat-ideal sum theorem at the pins or in an earlier roadmap. These are precise owned extension contracts; acceptance of their consumers remains conditional on them.

The object searches covered main, Completed, the board's packages and all 28 supplied sibling folders, including BorelRegulators, SolidAnalyticRings, K2SymbolsBrauerPartII, K3BlochGroups, all three supplied Habiro folders, Polylogarithms, HeegnerPointEulerSystems, OverconvergentAutomorphicForms, ProbabilisticAndMetricNumberTheory, MultiquadraticPartII, PolynomialGaloisGroupsPartII, ArithmeticKTheory, ArithmeticDirichletSeriesPartII, ComputationalNumberTheory, ConformalMappingPartII, EffectiveClassNumbers, AbelianSchemesAndArithmeticModuliPartII, GanGrossPrasadUnitaryGroups, SelmerIwasawaCohomologyPartII, QSeriesPartitionsAndMockModularForms, K3SurfacesAndSymplecticBoundedness, CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers and ArithmeticDynamics. The roadmap-service object searches were also used to locate the directly cited open suppliers. This is not a claim to have read every unrelated sibling target.

The remaining BorelRegulators §6.0a, ColemanIntegration §§L3.Fa.1–L3.Fa.2, SchemeKTheoryOperations and Polylogarithms §5.2 ownership overlap is the external work already settled in packages/MotivicEtaleKTheory/reports/FIX-PKG-MotivicEtaleKTheory~2.md:7–15. Those dispositions remain applicable and are not re-raised. The present package records movement of the general Deligne/universal character, multi-relative cube and shared auxiliary-support constructions to this earlier owner. It imports the earlier generic K/cycle/manifold theories and leaves the later explicit-current, arithmetic, syntomic and de Jeu constructions with their consumers. No new ownership move is required by this pass.

The five downstream contracts were resolved: the three preceding consumers, ZagierConjecturePolylogarithms' M.8 request in packages/ZagierConjecturePolylogarithms/design/plan.json, and the zero-function logarithmic specialization in packages/MixedHodgeModulesAndIrregularHodgeTheory/design/plan.json. The latter two are design contracts, not consumed suppliers. Polylogarithms' old layer labels have an explicit translation at README:717–721; its J₁=−1 agrees with this package. Borel's opposite cone arrow requires negating the third coordinate and transporting the quotient identification, as the package's Check computes.

### Pinned declarations

Mathlib pin: 6b7abb3c7686292736be2955bd3eb9ebf63b456a. Tau Ceti pin: a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Both agree with lake-manifest.json.

| Native declaration(s) | Pinned file locator | What was actually supplied |
| --- | --- | --- |
| AlgebraicGeometry.AlgebraicCycle; AlgebraicCycle.map | Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44,69 | Locally finitely supported point coefficients, no dimension/admissibility predicate; map uses quasi-compactness, weights and residue degrees. Double-point multiplicity 2 remains distinct from generator 1. |
| AlgebraicGeometry.Scheme; ModuleCat | Mathlib/AlgebraicGeometry/Scheme.lean:40; Mathlib/Algebra/Category/ModuleCat/Basic.lean:56 | Native schemes and module category, not higher-cycle or K objects. |
| HomologicalComplex; HomologicalComplex.d_comp_d | Mathlib/Algebra/Homology/HomologicalComplex.lean:59,72 | Differential squares to zero; supplies no regulator construction. |
| CategoryTheory.DerivedCategory | Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87 | Localization of integer cochain complexes, not the enhanced diagram calculus. |
| CochainComplex.mappingCone; mappingCone.inl_v_d; mappingCone.inr_f_d | Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean:57,261,269 | Source-shift-first cone differential; coordinate transport gives d(a,b)=(da,f(a)−db). |
| CategoryTheory.Abelian.DoldKan.equivalence | Mathlib/AlgebraicTopology/DoldKan/Equivalence.lean:167 | Simplicial objects and natural chain complexes in an abelian category, not a nonabelian Moore complex. |
| TauCeti.gradedCochainComplex | TauCeti/Algebra/Homology/GradedCochainComplex.lean:59 | Actual graded submodule and square-zero degree-one endomorphism. |
| TauCeti.Hodge.HodgeStructureOn; HodgeStructureOn.IsMorphism | TauCeti/Geometry/Hodge/Structure.lean:62; TauCeti/Geometry/Hodge/Morphism.lean:69 | Linear Hodge data with conjugation and filtration compatibility. |
| TauCeti.Hodge.tate; tate_F; tate_piece | TauCeti/Geometry/Hodge/Tate/Basic.lean:91,100,111 | Hodge type (−p,−p); native lattice is the ordinary inclusion, so the geometric factor (2πi)^p must be specified separately. |
| TauCeti.Hodge.MixedHodgeStructure; MixedHodgeStructure.Hom.range_inf_F_eq_map_F | TauCeti/Geometry/Hodge/Mixed/Basic.lean:72; TauCeti/Geometry/Hodge/Mixed/Strictness.lean:110 | Actual rational/complex mixed structures and strictness for their morphisms; no geometric logarithmic complex is included. |

### Sources and dependency direction

| Work | Explicit line anchors inspected | Certification of their use |
| --- | --- | --- |
| BF | 319,381,506,508,517,530,550,610,661,705,720,741,746,753,766,827,862,877,905,919,934,948,961,974,998,1033,1440,1539,1619 | Normalization, auxiliary complexes, roof and complex-field comparison checked in the cited v1. Smooth quasi-projective scope is taken from the proof, not the overbroad Theorem 3.5 header. |
| BFT | 63,180,266,277,296,943,948,961 | Cubical/mixed comparison and projective explicit-current scope checked in the cited v1; package does not infer its full smooth regulator scope from the projective theorem. |
| Levine94 | 407,539,625,655,695,711,719,739,777,1006,1015,1101,1197,1210,1223,1399,1405,1424,1767,1794,2226 | Regular infinite-field relative theorem retains splitting/moving hypotheses; arbitrary-field regular supported theorem and smooth product/pullback scopes distinguished. Operations are on K-spaces/groups: R01. Some extracted diagrams are incomplete. |
| Burgos94 | 102,155,181,316,337,345,358,379 | Theorem/section locations and prose verified; several displayed formulas are absent in the extraction. The real-analytic closed-set condition at line 358 is readable. |
| BKK | 3965,3999,4035,4056,4060,4121,4129,4142,4176,4217,4239,4263,4297,4315,4395,4450,4795,4841 | Cone/retract, four product ranges, compactification comparison and normalized current criterion checked against the cited v2. The principal-divisor pair has coefficient +1. |
| DeligneHodgeII | 852,1044,1142,1147,1242 | Proper Hodge input, shifted cohomological weights and refinement conclusion checked; also read the adjoining 866,988,1223 passages. No invariance of the unshifted residue filtration is inferred. |
| KLM | 553 | Degree-one logarithm locator is §5.3, printed p.13 of the cited v1. |

WeibelKBook is an additional review-only witness for R01: Charles A. Weibel, *The K-book*, author copy dated 29 August 2013, IV Exercise 1.12(a),(c),(e), WeibelKBook line 15979, 15984 and 15995. It was fetched through the prescribed source service from the [author's Rutgers page](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), not a mirror. The package manifest was left untouched under the read-only instruction. The source identifies stable η with [−1] and the stable action with K-theory multiplication; this makes the obstruction independent of the package's own wording.

The dependency checker was run without editing the README or order. Its final output was:

```text
depcheck: 29 roadmaps, 262 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line was emitted. An earlier run reported 261 edges and the same zero-problem verdict; the target README was unchanged between runs. Layer-level routes in this package point to earlier targets; the smooth universal-class identification is separated from the regular supported construction. The downstream consumer paragraphs are not supplier edges.

### Computed target inventory

All line numbers below are in packages/MotivicEtaleKTheory/README.md. Calculations test instances; they do not constitute proofs of the general targets. P denotes a field point, h the hyperplane class, and L=𝔽_ℓ(t)[s]/(s^ℓ−t), ℓ=2 or 3. Realization examples use the specified complex embedding.

| Statement and line | Context / instances | Values on the two sides | Result / change |
| --- | --- | --- | --- |
| Convention: universes and components, 17 | Empty scheme; P⊔ℙ¹ | 0 summands; CH⁰=ℤ⊕ℤ, CH¹=0⊕ℤ | Component convention retains both ranks; no numerical universe restriction. |
| Convention: grading/coefficient change, 19 | p=0,a=1; p=a=1; R=0; derived ℤ/2 reduction | Degrees −1,1 give 0,k×; zero coefficient gives 0; Tor₁ and tensor both ℤ/2 | No natural-subtraction or underived-tensor substitution. |
| Convention: cube/mixed signs, 21 | n=0,1,2; bidegree (1,1) | J=1,−1,1; ∂Γ_t=+[0], δΓ_t=−[0]; mixed cross sum −1+1=0 | Consistent. |
| Convention: fiber and residues, 23 | 0→ℝ[0]; Γ_t; {2,t} | H¹(fiber)=ℝ; raw(t)=−[0], −raw(t)=+[0]; B{2,t}=−[2], last-slot adapter gives +[2] | Consistent. |
| Convention: Tate and critical operator, 25 | Point p=−1,0,1; z z̄ | H⁰ at p≤0 is ℝ(p), H¹ at p=1 is ℝ; −2∂∂̄(z z̄)=−2dz∧dz̄ | Consistent. |
| Convention: orientation/products, 27 | Two circles; n=s=1; log2,log absolute t | Residues +1 then −1 on exchange; product sign −1; period 2πi log2 | Consistent. |
| Whitney gap, 83 | A={0}; transverse coefficient at m=2,y=π/2 | Coefficients 1,1,2 give jets 1,1,4; prescribed transverse value 4; two zero jets can have values 0,e⁻¹ at 1 | Precise existence contract, no uniqueness; declared twice. |
| Flat-ideal gap, 91 | A=∅,B=U; coordinate axes | C∞=C∞+0; φ(x)+φ(y) has zero origin jet and value e⁻¹ at (0,1) | Sum, not intersection; declared twice. |
| 1.1 normalized cubical cycles, 119 | P,p=0,n=0,1,2; dual point | Raw groups ℤ,ℤ,ℤ; infinity kernels ℤ,0,0; reduced generator 1 versus scheme cycle 2 | Normalization and multiplicities distinguish models. |
| 1.2 mixed complex, 142 | Total degrees 0,2; bidegree(1,1) | 1 and 3 summands; cross coefficient sum 0 | Consistent. |
| 1.3 integral comparison, 162 | P/𝔽₂,p=0; empty/full supports; R=0 | Both axes have H₀=ℤ,Hₙ>₀=0; fibers 0 and C; coefficient zero map 0→0 | No bad-prime or support exception found. |
| 1.4 operation compatibility, 176 | Purely inseparable extension degree2; odd factors | Both transfer composites multiply CH⁰ by2; swapped product multiplier −1 | Integral, arbitrary-field examples agree. |
| 2.0a supported cube spectra/Adams, 200 | n=0,X=Specℚ; a=2 | Stable η·1=[−1]≠0 but ψ²[−1]=0; stable ψ² would give [−1] | R01: distinguish pointed-space operations from spectrum maps. |
| 2.0a relative-cycle quotient, 204 | D empty,V=Spec L,c=0; W a face of a line,c=1 | CH⁰=ℤ→K₀=ℤ sends1→1; face-contained W has codimension0 inside face and is excluded | Relative homotopy relations and incidence domain agree. |
| 2.0a support-local cycle isomorphism, 204 | V=𝔸¹_L,W={0},D empty,c=1 | Raw cycles ℤ; rational K₀ with support weight1=ℚ;1→[O₀] | Local coefficient +1; no quotient by global rational equivalence. |
| 2.0b universal motivic classes, 229 | Zero class; unit2; O(1) on ℙ² | c₀,₀(0)=1,ch(0)=0; c₁,₁[2]=[2]; c₂(O(1))=0 versus ch₂=h²/2 | Chern and character separated. |
| 2.1 total character, 247 | P; P⊔P; ∅ | Rank2→2; (2,1)→(2,1);0→0 | Finite sums preserve components. |
| 2.2 weights/isomorphism, 266 | Weights0,1,2; unit2 | ψ² eigenvalues1,2,4; character of unit2 has valuation1 | Rational denominators nonzero; unit weight1. |
| 2.2 universal-class identification, 270 | O_point on ℙ¹; {2,t} | Both leading values h; both ordered product residues +[2] under last-slot adapter | Tests degree0 and positive-degree normalization. |
| 2.3 supported comparison, 288 | Spec L full support; 𝔸¹_L,{0}; empty support | ℚ→ℚ sends1→1; support divisor1→[O₀];0→0 | Regular nonsmooth examples retained. |
| 2.3 boundary dictionary, 292 | Γ_t on 𝔸¹ | d(Γ_t,0)=([0],t); raw(t)=−[0] while B[t]=+[O₀] | Minus-raw formula correct. |
| 2.4 products and leading term, 311 | Ranks2,3; O₀ on 𝔸¹; O_point on ℙ¹ | ch₀ product6=2·3; affine O₀=0 and [0]=0; projective leading term h≠0 | Product consistent; R02 removes asserted nonvanishing. |
| 3.1 logarithmic algebra, 336 | Punctured disk; empty boundary; empty variety | d log absolute z squared=dz/z+dz̄/z̄; period2πi; smooth algebra /0 | Log poles without arbitrary abs(z)⁻² coefficient functions. |
| 3.2 bifiltered comparison/MHS, 357 | 𝔾_m and 𝔾_m²; boundary blowup | H¹ dimension1,type(1,1),weight2; torus dimensions1,2,1 on either compactification | Shifted weight verified; no unshifted W invariance. |
| 3.2 flat estimates, 359 | f=e^(−1/abs(z)²), exponents2; f=1 | All jets of f/z² vanish, value e⁻¹ at1;1/z diverges at0 | Flatness essential. |
| 3.3 Deligne cone/small model, 379 | Point twists−1,0,1,2,3; A=0 | H⁰=ℝ(−1),ℝ for first two; H¹ quotient axesℝ,iℝ,ℝ for positive twists;0 gives0 | Degree shift, parity and real marking consistent. |
| 3.4 compactification independence, 402 | 𝔾_m² boundary blowup; P⊔ℙ¹ | Period matrix diag(2πi,2πi) in both; H_D⁰=ℝ² | F-filtered, not unshifted W-filtered, invariance. |
| 4.1 product, 433 | Low/low log2,log absolute t; mixed x=log absolute t,y=i in D⁰(−,−1); high/high2,3 | i log2 darg t; −darg t with zero correction type;6 | All four stated ranges, including a negative twist, tested. |
| 4.2 associator, 454 | Weight-zero Re z,2,3; t in tℝ[t] | Bracketings6Re z,6Re z; h=0 on even critical inputs; t³=t³ | No closedness or unit assumption needed for these identities. |
| 5.1 supported fiber, 478 | Empty/full supports;0→ℝ[0] | Contractible / original complex; H¹=ℝ | Coordinate shift correct. |
| 5.2 semipurity, 500 | Axes and cusp in𝔸²,p=1; origin,p=1,2 | H²=ℝ² andℝ; origin H²(weight1)=0,H⁴(weight2)=ℝ | Singular and excess-codimension cases agree. |
| 5.2 current iff, 500 | t,t²,1 on𝔸¹ | d_D[−log absolute f]=−δ₀,−2δ₀,0; pair cycle coordinates1,2,0 | Both directions reduce to the coefficient basis; opposite logarithm negates coefficient. |
| 5.3 auxiliary complexes, 522 | (r,n)=(2p,1),(2p−1,1);p=0 point | Total degrees2p−1,2p−2 with cube signs+1,−1; normalized point ℝ only in degree0 | Good truncation and shift retained. |
| 5.4 resolutions/contraction, 544 | Origin,double origin; P→𝔸¹,p=0,1 | Class coefficients1,2; H_D⁰(weight0)=ℝ and H_D¹(weight1)=ℝ on both | Support projection and affine contraction pass the instances. |
| 6.1 specified regulator roof, 568 | Point rank m; unit torsion; O(±1) | m→m;−1,i→0; normalized periods±1 | Specified arrows fix scalar/sign. |
| 6.2 supported coherence, 588 | Identity restriction; nonzero homotopy example | h=0 gives diagonal map; h=1 sends1→(1,1), differential(0,0); wrong sign gives(0,2) | Plus-h fiber formula correct. |
| 6.3 pullbacks/models, 606 | Point→ℙ¹; ℚ→ℝ→ℂ at2; cube degrees1,2 | c₁ pullback0=Deligne pullback0; log2=log2; J=−1,+1 | Coherent embedding and orientation transport pass. |
| 7.1 independent character, 630 | 2e^(iθ); O(a); zero class | log2 independent ofθ;1+a h_D;0 | Branch invariance and normalization agree. |
| 7.2 comparison, 653 | Rank2; unit2; point divisor onℙ¹ | Both characters2; both log2; both h_D of normalized degree1 | Computed instances consistent. |
| 7.3 integral multiplicativity, 667 | Units2,t; ruling divisors; empty factor | Period2πi log2; point multiplicity1;0 | Signs and integral multiplicity agree. |
| 7.4 acceptance witnesses, 681 | 1,i,2,1/2; t^a; O(a),a=−1,0,1 | Log values0,0,log2,−log2; negative Green gives coefficienta; Chern degrees−1,0,1 | No normalization discrepancy. |

| API statement and line | Instances | Computed values on both sides | Result / change |
| --- | --- | --- | --- |
| 1.1 normalization quotient,125 | Constant degree-one cube | ker(id:ℤ→ℤ)=0=ℤ/ℤ | Consistent. |
| 1.1 proper/flat maps,126 | ℙ¹→P; inseparable degree2 point map | Push fundamental1-cycle→0; restriction/transfer1→2 | Dimension-drop and length retained. |
| 1.1 orientation map,127 | n,m=1,1 and1,2 | J₂=1=(−1)(−1);J₃=−1=(−1)(1) | Chain/product signs agree. |
| 1.1 native cycle inclusion,128 | Double point; raw constant cube | Native coefficient2 distinct from1; normalized projector of degenerate cube0 | No second cycle carrier. |
| 1.2 axes,148 | Degree-zero3[V] | i□(3[V])=3[V]=iΔ(3[V]) | Consistent. |
| 1.2 total maps,149 | Degree2 components2,3,5 | Sum image10; zero components image0 | Direct-sum universal property. |
| 1.2 J transport,150 | Bidegrees(1,0),(0,1),(1,1) | Multipliers−1,+1,−1 | Simplex direction preserved. |
| 2.0a relative-cycle map,208 | Field with D empty,c=0 |1↦1; zero endpoint relation maps0 | Consistent under stated splitting assumptions. |
| 2.0a boundary n=0/support,209 | Field full/empty support | K₀=ℤ /0; rank2→2 | Consistent. |
| 2.0a pullbacks/pairings,210 | Unit loops overℤ_(2),ℤ_(3);ℤ[i] external square | ψ² product4{u,v}=2[u]·2[v]; external square dim1,embedding dim2 | Pairing domain correct; spectral Adams wording R01. |
| 2.0a ordered relativity,211 | Full cube n=1,2 | Difference(1,0)=1,(0,1)=−1; two-loop exchange−1 | Space-level Adams and spectral equivalence must be distinguished, R01. |
| 2.0b stabilization/naturality,233 | O(1)⊕O(−1) | c=(1+h)(1−h)=1−h²; adding trivial line leaves c | Consistent. |
| 2.0b diagonal,234 | Milnor degrees1,2,3 | Coefficients1,−1,2 | Agrees with supplier. |
| 2.0b Newton character,235 | Positive degree weights1,2,3 | Factors1,−1,1/2; composite with diagonal1,1,1 | Rational division nonzero. |
| 2.1 summand projection,253 | O(1) onℙ² | Components1,h,h²/2; projection p=2 returns h²/2 | Consistent. |
| 2.2 inverse identification,274 | Unit2 and point onℙ¹ | Both inverses give valuation1 and leading h | Consistent on examples. |
| 2.3 flat pullback,296 | L/k degreeℓ,p=n=0; identity |1↦1 by flat pullback on both sides; transfer backℓ;id1=1 | Inseparability allowed. |
| 2.3 connecting comparison,297 | t | B[t]=+[O₀],raw[t]=−[0] | Suspension dictionary necessary and consistent. |
| 3.1 operators,342 | log absolute z squared | ∂=dz/z,∂̄=dz̄/z̄; both second mixed derivatives0 off0 | Types/conjugation correct. |
| 3.1 pullbacks,343 | z=t² on punctured line | Pullback dz/z=2dt/t; log absolute z squared=2log absolute t squared | Native differential/product laws agree. |
| 3.1 inclusion/unit,344 | Empty divisor;constant1;empty variety | Image1=1,d1=0;empty algebra0 | No arbitrary forms admitted. |
| 3.2 division estimate,363 | e^(−1/abs(z)²)/z² | Zero jet at0; value e⁻¹ at1 | Smooth nonzero extension. |
| 3.2 combined estimate,364 | f=e^(−1/abs(zw)²), log absolute z squared/(z w̄) | At(−2,1):−e^(−1/4)log4/2; axes jets0 | Denominator/conjugation checked. |
| 3.3 retract/naturality,385 | Point p=1,z=log2+iθ | Projection/inclusion yields log2 versus original log2+iθ; on small model identity | Homotopy, not literal inverse on cone. |
| 3.3 exactness/quasi-isomorphism,386 | Split type-(0,0) sequence0→ℝ→ℝ²→ℝ→0 | At p=1, same exact sequence of H¹ lines; acyclic identity cone gives0 | Consistent. |
| 3.3 critical differential,387 | p=1,x=abs(z)² | Degree1→2 but ordinary forms0→2; value−2dz∧dz̄ | Correct jump/sign. |
| 3.4 refinements,408 | Identity; torus boundary blowup | H⁰ id=1; dlog period2πi stays2πi | Marked comparison. |
| 3.4 pullbacks,409 | t↦t² on𝔾_m | dlog t↦2dlog t; two compositions multiply by4 | Coherent functoriality test. |
| 3.4 descent,410 | Repeated identity cover{X,X} | Čech degree0 kernel diagonalℝ, difference cokernel0; empty value0 | Descent normalization correct. |
| 3.4 sheaf/colimit property,411 | Point and duplicate representatives | Two copies of scalar3 identified to3, not independent pair(3,3) | Change of skeleton comparison respects cocone. |
| 4.1 Leibniz/symmetry,439 | abs(z)²,1 in degree1,weight1 | Product−z̄dz+z dz̄; d_D product−2dz∧dz̄ equals RHS; swapped product negative | Consistent. |
| 4.1 unit/naturality,440 | tℝ[t]⊂ℝ[t] | coeff_t(e t)=0 for all e in source; coeff_t(1·t)=1 in target | Unit hypothesis essential. |
| 4.1 four-term formula,441 | log2,log absolute t | i log2 darg t; on point both derivative terms0 | Consistent. |
| 5.1 enlargement,484 | {0}⊂{0,1} | r↦(r,0); forgetting to affine H² gives0 | Direction correct. |
| 5.1 raw connection/excision,485 | t on𝔾_m;0→ℝ[0] | Raw class−[0]; generator1 goes to H¹ fiber1 | Connecting sign fixed. |
| 5.1 products,486 | Disjoint divisors; transverse axes | Empty-support product0; axes product origin coefficient1 | Intersection support, not union. |
| 5.1 cocycle coordinates,487 | Formal pair(ω,g) | d² second coordinate res(dω)−d resω+d²g=0 | Both equations necessary. |
| 5.2 Betti support,506 | Normal disks complex dim1,2 | Relative Betti groupsℝ in degrees2,4; lower0 | Top types(1,1),(2,2). |
| 5.2 coefficients,507 | Crossing divisor with coefficients2,−3 | Class coordinates(2,−3);zero iff pair(0,0) | Independence/zero detection pass. |
| 5.2 principal divisor,508 | t,t²,constant1 | Negative-log pairs have coordinates1,2,0 | Sign consistent. |
| 5.3 cycle map,528 | Origin,double origin |1→1,2→2 in supported line | Multiplicity retained. |
| 5.3 projection shift,529 | p=1,n=1 | Source degree2−1=1; H_p[−2] degree1 term is H_p^(−1) | Shift matches. |
| 5.3 forgetting/constant cubes,530 | Point p=0 | Constant1→1; positive normalized columns0 | Consistent. |
| 5.3 colimit,531 | Supports{0},{1},empty | Coefficients2,3 become(2,3) on union; empty contributes0 | Common-support equality test. |
| 6.1 lifts,574 | Point rank2;two lifts differing by boundary | First component2 gives class2; boundary difference0 in cohomology | Consistent. |
| 6.1 integral source,575 | Torsion units−1,i;rank1 | Torsion images0,0;rank image1 | Not a zero-map stand-in. |
| 6.1 ordinary cycles,576 | O(±1) onℙ¹ | Normalized integrals±1 | Matches supplied geometric class. |
| 6.2 homotopy fiber map,594 | h=1 between complexes in Check599 |1↦(1,1),differential0;wrong sign differential2 | Full sign witness. |
| 7.1 additivity/product/naturality,636 | Unit2·3; trivial rank1;zero | log6=log2+log3;1 preserves products;zero maps0 | Group and unit distinctions consistent. |
| 7.1 exponential/geometric comparison,637 | u=i;log branch2πi;O(a) | Re log i=0;branch difference maps0;normalized c₁ degreea | Consistent. |

### Computed README Checks

Each row identifies a Check by its README line. “Consistent” means the displayed instance agrees with the claimed formula, not that the general theorem has been proved. The two supplier-gap rows remain conditional on their declared extension theorems.

| Check line | Instance and computed values on both sides | Result |
| --- | --- | --- |
| 87 | Jet entries from coefficients 1,1,2 are 1,1,4; n! coefficients give derivatives (n!)², with radius 0. | Consistent; extension is the declared gap. |
| 88 | m=2,y=π/2 gives (2!)²sin(π/2)=4. | Consistent; parameter extension is the declared gap. |
| 89 | Empty A has no prescribed entries; full A gives f=f; zero jets of 0 and exp(−1/x²) agree, but values at 1 are 0 and e⁻¹. | Consistent; no uniqueness. |
| 95 | Both flat-ideal sums contain φ; its origin jet is 0 and φ(1)=e⁻¹, unlike an analytic zero jet. | Consistent. |
| 96 | Empty/full sets give C∞=C∞+0 and 0=0+0. | Consistent. |
| 97 | φ(x)+φ(y) has origin jet 0 and value e⁻¹ at (0,1); membership in both ideals would force that value to 0. | Consistent. |
| 132 | Zero face of Γ_t is [0], infinity face 0; ∂ gives +[0] and δ gives −[0]. | Consistent. |
| 133 | At a point the raw cube groups are ℤ; each infinity face is identity, so normalized degrees 0,1,2 are ℤ,0,0. | Consistent. |
| 134 | Reduced point generator is 1; length of k[ε]/ε² is 2, giving cycle 2. | Consistent. |
| 135 | J₀,J₁,J₂=1,−1,1; two square routes have coefficients +1,−1, sum 0 in ℤ also over 𝔽₂. | Consistent. |
| 136 | Negative codimension point group 0; dimension-dropping pushforward of [ℙ¹] is 0. | Consistent. |
| 154 | Mixed (1,1) cross coefficients are −1,+1, sum 0. | Consistent. |
| 155 | Both axis maps send generator 1 to 1; total degrees 0 and 2 have 1 and 3 summands. | Consistent. |
| 156 | Correct J factors are −1,+1,−1; total-degree sign would give −1,−1,+1. | Consistent. |
| 168 | Point p=0: each model has H₀=ℤ and H₁=H₂=0; generator image 1. | Consistent. |
| 169 | Empty support gives fib(id), with H=0; full support gives fib(C→0), with H=H(C). | Consistent. |
| 170 | Mod-2 differential in a free resolution is 0; derived tensor has ℤ/2 in degrees −1 and 0; tensor with zero is 0. | Consistent. |
| 182 | Inseparable restriction is 1↦1, proper transfer 1↦2, composite 2. | Consistent. |
| 183 | Point⊔ℙ¹ gives CH¹=0⊕ℤ and CH⁰=ℤ⊕ℤ. | Consistent. |
| 184 | Thickened point still has one integral generator; identity coefficient +1; exchange signs in degrees (1,1),(0,1) are −1,+1. | Consistent. |
| 215 | Full support at a field: [k²]=2 in ℤ; empty support 0; a projective point has leading coefficient +1. | Consistent; this does not assert nonvanishing. |
| 216 | Ordered difference gives 1,−1,0 on (1,0),(0,1),(1,1); ψ²[2]=[4]=2[2]. | Consistent for pointed/group operations; R01 concerns the spectrum claim. |
| 217 | Four face intersections give Ω²K; successive last-slot residues of {u,v} give +1, swapped order −1; ψ² multiplier 4. | Consistent for pointed/group operations. |
| 218 | At p=2,3, K₁(ℤ_p)=ℤ_p× and face differences are +1,−1; removing t=2 over ℤ₃ leaves face ranks (1,1). | Consistent. |
| 219 | ψ²h=2h−h², ψ²h²=4h²; eigenbasis columns (1,0,0),(0,2,1),(0,0,1) have determinant 2. | Consistent; rationalization needed. |
| 220 | Ramified external square has dimension 1 and cotangent dimension 2; same-base cube is regular; ψ² symbol multiplier 4=2·2. | Consistent at primes 2 and 3. |
| 221 | Spec L is regular of dimension 0 but Ω¹_L/k=L ds; both weight-zero comparison groups ℚ and 1↦1. | Consistent for ℓ=2,3. |
| 222 | L=𝔽_ℓ(s), s-adic valuation v(s)=1; the point cycle has relative trivialization ratio s. | Consistent. |
| 223 | z+(1−z)=1; face W has codimension 1 in V and 0 in itself, violating required codimension 1 there. | Consistent exclusion. |
| 239 | v₂(c₁,₁[2])=v₂(2)=1; at zero class Chern components are (1,0,0,…) while character components all vanish. | Consistent. |
| 240 | On ℙ², c₂(O(1))=0, ch₂=h²/2; for opposite lines c₂=−h² and ch₂=h². | Consistent. |
| 241 | Milnor coefficients 1,−1,2 times Newton factors 1,−1,1/2 give 1,1,1. | Consistent; only rational character divides by 2. |
| 257 | Rank-two field bundle has character (2,0,0,…). | Consistent. |
| 258 | On ℙ¹, (1+h)+(1−h)=2, while (1+h)(1−h)=1 since h²=0. | Consistent. |
| 259 | Empty source and target 0; two components retain (2,1), distinct from 3. | Consistent. |
| 260 | v₂(ch₁,₁[2])=1, while the zero map gives 0. | Consistent. |
| 278 | Eigenvalues 1,2,4 have pairwise differences −1,−3,−2, all nonzero in ℚ. | Consistent. |
| 279 | ψᵃ[u]=[uᵃ]=a[u]; ψᵃ on rank has multiplier 1, including a=1. | Consistent. |
| 280 | h² generates CH²(ℙ²)=ℤ, so h²/2 lies outside the integral lattice. | Consistent. |
| 281 | Both maps give h on O_point and valuation 1 on [2]; zero in positive degree would give 0. | Consistent. |
| 282 | Ordered symbol has last-slot residue +[2] and valuation +1; swapped symbol −[2], valuation −1; native B gives −[2]. | Consistent with degree-two adapter −1. |
| 301 | Empty/full support yield 0/absolute groups; component rank (2,1), CH¹=0⊕ℚ. | Consistent. |
| 302 | d(Γ_t,0)=([0],t), hence raw(t)=−[0], minus-raw(t)=+[0]=B[t]. | Consistent. |
| 303 | Axes support has two minimal components; reduced union has cycle vector (1,1). | Consistent; singular K(Z) substitution excluded. |
| 304 | For ℓ=2,3, dim L=embdim L=0, Ω=L ds≠0, tensor square L[ε]/ε^ℓ; comparison 1↦1. | Consistent. |
| 305 | Over L, divisor u=0 has class +1; raw boundary −1, B and adapted boundary +1; support enlargement sends 1↦(1,0). | Consistent. |
| 317 | ch(1−O(−1))=1−(1−h)=h. | Consistent; affine-point counterexample is R02. |
| 318 | p=1,2,3 Newton factors are 1,−1,1/2. | Consistent. |
| 319 | Rank product 2·3=6, and multiplication by rank-one unit preserves each component. | Consistent. |
| 320 | ξ²=h²=0 on ℙ¹; ch(ξ²)=0=ch(ξ)². | Consistent. |
| 348 | d log absolute z squared=dz/z+dz̄/z̄; counterclockwise integral of dz/z is 2πi. | Consistent. |
| 349 | No divisor leaves smooth forms; empty W has zero spaces in all degrees. | Consistent. |
| 350 | log absolute z squared is a degree-zero generator; r⁻² grows faster than every polynomial in log r, so no smooth-log coefficient represents it. | Consistent. |
| 351 | Ordered iterated residue +1; swapping two degree-one logarithmic forms gives −1. | Consistent. |
| 368 | Trivial connection residues 0,0; dlog period 2πi; residue filtration level 1 plus cohomological degree 1 gives weight 2. | Consistent. |
| 369 | Torus Betti dimensions 1,2,1 unchanged by compactification blowup; number of boundary components grows from 4 to 5. | Consistent; unshifted residue diagrams differ. |
| 370 | Point H⁰,⁰=ℂ with weight 0; empty variety gives 0. | Consistent. |
| 371 | Flat quotients have every origin derivative 0; f(1)/1²=e⁻¹. | Consistent. |
| 372 | Along positive real r→0, 1/r→∞ and log r²→−∞; all exponents zero give f. | Consistent. |
| 373 | Axis jets vanish; at (−2,1) quotient is −e^(−1/4)log4/2. | Consistent. |
| 391 | Point: weight 0 H⁰=ℝ,H¹=0; weight 1 H⁰=0,H¹=ℂ/iℝ≃ℝ. | Consistent. |
| 392 | Raw projections of 3+4i are 3,4i,3; negated representative gives −3,−4i,−3; transported identification restores 3,4i,3. | Consistent. |
| 393 | F⁻¹ℂ=ℂ, arrow surjective, kernel ℝ(−1); H¹=0. | Consistent. |
| 394 | ∂∂̄(z z̄)=dz∧dz̄, so critical differential −2dz∧dz̄. | Consistent. |
| 395 | Shifted one-dimensional space lies in degree −1; conjugation would pair distinct integral bidegrees (a,b),(b,a), requiring dimension at least 2. | Consistent exclusion. |
| 396 | Zero complex retract 0; small-point projection∘inclusion fixes r; reverse composite removes iθ, differing by iθ from identity. | Consistent; homotopy rather than equality. |
| 415 | Identity on point H⁰ is scalar 1; map on zero complex is 0. | Consistent marking. |
| 416 | Period vectors (2πi,0),(0,2πi) and product (2πi)² agree under boundary refinement. | Consistent. |
| 417 | H_D⁰ of point⊔ℙ¹ is ℝ⊕ℝ; empty restriction target 0. | Consistent. |
| 445 | Low-degree product i log2 darg t, swapped product −i log2 darg t. | Consistent. |
| 446 | Point derivative terms vanish, so log2•log3=0; weight-zero unit gives log2. | Consistent. |
| 447 | For e∈tℝ[t], coeff_t(e t)=0≠1=coeff_t(t); in ℝ[t],1·t=t. | Consistent; unitality hypothesis needed. |
| 448 | Product −z̄dz+z dz̄; derivative −2dz∧dz̄ equals critical differential of z z̄ times 1. | Consistent. |
| 460 | Both bracketings are 6Re z, value 6 at z=1; d(Re z)=dx≠0; critical homotopy value 0. | Consistent without closedness. |
| 461 | Point triple 2·3·5=30 both ways; odd-point triple 0; nonunital triple t³ both ways. | Consistent. |
| 462 | Ordered product-circle integral (2πi)², reversed −(2πi)² before and after blowup. | Consistent. |
| 491 | Fiber of identity has zero cohomology; fiber to zero is original Deligne complex. | Consistent. |
| 492 | Fiber of 0→ℝ[0] has ℝ in degree 1; d² second coordinate res dω−d resω+d²g=0. | Consistent. |
| 493 | Enlargement sends r↦(r,0); reverse arrow would have domain ℝ². | Consistent. |
| 494 | V(x)∩V(x−1)=∅, so product lies in zero supported cohomology. | Consistent. |
| 512 | Axes: H²=ℝ², union vector (1,1); cusp: H²=ℝ, generator 1; lower groups 0. | Consistent. |
| 513 | Origin weight 1 H²=0; weight 2 H⁴=ℝ; doubled divisor coefficient 2 versus reduced coefficient 1. | Consistent. |
| 514 | Full support p=0 gives ℝ per component, negative groups 0; point full support p=1 gives H¹=ℝ, violating unqualified semipurity. | Consistent exclusion. |
| 515 | Local quotients by (x,y) and (x²,y) have lengths 1,2; supported product coefficients 1,2. | Consistent. |
| 516 | Factors (2πi)⁻¹ for the ambient line and 1 for the point give d_D[−log absolute t]=−δ₀; pair coefficient +1. | Consistent. |
| 535 | J₀∂=∂=δJ₁ with J₁=−1; J₁d_D=d_DJ₁; J₂=1. | Consistent. |
| 536 | (r,n)=(2p,1) gives total 2p−1 and sign +1; r=2p−1 gives total 2p−2 and sign −1. | Consistent. |
| 537 | Point p=0 degree-zero group ℝ; positive normalized cube groups 0. | Consistent. |
| 538 | dω on (∂x₁,∂x₂,∂y₂) is −2i; ω is excluded from ker d but retained by brutal truncation. | Consistent. |
| 550 | Origin and double origin map to coefficients 1 and 2. | Consistent. |
| 551 | Point and affine line have H_D¹(weight1)=ℝ and H_D⁰(weight0)=ℝ; positive normalized cube-column cohomology 0. | Consistent. |
| 552 | Product signs for (n,s)=(1,1),(0,1),(1,2) are −1,+1,+1. | Consistent. |
| 580 | Point p=n=0 sends integer m to real m; p=0,n>0 source 0. | Consistent. |
| 581 | Empty/zero inputs give 0; absolute values of −1,i are 1, logs 0. | Consistent. |
| 582 | Tate-normalized Chern degrees +1,−1; raw periods +2πi,−2πi. | Consistent. |
| 598 | Empty-support map is 0; full-support map absolute; identity restriction homotopy 0. | Consistent. |
| 599 | Correct pair image (1,1) has differential (0,0); wrong pair (1,−1) has differential (0,2). | Consistent. |
| 600 | Unit t maps to +log absolute t; raw boundary coefficient −1; negative-log pair coefficient +1. | Consistent. |
| 612 | Pullback of O(1) to point is a trivial line, c₁=0, and H_D²(point,ℝ(1))=0. | Consistent. |
| 613 | Both specified embeddings send 2 to 2 and its regulator to log2. | Consistent. |
| 614 | Degree-zero axes give 1; cube degrees 1,2 give transport signs −1,+1 on both source and target. | Consistent. |
| 641 | Re log(2e^(iθ))=log2; branch increment 2πi has real part 0; Re log i=0. | Consistent. |
| 642 | O(a) gives 1+a h_D with normalized integral a. | Consistent. |
| 643 | Zero K-class/empty K-group map to 0, trivial line to 1. | Consistent. |
| 645 | π projections of 3+4i are 3,4i,3; added ℝ(p) projects to 0; opposite projection is nonzero on that line. | Consistent. |
| 647 | Constant ℤ has π₀=H₀=ℤ, higher groups 0; constant S₃ has π₀=S₃, nonabelian of order 6. | Consistent; abelian restriction essential. |
| 659 | Both composites give rank 2↦2 and projective point↦h_D with integral 1. | Consistent. |
| 660 | Both unit maps give log2 and 0 on 2 and −1; weight-two Newton factor −1. | Consistent. |
| 661 | Empty/full supported comparisons are zero/absolute; raw affine-line boundary coefficient −1. | Consistent. |
| 673 | Ordered regulator period +2πi log2, swapped −2πi log2. | Consistent. |
| 674 | Weight-zero 1 preserves regulator; zero/empty product 0; two point units have degree-two regulator 0. | Consistent. |
| 675 | Ruling divisors intersect with length 1, normalized degree 1; doubling a factor gives 2. | Consistent. |
| 687 | Unit values log2,log3,log6=log2+log3; 1,i give 0 and 1/2 gives −log2. | Consistent. |
| 688 | Product form i log2 darg t integrates to 2πi log2; removing i gives a real period in the wrong twist. | Consistent. |
| 689 | Chern degrees −1,0,1; for t^a the negative-log pair gives divisor coefficient a, open regulator +a log absolute t. | Consistent. |

## Not verifiable

- **Bloch86 §7:** the package records the text as uncertified/paywalled. I did not independently certify its arbitrary-field universal integral Chern construction or the equality with the inverse geometric cycle map. BF supplies the readable complex-field construction, and Levine94 the independent geometric isomorphism; these do not certify the unread text. The settled status was not reopened.
- **Beilinson85 §§1–2 and Levine98's listed chapters:** respectively uncertified historical reference and waived background. Neither was treated as read, and neither was requested again.
- **Missing scan displays:** the Burgos94 extraction locates the cited statements but omits several formula displays, particularly around lines 102,155,181,316,337,345,379. Parts of Levine94's diagrams are likewise incomplete. Readable prose and the explicit instance calculations support the scope/sign checks; they do not reconstruct every missing display.
- **No Lean elaboration:** none was run, respecting the read-only/no-build instruction. Suggested.lean has zero declarations, so the requested expanded-signature audit has an empty domain. This report does not claim an independently run build.
- **General theorem proofs:** the tables compute discriminating instances and inspect stated proof inputs; they are not completed proofs of the 27 targets. In particular the declared DifferentialGeometry extensions and the settled external consumer edits remain future work under their existing contracts.
- **Unspecified open work:** the 28 supplied sibling folders, available main/completed roadmaps, board packages and directly named suppliers were checked. No claim is made about ownership against additional open pull requests whose files the brief did not supply.

No new missing-reference request is outstanding. The review-only K-book witness was legally obtained; the other unread references retain their settled manifest statuses.

## Source issues

The effect labels identify the affected source result or proof. These entries are separate from the two package findings; the package already avoids the overbroad source hypotheses and incorrect displayed conventions.

- **Misprint** in BF at Proposition 1.26, printed p.10, BF line 508: the source says the associativity homotopy lands in total input degree; it should be total input degree minus one; affects a stated result.
- **Misprint** in BF at §2.1, printed p.13, BF line 618: the source says applying r cofaces produces an r-dimensional face; it should be a codimension-r face of dimension n−r; affects nothing.
- **Error** in BF at §2.1, equation (2.3), printed pp.13–14, BF line 656: the source says the connection maps are smooth and therefore flat; it should be flatness alone, since the affine-coordinate map −ab has singular zero fiber at (0,0); affects the proof.
- **Error** in BF at Proposition 2.7, printed p.15, BF line 701: the source says every quasi-projective scheme has the stated internal higher-Chow product; it should be a smooth quasi-projective scheme, retaining the diagonal-pullback hypothesis from BF line 689; affects a stated result.
- **Error** in BF at Theorem 3.5, printed p.20, BF line 905: the source says equidimensionality suffices for the displayed K-theory/higher-Chow isomorphism and regulator comparison; it should be smooth quasi-projectivity as used in BF line 919; nilpotent K₁ of dual numbers refutes the broader isomorphism; affects a stated result.
- **Misprint** in BF at proof of Theorem 3.5, printed pp.22–23, BF line 1006 and BF line 1045: the source says k-planes in ℂᴺ have a universal rank-N bundle, with k growing at fixed N; it should be N-planes in a growing k-dimensional ambient space, k≥N, with the rank-N tautological bundle; affects the proof.
- **Misprint** in BFT at §1.1, printed p.2, BFT line 75: the source says its pair simple is a cone shifted by +1; it should be shifted by −1 under the cochain convention stated at BFT line 68; affects nothing.
- **Misprint** in BFT at §3.2, printed p.5, BFT line 188: the source says r cofaces of an n-cube produce an r-dimensional face; it should be codimension r and dimension n−r; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "1064583686e6fc7de5bd3c3c648d490a62c5b3c1", "job": "RT-MotivicEtaleKTheory~1a", "model": "gpt-6-astra", "worker": "chris-6"} -->
