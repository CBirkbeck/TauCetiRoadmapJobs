<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13074#issuecomment-6782576444 -->
Review (codex) of 47d1848

Verdict: needs_changes

1. **F01** (P3) The constant constituent is not Eisenstein in rank one

   **Location:** `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:291`, second Check of §2.3: “for λ = 0 the constant functions span a constituent whose residual representation is a sum of characters, so its maximal ideal is Eisenstein”.

   **Claim:** The constant constituent is Eisenstein and not RACSDC, without a rank restriction. The surrounding section explicitly allows n = 1 (lines 290 and 293).

   **Witness:** At n = 1, λ = 0, the constant constituent has residual character 1. Its only subspaces are 0 and k, so it is absolutely irreducible and non-Eisenstein; GL₁ has no proper parabolic.

   For an admissible degree-four setting, take F⁺ = ℚ(√105,√13) and F = F⁺(√−7). The biquadratic field ℚ(√−7,√−15) has discriminant (−7)(−15)(105) = 105², so it is unramified over ℚ(√105); base change preserves this. Both −7 and −15 are squares over ℚ₂, so the CM extension splits above 2. Here nd = 4.

   Ger19 line 1114 defines non-Eisenstein by absolute irreducibility. The fourth Check at README:293 already correctly restricts the noncuspidal constant-constituent assertion to n ≥ 2. The second Check contradicts both that definition and the rank-one case of this same section.

   **Exact repair:** Insert “and n ≥ 2” in the constant-functions clause of the second Check. State the complementary rank-one control there or in the existing rank-one Check: its trivial character is non-Eisenstein and its GL₁ base change is cuspidal. Test: n = 1 has one character and no proper invariant subspace; n = 2 has the two-character sum 1 ⊕ ε⁻¹ and a proper invariant line. This repairs the Check without restricting the theorem.

2. **F02** (P3) An unramified Frobenius need not fix a Cartan subalgebra

   **Location:** `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:603`, third Check of §5.4: “every eigenvalue has ratio `1 = q_{w₀}` with itself, so `H⁰(G_{F⁺_{w₀}}, ad⁰ρ̄(1)) ⊇ 𝔱 ≠ 0`”.

   **Claim:** An unramified local representation with q ≡ 1 mod p has invariant space containing a Cartan subalgebra. Semisimplicity of its Frobenius is not assumed here.

   **Witness:** Over 𝔽₃ take q = 7, U = [[1,1],[0,1]], h = diag(U,U⁻ᵗ), X = diag(1,0,−1,0). For J = [[0,I],[-I,0]], X lies in the standard Cartan, but [h,X] = 2E₁₂ + E₄₃ ≠ 0.

   This is a continuous unramified representation of G_ℚ₇: h³ = I, hJhᵗ = J and its similitude is 1 = ε̄⁻¹. Since q = 1 in 𝔽₃, the Tate twist does not change the local invariants. A nontrivial unipotent cannot centralize a maximal torus, so changing the Cartan does not restore the claimed inclusion. The eigenvalue-ratio exclusion itself is correct; the assertion about the invariant Cartan is the erroneous extra explanation.

   **Exact repair:** Replace the Cartan inclusion by the invariant-space formula `H⁰ = ker(Ad(h) − 1)` in this unramified q ≡ 1 case. Use h = I as the simplest positive control, giving dimension 10, and retain a nonsemisimple control if explaining the general obstruction: for the h above, Z = h − h⁻¹ = 2E₁₂ + E₄₃ is nonzero, belongs to 𝔰𝔭₄ and commutes with h. Thus there are invariants, although the Cartan assertion fails. Direct matrix multiplication gives ZᵗJ + JZ = 0 and [h,Z] = 0. Keep the theorem's q ≠ 1 and eigenvalue-ratio conditions unchanged.

Two P3 findings, no P1 or P2 findings. All six findings from round 2 are repaired. The remaining changes concern two false Checks, not the headline theorem statements. The authored package files were not changed.

## Verified sound

### Previous findings, checked first

Locations below are in `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md`. Quotes identify the repaired wording; the previous review's assertions were treated as claims to test.

| Round-2 finding | Repaired passage | Assessment and computation |
| --- | --- | --- |
| R01: rank-one torsion argument | Line 339: “This permits K_tors = 0 or nonzero cyclic torsion; it does not decide which occurs.” | Repaired. Rank K = h² − 1 gives d(K) = h² − 1 or h², not automatically h². Lines 345–346 retain both places above each split v: x − x = 0 for x = 0 and for nonzero 2-torsion. The relation-space injection and (★)/(C) are explicitly additional inputs. |
| R02: unrestricted versus fixed-similitude obstruction | Line 86: “for unrestricted framed GL_n lifts, the tangent space is Z¹(F_v, ad ρ̄)” | Repaired. The full adjoint is used; fixed-similitude GSp₄ uses Lie(ker ν) = 𝔰𝔭₄ at p > 2. Line 42 computes ℤ₂⟦u,X⟧/(u²+2u), whose special fibre has u ≠ 0 and u² = 0, while ad⁰ in rank one is zero. All later uses were searched. R02 of this review concerns a separate residual Check, not this repaired criterion. |
| R03: supplier numbering | Line 69: “§§4.1 and 4.4: Taylor–Wiles data with a residual eigenspace, and the O-coefficient presentation” | Repaired. Every replacement reference was resolved against the available heads. §§0.2, 0.9, 1.3, 3.1–3.6, 3.9, 3.11, 4.1, 4.4, 4.6, 5.2, 5.4 exist. Prescribed auxiliary extensions now use the parent's §2.5 and PotentialModularityAndCompatibleSystems §2.16. No PL-style citation remains in this package. |
| R04: redundant Taylor–Wiles primes | Line 449: “for q = 6” | Repaired. For n = d = 2 and three frames, 19+5 = 5+5+14 = 24, then 19+6 = 5+6+14 = 25. Omitting h³ instead gives g = 7 and 26 > 25. The corresponding prepared example gives 32 = 32 and 33 = 33. |
| R05: residual condition at the auxiliary place | Line 443: “ρ̄ is trivial at S_2 ∪ R” | Repaired. The v₁ representation is separately unramified regular semisimple. Frob = diag(1,ω) over 𝔽₄ has polynomial (X−1)(X−ω), not (X−1)². Sho18 Theorem 2.5 supplies its dimension 5 without trivial residual data. The degree-three prepared example gives 14+14+5−2 = 31. |
| R06: extraction locator | Line 356: “Ger19 §2.7, opening discussion, p. 22” | Repaired. The same sentence cites proofs of Propositions 2.7.3–2.7.4, pp. 25–26. Ger19 lines 1003, 1113 and 1146 locate those passages; no extraction-line citation remains in the roadmap. |

