<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13085#issuecomment-6911167715 -->
Red team round 1 pass b (claude) of 71f5745

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) The Krämer rank-two base case is used and owned by nobody

   **Location.** `packages/GrossZagierAndArithmeticHeightsPartII/README.md:1016` (§7.7): "…in particular
   Int(I_n) = δ_odd(n) (K Proposition 2.12, p. 15)"; `README.md:1138` (§8.7): "rank two and the
   cancellation law §7.7 give the base cases"; `README.md:1114` (§8.5).

   **Claim.** The cancellation law gives Int(I_n) = δ_odd(n), and a rank-two Krämer identity is available
   as the base of the induction of §8.7.

   **Witness.** The law of §7.7 is unchanged under Int ↦ Int + c, so it cannot give Int(I₂) = 0. K line 614
   takes Int(I₂) = 0 from Shi22 Theorem 1.3 and HSY23b Theorem 1.3; K lines 3894–3895 take the n = 2
   horizontal identity from their Theorems 1.1. No README target, supplier or source entry states them.

   Further facts checked: `sources.toml` has no entry for either paper; the unramified and exotic settings
   do have their rank-two targets (§1.4, §5.5), the Krämer setting has none; §7.1 defines the Krämer space
   for n ≥ 2 only, so §7.7 at r = 1 (the only other way to reach Int(I₂)) is not defined. The text of
   HSY23b (He–Shi–Yang, *The Kudla–Rapoport conjecture at a ramified prime for U(1,1)*, arXiv:2011.01356v3)
   was fetched through the sources service for this pass: its Theorem 1.1 (line 146, p. 4) gives the
   values quoted below; Shi22 (Y. Shi, *Special cycles on unitary Shimura curves at ramified primes*,
   Manuscripta Math.) resolves only to a paywalled page and is cited by locator.

   **Repair.** Insert after §7.5:

   > ### 7.5a Krämer rank-two intersection numbers
   >
   > Prove that for n = 2 and either sign χ(V), Int(L) = ∂Den(L) for every rank-two O_F-lattice L ⊂ V.
   > Explicitly Int(L) = 0 unless L is integral, and for integral L: if L has Gram matrix equivalent to
   > diag(u₁(−π₀)^α, u₂(−π₀)^β) with u_i ∈ O_F₀^× and 0 ≤ α ≤ β, then Int(L) = α + β − 2q(q^α − 1)/(q − 1)
   > when V is isotropic and Int(L) = 2·Σ_(s=0)^α q^s(α + β + 1 − 2s) − α − β − 2 when V is anisotropic; if L is
   > the hyperbolic lattice with Gram matrix (0, π^b; (−π)^b, 0), b odd (V isotropic), then
   > Int(L) = b + 1 − (q + 1)(q^((b+1)/2) − 1)/(q − 1) (HSY23b Theorem 1.1, p. 4, and Theorem 1.3, p. 5, for
   > isotropic V; Shi22 Theorems 1.1 and 1.3 for anisotropic V; these are the inputs of K Proposition 2.12,
   > p. 15, and of K Lemma 9.3 at n = 2, p. 73). The route decomposes the special divisor Z(x) on the Krämer
   > space of rank two into the quasi-canonical horizontal components of §7.5, the exceptional divisors
   > Exc_Λ₀ and the vertical projective lines of the type-two vertex lattices, by local equations at the
   > superspecial points, and computes the pairwise intersections with the lengths of
   > GrossZagierAndArithmeticHeights §7.2.
   >
   > **Checks.**
   >
   > - α = β = 0, V isotropic: Int(I₂) = 0 + 0 − 0 = 0 = δ_odd(2), the base value that §7.7 cannot produce.
   > - The hyperbolic lattice H₁ (b = 1): Int = 2 − (q + 1) = 1 − q; on the analytic side ∂Pden(H₁) = 1 − q
   >   (§8.2, full type two, χ = 1) and the q + 1 unimodular overlattices contribute δ_odd(2) = 0 each, so
   >   ∂Den(H₁) = 1 − q. At q = 3 both sides are −2.
   > - The two formulas are different functions of (α, β): at (0, 1) both give 1 (isotropic 0 + 1 − 0;
   >   anisotropic 2·2 − 3), while at (1, 1) the isotropic one gives 2 − 2q and the anisotropic one
   >   2(3 + q) − 4 = 2 + 2q, which are −4 and 8 at q = 3.
   >
   > *Needs:* §§7.1, 7.4–7.5; GrossZagierAndArithmeticHeights §7.2; LubinTateFormalModulesAndQuasiCanonicalLifts
   > §§6.2, 6.5 and 7.1; gap:ramified-hermitian-densities for the density side.

   In §7.7 replace "in particular Int(I_n) = δ_odd(n)" by "and, with Int(I₂) = 0 of §7.5a,
   Int(I_n) = δ_odd(n) for n ≥ 2", state "r ≥ 2" in the hypothesis, and add §7.5a to its *Needs*. In §8.5
   add §7.5a to the route and *Needs* for the case n = 2. In §8.7 replace "rank two and the cancellation law
   §7.7 give the base cases" by "§7.5a (rank two) and the cancellation law §7.7 give the base cases" and add
   §7.5a to *Needs*. Add HSY23b and Shi22 to References and to `sources.toml` (HSY23b: arXiv:2011.01356v3;
   Shi22: uncertified, by locator). Tested on the refuting instance: Int(I₂) = 0 is now a stated value and
   Int(I₃) = Int(I₂) + 1·(1 − 0) = 1.

