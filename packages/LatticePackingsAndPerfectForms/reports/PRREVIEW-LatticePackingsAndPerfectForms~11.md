# Review of LatticePackingsAndPerfectForms (pull request #1723 at 8cc4a64)

**Verdict:** needs changes

This is a full review of the whole folder. The head is the same one the previous review read, so its two findings stand. This review also finds seven new ones, all P3. The new findings are R03–R09, and two of them (R03, R05) are source-locator defects in seeded targets.

## R01 (P2) — 23 Tau Ceti declarations the README cites "at the pin" are absent at the branch's pin; merge main

Re-raised: R01 of the previous four reviews. No repair report was available to this review, so no "not actionable" reason is on record.

**Location:**
- `lake-manifest.json` pins Tau Ceti `358314d` (unchanged).
- README 80, 87–107, 135–139: "**From Tau Ceti at the pin**".
- The supplier table, rows 351–353 and 356–359.
- The Needs lines of 1.6, 1.9, 3.4, 4.11, 5.7, 6.4, 7.2 and 7.5.

**Claim:** these lines say Tau Ceti supplies these declarations at the pin. At the pin the branch records, 23 of them do not exist. The previous review counted 15; there are 8 more.

**Witness:** a multiline declaration grep of both package trees finds each of the 23 names at main's pin `2fd255d` and none of them at `358314d`:
- the nine Leech names (`Rank24/Leech/Basic.lean:236`, `Minimum.lean`, `MinimalVectors.lean`);
- `IsMinkowskiReduced` (`PosDef/Reduction.lean:80`) and its five lemmas: `IsPosSemidef.exists_isMinkowskiReduced`, `monotone_integralNorm` (:112), `two_mul_abs_integralForm_le` (:123), `integralNorm_le_factorial_sq_mul_successiveMinimum` (:323) and `prod_integralNorm_mul_pi_pow_le` (`ReducedGram.lean:68`);
- `IsPosDef.minimum_le_mul_determinant_rpow` (`PosDef/Minkowski.lean`);
- `kissingNumber_typeE₈RootLattice` (`TypeE/Roots.lean:119`);
- `ofGramMatrix_singleton_eq_rankOne` (`RankOne/Basic.lean:118`);
- `ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume` (`GeometryOfNumbers/MinkowskiSecond.lean:626`);
- `checkerboardPlusLattice` (`TypeD/Plus.lean:160`);
- the three bad-prime newform coefficients `HeckeRing.GL2.Newform.{qExpansion_coeff_prime_sq_of_factorization_eq_one, norm_qExpansion_coeff_prime_of_factorization_conductor_eq, qExpansion_coeff_prime_eq_zero_of_factorization_conductor_lt}` (`Newforms/BadPrime/Classification.lean`).

**Repair:** merge `origin/main` into the branch.
- `git merge-tree --write-tree origin/main HEAD` exits 0 at main `3090489`; the branch is 361 commits behind.
- The diff against main stays confined to the folder, and no README line has to change.
- Then apply R02.

This review did not re-run the elaboration at main's pins, because that is outside the Lean commands it may run. The previous review reports it passes (exit 0, 53 `sorry` warnings with R02's theorem added).

## R02 (P3) — The Leech covering radius docstring is accurate only at the stale pin; after R01 the headline must be stated

Re-raised: R02 of the previous review.

**Location:** `Suggested.lean` 31–38: "is not stated: its carrier, Tau Ceti's `TauCeti.leechLattice` … is absent from the Tau Ceti revision this file is elaborated against. With that module the headline reads …".

**Claim:** the sentence contradicts README 135 and the 3.4 Needs line, which cite the same carrier "at the pin". It also writes the headline inside a docstring instead of stating it. After R01's merge the carrier exists and the sentence is false.

**Witness:** `Rank24/Leech/Basic.lean:236` defines `leechLattice : IntegralLattice (Fin 24 → ℚ)` at `2fd255d`; `isPosDef_leechLattice` is in the same file. `gramForm` (`Suggested.lean` 451) and `coveringRadius` (278) already exist in this file.

**Repair:** after the merge:
1. Add `import TauCeti.LinearAlgebra.IntegralLattice.Rank24.Leech.Basic`.
2. State, in `section Lattice`:

   ```lean
   /-- **3.4.** The Leech lattice has covering radius `√2` in the real model of the Gram matrix of
   any `ℤ`-basis (Conway–Parker–Sloane; Conway–Sloane, Ch. 23). -/
   theorem coveringRadius_gramForm_leechLattice (b : Basis (Fin 24) ℤ TauCeti.leechLattice) :
       (gramForm TauCeti.isPosDef_leechLattice b).coveringRadius = Real.sqrt 2 := sorry
   ```

3. Delete the docstring text from "The Leech covering radius" to "indexed by `Fin 24`."
4. Name the theorem in the API of README 3.4.

