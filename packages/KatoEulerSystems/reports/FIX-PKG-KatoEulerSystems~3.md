# Repair report: KatoEulerSystems

## F01 (P2) — applied

Unavailable-supplier gap → direct supplier contract. Read `packages/PadicHodgeRegulators/README.md` from board main: every cited section exists. Deleted the gap paragraph and its sole `gaps` entry; retained the section contract and made §9.36's odd-prime domain explicit. The all-prime de Rham domain remains separate from the odd-prime Coleman domain.

## F02 (P3) — applied

Unsupported attribution of a negative Chern class → Kato's positive, ordered Chern-character formula, with p invertible on X. Evidence: Kato2004 line 2584, §8.4, pp. 182–183. Added a modulo-three ordered-symbol Check in §1.1. Searched the whole README: no occurrence of the unsupported Chern-class notation remains; the product normalization is unchanged.

## F03 (P3) — applied

Deleted declaration names → mathematical expressions and objects. Replaced both parity-name occurrences (§§3.3, 5.3), removed the undeclared Euler-factor sentence (§6.4), and rewrote the smoothing and unipotent Checks (§§0.1, 4.1, 4.3). Recomputed their values below. No corresponding API or boundary declarations were added to `Suggested.lean`.

## F04 (P3) — applied

Implicit passage from elliptic curves to newforms → explicit `EllipticCurveModularity` R29.4–R29.6 contract and §4.7 route. Updated Scope, §§4.7, 6.6, 7.9 and Layers 4, 6, 7 Dependencies. The attached rational newform makes Momose's algebra split; the open cyclotomic-kernel image and cyclotomic determinant give the required image. The elliptic signatures retain their original hypotheses.

## F05 (P3) — applied

Unlocated minimal equation and ambiguous period → `EllipticCurves` Layers 4.5b and 7, explicitly the positive total real period. Set Ω_E = c_∞Ω_E⁺ and r_E = c_∞r_E⁺. Updated the contract, §§6.6, 7.4, 7.8 and Layers 6–7 Dependencies; added component and valuation Checks. This preserves the Euler-system ratio and every odd-prime bound.

## F06 (P3) — applied

Incomplete headline list → named missing carriers for §§7.4, 7.6 and the other omitted conclusions; aligned the Layer 7 title. Clarified that the existing rational-point theorem is K = ℚ, χ = 1. The elliptic Mordell–Weil χ-part is statable: added `ellipticCharacterPart` and `ellipticCharacterPoints_finite` using native points, their pinned Galois action, character evaluation and twisted `LSeries`.

## F07 (P3) — applied

Stale source usage → §§7.5, 7.7 for Schneider1985 and PerrinRiou1990; incomplete Nakamura2023 locator → Appendix A theorem, definition, comparison and corollary locators. Removed the unused Jacquet–Shalika bibliography item, retaining its lifetime manifest key with empty usage and unchanged uncertified status. Added Kato §8.4 to its manifest locator. No settled access status was reopened.

## Source and supplier verification

Read the main roadmaps `TauCetiRoadmap/EllipticCurves/README.md` and `TauCetiRoadmap/ModularForms/README.md` for their organization and supplied mathematics. Content HEAD is `6ef1bbddc593bfbbf46976c005c598e0535c9426`. The roadmap resolver uses its own main snapshot, `6383577`; its result is supplemented by the direct reads below.

