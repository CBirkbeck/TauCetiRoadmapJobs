<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13085#issuecomment-6903843118 -->
Review (claude) of c4ef492

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §9.4 drops two hypotheses of Zhang's comparison and narrows a third

   **Location:** packages/GrossZagierAndArithmeticHeightsPartII/README.md:1230 (§9.4) "On the open set of g′ = (h, u; w*, d) ∈ U(V_n) with det(1 − g′) and 1 − d units … its graph pullback is the ordinary expected-codimension pullback of the Rapoport–Zink graphs, and the derived projection gives Int(g′) = Int(g,u)."

   **Claim:** On the whole set where det(1 − g′) and 1 − d are units, the pullback of the graph has the expected codimension and Int(g′) = Int(g,u).

   **Witness:** n = 2, g′ = diag(h, d), h, d ∈ F^1, neither ≡ 1 mod ϖ: both quantities are units, u = 0, and the pullback of Γ_g′ to N₁ × N₁ = Spf O_F̆ is everything, codimension 0 against the expected 1. Z line 1029 (Lemma 4.4) and Z line 1072 (Proposition 4.6) assume u ≠ 0.

   In the other direction the source needs less than the README asks: Z lines 927–929 define the domain by det(1 − g′) ≠ 0 and 1 − d ≠ 0, and Z line 1017 adds only 1 − d ∈ O_F^×. The unit condition on det(1 − g′) belongs to the orbital-integral side (Z Lemma 4.11, lines 1268–1270), which §9.5 uses.

   **Exact repair:** replace the first three sentences of §9.4 by:

   "Prove the Cayley comparison. On the open subvariety of g′ = (h, u; w*, d) ∈ U(V_n) with det(1 − g′) ≠ 0 and 1 − d ≠ 0, put g = h + (1−d)⁻¹·u w* and the relative vector u/((1−d)·√ε), where ε ∈ O_F₀^× is the fixed unit with F = F₀[√ε]; together with the scalar coordinate of the inverse Cayley transform of g′ this map is an isomorphism onto an open subvariety of U(V_(n−1)) × V_(n−1) × 𝔲(1), hence birational. For such g′ over F₀ with 1 − d a unit, the pullback of the graph of g′ along (δ, δ) is the intersection of the graph of g with the pullback of Z(u). If moreover u ≠ 0, this pullback has the expected codimension, the derived pullback equals the naive one, and the derived classes agree; in particular Int(g′) = Int(g,u) for regular semisimple g′, for which u ≠ 0 holds when n ≥ 2 because u is cyclic."

   Change the locator to "(Z §§4.1–4.2; Lemmas 4.1, 4.2 and 4.4; Proposition 4.6)" and add the Check: "u ≠ 0 is needed: for n = 2 and g′ = diag(h, d) with h, d ∈ F^1 not congruent to 1, u = 0, the graph of g′ pulls back to all of N₁ × N₁ = Spf O_F̆, of codimension 0 where 1 is expected, and Z(0) is the whole space; such g′ is not regular semisimple and has no intersection number." Tested on the witness: the repaired statement asserts nothing at u = 0, and at 1 − d a unit with det(1 − g′) a nonzero nonunit it now asserts what Z Proposition 4.6 proves. §9.5 keeps its own unit conditions and needs no change.

