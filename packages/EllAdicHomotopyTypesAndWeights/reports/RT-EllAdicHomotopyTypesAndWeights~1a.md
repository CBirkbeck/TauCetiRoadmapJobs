<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1396#issuecomment-6398330704 -->
Red team round 1 pass a (codex) of 73d32d0

Verdict: needs_changes

1. **F01** (P1) Discrete continuity fails for forms on the supplied rigid étale type

   **Location:** packages/EllAdicHomotopyTypesAndWeights/README.md:485,508–510. “each form has open stabilizer.”

   **Claim:** Applying the forms functor to the supplied raw rigid étale type produces a continuous discrete Galois module at each finite coefficient exponent; finite skeletal width supplies finite descent data.

   **Witness:** For X=𝔸¹ over 𝔽₂, ℓ=3, choose one point in each Frobenius orbit of length 2ʲ. Its indicator in Ω₁⁰ has stabilizer contained in ⋂ⱼ2ʲℤ̂, which is not open.

   The supplier fixes this counterexample's carrier: packages/EtaleHomotopyTypes/design/README.md:735–759 indexes the connected components of a rigid cover by geometric points and explicitly allows infinitely many components. Rigid refinements preserve each label. For any simplicial set S, a relative linear zero-form is exactly a function S₀→𝔽₃: on a simplex it is Σᵢf(vᵢ)xᵢ. Thus the indicator above exists, and no rigid refinement identifies it with its changed Frobenius translate. For any open subgroup Nℤ̂ choose j>v₂(N); its element N moves the selected point in that orbit, changing the value from 1 to 0. Finite skeletal width does not make an infinite set of vertices finite. Weil-II's finite-type covering construction (weil-II line 3804) and continuity assertion (weil-II line 3831) do not justify replacing that construction by all rigid hypercovers.

   **Exact repair text:** “Construct a Galois-compatible pro-system of étale hypercovers with finitely many connected components in each simplicial degree, and a finite-coefficient cohomology comparison with the supplied rigid étale type. Apply relative forms to this finite-type presentation to define the representative carrying the finite-level discrete Galois action. Prove that its induced map to the algebra formed from the rigid type is a quasi-isomorphism after completion, rationalization and stabilization. Discrete continuity is asserted for the finite-type representative: finite skeletal width and finite component sets give open stabilizers. For the raw rigid-type form algebra assert only the induced algebraic action and its cohomological compatibility.” Make the replacement/comparison a named target before §4.2 and update §§4.1–4.4 to distinguish the representatives.

   **Repair test:** The indicator above remains a raw rigid-type form with nonopen stabilizer, so the repaired statement makes no continuity assertion about it. A form on a finite-type stage depends on finitely many components in finitely many degrees; intersecting their finitely many open stabilizers is open. All separated finite-type varieties remain in scope.

2. **F02** (P1) General ordinary-cohomology weight bounds are attributed to a supplier that does not state them

   **Location:** packages/EllAdicHomotopyTypesAndWeights/README.md:560–564,863. “Use the supplier’s bounds: degree i has weights in [0,2i]”.

   **Claim:** The named weight contracts supply the [0,2i] bound on ordinary cohomology of arbitrary separated finite-type schemes, including the H² bound used for relations over positive-characteristic bases.

   **Witness:** TauCetiRoadmap/DeligneWeightsAndPurity/README.md:2620,2668,3265 gives compact-support bounds, smooth ordinary bounds, and smooth SNC compactifications. The declared arbitrary-base-weight-filtration gap requests a filtration, not the general ordinary-cohomology bound.

   The supplier was read at its indexed current head. Its §7.14, absent from the package's citations, does supply the upper bound for smooth ordinary cohomology; §7.12 supplies the proper case via H=H_c. Neither states the nonsmooth, nonproper case. MotivicEtaleKTheory's declared hyperresolution extension is over ℂ, so it does not supply that positive-characteristic input. The proof paragraph's smooth proper hyperresolution does not specify an alteration/descent construction over arbitrary characteristic. The object searches in the named siblings, main, board designs, WeightsInEtaleCohomology and DeligneWeightsAndPurityPartII found no other owner supplying the missing bound.

   **Exact repair text:** Add to the DeligneWeightsAndPurity subsection and to plan.json's gaps: “What DeligneWeightsAndPurity must provide (gap:ordinary-cohomology-weight-bounds): For every separated finite-type scheme X over an algebraically closed field k, every prime ℓ invertible in k and every i≥0, the spread-independent filtration on ordinary Hⁱ_ét(X,ℚ_ℓ) satisfies Gr_w^W Hⁱ=0 for w<0 or w>2i, including when X is neither smooth nor proper.” Use supplier section “7.12–7.14, 8.24”. Cite §7.14 for the smooth upper bound, §7.12 for the proper bound, and this new contract in §§5.1 and 8.5. Keep the geometric comparison as the local target.

   **Repair test:** Over 𝔽̄₂, with ℓ=3, the product of a split nodal proper rational curve and 𝔾_m is singular and nonproper. Its H¹ weights are {0,2}, and its H² consists of two weight-2 lines. The new contract covers it and gives [0,4] in degree 2; neither smoothness nor properness is silently added. Dualizing the asserted H² range and intersecting with bracket weights ≤−2 still gives exactly {−4,−3,−2} in §8.5.

3. **F03** (P3) The DG-algebra localization is credited to the wrong section

   **Location:** packages/EllAdicHomotopyTypesAndWeights/README.md:51,153. “Layer 1 supplies … localization”.

   **Claim:** DGAInfinity Layer 1 supplies localization of the commutative DG-algebra category at quasi-isomorphisms.

   **Witness:** TauCetiRoadmap/DGAInfinity/README.md:293–315 contains DG carriers, enriched categories and modules, but no such localization. Mathlib/CategoryTheory/Localization/Construction.lean:106,111 supplies MorphismProperty.Localization and MorphismProperty.Q.

   **Exact repair text:** “DGAInfinity Layer 1 supplies DG algebras, morphisms, tensor products and cohomology. For the full subcategory selected by the supplied nonnegative commutative DG predicates, use Mathlib's CategoryTheory.MorphismProperty.Localization and CategoryTheory.MorphismProperty.Q, with the morphism property of inducing cohomology isomorphisms in every degree.” Replace the localization attribution in §0.1 and cite this pinned construction in §4.1's Needs line.

   **Repair test:** On the identity of K and on a↦2a in Λ_K(a₁), the cohomology maps are respectively 1 and 2, both invertible in characteristic zero. The localization inverts them without identifying the cohomology spaces or replacing CDGA morphisms by enriched DG functors.