| Finding | Evidence read | Consequence |
|---|---|---|
| F01 | Board-main `packages/PadicHodgeRegulators/README.md`, §§1.4, 1.7, 1.11, 8.8, 8.13–8.16, 8.18, 8.20–8.22, 9.31–9.36 | All named sections exist. §8.22 and §9.36 expressly require odd p; §§9.31–9.35 allow two, with high-conductor domains before crystalline extension. The working tree's absent folder does not imply an absent supplier. |
| F02 | Kato2004 line 2584 and line 2591, §8.4, pp. 182–183 | Chern character sends the ordered symbol to the ordered Kummer cup product. The source does not make the discarded Chern-class assertion. |
| F04 | `TauCetiRoadmap/EllipticCurveModularity/README.md` at its indexed open head, R29.4, R29.5, R29.6; Loeffler2017 line 24, line 25 and line 27 | Every-prime Tate comparison, modular quotient and modularity are supplied. The coefficient convention is translated to V_λ(f)(1) in weight two. The image conclusions agree with Serre's stated consequences. |
| F05 | Main `TauCetiRoadmap/EllipticCurves/README.md`, Layer 4.5b and Layer 7, especially the explicit real-period integral; Rubin2000 line 2245 and line 2247 | The global equation and total positive period have an owner. Rubin fixes his fundamental period by the differential. The component conversion here is justified by translation invariance, with an explicit integral computation below. |
| F06 | Kato2004 line 4600, line 4609, line 4614 and line 4630, pp. 235–236 | The integral character part, its finiteness and cyclotomic finite generation are the intended objects. The new theorem states the elliptic character-part conclusion, including imprimitive characters and arbitrary positive cyclotomic modulus. |
| F07 | Nakamura2023 line 3749, line 3814, line 3831, line 3840 and line 3853; Rubin2000 line 2433 and line 2455 | Appendix A numbering is the arXiv v2 numbering. Rubin's cited proofs locate the two settled height/control references in §§7.5 and 7.7. Their original texts remain uncertified. |

No new work needed fetching. All used source extracts were read in the operator's cache; no source text was copied into the package. The manifest has 23 distinct lifetime keys. Settled waived and uncertified entries retain their statuses.

## Ownership and pattern checks

Searched objects using `roadmaps grep`, covering indexed open heads and main, and searched the board packages and both pinned libraries. Directly read the relevant modularity head, the regulator package on board main and the Heegner roadmap head. The generic Galois action, cyclotomic Galois identification, integral group ring and Dirichlet series are imported; no competing construction is planned. The new definition only specializes Kato's already-owned integral χ-part to the native elliptic point carrier. No fully qualified declaration name from another roadmap is reused.

`HeegnerPointEulerSystems` requests the number-field adelic theorem from `ArithmeticGaloisRepresentations` through `gap:elliptic-adelic-open-image`. That is a requested supplier extension, not an existing supplier target. This repair retains the existing ℚ-specific deduction in §4.7 from this roadmap's §4.1. Accepting that broader supplier gap would require an ownership decision outside this package. No later roadmap is consumed.

The searches found no remaining criticalSign, ordinaryEulerFactor, discarded Chern-class notation or regulator-gap slug. The affected smoothing, unipotent, parity and regulator-factor Checks all remain mathematical prose. The period conversion was propagated to both downstream formulas and their hypothesis lists. Source usage was compared with the whole README, not just the References.

## Pinned declarations and elaborated signatures

Mathlib is pinned at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti is pinned at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Both checkout revisions match `lake-manifest.json`.

- `WeierstrassCurve.pointGaloisAction`, `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean:47`, acts on the actual base-changed point group by coordinate automorphisms; its multiplication law fixes the order of composition. Its object file already exists, so no build was needed.
- `IsCyclotomicExtension.autEquivPow`, `Mathlib/NumberTheory/Cyclotomic/Gal.lean:77`, requires cyclotomic generation, a nonzero modulus and irreducibility. The theorem supplies them explicitly. `IsCyclotomicExtension`, `Mathlib/NumberTheory/Cyclotomic/Basic.lean:74`, includes generation by roots, not just existence of a root.
- `MonoidAlgebra`, `Mathlib/Algebra/MonoidAlgebra/Defs.lean:76`, stores finitely supported coefficients; `MonoidAlgebra.lift`, `Mathlib/Algebra/MonoidAlgebra/Basic.lean:232`, evaluates them. Their native definitions give the actual integral character kernel. No abstract condition field replaces it.
- `ContinuousCohomology.tateShafarevich`, `Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean:71`, requires a supplied topological representation and local field maps. It is not by itself the classical elliptic Selmer or Tate–Shafarevich carrier. Object searches also distinguish Dedekind-domain Selmer groups and the group-theoretic Iwasawa criterion from the arithmetic carriers needed here.

