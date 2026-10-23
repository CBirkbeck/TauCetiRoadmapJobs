# Package report: SolidAnalyticRings

The package expands the accepted seven-layer design into packages/SolidAnalyticRings/README.md, Suggested.lean and metadata.toml. All 27 targets, 61 API facts and 89 design Checks are retained. Three additional Checks distinguish a finite free-measure object from a generator and pin the right endomorphism action in §§2.4 and 7.3. Every layer retains Examples and Dependencies. The plan-derived skeleton was generated before editing the prose. The accepted design and review were read as mathematical data; packages/SolidAnalyticRings/design/plan.json is unchanged, including its two supplier gaps.

## Headline theorems and acceptance file

These were listed before the acceptance-file decision. None of the complete headlines is statable at the pins with only a few simple definitions; all appear individually in the module docstring. There are no surrogate statements and no declarations in the namespace.

| Headline | Status | Missing carrier or operation |
| --- | --- | --- |
| §1.2 Discrete spectral embedding and point-evaluation adjunction | Not statable at the pins | Concrete stable spectra; enhanced light spectral hypersheaves |
| §1.5 Light integer derived solidification and countable product tensor | Not statable at the pins | Enhanced derived light null-test solid category, derived solid tensor and coherent derived inclusion |
| §2.1 Solidity detected in every homotopy sheaf and complete t-structure | Not statable at the pins | Light spectral null object, homotopy sheaves and truncations |
| §2.2 Connective monoidal reflection and spectral free measures | Not statable at the pins | Solid spectral category, reflector and internal Hom |
| §2.3 Hℤ-linear monoidal derived comparison and bounded-below detection | Not statable at the pins | Spectral Hℤ-modules and enhanced derived light solid abelian category |
| §2.4 Countable sphere-product compact generator, including module generators | Not statable at the pins | Sphere, solid spectral tensor and spectral modules |
| §3.1 Countable sphere-product tensor | Not statable at the pins | Sphere and solid spectral tensor |
| §3.3 Independent split-tower tensor and diagonal comparison | Not statable at the pins | Coherent spectral towers and solid tensor |
| §3.4 Solid balancing and dualizable scalar change through limits | Not statable at the pins | Enhanced spectral algebras, modules and relative solid tensor |
| §4.1 Countable-limit/ω₁-filtered-colimit interchange | Not statable at the pins | Enhanced light spectral diagram and module categories |
| §§5.3–5.4 Spectral null-family theorem in every degree with block-map naturality | Not statable at the pins | Solid spectral coefficients, marked quotient towers and coherent module completion |
| §6.1 Uniformly bounded-below free resolution | Not statable at the pins | Solid spectral modules, compact generator and realizations |
| §6.2 Sharp quotient-completion connectivity | Not statable at the pins | Spectral homotopy groups and coherent cofiber-tower limits |
| §6.3 Uniform realization and skeletal tail comparison | Not statable at the pins | Enhanced spectral simplicial modules and their realizations |
| §6.4 Prime-completed embedding, tensor closure and completed-sphere monoidality | Not statable at the pins | Ordinary and solid spectra and coherent prime completion |
| §7.2 Complete tensor, scalar adjunction, composition and target-completed base change | Not statable at the pins | Spectral analytic structures on enhanced module categories |
| §7.3 Connective spectral summability localization | Not statable at the pins | Solid spectral generator and enhanced analytic localization |
| §7.4 Common-presentation integer-measure spectral comparison | Not statable at the pins | Enhanced analytic-measure modules and their Hℤ-linear light realization |

The ordinary null-test predicate can be expressed after constructing its marked light abelian null object. That alone does not state §1.5's enhanced derived reflection and monoidal comparison. A theorem asserting only an abelian property would be a partial substitute for that headline. Similarly, a proper-profile predicate is simple, but its combinatorial laws cannot replace the spectral null-family theorem. Consequently Suggested.lean has one import, one module docstring and an empty namespace, with no definitions, examples, admitted data, options or imported roadmap modules.

## Corrections and supported scope

- Replaced the three TeX-style braced subscripts in §§2.3 and 6.4 with prose naming the module category and the two derived tensor products over Hℤ and Hℤ_p. The mathematical statements are unchanged.
- Applied the accepted review's dependency correction: §1.2 enters §§1.4 and 2.2; EnhancedDerivedSheaves E5:abstract.2 enters §§2.2, 2.3 and 4.1; the skeleton/small-site interfaces enter §1.1; E5:animation.4 enters Layer 2 Dependencies. The native epimorphic-tower theorem enters the Mathlib contract and §§4.2 and 6.2, and is listed at Layer 6.
- Replaced §2.2's non-computational internal-Hom Check by the countable condensed dual versus cardinal 2^(2^ℵ₀) abstract dual computation.
- Scoped §7.4 to the static analytic measures actually supplied by VStackSheavesAndLisseCategories VS2.2. The supplier has no animated analytic-measure construction. Its static B is sent to HB through EnhancedDerivedSheaves E5:animation.4, including animatedModules_discrete. Arbitrary commutative Hℤ-algebras remain distinct from animated rings; the characteristic-two negative control remains. No unsupported general animated-measure input is asserted and no new gap is needed for this choice permitted by the accepted review.
- Marked AG as an integer/animated source model in §7.4; its extremally disconnected tests do not supply a light-site equivalence. Added the actual light free-measure locator RC line 773 and compact-Hausdorff integer locator CS line 1243, and kept site comparison restricted to the supplier's common presentations.
- Corrected RC Theorem 3.2.4 to p.17 and Example 4.6.4 to pp.43–44. Q's finite-free-stage calculation is labelled a model; coherent splitting remains an explicit hypothesis here. Added §4.1 to Q's manifest uses and §7.4 to RC's; retained all nine certified lifetime keys and their retrieval records.
- Inserted missing prose spaces, including source-line locators. Made the comparison δ(∏𝕊)→∏δ𝕊 explicit, gave the exact π₁=(ℤ/2)⊕ℤ in the square-zero/discrete witnesses, and specified E₁ algebras as algebras in Sp■.
- Specified the shift on G as L■σ, so the summability test has a determined endomorphism. Made the generic scalar-extension/bar/transitivity input an import from EnhancedDerivedSheaves E5:abstract.2. §3.4 retains its solid spectral balancing, projection compatibility and dualizable limit variant.
- Preserved the general scalar-tower connectivity statement: it needs no completeness or finite-free-quotient assumption. Its citation of §5.1 is explicitly for the cofiber-tower definition only. The bound remains ≥b, and the realization tails remain ≥b+d+1.
- Retained the completed prime unit and all primes, with p=2,3 computed. Retained independent tower indices, sphere-linear sections, derived cofiber quotients, internal rather than global tests, and the ordinary-filtered/ω₁-filtered distinction. The source models give proof routes, not assertions that a written abelian proof already proves their sphere-linear extensions.

The unavailable consumer texts do not support exact consumer-side locators: RefinedTraceMethods and HigherHidaAndColemanTheory have no readable roadmap body in the supplied checkout/index. Their outgoing interfaces are described by this roadmap's own sections; the design's consumer-side section/contract numbers are not repeated as verified citations. They are not suppliers. Ownership against open pull requests for those unavailable bodies was not checked; no additional heads were sought. The named 26 open roadmap heads in the brief were searched through the supplied roadmap index. LocallyAnalyticRepresentationsOfLocalGroups was checked in packages/LocallyAnalyticRepresentationsOfLocalGroups/design/README.md, Layer LR.3 and its solid-coefficient contracts: its strongly inaccessible-cutoff, solid-group-ring and Banach/Smith requirements exceed this roadmap’s light common-presentation comparison. The LR.3 citation is retained; its old SA.1/SA.2/SA.4 labels are not treated as declarations or supplier obligations here.