The type was checked at the branch's pin with `TauCeti.leechLattice` replaced by a variable lattice of rank 24 (see *Verified sound*).

## R03 (P3) — 3.4 attributes the complete classification of the Leech Voronoi vertices to Conway–Parker–Sloane, Ch. 23; that chapter classifies only the deep holes

**Location:** README 1015–1019: "the Voronoi vertices are the finitely many Conway–Parker–Sloane hole types in Chapter 23, with every squared radius at most 2 and at least one equal to 2". The References entry (2036) lists Ch. 23 only.

**Claim:** Ch. 23 proves that the covering radius is `√2` and classifies the 23 deep holes, whose squared radius is exactly 2. The vertices of squared radius below 2 are the 284 shallow-hole types of Borcherds–Conway–Queen, Ch. 25. So "every squared radius at most 2" and "completeness of those types" cite the wrong chapter.

**Witness:** leechholesk3 (Shimada, arXiv:1502.02099v3), a secondary source that cites both chapters:
- line 234: the maximal radius `√2` is the main result of Conway–Sloane Ch. 23;
- line 290: the classification of the deep holes is in Ch. 23;
- line 297: the classification of the shallow holes is in Ch. 25;
- lines 305–306 (Theorem 2.5): exactly 23 classes of deep holes and 284 classes of shallow holes.

**Repair:**
- In 3.4, replace the quoted clause with "the Voronoi vertices are, up to lattice translations and isometries, the 23 deep-hole types of Conway–Parker–Sloane (Conway–Sloane, Ch. 23), of squared radius 2, and the 284 shallow-hole types of Borcherds–Conway–Queen (Conway–Sloane, Ch. 25), of squared radius below 2".
- Add "Ch. 25 (shallow holes of the Leech lattice)" to the Conway–Sloane reference.

## R04 (P3) — GoN 4.5.8 no longer owns Mahler's compactness theorem; cite ProbabilisticAndMetricNumberTheory §4.9b

**Location:**
- README 133: "`mahler_compactness` (4.5.8, …)".
- README 298: "4.5.8 Mahler's compactness theorem".
- 2.2 (853, 862, 870), 4.7 (1227, 1240), the dependency rows 906 and 1390, and the ordering paragraph 2027.

**Claim:** at GeometryOfNumbersAndQuadraticArithmetic's open head (`3b084ef`), §4.5.8 no longer proves the theorem. It says `mahler_compactness` and `mahler_relativelyCompact_iff` are ProbabilisticAndMetricNumberTheory §4.9b's. That owner states the criterion with the max-norm first minimum. The README consumes it from GoN, as if GoN owned it.

**Witness:**
- GoN at `3b084ef`, §4.5.8: "`mahler_compactness` and `mahler_relativelyCompact_iff` are ProbabilisticAndMetricNumberTheory §4.9b `mahler_relativelyCompact_iff` …", with a √n comparison between the two norms.
- ProbabilisticAndMetricNumberTheory at `d311ebe`, §4.9b ("The modular lattice and Mahler's criterion"): "Prove `mahler_relativelyCompact_iff`" for `SL_n(ℝ)/SL_n(ℤ)`, first minimum in the max norm.

**Repair:**
- Cite "ProbabilisticAndMetricNumberTheory §4.9b `mahler_relativelyCompact_iff` (max-norm first minimum; the Euclidean first minimum differs by at most a factor `√n`)" in 2.2, 4.7, the scope bullet and the dependency rows, and add a supplier bullet for it.
- Keep GoN for 4.4.1, 4.4.2, 4.5.1, 4.5.2, 5.1 and §4.3.
- That roadmap is line 62 of the merge order and this one is line 148, so the edge points downward. Name it in the merge-order paragraph. Re-run the depcheck.

## R05 (P3) — The Venkov page locators belong to the author-hosted version, paginated from 1, not to the published pages 10–86 the reference names

**Location:** README 1142 (§6, pp.20–21), 1544 (Theorem 16.1, p.59), 1575 (Theorem 16.4, p.61, (16.6), p.62), 1598 (Remark 16.5, p.61) and References 2049–2051 ("Monogr. Enseign. Math. 37 (2001), 10–86").

**Claim:** the theorem numbers and the pages agree with the version these locators were read in. That version is the notes by J. Martinet hosted on his page, and its pages are numbered from 1. An article printed on pp. 10–86 cannot have its §1 on p.5. So the page numbers do not point into the cited publication.

**Witness:** venkov2001:
- line 2: the file comes from J. Martinet's page;
- line 199: the article's own plan puts §1 at p.5 and §16 at p.58 (line 216);
- running heads: "21" at line 2436, just after Definition 6.1 (line 2427); "59" at line 8177, before Theorem 16.1 (line 8251); "61" at line 8377, before Theorem 16.4 (line 8394); "63" at line 8598, after (16.6) (line 8552).