A scratch copy containing `#check @name` for all four declarations elaborated with exit 0. Compared every resulting type with §7.9:

| Declaration | Explicit binders retained | Comparison |
|---|---|---|
| ellipticCyclotomicFiniteGeneration | W, IsElliptic, full q-expansion modularity hypothesis, m, 1 ≤ m | Unchanged; matches the cyclotomic-tower statement. |
| ellipticRationalPoints_finite | W, IsElliptic, modularity, F, differentiability, agreement on Re(s) > 3/2, nonvanishing at 1 | Unchanged; README and docstring now identify the exact specialization. |
| ellipticCharacterPart | W, IsElliptic, K in an arbitrary universe, Field, DecidableEq, Algebra ℚ K, the actual character | No dropped binder; the real body is the integral annihilator condition. |
| ellipticCharacterPoints_finite | All elliptic and modularity data; nonzero m; K with Field, DecidableEq, Algebra and IsCyclotomicExtension; χ, F and all analytic hypotheses | No dropped binder; nonzero m is equivalent to positive m, and the conclusion is finiteness of precisely the defined set. |

`Suggested.lean` has one `import Mathlib` and the one used pinned Tau Ceti module, one module docstring, one matching layer comment, three headline theorems with `sorry` and one necessary definition with a real body. It has 88 lines, no admitted data, no API or boundary declarations, no examples, no `set_option` and no forbidden commands. The new theorem is Kato's character-part finiteness, not an algebraic consequence of its hypotheses or a defining-property lemma.

## Adversarial mathematics pass

