# Repair report: AutomorphicSpectralTheoryPartII

## F01 (P1) — applied

Section 3.10: conjugate of the Y-derivative → Y-derivative of the conjugate Eisenstein function; R(Y)f on the right is unchanged. Added complex and real circle-derivative Checks. The complex test changes the false 2≤0 into 0≤0. Evidence: bpcz line 2496, Lemma 2.10.2.1, printed p.240, including inspection of the printed overline.

## F02 (P2) — applied

Duplicate frechet-open-mapping gap → SpectralManifolds SM3 import. Deleted exactly that top-level plan gap and its README contract; updated scope, supplier contracts, §2.5, §2.18 and Layer 2 dependencies. The SLF application remains here. Added the radius-2-disc and zero-map quotient Checks. SM3 explicitly owns the required Fréchet theorem and closed-subspace quotients.

## F03 (P2) — applied

Section 1.2’s construction of Schwartz integration → comparison with the supplied action, transporting continuity, convolution and compact-test agreement. Updated scope, exact supplier contract and §2.5 wording. Kept differentiation signs and Fourier faithfulness here. The proof route now uses the local §1.1 comparison, supplier compact-test density and continuity, rather than rebuilding integration and Fubini.

## F04 (P3) — applied

Both misplaced AL.3 “Isobaric construction” locators → preparatory GLₙ isobaric sums, anchor isobaric-construction; strong multiplicity one stays in AL.3. Added a §5.6 Check computing 1−5T+6T² for values 2,3 and 1−4T+4T² for a repeated value 2. The existing §5.6 Needs citation to uniqueness remains correct.

## Verification, ownership and pattern search

All four findings are mathematically supported. No source passage was copied into the package. Sources remain under their existing manifest keys; no new work or missing-reference request was needed. Bernstein remains the settled uncertified reference, cited only by its locator. There were no gate failures supplied in the brief.

For F01, the legal cached published PDF was rendered and printed p.240 inspected. The bar covers the Eisenstein function after R_y(Y), not the derivative. The differentiation identity in bpcz line 2524 also moves the two kernel derivatives to L(X)R(Y)f. With D=(2π)⁻¹d/dx and f=e₋₁, Df=−if, so (iD−1)f=0. On the first Fourier mode (iD−1)e₁=−2e₁. The old conjugation therefore produces absolute value 2; the corrected term is zero. A norm-one torus with a nontrivial automorphic character gives the same zero-dimensional inducing-family test. No restriction to real enveloping elements was introduced.

For F02, SpectralManifolds SM3 explicitly treats complete metrizable locally convex real or complex spaces, closed subspaces and their quotients. This is mathematical supply, not a claim of a pinned Lean theorem. The inspected Mathlib result ContinuousLinearMap.isOpenMap is the Banach theorem, with complete normed-space assumptions, in Mathlib/Analysis/Normed/Operator/Banach.lean:228. For a closed-image Fréchet map, its kernel is closed, both quotient and image are Fréchet, and the induced continuous linear bijection has continuous inverse by SM3. The SLF comparison additionally uses the retained compact-isotypical direct-sum contract; no arbitrary strict-LF open mapping theorem is inferred. BPCZ’s relevant direct-sum proof is at bpcz line 1231 through line 1251; its overly strong closed-image/injectivity wording at bpcz line 1217 is not restored.

For F03, AutomorphicFormsOnReductiveGroups §0.3 supplies the Schwartz algebra, compact-test density and convolution; §2.7 supplies the SF category and its continuous nondegenerate Schwartz action. The relevant native README locations are lines 130, 459 and 467. The §1.1 comparison used by the repair is this package’s real Schwartz comparison, not the supplier’s relative-cohomology §1.1. Integration and the representation scope also agree with bplzz line 516 and line 532. No new action carrier or generic integration theorem is planned here.

For F04, AutomorphicLFunctionsAndLocalFactors has the isobaric-construction anchor immediately before its preparatory GLₙ isobaric sums target at README line 271. Its AL.3 strong multiplicity-one target is at line 2288 and explicitly consumes that prerequisite. The target includes multiplicities and norm twists, as required by §5.6. The local polynomial calculation tests the normalization; global uniqueness is the imported theorem, not a consequence asserted from one local polynomial.

The pattern search covered README.md, Suggested.lean, metadata.toml, sources.toml and design/plan.json. The only erroneous derivative occurrence in the editable roadmap text was §3.10. Sections 3.8–3.9 and Layer 3 Examples keep the same right-convolution kernel convention; §3.2’s separate adjoint identity still correctly uses −conj(λ). Both misleading construction locators were replaced. Both open-mapping consumers were replaced, and all action-construction language in §1.2 and its supplier/SLF descriptions was reconciled. No Lean declaration names changed.

The brief permits editing design/plan.json only in its top-level gaps list. Its frozen non-gap node records still contain the earlier kernel transcription in the kernel-spectral-expansion statement and source match, and the earlier integrated-action construction in schwartz-integrated-action. Those records were identified, not silently edited. README.md is the repaired roadmap. The JSON comparison confirms that every non-gap field is unchanged as parsed data, and the only deleted gap is frechet-open-mapping.

### Supplier citations checked

The main checkout inspected was 5f173a7b9ac37eb6b62d01eb3db5047b92d19363. The roadmap service checked the index of 362 open roadmap pull requests at their indexed heads. The three repaired supplier heads were SpectralManifolds c87f958, AutomorphicFormsOnReductiveGroups c00e220 and AutomorphicLFunctionsAndLocalFactors 5d22a23; each is indexed as a new roadmap. Object searches used the service over indexed open texts and main, and direct searches of board packages and main. Ownership was checked against the available indexed open files, including the siblings named in the brief; no unspecified pull-request checkout was sought. ComplexTori and LocalGaloisGroups on main were read for roadmap shape.

