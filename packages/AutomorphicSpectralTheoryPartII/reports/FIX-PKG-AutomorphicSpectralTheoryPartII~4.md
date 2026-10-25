# Repair report: AutomorphicSpectralTheoryPartII

## F01 (P2) — applied

Section 1.9: double cosets meeting C → double cosets contained in C. Added the bi-J-invariance argument and recomputed the disjoint-two-coset, singleton-support and empty-support Checks. Corrected the definition locator from bplzz line 1056 to bplzz line 1063 and added bpcz line 1151. No Lean declaration changes.

## F02 (P3) — applied

Section 1.9: attribution of a finite-place Harish-Chandra Schwartz algebra to SR.3 → the compact-support distinction alone. The Check now states C_c∞(G(F_v)) and excludes a noncompactly supported Harish-Chandra Schwartz function. The supplier owns local Hecke theory, not the alleged Schwartz construction.

## F03 (P3) — applied

Scope: CongruenceSpectralGap CSG.0–CSG.5 → Layers 0–5, with their actual endpoint titles. The cited roadmap has those layers and no CSG labels. This remains a scope deferral; no supplier contract, dependency, target or merge-order change was introduced.

## Evidence and pattern repair

For F01, BPCZ §2.5.2, printed p.209, bpcz line 1151 through line 1159, defines an arbitrary compact C, bi-J-invariance and support inside G∞×C. AutomorphicFormsOnReductiveGroups §0.3 likewise fixes compact support and bi-level; it imposes no saturation assumption on C. BPLZZ Definition 3.1 begins at bplzz line 1063, printed p.21, and its finite-place factor is C_c∞ at bplzz line 1067. The former line 1056 concerns the central character instead.

Here is the stage identification in both directions. If JxJ is not contained in C, choose y∈JxJ outside C. Invariance gives f(g,x)=f(g,y)=0 for every g∈G∞. On each contained coset, restriction gives one arbitrary real Schwartz function; conversely a finite family extends by the characteristic functions of its contained double cosets. Those cosets are compact and open. The double-coset quotient is discrete because J is open, so the compact image of C is finite. The resulting finite-sum topology is the supplied stage topology, since finite-place heights are bounded on its compact support. This proves the comparison without replacing the supplier's arbitrary C by a saturated support.

For F02, the indexed SmoothRepresentationsOfLocalGroups head 1383569 has SR.3 on admissible complex representations, with cuspidal support, Bernstein theory, tempered support and the Iwahori block. Its Schwartz submodule in SR.5.1 is the image of a mirabolic representation map, a different object. The algebra's claimed ownership is absent. The compact-support distinction itself follows directly from bplzz line 1067 and bpcz line 1153. No general p-adic Harish-Chandra algebra is assigned to a new owner by this repair.

For F03, the indexed CongruenceSpectralGap head 2fdf27d has Layer 0, “Congruence quotient and positive spectrum,” and Layer 5, “The parameter bound and congruence gap.” Its §§0.6–0.7 address the continuous threshold, and its conventions and §5.5 address the curvature and metric scaling. Neither its README nor its Suggested.lean carries the CSG labels.

The pattern search covered README.md, Suggested.lean, metadata.toml, sources.toml and design/plan.json, plus the design README and earlier reports as read-only records. Both occurrences of the erroneous support criterion in the editable roadmap were repaired: the §1.9 target and its Check. The finite-place comparison and noncompact-support Check elsewhere in §1.9 agree with the correction. Sections 1.1–1.8, 2.5–2.8, 3.1–3.2 and 4.3 use the same Schwartz action; on a zero support stage its restriction is the zero map, and on two contained cosets it is the diagonal action. No later argument requires a coset merely meeting C.

The only SR.3 attribution and CSG labels in the editable roadmap were the passages repaired above. Sections 2.11 and 3.7 concern global quotient Harish-Chandra spaces and retain their BPCZ/Lapid sources; they do not assert the rejected local ownership. No names, binders, normalizations or formulas in Suggested.lean changed.

## Supplier and ownership verification

Read the main-branch roadmaps NoncommutativeGeometry and ReductiveGroups as shape examples. Cross-roadmap references were reopened using the roadmap service; main-branch suppliers were also checked in the supplied content checkout, including the nested LieGroups and OperatorTheory roadmaps. The resolver used main e98875d and the 363-head index dated 2026-10-25T14:06:45Z. The supplied local content checkout is 98a9b7a; no branch or library pin was changed.