## Ownership and duplication sweep

The main checkout is a07e2024f391f3022520c3f8ad194912b3eab614. The actual package checkouts and lake-manifest pins agree: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Read shape exemplars: TauCetiRoadmap/CompactOperators/README.md, TauCetiRoadmap/EnhancedDerivedSheaves/README.md and TauCetiRoadmap/GeneralizedCohomology/README.md. Metadata follows the one-topic upstream form and uses math.CT.

Object searches covered the main active/completed roadmaps, the board's readable README/plan/Lean files, the 330-head open-roadmap index, and both pinned libraries. Search objects included light condensed sheaves, internal projectivity, null sequences, solidification, solid spectra, spectral analytic structures, countable products and AB6, split finite sphere towers, balancing, quotient completion, proper profiles, summability and site/cutoff comparisons. Broad matches were narrowed to avoid the search-result cap. Revised existing roadmaps were checked on main, not consumed from their revision heads. StableHomotopyKTheory and VStackSheavesAndLisseCategories are new-folder heads; read §§5.13–5.18 at 00bfbf7 and VS2.1–VS2.2 at 0ca8db7. Read HabiroRings §§2.6–2.12 at bb5d6cb, including its full outgoing request for this spectral contract.

No complete accepted target duplicates an existing construction on the same carrier. The following duplicate construction obligations are excluded here, and their owners are cited in Scope and ownership and Exact supplier contracts:

| Excluded duplicate obligation | Owner and exact interface | Retained variant |
| --- | --- | --- |
| A second light profinite site, ordinary light sheaf or free-module carrier | Mathlib/Topology/Category/LightProfinite/Basic.lean:42,56,403; Mathlib/Condensed/Light/Basic.lean:28; Module.lean:42,68,73,85; Small.lean:30 | Enhanced spectral hypersheaves and their free objects |
| A new proof of Type 0 convergent-sequence internal projectivity | Mathlib/Condensed/Light/Sequence.lean:20–22,302; CategoryTheory/Preadditive/Projective/Internal.lean:41–61 | Marked retract and universe/scalar transport only |
| Ordinary light tensor, Grothendieck abelianness and countable exact products | Mathlib/Condensed/Light/Monoidal.lean:41–62 and AB.lean:31–35 | Null-test solid and spectral tensors; independent AB6 supplied separately |
| Sequential epimorphic light-module limit projections | Mathlib/Condensed/Light/Epi.lean:109 | Homotopy-sheaf use through spectral Milnor comparison |
| Compact-Hausdorff integer solidity, Nöbeling, reflection and derived solid tensor | Mathlib/Condensed/Solid.lean:44,48,69,83; Topology/Category/Profinite/Nobeling/Induction.lean:153; VStackSheavesAndLisseCategories VS2.1, solid-abelian-groups, solidification, derived-solid-tensor | Light null-test theory; restricted comparison in §7.4 |
| A second stable spectrum carrier, HR or chain-complex model | GeneralizedCohomology G2.1–G2.7; StableHomotopyKTheory §§5.13–5.18; EnhancedDerivedSheaves E5:spectra-comparison | Light sheafwise spectral and integer-linear comparisons |
| Generic enhanced localization, towers, bar scalar extension and transitivity | EnhancedDerivedSheaves E2:towers, E3.2–E3.3 and E5:abstract.2–E5:abstract.5 | Verification and balancing on Sp■ and its actual projection maps |
| Finite integer matrix kernel freeness | Mathlib/LinearAlgebra/FreeModule/PID.lean:298, Submodule.basisOfPid | Its finite-sphere retract lift |
| Generic analytic measures, E-coefficients, analytic spectra and site comparison | VStackSheavesAndLisseCategories VS2.2, Analytic measures and complete modules; Solid nonarchimedean coefficients; its Conventions | Sphere-linear structures and static integer-measure spectral transport |
| Habiro algebra, factorial filtration, arithmetic idempotence and arithmetic monoidality | HabiroRings §§2.6–2.12 | General split coefficient theorem; Habiro-specific arithmetic remains in the consumer |

No accepted target was deleted wholesale, so there is no missing target stub to retain. These exclusions remove duplicate sub-obligations rather than thinning the general spectral contract. The light null-test abelian theory is owned here because its category is LightCondMod over integers, whereas VS2.1 uses the compact-Hausdorff profinite-measure predicate. The comparison between them belongs to §7.4 on the common presentations furnished by VS2.2.

The notion moved down from a later roadmap is the ambient light solid spectral block used by RefinedTraceMethods: discreteness, null-test solidity, reflection, compact generator and bounded-below prime-complete comparison now belong to §§1–2 and 6.4. Its trace classes, nuclearity and even filtrations stay downstream. No theorem from RefinedTraceMethods is an input. There is no second relocated notion in this package.

The two existing gaps are kept verbatim in the plan and under their actual supplier subsections: gap:cardinal-interchange belongs to EnhancedDerivedSheaves E0.8/E5:presentability.2; gap:light-countable-ab6 belongs to the light abelian continuation of VStackSheavesAndLisseCategories VS2.1. Their needs sentences match exactly. A proposed Part II/III title describes the supplier's extension, not an extra dependency here.

## Source and library verification

Read every cited work from its certified cached extraction, without copying source passages into the package. No new text was required, no fetch was needed, and no source is missing. Locators checked:

| Work | Read locators | Use and limit |
| --- | --- | --- |
| W | W line 437, W line 443, W line 448, W line 452, W line 472 | Light spectral definition, reflection, p-complete embedding and generator |
| MW | MW line 1748, MW line 1754, MW line 1763, MW line 1764 | Discreteness, solidity, integer-module interpretation and scalar summability; general spectral extension is explicit |
| RC | RC line 537, RC line 732, RC line 754, RC line 773, RC line 777, RC line 808, RC line 870 | Light abelian structure, exactness/projectivity, null-test theorem, free measures and countable product tensor; internal Hom, not sectionwise lifting |
| RC | RC line 1392, RC line 1411, RC line 1431, RC line 1457, RC line 1489, RC line 1500, RC line 1511, RC line 2114, RC line 2125, RC line 2139 | Hyperdescent, analytic structure and Hom closure; tensor-ideal and restriction-adjunction proof steps read; connectivity of spectral summability is a target here |
| Q | Q line 3643, Q line 3666, Q line 3672, Q line 3685, Q line 3688, Q line 3693 | Arithmetic spectral model, finite free stages, balancing and null-family formula; splitting is an added hypothesis, not quoted from Q |
| Bosco | Bosco line 3459, Bosco line 3462, Bosco line 3465, Bosco line 3488, Bosco line 3504, Bosco line 3510 | Derived p-complete solid ring and bounded-above cochain hypotheses retained for its integer comparison; extremally disconnected evaluation is a model, not a light-site theorem |
| CS | CS line 1243, CS line 1252, CS line 1578 | Compact-Hausdorff integer solidification and derived monoidality, consumed through VS2.1 |
| AG | AG line 1361, AG line 1384, AG line 3014, AG line 3041, AG line 3054 | Measure and animated models on extremally disconnected sets; no unrestricted light-site equivalence inferred |
| HTT | HTT line 18705 | Proposition 5.3.3.3 on regular-cardinal filtered colimits in spaces; stabilization is the spectral supplier extension |
| AS | AS line 9, AS line 39, AS line 43 | Course context only; no theorem relies solely on the unendorsed transcript |

