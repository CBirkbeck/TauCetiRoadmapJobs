# Review of GeometryOfNumbersAndQuadraticArithmetic (pull request #3027 at 0b5086d)

**Verdict:** needs changes

**Summary.** A review of the change against `main`: 303 changed lines since `aecb53a`. I checked every added or changed section (2.2.6, 2.4.7–2.4.8, 2.5.7, 2.7.4–2.7.7, the §2.9 additions, Layer 2a, 3.2.8–3.2.9): the mathematics holds, every Check was recomputed, the claimed point counts were reproduced by enumeration, and the locators into Kirschmer 2016, Voight's *Quaternion algebras*, the Stacks Project and Jacobson 1940 were read at the cited places. One finding blocks: the README names Lean statements of Landherr's theorem (2a.1, 2a.2) that this roadmap's `Suggested.lean` does not declare, although they can be stated at the pins; they exist only in a consumer's Lean file. There are three small corrections and one format note, none blocking, and one fact for the human reviewers.

## R01 (P2) — The README names Lean statements of Landherr's theorem (2a.1, 2a.2) that this roadmap's `Suggested.lean` lacks, and the theorem can be stated at the pins

Why it matters: someone testing the new layer against this roadmap's `Suggested.lean` finds nothing for it. The two backticked names lead to a roadmap that consumes this one. So the Lean statement of the general theorem lives in a consumer, not in the roadmap that owns it.

How I know: the conventions of Layer 2a (README line 796) say "The Lean statements of 2a.1 and 2a.2 are in Gram matrices over `E ⊗[K] K_v`". Then 2a.1 (line 802) and 2a.2 (line 816) name `hermitian_congr_iff_forall_place` and `exists_hermitian_localizations_iff`. `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/Suggested.lean` is unchanged since the merge base, declares neither name, and its module docstring does not mention Layer 2a. The only declarations of these names are in `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HermitianFormsAndLattices/Suggested.lean`, lines 66 and 113. That roadmap now cites 2a.1 and 2a.2 here as "*Corollary of:*". The statement can be stated at the pins: the Gram-matrix form of 2a.1, copied into this roadmap's namespace, elaborates with `sorry` as its only warning.

Smallest change: add the two theorems to this roadmap's `Suggested.lean` under a `/-! ## Layer 2a: hermitian forms over a quadratic extension of number fields -/` comment. The statements at lines 66–80 and 113–134 of that file can be copied unchanged. Add Layer 2a to the module docstring's list of covered layers. The two names in 2a.1 and 2a.2 then name this roadmap's own declarations.

## C01 — In the proof of 2.7.6 (b), lifting a residue isometry makes the Gram matrices agree modulo 𝔓, not modulo π

In the uniqueness argument of 2.7.6 (b) (line 616), the residue form is H modulo 𝔓 = π_F O_F. A lift of a residue isometry therefore gives agreement modulo 𝔓 only. For example, the unimodular Gram matrix `[[1, π_F], [−π_F, 1]]` over a ramified F with q odd has the residue form of `diag(1, 1)`, and with the identity as lift it is not congruent to `diag(1, 1)` modulo π. The argument still goes through: the diagonal entries after Gram–Schmidt lie in `O_{F₀}`, so agreement modulo 𝔓 gives `w_i ≡ u_i mod π`, as the next clause says. Replace "congruent modulo π" by "congruent modulo 𝔓".

## C02 — 2.7.5 (a) and (b) exclude the ramified dyadic case, which the cited source covers and (d) already implies

2.7.5 (a), line 598, states the existence of Jordan splittings and (b) the invariance of the Jordan type only when F is split, unramified, or ramified with q odd. Kirschmer 2016, Theorem 3.3.3, p. 32, the locator given for (a) and (b), states both for every lattice, the ramified dyadic case included. (d) already gives existence there: group the rank-one and rank-two modular summands by scale. No consumer is affected: HermitianFormsAndLattices uses (a) only for split, unramified and nondyadic places and (d) at dyadic places. Stating (a) and (b) for every F would match the source.

