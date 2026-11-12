<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13169#issuecomment-6787648387 -->
Review (codex) of cd885b3

Verdict: needs_changes

1. **F01** (P2) Algebraicity needs a specified algebraic group model

   **Location:** `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:1593`, §10.1: “Let σ ∈ Σ_L and G a locally L-analytic group” and “a finite-dimensional algebraic representation of g_(Σ_L∖{σ})”.

   **Claim:** The first condition, local σ-analyticity, makes sense for this general G. The second needs an algebraic group and its character lattice. A bare analytic group and its Lie algebra do not determine which finite-dimensional Lie representations are algebraic. Layer 10's introductory GL_n setting does not resolve the explicit generalisation to arbitrary G in this sentence. The same missing choice enters the defined subspace Ext¹_σ.

   **Witness:** Take L=E=ℚ₃(√3), τ≠σ, G=1+3O_L, χ(g)=τ(g). Relative to j₁(g)=g its τ-weight is 1; relative to j₂(g)=g² it is 1/2. Only the first is an integral torus weight.

   Both j₁ and j₂ identify this same L-analytic group with the same open subgroup of 𝔾_m(L): log identifies it with 3O_L, and multiplication by 2 is invertible there. For the second identification, a rational character of 𝔾_m has derivative m∈ℤ, so its pullback has derivative 2m. It cannot equal χ's derivative 1, since 2m=1 has no integer solution. Thus the unspecified model changes the proposed predicate on an actual one-dimensional, admissible analytic representation. DING25 line 1936 specifies GL_n(K); lines 1938–1939 use its algebraic Lie representations. That passage does not supply the asserted arbitrary-group version.

   **Exact repair:** Keep local σ-analyticity and D_σ(G,E) for arbitrary locally L-analytic G. Before defining algebraicity away from σ and Ext¹_σ, fix a connected split reductive algebraic group 𝐆/L and its specified algebraic-chart identification G=𝐆(L), or a specified open subgroup. Require each finite-dimensional cyclic Lie module to be the differential of a rational representation of ∏_(τ≠σ) 𝐆⊗_(L,τ)E, using its character lattice. Use ReductiveGroups Layer 1 and the algebraic-weight convention of Layer 4 here; retain GL_n as the application, not as a replacement for the general split reductive definition. Add a discriminating Check with a fixed torus model: weight 1 is allowed, weight 1/2 is excluded, even though both integrate analytically on 1+3O_L. The computation 2m=1 above tests the repair and excludes the wrong model. No new supplier gap is necessary.

One new finding, P2. Both findings of round 4 are repaired. The package's Lean file elaborates without warnings, and the dependency check reports no problems. No author file or source-manifest entry was changed.

## Verified sound

### Previous findings, checked first

Locations below are in `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md`.

| Round-4 finding | Repaired passage | Status and verification |
|---|---|---|
| F01: character on all of ℚ_p | Lines 334–336 separate the ℚ_p distribution example from “For p odd and G = ℤ_p” and say the character does not extend to ℚ_p. | **Repaired.** At p=3 the compact-domain values are 1,4,16 at 0,1,2. An extension would require χ(1/3)³=4, whereas unit cubes modulo 9 are 1 or 8. The strengthened finite-E assertion also holds: an infinitely p-divisible element of E× has valuation zero and trivial component in its finitely generated pro-p unit group; the remaining subgroup is prime-to-p torsion. |
| F02: Bernstein map variance | Line 109: “The morphism 𝒥_w : X_w → Spec 𝒵”; “𝒥_(w_1)^* = p_u^* ∘ 𝒥_(w_2)^*”. Section 8.8 uses these domains. | **Repaired.** For u=(123), parameters (2,4,8) become (8,2,4). Both give symmetric coordinates (14,56,64); deforming 2 to 2(1+ε) gives tangent (2,24,64), with the deformation moved to coordinate 2. Both the space and ring compositions now type correctly. |

The added θ contract was checked separately: θ maps smooth self-extensions to the Bernstein tangent space and is required to be injective, with θκ_w=d𝒥_w at w(φ). That extra assertion is expressly a supplier contract; CEGGPS Lemma 3.22 is cited for the invariant-function description, not presented as a proof of every part of the expanded contract. The README and plan carry the same slug and mathematical requirements. At (2,4,8), the logarithmic-coordinate Jacobian of the symmetric quotient has determinant −3072, nonzero in ℚ₃. For two parameters it is ab(a−b); the repeated-parameter value is zero, showing why the genericity condition matters.

The repaired patterns were sought throughout the file. The exponential characters in §§0.2, 0.5, 2.5 are on ℤ_p for odd p; the exponential disc example in §3.3 is on ℤ_p+p𝔻 for odd p; the single-disc comparison in §3.8 retains the smaller stage group. No other character was extended to all of additive ℚ_p. The Bernstein maps, their pullbacks, tangent basepoints, permutation convention and §8.8 Check agree. Earlier repaired split-Cartan, unipotent-difference and small-disc group-action patterns remain repaired.

