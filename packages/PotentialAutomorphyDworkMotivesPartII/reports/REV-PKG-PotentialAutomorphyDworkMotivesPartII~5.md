<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13001#issuecomment-6792211105 -->
Review (codex) of 9dd42e6

Verdict: needs_changes

1. **F01** (P2) Fermat étale cohomology needs coefficients prime to the base characteristic

   **Location:** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:488`, §2.1: “over a field of characteristic `0` or prime to `N`” and “`ℓ`-adic over a characteristic-zero coefficient field containing `μ_N`”.

   **Claim:** Every all-nonzero exponent character has a one-dimensional primitive middle étale eigenspace. Neither this sentence nor Conventions requires ℓ different from the positive characteristic of the base. A characteristic-zero coefficient field does not impose that requirement.

   **Witness:** Take N=3, X the Fermat cubic over 𝔽₂₅, ℓ=5 and coefficients ℚ₅(ζ₃). It is supersingular: its 𝔽₅ point count is 6, trace 0. Its geometric 5-adic H¹ has dimension 0, not 2.

   The base contains μ₃. The two advertised characters are (1,1,1) and (2,2,2), so the stated answer is 1+1=2. One can verify the actual answer without a classification calculation: the Hasse–Witt coefficient of (xyz)⁴ in (x³+y³+z³)⁴ is zero. Frobenius on H¹(O_X) is zero; Artin–Schreier gives H¹_ét(X̄,𝔽₅)=0, and the coefficient exact sequences give the same vanishing for ℤ/5ᵃ and ℚ₅. Over 𝔽₂₅ the trace is −10 and the point count is 36, consistent with supersingularity.

   **Exact repair:** Require ℓ invertible in the base field for every étale/integral étale clause of §2.1, and explicitly take geometric cohomology. Keep every rational coefficient place over characteristic-zero bases. Add the equal-characteristic Fermat cubic above as a negative-control Check. The existing source does not authorize this extension: DMOS82 line 2312 separates ℓ from the reduction characteristic, and lines 2317–2321 use smooth proper base change; EtaleCohomologyFoundations §F.4.5 and EtaleDualityAndPerverseSheaves §4.3 retain invertibility.

   **Repair test:** Over the same 𝔽₂₅ base with ℓ=7, the two eigenspaces each have dimension 1, giving 2. With ℓ=5 the revised statement does not apply. Over characteristic zero, ℓ=5 remains allowed. Thus the repair corrects the coefficient domain without discarding coefficient places of the number-field systems.

2. **F02** (P1) The new elliptic branch uses an unowned existence theorem

   **Location:** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:1524`, §9.7(vi), especially its application paragraph: “over `ℤ_p` with ordinary reduction … and with supersingular reduction”. Consumers are §9.11 at line 1596 and §9.12(2) at line 1618.

   **Claim:** The auxiliary construction can supply these curves for every allowed choice of its primes. Clause (vi) proves consequences for curves already given; it does not construct curves of both reduction types over ℤ_p. The proof at line 1528 cites an application of this existence assertion, not an owned theorem supplying it.

   **Witness:** `TauCetiRoadmap/EllipticCurves/README.md:716`–745 gives the dichotomy, base-change invariance and the trace criterion, not existence over every 𝔽_p. The same missing trace-zero input is explicitly requested by open PR #1692, `TauCetiRoadmap/AnticyclotomicLocalUnits/README.md:114`.

   I checked the elliptic source owner, the pinned elliptic objects and the object search over main/open roadmaps. ModularCurves' ordinary and supersingular loci supply geometric points, which need not be 𝔽_p-rational. Substituting an arbitrary finite residue extension also changes the ℚ_p hypothesis used in §9.6. ACC23 lines 8462–8468 choose curves of the two types in an application; a paper citation alone is not a supplier under this contract. No declared gap of this package supplies this existence theorem.

   **Exact repair:** Declare a minimal supplier gap on EllipticCurves Layer 3, with the same slug in the plan's top-level gaps and in Exact supplier contracts: for every prime p≥5 and f∈{0,1}, there exists an elliptic curve over 𝔽_p of geometric p-rank f. Cite that contract in §9.7 and its consumers. Explain that lifting a nonsingular Weierstrass equation to ℤ_p gives a curve with unit discriminant and the requested good reduction. Use a primary locator for this existence input; do not replace it by a restriction to selected congruence classes of p. The standing auxiliary-prime bounds already imply p,r≥5.

   **Repair test:** At p=13, y²=x³−x has 8 points, trace 6, hence p-rank 1; y²=x³+x+4 has 14 points, trace 0, hence p-rank 0. Their discriminants are nonzero modulo 13 and the same equations lift to ℤ₁₃. The familiar alternatives j=1728 and j=0 are both ordinary at 13: the latter has 12 points, trace 2. Thus choosing one of those two fixed equations is not the missing general theorem. Once the gap is declared, §9.7(vi) supplies the torsion trivializations and component comparison on these actual local curves.

