<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13085#issuecomment-6907812295 -->
Review (claude) of c32c349

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the Check of §9.1 has no instance for even n

   **Location:** packages/GrossZagierAndArithmeticHeightsPartII/README.md:1175 (§9.1, third Check) "For n ≥ 3 a regular unipotent element of U(V_n) for which the distinguished vector is cyclic is regular semisimple for U(V_(n−1))-conjugation but not semisimple"

   **Claim:** For every n ≥ 3 the nonsplit U(V_n) has a unipotent element with a cyclic vector, which separates regular semisimple from strongly regular.

   **Witness:** n = 4. A unipotent g with a cyclic vector has one Jordan block, and then ker (g − 1)² is totally isotropic of dimension 2 (its orthogonal is im (g − 1)² = ker (g − 1)²). The nonsplit V₄ = H ⊥ ⟨1⟩ ⊥ ⟨ϖ⟩ has Witt index 1. No such g exists; the Check is vacuous for every even n.

   **Exact repair:** replace the Check by: "For odd n ≥ 3, where V_n has Witt index (n−1)/2, a unipotent element of U(V_n) with a single Jordan block for which the distinguished vector is cyclic is regular semisimple for U(V_(n−1))-conjugation but not semisimple, so it is outside the strongly regular locus; §12.10 gives one for n = 3. For even n ≥ 4 the nonsplit V_n has Witt index n/2 − 1 and no unipotent element with a single Jordan block, since ker (g − 1)^(n/2) would be totally isotropic of dimension n/2; there take g = g₁ ⊕ d on V′ ⊥ F·l, with V′ nondegenerate of dimension n − 1, g₁ unipotent with a single Jordan block on V′ and d ∈ F^1, d ≠ 1: its minimal polynomial (T − 1)^(n−1)(T − d) has degree n, so it has cyclic vectors, and it is not semisimple." Tested on the witness: at n = 4 the repaired text asserts no single-block unipotent and supplies g₁ ⊕ d with V′ of dimension 3 (odd, Witt index 1, where the matrix of §12.10 is such a g₁); a unit-norm cyclic vector u = v + l exists because the vectors v ∈ V′ of a given norm are not contained in the hyperplane ker (g₁ − 1)². At n = 3 it is the element of §12.10 (README.md:1683), which I recomputed: gᵗJg = J entry by entry.

2. **F02** (P3) three page locators are off by one page

   **Location:** README.md:154 (§0.1) "LZ §§1.7–1.8, pp. 8–10"; README.md:576 (§4.1) "LZ §§10.1–10.3, pp. 64–66"; README.md:788 (§6.2) "Definitions 2.45–2.50, pp. 28–30".

   **Claim:** The cited passages are on the stated pages.

   **Witness:** LZ line 374 is the marker of p. 10, whose first line is §1.9; §1.8 ends on p. 9. LZ line 2805 (§10.1) precedes the marker of p. 64 at line 2811. LL2 line 1461 (Definition 2.45) follows the marker of p. 29 at line 1448.

   **Exact repair:** "LZ §§1.7–1.8, pp. 8–9"; "LZ §§10.1–10.3, pp. 63–66"; "Definitions 2.45–2.50, pp. 29–30". The manifest entries for LZ and LL2 do not carry these three page ranges and need no change. Tested: with the repaired ranges every cited item lies between the page markers named (LZ lines 287–373, 2772–2926; LL2 lines 1448–1539).

