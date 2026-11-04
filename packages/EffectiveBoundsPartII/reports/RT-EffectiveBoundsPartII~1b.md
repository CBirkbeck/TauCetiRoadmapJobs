<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1411#issuecomment-6394623678 -->
Red team round 1 pass b (claude) of 06884a9

Verdict: needs changes

1. **F01** (P2) The end theorem (COU20 Theorem 2, §5.6) is statable at the pins but absent; the docstring's "not statable" claim is false

   Location: `packages/EffectiveBoundsPartII/Suggested.lean:11–13`, "the cubic-logarithmic discriminant-count theorem are not statable at the pins without rebuilding a supplier-owned carrier"; also `packages/EffectiveBoundsPartII/README.md:92`, "the two field-class headlines require the supplier’s quotient carrier".

   Claim: an upper bound on a number of isomorphism classes needs no quotient type. "Nₙ(H) ≤ X" is equivalent to: some X subfields of ℚ̄ represent every class of degree-n fields with |disc| ≤ H. That uses only `IntermediateField ℚ (AlgebraicClosure ℚ)`, `NumberField.discr` and `AlgEquiv`, all at the Mathlib pin, and defines no carrier. The roadmap's principal export (README "Downstream consumers": §4.2, §5.2, §5.6) is therefore statable and missing from the acceptance test.

   Witness: one representative per class gives m = Nₙ(H); conversely distinct classes hit distinct indices, because K ≃ L i ≃ K′ makes K, K′ one class. Instance n=2, H=3: m=1, L 0 = ℚ(√−3) (|d|=3; ℚ(i) has |d|=4); N₂(3)=1.

   Repair: in `Suggested.lean`, after `exists_logarithmic_small_models`, add

   ```lean
   /-- Couveignes's discriminant count (Theorem 2): for one absolute constant Q, every
   degree n > Q and every integer H ≥ 1, at most n^(Q n (log n)^3) H^(Q (log n)^3) subfields
   of an algebraic closure of ℚ represent every ℚ-isomorphism class of number fields of
   degree n with |disc| ≤ H; this is the bound on the number of those classes. -/
   theorem exists_cubic_log_discriminant_count :
       ∃ Q : ℝ, 3 ≤ Q ∧ ∀ n H : ℕ, Q < n → 1 ≤ H →
         ∃ (m : ℕ) (L : Fin m → IntermediateField ℚ (AlgebraicClosure ℚ)),
           (m : ℝ) ≤ (n : ℝ) ^ (Q * n * Real.log n ^ 3) * (H : ℝ) ^ (Q * Real.log n ^ 3) ∧
           ∀ (K : Type*) [Field K] [NumberField K], Module.finrank ℚ K = n →
             |NumberField.discr K| ≤ H → ∃ i, Nonempty (K ≃ₐ[ℚ] L i) := by
     sorry
   ```

   Replace the second docstring paragraph (lines 11–15) by: "The discriminant count of Layer 5 is stated through a representing family of subfields of an algebraic closure of ℚ; this is equivalent to the bound on the number of isomorphism classes and needs no class quotient. The coefficient-box class bound of §5.5 is an intermediate target kept in the README." In README line 92 replace "tests four headline theorems; the two field-class headlines require the supplier’s quotient carrier and are described in its module docstring" by "tests five headline theorems; the class count of §5.6 is stated through a representing family". Open §5.6 with: "The headline `exists_cubic_log_discriminant_count` states this bound through a representing family of subfields of ℚ̄." The README keeps its ArithmeticStatisticsPartI import for the class carrier. Tested on n=2, H=3: the representing form gives exactly 1 = N₂(3). Not elaborated (no Lean environment in the board checkout); every carrier named exists at the Mathlib pin.

2. **F02** (P3) §5.2 locator points at the wrong page of COU20

   Location: `packages/EffectiveBoundsPartII/README.md:657`, "(COU20 line 420, Theorem 1, p. 487, proved in §4 pp. 495–496)".

   Claim: the line number and the theorem disagree.

   Witness: COU20 line 420 is the running head of printed p.496. Theorem 1 opens at COU20 line 20 (p.487), and its proof closes at line 425, where the text says the theorem is proved.

   Repair: "(COU20 line 20, Theorem 1, p. 487; proved at lines 381–425, §4, pp. 495–496)". Checked: line 20 is the Theorem 1 heading; lines 381 and 425 are the §4 heading and the closing sentence of the proof.

