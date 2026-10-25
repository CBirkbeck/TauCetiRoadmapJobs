<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/993#issuecomment-6396822191 -->
Review (claude) of 6a76e15

Verdict: needs changes

1. **F01** (P2) Layers 2–3 use KatoEulerSystems Layer 5 outside its admissible range

   **Location.** `packages/CMRankZeroConverse/README.md`:

   - line 95: "Sections 5.1 and 5.3 supply the actual E-linear zeta morphism, its relation z(cγ)=−σ₋₁z(γ), and its critical period formula on F-rational vectors";
   - line 349 (§3.2): "For every normalized newform of even weight k≥2 and every λ|p, assume the actual rational equality…";
   - likewise §2.2 (line 290) and §3.1 (line 339), which take any newform and any λ|p.

   **Claim.** KatoEulerSystems §§5.1 and 5.3 give the zeta morphism and the critical interpolation for every newform at every coefficient place.

   **Witness.** KatoEulerSystems README at board head a3ba9c5:

   - line 1447: "Throughout this layer `(f,λ)` is admissible";
   - lines 176–183: the definition of an admissible pair;
   - §4.1, lines 1136–1143: a non-CM form with inner twists is not admissible at places where Momose's quaternion algebra is a division algebra.

   **Repair.**

   - Add a sentence to Conventions: "In Layers 2–3 the pair (f, λ) is admissible in the sense of KatoEulerSystems, Conventions, 'Admissible pairs'. Every CM pair is admissible, and so is every λ when f has no nontrivial inner twist."
   - Add "admissible" to the hypotheses of §§2.2, 2.3, 2.4, 3.1 and 3.2.
   - On line 95, write "Sections 5.1, 5.3 and 7.2 supply, for admissible pairs, …".
   - Alternatively, keep every λ and declare a gap on KatoEulerSystems for §§5.1 and 5.3 at inadmissible λ, under the rank-one hypothesis of §2.3.

   **Tested.** Two instances:

   - The weight-two theta newform of y²=x³−x at λ|2 is CM, so it is admissible (KatoEulerSystems lines 176–177). §3.3 and Layers 4–6 are unchanged.
   - A non-CM form with a nontrivial inner twist, at λ over a ramified place of its quaternion algebra, is now excluded, as KatoEulerSystems §4.1 requires.

2. **F02** (P3) The rational Kato equality restates ModularIwasawaMainConjectures §0.7 without naming it

   **Location.** README line 311 (§2.3): "the rational Kato equality `char_A H_Iw^2 = char_A(H_Iw^1/Z(f))`". §3.2 (line 349) uses the same hypothesis. Scope (lines 9–11) and the supplier contracts never name ModularIwasawaMainConjectures.

   **Claim.** The equality is stated here as a local hypothesis.

   **Witness.** ModularIwasawaMainConjectures README (open head e954663), §0.7, lines 435–449:

   - it defines `KMC_rational` as the equality of these ideals in Λ[1/p];
   - `KMC.changeLattice` gives lattice independence;
   - at p=2 it coincides with Kato's statement.

   That roadmap is at line 249 of the merge order; this one is at line 281.

   **Repair.**

   - In §§2.3 and 3.2 and in the Layer 2 Dependencies, call the hypothesis "ModularIwasawaMainConjectures §0.7 `KMC_rational`".
   - Add a "From TauCetiRoadmap.ModularIwasawaMainConjectures" contract (§§0.6–0.7) and one clause in Scope.
   - Rerunning the dependency check gives no UPWARD line, since 249 < 281.

3. **F03** (P3) `squareclassHeight` is a restatement, not a "specialization"

   **Location.** README line 15: "The height formula is a specialization of ArithmeticStatisticsPartI's height to the native squareclass quotient". Line 514 says the same. Line 27 states the height only "over an imaginary quadratic K". `Suggested.lean` line 95 defines it for every `NumberField K`.

   **Claim.** The local definition specializes ArithmeticStatisticsPartI's height.

   **Witness.** ArithmeticStatisticsPartI README (head 3b1a24f), line 1035, defines the same product over odd-valuation primes. It does so for every number field F, on Tau Ceti's `SquareClassGroup F`, and proposes the declaration `squareclassHeight`. That is the same formula on the same domain.

   **Repair.**

   - On lines 15 and 514, say that `squareclassHeight` restates ArithmeticStatisticsPartI §0.5's `squareclassHeight` for every number field K. It is kept locally only because `Suggested.lean` cannot import another roadmap.
   - State the §6.1 height and its API for every number field K.

   **Tested.** Both definitions give height 2 to the class [1/2] over ℚ, and height 1 to the class [2]=[i] in ℚ(i).

