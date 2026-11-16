# Review of GrossZagierAndArithmeticHeightsPartII (pull request #2457 at eb24852)

**Verdict:** needs changes

## R01 (P2) — Two owners for GSpin Kudla divisors and orthogonal Borcherds products over ℚ

**Location** `TauCetiRoadmap/GrossZagierAndArithmeticHeightsPartII/README.md` line 7 ("together with the generic-fibre orthogonal Borcherds products over ℚ and Borcherds' obstruction criterion in half-integral weight") and line 1660, §12.6a(e).

**Claim** ComplexMultiplicationAndExplicitReciprocityPartII (pull request #1695, merge order 401 against 380 here) builds the same generic-fibre GSpin special divisors and rational Borcherds section over ℚ. It also claims them as its own, and neither roadmap cites the other.

**Witness** `TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocityPartII/README.md` at #1695: line 649 constructs "special divisors Z(m,μ)" in signature (n,2); line 669 proves "there is a rational Borcherds section Ψ(f)"; line 11 claims §§4.2–4.2a.

**Repair** Keep ownership here, since this roadmap is earlier in the merge order. In Scope and ownership, after "…the Chow-valued modularity of the unitary divisor series over every totally real field;", add: "ComplexMultiplicationAndExplicitReciprocityPartII §§4.2–4.2a takes the GSpin Kudla divisors and the generic-fibre orthogonal Borcherds products over ℚ from §12.6a(e) and adds their integral models, the Petersson-norm relation and the integral divisors." Add the same sentence under Downstream consumers. In #1695, §§4.2–4.2a should cite §12.6a(e) for the generic-fibre divisors and section instead of constructing them.

## R02 (P3) — §5.4's eigenvalue statement has no source at type 6

**Location** README line 743: "on the open part of a stratum of type t the compactly supported cohomology carries the squared-Frobenius eigenvalues q^(2j) in degree j + t/2 − 1 for 0 ≤ j ≤ t/2 − 1, with semisimple eigenspaces".

**Claim** The cited proof (LL2 Lemma 2.32) treats only t(Λ) = 2, 4 and t(Λ) > 6. Type 6, which occurs once n ≥ 6, has neither a locator nor a route, and the route names only "the type ²D Coxeter varieties", whereas ²D₃ = ²A₃.

**Witness** LL2 lines 1185–1190, p. 24: the cases "t(Λ) = 2", "t(Λ) = 4", then "When t(Λ) > 6, by Case ²D_n (with n = t(Λ)/2 > 3)". No case covers t(Λ) = 6.

**Repair** In §5.4 replace "(LL2 Lemma 2.32, p. 23; Lemma 2.42, p. 27)" by "(LL2 Lemma 2.32, p. 23, with its proof, p. 24, for t(Λ) ≠ 6; for t(Λ) = 6, where ²D₃ = ²A₃, the unitary case of Lusztig76 7.3 with 6.1; LL2 Lemma 2.42, p. 27)", and replace "the type ²D Coxeter varieties" by "the type ²D_(t/2) Coxeter varieties, of type ²A₃ when t = 6". In Layer 5 Dependencies write "The ²D_n (n ≥ 4) and ²A₃ Coxeter computations are Lusztig76 7.3, as cited in LL2 Lemma 2.32". Add under Source corrections: "LL2 proof of Lemma 2.32: the case t(Λ) = 6 is omitted; it is the unitary case ²A₃ of Lusztig's computation (§5.4)."

## R03 (P3) — The Zha12 setting is cited on the wrong page

**Location** README line 1340: "made over an arbitrary finite extension of ℚ_p with p odd (Zha12 §2.2, p. 210, for the setting"; References line 2086: "Conjecture 2.9 and §2.2, p. 210".

**Claim** Zha12 §2.2 and its sentence fixing the setting are on journal page 206. Page 210 holds Conjecture 2.9 and the remark about artinian intersections.

**Witness** Zha12 line 347 (page header 206), line 348 (heading of §2.2) and line 355 (F a finite extension of ℚ_p with p odd); Conjecture 2.9 is at line 521, on p. 210.

**Repair** At line 1340 write "(Zha12 §2.2, p. 206, for the setting; Theorem 2.10, p. 211, and Theorem 5.5, p. 250, for his Conjecture 2.9, p. 210)". In References write "§2.2, pp. 206–210; Conjecture 2.9, p. 210". The later citation "(Zha12 §2.2, p. 210; Mih16 §6, p. 29)" for artinian intersections is correct and stays.

## R04 (P3) — The description misdescribes `Suggested.lean`

**Location** The pull request description, second paragraph, "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti", and the Validation paragraph, "the targeted Lake build succeeds with `sorry` as the only warning".

**Claim** At this head `Suggested.lean` declares nothing, and the text never says so. The build emits no warning at all.

**Witness** `TauCetiRoadmap/GrossZagierAndArithmeticHeightsPartII/Suggested.lean` lines 1–71 contain one module docstring and an empty namespace. `lake env lean` on the file exits 0 with no output.

**Repair** Replace the first sentence with: "`Suggested.lean` declares nothing: no headline theorem is statable at the pins, and its module docstring names each headline with the carriers it lacks (Rapoport–Zink formal schemes, hermitian local densities, integral models of unitary Shimura varieties, Jacquet–Rallis orbital integrals)." Replace the second with: "Validation: the targeted Lake build succeeds with no warning."

## Verified sound

| Statement | Instances tried | Values computed (target side / check side) | Result | Change |
|---|---|---|---|---|
| 0.1 Special Hom convention | a ∈ O_F; O_F·x with h(x,x) = ϖ^a | H(ax,y) = ā·H, h(ax,y) = a·h; both duals ϖ^(−a)O_F·x, invariant a; LZ pairing (line 422) matches | holds | none |
| 0.4 Odd-type vertex strata | type 3 at q = 3; containment | Fermat curve with q³+1 = 28 points; V(Λ) ⊂ V(Λ′) ⇔ Λ′ ⊂ Λ (LZ line 473) | holds | none |
| 0.8 Self-dual cancellation | n = 2, ⟨u⟩ ⊥ ⟨x⟩, a = 1, 3; r = 0 | Int₂ = Int₁ = 1, 2; M^⊥ has odd determinant valuation, hence nonsplit; r = 0 is an identity | holds | none |
| 2.2 Tate classes by strata | d = 1, i = 1; Frobenius sign | H²(Y₁)(1) of dimension 1; 1+q²+q(q²−q) = 28 at q = 3, while eigenvalue +q gives −8 | holds | none |
| 2.3 Numerical reduction | n = 3; L♭_Λ/L♭ of length 1 | multiplicity 2; an equality of Euler characteristics only, as in LZ Corollary 5.3.3 (line 1047) | holds | none |
| 2.7 Higher local modularity | type-one point; type three at q = 3 | point: 1 − 1 = 0; curve: −8 on Λ with transform 8; shell 1 with transform −1; anisotropic transform 0 | holds | none |
| 5.4 Exotic Tate classes, deg ω | t = 4 at q = 3; t = 2; t = 6 | deg ω = 2, χ([O]−[ω]) = −2; point stratum; t = 6 outside LL2's proof | gap at t = 6 | R02 |
| 5.6 Component symmetry | Gram diag(1,1), basis e₁, e₁+e₂; n even | det θ = −1, det(−1) = (−1)^n = 1; h(x₁,x₂) = 1 against h(x₁,−x₂) = −1 | holds | none |
| 9.5 AFL rank reduction | q = n = 3; q = n = 5; d = (ϖ⁻¹+ϖ)/2 | 4 residues, at most 3 excluded; 6 against 6; valuations −1, 0, 1 give a unit, v(1−ξd) = −1 | holds | none |
| 9.8 Low-rank AFL | ℚ₃, γ = ((−2,1),(−3,2)); ℚ₉, γ = ((−4,1),(−15,4)) | raw 1−3^s, ω = 1, ∂Orb = −log 3, Int 1; raw 1−9^s, ∂Orb = −log 9 = −1·log q | holds | R03 |
| 9.1 / 12.10 controls | g = ((1,1,−1/2),(0,1,−1),(0,0,1)), Gram 3J | gᵗ(3J)g = 3J; det(u,gu,g²u) = −1; n = 4 determinants 8 (d = −1) and 0 (d = 1), computed | holds | none |
| 12.6 Arithmetic divisor series | principal divisors; fibre V_p | (div f, −log‖f‖²); (V_p, 0) = (0, 2 log p) at Z line 2345; constant term −φ(0)ĉ₁(ω̂) is Z (8.15) | holds | none |
| 12.6a GSpin Chow modularity | p = 2, 4; x²−3y²−3z²; 𝔰𝔬(p,2) roots | weights 2 and 3; anisotropic by 3-descent, isotropic after ⊥W at (1,1,1,1,0); dim(𝔲∩𝔭) = 1 at p = 2, ≥ 2 at p ≥ 3 | holds | R01 |
| 13.5 Semi-global ASW | almost self-dual level; c_K | covered by LZ line 3650; c_K = (−1)^n/vol(K): sign + at n = 2, − at n = 3 | holds | none |
| 13.6 Green star products | n = 3, m = 1 and m = 3 | bidegree (0,0), no scalar; bidegree (2,2), integral defined; star formula equals LZ line 3787 | holds | none |
| 14.1 Relative trace series | ζ < 0 at infinity | MZ (7.7): Orb = 0, ∂Orb = ½χ₁a^(1/2)e(ζ(b+ia))Ei(−4πa\|ζ\|); entire by Z Theorem 12.14 | holds | none |
| 3.5 Unramified KR identity | n = 1, a = 3; a = −3; L♭ = ⟨ϖ⟩ | 2 = −D′(1) = 2; 0 = 0, while (a+1)/2 = −1; val(u) = 2 and w+u^∨ of valuation −2 | holds | none |
| 4.5 Almost self-dual identity | a = 0, 2 at q = 3 | (Int_Y, Den, ∂Den_Λ) = (0,1,1), (1,1,5): 0 = 1−1 and 4 = 5−1; D_Λ = (1−X)(1+qX)+X²(1−X) | holds | none |
| 6.8 Exotic KR identity | invariants (1,1), (1,3) | Int 2 = ∂Den 2; Int 4 = 2·2, the overlattices being L and ⟨e₁, u⁻¹e₂⟩ only | holds | none |
| 8.7 Krämer KR identity | rank two, invariants (2,2), χ = ±1; H₁ | 2−2q on both sides; 2+2q on both sides; 1−q on both sides | holds (n ≥ 4 conditional) | none |
| 12.5 / 12.7 Borcherds products, modularity | Q = −x²−y², w = (1,i); μ = ((1+i)/2,0,0) | [w,w] = 0, [w,w̄] = −4, ‖w‖² = 1/(πe^γ); Q(μ) = ½ shows the cusp condition is needed | holds | R01 |
| 12.9 CM series modularity | F₀ = ℚ, n = 3; n = 2 | modular by §§12.5–12.7; n = 2 excluded: weight 0 leaves f determined only up to constants | holds | none |
| 13.8 / 13.10 ASW formulas | level index m at a split place | c_(K′) = m·c_K matches (−1)^n/vol; the product (−1)^n·vol would divide by m | holds | none |
| 14.5 Strongly regular AFL | n = 2, a = 1, 3; (n,p) = (5,5) | ∂Orb/log p = −1, −2 = −Int; part (a) excluded at 5 = 5, where all 6 residues of F^1 can be excluded | holds | none |

- Source locators: 79 checked against the cached texts of 12 sources (LZ 26, Z 16, LL2 9, Bor99 7, Zha12 6, YZZ09 5, MZ 3, KM90 2, Bor98 2, VZ84 1, K 1, Mih16 1). Two are wrong: R02 and R03.
- Pinned library: 6 declarations opened, all as described: TauCeti AlgebraicGeometry/FormalScheme/Spf/Carrier.lean:73, Spf/StructureSheaf.lean:262, NumberTheory/IntegralLattice/LocalDensity/Basic.lean:546, AlgebraicGeometry/Chow/Basic.lean:295; Mathlib NumberTheory/LocalField/Basic.lean:46, Algebra/Module/PID.lean:230.
- Cross-roadmap citations: 162 section citations into 28 roadmaps resolved on main or at the cited heads, plus the named targets `fourierUnitVanishing`, `ClassicalAlgebraic.supportLocalization` and `ClassicalAlgebraic.properSupports`. All 8 gap slugs are the same in plan.json and the README.
- Gate: every check 0, OK. Depcheck output: "depcheck: 261 roadmaps, 2526 edges, 0 problem(s)"; this roadmap is at position 380, after GrossZagierAndArithmeticHeights (369) and LubinTateFormalModulesAndQuasiCanonicalLifts (374).
- Elaboration: `lake env lean` on Suggested.lean exits 0 with no warning. It declares nothing, so there was no signature to `#check` and nothing to probe for padding.
- Statability: no headline is statable at the pins. Neither library has Rapoport–Zink spaces, Shimura varieties, hermitian densities, unitary Eisenstein series or orbital integrals, and the docstring names each missing carrier.
- Checks: about 70 README Checks recomputed, the §§9.1 and 12.10 matrices numerically; all hold.

Overlap check: read PELModuliPartII, ComplexMultiplicationAndExplicitReciprocityPartII, GrossZagierAndArithmeticHeights, MetaplecticAutomorphicForms, HodgeClassesForJacquetLanglands, SchemeKTheoryOperationsPartII. Shared objects and their owners:
- unitary RZ spaces and RSZ models: PELModuliPartII; its §2.4 divisor Z(x₀) is §0.2's Z(O_F·x₀), stated on both sides;
- the Weil representation and the uncertainty principle: MetaplecticAutomorphicForms §§2.1–6.7;
- the quaternionic Picard-valued series and quasi-canonical lengths: GrossZagierAndArithmeticHeights §§6.20 and 7.2 (§12.6a(d) at p = 2 lives on M′_K and neither uses nor re-proves §6.20);
- formal-scheme K-theory: SchemeKTheoryOperationsPartII, with the declared gap;
- GSpin Kudla divisors and generic-fibre Borcherds products: two owners (R01);
- HodgeClassesForJacquetLanglands: nothing shared.

Source independence: 20 passages compared with 9 sources (LZ, Z, LL2, Zha12, YZZ09, KM90, Bor99, MZ, K). Only formulas and one 10-word statement are shared (§2.2 against LZ Theorem 5.3.2). Largest share: Z, 63 of 322 locators (LZ 62). Contents compared with Z and LZ: independent. Layers 9–14 interleave Z §§3–15 with LZ §§12–15, BHKRY, YZZ09 and Bor99, and Layer 3 places LZ §3 after LZ §§4–6 because §3.5 needs §§2.5 and 3.4.

## Not verifiable

- Lusztig76: uncertified (paywalled, DOI 10.1007/bf01408569). §2.1 was checked through LZ line 1007 and LL2 line 1187, and the ²A₃ case proposed in R02 was not read.
- McGraw03: uncertified (paywalled, DOI 10.1007/s00208-003-0413-1). §12.6a(f)(ii) was not checked against it.

## Source issues

- **Error** in LZ at the display after Remark 6.4.2, p. 38: the source says the Chern character of the derived restriction is ch(O(−Z(x))) − ch(O); it should be ch(O) − ch(O(−Z(x))) = 1 − exp(−c₁(O(Z(x)))); affects nothing.
- **Misprint** in LL2 at the proof of Lemma 2.56, p. 34: the source says θ sends x_i to 1 for i ≤ n−1; it should be θ(x_i) = x_i for i ≤ n−1; affects nothing.
- **Gap** in LL2 at the proof of Lemma 2.32, p. 24: the source says the cases t(Λ) = 2, 4 and t(Λ) > 6 exhaust the proof; it should be completed at t(Λ) = 6, where ²D₃ = ²A₃; affects the proof.
- **Misprint** in YZZ09 at §4.1, pp. 1158–1159: the source says the first case is n > 3 and the second n ≤ 2, omitting n = 3; it should be n ≥ 3 in the first case, where the Vogan–Zuckerman vanishing holds; affects the proof.
- **Error** in K at Lemma 9.6, pp. 74–75: the source says every x off L♭ ⊕ W gives a presentation with smaller val(L♭); it should be restricted, since L = H₁, L♭ = ⟨l₁+πl₂⟩, x = l₂ has none; affects the proof.
- **Gap** in Z at the proof of Proposition 4.12(i), p. 23: the source says integrality of det(1 − g) makes 1 − d a unit after g′ ↦ ξg′, though g changes with ξ; it should be that ξ also avoids ξd ≡ 1, needing q ≥ n+1 or n ≤ 3; affects a stated result.

## For the human reviewers

- Scope: the Krämer identity (§8.7) and the modified arithmetic Siegel–Weil formula (§13.10) are headlines stated in rank n ≥ 4 under the hypothesis (H_m) (README line 1169), which the README says no published argument proves. K Lemma 9.6 fails as stated (K lines 3934–3970).
- Scope: §14.5 asserts less than Z Theorem 15.1, excluding the group version at p = n ≥ 5 because of the gap in Z's proof of Proposition 4.12(i) (Z line 1313).
- Sources: LRZ (arXiv 2404.02214v2, References line 2073) is cited as a preprint with no journal reference. It supplies the integral geometry of §4.2 that the headline §4.5 uses.