Native carrier meanings were checked in source and via elaborated types. LightProfinite is CompHausLike with total disconnectedness and second countability (Basic.lean:42), so compactness and Hausdorffness come from CompHausLike; there is no nonemptiness assumption (the empty object is admitted). LightCondensed is the ordinary coherent-topology Sheaf specialization (Light/Basic.lean:28), not a spectral enhancement. LightCondAb is LightCondMod ℤ (Module.lean:85), hence Type 1 with its site at universe 0. Internal projectivity is preservation of epimorphisms by ihom (Internal.lean:41–47), not projectivity of every evaluation. CondensedMod.IsSolid is a map-inversion field testing all Profinite objects (Solid.lean:83–85); the general-ring correction in its preceding docstring is retained. No missing separation or countability condition was silently added to these native definitions.

The stable-spectrum absence check used object and declaration searches over Mathlib/AlgebraicTopology, Mathlib/Condensed and all TauCeti sources: no concrete stable spectrum, solid spectral module category or enhanced spectral analytic category is present. The spectral-looking Tau Ceti paths concern prime/valuation/topological spectra or solid tori. Mathlib's ordinary DerivedCategory in Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87 does not construct the coherent enhanced monoidal or spectral categories needed for the full headlines. Missing carriers are therefore mathematical constructions, not missing imports or object files. No TauCeti module is used or built.

## Adversarial mathematics pass