4. **F04** (P3) Redundant and degenerate Checks do not discriminate the claimed laws

   **Location:** packages/EllAdicHomotopyTypesAndWeights/README.md:32,199,386,423,471,740. “Multiplication by t sends γ_n to (n+1)γ_(n+1).”

   **Claim:** These bullets provide discriminating Checks in addition to the corresponding interface laws.

   **Witness:** The elliptic Lie bracket is 0, homogeneous of every weight. For the zero complex, the finite torsion group H²=0 has Tor₁(0,𝔽_ℓ)=0. Lines 199,386,471,740 repeat the specified laws.

   The elliptic example tests dual generator weights but cannot distinguish bracket weight −2 from any other claimed bracket weight. Line 423 also needs nonzero torsion to conclude nonzero Tor; line 425 already provides that concrete example.

   **Exact repair text:** Replace the elliptic bracket clause on line 32 by “The elliptic Lie bracket is zero. For a nonzero bracket test use Λ(a₁,b₁,c₁), dc=ab: weights (2,2,4) give [A,B]=−C of weight −4=(−2)+(−2), with the sign convention of §8.3.” Replace line 199 by “Over 𝔽₃, tγ₂=0 although γ₃≠0; the corresponding coefficient over ℤ is 3.” Replace line 471 by “For n=2,m=3, the normalized product coefficient is binom(5,2)/5!=10/120=1/12=(1/2!)(1/3!).” Replace line 740 by “For M=Λ(a₁,b₁), M₀=Λ(a₁), M₁=M, the swap a↦b,b↦a is a DG automorphism of M₁ but cannot restrict to an automorphism of M₀ because b∉M₀.” Delete lines 386 and 423; their substantive controls already occur at lines 388 and 425. These remain README Checks, with no Lean declarations added.

   **Repair test:** The replacement computations give a nonzero bracket −C of weight −4, 0 versus a nonzero γ₃, 1/12 versus the unnormalized coefficient 10, and b outside the span of 1,a. The retained Tor example gives Tor₁(ℤ/ℓ,𝔽_ℓ)=𝔽_ℓ. Every definition still has at least three Checks.

## Verified sound

Read all 987 README lines and all 51 Suggested.lean lines, the repository README and CONTRIBUTING, the plan, source manifest and previous repair report. Counts: **0 Lean declarations; 36 numbered targets; 6 bold worked-example blocks; 129 Check bullets evaluated (124 under targets and 5 under conventions); 60 distinct source-line anchors resolved and read, covering 89 occurrences; 16 named roadmap supplier subsections checked; 10 declared gaps matched; 50 supplied sibling checkouts searched by object.** A counted Check may fail discrimination or truth: those failures are in R04. A verified locator establishes what the source says, not that every assertion in that source is correct.

The inspected library pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The main content checkout is `e9512ca8df2763cf4a2c2be435e96f55a7742d11`; package HEAD is `73d32d0`. The pull-request diff is confined to packages/EllAdicHomotopyTypesAndWeights. No build, source modification, Git write or external posting was performed.

### Declaration, context and acceptance-test audit

| File / section | Declarations | Variables, instances, universes and imports | Result |
|---|---:|---|---|
| packages/EllAdicHomotopyTypesAndWeights/Suggested.lean:1–51 | 0 | One `import Mathlib`; one module docstring; namespace `TauCetiRoadmap.EllAdicHomotopyTypesAndWeights`; no variable, instance, universe or declaration block | No hidden binder loss, sorry'd data, weakened theorem, padding, duplicate fully qualified declaration, or forbidden option. The list of elaborated declaration signatures is empty. |

The README's headline inventory and corresponding module-docstring exclusions are below. The missing objects are substantial constructions, not predicates that can be added with a few native definitions. In particular an arbitrary CDGA, abstract mixed Hodge structure, or arbitrary automorphism is not a replacement for its geometric realization. Pinned DG/A∞ minimal models are not Sullivan models.

| Headline | README target | Carrier absent at pins and named in Suggested.lean |
|---|---|---|
| Coefficient homotopy calculation | 2.2 | Relative divided-power simplicial coefficient complex |
| Integral triangular de Rham theorem | 2.3 | Global relative-form complex and natural cohomology comparison |
| Rational stabilized comparison | 2.5 | Relative forms, Sullivan forms and stabilization |
| Pro-simplicial ℓ-adic universal coefficients | 3.3 | Coherent pro-simplicial coefficient/cohomology construction |
| Completed triangular comparison | 3.4 | Bidegreewise completed form complex |
| Cohomology of the homotopy algebra | 3.5 | Constructed algebra and comparison map |
| Étale realization | 4.1 | Geometric A_ℓ and ordinary étale ℚ_ℓ cohomology ring |
| Complex minimal-model comparison | 4.4 | A_ℓ, Sullivan models and polynomial forms |
| Frobenius–Hodge comparison | 5.1–5.2 | Geometric realizations and filtered comparison |
| Stable minimal representatives | 6.2 | Sullivan models, polynomial homotopies and admissible filtrations |
| Eigenvalues generated by cohomology | 6.4 | Sullivan algebra with ordered Hirsch filtration |
| Common filtration for actual automorphisms | 6.6 | Same Sullivan carrier and finite-type filtrations |
| Pro-unipotent splitting and conjugacy | 7.2 | Minimal-model automorphism schemes and algebraic image tower |
| Rational weight splitting | 7.3 | Geometric rational Sullivan model and Hodge realization |
| Conjugacy of rational gradings | 7.4 | Geometric model and weight extension |
| Arbitrary-base ℚ_ℓ weight grading | 8.1 | Geometric ℓ-adic model and weight realization |
| Proper smooth formality | 8.2 | Geometric ℓ-adic CDGA and model |
| Étale 1-minimal/Tannakian comparison | 8.4 | Degree-one Sullivan Lie tower and geometric Tannaka group |
| Normal-variety presentation | 8.5 | Geometric unipotent Lie algebra and H¹/H² weight interfaces |

All 19 exclusions occur explicitly in the module docstring. No statable geometric headline was found missing, and no substitute theorem was inserted. Generic Sullivan existence, lifting and rigidity remain supplier contracts.