3. **F03** (P3) The local-constancy Check uses a torsor as a module

   **Location:** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:1506`, §9.5: “the sheaf of square roots of the coordinate (`ℓ = 2`, `c = 1`)”.

   **Claim:** This is an example of the theorem about lisse finite ℤ/ℓᶜ-modules.

   **Witness:** The square-root sheaf has two geometric elements interchanged by monodromy. A two-element 𝔽₂-module has a fixed zero and trivial automorphism group. At t=2 the torsor has no Galois-fixed point.

   **Exact repair:** Replace it by the rank-two permutation local system π_*𝔽₂ for π:𝔾_m→𝔾_m, z↦z², and say that its fibre is the free 𝔽₂-module on the square roots. Keep the ball 1+5ℤ₅ and the comparison with 2.

   **Repair test:** At t=1 the action on the two basis vectors is the identity and the invariant space has dimension 2. At t=2 the quadratic Galois element acts by [[0,1],[1,0]], with invariant dimension 1. Every element of 1+5ℤ₅ is a square by Hensel's lemma, so all those fibres have the first action. This is a discriminating Check on the stated module carrier.

4. **F04** (P3) Two Qian references name a nonexistent definition

   **Location:** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:202` (§0.4) and line 828 (§4.7): “after Definition 3.6, arXiv v1 p. 15”.

   **Claim:** This is the locator for Qian's residual absolute-irreducibility argument.

   **Witness:** QIAN23 lines 673–681 contain that argument immediately before Lemma 3.6, which starts at line 682. There is no Definition 3.6 at this locator.

   **Exact repair:** In both places write “the paragraph preceding Lemma 3.6, arXiv v1 p. 15”. Retain Beukers–Heckman Proposition 3.3 for the complex statement and HypergeometricMotives §3.4 for the arbitrary-field input.

   **Repair test:** The corrected locator reaches the block argument: the rank-one displacement vanishes on one block, forcing a common eigenvalue, whereas the zero and infinity spectra are disjoint. This is exactly the argument used by both targets.

