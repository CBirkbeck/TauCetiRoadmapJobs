<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13085#issuecomment-6912873222 -->
Red team round 2 pass a (claude) of 4b9f20f

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) The exotic trace dual of §5.1 is taken in V, so lattices of lower rank have no invariants

   **Location.** `README.md:683` (§5.1): "Define the trace dual of an O_F-lattice Λ ⊂ V as Λ^∨ = {x ∈ V : h(x, Λ) ⊂ u⁻¹O_F} … for integral Λ of rank m its fundamental invariants a₁ ≤ ⋯ ≤ a_m are the exponents with Λ^∨/Λ ≅ ⊕ O_F/u^(a_i)".

   **Claim.** The definition gives integrality, vertex lattices, invariants, val and t for the lattices of every rank used in Layers 5–6 (L♭ of rank n−1 in §§6.2–6.7, A = M ∩ H in §6.3, the line ⟨e⟩ of the §5.1 Check).

   **Witness.** n = 2, Λ = O_F·e, h(e,e) = 1, f ⊥ e: F·f ⊂ Λ^∨, so Λ^∨/Λ is not a finitely generated torsion module, while `README.md:699` asserts Λ^∨ = u⁻¹⟨e⟩ with invariant 1. LL2 line 512–520 takes L of full rank in its own space.

   **Repair.** In §5.1 replace the first quoted clause by: "For an O_F-lattice Λ ⊂ V whose span Λ ⊗ F is nondegenerate, define its trace dual Λ^∨ = {x ∈ Λ ⊗ F : h(x, Λ) ⊂ u⁻¹O_F}, the dual inside its own span for the pairing Tr_(F/F₀) h; for Λ of full rank this is {x ∈ V : h(x, Λ) ⊂ u⁻¹O_F}", and in the API bullet at `README.md:688` write "Λ^∨ = {x ∈ Λ ⊗ F : h(x, Λ) ⊂ u⁻¹O_F}". Add the Check: "The dual is taken in the span: for n = 2 and Λ = O_F·e with h(e,e) = 1, the set {x ∈ V : h(x, Λ) ⊂ u⁻¹O_F} contains the whole line e^⊥ and its quotient by Λ is not of finite length, whereas Λ^∨ = u⁻¹O_F·e." Tested on the witness: Λ^∨/Λ ≅ O_F/u, invariant 1, as the existing Check says.

2. **F02** (P2) The almost self-dual term of the modified Eisenstein derivative has no test function and no volume ratio

   **Location.** `README.md:1882` (§13.9): "at an almost self-dual inert place add c₀·E_v^coh with c₀ = −1/(q_v+1) and log(q_v²)".

   **Claim.** This defines the correction at an almost self-dual place, and §13.10 holds with it.

   **Witness.** K line 219, (1.7): every vEis_t, t = 0 included, is vol(K_(G,v))/vol(K_(Λ_t^♯,v))·E(z, 0, φ^v ⊗ 1_((Λ_t^♯)^n)); K line 230, (1.9), uses vEis₀. E_v^coh is defined nowhere in the README. The ratio is not 1: LL1 line 2044 gives (q+1)/(q^(2r) − 1), which is 1/2 at q = 3, n = 2.

   **Repair.** Replace the quoted clause by: "at an almost self-dual inert place v add c₀·(vol(K_(G,v))/vol(K_(Λ₀,v)))·E(z, 0, φ^v ⊗ 1_(Λ₀,v^n))·log(q_v²), where c₀ = −1/(q_v+1), Λ₀,v is a self-dual lattice in the split hermitian space at v of the coherent collection nearby at v, K_(Λ₀,v) is its stabilizer, and the volumes are for the Haar measures of K (1.7), as at the ramified places". Add the Check: "The volume ratio is part of the term: for n = 2r it is (q_v+1)/(q_v^(2r) − 1) (LL1 §9, p. 44), so the coefficient of the coherent value is −1/(q_v^(2r) − 1) times log(q_v²), which is the term −(log q)/(q+1)·W_T(φ₀) of §4.6 after dividing by (q^(2r) − 1)/(q+1); at q = 3, n = 2 the ratio is 1/2, and omitting it doubles the correction." Tested: c₀·ratio = −1/(q^(2r) − 1), which is the coefficient of LL1 line 2038 relative to W′_T(φ₁), consistent with §4.6.