The rank-two alternative now imports GlobalGaloisDeformations §§4.8–4.11 with nonsolvable image, free torus action and square-equivariant determinant explicitly retained. KW09 Lemma 9.4, p. 87, at KW09 line 4000 supports that alternative, not a general assertion about K_tors. The previously settled decision to retain §3.2(b) as a target with an unproved additional dimension input is not re-raised. The earlier settled intake/plan-detail matters are likewise not package findings.

### Principles, coverage and shape

Read all 30 numbered sections, their APIs, Checks, routes, Needs lines, conventions, scope and references. The report below concentrates on the fifteen seeded targets, seven headlines, changed passages and the two newly refuted Checks. For unchanged text, the round-2 adversarial table was used only where it records explicit computed values; its erroneous rank-one and Cartan conclusions were retested and are replaced here. The repair report's computations were not accepted as independent evidence.

The six layers follow the required mathematical dependencies: cohomology and local conditions feed ordinary Hecke theory and the global problem; those feed patching and support; the separate symplectic residual and local data feed symplectic patching. The source's order is not prescribed, no layer is named after a source chapter, and the two applications use distinct residual-image hypotheses. The base roadmap retains rank-two ordinary theory. General local deformation rings, automorphic carriers, generic commutative algebra and the imported odd-prime theory are not planned again. No good-prime-only replacement of the dyadic theory was found.

The ten definition/data blocks have API lists and at least three Checks; all six layers end in Examples and Dependencies. Main-branch roadmap shape was compared with the available ClassFieldTheory and GlobalQuadraticForms examples. There are no algorithms, copied source passages, target-numbering catalogues, machine paths, pull-request numbers, HTML anchors, sorry'd data or option overrides in the authored package. Source corrections are mathematical commentary, not instructions. The references contain all fourteen manifest works. Metadata and manifest parse as TOML. No suspicious instruction was encountered.

### Seeded source verification

All fifteen seeded targets were read at the locators below. The numbered extractions are the legal cached texts listed in the brief. Ger19's numbering is the preprint numbering explicitly selected by the package. The source errors noted below are not silently treated as proofs of corrected assertions.

