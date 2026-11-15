<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13045#issuecomment-6887265288 -->
Review (codex) of c2ba00f

Verdict: accepted
Conditional on the announced gaps: `solid-localization-kernel`, `discrete-adic-solid-comparison`, `siegel-ordinary-igusa`, `klingen-height-one-igusa`, `abelian-affinoid-basis`, `projective-banach-cohomology`, `banach-support-duality`, `coherent-correspondences`, `abelian-subcanonical-vanishing`, `klingen-lci-model`

No findings. Acceptance is conditional on the ten declared supplier contracts listed below. The package's README, Suggested.lean, metadata.toml, sources.toml and design were not changed.

## Verified sound

### Previous finding and changed passages

Previous F01, the zero-iteration compactness assertion: **repaired**. In packages/HigherHidaAndColemanTheory/README.md:864 the replacement is “Fix an iteration exponent: an integer j≥max(1,s).” Its API at :876 now says “the j-th power of T^± acts potent compactly for every iteration exponent j≥max(1,s)”. The definition retains support depth s=0. Section 5.3 at :896 uses the same positive j; §6.2 at :1076 excludes j=0 and retains the sufficiently-large-power qualification for analytic families. The cutoff for the power is jh, not h. The source correction is recorded as E18 at :1713 and its locators are present under the existing BP-Coleman manifest key.

The new negative control at :885 separates the identity from a positive contracting iteration. For the GL₂ identity stratum at p=3, U=B(0,−1), Z=B(cl 0,cl 0), m=n=s=0 gives U∩Z=U. A nonconstant rational function with poles outside U gives independent powers of arbitrarily large degree; the identity has slope-zero subspaces of dimensions 3,6,12,… . In the contracting root-coordinate model, the first power on 1,z,z² has eigenvalues 1,3,9 and the second has 1,9,81. The cutoffs 2 and 4 select the same three-dimensional subspace. The coordinate model is a test of the contracting operator, not an assertion that a Hodge–Tate coordinate is an algebraic coordinate on the modular curve.

Increasing s to j shrinks only the lower-bound tubes. For the offending pair, j=1 gives B(1,cl 0)⊂U and U∩B(0,cl 1)=U⊂Z. Thus the repair retains every allowed support pair. BP-Coleman line 4937, Proposition 5.3.2, p.105, requires potent compactness; line 4963, Corollary 5.3.4, p.106, transfers it; line 5038, Theorem 5.3.7, p.107, supplies it for positive powers on the defining objects. Their hypotheses now apply. The iteration independence uses their restriction/corestriction isomorphisms and the eigenvalue identity v(α^j)=jv(α).

Searched the remaining package for the repaired pattern. Sections 5.4a, 6.3 and 6.6a take finite blocks only for compact or potent compact controlling elements. Section 6.2 distinguishes positive iteration from coefficient radius. The finite-dimensional rootless exception is consistent: for a torus with N points, U=Z=X and the complex is F^N[0], so the identity is compact there. No further zero-power compactness claim remains. There were no maintainer notes or findings marked not actionable to reopen.

### Principles, coverage and shape

Read all 69 numbered sections, their formulas, conventions, proof routes, API/Check blocks and Needs lines. Untouched computations from the previous review were retained only where its table supplied values; the new sample, changed passages and supplier citations were checked afresh. The nine layers have Examples and Dependencies endings. The 24 explicit API blocks and 41 Checks blocks, together with definitions written in prose, supply the required discriminating tests. Main-branch shape comparisons were read in TauCetiRoadmap/RigidAnalyticGeometry/README.md, TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md and TauCetiRoadmap/LieHighestWeight/README.md.

The scope retains every prime in integral Siegel theory, including the cofinal p=2 construction, and general quasi-split abelian-type Coleman data. It distinguishes the proved rational all-genus amplitude from the conjectural integral genus-at-least-three bound. It does not replace a general construction by a selected-prime or route-specific substitute. No computational algorithm, sorry'd data, set_option, undeclared owned Lean identifier, process residue, source table reproduction, upward dependency or second roadmap on main was found. Generic machinery is imported; the supported geometric applications, their normalized actions and the isolated Klingen refinement are the package's targets.

### Fifteen seeded source checks

All four source texts and the largest source's contents were readable in the legal cache. No author-flagged unverified locator or additional cited work was found. No manifest entry was added or rewritten. Locators refer to the stated author editions, especially the revised 180-page BP-Coleman text, not to the differently numbered arXiv v1. Surrounding hypotheses and proof inputs were read as well as theorem headers.