| Supplier | Sections and supplied mathematical objects inspected |
| --- | --- |
| AutomorphicSpectralTheory | §§0.11–0.15: nuclear stages, integration, kernels and holomorphic families; §§1.5–1.10: cuspidal data and pseudo-Eisenstein pairings; §§2.1–2.5: intertwiners; §§3.1–3.4: truncation; Layer 4: Hilbert and discrete-data decompositions; §§5.1–5.9: Franke weighted spaces; §§6.1–6.4: compact multipliers and kernels. |
| AutomorphicFormsOnReductiveGroups | §§0.1–0.5: functions, fixed compact finite support, Schwartz topology, growth and smoothing; §§2.1–2.4, 2.7: representations, induction, characters and integrated Schwartz action; §§3.4–3.5: tensors; §§4.1–4.2: constant terms and cusp spaces. |
| AdelicAlgebraicGroups | §§2.1–2.3: centre, characters and quotient measures; §§3.1, 3.4–3.6: parabolics, reduction, heights and cusps; §§4.6–4.7: compact quotients and characters. |
| SmoothRepresentationsOfLocalGroups | SR.1.1–SR.1.3: Hecke operations; SR.2.2: normalized induction and Jacquet modules; SR.4.1–SR.4.2: Satake and spherical characters. SR.3 has no claimed p-adic Schwartz algebra. |
| AutomorphicLFunctionsAndLocalFactors | Preparatory GLₙ isobaric sums at anchor isobaric-construction; AL.3 strong multiplicity one retains twists and multiplicities. |
| SpectralManifolds | SM3 explicitly owns Fréchet open mapping, closed subspaces and quotient topology. |
| ReductiveGroups; RepresentationTheory/LieGroups | Structure theory in Layer 7; maximal tori in LieGroups Layer 6 and complexification/real forms in Layer 7. The additional real-Cartan comparisons remain explicit gaps. |
| NoncommutativeGeometry | N1 completed projective tensors and their complete-target universal property. |
| OperatorTheory/SelfAdjointSpectralTheory | Parts A–E, including partial unbounded operators and spectral calculus. |
| OperatorTheory/OperatorIdeals | OI-B29–OI-B41, OI-B84 and Part C: nuclear gauge, Hilbert–Schmidt energy, ideal and column models. |
| VonNeumannAlgebras | V4.Core at the specified operator-foundations roadmap head 4831498: Hilbert–Schmidt pairings and complex trace; the composition/nuclear-convention supplement remains a gap. |
| PDE | Lane A Sobolev spaces, local embedding and regularity; weighted quotient evaluation remains its named gap. |
| GlobalHolomorphicFunctions | Preparatory primary factors and locally uniform products: elementary factor, convergence and zero divisor. This Part II's extension is the fixed-genus global growth bound. |
| ZerosOfLFunctions | Standing finite-order convention and Layer 5 items 1–6, covering order bounds and genus-one Hadamard theory. |
| ModularCurvesPartII | §1.4a Lattice sigma function; the rank-two elliptic specialization remains there. |
| CongruenceSpectralGap | Layers 0–5, with the exact titles used by the repaired scope citation. |
| GanGrossPrasadUnitaryGroups | §§6.3–6.4: relative spectral contribution and comparison. Transfer preservation remains outside this package. |

Object searches used the roadmap service over main and indexed open heads and searched local board packages for finite-support stages, double-coset invariance, Harish-Chandra Schwartz algebras and interpolation. The fixed-support carrier is supplied by AutomorphicFormsOnReductiveGroups §0.3. This package owns its comparison with the real multiplier, not a new Schwartz carrier. No new construction or supplier prerequisite was introduced. The existing 26 plan gap slugs equal the 26 README contract slugs; design/plan.json is unchanged. No additional gap is needed to repair these findings.

## Pinned library and acceptance-signature audit

The pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Native definitions were read at those pins, separately from the resolver, which explicitly did not check external Lean names.

| Native declaration | Pinned file and boundary read |
| --- | --- |
| SchwartzMap | Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean:75; real normed-space functions with real smoothness and every weighted derivative bound. It supplies no adelic quotient carrier. |
| Differentiable | Mathlib/Analysis/Calculus/FDeriv/Defs.lean:170; differentiability at every point over the chosen field. |
| Complex.exp | Mathlib/Analysis/Complex/Exponential.lean:62; Taylor-series exponential. |
| HasProd, Multipliable, additive Summable | Mathlib/Topology/Algebra/InfiniteSum/Defs.lean:106 and :114; unordered finite-subset limits. These definitions impose neither countability nor exclusion of the origin. |
| MvPolynomial.eval | Mathlib/Algebra/MvPolynomial/Eval.lean:256; ring-homomorphic evaluation, including Fin 0 and constants. |
| Polynomial.eval | Mathlib/Algebra/Polynomial/Eval/Defs.lean:249; evaluation using the identity coefficient map. |
| MeasureTheory.Lp | Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:89; finite-norm almost-everywhere classes, without arbitrary representative evaluation. |
| CentroidHom | Mathlib/Algebra/Ring/CentroidHom.lean:56; additivity and both multiplication identities, without topology or complex linearity. |
| ContinuousLinearMap.isOpenMap | Mathlib/Analysis/Normed/Operator/Banach.lean:228; the complete normed-space theorem, rather than arbitrary Fréchet open mapping. |

Object searches at both pins found no native carriers for the adelic reductive Schwartz algebra, weighted quotient support projections or smooth automorphic Eisenstein inducing spaces. Euclidean Hermite Schwartz maps, classical modular Eisenstein series and finite-field GL₂ cuspidal characters are distinct. The docstring's missing-carrier list remains appropriate. No Tau Ceti import or targeted object-file build is required.

