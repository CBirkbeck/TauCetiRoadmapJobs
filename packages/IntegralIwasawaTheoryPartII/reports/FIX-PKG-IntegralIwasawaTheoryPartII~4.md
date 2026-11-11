# Repair report: IntegralIwasawaTheoryPartII

Review settled: REV-PKG-IntegralIwasawaTheoryPartII~3. All five findings are applied. Mathematical changes are confined to `packages/IntegralIwasawaTheoryPartII/README.md`; the CD14 locator is extended in `packages/IntegralIwasawaTheoryPartII/sources.toml`. No acceptance declaration, section identifier, supplier gap or dependency direction changes.

## F01 (P1) — applied

Strict disagreement density greater than 1/2 → density at least 1/2 in §2.2a. Added the finite joint character quotient argument and the level-25 quadratic-twist Check: densities 1/2, eigenvalues (9, −9) and (1332, 1332). Lin12 line 259 states the strict agreement criterion. The positive-density independence route and §2.6 remain valid.

## F02 (P1) — applied

One ordinary vector per pair → one per admissible tame translate, or zero when the first character is ramified above p (§2.2a). Added the level-6 Check and ramified-character control. Section 2.6 now derives triviality of its tame translate from conductor inequalities; its Needs and Layer 2 Dependencies include conductors. Lin12 line 248 supplies the general translate decomposition.

## F03 (P2) — applied

Single-difference assertion → induction on total logarithmic degree, with auxiliary boxes, all coordinate shifts and both correction terms (§0.8). Expanded the function-space definition and API; added three Checks including c ≡ 88 modulo 121 and c − c = 0. CD14 line 1498 and line 1512 supply the induction; the manifest now includes (87)–(88), pp. 31–32.

## F04 (P3) — applied

The alleged universal extra term → the explicit quadratic-series discrepancy 2L²y′z′ in §4.4. Substitution is computed before imposing the relation; the product and original series have coefficients 4L² and 2L² respectively. DKV16 line 1198 ties the linear formula to πy = y². The theorem under yz = 0 is unchanged; no Lean Check was added.

## F05 (P3) — applied

Deleted both “(on main)” parentheticals from Scope and ownership. ClassFieldTheory Layers 7, 11–13 and Chebotarev Layer 10 retain their references. A whole-README search for branch and review-process wording returns no matches. The sections resolve in `TauCetiRoadmap/ClassFieldTheory/README.md` and `Completed/Chebotarev/README.md`.

## Source verification and mathematical routes

All mathematics and verdicts were checked directly without helpers. Existing legal cached extractions suffice; no new work or source key was needed. Sc93, W86, Br82 and AL13 retain their settled uncertified status and were not requested again.

- Lin12 line 206 gives the coefficient normalization of the translate and line 216 its Hecke commutation; line 226 restricts that paper's discussion to weight at least three. Lin12 line 248 and line 297 give the primitive-pair/translate decomposition. Lin12 line 259 gives the agreement criterion with a strict threshold. The README's weight-two density assertion uses the elementary common-nebentypus argument rather than extending that source's hypotheses silently.
- For character values a, b, a′, b′ with ab = a′b′ = ψ, equality a + bN = a′ + b′N, a ≠ a′, implies N = aa′/ψ. The right side has complex absolute value 1; N = Nλ^(k−1) > 1 for k ≥ 2. Thus equality is precisely equality of both character values. Agreement is a proper subgroup in the finite abelian joint quotient, with density the reciprocal of its index; disagreement is at least 1/2. No inference from a nonexistent strict contrapositive is used.
- The local U polynomial in §2.2a has a unique unit root η(𝔮) exactly when η is unramified there. All other roots have positive valuation or are zero. Taking these ordinary lines at every prime over p preserves the independent prime-to-p translates. NoncommutativeAndEquivariantIwasawa §F.5 and PadicFamilies §5.10 explicitly project using only the primes above p.
- At the tame primes of §2.6, the product character has conductor 𝔫. Both characters are trivial on the local unit filtration at the sum of their conductor exponents, so the product conductor exponent is at most that sum, which in turn is at most the level exponent minus the translate exponent. Consequently every tame translate exponent is zero. This argument also retains characters ramified above p, every totally real degree, and p = 2.
- CD14 line 1376 fixes the action on all coordinates; line 1404 gives the finite tensor-product function space. CD14 line 1474 defines auxiliary boxes, line 1491 states the stronger induction, line 1498 retains all logarithmic shifts, and line 1512 gives the lower-degree correction. Each logarithm occurring in a supported monomial is evaluated on a nonzero coordinate. Zero exponents are omitted; zero-extended supported functions do not require a value for log(0).
- The exact induction identity follows from D(fg) = (Df)g + (π_i f)Dg, where D = 1 − π_i. Here Df is the shell indicator and π_i f = f − Df. In positive degree, each correction monomial has degree at most d − 1, and #J₀ = #J − 1 ≥ d. The exponents outside J₀ remain zero. At degree zero the correction polynomial is zero, with no monomials, so no natural-valued degree-of-zero convention is used.
- DKV16 line 1188 through line 1223 supports §4.4 under πy = y². The negative control deliberately drops that relation. Over the characteristic-zero field E, y′z′ is a nonzero basis monomial and 2L² ≠ 0 whenever L ≠ 0. No zero-ring or characteristic-two instance satisfies these coefficient hypotheses.