3. **F03** (P3) The n ≤ 3 converse of §9.5(b) uses d ∈ O_F without assuming it

   **Location.** `README.md:1284` (§9.5(b)): "so det(1 − g) ∈ O_F, and a unit det(1 − ξg′) = (1 − ξd)·det(1 − g) forces 1 − ξd ∈ O_F^×".

   **Claim.** Integrality of det(1 − g) and a unit det(1 − ξg′) give a unit 1 − ξd.

   **Witness.** They give only v(1 − ξd) ≤ 0. In V₃ = ⟨e, f⟩ ⊥ ⟨a⟩ of §0.7, u₀ = e + f/2, g′ = diag(ϖ⁻¹, ϖ, 1): d = (ϖ⁻¹ + ϖ)/2; for ξ ∈ F^1 with v(1 − ξ) = 1, det(1 − ξg′) is a unit and v(1 − ξd) = −1. Z line 1307 assumes d ∈ O_F first.

   **Repair.** Insert before "for every ξ ∈ F^1": "One may assume d ∈ O_F, since otherwise both sides of the group statement vanish: d is the (n, n) entry of γ′, unchanged by GL_(n−1)(F₀)-conjugation, so the unit orbital integral is zero for every s; and a point of Δ ∩ (1 × g′)Δ makes g′ an endomorphism of X × Ē, whose Ē-component d lies in End_(O_F)(Ē) = O_F." Replace "forces 1 − ξd ∈ O_F^×" by "gives v(1 − ξd) ≤ 0, hence 1 − ξd ∈ O_F^× because d ∈ O_F; a ξ with 1 − ξd = 0 does not occur, since a nearby ξ′ in its residue class would have det(1 − ξ′g′) a unit and 1 − ξ′d a nonunit". Tested on the witness: it is excluded by d ∉ O_F, where both sides are zero. (This element is not regular; it shows only that the implication needs the hypothesis. The clause is used nowhere: §9.8 Check, `README.md:1328`.)

4. **F04** (P3) §12.6a states again, without a citation, the generating series the base roadmap owns on products of Shimura curves

   **Location.** `README.md:1639` (§12.6a(d)): "for every totally real F₀, ℚ included, and every p ≥ 1 … Z′_φ is the q-expansion of a holomorphic Hilbert modular form of parallel weight p/2 + 1"; `README.md:7`: "GrossZagierAndArithmeticHeights stops at Shimura curves".

   **Claim.** No earlier roadmap owns any case of the Chow-valued modularity.

   **Witness.** GrossZagierAndArithmeticHeights README line 2047 at its open head, "### 6.20 Picard-valued generating series": the series of Hecke correspondences Z(x)_U on X_U × X_U "defines a weight-two automorphic form". This is the case p = 2 of (d), for the quaternionic quadratic space, weight p/2 + 1 = 2.

   **Repair.** Add to §12.6a after (d): "For p = 2 and (U, Q) the reduced-norm space of the quaternion algebra of a Shimura curve X, M′_K is a union of components of X_U × X_U and (d) is the modularity of the Picard-valued generating series of GrossZagierAndArithmeticHeights §6.20, which owns that case with its own normalization of the Hodge term and of the stabilizer weight; (d) is not used to re-prove it, and §6.20 is not used in the proof of (d)." Add to the Checks: "At p = 2 the weight is 2, the weight of GrossZagierAndArithmeticHeights §6.20." Add "GrossZagierAndArithmeticHeights §6.20" to the ownership sentence on Layers 6–9 at `README.md:7`.

Round 2. `packages/GrossZagierAndArithmeticHeightsPartII/README.md` was read in full (2074 lines) and `Suggested.lean` in full (67 lines, no declarations). Four new findings: two P2 (S01, S02), two P3 (S03, S04). The thirteen findings of round 1 are repaired; one repair (b/F05) introduced S01.

## Round-1 findings at this head