The two older settled items were reconsidered, not counted again. Round-3 F05 remains **not repaired, settled as not actionable in this package**: the unrestricted non-A small-prime irreducibility theorem was identified as requiring a human scope decision, not a routine repair. No evidence overturns that reason. Round-3 F06 remains **partly repaired globally, settled as not actionable here**: this package expressly owns general category O, while the later Springer head still constructs overlapping modules. Its correction belongs to that later package; the ownership direction here is correct. Neither qualification is silently treated as a proved general theorem or as globally resolved duplication.

### Seeded source audit

All 15 sampled targets were checked against readable cached primary sources, including hypotheses, page boundaries, signs and directions. Pages are those of the version named in the README. Supplementary settled books are separately qualified below.

| Sampled target | Passage opened | Result |
|---|---|---|
| 1.2 Strong admissibility and irreducibility | EM17 lines 5886–5906, Definition 6.2.1/Proposition 6.2.2, p.117; ST03 line 407, Corollary 3.4(iv), p.10; line 542, Lemma 3.9, p.14; line 1416, Theorem 6.6, pp.35–36 | Compact-type hypothesis retained; abstract simplicity is claimed only for compact G. Noncompact statement uses coadmissible/closed submodules. Theorem 6.6's two directions straddle pp.35–36. |
| 1.6 Locally algebraic representations | ST01 lines 519–558, Proposition 3.4 and proof, pp.13–14; EM17 lines 4364–4387, Proposition 4.2.10, p.85; lines 6163–6203, Propositions 6.3.6/6.3.10, pp.123–124; ST03 line 1416 | Connected split group, absolute irreducibility, compact type and the separate admissibility/topology assertions are preserved. The highest-weight route uses differences of translates. |
| 1.8 Ext¹ classifies admissible extensions | BR19 lines 395–445, Lemme 2.1.1, pp.10–11; DING25 lines 1453–1465, §3.1.1, p.36 | Canonical coadmissible topology and strict dual sequences support the identification; the Ext order is reversed by the contragredient dual. |
| 2.3 Derived analytic vectors | PAN22 lines 426–465, §2.1.1, pp.10–11; lines 498–523, Lemmas 2.1.5/2.1.8, p.12; lines 533–549, Definition 2.2.1, pp.12–13 | Ordered uniform coordinates, stage groups G_n, diagonal action and direct limit of continuous cohomology agree. See the source translation slip below; the package uses the correct stage group. |
| 2.4 Long exact sequence | PAN22 lines 550–570, Lemma 2.2.2, p.13 | Strict exact Banach sequences and the bounded-complex/resolution qualifications are retained. |
| 3.2 Solid representations of Stein groups | BCGP25 lines 1000–1043, §§2.2.15–2.2.19, pp.21–22 | Completed solid coaction, counit/coassociativity and distribution-algebra action are correctly distinguished from Banach comparison, whose quasi-compact hypothesis occurs in §3.3. |
| 5.1 Locally analytic induction | EMJ2 lines 977–1004, Proposition 2.1.2, p.21; BR16 lines 349–393, Lemma 2.2/proof, pp.9–10 | Admissible, strongly admissible and very strongly admissible cases match. BR16's finite-dimensional algebraic coefficient case supports the dual pairing; the general compact-type completion uses the named tensor/function-space route. Unnormalised right translation is consistent. |
| 5.3 Torus Ext | DING25 line 416, §2.1, p.10; lines 779–780, (2.17), p.19; lines 1604 onward, proof of Lemma 3.5, p.40 | Distinct-character central separation and additive-character self-extensions agree. The dimension n+d_L is correctly restricted to n≥1; the n=0 value is 0. |
| 5.4 Unipotent homology | SCH11 lines 1157–1173, Remarque 3.9, printed p.68; lines 1766–1804, Corollaire 4.9 and (4.40)–(4.42), p.82 | Topological bar homology and its Hausdorff finite-dimensional algebraic comparison are used, not an unsupported identification with abstract dual Tor. |
| 7.6 Breuil adjunction | BR15 lines 518–542, Proposition 4.2, pp.13–14; lines 590–666, Théorème 4.3/Remarque 4.4, pp.14–16; BHS19 lines 3702–3728, (5.9)/Lemma 5.2.1, printed pp.391–392 | Conversion from sum to averaged Hecke action accounts for δ_P⁻¹ in the Orlik–Strauch input. Algebraic dual and very strong admissibility hypotheses remain explicit. |
| 8.3 Principal series and C(w,u) | DING25 lines 1475–1497, §3.1.2/Proposition 3.1, p.37 | λ=h−θ, η, opposite Borel and category-O negative weight versus positive inducing weight agree. The roadmap correctly avoids the later source's sign slip. |
| 8.8 Self-extensions | DING25 lines 1539–1603, Proposition 3.3 and (3.5), pp.38–40; CEGGPS lines 1900–1935, Lemma 3.22, p.47 | Dimensions n+d_L and smooth dimension n agree; the repaired geometric variance and extra θ contract are as checked above. |
| 8.12 Ext¹(π_alg,π₁) | DING25 lines 1659–1701, Proposition 3.8, pp.41–42 | Exact sequence, sum-surjectivity and n+(2^n−1)d_L agree. The package uses all n indices, correcting the source's subset typo. |
| 9.2 Parabolic constituents | DING25 lines 1733–1789, Lemma 3.10, pp.43–44 | Subset labels follow the specified filtration, including nonstandard orderings; inverse images, singleton grades and block twists are consistent. |
| 10.7 σ-analytic endpoint amalgamation | DING25 lines 2054–2059, Proposition 3.20, p.51 | Both exact sequences and the endpoint n≥2 restriction agree. R01 concerns the general foundational wording of §10.1, not this GL_n theorem. |