### Computed statement table

Notation: K is a characteristic-zero field; R may be the zero ring; Λ denotes the strictly alternating graded algebra. A displayed dimension is over the indicated coefficient field. “Retain” means the listed computations do not refute the statement; it does not assert a formal proof. The Check count in each target row accounts for every bullet in that target's Checks block. Negative controls retain the original general scope.

| Statement / context | Instances tried and values computed on both sides | Result / change |
|---|---|---|
| Scope and coefficient conventions, README:19–25 | Empty X has H*=0; two points have dim H⁰=2, versus connected model H⁰=K of dimension 1. Exponent r=0 gives ℤ/ℓ⁰=0, versus r=1 giving ℓ elements. A square-zero thickened geometric point has H⁰=K and Hⁱ=0 for i>0, identical to its reduction. | Connected-model and r≥1 restrictions are substantive. Fixed small diagrams do not assert a set of all schemes. |
| Graded signs and weights, README:29–33; 5 Checks | In Λ_ℤ(e) and Λ_𝔽₂(e), e²=0; in 𝔽₂[e], e²≠0 although −1=1. For dy=x², weights (2,4) give 4=2+2, while (2,3) give 3≠4. At q=2, eigenvalues (1,2) give weights (0,2), inverses (1,1/2) give (0,−2). Elliptic dual generators have weights (−1,−1), but their bracket is 0. At q=1 every 1^(w/2)=1; rank zero has empty spectrum for every w. | Signs, Frobenius and q>1 retained. The zero elliptic bracket cannot test bracket weight: R04. |
| 0.1, README:141; 4 Checks | Λ(e), d=0 has H-dimensions (1,1,0,…); its odd square is 0 also in characteristic 2. 𝔽₂[e] fails odd-square-zero. Λ(a₁,b₁) has ab↦[ab]≠0 in degree 2. In the zero algebra d²0=0²=−0·0=0, but H⁰=0≠K. | Retain the supplied strict-commutativity refinement and actual cohomology product. Localization citation: R03. |
| 1.1, README:176; 6 Checks | Over ℤ, γ₁²=2γ₂, not γ₂; over 𝔽₂ it is 0 with γ₂≠0. Over ℚ, γ₂↦t²/2 and γ₀↦1. Two maps to 𝔽₂[ε]/ε² agree at γ₁=0 but send γ₂ to 0 and ε. Over ℤ₃, tγ₂=3γ₃; modulo 3 it is 0. Over R=0 all basis coefficients vanish. | No factorial inverted integrally; coordinate alone does not determine an arbitrary algebra map. Replace the repeated transition law by the mod-3 computation: R04. |
| 1.2, README:202; 3 Checks | On an edge, Ω₀¹=0 and Ω₁¹=ℤ·dx₀≠0. d sends bidegree (0,1) to (1,1), not (1,2). γ₀+γ₂ has support {0,2}; Σₙγₙ has infinite support and is absent from the direct sum. | Retain grading and direct-sum convention. |
| 1.3, README:224; 5 Checks | One vertex gives dx₀=0, x₀=t, γ₂(x₀)≠0 and Ω⁰=R{t}. Two vertices give dx₀=−dx₁ and dγ₂(x₀)=x₀dx₀. Setting t=1 would require 2γ₂=1 over ℤ. On an 𝔽₂ edge dx₀²=0, unlike the nonzero square in the odd polynomial replacement. | Retain relative quotient by dt and alternating factor. |
| 1.4, README:249; 3 Checks | Omitting vertex 1 sends x₁,dx₁ to 0. Collapsing two vertices sends γ₂ to γ₂(x₀)+x₀x₁+γ₂(x₁). Collapsing three in either order gives three pure γ₂ terms plus x₀x₁+x₀x₂+x₁x₂. Identity fixes γ₂. | Both composition orders agree; mixed terms exclude coordinatewise-only divided powers. |
| 2.1, README:273; 5 Checks | Point gives R{t}; empty simplicial set gives 0 in every bidegree. A degenerate edge's vertex form γ₂ pulls back to γ₂(x₀+x₁), not an independent value. Identity-edge evaluation gives x₀+x₁=t. Adjacent-edge vertex values (0,γ₁) disagree; (γ₁,γ₁) agree. | Retain compatible families, including the empty case. |
| 2.2, README:297; 3 Checks | (p,n,i)=(0,0,0) gives R. For (p,n)=(0,1), normalization is R→R by a unit, hence all homology 0; (1,1) has H₁=R. At R=0 both exceptional groups are 0. At n=2 over 𝔽₂, Γ²(R) has rank 1, so the degree-2 exceptional piece is not killed by 2=0. | Retain triangular range and divided-power décalage. |
| 2.3, README:311; 3 Checks | Circle: H¹Ω₀=0, H¹Ωₙ=R for n≥1, matching the triangular truncation. Two-torus: (aγ₁)(bγ₁)=2abγ₂; over 𝔽₂ this is 0 although ab≠0 in ordinary H². Empty X gives 0=0 in every degree. | Retain the binomial product coefficient; no claim of an unnormalized ring isomorphism. |
| 2.4, README:325; 3 Checks | At a point (p,n)=(0,1), 3γ₁ mod 4 maps to γ₁ mod 2. At (0,0), base change is R⊗_R B=B, but RP² has H¹(−,ℤ)=0 and H¹(−,𝔽₂)=𝔽₂, exposing the exceptional diagonal. On an infinite discrete set, ker(∏R→∏R/(a))=a∏R. | Principal-quotient scope retained; the infinite-ideal counterexample below rules out arbitrary quotients. |
| 2.5, README:339; 3 Checks | Point: γₙ↦tⁿ/n! is an isomorphism of one-dimensional pieces. Edge: t⁰x₁ is not in the degree-zero image (constants). Disjoint edges with forms x₁ᴺ have unbounded degrees N and lie in no fixed bound. On an interval dx₁=d(x₁), so H¹=0 despite those missing forms. | Stabilized comparison is a quasi-isomorphism, not surjective on all cochains. |
| 3.1, README:365; 5 Checks | Identity point tower and even-indexed subtower both give Rγₙ. For the coefficient tower, (ℓⁱ)ᵢ has finite support modulo each ℓʳ but infinite support in ℤ_ℓ. Thus it belongs to lim_r colim_N(ℤ/ℓʳ)^N and not colim_N lim_r(ℤ/ℓʳ)^N. Constant point→two-point Hom has 2 elements; reverse Hom has 1. | Correct variance, cofinality and limit order. Delete the Check that only restates the order: R04. |
| 3.2, README:390; 4 Checks | Point cardinalities are (ℓ,1,1,…); circle gives (ℓ,ℓ,1,…). CP∞ has rank 1 in every even degree and 0 in odd degrees. A countable wedge of circles has H¹=∏_ℕ𝔽_ℓ, an infinite set. | (F) is degreewise finite, not bounded total degree and not vanishing of positive cohomology. |
| 3.3, README:413; 3 Checks | For ℤ_ℓ --ℓ→ ℤ_ℓ in degrees 1,2: H¹=0, H²=𝔽_ℓ; after reduction H¹=𝔽_ℓ=Tor₁(H²,𝔽_ℓ). For the zero complex all these terms are 0. CP∞ has ℤ_ℓ ranks 1 in degrees 2j, 0 in degrees 2j+1, for all j. | Degree i+1 in Tor is correct. The unqualified nonzero-Tor Check fails at zero: R04. |
| 3.4, README:427; 3 Checks | Completed point piece is lim_r ℤ/ℓʳ·γₙ=ℤ_ℓγₙ, not a fixed finite quotient. Infinite Σₙγₙ remains absent. For the circle at (p,n)=(1,1), r=1, ℓ=2, coker d=𝔽₂ has 2 elements, not 0. | Retain bidegree completion and required cycle/boundary ML verification; no inferred surjectivity from finite cohomology. |
| 3.5, README:450; 3 Checks | Point: γ₀↦1, γ₂↦1/2, including ℓ=2. tγ_(ℓ−1)=ℓγ_ℓ has a nonunit coefficient integrally. Transition γ₂→3γ₃ has normalized value 3/3!=1/2!=1/2. Product n=2,m=3 has 10/120=1/12=(1/2!)(1/3!). | Rationalization before stabilization is essential. Replace generic product-law Check by the explicit computation: R04. |
| 4.1, README:483; 4 Checks | Point H⁰=ℚ_ℓ,Hⁱ>⁰=0; two points H⁰=ℚ_ℓ². Countable algebraic closure of a field generated by finitely many coefficients has cardinality ≤ℵ₀ even when k is uncountable. For 𝔸¹ over 𝔽̄_p, the classes tᵐ, p∤m, give infinitely many independent Artin–Schreier H¹ classes when ℓ=p. | Geometric scope and invertibility restrictions retained. Raw-model choice needs R01's representative comparison; localization citation R03. |
| 4.2, README:506; 3 Checks | Point action: 1↦1, stabilizer index 1; a two-point orbit swaps (1,0)↔(0,1), stabilizer index 2. In R01's 𝔸¹ example, the selected-point indicator changes 1→0 under every suitable N∈Nℤ̂, so no open subgroup stabilizes it. | The three finite examples are correct but do not imply the universal continuity claim. R01. |
| 4.3, README:520; 3 Checks | 𝔾_m(ℂ) and its circle model both have H¹ rank 1. Two arcs with disconnected overlap have ordinary nerve H¹=0, whereas the component Čech diagram has two edges and H¹ rank 1. Two singleton components give H⁰=(ℤ/ℓʳ)², versus rank 1 after erroneous collapse. | Keep good-cover hypotheses and component data; the precise refinement gap is accepted. |
| 4.4, README:534; 3 Checks | 𝔾_m has Λ(a₁), H¹ dimension 1. Elliptic curve has Λ(a₁,b₁), dimensions (1,2,1), with ab≠0. Two geometric points have dim H⁰=2, not the dimension 1 of a connected minimal model. | Componentwise comparison and full algebra comparison have the stated different domains. |
| 5.1, README:558; 3 Checks | H¹ weights: 𝔾_m={2}, elliptic={1,1}, proper nodal rational curve={0}. Dual-number point has H⁰=ℚ_ℓ, W₋₁=0,W₀=H⁰, and positive cohomology 0. Nodal curve×𝔾_m has H¹ weights {0,2} and H² weights {2,2}. | Example bounds agree; the nonsmooth nonproper ordinary bound is not supplied by the cited contract: R02. |
| 5.2, README:572; 3 Checks | On ℙ¹ at q=3, geometric eigenvalues (1,3) give weights (0,2); W₀ ranks (1,0), W₂ ranks (1,1). Inverse Frobenius gives (1,1/3), weights (0,−2). In degree 2 the complex-weight shift is W_(2−2)=W₀ on the weight complex. | Retain geometric Frobenius, shifted filtration and generalized eigenspaces. |
| 6.1, README:596; 3 Checks | Constant Λ(a₁,b₁) filtration has 2 generators and is exhaustive. In K[x₂], span{1,x} omits x² of degree 4, so is not a subalgebra. In K[x₂]⊗Λ(y₃), dy=x² is absent from the algebra generated by y; adjoining x includes it. M=K has 0 positive generators and a constant admissible filtration. | Finite generators, not degree truncation, determine stages. |
| 6.2, README:619; 3 Checks | Sphere block {x,y} contains dy=x²; block {y} does not. Three-punctured line has dim H¹=2,H²=0 but free Lie graded ranks 2,1,2,3,…, hence infinitely many degree-one Hirsch generators. Two shears on Λ(a,b) preserve its 2-generator stage although AB≠BA. | No false nilpotence or finite-dimensionality assumption on the entire degree-one model. |
| 6.3, README:633; 3 Checks | For invertible σ, generalized 0-eigenspace has dimension 0. For J₂(1), ker(σ−1) has dimension 1, ker((σ−1)²) dimension 2. Products of closed eigenvectors with eigenvalues 2,3 have eigenvalue 6, not 5. | Multiplicative indexing and generalized vectors retained. |
| 6.4, README:656; 3 Checks | Sphere: σx=ax forces σy=a²y; cohomological source degrees add to 2+2=4≥3. Nonminimal du₁=v₂ admits arbitrary common eigenvalue β despite H⁺=0. Unit eigenvalue 1 is the empty product, total degree 0. | Minimality excludes the acyclic-pair counterexample; degree-zero boundary handled. |
| 6.5, README:670; 5 Checks | Sphere weights 2,4 give weight(dy)=4; 2,3 fail. 𝔾_m has degree 1 but weight 2. On Λ(a,b), σa=2a,σb=a+2b has a 2-dimensional generalized weight-2 H¹ block and H² eigenvalue 4 of weight 4. Ordinary eigenspace in H¹ has dimension only 1. | Weight need not equal degree, and weight splitting does not assert semisimplicity. |
| 6.6, README:695; 3 Checks | AB=((2,1),(1,1)), BA=((1,1),(1,2)); both act on the same 2-dimensional generator space. Aⁿ=((1,n),(0,1)), A⁻¹=((1,−1),(0,1)). For weights 1,2, diag(2,4)(a+b)=2a+4b∉K(a+b). | Common invariant stage does not imply commuting automorphisms, finite order or arbitrary-line invariance. |
| 7.1, README:719; 5 Checks | On Λ(a₁) of weight 1, section a↦λa has U=1. On weights 1,2, λ=2 acts as (2,4), not (1/2,1/4). Shear b↦b+a is identity on both graded lines but changes [b]. Swap a↔b fails to preserve M₀=Λ(a), since b∉span{1,a}. | Distinguish filtered from unrestricted automorphisms and graded identity from cohomological identity. Replace tautological restriction Check: R04. |
| 7.2, README:744; 3 Checks | In 𝔾_a⋊𝔾_m, s_c(2)s_c(3) has additive coordinate −c+2(−2c)=−5c=s_c(6). Conjugation (c,1)(0,λ)(−c,1)=(c(1−λ),λ); at λ=2 this is (−c,2). Shear changes [b] to [b]+[a], so cannot be homotopic to identity. | Base-field algebraic sections and U-conjugacy are the right conclusions; pro-limit compatibility remains this target's proof obligation. |
| 7.3, README:758; 3 Checks | Elliptic H¹ has two weight-1 generators and product weight 2; W₀H¹=0,W₁H¹=K². On 𝔾_m, W₁H¹=0,W₂H¹=K, with generator in cochain degree 1. | Rational splitting is not purity in cochain degree. |
| 7.4, README:772; 1 Check | g(a)=a,g(b)=b+a maps the two splitting lines (Ka,Kb) to (Ka,K(b+a)). On associated graded g=id; on H¹, [b]↦[b]+[a]≠[b]. | Conjugacy retained without claiming g is homotopic to identity. This theorem is not a new definition requiring three definition Checks. |
| 8.1, README:794; 2 Checks | Three punctures over 𝔽̄₂ with ℓ=3: H¹ dimension 2, Frobenius eigenvalues (2,2), Weil weights (2,2). Its Lie generator weights are (−2,−2). No map 𝔽₂→ℂ exists (2·1=0 versus 2≠0). | ℚ₃ grading does not assert rational Betti realization in positive characteristic. |
| 8.2, README:807; 3 Checks | Elliptic model Λ(a,b),d=0 is already cohomology. For ℙ¹, dy=x² maps to [x²]=0; x↦[x],y↦0 gives H*=K[x]/x², dimensions 1 in degrees 0,2. For 𝔾_m the weight-degree diagonal projection kills the sole H¹ class, producing H¹ map K→0. | Proper smooth formality and its proof's scope retained; formality is not zero differential on every minimal model. |
| 8.3, README:821; 6 Checks | Λ(a) gives 1-dimensional abelian Lie algebra; Λ(a,b) gives dimension 2 and bracket 0. Three punctures give free pronilpotent Lie algebra with first graded dimensions 2,1,2. For dc=ab, [A,B]=−C, [A,C]=[B,C]=0, and dc(A,B)=1=−c(−C), versus −1 for the wrong sign. Weights (2,2,4) dualize to (−2,−2,−4). ℙ¹ has 1-minimal H²=0 injecting into K, while its full model H²=K. | Lie sign, dual weights and injection rather than H² isomorphism all retained. |
| 8.4, README:846; 2 Checks | Three punctures: lower-central depth-one dimension 2, depth-two dimension 3. C₂ and S₃ have orders 2 and 6, but characteristic-zero unipotent images have order 1: m log(g)=0 implies log(g)=0. | Completion is neither the finite group itself nor only abelianization. General normal-category extension is declared. |
| 8.5, README:859; 4 Checks | Three punctures: dim V=2, weights −2, R=0. Elliptic: dim V=2, weights −1, relation [a,b] of weight −2, yielding abelian dimension 2. Genus g≥1: dim V=2g, dim R=1 with Σ[aᵢ,bᵢ]; g=0 gives V=R=0. Nodal rational curve has H¹ weight 0 and is not normal. H² weights [0,4] dualize to [−4,0]; bracket weights≤−2 leave {−4,−3,−2}. | Normality and relation range are consistent; their general H²-bound input requires R02. |

