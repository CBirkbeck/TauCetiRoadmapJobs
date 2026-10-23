# SolidAnalyticRings repair report

The two reviews contain five findings. Their identifiers overlap: the first F01 below is from r1a; the second F01 and F02–F04 are from r1b. Each finding is settled separately. No independent acceptance is claimed.

## F01 (P3) — applied

Review r1a. Unqualified nonvanishing in §§6.1 and 6.3 → explicit sphere examples and zero-algebra controls. The shifted generator has degree −n group ∏_ℕℤ for A=δ𝕊; the split realization tail has π₀=⊕_(n>d)ℤ. For A=0 both are zero. These remain README Checks, with no Lean padding.

## F01 (P2) — applied differently

Review r1b. An unnamed p-adic calculation → explicit integer and marked-fiber spectral null-family targets, completed-generator tensor comparison, two-index profile finality, dependencies and five Checks in §6.4. The split datum is unchanged. Spectral fibers replace ambiguous scalar-image notation: at p=2, π₁K₁=ℤ/2 although its marked map is zero. The module documentation and Q locator are updated.

## F02 (P3) — applied

Review r1b. The Needs line of §3.4 omitting its tower input → an explicit §3.3 dependency. Section 3.3 depends on §§3.1–3.2 and the supplied tower theory, so the edge introduces no cycle. The balancing formula and its hypotheses are unchanged.

## F03 (P3) — applied differently

Review r1b. Undefined presentation/transport clauses → specified diagrams, relation maps, cocones and cutoff bounds; §1.3 now quantifies internal projectivity over every lifted integer ring. The insufficiently specified supplier realization comparison becomes gap:light-measure-site-comparison in the README and plan. Sections 1.3 and 7.4 gain discriminating Checks; supplier functors are not constructed here.

## F04 (P3) — applied

Review r1b. The inferred filtered-index universe → explicit `IsFinitelyPresentable.{1}` in `isLightSolid_reflective_and_generator`. Its declaration documentation, module documentation, README §1.5 and Mathlib contract now specify the same convention. The scratch signature check retains all seven intended types, with no free universe parameter on this theorem and no lost derived-category binder.

## Evidence and extent of the repairs

For r1a F01, the zero coefficient algebra is admitted both by §2.4 and the split datum of §5.1. Its module category is zero, so every homotopy group of both examples vanishes. The corrected nonzero examples use the generator description of §2.4 and the suspension convention of §2.1. The split simplicial example has zero normalized differentials; its realized tail is the coproduct of its suspended normalized terms. This qualification is necessary to compute the tail, rather than only its layers.

For r1b F01, Bosco line 3459 states Proposition A.3 in the integer-linear setting; Bosco line 3468 identifies the product blocks used in the proof. Bosco line 3488 is Lemma A.4, and Bosco line 3504 starts its proof on extremally disconnected test spaces. The argument uses flatness, quotient transitions and uniform bounds on an entire block. It does not directly prove the light spectral statement. For A=Hℤ_p the first p-power quotient is H𝔽_p, so neither the finite-free-stage condition nor the split-stage argument of §5.1 applies. The light formula and its spectral lift are therefore explicit targets here, with §4.2 as an input. W line 452 and W line 459 state the spectral endpoint; Q line 3712–3715 supplies the two-index profile argument used as a model. None is presented as a formal proof already available at the pins.

The proposed spectral wording needed care: multiplication by pʳ on a spectrum does not identify its fiber with the image of multiplication on homotopy groups. The fiber is a marked copy of A_p. Section 6.4 now states its transition maps, full spectral equivalence, bounded-interval compatibility and finite-output naturality, as well as the product comparison needed before tensor closure. This avoids using tensor closure to prove its own generator calculation. The profile colimit remains merely filtered; §4.1 is used only for the poset of countable subsets in the arbitrary-coproduct passage.

For r1b F03, Mathlib/Condensed/Light/Sequence.lean:20–22 fixes the coefficient ring in Type 0, and its theorem at line 302 has that restriction. RC line 541 and the proof beginning at RC line 548 give the internal lifting argument. The corrected larger-universe target applies this argument to every light test in that universe. It asserts local lifting along a surjective light cover, not surjectivity of every evaluation functor. Its comparisons are on the free marked diagram, not a new theorem about unrestricted condensed universes.

VStackSheavesAndLisseCategories VS2.2, “Analytic measures and complete modules”, announces compatible site realizations but does not specify the presentation arrows, cocones or cardinal bounds. Its Conventions likewise names common presentations without defining them. The new supplier gap records the exact interface, with matching slug, needs, supplier and section in the plan. Completing that supplier contract is not actionable in this package; §7.4 explicitly assumes it. The suggested definition did not retain relation maps or require a cutoff containing all light tests. Both are necessary: multiplication by 2 versus 3 has cokernels ℤ/2 versus ℤ/3, and a light Cantor space has cardinality 2^ℵ₀.

For r1b F04, Mathlib/CategoryTheory/Presentable/Finite.lean:49–50 defines finite presentability with an independent index-universe parameter. The equivalence at line 69 chooses the hom universe. Mathlib/CategoryTheory/Limits/Preserves/Filtered.lean:89 supplies shrinking of index universes, rather than arbitrary enlargement. The repair aligns the signature with that native convention; it does not allege a counterexample to the stronger universe-polymorphic statement.