3. **F03** (P3) Every "isomorphism", "automorphism", "homomorphism" and "morphism" in the README is corrupted to "…morφsm"

   Location: `packages/EffectiveBoundsPartII/README.md` lines 3, 13, 15, 40, 46, 88, 282, 524, 544, 555, 569, 578, 584, 602, 677, 723, 727, 729, 733, 746, 748, 750, 755, 758, 772; for example line 3, "the unweighted number Nₙ(H) of ℚ-isomorφsm classes".

   Claim: the letters "phi" were replaced by "φ" inside words. The README contains the word "isomorphism" 0 times. So object greps used for ownership and duplication checks ("isomorphism class", "automorphism weight") miss this roadmap's counting convention, and the text reads as misspelled.

   Witness: `grep -c isomorphism` gives 0 on the README and 14 on `design/README.md`. There are 29 in-word φ: 20 isomorφsm, 3 automorφsm, 2 homomorφsm, 1 morφsm, 2 isomorφc, 1 isomorφcally.

   Repair: replace isomorφcally→isomorphically, isomorφc→isomorphic, isomorφsm→isomorphism, automorφsm→automorphism, homomorφsm→homomorphism, morφsm→morphism, in that order. Keep the six standalone φ, which name the map φ:A_E→K. Checked: after the edit `grep -cE '[A-Za-z]φ|φ[A-Za-z]'` returns 0 and the standalone φ in §4.1 is unchanged.

## Verified sound

### Dependency check