The manifest contains 29 distinct works: 26 certified, three settled uncertified. The reference list and cited keys agree. There is no additional author-flagged unverified locator requiring a source request. No source was fetched or added. No source passages were copied into the package or this report.

### Computed adversarial pass

All 86 numbered targets, their API statements, conventions, Needs lines and 308 Checks were read. Only explicit-valued rows of the previous review were used as inherited mathematical evidence; uncomputed summaries were not treated as checks. The compact table below covers every seeded target, the headline theorems, the repairs, R01 and additional convention controls. A finite calculation is a diagnostic, not a proof of a general source theorem.

| Statement | Instances | Computed values on each side / wrong model | Result; change |
|---|---|---|---|
| 0.1 field splitting | L=ℚ₂(√2), splitting E; trivial group | √2⊗1 maps to (√2,−√2); dimension 2=2. Trivial Lie dimension 0=0 | Characteristic-zero and splitting assumptions matter; no change |
| 0.2–0.4 action/dual convention | S₃ permutation representation; χ on ℤ₃ | ρ(12)ρ(23)e₃=e₁, reverse=e₂. dχ=log4, dual derivative=−log4 | Nonabelian order and contragredient sign distinguished |
| 0.4 noncompact distribution | Discrete ℤ, H=1 | Functions E^ℤ, distributions E[t,t⁻¹]; δ₁δ₂=δ₃, not δ_−3 | Product/sum and convolution agree |
| Repaired Layer-0 example | ℤ₃ versus ℚ₃ | χ(0,1,2)=(1,4,16); a putative χ(1/3) requires cube 4, but unit cubes mod9={1,8} | F01 repaired; no recurrence |
| 0.6–0.9 duality, continuity, tensor | V=0,E²; E²⊗E³; discrete ℤ | Bidual dimensions 0,2; tensor dimension 6=2·3; (E^(ℤ))′=E^ℤ and bidual evaluation is identity | No noncompact nonreflexivity shortcut |
| 1.1, 1.3 noncompact anti-equivalence headline | G=ℤ,H=1; finite C₂,S₃; inclusion E→E² | E compact-open rank1; E[t,t⁻¹] infinite rank and excluded. Dual inclusion is E²→E of rank1 | Local finiteness and variance correct |
| 1.2 strong admissibility/irreducibility | G=1,V=0,E,E²; S₃ standard representation over ℚ₃ | Generator counts 0,1,2; irreducibility false,true,false. S₃ standard dimension2, no invariant line, dual likewise | Zero is excluded from irreducibility; no change |
| 1.2 noncompact distinction | Smooth Steinberg of GL₂(ℚ_p) | f↦f(0)−f(∞) is in full dual; its stabiliser fixes the ordered pair and is nonopen. Smooth contragredient is nonzero proper, yet dense | Abstract and closed-submodule simplicity correctly separated |
| 1.6 locally algebraic route | Sym², v=e₁e₂, t≠0, including p=2 | u(t)v=e₁e₂+t e₁²; (u(t)−1)v=t e₁². Mixed coefficient 1 versus 0 | Difference route works; single translate would fail |
| 1.6 decomposition | W trivial; multiplicity space E² | W⊗E² dimension2, with two trivial summands, not irreducible; W⊗E dimension1 | Absolute-irreducibility/multiplicity qualification retained |
| 1.8 Ext classification headline | G=ℤ₃; finite S₃ over ℚ₂ | Matrices [[1,a],[0,1]] multiply with corner a+b and give nonzero additive class; corner0 splits. S₃ averaging 1/6 exists, Ext¹=0 | Dual order and genuine extension classes agree |
| 1.9 dual numbers | V⊕V | ε(a,b)=(0,a), ε²=0, kernel=image={0}⊕V | Correct square-zero structure, no sorry'd data |
| 2.3 stage functors | Finite G with uniform subgroup1; G=ℤ₃ regular Banach | H⁰=B, H^i=0 for i>0. Indicator of 3^(n+1)ℤ₃ is analytic on level n+1 cosets, not on the single level-n disc | Direct limit is necessary; group at stage is G_n |
| 2.4 long exact sequence | Split trivial E→E²→E; c₀ diagonal p^n | Dimensions 1→2→1, connecting map0. Diagonal image contains truncations of (p^n) but not (p^n), whose preimage would be constant1∉c₀ | Strictness excludes the nonclosed-image control |
| 2.5 strong LA-acyclicity headline | Finite G; C(ℤ_p,E) regular Banach | Positive-degree stage maps0 for finite G; regular analytic vectors C^la and R^iLA=0 for i>0 | No replacement of stagewise vanishing by mere admissibility |
| 3.2 Stein coaction | G_m, weight2; zero coaction | c(e)=e⊗T², both iterates e⊗T²⊗T², counit=e. At2,3 values4,9 and36=4·9. Zero coaction counit0≠e | Laws determine action and exclude zero model |
| 3.7 Grothendieck headline | Group1, S=point; E^m↪E^(m+1) | Hom(E,E²)=E²; all kernels0, colimit ⊕_ℕE still kernel0 | Generator/exactness control agrees |
| 3.8 derived-comparison headline | M₀=ℤ₂,M_r=2ℤ₂,V=E | 1+0∉M_r. Single disc has2 idempotents; induced two-disc space has4. H⁰=E on both comparison sides | Stage group repair preserved |
| 4.1–4.4 algebraic/split weights | ℚ₃[t]/(t²−3); gl₂; torus | First module dimension2 but ℚ₃ weight-space sum0; after √3 extension two lines. Torus Verma dimension1; sl₂ M(0) factors L(0),L(−2) once each | Split-Cartan and algebraic-lattice conditions are substantive |
| 4.6, 5.4 nilradical homology | GL₂, Sym²; radical1 | Lower H₀ weight(2,0), H₁(−1,3); upper H₀(0,2), H₁(3,−1). For radical1 H₀=V,H_q=0 for q>0 | Root-line twist retained; cohomology formula cannot be used unchanged |
| 5.1 induction | P=G; W=E²,p=diag(3,1),w=e₁ | Evaluation inverse u↦(g↦gu) gives U. Tensor formula at p gives f(p)⊗3e₁, not f(p)⊗e₁ | Right translation, tensor action and compactness conditions agree |
| 5.3 torus Ext | (n,d_L)=(0,1),(1,1),(2,2) | Full Hom dimensions0,2,6; smooth0,1,2; g′ dimensions0,2,4. χ′=χ\|·\| has equal derivative but at uniformizer values1,1/3 | Distinct central characters still give Ext=0; rank0 handled |
| 5.5 Schraen headline | P=G; GL₂ trivial algebraic input | For P=G only H₀=V remains, spectral sequence reduces to Ext^r(V,U)=Ext^r(V,U). Lower H₁ has weight(−1,1), unlike trivial weight(0,0) | No unshifted/homology-free spectral-sequence shortcut |
| 6.4–6.6 Orlik–Strauch headlines | GL₂, λ=(1,1); P=G | Lower M(−λ) length2 with reflected simple weight(0,−2); generic principal series has2 constituents and socle length1. At P=G, one algebraic factor remains | Low-rank multiplicities agree; non-A small primes remain settled qualification |
| 7.4, 7.6 adjunction headlines | GL₂,N₀=N(ℤ_p),m=diag(p,1); Q=G | Index p, δ_B=p⁻¹; sum action on trivial line p, average1. At Q=G modulus1, both sides reduce to same Hom | δ_P⁻¹ conversion and adjunction domain agree |
| 8.3 principal-series weights | n=2,L=ℚ₃,h=(1,0),t=diag(2,3) | λ=(1,1); η(t)z^λ(t)=(1/3)·6=2; z^h(t)ε(3)=2·1=2. Reflected weight(0,2) has central exponent2, negative would give−2 | Normalisations and sign correct |
| 8.8 self-extension headline input | (n,d)=(1,1),(2,1),(3,2) | Ext dimensions n+d=2,3,5; smooth subspaces1,2,3 | Matches valuation/log decomposition |
| Repaired Bernstein contract and §8.8 | n=3,p=3,u=(123),parameters(2,4,8) | Permuted(8,2,4); quotient(14,56,64) both sides; tangent(2,24,64) both sides; determinant−3072≠0 | F02 repaired in contract, route and Check |
| 8.11 ζ_w bijection headline | n=2,d=1,2 | Source/target dimensions4,6; algebraic weight(1,1) differs from H₁ weight(0,2), so intervening Hom=0 | Correct full analytic character space |
| 8.12 Ext dimension headline | (n,d)=(1,2),(2,1),(3,1),(3,2) | n+d+(2^n−2)d=3,5,10,17=n+(2^n−1)d; n=2,d=1 sum source8,target5,kernel3 | Sum of ζ's is surjective, not injective |
| 9.2 parabolic constituent labels | n=3,blocks(2,1); standard and order(3,1,2) | Standard labels {1},{2},{1,2}; reordered labels {3},{1},{1,3}. P=B has n−1 labels; P=G has all2^n−2 | Filtration, not numerical order, determines labels |
| 9.5 first-order tensor route | Three extensions A_i by B_i, dim A_i=1,dim B_i=2 | First-order kernel dimension Σ_i 2·1·1=6; wrong one-A/two-B formula gives12 | Package's corrected tensor layer excludes source slip |
| 9.6 parabolic bijection headline | n=3,blocks(2,1),d=2 | Source (2+3·2)+(1+2)=11; target3+4+4=11 | Block formula and character directions agree |
| 9.7 endpoint headline | n=2,3,d=1 | Ext dimensions4+4−3=5;7+7−4=10. n=1 has zero-sized endpoint block | n≥2 is explicit |
| 10.1, R01 | L=ℚ₃(√3),G=1+3O_L,χ=τ; identifications j₁,j₂ | Weights1 versus1/2; rational character pullbacks have derivatives m versus2m; 2m=1 has no integral solution | Missing algebraic model; repair R01 |
| 10.5 embedding decomposition headline | n=3,d=2; n=2,d=2 | 3+2(10−3)=17;2+2(5−2)=8, equal full Ext dimensions | Quotient by smooth dimension n is necessary |
| 10.7 σ endpoint headline | n=2,3; any d | Per-σ dimensions4+4−3=5 and7+7−4=10; n=1 excluded | Exact sequence agrees with source and §10.5 |