| Target | Source witness and printed locator | Hypotheses and conclusion checked |
|---|---|---|
| §2.5 discrete derived coefficient change | BP-Hida line 1039, Proposition 2.6.2, p.21; line 1132, Proposition 2.6.13, p.23 | Strict dynamics over Spec A, A-flat coherent F, finite discrete M, derived tensor; geometric coefficient change retains the finite coefficient class and Tor-independent comparison. |
| §3.4 supported fixed-weight complexes | BP-Hida line 2634, Proposition 4.4.4; line 2642, definitions; line 2647, Proposition 4.4.5 and Remark 4.4.6, p.51; line 2863, §5.3.1, p.55 | Derived p-adic limit, M-dominant weight, decomposable levels, both boundary variants and the complete unit action νχ. |
| §3.6 ordinary Cousin sequence | BP-Hida line 2664, Theorem 4.5.2 and Remark 4.5.3, pp.51–52 | Compatible w only, length indexing, total degree r+q, finite characters, and dependence of differentials/abutment on integral models. |
| §3.7 regular global control | BP-Hida line 2677, Corollaries 4.5.4–4.5.5, p.52 | Singleton compatible chamber; rational untwist −ν, with χ retained; no extra cohomological shift. |
| §4.1 finite torus group rings | BP-Hida line 2782, Lemma 5.2.2; line 2794, Proposition 5.2.3, p.54 | Perfectness over the finite torus group ring, not merely over its coefficient ring; decomposable compact level, no division by its order. The previous review's p.53 was a review transcription error; the package's p.54 is correct. |
| §4.2 unipotent-level independence | BP-Hida line 2800, Proposition 5.2.5, pp.54–55; line 1244 and line 1268, Proposition 2.8.2 | Equal torus parts, interlacing decomposable levels and ordinary localization. The iterated correspondence argument has flat projections; it is not an arbitrary level-change assertion. |
| §5.3 finite-slope continuation | BP-Coleman line 4937, Proposition 5.3.2, p.105; line 4963, Corollary 5.3.4, p.106; line 5038, Theorem 5.3.7, p.107; line 5062, Corollary 5.3.8, p.108; line 5236, Theorem 5.4.12, p.112 | Positive iteration, relative support inclusions, pro-Banach model, rescaled cutoff and comparison maps. The literal zero-power source assertion is explicitly corrected. |
| §5.4a algebraic finite-slope duality | BP-Coleman line 5458, Theorems 5.7.1–5.7.2, pp.117–119; line 1460, §2.7, pp.31–32 | κ∨=−w0Mκ−2ρ_nc, χ inversion, opposite support and boundary variant, degrees i and d−i, inverse controlling element and matching finite blocks over finite extensions of ℚ_p. |
| §5.5 proved local slopes | BP-Coleman line 5694, Theorem 5.9.6, pp.122–124 | Both direct bounds and both transposed bounds; no use of the conjectural sharp full-space bound. |
| §6.3 finite perfect slope blocks | BP-Coleman line 6686, Proposition 6.1.11, pp.144–145; line 6796, Lemma 6.1.15 and Remark 6.1.16, p.146; line 6812, §6.1.17 and Lemma 6.1.18, p.147 | Finite-projective complex on an adapted window, finite cohomology and flat restriction; choices of compact lifts/models are retained. No projectivity of individual cohomology modules or globally canonical complex for all operators. |
| §6.5 locally analytic BGG | BP-Coleman line 6995, Theorem 6.2.16; line 7015, Corollary 6.2.18, pp.151–152; line 7036, dual distribution construction | Locally analytic kernel includes V_sm,1; algebraic comparison becomes the required one after finite slopes; algebraic dot action and dual distributions are not conflated. |
| §6.7 BGG exclusion | BP-Coleman line 7399, Theorem 6.5.5, pp.160–161; line 7690, Theorem 6.8.3 and Corollary 6.8.4, pp.167–168 | Subtract each ν_v from both necessary analytic bounds, negate their conjunction for every v≠1, transpose by character inversion. This explicitly defined sufficient region is not identified with the problematic printed sss formula. |
| §6.9 family ranges and pairings | BP-Coleman line 7415, Theorem 6.6.1, pp.161–164; line 7573, Theorem 6.7.1 proof, pp.164–165; line 7603, Theorem 6.7.2; line 7644, Theorem 6.7.3, pp.165–167 | Complementary ranges, domain hypothesis for bottom torsion freeness, family pairing and fieldwise finite-block perfectness; no unsupported assertion of flatness or perfect duality of arbitrary full family cohomology. |
| §8.5 sharp Siegel bounds | BP-Hida line 3183, Theorem 6.2.9; line 3210, Corollary 6.2.10, p.62; line 3285, Theorem 6.2.15 and Corollaries 6.2.16–6.2.17, p.64 | Stable lattice on finite slope blocks, sharp geometric bound and analytic bound zero in every genus; strict BGG exclusion and no general noncompact abelian-type extrapolation. |
| §9.5 isolated Klingen refinement | Pilloni-Singular line 911 through line 968, §5.1.5, Propositions 5.1.5.1–5.1.5.2 and Lemma 5.1.5.2, pp.21–22; line 4658, Lemma 14.8.3 proof, p.102 | Four-dimensional generic unramified principal-series module, normalized eigenvalues p⁻¹ times the four products, and irreducibility criterion. The cited lemma assumes four distinct products. The package correctly calls the isolated-root result an extension and makes nonvanishing across other-root collisions a target; it does not pretend density alone proves it. |

### Computed adversarial table

These are separating computations and checks of hypotheses, not proofs of the research theorems. Each of the 69 numbered sections is represented, including all sampled and headline targets. An excluded instance tests the written hypothesis; it is not silently used as an instance of the theorem. All rows below require no package change.