### Bold worked examples and summary audit

| README block | Computed independent witness | Result / change |
|---|---|---|
| Summary, line 3 | Integral two-torus product is 2abγ₂; modulo 2 it is 0, while normalized rational product is ab. Empty X has no connected model; point has A_ℓ cohomology ℚ_ℓ. | The advertised full prime range and componentwise scope agree with targets. R01 and R02 affect their claimed proof interfaces. |
| Circle and two-torus, line 888 | Circle Betti numbers (1,1); torus (1,2,1). Elliptic realization has weights 0,1,2 by degree, whereas (𝔾_m)² has weights 0,2,4. Both have nonzero ab; integral γ₁γ₁=2γ₂. | Topological model alone does not determine geometric weights. |
| Three punctures, line 909 | H¹ dimension 2, H²=0; free Lie lower-central graded dimensions 2,1,2,3,…; generators of weight −2 have brackets of weights −4,−6,…. | Infinite 1-minimal tower and absence of relations agree. |
| Proper smooth curves, line 921 | Genus 1: 2 generators, one bracket relation, Lie dimension 2. Genus 2: Λ⁲K⁴ has dimension 6 while H² has dimension 1, so the full minimal model needs differentials killing 5 degree-2 classes. | Formality does not say that a higher-genus minimal model has zero differential. |
| Projective line, line 934 | Model K[x₂]⊗Λ(y₃), dy=x²: H⁰=K,H²=K,Hⁱ=0 otherwise; weights x=2,y=4 satisfy d weight 4. The 1-minimal model is K with H²=0. | Full and 1-minimal objects are correctly distinguished. |
| Why normality matters, line 941 | Normalization of the nodal rational curve is ℙ¹; its dual-graph loop contributes one weight-0 H¹ class. Dual Lie generator also has weight 0, outside {−1,−2}. | Genuine negative control for normality. |
| Infinite discrete coefficients, line 951 | For R=ℚ[x₁,x₂,…], I=(xᵢ), the sequence (xᵢ) maps to 0 in ∏R/I but is nonzero modulo I∏R: finitely many ideal coefficients involve only finitely many variables. For (a), kernel is exactly a∏R by coordinatewise preimages. | Refutes arbitrary-ideal base change and supports the package's principal-ideal restriction. |