| Id | Status | Repaired passage (witness) |
|---|---|---|
| 1a/F01, 1b/F02 (§8.6 has no route; K Lemma 9.6) | repaired, applied differently | `README.md:1162`: "Prove that for every integral lattice L of rank n ≥ 3 … whose fundamental invariants are all positive and whose largest invariant a_n(L) is odd, Int(L) = ∂Den(L)"; "In rank n ≥ 4 no published argument proves the statement". Rank three is HSY23a Theorem 1.2 (HSY23a line 161). The dependence is stated at `README.md:3`, `:154`, `:1175`, `:1901`, `:2026`, `:2041` and `Suggested.lean:17–20`. K lines 3969–3970 confirm the gap: the proof takes the first n−1 vectors of a normal basis, which span a degenerate lattice when the last block is hyperbolic. §8.6 stays a target without a route in rank n ≥ 4; that is disclosed and goes to the human reviewers below. |
| 1a/F02, 1b/F03 (group AFL at p = n) | repaired | `README.md:1987`: "Conjecture 3.8(a) holds … when p ≥ n + 1, and for every odd p when n ≤ 3"; `README.md:1284`: "the converse at q = n ≥ 4 is not a target here". The induction was rechecked: step n uses part (a) for S_(n−1) only at primes p′ ≥ n. The n ≤ 3 clause added to §9.5(b) has a small hole, S03. |
| 1a/F03, 1b/F01 (Krämer rank two unowned) | repaired | `README.md:1005–1027`, new §7.5a. Its formulas equal HSY23b Theorem 1.1 (HSY23b lines 146–166) and Shi22 Theorem 1.2 (Shi22 lines 154–162); the divisor decomposition equals HSY23b Theorem 1.2 (lines 188–199) and Shi22 Theorem 1.1 (lines 132–143). §7.7 now reads "with Int(I₂) = 0 of §7.5a" and equals K Proposition 2.12 (K lines 609–613). |
| 1a/F04, 1b/F04 (compound gap) | repaired | `README.md:138–146`: five contracts, one deliverable each; the eight slugs of `design/plan.json` `gaps` equal the eight `gap:` slugs of the README. The two homogeneous requests agree with GanGrossPrasadUnitaryGroups README lines 150 and 154 at its open head. |
| 1a/F05 (HRR supplier) | repaired | `README.md:82`: "§§5.1, 5.3–5.4, 5.7 and 5.8 (… Hirzebruch–Riemann–Roch …)"; SchemeAndStackFoundations on main has "### 5.8 Grothendieck–Riemann–Roch and Hirzebruch–Riemann–Roch" (its README line 8498). §2.7 *Needs* has §5.8. |
| 1a/F06 (title) | repaired | `README.md:1`: "# Roadmap: Gross–Zagier formulas and arithmetic heights, part II — …". |
| 1b/F05 (exotic trace dual cited to §2.7) | partly repaired | `README.md:683` defines the trace dual in §5.1 and `README.md:66` stops citing 2.7.1–2.7.3 for the exotic setting. The new definition takes the dual in the ambient V for lattices of every rank: S01. |
| 1b/F06 (Howard19 locators) | repaired | `README.md:724`, `:915`: "Howard19 Theorem B, p. 2, which is his Theorem 5.1, with its K-theoretic form Corollary C, p. 2". Howard19 lines 58, 78, 107, 533 and line 12 (quadratic extension of ℚ_p) agree; HSY23b lines 139–141 carry the footnote on general F₀. |
| 1b/F07 (missing headline) | repaired | `README.md:2026` and `Suggested.lean:24–26` name the Chow-valued modularity; `Suggested.lean:50–54` says why it is not statable. `TauCeti.AlgebraicGeometry.Chow.ChowGroup` exists at the pin (TauCeti/AlgebraicGeometry/Chow/Basic.lean:295). |

## The adversarial pass (computed values)

