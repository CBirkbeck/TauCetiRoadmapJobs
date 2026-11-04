<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1411#issuecomment-6395251570 -->
Red team round 2 pass b (claude) of 2ceb0e0

Verdict: accepted

1. **F01** (P3) §5.5 *Needs* omits the étaleness input used for arbitrary box systems

   **Location.** `packages/EffectiveBoundsPartII/README.md:741`: "*Needs:* §5.4; §4.1; TauCetiRoadmap.SchemeAndStackFoundations §5.12 and the isolated-affine-point contract; …".

   **Claim.** The proof route (`README.md:729`) applies the finite-étale classification to A_E for every E ∈ Box(r,d,C) with r, d ≥ 1. The only source of étaleness this *Needs* line cites is §4.1. But §4.1's statement (`README.md:546–548`) covers only the system selected in §3.5, under r ≥ 1, d ≥ 5 and M ≥ n(r+1).

   **Witness.** E = X(X−1) in Box(1,2,1) (Check at `README.md:734`) has d = 2 < 5 and is no §3.5 selection. Its étaleness is SchemeAndStackFoundations §0.10 `jacobian_etale_algebra` (main, line 900), cited for §4.1 (`README.md:580`) but not here.

   **Repair.** In `README.md:741`, after "§4.1;", insert: "TauCetiRoadmap.SchemeAndStackFoundations §0.10, `jacobian_etale_algebra` over ℚ, for every system of the box;".

   Tested on E = X(X−1):

   - §0.10 makes A_E étale.
   - A_E ≅ ℚ×ℚ: two factors, two geometric points, one class.
   - 1 ≤ 54, which agrees with the Check at line 734.

   The dependency check is unaffected: SchemeAndStackFoundations is already a supplier.

## Round-1 findings at this head

### r1b F01 (P2), Couveignes's Theorem 2 missing from the acceptance test: repaired

`packages/EffectiveBoundsPartII/Suggested.lean:163–171`: "theorem discriminant_field_class_bound : ∃ Q : ℝ, 3 ≤ Q ∧ ∀ (n H m : ℕ), Q < (n : ℝ) → 1 ≤ H → ∀ (K : Fin m → Type*) … Pairwise (fun i j => ¬ Nonempty (K i ≃ₐ[ℚ] K j)) → (m : ℝ) ≤ …".

The repair used a different form from the one r1b suggested. r1b proposed a covering family of subfields of ℚ̄. The head states instead that every finite family of pairwise nonisomorphic fields has at most the bound many members. The two forms are equivalent:

- Distinct members of such a family lie in distinct classes, so m ≤ Nₙ(H).
- In the other direction, the sublevel is finite by `NumberField.finite_of_discr_bdd`. One representative per class, lifted to the declaration's universe, is a family of size Nₙ(H).

Faithfulness checks:

- **Source.** COU20 lines 35–38 (Theorem 2, p.488) count isomorphism classes of degree-n fields with discriminant at most H, with one constant Q, for n at least Q and H at least 1. The extraction prints "at least" as ">". Line 124 shows this: it reads strictly greater than 1 for nonzero integers, which is false at 1.
- **Q ≥ 3 and n > Q.** Taking Q ≥ 3 and requiring n > Q only enlarges the constant. For n ≥ 4 and H ≥ 1 both bases are ≥ 1, so a larger Q never lowers the right-hand side.
- **Quantifier order.** The elaborated type has Q chosen before n, H, m and the family, exactly as README §5.6 (line 745) says.

Instances computed:

- n=2, H=3. The quadratic discriminants with absolute value ≤ 12 are −3, −4, 5, −7, 8, −8, −11 and 12. Only ℚ(√−3) has |disc| ≤ 3, so the largest admissible family has m = 1.
- H=1, n ≥ 2. Minkowski's bound forces m = 0.
- Nonnormal cubic. Its three embedded copies in ℚ̄ are pairwise isomorphic, so a family may contain at most one of them: weight 1, not 3.

Elaboration of a scratch copy exits 0 (see Verified sound).

### r1a F01 (P2), both counting theorems statable at the pins: repaired