2. **F02** (P2) the modularity criterion §12.5(c) is false without the compatibility at the cusp

   **Location:** README.md:1545 (§12.5(c)) "A formal series Σ_(m≥0) a(m)q^m with a(m) ∈ S_L^∨ ⊗ W … is the q-expansion of a holomorphic modular form of weight n for the dual representation of ω_L if and only if Σ_(m≥0) ⟨c(−m), a(m)⟩ = 0 for every f"

   **Claim:** Every formal series with coefficients in S_L^∨ ⊗ W that is orthogonal to all weakly holomorphic forms is modular.

   **Witness:** F = ℚ(i), L = O_F³, h = diag(1, 1, −1), μ = ((1+i)/2, 0, 0) ∈ L′ = ½L with Q(μ) = ½. The series ev_μ·q¹ pairs to 0 with every f, since c(−1) is supported on cosets with Q ≡ 1 (§12.4(b)); it is not modular. README.md:1598 (§12.6a(f)(i)) states both conditions.

   Borcherds' theorem has the conditions built into the vector bundle at the cusp (Bor99 lines 234–247, p. 4); BHKRY Theorem 4.2.3 is scalar on Γ₀(D) with integral exponents, where they are empty. The vector-valued restatement here lost them. The same holds for the central element: every c(−m) has the parity fixed by ω_L(−1), so a coefficient a(m) of the opposite parity is invisible to the pairing.

   **Exact repair:** in (c) replace "A formal series Σ_(m≥0) a(m)q^m with a(m) ∈ S_L^∨ ⊗ W, W a finite-dimensional ℚ-vector space, is the q-expansion" by "A formal series Σ_(m ∈ ℚ, m≥0) a(m)q^m with a(m) ∈ S_L^∨ ⊗ W, W a finite-dimensional ℚ-vector space, that is compatible with the stabilizer of the cusp, namely a(m) vanishes on the functions supported on the cosets μ + L̂ with Q(μ) ≢ m mod ℤ and a(m)(ω_L(−1)φ) = (−1)^n·a(m)(φ), is the q-expansion". Add to the route of §12.7 one clause: "the series Σ Ẑ_B(m, ·)q^m is compatible with the cusp because Z(m, φ) and G_B(m, φ) depend only on the restriction of φ to the vectors of norm m and are unchanged by x ↦ −x". Add the Check: "The compatibility is needed: for F = ℚ(i), L = O_F³ with h = diag(1, 1, −1) and μ = ((1+i)/2, 0, 0), Q(μ) = ½, the series ev_μ·q¹ pairs to zero with every weakly holomorphic form, whose coefficient c(−1) vanishes at μ, and is not modular." Tested on the witness: ev_μ does not vanish on 1_(μ+L̂) and ½ ≢ 1, so the series is excluded; the series of §12.7 satisfies both conditions (for the parity, ω_L(−1)φ(x) = (−1)^n·φ(−x) in signature (2n−2, 2)).

3. **F03** (P3) §13.4 refers to a fixed Haar measure that nothing fixes

   **Location:** README.md:1766 (§13.4) "c_K = (−1)^n/vol(K), independent of T and φ, where vol(K) is the volume of the level K for the fixed Haar measure on the finite adelic points of the RSZ group"

   **Claim:** A Haar measure has been fixed, and c_K is its inverse volume up to sign.

   **Witness:** No sentence of the README fixes a Haar measure on the RSZ group (11 occurrences of "Haar", none for this group). LZ line 3636–3637 (Theorem 13.6.1, p. 83) says only that the volume is taken for a suitable Haar measure. For an unspecified measure the formula fixes the sign and the dependence on K, nothing more.

   **Exact repair:** replace "where vol(K) is the volume of the level K for the fixed Haar measure on the finite adelic points of the RSZ group" by "where vol(K) is the volume of K for a Haar measure on the finite adelic points of the RSZ group that does not depend on K, T or φ; the statement is that one such measure serves every level, so that the sign (−1)^n and the proportionality c_(K′) = [K : K′]·c_K are its content, and the measure is the one for which the point count of the uniformization is the theta integral". Tested: the third Check of §13.4 (index m gives c_(K′) = m·c_K) holds for every Haar measure, and no Check uses a particular normalization.

4. **F04** (P3) §6.5 states the curve function of one connected component for "the curve indexed by Λ"

   **Location:** README.md:832 (§6.5) "for a type-four curve indexed by Λ its special-divisor Euler function is −q(1+q)·1_Λ + Σ_Λ′ 1_Λ′ … taking the value 1 − q on Λ"

   **Claim:** The function of the curve attached to Λ has the value 1 − q on Λ.

   **Witness:** LL2 lines 1619–1621 (Lemma 2.55, p. 32) take one connected component V_Λ⁺ of the curve V_Λ, which has two (§5.4: a ℙ¹ on each component of the space). For V_Λ itself the value on Λ is 2(1 − q) and on the integral shell 2.

   **Exact repair:** "for either of the two connected components V_Λ^± ≅ ℙ¹ of the stratum of a type-four vertex lattice Λ (one in each connected component of the space, §5.4), its special-divisor Euler function is …"; and in the last clause "through §5.4, which writes the vertical class as a combination of these components, the geometric vertical function has the same negative eigenvalue". Tested: χ([O] − [ω]) = 1 − q on one ℙ¹ (§5.2) agrees with the value on Λ; on both components it is 2(1 − q), which the repaired sentence no longer admits. The Fourier eigenvalue −1 holds for either reading.