| Statement | Instances tried | Values on the two sides or against the wrong model | Result |
|---|---|---|---|
| Conventions: coefficients and normalization | p=2,3; ramification e=2; zero ring | Over ℤ/9, 3²=0; over ℚ₃, v(3)=1. If p=π² then v_p(p⁻¹π³)=1/2, not 2. Over the zero ring every complex is 0. | Integral/rational theories and v_p(p)=1 kept distinct; equal-characteristic fields are outside Coleman hypotheses. |
| Conventions: scalar and degree signs | p=3, exponents 2,−1; d=1 | 3⁻²·3=1/3=3⁻¹. A[−1] has its nonzero group in degree 1; duality exchanges 0 and 1. | Nonzero base and cohomological shift agree. |
| §1.1 weight dictionary | C₂, ν=(0,−2) | Four κ are (5,3),(5,1),(2,−2),(0,−2); their matching inverse maps all return (0,−2). κ=(5,3) has κ∨=(0,−2), and dualizing again gives (5,3). | Weight inverse, opposition and top-form sign agree. |
| §1.2 cone order | Two-ray difference (−1,10); central difference 1 | −1<0 excludes the first despite 10>0; central difference 1 violates the required central equality. | Neither a single scalar bound nor unrestricted coordinate order suffices. |
| §2.1 solid coefficient specialization | Smooth dimensions d=0,1,2 over 𝔽₂ and ℤ/9 | Ω⁰[0]=A[0]; Ω¹[1] has rank 1 in degree −1; Ω²[2] has rank 1 in degree −2, whereas Ω¹[2] has rank 2. | Correct top exterior power and shift; no unrestricted discrete comparison asserted. |
| §2.2 dynamics | I=(t), maps t↦t²,t³ and identity | Strict ratios can be 1/2,1/3. Identity would require a≥b and a<b for I^a⊂I^b and strict ratio a/b. | Strictness excludes identity on a nonempty divisor; empty boundaries have empty support conditions. |
| §2.3 ordinary localization | A=ℤ/9, T=3,1,0; zero module | Ordinary factors 0,A,0,0 respectively; rational eigenvalue 3 instead survives finite slope with slope 1. | Localization is tied to the integral operator. |
| §2.4 finiteness | Proper point versus affine line over 𝔽₂, identity | Point H⁰ has dimension 1; line has independent 1,t,t²,… and infinite dimension. | Proper compactification/core hypothesis excludes the false affine identity example. |
| §2.5 discrete coefficient change | Spec A, A=ℤ/9, F=A, M=𝔽₃; nonflat F=𝔽₃ | Flat example: both sides 𝔽₃[0]. Nonflat example: Tor_i^A(𝔽₃,𝔽₃)=𝔽₃ for every i≥0, while underived tensor has only degree 0. | A-flatness and derived tensor are essential. |
| §2.6 equivariant perfectness | C₂ over k=𝔽₂ | k[C₂] is free rank 1 over itself; trivial k has Tor_i^{k[C₂]}(k,k)=k for all i≥0. | Finite cohomology alone is not group-ring perfectness. |
| §2.7 transposed duality | ℙ¹ over 𝔽₂, empty boundary | RΓ(O)=𝔽₂[0] and RΓ(Ω¹[1])=𝔽₂[0]; trace pairing 1·1=1. | Top forms and degree convention agree, including p=2. |
| §2.8 support change/bridge | Two discrete points with id; three points σ(a)=a,σ(b)=a,σ(c)=b | Ordinary ranks 2 versus 1 for the first unequal support pair; forbidden cross-containment is {a}⊂∅. In the second, T(f)=(a,a,b), T²(f)=(a,a,a), ordinary rank 1 on each permitted side. | Cross-containment direction and strict/compact distinction separate the wrong models. |
| §3.1 strata | g=1, level length n=1,2; n=0 boundary | Multiplicative/étale degrees (n,0) and (0,n) sum to n. At n=0 both are (0,0). | Positive-level hypotheses distinguish the labelled strata; no spurious rank-zero genus claim. |
| §3.2 Hecke normalization | p=3, diag(2,3),diag(2,6) | Character ratios 3/2 and 3 both have valuation 1. Replacing the former by 3 loses unit 1/2. | Entire character, not valuation alone, normalizes the action. |
| §3.3 strict stratum dynamics | p=2,3; positive coordinate contraction | z↦pz sends valuation r to r+1 and z↦p²z to r+2; the identity sends r to r. | Positive iterations give strict improvement; identity does not. |
| §3.4 fixed weight | ν(u)=u, u=2, χ(2)=−1; boundary fibre | Torus scalar −2 differs from 2; inverse algebraic twist gives −1. The map (q)→O at q=0 has fibre map 0, whereas O→O has fibre map 1. | Retain χ and distinguish canonical/subcanonical extensions. |
| §3.5 fixed-weight perfectness | [ℤ_p —p→ ℤ_p] in degrees 0,1 | Terms rank 1; H⁰=0,H¹=𝔽_p. | A perfect complex can have torsion, nonprojective cohomology. |
| §3.6 Cousin indexing | Length r=1,q=0; GL₂ k=1 and k=2 | E₁ contribution H¹ abuts in degree 1, not 2. At k=1 two compatible lengths 0,1 can remain; at k=2 the incompatible scalar 3 is nilpotent modulo 9. | No extra length shift and no singular one-column collapse. |
| §3.7 regular control | GL₂ k=2, normalized action p⁻¹U | Tensor by −ν multiplies by p, giving U; inverse choice gives p⁻²U. χ remains χ. | Rational twist and singleton restriction agree with the source. |
| §3.8 spherical algebra | GL₂ ℓ=2,3; coefficient tower modulo 3^s | 3²=6+3=9 and 4²=12+4=16. In ℤ/9 the first is 0=0; in the limit coefficient 3 is nonzero in ℤ₃. | Product multiplicities and coefficient limit retained. |
| §4.1 finite group-ring blocks | C₂ over 𝔽₂; integral augmentation | Regular module rank 1 over 𝔽₂[C₂]; trivial module has nonzero Tor in every degree. Invariant augmentation over ℤ₂ has image 2ℤ₂. | No averaging by 2; equivariant projectivity comes from the tower. |
| §4.2 level independence | Same torus, pull/trace composite 2 over ℤ₃; nonordinary scalar 3 | Inverse on ordinary line is 1/2; composite becomes identity. Multiplication by 3 has ordinary factor 0 modulo 9. Changing finite torus quotient C₂ to 1 changes regular coefficient ranks 2 to 1. | Only unipotent level with fixed torus is removed. |
| §4.3 universal Igusa object | Functions x↦x on ℤ_p versus finite-level functions | x↦x has infinite image; every locally constant finite-level function has finite image. Limits of reductions recover the former. | Completion and level limit cannot be replaced by one finite level. |
| §4.4 continuous admissibility | Regular continuous function module; degree i | Continuous dual reconstructs with inverse action; dual degrees i→−i→i. Evaluation of x↦x at 0,1 gives 0,1. | Continuous, not merely locally constant, category is used. |
| §4.5 Iwasawa character | p=3,u=4,ν(u)=u | Arithmetic scalar map sends [4] to 1/4; the uninverted character gives 4; their product is 1. | Explicit inverse-action specialization excludes the wrong convention. |
| §4.6 derived arithmetic control | B=F⟨t⟩, [B —t→ B] | Family H⁰=0,H¹=B/(t); t=0 fibre has H⁰=H¹=F through Tor₁=F; t=a≠0 fibre is 0. | Derived control, not ordinary tensor of cohomology. |
| §4.7 finite Hecke image | Λ=ℤ₃[[X]], scalar action; U=1+N,N²=0 | Scalar Λ-span has rank 1; algebra Λ[N] has rank 2, while its reduced scalar quotient has rank 1. | Finiteness does not remove nilpotents or identify an image with the abstract algebra. |
| §4.8 integral duality | g=2,d=3, degree i=1 | Partner degree 2; 1+2=3; target Λ[−3]. For κ=(5,3), κ∨=(0,−2). | Degree complement, character inversion and boundary twist retained. |
| §4.9 integral amplitude | g=1,2 and length 1 | d=1,3; at g=2 cusp [0,1], canonical [1,3], common endpoint 1. | Integral conclusion is genus at most two; g=3 is not inferred. |
| §5.1 imported geometry | m=n=0,m′=1; m=0,n=1; torus | 0≤m−n≤m′−1 is 0≤0≤0 in first case and fails 0≤−1 in second. Torus flag has one point. | Correct depth direction; this subsection imports geometry rather than claiming it again. |
| §5.2 allowed support definition | GL₂,p=3,C=2,depth 1; depth −1 versus −∞ | Periods z=3,9 have valuations 1,2: v(z)>1 excludes 3 and includes 9; v(z)>2 excludes 9. At p=3, |1/9|=9>3; at p=2, |1/4|=4>2. | Relative lower inclusion works; absolute inclusion and unbounded interpretation of −1 fail. |
| §§5.2–5.3 repaired compact power | Standard depth zero, j=0,1,2 | j=0 gives slope-zero ranks 3,6,12,…; j=1 gives eigenvalues 1,3,9; j=2 gives 1,9,81. Cutoffs 2 and 4 both select dimension 3. | Previous F01 repaired; positive iteration and cutoff scaling discriminate identity. |
| §5.4 level/character control | C₂ descent, ℚ₂ versus ℤ₂ | Averaging uses 1/2 over ℚ₂; integral invariant augmentation has image 2ℤ₂, not ℤ₂. | Rational finite-slope level descent is not integral averaging. |
| §5.4a finite-block duality | η(t)=p²; paired inverse character | η⁻¹(t⁻¹)=p², slope 2 on both controlling elements; η⁻¹(t)=p⁻² has slope −2. | Same cutoff uses inverse controlling element, not the same t on both signs. |
| §5.5 two proved bounds | C₂,w=1,κ=(5,3;−8),t₂ | Direct threshold 0; transpose adds 3. Slope 2 passes first and fails second; slope 3 passes both. | Transposed bound is necessary; sharper general conjecture unused. |
| §5.6 complementary ranges | d=1,length 0 or 1 | Cusp ranges [0,0],[0,1]; canonical [0,1],[1,1]. Opposite-sign lengths are 1,0. | Using the same sign on both sides gives a wrong endpoint. |
| §5.7 Cousin/interior objects | Two consecutive terms F→F, differential 1 or 0; cusp map zero | Identity differential gives cohomology 0, zero differential gives F in each degree; image of zero cusp map is 0. | A spectral sequence is not a direct sum and interior is the image of the specified map. |
| §5.8 singular classicality | C₂,κ=(2,2) | κ+ρ=(1,0), compatible lengths 0 and 1, permitted range [0,1]. | No unsupported concentration in one degree. |
| §6.1 analytic normalization | Unit 2; p⁻³ twist on eigenvalue p² | 2·(1/2)=1; p⁻³p²=p⁻¹ has slope −1. | Unit factor and valuation shift both retained. |
| §6.1a abelian descent | Characteristic-zero quotient A²/{±1} | Generic fibre length 2; origin fibre F[x,y]/(x²,xy,y²) has basis 1,x,y, length 3. | Finite descent alone is not flat; smooth fan/regularity hypotheses matter. |
| §6.2 analytic supports | Radius n=1, GL₂ depth-one pair; rootless datum | U∩Z=B(1,1); v(3)=1 excluded, v(9)=2 included. For rootless N-point datum every B=X and cohomology F^N[0]. | Coefficient-domain condition remains independent; j≥1 also here. |
| §6.3 finite perfect blocks | [A —t→ A], A=F⟨t⟩ | Each term free rank 1; H¹=A/(t) is not projective; after inverting t the block is acyclic. | Perfect complex versus projective cohomology distinguished. |
| §6.4 Tor specialization | Same complex at t=0 and t=a≠0 | Tor₁^A(A/(t),F)=F creates fibre H⁰=F; at a≠0 both cohomology groups are 0. | Indices −p and p+q give the correct additional degree. |
| §6.5 analytic BGG | SL₂,weight 1,p=2,3 in characteristic zero | D²1=D²z=0,D²z²=2≠0. Twisted eigenvalues 1/3,3 have slopes −1,1. | Algebraic factor/kernel, locally constant factor and twist are distinct; reduction to characteristic 2 would invalidate this calculation. |
| §6.6 automorphic BGG | C₂,w=1,κ=(5,3) | ν=(0,−2); reflected ν_v=(−3,1); κ_w(ν_v)=(2,6), not M-dominant. | Reflected analytic terms cannot be discarded by invoking a geometric bound with nonexistent dominant coefficient. |
| §6.6a analytic duality | Two-point coefficient space; infinite product versus sum | Pairing of (1,0),(0,1) is 0 and of (1,0),(1,0) is 1. The all-one sequence belongs to a product but not the direct sum. | Finite-block perfectness does not identify unrestricted algebraic/topological duals. |
| §6.6b analytic bounds | C₂,w=1,ρ=(−1,−2),c=2ρ_nc=(−3,−3) | a=(3,3),b=0; a+c=0=−b and b+c=(−3,−3)=−a. Omitting ρ gives (−2,−1), not the transpose. | Correct fourth bound. General-field argument uses finite-block specialization, not unavailable full duality. |
| §6.7 BGGsafe | Nonidentity C₂ term with thresholds 0,3; trivial W_M | Slope 2 violates the second inequality and is excluded; slope 3 passes both. Empty conjunction for W_M={1} is true. | Correct negation of conjunction; equality is not excluded. |
| §6.8 coefficient control | Finite spectral sequence with only identity column | E₁^{0,q}=V and other columns 0 imply H^q=V, with no shift; if E₁^{1,q}=V remains, an extra total degree q+1 can occur. | Exclusion is the input; coefficient control is separate from global classicality. |
| §6.9 ranges/torsion freeness | [A —s→ A], domain A; ideal (s,t)⊂F⟨s,t⟩ | Bottom H⁰=0 is torsion-free, H¹=A/(s) is torsion. The ideal has rank 1 but needs two generators at the origin. | Bottom torsion freeness does not force higher cohomology flat or all finite modules projective. |
| §6.10 Hecke algebra action | S₃ with trivial level; matrix units over 𝔽₂ | (12)(23)=(123) differs from (23)(12)=(132); E₁₂E₂₁=diag(1,0), reverse=diag(0,1). | Commutativity requires spherical/Satake input and relations, not merely individual operators. |
| §7.1 cohomological eigenvariety | [F —1→ F] versus F in degree 1 | Total cohomology 0 versus F; support empty versus one point. | Acyclic degree terms add no points; positive-degree packets are retained. |
| §7.2 classical packets | C₂ example from §6.6 | Initial ν=(0,−2), reflected ν_v=(−3,1); these are unequal though the Bruhat support part is the same. | Full Weyl/Levi contribution is needed; converse remains sufficient only. |
| §7.3 interior image | Multiplication by t on A=F⟨t⟩ | Image I=(t), I⊗_A F≅F, while image of specialized map t=0 is 0. | Formation of image does not commute with arbitrary tensor. |
| §7.4 interior specialization | The same image example | Natural F→0 is surjective but not injective. | Correct one-sided base-change conclusion; no unwarranted isomorphism. |
| §7.5 dimension and deformation | A[ε]/ε² versus A/(t), A=F⟨t⟩ | First is rank 2 over A and dimension 1; second has dimension 0 and A-torsion. | Torsion-free support input forces full dimension, not reducedness. |
| §7.6 sharp interior theorem | GL₂ k=2 and k=1; C₂ κ=(5,3) | k=2 threshold 1 excludes equality; k=1 compatible lengths {0,1}. C₂ t₂ bounds 3,4,4,8 become 0,1,1,5 after normalization by p³. | Strictness and singleton identity-chamber qualification retained. |
| §8.1 integral overconvergent model | Vertical divisor p; formal versus punctured affine line | After inverting p, (p)=O and its twist is trivial. 1/t belongs to A[t,t⁻¹] but not A[[t]]. | Rational boundary disappearance does not interchange completion and localization integrally. |
| §8.2 ordinary/finite slope | diag(1,3) on ℤ₃² | Integral ordinary rank 1; rational finite-slope space rank 2, slopes 0,1. | Comparison selects the ordinary part, not all rational slopes. |
| §8.3 family comparison | Character value ν(4)=4 at p=3 | Inverted scalar map gives 1/4; direct evaluation gives 4. | Family map agrees with arithmetic inversion in §4.5. |
| §8.4 all-genus rational amplitude | g=3,d=6,length 2 | Canonical [2,6], cusp [0,2]; dual intervals [−6,−2],[−2,0]. | Rational assertion keeps both endpoints and does not assert integral genus-three amplitude. |
| §8.5 sharp Siegel bounds | g=2,k₂=3 | Sharp t₂ threshold 4; standard normalized threshold 4−3=1. Slope 0 passes, slope 1 fails strict test; analytic slope −1 violates bound 0. | Strict classicality and all-genus lattice bound agree. |
| §9.1 four C₂ weights | ν=(0,−2),ρ=(−1,−2) | κ=(5,3),(5,1),(2,−2),(0,−2); matching inverse gives ν each time. | Same conventions as Layer 1, not a different Weyl action. |
| §9.2 modular curve | k=2,0,1 | Degree-zero threshold k−1=1 at k=2; degree-one dual threshold 1−k=1 at k=0; threshold 0 at k=1. | Degree-one and singular boundary are not erased. |
| §9.3 GSp₄ normalization | p=3,t₁=diag(1/3,1/9,1,1/3) | Outer and middle products both 1/9; replacing last entry by 3 makes outer product 1. Sharp t₁ bounds 6,6,11,11 versus t₂ bounds 3,4,4,8 at κ=(5,3). | Similitude and operator normalization are checked separately. |
| §9.4 Klingen complex | One-variable partial ordinary family | Λ₁ has one character variable; the Siegel derived torus has rank 2 (the full GSp₄ torus has rank 3). At k=0 the coefficient weight is (2,2). | Partial-ordinary object is not identified with a full-torus M_w. |
| §9.5 isolated spherical refinement | p=3,(α,β,γ,δ)=(1,1,9,9) | αδ=βγ=9; products 1,9,9,81; eigenvalues a=1/3,b=b′=3,c=27. Denominator (a−b)²(a−c)=−5120/27≠0; P(a)=1,P(b)=P(c)=0,P(bI+N)=0 for N²=0. | Multiplicity-two factor kills the other Jordan block; the chosen root stays simple. Ratios 1,9,1/9 avoid 3; (1,1,3,3) instead hits the excluded ratio 3. |
| §9.6 Klingen analytic BGG/fibres | k=0,r=−1,p=3; spectral Jordan block | Final exponent k+r+1=0; D1=0,Dz=1; D(Uz)=3=pU(Dz), not 1/3. R/(X−1)² localized primary dimension 2, residue dimension 1 with Tor₁ dimension 1. | Negative determinant twists, positive equivariant factor and primary localization retained. |
| §9.6 radius limit | f=Σ2^m z^(2^m−1) over ℚ₂ | Input coefficients tend to 0; antiderivative coefficients on z^(2^m) equal 1, not tending to 0. On radius ρ<1 they have norms ρ^(2^m)→0. | Exactness is after the radius passage, not falsely at a fixed closed radius. |
| §9.7 extension thresholds | (k,r)=(0,2),(0,0) | Extension thresholds 1,−3; at (0,2), combined all-degree bound min(−2,1)=−2 and H⁰ bound min(1,1)=1. | Ordinary H⁰ is covered at (0,2), not all-degree ordinary equivalence. |
| §9.8 two-term control | p=2,k=0 and k=4; k=3 boundary | Rational small-weight conclusion includes k=0; torsion range k>3 includes 4 and excludes 3. Repeated products 1,9,9,81 have valuations 0,2,2,4. | All-prime statement and separate integral threshold retained; distinct nonordinary roots are unnecessary. |
| §9.9 split U(n,1) | n=2,ν=(4,2,0) | Three κ are (−3,−5,2),(0,−5,−1),(0,−2,−4); there are three possible cohomological lengths 0,1,2. | Positive-degree family example agrees with the weight dictionary; no integral general-PEL extrapolation. |