## Adversarial mathematics pass

The table records computed values for the numbered statements, standing conventions and each added auxiliary claim. Formal Artin-algebra examples test algebraic assertions, without claiming arithmetic realization of arbitrary analytic orders. All unchanged Checks and worked examples were compared with the repaired definitions; no changed sign, basis, conductor or normalization propagates beyond the places listed in the five verdicts.

| Statement | Instances tried | Computed values on the two sides | Result; change |
| --- | --- | --- | --- |
| Character, Frobenius and rank conventions; §0.1 | ℚ(i), p = 2, 3, 5 | χ(p) = 0, −1, 1; r = 0, 0, 1; inverse character has the same three values | Retained. |
| Reciprocity convention | μ₅ over ℚ₂; units over ℚ₅ | Arithmetic exponent 2 and inverse exponent 3; 2·3 = 1 modulo 5; rec(2) on μ₅ over ℚ₅ has exponent 2 | Retained. |
| Coefficients and projectors; §0.2 | G = C₂, p = 2; u = (2+i)/(2−i) at 5 | ((1−c)/2)² = (1−c)/2 in E; divisor (1,−1); roots of unity map to (0,0) | Rational projector only; retained. |
| Valuation comparison; §0.3 | Rank one and zero | o(u) = 1; rank-one valuation matrix (1); zero-space map 0 → 0 has determinant 1 | Retained. |
| Signed regulator; §0.4 | O = (2), L = (3); diagonal rank two; zero rank | −3/2; 35/6 = 140/24 after simultaneous basis change; empty ratio 1/1 = 1 | Retained. |
| Prime-lift/basis invariance; §0.4 | Conjugate lift; singular logarithm matrix | (−log u)/(1) = log u/(−1); two equal logarithm rows give determinant 0 | Retained. |
| Analytic invariants; §0.5 | D, 6Ds², Ds³ | Normalized rank coefficients 1, 6, 0; first leading coefficient of Ds³ is 1; second derivative of 6Ds² is 12D | Retained factorial and order distinction. |
| Dyadic branch convention | −1 at p = 2 | ω(−1) = −1, principal part 1, logarithm 0 | Retained. |
| Sczech test-form domain; §0.6 | n = 1, empty and singleton tuple; n = 2 | Empty product 1 gives divergent absolute harmonic sum; singleton X₁ gives 0 < abs(x) < t; X₁+√2X₂ has no nonzero rational zero | Retained nonempty arbitrary-length tuples. |
| Smoothed measure/interpolation; §0.6 | F = ℚ, smoothing 3; p = 3, smoothing 2 at weight −1 | (1−3)(−1/2) = 1; (−3)(−2)(−1/12) = −1/2 at full weight, versus principal value 0 | Retained. |
| Smoothing-factor unit; §0.6 | χ₄, p = 2, smoothing 3 | 1+3(−3)^0 = 4 at 0; 1+3/(−3) = 0 at 1 | Germ unit retained. |
| Cap-product convention; §0.7 | C₂ and nonabelian S₃ acting by permuting coordinates | With u = (123), m = e₁, λ = e₁*, both balanced evaluations at u⁻¹e₁ are 0; for m = e₂ both are 1 | Contragredient/inverse balancing retained. |
| Koszul sequence; §0.7 | Rank one, rank two and zero | H₁ of the free rank-one group algebra is 0, H₀ = ℂ_p; successive rank-two quotients ℂ_p[π₂±1], ℂ_p; empty quotient ℂ_p | Retained. |
| Edge isomorphism; §0.7 | Trivial E₊; trivial T-module versus free one | Nonfree trivial coefficient: H₁(T,ℂ_p) = ℂ_p versus target 0; free coefficient: 0 = 0; with E₊ cyclic both H₁ groups equal ℂ_p | Retained freeness hypothesis. |
| Function-space definition; §0.8 | Indicators, shell-supported log, uncut log on the witness | 1 on 𝒪₁ near zero; 1_Δ₂ℓ₂ is 0 near zero; uncut ℓ₂(π₂^n) = −nc is not eventually constant | Explicit finite-product module and support API added. |
| U-stability; §0.8 | Translate an indicator and a logarithmic factor | 1_𝒪(x/π_i) = 1_{π_i𝒪}(x); ℓ_𝔮(x/π_i) = ℓ_𝔮(x) − c_𝔮,i | Retains compact support and constancy; cross shifts kept. |
| Auxiliary box; §0.8 | J = {1}, n = 0, at shell/interior | (1−π₁)1_𝒪₁ = 1−0 = 1 on shell; 1−1 = 0 on inner ball | Base case added explicitly. |
| Shift polynomial; §0.8 | g = ℓ, ℓ², 1; ℓ = 5, c = 2 | Dg = 2; 25−9 = 16 = 2·2·5−4; 1−1 = 0 | Strictly lower-degree monomials; zero polynomial has none. |
| Exact induction identity; §0.8 | d = 2, #J = 3, point in inner box; point on shell | Inner point: 16−16+0 = 0; shell: 25−16+16 = 25; 1 < #J₀ = 2 | Correction signs and induction cardinality verified. |
| Arithmetic two-coordinate witness; §0.8 | √5 = 48 modulo 121 at second 11-adic place | 48² = 5 modulo 121; 52^10 = 100 modulo 121; log(52) = 22; 4·22 = 88 | Shift nonzero. |
| Generator/conductor conditions; §0.8 | π₁, π₂, H = F(√−2) | π₁π₂ = 14641 = 11⁴; π₁ ≡ π₂ ≡ 1 modulo 8; −2 ≡ 9 = 3² modulo 11 | Two exceptional primes; r = 2. |
| Corrected augmentation expression; §0.8 | (π₁,1), (1,12), and (0,1) | Corrected values 88−88 = 0, 11−0 = 11 modulo 121, and 88−88 = 0; target values 0, 11, 0 | Both primitives belong to C_c^♭. |
| All-prime lower bound; §0.8 | k = 0, r = 1; k = 1, r = 2; r = 0 | Augmentation classes 0 and 0, so cap products 0; at rank zero order bound is ≥ 0 with no vanishing demanded | Theorem retained with corrected route. |
| Order boundary; §0.9 | Ds^r, Ds^(r+1) | Orders r, r+1; normalized rank-r coefficients 1, 0 | Both directions retained. |
| Restricted cohomology; §1.1 | Zero class; χ = −1, v = 2; ℤ_p with trivial action | Coboundary value −4 but class 0; at exceptional primes value 0; continuous inclusion ℤ_p → E is nonzero | Correct topology retained. |
| Kummer local condition; §1.2 | ℚ_p multiplicative completion; rank zero | Rationalized valuation and principal-unit coordinates E ⊕ E; odd ordinary-unit component 0 | Completion before scalar extension retained. |
| Duality orthogonality; §1.3 | Rank-one O = 2, L = 3, (x,y) = (−3,2); empty sum | −3·2 + 2·3 = 0; empty sum 0 | Retained. |
| Reciprocity orthogonality; §1.4 | Principal divisor of u; same local coefficients | Divisor contributions 1+(−1) = 0; local evaluation sum −6+6 = 0 | Retained inverse-Artin convention. |
| Inertia injectivity; §1.5 | R empty; finite unramified quotient of order m | m·f(g) = f(g^m) = 0 forces f(g) = 0 in E; source zero when R empty | Retained. |
| Cyclotomic coordinates; §1.6 | 2o+3ℓ and zero | Coefficients (2,3) and (0,0); on units o = 0 but ℓ(1+p²) ≠ 0 | Retained. |
| Dimension; §1.7 | r = 0,1,2 with invertible O | Dimensions 0, 2−1 = 1, 4−2 = 2; logarithmic-coordinate kernel dimension 0 | Retained. |
| Greenberg invariant; §1.8 | (2)/(3), diagonal rank two, rank zero | 2/3; 10/21 = 40/84; 1 | Retained. |
| Regulator comparison; §1.9 | O = 2, L = 3, X = −3, Y = 2 | XO+YL = −6+6 = 0; X/Y = −3/2 = −L/O | Retained. |
| Weight coordinate; §2.1 | k = 1; first-order variation; f(s) = cs | ν₁(T) = 0; derivative of π is 1, of T is log u; f(1−k) has linear coefficient −c | Retained. |
| Eisenstein dictionary; §2.2 | Divisor sums at prime q and square; adjoining q to modulus | c(q) = 1+χ(q)Nq^(k−1); c(q²) = 1+a+a²; stabilization subtracts aB_q | Retained and compatible with repaired ordinary description. |
| Primitive translate basis; §2.2a | Level 8, k = 4 | Diagonal coefficients 1,1,1,1, determinant 1; imprimitive duplicate coefficients 1,0,28,0,126 | Retained indexing. |
| Density; §2.2a | Level 25 quadratic twist; identical pair; cyclic quotient of order 3 | Disagreement 1/2; identical pair disagreement 0; index-three agreement 1/3, disagreement 2/3 | Lower bound corrected, distinctness essential. |
| Density weight boundary | Reversed pair at weight 1 versus weight 3, χ₄ at 3 | Weight 1: 1−1 = −1+1 = 0; weight 3: −8 versus 8 | k ≥ 2 maintained. |
| General ordinary basis; §2.2a | Level 6, k = 4, p = 2 | g coefficients at 1,3: (1,28); B₃g: (0,1); determinant 1; U₂ eigenvalues 1,1 | All tame translates retained. |
| Local U roots; §2.2a | p = 2, m = 1,2 | (X−1)(X−8); X(X−1)(X−8); unit-root multiplicity 1 in each fixed tame block | General formula retained. |
| Ramified first character; §2.2a | χ₄ at p = 2, k = 3 | U₂ eigenvalues 1+0 = 1 and 0+4 = 4; ordinary dimensions 1 and 0 | Added negative control. |
| Weight-two corrected series; §2.2a | Level 11 | One corrected Eisenstein direction plus one cusp direction: dimension 2; two uncorrected translates would give excess dimension 1 | Retained. |
| Ventullo family; §2.3 | k = 0, shifted k = 1 | Positive coefficients 0, every standard constant 1; shifted coordinate u⁻¹−1 equals ν₀(T) | Retained. |
| Case division; §2.4 | s = t and s = t+1, w = −1 | ord W = 0 and 1; inverse orders 0 and −1; w = −1 ≠ 0 | Retained. |
| Semi-cusp constants; §2.5 | Case 1, d = [F:ℚ] | 2^(−d)ℒ − 2^(−d)Dℒ/D = 0; correction signs at s = 1,2 are −aπ, +aπ² | Retained. |
| Minimal tame translate; §2.6 | Conductor exponent n = 0 or 2 | n ≤ a+b ≤ n−t forces t = 0, a+b = n; at level 6 with trivial conductor the excess tame factor is 3 | Minimal-level premise made explicit. |
| Normalized separation; §2.6 | Level-11 T₂, zero operator | Eisenstein 3−3 = 0, cusp −2−3 = −5; normalization sends E₁ to E₁, whereas t = 0 sends it to 0 | Retained. |
| Case 1 algebra; §3.1 | r = s = 1; r = 1,s = 2 | ε = aπ, π² = 0, dimension 2; ε = −aπ², nonzero but cotangent class 0 | Retained. |
| Case 2 algebra; §3.2 | r = s = 1, w = 1 and −1 | w = 1: y = π/2, ε = aπ/2; w = −1: π = 0, ε = −ay, z = −y ≠ 0 | Retained. |
| Case 3 algebra; §3.3 | r = t = 1,s = 2 | c = −a/b, y = cπ², ε = −aπ² = by | Retained signs. |
| Case 1 normal form; §3.4 | r = 2,s = 3 | Dimension 2²+3−1 = 6; π² survives modulo 𝔪³ | Retained. |
| Case 2 normal form; §3.5 | r = 2,s = 3; w = −1 | Dimension 2²+6−2 = 8; z³ = −y³ ≠ 0 at w = −1 | Retained. |
| Case 3 filtrations; §3.6 | r = t = 1,s = 2 | Dimension 3; y modulo 𝔪² = 0, but yW/y²W = E·cπ² ≠ 0 | Retained. |
| Fourier orbit/Y; §3.7 | χ(q) = 1 or −1, Nq ≥ 2 | Denominator 0 or 2log_p(principal Nq) ≠ 0; Y²−πY = 0 | Retained. |
| Hecke image Case 1; §3.8 | r = s = 1 | W₁ dimension 2; U_p = 1+aπ and ε = aπ | Retained after tame multiplicity repair. |
| Hecke image Case 2; §3.9 | r = s = 1, w = 1 or −1 | Tame U-image at w = 1 is 1+(log principal Nℓ)π/2; at w = −1, π = 0 while z = −y ≠ 0 | Retained. |
| Hecke image Case 3; §3.10 | r = t = 1,s = 2 | Image basis 1,π,π²; Y = cπ²; truncation order 2s−t = 3 = s+1 | Retained. |
| Actual representations; §4.1 | Complex conjugation, p = 2 | Determinant −1, trace 0, eigenvalues 1,−1 in E; signs coincide only after reducing at ϖ_E | Retained characteristic-zero residue. |
| Coefficient-ring completion; §4.1 | y²−T²(T+p) | Prime-chain length 2; height-one localization dimension 1; completed polynomial (y−Ts)(y+Ts); total fractions E((T))² | Retained. |
| Good element; §4.2 | diag(1,−1), ordinary line (1,1) | Eigenvalue difference −2 ≠ 0 in E at p = 2; both line coordinates 1 ≠ 0 | Retained. |
| Upper cocycle; §4.3 | χ(g) = −1, χ(h) = 1, b(g) = 2,b(h) = 3 | b(gh) = 5; κ(gh) = −5 = −2−3 | Retained χ⁻¹ twist. |
| Nonfree module; §4.3 | B = (x,y) over E[[x,y]] | Dimension of B/(x,y)B is 2; rank over fraction field is 1 | Retained finite-module generality. |
| Infinitesimal characters; §4.4 | A = 3, yz = 0; identity; y = 0 | (1+3y)(1+3z) = 1+3π; value at identity 1; at y = 0 pair (1,ε) | Main theorem retained. |
| Substitution negative control; §4.4 | y′² = z′² = 0, L = 1 | Product 1+2π+4y′z′; ε(π) = 1+2π+2y′z′; difference 2y′z′, versus alleged 4y′z′ | Check corrected. |
| Refined diagonals; §4.5 | τ = diag(1,−1) | Two-trace system determinant −2; a+d alone unchanged by (a,d) ↦ (a+t,d−t) | Retained second trace. |
| Local basis comparison; §4.6 | Matrix ((2,1),(0,3)), line (1,1) | Upper formula 1 = 3−2; lower formula 0 = 3−3; comparison coordinates both 1 | Retained. |
| Restricted ramification; §4.7 | χ = −1, local comparison value 2 | κ = (1−χ⁻¹)2 = 4, coboundary of −2; finite torsion image 0 | Retained. |
| Inertia generation; §4.8 | Quotient cocycle a coboundary, χ(τ) = −1 | κ(τ) = −2v = 0 implies v = 0; quotient modulo maximal ideal 0 | Retained Nakayama route. |
| Second-order bound; §4.9 | Â = E[[t]], α = t⁻¹ | α𝔪 = E[[t]], α𝔪² = tE[[t]]; multiplying B ⊆ E[[t]] by 𝔪 gives tB ⊆ tE[[t]] | Retained nonintegral α. |
| Exact determinant; §5.1 | Weighted rows 2,3; columns (3t,−2t),(6t,−4t) | Weighted column sums 0,0; determinant −12t²+12t² = 0 before specialization | Retained. |
| Leading comparison; §5.2 | r = s = 2, O = diag(2,3), L = diag(5,7) | 35z²+6(−35z²/6) = 0; regulator 35/6 | Retained. |
| Lower cocycle; §5.3 | χ(g) = −1,c(g) = 2,c(h) = 3 | c(gh) = 2−3 = −1; ε−ε_z = ε_y−1 from yz = 0 | Retained; no use of false negative control. |
| Inverse comparison; §5.4 | r = t = 1,s = 2,O⁻ = 2,L⁻ = 3 | (3+2b)y = 0 with y ≠ 0 yields b = −3/2; y² = 0 | Retained y-adic line. |
| Rank zero; §5.5 | χ₄, p = 2 and 3 | f(0) = D = 1/2 and 1 respectively; normalized value 1 = empty regulator | Retained. |
| Gross–Stark; §5.6 | χ₄,p = 5; zero rank | Derivative −log₅(u)/2 = D·R₅; at rank zero D = D·1 | Headline unchanged. |
| Exact-order equivalence; §5.7 | Ds^r and Ds^(r+1) | Orders r and r+1; regulator coefficients 1 and 0 | Both implications retained. |
| Rank-one nonvanishing; §5.8 | u = (2+i)/(2−i) | Conjugate valuations (1,−1); u^N = ζ5^k would require N = k and −N = k, hence N = k = 0 | Nonzero logarithm for N ≥ 1; algebraic Baker–Brumer scope retained. |