**Repair:** in References, cite the version read: "B. Venkov, *Réseaux et designs sphériques* (notes by J. Martinet), author-hosted version, pp. 1–79, whose page numbers are used here; published in *Réseaux euclidiens, designs sphériques et formes modulaires*, Monogr. Enseign. Math. 37 (2001)". Alternatively, replace the page numbers with the published ones after checking the printed volume. The section, theorem and equation numbers stay.

## R06 (P3) — Seeded targets 2.3 and 7.5 carry no source locator

**Location:**
- 2.3 (872–895): `γ₂ = (4/3)^{1/2}`, `γ₃ = 2^{1/3}`, and "Gauss's reduction argument", with no locator.
- 7.5 (1915–1916): "Cite Festi–Veniani … for the role of the index", with no section or page. References 2070–2071 give "J. Math. Soc. Japan (2023)" without volume or pages.

**Claim:** both are named results or notions from the literature, and the policy requires a locator at the claim.

**Witness:**
- dsv2007 lines 87–95 (Table 1, p.3): the maximum of `γ` is realized by `A₂` in rank 2 (after Lagrange) and by `A₃` in rank 3 (after Gauss).
- festiveniani (arXiv:2102.09411v2) lines 116–120 (§2.1, p.3): `O♯(L)` is defined as the image of `O(L) → O(L♯)`, with the quadratic form for even `L` and the bilinear form otherwise. That is exactly the split `fvIndex` makes.
- festiveniani line 401 (Theorem 2.8, p.9): the multiplicity formula in which `O♯(W)` sits inside `O(T♯_X)`.

**Repair:**
- In 2.3, add "(Dutour Sikirić–Schürmann–Vallentin, arXiv:math/0609388v3, §1, Table 1, p.3)" after the two values.
- In 7.5, write "(Festi–Veniani, arXiv:2102.09411v2, §2.1, p.3, for `O♯(L)`; Theorem 2.8, p.9, for its role)".
- Cite arXiv:2102.09411v2 in References as the version read.

## R07 (P3) — 1.1 cites `Nat.sInf_mem` for the attainment of a real infimum

**Location:** README 589 and the dependency row 809: "*Needs:* M `ZSpan.setFinite_inter`, `Nat.sInf_mem`".

**Claim:** `min A` is an infimum of real numbers (`Suggested.lean` 179–180). `Nat.sInf_mem` is the statement for `Set ℕ` (`Mathlib/Order/Lattice/Nat.lean:75`) and cannot give the attainment. For `A = [√2]` the values are `√2 k²`, none of them natural numbers.

**Witness:** `Mathlib/Order/Lattice/Nat.lean:75`, `theorem sInf_mem {s : Set ℕ} (h : s.Nonempty) : sInf s ∈ s`.

**Repair:** replace it with `Set.exists_min_image` (`Mathlib/Data/Set/Finite/Lemmas.lean:75`). Apply it to the finite nonempty set `{x ∈ ℤⁿ | x ≠ 0, A[x] ≤ A[e₁]}`, which is finite by `finite_setOf_eval_le`. Make the change in both lines.

## R08 (P3) — The docstring of `IsDeepHole.exists_sub_mem_extremePoints` claims a conclusion the theorem does not state

**Location:** `Suggested.lean` 288–291 and README 971: "…; the covering radius is the largest `√(A[x])` over those vertices."

**Claim:** the Lean conclusion is only `∃ v ∈ stdLattice A, x - v ∈ Set.extremePoints ℝ A.voronoiCell`. The second clause is a corollary that 3.2's prose already states (950). Here the docstring and the README API bullet describe more than the theorem says.

**Witness:** the elaborated type (`#check`, scratch run) has no `coveringRadius` term.

**Repair:** delete the clause after the semicolon from the docstring and from README 971.

## R09 (P3) — "(9)" in 5.3 is an unexplained pointer; give the witness computation

**Location:** README 1463: "`A₃`, which is perfect and strongly eutactic but not a `4`-design (9)."

**Claim:** nothing in the README or the references is numbered 9 in a way that supports the claim. A reader cannot check it from this text.

**Witness:**
- Take the 12 roots `±eᵢ ± eⱼ` of `A₃ = D₃` and `a = e₁`. The fourth moment `∑ ⟪a, x⟫⁴` is `8`.
- 5.2's 4-design value is `3 · 12 · 2² / (3 · 5) = 9.6`.

**Repair:** replace "(9)" with "(at `a = e₁` the fourth moment of its 12 minimal vectors is `8`, while 5.2 requires `3·12·4/15 = 9.6`)".

## Previous findings

- **R01 (P2), stale Tau Ceti pin:** not repaired. The head is unchanged; `lake-manifest.json` still pins `358314d`, and README 135 still reads "**From Tau Ceti at the pin**, the Leech lattice `Λ₂₄` as `TauCeti.leechLattice`". Raised again as R01, with the count corrected from 15 to 23 names.
- **R02 (P3), Leech covering radius:** not repaired. `Suggested.lean` 32–35 still reads "is absent from the Tau Ceti revision this file is elaborated against". Raised again as R02.