| Supplier | Resolved section or target consumed/acknowledged |
| --- | --- |
| AutomorphicSpectralTheory | §§0.11–0.15, integration at §0.12 and holomorphic families at §0.15; §§1.5–1.10, with pseudo-Eisenstein construction at §1.6, datum spaces at §1.9 and orthogonal decomposition at §1.10; Layers 2–4, §§3.1–3.4, §§4.7–4.14, §§5.1–5.9 and §§6.1–6.4. The rapid, counting and normalization supplements remain explicit gaps. |
| AutomorphicFormsOnReductiveGroups | §§0.1–0.5, §§2.1–2.4, §2.7, §§3.4–3.5 and §§4.1–4.2. Section 0.3 owns the group Schwartz algebra; §2.7 owns its integrated SF action. |
| SpectralManifolds | SM3, Smooth projective modules, functions and spectral measure: Fréchet open mapping and closed-subspace quotient comparisons. |
| AdelicAlgebraicGroups | §§2.1–2.3, §3.1, §§3.4–3.6 and §§4.6–4.7: split-centre and measure conventions, parabolics, heights, cusps and compact Fourier theory; intermediate-quotient supplements stay gaps. |
| SmoothRepresentationsOfLocalGroups | SR.1.1–SR.1.3, SR.2.2 and SR.4.1–SR.4.2: finite-place convolution, induction and normalized Satake/spherical characters. |
| ReductiveGroups; RepresentationTheory/LieGroups | Layer 7 structure/root data; Layers 6–7 compact tori and real forms. The specified real-point and descent comparisons remain gaps. |
| NoncommutativeGeometry | N1: Hausdorff completed projective tensor, finite sums, functoriality and complete-target universal property. Main copy used. |
| OperatorTheory/OperatorIdeals | OI-B32–OI-B41, OI-B84 and Part C: Hilbert–Schmidt energy, gauge, ideals and column realization. Main nested file inspected. |
| OperatorTheory/SelfAdjointSpectralTheory | Parts A–E: self-adjoint spectral calculus and its native operator carriers. Main nested file inspected. |
| PDE | Lane A: weak derivatives, Sobolev spaces, local embedding and regularity; weighted quotient comparison stays the named gap. |
| VonNeumannAlgebras | V4.Core: Hilbert–Schmidt pairings and trace-class duality; the nuclear-convention composition supplement remains a gap. |
| GlobalHolomorphicFunctions | Preparatory primary factors and locally uniform products; constant-genus global growth is the retained local extension. |
| ZerosOfLFunctions | Standing finite-order convention and Layer 5 items 1–6; genus-one Hadamard theory stays with that supplier. |
| ModularCurvesPartII | §1.4a, Lattice sigma function: period-lattice specialization acknowledged in scope. |
| AutomorphicLFunctionsAndLocalFactors | Preparatory GLₙ isobaric sums, isobaric-construction; AL.3 Strong multiplicity one for isobaric sums. |
| CongruenceSpectralGap | Layers 0–5, corresponding to CSG.0–CSG.5 design labels: congruence Laplacian gap and curvature normalization acknowledged in scope. |
| GanGrossPrasadUnitaryGroups | §§6.3–6.4: relative spectral contribution and comparison. Transfer preservation remains a separate external ownership matter; the earlier settled finding about it was not reopened. |

No new construction was added beyond the repairs. Generic Fréchet analysis and Schwartz integration have their existing owners; the SLF application, derivative comparison, Fourier faithfulness and automorphic isolation extensions remain this Part II’s responsibility. The dependency check below verifies the resulting supply direction without changing merge-order/ORDER.txt.

### Pinned-library audit

Both package checkouts agree with content/lake-manifest.json: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Paths below are relative to the respective pinned library root. Native definitions were opened rather than inferred from names.

| Declaration and file | Native content and relevant boundary |
| --- | --- |
| SchwartzMap, Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean:75 | A function with real smoothness and every weighted iterated-derivative bound on real normed spaces. It is not a reductive-group Schwartz carrier. |
| Differentiable, Mathlib/Analysis/Calculus/FDeriv/Defs.lean:170 | DifferentiableAt at every point over the specified scalar field. |
| Complex.exp, Mathlib/Analysis/Complex/Exponential.lean:62 | The actual Taylor-series exponential limit. |
| MvPolynomial.eval, Mathlib/Algebra/MvPolynomial/Eval.lean:256 | Ring-homomorphic evaluation, including zero and constant polynomials and Fin 0. |
| Polynomial.eval, Mathlib/Algebra/Polynomial/Eval/Defs.lean:249 | Evaluation by the identity coefficient homomorphism. |
| HasProd and Multipliable, Mathlib/Topology/Algebra/InfiniteSum/Defs.lean:106 and :114 | Unordered finite-subset convergence and existence of a limit; Summable is the additive counterpart. Neither countability nor exclusion of zero is supplied by this predicate. The total product’s fallback is 1, so the headline explicitly requires rank summability. |
| MeasureTheory.Lp, Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:89 | Finite eLpNorm inside the almost-everywhere function carrier. No canonical pointwise evaluation of arbitrary representatives. |
| CentroidHom, Mathlib/Algebra/Ring/CentroidHom.lean:56 | Additivity and both multiplication laws; no topological continuity or complex-linearity field. |
| ContinuousLinearMap.isOpenMap, Mathlib/Analysis/Normed/Operator/Banach.lean:228 | Surjectivity in its complete normed-space context; does not replace the imported arbitrary Fréchet theorem. |
| TendstoLocallyUniformlyOn.differentiableOn, Mathlib/Analysis/Complex/LocallyUniformLimit.lean:135 | Holomorphic limits on an open domain under local uniform convergence; not prescribed-zero interpolation with the global order bound. |

Object searches of the pinned Tau Ceti analysis and representation files did not provide the adelic quotient Schwartz, Eisenstein-inducing or cuspidal-support carriers named as missing in the module docstring. Finite-field GL₂ cuspidal characters and the Fréchet–Kuratowski embedding are different objects. No TauCeti import is used or needs a targeted build. The three retained analytic headlines contain the canonical product, polynomial pullback or affine lattice actually defined in this roadmap; none is a theorem about unrelated free scalar variables.