2. **F02** (P2) §8.6 has no proof route, its only witness lies in the base rank, and §8.7 is announced as proved

   **Location.** `README.md:1126` (§8.6): "A proof may supply a separate identity for lattices containing a
   hyperbolic block H_b with this property, or a different well-founded invariant for the induction";
   `README.md:3` (Summary): "prove the Kudla–Rapoport identities".

   **Claim.** §8.7 (K Theorem 1.3) is proved by the stated route; §8.6 isolates the missing step with the
   split plane H₁ as its instance.

   **Witness.** §8.6 names no route and no source. Its instance H₁ has rank two, which §8.7 lists as a base
   case (R01: Int(H₁) = 1 − q = ∂Den(H₁)), so it does not show that the induction needs §8.6. A rank-four
   instance does: L = H₁ ⊥ H₁.

   Computation for L = H₁ ⊥ H₁ (basis l₁, …, l₄, χ(V) = 1, n = 4): h(L, L) ⊂ πO_F, so every primitive
   nondegenerate L♭ ⊂ L of rank three has all invariants ≥ 1 and, having odd rank, a rank-one block of even
   invariant ≥ 2; hence val(L♭) ≥ 1 + 1 + 2 = 4, attained by L♭ = H₁ ⊥ ⟨l₃ + πl₄⟩ with x = l₄ (projection
   coefficient 1/(2π) ∉ O_F, as in the README's Check). L has invariants (1,1,1,1), no rank-one orthogonal
   summand and no unimodular summand, so no decomposition has x ∈ L♭ ⊕ W, §7.7 does not apply, and no
   decomposition lowers val(L♭) below 4. The induction of K Theorem 9.7 (K lines 3981–4001) therefore never
   reaches Int(H₁ ⊥ H₁) = ∂Den(H₁ ⊥ H₁).

   **Repair.** (a) Add to §8.6 the Check: "Rank four, no unimodular summand: for L = H₁ ⊥ H₁ every primitive
   nondegenerate rank-three L♭ has invariants ≥ (1, 1, 2), so val(L♭) ≥ 4, with equality for
   L♭ = H₁ ⊥ ⟨l₃ + πl₄⟩ and x = l₄; L has no rank-one orthogonal summand, so x ∉ L♭ ⊕ W for every
   decomposition, and neither the cancellation law §7.7 nor the rank-two base §7.5a reaches it. The plane
   H₁ itself is the rank-two base case, Int(H₁) = 1 − q." and reword the first Check accordingly ("in rank
   two this is covered by §7.5a; the obstruction to the induction starts in rank four"). (b) Say what is
   and is not established: in the Summary, in §8.7's first sentence, in the "Acceptance file" section and
   in the fourth headline bullet of `Suggested.lean`'s docstring, add "the induction of the published proof
   does not cover the lattices of §8.6 (for instance H₁ ⊥ H₁); §8.6 states that case as a target for which
   no proof is known to this roadmap, and §8.7, and with it §13.10 at ramified places, are proved
   conditionally on it". (c) Either supply a route for §8.6 (the exotic analogue is the two-overlattice
   argument of §§6.7–6.8: confine Φ to a finite union of lattices and apply the uncertainty principle on the
   residual plane) or keep (b). Tested on the refuting instance: H₁ ⊥ H₁ is then named as conditional rather
   than proved.

3. **F03** (P2) The group AFL at p = n ≥ 5 rests on a step the README says may fail

   **Location.** `README.md:1948` (§14.5): "the group AFL for S_n follows from the semi-Lie one by §9.5(a) for
   p ≥ n+1 and by the q = n step of §9.5(b) for p = n"; `README.md:1246`; `Suggested.lean:23–24`.

   **Claim.** Conjecture 3.8(a) for S_n is proved for F₀ = ℚ_p and every odd p ≥ n.

   **Witness.** §9.5(b) makes the q = n converse "a separate target: … find ξ … or prove the implication by
   another argument", with no route, and its Check says "the elementary argument can fail". For n = 5,
   p = 5: 6 residues of F¹ against 5 + 1 excluded values.

   Scope of the defect, computed: for n ≤ 3 the group statement is the base case §9.8 (no converse needed;
   indeed U(V_(n−1)) is compact for n − 1 ≤ 2, so det(1 − g) is integral and Z's deduction of 1 − d ∈ O_F^×
   at Z lines 1312–1313 is valid there). The semi-Lie statement (b) in dimension n − 1 for p ≥ n does not
   use the converse (its induction needs group AFL for S_(n−1) only at primes ≥ n and at primes that can be
   put in S). So exactly part (a) at p = n with n ≥ 5 prime is affected; nothing else in the roadmap
   consumes it. A detour through the unit-norm equivalence of §9.5(c) in dimension n does not help: by the
   route of §14.3 the global step for semi-Lie dimension n at p uses the group AFL for S_n at the places of
   B, p among them, for the coefficients of unit norm.

   **Repair.** Restate §14.5: "Prove that for F₀ = ℚ_p, p odd: Conjecture 3.8(b) holds for matching strongly
   regular pairs of S_(n−1) × V′_(n−1) and U(V_(n−1)) × V_(n−1) when p ≥ n; Conjecture 3.8(a) holds for
   matching strongly regular elements of S_n and U(V_n) when p ≥ n + 1, and when n ≤ 3 and p ≥ 3. For
   p = n ≥ 5 part (a) is equivalent to the q = n converse of §9.5(b), for which no proof is known to this
   roadmap; Z Theorem 15.1 states p ≥ n through Z Proposition 4.12(i), whose deduction of 1 − d ∈ O_F^×
   needs det(1 − g) integral." Make the same change in the Summary ("over ℚ_p with p ≥ n"), the scope
   paragraph, §14.6, the "Acceptance file" section and the last headline bullet of `Suggested.lean`
   ("with `p ≥ n + 1`, the semi-Lie version for `p ≥ n`"). Alternatively give §9.5(b) a route: prove that
   for integral strongly regular g′ with det(1 − g′) a unit and 1 − d not a unit both sides of (a) vanish
   (Z's unproved "otherwise both sides vanish", Z line 1308). Tested on the refuting instance: (n, p) = (5, 5)
   is no longer asserted for part (a), and (3, 3) stays through §9.8.

4. **F04** (P2) `gap:jr-afl-local-inputs` is a compound contract

   **Location.** `README.md:138`: "What EndoscopicTransferAndUnitaryTraceComparison must provide
   (gap:jr-afl-local-inputs): (i) … (ii) …" (one `needs` of 2311 characters in `design/plan.json`).

   **Claim.** One declared gap with a one-sentence `needs`.

   **Witness.** The `needs` bundles four deliverables with different hypotheses: the passage to Zhang's
   formulations and the unit fundamental lemma (unramified, p odd); existence of smooth transfer (every p,
   every quadratic étale algebra, both directions); Weil-representation compatibility (Z Theorem A.1).

   Each consumer uses a different part: §§9.3, 9.5, 9.7 and 9.8 use (i) only; §14.4 uses the existence of
   (ii); §14.1 uses the Weil compatibility of (ii). A supplier cannot discharge "the gap" piecewise, and a
   consumer's *Needs* line does not say which part it waits for.

   **Repair.** Split into three gaps with the same supplier and section, each a single sentence, in
   `design/plan.json` and in the README's contract paragraph: `gap:jr-zhang-formulation-fl` (the present
   part (i), unchanged wording); `gap:jr-smooth-transfer-existence` (the existence clause of (ii), both
   directions, for every finite extension F₀ of ℚ_p and every quadratic étale F, with the split-algebra
   convention of Z Remark 13.2); `gap:jr-transfer-weil-compatibility` (the semi-Lie compatibility with the
   partial Fourier transform and ω(h), h ∈ SL₂(F₀), Z Theorem A.1). Repoint the *Needs* lines: §§9.3, 9.5,
   9.7, 9.8 → the first; §14.4 → the second; §14.1 → all three; the Dependencies lines of Layers 9 and 14
   accordingly.

