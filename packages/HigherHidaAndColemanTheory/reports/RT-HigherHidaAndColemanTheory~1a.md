<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13045#issuecomment-6887852654 -->
Red team round 1 pass a (codex) of c2ba00f

Verdict: needs_changes

1. **F01** (P2) Non-Cartier twists need their presentation line bundles

   **Location:** packages/HigherHidaAndColemanTheory/README.md:509: “O(D+)=Hom(O(−D+),O) is e_aO”; also the twist conventions at line 34 and §2.8(c), line 499.

   **Claim:** The ideal of a locally principal closed subscheme can be used as its negative line-bundle twist, and its dual as the positive twist.

   **Witness:** BP-Hida line 369 distinguishes an invertible presentation from its image ideal. Here e_aO has fibre ranks (1,0,0), whereas a line bundle has ranks (1,1,1). The claimed positive twist is not a line bundle.

   **Exact repair text:** Add to Conventions: “For a locally principal closed subscheme D, retain an invertible sheaf L_D and a map s_D:L_D→O with image I_D. Define O(−D)=L_D and O(D)=L_D∨; pullbacks and twists retain these data. Identify L_D with I_D only when D is effective Cartier.” Apply this convention to the locally principal boundaries in the partial-support supplier contract and §2.8(c), and replace “the two inclusions” there by “the two natural maps” (these need not be injective). Replace the affected sentences of the Check by: “Present D+ by L=O and multiplication by e_a. Then O(D+)=O, and the natural map O→O(D+) is multiplication by e_a. Its pullback along σ is zero at c because σ(c)=b. Consequently every factorization through this natural map has zero component at c, whereas T(f)(c)=f(b); the required factorization fails.”

   **Repair test:** Both line bundles now have fibre ranks (1,1,1). The pulled-back section has values (1,1,0), while T(0,1,0)=(0,0,1). Thus the negative control still excludes the factorization without asserting a false carrier. This retains the non-Cartier generality needed after reduction modulo p^s.

2. **F02** (P1) The vector-bundle extension refinement used by duality has no supplier

   **Location:** packages/HigherHidaAndColemanTheory/README.md:479: “Choose a strict dynamical compactification on which F extends to a locally free sheaf and D+, D− are Cartier divisors.” The Needs list is at line 481.

   **Claim:** The preceding targets and named suppliers supply this choice for every smooth X over the allowed Artinian A.

   **Witness:** BP-Hida line 1213 uses Lemmas 2.1.6, 2.1.12 and 2.1.30. None is stated in §2.2. SchemeAndStackFoundations §4.12, README:6926 on main, only supplies flattening over a Noetherian integral base; A=ℤ/4 is allowed here.

   **Exact repair text:** Add this precise contract under SchemeAndStackFoundations, and the same slug to plan.json's gaps: “What SchemeAndStackFoundations must provide (gap:locally-free-compactification-extension): §4.12 — For a Noetherian scheme Y, a quasi-compact open U⊂Y and a finite locally free sheaf E on U, supply a U-admissible blow-up Y′→Y on which E extends to a finite locally free sheaf; no reducedness or integrality of Y is assumed (BP-Hida Lemma 2.1.6, p. 7).”

   Add to §2.2: “Prove the refinement theorem for dynamical compactifications: lift a modification of Xbar to the correspondence, preserve strict dynamics under pullback, and refine so that D± and all four p_i*D± are Cartier, while any specified finite locally free F on X extends locally freely. Prove cofilteredness using boundary-enlarging morphisms; these morphisms need not be strict on the labelled boundaries (BP-Hida Lemmas 2.1.12, 2.1.29–2.1.32, pp. 8–10).” Add the new gap to §2.2's Needs and cite this refinement target in §§2.4 and 2.7. Import ordinary scheme compactification refinements from `TauCeti.Compactification.commonRefinement`, TauCeti/AlgebraicGeometry/Compactification/Refinement.lean:97, and the cofiltered instances in Compactification/Cofiltered.lean:50; do not reconstruct that generic theory here.

   **Repair test:** Take A=ℤ/4, X=ℙ¹_A and F=O. The identity refinement gives the required rank-one extension and empty Cartier boundaries. The added contract admits this nonreduced case; the integral-base flattening theorem does not. The repair also distinguishes Cartierizing one marked compactification from forming a common refinement of different boundary labels.

3. **F03** (P3) The integral supported model has no three discriminating Checks

   **Location:** packages/HigherHidaAndColemanTheory/README.md:1433–1435: “Inverting p erases the vertical modification”; “need not preserve the ordinary object”; “is not an input to this construction.”

   **Claim:** These are the Checks for the definition of K_int in §8.1.

   **Witness:** Line 1433 repeats the last basic property; line 1434 gives no instance of its asserted possible failure; line 1435 repeats the factorization hypothesis. They do not distinguish the formal-support carrier or test an actual factorization.

   **Exact repair text:** Replace those three bullets by these local diagnostics for the construction:

   - “At p=3, the lattices O and 3O in ℚ₃ are unequal (1 belongs only to O), whereas O[1/3]=(3O)[1/3]=ℚ₃. Thus forgetting the chosen vertical twist before rationalization changes the input.”
   - “For the local support model B=𝔽₃[t] and I=(t), the completed algebra attached to the formal closed locale has H⁰=lim_n B/Iⁿ=𝔽₃[[t]], with 1 nonzero. Ordinary local cohomology has H⁰=0 and H¹=𝔽₃[t,t⁻¹]/𝔽₃[t], with t⁻¹ nonzero. Replacing the hat by ordinary local cohomology changes both degree and carrier.”
   - “A local coefficient map whose required first factor is multiplication by 3 over ℤ/9 can realize T=3 by taking the remaining factor to be 1. It cannot realize T=1: every composite sends 1 into (3)={0,3,6}. Thus the improving factorization is extra data, even when the source and target lattices have rank one.”

   **Repair test:** The three comparisons give respectively unequal integral/equal rational lattices, (H⁰,H¹)=(𝔽₃[[t]],0) versus (0,𝔽₃[t,t⁻¹]/𝔽₃[t]), and 3∈(3) versus 1∉(3). These are diagnostics of the local ingredients, not additional assertions about global ordinary cohomology.

## Verified sound

