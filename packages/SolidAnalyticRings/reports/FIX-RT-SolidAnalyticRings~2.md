# SolidAnalyticRings repair report

Each finding section names its review pass in its body, because each pass restarts its finding numbers. The overlap between r2a/F01 and r2b/F02 is settled by one universe-polymorphic construction. All six findings have an explicit disposition. Mathematical tests below are computations, not proofs supplied by the admitted Lean declarations.

## F01 (P2) — applied

Review: r2a.

Universe-zero acceptance statements → reflection, compact projective generator and ordinary derived reflection over ULift.{u} ℤ for every u. Generalized the five supporting definitions, added the lifted sequence carrier, and fixed filtered-index universe u+1 explicitly. Updated Conventions’ supplier explanation, How to read, §§1.3–1.5 and the module documentation. The derived-category instance remains explicit.

Evidence: Mathlib/Condensed/Light/Module.lean:42,68 and Light/Monoidal.lean:41,56 provide the native carriers at arbitrary u. Homeomorph transport supplies the sequence without a site-equivalence construction. RC line 541 and RC line 754–787 provide the mathematical targets; their light-site proofs and §1.3’s transport are the proof obligations, rather than prerequisites to stating them.

## F02 (P2) — applied

Review: r2a.

Ordinary closed tensor classified as unstatable → existential closed symmetric monoidal reflection on the actual light-solid full subcategory. Added `isLightSolid_closed_monoidal_reflection` for every u and its README §1.5 name. Removed only the erroneous ordinary-tensor exclusion; enhanced derived monoidal carriers remain explicitly missing. No reflector or monoidal data definition is admitted.

Evidence: RC line 759, together with internal-Hom closure at RC line 766, supports the target. Mathlib/CategoryTheory/Monoidal/Closed/Basic.lean:46 supplies closedness; Monoidal/Braided/Basic.lean:530 makes `Functor.Braided` extend strong monoidality. Thus the signature includes invertible unit and tensor comparisons, rather than merely a lax structure. Ranks 2 and 3 give rank 6; the unit is ℤ_u, excluding a zero tensor.

## F01 (P2) — applied

Review: r2b.

Regular cardinality cutoffs → uncountable strong limit cutoffs, allowing singular cutoffs. Changed every cutoff occurrence in Conventions, the exact site-comparison contract, §7.4, References and the existing plan gap’s needs. Added the excluded regular-successor and admitted ℶ_ω Checks. Extended the existing CS and AG manifest locators. The separate regular index-cardinal interchange contract is unchanged.

Evidence: CS line 116–119 specifies strong limits, CS line 148–150 bounds the Stone–Čech cover by 2^(2^|S|), and AG line 2934–2937 uses the same hypothesis for the extremally disconnected presentation. The successor (2^ℵ₀)^+ fails this closure. An infinite extremally disconnected compactum contains βℕ: choose disjoint nonempty clopens, choose one point in each, and extend the resulting map ℕ→S to βℕ. Closures of the unions indexed by complementary subsets are disjoint clopens, separating distinct ultrafilters. Hence the extension is injective and |S|≥2^(2^ℵ₀). At the excluded bound only finite extremally disconnected tests remain; these cannot finitely cover C.

## F02 (P2) — applied differently

Review: r2b.

Missing larger-universe projectivity headline → `internallyProjective_free_liftedSequence` on the same lifted carrier used for r2a/F01. Used local transported topology instances inside `liftedSequence`, avoiding separate global instances and a second carrier. Named the declaration in §1.3 and retained the existing universe-zero theorem solely as a Mathlib supplier. Added the lifted marked-square Check; no Check theorem was added.

Evidence: Mathlib/Condensed/Light/Sequence.lean:20–22 fixes its coefficient ring in Type 0; its theorem at line 302 therefore does not state this all-universe result. The new theorem is not a restatement of that pinned theorem. RC line 548–574 supplies the internal lifting argument; §1.3 records the local cover and lift required in larger universes. At u=0 the standard homeomorphism and ring equivalence recover the native result.

## F03 (P3) — applied

Review: r2b.

Algebra structure taken from the tensor-closure endpoint → the commutative algebra of the completed tensor unit, constructed first from the p-power reflection. Added its tensor-ideal kernel, unit-compatible localization comparison, API law, proof and p-inverted/𝔽_p Checks. Added EnhancedDerivedSheaves E5:abstract.3 to §6.4’s Needs and Layer 6 Dependencies. The null-family calculation now uses this prior algebra.

Evidence: the tower triangle has fiber T(M)=lim(M←p M←p⋯), with p invertible on T(M) by shifting the tower. Therefore M→L_pM is an equivalence modulo p; ker L_p consists exactly of M with M/p=0. Exact tensor gives (M⊗■N)/p≃(M/p)⊗■N, proving the ideal property without tensor closure of complete objects. EnhancedDerivedSheaves E5:abstract.3 supplies the monoidal-localization formalism; GeneralizedCohomology G3.9 and EnhancedDerivedSheaves E5:spectra-comparison supply the Moore/tower comparison. W line 452–462 is the spectral endpoint, not a claim that its proof supplies these generic inputs.