| Target | Text opened, theorem/page and source lines | Result |
| --- | --- | --- |
| 1.1 Polarized deformation problems up to Ĝ_n-conjugacy | BCGP25 §5.4, pp. 121–122, lines 5444–5509; Tho17 Lemmas 2.8, 2.10–2.11, p. 7, lines 274, 291, 297–305 | Full GL₁ factor, strict equivalence, residual irreducibility and framing count match. The README corrects the inverse-frame order. |
| 1.3 Full-adjoint weak/near adequacy | BCGP25 Lemma 5.3.1 and Definitions 5.3.2–5.3.3, p. 120, lines 5390–5437 | Finite image, full matrix adjoint and trace/spanning equivalence match. Near adequacy uses H¹(ad), not H¹(ad/k). |
| 2.2 Hida theory at 2 | Ger19 Proposition 2.5.3, Corollary 2.5.4, pp. 16–17, lines 716–752; Proposition 2.6.1, p. 18, line 771; BCGP25 §5.7, pp. 131–132, lines 5940–6001 | Freeness is over Λ_b₀ with sufficiently small b₀; weight twisting, finite Hecke algebra and arithmetic control retain their hypotheses. Ger19's setup permits l = 2. |
| 3.2 Dimension | BCGP25 Lemma 5.7.7, pp. 133–134, lines 6044–6059; CHT08 Lemma 2.2.11/Corollary 2.2.12, pp. 24–25, lines 1018–1055; Corollary 2.3.5, pp. 31–32, lines 1415–1450; Tho17 Lemma 2.15, p. 10, line 432 | The obstruction count gives nd. The stronger 1+nd claim is stated in the source with a degree typo and a deficient proof; the package now isolates the additional sufficient inputs. KW09 line 4000 only supplies the scoped rank-two route. |
| 3.4 Uniform local fixed vectors | BCGP25 Lemma 5.7.12, p. 134, lines 6080–6084; local preparation Lemma 5.6.2, p. 128, lines 5794–5800 | Uniformity is over lifts of the fixed residual representation, not just the seed. The proof route uses finitely many inertial restrictions and the explicitly declared block-level contract; monodromy is forgotten. |
| 3.5 Sufficiently deep tame level | BCGP25 Definition 5.7.13, p. 134, lines 6085–6087 | The universal fixed-vector quantifier and stability on shrinking agree. |
| 4.1 Solvable preparation | BCGP25 proof of Theorem 5.7.14, pp. 135–136, lines 6113–6159; Lemma 5.6.2, p. 128, line 5794 | All six preparation conditions, preservation of residual image and the auxiliary place are retained. Uniform unipotence is added for restrictions of original lifts, not arbitrary lifts over the new field. |
| 4.3 Patched modules | BCGP25 (5.7.16)–(5.7.17), pp. 136–137, lines 6160–6200; KT17 Proposition 3.1, pp. 14–15, lines 630–656 | q = h¹_dual−1, the generator count, common reductions and free finite-level modules match. Smallness at v₁ justifies b₀ = 1. The repaired v₁ hypothesis no longer asserts residual triviality. |
| 4.4 Patched components | BCGP25 list (1)–(5), p. 137, lines 6201–6220; BCGNT25 Lemma 3.2.4, pp. 33–34, lines 1636–1669; BLGHT11 Lemma 3.3, printed pp. 21–22, lines 786–821 | Tensor-product component argument matches. Its dyadic factors use LocalGaloisDeformationRings §6.24, not an extrapolation of BCGNT25's crystalline hypotheses. |
| 4.5 Ihara avoidance support | BCGP25 proof, pp. 137–138, lines 6221–6249; Tay08 Lemma 2.3, p. 188, lines 227–235 | Maximal-depth support is a union of components; distinct-character comparison, special-fibre transfer and augmentation give the required selected quotient dimension. Nonzero support alone is not substituted for full support. |
| 4.7 Dyadic finiteness | BCGP25 Theorem 5.7.14, pp. 134–135, lines 6088–6109; final proof, p. 139, lines 6289–6292; BLGGT14 Lemma 1.2.3, pp. 16–17, lines 676–710 | Hypotheses and finite-restriction route match, with absolute irreducibility preserved. This proof uses prepared component quotients and the residual-fibre criterion, not the unsupported inference in 3.2(b). |
| 5.2 GSp₄-reasonableness | WHI22 Definitions 3.15 and 3.19, pp. 21–24, lines 985–999 and 1064–1068; Lemmas 3.16/3.20, lines 1001–1005 and 1073–1077 | H⁰ vanishing, semisimple centre-of-Levi detection, cyclotomic image condition and conditional H¹ hypothesis match. No regular-semisimple restriction is introduced. |
| 5.3 Taylor–Wiles places | WHI22 Proposition 3.18 and proof, pp. 22–23, lines 1013–1061 | The roadmap explicitly adds H⁰ = 0 needed by Lemma 3.16, present in reasonableness but omitted in the printed proposition. The general semisimple local problem remains a declared supplier contract. |
| 6.1 Dominance over local weight space | BCGP25 Lemma 6.2.6, pp. 145–146, lines 6596–6605; proof of Theorem 6.3.4, p. 148, lines 6697–6710 | Dominance comes from the global finite torsion-free Hecke component. The local theorem assumes dominance and then supplies its special-fibre component; there is no circular deduction of dominance from that local statement. |
| 6.4 Symplectic finiteness | BCGP25 Theorem 6.3.4, p. 148, lines 6694–6696, and proof through line 6746 | Complete Noetherian hypotheses, finite Hecke quotient and nilpotent kernel are sufficient. Selected components and seed hypotheses remain those of §§5.4–5.6/6.3. |

Additional repaired/source-dependent passages read include Ger19 §2.7, pp. 22, 25–26 (lines 1003, 1113, 1146); Sho18 Theorem 2.5 (lines 305–306) versus its l > 2 Theorem 4.6 (line 801); BCGP21 Proposition 7.4.2, p. 381 (lines 8923–8926); BCGP25 Theorem 1.8.17 (line 641), Hypothesis 6.3.1 (lines 6628–6644), auxiliary-place and selected-problem paragraphs (lines 6660–6690); and Tho12 Theorem 8.6/proof (lines 2084–2125), whose odd-prime/adequacy setting is not silently asserted at 2.

### Adversarial computations

These are tests of statements and proof inputs, not substitutes for proofs. “Retained” identifies explicit numerical evidence from the earlier independent review for unchanged text; the seeded targets and changed claims were checked again. Parameters n = d = 2 test the dimension formulas; they are not claimed to satisfy the large local-degree preparation hypothesis. The separate d = 6 examples do satisfy that inequality.