## C03 — The description lists successive minima among this roadmap's additions, but the change adds none

The description says "GeometryOfNumbersAndQuadraticArithmetic (Hermitian lattices, Landherr's theorem, successive minima)". The change to this folder adds no successive-minima material. Every occurrence of the term in the added lines is in a paragraph that was rewritten but whose wording on successive minima is unchanged. It also leaves out two structural changes a reader should know of: the new Layer 2a, and §2.9 retitled with its standing hypotheses widened. Suggested text: "GeometryOfNumbersAndQuadraticArithmetic (a new Layer 2a on Landherr's theorem; hermitian spaces and lattices over local and global fields in §§2.4.7–2.4.8, 2.7.4–2.7.7 and 2.9.2–2.9.4b; lattice gluing and the index of two lattices in 2.2.6 and 2.5.7; hermitian local densities in 3.2.8–3.2.9)".

## N01 — In 3.2.9 (b), "the value of the first formula" (line 1076) does not say which formula it means

It means `q^{−n(n−1)/2}·|O(L/𝔓L)(k_{F₀})|`, not the odd-rank product written just before it. Naming the formula would remove the doubt.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 2.2.6 gluing | R = ℤ, Λ₂ = 2ℤ₍₂₎; Λ_p = pℤ₍p₎ for all p | glued lattice 2ℤ; ⋂ pℤ₍p₎ = 0, not full; dL ⊆ M ⊆ d⁻¹L checked | holds | none |
| 2.4.7 special genera | n = 0, 1, 2; E = ℚ(i) | n=1: SU trivial, special genera = classes; n=0: one genus vs uncountable U(1)(ℚ)\U(1)(𝔸_f) | holds | none |
| 2.4.7 (b), (c) vs AA.4.2 | SU(V) a form of SL_n, n ≥ 2 | simply connected, absolutely almost simple; S = ∞ or ∞ ∪ {w}, G_S noncompact | holds | none |
| 2.4.8 neighbours | split w, Λ′ in relative position (1, −1); one chain step | lengths 1 (Λ side) vs 1+1 = 2 (L_w side); Λ(x) has index N𝔓 on both sides, hence unimodular | holds | none |
| 2.5.7 index | A = R², B = R⊕π²R, C = π⁻¹R⊕πR | idx(A,B) = 2, idx(B,C) = −2, idx(A,C) = 1−1 = 0; idx(R,πR) = 1 = v(π) | holds | none |
| 2.7.4 norm, scale | ℚ₂(i) and ℚ₂(√−3) hyperbolic planes; unramified ⟨π⟩ | Tr ℤ₂[i] = 2ℤ₂; Tr ω = 1 so ℤ₂; ⟨π⟩: L^∨ = π⁻¹L, 𝔳 = πO | holds | none |
| 2.7.5 Jordan splittings | ramified q odd rank-one 𝔓-modular; ℚ₂(i) unimodular plane | H(x,x) ∈ F₀ has even 𝔓-valuation; every H(x,x) ∈ 2ℤ₂, no unit line | holds; narrower than Thm 3.3.3 | C02 |
| 2.7.6 unimodular | ℚ₃(√−3) diag(1,1), diag(1,2); split line; Gram [[1,π_F],[−π_F,1]] | residue x²+y² anisotropic, x²+2y² isotropic; split dets 1, π; last ≡ I mod 𝔓 only | holds; proof slip | C01 |
| 2.7.7 norm-maximal | ramified q odd, n odd/even, sgn ±1 vs Kirschmer Lemma 3.5.3 | L₀ rank 1/0/2 ↔ v = −(m−1)/2, −m/2, 1−m/2; ℚ₂(i) lattice: Tr(z(1+i)/2) = x−y ∈ ℤ₂ | holds | none |
| 2.9.2 determinant | ℍ; ℍ^r ⊥ ⟨a⟩; ℚ(i) line (3) | det ℍ = −1; (−1)^r a; 3 ≠ x²+y² over ℚ | holds | none |
| 2.9.3a Witt | 𝔽₄/𝔽₂; trivial involution; ℂ/ℝ skew line; ℚ(i) ⟨2⟩ | h((1,1)) = 1+1 = 0; alternating form has no orthogonal basis; 2/N(1+i) = 1; transvection isometric iff μ+μ̄ = 0 | holds | none |
| 2.9.3b Witt decomposition | ℚ(i): ⟨1,1⟩, ⟨1,−1⟩ | h(y+μx, y+μx) = h(y,y)+μ+μ̄ = 0; N(x)+N(y) = 0 forces 0 | holds | none |
| 2.9.3c Jacobson | ℂ/ℝ ⟨1,−1⟩; ℚ(i) ⟨1⟩, ⟨2⟩, ⟨3⟩ | q_h = ⟨1,1,−1,−1⟩; x²+y² ≅ 2x²+2y²; x²+y² misses 3 | holds | none |
| 2.9.4a local classification | inert ℚ₃(i); dyadic ℚ₂(i) | −1 a norm, 3 not; (3,−1)₂ = −1; normal forms ℍ^r ⊥ ⟨(−1)^r det⟩ recomputed | holds | none |
| 2.9.4b Witt index | n = 2; ℍ^r | sgn = χ(−det V); (−1)^{r(2r−1)}(−1)^r = 1 | holds | none |
| 2a head, split places | ⟨1⟩, ⟨1,1⟩ over K_v × K_v | N((a,b)) = ab = 0 forces a zero component; N((1,−1)) = −1 so ⟨1,1⟩ ≅ ℍ | holds | none |
| 2a.1 Landherr | ℚ(i): ⟨1,1⟩, ⟨1,2⟩, ⟨1,3⟩; ℚ(√−3): ⟨1,1⟩, ⟨1,2⟩ | 2 = N(1+i); 3 inert, odd valuation; (2,−3)₃ = (2,−3)₂ = −1; Lean form elaborates in a probe | holds; Lean absent | R01 |
| 2a.2 existence | ℚ(√−3), n = 2, δ₂ alone; ⟨1,2⟩ | product −1, no space; ⟨1,2⟩ has δ₂, δ₃ nontrivial, product 1; negative entries (s_w−1)+1 = s_w | holds; Lean absent | R01 |
| 2a.3 coherence | ℚ(i) ⟨1,1⟩ | (−1,−1)₂ = −1, anisotropic at 2; change ∞: product −1; change ∞ and 2: ℍ | holds | none |
| 2a.4 representations | ⟨1,1,−1⟩, ⟨1,1,1⟩, ⟨1⟩ over ℚ(i); dimension ≤ 1 | indefinite isotropic; definite at ∞ anisotropic; lines anisotropic everywhere | holds | none |
| 2a.5 subspaces | ⟨1,1,1⟩: Ee₁, E(e₁+e₂), E(e₁+e₂+e₃) | values 1, 2, 3; 2 a norm, 3 not at 3 | holds | none |
| 3.2.8 densities | ramified ⟨1⟩; unramified n = 1; ℚ₃(i), x̄y/3 | counts 6, 18, 54 = 2·3^N, β = 2; 3, 6, 12 over 2^N = 3/2; gap 2·3^{N−1}+3^{2N−1}, valuation N−1 | holds | none |
| 3.2.9 values | ℚ₃(√−3) ⟨1,1⟩, ⟨1,2⟩; ℚ₂(√−3) ⟨1,1⟩, ⟨1,2⟩; split q = 3 | enumerated 216, 17496 → 8/3; 108, 8748 → 4/3; 4608/4096 = 9/8; 48 → 3; 1152, 18432 → 9/2; 108 and 4 at level 27 | holds | none |
| 3.2.9 vs Kirschmer Thm 4.2.4 | split and inert, d = 2, dim G_i = m_i² | N = Σ s_i m_i² + 2Σ_{i<j} s_i m_i m_j = w(L); q^{−m²}#GL_m, #U_m = β⋆(m) | holds | none |
| 3.3 `finiteOrthogonalOrder` (sample, cited by 3.2.9) | q = 3, binary | O₂⁺ = 4, O₂⁻ = 8, matching 2·#SO±; 3.3 Check agrees | holds | none |
| `Suggested.lean` | elaboration at the pins | 21 `sorry` warnings, no errors; file unchanged since merge base | holds | R01 |