These tests include zero and trivial objects, rank zero where meaningful, p=2 and 3, ramified L, noncompact groups, a nonabelian finite group, square-zero coefficients, reversed duals, inverse permutations and nonclosed maps. Positive characteristic, zero coefficient ring, inseparable L and q=1 are excluded by the actual finite-extension-of-ℚ_p standing hypotheses, not silently evaluated as permitted inputs. Endpoint statements separately require n≥2.

### Lean acceptance, headlines and pinned declarations

The prescribed `lake env lean` command was run from the content checkout on the package's absolute file argument. It exited **0, with no output or warnings**. There is only `import Mathlib`; no Tau Ceti object build was needed. The file has **zero local declarations and zero sorried theorems**. Consequently the exhaustive one-tactic probe and exhaustive `#check @name` signature comparison each have zero inputs. No synthetic boundary theorem was introduced to pad these checks.

| Headline in the README summary | Docstring coverage in `packages/LocallyAnalyticRepresentationsOfLocalGroups/Suggested.lean` |
|---|---|
| §§1.3,1.8 noncompact anti-equivalence and Ext¹ classification | Lines 11–23: lacks general topologised analytic functions, D(G,E), analytic representations and coadmissible modules. |
| §2.5 Pan strong LA-acyclicity | Lines 24–27: lacks p-valued analytic stages and admissible Banach category. |
| §§3.7–3.8 solid Grothendieck property and derived comparison | Lines 28–31: lacks analytic E-ring, solid E-spaces and solidified group rings. |
| §5.5 Schraen spectral sequence | Lines 32–37: lacks analytic induction and topological nilradical homology. |
| §§6.4–6.6 Orlik–Strauch irreducibility/Jordan–Hölder | Same bullet: lacks parabolic category O and the actual functor. |
| §§7.4,7.6 Emerton/Breuil adjunctions | Lines 38–40: lacks analytic Jacquet, closed induction and very strong admissibility. |
| §§8.11–8.12 ζ_w and full Ext dimension | Lines 41–46: lacks actual π_alg,π₁,principal-series and Ext carriers. |
| §§9.6–9.7 parabolic bijections/amalgamation | Same application bullet: parabolic maps on those missing representations. |
| §§10.5–10.7 embedding decomposition and parabolic specialisations | Same bullet: decomposition over embeddings on actual representation Ext. |