`Suggested.lean:148–156`: "theorem bounded_systems_field_class_bound (r d C m : ℕ) (hr : 1 ≤ r) (hd : 1 ≤ d) (K : Fin m → Type*) … ∃ φ : JacobianOpenAlgebra E →ₐ[ℚ] K i, Function.Surjective φ) : m ≤ (2 * C + 1) ^ (r * (d + r).choose d) * d ^ r".

The statement is true, assuming the declared gap:

- A_E is étale over ℚ (SchemeAndStackFoundations §0.10), so it is a finite product of finite separable fields.
- A surjection onto a field K i has a maximal kernel, so K i is isomorphic to one factor.
- The number of factors is at most the dimension of A_E over ℚ. That dimension is the number of points of V(E) over ℚ̄ where J ≠ 0. These points are isolated, of multiplicity one, so there are at most d^r of them (gap `isolated-affine-bezout`).
- The box has (2C+1)^{rM} systems. Pairwise nonisomorphic fields give distinct classes.

Instances computed:

| System | Box (r, d, C) | Fields and classes | Bound |
|---|---|---|---|
| X⁴−5X²+6 | (1, 4, 6), M = 5 | ℚ(√2) and ℚ(√3): two classes, m = 2 | 13⁵·4 = 1485172 |
| X²−X | (1, 2, 1) | m = 1 | 3³·2 = 54 |
| C = 0 | r ≥ 1 | J = 0, A_E = 0, m = 0 | — |

Unused hypotheses (P3 note, not raised). The statement also holds without `hr` and `hd`:

- r=0: the empty system gives A_E = ℚ, so m ≤ 1 = (2C+1)⁰·d⁰.
- d=0 with r ≥ 1: every Eⱼ is constant, so J = 0, A_E = 0 and m = 0 = (2C+1)^r·0^r.

The README keeps r, d ≥ 1 because the gap contract is stated with r, d ≥ 1.

### r1b F02 (P3), §5.2 locator on a running head: repaired

`README.md:657`: "(COU20 line 20, Theorem 1, p. 487; proved at lines 381–425, §4, pp. 495–496)".

Witness:

- COU20 line 20 is the heading of Theorem 1 on printed p.487.
- Line 381 is the §4 heading on p.495.
- Line 425 is the sentence that closes the proof of Theorem 1, on p.496.

The worked example at `README.md:784` now cites "lines 421–430, §4, p.496". Lines 421–430 are the closing estimates and the isolated-point remark, all on p.496. The old running-head locator (line 420) no longer occurs.

### r1b F03 (P3), "phi" replaced by φ inside words: repaired

- `grep -cE '[A-Za-z]φ|φ[A-Za-z]'` on the README gives 0.
- The standalone φ for the component map remains on lines 548, 557, 560, 561, 578 and 604.
- "isomorphism" now occurs on 20 lines.
- A search for any Greek letter inside a Latin word (`[A-Za-z]+[α-ω][A-Za-z]+`) finds no other corruption.

### Defects introduced by the repair

None found. I reread every changed passage of the diff from 06884a9 to 2ceb0e0:

- the summary;
- Scope and ownership;
- the Mathlib contract for `finite_of_discr_bdd`;
- the ArithmeticStatisticsPartI contract;
- the build overview (line 92);
- §1.3 and §3.5 remarks, §4.1 definitions, the §4.2 predicate;
- the new text and Checks of §5.5–5.6;
- Downstream consumers;
- the worked-example locator;
- the module docstring;
- both new declarations.

The one finding below predates the repair.

## Verified sound

### Dependency check

```
moved: EffectiveBoundsPartII moved in the merge order from #99 to #123, right after its last supplier ArithmeticStatisticsPartI; checked as moved (the worker moves it there when it submits)
depcheck: 49 roadmaps, 557 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The `moved:` line comes from the ArithmeticStatisticsPartI citation: that roadmap is at ORDER.txt line 124 and this one at line 100. Under the brief this is not a defect.

The repair report quotes this output without the `moved:` line. That is a slip in the report, not in the package.

### Elaboration and binder pass

The board checkout has no Lake environment. I elaborated a scratch copy of `Suggested.lean` instead:

- Toolchain: the pinned v4.35.0-rc3.
- Libraries: the prebuilt oleans of Mathlib 6b7abb3c and Tau Ceti a91d3aaf on the search path. This is equivalent to `lake env lean`; nothing was built.
- Checks added: `#check @name` for all 11 declarations.