5. **F05** (P2) The exotic trace-dual lattices are cited to a supplier section that does not contain them

   **Location.** `README.md:691` (§5.1 *Needs*): "GeometryOfNumbersAndQuadraticArithmetic §2.7
   `IntegralHermitianLattice.ofCarrier`"; `README.md:815` (§6.3 *Needs*): "§2.7
   `HermitianLatticeInvariants.ofDualQuotient`"; `README.md:25` (Conventions table).

   **Claim.** The integral lattices, duals, types and fundamental invariants of the exotic setting are those
   of GeometryOfNumbersAndQuadraticArithmetic §2.7.

   **Witness.** §2.7.1 requires H(L, L) ⊆ R and 2.7.2 defines L∨ = {x : H(x, L) ⊆ R} (supplier README lines
   706, 717). The trace-self-dual plane with h(e, f) = u⁻¹, h(e, e) = h(f, f) = 0 has h(Λ, Λ) = u⁻¹O_F ⊄ O_F,
   and u·h is skew-hermitian.

   So the lattice that is "integral of type zero" in the exotic sense (the H₁ of §6.1's H_k) is not an
   `IntegralHermitianLattice` for h, and no rescaling by an element of F₀ repairs it because u⁻¹O_F is not
   generated by an element of F₀. The invariants (1,1), (2,2), (1,3) used in §§5.5, 6.7, 6.8 are invariants
   of Λ^∨/Λ for the u⁻¹O_F-valued dual, which 2.7.3 does not define. `gap:ramified-hermitian-densities`
   extends only §3.2.

   **Repair.** State the notion here, in §5.1, as part of the construction: "For an O_F-lattice Λ ⊂ V put
   Λ^∨ = {x ∈ V : h(x, Λ) ⊂ u⁻¹O_F} (the dual for Tr_(F/F₀) h); Λ is integral when Λ ⊂ Λ^∨; its fundamental
   invariants a₁ ≤ ⋯ ≤ a_n are the exponents with Λ^∨/Λ ≅ ⊕ O_F/u^(a_i), val(Λ) = Σ a_i, t(Λ) = #{i : a_i > 0},
   and a vertex lattice has all a_i ∈ {0, 1}. These are the invariant factors of the finite O_F-module
   Λ^∨/Λ (the invariant-factor carrier of GeometryOfNumbersAndQuadraticArithmetic §2.7.3, which is defined
   for any module over a principal ideal domain); the integral-lattice and dual declarations 2.7.1–2.7.2
   are for O_F-valued forms and are not used in this layer." Add the Check "the hyperbolic plane with
   h(e, f) = u⁻¹ has Λ^∨ = Λ, invariants (0, 0), although h(Λ, Λ) ⊄ O_F; the unit-norm line ⟨e₁⟩ has
   Λ^∨ = u⁻¹Λ and invariant 1". Change the *Needs* of §§5.1 and 6.3 to "§5.1 for the trace dual;
   GeometryOfNumbersAndQuadraticArithmetic §2.7.3 for invariant factors only", and the supplier contract
   sentence ("Consume §2.7 …") to say that 2.7.1–2.7.2 are consumed in the unramified and Krämer settings
   only. Tested on the refuting instance: the plane with h(e, f) = u⁻¹ is integral with invariants (0, 0)
   under the restated definition.

6. **F06** (P3) Howard19 locators and range

   **Location.** `README.md:714` (§5.3): "(… Howard19 Corollary D)"; `README.md:720`: "the range of LL2's
   statement and of Howard's theorem"; `README.md:920` and `README.md:1036` (*Needs* of §§7.1, 7.8):
   "Howard19 Corollary D".

   **Claim.** Linear invariance for tuples of at most n labels, and Λ-translation invariance of K-classes,
   are Howard's Corollary D, whose range is at most n labels.

   **Witness.** Howard19 line 107: Corollary D is about a k-basis x₁, …, x_n and its Euler characteristic.
   The statement used is Theorem B (line 58, "Fix an r ≥ 0", any r) and Corollary C (line 78); K cites
   Corollary C for it (K lines 591, 1267). Howard19 line 12 takes k quadratic over ℚ_p.

   **Repair.** In §5.3 cite "Howard19 Theorem B and Corollary C, p. 2 (Corollary D, p. 3, for the Euler
   characteristic of a basis)"; in the third Check of §5.3 replace "the range of LL2's statement and of
   Howard's theorem" by "the range of LL2's statement (Howard19 Theorem B is stated for every r ≥ 0)"; in
   the *Needs* of §§7.1 and 7.8 replace "Howard19 Corollary D" by "Howard19 Theorem B and Corollary C"; and
   add to the routes of §§5.3 and 7.1, as §0.5 does for Terstiege and Kudla–Rapoport: "Howard's paper is
   written for a quadratic extension of ℚ_p; the argument is carried out here over F₀".