### Headline coverage, elaboration and padding

The ten headlines listed at packages/HigherHidaAndColemanTheory/README.md:303 all occur in the module docstring of packages/HigherHidaAndColemanTheory/Suggested.lean. Their obstacles are geometric carriers, not a missing short scalar definition.

| Headline | README | Lean docstring coverage and missing carrier |
|---|---|---|
| Derived arithmetic Hida control | §4.6 | Lines 10–15: integral Siegel/Igusa models and their supported universal ordinary complex |
| Integral Iwasawa Serre duality | §4.8 | Lines 10–15: the same geometric complexes and coherent pairing |
| Integral amplitude in genera one and two | §4.9 | Lines 16–18: universal Iwasawa complex |
| Rational amplitude in every genus | §8.4 | Lines 16–18: universal complex and its analytic comparison |
| Regular and singular geometric classicality | §5.8 | Lines 19–21: abelian-type spaces, period tubes and supported Cousin cohomology |
| Cohomological eigenvariety | §7.1 | Lines 22–24: rigid character spaces and geometric analytic family cohomology |
| Interior dimension and deformation | §7.5 | Lines 22–24: those families and their interior image |
| Sharp interior bounds | §7.6 | Lines 25–27: finite-slope supported coherent cohomology |
| Sharp Siegel bounds | §8.5 | Lines 25–27: integral supported overconvergent model |
| Two-term Klingen control | §9.8 | Lines 28–30: Klingen threefold, height-one tower and partial-ordinary complex |