Pattern searches included every occurrence of common presentation, cutoff, transport, finite presentability, lower bounds, nonvanishing, p-power towers and null families in both roadmap files. Besides the finding locations, the corresponding changes affect Scope and ownership, Conventions, both relevant supplier contracts, the §1.3 API, the §1.5 compactness clause, the §6.4 proof route/Needs, §7.4's statement/route/Needs, Layer 7 Dependencies, and the module documentation. The two original supplier gaps are unchanged. No numbered target or Lean declaration was added, deleted or renamed.

## Sources, ownership and pinned carriers

The main-roadmap shape was read in TauCetiRoadmap/EnhancedDerivedSheaves/README.md and TauCetiRoadmap/GeneralizedCohomology/README.md. The content manifest pins Mathlib to 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti to a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The native definitions used for the comparison are:

- Mathlib/Topology/Category/LightProfinite/Basic.lean:42: a CompHausLike category with total disconnectedness and second countability. Its constructor at line 56 also requires compactness and Hausdorffness; it does not assert nonemptiness.
- Mathlib/Condensed/Light/Basic.lean:28: `Sheaf (coherentTopology LightProfinite) C`. This is an ordinary sheaf category, without a spectrum carrier or enhanced hypercompletion.
- Mathlib/Condensed/Light/Module.lean:42 and :85: module-valued light sheaves and their universe-zero integer specialization. Lines 68 and 73 supply ordinary free modules and their adjunction.
- Mathlib/CategoryTheory/Preadditive/Projective/Internal.lean:41–47: internal projectivity means that internal Hom preserves epimorphisms. The retract result is at line 61.
- Mathlib/Condensed/Light/AB.lean:31–37: countable exact products and Grothendieck abelianness. These instances do not state independent countable directed unions. The existing gap:light-countable-ab6 is still required.

Object searches used the main roadmaps, the indexed open-head search, the board packages, the supplied sibling checkouts, and the pinned condensed/category files. The searches covered spectral solidity, null sequences, proper profiles, p-adic null families, internal projectivity and site presentations. No earlier owner of the light spectral p-power comparison was found. HabiroRings §§2.6–2.12 specializes the general theory and explicitly requests it through gap:light-solid-spectra; it is not a supplier of §6.4. The site realization obligation stays with VStackSheavesAndLisseCategories VS2.2. No fully qualified Lean name collides with a readable supplier declaration.

The indexed heads read for the two open suppliers were StableHomotopyKTheory at 00bfbf7 and VStackSheavesAndLisseCategories at 0ca8db7. The supplied sibling heads were searched by object, including HabiroRings and its null-family and profile sections. Unprovided, unindexed open heads were not sought; ownership against such heads was not checked. The board's readable LocallyAnalyticRepresentationsOfLocalGroups design retains its stronger κ-condensed/group-ring requests, outside the present comparison. RefinedTraceMethods and HigherHidaAndColemanTheory have no full roadmap text in the supplied main/indexed snapshots; their consumer-side assertions in the review were not independently certified from those unavailable texts.

The exact cross-roadmap supplier citations were matched to GeneralizedCohomology G2.1–G2.7 and G3.8–G3.9; StableHomotopyKTheory §§5.13–5.18; EnhancedDerivedSheaves §§0.1–0.3, E0.4, E0.8, E1.3, E2:towers, E2.1–E2.3, E2.6–E2.7, E3.2–E3.3, E4.1, E4.4, E5:abstract.2–E5:abstract.5, E5:presentability.1–E5:presentability.2, E5:spectra-comparison and E5:animation.4; and VStackSheavesAndLisseCategories VS2.1–VS2.2 with the named subsections. In particular, `IsReplete.countableProduct_epi` and `IsReplete.milnor` are targets in EnhancedDerivedSheaves E2.1–E2.2, not missing pinned declarations. `ZSolidAnalytification.formalComplement` is a target of VS2.2. The three supplied citation leads therefore require no name deletion.

All nine cited works have certified cached legal texts. No source was missing, no additional source key or reference request was needed, and no fetched source text was copied into the repository. The only manifest edit extends the existing Q key to the two-index argument. Source ranges read for the mathematics and retained locators were:

| Source | Evidence read |
| --- | --- |
| W | W line 437–475: light spectral sheaves, null test, reflection, prime completion and generator |
| MW | MW line 1748–1775: spectral and integer-linear solidity, scalar summability |
| Q | Q line 3643–3715: discrete spectral embedding, split tower and completed sum models, two-index profiles |
| Bosco | Bosco line 3451–3525: completion, Proposition A.3, Lemma A.4, its hypotheses and proof |
| RC | RC line 537–567, RC line 732–795: light abelian foundations, internal projectivity, reflection, tensors and generators |
| RC | RC line 1392–1519, RC line 2114–2145, RC line 3236–3325: hypersheaves, analytic structures, scalar change and discrete Huber pairs |
| CS | CS line 1243–1270 and CS line 1578–1598: compact-Hausdorff integer reflection and derived tensor |
| AG | AG line 1361–1404 and AG line 3014–3065: measure axiom, complete modules and stabilization |
| HTT | HTT line 18705–18726: regular-cardinal filtered interchange |
| AS | AS line 9–44: course identification and transcript limitations; contextual use only |