4. **F04** (P3) README generality of `descendsToRat` is narrower than its signature

   **Location.** README line 579: "For an imaginary quadratic field K and a Weierstrass curve W/K define pointed descent to ℚ by `descendsToRat`". `Suggested.lean` line 123 takes `{K : Type*} [Field K] [Algebra ℚ K]`.

   **Witness.** The elaborated type is `{K} → [Field K] → [Algebra ℚ K] → WeierstrassCurve K → Prop`, as printed by `#check @descendsToRat`.

   **Repair.** Write: "For a field K of characteristic zero and a Weierstrass curve W/K define…; §§6.4–6.6 apply it with K imaginary quadratic."

   **Tested.** The signature already covers K=ℚ(i), which the Checks on line 590 use.

5. **F05** (P3) Scope credits EllipticCurves with a theorem this package requests as a gap

   **Location.** README line 13: "EllipticCurves Layers 1, 5 and 7 own general isogenies, pointed-twist classification and isogeny invariance of the classical Selmer corank."

   **Witness.** In `TauCetiRoadmap/EllipticCurves/README.md` on main, Layer 7 (lines 1262–1300) gives Selmer structures, Sel_m and Sha. It treats isogeny invariance only as the stretch goal of Cassels' BSD quotient over ℚ. Line 63 of this package asks for the all-prime corank statement as gap:isogeny-corank-all-primes.

   **Repair.** Write "… pointed-twist classification and, under gap:isogeny-corank-all-primes, the all-prime isogeny invariance of the classical p∞ Selmer corank."

Five findings: one blocking (P2) and four P3. All nine round-2 findings are repaired, and none of the repairs introduced a new defect. The blocking finding is new and sits in text the repairs did not touch. At its current board head, KatoEulerSystems supplies the zeta morphism and its interpolation only for admissible pairs (f, λ). Layers 2–3 cite it for every newform and every λ. The CM chain (§3.3 onwards) is unaffected, because every CM pair is admissible.

## Verified sound

### Repair check, round-2 findings (9 of 9 repaired)

| Id | Repaired passage (abridged) | Status |
| --- | --- | --- |
| F01 | `Suggested.lean` lines 13–14: "the three congruent-number density theorems, CM twist nonvanishing and non-descending nonvanishing". It has 5 theorems and 4 definitions. The five deleted names occur nowhere. | Repaired |
| F02 | README line 3: "This roadmap develops the all-prime rank-zero converse…". There is no bare RankZeroOneBSD and no Part II framing. | Repaired. The stale plan.json mentions are not actionable at the package stage (the plan is frozen outside `gaps`). |
| F03 | Line 101: "§CZ.4 target rational-equivariant-main-conjecture…; §CZ.6 targets cm-kato-main-conjecture and cm-kato-normalization-dictionary". The gap is gone from both copies. | Repaired. All five ids exist in the ModularIwasawaMainConjecturesPartII design, lines 152–197. |
| F04 | Line 51 ends "…on all of ℂ, with the actual bad-prime factor when p divides the level." | Repaired |
| F05 | Line 69: "What AlgebraicCurves must provide (gap:pointed-cubic-model-comparison): over a characteristic-zero field k, for a smooth integral projective plane cubic…". plan.json gives supplier AlgebraicCurves, Layer 10. | Repaired. Layer 10 on main (line 918) has plane-curve function fields and the point–place dictionary (iii). |
| F06 | Line 369: "KatoEulerSystems supplies the zeta morphism and reciprocity, ModularIwasawaMainConjecturesPartII §CZ.6 supplies the CM equality…". | Repaired |
| F07 | One `**Checks.**` block in §5.2 (lines 465–473). A blank line at 470 leaves it a single loose list. | Repaired |
| F08 | Line 115: "descend the geometric endomorphism-ring identification of §1.1 to End_k(E)≅ℤ[ζ₃]". The plan.json section is "1.1". | Repaired |
| F09 | Line 107 cites "Section R17.4.16, quadraticInduction … L_ℚ(s,AI ψ)=L_K(s,ψ)". Line 113 is narrowed to the newform realization and the Galois comparison. | Repaired. R17.4.16 (GL2 head 69bcab7, line 2201) states the identity. |