The file has exactly `import Mathlib`, the prescribed module docstring and the correct empty namespace. There are zero declarations, zero sorried theorems and zero examples. Consequently the exhaustive one-tactic padding probe and the `#check @name` binder audit each have zero cases. No weakened theorem or arbitrary predicate has been inserted in place of a headline. The README's weight and slope calculations are Checks, not substitutes in Lean.

Ran the required `lake env lean` elaboration of packages/HigherHidaAndColemanTheory/Suggested.lean from the pinned content checkout: **exit 0; empty output; no warnings**. No TauCeti module import needed a targeted build. No Lean process remains running.

### Pinned library and duplication audit

Opened the following declarations at the pins. Object searches included Igusa towers, Shimura moduli, supported ordinary cohomology, analytic localization, eigenvarieties, and Hecke operations. The only apparent Shimura hit in the declaration-pattern search was prose about Shimura's Hecke multiplicities. Generic derived categories and condensed modules do not supply the absent geometric carriers. There are no local declaration names to collide with a sibling Suggested.lean.

| Declaration | Pinned file and line | Boundary read |
|---|---|---|
| Module.End | Mathlib/Algebra/Module/LinearMap/End.lean:33 | Semiring, additive commutative monoid and module; no Hecke relations |
| zpow_sub₀ | Mathlib/Algebra/GroupWithZero/Units/Basic.lean:402 | Nonzero base in a group with zero; at 3,m=−1,n=2, both sides are 1/27 |
| HasDerivedCategory; DerivedCategory | Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:74 and :87 | Abelian category and localization instance; no geometric coherent cohomology |
| CondensedMod; abelian instance | Mathlib/Condensed/Module.lean:41 and :43 | Sheaves of modules on CompHaus with coherent topology |
| CondensedMod.IsSolid | Mathlib/Condensed/Solid.lean:83; documentation :74–81 | Profinite solidification predicate with the documented general-ring restriction; not polynomial analytic localization |
| IsHeckeTriple; HeckeCoset; HeckeRing | Mathlib/NumberTheory/HeckeRing/Defs.lean:75, :157, :189 | Commensuration, double cosets and finitely supported coefficient module; no product here |
| HeckeCosetModule.instRingHeckeRing | TauCeti/NumberTheory/HeckeRing/Associativity.lean:484 | Native convolution ring structure over the specified coefficient ring |
| HeckeCosetModule.mul_comm_of_antiInvolution | TauCeti/NumberTheory/HeckeRing/Commutativity.lean:459 | Requires an anti-involution preserving the subgroup and fixing double cosets; does not construct it for a general unramified group |
| TauCeti.VermaModule | TauCeti/Algebra/Lie/HighestWeight/Verma.lean:195 | Native Verma carrier identified while following LieHighestWeight's Layer 3 input/induced-tensor comparison; no duplicate Verma construction is planned here |

