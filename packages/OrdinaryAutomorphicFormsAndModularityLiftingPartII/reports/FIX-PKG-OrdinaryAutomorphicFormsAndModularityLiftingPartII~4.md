# Repair report

Review: REV-PKG-OrdinaryAutomorphicFormsAndModularityLiftingPartII~3. Both findings were verified independently from the legal cached sources and the computations below.

## F01 (P3) — applied

README §2.3, second Check: unrestricted Eisenstein assertion for constants → assertion restricted to n ≥ 2. Added the complementary rank-one non-Eisenstein, cuspidal GL₁ case and the rank-two invariant-line control, including coincident residual characters. Added the exact Ger19 definition locator. The theorem retains its generality; Suggested.lean is unchanged.

## F02 (P3) — applied

README §5.4, third Check: automatic invariant Cartan → kernel of Ad(h) − 1 on 𝔰𝔭₄. Added h = I₄ (dimension 10) and the unipotent 𝔽₃ witness, with a moved Cartan element and a nonzero invariant. The q ≠ 1 and eigenvalue-ratio hypotheses remain unchanged. These boundary Checks stay in the README.

## Evidence and propagation

| Finding | Evidence read and calculation |
| --- | --- |
| F01 | Ger19 line 1114, §2.7, definition preceding Proposition 2.7.4, p. 25, defines non-Eisenstein by absolute irreducibility. Ger19 lines 1065–1072, Proposition 2.7.2, p. 24, give the constituent representation and its dual/twist normalization. BCGP25 lines 6002–6015, pp. 132–133, concern ordinarity and the constituent realization. Rank one has subspace dimensions 0 and 1 only, after every coefficient extension. Rank two has the stable line k·e₁ in 1 ⊕ ε̄⁻¹, even when ε̄ = 1. GL₁ has zero proper parabolics, so its automorphic characters are cuspidal. |
| F02 | BCGP25 lines 6660–6662, §6.3, p. 147, impose the original q and ratio exclusions. BCGP21 lines 8922–8926, Proposition 7.4.2, p. 381, give the H⁰ vanishing criterion and ten-variable fixed-similitude ring. For an unramified representation away from p, inertia acts trivially on both ad⁰ and the cyclotomic twist. If q = 1 in k, the Frobenius action on the twist is Ad(h), so its fixed vectors are exactly the stated kernel; no semisimplicity is needed. |

Searched the entire README and Suggested.lean for constants, Eisenstein, RACSDC, Cartan, 𝔱, unramifiedness, eigenvalue ratios and H⁰. The fourth Check of §2.3 already restricts the noncuspidal constant constituent to n ≥ 2 and agrees with the repaired second Check. The first and fourth rank-one Checks there remain valid. The other Cartan uses in §5.2 have diagonal-torus or regular-semisimple hypotheses, so the unipotent counterexample does not apply. The smoothness contract, §5.4 API, and its consumers in §§6.2–6.3 retain the ratio exclusion that forces H⁰ = 0. No other occurrence required an edit. No theorem, declaration name, section id, supplier edge or gap changed.

For the rank-one control the standing field hypotheses have instances: take F⁺ = ℚ(√105,√13) and F = F⁺(√−7). The field L = ℚ(√−7,√−15) has discriminant (−7)(−15)(105) = 11025 = 105²; its real quadratic subfield has discriminant 105, so L/ℚ(√105) has relative discriminant of norm 1. Unramifiedness persists on base change. Since −7 and −15 are 1 modulo 8, the CM quadratic extension splits at 2, including after this base change. Here d = 4 and nd = 4 for n = 1. Thus the rank-one test is not excluded by the layer's degree condition.

## Adversarial mathematics pass

The following are explicit tests of statements, not proofs of the planned theorems. Numerical dimension specializations with n = d = 2 are arithmetic tests; the large-degree preparation instead uses the separate d = 6 case. All changed assertions are decomposed into their individual tests first. Remaining rows test the definitions, conventions, targets and their unchanged consumers across the six layers. No Lean boundary declarations were added.