Four findings: two blocking (P2) and two P3. The five findings of round 8 are all repaired. The new findings are in text no repair touched and come from this round's seeded targets (§§6.5, 9.4, 12.5, 13.4), read against the cached sources and against the roadmap's own §12.6a.

## Verified sound

### The five findings of round 8

| Finding | Repaired passage (README) | Status and what I checked |
|---|---|---|
| F01 two "source corrections" | "Source corrections" has no entry for LL2 Lemma 2.57 or YZZ09 §4.1; §6.7 "Assume r ≥ 2 … a ≥ 3" | Repaired. Searched "2.57" and "YZZ09" in the corrections list: no hit. |
| F02 smooth transfer | :11 "with transfer taken there as a relation between named test functions; the existence of smooth transfer and its compatibility with the Weil action … are requested from EndoscopicTransferAndUnitaryTraceComparison below"; :136 "contains neither the existence of smooth transfer nor its compatibility with partial Fourier transforms; both are part (ii)" | Repaired. The supplier's open head still says so: its contract paragraph "the existence of Jacquet–Rallis smooth transfer … and its compatibility with partial Fourier transforms are not inputs of any target here". §14.4 *Needs* carries the gap. |
| F03 split places | §10.3 "The basic locus at v is not empty … so the vacuity at split places comes from the cycle"; §11.5 "although the basic locus at v is not empty (§10.3)" | Repaired. Values below. |
| F04 locators | §10.3 "LZ §13.1, (13.1.0.1), pp. 80–81 … proof of Theorem 13.6.1, pp. 83–84; LL1 §8, (8.2)–(8.3)"; §5.2 "LL2 §2.4, (2.14), p. 24"; §12.6a "Bor99 Lemma 4.4 and Theorem 4.5, p. 9" | Repaired. LZ page markers at lines 3607 and 3644 put the proof on pp. 83–84. |
| F05 §12.1 Check | "For φ(0) ≠ 0 and c₁(ω) ≠ 0 in CH¹(M)_ℚ … When c₁(ω) = 0 in CH¹(M)_ℚ the term is zero" | Repaired. |

The repaired patterns in the rest of the package: a supplier described as stating what it does not (none; the contracts of the two Jacquet–Rallis roadmaps were reread at their heads); an empty-locus claim at split places (none); a Check that fails in a degenerate case (none in the sampled targets); locators (none in the sample).

### Seeded source sample (15 targets)

