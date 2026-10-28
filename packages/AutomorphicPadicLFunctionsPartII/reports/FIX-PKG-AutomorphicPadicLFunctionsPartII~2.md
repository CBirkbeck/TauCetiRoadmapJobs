# Repair report: AutomorphicPadicLFunctionsPartII

## F01 (P1) — applied

Unfindable parent and unowned Katz comparison → explicit boundaries against GlobalNumberFields, ComplexMultiplicationAndExplicitReciprocity and PadicMeasuresIwasawaAlgebras. Updated Summary, Scope, §8.5's statement, route and Check, and the Lean module docstring. General critical interpolation and uniqueness remain. The named parent is absent from main, open-roadmap lookup, the package index and merge order; no readable supplier owns the comparison.

## F02 (P1) — applied

Three ownerless prerequisite records → retired from the top-level gaps list because §§8.3, 8.4 and 5.4 already own their mathematical targets. Conditional unit-index divisibility → unconditional divisibility in the specified localized critical line with full-unit-compatible critical weight. Added the index-two boundary Check. KS-v4 line 2353 states full-unit integrality; KS-v4 line 961 does not justify unrestricted integral transfer through torsion.

## F03 (P2) — applied

Iteration of one-dimensional Poisson summation → consumption of ThetaSeries Layer 1, items 1A/1E/1F, and Layer 2, items 2A/2C. Updated Scope, exact contracts, §3.4's route and Needs, and Layer 3 Dependencies. The Euclidean change of metric and Λ*=iΛ^∨ are explicit. Ownership is stated in TauCetiRoadmap/ThetaSeries/README.md, lines 55–60 and 432–489.

## F04 (P2) — applied

Continuation alone → continuation plus `kronecker_functional_equation`, including the primal/dual HasSum statements, corrected phase, residue at d and the nondual regularity case. Undefined metric covolume → (∏h_i) times Lebesgue covolume. Added scaled and nonsquare dual-lattice Checks and Gamma-pole controls. Evidence: KS-v4 lines 1521–1549 and Mathlib/Algebra/Module/ZLattice/Covolume.lean, lines 72–99.

## F05 (P2) — applied

Requested affine collapse → SchemeAndStackFoundations §§2.6/2.23; reduced the equivariant-poincare-limit request identically in README and plan. Retired group-torus-comparison → AlgebraicTopology Stage 8 items 5/7/8 with Stage 6. Updated exact contracts, §§2.1–2.3 and Layer 2 Dependencies. The separate cap/projection and completed/Borel gaps remain. Added trivial and sign-monodromy circle Checks.

## F06 (P3) — applied

Redundant `kroneckerSeries` definition and equality conjunct → deleted from Suggested.lean. Section 3.3 retains the mathematical series in prose and names only the two necessary formulas. For a HasSum witness, equality with the total sum is its `HasSum.tsum_eq` symmetry, so it adds no acceptance condition. No boundary theorem or API theorem was added in its place.

## F07 (P3) — applied

Lifted-type citations §0.1 → §1.3, including `cmHodgeEigenspaces`; integration Layers 0–1/9 → 0–1/5; two-auxiliary locator → proof of Theorem 4.10, p.53, KS-v4 line 2490; boundary roadmap → NonordinaryCMSpecialValues. Repaired every occurrence in Scope, contracts, §0.1, §1.1, Layers 0/6/7 Dependencies and Downstream consumers. NonordinaryCMSpecialValues is a scope boundary, not a supplier.

## Verification and ownership evidence

The supplied content checkout is main at b41e47bc; its pinned Mathlib is 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti is a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, agreeing with lake-manifest.json. The citation service's main snapshot is ae2562cd; none of the main-branch supplier folders cited here differs between these commits. No missing-declaration verdict uses a different pin.

Read the shapes of TauCetiRoadmap/ComplexTori/README.md, TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md and TauCetiRoadmap/ThetaSeries/README.md before editing. The existing layers, API lists and Checks were retained.

The object-based `roadmaps grep` searches covered main and the indexed open heads, including the named sibling roadmaps. Searches included lattice Poisson summation, lifted types, completed Poincaré coefficients, Eisenstein–Kronecker classes, Borel currents, Katz measures, Eisenstein measures, smoothing divisibility and unit-index descent. They locate generic lattice Poisson ownership in ThetaSeries and geometric input in AbelianSchemesAndArithmeticModuliPartII and ComplexMultiplicationAndExplicitReciprocity. They do not locate another owner of this package's residue class, CM current, Eisenstein measure or arithmetic desmoothing theorem. Those specialized targets remain here; their generic foundations are imported or named supplier gaps. No helper agents were used.