The three statable headlines remain finite_rank_weierstrass_product, polynomial_zero_fiber_interpolation and affine_lattice_interpolation. The seven definitions make these headlines statable on native carriers; none is sorry'd data or an independent API catalogue. Every one of the ten declaration names occurs in the README. No finding warrants a boundary theorem or another declaration in Suggested.lean.

A scratch copy appended #check @name for all ten declarations and elaborated once. Compared every displayed type with §§0.1–0.3: HasRankBound takes Λ,p; both products retain Λ,p and their finite nonzero-point subtype; HasFiniteEntireOrder does not claim holomorphy; HasRapidVerticalDecay retains the dimension and ∀M>0∀r∃C≥0 order; affineSpectralLattice retains both dimensions and arbitrary generators. Its theorem explicitly retains complex linear independence. The product theorem retains the rank hypothesis; the polynomial theorem retains holomorphy and finite order. No binder was dropped, and no signature or README hypothesis required changing.

## Adversarial mathematics pass

Rows record computations, not proofs of the general analytic statements. The standing category is number fields and complex representations; zero rings, inseparable global fields and nonreduced bases do not inhabit it. Zero spaces, dimension zero, empty support, noncompact quotients, ramification and residue characteristics 2 and 3 do. For compact-circle tests Haar mass is 1, eₙ(x)=exp(2πinx), and D=(2π)⁻¹d/dx. Distinct finite cosets below are disjoint. The finite S₃ model tests the invariance argument without asserting it is an adelic reductive group.