| Target | Passage opened | Result |
|---|---|---|
| 0.8 | LZ lines 586–595 (§2.11, (2.11.0.2), Lemma 2.11.1, p. 15) | Agrees: M self-dual of rank r, the other summand integral in V_(n−r). |
| 0.9 | LZ lines 448–450 (Example 2.4.3, p. 12), 712–718 (Example 3.5.2, p. 18) | Agrees: (val + 1)/2 on both sides, D = Σ_(i≤a) (−X)^i. |
| 3.1 | LZ lines 614–668 ((3.2.0.1)–(3.2.0.2), Definition 3.2.1, p. 16; §3.3, pp. 16–17) | Agrees: W_T(1, k, φ₀) = Den(⟨1⟩_(n+2k), L), log q² in the derivative. |
| 5.5 | LL2 lines 1391–1460 (Lemma 2.43, Proposition 2.44, pp. 28–29) | Agrees with the statement; the proof's index slip is the one "Source corrections" records. |
| 6.5 | LL2 lines 1527–1532 (Proposition 2.51, p. 30), 1619–1712 (Lemma 2.55, pp. 32–34), 1721–1750 | Formula, count q² + 1 and transform agree; the object is one component: R04. |
| 7.1 | K lines 431–449 (Definitions 2.1–2.2, p. 10), 497–522 (Definitions 2.3–2.4, Lemma 2.5, p. 12) | Agrees. |
| 7.3 | K lines 700–704 (Definition 3.4, p. 17), 726–736 (Corollary 3.6, p. 18), 762–788 (Definition 3.7, Lemma 3.8, pp. 19–20), 1011, 1023 (Theorem 3.16, Proposition 3.17, p. 25) | Agrees: conditions (a)–(e) as restated, (e) only for N_Λ. |
| 9.4 | Z lines 835–935 (§4.1, Lemmas 4.1–4.2), 961–968 (Lemma 4.3), 1010–1030 (Lemma 4.4), 1071–1078 (Proposition 4.6), 1268–1333 (Lemma 4.11, Proposition 4.12) | Formulas agree; hypotheses: R01. |
| 11.1 | Z lines 516–520 ((2.11), p. 9), 1861–1925 (§7.4, Definitions 7.6, 7.8, pp. 33–34) | Agrees. |
| 11.3 | Z lines 2011–2046 ((7.11)–(7.12), Lemma 7.13, Remark 7.14, Lemma 7.15, p. 36) | Agrees. |
| 12.5 | BHKRY lines 3024–3060 (Proposition 4.2.2, Theorem 4.2.3, p. 68), 3421–3468 (Theorem 5.3.1, pp. 76–77), 3515–3541 (Theorem 5.3.3, p. 78), 3818–3849 (p. 84), 4662–4665 (p. 100), 4767–4789 (metric, Theorem 7.2.4, p. 102); Bor99 lines 234–285 (§3, Theorem 3.1, pp. 4–5); Bor98 line 2589 (Theorem 13.3, p. 48); Z lines 2349, 2373 (Remark 8.5, Theorem 8.6, p. 42) | (a) and (b) agree; (c): R02. |
| 13.4 | LZ lines 3633–3649 (Theorem 13.6.1 and proof, pp. 83–84), 3815–3818 (Theorem 15.3.1, p. 88) | Constant agrees; the measure: R03. |
| 13.5 | LZ lines 3615–3649 (§13.5, Theorem 13.6.1, pp. 83–84); Theorem 14.5.1 from round 8's row | Agrees: p > 2, v₀-admissible φ, T ∈ Herm_n(O_(F,(p))) positive definite. |
| 13.10 | Relied on the round-8 row (K lines 4122–4185, with its hypotheses listed there); the target's text is unchanged since that round | Not reopened this round. |
| 14.6 | Z lines 1301–1306 (Proposition 4.12, Remark 4.13, p. 23); for Conjectures 3.2 and 3.8, round 8's row of §9.3 (Z lines 779–790, 812–824), not reopened | Agrees; the equivalence is stated under q ≥ n+1, as §9.5 justifies. |

No locator was flagged by the author as unverified.