The base-roadmap lookup returned exactly “no roadmap AutomorphicPadicLFunctions on main or in an open roadmap pull request”. The board package index and merge order also have no such entry. No substitute Katz theorem or parent declaration was invented. Types −kΣ−d(σ)(σ−barσ) still have α=k+d(σ), β=d(σ); the interpolation theorem includes them subject to the same character compatibility as every other type.

Every cross-roadmap contract was checked at its permitted source:

| Supplier | Resolved sections and relevant boundary |
| --- | --- |
| GlobalNumberFields, main | Layers 2, 7, 9–10: ray carriers, ideal/idele characters, infinity types, units, purity and norm change. The converse type classification and arithmetic p-adic avatar remain explicit gaps. |
| ClassFieldTheory, main | Layers 7, 11–13: arithmetic reciprocity and ray class fields. The fp∞ limit with the tame-congruence unit kernel remains an explicit gap. |
| ThetaSeries, main | Layer 1, 1A/1E/1F; Layer 2, 2A/2C. Generic lattice Poisson, Schwartz summability, Gaussian input, biduality and inverse covolumes are consumed. |
| SchemeAndStackFoundations, main | §2.6, affine quasi-coherent acyclicity; §2.7, supports; §§2.19–2.20, duality; §2.23, derived equivariance and its spectral sequence. Affine collapse follows by retaining only q=0. Completed inverse-limit and Borel comparisons remain gaps. |
| AlgebraicTopology, main | Stage 5 items 3–4, Stage 6, Stage 8 items 5/7/8. The torus is a CW-type K(Γ,1); the classifying map induces id on π₁, hence a homotopy equivalence. Item 8 compares actual local systems with native group cohomology and supplies change-of-group naturality. Cap compatibility remains the separate gap. |
| DifferentialGeometry, main | Layers 0–1 and 5; integration is 5.2 and Stokes 5.3. Layer 9 concerns duality, not the integration consumed here. |
| Hyperfunctions, main | HF2.AnalyticPreparation.CurrentResolution: finite-rank compact currents and regularization; the p-degree homotopy sign is (−1)^p, with no additional sign on regularization. |
| AbelianSchemesAndArithmeticModuliPartII, open new-roadmap head | P0.1–P0.6, P1.1, P2.1–P2.8, P3.2–P3.4, P4.1–P4.3. Their completed coefficients, equivariance, rigidified moments, smooth realization and ordinary trivialization are consumed, not reconstructed. |
| ComplexMultiplicationAndExplicitReciprocity, open new-roadmap head | §1.3: Serre tensors, `cmHodgeEigenspaces`, degrees and period pairings. The totally complex lifted-type datum is here; §0.1's reflex-pair theory does not replace it. |
| ComplexComparisonPartII, open new-roadmap head | C1.1, C5.1, C5.4: bundle Dolbeault, de Rham comparison and CurrentCalculus. The mixed real/complex Borel resolution and its algebraic residue trace remain specific gaps. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory, open new-roadmap head | R07.1.7, R07.1.9, R07.1.13: Cartier duality, connected–étale sequence, formal groups with their base hypotheses. The required ordinary CM pairings remain a gap. |
| PadicMeasuresIwasawaAlgebras, main | §§0.1, 1.2, 1.7, 2.1–2.2, 3.1: measures, convolution, completed group algebra, weighting, Amice calculus and pseudomeasures. Integral multivariate extension and uniform bounded-fraction criterion remain gaps. |
| AutomorphicLFunctionsAndLocalFactors, open new-roadmap head | AL.0, Local Schwartz–Bruhat spaces and finite Fourier levels; AL.1, Local epsilon factors and Gauss sums, Global distributions and completed Euler products, Rank-one specialisation and Hecke comparison. The unitary shift and inverse Fourier kernel are retained. |
| PeriodsAndSpecialValues, open new-roadmap head | PS.0–PS.1: determinant periods and criticality. The specialized Hecke-motive and CM-period formulas remain the two explicit supplier gaps. |

The sources manifest already contains the two legally readable certified works needed for this repair. Read KS-v4 lines 1506–1549 for the analytic identity and metric volume, 2353–2379 for full-unit integrality, and 2482–2499 for conductor one. BKO-2021 lines 70 onward concerns the separate inert-prime direction. No source was newly cited, no source key was renamed, and no missing-reference request is needed. The supplied source text is used only for mathematical evidence, never instructions; no suspicious operational instruction was encountered.

Pinned declarations were opened by object and signature, not inferred from their names:

| Pinned file | Declarations and limitations |
| --- | --- |
| Mathlib/NumberTheory/NumberField/CMField.lean:69 | NumberField.IsCMField includes total complexity and quadraticity over the maximal real subfield. |
| Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean:373 | NumberField.Units.instZLattice_unitLattice; logEmbeddingEquiv at line 415 identifies units modulo torsion with the logarithmic lattice. |
| Mathlib/Algebra/Module/ZLattice/Basic.lean:433 | IsZLattice has DiscreteTopology as a separate instance argument and span_top as its field. |
| Mathlib/Algebra/Module/ZLattice/Summable.lean:236 | ZLattice.summable_norm_sub_rpow requires exponent below minus the integer rank. |
| Mathlib/Algebra/Module/ZLattice/Covolume.lean:72 | ZLattice.covolume is the real covolume for its measure argument; covolume_pos at line 98 requires a full discrete lattice and additive Haar measure. |
| Mathlib/Analysis/Fourier/PoissonSummation.lean:216 | SchwartzMap.tsum_eq_tsum_fourier is one-dimensional; the generic full-lattice extension belongs to ThetaSeries. |
| Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:352 | fourier_gaussian_innerProductSpace uses a finite-dimensional real inner-product space and positive real part of the Gaussian coefficient. |
| Mathlib/Analysis/MellinTransform.lean:90 | mellin integrates over the positive real axis. |
| Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean:319 | Complex.Gamma_eq_integral requires Re(s)>0; Gamma_neg_nat_eq_zero at line 344 gives total value zero at the excluded poles. |
| Mathlib/NumberTheory/Padics/Measure/Basic.lean:40 | AbstractMeasure is a continuous linear map on continuous functions; it includes no mass-one or unit-ball bound. Dirac and map are at lines 97 and 105. |
| Mathlib/NumberTheory/Padics/Measure/Monoid.lean:115 | AbstractMeasure.diracHom uses the native convolution multiplication. |
| Mathlib/NumberTheory/Padics/Measure/AmiceTransform.lean:157 | AbstractMeasure.amiceTransformEquiv has ℤ_p domain and ℤ_p coefficients; it is not the required integral multivariate statement. |
| TauCeti/Algebra/Coalgebra/Comodule/MonoidAlgebra/Basic.lean:416 | isInternal_weightSpace; endOfPoint_tmul_of_mem_weightSpace at line 568. Neither removes invariants of nontrivial weights on torsion modules. |
| TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Algebraic.lean:60 | HeckeCharacter.IsAlgebraic specifies agreement on the identity component; no CM-period datum is included. |
| TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Shift.lean:273 | HeckeCharacter.unitaryPart supplies the unitary carrier used with the stated sign conversion. |

Object searches at these pins do not find the generalized twisted lattice series or the completed equivariant Eisenstein–Kronecker/CM-period/theta-measure carriers. The missing-carrier descriptions in Suggested.lean remain geometric/arithmetic, rather than free predicates standing for unstated conclusions.

## Adversarial mathematics pass

These are computed instances and negative controls of the statements, including the retained APIs and their consumers; they are not proofs of the deep roadmap targets. Each row identifies the statement tested. The uniform descent, global sign transport and bounded division remain explicit theorems to prove, rather than conclusions inferred from the test cases.