| Statement | Instances tried | Computed values on each side | Result; change |
| --- | --- | --- | --- |
| §2.3 non-Eisenstein definition | Constant character, n = 1, k = 𝔽₂ and k̄ | dim V = 1; invariant-subspace dimensions {0,1}; absolute irreducibility = true; non-Eisenstein = true | F01 applied. |
| §2.3 constants in higher rank | n = 2, λ = 0 | 1 ⊕ ε̄⁻¹ has dim k·e₁ = 1 < 2; at p = 2 its residual polynomial is (X−1)² | Reducible even with repeated characters; n ≥ 2 inserted. |
| §2.3 GL₁ cuspidality | Trivial Hecke character | Number of proper parabolics = 0; number of cuspidality conditions = 0 | Cuspidal; complementary control added. |
| §2.3 duality and tame polynomial | n = 1; then n = 2 with χ₁ = χ₂ = 1 | ε^(1−1) = 1, hence rᶜ = r⁻¹; tame polynomial (X−1)(X−1) = (X−1)² | Matches the fourth Check and Ger19 normalization. |
| §5.4 invariant-space formula | Unramified w₀ ∤ p, q ≡ 1 | ε̄(Frob) = q⁻¹ = 1; fixed-vector equation hAh⁻¹ = A is (Ad(h)−1)A = 0 in both directions | F02 replaces the false inclusion. |
| §5.4 identity control | p = 3, q = 7, h = I₄ | Ad(h)−1 = 0; kernel dimension 10−0 = 10 | Positive control added. |
| §5.4 unipotent representation | U = [[1,1],[0,1]], h = diag(U,U⁻ᵗ), k = 𝔽₃ | h−I₄ = E₁₂+2E₄₃; (h−I₄)² = 0; h³ = I₄; hJᵗh−J = 0 | Finite order gives a continuous unramified local representation; ν(h) = 1 = ε̄⁻¹. |
| §5.4 Cartan counterexample | X = diag(1,0,−1,0) | XᵗJ+JX = 0; hX−Xh = 2E₁₂+E₄₃ ≠ 0 | X is symplectic but not fixed; automatic Cartan assertion deleted. |
| §5.4 nonzero invariant | Z = h−h⁻¹ | Z = 2E₁₂+E₄₃; ZᵗJ+JZ = 0; hZ−Zh = 0 | Nonzero invariant retained without a Cartan claim. |
| §5.4 whole kernel in the unipotent control | Ten-element block basis of 𝔰𝔭₄ over 𝔽₃ | rank(Ad(h)−1) = 6; dim ker = 10−6 = 4, versus 10 for I₄ | Confirms the formula distinguishes these cases. |
| Coefficient conventions | O = ℤ₂, k = 𝔽₂; zero ring | residue-field cardinality 2 ≠ 1; 0 = 1 in the zero ring | The zero ring is not an allowed coefficient ring with this residue field. |
| 𝒢_n and multiplier conventions | n = 4; complex conjugation | ε^(1−4)δ⁴ = ε⁻³; ν(j) = −1 | Normalization unchanged. |
| Frobenius/Artin convention | p = 7, q = 2 | geometric ε = 2⁻¹ = 4 modulo 7; arithmetic value = 2 | Both dyadic Hecke and symplectic local calculations retain the geometric convention. |
| Weight algebra convention | n = d = 2, two dyadic completions ℚ₂ | torus rank 4; dim Λ = 1+4 = 5; torsion-character count 2⁴ = 16 | Agrees with §§2.1, 2.2 and 4.2. |
| Full versus trace-zero local obstruction contract | Rank-one trivial character over ℚ₃ with O = ℤ₂ | dim ad = 1; dim ad⁰ = 0; R/2 = 𝔽₂⟦u,X⟧/(u²), u ≠ 0 and u² = 0; dim H²(ad) = 1 | Full adjoint criterion is necessary; unchanged. |
| §1.1 deformation and framing definitions | T empty; n = 4, three frames | Empty framing adds 0; (4²+1)·3−1 = 50 versus GL₄ count 47 | Empty case separated; full Ĝ_n used. |
| §1.1 scalar conjugation | A = 𝔽₂[t]/(t²), a = 1+t | (x+yt)² = x²; a has nonzero t coefficient and no square root | GL₁ factor cannot be absorbed. |
| §1.1 local-frame map | a acts on (r,α) by (ara⁻¹,aα) | (aα)⁻¹(ara⁻¹)(aα) = α⁻¹rα | Source and target map use the invariant frame expression. |
| §1.1 augmentation | No Taylor–Wiles places | Δ_∅ = 1; O[Δ_∅] = O; R⊗_O O = R | Base problem recovered. |
| §1.2(1) µ_v | Split place; real place with B = I₂ or Ψ₂ | Split µ = 0; Y+Yᵗ has zero diagonal at p = 2, so I₂ is not in its image; alternating Ψ₂ gives scalar norm I₂ | Distinguishes strong residual oddness from alternating polarization. |
| §1.2(2) degree-three cohomology | Scalars at p = 2 | j·I_n = −I_nᵗ = I_n; h³ = 1 while h⁰ of the nonempty-framed complex = 0 | Retains the degree-three term. |
| §1.2(3)–(4) Euler/presentation formulas | n = d = 2, #T = 3, q = 5, h² = h³ = 1 | χ = 1−3−5+2 = −5; h¹ = 1−1+5 = 5; g = 5+3−1−2 = 5 | Both counts give 5. |
| §1.2(5) restriction criterion | B = I₂ versus alternating B | Scalar Tate class for I₂ survives modulo Y+Yᵗ; for alternating B it is a norm and equals 0 in Tate cohomology | Strong oddness retained. |
| §1.3 trace/spanning equivalence | H = 1, dim V = 0,1,2 | dim End = 0,1,4; dim semisimple span = 0,1,1; dim U = 0,0,3 | Both sides agree, including rank zero for this linear-algebra statement. |
| §1.3 nonabelian test | H = GL₂(𝔽₂) ≅ S₃ | Semisimple span 𝔽₂[A] has dimension 2 < 4; trace-annihilator dimension 4−2 = 2 | Absolute irreducibility does not replace weak adequacy. |
| §1.4 cyclotomic class definition | √2 ∉ F⁺; then F⁺ = ℚ(√2) | Least m = 3; then m = 4 and [ℚ(ζ₁₆)⁺:ℚ] = 4 | Least-m definition covers both. |
| §1.4 local scalar pairing | n = 2 in characteristic 2; redundant split auxiliary prime | tr(I₂) = 2 = 0; redundant prime has ψ_v = 0 | The unavoidable class remains; q = h¹_dual−1 ≥ 0. |
| §2.1 levels | b = c = 1 | Diagonal entries ≡ 1 and lower entries ≡ 0 modulo ϖ; identity satisfies both | The level is the unipotent Iwahori congruence subgroup, not full hyperspecial level. |
| §2.1 weight twists | n = 1,2 | Product u_i^(1−i) is 1 for n = 1 and u₂⁻¹ for n = 2 | Also matches the map in §3.3. |
| §2.1 U normalization | n = 2, λ = (1,0), j = 1,2 | Lowest-weight scalars are ϖ⁰ = 1 and ϖ¹ = ϖ | Normalized operators differ at j = 2. |
| §2.1 ordinary projector | Scalar eigenvalues 1 and 2 over ℤ₂ | 1^(r!) = 1; v₂(2^(r!)) = r! → ∞, limit 0 | Projector selects unit eigenvalues. |
| §2.1 Hecke polynomial | n = 1,2 | X−T¹; X²−T¹X+qT² | Matches §§2.3 and 3.3. |
| §2.2 freeness and sufficient smallness | Four sign coordinates; central −I surviving at all tame places | Λ has rank 16 over O⟦w₁,…,w₄⟧; ([−I]−ε₀) acts by ε₀−ε₀ = 0 | Finiteness does not imply Λ-faithfulness; deep enough b₀ remains required. |
| §2.2 weight change | λ = 0; λ = (1,0) | Diamond twist factors 1 and τ(u₂); exponent parities in four coordinates give 16 sign choices | Identity and nontrivial twist distinguished. |
| §3.1 global problem | R empty; n = 3,4 at c_v | Zero tame-character conditions; multiplier values (−1)⁻²(−1) = −1 and (−1)⁻³ = −1 | All places above 2 keep ordinary conditions. |
| §3.1 special fibres and restriction | χ congruent to 1; identity field extension | Inertia polynomial reduces to (X−1)^n on both sides; norm in degree 1 sends u to u | Common reductions and ring-arrow direction agree. |
| §3.2(a) obstruction lower bound | n = d = 2, #T = 3 | dim local = 19; h¹−h² = −1; framing count 14; 19−1−14 = 4 = nd | The obstruction count gives 4, not 5. |
| §3.2(b) stronger target | Same parameters | 1+nd = 5; erroneous 1+n[F:ℚ] = 9 | Extra dimension remains a target with explicit inputs; no new proof is claimed. |
| §3.2 scalar torsion mechanism | O[C₂], z² = 1 | (z−1)(z+1) = 0; z−1 evaluates to 0 or −2 on z = 1 or −1 | A torsion relation can cut no dimension only on the appropriate components. |
| §3.2 rank-one relation count | h² = 2; K torsion-free or with one cyclic torsion summand | rank K = 1; dim K/2K = 1 or 2 | Rank alone does not decide torsion; unchanged. |
| §3.2 reciprocity at a split pair | Chosen-half image x = 0 or nonzero 2-torsion | x−x = 0 in both cases; local character of ℚ₂× sends −1 to −1 | Does not identify the chosen-half tuple with a principal idele. |
| §3.2 determinant multiplier | n = 2,3, c_v | (−1)^(n+1)(−1)^n = −1 in either rank | The rank-one multiplier includes δ^(n+1). |
| §3.3 Hecke-valued representation | n = 2; weight twist as in §2.1 | Frobenius polynomial X²−T¹X+qT²; nontrivial weight factor u₂⁻¹ | Agrees with the constituent convention and changed Check. |
| §3.3 fixed-vector premise | Ramified residual inertia versus hyperspecial level | A hypothetical spherical lift has inertia 1, whose reduction is 1 ≠ the given residual inertia | Fixed-vector hypothesis cannot be omitted. |
| §3.4 uniform block level | n = 1, q = 5, tame character order 4 | Seed conductor 0; nontrivial lift conductor 1; both reduce to character 1 | Uniformity is over lifts, not just the seed. |
| §3.4 monodromy forgotten | Trivial and Steinberg representations of GL₂ | Same inertial Weil representation 1⊕1; monodromy ranks 0 and 1 | Bernstein-block input deliberately forgets N. |
| §3.5 sufficiently deep level | Same rank-one tame example | O_K×-invariants of nontrivial tame character have dimension 0; (1+ϖO_K)-invariants have dimension 1 | Hyperspecial level is insufficient; shrinking gives the stated inclusion of fixed spaces. |
| §4.1 solvable preparation | Restriction of original lifts; new tame character ψ of order 4 | ψ(σ) = i ≠ 1 although ψ̄ = 1; polynomial (X−i)(X−1)^(n−1) ≠ (X−1)^n | Uniform unipotence concerns restrictions from the original field. |
| §4.2 patching over torsion weights | q = j = 0; Λ = O[C₂⁴]⟦w₁,…,w₄⟧ | S_N = S_∞ = Λ; Λ-rank over Λ⁰ = 16; (1−z)(1+z) = 0 | Empty augmentation and torsion retained. |
| §4.2 depth inequality | S = O, A = O⟦y⟧, M = O with y acting by 0 | dim A = 2; depth_A M = 1 = dim S | The maximal-depth conclusion fails without dim A ≤ dim S. |
| §4.3 patched dimensions | n = d = 2, #T = 3, q = 5 then 6 | 19+5 = 5+5+14 = 24; 19+6 = 5+6+14 = 25 | Redundant primes preserve the numerical coincidence. |
| §4.3 prepared dimensions | n = 2, d = 6, two dyadic degrees 3, #T = 3 | Each dyadic factor 1+4+3·3 = 14; local total 14+14+5−2 = 31; g = 1; 31+1 = 13+5+14 = 32 | Large-degree condition 3 > 2 holds. |
| §4.3 auxiliary Frobenius | diag(1,ω) over 𝔽₄, ω²+ω+1 = 0 | (X−1)(X−ω) has distinct roots; it is not (X−1)²; local dimension 2²+1 = 5 | Auxiliary place is not residually trivial. |
| §4.4 component products | R empty; one rank-two tame place with unipotent versus distinct characters | Component counts at that tame factor are 2 versus 1; with R empty the product contributes 1 | Only the v₁-factor varies for the indicated special-fibre generalizations. |
| §4.5 supported component and augmentation | Prepared example d = 6, q = 5 | dim C_X = 32; augmentation has 5+14 = 19 generators; lower bound 32−19 = 13 = dim Λ | Selected quotient has the required dimension independently of §3.2(b). |
| §4.6 second preparation | R empty, one dyadic component choice | T′ has S₂(L⁺) plus v₁′, not just v₁′; one C_Y′ per dyadic choice | Retains the ordinary local conditions. |
| §4.7 dyadic finiteness | Finite restriction maps A→B→C | If B has b generators over A and C has c over B, C has at most bc over A | The route uses finite restriction and the stated norm coefficient map. |
| §4.8 dyadic reduced comparison | Nonzero square-zero ideal (u) in A = O[u]/(u²) | Kernel of A→O is nonzero; its square is 0; A_red = O | Conclusion is reduced R = T, not an assertion that the original ring is reduced. |
| §5.1 fixed-similitude deformations | First-order lift (1+tX)ρ̄ | Multiplier fixed to first order iff XᵗJ+JX = 0; tangent coefficient dimension 10 versus dim 𝔤𝔰𝔭₄ = 11 | Fixed-similitude criterion retained. |
| §5.1 framing ring | #T = 0,1,3 | 0 variables in empty case; 11·1−1 = 10 and 11·3−1 = 32 | Matches the seed and patching counts. |
| §5.2 reasonableness conditions | Diagonal-torus image | Cartan dimension 2 gives at least two invariant dual directions; H⁰ ≠ 0 | Such an image fails condition (a); here the torus hypothesis justifies the Cartan argument. |
| §5.2 regular-semisimple trace convention | X = diag(x,y,−x,−y) and X′ likewise | tr(XX′) = 2(xx′+yy′); coefficient 2 is nonzero at p = 3 and zero at p = 2 | The p > 2 and regular-semisimple hypotheses are essential to this use. |
| §5.3 semisimple Taylor–Wiles places | h = I₄ | Levi = GSp₄; Lie centre intersects 𝔰𝔭₄ in 0 because scalar aI has multiplier derivative 2a; detection space dimension 0 | Semisimple is allowed without regularity; this prime kills no class. |
| §5.4 tame and auxiliary congruences | p = 3, q = 7 and 19 | 7 ≡ 1 mod 3 but 7 ≡ 7 mod 9; 19 ≡ 1 mod 9 | q = 7 fails the tame R condition and the w₀ exclusion; these are distinct uses. |
| §5.4 empty tame set | π unramified away from p | #R = 0; S = S_p ∪ {w₀} | No spurious tame local conditions. |
| §5.5 selected quotient | A = O⟦x,y⟧/(xy), point (x,y) = (ϖ,0) | Point lies on y = 0 only; point (0,ϖ) lies on the other component and does not factor through A/(y) | Selection requires unique component through the seed. |
| §5.6 detection on characteristic-zero points | A = O⟦x⟧, element x, integral specializations x = 0 and ϖ | Values 0 and ϖ ≠ 0; one point alone does not detect x, the dense-family hypothesis does | The factoring argument retains reducedness, flatness and the full classical family. |
| §6.1 weight dominance and relative dimensions | F⁺_v = ℚ_p, p > 2 | dim Λ_v = 1+2 = 3; relative ring dimension over O = 16; relative dimension over Λ_v = 16−2 = 14 | Global dominance is the input to the local component theorem. |
| §6.2 symplectic patching | d = 1, #S = 3, t = 7 | g = 7−4+3−1 = 5; g+10#S+4d = 39; t+11#S−1 = 39 | Same dimension on both sides. |
| §6.2 number of auxiliary variables | q = 4, up to two cyclic factors per prime | #Q = 4; t ≤ 8, so t = 7 does not mean #Q = 7 | Place and variable counts remain distinct. |
| §6.3 component support | A = O⟦x,y⟧/(xy), M = A/(x) | M ≠ 0 but support omits the generic point of y = 0 | Nonvanishing alone does not give full support; seed-selected component and special-fibre transport retained. |
| §6.4 finiteness | A = Λ[u]/(u²) versus Λ⊕⊕_{i≥1}Λu_i with square-zero second summand | First is free of rank 2 over Λ; second has infinitely many independent generators despite a square-zero kernel onto Λ | Noetherian complete-local hypothesis retained. |