5. **F05** (P3) The finite étale carrier ownership has changed

   **Location:** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:84`: “the finite étale carrier on which that section builds is that roadmap's own”.

   **Claim:** EtaleCohomologyFoundations owns the finite étale carrier consumed through §F.0.2.

   **Witness:** At the pin, `TauCeti/AlgebraicGeometry/FiniteEtale/Basic.lean:66` defines `TauCeti.FiniteEtaleScheme`. On main, `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:203`–206 expressly consumes this carrier.

   **Exact repair:** Replace the ownership clause by the pinned carrier name and module. Keep the two §F.0.2 Galois-category and monodromy equivalences as supplier targets. Add the carrier to the Tau Ceti contract if needed; it need not be imported into Suggested.lean, which does not use it.

   **Repair test:** The native carrier is the full subcategory of `Over X` cut out by finite and étale structural morphisms; the identity cover of Spec ℚ is included. It supplies neither a geometric fibre functor nor the lisse-monodromy equivalence. Those remain precisely the additional §F.0.2 inputs. This correction does not make the geometric headlines statable at the pins.

Five findings: one P1, one P2 and three P3. The acceptance file elaborates. The dependency check passes. The findings concern the README, not a failure of Lean elaboration.

## Verified sound

### Previous findings, checked first

The previous review had four findings, F01–F04. None was marked not actionable in the repair report.

| Previous finding | Repaired passage in this package | Status and recomputation |
|---|---|---|
| F01: missing second switch at m=2 | README:1612–1618, “The second auxiliary system `S_UA`”; “If `(n, m) = (1, 2)`: then `S_aux = R_aux`.” | Repaired as to the missing endpoint. The nm>2 branch now uses either first-stage supplier; the boundary uses level pq. For (3,2), weights {0,2,4}+{0,1}={0,…,5}, determinant ε⁻¹⁵; for (1,2), rank 2 and determinant ε⁻¹. The new local existence input is R02, not a repetition of the missing-endpoint finding. |
| F02: rank-zero multiplier nonexistence | README:238, “the equation does not determine the multiplier uniquely”. | Repaired. Over 𝔽₉/𝔽₃, a=1 and a=2 give the same empty matrix. Over 𝔽₄/𝔽₂ there is only one unit; at positive rank M=1 forces a=1. |
| F03: reversed wrap count | README:1207, “with `w` wrapping entries … `G` changes by `1 − w`”; line 1213 gives both steps. | Repaired. Representatives (2,1,1,1,5), (3,2,2,2,1), (4,3,3,3,2) have sums 10,10,15; wraps 1,0 give grade differences 0,1. |
| F04: prescribed CM infinity type unowned | README:128, “What GlobalNumberFields must provide (gap:cm-hecke-characters-with-prescribed-infinity-type)”. | Repaired. Identical slug, owner, section and needs in design/plan.json. BLGGT14 lines 4110–4130 supply the character-extension input; the contract imposes constant conjugate pair sums, not an unsupported finite conductor bound. For m=3 the seed weights 0,1,2 pair to the common sum 2. Finite local corrections and determinant roots retain separate suppliers. |

The repair pass covered the changed Summary, §0.5 Check, §7.2 proof and Check, the new infinity-type contract and §9.8, the general form and Check in §9.5, the new §9.7(vi), and §§9.10–9.12. I also searched the rest of the package for the same rank-zero, wrap-count, missing-type, rank-two and determinant-duality patterns. The old m>2 construction is now explicitly only the first stage; the Summary and module docstring name the new common endpoint.

### Principles, shape and review coverage

Read the package's 84 numbered targets, all 84 Needs lines, their API and Checks, ten layer summaries, ten Examples sections and ten Dependencies sections. Each numbered target has at least three Checks. The earlier computed adversarial rows were used for unchanged material only; a bare earlier assertion of soundness was not treated as a computed test. Fresh calculations included all newly changed mathematical passages and the seeded sample. The table below records the sampled targets, headlines and every finding's affected object; it is not a proof by finite testing.

The opening states where PotentialAutomorphyInfrastructure stops. The layers are organized by the dependency chain from finite groups through geometric families, monodromy, determinants and local properties to switching, rather than by a source's chapters. The general finite-group and hypergeometric inputs are retained, including small-rank exceptions and all rational coefficient places in characteristic zero. R01 concerns a different distinction: coefficient characteristic versus the characteristic of a geometric base.

No copied passage, executable algorithm, forbidden supplier, sorry'd data, `set_option`, admitted example, process narrative, machine path or HTML anchor was found in the roadmap text or Lean acceptance file. README/Lean identifiers were compared: the five finite-data declarations and five theorem declarations are all represented in the README; prospective supplier names were resolved as supplier targets, not falsely demanded from the acceptance file. README shape was compared with main's EllipticCurves, ModularCurves and ClassicalArithmeticCompletion.

### Computed adversarial evidence

“Inherited” below means a computed row in the previous report for unchanged mathematics, read and checked against the present text. Other numerical entries were recomputed in this review. Tests of deep group statements check determinants, spectra, fields and exclusions; they do not pretend to enumerate their enormous groups.

| Statement | Instances and values computed on both sides | Result / change |
|---|---|---|
| §0.2, sampled companion displacement | p=(X−1)², q=(X−2)(X−4): C(p)=[[0,−1],[1,2]], C(q)=[[0,−8],[1,6]]. C(q)C(p)⁻¹−I=[[7,0],[−4,0]], rank 1, second column 0. With p=q, rank 0. | First-column orientation and distinctness correct. |
| §§0.3–0.4, sampled irreducibility | Reduce these matrices modulo 7. C(p)'s only eigenline is span(1,6); C(q)(1,6)=(1,2), outside it. The spectra are {1} and {2,4}, intersection empty. For q=p the line is invariant and the group is reducible. | Disjoint-spectrum hypothesis discriminates; locator R04. |
| §0.5, repaired multiplier | Rank 0 over 𝔽₉/𝔽₃: M†M=aI is the empty matrix for a=1,2. Rank 1, M=1: 1=a. | Uniqueness repair passes. |
| §§0.5–0.9, classical groups | Inherited counts #U₂(3)=96, #SU₂(3)=24; diag(i,1), i²=−1, has multiplier 1, determinant i. Norm(i)=1, Norm(1+i)=2; B(1,i)=−i and B(i,1)=i. #SL₂(3)=24, abelianization order 3. | Determinant, slot convention and small-group exclusions retained. |
| §0.11, sampled transvection classification | Exceptional rank-two SL₂(5) has order 120; SL₂(9) has order 720. Upper unitriangular 3×3 matrices fix a line of dimension 1<3. | Rank-two exception and absolute-irreducibility condition are essential. Original ZS76 remains uncertified. |
| §§0.10,0.12, quotient obstruction | Diagonal S₃ has 6 elements; S₃×S₃ has 36. PSL₂(4) and PSL₂(5) both have order 60, but characteristic 2 is excluded. | Surjective projections alone do not imply product; exceptions retained. |
| §1.1, auxiliary modulus | 3 mod 35 has order lcm(4,6)=12, and 3⁶=29 mod 35, not 34. For 2 mod 7, order 3; the even-order test does not apply. | Composite-modulus and dyadic-prime cases work. |
| §§1.2–1.3, pencil and symmetries | N=3: at t=0 gradient 3(x²,y²,z²) cannot vanish projectively when 3 is invertible; at t=1, [1:1:1] is singular. #H=9, #H₀=3, quotient order 3. | Smooth locus and group quotient agree. |
| §§1.4–1.5, finite definitions | (N,n)=(401,3): B={1,2,398}, sum 0 mod 401, stabilizer {1}; (503,4): B={1,2,3,497}, sum 0, stabilizer {1}. Self-dual (7,4): B={2,3,4,5}, sum 0, stabilizer {1,6}. | Real bodies distinguish asymmetric and self-dual data. Rank bounds exclude truncated interval endpoints. |
| §1.6, sampled quotient | N=3,t=2,t′=8: t′⁻¹(tX₃)³=X₃³; the quotient RHS becomes 6X₁X₂X₃. t=0 maps to the excluded puncture. | Coordinate map and its restricted domain correct. |
| §2.1, sampled cohomology | Fermat cubic, char 0: characters 111,222 give 1+1=2 and grades 0,1; character 120 gives 0. Over 𝔽₂₅ with ℓ=5: actual dimension 0 versus asserted 2. | R01. For ℓ=7 the dimension is 2. |
| §§2.2–2.7, realizations | Fermat quintic rank ((4⁵−4)/5)=204. For N=5,a=(1,0,0,0,4), B={2,3} has size 2. A rational projector at λ over N still has e²=e because N is invertible in M_λ, although not in O_{M_λ}. | Integral/rational distinction and rank formula retained on the corrected étale domain. |
| §§3.1–3.4, comparison carriers | n=1 convolution shift 0; n=2 shift 1 supplies a minus sign. J₂−I has rank 1 and square 0. Non-zero-shaped (1,2,2,0,0) at N=5 has rank 2 but two singleton infinity blocks. | Zero-shaped hypothesis excludes the plausible wrong hypergeometric model. |
| §3.5, sampled comparison character | N=401,n=3: wt(V)=399, wt(E)=2, wt(Ψ)=397; wt(ΨcΨ)=794=−2(−397). N=5,n=2: det weight 6=2·3. Printed source exponent would give 796 in the first case. | Corrected twist 2−N and exponent n+1−N pass. |
| §§4.1–4.3, conventions | With p₀=(12),p₁=(23), γ₁=p₀⁻¹p₁p₀=(13), γ₀γ₁γ∞=1. For a transvection T=I+E₁₂, (T−I)²=0 and rank(T−I)=1. | Nonabelian loop-order test and nilpotence agree with suppliers. |
| §§4.4–4.6, sampled infinity/headline | J₃−I has successive ranks 2,1,0; I₃−I has 0,0,0. In characteristic 3, J₃³=I but nilpotence index remains 3. A scalar ζ_N I has Nth power I without being unipotent. | Single-block and quotient-cover distinction explicit; source proof gap is not copied. |
| §4.7, sampled residual irreducibility | N=401,ℓ=5: ord₄₀₁(5)=25 and exponents {1,2,398} exclude 0, so spectrum misses {1}. Reducing ζ₁₅ at 3 instead leaves order 5; ζ₉ leaves order 1. | λ∤N is essential; R04 only corrects locator. |
| §5.1, Lean SL headline | N=401,n=3,ℓ=5: order 25 is odd, so −1 is absent; sum B=401 gives det h₀=ζ⁴⁰¹=1, det h∞=1. n=2 fails 2<n. | Correct field, determinant and rank domain. |
| §5.2, Lean Sp headline | N=7,n=4: B={2,3,4,5}=−B, sum 14≡0. With ζ of order 7 in 𝔽₂₉, ζ+ζ⁻¹ generates 𝔽₂₉. n=2 means m=1 and is excluded by 1<m. | Trace field and even-dimensional carrier match prose. |
| §5.3, Lean SU headline | ord₄₀₁(3)=400 and 3²⁰⁰=−1. Small group comparison: #SU₃(3)=27·8·28=6048, #U₃(3)=24192. | Inverting automorphism and determinant-one condition discriminate SU from U. |
| §5.4, Lean two-prime headline | N=401, primes 5 and 3209: residue degrees 25 and 1, max=3209>10. Each generated group has determinant 1; a diagonal subgroup would have order #H, not (#H)². | Product conclusion needs quotient obstruction, not only projections. |
| §5.5, sampled full monodromy | Inherited N=603,n=3,ℓ=7237: centre order gcd(3,7236)=3 but abelianization order 1. Therefore the cyclic-cover quotient has order 1. | Perfectness is the correct argument; centre divisibility is not substituted. |
| §§5.6–5.12, geometric headlines | Inherited rank-two N=5,ℓ=3 companion group order 720, not exceptional 120. Paired rank-two fibre over 𝔽₁₁ has 1320 isometries with its induced determinant trivialization; rescale only that trivialization by 2 and there are 0. | Small-rank exception and pairing/determinant compatibility retained. |
| §6.1, Frobenius normalization | Fermat cubic over 𝔽₇: 9 points, trace −1, determinant 7; roots of X²+X+7 have sum −1 and product 7. | Geometric Frobenius and Gauss normalization agree. |
| §6.2, sampled Lean Gauss headline | q=7,N=3,a=0,n=2: LHS=7³=343, RHS=7²·7=343. q=11,N=5,a=(1,0,0,0,4): LHS=11⁵=161051, RHS=11²·11³=161051. Direct complex sums agree within 2×10⁻⁹. N=1,n=0 gives 1=1. | Sign, pairing and natural-number exponent pass. This is a general identity, not boundary padding. |
| §§6.3–6.8, determinant descent | Rank-two self-dual N=5,q=11: raw Gauss product 11⁵, multiply q⁻² to get determinant 11³=1331. Cubing on 𝔽₉× has inverse exponent 3 since 3·3≡1 mod 8. Cubes in 𝔽₇×={1,6}. | Distinguishes raw product from determinant and actual root containment from exponent divisibility. |
| §§7.1–7.4, repaired Hodge grades | N=5 representatives at d=1,2,3 have sums 10,10,15 and grades 1,1,2. Qian grades: (401,3)→198,199,200; (503,4)→248,…,251; (601,5)→297,…,301. | Wrap repair and consecutive-grade counts pass; Tate(1) shifts cohomological weights by −1. |
| §§7.5–7.9, local headlines | Rank-three weights 198,199,200 minus 198 give 0,1,2. Residue degree 2: φ² valuations 0,2,4 divided by 2 give 0,1,2. p=5,m=2: exponents −2,−10 mod 24 sum −12. | Twist, absolute-residue-degree and cohomological inertia conventions agree. |
| §§7.10–7.13, local/compatible headlines | N_op=E₁₂, d=2: dN_op≠0, square 0, kernel dimension 1. Generic descending slopes 2,1,0 have prefixes 2,3,3; candidate special 3/2,3/2,0 has 3/2,3,3. J₂ and I₂ share (X−1)² but only I₂ is semisimple. | Specialization direction, full monodromy and semisimplification are separately retained. |
| §8.1, sampled ordinarity | φ=diag(p,p²), Ne₂=e₁, jumps 0,3 on line e₁+e₂: t_N=t_H=3; on stable line e₁, t_H=0<1=t_N. Maximal N holds, but slopes 1,2 do not match weights 0,3. | Consecutive-weight hypothesis excludes the source's false general criterion. |
| §9.1, sampled switching data | n=ℓ=3: m=1; cubing on 𝔽₃× is bijective although 3∤2. For F₀=ℚ(√6), L₁=ℚ(√2), L₂=ℚ(√3), each intersection with F₀ has degree 1 but the compositum intersection has degree 2. | Prime-to-ℓ exponent and sequential avoidance enlargement are necessary and present. |
| §§9.2–9.4, switching headlines | v_ℓ(1/ℓ)=−1; v_ℓ′(ℓ′)=1. Rank-two real conjugation diag(1,−1) has multiplier −1 and eigenspace dimensions 1,1. Res of a line over a separable quadratic extension has geometric dimension 2, not 1. | Local directions, real pairing and Weil restriction dimensions pass. |
| §9.5, changed general Check | Squares in 𝔽₅× are {1,4}; 1 is split and 2 is nonsplit. A two-element 𝔽₂-module has automorphism group order 1, but the torsor monodromy has order 2. Correct permutation module has invariant dimensions 2 and 1. | R03. |
| §§9.6–9.7, sampled local data | y²=x³−x has #E(𝔽₅)=8, trace −2, ordinary; #E(𝔽₇)=8, trace 0, supersingular. At m=p+1, ω₂ᵐ extends to level one and induction is reducible, outside m≤p−1. | Reduction/sign Check passes. Uniform existence of both local types requires R02. |
| §9.8, repaired CM seed | m=3: rank 3, weights 0,1,2 and conjugate pair sums 2,2,2; determinant exponent −3. m=2: rank 2, weights 0,1, exponent −1. | Declared compatible-infinity-type input is correctly used. |
| §§9.10–9.12, auxiliary headlines | (n,m)=(2,3): weights 0,…,5, determinant ε⁻¹⁵, tensor form Hermitian before rescaling. (3,2): same weights/determinant, tensor already skew-Hermitian. (1,2): rank 2, weights 0,1, determinant ε⁻¹. | Both stages and rank-two boundary now stated; R02 concerns local inputs. |
| §§9.11–9.12, level duality | Cyclotomic value 2 mod 5: det A[5]=2; det H¹=2⁻¹=3. Dualizing the seed changes 3 back to 2. | The twisted curve receives the correct dual representation. |
| Exact supplier contract, finite étale carrier | Identity Spec ℚ→Spec ℚ is finite étale, so satisfies the two native carrier predicates. These predicates contain no fibre-functor or monodromy equivalence. | R05 corrects ownership, not the required additional mathematics. |

### Seeded source verification

All fifteen seeded targets were checked at the cited locators in the readable cached versions, with the settled original-source limitations below. QIAN23 is arXiv v1; BCGNT25 is arXiv v3; QIAN21 and ACAMPO24 are arXiv v1. Manifest version notes distinguish these from published numbering. No new source fetch or manifest change was necessary. The manifest has twenty distinct works: fourteen certified entries and six settled uncertified entries. No additional author-flagged unread locator in a readable work was left unexamined.

| Seeded target | Source text opened | Result |
|---|---|---|
| 0.2 Companion difference | QIAN23 lines 628–666, Lemma 3.4, p.14; BLGHT11 lines 1159–1177, Corollary 4.4, p.32; BH89 lines 287–304, Theorem 3.5, pp.331–332 | Column-companion orientation and rank-one displacement agree. The generic theorem is imported from HypergeometricMotives §3.4(iv). |
| 0.4 Irreducibility | BH89 lines 280–285, Proposition 3.3, p.331; QIAN23 lines 673–681, p.15 | Complex source plus arbitrary-field supplier supports the argument; R04 fixes the Qian locator. |
| 0.11 Transvection classification | QIAN23 lines 682–715, proof of Lemma 3.6, pp.15–16; BLGHT11 lines 1182–1227, Lemma 4.6, pp.32–33; DICKSON01 lines 10079–10112, XII §260, pp.285–286 | Read applications and rank-two subgroup list. The general ZS76 original is uncertified; it was not silently certified through the applications. |
| 1.6 Quotient family | QIAN23 lines 563–570, §3, p.12 | Equation, t↦tᴺ and coordinate rescaling agree; the map excludes t=0. |
| 2.1 Fermat cohomology | DMOS82 lines 2098–2104, 2142 onward, 2176 onward, §7 Propositions 7.4 and 7.6, pp.46–47; lines 2312–2321, Proposition 7.10, p.50 | Character/Hodge formula supported. Positive-characteristic étale extension needs R01. |
| 3.5 Comparison characters | BCGNT25 lines 2029–2067, Theorem 4.2.1 and Lemma 4.2.4, pp.41–42; KATZ09 lines 493–513, Theorem 5.3 and Remark 5.4, pp.96–97 | Roadmap corrects the source's duality twist and weight; calculation above verifies the correction. |
| 4.4 Infinity unipotence | QIAN23 lines 600–623, Lemma 3.3(2), pp.13–14; BLGHT11 lines 1107–1141, Lemma 4.3(3), p.31; KATZ09 lines 1234–1264, Lemma 8.8, p.114 | The quotient issue is explicitly handled via the comparison and local monodromy input; the invariant-piece Katz lemma alone is not treated as the general eigenpiece theorem. KATZ90 remains uncertified. |
| 4.7 Residual irreducibility | QIAN23 lines 673–681, p.15; BLGHT11 lines 1185–1189, proof of Lemma 4.6, p.32 | Prime-to-N reduction and disjoint spectra support the statement. R04 corrects locator. |
| 5.1 Qian SL group | QIAN23 lines 682–715, Lemma 3.6 and proof, pp.15–16 | Rank>2, field generated by ζ and non-inversion condition retained. The finite-field theorem is a genuine headline. |
| 5.2 Symplectic group | BLGHT11 lines 1182–1227, Lemma 4.6 and proof, pp.32–33 | Trace field, interval stabilizer and n>2 branch support the algebraic formulation. Rank two is handled separately by §5.6. |
| 5.5 Full SL monodromy | QIAN23 lines 682–725, Lemma 3.6, pp.15–16 | The cyclic pullback uses the owned/imported perfectness statement, correcting a potentially misleading composition-factor shortcut. |
| 6.2 Gauss determinant | QIAN23 lines 764–841, Lemma 3.8 and (3.1), pp.16–17 | Raw product, q⁻ⁿ factor and odd-N pairing agree. General integral-domain statement uses the pinned character-sum API. |
| 8.1 Near-infinity ordinarity | QIAN23 lines 1010–1041, Lemma 3.10, pp.20–21; QIAN21 lines 52–59 and 918–926, Theorem 1.1 p.2 and Lemma 4.2 p.20 | Roadmap retains consecutive weights and all conjugate monodromy conditions; the two source overclaims are not adopted. |
| 9.1 Switching data | QIAN23 lines 1043–1156, §4, pp.21–23 | Source gives the construction; roadmap supplies the fixed-field root argument, correct cyclotomic sign and sequential avoidance, with named suppliers. |
| 9.7 Local points | BCGNT25 lines 3255–3293, proof of Theorem 6.2.4, pp.65–66; ACC23 lines 8446–8478, proof of Theorem 7.1.11, pp.1104–1105 | Dwork local conditions and elliptic application read. ACC's choice of local curves does not supply the missing roadmap existence input, R02. |

For the changes, BLGGT14 lines 4110–4130 (Lemma A.2.4, arXiv v4 p.88) and BCGNT25 lines 3160–3344 (Theorem 6.2.4 and proof, pp.64–67) were read through the CM seed and both switches. The m=2 alternative is left to the reader in the source; the package now actually states both resulting constructions.

### Pinned APIs, duplication and headline coverage

The following are representative exact declaration sites opened at the pins; the comparison used their types and surrounding hypotheses, not name matching alone. Paths in this table are relative to the respective library repository.

| Object/declaration | Pinned file and line; relevant content |
|---|---|
| Linear-map transvection, transvection/dilatransvection sets | `Mathlib/LinearAlgebra/Transvection/Basic.lean:56`, :223, :270: x↦x+f(x)v; the sets allow identity. |
| Rank characterization and fixed quotient | Same file :408 and :426: finite-dimensional displacement rank ≤1; fixedReduce criterion. |
| Base change and determinant | Same file :527, :533, determinant section :550 onward and `LinearEquiv.transvection.det_eq_one` :674. Field/module and scalar-tower hypotheses retained. |
| Dieudonné generation | `Mathlib/LinearAlgebra/Transvection/Generation.lean:487`: non-exceptional hypothesis and finrank−1 exponent. |
| Elementary matrix factorization | `Mathlib/LinearAlgebra/Matrix/Transvection.lean:81`, :674; `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:699`: determinant-one diagonal factor remains. |
| Centre of SL | `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:297`: roots of unity of order max(card n,1), specializing to n for positive rank. |
| Goursat; Iwasawa | `Mathlib/GroupTheory/Goursat.lean:131`; `Mathlib/GroupTheory/GroupAction/Iwasawa.lean:83`: the latter requires perfectness and the action hypotheses. |
| U and SU | `Mathlib/LinearAlgebra/UnitaryGroup.lean:105`, :121, :278, :285: star-unitarity plus the independent determinant-one condition. |
| Sp | `Mathlib/LinearAlgebra/SymplecticGroup.lean:102`: AJAᵀ=J on the sum index type. |
| Hermitian-slot and nondegeneracy vocabulary | `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean:149`, :525: first variable semilinear; separating-left excludes a nonzero vector orthogonal to everything. |
| Norm and trace | `Mathlib/FieldTheory/Finite/GaloisField.lean:219`; `Mathlib/RingTheory/Trace/Basic.lean:519`: finite-field norm surjectivity; finite separable trace surjectivity. |
| Frobenius and order | `Mathlib/FieldTheory/Finite/Basic.lean:448`, :525: Frobenius iterate and `ZMod.pow_totient`. |
| Hilbert 90 | `Mathlib/RepresentationTheory/Homological/GroupCohomology/Hilbert90.lean:84`: finite field extension and actual multiplicative cocycle. |
| Gauss/Jacobi sums | `Mathlib/NumberTheory/GaussSum.lean:72`, :76, :200; `Mathlib/NumberTheory/JacobiSum/Basic.lean:48`: positive sum convention; product identity requires nontrivial multiplicative and primitive additive characters. |
| Henselian input | `Mathlib/RingTheory/Henselian.lean:154`: completeness at a specified ideal implies henselianity at that ideal. |
| Rank-two companion | `TauCeti/LinearAlgebra/Matrix/RationalCanonicalFormFinTwo.lean:69`: [[0,−d],[1,t]]. |
| SL generation/perfectness | `TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Transvection.lean:600`; `Perfect.lean:102`, :116: all-rank generation, field-cardinality or rank hypotheses for perfectness. |
| PSL simplicity | `TauCeti/LinearAlgebra/Projectivization/PSL/Simple.lean:127`, :142: rank≥3, or nontrivial index type and at least four field elements. |
| Finite étale carrier | `TauCeti/AlgebraicGeometry/FiniteEtale/Basic.lean:66`: finite/étale full subcategory, with no π₁ action built into the carrier. R05. |

The native matrix groups, general character sums and general generation theorems do not identify the particular two-generator hypergeometric groups or prove the zero-shaped Gauss product. The library near-match leads were compared with these objects: no one-line library proof of the five acceptance headlines was found. Searches for the relative cohomological realizations, Dwork eigen-local-systems, crystalline/Weil–Deligne comparison functors and compatible-system carriers did not reveal the missing geometric interfaces claimed in the module docstring. Analytic hypergeometric functions and Dwork operators on power series are different objects.

The Summary's endpoints were compared with Suggested.lean:

| Headline | Acceptance-file coverage |
|---|---|
| Residual hypergeometric SL, Sp, SU and two-prime product | Four native finite-field/matrix theorems, lines 93,112,132,151. |
| Fermat determinant as a Gauss product | Native finite-data identity at line 186; the cohomological Frobenius interpretation needs the geometric realization. |
| Katz comparison, maximal complex monodromy, full geometric residual image and irreducible level torsors | Individually named in the module docstring, lines 27–34; relative cohomology, eigensheaves, convolution and monodromy actions are missing. |
| Consecutive labelled Hodge weights, de Rham/crystalline/ordinary/Steinberg properties, Hecke comparison and compatible Dwork systems | Individually named at lines 35–41; period and comparison functors and compatible-family carriers are missing. |
| Qian and symplectic switching; R_aux and S_UA for n≥1,m≥2 | Named at lines 42–45, including §§9.10–9.12; geometric torsors, twisted modular curves and Moret-Bailly interfaces are missing. |

The arithmetic grade-count formula is not used as a substitute for the geometric Hodge theorem. No statable geometric headline was found omitted, and no free-predicate stand-in was used.

The requested elaboration, run from the pinned content checkout on the package's Suggested.lean, exited 0. Its only warnings were the five `sorry` warnings at lines 93,112,132,151,186. There is a single `import Mathlib` and no Tau Ceti import, so no missing object-file build was needed. A scratch copy with `#check @name` for every declaration (and the injectivity structure field) also elaborated. All ten declaration types were compared with the README: no field, finite-field, prime, characteristic, domain or nonzero-N binder was lost. The five headlines have explicit hypotheses, including the generated field, rank-one displacement and exact characteristic polynomials.