Read all 1,713 README lines and all 41 Suggested.lean lines. Counts: **0 Lean declarations; 68 numbered target sections**, plus the explicitly imported, nontarget §5.1; **159 Check bullets in 41 blocks** examined; **121 distinct supplier section IDs** resolved at the supplied heads or main; **218 distinct source-locator anchors** checked in the four cached works for Layers 3 and 5–9, with additional checks in Layers 1, 2 and 4. The instance ledger below has 113 rows, grouping related Checks and separating multiple assertions where necessary. Counts of anchors are not counts of complete proofs verified.

There are no bold target headings: bold mathematical labels are the 41 Checks blocks. The target inventory therefore uses numbered sections and their subclaims. Nonapplicable cases are excluded by the actual standing hypotheses: p is prime, g≥1, characteristic-zero analytic coefficient fields, Artinian integral-theory coefficients, neat levels, specified finite-type schemes and finite support filtrations. The ledger includes p=2, p=3, nonreduced bases, zero objects, rootless data, singular weights, empty support, identity operators, derived fibres and strict endpoints rather than pretending that inseparable coefficient fields or an arbitrary non-quasi-separated space instantiate every target.

The ten headline results have the following acceptance-test disposition. Their missing carriers are described explicitly in Suggested.lean; scalar identities and finite-dimensional diagnostic examples do not substitute for them.

| Headline | README | Missing pinned carrier |
|---|---|---|
| Derived arithmetic Hida control | §4.6 | Geometric Igusa Iwasawa complex and solid supported ordinary cohomology |
| Integral Iwasawa Serre duality | §4.8 | The same geometric complexes and their coefficient correspondence |
| Integral genus-one/two amplitude | §4.9 | Universal Siegel Iwasawa complexes |
| Geometric classicality, including singular chambers | §5.8 | Abelian-type supported coherent cohomology and its Cousin sequence |
| Cohomological eigenvariety | §7.1 | Analytic weight space and geometric family cohomology |
| Interior deformation and dimension | §7.5 | Interior eigenvariety and coherent image sheaves |
| Sharp interior bounds | §7.6 | Supported Shimura cohomology |
| All-genus rational amplitude | §8.4 | Analytic Siegel family and its Iwasawa comparison |
| Sharp Siegel bounds | §8.5 | Integral supported model and its rational comparison |
| Singular Klingen control | §9.8 | Klingen threefold, height-one tower and partial-ordinary complex |

| Suggested.lean inventory | Section/context | Variables and instances | Computed comparison |
|---|---|---|---|
| No declarations | One namespace; no sections with variables | None | Declaration count 0, admitted data count 0, padding count 0; ten docstring headlines match the ten entries above |

No `#check @name` elaboration was performed: there is no name to check. No Lean process was run. The import is exactly `import Mathlib`; no options, placeholder predicates, admitted examples or extra imports occur.

At the pins, Module.End, zpow_sub₀, DerivedCategory/HasDerivedCategory, CondensedMod/IsSolid and the Hecke triple/double-coset carriers agree with the supplier contract. The Tau Ceti convolution product `HeckeCosetModule.instRingHeckeRing` (TauCeti/NumberTheory/HeckeRing/Associativity.lean:484) and the conditional criterion `HeckeCosetModule.mul_comm_of_antiInvolution` (TauCeti/NumberTheory/HeckeRing/Commutativity.lean:459) were inspected. The latter requires an anti-involution fixing every double coset; it alone does not prove spherical commutativity for these groups. The generic compactification refinement API is present; it does not supply the additional extension statement in R02. Searches by objects, including supported ordinary cohomology, analytic BGG, projective Banach coefficients, Igusa towers and compactification refinements, were made across main, the supplied open heads and packages. There are no Lean names here that duplicate another roadmap's declarations.

Ownership boundaries checked against PadicFamilies and PadicFamiliesPartII, OverconvergentAutomorphicForms, AutomorphicBundlesPartII, PerfectoidShimuraVarieties and GSp4NonregularModularityLifting leave the higher geometric supported applications here. Generic spectral complexes, coefficient induction/distributions, six operations, period maps and the downstream modularity argument remain with their stated owners. In particular, PerfectoidShimuraVarieties §6.15 actually lists its nonsplit image-compatibility input as a conditional target; its conditional status was not treated as a missing declaration.

The ten supplied gap slugs occur both under Exact supplier contracts and in design/plan.json, with named suppliers. The contracts identify the missing geometric or analytic extensions; their present absence is not counted as a defect. The supplied overlap result has no second copy, conflicting head or dropped identifier for this package. No prior repair finding was marked not actionable in this package.

The read-only diff has 19 changed files, all within packages/HigherHidaAndColemanTheory, with 1,542 insertions and 176 deletions. The prescribed dependency check returned:

```text
depcheck: 245 roadmaps, 2226 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. No order file was changed.

The following ledger records diagnostic calculations, not proofs of the proposed general theorems. A range calculation tests an asserted range or duality convention; it does not assert that every group in that range is nonzero. Global geometric claims retain their stated supplier hypotheses.

| Statement | Instance and computed values on the compared sides | Result; change |
|---|---|---|
| Conventions: two support orders | D+=D−=∅, X=Spec 𝔽₂: K−+=𝔽₂[0]=K+−. With T=0 both ordinary objects are 0. | Endpoint consistent. |
| Conventions: scalar normalization | p=3, exponents 2,−1: (1/9)·3=1/3=3^(−(2−1)); exponent 0 gives 1. Base 0 would make cancellation invalid. | Nonzero-base hypothesis retained. |
| Conventions: shifts | [A→0 A] in degrees 0,1: RHom(C,A[−1]) has A in degrees 0,1, exchanging them; a point has A[0] on both sides. | Degree convention consistent. |
| Conventions: locally principal twists | I=e_aO on three points has ranks (1,0,0); the presentation L=O and its dual have ranks (1,1,1). | R01. |
| 1.1: inverse weight dictionary | C₂ ν=(0,−2) gives κ=(5,3),(5,1),(2,−2),(0,−2); substitution gives (0,−2) in each case. | Four inverse tests. |
| 1.1: dual coefficient | (5,3)∨=(0,−2), (0,−2)∨=(5,3); (5,1)∨=(2,−2), (2,−2)∨=(5,1). At k=2 on a curve dual weight=0. | Involution and canonical correction consistent. |
| 1.1: singular chambers | GL₂ k=2: C+={id}; k=0: {long}; k=1: {id,long}. C₂ κ=(k+2,2): κ+ρ=(k+1,0), on a wall for every k≥0. | No forced single chamber on a wall. |
| 1.1: rank quotient | Norm-one torus of a non-Galois cubic with trivial h: Tʳ=1, T^c=T, dimensions 0 versus 2. | Excludes using T^c without the CM-split-centre premise. |
| 1.2: cone order | (−1,10)−(0,0)=(−1,10) is outside ℝ≥0²; (0,0) is inside. Unequal central components cannot differ by a root-cone vector. | Logical negation and equality boundary consistent. |
| 1.2: slope renormalization | GL₂ k=2: naive cutoff 2, normalized cutoff 1; naive slopes 1 and 2 become 0 and 1. The first is admitted and the endpoint is not. | Strict inequality retained. |
| 2.1: smooth upper shriek | Point: A[0]; affine line: rank-one Ω¹[1] in degree −1; affine plane: rank-one Ω²[2] in degree −2, versus rank-two Ω¹[2]. Works for A=𝔽₂ and ℤ/9. | Rank and degree separate wrong models. |
| 2.1: proper comparison domain | Over A=ℤ/4 the resolution of A/2 has differential 2 forever; Tor_i^A(A/2,A/2)=𝔽₂ for every i≥0. Smooth ℙ²_A has finite Tor dimension 0. | Arbitrary compactification comparison correctly excluded. |
| 2.1: open and formal carriers | On A[t], j_*O=A[t,t⁻¹] has elements t^(−N−1) beyond any finite pole bound; completion=A[[t]]. For j=id both open operations return O. | Coherent-domain limitation is real. |
| 2.2: ideal-power orientation | Frobenius at p=2 or 3: (t^p)^1=(t)^p gives D≤(1/p)(pD). Identity would require (t^a)⊆(t^b) for a<b, which fails. | Negative boundary and strict direction consistent. |
| 2.2: compact versus strict | On irreducible ℙ¹, int{0}=∅ while Frobenius preimage{0}={0}; strict holds and compact fails. Empty boundaries give ∅⊆∅. | Distinct notions. |
| 2.2: refinement prerequisite | ℙ¹_(ℤ/4), F=O: identity refinement has rank-one extension, but the available integral-base flattening theorem has no applicable base. | Missing general input R02. |
| 2.3: ordinary localization | T=1 on A gives A; T=0 gives 0; T=3 on ℤ/9 has T²=0 and gives 0, whereas 3 on ℚ₃ has finite slope 1. | Integral ordinary versus rational inversion separated. |
| 2.4: finiteness | Proper point over 𝔽₂ with T=1 gives dim H⁰=1; line with identity gives dim H⁰=∞, but is not proper over Spec 𝔽₂ and has no strict identity boundary at infinity. | Base and strictness hypotheses exclude negative control. |
| 2.5: derived coefficient change | C=[ℤ/9 --3→ ℤ/9], M=𝔽₃: C⊗ᴸM=[𝔽₃ --0→ 𝔽₃], dimensions (1,1). Underived cohomology reduction cannot discard the extra degree. | Derived conclusion necessary. |
| 2.6: equivariant perfectness | A=𝔽₂, Γ=C₂, torsor algebra A^Γ≅A[Γ] is free rank 1; augmentation gives A. Averaging by 1/2 is undefined, while the projective model still specializes. | p-divisible group order allowed. |
| 2.7: point and curve duality | Point T=1: A pairs with A by multiplication; T=0: 0 with 0. ℙ¹_(𝔽₂): RΓ(O)=𝔽₂[0]=RΓ(Ω¹[1]); omitting [1] moves its derived dual to degree −1. | Statement passes; proof input R02. |
| 2.7: excluded affine example | 𝔸¹_(𝔽₂), identity: K+−=𝔽₂[t], ordinary part infinite-dimensional; at infinity strictness requires a<b and a≥b simultaneously. | Proper ambient space alone does not meet hypotheses. |
| 2.8(a): finite rank | Proper point identity has rank 1; identity of 𝔽₂[t] has infinite rank and cannot factor through finite-dimensional cohomology. | Proper-over-A condition essential. |
| 2.8(b): support change | Two points, identity, pairs ∅ and {a}: dimensions 2 versus 1; cross-containment {a}⊆∅ is false. Equal pairs give identity maps on dimensions 2 or 1. | Negative and positive tests. |
| 2.8(c): cross-containment | σ(a)=a,σ(b)=a,σ(c)=b: σ⁻¹{c}=∅⊆∅ but {c}⊄∅. T(f)=(fa,fa,fb), T²(f)=(fa,fa,fa), ordinary dimension 1 on inner and outer objects. | Corrected direction passes. |
| 2.8(c): twist factorization | With L=O,s=e_a, σ*s=(1,1,0), but T(0,1,0)=(0,0,1). The line itself has rank 1 at c, not rank 0. | Factorization fails as intended; carrier repair R01. |
| 3.1: degree divisors | g=1,n=1: multiplicative/étale degrees (1,0) sum to 1; n=2: (2,0) sum to 2. At n=0 both degrees are 0 and labels coincide. | n≥1 necessary. |
| 3.2: trace normalization | C₂ (−3,−3;0) paired with (−1/2,−1/2;−1/2) gives 3; raw factor p³ becomes 1 under p⁻³. | U2 normalization consistent. |
| 3.2: incompatible strata | GL₂ k=2,p=3: U_naive(1)=3; p⁻¹U_naive(1)=1; p⁻²U_naive(1)=1/3. On p^eO the last map sends p^e to p^(e−1), still outside. | Global normalization cannot be chosen from an incompatible chamber. |
| 3.2: unit factors | diag(2,3): ν_id=1/6,ν_long=1/9, ratio=3/2; diag(2,6): 1/12 and 1/36, ratio=3. Pure p^1 fails in the first and holds in the second despite nontrivial unit part. | Corrects source's pure-power identity. |
| 3.3: nilpotent thickening | For Frobenius-type parameter t↦t^p modulo p^s, ideal powers compare with exponent 1/p; at p=2 this is 1/2<1, at p=3 it is 1/3<1. Identity gives exponent 1, excluded. | Local strict-dynamics diagnostic; global geometry conditional on gaps. |
| 3.4: fixed coefficient and boundary | At cusp q=0, (q)→O induces 0 on fibres, whereas identity induces 1; finite χ(u)=−1 changes ν(u) to −ν(u). | Boundary and finite character retained. |
| 3.5: perfectness versus flat cohomology | [ℤ₃ --3→ ℤ₃] is finite free with H⁰=0,H¹=𝔽₃. | Does not overclaim torsion-free cohomology. |
| 3.6: ordinary Cousin filtration | Incompatible scalar 3 times an integral action has square 0 mod 9; ordinary summand 0. At GL₂ wall k=1 the exponents are 0,0, so neither column is eliminated this way. | Singular columns retained. |
| 3.7: global control twist | GL₂ k=2: ν_id(t)=1/3, local action=(1/3)U_naive; twisting by −ν multiplies by 3, giving U_naive. At k=1 two columns remain. | Sign consistent. |
| 3.8: spherical convolution | ℓ=3: degree relation 4²=12+4·1=16. Sending every double coset to 1 would give 1=5, false. | Multiplicity required. |
| 3.8: noncommutative level | Iwahori: ωs=diag(1,ℓ),sω=diag(ℓ,1), different I-double cosets; spherical K conjugates them. | Hyperspecial condition separates cases. |
| 3.8: finite level versus limit | At ℓ=2, degree character values 3,6,1 give 9=6+3. Limit C=ℤ₃ has 3·1=3≠0; no ℤ/3-action, although each C_s has an A_s-action. | Coefficients scoped correctly. |
| 4.1: finite torus group ring | Γ=C₂ at p=2: regular module ℤ₂[Γ] has rank 2 over ℤ₂ and rank 1 over itself; its augmentation has rank 1. | No division by 2. |
| 4.2: level control mechanism | If pull/trace composites are U^j with U=3 on ℚ₃, inverses use 3^(−j); with U=0 no inverse exists. Equal torus subgroups are needed to keep the same character action. | Ordinary inversion supplies the inverse, not integral averaging. |
| 4.3: completed level limit | On T′≅ℤ₃, f(z)=z has infinite image and is continuous; modulo 3^m it has 3^m values and is locally constant. A tail of m≥2 still reconstructs f, an uncompleted colimit does not. | Completion order discriminates carriers. |
| 4.4: admissible dual | One regular continuous-function term C⁰(T′,ℤ₃) has measure dual Λ′, free rank 1; placing it in degree 1 places its dual in degree −1. | Correct model for geometric admissibility, not a proof of that geometric target. |
| 4.5: diagonal realization | Regular module gives Λ′[0]; ν(u)=u at u=4 gives evaluation 1/4, not 4; k=0 gives 1 in both conventions. Double dual of degree 1 returns degree 1. | Nontrivial character detects inversion. |
| 4.6: derived control | Finite-free test [Λ --X→ Λ] at X=0 gives O in degrees 0,1; H⁰ of the family is 0 and Tor₁(Λ/(X),O)=O. | Flat cohomology is not silently assumed. |
| 4.7: finite Hecke image | On Λ[0], degree-character ring image is ℤ·id but Λ-linear image is Λ·id. On Λ², N=E₁₂ has N²=0 and Λ[N] has rank 2, versus reduced quotient rank 1. | Scalars and nilpotents correctly retained. |
| 4.8: complementary duality | d=1: a free degree-0 term pairs with a free degree-1 term into Λ[−1]. For scalar action u=4, adjoint inversion contributes 1/4, not 4. | Shift/inversion diagnostics; explicit transported Λ-action still required at implementation. |
| 4.9: integral ranges | g=2,d=3,ℓ=1: canonical [1,3], opposite cuspidal [0,2]; degrees i and 3−i match. g=1 strengthens both variants to {0} or {1}. | No integral g≥3 claim. |
| 5.1: imported geometry | Torus flag variety is a point, hence its tube preimage is all X. For GL₂ one root coordinate gives proper discs rather than all X. | No new target or duplicate carrier here. |
| 5.2: finite-depth tubes | p=3,u=1/9: abs(u)=9>3; p=2,u=1/4:4>2. Both belong to depth −∞ but not −1. | Depth −1 is finite. |
| 5.2: relative inclusions | GL₂ C=2: periods z=3 and z=9 have valuations 1 and 2. Standard U={v(z)>1} excludes z=3 but includes z=9; absolute lower/upper bounds cannot both hold. Relative bounds at m=n=0,s=1 do. | Source absolute-inclusion error avoided. |
| 5.2: exponent boundary | U(z^n)=3^nz^n: slopes 0,1,2 on 1,z,z²; U² slopes 0,2,4, same block after cutoff doubling. U⁰ has eigenvalue 1 on all monomials, dimensions 3,6,12 on increasing truncations. | j≥1 essential. |
| 5.2: pro-Banach topology | f_n=3^(−n/2)z^n at n=4,8,12: norms 1,1,1 at radius 3^(−1/2), and 3,9,27 at radius 3^(−1/4). | One Banach norm does not replace the limit topology. |
| 5.2: empty/rootless support | Z=∅ on a disc gives 0, whereas O(disc) contains 1. Rootless N-point datum gives F^N[0]; N=1 identity is compact. | Empty roots need the stated convention. |
| 5.3: continuation on finite slopes | U(z^n)=p^nz^n, h=2: span{1,z,z²} on every disc radius; unrestricted function spaces differ by convergence at their boundaries. | Scope is finite slopes only. |
| 5.4: finite invariants | Δ=C₂ regular augmentation over ℤ₂ has invariant image 2ℤ₂; over ℚ₂ it has image ℚ₂ via division by 2. | Characteristic-zero descent, no integral claim. |
| 5.4a: algebraic duality | κ=(5,3;−8) gives κ∨=(0,−2;8) and double dual κ. t-eigenvalue p² pairs with t⁻¹-eigenvalue p², while the character at t is p⁻². | Opposite operator has same cutoff, opposite character valuation. |
| 5.5: two bounds | C₂ κ=(5,3;−8),t₂: direct threshold 0, transposed threshold 3. Slope 2 passes first, fails second; slope 3 passes both. | Second bound cannot be discarded. |
| 5.6(a): cuspidal range | d=1,ℓ+=0 gives [0,0]; ℓ+=1 gives [0,1]. At d=0 both give [0,0]. | Endpoint ranges computed. |
| 5.6(b): canonical range | Dual of opposite-sign cuspidal [0,1−ℓ+] gives [ℓ+,1], namely [0,1] or [1,1]. Using the same sign would incorrectly remove degree 0 at ℓ+=0. | Duality direction consistent. |
| 5.7(a): Cousin sequence | Two-column curve complex F --1→ F has cohomology 0, versus F⊕F if differentials were suppressed. A single nonzero column F survives as F. | No forced degeneration at a wall. |
| 5.7(b): interior image | Map 0:F→F has image0; identity has image F; [0,ℓ]∩[ℓ,d]={ℓ}. | Image rather than kernel or full target. |
| 5.8: geometric classicality | GL₂ k=2: compatible length set {0}; k=0:{1}; k=1:{0,1}. At k=1 range [0,1], no single-column control. | Singular statement keeps spectral sequence. |
| 6.1: normalized analytic action | GL₂ ν=0 gives algebraic κ=−2ρ at w=1 and κ=0 at long; twisting by −ν adds 0, while a nonzero algebraic ν shifts slopes by −ν(t). | Weight and operator characters linked. |
| 6.1a(1,3): descent | Δ=C₂ augmentation: invariant integral image2ℤ₂, rational imageℚ₂; Δ=1 gives original sheaf and identical cohomology. | Averaging used only after p inverted. |
| 6.1a(2): flatness hypothesis | F[x,y] over F[x²,xy,y²] has generic rank2 and origin fibre basis1,x,y of dimension3. Regular target excludes this finite nonflat quotient. | Smooth-fan requirement matters. |
| 6.2: analytic support | Radius n=1, GL₂ standard U=B(1,−1): U∩Z=B(1,1); z=3 excluded,z=9 included. For support∅ cohomology0. | Coefficient-domain and relative inclusions separate. |
| 6.3: perfect blocks | [F⟨t⟩ --t→ F⟨t⟩] has finite free terms but H¹=F⟨t⟩/(t), rank0 generically and dimension1 at t=0. | Projectivity not asserted for H¹. |
| 6.4: rigid specialization | At t=0 the last complex has H⁰=H¹=F; Tor₁ supplies H⁰. At t=a≠0 it has H⁰=H¹=0. | Total grading and derived fibre correct. |
| 6.4: nonrigid specialization | Complete C with transcendental 0≠a, t↦a: differential is an invertible scalar, both groups0. For t↦0 they are C,C. | General field-valued version has content. |
| 6.5: local analytic BGG | κ=0: D1=0,Dz=1. κ=1: D²1=D²z=0,D²z²=2≠0 even over ℚ₂. On disconnected germs kernel of D includes independently chosen constants. | Characteristic zero and locally constant factor necessary. |
| 6.5: twist | p=3,t=diag(3,1/3): untwisted eigenvalues1,9,81 become1/3,3,27 after weight−1; kernel slopes−1,1 match V₁. | Twisted action matches algebraic term. |
| 6.6: BGG spectral indexing | Levi W_M={1}: only p=0 and no extra terms. For one reflection, +column p=1 pairs with −column p=−1; total degrees add to d and twists −ν_v+ν_v=0. | Indices and twists cancel. |
| 6.6a(1–3): analytic pairing | Split B=L²: trace pairing e₁·e₂=0,e₁·e₁=1, rank2 on both sides. Scalar η(t)=p² gives η⁻¹(t⁻¹)=p². | Not a single line when two points. |
| 6.6a(3): finite blocks | U(z^n)=p^nz^n,h=2 gives dimension3 on both sides; identity cutoff0 gives dimensions3,6,12 on truncations, unbounded. | Finite-slope union not its full algebraic dual. |
| 6.6a(4): boundary and degree | ℙ¹,D={∞}: dim H¹ω=1,H¹ω(D)=0,H⁰O(−D)=0,H¹ω(−D)=2. | Two canonical or two cuspidal variants do not give the asserted perfect pairing. |
| 6.6b(1–2): bounds | C₂ w=1: a_an=(3,3),2ρ_nc=(−3,−3),b_an=0. Hence a_an+2ρ_nc=0=−b_an and b_an+2ρ_nc=(−3,−3)=−a_an. | Four transposed bounds agree. |
| 6.6b: nonalgebraic weight | Character 4^z↦a^z with transcendental a∈1+9O_C₃: ν(4)=a lies in no finite extension; GL₂ thresholds−1,0 reject slope−1/2 only by second bound. | General-C extension is not redundant. |
| 6.6b(3): changing degree | [B --s→ B],t₀=p⁻¹: at s=0 fibre slopes−1 in degrees0,1; family H⁰=0,H¹=B/(s). Returned maximal degree q=1, not input i=0. | No false preservation of degree. |
| 6.6b(3): changing slope | Irrational Gauss valuation r of s: rigid values v(s) are rational, so none equals r. For c>r choose rational r≤c′<c; resulting rigid slope≤c′<c. | Transfers strict violation, not exact value. |
| 6.7: BGGsafe | C₂ reflection example on t₂ has thresholds0 and3: slope2 excluded,3 not. W_M={1} gives an empty conjunction=true for every slope. | Sufficient exclusion, no converse. |
| 6.8: coefficient control | With nonidentity columns zero, a one-column spectral sequence has E₁=E∞. At threshold3 the test permits a second column, so that reduction cannot be made. | Strict boundary retained. |
| 6.9: family range and torsion | ℓ=1,d=3: ranges[0,1] and[1,3]. Domain example ideal(x,y)⊂F⟨x,y⟩ is torsion-free rank1 but needs2 generators at origin, not projective. | No unwarranted flatness conclusion. |
| 6.10: family Hecke algebra | On H¹=F²,H⁰=0: E₁₂E₂₁=diag(1,0),E₂₁E₁₂=diag(0,1). Zero assignment has 1↦0. | All-degree relations and unit needed. |
| 6.10: abelian type | −I maps to1 in PGSp₄ but acts as−1 on the standard4-space; representation does not descend. | Universal-isogeny proof would fail; descended torsor is used. |
| 7.1: eigenvariety and inversion | Zero cohomology sum has annihilator1 and empty spectrum; H¹=F alone has annihilator0 and one point. Unit eigenvalue4 in + becomes4 after inverting the − action with original eigenvalue1/4. | Retains positive degree and consistent weight. |
| 7.2: classical packets | Curve k=2 has ν indexed by id in degree0; wall k=1 has two possible Cousin columns. A nonidentity Levi BGG column changes ν_v, not merely the cohomological degree. | No single fixed weight formula for every classical class. |
| 7.3: image support | t:A→A, A=F⟨t⟩: Im=(t), fibre (t)/(t²)≅F at0, but specialized map0:F→F has image0. | Image does not commute with arbitrary base change. |
| 7.4: one-sided specialization | Same model gives surjection F→0 on images, not an isomorphism; (t) is torsion-free over A. | Directions survive negative control. |
| 7.5: dimension | Finite faithful algebra B=A[ε]/ε² over domain A has one minimal prime(ε) over0, dimension B=dim A, despite nilpotents. Zero module gives empty support, excluded by nonempty premise. | Nilpotents do not spoil dimension. |
| 7.6: sharp interior | GL₂ k=2: naive interval[1,2) becomes std[0,1); k=1 has compatible lengths0,1 and does not meet C+={id}. Torus d=0 has no length-one term. | Regularity and endpoints discriminate. |
| 8.1: integral model | 3O⊂O unequal; rationalizations bothℚ₃. Formal support at(t) has H⁰=𝔽₃[[t]], local cohomology H⁰=0. Multiplication by1 cannot factor through3 overℤ/9. | R03 supplies missing discriminating Checks. |
| 8.2: ordinary versus slope | Integral T=3 on ℤ/9 has ordinary0, rational scalar3 has slope1; T=1 has ordinary rank1. Imageℤ₃ inside rational slope lineℚ₃ is a lattice, while ℚ₃ itself is not bounded. | Does not equate all finite slopes with ordinary. |
| 8.3: weight family comparison | p=3,u=4,k=1: Λ evaluation1/4, not4; k=0 both1. | Inversion must precede specialization. |
| 8.4: all-genus rational amplitude | g=3,d=6,ℓ=2: canonical[2,6],cuspidal[0,2]; complementary partner length4 gives[0,4]. A p-torsion module becomes0 rationally, so no integral conclusion follows. | Rational/integral distinction real. |
| 8.5: sharp bound and BGG | C₂ κ=(5,3;−8): t₂ thresholds3,4,4,8; normalized0,1,1,5. Slope std1 meets a wrong-chamber threshold and is excluded from strict test. | Correct normalization and endpoint. |
| 9.1: four weights | ν=(0,−2): (5,3),(5,1),(2,−2),(0,−2); dual pairs reverse the list. Lengths0,1,2,3. | Matches §1.1 and suppliers' convention. |
| 9.2: modular curve | k=2 cutoff k−1=1; k=0 degree-one cutoff1−k=1; k=1 has cutoffs0 but two compatible chambers. Dual bundle at k=2 is ω⁰(−D). | BP-GL2 endpoint and boundary checked. |
| 9.3: C₂ slopes | t₁ thresholds6,6,11,11 and t₂ thresholds3,4,4,8 at κ=(5,3;−8); subtracting3 from t₂ gives0,1,1,5. | Strict U2 bound1. |
| 9.4: Klingen construction | Ω(0,2) has weight(2,2), shifted(1,0), on two-chamber wall. Λ1 on an open pro-p subgroup has dimension1 in its weight variable, versus2 derived variables for Borel Siegel. | Distinct families, no claimed identification. |
| 9.4: tower transition | Source's ordinary fibre has p or p+1 points, neighbouring p-rank-one fibre1; at p=2 counts2/3 versus1, not finite étale constant rank. | Nonfinite affine étale transition retained. |
| 9.5: isolated root | p=3,parameters1,1,9,9: products1,9,9,81; eigenvalues1/3,3,3,27. Isolated projector evaluates1 at1/3 and0 at other roots; squared middle factor kills a length2 Jordan block. | Repeated nonchosen roots allowed. |
| 9.5: irreducibility boundary | Ratios for1,1,9,9 are1,9,1/9, none3. For1,1,3,3 ratio3 occurs; all1 gives no isolated product. | Hypotheses distinguish three cases. |
| 9.6(1): slope bounds | r≥0: all-degree lower bound−3, H⁰ lower bound0. r=−1 is allowed for the complex but excluded from this inequality. | Separate quantifiers preserved. |
| 9.6(2): primary versus fibre | R=L[X,X⁻¹],y=X−1: R/(y²) localized at(y) has dimension2; residue fibre dimension1 and derived fibre H^(−1)=L. | Correct generalized eigenspace operation. |
| 9.6(2): nonflat differential | R/(y)→R/(y²),1↦y: H⁰=0,H¹=L; termwise residue fibre has zero differential and H⁰=L. | Termwise residue fibre cannot replace weight-derived localization. |
| 9.6(3): Euler characteristic | [B --s→ B] has generic dimensions0,0 and special1,1; dim H¹−dim H⁰=0 in both. | Individual dimensions may jump; Euler characteristic does not. |
| 9.6(4): radius loss | Overℚ₂, coefficients of f=Σ2^mz^(2^m−1) tend to0; antiderivative coefficients at2^m are1, not→0. At radiusρ<1 their normsρ^(2^m)→0. | Radius colimit needed. |
| 9.6(4): exponent and determinant | k=0,p=3,f=z: D(Uf)=3=3U(Df), not(1/3)U(Df)=1/3. At r=−1 last determinant exponent k+r+1=0, so exact sequence still exists. | Positive exponent and all-integer twists consistent. |
| 9.6(4): classicality thresholds | k=0: all-degree−2,H⁰1; k=3: all-degree1,H⁰4. Wrong exponent would give−4,−1 and−7,−4. | Normalization supports stated thresholds. |
| 9.7: extension thresholds | (k,r)=(0,2): k+2r−3=1; combined all-degree min(1,−2)=−2,H⁰min(1,1)=1. (0,0) gives−3. | Ordinary0 only in appropriate ranges. |
| 9.8: singular control endpoints | p=2,k>p+1 means k≥4, not3; rational control includes k=0. At r=2 extension cutoff k+1≥1 includes slope0 for all k≥0. | Distinct integral/rational ranges. |
| 9.8: trace lattice and valuations | I=(3):I⁻³=(1/27)O versus O; both rationalize toℚ₃. Parameters1,1,9,9 give T2=20 v=0 and U2 values2,10,10,18 with v=0,0,0,2. | Nonnegative, not strictly positive. |
| 9.9: unitary specialization | n=2,ν=(4,2,0),ρ=(1,0,−1): weights(−3,−5,2),(0,−5,−1),(0,−2,−4), lengths0,1,2. n=1 has two lengths0,1; n=0 is outside n≥1. | Left-coset convention and integral outputs checked. |

## Not verifiable

- The future geometric constructions and the ten declared supplier extensions have no implementation to test. The computations above check stated hypotheses, conventions and boundary cases; they do not certify the full proposed proofs.
- No elaboration or build was run, as required. With zero declarations there are no elaborated signatures to compare or proof obligations whose kernel acceptance can be reported.
- Locator verification used the four editions recorded in sources.toml. Numbering and errata are certified only against those cached editions, not against later revisions or independently obtained publisher PDFs. References cited internally by those papers were not all independently re-proved or audited.
- Some long supplier sections contain more theory than the package consumes. The 121-ID count certifies resolution and inspection of the relevant contract, not correctness of every statement in those suppliers. The generic finite-projective and coherent-category results are supplied plans, not declarations already present at the pins.

## Source issues

These are source-text issues, including corrections already made by this package. They are separate from R01–R03. “A stated result” refers to a statement in the source; it does not assert that the package copied the error. No published correction was located in the four editions inspected.

- **Misprint** in BP-Hida at §1.1, printed page 2, BP-Hida line 62: the source says M_μ is the unipotent radical; it should be the reductive Levi used by the representation and character lattices; affects a stated result.
- **Misprint** in BP-Hida at Proposition 4.3.17, printed page 49, BP-Hida line 2551: the source says a malformed shifted expression defines the normalization with finite character; it should be ν=−w⁻¹w0M(κ+ρ)−ρ, with the finite character separate; affects a stated result.
- **Gap** in BP-Coleman at Definition 5.11.14 and Corollary 6.8.4, printed pages 134 and 168, BP-Coleman line 6218: the source says the printed doubled-root expressions give the BGG exclusion region; it should be derived by twisting each nonidentity BGG term and applying both analytic bounds; affects a stated result.
- **Misprint** in BP-Coleman at Theorem 6.4.3 proof, printed page 157, BP-Coleman line 7277: the source says compactness follows partly from an unresolved lemma reference; it should be supported by the geometric contraction, coefficient contraction and supported-cover compactness argument; affects the proof.
- **Misprint** in BP-Coleman at Definition 6.4.7, printed page 158, BP-Coleman line 7317: the source says the negative geometric lower tube uses the fixed coefficient radius n; it should be the freely chosen second geometric depth l; affects a stated result.
- **Misprint** in BP-Coleman at Theorem 6.10.2(1), printed page 173, BP-Coleman line 7961: the source says strongly small in its header; it should be small, as established by its sharp interior-bound proof; affects a stated result.
- **Misprint** in BP-Coleman at Proposition 2.7.3, printed page 32, BP-Coleman line 1491: the source says an already degree-d supported complex gets another shift and later uses one-forms; it should be unshifted there, with top forms Ω^d throughout the degree-d pairing; affects a stated result.
- **Gap** in BP-Hida at Remark 5.4.3 and Proposition 6.2.13, printed pages 57 and 63, BP-Hida line 2941: the source says the later tensor comparison uses A without specifying the character map; it should be labelled by inverse-character evaluation under the regular-action convention; affects the proof.
- **Misprint** in Pilloni-Singular at §5.1.5 before Proposition 5.1.5.2, printed page 22, Pilloni-Singular line 951: the source says the adjacent Satake products agree; it should be αδ=βγ in the retained spherical ordering; affects a stated result.
- **Misprint** in Pilloni-Singular at Proposition 13.3.3.1, printed page 90, Pilloni-Singular line 4140: the source says the target BGG action is scaled by p^(−k−1); it should be p^(k+1), giving the subsequent thresholds k−2 and k+1; affects a stated result.
- **Gap** in Pilloni-Singular at §13.4, printed page 91, Pilloni-Singular line 4172: the source says a family pullback recovers an eigenspace without distinguishing weight and spectral fibres; it should be derived weight specialization followed by spectral localization retaining the full primary component; affects a stated result.
- **Error** in BP-Hida at Remark 4.3.12, printed page 48, BP-Hida line 2502: the source says every normalization ratio is a pure p-power; it should be the full character value, including its unit factor; affects a stated result.
- **Error** in BP-Coleman at Definition 5.4.10 and Example 5.4.11, printed pages 111–112, BP-Coleman line 5217: the source says the absolute lower-tube inclusion holds for every standard pair; it should be intersected with U as required by the support-change argument; affects a stated result.
- **Gap** in BP-Coleman at §3.4, printed page 45, BP-Coleman line 2177: the source says root extrema define min(t) and max(t) for the stated data; it should be supplemented by a rootless convention for torus data; affects a stated result.
- **Misprint** in BP-Hida at §2.11 before Remark 2.11.1, printed page 31, BP-Hida line 1651: the source says the positive cross-containment uses p1 on the middle boundary; it should be p2*D′+⊆p1*D″+, and p1*D′−⊆p2*D″−; affects a stated result.
- **Misprint** in Pilloni-Singular at Proposition 14.9.1, printed page 102, Pilloni-Singular line 4680: the source says all eigenvalue valuations are positive; it should be nonnegative, which the proof establishes and valuation-zero examples require; affects a stated result.
- **Misprint** in BP-Coleman at Theorem 6.8.3(2), printed page 167, BP-Coleman line 7694: the source says the second negative bound omits ρ; it should be −w⁻¹ρ+ρ+w⁻¹2ρ_nc, matching transpose duality; affects a stated result.
- **Error** in BP-Coleman at Corollary 5.3.8 and Theorem 5.4.12, printed pages 108 and 112, BP-Coleman line 5065: the source says the witness power s may be zero while its operator is potent compact; it should be a power j≥max(1,s), leaving the allowed pairs unchanged; affects a stated result.
- **Misprint** in BP-Hida at §4.1.12, printed page 42, BP-Hida line 2183: the source says Z_i is a sum with upper index k and repeated summation index i; it should be Z_i=Σ_(j=1)^i D_(g+j); affects a stated result.
- **Misprint** in BP-Hida at Proposition 4.1.13 proof, printed page 42, BP-Hida line 2204: the source says the divisor paired with D_(g+k+1) is D_(g−k−1); it should be D_(g−k), as the proposition itself states; affects the proof.
- **Misprint** in BP-Hida at Proposition 4.3.11 and Proposition 4.3.17, printed pages 48–49, BP-Hida line 2494: the source says the excluded divisor has index 2g+i−1; it should be 2g+1−i, agreeing with the correspondence domain and avoiding out-of-range indices; affects a stated result.
- **Misprint** in BP-Hida at Lemma 4.4.2 proof, printed page 50, BP-Hida line 2586: the source says one needed comparison has p1 on both sides; it should be p1*Z_(i,<wi)≥p2*Z_(i,<wi), as used immediately afterward; affects the proof.
- **Misprint** in BP-Hida at §6.2.8, printed page 62, BP-Hida line 3182: the source says the support expression uses U_(≥w+ε); it should be U_(≥w−ε), the open chosen immediately before and in the comparison theorem; affects a stated result.
- **Misprint** in BP-Hida at Proposition 6.2.13, printed page 63, BP-Hida line 3261: the source says the ordinary comparison has coefficients A/p^n; it should be A/p^r, matching the geometric reduction and its proof; affects a stated result.
- **Misprint** in BP-Coleman at §2.5.1, printed page 24, BP-Coleman line 1113: the source says the module reconstructing an arbitrary coherent F is H⁰(X,O_X); it should be H⁰(X,F); affects a stated result.
- **Misprint** in BP-Coleman at Example 6.2.19, printed page 152, BP-Coleman line 7033: the source says the displayed algebraic inclusion intertwines the unshifted analytic action; it should be given the w0Mκ twist of Theorem 6.2.16; affects a stated result.
- **Misprint** in Pilloni-Singular at Theorem 11.2.1(6), printed page 70, Pilloni-Singular line 3261: the source says the specialization target is Ω(k,r) with r unspecified; it should be Ω(k,2); affects a stated result.
- **Misprint** in Pilloni-Singular at Theorem 14.7.1 proof, printed page 99, Pilloni-Singular line 4558: the source says the extension target is the same neighbourhood cohomology as its source; it should be cohomology on the whole Klingen compactification; affects the proof.
- **Misprint** in Pilloni-Singular at Lemma 14.8.4 proof, printed page 102, Pilloni-Singular line 4669: the source says the comparison Euler characteristic uses unrestricted cuspidal analytic cohomology; it should be its slope-zero part, whose finite-dimensional Euler characteristic is locally constant; affects the proof.
- **Misprint** in Pilloni-Singular at §14.2, printed page 92, Pilloni-Singular line 4243: the source says L_n lies in G[p^n] and has a cyclic p^(2n) factor; it should be L_n⊂G[p^(2n)], as also used in Lemma 14.6.1; affects a stated result.
- **Misprint** in Pilloni-Singular at §14.5, printed page 96, Pilloni-Singular line 4395: the source says restriction is induced by inclusion of the larger neighbourhood into the smaller one; it should be the reverse inclusion when ε′≥ε; affects a stated result.
- **Misprint** in BP-GL2 at §2.1.1, printed page 4, BP-GL2 line 122: the source says the argument F of f! and f* belongs to Coh(X); it should be F∈Coh(Y); affects a stated result.
- **Misprint** in BP-GL2 at §2.1.1, printed page 4, BP-GL2 line 126: the source says Gorensteinness tests f!O_X; it should be f!O_Y, an invertible O_X-module; affects a stated result.

The wording comparison included the mathematical statements at the resolved locators and 32 separately recorded passages, including seven proof-route passages. The extra prose comparisons were README lines 443, 479, 557, 1148, 1445, 1614 and 1647 against, respectively, BP-Hida lines 954, 1211 and 2499; BP-Coleman line 7411; BP-Hida line 3190; and Pilloni-Singular lines 3657 and 4658. No copied nonmathematical sentence, translated passage, source table or exercise list was identified. Shared short strings describe forced hypotheses or standard constructions; for example the seven-word bounded-finite-complex phrase at README line 441 is mathematical terminology, not a copied passage.

For the arrangement check, count a citation group once per source-name occurrence within Layers 1–9, excluding bibliography, supplier contracts and the source-issues appendix. This gives 131 groups: BP-Coleman 60, BP-Hida 44, Pilloni-Singular 25, BP-GL2 2. The contents of BP-Coleman, lines 17–77, do not map one-to-one onto the roadmap's layers: its §5 is redistributed through Layer 5 and §§7.3, 7.6, while its §6 is split across Layers 6–7 and §8.5. The roadmap places support duality in §5.4a before the bounds, combines its two vanishing ranges in §5.6, and separates analytic coefficient exactness from cohomological gluing and from the integral comparison. The Needs edges §5.5→§5.4a, §5.8→§5.5/§5.7, §6.6→§6.5, and §7.5→§7.3/§7.4 force these mathematical dependencies. BP-Hida and Pilloni-Singular contribute separate integral and Klingen targets; their contents were also inspected. No arrangement finding is made.

Source independence: 32 additional passages compared with 4 sources, in addition to the mathematical locator comparisons; no copied passage or reused table identified; largest share BP-Coleman, 60 of 131 citation groups; contents compared with BP-Coleman: independent, with the dependency order identified above.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "c2ba00f58cbf1f5f64ee9bf11bba99b695475a65", "job": "RT-HigherHidaAndColemanTheory~1a", "model": "gpt-6-astra", "worker": "chris-6"} -->
