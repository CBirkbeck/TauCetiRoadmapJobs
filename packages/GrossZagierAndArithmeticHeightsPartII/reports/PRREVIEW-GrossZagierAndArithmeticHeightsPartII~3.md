# Review of GrossZagierAndArithmeticHeightsPartII (pull request #2457 at f947271)

**Verdict:** needs changes

## R01 (P3) — §13.9 cites LL1 (9.2) for a coefficient that (9.2) does not print

**Location** `TauCetiRoadmap/GrossZagierAndArithmeticHeightsPartII/README.md` line 1916 (§13.9, fourth Check): "this is the coefficient −log q_v/(q_v^(2r) − 1) of W_T(1_(Λ₀^n)) relative to W′_T(1_(Λ₁^n)) in LL1 (9.2), p. 44".

**Claim** The value is right, the locator is not. LL1 (9.2), in the author copy the References cite, prints the denominator `q_u^r − 1`. The coefficient with `q^(2r) − 1` is what LL1 (9.3) gives after division by `(q^(2r) − 1)/(q+1)`.

**Witness** LL1 line 2038 (and Proposition 9.1, LL1 line 1886): `log q_u/(q_u^r − 1)`. LL1 lines 2044–2055: `vol(L_u) = (q_u+1)/(q_u^(2r) − 1)` and the bracket of (9.3). LZ line 3172 agrees with (9.3).

**Repair** In that Check replace "in LL1 (9.2), p. 44, and the bracket" by "obtained from LL1 (9.3), p. 44, and the bracket". Add to `## Source corrections`: "LL1 Proposition 9.1 and (9.2): the denominator printed as q_u^r − 1 is q_u^(2r) − 1, as (9.3), the volume (q_u+1)/(q_u^(2r) − 1) and LZ Remark 10.5.4 require (§13.9)." Tested at q = 3, r = 1: (9.3) gives −log 3/8, the README's value; q^r − 1 would give −log 3/2.

## R02 (P3) — LL2's proof of Lemma 2.32 does treat t = 6; four passages say it does not

**Location** README line 2054 (Source corrections): "LL2 proof of Lemma 2.32, p. 24: the case t(Λ) = 6 is omitted; it is the unitary case ²A₃ of Lusztig's computation (§5.4)." Also line 743 (§5.4, "for t ≠ 6; for t = 6 …"), line 784 (Layer 5 Dependencies, "²D_n (n ≥ 4)"), line 2076 (Lusztig76 reference).

**Claim** LL2's third case is `t(Λ) ⩾ 6`, by Case ²D_n with `n = t(Λ)/2 ⩾ 3`, so t = 6 is covered and nothing is omitted. The cached extraction renders every "⩾" of LL2 as ">", which is what the previous round's R02 read.

**Witness** arXiv:2101.09485 (the same paper; Lemma 2.33 there): "When t(Λ) ⩾ 6 … (with n = t(Λ)/2 ⩾ 3)". The cached LL2 text has 0 occurrences of "⩾" or "≥" against 125 of "⩽" (LL2 lines 1183, 1187, 1753, 1759).

**Repair** Line 743: "(LL2 Lemma 2.32, p. 23, with its proof, p. 24, which for t ≥ 6 uses Case ²D_n, n = t/2 ≥ 3, of Lusztig76 7.3 with 6.1, the type ²D₃ at t = 6 being ²A₃; LL2 Lemma 2.42, p. 27)". Line 784: "The ²D_n (n = t/2 ≥ 3) Coxeter computation is Lusztig76 7.3 with 6.1, as cited in LL2 Lemma 2.32; at t = 6 the type ²D₃ is ²A₃." Line 2054: delete the sentence quoted above. Line 2076: "…the unitary cases through LZ §5.3, the case ²D_n (n ≥ 3, where ²D₃ = ²A₃) through LL2 Lemma 2.32." The eigenvalue statement of §5.4 is unchanged (table, row 24).

## Deferred findings

- D01 — stands

## Previous findings