For every one of the five sorried theorems, separate copies were tried with `simp`, `rfl` and `infer_instance`. All fifteen attempts failed: respectively no simplification progress, non-reflexive goals, and non-typeclass propositions. An additional exact-lemma probe with `gaussSum_mul_gaussSum_eq_card` did not close the Gauss identity; its native two-factor conclusion is not the indexed product theorem. No declaration restates a definition, computes only a small value, mirrors a Check or treats only a boundary case. No padding finding is raised. All Lean processes finished.

### Supplier resolution and ownership against open work

I read the board package index before making absence claims. Its three other indexed packages are AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory; none claims the local elliptic existence or Dwork-family objects at issue. The supplied open-head index, `roadmaps show`, `roadmaps grep`, citation leads and overlaps report were used for the current supplier and ownership audit. No conflicting head, dropped cited id or revision-only numbering was reported by the overlap check.

The closest open roadmaps were compared by object:

- PR #1716, `TauCetiRoadmap/HypergeometricMotives/README.md:961`, :996, :1042: companion/Levelt theory is imported; this package's Dwork eigensheaves and residual image theorems are additional objects. Its first-column translation is explicitly a variant of the supplied normal form.
- PR #1180, `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md:941`, :962, :985, :1005, :1044, :1120: pointwise projectors, semistable models, ordinarity criterion, ordinary subquotients, paired self-dual torsors and elliptic prime selection are suppliers, not reconstructed here. Rational all-place sheaves and the more general residual switching construction are distinguished in Scope.
- PR #1081, `TauCetiRoadmap/PotentialAutomorphyInfrastructure/README.md:27`, :1044: leaves Dwork witnesses to their own owner and supplies §2.20's density-one rank-two theorem.
- PR #1075, `TauCetiRoadmap/PotentialModularityAndCompatibleSystems/README.md:95`, :302, :789, :815, :823, :837, :855: family operations, character avatars, finite local character extension, soluble local fields and specialization are imported.
- PR #2135, `TauCetiRoadmap/PotentialAutomorphyInfrastructurePartII/README.md:66`–67: consumes this package's §9.4 and adds automorphic conclusions. This package does not cite it upwards as a supplier.

