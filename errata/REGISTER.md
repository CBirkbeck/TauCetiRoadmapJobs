# Mistakes found in published sources

Reviewers, red-team passes and errata jobs record every mistake they find in a source while checking a roadmap's locators: misprints (slips whose intended meaning is clear), errors (a false statement or proof step) and gaps (a step the source does not justify), each with the roadmap, the board pull request or errata job and the head that reported it. Collected by the board sync from the `## Source issues` sections of review, red-team and errata comments; the data is in `errata/source-issues.json`.

396 mistakes recorded on the board: 191 misprints, 177 errors, 27 gaps, 1 unparsed bullets.
Errata jobs have read the cited sources of 1 roadmaps; in those of 0 they found no mistake.
The explorer's register (to 2026-10-21) holds 15335 more, kept in `errata/explorer/`: 1525 awaiting review, 13582 confirmed, 228 rejected.

## (source not named)

- **Unparsed** (, ? at , 2026-10-23): Misprint** in Stacks Project, Tag 0BKH (opening paragraph): the source says the derived p-completion C of A = ℤ_p ⋉ ℚ_p/ℤ_p is R[1] ⊕ R[0] (R = ℤ_p) without qualification, false in D(A) since Hom(C, R[1]) = 0; it should be stated in D(ℤ_p) after restricting scalars, or as the cohomology computation only; affects nothing. (found in: 944-M2.md)

## Abe, arXiv preprint v1

- **Error** at Lemma 6.1(i), p. 7: the source says one twist works on any finite-type X, but two points with Frobenius eigenvalues 1 and p admit no common twist; it should be for smooth geometrically connected X, with separate twists on separate components; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## AIP (Andreatta–Iovita–Pilloni), Hilbert adic paper, author final version

- **Error** at Lemma 8.1, §8.1, printed p. 34: the source says the proof applies level rigidity to α/ᾱ without showing that this quotient fixes the level marking; it should be supplemented by a proved freeness hypothesis: in the ℚ(√3), N = 7 CM example the quotient is −1, which moves the marking; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Allen–Khare–Thorne, Modularity of GL₂(F_p)-representations over CM fields, arXiv:1910.12986v2

- **Gap** at the proof of Theorem A.14, printed p.95: the source says the source invokes Darmon–Diamond–Taylor Lemma 4.11, which excludes the projective-A₄ (degree-three) case, without treating that case; it should be as the witness in the cited review requires; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Andreatta–Iovita–Pilloni

- **Gap** at §8.1, Lemma 8.1, p. 34: the source says rigidity applies to α/ᾱ without checking that this map preserves the marking; it should be first prove marking preservation before invoking rigidity; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Andreatta–Iovita–Pilloni, The adic, cuspidal, Hilbert eigenvarieties (2016)