## Computed adversarial pass

Each row identifies a mathematical statement or API law and records actual values. These computations discriminate conventions and boundary cases; agreement on instances is not a proof of a general target. The source hypotheses and proof inputs above remain part of the roadmap. All 27 numbered targets, 63 API bullets, 108 README Checks, seven Lean declarations, and the conventions were covered. Related Checks appear with the statement they test.

| Statement | Instances tried | Values computed | Result and change |
| --- | --- | --- | --- |
| Site, empty objects and finite rank convention | ∅; a pair; ranks 2,3 | M(∅)=0; M(2)=M(*)²; 2·3=6 | Retained |
| Cutoff bound | Cantor test; C; κ=ℵ₀ | cardinalities 2^ℵ₀ and ℵ₀; neither is less than ℵ₀ | Require κ>2^ℵ₀ for all light tests |
| Common presentation data | Relations 2x=0 and 3x=0 | Same rank-one free terms; cokernels ℤ/2 and ℤ/3 | Retain arrows and cocones |
| Successive presentation realizations | Free singleton; zero diagram | ℤ→ℤ→ℤ gives identity; 0→0→0 gives identity | Coherence required in supplier gap |
| Left modules and right endomorphism action | Row (1,0); e₁₂,e₂₁ | (1,0)e₁₂e₂₁=(1,0); (1,0)e₂₂=0 | Right action retained in §§2.4,7.3 |
| Homological grading | ΣHℤ; cochain ℤ in degree 2 | π₁=ℤ, π₀=0; π₋₂=ℤ | Retained |
| Symmetry sign | Degrees (1,1); (0,0) | (−1)¹=−1; (−1)⁰=1 | Retained in §3.1 and supplied grading |
| Spectra versus Hℤ-linear objects | Sphere; Hℤ | π₁𝕊=ℤ/2; π₁Hℤ=0 | No coefficient replacement |
| Derived versus animated commutativity | 𝔽₂ polynomial generator | H_i(BΣ₂;𝔽₂)=𝔽₂ for i≥0; animated polynomial has π_i=0 for i>0 | Rational-only equivalence retained |
| Marked precomposition convention | e₁; e₀ | σ*e₁=e₀; σ*e₀=0; (1−σ*)(e₁+e₀)=e₁ | Sign retained everywhere |
| Condensed product versus discrete product | e_n in ℤ^ℕ | Each coordinate eventually 0; vector never 0 | Distinct realizations retained |
| Sphere-linear versus algebra-linear section | A=𝕊[t], quotient by t | s(t·1)=0; t·s(1)=t≠0 | Splittings remain sphere-linear |
| Formal monoid algebra convention | Quotient by t² | Basis 1,t; t·t=0 | Not a free commutative spectral algebra |
| Quotient cofiber convention | Scalars 1 and 0 | cofib(1)=0; cofib(0)=M⊕ΣM | Retained |
| Divisibility transition | a_s=a_r b | Square composites both a_r b=a_s | Direction (b,id) retained |
| Profile direction | f(j)=j+1≥j=g(j) | t^(j+1)x maps to the same element in t^jA | No reversed inclusion |
| Prime quotient convention | H𝔽₂; H𝔽₃ | X/p^r=X⊕ΣX; transition diag(1,0); limit X | Retained |
| Completed unit | p=2,3 | π₀ of completed unit ℤ₂,ℤ₃; ambient unit ℤ | Unit map is 1↦1 |
| §1.1 hypersheaf definition | Empty cover; identity hypercover | Empty totalization 0; constant identity totalization M(T) | Descent retained |
| §1.1 free evaluation law | T=* and T=2 | Map(𝕊,M)=M(*); Map(𝕊²,M)=M(*)² | Retained |
| §1.1 extensionality | Maps ℤ→ℤ given by 1 and 2 | Values at 1 are 1 and 2; maps differ | Values detect difference |
| §1.1 free tensor | T=2,U=3; T=∅ | Six free basis pairs; empty factor gives 0 | Retained |
| §1.1 ordinary free versus measure | C at * and at 2 | π₀ free values ⊕_Cℤ and (⊕_Cℤ)²; all-one vector absent at * | Distinguishes unreflected free object |
| §1.2 discrete adjunction and unit | X=0; X=𝕊⊕Σ𝕊 | Point units 0→0; π₀=ℤ, π₁=ℤ/2⊕ℤ on both sides | Retained |
| §1.2 map and shift functoriality | 1 and 0 on Hℤ; ΣHℤ | Composites 1·0=0; shifted π₁=ℤ | Retained |
| §1.2 monoidal coherence | Two and three discrete spheres | Both parenthesizations give six spheres; unit rank 1 | Retained |
| §1.2 inverse-limit comparison | T=ℤ_p, lim_r H(ℤ/p^r) | Identity section T→ℤ_p has infinite image; locally constant section has finite image | No general limit equivalence |
| §1.3 lifted C_u | Finite quotients n=0,1,2 | Sizes 1,2,3; reduced free ranks 0,1,2 | Explicit larger-universe target |
| §1.3 marked cofiber | Marked singleton | cofib(1:𝕊→𝕊)=0; unreduced free object 𝕊 | Retained |
| §1.3 pointed-map functoriality | Identity; composite of two shifts | [0]↦[0]; [0]↦[2] | Retained |
| §1.3 internal-Hom fiber | Discrete integers; marked singleton | Null maps to ℤ give finite-support sequences; singleton reduced Hom=0 | Retained |
| §1.3 coefficient precomposition | e₁; wrong right shift | Correct difference e₁−e₀; wrong difference e₁−e₂ | Retained |
| §1.3 lifted marked diagram | u=0 and a larger u | P_u(*)=⊕_ℕℤ_u; ∞ maps to ∞ after shift; all-one vector absent | Precise diagram comparison added |
| §1.3 internal lifting | Identity epi on ℤ_u; zero target | Identity lift over S′=S; zero map lifts as 0 | Local lifting quantified for every epi and light S |
| §1.5 natShift | 0,1,∞ | Images 1,2,∞ | Definition retained |
| §1.5 inftyPoint | Sole point; wrong mark 0 | ∞ remains ∞ under shift; 0 instead becomes 1 | Definition retained |
| §1.5 nullSeq | Point evaluation; marked singleton | (⊕_Cℤ)/ℤ[∞]=⊕_ℕℤ; singleton quotient 0 | Genuine cokernel retained |
| §1.5 nullShift | [0],[1],[∞] | Images [1],[2],0 | Induced endomorphism retained |
| §1.4 spectral solidity definition | 0; δ𝕊; N | Zero test invertible; δ𝕊 retains π₁=ℤ/2; N(*) has direct-sum π₀ versus reflected product | Definition retained |
| §1.4 external orthogonality law | 0; finite-support e₁ against δHℤ | Mapping test 0; difference inverse e₁↦e₀+e₁ | Tensor–Hom direction retained |
| §1.4 equivalence invariance | Identity on δHℤ | Conjugating the test by identity leaves e₁−e₀ | Retained |
| §1.4 arbitrary discrete solidity | δHℤ; ΣδHℤ | Inverse sends e₁ to e₀+e₁ in degree 0 or 1 | All shifts retained |
| §1.5 IsLightSolid | 0; ℤ; topological ℝ | Identity on 0; finite tail sums for ℤ; harmonic partial sums diverge for ℝ | Predicate retained |
| §1.5 abelian closure and Hom | Extension 0→ℤ→ℤ→ℤ/2→0, with first map ×2 | Kernel of ℤ→ℤ/2 is 2ℤ≅ℤ; cokernel ℤ/2; Hom(P,ℤ) tail inverse as above | Retained; extension tested on solid terms |
| §1.5 reflection headline | 0; ℤ; topological ℝ | Reflections 0,ℤ,0 | Deep theorem retained |
| §1.5 generator projectivity | G_ℤ=∏_ℕℤ; reduction mod 2 | Coordinatewise map onto ∏_ℕ𝔽₂; constant all-one vector survives | Projective product model retained |
| §1.5 finite presentability | Discrete sums of ℤ; native category | Hom(G_ℤ,⊕_nℤ)=⊕_n Hom(G_ℤ,ℤ); each individual map uses finitely many summands | Fixed index universe 1 |
| §1.5 separator and infinite-S condition | Q=topological ℤ_p/discrete ℤ_p | Q(*)=0; class of (p^n) in Q(C)≠0 | Finite measures fail to generate; infinite generator retained |
| §1.5 derived reflection headline | ℤ[1]; ℝ[0]; 0 | H⁻¹ℤ[1]=ℤ; H⁰ℝ[0]=ℝ; respective reflections ℤ[1],0,0 | Explicit HasDerivedCategory binder retained |
| §1.5 derived equivalence and tensor | ℤ/2 over ℤ; unit ℤ | (ℤ/2)⊗ᴸ(ℤ/2) has H⁰=H⁻¹=𝔽₂; ℤ is tensor unit | Enhanced monoidal theorem stays in README |
| §1.5 free integer measure | S=∅,*,2,C | Values 0,ℤ,ℤ²,ℤ×∏_ℕℤ; reduced measure ∏_ℕℤ | Retained |
| §1.5 countable product tensor | I=∅; sizes 2,3; I=J=ℕ | 0; ℤ⁶; ∏_(ℕ²)ℤ, no higher Tor | Retained |
| §1.5 flatness law | B=0; B=ℤ/2; two copies of ℤ/2 | 0; ∏𝔽₂ only in degree 0; Tor₁(𝔽₂,𝔽₂)=𝔽₂ | Flat generator distinguished from arbitrary object |
| §2.1 null-Hom and homotopy detection | ΣHℤ; 0 | Hom(P,ΣHℤ) has degree 1 finite-support group; zero has all groups 0 | Retained |
| §2.1 truncation API | ΣHℤ truncated at degree 0 or 1 | τ_≤0=0; τ_[1,1]=ΣHℤ | Retained |
| §2.1 heart API | Hℤ; H𝔽₂ | π₀=ℤ,𝔽₂; π_k=0 for k≠0 | Retained |
| §2.1 suspension API | Hℤ and zero module | Lower degree 0 becomes 1; 0 has every bound | Retained |
| §2.1 algebra not determined by heart | 𝕊⊕Σ𝕊 with square-zero ideal | π₀=ℤ; π₁=ℤ/2⊕ℤ; ideal square 0 | Retained |
| §2.2 reflection and connective preservation | 0; δ𝕊; free measure on 2 | Outputs 0,δ𝕊,δ𝕊², all connective | Retained |
| §2.2 reflection universal map | Already solid ℤ | Unit and counit both identity of ℤ | Retained |
| §2.2 idempotence API | Reflected zero; reflected unit | Both iterated units 1_0 and 1_𝕊 | Retained |
| §2.2 closed tensor API | C=unit; D=M | Hom(1⊗M,M)=Hom(M,M)=Hom(1,Hom(M,M)) | Retained |
| §2.2 spectral measure/projection API | Reduced C quotients | Free ranks 0,1,2,…; limit ∏_ℕδ𝕊; projections select finite coordinates | Retained |
| §2.2 module tensor lower bound | Σ^bA,Σ^cA; zero factor | Tensor Σ^(b+c)A; zero tensor 0 | Retained |
| §2.2 internal Hom versus abstract Hom | G→δH𝔽₂ | Degree-zero maps ⊕_ℕ𝔽₂; abstract group dual has cardinality 2^(2^ℵ₀) | Correct category retained |
| §2.3 Hℤ-linear equivalence | Hℤ; H𝔽_p⊗_HℤH𝔽_p | ℤ[0]; π₀=π₁=𝔽_p for p=2,3, other groups 0 | Relative derived tensor retained |
| §2.3 first-homotopy detection | Σ^b𝕊→Σ^bHℤ | Bottom map ℤ→ℤ is identity; fiber vanishes through degree b | Retained |
| §2.3 animated comparison | Free polynomial over 𝔽₂ | Animated positive groups 0; derived symmetric-power contribution H_i(BΣ₂;𝔽₂)=𝔽₂ | No general equivalence |
| §2.4 generator description | G; A=0 | π₀G(*)=ℤ^ℕ; π₁G(*)=(ℤ/2)^ℕ; G_0=0 | Retained |
| §2.4 reflection-unit API | Basis [0]; finite coordinate projection | [0] has coordinate 1 at 0, 0 at other coordinates | Retained |
| §2.4 all homotopy sheaves API | k<0; k=0,1 | 0; ∏δℤ; ∏δ(ℤ/2) | Retained |
| §2.4 module adjunction API | M=0; A=unit | Both mapping spectra 0; both Map(G,M) | Retained |
| §2.4 t-exact generator and endomorphisms | A=0; Hℤ-linear rank-two retract | Zero endomorphism spectrum; degree-zero matrix ring M₂(ℤ), no negative groups | Right action agrees with convention |
| §3.1 product comparison | Empty factor; ranks 2,3 | Both 0; six spheres, coordinate (1,2) gives 1 on its basis tensor | Retained |
| §3.2 split tower definition | Constant 0; constant sphere; ×2 | Limits 0,𝕊; no integer b solves 2b=1 | Split hypothesis retained |
| §3.2 data/right-inverse API | Projection ℤ²→ℤ and section x↦(x,0) | d(s(x))=x | Retained |
| §3.2 coherent-map API | Two identity tower maps | Each finite projection and resulting limit map are identity | Retained |
| §3.2 decomposition API | P_n=𝕊^(n+1), n=0,1,2 | Ranks 1=1,2=1+1,3=1+1+1 | Retained |
| §3.2 independence of sections | Sections x↦(x,0), x↦(x,x) | Both split d; decompositions related by (x,y)↦(x,y+x), determinant 1 | Compatible limit retained |
| §3.3 independent towers | Growing towers, (m,n)=(1,2); constant spheres | Stage rank 2·3=6; constant limit tensor 𝕊 | Retained |
| §3.3 diagonal direction | Stages (1,2),(3,0) | Diagonal stages 2 and 3 map to them respectively | Correct inverse-index direction |
| §3.4 balancing | A=𝕊[t], X=Y=A; A=𝕊 | Absolute π₀=ℤ[t₁,t₂]; balanced π₀=ℤ[t], t₁,t₂↦t; unit case X⊗Y | Retained; §3.3 added to Needs |
| §3.4 scalar transitivity | Identity maps; zero module | Iterated extension M; extension of 0 is 0 | Retained |
| §3.4 dualizable limit exchange | B=A²; B=ℚ over ℤ | A² tensor product commutes with products; (2^(−n)) has no common denominator in ℤ^ℕ⊗ℚ | Dualizability hypothesis retained |
| §4.1 interchange | Empty K; point K or J | 0=0; identity on the corresponding limit or colimit | Retained with supplier gap |
| §4.1 failure for ordinary filtered index | F(n,k)=Hℤ for k<n | Left π₀=⊕_ℕℤ; right π₀=∏_ℕℤ; all-one only on right | ω₁-filtered requirement retained |
| §4.1 fixed-algebra module version | A=0; A=unit | Both sides 0; reduces to spectral comparison for unit | Retained |
| §4.2 independent-bound law | B_j=ℚ, stages (1/n!)ℤ | Independent α_j=j+1 contains 1/(j+1)!; no single denominator contains all | Existing AB6 gap retained |
| §4.2 zero and empty cases | All B_j=0; empty family | Both products and colimits 0 | Retained |
| §4.2 split-limit homotopy law | Truncations ℤ^(n+1) | lim=ℤ^ℕ; each projection onto; lim¹=0 | Retained |
| §5.1 split coefficient definition | 𝕊[[t]]; A=0; p-power tower | Stages ranks 0,1,2; zero stages all 0; π₀(𝕊/p)=𝔽_p | p-power tower excluded |
| §5.1 equivalent-data API | Identity map on t-adic datum | Quotient maps identities; completed map identity | Retained |
| §5.1 marked fiber API | a_r=t^r; r=0 | J_r≃A with map t^r; J₀=A with map 1 | Retained |
| §5.1 completion-unit API | M=A; M=0 | A→lim B_r is identity under completeness; 0→0 | Retained |
| §5.1 cofinal reindexing API | Stages r and 2r | Both limits ℤ[[t]] on π₀; coefficient at t^m stabilizes for r>m | Retained |
| §5.1 relative cofiber API | a=1 and a=0 | M⊗_A0=0; M⊗_A(A⊕ΣA)=M⊕ΣM | No quotient-algebra claim |
| §5.1 formal completion Check | cofib(t) on truncated stages | A stage gives 𝕊⊕Σ𝕊t^(r−1); top-degree transition 0; limit 𝕊 | Sphere stems retained |
| §5.2 proper-profile definition/API | f(j)=j; f=0 | Sublevel at r has r elements; zero sublevel at 1 is infinite | Retained |
| §5.2 filteredness API | id,2id; f_k(j)=max(j−k,0) | min(id,2id)=id; common target for all f_k would be 0 | Filtered, not ω₁-filtered |
| §5.2 transition API | f≥g≥h at values 3,2,0 | t·t²=t³; identity exponent 0 gives 1 | Retained; subtraction used only under inequality |
| §5.2 block identity/composition API | Identity; zero; duplication twice | Supports {j},∅,{4j,4j+1,4j+2,4j+3} | Retained |
| §5.2 compact block-factorization API | One block mapping identically to output 0 | Support {0}; all empty blocks give V_f=0 | Existing compactness route retained |
| §5.3 completed-sum equivalence | Singleton blocks over 𝕊[[t]] | (t^j) has r surviving blocks mod t^r; (1) has infinitely many | Retained |
| §5.3 finite/infinite block boundaries | Only blocks 0,1; only I₀=ℕ | A² on both sides; ∏_ℕA on both sides by f(0)=0 | No decay within one block |
| §5.4 all-degree formula | k<0; k=1 over 𝕊[[t]] | All negative terms 0; π₁A=(ℤ/2)[[t]], survivors η,ηt mod t² | Retained |
| §5.4 block-map naturality | Duplication of t^j | Mod t² outputs 0,1,2,3 with weights 1,1,t,t | Retained |
| §5.4 fold and datum-map naturality | Fold; identity datum map | Sum 1+t mod t²; (1−t)(1+t)=1−t²≡1; identity preserves coefficients | Unit denominator justified |
| §6.1 uniformly bounded resolution | 0; Σ^bG_A; arbitrary coproduct of these | Realizations 0 and the same modules; all π_k below b vanish | Retained |
| §6.1 resolution comparison | Identity on constant resolution | Realized map identity, including 0 | No uniqueness of presentations asserted |
| §6.1 negative family | A=δ𝕊; A=0 | π_(−n)=ℤ^ℕ≠0 for sphere; 0 in every degree for zero algebra | Repaired r1a F01 |
| §6.2 exact completion | Identity cofiber sequence; zero tower | Completed identity sequence has zero cofiber; completed zero 0 | Retained |
| §6.2 sharp lower bound | M=Hℤ, a_r=2^r | Bottom groups ℤ/2^r, onto transitions; limit ℤ₂, lim¹=0, π₋₁=0 | Retained |
| §6.2 ideal/quotient distinction | Ideal tower 2^rℤ | Ideal limit 0, lim¹=ℤ₂/ℤ; quotient limit ℤ₂, lim¹=0 | Retained |
| §6.3 realization comparison | Constant M; normalized degree-one M | Identity ΛM→ΛM; layer ΣM has bound b+1 | Retained |
| §6.3 tail estimate | First omitted normalized degree d+1 | Suspension contributes d+1; lower bound b+d+1 before and after completion | Retained |
| §6.3 balanced bar action | X=Y=A; A connective | Bar terms multiply to A; X-factor A-action realizes to multiplication | Retained |
| §6.3 failure without uniform bound | Split N_n=Σ^(−n)A, zero differentials | For sphere tail π₀=⊕_(n>d)ℤ; for A=0 tail 0 | Repaired r1a F01 |
| §6.4 completed embedding/evaluation | H𝔽₂,H𝔽₃; 0 | Point evaluation of completion X; units 1_X and 1_0 | Retained |
| §6.4 orthogonality reflection | p-inverted Hℤ[1/p]; H𝔽_p | Quotients and completion of first 0; completion of second H𝔽_p | Retained |
| §6.4 bounded-below tensor closure | Hℤ_p relative over Hℤ; zero factor | Hℤ_p; 0, both p-complete | Endpoint retained; missing inputs made targets |
| §6.4 completed ordinary tensor | Completed sphere; 0 | A_p⊗■A_p=A_p target; zero comparison 0→0; units π₀=ℤ_p | Unit not replaced by δ𝕊 |
| §6.4 integer completed-tensor model | H𝔽_p relative over Hℤ_p | π₀=π₁=𝔽_p for p=2,3 | No underived substitution |
| §6.4 integer null-family map | Singleton blocks, p=2,3 | Mod p² survivors (1,2) or (1,3); constant ones not null | Added |
| §6.4 integer null-family boundaries | One infinite block; no blocks | ∏_ℕℤ_p on both sides; 0 on both sides | Added |
| §6.4 finite-output naturality | Fold of singleton p^j blocks | Sum mod p² is 1+p, hence 3 mod 4 and 4 mod 9 | Finite reductions define map |
| §6.4 marked spectral fiber | p=2, r=1; p=3 | π₁K₁=𝔽₂ with marked π₁-map 0; π₁A₃=0 | Avoid image-subgroup substitution |
| §6.4 spectral null-family equivalence | Singleton blocks, π₁ at p=2 | Transition lowering positive exponent acts by 2=0; colimit ⊕_ℕ𝔽₂; completed coproduct has the same degree-one group | Added |
| §6.4 bounded-interval compatibility | τ_[0,0], τ_[1,1], τ_[−2,−1] | Integer p-null families; Σ of the preceding torsion group; 0 | Every interval named |
| §6.4 completed-generator product | Empty indices; sizes 2,3 | 0; π₀=ℤ_p⁶ and π₁=(ℤ/2)⁶ at p=2 | Explicit tensor input added |
| §6.4 existence of separated profiles | h(j,k)=max(j,k); (j,k)=(1,2) | f=⌊j/2⌋,g=⌊k/2⌋; 0+1=1≤2 | Added with general row/column minimum argument |
| §6.4 properness of sum profiles | f(j)=j,g(k)=k; r=0,1,2 | Sublevel sizes 0,1,3, equal to r(r+1)/2 | Added; constant zero fails |
| §6.4 finality direction | h=max; two chosen pairs | h→f⊞g; coordinatewise minimum pair has sum at most either original sum | Nonempty filtered comparison category |
| §6.4 arbitrary coproduct passage | Countable sets Iₙ⊆I | Union ⋃ₙIₙ is countable, an upper bound; empty union ∅ | Uses ω₁-filtered subset poset, not profile poset |
| §7.1 analytic-structure definition | All modules; zero category; perfect Hℤ-modules | L=id; L=0; ⊕_ℕHℤ is not perfect | Reflective/closure axioms discriminate |
| §7.1 unit determines completedness | Full or zero subcategory | A→A invertible; A→0 invertible iff A=0 | Both directions retained |
| §7.1 specified reflector API | Same full image with unit fixed | Full-image identity forces unit 1_A, excluding multiplication by 2 on ℤ | Marking retained |
| §7.1 analytic morphism API | Identity; composite of identities | Restriction is identity; composite still identity | Retained |
| §7.2 completed tensor and coefficient | D=all; D=0 | Unit A; unit 0; zero tensor 0 | Uncompleted coefficient kept |
| §7.2 scalar adjunction | Identity algebra/structure | Both mapping objects Map(M,N) | Retained |
| §7.2 transitivity API | A→A→A; M=0 | Extension M; extension 0 | Retained |
| §7.2 commuting-square API | Full structures over ℤ→𝔽₂ | Derived pushout π₀=π₁=𝔽₂; both paths give that pushout | Derived relative tensor retained |
| §7.2 non-pushout square | A=A′=B=Hℤ, B′=H𝔽₂ | Algebra pushout Hℤ; both scalar paths H𝔽₂ | Pushout unnecessary |
| §7.2 target localization | Same rings, target complete category 0 | Both paths 0; intermediate kernels 0, target kernel all modules | No kernel-generation requirement |
| §7.3 summability definition | F=∅,{0},{1} | Test absent, identity, or solid null test; all solid modules local | Retained |
| §7.3 exact localness API | Discrete f; b=e₁ | (1−fσ*)(e₁+fe₀)=e₁ | Coefficient representatives identified coherently |
| §7.3 free-object universal property | F=∅; zero input | L_FC=C; L_F0=0 | Retained |
| §7.3 enlarging tests API | F=∅⊆{T}, T acts as 1/p | Null vector p^n has (1−Tσ*)p^n=0 and first term 1 | Correct inclusion D_{T}⊆D_∅ |
| §7.3 coefficient-map API | Identity; ℤ[T]→ℚ_p, T↦1/p | Identity keeps T; image test gives the same zero kernel vector p^n | Compatibility concerns specified tests |
| §7.3 nilpotent inverse API | ε²=0 in 𝔽₂[ε] | (1−εσ*)(1+εσ*)=1 | Retained at nonreduced p=2 |
| §7.3 generator/integral-closure API | R=ℤ[T], R⁺=ℤ or ℤ[T] | F=∅ or {T}; coefficient unit still R→R | Discrete Huber-pair assertion retained |
| §7.3 noncompleted example | A=topological Hℚ_p, f=1/p, p=2,3 | p^n−p^(n+1)/p=0 with b₀=1 | A itself fails the test |
| §7.3 nonreduced polynomial pair | εT in (𝔽₂[ε]/ε²)[T] | (εT)²=0, inverse 1+εTσ*; εT not constant | Integral closure retained |
| §7.3 monadic right-action check | φ=(1,0), e₁₂,e₂₁ | φe₁₂e₂₁=(1,0), φe₂₂=0 | Same action as §2.4 |
| §7.4 transported measure category | Integer measures on ∅,*,2 | Complete free objects 0,ℤ,ℤ² | Comparison retains free units |
| §7.4 completedness criterion | Full measure structure; zero reflected structure | Dirac B→B identity; B→0 equivalence iff B=0 | Both directions retained |
| §7.4 static coefficient comparison | B=ℤ/2; topological B=ℚ_p | Free generator ∏𝔽₂ in degree 0; π₀HB=B, other groups 0 | Static distinguished from discrete |
| §7.4 relative derived tensor | B=ℤ/2 | B⊗ᴸ_ℤB has Tor₁=𝔽₂ | No underived tensor substitution |
| §7.4 topological E measures | Infinite I, E=ℚ_p | (p^(−n)) has unbounded denominators; p^n→0 is not eventually constant | Smith measure and topological realization retained |
| §7.4 cutoff cocone comparison | C finite quotients n=0,1,2 | Ranks 1,2,3; free reduced point group ⊕ℤ versus solid ∏ℤ | New boundary Checks and supplier gap |
| §7.4 size and arrow controls | Cantor test; relation diagrams ×2,×3 | Size 2^ℵ₀; cokernels ℤ/2,ℤ/3 | New Checks distinguish inadequate presentations |
| Habiro downstream ranks | (q;q)₁,(q;q)₂ | Degrees 1 and 3; finite free sphere ranks 1 and 3 | Arithmetic ownership unchanged |