### Adversarial table (sampled targets, headlines, repaired passages, findings)

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| §0.8 | r = 0; n = 2 with a = 1, 3 | identity; Int₂ = Int₁ = 1, 2 = (a+1)/2 | Holds |
| §0.9 and §3.5 headline | a = 1, 3, −3 | (1−X)(1+X²) = 1 − X + X² − X³; −D′(1) = 1, 2; a = −3: D = 0, both sides 0 while (a+1)/2 = −1 | Holds |
| §1.3 Check | nonsplit V₂ | x·x̄ + ϖ·y·ȳ has no zero (valuation parity), so one maximal lattice, one type-one vertex lattice, one closed point; a = 2: q² + q + 1 on both sides | Holds |
| §3.1 | n = 1, a = 1; derivative in s | X = (−q)^(−2s): d/ds = −D′(1)·2 log q; (1 + q⁻¹)·2 log q, at q = 3 (8/3)·log 3 | Holds |
| §4.5 headline | a = 0, 2 | (q+1)·0 = 1 − 1; (q+1)·1 = (q+2) − 1 | Holds |
| §5.5 | (b₁, b₂) = (0,0), (0,1), (1,1), (1,2) | 2, 4, 2(q+3), 2(2q+4) | Holds |
| §6.5 (R04) | x ∈ Λ; integral shell; x̄ anisotropic; whole stratum | −q(1+q) + (q²+1) = 1 − q; transform −(1+q)/q + (q²+1)/q = q − 1; −(1+q)/q + 1/q = −1; −(1+q)/q + (q+1)/q = 0; two components give 2(1 − q) | Formula per component; reword |
| §6.8 headline | invariants (1,1), (1,3) | 2 = 2; Int = 2·(1 + 1) = 4 and two type-two overlattices give 2·2 = 4 | Holds |
| §7.3 Check | Λ of type two in type-zero Λ₀ | Λ̆ ⊂ M′ ⊂ M = Λ̆₀ with both colengths one forces M′ = Λ̆: one point | Holds |
| §8.7 headline | I_n | δ_odd(n) on both sides (§§7.7, 8.2) | Holds |
| §9.4 (R01) | n = 2, g′ = diag(h, d), u = 0 | pullback of the graph: all of Spf O_F̆, codimension 0; expected 1 | Add u ≠ 0; restore Z's domain |
| §9.5 | q = n, q ≥ n+1 | q + 1 residues of F^1 against n + 1 excluded values: equal at q = n, larger at q ≥ n+1 | Consistent with R01's repair |
| §10.3 Check (repair) | n = 2, F₀ = ℚ, p split | summand dimensions (2,0) for A₀² against (1,1) for A: no quasi-isogeny, Z(T) empty; E × E with i ↦ ((0,−1),(1,0)) has eigenvalues ±√−1 distinct mod p ≡ 1 mod 4 | Holds |
| §11.1 | F = ℚ(i), α = T − i | ᾱ(0) = i; i⁻¹·T·(T⁻¹ + i) = T − i; ordinary reciprocal T + i | Holds |
| §12.1 Check (repair) | n = 1; n = 2 isotropic over ℚ | CH¹ = 0; c₁(ω) = 0 since Δ has no zeros | Holds |
| §12.5(a) | principal part q⁻¹·1_(L̂), x primitive of norm 1 | BHKRY's ψ is Borcherds' product of 2f̃, weight c̃(0,0); one ray counted twice gives the sum over F^×·x: #O_F^× | Holds |
| §12.5(c) (R02) | ev_μ·q¹, Q(μ) = ½ | pairing 0 for every f; T-eigenvalue of ev_μ is e(±½) ≠ 1 = e(1): not modular | Add the two conditions |
| §12.9 headline | F₀ ≠ ℚ; n = 2 | not asserted (§12.7) | Retain |
| §13.4 (R03) | K′ ⊂ K of index m | c_(K′) = m·c_K for any Haar measure | Sign and proportionality are the content |
| §13.8, §13.10 headlines | hypotheses against LZ 15.5.1 and round 8's row for K 10.1–10.2 | unramified everywhere, split above 2, two nonsingular split places; Diff(T) = {v} nonsplit nondyadic | Retain |
| §14.5 headline, §14.6 | n = 1; n = 3, 4; p = n | n = 1: V₁ = F·u₀ with unit norm is split, so no γ matches the nonsplit side and the statement is empty; n = 4 is the first global step; p = n uses §9.5(b) | Retain |
| gap (ii) | n = 1; F split | Orb(γ, f′) = ω(γ)·f′(γ); γ = (a, a⁻¹), S_n ≅ GL_n(F₀) | Precise at the stated generality |

### Library, Lean and headlines