Each row gives an explicit instance and actual values. Rows cover every target, every API fact and every design Check separately, followed by the added Checks, conventions, supplier gaps and worked examples. The witnesses discriminate definitions and detect false specializations; they are not proofs of the general theorems. The full hypotheses and proof routes were also compared with the cited source passages and supplier sections.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 target | ∅, a pair, free ranks 2 and 3 | M(∅)=0; M(2)=M(*)²; 𝕊²⊗𝕊³=𝕊⁶ | Consistent on these instances | Retained with stated hypotheses |
| §1.1 API 1 | T=*, M=δHℤ | π₀Map(𝕊[*],M)=ℤ=π₀M(*) | Consistent on these instances | Retained with stated hypotheses |
| §1.1 API 2 | 0 and id on δHℤ | values at * are 0 and 1, hence unequal | Consistent on these instances | Retained with stated hypotheses |
| §1.1 API 3 | identity hypercover of * | Tot of the constant value X is X | Consistent on these instances | Retained with stated hypotheses |
| §1.1 API 4 | T=2, U=3; T=∅ | both tensor ranks are 6; both empty tensors are 0 | Consistent on these instances | Retained with stated hypotheses |
| §1.1 Check 1 | empty site object | 0=0; a nonzero constant presheaf instead gives X≠0 | Consistent on these instances | Retained |
| §1.1 Check 2 | two disjoint points | M(*)×M(*); free rank 2, rather than rank 1 | Consistent on these instances | Retained |
| §1.1 Check 3 | C and two-point test | π₀𝕊[C](*)=ℤ^(C); π₀𝕊[C](2)=(ℤ^(C))²; the infinite all-one family is absent | Consistent on these instances | Retained |
| §1.2 target | 0, 𝕊⊕Σ𝕊 and the p-power integer tower | unit at * is id; π₁=(ℤ/2)⊕ℤ; identity on ℤ_p is continuous but not locally constant | Consistent on these instances | Retained with stated hypotheses |
| §1.2 API 1 | ×2 then ×3 on Hℤ | induced composite is ×6=δ(×6); zero induces 0 | Consistent on these instances | Retained with stated hypotheses |
| §1.2 API 2 | X=ΣHℤ | unit gives id on π₁=ℤ and 0→0 on π₀ | Consistent on these instances | Retained with stated hypotheses |
| §1.2 API 3 | free ranks 2,3; suspended pair | tensor rank 6; suspension symmetry −1 on both paths | Consistent on these instances | Retained with stated hypotheses |
| §1.2 Check 1 | X=0 | δ0=0 and unit is id₀ | Consistent on these instances | Retained |
| §1.2 Check 2 | X=𝕊⊕Σ𝕊 | π₀=ℤ, π₁=ℤ/2⊕ℤ | Consistent on these instances | Retained |
| §1.2 Check 3 | T=ℤ_p, tower H(ℤ/p^r) | inverse limit has id:T→ℤ_p; discrete realization does not contain id | Consistent on these instances | Retained |
| §1.3 target | C, the marked singleton and its universe lift | reduced singleton=0; σ*e₁=e₀; lifting leaves this value unchanged | Consistent on these instances | Retained with stated hypotheses |
| §1.3 API 1 | identity and successor of C | basis [0] maps to [0] and [1], respectively; composite successors give [2] | Consistent on these instances | Retained with stated hypotheses |
| §1.3 API 2 | M=δHℤ | fiber of evaluation at ∞ consists of eventually-zero sequences, ℤ^(ℕ) | Consistent on these instances | Retained with stated hypotheses |
| §1.3 API 3 | b=e₀,e₁ | σ*e₀=0 and σ*e₁=e₀ | Consistent on these instances | Retained with stated hypotheses |
| §1.3 API 4 | lifted point and sequence | ∞ stays ∞; 0 maps to 1; reduced singleton remains 0 | Consistent on these instances | Retained with stated hypotheses |
| §1.3 Check 1 | C={∞} | cofib(id)=0; unreduced free object has π₀=ℤ | Consistent on these instances | Retained |
| §1.3 Check 2 | b=e₁ | (1−σ*)e₁=e₁−e₀; (1−σ*)(e₁+e₀)=e₁ | Consistent on these instances | Retained |
| §1.3 Check 3 | opposite coefficient shift | e₁ goes to e₂, yielding e₁−e₂ instead of e₁−e₀ | Consistent on these instances | Retained |
| §1.4 target | 0, δ𝕊, N | test maps are id₀, an equivalence, and a non-equivalence; N(*) has finite-support π₀, unlike its reflection | Consistent on these instances | Retained with stated hypotheses |
| §1.4 API 1 | M=0; M=δHℤ | all test mapping spectra vanish; finite-support inverse takes e₁ to e₀+e₁ | Consistent on these instances | Retained with stated hypotheses |
| §1.4 API 2 | ±1 automorphisms on δHℤ | π₀ values +1 and −1 remain distinct in the full subcategory | Consistent on these instances | Retained with stated hypotheses |
| §1.4 API 3 | X=𝕊 | π₀δX=ℤ and π₁δX=ℤ/2, both discrete and solid | Consistent on these instances | Retained with stated hypotheses |
| §1.4 Check 1 | M=0 | internal Hom=0; id₀ is invertible | Consistent on these instances | Retained |
| §1.4 Check 2 | M=δ𝕊 | π₀=ℤ and π₁=ℤ/2; the Hℤ replacement would give π₁=0 | Consistent on these instances | Retained |
| §1.4 Check 3 | M=N | π₀ at *=ℤ^(ℕ), reflected π₀=ℤ^ℕ; (1,1,…) belongs only to the latter | Consistent on these instances | Retained |
| §1.5 target | ℤ, P, topological ℝ and countable integer products | inverse on e₁ is e₀+e₁; P misses the infinite all-one vector; harmonic partial sums diverge; product tensor has no higher Tor | Consistent on these instances | Retained with stated hypotheses |
| §1.5 API 1 | ℤ→ℤ→0 and ℤ² | kernels/cokernels stay solid; Hom(ℤ,ℤ²)=ℤ² | Consistent on these instances | Retained with stated hypotheses |
| §1.5 API 2 | B=ℤ; B=ℝ | reflected objects are ℤ and 0, respectively | Consistent on these instances | Retained with stated hypotheses |
| §1.5 API 3 | Σℤ; ℤ⊕Σℤ | cohomology lies in degree −1, and degrees 0,−1; all other groups vanish | Consistent on these instances | Retained with stated hypotheses |
| §1.5 API 4 | ℤ²⊗ᴸ■ℤ³ | degree-zero value ℤ⁶; other cohomology 0 in both derived realizations | Consistent on these instances | Retained with stated hypotheses |
| §1.5 API 5 | S=∅,*,2,C | free measures 0,ℤ,ℤ²,ℤ×ℤ^ℕ; product presentations preserve each finite projection | Consistent on these instances | Retained with stated hypotheses |
| §1.5 API 6 | I=∅; sizes 2,3; ℕ,ℕ | results 0,ℤ⁶,ℤ^(ℕ²) in degree 0 and 0 in other degrees | Consistent on these instances | Retained with stated hypotheses |
| §1.5 Check 1 | B=ℤ, e₁ | (1−σ*)(e₀+e₁)=e₁; opposite shift gives e₁−e₂ | Consistent on these instances | Retained |
| §1.5 Check 2 | S=∅,*,2,C; P | measure ranks 0,1,2 and ℤ×ℤ^ℕ; P(*)=ℤ^(ℕ) lacks (1,1,…) | Consistent on these instances | Retained |
| §1.5 Check 3 | I,J=2,3; ∅,ℕ; ℕ,ℕ | tensor values ℤ⁶,0,ℤ^(ℕ²), with positive Tor 0 | Consistent on these instances | Retained |
| §1.5 Check 4 | Σℤ; ℝ with b_n=1/(n+1) | H⁻¹=ℤ; x₀−x_(N+1) would equal the divergent harmonic sum, so no null solution in ℝ | Consistent on these instances | Retained |
| §2.1 target | ΣHℤ, H(ℤ/2), and N | π₁ΣHℤ=ℤ; heart object has only π₀=ℤ/2; π₀N=P is not solid | Consistent on these instances | Retained with stated hypotheses |
| §2.1 API 1 | M=Hℤ⊕ΣHℤ | τ≤0M=Hℤ; τ≥1M=ΣHℤ | Consistent on these instances | Retained with stated hypotheses |
| §2.1 API 2 | B=ℤ/2 and B=0 | π₀HB=B, all other π_k=0 | Consistent on these instances | Retained with stated hypotheses |
| §2.1 API 3 | M=Hℤ, k=1 and 0 | π₁ΣM=ℤ=π₀M; π₀ΣM=0=π₋₁M | Consistent on these instances | Retained with stated hypotheses |
| §2.1 Check 1 | ΣHℤ; cochains ℤ in degree 2 | nonzero groups π₁=ℤ and π₋₂=ℤ, respectively | Consistent on these instances | Retained |
| §2.1 Check 2 | M=0 | π_k=0 for every integer k, so every bound holds | Consistent on these instances | Retained |
| §2.1 Check 3 | square-zero 𝕊⊕Σ𝕊 | π₀=ℤ and π₁=(ℤ/2)⊕ℤ; its heart alone has π₁=0 | Consistent on these instances | Retained |
| §2.2 target | 0, δ𝕊, free C; connective shifts | reflections 0,δ𝕊,δ𝕊⊕∏ℕδ𝕊; Σ𝕊⊗Σ²𝕊=Σ³𝕊 | Consistent on these instances | Retained with stated hypotheses |
| §2.2 API 1 | C=M=δHℤ | precomposition with the unit is id on π₀Map=ℤ | Consistent on these instances | Retained with stated hypotheses |
| §2.2 API 2 | C=0 and C=δ𝕊 | both iterated units are id₀ and id_δ𝕊 | Consistent on these instances | Retained with stated hypotheses |
| §2.2 API 3 | C=D=𝕊², M=δHℤ | both sides of tensor–Hom have π₀=ℤ⁴ | Consistent on these instances | Retained with stated hypotheses |
| §2.2 API 4 | T=∅,*,2,C | measure values have ranks 0,1,2 and marked product ℤ×ℤ^ℕ; units send each point to its Dirac vector | Consistent on these instances | Retained with stated hypotheses |
| §2.2 Check 1 | C=0 | L■0=0 and 0⊗■M=0 | Consistent on these instances | Retained |
| §2.2 Check 2 | C=δ𝕊 | L■C=C and C⊗■M=M | Consistent on these instances | Retained |
| §2.2 Check 3 | G to δH𝔽₂ | π₀ internal Hom at *=𝔽₂^(ℕ), cardinal ℵ₀; abstract Hom(ℤ^ℕ,𝔽₂) has cardinal 2^(2^ℵ₀) | Consistent on these instances | Concrete replacement |
| §2.3 target | Σ^bH𝔽_p, integer unit and free commutative 𝔽₂ algebra | bottom π_b=𝔽_p before/after linearization; H₁(BΣ₂;𝔽₂)=𝔽₂ differs from the discrete animated polynomial value 0 | Consistent on these instances | Retained with stated hypotheses |
| §2.3 Check 1 | unit δHℤ | π₀=ℤ; all other π_k=0, corresponding to ℤ[0] | Consistent on these instances | Retained |
| §2.3 Check 2 | p=2,3 | tensor the two-term ℤ --p→ ℤ complex with 𝔽_p: differential 0, π₀=π₁=𝔽_p | Consistent on these instances | Retained |
| §2.3 Check 3 | symmetric square over 𝔽₂ | H₁(BΣ₂;𝔽₂)=𝔽₂; animated 𝔽₂[x] has π₁=0 | Consistent on these instances | Retained |
| §2.4 target | G, G₀ and first two matrix coordinates | π₀G(*)=ℤ^ℕ; π₁=(ℤ/2)^ℕ; σe₀=e₁; G₀=0; φe₁₂e₂₁=φe₁₁=(1,0) | Consistent on these instances | Retained with stated hypotheses |
| §2.4 API 1 | basis vector e₀ under N→G | coordinate (1,0,0,…); every finite projection has the same vector | Consistent on these instances | Retained with stated hypotheses |
| §2.4 API 2 | k=−1,0,1 | homotopy values 0,ℤ^ℕ,(ℤ/2)^ℕ | Consistent on these instances | Retained with stated hypotheses |
| §2.4 API 3 | A=0; A=𝕊,M=G | adjunction mapping spectra are 0=0 and End(G)=End(G) | Consistent on these instances | Retained with stated hypotheses |
| §2.4 Check 1 | G at * | π₀=ℤ^ℕ includes (1,1,…) | Consistent on these instances | Retained |
| §2.4 Check 2 | e_n in product versus discrete product | each fixed coordinate is eventually 0; the vector sequence itself is never eventually 0 | Consistent on these instances | Retained |
| §2.4 Check 3 | A=0 | every module and G_A are 0; zero detection is still valid | Consistent on these instances | Retained |
| §3.1 target | empty, 2×3, and suspended factors | 0=0; rank 6=6; graded transposition −1=−1 | Consistent on these instances | Retained with stated hypotheses |
| §3.1 Check 1 | I=∅ | 0⊗■P=0=product on ∅×J | Consistent on these instances | Retained |
| §3.1 Check 2 | sizes 2,3 | coordinate (1,2) is the tensor of projections, among six summands | Consistent on these instances | Retained |
| §3.1 Check 3 | Σ𝕊 and Σ𝕊; unsuspended permutations | signs (−1)^(1·1)=−1 and (−1)^0=+1 | Consistent on these instances | Retained |
| §3.2 target | zero, constant 𝕊, truncating 𝕊^(n+1), and ×2 | limits 0,𝕊,∏ℕδ𝕊; ×2 cannot split since 2b=1 has no integer solution | Consistent on these instances | Retained with stated hypotheses |
| §3.2 API 1 | projection 𝕊²→𝕊 with s(x)=(x,0) | d∘s=id and kernel rank 1 | Consistent on these instances | Retained with stated hypotheses |
| §3.2 API 2 | identity versus zero coherent tower map | induced π₀ limit maps 1 versus 0 | Consistent on these instances | Retained with stated hypotheses |
| §3.2 API 3 | growing tower at n=0,1,2 | ranks 1,2,3=1+0,1+1,1+1+1 | Consistent on these instances | Retained with stated hypotheses |
| §3.2 API 4 | s(x)=(x,0), s′(x)=(x,x) | change (x,y)↦(x,y−x), inverse (x,z)↦(x,z+x); stage projection x is fixed | Consistent on these instances | Retained with stated hypotheses |
| §3.2 Check 1 | zero tower and constant identity tower | kernels 0, limits 0 and 𝕊 | Consistent on these instances | Retained |
| §3.2 Check 2 | P_n=𝕊^(n+1) | first ranks 1,2,3; each successive kernel rank 1 | Consistent on these instances | Retained |
| §3.2 Check 3 | transition ×2 | a right inverse requires 2b=1, impossible in ℤ | Consistent on these instances | Retained |
| §3.3 target | constant towers and ranks m+1,n+1 | units give 𝕊; at (1,2) both independent stages have rank 6; (max(m,n),max(m,n)) dominates (m,n) | Consistent on these instances | Retained with stated hypotheses |
| §3.3 Check 1 | constant rank-one towers | 𝕊⊗■𝕊=𝕊 and diagonal limit 𝕊 | Consistent on these instances | Retained |
| §3.3 Check 2 | growing stages at (1,2) | rank 2·3=6 | Consistent on these instances | Retained |
| §3.3 Check 3 | A→A/(t), constant-term section | s(t·1)=0, while t·s(1)=t≠0 | Consistent on these instances | Retained |
| §3.4 target | A=𝕊, A=𝕊[t], and rational scalar change | ordinary solid tensor; t₁,t₂ both map to t; (2⁻ⁿ) has no common denominator in the discrete tensor | Consistent on these instances | Retained with stated hypotheses |
| §3.4 Check 1 | A=𝕊; X=0 | both balanced expressions X⊗■Y and 0, respectively | Consistent on these instances | Retained |
| §3.4 Check 2 | A=𝕊[t], X=Y=A | π₀ absolute tensor=ℤ[t₁,t₂]; multiplication maps both variables to t | Consistent on these instances | Retained |
| §3.4 Check 3 | Hℤ-linear ∏ℕℤ and discrete ℚ | finite fractions have one denominator; (1/2^n) is in the ordinary pointwise product ℚ^ℕ but outside that discrete tensor image | Consistent on these instances | Retained |
| §4.1 target | J=ω₁,K=ℕ versus J=ℕ,K=ℕ | countable coordinate thresholds have supremum <ω₁; ℕ example instead gives direct sum versus product | Consistent on these instances | Retained with stated hypotheses |
| §4.1 Check 1 | K=∅; J=point | 0=0 and lim_KF=lim_KF | Consistent on these instances | Retained |
| §4.1 Check 2 | F(n,k)=Hℤ for k<n | colim_n∏_k π₀F=ℤ^(ℕ); ∏_k colim_nπ₀F=ℤ^ℕ | Consistent on these instances | Retained |
| §4.1 Check 3 | K=point | both sides colim_JF and comparison id | Consistent on these instances | Retained |
| §4.2 target | independent factorial subgroups, zero family and split integer tower | (1/(j+1)!) is admitted independently; limits project onto every finite stage and lim¹=0 | Consistent on these instances | Retained with stated hypotheses |
| §4.2 Check 1 | B_j=ℚ with subgroups (1/n!)ℤ | n_j=j+1 admits vector (1/(j+1)!); no fixed n admits it for all j | Consistent on these instances | Retained |
| §4.2 Check 2 | all B_j=0; empty index | both products/colimits are 0 | Consistent on these instances | Retained |
| §4.2 Check 3 | ℤ^(n+1) truncation tower | every finite tuple lifts by zero extension; lim¹=0 | Consistent on these instances | Retained |
| §5.1 target | A=𝕊[[t]], A=0, and Moore quotient | quotient ranks 0,1,2; marked J₂→J₁ is ×t; ℤ/p is not integer free | Consistent on these instances | Retained with stated hypotheses |
| §5.1 API 1 | identity datum on 𝕊[[t]] | each coefficient t^j maps to itself at all quotients | Consistent on these instances | Retained with stated hypotheses |
| §5.1 API 2 | r=1,s=2 | J₂→J₁ multiplies the abstract A-coordinate by t; both marked images are t²x | Consistent on these instances | Retained with stated hypotheses |
| §5.1 API 3 | ×t modulo t² | both naturality paths send 1↦t and t↦0 | Consistent on these instances | Retained with stated hypotheses |
| §5.1 API 4 | even stages t^(2r) | every coefficient is still detected, giving π₀=ℤ[[t]] | Consistent on these instances | Retained with stated hypotheses |
| §5.1 API 5 | scalar 1 and scalar 0 | tensor quotients 0 and M⊕ΣM equal the corresponding cofibers | Consistent on these instances | Retained with stated hypotheses |
| §5.1 Check 1 | A=𝕊[[t]] | B₀=0,B₁=𝕊,B₂=𝕊²; cofib(t)=𝕊 | Consistent on these instances | Retained |
| §5.1 Check 2 | A=0 | J_r=0 and Λ_aM=0 for its unique module | Consistent on these instances | Retained |
| §5.1 Check 3 | p=2,3 | π₀(𝕊/p)=ℤ/p; rank-one free sphere has π₀=ℤ, so stages are excluded | Consistent on these instances | Retained |
| §5.2 target | f(j)=j and f_k(j)=max(j−k,0) | sublevel size r; a common target to all f_k must be 0, with infinite sublevel at r=1 | Consistent on these instances | Retained with stated hypotheses |
| §5.2 API 1 | f(j)=j, g(j)=j+1 | distinct at j=0, values 0 and 1; both have finite sublevels | Consistent on these instances | Retained with stated hypotheses |
| §5.2 API 2 | f=j,g=j+1; countable f_k | min=f gives a finite cocone; any countable common target is identically 0 and improper | Consistent on these instances | Retained with stated hypotheses |
| §5.2 API 3 | t^(j+2)→t^(j+1)→t^j | abstract multipliers t·t=t²; marked image t^(j+2)x on either path | Consistent on these instances | Retained with stated hypotheses |
| §5.2 API 4 | identity, zero and double duplication | supports {j}, ∅ and {4j,4j+1,4j+2,4j+3} | Consistent on these instances | Retained with stated hypotheses |
| §5.2 API 5 | singleton fold and identity | supports {0} and {j}; ∏_I A is a compact retract of the free generator for finite I and the free generator for countably infinite I | Consistent on these instances | Retained with stated hypotheses |
| §5.2 Check 1 | f=j; f=0 | sublevel sizes r and ∞ at r=1, respectively | Consistent on these instances | Retained |
| §5.2 Check 2 | all I_j=∅ | V_f=0 for every profile | Consistent on these instances | Retained |
| §5.2 Check 3 | f_k(j)=max(j−k,0) | taking k=j forces g(j)=0; {j:g(j)<1}=ℕ | Consistent on these instances | Retained |
| §5.2 Check 4 | identity and zero block maps | supports {j} and ∅; quotient maps id and 0 | Consistent on these instances | Retained |
| §5.2 Check 5 | two duplications | support {4j,4j+1,4j+2,4j+3}, cardinal 4 | Consistent on these instances | Retained |
| §5.2 Check 6 | f(j)=j+1→g(j)=j | t^(j+1)x maps to the same element; t^j is outside t^(j+1)A | Consistent on these instances | Retained |
| §5.3 target | A=𝕊[[t]] and singleton/finite/infinite blocks | modulo t^r, t^j survives only for j<r; constants survive infinitely; finite sum gives A² and a single infinite block gives ∏ℕA | Consistent on these instances | Retained with stated hypotheses |
| §5.3 Check 1 | all I_j singletons | (t^j) survives only at j<r modulo t^r; (1) survives at every j for r≥1 | Consistent on these instances | Retained |
| §5.3 Check 2 | I₀=I₁=singleton, others empty | profile values 0 at 0,1 give A² on both sides | Consistent on these instances | Retained |
| §5.3 Check 3 | I₀=ℕ, others empty | no decay inside block 0; both sides ∏ℕA | Consistent on these instances | Retained |
| §5.4 target | negative degrees, ηt^j, duplication and fold | values 0; survivors η,ηt mod t²; outputs 0–3; fold value 1+t mod t² | Consistent on these instances | Retained with stated hypotheses |
| §5.4 Check 1 | k<0 | π_kJ_r=0 and π_kΛ_aF_I=0 | Consistent on these instances | Retained |
| §5.4 Check 2 | A=𝕊[[t]], k=1 | π₁A=(ℤ/2)[[t]]; modulo t² the family has η and ηt | Consistent on these instances | Retained |
| §5.4 Check 3 | duplication of (t^j) | modulo t² outputs (1,1,t,t,0,…) at 0,1,2,3,… | Consistent on these instances | Retained |
| §5.4 Check 4 | fold of (t^j) | sum (1−t)⁻¹; reduction 1+t; (1−t)(1+t)=1−t²=1 mod t² | Consistent on these instances | Retained |
| §6.1 target | M=0, Σ^bG_A, and shifts Σ^(−n)G_A | resolutions realize to 0 and Σ^bG_A; lower bounds −n have no common integer bound | Consistent on these instances | Retained with stated hypotheses |
| §6.1 Check 1 | M=0 | every term and realization 0 | Consistent on these instances | Retained |
| §6.1 Check 2 | M=Σ^bG_A | constant resolution realizes to M with the same lower bound b | Consistent on these instances | Retained |
| §6.1 Check 3 | M_n=Σ^(−n)G_A | bounds −n tend to −∞, so no fixed b works | Consistent on these instances | Retained |
| §6.2 target | scalars 1,0,2^r and ideal tower | cofibers 0,M⊕ΣM,H(ℤ/2^r); quotient limit Hℤ₂ has π₋₁=0, while the discrete ideal tower has π₋₁=ℤ₂/ℤ | Consistent on these instances | Retained with stated hypotheses |
| §6.2 Check 1 | a_r=1 | all cofibers 0; limit 0 | Consistent on these instances | Retained |
| §6.2 Check 2 | one zero scalar | π₀ of Hℤ/0=ℤ and π₁=ℤ, distinguishing Hℤ alone | Consistent on these instances | Retained |
| §6.2 Check 3 | M=Hℤ,2^r | lim quotient=ℤ₂,lim¹=0; discrete ideal tower has lim=0 and lim¹=ℤ₂/ℤ | Consistent on these instances | Retained |
| §6.3 target | constant simplicial module; first normalized term; unbounded countercontrol | comparison id; first tail bound b+1; Σ^nΣ^(−n)A=A in every degree | Consistent on these instances | Retained with stated hypotheses |
| §6.3 Check 1 | constant simplicial M | both realizations complete to Λ_aM, comparison id | Consistent on these instances | Retained |
| §6.3 Check 2 | normalized degree 1 term Σ^bHℤ, a_r=2^r | completed layer Σ^(b+1)Hℤ₂, π_b=0 and π_(b+1)=ℤ₂ | Consistent on these instances | Retained |
| §6.3 Check 3 | normalized term Σ^(−n)A | suspended layer A each time; lower bound 0 does not increase | Consistent on these instances | Retained |
| §6.4 target | p=2,3; H𝔽_p; Hℤ[1/p] | completed unit π₀=ℤ₂,ℤ₃; H𝔽_p completion is itself; p-inverted completion is 0 | Consistent on these instances | Retained with stated hypotheses |
| §6.4 API 1 | X=H𝔽₂,H𝔽₃ | e_pX(*)=X; π₀ unit sends 1 to 1 | Consistent on these instances | Retained with stated hypotheses |
| §6.4 API 2 | X=Y=𝕊_p^∧ | completed ordinary smash and solid tensor give unit 𝕊_p^∧ with π₀=ℤ_p | Consistent on these instances | Retained with stated hypotheses |
| §6.4 API 3 | H𝔽_p over Hℤ_p | relative tensor has Tor₀=Tor₁=𝔽_p | Consistent on these instances | Retained with stated hypotheses |
| §6.4 API 4 | Hℤ[1/p]; H𝔽_p | multiplication-p equivalence gives quotient 0; second tower has limit H𝔽_p and identity completion unit | Consistent on these instances | Retained with stated hypotheses |
| §6.4 Check 1 | p=2 | completed-sphere π₀=ℤ₂; ambient sphere π₀=ℤ | Consistent on these instances | Retained |
| §6.4 Check 2 | p=3 | completed-sphere π₀=ℤ₃; unit sends 1↦1 | Consistent on these instances | Retained |
| §6.4 Check 3 | Hℤ_p over Hℤ; H𝔽_p over Hℤ_p | first solid relative tensor Hℤ_p; second π₀=π₁=𝔽_p | Consistent on these instances | Retained |
| §6.4 Check 4 | X=H𝔽_p, p=2,3 | quotient X⊕ΣX and transition diag(id,0); limit X | Consistent on these instances | Retained |
| §7.1 target | D=all, D=0 and Perf(Hℤ) | reflectors id,0; countable sum ℤ^(ℕ) is not perfect, hence the third candidate fails ambient colimit closure | Consistent on these instances | Retained with stated hypotheses |
| §7.1 API 1 | A=Hℤ,D=all versus D=0 | complete coefficient has π₀=ℤ versus 0, so the inclusions differ | Consistent on these instances | Retained with stated hypotheses |
| §7.1 API 2 | D=all with its unit | unit sends 1↦1; replacing it by ×2 sends 1↦2 and violates unit compatibility | Consistent on these instances | Retained with stated hypotheses |
| §7.1 API 3 | identity followed by map to (Hℤ,0) | restriction sends 0↦0; composite still 0↦0 | Consistent on these instances | Retained with stated hypotheses |
| §7.1 API 4 | D=0,A=Hℤ or A=0 | units Hℤ→0 and 0→0 are respectively noninvertible and invertible | Consistent on these instances | Retained with stated hypotheses |
| §7.1 Check 1 | D=all | L_DA=A, π₀ unit id | Consistent on these instances | Retained |
| §7.1 Check 2 | D=0 | complete coefficient 0; A→0 invertible exactly for A=0 | Consistent on these instances | Retained |
| §7.1 Check 3 | Perf(Hℤ) | countable coproduct of rank-one modules has rank ℵ₀, outside perfect complexes | Consistent on these instances | Retained |
| §7.2 target | zero module, full structures, target-zero square | tensors vanish at zero; derived 𝔽₂ pushout has π₀=π₁=𝔽₂; both target-zero paths give 0 | Consistent on these instances | Retained with stated hypotheses |
| §7.2 API 1 | D=all and D=0 over Hℤ | units Hℤ and 0, with π₀=ℤ and 0 | Consistent on these instances | Retained with stated hypotheses |
| §7.2 API 2 | identity morphism, M=N=Hℤ | mapping spectra Hℤ=Hℤ, π₀=ℤ | Consistent on these instances | Retained with stated hypotheses |
| §7.2 API 3 | full structures Hℤ→H𝔽₂→H𝔽₂, M=Hℤ | iterated and composite extension both H𝔽₂ | Consistent on these instances | Retained with stated hypotheses |
| §7.2 API 4 | identity algebra square, target D=0 | both completed paths 0; intermediate kernels 0, target kernel all modules | Consistent on these instances | Retained with stated hypotheses |
| §7.2 Check 1 | M=0 | tensor and extension send 0 to 0 | Consistent on these instances | Retained |
| §7.2 Check 2 | A=Hℤ,D=0 | completed tensor unit has π₀=0 instead of ℤ | Consistent on these instances | Retained |
| §7.2 Check 3 | H𝔽₂←Hℤ→H𝔽₂ | two-term resolution differential becomes 0; π₀=π₁=𝔽₂ | Consistent on these instances | Retained |
| §7.2 Check 4 | all algebras Hℤ, target-zero structure | both paths=0; input generated kernel=0, target kernel=all | Consistent on these instances | Retained |
| §7.3 target | F empty, {0}, {1}; p⁻¹ on topological ℚ_p; nilpotent ε | identity for first three, kernel b_n=p^n≠0 in second case, inverse 1+εσ* in third | Consistent on these instances | Retained with stated hypotheses |
| §7.3 API 1 | finite-support e₁ | (1−fσ*)(e₁+fe₀)=e₁; replacing σ* by opposite shift fails | Consistent on these instances | Retained with stated hypotheses |
| §7.3 API 2 | F=∅, C=Hℤ | L_FC=Hℤ and both maps to Hℤ have π₀=ℤ | Consistent on these instances | Retained with stated hypotheses |
| §7.3 API 3 | F=∅⊆{0} | both reflectors id; their composite id | Consistent on these instances | Retained with stated hypotheses |
| §7.3 API 4 | Hℤ→H𝔽₂ with scalar 0 | scalar maps to 0, both tests id | Consistent on these instances | Retained with stated hypotheses |
| §7.3 API 5 | 𝔽₂[ε]/ε², f=ε | (1−εσ*)(1+εσ*)=1−ε²σ*²=1 | Consistent on these instances | Retained with stated hypotheses |
| §7.3 Check 1 | F=∅,{0},{1} | reflector id in each case: tests absent, id and the defining solid equivalence | Consistent on these instances | Retained |
| §7.3 Check 2 | b=e₁ | σ*e₀=0 gives (1−fσ*)(e₁+fe₀)=e₁ | Consistent on these instances | Retained |
| §7.3 Check 3 | p=2,3, A=topological Hℚ_p, f=1/p | b_n−f b_(n+1)=p^n−p^n=0 but b₀=1 | Consistent on these instances | Retained |
| §7.3 Check 4 | ε²=0 in 𝔽₂[ε]/ε² | inverse 1+εσ*; product of test and inverse 1 | Consistent on these instances | Retained |
| §7.4 target | integer measures, bounded E denominators and static 𝔽₂ | measures 0,ℤ,ℤ²; vector (p⁻ⁿ) has no uniform bound; θ𝔽₂=H𝔽₂ but free derived commutative algebra has positive homology | Consistent on these instances | Retained with stated hypotheses |
| §7.4 Check 1 | S=2,∅,* | complete free integer modules ℤ²,0,ℤ | Consistent on these instances | Retained |
| §7.4 Check 2 | E/ℚ_p finite, sequence p⁻ⁿ | valuations −n have no lower bound; p^N·p⁻ⁿ is nonintegral for n>N | Consistent on these instances | Retained |
| §7.4 Check 3 | static 𝔽₂ and its animated polynomial | θ𝔽₂=H𝔽₂; H₁(BΣ₂;𝔽₂)=𝔽₂ while animated polynomial π₁=0 | Consistent on these instances | Retained |
| §1.5 added Check | S=*; M=ℤ_p/(ℤ_p)^δ | M(*)=0, but p^n yields a nonzero class in M(C); free measure ℤ cannot detect this M | Consistent on these instances | Finite S excluded from generator conclusion |
| §2.4 added Check | φ=(1,0), matrix units on two coordinates | φe₁₂=(0,1); φe₁₂e₂₁=(1,0)=φe₁₁; φe₂₂=0 | Consistent on these instances | Right precomposition action pinned |
| §7.3 added Check | same matrix retract under reconstruction | (φ·e₁₂)·e₂₁=(1,0); opposite product would give 0 | Consistent on these instances | Right action witness repeated |
| Convention: size and topology | ∅, point, pair; an uncountable discrete space | free ranks 0,1,2; uncountable discrete space is not compact or second countable | Consistent on these instances | Actual small light site retained |
| Convention: tensor unit and symmetry | ranks 2,3; two degree-one generators | tensor rank 6; symmetry −1 versus unsuspended +1 | Consistent on these instances | Sphere unit retained |
| Convention: degree and shift | cochains ℤ in degree 2; shift [1] | π₋₂=ℤ before shift, π₋₁=ℤ after shift | Consistent on these instances | π_k=H^(−k) |
| Convention: sphere versus Hℤ | 𝕊 and Hℤ | π₁=ℤ/2 versus 0 | Consistent on these instances | No integer-linear replacement of the sphere |
| Convention: animation | free symmetric square over 𝔽₂ | H₁(BΣ₂;𝔽₂)=𝔽₂; animated polynomial π₁=0 | Consistent on these instances | No positive-characteristic algebra equivalence |
| Convention: shift direction | e₀,e₁ | σ*e₀=0, σ*e₁=e₀; inverse on e₁ is e₀+e₁ | Consistent on these instances | Left coefficient shift retained |
| Convention: product comparison domain | e_n in ∏ℕℤ | coordinatewise limit 0; not eventually 0 in the discrete product group | Consistent on these instances | Specified δ(product)→product(δ) domain |
| Convention: sphere-linear sections | constant-term section mod t | s(t·1)=0 and t·s(1)=t | Consistent on these instances | No A-linearity inferred |
| Convention: spherical monoid polynomial | r=0,1,2; t modulo t² | ranks 0,1,2; t·t=0 mod t² | Consistent on these instances | Distinguished from free spectral CAlg |
| Convention: scalar cofibers | a=1 and a=0 | B=0 and A⊕ΣA; J for a=1 is marked id:A→A | Consistent on these instances | No division by a_r |
| Convention: ideal direction | t²A→tA→A | marked image t²x on both paths, abstract transition ×t | Consistent on these instances | Reverse profile order retained |
| Convention: prime quotient transition | H𝔽_p with p=2,3 | cofiber X⊕ΣX; transition diag(id,0), limit X | Consistent on these instances | (p,id) transition retained |
| Convention: completed prime unit | p=2,3 | π₀ ambient unit ℤ; completed units ℤ₂,ℤ₃; 1↦1 | Consistent on these instances | Completed codomain unit retained |
| gap:cardinal-interchange | κ=ω₁,J=ω₁,K=ℕ; threshold diagram | after α≥ω all coordinates present, so both sides ∏ℕHℤ | Consistent on these instances | Abstract supplier extension explicit |
| gap:light-countable-ab6 | B_j=ℚ; factorial subgroups | independent choice n_j=j+1 includes (1/(j+1)!); diagonal bounded n omits it | Consistent on these instances | Independent index product retained |
| Layer 1 Examples | empty and disjoint pair | values 0 and X(*)²; shift n↦n+1 fixes ∞ | Consistent on these instances | Retained |
| Layer 2 Examples | solid sphere; integer image of G | π₁ sphere ℤ/2; π₀ Hℤ⊗■G=ℤ^ℕ | Consistent on these instances | Retained |
| Layer 3 Examples | rank 2 tensor rank 3; polynomial multiplication | rank 6; t₁,t₂ both map to t | Consistent on these instances | Retained |
| Layer 4 Examples | finite-support filtration of ℤ^ℕ | left ℤ^(ℕ), right ℤ^ℕ; all-one vector only on right | Consistent on these instances | Retained |
| Layer 5 Examples | 𝕊[[t]] quotients r=0,1,2 | ranks 0,1,2; single infinite block permits all coordinates | Consistent on these instances | Retained |
| Layer 6 Examples | id and zero differential | cofibers 0 and M⊕ΣM; prime unit π₀=ℤ_p | Consistent on these instances | Retained |
| Layer 7 Examples | trivial structure; topological ℚ_p with f=p⁻¹ | reflector id; p^n−p⁻¹p^(n+1)=0 with b₀=1 | Consistent on these instances | Retained |
| Downstream Habiro example | factorial stages n=1,2 | polynomial degrees 1 and 3, hence free ranks 1 and 3; section s(q·1) can differ from q·s(1) | Consistent on these instances | Arithmetic computation stays in consumer |

