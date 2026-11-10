# Repair report: OrdinaryAutomorphicFormsAndModularityLiftingPartII

## REV-PKG-OrdinaryAutomorphicFormsAndModularityLiftingPartII~2/R01 (P2) — applied

Unconditional diagonal membership, nonzero cyclic torsion, exact relation count and nonzero pairing → the conditional (★)/(C) route and rank K = h² − 1, d(K) = h² − 1 + d(K_tors) ≤ h². Repaired §3.2, its Checks and source correction together; added the two-place reciprocity Check, GlobalGaloisDeformations §§4.8–4.11 contract/dependencies and KW09 bibliography.

## REV-PKG-OrdinaryAutomorphicFormsAndModularityLiftingPartII~2/R02 (P2) — applied

Unrestricted trace-zero criterion → full adjoint and its Tate dual. Separated the p > 2 fixed-similitude 𝔰𝔭₄ criterion and the Lie(ker ν) tangent module. Updated the contract, §5.1 and fixed-similitude citations/dependencies in §§6.2–6.3. Added the nonsmooth ℚ₃ character ring as a convention Check. The intended §5.4 auxiliary-place argument survives.

## REV-PKG-OrdinaryAutomorphicFormsAndModularityLiftingPartII~2/R03 (P2) — applied

Obsolete PL.0–PL.4 references → content-specific numbered sections throughout scope, contracts, Layers 1–4, routes and dependencies. Prescribed auxiliary extensions now cite PotentialAutomorphyInfrastructure §2.5 and PotentialModularityAndCompatibleSystems §2.16. Both contracts were added explicitly. All replacement headings were opened at the supplied heads; no PL id remains in the README. No package target was renumbered.

## REV-PKG-OrdinaryAutomorphicFormsAndModularityLiftingPartII~2/R04 (P3) — applied

“q = h¹ primes impossible” and contradictory dimension discrepancies → impossibility of killing the final scalar class, with redundant primes permitted. Repaired §1.4 and §§4.2–4.3 Checks. Recomputed 24 = 24, then 25 = 25 with updated g; omitting h³ gives 26 > 25. Also recorded the admissible prepared count 32 = 32 → 33 = 33.

## REV-PKG-OrdinaryAutomorphicFormsAndModularityLiftingPartII~2/R05 (P3) — applied differently

“ρ̄ trivial at T” → trivial at S₂ ∪ R, unramified regular semisimple at v₁, whose unrestricted ring has dimension n² + 1. Repaired §4.3 and Layer 4 Examples. The d = 2 witness violates large-degree preparation; retained its arithmetic as a numerical specialization and added two degree-3 dyadic places giving 14 + 14 + 5 − 2 = 31.

## REV-PKG-OrdinaryAutomorphicFormsAndModularityLiftingPartII~2/R06 (P3) — applied

“Ger19 lines 1003, 1113, 1146” → §2.7 opening discussion, p. 22, and proofs of Propositions 2.7.3–2.7.4, pp. 25–26. Read all three passages. Pattern search of the entire README finds no remaining extraction-line locator; the references continue to use Geraghty's preprint numbering as specified in the manifest.

## Evidence and mathematical boundaries

The findings were verified as mathematical claims, independently of their proposed wording.