7. **F07** (P3) A headline the roadmap proves is missing from the acceptance list

   **Location.** `Suggested.lean:10–24` (list of headline theorems) and `README.md:1986` ("Acceptance file").

   **Claim.** The headline theorems are the eight listed.

   **Witness.** The scope paragraph (`README.md:7`) says the roadmap owns "the Chow-valued modularity of
   Kudla divisors on GSpin Shimura varieties over totally real fields (Yuan–Zhang–Zhang)" and §12.7 proves
   it and its unitary pullback (YZZ09 Theorem 1.3, p. 1150; Liu11a Theorem 3.5, p. 874) for every totally
   real F₀ and n ≥ 2; neither list names it.

   **Repair.** Add to both lists: "the Chow-valued modularity of the generating series of Kudla divisors on
   GSpin Shimura varieties and of special divisors on unitary Shimura varieties over every totally real
   field (Yuan–Zhang–Zhang, Theorem 1.3; Liu, Theorem 3.5; README §§12.6a, 12.7)", and to the reasons: "it
   needs canonical models of GSpin and unitary Shimura varieties, their Chow groups and vector-valued
   Hilbert modular forms for the Weil representation; none of these is at the pins". No declaration is
   added.

Seven findings: one P1, four P2, two P3. No finding re-raises a finding the last repair report
marked `not actionable in this package` (FIX-PKG~11 and FIX-PKG~10 mark none).

## Verified sound

**Counts.** Declarations read: 0 (the file has none; its 51 lines were read; one `import Mathlib`, no
`set_option`, no `lemma`, namespace `TauCetiRoadmap.GrossZagierAndArithmeticHeightsPartII`). README lines
read: all 2031. Targets read: 107 (§§0.1–14.6, with 12.6a and 12.6b). Locators verified against the
cached texts: 94, listed below. Checks read: 371; every Check with a computable value was recomputed
(the values are in the table below). Sibling citations checked: 25 roadmaps, 152 section and item ids,
14 declaration names.

**Signatures.** `Suggested.lean` has no declaration (the table of declarations is empty), so there is no `#check`
comparison to make and no
one-tactic probe; nothing is padding. None of the nine headline statements (the eight listed and the one
of R07) is statable: `TauCeti.FormalScheme.Spf.carrier` (TauCeti/AlgebraicGeometry/FormalScheme/Spf/Carrier.lean:35)
and `TauCeti.FormalScheme.Spf.structureSheaf` exist at the pin and the FormalScheme folder contains only
`Spf/`; `IsNonarchimedeanLocalField` is at Mathlib/NumberTheory/LocalField/Basic.lean:46 and is a class
on a valued field. The README's four backticked names that the resolver did not find (`ofCarrier`,
`ofDualQuotient`, `supportLocalization`, `properSupports`) are supplier names: they occur at
GeometryOfNumbersAndQuadraticArithmetic README lines 706 and 728 and EtaleCohomologyFoundations README
lines 770 and 966.

**Dependency check.** Output of the gate: `depcheck: 254 roadmaps, 2421 edges, 0 problem(s)`; no UPWARD,
CYCLE or moved line. The pull request changes only the package folder (13 files).

**Supplier citations (all found at the heads named).** PELModuliPartII (board package): §§0.7, 1.1–1.6,
2.1–2.5, 3.3–3.7, 4.6, 5.1–5.3, 5.5, 5.7, 5.8, 6.1, 6.5–6.8, 7.1–7.5, 7.10, 8.5, 9.3, 9.5–9.9. PELModuli:
M1.3, M1.13, M3.4, M3.8, M6.1. AbelianSchemesAndArithmeticModuli (main): A4.7, A4.CR.7.2.
FiniteFlatGroupsAndIntegralPadicHodgeTheory: R07.1.8, R07.1.22, R07.2.10, R07.2.20.
LubinTateFormalModulesAndQuasiCanonicalLifts: 6.1, 6.2, 6.4, 6.5, 7.1. GrossZagierAndArithmeticHeights: 7.2.
GeometryOfNumbersAndQuadraticArithmetic: 2.7 (2.7.1–2.7.3 with the three names), 2.9, 3.2 (3.2.2, 3.2.4,
3.2.5 with their names, 3.2.6, 3.2.7; the weight m(0) = 0, m(a) = ∏_(i=1)^(a−1)(1 − (−q)^i) agrees with
§3.2 here). SchemeKTheoryOperationsPartII: 0.5–0.7, 1.4, 1.7, 1.8, 2.1, 2.2, 2.4 (affine, as the README
says), 2.5, 3.1–3.4, 4.1–4.3, 4.5–4.7. SchemeKTheoryOperations (main): 6.12, 7.7. SchemeAndStackFoundations
(main): 5.1, 5.3, 5.4, 5.7. MotivesAndAlgebraicCycles: 2.4, 2.7, 7.19. EtaleCohomologyFoundations (main):
0.7, 0.8, F.2.5, F.4.1–F.4.6. AutomorphicLFunctionsAndLocalFactors: AL.0. MetaplecticAutomorphicForms: 2.1,
2.5, 3.3, 3.3a, 3.3b, 4.5, 5.1, 6.2, 6.4, 6.7 with the seven names. QSeriesPartitionsAndMockModularForms:
8.3, 8.5, 8.6. ShimuraCompactifications: 7.3, 7.5, 7.15. ShimuraVarieties: 0.5, 2.3, 2.7, 2.8, 6.2–6.4, 8.1,
8.5, 8.7. ArithmeticLocallySymmetricSpaces (main): ALS.5b.1, ALS.5b.4. ComplexKahlerGeometry (main): 4.5,
6.3. ComplexComparisonPartII (main): C1.9. AutomorphicSpectralTheory: 1.1, 1.2, 2.4, 5.10, 5.12, 5.14.
AutomorphicFormsOnReductiveGroups: 4.4 `fourierUnitVanishing`, 5.4. ArakelovGeometryAndAbelianHeights: 1.8,
1.9, 1.10. EndoscopicTransferAndUnitaryTraceComparison: 2.1, 2.4, 2.13.
EndoscopicTransferAndUnitaryTraceComparisonPartII: 4.4, 4.5. All 25 are on main or earlier in the merge
order (this roadmap is line 350; the latest supplier is LubinTateFormalModulesAndQuasiCanonicalLifts,
line 344).