| Statement | Instance | Computed values on the two sides | Result / change |
| --- | --- | --- | --- |
| Conventions: Frobenius | p = 7, q = 2 | Geometric ε = 2⁻¹ = 4; arithmetic ε = 2 | Correct inverse convention. |
| Conventions: full adjoint | Trivial rank-one character over ℚ₃, O = ℤ₂ | dim ad = 1, dim ad⁰ = 0; dim H²(ad) = 1; special fibre u² = 0 with u ≠ 0 | The repaired criterion excludes false smoothness. |
| 1.1: frames and scalars | n = 4, three frames; empty frame set | 17·3−1 = 50 versus 16·3−1 = 47; empty set gives 0 variables | Full Ĝ_n, with empty case separate. |
| 1.1: nonsquare units | 𝔽₂[t]/t² | (x+yt)² = x²; 1+t is not a square | GL₁ factor cannot be removed at 2. |
| 1.1: frame direction | 𝔽₂[t]/t³, g = diag(1+t,1), r the swap matrix | Inverse-frame representative stays r; wrong convention gives g²rg⁻² = (1+t²)r ≠ r | README corrects the source. |
| 1.2: presentation headline | n = d = 2, three frames, q = 5, h² = h³ = 1 | χ = −5; h¹ = 1−1+5 = 5 = g; suppressing h³ gives 6 | Correct degree-three term. |
| 1.2: real obstruction | B = I₂ versus alternating Ψ₂ | Y+Yᵗ has zero diagonal; I₂ is not in its image. For Ψ₂, Y = diag(1,0) gives the scalar norm I₂ | Real hypothesis distinguishes the cases. |
| 1.3: both adequacy directions | H = 1, n = 1 and 2 | n = 1: U = 0 and span dimension 1 = dim End. n = 2: U has dimension 3 and scalar span dimension 1 < 4 | Both sides agree; positive rank retained. |
| 1.3: nonabelian control | H = GL₂(𝔽₂) ≅ S₃ | Semisimple elements I,A,A² span 𝔽₄, dimension 2 < 4; trace-annihilator dimension 2 | Irreducibility alone is insufficient. |
| 1.3: full adjoint versus quotient | A₅ four-dimensional example, retained | H¹(k) = H¹(ad) = 0; dim H¹(ad/k) = 1 | Near and GHT adequacy remain distinct. |
| 1.4: cyclotomic and scalar inputs | √2 absent, then F⁺ = ℚ(√2); n = 2 | Least m = 3, then 4; scalar trace 2 = 0 in k. At a redundant split prime ψ_v = 0 | Final scalar class survives; redundant primes are permitted. |
| 2.1: operators and coefficients | n = 1,2; λ = (1,0) | Twists 1 and u₂⁻¹; polynomial X²−T¹X+qT²; normalization factors 1 and ϖ. Unit/nonunit limits 1^(r!) → 1 and 2^(r!) → 0 | Normalizations separate plausible inverses and the wrong ordinary projector. |
| 2.2: freeness and torsion | Four sign coordinates | Λ has rank 16 over O⟦w₁,…,w₄⟧ and dimension 5; (1−z)(1+z) = 0 | Torsion coefficient algebra is retained. |
| 2.2: smallness | Central −I in all tame levels versus torsion-free v₁ | Nonzero [−I]−ε₀ acts by ε₀−ε₀ = 0 in the first case; torsion-free v₁ excludes −I | Freeness needs sufficiently small b₀; later b₀ = 1 is justified. |
| 2.2: weights | λ = 0 and (1,0) | Weight-change factors 1 and τ(u₂); four exponent parities give all 16 sign characters | Arithmetic density must meet all components. |
| 2.3: constant constituent | n = 1 and n = 2, λ = 0 | One character has no proper nonzero subspace; 1 ⊕ ε⁻¹ has an invariant line | R01: add n ≥ 2 only to the Eisenstein clause. |
| 2.3: dual and inertial normalization | Rank one; χ₁ = χ₂ = 1 in rank two | rᶜ = r⁻¹; ∏(X−χⱼ⁻¹) = (X−1)² | Correct conventions, retained. |
| 3.1: global problem | R empty; n = 3,4 at c_v | Zero tame-character conditions; multipliers (−1)⁻²(−1) = −1 and (−1)⁻³ = −1 | No loss of ordinary conditions at 2. |
| 3.1: restriction | Identity extension, then local degree e | Norm sends u to u in degree 1 and a to aᵉ for base scalars in degree e | Ring arrow goes from extended-field ring to original ring. |
| 3.2(a): obstruction lower bound | n = d = 2, three frames | 19−1−14 = 4 = nd, not 5 | Correct repaired arithmetic. |
| 3.2(b): stronger headline | Same parameters | Required 1+nd = 5; printed 1+n[F:ℚ] = 9 | Degree correction necessary; (a) alone is not proof of (b). |
| 3.2: rank-one relations | K torsion-free, then with cyclic nonzero torsion | rank K = h²−1; d(K) = h²−1, then h² | Both alternatives explicitly allowed. |
| 3.2: reciprocity | Chosen-half image x = 0 or nonzero of order 2 | x+cx = x−x = 0 in both cases; local ℚ₂ character sends −1 to −1 | No inference that chosen-half tuple lies in K. |
| 3.2: torsion relation | O[C₂], generator z | (z−1)(z+1) = 0; z−1 specializes to 0 on z=1 and −2 on z=−1 | Conditional relation mechanism is meaningful; not automatically available globally. |
| 3.2: condition (C) | P = O⟦x⟧[z]/(z²−1,(z+1)x), retained | z=1 quotient is O⟦x⟧/(2x), with a vertical k⟦x⟧ component; quotient by z−1 retains it | Equal special fibres do not by themselves prove flatness; (C) is an additional input. |
| 3.2: determinant and alternative | x = (g,a)j; one free torus coordinate | ν(det x) = −aⁿ versus ν(x)ⁿ = (−1)ⁿaⁿ; square map y = 2x+x² has finite degree 2 | δ^(n+1) correct; free-action hypothesis cannot be discarded. |
| 3.3: seed fixed vectors | Residually ramified local representation, spherical level | Matching unramified lift would reduce to trivial inertia, contradicting nontrivial residual inertia; compatible spherical eigensystems = 0 | Explicit seed fixed-vector hypothesis excludes this case. |
| 3.4: inertial support | Trivial and Steinberg GL₂ representations | N = 0 and N ≠ 0, but inertial support is [T,1] for both | Block contract correctly forgets monodromy. |
| 3.4–3.5: uniform depth | K = ℚ₅, order-four tame character reducing to 1 | Seed conductor 0, tame lift conductor 1; invariants under O_K× have dimension 0, under 1+5O_K dimension 1 | Seed conductor is not a uniform bound; shrinking level is the correct direction. |
| 4.1: preparation | n = 2, local degree 1 or 3 | Threshold n(n−1)/2+1 = 2; 1 > 2 false, 3 > 2 true | Prepared example uses degree 3. |
| 4.1: restriction of lifts | Tame order-four ψ reducing to 1 | (X−i)(X−1) ≠ (X−1)²; after killing ψ by extension, both factors become X−1 | Uniformity concerns original lifts after restriction. |
| 4.2: empty variables and depth | q = j = 0; R = S⟦y⟧, H = S | S_N = S_∞ = Λ; depth_R H = dim S < dim R = dim S+1 | Empty-variable case works; wrong maximal-depth model excluded. |
| 4.3: redundant primes | q = 5 then 6, n = d = 2 | 19+5 = 5+5+14 = 24; 19+6 = 5+6+14 = 25; wrong h³ gives 26 > 25 | Repaired Check holds. |
| 4.3: auxiliary factor | diag(1,ω) over 𝔽₄ | Constant coefficient ω ≠ 1 of (X−1)(X−ω), versus 1 for (X−1)²; local dimension 5 | Regular semisimple does not mean trivial residual. |
| 4.3: admissible prepared data | n = 2, two dyadic degrees 3, three frames | Local dimensions 14,14,5; tensor dimension 31; g = 1 then 2; 31+1 = 13+5+14 = 32, then 33 = 33 | Meets preparation and confirms the patched formula. |
| 4.4: component products | One tame place, two unipotent components, one distinct-character component; s auxiliary components | Counts 2s versus s; empty R gives s versus s | Only the intended tame factors change; local dyadic supplier hypotheses retained. |
| 4.5: support and augmentation | Prepared dimension 32, augmentation length 19 | 32−(5+14) = 13 = dim Λ; support intersection C_X ∩ V(a∞) on both sides | Required dimension comes from patching; no circular use of unprepared 3.2(b). |
| 4.6: auxiliary removal | R empty | Corrected T′ has #S₂(L⁺)+1 places, rather than 1; ordinary factors number #S₂(L⁺), rather than 0 | Dyadic places retained. |
| 4.7: finite restriction route | Restricted order-four tame lift; complete finite test algebra | Inertia becomes identity after the chosen extension; Λ[t]/t² has basis 1,t and residual dimension 2 | Preparation and finite-residual-fibre argument retain their actual hypotheses. |
| 4.8: reduced R=T headline | dim Λ = 5; hypothetical vertical quotient | dim Λ/(ϖ) = 4 and characteristic-zero point set empty; bound (b) requires dimension ≥5 | Stronger bound is used explicitly, not silently inferred from (a). |
| 5.1: adjoints and frames | One frame and three frames | dim gsp₄ = 11, dim sp₄ = 10; frame counts 10 and 32, versus GL₄ count 47 for three | Fixed multiplier is separated from conjugating group. |
| 5.2: reasonableness | Torus image; p = 3 versus 2 | Invariant Cartan dimension 2 > 0; trace pairing 2(xx′+yy′) evaluates to 2 mod3, 0 mod2 | H⁰ clause and odd-prime boundary discriminate. |
| 5.3: semisimple TW headline | h = 1; q = 4 places and t = 7 factors | M = GSp₄, N = Lie Z(GSp₄) ∩ sp₄ = 0, so detection rank 0; 7 ≤ 2·4 but 7 ≠ 4 | Nonregular semisimple case allowed; number of factors is not number of places. |
| 5.4: q congruence | p = 3, q = 19 or 7 | 19 mod9 = 1; 7 mod9 = 7 although both are 1 mod3 | Stronger tame congruence retained. |
| 5.4: Cartan counterexample | q = 7, h and X from R02 | h³ = I, hJhᵗ = J; XᵗJ+JX = 0; [h,X] = 2E₁₂+E₄₃ ≠ 0 | R02: claimed Cartan inclusion fails. |
| 5.4: repaired invariant witness | Z = h−h⁻¹ | Z = 2E₁₂+E₄₃ ≠ 0; ZᵗJ+JZ = 0; [h,Z] = 0. For h=I, invariant dimension = 10 | Proposed replacement passes the same counterexample. |
| 5.5: selected component | R = O⟦x,y⟧/(xy), seed (ϖ,0) | y=0 contains the seed; x=0 does not, since ϖ ≠ 0 | The marked component is substantive. |
| 5.6: weight boundary | Large regular l_v > 2 versus l_v = 2 | First satisfies l_v > 2; parallel weight 2 does not | Separate Galois supplier contract retains the boundary. |
| 6.1: local dominance dimension | One split p-adic place | dim Λ_v = 3; 1+16 = 3+14 = 17 | Relative O and Λ dimensions agree. |
| 6.2: symplectic patching | d = 1, #S = 3, t = 7 | g = 7−4+3−1 = 5; 5+30+4 = 7+33−1 = 39 | Equal relative dimensions, total dimension 42 over a dimension-3 Λ. |
| 6.3: component-support headline | R = O⟦x⟧/(x(x−ϖ)), retained | Two horizontal components, one common special point; support only on x=0 misses x=ϖ | Nonzero support insufficient. Package uses the stronger unique special-fibre component. |
| 6.4: nilpotent finite algebra | Λ[ε]/ε² → Λ | Kernel square 0; module ranks 2 and 1; residual lengths 2 and 1 | Nilpotents compatible with finiteness; complete Noetherian hypotheses retained. |