| Finding | Evidence read and conclusion |
| --- | --- |
| R01 | For a chosen-half −1 idele, division by principal −1 leaves −1 at each conjugate place inside S. In Γ, c acts by −1, giving x + (−x) = 0; this imposes no additional vanishing of x. KW09 line 4000, Lemma 9.4, p. 87, concerns a free formal-torus action and its 2-torsion torsor, not this kernel K. GlobalGaloisDeformations §§4.8–4.11 supply the determinant alternative with their actual freeness hypotheses. |
| R02 | LocalGaloisDeformationRings §§1.4 and 1.17 distinguish unrestricted adjoint cocycles from the fixed-multiplier quotient. The ℚ₃ calculation below directly refutes the former contract. BCGP21 line 8030 gives the perfect trace pairing on 𝔰𝔭₄; BCGP21 line 8923, Proposition 7.4.2, gives the fixed-similitude ten-variable ring. |
| R03 | Opened PotentialAutomorphyInfrastructurePartII §§0.2, 0.9, 1.3, 3.1–3.6, 3.9, 3.11, 4.1, 4.4, 4.6, 5.2 and 5.4. In particular §4.4 is the O-coefficient GHT-adequate presentation; §5.4 is its relaxed-adequate variant. The auxiliary extension construction is in the parent's §2.5, consuming prescribed completions from PotentialModularityAndCompatibleSystems §2.16. |
| R04 | BCGP25 line 5620, Definition 5.5.2, allows semisimple identity Frobenius with eigenvalue 1. BCGP25 line 5640, Lemma 5.5.3, asserts persistence of a class, not an upper bound on the number of primes. BCGP25 line 5701, Proposition 5.5.6, gives the economical cardinality and g formula. LocalGaloisDeformationRings §2.23 allows the eigenvalue block of multiplicity n. |
| R05 | Sho18 line 305, Theorem 2.5, gives O-flatness and relative dimension n² for the unrestricted ring without residual triviality. LocalGaloisDeformationRings §§2.24 and 2.29 supply respectively that dimension route and the sum-of-characters description. BCGP25 Proposition 5.6.6 requires local degree greater than n(n−1)/2 + 1; for n = 2, degree 1 is excluded and degree 3 is allowed. |
| R06 | Ger19 line 1003 invokes CHT08 Lemma 2.1.4; Ger19 line 1113 invokes CHT08 Proposition 3.4.2; Ger19 line 1146 invokes CHT08 Proposition 3.4.4. The page markers locate these on printed pp. 22, 25 and 26. |

The dimension headline §3.2(b) remains a target with the two explicitly identified sufficient inputs. This repair does not certify those inputs from the cited dimension-count proof, identify K_tors, or decide the obstruction pairing. It does not reopen the human decision on that source gap. The rank-two alternative imports a theorem about a free formal torus with square-equivariant determinant; its hypotheses are not asserted automatically for arbitrary rank.

## Adversarial mathematics pass