- Source locators read against the text: 27 in Kirschmer 2016 (Definitions 2.1.3 (5) and 2.3.3, Theorems 2.1.4, 2.4.1, 3.2.3, 3.3.3, 3.3.6, 4.2.4, 5.1.3, 5.4.14, Proposition 2.1.5, Corollaries 3.2.4, 5.1.4, 5.2.8, Algorithms 3.3.2, 3.5.5, Proposition 3.3.5, Remark 3.4.2 (3), Lemmas 3.5.2, 3.5.3, 4.2.5, Definitions 4.2.2, 5.2.1, Propositions 5.2.4, 5.2.5, 5.2.7, §10.1); 4 in Voight2026 (Theorem 9.4.9 p. 141, Lemma 9.5.3 pp. 142–143, Definition 9.6.1 and Lemma 9.6.4 p. 143); Stacks tags 02MG, 02MH, 02MI; Jacobson 1940 Theorem, (7) and case (1), p. 267; Gan–Hanke–Yu 2001 on maximal lattices.
- Tau Ceti declarations opened at the pin: `QuadraticForm.atFinitePlace` and `QuadraticForm.atRealPlace` (`NumberTheory/QuadraticForm/Global/Localization.lean`:90, 96), `TauCeti.hilbertSymbol_productFormula` (`…/Global/ProductFormula.lean`:67), `TauCeti.NumberField.QuadraticForm.exists_hilbertSymbol_eq_ite` (`…/Global/SignPrescription.lean`:154), `TauCeti.GlobalNumberFields.weakApproximation_denseRange` (`NumberTheory/NumberField/Global/Approximation/Weak.lean`:208), `localArtinEquiv` (`ClassFieldTheory/Local/Reciprocity.lean`:85), `localArtinMap_eq_frobenius_pow_valuation` and `localArtinMap_unit_of_unramified` (`ClassFieldTheory/Local/Unramified.lean`:354, 389).
- Mathlib declarations opened at the pin: `Algebra.IsQuadraticExtension` (`LinearAlgebra/Dimension/StrongRankCondition.lean`:666), `Submodule.exists_smith_normal_form_of_le` (`LinearAlgebra/FreeModule/PID.lean`:462), `Module.length` (`RingTheory/Length.lean`:31), `Matrix.det_conjTranspose` (`LinearAlgebra/Matrix/Determinant/Basic.lean`:356), `LinearMap.IsOrthoᵢ` (`LinearAlgebra/SesquilinearForm/Basic.lean`:59).
- Cross-roadmap citations resolved: GlobalQuadraticForms 4.1 item 3, 4.3, 6.1, 6.3; AdelicAlgebraicGroups AA.3.4 (*class-number-finite*) and AA.4.2 (*strong-approximation-sufficiency*); ClassFieldTheory §6.1; QuadraticFormInvariants Layer 0 (all on main); ReductiveGroups 9D.1, added by this pull request to a roadmap on main.
- Record: no layer, item or id of the README at the merge base is removed or renumbered; §2.9 keeps its id with a wider title, and no roadmap links to its old anchor.
- Dependency check: 132 roadmaps, 1478 edges, 0 problems (no UPWARD or CYCLE line). The other automatic checks pass.
- Elaboration: `Suggested.lean` has `sorry` warnings only. A probe file with the Gram-matrix form of 2a.1 in this roadmap's namespace elaborates.
- Overlap check: read HermitianFormsAndLattices, HermitianKTheoryOfPoincareCategories and SuccessiveMinima (on main), and IntegralLattices, GeneralAlgebraicKTheory, GeneralAlgebraicKTheoryPartII and StableHomotopyKTheory (open). Shared with HermitianFormsAndLattices: Landherr's, Witt's and Jacobson's theorems, the local classification, Jordan, unimodular and norm-maximal lattices, special genera, neighbours and hermitian local densities. Their owner is this roadmap (§§2.4.7–2.9.4b, Layer 2a, 3.2.8–3.2.9), and HermitianFormsAndLattices cites them as "*Corollary of:*". The others share nothing with the change.