## Verified sound

**Gate and dependency check.**
- The worker's gate at 8cc4a64 reports every check 0, including `build=0`.
- Re-run with the brief's default command, it fails only `depcheck: NOT IN ORDER: LatticePackingsAndPerfectForms (insert it after its last supplier)`. That is the default-order report for a roadmap not yet in the order, not a defect. Every other check is 0.
- The dependency check against the candidate merge order prints:

      depcheck: 235 roadmaps, 2262 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line. Suppliers GeometryOfNumbersAndQuadraticArithmetic (line 55) and WeightsInEtaleCohomology (147) precede this roadmap (148). EffectiveDiophantineMethods (178) is cited only as a scope boundary for an algorithm, never as a supplier.
- `git diff --stat origin/main...HEAD` outside the folder is empty.

**Elaboration and signatures.**
- `lake env lean` on `Suggested.lean` exits 0 with 52 warnings, all `declaration uses sorry`.
- A scratch copy with `#check @name` for all 112 declarations elaborates without error. The elaborated types match the README statements.
- The only binder lead is `polynomialsOfDegreeLE`, which declares its own `E` with the two instances its body needs. The dropped `[FiniteDimensional ℝ E]` matters only for the finite-dimensionality theorem of 5.1, which the README states separately.
- Rank-zero junk values checked against the README conventions:
  - `hermite = 0 / 1^0 = 0`, `centerDensity = 0^0/√1 = 1`, `density = 1`, `hermiteConstant 0 = 1`;
  - `IsFacetNormal` uses `n(n+1)/2 − 1 = 0` and `voronoiNeighbour = P` (`ρ = sSup` of an unbounded set, so 0);
  - `IsPerfect` and `IsEutactic` hold vacuously, and `isExtreme_iff` reads `True ↔ True ∧ True`.

**Padding probe.** A scratch copy replaces every `sorry` by `first | rfl | simp | infer_instance | exact?`. All 52 bodies fail, so none closes in one tactic. No declaration restates a definition, mirrors a Check or computes a small value. The R02 shape probe (the Leech statement over a variable rank-24 lattice) elaborates at the branch pin: exit 0, 53 `sorry` warnings.

**Library declarations opened (pins).**
- Mathlib `f6090c7`:
  - `Matrix.PosDef.transpose` (`PosDef.lean:181`), `Matrix.PosDef.inv` (:579), `Int.isUnit_iff` (`Algebra/Group/Int/Units.lean:45`);
  - `ZSpan.setFinite_inter`, `ZSpan.instIsZLatticeRealSpan` (`ZLattice/Basic.lean`), `ZLattice.covolume_eq_det` (`Covolume.lean`);
  - `exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure` (`MeasureTheory/Group/GeometryOfNumbers.lean`);
  - `toSphere_apply_univ`, `measurePreserving_homeomorphUnitSphereProd` (`HaarToSphere.lean`), `LinearIsometryEquiv.measurePreserving` (`Haar/InnerProductSpace.lean:151`);
  - `MvPolynomial.restrictTotalDegree`, `MvPolynomial.homogeneousSubmodule`, `SchwartzMap.fourierTransformCLM`;
  - `CuspForm.rank_eq_zero_of_weight_lt_twelve`, `rank_eq_one_of_weight_eq_twelve`, `discriminantEquiv` (`LevelOne/DimensionFormula.lean`), `Nat.sum_four_squares`;
  - `LinearMap.BilinForm.tensorDistrib` (`BilinearForm/TensorProduct.lean:108`), `Basis.tensorProduct` (`TensorProduct/Basis.lean:37`), `Matrix.det_kronecker`;
  - `abs_sub_round`, `Matrix.det_fromBlocks₁₁`;
  - Mathlib's `E 8` Cartan matrix (`Cartan/Basic.lean:55–103`, Bourbaki order).
  - The Delone-set `coveringRadius` (`AperiodicOrder/Delone/Basic.lean:74`) is a stored witness bound, not the optimal radius, so it does not duplicate `coveringRadius`. No Hermite constant, perfect form, spherical design or Voronoi cell exists at the pin.
- Tau Ceti `358314d`:
  - `exists_isPrimitive_forall_apply_self_le` (`BilinearForm/Hermite.lean:77`), `exists_ne_zero_three_pow_mul_pow_le_four_pow_mul_det` (:230);
  - `IsPosDef.minimum_le_rpow_mul_determinant_rpow` (`PosDef/Hermite.lean:81`), `IsPosSemidef.successiveMinimum_zero` (`SuccessiveMinima.lean:103`);
  - `covolume_range_sq_eq_determinant` (`Covolume.lean:120`), `IsPrimitive.exists_basis` (`Primitive.lean:171`);
  - `isPosDef_ofGramMatrix_iff` (`Signature.lean`), the rank-one discriminant names (`RankOne.lean`), `discriminantBilinearIsometry` (`Discriminant/Bilinear.lean`);
  - `valence_formula_weighted`, `valence_formula_finiteIndex`, `mvPolynomialEquivModularForms`, `forall_heckeTCompositeGamma0_eq_coeff_smul_iff`, `isCompl_cuspFormsOld_cuspFormsNew`.