The zero ring, zero module, empty index, rank 0/1/2, identity maps, p=2/3, characteristic two and square-zero coefficients are covered explicitly. Additive coefficients are abelian by construction; nonabelian additive groups such as S₃ are outside the signature. E₁ handedness is tested on a noncommutative matrix algebra rather than silently commuting its endomorphisms. Noncompact spaces and objects exceeding the fixed site size are outside the hypotheses; no cutoff equivalence on all condensed objects is asserted. There is no division by a scalar a_r, no out-of-range coordinate, and no claim that a zero cofiber equals an underived quotient. The only reciprocal scalar p⁻¹ is used in ℚ_p with p prime, hence nonzero. The formal reciprocal (1−t)⁻¹ is justified by constant term 1 and checked modulo t². Natural subtraction max(j−k,0) was computed at k=j and k>j, where its value is 0.

The two directions of each characterization were checked against its positive and negative models: δHℤ versus N/ℝ for solidity, f=j versus f=0 for properness, full versus zero analytic structures for completedness, and local versus nonlocal ℚ_p for summability. No conclusion is assumed as a hypothesis. The marked ideal maps and reflector units determine the comparisons; merely equivalent abstract categories or unmarked copies of A do not. Every route input is an owned target, a named supplier section or a pinned declaration. The spectral extensions of source proof steps are expressly targets here.