All eleven distinct backticked library identifiers claimed by the README resolve at the pins. The native Verma input above was also opened while checking the indirect supplier interface. The citation resolver reported no missing cross-roadmap sections or names; its lack of access to pinned packages was not used as evidence for library claims. Those were checked directly.

Read the supplied board package index before checking whether an owner was absent, and read the open-head index and overlap output. Used `roadmaps show` and `roadmaps grep` for ownership by object. No second copy of this roadmap on main, conflicting open head, dropped cited id, dropped incoming id without mapping, or dependency on numbering available only in an open revision was found.

| Closest roadmap and witness | Shared scope and owner |
|---|---|
| PadicFamiliesPartII, #2280, TauCetiRoadmap/PadicFamiliesPartII/README.md:7, :707, :953 | Its scope imports the higher supported foundation here. Its §§4.6 and 5.7 are the explicitly stated Hilbert, multi-place extensions of integrality and relative BGG; this package owns the Siegel/Klingen base results. |
| AutomorphicBundlesPartII, #1823, TauCetiRoadmap/AutomorphicBundlesPartII/README.md:7, §§3.0a,3.13,5.13 | Owns coherent carriers, individual higher-degree Hecke operators and hyperspecial Hilbert–Siegel algebra relations; excludes the supported p-level and analytic-family relations owned here. |
| OverconvergentAutomorphicForms, #1422, TauCetiRoadmap/OverconvergentAutomorphicForms/README.md:7, §§0.4,8.6–8.7 | Owns analytic induction, coefficient families and descent. This package constructs their supported cohomology and the locally analytic BGG application. |
| GSp4NonregularModularityLifting, #1817, TauCetiRoadmap/GSp4NonregularModularityLifting/README.md:7 | Owns selected modularity-lifting applications; the universal higher-cohomology theory is supplied here. |
| PerfectoidShimuraVarieties, #1085, TauCetiRoadmap/PerfectoidShimuraVarieties/README.md, scope and §§6.13–6.15 | Owns period maps, Bruhat tubes and Levi reductions. Section 5.1 of this package imports them; allowed supports and supported cohomology start at §5.2. |
| SmoothRepresentationsOfLocalGroups, main, TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md, scope and §§SR.1.2,SR.1.4,SR.4.1,SR.4.5 | Owns generic local Hecke, induction and Satake theory. It leaves Klingen refinement computations to consumers; the isolated spherical computation is owned here. |

The later PadicFamiliesPartII scope and §5.7 still describe this package's §9.6 as using p^(−k−1). That description is stale: packages/HigherHidaAndColemanTheory/README.md:1610 uses p^(k+1), and its derivative Check gives 3 rather than 1/3 at k=0,p=3. Its Hilbert extension has the same corrected sign. This observation requires no change to the package under review and is not counted as a package finding.

Overlap check: read PadicFamiliesPartII, AutomorphicBundlesPartII, OverconvergentAutomorphicForms, GSp4NonregularModularityLifting, PerfectoidShimuraVarieties and SmoothRepresentationsOfLocalGroups across all three closest-roadmap lists; shared objects have the owners stated in the table, with the higher supported geometric theory owned by HigherHidaAndColemanTheory.

### Supplier resolution and order

Re-resolved every supplier citation against main or the available open head. In this table paths are TauCetiRoadmap/<supplier>/README.md; section ids are the checked locators, grouped only where the package consumes one combined interface. The library locators are listed separately above. Internal Needs lines were also read, including proof-route inputs.