```
moved: EffectiveBoundsPartII moved in the merge order from #99 to #123, right after its last supplier ArithmeticStatisticsPartI; checked as moved (the worker moves it there when it submits)
depcheck: 49 roadmaps, 558 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The `moved:` line comes from ArithmeticStatisticsPartI (merge order #124, open roadmap PR #1171 adding a new folder). Under the brief this is not a defect.

### The two points raised by the sibling EffectiveBoundsCompactModels

**Explicit constants (16, 40, 65536).** The README (lines 7, 667) and the Lean (`∃ Q : ℝ, 3 ≤ Q ∧ …`) leave Q unspecified, exactly as COU20 does: Theorems 1–2 at lines 20–25 and 35–38, and the §4 convention at lines 382–384 that one sufficiently large Q serves every occurrence. Leaving Q unspecified does not narrow the source, so it is not a defect. I recomputed the sibling's values anyway. For n ≥ 65536, put L = log n ≥ 11.09:

- r(n) ≤ r₀ = ⌈2L/log 2⌉ ≤ 3L, because 2^{r₀} ≥ n², r₀ + 1 ≤ 2^{r₀/2} and n ≤ 2^{r₀/2}.
- M < 4n(r+1) ≤ 16nL, and ℓ/(2n) ≤ 8L.
- The height logarithm is at most 24L² + 1.5L + 12L² + 6L log δ ≤ 40L(L + log δ).
- The count logarithm is at most 48nL²(log 3 + 40L² + (40L/n) log H) + 3L² ≤ 2000nL⁴ + 1920L³ log H ≤ 65536(nL⁴ + L³ log H).

So 16, 40 and 65536 are valid. The package may adopt them as a strengthening, but nothing requires it. Numerically, r(n) ≤ 3 log n holds for every 2 ≤ n < 200000; only n = 1 fails, as the §5.1 Check says.

**Isomorphism-class quotient.** There is one owner: ArithmeticStatisticsPartI §0.7, "Number fields ordered by discriminant" (`TauCetiRoadmap/ArithmeticStatisticsPartI/README.md`, §0.7 at line 1298, head 3b1a24f). It declares `NumberFieldFamily.Embedded`, `isoSetoid`, `isoFamily` and `isoDegree`, and its §0.1 `ArithmeticFamily.count` uses an inclusive cutoff, matching README line 88. This package defines no setoid, quotient or class type. Suggested.lean has none, and README lines 15, 17, 677 and 723 import the carrier rather than build it. The sibling's "ArithmeticStatistics ST.0" is the same section: the ArithmeticStatistics index package (board #128, head 357e723) assigns Layer 0 to Part I. ArithmeticStatisticsPartV's `polynomialMap_finiteFibres` (fibres of a dominant polynomial map) is a different object, and it comes later in the order. With R01 applied, the Lean side needs no carrier at all.

### Suggested.lean declarations

The file has no `variable` or `include` lines, so every binder is explicit in its own signature and none can be dropped.

| Declaration | Layer | Binders | Instances tried | Values (both sides) | Result |
|---|---|---|---|---|---|
| `exists_short_integral_basis` | 0 | `K` `[Field]` `[NumberField]` | ℚ; ℚ(i); ℚ(√5) | houses 1 ≤ δ² = 1; 1, 1 ≤ 4; 1, √5 ≤ 5 | true (Prop 1, line 161) |
| `exists_bounded_first_jet_generators` | 1 | `K r d hr hd hM` | K=ℚ, r=1, d=5 | M=6 ≥ 2, D=10, u=0: jet matrix on (1,X) is I₂; house bound 10 | true |
| `jacobianPolynomial` | 4 | `{r} E` | X²−2; (X,Y); (Y,X) | 2X; det 1; det −1 | real body, rows are equations |
| `JacobianOpenAlgebra` | 4 | `{r} E` | X²−2; X²; (X²−2)(X²−3) | ℚ(√2); 0 (2X nilpotent); J = 2X(2X²−5) gives −2√2 and 2√3, so ℚ(√2)×ℚ(√3) | real body |
| `HasBoundedModel` | 4 | `K [Field] [NumberField] r d H` | ℚ(√2), r=1, d=5, E=X²−2, κ=√2, H=2 | degree 2 ≤ 5, coefficients ≤ 2, J(κ) = 2√2, φ(class of X) = √2 | consistent; extra étale and φ clauses are implied |
| `explicitCoefficientBound` | 4 | `n r d δ` | (1,1,5,1); (0,1,5,1); doubling δ at n=1 | 5^{5/2}√6·10⁵ ≈ 1.369·10⁷; 6^0·√6·0 = 0; factor 2¹⁰ | matches README B |
| `exists_explicit_small_model` | 4 | `K r d hr hd hM` | K=ℚ, r=1, d=5 | E=X, κ=0, height 1 ≤ 1.369·10⁷ | true (Prop 2, line 354) |
| `centralBinomialRank` | 5 | `n` | n = 0, 1, 2, 14, 15 | 1, 1, 2, 4, 5 | matches §5.1 |
| `exists_logarithmic_small_models` | 5 | none | n=15 | r=5, M=252 ∈ [90, 360]; Q ≥ 15 needed for 5 ≤ r, which the existential allows | true (Theorem 1, strengthened to r=d=r(n)) |

Padding probe: no declaration follows from the pins in one tactic or one library lemma, restates a definition, or mirrors a Check. Each of the five definitions is used by a stated theorem. `exists_short_integral_basis` is Couveignes's Proposition 1, a second-Minkowski argument.

### README targets (one row per target)

| Target | Instances | Computed values | Result |
|---|---|---|---|
| 0.1 canonical measure | ℚ; ℚ(i); z=1 | 2 vs 1; 2π vs π; gauge 1, g-norm √2 | true |
| 0.2 canonical covolume | ℚ; ℚ(i) with β=(1,i); ℚ(√5) | 1; Gram diag(2,2), det 4, covolume 2 (Mathlib's 2⁻¹·2 = 1); disc 20 vs 5 | true |
| 0.3 short half-family | n=4, 5; ℚ | m=3, exponents 1 and 5/6; ⌊n/2⌋+1 = ⌈(n+1)/2⌉ (line 150) | true |
| 0.4 product span | V=ℚ in a quadratic field; k³×0 ⊂ k⁴; 𝔽₂(t)/𝔽₂(t²) | span dimension 1 at 2·dim V = n; the ideal is closed under products; 1, t span | true |
| 0.5 Proposition 1 | ℚ; ℚ(i); ℚ(√5) | δ² = 1, 4, 5 | true |
| 1.1 parameter map | ℚ with u=3; α=(1,1); ℚ(√5) | κ=3; det 0; det −2√5 | true |
| 1.2 bounded jets | ℚ, r=1, d=5; 7 collinear points, d=5; ∏(T−j) | D=10; rank 6+5 = 11 < 21; value D! at T=D | true |
| 1.3 value descent | κ=√2; κ=√5; κ=0 in a quadratic field | rank 2; integral index 2; rank 1 | true |
| 2.1 relation lattice | κ=√2, d=3; κ=0, d=2, n=2; d=0 | basis (−2,0,1,0), (0,−2,0,1), rank 2 = 4−2; rank 2 ≠ M−n = 1; kernel 0 | true |
| 2.2 transpose index | ℚ(√5) with κ=√5; ℚ(√2) with κ=√2; z↦2z | q=2; q=1; covolume 2 vs 1 | true |
| 2.3 Gram–discriminant | ℚ(i), κ=i; ℚ(√5), κ=√5, d=2 | 4/4 = 1 (VVᵗ has det −4); BBᵗ = [[27,−2],[−2,4]] has det 104, VV* = [[31,21],[21,31]] has det 520, 520/5 = 104; rational basis 520/20 = 26 | true |
| 2.4 monomial heights | n=2, r=1, d=5; r=d=2 | D=20, C₀=40δ², H₀=40⁵δ¹⁰, G=6·40¹⁰δ²⁰; M=6 | true |
| 2.5 relation covolume | ℚ(√5), κ=√5, d=2; ℚ, κ=0, d=2 | √26 ≤ 2√26 = √(520/5); covolume 1 | true |
| 3.1 short relations | ℓ=1, 2; X²−2 | ball lower bound 2; 2 ≤ π; norm √5 | true |
| 3.2 truncation | n=2, r=1, d=5; norms (1,2,4,8) | ℓ=4, k=3; product 64 = 4²·4; largest kept 4 ≤ 8 | true |
| 3.3 joint gradient | points 0, 1; d=1; d=0 | det −1; rank 1; rank 0 | true |
| 3.4 one full block | diagonal in ℂ²; n=r=2 hyperplane | block ranks 1, 1; 1, 2 | true |
| 3.5 common minor | X³−2; X²−2 | N(3θ²) = 108; ±2√2 | true |
| 4.1 component map | X²−2 at √2; ℚ[ε], X² at ε; 𝔽₂, 𝔽₃ | inverse √2/4; 2ε nilpotent; derivatives 1, 0, 2 | true |
| 4.2 Proposition 2 | as in the declaration table; X(X−1), XY | J = X(2X−1), J(1,0) = 1, line X=0 removed | true |
| 5.1 central rank | n = 1, 2, 14, 15 | 1, 2, 4, 5; F₄=14, F₅=42 | true |
| 5.2 logarithmic models | n=14, 15 | M=70 (r=4 < 5), 252 | true |
| 5.3 coefficient box | r=0; d=0; C=0; r=d=2 | 1; (2C+1)^r; 1; 12 slots, not 18 | true |
| 5.4 box cardinality | r=1, d=2, C=1; B=3.7; r=2, d=2, C=1 | 27; 7 (a ceiling would give 9); 3¹² = 531441 | true |
| 5.5 classes from boxes | (X²−2)(X²−3); X(X−1); X²; X(X−1), XY | 4 points, 2 classes ≤ 4; 2 factors, 1 class; 0; 1 ≤ 4 | true |
| 5.6 Theorem 2 | H=1, n ≥ 2; nonnormal cubic; n=2, H=3 | N=0 by Minkowski; weight 3 vs 1; N=1 | true; absent from Lean (R01) |

### Suppliers, pins and locators

**Supplier citations checked (29), all present with the cited hypotheses:**

- GenericDoublePointInterpolation, open head (11): §0.1 (count, coefficient coordinates, dimension); §0.3; §1.3 (`firstJetMap`, value projection, derivatives on the kernel, surjectivity through the value kernel); §1.4; §5.1; §5.2 (selected minor, degree ≤ md); §5.3 (integer grid, nonzero maximal minor with r, n ≥ 1, d ≥ 5 and n(r+1) ≤ N(r,d), `genericAffinePrincipalOpen`). README line 74 rightly does not use the integer-only `parameterPullback`.
- GeometryOfNumbersAndQuadraticArithmetic at 465728d (10): §0.1.2 `hermitian_gram_hadamard`; §0.2.1 `saturated_adapted_basis`; §0.2.6 `orthogonal_intersection_basis`; §0.3.3 `primitive_orthogonal_covolume`; §1.1.2 `ordered_product_root_bound` (its zero-based tail n−i.val is the README's one-based n+1−i); §1.1.3–1.1.5; §1.2.7 `exists_successiveMin_witnesses`; §1.5.21 `minkowski_second_upper` (explicit Haar measure, symmetric body).
- SchemeAndStackFoundations on main (2): §0.10 `jacobian_etale_algebra` (line 900); §5.12 `bezout_inequality` (line 7338).
- ArithmeticStatisticsPartI (6): §0.7, as above.

**Pinned declarations (38).** I grepped 35 Mathlib names at 6b7abb3c and 3 Tau Ceti names at a91d3aaf. Files and statements match the README, including:

- `eq_zero_of_eval_zero_at_prod_finset` needs `degreeOf i < #S i` (the README goes from total degree to variable degree);
- `covolume_integerLattice` equals (2⁻¹)^{r₂}·√|disc|;
- `rootDiscr` equals |disc|^{(finrank)⁻¹};
- `Algebra.Etale.iff_exists_algEquiv_prod` is at `Mathlib/RingTheory/Etale/Field.lean:271`;
- `AddSubmonoid.ker_saturated` is in the `AddSubmonoid` namespace;
- `covolume_div_covolume_eq_relIndex'` assumes both lattices are full in E;
- `ZLattice.covolume_sq_eq_det_gram`, `NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le` and `NumberField.hermiteCountBound` are present in Tau Ceti.