## Elaboration, binders, identifiers and dependencies

Ran lake env lean on packages/SolidAnalyticRings/Suggested.lean from the pinned content repository. Exit code 0. Exact sorry-warning count: 0. Other compiler messages: none (empty output). The file has no admitted theorem because every complete headline needs a missing carrier; no sorry warning is expected. No TauCeti import required a targeted build.

Performed the requested mechanical declaration/binder audit. The set of own declarations is empty, so the list of #check @name lines for own declarations is empty and no section variable can disappear. Elaborated one scratch audit file with import Mathlib and 25 #check @name lines for every distinct native library declaration named in the README. Exit code 0, no warnings or errors; output consists only of those 25 types. Compared the elaborated types with the prose: the convergent-sequence theorem retains R : Type and CommRing R, LightCondAb has Type 1, LightCondMod ties the ring/site universe, the ordinary discrete adjunction requires HasSheafify, the tower theorem retains IsLimit and epimorphic transitions, and basisOfPid retains IsPrincipalIdealRing, IsDomain and Finite basis index. No additional binder correction was needed after the prose fixes. Supplier target names IsReplete.countableProduct_epi, IsReplete.milnor, symmetricSpectra_towerComparison and animatedModules_discrete were resolved by their actual supplying roadmap sections; none is claimed to be a pinned theorem.