Each row records a statement and actual values or algebraic computations. Linear and ring models test normalizations and implications; they do not assert that arbitrary scalar data are eigenform data. Unchanged targets retain their hypotheses. Rows identifying changes refer to the repairs above.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| Frobenius convention and §2.1 | k=2, r=1, ℓ=3, a₃=2, ε=1 | Geometric factor 1−2u+3u²; arithmetic factor 1−(2/3)t+(1/3)t²; evaluated norm factor at X=1 is 2/3 | Inversion and twists agree | None |
| Full cyclotomic algebra | p=2; O[{±1}] | (1+s)(1−s)=0; (1+s)/2 is absent integrally, present after inverting 2 | Rational projectors do not give integral ones | None |
| Theta norm direction | c=5, multiplication by 2, nonzero 2-torsion point | Coefficients 0 in 25[0]−E[5] and 24 in 25E[2]−E[10] | Direction distinguishes the norm | None |
| Ordered torsion-index action | Row (1/5,0), upper and lower shears | Upper gives (1/5,1/5); lower gives (1/5,0) | Row convention fixed | None |
| Ordered Chern character | Coordinate units on (𝔾_m)², coefficients modulo 3 | ch{x,y}=e₁∪e₂=1; ch{y,x}=−1=2; ch{1,y}=0 | Negative normalization fails | F02; README §1.1 Check |
| Moment twist | (k,r)=(2,1),(4,1),(4,2) | 2−r+(k−2)=1,3,2 respectively; equal to k−r | Both formulas agree | Recomputed for F03 |
| Critical sign convention | (2,1), even/odd χ; (4,2), even χ | (−1)^0(±1)=±1; (−1)^1·1=−1 | Weight factor essential | F03, §§3.3, 5.3 |
| Rational Siegel unit, auxiliary independence | Index fixed by 5 and 7 | Smoothed values 24g and 48g; (24g)/24=(48g)/48=g; 48·24g=24·48g=1152g | Only rationalized value is independent | None |
| Rational smoothing | c=5, g_c=g=1; g=0 | 25−1=24 versus wrong 5−1=4; zero maps to zero | Real formula determines the object | F03 Check wording |
| Siegel pullback | Identity, inverse unit | id*(u)=u; id*(u⁻¹)=u⁻¹ | Constant-one map fails for u≠1 | None |
| Two-coordinate distribution | A=1,2,0 | Fiber sizes 1,4; A=0 has an infinite or empty fiber | Nonzero-isogeny hypothesis necessary | None |
| Siegel analytic exponent | x=0,1/2,2/5 | B₂(x)/2=1/12,−1/24,−11/300; omitted-square version at 2/5 gives −23/300 | Distinguishes exponent | None |
| Cusp order | Width 5, c=11, index (0,1/5) | Smoothed exponent (121−1)/12=10; order in q^(1/5) is 50, not 10 | Width factor required | None |
| Analytic-unit nonzero index | (a,b)=(0,0) | n=0 factor 1−1=0 | Excluded pair cannot define a unit | None |
| One-coordinate degeneracy | A=1,2,4 | Product lengths 1,2,4, versus two-coordinate lengths 1,4,16 | Distinct distribution relations | None |
| K₂ norm projection | (2,3)→(6,9) | Combined prime sets both {2,3}; first-index sets {2} and {2,3} differ | Identity branch inapplicable | None |
| K₂ projection formula | ℚ(i)/ℚ, s=2+i and 1+i | Norms 5 and 2; traces 4 and 2; determinant of multiplication by 2+i is 5 | First example separates trace from norm | None |
| K₂ auxiliary Euler operator | ℓ=3, trivial diamond/Hecke scalar model | Unramified operator 1−1+3=3; ramified operator 1−1=0; moment quadratic coefficient at k=2,r=1 becomes 1/3 | Ramified branch and twist retained | None |
| Eigenform Euler-system adapter | k=2,r=1,ℓ=3,a₃=0 | P(X)=1+X²/3; P(0)=1; repeated-prime norm factor=1 | Constant term and repeated branch correct | None |
| Literal symmetric-power dual | p=2,k=4 | Antidiagonal (−2,1,−2) has determinant −4, valuation 2 | Pairing not perfect over ℤ₂ | None |
| Hecke dual twist | k=4,ℓ=3 | Correct S′ eigenvalue 9ε; omitted prefactor gives ε; (1−k)+k=1 | Weight dependence detected | None |
| Full-level Euler operator | ℓ=3,T′=S′=σ=id; then σ=0 | 1−1+3=3; for σ=0 value=1 | Missing ℓ or constant term fails | None |
| Full-level moment linearity | Literal dual of ℚ, evaluation at 1 | Identity functional gives 1; zero gives 0; evaluations of v+w add | Zero or shifted map fails | None |
| Modular filtration | k=4,i=0,1,2,4; k=2,i=1 | D,M,M,0; gr¹=M/M=0; weight-two critical step=M | Filtration step is not associated graded | None |
| Eisenstein normalization | k=4,index zero | Constant E₄/120=1/120; unnormalized lattice sum has 2ζ(4) | Scalar factor required | None |
| Eisenstein finite Fourier transform | N=3,k=3 | Forward 1/27, inverse 3, square-transform scalar 9; product=1; wrong forward 3 gives 81 | Powers agree with inverse transform | None |
| Eisenstein smoothing and dlog | k=2,c=5,7,index fixed | Factors 25−1=24 and 49−1=48; dlog exponent at x=0 is +1/12, so F² constant is −1/12 | Unit/Eisenstein signs consistent | None |
| Archimedean zeta products | k=4,r=r′=3 | Both branches give −M⁻¹N⁻³/2 times E¹E³ | Branch intersection agrees | None |
| Period-map linearity | Form 0 and scaled form 2ω | per(0)=0; per(2ω)=2per(ω) | Zero and affine-shift models separated by nonzero period | None |
| Real regulator | Units 2,z on 𝔾_m | η=log(2)i dθ; circle integral=2πi log(2); reversed units give its negative; equal units give 0 | Orientation and logarithm term detected | None |
| Admissibility, rational fixed line | Unipotent parameters 2,0 over ℚ | (u₂−1)(a,b)=(2b,0), kernel dimension 1; u₀=id, kernel dimension 2 | Nonzero parameter necessary | F03 Check wording |
| Admissibility, division algebra | d≠1 | (d−1)⁻¹(d−1)v=v; fixed vector equation forces v=0 | Split and division cases differ | None |
| Integral τ-quotient | Parameters 1,p over ℤ_p; 2 over ℤ | Quotients ℤ_p, (ℤ/p)⊕ℤ_p, (ℤ/2)⊕ℤ | Rational nonzero parameter insufficient integrally | F03 Check wording |
| Boundary nonvanishing dictionary | k=3,r=2 and k=4,r=3 | Unitary s=r−(k−1)/2 equals 1 and 3/2 respectively | Boundary and interior differ | None |
| Strict local H² term | T=ℤ_p(2), p odd | Global-local invariants under G_(ℚ_p): 0; under cyclotomic kernel: ℚ_p/ℤ_p; dual local module ℤ_p | Cannot omit the local term | None |
| Integral Rubin hypotheses | Pro-3/pro-2 action on two lines | A homomorphism from a pro-3 group to S₂ has image order 1; pro-2 can have image order 2 | Odd-prime clause retained | None |
| Module structure over semilocal ring | R=ℚ×ℚ, regular versus zero-divisor scalar | (1,0)(0,1)=0, but (a,b)(x,y)=0 with a,b≠0 implies x=y=0 | Regular-scalar torsion definition needed | None |
| Pseudo-null finiteness | ℤ_p[[T]]/(p,T) versus /(p) | Cardinalities p versus infinitely many power-series coefficients; first localizes to 0 at height one, second does not | Residue-field/height hypotheses discriminate | None |
| Regular-annihilator finite-support step | μ=T versus μ=p | R/(T)=ℤ_p has no p-torsion; R/(p)=𝔽_p[[T]] has p·1=0 | μ=p counterexample excluded | None |
| Twist/localization square | κ(γ)=4,j=1; j=0 | Both twists multiply γ by 1/4; wrong local convention multiplies by 4; j=0 gives 1 | Same roots and inverse character required | None |
| Elliptic modularity/Tate comparison | E/ℚ, weight two, coefficient field ℚ | k−1=1; cohomological realization becomes V(f)(1)=V_p(E); dim B=dim M₂(ℚ)=4 | Named suppliers connect the objects | F04 |
| Serre image deduction | H⊂GL₂(ℤ_p), det(H)=ℤ_p× | [GL₂:H]=[SL₂:H∩SL₂]; finite kernel index gives finite full index; kernel index 1 gives full index 1 | Works also at p=2 | F04 |
| Canonical zeta conjugation | One-dimensional sign model, z=id, ι=−1, σ₋₁=1 | z(ι1)=−1=−σ₋₁z(1); positive convention would give 1 | Untwisted minus retained | None |
| Canonical span | z=0 versus z(γ)=1 in rank-one field model | Spans 0 and E respectively | Ambient rank alone gives no nonvanishing | None |
| Smoothed integral finite index | R=ℤ_p[[T]], quotient R/(p,T) | Quotient cardinality p, while every height-one localization is 0 | Finite index need not mean equality | None |
| Critical interpolation | k=2,r=1; k=4,r=2; γ=0 | Signs +1,−1 for even χ; twists 1,2; γ=0 gives both sides 0 | Parity recomputed in Layer 5 | F03 |
| Twist-one morphism | k=2,4 and double sign transport | (1−2)+2=1; (1−4)+4=1; (−id)z(−1)=z(1) | Output twist and positive conjugation correct | None |
| Parabolic exp* injectivity | Projection R⊕R/(T)→R | (0,1) maps to 0; after inverting T the second summand is 0 | Generic injectivity needs torsion-freeness | None |
| Rational parabolic splitting | Matrix (1/2)[[1,1],[1,1]] | Square equals itself; e₁ maps to (1/2,1/2) outside ℤ₂² | Rational splitting gives no integral one | None |
| Perrin-Riou domain | V=ℚ_p(1) versus ℚ_p | Dual-twist crystalline/Fil⁰ dimensions (1,1) versus (1,0) | Standing domain hypothesis excludes latter | None |
| Inverse Gauss sum | Quadratic χ modulo 3 | G=i√3, G⁻¹=−i/√3, GG⁻¹=1; G²=−3 | Inversion cannot be dropped | None |
| Scalar projection normalization | Period scale 2, Betti scale 3 | η scales by 1/2; output scales by 3/2 | Nonzero period needed | None |
| Modular-symbol period dictionary | k=2,r=1; χ modulo 3 | Powers 1 versus (2πi)⁻¹ have ratio 2πi; GG(χ⁻¹)=−3=χ(−1)·3 | Period and Gauss factors agree | None |
| Noncritical unramified factors | k=2,r=1, ε(p)=0, α=1,−1 | Factors 0 and 2 | No undeclared helper is needed | F03 sentence deleted |
| Supersingular factor | y²=x³−x over 𝔽₃ | Four points, a₃=0; α²=−3; (1+α/3)²=2/3+2α/3 | α=2 would force a₃=7/2 | Recomputed §6.4 Check |
| Critical slope | k=2, Mellin transform log_p(s) | Value at 1 is 0; at γ is log_p(γ)≠0 | Critical interpolation lacks uniqueness | None |
| Bad reduction without eigenline | a_p=ε(p)=0 | Polynomial X² has only root 0 | Scalar projection not defined there | None |
| Regulator supplier, dual exponential | V=ℚ_p; V=ℚ_p(1) | dualExp(log κ)=1; on positive twist Fil⁰=0 so dualExp=0 | All-prime dual exponential distinguished from Coleman map | F01 contract |
| Regulator supplier, linear scalar projection | Vector (2,3), first/second functionals | Outputs 2 and 3; doubled first functional gives 4 | No arbitrary normalized projection | F01 contract |
| Regulator supplier, high-conductor domain | η at its center, different torsion component, boundary | Valuation differences ∞,−∞,p^(N−c); membership yes,no,no | Domain is neither empty nor all weight space | F01 contract |
| Regulator supplier, split Coleman augmentation | α=1; nonsplit α=−1,p=5,β=−5 | Trivial multiplier 0; nonsplit multiplier 2/(6/5)=5/3 | Odd-prime augmentation claim is specific | F01 contract |
| Global minimal real period | y²=x³−x versus y²=x³+x | Real cubic roots: 3 versus 1; component counts c_∞=2 versus 1 | Supplier's period includes all components | F05 |
| Primitive/total-period conversion | On (−1,0), substitute x=−1/t | dx/√(x³−x)=dt/√(t³−t); two component integrals equal I, so Ω_E=2I=2Ω_E⁺ | Explicit nonzero component witness | F05 §6.6 Check |
| Euler-system ratio conversion | Scalar model r_E⁺=3, Ω_E⁺=2, c_∞=2 | Old ratio 3/2; new ratio 6/4=3/2; changing period alone gives 3/4 | Numerator must change too | F05 |
| Elliptic local lattice | Odd p logarithm image pℤ_p, index I | Dual lattice I·p⁻¹ℤ_p; I=1,p gives p⁻¹ℤ_p,ℤ_p | Uses local index, not point count | Recomputed §6.6 |
| Dyadic local lattice | y²+xy=x³+1, t=2u | Δ=−433; initial log terms 2u+2u²∈4ℤ₂; dual of 4ℤ₂ is (1/4)ℤ₂, not (1/2)ℤ₂ | Odd-prime formula not extended | None |
| Canonical non-torsion | Zero map and a nonzero canonical component | Span ranks 0 and 1; quotient ranks 1 and 0 | Analytic nonvanishing remains essential | None |
| Cohomological bound | Length triples (2,1,1),(2,1,0),(0,0,0) | 2≤2, 2≰1, 0≤0 | Correction and nonvanishing distinguished | None |
| Cyclotomic descent | Torsion exponent e=p^a, Γ=ℤ_p | eΓ=p^aℤ_p has index p^a; ℤ[1/p] still has rank 1 and torsion 0 without finite generation | Uniform descent supplies the missing step | None |
| Ordinary/multiplicative divisibility | c_∞=2, primitive L_p=2 and r_E⁺=3 in scalar model | Total-period L_p=1,r_E=6; both products=6; ideals (1)=(2) for odd p | Period change preserves odd-prime ideal | F05 §7.4 Check |
| Universal formal-group norms | Finite p-primary quotient ℤ/p^a under norm p | p^a times quotient=0, so inverse-limit image is 0; prime-to-p part already vanishes after p-completion | p-completion matters | None |
| No finite Selmer submodule | Λ/(p,T) | Nonzero module cardinality p, killed by p and T | Torsionness alone is insufficient | Missing carrier named for §7.6 |
| Ordinary control factor | α unit, β=p/α | (1−α)(1−β) and (1−α⁻¹) differ by units; v_p(1−β)=0 | Same p-part occurs on both sides | None |
| Rank-zero cancellation | Common correction valuation a, primitive L-value valuation b | (a+b)−a=b | Cannot drop the factor on just one side | None |
| Rank-zero period conversion | c_∞=2, p=3 versus p=2 | v₃(L/(2Ω⁺))=v₃(L/Ω⁺); v₂ changes by −1 | Odd-prime bound preserved | F05 §7.8 Check |
| Bloch–Kato critical range | k=2,r=1 and k=3,r=1,2 | First equals k/2; latter differ from 3/2 | Central nonvanishing needed only in first instance | None |
| Abelian Kummer comparison | Finite v∤p, pro-ℓ subgroup, ℓ≠p | p is invertible on the pro-ℓ subgroup; finite quotient tensored with ℚ_p/ℤ_p is 0 | Local Kummer condition is zero | None |
| Modular abelian rank-zero conclusion | L(E,1)≠0 versus an infinite-order rational point | Finite Selmer implies rank 0; infinite-order point contributes ℚ_p/ℤ_p, of positive corank | L-value hypothesis cannot be omitted | F06 exact specialization wording |
| ellipticCharacterPart: kernel action | a=0, P=0, P+Q and −P | Actions 0,0,aP+aQ and −aP; if aP=aQ=0 these equal 0 | Set is an integral subgroup | F06 real definition |
| ellipticCharacterPart: trivial group | m=1,G={1},ψ=1 | ℤ[G]=ℤ; character evaluation is injective; I_ψ=0, hence part=all E(ℚ) | Recovers full rational points | F06 Check |
| ellipticCharacterPart: quadratic sign | G=C₂,ψ(σ)=−1; fixed 3- and 2-torsion | I=(1+σ); action on fixed P is 2P; nonzero at order 3, zero at order 2 | Non-example and torsion boundary exclude zero-action/rational-projector models | F06 Check |
| Galois action composition | Permutation coordinate model, s=(12),t=(23) | (st)e₁=e₂, whereas (ts)e₁=e₃ | Nonabelian order inherited from pinned coordinate action | F06 body audit |
| Cyclotomic character orientation | m=5,σ₂:ζ₅↦ζ₅²,χ(2)=i | ψ(σ₂)=i; ψ(1+σ₂²)=1+i²=0; inverse convention gives −i at σ₂ | Character map is the intended one | F06 Check |
| Twisted coefficients | m=5,χ(2)=i; n=0,1,2,5 | Coefficients 0,1,i·a₂,0 | Character is tied to actual elliptic L-coefficients | F06 signature |
| Imprimitive modulus | Trivial χ modulo 5, good a₅=1; split/nonsplit multiplicative | Removed factors 1−1/5+1/5=1, 4/5, 6/5; additive factor=1 | Nonvanishing unchanged | F06 Check |
| Small-prime removed factors | Good q=2,a₂∈{−2,…,2}; q=3,a₃∈{−3,…,3} | (3−a₂)/2≥1/2; (4−a₃)/3≥1/3 | No hidden restriction to large primes | F06 theorem domain |
| Character-part finiteness | m=1; quadratic χ; F(1)=0 | First gives rational-point finiteness; second selects σP=−P; zero value fails hne | Headline covers actual χ-parts, without asserting all E(K) finite | F06 headline |
| Continued L-value uniqueness | Two entire candidates agreeing on Re(s)>3/2 | Difference is 0 on that open half-plane, hence identically 0; values at 1 coincide | Arbitrary continuation value cannot satisfy the hypothesis | F06 analytic binders |
| Cyclotomic-tower headline | m=1,6,0 | m=1 generates ℚ; 6^n divides 6^(n+1); m=0,n=1 gives x⁰=1 for all x, generating ℂ | Positive-modulus hypothesis excludes junk tower | None |
| Elliptic nonsingularity/modularity | y²=x³; zero cusp form | Δ=0 and nonsingular group ≅(ℚ,+), not FG; zero form a₁=0 versus elliptic a₁=1 | Explicit IsElliptic and coefficient hypotheses retained | None |
| Tamagawa index normalization | Rank-one O, z=p⁻¹ | [O:z]=[O:pO]⁻¹<1; a nonzero finite H² has size≥1 | Integral bound cannot allow this denominator | None |