Zero rings and rank zero are outside the CNL residue-field and positive-rank hypotheses; equal-characteristic coefficient fields do not replace the specified mixed-characteristic O. Artinian characteristic-p and nonreduced tests do occur in the stated deformation functors and were used above. No inversion of n or of 2 is used in the full-adjoint trace pairing. The p > 2 condition remains explicit where the symplectic trace pairing requires it. Finite sets of framed and ramified places, local finite generation and complete Noetherian coefficients are carried throughout the patching arguments.

### Pinned libraries, headline coverage and Lean

Checked the manifest pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Opened all eight declarations cited by the package, not merely their names:

| Declaration | Pinned file and line | Definition boundary checked |
| --- | --- | --- |
| Matrix.trace | Mathlib/LinearAlgebra/Matrix/Trace.lean:43 | Finite sum of diagonal entries. |
| Matrix.trace_one | Mathlib/LinearAlgebra/Matrix/Trace.lean:144 | Cardinality cast; can vanish when the characteristic divides rank. |
| Module.End.IsSemisimple | Mathlib/LinearAlgebra/Semisimple.lean:56 | Semisimple induced polynomial-module structure, with no invertibility condition. |
| Submodule.span | Mathlib/LinearAlgebra/Span/Defs.lean:46 | Infimum of submodules containing the set. |
| Matrix.symplecticGroup | Mathlib/LinearAlgebra/SymplecticGroup.lean:102 | Submonoid cut out by AJAᵗ = J; no arbitrary similitude multiplier. |
| LieAlgebra.Symplectic.sp | Mathlib/Algebra/Lie/Classical.lean:157 | Skew-adjoint matrix Lie subalgebra. |
| groupCohomology | Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean:183 | Cohomology of an ordinary group representation, not a continuous Galois Selmer complex with local conditions. |
| TauCeti.completedGroupAlgebra | TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145 | Compatible finite-quotient group-algebra families; its coefficient ring argument does not itself assert completeness or a coefficient topology. |