## Ownership, citations and pins

Read the opening and ownership structures of the main ClassFieldTheory, LFunctions and ModularForms roadmaps. Ran the prescribed `roadmaps grep` by mathematical objects over the indexed open heads and main, and searched board packages. Read the closest suppliers' scope/ownership and relevant sections: IntegralIwasawaTheory, NoncommutativeAndEquivariantIwasawa, PadicFamilies, EulerSystemsCyclotomicMainConjecture, and OrdinaryAutomorphicFormsAndModularityLifting. The repaired claims refine this package's existing §§0.8 and 2.2a. They do not construct a second ordinary projector, form carrier, character series, density theorem or Koszul complex. The general totally real primitive-pair complement remains owned here; the elliptic case is imported.

Cross-roadmap locators were resolved against main or the indexed open heads:

| Supplier | Sections consumed and inspected |
| --- | --- |
| ClassFieldTheory | Layers 7, 11–13; former §2.6 maps explicitly to Conventions C.6. |
| Chebotarev | `Completed/Chebotarev/README.md`, Layer 10, the named Frobenius density theorem. |
| LFunctions | Layers 5 and 7, finite-order Hecke continuation and intrinsic nonvanishing. |
| ModularForms | §0.1, including the corrected weight-two series and character-space decomposition. |
| IntegralIwasawaTheory | Conventions, §§0.1, 0.4, 4.2, 6.0, 6.3, 9.3. |
| ArithmeticGaloisDuality | §§R02.1.3, R02.2.3, R02.3.3, R02.4.2, R02.4.3, D7.6, D7.7. |
| DirichletPadicLFunctions | §0.6, normalized Iwasawa logarithm and finite-extension norm comparison. |
| IntegralHeckeAndGaloisDeterminants | §§1.3, 1.4, 4.1; `Determinant.eq_of_charpoly_frobenius` is a supplier target in §4.1, rather than a pinned-library declaration. |
| NoncommutativeAndEquivariantIwasawa | §F.5, coefficient-family construction, operators and ordinary projector. |
| PadicFamilies | §§5.9a–5.13, Hilbert presentation, Fourier injection, minimal-tame-level reducedness, eigenfamily fields. |
| OrdinaryAutomorphicFormsAndModularityLifting | §2.12(a,b), character series and Hilbert-family representations. |