| Statement | Instance | Values computed on each side | Result |
|---|---|---|---|
| §1.3 degree | val h(y,y) = 1, 3 | Z₁: q+1; Z₃+Z₁: q³+q²+q+1; D(−q) for 1−X and 1−X+X²−X³: the same | holds |
| §2.1 Check 4 | 0 < 2j ≤ d | H^(2j) dual to H_c^(2d−2j)(d): m = 2d−4j, 2d−4j+1; q^(2d)/(−q)^m·q^(−2j) = q^(2j), −q^(2j−1) | holds |
| §2.4 transform | x ∈ Λ; isotropic and anisotropic x̄ | −q²(1+q)q⁻³ + (q³+1)q⁻¹ = q² − 1; −(1+q)/q + 1/q = −1; −(1+q)/q + (q+1)/q = 0 | eigenvalue −1 |
| §3.1 Check 2 | L = ⟨ϖ⟩ | norm-one kernel mod ϖ^(N−1): (q+1)q^(N−2); lifts q²; density (q+1)q^N/q^N = q+1 | holds |
| §4.3 Check | rank one, val 2 | D_Λ = (1−X)[(1+qX) + X²]; −D′(1) = (1+q) + 1 | q + 2 |
| §4.4–4.5 | rank one, expansion | (q+1)Int_Y = ∂Den_Λ − #{self-dual Λ ⊃ L}; Den(L) = D_L(1) counts self-dual overlattices | −Den(L) term |
| §4.6 | LL1 line 2066 | (q^(2r)−1)/(q+1)·W′_T(Λ^R) − (log q)/(q+1)·W_T(Λ^⋆), q the residue cardinality of the totally real place (LL1 line 176) | equal to §4.6 |
| §5.5 against §6.1 | invariants (3,3) | overlattices: L, q+1 of index q, u⁻¹L; none of the form L + u⁻²v (anisotropic residual form); 2(q+3) | equal |
| §6.1 Check 4 | q = 3 | (1 − 1/9)(1 − 1/81) = (8/9)(80/81) | 640/729 |
| §6.5 | Λ of type four | −q(1+q) + q² + 1 = 1 − q; transform q − 1; −1; 0 | eigenvalue −1 |
| §6.7 Check | a = 3 | N(u) = −u²; h(u⁻¹e, u⁻¹e) = −β; −β + β = 0; plane ⟨βu², β⟩ hyperbolic, so nonsplit needs −β₁β₂ a nonsquare | holds |
| §7.5a against §8.2 | χ = 1, (α,β) = (1,1) | ∂Pden: L 1−q; 2 isotropic lines 1−q each; q−1 anisotropic lines 1 each; unimodular 0 | 2 − 2q both |
| §7.5a against §8.2 | χ = −1, (1,1) | L 1+q; q+1 lines 1 each; 2(3+q) − 4 | 2 + 2q both |
| §7.5a divisor | χ = −1, x of valuation a | unique type-zero Λ, m_Λ(x) = a; Shi22: (a+1)·Exc; horizontal Z₀ + Σ_(s=1)^a Z_s^± | equal |
| §7.5a divisor | χ = 1, unit-norm x in Λ^♯ of type two | x = f₁ + πc₀f₂: norm −2c₀, m = 0 | multiplicity 0, consistent |
| §7.7 hypothesis | integral L₂ | every maximal integral lattice is unimodular: x ∈ Λ^♯, πx ∈ Λ gives h(x,x) ∈ π⁻¹O_F ∩ F₀ = O_F₀ | I_r ⊃ L₂ exists |
| §7.7 route | HSY23a Corollary 3.6, m = n−1 | (−1)^m·(−2)^0 = (−1)^(n−1) = (−1)^r for r = n−1 | equals K (2.14) |
| §7.8 | W_(≥−1) = O_F·w₁ | trace dual: a·h(w₁,w₁) ∈ π⁻¹O_F, π-valuation −2, so a ∈ πO_F | W_(≥0) |
| §8.6 | H₁ ⊥ H₁, L♭ = H₁ ⊥ ⟨l₃+πl₄⟩ | norm −2π₀; W = ⟨l₃−πl₄⟩; l₄ has coefficient 1/(2π); val(L♭) = 4 = val(L) − 1 + 1 | no decrease; K's L′♭ degenerate |
| §8.7 closing step | x ∈ W | Φ = 1_(L♭) ⊗ φ_W; φ_W = 0 at val ≤ 0, constant on val ≥ 0 | φ_W = 0 |
| §9.3 law | ℚ₃, γ = ((0,1),(1,0)), a = diag(3,1) | (−1)(−3^s) = 3^s; \|3\|^(−s)·1 = 3^s | holds |
| §9.3 Check 6 | χ of order four on 𝔽₉^× | trivial on 𝔽₃^× = {±1}; F^1 residues = ⟨g²⟩, χ(g²) = −1; exponent 1 − 2 = −1 | ω(ξγ) = −ω(γ) |
| §9.4 | Schur complement | det(1−g′) = (1−d)·det(1−h−(1−d)⁻¹uw*); c(0) = −1, (1+g)/(1−g) at −1 is 0 | holds |
| §9.5(b), n ≤ 3 | d = (ϖ⁻¹+ϖ)/2, v(1−ξ) = 1 | det(1−ξg′): −1 + 0 + 1 = 0; v(1−ξd) = −1 | S03 |
| §9.8 Check 2 | ℚ₉, γ = ((−4,1),(−15,4)) | γ² = 1; v(t) ∈ {0, −1}; 1 − 9^s; det(e, γe) = −1 = det γ | −log 9 |
| §10.3 Check | F = ℚ(i), p ≡ 1 mod 4 | A₀ⁿ: dimensions (n, 0); A: (n−1, 1) | not isogenous |
| §11.1 Check | α = T − i | ᾱ(0) = i; i⁻¹·T·(T⁻¹ + i) = T − i | conjugate self-reciprocal |
| §12.4 Check 4 | ℚ(i)³, z = (0,1,2) | x₂ = 2x₃; \|x₁\|² + 3\|x₃\|² = 1; ±i ≢ ±1 mod 5 | 2 against 0 |
| §12.5 Checks 1–2 | O_F³; O_F² ⊕ 3O_F | L′ = ½L, Q(μ) = ½; L′ third factor (1/6)O_F, 2μ ∉ L, Q(±μ) = −1 | hold |
| §12.6a(f) parity | k = 1 + p/2, σ = p − 2; k = 1 − p/2, σ = 2 − p | k − σ/2 = 2; 0 | factor 1 |
| §12.10 against §14.3 | AFL at v | ∂J_v = −log q_v·Σ Int·Orb; −2∂J_v = 2 log q_v·Σ Int·Orb | consistent |
| §13.9 | q = 3, n = 2 | c₀ = −1/4; ratio 1/2; c₀·ratio = −1/8 = −1/(q² − 1) | S02 |
| §14.5 induction | n = 4, n = 5 | semi-Lie on V₃ at p ≥ 5 uses S₃ at every odd p; on V₄ at p ≥ 5 uses S₄ at p′ ≥ 5 | never part (a) at p = n |
| §5.1 definition | n = 2, Λ = O_F·e | {x ∈ V} contains F·f; in the span: u⁻¹O_F·e | S01 |