3. **F03** (P3) the group AFL at n = 1 is empty, not "trivial on both sides", and §9.1 does not say n ≥ 2

   **Location:** README.md:1162 (§9.1) "On N_(n−1) × N_n let Δ be the graph of δ: N_(n−1) → N_n"; README.md:1280 (§9.8) "For n = 1 both sides are trivial (§14.6)"; README.md:1950 (§14.5) "n = 1: the group statement is trivial"; README.md:1965 (§14.6).

   **Claim:** For n = 1 the group intersection number exists and the identity ∂Orb = −Int·log q holds with both sides trivial.

   **Witness:** PELModuliPartII §1.6 (packages/PELModuliPartII/README.md:559) defines the graph "For n≥2". The nonsplit V₁ has norms of odd valuation (§0.9), so no unit-norm u₀. README.md:1223 computes Orb(1, 1, s) = 1 ≠ 0 on S₁: no γ matches the nonsplit side.

   If the formula of §9.1 were read at n = 1 with N₀ a point over Spf O_F̆, the intersection would be all of N₁ = Spf O_F̆, of infinite length, against ∂Orb = 0: the left side is not zero, it does not exist.

   **Exact repair:** in §9.1 write "For n ≥ 2, on N_(n−1) × N_n let Δ be the graph of δ: N_(n−1) → N_n (PELModuliPartII §1.6)". In §9.8 replace "For n = 1 both sides are trivial (§14.6)." by "For n = 1 the statement is empty: the graph of §9.1 needs n ≥ 2, the nonsplit V₁ has no vector of norm one (§0.9), and every γ ∈ S₁(F₀) has Orb(γ, 1_(S₁(O_F₀))) = 1 ≠ 0 (§9.3), so no γ matches the nonsplit side." In the first Check of §14.5 replace "the group statement is trivial" by "the group statement is empty (§9.8)", and in the third Check of §14.6 replace "is trivially true for every q" by "is empty, hence true, for every q (§9.8)". Tested on the witness: at n = 1 the repaired §9.1 defines nothing, and the three remarks now agree with README.md:1223 (Orb = 1, ∂Orb = 0) and with §0.9; for n = 2 nothing changes (V₂ = V₁ ⊥ F·u₀ is nonsplit, valuation 1 + 0 odd).

Three findings, all P3, none blocking. The four findings of round 9 are repaired. The new findings come from this round's seeded targets (§§0.1, 4.1, 6.2, 9.1) and from the degenerate case n = 1 of the group AFL; each has a repair of a few words.

## Verified sound

### The four findings of round 9

| Finding | Repaired passage (README) | Status and what I checked |
|---|---|---|
| F01 §9.4 hypotheses | "Let U(V_n)° be the open subvariety … defined by det(1 − g′) ≠ 0 and 1 − d ≠ 0 … For g′ ∈ U(V_n)°(F₀) with 1 − d ∈ O_F^× … If moreover u ≠ 0, this pullback has the expected codimension" | Repaired. Z lines 927–929 (domain), 1017 (Lemma 4.4: 1 − d a unit), 1029 and 1072 (u ≠ 0), 961–968 (Lemma 4.3(i)). The Check with g′ = diag(h, d) is present. |
| F02 §12.5(c) cusp compatibility | "that is compatible with the stabilizer of the cusp, namely a(m) vanishes on the functions supported on the cosets μ + L̂ with Q(μ) ≢ m mod ℤ, and a(m)(ω_L(−1)φ) = (−1)^n·a(m)(φ)" | Repaired. Both conditions recomputed from the transformation law (rows below); two Checks; §12.7 carries the clause, worded through the projection of §12.4(b). |
| F03 §13.4 Haar measure | "the volume of K for a Haar measure … that does not depend on K, T or φ … for any fixed Haar measure dg the number c_K·vol(K, dg) has the sign (−1)^n" | Repaired. LZ lines 3633–3637 and 3815–3818. §8.3 now names the self-dual measure of the Conventions. |
| F04 §6.5 one component | "for either of the two connected components V_Λ^± ≅ ℙ¹ of the stratum of a type-four vertex lattice Λ" | Repaired. LL2 lines 1111–1128 (Proposition 2.28(2), p. 23; Remark 2.29), 1619–1621 (Lemma 2.55). §5.2's Check reads "a connected component C ≅ ℙ¹ of a type-four stratum". |