- **Misprint** at §4, a later reference to Lemma 4.2 (cached extraction line 723): the source says Lemma 4.2 (an ideal estimate) under a wrong label; it should be cited as Lemma 4.2; affects nothing. Found by  (#167 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Arthur (Art80, 1980)

- **Error** at Lemma 1.1: the source says a strict inequality; it should be the corrected inequality recorded in Arthur, An Introduction to the Trace Formula (2005), p. 68; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Arthur–Clozel (AC89, 1989)

- **Error** at Lemma 6.1: the source says a lemma that contains a mistake, recorded in Arthur, An Introduction to the Trace Formula (2005), p. 191; it should be as the witness in the cited review requires; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Gap** at the density argument, p. 196: the source says a density argument with a gap, recorded in Arthur, An Introduction to the Trace Formula (2005), p. 191; it should be as the witness in the cited review requires; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Asakura–Miyatani, arXiv:2007.14255v2

- **Error** at Lemma 2.19 (with Remark 2.21(3)): the source says the lemma for any smooth V-scheme X; it should be restricted to affine X, which is all its proof (an affine embedding) gives; it fails for proper X, since H¹(E^an,O)=K for an elliptic curve; affects a stated result. Found by  (#110 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Lemma 2.5: the source says Fil⁰M_rig in the unique-lift statement; it should be the de Rham filtration Fil⁰M_dR; affects nothing. Found by  (#110 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Asakura–Miyatani, Milnor K-theory, F-isocrystals and syntomic regulators, arXiv:2007.14255v2

- **Misprint** at Definition 2.1: the source says the comparison map c is an isomorphism of B†_K-algebras; it should be an isomorphism of B†_K-modules; affects nothing. Found by  (#110 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Definition 2.1 (cached line 138): the source says the comparison is an isomorphism of B†_K-algebras; it should be an isomorphism of B†_K-modules; affects nothing. Found by  (#47 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Lemma 2.19, p. 14: the source says the acyclicity lemma for smooth schemes with no affineness assumption, which a proper elliptic curve (H¹(O)=K) refutes; it should be stated for affine schemes, as its proof, which starts from an affine embedding, assumes; affects a stated result. Found by  (#47 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Gap** at equations (2.3)–(2.7), pp. 6–7: the source says the evaluation of extensions may identify H⁰ with Q_p, which is unjustified on a disconnected base; it should be carried out with the distinguished class 1, without that identification; affects the proof. Found by  (#47 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Atobe–Kondo–Yasuda, Local newforms for the general linear groups over a non-archimedean local field, Forum Math. Pi (2022)

- **Misprint** at proof of Proposition 3.7, definition of the lattice paths, p.20: the source says the paths end at the vertex [a,1]; it should be [1,r] (for r=3, a=1 the path runs (2,1),(1,1),(1,2),(1,3)); affects nothing. Found by  (#173 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Bakker–Klingler–Tsimerman (BKT; title not given in the review)

- **Error** at the inverse-image-of-Siegel-sets step (authors' erratum §1.5, p. 3): the source says the step follows from Borel–Harish-Chandra 7.5, which concerns real Siegel sets; it should be justified by Bakker–Grimm–Schnell–Tsimerman, arXiv:2112.06995, 28.1, as the erratum states; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Bakker–Klingler–Tsimerman, Tame topology of arithmetic quotients and algebraicity of Hodge loci, J. Amer. Math. Soc. 33 (2020), arXiv:1810.04801

- **Misprint** at Appendix A.1–A.2, pp.19–20: the source says the chart transition maps are ψ_j∘φ_i⁻¹; it should be φ_j⁻¹∘φ_i; affects nothing. Found by  (#164 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Balakrishnan–Dan-Cohen–Kim–Wewers, arXiv:1209.0640v4,

- **Error** at Remark 2.6 and Definition 2.7, p. 9: the source says the local condition at good places is the image of local integral points, which is empty at 2 for the thrice-punctured line; it should be the neutral (unramified) condition at those good places; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Balakrishnan–Dogra, Quadratic Chabauty and rational points I: p-adic heights, arXiv:1601.00388v2

- **Misprint** at the display of Theorem 6.3 (Definition 6.2 and Theorem 6.3, pp. 26–29): the source says the displayed formula carries an extra (−1) that conflicts with §6.2 and the proof that follows; it should be the display without that (−1), which the proof never uses; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Balakrishnan–Dogra–Müller–Tuitman–Vonk, Explicit Chabauty–Kim for the split Cartan modular curve of level 13, Ann. of Math. 189 (2019)

- **Gap** at Lemma 2.4 and its proof, p. 900: the source says the printed lemma states its converse direction without a qualification it needs; it should be as the witness in the cited review requires; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Barnet-Lamb–Gee–Geraghty–Taylor (BLGGT), arXiv:1010.2561

- **Error** at p. 32 (l. 1388) and p. 34: the source says the polarizing multiplier the sign µ_v(−1) = (−1)^n and calls ε^{1−n}r(χ) odd by definition; it should be (−1)^{n+w}, as BLGGT's own §A.2 formula (p. 87) gives; the CM character of weight (1,0) is a witness; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Bary-Soroker–Koukoulopoulos–Kozma, Irreducibility of random polynomials: general measures, arXiv:2007.14567v3

- **Error** at proof of Lemma 12.5, pp.60–61: the source says the finite sum of reciprocals of small-prime-smooth integers below the cutoff equals the full Euler product; it should be an inequality (at most the product): for the prime set {2} with cutoff 2 the sum is 1.5, the product 2; affects the proof. Found by  (#171 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at §12.2, Lemmas 12.7–12.9, p.62 (cached extraction line 3836): the source says a cutoff comparison in the exclusion argument pointing the wrong way; it should be the reversed comparison; affects the proof. Found by  (#171 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Gap** at §12.2, the imprimitive exclusion after Lemma 12.9, pp.62–63: the source says a short companion part is used without control, while the anatomy event of Lemma 12.6 gives only one witness per r; it should be controlled, e.g. by a separately proved four-witness (five in the middle range) strengthening; affects the proof. Found by  (#171 at , 2026-10-23, backfill from earlier reviews (claude opus)).

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

## Beuzart-Plessis–Chaudouard–Zydor, The global Gan–Gross–Prasad conjecture for unitary groups: the endoscopic case, arXiv:2007.05601v1

- **Misprint** at §10.3, pp. 90–92 (closing sentence, cached line 4945): the source says the order of the component group S_Π with an inverted sign in the exponent; it should be |S_Π| = 2^(dim a_P), the coefficient being its inverse 2^(−dim a_P); affects nothing. Found by  (#521 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Bhatt, p-adic derived de Rham cohomology, arXiv:1204.6560

- **Error** at Remark 8.7: the source says torsion coordinates with the wrong p-power orders (the review sets p^⌊n/2⌋ against p^(n−1)); it should be as the witness in the cited review requires (its recomputation of ℤ_p ⊕ ⊕_j ℤ_p/j); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

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

## Birkbeck–Heuer–Williams (2019)

- **Error** at Proposition 8.4: the source says the map is a Δ(N)-torsor without restriction, which fails at a CM point for N = 7; it should be a quotient-stack statement, or a torsor only over the free locus; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Birkbeck–Heuer–Williams, Ann. Inst. Fourier (doi 10.5802/aif.3560)

- **Error** at Lemma 8.20: the source says the transition maps of its system of unit quotients Δ_n are injective and that the system stabilises; it should be weakened to claim neither: a dyadic unit computation gives Δ_n(5) ≅ ℤ/6 with transition map multiplication by 2 and limit ℤ/3; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at Proposition 8.4, p. 1766: the source says that at tame level N the totally positive units modulo squares of congruence units act freely, making the marked Hilbert moduli space a finite étale torsor; it should be stated with freeness assumed or proved, or on the free locus or quotient stack: for F = ℚ(√3), N = 7, a nontrivial class fixes a CM point; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at Proposition 8.4, p. 1766: the source says at tame level N the totally positive units modulo squares of congruence units act freely, making the marked Hilbert moduli space a finite étale torsor; it should be stated with freeness assumed or proved, or on the free locus or quotient stack: for F = ℚ(√3), N = 7, a nontrivial class fixes a CM point; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Bosch–Lütkebohmert, Formal and rigid geometry II (1993)

- **Error** at the base-change sentence following the definition of a dévissage at a point: the source says dévissages are compatible with base change, without qualification; it should be only when the distinguished finite fibre remains one point, since X² + 1, irreducible over 𝔽₃, splits into two points over an unramified quadratic extension; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Boxer–Calegari–Gee, Cuspidal cohomology classes for GL_n(ℤ) (2025)

- **Error** at Corollary 3.2 and Remark 3.3, p. 518: the source says p = 151 is among the ordinary companion examples; it should be removed from that list, since its only twisted-eigenvalue match is at weights (52,100), with gcd(k−1,p−1) = 3; affects a stated result. Found by  (#131 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Boxer–Calegari–Gee–Pilloni, Abelian surfaces over totally real fields are potentially modular (2021)

- **Misprint** at §6.1.1, p. 139: the source says Q(U) is invertible on M>h when all roots of Q have valuation less than h; it should be valuation at most h, equality included; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Boxer–Calegari–Gee–Pilloni, Abelian surfaces over totally real fields are potentially modular, arXiv:1812.09269

- **Misprint** at §2.8, display after (2.8.5), p.37: the source says an alternating-sign exponent in the L-function conventions with a wrong value; it should be the corrected exponent (the review confirms the misprint but does not restate it); affects a stated result. Found by  (#169 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Boxer–Calegari–Gee–Pilloni, Modularity theorems for abelian surfaces, arXiv:2502.20645v1

- **Misprint** at Definition 9.1.7 and Lemma 9.1.8, pp. 190–191: the source says the definition and lemma with a "toric" subscript missing (the toric-rank-two condition); it should be written with the toric subscript, as the witness in the cited reviews requires; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Boxer–Pilloni, Higher Coleman theory, arXiv:2110.10251

- **Gap** at §§6.2–6.3 (analytic induction and distribution model versus the family statement): the source says the construction is made for uniform affinoid coefficient algebras only, yet states the family result for general coefficients; it should be either kept uniform or extended via a defining Banach norm (the sup-norm loses ε in E[ε]/(ε²)); affects a stated result. Found by  (#167 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Brambilla–Ottaviani, On the Alexander–Hirschowitz theorem, arXiv:math/0701409v2

- **Misprint** at Proposition 5.3, p. 10: the source says P⁵ in the paragraph treating P⁷; it should be P⁷; affects nothing. Found by  (#144 at , 2026-10-23, backfill from earlier reviews (claude opus)).

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

## Burns–Venjakob (published version; zeta isomorphisms in noncommutative Iwasawa theory)

- **Error** at Theorem 6.5, formula (40), p.202, and proof formula (48), p.204: the source says the interpolation formula carries Γ(V̂)⁻¹ for an Artin twist ρ; it should be carry the Gamma factor of V̂⊗ρ*, i.e. Γ(V̂)^(−dim ρ); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Burns–Venjakob, On the leading terms of zeta isomorphisms and p-adic L-functions in non-commutative Iwasawa theory, Doc. Math. (2006), arXiv:math/0511672

- **Error** at Remark 5.6, published pp.194–195: the source says a pairing on an unshifted complex, which is not well typed; it should be the pairing on the correctly shifted complex; affects a stated result. Found by  (#169 at , 2026-10-23, backfill from earlier reviews (claude opus)).

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

## Caraiani–Newton, arXiv:2301.10509,

- **Error** at Lemma 5.6.5: the source says a trace identity forces Klein-four projective image, omitting the A₄ alternative, as an order-24 group over F₇ with quaternion kernel shows; it should be retain both cases, as DDT does; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Lemma 6.1.7: the source says the primes 3 and 5 in swapped roles; it should be use five for the switch at five and three for the switch at three; affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Caraiani–Newton, On the modularity of elliptic curves over imaginary quadratic fields, arXiv:2301.10509v3

- **Error** at Lemma 5.6.5, printed pp.85–86: the source says the trace identity forces reducibility on the determinant kernel, including the projective-A₄ case; it should be exclude that case or argue differently (over F₇ a group with kernel Q₈ is a counterexample); affects the proof; (used on p.87). Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Castella–Liu–Wan (CLW), Iwasawa–Greenberg main conjecture for non-ordinary modular forms and Eisenstein congruences on GU(3,1)

- **Misprint** at the proof of the Eisenstein-ideal bound, §8, p. 78: the source says the order inequality with ≤; it should be ≥, since E ⊂ P^m gives ord_P ≥ m; affects nothing. Found by  (#129 at , 2026-10-23, backfill from earlier reviews (claude opus)).

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

## Conrad, Semistable reduction notes (Darmon CM seminar, 2011)

- **Gap** at the monodromy-criterion pages (no theorem number given): the source says finite-level points are inertia-invariant on the strength of the dimension of the rational Tate-module invariants; it should be supported by a separate finite-level argument, which that dimension count does not supply; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at the pages on finite flat groups at the residue prime (no theorem number given): the source says a wrong rank for the toric or finite part; it should be as the witness in the cited review requires (ranks t and t + 2a); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Conrad–Diamond–Taylor, Modularity of certain potentially Barsotti–Tate Galois representations, JAMS 12 (1999)

- **Misprint** at Lemma 7.2.3, p. 554: the source says the exceptional j-value set without its sign; it should be the signed j-value; affects a stated result. Found by  (#135 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Darmon–Diamond–Taylor, Fermat's Last Theorem,

- **Misprint** at §4.1, Lemma 4.4, p. 111: the source says the oldform chain index starts at 1, omitting i = 0; it should be 0 ≤ i ≤ v; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Dasgupta–Kakde–Silliman–Wang, On Ribet's lemma in the residually indistinguishable case, arXiv:2310.16396v2

- **Misprint** at the relations defining Q, pp.8–9: the source says the relation with the sign opposite to the one in the statement of Theorem 2.1 (pp.7–8); it should be as the witness in the cited review requires (the sign of Theorem 2.1); affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

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

## Diao–Rosso–Wu, Perfectoid overconvergent Siegel modular forms and the overconvergent Eichler–Shimura morphism, arXiv:2106.00094v3

- **Misprint** at Corollary 3.6.13, pp.46–47: the source says a range for w that lacks the n−1 term (with a further supremum issue); it should be Proposition 3.6.12's range c_g+n−1<w≤n; affects a stated result. Found by  (#167 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Dieulefait–Pacetti, arXiv:2108.07577v2,

- **Error** at Theorem 1.9(3), p. 6: the source says the lift is unramified at its own coefficient prime; it should be crystalline there with Hodge–Tate weights {0, k − 1} (unramified Weil–Deligne parameter), as Paso 3 on p. 12 uses; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Dolgachev–Keum, Finite groups of symplectic automorphisms of K3 surfaces in positive characteristic, arXiv math/0403478v5

- **Error** at the proof of Lemma 4.3 (cached lines 643–647): the source says an automorphism of order at most 2 of a free ℤ_ℓ-module acts trivially mod 2, false (the swap matrix on ℤ₂²); it should be an argument that tracks the integral extension terms, since (4.9) alone gives no bound on ρ(X); affects the proof. Found by  (#563 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at the proof of Theorem 3.3, p. 13 (cached lines 511–520): the source says only orders 11 and 15 survive as extra rank-20 candidates, but n=14 with (a₂,a₇,a₁₄)=(1,1,1) satisfies every relation; it should be a list that includes 14, excluded like the others (root lattice A₁₃⊕A₆⊕A₁, square discriminant 196); affects the proof. Found by  (#563 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Duke–Imamoḡlu–Tóth (DIT16), Ann. of Math. 184 (2016)

- **Misprint** at (8.4) (residue of the resolvent kernel, pp. 973–975): the source says the polar projector without a complex conjugate; it should be the projector with the conjugate, with which the printed residue display on p. 975 holds for every Hecke–Maass form, odd or even; affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at p. 984: the source says the sine-power integral without the factor 2^{ν−1}; it should be the integral with the factor 2^{ν−1}; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

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

## Faltings, Endlichkeitssätze für abelsche Varietäten über Zahlkörpern, Invent. Math. 73 (1983)

- **Error** at the height argument along the tower of isogenies (corrected by the author's 1984 erratum, parts a) and b)): the source says the printed argument lacks the two corrections the erratum supplies; it should be an argument separating the toric-intersection and integral-closure defects by two shifts in the required order, giving only eventual stationarity of heights; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Feng–Galatius–Venkatesh, The Galois action on symplectic K-theory (2022)

- **Misprint** at §§2.6–2.7, pp. 12–15, even-degree line of the dualization and Bott-edge comparison (extraction line about 629): the source says twist 2k−1 (an apparent slip); it should be twist 2k; affects nothing. Found by  (#127 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Feng–Yun–Zhang (FYZ)

- **Error** at Remark 2.1, §2.1: the source says every étale quadratic cover admits an everywhere-unramified character restricting to η^n for all n, by geometric cup-product alternation; it should be the criterion that such a character exists iff η^n kills ker(ν*: Pic X→Pic X′), which fails for odd n on the étale double cover of E/𝔽₃: y²=x³+2x²+2x; affects a stated result. Found by  (#142 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Fontaine, Il n'y a pas de variété abélienne sur Z (1985)

- **Misprint** at the proof of Proposition 1.5, p. 520: the source says the inverse-Herbrand boundary value with the upper break u_{L/K} where the lower break belongs; it should be eψ(m) = e·i_{L/K} − 1/d at m = u_{L/K} − 1/e, d = |G_(i_{L/K})| (8/3, not 35/3, for ℚ₃(ζ₉)/ℚ₃); affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

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

## Glasscock–Merriman–Robertson–Smyth, Ergodic theory with applications to continued fractions (2020)

- **Misprint** at Theorem 21, p.46: the source says the Khinchin-constant factor with the denominator k(k+1); it should be a(a+2) (equivalently k(k+2)); affects a stated result. Found by  (#172 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## GLX, arXiv:2208.07195

- **Error** at Lemma 3.2, second assertion: the source says a connected-component formula for the quotient by a group action, with no restriction on the action; it should be stated under additional component and Hausdorff hypotheses, since ℤ acting densely on ℤ_p violates it; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

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

## Harari–Szamuely, Arithmetic duality theorems for 1-motives (J. reine angew. Math., 2005)

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

## Huybrechts, Lectures on K3 surfaces (author draft)

- **Misprint** at Chapter 18, §3, Example 3.4: the source says (via "respectively") discriminant −64 for the infinite-height case p≡3 mod 4 and −p² for the other case; it should be the reverse: −p² for infinite height (rank 22, p-elementary), −64 for the other; affects a stated result. Found by  (#563 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Illusie, Complexe de de Rham–Witt et cohomologie cristalline (Ann. Sci. ENS, 1979)

- **Error** at I.3.21 (I.3.21.1.5, printed p. 579): the source says a proof of I.3.21 that the author's own errata call incorrect; it should be replaced by the argument of Illusie–Raynaud, Les suites spectrales associées au complexe de de Rham–Witt, II.1.3; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kakde, The main conjecture of Iwasawa theory for totally real fields, arXiv:1008.0142v3

- **Error** at Lemma 118, p.87: the source says |H̃|·|⟨h₀⟩|/|P| = |H̃|·i_P, false for P=⟨(a,b^p)⟩ in C_{p²}×C_{p²}; it should be (|H̃|/|P′|)·|⟨h⟩|·i_P², still divisible by p·i_P²; affects the proof; (the bound survives). Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at §3 (character decompositions of Λ(G) and its K-groups): the source says the components are indexed by all absolute irreducible characters, which overcounts conjugate characters (e.g. Z₅[C₃]); it should be index by Galois-orbit representatives, as the paper's own §5.1 does; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kawasaki (the 2000 Macaulayfication paper, cited through Česnavičius; title not given in the review)

- **Misprint** at the conditions restated as Česnavičius Proposition 3.11: the source says the conditions with five misprints, which Česnavičius records in footnote 4, p. 13; it should be as Česnavičius Proposition 3.11 states them; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

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

## Kedlaya–Liu, Relative p-adic Hodge theory I (2015)

- **Error** at the proof of Lemma 2.6.2, p. 53: the source says each stage's plus ring is the image of the integral restricted power-series ring, which need not be integrally closed as Definition 2.4.1 requires; it should be the integral closure of that image, since for ℚ_p⟨T⟩[ε]/(ε²) the element ε/p is integral but not in the image; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kedlaya–Liu, Relative p-adic Hodge theory II (2016)

- **Error** at the proof of Theorem 8.2.3, with Remarks 8.1.2–8.1.4 and Proposition 1.4.22: the source says functions on a seminormal space are recovered by pushing forward from a resolution, with no overlap check; at a node, (1,0) on the normalization is not such a function; it should be that sections agreeing on the resolution's reduced Čech overlap descend, by a finite-algebra subintegrality and seminormality argument; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kedlaya–Liu, Relative p-adic Hodge theory II, arXiv:1602.06899

- **Error** at Remark 8.1.4, p. 159 (used in the proof of Theorem 8.2.3, pp. 162–163): the source says O_X ≅ f_*O_Y for seminormal X and a smooth proper birational resolution f; it should be that O_X is the subsheaf of sections of f_*O_Y compatible on Y ×_X Y, since for a node the section (1,0) does not descend; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kedlaya–Xiao, Differential modules on p-adic polyannuli

- **Error** at Theorems 1.4.21 and 1.5.6: the source says a value-group membership that lacks a normalizing factor, refuted by a rank-one module over the Gauss field with p = 3; it should be (r/ω^{1/p^h})^dim ∈ |K^×|^{1/p^h}; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kedlaya–Xiao, Differential modules on p-adic polyannuli (v4)

- **Misprint** at Remark 1.4.2 (with Definitions 1.2.8 and 1.4.1, pp. 7, 9–10): the source says the intrinsic radius equals |u| times R; it should be R divided by |u|; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Khare–Wintenberger (KW09)

- **Gap** at Lemma 7.2(i), case q_v ≡ −1: the source says the printed proof deduces γ_v from the residual representation alone; it should be as the witness in the cited review requires; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kharlampovich–Myasnikov, arXiv:math/0312509v2

- **Misprint** at the "equivalent" regularity clause, p. 9: the source says the regularity clause in a printed form that the roadmap corrects and the review confirms as wrong; it should be as the witness in the cited review requires; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

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

- **Error** at the generic-rank, multiplicity and graded-piece statements corrected in Gee–Kisin, arXiv: the source says 1208.3179v5, Appendix B: the source's versions of these statements needed correction; it should be generic rank 2^|R|, the reciprocal multiplicity factor, support on the weight ring, and an extra local exclusion; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kisin–Pappas, Integral models of Shimura varieties with parahoric level structure (2018)

- **Error** at Lemma 4.4.8: the source says polarization descent for coefficient-torsor twists holds with no condition at the real place; it should be required that the torsor be trivial over ℝ, as Kisin–Shin–Zhu §5.12.4 notes; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kisin–Pappas, Integral models of Shimura varieties with parahoric level structure (arXiv:1512.01149)

- **Error** at Lemma 4.4.8: the source says a polarization with positive multiplier descends to the twist of an abelian scheme by a torsor, with no condition at the real place; it should be that descent requires the torsor to have a real point, as Kisin–Shin–Zhu §5.12.4 does; twisting E² by Spec ℚ(i) gives an indefinite form; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Koenigsmann, Defining ℤ in ℚ, Ann. Math. 183 (2016) (read in arXiv v2)

- **Misprint** at Proposition 6 (with ℤ_(∞)=[−4,4]) and Remark 8(a), dyadic table row (6,15): the source says the row (6,15) is sent to (1,1,0); it should be a triple giving 5 mod 8, since (1,1,0) gives −21≡3 mod 8 (the triple (1,1,1) gives 69≡5); affects the proof. Found by  (#164 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Koshikawa–Yao, arXiv:2306.00364v1

- **Error** at the essential-image criterion for p-Kummer local systems (test spaces of Definition 7.12): the source says the source's criterion needed the authors' corrigendum (Lemma 1(2)); it should be test on saturated log diamonds with strictly totally disconnected underlying space and p-divisible characteristic, since all-divisible test spaces miss tame inertia; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Kosters–Wan (cited as kw)

- **Misprint** at Proposition 4.4, pp. 15–16: the source says the upper-ramification filtration of an Artin–Schreier–Witt extension without clamping; it should be the clamped filtration, which the conductor computation needs; affects a stated result. Found by  (#142 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Koukoulopoulos–Maynard, On the Duffin–Schaeffer conjecture, Ann. Math. (2020)

- **Misprint** at Lemma 5.3, printed p.264: the source says the overlap estimate carries the indicator of M(q,r)>gcd(q,r); it should be 2M(q,r)≥gcd(q,r): for q=2, r=3, ψ≡3/10, M=9/10<1 yet the overlap has measure 1/6; affects a stated result. Found by  (#172 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Koymans–Milovic, arXiv:1809.09597v1 (cited as KM-21)

- **Misprint** at Lemma 4.1, p.20: the source says an element where an ideal is meant, and a wrong period for the rational norm; it should be the ideal and the corrected period; affects a stated result. Found by  (#177 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Lan, PEL-type thesis

- **Error** at Lemma 1.2.5.10: the source says the lemma in a form that the author's errata correct; it should be as the witness in the cited review requires (the errata's corrected statement); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Lan, PEL-type thesis (original version)

- **Error** at the enlargement of the finite set □ of primes (original errata p. 16; revised thesis Lemma 1.4.4.2 and Proposition 1.4.4.3, pp. 105–106): the source says the finite-□ comparison in a form the errata flag as defective; it should be an open-and-closed immersion in general, an equivalence only under self-dual-lattice uniqueness, as revised; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Land–Mathew–Meier–Tamme, Purity in chromatically localized algebraic K-theory, J. Amer. Math. Soc. (2024)

- **Misprint** at Remark 3.11: the source says the stable K-theory colimit is displayed with ΩM; it should be the corrected expression (the review confirms the printed ΩM is a misprint but does not restate the fix); affects nothing. Found by  (#175 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Lemmermeyer, The Ambiguous Class Number Formula Revisited, arXiv:1309.1071v1

- **Misprint** at Proposition 1 (extraction line 93): the source says "strongly ambiguous" at one point where this is a slip; it should be the class notion consistent with the proposition's ambiguous/strongly ambiguous quotient; affects nothing. Found by  (#122 at , 2026-10-23, backfill from earlier reviews (claude opus)).

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

## Manning–Shotton

- **Error** at the norm-fibre argument for Theorem 6.8: the source says the norm fibres are taken over a quotient wider than the reduced-norm image, which a ℚ(√3) narrow-class example refutes; it should be use the quotient by Nrd(D^×), which equals the totally positive elements F_+^×; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Manning–Shotton, arXiv:1907.06043v2

- **Error** at the proof of Theorem 6.8 (strong approximation and norm fibres): the source says the source quotients by F× although reduced norms from a totally definite quaternion algebra are totally positive; it should be the narrow quotient by F₊×; F = ℚ(√3), with class number 1 and narrow class number 2, shows the difference; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Matomäki–Radziwiłł, Multiplicative functions in short intervals, arXiv:1501.04585v4

- **Error** at Theorem 3 (physical p.7) and the comparison at cached extraction lines 1601–1607: the source says the mean-square comparison over the finite good set in [X,2X] holds uniformly up to h=X, with no upper-endpoint error; it should be a bound with an added h/X term: for f=1, h=X and a dense good set the integral is at least X/36; affects a stated result. Found by  (#172 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Maynard, Small gaps between primes, Ann. Math. 181 (2015)

- **Misprint** at Lemma 8.1, definition of G_{b,j}, p.409 (also (8.6)): the source says the sum defining G_{b,j} starts at r=1; it should be a sum that includes the r=0 term; affects a stated result. Found by  (#177 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at the matrix-positivity assertion after Lemma 8.2, p.411: the source says the quadratic form of the J-integrals is positive definite on the polynomial coefficients; it should be only positive semidefinite: a nonzero two-variable polynomial (square integral 1/3150) has identically vanishing fibre integrals; affects the proof. Found by  (#177 at , 2026-10-23, backfill from earlier reviews (claude opus)).

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

## Milne, Shimura varieties and moduli (notes)

- **Misprint** at the printed calculation behind Proposition 8.8 and Corollary 8.9: the source says the weight adjustment in the construction with a prescribed derived cover is made with the wrong sign; it should be the opposite sign, as the roadmap uses; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Morrison

- **Error** at Proposition 3.3 proof, case (1), printed p. 6 (Morrison line 247): the source says the product has at most n−4 through strands; n=3, h=E₁, i=1 instead gives E₃E₁, with zero through strands rather than at most −1; it should be exclude these terms by their upper cups: a nonidentity h retains an upper cup among the first n endpoints, unlike gₙ₊₁,ⱼ; affects the proof. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Error** at Proposition 3.3 proof, case (2), printed p. 6 (Morrison line 251): the source says a rightmost lower cap in h makes hgₙ₊₁,ᵢ have a vertical rightmost strand; it should be use the upper-cup argument instead; for n=3, h=E₂, i=3, E₂E₃ connects upper endpoint four to lower endpoint two; affects the proof. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §3 and Lemma 3.1, printed p. 4 (Morrison line 131; Morrison line 142): the source says Jₙ is a left ideal, although its defining upper cup is preserved by multiplication on the right; it should be call Jₙ a right ideal; with corrected endpoint indexing, E₂E₁∉J₃ although E₁∈J₃; affects nothing. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §3 figure references, printed pp. 4–6 (Morrison line 139; Morrison line 170; Morrison line 249): the source says the K₆ diagrams, multiplication example, and two exclusion cases refer respectively to Figures 3, 3, and 2; it should be refer respectively to Figures 4, 5, and 6; affects nothing. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §3, definition of P preceding Lemma 3.1, printed p. 4 (Morrison line 129): the source says P consists of the leftmost n−2 upper endpoints; it should be use the leftmost n−1 endpoints; for n=3 the printed J₃ is zero, contradicting its claimed codimension three; affects a stated result. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Misprint** at §5, definition preceding Proposition 5.1, printed p. 9 (Morrison line 347): the source says cap-position adjustment subtracts one for each previously removed cap to its left; it should be τ(s)ᵢ=sᵢ−2κ(s)ᵢ; a cap removes two endpoints. For e₁∈TL₂, the printed rule gives coefficient 1 instead of 1/[2]; affects a stated result. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).

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

## Pilloni, GSp₄ Hida theory,

- **Misprint** at Theorem 5.1.7.1(5), p. 23: the source says the similitude exponent is −λ₁ − λ₂, conflicting with item (3) and HT(ε) = −1; it should be λ₁ + λ₂; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Pilloni, higher Hida theory for GSp4 (author's notes "complexhidatheorygsp4")

- **Misprint** at §13.1.1, condition 4, p. 84: the source says Q(U) is invertible on M>h when the roots of Q have valuation strictly greater than h; it should be valuation at most h, equality included; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Pollack–Stevens, Overconvergent modular symbols and p-adic L-functions

- **Misprint** at Definition 6.4 / Proposition 6.5, p. 29: the source says L(f, χ⁻¹, 1); it should be as the witness in the cited review requires (the roadmap's source correction, which the review confirms); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Definition 6.4 / Proposition 6.5, p. 29: the source says the coefficient space S_k(Γ, ℚ_p); it should be as the witness in the cited review requires (the roadmap's source correction, which the review confirms); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at §8.4, footnote (7), p. 36: the source says the level-33 Hida algebra cannot be free over Λ because its weight-2 and weight-0 eigenforms have different coefficient fields; it should be that this does not follow: ℤ₃⟦T⟧[x]/(x² − T − 9) is free, split at T = 0, with fibre ℚ₃(√3) at T = 3; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Pollack–Stevens, Overconvergent modular symbols and p-adic L-functions (Ann. Sci. ÉNS)

- **Misprint** at Theorem 2.6 / Corollary 2.7, p. 12: the source says (T⁻¹ − 1)D_∞, with the companion expression v_i|(γ_i − 1) + Σ v′_i; it should be (1 − T⁻¹)D_∞, as the Γ₀(2) relation D′₁ = {0} − {−1} fixes, the companion expression as the witness in the cited review requires; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Poonen, Rational Points on Varieties

- **Error** at Theorem 8.4.10 and Corollary 8.4.11 (author's errata, p. 4): the source says the finite-cover obstruction to strong approximation and its fundamental-group corollary are stated for every global field without properness; it should be stated with X proper in positive characteristic, since the Artin–Schreier cover u ↦ u^p − u of the affine line over F_p(t) is a counterexample; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Poonen, Rational Points on Varieties (2017)

- **Error** at Theorem 8.4.10 and Corollary 8.4.11: the source says the positive-characteristic case without assuming properness, which an Artin–Schreier example refutes; it should be assume X proper, as in the author's errata, p. 4; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Qian, arXiv:2103.00106

- **Error** at Lemma 4.2: the source says an overbroad local assertion in the Dwork-family argument; it should be as the witness in the cited review requires (consecutive labelled weights, every character conjugate checked, semistability only after a finite extension); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Ramakrishnan, A theorem on GL(n) à la Tchebotarev, arXiv:1806.08429

- **Error** at Lemma 4.1: the source says the lemma with no hypothesis at the real places; it should be stated with a real-place hypothesis, which the instance over ℚ(i) with the quaternion algebra (−1,−1) shows is needed; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Rizov, Moduli stacks of polarized K3 surfaces in mixed characteristic, arXiv math/0506120v2

- **Misprint** at §4.3, the frame construction and quotient presentation after Theorem 4.3.3, pp. 20–25: the source says a wrong size for the projective linear group in the later presentation; it should be PGL_(9d+2), matching the rank 9d+2 of the sections of L³; affects nothing. Found by  (#563 at , 2026-10-23, backfill from earlier reviews (claude opus)).

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

## Scholze, Berkovich motives, arXiv:2412.03382

- **Gap** at the almost-module/continuous K-theory input (cached extraction lines 1944–1948): the source says the open unit ball A_<1 of a commutative Banach ring with compatible roots of T is treated as a nonunital ring; it should be an explicit hypothesis (or proof) that A_<1 is closed under addition, which fails for archimedean norms (in ℂ, 3/4+3/4=3/2); affects the proof. Found by  (#175 at , 2026-10-23, backfill from earlier reviews (claude opus)).

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

## Scholze, Étale cohomology of diamonds (an earlier arXiv version)

- **Error** at Proposition 22.3(vii): the source says (vii) holds without the local splitting condition on g; it should be stated with that condition, since counterexamples exist (footnote 5, p. 128 of the later version); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Scholze, Étale cohomology of diamonds (arXiv:1709.07343)

- **Error** at Proposition 13.12 and its proof, pp. 80–81: the source says it holds for quasicompact separated diamonds, applying Proposition 13.11, which assumes qcqs, though separated does not imply quasiseparated (Remark 10.8); it should be stated for qcqs separated diamonds; a Frobenius-twisted dense-orbit quotient that is not quasiseparated breaks the Hausdorff and fibre conclusions; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

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

## Silliman, Group Ring Valued Hilbert Modular Forms

- **Misprint** at Theorem 8.10 (level-one Hasse lift): the source says suitable lifts exist for all sufficiently large weights; it should be require weights that are multiples of (p−1)p^{N₀}, N₀ depending on the precision, as Dasgupta–Kakde Theorem 8.8 states (p=5, precision 2, weight ≡4 mod 20 is excluded); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Skinner–Wiles (Publ. IHES 1999)

- **Misprint** at the definition of the auxiliary form f₀ (§3, before Proposition 3.23): the source says f₀ = Lg − E₀, which reduces to −E₀; it should be f₀ = E₀ − Lg, giving the stated congruence F₁ ≡ E₁; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Skinner–Wiles, Residually reducible representations and modular forms (1999)

- **Error** at Proposition 3.23, printed p.55: the source says T(ℓ)⊗[n] and S(ℓ)⊗[n] map by rules that force two different images of 1⊗[n]; it should be send S(ℓ)⊗[n] ↦ S(ℓ)Θ(Frob_ℓ)⁻¹Φ(n), defining the map factor by factor; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Error** at printed p.76: the source says an auxiliary cyclic field of sufficiently divisible degree, inert at every prime other than p, can be chosen; it should be impose only local conditions, since no cyclic degree-8 extension of Q has 2 inert (Grunwald–Wang); affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Skinner–Wiles, Residually reducible representations and modular forms (Publ. IHES 1999),

- **Misprint** at Proposition 3.23: the source says mutually incompatible formulas for the twisted mixed-tensor Hecke action; it should be a factorwise algebra map sending 1⊗[n] to Φ(n), twisting traces linearly, determinants quadratically, and central terms once; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Soulé, Groupes arithmétiques et K-théorie des anneaux d'entiers de corps de nombres, 1978 thesis (author's transcription)

- **Misprint** at Proposition 2.2.3.3, p.49: the source says the mixed-product coefficient contains the factorial (1−i)!; it should be (i−1)!, matching Proposition 2.2.2.3 (both agree at i=1); affects a stated result. Found by  (#160 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Spencer

- **Misprint** at Definition 1.1 and the following categorical claim, printed pp. 3–4 (Spencer line 105; Spencer line 126): the source says maximal-propagation diagrams are monic for m≤n and epic for m≥n; it should be reverse the inequalities: monic for n≤m, epic for m≤n; the simple cap is epic, consistently with the notation on p. 5; affects a stated result. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Definition 1.1, propagation paragraph, printed p. 3 (Spencer line 104): the source says maximal propagation is the larger of n and m; it should be use min(n,m); the pictured (3,5)-diagram has three through strands; affects a stated result. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Definition 1.2, printed p. 3 (Spencer line 112): the source says the diagram category with objects the natural numbers is abelian; it should be say R-linear or preadditive; over a nonzero ring every object has a nonzero identity, so this category has no zero object; affects a stated result. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Misprint** at Lemma 1.5 proof, printed p. 5 (Spencer line 175): the source says the ith closing-site label being at least i characterizes the standard-tableau condition; it should be require at least 2i; otherwise closing sites {2,3} pass the printed test but give a nonstandard two-row tableau; affects the proof. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Misprint** at equation (1.3), printed p. 5 (Spencer line 182): the source says module duals consist of TLₙ-linear maps M→R; it should be use Hom_R(M,R), with the displayed action twisted by ι; module-linear maps generally form a smaller space and do not define this duality; affects a stated result. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).
- **Misprint** at equation (2.5), printed p. 6 (Spencer line 236): the source says the δ-parameter for the second quantum integer is [ℓ+2]−[ℓ]; it should be use [ℓ+1]−[ℓ−1]=q^ℓ+q^−ℓ; with m=2, ℓ=1 the printed identity incorrectly equates δ and δ²−2; affects a stated result. Found by TemperleyLieb (ERRATA-TemperleyLieb at f3fd371, 2026-10-23, codex gpt-6-astra).

## Stein, Modular Forms: A Computational Approach (2007)

- **Misprint** at the formula for Δ near Theorem 9.18, pp. 171–172: the source says Δ with a sign typo; it should be the correctly signed expression in E₄ and E₆ normalized to constant term 1; affects nothing. Found by  (#131 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Stein–Wuthrich, Algorithms for the arithmetic of elliptic curves using Iwasawa theory, Math. Comp. (2013)

- **Misprint** at §4.2, split multiplicative case: the source says that when ω_E pulls back to C·du/u, Katz's value E₂(E,ω_E) is C² times 1−24Σσ(n)qⁿ; it should be C⁻², since E₂ has weight two and ω↦Cω scales it by C⁻² (C=2 gives 1/4, not 4); affects a stated result. Found by  (#165 at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at §4.2, split multiplicative case: the source says when ω_E pulls back to C·du/u, Katz's value E₂(E,ω_E) is C² times 1−24Σσ(n)qⁿ; it should be C⁻², since E₂ has weight two and ω↦Cω scales it by C⁻² (C=2 gives 1/4, not 4); affects a stated result. Found by  (#165 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Sternberg, Lie algebras (lecture notes, 2004)

- **Misprint** at §7.9, pp. 131–133 (contraction Λ^j→Λ^(j−2) for the symplectic Cartan product): the source says a binomial coefficient with lower index 2j−2; it should be j−2, which gives the correct dimensions (C(2n,2)−1 for the second fundamental representation); affects nothing. Found by  (#130 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Sun, A generalization of Gauss–Kuzmin–Lévy theorem, arXiv:1705.02921v2

- **Error** at proof of Theorem 2, pp.3–6: the source says a signed derivative contribution of the transfer branches serves as if it were an absolute bound; it should be a bound by absolute coefficients (at a=2, x=1 the branch derivative is −1/72); affects the proof. Found by  (#172 at , 2026-10-23, backfill from earlier reviews (claude opus)).

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

## Wiese, arXiv:1809.04645v1

- **Misprint** at Proposition 4.16: the source says dim H⁰(⟨τ⟩, M) = μ/3; it should be as the witness in the cited review requires (the roadmap's correction, which the review says stands); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Wiese, arXiv:1809.04645v1 (title not given in the reviews)

- **Misprint** at Proposition 4.16: the source says ν_∞; it should be as the witness in the cited review requires (the roadmap's correction, which the review says stands); affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Wood, arXiv:1702.04644

- **Misprint** at Definition 3.12: the source says the full tame fundamental group is free pro-prime-to-p; it should be that only its maximal prime-to-p quotient is free pro-prime-to-p; affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Wu, lecture notes on heights (diop-08)

- **Misprint** at Lemma 2.5, p. 4: the source says the height is independent of the chosen coordinates; it should be independent of the number field chosen to contain the point, which is what the proof establishes; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Yuan–Zhang (Ann. of Math. 187, 2018)

- **Misprint** at the sentence after Proposition 5.4, before Corollary 5.5: the source says the determinant lattice lies in ω^{−2}; it should be ω², as Theorem 4.10 forces; affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at §3.1, p. 552, the special case: the source says the reflex field F′ equals E; it should be so only when [F:ℚ] > 1, while F′ = ℚ in degree one; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Yuan–Zhang, Ann. of Math. 187 (2018), no. 2

- **Misprint** at the sentence before Corollary 5.5, p. 576: the source says the determinant line in ω^{−2}; it should be ω², matching the source's own Theorem 4.10 (pp. 569–570); affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Zagier, Ramanujan's mock theta functions and their applications, 2009

- **Misprint** at Theorem 7.1 and its proof (rank-to-Lerch display, cached lines 947–948): the source says a Lerch-sum expression for the rank generating function at a root of unity that fails numerical checks; it should be the version with corrected signs and q^(−1/6): −η(3τ)³/(η(τ)ϑ(3α;3τ)) + q^(−1/6)[ξ⁻¹μ̂(3α,−τ) − ξμ̂(3α,τ)]; affects a stated result. Found by  (#540 at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Zhu (title not given in the review)

- **Misprint** at the appendix (no finer locator): the source says the appendix uses an inconsistent normalization; it should be as the witness in the cited review requires; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Zureick-Brown, arXiv:1204.5246v4

- **Error** at the proof of Theorem 1.1(i), Step 3, pp. 22–24: the source says finite flat maps are locally monogenic, which fails for a rank-three square-zero algebra; it should be avoid that claim, reducing instead to monogenic generators together with finite normalizations; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Zureick-Brown, Cohomological descent on the overconvergent site, arXiv:1204.5246

- **Error** at Lemma 5.14 (the argument is used twice): the source says the proof infers equality of tubes from surjectivity of a map of schemes, which does not give the tube isomorphism Lemma 5.2 needs (flagged by Le Stum, arXiv:2209.07875, §7); it should be replaced by Le Stum's dimension induction (§7.2, Lemmas 7.6–7.7, Corollary 7.9), separating strict transform from full inverse image; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Česnavičius, arXiv:1810.04493v2

- **Misprint** at (3.14.10), pp. 15–16: the source says r_aT − r_b; it should be as the witness in the cited review requires; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Proposition 3.11(iii), pp. 12–13: the source says r_{s'}; it should be r'_{s'}; affects a stated result. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at Remark 3.9, p. 12: the source says an earlier index where a later one is meant; it should be as the witness in the cited review requires; affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
- **Misprint** at the ideal I_s on p. 15 (argument for Theorem 3.14): the source says I_s carries the factor (r₁,…,r_s); it should be as the witness in the cited review requires; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Česnavičius, Macaulayfication of Noetherian schemes, arXiv:1810.04493v2

- **Misprint** at §1.14: the source says something about the support that the review calls an "off-support" slip; it should be as the witness in the cited review requires; affects nothing. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Česnavičius–Koshikawa, arXiv:1710.06145v3,

- **Error** at Proposition 5.39, p. 55: the source says the full augmentation kernel has divided powers and is topologically nilpotent, which the point case refutes (every power of T survives mod p); it should be use the extended chart ideal I·D_m; affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).

## Česnavičius–Koshikawa, The A_inf-cohomology in the semistable case, arXiv:1710.06145v3

- **Error** at Proposition 5.39, p.55: the source says the full augmentation ideal of a finite divided-power approximant has divided powers and is topologically nilpotent; it should be use the extended chart ideal I·D^(m) (for p=m=2 on O_C, T=ξ²/2 has all powers nonzero mod 2); affects the proof. Found by  (? at , 2026-10-23, backfill from earlier reviews (claude opus)).