## F04 (P3) — not actionable in this package: HabiroRings must replace its duplicate target

Review: r2b.

Locally moved the generic two-index profile statement, proof, locators and Check from §6.4 to §5.2; separated its elementary dependencies from coefficient-block dependencies. §6.4 now applies §5.2. Corrected Scope and Downstream consumers’ ownership boundary. Full resolution also requires HabiroRings §2.11 to replace its duplicate declaration by this supply; its files are outside the authorized edits.

Evidence: at the supplied HabiroRings head, `TauCetiRoadmap/HabiroRings/README.md:681` and `TauCetiRoadmap/HabiroRings/Suggested.lean:120` state the same separable-profile lemma. Properness on ℕ² equals radial divergence, since {j+k<B} is finite and every finite subset has bounded j+k. Q line 3713–3715 states this combinatorial input. SolidAnalyticRings precedes HabiroRings in `merge-order/ORDER.txt` (150 versus 219). No supplier gap pointing to this later consumer was added, and no statement falsely says the consumer has already removed its target.

## Verification outcomes

- Required elaboration of `packages/SolidAnalyticRings/Suggested.lean`, run from the content repository: **exit 0**, four warnings, each “declaration uses `sorry`”, at lines 124, 137, 148 and 161. These are exactly the four headline theorems. There are no Tau Ceti imports, hence no missing object files or targeted module builds.
- Mechanical signature probe: copied the final acceptance file into one scratch file, appended `#check @name` for **all ten declarations**, and elaborated it once after the final carrier change. Outcome: **exit 0**, the same four admitted-theorem warnings. Compared every elaborated type with §§1.3–1.5. The six definitions and four theorems carry u; finite presentability explicitly chooses u+1; the ordinary derived reflection retains `HasDerivedCategory (LightCondMod (ULift.{u} ℤ))`. There are no section variables and no dropped binders. The marked singleton is explicitly the lift of PUnit in Type 0.
- Required dependency check: **exit 0**, exact output:

```text
depcheck: 27 roadmaps, 234 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. This also holds after the final README proof clarification.

- Citation resolver: exit 0; no cross-roadmap citations found nowhere and no Lean names found nowhere. Its notice that external pinned Lean names were not checked was handled by inspecting the actual pinned files directly; resolver success was not substituted for that inspection.
- `git diff --check`: **exit 0**, no whitespace errors.
- Diff integrity: only the README, Suggested.lean, sources.toml, the existing top-level gap needs sentence in design/plan.json, and this report changed. All plan data except its top-level gaps list is identical; the other two gaps are identical. metadata.toml is unchanged.
- Report-heading gate failure: replaced pass-prefixed heading IDs with the reviews’ bare finding IDs and moved pass labels into the section bodies. The worker’s report parser recognizes all six sections; its coverage check reports no missing findings. This formatting repair changes only this report; the mathematical deliverables and their recorded elaboration and dependency outcomes are unchanged.

## Citation, ownership and acceptance audit

Read the main-branch GeneralizedCohomology and EnhancedDerivedSheaves roadmaps for shape and the actual supplier contracts. Used the roadmap list, object search and show tools; inspected the supplied HabiroRings head and searched the supplied sibling checkouts and board packages by object. The all-universe light null test and sphere-linear coefficient instances remain this roadmap’s direction. Generic monoidal localization remains EnhancedDerivedSheaves E5:abstract.3. The compact-Hausdorff measure theory remains VStackSheavesAndLisseCategories VS2.1–VS2.2.

Supplier citations were resolved against main for GeneralizedCohomology and EnhancedDerivedSheaves, not their revision pull requests. The new-roadmap suppliers StableHomotopyKTheory and VStackSheavesAndLisseCategories were read through their indexed heads 00bfbf7 and 0ca8db7. HabiroRings was read at the supplied head bb5d6cb. All cited supplier sections exist: GeneralizedCohomology G2.1–G2.7 and G3.8–G3.9; StableHomotopyKTheory §§5.13–5.18; EnhancedDerivedSheaves §§0.1–0.3, E0.4, E0.8, E1.3, E2:towers, E2.1–E2.3, E2.6–E2.7, E3.2–E3.3, E4.1, E4.4, E5:abstract.2–E5:abstract.5, E5:presentability.1–E5:presentability.2, E5:spectra-comparison and E5:animation.4; VStackSheavesAndLisseCategories VS2.1–VS2.2’s named solid, measure, E-coefficient and formal-complement paragraphs. The two IsReplete names and ZSolidAnalytification.formalComplement are supplier targets at those sections, not missing pinned declarations. Ownership against the supplied open roadmap heads was checked; no same fully qualified Lean name was introduced.

The library pins were confirmed from the content repository’s manifest: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Object searches found ordinary condensed solidity in Mathlib/Condensed/Solid.lean:44–83, not the light null-test reflection, its generator or its monoidal structure. Mathlib/Condensed/Light/Sequence.lean:302 supplies only the base-universe projectivity assertion. No all-universe version was found. The native LightProfinite definition in Topology/Category/LightProfinite/Basic.lean:42 bundles total disconnectedness and second countability; its constructor at line 56 additionally requires compactness and Hausdorffness. The transported carrier keeps all four properties. LightCondensed is an ordinary sheaf category (Condensed/Light/Basic.lean:28), without a spectral enhancement. Searches of both pins found no concrete stable-spectrum/light-spectral-hypersheaf carrier that would make the remaining spectral headlines statable. No imported lemma or one-tactic API consequence was added to the acceptance file.

The headline list in the module documentation retains the spectral embedding, spectral reflection/free measures, homotopy completeness, Hℤ comparison, compact spectral generator, product/tower/balancing comparisons, countable interchange, spectral null families, resolutions/realizations, prime completion, analytic scalar extension, summability and integer-measure comparison. Their absent enhanced carriers remain identified individually. The ordinary monoidal and all-universe exclusions have been deleted, because their existential statements elaborate on native carriers.

All cited works were available in the supplied legal cache with settled certified entries. Read the relevant W, MW, Q, Bosco, RC, CS, AG and HTT passages at the manifest versions. The AS transcript is contextual only. No new work, duplicate manifest key or missing-text request was needed. Added CS line 116 and CS line 148, and AG line 2934, to their existing manifest keys. Source proof steps were used at their actual generality: Bosco’s extremally disconnected integer argument remains a model for the new light/spectral target, and Q’s arithmetic divisibility is not imported as a general coefficient axiom.

## Computed adversarial pass

Each row identifies a statement or defining law. The last column records whether this repair changed it; retained rows document the recomputation of dependent Checks. Products are condensed/solid products unless a discrete realization is explicitly written. Integer groups in the all-universe rows mean their lifted versions. Zero rings and modules are admitted wherever the stated unital category admits them.

### Conventions and carriers

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| Light site and finite covers | ∅, two points, discrete ℕ | stable values 0, X(*)²; ℕ is noncompact | retains finite-cover light site |
| Cutoff cardinal | κ=(2^ℵ₀)^+, μ=2^ℵ₀ | μ<κ but 2^μ≥κ; βℕ has size 2^(2^ℵ₀)≥κ | excludes the merely regular cutoff; changed |
| Strong-limit cover size | κ=ℶ_ω, card(S)≤ℶ_n | card(βS)≤ℶ_(n+2)<ℶ_ω; card(C)=ℵ₀, card(Cantor)=ℶ₁<ℶ_ω | admits singular cutoff and both light tests; changed |
| Common presentation includes arrows | ℤ→ℤ by 2 and by 3 | identical vertices; cokernels ℤ/2 versus ℤ/3 | preserves relation maps, not just vertices |
| Marked universe transport | u=0,1; finite quotients n=0,1,2 | sizes 1,2,3; reduced ranks 0,1,2; ℤ_u≅ℤ | native lifted carriers agree; changed |
| Left modules and right endomorphisms | e₁₂,e₂₁, φ=(1,0) | e₁₂e₂₁=e₁₁, e₂₁e₁₂=e₂₂; φe₁₁=(1,0), φe₂₂=0 | order retained for noncommutative matrices |
| Spectral versus cochain degree | ℤ in cochain degree 2; shift [1] | π₋₂=ℤ before shift, π₋₁=ℤ after; ΣHℤ has π₁=ℤ | convention agrees with both supplying adapters |
| Symmetry | two degree-one generators, two degree-zero generators | signs −1 and +1, respectively | same sign in §§3.1 and 7.3 |
| Sphere versus integer coefficient | 𝕊, Hℤ; characteristic 2 symmetric square | π₁=ℤ/2 versus 0; H_i(BΣ₂;𝔽₂)=𝔽₂ for all i≥0 | sphere and animated objects remain distinct |
| Condensed product versus discrete product | standard vectors e_n | e_n→0 coordinatewise; e_n is never eventually 0 in discrete ℤ^ℕ | comparison direction δ∏→∏δ retained |
| Spherical monoid algebra | truncation ranks 0,1,2; constant section | t²=0 in rank 2; s(t·1)=0 versus t·s(1)=t | no free-E∞ or A-linear-section substitution |
| Scalar module cofiber | a=1,0 | cofib(1)=0; cofib(0)=A⊕ΣA; marked fibers A in both cases | preserves marked multiplication |
| Divisibility transitions | exponents 3≥2≥0 | multipliers t and t² compose to t³ | subtraction used only under an inequality |
| Prime-completed unit | p=2,3 | π₀(*)=ℤ₂,ℤ₃; ambient π₀=ℤ; 1↦1 | completed codomain retained |

### Every Lean declaration

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| liftedSequence | u=0,1; finite quotients n=0,1,2 | countable C_u; quotient sizes 1,2,3; transported open tails have finite complements | real compact Hausdorff, second-countable, totally disconnected carrier; added |
| natShift | ↑0,↑1,↑∞ in u=1; identity candidate | images ↑1,↑2,↑∞; identity instead sends ↑0 to ↑0 | shift preserved; generalized |
| inftyPoint | marked singleton; wrong mark ↑0 | image ↑∞ fixed by shift; wrong image becomes ↑1≠↑0 | marked square commutes; generalized |
| nullSeq | point value; marked singleton alone | (⊕_(ℕ∪∞)ℤ_u)/ℤ_u[∞]=⊕_ℕℤ_u; reduced singleton=0 | excludes unreduced and measure objects; generalized |
| nullShift | [0],[1],[∞]; dual e₀,e₁ | images [1],[2],0; σ*e₀=0, σ*e₁=e₀ | contravariance preserved; generalized |
| internallyProjective_free_liftedSequence | ℤ_u→𝔽₂, null vector e₀ and constant C_u-value 1; zero epimorphism | lifts e₀ and constant 1; reductions 1 mod 2=1, 0 mod 2=0; zero lifts to 0 | nontrivial universal local-lifting target; added |
| IsLightSolid | 0, discrete ℤ_u, topological ℝ | zero Hom automorphism; (1−σ*)(e₀+e₁)=e₁; harmonic partial sums diverge for ℝ | positive and negative instances preserved; generalized |
| isLightSolid_reflective_and_generator | G, zero target, ℤ/2, Q=ℤ_p/δℤ_p | G(*)=ℤ_u^ℕ contains all-one vector; Hom(G,0)=0; Q(*)=0 but [p^n]≠0 at C | countable generator essential; generalized |
| isLightSolid_closed_monoidal_reflection | ranks (2,3),(0,3),(1,1) | ℤ_u⁶, 0, ℤ_u on both sides; zero tensor would give 0≠ℤ_u for the unit | actual strong closed monoidal reflection; added |
| derivedLightSolid_isRightAdjoint | ℤ_u[1], ℝ[0], zero | H⁻¹=ℤ_u is solid; H⁰=ℝ fails and reflects to 0; all H^n0=0 | cohomology property and explicit derived localization match; generalized |

### Layer 1 statements and API laws

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| §1.1 free evaluation | T=∅,*,two points | free objects 0,𝕊,𝕊²; maps give 0,M(*),M(*)² | retained |
| §1.1 value detection | zero map and identity of 𝕊 | value maps 0 and 1 on π₀(*)=ℤ | equality/equivalence tests distinguish them |
| §1.1 hyperdescent | identity cover; disjoint pair cover | totalization X and X×X respectively | empty value remains 0 |
| §1.1 free tensor | ranks 2 and 3; empty factor | six spheres on both sides; 0 on both sides | retained |
| §1.1 free versus measure at C | C at * and a two-point test | ⊕_Cℤ and (⊕_Cℤ)²; all-one vector absent | excludes product model |
| §1.2 fully faithful discrete embedding | X=0,𝕊⊕Σ𝕊 | unit on π₀ is 0→0 or 1:ℤ→ℤ; π₁=(ℤ/2)⊕ℤ on both sides | retained |
| §1.2 functoriality and shifts | identity, zero, ΣHℤ | maps 1,0; shifted π₁=ℤ | retained |
| §1.2 symmetric tensor/unit comparisons | two spheres and suspended spheres | unit 𝕊; swap sign +1 and −1 | same coherence witness |
| §1.2 inverse-limit comparison boundary | tower H(ℤ/p^r), test T=ℤ_p | identity ℤ_p→ℤ_p is continuous, not locally constant | δ of limit is not equated to limit of δ |
| §1.3 pointed cofiber functoriality | identity pointed C; reduced singleton | [0]↦[0] under identity; reduced singleton=0 | identities/composites respect cokernel |
| §1.3 internal-Hom fiber | target 0 and discrete ℤ | fibers 0 and finite-support ℤ^ℕ sequences | marked point is killed |
| §1.3 coefficient precomposition | e₁ and e₀ | σ*e₁=e₀, σ*e₀=0; (1−σ*)e₁=e₁−e₀ | sign retained at every u |
| §1.3 marked splitting and lifts | finite stages n=0,1,2; successive lifts | reduced ranks 0,1,2; projection∘inclusion=1 on ℤ_u; ↑↑n identified with ↑n | normalized comparisons, not literal carrier equality; changed |
| §1.4 internal versus external null test | M=0,δHℤ | null-test cofiber maps vanish; inverse sends e₁ to e₁+e₀ | tensor–Hom formulation agrees |
| §1.4 equivalence transport | identity on 0 and δ𝕊 | transported maps are identity of 0 and same null inverse | full inclusion and predicate stable |
| §1.4 discrete spectra solid | δ𝕊 and N | δ𝕊 has π₀=ℤ, π₁=ℤ/2; N(*) has ⊕ℕℤ versus reflected ∏ℕℤ | N non-solid; sphere retained |
| §1.5 abelian closure | 0,ℤ_u, extension ℤ_u² | zero, integer, rank-two solid objects; kernel of 2:ℤ_u→ℤ_u is 0, cokernel ℤ_u/2 | same full-subcategory theory at every u |
| §1.5 abelian reflection and compact generation | free finite S and C | measures 0,ℤ_u,ℤ_u²,ℤ_u×ℤ_u^ℕ | every-u version; changed |
| §1.5 ordinary closed tensor | ranks 2,3; tensor unit | rank 6; ℤ_u⊗■ℤ_u=ℤ_u | existential statement added |
| §1.5 derived cohomology detection | ℤ_u[1] and ℝ[0] | solid H⁻¹=ℤ_u versus non-solid H⁰=ℝ | ordinary reflection generalized |
| §1.5 enhanced derived comparison | zero and ℤ_u[1] | zero and the single ℤ_u in degree −1 on both sides | enhanced carrier still required |
| §1.5 free measures and infinite generator | S finite, C; quotient Q | finite ranks 0,1,2; reduced C rank product ℵ₀; Q(*)=0 but [p^n] at C nonzero | finite S cannot replace infinite S |
| §1.5 countable product tensor | sizes 2,3; empty; ℕ,ℕ | ℤ_u⁶;0;ℤ_u^(ℕ²), no positive Tor | ordinary/derived tensors kept distinct |
| §1.5 generator flatness | B=ℤ/2,0; B⊗ᴸ■B | ∏ℕ𝔽₂ only in degree 0;0; Tor₁(B,B)=𝔽₂ | flatness belongs to product generator |

### Layers 2–4 statements and API laws

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| §2.1 homotopy detection and complete t-structure | ΣHℤ,0,𝕊⊕Σ𝕊 | π₁=ℤ; all groups 0; π₁=(ℤ/2)⊕ℤ | retains sphere stems and zero case |
| §2.1 truncations | τ_≤0ΣHℤ; τ_[1,1]ΣHℤ | 0 and ΣHℤ respectively | units/counits have required ranges |
| §2.1 heart | Hℤ,0 | π₀=ℤ or 0; all other groups zero | static comparison retained |
| §2.1 suspension bound | ΣΣ^bHℤ | only π_(b+1)=ℤ on both sides | lower bound rises by 1 |
| §2.2 reflection and tensor | 0,δ𝕊,free two-point object | L■0=0; L■δ𝕊=δ𝕊; unit tensor preserves two spheres | retained |
| §2.2 adjunction/counit | solid 0 and δ𝕊 | Map(0,M)=0; reflection unit on δ𝕊 is 1 | no arbitrary reflector data |
| §2.2 idempotence | 0,δ𝕊 | L■L■0=0; L■L■δ𝕊=δ𝕊 | two units agree |
| §2.2 closed tensor | sphere unit and zero factor | Hom(𝕊⊗■D,M)=Hom(D,M); Hom(0,M)=0 | retained |
| §2.2 free-measure projections | reduced C stages r=0,1,2 | finite ranks 0,1,2; limit ∏ℕδ𝕊 | projections pin the comparison |
| §2.2 tensor connectivity | Σ^bA,Σ^cA; zero | tensor Σ^(b+c)A; zero stays 0 | exact stated lower bound |
| §2.2 internal Hom boundary | G and δH𝔽₂ | point π₀Hom=⊕ℕ𝔽₂, cardinal ℵ₀; abstract Hom has cardinal 2^(2^ℵ₀) | excludes abstract group Hom |
| §2.3 Hℤ module comparison | unit; H𝔽_p tensors, p=2,3 | Hℤ↔ℤ[0]; π₀=π₁=𝔽_p in relative tensor | no absolute-smash substitution |
| §2.3 bounded-below detection | X=Σ^b𝕊 and zero | bottom map ℤ→ℤ is 1; zero groups map 0→0 | detection uses actual bottom degree |
| §2.3 animation boundary | polynomial input over 𝔽₂ | animated polynomial has positive π=0; spectral symmetric square has H_i(BΣ₂;𝔽₂)=𝔽₂ | no false characteristic-p equivalence |
| §2.4 compact generator | G and A=0 | π₀G(*)=ℤ^ℕ, π₁G(*)=(ℤ/2)^ℕ; G_0=0, Mod_0=0 | retained |
| §2.4 reflected null unit | finite partitions r=0,1,2 | projections have ranks 0,1,2; all-one product vector projects to (1,…,1) | comparison marked by projections |
| §2.4 every homotopy group | k=0,1,−1 | ℤ^ℕ,(ℤ/2)^ℕ,0 | retains every degree |
| §2.4 free/forgetful generator law | A=𝕊,0 | Map_A(A⊗G,M)=Map(G,UM); at A=0 both are 0 | module generation includes zero ring |
| §2.4 right action and connective endomorphisms | first two coordinates, φ=(1,0) | (φe₁₂)e₂₁=(1,0); φe₂₂=0 | right action order consistent |
| §3.1 product tensor | empty; ranks 2,3 | 0→0; six coordinate spheres, selected pair↦1 and others↦0 | projection-induced map retained |
| §3.1 symmetry | suspended pair; unsuspended indices | −1 and +1 | recomputed shared convention |
| §3.2 split tower decomposition | zero; constant sphere; ranks n+1 | limits 0,𝕊,∏ℕ𝕊; rank kernels 0,0,1 | retained |
| §3.2 tower-map extensionality | identity and zero maps at each stage | limit maps identity and zero on each coordinate | coherent projections distinguish maps |
| §3.2 finite decomposition | n=0,1,2 in growing tower | 1=1+0,2=1+1,3=1+2 | same indexing as tower |
| §3.2 change of sections | d:𝕊²→𝕊 first projection; s=(1,0),s'=(1,1) | d s=d s'=1; change matrix determinant 1 | same limit with marked projections |
| §3.2 splitting boundary | multiplication 2 on sphere | a section would require 2b=1 in ℤ, impossible | finite free does not imply split |
| §3.3 independent towers | constant sphere; stages (m,n)=(1,2) | 𝕊⊗■𝕊=𝕊; stage rank 2·3=6 | independent tensor retained |
| §3.3 diagonal inverse indexing | (m,n)=(1,2),r=2 | arrows (2,2)→(1,2); rank 9 projects to rank 6 | inverse-limit direction correct |
| §3.3 scalar-linearity boundary | constant-polynomial section | s(t·1)=0, t s(1)=t≠0 | only sphere-linearity used |
| §3.4 balancing | A=𝕊[t],X=Y=A | absolute π₀=ℤ[t₁,t₂], balanced π₀=ℤ[t]; t₁,t₂↦t | relative tensor preserved |
| §3.4 identity/transitivity | identity scalars; X=0 | two scalar paths are X or 0 | supplied bar identities specialize correctly |
| §3.4 dualizable limit comparison | B=A²; rational scalar boundary | A²⊗lim=two copies of limit; rational extension requires common denominator, excludes (2^−n) | dualizability not dropped |
| §4.1 countable interchange | K=∅,K=*,J=* | 0; colim_JF; lim_KF on both sides | special cases agree |
| §4.1 filteredness boundary | J=ℕ, finite partial products | left π₀=⊕ℕℤ; right π₀=∏ℕℤ; all-one vector only on right | ω₁-filteredness essential |
| §4.2 independent subobjects | B_j=ℚ, stages (1/n!)ℤ | (1/(j+1)!) lies at stages α_j=j+1; no single diagonal denominator | independent-union law retained |
| §4.2 zero and empty products | B_j=0; empty index | both sides 0 | zero case retained |
| §4.2 split-tower homotopy | ℤ^(n+1) truncations | projections onto first n+1 entries surjective; lim¹=0 | no spurious derived-limit term |

### Layers 5–7 statements and API laws

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| §5.1 complete split coefficient datum | 𝕊[[t]],0; sphere/p boundary | quotient ranks r=0,1,2 are 0,1,2; zero gives 0; π₀(𝕊/p)=ℤ/p nonfree | p-tower excluded from split datum |
| §5.1 datum equivalence | identity datum, zero datum | all maps identity on each B_r; zero tower limit 0 | coherent choices retained |
| §5.1 marked ideal | a₀=1,a_r=t^r; zero coefficient | J₀=A→A is 1; J_r≅A→A is t^r; at A=0 map 0 | no loss of marked multiplication |
| §5.1 completion unit/naturality | identity and zero module maps | unit sends x to compatible residues x mod a_r; zero maps send all residues to 0 | canonical source and target fixed |
| §5.1 cofinal reindexing | t^r versus t^(2r) | both limits A=𝕊[[t]], same residue for each fixed quotient | unit preserved |
| §5.1 module quotient formula | scalar 1,0 | M⊗_A0=0; M⊗_A(A⊕ΣA)=M⊕ΣM | no quotient E∞ structure assumed |
| §5.2 properness/extensionality | f(j)=j,0 | sublevels at r=1 are {0} and ℕ | zero function is not proper |
| §5.2 filtered profile order | f=j,g=2j; f_k=max(j−k,0) | common target min(f,g)=j; common target of all f_k must be 0 | filtered, not ω₁-filtered |
| §5.2 transition composition | t³→t²→1 | t·t²=t³ on marked copies | arrows point to smaller profiles |
| §5.2 block identity/composition | identity,zero,duplication twice | supports {j},∅,{4j,4j+1,4j+2,4j+3} | coherent finite supports retained |
| §5.2 compact block factorization | one block ∏ℕA; map into a fixed output block | output support size 1; zero block/map size 0 | finite factorization has actual data |
| §5.2 separable lower profiles | h=max(j,k), h=j+k, h=0 | halves give 1≤2 at (1,2); j+k gives equality; 0 has infinite r=1 sublevel | true combinatorial target; moved |
| §5.2 sum properness | f=j,g=k,r=0,1,2 | sublevel sizes 0,1,3=r(r+1)/2 | sum is proper; moved |
| §5.2 finality direction | h=max, half and third lower profiles | at (1,2) sums 1 and 0; pairwise minimum has sum 0≤1≤2, with arrow from half pair to minimum pair | nonempty connected comma category; moved |
| §5.3 completed null-family formula | singleton blocks t^j and constant 1 | modulo t^r only r blocks survive for t^j; infinitely many for 1 | first family admitted, second excluded |
| §5.3 finite and infinite single blocks | only blocks 0,1; only I₀=ℕ; empty blocks | A²,∏ℕA,0 on both sides | profile f(0)=0 allows all entries of block 0 |
| §5.4 all-degree formula | k<0; k=1,A=𝕊[[t]] | both sides 0 for k<0; π₁=(ℤ/2)[[t]], survivors η,ηt mod t² | higher stems retained |
| §5.4 block-map naturality | duplication of t^j; fold | mod t² outputs 0,1,2,3; fold sum 1+t | finite reductions define maps |
| §5.4 summation denominator | fold ∑t^j | (1−t)(1+t)=1 mod t²; constant term 1 | inverse exists in ℤ[[t]] |
| §6.1 uniform free resolution | 0,Σ^bG_A,uncountable coproduct of latter | 0; only degrees ≥b; coproduct still vanishes below b | no countability restriction on free indices |
| §6.1 uniformity boundary | Σ^(−n)G_𝕊; A=0 | π_(−n)=ℤ^ℕ≠0 for every n; at A=0 all groups 0 | lower-bound failure states nonzero coefficients |
| §6.2 quotient-completion connectivity/exactness | M=Hℤ,a_r=2^r; scalar 1,0 | Hℤ₂ with π₋₁=0; completion for 1 is 0; single 0-cofiber M⊕ΣM | bottom quotient transitions onto |
| §6.2 ideal-tower negative control | ℤ←2ℤ←4ℤ←⋯ | lim=0, lim¹=ℤ₂/ℤ; quotient tower lim¹=0 | ideal and quotient towers distinguished |
| §6.3 uniform realization | constant M; normalized simplicial degree 1 | identity ΛM→ΛM; degree-one layer ΣM≥b+1 before/after | bound b+d+1 has correct sign |
| §6.3 nonuniform tail | normalized Σ^(−n)𝕊 in degree n; zero coefficients | every suspended layer 𝕊; tail π₀=⊕_(n>d)ℤ≠0; at A=0 tail 0 | same nonzero hypothesis in dependent example |
| §6.4 completed discrete embedding | p=2,3; X=H𝔽_p | unit on π₀=identity 𝔽_p→𝔽_p; e_pX(*)=X | retained |
| §6.4 tower reflection | X=H𝔽_p,δHℤ[1/p] | quotient transitions diag(1,0), limit H𝔽_p; p-inverted quotients all 0 | actual cofiber limit retained |
| §6.4 localization kernel | M=δHℤ[1/p],M=δH𝔽_p | M/p=0,L_pM=0; second L_pM=M≠0 | kernel is p-inverted objects; added |
| §6.4 tower fiber proof | Hℤ versus p-inverted Hℤ[1/p] | fiber π₋₁=ℤ_p/ℤ with p invertible; inverted constant p-tower limit=M | unit is equivalence modulo p; added |
| §6.4 tensor-compatible reflection | inverted M,N=𝕊; M=H𝔽_p,arbitrary N | both sides 0; both sides L_p(H𝔽_p⊗■N) | completed tensor precedes ambient closure; added |
| §6.4 completed algebra unit | p=2,3 | A_p(*) has π₀=ℤ_p; ambient unit map 1↦1 | lax monoidal inclusion constructs algebra; clarified |
| §6.4 integer null families | singleton blocks (p^j),constant 1 | mod p² entries 1,p,0,…; constant 1 has infinite support | valid at p=2,3 without split sphere quotients |
| §6.4 zero/infinite blocks | I₀=ℕ,others empty; all empty | ∏ℕℤ_p or ∏ℕA_p; all-one vector allowed in block 0; empty gives 0 | both null-family formulas agree |
| §6.4 marked spectral fibers | p=2,r=1; p=3 | π₁K₁=ℤ/2 but marked p-map is 0; p=3 gives π₁=0 | image-subgroup replacement fails |
| §6.4 spectral profile colimit | singleton blocks,p=2 | positive-profile degree-one coordinates killed by lowering once; surviving group ⊕ℕℤ/2 | all-degree target consistent |
| §6.4 completed generator tensor | empty,singleton,ranks 2,3 | 0,A_p,ℤ_p⁶ in π₀; p=2 gives (ℤ/2)⁶ in π₁ | ambient idempotence remains a separate target |
| §6.4 Hℤ-linear tensor | Hℤ_p with itself; H𝔽_p over Hℤ_p | first Hℤ_p; second π₀=π₁=𝔽_p | relative/absolute tensors distinguished |
| §6.4 bounded-below tensor closure | units A_p,0; ordinary X=Y=𝕊_p^∧ | products A_p,0; ordinary comparison completes the smash | uses null-family and realization inputs, not conversely |
| §7.1 analytic-structure definition | D=all,D=0,perfect Hℤ-modules | reflector id or 0; unit equivalence for D=0 iff A=0; ⊕ℕHℤ not perfect | closure and completedness discriminate |
| §7.1 actual inclusion/unit uniqueness | D=all,D=0 | units 1:A→A and 0:A→0; at A=Hℤ they differ on π₀ ℤ versus 0 | unmarked category equivalence insufficient |
| §7.1 identity/composite morphisms | identity ring map; maps to zero structure | restriction of 0 is 0; identity restriction fixes all objects | morphism direction consistent |
| §7.2 completed tensor/unit | D=all; D=0,A=Hℤ | tensor ordinary relative tensor, unit Hℤ; zero tensor and unit 0 | uncompleted structure does not force unit A |
| §7.2 scalar-extension adjunction | identity on Hℤ, M=N=Hℤ; M=0 | point mapping π₀=ℤ on both sides; zero input gives 0 on both sides | retained |
| §7.2 scalar transitivity | identity coefficient chain; zero target structure | both paths M or 0 | units and target completion retained |
| §7.2 commuting square comparison | Hℤ→H𝔽₂ along both legs, derived pushout | π₀=π₁=𝔽₂ on both paths | underived tensor would lose π₁ |
| §7.2 nonpushout square | A=A'=B=Hℤ,B'=H𝔽₂,M=Hℤ | both paths H𝔽₂; algebra pushout instead Hℤ | square transitivity requires no pushout |
| §7.2 target-kernel boundary | all algebras Hℤ; only terminal D=0 | both paths 0; input-generated kernel 0 versus target kernel all modules | no kernel-generation hypothesis |
| §7.3 summability predicate | F=∅,{0},{1}; f=1/p on Hℚ_p | first three all modules; b_n=p^n gives b_n−p⁻¹b_(n+1)=0,b₀=1 | arbitrary coefficients need not be complete |
| §7.3 sign and finite inverse | b=e₁,any scalar f | (1−fσ*)(e₁+fe₀)=e₁ | same marked shift as every preceding layer |
| §7.3 free complete modules | identity reflector; zero module | L_FC=C for F=∅; L_F0=0 | units give actual free-object map |
| §7.3 monotonicity | F=∅,F'={T} | D_F'⊆D_F; ℚ_p with T=1/p lies only in D_F | direction retained |
| §7.3 scalar-change naturality | T↦1/p | transported test kills nonzero sequence p^n | restriction requires preservation of target tests |
| §7.3 nilpotent test | 𝔽₂[ε]/ε²,f=ε | (1−εσ*)(1+εσ*)=1 | d=2 finite inverse, characteristic 2 included |
| §7.3 discrete Huber-pair generators | R=ℤ[T],R⁺=ℤ or ℤ[T] | F=∅ versus {T}; constant coefficient unit remains R | integral/generator theorem uses discrete inputs |
| §7.3 integral closure in nonreduced ring | εT∈(𝔽₂[ε]/ε²)[T] | (εT)²=0; inverse 1+εTσ* | nonconstant integral element adds no test |
| §7.3 monadic right action | φ=(1,0),e₁₂,e₂₁ | (φe₁₂)e₂₁=(1,0),φe₂₂=0 | agrees with supplier handedness |
| §7.4 integer-measure comparison | finite S=∅,*,2; C | measures 0,ℤ,ℤ²,ℤ×ℤ^ℕ; reduced free point value ⊕ℕℤ | compares stated common presentations |
| §7.4 topological coefficient versus point value | B=ℚ_p; sequence p^n | continuous null sequence p^n, not eventually constant; (p^−n) has unbounded denominators | HB static with π₀=B, not discrete H(B(*)) |
| §7.4 static-module comparison | B=𝔽₂; free product generator | B⊗ᴸ■∏ℕℤ=∏ℕ𝔽₂ in degree 0; B⊗ᴸ■B has Tor₁=𝔽₂ | module comparison preserves derived relative tensor |
| §7.4 animated boundary | ordinary polynomial 𝔽₂ input | θ preserves it; free spectral symmetric square has positive H_i(BΣ₂;𝔽₂)=𝔽₂ | no arbitrary Hℤ-algebra identification |
| §7.4 cutoff enlargement and cocones | κ=ℶ_ω≤λ; relation maps 2,3 | finite quotient ranks 0,1,2 unchanged; relation cokernels 𝔽₂ and ℤ/3 unchanged | exact gap now has supported cutoff hypotheses |

## Maintainer consequences

No existing Lean declaration was deleted or renamed. The existing five supporting definitions and two headline theorems now take a universe parameter and use lifted integer coefficients; consumers using their old universe-zero definitional types will need the standard homeomorphism/ring-equivalence transport. New names are `liftedSequence`, `internallyProjective_free_liftedSequence` and `isLightSolid_closed_monoidal_reflection`, all named in the README. There are six definitions with real bodies and four admitted headline theorems, one Mathlib import, no options and no admitted data.

The remaining consumer-side action is explicit: HabiroRings §2.11 must replace `CountableSolidHabiroTensor.separable_weights` with supply from SolidAnalyticRings §5.2. The local generic lemma and its proof need only proper profiles and finite sets, so the import need not inherit §6.4’s cardinal-interchange obligation. Factorial divisibility and balanced arithmetic idempotence remain HabiroRings’ work. This cannot be completed by changing this package, and needs the maintainer’s cross-package decision.

The three existing supplier gaps remain obligations rather than claims of delivered results. Only light-measure-site-comparison changed, to uncountable strong limit cutoffs; cardinal-interchange still correctly quantifies over infinite regular index cardinals. No merge-order edit, external write or commit was made.