### Supplier and ownership audit

The following rows resolve the 16 supplier subsections, including their repeated Needs citations. Main roadmaps were read on main, provided open siblings at their supplied heads, and accepted board designs in their package folders. Section ranges below are locators within each named roadmap's README. Tool-index misses were checked against the actual files before classification.

| Supplier / sections resolved | Contract test and result |
|---|---|
| DGAInfinity, Layers 1,3,8 | Layer 1 has DG carriers and morphisms; Layer 3 has A∞ transfer, not Sullivan minimality; Layer 8 has formality. Localization attribution fails: R03. |
| AlgebraicTopology, Stage 4 item 7; Stages 5–6 | Native simplicial realization/CW comparison, finite-cover chain descent, ordinary cochains and cup products are present. RP²'s integral H¹=0 versus mod-2 H¹=𝔽₂ retains the coefficient distinction. Finite-cover descent does not prove intersections contractible. |
| AlgebraicTopologyPartII, AT2.4 and its G3 reading obligation | The accepted design has the rational/minimal-model direction with nilpotent finite-type spatial hypotheses. The five precise CDGA/polynomial-form extensions below are declared gaps, not false claims that the present supplier already proves them. |
| DerivedDeRhamCohomology, 2.21 | Strict graded commutativity and odd-square-zero predicates explicitly present on the supplied DG carrier. The 𝔽₂ odd polynomial generator has e²≠0 and is rejected. |
| DerivedModuleAlgebra, 0.DP.2–0.DP.3,0.14–0.17,1.T.1,1.1 | Homogeneous divided powers, alternating derived exterior powers/décalage, countable module towers and ML/Milnor exactness present. Γ²(𝔽₂) has rank 1; exactness is not a consequence of the set-valued stabilization predicate alone. |
| DiamondsAndVStacks, D0.13 | Imports ordinary pro-categories from AdicSpacesPartII and the bounded size interfaces. No second pro-category is owned here. |
| AdicSpacesPartII, R0.19.9 | Opposite-Ind carrier and Hom(lim Yᵢ,lim Zⱼ)=limⱼ colimᵢ Hom(Yᵢ,Zⱼ), including stage representatives, present. Point→two points gives 2 maps, reverse gives 1, fixing variance. |
| EtaleHomotopyTypes, EH.0 “Local-coefficient detection”; EH.3 rigid cover/hypercover/type/cohomology; EH.6 | Raw rigid type and filtered-colimit cohomology supplied. Its geometric-point-labelled covers have no finite-component requirement: R01. EH.6's quasi-projective completed comparison is not misused as the general raw comparison. |
| EtaleCohomologyFoundations, F.0.3,F.2.2–F.4.6,F.10.1–F.10.2b,G.1–G.3 | Invertible finite-coefficient finiteness, algebraically closed field extension, adic realizations, Frobenius and proper compactification interfaces present. H⁰(𝔸¹)=Λ versus H⁰_c(𝔸¹)=0; H²(ℙ¹) has geometric eigenvalue q, so ordinary and compact-support theories are not interchanged. |
| ComplexComparisonPartII, C5.3,C5.5,C6.0–C6.3,C6.6 | Pure Hodge realization, log de Rham, finite CW type and Artin comparison present at the stated domains. C5.3 includes proper smooth nonprojective schemes without calling their analytifications Kähler. Singular/noncompact good-cover coherence is separately declared. |
| MotivicEtaleKTheory, 3.1–3.2,3.4, provided open head | Smooth log realization and refinement comparisons present. Filtration shifts WₘHⁱ←Wₘ₋ᵢ, so H²(ℙ¹) of weight 2 comes from weight-complex index 0. Singular descent is a declared extension; no unshifted W-filtered equivalence after arbitrary boundary blowup is imported. |
| SchemeAndStackFoundations, 0.9,Layer 2,4.17,4.19 | Finite-presentation descent, cohomological descent, SNC divisors and projective regular alterations present. Over a perfect algebraically closed field regular strata are smooth; the characteristic-zero hyperresolution contract remains separately owned. |
| ResolutionOfSingularitiesCharacteristicZero, 5.1–5.6,6.1–6.4 | Resolution/principalization and SNC compactification inputs present. The quasi-projective input to projective compactification is retained; general smooth strata use proper compactification. |
| DeligneWeightsAndPurity, 0.1–0.3,0.7–0.15,7.12,7.15,8.20–8.24 | Finite-dimensional spectral rules and proper smooth purity present. q and q⁻¹ have weights 2 and −2. Smooth ordinary upper bounds occur in 7.14; general ordinary bounds are missing from the cited contract: R02. |
| ReductiveGroups, Layers 5,6,6A | Characteristic-zero unipotent/Lie theory, rational torus representations, finite-type Levi complements, vector layers and torsor triviality present. The computation s_c(2)s_c(3)=s_c(6) occurs in an actual algebraic semidirect product; compatible pro-level choices are the present roadmap's additional theorem. |
| AnabelianGeometryAndNonabelianChabauty, 2.1–2.3 | Tensor reconstruction and unipotent group/tower interfaces present; geometric category currently restricted to smooth characteristic-zero curves. Normal varieties in arbitrary allowed characteristic are explicitly assigned to the declared extension. Lower-central dimensions 2 then 3 for the free rank-two group distinguish the tower from abelianization. |