The abelian extension row uses the exact sequence 0→ℤ→ℤ→ℤ/2→0 with first map multiplication by 2; the identified kernel is 2ℤ. This spells out the maps rather than relying on the isomorphic labels of its terms.

## Mechanical checks

The required acceptance elaboration ran from the pinned content checkout using `lake env lean` on the absolute path to `packages/SolidAnalyticRings/Suggested.lean`. Exit status: 0. Output consisted of exactly two warnings, at lines 119 and 129, both `declaration uses sorry`. No Tau Ceti import is used, so no missing-object build was needed. No Lean process remains running.

One scratch copy contained the complete repaired file followed by `#check @name` for all seven declarations. It elaborated once, exit 0, with the same two warnings. The effective signatures agree with README §1.5:

| Declaration | Elaborated type/context | Change |
| --- | --- | --- |
| natShift | Native universe-zero convergent-sequence endomorphism | None |
| inftyPoint | Map from native PUnit light space to that sequence | None |
| nullSeq | LightCondAb | None |
| nullShift | nullSeq endomorphism | None |
| IsLightSolid | ObjectProperty LightCondAb | None |
| isLightSolid_reflective_and_generator | Reflection and existence of the specified solid product with projectivity, finite presentability and separator property | Index universe explicitly 1; theorem has no universe parameter |
| derivedLightSolid_isRightAdjoint | For every chosen HasDerivedCategory LightCondAb, reflection of the full subcategory with solid cohomology in every integer degree | Required instance binder remains explicit |