## Adversarial mathematics pass

These are independently recomputed instances, not claims that examples prove general analytic theorems. Rows distinguish a positive model from a wrong convention or inadmissible input. The base field is a number field and coefficients are ℂ: zero rings, positive-characteristic global fields, inseparable extensions and nonreduced base schemes are outside these signatures. Finite places of residue characteristic 2 and 3 remain in scope. Circle measure has mass 1, e_n(x)=exp(2πinx), D=(2π)⁻¹d/dx; comparison weights use the displayed representatives rather than claiming canonical equality within ≍.

| Statement | Instances tried | Values computed | Result and change |
| --- | --- | --- | --- |
| Global dimension and zero objects | Fin 0; trivial group; zero representation | Fin 0→ℂ has one element; empty products are 1; every action on the zero vector is 0 | Retained; no hidden positive-rank condition. |
| Linear-first pairing | Scalars 1 and i | 1·conj(i)=−i; native inner product with slots 1,i gives i; exchanging slots gives −i | Retained. |
| Left derivative convention | Additive character at t=1,2 | Integral of −f′e^{itx} is it times the transform: factors i and 2i | Retained; opposite sign would give −i and −2i. |
| Translation versus tensor weight | Coordinate z, shift 1 | t₁z=z−1; tensoring weight 1 changes α to α+1 | Retained; the operations use opposite shifts. |
| Adjoint and normalized induction | λ=1,it; GL₂ modulus 4 | −conj(1)=−1, −conj(it)=it; induction factor 2 and central-disintegration factor 1/2 multiply to 1 | Retained across §§3.2, 3.6 and 3.8. |
| Right convolution and its adjoint | Circle modes 0,1 | R(e₋₁)e₁=e₁, R(e₁)e₁=0; e₋₁*=e₋₁; constant kernel coefficient 1 | Retained in conventions and §§3.8–3.10. |
| Finite-place normalization | Residue cardinalities 2,3,4 | Positive square roots √2,√3,2; vol(K)=1 gives 1_K*1_K=1_K | Retained at every residue characteristic. |
| 0.1 rank definition | Empty set; {0}; ℤ | Nonzero inverse-power sums 0,0; at p=1 for ℤ the sum is π²/3, whereas at p=0 it diverges | Retained; least ranks 0,0,1. |
| 0.1 discreteness and counting | Points 1/(m+1); integers | Reciprocal-power terms (m+1)^{p+1} fail to tend to 0; integer disk count is 2⌊R⌋+1 | Retained; accumulation is rejected. |
| 0.1 subsets and rank monotonicity | {2,4}, p=0,1; delete 2 | Sums 3/4 and 5/16; subset sums 1/4 and 1/16 | Retained; bounded points of norm below 1 are handled separately. |
| 0.2 elementary factor | p=0,1,2 at w=0,1,2 | Values at 0: 1,1,1; at 1: 0,0,0; at 2: −1,−e²,−e⁴ | Retained; empty exponent sum is zero. |
| 0.2 elementary-factor derivative | p=0,1,2 at w=1; p=0,w=0 | Derivatives −1,−e,−e^{3/2}; at the last point −1, including the 0^0 convention | Retained; simple zeros in every genus. |
| 0.2 canonical product and origin | Λ empty, {0}, {0,a}; p=0 | Products 1,z,z(1−z/a); last derivatives at 0,a are 1,−1 | Retained; a≠0 prevents every denominator from vanishing. |
| 0.2 partial products | Λ={0,1,2}, z=3, p=0 | Empty index 3; index {1} gives −6; {1,2} gives 3 in either order | Retained; all insertion and reordering laws agree. |
| 0.2 finite-order predicate | 1, e^{z²}, e^{e^z} | Bounds e and e^{(1+abs(z))²}; for the last function log magnitude on x>0 is e^x, exceeding every C(1+x)^d | Retained; holomorphy remains a separate hypothesis. |
| 0.2 finite-order API | e^{z²}, e^{z³}, polynomial pullback z² | Product bounded by e^{2(1+abs(z))³}; sum by 2e^{(1+abs(z))³}; pullback of e^{z²} is e^{z⁴} | Retained; constants absorbed by a larger positive C. |
| 0.2 product headline | Λ={0,1}, p=0 | Partial products stabilize to z−z²; zeros exactly 0,1; derivatives 1,−1; bound abs(z−z²)≤R+R² on radius R | Retained; every headline conjunct has the expected boundary value. |
| 0.3 rapid predicate | e^{z²}, e^{−z²}; dimension 0 | On z=iy magnitudes e^{−y²},e^{y²}; in dimension 0 the seminorm is the absolute value at the unique point | Retained; constant 1 fails positive-dimensional rapid decay at power 1. |
| 0.3 polynomial-fiber headline | ψ(w)=w−1,q=z²; ψ=0; constant q | ν=e^{z⁶}(z²−1) has exactly zeros ±1; zero ψ uses ν=0; a nonzero constant fiber uses zero-free damping | Retained; both directions of the zero-set equality. |
| 0.3 zero-dimensional polynomial fiber | The sole input, ψ(q)=0 or ≠0 | ν=0 gives 0=0; ν=1 gives 1≠0 | Retained; zero polynomial needs no degree-of-zero convention. |
| 0.3 affine lattice definition | k=0; b₁=1; b₁=b₂=1 | L={a}; L=a+ℤ; repeated generators identify coefficient vectors (1,0),(0,1) | Retained; independence excludes the last model. |
| 0.3 lattice-interpolation headline | L=ℤ,A={0,1/2}; n=k=0 | Damped sinc takes 1 at 0, 2e^{1/4}/π at 1/2 and 0 at nonzero integers; on the one-point space choose 0 for empty A, 1 for full A | Retained; exceptions need not lie on L. |
| 0.4 real-form eigenspaces | Split G_m; U(1) | Plus/minus dimensions (1,0),(0,1); respective Y sets {0},ℤ | Retained; split and compact directions are distinguished. |
| 0.4 finiteness and root choices | Rootless rank 2; rank-one root α=2 | Matrices with rows (1,m),(0,−1) square to I for every m; ρ=1 and −ρ=−1 differ by 2 | Retained; one Weyl coset is finite, all involutions need not be. |
| 0.5 moderate symbols | e^z,z²,e^{−z²} | On bounded-real strips, first magnitude ≤e^M, second ≤(1+abs(z))²; last has e^{y²} on iy | Retained; last function fails every polynomial bound. |
| 0.5 algebra and restriction laws | z²,z³; exponent choices −2,−3 | Product z⁵ divided by (1+abs(z))⁵ is ≤1; requiring no additional involution removes, rather than adds, inequalities | Retained; product exponents add. |
| 0.6 rapid ideal and differentiation | e^{z²}, z²e^{z²}, derivative | On iy: e^{−y²}, y²e^{−y²}, and 2abs(y)e^{−y²}; all decay against every polynomial | Retained; moderate polynomial loss is absorbed. |
| 0.6 topology and dimension boundary | Constant 1 in dimensions 0 and 1 | Every seminorm is 1 at the point; in dimension 1 the power-one strip supremum is infinite | Retained; the identity-involution compact-open control remains explicit. |
| 0.7 sharp support | U(1) unit and damped sinc; split torus | Unit has value 1 at infinitely many integers; sinc is 1 at 0 and 0 at every other integer; split discrete set has size 1 | Retained; no sharp unit is introduced. |
| 0.7 module and Weyl action | Multiply the sinc by z; reflect z↦−z | All nonzero integer values remain 0; at 0 the product is 0; reflection sends the singleton support {0} to itself | Retained; multiplication cannot enlarge support. |
| 0.8 sharp orbit interpolation | W={±1}, target ±1/2 | e^{z²}sin(πz)/z takes 2e^{1/4} at both target points and 0 at every nonzero integer | Retained; normalization divides by a nonzero number. |
| 0.9 affine action | q=f=z, translations 1,2 | t₁(qf)=(z−1)², while q·t₁f=z(z−1); t₁t₂z=z−3 | Retained; coefficient/translation order matters. |
| 0.9 reflection and rational domain | s(z)=−z; f=1,z,z²+z; multiply 1 by 1/z | Divided differences 0,2,2; arbitrary rational multiplication gives a pole 1/z | Retained; polynomial-preserving domain excludes that pole. |
| 0.10 removal and estimates | f=z²+z; translate by 1 | Divided difference extends to 2=2f′(0); at r=0,1,−1 and z=0 translation weight ratios are 1,1/2,2 | Retained; C is allowed to depend on r and the strip. |
| 1.1 real Schwartz comparison | Compact group; positive torus coordinate | Constant 1 has bounded compact derivative seminorms; t/(1+abs(log t))^N→∞ for every fixed N | Retained; logarithmic decay is insufficient for Nash decay. |
| 1.1 product comparison | Two Gaussian factors | At (0,0) product 1=1; at (1,1), e⁻¹e⁻¹=e⁻² | Retained with the declared Nash comparison input. |
| 1.2 imported action comparison | Lebesgue Gaussian at t=0; point group | Both scalar integrals are 1; both point actions are f(1)v, giving 6 for f(1)=2,v=3 | Applied F03; continuity is imported. |
| 1.2 differentiated action | π₁,π₂ | Both actions give transform coefficients i and 2i after L(X) | Applied F03; opposite sign would give −i,−2i. |
| 1.2 convolution order | S₃, a=(12),b=(23); C₂ | δ_a*δ_b=δ_ab with ab=(123), ba=(132); on C₂, δ_s²=δ_1 | Retained as algebra tests; multiplication order agrees with π(f₁)π(f₂). |
| 1.3 rapid multiplier and finite kernel | Scalar symbols 0,1; averaging over {±1} | Actions 0,id; averaging an even vector gives (1+1)/2=1, an odd vector (1−1)/2=0 | Retained; connected-derived cover and finite invariants remain. |
| 1.4 centralizer/tensor character | Torus α=1, weight 2 | Shifted central eigenvalue 3; t₋₂z(1)=3; X−3 evaluates to 0 at 3 | Retained; inverse translation has the required sign. |
| 1.5 generic semisimplicity | Parameter 2, weights ±1; reducible SL₂ parameter | Generic characters 3,1 are distinct; the exceptional principal series has a discrete-series submodule and trivial quotient rather than their direct sum | Retained; only the spectral identity continues at exceptions. |
| 1.6 rapid L² estimates | SU₂ parameters; f=0 | Realized dominant parameters start 1,2,3; 0 is absent; for zero f every derivative norm and seminorm is 0 | Retained; only containment of realized characters is used. |
| 1.7 multiplier and centroid | Constant symbols 0,1,2 in a finite convolution model | T₀δ_a=0; T₁δ_a=δ_a; all three expressions for T₂(δ_a*δ_b) equal 2δ_ab | Retained; both centroid laws tested. |
| 1.7 multiplier kernel | SU₂ Weyl-even damped sinc squared | Symbol value 1 at 0 and 0 at every realized nonzero integer; resulting representation operators are 0 | Retained; unrealized parameters do not imply faithfulness of the symbol map. |
| 1.8 finite detecting types | Spherical SL₂ twists; two limits of discrete series | Infinitely many spherical parameters share type 0; the two limit rays have minimal weights +1,−1 | Retained; finite types do not mean finitely many representations. |
| 1.9 adelic stages | Two double cosets; real scalar 2 and finite scalar 3 | Stage has independent values (1,0),(0,1); actions in either factor order give 6 | Retained; finite supports and completed real tensors remain. |
| 2.1 weight and translation law | w=1; w(t)=e^t on positive torus | Ratios 1 and w(2t)/w(t)=e^t; the latter is unbounded | Retained; positivity alone does not define a weight. |
| 2.1 inverse/power bounds | Symmetric height at t=2,1/2 | Both heights 2; inverse 1/2≤1≤2; power-a values 2^a | Retained; inversion and equivalence directions agree. |
| 2.2 Franke weights | t=2; exponents 0,1,2,−1 | Values 1,2,4,1/2; product d₁d₂=8=d₃; on t≥1, 1≤t≤t² | Retained as comparison-class representatives. |
| 2.3 depth and restriction | GL₂ at norm 2; degree-two restriction of scalars; P=Q | Root depth 2; norm character 4 with normalized relative coordinate √4=2; identity root set empty | Retained; no empty minimum or arbitrary subgroup restriction. |
| 2.4 quotient volume function | Cusp y=4; multiply measure by 4 | Volume 1/4 gives Ξ=2; rescaled volume 1 gives Ξ=1=2/√4 | Retained; reciprocal square root fixed. |
| 2.4 integrability | Cusp measure dy/y², Ξ²=y | Integral of (1+log y)⁻²dy/y from 1 to infinity is 1; exponent 0 gives infinity | Retained; sufficiently large logarithmic exponent is necessary. |
| 2.5 open mapping/quotient | z↦2z; zero map ℂ→ℂ | Unit-disc image has radius 2; zero-map kernel is ℂ and both quotient and image have dimension 0 | Applied F02; original zero-map domain still has dimension 1. |
| 2.5 compact isotypes | Regular modules of C₂,S₃ | Dimension decompositions 1²+1²=2 and 1²+1²+2²=6 | Retained SLF application, including nonabelian types. |
| 2.6 weighted L² | φ=(1+abs(x))⁻¹; weights 1,(1+abs(x))² | Squared norm 2 versus integral of 1, which diverges | Retained; increasing weight shrinks the carrier. |
| 2.6 Franke comparison | Constant p=1,2, unit-mass vector | Norms 1 and 2 for w=p²; choosing w=p at p=2 instead gives √2 | Retained; comparison is of individual stages. |
| 2.7 evaluation and smoothing | Unit-volume point/chart, w=4; circle f=e₋₁,ψ=e₁,T=evaluation at 0 | Evaluation 1=(weighted norm 2)·w⁻¹ᐟ²; T(R(f)ψ)=1=⟨e₁,e₁⟩ | Retained; reciprocal weight and pairing signs agree. |
| 2.8 nuclear inclusion | Circle Fourier derivative improvement; bare Hilbert identity | Improved singular values (1+n²)⁻¹ have finite sum; identity singular values 1 have infinite sum | Retained; the zeroth-order identity is not asserted nuclear. |
| 2.8 summability consequence | Orthogonal vectors e_n/n, then e_n/n² | First squared norms sum π²/6 but norm sum diverges; second norm sum π²/6 | Retained; stronger smooth source is essential. |
| 2.9 measurable/continuous rapid spaces | Compact discontinuous indicator; noncompact n⁻² tail | Indicator has bounded height seminorms but a jump 1; tail at power 3 is n→∞ | Retained; continuity and all powers remain separate conditions. |
| 2.9 closedness and translation | Uniform error 2⁻j; moving jump | Weighted uniform limit error tends to 0; sup distance between a jump and a nontrivial small translate can equal 1 | Retained; full measurable space is not assigned strong continuity. |
| 2.10 quotient Schwartz | Circle e₀,e₁; cusp y⁻² | Positive-order D^k e₀=0, norm of D^k e₁=1; y³y⁻²=y→∞ | Retained; compact smooth modes belong, polynomial cusp tails fail. |
| 2.11 logarithmic Schwartz | φ=Ξe^{−√σ}; φ=Ξσ⁻² | Ratios after Ξ division: σ^d e^{−√σ} bounded for every d; second at d=3 is σ→∞ | Retained; first still fails arbitrary algebraic-height decay. |
| 2.12 measure definition/duality | 3δ_x,w(x)=2; distinct Dirac masses at weight 1 | Norm 3/2; distance between the two masses 2 | Retained; no L² density or norm-continuous full measure action assumed. |
| 2.13 uniform derivative exponent | φ=e^{iy²}, Euler derivative | First derivative 2iy²φ; second (4iy²−4y⁴)φ; kth leading growth degree 2k | Retained; no single height exponent controls every derivative. |
| 2.13 union density | Constant 1 versus compact cutoff at height R | Fixed sup error 1; after one extra inverse-height weight, tail error ≤1/R | Retained; density in a union does not imply density in each stage. |
| 2.14 relative decay | w=1; w=n,φ=1 | First has no w-power loss; second seminorm at r=N+1 contains n^{r−N}=n→∞ | Retained; one N must precede every r and derivative. |
| 2.14 cofinal powers | w=n,n² | Exponents r and 2r are cofinal; n^{2r} at r=1 differs from n^r by n | Retained; all-power spaces agree, individual stages need not. |
| 2.15 product tensor | Functions on sets of sizes 2,3; conjugate scalar factor | Product dimension 6; 1⊗conj(i) evaluates to −i, whereas 1⊗i gives i | Retained; completed tensor and conjugate factor conventions preserved. |
| 2.16 CT/EP and adjunction | P=Q, mass-one constants; rescale one or both measures | CT1=EP1=1; pairings 1=1, incompatible rescaling gives 2≠1, compatible rescaling 2=2 | Retained; measure normalization is detectable. |
| 2.16 compact fibers and zero data | P=Q; φ=0 | One identity summand φ(x); zero input has zero nonzero summands; δ^{cN}=1 | Retained; only pointwise finite contribution is claimed for compact support. |
| 2.17 constant-term approximation | Zero constant term; identity parabolic | Difference equals φ in the first case, 0 in the second; model y e⁻ʸ≤e⁻¹ for y≥1 | Retained; strict containment needed only for depth. |
| 2.18 augmented graph | Unit cusp vector; torus with w=w′=1,φ=2 | Proper CT coordinates all 0 but identity coordinate has norm 1; torus graph/sum maps send 2 to 2 | Retained with SM3; dropping identity loses injectivity. |
| 3.1 relative-character sum | A=diag(2,3); one-dimensional A=2 | Trace 5; a unit vector gives 2, twice the vector gives 8, phase i still gives 2 | Retained; orthonormality matters. |
| 3.1 tensor convention | I(z,f)v=zv, fixed conjugate factor | Tensor coefficient z, derivative 1; replacing the first coefficient by its conjugate gives conj(z) | Retained; the fixed second factor does not conjugate the parameter. |
| 3.2 adjoint parameter | A=2,T=i; additive real λ=1 | B(AT,1)=2i=B(A,T*); using T in second slot gives −2i; additive adjoint integral e−1 rather than 1−e⁻¹ | Retained −conj(λ). |
| 3.2 noncommuting matrices | A with rows (1,2),(3,4), T swaps coordinates; B has weights 1,2 | First sum 2+6=8; adjoint-slot sum 6+2=8 | Retained; scalar commutativity is unnecessary. |
| 3.3 support and annihilator | ℂ² vector (2,3); empty,first,full support | Projections (0,0),(2,0),(2,3); pairing against every second-coordinate vector vanishes exactly on the first coordinate | Retained; both directions of support description. |
| 3.4 projection and summation laws | Coordinate projectors; e_n/n | P₁P₂=0, P₁+P₂=I; orthogonal sum converges in ℓ² while sum of norms is infinite | Retained; absolute summability uses the specified stronger topology. |
| 3.5 regularity | GL₂ equal/distinct inducing characters; M=G | Stabilizer orders 2,1,1 | Retained; equality only at infinity does not replace global isomorphism. |
| 3.6 regular constant terms | Modulus 4, s=1,1/2,0 | δ^{s−1/2} gives 2,1,1/2 | Retained; boundary value is not a decay assertion. |
| 3.7 inversion | Compact torus φ=e₁, zero φ, extra distinct mode | Fourier coefficients 1 at 1 and 0 elsewhere; zero reconstructs 0; χ projection of e₁+e₂ leaves e₁ and difference e₂ | Retained; HP and support hypotheses remain explicit. |
| 3.8 kernel and central quotient | Circle n=0,1 at x=0,y=1/2; modulus 4 | Kernel values 1,−1; central factor 1/2 | Retained; opposite finite Fourier projector and factor 2 would be wrong. |
| 3.9 uniform kernel majorant | Weight value 2; f=0 | Dirac norm 1/2; zero kernel sum 0=p(0) | Retained; seminorm may vary with weight, common height loss does not. |
| 3.10 complex derivative | X=1,Y=iD−1,f=e₋₁ | Old conjugated coefficient −2 versus right coefficient 0; corrected coefficients 0 and 0 | Applied F01; absolute-value inequality now 0≤0. |
| 3.10 real derivative | X=1,Y=D,f=e₋₁ | Derivative of conjugate mode coefficient −i; R(D)f coefficient −i | Applied F01; coefficient sign agrees, absolute values alone both equal 1. |
| 3.10 complex linearity and x derivative | Y=iD; separately X=iD,Y=1 | Correct y coefficient +1 versus old −1; correct x coefficient −1 equals L(iD)f coefficient −1 | Applied F01; complexification is linear outside conjugation. |
| 3.10 grouping | One K-type with two coefficients 1,−1 | Absolute value after the finite sum is 0; sum of individual absolute values is 2 | Retained; no ungrouped estimate added. |
| 4.1 characters and restriction | GL₁ Laurent generator at 2,3; no retained places | Values 2,3; unit and empty tensor value 1; with no finite places the algebra is ℂ | Retained; infinite T still means finite support of each tensor. |
| 4.2 CAP relative to T | Torus; GL₂ with all finite places in T | Torus has 0 proper parabolics; GL₂ proper-data finite matching has 0 equations | Retained; vacuous finite matching does not give automatic non-CAP. |
| 4.3 mixed multipliers | Factor values 2,3; zero factor; compact sharp unit candidate | Evaluation 6,0; constant symbol has infinitely many integer values 1 | Retained; scalar action is not transfer preservation. |
| 4.4 quasi-cuspidality | Zero test; anisotropic quotient; GL₂ unit-integral test | Operators 0; cusp projection I in anisotropic case; residual constant mapped to 1 in GL₂ | Retained; last test is not quasi-cuspidal. |
| 4.5 typicality and twists | Central differentials 0,1 on torus; shift along a_M | Both derived Casimirs 0, central conditions differ; quotient projection of α+s is α for every s | Retained; both membership conditions are required. |
| 4.6 multiplicity/counting | Spectral multiset {1,1,4} | Count up to 4 is 3; distinct zero set size 2; inverse-square sum of that set 17/16 | Retained; multiplicity is counted before passing to a set. |
| 4.6 conjugate levels | S₃ subgroups generated by (12),(23) | Each order 2; intersection order 1 | Retained; a common smaller level differs from either original level. |
| 4.7 typical finiteness | Central lattice ℤ, allowed values {0,1} | Two central candidates, though every torus derived eigenvalue is 0; dropping central restriction leaves infinitely many | Retained; central-character gap remains essential. |
| 4.8 full-family annihilator | Bad projected value 2,target 3; arbitrary complex twists | Factor q−2 gives 0 and 1; bad-family value remains 0 for every twist | Retained; unitary-only vanishing would be insufficient. |
| 4.8 Weyl product and sharp seed | W={±1}, bad ±2,target ±3; no bad points | Product (z−2)(−z−2)=4−z² gives 0 and −5; empty product 1 still needs a nonzero sharp seed | Retained; normalization denominator nonzero. |
| 4.9 finite blocks | One Borel datum, real unitary twist t | Number of support blocks 1, number of parameters infinite | Retained; finite-dimensional image not claimed. |
| 5.1 common parameter | Infinity forces s=0; finite Hecke value 2^s with target 2 | At 0 finite value 1; at 1 finite value 2 but infinity fails | Retained; no simultaneous solution despite separate solutions. |
| 5.1 full-group/empty direction | M=G, unequal infinitesimal characters | Twist space has one point; unequal fixed characters remain unequal | Retained; finite-place agreement alone does not supply occurrence. |
| 5.2 separation and seed | Bad h-value 2,target 3; seed value 2 | h−2 values 0,1; with seed values 0,2 | Retained; bare Hecke factor is not substituted for a sharp multiplier. |
| 5.2 finite candidate avoidance | Conditions c₁=0,c₂=0 in ℂ² | Choice (1,1) has both coefficients 1; corresponding product target value 1 | Retained; a finite union of proper hyperplanes is avoided. |
| 5.3 normalized isolation | Two target factors 2,3; one killed family | Product target 6, division gives 1; killed value 0/6=0 | Retained; no zero denominator or projector conclusion. |
| 5.4 non-CAP range | No proper inducing occurrence; empty cuspidal eigenspace | Proper surviving supports 0; when cusp eigenspace is zero the entire automorphic operator is 0 | Retained; existence of an automorphic target is not assumed. |
| 5.5 abstract representation preserved | π absent from automorphic Hilbert space, π(f)=2 | π(μ⋆f)=1·2=2; automorphic operator may be 0 | Retained; two different representations of the test algebra are distinguished. |
| 5.6 isobaric support | Values {2,3},{3,2},{2,2} | First two give 1−5T+6T²; last gives 1−4T+4T² | Applied F04; order forgotten, multiplicity retained. |
| 5.7 refined discrete isolation | q(λ)=λ²−1/4 at 0,i,1/2 | Values −1/4,−5/4,0; generally q(it)=−t²−1/4≠0 | Retained; vanishing on the entire complex family includes the residual point, so reverse separation fails. |
| Worked examples and layer witnesses | Compact damped sinc at 0,1; GL₂ equal/distinct inducing pair | Sinc values 1,0; stabilizer orders 2,1; n=0,1 circle kernels 1,exp(2πi(x−y)) | Retained; agrees with all affected sections and no worked example uses the old derivative convention. |