README identifier audit: zero own backticked Lean declarations, zero undeclared own identifiers, zero declarations assigned a supplier's fully qualified name. The remaining code spans are native library names or explicitly identified supplier targets. API facts and Checks are prose, with no padded Lean declarations.

The citation resolver found no unresolved cross-roadmap or Lean-name leads. Its external-library skip was covered independently by the 25 compiler checks and source reads above. The two design-stage leads for replete-topos names resolve to EnhancedDerivedSheaves E2.1 and E2.2; they are supplier targets. Consumer-side unverified section numbers were dropped as explained above.

Mechanical dependency check after the package edits: exit code 0. Exact output:

```text
depcheck: 27 roadmaps, 234 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. SolidAnalyticRings is in the supplied merge order immediately after VStackSheavesAndLisseCategories. Only earlier/main/new-folder suppliers are consumed. Neither the merge-order file nor any supplier file was changed.

Final structural audit: 27 numbered subsections and 27 Check blocks, 92 total Checks (the 89 design Checks plus three additions), a minimum of three Checks per block, and seven Examples/Dependencies pairs. Both TOML files parse; the nine source keys are unique. The exact supplier-gap sentences match the unchanged plan. Machine-path, forbidden-delimiter and undeclared-own-identifier scans pass, and git diff --check exits 0. Only the five requested deliverable files are added or changed; the design inputs are unchanged. All Lean and roadmap-search processes launched for this package have finished.