The matrix computations use J = [[0,I₂],[−I₂,0]], the negative of the pinned Mathlib matrix J. Multiplying J by −1 leaves both the symplectic group equation and the Lie equation unchanged. Matrix multiplication and rank reduction over 𝔽₃ independently gave every displayed F02 value. The ten-dimensional Lie algebra was represented by blocks [[A,B],[C,−Aᵗ]] with B and C symmetric (4+3+3 = 10 parameters). No assumption of diagonalizability entered that calculation.

## Supplier, ownership and pinned-library checks

Read the main-branch ClassFieldTheory and GlobalQuadraticForms READMEs for shape. No layer, target organization or ownership changed. Queried the open-roadmap index by object, using the roadmaps grep and show commands, and read the relevant scopes of PotentialAutomorphyInfrastructurePartII, AutomorphyLiftingBeyondTaylorWiles, GSp4NonregularModularityLifting and AbelianSurfacesModularity. The first supplies polarized definite-unitary and O-coefficient machinery; the second treats conditional Res PGL_n patching; the last two consume the ordinary lifting outputs here. The repairs introduce no generic carrier or construction needing a new owner. Ownership against the supplied open heads was checked; no new Lean name could collide with another roadmap.

Re-resolved all cross-roadmap citations against the supplied open-head index and inspected the cited supplier headings and their statements. The citation resolver reports no cross-roadmap citation or Lean name found nowhere. Its caveat that it does not inspect installed Lake packages was addressed by directly reading the pinned source files below. In particular, checked PotentialAutomorphyInfrastructurePartII §§0.2, 0.9, 1.3, 3.1–3.6, 3.9, 3.11, 4.1, 4.4, 4.6, 5.2, 5.4; the other exact contracts' numbered sections; the named AG2.2, AG2.3 and AG2.5 targets; and the downstream consumers' ordinary-support citations. The seven existing gap slugs still each have the matching README contract and plan entry. No gap was added or altered.