The repaired patterns in the rest of the package: a comparison stated on a larger domain than its source (none found in Layers 9 and 14); a criterion that lost a compatibility condition (§12.6a(f)(i) states both); an unspecified "fixed" measure (none: the word occurs for the Conventions' self-dual measure and for vol(GL_m(O_F₀)) = 1); a curve function attributed to a whole stratum (none: lines 708, 731, 832, 893 all say component).

### Seeded source sample (15 targets)

| Target | Passage opened | Result |
|---|---|---|
| 0.1 | LZ lines 295–373 (§§1.7–1.8, pp. 8–9), 381–427 (§§2.1–2.2, pp. 10–11) | Signature (1, n−1), source of signature (0,1), form as restated. Page range: R02. |
| 0.2 | LZ lines 428–434 (§2.3, p. 11) | Agrees: closed formal subscheme, depends on the O_F-span. |
| 0.7 | LZ lines 537–543 (Corollary 2.8.2), 555–560 (Lemma 2.9.2), 567–575 (Lemma 2.10.1, pp. 14–15), 320–321 (standing nondegeneracy, p. 8) | Agrees. The README's rank-(n−1) hypothesis is LZ's standing one, and its negative control is correct (row below). |
| 3.3 | LZ lines 1368–1392 (Definitions 6.1.1–6.1.2, Theorem 6.1.3, pp. 33–34), 1338–1358 (Corollary 5.4.6) | Agrees. |
| 4.1 | LZ lines 2775–2782 (Definition 9.1.4, p. 63), 2805–2845 (§10.1), 2849–2899 (§10.2, Definition 10.2.3), 2900–2917 (Theorem 10.3.1) | Agrees: Int_aux carries 1/(q+1), Int_Y does not. Page range: R02. |
| 6.2 | LL2 lines 682–689 (Definition 2.20, p. 15), 1461–1526 (Definitions 2.45, 2.47, 2.48, 2.50, Lemma 2.49, pp. 29–30) | Agrees: horizontal part 2·#{t(L ∩ V_L♭) = 1}, vertical by subtraction. Page range: R02. |
| 7.6 | K lines 1140–1203 (Lemma 4.4, (4.4)–(4.6), Definitions 4.5, 4.7, Remark 4.6, Lemmas 4.8–4.9, pp. 28–30) | Agrees: coefficient (1 − (−1)^(n−1))/2 for unimodular, 1 otherwise; an exceptional line. |
| 8.1 | K lines 89–150 (Definitions 1.1–1.2, (1.2)–(1.6), pp. 3–4), 1422 (Corollary 5.8, p. 35) | Agrees: factor −2, χ(I_n) = −χ(L), the three values of t_max. |
| 9.1 | Z lines 650–735 (§3.1, (3.2)–(3.8), pp. 12–13), 797–809 (Definitions 3.5–3.6, p. 14) | Agrees for n ≥ 2 (Z line 679 defines the product for n ≥ 2): R03. The Check: R01. |
| 11.4 | Z lines 2047–2063 (§7.6, (7.14)–(7.15), pp. 36–37), 2385–2421 (§9.1, (9.1)–(9.4), p. 43) | Agrees: F₁K′₀, Gr₁ ≅ Ch₁, the quotient Z_(1,c). |
| 12.1 | Z lines 2179–2199 (§8.1, (8.1)–(8.2), Theorem 8.1, p. 39) | Agrees: Z(0, φ) = −φ(0)·c₁(ω), weight-n Whittaker factors. |
| 12.4 | BHKRY lines 4615–4660 (§7.2, pp. 99–100), 4707–4753 (Theorem 7.2.1, p. 101), 4787–4801 (Theorem 7.2.4, §7.3, pp. 102–103); Bor98 line 1297 (Theorem 6.2, p. 24) | Agrees: Γ(0, 4π·|norm of the projection|), the vector-valued extension is stated as the README's own. |
| 12.9 | Z lines 2422–2436 ((9.5)–(9.7), Remark 9.1, pp. 43–44), 2644 (Corollary 10.4) | Agrees: stated by Z for F₀ = ℚ; the README restricts further to n ≥ 3. |
| 13.6 | LZ lines 3762–3787 (§15.2, p. 87), 3788–3826 (§15.3, (15.3.0.1), Theorem 15.3.1, pp. 87–88), 3827–3850 (§15.4, pp. 88–89) | Agrees: star product formula, factor ½, LZ's 2π normalization named. |
| 14.1 | Z lines 2735, 2993–3138 (§§11.3–12.4, headings), 3487–3542 (Theorem 12.14, (12.32)–(12.38)), 4141 (Theorem A.1); MZ lines 1848–1973 (§§7.1–7.3, footnote 5, pp. 33–35) | Locators exist where cited; statements read for Theorem 12.14 and (12.32)–(12.38) only. |

No locator was flagged by the author as unverified.

### Adversarial table (sampled targets, headlines, repaired passages, findings)

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| §0.1 | rank one, h(x,x) = ϖ^a; scalar a ∈ O_F | H(ax, y) = ā·H(x,y), h(ax,y) = a·h(x,y); both norms ϖ^a, dual ϖ^(−a)O_F·x | Holds |
| §0.2 | x = 0; val h(x,x) < 0; h(u,u) = 1 | Z(0) = N_n; ∅; N_(n−1) of relative dimension n − 2 = (n − 1) − 1 | Holds |
| §0.7 negative control | n = 3, V = H ⊥ ⟨ϖ⟩, L = ⟨e, a⟩, Λ_j | det = −ϖ odd; Gram of Λ_j = ϖ·(H ⊥ ⟨1⟩), Λ_j^∨ = ϖ⁻¹Λ_j, type 3, curves; infinitely many j | Holds |
| §0.9, §3.5 headline | a = 1, 3 | D = 1 − X, 1 − X + X² − X³ = (1 − X)(1 + X²); −D′(1) = 1, 2 | Holds |
| §1.3 | L♭ = ⟨y⟩, val 2 | degrees q² + q and 1; D(X) = (1 − X) + X², D(−q) = 1 + q + q²; vol⁻¹·D(−q⁻¹) = q²(1 + q⁻¹ + q⁻²) | Holds |
| §2.1 | d = 1, Fermat curve | 2g = q² − q, 1 + q² + q(q² − q) = q³ + 1; dual eigenvalues (−q)^(4j)/q^(2j) = q^(2j), (−q)^(4j−1)/q^(2j) = −q^(2j−1) | Holds |
| §2.4 | x ∈ Λ | −q²(1+q) + q³ + 1 = 1 − q²; transform −(1+q)/q + (q³+1)/q = q² − 1 | Holds |
| §3.3 | n = 2, L♭ unit, x ⊥ L♭ of valuation a | lattices ⟨y⟩ ⊥ ⟨ϖ^(−j)x⟩, 0 ≤ j ≤ (a−1)/2, each of type one, weight 1: (a+1)/2 on both sides | Holds |
| §4.1, §4.5 headline | rank one, a = 0, 2 | Int_Y = 0, 1; ∂Den_Λ = 1, q + 2 from D_Λ = (1 − X)(1 + qX) + X²(1 − X); (q+1)·1 = (q+2) − 1; Int_aux = (q+2)/(q+1) | Holds |
| §4.2 | n = 2 | E·E = ∫ c₁(O(−1)) = −1 = (−1)^(n−1) | Holds |
| §5.5, §6.8 headline | (b₁, b₂) = (0,0), (0,1), (1,1), (1,2) | 2, 4, 2(q+3), 2(2q+4); density side at (1,1), (1,3): 2, 2·2 | Holds |
| §6.2 | one eligible M | coefficient 2 = the type-two weight of §6.1 (empty product) | Holds |
| §6.5 (repair) | x ∈ Λ; transform | −q(1+q) + q² + 1 = 1 − q; −(1+q)/q + (q²+1)/q = q − 1; whole stratum 2(1 − q) | Holds |
| §6.7 Check | a = 3 example | h(u⁻¹e ± x₀) = −β + β = 0; h(e, u⁻¹e) = −βu, valuation one | Holds |
| §7.6 | n = 2, 3; K (4.9) | α = 1, 0; 2m − 1 − 2m′ = (−1)^(n−1) gives m′ = m − 1 + (1 − (−1)^(n−1))/2 | Holds |
| §8.1 | n = 2, χ(V) = −1; n = 2, χ(V) = +1 | t_max = 0, no correction; t_max = 2, one coefficient c₂ | Holds |
| §8.6 | H₁ = (0, π; −π, 0), L♭ = ⟨l₁ + πl₂⟩, x = l₂ | norm −2π₀; h(l₂, l₁+πl₂) = −π, coefficient 1/(2π); every line has norm π(ab̄ − āb) ∈ π₀O_F₀; K's minor is 1 < 2 but the normal basis of H₁ has no anisotropic vector | The README's correction of K Lemma 9.6 holds |
| §8.7 headline | I_n; H₁ | δ_odd(n) on both sides; analytic side of H₁: (1 − q) + (q+1)·0 | Holds |
| §9.1 Check (R01) | n = 3; n = 4 | n = 3: Witt index 1, the matrix of §12.10 satisfies gᵗJg = J; n = 4: Witt index 1 < 2 | Vacuous for even n: reword |
| §9.1, §9.8, §14.5, §14.6 (R03) | n = 1 | Orb(1, 1, s) = 1, ∂Orb = 0; V₁ has no unit vector; formula read at n = 1 gives Spf O_F̆ | Empty statement: reword, add n ≥ 2 |
| §9.3 | ℚ₃: γ = ((0,1),(1,0)), ((−2,1),(−3,2)), a = diag(3,1); ℚ₉: ((−4,1),(−15,4)) | shells v(t) = 0: 1; v(t) ∈ {0, −1}: 1 − 3^s; ω = η̃(1) = 1, η̃(1/3) = −1; ∂Orb = 0, −log 3, log 3 = 0 − log(1/3)·1; 1 − 9^s, −log 9 | Holds |
| §9.4 (repair) | n = 2, g′ = diag(h, d); √ε | det(1 − g′) = (1 − h)(1 − d) = (1 − d)·det(1 − g); N(√ε) = −ε; expected codimension 1 against 0 | Holds |
| §11.4 | support of dimension two | class in F₁ maps to Gr₁ ≅ CH₁: still a one-cycle | Holds |
| §12.1 | n = 1; n = 2 isotropic over ℚ | CH¹ = 0; Δ trivializes a power of ω | Holds |
| §12.4 | weight; ℚ(i)³ Check; n = 2 | (2n − 2 − 2)/2 = n − 2; x₂ = 2x₃, \|x₁\|² + 3\|x₃\|² = 1 gives x = ζe₁; multiplicities 2 and 0; weight 0 has constants | Holds |
| §12.5(c) (repair) | T; −1; two witnesses | e(m)·a(m)(1_μ) = e(Q(μ))·a(m)(1_μ); (−1)^n·i^(2−(2n−2)) = 1 so a(m) is even; Q(μ) = ½ ≢ 1; L′ = ½O_F ⊕ ½O_F ⊕ (1/6)O_F, 2μ ∉ L, Q(±μ) = −1 | Holds |
| §12.6a, §12.6b | forms; signature | x² − 3y² − 3z² anisotropic (descent mod 3); 1 + 1 + 1 − 3 = 0; [x,y] = Tr h(x,y), weight (2n−2)/2 + 1 = n | Holds |
| §12.9 headline | F₀ ≠ ℚ; n = 2 | not asserted | Holds as scoped |
| §13.4 (repair) | K′ ⊂ K of index m | vol(K′) = vol(K)/m, c_(K′) = m·c_K for every Haar measure | Holds |
| §13.6 | m = 1, 3 at n = 3; rank-one almost self-dual | bidegrees (0,0), (2,2); (q+2)/(q+1) ≠ 1 | Holds |
| §13.8, §13.10 headlines | F₀ = ℚ; \|Diff\| | excluded (an imaginary quadratic field ramifies); odd cardinality, ≥ 3 gives zero on both sides | Holds |
| §14.1 | ξ < 0 | Ei at −4πa\|ξ\| < 0, finite | Holds |
| §14.5 headline | n = 2; p = n | (a+1)/2 = 1, 2 at a = 1, 3; p = n only for n an odd prime, uses the separate target of §9.5(b) | Holds; n = 1 wording: R03 |
| gaps | four slugs | plan.json and README texts identical (4 of 4); suppliers' heads: §2.4 affine only, §3.2 unramified only, §1.8 ĈH¹ only, smooth transfer only for endoscopy | Precise, minimal, declared |

### Library, Lean and headlines

- Pins opened: `IsNonarchimedeanLocalField` (Mathlib/NumberTheory/LocalField/Basic.lean:46), `Polynomial.eval` (Mathlib/Algebra/Polynomial/Eval/Defs.lean:248), `Polynomial.derivative` (Mathlib/Algebra/Polynomial/Derivative.lean:47), `TauCeti.FormalScheme.Spf.carrier` (TauCeti/AlgebraicGeometry/FormalScheme/Spf/Carrier.lean:73), `TauCeti.FormalScheme.Spf.structureSheaf` (TauCeti/AlgebraicGeometry/FormalScheme/Spf/StructureSheaf.lean, docstring line 63). TauCeti/AlgebraicGeometry/FormalScheme has four files, all under Spf.
- By object: the pinned Tau Ceti has `Matrix.localDensity` (TauCeti/NumberTheory/IntegralLattice/LocalDensity/Basic.lean:546), "the local density `α_p(A)`, the limit of the normalized counts" of `Xᵀ A X ≡ A` for a symmetric matrix over `ℤ_[p]`. It is the automorphism density of a quadratic ℤ_p-lattice; it has no hermitian form, no quadratic extension and no density Den(M, L) of two lattices. The README's "Neither pin has hermitian local densities" stands, and no target restates it. A search of both pins for Rapoport–Zink spaces, p-divisible groups, Siegel Eisenstein series, Green currents and arithmetic Chow groups finds nothing.
- `lake env lean` on packages/GrossZagierAndArithmeticHeightsPartII/Suggested.lean from the content checkout: exit 0, no output, no warning. One `import Mathlib`, one module docstring, an empty namespace, no declaration, no `set_option`, no sorry'd data. The one-tactic probe and the `#check @name` comparison have no input: nothing is padding and nothing changed.
- Headlines (Summary and "Acceptance file"): §§3.5, 4.5, 6.8, 8.7, 13.8, 13.10, 12.9, 14.5. Each is named in the module docstring with its missing carrier. None is statable at the pins: every one needs Rapoport–Zink formal schemes or integral models of unitary Shimura varieties. No stand-in is stated.
- Backticked names: 25 distinct spans: 2 display formulas, 1 file name, 6 pinned names, 16 supplier names. All 16 resolved at the suppliers' current texts: six in GeometryOfNumbersAndQuadraticArithmetic (README:633, 706, 728, 915, 935, 939, open head), `fourierUnitVanishing` (AutomorphicFormsOnReductiveGroups README:693), seven in MetaplecticAutomorphicForms (README:405, 523, 641, 649, 1556, 1592, 1624), `ClassicalAlgebraic.supportLocalization` and `ClassicalAlgebraic.properSupports` (EtaleCohomologyFoundations README:770, 966, main). The roadmap declares no name of its own.

### Suppliers, order, gaps, overlap

- Dependency check, exact output: `depcheck: 248 roadmaps, 2349 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line. The roadmap is line 350 of the merge order; its 25 suppliers are on main or at lines 37–344.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. Resolved again by heading, at main, at the open heads and in the board package: PELModuliPartII §§0.7, 1.1–1.6, 2.1–2.5, 3.3–3.7, 4.6, 5.1–5.8, 6.1–6.8, 7.1–7.5, 7.10, 8.5, 9.1–9.9; PELModuli §§M1.3, M1.13, M3.4, M3.8, M6.1; LubinTateFormalModulesAndQuasiCanonicalLifts §§6.1, 6.2, 6.4, 6.5, 7.1; GrossZagierAndArithmeticHeights §7.2; AbelianSchemesAndArithmeticModuli §§A4.7, A4.CR.7.2; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.8, R07.1.22, R07.2.10, R07.2.20; SchemeKTheoryOperations §§6.12, 7.7; SchemeKTheoryOperationsPartII (21 sections, all headings found); QSeriesPartitionsAndMockModularForms §§8.3, 8.5, 8.6; ShimuraCompactifications §§7.3, 7.5, 7.15; MetaplecticAutomorphicForms §§2.5, 3.3a, 3.3b, 4.5, 5.1, 6.2, 6.4, 6.7; ArakelovGeometryAndAbelianHeights §§1.8–1.10; EndoscopicTransferAndUnitaryTraceComparison §§2.1, 2.4, 2.13; EndoscopicTransferAndUnitaryTraceComparisonPartII §§4.4–4.5; AutomorphicFormsOnReductiveGroups §§4.4, 5.4; MotivesAndAlgebraicCycles §§2.4, 2.7, 7.19; EtaleCohomologyFoundations §§0.7, 0.8, F.2.5, F.4.1–F.4.6; AutomorphicLFunctionsAndLocalFactors AL.0. A script over all 25 suppliers found every other cited section number in the supplier's headings.
- 107 targets, 107 *Needs* lines, 107 Checks blocks, none with fewer than three Checks.
- Ownership against open work: searched the open heads and main for Kudla–Rapoport cycles, the arithmetic fundamental lemma, arithmetic Siegel–Weil, Yuan–Zhang–Zhang, Borcherds products, regularized theta lifts and Kudla–Millson. No other roadmap owns a target of this one; the hits are suppliers naming this roadmap's sources or (SchemeKTheoryOperationsPartII README:801) naming it as a consumer. The roadmap is not on main, so there is no second copy. The overlap inventory lists no other pull request changing it, no dropped id and no id defined only by an open revision.

Overlap check: read ComplexMultiplicationAndExplicitReciprocityPartII, GrossZagierAndArithmeticHeights, MetaplecticAutomorphicForms, EndoscopicTransferAndUnitaryTraceComparisonPartII, HodgeClassesForJacquetLanglands (open, by vocabulary) and AbelianSchemesAndArithmeticModuli (main; the third list is empty); orthogonal Borcherds products: the generic-fibre product at any level with its relation in CH¹ is owned here (§12.6a(e)), the integral divisor on the model of a maximal lattice by ComplexMultiplicationAndExplicitReciprocityPartII (later in the merge order); Jacquet–Rallis orbital integrals: Zhang's formulation on S_n is owned here (§9.3), the group and Lie-algebra formulations by EndoscopicTransferAndUnitaryTraceComparisonPartII §§4.4–4.5, smooth transfer by EndoscopicTransferAndUnitaryTraceComparison through the declared gap; Grothendieck–Messing is AbelianSchemesAndArithmeticModuli §A4.CR.7.2, cited. HodgeClassesForJacquetLanglands names Kudla–Millson forms for its own theta lifts and shares no target.

### Shape, policy, sources

- Shape: summary, scope, conventions, contracts, build paragraph, 15 layers each with Examples and Dependencies, consumers, references. Pattern scan for pull-request numbers, round and job labels, machine paths, HTML and LaTeX delimiters: no hit ("lemma" occurs only in "fundamental lemma" and in source locators). No sentence says the roadmap follows a source; layer titles are mathematical.
- Full read: besides the sampled targets and the repaired passages, I read every target of Layers 0–14 this round and recomputed the Checks that carry numbers; the rows above record them. No Check contradicts a theorem of its section.
- Manifest: 24 works, 22 certified and 2 uncertified; the ids of the README's References and of the manifest coincide. The repair changed only `locator` fields of LZ, Z, LL2 and Bor99. No source was fetched and the manifest was not changed.
- Wording: 15 README passages set beside their sources (§0.1 with LZ §§1.7–2.2, §0.2 with LZ §2.3, §0.7 with LZ Lemmas 2.9.2 and 2.10.1, §3.3 with LZ Theorem 6.1.3, §4.1 with LZ §§10.1–10.2, §6.2 with LL2 Definitions 2.20 and 2.45–2.50, §7.6 with K Definitions 4.5 and 4.7, §8.1 with K Definitions 1.1–1.2, §8.6 with K Lemma 9.6, §9.1 with Z §3.1, §9.4 with Z Lemmas 4.1–4.4, §11.4 with Z §§7.6 and 9.1, §12.1 with Z §8.1, §12.4 with BHKRY §7.2, §13.6 with LZ §§15.2–15.4). None reproduces a sentence or follows one clause by clause; what is shared is formulas and lists of conditions.
- Arrangement: LZ has the largest share. Its sections 2–15 do not map one to one onto the layers: Layer 0 takes LZ §2 with part of §5.3, Layer 1 takes §4 with §5.4, Layer 2 takes §5.3 with §§6.2–6.4, Layer 3 merges §§3, 6.1, 7 and 8, and Layer 13 follows eight layers drawn from other sources. The order of Layers 0–4 is forced by the *Needs* of §3.5 (§§0.8–0.9, 1.4, 2.5, 3.3–3.4) and of §4.3 (§3.5).
- Reuse: no table, figure or list of a source is taken over.

Source independence: 15 passages compared with 5 sources (LZ, LL2, K, Z, BHKRY), none shared; largest share LZ, 61 of 263 locators; contents compared with LZ: independent.

## Not verifiable

- Lusztig76 and McGraw03 are settled as uncertified; §§2.1, 5.4 and 12.6a(f)(ii) were not read in the originals.
- In the sources, only the sampled targets, the repaired passages and §8.6 were reopened this round. For the other targets I read the README and recomputed its Checks, and for their agreement with the sources I rely on the computed rows of rounds 8 and 9. LRZ, Liu11a, ES, GS19, Mih16, Zha12, Ter13a, Ter13b, KR11, KM90, VZ84, YZZ09 and Bor99 were not opened this round.
- §14.1: Z §§11.3–12.6 were located by their headings and equation numbers; the statements were read only for Theorem 12.14 and (12.32)–(12.38).
- The text extractions lose overlines and fraction bars (Z §3.1 prints the conjugate objects without their bars). Statements were read with that in mind; the PDF pages were not opened.
- PELModuliPartII exists only as a board package; its sections resolve today and may move.
- The declared supplier gaps are contracts; only their precision, ownership and minimality were checked.
- The citation resolver did not check Lean names outside the roadmaps on this host; the six pinned names were opened by hand.

## Source issues

- **Error** in K at Lemma 9.6, p. 74: the source says every x outside L♭ ⊕ W admits a rank-(n−1) sublattice of smaller valuation with the same span; it should exclude lattices such as the hyperbolic plane with Gram (0, π; −π, 0), where no nondegenerate line has valuation below 2; affects the proof.

## For the human reviewers

- **Not tested.** Two targets, §8.6 (README.md:1124) and the q = n converse of §9.5(b) (README.md:1244), ask for proofs the cited sources do not contain; the headline §8.7 and the case p = n of §14.5 depend on them.
- **Licence.** McGraw03 is cited for its main theorem without a theorem number and no legal copy was read (packages/GrossZagierAndArithmeticHeightsPartII/sources.toml, `uncertified`).
- **Licence.** YZZ09 is read from a university archive host and LL1, LL2, Zha12 from author pages (README.md, References); the manifest records them as certified.
- **Scope.** gap:jr-afl-local-inputs has two parts under one slug (README.md:138): the unramified passage with the fundamental lemma, and smooth transfer with Weil compatibility at every place. Whether to split it is the maintainers' choice.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c32c349c434117be88bca7e6b955e0037a845958", "job": "REV-PKG-GrossZagierAndArithmeticHeightsPartII~10", "model": "fable", "worker": "chris-x89"} -->
