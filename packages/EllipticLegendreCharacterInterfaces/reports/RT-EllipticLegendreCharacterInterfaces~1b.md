<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1373#issuecomment-6398158250 -->
Red team round 1 pass b (claude) of a5ea30c

Verdict: needs changes

1. **F01** (P2) `scaledLegendre_minus_one_trace_zero` is stated over prime fields; the argument and the neighbouring targets are over every odd finite field

   **Location.** `TauCetiRoadmap/EllipticLegendreCharacterInterfaces/Suggested.lean` lines 83–86: `(p : ℕ) [Fact p.Prime] (hp : p % 4 = 3) (u : ZMod p)`. `packages/EllipticLegendreCharacterInterfaces/README.md` line 596: "For p prime with p≡3 mod4 and every u∈𝔽_p".

   **Claim.** The first paragraph of §5.1 (line 594) proves the character-sum count for every finite field of odd characteristic, and §5.2 (line 612) is stated for every finite field with decidable equality and odd characteristic; the repair round (F03) generalised §3.1 from prime fields to every odd finite field for the same reason. The trace-zero headline alone stays on 𝔽_p, although its proof route (f(−x) = −f(x) and −1 a nonsquare) uses nothing about prime fields: it holds for every finite field F in which −1 is a nonsquare, that is |F| ≡ 3 (mod 4).

   **Witness.** Computed over 𝔽₂₇ = 𝔽₃[X]/(irreducible cubic), |F| ≡ 3 (mod 4): y² = x³ − u²x has projective count 28 = q+1 for u = 1 and for u = 0. Over 𝔽₉, 𝔽₂₅, 𝔽₄₉ (|F| ≡ 1 (mod 4)) the counts for u = 1 are 16, 32, 64 ≠ q+1, so the hypothesis must be "−1 is a nonsquare" (equivalently |F| ≡ 3 mod 4), not merely odd characteristic; u = 0 gives q+1 over every odd finite field.

   **Repair.** README line 596, first sentence: "For every finite field F with |F| ≡ 3 (mod 4) and every u∈F, the equation y²=x(x−u)(x+u), namely L(u,−1), has projective point count |F|+1 and Frobenius trace 0." Add the Check "Over 𝔽₂₇ with u=1 the count is 28; over 𝔽₉ with u=1 it is 16, so the congruence on |F|, not odd characteristic alone, is the hypothesis." Lean:

   ```lean
   theorem scaledLegendre_minus_one_trace_zero
       {F : Type*} [Field F] [Fintype F] (hF : Fintype.card F % 4 = 3) (u : F) :
       (scaledLegendre u (-1)).pointCount = Fintype.card F + 1 ∧
         (scaledLegendre u (-1)).frobeniusTrace = 0 := by
     sorry
   ```

   (`2 ≠ 0` follows from the congruence; `pointCount` and `frobeniusTrace` need no `DecidableEq`.) Tested on the instances above: 𝔽₂₇, u ∈ {0, 1}: 28 = 27 + 1; 𝔽₇, u = 2: 8 = 7 + 1, trace 0.

2. **F02** (P3) §3.7 and `legendre_minus_one_point_count_v_two` hold over every finite field with |F| ≡ 5 (mod 8)

   **Location.** `Suggested.lean` lines 75–77: `(p : ℕ) [Fact p.Prime] (hp : p % 8 = 5)`. README line 530: "For p prime with p≡5 mod8".

   **Claim.** The three inputs of the proof route (lines 518, 534) are that 2 is a nonsquare, −1 is a square, and a square root i of −1 is a nonsquare. All three hold in every finite field with q ≡ 5 (mod 8): q = p^k with p ≡ 5 (mod 8) and k odd, so 2 ∈ 𝔽_p stays a nonsquare, q ≡ 1 (mod 4), and 8 ∤ q − 1. The prime hypothesis is not used.

   **Witness.** 𝔽₁₂₅ (125 ≡ 5 mod 8): a₅(y²=x³−x) = −2, Frobenius eigenvalues −1 ± 2i, α³ + ᾱ³ = (−2)³ − 3·5·(−2) = 22, count 126 − 22 = 104 = 2³·13, two-adic valuation 3.

   **Repair.** This is a generality note, not a defect of truth. If applied: README line 530 "For every finite field F with |F| ≡ 5 (mod 8), v₂(projective point count(L(−1)/F)) = 3", Lean `{F : Type*} [Field F] [Fintype F] (hF : Fintype.card F % 8 = 5) : padicValNat 2 (legendre (-1 : F)).pointCount = 3`, with §§3.2, 3.6 reworded from 𝔽_p to F and the Check "Over 𝔽₁₂₅ the count is 104 = 8·13." Tested: 𝔽₅, 𝔽₁₃, 𝔽₂₉ give 8, 8, 40 as before.