Source independence: changed passages only. 14 passages were compared with 5 sources (Kirschmer 2016, Voight2026, Stacks Project §10.121, Jacobson 1940, Gan–Hanke–Yu 2001), and no wording is shared. The largest share is Kirschmer 2016, with 20 of 66 citations in the added text. The arrangement was compared with Kirschmer 2016, Chapters 2–5, and is independent: the new items sit in this roadmap's existing §§2.2, 2.4, 2.5, 2.7, 2.9 and 3.2 and in the new Layer 2a, not in Kirschmer's chapter order.

Research link: Layer 2a and 3.2.8–3.2.9 give Landherr's classification and the Gan–Yu local densities of hermitian lattices. These feed the mass formula for hermitian lattices (Gan–Hanke–Yu 2001; Kirschmer 2016, Theorem 4.2.3) and Kudla's coherent and incoherent collections (Kudla 1997). This rests on the README's motivation and sources, and on Kirschmer 2016 Chapter 4.

## Not verifiable

- Shimura 1964 (Annals of Mathematics; JSTOR, paywalled): Theorems 5.24, 5.27 and Proposition 4.13 were checked only as Kirschmer 2016 quotes them (Theorem 5.4.14, Lemma 3.5.2).
- Landherr 1936, Jacobowitz 1962, Kneser 1957, Hoffmann 1991, Schiemann 1998, Gan–Yu 2000, Braun 1941, Kudla 1997: publishers' pages only, not in the sources cache. Their statements were checked mathematically and through Kirschmer 2016's quotations.
- Scharlau 1985, Knus 1991, O'Meara 1963 (Springer books): cited by chapter or section, no open text.
- Hironaka 1998, Harris–Kudla–Sweet 1996, Witt 1937: not in the sources cache and not fetched. They are cited for points that were checked directly: the unramified densities, the normalisation of the sign, and Witt's theorem.