| Statement | Instances tried | Values on the two sides or defining/nondefining models | Result | Change |
| --- | --- | --- | --- | --- |
| Summary and scope: generality of critical interpolation | L=K=ℚ(i), k=2, d(σ)=1; quartic L/K | CM pair (α,β)=(3,1), unit weight i^(−3)(−i)=1; lifted quartic indices repeat twice | General target retained | F01 boundaries and Check |
| Conventions: critical versus derivative index | α=1,2,3 | a=0,1,2; determinant degrees a+1=1,2,3 | Extra selected degree required | Retained |
| Conventions: weight/unitary shift | χ=N^m | χᵘ=1, w=2m; both L-expressions are ζ_L(s−m) | Signs agree | Retained |
| Conventions: arithmetic Artin | fifth roots, prime 2 | ζ₅↦ζ₅²; inverse ζ₅↦ζ₅³; 2·3≡1 mod 5 | Inverse support is distinguishable | Retained |
| Conventions: embedded arithmetic base/localization | R=ℤ, ideal (3); zero ring | localization contains 1/3 but not 1/2; zero ring cannot embed unital into ℂ | Denominators and exclusions agree | Retained |
| Conventions: ideal norms | unit ideal; zero ideal | N(O_L)=1; zero ideal has no permitted positive denominator | Unit case allowed, zero excluded | Retained |
| Conventions: coefficient and manifold boundaries | characteristic p, inseparable extension, square-zero base | p·1=0 versus p≠0 in ℂ; ε²=0 forces ε=0 in a subring of ℂ | Outside the embedded arithmetic datum; supplier bases stay broader | Retained |
| Hermitian form / hermitianPairing | h=1, z=1/2,w=i/2; h=2 | H(z,w)=−i/4 versus H(w,z)=i/4; H(1,1)=2 | Alternating order pinned | F03/F04 use same convention |
| Hermitian positivity and denominator | h=0; d=0 | H(1,1)=0, log 0=0, exponential denominator 1; empty pairing 0 and omitted sole term 0 | Bad metric excluded by hh; rank zero excluded by hd | Explicit hypotheses retained |
| Metric covolume definition | d=1, h=2, Λ=ℤ[i] | covol_Leb=1, vol_H=2; dual Lebesgue volume 1/4, metric volume 1/2; metric product 1 | Factor ∏h_i necessary | F04 |
| Euclidean metric transport | h=(2,1/2), square lattice in ℂ² | real determinant (√2)²(1/√2)²=1; metric and Lebesgue volumes both 1 | Product-one current metric unchanged | F03/F04; downstream formulas retained |
| Alternating versus real dual | Λ=2ℤ+iℤ, h=1 | Λ^∨=½ℤ+iℤ; Λ*=ℤ+(i/2)ℤ; Im H(1/2,i)=−1/2 | Multiplication by i essential; both dual volumes 1/2 | F03/F04 Check |
| Biduality and volume transport | same rectangular Λ | real dual twice returns 2ℤ+iℤ; alternating dual twice returns 2ℤ+iℤ; 2·(1/2)=1 | Both directions tested | F03 contract |
| §0.1 lifted critical types | ℚ(i), μ=(−2,1); quartic α=(1,2) | a=1, β=1; weight at i is i≠1, so take its kernel; unequal lifted exponents 1≠2 fail norm pullback | Admissibility separate from signs | F07 locator only |
| §0.2 based CM datum and action API | Lie coordinate 2; γ=i; zero Serre module | inverse cotangent 1/2 versus Lie 2; at i both cotangent weights −i; dimensions 2 versus 0 | Variance and positive dimension distinguish models | Retained |
| §0.3 critical invariants and weight decomposition | μ₆, weight 3σ, M=R/(2) | weight −1≠1 in R, but −1=1 mod 2, so invariants M rather than 0 | Torsion-free hypothesis essential | Retained |
| §0.3 determinant coefficient | a=β=0 | weight on each selected embedding −1, not 0 | Determinant shift fixed | Retained |
| §1.1 trace-zero regularizer | split rank 3 kernel | (2,−1,−1) has trace 0; constant (1,1,1) has trace 3 | Domain distinguishes regularizer | F07 locator only |
| §1.1 two auxiliaries | ranks 3 and 5 | pullback away from second identity has trace 4·0=0; first regularizer restricted off identity has trace −2 | Correct conductor-one residue support | F07 locator |
| §1.1 identity/empty datum and base change | c=O_L; identity kernel minus identity | 1−1=0; empty function module 0; scalar extension sends trace 0 to 0 | Degenerate objects consistent | Retained |
| §1.2 support trace and equivariant inverse limit | d=1, Γ=1, zero residue | coherent degree 0, support degree 1; image of 0 and trace of 0 both 0 | Degrees and zero square agree; no formal limit interchange inferred | Retained gap |
| §1.3 unique EK map and linearity | h=0; split h=(1,1) | EK(0)=0 and residue 0; trace(1,1)=2 excludes this input | Zero-map wrong model excluded by nonzero residue law | Retained |
| §1.4 derivatives and factorial API | z²; z₁z₂; degree 0 | ∂²z²=2; ∂₁∂₂(z₁z₂)=1; ∇⁰EK=EK | Ordinary/divided factors distinguished | Retained |
| §2.1 affine spectral-sequence collapse | Γ=1, affine coefficient M | H⁰=M, H^q=0 for q>0; only q=0 row survives | No extra affine supplier theorem required | F05 |
| §2.1 affine comparison with nonabelian group | S₃ permutes ℤ³ | H⁰=invariant triples (a,a,a)≅ℤ, not ℤ³; equivariant affine H⁰ has same value | Derived invariants retained | F05 contract |
| §2.1 specialization and augmentation | d=1, Γ=1, a=b=0 | degree 0 value equals rigidified augmentation; moment 0 is identity on scalars | Correct coefficient and splitting | F05 route |
| §2.2 group/torus comparison | Γ=ℤ, trivial M | H¹(circle;M)=Hom(ℤ,M)=M=H¹(ℤ,M); index m sends a↦ma | Same map and naturality | F05 Check |
| §2.2 actual local representation | Γ=ℤ, M=ℤ with monodromy −1 | cochain differential −2; H⁰=0, H¹=ℤ/2 on both models | Constant-coefficient replacement fails | F05 Check |
| §2.2 cap and orientation | d=1; d=2 transposition | cap 1=1; orientation and determinant each −1, product +1 | Ordering independence consistent | Retained |
| §2.2 rank-one shift | a=1 over ℤ₂ | u⊗u↦u^[2]; shuffle ↦2u^[2] | Shift remains invertible; shuffle does not | Retained |
| §2.2 torsion-normalized cap | Γ=μ₂, Γ₀=1, R=ℤ₂ | normalized cap(1)=1/2∉ℤ₂, versus free cap(1)=1 | Arbitrary integral extension excluded | Retained |
| §2.3 subgroup scaling | oriented circle cover, indices 1,2,3 | integral of pulled-back unit class 1,2,3 equals m·1 | Index not canceled | Retained |
| §2.4 refined evaluation | [f]=id; h=0 | pushforward id, determinant transport id, output unrefined; zero goes to zero without 1/Nf | Identity and integrality compatible | Retained |
| §2.5 refined/unrefined square | f=O_L | both coefficient transports id; both sides EK | No spurious norm multiplier | Retained |
| §2.6 polylogarithm degree | d=1,2 | coherent degrees 0,1; de Rham degrees 1,3 | Shift distinguished from equal degrees | Retained |
| §3.1 Borel action and bidegree | d=1,2; unit coordinate c | EΓ point for d=1; total dimensions 2,5; |c|²r·|c⁻¹z|²=r|z|² | Action and dimensions agree | Retained |
| §3.2 currents, differential and trace | N=2, (p,q)=(1,0); point Thom current | sign (−1)^(2−1)=−1; ∫η∧dω=−∫dη∧ω; δ_point(1)=1 | Test-first order and residue pinned | Retained |
| Supplier current-convention conversion | N=2,k=1; p=1 homotopy | wedge-order factor (−1)¹=−1; homotopy −1, regularization +1 | Comparison has two distinct signs | F07 integration locator |
| §3.3 kroneckerTerm numerator | z+λ=i, ν=1; d=2, vector (1,0) | numerator −i; indices (0,0) and (0,1) give 1 and 0 | Antiholomorphic, coordinatewise convention | F06 necessary definition retained |
| §3.3 zero-vector omission | λ=−z; ν=0 | term defined 0, never 0/0; a nonzero vector with one zero coordinate remains | Entire vector, not coordinate, omitted | Retained |
| §3.3 convergence half-plane | d=1, ν=0; d=2, |ν|=2 | exponent −2Re s<−2 gives Re s>1; 2−2Re s<−4 gives Re s>3 | Rank 2d bound agrees | Retained |
| §3.3 translations | z=1/2,w=i/2,a=1; b in alternating dual | e^(−2πi⟨1,i/2⟩)=e^(πi)=−1; for b dual each lattice multiplier e^(2πin)=1 | Signs and period lattice agree | Retained |
| §3.3 series versus continuation | square lattice, s=0 | continued K(0)=−1; divergent unit-term total tsum=0 | HasSum used only in convergence region | F06 delete redundant tsum wrapper |
| §3.4 continuation headline | square lattice, ν=0; ν=1,z=w=0 | K regular at 0 with value −1, residue π at 1; ν=1 terms cancel in ± pairs, continuation 0 | Pole bound permits actual pole and cancellation | Retained headline, no equality padding |
| §3.4 completed functional equation and phase | z=1/2,w=i/2,h=1 | forward phase i, reversed −i, product 1; volumes multiply to 1 | Equation twice is identity | F04 theorem |
| §3.4 theta transformation underlying the equation | h=2, Λ=2ℤ+iℤ, t=0.7, z=0.2+0.3i, w=0.1+0.4i, ν=0 | left 0.5947103658−0.0919655360i; transformed right same, numerical difference below 7·10⁻¹⁷ | Weighted metric and phase agree | F03/F04; numerical diagnostic only |
| §3.4 polynomial theta transformation | same datum, ν=1,2 | ν=1 both 0.1842634508−0.1669290861i; ν=2 both −0.0158613186−0.0185935996i; errors below 4·10⁻¹⁷ | No missing i^ν or h^ν factor | F04; numerical diagnostic only |
| §3.4 residue at d | square lattice, h=1,2 | K_h= h^(−s)K_1; residues π and π/2; π/vol_HΛ gives same | Metric factor necessary | F04 Check |
| §3.4 completed residue at zero | square lattice ν=z=w=0 | K(0)=−1 and Res₀Γ=1 give Res₀M=−1; Res₁M=π⁻¹·π=1 | Completed/uncompleted distinguished | F04 Check |
| §3.4 pointwise Gamma restriction | s=0, d=1, ν=0 | Gamma(0)=0 gives finite total product 0, whereas meromorphic completion has residue −1 | Pointwise identity excludes Gamma poles | F04 explicit binders |
| §3.4 nondual regularity | d=1, w=1/2 for Λ=ℤ[i], h=1 | w pairs with i to −1/2, so w∉Λ*; zero-frequency indicator 0, residue 0 | Additional analytic-at-d clause consistent | F04 |
| §3.5 current contraction | d=1; d=2,j=1 | ι_v(dz∧dbarz)=−v dz; top coefficient −2Cv₁v₂u₁∧dz₁∧dz₂ | Existing contraction signs survive volume definition | Retained |
| §3.5 normalization and truncation | square lattice; j≥d | vol(A)=−2i, C=−π, contraction +π·barℓ/r·dz; j≥d gives 0 | Residue scalar and bidegree fixed | Retained |
| §3.5 inverse-power coefficient | j=0, degrees b=0,1,2 | (A+v)⁻¹=A⁻¹−vA⁻²+v²A⁻³ modulo v³ | Alternating b-sign necessary | Retained |
| §3.6 current/class comparison | d=1, b=0,1; h=0 | successive coefficients have opposite signs from previous row; zero source gives current 0 and residue 0 | Local identity consistent; global transport still owned | Retained §8.3 target |
| §4.1 orbit series invariance | μ₄, α=4 or 1, β=0 | i^(−4)=1 versus i^(−1)=−i | Weight condition distinguishes definable orbit sum | Retained |
| §4.1 subgroup multiplicities | μ₄⊃1, t=1/3 | four torsion translates; each single-coset sum E, combined sum 4E | Fixed-point hypothesis needed for single-series scaling | Retained |
| §4.1 homothety | d=1,c=2, α=4,β=0 | each term multiplier 2^(−4)·4^(−s)=1/(16·4^s) on both sides | Numerator and norm scalings distinct | Retained |
| §4.2 fibre integral | d=1; d=2 | no r-integral in d=1; at d=2 Jacobian −2 before absolute value; ∏Γ(α_i)=∏(α_i−1)! | Leading d and product factorials required | Retained |
| §4.3 explicit EK sign | (d,|β|)=(1,0),(1,1),(2,0),(3,0) | ε=−1,+1,+1,+1 respectively | Contraction and determinant parity agree | Retained; global transport not inferred |
| §5.1 periods and inverse different | ℚ(i), Ω=2,q=1; rescale by i | dual ideal (2i)⁻¹ℤ[i]; trace dual basis 1/2,−i/2 has diagonal traces 1,1; Ω∨=πi before and after | Conjugate-linear q and independent dual period required | Retained |
| §5.2 normalizer and linearity | α=3,β=0; α=(3,2); value 0 | 2v/Ω³; factorial product 2 versus total factorial 6; 𝒩(0)=0 | Products and nonvanishing assumptions agree | Retained |
| §5.3 partial L coefficient | b=O_L; χ=N | χ(b)Nb^(−s)=1; unitary shift gives ζ_L(s−1) | Ideal convention matches analytic supplier | Retained |
| §5.4 unconditional unit descent | index m=1,2,3, h=0 | EK=0=m·0; at m=2 arbitrary class 1 would require 1/2 over ℤ₂ | Correctly restricts to special residue classes | F02 explicit target and Check |
| §5.4 normalized orbit expression | torsion-free subgroup of index 2 | orbit multiplicity 2, so EK_subgroup=2·EK_full; integrality of the quotient is precisely the separate target | Index factor is not removed by unrestricted transfer | F02 |
| §5.5 torsion distribution | Nc=3 | (3−1)E(1;a)−Σ_(t≠0)E =3E(1;a)−E(1;c⁻¹a) | Trace-zero smoothing coefficients agree | Retained |
| §5.6 localized character values | b^m=(λ) | χ(b)^m=λ^(β−α); inverse embedding powers have only Nb denominators | Correct ring O_E[1/Nb] | Retained |
| §5.7 conductor-one integrality | χ(c)=2,Nc=7,χ(c′)=3; L=0 | (1−3)(14−1)=−26 versus missing-factor value 13; normalized zero value 0 | Two auxiliaries and possible vanishing retained | F07 source locator |
| §5.8 generalized Shimura algebraicity | L=K; quartic L/K | repetition exponent 1 or 2 | Non-CM extension does not change coordinate count | Retained |
| §5.9 weak Deligne period relation | L-value 0, c⁺≠0 | ratio 0∈Qbar but 0∉Qbar×; nonzero period ratio is in Qbar× | Scalar/unit distinction retained | Retained supplier gaps |
| §6.1 ordinary places and paired isogenies | ℚ(i), p=5 or 3 | two distinct split places at 5; one shared inert place at 3; at reduction i=3, 2+i=0 and 2−i=4 | Connected/étale direction fixed | F07 citation only |
| §6.1 small-prime boundary | ℚ(√−7), p=2; ℚ(√−2), p=3 | minimal polynomials reduce to X(X−1) modulo 2 and (X−1)(X+1) modulo 3, both with distinct roots; discriminants −7,−8 prime to p | Small split unramified ordinary primes remain included | No new restriction |
| §6.2 canonical bases and p-adic periods | algebraic basis canonical; scale by unit u; scale by p | Ω_p=1; Ω_p↦uΩ_p; pΩ_p nonunit and not a based datum | Zero/nonunit model excluded | Retained |
| §6.3 theta linearity and restriction | h=0; index 2; a=β=0 | θ(0)=0; θ_subgroup=2θ; augmentation Ω_p e_(0,0), not e_(0,0) | Same cap normalization at p=2 | Retained §5.4 dependence |
| §6.4 invariant derivatives | (1+T)²; (1+T₁)²(1+T₂)³ | invariant second derivative 4 versus ordinary 2; mixed derivative 6; exponent-zero monomial at 0 is 1 | Native multiplicative coordinates agree | Retained |
| §7.1 Amice measure and moments | (1+T)^m; constant c | δ_m has kth moment m^k; cδ₀ has mass c and positive total-degree moments 0 | Not a Haar probability measure | Retained |
| §7.1 determinant-period conversion | a=β=0 | mass Ω_p^1 e_(0,0); dropping determinant gives e_(0,0) | Extra period survives to final formula | Retained |
| §7.2 translation | n=0; finite cyclic pairing | kernel has one point and pairing 1, giving θ=θ; χ·χ⁻¹=1 in Fourier combination | Positive translation/inverse Fourier conventions match | Retained |
| §7.3 Fourier inversion | C₃, ζ=e^(2πi/3) | (1,ζ,ζ²)↦(0,1,0); δ₀↦(1/3,1/3,1/3); inverse positive sum returns originals | Kernel and denominator pinned | Retained |
| §7.3 level refinement | ℤ/4→ℤ/2; n=0 | inflated (1,0,1,0) transforms to (1/2,0,1/2,0); order-one transform 1↦1 | Kernel annihilator, not frequency inflation | Retained |
| §7.4 locally constant moments | ρ=1; level inflation | normalized Fourier support is zero frequency with coefficient 1; inflated values unchanged, no extra level factor | Returns §7.1 moment | Retained |
| §8.1 local factor | trivial component; quadratic character on 𝔽₃× | constant extension gives Local=1; (ζ₃⁻¹−ζ₃⁻²)/3=−i/√3, reversed kernel +i/√3 | Nonzero primitive factor and sign agree | Retained |
| §8.2 smoothing atom and mass | Nc=7,χ(c)=2; c=O_L; χ=1 | atom moment 13/2 versus complex factor 13; unit-ideal atom 0; trivial moment Nc−1 | Inverse Artin support required | Retained |
| §8.2 conductor-one atom | trivial χ | 1−χ(c′)=0; mass 0 | Division requires family cancellation | Retained |
| §8.3 weighted ray pushforward | α=2,β=1,t=2,s=3 | t²s=12, determinant weight t⁻¹ gives 6 | Correct derivative index a=1 | Retained |
| §8.3 tame-unit kernel | f=O_L; nontrivial f | U_f=O_L× in first case; for ε not congruent 1 mod f, its tame residue is ε≠1 in second | Quotient is by actual congruence-unit closure | Retained gap |
| §8.3 depletion and representative compatibility | complementary character values 2,3; identity representative change | (1−2)(1−3)=2 versus −1 or −2 from a single factor; identity change gives same weighted measure | Complete product and transport required | Retained |
| §8.4 characterwise boundedness countermodel | C₂ and C₃ | (1/p)Σδ_g gives character values (1,0,…,0), but indicator δ_e gives 1/2 or 1/3 | Uniform congruence cannot be replaced by single values | Owned theorem retained after retiring G2 record |
| §8.4 uniqueness route | difference annihilates finite-character twists | on their span every integral 0, hence by established continuity every continuous-test integral 0 | Density used only after bound | Retained |
| §8.5 final period scaling | α=2,β=1; basis unit u=2 at p=5 | divisor Ω_p²Ω_p∨; both normalized sides scale by 1/4 | Complex/p-adic bases agree | Retained |
| §8.5 full scope after comparison removal | k=1,d(σ)=0; k=2,d(σ)=1 | indices (1,0), (3,1), both critical; first requires compatible finite unit character, second weight trivial on μ₄ | No critical-type narrowing | F01 |
| Worked non-CM quartic | L=ℚ(i,√(1+i)) | polynomial X⁴−2X²+2; norm of 1−i is 2, not a rational square; α=(1,2) fails repetition, α=(2,2),β=(1,1) passes | Same example supports all type/period consumers | Retained |