Object searches in both pinned libraries for deformation rings, Hida theory, automorphic representations, adequacy and Selmer constructions found no carriers making these seven headlines statable. Discrete group cohomology and unrelated arithmetic Selmer constructions are not the required local-condition deformation theory. The native weight algebra alone does not define a universal ordinary deformation ring or Hecke algebra.

| Headline in README | Suggested.lean coverage | Missing carrier at the pins |
| --- | --- | --- |
| 1.2(4), dyadic Taylor–Wiles presentation | Module docstring, final headline bullet | Global Galois/local-condition Selmer data and the deformation rings being presented. |
| 3.2(b), dimension ≥1+nd | Module docstring, third bullet | Actual ordinary polarized universal deformation ring. |
| 4.7, dyadic finiteness | First bullet | Ordinary polarized deformation ring and ordinary RACSDC seed carrier. |
| 4.8, dyadic reduced R=T | Second bullet | Those carriers plus definite-unitary algebraic modular forms and their universal ordinary Hecke algebra. |
| 5.3, reasonable symplectic TW places | Final bullet | Arithmetic dual Selmer local conditions and corresponding deformation problem. |
| 6.3, symplectic reduced R=T | Fourth bullet | GSp₄ automorphic/Galois objects, flag-image deformation rings and Hilbert–Siegel Hida–Hecke module. |
| 6.4, selected symplectic finiteness | Fourth bullet | The same selected ring and Hecke objects. |

`Suggested.lean` has 42 lines, one `import Mathlib`, one module docstring and an empty namespace. There are zero theorem declarations, zero definitions and zero admitted examples. Consequently the exhaustive one-tactic probe and declaration-binder audit each have zero cases; there is no theorem to replace by simp/rfl/infer_instance/a single existing lemma, and no `#check @name` command to generate. No headline has been replaced by free predicates or algebra on arbitrary variables. Backticked mathematical notation in the README is not presented as a new Lean identifier; all actual external identifiers resolve to the declarations above. There is no fully qualified declaration to collide with a sibling package.

Ran the prescribed `lake env lean` elaboration of `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/Suggested.lean` from the pinned content checkout: exit 0, no output and no warnings. No TauCeti module build was needed. No option overrides or dependency updates were used.

### Supplier resolution, duplication and ordering

The supplied board-package index was read before making ownership assertions. Available open heads were searched with the roadmap object's grep/show tools, not by proposed theorem names alone. All cited supplier sections were opened. The following ledger records the resolved owners; line numbers refer to their README files under `TauCetiRoadmap/<Name>/README.md` at the supplied current heads. The packages in the board index supply no competing ordinary-deformation construction.