| Statement | Instances tried | Values computed on the relevant sides | Result; change |
| --- | --- | --- | --- |
| Ambient dimensions and zero objects | Fin 0, trivial group, zero representation | One coordinate tuple; empty product 1; every operator sends 0 to 0 | Admitted boundary cases; unchanged. |
| Left derivative sign | π_t on the additive line, t=1,2 | ∫−f′(x)e^{itx}dx=it∫f(x)e^{itx}dx; factors i,2i | Opposite factors −i,−2i excluded; unchanged. |
| Translation and tensor weight | f(z)=z, λ=1 | t₁f=z−1; tensor character α+1 | Separate signs agree throughout; unchanged. |
| Linear-first pairing | u=1,v=i | u·conj(v)=−i; native slots give i and exchanged slots −i | Pairing comparison correct; unchanged. |
| Normalized induction and disintegration | GL₂, abs(a)=4 | δ=4, δ¹ᐟ²=2, δ⁻¹ᐟ²=1/2; product 1 | Recomputed in §§3.6 and 3.8; unchanged. |
| Finite Haar normalization | q=2,3,4 and vol(K)=1 | Square roots √2,√3,2; 1_K*1_K=1_K | No excluded small or ramified place; unchanged. |
| Convolution and involution | Circle, n=0,1 | R(e₋₁)e₁=e₁; R(e₁)e₁=0; e₋₁*=e₋₁; constant-mode coefficient 1 | Recomputed in §3.8; unchanged. |
| 0.1 HasRankBound and least rank | ∅,{0},ℤ | Nonzero sums 0,0; ℤ at p=1 has π²/3, at p=0 diverges | Least ranks 0,0,1; unchanged. |
| 0.1 accumulation exclusion | Λ={1/(n+1)} | Terms (n+1)^{p+1} do not tend to 0 | No rank bound; unchanged. |
| 0.1 subset monotonicity | {2,4} and {4}, p=0 | Sums 3/4 and 1/4 | Smaller set retains convergence; unchanged. |
| 0.1 exponent monotonicity | {2,4}, p=0,1 | Sums 3/4 and 5/16 | Bound persists; finitely many points below unit norm handled separately. |
| 0.1 disk counting | ℤ, radius R | Count 2⌊R⌋+1, inverse-square sum π²/3 | Polynomial counting agrees with finite rank; unchanged. |
| 0.2 elementaryFactor | p=0,1,2; w=0,1,2 | Values (1,1,1), (0,0,0), (−1,−e²,−e⁴) | Empty exponent sum and unique zero agree; unchanged. |
| 0.2 elementary derivative | p=0,1,2; w=1 | −1,−e,−e^{3/2}, all nonzero; p=0,w=0 gives −1 | Derivative formula includes genus zero; unchanged. |
| 0.2 canonicalProduct | Λ=∅,{0},{0,a}, p=0, a≠0 | Products 1,z,z(1−z/a); last derivatives 1 at 0,−1 at a | Origin occurs once; denominators nonzero; unchanged. |
| 0.2 partialCanonicalProduct | Λ={0,1,2}, p=0,z=3 | Empty index 3; {1} gives −6; {1,2} gives 3 in both orders | Insertion and reordering correct; unchanged. |
| 0.2 finite_rank_weierstrass_product | Λ={0,1},p=0 | Stabilized product z−z²; zeros 0,1; derivatives 1,−1; norm ≤R+R²≤exp(2(1+R)) | All headline conjuncts agree; unchanged. |
| 0.2 infinite product headline | Λ=ℤ,p=1 | Product sin(πz)/π; derivatives at integers ±1; sum π²/3; norm ≤exp(π(1+abs(z))²) | Entire order and simple divisor agree; unchanged. |
| 0.2 HasFiniteEntireOrder | 1,e^{z²},e^{e^z} | Bounds e and exp((1+abs(z))²); log magnitude of last at x>0 is e^x | First two admitted; last excluded. |
| 0.2 sum/product order bounds | e^{z²},e^{z³} | Sum ≤2exp((1+abs(z))³); product ≤exp(2(1+abs(z))³) | Larger positive constant absorbs 2; unchanged. |
| 0.2 polynomial pullback order | e^{z²} composed with z² or constant 2 | e^{z⁴} has exponent 4; constant e⁴ bounded by e⁴ | Constant degree handled separately; unchanged. |
| 0.3 HasRapidVerticalDecay | e^{z²},e^{−z²},1; z=iy | Magnitudes e^{−y²},e^{y²},1; weight (1+abs(y)) rules out the latter two | Correct direction and all-weight quantifier; unchanged. |
| 0.3 coordinate independence | Real coordinate z′=2z | exp((z′/2)²) on z′=iy has norm e^{−y²/4} | Strip widths rescale; rapid decay persists. |
| 0.3 polynomial_zero_fiber_interpolation | q=z²,ψ(w)=w−1 | ν=e^{z⁶}(z²−1); zeros exactly ±1; at z=0 value −1; Re((x+iy)⁶)=−y⁶+15x²y⁴−15x⁴y²+x⁶ | Both zero-set directions and strip decay agree. |
| 0.3 zero/constant polynomial fibers | ψ=0; q=c with ψ(c)≠0 | ν=0 has all zeros; ν=e^{Σz_j²} has no zeros | Total zero-polynomial degree is unused; unchanged. |
| 0.3 dimension-zero fiber | ψ(q)=0 or ≠0 | At sole tuple ν=0 or 1, hence zero or nonzero exactly as required | No positive-dimension assumption; unchanged. |
| 0.3 affineSpectralLattice | a=1/2,b=1; rank zero | Points 1/2+m; rank zero range {a} | Translation and empty sum correct; unchanged. |
| 0.3 generator independence | b=(1,1) | Integer vectors (1,0),(0,1) give the same point 1; complex relation 1−1=0 | The theorem excludes this input; unchanged. |
| 0.3 affine_lattice_interpolation | L=ℤ,A={0,1/2} | e^{z²}sin(πz)/(πz) gives 1 at 0, 2e^{1/4}/π at 1/2,0 at every nonzero integer | A may contain points off L; unchanged. |
| 0.3 rank-zero interpolation | L={a}, A empty or {a} | In positive dimension a vanishing linear factor times damping gives ν(a)=0; nonvanishing damping gives ν(a)≠0 | Both boundary demands attainable; dimension zero also permits 0 or 1. |
| 0.4 real-form set and lattices | Split G_m; U(1) | θ={1},Y={0}; θ={−1},plus space 0,Y=ℤ | Split versus compact distinguished; unchanged. |
| 0.4 finite-coset restriction | Rootless rank two | Matrices [[1,m],[0,−1]] square to I for every m∈ℤ | All involutions infinite; fixed Weyl coset remains finite. |
| 0.4 positive-root independence | SL₂,ρ=1,reflection w | ρ−wρ=2∈X*; projected coset unchanged | Base choice does not alter Y. |
| 0.5 moderate symbols | exp(z),exp(−z²); z=iy | Norms 1,e^{y²}; exp(z) bounded by e^M on abs(Re z)≤M | First moderate, second excluded. |
| 0.5 polynomial degree and products | z,z² on z=iy | Weighted degree bounds: abs(y)/(1+abs(y))≤1; abs(y)²/(1+abs(y))²≤1 | Exponents −1,−2 and product −3 agree. |
| 0.5 restriction of conditions | Θ={1,−1} versus {1}, μ=1 | Every relevant exponent-zero seminorm equals 1 | Inclusion direction correct; unchanged. |
| 0.6 rapid ideal and invariants | μ=e^{z²},ν=z²,W={±1} | Product at iy is −y²e^{−y²}; μ(−z)=μ(z) | All powers bounded; invariant rapid symbol persists. |
| 0.6 zero dimension | Unique tuple, constant c | Every seminorm equals abs(c) | Rapid and moderate spaces both ℂ. |
| 0.7 sharp support | U(1),1 and damped sinc | 1 nonzero at all n; sinc values 1 at 0,0 at n≠0 | Unit fails sharpness; finite-support model succeeds. |
| 0.7 module and Weyl action | Damped sinc multiplied by exp(z), reflection z↦−z | At integers product values remain 1,0; support {0} reflected to {0} | Module law and finite Weyl products preserve support. |
| 0.8 nonzero sharp interpolation | U(1), target 0 | Damped sinc at 0 equals 1 | Normalization divides by nonzero scalar; unchanged. |
| 0.9 crossed-product action | t₁z, t₁(z²), t₁t₂z | z−1,(z−1)²,z−3; z·t₁1=z while t₁(z·1)=z−1 | Pullback order and noncommutation correct. |
| 0.9 polynomial preservation | s(z)=−z, divided difference; plain division | z↦2,1↦0; 1/z remains singular | Polynomial-preserving hypothesis discriminates. |
| 0.10 removable poles and estimates | f=z,z²+z | (f(z)−f(−z))/z=2 in both examples; at 0 equals 2f′(0)=2 | Extension and derivative value agree; unchanged. |
| 0.10 extended seminorm | μ=e^{−z²} on z=iy | Polynomially weighted magnitude tends to ∞ | Infinite right-hand seminorm is allowed. |
| 1.1 real Schwartz comparison | Compact group; split torus t=e^x | Compact seminorms bounded; e^{−√abs(x)} fails algebraic decay since e^{r abs(x)−√abs(x)}→∞ | Nash height distinction retained. |
| 1.2 imported action comparison | Gaussian e^{−πx²}, t=0; one-point group | Both integrals 1; both actions f(1)v | No second integrated-action construction. |
| 1.2 convolution and faithfulness | Mass-one circle f=e₋₁ | Fourier coefficient at mode 1 is 1, at mode 0 is 0; R(f)²=R(f) | Nonzero transform detected; unchanged. |
| 1.3 rapid multiplier | Split additive Fourier model μ(z)=e^{z²},λ=it | Scalar μ(it)=e^{−t²}, value 1 at 0 | Rapid output compatible with noncompact support. |
| 1.4 translated tensor characters | Torus τ of weight 1 | Character α goes to α+1; t₋₁z(α)=α+1 | Annihilator root sign agrees. |
| 1.5 generic tensor semisimplicity | Weights ±1 at parameter 2; SL₂ reducibility at ρ | Shifted characters 3,1 distinct; at ρ non-split discrete-series/trivial extension | Exceptional semisimplicity not continued. |
| 1.6 rapid L² multiplier estimate | One spectral coordinate t=0,1 | μ(it)=1,e⁻¹; multiplication scales the norm by 1,e⁻¹ | Character-strip containment suffices. |
| 1.7 centroid identities | Nonabelian S₃, δ_a*δ_b=δ_ab,T₂=2id | T₂(δ_ab)=2δ_ab=T₂δ_a*δ_b=δ_a*T₂δ_b | Both centroid laws tested; unchanged. |
| 1.7 kernel of symbol action | SU(2), μ=(e^{z²}sin(πz)/(πz))² | μ(0)=1; μ(±(n+1))=0 for all highest weights n≥0 | Nonzero symbol may induce zero multiplier; unchanged. |
| 1.8 finite type detection | Compact U(1) retaining 0; split rank-one torus | Compact surviving type {0}; split parameter t ranges over ℝ | Finite types do not imply finite representations. |
| 1.9 support-stage definition | C=∅; C={1},J≠{1}; C=J | Contained-coset counts 0,0,1; actual stages 0,0,S(G∞) | Applied F01; former singleton count was 1. |
| 1.9 two-coset comparison | C=JxJ⊔JyJ | Restriction/extension sends (u,v) to values u,v and back; coordinate pairs (1,0),(0,1) independent | Applied F01; exactly two copies. |
| 1.9 nonabelian invariance model | S₃,J={1,(12)} | Double-coset sizes 2,4; C={1,(13)} meets 2 but contains 0; C=S₃ contains 2 | Repaired criterion survives noncommutativity. |
| 1.9 trivial-level boundary | J={1},C={1} in a discrete group | One contained coset; stage S(G∞) | J≠{1} is necessary in singleton negative control. |
| 1.9 stage multiplier compatibility | Zero stage; two contained cosets, multiplier 2 | 0 maps to 0; (u,v) maps to (2u,2v) | All dependent stagewise actions remain valid. |
| 1.9 convolution/level transitions | C=J,vol(J)=1; scalar real multiplier 2,finite scalar 3 | 1_J*1_J=1_J; either action order gives 6 | Support/level compatibility unchanged. |
| 1.9 finite-place test space | ℚ_p×,p=2,3; f(p^m u)=e^{−m²} | At m=0,1,2 values 1,e⁻¹,e⁻⁴; valuation support all ℤ; (1+abs(m))^r e^{−m²}→0 | Applied F02; rapid infinite support remains outside C_c∞. |
| 1.9 tensor completion | Gaussian Σ 2⁻ⁿφ_n(x)φ_n(y) with independent Hermite φ_n | Coefficient matrix has nonzero diagonal entries 2⁻ⁿ of unbounded rank | Infinite smooth sum is not a finite sum of pure tensors. |
| 2.1 weight comparability | w=1; multiplicative w(t)=e^t | Constant comparison 1; w(2t)/w(t)=e^t→∞ | Positive example and failing model agree. |
| 2.1 powers, inverses, equivalents | w(t)=t² on ℝ_{>0},u∈[1/2,2]; w′=4w | Ratios u²∈[1/4,4]; reciprocal ratio u⁻²; L² norm ratio 2 | Weight operations and equivalent topology correct. |
| 2.2 Franke weights and order | G_m,λ=1,t=2; character norm t | d₀=1,d_λ=2,d_{2λ}=4,d_{−λ}=1/2; on t≥1,1≤t≤t² | Product, power, inverse and chamber order agree. |
| 2.3 depth construction | GL₂ Borel at abs(a)=4; P=Q | Single-root minimum 4; identity CT=1,δ_P^P=1 | No empty root minimum introduced. |
| 2.3 restriction of scalars | Degree 2,diagonal idele norm 2 | Norm character 4; relative root 4^{1/2}=2=diagonal depth | Compatible subgroup formula unchanged. |
| 2.4 quotient Ξ | Compact quotient; measure scaled by 4; modular cusp | Positive bounded Ξ; scale 1/2; at y=4,Ξ comparable to 2 | Inverse square-root and cusp sign correct. |
| 2.4 logarithmic integrability | Modular cusp,d=2 | Ξ²dxdy/y² gives dy/y; ∫_1^∞(1+log y)⁻²dy/y=1 | Existential negative logarithmic exponent works. |
| 2.5 SLF fixed levels | Trivial finite factor and one-dimensional representation | Every V^J=ℂ; all transitions id | Stage topology comparison retained. |
| 2.5 closed image versus quotient | z↦2z; zero map ℂ→ℂ | Unit disc image radius 2; zero-map kernel ℂ,quotient/image both 0 | Original domain is not identified with zero image. |
| 2.6 weighted L² | φ(x)=(1+abs(x))⁻¹,w=1 or (1+abs(x))² | Integrals of norm-square 2 and ∞ | Inclusion direction and arbitrary representatives correct. |
| 2.6 Franke comparison | p=1,2 and w=p² versus w=p | Norm factors 1,2 versus 1,√2 | Parent smooth stage agrees exactly at w=p². |
| 2.6 reciprocal pairing | One point,w=4,u=v=1 | Weighted norms 2,1/2; product 1=abs(pairing) | Reciprocal weight is correct. |
| 2.7 Sobolev evaluation | Circle e₀,e₁,w=4,Ξ=1 | Values have norm 1; zeroth weighted norm 2 and w⁻¹ᐟ²=1/2 give product 1 | Weight exponent agrees. |
| 2.7 regularization | Circle point evaluation and f=e₋₁ | Regularized vector e₁ has coefficient 1 and smooth derivatives | Smoothing uses the smooth representative. |
| 2.8 nuclear inclusion | Circle H^{s+2}→H^s versus fixed Hilbert identity | Singular values (1+n²)⁻¹ sum π coth π≈3.153; identity singular values sum ∞ | Smooth/stronger-seminorm input matters. |
| 2.9 zeroth rapid spaces | Compact discontinuous indicator; cusp n⁻² | Every weighted sup finite on compact support; at exponent 3 cusp value n→∞ | S₀ differs from continuous S₀⁰ and excludes fixed tails. |
| 2.10 quotient Schwartz | Compact smooth vector; cusp y⁻ᵃ | Compact seminorms finite; exponent N>a gives y^{N−a}→∞ | Every decay exponent is required. |
| 2.10 weighted-L² intersection | Cusp y⁻ᵃ with measure dy/y² | At weight y^N,integrand y^{N−2a−2}; integral diverges when N≥2a+1 | Supremum and all-weight L² descriptions reject same tail. |
| 2.11 Harish-Chandra quotient decay | φ=Ξ exp(−√σ); fixed tail Ξσ⁻ᵃ | Normalized seminorm σ^d e^{−√σ} bounded; σ^{d−a} unbounded for d>a | Logarithmic Schwartz distinction correct. |
| 2.12 weighted measures | 3δ_x,w(x)=2; distinct points,w=1 | Norm 3/2; norm of δ_x−δ_y is 2 | Reciprocal weight and lack of norm continuity retained. |
| 2.12 measure/distribution boundary | Circle δ₀ versus δ₀′ | δ₀(eₙ)=1; derivative values −2πin have unbounded magnitude | Positive-order distribution is not a finite measure. |
| 2.13 uniform growth | Constant 1; exp(iy²),D=y d/dy | Constant derivatives 0; first derivative 2iy²exp(iy²),kth has degree 2k | One exponent for every derivative excludes oscillatory model. |
| 2.13 density distinction | Constant 1 and compact cutoff on a noncompact quotient | Fixed T₁ sup distance ≥1; in stronger n^ε denominator tails ≤R⁻ε→0 | Union-density does not imply fixed-stage density. |
| 2.14 relative weighted decay | w=1 or n; φ=1 | w=1 seminorm n⁻N≤1; w=n and r>N gives n^{r−N}→∞ | S₁=T; S_n=S; constant excluded in latter. |
| 2.14 comparison direction | w′=n²,w=n; function e^{−n} | n^{2r}e^{−n} and n^r e^{−n} bounded | Stronger weight implies weaker relative decay condition. |
| 2.15 tensor product comparison | Two compact circles,e_m⊗e_n | Product e^{2πi(mx+ny)}; L² norms 1·1=1 | Product measure and tensor directions agree. |
| 2.16 CT/EP identities and adjunction | P=Q,φ=ψ=1,quotient mass 1 or 2 | One summand; CT=EP=id; pairings 1=1 or 2=2; incompatible rescaling gives 2≠1 | Measure and identity cases retained. |
| 2.16 compact/zero support sum | φ=0; P=Q nonzero φ | Zero contribution; exactly one term φ(x) | Finite-fiber support argument agrees. |
| 2.17 approximation by constant term | Cusp zero constant term,tail e^{−y},r=1 | CT=0; sup_{y≥0} y e^{−y}=e⁻¹ | Arbitrary depth gain with a common height exponent retained. |
| 2.18 graph embedding and dual sum | Identity parabolic; zero constant terms on cusp vector | Graph includes v with norm ‖v‖; CT-only image 0 would lose nonzero v | Identity component indispensable; unchanged. |
| 3.1 relative-character tensor and trace | One-dimensional K-type,A=a and basis v or 2v | Unit basis gives a; doubled vector gives 4a; unit phase leaves a | Orthonormal and conjugate-factor requirements discriminate. |
| 3.2 adjoint parameter | λ=1,it; additive g=1_[0,1] | −conj λ=−1,it; I(1,g)*=e−1=I(−1,g*),while I(1,g*)=1−e⁻¹ | Smooth approximations separate same sign; unchanged. |
| 3.2 factorized character identity | Linear-first B,A=2,T=i | B(AT,1)=2i=B(A,T*) with T*=−i; B(A,T)=−2i | Correct second-slot adjoint. |
| 3.3 support annihilators | Two blocks ℂ²,v=(2,3),X=∅,{1},all | 0,(2,0),(2,3) | Both annihilator directions and extremal subsets agree. |
| 3.4 projection algebra | P₁,P₂ on ℂ²,v=(2,3) | P₁P₂v=0; P₁²v=(2,0); (P₁+P₂)v=v | Intersection, idempotence and sum laws agree. |
| 3.4 unconditional versus absolute sum | ℓ² basis terms e_n/n | Squared norms sum π²/6; norms sum ∞; for faster-decay terms e_n/n² norms sum π²/6 | Absolute summability needs stronger input. |
| 3.5 regularity | GL₂ equal/distinct characters; M=G | Stabilizer orders 2,1,1 respectively | Weyl regularity is not infinitesimal-character inequality. |
| 3.6 weighted CT family | GL₂ δ=4,s=1 or 0 | δ^{s−1/2}=2 or 1/2 | Half-density correct; boundary decay not asserted. |
| 3.7 Lapid expansion | Compact torus mass 1,φ=eₙ; φ=0 | Pairings δ_{mn}; reconstructed vector eₙ; all zero coefficients for 0 | Block condition, Fourier sign and normalization agree. |
| 3.8 kernel realization | One-point group; circle f=e₋₁ | Scalar kernel f(1); circle kernel e₁(x)e₋₁(y) sends e₁ to e₁ | Point/adjoint construction and integral direction correct. |
| 3.8 normalized central kernel | GL₂ δ=4 | Central integrand multiplied by 1/2 | Same half-density as conventions and §3.6. |
| 3.9 kernel support bounds | One-point group,w=2,K_f=a | q(a)=abs(a); p(f)=2abs(a),then p(f)/w=abs(a) | Reciprocal weight agrees; N₀ quantifier unchanged. |
| 3.10 complex derivative kernel | Circle X=1,Y=iD−1,f=e₋₁ | Ye₋₁=0,Ye₁=−2e₁; corrected kernel 0,R(Y)f=0 | Bound 0≤p(0)=0; rejected conjugation would give 2≤0. |
| 3.10 real derivative kernel | Same f,Y=D | Kernel coefficient −i; R(D)f coefficient −i | Real derivative sign also agrees. |
| 4.1 T-characters and units | GL₁ Laurent polynomial T at 2,3; T all places | Values 2,3; every 1_K evaluates to 1; empty Hecke tensor ℂ | Finite support and restriction direction retained. |
| 4.2 CAP definition | Torus; GL₂ Borel; T all places | Number of proper torus parabolics 0; Borel inducing datum supplies CAP; retained-place conditions empty for full T | Fixed-inner-form and finite-place quantifiers correct. |
| 4.3 mixed multiplier | Symbol value 2,Hecke value 3; zero symbol | Evaluation 6; zero gives 0 | Action bilinear and multiplicative, without a spurious unit. |
| 4.4 quasi-cuspidal property | Zero f; anisotropic G/Z; GL₂ residual constant | Operators 0; P_cusp=id; positive compact f gives eigenvalue ∫f>0 on constant | Last function fails quasi-cuspidality. |
| 4.4 ideal laws | R(f) range in cusp,R(g) preserving cusp | (1−P)R(f)R(g)=0 and (1−P)R(g)R(f)=0 | Both convolution orders justified. |
| 4.5 typicality | Compact torus,target differential 0,bad differential 1 | Both derived Casimirs 0; central projections 0 versus 1 | Central condition rejects false Casimir-only model. |
| 4.6 finite-rank Casimir set | Toy eigenvalues n²,n≥1,each doubled | Count 2⌊√R⌋; distinct-value reciprocal sum Σn⁻²=π²/6 | Multiplicity counted spectrally,not repeated in zero set. |
| 4.7 finiteness of typical data | Central lattice ℤ,target image {0,1} | Intersection size 2; ignoring central condition leaves infinitely many Casimir-zero characters | Central lattice contract necessary. |
| 4.8 annihilation of fibers | Bad Casimir 2,target 3; empty bad set | q−2 has values 0,1 on bad/target; empty product 1 | Sharp seed still retained; denominator for normalization nonzero. |
| 4.8 full twist direction | Polynomial q on quotient killing inducing coordinate s | q(c,s)=c; q(c,s)−2=0 at c=2 for every complex s | Whole induced family,not one real twist,is killed. |
| 4.9 finite surviving components | One retained split inducing datum | One block,continuum s∈iℝ | Finite block list does not claim finite spectrum. |
| 5.1 simultaneous occurrence | Infinity forces s=0; finite value 2^s,target 2 | At s=0 finite value 1≠2; at s=1 finite value 2 but wrong infinity | Same complex parameter must solve all equations. |
| 5.2 mixed separation | Full-group unwanted Hecke value 2,target 3 | h−2 has values 0,1; sharp seed normalized to 1 preserves target 1 | Allowed sharp tensor separates; unchanged. |
| 5.3 normalization and range | Two target factors 2,3; killed block | Product 6; normalized target 6/6=1,killed value 0/6=0 | Nonzero denominator established; surviving full block need not have scalar 1. |
| 5.4 non-CAP isolation | No proper occurrence; arbitrary character on cusp domain | Proper surviving-block count 0; cusp intersection equals χ-cuspidal eigenspace | Domain distinction retained. |
| 5.5 preservation without occurrence | Representation scalar μ(χπ)=1,automorphic π-block absent | π(μ⋆f)=π(f); automorphic range in zero subspace gives operator 0 | External π-action and automorphic occurrence distinct. |
| 5.6 GLₙ support uniqueness | Satake multisets {2,3},{2,2} | Polynomials 1−5T+6T² and 1−4T+4T² | Multiplicities and cuspidal-support endpoint retained. |
| 5.7 refined discrete data | PGL₂,q(λ)=λ²−1/4; λ=it,0,1/2 | Values −t²−1/4,−1/4,0 | Continuous Borel datum can be retained while residual constant excluded; reverse impossible at λ=ρ. |
| F03 scope normalization | CongruenceSpectralGap r=0,1/5; metric 2g | λ=1/4,21/100; rescaling eigenvalues gives 21/200 | Owner's curvature/threshold distinction agrees; only citation changed. |