The additional elliptic search located PR #1692's declared supplier gap (R02); it did not justify silently treating the missing theorem as supplied. General finite-field abelian-variety classification in later open work is not an admissible upward replacement for an EllipticCurves contract.

Every supplier citation was resolved afresh to main or the permitted open head. The following ledger records the sections and representative exact locations read; numbers refer to each named roadmap's README, not a snapshot wrapper.

| Supplier | Resolved interface and location |
|---|---|
| ClassicalArithmeticCompletion | §§2.46 at line 3775 and 2.60 at 4188: companion, minimal/characteristic polynomial. |
| HypergeometricMotives | §§3.1 at 961, 3.2 at 996, 3.4 at 1042: cyclicity, triple, arbitrary-field Levelt theorem and orientation adapter. |
| EtaleCohomologyFoundations | F.0.2 at 200, F.0.A2 at 368, F.2.1 at 504, F.2.4–F.2.7, F.3, F.4.2 at 979, F.4.5 at 1041, F.6: monodromy, arithmetic sequence, base change, supports, realization and purity. Carrier attribution needs R05. |
| ComplexComparisonPartII | C5.2, relative Betti comparison at 3422; C5.3, properPureHodge at 3663 and relativeHodgeBundles at 3683; C6.5 at 5045 and C6.6 at 5143. The supplied Hodge bundle statement even allows nonreduced bases. |
| InverseGaloisAndArithmeticFundamentalGroups | IG.0.T2 at 531 and IG.0.T3 at 566: finite and rational trace; IG.1.3 at 1168: specialization, including the tame boundary hypotheses. |
| DeligneWeightsAndPurity | §§0.1 at 560, 3.2 at 1202, 7.15 at 2308, 8.19 at 2718: Weil numbers, constant descent, purity and geometric semisimplicity. |
| EtaleDualityAndPerverseSheaves | §§0.5 at 668, 0.6 at 821, 4.3 at 4218: duality and complete-intersection statements, including (a),(c),(d),(e). The characteristic restriction is explicit, supporting R01. |
| LefschetzPencilsAndVanishingCycles | §§0.5 at 544, 0.8a at 693, 1.1 at 960, 1.6 at 1241, 2.4 at 1704 (implicit-function input at 1761), 2.7 at 2080, 2.8 at 2196. Tame point specialization remains a declared gap. |
| ArithmeticGaloisRepresentations | §2.4 at 1978, monodromy specialization at 1999–2012: actual continuous representations, exp/log and tame-character scaling. |
| PadicHodgeTheory | §§3.2 at 665, 3.3 at 682, 3.4 at 705, 3.6 at 754, 6.1 at 1130, 6.4 at 1186, 8.1 at 1378, 8.2 at 1407. Signs are transported explicitly. |
| LocalGaloisDeformationRings | §1.7 ordinary flags; §6.8 at 3025, §6.19 at 3238, §6.25 at 3338: connectedness, unramified small-weight local models and weight-zero persistence. Equality of residuals alone is not the general connects theorem. |
| PadicDifferentialEquationsAndRigidCohomology | RD.2.3 at 4222, RD.3.34 at 6474, RD.3.37 at 6604, RD.3.43 at 6767, RD.5.8 at 8780, RD.7.7 at 13968. Companions are a separately declared curve gap. |
| SchemeAndStackFoundations | §§1.15 at 2604 and 1.16 at 2693: actual torsors and contracted products. |
| AbelianSchemesAndArithmeticModuli; AlgebraicModuliForArithmeticGeometry | A6.30 at 3714, A6.31 at 3735; §3.4 at 1683. Quasi-projective representability and separable splitting support the Weil restrictions used. |
| ArithmeticGaloisDuality | R02.4.6 at 4352: roots after prescribed totally real base change; the finite-field-valued deduction is owned here. |
| BelyiMaps; Chebotarev | §§5.2 at 1966 and 5.6 at 2173 give loop order/free group; Chebotarev Layer 10 at 410 gives density #C/#G. |
| ModularCurves; ModularCurvesPartII | §5C and §5.14 at 1936 respectively: rational twists and compactification. General number-field input remains the declared gap; no absent general theorem is passed off as supplied. |
| EllipticCurves | Layers 3–4, dichotomy/trace at 716–745 and local reduction at 836 onward. The missing existence input is R02. |
| GlobalNumberFields | Layers 9–10 at 508,531: characters and infinity types. The converse existence assertion is correctly a new gap, not misattributed to purity. |
| PotentialModularityAndCompatibleSystems | §§1.1,1.3,1.4,1.7,1.9,1.11 and §§2.14–2.18,2.20 resolved; finite local-character extension at 789, prescribed completions at 815, three-kind approximation at 823, preliminary field at 837, specialization at 855. |
| ModularityAndLanglandsExtensions; PotentialAutomorphyInfrastructure | §§2.9–2.12,2.14,2.18 and §2.20 respectively, at the locations in the ownership comparison above. |