I then searched the whole package for each repaired pattern:

- a supplier object that does not exist: none;
- a stale supplier sentence: none;
- duplicate Checks blocks: none;
- a redundant gap: none.

### Adversarial table

| Statement | Instances tried | Values computed (statement side / test side) | Result | Change |
| --- | --- | --- | --- | --- |
| `ellipticLNonvanishingAtOne` and its carrier | Model y²=x³−16x (d=−4) against y²=x³−x | Δ=2¹⁸ against 64; the first model is non-minimal at 2. Mathlib `localPolynomial` reads `W.minimal R` (LFunction.lean:44), so both have factor 1 at 2 and the same series | Model-independent | none |
| `congruentTwist` | n=1, 2, −1, 0, 3 | Δ=64, 4096, 64, 0, 46656. Lean `example`s for Δ(1), Δ(2), a₄(2)=−4 and the sign symmetry elaborate | Sound | none |
| `congruentNumber_densityOne` | denominator at X=3·10⁵ | #S=91180, #P=182378, ratio 0.49995 (expected 1/2) | Sound (BT Thm 1.2, lines 50–52) | none |
| `congruentNumber_half_positive` | #P(X) against 6X/π² | 182378 against 182378; residues 5, 6, 7 have root number −1 (BT line 97) | Sound | none |
| `congruentNumber_half_discriminants` | Filter on 1, −4, 8, −8, 12, −3, 5, −7 and 0, 4, 9, −1; count at X=3·10⁵ | Accepts exactly the first eight. 182370 discriminants (6X/π²≈182378); 91169 with \|squarefree part\|≡1, 2, 3 mod 8, ratio 0.49991. Weights 5/4+1/2+5/4=3 of 6 | Sound | none |
| `squareclassHeight` | ℚ: [2], [1/2]; ℚ(i): [5], [3], [2], [1] | 2, 2; 25, 9, 1, 1 | Sound; same object as ASPartI §0.5 | R03 |
| `cmTwists_nonvanishing_lowerHalf` | K=ℚ(ζ₃), ℚ(√−2), ℚ(i); y²=x³−x over ℚ(i) and over ℚ(√−2); ε=1 | O/(3) is 𝔽₃[e]/e², 𝔽₃², 𝔽₉, so h3 is true, true, false. End ranks 2 and 1, so hCM is true, false. At ε=1 the left side is ≤0 | Matches BT Prop 1.3 (lines 58–60) | none |
| `descendsToRat` | y²=x³−x over ℚ(i); y²=x³+x+(1+i) | The first descends with C=1. The second has j≈9.430−127.302i∉ℚ and Δ=−64−864i≠0 | Discriminates | R04 (prose only) |
| `cmTwists_nondescending_nonvanishing_lowerHalf` | total cX, loss C√X, C/c=1 | Lost ratio at X=10⁶ is 10⁻³ → 0 | Sound | none |
| §0.1 p-converse | (corank, rank)=(0,0), (0,1), (1,0) | Rank-zero proposition: true, false, true | Sound | none |
| §0.2 sign and projector | k=0, 2, 3, 4, 6, 7 | Values 1, 1, 1, −1, 1, 1. ε(−1)ʰ=−1 at k=2, 4, 6. P₊(1,−1)=(1,0) and P₋(1,−1)=(0,−1) for diag(1,−1). The swap gives (1/2,1/2) | Sound (BT line 235) | none |
| §0.3 Frobenius direction | Kato (14.10.2)–(14.10.3) with ℓ=5, a=2 | Geometric roots 1±2i; twisted roots (1±2i)/5 with product 1/5; det M_f=κ^(1−k) | Geometric convention correct | none |
| §0.4 central prime | (p,h,c)=(3,1,4); σ₋₁ at h=1, 2 | 1/4; −1, +1 | Sound (BT line 240) | none |
| §1.1 | rank-two irreducible against 1⊕χ | H⁰ dimensions 0 and 1 | Sound (Kato line 4819) | none |
| §1.3 | Euler identity with h⁰=h²=0 and dim W^(c=−1)=1; zero representation | h¹=1; 0 | Sound (Kato line 4787) | none |
| §1.4 | crystalline moduli at p=2, 3 | 0.707, 0.5, 0.577, 0.333 (none equals 1). For ℚ_p(1), dim H_g−dim H_f=1 | Sound (Kato lines 4810–4812, 4832–4849) | none |
| §2.1 | R→R with differential π | H²=R/π; Tor₁ has length 1, and 0 once H²=0 | Sound | none |
| §2.2 | z(cγ)=−σ₋₁z(γ) at h=1, 2 | Surviving eigenvalue ε=+1, −1, as in KatoEulerSystems §5.1 | Sound | R01 (range) |
| §2.3 | R/π against R | Lengths 1 and 0; characteristic ideals (π) and (1) | Sound (BT lines 208–218, 240–244) | R01, R02 |
| §3.1 | r=h at k=2, 4, 6 | Exponents 0, 1, 2 and signs +, −, +; matches KatoEulerSystems §5.3 | Sound | R01 (range) |
| §3.3 | ℚ(i) at 2; ℚ(√−2) at 2; ℚ(√−7) at 7 | (ζ₈+ζ₈³)²=i−2−i=−2; √−7∈ℚ(ζ₇) | Sound (BT lines 208–228) | none |
| §4.5 | 2r=0 in ℕ | Only r=0; r=1 gives 2 | Sound (BT lines 260–261) | none |
| §5.1 | limits 0, 1/2, 3/4, 1 | Only 1/2 satisfies the proposition | Sound | none |
| §5.4 | residue weights; d=8 | 4·(5/4)+2·(1/2)=6, of which 3 allowed; a₄(8)=−64=2⁴·(−4) | Sound (BT lines 47–52) | none |
| §6.2 | maps and invariants | G∘fwd=108n²F and F∘inv=54nG; both composites are 18n·id (2000 random integer tests, 0 failures). Δ(±1)=−314928, Δ(3)=−25509168, Δ(0)=0. (1,1)↦(3,0); origin ↦ [0:18n:0]; X/Y pulls back to 2z/(3(x−y)) | Sound (BT lines 277–278) | none |
| §6.3 | α:(X,Y)↦(ζX,Y); ℚ | α³=1 and 1+α+α²=0; End over ℚ is ℤ; disc(T²+T+1)=−3 | Sound | none |
| §6.4 | j=0; j=1728 over ℚ(√−2) and ℚ(i) | [u]³=[u]. For t=√−2, a₄=32 rescales to 2, and √−2∉ℚ×K×² because a²=2b² has no solution. In ℚ(i), i=(1+i)²/2, so the two cosets coincide | Upper bound sound | none |
| §6.5 | ℚ(i) at 5, 3, 2 | Heights 25, 9, 1 | Sound (BKLOS lines 80–98) | none |
| gap newform-central-analytic-interface | pinned Tau Ceti | Only `qExpansion_conj` (Conjugate.lean:360) and the half-plane `L_eulerProduct` exist; there is no entire conjugation identity | Precise, not provided | none |
| gap pointed-cubic-model-comparison | AlgebraicCurves Layer 10 (main) | Has plane-curve function fields and point–place (iii); no linear-map comparison | Precise | none |
| gap cube-sum-full-cm | CM&ER §1.1 (head 0c6c6e2, lines 358, 366) | Over ℂ only; no descent | Minimal | none |
| gap central-modular-local-dimensions | KatoEulerSystems a3ba9c5 | Prop. 14.12 is used only inside the §7.9 proof (line 2229) | Not provided | none |
| gaps smith-unconditional-positive-corank, cm-three-selmer-unconditional | ASPartVII (head cbcd49e) | Line 1273 is conditional on the Smith law; line 1286 defers the analytic step; line 1556 assumes C | Not provided | none |