- Tau Ceti `2fd255d`: the 23 names of R01. Also `integralNorm_le_factorial_sq_mul_successiveMinimum` (`(i!)²` at index `i`, `Reduction.lean:323`) and `prod_integralNorm_mul_pi_pow_le` (`ReducedGram.lean:68`). These match 1.9's description, including the shift to `((i−1)!)²` in one-based indexing.

**Cross-roadmap citations resolved.**
- On main:
  - ThetaSeries: Layer 1 `dual` (line 127), 2A `dual_dual` (128), 2D (515), 2G and `ncard_vectorsOfNorm_ratModel` (545–560), `RealSpace` (`Suggested.lean` 498), 5B, 7C–7D (879–893), 8B (949).
  - IntegralLattices: native labels 0F, 1C–1D, 2C (`From Tau Ceti` table 437, 442, 424), 1G (2704–2716), 4A (1507), 6C (2054), 6D (2076), 9B (2657).
  - SuccessiveMinima: 0.1.2 `hermitian_gram_hadamard` (188), 1.1 (307), 1.5 `exists_successiveMin_witnesses` (488), 2.1.4 `minkowski_second_lower` (658).
  - GlobalQuadraticForms 4.4 (443) and 6.1 (694); ModularForms §0.1 (353); Rank24LatticeConstructions Layer 6 (312).
  - RepresentationTheory/RootSystems and Completed/IntegralLattices exist.
- At open heads:
  - GoN `3b084ef`: 4.4.1 (1718), 4.4.2 (1729), 4.5.1 (1855), 4.5.2 (1865), 5.1.2 (1963), 5.1.4 (1984), and §4.3 `polynomialLaplacian`, `polynomial_fischer_decomposition`, `polynomial_sphere_harmonic_span`, `fourier_harmonic_gaussian` (1534–1550). Its constant `(−i)^ℓ t^{−ℓ−n/2}` agrees with 5.5 at `τ = it`. 4.5.8 is R04.
  - WeightsInEtaleCohomology `9e753f8` §6.1, the Ramanujan bound for newforms of weight `k ≥ 2` (695).
  - EffectiveDiophantineMethods §1.8; QuaternionArithmetic Layer 2; SiegelModularForms Layer 5; OrthogonalTamagawaAndLatticeMass Layer 4.

**Ownership.** `overlaps.md` lists no open pull request that changes this roadmap and no dropped id. `roadmaps grep` over main and the open heads covered Hermite constant, perfect form, eutactic, spherical design, covering radius, Voronoi cell, 290 theorem, 15 theorem, Festi, Kitaoka and kissing number. Every hit outside this roadmap is a consumer or a different object: GoN owns `latticeCoveringRadius`, which 3.3 consumes; NumberFieldEnumeration's "Hermite hypothesis" is an admissible constant, not `γₙ`; ExplicitNumberFields, ArithmeticKTheory and SubspaceTheorem use covering radii of other lattices; PointProcesses' Voronoi cells belong to point processes; SiegelModularForms names designs only as a boundary; the kissing number in IntegralLattices and ThetaSeries is Tau Ceti's, consumed here. No second owner was found. No declaration of `Suggested.lean` reuses a fully qualified name of another roadmap.