No statable headline was found missing or forced through a stand-in. An arbitrary vector space with the stated dimension, or an arbitrary Ext module satisfying a predicate, would not state these theorems. Layer 4 is supporting Lie theory, not an excuse to replace the analytic headlines by existing Verma-module lemmas. No backticked identifier attributed to this roadmap lacks a declaration: there are no claimed local Lean declarations. Supplier/library names were resolved separately.

The following declarations and their binders were opened at the pins. These are positive near-carrier checks, supplementing searches by object for coadmissibility, Fréchet–Stein structure, category O, analytic induction, Jacquet and solid analytic coefficients.

| Pinned file and line | Scope verified |
|---|---|
| `Mathlib/CategoryTheory/Abelian/Ext.lean:41` | Root Ext needs an R-linear abelian category with enough projectives; it does not construct the desired category. |
| `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118` | CategoryTheory.Abelian.Ext uses HasExt, binder at113. |
| `Mathlib/Algebra/Category/ModuleCat/Basic.lean:59` | Fields include carrier, additive group and module; no topology or admissibility. |
| `Mathlib/RepresentationTheory/Continuous/TopRep.lean:31` | Continuous representation/topological module; no Hausdorff, compact type or analytic orbit condition. |
| `Mathlib/Analysis/LocallyConvex/Barrelled.lean:90`,122,164,192 | BarrelledSpace is continuity of lower-semicontinuous seminorms; Baire instance and both Banach–Steinhaus forms work over nontrivially normed E. |
| `Mathlib/Topology/Algebra/Module/LocallyConvex.lean:51` | LocallyConvexSpace has ordered scalar assumptions; it is not the missing nonarchimedean lattice comparison. |
| `Mathlib/Algebra/DualNumber.lean:46`,50 | Actual trivial square-zero extension and eps. |
| `Mathlib/Algebra/Lie/UniversalEnveloping.lean:65`,92 | Enveloping quotient and universal lift, not category O. |
| `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:131` | Continuous cochain cohomology, no analytic-stage functor. |
| `Mathlib/Geometry/Manifold/Algebra/LieGroup.lean:72` | Manifold group laws, no locally analytic representation category. |
| `Mathlib/Topology/MetricSpace/Ultra/Basic.lean:47` | Ultrametric inequality alone, no separation axiom. |
| `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145` | Integral inverse-limit completed group algebra, not D(G,E). |
| `TauCeti/Algebra/Lie/HighestWeight/Verma.lean:195`,525; binders140 | VermaModule and irreducibleQuotient for finite-dimensional Killing Lie algebra in characteristic zero with Cartan/triangular data. |
| `TauCeti/NumberTheory/Padics/Distribution/AnalyticStage.lean:107` | One-variable coefficient stages on ℤ_p. |
| `TauCeti/NumberTheory/Padics/Distribution/LocallyAnalytic.lean:45`,comment31 | Algebraic direct limit explicitly lacking topology. |
| `TauCeti/RepresentationTheory/CharacterTable/GL2/PrincipalSeries/Basic.lean:235`,240 | Near-match GL2PrincipalSeries is over a finite field with complex coefficients, not a locally analytic principal series of GL₂(L). |