Automatic checks set aside as false positives: the check that a pull request changes nothing outside the roadmap folder under review, so that no file escapes a review, flags 116 files. All of them lie in the other roadmap folders this same pull request revises, each of which gets a review of its own, so none escapes review; no other file outside those folders changes. When a pull request revises several roadmaps, the check should accept the files in all of them.

## Source issues

- **Misprint** in Kirschmer 2016 at Corollary 5.1.4 (2), p. 74: the source says some lattice in the special genus agrees with L away from p; it should be that every class in the special genus has such a representative, as the proof shows; affects nothing.
- **Misprint** in Kirschmer 2016 at Proposition 3.3.5 (3), p. 32: the source writes the last diagonal entry with an exponent in an undefined r; it should be the rank m, as in item 1; affects nothing.
- **Misprint** in Kirschmer 2016 at Theorem 5.4.14 (2), p. 89: the source indexes the second family of representatives with j up to r; it should be up to s, the number of the γ_j; affects nothing.
- **Misprint** in Kirschmer 2016 at Theorem 2.1.4, proof, p. 13: the source evaluates the form at b₁ + λb_i through a pairing with b₂; it should be the pairing of b₁ with λb_i; affects nothing.

## For the human reviewers

- The changed text's most-cited source, Kirschmer 2016, is a Habilitationsschrift hosted on the author's page (README References). The published primary sources it quotes for these theorems (Landherr 1936, Jacobowitz 1962, Shimura 1964, Gan–Yu 2000) are paywalled and were not read.