**Declared gaps.** The four slugs are in `design/plan.json` with supplier and section, and each `needs`
occurs verbatim in the README's contract paragraph. `gap:ramified-hermitian-densities`,
`gap:nonaffine-formal-filtration-product` and `gap:arithmetic-chow-star-products` each ask for one
extension of one section, with hypotheses; none asks for something the supplier's current text provides
(§3.2 is unramified only; §2.4 is affine; §§1.8–1.10 are divisors and one-cycles).
ArakelovGeometryAndAbelianHeightsPartII (earlier in the order) was searched for Gillet–Soulé groups in
higher codimension: one mention, in a route, no target. `gap:jr-afl-local-inputs`: R04.

**Ownership against open work.** Searched, by object, the roadmaps on main and the open heads for
Kudla–Rapoport cycles, arithmetic fundamental lemma, arithmetic Siegel–Weil, Borcherds products,
regularized theta lifts, Kudla–Millson, Gillet–Soulé and Rapoport–Zink. No earlier roadmap constructs
special cycles on unitary Rapoport–Zink spaces, the AFL intersection numbers, unitary or orthogonal
Borcherds products, or Kudla divisors; this roadmap is their earliest owner. One later roadmap states
overlapping objects: ComplexMultiplicationAndExplicitReciprocityPartII (merge-order line 371) §§4.2–4.2a
constructs special divisors and a Borcherds section on GSpin integral models over ℚ; it is later, so the
citation is its to make, and its section has weight c_f(0,0) where §12.6a(e) has Ψ of weight c(0,0)/2
and Ψ² of weight c(0,0) (consistent after squaring). HodgeClassesForJacquetLanglands (line 290) uses
harmonic Kudla–Millson Schwartz forms for quaternionic theta classes and states no generating-series
theorem. No `Suggested.lean` name can clash: the file declares none.

**Locators verified (label found at the stated page of the cached text).** LZ: Example 2.4.3, Lemma
2.11.1, Theorem 3.4.1, Theorem 4.2.1, Corollary 4.6.1, Lemma 5.3.1, Theorem 5.3.2, Corollary 5.3.3,
Theorem 5.4.1, Theorem 6.1.3, Lemma 6.2.1, Corollary 6.3.3, Theorem 6.4.9, Proposition 7.3.4, Theorem
7.4.1, Theorem 8.2.1, Lemma 8.2.2, Theorem 10.3.1, Conjecture 10.4.1, Theorem 10.4.3, Theorem 10.5.1,
Example 10.5.3, Remark 10.5.4, Theorem 13.6.1, Theorem 14.5.1, Theorem 15.3.1, Theorem 15.5.1. LRZ
(printed pages): Definition 14.2.2, Theorem 14.6.2, Corollary 16.1.5, Proposition 16.4.1. K: Theorem 1.3,
(1.4)–(1.6) with t_max, Proposition 2.12, Theorem 3.16, Proposition 3.17, Theorem 3.19, Proposition 3.20,
Theorem 4.3, Theorem 4.16, Theorem 7.1, Theorem 8.2, Lemma 9.6, Theorem 9.7, Theorems 10.1–10.2. LL2:
Theorem 2.7, Lemma 2.24, Lemma 2.42, Proposition 2.44 (formula with inner bound j), Lemma 2.57, Corollary
2.66. Z: Conjecture 3.2, Conjecture 3.8, Proposition 3.9 (p > n), Lemma 4.11, Proposition 4.12, Theorem
5.5, Theorem 8.6, Lemma 13.6, Theorem 14.6, Theorem 15.1 (p ≥ n), Theorem A.1, Lemma B.2. Mih16: Theorem
1.12, Corollary 9.9. Zha12: Theorem 2.10, Theorem 5.5. BHKRY: §1.5 (n ≥ 3), Theorem 4.2.3, Theorem 5.3.1,
Theorem 5.3.3, Theorem 7.2.1, metric −[w, w̄]/(4πe^γ) (line 4774). Liu11a: Theorem 3.5, Proposition 4.5,
Theorem 4.17. YZZ09: Theorem 1.3 (weight n/2 + 1 for signature (n, 2)), Proposition 3.1. ES: Theorems 3.6,
4.13. GS19: Theorem 1.1.2. Bor98: Theorem 13.3. Bor99: Theorem 3.1. KM90: Theorem 2. VZ84: Theorem 8.1.
KR11: Lemma 6.5, Proposition 8.1. Ter13a: Lemma 3.1. Ter13b: Theorem 1. MZ: Theorem 3.13. Howard19:
Theorem B, Corollaries C and D (R06).

**The adversarial pass.** One row per target; "✓" means the two sides agree at the values shown.