### Supplier-contract witnesses

These rows test the exact comparisons and quantifiers requested by the remaining gaps. They do not assert that another roadmap has already added the supplement.

| Contract | Instances and computed values | Result/change |
| --- | --- | --- |
| nash-schwartz-analysis | Gaussian pure tensor at (0,0),(1,1): values 1 and e⁻² in both models | Retained product/embedding comparison. |
| tensor-holomorphy | Families z and z give tensor coefficient z², derivative 2 at z=1 | Retained complete nuclear Fréchet family input. |
| slf-isotypic-sums | Regular S₃ module: isotypical dimensions 1,1,4 sum to 6; C₂ gives 1+1=2 | Retained fixed compact K_f and closed-subspace topology. |
| frechet-bilinear-continuity | Multiplication at (2,3) gives 6 with abs(2·3)=2·3; zero factor gives 0 | Retained; Fréchet sources and Hausdorff locally convex target. |
| rapid-semisimple-centre | At z₁=it₁,z₂=it₂, product Gaussian value e^{−t₁²−t₂²}; at (0,0) value 1 | Retained rapid extension beyond compact Paley–Wiener. |
| cuspidal-data-central-comparison | Modulus 4: normalized induction 2 times disintegration 1/2 equals 1 | Retained quotient and measure comparison. |
| hereditary-intertwining-bounds | Torus intertwiner is 1, norm 1, all positive parameter derivatives 0 | Retained hereditary HP/UT/WR contract. |
| discrete-polynomial-counting | PGL₂ constant residual summand adds one datum; q(1/2)=0 whereas q(i)=−5/4 | Retained extra discrete rather than cuspidal counting hypothesis. |
| compact-eisenstein-comparison | Mass-one circle pairing ∫e_n·conj(e_m) is 1 for n=m, 0 otherwise | Retained compact input with transported normalization. |
| arthur-factorization-comparison | Point group g₁=1,g₂=0: f=f·1+0 | Retained fixed-level/order comparison, not an assertion that Z is central. |
| real-plancherel-characters | Mode e₁ has Fourier coefficients 1 at 1,0 at 2; SU₂ parameter 0 is absent | Retained faithfulness and containment, not equality of formal strips with realized parameters. |
| kostant-centralizer | Parameter 1 plus tensor weight 2 gives eigenvalue 3, annihilator X−3 evaluates to 0 | Retained finite-free/annihilator interface. |
| generic-tensor-semisimplicity | Parameter 2 and weights ±1 give 3,1; colliding values would coincide | Retained removal of collision/reducibility loci. |
| minimal-type-detection | Limit rays have minimal weights +1,−1; a split twist changes neither weight | Retained limits and unrestricted split parameters. |
| k-type-growth | SU₂ degrees n=0,1,2: dimensions 1,2,3, compact Casimir values 0,3,8; dimension squared equals Casimir+1 | Retained admissible finite-length scope. |
| quotient-height-comparison | Positive torus symmetric heights at 2 and 1/2 both equal 2 | Retained intermediate-quotient properness/comparison. |
| cusp-fiber-bounds | Identity quotient has fiber size 1; ε=1,1/2 gives bounds 1,2 when c=r=1 | Retained uniform threshold range and specified source. |
| deep-cusp-uniqueness | Modular inversion sends height 2 to 1/2 | Retained deep-region hypothesis; there is no unrestricted injectivity claim. |
| quotient-neighborhood-volumes | Cusp y=4: volume 1/4, e^{−2ρH}=1/4, Ξ=2 | Retained fixed-level normalization. |
| central-character-affine-lattice | Coset 1/2+ℤ gives 1/2,3/2; rank zero gives one base point | Retained affine independent-generator, possibly rank-zero scope. |
| satake-exponential-family | GL₁ uniformizer character q^s: at s=0,1 gives 1,2 for q=2 and 1,3 for q=3 | Retained common parameter and all residue characteristics. |
| real-point-root-data | Map G_m×SL₂→GL₂ has kernel (1,I),(−1,−I), hence size 2 | Retained finite-kernel and component bookkeeping. |
| real-descent-cartan | Split/compact one-dimensional tori have eigenspace dimensions (1,0),(0,1) | Retained real-torus dictionary. |
| local-sobolev-evaluation | Unit-volume model with w=4: value 1 equals weighted norm 2 times 1/2 | Retained weight-sensitive evaluation comparison. |
| hilbert-schmidt-nuclear-composition | One-dimensional maps 2,3: composite norm 6 equals product of Hilbert–Schmidt norms 2·3 | Retained compatibility with the nuclear-map convention. |
| cuspidal-polynomial-counting | Model eigenvalues m² give counts 2 at R=4 and 3 at R=9, equal to √R | Retained multiplicities, conjugate levels and elliptic sign. |