All four declared gap slugs match the plan and README: `tame-point-specialization`, `curve-crystalline-companions`, `twisted-modular-curve-over-number-fields`, and `cm-hecke-characters-with-prescribed-infinity-type`. Each names an earlier supplier and a specific interface. They are not reported as unowned merely because the interface is absent today. The CM gap correctly asks only for existence with compatible infinity type; local restrictions and the exact determinant correction have their own suppliers. R02 is an additional missing contract, not a reopening of one of these four.

The prescribed dependency command exited 0 with this output:

```text
depcheck: 237 roadmaps, 2158 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. The mechanical result does not discharge the semantic missing-input finding R02. No merge-order or supplier file was edited.

## Not verifiable

- ZS76, main theorem: settled uncertified. The Qian/BLGHT applications and Dickson subgroup list were readable, but do not replace direct certification of the original general classification.
- KATZ90, Chapter 8, including Theorems 8.4.11 and 8.12.2: settled uncertified. Katz09 and the cited applications support the comparison and uses; the original local-monodromy/determinant theorem was not directly read.
- LEWIS82, §4: settled uncertified; no new request made for the Hermitian classification source.
- ARTIN55, Theorem 2: settled uncertified; no direct certification of the original non-isomorphism theorem claimed.
- KM74, Theorem 2: settled uncertified. The named roadmap's comparison contract was resolved; that is not direct reading of Katz–Messing.
- KIS99, Theorem 5.1: settled uncertified. The package's weaker finite-level constancy argument was checked independently; the stronger theorem was not certified.

These are the existing settled source limitations, not missing-text requests. No additional unavailable work was discovered. The report does not claim that finite examples prove the deep theorems or that their proofs have been formalized.

## Source issues

- **Error** in BCGNT25 at Definition 4.3.1, arXiv v3 p.45: the source says the multiplier kernel is the special unitary group; it should be the unitary group, with determinant one imposed separately for the special unitary group; affects a stated result.
- **Misprint** in BCGNT25 at Remark 4.3.3, arXiv v3 p.45: the source says trace-zero scaling gives a sign-conjugation identity without exchanging the arguments; it should be B(y,x)=−c(B(x,y)); affects a stated result.
- **Misprint** in BCGNT25 at Lemma 4.2.4 and proof, arXiv v3 pp.41–42: the source says the Dwork duality twist is 1−N, producing comparison-character weight N−n; it should be twist 2−N and comparison-character weight N−n−1; affects a stated result.
- **Error** in BCGNT25 at proof of Theorem 6.2.4, arXiv v3 p.67: the source says the first auxiliary residual image is the entire unitary similitude group; it should be the subgroup satisfying the linked cyclotomic multiplier and determinant conditions; affects the proof.
- **Gap** in BCGNT25 at proof of Theorem 6.2.4, second switch, arXiv v3 p.67: the source says the next avoidance field is B′F₅ while retaining the first auxiliary residual-image requirements; it should also protect the field cut out by the newly constructed auxiliary residual representation; affects the proof.
- **Gap** in BLGHT11 at proof of Lemma 4.6, printed pp.32–33: the source says the transvection classification yields only the three classical groups also in rank two; it should separately exclude the exceptional characteristic-three rank-two subgroup before concluding full symplectic image; affects the proof.
- **Gap** in QIAN23 at proof of Lemma 3.3(2), arXiv v1 pp.13–14: the source says semistability of the pencil proves unipotence for the quotient family's infinity monodromy; it should justify the quotient monodromy itself, since unipotence of its Nth power does not suffice; affects the proof.
- **Error** in QIAN21 at Lemma 4.2, arXiv v1 p.20: the source says maximal nilpotence of monodromy implies regular ordinarity for a semistable representation; it should retain the consecutive labelled Hodge–Tate weight hypothesis of the cited criterion; affects a stated result.
- **Error** in QIAN21 at Remark 1.2, arXiv v1 p.2: the source says a zero exponent guarantees one maximal unipotent block; it should impose the eigenpiece condition yielding one block, as zero-shaped data do; affects a stated result.
- **Error** in QIAN23 at proof of Lemma 3.8, arXiv v1 p.18: the source says one can invert ζ_N locally while fixing ζ_p; it should use the rank-two identity g(b)g(−b)=q, since the required local automorphism need not exist; affects the proof.
- **Error** in QIAN23 at §4, determinant-root construction, arXiv v1 p.22: the source says n divides the multiplicative residue-field order; it should require divisibility only by the prime-to-ℓ part of n; affects the proof.
- **Misprint** in QIAN23 at §4, symmetric-power determinant, arXiv v1 p.22: the source says the symmetric power of elliptic H¹ has positive cyclotomic determinant exponent; it should have exponent −n(n−1)/2 with the stated cohomological realization; affects the proof.
- **Misprint** in BCGNT25 at proof of Proposition 4.2.6, arXiv v3 p.45: the source says the last base-q exponent uses digit r_d; it should use r_(d−1), matching the summation tuple and the next sentence; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "9dd42e65ae660e2bc13233f3a7fe278942afb93a", "job": "REV-PKG-PotentialAutomorphyDworkMotivesPartII~5", "model": "gpt-6-astra", "worker": "chris-10"} -->