The additional ownership citation to MixedHodgeModulesAndIrregularHodgeTheory H.1/operations and H.1/weight-bounds resolves in packages/MixedHodgeModulesAndIrregularHodgeTheory/design/README.md:683,717. Its quasi-projective supported-category domain does not already supply the requested all-separated-scheme Deligne hyperresolution comparison. The resolver's three “not found” leads (that roadmap, AlgebraicTopologyPartII and EtaleHomotopyTypes) are index omissions relative to accepted board designs, not missing owners. All three occur before this roadmap in the merge order.

Ownership searches used the roadmap index and direct searches of main, Completed, board packages and all 50 explicitly supplied sibling folders, including Suggested.lean, for relative divided-power simplex forms, Sullivan/Hirsch and 1-minimal models, polynomial forms, hyperresolution realization, weight filtrations, pro-unipotent automorphism extensions and Lie presentations. The overlap with the current MotivicEtaleKTheory head is assigned to that owner. Generic DG algebra, divided-power algebra, ordinary cohomology, scalar weights and finite-dimensional Levi theory are imported. The remaining relative-form construction, its completed comparison, and the particular geometric model/automorphism-tower arguments are new interfaces owned here; no second implementation of those targets was found. With no local Lean declarations, a duplicate fully qualified Lean name is impossible.