- Pins opened: `IsNonarchimedeanLocalField` (Mathlib/NumberTheory/LocalField/Basic.lean:46), `Polynomial.eval` (Mathlib/Algebra/Polynomial/Eval/Defs.lean:248), `Polynomial.derivative` (Mathlib/Algebra/Polynomial/Derivative.lean:47), `TauCeti.FormalScheme.Spf.carrier` (TauCeti/AlgebraicGeometry/FormalScheme/Spf/Carrier.lean:73), `TauCeti.FormalScheme.Spf.structureSheaf` (TauCeti/AlgebraicGeometry/FormalScheme/Spf/StructureSheaf.lean, docstring line 63). The pinned Tau Ceti has four files under AlgebraicGeometry/FormalScheme/Spf and nothing else on formal schemes; a search of both pins for Rapoport–Zink spaces, hermitian local densities, orbital integrals and arithmetic Chow groups finds nothing.
- `lake env lean` on packages/GrossZagierAndArithmeticHeightsPartII/Suggested.lean from the content checkout: exit 0, no output. One `import Mathlib`, one module docstring, an empty namespace, no declaration, no `set_option`, no sorry'd data. The one-tactic probe and the `#check @name` comparison have no input, so there is no padding.
- Headlines (Summary and "Acceptance file"): §§3.5, 4.5, 6.8, 8.7, 13.8, 13.10, 12.9, 14.5. Each is named in the module docstring with the missing carrier; none is statable at the pins and no stand-in is stated.
- Backticked names: 25 distinct code spans: 2 display formulas, 1 file name, 6 pinned library names and 16 supplier names. The four leads of the citation resolver are refuted: `IntegralHermitianLattice.ofCarrier` and `HermitianLatticeInvariants.ofDualQuotient` are at GeometryOfNumbersAndQuadraticArithmetic README:705 and :727 (open head); `ClassicalAlgebraic.supportLocalization` and `ClassicalAlgebraic.properSupports` are at EtaleCohomologyFoundations README:770 and :966 on main. The roadmap declares no name of its own.

### Suppliers, order, gaps, overlap