There are no section variables to lose. Every declaration still has a README occurrence. The file retains one `import Mathlib`, seven documented declarations, two admitted theorems, no admitted data, no options and no additional API/Check declarations. The new spectral comparisons are identified in the module documentation as unavailable without the enhanced spectral carriers; they have no weakened Lean substitutes.

The required dependency check used the specified configuration, package name, merge order and `--movable` flag. Exit status: 0. Its exact output was:

```text
depcheck: 27 roadmaps, 234 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The dependency edges are unchanged by the more precise supplier contract. The final citation resolver exited 0 and reported no unresolved cross-roadmap citations or Lean names; its warning that it could not locate pinned Lake packages was addressed by the direct pinned-file inspection and the actual Lean elaborations above, rather than treated as library verification.

JSON and TOML parse successfully. Comparing the plan against the starting revision after removing the top-level gaps key gives identical objects; both original gap entries are identical. The added gap has the required four fields and an identical needs sentence under Exact supplier contracts. The source manifest retains exactly the same nine work keys, all certified. Whitespace validation with `git diff --check` passes. No gate failures were supplied beyond the review findings.

## Maintainer consequences

The site-comparison gap must be discharged by VStackSheavesAndLisseCategories VS2.2; its presence is an explicit dependency, not completion of the supplier's work. The larger-universe internal-projectivity target remains owned here and does not depend on that gap. The two original supplier gaps, including the arbitrary-coproduct interchange input used by §6.4, remain outstanding as before.

No Lean name used by consumers changed. The p-complete contract is strengthened by specifying its previously implicit proof inputs, and its completed sphere unit remains the same. Consumer requests for profinite group rings, unrestricted inaccessible-cutoff representation categories or localization-kernel geometry are not discharged by this repair. Files outside the authorized package files and this report were not edited; no tooling, merge order, commit or remote write was made.
