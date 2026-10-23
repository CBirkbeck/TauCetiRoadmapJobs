# Mistakes found in published sources

Reviewers, red-team passes and errata jobs record every mistake they find in a source while checking a roadmap's locators: misprints (slips whose intended meaning is clear), errors (a false statement or proof step) and gaps (a step the source does not justify), each with the roadmap, the board pull request or errata job and the head that reported it. Collected by the board sync from the `## Source issues` sections of review, red-team and errata comments; the data is in `errata/source-issues.json`.

1040 mistakes recorded on the board: 669 misprints, 293 errors, 75 gaps, 3 unparsed bullets.
Errata jobs have read the cited sources of 7 roadmaps; in those of 0 they found no mistake.
The explorer's register (to 2026-10-21) holds 15335 more, kept in `errata/explorer/`: 1525 awaiting review, 13582 confirmed, 228 rejected.

## (source not named)

- **Unparsed** (, ? at , 2026-10-23): Misprint** in Stacks Project, Tag 0BKH (opening paragraph): the source says the derived p-completion C of A = ℤ_p ⋉ ℚ_p/ℤ_p is R[1] ⊕ R[0] (R = ℤ_p) without qualification, false in D(A) since Hom(C, R[1]) = 0; it should be stated in D(ℤ_p) after restricting scalars, or as the cohomology computation only; affects nothing. (found in: 944-M2.md)
- **Unparsed** (SchemeAndStackFoundationsPartII, #420 at accb0a0, 2026-10-23): Misprint** in CS24 at proof of Theorem 5.7.2, printed p.79: the list of three descent assertions repeats the second equation label; the third should be (5.7.2.3); affects nothing.
- **Unparsed** (SchemeAndStackFoundationsPartII, #420 at accb0a0, 2026-10-23): Misprint** in DJ at §§2.2, 2.8 and 2.12, printed pp.1–2: three cross-references print as unresolved placeholders; they should cite limits of étale cohomology, the weight decomposition for a diagonalizable group, and quasi-coherent limits on Noetherian stacks; affects nothing. <!-- tauceti-roadmap-review {"agent": "claude", "head": "accb0a0", "job": "REV-DESIGN-SchemeAndStackFoundationsPartII", "model": "opus", "worker": "fable-rev14"} -->

## Abe, arXiv preprint v1

- **Error** at Lemma 6.1(i), p. 7: the source says one twist works on any finite-type X, but two points with Frobenius eigenvalues 1 and p admit no common twist; it should be for smooth geometrically connected X, with separate twists on separate components; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## AIP (Andreatta–Iovita–Pilloni), Hilbert adic paper, author final version

- **Error** at Lemma 8.1, §8.1, printed p. 34: the source says the proof applies level rigidity to α/ᾱ without showing that this quotient fixes the level marking; it should be supplemented by a proved freeness hypothesis: in the ℚ(√3), N = 7 CM example the quotient is −1, which moves the marking; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Allen–Khare–Thorne, Modularity of GL₂(F_p)-representations over CM fields, arXiv:1910.12986v2

- **Gap** at the proof of Theorem A.14, printed p.95: the source says the source invokes Darmon–Diamond–Taylor Lemma 4.11, which excludes the projective-A₄ (degree-three) case, without treating that case; it should be as the witness in the cited review requires; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Alper, moduli lecture notes (the report gives no title)

- **Misprint** at the display immediately after the identity h¹ = h⁰ − χ in the H¹-vanishing and regularity argument: the source says the Hilbert-polynomial term enters with a plus sign; it should be a minus sign, consistent with the identity h¹ = h⁰ − χ just before; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Andreatta–Iovita–Pilloni

- **Gap** at §8.1, Lemma 8.1, p. 34: the source says rigidity applies to α/ᾱ without checking that this map preserves the marking; it should be first prove marking preservation before invoking rigidity; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Andreatta–Iovita–Pilloni, The adic, cuspidal, Hilbert eigenvarieties (2016)

- **Misprint** at §4, a later reference to Lemma 4.2 (cached extraction line 723): the source says Lemma 4.2 (an ideal estimate) under a wrong label; it should be cited as Lemma 4.2; affects nothing. Found by  (#167 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Arthur (Art80, 1980)

- **Error** at Lemma 1.1: the source says a strict inequality; it should be the corrected inequality recorded in Arthur, An Introduction to the Trace Formula (2005), p. 68; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Arthur–Clozel (AC89, 1989)

- **Error** at Lemma 6.1: the source says a lemma that contains a mistake, recorded in Arthur, An Introduction to the Trace Formula (2005), p. 191; it should be as the witness in the cited review requires; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Gap** at the density argument, p. 196: the source says a density argument with a gap, recorded in Arthur, An Introduction to the Trace Formula (2005), p. 191; it should be as the witness in the cited review requires; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Arthur–Clozel, Simple algebras, base change, and the advanced theory of the trace formula (1989)

- **Gap** at the geometric density argument of the twisted trace formula comparison (no locator in the book given): the source says the source's density argument needed correction; it should be as corrected in Arthur, An introduction to the trace formula, §26, p. 191; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Asakura–Miyatani, arXiv:2007.14255v2

- **Error** at Lemma 2.19 (with Remark 2.21(3)): the source says the lemma for any smooth V-scheme X; it should be restricted to affine X, which is all its proof (an affine embedding) gives; it fails for proper X, since H¹(E^an,O)=K for an elliptic curve; affects a stated result. Found by  (#110 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Lemma 2.5: the source says Fil⁰M_rig in the unique-lift statement; it should be the de Rham filtration Fil⁰M_dR; affects nothing. Found by  (#110 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Asakura–Miyatani, Milnor K-theory, F-isocrystals and syntomic regulators, arXiv:2007.14255v2

- **Misprint** at Definition 2.1: the source says the comparison map c is an isomorphism of B†_K-algebras; it should be an isomorphism of B†_K-modules; affects nothing. Found by  (#110 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Definition 2.1 (cached line 138): the source says the comparison is an isomorphism of B†_K-algebras; it should be an isomorphism of B†_K-modules; affects nothing. Found by  (#47 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Lemma 2.19, p. 14: the source says the acyclicity lemma for smooth schemes with no affineness assumption, which a proper elliptic curve (H¹(O)=K) refutes; it should be stated for affine schemes, as its proof, which starts from an affine embedding, assumes; affects a stated result. Found by  (#47 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Gap** at equations (2.3)–(2.7), pp. 6–7: the source says the evaluation of extensions may identify H⁰ with Q_p, which is unjustified on a disconnected base; it should be carried out with the distinguished class 1, without that identification; affects the proof. Found by  (#47 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Ash–Brakenhoff–Zarrabi, Equality of polynomial and field discriminants (Experimental Math. 16, 2007)

- **Misprint** at the table of Theorem 6.8 (with Propositions 6.4 and 6.7), pp. 371–372: the source says the local density formula has exponent −n; it should be 2−n, as the paper's own coefficient computation and concluding table give, consistent with ν₁(4,3) = 8/81; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Atobe–Kondo–Yasuda, Local newforms for the general linear groups over a non-archimedean local field, Forum Math. Pi (2022)

- **Misprint** at proof of Proposition 3.7, definition of the lattice paths, p.20: the source says the paths end at the vertex [a,1]; it should be [1,r] (for r=3, a=1 the path runs (2,1),(1,1),(1,2),(1,3)); affects nothing. Found by  (#173 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## B19

- **Misprint** at (5.7), p. 88: the source says the normal-sequence boundary lands in H⁰(C, N_{C/T}); it should be H¹(C, N_{C/T}); affects nothing. Found by RealSurfacePeriodIndex (#412 at 875bca4, 2026-10-23, claude opus).
- **Error** at Lemma 6.4, proof, p. 92: the source says h₁ vanishes to order one along R, which makes t vanish doubly there; it should be have a simple pole along R, so that the real zero locus is H(ℝ); affects the proof. Found by RealSurfacePeriodIndex (#412 at 875bca4, 2026-10-23, claude opus).
- **Misprint** at Lemma 6.5, proof, p. 92: the source says p(T(ℝ)) is disjoint from Θ; it should be disjoint from Ψ = S(ℝ) ∖ Ξ; affects nothing. Found by RealSurfacePeriodIndex (#412 at 875bca4, 2026-10-23, claude opus).
- **Gap** at Proposition 4.2, proof, p. 80: the source says the remaining curves are exceptional divisors of T → T̄; it should be those and the ℙ¹ fibres over R ∩ D, treated by the same argument; affects the proof. Found by RealSurfacePeriodIndex (#412 at 875bca4, 2026-10-23, claude opus).
- **Gap** at Proposition 4.4, proof after (4.8), p. 84: the source says [ζ]₁ = [e]₁ on Ψ; it should be [α̃]₀·[e]₁, which equals [e]₁ only when α is nonzero on all of Ψ; affects a stated result. Found by RealSurfacePeriodIndex (#412 at 875bca4, 2026-10-23, claude opus).
- **Gap** at Proposition 4.5, proof, p. 85: the source says Proposition 3.3 applies once the first component vanishes on Ψ; it should be after subtracting the curve classes given by Assumption 4.1 (ii); affects the proof. Found by RealSurfacePeriodIndex (#412 at 875bca4, 2026-10-23, claude opus).
- **Misprint** at Proposition 4.5, proof, p. 85: the source says [p_*ε]₁ vanishes in H¹(S(ℝ)); it should be in H¹(U(ℝ)), after restriction to Ψ; affects nothing. Found by RealSurfacePeriodIndex (#412 at 875bca4, 2026-10-23, claude opus).
- **Gap** at Proposition 4.5, proof, pp. 84–85: the source says β restricted to T_U is the mod-2 lift α̃ plus integral classes; it should be an integral class, for example from the trace sequence; affects the proof. Found by RealSurfacePeriodIndex (#412 at 875bca4, 2026-10-23, claude opus).
- **Gap** at Proposition 6.6, proof, pp. 94–95: the source says replacing T by T_x concludes; it should be first check that the transported lift still induces α, by normalising it on T_U; affects the proof. Found by RealSurfacePeriodIndex (#412 at 875bca4, 2026-10-23, claude opus).
- **Misprint** at Proposition 6.7, p. 95: the source says a lift of (n/2)α is given for every n; it should be required only for even n; affects nothing. Found by RealSurfacePeriodIndex (#412 at 875bca4, 2026-10-23, claude opus).
- **Error** at Theorem 0.6 (ii), p. 65, and its proof, p. 107: the source says one nonempty half with an odd number of odd-Euler components gives index-4 classes, since w₁ ∉ im cl_R; it should be that this case never occurs: w₁ = cl_R(K_S) ∈ w₁^⊥ forces deg w₁² = 0; affects a stated result. Found by RealSurfacePeriodIndex (#412 at 875bca4, 2026-10-23, claude opus).
- **Misprint** at proof of Proposition 0.7, p. 107: the source says α = (f, g) in Br(ℝ(S)); it should be Br(K(S)); affects nothing. Found by RealSurfacePeriodIndex (#412 at 875bca4, 2026-10-23, claude opus).
- **Gap** at proof of Proposition 0.7, p. 108: the source says signs are constant near a fixed point of D; it should be general points on both arcs, avoiding zeros and poles of f₀, g₀; affects the proof; <!-- tauceti-roadmap-review {"agent": "claude", "head": "875bca4", "job": "REV-DESIGN-RealSurfacePeriodIndex", "model": "opus", "worker": "fable-rev15"} -->. Found by RealSurfacePeriodIndex (#412 at 875bca4, 2026-10-23, claude opus).
- **Gap** at proof of Theorem 0.12, p. 95: the source says K is the union of finite extensions of K₀; it should be after adding a transcendence basis to K₀; affects the proof. Found by RealSurfacePeriodIndex (#412 at 875bca4, 2026-10-23, claude opus).
- **Gap** at proof of Theorem 0.12, p. 96: the source says two non-proportionality conditions make y₁, y₂ parameters; it should be a choice of w with w² + 1 ∈ m², since the determinant can vanish otherwise; affects the proof. Found by RealSurfacePeriodIndex (#412 at 875bca4, 2026-10-23, claude opus).
- **Misprint** at proof of Theorem 0.6, pp. 106–107: the source says the class δ with [δ]₀ = 0 is unique; it should be the unique nonzero such class; affects nothing. Found by RealSurfacePeriodIndex (#412 at 875bca4, 2026-10-23, claude opus).
- **Error** at §3.1, p. 76: the source says T = {rv² = sw²} is a finite double cover of S; it should be proper and generically of degree 2, finite only over S₀, with ℙ¹ fibres over R ∩ D; affects the proof. Found by RealSurfacePeriodIndex (#412 at 875bca4, 2026-10-23, claude opus).
- **Misprint** at §3.1, p. 77: the source says the fixed singular points lie over Sing R where v vanishes; it should be where w vanishes; affects nothing. Found by RealSurfacePeriodIndex (#412 at 875bca4, 2026-10-23, claude opus).

## Bakker–Klingler–Tsimerman (BKT; title not given in the review)

- **Error** at the inverse-image-of-Siegel-sets step (authors' erratum §1.5, p. 3): the source says the step follows from Borel–Harish-Chandra 7.5, which concerns real Siegel sets; it should be justified by Bakker–Grimm–Schnell–Tsimerman, arXiv:2112.06995, 28.1, as the erratum states; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Bakker–Klingler–Tsimerman, Tame topology of arithmetic quotients and algebraicity of Hodge loci (JAMS 2020)

- **Error** at Theorem 1.1: the source says Theorem 1.1 in a form that the authors' own erratum calls incorrect; it should be the erratum's Theorem 1.2 (§§1.1–1.3, pp. 1–3), with a fixed maximal compact subgroup and restricted functoriality; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Bakker–Klingler–Tsimerman, Tame topology of arithmetic quotients and algebraicity of Hodge loci, J. Amer. Math. Soc. 33 (2020), arXiv:1810.04801

- **Misprint** at Appendix A.1–A.2, pp.19–20: the source says the chart transition maps are ψ_j∘φ_i⁻¹; it should be φ_j⁻¹∘φ_i; affects nothing. Found by  (#164 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Balakrishnan–Dan-Cohen–Kim–Wewers, arXiv:1209.0640v4,

- **Error** at Remark 2.6 and Definition 2.7, p. 9: the source says the local condition at good places is the image of local integral points, which is empty at 2 for the thrice-punctured line; it should be the neutral (unramified) condition at those good places; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Balakrishnan–Dogra, Quadratic Chabauty and rational points I: p-adic heights, arXiv:1601.00388v2

- **Misprint** at the display of Theorem 6.3 (Definition 6.2 and Theorem 6.3, pp. 26–29): the source says the displayed formula carries an extra (−1) that conflicts with §6.2 and the proof that follows; it should be the display without that (−1), which the proof never uses; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Balakrishnan–Dogra–Müller–Tuitman–Vonk, Explicit Chabauty–Kim for the split Cartan modular curve of level 13, Ann. of Math. 189 (2019)

- **Gap** at Lemma 2.4 and its proof, p. 900: the source says the printed lemma states its converse direction without a qualification it needs; it should be as the witness in the cited review requires; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Barnet-Lamb–Gee–Geraghty–Taylor (BLGGT), arXiv version 4 (title not given in the report)

- **Error** at §5.2, pp. 65–69: the source says the full centre of G_l⁰ is treated as an unramified torus, conflating it with the connected centre; it should be the connected centre Z(G_l⁰)⁰, with the finite central kernels bounded separately (SO₄ has full centre μ₂ and trivial connected centre); affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Barnet-Lamb–Gee–Geraghty–Taylor (BLGGT), arXiv:1010.2561

- **Error** at p. 32 (l. 1388) and p. 34: the source says the polarizing multiplier the sign µ_v(−1) = (−1)^n and calls ε^{1−n}r(χ) odd by definition; it should be (−1)^{n+w}, as BLGGT's own §A.2 formula (p. 87) gives; the CM character of weight (1,0) is a witness; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Bary-Soroker–Koukoulopoulos–Kozma, Irreducibility of random polynomials: general measures, arXiv:2007.14567v3

- **Error** at proof of Lemma 12.5, pp.60–61: the source says the finite sum of reciprocals of small-prime-smooth integers below the cutoff equals the full Euler product; it should be an inequality (at most the product): for the prime set {2} with cutoff 2 the sum is 1.5, the product 2; affects the proof. Found by  (#171 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at §12.2, Lemmas 12.7–12.9, p.62 (cached extraction line 3836): the source says a cutoff comparison in the exclusion argument pointing the wrong way; it should be the reversed comparison; affects the proof. Found by  (#171 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Gap** at §12.2, the imprimitive exclusion after Lemma 12.9, pp.62–63: the source says a short companion part is used without control, while the anatomy event of Lemma 12.6 gives only one witness per r; it should be controlled, e.g. by a separately proved four-witness (five in the middle range) strengthening; affects the proof. Found by  (#171 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Baumslag–Myasnikov–Remeslennikov, Algebraic geometry over groups I (author PDF)

- **Error** at the results identifying Zariski-closed with algebraic sets and closure with V(I) (no theorem number given): the source says these for every coefficient domain, but for G = H = 1 the empty set is closed while V(I(∅)) is the whole point; it should be require nontrivial coefficients with an injective coefficient map; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Bellaïche (cited as Bellaïche09)

- **Error** at Proposition 2.12, last sentence: the source says every refinement of an Eisenstein series is θ-critical, but the ordinary refinement of E₄ at p = 5 is not; it should be only the positive-slope refinement; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at the proof of Lemma 2.11: the source says the character ratio is nontrivial because no level-one E₂ exists, which fails for primitive E₂(χ, χ) with χ quadratic of conductor 3 and p = 5; it should be assume χ₁χ₂⁻¹ ≠ χ_cyc; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at the proof of Lemma 2.11, pp. 17–18: the source says Ext(χ₂, χ₂); it should be Ext(χ₂, χ₁); affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Bellaïche, Critical p-adic L-functions, arXiv:0912.2925

- **Misprint** at formulas (4)–(5), p. 8: the source says the two formulas with different quantities in their denominators; it should be α in both denominators; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Berger, Représentations p-adiques et équations différentielles

- **Error** at §1.1 and Proposition 1.4 (radius dictionary for overconvergent rings): the source says the source needed the coefficient-field correction recorded in the author's errata §1; it should be as the witness in the cited review requires (the radius uses the field-of-norms ramification index, not the absolute one, e.g. K=Q₃(μ₃)); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Berger, Représentations p-adiques et équations différentielles (Invent. Math. 2002),

- **Error** at §1.1, p. 10 and Proposition 1.4, p. 12: the source says the degree includes the residue-field extension, which fails for ℚ₃(μ₃); it should be the ramification index e(E_K/E_{K_0}) of the norm fields with coefficient field F′_K, per the author's errata §1; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Berger, Wach-module paper (Proposition II.1.1, Theorem III.4.4),

- **Gap** at the result treated in §2 of the author's errata: the source says the result without the rational étale scalar-extension hypothesis, and its final filtration step does not go through; it should be as corrected in those errata, adding that hypothesis and redoing the step with successive γ − χ(γ)^j; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Berkane–Bordellès–Ramaré, explicit bounds for the divisor problem (Math. Comp.)

- **Error** at Lemma 8.3, printed p.1040: the source says T^{1/4}|I₁(T,7/4)−κ₇| ≤ 0.302 on an interval starting at T=1; it should be exclude an initial interval, since I₁(1)=0 while κ₇≈0.40765 (p.1038); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Berkane–Bordellès–Ramaré, explicit divisor-problem remainder paper (Math. Comp., printed pp. 1030–1043; title not given in the reports)

- **Error** at Lemma 8.3, p. 1040 (with (8.1)–(8.2), p. 1037): the source says the scaled distance of the remainder integral from κ₇ is at most 0.302 for 1 ≤ T ≤ 10⁵; it should be start at T = 2, since at T = 1 the integral vanishes and the scaled value is κ₇ ≈ 0.4077; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Berrick–Karoubi, 2005 (arXiv math/0509404)

- **Misprint** at Lemma 5.3, published p. 801: the source says the εL₀ groups are ℤ in both cases for ε = 1 and ℤ⊕ℤ/2 in both cases for ε = −1; it should be the two values interchanged, as the paper's own (4.1) and (4.3) indicate; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Besser, p-adic Arakelov theory, arXiv math/0301029v1

- **Misprint** at Proposition 3.4, p. 8: the source says the principal-divisor reciprocity informally so that it includes f=0; it should be restricted to nonzero f; affects a stated result. Found by  (#96 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Besser, p-adic heights and Vologodsky integration, arXiv:1711.06957v1

- **Misprint** at Proposition 4.12(4) and its proof, pp. 15–16: the source says the displayed Frobenius and monodromy identities with inconsistent subscripts on the pairing; it should be one pairing used consistently; affects nothing. Found by  (#96 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Besser–de Jeu (Ann. Sci. ÉNS 2003)

- **Misprint** at p. 884: the source says J_k is formed from (1+I)* together with Symb_k; it should be Symb_{k−1}, since cup products raise the weight by one (p. 883); affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at the quotient display after Lemma 3.19, p. 886: the source says the quotient description without the special-units hypothesis of Lemma 3.19, and it fails over ℤ_(2); it should be stated under that hypothesis; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Besser–de Jeu (the syntomic-regulator paper cited as BDJ)

- **Misprint** at the tensor presentations of de Jeu's complexes, printed pp.884–886, including the quotient display after Lemma 3.19: the source says the last terms have the displayed tensor and exterior-power forms with no restriction; it should be require residue field with more than two elements, as Lemma 3.19 does (fails for Z_(2), n=2); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Beukers, A refined version of the Siegel–Shidlovskii theorem (arXiv math/0405549)

- **Misprint** at the desingularization (gauge-transform) display following Proposition 4.1: the source says the transformed coefficient matrix carries +D⁻¹D′; it should be −D⁻¹D′, since differentiating F = B·E gives B·E′ = A·B·E − B′·E (check: B = z−1, F = (z−1)eᶻ); affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Beuzart-Plessis–Chaudouard–Zydor, The global Gan–Gross–Prasad conjecture for unitary groups: the endoscopic case, arXiv:2007.05601v1

- **Misprint** at §10.3, pp. 90–92 (closing sentence, cached line 4945): the source says the order of the component group S_Π with an inverted sign in the exponent; it should be |S_Π| = 2^(dim a_P), the coefficient being its inverse 2^(−dim a_P); affects nothing. Found by  (#521 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Bhargava, The density of discriminants of quartic rings and fields (Annals 162, 2005)

- **Error** at pp. 1056–1057 (argument for Proposition 23), with the similar estimate invoked in Lemma 12, p. 1045: the source says a compressed floor-exponent bound on suborders of given index, making index-p³ counts independent of p (they are 3, 4, 6, 8 at p = 2, 3, 5, 7); it should be p-dependent bounds such as index factor ≪ k^{1/2+ε} and Σ_{e≥1} s(p^e)/p^{2e} ≪ p^{−2} (Shankar–Tsimerman, arXiv:2503.02381v1, §11); affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at the acceptability criterion for quadratic extensions of cubic fields (the report places it with Lemmas 25–26 and (34), p. 1057; exact locator not given): the source says the source says, as an unrestricted converse, that square norm of the finite conductor makes the extension acceptable; it should be a necessary condition only: for the cubic field of discriminant −23 and E = K(i) the conductor norm is 64 but the closure group is S₃×C₂; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Bhargava–Klagsbrun–Lemke Oliver–Shnidman (BKLOS), three-isogeny Selmer groups in quadratic twist families,

- **Misprint** at Example 13.3 (universal-twist table): the source says the order-three kernel generator is (0, 2√(t_k+27)); it should be (0, 4√(t_k+27)), since substitution gives y² = 16(t_k+27) and the tangent there meets the cubic triply; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Bhargava–Shankar–Wang, Squarefree values of polynomial discriminants I, arXiv:1611.09806v3

- **Misprint** at Theorem 4.4, (39), printed p. 22: the source says the summed tail bound without excluding polynomials of discriminant zero; it should be restricted to nonzero discriminant, which the proof's finite divisor-multiplicity count requires; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Bhargava–Skinner, arXiv:1401.0233v1

- **Misprint** at pp. 3 and 14 (the rank-one family, Lemma 15): the source says a dyadic condition with 2-adic valuation three for A, admitting pairs such as (A,B) = (−136,16) that have no suitable integral model; it should be v₂(A) = 4 and B ≡ 16 mod 64, giving the integral model y² + y = x³ + (A/16)x + (B/16 − 1)/4; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Bhatt, p-adic derived de Rham cohomology, arXiv:1204.6560

- **Error** at Remark 8.7: the source says torsion coordinates with the wrong p-power orders (the review sets p^⌊n/2⌋ against p^(n−1)); it should be as the witness in the cited review requires (its recomputation of ℤ_p ⊕ ⊕_j ℤ_p/j); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Bhatt-Scholze

- **Error** at Corollary 5.1.9, arXiv v2 printed p. 35, Bhatt-Scholze line 1666: the source says classical abelian sheaves form a Serre subcategory of pro-étale abelian sheaves; it should be a weak Serre subcategory; for j:Spec(ℚ)→Spec(ℤ), the nonclassical subsheaf j!ℤ⊂ℤ disproves closure under arbitrary subobjects; affects a stated result. Found by EllAdicRealization (ERRATA-EllAdicRealization at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at Lemma 3.4.14, arXiv v2 printed p. 23, Bhatt-Scholze line 1097: the source says derived-complete modules form a Serre subcategory of all modules; it should be a weak Serre subcategory; for R=ℤ and I=(ℓ), the derived-complete module ℤℓ contains the noncomplete submodule ℤ; affects a stated result. Found by EllAdicRealization (ERRATA-EllAdicRealization at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Lemma 6.5.9(4), arXiv v2 printed p. 50, Bhatt-Scholze line 2355: the source says completed pullback for f:X→Y maps D_comp(X_proét,R̂) to D_comp(Y_proét,R̂); it should be D_comp(Y_proét,R̂) → D_comp(X_proét,R̂), reversing the displayed direction; affects a stated result. Found by EllAdicRealization (ERRATA-EllAdicRealization at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Lemma 6.5.9, proof of (5), arXiv v2 printed p. 51, Bhatt-Scholze line 2367: the source says the tensor after pullback is over R̂_Y and the tensor before pullback is over R̂_X; it should be over R̂_X after pullback and R̂_Y before pullback; affects the proof. Found by EllAdicRealization (ERRATA-EllAdicRealization at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Proposition 5.6.2, arXiv v2 printed p. 41, Bhatt-Scholze line 1931: the source says repleteness identifies Rlim Fₙ with lim Fₙ for the original étale sheaves; it should be Rlim ν*Fₙ ≃ lim ν*Fₙ on the pro-étale site; affects the proof. Found by EllAdicRealization (ERRATA-EllAdicRealization at 4bd7237, 2026-10-23, codex gpt-6-astra).

## Bhatt–Morrow–Scholze 2019 (BMS19), Topological Hochschild homology and integral p-adic Hodge theory,

- **Misprint** at Proposition 5.6, printed p. 237: the source says the degree index is i − c; it should be i + c, as the proof's computation of RHom(M,N)[c] on p. 238 gives under the paper's shift convention (Ext¹(k, k[−1]) ≅ k excludes i − c); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Bhatt–Morrow–Scholze, Integral p-adic Hodge theory (BMS1), arXiv:1602.03148v3

- **Error** at the proof of Lemma 4.8, pp.35–36: the source says every rank-one O_F-submodule is principal, maximal ideal times principal, or the whole field; it should be allow unrealized cuts such as {v > √2}, handled by choosing x outside mD so D = xO_F; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Bhatt–Morrow–Scholze, Integral p-adic Hodge theory (Publ. IHES 2018),

- **Misprint** at the substitution for the power-series variable (no theorem number given): the source says T is sent to a unit-valued element; it should be T ↦ [ε]^{1/p} − 1; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at §4, before Corollary 4.12: the source says a classification of rank-one valuation submodules that misses irrational cuts (value group ℚ, D = 𝔪D over ℂ_p^♭); it should be include those cases, after which the lattice theorem still holds; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Bhatt–Morrow–Scholze, Topological Hochschild homology and integral p-adic Hodge theory (2019)

- **Misprint** at Proposition 5.6: the source says the Ext computation for the Beilinson heart with a wrong index shift; it should be the shift i + c, as the review's check Ext¹(k, k[−1]) = k confirms; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Bhatt–Morrow–Scholze, Topological Hochschild homology and integral p-adic Hodge theory (BMS2, published version)

- **Misprint** at Proposition 11.3, pp.299–300: the source says the cyclotomic Frobenius lift on the cyclic bar construction is (s,n) ↦ (s^p, pn); it should be (s,n) ↦ (s, pn), precomposition with the p-fold cover as in Nikolaus–Scholze Prop. IV.3.2(ii); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Bhatt–Morrow–Scholze, Topological Hochschild homology and integral p-adic Hodge theory (Publ. IHES 2019),

- **Error** at Proposition 11.3, pp. 299–300: the source says the Frobenius lift is (s, n) ↦ (s^p, pn), which is not equivariant; it should be (s, n) ↦ (s, pn); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Bhatt–Scholze, Prisms and prismatic cohomology (arXiv v4),

- **Error** at Lemma 16.10(2), pp. 110–111: the source says the presentation's quotient is identified with the envelope's quotient unconditionally, which a square-zero extension of ℤ_p by ∏ℤ_p refutes; it should be assume the discrete quotient P/J is derived p-complete; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Bhatt–Scholze, Prisms and prismatic cohomology, arXiv:1905.08229v4

- **Error** at Lemma 16.10(2), p.110: the source says the uncompleted quotient P/J equals the q-PD envelope quotient E/K; it should be use the derived p-completion, i.e. the completed extended ideal as in Construction 16.13 (a square-zero counterexample shows IP need not be closed); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Bijakowski–Pilloni–Stroh, Classicité de formes modulaires surconvergentes (Ann. of Math. 2016)

- **Misprint** at the determinant-polynomial evaluation in its signature argument (no printed locator given): the source says the source evaluates on diag(x, 1, …, 1) plus the identity; it should be diag(x − 1, 0, …, 0) plus the identity, that is diag(x, 1, …, 1); in rank one at x = 1 these give 2 and 1; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Birkbeck–Heuer–Williams (2019)

- **Error** at Proposition 8.4: the source says the map is a Δ(N)-torsor without restriction, which fails at a CM point for N = 7; it should be a quotient-stack statement, or a torsor only over the free locus; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Birkbeck–Heuer–Williams, Ann. Inst. Fourier (doi 10.5802/aif.3560)

- **Error** at Lemma 8.20: the source says the transition maps of its system of unit quotients Δ_n are injective and that the system stabilises; it should be weakened to claim neither: a dyadic unit computation gives Δ_n(5) ≅ ℤ/6 with transition map multiplication by 2 and limit ℤ/3; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at Proposition 8.4, p. 1766: the source says that at tame level N the totally positive units modulo squares of congruence units act freely, making the marked Hilbert moduli space a finite étale torsor; it should be stated with freeness assumed or proved, or on the free locus or quotient stack: for F = ℚ(√3), N = 7, a nontrivial class fixes a CM point; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at Proposition 8.4, p. 1766: the source says at tame level N the totally positive units modulo squares of congruence units act freely, making the marked Hilbert moduli space a finite étale torsor; it should be stated with freeness assumed or proved, or on the free locus or quotient stack: for F = ℚ(√3), N = 7, a nontrivial class fixes a CM point; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Birkbeck–Heuer–Williams, overconvergent Hilbert modular forms (2019 arXiv version; full title not given)

- **Error** at Proposition 8.4, Lemmas 8.16, 8.19, 8.24 and Proposition 8.21: the source says the finite-level quotient maps are coarse torsors on the whole space at every level n; it should be quotient-stack torsors, or coarse torsors on free loci, whole-space only along a cofinal projectively neat tail (CM witness at n = 0); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Bosch–Lütkebohmert, Formal and rigid geometry II (1993)

- **Error** at the base-change sentence following the definition of a dévissage at a point: the source says dévissages are compatible with base change, without qualification; it should be only when the distinguished finite fibre remains one point, since X² + 1, irreducible over 𝔽₃, splits into two points over an unramified quadratic extension; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Boxer–Calegari–Gee, Cuspidal cohomology classes for GL_n(ℤ) (2025)

- **Error** at Corollary 3.2 and Remark 3.3, p. 518: the source says p = 151 is among the ordinary companion examples; it should be removed from that list, since its only twisted-eigenvalue match is at weights (52,100), with gcd(k−1,p−1) = 3; affects a stated result. Found by  (#131 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Boxer–Calegari–Gee–Pilloni, Abelian surfaces over totally real fields are potentially modular (2021)

- **Misprint** at §6.1.1, p. 139: the source says Q(U) is invertible on M>h when all roots of Q have valuation less than h; it should be valuation at most h, equality included; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Boxer–Calegari–Gee–Pilloni, Abelian surfaces over totally real fields are potentially modular (arXiv:1812.09269)

- **Misprint** at the slope-≤h decomposition condition: the source says the root-valuation condition without its endpoint h; it should be include the endpoint, roots of Q of valuation ≤ h; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Boxer–Calegari–Gee–Pilloni, Abelian surfaces over totally real fields are potentially modular (arXiv:1812.09269v3)

- **Error** at Remark 7.5.23: the source says the order-128 Sylow 2-subgroup of Sp₄(F₃) is not enormous, contradicting the enormous order-128 class listed in §7.5.20; it should be enormous: |Sp₄(F₃)| = 2^7·3^4·5, so all order-128 subgroups are conjugate, and enormity is conjugation-invariant; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Boxer–Calegari–Gee–Pilloni, Abelian surfaces over totally real fields are potentially modular, arXiv:1812.09269

- **Misprint** at §2.8, display after (2.8.5), p.37: the source says an alternating-sign exponent in the L-function conventions with a wrong value; it should be the corrected exponent (the review confirms the misprint but does not restate it); affects a stated result. Found by  (#169 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Boxer–Calegari–Gee–Pilloni, Modularity theorems for abelian surfaces, arXiv:2502.20645v1

- **Misprint** at Definition 9.1.7 and Lemma 9.1.8, pp. 190–191: the source says the definition and lemma with a "toric" subscript missing (the toric-rank-two condition); it should be written with the toric subscript, as the witness in the cited reviews requires; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Boxer–Pilloni, Higher Coleman theory, arXiv:2110.10251

- **Gap** at §§6.2–6.3 (analytic induction and distribution model versus the family statement): the source says the construction is made for uniform affinoid coefficient algebras only, yet states the family result for general coefficients; it should be either kept uniform or extended via a defining Banach norm (the sup-norm loses ε in E[ε]/(ε²)); affects a stated result. Found by  (#167 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## BP-Coleman

- **Gap** at Definition 5.11.14, p. 134: the source says the ±,sss_{M,w} conditions use unshifted w′(κ) in one sign, shifted weights in the other, and a doubled 2ρ_nc; it should be w⁻¹w0M(w′·κ) and that plus w⁻¹2ρ_nc, as Theorems 6.5.5 and 6.8.3 give; affects the proof. Found by HigherHidaAndColemanTheory (#332 at da88512, 2026-10-23, claude opus).
- **Misprint** at Definition 6.4.7, p. 158: the source says the first negative-support inclusion uses the analyticity radius n as its second depth; it should be the free depth l, as in the positive case and Definition 5.4.10; affects nothing. Found by HigherHidaAndColemanTheory (#332 at da88512, 2026-10-23, claude opus).
- **Misprint** at Proposition 2.7.3, p. 32: the source says a complex already concentrated in degree d receives a further shift by d, and writes Ω¹ for the top forms; it should be top-degree supported cohomology paired with Ω^d; affects nothing. Found by HigherHidaAndColemanTheory (#332 at da88512, 2026-10-23, claude opus).
- **Misprint** at Theorem 6.10.2(1), p. 173: the source says the vanishing holds on the strongly small part, while its proof treats the small part; it should be the small-slope statement, which the proof establishes; affects nothing. Found by HigherHidaAndColemanTheory (#332 at da88512, 2026-10-23, claude opus).
- **Misprint** at Theorem 6.4.3, proof, p. 157: the source says a lemma reference that prints as question marks; it should be a named citation of the root-coordinate contraction lemma used together with Lemma 6.3.10; affects nothing. Found by HigherHidaAndColemanTheory (#332 at da88512, 2026-10-23, claude opus).
- **Misprint** at Theorem 6.8.3(2), p. 167: the source says the second bound in the negative theory is −w⁻¹ρ+w⁻¹2ρ_nc, also in arXiv v1; it should be −w⁻¹ρ+ρ+w⁻¹2ρ_nc, the twist of Theorem 5.9.6(2); affects a stated result. Found by HigherHidaAndColemanTheory (#332 at da88512, 2026-10-23, claude opus).
- **Misprint** at §5.14.2, p. 141: the source says for w≠1 the pairing at (−1/2;−1/2), preceded by a minus sign, equals k; it should be the pairing without that sign, which equals k; affects nothing. Found by HigherHidaAndColemanTheory (#332 at da88512, 2026-10-23, claude opus).

## BP-Hida

- **Misprint** at Proposition 4.3.17, p. 49: the source says the normalizing character with unbalanced parentheses around w0,M(κ+ρ)−ρ; it should be −w⁻¹w0,M(κ+ρ)−ρ, as in the following paragraph; affects nothing. Found by HigherHidaAndColemanTheory (#332 at da88512, 2026-10-23, claude opus).
- **Gap** at Proposition 6.2.13 and Theorem 6.2.15, pp. 63–64: the source says M_w is base-changed along an unspecified map Λ→A attached to ν_A; it should be [t]↦ν_A(t)⁻¹, matching the −ν specialization of Remark 5.4.3, p. 57; affects the proof. Found by HigherHidaAndColemanTheory (#332 at da88512, 2026-10-23, claude opus).
- **Misprint** at Proposition 6.2.13, p. 63: the source says the ordinary part equals M_w modulo p^n, with n the analyticity radius; it should be modulo p^r, as the proof states; affects nothing. Found by HigherHidaAndColemanTheory (#332 at da88512, 2026-10-23, claude opus).
- **Misprint** at §1.1, p. 2: the source says M_µ is the unipotent radical of P_µ; it should be the Levi of P_µ, as in §3.1, p. 33; affects nothing. Found by HigherHidaAndColemanTheory (#332 at da88512, 2026-10-23, claude opus).
- **Misprint** at §4.1.12, p. 42: the source says Z_i is a sum up to k whose summation index is again i; it should be Z_k=Σ_{i≤k}D_{g+i}; affects nothing. Found by HigherHidaAndColemanTheory (#332 at da88512, 2026-10-23, claude opus).

## Brambilla–Ottaviani, On the Alexander–Hirschowitz theorem, arXiv:math/0701409v2

- **Misprint** at Proposition 5.3, p. 10: the source says P⁵ in the paragraph treating P⁷; it should be P⁷; affects nothing. Found by  (#144 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Breuil, Une application du corps des normes (1999)

- **Error** at §2.2: the source says the source calls a Frobenius module étale when its semilinear Frobenius is injective, but over an imperfect field such as F_p(t) an injective Frobenius can have singular linearisation; it should be require the linearised Frobenius to be bijective; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Breuil–Conrad–Diamond–Taylor (BCDT, J. Amer. Math. Soc. 2001)

- **Error** at §1.3, the parenthetical beside the inertia table, author pp. 10–12: the source says the table attaches a single Serre weight to the residual representation; it should be that several weights can occur: at p = 5 the split ω⊕1 admits labels (0,0) and (4,0), of weights 2 and 6; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Breuil–Conrad–Diamond–Taylor, JAMS 14 (2001)

- **Misprint** at the end of §8.3: the source says "hence Theorem 4.4.1"; it should be a reference to the result actually concluded there, Theorem 4.4.1 being a wrong cross-reference; affects nothing. Found by  (#135 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at the proof of Lemma 2.3.1, p. 866: the source says N(ϖ) ≡ √−3(1−3√−3) mod 9√−3 for the whole family, true only when B ≡ −3 mod 27 (B=−12 gives √−3(7−3√−3)); it should be √−3(1−3√−3)(1−2(B+3)/3); the extra unit is killed by the character, so δ=1 survives; affects nothing. Found by  (#135 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at §1, the sentence after the definition of admittance (extraction line 609): the source says admittance by σ_(n,0) pins down a single integer Serre weight; it should be a set of allowed weights: at ℓ=3 a nonsplit peu ramifié extension for the unit class [4] is admitted for n=0 and n=2; affects nothing. Found by  (#135 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at §6.4, pp. 901–902: the source says π = α/β is a uniformiser (with α³ = 4); it should be (α−1)/β, of valuation 1/12 and norm −3, since α/β has valuation −1/4; affects the proof. Found by  (#135 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at §§6.3–6.4, pp. 900–902: the source says γ₄² has order 3, in two places; it should be order 2, as stated elsewhere in §6.3 (γ₄² = −1); affects nothing. Found by  (#135 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Breuil–Conrad–Diamond–Taylor, On the modularity of elliptic curves over ℚ: wild 3-adic exercises, JAMS 14 (2001)

- **Misprint** at Corollary 2.3.2, p. 866: the source says GL₃; it should be GL₂, the representations being two-dimensional; affects nothing. Found by  (#135 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Brooks, Shimura curves and special values of p-adic L-functions (IMRN 2015)

- **Misprint** at Propositions 8.12–8.13: the source says the displayed formula without a square; it should be squared, as the preceding formula shows; affects a stated result. Found by  (#147 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Bruinier–Funke, On two geometric theta lifts, arXiv math/0212286v4

- **Misprint** at Lemma 3.1: the source says the image of the Fourier mode H(2πnv)e(nu) carries a factor −2v^(2−k); it should be the formula without that factor, which is what direct differentiation produces; affects a stated result. Found by  (#540 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## BS17

- **Gap** at proof of Proposition 11.41, p. 53: the source says a scheme pushout of the blowup along the non-finite exceptional map exists and is a finite universal homeomorphism over Y; it should be constructed, for instance as the spectrum of H⁰(X, O) ×_{H⁰(E, O)} A/J; affects the proof. Found by CrystallineCohomologyPartII (#296 at 84ea77e, 2026-10-23, claude opus).

## Burns–Sakamoto–Sano (BSS II), arXiv:1805.08448v1

- **Error** at §3.1.3: the source says the dual of the transverse-modified condition F_a^b(n) is F_b^a(n), with no restriction at p = 2; it should be hold for odd p, and for p = 2 only when (|𝔽^×|/2)·T = 0 (witness (−3,−3)₃ = −1 over ℚ₃); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Burns–Venjakob (published version; zeta isomorphisms in noncommutative Iwasawa theory)

- **Error** at Theorem 6.5, formula (40), p.202, and proof formula (48), p.204: the source says the interpolation formula carries Γ(V̂)⁻¹ for an Artin twist ρ; it should be carry the Gamma factor of V̂⊗ρ*, i.e. Γ(V̂)^(−dim ρ); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Burns–Venjakob, arXiv:math/0511672v2

- **Misprint** at Remark 2.4 and Proposition 3.19: the source says the Euler-characteristic formulas with a positive valuation and an inverse absolute value, clashing with Remark 2.3's inverse-determinant convention; it should be χ_add = −ord_L(L*(ρ)) and χ_mult = |L*(ρ)|_p^[L:ℚ_p]; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Burns–Venjakob, On the leading terms of zeta isomorphisms and p-adic L-functions in non-commutative Iwasawa theory, Doc. Math. (2006), arXiv:math/0511672

- **Error** at Remark 5.6, published pp.194–195: the source says a pairing on an unshifted complex, which is not well typed; it should be the pairing on the correctly shifted complex; affects a stated result. Found by  (#169 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Burns–Venjakob, published version (EMS Press; title not given in the report)

- **Misprint** at formula (40), p. 202: the source says the interpolation formula uses the untwisted Gamma factor Γ(V̂)⁻¹; it should be the twisted factor Γ_L(Ŵ)⁻¹, i.e. Γ_ℚp(V̂)^(−dim ρ) for Artin twists, as in its own (48), p. 204; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Burungale–Castella–Grossi–Skinner, Non-vanishing of Kolyvagin systems and Iwasawa theory, arXiv:2312.09301v2

- **Gap** at Proposition 2.2.1 and Theorem 2.2.2, p.17, with Lemma 2.2.4, p.18: the source says the exact paired Selmer length holds for all p≥3, but its proof invokes the rigidity Lemma 2.2.4, stated only for p>3; it should be supplemented by a separate rigidity argument at p=3, or restricted to p>3; affects the proof. Found by  (#159 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Burungale–Castella–Skinner, Base change and Iwasawa main conjectures for GL₂, arXiv:2405.00270v2

- **Misprint** at Lemma 5.1.1: the source says the summands of the Shapiro decomposition are taken over M; it should be over K, because η_F is trivial on G_M; affects nothing. Found by  (#129 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Buzzard 2000 (dyadic level lowering)

- **Misprint** at Theorem 2.8 (proof pp. 104–106): the source says the statement leaves out the hypothesis that the representation is unramified at the removed prime p, which the proof uses on p. 105; it should be stated with that hypothesis; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Buzzard, Eigenvarieties

- **Misprint** at printed p. 40: the source says the cross-reference to Lemma 2.13 there is a slip; it should be as the witness in the cited review requires; affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Böckle–Iyengar–Paškūnas (BIP), Zariski density of crystalline points, Forum Math. Pi

- **Error** at the proof of Theorem 6.8, p. 49 (arXiv line 2781): the source says the whole support of a nonzero test module lies in one component, which does not follow, since a support can meet two components (e.g. Spec L[x,y]/(xy)); it should be a component chosen through a point of the fixed-ψ fibre, which suffices for the argument; affects the proof. Found by  (#252 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Böckle–Iyengar–Paškūnas (BIP), Zariski density of crystalline points, Forum Math. Pi (arXiv v2 numbering)

- **Error** at Lemma 6.5, pp. 47–48 (proof step at arXiv lines 2714–2715): the source says the printed character ψ fails the step at the uniformizer: for F=ℚ₅ with κ(5) the Teichmüller lift of 2, ψ(5)=1 whereas κ̄(5)=2; it should be a corrected choice of ψ compatible with κ̄ at the uniformizer, as the repaired step requires; affects the proof. Found by  (#252 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Calegari–Dimitrov–Tang (title not given in the reviews)

- **Misprint** at Lemma 4.5.11: the source says 𝔽₃ at level five; it should be 𝔽₅, as the subsequent application of the lemma requires; affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Calegari–Dimitrov–Tang, JAMS 38 (2025)

- **Misprint** at Lemma 5.1.20 and the cusp limit, p. 672: the source says the zero-balanced hypergeometric continuation with a wrong Euler-constant sign and without the Gamma normalization; it should be the DLMF 15.8.10 form, k=0 coefficient −log x−2γ−2ψ(a), with the ordinary-normalization prefactor; affects a stated result. Found by  (#132 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Lemma 5.2.9 and its proof, p. 676: the source says the Euler-constant term with the wrong sign in the uniform cusp approximation; it should be −2γ, giving the factors −log x−2γ−2ψ(a±); affects the proof. Found by  (#132 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at the proof of Corollary 6.2.11, pp. 683–684: the source says the outer radius R := (1−r)/2; it should be R = (1+r)/2, which exceeds r (r=3/4 gives 7/8, while (1−r)/2 = 1/8 fails the hypothesis); affects the proof. Found by  (#132 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at the proof of Lemma 5.2.18, p. 678 (maximum growth): the source says large values lie in the exceptional set S(M,N), and does not use the full power stabilizer; it should be the rotated set sS(M,N), via the half-rotation involution, with Shimizu's lemma applied to the full power stabilizer; affects the proof. Found by  (#132 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at the proof of Lemma 5.2.9, p. 676: the source says the coefficient ψ(k)−ψ(k+a); it should be ψ(k+1)−ψ(k+a); affects the proof. Found by  (#132 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Calegari–Dimitrov–Tang, The unbounded denominators conjecture, JAMS 38 (2025)

- **Misprint** at Lemma 5.1.2, (5.1.3), p. 668: the source says ζ_N·F̃_N(τ) = F̃_N(r̃_N·τ) for the displayed rotation matrix r̃_N; it should be r̃_N⁻¹ there, since r̃_N corresponds to ζ_N⁻¹ under the standard left action (N=3, τ=2i check); affects nothing. Found by  (#132 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Calegari–Garoufalidis–Zagier, Bloch groups, algebraic K-theory, units, and Nahm's conjecture, arXiv:1712.04887v3

- **Error** at Definitions 1.1 and 2.1 and Lemma 2.2, pp.2 and 8–9 (projective exterior convention): the source says the five-term relation subgroup C lies in the kernel A of the exterior boundary, with B=A/C; it should be the quotient by C∩A: over ℚ, [2]+[1/2]−[1] has boundary 2∧(−1)≠0; affects a stated result. Found by  (#162 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at Lemma 4.1, Proposition 4.2 and Remark 4.3, pp.21–23: the source says the detection map by reduction at infinitely many primes takes values in a direct sum of the local groups; it should be a direct product, since a nonzero class is nonzero at a positive-density, hence infinite, set of primes; affects a stated result. Found by  (#155 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Calegari–Garoufalidis–Zagier, Bloch groups, algebraic K-theory, units, and Nahm's conjecture, published version (Ann. Sci. ÉNS, doi 10.24033/asens.2537)

- **Error** at Definition 2.1/Lemma 2.2, printed p.391: the source says the comparison from Suslin's Bloch group onto the new negative-unit presentation is surjective for every field; it should be restricted to larger fields: B(𝔽₂)=0 while the new group over 𝔽₂ is ℤ/3; affects a stated result. Found by  (#162 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Calegari–Garoufalidis–Zagier, Bloch groups, algebraic K-theory, units, and Nahm's conjecture, published version (doi 10.24033/asens.2537)

- **Error** at §4.2, Cartan comparison: the source says an integral order q²−1 for the relevant H₃ group; it should be true only after inverting the characteristic: the integral orders at q=2, 3, 4, 5 are 6, 24, 30, 120, against 3, 8, 15, 24; affects a stated result. Found by  (#162 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Calegari–Geraghty ([CG]; the report gives only the abbreviation)

- **Error** at §8.2, p. 79: the source says its sentence on the component set π₀ at p-power level holds with no condition on the class group; it should be restricted to the case where the narrow class group has exponent dividing p^n; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Calegari–Geraghty, Modularity lifting beyond the Taylor–Wiles method (Invent. Math.)

- **Misprint** at Theorem 6.3(b)–(d) and the level-L construction (author journal-layout pp. 90–93): the source says single-bracket rings O[...] at 47 places; it should be the completed rings O[[...]] there, per the authors' published correction (Invent. Math. 227 (2022), 855–856, items (1) and (10)); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Calegari–Geraghty, Modularity lifting beyond the Taylor–Wiles method, arXiv:1207.4224v2

- **Error** at §8.2, p. 79: the source says the component group is the largest exponent-pⁿ quotient of the ray class group of conductor Q; it should be that this holds only when the narrow class group has exponent dividing pⁿ; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Calmès et al. (CDH III), Hermitian K-theory for stable ∞-categories III (arXiv:2009.07225v4)

- **Error** at Proposition 3.1.14, p. 54: the source says an intermediate integral telescope comparison holds for every extended m, including +∞; it should be restricted to finite m integrally, because at +∞ the degree-zero map is multiplication by eight with cokernel ℤ/8, so 2 must be inverted; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Calmès et al., Hermitian K-theory for stable ∞-categories III, arXiv:2009.07225v4

- **Error** at Proposition 3.1.14 and its proof, printed p. 54: the source says L(R;Q^{≥m})[x⁻¹] ≃ L(R;Q^s) integrally for every m in ℤ ∪ {±∞}; it should be stated only for m ≠ +∞, since at m = +∞ for R = ℤ the comparison is multiplication by 8, an equivalence only after inverting 2; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Caraiani–Newton, arXiv:2301.10509

- **Misprint** at Lemma 6.1.7: the source says its "respectively" clause pairs p = 3 and p = 5 with the mod-5 and mod-3 switching inputs; it should be the reverse, p = 3 with the mod-3 input (Proposition 6.1.6) and p = 5 with the mod-5 input (Proposition 6.1.5); affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at Proposition 5.5.2: the source says an integral GL₂ Galois representation valued in the whole Hecke quotient T/J, from absolute irreducibility at one maximal ideal m; it should be localized, T_m = e_m T, J ⊂ T_m and ρ_m valued in GL₂(T_m/J), with the same nilpotence exponent (a product T₁ × T₂ shows the failure); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Caraiani–Newton, arXiv:2301.10509,

- **Error** at Lemma 5.6.5: the source says a trace identity forces Klein-four projective image, omitting the A₄ alternative, as an order-24 group over F₇ with quaternion kernel shows; it should be retain both cases, as DDT does; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Lemma 6.1.7: the source says the primes 3 and 5 in swapped roles; it should be use five for the switch at five and three for the switch at three; affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Caraiani–Newton, On the modularity of elliptic curves over imaginary quadratic fields, arXiv:2301.10509v3

- **Error** at Lemma 5.6.5, printed pp.85–86: the source says the trace identity forces reducibility on the determinant kernel, including the projective-A₄ case; it should be exclude that case or argue differently (over F₇ a group with kernel Q₈ is a counterexample); affects the proof; (used on p.87). Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Castella–Liu–Wan (CLW), Iwasawa–Greenberg main conjecture for non-ordinary modular forms and Eisenstein congruences on GU(3,1)

- **Misprint** at the proof of the Eisenstein-ideal bound, §8, p. 78: the source says the order inequality with ≤; it should be ≥, since E ⊂ P^m gives ord_P ≥ m; affects nothing. Found by  (#129 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## CDN20

- **Misprint** at Lemme 2.18, proof (author p.30): the source says the last companion column uses all-positive elementary symmetric functions; it should be alternating, the coefficient of e_{n+1−k} being (−1)^{k+1}σ_k; affects the proof. Found by PadicLocalLanglandsForGL2QpPartII (#392 at 3e0777d, 2026-10-23, claude opus).
- **Misprint** at Proposition 2.5, proof (author p.22): the source says the Hom has dimension 0 or 1 according as D_pst(V*) is or is not M[−1]*; it should be 1 or 0 respectively; affects nothing. Found by PadicLocalLanglandsForGL2QpPartII (#392 at 3e0777d, 2026-10-23, claude opus).

## CDN23

- **Misprint** at Proposition 5.7 and Théorème 5.8 (pp.51–52): the source says the case condition on the p-quotient tower is M of level ≤ n; it should be M∈ΦNᵖ_n; affects a stated result. Found by PadicLocalLanglandsForGL2QpPartII (#392 at 3e0777d, 2026-10-23, claude opus).
- **Gap** at Proposition 5.7, proof (p.51): the source says DLB's main theorem applies to every supercuspidal M∈ΦNᵖ, though DLB assumes trivial central character; it should be proved for general central characters; affects the proof. Found by PadicLocalLanglandsForGL2QpPartII (#392 at 3e0777d, 2026-10-23, claude opus).
- **Misprint** at Théorème 5.15 (p.55): the source says Ř is Hom(Ř,L); it should be the continuous L-dual of R; affects nothing. Found by PadicLocalLanglandsForGL2QpPartII (#392 at 3e0777d, 2026-10-23, claude opus).
- **Gap** at Théorème 5.24(ii), proof (p.60): the source says the L-duals are finite locally free over R_{B,M}, without argument; it should be proved on each PID factor; affects the proof; <!-- tauceti-roadmap-review {"agent": "claude", "head": "3e0777d", "job": "REV-DESIGN-PadicLocalLanglandsForGL2QpPartII", "model": "opus", "worker": "fable-rev16"} -->. Found by PadicLocalLanglandsForGL2QpPartII (#392 at 3e0777d, 2026-10-23, claude opus).

## Chen

- **Error** at Definition 2.1.6, printed p. 8, and §5.1, printed p. 38 (Chen line 247; Chen line 1486): the source says rotation with conjugated coefficients and q↦q⁻¹ supplies the pivotal dual; it should be extend rotation C(q)-linearly; otherwise f=i·id makes Definition 5.1.1(2)(i) equate iη with −iη; affects a stated result. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Error** at Lemma 5.3.2 and proof, printed p. 41 (Chen line 1626): the source says failure of the recursion at pₙ makes every higher Jones–Wenzl idempotent undefined; it should be distinguish recursive failure from specialization after cancellation; at n=2, q=i, p₃=1−U₁U₂−U₂U₁ is a nonzero normalized annihilating idempotent; affects a stated result. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Remark 2.2.3, adjacent-generator relations, printed p. 10 (Chen line 307): the source says the adjacent relations using Uᵢ₊₁ range over 1≤i<n; it should be restrict to 1≤i<n−1; Uₙ is not a generator of TLₙ; affects a stated result. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Error** at paragraph after Definition 2.4.9, printed p. 20 (Chen line 742): the source says every object of Kar TL lies in the specified TLJ subcategory by taking a unary direct sum; it should be take a replete closure or construct an equivalence; U₁/d∈TL₂ is an idempotent absent from the stated closure under tensor products and direct sums; affects a stated result. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §2.4, tensor product on Mat C, printed p. 20 (Chen line 734): the source says the Kronecker tensor product of morphism matrices uses composition of entries; it should be use tensor products of entries; arbitrary entries are not composable, and composition has the wrong source and target; affects a stated result. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).

## Chojecki–Hansen–Johansson, Overconvergent modular forms and perfectoid Shimura curves, arXiv:1507.04875

- **Error** at Lemma 6.19(2): the source says density for scalars yields density for bounded families of coefficients; it should be that the image need not be dense in the bounded arrays, since the array Σ uⁿTⁿ stays at distance 1; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at Lemma 6.21: the source says a comparison map for scalar extension of coefficient modules that fails, refuted by Teichmüller lifts of residues independent over 𝔽_p; it should be as the witness in the cited review requires; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Cho–Yamauchi, v2

- **Error** at §3.1, p. 12: the source says a point over an arbitrary base algebra is primitive as soon as one maximal minor is a unit; it should be that the maximal minors generate the unit ideal, i.e. a split injection, since one unit minor suffices only over local rings; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Clozel–Harris–Taylor, Automorphy for some l-adic lifts of automorphic mod l Galois representations, Publ. Math. IHÉS 108 (2008)

- **Error** at Proposition 2.4.8(3): the source says a character ratio for the ordinary filtration that needed correction; it should be the ratio given in the authors' erratum; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Coleman, p-adic Banach spaces and families of modular forms (Invent. Math., 1997)

- **Error** at Appendix A3.1: the source says H may be any restricted power series in A⟨T⟩; it should be required that H be entire (in A{{T}}), since the statement fails for G = 1 − pT, H = Σ pⁿTⁿ; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Appendix A3.4: the source says a formula for K(T) that is missing a factor T^n; it should be the formula with the factor T^n included; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Colmez–Dospinescu–Nizioł (CDN), Drinfeld-tower paper,

- **Misprint** at the strict-ball radius-n model: the source says centres are taken modulo π^n with strict radius |π|^n, an inconsistent indexing (ℚ₂, z = 2 shows it); it should be centres modulo π^{n+1}; affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Colmez–Nizioł, arXiv:1505.06471v4

- **Error** at the lattice Z_p(r)′ = p^(−a)Z_p(r) (introduction) and the recalled sequence 0→Z_p t{r}→F^rA_cr→A_cr before Lemma 2.23: the source says this sequence is exact for every r; it should be the lattice (p^a a!)^(−1)Z_p(r); as printed, exactness holds only for a ≤ p−1 (at p=2, r=2, t²/8 lies in the kernel); affects a stated result. Found by  (#110 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Colmez–Nizioł, Syntomic complexes and p-adic nearby cycles, arXiv:1505.06471v4

- **Misprint** at the definition of Z_p(r)′ (introduction) and the recalled sequence of Lemma 2.23(ii): the source says r=(p−1)a+b with 0≤b≤p−1, so (a,b)=(0,p−1) is allowed at r=p−1; it should be 0≤b<p−1: at r=p−1 the kernel of p^(p−1)−φ on F^(p−1)A_cr is spanned by t^(p−1)/p; affects a stated result. Found by  (#110 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Conrad, Arithmetic moduli of generalized elliptic curves

- **Misprint** at Theorem 4.3.4: the source says the cusp data with a wrong (b, r) indexing; it should be as the witness in the cited review requires (an indexing giving the count φ(d)/2); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Conrad, Modular curves and rigid-analytic spaces

- **Error** at Definition 3.1.4 and Theorem 3.1.5: the source says the stalk maps between a formal scheme and its rigid generic fibre must be local homomorphisms; it should be a condition without stalk locality, because for Spf ℤ_p the map ℤ_p → ℚ_p is not local; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at Theorem 2.2.4: the source says the multiplication map on the smooth locus of a generalised elliptic curve is finite flat of constant degree n²; it should be a degree that varies by component, since on a 2-gon over ℚ₃ the map [2] has four points over (1,0) and none over (1,1); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Conrad, Relative ampleness in rigid geometry

- **Error** at Definition 2.2.2: the source says the stalk maps between a formal scheme and its rigid generic fibre must be local homomorphisms; it should be a condition without stalk locality, because for Spf ℤ_p the map ℤ_p → ℚ_p is not local; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Conrad, Semistable reduction for abelian varieties (2011 seminar notes)

- **Misprint** at the helper result in the proof of Theorem 4.4, pp. 10–16: the source says the helper for separated finite-type groups with abelian generic fibre and semi-abelian identity component, assuming no flatness, yet its proof uses that G is integral; it should be add a hypothesis giving this, e.g. G smooth; the non-flat Spec R[e]/(e²−e, πe) shows it is needed; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Conrad, Semistable reduction notes (Darmon CM seminar, 2011)

- **Gap** at the monodromy-criterion pages (no theorem number given): the source says finite-level points are inertia-invariant on the strength of the dimension of the rational Tate-module invariants; it should be supported by a separate finite-level argument, which that dimension count does not supply; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at the pages on finite flat groups at the residue prime (no theorem number given): the source says a wrong rank for the toric or finite part; it should be as the witness in the cited review requires (ranks t and t + 2a); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Conrad–Diamond–Taylor, Modularity of certain potentially Barsotti–Tate Galois representations, JAMS 12 (1999)

- **Misprint** at Lemma 7.2.3, p. 554: the source says the exceptional j-value set without its sign; it should be the signed j-value; affects a stated result. Found by  (#135 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## CR12

- **Misprint** at Corollary 4.5.1, p. 86: the source says the two quasi-resolutions are quasi-birational over X; it should be over S, as the proof shows; affects nothing. Found by CrystallineCohomologyPartII (#296 at 84ea77e, 2026-10-23, claude opus).
- **Misprint** at Introduction, p. 6: the source says the cone over any smooth projective scheme is WO-rational exactly when its higher rational Witt cohomology vanishes; it should be restricted to geometrically connected schemes, as Theorem 4.7.4 (p. 93) is; affects a stated result; <!-- tauceti-roadmap-review {"agent": "claude", "head": "84ea77e", "job": "REV-DESIGN-CrystallineCohomologyPartII", "model": "opus", "worker": "fable-rev10"} -->. Found by CrystallineCohomologyPartII (#296 at 84ea77e, 2026-10-23, claude opus).

## CS24

- **Misprint** at Example 5.6.7, printed p.75: the source says an opening “for i at least 2” contradicts the displayed degree-one surjectivity; it should be carry no restriction (surjective for i≥1, bijective for i≥2); affects a stated result. Found by SchemeAndStackFoundationsPartII (#420 at accb0a0, 2026-10-23, claude opus).
- **Misprint** at proof of Lemma 5.4.2, step (3), printed p.65: the source says the torsion comparison names the unprimed ring's π₀; it should be name π₀ of the primed (semiperfect) algebra; affects nothing. Found by SchemeAndStackFoundationsPartII (#420 at accb0a0, 2026-10-23, claude opus).
- **Misprint** at proof of Theorem 5.7.2, printed p.80: the source says the truncation used in a base change is written without its ring argument; it should be τ≤n(A); affects nothing. Found by SchemeAndStackFoundationsPartII (#420 at accb0a0, 2026-10-23, claude opus).
- **Misprint** at proof of Theorem 5.7.2, printed p.81: the source says faithful flatness is taken modulo (a₁,…,a_n), using the power index; it should be modulo (a₁,…,a_r); affects nothing. Found by SchemeAndStackFoundationsPartII (#420 at accb0a0, 2026-10-23, claude opus).
- **Gap** at proof of Theorem 5.7.2, printed p.81: the source says geometric support cohomology over the non-Noetherian Witt ring is computed by Stacks 0954, which concerns the derived torsion functor; it should be use the extended Čech/dual-Koszul model (Stacks 0A6R) or prove weak proregularity; affects the proof. Found by SchemeAndStackFoundationsPartII (#420 at accb0a0, 2026-10-23, claude opus).
- **Misprint** at §5.2.1, printed p.53: the source says the displayed tensor formula has the full graded homotopy on the left but a single degree on the right; it should be graded on both sides, π_*(N)⊗π₀(M); affects nothing. Found by SchemeAndStackFoundationsPartII (#420 at accb0a0, 2026-10-23, claude opus).

## Darmon–Diamond–Taylor, Fermat's Last Theorem,

- **Misprint** at §4.1, Lemma 4.4, p. 111: the source says the oldform chain index starts at 1, omitting i = 0; it should be 0 ≤ i ≤ v; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Dasgupta–Kakde–Silliman–Wang, On Ribet's lemma in the residually indistinguishable case, arXiv:2310.16396v2

- **Misprint** at the relations defining Q, pp.8–9: the source says the relation with the sign opposite to the one in the statement of Theorem 2.1 (pp.7–8); it should be as the witness in the cited review requires (the sign of Theorem 2.1); affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Datskovsky–Wright (scanned paper; title not given in the report)

- **Error** at p. 69, the transform of the integral-lattice indicator, against the pairing on p. 37 and the Fourier definition on p. 38: the source says the transform is the mass factor times δ(x1, 3x2, 3x3, x4); it should be δ(x1, x2/3, x3/3, x4) with the same mass factor, the annihilator of their own pairing (witness x = (0, 1/3, 0, 0) over ℚ₃); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## de Jong, Crystalline Dieudonné module theory via formal and rigid geometry (Publ. Math. IHÉS 82, 1995)

- **Gap** at the construction of the auxiliary maps in the formal–rigid descent argument (no theorem number given): the source says the source's construction of those maps does not work as printed; it should be as in the author's 1998 erratum (Publ. Math. IHÉS 87, p. 175), which rebuilds them using Artin–Rees; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## de Jong, Crystalline Dieudonné module theory via formal and rigid geometry, Publ. IHÉS 82 (1995)

- **Error** at §7.1.13 (auxiliary maps on the route to Theorem 7.4.1 and Proposition 7.5.2): the source says auxiliary maps that are faulty as printed; it should be as corrected in the author's 1998 erratum (Publ. IHÉS 87), which leaves the main theorems standing; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Deligne, La conjecture de Weil II (1980)

- **Misprint** at (2.2.8)(i) and (3.5.1): the source says the sheaf is pointwise ι-pure of weight 2ℜ(r); it should be weight −2ℜ(r), since (2.1.1) fixes ω₁(γ) = q^{−deg γ}, so the Tate line ω₁ (ℜ = 1) has weight −2; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at the Weyl-group trace identity (section not given in the review): the source says a constant that the roadmap corrects; it should be as the witness in the cited review requires (the review recomputed the identity and agrees with the correction); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Deligne, Équations différentielles à points singuliers réguliers (LNM 163, 1970)

- **Misprint** at II.5.3: the source says 4.3 as this item's number although it sits in §II.5; it should be numbered 5.3; affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Deligne–Serre, Formes modulaires de poids 1 (1974)

- **Error** at Proposition 5.1 and §5.2, pp. 518–519: the source says R_f has its only pole at s = k, but a level-23 weight-one form gives another pole at s = iπ/log 23; it should be holomorphic on Re s ≥ k except for a simple pole at k; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Deligne–Serre, Formes modulaires de poids 1, Ann. Sci. ENS 1974

- **Error** at §5.2, pp. 518–519: the source says the continued Rankin series has no pole except s = k, but at general level ramified Euler factors add poles (η(z)η(23z) gives one at iπ/log 23); it should be only holomorphy on Re(s) ≥ k apart from a simple pole at s = k; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## DI21, arXiv:1906.04616v2

- **Misprint** at Proposition 7.1, p. 23 (tangent cohomology table of Enriques surfaces): the source says χ(Θ) = 10; it should be −10, from the dimension triples (1,12,1) and (0,10,0); affects a stated result. Found by  (#139 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Diao–Lan–Liu–Zhu, arXiv:1803.05786 (title not given in the report)

- **Error** at the proof of Lemma 5.2.3: the source says it argues with a maximal real-split subtorus, which outside the CM range need not be the minimal rank-removing quotient defined in §5.1; it should be argue directly with the §5.1 equal-rank quotient and its split/real-anisotropic decomposition; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Diao–Rosso–Wu, Perfectoid overconvergent Siegel modular forms and the overconvergent Eichler–Shimura morphism, arXiv:2106.00094v3

- **Misprint** at Corollary 3.6.13, pp.46–47: the source says a range for w that lacks the n−1 term (with a further supremum issue); it should be Proposition 3.6.12's range c_g+n−1<w≤n; affects a stated result. Found by  (#167 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Dieulefait–Pacetti, arXiv:2108.07577v2,

- **Error** at Theorem 1.9(3), p. 6: the source says the lift is unramified at its own coefficient prime; it should be crystalline there with Hodge–Tate weights {0, k − 1} (unramified Weil–Deligne parameter), as Paso 3 on p. 12 uses; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## DLB17

- **Error** at Proposition 7.7(b) (arXiv v2 p.38): the source says the orthogonal of the unfiltered lattice is t^k times it for weights 0,k; it should be t times it for every k; affects a stated result. Found by PadicLocalLanglandsForGL2QpPartII (#392 at 3e0777d, 2026-10-23, claude opus).
- **Gap** at Remarque 11.13 (arXiv v2 pp.65–66): the source says agreement on two filtration lines fixes the comparison; it should be three distinct lines, since two leave a diagonal ambiguity; affects the proof. Found by PadicLocalLanglandsForGL2QpPartII (#392 at 3e0777d, 2026-10-23, claude opus).
- **Error** at Théorème 1.10 (arXiv v2 p.11): the source says every infinitely primitivable function on Σ_n lies in O(Ω); it should be locally constant functions times O(Ω), since Σ₀ is two copies of Ω; affects a stated result. Found by PadicLocalLanglandsForGL2QpPartII (#392 at 3e0777d, 2026-10-23, claude opus).
- **Misprint** at Théorème 1.9 (arXiv v2 p.11): the source says n for both the cover level and the cyclotomic level; it should be two different indices; affects nothing. Found by PadicLocalLanglandsForGL2QpPartII (#392 at 3e0777d, 2026-10-23, claude opus).
- **Gap** at Théorème 9.7, proof (arXiv v2 pp.47–48): the source says invertibility of a−c∂ follows from a one-sided identity; it should be completed by a right inverse, e.g. from the identity for g⁻¹; affects the proof. Found by PadicLocalLanglandsForGL2QpPartII (#392 at 3e0777d, 2026-10-23, claude opus).
- **Gap** at Théorème 9.9 (arXiv v2 p.48): the source says the O(Ω)-module structure is unique, with no continuity condition; it should be unique among structures with f ↦ f·ℓ continuous; affects a stated result. Found by PadicLocalLanglandsForGL2QpPartII (#392 at 3e0777d, 2026-10-23, claude opus).
- **Gap** at proof of Théorème 1.10 (§12.1, arXiv v2 p.66): the source says Théorème 1.2 applies to every nontrivial D× type; it should be a separate argument for one-dimensional types and nontrivial central characters; affects the proof. Found by PadicLocalLanglandsForGL2QpPartII (#392 at 3e0777d, 2026-10-23, claude opus).
- **Gap** at proof of Théorème 5.1 (§5.3, arXiv v2 p.30): the source says an unramified twist of the globalized representation may be ignored; it should be removed by a global character before taking isotypic parts; affects the proof. Found by PadicLocalLanglandsForGL2QpPartII (#392 at 3e0777d, 2026-10-23, claude opus).
- **Gap** at §12.2, before Proposition 12.2 (arXiv v2 p.67): the source says Théorème 10.1 puts the whole de Rham complex of Σ_n in the coadmissible derived category; it should be restricted to the supercuspidal isotypic parts that theorem covers; affects the proof. Found by PadicLocalLanglandsForGL2QpPartII (#392 at 3e0777d, 2026-10-23, claude opus).

## Dolgachev–Keum, Finite groups of symplectic automorphisms of K3 surfaces in positive characteristic, arXiv math/0403478v5

- **Error** at the proof of Lemma 4.3 (cached lines 643–647): the source says an automorphism of order at most 2 of a free ℤ_ℓ-module acts trivially mod 2, false (the swap matrix on ℤ₂²); it should be an argument that tracks the integral extension terms, since (4.9) alone gives no bound on ρ(X); affects the proof. Found by  (#563 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at the proof of Theorem 3.3, p. 13 (cached lines 511–520): the source says only orders 11 and 15 survive as extra rank-20 candidates, but n=14 with (a₂,a₇,a₁₄)=(1,1,1) satisfies every relation; it should be a list that includes 14, excluded like the others (root lattice A₁₃⊕A₆⊕A₁, square discriminant 196); affects the proof. Found by  (#563 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Dotto, Breuil–Mézard conjectures for central division algebras

- **Misprint** at the introduction, p. 213: the source says the source relates the characters of Jacquet–Langlands partners on matching elliptic elements by a plain equality; it should be carry the sign (−1)^(d−1), since Steinberg is −1 on elliptic elements while the trivial character of D^× is +1; affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Duke–Imamoḡlu–Tóth (DIT16), Ann. of Math. 184 (2016)

- **Misprint** at (8.4) (residue of the resolvent kernel, pp. 973–975): the source says the polar projector without a complex conjugate; it should be the projector with the conjugate, with which the printed residue display on p. 975 holds for every Hecke–Maass form, odd or even; affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at p. 984: the source says the sine-power integral without the factor 2^{ν−1}; it should be the integral with the factor 2^{ν−1}; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Duke–Imamoḡlu–Tóth, Geometric invariants for real quadratic fields (Ann. of Math. 184, 2016)

- **Misprint** at §8, formula (8.4), pp. 973–974: the source says the source leaves a complex conjugate out of the displayed formula; it should be as the evidence in the cited report requires; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at §8, the residue formula, printed p. 975: the source says the residue of Φ(−m, n; s) as 2Σ‖φ‖⁻² a(m)a(n), which yields +2/‖φ‖² instead of −2/‖φ‖² for an odd eigenform at m = n = 1; it should be have a(−m)a(n) on the right, or equivalently Φ(m, n; s) on the left; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Dummigan–Golyshev–de Jeu–Kerr, arXiv:2605.11100

- **Misprint** at the discriminant of the E₄ family near Proposition 2.2: the source says the factor (u²−1)⁴; it should be 16u⁴(u²−1)² (921600 at u=4), as its own Proposition 2.2(3) minimal discriminant confirms; affects nothing. Found by  (#138 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Edie-Michell-Morrison

- **Error** at §1, Braidings and Monoidal equivalence, printed p. 2 (Edie-Michell-Morrison line 58; Edie-Michell-Morrison line 72): the source says the underlying monoidal label is obtained by reducing ℓ modulo k+2; it should be choose 1≤m≤k+1 with m≡±ℓ modulo 2(k+2); k=2, ℓ=5 gives m=3 and δ=−√2, whereas reduction modulo four gives m=1; affects a stated result. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Error** at §1, field-of-definition paragraph, printed p. 1 (Edie-Michell-Morrison line 28): the source says Q(q) is always the minimal field of definition of Cₖ,ₘ; it should be call Q(q) a field of definition; C₁,₁≅Vec(Z/2) has a split form over Q, whereas q=e^{πi/3} generates a larger field; affects a stated result. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §1, quantum-group comparison, printed p. 3 (Edie-Michell-Morrison line 104): the source says the parameter relation contains cos(mπi/(k+2)); it should be remove i from the cosine argument; for k=m=1 the intended dimension is −1, whereas the printed expression is −2cosh(π/3); affects a stated result. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §2, 6j-symbol formula, printed p. 4 (Edie-Michell-Morrison line 161): the source says the recoupling prefactor has sign (−1)^{e+1}; it should be use (−1)^e; after allowing zero counts, all six labels zero must give the unit recoupling coefficient 1, not −1; affects a stated result. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §2, Basic data and theta formula, printed p. 4 (Edie-Michell-Morrison line 115; Edie-Michell-Morrison line 139): the source says admissibility requires strict triangle inequalities, and theta vanishes unless all three internal counts are positive; it should be allow weak inequalities and nonnegative counts; θ₀,₀,₀=1 and θ₀,₁,₁=δ, while the printed conditions exclude both; affects a stated result. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §2, Galois conjugates, printed p. 5 (Edie-Michell-Morrison line 197): the source says even k gives three braided Galois orbits, immediately before also giving even k one orbit; it should be the three-orbit case is odd k; even k remains the one-orbit case, agreeing with the table on p. 7; affects a stated result. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §2, R-symbol formula, printed p. 5 (Edie-Michell-Morrison line 183): the source says the braiding coefficient has sign (−1)^{(a+b+c)/2}; it should be use (−1)^{(a+b−c)/2}; braiding the unit with X₁ requires R₀,₁,₁=1, while the displayed sign gives −1; affects a stated result. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).

## Edixhoven, Point counting after Kedlaya

- **Error** at the §4.3 reduction step: the source says the decomposition is unique, yet zero input has the nonzero decomposition φ = y/25, b = −Q′/50; it should be unique only after requiring the reduced b to have degree at most 2g − 1; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Ellenberg–Venkatesh–Westerland, Homological stability for Hurwitz spaces and the Cohen–Lenstra conjecture over function fields II, arXiv:1212.0923v1

- **Gap** at Sections 6 and 12 and some theorems of the introduction: the source says results there whose proofs have a gap the authors acknowledged, withdrawing the preprint; it should be that those results are treated as unproved until the gap is closed; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Emerton–Paškūnas (EP), density of supercuspidal points of fixed regular weight in local deformation rings, published pp. 337–371

- **Error** at Lemmas 2.6 and 2.9 (pp. 342–344) and Corollary 3.2 (p. 351): the source says the capture statements without excluding W=0; then {0} would capture O[[K]]≠0, false (witness M=O, H={1}, W=0); it should be stated with the hypothesis W≠0; affects a stated result. Found by  (#252 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Emerton–Pollack–Weston, Variation of Iwasawa invariants in Hida families (2006),

- **Error** at the clause on integral inertia coinvariants of the family representation: the source says these are integrally of rank one with canonical stabilization while allowing residually unramified data, which ηη₂₃ at p = 13 refutes; it should be require residual coinvariant dimension one; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Evertse, Diophantine approximation lecture notes, Chapter 2 (geometry of numbers)

- **Misprint** at the change-of-coordinates remark after Theorem 2.9, §2.3, printed pp. 24–25: the source says body and lattice may be moved together by a linear change of coordinates, without the invertibility this needs; it should be require the linear transformation to be invertible; affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Evertse–Schlickewei–Schmidt (ESS02, arXiv math/0409604v1)

- **Gap** at (2.10) and (6.3) against (11.19): the source says the result with a 4n exponent budget, but the proof's small-error step (11.19) uses 5n, and with 4n that bound fails; it should be stated with 5n, or the 4n small-height step needs further justification; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Faltings, Endlichkeitssätze für abelsche Varietäten über Zahlkörpern, Invent. Math. 73 (1983)

- **Error** at the height argument along the tower of isogenies (corrected by the author's 1984 erratum, parts a) and b)): the source says the printed argument lacks the two corrections the erratum supplies; it should be an argument separating the toric-intersection and integral-closure defects by two shifts in the required order, giving only eventual stationarity of heights; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Fargues–Scholze, Geometrization of the local Langlands correspondence, arXiv:2102.13459

- **Error** at VI.11.2, p. 237: the source says the source says, in its argument on high Frobenius images and connected SL₂-subgroups containing a torus, a characteristic-two shortcut that the reports call erroneous; it should be as the evidence in the cited report requires (a separate modular argument keeping the characteristic-two normalizer distinction); affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Feng–Galatius–Venkatesh, The Galois action on symplectic K-theory (2022)

- **Misprint** at §§2.6–2.7, pp. 12–15, even-degree line of the dualization and Bott-edge comparison (extraction line about 629): the source says twist 2k−1 (an apparent slip); it should be twist 2k; affects nothing. Found by  (#127 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Feng–Yun–Zhang (FYZ)

- **Error** at Remark 2.1, §2.1: the source says every étale quadratic cover admits an everywhere-unramified character restricting to η^n for all n, by geometric cup-product alternation; it should be the criterion that such a character exists iff η^n kills ker(ν*: Pic X→Pic X′), which fails for odd n on the étale double cover of E/𝔽₃: y²=x³+2x²+2x; affects a stated result. Found by  (#142 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Fontaine, Il n'y a pas de variété abélienne sur Z (1985)

- **Misprint** at the proof of Proposition 1.5, p. 520: the source says the inverse-Herbrand boundary value with the upper break u_{L/K} where the lower break belongs; it should be eψ(m) = e·i_{L/K} − 1/d at m = u_{L/K} − 1/e, d = |G_(i_{L/K})| (8/3, not 35/3, for ℚ₃(ζ₉)/ℚ₃); affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Fontaine, Il n'y a pas de variété abélienne sur Z (Invent. Math. 1985)

- **Misprint** at the boundary formula just before §1.6: the source says at m = u − 1/e one has eψ(m) = e·u − 1/d; it should be eψ(m) = e·i − 1/d, since the source's own inverse identity gives ψ(u − 1/e) = i − 1/(ed) (8/3, not 35/3, for ℚ₃(ζ₉)); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at §1.6: the source says its criterion on ideals as an equivalence in terms of a real cutoff m, which fails over ℚ₃ with m = 1/4; it should be give only sufficient bounds in m, with the exact equivalence stated through the least nonzero valuation c of the ideal; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Fouquet–Wan, The Iwasawa main conjecture for universal families of modular motives (FW)

- **Misprint** at the residual assumption A21 and its use (extraction lines 928–929): the source says implicitly that A21 forces the residual endomorphisms to be scalars; it should be stated with the extra assumption that the coefficient field contains the eigenvalues of ρ̄|G_ℚp (Frobenius polynomial X²+2 over 𝔽₅ gives End = 𝔽₂₅); affects the proof. Found by  (#129 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Fouquet–Wan, The Iwasawa main conjecture for universal families of modular motives, arXiv:2107.13726v3

- **Error** at proof of Lemma 3.13: the source says rank-one coinvariants follow from an arbitrary integral lift of a nontrivial residually unipotent element; it should be a genuine unipotent with a unit off-diagonal entry: the lift [[1,1],[ϖ,1+ϖ]] has det(g−1)=−ϖ and torsion coinvariants; affects the proof. Found by  (#165 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Fu (fu24), Annals of Math. 200

- **Gap** at Theorem 3.2, the PBW growth estimate, pp. 8–11 (argument at arXiv line 537): the source says the estimate across the whole weight strip, but the argument proves it only for k≥α; it should be supplemented by an argument covering the remaining weights of the strip; affects the proof. Found by  (#241 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at Theorem 5.1 (arXiv lines 782–785): the source says Theorem 5.1 for weights λ beyond those its argument covers; at p=3, λ=1 the quantity 2λ+1=3 is not a square in ℚ₃; it should be restricted to induced weights λ, for which the relevant value is (μ+1)²; affects a stated result. Found by  (#241 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Gan–Gross–Prasad, Symplectic local root numbers, central critical L-values, and restriction problems, arXiv:0909.2999v1

- **Misprint** at §18, pp. 71–75 (change-of-μ formula, cached line 2627): the source says the twisted representation is π·μ0⁻¹; it should be the twist consistent with the relation ν_{μ′} ≅ μ0·ν_μ stated just before (line 2623); affects a stated result. Found by  (#521 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Gao, Generic rank of Betti map and unlikely intersections, arXiv:1810.12929v6

- **Error** at the proof of Lemma 9.1: the source says a generic relative-dimension formula that ignores exceptional fibres; it should be corrected to include the exceptional locus (the graph of a blow-up in a constant abelian family has an exceptional ℙ¹); affects the proof. Found by  (#122 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Garoufalidis–Scholze–Wheeler–Zagier, The Habiro ring of a number field, arXiv:2412.04241v2

- **Error** at Definition 1.1, (13)–(15) and Remark 1.2, pp.6–7: the source says the components of the arithmetic Habiro ring are domains, without qualification; it should be restricted to K∩ℚ(ζ_d)=ℚ: for K=ℚ(i), d=4 the element (1−i⊗ζ₄)/2 is an idempotent other than 0 and 1; affects a stated result. Found by  (#155 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Example 4.3, (270)–(275), p.54 (cubic-field example, factor degrees 2 and 1): the source says one exponent of the root in the cubic relation with a wrong value; it should be the corrected exponent (2, the value the review's check uses); affects nothing. Found by  (#168 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Example 4.4, (289)–(290) (rational quadratic Gauss family): the source says the companion Gauss value at order m=4 is +2; it should be −2 (the companion values at m=1,…,4 are i, 0, −i, −2); affects nothing. Found by  (#152 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Lemma 2.3, equation (67): the source says the u-term of the root expansion U_m with a sign that is wrong; it should be +(m−1)/(2m), as the q=−1 expansion of (T;q)_∞, U=(1+T)^(−1/2)=1−T/2+…, shows; affects a stated result. Found by  (#152 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at Lemma 3.1, Propositions 3.2–3.3, (177)–(178), pp.38–39: the source says the residue values of the finite-field dilogarithm span, by an argument that excludes the value zero; it should be argued separately for the prime field (zero occurs: over 𝔽₅ the values are 1, 4, 0) and by spans of differences otherwise; affects the proof. Found by  (#168 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Proposition 2.2, equation (56), p.19: the source says the logarithmic Frobenius defect of the infinite Pochhammer symbol has residue +p·Li₂^(p)(ζ) in the coordinate x=q−1; it should be −p·Li₂^(p)(ζ), as the source's own (48)–(49) force (the two differ mod 25 at p=5, ζ a cube root of unity); affects a stated result. Found by  (#155 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Theorem 8, (163)–(171): the source says the ordinary Hessian of the potential is used; it should be the logarithmic Hessian (at A=0, z=1−t they differ: −t/(1−t) against −1/(1−t)); affects a stated result. Found by  (#152 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at Theorems 11–12, displays (215)–(231), finite constant-term formula: the source says the constant root coefficient of the normalised symmetrisation is 1/(m^N δ_A(t)) times a finite sum over the m-th roots; it should be multiplied by an extra factor ∏T_i^(m−1), T=t^(1/m): at A=0, N=1, m=2 the printed form gives (1+T⁻¹)/(1−T²), not 1/(1−T); affects a stated result. Found by  (#152 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at footnote 1, p. 6: the source says the general constant-family embedding uses Frobenius φ_m; it should be inverse Frobenius, to satisfy its own equation (13): for F=ℚ(ζ₇), p=11, a=ζ₇, φ₁₁(a⁴) = a² ≠ a; affects nothing. Found by  (#151 at , 2026-10-23, backfill from earlier reviews (claude opus)).
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

## Gee, Arizona Winter School 2013 notes on modularity lifting (arXiv v2)

- **Misprint** at the displayed dimension formula, p. 18: the source says H⁰_{S,T} = F also for nonempty T, so the formula lacks a −1; it should be a count with |T| − 1, as in the source's own Proposition 5.10, 3.24(3) and the rank-one case; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Getz (title not given in the review)

- **Misprint** at a locator the review does not give: the source says an equality of spherical dimensions without a restriction it needs; it should be as the witness in the cited review requires; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Getz, An introduction to automorphic representations (author PDF)

- **Error** at §6.4, the Casimir eigenvalue displayed with Lemma 6.19 and Remark 6.20: the source says the source's displayed Casimir scalar contradicts the scalar the same notes give for the full O(2) modules in §6.5; it should be as the evidence in the cited report requires; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## GHW22

- **Misprint** at footnote 1, p. 2: the source says [HKW21, Example 4.2.7] for f_! as group homology; it should be Example 4.2.4 in the published HKW22; affects nothing. Found by VStackSheavesAndLisseCategoriesPartII (#441 at 0987ba7, 2026-10-23, claude opus).
- **Gap** at the proof of Proposition 4.4, p. 20: the source says FS21 Remark IV.1.4(ii) applies to any chart; it should be first refine to a clean (separated) chart by Remark 1.2.ii, as Remark IV.1.4 needs a separated map; affects the proof; <!-- tauceti-roadmap-review {"agent": "claude", "head": "0987ba7", "job": "REV-DESIGN-VStackSheavesAndLisseCategoriesPartII", "model": "opus", "worker": "fable-rev12"} -->. Found by VStackSheavesAndLisseCategoriesPartII (#441 at 0987ba7, 2026-10-23, claude opus).
- **Misprint** at the proof of Theorem 3.14, pp. 17–18: the source says “Proposition 3.14” and refers to “the map ??”; it should be Theorem 3.14 and the map (3.1); affects nothing. Found by VStackSheavesAndLisseCategoriesPartII (#441 at 0987ba7, 2026-10-23, claude opus).

## Glasscock–Merriman–Robertson–Smyth, Ergodic theory with applications to continued fractions (2020)

- **Misprint** at Theorem 21, p.46: the source says the Khinchin-constant factor with the denominator k(k+1); it should be a(a+2) (equivalently k(k+2)); affects a stated result. Found by  (#172 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## GLX, arXiv:2208.07195

- **Error** at Lemma 3.2, second assertion: the source says a connected-component formula for the quotient by a group action, with no restriction on the action; it should be stated under additional component and Hausdorff hypotheses, since ℤ acting densely on ℤ_p violates it; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## GNT19

- **Error** at Lemma 2.20, p. 16: the source says Witt direct images vanish above the maximal fibre dimension for any morphism of separated finite-type schemes; it should be stated for proper f, since an open immersion A²∖0 → A² has a nonzero first direct image; affects a stated result. Found by CrystallineCohomologyPartII (#296 at 84ea77e, 2026-10-23, claude opus).
- **Misprint** at Proposition 2.23, p. 18: the source says the ideal of the structure sheaf of X is an ideal sheaf on Y; it should be an ideal sheaf on X whose zero set contains the exceptional locus; affects nothing. Found by CrystallineCohomologyPartII (#296 at 84ea77e, 2026-10-23, claude opus).

## Goncharov, Geometry of configurations, polylogarithms, and motivic cohomology, Adv. Math. (1995)

- **Misprint** at §3, restatement of the relations of Definition 1.5: the source says the triangle/incidence relation with an extra endpoint term η/3; it should be the relation of Definition 1.5, which has no such term; affects nothing. Found by  (#170 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at §5.2, case (e), auxiliary-point reduction: the source says the reduction with an inconsistent sign; it should be C=−Σ(−1)^i C_i with the auxiliary point last (the seven-term boundary gives C+Σ(−1)^i C_i=0; moving it first adds (−1)^5); affects the proof. Found by  (#170 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Goncharov, Polylogarithms, regulators, and Arakelov motivic complexes, arXiv:math/0207036v3

- **Misprint** at the Chow polylogarithm forms, a later display (earlier definition at cached extraction line 1067): the source says the r-form with the wrong number of entries, contradicting its own definition; it should be the definition's arity (for p=1, q=2, r₂ has three entries) with normalisation (2πi)^−p; affects nothing. Found by  (#170 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at §§5.4–5.5, Borel calibration (near Theorems 5.7 and 5.11): the source says the matrix-unit calibration of the weight-two Borel class has value 1; it should be 1/2: for X=E₁₂, Y=E₂₁, Z=E₂₂ the alternating trace is −3 and half of it −3/2; affects a stated result. Found by  (#170 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Goodman-Wenzl

- **Error** at Proposition 1.1, printed p. 4 (Goodman-Wenzl line 125): the source says dim(eAf) is preserved by specialization for every diagram-spanned A; it should be require eA⊆A and Af⊆A; in T₃ set d=t+t⁻¹, e=E₁/d, u=eE₂(1−e), f=1−e+(t−1)u, A=⟨1⟩: ef=(t−1)u gives dimensions 1→0 at t=1; affects a stated result. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Proposition 2.1 proof, printed p. 9 (Goodman-Wenzl line 745): the source says the relevant semisimple quotient has only noncritical zᴸ_λ blocks of width at least ℓ; it should be include the critical z_λ blocks as well, as required by §2.4 properties 1–2; affects the proof. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Proposition 2.1 proof, printed p. 9 (Goodman-Wenzl line 751): the source says Hom(n,m) is multiplied on the right by zⁿⁱˡ_m and on the left by zⁿⁱˡ_n; it should be use Hom(n,m)zⁿⁱˡ_n + zⁿⁱˡ_m Hom(n,m); the printed products have incompatible objects when n≠m; affects the proof. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Gap** at Proposition 2.1, final proof step, printed p. 10 (Goodman-Wenzl line 764): the source says the endomorphism argument extends to unequal objects through the retractions of §1.1, without excluding d=0; it should be give a separate argument for τ=±i, or restrict to d≠0; those retractions divide by d; affects the proof. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §2.4, property 3, printed p. 8 (Goodman-Wenzl line 695): the source says the generic corner uses zᴸ_{λ′}, although only λ and μ were introduced; it should be use zᴸ_μ as the right idempotent; affects nothing. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).

## Granville–Soundararajan, Sieving and the Erdős–Kac theorem (2006)

- **Error** at proof of Proposition 2 (moment expansion), p.4: the source says a count of the contributing compositions that is wrong; it should be the binomial coefficient C(k−s−1, s−1) (k=5, s=2 gives 2); affects the proof. Found by  (#172 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Greither, Class groups of abelian fields, and the main conjecture (Ann. Inst. Fourier, 1992)

- **Error** at the dyadic case of the proof, pp. 472–473: the source says the relevant Kummer kernel is a Klein four-group; it should be only a group killed by 2, by a complex-conjugation cocycle argument; for K = ℚ with M = 4 or 8 it is cyclic of order 2; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Gros, Classes de Chern et classes de cycles en cohomologie de Hodge–Witt logarithmique (Mém. SMF, 1985)

- **Error** at Chapitre I, §5.1, (5.1.11)–(5.1.12): the source says Ru_*O^* is quasi-isomorphic to the envelope's multiplicative de Rham complex; (O, d+dt) on A¹ over F_p, which is not quasi-nilpotent, refutes this at n = 1; it should be as the evidence in the cited report requires; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Harari–Szamuely, Arithmetic duality theorems for 1-motives (J. reine angew. Math., 2005)

- **Gap** at journal pp. 120 and 123 (the completed duality sequences): the source says these sequences without verifying finite-level strictness or passing to the profinite localization quotient; it should be impose both, as the authors' corrigenda (printed pp. 1 and 5) require; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Gap** at the strictness step corrected in the authors' corrigenda: the source says a strictness property that its corrigenda flag as unjustified; it should be as the witness in the cited review requires (the published corrigenda); affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Harbater–Obus–Pries–Stevenson (HOPS), arXiv:1408.0859

- **Error** at the sketch of the general affine-curve case of Abhyankar's conjecture: the source says to glue at a point above the punctures where the tame quotient cover ramifies, assuming such a point exists; it should be that any point above the punctures may serve, possibly unramified, using an affine-line cover split there; a once-punctured elliptic curve with C_p × C_ℓ² is a counterexample; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Harbater–Obus–Pries–Stevenson (HOPS), arXiv:1408.0859v1 (per the reviewer also v2)

- **Error** at the proof sketch of Theorem 3.6, Serre's solvable step on the affine line, pp. 10–11: the source says pulling an ℓ-torsion local system back along the tame map z ↦ z^m multiplies the H¹ dimension by m; it should be d′ = m·d + (m − 1)·dim H, since Swan conductors scale by m; with p = 2, ℓ = 3, m = 3, d goes from 0 to 2; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Harbater–Obus–Pries–Stevenson, Abhyankar's conjectures in Galois theory, arXiv:1408.0859v1

- **Error** at §3.3, sketch of the solvable step in Theorem 3.6: the source says the invariant grows under the m-fold pullback as d′ = m·d; it should be m·d + (m − 1)·dim H, since the characteristic-two S₃ case gives 2, not 0; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Heath-Brown, Lectures on sieves, arXiv:math/0209360v1

- **Misprint** at Theorem 5.1, p.35, and Corollary 5.1: the source says the lower-bound form of the linear sieve with a wrong sign; it should be the corrected sign (the review confirms the correction is needed); affects a stated result. Found by  (#177 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Helm (Hel16, arXiv:1201.1874v3)

- **Error** at Proposition 2.4, p. 5, and Theorem 11.8, p. 58: the source says objects of a block embed into direct sums of copies of the block's injective object, and §11's stability and adjunction arguments use such sums; it should be products of copies; for the trivial type of GL₁(ℚ₂) with ℓ = 3, invariants of the direct sum are 3-power torsion; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at §11, the duality passage just before Theorem 11.17, pp. 60–61: the source says the pairing between a module and its dual is perfect; it should be only a nondegenerate evaluation pairing, with Hom identified in one direction between opposite summands; an infinite direct sum for GL₁(ℚ₂), ℓ = 3, is a counterexample; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at §4, p. 11: the source says a simple module on which ℓ is invertible becomes absolutely irreducible after some finite extension K′; it should be that it splits into finitely many Galois-conjugate absolutely simple summands, as Lemma 4.5 states; 𝒦[t]/(t² − 3) is simple but splits over 𝒦(√3); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at §4, p. 9, the cuspidal type data of Theorem 4.2: the source says the order 𝔄 in the type data is a maximal order of M_n(F); it should be an order normalised by E^× that meets the centraliser of E in a maximal order; for E totally ramified of degree n, 𝔄 is the Iwahori order; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Helm, The Bernstein center of smooth W(k)[GL_n(F)]-modules (Hel16, arXiv:1201.1874v3)

- **Error** at Theorems 4.2 and 4.4, pp. 9–11: the source says these hold over an arbitrary field R and for any irreducible cuspidal π over a field K′; it should be for R algebraically closed or π absolutely irreducible, twisting over an algebraic closure; ℚ₂, ℓ = 3 with 𝒦[t]/(t² − 3) is a counterexample; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Henk, Successive minima and lattice points, arXiv:math/0204158v1

- **Misprint** at p. 2: the source says a ceiling bracket there that the review confirms is a misprint; it should be as the witness in the cited review requires; affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## HKW22

- **Misprint** at Definition 4.1.7, footnote 4 and the paragraph after Theorem 4.1.8, pp. 23–24, 28: the source says GHW22 Definitions 4.3 and 4.1, Propositions 4.10 and 4.17; it should be GHW22 v1 Definitions 4.1 and 1.1, Proposition 4.8(i),(iii), Proposition 4.14; affects nothing. Found by VStackSheavesAndLisseCategoriesPartII (#441 at 0987ba7, 2026-10-23, claude opus).
- **Misprint** at Definition 4.3.1, p. 28: the source says tr(f) is ev after f ⊗ id after coev, with no symmetry; it should be the symmetry X⊗X^∨ → X^∨⊗X is inserted before ev, as in LZ22 Construction 1.6; affects nothing. Found by VStackSheavesAndLisseCategoriesPartII (#441 at 0987ba7, 2026-10-23, claude opus).
- **Misprint** at Definition 4.3.4, tensor product of 1-morphisms, p. 30: the source says the target is (c₂ × d₂)^!(A₂ ⊠ A′₂); it should be (c₂ ×_S d₂)^!(A′₁ ⊠_S A′₂); affects nothing. Found by VStackSheavesAndLisseCategoriesPartII (#441 at 0987ba7, 2026-10-23, claude opus).
- **Misprint** at Definition 4.5.1, pp. 36–37: the source says the composite applies the diagonal's upper-shriek to the constant sheaf on T; it should be the constant sheaf on U ×_T U, as in (4.1.3); affects nothing. Found by VStackSheavesAndLisseCategoriesPartII (#441 at 0987ba7, 2026-10-23, claude opus).
- **Error** at Example 4.1.1, p. 22: the source says maps [S/G] → [S/H] correspond to S-homomorphisms G → H; it should be H-torsors on S with commuting G-action, giving homomorphisms only after trivialising; affects a stated result. Found by VStackSheavesAndLisseCategoriesPartII (#441 at 0987ba7, 2026-10-23, claude opus).
- **Error** at Example 4.3.10, p. 33: the source says Theorem 4.3.8 applies to any correspondence over a proper X; it should be the correspondence must also be proper over S; affects a stated result. Found by VStackSheavesAndLisseCategoriesPartII (#441 at 0987ba7, 2026-10-23, claude opus).
- **Gap** at Theorem 4.1.8, p. 24: the source says GHW22 Theorem 1.4 gives (P1)–(P5), (BC1)–(BC2) and Rf_! ≅ Rf_* on all proper fine maps; it should be Theorem 1.4 gives agreement, pseudo-functoriality, projection formula, proper base change and adjoint only; affects a stated result. Found by VStackSheavesAndLisseCategoriesPartII (#441 at 0987ba7, 2026-10-23, claude opus).
- **Gap** at equations (4.5.8)–(4.5.9), p. 40: the source says functoriality and monoidality of the based fibre product are straightforward and gives no proof; it should be they need a proof from the coherence of the Künneth maps; affects the proof. Found by VStackSheavesAndLisseCategoriesPartII (#441 at 0987ba7, 2026-10-23, claude opus).
- **Misprint** at the proof of Lemma B.1.1, pp. 72–73: the source says the exponent is m in 𝔪^{m−1} and in Λ/𝔪^{m−1}; it should be k; affects nothing. Found by VStackSheavesAndLisseCategoriesPartII (#441 at 0987ba7, 2026-10-23, claude opus).
- **Misprint** at the proof of Theorem 4.5.3, p. 41: the source says the fixed locus is fibred over In_S(T₁); it should be In_S(T); affects nothing. Found by VStackSheavesAndLisseCategoriesPartII (#441 at 0987ba7, 2026-10-23, claude opus).
- **Error** at §4.6, closing remark, p. 44: the source says isolated fixed points over U make the inertia étale over [U//G]; it should be étaleness of the fixed locus over U is needed (fails for the affine group on P¹); affects a stated result. Found by VStackSheavesAndLisseCategoriesPartII (#441 at 0987ba7, 2026-10-23, claude opus).
- **Misprint** at §5.3, p. 48: the source says the trace map is described before Definition 4.3.5; it should be before Definition 4.3.6; affects nothing. Found by VStackSheavesAndLisseCategoriesPartII (#441 at 0987ba7, 2026-10-23, claude opus).

## HT

- **Error** at the proof of Corollary 1.3.13, p.19: the source says the category generated by the isocrystal is equivalent to representations of the full tensor stabilizer; it should be use the generated category's own group H ⊂ G and restriction from G; affects the proof. Found by ShimuraVarietiesPartII (#428 at 57dc0a4, 2026-10-23, claude opus).
- **Gap** at the proof of Proposition 1.3.10, p.18: the source says the source fixes any place of the torus reflex field above v; it should be take the place induced by the fixed p-adic embedding, so that Lemma 1.3.9 applies to the torus; affects the proof. Found by ShimuraVarietiesPartII (#428 at 57dc0a4, 2026-10-23, claude opus).
- **Gap** at §1.3.15, p.20: the source says a unique μ-ordinary class in the acceptable set with no existence hypothesis; it should be assume existence, which holds for quasi-split groups and fails for the quaternion unit group; affects a stated result. Found by ShimuraVarietiesPartII (#428 at 57dc0a4, 2026-10-23, claude opus).

## HTT

- **Misprint** at the proof of Proposition 5.3.3.3, printed p.394 (HTT line 18710): the source says the cofinal map from N(A) is given the ∞-category of spaces as target; it should be the κ-filtered ∞-category I, as the factorization that follows requires; affects nothing; <!-- tauceti-roadmap-review {"agent": "claude", "head": "d195541", "job": "REV-DESIGN-SolidAnalyticRings", "model": "opus", "worker": "fable-rev7"} -->. Found by SolidAnalyticRings (#910 at d195541, 2026-10-23, claude opus).
- **Misprint** at the proof of Proposition 5.3.3.3, printed p.394 (HTT line 18710): the source says the cofinal map from N(A) lands in the ∞-category of spaces; it should be the κ-filtered ∞-category I; affects nothing; <!-- tauceti-roadmap-review {"agent": "claude", "head": "802490a", "job": "REV-DESIGN-SolidAnalyticRings~2", "model": "opus", "worker": "fable-rev17"} -->. Found by SolidAnalyticRings (#910 at 802490a, 2026-10-23, claude opus).

## Huber, Étale Cohomology of Rigid Analytic Varieties and Adic Spaces (1996)

- **Misprint** at proof of Corollary 4.2.9, part (2), p. 246: the source says the displayed base change between the finite-rank model and the original scheme points the wrong way; it should be show X as the base change X₀ ×_{A₀} A of the model along A₀ → A, a Cartesian square over A; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at §3.5, proof of Proposition 3.5.6, p. 204: the source says the parenthetical example takes the auxiliary valuation ring to be the completion of k(x)⁺, whose fraction field need not be algebraically closed; it should be the completion of C⁺ for a chosen geometric point over x; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Huybrechts, Lectures on K3 surfaces (author draft)

- **Misprint** at Chapter 18, §3, Example 3.4: the source says (via "respectively") discriminant −64 for the infinite-height case p≡3 mod 4 and −p² for the other case; it should be the reverse: −p² for infinite height (rank 22, p-elementary), −64 for the other; affects a stated result. Found by  (#563 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## HW23

- **Misprint** at Corollary 4.6 proof (arXiv v2; published Corollary 4.7), p. 21: the source says the restrictions of the divisorial contraction to S and its normalization map to X; it should be the contraction target Z; affects nothing. Found by CrystallineCohomologyPartII (#296 at 84ea77e, 2026-10-23, claude opus).

## Illusie, Complexe de de Rham–Witt et cohomologie cristalline (Ann. Sci. ENS, 1979)

- **Error** at I.3.21 (I.3.21.1.5, printed p. 579): the source says a proof of I.3.21 that the author's own errata call incorrect; it should be replaced by the argument of Illusie–Raynaud, Les suites spectrales associées au complexe de de Rham–Witt, II.1.3; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Illusie, Complexe de de Rham–Witt et cohomologie cristalline (Ann. Sci. ÉNS 1979)

- **Error** at I.3.21.1.5, p. 579: the source says a formula there that the author's own errata (entry for p. 579) withdraw; it should be replaced by the corrected argument of Illusie–Raynaud (Publ. Math. IHÉS 57, 1983), II.1.3, p. 125, reducing étale-locally to the polynomial basic-Witt computation; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kakde, arXiv:1008.0142v3

- **Error** at Lemma 118, second case, p. 87: the source says a trace-multiplier equality that fails (checked on C_{p²} × C_{p²}); it should be the multiplier (|H̃|/|P′|)·|⟨h⟩|·i_P², using compatible generators and |P′| dividing |H̃|, after which the lemma's containment survives; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kakde, The main conjecture of Iwasawa theory for totally real fields, arXiv:1008.0142v3

- **Error** at Lemma 118, p.87: the source says |H̃|·|⟨h₀⟩|/|P| = |H̃|·i_P, false for P=⟨(a,b^p)⟩ in C_{p²}×C_{p²}; it should be (|H̃|/|P′|)·|⟨h⟩|·i_P², still divisible by p·i_P²; affects the proof; (the bound survives). Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at §3 (character decompositions of Λ(G) and its K-groups): the source says the components are indexed by all absolute irreducible characters, which overcounts conjugate characters (e.g. Z₅[C₃]); it should be index by Galois-orbit representatives, as the paper's own §5.1 does; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kato, Logarithmic structures of Fontaine–Illusie (1989)

- **Misprint** at the log PD-envelope theorem (as corrected in Du–Moon–Shimizu, arXiv: the source says 2603.00559, Theorem 2.1(2), footnote 2): the source says the base divided powers must extend to the ambient Y; it should be extension to the source X; ambient extension does not imply it (F₂[e,h]/(e²,eh,h²), γ₂(ae+bh) = a²h); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Katz, p-adic properties of modular schemes and modular forms (LNM 350, 1973)

- **Misprint** at §1.8, printed p. 87: the source says the source describes level-one forms as the fibre product of the full level-3 and level-4 form modules; it should be take their GL₂-invariant parts (with 3, resp. 4, inverted), as its own invariance argument uses; in characteristic two the dimensions differ (2 versus 1); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kawasaki (the 2000 Macaulayfication paper, cited through Česnavičius; title not given in the review)

- **Misprint** at the conditions restated as Česnavičius Proposition 3.11: the source says the conditions with five misprints, which Česnavičius records in footnote 4, p. 13; it should be as Česnavičius Proposition 3.11 states them; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kawasaki, On Macaulayfication of Noetherian schemes (Trans. Amer. Math. Soc., 2000)

- **Misprint** at the five colon estimates whose corrections Česnavičius (arXiv: the source says 1810.04493v2) discusses: the source says five of these estimates in misprinted form, as Česnavičius records; it should be as the evidence in the cited report requires; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kedlaya, A p-adic local monodromy theorem (Ann. of Math. 2004)

- **Misprint** at the Bessel-equation example: the source says the relevant Artin–Schreier cover is z^p − z = y, which already splits over k((y)); it should be z^p − z = 1/y; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kedlaya, A p-adic local monodromy theorem, early arXiv preprint (math/0110124)

- **Error** at the Bessel example: the source says the example becomes unipotent after adjoining only y = (t/4)^{1/2}; it should be the larger extension that also adjoins y^{1/2} and the Artin–Schreier cover z^p − z = y, as in the published version (Ann. of Math. 160 (2004), §1.5, p. 101); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kedlaya, Finiteness of rigid cohomology with coefficients, arXiv:math/0208027v6

- **Misprint** at Definition 3.2.1: the source says the definition without requiring the algebra A to be regular; it should be required that A is regular, as the author's own errata list states; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kedlaya, Local and global structure of connections on nonarchimedean curves (Compositio 2015)

- **Gap** at §4.6, the nonmonomial induction: the source says the induction goes through as printed, without the fibre-functor and filtration adjustments; it should be as repaired in the author's 2017 corrigendum, with corrected neutral fibre functor and filtration steps; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kedlaya, Local monodromy of p-adic differential equations: an overview, arXiv:math/0501361

- **Misprint** at Theorem 5.4.10 (wild-ramification induction): the source says a maximal proper subgroup containing H^i for the lowest wild break i, but under its own Definition 2.1.6 H^i is the whole group; it should be a subgroup containing H^{i+}; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kedlaya, Notes on analytic number theory, ch. 12 (KED-ANT-12)

- **Misprint** at §12.4, Theorem 12.2, second inequality: the source says the second inequality with a printed sign slip; it should be the opposite sign (the review confirms the slip against the source text); affects a stated result. Found by  (#177 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kedlaya, overview of p-adic local monodromy (math/0501361)

- **Misprint** at the proof of Theorem 5.4.10: the source says a subgroup containing H^i; it should be a subgroup containing H^{i+}; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kedlaya, Semistable Reduction IV

- **Error** at Lemma 5.6.2 (used in the proof of Theorem 5.0.1): the source says tame alterations preserve terminal presentations, an acknowledged error; it should be repaired as in Kedlaya, Local and global structure of connections on nonarchimedean curves (arXiv:1301.6309), Remark 4.6.7, using Corollary 4.6.5; Theorem 5.0.1 survives; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kedlaya, Sheaves, stacks, and shtukas (Arizona Winter School 2017 notes)

- **Gap** at the descent theorem for sheafy rings, as discussed in Hansen–Kedlaya, Remark 4.6: the source says the descent statement holds, but its published proof is incomplete, as Hansen–Kedlaya point out; it should be as the evidence in the cited report requires; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kedlaya, Slope filtrations revisited (math/0504204v4)

- **Misprint** at Definition 4.4.1: the source says the rank is at most n; it should be positive and at most n, since the argument needs nonzero rank; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kedlaya–Liu (KL), Relative p-adic Hodge theory: Foundations,

- **Error** at 8.1.6 (taut maps), in a sentence beside its local formulation: the source says an equivalence phrased with globally spectral maps; it should be use locally spectral maps, global spectrality holding only in qcqs cases (witness: the non-quasi-compact partially proper open disc); affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kedlaya–Liu, "Relative p-adic Hodge theory: Foundations" (arXiv:1301.0792v5)

- **Error** at Remark 8.4.8, pp. 168–169: the source says the source concludes that A is normal from A being an integral domain; it should be assume A normal (noetherian) explicitly, because integrality does not imply normality; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kedlaya–Liu, Relative p-adic Hodge theory I (2015)

- **Error** at the proof of Lemma 2.6.2, p. 53: the source says each stage's plus ring is the image of the integral restricted power-series ring, which need not be integrally closed as Definition 2.4.1 requires; it should be the integral closure of that image, since for ℚ_p⟨T⟩[ε]/(ε²) the element ε/p is integral but not in the image; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kedlaya–Liu, Relative p-adic Hodge theory II (2016)

- **Error** at the proof of Theorem 8.2.3, with Remarks 8.1.2–8.1.4 and Proposition 1.4.22: the source says functions on a seminormal space are recovered by pushing forward from a resolution, with no overlap check; at a node, (1,0) on the normalization is not such a function; it should be that sections agreeing on the resolution's reduced Čech overlap descend, by a finite-algebra subintegrality and seminormality argument; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kedlaya–Liu, Relative p-adic Hodge theory II, arXiv:1602.06899

- **Error** at Remark 8.1.4, p. 159 (used in the proof of Theorem 8.2.3, pp. 162–163): the source says O_X ≅ f_*O_Y for seminormal X and a smooth proper birational resolution f; it should be that O_X is the subsheaf of sections of f_*O_Y compatible on Y ×_X Y, since for a node the section (1,0) does not descend; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kedlaya–Liu, Relative p-adic Hodge theory: Foundations (KL I)

- **Error** at Lemma 5.5.5: the source says a version of the lemma that the authors later corrected in Relative p-adic Hodge theory II, Appendix A (pp. 189–191); it should be as the evidence in the cited report requires (the KL II Appendix A correction, not restated there); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at the definition of primitive elements: the source says a definition of primitive elements that the authors later corrected in Relative p-adic Hodge theory II, Appendix A, pp. 189–191; it should be as the evidence in the cited report requires (the KL II Appendix A correction, not restated there); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at the proof on pp. 128–129 (final element): the source says the final element carries an R subscript; it should be carry an S subscript, since that element lies in the S ring; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at the proof on pp. 128–129 (initial term of a recursion): the source says the recursion starts from z₀ = 0; it should be as the evidence in the cited report requires (a zero start can only reconstruct zero; the residual recursion fixes the intended start); affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at the proof on pp. 128–129 (module coefficients): the source says FÉt, a category of finite étale objects, serves as the scalar ring of a module; it should be the underlying period ring; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kedlaya–Xiao, Differential modules on p-adic polyannuli

- **Error** at Theorems 1.4.21 and 1.5.6: the source says a value-group membership that lacks a normalizing factor, refuted by a rank-one module over the Gauss field with p = 3; it should be (r/ω^{1/p^h})^dim ∈ |K^×|^{1/p^h}; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kedlaya–Xiao, Differential modules on p-adic polyannuli (v4)

- **Misprint** at Remark 1.4.2 (with Definitions 1.2.8 and 1.4.1, pp. 7, 9–10): the source says the intrinsic radius equals |u| times R; it should be R divided by |u|; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Khare–Thorne (cited as KT; arXiv manuscript, title not given in the reports)

- **Misprint** at §5, the normalization display between Lemmas 5.2 and 5.3: the source says e_i ↦ q^{i(n−i)/2}T_i, with a positive exponent; it should be e_i ↦ q^{−i(n−i)/2}T_i, matching the source's own Bernstein definition; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Khare–Wintenberger (KW09)

- **Gap** at Lemma 7.2(i), case q_v ≡ −1: the source says the printed proof deduces γ_v from the residual representation alone; it should be as the witness in the cited review requires; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kharlampovich–Myasnikov, arXiv:math/0312509v2

- **Misprint** at the "equivalent" regularity clause, p. 9: the source says the regularity clause in a printed form that the roadmap corrects and the review confirms as wrong; it should be as the witness in the cited review requires; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kharlampovich–Myasnikov, Implicit function theorem over free groups (arXiv:math/0312509v2)

- **Error** at Theorem 2(3): the source says the source describes the radical by the single commutator relation [z b⁻¹, c], which is too small when c is a proper power (Britton/HNN witness); it should be use the relations [z b⁻¹, h] for every h in the centraliser of c; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kharlampovich–Myasnikov, Implicit function theorem over free groups, arXiv:math/0312509v2

- **Misprint** at Theorem 2(3)–(5), p. 9: the source says items (3)–(5) in a printed form that the roadmap corrects and the review confirms as wrong; it should be as the witness in the cited review requires; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Khayutin, Joint equidistribution of CM points, Ann. Math. 189 (2019)

- **Error** at Lemma 9.11, pp.225–226: the source says the estimate without excluding small s, where it breaks down as s→0; it should be restricted to s≥1; affects a stated result. Found by  (#177 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Lemma 9.21, (43)–(44) and the final prime-sum estimate, pp.230–231: the source says these displays without the Möbius-difference factors; it should be the displays with those factors retained; affects the proof. Found by  (#177 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Gap** at Lemma 9.23, the two-case proof, p.231: the source says the two-case argument as if it covered α=0 with uniform constants; it should be a separate treatment of α=0, with constants depending on the fixed α; affects the proof. Found by  (#177 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Gap** at Lemma 9.9, (38), pp.224–225, lcm-discrepancy step: the source says the bound up to the full A^(1/2) cutoff, with the lcm-discrepancy step not justified; it should be supported by the missing lcm-discrepancy argument (no counterexample to the wider statement is known); affects the proof. Found by  (#177 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Lemma B.4, pp.266–267 (singular-prime recursion): the source says the m≥1 smooth term and the closed formula in misprinted form; it should be the corrected term and formula (the review checked the corrections without restating them); affects a stated result. Found by  (#177 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Khayutin, Joint equidistribution of CM points, Ann. Math. 189 (2019), arXiv:1710.04557

- **Misprint** at Lemma 5.8, printed p.184: the source says the different of the full local toral order has a generator whose norm equals the discriminant; it should be equality only up to sign, as ideals: in the split case the generator (π,−π) has norm −π², the discriminant ideal (π²); affects a stated result. Found by  (#159 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kisin (the paper whose §4.1.6 is corrected in Kisin–Shin–Zhu §5.12.4; the report gives no title)

- **Error** at §4.1.6: the source says the same positive-multiplier polarization descends to a torsor twist, without real triviality of the torsor; it should be that descent requires a real point of the torsor; the twist of E² by Spec ℚ(i) shows the descended form can be indefinite; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kisin, Integral models for Shimura varieties of abelian type (2010)

- **Error** at Lemma 3.1.5: the source says a polarization descends to a coefficient-torsor twist whenever the multiplier character is positive; it should be required in addition that the torsor have a real point, the correction made in Kisin–Shin–Zhu §5.12.4, p. 174; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kisin, Mod p points on Shimura varieties of abelian type (2017)

- **Error** at §4.1.6: the source says the same polarization descent for coefficient-torsor twists, with no condition at the real place; it should be required that the torsor be trivial over ℝ, as Kisin–Shin–Zhu §5.12.4 notes; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kisin, Modularity of 2-adic Barsotti–Tate representations, Invent. Math. 178 (2009)

- **Misprint** at Corollary (2.4.6), author p. 33: the source says the ordinary quotient is a domain, omitting the case where it is zero; it should be "zero or a domain", as the proof of (2.4.5) allows; the irreducible S₃ ≅ GL₂(𝔽₂) residual representation over ℚ₂ has no ordinary lifts; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kisin, Potentially semi-stable deformation rings, J. Amer. Math. Soc. 21 (2008)

- **Error** at the uniqueness of finite-height lattices: the source says an argument that needed repair; it should be the repaired argument of the author's Errata (E.4), author DVI p. 34; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kisin, The Fontaine–Mazur conjecture for GL₂

- **Error** at published Lemma (2.2.11) (numbered (2.2.10) in the author's DVI): the source says a multiplicity criterion that Gee–Kisin, arXiv:1208.3179v5, Appendix B, B.5, p. 39 explicitly replaces; it should be as the evidence in the cited report requires (the replacement statement in Gee–Kisin B.5); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at the generic-rank, multiplicity and graded-piece statements corrected in Gee–Kisin, arXiv: the source says 1208.3179v5, Appendix B: the source's versions of these statements needed correction; it should be generic rank 2^|R|, the reciprocal multiplicity factor, support on the weight ring, and an extra local exclusion; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kisin–Pappas, Integral models of Shimura varieties with parahoric level structure (2018)

- **Error** at Lemma 4.4.8: the source says polarization descent for coefficient-torsor twists holds with no condition at the real place; it should be required that the torsor be trivial over ℝ, as Kisin–Shin–Zhu §5.12.4 notes; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kisin–Pappas, Integral models of Shimura varieties with parahoric level structure (arXiv:1512.01149)

- **Error** at Lemma 4.4.8: the source says a polarization with positive multiplier descends to the twist of an abelian scheme by a torsor, with no condition at the real place; it should be that descent requires the torsor to have a real point, as Kisin–Shin–Zhu §5.12.4 does; twisting E² by Spec ℚ(i) gives an indefinite form; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Koenigsmann, Defining ℤ in ℚ, Ann. Math. 183 (2016) (read in arXiv v2)

- **Misprint** at Proposition 6 (with ℤ_(∞)=[−4,4]) and Remark 8(a), dyadic table row (6,15): the source says the row (6,15) is sent to (1,1,0); it should be a triple giving 5 mod 8, since (1,1,0) gives −21≡3 mod 8 (the triple (1,1,1) gives 69≡5); affects the proof. Found by  (#164 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Koshikawa, arXiv:2007.14037 (cited as K1; title not given)

- **Misprint** at Example 1.4 of the introduction: the source says the comparison applies to mixed-characteristic input over W(k), with no Cartier-type hypothesis; it should be a qcqs smooth Cartier-type log scheme over (k, ℕ→0) with k perfect, as its site setup and Theorem 6.3 require; affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Koshikawa–Yao, arXiv:2306.00364v1

- **Error** at the essential-image criterion for p-Kummer local systems (test spaces of Definition 7.12): the source says the source's criterion needed the authors' corrigendum (Lemma 1(2)); it should be test on saturated log diamonds with strictly totally disconnected underlying space and p-divisible characteristic, since all-divisible test spaces miss tame inertia; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kosters–Wan (cited as kw)

- **Misprint** at Proposition 4.4, pp. 15–16: the source says the upper-ramification filtration of an Artin–Schreier–Witt extension without clamping; it should be the clamped filtration, which the conductor computation needs; affects a stated result. Found by  (#142 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Koukoulopoulos–Maynard, On the Duffin–Schaeffer conjecture, Ann. Math. (2020)

- **Misprint** at Lemma 5.3, printed p.264: the source says the overlap estimate carries the indicator of M(q,r)>gcd(q,r); it should be 2M(q,r)≥gcd(q,r): for q=2, r=3, ψ≡3/10, M=9/10<1 yet the overlap has measure 1/6; affects a stated result. Found by  (#172 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Koymans–Milovic, arXiv:1809.09597v1 (cited as KM-21)

- **Misprint** at Lemma 4.1, p.20: the source says an element where an ideal is meant, and a wrong period for the rational norm; it should be the ideal and the corrected period; affects a stated result. Found by  (#177 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## KP

- **Error** at Lemma 4.6.13 and Corollary 4.6.15, pp.202–203 (repeated in (4.6.20), p.205): the source says one p-level connected component for every coset representative j; it should be use the component at level jK°_pj⁻¹; affects a stated result; corrected in print at KPZ §7.3.1(3), pp.86–87. <!-- tauceti-roadmap-review {"agent": "claude", "head": "57dc0a4", "job": "REV-DESIGN-ShimuraVarietiesPartII", "model": "opus", "worker": "fable-rev13"} -->. Found by ShimuraVarietiesPartII (#428 at 57dc0a4, 2026-10-23, claude opus).
- **Gap** at Theorem 4.2.7, p.186 (with §3.2): the source says the source omits the very-good condition needed for the tensor-compatible local model diagram; it should be assume a very-good embedding; affects a stated result; corrected in print at KPZ Remark 7.1.4(1), p.73. Found by ShimuraVarietiesPartII (#428 at 57dc0a4, 2026-10-23, claude opus).
- **Gap** at the proof of Lemma 3.1.17, p.169: the source says the source deduces a limit from convergence in a non-complete τ-topology; it should be prove p-adic completeness and logarithmic tail convergence; affects the proof; corrected in print at KPZ §7.3.1(2), p.86. Found by ShimuraVarietiesPartII (#428 at 57dc0a4, 2026-10-23, claude opus).
- **Error** at the proof of Theorem 4.2.7, p.186: the source says the source calls the frame-to-filtration map a torsor; it should be the smooth action morphism; affects the proof; corrected in print at KPZ §7.3.1(1), p.85. Found by ShimuraVarietiesPartII (#428 at 57dc0a4, 2026-10-23, claude opus).

## KZ

- **Misprint** at Proposition 4.2.3(5), p.34: the source says the inertia coinvariants of the cocharacter group of G^ab are torsion; it should be torsion-free, as Lemma 4.2.4 and p.41 use; affects nothing. Found by ShimuraVarietiesPartII (#428 at 57dc0a4, 2026-10-23, claude opus).
- **Misprint** at §3.2.5, p.23: the source says the source forms the first-order ideal from the maximal ideal and uniformizer multiples in A_E, just after introducing the maximal ideal of A_G̃; it should be use A_G̃ throughout; affects nothing. Found by ShimuraVarietiesPartII (#428 at 57dc0a4, 2026-10-23, claude opus).
- **Error** at §5.1.3, p.47: the source says rational points of the conjugacy quotient are the semisimple rational conjugacy classes over any characteristic-zero field; it should be geometric points classify geometric classes, and rational points are Galois-stable geometric classes; affects nothing. Found by ShimuraVarietiesPartII (#428 at 57dc0a4, 2026-10-23, claude opus).

## L08

- **Error** at proof of Lemma 3.1.3.5, printed p.10: the source says it asserts that a quasi-compact scheme has finitely many connected components, which fails for Spec of an infinite product of fields; it should be use the finitely many values of the locally constant rank; affects the proof. Found by SchemeAndStackFoundationsPartII (#420 at accb0a0, 2026-10-23, claude opus).
- **Error** at proof of Lemma 3.1.4.3(i), printed p.12: the source says it uses d trivializing complexes and nilpotence exponent d in Krull dimension d, which fails for d=0; it should be use d+1 of each; affects the proof. Found by SchemeAndStackFoundationsPartII (#420 at accb0a0, 2026-10-23, claude opus).
- **Gap** at proof of Lemma 3.1.4.3(iv), printed p.12: the source says it deduces that n kills η from nilpotence and (r+η)ⁿ∈ℤ, which nilpotence alone does not give (ℤ[η]/(η²+2η,η³): (1+η)²=1, 2η≠0); it should be argue in K₀⊗ℚ and clear denominators; affects the proof. Found by SchemeAndStackFoundationsPartII (#420 at accb0a0, 2026-10-23, claude opus).

## Lagarias–Li, arXiv:1506.06161v1

- **Misprint** at equation (2.5), the Lerch differential relations: the source says the partial differential equation with a positive sign on the s-term; it should be carry the negative sign, because the lowering operator sends −sΦ(z,s+1,c) to −sΦ(z,s,c); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Lan, Arithmetic compactifications of PEL-type Shimura varieties (thesis)

- **Gap** at Remark 1.4.3.8: the source says the source tacitly assumes that the order containing O is stable under the involution when enlarging; it should be keep O and enlarge only the lattice, with no such requirement, as the author's official errata (printed p. 11) states; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Lan, PEL-type thesis

- **Error** at Lemma 1.2.5.10: the source says the lemma in a form that the author's errata correct; it should be as the witness in the cited review requires (the errata's corrected statement); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Lan, PEL-type thesis (original version)

- **Error** at the enlargement of the finite set □ of primes (original errata p. 16; revised thesis Lemma 1.4.4.2 and Proposition 1.4.4.3, pp. 105–106): the source says the finite-□ comparison in a form the errata flag as defective; it should be an open-and-closed immersion in general, an equivalence only under self-dual-lattice uniqueness, as revised; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Land–Mathew–Meier–Tamme, Purity in chromatically localized algebraic K-theory, J. Amer. Math. Soc. (2024)

- **Misprint** at Remark 3.11: the source says the stable K-theory colimit is displayed with ΩM; it should be the corrected expression (the review confirms the printed ΩM is a misprint but does not restate the fix); affects nothing. Found by  (#175 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Lemke Oliver–Wang–Wood, The average size of 3-torsion in class groups of 2-extensions (Forum Math. Pi 13, 2025), publisher version,

- **Misprint** at Lemma 2.1 (with Remark 2.2, pp. 7–9): the source says one letter d for both the absolute degree (theta restriction) and the relative degree (base-discriminant exponent); it should be N = [L:ℚ] in the theta restriction and d = [L:K] in the exponent, as in Lemma 2.4 and the proof; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Lemmermeyer, The Ambiguous Class Number Formula Revisited, arXiv:1309.1071v1

- **Misprint** at Proposition 1 (extraction line 93): the source says "strongly ambiguous" at one point where this is a slip; it should be the class notion consistent with the proposition's ambiguous/strongly ambiguous quotient; affects nothing. Found by  (#122 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Leslie19

- **Gap** at proof of Proposition 4.5, p. 15: the source says multiplying by the nonsingular-locus indicator gives compact support there; it should be use a determinant-valuation cutoff equal to one on det(supp r_!f), as Proposition A.3 needs; affects the proof; <!-- tauceti-roadmap-review {"agent": "claude", "head": "80a66cc", "job": "REV-DESIGN-EndoscopicTransferAndUnitaryTraceComparisonPartII", "model": "opus", "worker": "fable-rev9"} -->. Found by EndoscopicTransferAndUnitaryTraceComparisonPartII (#309 at 80a66cc, 2026-10-23, claude opus).

## Leslie25

- **Misprint** at (3.8) and proof of Lemma 3.11, pp. 28–29: the source says densities and pushforwards are evaluated at x·x^τ; it should be r(x) = −x·x^τ, harmless because −1 is a unit norm when E/F is unramified; affects nothing. Found by EndoscopicTransferAndUnitaryTraceComparisonPartII (#309 at 80a66cc, 2026-10-23, claude opus).
- **Misprint** at Lemma 1.8, p. 12: the source says the centralizer is taken in U(W) although δ lies in Herm(V); it should be U(V); affects nothing. Found by EndoscopicTransferAndUnitaryTraceComparisonPartII (#309 at 80a66cc, 2026-10-23, claude opus).
- **Misprint** at Lemma 3.1, p. 23: the source says the modular character of P(a,b)(E) uses F-absolute values of E-determinants; it should be use the normalized absolute value of E; affects nothing. Found by EndoscopicTransferAndUnitaryTraceComparisonPartII (#309 at 80a66cc, 2026-10-23, claude opus).
- **Gap** at Proposition 4.8, p. 37: the source says the hypothesis is for spherical functions in rank n; it should be cover ranks a and b too, since the proof uses them; affects nothing. Found by EndoscopicTransferAndUnitaryTraceComparisonPartII (#309 at 80a66cc, 2026-10-23, claude opus).
- **Misprint** at Remark 4.4, p. 35: the source says the appendix author's name with a wrong letter; it should be Gordon; affects nothing. Found by EndoscopicTransferAndUnitaryTraceComparisonPartII (#309 at 80a66cc, 2026-10-23, claude opus).
- **Misprint** at proof of Proposition 4.8, p. 38: the source says the upper augmented test is φ⊗1_Λ, evaluating to φ; it should be (φ∗1₀)⊗1_Λ, evaluating to φ∗1₀; affects nothing. Found by EndoscopicTransferAndUnitaryTraceComparisonPartII (#309 at 80a66cc, 2026-10-23, claude opus).
- **Gap** at proof of Proposition 4.8, p. 38: the source says four-form signs depend on the number of split forms, while Xiao18 Theorem 6.1, p. 23, uses the second form only; it should be supply a convention conversion; affects nothing. Found by EndoscopicTransferAndUnitaryTraceComparisonPartII (#309 at 80a66cc, 2026-10-23, claude opus).
- **Error** at proof of Proposition 4.8, p. 39: the source says base change of a spherical function is supported on cosets with all coweight entries even; it should be only that the Satake squares commute, since BC(T_(1,0)) on GL₂ has −(q−1)T_(1,1); affects the proof. Found by EndoscopicTransferAndUnitaryTraceComparisonPartII (#309 at 80a66cc, 2026-10-23, claude opus).
- **Gap** at proof of Proposition 5.2, p. 43: the source says the Weyl element acts on the defect through the intersection of the orbital-image spaces; it should be extend the agreeing actions to their sum, as BP21 §4, p. 8 does; affects the proof. Found by EndoscopicTransferAndUnitaryTraceComparisonPartII (#309 at 80a66cc, 2026-10-23, claude opus).
- **Misprint** at §2.2.3 after Remark 2.8, p. 19: the source says the datum has embedding η; it should be the embedding ξ of the fixed datum; affects nothing. Found by EndoscopicTransferAndUnitaryTraceComparisonPartII (#309 at 80a66cc, 2026-10-23, claude opus).
- **Misprint** at §3 introduction, p. 22: the source says the reduction is an unresolved proposition label; it should be Proposition 3.12, p. 30; affects nothing. Found by EndoscopicTransferAndUnitaryTraceComparisonPartII (#309 at 80a66cc, 2026-10-23, claude opus).
- **Misprint** at §4.1.2, p. 32: the source says the unitary invariants use powers of x; it should be use powers of the Hermitian variable y; affects nothing. Found by EndoscopicTransferAndUnitaryTraceComparisonPartII (#309 at 80a66cc, 2026-10-23, claude opus).
- **Misprint** at §4.1.4, p. 33: the source says the embedding's upper-left block is x; it should be y; affects nothing. Found by EndoscopicTransferAndUnitaryTraceComparisonPartII (#309 at 80a66cc, 2026-10-23, claude opus).
- **Error** at §5.1, p. 40: the source says the Hermitian Fourier kernel is ψ of the norm of ⟨u,w⟩, with argument x; it should be ψ(Tr⟨u,w⟩) with argument y, as in BP21 §3, p. 5; affects the proof. Found by EndoscopicTransferAndUnitaryTraceComparisonPartII (#309 at 80a66cc, 2026-10-23, claude opus).

## Lipnowski–Tsimerman, arXiv:1511.02212

- **Error** at §5 (concentration estimate): the source says the source's growth-constant normalization needed correction and the argument misses the real-Weil surface with Weil polynomial (x²−p)²; it should be as the witness in the cited review requires (corrected normalization; separate quaternionic hypothesis for that surface); affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Lipnowski–Tsimerman, arXiv:1511.02212v1

- **Error** at Lemma 2.1 and Corollary 2.2, p. 5: the source says the integer power sums lie in too small an interval (a smaller counting constant) and omits part of the reciprocity caveat; it should be 4g·q^(j/2)+1 possible values per power sum, giving the constant (4g+1)^g, with reciprocity stated; affects a stated result. Found by  (#122 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at Lemma 5.19, p. 36: the source says its elliptic-curve point-group statement for every prime p; it should be restricted to odd p, as it fails at p = 2 (y²+xy = x³+x²+1 over 𝔽₂ has #E(𝔽₂)=2 and #E(𝔽₄)=8); affects a stated result. Found by  (#122 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Lipnowski–Tsimerman, How large is A_g(F_q)?, arXiv:1511.02212v1

- **Misprint** at equations (51), p. 30, and (56), p. 33: the source says the leading terms are [K:ℚ]n² log n and g² log g, with coefficient 1; it should be coefficient 1/2, since the factorial product of its own (39) gives Σ_(j≤g) log((j−1)!) = ½g² log g + O(g²); affects a stated result. Found by  (#122 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Liu–Tian–Xiao–Zhang–Zhu (an earlier version; title not given in the reviews)

- **Error** at the reflex-lattice construction: the source says there is a model over the reflex field; it should be the auxiliary-extension construction of the published version, which withdraws that assertion; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Liu–Tian–Xiao–Zhang–Zhu (ltxzz)

- **Error** at Proposition 2.6.7, positive-loss case: the source says as obvious that the detecting evaluations can be diagonalized by a change of basis; it should be only a scaled inverse C with DC = CD = π^c I, since over O/π⁵, D = [[π,1],[0,π]] admits no diagonalizing basis; affects the proof. Found by  (#118 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Liu–Tian–Xiao–Zhang–Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives (ltxzz)

- **Error** at Proposition 2.6.6: the source says very special inert places with a diagonal localization basis exist without a span hypothesis; it should be stated with the hypothesis that the O_λ-span of θ_S(G_(S,γ)) contains λ^c Hom(S,·), without which it fails for [F:F⁺]=2, where G_(S,γ) can be trivial; affects a stated result. Found by  (#118 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Liu–Tian–Xiao–Zhang–Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives, arXiv:1912.11942v3

- **Error** at Lemma 5.11.3(2), p. 98 (same claim in the published version): the source says Q††→P†† is a trivial ℙ¹-bundle; at n=2, p=3 over a quartic C it is ℙ(O_C⊕O_C(4)), with a section of self-intersection −16, so not a product; it should be the projectivization of the sum of the two link normal lines, only Zariski-locally trivial; affects a stated result. Found by  (#589 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at the printed proof at cached lines 702–707: the source says restriction of scalars followed by extension gives identical copies of the adjoint; the summands are Frobenius twists (over 𝔽₄₉, C₄₈-weights 7, 6: k-linear Hom vanishes, the x↦x⁷ twist does not); it should be a decomposition into Frobenius twists, requiring Hom vanishing for every twist of the adjoint; affects the proof. Found by  (#589 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Li–Reinecke–Zavyalov, "Relative Poincaré duality in nonarchimedean geometry" (arXiv:2410.08200v1)

- **Misprint** at Remark 3.1.10, pp. 22–23: the source says the source puts the class of a line bundle in a cohomology group of the wrong degree; it should be H¹(X_ét, G_m), that is Pic(X); affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at the chart diagram for Lemmas 6.1.9–6.1.10, pp. 71–73: the source says the lower chart arrow carries the étale counit of g₁, repeating the label of the upper arrow; it should be the étale counit of g₂; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Lurie, Spectral Algebraic Geometry (SAG)

- **Error** at Construction 25.2.2.2 and Proposition 25.2.3.4(2): the source says exterior powers are the coinvariants of the sign-twisted symmetric-group action on tensor powers; it should be the alternating quotient, which also kills repeated factors (rank one over ℤ: exterior square 0, signed coinvariants ℤ/2; over F₂: F₂); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Manning–Shotton

- **Error** at the norm-fibre argument for Theorem 6.8: the source says the norm fibres are taken over a quotient wider than the reduced-norm image, which a ℚ(√3) narrow-class example refutes; it should be use the quotient by Nrd(D^×), which equals the totally positive elements F_+^×; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Manning–Shotton, arXiv:1907.06043v2

- **Error** at the proof of Theorem 6.8 (strong approximation and norm fibres): the source says the source quotients by F× although reduced norms from a totally definite quaternion algebra are totally positive; it should be the narrow quotient by F₊×; F = ℚ(√3), with class number 1 and narrow class number 2, shows the difference; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Matomäki–Radziwiłł, Multiplicative functions in short intervals, arXiv:1501.04585v4

- **Error** at Theorem 3 (physical p.7) and the comparison at cached extraction lines 1601–1607: the source says the mean-square comparison over the finite good set in [X,2X] holds uniformly up to h=X, with no upper-endpoint error; it should be a bound with an added h/X term: for f=1, h=X and a dense good set the integral is at least X/36; affects a stated result. Found by  (#172 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Maynard, Small gaps between primes, Ann. Math. 181 (2015)

- **Misprint** at Lemma 8.1, definition of G_{b,j}, p.409 (also (8.6)): the source says the sum defining G_{b,j} starts at r=1; it should be a sum that includes the r=0 term; affects a stated result. Found by  (#177 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at the matrix-positivity assertion after Lemma 8.2, p.411: the source says the quadratic form of the J-integrals is positive definite on the polynomial coefficients; it should be only positive semidefinite: a nonzero two-variable polynomial (square integral 1/3150) has identically vanishing fibre integrals; affects the proof. Found by  (#177 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Mazur–Rubin, Controlling Selmer groups in the higher core rank case (cited as MR16; arXiv:1312.4052)

- **Error** at hypothesis (H.4), its p = 2 branch: the source says transverse local conditions are self-dual also when p = 2; it should be self-dual only for odd p, or for p = 2 when (|𝔽^×|/2)·T = 0 (witness (−3,−3)₃ = −1 over ℚ₃); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Mazur–Rubin, Kolyvagin systems (Mem. AMS, 2004)

- **Error** at Proposition 1.3.2(ii), p. 12, and the p = 2 branch of (H.4): the source says Nβ = α^{d/p^k}, and transverse self-duality for every p; it should be Nβ = ξ^{d(d−1)/2}α^{d/p^k} with ξ ∈ μ_{p^k}, so self-duality needs p odd or p^k | d(d−1)/2 (witness (−3,−3)₃ = −1, 𝔽₂ coefficients); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Meyer–Wagner, q-Hodge complexes and refined TC⁻, arXiv:2410.23115v4

- **Error** at the proof of Lemma 3.7, p. 32: the source says the rationalisations vanish (the finite-coefficient rational corner); it should be that the non-completed rational corner is nonzero and must be kept: for the zero ring, polynomial animation gives dR_(0/ℚ) = ℚ; affects the proof. Found by  (#149 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Milne, Abelian Varieties (v2.00, 2008)

- **Gap** at I 15.4–15.5 and 15.8, pp. 65–67: the source says the conjugation orbit of an idempotent matches the image Grassmannian without proving the orbit closed; it should be add that closedness, derived from e² = e and the fixed block traces; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Milne, Arithmetic Duality Theorems (2nd ed., 2006)

- **Misprint** at Chapter I, Remark 5.2(a): the source says the Euler-characteristic expression has the archimedean term H⁰(G_v, M) in its denominator; it should be the corresponding term for the dual module M^D; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Milne, Complex Multiplication (lecture notes)

- **Gap** at the proposition accompanying the ramified slope theorem for CM abelian varieties: the source says it but leaves its proof to be added; it should be supplied with a proof, which the review could not close from the notes; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Milne, Introduction to Shimura Varieties

- **Misprint** at 14.16(b) (the "More precisely" sentence): the source says the canonical model for Sh°(G₂, X₂), with G₂ where another group is meant; it should be as the witness in the cited review requires; affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Milne, Kazhdan's theorem on arithmetic varieties (author exposition, 1984)

- **Error** at the statement of Clozel's input near Conjecture 3.17: the source says the source asks at once for a fixed nontrivial level at a place p₀ and for trivially intersecting adelic levels, which is impossible; it should be Clozel's hypotheses: fixed supercuspidal place, shrinking at a disjoint finite set, trivially intersecting arithmetic groups, bound after discarding finitely many levels; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Milne, Shimura varieties and moduli (notes)

- **Misprint** at the printed calculation behind Proposition 8.8 and Corollary 8.9: the source says the weight adjustment in the construction with a prescribed derived cover is made with the wrong sign; it should be the opposite sign, as the roadmap uses; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## MilneLEC

- **Error** at §21, Definition 21.7, p. 133 (MilneLEC lines 5151–5153): the source says Y = i(Z) ∪ j(U) without requiring complementary images or a closed immersion i; it should be i identifying Z with the closed complement Y ∖ j(U); otherwise U = Y = P¹ and Z a point qualify; affects a stated result. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §21, Lemma 21.6 proof, p. 134 (MilneLEC line 5176): the source says restriction over S′ replaces U by f⁻¹(U); it should be f⁻¹(S′), since f has target S; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §21, Lemma 21.6 proof, pp. 132–133 (MilneLEC lines 5128, 5140): the source says local images t_i and the lifted class t′ are placed in degree r; it should be degree s in both places, matching the degree of t; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at §21, Proposition 21.8, p. 133 (MilneLEC lines 5154–5156): the source says every smooth variety has an elementary-fibration neighbourhood at every closed point; it should be restricted to points of positive local dimension; Spec k has no nonempty neighbourhood fibred in curves; affects a stated result. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §21, Theorem 21.3 proof, Step 2, p. 131 (MilneLEC lines 5059–5062): the source says to assume X connected and represent the graph by a component Γ projecting isomorphically to X; it should be Y connected and Γ → Y an isomorphism, as in SGA1 XII 5.1; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §21, Theorem 21.3 proof, Step 3, p. 131 (MilneLEC line 5078): the source says SGA1 XII 5.3 supplies existence of an extended finite cover; it should be XII 5.4, or the construction in XII 5.1(c); XII 5.3 supplies full faithfulness; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).

## Morrison

- **Error** at Proposition 3.3 proof, case (1), printed p. 6 (Morrison line 247): the source says the product has at most n−4 through strands; n=3, h=E₁, i=1 instead gives E₃E₁, with zero through strands rather than at most −1; it should be exclude these terms by their upper cups: a nonidentity h retains an upper cup among the first n endpoints, unlike gₙ₊₁,ⱼ; affects the proof. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Error** at Proposition 3.3 proof, case (2), printed p. 6 (Morrison line 251): the source says a rightmost lower cap in h makes hgₙ₊₁,ᵢ have a vertical rightmost strand; it should be use the upper-cup argument instead; for n=3, h=E₂, i=3, E₂E₃ connects upper endpoint four to lower endpoint two; affects the proof. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §3 and Lemma 3.1, printed p. 4 (Morrison line 131; Morrison line 142): the source says Jₙ is a left ideal, although its defining upper cup is preserved by multiplication on the right; it should be call Jₙ a right ideal; with corrected endpoint indexing, E₂E₁∉J₃ although E₁∈J₃; affects nothing. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §3 figure references, printed pp. 4–6 (Morrison line 139; Morrison line 170; Morrison line 249): the source says the K₆ diagrams, multiplication example, and two exclusion cases refer respectively to Figures 3, 3, and 2; it should be refer respectively to Figures 4, 5, and 6; affects nothing. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §3, definition of P preceding Lemma 3.1, printed p. 4 (Morrison line 129): the source says P consists of the leftmost n−2 upper endpoints; it should be use the leftmost n−1 endpoints; for n=3 the printed J₃ is zero, contradicting its claimed codimension three; affects a stated result. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §5, definition preceding Proposition 5.1, printed p. 9 (Morrison line 347): the source says cap-position adjustment subtracts one for each previously removed cap to its left; it should be τ(s)ᵢ=sᵢ−2κ(s)ᵢ; a cap removes two endpoints. For e₁∈TL₂, the printed rule gives coefficient 1 instead of 1/[2]; affects a stated result. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).

## Nekovář, Selmer complexes (Astérisque 310, 2006)

- **Misprint** at Proposition 8.4.4.1 (statement; definitions in §8.4.2): the source says the Shapiro-type isomorphism passes through the involuted Iwasawa algebra twisted by ⟨−1⟩; it should be the twist ⟨+1⟩ with final map id ⊗ ι, as the source's own definitions and proof actions force; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Newton–Thorne (NT16), Torsion Galois representations over CM fields and Hecke algebras in the derived category,

- **Misprint** at Lemma 4.6: the source says the block-parabolic Satake substitution uses the full power q^{a_i−b_i}; it should be the half power Y_{b_i+j} ↦ q_v^{(a_i−b_i)/2}Z_{i,j}, from S^G_norm = S^M_norm ∘ (δ_Q^{1/2}·S_v) (GL₂, q = 4: 17/2 versus 5); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Ngô, "Le lemme fondamental pour les algèbres de Lie", arXiv:0801.0446 v3

- **Misprint** at Theorem 7.1.13, p. 128: the source says that for a weak abelian fibration, an occurring support Z with codim Z ≤ δ_Z is the closure of an irreducible-component stratum (top fibre cohomology conclusion); it should be the reverse inequality codim Z ≥ δ_Z, i.e. equality, since ≤ always holds; the published version, Proposition 7.2.2, p. 114, states it correctly; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Theorem 7.1.13, p. 128: the source says for a weak abelian fibration, an occurring support Z with codim Z ≤ δ_Z is the closure of an irreducible-component stratum (top fibre cohomology conclusion); it should be the reverse inequality codim Z ≥ δ_Z, i.e. equality, since ≤ always holds; the published version, Proposition 7.2.2, p. 114, states it correctly; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Nikulin, Finite automorphism groups of Kähler K3 surfaces

- **Error** at §5, equation (5.2) and its case list, pp. 108–110 of the Russian original: the source says the solutions of t_pq(p+1)(q+1)=24 without (p,q)=(2,7), t=1, that is order 14; it should be a list including that solution, which is then disposed of separately; affects the proof. Found by  (#563 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Oesterlé, Nombres de classes des corps quadratiques imaginaires (1985)

- **Error** at §§4.2–4.3, pp. 320–321: the source says that at a ramified prime (139 in the example) the Euler factor is replaced by the unsquared local factor, e.g. (1+4εX+139X²)⁻¹; it should be ((1−α²p^(−2s))(1−β²p^(−2s)))⁻¹, since its condition C1 requires square support; affects the proof. Found by  (#133 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at §§4.2–4.3, pp. 320–321: the source says at a ramified prime (139 in the example) the Euler factor is replaced by the unsquared local factor, e.g. (1+4εX+139X²)⁻¹; it should be ((1−α²p^(−2s))(1−β²p^(−2s)))⁻¹, since its condition C1 requires square support; affects the proof. Found by  (#133 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Orr, arXiv:1609.01315v2

- **Error** at Lemma 4.6, p. 19: the source says the ambient Siegel torus meets the subgroup H in exactly H's Siegel torus, treating the intersection's quotient as a split torus; it should be only the inclusion of H's torus in the ambient one (Lemma 4.5), since for the norm-one torus of ℚ(i) in SL₂ the intersection is μ₂; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Orr–Schnell, Algebra & Number Theory 17(6) (2023)

- **Error** at Theorem 1, pp. 1231–1232: the source says the intersection with H equals H's Siegel torus, as in Orr's Lemma 4.6, and its §§A and E corrections leave this untouched; it should be only containment of H's torus, as the same μ₂ example in SL₂ shows; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Parshin (cited as parshin)

- **Error** at §2.2, p. 9: the source says an additive character of every finite field is injective; it should be limited to prime fields, since 𝔽_q with q = p^f, f > 1, has no injective additive character; affects nothing. Found by  (#142 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Pilloni (GSp4 Galois-representation source; title not given in the review)

- **Misprint** at Theorem 5.1.7.1(5), p. 23: the source says the similitude character of the self-duality the cyclotomic exponent −λ₁−λ₂; it should be exponent λ₁+λ₂, as forced by the Hodge–Tate weights in item (3) and HT(χ_p) = −1 (Remark 5.1.7.1); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Pilloni (title not given in the review)

- **Misprint** at a locator the review does not give: the source says a sign in the large-weight case that the review calls incompatible; it should be as the witness in the cited review requires; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Pilloni, Duke Math. J. 2020 paper (author version)

- **Misprint** at the slope-≤h decomposition condition: the source says the condition through the reciprocal polynomial Q⋆(U) with a root-valuation bound that does not fit Q⋆; it should be use Q(U) with root valuations ≤ h, or require Q⋆'s nonzero reciprocal roots to have valuation ≥ −h; merely reversing the inequality fails (U = p², h = 1, Q = X − p⁻²); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Pilloni, GSp₄ Hida theory,

- **Misprint** at Theorem 5.1.7.1(5), p. 23: the source says the similitude exponent is −λ₁ − λ₂, conflicting with item (3) and HT(ε) = −1; it should be λ₁ + λ₂; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Pilloni, higher Hida theory for GSp4 (author's notes "complexhidatheorygsp4")

- **Misprint** at §13.1.1, condition 4, p. 84: the source says Q(U) is invertible on M>h when the roots of Q have valuation strictly greater than h; it should be valuation at most h, equality included; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Pilloni-Singular

- **Gap** at Lemma 14.8.3, p. 102: the source says Lemma 5.1.5.2 applies, but that lemma needs four distinct pair products, which valuations (0,0,k+1,k+1) do not force; it should be a comparison needing only αβ isolated; affects the proof; <!-- tauceti-roadmap-review {"agent": "claude", "head": "da88512", "job": "REV-DESIGN-HigherHidaAndColemanTheory", "model": "opus", "worker": "fable-rev8"} -->. Found by HigherHidaAndColemanTheory (#332 at da88512, 2026-10-23, claude opus).
- **Misprint** at §5.1.5, p. 22: the source says the Klingen Hecke parameters satisfy αβ=γδ; it should be αδ=βγ, the spherical normalization on p. 21; affects nothing. Found by HigherHidaAndColemanTheory (#332 at da88512, 2026-10-23, claude opus).

## Pollack, On the p-adic L-function of a modular form

- **Misprint** at a supersingular prime (Duke Math. J. 2003) at Lemma 3.2, pp. 533–535: the source says boundedness forces finitely many zeros, with no nonzero hypothesis; it should be assume the series is nonzero, since the zero series is bounded with infinitely many zeros, and the proofs of Theorems 3.3 and 3.5 assume this anyway; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Pollack–Stevens, Overconvergent modular symbols and p-adic L-functions

- **Misprint** at Definition 6.4 / Proposition 6.5, p. 29: the source says L(f, χ⁻¹, 1); it should be as the witness in the cited review requires (the roadmap's source correction, which the review confirms); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Definition 6.4 / Proposition 6.5, p. 29: the source says the coefficient space S_k(Γ, ℚ_p); it should be as the witness in the cited review requires (the roadmap's source correction, which the review confirms); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at §8.4, footnote (7), p. 36: the source says the level-33 Hida algebra cannot be free over Λ because its weight-2 and weight-0 eigenforms have different coefficient fields; it should be that this does not follow: ℤ₃⟦T⟧[x]/(x² − T − 9) is free, split at T = 0, with fibre ℚ₃(√3) at T = 3; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Pollack–Stevens, Overconvergent modular symbols and p-adic L-functions (Ann. Sci. ÉNS 2011)

- **Error** at §8.4, Examples 8.6–8.7, footnote 7, printed p. 36: the source says the source infers that a Hida algebra is not free because its fibres have different splitting fields; it should be draw no such conclusion, since a free monic quadratic family can have split fibre ℚ₃[x]/(x²−9) and field fibre ℚ₃(√3); affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Pollack–Stevens, Overconvergent modular symbols and p-adic L-functions (Ann. Sci. ÉNS)

- **Misprint** at Theorem 2.6 / Corollary 2.7, p. 12: the source says (T⁻¹ − 1)D_∞, with the companion expression v_i|(γ_i − 1) + Σ v′_i; it should be (1 − T⁻¹)D_∞, as the Γ₀(2) relation D′₁ = {0} − {−1} fixes, the companion expression as the witness in the cited review requires; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Poonen, Rational Points on Varieties

- **Error** at Theorem 8.4.10 and Corollary 8.4.11 (author's errata, p. 4): the source says the finite-cover obstruction to strong approximation and its fundamental-group corollary are stated for every global field without properness; it should be stated with X proper in positive characteristic, since the Artin–Schreier cover u ↦ u^p − u of the affine line over F_p(t) is a counterexample; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Poonen, Rational Points on Varieties (2017)

- **Error** at Theorem 8.4.10 and Corollary 8.4.11: the source says the positive-characteristic case without assuming properness, which an Artin–Schreier example refutes; it should be assume X proper, as in the author's errata, p. 4; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Qian, arXiv:2103.00106

- **Error** at Lemma 4.2: the source says an overbroad local assertion in the Dwork-family argument; it should be as the witness in the cited review requires (consecutive labelled weights, every character conjugate checked, semistability only after a finite extension); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Ramakrishnan [Ram18], the degree-one comparison paper for GL(n), arXiv v1,

- **Error** at Lemma 4.1: the source says a class in H²(F, ℤ/p) trivial over K dies over every index-p subfield of KE for suitable cyclic E/F, refuted by β = (−1,−1) with F = ℚ, K = ℚ(i); it should be assume zero real localizations, or first pass to a totally imaginary quadratic F₀/F; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Ramakrishnan, A theorem on GL(n) à la Tchebotarev, arXiv:1806.08429

- **Error** at Lemma 4.1: the source says the lemma with no hypothesis at the real places; it should be stated with a real-place hypothesis, which the instance over ℚ(i) with the quaternion algebra (−1,−1) shows is needed; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## RC

- **Error** at Lemma 3.3.2, p.20 (RC line 923): the source says every light profinite S has a map from P to ℤ[S] inverted by solidification; it should be stated for infinite S only, since for S a point the solidifications are ∏_ℕℤ and ℤ; affects nothing. Found by SolidAnalyticRings (#910 at 802490a, 2026-10-23, claude opus).
- **Misprint** at Theorem 2.3.3(3), p.12 (RC line 541): the source says the internally projective object is written with a disjoint-union sign; it should be the one-point compactification ℕ∪{∞}, as the proof at RC line 548 uses; affects nothing. Found by SolidAnalyticRings (#910 at d195541, 2026-10-23, claude opus).
- **Misprint** at Theorem 2.3.3(3), p.12 (RC line 541): the source says the internally projective object is free on a disjoint union of ℕ and a point; it should be ℕ∪{∞}, as the proof uses; affects nothing. Found by SolidAnalyticRings (#910 at 802490a, 2026-10-23, claude opus).
- **Misprint** at the proof of Proposition 3.2.5(1), p.18 (RC line 812): the source says the second coordinate of (1−Shift*) of a sequence is a₁ minus a₁; it should be a₁ minus a₂; affects nothing. Found by SolidAnalyticRings (#910 at 802490a, 2026-10-23, claude opus).
- **Misprint** at the proof of Proposition 3.2.5(7), p.19 (RC lines 874–875): the source says the solid target is B in the displayed isomorphism and conclusion; it should be C, as introduced; affects nothing. Found by SolidAnalyticRings (#910 at 802490a, 2026-10-23, claude opus).
- **Misprint** at the proof of Proposition 3.2.5, item (1), p.18 (RC line 812): the source says the second coordinate of (1−Shift*) applied to a sequence is a₁ minus itself; it should be a₁ minus a₂; affects nothing; (the stated inverse is correct). Found by SolidAnalyticRings (#910 at d195541, 2026-10-23, claude opus).
- **Misprint** at the proof of Proposition 3.2.5, item (7), p.19 (RC lines 874–875): the source says the solid target is introduced as C but written as B in the displayed isomorphism and the conclusion; it should be C throughout; affects nothing. Found by SolidAnalyticRings (#910 at d195541, 2026-10-23, claude opus).
- **Misprint** at the proof of Proposition 3.2.5, p.19 (RC line 876): the source says it assumes properties (11) and (12), but the argument uses (12) and (13) to deduce (9)–(11); it should be (12) and (13), matching RC line 794; affects nothing. Found by SolidAnalyticRings (#910 at d195541, 2026-10-23, claude opus).
- **Misprint** at the proof of Proposition 3.2.5, p.19 (RC line 876): the source says it assumes properties (11) and (12); it should be (12) and (13), which the arguments for (9)–(11) use; affects nothing. Found by SolidAnalyticRings (#910 at 802490a, 2026-10-23, claude opus).
- **Misprint** at the proof of Theorem 2.3.3(3), p.12 (RC line 550): the source says the map to be lifted starts at ℤ[S] tensored with N; it should be ℤ[S]⊗P, as the diagram shows; affects nothing. Found by SolidAnalyticRings (#910 at 802490a, 2026-10-23, claude opus).
- **Misprint** at the proof of Theorem 2.3.3(3), p.12 (RC lines 555–556): the source says the factor is written as ℕ times the point at infinity; it should be ℕ∪{∞}; affects nothing. Found by SolidAnalyticRings (#910 at d195541, 2026-10-23, claude opus).
- **Misprint** at the proof of Theorem 2.3.3(3), p.12 (RC lines 555–556): the source says the profinite factor is ℕ times the point at infinity; it should be ℕ∪{∞}; affects nothing. Found by SolidAnalyticRings (#910 at 802490a, 2026-10-23, claude opus).

## Rizov, Moduli stacks of polarized K3 surfaces in mixed characteristic, arXiv math/0506120v2

- **Misprint** at §4.3, the frame construction and quotient presentation after Theorem 4.3.3, pp. 20–25: the source says a wrong size for the projective linear group in the later presentation; it should be PGL_(9d+2), matching the rank 9d+2 of the sections of L³; affects nothing. Found by  (#563 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Rodrigues Jacinto–Williams (RJW), An introduction to p-adic L-functions (arXiv:2309.15692v2)

- **Misprint** at Example 13.22: the source says the characteristic ideal is cut out by the bare twisted Kubota–Leopoldt element, dropping the augmentation factor its own earlier computation establishes; it should be Tw_{−n}(a·ζ_p) with a = (1−e₀)+e₀(γ−1), i.e. char X = I·ζ_p; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Rodrigues Jacinto–Williams, arXiv:2309.15692,

- **Misprint** at Theorem 6.7, p. 39: the source says the left-hand interpolated value without any twist; it should be the Teichmüller-twisted value required by Definition 5.18 and Remark 5.19; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Rubin, Euler Systems (AWS author draft)

- **Misprint** at Appendix D, the one-step trace line between Proposition 1.3 and Lemma 1.5, p. 165: the source says the trace down one p-step returns x_r with no scalar factor; it should be p·x_r, as the source's own definitions and its first p-step computation force; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Gap** at the inflation–restriction argument shortly before equation (6), which is on p. 36: the source says inflation–restriction over the character field L with group Δ suffices, though the residual coefficients need not descend to Δ; it should be run over L(μ_p), whose Galois group over ℚ has prime-to-p order and kills the invariant homomorphisms by its scalar action; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Rubin, Euler Systems (AWS draft version)

- **Misprint** at Appendix D, proof of Lemma D.1.4, printed pp.164–166: the source says the trace from level mp^{n+1} to mp^n sends x_{mp^{n+1}} to x_{mp^n}; it should be p·x_{mp^n}, as Proposition D.1.3 and the D.1.5 calculations force (p=3: Tr x₃ = 2 = 3x₁); affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Saito, Hilbert modular forms and p-adic Hodge theory, arXiv:math/0612077v2

- **Misprint** at p. 12 (Frobenius–monodromy relation): the source says the relation between φ and N in the direction that makes N raise weights for geometric Frobenius; it should be the reversed relation, so that N lowers weights as Saito's own p. 13 and Theorem 2 require; affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Sarig, Introduction to the transfer operator method (2020)

- **Error** at Appendix A.2 (Rényi theorem), pp.32–33: the source says the Gauss density is bounded above by 2 ln 2; it should be 1/ln 2, the density's value at 0, which exceeds 2 ln 2 (about 1.443 against 1.386); affects a stated result. Found by  (#172 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Savitt, arXiv:math/0404327v3

- **Misprint** at the construction of the Weil–Deligne representation (no printed page given): the source says one p-power Frobenius per relative Frobenius, dropping the residue-degree factor; it should be r(g) = g_D·φ^(−a(g)) with a(g) = residue degree × α(g), which makes r(g) linear and gives rNr⁻¹ = |g|⁻¹N; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Savitt, On a conjecture of Conrad, Diamond, and Taylor, arXiv:math/0404327

- **Misprint** at Definition 3.1, printed p. 12: the source says descent data are maps obeying the cocycle rule, without requiring [1] = id or invertibility (so the all-zero family qualifies); it should be required that [1] = id, invertibility then following from the cocycle rule; affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Schlichting's example of Artinian rings with equivalent derived categories but different K-theory (cited as "Schlichting example")

- **Error** at the degree-four computation for p=3: the source says the degree-four distinction holds at p=3; it should be restrict to p>3, as Dugger–Shipley Remark 4.9 corrects; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Schlichting, Hermitian K-theory, derived equivalences and Karoubi's fundamental theorem (arXiv:1209.0848v3)

- **Misprint** at Example 1.30, p. 21: the source says the dual of a component map carries a sign exponent and component indices that conflict with the internal-Hom action of its §1.11; it should be the exponent j(j−i) in the cited report's indexing, since a functional on degree j has degree −j; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Schlichting, Hermitian K-theory, derived equivalences and Karoubi's fundamental theorem, arXiv:1209.0848v3

- **Misprint** at Example 1.30, printed p. 21: the source says the dualisation sign on a component X^i → Y^j is (−1)^{i(j−i)}, incompatible with its own Hom differential and §1.11 sign; it should be (−1)^{j(j−i)}; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Scholze (the 2015 work cited as [Sch15] in Étale cohomology of diamonds)

- **Error** at Section II.2: the source says that an example shows strongly Zariski closed is strictly stronger than Zariski closed; it should be that the two notions are equivalent, the example being erroneous (Étale cohomology of diamonds, Definition 5.7, p. 24); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at Section II.2: the source says an example shows strongly Zariski closed is strictly stronger than Zariski closed; it should be that the two notions are equivalent, the example being erroneous (Étale cohomology of diamonds, Definition 5.7, p. 24); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Scholze, "p-adic Hodge theory for rigid-analytic varieties" (Forum Math. Pi 2013, arXiv:1205.3463)

- **Error** at §3, Proposition 3.7(i), p. 15, as used for Proposition 3.7(iii) and Lemma 3.16, pp. 15–20 (withdrawn in the author's erratum, item (1)): the source says arbitrary open surjections of profinite sets split, and its pro-étale coverings rest on this; it should be replaced by the splitting of towers (pullbacks of surjections of finite G-sets, then G-étale maps), with coverings redefined accordingly; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Scholze, Berkovich motives, arXiv:2412.03382

- **Gap** at the almost-module/continuous K-theory input (cached extraction lines 1944–1948): the source says the open unit ball A_<1 of a commutative Banach ring with compatible roots of T is treated as a nonunital ring; it should be an explicit hypothesis (or proof) that A_<1 is closed under addition, which fails for archimedean norms (in ℂ, 3/4+3/4=3/2); affects the proof. Found by  (#175 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Scholze, On torsion in the cohomology of locally symmetric varieties (2015, arXiv version)

- **Error** at Corollary III.2.6, p. 33: the source says equality of points over the test algebra R′, with no hypothesis on R′; it should be an inclusion in general, equality needing R′ integrally closed in R′[1/p] (witness p = 2, R′ = {(a,b) ∈ O_C² : a ≡ b mod 2}); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Scholze, On torsion in the cohomology of locally symmetric varieties (arXiv version),

- **Error** at Corollary III.2.6 (Ch. III §2, pp. 31–35): the source says canonical-subgroup points coincide over every complete flat test algebra, which the nonnormal p = 2 ring of congruent pairs in O_C² refutes; it should be give inclusion in general, and equality when the ring is integrally closed in its p-inversion; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Scholze, p-adic Hodge theory for rigid-analytic varieties (2013)

- **Error** at Definition 6.8 (structural de Rham period sheaf): the source says to complete O_X ⊗ A_inf[1/p] along ker θ directly; it should be first p-adically complete the integral tensor product, then invert p and complete along ker θ, as Scholze's erratum item (3) states; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at Lemma 3.11, printed p. 17: the source says a morphism of the pro-finite-étale site is pro-étale exactly when the map of underlying inverse-limit spaces is open; it should be only "pro-étale implies open"; a quadratic-tail tower over ℚ₂ refutes the converse, which needs openness on profinite geometric fibres; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at §3, a claim about points of the pro-étale site: the source says a statement about points that the author's erratum deletes; it should be withdrawn, as the erratum does; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at §3, definition of pro-étale coverings: the source says an original covering definition that the author's erratum, item (1), supersedes; it should be the erratum's definition, with covering towers whose pullback witnesses are surjective at each finite stage; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at §3, the pro-étale site: the source says Proposition 3.5 and Lemma 3.6, p. 14, and Lemma 3.11, p. 17: the source says its coverings and openness comparisons hold for towers whose finite étale stages need not be surjective, including a converse that a disappearing- or quadratic-tail tower defeats; it should be as in the author's erratum, item (1): coverings need finite-stage surjection pullbacks, the category is unchanged, and only pro-étale-implies-open is kept; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Scholze, p-adic Hodge theory for rigid-analytic varieties (2013),

- **Error** at §6, the construction of OB_dR^+: the source says the rational tensor product is used without completion; it should be p-adically completed first, as item (3) of the author's erratum requires; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Scholze, The local Langlands correspondence for GL_n over p-adic fields

- **Error** at the proof of Proposition 4.3, p. 12: the source says each lattice stabilizer is a maximal compact subgroup of the common centralizer; it should be dropped, with stabilizer volumes tracked, since for A = M₂(ℚ₃), γ = diag(1,4), L = ℤ₃e₁ + ℤ₃(e₁+e₂)/3 the stabilizer has index two; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Scholze, The local Langlands correspondence for GL_n over p-adic fields (author PDF)

- **Error** at Proposition 4.3 and Corollary 4.5, printed p. 12: the source says centraliser lattice stabilisers are maximal compact, so all volumes are one; for diag(a, b) over ℚ₃ the lattice with basis [[1, 1/3], [0, 1/3]] has index-two stabiliser; it should be use the actual stabilisers weighted by reciprocal volume; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Scholze, Étale cohomology of diamonds (an earlier arXiv version)

- **Error** at Proposition 22.3(vii): the source says (vii) holds without the local splitting condition on g; it should be stated with that condition, since counterexamples exist (footnote 5, p. 128 of the later version); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Scholze, Étale cohomology of diamonds (arXiv:1709.07343)

- **Error** at Proposition 13.12 and its proof, pp. 80–81: the source says it holds for quasicompact separated diamonds, applying Proposition 13.11, which assumes qcqs, though separated does not imply quasiseparated (Remark 10.8); it should be stated for qcqs separated diamonds; a Frobenius-twisted dense-orbit quotient that is not quasiseparated breaks the Hausdorff and fibre conclusions; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at Remark 25.2: the source says the source treats Spa(C, O_C) as open in Spa(C, C⁺) for any open bounded valuation subring C⁺, but for infinite-rank C⁺ the norm point is not open; it should be assume openness (for instance finite rank) or argue with the rational open {|a| ≤ 1}; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Scholze, Étale cohomology of diamonds, arXiv:1709.07343v4

- **Error** at Proposition 23.10(i), p. 145: the source says ℓ-cohomological smoothness forces dim.trg f to be finite globally; it should be only locally finite, as in Definition 23.8, since a disjoint union of balls ⊔Bⁿ is smooth with unbounded dimension; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Schröer, arXiv:2004.07025

- **Error** at p. 31 (twisted-case bookkeeping r_a + i + r_c = 11): the source says only the triples (8,1,2) and (9,1,1) occur; it should be that (7,2,2) and (8,2,1) occur as well, which is where the omitted models come from; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Schröer, arXiv:2004.07025 (title not given in the reviews)

- **Error** at Theorem 10.4 (classification of models, with Theorem 10.5): the source says its eleven models (eight with nonzero j, three with j = 0) are the complete list; it should be fourteen models, adding the twisted equations (t,1,t³,0,0), (t,t,t³,0,0), (t,t²,t²,0,0), with discriminants t¹⁰, t¹¹, t⁸(t²+t+1); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Schröer, arXiv:2004.07025v3

- **Gap** at Proposition 14.1, p. 47: the source says it invokes the partner-fibration theorem only in characteristic two; it should be the general partner theorem, valid in every characteristic, for the final two-configuration impossibility; affects the proof. Found by  (#139 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Gap** at Proposition 9.2, p. 24 (simple-fibre identification): the source says an argument through a terminal vertex of the dual graph; it should be supplemented for graphs without one, namely I_n cycles and type IV triangles (a three-point argument suffices); affects the proof. Found by  (#139 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at Proposition 9.3, p. 25: the source says Tsen's theorem applies over the function field 𝔽₂(t), whose Brauer group is nonzero; it should be applied only over algebraically closed constants, such as 𝔽̄₂(t); affects the proof. Found by  (#139 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Schröer, There is no Enriques surface over the integers, arXiv:2004.07025v3

- **Error** at Proposition 12.3, p. 42: the source says the generic order-two degree-zero quotient is the full Picard group; it should be Pic⁰, of order two, the generic Pic being infinite with a degree summand; affects the proof. Found by  (#139 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Serre, Sur les représentations modulaires de degré 2 de Gal(Q̄/Q) (1987)

- **Misprint** at its citation "th. 2.4.3" of Raynaud: the source says a Raynaud theorem number that does not exist (Raynaud has no §2.4); it should be as the witness in the cited review requires; affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## SGA1

- **Misprint** at Exposé XII, Proposition 1.3.1, p. 241 (SGA1 line 9479): the source says the input to analytification is an O_Xᵃⁿ-module; it should be an O_X-module, as defined immediately above; affects a stated result. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XII, Proposition 3.1 proof, p. 245 (SGA1 line 9618): the source says regularity is item (v) of Proposition 2.1; it should be item (iv); item (v) is the condition R_n; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at Exposé XII, Proposition 3.1 proof, p. 245 (SGA1 line 9623): the source says the base locus of geometrically regular fibres is open for the morphisms considered; it should be a constructibility argument after restricting to finite-type affine charts; flat finite-type morphisms need not have an open regular-fibre locus; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XII, Proposition 3.2(iv) proof, p. 246 (SGA1 line 9666): the source says f factors as X → T̄ → J; it should be X → T̄ → Y, the target of f; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XII, Theorem 4.4 proof (1), p. 250 (SGA1 line 9813): the source says analytic H⁰ takes the algebraic Hom sheaf without analytification; it should be H⁰(Xᵃⁿ, Hom_O_X(F,G)ᵃⁿ); affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XII, Theorem 4.4 proof (2), equation (*), p. 250 (SGA1 line 9835): the source says the extension comparison requires q ≠ 1 and decorates the global Ext group with analytification; it should be the comparison of global Ext¹ groups, without analytifying the group; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XII, Theorem 5.1(c), p. 253, and Theorem 5.4, p. 255 (SGA1 lines 9946, 10047): the source says a normal-crossings boundary is defined by vanishing of the first p coordinates; it should be defined by their product vanishing: a union of coordinate hyperplanes; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XII, Theorem 5.4 proof, p. 256 (SGA1 line 10061): the source says the algebra F₁ is defined by F₁ itself; it should be the algebra defined by the finite cover X′₁ → X₁; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XII, bibliography [8], p. 257 (SGA1 line 10104): the source says Hironaka's 1964 resolution paper appeared in Annals of Mathematics volume 39; it should be volume 79, also correctly given in SGA4 XVI bibliography [1]; affects nothing. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at V Corollary 2.4, p. 93 (SGA1 line 3858): the source says an inertia element acts trivially on G; it should be it acts trivially on X; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at V Corollary 2.7, p. 96 (SGA1 line 3942): the source says the section defines the trivializing map X × G → X; it should be the section defines Y × G → X; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at V Corollary 3.6, p. 97 (SGA1 lines 3992–4001): the source says X → X′ is the strict epimorphism and X′ → X″ the monomorphism; it should be the maps are X → X″ and X″ → X′ respectively, as its proof correctly uses; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at V Proposition 5.6(iii), p. 106 (SGA1 lines 4382–4383): the source says nonempty X must have nonempty F(X); it should be the condition must concern F′(X); F is already a fundamental functor; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at V Proposition 6.1, p. 110 (SGA1 line 4534): the source says F sends the terminal object of C to that of C′; it should be H has that source and target; F takes values in finite sets; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at V Proposition 6.11, p. 114 (SGA1 lines 4663–4665): the source says the composable second functor H′ has domain C; it should be H′ has domain C′; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at V Proposition 6.11, p. 114 (SGA1 lines 4667–4669): the source says trivial composition corresponds to Ker(u) ⊂ Im(u′), and the subsequent criterion to the reverse inclusion; it should be interchange the two inclusion signs: trivial composition means Im(u′) ⊂ Ker(u); affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at V Proposition 6.13, p. 114 (SGA1 lines 4688–4689): the source says the marked point a whose stabilizer defines U belongs to F(X); it should be a belongs to F(S); affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at V Proposition 6.6, p. 113 (SGA1 lines 4634–4637): the source says X is the quotient and, for surjective u, X is isomorphic to H(X); it should be both conclusions concern X′; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at V Remark 5.10 and §6, pp. 108 and 112 (SGA1 lines 4449 and 4588): the source says Proposition 5.8 supplies the compact-space condition and the construction of morphisms between pro-objects; it should be cite Corollary 5.9, which concerns pro-objects; 5.8 concerns finite sets; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at V Remark 5.10, p. 108 (SGA1 lines 4436–4444): the source says any family of fundamental functors can replace the full fundamental groupoid in the classification; it should be require the family to be nonempty; an empty indexing groupoid yields only one functor to finite sets; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at V Remark 6.12, p. 114 (SGA1 lines 4678–4679): the source says a homomorphism π_F → π_F′ retracting the inclusion u is a right inverse of u; it should be it is a left inverse of u; affects nothing. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at V Remarks 5.10–5.11 and §7, pp. 108–109 and 116 (SGA1 lines 4459, 4476, 4479, 4739): the source says the canonical fundamental pro-group is called G after being denoted Π; it should be use Π, or Π₁ˢ in §7, consistently; affects nothing. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at V §1, p. 91 (SGA1 line 3778): the source says Y × G is finite over Y when Y is finite; it should be the required finiteness is that of G; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at V §4(i), p. 102 (SGA1 line 4202): the source says the contracted product whose existence is asserted is G ×_G E; it should be it is Q ×_G E; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at V §5 after Definition 5.1, p. 104 (SGA1 lines 4303–4306): the source says the previously defined fundamental group π is Aut(P); it should be π is Aut(F), canonically Aut(P)ᵒᵖ; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at V §6, p. 110 (SGA1 line 4542): the source says the notation E_X(F) was introduced in §6; it should be the notation was introduced in §5; affects nothing. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at V §6, p. 112 (SGA1 line 4599): the source says F′ equals F′ composed with H; it should be F equals F′ composed with H; affects nothing. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at V §7, p. 116 (SGA1 line 4763): the source says the image-point condition is a′ = f(a); it should be the condition is a = f(a′); affects nothing. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at V §7, p. 116 (SGA1 lines 4726–4734): the source says π₁(S;a′,a) denotes paths from a to a′ after the opposite order was defined immediately above; it should be retain the preceding convention and write π₁(S;a,a′); affects nothing. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at V §7, p. 117 (SGA1 lines 4776–4777): the source says the displayed map Π₁ˢ′ → f•Π₁ˢ is between pro-groups over S; it should be both pro-groups are over S′; affects nothing. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).

## SGA4

- **Misprint** at Exposé XI, Lemma 4.5 proof, p. 47 (original pp. 76–77; SGA4 line 1980): the source says dimensional induction kills the two terms when q ≥ 1; it should be q > 1; q = 1 uses Riemann existence in the following sentence; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XI, Proposition 3.3 proof, p. 43 (original p. 69; SGA4 line 1803): the source says the new neighbourhood is U ∩ V′; it should be f⁻¹(V′), since V′ is open in the base V; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XI, Theorem 4.3(ii) proof, p. 46 (original pp. 73–74; SGA4 line 1918): the source says the graph projection Y(C) → X(C) is an isomorphism; it should be Y(C) → X′(C); affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XI, Theorem 4.4(i), p. 46 (original p. 74; SGA4 line 1939): the source says the quasi-inverse functors are two bare stars; it should be ε_* and ε*, restoring the missing functor symbol; affects a stated result. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XI, Variant 4.6, p. 47 (original p. 77; SGA4 line 1997): the source says π₀(X₀(C)) precedes πₙ(X(C)) in the homotopy sequence; it should be πₙ(X₀(C)); affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XI, bibliography [3], p. 49 (original p. 78; SGA4 line 2013): the source says Hironaka's resolution paper is in Annals volume 39; it should be volume 79, as correctly recorded in Exposé XVI bibliography [1]; affects nothing. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XI, bibliography [4], p. 49 (original p. 78; SGA4 line 2015): the source says Serre's GAGA paper occupies pages 1–12; it should be pages 1–42, as correctly recorded in Exposé XVI bibliography [4] and SGA1 XII bibliography [10]; affects nothing. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XI, explanation after Theorem 2.1, p. 41 (original p. 66; SGA4 line 1690): the source says rational parameters need not exist when k is undefined; it should be when k is not infinite; affects nothing. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XII, Corollary 5.3, p. 56 (original p. 89; SGA4 line 2290): the source says its proper-morphism hypotheses are those of X 5.2; it should be XII 5.2, the immediately preceding corollary; affects a stated result. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XII, Corollary 5.5 proof, p. 57 (original p. 91; SGA4 line 2342): the source says two torsor classes α, β have the same image in H⁰(X₀,F₀); it should be H¹(X₀,F₀); affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XII, Corollary 5.5 proof, p. 57 (original p. 91; SGA4 line 2347): the source says β′ maps to H⁰(X̄,F̄ᵅ)^G and lifts from H¹(G,H⁰(X̄,F̄)); it should be H¹(X̄,F̄ᵅ)^G and H¹(G,H⁰(X̄,F̄ᵅ)), respectively; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XII, Corollary 5.7, p. 59 (original p. 93; SGA4 line 2412): the source says inclusion X₀ → X induces Π₀(X) → Π₀(X₀); it should be Π₀(X₀) → Π₀(X); affects a stated result. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XII, Corollary 6.10 proof, p. 72 (original p. 120; SGA4 lines 3096–3099): the source says adjoining X′₁ makes p₁ surjective onto X; it should be surjective onto X′, the closed subset containing its image; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XII, Corollary 6.10(ii), p. 71 (original p. 119; SGA4 line 3072): the source says the set-sheaf case takes n = 1; it should be n = −1, so that the class lies in H⁰; affects a stated result. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XII, Corollary 6.3 proof, p. 63 (original p. 102; SGA4 line 2640): the source says K′ has the same cohomology as K in degrees ≥ m+1 and vanishes in degrees ≤ m+1; it should be vanishing only in degrees ≤ m; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XII, Corollary 6.3(ii), p. 62 (original p. 101; SGA4 lines 2605–2608): the source says the image criterion uses unprimed T on L, a malformed target degree, and an undefined A; it should be Im(T′ⁿ⁺¹(L) → T′ⁿ⁺¹(K)) ⊆ Im(Tⁿ⁺¹(K) → T′ⁿ⁺¹(K)); replace A by L in the elementwise formulation; affects a stated result. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XII, Lemma 6.2 proof, p. 62 (original p. 100; SGA4 line 2574): the source says the remaining implication is b ⇒ c, with trivial initial case n = 1; it should be b ⇒ a, with initial case n = −1; c ⇒ b has already been proved; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XII, Lemma 7.1 proof, p. 75 (original p. 126; SGA4 line 3256): the source says V is the nonempty intersection of all n opens after assuming that intersection empty; it should be the intersection of the first r opens, with 1 ≤ r < n; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XII, Proposition 6.5(i), p. 64 (original pp. 103–104; SGA4 lines 2701–2706): the source says inverse image sends clopens of Y′ to X′, while Π₀(h′) sends components of X′ to Y′; it should be clopens of X′ to Y′, and components of Y′ to X′; affects a stated result. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XII, Proposition 6.5(ii)(a,b), p. 64 (original p. 104; SGA4 lines 2719, 2724): the source says the displayed H¹ maps are bijective for i = 0,1; it should be Hⁱ in both displayed maps, with G_Y′ as the target coefficient in (b); affects a stated result. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XII, Proposition 6.8(i), p. 68 (original p. 113; SGA4 line 2930): the source says the conclusion concerns h: X → Y; it should be h: Y → X, as fixed in the hypotheses; affects a stated result. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XII, Remark 6.13, p. 74 (original p. 124; SGA4 line 3197): the source says the canonical restriction of sections goes from Γ(Y′/Y) to Γ(X′/X); it should be Γ(X′/X) → Γ(Y′/Y); affects a stated result. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XII, Remark 6.7(3), p. 68 (original p. 112; SGA4 line 2903): the source says the set-sheaf criterion follows from the L-torsion criterion when L is empty; it should be L nonempty; for empty L the abelian criterion is vacuous; affects a stated result. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XII, Remark 6.7(3), p. 68 (original p. 112; SGA4 line 2910): the source says to take F as the free Z/ℓZ-module generated by F; it should be to take G as that free module, retaining the original set sheaf F; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XII, §3.2, p. 52 (original p. 81; SGA4 line 2090): the source says the base-changed scheme is X ×_X Z′; it should be X ×_Z Z′, for X → Z and Z′ → Z; affects a stated result. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at Exposé XVI, Corollary 2.2, p. 124 (original p. 214; SGA4 line 5139): the source says proper smooth pushforward makes every constructible coefficient sheaf locally constant; it should be assumed locally constant initially; the identity of A¹ with a nonzero skyscraper sheaf disproves the printed statement; affects a stated result. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVI, Corollary 2.3, p. 124 (original p. 215; SGA4 lines 5154, 5157): the source says the abelian case assumes local 1-acyclicity, and later calls the morphism g; it should be local n-acyclicity of f, consistently with the degree-n conclusion and Theorem 2.1; affects a stated result. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVI, Lemma 2.4 proof, p. 125 (original p. 217; SGA4 line 5196): the source says g has the assumed local acyclicity; it should be f; g is the generic-point morphism, while f supplies the base change; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVI, Lemma 4.2 proof, p. 133 (original pp. 235–236; SGA4 line 5575): the source says the classical higher direct-image vanishing concerns f_cl; it should be h_cl, the proper modification in the diagram; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVI, Lemma 4.3 proof, p. 134 (original p. 237; SGA4 line 5611): the source says the algebraic Leray E₂ term uses Rᵖh_* after Rᵠa_*; it should be Rᵖb_* after Rᵠa_*, since g = b ∘ a; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVI, Proposition 3.2 proof, p. 127 (original p. 220; SGA4 line 5263): the source says Ũ = U ×_X Ũ; it should be Ũ = U ×_X X̃; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVI, Theorem 3.7 proof, p. 131 (original p. 230; SGA4 line 5468): the source says the local coefficient is u*w*F, with w undefined; it should be u*v*F, using Y → Z → X from the displayed diagram; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Gap** at Exposé XVI, Theorem 5.2 proof, p. 138 (original p. 247; SGA4 line 5818): the source says Theorem 2.1 applies to j_*F on the compactification after asserting local constancy only on X; it should be proved first for constant coefficients, then extended using a finite étale trivializing cover and Cartan–Leray; boundary monodromy prevents the stated application; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVI, Theorem 5.2 proof, p. 138 (original p. 247; SGA4 line 5819): the source says R^qj_*F vanishes for q > 0; it should be q > 1; constant nonzero prime-to-characteristic coefficients already have nonzero R¹ at a puncture; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, (1.1.4.4), printed p. 261, retypeset SGA4 line 6088: the source says the shifted differential is defined recursively using another shifted differential; it should be dⱼ[1ᵢ]ᵏ=−dⱼᵏ⁺¹ⁱ, using the original differential on the right; affects a stated result. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at Exposé XVII, (1.1.8.1), printed p. 266, correction at SGA4half lines 9732–9737: the source says the composition sign uses only the linear contribution from doubly contravariant variables; it should be the linear term plus the quadratic Koszul contribution kₐkᵦ for each pair a<b lying in one contravariant outer argument; affects a stated result; corrected in print at SGA4half, Erratum, p. 312. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, (2.3.1), printed p. 293, retypeset SGA4 line 6916: the source says the localized source category uses S rather than its inverse image S′; it should be A′[S′⁻¹] as source and B′×_B A[S⁻¹] as target; affects a stated result. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, (5.5.11.2), printed p. 386, retypeset SGA4 line 9569: the source says the second divided-power factor has exponent k₁; it should be exponent k₂, since the sum ranges over k₁+k₂=k; affects a stated result. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, (5.5.2.6.1), printed p. 375, retypeset SGA4 line 9279: the source says both summands use divided powers of M; it should be Γⁿ′(M′)⊗Γⁿ″(M″), for the stated decomposition M=M′⊕M″; affects a stated result. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, (6.3.3.1), printed p. 434, retypeset SGA4 line 10714: the source says the upper-right iterated divided power is Γⁿ_AΓⁿ_B(C); it should be Γⁿ_AΓᵐ_B(C), matching the rank m of F over B and the degree nm below; affects a stated result. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, 2.2.5, printed p. 288, retypeset SGA4 line 6784: the source says the base-changed category is additive, abelian, or triangulated over B; it should be over B′, the new base category; affects a stated result. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, Construction 7.1.3(a), printed p. 466, retypeset SGA4 lines 11461–11463: the source says both factors have simplicial index n, and the constant second-direction object uses [X₁|S]; it should be use [X₁|X]ₙ×_X[X₂|X]ₘ and [X₁|X]ₙ respectively; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, Corollary 6.3.11.2, final reduction, printed p. 442, retypeset SGA4 line 10883: the source says replace M by O_X and φ by det(u); it should be replace M by O_X and u by multiplication by det(u), retaining the tested section φ; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, Lemma 4.2.8(iii), printed p. 330, retypeset SGA4 line 7967: the source says the pointwise test quantifies over x∈V, although V is undefined; it should be x∈X, the specified conservative family of points; affects a stated result. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, Lemma 5.4.3.5, retypesetting printed p. 202, SGA4 lines 9139–9143: the source says the upper-right term uses K⊗ᴸL for sheaves on different schemes; it should be their external derived tensor product K⊠ᴸL on X×_S Y, matching (5.4.3.4); affects a stated result. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, Lemma 5.5.16(ii), printed p. 391, retypeset SGA4 line 9668: the source says acyclicity is required only for direct images along isomorphisms of topoi; it should be along morphisms of topoi of the indicated cohomological dimension; otherwise the requirement does not justify §5.5.17; affects a stated result. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at Exposé XVII, Lemma 5.5.36, printed pp. 413–414 (XVII pp. 162–163), retypeset SGA4 lines 10194–10206: the source says the divided-power exactness assertion holds over every perfect field; it should be restricted to algebraically closed fields: k=F₃, K=0, L=F₃[0], F=−1, n=2 satisfies the premise but makes the resulting F−1 zero; affects a stated result. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at Exposé XVII, Lemma 5.5.37, printed p. 414 (XVII p. 163), retypeset SGA4 lines 10214–10217: the source says every Frobenius-semilinear endomorphism over a perfect field splits into fixed-vector and nilpotent parts; it should be over an algebraically closed field; on V=F₃, F=−1 has no fixed vectors and is invertible, contradicting the stated decomposition; affects a stated result. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, Proposition 4.2.13, printed p. 334, retypeset SGA4 lines 8074–8081: the source says K, K₁, K₂ are assigned to X′, X, S′, and c′ pulls K₁ back along g′; it should be their sites are X, S, X′ respectively, and c′ uses `g^*` on K₁; affects a stated result. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, Proposition 6.3.21, printed p. 451, retypeset SGA4 lines 11077–11079: the source says trace equivariance is required only for local sections g of G on Y; it should be require g to be a local section of `u_*G_X`; this is the group acting on `u_*K` and the domain of the trace; affects a stated result. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, Variant 5.1.12, printed p. 348, retypeset SGA4 line 8471: the source says the compactification formula ends in `f_!`; it should be it ends in `j_!`, extension by zero along the compactifying open immersion; affects a stated result. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, Variant 5.1.14, printed p. 349, retypeset SGA4 line 8506: the source says the three transitivity conditions are those of §5.1.4; it should be those of §5.1.8, where conditions (i)–(iii) are stated; affects a stated result. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, proof following Lemma 5.4.3.5, printed p. 370, retypeset SGA4 line 9148: the source says the argument proves Theorem 5.5.9; it should be Theorem 5.4.3, the Künneth theorem currently being proved; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, proof of Lemma 2.4.1.3, diagram (2.4.1.4), printed p. 300, retypeset SGA4 lines 7075–7095: the source says f is described as B→A, while the diagram uses A→B and reverses s_B; it should be f:A→B and s_B:B₁→B, consistent with the chosen arrows into each object; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, proof of Lemma 5.1.6, printed p. 344, retypeset SGA4 line 8398: the source says both complexes on Y vanish outside U; it should be outside V, the indicated open subset of Y; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, proof of Lemma 5.2.3, printed p. 354, retypeset SGA4 lines 8642–8645: the source says the final comparison is checked after restriction to X′₂; it should be after restriction to X′, the open source of j′₂, where both maps reduce to the same map; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, proof of Lemma 7.3.2, printed p. 478, retypeset SGA4 lines 11921–11937: the source says the tail after Ker(S²ᵈ) starts at X²ᵈ⁺¹ and the brutal truncation starts at 2d+1; it should be start the tail at X²ᵈ and truncate at 2d; its first higher cohomology then vanishes by the cohomological bound; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, proof of Proposition 1.1.5.4, printed p. 263, retypeset SGA4 lines 6126–6138: the source says F(f) lands in K and the extension boundary `f^*` lands in F(L); it should be F(f) landing in F(K), and `f^*` landing in F(M); affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, proof of Proposition 1.2.4, printed p. 279, retypeset SGA4 line 6526: the source says K→L→σ≥nL is a quasi-isomorphism, citing §1.1.6; it should be use smart truncation τ≥nL from §1.1.13; brutal truncation need not admit that chain map or preserve the quasi-isomorphism; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at Exposé XVII, proof of Proposition 2.1.3, printed p. 285 (XVII p. 34), correction at SGA4half lines 9738–9741: the source says the displayed Hom comparisons are all bijections; it should be use the natural map from Hom(F,F), followed by the adjunction isomorphism; the first map need not be bijective; affects the proof; corrected in print at SGA4half, Erratum, p. 312. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, proof of Proposition 2.2.13, printed p. 293, retypeset SGA4 line 6901: the source says the first term of the bottom exact row is Hom_f(X,Y); it should be Hom_f(X,Y′), matching the first vertex of the distinguished triangle; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, proof of Proposition 3.2.2(v), printed p. 306, retypeset SGA4 line 7261: the source says the composite represented in the diagram is f=fh; it should be f=gh, for h:X→Y and g:Y→Z; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, proof of Proposition 3.2.6(ii), printed p. 309, retypeset SGA4 line 7383: the source says the common refinement uses Ȳ₁×_S Ȳ₂; it should be Ȳ₁×_X Ȳ₂, the fiber product over the common target of the compactifications; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, proof of Proposition 4.1.1, printed p. 320, retypeset SGA4 line 7692: the source says the lower-right tensor factor in the diagram is K⊗M; it should be K⊗N, matching the bottom row and the quotient of the right column; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, proof of Proposition 4.2.10, printed p. 331, retypeset SGA4 lines 7992–7999: the source says the truncation arrows use σ, and the lower truncation requires large i and uses K₁; it should be use τ≤iK for large i and τ≥iK for small i; retain the resolution superscript in `K₂=τ″≥−N(K₁^*)`; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, proof of Proposition 4.2.3, printed p. 327, retypeset SGA4 line 7905: the source says the displayed short exact sequence begins with Zⁿ⁺¹(F)→Cⁿ(F); it should be Zⁿ⁻¹(F)→Cⁿ(F), as in the preceding diagram and the definition of the successive cokernels; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, proof of Proposition 6.3.5, printed p. 436, retypeset SGA4 line 10737: the source says one may replace X by the scheme-theoretic support of F₁⊕F₂; it should be use the support of the extension F; for F=k[t]/(t²), F₁=F₂=k, the proposed replacement annihilates t and loses F; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, proof of Proposition 7.2.1, printed p. 475, retypeset SGA4 lines 11800–11808: the source says the left resolution uses |P|=n+1, and its spectral sequence uses |P|=p+1 and Rᵖ; it should be use |P|=1−n and, in E₁ᵖᑫ, |P|=1−p with Rᑫ; the resolution lies in nonpositive degrees; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, proof of Proposition 7.2.1, retypesetting printed p. 255, SGA4 line 11803: the source says j_P includes the union of the opens indexed by P; it should be their intersection, as in §6.2.9 and the original printing, p. 475; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, proof of Theorem 4.3.1, printed p. 339, retypeset SGA4 line 8259: the source says the displayed cohomology comparison tensors `f′^*L` with `g^*K`; it should be with `g′^*K`, since K is a sheaf on X; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, proof of Theorem 5.4.3, printed p. 368, retypeset SGA4 line 9090: the source says the auxiliary base change is Z′×_{Z₁}Z₁; it should be Z′×_Z Z₁, using the maps from both factors to Z; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, §1.1.9, printed p. 267, retypeset SGA4 line 6219: the source says the contraction datum is indexed by X in the target category A; it should be X in Aᵢ, the category of the two contracted inputs; affects a stated result. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, §3.3.1, conditions (a)′ and (b)′, printed p. 311, retypeset SGA4 line 7440: the source says the primed axioms again concern (S,p); it should be they concern (S,i), whose functors were specified immediately beforehand; affects a stated result. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, §3.3.2.3, retypesetting printed p. 173, SGA4 line 7521: the source says the first composite in the transitivity formula repeats ḡ; it should be the first factor f̄, retaining the second compactified g; the original printing, p. 314, has this correctly; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, §5.4.1.5, printed p. 367, retypeset SGA4 lines 9004–9018: the source says L₁ is `g_*K` in both formulations; it should be `L₁=g_*L`; K is on X′ and cannot be pushed forward by g:Y′→Y; affects a stated result. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, §5.5.25.3, printed p. 404, retypeset SGA4 line 9964: the source says the brutal-truncation sequence includes degree n in both outer terms; it should be 0→σ≥n+1K→K→σ≤nK→0, so each degree occurs once; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, §5.5.3, preceding (5.5.3.2), printed p. 377, retypeset SGA4 line 9316: the source says the Dold–Puppe extension by normalization works for an arbitrary target category B; it should be assume B abelian, so complexes and the normalization equivalence used in the formula are defined; affects a stated result. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at Exposé XVII, §6.2.8, printed p. 428, retypeset SGA4 lines 10514–10522: the source says traces for an arbitrary flat quasi-finite u give an augmented simplicial sheaf; it should be assume u étale; for dual numbers over an algebraically closed field with Z/2 coefficients, face traces vanish and cannot admit degeneracy sections; affects a stated result. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at Exposé XVII, §6.3.11.0 and Proposition 6.3.11.1, printed p. 439, retypeset SGA4 lines 10805–10814: the source says every module finite locally free over S defines a determinant divisor on a Cohen–Macaulay relative curve; it should be restricted to modules of finite Tor dimension over X; the length-one residue module at a node cannot define a degree-one effective Cartier divisor there; affects a stated result. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Exposé XVII, §6.3.8, printed p. 437, retypeset SGA4 line 10766: the source says the divisors parametrized over S′ must be finite over S; it should be finite over S′, the base of X′ and of the represented divisor functor; affects a stated result. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Gap** at Exposé XVII, §7.3.5, printed p. 479, retypeset SGA4 lines 11984–11988: the source says the unbounded construction supplies `Rf_!` while explicitly leaving its comparison, composition, and associativity checks undone; it should be prove the unbounded analogues of §§7.1.3, 7.1.4, and 7.1.6, including independence of the chosen pseudo-compactification; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at IX Corollary 2.7.2, p. 7 (SGA4 line 425–426): the source says the presentation takes its relation arrows into F_J; it should be the relation arrows have target G_J; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at IX Corollary 2.7.2, p. 8 (SGA4 line 438): the source says the kernel generating set is denoted N₁ after being introduced as N′; it should be use N′; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at IX Corollary 2.7.3, p. 8 (SGA4 line 466–470): the source says Hom(F,−) and Ext^i(F,−) commute with inductive limits without qualification; it should be specify filtered inductive limits; Hom from a two-element constant sheaf does not preserve coproducts; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at IX Corollary 5.7, p. 22 (SGA4 line 1130): the source says the vanishing criterion cited is 7.6; it should be cite Proposition 5.6; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at IX Lemma 2.1(iii), p. 4 (SGA4 line 257–259): the source says locally constant group sheaves remain locally constant under extensions with finitely presented quotient; it should be require finitely generated kernel; over {0}∪{1/n}, use ⊕Z/3⋊Z with trivial action at 0 and inversion of component n at 1/n; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at IX Lemma 2.1(iii), p. 4 (SGA4 line 288): the source says the constructed extension has kernel G, which has not been defined; it should be its kernel is F′; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at IX Lemma 2.8.1, p. 9 (SGA4 line 491–492): the source says the partition pieces Yᵢ are constructible subsets of X; it should be they are constructible subsets of Y; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at IX Lemma 2.8.1, p. 9 (SGA4 line 499–500): the source says the union of the images of Tᵢ is X; it should be the union is Y; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at IX Proposition 1.2(iv), p. 2 (SGA4 line 154–155): the source says the pullback is applied to F although the source sheaf was named F′; it should be write u*F′; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at IX Proposition 1.2(v), p. 2 (SGA4 line 156–158): the source says the higher direct image is applied to an undefined F′; it should be write R^q u*F, with F on T; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at IX Proposition 2.14(ii), p. 13 (SGA4 line 691): the source says the finite maps pᵢ land in Xᵢ; it should be the maps pᵢ land in X; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at IX Proposition 2.4(iii), p. 5 (SGA4 line 318): the source says the scheme morphism is named F although its pullback is subsequently denoted f*; it should be name the morphism f; affects nothing. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at IX Proposition 2.7, p. 7 (SGA4 line 399 and 407–408): the source says the argument uses an undefined base S and concludes with constructibility of G; it should be use X for the base and H for the final constructible sheaf; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at IX Proposition 2.8, p. 9 (SGA4 line 509): the source says the composite of Y″ → Y′ → Y is written gh; it should be it is hg, with g the first arrow; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at IX Proposition 2.9, p. 11 (SGA4 line 580): the source says the pullback formula uses the undefined fibre product L ×_X U; it should be use Y ×_X U; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at IX Proposition 5.5, p. 21 (SGA4 line 1091): the source says the element g becomes constant after the indicated finite étale cover; it should be the sheaf G becomes constant; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at IX Proposition 5.5, p. 21 (SGA4 line 1102): the source says the final constant coefficient ring is Z/r for an undefined r; it should be use Z/ℓ; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at IX Proposition 5.6, p. 22 (SGA4 line 1118): the source says the inclusion i from U has target X; it should be its target is Y; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XI Lemma 4.5, p. 47 (SGA4 line 1980–1982): the source says the induction step assumes q ≥ 1 and then separately treats q = 1; it should be the induction step requires q > 1; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XI Proposition 3.3, p. 43 (SGA4 line 1803): the source says U′ is the intersection of U and V′, which lie in different schemes; it should be U′ is the inverse image of V′ under f; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XI Theorem 4.3, p. 46 (SGA4 line 1918): the source says Y(C) → X(C) is asserted to be an analytic isomorphism; it should be the isomorphism is Y(C) → X′(C); affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XI Variant 4.6, p. 47 (SGA4 line 1997): the source says the homotopy exact sequence begins with π₀(X₀) before πₙ(X); it should be the preceding term is πₙ(X₀); affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XI §2, p. 41 (SGA4 line 1690): the source says the finite-field precaution is introduced by saying that k is undefined; it should be the precaution concerns k not being infinite; affects nothing. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XIV Lemma 1.5, p. 92 (SGA4 line 3710): the source says the auxiliary product uses undefined sheaves Gᵢ; it should be use the previously defined sheaves Cᵢ; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XIV Lemma 1.8, p. 94 (SGA4 line 3798): the source says δ is applied to f*G^α, although its domain is f*C^α; it should be use f*C^α; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XIV Lemma 4.1, p. 100 (SGA4 line 4101): the source says support on the finite closed set yields only d(R¹f*F) ≤ 1; it should be the needed and obtained bound is d(R¹f*F) ≤ 0; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XIV Lemma 4.2, p. 100 (SGA4 line 4109): the source says the induction assumes d(F′) ≤ d; it should be the assumption is δ(F′) ≤ d, as in Corollary 3.4; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XIV Lemma 4.4, p. 101 (SGA4 line 4149): the source says the hypothesis is written using d(supp F′); it should be use δ(supp F′), as later in the same proof; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XIV Lemma 4.5, p. 102 (SGA4 line 4206): the source says the Hochschild–Serre sequence uses q twice and abuts to cohomology of U; it should be use H^p(G,H^q(Ū″,F̄)) converging to H^{p+q}(U″,F); affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XIV proof of Corollary 3.4, p. 99 (SGA4 line 4050): the source says F′ is said to be induced on X; it should be it is induced on X′; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XIV §1.11, p. 96 (SGA4 line 3894): the source says the relative-dimension assumption is imposed on F; it should be it is imposed on the morphism f; affects nothing. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII Construction 7.1.3, p. 249 (SGA4 line 11461–11463): the source says the second simplicial index is n and the associated nerve is formed over S; it should be use index m in the second factor and the nerve over X; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII Construction 7.1.4, p. 252 (SGA4 line 11671 and 11673): the source says the extension by zero still uses j′₂ after introducing the refined pseudo-compactification; it should be use j″₂ for that refined pseudo-compactification; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII Lemma 1.1.5.4, p. 148 (SGA4 line 6126): the source says F(f) has target K; it should be its target is F(K); affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII Lemma 4.2.8(iii), p. 182 (SGA4 line 7967): the source says the set of points used in the assertion is V; it should be use the previously specified set X; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII Lemma 5.1.6, p. 189 (SGA4 line 8398): the source says the relevant stalk vanishes outside U; it should be it vanishes outside V; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII Lemma 5.4.3.5, p. 202 (SGA4 line 9140–9143): the source says the upper-right expression uses the internal tensor product of K and L; it should be use their external tensor product, as in the Künneth morphism being compared; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII Lemma 5.5.16(ii), p. 212 (SGA4 line 9668): the source says condition (ii) requires acyclicity only for direct images along isomorphisms of topoi; it should be quantify over morphisms of topoi of the specified cohomological dimension; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII Lemma 5.5.22.2, p. 217 (SGA4 line 9861): the source says the dimension bound concerns arrows; it should be it concerns fibres; affects nothing. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII Lemma 7.3.2, p. 257 (SGA4 line 11921–11937): the source says Ker(S^{2d}) starts a tail at X^{2d+1}, and the argument truncates below 2d+1; it should be start the tail at X^{2d}, reduce the subsequent indices by one, and truncate below 2d; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at XVII Lemmas 5.5.36–5.5.37, p. 224 (SGA4 line 10194–10217): the source says perfectness of k suffices for the Frobenius fixed-part decomposition and its compatibility with divided powers; it should be require k algebraically closed; over F₃, F=−id on a line has no fixed vectors but acts identically on Γ²; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII Proposition 1.2.4, p. 155 (SGA4 line 6526): the source says the quasi-isomorphism is followed by projection to the stupid truncation σ≥n(L); it should be project to the canonical truncation τ≥n(L), defined in 1.1.13; the asserted projection to σ≥n need not be a chain map; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII Proposition 1.2.7, p. 156 (SGA4 line 6570–6572): the source says the truncations τ≥i(M) retain acyclic terms; it should be use the stupid truncations σ≥i(M) throughout this argument; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII Proposition 2.2.13, p. 162 (SGA4 line 6901): the source says the bottom row begins with Hom_f(X,Y) and ends with Hom_x(X,Y[1]); it should be the first target is Y′ and the last subscript is f; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII Proposition 3.2.2, p. 169 (SGA4 line 7261): the source says the factorization is f=fh; it should be the factorization is f=gh; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII Proposition 3.2.6, p. 170 (SGA4 line 7383): the source says the product of the compactifications is taken over S; it should be take that product over X; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII Proposition 3.3.4, p. 176 (SGA4 line 7644): the source says the category constructed by gluing is cofibred; it should be it is fibred, with the inverse-image transition functors just specified; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII Proposition 4.1.1, p. 177 (SGA4 line 7692): the source says the lower-right tensor factor in the diagram is M; it should be use N, giving K⊗N; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII Proposition 4.2.10, p. 183 (SGA4 line 7995): the source says the truncation is applied to K₁; it should be truncate the resolution K₁*, retaining its distinguished notation; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII Proposition 4.2.10, p. 183 (SGA4 line 7999): the source says the lower truncation bound i is sufficiently large and the truncated complex is K₁; it should be choose i sufficiently small and truncate K; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII Proposition 4.2.13 and Theorem 4.3.1, pp. 186–187 (SGA4 line 8207 and 8259): the source says the pullback of K uses g*; it should be use g′*, whose source is the site carrying K; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII Proposition 4.2.13, p. 184 (SGA4 line 8081): the source says the definition of c′ pulls K₁ back by g′; it should be pull K₁ back by g; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII Proposition 4.2.3, p. 181 (SGA4 line 7905): the source says the left term of the short exact sequence is Z^{n+1}; it should be it is Z^{n−1}; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII Proposition 5.5.34, p. 223 (SGA4 line 10159): the source says K₀ is a quasi-coherent module on S; it should be K₀ is on X; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at XVII Proposition 6.1.4, p. 226 (SGA4 line 10285–10288): the source says each fixed-support section functor Γ_P commutes with filtered colimits over a quasi-compact, quasi-separated base; it should be this fails for nonconstructible P; prove continuity using proper compactification and étale stalks instead; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII Proposition 6.2.2, p. 228 (SGA4 line 10374): the source says the indexing category is Φ; it should be use Ψ, as defined in 6.2.1; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII Proposition 6.3.19, p. 241 (SGA4 line 11068): the source says the final trace is evaluated on gⁿ; it should be evaluate the final trace on g; gⁿ belongs in the preceding symmetric-power expression; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII Proposition 6.3.21, p. 241 (SGA4 line 11078): the source says g is a section of G_Y; it should be g is a section of u*G_X, the source of the trace being characterized; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII Proposition 6.3.21, p. 241 (SGA4 line 11081): the source says K is defined to equal G_Y; it should be define Tr(K) to equal G_Y; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at XVII Proposition 6.3.23, pp. 242–243 (SGA4 line 11109–11111 and 11146–11148): the source says symmetric powers of an étale Čech nerve form an étale hypercover; it should be replace hypercover by an augmented simplicial object that is étale-locally contractible; symmetric powers can fail matching-map surjectivity; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at XVII Proposition 6.3.5, p. 234 (SGA4 line 10737): the source says an extension F can be regarded as a module on the scheme-theoretic support of F₁⊕F₂; it should be use the support of F; k[t]/(t²) is an extension of two residue modules but is not annihilated by t; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII Proposition 7.2.1, p. 255 (SGA4 line 11803): the source says U_P is the union of the opens indexed by P; it should be U_P is their intersection, as required by (6.2.9.1); affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII Proposition 7.2.1, p. 255 (SGA4 line 11808–11810): the source says the spectral-sequence term uses R^p and vanishes when both p>0 and q>2d; it should be use R^q; the argument gives vanishing when p>0 or q>2d; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII Theorem 5.4.3, p. 201 (SGA4 line 9090): the source says Z′₁ is formed by taking the product of Z′ and Z over Z₁; it should be Z′₁=Z′×_Z Z₁; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII equation (1.1.4.4), p. 147 (SGA4 line 6088): the source says the shifted differential is defined using another shifted differential on the right; it should be use the original differential d_j at degree k+1_i on the right, with the displayed minus sign; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII equation (2.3.1), p. 163 (SGA4 line 6916): the source says the displayed base-change formula localizes A′ at S and A at S′; it should be localize A′ at S′ and A at S; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII equation (5.5.2.6.1), p. 205 (SGA4 line 9275–9279): the source says both divided-power factors use M and both polynomial arguments use m; it should be use M′ and M″, with the corresponding components m′ and m″; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII equation (5.5.2.6.2), p. 205 (SGA4 line 9283): the source says the degree-i piece of the decreasing filtration uses Γ^i(M″)⊗Γ^{n−i}(M′); it should be use Γ^i(M′)⊗Γ^{n−i}(M″), consistently with 5.5.11; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII equation (6.3.3.1), p. 234 (SGA4 line 10714): the source says the inner divided-power functor has exponent n; it should be its exponent is m; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII equation (7.3.1.1), p. 257 (SGA4 line 11909): the source says the differential X⁰→X¹ is labelled S¹; it should be label it S⁰, consistently with Sⁿ:Xⁿ→Xⁿ⁺¹ and the ensuing truncations; affects nothing. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII proof of Corollary 6.3.11.2, p. 237 (SGA4 line 10883): the source says the reduction replaces φ by det(u); it should be replace u by multiplication by det(u), retaining φ; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII §1.1.9, p. 150 (SGA4 line 6219): the source says the variable X belongs to A; it should be X belongs to A_i; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII §2.2.5, p. 160 (SGA4 line 6784): the source says the category obtained by changing the base to B′ is additive over B; it should be it is additive over B′; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII §2.4.1.3, p. 166 (SGA4 line 7075): the source says f has source B and target A; it should be f has source A and target B, as in the preceding definition; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII §3.3.1, p. 171 (SGA4 line 7440): the source says the primed assumptions concern (S,p); it should be they concern (S,i); affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII §5.1.12, p. 191 (SGA4 line 8471): the source says the compactification formula ends in f!; it should be it ends in j!, the extension by zero for the open immersion; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII §5.1.14, p. 192 (SGA4 line 8506): the source says the three compatibility conditions come from 5.1.4; it should be cite 5.1.8; affects nothing. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII §5.4.1, p. 200 (SGA4 line 9004 and 9018): the source says L₁ and its comparison map use g*K; it should be use g*L in both places; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII §5.4.4, pp. 202–203 (SGA4 line 9155–9169): the source says unordered tensor products of left A-modules are defined for the potentially noncommutative rings of 5.4.1; it should be require A to be commutative for this multiple, unordered tensor-product formula; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII §5.5.11, p. 210 (SGA4 line 9560 and 9569): the source says the displayed exponents are n_i−i_α and k in the second tensor factor; it should be use n_α−i_α and k₂ respectively; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII §5.5.22, p. 218 (SGA4 line 9904): the source says the construction uses X₁ for every index i; it should be use X_i; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII §5.5.25, p. 219 (SGA4 line 9955–9956): the source says the residue-field reduction starts with K of Tor amplitude ≥0; it should be both occurrences must use Tor amplitude ≤0, as in Lemma 5.5.22; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII §5.5.25, p. 219 (SGA4 line 9964): the source says both outer stupid truncations in the short exact sequence include degree n; it should be the quotient truncation ends at degree n−1; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII §5.5.25, p. 219 (SGA4 line 9973): the source says the trace argument is in IX 5.8; it should be refer to IX 5.5–5.6; Exposé IX has no 5.8; affects nothing. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII §5.5.28, p. 221 (SGA4 line 10069): the source says the indicated cohomology vanishes in every degree; it should be restrict the vanishing to positive degrees; degree zero contains the constant functions; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII §5.5.29, p. 221 (SGA4 line 10088): the source says the divided-power exponent is m; it should be it is n, as in the surrounding comparison; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII §5.5.3, p. 205 (SGA4 line 9316–9318): the source says normalized complexes and the Dold–Kan extension are formed in an arbitrary target category B; it should be require B to be abelian for the stated construction; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII §5.5.7, p. 208 (SGA4 line 9466): the source says the iterated tensor product has n factors; it should be it has k factors; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII §6.2.1, p. 227 (SGA4 line 10329): the source says the decomposition of X_U into its pieces is a product; it should be it is a disjoint union; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII §6.2.1, p. 227 (SGA4 line 10352): the source says the sheaf in the formula is an undefined T; it should be use F, the sheaf specified in the construction; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at XVII §6.2.8, p. 231 (SGA4 line 10514–10522): the source says traces for a quasi-finite flat morphism supply all simplicial operators of its Čech construction; it should be require the morphism to be étale here; degeneracies involve diagonals, which need not be flat; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at XVII §6.3.11.0 and Proposition 6.3.11.1, p. 236 (SGA4 line 10805–10814): the source says every finite, base-flat module on a Cohen–Macaulay curve defines an effective Cartier divisor of the same degree; it should be require the module to be perfect on X; the residue field at a cusp cannot define a degree-one Cartier divisor; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII §6.3.17, p. 240 (SGA4 line 11019): the source says the trace construction is referenced as 6.2.17; it should be the reference is 6.3.17; affects nothing. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII §6.3.25, p. 244 (SGA4 line 11194): the source says X is the torsor in the construction; it should be K is that torsor; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII §6.3.26, p. 244 (SGA4 line 11210): the source says the canonical section was defined in (6.3.4.3); it should be cite (6.3.4.2); affects nothing. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII §6.3.8, p. 235 (SGA4 line 10766): the source says divisors on X×_S S′ parametrized by S′ must be finite over S; it should be they must be finite over S′; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at XVII §7.0.3, p. 247 (SGA4 line 11337 and 11341): the source says the right-hand extension by zero is j!; it should be it is j′!, for the base-changed open immersion; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).

## SGA4half

- **Misprint** at Arcata I Proposition 5.2, p. 8 (SGA4half line 300): the source says the vector chosen to describe an arbitrary cocycle belongs to the invariant space V; it should be choose it in V′; choosing an invariant vector forces the cocycle to be trivial already; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Arcata I Theorem 4.5, p. 7 (SGA4half line 243): the source says pullback along V→U defines M_U; it should be it defines M_V; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Arcata I Theorem 4.5, p. 7 (SGA4half line 245): the source says the arbitrary cartesian module diagram describes a coherent module; it should be it describes a quasi-coherent module; no finiteness assumption was imposed; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at Arcata I §3.2, p. 5 (SGA4half line 169–171): the source says vector bundles descend along every finite locally closed covering of a normal space; it should be require a finite closed covering here; bundles of different ranks on {0} and its complement cannot glue on the real line; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Arcata I §5.1, pp. 7–8 (SGA4half line 277–285): the source says tensoring a Galois extension with itself gives the full product indexed by its Galois group; it should be assume the extension finite; for an infinite Galois extension the image consists of locally constant functions; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Arcata III Theorem 2.3, p. 19 (SGA4half line 732): the source says the polynomial norm is N_{K/k}, with polynomial variables X_ij; it should be use N_{K/k(X)} and the previously introduced variables U_ij; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Arcata IV Definition 5.1, p. 27 (SGA4half line 1069–1070): the source says Nagata supplies an unspecified scheme containing X as an open subscheme for defining compact supports; it should be specify that the containing scheme is proper over k; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Arcata IV Remark 6.5, p. 30 (SGA4half line 1175–1176): the source says Morse indices and handle indices are strictly smaller than dim(X); it should be they are at most dim(X); the smooth affine curve C* requires an index-one handle; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at Arcata V Lemma 2.3.1, p. 35 (SGA4half line 1384–1388): the source says every finite normal C-algebra étale off the closed point is étale over the regular local surface C; it should be also require torsion-freeness over C; C×(C/m) satisfies the printed hypotheses but is not flat; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Arcata V Lemma 2.3.4, p. 36 (SGA4half line 1433): the source says the inverse limit of sections uses the unthickened V; it should be use V_m at stage m; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Arcata V Lemma 2.3.4, p. 36 (SGA4half line 1439): the source says the completed algebra of the trivial degree-n cover is A[[T]]; it should be it is the product of n copies of A[[T]]; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Arcata V Theorem 3.1, p. 36 (SGA4half line 1443): the source says the higher direct images are constant and locally constructible; it should be they are locally constant and constructible; monodromy need not be trivial; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Arcata V §1.6, p. 32 (SGA4half line 1279): the source says the special fibre is X×_X s; it should be it is X×_S s; affects nothing. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Arcata VI §1, p. 39 (SGA4half line 1579): the source says the half-open interval (0,1] can serve as the basic open ball for compact-support duality; it should be use the open interval (0,1); the half-open interval has zero compactly supported cohomology; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Rapport §2.11, printed p. 85, SGA4half line 2455: the source says the coefficient ℤℓ-sheaf for Rᑫf! is on Y, where f:X→Y; it should be on X; affects a stated result. Found by EllAdicRealization (ERRATA-EllAdicRealization at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at Rapport §2.7, printed p. 84, SGA4half line 2423: the source says reducing a sufficiently high finite-level kernel modulo ℓⁿ gives the adic kernel’s reduction; multiplication by ℓ on ℤℓ contradicts this; it should be computed using stabilized images of finite-level kernels before normalization; multiplication by ℓ has zero adic kernel, although every finite-level kernel is ℤ/ℓ; affects a stated result. Found by EllAdicRealization (ERRATA-EllAdicRealization at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Rapport §4.13, printed p. 98, SGA4half line 2838: the source says Kₙ uses coefficients modulo ℓⁿ, then treats it as perfect over ℤ/ℓⁿ⁺¹; it should be defined using coefficients modulo ℓⁿ⁺¹, matching §4.11 and the following reductions and traces; affects the proof. Found by EllAdicRealization (ERRATA-EllAdicRealization at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at Th. finitude, Appendix 1.3.3(ii), printed pp. 254–256, SGA4half lines 8297–8348: the source says `Rf_*E` is constructible when E is locally pulled back from any module sheaf on S; it should be restricted to constructible E for this conclusion; with f the identity of an algebraically closed point, an infinite-dimensional Fℓ-vector space is a counterexample; affects a stated result. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Th. finitude, Appendix 1.3.3, proof, printed p. 255, SGA4half line 8325: the source says fᵢ is the inclusion Y−Dᵢ→Dᵢ; it should be fᵢ:Y−Dᵢ→Y, the open immersion used by the subsequent direct images; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Th. finitude, Appendix 2.3, printed p. 257, SGA4half line 8398: the source says specialization transitivity uses sp(u′)sp(u″), although u″ is undefined; it should be sp(u′)sp(u)=sp(uu′), matching the displayed composable pair; affects a stated result. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Th. finitude, proof of Corollary 1.5, printed p. 235, SGA4half lines 7736–7739: the source says `i_*Ri^!L` is the cone of `K→Rj_*j^*K`; it should be `i_*Ri^!L≅Cone(L→Rj_*j^*L)[−1]`; taking i to be the identity already detects the missing shift; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Th. finitude, §4.2, printed p. 250, SGA4half line 8169: the source says the input K for duality on X belongs to the derived category on S; it should be K belongs to Dᵇ_ctf(X,A), matching K_X and Theorem 4.3; affects a stated result. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).

## Silliman, arXiv:2009.14353v2

- **Error** at Theorem 8.10 (weights of Hasse lifts; construction in §8.4): the source says the source says, as literally quantified, mod-p^m congruent Hasse lifts in weights not divisible by p^(m−1)(p−1), contradicting Katz Cor. 4.4.2 (witness p = 5, m = 2, w ≡ 4 mod 20); it should be positive even multiples of (p−1)p^{N₀(F,p,m)}, with N₀ ≥ 1 at p = 2 and precision fixed before the weight; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Silliman, Group Ring Valued Hilbert Modular Forms

- **Misprint** at Theorem 8.10 (level-one Hasse lift): the source says suitable lifts exist for all sufficiently large weights; it should be require weights that are multiples of (p−1)p^{N₀}, N₀ depending on the precision, as Dasgupta–Kakde Theorem 8.8 states (p=5, precision 2, weight ≡4 mod 20 is excluded); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Skinner–Wiles (Publ. IHES 1999)

- **Misprint** at the definition of the auxiliary form f₀ (§3, before Proposition 3.23): the source says f₀ = Lg − E₀, which reduces to −E₀; it should be f₀ = E₀ − Lg, giving the stated congruence F₁ ≡ E₁; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Skinner–Wiles, Residually reducible representations and modular forms (1999)

- **Error** at Proposition 3.23, printed p.55: the source says T(ℓ)⊗[n] and S(ℓ)⊗[n] map by rules that force two different images of 1⊗[n]; it should be send S(ℓ)⊗[n] ↦ S(ℓ)Θ(Frob_ℓ)⁻¹Φ(n), defining the map factor by factor; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at printed p.76: the source says an auxiliary cyclic field of sufficiently divisible degree, inert at every prime other than p, can be chosen; it should be impose only local conditions, since no cyclic degree-8 extension of Q has 2 inert (Grunwald–Wang); affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Skinner–Wiles, Residually reducible representations and modular forms (Publ. IHES 1999),

- **Misprint** at Proposition 3.23: the source says mutually incompatible formulas for the twisted mixed-tensor Hecke action; it should be a factorwise algebra map sending 1⊗[n] to Φ(n), twisting traces linearly, determinants quadratically, and central terms once; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Snowden, arXiv:0905.4266v1

- **Error** at the choice of the auxiliary CM quadratic field H (Propositions 5.3.1, 5.4.1 and §5.5, pp. 16–18): the source says H need only split ℓ, which does not give H ⊄ F(ζ_ℓ) (ℓ = 3, F = ℚ(√6), H = ℚ(√−2)); it should be also require H ⊄ F(ζ_ℓ), always possible since only finitely many quadratic fields lie in F(ζ_ℓ); affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at the proof of Proposition 5.3.1: the source says the abelian variety has dimension 2[K:ℚ] while specifying rank-two torsion over K; it should be dimension [K:ℚ] (a Hilbert–Blumenthal abelian variety), consistent with dim V_ℓ(A) = 2 dim A; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Soulé, Groupes arithmétiques et K-théorie des anneaux d'entiers de corps de nombres, 1978 thesis (author's transcription)

- **Misprint** at Proposition 2.2.3.3, p.49: the source says the mixed-product coefficient contains the factorial (1−i)!; it should be (i−1)!, matching Proposition 2.2.2.3 (both agree at i=1); affects a stated result. Found by  (#160 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Soulé, Opérations en K-théorie algébrique (Canad. J. Math.)

- **Gap** at the proof of Théorème 7, step 2, pp. 534–539: the source says the correction factor is k^(−d+dim S) with d the absolute ambient dimension, tacitly equating d − dim S with the relative dimension; it should be the componentwise relative cotangent rank, index dim S + rank Ω_{M/S}, giving k^(−j) on each stratum; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Spencer

- **Misprint** at Definition 1.1 and the following categorical claim, printed pp. 3–4 (Spencer line 105; Spencer line 126): the source says maximal-propagation diagrams are monic for m≤n and epic for m≥n; it should be reverse the inequalities: monic for n≤m, epic for m≤n; the simple cap is epic, consistently with the notation on p. 5; affects a stated result. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Definition 1.1, propagation paragraph, printed p. 3 (Spencer line 104): the source says maximal propagation is the larger of n and m; it should be use min(n,m); the pictured (3,5)-diagram has three through strands; affects a stated result. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Definition 1.2, printed p. 3 (Spencer line 112): the source says the diagram category with objects the natural numbers is abelian; it should be say R-linear or preadditive; over a nonzero ring every object has a nonzero identity, so this category has no zero object; affects a stated result. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Lemma 1.5 proof, printed p. 5 (Spencer line 175): the source says the ith closing-site label being at least i characterizes the standard-tableau condition; it should be require at least 2i; otherwise closing sites {2,3} pass the printed test but give a nonstandard two-row tableau; affects the proof. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Misprint** at equation (1.3), printed p. 5 (Spencer line 182): the source says module duals consist of TLₙ-linear maps M→R; it should be use Hom_R(M,R), with the displayed action twisted by ι; module-linear maps generally form a smaller space and do not define this duality; affects a stated result. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Misprint** at equation (2.5), printed p. 6 (Spencer line 236): the source says the δ-parameter for the second quantum integer is [ℓ+2]−[ℓ]; it should be use [ℓ+1]−[ℓ−1]=q^ℓ+q^−ℓ; with m=2, ℓ=1 the printed identity incorrectly equates δ and δ²−2; affects a stated result. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).

## Stacks

- **Misprint** at 59.28.5, p. 34 (Stacks line 1560): the source says the syntomic argument completes the first identification; it should be the argument completes the second identification, with syntomic replacing fppf; affects nothing. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at 59.29.12, p. 40 (Stacks line 1829): the source says the map σ from V to U ×ₛ V is a section of pr_U; it should be σ is a section of pr_V; retain pr_U in the subsequent definition of c; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at 59.29.12, p. 40 (Stacks lines 1834 and 1865): the source says the images under u(σ′) and u(σ) are equal despite belonging to different sets; it should be apply u(1 × φ) to the u(σ′) image before comparing them in u(U ×ₛ V); affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at 59.36.2, p. 48 (Stacks lines 2227–2229): the source says after introducing G, the explanation applies the forgetful functor to an undefined F; it should be use G consistently in both occurrences; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at 59.65.2, p. 103 (Stacks lines 4747–4749): the source says the stabilizer subgroups are introduced as N_i and subsequently used as H_i; it should be name the introduced subgroups H_i throughout; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at 59.66.4, p. 105 (Stacks line 4845): the source says the representation image lies in Aut(V), although its module is M; it should be the image lies in Aut(M); affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at 59.67.1, pp. 105–106 (Stacks lines 4867 and 4874): the source says the proposed sheaf is F = g⁻¹F, and the limit cohomology is written Hⁿ(X,G); it should be take F = g⁻¹G and write Hⁿ(X,g⁻¹G) in the limit formula; affects a stated result. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at 59.70.1, equation (70.1.1), p. 114 (Stacks line 5255): the source says the presheaf j!ᵖF is displayed with domain X_et; it should be its domain is the opposite category X_etᵒᵖ; affects nothing. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at 59.70.1, p. 114 (Stacks line 5247): the source says the comparison of j!F with extension of sets starts with F on X_et; it should be F must be an abelian sheaf on U_et; affects nothing. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at 59.71.8, p. 119 (Stacks lines 5513 and 5531): the source says closure and abelianness of constructible sheaves follow from Lemma 59.64.6; it should be cite Lemma 59.71.6; 59.64.6 concerns locally constant sheaves; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at 59.72.3, p. 121 (Stacks line 5595): the source says taking X′ as the union of X′ᵢ makes (2) imply (1); it should be first replace each X′ᵢ by its reduction; the reduced pullback then supplies the required finite étale thickening; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at 59.72.3, p. 121 (Stacks line 5610): the source says the whole morphism U′ᵢ ×ₓ Y → U′ᵢ equals a union of reduced bases; it should be this assertion applies to the reduction of that morphism; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at 59.73.10, p. 126 (Stacks lines 5848 and 5851): the source says the descent formulas pull back G and F where the defined source sheaves are G₀ and Fᵢ; it should be use G₀ in the section formula and Fᵢ in fᵢ⁻¹Fᵢ; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at 59.73.14, p. 127 (Stacks lines 5920–5922): the source says i₁ ≥ i′(i₂) defines a directed ordering on I; it should be include equality i₁ = i₂; otherwise i′(i) > i makes the proposed relation nonreflexive; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at 59.73.9, p. 125 (Stacks line 5821): the source says the permitted change of base is surjective over X; it should be the change of base is surjective over Y, the target of f; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at 59.74.3, p. 129 (Stacks line 6015): the source says the target stalk uses f∗S although the constant set was named E; it should be write the stalk of f∗E; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at 59.74.3, p. 129 (Stacks lines 6012–6015): the source says ascending chains of subobjects suffice to extract finitely many maps jointly injective on stalks; it should be use constructibility of the injectivity loci and compactness of the constructible topology; the kernels form descending chains; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at 59.75.2, p. 132 (Stacks line 6164): the source says the compatibility condition uses the strict henselization of t at t; it should be use the strict henselization of S at t, as in the displayed domain of c; affects nothing. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at 59.76, p. 135 (Stacks lines 6290–6291): the source says D⁺ means bounded above and D⁻ means bounded below; it should be D⁺ means bounded below and D⁻ means bounded above, consistently with Lemma 59.76.5; affects nothing. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at 59.76.5, p. 136 (Stacks line 6336): the source says the composition from L lands in F•; it should be it lands in F•[1], the connecting morphism of the displayed triangle; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at 59.77.3, p. 137 (Stacks lines 6389–6392): the source says the connecting morphism gives Fᵇ → F annihilating Fᵇ⁻¹, although the complex ends in degree b−1; it should be use Fᵇ⁻¹ → F annihilating the image of Fᵇ⁻², and set Fᵇ = F; affects the proof. Found by ConstructibleEtale (ERRATA-ConstructibleEtale at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Definition 59.10.2(2), p. 9 (Stacks line 380): the source says the composite covering is indexed by a Cartesian product of the sets {i} × I_i; it should be the disjoint union of those sets; its elements are the required pairs (i,j); affects a stated result. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Definition 59.21.1(3), p. 24 (Stacks line 1101): the source says the big τ-topos consists of sheaves on the big τ-topos; it should be sheaves on the big τ-site; affects a stated result. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Example 59.59.3(3–4), p. 92 (Stacks line 4240–4241): the source says the additive group and roots-of-unity sheaves are restricted to Spec(Kˢᵉᵖ); it should be they are sheaves on Spec(K)_ét; their stalks carry the indicated Galois actions; affects a stated result. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.100.4 proof, p. 215 (Stacks line 10252): the source says the solution F₁ is f_small,*F, although F is not defined; it should be use F₁ = f_small,*G, for the first component G of the given triple; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.101.1 proof, pp. 218–219 (Stacks line 10393, 10414): the source says the construction of F₀ᵃ pulls back F, and the final vanishing uses a_S⁻¹F; it should be pull back F₀ in the construction; use the module pullback a_S*F in the final vanishing; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.102.1 proof, p. 221 (Stacks line 10506–10507): the source says both pullback arguments use the first projection; it should be the second argument must use the second projection and its fibres; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.104.7 proof, p. 230 (Stacks line 10913): the source says the second gluing map starts at f′_*F′; it should be use f_*F′; the morphism is f, and the sheaf is F′; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at Chapter 59, Lemma 59.104.8, p. 231 (Stacks line 10935–10938): the source says the fibres Sh(U_ét) form a category fibred in groupoids and a stack in groupoids; it should be use a stack in categories, or take the maximal subgroupoids; sheaf morphisms, such as ∅ → *, need not be invertible; affects a stated result. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.105.1 proof, p. 232 (Stacks line 10985): the source says the complex b(I•) is used, without a pushforward symbol; it should be use b_*(I•), matching the next term; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.105.3 final assertion, p. 233 (Stacks line 11032–11033): the source says the induced morphism runs M → K, with restrictions a ∘ f and b ∘ g; it should be use K → M with restrictions α ∘ f and β ∘ g; affects a stated result. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.105.3 proof, p. 233 (Stacks line 11036–11045): the source says both components of the map to Rc_*L_E are positive, but the resulting maps satisfy γf = g; it should be negate the Rb_*K′ component; the printed triangle instead gives γf = −g; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.105.3 proof, p. 233 (Stacks line 11038–11041): the source says adjunction starts at E, a composite ends with an unexplained = R, and restriction uses Rb_*K; it should be adjunction starts at L; delete = R; use Rb_*K′; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.107.1 proof, p. 235 (Stacks line 11141): the source says the vanishing on Z has coefficient O_X; it should be use O_Z; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.13.1 proof, p. 11 (Stacks line 503): the source says a representative for an element of F⁺(U) is a section of F(U); it should be a matching family in Čech H⁰ of the chosen covering, as used in the next sentence; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.18.6 proof, p. 20 (Stacks line 934): the source says every face in the boundary has sign (−1)ᵖ; it should be the i-th face has sign (−1)ⁱ; with a singleton indexing set, the printed consecutive boundaries compose to multiplication by −6; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.29.12 proof, p. 40 (Stacks line 1829): the source says σ: V → U ×_S V is a section of pr_U; it should be a section of pr_V; pr_U is instead used in the subsequent definition of c; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.29.12 proof, p. 40 (Stacks line 1834): the source says u(σ′)(x_V′,v′) equals u(σ)(x_V,v), although these elements belong to different sets; it should be equality after applying u(1 × φ) to the first element; subsequent occurrences need the same identification; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.36.2 proof, p. 48 (Stacks line 2227–2229): the source says the introduced sheaf G becomes an undefined F in the next sentence; it should be use G consistently in both pullback expressions; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.40.4 proof, p. 57 (Stacks line 2649): the source says V is an affine object of X_ét when evaluating g_*F(V); it should be V is an affine object of Y_ét; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.44.5 proof, p. 64 (Stacks line 2992): the source says almost continuity supplies preservation of the listed colimits; it should be almost cocontinuity, the property established immediately above; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.46.3 proof, p. 69 (Stacks line 3189–3190): the source says the canonical stalk map runs from G_x to (i_*G)_x and the induced neighbourhood uses x on U_Z; it should be the canonical map runs from (i_*G)_x to G_x; the neighbourhood point is the factorization of u through U_Z; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.48.5 proof, p. 71 (Stacks line 3274–3275): the source says the first covering is smooth, and the factorization has target Z ×_Y V with Z undefined; it should be the first covering is syntomic, and the target is X ×_Y V; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.51.8 first proof, p. 77 (Stacks line 3563, 3569): the source says the affine test object U is étale over X; it should be U is étale over S, where the direct-image sheaves live; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.52.4 proof, p. 80 (Stacks line 3696, 3700): the source says the last two colimits omit h_i⁻¹; it should be each term needs h_i⁻¹ before Rᵖg_i,* or Rᵖ⁺¹g_i,* so the colimit consists of sheaves on S; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.52.5, p. 80 (Stacks line 3708): the source says the colimit is indexed by i ≥ 0, without a distinguished element 0; it should be the colimit is over all i ∈ I; affects a stated result. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at Chapter 59, Lemma 59.62.2 proof, p. 96 (Stacks line 4407–4410): the source says the top exterior power equals the entire sign eigensubmodule of the tensor power over arbitrary rings; it should be use the canonical antisymmetrization injection; in characteristic two, e₁ ⊗ e₁ is a sign eigenvector outside its image; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.65.2 proof, p. 103 (Stacks line 4748): the source says the stabilizing subgroup is N_i, then uses an undefined H_i; it should be named H_i throughout; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.66.4 proof, p. 105 (Stacks line 4845): the source says the monodromy image G lies in Aut(V), with V undefined; it should be Aut(M), the automorphism group of the previously specified coefficient module; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.67.1, p. 105 (Stacks line 4867): the source says given G one may take F = g⁻¹F; it should be F = g⁻¹G; affects a stated result. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.71.8 proof, p. 119 (Stacks lines 5513, 5531): the source says Lemma 59.64.6 supplies closure properties for constructible sheaves; it should be Lemma 59.71.6; 59.64.6 concerns locally constant sheaves; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.73.14 proof, p. 127 (Stacks line 5921): the source says i₁ ≥′ i₂ means i₁ ≥ i′(i₂); it should be i₁ = i₂ or i₁ ≥ i′(i₂); otherwise the proposed ordering need not be reflexive; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.73.9 proof, p. 125 (Stacks line 5821): the source says the base change may be by an affine scheme surjective over X; it should be surjective over Y, the target of f: X → Y; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.76.5 proof, p. 136 (Stacks line 6336): the source says the connecting composition has target F•; it should be F•[1], as in the preceding distinguished triangle; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.77.3 proof, p. 137 (Stacks line 6390): the source says L → F[1−b] corresponds to Fᵇ → F killing the image of Fᵇ⁻¹; it should be Fᵇ⁻¹ → F killing the image of Fᵇ⁻²; the final complex ends with F in degree b; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.80.1 proof, p. 141 (Stacks line 6557–6558): the source says the stalk calculation uses a scheme X and its local ring without defining X; it should be replace X by S throughout the stalk calculation; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.81.3 proof, p. 146 (Stacks line 6780): the source says the value a and its polynomial root b belong to A; it should be both belong to R; absolute integral closure is assumed for R; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.82.4 proof, p. 151 (Stacks line 6990): the source says the sections of the restriction to Z are taken over X; it should be take Γ(Z, ((Z_i → X)_*S_i)|_Z); affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.84.1 proof, p. 157 (Stacks line 7285): the source says the cohomology sequence begins with coefficients M[n]; it should be use M[ℓ], the kernel in the preceding short exact sequence; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.84.3 proof, p. 159 (Stacks line 7344): the source says the isomorphisms for q > 1 are written in degree zero; it should be replace both H⁰ terms with Hᵠ; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.86.3 proof, p. 164 (Stacks line 7600): the source says the degree-q colimit is identified with the total derived pushforward Rg_*; it should be replace Rg_* with Rᵠg_*; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.87.6 proof, p. 167 (Stacks line 7789): the source says the stalk identity twice uses g_*⁻¹; it should be use g_* in both places, as in the statement; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.88.3 proof, p. 169 (Stacks line 7892): the source says the adjunction injection targets π_*π⁻¹F′; it should be use π_*π⁻¹F = π_*F′; F′ already lives on the source of π; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.88.4 diagram, p. 169 (Stacks line 7923, 7927): the source says the composites are h′ ∘ π′ and g′ ∘ π; it should be use h = π′ ∘ h′ and g = π ∘ g′; affects a stated result. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at Chapter 59, Lemma 59.88.5, pp. 169–170 (Stacks line 7939–7955): the source says conditions (1)–(3) force P to hold on a field-valued point whenever P(T) holds; it should be add P(∅) false; T = ∅ and P identically true satisfy the printed hypotheses but admit no field-valued point; affects a stated result. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.88.6 proof, pp. 170–171 (Stacks line 7991, 8027–8028): the source says the chosen class uses q⁻¹F, while property P omits the degree q and the prime on f; it should be use e⁻¹F, Rᵠh′_*, and (f′)⁻¹, respectively; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.90.2 proof, p. 181 (Stacks line 8576): the source says the comparison uses F and F_Xk, although the input is E; it should be use E and its restriction to X_k; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.91.13 proof, p. 187 (Stacks line 8890): the source says pullback by y → Y gives the stalk of F, a sheaf on X; it should be apply this observation to Rⁿf_*F, a sheaf on Y; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.92.4 proof, p. 189 (Stacks line 8973, 8980): the source says bounded-below objects vanish in degrees i ≥ a and j ≥ b, and the truncation cutoff uses −b+n; it should be use i < a and j < b; the displayed truncation cutoff is −a+n, matching the following vanishing formulas; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.92.5 proof, p. 190 (Stacks line 9007–9009): the source says the lower-bound argument assumes vanishing above a and b and later omits f⁻¹ on K; it should be assume vanishing below a and b; use E ⊗ᴸ f⁻¹K; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.95.2 proof, p. 195 (Stacks line 9276): the source says F is the inverse limit of f_i⁻¹f_i,*F; it should be use the filtered colimit, as in Lemma 59.51.9; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.95.7 proof, p. 198 (Stacks line 9418): the source says the Leray spectral sequence is applied to Z_i → Z, with Z undefined; it should be use Z_i → X; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at Chapter 59, Lemma 59.95.8 proof, p. 199 (Stacks line 9451–9455): the source says arbitrary finite-type subalgebras of the strict henselization induce algebraic residue-field extensions; it should be choose a cofinal presentation with algebraic residue extensions; C[x,y,y/x] inside the strict henselization at (1,0) has an exceptional affine-line fibre over (0,0); affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.95.8 proof, p. 199 (Stacks line 9457): the source says the final vanishing is written for the total derived pushforward Rf_*F; it should be use Rᵠf_*F, which vanishes in the specified degrees; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.97.5 proof, p. 203 (Stacks line 9644, 9647, 9670): the source says the base-changed comparison uses Rj′_* on the product, and its final occurrence has coefficients F; it should be use Rh′_* on the product and F′ for the pulled-back coefficients; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.97.5 proof, p. 204 (Stacks line 9673): the source says the local scheme Y′ at y is defined using O_X,xˢʰ; it should be use Y′ = Spec(O_Y,yˢʰ); affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.97.6 proof, p. 205 (Stacks line 9762): the source says the approximating square has corners X_i, Y_i, S_i, T_i, with S_i and T_i undefined; it should be use X′_i, Y_i, S′, T, as in the preceding definitions; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.97.6 proof, p. 205 (Stacks line 9771): the source says degree-zero base change identifies (f′)⁻¹g_*F with the total derived pushforward Rh_*e⁻¹F; it should be use h_*e⁻¹F; higher degrees are addressed in the following reduction; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.97.6 proof, p. 205 (Stacks line 9784): the source says the algebraically closed function field of S′ is K; it should be use L, the field in the displayed generic-point morphism Spec(L) → S′; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.97.6 proof, p. 206 (Stacks line 9800): the source says the scheme diagram is a colimit of the approximation diagrams; it should be use an inverse limit; the coordinate rings form filtered colimits; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.97.7 proof, p. 208 (Stacks line 9901): the source says Rᵠh_* is applied directly to ρ_i⁻¹e⁻¹F, which is a sheaf on Y_i; it should be insert ρ_i,* before ρ_i⁻¹, as required by the projection formula and the following equality; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.97.8 proof, p. 208 (Stacks line 9927–9934): the source says the bounded flat resolution is chosen for F before applying Lemma 59.97.7; it should be choose the flat resolution for E, whose Tor amplitude is the hypothesis in 59.97.7; boundedness suffices for F; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.99.1 second proof, p. 210 (Stacks line 10010): the source says i_f = i_T ∘ f_big; it should be use i_f = f_big ∘ i_T; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemma 59.99.2(6), p. 211 (Stacks line 10071): the source says the big-site base-change equality belongs to D(Mod(S′_ét, O_S′)); it should be place it in D(Mod((Sch/S′)_ét, O)), the derived category of modules on the big étale site; affects a stated result. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemmas 59.100.2, 59.102.2 and 59.103.2, pp. 214, 221, 224 (Stacks line 10199, 10532, 10670): the source says a_Y equals π_X ∘ ε_X; it should be use a_Y = π_Y ∘ ε_Y in all three lemmas; affects a stated result. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemmas 59.100.6(3), 59.102.5(3) and 59.103.5(3) proofs, pp. 216, 223, 226 (Stacks line 10310, 10594, 10733): the source says a_X⁻¹ = ε_X⁻¹ ∘ a_X⁻¹; it should be use a_X⁻¹ = ε_X⁻¹ ∘ π_X⁻¹ in all three proofs; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemmas 59.100.7, 59.102.6 and 59.103.6 proofs, pp. 217, 223, 226 (Stacks line 10343, 10609, 10748): the source says a_X = ε_X ∘ π_X; it should be use a_X = π_X ∘ ε_X in all three proofs; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemmas 59.52.1 and 59.52.5 proofs, pp. 79, 81 (Stacks line 3649, 3721): the source says the comparison uses E_i,i instead of E_1,i; the relative version also omits inverse image; it should be use E_1,i in both formulas, and h_i⁻¹E_1,i in the relative colimit; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Lemmas 59.52.1 and 59.52.5, pp. 79–80 (Stacks line 3635, 3706): the source says φ_i′i is a map of complexes on X_i,ét; it should be a map on X_i′,ét, the target of the indicated inverse-image functor; affects a stated result. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at Chapter 59, Proposition 59.95.6 proof, Interlude II, p. 197 (Stacks line 9361–9367): the source says the support-dimension cohomological bound holds for arbitrary smooth Z; it should be require Z affine; Z = P¹_C with constant F_ℓ has nonzero H², contradicting the printed bound for a = 1; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Proposition 59.95.6 proof, p. 197 (Stacks line 9345): the source says the finite-morphism reduction uses π_*F, with π undefined; it should be use f_*F, where f is the chosen Noether normalization; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Theorem 59.89.2 first proof, p. 175 (Stacks line 8279): the source says the lower-left Mayer–Vietoris term is Rᵠk_*; it should be use Rᵠ⁻¹k_*, matching the upper row and the preceding term in the long exact sequence; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Theorem 59.89.2 first proof, p. 176 (Stacks line 8333): the source says the chosen section has coefficients q⁻¹I; it should be use e⁻¹I; q is the cohomological degree, whereas e is the morphism; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, Theorem 59.89.2 second proof, p. 179 (Stacks line 8516): the source says Lemma 59.83.12 gives invariance for the affine curve under algebraically closed field extension; it should be cite Lemma 59.83.10(6); 59.83.12 assumes a proper curve; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, §59.104 introductory descent construction, p. 227 (Stacks line 10792): the source says the canonical descent datum associated to F has components f_i⁻¹F_i; it should be use f_i⁻¹F; F lives on X, whereas F_i lives on X_i; affects nothing. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, §59.70 after Definition 59.70.1, p. 114 (Stacks line 5247): the source says the input F of j_! is a sheaf on X_ét; it should be a sheaf on U_ét, where j: U → X; affects nothing. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 59, §59.76 opening convention, p. 135 (Stacks line 6291): the source says D⁺ and D⁻ mean bounded above and bounded below, respectively; it should be bounded below and bounded above, respectively; affects nothing. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at Chapter 63, Example 63.5.7, p. 24 (Stacks line 1173): the source says every locally quasi-finite map to a geometrically unibranch locally Noetherian scheme has a positive weighting; it should be nonnegative; the closed immersion {0} → A¹ admits only weight zero, since its weighted fibre sum must be locally constant; affects a stated result. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 63, Lemma 63.11.4 proof, p. 42 (Stacks line 2158): the source says Rf_!L has vanishing cohomology in degrees ≤ a−1; it should be vanishing in degrees ≥ a, which yields the required Hom vanishing against K ∈ D^≥a; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 63, Lemma 63.13.3 proof, p. 47 (Stacks line 2382): the source says the long exact sequence contains R^qf_*M[n] and R^(q+1)f_*M[n]; it should be M[ℓ] in both terms, matching the preceding short exact sequence; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 63, Lemma 63.3.2 proof, p. 3 (Stacks line 117): the source says the decomposed neighbourhood contains T_V′, which is undefined; it should be Z_V′, the pullback of the section's support; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 63, Lemma 63.4.11 proof (a), p. 17 (Stacks line 779): the source says X₁ is the inverse image of undefined W′; it should be the inverse image of Y′₁; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 63, Lemma 63.4.2 proof, p. 12 (Stacks line 521): the source says the constructed section belongs to jᵖ_!F(V); it should be fᵖ_!F(V); no j has been introduced; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 63, Lemma 63.4.3, p. 12 (Stacks line 554): the source says F belongs to Ab(X_ét), although j: U → X; it should be F belonging to Ab(U_ét); affects a stated result. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 63, Lemma 63.8.5 proof, p. 32 (Stacks line 1582): the source says the equality commuting inverse image with lower shriek comes from Lemma 63.3.4; it should be Lemma 63.3.12, the base-change isomorphism; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 63, Lemma 63.9.1 proof, p. 35 (Stacks line 1691): the source says the composite compactification morphism is g ∘ h; it should be h ∘ g, since g: X₁ → X₂ and h: X₂ → X₃; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 63, Lemma 63.9.2 proof, p. 35 (Stacks line 1726): the source says the third equality uses i_! Rf′_* → Rf̄_* j_!; it should be i_! Rf′_* → Rf̄_* j′_!, because j′ embeds U into X̄; affects the proof. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at Chapter 63, Remark 63.3.9, p. 5 (Stacks line 181): the source says compactly supported sections form a cosheaf on the Zariski site; it should be a covariant functor only: two affine-line opens cover P¹, but their constant-coefficient H⁰_c groups vanish while H⁰_c(P¹) does not; affects a stated result. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 63, Remark 63.8.4, p. 31 (Stacks line 1510): the source says γ_(A+B) has target f_* composed with (k ∘ k′)_*; it should be f_* composed with (k ∘ k′)_!, using the remark's convention suppressing R; affects nothing. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Chapter 63, §63.16 before Lemma 63.16.1, p. 53 (Stacks line 2630): the source says U ↦ R(U → Y)_!Λ is a functor from the opposite affine étale category; it should be covariant on the affine étale category; applying Hom(−, K[n]) then produces the required presheaf; affects nothing. Found by ComplexComparison (ERRATA-ComplexComparison at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Definition 61.26.1(1) (tag 09AE), printed p. 52, Stacks line 2358: the source says j! for sheaves of sets maps X-sheaves to U-sheaves; it should be Sh(U_proét) → Sh(X_proét), reversing the displayed direction; affects a stated result. Found by EllAdicRealization (ERRATA-EllAdicRealization at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at Definition 64.18.6 (tag 03UR), printed p. 23, Stacks line 1102: the source says rationalization is right adjoint to an inclusion of ℚℓ-sheaves into ℤℓ-sheaves; it should be described solely as the Serre quotient functor; finite-dimensional ℚℓ-spaces do not form a full subcategory of finite ℤℓ-modules, already at a geometric point; affects a stated result. Found by EllAdicRealization (ERRATA-EllAdicRealization at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at Example 61.19.12 (tag 0F6D), printed p. 44, Stacks line 1995: the source says for every scheme X and nontrivial A, neither displayed sheaf descends to the étale site; it should be restricted to nonempty X; on the empty scheme both sheaves are zero and descend; affects a stated result. Found by EllAdicRealization (ERRATA-EllAdicRealization at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Lemma 61.19.1 (tag 0GLZ), printed p. 40, Stacks line 1810 and line 1812: the source says the étale Hom sets contain ε⁻¹G, although G is a pro-étale sheaf; it should be ε_*G in both Hom sets; affects the proof. Found by EllAdicRealization (ERRATA-EllAdicRealization at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Lemma 61.19.11 (tag 09B2), printed p. 44, Stacks line 1978: the source says Kₙ=K⊗ᴸ_ΛΛ/Iⁿ without introducing I; it should be preceded by the hypothesis that I is an ideal of Λ; affects a stated result. Found by EllAdicRealization (ERRATA-EllAdicRealization at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Lemma 61.19.7 (tag 099X), printed p. 42, Stacks line 1902: the source says the left-action convention g₁₂s₁=s₂ gives g₁₂g₂₃=g₁₃; it should be g₂₃g₁₂=g₁₃, since g₂₃g₁₂s₁=s₃; affects the proof. Found by EllAdicRealization (ERRATA-EllAdicRealization at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at Lemma 61.22.1, proof of (2) (tag 09B4), printed p. 48, Stacks line 2179: the source says every discrete continuous G-module M/IⁿM gives a locally constant étale sheaf; it should be an étale sheaf, without asserting local constancy; for G=Ẑ, the discrete module ⊕ₙ𝔽ℓ[G/nG] has no open subgroup acting trivially; affects the proof. Found by EllAdicRealization (ERRATA-EllAdicRealization at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Lemma 61.25.1 (tag 09BK), printed p. 50, Stacks line 2256: the source says the morphisms v(Vᵢ) → v(V) belong to Z_app; it should be X_app, the codomain of v; affects the proof. Found by EllAdicRealization (ERRATA-EllAdicRealization at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at Lemma 61.25.5 (tag 09AC), printed p. 52, Stacks line 2339: the source says an ind-étale factorization A → B → A/I yields B/IB = A/I × R; it should be replaced by a localization argument; evaluation on locally constant field-valued functions on Cantor space gives a counterexample to the asserted product splitting; affects the proof. Found by EllAdicRealization (ERRATA-EllAdicRealization at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Lemma 61.25.5 (tag 09AC), printed p. 52, Stacks line 2342: the source says the image of the flat morphism Spec(B) → Spec(A) is closed under specialization; it should be closed under generalization, which is the property needed after checking that the image contains all closed points; affects the proof. Found by EllAdicRealization (ERRATA-EllAdicRealization at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Lemma 61.26.2 (tag 09AF), printed p. 53, Stacks line 2370: the source says the common right adjoint is j⁻¹_proét ε_* = ε_* j⁻¹_ét; it should be j⁻¹_ét ε_* = ε_* j⁻¹_proét; the displayed compositions have their site labels interchanged; affects the proof. Found by EllAdicRealization (ERRATA-EllAdicRealization at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at Lemma 61.27.5 (tag 09BQ), printed p. 55, Stacks line 2497: the source says truncating both tensor factors below i−1 preserves degree-i cohomology without first normalizing their upper bounds; it should be preceded by shifts placing both factors in nonpositive degrees; K=Λ[2], L=Λ[−2], i=0 disproves the printed equality; affects the proof. Found by EllAdicRealization (ERRATA-EllAdicRealization at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Gap** at Lemma 61.28.6 (tag 09BY), printed p. 58, Stacks line 2628: the source says Proposition 61.21.1 proves cokernel stability for an arbitrary ring Λ; it should be justified using the general derived-completeness weak-Serre theorem on a weakly contractible basis; Proposition 61.21.1 assumes Λ Noetherian; affects the proof. Found by EllAdicRealization (ERRATA-EllAdicRealization at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Lemma 61.29.2 (tag 09C2), printed p. 59, Stacks line 2682: the source says Kₙ=Kₙ₊₁⊗ᴸ_ΛΛ/Iⁿ; it should be Kₙ=Kₙ₊₁⊗ᴸ_(Λ/Iⁿ⁺¹)Λ/Iⁿ; tensoring over Λ introduces extra Tor even for Λ=ℤ and K=Λ; affects the proof. Found by EllAdicRealization (ERRATA-EllAdicRealization at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Lemma 61.29.5 (tag 09C5), printed p. 62, Stacks line 2787: the source says the higher-Tor pro-systems indexed by Tor₋ₚ vanish for p>0; it should be p<0, corresponding to positive Tor degree; affects the proof. Found by EllAdicRealization (ERRATA-EllAdicRealization at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Lemma 63.10.5 (tag 0GKP), printed p. 40, Stacks line 2068: the source says `Rf_!` composed with `Ri_!` without completing the asserted equality; it should be `Rf_!` composed with `Ri_!` equals `Rh_!`, for the closed immersion i; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Lemma 63.11.4 (tag 0GLA), printed p. 42, Stacks line 2158: the source says `Rf_!L` has vanishing cohomology in degrees at most a−1; it should be vanishing in degrees greater than a−1, as follows from `L=τ≤a−N−1Rf^!K` and Lemma 63.10.2; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Lemma 63.13.3 (tag 0GKW), printed p. 47, Stacks line 2382: the source says the long exact sequence uses M[n] twice; it should be M[ℓ] in both places, matching the preceding short exact sequence; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Lemma 63.3.2 (tag 0F4Y), printed p. 3, Stacks line 117: the source says the undefined subset T base-changed to V′ lies in the selected components; it should be Z base-changed to V′, where Z is the section’s support; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Lemma 63.8.1 (tag 0F7B), printed p. 29, Stacks line 1399: the source says the lower-right truncation has subscript |geq followed by a+1; it should be the truncation τ≥a+1K; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Lemma 63.8.1 (tag 0F7B), printed p. 29, Stacks line 1402: the source says `g_!Rf′_*F` maps isomorphically to `Rᵖf_*(g′_!F)` for every p; it should be `g_!Rᵖf′_*F` on the left, matching the cohomology degree on the right; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Lemma 63.8.2 (tag 0F7C), printed pp. 29–30, Stacks lines 1437–1443: the source says b has target `g_*f_*I•` and then forms `g_*(a)` composed with b; it should be b with target `g_*l_!f′_*J•`, the source of `g_*(a)`; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Lemma 63.8.5 (tag 0F7F), printed p. 32, Stacks line 1582: the source says the equality identifying pullback of extension by zero comes from Lemma 63.3.4; it should be Lemma 63.3.12, the base-change result; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Lemma 63.9.1 (tag 0F7I), printed p. 35, Stacks line 1691: the source says the comparison uses the composite g composed with h; it should be h composed with g, the defined morphism from the first compactification to the third; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Lemma 63.9.2 (tag 0F7J), printed p. 35, Stacks line 1726: the source says the third equality uses an isomorphism ending in `Rf̄_*` composed with `j_!`; it should be `Rf̄_*` composed with `j′_!`, since j′ includes U into the compactification; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Lemma 63.9.2 (tag 0F7J), printed p. 36, Stacks lines 1839–1845: the source says square E has bottom map j₂ and γE has source j₂,!; it should be bottom map j′₂ composed with j₂ and source (j′₂ composed with j₂)!, both landing in the second compactification; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Lemma 64.20.6 (tag 03V4), printed p. 26, Stacks line 1280: the source says the lifted homotopy replaces πₙ by a homotopic map; it should be πₙ₊₁, consistently with the next displayed formula and the required compatibility with the already fixed πₙ; affects the proof. Found by EllAdicRealization (ERRATA-EllAdicRealization at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Lemma 64.20.6 (tag 03V4), printed p. 27, Stacks line 1298: the source says Hⁱ(K∞) is tensored with ℚℓ over ℤ; it should be tensored over ℤℓ; the two tensor products differ even when Hⁱ(K∞)=ℤℓ; affects the proof. Found by EllAdicRealization (ERRATA-EllAdicRealization at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Lemma 64.20.6(2) (tag 03V4), printed p. 26, Stacks line 1246: the source says the inverse limit defining Hⁱ∞ uses Hⁱ(kₙ); it should be Hⁱ(Kₙ), the perfect complexes introduced in the hypothesis; affects a stated result. Found by EllAdicRealization (ERRATA-EllAdicRealization at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Proposition 61.21.1, proof of (4) (tag 099Q), printed p. 47, Stacks line 2124: the source says the homotopy limit belongs to D_comp(X,Λ), although the site is named C; it should be D_comp(C,Λ); affects the proof. Found by EllAdicRealization (ERRATA-EllAdicRealization at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Error** at Remark 63.3.9 (tag 0F74), printed p. 5, Stacks line 181: the source says compactly supported sections form a cosheaf on the Zariski site; it should be a precosheaf: for constant nonzero finite coefficients, both standard affine opens of the projective line have zero compactly supported sections, whereas the whole line does not; affects a stated result. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Remark 63.8.4 (tag 0F7E), printed p. 31, Stacks line 1510: the source says `γ_{A+B}` has target `f_*` composed with `(k∘k′)_*`; it should be `f_*` composed with `(k∘k′)_!`, as required by Lemma 63.8.1; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Theorem 61.30.1 (tag 09C9), printed p. 63, Stacks line 2848: the source says K belongs to D(X_proét), without a Λ-module structure; it should be K∈D(X_proét,Λ), so the subsequent derived tensor products over Λ are defined; affects a stated result. Found by EllAdicRealization (ERRATA-EllAdicRealization at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Theorem 63.14.5 (tag 0GL0), printed p. 51, Stacks line 2550: the source says the intermediate affine space of dimension n−2 is over S; it should be over Y, the base throughout the factorization; affects the proof. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Theorem 64.20.4 (tag 03V3), printed p. 25, Stacks line 1210: the source says the dimension-one case was proved at an unresolved REFERENCE placeholder; it should be a reference to Theorem 64.16.1, which already treats complexes; affects the proof. Found by EllAdicRealization (ERRATA-EllAdicRealization at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §59.70, paragraph after Definition 59.70.1, printed p. 114, Stacks line 5247: the source says F is a sheaf on X_et before applying j! to F; it should be F is a sheaf on U_et, the domain of j!; affects a stated result. Found by CompactSupport (ERRATA-CompactSupport at 4bd7237, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §64.20, reduction of Theorem 64.20.2 (tag 03UY), printed p. 25, Stacks line 1194 and line 1200: the source says the closed-point summand uses π_X^(n/d), and the sum over Xₙ(kₙ) uses π_X; it should be π_x^(n/d) in the first sum and π_Xⁿ, equivalently π_Xₙ, in the second; affects the proof. Found by EllAdicRealization (ERRATA-EllAdicRealization at 4bd7237, 2026-10-23, codex gpt-6-astra).

## Stein, Modular Forms: A Computational Approach (2007)

- **Misprint** at the formula for Δ near Theorem 9.18, pp. 171–172: the source says Δ with a sign typo; it should be the correctly signed expression in E₄ and E₆ normalized to constant term 1; affects nothing. Found by  (#131 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Stein–Wuthrich, Algorithms for the arithmetic of elliptic curves using Iwasawa theory, Math. Comp. (2013)

- **Misprint** at §4.2, split multiplicative case: the source says that when ω_E pulls back to C·du/u, Katz's value E₂(E,ω_E) is C² times 1−24Σσ(n)qⁿ; it should be C⁻², since E₂ has weight two and ω↦Cω scales it by C⁻² (C=2 gives 1/4, not 4); affects a stated result. Found by  (#165 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at §4.2, split multiplicative case: the source says when ω_E pulls back to C·du/u, Katz's value E₂(E,ω_E) is C² times 1−24Σσ(n)qⁿ; it should be C⁻², since E₂ has weight two and ω↦Cω scales it by C⁻² (C=2 gives 1/4, not 4); affects a stated result. Found by  (#165 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Sternberg, Lie algebras (lecture notes, 2004)

- **Misprint** at §7.9, pp. 131–133 (contraction Λ^j→Λ^(j−2) for the symplectic Cartan product): the source says a binomial coefficient with lower index 2j−2; it should be j−2, which gives the correct dimensions (C(2n,2)−1 for the second fundamental representation); affects nothing. Found by  (#130 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Sun, A generalization of Gauss–Kuzmin–Lévy theorem, arXiv:1705.02921v2

- **Error** at proof of Theorem 2, pp.3–6: the source says a signed derivative contribution of the transfer branches serves as if it were an absolute bound; it should be a bound by absolute coefficients (at a=2, x=1 the branch derivative is −1/72); affects the proof. Found by  (#172 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Szego

- **Error** at §4.62(1), after (4.62.2), printed p. 77 (Szego line 3382; Szego line 3393): the source says the analytic remainder has M₂(0) ≠ 0 for every admissible parameter, including α=0; it should be M₂(0) may vanish at α=0: continuity in β and values (log 2)/2, (log 2−1)/2 at β=0,1 imply a zero between them; affects a stated result. Found by LaguerreJacobi (ERRATA-LaguerreJacobi at 5aad605, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §4.82(1), after (4.82.2), printed p. 89 (Szego line 3966): the source says the λ=1/2 specialization is the sum of the two Dirichlet–Mehler expressions (4.8.6) and (4.8.7); it should be their arithmetic mean: (4.82.2) assigns 1/π to each integral, whereas each earlier formula assigns 2/π; affects nothing. Found by LaguerreJacobi (ERRATA-LaguerreJacobi at 5aad605, 2026-10-23, codex gpt-6-astra).

## Tate, Fourier analysis in number fields and Hecke's zeta-functions (thesis, 1950)

- **Misprint** at §4.2 (hypotheses behind Lemma 4.2.3) and §4.4 (conditions before Lemma A): the source says the source asks the periodised sum to converge uniformly in x over the whole space, which a translated Gaussian fails; it should be ask uniformity on the fundamental domain D (for ideles, the closure of E), which is what the proof uses; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Taylor, Remarks on a conjecture of Fontaine and Mazur (2002)

- **Error** at the choice of local tame field: the source says to take the smallest tame Galois extension with the needed property, which need not be unique (ℚ₅(√5), ℚ₅(√10)); it should be a chosen extension of minimal degree; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Taylor–Yoshida, Compatibility of local and global Langlands correspondences,

- **Gap** at the projector construction on nearby-cycle cohomology: the source says a power of an operator idempotent on graded pieces is the projector, justified only by the filtration, though Jordan blocks show it need not be idempotent; it should be use an idempotent polynomial correction such as 1 − (1 − T^D)^D, as in Caraiani's correction; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## the source cited as "Lerch III" (Lerch zeta function, part III)

- **Error** at Theorem 3.4: the source says a vanishing formula for the covering and monodromy contributions in too broad a form; it should be retain the exceptional zero-index branch contribution; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## the Stacks Project

- **Error** at Remark 60.24.9 (tag 07MU, base change isomorphism): the source says crystalline base change is an isomorphism under seven conditions that allow local complete intersection morphisms; it should be withdrawn beyond the smooth case, since A′ = 𝔽_p[t,ε]/(ε²,tε) meets all seven conditions yet Tor₂^{A′}(D′,A) ≠ 0; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## the work corrected by Serre's 1974 correction (cited as "Serre 1974 correction", congruence-subgroup and Mennicke setting)

- **Error** at the formula that correction replaces: the source says a degree/root-count-only expression; it should be computed through the norm on roots of unity, as the 1974 correction gives; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Thorne, the paper cited as bigness.pdf (title not given in the report)

- **Misprint** at Lemma 6.4(i)–(ii), pp. 33–34: the source says level U in the sentence just before the numbered conclusions; it should be level V, which conclusion (ii) and its proof use; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Théry, Primality Tests and Prime Certificate, arXiv:2203.16341v1

- **Misprint** at Theorem 6.2, p. 9 (Pocklington criterion): the source says the size condition F > N, impossible since F divides N−1; it should be F² > N, that is N < F²; affects a stated result. Found by  (#131 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Tingley

- **Misprint** at Introduction, printed p. 2 (Tingley line 72): the source says the alternative braiding is compared with ordinary symmetry at q=0; it should be use q=1; the displayed braiding contains negative powers of q and cannot be evaluated at zero; affects nothing. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §3A, paragraph following (3), printed p. 6 (Tingley line 219): the source says adjoining a square root to the rational-function field gives C[q¹ᐟ²]; it should be use C(q¹ᐟ²); the polynomial ring does not contain the already required q⁻¹; affects nothing. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).

## Treumann–Venkatesh, Functoriality, Smith theory and the Brauer homomorphism (Annals, 2016)

- **Misprint** at §2.10, p. 187: the source says the Hecke action on the permutation module A[S] has kernel h(s,t), which under its own product (2.10.1) is a right action; it should be the transposed kernel h(t,s), the only form yielding a left action and (2.10.2); affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## van Hoften, arXiv:2010.10496

- **Error** at Appendix A, §A.3.2: the source says the unramified group matching the coinvariant translation lattice and fundamental group is adjoint, yet for ramified PU₃ the matching group is SL₂; it should be an unramified quasi-split semisimple group with the inertia-coinvariant cocharacter lattice, adjoint only when that lattice is the full coweight lattice; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Varshavsky, the later Varshavsky paper checked by the reviews (title not given)

- **Error** at a locator the reviews do not give: the source says a normal-cone fixed-locus (fixed-point) assertion more generally than it holds; it should be as the witness in the cited review requires; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Voight, Characterizing quaternion rings over an arbitrary base, arXiv:1004.0994v2 (2012)

- **Misprint** at Example 3.14: the source says one of the two signs in the worked diagonalisation of the binary form is a plus; it should be with both signs minus, as the basis change f₂ = e₂ − (b/2a)e₁ confirms; affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Wagner, PhD thesis (cited as W-thesis)

- **Error** at §2.2, items 2.7 and 2.11 and Lemma 2.12, pp.29 and 31–32: the source says the cyclotomic factor stays irreducible modulo p in the local-chart argument; it should be separability only (Φ₅ splits into four linear factors over 𝔽₁₁); affects the proof. Found by  (#155 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Wagner, q-de Rham cohomology and topological Hochschild homology over ku, arXiv:2510.06057v1

- **Misprint** at the proof of Corollary 6.15, p. 86: the source says it uses QH 3.12; it should be QH Corollary 3.13; affects nothing. Found by  (#151 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Wagner, q-Hodge complexes over the Habiro ring, arXiv:2510.04782v2

- **Misprint** at Corollary 3.25: the source says a prime-power exponent range that includes the boundary exponent 0; it should be positive exponents only; affects a stated result. Found by  (#149 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at Lemma 2.12, p.18 (proof; also ¶2.7): the source says the cyclotomic factor stays irreducible after reduction modulo a prime ℓ (over 𝔽_ℓ) in the local-chart Taylor comparison; it should be an argument using only separability and handling every irreducible factor: Φ₅ splits over 𝔽₁₁ with roots 3, 4, 5, 9; affects the proof. Found by  (#155 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Lemma 4.2(a), pp. 52–53: the source says the truncation τ*_n is a left adjoint; it should be a right adjoint, as the displayed formula shows; affects nothing. Found by  (#149 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Lemma B.2, p.77 (two-term localisation resolution): the source says the differential multiplies by the q-factorial P_i; it should be multiplication by 1−q^(i+1) (corrected sign/index), so the augmentation vanishes on the image (with P₁ the defect is q/((1−q)(1+q))≠0); affects the proof. Found by  (#156 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Wagner, q-Witt vectors and q-Hodge complexes, arXiv:2410.23078v5

- **Error** at Lemma 2.2, p.8: the source says the ideal generated by the q-integers attached to the primes dividing m equals (Φ_m(q)), with no restriction on m; it should be restricted to m>1: at m=1 there are no prime divisors, so the ideal is (0) while Φ₁=q−1; affects a stated result. Found by  (#156 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Lemma 3.7, displayed relation (after Definition 3.6, p. 39): the source says the differential–Frobenius relation with V_n where F_n belongs, an ill-typed expression n(d∘V_n); it should be dF_n = nF_n d, which is what the proof of the lemma gives; affects a stated result. Found by  (#39 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Lemma 3.7, p. 39: the source says d∘F_n = n(d∘V_n); it should be d∘F_n = n·F_n∘d, as its proof gives; affects a stated result. Found by  (#149 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Gap** at Lemma 4.17, p. 61 (inference at cached lines 3033–3052): the source says graded commutativity follows coefficientwise on cochains, but a closed form need not be fixed coefficientwise (ω=YdX+XdY gives (γ_X−1)ω=hXdY≠0); it should be a cochain homotopy showing the commutator is a boundary, so the conclusion holds in cohomology; affects the proof. Found by  (#39 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Proposition 2.48, p.33: the source says the displayed Frobenius map lands in the wrong q-Witt ring; it should be W_d as target; affects a stated result. Found by  (#156 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Weibel, The K-book

- **Error** at Chapter IV, Exercise 1.1 (the punctured Poincaré homology sphere): the source says the free action on S³ comes from embedding the binary icosahedral group in O₃; it should be the binary icosahedral group Γ ⊂ SU(2) ≅ S³ acting by quaternion multiplication, with only its image A₅ lying in SO(3); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Weibel, The K-book (2013)

- **Misprint** at Chapter VI, Theorem 10.1(6): the source says |K_n(ℤ)| = c_{2k+1} for n = 8k+6; it should be c_{2k+2}, since its proof gives |K_{4k−2}(ℤ)| = c_k and 8k+6 = 4(2k+2)−2; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at III, text after Proposition 7.8.2 (norm-kernel equality), chapter PDF pp.67–68: the source says the letters I and V in interchanged roles; it should be the letter consistent with Proposition 7.8.2 (the review names the I/V misprint without restating it); affects nothing. Found by  (#162 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Theorem VI.10.1, pp. 527–528: the source says the 8k+6 row has order c_(2k+1); it should be c_(2k+2), as Table 10.1.1 says (K₂₂(ℤ) has order 691); affects a stated result. Found by  (#127 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at VI, 5.5–5.6 (ordered configurations and projective coinvariants), combined PDF pp.497–498: the source says the projective line over 𝔽₂ has seven points; it should be three points; affects nothing. Found by  (#162 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at VI, 5.7–5.8 (rank-two sequence), combined PDF pp.498–499: the source says the stabiliser of the standard triple of points is the determinant-one diagonal subgroup; it should be the scalar subgroup diag(a,a); affects the proof. Found by  (#162 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at VI, Exercise 5.3 (small-field calculation over 𝔽₇), combined PDF p.508: the source says the universal torsion class is c=[4] over 𝔽₇; it should be c=2[−1]=2[4], of order 2, whereas [4]=6[3] has order 4 in P(𝔽₇)=ℤ/8; affects a stated result. Found by  (#162 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at VI, Exercise 5.5(ii), combined PDF p.508: the source says identity (ii) with the terms [−x²] and [1/x²]; it should be a corrected identity: the printed form fails for 3, 6, 6, 6 and 9 values of x over 𝔽₇, 𝔽₈, 𝔽₉, 𝔽₁₁, 𝔽₁₃; affects a stated result. Found by  (#162 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at VI, Lemma 5.4(c), combined PDF p.496: the source says the inversion-element identities hold in the Bloch group B(F), placing every inversion element in B(F); it should be the pre-Bloch group P(F): ⟨2⟩ is not in B(𝔽₅), and over ℚ the element h(2) has boundary 2∧(−1)≠0; affects a stated result. Found by  (#162 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at VI, the rank-three comparison just before Lemma 5.10, combined PDF p.501: the source says ψ′(P)=2c; it should be ψ′(P)=−2c, forced by the rotation sum 2c (checked over 𝔽₇, 𝔽₁₁, 𝔽₁₃) and the displayed cone differential; affects the proof. Found by  (#162 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at §VI.2, the value w₁₀(ℚ) (Example VI.2.1.2 and Lemma VI.2.4, pp. 470–472): the source says w₁₀(ℚ) with an extra factor 5; it should be 264 = 8·3·11, since 5−1 does not divide 10; affects a stated result. Found by  (#127 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Weibel, The K-book (author text, 29 August 2013)

- **Error** at III, Example 6.2.3, p.233: the source says a local norm-symbol value that is merely not the identity gives a section from the roots of unity into K₂; it should be a primitive value (a generator of μ_m): for m=6, ζ₆² has order 3 and generates only three elements; affects a stated result. Found by  (#160 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at III, Lemma 6.9.1, p.241: the source says an element satisfying the m-th power relation yields distinct eigenvalues and hence a matrix splitting, without requiring its minimal polynomial to have degree m; it should be required: in Mat₂(D), D a quaternion division algebra with μ₄⊂F, diag(1,−1) has fourth power 1, degree-two minimal polynomial, no splitting; affects a stated result. Found by  (#160 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Weibel, The K-book (combined draft)

- **Misprint** at VI.6.4: the source says a formula with a required overbar missing; it should be written with the bar, as in the separate chapter file Kbook.VI.pdf; affects nothing. Found by  (#138 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Weibel, The K-book, Chapter VI

- **Misprint** at Theorem 10.1, items (5)–(6): the source says these items involve c_{2k+1} and ℤ/c_{4k+4}; it should be c_{2k+2} and ℤ/w_{4k+4}, as the book's Table 10.1.1 and the proof give; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Wenzl

- **Misprint** at paragraph after Theorem 5, printed p. 9 (Wenzl line 281): the source says infinite projection sequences exist for t∈I; it should be use 1/t∈I, as on p. 5; t=3 lies in I but cannot satisfy eᵢeᵢ₊₁eᵢ=3eᵢ for nonzero orthogonal projections; affects a stated result. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).

## whittaker-dynamics

- **Gap** at Chapter XIV, §165(vii), printed p. 385, second edition (whittaker-dynamics line 16698): the source says expansion of the restricted-problem perturbation satisfies the required resonant-coefficient condition; it should be supported by the omitted coefficient computation and nonvanishing argument establishing that condition; affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).

## Wiese, arXiv:1809.04645v1

- **Misprint** at Proposition 4.16: the source says dim H⁰(⟨τ⟩, M) = μ/3; it should be as the witness in the cited review requires (the roadmap's correction, which the review says stands); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Wiese, arXiv:1809.04645v1 (title not given in the reviews)

- **Misprint** at Proposition 4.16: the source says ν_∞; it should be as the witness in the cited review requires (the roadmap's correction, which the review says stands); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Wood, arXiv:1702.04644

- **Misprint** at Definition 3.12: the source says the full tame fundamental group is free pro-prime-to-p; it should be that only its maximal prime-to-p quotient is free pro-prime-to-p; affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Wu, lecture notes on heights (diop-08)

- **Misprint** at Lemma 2.5, p. 4: the source says the height is independent of the chosen coordinates; it should be independent of the number field chosen to contain the point, which is what the proof establishes; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Xiao18

- **Error** at Theorem 4.7, (8), p. 21, copied as Leslie25 Theorem 4.7, p. 36: the source says the nilpotent integral equals the full character sum after inverting (7); it should be carry the factor 2^(−|S1|) of Fourier inversion on (ℤ/2)^S1; affects a stated result. Found by EndoscopicTransferAndUnitaryTraceComparisonPartII (#309 at 80a66cc, 2026-10-23, claude opus).

## yagasaki-fixed-mass

- **Error** at Theorem 1.1 proof context, §1 after (1.5), printed p. 5 (yagasaki-fixed-mass line 171): the source says equal dimensions and the displayed mixed-derivative condition suffice for Hamiltonianity; it should be supplemented by other closedness conditions: h=0, ω=0, g=(I₂,0) satisfies the displayed test but is not canonically Hamiltonian; affects a stated result. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Theorem 1.1 proof dependency, Lemma 2.5 multiplication displays, printed p. 12 (yagasaki-fixed-mass line 507; yagasaki-fixed-mass line 516): the source says the displayed products repeat primed factors or omit primes on C₃; it should be M(C₁,C₂,C₃)M(C₁′,C₂′,C₃′) and the reverse product, matching their displayed right-hand matrices; affects nothing. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Error** at Theorem 1.1 proof dependency, Lemma 2.5, printed p. 12 (yagasaki-fixed-mass line 549): the source says the C₃C₁ coefficient in Mᵏ is k−1, and derives corresponding component-containment formulas; it should be k(k−1)/2; the polynomial subgroup curve is M(cC₁,cC₂+c(c−1)C₃C₁/2,cC₃); affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Gap** at Theorem 1.1 proof dependency, Theorem 2.3, printed p. 9 (yagasaki-fixed-mass line 359): the source says setting lower variations to zero produces a reduced variational subsystem; it should be proved invariant first: y₁=0 forces f_ε λ₁=0, which need not hold; affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Theorem 1.1 proof dependency, equation (2.6) index constraint, printed p. 9 (yagasaki-fixed-mass line 358): the source says the λ-weighted index sum uses unprimed i indices; it should be primed i′ indices, matching the λ factors in the preceding sum; affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Theorem 1.1 proof dependency, equation (2.9), printed p. 10 (yagasaki-fixed-mass line 391): the source says the forcing is evaluated at the scalar frequency ω* times t plus θ₀; it should be the vector frequency ω(I*) times t plus θ₀, as in the immediately following fundamental matrix; affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Error** at Theorem 1.1 proof dependency, §2, equation (2.6), printed p. 9 (yagasaki-fixed-mass line 334): the source says third variations use coefficients 2 for second-derivative cross terms and repeat the same mixed term; it should be coefficients 3, with both f_xε(y₁,λ₂) and f_xε(y₂,λ₁), under the second-variation convention printed above; affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Gap** at Theorem 1.1 proof, §3 and §4, printed pp. 16, 23–24 (yagasaki-fixed-mass line 740; yagasaki-fixed-mass line 1095): the source says fixed-mass meromorphic integrals yield integrals meromorphic in ε at zero after singular rescaling; it should be justified by an additional extension theorem: meromorphic pullback for ε≠0 does not supply meromorphic extension across ε=0; affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Theorem 1.1 spatial proof, criterion invocation, printed p. 24 (yagasaki-fixed-mass line 1124): the source says the system is identified by an unresolved equation label; it should be equation (4.7); affects nothing. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Theorem 1.1 spatial proof, definition of Ŝ₃, printed p. 23 (yagasaki-fixed-mass line 1071): the source says the defining equations use ψ although ψ is absent from the coordinate tuple; it should be replaced by the previously defined Ψ, or included as a coordinate with its angle constraint; affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Theorem 1.1 spatial proof, equation (4.2), printed p. 21 (yagasaki-fixed-mass line 989): the source says the ε⁶ quadratic potential lacks a mass factor; it should be multiplied by μ, as required by (4.1) and the following spherical-coordinate Hamiltonian; affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Gap** at Theorem 1.1 spatial proof, equations (4.8)–(4.9), printed p. 24 (yagasaki-fixed-mass line 1106): the source says the meromorphic-coordinate criterion applies along ψ=π/2, pψ=0, I₂=I₃; it should be applied in coordinates regular there; the angular Delaunay chart degenerates at zero inclination; affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Theorem 1.1 spatial proof, final integral display, printed p. 24 (yagasaki-fixed-mass line 1153): the source says the eccentricity-dependent second summand has a plus sign while identifying the expression with (3.13); it should be a minus sign, matching (3.13); affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Theorem 1.1 spatial proof, implicit-differentiation display, printed p. 23 (yagasaki-fixed-mass line 1080): the source says chain-rule summands multiply χ̂_wⱼ by Wⱼ,ψ or Wⱼ,Iₗ; it should be −χ̂_wⱼ Wⱼ,ψ/Wⱼ,wⱼ or −χ̂_wⱼ Wⱼ,Iₗ/Wⱼ,wⱼ, respectively; affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Theorem 1.1 spatial proof, transformed Hamiltonian, printed p. 22 (yagasaki-fixed-mass line 1040): the source says χ̂₃ is evaluated with action arguments I₁,I₂; it should be evaluated with I₂,I₃, consistently with (4.6); affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Theorem 1.1, definitions of S₂ and S₃, printed pp. 3–4 (yagasaki-fixed-mass line 124; yagasaki-fixed-mass line 129): the source says the second defining constraint uses u₂ without a square; it should be u₂², consistently with the immediately preceding distance constraints and equations (1.3)–(1.4); affects a stated result. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Error** at §3, Delaunay angle domain and period identification, printed pp. 15–17 (yagasaki-fixed-mass line 717; yagasaki-fixed-mass line 776): the source says the action defined by (3.7) has a 2π-periodic conjugate angle; it should be an angle of period 2π√(1−μ), or use L=√(1−μ)I₁ and its conjugate angle θ₁/√(1−μ); affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Error** at §3, Remark 3.1(ii), printed p. 20 (yagasaki-fixed-mass line 951; yagasaki-fixed-mass line 958): the source says the regularized potential contains q₁⁴q₁²q₂²−4+q₂⁴; it should be −ε²μ(q₁²+q₂²)(q₁⁴−4q₁²q₂²+q₂⁴)/4 inside the regularized bracket before scaling; affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Error** at §3, Remark 3.1(ii), printed p. 20 (yagasaki-fixed-mass line 955): the source says dividing both q and p by ε^(3/2) removes the displayed ε-dependence; it should be division of both q and p by √ε, after correcting the quartic polynomial; affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Error** at §3, analyticity on the proposed covering, printed p. 15 (yagasaki-fixed-mass line 707): the source says χ is an analytic function when v₂ and v₃ are taken modulo 2π; it should be defined on local branches or a further cover: its linear v₂ and v₃ terms change under those identifications; affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Error** at §3, definition of V₃, printed p. 15 (yagasaki-fixed-mass line 698): the source says the second V₃ term contains (I₁²−I₂²/(1−μ))²; it should be (I₁²−I₂²/(1−μ)) to the first power, obtained by squaring the tangent relation in (3.7); affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Error** at §3, equation (3.7), printed p. 14 (yagasaki-fixed-mass line 646): the source says its displayed elementary expression equals the definite radial integral; it should be multiplied by √(1−μ)/I₁ and then have its lower-endpoint value subtracted; affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Error** at §3, equations (3.13)–(3.15) and contour conclusion, printed pp. 17–19 (yagasaki-fixed-mass line 806; yagasaki-fixed-mass line 908): the source says its contour integral is nonzero for sufficiently large contour height; it should be zero on closed lifted contours: (3.13)'s integrand is −½d[(3cos2(φ+θ₂)+1)/(1+e cosφ)²] after fixing the phase shift; affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §3, implicit-differentiation display, printed p. 16 (yagasaki-fixed-mass line 725): the source says chain-rule summands multiply χ_vⱼ directly by Vⱼ,r or Vⱼ,Iₗ; it should be −χ_vⱼ Vⱼ,r/Vⱼ,vⱼ or −χ_vⱼ Vⱼ,Iₗ/Vⱼ,vⱼ, respectively; affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §3, singularity location after (3.17) and Figure 5, printed pp. 18–19 (yagasaki-fixed-mass line 853): the source says ω₁t→iK₁ places the singularity at t=iK₁; it should be t=iK₁/ω₁, with the same frequency correction in the contour heights; affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).

## yagasaki-new-proof

- **Misprint** at Remark 4.2, printed p. 16, arXiv v2 (yagasaki-new-proof line 729): the source says equation (1.2) is the planar problem; it should be the spatial problem evaluated near planar orbits; affects nothing. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Theorem 2.1, printed p. 5, arXiv v2 (yagasaki-new-proof line 188): the source says the Hamiltonian criterion concludes nonintegrability of equation (1.3); it should be equation (2.1), the Hamiltonian system to which the stated hypotheses refer; affects a stated result. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Gap** at Theorem 3.1 proof, contour calculation, printed p. 11, arXiv v2 (yagasaki-new-proof line 479; yagasaki-new-proof line 490): the source says a one-turn circle around a square-root branch point supplies the required closed-loop obstruction; it should be a closed lift on the orbit surface; two turns cancel the displayed ζ^(−5/2) contribution, so the stated nonzero estimate does not suffice; affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Theorem 4.1 proof, action–eccentricity relation, printed p. 15, arXiv v2 (yagasaki-new-proof line 700): the source says the angular momentum relation uses √(1−ε²); it should be √(1−e²), with e the eccentricity; affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Gap** at Theorem 4.1 proof, equations (4.9)–(4.10), printed p. 15, arXiv v2 (yagasaki-new-proof line 682): the source says its Delaunay-coordinate criterion applies along the equatorial orbit I₂=I₃; it should be justified using coordinates regular at zero inclination, where the printed angular chart degenerates; affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Theorem 4.1, printed p. 15, arXiv v2 (yagasaki-new-proof line 672): the source says the spatial theorem concerns system (3.11) and Hamiltonian (3.9); it should be system (4.8) and Hamiltonian (4.7); affects a stated result. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Error** at §1, Hamiltonianity criterion after (1.3), printed p. 3, arXiv v2 (yagasaki-new-proof line 99): the source says equal dimensions and the mixed-derivative condition characterize Hamiltonianity; it should be supplemented by other closedness conditions; h=0, ω=0, g=(I₂,0) is a counterexample to sufficiency; affects a stated result. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Error** at §3, after (3.14), printed p. 9, arXiv v2 (yagasaki-new-proof line 385): the source says the rotating azimuth φ has the Kepler period 2πk₂/k₁; it should be the inertial azimuth φ+t that returns modulo 2π after that period; φ changes by 2π−2πk₂/k₁; affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Error** at §3, analytic generating function on the proposed covering, printed p. 8, arXiv v2 (yagasaki-new-proof line 313): the source says χ is analytic with v₂ and v₃ taken modulo 2π; it should be defined on local branches or a further cover, because its linear angle terms are not invariant under these identifications; affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §3, branch-point asymptotics and contour center, printed pp. 10–11, arXiv v2 (yagasaki-new-proof line 458; yagasaki-new-proof line 479): the source says the singular point is π+iK and the leading time-expansion coefficient lacks k₂/k₁; it should be t₀=(k₂/k₁)(π+iK), with the coefficient multiplied by k₂/k₁ and its square-root coefficient adjusted accordingly; affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Error** at §3, definition of V₃, printed p. 7, arXiv v2 (yagasaki-new-proof line 310): the source says the second V₃ term contains (I₁²−I₂²)²; it should be (I₁²−I₂²) to the first power, as follows from the tangent relation in (3.7); affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §3, equation (3.16), printed p. 9, arXiv v2 (yagasaki-new-proof line 401): the source says the first angle of h₁ is t+θ₁; it should be (k₁/k₂)t+θ₁, as prescribed by (3.12); affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Error** at §3, equation (3.7), printed p. 6, arXiv v2 (yagasaki-new-proof line 242): the source says its elementary radial expression equals the defining integral; it should be divided by I₁ on the positive-action branch, with the lower-limit constant restored; affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §3, equations (3.13)–(3.14), printed pp. 8–9, arXiv v2 (yagasaki-new-proof line 363; yagasaki-new-proof line 378): the source says χ₂ equals the inertial azimuth, and its time derivative carries an extra I₂; it should be −χ₂ equal to that azimuth, with −ω₁χ₂,rR_θ₁=φ̇+1; affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Error** at §3, h₁ after (3.11), printed p. 7, arXiv v2 (yagasaki-new-proof line 291; yagasaki-new-proof line 299): the source says differentiating the perturbation introduces positive I₂ multiples of χ₂,r; it should be negative unit multiples instead, since φ=θ₂−χ₂; affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §4, definition of S₃, printed p. 14, arXiv v2 (yagasaki-new-proof line 642): the source says the defining equations use ψ outside the listed coordinate tuple; it should be replaced by Ψ, or included with its angle constraint; affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §4, equation (4.1), printed p. 11, arXiv v2 (yagasaki-new-proof line 517): the source says the first numerator in ṗ_z contains y(x²+y²+z²); it should be z(x²+y²+z²), as direct expansion of the z-force shows; affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §4, equation (4.2), printed p. 12, arXiv v2 (yagasaki-new-proof line 536): the source says the first perturbation denominator is (x²+y²)^(3/2); it should be (x²+y²+z²)^(3/2); affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §4, equation (4.4), printed p. 13, arXiv v2 (yagasaki-new-proof line 565): the source says the generating function's action arguments repeat I₂; it should be I₁,I₂,I₃; affects nothing. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Error** at §4, h₁ after (4.8), printed p. 14, arXiv v2 (yagasaki-new-proof line 620; yagasaki-new-proof line 629): the source says the two angular-chain terms involving χ̂₃,ψ have the displayed signs; it should be both signs reversed, from −∂H/∂θ₁ and φ=θ₃−χ̂₃; affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §§3–4, implicit-differentiation displays, printed pp. 8, 15, arXiv v2 (yagasaki-new-proof line 329; yagasaki-new-proof line 653): the source says the chain-rule terms use derivatives of the defining constraints as derivatives of the implicit variables; it should be −Vⱼ,s/Vⱼ,vⱼ and −Wⱼ,s/Wⱼ,wⱼ, respectively, for each differentiation variable s; affects the proof. Found by RestrictedThreeBody (ERRATA-RestrictedThreeBody at cc5f962, 2026-10-23, codex gpt-6-astra).

## Yuan–Zhang (Ann. of Math. 187, 2018)

- **Misprint** at the sentence after Proposition 5.4, before Corollary 5.5: the source says the determinant lattice lies in ω^{−2}; it should be ω², as Theorem 4.10 forces; affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at §3.1, p. 552, the special case: the source says the reflex field F′ equals E; it should be so only when [F:ℚ] > 1, while F′ = ℚ in degree one; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Yuan–Zhang, Ann. of Math. 187 (2018), no. 2

- **Misprint** at the sentence before Corollary 5.5, p. 576: the source says the determinant line in ω^{−2}; it should be ω², matching the source's own Theorem 4.10 (pp. 569–570); affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Zagier, Ramanujan's mock theta functions and their applications, 2009

- **Misprint** at Theorem 7.1 and its proof (rank-to-Lerch display, cached lines 947–948): the source says a Lerch-sum expression for the rank generating function at a root of unity that fails numerical checks; it should be the version with corrected signs and q^(−1/6): −η(3τ)³/(η(τ)ϑ(3α;3τ)) + q^(−1/6)[ξ⁻¹μ̂(3α,−τ) − ξμ̂(3α,τ)]; affects a stated result. Found by  (#540 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Zaman (title not given in the report)

- **Misprint** at (6.7), (6.25), (6.29), pp. 145 and 151–152, the α = 5.8 row of the (T, α, C) table: the source says the real-secondary-zero (digamma) coefficient is at most 0.6881; it should be 0.6882, since the expression evaluates to about 0.6881037 and was rounded down; affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Zhu (title not given in the review)

- **Misprint** at the appendix (no finer locator): the source says the appendix uses an inconsistent normalization; it should be as the witness in the cited review requires; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Zureick-Brown, arXiv:1204.5246v4

- **Error** at the proof of Theorem 1.1(i), Step 3, pp. 22–24: the source says finite flat maps are locally monogenic, which fails for a rank-three square-zero algebra; it should be avoid that claim, reducing instead to monogenic generators together with finite normalizations; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Zureick-Brown, Cohomological descent on the overconvergent site, arXiv:1204.5246

- **Error** at Lemma 5.14 (the argument is used twice): the source says the proof infers equality of tubes from surjectivity of a map of schemes, which does not give the tube isomorphism Lemma 5.2 needs (flagged by Le Stum, arXiv:2209.07875, §7); it should be replaced by Le Stum's dimension induction (§7.2, Lemmas 7.6–7.7, Corollary 7.9), separating strict transform from full inverse image; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Česnavičius, A modular description of X₀(n) (arXiv:1511.07475v2)

- **Error** at Proposition 4.3.6 and its proof, p. 39: the source says schematicity away from listed prime-power levels, not excluding n = 1, and its proof factors n = n₁n₂ with n₁, n₂ ≥ 3, impossible at n = 1; it should be also exclude n = 1, where inversion is a nontrivial automorphism and only a coarse j-line exists; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Česnavičius, arXiv:1810.04493v2

- **Misprint** at (3.14.10), pp. 15–16: the source says r_aT − r_b; it should be as the witness in the cited review requires; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Proposition 3.11(iii), pp. 12–13: the source says r_{s'}; it should be r'_{s'}; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Remark 3.9, p. 12: the source says an earlier index where a later one is meant; it should be as the witness in the cited review requires; affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at the ideal I_s on p. 15 (argument for Theorem 3.14): the source says I_s carries the factor (r₁,…,r_s); it should be as the witness in the cited review requires; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Česnavičius, Macaulayfication of Noetherian schemes (arXiv:1810.04493v2)

- **Misprint** at Proposition 3.11(i)–(iii), pp. 12–13: the source says the clauses use the sequence's original last element where the auxiliary replacement element is meant; it should be the auxiliary last element; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Česnavičius, Macaulayfication of Noetherian schemes, arXiv:1810.04493v2

- **Misprint** at §1.14: the source says something about the support that the review calls an "off-support" slip; it should be as the witness in the cited review requires; affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Česnavičius–Koshikawa, arXiv:1710.06145v3,

- **Error** at Proposition 5.39, p. 55: the source says the full augmentation kernel has divided powers and is topologically nilpotent, which the point case refutes (every power of T survives mod p); it should be use the extended chart ideal I·D_m; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Česnavičius–Koshikawa, The A_inf-cohomology in the semistable case, arXiv:1710.06145v3

- **Error** at Proposition 5.39, p.55: the source says the full augmentation ideal of a finite divided-power approximant has divided powers and is topologically nilpotent; it should be use the extended chart ideal I·D^(m) (for p=m=2 on O_C, T=ξ²/2 has all powers nonzero mod 2); affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