**Gap `isolated-affine-bezout`.** The same slug appears in `design/plan.json` `gaps` and at README line 82. The supplier section exists on main. The needs sentence is precise. Neither pin has an intersection-theoretic Bézout, and SaSF §5.12 states only the two-subscheme inequality, so the gap does not ask for anything already provided.

**Locators.** I read all 43 COU20 locator mentions and the reference list against the cached text: one is wrong (R02). The others match line and printed page, including Proposition 1 (line 161, p.490), the maximal-minor grid (line 242), the Gram computation (lines 278–290), the n−1 truncation (lines 330–341), Proposition 2 (line 354, p.495) and the §4 parameter choice (lines 385–416).

**Policy.** No pull-request numbers or process words appear in the README or the docstrings. The file uses `theorem` throughout, a single `import Mathlib`, and no `set_option`, `#eval` or `True`. Every one of the 26 targets has a locator. The diff touches only `packages/EffectiveBoundsPartII/`.

**Counts.** Declarations read: 9. Targets read: 26. Locators verified: 43 (one wrong). Checks tested: 98 (all read, every numeric value recomputed, none false). Sibling citations checked: 29. Pinned declarations checked: 38.

## Not verifiable

- Lean elaboration of `Suggested.lean` and of the R01 statement: the board checkout has no Lean environment, so neither was built. The package report records a successful `#check` pass. Binder hygiene was checked by reading.
- Alexander–Hirschowitz well-poisedness for d ≥ 5 is consumed through GenericDoublePointInterpolation §§4.8 and 5.3. I did not re-verify it.
- COU20 inequality glyphs: the extraction renders "at least" as ">". Line 124 shows this, since it reads ‖x‖ > 1 for nonzero integers, which is false at x = 1. I therefore read lines 36–37, 172 and 355 as n ≥ Q, H ≥ 1, d ≥ 5 and r ≥ 1. I did not inspect the PDF glyphs. The README's H ≥ 1 is true either way, because Nₙ(1) = 0 for n ≥ 2.
- Ownership against open pull requests whose files the brief did not supply was not checked. For example, SuccessiveMinima (open PR #1298, seen only by title) overlaps GeometryOfNumbersAndQuadraticArithmetic Layer 1, which this roadmap cites.

## Source issues

- **Misprint** in COU20 at §3, printed p.494 (line 324): the source calls the set of vectors of norm at most one in the real span of the relation lattice a sphere; it should be the closed unit ball, since a sphere has volume zero; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "06884a9", "job": "RT-EffectiveBoundsPartII~1b", "model": "opus", "worker": "fable-rt24"} -->