Result: exit 0, six `sorry` warnings (lines 28, 39, 112, 132, 148, 163), no other message.

Binder comparison:

- The file has no `variable` or `include`, so no section binder can be lost.
- The four field-dependent declarations keep `[Field K] [NumberField K]`.
- Both counting theorems keep the instance families `[∀ i, Field (K i)] [∀ i, NumberField (K i)]` over `K : Fin m → Type u_1`.
- `discriminant_field_class_bound` and `exists_logarithmic_small_models` put Q before every other binder.
- `JacobianOpenAlgebra E : Type`.

Every elaborated type matches its README statement in hypotheses and generality. Nothing changed relative to the repair report's own pass.

### Suggested.lean declarations

| Declaration (line) | Context | Instances tried | Values on each side | Result |
|---|---|---|---|---|
| `exists_short_integral_basis` (28) | K, Field, NumberField | ℚ; ℚ(i); ℚ(√5) | house 1 ≤ δ²=1; 1,1 ≤ 4; 1, 2.236 ≤ 5 (ℤ-index 2) | true, COU20 line 161 |
| `exists_bounded_first_jet_generators` (39) | K, r, d, r≥1, d≥5, n(r+1)≤M | ℚ, r=1, d=5; ℚ(√2), r=1, d=5 | M=6≥2, u ≤ D=10, κ=0, jet matrix on (1,X) is I₂; M=6≥4, D=20, house bound n²d(r+1)δ² = 4·5·2·8 = 320 | true, COU20 lines 242–248 |
| `jacobianPolynomial` (65) | {r}, E | (X,Y); (Y,X); X²−2 at 3 | det 1; det −1; 2X ↦ 6 (not E(3)=7) | real body |
| `JacobianOpenAlgebra` (72) | {r}, E | X²−2; X²; X⁴−5X²+6 | ℚ(√2); 0 (2X nilpotent); J=2X(2X²−5) = ∓2√2, ±2√3 at the roots, so ℚ(√2)×ℚ(√3) | real body |
| `HasBoundedModel` (81) | K, Field, NumberField, r, d, H:ℝ | ℚ(√2), E=X²−2, κ=√2, H=2 | degree 2 ≤ 5, coefficients ≤ 2, E(κ)=0, J(κ)=2√2, φ(X)=√2, φ(J⁻¹)=√2/4 | satisfied; the étale and onto clauses are implied by φ (not a defect) |
| `explicitCoefficientBound` (103) | n, r, d, δ | (1,1,5,1); δ=2; (0,1,5,1) | 13693063.94; ratio 1024 = 2¹⁰; 0 (6/0 = 0, 0⁵ = 0) | matches README line 34 |
| `exists_explicit_small_model` (112) | as layer 1 | ℚ, E=X; ℚ(√2), E=X²−2 | 1 ≤ 1.369·10⁷; 2 ≤ B(2,1,5,√8) ≈ 3.29·10¹³ | true, COU20 line 354 |
| `centralBinomialRank` (126) | n | n = 0, 1, 2, 3, 14, 15, 65536 | 1, 1, 2, 3, 4, 5, 12; r ≥ 5 iff n > 14 (checked n < 2000); r ≤ 3 log n for 2 ≤ n < 200000 | matches §5.1 |
| `exists_logarithmic_small_models` (132) | ∃Q before K | n=15 | r=5, M=252 ∈ [90, 360], log of Prop 2 bound = 90.05 + 10 log δ | true, COU20 lines 20–28, 385–425 |
| `bounded_systems_field_class_bound` (148) | r, d, C, m; r, d ≥ 1; family; hsep; hmodels | X⁴−5X²+6; X²−X; C=0 | 2 ≤ 1485172; 1 ≤ 54; m=0 | true, given the declared gap |
| `discriminant_field_class_bound` (163) | ∃Q before n, H, m, family | n=2, H=3 (outside range); H=1; nonnormal cubic | m ≤ 1 = N₂(3); m = 0; weight 1 | true, COU20 lines 35–38 |