**Seeded sample (15 targets).**
- 0.5: TS Layer 1 `dual` and 2A resolve; no source locator is needed.
- 1.3: elementary; no locator needed.
- 1.8: the Tau Ceti route inputs exist at the pin (above).
- 2.3: no locator (R06).
- 3.3: GoN 4.4.2 and SM 1.5 resolve; Gruber–Lekkerkerker is not verifiable.
- 4.4: venkov2001 lines 2427–2438 (Definition 6.1, p.20; the `ℝ`-irreducible case on p.21). The README's proof is complete without assuming eutaxy, because `QA = cI` with `Q ⪰ 0`, `Q ≠ 0` forces `c > 0`.
- 4.5: ash1977 line 524 (§4 Corollary, printed p.1052); dsv2007 lines 60–71 (p.2).
- 4.7 (on the 4.5 path): ash1977 lines 528–541 (Theorem 3, p.1052), counted on `∂K`, that is up to scaling.
- 5.4: venkov2001 lines 1204–1242 (Theorem 3.2, (1)⇔(3), for `n ≥ 2`). The README also covers `n = 1`, where both sides hold for `X = {±r}`.
- 5.6: venkov2001 line 8251 (Theorem 16.1, p.59): weight `n/2 + deg P`, cuspidal for `deg P > 0`.
- 5.7: venkov2001 lines 8394–8400 (Theorem 16.4, p.61) is stated for the minimal vectors only. The README's all-shell form is in the proof: lines 8584–8604 (p.62) show `Θ_{Λ,P} ≡ 0` for `0 < deg P ≤ t`, so every shell sum vanishes. Remark 16.5 is at line 8401. The pages belong to the hosted version (R05).
- 6.4: bhargavahanke lines 16–20 (Theorem 1, p.1, the same 29 integers as `Suggested.lean` 648–649); 474–480 (§4.2.1, p.6, the `a_E` lower bound with `∏ (p−1)/(p+1)` over `p ∤ N`, `p | m`, `χ(p) = −1`); 499–501 (§4.2.2, p.7, `|a_f(m)| ≤ C_f 2^{ω(m)} τ(m) √m`); 522–533 (§4.2.3, p.7).
- 7.2: coulangeonnebe2012 lines 103–107 (Corollary 2.3, p.3: either rank `≤ 43` and Kitaoka 7.1.1 give split minimal vectors, hence `min = min L₁ · min L₂`); 108–113 (Remark 2.4(1), p.3); Euclidean, not integral, lattices (lines 24, 79–83).
- 7.3: elementary; no locator needed.
- 7.4: IL 1C–1D and 1G resolve, and the Tau Ceti carriers exist.
- 7.5: festiveniani lines 116–120 match the even/odd split (R06 for the locator).
- The README flags no locator as unverified.

**Adversarial pass (computed this round).** Exact values come from a rational-arithmetic script; decimals are floating point.