| Supplier/head | Resolved sections and supplied object |
|---|---|
| AdicSpacesPartIII, main | R3.1,R3.4,R3.6,R3.8: finite coherent affinoid/quasi-Stein cohomology, compact restriction and finite locally free trace; projective Banach enhancement declared separately |
| AdicSpacesPartIV, main | F1.10: coherent support triangles/dagger Serre duality; compact-type LB/Fréchet enhancement declared separately |
| AlgebraicModularFormsAndSerreWeightsPartII, #1822 | §§7.1–7.4: hyperspecial spherical trace divisibilities, p⁻³T′ integrality and rank-zero Hartogs extension; does not own the Klingen I^(−3)-twisted analogue |
| AutomorphicBundles, #1069 | §§1.4–1.5,1.9,3.3,5.2–5.4,5.10,6.1,9.1,11.10,11.16–11.17,12.1,12.11: torsors, coefficients, algebraic BGG, canonical/subcanonical extensions and trace adapter |
| AutomorphicBundlesPartII, #1823 | §§2.2,2.4–2.5,3.0a–3.0b,3.1–3.3,3.6,3.9–3.13,4.4,5.1–5.2,5.13: solid coherent operations, equivariant perfectness/descent, transpose, completion, p-level spans, vanishing and individual operators |
| AutomorphicFormsOnReductiveGroups, #1037 | §6.7: Siegel coherent chambers; general abelian-type extension belongs to Layer 1 here |
| CompletedCohomologyPartII, #1035 | §§3.11–3.12: continuous admissibility, measure duality, inverse-action diagonal Iwasawa realization and reconstruction |
| DeformationAndDerivedPatchingAlgebra, #1034 | §§7.1,7.3,7.5–7.6,7.8,7.10: Tor conventions, minimal perfect representatives, complete models, signed duality and finite derived Hom |
| HodgeTateAndCanonicalSubgroups, #1084 | §5.1: existing Hilbert ordinary torsor; full polarized Siegel and height-one Klingen towers explicitly remain gaps |
| IntegralHeckeAndGaloisDeterminants, #1689 | §§2.1,2.3: bounded-finite derived Hom/action images and Fitting ordinary parts without projective-dimension assumptions |
| LieHighestWeight, main | Layer 3: native PBW/Verma inputs and induced-tensor presentation; not locally analytic BGG exactness |
| LocallyAnalyticDistributions, #854 | §§3.3,4.2,4.16–4.17: character coordinates, completed scalar extension, finite perfect slope complexes, factorized operators and compact-stage Fréchet comparison; internal deferrals preserve the cited interfaces |
| OverconvergentAutomorphicForms, #1422 | §§0.4,8.6–8.7: analytic induction, rank quotient and Bruhat/distribution coefficients; finite-flat cover premise for general abelian type is proved in §6.1a here |
| PELModuli, #966 | M2.8–M2.9,M5.1–M5.2,M5.5–M5.6: moduli input and Siegel/split-unitary data; integral toroidal scheme specializations use the separate model contracts |
| PadicFamilies, #1019 | 0a.24–0a.25,2a.8–2a.17 and Layers 0,0a: ordinary projectors, module/complex spectral charts, intrinsic annihilator support, Euler characteristics and primary eigenmodule localization |
| PadicMeasuresIwasawaAlgebras, main | §§1.1,1.7: joint finite coefficients, continuous torus measures and completed group algebra |
| PerfectoidShimuraVarieties, #1085 | §§3.13,4.5,6.3–6.10,6.12–6.15, including 6.13a: geometry, descent groups, finite-level maps, tubes and torsor reductions; abelian affinoid strengthening is a gap |
| PhiGammaModulesAndIwasawaCohomology, #1310 | §2.7: compact character spaces, universal character and inversion |
| ResolutionOfSingularitiesCharacteristicZero, main | §6.3: ideal-sum blow-up separation of two Cartier divisors on any scheme, not only characteristic zero |
| RigidAnalyticGeometry, main | §§1.1–1.2,8.2: affinoid algebra/finite extensions, finite residue fields and existence of classical points on nonempty rational domains |
| SchemeAndStackFoundations, main | §2.20: relative dualizing upper-shriek comparison and smooth top exterior power |
| ShimuraCompactifications, #1053 | §§0.14,4.10,6.16–6.17,7.19–7.21,7.29: common fans, cohomology comparison, compactified Klingen correspondence, normalized models, formal coefficient criterion and canonical line |
| ShimuraData, #1038 | §§3.8,3.10,3.13,5.5–5.6,5.10–5.11: compact dual, left Kostant representatives, opposition and C₂ coordinates |
| SmoothRepresentationsOfLocalGroups, main | SR.0.2,SR.1.2,SR.1.4,SR.2.2,SR.3.1,SR.3.4,SR.4.1,SR.4.5: smooth category, native Hecke-ring comparison, positive Klingen algebra, induction, Iwahori criterion and Satake normalization |
| SolidAnalyticRings, #1458 | §§7.2–7.4: completed scalar extension, discrete animated Huber-pair/polynomial coefficients and common-light-site comparisons; relative kernel and discrete-adic tower comparisons remain declared gaps |

In particular the generic finite-slope factorization in LocallyAnalyticDistributions requires U_C=ra and U_D=ar; compact transition maps alone do not make an identity compact. Its torus valuation has the geometric-character convention v_p(χ(t)), agreeing with the normalization here. The regular-action inverse in CompletedCohomologyPartII agrees with [u]↦ν(u)⁻¹ here. SmoothRepresentationsOfLocalGroups supplies raw integral Satake after inverting q, and the free integral double-coset module embeds there, so no square root of q is introduced at p=2.

The ten gap slugs in packages/HigherHidaAndColemanTheory/design/plan.json match the ten named README contracts. Each has a named earlier supplier, precise mathematical output and consuming targets. Their additional operations belong to one coherent interface each, not unrelated prerequisites. None is supplied already at the cited scope:

| Conditional gap | Owner and missing strengthening |
|---|---|
| solid-localization-kernel | SolidAnalyticRings §§7.2–7.3: idempotent completion algebra, localization triangles and the specified completed Laurent tensor vanishing |
| discrete-adic-solid-comparison | SolidAnalyticRings §§7.3–7.4: discrete-adic locales and countable completion/localization towers with their derived tensor/limit comparison |
| siegel-ordinary-igusa | HodgeTateAndCanonicalSubgroups §5.1: polarized all-genus Siegel Igusa tower, cofinal decomposable levels including p=2, toroidal and de Rham compatibility |
| klingen-height-one-igusa | HodgeTateAndCanonicalSubgroups §5.1: height-one multiplicative tower, ℤ_p× torsor and affine étale nonfinite transitions |
| abelian-affinoid-basis | PerfectoidShimuraVarieties §§3.13,6.8: classical-flag affinoid basis after abelian descent, with finite-level/toroidal comparison |
| projective-banach-cohomology | AdicSpacesPartIII R3.4,R3.6: finite quasi-Stein covers with locally projective Banach coefficients, countable projective Čech models, compact restriction and the specified integral/lattice estimates |
| banach-support-duality | AdicSpacesPartIV F1.10: complementary-support compact-type LB/Fréchet pairing with Ω^d and finite-slope perfection over finite extensions of ℚ_p |
| coherent-correspondences | AutomorphicBundlesPartII §§3.3,3.6,3.10–3.12 on §3.0a: both BP-Hida support orders, comparison, support-change maps, correspondence compatibility and twist/limit formulas |
| abelian-subcanonical-vanishing | AutomorphicBundlesPartII §5.2: abelian-type and locally trivialized projective Banach extension of the formally subcanonical vanishing theorem |
| klingen-lci-model | ShimuraCompactifications §7.19: the specified integral Klingen subgroup moduli model, normal/lci structure and integral isogeny chain |

A normalized toroidal model alone does not assert the Klingen lci moduli statement; a Hilbert Igusa torsor does not assert the two missing towers; coherent quasi-Stein acyclicity does not assert projective Banach acyclicity. These distinctions justify the gaps' minimality. Their absence as implemented theorems is not a finding.

The prescribed dependency check completed with:

```text
depcheck: 245 roadmaps, 2226 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. Within the package, §5.4a precedes and supplies the transposed bounds of §5.5; §6.6b supplies §6.7, then §6.8; the geometric and analytic comparisons feed §7; §8.3 consumes both §4.6 and §8.2 before rational amplitude; the separate Klingen application is not used to supply its own prerequisites.

### Wording, arrangement and reuse

Compared the fifteen sampled passages and five additional passages (§§5.2,6.2,6.4,6.6b,9.2) with their source texts. These include the changed support definition, analytic-family definition, Tor statement, transposed-bound proof route and modular-curve example. The additional locators include BP-Coleman line 5210 and line 5236 (Definition 5.4.10, Example 5.4.11 and Theorem 5.4.12), line 7301 (Definition 6.4.7), line 7362 (Theorem 6.5.2), line 7690 (Theorem 6.8.3), and BP-GL2 line 61 through line 106 (Theorems 1.1–1.4). No copied prose sentence or clause-by-clause rewritten source passage was found. Shared formulas, standard names and unavoidable short hypotheses were treated as mathematics, not copied expression. No source figure, table, exercise list or numerical dataset was reused; Suggested.lean has no declaration adapted from an external formalization.

For a reproducible source-share count, count explicit source-id citation occurrences in the mathematical text and source-issue list, excluding the bibliography and its introduction. This gives BP-Coleman 76, BP-Hida 54, Pilloni-Singular 30 and BP-GL2 2, total 162; a citation grouping several theorem/page locators is counted once. Including the four bibliography entries gives 77,55,31,3, total 166. BP-Coleman is largest by either count.

Opened BP-Coleman's contents at line 18 through line 76. The roadmap's nine layers are not a one-to-one renamed run of its chapters: common weight conventions and Artinian dynamics feed the integral strata/Iwasawa branch and the geometric/analytic branch; the eigenvariety uses the latter; the integral–analytic bridge needs both; the Klingen application uses a different source and a distinct partial-ordinary object. The order of geometric and analytic support constructions is forced by §6.2 Needs §§5.2–5.3. The duality-to-bound and bound-to-BGG-exclusion edges above also force order. Section 8.3 Needs §4.6 and §8.2 makes the bridge genuinely subsequent to both branches. No unnecessary source-order constraint was found.

Source independence: 20 passages compared with 4 sources, no copied expression found; largest share BP-Coleman, 76 of 162 source-labelled locator groups excluding bibliography; contents compared with BP-Coleman: independent, with the dependency edges specified above.

## Not verifiable

- No source-access, contents-access or elaboration obstruction: all four cited texts were readable and the pinned Lean command passed.
- The ten declared supplier extensions are future contracts. Their precision, ownership, minimality and matching declarations were checked; their future implementations are not certified by this review.

## Source issues

The following source defects were encountered in the checked passages. The package records the corrections or states a sufficient replacement; none is an additional package finding.

- **Error** in BP-Coleman at Corollary 5.3.8 and Theorem 5.4.12, pp.108,112: the source says a nonnegative support witness gives a potent compact power, including zero; it should choose a positive iteration after enlarging that witness; affects a stated result.
- **Error** in BP-Coleman at Definition 5.4.10, Example 5.4.11 and Definition 6.4.7, pp.111–112,158: the source says the absolute lower tube lies in the supported open and its standard pairs satisfy this; it should intersect that lower tube with U; affects a stated result.
- **Misprint** in BP-Coleman at Definition 6.4.7, p.158: the source says the negative geometric inclusion uses coefficient radius n; it should use the freely chosen geometric depth l there; affects a stated result.
- **Misprint** in BP-Coleman at Proposition 2.7.3, p.32: the source says an already degree-d supported complex is shifted again and later uses Ω¹; it should omit the extra shift and use Ω^d; affects a stated result.
- **Misprint** in BP-Coleman at Theorem 6.8.3(2), p.167: the source says the second negative upper bound is −w⁻¹ρ+w⁻¹2ρ_nc; it should be −w⁻¹ρ+ρ+w⁻¹2ρ_nc; affects a stated result.
- **Gap** in BP-Coleman at Definition 5.11.14 and Corollary 6.8.4, pp.134,168: the source says the printed coefficient inequalities give BGG exclusion without the needed shifted calculation; it should derive exclusion from each shifted term and the corrected analytic bounds; affects the proof.
- **Misprint** in Pilloni-Singular at §5.1.5, paragraph before Proposition 5.1.5.2, p.22: the source says the first adjacent parameter product equals the last; it should equate the outer and middle products, αδ=βγ; affects a stated result.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "c2ba00f58cbf1f5f64ee9bf11bba99b695475a65", "job": "REV-PKG-HigherHidaAndColemanTheory~17", "model": "gpt-6-astra", "worker": "chris-9"} -->