### Mechanical checks

- **Elaboration.** `lake env lean` on `packages/CMRankZeroConverse/Suggested.lean`, run from the content checkout (Mathlib 6b7abb3, Tau Ceti a91d3aa), exits 0 in 3.9 s. It gives five warnings, all "declaration uses `sorry`", at lines 55, 67, 78, 105 and 131.
- **Binder audit.** A scratch file with `#check @` for all nine declarations elaborates. Every type matches its README statement, except the two prose-generality notes R03 and R04. No binder is lost.
- **One-tactic probe.** I tried `rfl`, `simp`, `infer_instance`, `trivial`, `decide` and `norm_num` on each of the five theorems: 30 attempts, all failed. There is no padding.
- **Form.**
  - One `import Mathlib` plus four Tau Ceti modules, all used.
  - No `set_option`, `lemma`, `#eval`, sorry'd data or process words.
  - Every Lean name occurs in the README.
  - The 12/12 gap slugs, suppliers and needs sentences match plan.json.
  - Ten definitions, each with an API list and at least three Checks.
  - Every layer ends with Examples and Dependencies.
- **Dependency check output:** `depcheck: 51 roadmaps, 591 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.

### Library declarations opened at the pins

- **Mathlib:**
  - `AlgebraicGeometry/EllipticCurve/Weierstrass.lean`: 76, 86, 131, 230, 366, 388;
  - `AlgebraicGeometry/EllipticCurve/LFunction.lean`: 43–50, 79, 84;
  - `AlgebraicGeometry/EllipticCurve/Reduction.lean`: 299;
  - `NumberTheory/ModularForms/LFunction.lean`: 134, 190;
  - `Analysis/Analytic/Order.lean`: 523, 528;
  - `Analysis/Analytic/Uniqueness.lean`: 234;
  - `RingTheory/DedekindDomain/Factorization.lean`: 309, 596;
  - `RingTheory/Ideal/Norm/AbsNorm.lean`: 258;
  - `NumberTheory/NumberField/Basic.lean`: 101;
  - `NumberTheory/Cyclotomic/Basic.lean`: 652;
  - `NumberTheory/NumberField/Cyclotomic/Basic.lean`: 56;
  - `NumberTheory/NumberField/Cyclotomic/Ideal.lean`: 83, 106, 124;
  - `Algebra/QuadraticAlgebra/IsQuadraticExtension.lean`: 16.
- **Tau Ceti:**
  - `FieldTheory/SquareClassGroup/Basic.lean`: 45, 66;
  - `NumberTheory/ModularForms/Newforms/AnalyticInvariants.lean`: 72, 80, 107;
  - `NumberTheory/ModularForms/LFunction/EulerProduct.lean`: 217;
  - `NumberTheory/ModularForms/LFunction/FunctionalEquation.lean`: 324;
  - `NumberTheory/ModularForms/Conjugate.lean`: 294, 298, 360;
  - `AlgebraicGeometry/EllipticCurve/ShortWeierstrass.lean`: 109, 168;
  - `AlgebraicGeometry/EllipticCurve/NormalForms.lean`: 131, 140;
  - `AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean`: 169, 411, 739;
  - `AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Basic.lean`: 106;
  - `AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Ring.lean`: 174;
  - `NumberTheory/ModularForms/Newforms/Newform.lean`: 104;
  - `Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean`: 145.

All 39 cited lines hold the named declaration, in the cited namespace. Neither library has a p∞ or Bloch–Kato Selmer group, nor modular Galois representations: Tau Ceti has only `selmerGroup₂` and `selmerGroupA`. So the docstring is correct that §§3.2–3.3, 4.2 and 4.5 are not statable at the pins.

### Cross-roadmap citations resolved

- **AutomorphicGaloisRepresentations** (81e9d0f): §§1.5, 3.15, 4.4–4.8, 6.4, 7.2.
- **ArithmeticGaloisDuality** (09ad340): R02.4.3, R02.4.4, D7.3, D7.5–D7.7.
- **SelmerIwasawaCohomology** (1fa1c7d): §§2.4, 2.10–2.12a, 2.19, 2.20, 3.0, 3.7, 3.10, 3.13–3.16, 4.9, 4.26, 4.29.
- **ArithmeticStatisticsPartI** (3b1a24f): §§0.1, 0.2, 0.5–0.7, 0.15. Its "Piecewise rescaling of a height" (line 379) and "Positive squareclass denominator" (line 1951) both resolve.
- **ArithmeticStatisticsPartVII** (cbcd49e): §§5.9–5.11. The quoted headings are at lines 1170 and 1556.
- **ComplexMultiplicationAndExplicitReciprocity** (0c6c6e2): §§1.1, 1.2, 4.1, 4.2, with `ellipticCMLFactorization` and `cmInductionComparison`.
- **EllipticCurveModularity** (ed342f3): R29.6, "Continuation and the functional equation", line 1893.
- **GL2AutomorphicRepresentationsAndTransfer** (69bcab7): R17.4.16.
- **PadicHodgeRegulators** (1a3728e): §§0.1, 1.1–1.8.
- **KatoEulerSystems** (board head a3ba9c5): §§2.2, 4.4, 4.6, 5.1 (z(ιγ)=−σ₋₁z(γ)), 5.3 (sign (−1)^(k−r−1)χ(−1), power (2πi)^(k−r−1)), 7.2.
- **ModularIwasawaMainConjecturesPartII** (board design): §§CZ.4–CZ.6.
- **On main:** ModularForms Layer 7; EllipticCurves Layers 1, 5, 7; AlgebraicCurves Layer 10.

The resolver's two leads, KatoEulerSystems and ModularIwasawaMainConjecturesPartII, are both false leads: they are board packages. Every supplier is earlier in the merge order. No supplier cites this roadmap back.

### Ownership

I searched main and the open heads by object: Burungale–Tian, p-converse, Goldfeld, cube sums, descent, and the Lean names. That turned up R02 and R03, and nothing else:

- ModularIwasawaMainConjectures §5.4 owns the ordinary non-CM converses (Skinner–Urban, Fouquet–Wan), not this CM all-prime result.
- ArithmeticStatisticsPartVII line 1286 assigns BT Theorem 1.2's analytic step downstream.
- No declaration in `Suggested.lean` shares a fully qualified name with another roadmap, and there are no Lean-name collisions in board packages.

### Sources: the seeded sample

All fifteen targets were read at their locators. The theorem numbers, pages and hypotheses support each statement as written.

| Target | Locators checked |
| --- | --- |
| 0.1 | BT (1.1) line 33; Thm 1.1 lines 39–43 |
| 0.2 | BT line 235; Kato Thm 12.5(1) lines 4053–4071 (p. 221) |
| 0.3 | Kato (14.10.1)–(14.10.5) lines 4793–4812 (pp. 240–241) |
| 1.1 | Kato Prop. 14.11(1) lines 4814–4819 |
| 1.3 | BT lines 238–239; Kato (14.9.5) lines 4783–4787 |
| 1.4 | Kato lines 4807–4812, 4832–4849 (pp. 241–242) |
| 2.1 | BT lines 234–244; Kato §14.13 line 4850 (p. 242) |
| 2.3 | BT lines 208–218, 235–244 |
| 3.3 | BT lines 208–228 |
| 4.5 | BT lines 33, 39–42, 260–261 |
| 5.1 | BT lines 47–52, 96 |
| 5.4 | BT lines 47–52; ASPartI line 391 |
| 6.2, 6.3 | BT lines 277–278 |
| 6.5 | BT lines 279–282; BKLOS lines 80–98 |

I also checked Kato §8.2 and §14.8 (lines 2490 and 4721; pp. 180, 238). The author flagged no locator as unverified. I fetched no new source and added no manifest entry.

## Not verifiable

- **Kato OCR.** The OCR garbles the sign display in Thm 12.5(1) (Kato lines 4066–4068) and the evaluation exponent in §14.13 (Kato line 4865). I fixed the conventions from BT line 240 and from KatoEulerSystems §5.3 instead.
- **BT published numbering.** The Annals version was not opened. The manifest and README consistently use arXiv v2.
- **Ownership against open pull requests.** It was checked only against the heads the brief makes readable.

## Source issues

- **Error** in Kato at (12.8.2), p. 223: the source says that for non-CM f, at every λ, the image of the Galois group over ℚ(μ_p∞) contains an open subgroup of SL₂(ℤ_p). It should exclude places over which Momose's quaternion algebra is a division algebra, where no nontrivial unipotent occurs. Affects a stated result.
- **Misprint** in BT at proof of Theorem 1.1, p. 6: the source says (line 256) that the dual Selmer group tensored with the number field K matches Selmer groups of the untwisted V(f) and V(f̄). It should use ℚ_p-coefficients and V(f)(1), V(f̄)(1). Affects the proof.
- **Gap** in BT at proof of Theorem 3.1, display (3.1), p. 6: the source says (lines 232–234) that Selmer vanishing gives rational H² vanishing directly from (14.9.3). A Poitou–Tate step proving the dual Selmer vanishing should come first. Affects the proof.
- **Gap** in BT at Theorem 3.5, p. 7: the source says (lines 272–275) that BKLOS Theorem 2.7 gives 3∞-Selmer corank zero. That theorem states rank zero only (BKLOS lines 196–198); it should cite the Selmer argument of BKLOS §9.2 with §11. Affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6a76e15", "job": "REV-PKG-CMRankZeroConverse~3", "model": "opus", "worker": "fable-rev109"} -->