The deleted frechet-open-mapping contract is tested in the §2.5 row and replaced by the actual SM3 import, not by a renamed gap. All 26 retained slugs, needs sentences, suppliers and sections agree between README.md and the plan.

## Acceptance signatures and checks

Suggested.lean is unchanged: seven real-bodied supporting definitions and three deep analytic headline theorems, each admitted. The corrected kernel estimate and the imported Fréchet/action theorems do not acquire Lean substitutes: the docstring already identifies the missing automorphic kernel/inducing and representation carriers. No boundary declaration, API lemma, extra import, sorry-defined data or option override was added.

The complete kept headline list is finite_rank_weierstrass_product (§0.2), polynomial_zero_fiber_interpolation (§0.3) and affine_lattice_interpolation (§0.3). The docstring still names the unstatable sharp interpolation, real multiplier, weighted evaluation/nuclear/tensor/constant-term, relative-character/factorization, support projection, regular constant-term, HP inversion, kernel expansion, counting, archimedean annihilation, mixed isolation, non-CAP, GLₙ-support and refined discrete-isolation headlines, together with the respective missing carriers. The repairs do not change that boundary.

A scratch copy appended #check @name for every declaration and was elaborated once against the pins. Each elaborated type was compared to its README statement and the supplied initial signature record:

| Declaration | Elaborated parameters and comparison |
| --- | --- |
| HasRankBound | Λ:Set ℂ and p:ℕ; countability plus nonzero-point summability. |
| elementaryFactor | p:ℕ,w:ℂ; the only scalar denominators are j+1>0. |
| canonicalProduct | Λ,p,z; nonzero-point subtype retained, separate origin factor. |
| partialCanonicalProduct | Λ,p,finite set of the same subtype,z; same origin convention. |
| HasFiniteEntireOrder | ψ:ℂ→ℂ; positive C and integral degree belong to the real-bodied predicate. |
| HasRapidVerticalDecay | Implicit n, function on Fin n→ℂ; quantifier order ∀M>0 ∀r ∃C≥0 ∀z unchanged. |
| affineSpectralLattice | Implicit n,k, base a, generator family b; independence belongs to the theorem. |
| finite_rank_weierstrass_product | Λ,p,hΛ; local uniform convergence, entire holomorphy, both zero-set directions, simple zeros and global bound all retained. |
| polynomial_zero_fiber_interpolation | n,q,ψ,hψ,horder; holomorphy and growth hypotheses retained, including zero/constant q. |
| affine_lattice_interpolation | n,k,a,b,hb,A; complex linear independence, arbitrary finite exceptions and rank zero retained. |

