# Mistakes found in published sources

Reviewers and red-team passes record every mistake they find in a source while checking a roadmap's locators: misprints (slips whose intended meaning is clear), errors (a false statement or proof step) and gaps (a step the source does not justify), each with the roadmap, the board pull request and the head that reported it. Collected by the board sync from the `## Source issues` sections of review and red-team comments; the data is in `errata/source-issues.json`.

25 mistakes recorded on the board: 13 misprints, 9 errors, 3 gaps.
The explorer's register (to 2026-10-21) holds 15335 more, kept in `errata/explorer/`: 1525 awaiting review, 13582 confirmed, 228 rejected.

## Asakura–Miyatani, Milnor K-theory, F-isocrystals and syntomic regulators, arXiv:2007.14255v2

- **Misprint** at Definition 2.1 (cached line 138): the source says the comparison is an isomorphism of B†_K-algebras; it should be an isomorphism of B†_K-modules; affects nothing. Found by  (#47 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Lemma 2.19, p. 14: the source says the acyclicity lemma for smooth schemes with no affineness assumption, which a proper elliptic curve (H¹(O)=K) refutes; it should be stated for affine schemes, as its proof, which starts from an affine embedding, assumes; affects a stated result. Found by  (#47 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Gap** at equations (2.3)–(2.7), pp. 6–7: the source says the evaluation of extensions may identify H⁰ with Q_p, which is unjustified on a disconnected base; it should be carried out with the distinguished class 1, without that identification; affects the proof. Found by  (#47 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Besser, p-adic Arakelov theory, arXiv math/0301029v1

- **Misprint** at Proposition 3.4, p. 8: the source says the principal-divisor reciprocity informally so that it includes f=0; it should be restricted to nonzero f; affects a stated result. Found by  (#96 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Besser, p-adic heights and Vologodsky integration, arXiv:1711.06957v1

- **Misprint** at Proposition 4.12(4) and its proof, pp. 15–16: the source says the displayed Frobenius and monodromy identities with inconsistent subscripts on the pairing; it should be one pairing used consistently; affects nothing. Found by  (#96 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Beuzart-Plessis–Chaudouard–Zydor, The global Gan–Gross–Prasad conjecture for unitary groups: the endoscopic case, arXiv:2007.05601v1

- **Misprint** at §10.3, pp. 90–92 (closing sentence, cached line 4945): the source says the order of the component group S_Π with an inverted sign in the exponent; it should be |S_Π| = 2^(dim a_P), the coefficient being its inverse 2^(−dim a_P); affects nothing. Found by  (#521 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Bruinier–Funke, On two geometric theta lifts, arXiv math/0212286v4

- **Misprint** at Lemma 3.1: the source says the image of the Fourier mode H(2πnv)e(nu) carries a factor −2v^(2−k); it should be the formula without that factor, which is what direct differentiation produces; affects a stated result. Found by  (#540 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Böckle–Iyengar–Paškūnas (BIP), Zariski density of crystalline points, Forum Math. Pi

- **Error** at the proof of Theorem 6.8, p. 49 (arXiv line 2781): the source says the whole support of a nonzero test module lies in one component, which does not follow, since a support can meet two components (e.g. Spec L[x,y]/(xy)); it should be a component chosen through a point of the fixed-ψ fibre, which suffices for the argument; affects the proof. Found by  (#252 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Böckle–Iyengar–Paškūnas (BIP), Zariski density of crystalline points, Forum Math. Pi (arXiv v2 numbering)

- **Error** at Lemma 6.5, pp. 47–48 (proof step at arXiv lines 2714–2715): the source says the printed character ψ fails the step at the uniformizer: for F=ℚ₅ with κ(5) the Teichmüller lift of 2, ψ(5)=1 whereas κ̄(5)=2; it should be a corrected choice of ψ compatible with κ̄ at the uniformizer, as the repaired step requires; affects the proof. Found by  (#252 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Dolgachev–Keum, Finite groups of symplectic automorphisms of K3 surfaces in positive characteristic, arXiv math/0403478v5

- **Error** at the proof of Lemma 4.3 (cached lines 643–647): the source says an automorphism of order at most 2 of a free ℤ_ℓ-module acts trivially mod 2, false (the swap matrix on ℤ₂²); it should be an argument that tracks the integral extension terms, since (4.9) alone gives no bound on ρ(X); affects the proof. Found by  (#563 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at the proof of Theorem 3.3, p. 13 (cached lines 511–520): the source says only orders 11 and 15 survive as extra rank-20 candidates, but n=14 with (a₂,a₇,a₁₄)=(1,1,1) satisfies every relation; it should be a list that includes 14, excluded like the others (root lattice A₁₃⊕A₆⊕A₁, square discriminant 196); affects the proof. Found by  (#563 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Emerton–Paškūnas (EP), density of supercuspidal points of fixed regular weight in local deformation rings, published pp. 337–371

- **Error** at Lemmas 2.6 and 2.9 (pp. 342–344) and Corollary 3.2 (p. 351): the source says the capture statements without excluding W=0; then {0} would capture O[[K]]≠0, false (witness M=O, H={1}, W=0); it should be stated with the hypothesis W≠0; affects a stated result. Found by  (#252 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Fu (fu24), Annals of Math. 200

- **Gap** at Theorem 3.2, the PBW growth estimate, pp. 8–11 (argument at arXiv line 537): the source says the estimate across the whole weight strip, but the argument proves it only for k≥α; it should be supplemented by an argument covering the remaining weights of the strip; affects the proof. Found by  (#241 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at Theorem 5.1 (arXiv lines 782–785): the source says Theorem 5.1 for weights λ beyond those its argument covers; at p=3, λ=1 the quantity 2λ+1=3 is not a square in ℚ₃; it should be restricted to induced weights λ, for which the relevant value is (μ+1)²; affects a stated result. Found by  (#241 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Gan–Gross–Prasad, Symplectic local root numbers, central critical L-values, and restriction problems, arXiv:0909.2999v1

- **Misprint** at §18, pp. 71–75 (change-of-μ formula, cached line 2627): the source says the twisted representation is π·μ0⁻¹; it should be the twist consistent with the relation ν_{μ′} ≅ μ0·ν_μ stated just before (line 2623); affects a stated result. Found by  (#521 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Garvan, New combinatorial interpretations of Ramanujan's partition congruences mod 5, 7 and 11, 1988

- **Misprint** at equation (6.8), printed p. 64: the source says the residue-five term of the eleven-dissection of V(ζ₁₁;q) is −(c₂+c₄)(A₃B₂−XA₈B₇), giving a nonzero q⁴⁹ coefficient where all crank counts equal 15775; it should be −(c₂+c₄)(A₃B₂−XA₉B₇), as in the paper's own (6.24); affects a stated result. Found by  (#540 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Gasper, Lecture notes for an introductory minicourse on q-series, arXiv math/9509223v1

- **Misprint** at the convergence radius for |q|>1 (cached lines 775–784 and 846–854): the source says a radius that omits a factor |q|; it should be the radius including the factor |q| that the notes' own (1.3.11) carries; affects a stated result. Found by  (#540 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Huybrechts, Lectures on K3 surfaces (author draft)

- **Misprint** at Chapter 18, §3, Example 3.4: the source says (via "respectively") discriminant −64 for the infinite-height case p≡3 mod 4 and −p² for the other case; it should be the reverse: −p² for infinite height (rank 22, p-elementary), −64 for the other; affects a stated result. Found by  (#563 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Liu–Tian–Xiao–Zhang–Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives, arXiv:1912.11942v3

- **Error** at Lemma 5.11.3(2), p. 98 (same claim in the published version): the source says Q††→P†† is a trivial ℙ¹-bundle; at n=2, p=3 over a quartic C it is ℙ(O_C⊕O_C(4)), with a section of self-intersection −16, so not a product; it should be the projectivization of the sum of the two link normal lines, only Zariski-locally trivial; affects a stated result. Found by  (#589 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at the printed proof at cached lines 702–707: the source says restriction of scalars followed by extension gives identical copies of the adjoint; the summands are Frobenius twists (over 𝔽₄₉, C₄₈-weights 7, 6: k-linear Hom vanishes, the x↦x⁷ twist does not); it should be a decomposition into Frobenius twists, requiring Hom vanishing for every twist of the adjoint; affects the proof. Found by  (#589 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Nikulin, Finite automorphism groups of Kähler K3 surfaces

- **Error** at §5, equation (5.2) and its case list, pp. 108–110 of the Russian original: the source says the solutions of t_pq(p+1)(q+1)=24 without (p,q)=(2,7), t=1, that is order 14; it should be a list including that solution, which is then disposed of separately; affects the proof. Found by  (#563 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Rizov, Moduli stacks of polarized K3 surfaces in mixed characteristic, arXiv math/0506120v2

- **Misprint** at §4.3, the frame construction and quotient presentation after Theorem 4.3.3, pp. 20–25: the source says a wrong size for the projective linear group in the later presentation; it should be PGL_(9d+2), matching the rank 9d+2 of the sections of L³; affects nothing. Found by  (#563 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Wagner, q-Witt vectors and q-Hodge complexes, arXiv:2410.23078v5

- **Misprint** at Lemma 3.7, displayed relation (after Definition 3.6, p. 39): the source says the differential–Frobenius relation with V_n where F_n belongs, an ill-typed expression n(d∘V_n); it should be dF_n = nF_n d, which is what the proof of the lemma gives; affects a stated result. Found by  (#39 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Gap** at Lemma 4.17, p. 61 (inference at cached lines 3033–3052): the source says graded commutativity follows coefficientwise on cochains, but a closed form need not be fixed coefficientwise (ω=YdX+XdY gives (γ_X−1)ω=hXdY≠0); it should be a cochain homotopy showing the commutator is a boundary, so the conclusion holds in cohomology; affects the proof. Found by  (#39 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Zagier, Ramanujan's mock theta functions and their applications, 2009

- **Misprint** at Theorem 7.1 and its proof (rank-to-Lerch display, cached lines 947–948): the source says a Lerch-sum expression for the rank generating function at a root of unity that fails numerical checks; it should be the version with corrected signs and q^(−1/6): −η(3τ)³/(η(τ)ϑ(3α;3τ)) + q^(−1/6)[ξ⁻¹μ̂(3α,−τ) − ξμ̂(3α,τ)]; affects a stated result. Found by  (#540 at , 2026-10-23, backfill from earlier reviews (claude opus)).