**Padding probe.** No declaration follows by one tactic or one library lemma, restates a definition, mirrors a Check or computes a value. Each of the five definitions is used by a stated theorem.

**Headline theorems.** The README names six:

- Proposition 1 (§0.5);
- bounded first jets (§1.2);
- Proposition 2 (§4.2);
- Theorem 1 (§5.2);
- the bounded-system class count (§5.5);
- Theorem 2 (§5.6).

All six are stated, none through a stand-in. The module docstring correctly says that all are statable.

### README targets (26)

| Target | Instances | Computed values | Result |
|---|---|---|---|
| 0.1 canonical measure | ℚ; ℚ(i); z=1 | 2 vs 1; 2π vs π; gauge 1, g-norm √2; body volume 2^{r₁}(2π)^{r₂} ≥ 2ⁿ | true |
| 0.2 covolume | ℚ(i), β=(1,i); ℚ(√5) | Gram diag(2,2), det 4, covolume 2 = 2¹·(2⁻¹·√4); disc(1,√5)=20 vs 5 | true |
| 0.3 half-family | n=4, 5 | m=3; exponents 4/(2·2)=1 and 5/6 | true |
| 0.4 product span | V=ℚ in quadratic; k³×0 ⊂ k⁴ | span dim 1 at 2m=n; ideal closed under products | true |
| 0.5 Proposition 1 | ℚ(√5) | houses 1, √5 ≤ 5 | true |
| 1.1 parameters | α=(1,√5); α=(1,1) | det −2√5; det 0 | true |
| 1.2 first jets | ∏_{j<D}(T−j); 7 collinear points, d=5 | value D! at T=D; rank 6+5 = 11 < 21 | true |
| 1.3 value descent | κ=√5 | ℚ-rank 2, ℤ-index 2 | true |
| 2.1 relation lattice | κ=√2, d=3 | basis (−2,0,1,0), (0,−2,0,1), rank 2 = 4−2 | true |
| 2.2 transpose index | κ=√5, d=2 | L⊥ = ⟨(1,0,5),(0,1,0)⟩, S = ⟨(1,−1,5),(0,2,0)⟩, index det[[1,−1],[0,2]] = 2 = [𝓞:ℤ[√5]] | true |
| 2.3 Gram–discriminant | ℚ(√5), d=2; ℚ(i), κ=i | BBᵗ = [[27,−2],[−2,4]], det 104; VV* = [[31,21],[21,31]], det 520 = 5·104; VV* = diag(2,2) but VVᵗ = [[0,2],[2,0]], det −4 | true |
| 2.4 monomial heights | n=2, r=1, d=5 | D=20, C₀=40δ², H₀=40⁵δ¹⁰, G=6·40¹⁰δ²⁰ | true |
| 2.5 relation covolume | κ=√5, d=2 | √26 ≤ √(520/5) = 2√26 | true |
| 3.1 short relations | ℓ=1, 2 | ball volume ≥ 2; inscribed square area 2 ≤ π | true |
| 3.2 truncation | norms (1,2,4,8), G=4 | product 64 = 4²·4; retained max 4 ≤ 4·2 = 8; k ≥ n(r−1)+1 | true |
| 3.3 joint gradient | points 0, 1 | X²−X, X³−X² give columns (−1,1), (0,1), det −1 | true |
| 3.4 full block | hyperplane x₁=0 in ℂ⁴, n=r=2 | codimension 1, block ranks 1, 2 | true |
| 3.5 common minor | X³−2 | N(3θ²) = 27·4 = 108, moduli 3·2^{2/3} | true |
| 4.1 component map | X²−2 at √2; ε in ℚ[ε]/(ε²) | (2√2)(√2/4) = 1; 2ε ≠ 0 but (2ε)² = 0 | true |
| 4.2 Proposition 2 | X²−X, XY | J = X(2X−1), J(1,0) = 1, line X=0 removed (X idempotent, J ≡ X) | true |
| 5.1 central rank | n=1, 2, 14, 15 | 1, 2, 4, 5; F₄=14, F₅=42; C(2r,r) ≤ 4n(r+1) checked for n < 5000 | true |
| 5.2 logarithmic models | n=14, 15 | M=70 (r=4 < 5), M=252 | true |
| 5.3 coefficient box | r=d=2 | 6 monomials, 12 slots (not 18) | true |
| 5.4 box cardinality | B=3.7; r=1, d=2, C=1 | 7 choices; 27 | true |
| 5.5 classes from boxes | X⁴−5X²+6; X²−X; X² | 2 ≤ 1485172; 1 ≤ 54; 0 | true |
| 5.6 Theorem 2 | H=1; n=2, H=3 | N=0; N=1 (ℚ(√−3) only) | true |