### Declared-gap audit

All ten slugs, supplier names and full needs sentences match between design/plan.json and the README. Each supplier is earlier in the order. These are accepted contracts, conditional on delivery, and are not findings. The examples below test the distinguishing scope of each extension; they do not purport to prove the suppliers' future theorems.

| Gap | Computed scope witness / minimality check |
|---|---|
| polynomial-forms-de-rham | A_PL(point)=K and H⁰=K; on an interval dx=d(x), H¹=0; a simplicial circle has H¹=K. Relative integral point forms R{t} are a different object, so §1 does not already supply this. |
| sullivan-minimal-models | Three punctures have H¹=K²,H²=0 but free Lie graded ranks 2,1,2,3,…; the extension cannot be restricted to nilpotent realizing spaces or finitely many degree-one generators. |
| sullivan-quasi-isomorphism-rigidity | a↦2a on Λ(a₁) is an isomorphism, inducing multiplication by 2 on H¹; a↦0 induces 0 and is not a quasi-isomorphism. Acyclic pair du=v is excluded by Sullivan minimality. |
| sullivan-homotopy-lifting | For source Λ(a₁) and target Λ(b₁), maps a↦b and a↦2b induce 1 and 2 on H¹ and cannot be homotopic. Constant polynomial homotopy gives identical endpoint maps; dt evaluates to 0 at both endpoints. No geometric nilpotence hypothesis is inserted. |
| sullivan-scalar-extension | Λ_ℚ(a₁)⊗_ℚ K has H¹=K, the scalar extension of ℚ. The P¹ 1-minimal map retains H² map 0→K, whereas the full model retains K→K. The two notions are not collapsed. |
| compatible-good-cover-refinement | Two arcs covering a circle with disconnected overlap give ordinary nerve H¹=0 versus space H¹=K. Refining to a genuine good-cover nerve gives H¹=K. A finite-CW theorem alone does not supply coherent refinements of finite diagrams. |
| geometric-mixed-hodge-realization | A proper nodal rational curve has H¹ dimension 1 of weight 0; smooth proper purity would demand weight 1. Its singular realization therefore extends, rather than repeats, the current smooth owner. On ℙ¹, W₂H² corresponds to W₀ of the weight complex. |
| arbitrary-base-weight-filtration | 𝔾_m over 𝔽̄₂ has W₁H¹=0,W₂H¹=ℚ₃; extending to an algebraically closed field of positive transcendence degree keeps those ranks 0 and 1. Independence of spreads extends the finite-field scope; it does not state the missing general numerical bound in R02. |
| normal-h1-weights | Elliptic and 𝔾_m H¹ have weights 1 and 2; nodal proper rational H¹ has weight 0 and is nonnormal. The two allowed positive weights exclude an actual singular example. |
| normal-variety-unipotent-category | Three-punctured line over 𝔽̄₂, ℓ=3, has unipotent lower-central quotient dimensions 2 and 3; it is outside the supplier's current characteristic-zero curve clause. Finite groups C₂,S₃ both have unipotent image 1, fixing the intended completion. |

### Pinned-library checks

| Pinned declaration / repository-relative source | Verified limitation or calculation |
|---|---|
| DividedPowerAlgebra; dp; dp_mul; algHom_ext; lift; map — Mathlib/RingTheory/DividedPowerAlgebra/Init.lean:99,127,171,235,346,418 | Universal divided-power algebra of a module. Product coefficient at (1,1) is 2; arbitrary algebra maps require all divided-power generators, not only γ₁. The integral polynomial embedding is not this definition. |
| ExteriorAlgebra.ι_sq_zero — Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean:90 | ι(m)²=0 over every commutative ring, including characteristic 2; no assumption 2≠0 needed. |
| SSet and SSet.chainComplex — Mathlib/AlgebraicTopology/SimplicialSet/Basic.lean:33; Mathlib/AlgebraicTopology/SimplicialSet/Homology/Basic.lean:75 | Native simplicial sets and free-simplex chain complex; not a relative differential-form object. |
| ChainComplex.linearYonedaObj — Mathlib/CategoryTheory/Abelian/Ext.lean:56 | Hom cochain construction in the module category, with contravariance in the chain input; no hidden finite-dimensionality restriction. |
| CategoryTheory.Abelian.DoldKan.equivalence — Mathlib/AlgebraicTopology/DoldKan/Equivalence.lean:167 | Abelian-category equivalence, not preservation of homotopies by arbitrary nonlinear functors. The relative coefficient décalage computation remains a theorem. |
| CategoryTheory.Functor.IsMittagLeffler — Mathlib/CategoryTheory/CofilteredSystem.lean:137 | Stabilization of images for set-valued functors; does not by itself state module-limit exactness. |
| TauCeti.IsDGAlgebra — TauCeti/Algebra/Homology/DG/Algebra/Defs.lean:182 | Internally ℤ-graded algebra, degree +1, d²=0 and Leibniz; neither nonnegative support nor graded commutativity is built in. |
| TauCeti.DGAlgHom — TauCeti/Algebra/Homology/DG/Algebra/Hom/Basic.lean:50 | Native graded differential-compatible homomorphism; the stricter commutative subcategory is a refinement. |
| TauCeti.IsDGAlgebra.Cohomology; TauCeti.algEquivCohomologyOfZero — TauCeti/Algebra/Homology/DG/Algebra/Cohomology.lean:182,257 | Quotient of cycles by boundaries; at d=0, ab maps to [ab] with product retained. The second name is at the TauCeti namespace, not inside IsDGAlgebra. |
| TopCat.singularCochainComplex; singularCohomology; singularCup — TauCeti/AlgebraicTopology/Cohomology/Basic.lean:60,94; TauCeti/AlgebraicTopology/Cohomology/Cup.lean:203 | Ordinary singular cochains and cup product; not a geometric étale or polynomial-form comparison. |
| TauCeti.Hodge.MixedHodgeStructure — TauCeti/Geometry/Hodge/Mixed/Basic.lean:72 | Bounded weight/Hodge data and pure graded pieces; no geometric realization or automatic finite-dimensionality. |
| CategoryTheory.MorphismProperty.Localization; Q — Mathlib/CategoryTheory/Localization/Construction.lean:106,111 | Generic category localization supplies the corrected attribution in R03. |