Rows record concrete specializations, including exclusions. A test of a consequence does not prove the general theorem. Numerical specializations with n = d = 2 test the dimension formulas; the degree-3 examples additionally respect the prepared local-degree inequality. The unchanged targets retain their scope, APIs and Checks; no extra target or Lean declaration was introduced for a boundary example.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Coefficients and Artin normalization | p = 7, q = 2 | ε(Art(ϖ)) = 2⁻¹ = 4 mod 7; arithmetic value 2 | Geometric convention separates them | None |
| Polarized multiplier | n = 4 and n = 3 at c_v | ε⁻³δ⁴ = ε⁻³; ε⁻²δ(c_v) = −1 | Required multiplier retained | None |
| Weight algebra dimension | n = 2, two ℚ₂ places | rank T(l) = 4; dim Λ = 1 + 4 = 5; torsion order 16 | Both free rank and torsion matter | None |
| Unrestricted local smoothness | Trivial rank-one residual character over ℚ₃, O = ℤ₂ | ad⁰ = 0; ad = 𝔽₂; H²(ad⁰) = 0 versus dim H²(ad) = 1 | Old criterion false | Full adjoint |
| Character-ring witness | ℚ₃×(2) = C₂ × ℤ₂ | (1 + u)² − 1 = u² + 2u; mod 2 gives u² = 0 with u ≠ 0 | Special fibre is nonsmooth | New README Check |
| Full-adjoint self-duality | Matrix units E₁₂ and E₂₁, characteristic 2 | tr(E₁₂E₂₁) = 1; tr(E₁₂E₁₂) = 0 | Trace pairing detects matrix units without division by n | Contract clarified |
| Fixed-similitude tangent module | First-order ρ = (1 + εX)ρ̄ | Fixed ν imposes dν(X) = 0; dim ker dν for GSp₄ is 10 versus dim 𝔤𝔰𝔭₄ = 11 | Tangent uses Lie(ker ν) | Contract and §5.1 |
| 𝔰𝔭₄ duality boundary | Cartan coordinates (x,y) = (1,0) paired with themselves | tr(XX) = 2; mod 3 gives 2, mod 2 gives 0 | p > 2 is essential for this pairing | Fixed-similitude criterion explicit |
| §1.1 polarized lift and equivalence | A = k[ε], char k = 2, a = 1 + ε | a⁻¹ = 1 + ε; (x + yε)² = x², so a is not a square | Full Ĝ_n equivalence differs from scalar GL_n equivalence | None |
| §1.1 representability centralizer | Rank-one polarized scalar (g,a) commuting with j | Commutation forces g² = a; one free scalar coordinate | Centralizer has dimension 1 | None |
| §1.1 framing dimension | T empty; n = 4, three frames | Empty gives 0 variables; (16 + 1)·3 − 1 = 50 versus 47 for GL_n framing | Two cases distinguished | None |
| §1.1 local map | Frame α = 1 and general α | α⁻¹rα = r at identity; replacing frame by aα cancels the simultaneous conjugation by a | Map descends to stated source and target | None |
| §1.1 split-place lift identification | Split decomposition group, fixed multiplier χ | Pair is (ρ,χ); GL_n projection followed by reinsertion returns (ρ,χ) | No extra multiplier variable | None |
| §1.1 Taylor–Wiles augmentation | One cyclic diamond group, generator δ | δ ↦ 1 imposes ψ = 1; O[Δ] tensor O gives the original problem | Correct map direction | None |
| §1.2(1) local µ_v | Split place; real place with B = I₂ or Ψ₂ | Split: µ = 0; I₂ has nonzero connecting class; Ψ₂ has zero class | Dimension 0 or 1 | None |
| §1.2(2) cohomology | Char 2, absolutely irreducible residual restriction | −I_nᵗ = I_n; scalar invariants have dimension 1; T nonempty gives h⁰ = 0 | h³ = 1 retained | None |
| §1.2(3) Euler characteristic | n = d = 2, three framed places, q = 5 and 6 | 1 − 3 − 5 + 2 = −5; 1 − 3 − 6 + 2 = −6 | Extra prime decreases χ by 1 | Recomputed |
| §1.2(4) presentation | h² = h³ = 1 in the preceding cases | h¹ = 1 − 1 − (−5) = 5; then 6; g = q + 3 − 1 − 2 = q | g updates with q | None to theorem |
| §1.2(5) restriction criterion | Real B = I₂ and B = Ψ₂ | For I₂, X + Xᵗ has diagonal 0 and cannot be I₂; for Ψ₂, X = diag(1,0) gives X + Ψ₂XᵗΨ₂ = I₂ | Nonalternating and alternating cases differ | None |
| §1.3 full-adjoint trace condition | H = 1 on k² | tr against 1 vanishes on all trace-zero matrices; dim U = 3 versus End dimension 4 | Trivial rank-two image fails | Supplier id only |
| §1.3 semisimple spanning equivalence | H = GL₂(𝔽₂), A of order 3 | Semisimple span is span(1,A), dimension 2; End has dimension 4 | Absolute irreducibility alone insufficient | Supplier id only |
| §1.3 rank-one boundary | H = 1 on k | End = k; tr(1·w) = w; U = 0 and span(1) = k | Both equivalence directions hold | None |
| §1.4 least cyclotomic layer | F⁺ = ℚ(√5), then ℚ(√2) | First gives m = 3, [L⁺:F⁺] = 2; second gives m = 4, [L⁺:ℚ] = 4 | Least-m definition works without an inclusion F⁺ ⊂ K⁺_m | None |
| §1.4 scalar local pairing | n = 2 in char 2; n = 1 at a split dyadic place | tr(I₂) = 0; in rank one the F/F⁺ Kummer class is 0 locally | Both routes give pairing 0 | None |
| §1.4 persistence at redundant primes | Prime split in residual and cyclotomic fields | Frob = I_n, selected eigenvalue 1, ψ(Frob) = 0 | Added place does not kill ψ | Impossibility claim corrected |
| §2.1 coefficient module | n = 1, λ = 0, no χ | M = O; tensor with 0 is 0 | Recovers scalar-valued form module | Supplier ids only |
| §2.1 levels | b = c = 1, n = 2 | Matrix is upper triangular and diagonal entries 1 mod ṽ | Both clauses of level definition used | None |
| §2.1 U normalization | n = 2, λ = (1,0), j = 1 and 2 | Lowest-weight factors ϖ⁰ = 1 and ϖ¹; inverses are 1 and ϖ⁻¹ | Normalization changes the central operator | None |
| §2.1 ordinary idempotent | Eigenvalues a = 1 and a = 2 in ℤ₂ | a^(r!) tends to 1 and 0 respectively; squaring gives same limits | Unit and nonunit eigenvalues separate | None |
| §2.1 twisted Λ-structure | n = 1 and 2 | Twist 1 for n = 1; u₂⁻¹ for n = 2 | Not an untwisted coefficient map | None |
| §2.1 Hecke polynomial | n = 2 | j = 0,1,2 give X² − T¹X + qT² | Sign and q power agree with §3.3 | None |
| §2.2(1) freeness and finite Hecke algebra | Free rank-r module over Λ⁰; torsion factor C₂⁴ | Underlying Λ⁰-rank is 16r for free Λ-rank r; Hecke image is finite in its endomorphism ring | Small-level freeness supplies finite algebra, not Λ-faithfulness | Supplier ids only |
| §2.2(2) weight independence | λ = 0; λ = (1,0) at one embedding | Twist 1; then τ(u₂) | Matches lowest-weight normalization | None |
| §2.2(3) torsion components | Four independent sign coordinates | 2⁴ = 16 sign characters; algebraic exponents attain all 16 parities | Density must include every sign component | None |
| §2.2(4) classical specialization | λ = 0 | Weight-normalization factor is 1; both sides carry the operators U^j_0 | Zero-weight specialization agrees with the finite-level ordinary system | None |
| §2.2 central negative control | Global −I_n at all tame levels | ([−I_n] − ε₀) acts as ε₀ − ε₀ = 0, while [−I_n] − ε₀ ≠ 0 in Λ | Finite Hecke algebra need not be faithful over Λ | None |
| §2.3 ordinary constituents | n = 1; n = 2 constant constituent | Rank-one base change has r^c = r⁻¹; rank-two constant constituent has two character summands | Cuspidality requires non-Eisenstein localization | Supplier ids only |
| §2.3 inertial character polynomial | n = 2, inertia characters χ₁,χ₂ | Polynomial (X − χ₁⁻¹)(X − χ₂⁻¹); at χ₁ = χ₂ = 1 gives (X − 1)² | Inverse Artin and inverse character conventions agree | None |
| §3.1 ordinary global problem | R empty; all χ congruent to 1 mod ϖ | S_χ = S^{T,ord}; mod ϖ polynomial equals (X − 1)^n | Ordinary condition remains above 2, unrestricted elsewhere | None |
| §3.1 restriction weight map | Identity extension; extension of local degree e | Identity gives u ↦ u; restriction of characters corresponds to u ↦ N(u), with N(a) = a^e for base scalars | Ring arrow points from extended-field ring to original | None |
| §3.2(a) obstruction count | n = d = 2, three framed places | Local lower bound 19; h¹ − h² = −1; framing 14; 19 − 1 − 14 = 4 | Count gives dim Λ − 1, not 5 | Retained |
| §3.2(b) effective torsion relation | O[C₂], z generator | (z − 1)(z + 1) = 0; on z = 1 component the relation is 0; on z = −1 it is −2 | Relation can be minimal while cutting no dimension on selected component | Conditional route retained |
| §3.2 condition (★) | J = (z − 1) in ℤ₂[C₂] | J/mJ has dimension 1; z − 1 has nonzero class | Shows what minimality asks, without asserting global membership | Unsupported existence removed |
| §3.2 condition (C) | Two components z = ±1 of ℤ₂[C₂] | Both reduce to z = 1 mod 2; the common special point lies on the z = 1 component | Explains why special components need the stated lifting condition | Retained conditional |
| §3.2 determinant homomorphism | (g,a) and j | det(a·ᵗg⁻¹) = a^n(det g)⁻¹; multiplier on j is −1 | Multiplier is χ^nδ^(n+1) | None |
| §3.2 rank-one rank count | Rank G_loc = d + #T; framing rank 2#T − 1 | rank K = d + #T + h¹ − d − (2#T − 1) = h² − 1 | Ranks alone leave torsion undecided | Corrected |
| §3.2 rank-one relation alternatives | K = ℤ₂^(h²−1), then K × C₂ | d(K) = h² − 1, then h²; both satisfy d(K) ≤ h² | Cannot infer cyclic nonzero torsion | Corrected |
| §3.2 idele negative control | One split pair, chosen-half image x | Principal relation x + cx = x − x = 0 for x = 0 and for x of order 2 | No proof that chosen-half tuple lies in K | Added Check |
| §3.2 local unit negative control | ℚ₂× = 2^ℤ × {±1} × (1 + 4ℤ₂) | Character values on 2, −1, 5 are 1, −1, 1 | Local units inside S cannot be discarded | Added Check |
| §3.2 rank-two alternative | Free one-dimensional torus, determinant coordinate | y = (1 + x)² − 1 = 2x + x²; finite flat degree 2, dimension cost 1 | Torsor calculation needs free action | Hypotheses and supplier explicit |
| §3.3 Hecke-valued Galois representation | n = 2; hyperspecial level at residually ramified w | Polynomial X² − T¹X + qT²; ramified inertia cannot reduce from an unramified lift | Fixed-vector hypothesis necessary | Ger19 locator only |
| §3.4 uniform local vectors | Residually trivial character, q ≡ 1 mod 4 | Unramified seed conductor 0; order-four tame lift conductor 1 | Seed conductor is not a uniform bound | None |
| §3.5 sufficiently deep level | Rank-one preceding example | O×-invariants of ramified character have dimension 0; invariants under 1 + ϖO have dimension 1 | Correct subgroup direction and negative control | None |
| §4.1 local preparation | n = 2, dyadic degree 1 or 3 | Threshold n(n−1)/2 + 1 = 2; 1 > 2 false, 3 > 2 true | Small numerical example is not prepared data | Clarified §4.3 and Examples |
| §4.1 restricted-lift clause | ψ tame of order 4 over prepared field | Inertia polynomial (X − i)(X − 1) differs from (X − 1)²; i ≡ 1 mod λ | New prepared-field lifts are not all unipotent | None |
| §4.1 small level | Torsion-free U_v₁ and a stabilizer element of order 2 | Its projection has order dividing 2, hence is identity; sufficiently small stabilizer is trivial | Removes central −1 obstruction at that level | None |
| §4.2 torsion coefficient algebra | Λ = O[C₂⁴]⟦w₁,…,w₄⟧ | Λ⁰-rank 16; dim Λ = dim Λ⁰ = 5; (1 − z)(1 + z) = 0 | Power-series subring reduction respects torsion | None |
| §4.2 zero auxiliary variables | q = j = 0 | h = 0; S_N = S_∞ = Λ; H_N/a = H_N = H | No empty-variable defect | None |
| §4.2 depth boundary | R = S⟦y⟧, H = S with y acting by 0 | dim R = dim S + 1; depth_R H = dim S | Maximal depth fails without dimension bound | Removed false cause involving extra prime |
| §4.3 finite-level freeness input | b₀ = 1, torsion-free v₁ level | T(l^1) = T(l); corresponding completed algebra is Λ | Patching really has Λ-free modules | None |
| §4.3 q = 5 numerical count | n = d = 2, #T = 3 | g = 5; dim R_∞ = 19 + 5 = 24; dim S_∞ = 5 + 5 + 14 = 24 | Arithmetic equality | Explicitly numerical |
| §4.3 redundant-prime count | Same numbers, q = 6, h² = h³ = 1 | χ = −6; g = h¹ = 6; 19 + 6 = 5 + 6 + 14 = 25 | Redundant prime preserves equality | Corrected |
| §4.3 omitted-h³ negative control | Same numbers, wrongly h³ = 0 | g = 1 − 0 − (−6) = 7; 19 + 7 = 26 > 25 | Identifies actual source of mismatch | Added Check |
| §4.3 auxiliary residual polynomial | diag(1,ω) over 𝔽₄ | (X − 1)(X − ω) has constant ω ≠ 1, whereas (X − 1)² has constant 1 | v₁ is not residually trivial | Corrected |
| §4.3 v₁ dimension | Same residual Frobenius, n = 2 | Relative dimension 4, absolute dimension 5 by Sho18; no triviality input | Correct auxiliary factor | Corrected |
| §4.3 valid prepared dimensions | n = 2, two dyadic degrees 3, #T = 3 | Local dimensions 14,14,5; tensor dimension 31; g = 1; 31 + 1 = 13 + 5 + 14 = 32 | Actual degree hypothesis satisfied | Added Check |
| §4.3 prepared redundant prime | Previous data, q = 6 | g = 2; 31 + 2 = 13 + 6 + 14 = 33 | Same phenomenon in admissible degrees | Added Check |
| §4.4 component products | One R-place with two unipotent components and one χ-component; a v₁-factor with s components | Product counts 2s and s; R empty gives s and s | Comparison changes only R-factors | None |
| §4.5 support and augmentation | Prepared dimensions from §4.3 | 32 − (5 + 14) = 13 = dim Λ | Support route gives the needed lower bound | Layer 4 Examples recomputed |
| §4.6 auxiliary removal | T′ = S₂(L⁺) ∪ R′ ∪ {v′₁} | Removing S₂(L⁺) changes the number of ordinary local factors from #S₂(L⁺) to 0 | Dyadic factors must remain | Supplier references only |
| §4.7 finiteness | Complete local test algebra Λ[t]/(t²) | Λ-module generated by 1,t, rank 2; residual fibre dimension 2 | Nilpotent directions are compatible with finite algebra | No theorem change |
| §4.8 reduced R = T | R = T[t]/(t²) → T, with T reduced | Kernel (t), kernel² = 0; R_red = T | Correct conclusion retains possible nilpotents | Descent supplier id only |
| §5.1 GSp₄ framing | T empty; one frame; three frames | 0, 11 − 1 = 10, 33 − 1 = 32; GL₄ gives 47 for three | Full GSp₄ frame versus fixed-similitude tangent separated | Tangent clarified |
| §5.2 reasonableness | Torus image, p = 3 | Cartan invariant dimension 2 > 0 | Condition (a) fails | None |
| §5.2 trace test | x = x′ = 1, y = y′ = 0 | 2(xx′ + yy′) = 2 ≠ 0 mod 3; equals 0 mod 2 | Odd-prime boundary retained | None |
| §5.3 detection at identity Frobenius | p odd, h = 1 | Lie Z(GSp₄) is scalar; scalar in 𝔰𝔭₄ satisfies 2a = 0, hence a = 0; N_v = 0 | Identity prime detects no class but is allowed | None |
| §5.4 seed congruences | p = 3, q = 19 and 7 | 19 = 1 mod 9; 7 ≠ 1 mod 9 although 7 = 1 mod 3 | Stronger congruence matters | None |
| §5.4 auxiliary smoothness | q ≠ 1 and no eigenvalue ratio q; contrast identity Frobenius with q = 1 | Twisted adjoint invariants dimension 0 in first case; Cartan dimension at least 2 in second | Intended fixed-similitude criterion survives | Contract/citations clarified |
| §5.5 chosen component | Model R = O⟦x,y⟧/(xy), seed with x = ϖ,y = 0 | y-component contains seed; other component requires x = 0 and excludes the nonzero x = ϖ point | An unmarked choice would lose seed condition | None |
| §5.6 gluing and flag-image factoring | Subring T ↪ ∏O_E, element in flag ideal | Every coordinate maps to 0, hence element maps to 0 in T; k-coordinate then also 0 | Reduced faithful embedding is essential | None |
| §6.1 weight algebra and relative dimensions | p = 3, split local field ℚ₃ | Weight algebra O⟦x,y⟧ has relative dimension 2; 16 − 2 = 14 | Local ordinary count agrees with patching | None |
| §6.2 symplectic patching | d = 1, #S = 3, t = 7 | g = 7 − 4 + 3 − 1 = 5; 5 + 30 + 4 = 7 + 33 − 1 = 39 | Equal relative dimensions | Fixed-similitude reference explicit |
| §6.2 number of diamond factors | q = 4, t = 7 | t = 7 ≤ 2q = 8 but t ≠ q | Place count and cyclic-factor count differ | None |
| §6.3 reduced component R = T | Two ordinary components, seed on first; nilpotent thickening on selected component | Selection keeps one component; nilpotent kernel has zero reduced quotient | Does not assert equality on unselected components | Fixed-similitude reference explicit |
| §6.4 finiteness | Λ = O⟦x,y⟧ and R = Λ[t]/(t²) | R/m_ΛR = k[t]/(t²), length 2; R has Λ-rank 2 | Complete Noetherian condition allows residual-fibre criterion | None |