The overlap inventory reports no competing edit of this roadmap, no dropped cited id, and no id defined only by an open revision. Inspected the closest scopes named above; no repair requires rebasing or a supplier revision. The changed Checks add no dependency on an open revision.

| Pinned declaration | File and line read | What the native object includes |
| --- | --- | --- |
| Matrix.trace; Matrix.trace_one | Mathlib/LinearAlgebra/Matrix/Trace.lean:43,144 | Diagonal sum; trace of identity is cardinality. |
| Module.End.IsSemisimple | Mathlib/LinearAlgebra/Semisimple.lean:56 | Semisimplicity of the associated polynomial module, with no invertibility field. |
| Submodule.span | Mathlib/LinearAlgebra/Span/Defs.lean:46 | Infimum of submodules containing the set. |
| Matrix.J; Matrix.symplecticGroup | Mathlib/LinearAlgebra/SymplecticGroup.lean:59,102 | J has blocks (0,−I;I,0); membership is AJAᵗ = J. |
| LieAlgebra.Symplectic.sp | Mathlib/Algebra/Lie/Classical.lean:157 | Skew-adjoint matrices for that J; no local Galois action is part of the carrier. |
| groupCohomology | Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean:183 | Cohomology of a representation of a group, not a global Selmer condition. |
| TauCeti.completedGroupAlgebra | TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:117,145 | Compatible families in the finite quotient group algebras. |