3. **F03** (P3) downstream-consumer sentences do not describe the consumers' current heads; the Legendre coefficient model has two owners among open pull requests

   **Location.** README line 13: "Sections 0.1 and 0.4 own the coefficient model, discriminant and j-invariant used by the later MordellLawrenceVenkatesh §6.4, ArithmeticDynamics §§6.35, 6.111 and ErdosProgressionPowers Layer 2". README line 638: "EllipticCurveModularityPartII §5.1 ... consumes §0.9 for its normalization. MordellLawrenceVenkatesh §6.4 consumes §§0.1, 0.4 in its cyclic family. ... ErdosProgressionPowers §2.1 consumes the general-field normalization and odd-finite-field subgroup theorem. ComputationalNumberTheory §3.17 consumes §5.1's normal-form character-sum identity."

   **Claim.** None of the four named sections consumes anything from this roadmap at its head:
   - MordellLawrenceVenkatesh §6.4 (head 73dc3e8, "The Legendre family and its cyclic variant") lists as its own targets the coefficient model y² = x(x−1)(x−t) as a `WeierstrassCurve R` over every commutative ring, Δ = 16t²(t−1)² and j = 2⁸(t²−t+1)³/(t²(t−1)²), with Checks j(−1) = j(2) = j(1/2) = 1728. That is exactly §§0.1, 0.4 here: two open pull requests build the same object. ArithmeticDynamics (rev 1335, README line 174) and ErdosProgressionPowers (rev 1336, README §2.1) both cite MordellLawrenceVenkatesh §6.4, not this roadmap, as the supplier of that model.
   - EllipticCurveModularityPartII §5.1 (rev 1491, README lines 550–568) defines `FullRationalTwo` with *Needs* EllipticCurves Layer 2 and BS Lemmas 3.3, 3.5; it never mentions this roadmap or a Legendre normalization.
   - ComputationalNumberTheory §3.17 (rev 1408, README lines 1681–1689) states and proves the character-sum count itself with *Needs* Tau Ceti `pointCount`, `frobeniusTrace`, `pointCount_eq_card_point`; it does not cite §5.1.
   - ErdosProgressionPowers §2.1 (rev 1336, README lines 1034–1080) plans itself the extension of "LG.0's rational full-two-torsion adapter to every field" and of "LG.3's prime-field subgroup theorem" to every finite field, which §§0.9, 3.1 here already state in that generality.

   The merge order (this roadmap at position 108; ComputationalNumberTheory 155, MordellLawrenceVenkatesh 174, EllipticCurveModularityPartII 189, ErdosProgressionPowers 263, ArithmeticDynamics 268) makes this roadmap the owner of the coefficient model, its invariants and the character-sum count, so the ownership decision is right; the sentences describing what the later roadmaps do are not. Repointing those roadmaps is outside this package (recorded as not actionable in the last repair report, F09; this finding does not re-raise it, it corrects this README's own sentences).

   **Witness.** Sibling files cited above, read at the heads the brief gives; the `roadmaps grep` for `pointCount` together with `quadraticChar` matches no roadmap on main or in any open pull request, so no earlier owner of the character-sum identity exists.

   **Repair.** Line 13: replace "used by the later MordellLawrenceVenkatesh §6.4, ArithmeticDynamics §§6.35, 6.111 and ErdosProgressionPowers Layer 2" by "that MordellLawrenceVenkatesh §6.4, ArithmeticDynamics §§6.35, 6.111 and ErdosProgressionPowers Layer 2, all later in the merge order, specialize". Line 638: replace the four "consumes" clauses by ownership statements true at the heads: "EllipticCurveModularityPartII §5.1 packages full rational two-torsion as a predicate; the normalization behind it is §0.9. MordellLawrenceVenkatesh §6.4 specializes the coefficient model of §§0.1, 0.4 to its cyclic family. ErdosProgressionPowers §2.1 uses the general-field normalization of §0.9 and the odd-finite-field subgroup theorem of §3.1. ComputationalNumberTheory §3.17 states the normal-form character-sum identity whose owner is §5.1."

4. **F04** (P3) repeated Checks

   **Location.** README lines 152 and 154 (§0.4: "In characteristic 2 the discriminant vanishes" and "over 𝔽₃, λ=2 has Δ=1 and j=0" each appear twice); lines 168–169 (§0.5: d=2, λ=1/2 with Δ=64, j=1728 twice); lines 266, 268, 269 (§1.1: λ=3 and λ=1/3 at p=3 twice, λ=−1 at p=3 twice); lines 315–316 (§1.4: odd support {3} for λ=3 twice); lines 331–332 (§1.5: M=32 and odd conductors 1 twice); lines 538–539 (§3.7: p=5,13,29 → 8,8,40 twice); lines 109–111 (§0.2: three bullets with the same sentence "This distinguishes root scaling from an admissible coordinate scaling", the d=0 bullet testing something else); lines 133–138 (§0.3: six bullets with one identical sentence).

   **Claim.** A Check that restates another Check of the same section is a restatement, which the Checks rule excludes; each pair tests one value. All the values are correct (recomputed below).

   **Witness.** The line pairs above.

   **Repair.** Merge each pair into one bullet keeping the computed values (for example §3.7: "p=5,13,29 give counts 8,8,40, odd quotients 1,1,5; 16 divides none."). Give the §0.2 d=0 bullet its own sentence: "This tests that the scaled model is total at d=0 and is not elliptic there." Give the §0.3 bullets their own sentences (the λ=0,1 bullet: "This tests the junk values of the total tuple"; the λ=3 bullet: "This tests the generic case with six distinct values").

5. **F05** (P3) §2.1 has no source locator

   **Location.** README line 353: the parenthesis after the definition cites only Mathlib and Tau Ceti declarations.

   **Claim.** The policy rule requires a locator for every target; §2.1 cites library constructions but no source. The split target of the descent map is displayed in BS20.

   **Witness.** BS20 line 658 displays the three-fold square-class target of Θ_λ over a prime field; S09 §X.1, Proposition 1.4 states the split two-descent (uncertified).

   **Repair.** Line 353: prepend "(Bennett–Siksek, §6, two-descent display, p.370; BS20 line 658, the split target over a prime field; Silverman, S09 §X.1, Proposition 1.4 for the general field. Native polynomial CRT: ...)".

No P1 finding. One P2 finding (a headline stated over prime fields only, while its own proof route and the two neighbouring targets of the same layer are over every odd finite field) and four P3 findings (a second prime-field restriction that the same argument removes, downstream-consumer sentences that do not describe the consumers' current heads, repeated Checks, a target without a source locator). Every Lean statement was recomputed on explicit instances and found true as typed; every BS20 locator cited by line resolves to the claimed passage; the dependency gate reports no UPWARD or CYCLE line.

## Adversarial mathematics pass

One row per Lean declaration and per README target with a computed witness. Curves are y² = x³ + a₂x² + a₄x + a₆; "count" is the projective count of Tau Ceti `pointCount` (all affine solutions, singular included, plus one), recomputed by enumeration; "trace" is q + 1 − count.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `legendre` (§0.1) | λ = 2, −1, 0 over ℚ; λ = 2 over 𝔽₃; λ = 2+ε in 𝔽₅[ε]/(ε²); zero ring | a₂(L(2)) = −3; (2,0): 0 = 2·1·0; (−2,0): cubic −24 ≠ 0. L(−1): (a₂,a₄) = (0,−1). Mathlib b₂ = −4(1+λ), b₄ = 2λ, b₆ = 0, b₈ = −λ², Δ = 16λ²(1−λ)², c₄ = 16(λ²−λ+1): Δ(L(2)) = 64, Δ(L(1/2)) = 1, Δ(L(0)) = 0; over 𝔽₃ λ=2: Δ = 1, c₄ = 48 ≡ 0; λ = 2+ε: Δ = 4+2ε, (4+2ε)(4+3ε) = 1 | true | none |
| `scaledLegendre` (§0.2) and the twist identity | pinned `quadraticTwistOf` body; d = 1, 2, 0; λ = 1/2 | a₁' = t·a₁, a₂' = (t²−4n)a₂ − n a₁², a₃' = (t²−4n)t·a₃, a₄' = (t²−4n)²a₄ − 2(t²−4n)n a₁a₃, a₆' = (t²−4n)³a₆ − (t²−4n)²n a₃²; at (t,n) = (0,−d/4) with a₁ = a₃ = 0: (0, d·a₂, 0, d²a₄, d³a₆) = L(d,λ); twisting discriminant 0 − 4(−d/4) = d; (0,−2) gives 8. L(2,1/2): a₂ = −3, a₄ = 2, Δ = 64; L(0,λ) = 0 | true | none |
| §0.3 six labels | λ = −1, 2, 1/2, 3, 0, 1 over ℚ (x/0 := 0) | (−1,−1,2,1/2,1/2,2); (2,1/2,−1,−1,2,1/2); (1/2,2,1/2,2,−1,−1); (3,1/3,−2,−1/2,3/2,2/3); (0,0,1,1,0,0); (1,1,0,0,0,0) | true | none |
| §0.4, §0.5 invariants | λ = 2, 1/2, −1, 0, 3; (d,λ) = (2,1/2), (2,3), (0,3) | (c₄,Δ,j): λ=2: (48,64,1728); 1/2: (12,1,1728); −1: (48,64,1728); 0: (16,0,—); 3: (112,576,21952/9). (2,1/2): (48,64,1728); (2,3): (448,36864,21952/9); (0,3): (0,0,—) | true | none |
| §0.6 cross-ratios | roots (0,1,−1), (0,1,3), (3,5,9), (0,0,1) | orders (012),(021),(102),(120),(210),(201) give λ, 1/λ, 1−λ, 1/(1−λ), λ/(λ−1), (λ−1)/λ with λ = (e₂−e₀)/(e₁−e₀); (3,5,9): d = 2, λ = 3, tuple (3,1/3,−2,−1/2,3/2,2/3); (0,0,1): 1/0 ↦ 0 | true | none |
| §0.8 normalization of a split cubic | roots (3,5,9), Mathlib variable-change formulas with (u,r,s,t) = (1,3,0,0) | (a₂,a₄,a₆) = (−17,87,−135) ↦ (−17+9, 87−102+27, −135+261−153+27) = (−8,12,0) = L(2,3); direction x_old = u²x_new + r confirmed by a₆' = f(r) | true | none |
| `exists_scaledLegendre_of_full_two_torsion` (§0.9) | every elliptic Weierstrass curve over 𝔽₃ (9 with four 2-torsion points) and 𝔽₅ (250), all variable changes, all (d,λ) | every such curve reaches some L(d,λ), d ≠ 0, λ ∉ {0,1}; y² = x³−2x over ℚ: kernel {O,(0,0)} (hypothesis fails); y² = x³−x over 𝔽₃: four points, d = 1, λ = 2, Δ = 1 | true | none |
| §0.10 labelled two-torsion | (d,λ) = (1,−1), (2,1/2), (1,3) over ℚ; L(−1)/𝔽₃ | points (0,0),(d,0),(dλ,0); over 𝔽₃ the four points O,(0,0),(1,0),(2,0) exhaust the count 4 | true | none |
| §1.1 valuations | p = 3,5,7, all λ = n/d with |n| ≤ 30, d ≤ 30 | v_p(j) ≥ 0 ⇒ v_p(λ) = v_p(1−λ) = 0 in every case (no violation); λ = 3: j = 21952/9, v₃ = −2; λ = 1/3: same j; λ = −1: v₃(1728) = 3; λ = 2, p = 2: v₂(j) = 6 with v₂(λ) = 1 | true | none |
| `legendre_units_of_good_reduction` (§1.2) | pinned `HasGoodReduction` (extends `IsMinimal`, Δ valuation 1), `integralModel_c₄_eq`, `integralModel_Δ_eq`, `map_j`, `variableChange_j`, `j_quadraticTwistOf` | good minimal model ⇒ c₄ integral, Δ unit ⇒ v_p(j) ≥ 0; j(E) = j(C•E) = j(L(d,λ)) = j(L(λ)); §1.1 gives the units; ellipticity of L(d,λ) over ℚ forces d ≠ 0, λ ∉ {0,1}; 256 is a 3-adic unit | true | none |
| §1.3 unit model | λ = 3 at p = 5 and p = 3; p = 2 | Δ = 576 ≡ 1 (mod 5), λ̄ = 3, 1−λ̄ = 3; v₃(576) = 2, λ̄ = 0; in 𝔽₂ λ̄ = 1 forces 1−λ̄ = 0 | true | none |
| §1.4, §1.5 conductors | ωλ ∈ {3,−3,6,−6}, {−1,1,−2,2} via ClassicalArithmeticCompletion §1.51 (D = d or 4d) | squarefree parts 3,−3,6,−6 ↦ D = 12,−3,24,−24 (conductors 12,3,24,24, odd part 3); −1,1,−2,2 ↦ −4,1,−8,8 (conductors 4,1,8,8, odd part 1); y² = x³−x has conductor 32 | true | none |
| §2.1, §2.3 split readings | (d,λ) = (2,3), (1,−1), (1,2), (1,1/2) | X+1 ↦ (1,3,7); X² ↦ (0,4,36); 1 ↦ (1,1,1); constant 4 ↦ (1,1,1); constant 2 ↦ ([2],[2],[2]) ≠ 1 over ℚ; X not a unit (first coordinate 0) | true | none |
| §2.5 nonroot descent | L(−1)/𝔽₅, P = (2,4) | representatives (2,1,3), product 6 ≡ 1 = y²; characters (−1,1,−1) | true | none |
| §2.6 root descent | (d,λ) = (1,−1) at p = 5; (2,3) over ℚ; BS20 lines 667, 710, 715 | (d²λ,−d,−dλ), (d,d²(1−λ),d(1−λ)), (dλ,d(λ−1),d²λ(λ−1)): p = 5 raw (4,4,1),(1,2,2),(4,3,2), classes (1,1,1),(1,[2],[2]),(1,[2],[2]) = BS20 line 667; (2,3): (12,−2,−6),(2,−8,−4),(6,4,24), products 144, 64, 576; conic λ = 2t², d = 2: T₀ ↦ (2,2,1), T₂ ↦ (2,2,1), T_{2λ} ↦ (1,1,1) = BS20 line 715 | true | none |
| §2.7 product | O, (2,4) over 𝔽₅, T₀ | 1; [2·1·3] = [1]; d⁴λ² a square | true | none |
| `scaledLegendre_halving_iff_squares` (§2.8) | every elliptic L(d,λ) over 𝔽₃, 𝔽₅, 𝔽₇, 𝔽₁₁, 𝔽₁₃ and every affine point | "P ∈ 2E" agrees with "x, x−d, x−dλ squares (0 counted)" at every point (0 failures); L(−1)/𝔽₅: doubles = {O,(0,0)}, (1,0) has differences 1,0,2 with 2 a nonsquare; over ℚ (0,0) on L(−1) has −1 nonsquare | true | none |
| `legendre_two_by_four_subgroup` (§3.1) | p = 7, η = 2; p = 5, η = 2; 𝔽₉, η = i | L(4)/𝔽₇: count 8, (3,1) has order 4 with 2(3,1) = (1,0), (0,0) order 2, subgroup of order 8; L(4)/𝔽₅: count 8, 2(2,1) = (0,0); L(−1)/𝔽₉: count 16, P = (i,1−i) with 2P = (0,0); p = 3: no admissible η | true | none |
| §3.2 half of (0,0) | p = 5, i = 2, 3; p = 17, i = 4; general K | (1−i)² = −2i = i³−i; slope −(1+i); 2P = (0,0); 2y = 3 resp. 1 nonzero; i = 2,3 nonsquares mod 5; i = 4 square mod 17 | true | none |
| §3.6 no order 8 | p = 5, 13, 29 (halves of (0,0)); p = 41 | the four halves (i,1−i)+T all have nonsquare x (characters −1,−1,−1,−1), i a nonsquare; p = 13: count 8, orders {1,2,4}; p = 41: (6,13) has order 8, count 32 | true | none |
| `legendre_minus_one_point_count_v_two` (§3.7) | every prime p ≡ 5 (mod 8) below 2000; 𝔽₁₂₅ | v₂(count) = 3 for all 48 primes (5,13,29 ↦ 8,8,40); 𝔽₁₂₅ ↦ 104 (R02) | true | R02 |
| §4.1 witness | 𝔽₅ with t = v = 2, i = 2, 3; all conic points over 𝔽₁₃, 𝔽₁₇, 𝔽₂₉, 𝔽₃₇, 𝔽₄₁ (124 points); 𝔽₉ with t = v = 1 | corrected P = (2λ+4itv, 8itv(t+iv)) lies on L(2,λ) and doubles to (2λ,0) at every point; printed BS20 y fails membership at 120 of 124 points and at (𝔽₅, i=3): (4,4) with 16 ≡ 1 ≠ 4; (𝔽₅, i=2): (3,1) = −(3,4) on the curve; 𝔽₉: P = (1+i,1−i), y² = i = cubic value, 2P = (1,0); slope r+s, x(2P) = r² symbolically | true | none |
| `scaledLegendre_minus_one_trace_zero` (§5.1) | all primes p ≡ 3 (mod 4) below 100, all u; p = 7, u = 2; p = 3, u = 0, 1; p = 5, u = 1; 𝔽₂; 𝔽₂₇; 𝔽₉, 𝔽₂₅, 𝔽₄₉ | count = p+1 in every case; p = 7: character values (0,1,0,1,−1,0,−1), count 8; p = 3, u = 0: fibres 1,2,0, count 4; p = 5, u = 1: count 8, trace −2; 𝔽₂: 3 vs formula 4; 𝔽₂₇: 28 = q+1; 𝔽₉: 16 ≠ 10 | true as typed; narrower than statable | R01 |
| `quadraticTwistOf_frobeniusTrace` (§5.2) | every normal-form W over 𝔽₃, 𝔽₅, 𝔽₇, 𝔽₁₁, 𝔽₁₃, every d (singular W and d = 0 included); 𝔽₅, λ = 3, d = 2, 4; λ = 0, d = 2; 𝔽₉, W: y² = x³+x+1, d = 1+i | trace(twist) = χ(d)·trace(W) with 0 failures; counts 4/8 (traces 2/−2, χ(2) = −1), 4/4 (χ(4) = 1); λ = 0: 5/7 (traces 1/−1); d = 0: y² = x³, count 6, trace 0; 𝔽₉: 16/4, traces −6/6, χ(1+i) = −1 | true | none |

Degenerate and boundary cases tested: the zero ring (§0.1), nonreduced ring (§0.1), d = 0 and λ ∈ {0,1} (§§0.2, 0.5, 5.2), p = 2 (§§1.1, 1.3, 5.1), p = 3 and 𝔽₉ (§§0.1, 0.9, 3.1, 4.1, 5.2), conductor 1 (§§1.4, 1.5), the two-torsion points in the halving criterion (§2.8), the trivial twist d = 4 (§5.2).

## Verified sound

- Declarations read: 9 (2 definitions, 7 sorry'd theorems); no `variable` lines, so every binder is explicit in each signature and no section hypothesis can be lost; `theorem` throughout; single `import Mathlib` plus two `TauCeti.*` modules that exist at the pin and are both used; no `set_option`, `#eval`, `lemma`, `True` placeholder or sorry'd data. Lean versus README generality agrees for all seven theorems (§§0.9, 1.2, 2.8, 3.1, 3.7, 5.1, 5.2), subject to R01/R02.
- Targets read: 27 (every section of Layers 0–5), each with the proof route checked against the pinned declarations it names.
- Pinned declarations checked at Mathlib 6b7abb3 and Tau Ceti a91d3aa (file and line read): `WeierstrassCurve`, `IsElliptic`, `c₄`, `Δ`, `j`, `map_j`, `VariableChange` and its coefficient action, `variableChange_j`, `IsCharNeTwoNF` (= a₁ = a₃ = 0), `toCharNeTwoNF` (needs `Invertible 2`), `Affine.Equation`, `Affine.Point`, its `AddCommGroup` instance, `Point.map`, `add_self_of_Y_ne`, `IsIntegral`, `integralModel_c₄_eq`, `integralModel_Δ_eq`, `IsMinimal`, `minimal`, `HasGoodReduction` (extends `IsMinimal`, Δ valuation 1), `hasGoodReduction_iff_isElliptic_reduction`, `Padic.valuation_ratCast`, `padicValRat.mul/div/add_eq_min`, `PadicInt.algebra`, `PadicInt.isFractionRing`, `quadraticChar`, `quadraticChar_card_sqrts`, `quadraticChar_exists_neg_one`, `quadraticChar_one_iff_isSquare`, `quadraticChar_neg_one_iff_not_isSquare`, `legendreSym.at_two`, `legendreSym.eq_neg_one_iff`, `ZMod.euler_criterion`, `ZMod.exists_sq_eq_neg_one_iff`, `Ideal.quotientMulEquivQuotientProd`, `Polynomial.quotientSpanXSubCAlgEquiv`, `QuotientGroup.map`, `QuotientGroup.eq_one_iff`, `AddCommGroup.equiv_directSum_zmod_of_finite`; Tau Ceti `pointCount` (Nat.card of all affine solutions plus one), `pointCount_eq_card_point`, `frobeniusTrace` (q + 1 − pointCount, `[Finite F]`), `frobeniusTrace_def`, `quadraticTwistOf` and its `Δ_`, `c₄_`, `j_`, `isElliptic_..._iff` lemmas, `Affine.f`, `A` (= AdjoinRoot f), `M` (= Aˣ/squares), `equivProdA'`, `equivProdA'_apply`, `fCofactor`, `separable_f`, `μ`, `μ₀`, `μX`, `μX_of_eval_f_eq_zero`, `μX_of_eval_f_ne_zero`, `ker_μ_eq` (ker μ = range of 2•, under `IsCharNeTwoNF`, `IsElliptic`, `DecidableEq`), `norm_mk_C_sub_X_add_fCofactor`, `card_ker_nsmul_two` (under `IsCharNeTwoNF`, as §0.9's route expects), `Point.addEquivVariableChange`, `Point.equivVariableChange`, `y_eq_zero_of_order_two` (Tau Ceti NormalForms.lean), `Affine.finite_point`. All 61 exist with the hypotheses the README states for them; the README's descriptions of `pointCount` (singular solutions included), of the twist parameters and of the root-branch representative match the pinned bodies.
- Locators verified in BS20 (18): lines 462–464 (symmetric cubic and the Koblitz reference, which is [22] = Koblitz 1984), 513 (equation (17)), 526–546 (Lemma 6.2 and the six ratios), 547–557 (Lemma 6.3), 554, 568–569 (Lemma 6.4 proof), 657–662 (descent display), 659, 661, 663 (Lemma 6.5), 666–667, 668–671, 703–705 (F′_λ), 710, 715, 718; printed pages 366–371 agree with the page markers. S09 and K84 are uncertified and cited by locator only.
- Checks tested: about 100 bullets across the 27 sections, all recomputed (values in the table) and all correct; every definition (§§0.1, 0.2, 0.3, 0.10, 2.1, 2.3, 3.2, 4.1) has at least three Checks, with the repetitions listed in R04.
- Sibling citations checked (17) against main or the heads the brief gives: EllipticCurves Layer 4 (reduction predicates on `W.minimal R`, potential good reduction) and Layer 5 (quadratic twists via `quadraticTwistOf`); ModularCurves §4C (Legendre problem and universal curve over ℤ[1/2]) and §9E (Legendre line, S₃ action, ℚ(λ)^{S₃} = ℚ(j)); ClassicalArithmeticCompletion §1.7, §1.8, §1.51 on main with all seven API names (`squareclassDiscr`, `squareclassCharacter`, `squareclassCharacter_isPrimitive`, `squareclassCharacter_apply_prime`, `squareclassDiscr_one`, `odd_prime_dvd_squareclassDiscr_iff`, and the squarefree-odd-part statement) and with the Legendre symbol of a rational unit as numerator times denominator; NeronModelsAndSemistableAbelianVarieties §5.3a (Artin-conductor definition, f = 0 iff good, f = 1 iff multiplicative) and §5.3g (for E/ℚ, p | N_E iff bad reduction, v_p(N_E) = 1 iff multiplicative) at head 3710abd, a new-roadmap pull request earlier in the merge order (position 56); ArithmeticGaloisRepresentations (position 48) exists as Neron's supplier; EllipticCurveModularityPartII §5.1, ErdosProgressionPowers Layer 2 and §2.1, ArithmeticDynamics §§6.35, 6.111, 6.112, MordellLawrenceVenkatesh §6.4 and ComputationalNumberTheory §3.17 exist at the heads (their descriptions are R03). ErdosProgressionPowers §2.1's contract items LG.0–LG.5 (scaled model including d = 0 and λ ∈ {0,1}; good-prime units and odd-conductor divisibility; split descent and halving; subgroup theorem and 8 ∥ #F₋₁(𝔽_p); the order-four witness (2λ+4itv, 8itv(t+iv)); trace transport a_p(F′_λ) = (2/p)a_p(F_λ)) all match §§0.2, 1.2, 1.5, 2.8, 3.1, 3.7, 4.1, 5.2 as stated here.
- Dependency gate: `depcheck: 51 roadmaps, 583 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. Suppliers (ClassicalArithmeticCompletion 107, NeronModels 56, EllipticCurves and ModularCurves on main) all precede position 108; every roadmap named as a consumer is later.
- Policy: `git diff --stat origin/main...HEAD` touches only the package folder (README.md, Suggested.lean, design/plan.json, metadata.toml, two reports, sources.toml); no pull-request numbers or process words in README or docstrings; the only "Lemma" occurrences are source citations.
- Ownership against open work: the `roadmaps grep` tool (all open roadmap pull requests and main) finds no other statement of the normal-form character-sum count or the twist-trace identity; the Legendre coefficient model is also planned by MordellLawrenceVenkatesh §6.4 (R03), which is later in the merge order, so this roadmap is the owner.
- Notes (not findings): §1.2 lists EllipticCurves Layer 4 among its inputs, but its route uses only the direction "good minimal model ⇒ integral j", which the pinned Mathlib lemmas give; the edge is harmless since EllipticCurves is on main. The §4.1 correction of the BS20 witness is right (table row); the printed x-coordinate and the conclusion θ′₃(P) = [4itv] are unaffected.

## Not verifiable

- Lean elaboration: not built. The board checkout has no Lake environment (the content checkout carries no `.lake`), and the brief allows no other Lean command; the repair report's `lake env lean` run (seven `sorry` warnings, no errors) and its `#check` binder comparison were not reproduced. All instance arguments were checked by reading the pinned signatures instead.
- Silverman (S09) and Koblitz (K84) locators: uncertified, cited by locator without the text; BS20 line 464 confirms that the Koblitz page is the one the source points to.
- NeronModelsAndSemistableAbelianVarieties and ArithmeticGaloisRepresentations are open pull requests (#852, #856), not on main; their sections were read at the heads the `roadmaps show` tool returns.

## Source issues

- **Error** in BS20 at proof of Lemma 6.6, printed page 371 (line 718): the source displays the order-four point P on F′_λ with a y-coordinate that is a degree-six expression in t and v; that point is not on the curve (over 𝔽₅ with t = v = 2, i = 3 it gives (4,4) while the cubic value at x = 4 is 4, and it fails at 120 of 124 conic points over 𝔽₁₃, 𝔽₁₇, 𝔽₂₉, 𝔽₃₇, 𝔽₄₁); it should be y = 8itv(t+iv), which satisfies the equation and doubles to (2λ,0) at every point; affects the proof (only through the displayed point; the x-coordinate, 2P = (2λ,0) and θ′₃(P) = [4itv] stand).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a5ea30c", "job": "RT-EllipticLegendreCharacterInterfaces~1b", "model": "fable", "worker": "fable-rt31"} -->