## Supplier, ownership and pin audit

Read the shape of the main-branch roadmaps ClassFieldTheory and GlobalQuadraticForms before editing. The package retains all six mathematical layers, all 30 numbered subsections and their existing target ownership. Parent OrdinaryAutomorphicFormsAndModularityLifting retains the rank-two ordinary/Skinner–Wiles theory. Generic local deformation theory stays in LocalGaloisDeformationRings; determinant twists and torsors stay in GlobalGaloisDeformations. The rank-one calculation in §3.2 is a diagnostic for this package's dimension target, not a second class-field or deformation library.

Used the roadmap tool's object search for anticyclotomic groups, principal ideles, determinant torsors and fixed-similitude smoothness, and opened the cited heads. Compared the scopes of PotentialAutomorphyInfrastructurePartII, PotentialModularityAndCompatibleSystems, AutomorphyLiftingBeyondTaylorWiles, GSp4NonregularModularityLifting and AbelianSurfacesModularity. No ownership move is needed. The first owns the imported O-coefficient and odd-prime theory; this package owns its dyadic Λ-coefficient extension. AutomorphyLiftingBeyondTaylorWiles owns a distinct arithmetic-cohomology patching application. The latter two are consumers, not suppliers here.

Opened every cited supplier section, including the unchanged ArithmeticGaloisRepresentations §§7.4–7.5, 7.9, 7.11; AutomorphicFormsOnReductiveGroups §§7.4–7.5; LocalGaloisDeformationRings §§1.3–1.4, 1.9, 1.17, 2.17, 2.22–2.24, 2.29, F.2.6, 6.24, 6.27, 6.29, 6.31, 6.35; GlobalGaloisDeformations §§3.3, 4.2, 4.8–4.11, 8.1–8.4; the named DeformationAndDerivedPatchingAlgebra sections and Layer 8; AutomorphicGaloisRepresentationsPartII AG2.2, AG2.3, AG2.5 and its GSp₄ construction; SmoothRepresentationsOfLocalGroups SR.3.2; ModularityAndLanglandsExtensions §3.9; AutomorphicBundles §§12.11–12.13; and PotentialAutomorphyInfrastructure §§2.5, 3.44, 3.47. Declared supplier gaps remain gaps, not claims that their suppliers already prove the required extension. All seven plan gaps and their README contracts remain unchanged.