| Statement | Instances | Values computed on each side | Result |
| --- | --- | --- | --- |
| 0.1 action order | I₂, U = [[1,1],[0,1]], V = Uᵀ | V•(U•I₂) = (UV)ᵀ(UV) = [[5,3],[3,2]]; reverse order [[2,3],[3,5]] | Pass |
| 0.5 contragredient | I₂, U | (U•A)⁻¹ = [[2,−1],[−1,1]] = U⁻ᵀ•A⁻¹; the wrong (U⁻¹)ᵀU⁻¹ = [[1,−1],[−1,2]] | Pass |
| 0.5 sums, duals | [2]⊕[3]; [4]; diag(1,4) | det 6, value at (1,1) 5; dual generator 1/4 ↦ 1, squared norm 1/4 on both sides; dual diag(1,1/4) | Pass |
| 1.1 minimum (R07) | diag(1,4); [√2]; rank 0 | min 1, S = {±e₁}; values √2·k², attained at k = ±1; `sInf ∅ = 0` | Pass; R07 |
| 1.3 normalized half | I₂; A₂; (0,±1); 0 | S⁺ sizes 2 = 4/2 and 3 = 6/2; (0,1) yes, (0,−1) no, 0 no | Pass |
| 1.4–1.5 densities | [4]; I₂; diag(1,4); A₂ | δ: 1/2, 1/4, 1/8, 1/(2√3); Δ: 1, π/4, π/8, π/√12 = 0.90690; γ: 1, 1, 1/2, 2/√3 | Pass |
| 1.5 Bergé–Martinet | diag(1,1,4) | γ = 4^(−1/3), γ(dual) = 4^(−2/3), γ′ = 1/2 | Pass |
| 1.7 `hermite_le_minkowski` | n = 1, 2, 8 | c₁ = 1.00000 ≥ 1; c₂ = 4/π = 1.27324 ≥ 2/√3; c₈ = 2.81814 ≥ γ(E₈) = 2 | Pass |
| 1.8 `hermite_le_pow` | [4]; A₂; I₂; E₈ | 1 ≤ 1; 1.15470 = 1.15470; 1 < 1.15470; 2 ≤ (4/3)^3.5 = 2.73707 | Pass |
| 1.9 bounds | A₂; rank 1 | A₁₁A₂₂ = 4 ≤ 48/π² = 4.86342; one-based reading gives 19.45367; c₁ = 1; x₁² ≤ 2·(2/3) = 4/3 ≤ C₂² | Pass |
| 2.1 `hermiteConstant_pow_le` | n = 2, 3, 8 | 1 ≤ 1; 2^(1/3) = 1.25992 ≤ 4/3; γ₈⁶ = 64 = γ₇⁷ = 64 (equality, as dsv2007 line 126 notes) | Pass |
| 2.2 attainment | n = 1, 2; diag(1/t,t) | [a] has γ = 1; A₂ attains it; the first minimum 1/t → 0 needs η > 0 | Pass |
| 2.3 values | [a]; A₂; A₃; I₃ | 1; γ² = 4/3; γ³ = 8/4 = 2, Gauss equality abc = 8 = 2·det; I₃ gives 1 < 2 | Pass; R06 |
| 3.1 cell, relevance | [4]; I₂; A₂ | volumes 2 = √4 and 1; (1,1) has 4 shortest vectors in its parity class; for e₁−e₂ the class minima are 2 vs 6 | Pass |
| 3.2 covering | I₂; [a]; rank 0 | μ = √2/2 > ρ = 1/2, Θ = π/2; μ = ρ = √a/2, Θ = 1; 0 = 0 | Pass |
| 3.3 Jarník | diag(1,4); [4]; I₂ | 1 ≤ √5/2 = 1.11803 ≤ 1.5 ≤ 2; 1 = 1 = 1; 0.5 ≤ 0.70711 ≤ 1 ≤ 1 | Pass |
| 3.4 values (R02, R03) | ℤ³, A₂, A₃/D₄/E₈, Λ₂₄ | √3/2, Θ = 2.72070; √(2/3), Θ = 2π/√27 = 1.20920; 1; √2, Θ = 2¹²π¹²/12! = 7.90354; 23 deep hole types (Ch. 23) and 284 shallow types (Ch. 25) | Values pass; R03 |
| 4.1 perfection | I₂; A₂; D₄; E₈; rank 0 | span 2 < 3; 3 = 3 with kiss 6 ≥ 6; 24 ≥ 20; 240 ≥ 72; 0 = 0 | Pass |
| 4.1 determination | A₂, B = A₂ + H with H[x] = 0 on S(A₂) | 3 independent xxᵀ force H = 0 | Pass |
| 4.2 eutaxy | I₂; A₂; [[2,1],[1,3]] | c = 1/2 = 2/(4·1); Q = 6A₂⁻¹, c = 1/6; second diagonal of A⁻¹ is 2/5 vs 0 | Pass |
| 4.3 extreme | A(t) = [[1,t],[t,1]] | γ = 1/√(1−t²) > 1 = γ(I₂) | Pass |
| 4.4 Aut, eutaxy | A₂, U = [[−1,−1],[0,1]] | UᵀA₂U = A₂; UQ = [[−2,−2],[−2,4]] ≠ QU = [[−4,−6],[2,6]]; QA = 6I | Pass |
| 4.4 irrational form | [[1,√2/10],[√2/10,√3]] | det = √3 − 1/50 = 1.71205; values 1, 1.73205, 3.01490, 2.44921 on e₁, e₂, e₁±e₂ | Pass |
| 4.5 `isExtreme_iff` | A₂; I₂; [[2,1],[1,3]]; ranks 0, 1 | T ↔ T∧T; F ↔ F∧T; F ↔ F∧F; rank 1 has γ ≡ 1 (local max) with span 1 = 1 and 1/a = c₁ + c₂ | Pass |
| 4.6–4.7 finiteness | rank 2 | 1 perfect class (A₂); 2 eutactic classes (I₂, A₂) | Pass |
| 4.9 neighbours | A₂, N = [[0,−1],[−1,0]]; [1], N = [1] | admissible t ∈ [0,2], so ρ = 2 and the neighbour [[2,−1],[−1,2]] has det 3, min 2; rank 1 gives ρ = 0 | Pass |
| 4.10 counts, values | ranks 4–8 | 2, 3, 7, 33, 10916 (dsv2007 lines 89–95); γⁿ = 2⁴/4, 2⁵/4, 2⁶/3, 2⁷/2, 2⁸/1 | Pass |
| 4.11 Cohn–Elkies | f ↦ 3f; f ↦ f(a·) | ratio 3/3; (r/2a)ⁿ f(0)/(a⁻ⁿ f̂(0)) unchanged; Λ₂₄: δ = 1, γ = 4 | Pass |
| 5.1–5.2 moments | {±1}; square; hexagon | 2 = 2; second moment 2 = 4/2, fourth 2 ≠ 3/2; hexagon fourth moment 9/4 = 9/4 | Pass |
| 5.3 (R09) | A₃ roots, a = e₁ | fourth moment 8 vs 9.6 | Pass; R09 |
| 5.4 Gram Laplacian | diag(1,4); E₈ (Mathlib `E 8`) | 3/2 and 0; (A⁻¹)₀₀ = 4, (A⁻¹)₇₇ = 2; Σx₀² = 240, Σx₇² = 120; shell sums 120 and 0; Laplacians 4 and 0 | Pass |
| 5.5 harmonic Fourier | τ = i; τ = it | (−i)^d gives −i and −1; s = τ/i gives s^(−n/2−d)(−i)^d = (τ/i)^(−n/2) τ^(−d) | Pass |
| 5.6 harmonic theta | E₈, P = 2; P = X₀²−2X₇² | coefficients 2 and 480; weight 4+2 = 6 and S₆ = 0; Θ_P(−1/τ) = (−1)^d τ^(k+d) Θ_P(τ) when 8 ∣ n | Pass |
| 5.7 Venkov | n = 8, 16, 24; general m, r | t = 7, 3, 11 = 11 − 4r; dim S at weights 14–22 is 0,1,1,1,1 < 2; dim S_{12m+d} ≤ m < m+1 for even d ≤ t; n = 0 has min 0 ≠ 2 (vacuous) | Pass |
| 6.1 universality | ℤ³; ℤ⁴; A₂ | misses 7, 15, 23, 28, 31, 39, 47, 55, 60, 63; 7 = 4+1+1+1; half-norm truant 2 | Pass |
| 6.2 escalators | [1] by 2; 2ℤ⁴ | pairings 0, ±1 give diag(1,2) (det 2) and I₂ (det 1); 2ℤ⁴ + ℤe₁ has index 2 | Pass |
| 6.3 15 theorem | ⟨1,2,5,5⟩; ⟨1,2,5,10⟩ | misses only 15 below 2000; misses nothing up to 300 | Pass |
| 6.4 290 theorem | 2I₄; [2]; A₂ | 29/29; half-norm 2 missed; half-norm truant 2 | Pass |
| 7.1–7.3 tensor | A₂⊗A₂; A₂⊗D₄; E₈ | Kronecker Gram det 81, min 4, kiss 18, #Aut 144; 3⁴·4² = 1296 ≠ det E₈ = 1 | Pass |
| 7.2 Kitaoka (Lean) | A₂⊗A₂; [√2]⊗[3]; n = 0 or m = 0; A = B = [2], C = [1] | 4 = 2·2; 3√2; 0 = 0; 1 ≠ 4 is excluded by `hC` | Pass |
| 7.4 discriminant groups | [8]; [12]; 2I₃ | O(b) = {1,3,5,7}, O(q) = {1,7}; O(q) = {1,5,7,11}; (f∘g)(e₁/2) = e₂/2, (g∘f)(e₁/2) = e₃/2, matching `mul f g := g.trans f`; q(eᵢ/2) = 1/4 | Pass |
| 7.5 `fvIndex_rankOne` | m = 3, 4, 5, 6, 8, 12, 15, 24, 30 | 1, 1, 1, 1, 1, 2, 2, 2, 2; a doubled input at m = 6 gives 2 | Pass; R06 |
| Worked rows | ⟨2⟩, ℤ², A₂, ℤ³, A₃, bcc, ⟨15⟩, D₄, E₈, E₈², Λ₂₄, [[2,1],[1,3]], [[1,0],[0,3]] | see below | Pass |