- Dependency check, exact output: `depcheck: 235 roadmaps, 2254 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line. The roadmap is line 350 of the merge order.
- The resolver lists no cross-roadmap citation as missing. Resolved again by heading: all 42 cited sections of PELModuliPartII (board package); EndoscopicTransferAndUnitaryTraceComparisonPartII §§4.4–4.5 (its README:708, :722) and its contract paragraphs; `fourierUnitVanishing` (AutomorphicFormsOnReductiveGroups README:692); `weil_hermitianUncertainty` and `weil_hermitianNormalizations` (MetaplecticAutomorphicForms README:640, :648); `hermitianLocalDensity`, `normalizedSiegelPolynomial`, `choYamauchiWeight` (GeometryOfNumbersAndQuadraticArithmetic README:914, :934, :945). For the other sections I rely on the resolver and on round 8's count of 144 resolved headings.
- Gaps: the four slugs have identical `needs` text in design/plan.json and in the README (compared mechanically, 4 of 4), each with a named earlier supplier. gap:jr-afl-local-inputs has two parts with one supplier and one subject; each part states its fields, its formulations and its locators, and neither asks for what EndoscopicTransferAndUnitaryTraceComparisonPartII states (§§4.4–4.5 are the group and Lie-algebra formulations) or requests.
- 107 targets, 107 *Needs* lines, no target needs a target at or after its own position (scanned); every definition and theorem has at least three Checks (minimum 3).
- Overlap inventory: no other open pull request changes this roadmap, no cited id is dropped, none exists only in an open revision. One other roadmap names this one: SchemeKTheoryOperationsPartII README:801, as a consumer.

Overlap check: read ComplexMultiplicationAndExplicitReciprocityPartII, MetaplecticAutomorphicForms, GrossZagierAndArithmeticHeights, EndoscopicTransferAndUnitaryTraceComparisonPartII, EndoscopicTransferAndUnitaryTraceComparison (the open list; the two other lists are empty); orthogonal Borcherds products on GSpin Shimura varieties over ℚ: the generic-fibre product at any level with its relation in CH¹ is owned here (§12.6a(e)), and ComplexMultiplicationAndExplicitReciprocityPartII §4.2a (its README:668, later in the merge order) owns the integral divisor on the model of a maximal lattice; Jacquet–Rallis orbital integrals: Zhang's formulation on S_n is owned here (§9.3), the group and Lie-algebra formulations by EndoscopicTransferAndUnitaryTraceComparisonPartII §§4.4–4.5, smooth transfer by EndoscopicTransferAndUnitaryTraceComparison through the declared gap. Nothing else is shared: the first three roadmaps mention neither Kudla–Rapoport cycles, Rapoport–Zink spaces nor the arithmetic fundamental lemma outside their reference lists.

### Shape, policy, sources

- Shape: summary, scope, conventions, contracts, build paragraph, 15 layers each with Examples and Dependencies. Pattern scan of the README for pull-request numbers, round and job labels, machine paths, HTML and LaTeX delimiters: no hit ("current" occurs only as Green current, "lemma" only in "fundamental lemma"). No sentence says the roadmap follows a source; layer titles are mathematical.
- Manifest: 24 works, 22 certified and 2 uncertified; the ids of the README and of the manifest coincide. No source was fetched and the manifest was not changed.
- Wording: 14 README passages were set beside their sources (the 13 sampled targets opened this round, §12.5 counted once for BHKRY and once for Bor99). None reproduces a sentence or follows one clause by clause; what is shared is formulas and lists of conditions (K Lemma 3.8, Z Lemma 4.1).
- Arrangement: LZ has the largest share. Its sections (cycles, densities, horizontal, vertical, Fourier, proof, almost self-dual, global) do not map one to one onto the layers: Layer 1 takes LZ §4 with §5.4, Layer 2 takes §5.3 with §6, Layer 3 merges §§3, 7 and 8, and Layer 13 follows eight layers drawn from other sources. The order of Layers 0–4 is forced by the *Needs* of §3.5 (§§0.8–0.9, 1.4, 2.5, 3.3–3.4) and of §4.3 (§3.5).

Source independence: 14 passages compared with 6 sources (LZ, LL2, K, Z, BHKRY, Bor99), none shared; largest share LZ, 55 of 236 locators; contents compared with LZ: independent.

## Not verifiable

- Lusztig76 and McGraw03 are settled as uncertified; §§2.1, 5.4 and 12.6a(f)(ii) were not read in the originals.
- §13.10 was not reopened in K this round; its row rests on round 8's reading, and the text has not changed.
- The targets outside the sample and outside the repaired passages were read in the README but not reopened in their sources this round; for them I rely on the computed rows of the earlier rounds. LRZ, MZ, ES, GS19, Liu11a, Mih16, Zha12, Ter13a, Ter13b, KR11, KM90, VZ84 and YZZ09 were not opened.
- The text extractions lose fraction bars and some inequality signs (LZ line 627 prints a quotient as a product; LL2 prints ⩾ as >). Statements were read with that in mind; the PDF pages were not opened this round.
- PELModuliPartII exists only as a board package; its sections resolve today and may move.
- The declared supplier gaps are contracts; only their precision, ownership and minimality were checked.

## Source issues

- **Misprint** in LL2 at Proposition 2.44, proof, (2.17) and the display after it, pp. 28–29: the source says the conductor term uses an index that is not the summation variable; it should be the summation index j, as in the statement; affects nothing.

## For the human reviewers

- **Licence.** McGraw03 is cited for its main theorem without a theorem number and no legal copy was read (packages/GrossZagierAndArithmeticHeightsPartII/sources.toml, `uncertified`).
- **Licence.** YZZ09 is read from a university archive host and LL1, LL2, Zha12 from author pages (README.md, References); the manifest records them as certified.
- **Not tested.** Two targets, §8.6 (README.md:1125) and the q = n step of §9.5(b) (README.md:1242), ask for proofs the cited sources do not contain; the headline §8.7 and the case p = n of §14.5 depend on them.
- **Scope.** gap:jr-afl-local-inputs has two parts under one slug (README.md:138): the unramified passage with the fundamental lemma, and smooth transfer with Weil compatibility at every place. Whether to split it is the maintainers' choice.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c4ef49278e148fb59e5079429662eebe64b8b8b1", "job": "REV-PKG-GrossZagierAndArithmeticHeightsPartII~9", "model": "fable", "worker": "chris-x79"} -->