- R01 — not repaired: deferred (D01)
- R02 — repaired as it was requested: §5.4 reads "(LL2 Lemma 2.32, p. 23, with its proof, p. 24, for t ≠ 6; for t = 6, where ²D₃ = ²A₃, the unitary case of Lusztig76 7.3 with 6.1; …)". The request rested on the misread ">"; R02 of this report asks for the citation to be restored.
- R03 — repaired: §9.8 reads "(Zha12 §2.2, p. 206, for the setting; Theorem 2.10, p. 211, and Theorem 5.5, p. 250, for his Conjecture 2.9, p. 210)"; Zha12 lines 348, 521, 578, 2181.
- R04 — repaired: the description reads "`Suggested.lean` declares nothing: no headline theorem is statable at the pins…".

## Verified sound

| # | Statement | Instances tried | Values computed (README side / check side) | Result | Change |
|---|---|---|---|---|---|
| 1 | 0.9, 3.1, 3.5 unramified identity (headline) | a = 1, 3, −3; q = 3 | D = 1−X, 1−X+X²−X³; −D′(1) = 1, 2; a = −3 gives 0, not −1; W′ = (4/3)·log 9 | holds | none |
| 2 | 2.1, 2.4 Coxeter eigenvalues, curve function | d = 1; type-three Λ | Trace on H_c: −(q³ − q(q²−q)) + q² = 0 points; 1+q²+q(q²−q) = q³+1; f̂ = q²−1, −1, 0 = −f | holds | none |
| 3 | 4.3, 4.5 almost self-dual identity (headline) | a = 0, 2 | D_Λ = (1−X)(1+qX)+X²(1−X); ∂Den_Λ = q+2; (q+1)·1 = (q+2)−1; a = 0: 0 = 1−1 | holds | none |
| 4 | 5.1 exotic special cycles (sample) | plane with h(e,f) = u⁻¹; x = u⁻¹e | Λ^∨ = Λ, invariants (0,0); h(x,x) = −u⁻², F₀-valuation −1, N(x) = ∅. LL2 lines 469–531, footnote line 498 | holds | none |
| 5 | 5.5, 5.6 rank two and component symmetry (sample) | (b₁,b₂) = (0,0), (0,1), (1,1), (1,2); non-normal basis | 2, 4, 2(q+3), 2(2q+4); h(x₁,−x₂) = −1 ≠ 1, det θ = −1. LL2 lines 1713–1720, 1534–1556 | holds | none |
| 6 | 6.5, 6.8 exotic identity (headline) | type-four Λ; invariants (1,3) | −q(1+q)+(q²+1) = 1−q; transform q−1 on Λ, −1 and 0 on the shells; Int 4 = 2·2 | holds | none |
| 7 | 6.7 two-overlattice induction (sample) | L♭ = ⟨β₁, β₂, βu²⟩, norm(x₀) = β | norm(u⁻¹e ± x₀) = −β+β = 0; h(e,·) = −βu; invariants (1,1,2,2); a = 3. LL2 lines 1753–1762, 1821–1824 | holds | none |
| 8 | 7.3 Krämer stratum deformation (sample) | m = 0, m ≥ 1; type-two Λ ⊂ Λ₀ | Flags of ranks 1 ⊂ n ⊂ 2n with K Lemma 3.8 (a)–(e), K lines 776–788; condition (e) only for m ≥ 1, K line 704 | holds | none |
| 9 | 7.5a rank-two Krämer numbers | (α,β) = (0,0), (0,1), (1,1); H₁ | χ = 1: 0, 1, 2−2q; χ = −1: 0, 1, 2+2q; H₁: 1−q. HSY23b lines 146–166; Shi22 lines 154–162 | holds | none |
| 10 | 8.7 Krämer identity (sample, headline) | diag(−π₀,−π₀), both signs; H₁; I_n | ∂Den = 3(1−q)+(q−1) = 2−2q; (1+q)+(q+1) = 2+2q; 1−q; δ_odd(n): the values of row 9 | holds | none |
| 11 | 8.6 hypothesis (H_n) against K Lemma 9.6 | H₁; ⟨π₀⟩ ⊥ H₃; H₁ ⊥ H₁ | Norms in H₁ lie in π₀O, so minimum valuation 2 = val(H₁); 8−3+1 = 6; 4−1+1 = 4; coefficient 1/(2π) ∉ O_F | holds; K line 3936 fails | none |
| 12 | 8.4 partial integral | L♭ = ⟨1⟩ ⊥ ⟨π₀⟩, norm(x) = −π₀⁻¹ | det = π₀·(N(β)−1)/π₀ − N(β) = −1; 2q classes β ≡ ±1; value 2q·vol(L♭) ≠ 0 against K line 3451 | holds | none |
| 13 | 9.2 derived fixed locus (sample) | definition against Z (3.11)–(3.13), Remark 3.1 | Z lines 750–777: the same graph–diagonal product and projection formula; proper support for regular semisimple pairs | holds | none |
| 14 | 9.3, 9.8 orbital integrals and low rank | ℚ₃: ((−2,1),(−3,2)); ((0,1),(1,0)) with a = diag(3,1); ℚ₉: ((−4,1),(−15,4)) | γ² = 1; Orb = 1−3^s, ∂Orb = −log 3; law 0 − log\|3\|·1 = log 3; −log 9 = −1·log q | holds | none |
| 15 | 9.1, 12.10 non-semisimple controls | g unipotent on 3J; g₁ ⊕ (−1), n = 4 | gᵗJg = J; det(u, gu, g²u) = −1 for both u; h(u,u) = 1 and 6; 4×4 determinant 8 | holds | none |
| 16 | 9.5 rank reduction | q against n; g′ = diag(ϖ⁻¹, ϖ, 1) | q+1 ≥ n+2 when q ≥ n+1; valuations −1, 0, 1 give a unit; v(1−ξd) = −1, v(det(1−g)) = 1 | holds | none |
| 17 | 9.6 local constancy (sample) | Z Proposition 5.2, Theorem 5.5 | Z line 1462 has no bound on q; its proof, line 1470, uses the avoidance of Proposition 4.12(i); m excluded residues < q+1 for q ≥ m | holds | none |
| 18 | 10.1 global special cycles (sample) | a = ((1,b),(0,1)), b̄ = −b | h(x′₁,x′₂) = −b, h(x′₂,x′₂) = 1−b², equal to aᵗTā. LZ lines 3544–3555; Z lines 1782, 1794; LL1 lines 1236, 1243, 1402 | holds | none |
| 19 | 12.4, 12.5 Checks | L = O_F³, μ = ((1+i)/2,0,0); L = O ⊕ O ⊕ 3O, μ = (0,0,1); z = (0,1,2) | Q(μ) = ½, 2μ ∈ L; Q(μ) = −1, 2μ ∉ L; \|x₁\|²+3\|x₃\|² = 1 gives four vectors | holds | none |
| 20 | 12.6 arithmetic divisor series (sample) | Z (8.14)–(8.17), Remark 8.5 | Z lines 2318, 2349–2371: quotient by the classes above S; constant coefficient −φ(0)·ĉ₁(ω̂) | holds | none |
| 21 | 12.6a, 12.6b, 12.7 Chow-valued modularity (sample, headline) | 𝔰𝔬(p,2), p = 2, 3, 4; x²−3y²−3z²; n = 2, 3 | p = 3, 4: at least four noncompact roots nonzero; p = 2: two; 1+1+1−3 = 0; weight (2n−2)/2+1 = n. YZZ09 lines 170, 541, 587–606 | holds | none |
| 22 | 12.8, 12.9 CM series (sample, headline) | Z (9.1)–(9.8), (10.9)–(10.10), Remark 9.1 | Z lines 2394, 2426–2437, 2637: ℝ_S, denominator τ(Z^ℚ)·[E:F]; [E:F₀]/[E:F] = 2; n ≥ 3 added here | holds | none |
| 23 | 13.5 semi-global identity (sample) | LZ Theorems 13.6.1, 14.5.1 | LZ lines 3633–3637: p > 2, v₀-admissible, c_K = (−1)^n/vol(K); line 3625: division by deg π₁ | holds | none |
| 24 | 5.4 exotic Tate classes (R02) | t = 4; LL2 proof cases | ℙ¹ minus q²+1 points: eigenvalue 1 on H¹_c, q² on H²_c; source cases t = 2, 4, ⩾ 6 are exhaustive | statement holds; four source claims false | R02 |
| 25 | 13.7 archimedean coefficient (sample) | LZ Theorem 15.3.1; Liu11a 4.5, 4.17; GS19 | LZ lines 3814–3826: factor ½, r = p+1 = n; Liu11a printed pp. 889, 905; GS19 lines 149, 187, 206, 959 | holds | none |
| 26 | 13.9 modified derivative (sample, R01) | q = 3, n = 2; LL1 (9.2), (9.3); LZ Remark 10.5.4 | c₀·ratio = −¼·½ = −⅛; (9.3) and LZ give log q/(q^(2r)−1); (9.2) prints q^r−1. K lines 219–232 match | value holds; locator wrong | R01 |
| 27 | 13.8, 13.10 arithmetic Siegel–Weil (headline) | F₀ = ℚ; inert and ramified v | LZ lines 3857–3864: hypotheses as stated, F₀ ≠ ℚ; K lines 248–251, 4161, 4179; (H_m) carried for ramified v, n ≥ 4 | holds | none |
| 28 | 14.2 corrected derivative (sample) | Z Proposition 14.5, §14.3 | Z line 3903: ∂J_hol = 2∂J + Int_(K−B); line 3981 prints 2∂J_hol + Int; line 3999 expands with coefficient one | holds | none |
| 29 | 14.5 strongly regular AFL (headline) | (n,p) = (3,3), (5,5); step n = 4 | 6 residues of F^1 against 5+1 excluded values at (5,5); the step uses S_(n−1) only at p′ ≥ n; Z line 4079 | holds | none |