Worked-example values, recomputed:
- bcc: Uᵀ(8A₃⁻¹)U = [[6,−2,−2],[−2,6,−2],[−2,−2,6]] with det U = −1; det 128, min 6, kiss 8; δ = 3√3/32, Δ = 0.68017, γ = 1.19055, μ = √10/2, Θ = 5√5π/24 = 1.46350. With 2A₃⁻¹ instead: det 2, min 3/2.
- E₈: Δ = π⁴/384 = 0.25367, Θ = π⁴/24 = 4.05871.
- Λ₂₄: Δ = 0.0019296.
- [[2,1],[1,3]]: #Aut 4 (±I, ±[[1,1],[0,−1]]), Δ = 0.70248.
- [[1,0],[0,3]]: Δ = 0.45345, γ = 0.57735.
- γ₅ = 1.51572, γ₆ = 1.66537, γ₇ = 1.81145.

## Not verifiable

| Source | Cited at | Where I looked |
| --- | --- | --- |
| Conway–Sloane, *SPLAG*, Ch. 21, 23, 25 | 3.1, 3.4 (R03) | Springer, behind a paywall. R03 rests on arXiv:1502.02099v3, which cites the chapters. The value `√2` is taken from the citation. |
| Gruber–Lekkerkerker, Ch. 2 §13 | 3.3 | Publisher paywall. The Jarník bounds were checked on explicit lattices. |
| Kitaoka, Theorem 7.1.1 | 7.2 | Paywall. Checked through Coulangeon–Nebe Corollary 2.3. |
| Schürmann, Ch. 2–3; Martinet, Ch. 2–3, 7, 9, 16 | 1.9, 2.1, 4.9 | AMS and Springer paywalls. 1.9 was checked against the Tau Ceti declarations. |
| Hanke, Duke 124 (2004) | 6.4 | Not fetched this round. The §4.2 bounds were checked in Bhargava–Hanke instead. |
| Published Venkov volume (Monogr. Enseign. Math. 37) | R05 | Only the author-hosted version was readable, so the printed pagination is unchecked. |

## Source issues

- **Misprint** in coulangeonnebe2012 at §1, Introduction, p.2: the source says "small" dimension means less than 43; it should be at most 43, as Corollary 2.3 (rank ≤ 43) and Remark 2.4(1) (at least 44 needed) use; affects nothing.