## Suggested.lean

No declaration, so there is no row for a signature and no `#check @name` file was elaborated. Headline theorems of the README: §§3.5, 4.5, 6.8, 8.7, 13.8, 13.10, 12.6a–12.7, 12.9, 14.5. Each is named in the module docstring with the carrier it lacks; the pins have no Rapoport–Zink space, hermitian local density, Shimura variety, arithmetic Chow group or Jacquet–Rallis orbital integral (grep of both pins). The file has one `import Mathlib`, no `set_option`, no padding. The four names of `scratch/citations.md` are target names of GeometryOfNumbersAndQuadraticArithmetic §2.7 and EtaleCohomologyFoundations §§0.7–0.8, present there.

## Dependency check

`depcheck: 258 roadmaps, 2468 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line. This roadmap is at position 350 of `merge-order/ORDER.txt`; GrossZagierAndArithmeticHeights (340), which S04 asks to cite, is earlier.

## Verified sound

- **Declarations read:** 0 (the file has none). **Targets read:** all 108 numbered targets of Layers 0–14 with their API lists, Checks and *Needs*; every target has at least three Checks.
- **Checks tested:** 33 statements and Checks recomputed this round (table above); none false apart from the three behind S01–S03; the round-1 table was not repeated except where a repair touched the statement.
- **Locators verified:** 58 against the cached texts: HSY23b 6, Shi22 4, HSY23a 9, K 11, LL2 17, Howard19 5, LL1 3, LZ 2, Z 1. Pages agree with the versions named in References.
- **Sibling citations checked:** 68 section ids in 17 suppliers resolved to headings on main or at the open heads (GeometryOfNumbersAndQuadraticArithmetic, MetaplecticAutomorphicForms, EndoscopicTransferAndUnitaryTraceComparison and its Part II, LubinTateFormalModulesAndQuasiCanonicalLifts, GrossZagierAndArithmeticHeights, AutomorphicFormsOnReductiveGroups, ArakelovGeometryAndAbelianHeights, ShimuraCompactifications, QSeriesPartitionsAndMockModularForms, MotivesAndAlgebraicCycles, ShimuraVarieties, PELModuli, AutomorphicSpectralTheory, AutomorphicLFunctionsAndLocalFactors, FiniteFlatGroupsAndIntegralPadicHodgeTheory, SchemeAndStackFoundations). Statements read for GeometryOfNumbersAndQuadraticArithmetic 2.7.1–2.7.3 and 3.2.2–3.2.6 and for EndoscopicTransferAndUnitaryTraceComparisonPartII §§4.4–4.5 and its `jr-local-comparison` contract; all seven MetaplecticAutomorphicForms declaration names exist.
- **Pinned names:** `Module.equiv_directSum_of_isTorsion` (Mathlib/Algebra/Module/PID.lean:230), `IsNonarchimedeanLocalField` (Mathlib/NumberTheory/LocalField/Basic.lean:46), `TauCeti.FormalScheme.Spf.carrier`, `TauCeti.FormalScheme.Spf.structureSheaf`, `TauCeti.AlgebraicGeometry.Chow.ChowGroup`.
- **Gaps:** eight slugs in `design/plan.json`, the same eight in the README, each with a named supplier and section.
- **Ownership.** `roadmaps grep` for the arithmetic fundamental lemma, Kudla–Rapoport, Borcherds products, Kudla–Millson and regularized theta lifts over main and the open heads finds no second owner except the case of S04. FunctionFieldArithmetic cites Li–Zhang only for a density formula; ComplexMultiplicationAndExplicitReciprocityPartII (later in the order) has an integral Borcherds route of its own on GSpin models.
- **Policy.** The pull request changes only this package's folder; no pull-request numbers, process narrative, `lemma` or `set_option` in the README or the Lean file.

Source independence: 11 passages compared with 8 sources (HSY23b Theorems 1.1–1.2, Shi22 Theorem 1.1, K Proposition 2.12, Theorem 7.1, Lemma 9.6 with proof and (1.7)–(1.10), HSY23a Proposition 3.2, LL2 Definition 2.10 and Lemma 2.57, Z Proposition 4.12 proof, LL1 (9.2)–(9.3), LZ Theorem 5.4.1), none shared beyond formulas and runs of under ten words; largest share LZ, 49 of about 225 locators; contents compared with LZ (§§2–15): independent (LZ §3 is split between §0.9 and Layer 3, LZ §§5–6 are regrouped as Layers 1–2, LZ §§11–15 are spread over Layers 10 and 13).

## Not verifiable

- Whether §8.6 is true in rank n ≥ 4, and whether the converse of §9.5(b) holds at q = n ≥ 4: no proof and no counterexample found; only the published arguments fail.
- The published versions of K (Invent. Math. 2023) and Z (Ann. of Math. 2021) were not read; the gaps are located in the arXiv versions named in References.
- Lusztig76 and McGraw03: settled as uncertified, cited by locator only.
- LL2 Lemma 2.57: the extraction prints strict inequalities (LL2 lines 1753, 1759) where the README has r ≥ 2 and a ≥ 3; the README's a = 3 example was recomputed and is correct, so the extraction is taken to have lost the glyph.
- Ownership against the open pull requests whose files the brief does not list was checked only through `roadmaps grep` and `roadmaps show`.

## Source issues

- **Gap** in K at Lemma 9.6, proof, p. 75: the source takes the first n−1 vectors of a normal basis as the new rank n−1 lattice; it should treat a last block that is hyperbolic, where that lattice is degenerate; affects the proof.
- **Error** in K at Theorem 8.2, p. 64: the source says the analytic vertical partial integral vanishes on normal vectors of negative valuation; it should claim only constancy on the nonnegative cone; affects a stated result.
- **Gap** in Z at Proposition 4.12(i), proof, p. 23: the source assumes the characteristic polynomial of the Cayley partner g integral because otherwise both sides vanish; it should justify that vanishing when 1 − d is not a unit; affects the proof.

## For the human reviewers

- **Scope.** §8.6 (`README.md:1158–1171`) is a target with no proof route in rank n ≥ 4; §8.7 and §13.10 at ramified places rest on it, and both are listed as headlines (`README.md:2026`, `Suggested.lean:17–23`).
- **Scope.** The README states that two refereed proofs are incomplete (K Lemma 9.6; Z Proposition 4.12(i) at q = n) and one clause false (K Theorem 8.2), `README.md:2040–2044`; the published versions were not compared.
- **Licence.** LRZ (arXiv:2404.02214v2) is an unpublished preprint on which §§4.2 and 4.5 rest; LL1, LL2 and Zha12 are author copies and YZZ09 is read from an institutional archive (`README.md:2050–2051`, `2069–2070`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4b9f20f911dc56f12bbdecdf6e0d407c0813400a", "job": "RT-GrossZagierAndArithmeticHeightsPartII~2a", "model": "fable", "worker": "chris-x52"} -->