- Source locators: about 120 checked against 17 cached texts (LL2, K, Z, LZ, LL1, Liu11a, GS19, YZZ09, KM90, VZ84, Bor99, Bor98, ES, HSY23b, Shi22, HSY23a, Zha12); two wrong (R01, R02). Printed pages of Liu11a, YZZ09, KM90, VZ84 and Zha12 were recomputed from the page headers.
- The entry on LL2 Lemma 2.32 in the previous report's Source issues is withdrawn (R02).
- Pinned declarations opened: `Module.equiv_directSum_of_isTorsion` (Mathlib/Algebra/Module/PID.lean:230), `IsNonarchimedeanLocalField` (Mathlib/NumberTheory/LocalField/Basic.lean:46), `TauCeti.FormalScheme.Spf.carrier` (Carrier.lean:73), `TauCeti.FormalScheme.Spf.structureSheaf` (StructureSheaf.lean:262), `Matrix.localDensity` (LocalDensity/Basic.lean:546), `TauCeti.AlgebraicGeometry.Chow.ChowGroup` (Chow/Basic.lean:295). No formal scheme in Mathlib, no hermitian density, orbital integral or arithmetic Chow group at either pin.
- Cross-roadmap citations resolved by heading: 27 suppliers, 150 section citations, on main or at the open heads; all found. `ClassicalAlgebraic.supportLocalization`, `ClassicalAlgebraic.properSupports` (EtaleCohomologyFoundations on main) and `fourierUnitVanishing` (AutomorphicFormsOnReductiveGroups line 692) exist. The eight gap slugs of the README equal those of `design/plan.json`.
- Gate rerun at this head: every check 0, OK. Dependency check: "depcheck: 263 roadmaps, 2570 edges, 0 problem(s)"; merge-order position 380; the outside-folder diff is empty.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output. The file declares nothing, so there is no signature to `#check` and nothing to probe for padding. No headline is statable at the pins: each needs Rapoport–Zink spaces, Shimura varieties or orbital integrals, none of which is there.
- The pull request's title and description agree with this head.