Pinned source inspection confirmed the primitive-pair carrier in `TauCeti/NumberTheory/ModularForms/EisensteinSeries/Subspace.lean:81`, character-space independence in `Independence.lean:128`, and complement in `Dimension.lean:204`, with weight hypothesis k ≥ 3. Also inspected `TauCeti/RingTheory/KoszulComplex/Regular.lean:140` and Mathlib's weak-regularity definition in `Mathlib/RingTheory/Regular/RegularSequence.lean:136`. Weak regularity does not assert nonzero final quotient; this package computes that quotient as ℂ_p. The continuous H¹ quotient in `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:829` is a cocycle quotient, whose inherited topology is not being used. The presented complex Hecke function in `TauCeti/NumberTheory/LFunctions/Hecke/Basic.lean:74` exists, as the acceptance docstring says.

Object searches at the pinned Mathlib and Tau Ceti found no Deligne–Ribet branch, Sczech cocycle, ordinary Hilbert coefficient-family carrier or normalized global Iwasawa-log carrier making the documented headlines statable. No new declaration duplicates a pinned result or another roadmap's name.

The supplied overlaps report records no conflicting edit, dropped citation or id defined only by an open revision. Its closest roadmaps were read as above. A fresh `roadmaps overlaps IntegralIwasawaTheoryPartII` returned exit 1 with “no roadmap IntegralIwasawaTheoryPartII on main or in an open roadmap pull request”; this command's index does not identify the package. The supplied head-based overlaps report therefore remains the evidence for its overlap status. No other remote checkout was sought.