The content main is 5fc1aa8. Manifest pins are Mathlib 1b1ccf4 and Tau Ceti 2fd255d. Read the eight named declarations at those pins:

| Declaration | Pinned file and line | Carrier boundary |
| --- | --- | --- |
| Matrix.trace | Mathlib/LinearAlgebra/Matrix/Trace.lean:43 | Finite diagonal sum |
| Matrix.trace_one | Mathlib/LinearAlgebra/Matrix/Trace.lean:144 | Cardinality cast, including characteristic dividing n |
| Module.End.IsSemisimple | Mathlib/LinearAlgebra/Semisimple.lean:56 | Semisimple induced R[X]-module; no invertibility condition |
| Submodule.span | Mathlib/LinearAlgebra/Span/Defs.lean:46 | Infimum of submodules containing the set |
| Matrix.symplecticGroup | Mathlib/LinearAlgebra/SymplecticGroup.lean:102 | Equation A J Aᵀ = J; no similitude multiplier |
| LieAlgebra.Symplectic.sp | Mathlib/Algebra/Lie/Classical.lean:157 | Skew-adjoint matrices for J |
| groupCohomology | Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean:183 | Homology of inhomogeneous cochains of an ordinary group representation; no arithmetic local conditions |
| TauCeti.completedGroupAlgebra | TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145 | Compatible families over open normal quotients, with R a commutative ring and Γ a topological group |