Object searches found no pinned relative simplex-form complex, Sullivan model carrier, geometric A_ℓ, or geometric 1-minimal/Tannakian comparison. Those absences, rather than an arbitrary theorem quota, explain Suggested.lean's zero declarations.

### Source-locator audit

| Source | Locators read and result |
|---|---|
| weil-II | Entire §5, printed pp. 234–242, weil-II line 3650 through the questions at weil-II line 3960. All 36 distinct anchors in this range resolve. Integral construction, triangular comparison, completion, minimal-model weights, rational conjugacy, proper smooth formality and normal presentations have the indicated locators. The raw rigid substitution in R01 is additional to the source. The two §5.1.5 problems and countability slip are recorded below; the package already distinguishes the intended statements. |
| sullivan | Theorem 6.1 at sullivan line 912; Appendix A.1 at sullivan line 1042; Theorem 7.1 and polynomial-form example at sullivan line 1121; Theorem 8.1 at sullivan line 1289. Polynomial-form comparison has the characteristic-zero scope; the spatial homotopy interpretation retains its nilpotent/finite-type hypotheses. |
| morgan | §5 definitions, existence, lifting and rigidity at morgan line 1017 through morgan line 1190; Theorem 9.4 at morgan line 2245, printed pp. 198–199. Ordered generators, degree-one models and Lie presentations are present; generic existence is not restricted to nilpotent realizing spaces. |
| morgan-correction | Entire correction, particularly morgan-correction line 29, printed p. 185. The false rigidity of all indecomposables is explicitly corrected; the paper says the other results in §§9–10 remain valid. The package does not import the retracted functoriality. |
| dgms | Theorems 1.1–1.2 and homotopy/uniqueness consequences, dgms line 270; polynomial-form Theorem 2.1, dgms line 448; compact Kähler formality, dgms line 1060. None provides a characteristic-p geometric realization by itself. |
| poids | §8.3, poids line 152, normal H¹ weights; §10, poids line 164, Lie presentation; §§12–14, poids line 185, Hodge/Frobenius comparison. Read surrounding discussion beginning poids line 127. The claims are announcements with the full later proof route supplied by Weil II and the local targets. |
| hodge-III | §6.2.8 at hodge-III line 582; §§8.1.19–8.1.20 and §§8.2.1–8.2.4 around hodge-III line 1213; §§8.2.10–8.2.11, printed p. 40. Proper hyperresolution, general complex mixed Hodge realization, bounds and product compatibility are present. These complex results are not a positive-characteristic substitute for R02. |

All nine source keys are unique in sources.toml. The two remaining keys are the settled uncertified works listed below. No source text was copied into the package or report.

### Dependency and policy result

The final read-only dependency check returned:

```text
depcheck: 52 roadmaps, 596 edges, 0 problem(s)
```

Exit status 0; no UPWARD, CYCLE or moved line. An earlier run also passed (51 roadmaps, 594 edges); the final output above records the later global graph. No dependency or merge-order file was changed. The local layer Needs edges point backward. R01 and R02 are proof-contract failures not detected by this graph check.

The input files contain no forbidden `set_option`, admitted data, admitted example, `lemma` declaration, computational algorithm, pull-request number, or process narrative. The target file has one module docstring and the required namespace. The prior repair report contains no finding marked “not actionable in this package” requiring a re-raised designation here.

## Not verifiable

- **miller**, *De Rham cohomology with arbitrary coefficients*, pp. 193–203: settled uncertified supporting source for §§2.2–2.4. Its full proof was not available for inspection; Weil II's cited construction and proof outline were read. No replacement key or new request was created.
- **sga5**, Exposé V, §5.3.1: settled uncertified supporting source for §3.3. Its precise printed proof was not inspected; Weil II's use at weil-II line 3769 was inspected. No new request was created.
- **Elaboration:** no Lean command was run under the read-only/no-build instruction. There are zero declarations, so there is no `#check @name` list, variable retention comparison or claimed elaboration result. Pinned declaration types were read directly.
- **Future supplier delivery:** the ten exact declared gaps are contracts, not implemented theorems certified by this review. Their absence today is not reported as a defect. The added contract proposed in R02 is a repair, not a presently declared gap.

## Source issues

- **Misprint** in weil-II at §5.1.5, printed p. 235 (weil-II line 3690): the source says the map into the full polynomial-form algebra tensored with ℚ[t] is an isomorphism; it should be an injection identifying each degree with its uniformly bounded polynomial-form image; affects a stated result.
- **Error** in weil-II at §5.1.5, printed p. 235 (weil-II line 3694): the source says arbitrary quotient coefficients commute with forms off the diagonal; it should be restricted, for example to principal quotients, since infinite products fail for infinitely generated quotient ideals; affects a stated result.
- **Misprint** in weil-II at §5.2.2, printed p. 238 (weil-II line 3804): the source says the original algebraically closed base k is countable in constructing the covering system; it should be the chosen countable algebraically closed field of definition k₁; affects the proof.
- **Error** in morgan at Theorem 9.2 and proof, printed p. 195 (morgan line 2139): the source says indecomposables are rigid under homotopy, giving the asserted canonical structure; it should be the associated graded of the natural indecomposable filtration, except in the simply connected case; affects the proof; corrected in print at morgan-correction, revised Theorem 9.2, printed p. 185 (morgan-correction line 29).

<!-- tauceti-roadmap-review {"agent": "codex", "head": "73d32d03db57818f64236a4545793fe77d8d6538", "job": "RT-EllAdicHomotopyTypesAndWeights~1a", "model": "gpt-6-astra", "worker": "chris-6"} -->