| Target | Instances tried | Values computed | Result |
|---|---|---|---|
| 0.1 | rank one, norm ϖ^a | dual ϖ^(−a)O_F·x in both conventions; H(ax,y) = ā·H | ✓ |
| 0.2 | x = 0; val < 0; unit norm | Z(0) = N_n; ∅; N_(n−1) | ✓ |
| 0.3 | d = 0, 1; q = 3 | point; Fermat curve, q³+1 = 28 points | ✓ |
| 0.4 | types 1, 3; Λ + Λ′ | dimensions 0, 1; V(Λ) ⊂ V(Λ′) ⇔ Λ′ ⊂ Λ | ✓ |
| 0.5 | val 0, 1; y = x in V₁ | Z(ϖ⁻¹x) = ∅; Tor₁ = O_F̆/ϖ ≠ 0; empty divisor 0 = 0 | ✓ |
| 0.6 | C ≅ ℙ¹ ⊂ D, O(D)\|_C = O(−1) | Tor₁ = O_C(1); χ = 1 − 2 = −1 = deg | ✓ |
| 0.7 | n = 1; n = 2 rank one; n = 3 degenerate L | Spec O/ϖ; N₁ flat; Gram of Λ_j = ϖ·(H ⊥ 1), type 3, infinitely many | ✓ |
| 0.8 | r = 0; n = 2 | identity; (a+1)/2 | ✓ |
| 0.9 | a = 1, 3, −1, −3 | D = 1−X, 1−X+X²−X³; −D′(1) = 1, 2; 0; 0 ≠ −1 | ✓ |
| 1.1 | unit-norm line, n = 2 | vertical class 0 | ✓ |
| 1.2 | I₂, line (1, ϖ^k) | norm 1 + ϖ^(2k), unit, type 0 | ✓ |
| 1.3 | val 2, n = 2; s = 1 | degrees q²+q and 1; D(−q) = 1+q+q²; q+1 | ✓ |
| 1.4 | length-one interval | multiplicity 2; saturated 1 | ✓ |
| 2.1 | d = 0, 1; Poincaré dual | 1; {1, −q} on H¹_c, q² on H²_c; 1+q²+q(q²−q) = q³+1; q^(2j), −q^(2j−1) | ✓ |
| 2.2 | i = 0; d = 1; 𝔸¹ ⊂ ℙ¹ | fundamental class; point class; H²_c = ℚ_ℓ(−1) | ✓ |
| 2.3 | n = 3 | curves with §1.4 multiplicities | ✓ |
| 2.4 | x ∈ Λ; isotropic and anisotropic x̄; q = 3 | 1−q² = −8; transform q²−1, −1, 0 (one and q+1 lines in x̄^⊥) | ✓ |
| 2.5 | n = 2 unit norm | 0 = −0 | ✓ |
| 2.6 | D = 0; line on ℙ² | 0; H − H²/2 | ✓ |
| 2.7 | point stratum | Tor₀ = Tor₁ = k, χ = 0 | ✓ |
| 3.1 | n = 1, val 1; L = ⟨ϖ⟩ as Schwartz lattice; val 2 | (1+q⁻¹)·2 log q; count (q+1)q^N; D(1) = 1 | ✓ |
| 3.2 | m(0..3); n = 1 | 0, 1, 1+q, (1+q)(1−q²); (a+1)/2 lattices of type one | ✓ |
| 3.3 | n = 2, unit y | (a+1)/2 both sides | ✓ |
| 3.4 | 1̂_M | vol(M) = q^(−val M) | ✓ |
| 3.5 | n = 1, a = 3; L♭ = ⟨e⟩, norm ϖ | 2; val(u) = 2, u^∨ of valuation −2 | ✓ |
| 4.1 | rank one, val 0, 2 | Int_Y = 0, 1 | ✓ |
| 4.2 | n = 2 | self-intersection (−1)^(n−1) = −1 | ✓ |
| 4.3 | val 2, 0, −2 | two integral overlattices (types 2, 1): D_Λ = (1−X)(1+qX) + X²(1−X), ∂Den_Λ = q+2; 1; 0 | ✓ |
| 4.4 | no type-zero lattice | Exc = 0 | ✓ |
| 4.5 | a = 0, 2 | (0,1,1); (1,1,q+2); (q+1)·1 = q+2−1 | ✓ |
| 4.6 | r = 1; LZ Remark 10.5.4 | (q²−1)/(q+1) = q−1; ((−q)^n − 1)/(q+1) at n = 2r agrees | ✓ |
| 5.1 | x = u⁻¹e | h = −u⁻², F₀-valuation −1, N(x) = ∅ | ✓ |
| 5.2 | type-four ℙ¹ | χ([O]−[ω]) = 1 − q | ✓ |
| 5.3 | (x, x) against (x, 0); n+1 labels | difference [O_D(−D)] ≠ 0; ℓ − ℓ = 0 | ✓ (locator: R06) |
| 5.4 | types 2, 4; q = 3 | points; ℙ¹ with deg ω = 2 | ✓ |
| 5.5 | (0,0), (0,1), (1,1), (1,2) | 2, 4, 2(q+3), 2(2q+4); LL2 line 1421 | ✓ |
| 5.6 | orthogonal and non-normal bases | det −1; h(x₁, −x₂) = −1 ≠ 1 | ✓ |
| 6.1 | invariants (1,1), q = 3 | D = 1−X²; Den(H₂, L) = (8/9)(80/81) = 640/729 | ✓ |
| 6.2 | type-two lattice | coefficient 2 | ✓ |
| 6.3 | t(A) = 1, ≥ 3 | types 0 or 2; opposite signs of μ | ✓ (dual: R05) |
| 6.4 | (1,1) and (3,3), q = 3 | volumes 1/3, 1/27 | ✓ |
| 6.5 | x ∈ Λ; x̄ isotropic, anisotropic | 1−q; transform q−1, −1, 0 (q²+1 isotropic lines; one, q+1 in x̄^⊥) | ✓ |
| 6.6 | (1,1) | 2 = 2 | ✓ |
| 6.7 | a = 1; a = 3 with β₁, β₂, β | norm of u⁻¹e ± x₀ = −β + β = 0; h(e, ·) = −βu; V nonsplit since −β₁β₂ is a non-norm | ✓ |
| 6.8 | (1,1), (1,3) | 2; exactly two integral overlattices of type two, 4 = 4 | ✓ |
| 6.9 | F₀ = ℚ_p | u²/ϖ a unit, no shift | ✓ |
| 7.1 | x = 0 | whole space | ✓ (locator: R06) |
| 7.2 | m = 1, 2 | ℙ¹; fibre ℙ¹ over a rational Lagrangian | ✓ |
| 7.3 | type two | tangent bound 1 | ✓ |
| 7.4 | type-zero sum | empty | ✓ |
| 7.5 | s = 0, 1 | degree 1; 2q | ✓ |
| 7.6 | n = 2, 3 unimodular | α = 1, 0 | ✓ |
| 7.7 | n = 3, r = 2; shift Int + c | correction 1; law invariant under the shift | ✗ R01 |
| 7.8 | x ∈ π⁻¹Λ^♯ | N(π⁻¹) = −π₀⁻¹, valuation ≥ −1 | ✓ |
| 8.1 | n = 2, χ = −1 | t_max = 0, no correction; K line 141 | ✓ |
| 8.2 | I_n; types 2, 3 | δ_odd(n); 1 − χq; 1 − q² | ✓ |
| 8.3 | measure scaled by c | integral scaled by c | ✓ |
| 8.4 | n = 3, norms 1, π₀, −π₀⁻¹ | Gram (π₀, β̄; β, (N(β)−1)/π₀), determinant −1; β ≡ ±1 mod π, 2q classes; value 2q·vol(L♭) | ✓ |
| 8.5 | n = 2 | needs the rank-two input | ✗ R01 |
| 8.6 | H₁; H₁ ⊥ H₁ | norm π(ab̄ − āb) ∈ π₀O_F₀; coefficient 1/(2π); rank four: val(L♭) ≥ 4 always | ✗ R02 |
| 8.7 | I_n; H₁ | δ_odd(n) both sides given R01; 1 − q both sides | ✗ R01, R02 |
| 9.1 | n = 3 g on 3J; n = 4; n = 2 | g preserves J; det(u, gu, g²u) = −1; det = 8 at d = −1; anisotropic | ✓ |
| 9.2 | unit multiple of u | Z(u) unchanged | ✓ |
| 9.3 | γ = ((0,1),(1,0)), ((−2,1),(−3,2)), conjugation by diag(3,1), n = 1, the order-four χ | Orb = 1; 1 − 3^s; 3^s with ω = −1, derivative log 3 = 0 − log(1/3)·1; exponent of ξ is n(n−1)/2 − n⌊n/2⌋ = −1 at n = 2 | ✓ |
| 9.4 | g′ = diag(h, d) | u = 0, pullback of codimension 0, not regular | ✓ |
| 9.5 | q ≥ n+1; q = n | q+1 ≥ n+2 > n+1; n+1 against n+1 | ✓ as stated; R03 for its use |
| 9.6 | m = 1; nilpotent cyclic x | depends on val only; map still an isomorphism | ✓ |
| 9.7 | m = 1 | rank-one case; Z line 826 has p > n | ✓ |
| 9.8 | ℚ₃ and its unramified quadratic extension | γ² = 1, v(−15) = 1, 1 − 9^s, ∂Orb = −log 9 | ✓ |
| 10.1 | T = I₂, a = (1, b; 0, 1), b̄ = −b | entries −b, b, 1 − b² = a^t T ā | ✓ |
| 10.2 | r = 1 | Cartier class | ✓ |
| 10.3 | split place, F = ℚ(i), p ≡ 1 mod 4 | dimensions (n, 0) against (n−1, 1) | ✓ |
| 10.4 | residue degree f | f·log q | ✓ |
| 11.1 | α = T − i | ᾱ(0)⁻¹·T·ᾱ(T⁻¹) = T − i; ordinary reciprocal T + i | ✓ |
| 11.2–11.5 | maximal and nonmaximal places; split place | read against Z §7; dimension count of §10.3 | no change |
| 12.1 | φ(0) = 0; n = 1, 2 | constant term 0; CH¹ = 0; Δ trivialises a power of ω | ✓ |
| 12.2 | u ⊥ z_δ | u in a proper δ-stable subspace | ✓ |
| 12.3 | a = e, u = 0 | −1 | ✓ |
| 12.4 | ℚ(i)³, z = (0,1,2), k₅ | norm −3; \|x₁\|² + 3\|x₃\|² = 1; multiplicities 2 and 0 | ✓ |
| 12.5 | μ = ((1+i)/2, 0, 0); μ = (0,0,1) in 3O_F; w = (1, i) | Q = ½; Q = −1, 2μ ∉ L; [w,w] = 0, [w,w̄] = −4; order #O_F^× = 4 from two rays squared | ✓ |
| 12.6 | −log\|f\| | relation (V_p, 0) = (0, 2 log p) fails | ✓ |
| 12.6a | x² − 3y² − 3z²; 5 variables; weights | anisotropic by descent; (1,1,1,1,0) isotropic; 5/2 = (p/2+1) + e/2 | ✓ |
| 12.6b | n = 2, 3; 𝔰𝔲(m,1) | weight n; one noncompact root positive on e₁ | ✓ |
| 12.7–12.9 | n = 2; F₀ ≠ ℚ | arithmetic statement not asserted | ✓ |
| 12.10 | g on 3J, u = e₁ + e₃ | h(u,u) = 6, det = −1 | ✓ |
| 12.11 | ξ′ < 0 at one place | argument −4πa\|ξ′\| < 0 | ✓ |
| 13.1–13.3 | Levi covariance; \|Diff\| ≥ 2 | exponent s + n/2; first derivative 0 | ✓ |
| 13.4 | K′ ⊂ K of index m | c_(K′) = m·c_K | ✓ |
| 13.5 | log(q²) | factor 2 against log q | ✓ |
| 13.6 | n = 3, m = 1, 3 | bidegrees (0,0), (2,2) | ✓ |
| 13.7–13.10 | F₀ = ℚ; self-dual inert place | excluded; correction 0 | ✓ (Krämer part: R02) |
| 14.1–14.4 | E♭ expansion | 2∂J + Int_K | ✓ |
| 14.5 | (n, p) = (3, 3), (5, 5) | base case; needs the q = n converse | ✗ R03 |
| 14.6 | n = 1; q = 9 | empty; −log 9 | ✓ (range: R03) |