The new character-part definition is not a free predicate: every annihilating element, its complex evaluation and its actual action are computed from the given character and points. Its quadratic positive and negative controls exclude the plausible larger set of all points. A zero character map cannot be supplied as a monoid homomorphism to ℂ because it would send 1 to 0. In the theorem the character is further determined by χ and the cyclotomic power map. No conclusion is included as a hypothesis.

## Required check outcomes

1. **Elaboration:** `lake env lean` on `packages/KatoEulerSystems/Suggested.lean`, run from the pinned content checkout with the file's absolute tool argument: exit **0**. Exactly three expected `declaration uses sorry` warnings, at lines 38, 49 and 73; no other diagnostics. No Tau Ceti build was required and no Lean process remains running.
2. **Signature audit:** the scratch copy with `#check @name` for all four declarations: exit **0**, the same three warnings, and all explicit binders retained. Original theorem types did not change; the new definition and theorem agree with README §7.9.
3. **Dependency direction:** ran the specified `gate --depcheck` with `--name KatoEulerSystems`, the supplied merge order and `--movable`: exit **0**. Exact output:

```text
depcheck: 51 roadmaps, 595 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

4. **Citation resolution:** exit **0**, checked against resolver main `6383577` and 357 indexed open heads. Both “Cross-roadmap citations found nowhere” and “Lean names found nowhere” report **None**. The resolver does not inspect pinned Lake packages on its host; the pin checks and elaboration above supply that verification.
5. **File/manifest checks:** TOML and JSON parse; 23 unique source keys; `gaps` is empty; no stale names identified above; `git diff --check` exits **0**. Only the four permitted package inputs and this required report changed. `metadata.toml` is unchanged. No additional gate failures were supplied in the brief.

## Maintainer consequences

No existing Lean theorem was renamed, deleted or narrowed. The only additions are `TauCetiRoadmap.KatoEulerSystems.ellipticCharacterPart` and `TauCetiRoadmap.KatoEulerSystems.ellipticCharacterPoints_finite`. The character part is an integral annihilator set; it preserves torsion that a complex eigenspace would discard.

Consumers of §§6.6, 7.4 and 7.8, including `HeegnerPointEulerSystems`, should read Ω_E as the total real period and r_E as the correspondingly rescaled integer. For odd p the characteristic ideals, p-unit exclusions and valuation bounds are unchanged. Nothing here supplies a dyadic multiplicative Coleman map or a missing general Selmer carrier. No other roadmap, merge-order file, tooling, pull request or issue was edited. No commit or push was made.