### Suppliers, duplication and merge order

The board index, citation lead and overlap facts were read. Suppliers on main were read there; new open roadmaps were inspected at their provided heads using the roadmap service. Object searches used `roadmaps grep`, the available board packages and both pinned libraries. No missing declaration was inferred from an unsearched checkout.

| Supplier/head | File and resolved locations | Result |
|---|---|---|
| LocallyAnalyticDistributions #854 | `TauCetiRoadmap/LocallyAnalyticDistributions/README.md:895`,988,1093,1107,1135 | §§0.0,0.2: lattice functional analysis, tensor comparison, Hahn–Banach, open mapping, compact-type extensions. Native barrel comparison and strict tensor exactness remain declared extensions. |
| LocallyAnalyticDistributionsPartII, board | `packages/LocallyAnalyticDistributionsPartII/README.md:141`,164,248 | §§1.1,1.2,2.5: enveloping embedding, crossed products, Arens–Michael envelope. The resolver's sole missing-roadmap lead is false for this readable earlier package. |
| NoncommutativeAndEquivariantIwasawa #1307 | `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:150`,177,209,303,333 | §§0.1–0.3,0.6–0.7: uniform groups, finite freeness, coordinates and p-valuations. Dyadic valuation offset2 retained. |
| PadicLocalLanglandsForGL2Qp #1312 | `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:205`,217,219,228,749,1587 | §0.1 foundations and §§2.4,4.8 GL₂ specialisations exist. General noncompact and split-group extensions here have separate scope. |
| CompletedCohomologyPartII #1035 | `TauCetiRoadmap/CompletedCohomologyPartII/README.md:183`,241 | F.1 and F.4 supply unitary category and analytic/derived vector constructions. Pan's strong stagewise acyclicity is additional here. |
| OverconvergentAutomorphicForms #1422 | `TauCetiRoadmap/OverconvergentAutomorphicForms/README.md:315`,357,361,374,376,390 | §0.6 character spaces, essential admissibility, finite slope and Jacquet functor imported. Averaged Hecke scalar on trivial line is1, matching the package. |
| ReductiveGroupsPartII, main | `TauCetiRoadmap/ReductiveGroupsPartII/README.md:640`,5834,6289,6304 | RG2.0.2 charts/topological points, RG2.4.2 Iwahori, RG2.4.4 Iwasawa and compact parabolic quotient. |
| SmoothRepresentationsOfLocalGroups #1688 | `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:623`,643,704,871,932,1677,1858 | Smooth/admissible categories, smooth vectors, Grothendieck property and central Ext separation. |
| Same smooth supplier | Same file:1918,1937,1981,1991,2047,2095,2116,2193,2207 | Induction, compact induction, exactness/stages, modulus, Jacquet and invariant comparison. The principal-series Jacquet statement is complex; the finite-E use is covered by the explicit gap. |
| Same smooth supplier | Same file:2624,2691,2799,3002 | Finite length, generic locus, Bernstein centre and Steinberg. Finite-E generic intertwiners/tangents are additional contracts, not claimed already supplied. |
| ReductiveGroups, main | `TauCetiRoadmap/ReductiveGroups/README.md:1030`,1230,2253,4143 | Rational comodules, Lie algebra, parabolics and §10B highest weights. In particular this supplier provides the model R01 needs to name. |
| LieHighestWeight, main | `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:405`,537,567,931,1432 | PBW/Verma, finite-dimensional classification, complete reducibility, Harish-Chandra and reductive decomposition. General split-field/parabolic category O is additional. |
| ArithmeticLocallySymmetricSpaces #871 | `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md:3593` | ALS.4.5 uses arithmetic Weil restrictions; arbitrary split reductive Kostant is explicitly a gap. |
| VStackSheavesAndLisseCategories #1230 | `TauCetiRoadmap/VStackSheavesAndLisseCategories/README.md:656`,700,733 | VS2.1 derived solid tensor and VS2.2 analytic coefficients exist. Classical locally convex comparison belongs to this consumer. |
| AdicSpacesPartIII, main | `TauCetiRoadmap/AdicSpacesPartIII/README.md:10053`,10126,10139 | R3.4 quasi-Stein definition and Theorems B/A, with complete-field/coherent hypotheses. |
| PadicMeasuresIwasawaAlgebras, main | `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:909` | §1.7 integral measure/completed-group-algebra comparison; its countable quotient tower is available for compact p-adic analytic groups. |
| CompletedCohomologyAndLocalGlobalCompatibility #1270 | `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/README.md:7`,233,241 | Arithmetic comparisons; imports averaged analytic Jacquet. No second ownership of the general local Ext theory. |
| TriangulineVarietyAndItsLocalModel #1829 | `TauCetiRoadmap/TriangulineVarietyAndItsLocalModel/README.md:7`,115–123 | Geometry consumes this roadmap's LR.4/LR.5 objects. The compatibility numbering table resolves those citations. |
| PadicHodgeParametersInLocallyAnalyticRepresentations, board | `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/README.md:20`,30 | Owns the Galois/analytic comparison, explicitly imports the local analytic theory through LR.0–LR.9; the numbering map preserves these citations. |
| SpringerResolutionAndCharacteristicCycles #1828 | `TauCetiRoadmap/SpringerResolutionAndCharacteristicCycles/README.md:1214`,1216,1222 | Still overlaps on general Verma/simple/classification objects. This is settled external F06, not a new repair assigned to this package. Strict central reduction/localisation belong there. |