Every changed mathematical assertion is included above. Recomputing the affected §1.9 examples changes the singleton and partial-coset stages to zero; it leaves the two-contained-coset comparison, compact support, tensor completion, convolution and commuting scalar actions consistent. All other rows leave the existing statements and Checks unchanged.

## Required check outcomes

- Suggested.lean elaboration from the supplied content checkout: exit 0. The exact invocation was lake env lean with the absolute package Suggested.lean argument specified by the brief. Its only output was the three expected “declaration uses sorry” warnings at Suggested.lean:85:8, :98:8 and :108:8. There are no TauCeti imports, so no preliminary module build applies.
- The scratch all-ten-declaration #check @name audit: exit 0, with the same three sorry warnings. All displayed signatures match the README; no dropped hypothesis or changed binder was found.
- Dependency check: exit 0, with exact output below. No UPWARD, CYCLE or moved line was emitted.

```text
depcheck: 52 roadmaps, 589 edges, 0 problem(s)
```

- Citation resolver: exit 0; “Cross-roadmap citations found nowhere: None” and “Lean names found nowhere: None.” Its external-library-name limitation was handled by the separate pinned-file inspection above.
- Structural checks: ten declarations, all ten named in README; exactly one import, import Mathlib; three sorry theorem bodies; no set_option. The 26 plan and README gap slugs agree; design/plan.json is unchanged. The stale patterns “meeting C,” “planned in SR.3,” “CSG.n” and “bplzz line 1056” have no occurrence in the editable roadmap text.
- Whitespace check: git diff --check exited 0. No gate failures were listed in the brief; none needed an additional repair.

## Maintainer notes

Only packages/AutomorphicSpectralTheoryPartII/README.md and this report changed. Suggested.lean, metadata.toml, sources.toml and design/plan.json remain unchanged. All sources retain their original manifest keys; no new work, duplicate source key or missing-reference request was needed. Bernstein remains settled as uncertified and is cited only by locator. No source passage was copied.

Frozen non-gap design records still contain the erroneous SR.3 attribution and CSG labels, as does packages/AutomorphicSpectralTheoryPartII/design/README.md. The top-level-only permission for design/plan.json and the exclusion of the design README prevent editing them here. Earlier reports also retain the former support-stage Check; they are historical records, not the repaired roadmap. These limitations do not require a supplier change.

No declaration was renamed or deleted, and no downstream Lean citation changes. Transfer preservation remains the previously settled external ownership matter; it was not re-raised or reassigned. No files outside the authorized package files and scratch work were edited, no commit was made, and no Lean process remains running.