No section binder disappeared; no signature change was needed. All ten names occur in README.md. The three headlines are not supplied by one use of the opened generic product-limit theorem: the finite-rank global bound and the two exact interpolation conclusions remain additional mathematics.

Exact check outcomes:

- Prescribed lake env lean on packages/AutomorphicSpectralTheoryPartII/Suggested.lean, run from the pinned content checkout: exit 0. Exactly three expected warnings, at Suggested.lean:85:8, :98:8 and :108:8, each “declaration uses sorry”. No errors and no TauCeti module build required.
- Scratch elaboration with all ten #check @name commands: exit 0, the same three expected sorry warnings; all ten signatures printed and matched as above.
- Dependency direction check, with the prescribed name, order and movable arguments: exit 0. Exact output:

```text
depcheck: 51 roadmaps, 587 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line.

- Citation resolver: exit 0; no cross-roadmap citations or roadmap Lean names found nowhere. It reported that it did not check pinned external Lean names; the direct pinned-file audit above supplies that check.
- Plan/README contract comparison: exactly 26 matching gaps. Parsed comparison with HEAD confirms that only the top-level gaps list changed, by deleting the duplicate entry.
- README/Lean name and form comparison: all ten declarations named, single import Mathlib, no set_option; all 63 numbered README sections retained.
- Final whitespace check: git diff --check exited 0 with no output; the new report also has no trailing whitespace. Permitted-file audit found only README.md, the top-level gaps deletion in design/plan.json and this report. No machine paths occur in any of the five authorized package files or this report. Both TOML files and plan JSON parse successfully. Both Lean processes completed; nothing remains running.

## Maintainer consequences

No target name cited by another roadmap changed, and Suggested.lean, metadata.toml and sources.toml are unchanged. The package now names SpectralManifolds SM3 as the generic Fréchet supplier. AutomorphicSpectralTheory is no longer asked for frechet-open-mapping, and AutomorphicFormsOnReductiveGroups retains ownership of Schwartz integration. No other roadmap, merge-order file, tooling or pull-request text was edited. The frozen non-gap design records identified above require reconciliation outside this repair’s permitted JSON edits. The existing transfer-preservation ownership matter remains outside this package and is not re-raised for another automated decision.