Overlap check: read PELModuliPartII, ComplexMultiplicationAndExplicitReciprocityPartII, GrossZagierAndArithmeticHeights, MetaplecticAutomorphicForms, HodgeClassesForJacquetLanglands and SchemeKTheoryOperationsPartII. PELModuliPartII owns the Rapoport–Zink spaces and strata and says special cycles are not constructed there; this roadmap owns them. GrossZagierAndArithmeticHeights §6.20 owns the quaternionic p = 2 series, cited in §12.6a(d). MetaplecticAutomorphicForms §3.3a owns the uncertainty principle, cited. HodgeClassesForJacquetLanglands uses Kudla–Millson Schwartz forms and owns no generating series of divisors. GSpin divisors and generic-fibre Borcherds products: two owners, deferred as D01.

Source independence: 14 passages compared with 6 sources (LL2, K, Z, LZ, LL1, YZZ09), none shared beyond formulas and names; largest share Z, 63 of 326 locators; contents compared with Z (15 sections) and with LZ: independent. Layer 9 merges Z §§3–5 with Zha12 and Mih16, Layer 12 merges Z §§8–10 with BHKRY, YZZ09 and Borcherds, Layer 14 takes Z §§11–15 without §13, and Layers 0–8, 10 and 13 have other sources; the order 9 → 11 → 12 → 14 is forced by the *Needs* lines of §§11.5, 12.8 and 14.2.