**Policy.** No pull-request number, process word or `lemma` in the README or the Lean file; every target
carries a locator; every definition has at least three Checks; no computational algorithm is planned.

**Copyright, licences and scope.**

Wording: the README's statements were set beside the source at K lines 129–157 (definition of ∂Den and
t_max), K lines 609–641 (cancellation law), K lines 3934–3975 (Lemma 9.6), K lines 3981–4001 (proof of
Theorem 9.7), Z lines 780–827 (Conjectures 3.2, 3.8, Proposition 3.9), Z lines 1301–1334 (Proposition
4.12), Z lines 4079–4114 (proof of Theorem 15.1), LL2 lines 1419–1427 and 1753–1762, LZ lines 82–110
(introduction), 2932–2940 (Conjecture 10.4.1) and 3168–3172 (Remark 10.5.4), LRZ lines 2622–2637 (Theorem
14.6.2), Howard19 lines 58–115, YZZ09 lines 160–172, BHKRY lines 531–539 and 4774–4775, and HSY23b lines
146–166. No sentence is reproduced. The closest are §4.2 against LRZ Theorem 14.6.2, which lists the
same five properties in the same order with at most nine consecutive shared words ("is finite flat of
degree q+1, étale away from"), and formulas; both are statements that can be written in one way.

Arrangement: LZ has the largest share. Its contents are §§2–8 (local identity: cycles, densities,
horizontal, vertical, geometric Fourier, analytic Fourier, proof), §§9–10 (almost self-dual), §§11–15
(global). The README's Layers 0–4 draw on §§2–10 but are not its sections: Layer 2 joins LZ §5.3 with §6,
Layer 3 joins LZ §3 with §§7–8 and places the analytic side after the geometric one, Layer 1 joins §4
with §5.4; LZ §§11–15 are split between Layers 10 and 13 and mixed with LL1 and K; Layers 5–9, 11, 12 and
14 come from other sources. The order Layer 0 → 1 → 2 → 3 is forced by the *Needs* lines of §§1.1, 2.3
and 3.5.

Reuse: no table, figure or list is taken over; the formulas of §5.5 and of the repair of R01 are stated
results with locators. `Suggested.lean` has no declaration to compare with a public formalisation.

Source independence: 17 passages compared with 9 sources, none shared; largest share LZ, 54 of 231 locators; contents compared with LZ: independent.

## Not verifiable

- Shi22 (the anisotropic rank-two Krämer formulas of R01): paywalled; the anisotropic line of the repair
  is taken from HSY23b's statement of it (HSY23b lines 155, 167) and K's citations.
- Lusztig76 and McGraw03: uncertified by the manifest; §§2.1, 5.4 and 12.6a(f)(ii) were checked only
  against the roadmap's own Checks (the point count q³ + 1 fixes the eigenvalue −q).
- LL2 Lemma 2.57 (r ≥ 2, a ≥ 3): the cached extraction of LL2 renders every "⩾" as ">" (it contains no
  "≥" at all, and "integer m > 0" at line 350), so the printed inequalities could not be read; the
  README's a = 3, n = 4 instance was recomputed and holds.
- The claim of §8.4 that K Theorem 8.2's vanishing on the negative cone fails was recomputed from the
  README's definitions of horizontal lattices (§7.5), not from K Definition 4.1.
- Whether Z's "otherwise both sides vanish" (Z line 1308) can be proved for n ≥ 4 (R03): not decided
  here; no counterexample to the q = n converse was constructed.
- Page locators into LL1 (Definitions 5.3, 6.5; §§8–9) and LZ Definition 9.1.4: the labels were not
  found by search in the extraction (spacing), and were not checked by hand.
- No Lean was run (this pass runs none); the earlier report's elaboration (exit 0, no declarations) was
  not repeated.

## Source issues

- **Gap** in K at Lemma 9.6, p. 74, and the proof of Theorem 9.7, pp. 75–76: the source says a normal basis of L♭ + ⟨x⟩ gives a rank n−1 sublattice of smaller valuation; it should treat lattices whose top block is hyperbolic, for instance H₁ ⊥ H₁, where none exists; affects the proof.
- **Error** in K at Theorem 8.2, p. 64: the source says the analytic vertical partial integral vanishes on normal vectors of negative valuation; it should claim only constancy on the nonnegative cone (rank three, norms 1, π₀, −π₀⁻¹ gives 2q·vol); affects a stated result.
- **Gap** in Z at Proposition 4.12(i), proof, p. 23: the source says 1 − d is a unit because det(1 − g) is integral; it should justify that integrality, or the vanishing of both sides otherwise, when U(V_(n−1)) is noncompact (n ≥ 4); affects the proof.
- **Gap** in Z at Theorem 8.6, p. 42, and the proof of Theorem 15.1, pp. 72–73: the source applies the arithmetic modularity of BHKRY in every dimension from two; it should restrict to n ≥ 3, where BHKRY's Borcherds products exist; affects the proof.
- **Gap** in K at Proposition 2.12, p. 15: the source says Int(I_n) = δ_odd(n) follows from the cancellation identity; it should say that the value Int(I₂) = 0 is imported from the rank-two papers it cites; affects nothing.

## For the human reviewers

- **Scope.** §8.6 (`README.md:1126`) and the q = n converse of §9.5(b) (`README.md:1246`) are targets with no known proof in K or Z; §8.7 and §14.5 at p = n ≥ 5 depend on them (R02, R03).
- **Licence.** YZZ09 is read from archive.ymsc.tsinghua.edu.cn, LL1 and LL2 from math.columbia.edu, Zha12 from math.mit.edu (`README.md:2010–2011`, `2026–2027`); the classification of these hosts was not re-examined.
- **Licence.** McGraw03 and Lusztig76 are cited without a legal copy of the text (`README.md:2016`, `2025`); Shi22, which R01 asks to cite, is paywalled.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "71f5745a15b6ff88c143f0594d2c3c5043c3d7ba", "job": "RT-GrossZagierAndArithmeticHeightsPartII~1b", "model": "fable", "worker": "chris-x81"} -->