The overlap facts contain no dropped supplier id, revision-only numbering dependency, unmapped dropped local id or conflicting head changing this roadmap. Closest heads were examined by scope and object; the category-O qualification above is not hidden by that mechanical result. Existing main roadmaps are imported, and this package is not a re-plan of one of them. No fully qualified Lean declaration is duplicated because Suggested.lean declares none.

All 86 Needs lines and supplier citations were read. The prescribed dependency check returned exactly:

```text
depcheck: 236 roadmaps, 2145 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line appeared. The section-level checks supplement this graph check. R01 requires no upward edge or ownership move.

### Declared gaps and shape

All nine slugs match between `packages/LocallyAnalyticRepresentationsOfLocalGroups/design/plan.json` and the README's Exact supplier contracts. Each has a named earlier supplier, precise hypotheses and a cohesive missing interface. None requests a native theorem without identifying the genuinely missing comparison or extension.

| Gap | Minimal unsupplied content |
|---|---|
| barrelled-banach-steinhaus | Lattice/native barrel and boundedness comparison plus compact-type/inductive-limit barrelledness; native Banach–Steinhaus itself is already cited. |
| compact-type-tensor | Functorial strict exactness, beyond an existing tensor carrier/comparison. |
| kostant-split-reductive | Arbitrary split connected reductive group, beyond arithmetic Weil restrictions. |
| generic-principal-series-finite-coefficients | Explicit generic criterion, absolute irreducibility, End=E, rational intertwiners. |
| principal-series-jacquet-finite-coefficients | Finite-E direct sum with opposite-Borel modulus conversion. |
| finite-length-finite-coefficients | Finite-E induction finite length and coefficient-extension compatibility. |
| ordered-character-map | Ordered parameter spaces, quotient variance, and injective self-extension tangent comparison. |
| frechet-stein-general | General coadmissible-system theory and canonical topology/closedness/change of ring. |
| radius-algebras | Saturated p-valued coordinate expansions, norms and identified noetherian Banach stages. |

The gaps are contracts, not findings for being absent today. The verdict is not accepted, so no conditional acceptance is recorded.

There are **11 layers, 86 numbered targets, 86 Needs lines, 86 Checks blocks and 308 Check bullets**, with at least three per target. Definitions retain prose API lists. All layers end in Examples and Dependencies. The summary, ownership, conventions, exact contracts, build explanation, downstream consumers and references are present. ReductiveGroups, AdicSpacesPartIII and PadicMeasuresIwasawaAlgebras on main were read for house shape. The plan works backwards from Ext/adjunction applications: independent Lie theory feeds induction and constituents; Levi-block applications require Layer 8; embedding specialisations require Layers 8 and 9. No layer is named after a source chapter or ordered by an asserted source-following policy. The former-numbering table preserves consumed ids and is not an API catalogue.

No computational algorithm, copied source passage, machine path, pull-request/process residue, instruction embedded in source text, HTML anchor, sorry'd data, `set_option`, or unsupported local backticked Lean name was found in the reviewed package. R01 is a missing mathematical choice, not a Lean elaboration error.

## Not verifiable

- **SCHN11**, *p-Adic Lie Groups*: settled uncertified. Book locators cannot be text-certified from the provided cache; the named analytic-chart supplier was checked. No repeat source request.
- **NFA02**, *Nonarchimedean Functional Analysis*: settled uncertified. Book locators cannot be text-certified; the pinned barrelled/Banach–Steinhaus declarations and locally convex supplier were opened. No repeat source request.
- **HUM08**, *Representations of Semisimple Lie Algebras in the BGG Category O*: settled uncertified. Book chapter locators cannot be text-certified; accessible OS15 and low-rank computations supply the stated cross-checks. No repeat source request.
- The all-prime non-A Orlik–Strauch irreducibility theorem remains the settled human scope issue F05. This review does not certify it. The later Springer package's duplication remains the external settled item F06, with its current witness given above.

All 15 seeded targets had readable primary-source material. No source-cache or Lean command required for this review was unavailable. No process was left running.

## Source issues

- **Misprint** in PAN22 at §2.1.1, p.11 (PAN22 lines 463–465): the source says translations by G₀ preserve functions on G_n; it should be translations by G_n, since translating 0 by 1 leaves 3ℤ₃; affects a stated result.
- **Error** in OS15 at §2.5 after Example 2.7, p.8 (OS15 lines 315–325): the source says parabolic conditions imply membership in O and include all finite-dimensional semisimple modules at p=g; it should be split Cartan semisimplicity over the coefficient field is also required; affects a stated result.
- **Misprint** in DING25 at paragraph after Proposition 3.1, arXiv v2 p.37 (DING25 line 1505): the source says the subset label is a forward image of the first i indices; it should be the inverse image, constant on the indicated left Levi-Weyl coset; affects a stated result.
- **Misprint** in DING25 at (3.1) and Lemma 3.2, arXiv v2 p.37 (DING25 lines 1509–1513): the source says the inducing character has negative reflected algebraic weight; it should be positive reflected weight, retaining the minus only on the category-O input; affects a stated result.
- **Misprint** in DING25 at Lemma 3.2(1), arXiv v2 p.37 (DING25 line 1511): the source says Hom is over the torus of ℚ_p-points; it should be over the torus of the local field's points; affects a stated result.
- **Misprint** in DING25 at proof of Proposition 3.3(2), arXiv v2 pp.39–40 (DING25 lines 1594–1601): the source says compose the ordered-torus permutation after the Bernstein map; it should be compose 𝒥_(w₂) after the permutation to obtain 𝒥_(w₁); affects the proof.
- **Misprint** in DING25 at (3.12), arXiv v2 p.41 (DING25 lines 1660–1663): the source says subsets range over the first n−1 indices; it should be all n indices, with cardinality i; affects a stated result.
- **Misprint** in DING25 at the construction between (3.25) and (3.26), arXiv v2 pp.45–46 (DING25 lines 1832–1841): the source says the first-order kernel has one algebraic factor and all remaining π₁ factors; it should be one π₁ factor and all remaining algebraic factors; affects the proof.
- **Misprint** in DING25 at the singleton sentence before Lemma 3.10, arXiv v2 p.43 (DING25 lines 1735–1736): the source says use the preceding cumulative position and its character; it should be the next positional weight and the character in the specified filtration grade; affects a stated result.
- **Misprint** in DING25 at the last paragraph of §3.1.3, arXiv v2 p.47 (DING25 line 1910): the source says the endpoint inductions use P₁ and P₂; it should be parabolics with Levi types (n−1,1) and (1,n−1); affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "cd885b3621f76774ecc3a73d9227194bf2dc23b7", "job": "REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~5", "model": "gpt-6-astra", "worker": "chris-8"} -->