For the new analytic theorem the dual condition is an iff, not merely containment: on the rectangular lattice it admits exactly ℤ+(i/2)ℤ and rejects 1/2; the zero and full ambient submodules cannot satisfy it. Full real rank and discreteness exclude the zero lattice in positive dimension and dense rational subgroups. Positive metric coefficients and the positive covolume exclude division by zero. Γ in the arithmetic statements is abelian because it is a unit subgroup; the nonabelian S₃ test above applies to the generic equivariant affine comparison rather than silently enlarging an arithmetic hypothesis.

The theta numbers are finite Gaussian-sum diagnostics on −18≤m,n≤18, not certified approximations or replacements for the Poisson proof. The exact sign/volume witnesses and the source's theta/Mellin argument justify the restated signature. For H_r in the current and fibre-integration layers, ∏r_i=1, so the new metric-volume definition leaves their normalizations unchanged. All Checks and worked examples using the changed metric, group comparison, or critical-type overlap have been recomputed above.

## Check outcomes

- Final `lake env lean` elaboration of packages/AutomorphicPadicLFunctionsPartII/Suggested.lean from the supplied content checkout: exit 0, with exactly two expected “declaration uses sorry” warnings, on `kronecker_meromorphic_continuation` and `kronecker_functional_equation`. No TauCeti module import is used, so no targeted object-file build is needed.
- A separate scratch file containing the final module followed by `#check @name` for each of its four declarations elaborated: exit 0, the same two expected warnings. Compared every elaborated type with README §§3.3–3.4. Both theorem signatures retain d>0, full-lattice discreteness/rank, h and every positivity hypothesis. The new theorem retains the complete dual iff, ν,z,w, Gamma exclusions and residue-limit hypotheses. The volume argument elaborates to product Lebesgue `MeasureTheory.volume`. No section binder disappeared. The two real-body definitions need no positivity binder to define their total formulas; positivity is carried by both headlines.
- `kroneckerSeries` is absent; its redundant equality conjunct is absent. All four retained Lean names occur in README. Only `import Mathlib` is present, with two real-body definitions and two sorry'd headline theorems. No set_option, extra example, API theorem, sorry'd datum or free predicate was added.
- The plan outside its top-level gaps list is structurally identical to the original. All twelve remaining gaps have exactly slug, needs, supplier and section; each has the same needs sentence under Exact supplier contracts. The three internally owned records and group-torus-comparison are absent from that list.
- Citation resolution: exit 0, no cross-roadmap citations found nowhere, no Lean names found nowhere. The tool reports that it did not check external Lean names against Lake packages; those were checked directly at the pins as recorded above.
- Dependency check: exit 0. Exact output:

```text
moved: AutomorphicPadicLFunctionsPartII moved in the merge order from #201 to #212, right after its last supplier NonordinaryCMSpecialValues; checked as moved (the worker moves it there when it submits)
depcheck: 47 roadmaps, 514 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The NonordinaryCMSpecialValues placement line is a dependency-discovery false positive for the explicitly named scope boundary: no Needs line or exact supplier contract consumes it. The required spelling is retained; no merge-order or tooling file was edited. No gate failures were supplied separately from the seven review findings. `git diff --check` also passed, and a machine-path scan of all edited package files found none.

## Maintainer consequences

The new acceptance name is `TauCetiRoadmap.AutomorphicPadicLFunctionsPartII.kronecker_functional_equation`. The deleted local definition is `TauCetiRoadmap.AutomorphicPadicLFunctionsPartII.kroneckerSeries`; consumers should use the actual series/HasSum rather than an unnecessary total-sum wrapper. The continuation theorem keeps its name and loses only that redundant conjunct.

The generic Poisson dependency now names ThetaSeries. No supplier target was invented. The remaining supplier gaps are requests, not declarations that their owners already promise. The global sign, integral unit-index descent and bounded auxiliary division remain owned mathematical targets in §§8.3, 5.4 and 8.4, respectively; deleting their invalid gap records does not remove these proof obligations.

The independent NonordinaryCMSpecialValues design refers to an unavailable parent CM-period node. That cross-package reference cannot be repaired within this package; this report identifies the actual ordinary period construction as §6.2, with generic geometry supplied by the named owners. The absent parent was not reconstructed or assumed. No other roadmap, merge order, pull request, source cache or tooling file was changed. No commit or network write was made.