Object searches at both pins found no universal Galois deformation rings, Hida–Hecke algebras, ordinary automorphic representations or adequacy interface that would make the absent headlines statable. The incidental search hits in root approximation and oracle computability do not define these objects. No pinned result is being restated as a sorried target. The unchanged acceptance docstring identifies the missing carrier for each headline. There are no declarations to collide with another roadmap's fully qualified names.

## Check outcomes

- Required elaboration of packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/Suggested.lean, using `lake env lean` from the content checkout: exit 0, empty stdout/stderr, no warnings. The file imports only Mathlib; no targeted Tau Ceti build was needed.
- Mechanical signature audit: enumerated all declarations of Suggested.lean (zero), so the list of `#check @name` commands is empty. Elaborated the corresponding scratch import-only file once successfully: exit 0, empty stdout/stderr. There are no section binders to compare or change. No Lean name, theorem signature or docstring changed.
- Required dependency check after the final edits: exit 0. Exact output:

```text
depcheck: 236 roadmaps, 2145 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line was emitted. The order file was not edited.

- Citation resolver: no cross-roadmap citation found nowhere; no Lean name found nowhere. Its output says external Lean names were not checked by that tool, so the separate pin audit above supplies that check.
- Pattern checks: zero obsolete PL ids, zero extraction-line locators, zero machine paths in the README, zero acceptance declarations. `git diff --check`: exit 0, no output. Metadata and source manifest parse as TOML. The plan retains seven gaps. The supplied `tex=3` gate failure is repaired: both occurrences of the cyclotomic field expression in §1.4 and §4.3 and the auxiliary framed-ring expression in §4.3 are now in code spans. No mathematical statement changed. The gate’s TeX-residue scanner now returns `tex=0` (exit 0). Required Lean elaboration and dependency checks were rerun successfully after the formatting repair, with the outcomes above.

## Maintainer consequences

Only packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md and this report were changed. Suggested.lean, metadata.toml, sources.toml and design/plan.json remain unchanged; KW09 already has its single certified manifest entry and now has its missing bibliography item. No new reference fetch or missing-source request was needed. No source passage was copied and no suspicious instruction was encountered.

No target id or Lean name consumed downstream changed. The obsolete PL references in other roadmaps, including the strong-residual-oddness citations still visible in GSp4NonregularModularityLifting, were not edited. Existing supplier gaps and previously settled out-of-package design/intake issues were not re-raised. No merge-order decision or additional supplier target is requested by these repairs. Nothing was committed, and no process remains running.