| Supplier | Resolved sections / representative lines | Ownership boundary |
| --- | --- | --- |
| PotentialAutomorphyInfrastructurePartII, #2135 | §§0.2:366, 0.9:490, 1.3:598, 3.1:732, 3.2:760, 3.5:814, 3.6:834, 3.9:892, 3.11:939, 4.1:1041, 4.4:1110, 4.6:1138, and §§5.2,5.4 | Ordinary Hecke/constituent theory has l odd; the p=2 presentation has O coefficients. This package adds dyadic Λ-coefficient theory. All cited §§3.1–3.6 headings were checked, not just endpoints. |
| ArithmeticGaloisRepresentations, #856 | §§7.4:4649, 7.5:4827, 7.9:5242, 7.11:5397 | Owns 𝒢_n, GSp₄, existing adequacy and vast/tidy/enormous notions. This package's full-adjoint variant and reasonableness are distinguished. |
| AutomorphicFormsOnReductiveGroups, #1037 | §§7.4:1218, 7.5:1245 | Owns general algebraic modular forms, weighted Hecke operations and small-level realization. Layer 2 specializes coefficients and level. |
| LocalGaloisDeformationRings, #923 | §§1.3:1308, 1.4:1333, 1.9:1406, 1.17:1508, F.2.6:745, 2.17:1944, 2.22:2034, 2.23:2048, 2.24:2072, 2.29:2204, 6.24:3324, 6.27:3354, 6.29:3411, 6.31:3504, 6.35:3574 | Owns local deformation theory. General dyadic flag dimension and semisimple GSp₄ TW problems remain explicit extensions requested by gaps; existing restricted local statements are not overclaimed. |
| GlobalGaloisDeformations, #920 | §§3.3:405, 4.2:712, 4.8:888, 4.9:925, 4.10:953, 4.11:996, 8.1:1877, 8.2:1939, 8.3:1963, 8.4:1995 | Polarized O-coefficient theory assumes p odd; determinant torsors require free twisting action. Neither generic construction is owned again here. |
| DeformationAndDerivedPatchingAlgebra, #1034 | §§1.12:281, 4.1:898, 4.2:914, 4.6:990, 5.2:1049, 5.3:1062, 5.4:1082, 5.5:1097, 6.1:1223, 6.3:1258, 6.5:1283, 6.7:1302, 8.2:1605, 8.3:1626, 8.4:1646, 8.5:1672, 9.6:1865 | Generic algebra imported. Regular-base and p≥3 balanced-patching restrictions are not asserted for the torsion dyadic base. |
| AutomorphicGaloisRepresentationsPartII, #1006 | AG2.2:1285, AG2.3:1364, AG2.5 full compatibility:1857 and temperedness:2012; GSp₄ construction:536 | All-prime GL_n realization imported; available GSp₄ construction is over ℚ, so the totally real/weight-two extension is declared. |
| PotentialAutomorphyInfrastructure, #1081 | §§2.5:841, 3.44:1778, 3.47:1837 | Auxiliary CM extensions, ordinarity and soluble base change. |
| PotentialModularityAndCompatibleSystems | §2.16:815 | Prescribed finite Galois completions with avoidance; degree allowed to increase. |
| SmoothRepresentationsOfLocalGroups, #1688 | SR.3.2:2710; cuspidal generator:2744 | Inertial blocks and cuspidal generators imported; uniform levels for every irreducible in an arbitrary block and the LLC comparison remain the exact gap. |
| ModularityAndLanglandsExtensions, #1180 | §3.9:1882 | Discrete GSp₄ representations and general type. |
| AutomorphicBundles, #1069 | Layer 12:4505; §§12.11:4928, 12.12:4981, 12.13:5010 | Geometric Hecke theory imported; specific Hilbert–Siegel ordinary modules, coinvariants and classicality are gaps. Former B5 numbering is mapped. |
| EndoscopicTransferAndUnitaryTraceComparison, #999 | §13.2:5070 | Scope defers solvable GSp₄ descent here; this package does not construct it again. |

Compared the five closest open roadmaps in the overlaps report. In #1817, `TauCetiRoadmap/GSp4NonregularModularityLifting/README.md:173`, :177 and :179 explicitly consume this package's dyadic and symplectic inputs, including reasonableness; they are not reverse supplier edges. In #1746, `TauCetiRoadmap/AbelianSurfacesModularity/README.md:384`, :504 and :522 give special finite-image verifications and applications, not a second general reasonable-image lifting theorem. The separately settled intake issue is not reopened. #1824 AutomorphyLiftingBeyondTaylorWiles owns a different arithmetic-cohomology/derived-patching application. #2135 and #1081 supply the specific interfaces above. The base OrdinaryAutomorphicFormsAndModularityLifting retains its rank-two scope. No new ownership move is required.

The overlap inventory contains no conflicting open revision, dropped cited id, id defined only by an unnamed revision, or shared edited roadmap for this package. No package id was renumbered by the repair. All Needs lines and supplier citations were checked for upward edges and cycles. The required dependency command completed with exit 0 and exactly:

```text
depcheck: 236 roadmaps, 2145 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The merge-order file was not changed.

### Declared supplier contracts

All seven slugs occur both in `design/plan.json` and under the README's Exact supplier contracts, with the same owner and mathematical need. None has supplier `none`. Their interfaces have explicit coefficient, field, rank or prime hypotheses and each describes a coherent missing construction/theorem, rather than an unrelated bundle of requests.

| Gap slug | Scope/minimality check |
| --- | --- |
| dyadic-flag-ring-dimension | Extends §6.24 beyond trivial residual data and the large-degree hypothesis; both component dimension and special-fibre placement are needed by §3.2. The generic characteristic-zero local bound alone does not supply them. |
| gsp4-semisimple-taylor-wiles-places | Existing §2.17 uses the restricted distinct-eigenvalue setting; requested Levi condition includes repeated eigenvalues and keeps p≥3/fixed similitude. |
| inertial-types-and-block-levels | Existing SR.3.2 supplies inertial classes and cuspidal generators, not the full stated LLC dictionary and block-uniform subgroup interface. |
| hilbert-siegel-hida-module-free | AutomorphicBundles Layer 12's classical Hecke action is not the specified ordinary finite-free module over weight space. |
| hilbert-siegel-taylor-wiles-coinvariants | Auxiliary-level freeness and precise Δ_Q coinvariants are additional to base-level freeness. |
| hilbert-siegel-ordinary-classicality | Dense arithmetic specialization is not implied by either freeness contract. |
| gsp4-galois-representations-totally-real | Available construction is over ℚ; the declared contract supplies the totally real setting and ordinary parallel-weight-two boundary. |

These remain stated supplier contracts, not unowned prerequisites. A future acceptance would remain conditional on them. Because this verdict is needs changes, `review.json` does not use the accepted-only conditional_gaps field.

## Not verifiable

- No cited text was inaccessible: all fourteen manifest sources were available legally in the cache. No fetch, manifest mutation or new missing-reference request was required.
- The cited proof of BCGP25 Lemma 5.7.7 does not certify the general extra dimension in README §3.2(b). The revised route explicitly leaves (★), the necessary unprepared component assertion, and the rank-one relation-space question to this target. The retained human decision on that source gap is respected; this report does not claim a proof of them.
- The seven supplier gaps are precise future contracts, not implemented supplier results. Their declaration, ownership and scope were checked; their eventual proofs were not certified.
- Ger19 was read in the selected preprint numbering. A separate verification of all published/preprint renumbering entries was not performed; the README's actual locators use the version read.
- The empty acceptance file's successful elaboration certifies its syntax/imports only. It proves none of the mathematical roadmap statements. Explicit boundary computations and source comparisons above are the evidence for this review's mathematical conclusions.

## Source issues

- **Misprint** in Tho17 at the natural transformation after Lemma 2.11, printed page 7: the source puts the frame on the left in local conjugation; it should put the inverse frame on the left; affects a stated result.
- **Error** in BCGP25 at §5.4, printed page 123: the source excludes degree-three cohomology for nonempty T; it should retain h³ = h⁰(ad r̄(1)) = 1 at p = 2; affects a stated result.
- **Gap** in BCGP25 at Lemma 5.7.7, proof, printed pages 133–134: the source derives full weight dimension from its relation count; it should retain h³ and supply an additional dimension argument; affects the proof.
- **Misprint** in BCGP25 at Lemma 5.7.7, printed page 133: the source uses [F:ℚ] in the weight dimension; it should use [F⁺:ℚ], giving 1+nd; affects a stated result.
- **Gap** in BCGP25 at Lemma 5.7.7, proof, printed page 133: the source invokes the prepared trivial-residual local theorem before preparation; it should justify the lower bound for general residual flag-image rings; affects the proof.
- **Gap** in BCGP25 at Proposition 5.7.9, printed page 134: the source asserts nonzero residual Hecke localization at insufficiently constrained levels; it should require seed fixed vectors at the remaining places; affects a stated result.
- **Misprint** in BCGP25 at Lemma 5.5.3, proof, printed page 125: the source places F⁺ inside the next real cyclotomic field; it should choose the least m with K⁺_m not contained in F⁺; affects the proof.
- **Misprint** in BCGP25 at Lemma 5.5.3, proof, printed page 126: the source reverses or mislabels the extension supplying the quadratic class and unramifiedness; it should use L⁺/F⁺; affects the proof.
- **Misprint** in BCGP25 at Proposition 5.5.6(i), printed page 126: the source labels the prescribed multiplier µ; it should label it χ; affects nothing.
- **Misprint** in BCGP25 at §5.6.1, printed page 129: the source applies Artin reciprocity to an inertia element; it should apply inverse Artin reciprocity before evaluating the character; affects nothing.
- **Misprint** in BCGP25 at §5.4, printed pages 121–122: the source places polarized representations over G_F; it should place them over the totally real Galois group G_{F⁺}; affects nothing.
- **Misprint** in BCGP25 at proof of Theorem 5.7.14, printed page 137: the source names a later base-change module in the support inclusion; it should use H₁ at that stage; affects nothing.
- **Misprint** in BCGP25 at proof of Theorem 5.7.14, printed page 138: the source omits dyadic places from T′; it should include S₂(L⁺) to retain ordinary conditions; affects nothing.
- **Gap** in BCGP25 at proof of Theorem 5.7.14, printed pages 135 and 139: the preparation list omits uniform unipotence needed for the final restriction map; it should impose Lemma 5.6.2 for restrictions of every original local lift; affects the proof.
- **Misprint** in BCGP25 at §6.3 before the selected problem, printed page 147: the source indexes local stabilizing characters by p; it should index them by v; affects nothing.
- **Gap** in BCGP25 at Hypothesis 6.3.1 and preceding paragraph, printed page 146: the source cites an ordinary weight-two construction for a regular-weight seed; it should also cite the regular-weight Galois construction over the totally real field; affects the proof.
- **Gap** in WHI22 at Proposition 3.18, printed page 22: the source omits H⁰ vanishing used through Lemma 3.16; it should include Definition 3.15(1a), already present in reasonableness; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "47d1848cad57bca9b47457f031088ed9099dc99c", "job": "REV-PKG-OrdinaryAutomorphicFormsAndModularityLiftingPartII~3", "model": "gpt-6-astra", "worker": "chris-3"} -->