Pins read from content/lake-manifest.json: Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5. Object searches for deformation rings, Hida modules/Hecke algebras, RACSDC, near adequacy and GSp₄-reasonableness yielded no matching native declarations at those pins. The missing headline carriers described in Suggested.lean therefore remain missing. Existing matrix and group-cohomology carriers do not state either automorphy-lifting headline. The fourteen manifest sources are already certified legal cached texts; these repairs needed no additional source, waiver or missing-reference request.

## Required checks and outcomes

- Elaborated packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/Suggested.lean using lake env lean from the content checkout: exit 0, no output. It imports only Mathlib and has zero declarations. No TauCeti module build was needed.
- Mechanical signature audit found zero definitions, instances, abbreviations, opaque declarations or theorems. The list of required #check commands is consequently empty. Elaborated the resulting import-only scratch audit: exit 0, no output. No binders changed and no README/Lean signature disagreement was introduced.
- Ran the requested dependency check with --movable and the provided content and order inputs: exit 0. Its complete output was:

```text
depcheck: 236 roadmaps, 2145 edges, 0 problem(s)
```

- No UPWARD, CYCLE or moved line was emitted.
- Parsed metadata.toml and sources.toml successfully. Parsed design/plan.json and checked all seven existing gap slugs against their README contract lines; all matched. These three files were not edited.
- Citation resolution: no unresolved cross-roadmap citations; no unresolved roadmap Lean names. Direct pinned inspection is recorded above.
- git diff --check: exit 0, no output.
- No separate gate failures were listed in the brief. No claim in the review required a supplier edit or an external decision. No suspicious instruction was encountered.

Only README.md's two Checks and this report were changed. Suggested.lean remains the deliberately declaration-free headline acceptance file; the findings request mathematical boundary controls, not additional Lean targets. No consumer-facing section or declaration name changed. No commit or network write was made.