All 100 Checks were read. I recomputed every numerical one, including the four new or expanded Checks of §§5.5–5.6; none is false or vacuous. Each definition has at least three discriminating Checks (§4.1 has 9, §4.2 has 6, §5.1 has 4). The worked examples agree with their sections.

The proof route of §5.6 is consistent:

- rM = O(n log²n) and log(3B) = O(log²n + (log n/n)·log H);
- so the logarithm of the bound is O(n log⁴n + log³n·log H);
- 2C+1 ≤ 3B holds for B ≥ 1.

### Suppliers, pins and locators

**Supplier citations re-resolved this round (30).**

- GenericDoublePointInterpolation, at the brief's head:
  - §0.1: count at line 243, coefficient coordinates at line 271;
  - §0.3: metric at line 324;
  - §1.3: `firstJetMap` at line 447, value projection, derivatives on the value kernel, surjectivity through the kernel;
  - §1.4;
  - §5.1: universal matrix;
  - §5.2: selected minor of degree ≤ md;
  - §5.3: integer grid, nonzero maximal minor for r, n ≥ 1, d ≥ 5, `genericAffinePrincipalOpen`. The README rightly avoids the integer-coefficient `parameterPullback`.
- GeometryOfNumbersAndQuadraticArithmetic, open head, read through `roadmaps show`:
  - `hermitian_gram_hadamard` at line 252;
  - `saturated_adapted_basis` at line 283;
  - `orthogonal_intersection_basis` at line 333;
  - `primitive_orthogonal_covolume` at line 383;
  - `ordered_product_root_bound` at line 417, with zero-based tail n−i.val, the README's one-based n+1−i;
  - `orthonormal_cube_volume`, `inscribed_cube`, `intrinsic_ball_lower_bound` at lines 426, 435, 444;
  - `exists_successiveMin_witnesses` at line 532;
  - `minkowski_second_upper` at line 886.
- SchemeAndStackFoundations on main: §0.10 `jacobian_etale_algebra` (line 900); §5.12 `bezout_inequality` (line 7338).
- ArithmeticStatisticsPartI, open head 3b1a24f: §0.7 at line 1299 with the anchor at line 1301; `NumberFieldFamily.Embedded`, `isoSetoid`, `isoFamily`, `isoDegree` at lines 1307–1317; the neighbouring embedded/class count with weight n/#Aut at line 1339.
- Completed/EffectiveBounds: Layers 1 and 2 at lines 105 and 125.

**Pinned declarations (35).** All are at Mathlib 6b7abb3c or Tau Ceti a91d3aaf, read from the pinned checkouts:

- `NumberField.discr_ne_zero` and `discr_eq_discr_of_algEquiv` (Defs.lean:41, 50);
- `rootDiscr` (Basic.lean:77), `mixedEmbedding.covolume_integerLattice` (Basic.lean:124), `finite_of_discr_bdd` (Basic.lean:494);
- `house`, `house_eq_sup'`, `house_sum_le_sum_house`, `house_mul_le`, `house_intCast`, `one_le_house_of_isIntegral` (House.lean:38–93);
- `canonicalEmbedding.norm_le_iff` (line 79), `mixedEmbedding.finrank` (line 212), `latticeBasis` (line 637);
- `restrictTotalDegree`, `mem_restrictTotalDegree`, `basisRestrictSupport`;
- `eq_zero_of_eval_zero_at_prod_finset` (degreeOf i < #S i, IsDomain);
- `discr_not_zero_of_basis`, `discr_eq_det_embeddingsMatrixReindex_pow_two`;
- `covolume_eq_det_mul_measureReal`, `covolume_div_covolume_eq_relIndex'` (both lattices IsZLattice in E);
- `Algebra.Etale.iff_exists_algEquiv_prod` (Field.lean:271, finite index set);
- `AddSubmonoid.ker_saturated` (IsAddTorsionFree target);
- the central-binomial and Catalan lemmas;
- in Tau Ceti: `ncard_setOf_finiteDimensional_abs_discr_le_le` (line 172), `hermiteCountBound` (line 202), `ZLattice.covolume_sq_eq_det_gram` (line 42).

**Gap `isolated-affine-bezout`.**

- The slug, supplier and section are the same in `design/plan.json` and in README line 82.
- It is precise. Both of its clauses (the multiplicity sum at isolated points, and multiplicity one where J is invertible) are consumed by §5.5's point count.
- It is not provided at the pins. SchemeAndStackFoundations §5.12 gives only the equidimensional two-subscheme inequality.
- No roadmap states it: `roadmaps grep` for refined or isolated-point Bézout finds only ArithmeticStatisticsPartV's generic-fibre bound, which is a different statement and comes later in the order.

**Locators.** I read all 38 "COU20 line(s) N" mentions, the continuation locators 381–425 and 421–430, and the References list against the cached text (COU20 lines 1–496). Each line and printed page agrees; spot checks:

- line 104 (p.489), 127 and 161 (p.490), 195 (p.491), 207 and 242 (p.492);
- lines 255, 259, 269, 278–284 and 291 (p.493);
- lines 303–351 (p.494), 354–385 (p.495), 421–430 (p.496).

### Policy and ownership

- The diff against origin/main touches only `packages/EffectiveBoundsPartII/`.
- No pull-request number or process wording appears in the README or the docstrings.
- The Lean file uses `theorem` throughout, a single `import Mathlib`, no `set_option`, `#eval` or `True`, and no sorry'd data. It is 174 lines.
- All 11 Lean names appear backticked in the README, and every backticked own name is declared.
- Every one of the 26 targets has a locator.
- No machine path appears.

Ownership:

- `roadmaps grep` over main and all indexed open heads finds no other owner of Couveignes's count or models. Searches: "couveignes"; the cubic-logarithmic exponent; Lemke Oliver, Ellenberg–Venkatesh and Schmidt counts.
- The class quotient is imported from ArithmeticStatisticsPartI and not rebuilt. No Lean name collides with a readable roadmap.

**Counts.** Declarations read: 11. Targets read: 26. Locators verified: 38 mentions plus 3 continuation or reference locators (31 distinct source lines). Checks tested: 100. Sibling citations checked: 30. Pinned declarations checked: 35.

## Not verifiable

- **Lean elaboration method.** Elaboration used the pinned toolchain and prebuilt pinned oleans, run on a scratch copy outside the board checkout. `lake env lean` inside the board checkout was not possible, because that checkout has no Lake environment.
- **Overlapping design EffectiveBoundsCompactModels.** The board carries this design, with no package and no `Suggested.lean`. It is at merge order line 101 and plans the same Couveignes argument. This package's design README (line 61) identifies it with this Part II's scope. Which roadmap owns the argument is a maintainer decision about the two designs, and is not raised here. After the `moved:` relocation, that design would precede this roadmap in the order.
- **Fulton chapter cited by COU20.** COU20 line 429 cites Fulton's book, Chapter 13, for the bound on isolated points; the refined Bézout theorem may sit in Chapter 12 (§12.3). I could not read a legal copy or table of contents (the publisher page requires a login), so this is not recorded as a source issue.
- **Ownership against open pull requests without supplied files.** This was checked only through the index search, not by reading their folders.
- **Alexander–Hirschowitz well-poisedness.** It is consumed through GenericDoublePointInterpolation §§4.8 and 5.3. I did not re-derive it.

## Source issues

- **Misprint** in COU20 at §3, printed p.493 (line 266): the source extends the integral relation lattice to the reals by a tensor product over ℚ; it should be over ℤ (the lattice is a ℤ-module); affects nothing.
- **Misprint** in COU20 at §3, printed p.494 (line 324): the source calls the set of vectors of norm at most one in the real span of the relation lattice a sphere; it should be the closed unit ball (a sphere has volume zero); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2ceb0e0", "job": "RT-EffectiveBoundsPartII~2b", "model": "opus", "worker": "fable-rt26"} -->
