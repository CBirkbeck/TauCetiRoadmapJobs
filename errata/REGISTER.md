# Mistakes found in published sources

Reviewers and red-team passes record every mistake they find in a source while checking a roadmap's locators: misprints (slips whose intended meaning is clear), errors (a false statement or proof step) and gaps (a step the source does not justify), each with the roadmap, the board pull request and the head that reported it. Collected by the board sync from the `## Source issues` sections of review and red-team comments; the data is in `errata/source-issues.json`.

96 mistakes recorded on the board: 50 misprints, 37 errors, 9 gaps.
The explorer's register (to 2026-10-21) holds 15335 more, kept in `errata/explorer/`: 1525 awaiting review, 13582 confirmed, 228 rejected.

## Andreatta–Iovita–Pilloni, The adic, cuspidal, Hilbert eigenvarieties (2016)

- **Misprint** at §4, a later reference to Lemma 4.2 (cached extraction line 723): the source says Lemma 4.2 (an ideal estimate) under a wrong label; it should be cited as Lemma 4.2; affects nothing. Found by  (#167 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Asakura–Miyatani, Milnor K-theory, F-isocrystals and syntomic regulators, arXiv:2007.14255v2

- **Misprint** at Definition 2.1 (cached line 138): the source says the comparison is an isomorphism of B†_K-algebras; it should be an isomorphism of B†_K-modules; affects nothing. Found by  (#47 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Lemma 2.19, p. 14: the source says the acyclicity lemma for smooth schemes with no affineness assumption, which a proper elliptic curve (H¹(O)=K) refutes; it should be stated for affine schemes, as its proof, which starts from an affine embedding, assumes; affects a stated result. Found by  (#47 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Gap** at equations (2.3)–(2.7), pp. 6–7: the source says the evaluation of extensions may identify H⁰ with Q_p, which is unjustified on a disconnected base; it should be carried out with the distinguished class 1, without that identification; affects the proof. Found by  (#47 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Atobe–Kondo–Yasuda, Local newforms for the general linear groups over a non-archimedean local field, Forum Math. Pi (2022)

- **Misprint** at proof of Proposition 3.7, definition of the lattice paths, p.20: the source says the paths end at the vertex [a,1]; it should be [1,r] (for r=3, a=1 the path runs (2,1),(1,1),(1,2),(1,3)); affects nothing. Found by  (#173 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Bakker–Klingler–Tsimerman, Tame topology of arithmetic quotients and algebraicity of Hodge loci, J. Amer. Math. Soc. 33 (2020), arXiv:1810.04801

- **Misprint** at Appendix A.1–A.2, pp.19–20: the source says the chart transition maps are ψ_j∘φ_i⁻¹; it should be φ_j⁻¹∘φ_i; affects nothing. Found by  (#164 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Bary-Soroker–Koukoulopoulos–Kozma, Irreducibility of random polynomials: general measures, arXiv:2007.14567v3

- **Error** at proof of Lemma 12.5, pp.60–61: the source says the finite sum of reciprocals of small-prime-smooth integers below the cutoff equals the full Euler product; it should be an inequality (at most the product): for the prime set {2} with cutoff 2 the sum is 1.5, the product 2; affects the proof. Found by  (#171 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at §12.2, Lemmas 12.7–12.9, p.62 (cached extraction line 3836): the source says a cutoff comparison in the exclusion argument pointing the wrong way; it should be the reversed comparison; affects the proof. Found by  (#171 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Gap** at §12.2, the imprimitive exclusion after Lemma 12.9, pp.62–63: the source says a short companion part is used without control, while the anatomy event of Lemma 12.6 gives only one witness per r; it should be controlled, e.g. by a separately proved four-witness (five in the middle range) strengthening; affects the proof. Found by  (#171 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Besser, p-adic Arakelov theory, arXiv math/0301029v1

- **Misprint** at Proposition 3.4, p. 8: the source says the principal-divisor reciprocity informally so that it includes f=0; it should be restricted to nonzero f; affects a stated result. Found by  (#96 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Besser, p-adic heights and Vologodsky integration, arXiv:1711.06957v1

- **Misprint** at Proposition 4.12(4) and its proof, pp. 15–16: the source says the displayed Frobenius and monodromy identities with inconsistent subscripts on the pairing; it should be one pairing used consistently; affects nothing. Found by  (#96 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Beuzart-Plessis–Chaudouard–Zydor, The global Gan–Gross–Prasad conjecture for unitary groups: the endoscopic case, arXiv:2007.05601v1

- **Misprint** at §10.3, pp. 90–92 (closing sentence, cached line 4945): the source says the order of the component group S_Π with an inverted sign in the exponent; it should be |S_Π| = 2^(dim a_P), the coefficient being its inverse 2^(−dim a_P); affects nothing. Found by  (#521 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Boxer–Calegari–Gee–Pilloni, Abelian surfaces over totally real fields are potentially modular, arXiv:1812.09269

- **Misprint** at §2.8, display after (2.8.5), p.37: the source says an alternating-sign exponent in the L-function conventions with a wrong value; it should be the corrected exponent (the review confirms the misprint but does not restate it); affects a stated result. Found by  (#169 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Boxer–Pilloni, Higher Coleman theory, arXiv:2110.10251

- **Gap** at §§6.2–6.3 (analytic induction and distribution model versus the family statement): the source says the construction is made for uniform affinoid coefficient algebras only, yet states the family result for general coefficients; it should be either kept uniform or extended via a defining Banach norm (the sup-norm loses ε in E[ε]/(ε²)); affects a stated result. Found by  (#167 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Bruinier–Funke, On two geometric theta lifts, arXiv math/0212286v4

- **Misprint** at Lemma 3.1: the source says the image of the Fourier mode H(2πnv)e(nu) carries a factor −2v^(2−k); it should be the formula without that factor, which is what direct differentiation produces; affects a stated result. Found by  (#540 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Burns–Venjakob, On the leading terms of zeta isomorphisms and p-adic L-functions in non-commutative Iwasawa theory, Doc. Math. (2006), arXiv:math/0511672

- **Error** at Remark 5.6, published pp.194–195: the source says a pairing on an unshifted complex, which is not well typed; it should be the pairing on the correctly shifted complex; affects a stated result. Found by  (#169 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Burungale–Castella–Grossi–Skinner, Non-vanishing of Kolyvagin systems and Iwasawa theory, arXiv:2312.09301v2

- **Gap** at Proposition 2.2.1 and Theorem 2.2.2, p.17, with Lemma 2.2.4, p.18: the source says the exact paired Selmer length holds for all p≥3, but its proof invokes the rigidity Lemma 2.2.4, stated only for p>3; it should be supplemented by a separate rigidity argument at p=3, or restricted to p>3; affects the proof. Found by  (#159 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Böckle–Iyengar–Paškūnas (BIP), Zariski density of crystalline points, Forum Math. Pi

- **Error** at the proof of Theorem 6.8, p. 49 (arXiv line 2781): the source says the whole support of a nonzero test module lies in one component, which does not follow, since a support can meet two components (e.g. Spec L[x,y]/(xy)); it should be a component chosen through a point of the fixed-ψ fibre, which suffices for the argument; affects the proof. Found by  (#252 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Böckle–Iyengar–Paškūnas (BIP), Zariski density of crystalline points, Forum Math. Pi (arXiv v2 numbering)

- **Error** at Lemma 6.5, pp. 47–48 (proof step at arXiv lines 2714–2715): the source says the printed character ψ fails the step at the uniformizer: for F=ℚ₅ with κ(5) the Teichmüller lift of 2, ψ(5)=1 whereas κ̄(5)=2; it should be a corrected choice of ψ compatible with κ̄ at the uniformizer, as the repaired step requires; affects the proof. Found by  (#252 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Calegari–Garoufalidis–Zagier, Bloch groups, algebraic K-theory, units, and Nahm's conjecture, arXiv:1712.04887v3

- **Error** at Definitions 1.1 and 2.1 and Lemma 2.2, pp.2 and 8–9 (projective exterior convention): the source says the five-term relation subgroup C lies in the kernel A of the exterior boundary, with B=A/C; it should be the quotient by C∩A: over ℚ, [2]+[1/2]−[1] has boundary 2∧(−1)≠0; affects a stated result. Found by  (#162 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at Lemma 4.1, Proposition 4.2 and Remark 4.3, pp.21–23: the source says the detection map by reduction at infinitely many primes takes values in a direct sum of the local groups; it should be a direct product, since a nonzero class is nonzero at a positive-density, hence infinite, set of primes; affects a stated result. Found by  (#155 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Calegari–Garoufalidis–Zagier, Bloch groups, algebraic K-theory, units, and Nahm's conjecture, published version (Ann. Sci. ÉNS, doi 10.24033/asens.2537)

- **Error** at Definition 2.1/Lemma 2.2, printed p.391: the source says the comparison from Suslin's Bloch group onto the new negative-unit presentation is surjective for every field; it should be restricted to larger fields: B(𝔽₂)=0 while the new group over 𝔽₂ is ℤ/3; affects a stated result. Found by  (#162 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Calegari–Garoufalidis–Zagier, Bloch groups, algebraic K-theory, units, and Nahm's conjecture, published version (doi 10.24033/asens.2537)

- **Error** at §4.2, Cartan comparison: the source says an integral order q²−1 for the relevant H₃ group; it should be true only after inverting the characteristic: the integral orders at q=2, 3, 4, 5 are 6, 24, 30, 120, against 3, 8, 15, 24; affects a stated result. Found by  (#162 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Diao–Rosso–Wu, Perfectoid overconvergent Siegel modular forms and the overconvergent Eichler–Shimura morphism, arXiv:2106.00094v3

- **Misprint** at Corollary 3.6.13, pp.46–47: the source says a range for w that lacks the n−1 term (with a further supremum issue); it should be Proposition 3.6.12's range c_g+n−1<w≤n; affects a stated result. Found by  (#167 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Dolgachev–Keum, Finite groups of symplectic automorphisms of K3 surfaces in positive characteristic, arXiv math/0403478v5

- **Error** at the proof of Lemma 4.3 (cached lines 643–647): the source says an automorphism of order at most 2 of a free ℤ_ℓ-module acts trivially mod 2, false (the swap matrix on ℤ₂²); it should be an argument that tracks the integral extension terms, since (4.9) alone gives no bound on ρ(X); affects the proof. Found by  (#563 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at the proof of Theorem 3.3, p. 13 (cached lines 511–520): the source says only orders 11 and 15 survive as extra rank-20 candidates, but n=14 with (a₂,a₇,a₁₄)=(1,1,1) satisfies every relation; it should be a list that includes 14, excluded like the others (root lattice A₁₃⊕A₆⊕A₁, square discriminant 196); affects the proof. Found by  (#563 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Emerton–Paškūnas (EP), density of supercuspidal points of fixed regular weight in local deformation rings, published pp. 337–371

- **Error** at Lemmas 2.6 and 2.9 (pp. 342–344) and Corollary 3.2 (p. 351): the source says the capture statements without excluding W=0; then {0} would capture O[[K]]≠0, false (witness M=O, H={1}, W=0); it should be stated with the hypothesis W≠0; affects a stated result. Found by  (#252 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Fouquet–Wan, The Iwasawa main conjecture for universal families of modular motives, arXiv:2107.13726v3

- **Error** at proof of Lemma 3.13: the source says rank-one coinvariants follow from an arbitrary integral lift of a nontrivial residually unipotent element; it should be a genuine unipotent with a unit off-diagonal entry: the lift [[1,1],[ϖ,1+ϖ]] has det(g−1)=−ϖ and torsion coinvariants; affects the proof. Found by  (#165 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Fu (fu24), Annals of Math. 200

- **Gap** at Theorem 3.2, the PBW growth estimate, pp. 8–11 (argument at arXiv line 537): the source says the estimate across the whole weight strip, but the argument proves it only for k≥α; it should be supplemented by an argument covering the remaining weights of the strip; affects the proof. Found by  (#241 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at Theorem 5.1 (arXiv lines 782–785): the source says Theorem 5.1 for weights λ beyond those its argument covers; at p=3, λ=1 the quantity 2λ+1=3 is not a square in ℚ₃; it should be restricted to induced weights λ, for which the relevant value is (μ+1)²; affects a stated result. Found by  (#241 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Gan–Gross–Prasad, Symplectic local root numbers, central critical L-values, and restriction problems, arXiv:0909.2999v1

- **Misprint** at §18, pp. 71–75 (change-of-μ formula, cached line 2627): the source says the twisted representation is π·μ0⁻¹; it should be the twist consistent with the relation ν_{μ′} ≅ μ0·ν_μ stated just before (line 2623); affects a stated result. Found by  (#521 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Garoufalidis–Scholze–Wheeler–Zagier, The Habiro ring of a number field, arXiv:2412.04241v2

- **Error** at Definition 1.1, (13)–(15) and Remark 1.2, pp.6–7: the source says the components of the arithmetic Habiro ring are domains, without qualification; it should be restricted to K∩ℚ(ζ_d)=ℚ: for K=ℚ(i), d=4 the element (1−i⊗ζ₄)/2 is an idempotent other than 0 and 1; affects a stated result. Found by  (#155 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Example 4.3, (270)–(275), p.54 (cubic-field example, factor degrees 2 and 1): the source says one exponent of the root in the cubic relation with a wrong value; it should be the corrected exponent (2, the value the review's check uses); affects nothing. Found by  (#168 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Example 4.4, (289)–(290) (rational quadratic Gauss family): the source says the companion Gauss value at order m=4 is +2; it should be −2 (the companion values at m=1,…,4 are i, 0, −i, −2); affects nothing. Found by  (#152 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Lemma 2.3, equation (67): the source says the u-term of the root expansion U_m with a sign that is wrong; it should be +(m−1)/(2m), as the q=−1 expansion of (T;q)_∞, U=(1+T)^(−1/2)=1−T/2+…, shows; affects a stated result. Found by  (#152 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at Lemma 3.1, Propositions 3.2–3.3, (177)–(178), pp.38–39: the source says the residue values of the finite-field dilogarithm span, by an argument that excludes the value zero; it should be argued separately for the prime field (zero occurs: over 𝔽₅ the values are 1, 4, 0) and by spans of differences otherwise; affects the proof. Found by  (#168 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Proposition 2.2, equation (56), p.19: the source says the logarithmic Frobenius defect of the infinite Pochhammer symbol has residue +p·Li₂^(p)(ζ) in the coordinate x=q−1; it should be −p·Li₂^(p)(ζ), as the source's own (48)–(49) force (the two differ mod 25 at p=5, ζ a cube root of unity); affects a stated result. Found by  (#155 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Theorem 8, (163)–(171): the source says the ordinary Hessian of the potential is used; it should be the logarithmic Hessian (at A=0, z=1−t they differ: −t/(1−t) against −1/(1−t)); affects a stated result. Found by  (#152 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at Theorems 11–12, displays (215)–(231), finite constant-term formula: the source says the constant root coefficient of the normalised symmetrisation is 1/(m^N δ_A(t)) times a finite sum over the m-th roots; it should be multiplied by an extra factor ∏T_i^(m−1), T=t^(1/m): at A=0, N=1, m=2 the printed form gives (1+T⁻¹)/(1−T²), not 1/(1−T); affects a stated result. Found by  (#152 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at the footnote on p.6 (against display (13)): the source says the scalar attached to order m for an abelian field without inverting the Artin exponent; it should be the inverse exponent that (13) forces (for ℚ(ζ₅), p=2 the scalar at m=2 is ζ₅³); affects nothing. Found by  (#155 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at §2.4, Theorem 7 and level formulas (92)–(109): the source says level-m restricted coefficients lie in a smaller coefficient ring which, at m=2, does not invert Φ₄; it should be an enlarged ring allowing Φ₄⁻¹: at A=0, m=2 the degree-two restricted coefficient has a genuine pole at q=i (numerator i−1≠0); affects a stated result. Found by  (#152 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at §4.1, equation (216): the source says the kernel coefficients lie in the localisation generated by t_i, w_i^±1 and the inverses of 1−t_i^m P_i(w^m); it should be the localisation that also inverts 1−w_i^m: at A=0, N=m=1, t=u, w=1−2u the first coefficient is 2/u−4, singular where all listed generators are regular; affects a stated result. Found by  (#152 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at §4.1, equation (218) (Theorems 11–12): the source says the symmetrisation residue of the rational kernel J_A, with its printed orientation and normalisation, equals F_A(t,q)F_A(t,q⁻¹) for every symmetric integral A; it should be corrected by a sign/normalisation factor, since at A=0, N=m=1 the printed residue is −1/(1−t) while the product is +1/(1−t); affects a stated result. Found by  (#152 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at §4.6, selected cubic pair, (279)–(288): the source says a simplified product of the square-root scalars of the selected cubic factors, which fails in the cubic quotient ring; it should be a scalar satisfying the exactly checked relation −24u²+32u−26 = −2(2u²−2u+3)² modulo u³−u²+1; affects a stated result. Found by  (#152 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Garoufalidis–Wheeler, Explicit classes in Habiro cohomology, arXiv:2505.19885v1

- **Misprint** at equation (182), rank-one A=3 cubic example: the source says a q=−1 root numerator with a sign/normalisation error; it should be (z⁻¹+T)/δ, whose expansion 1+T+4T²+5T³+21T⁴+28T⁵ matches the q=−1 values; affects a stated result. Found by  (#152 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Garoufalidis–Zagier, Asymptotics of Nahm sums

- **Misprint** at roots of unity, Ramanujan J. 55 (2021) at Appendix A, equation (57), p.235: the source says the leading radial asymptotic of the Pochhammer product at a root of unity carries a half-power with exponent +m/2; it should be −m/2, as Lemma 2.1 (4) at ν=0 gives (numerically the normalised product tends to 1/√2 at n=1, x=−1); affects a stated result. Found by  (#155 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Garvan, New combinatorial interpretations of Ramanujan's partition congruences mod 5, 7 and 11, 1988

- **Misprint** at equation (6.8), printed p. 64: the source says the residue-five term of the eleven-dissection of V(ζ₁₁;q) is −(c₂+c₄)(A₃B₂−XA₈B₇), giving a nonzero q⁴⁹ coefficient where all crank counts equal 15775; it should be −(c₂+c₄)(A₃B₂−XA₉B₇), as in the paper's own (6.24); affects a stated result. Found by  (#540 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Gasper, Lecture notes for an introductory minicourse on q-series, arXiv math/9509223v1

- **Misprint** at the convergence radius for |q|>1 (cached lines 775–784 and 846–854): the source says a radius that omits a factor |q|; it should be the radius including the factor |q| that the notes' own (1.3.11) carries; affects a stated result. Found by  (#540 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Glasscock–Merriman–Robertson–Smyth, Ergodic theory with applications to continued fractions (2020)

- **Misprint** at Theorem 21, p.46: the source says the Khinchin-constant factor with the denominator k(k+1); it should be a(a+2) (equivalently k(k+2)); affects a stated result. Found by  (#172 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Goncharov, Geometry of configurations, polylogarithms, and motivic cohomology, Adv. Math. (1995)

- **Misprint** at §3, restatement of the relations of Definition 1.5: the source says the triangle/incidence relation with an extra endpoint term η/3; it should be the relation of Definition 1.5, which has no such term; affects nothing. Found by  (#170 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at §5.2, case (e), auxiliary-point reduction: the source says the reduction with an inconsistent sign; it should be C=−Σ(−1)^i C_i with the auxiliary point last (the seven-term boundary gives C+Σ(−1)^i C_i=0; moving it first adds (−1)^5); affects the proof. Found by  (#170 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Goncharov, Polylogarithms, regulators, and Arakelov motivic complexes, arXiv:math/0207036v3

- **Misprint** at the Chow polylogarithm forms, a later display (earlier definition at cached extraction line 1067): the source says the r-form with the wrong number of entries, contradicting its own definition; it should be the definition's arity (for p=1, q=2, r₂ has three entries) with normalisation (2πi)^−p; affects nothing. Found by  (#170 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at §§5.4–5.5, Borel calibration (near Theorems 5.7 and 5.11): the source says the matrix-unit calibration of the weight-two Borel class has value 1; it should be 1/2: for X=E₁₂, Y=E₂₁, Z=E₂₂ the alternating trace is −3 and half of it −3/2; affects a stated result. Found by  (#170 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Granville–Soundararajan, Sieving and the Erdős–Kac theorem (2006)

- **Error** at proof of Proposition 2 (moment expansion), p.4: the source says a count of the contributing compositions that is wrong; it should be the binomial coefficient C(k−s−1, s−1) (k=5, s=2 gives 2); affects the proof. Found by  (#172 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Heath-Brown, Lectures on sieves, arXiv:math/0209360v1

- **Misprint** at Theorem 5.1, p.35, and Corollary 5.1: the source says the lower-bound form of the linear sieve with a wrong sign; it should be the corrected sign (the review confirms the correction is needed); affects a stated result. Found by  (#177 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Huybrechts, Lectures on K3 surfaces (author draft)

- **Misprint** at Chapter 18, §3, Example 3.4: the source says (via "respectively") discriminant −64 for the infinite-height case p≡3 mod 4 and −p² for the other case; it should be the reverse: −p² for infinite height (rank 22, p-elementary), −64 for the other; affects a stated result. Found by  (#563 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kedlaya, Notes on analytic number theory, ch. 12 (KED-ANT-12)

- **Misprint** at §12.4, Theorem 12.2, second inequality: the source says the second inequality with a printed sign slip; it should be the opposite sign (the review confirms the slip against the source text); affects a stated result. Found by  (#177 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Khayutin, Joint equidistribution of CM points, Ann. Math. 189 (2019)

- **Error** at Lemma 9.11, pp.225–226: the source says the estimate without excluding small s, where it breaks down as s→0; it should be restricted to s≥1; affects a stated result. Found by  (#177 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Lemma 9.21, (43)–(44) and the final prime-sum estimate, pp.230–231: the source says these displays without the Möbius-difference factors; it should be the displays with those factors retained; affects the proof. Found by  (#177 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Gap** at Lemma 9.23, the two-case proof, p.231: the source says the two-case argument as if it covered α=0 with uniform constants; it should be a separate treatment of α=0, with constants depending on the fixed α; affects the proof. Found by  (#177 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Gap** at Lemma 9.9, (38), pp.224–225, lcm-discrepancy step: the source says the bound up to the full A^(1/2) cutoff, with the lcm-discrepancy step not justified; it should be supported by the missing lcm-discrepancy argument (no counterexample to the wider statement is known); affects the proof. Found by  (#177 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Lemma B.4, pp.266–267 (singular-prime recursion): the source says the m≥1 smooth term and the closed formula in misprinted form; it should be the corrected term and formula (the review checked the corrections without restating them); affects a stated result. Found by  (#177 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Khayutin, Joint equidistribution of CM points, Ann. Math. 189 (2019), arXiv:1710.04557

- **Misprint** at Lemma 5.8, printed p.184: the source says the different of the full local toral order has a generator whose norm equals the discriminant; it should be equality only up to sign, as ideals: in the split case the generator (π,−π) has norm −π², the discriminant ideal (π²); affects a stated result. Found by  (#159 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Koenigsmann, Defining ℤ in ℚ, Ann. Math. 183 (2016) (read in arXiv v2)

- **Misprint** at Proposition 6 (with ℤ_(∞)=[−4,4]) and Remark 8(a), dyadic table row (6,15): the source says the row (6,15) is sent to (1,1,0); it should be a triple giving 5 mod 8, since (1,1,0) gives −21≡3 mod 8 (the triple (1,1,1) gives 69≡5); affects the proof. Found by  (#164 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Koukoulopoulos–Maynard, On the Duffin–Schaeffer conjecture, Ann. Math. (2020)

- **Misprint** at Lemma 5.3, printed p.264: the source says the overlap estimate carries the indicator of M(q,r)>gcd(q,r); it should be 2M(q,r)≥gcd(q,r): for q=2, r=3, ψ≡3/10, M=9/10<1 yet the overlap has measure 1/6; affects a stated result. Found by  (#172 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Koymans–Milovic, arXiv:1809.09597v1 (cited as KM-21)

- **Misprint** at Lemma 4.1, p.20: the source says an element where an ideal is meant, and a wrong period for the rational norm; it should be the ideal and the corrected period; affects a stated result. Found by  (#177 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Land–Mathew–Meier–Tamme, Purity in chromatically localized algebraic K-theory, J. Amer. Math. Soc. (2024)

- **Misprint** at Remark 3.11: the source says the stable K-theory colimit is displayed with ΩM; it should be the corrected expression (the review confirms the printed ΩM is a misprint but does not restate the fix); affects nothing. Found by  (#175 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Liu–Tian–Xiao–Zhang–Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives, arXiv:1912.11942v3

- **Error** at Lemma 5.11.3(2), p. 98 (same claim in the published version): the source says Q††→P†† is a trivial ℙ¹-bundle; at n=2, p=3 over a quartic C it is ℙ(O_C⊕O_C(4)), with a section of self-intersection −16, so not a product; it should be the projectivization of the sum of the two link normal lines, only Zariski-locally trivial; affects a stated result. Found by  (#589 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at the printed proof at cached lines 702–707: the source says restriction of scalars followed by extension gives identical copies of the adjoint; the summands are Frobenius twists (over 𝔽₄₉, C₄₈-weights 7, 6: k-linear Hom vanishes, the x↦x⁷ twist does not); it should be a decomposition into Frobenius twists, requiring Hom vanishing for every twist of the adjoint; affects the proof. Found by  (#589 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Matomäki–Radziwiłł, Multiplicative functions in short intervals, arXiv:1501.04585v4

- **Error** at Theorem 3 (physical p.7) and the comparison at cached extraction lines 1601–1607: the source says the mean-square comparison over the finite good set in [X,2X] holds uniformly up to h=X, with no upper-endpoint error; it should be a bound with an added h/X term: for f=1, h=X and a dense good set the integral is at least X/36; affects a stated result. Found by  (#172 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Maynard, Small gaps between primes, Ann. Math. 181 (2015)

- **Misprint** at Lemma 8.1, definition of G_{b,j}, p.409 (also (8.6)): the source says the sum defining G_{b,j} starts at r=1; it should be a sum that includes the r=0 term; affects a stated result. Found by  (#177 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at the matrix-positivity assertion after Lemma 8.2, p.411: the source says the quadratic form of the J-integrals is positive definite on the polynomial coefficients; it should be only positive semidefinite: a nonzero two-variable polynomial (square integral 1/3150) has identically vanishing fibre integrals; affects the proof. Found by  (#177 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Nikulin, Finite automorphism groups of Kähler K3 surfaces

- **Error** at §5, equation (5.2) and its case list, pp. 108–110 of the Russian original: the source says the solutions of t_pq(p+1)(q+1)=24 without (p,q)=(2,7), t=1, that is order 14; it should be a list including that solution, which is then disposed of separately; affects the proof. Found by  (#563 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Rizov, Moduli stacks of polarized K3 surfaces in mixed characteristic, arXiv math/0506120v2

- **Misprint** at §4.3, the frame construction and quotient presentation after Theorem 4.3.3, pp. 20–25: the source says a wrong size for the projective linear group in the later presentation; it should be PGL_(9d+2), matching the rank 9d+2 of the sections of L³; affects nothing. Found by  (#563 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Sarig, Introduction to the transfer operator method (2020)

- **Error** at Appendix A.2 (Rényi theorem), pp.32–33: the source says the Gauss density is bounded above by 2 ln 2; it should be 1/ln 2, the density's value at 0, which exceeds 2 ln 2 (about 1.443 against 1.386); affects a stated result. Found by  (#172 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Scholze, Berkovich motives, arXiv:2412.03382

- **Gap** at the almost-module/continuous K-theory input (cached extraction lines 1944–1948): the source says the open unit ball A_<1 of a commutative Banach ring with compatible roots of T is treated as a nonunital ring; it should be an explicit hypothesis (or proof) that A_<1 is closed under addition, which fails for archimedean norms (in ℂ, 3/4+3/4=3/2); affects the proof. Found by  (#175 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Soulé, Groupes arithmétiques et K-théorie des anneaux d'entiers de corps de nombres, 1978 thesis (author's transcription)

- **Misprint** at Proposition 2.2.3.3, p.49: the source says the mixed-product coefficient contains the factorial (1−i)!; it should be (i−1)!, matching Proposition 2.2.2.3 (both agree at i=1); affects a stated result. Found by  (#160 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Stein–Wuthrich, Algorithms for the arithmetic of elliptic curves using Iwasawa theory, Math. Comp. (2013)

- **Misprint** at §4.2, split multiplicative case: the source says that when ω_E pulls back to C·du/u, Katz's value E₂(E,ω_E) is C² times 1−24Σσ(n)qⁿ; it should be C⁻², since E₂ has weight two and ω↦Cω scales it by C⁻² (C=2 gives 1/4, not 4); affects a stated result. Found by  (#165 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Sun, A generalization of Gauss–Kuzmin–Lévy theorem, arXiv:1705.02921v2

- **Error** at proof of Theorem 2, pp.3–6: the source says a signed derivative contribution of the transfer branches serves as if it were an absolute bound; it should be a bound by absolute coefficients (at a=2, x=1 the branch derivative is −1/72); affects the proof. Found by  (#172 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Wagner, PhD thesis (cited as W-thesis)

- **Error** at §2.2, items 2.7 and 2.11 and Lemma 2.12, pp.29 and 31–32: the source says the cyclotomic factor stays irreducible modulo p in the local-chart argument; it should be separability only (Φ₅ splits into four linear factors over 𝔽₁₁); affects the proof. Found by  (#155 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Wagner, q-Hodge complexes over the Habiro ring, arXiv:2510.04782v2

- **Error** at Lemma 2.12, p.18 (proof; also ¶2.7): the source says the cyclotomic factor stays irreducible after reduction modulo a prime ℓ (over 𝔽_ℓ) in the local-chart Taylor comparison; it should be an argument using only separability and handling every irreducible factor: Φ₅ splits over 𝔽₁₁ with roots 3, 4, 5, 9; affects the proof. Found by  (#155 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Lemma B.2, p.77 (two-term localisation resolution): the source says the differential multiplies by the q-factorial P_i; it should be multiplication by 1−q^(i+1) (corrected sign/index), so the augmentation vanishes on the image (with P₁ the defect is q/((1−q)(1+q))≠0); affects the proof. Found by  (#156 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Wagner, q-Witt vectors and q-Hodge complexes, arXiv:2410.23078v5

- **Error** at Lemma 2.2, p.8: the source says the ideal generated by the q-integers attached to the primes dividing m equals (Φ_m(q)), with no restriction on m; it should be restricted to m>1: at m=1 there are no prime divisors, so the ideal is (0) while Φ₁=q−1; affects a stated result. Found by  (#156 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Lemma 3.7, displayed relation (after Definition 3.6, p. 39): the source says the differential–Frobenius relation with V_n where F_n belongs, an ill-typed expression n(d∘V_n); it should be dF_n = nF_n d, which is what the proof of the lemma gives; affects a stated result. Found by  (#39 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Gap** at Lemma 4.17, p. 61 (inference at cached lines 3033–3052): the source says graded commutativity follows coefficientwise on cochains, but a closed form need not be fixed coefficientwise (ω=YdX+XdY gives (γ_X−1)ω=hXdY≠0); it should be a cochain homotopy showing the commutator is a boundary, so the conclusion holds in cohomology; affects the proof. Found by  (#39 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Proposition 2.48, p.33: the source says the displayed Frobenius map lands in the wrong q-Witt ring; it should be W_d as target; affects a stated result. Found by  (#156 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Weibel, The K-book (2013)

- **Misprint** at III, text after Proposition 7.8.2 (norm-kernel equality), chapter PDF pp.67–68: the source says the letters I and V in interchanged roles; it should be the letter consistent with Proposition 7.8.2 (the review names the I/V misprint without restating it); affects nothing. Found by  (#162 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at VI, 5.5–5.6 (ordered configurations and projective coinvariants), combined PDF pp.497–498: the source says the projective line over 𝔽₂ has seven points; it should be three points; affects nothing. Found by  (#162 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at VI, 5.7–5.8 (rank-two sequence), combined PDF pp.498–499: the source says the stabiliser of the standard triple of points is the determinant-one diagonal subgroup; it should be the scalar subgroup diag(a,a); affects the proof. Found by  (#162 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at VI, Exercise 5.3 (small-field calculation over 𝔽₇), combined PDF p.508: the source says the universal torsion class is c=[4] over 𝔽₇; it should be c=2[−1]=2[4], of order 2, whereas [4]=6[3] has order 4 in P(𝔽₇)=ℤ/8; affects a stated result. Found by  (#162 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at VI, Exercise 5.5(ii), combined PDF p.508: the source says identity (ii) with the terms [−x²] and [1/x²]; it should be a corrected identity: the printed form fails for 3, 6, 6, 6 and 9 values of x over 𝔽₇, 𝔽₈, 𝔽₉, 𝔽₁₁, 𝔽₁₃; affects a stated result. Found by  (#162 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at VI, Lemma 5.4(c), combined PDF p.496: the source says the inversion-element identities hold in the Bloch group B(F), placing every inversion element in B(F); it should be the pre-Bloch group P(F): ⟨2⟩ is not in B(𝔽₅), and over ℚ the element h(2) has boundary 2∧(−1)≠0; affects a stated result. Found by  (#162 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at VI, the rank-three comparison just before Lemma 5.10, combined PDF p.501: the source says ψ′(P)=2c; it should be ψ′(P)=−2c, forced by the rotation sum 2c (checked over 𝔽₇, 𝔽₁₁, 𝔽₁₃) and the displayed cone differential; affects the proof. Found by  (#162 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Weibel, The K-book (author text, 29 August 2013)

- **Error** at III, Example 6.2.3, p.233: the source says a local norm-symbol value that is merely not the identity gives a section from the roots of unity into K₂; it should be a primitive value (a generator of μ_m): for m=6, ζ₆² has order 3 and generates only three elements; affects a stated result. Found by  (#160 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at III, Lemma 6.9.1, p.241: the source says an element satisfying the m-th power relation yields distinct eigenvalues and hence a matrix splitting, without requiring its minimal polynomial to have degree m; it should be required: in Mat₂(D), D a quaternion division algebra with μ₄⊂F, diag(1,−1) has fourth power 1, degree-two minimal polynomial, no splitting; affects a stated result. Found by  (#160 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Zagier, Ramanujan's mock theta functions and their applications, 2009

- **Misprint** at Theorem 7.1 and its proof (rank-to-Lerch display, cached lines 947–948): the source says a Lerch-sum expression for the rank generating function at a root of unity that fails numerical checks; it should be the version with corrected signs and q^(−1/6): −η(3τ)³/(η(τ)ϑ(3α;3τ)) + q^(−1/6)[ξ⁻¹μ̂(3α,−τ) − ξμ̂(3α,τ)]; affects a stated result. Found by  (#540 at , 2026-10-23, backfill from earlier reviews (claude opus)).