## Not verifiable

- Lusztig76 (uncertified, paywalled): 7.3 and 6.1 were not read; whether its table lists ²D₃ separately from ²A₃ is not known.
- McGraw03 (uncertified, paywalled): the rationality theorem used in §12.6a(f)(ii) was not read.
- LL1 Proposition 9.1 and (9.2) in the published Annals version: only the author copy the References cite was read; the arXiv HTML rendering stops before §9.

## Source issues

- **Misprint** in LL1 at Proposition 9.1, p. 40, and (9.2), p. 44: the source says the coherent term has coefficient log q_u over q_u^r − 1; it should be log q_u over q_u^(2r) − 1, as (9.3) on the same page gives; affects a stated result.
- **Misprint** in Z at §14.3, the display before Theorem 14.6, p. 70: the source says E♭ is twice ∂J_hol plus Int; it should be ∂J_hol plus Int, as the expansion in the proof of Theorem 14.6 uses; affects nothing.
- **Error** in K at Lemma 9.6, p. 74: the source says every pair (L♭, x) with x outside L♭ ⊕ W has a presentation of smaller valuation; it should exclude lattices whose largest invariant is odd, such as the hyperbolic plane H₁; affects the proof.
- **Error** in K at Theorem 8.2, p. 64: the source says the analytic partial integral vanishes at normal vectors of negative valuation; it should assert only constancy at nonnegative valuation (the value is 2q·vol(L♭) for ⟨1⟩ ⊥ ⟨π₀⟩ at norm −π₀⁻¹); affects a stated result.
- **Gap** in Z at Theorem 5.5, p. 26: the source says joint local constancy holds with no bound on the residue cardinality; it should assume q at least the semi-Lie dimension, which the scalar avoidance in its proof needs; affects a stated result.

## For the human reviewers

- Scope: §8.7 and §13.10 are headlines stated in rank n ≥ 4 under the hypothesis (H_m) of §8.6 (README line 1169), which the README says no published argument proves; K Lemma 9.6 fails as printed (K lines 3934–3975).
- Scope: §14.5 asserts less than Z Theorem 15.1 (Z line 4079): the group version at p = n ≥ 5 is excluded (README line 2008) because of the step at Z line 1301 discussed in §9.5.
- Licence: LRZ (arXiv:2404.02214v2, References line 2073) is cited as a preprint with no journal reference; it supplies the integral geometry of §4.2, used by the headline §4.5.
- Licence: LL1, LL2 and Zha12 are read from author pages (References lines 2067, 2068, 2086); R01 concerns a formula as the LL1 author copy prints it, not checked against the journal.