The five existing gap slugs each still match a top-level design gap and a README supplier contract: dyadic-hilbert-coefficient-families, dyadic-hilbert-hida-localization, hida-family-representations-all-degrees, p-ramified-hilbert-coefficient-families, p-ramified-hilbert-hida-localization. No finding requires an additional supplier target or gap.

## Required checks and maintainer notes

- **Elaboration:** ran the prescribed `lake env lean` on `packages/IntegralIwasawaTheoryPartII/Suggested.lean` from the pinned content checkout, using its required absolute command argument. Exit 0, empty output, no errors or warnings. No TauCeti import is present, so no targeted module build was needed. No Lean process remains running.
- **Elaborated signatures:** the exhaustive declaration scan contains zero definitions, instances, theorems, opaque declarations or examples. The requested collection of `#check @name` commands is empty; there is no signature to elaborate, compare or lose a section binder. `Suggested.lean` is unchanged, uses only `import Mathlib`, and has no option overrides or admitted data. Its docstring still names each unstatable headline and its missing carriers. No API lemma or boundary example was added.
- **Dependency direction:** the prescribed command, with the supplied configuration, order, content, name and `--movable`, returned exit 0 and exactly:

```text
depcheck: 236 roadmaps, 2141 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The order file was not edited.

- **Citations:** `roadmaps resolve` returned exit 0, no missing cross-roadmap citations and no missing Lean names. Its automatic library phase reports that it lacks pinned Lake packages; the local pin checks above were performed separately.
- **Boundary computations:** independently recomputed the finite character classes, U₂ coefficient columns, the 11-adic logarithm modulo 121, and the quadratic nilpotent expansion. The values are recorded above and in the README Checks. The symbolic induction identity was also evaluated in degree two, so its verification does not stop at k = 0 or 1.
- **Files and manifest:** `git diff --check` passes. TOML parses with nine sources and nine unique keys; no provenance or settled access status changed. README searches find no remaining branch/review-process parentheticals. The five design gaps are unchanged and matched. Metadata and the remainder of the design plan are unchanged.
- **Gate failures supplied in the brief:** none beyond the five review findings. No tooling or merge-order change was made.

For downstream maintainers: all section ids and acceptance names are preserved. Consumers of the general ordinary Eisenstein statement must retain tame translates; the minimal-tame-level construction of §2.6 and the three Hecke-image headlines keep their conclusions. There is no commit, push, pull-request edit or external message.
