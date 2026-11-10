# Review of CotangentLagrangian (pull request #1651 at c955776)
Folder: `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/`
**Verdict:** needs changes

The three findings of the previous review are repaired (see "Previous findings"). The four C4 headlines now in `Suggested.lean` are true, sourced and correctly scoped. The blocking problems are in the docstring's list of headlines it calls "not statable". Three entries in that list can be stated at the pins with native carriers. A scratch copy of `Suggested.lean` states each of them, and it elaborates with exit 0 and only `sorry` warnings:

- the C4 theorem with a prescribed ambient derivative (R01);
- the C3 generating-function theorem on manifolds, with the C3.1 fixed-point dictionary (R02);
- the C3.1 billiard periodic-orbit theorem (R03).

Two of these reverse advice in the previous review. The new evidence is a Mathlib idiom (`inTangentCoordinates`) and the pinned mixed Hessian's own definition. Neither was cited in that review.

## R01 (P2) — The prescribed-derivative neighborhood theorem is statable at the pins and absent

**Location:** `Suggested.lean:89`–92: "there is no carrier for a smooth symplectic vector-bundle isomorphism over a diffeomorphism between the pulled-back tangent bundles". The README states the theorem at `README.md:574`–584.

**Claim:** the "no carrier" reason is false.
- Mathlib's native way to state that a family `A q : T_(i q)M →L T_(j(f q))N` is a smooth bundle map between pulled-back tangent bundles is `ContMDiffAt` of `inTangentCoordinates I I' i (j ∘ f) A q₀` at every `q₀`. This is how Mathlib states the smoothness of `mfderiv` itself.
- "Symplectic" is `(τ (j (f q))).compContinuousLinearMap (A q) = σ (i q)`.
- The compatibility `A_q ∘ di_q = dj ∘ df_q` and the conclusion `dΦ_(i q) = A_q` are `mfderiv` equations.

The headline is the seeded-sample target and the first C4 item of the pull-request description. Its statement is checked true below (table rows "Prescribed derivative").

**Witness:** `Mathlib/Geometry/Manifold/VectorBundle/Tangent.lean:513`: `inTangentCoordinates` "is the underlying function of the trivializations of the hom of (pullbacks of) tangent spaces"; `Mathlib/Geometry/Manifold/ContMDiffMFDeriv.lean:223` (`ContMDiffAt.mfderiv`) uses it. The statement below elaborates.

**Repair:** add the following after `exists_diffeomorph_opens_of_eq_along`. It was tested in the scratch copy: exit 0, one `sorry` warning, and every binder appears in `#check @`.

```lean
open TopologicalSpace in
/-- Neighborhood theorem with prescribed ambient derivative (the Lagrangian case without the
prescription is Cannas da Silva, Thm. 8.4, p. 48): a smooth symplectic bundle isomorphism
`A : i*TM → j*TN` over a diffeomorphism `f : Q → Q'` that extends `df` is the derivative along
`Q` of a symplectomorphism of open neighborhoods extending `f`. -/
theorem exists_diffeomorph_opens_mfderiv_eq
    {E' H' N : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [TopologicalSpace H']
    {I' : ModelWithCorners ℝ E' H'} [TopologicalSpace N] [ChartedSpace H' N] [IsManifold I' ∞ N]
    {F' K' Q' : Type*} [NormedAddCommGroup F'] [NormedSpace ℝ F'] [TopologicalSpace K']
    {J' : ModelWithCorners ℝ F' K'} [TopologicalSpace Q'] [ChartedSpace K' Q']
    [IsManifold J' ∞ Q']
    [FiniteDimensional ℝ E] [I.Boundaryless] [T2Space M] [SecondCountableTopology M]
    [FiniteDimensional ℝ E'] [I'.Boundaryless] [T2Space N] [SecondCountableTopology N]
    [FiniteDimensional ℝ F] [J.Boundaryless] [CompactSpace Q]
    [FiniteDimensional ℝ F'] [J'.Boundaryless]
    {σ : TauCeti.SmoothTwoForm I M} (hσ : σ.IsSymplectic)
    {τ : TauCeti.SmoothTwoForm I' N} (hτ : τ.IsSymplectic)
    {i : Q → M} (hi : Manifold.IsSmoothEmbedding J I ∞ i)
    {j : Q' → N} (hj : Manifold.IsSmoothEmbedding J' I' ∞ j)
    (f : Q ≃ₘ⟮J, J'⟯ Q')
    (A : ∀ q : Q, TangentSpace I (i q) ≃L[ℝ] TangentSpace I' (j (f q)))
    (hA : ∀ q₀ : Q, ContMDiffAt J 𝓘(ℝ, E →L[ℝ] E') ∞
      (inTangentCoordinates I I' i (fun q ↦ j (f q))
        (fun q ↦ ((A q : TangentSpace I (i q) →L[ℝ] TangentSpace I' (j (f q))))) q₀) q₀)
    (hAω : ∀ q, (τ.1 (j (f q))).compContinuousLinearMap
        (A q : TangentSpace I (i q) →L[ℝ] TangentSpace I' (j (f q))) = σ.1 (i q))
    (hAi : ∀ q, (A q : TangentSpace I (i q) →L[ℝ] TangentSpace I' (j (f q))) ∘L
        mfderiv J I i q = mfderiv J' I' j (f q) ∘L mfderiv J J' f q) :
    ∃ (U : Opens M) (V : Opens N) (Φ : U ≃ₘ⟮I, I'⟯ V),
      (∀ q, ∃ h : i q ∈ U, (Φ ⟨i q, h⟩ : N) = j (f q) ∧
        mfderiv I I' (fun x : U ↦ (Φ x : N)) ⟨i q, h⟩ =
          (A q : TangentSpace I (i q) →L[ℝ] TangentSpace I' (j (f q)))) ∧
      TauCeti.SmoothForm.mpullback Φ Φ.contMDiff
          (TauCeti.SmoothForm.mpullback (Subtype.val : V → N) contMDiff_subtype_val τ) =
        TauCeti.SmoothForm.mpullback (Subtype.val : U → M) contMDiff_subtype_val σ := by
  sorry
```

Then:
- Name it in backticks at `README.md:579`–580.
- Add it to the docstring's "Stated here" paragraph.
- Narrow the bullet at `Suggested.lean:89`–92 to the symplectic neighborhood theorem, with a reason that holds at the pins (for example, no carrier for a smooth subbundle of `i*TM` such as `TQ^ω` with its induced fibre form).

## R02 (P2) — The manifold generating-function theorem and the fixed-point dictionary are statable

**Location:** `Suggested.lean:82`–86: "there is no generating relation of a function on a product of manifolds". The README targets are `README.md:381`–387 and the dictionary at `README.md:404`–410.

**Claim:** the relation `p = d_qS`, `P = −d_QS` is two equations in Mathlib's `mvfderiv`. The covector `mvfderiv J (fun q ↦ S (q, Q)) q` has type `TangentSpace J q →L[ℝ] ℝ`, the fibre of `Cotangent J Q`. The pinned mixed Hessian, which `README.md:374`–381 cites, is defined as the derivative of exactly this covector. Its module docstring says that `S` on `M × N` "generates the cotangent relation `p = d_q S`, `P = -d_Q S` between `T*M` and `T*N`". So both the generated symplectomorphism and Prop. 5.1's bijection can be stated on manifolds, in the same `Opens`/`mpullback` idiom as C4.

**Witness:** `TauCeti/Geometry/Symplectic/Cotangent/GeneratingFunction/MixedHessian.lean:17` (the docstring sentence) and :78–80 (`TauCeti.mixedHessian S x := mvfderiv J (fun Q ↦ mvfderiv I (fun q ↦ S (q, Q)) x.1) x.2`). Both statements below elaborate.

**Repair:** add both theorems. Each was tested in the scratch copy with exit 0 and one `sorry` warning. Use `ContMDiffOn` on an open `W`, not `ContMDiffAt`: at the pinned Mathlib, `ContMDiffAt ∞` gives a neighbourhood that may shrink with each order, which is too weak for a `Diffeomorph`.

```lean
open TopologicalSpace in
/-- Generating functions on manifolds (Cannas da Silva, §4; Prop. 5.1 uses this convention): a
smooth `S` on an open `W ⊆ Q × Q'` whose mixed Hessian is invertible at `x₀ ∈ W` generates a
symplectomorphism between open sets of `T*Q` and `T*Q'` whose graph is `p = d_qS, P = −d_QS`. -/
theorem exists_diffeomorph_opens_cotangent_of_isInvertible_mixedHessian
    {F' K' Q' : Type*} [NormedAddCommGroup F'] [NormedSpace ℝ F'] [TopologicalSpace K']
    {J' : ModelWithCorners ℝ F' K'} [TopologicalSpace Q'] [ChartedSpace K' Q']
    [IsManifold J' ∞ Q']
    [FiniteDimensional ℝ F] [J.Boundaryless] [FiniteDimensional ℝ F'] [J'.Boundaryless]
    {S : Q × Q' → ℝ} {W : Set (Q × Q')} (hW : IsOpen W)
    (hS : ContMDiffOn (J.prod J') 𝓘(ℝ) ∞ S W) {x₀ : Q × Q'} (hx₀ : x₀ ∈ W)
    (hH : (TauCeti.mixedHessian J J' S x₀).IsInvertible) :
    ∃ (U : Opens (Cotangent J Q)) (V : Opens (Cotangent J' Q'))
      (φ : U ≃ₘ⟮cotangentModel J, cotangentModel J'⟯ V),
      (Bundle.TotalSpace.mk' (F →L[ℝ] ℝ) x₀.1 (mvfderiv J (fun q ↦ S (q, x₀.2)) x₀.1) ∈ U) ∧
      (∀ z : U,
        (z : Cotangent J Q).2 =
            mvfderiv J (fun q ↦ S (q, (φ z : Cotangent J' Q').1)) (z : Cotangent J Q).1 ∧
        (φ z : Cotangent J' Q').2 =
            -mvfderiv J' (fun y ↦ S ((z : Cotangent J Q).1, y)) (φ z : Cotangent J' Q').1) ∧
      TauCeti.SmoothForm.mpullback φ φ.contMDiff
          (TauCeti.SmoothForm.mpullback (Subtype.val : V → Cotangent J' Q') contMDiff_subtype_val
            (canonicalForm J')) =
        TauCeti.SmoothForm.mpullback (Subtype.val : U → Cotangent J Q) contMDiff_subtype_val
          (canonicalForm J) := by
  sorry

open TopologicalSpace in
/-- Fixed points and critical points (Cannas da Silva, Prop. 5.1, p. 29): if the relation of `S`
on `W` is the graph of `φ`, the fixed points of `φ` correspond to the critical points of
`q ↦ S(q, q)` on `{q | (q, q) ∈ W}`, by the base point. -/
theorem exists_equiv_fixed_of_generating [FiniteDimensional ℝ F] [J.Boundaryless]
    {S : Q × Q → ℝ} {W : Set (Q × Q)} (hW : IsOpen W) (hS : ContMDiffOn (J.prod J) 𝓘(ℝ) ∞ S W)
    {U V : Opens (Cotangent J Q)} (φ : U ≃ₘ⟮cotangentModel J, cotangentModel J⟯ V)
    (hφ : ∀ z : U, ((z : Cotangent J Q).1, (φ z : Cotangent J Q).1) ∈ W ∧
      (z : Cotangent J Q).2 =
        mvfderiv J (fun q ↦ S (q, (φ z : Cotangent J Q).1)) (z : Cotangent J Q).1 ∧
      (φ z : Cotangent J Q).2 =
        -mvfderiv J (fun y ↦ S ((z : Cotangent J Q).1, y)) (φ z : Cotangent J Q).1)
    (hW' : ∀ x ∈ W, ∃ z : U,
      (z : Cotangent J Q) = Bundle.TotalSpace.mk' (F →L[ℝ] ℝ) x.1
        (mvfderiv J (fun q ↦ S (q, x.2)) x.1) ∧ (φ z : Cotangent J Q).1 = x.2) :
    ∃ e : {z : U // (φ z : Cotangent J Q) = z} ≃
        {q : Q // (q, q) ∈ W ∧ mvfderiv J (fun q ↦ S (q, q)) q = 0},
      ∀ z, (e z : Q) = (z.1 : Cotangent J Q).1 := by
  sorry
```

Then:
- Name the two theorems in backticks at `README.md:381`–384 and :407–410.
- Delete the C3 bullet at `Suggested.lean:82`–86, or keep in it only the chain dictionary for `N ≥ 2` if the author chooses not to state that. The chain dictionary is statable in the same way, so its reason must then not be "no generating relation".

## R03 (P2) — The billiard periodic-orbit theorem is statable; "no carrier for a closed strictly convex plane curve" is false

**Location:** `Suggested.lean:87`–88: "there is no carrier for a closed strictly convex plane curve with its arclength parametrization". The README target is `README.md:478`–493.

**Claim:** the README itself defines the carrier at `README.md:448`–452: `χ : ℝ → ℝ²`, smooth, `L`-periodic, unit speed, injective on `[0,L)`, and meeting each tangent line only at the point of tangency. Every one of these is a Mathlib notion: `EuclideanSpace ℝ (Fin 2)`, `ContDiff`, `Function.Periodic`, `deriv`, `Set.InjOn`. The perimeter-maximizer theorem needs no billiard map. For every `N ≥ 2` it gives `N` boundary points with distinct consecutive vertices and the equal-angle law at every vertex.

**Witness:** the statement below elaborates. It is true by the README's own proof (`README.md:483`–489). On the unit circle with `N = 3`, the equilateral triangle gives `⟪u_(k−1), χ'⟫ = 1/2 = ⟪u_k, χ'⟫`.

**Repair:** add the theorem below (scratch copy: exit 0, one `sorry` warning) and name it at `README.md:483`. In the docstring, keep the next-collision map and its invariant measure in the "not statable" list only with a reason that holds. For example: the map is a construction whose existence is itself the C3.1 theorem.

```lean
/-- Periodic billiard trajectories in a convex table (Cannas da Silva, §5.2, p. 32): for every
`N ≥ 2` a perimeter-maximizing inscribed `N`-gon has distinct consecutive vertices and satisfies
the reflection law at each vertex. -/
theorem exists_billiard_periodic_reflection {L : ℝ} (hL : 0 < L)
    {χ : ℝ → EuclideanSpace ℝ (Fin 2)}
    (hχ : ContDiff ℝ ∞ χ) (hper : Function.Periodic χ L) (hunit : ∀ s, ‖deriv χ s‖ = 1)
    (hinj : Set.InjOn χ (Set.Ico 0 L))
    (hconv : ∀ s t (c : ℝ), χ t = χ s + c • deriv χ s → χ t = χ s)
    {N : ℕ} (hN : 2 ≤ N) :
    ∃ s : ZMod N → ℝ, (∀ k, χ (s (k + 1)) ≠ χ (s k)) ∧
      ∀ k, inner ℝ (‖χ (s k) - χ (s (k - 1))‖⁻¹ • (χ (s k) - χ (s (k - 1)))) (deriv χ (s k)) =
        inner ℝ (‖χ (s (k + 1)) - χ (s k)‖⁻¹ • (χ (s (k + 1)) - χ (s k))) (deriv χ (s k)) := by
  sorry
```

## R04 (P3) — C1.1, C1.3, C2, C2.0, C2.1 and C2.2 still state as targets results the pinned Tau Ceti proves

**Location:**
- `README.md:42`–44: "prove projection smooth with `Manifold.IsSubmersion`; zero section …; local transition formula".
- `README.md:71`–72: "Define cotangent pullback along a general map as a relation".
- `README.md:146`–172: "Own the elementary finite-dimensional matrix polar decomposition".
- The other rows of the table below.

**Claim:** what the pin states is cited, not restated. The previous repair handled the rows that review listed. That review also said the general cotangent relation is absent from the pin, but the pin defines it. The C2.0 package and the C2.1 polar and intersection results are proved at the pin, while `README.md:233`–235 now consumes pinned maximal-compactness results whose pinned proofs use them.

**Witness:** `TauCeti/Geometry/Manifold/VectorBundle/Cotangent/Relation.lean:58`, `TauCeti.CotangentBundle.cotangentRel`, defines the relation `p = q ∘ df_x`. It has identity, composition and diffeomorphism laws (:94, :108, :160). All names in the table below elaborate by `#check` at the pin.

| README target | Pinned declaration (Tau Ceti unless marked) |
|---|---|
| C1.1 projection a submersion, zero section smooth, transition `(q,p)↦(φq, p∘(dφ)⁻¹)` (:42–44) | `Bundle.isSubmersion_proj` (`Geometry/Manifold/VectorBundle/Submersion.lean:87`); Mathlib `Bundle.contMDiff_zeroSection` (`Geometry/Manifold/VectorBundle/Basic.lean:232`); `TauCeti.CotangentBundle.extChartAt_extChartAt_symm` (`Geometry/Manifold/VectorBundle/Cotangent/Basic.lean:126`) |
| C1.3 cotangent relation of a general map (:71–72) | `TauCeti.CotangentBundle.cotangentRel`, `cotangentRel_comp_iff`, `cotangentRel_diffeomorph_iff` (`…/Cotangent/Relation.lean:58`, :108, :160) |
| C2 parametrization independence, transport, dimension, products, open restriction (:105–106) | `TauCeti.SmoothTwoForm.IsNondegenerate.isLagrangianMap_comp_diffeomorph_iff`, `isLagrangianMap_diffeomorph_comp_iff`, `IsLagrangianMap.two_mul_finrank`, `IsCoisotropicMap.finrank_le_two_mul_finrank` (`Geometry/Symplectic/Lagrangian/Manifold.lean:204`, :241, :265, :272), `isLagrangianMap_prodMap_iff` (`Lagrangian/Prod.lean:132`), `isLagrangianMap_comp_subtype_val_iff`, `isLagrangianMap_iff_of_isOpenCover` (`Lagrangian/Opens.lean:72`, :108), isotropic and coisotropic siblings; `Diffeomorph.isLagrangianEmbedding_comp_diffeomorph_iff` (`Lagrangian/Embedding/Basic.lean:97`) |
| C2 product of Lagrangian immersions (:116–117) | `TauCeti.SmoothTwoForm.IsNondegenerate.IsLagrangianImmersion.prodMap` (`Lagrangian/Prod.lean:165`) |
| C2 `dim W + dim W^ω = dim V`; Lagrangian ⇔ maximal isotropic; coisotropic bound (:125, :132–134) | `TauCeti.SymplecticForm.finrank_add_finrank_orthogonal`, `isLagrangian_iff_maximal_isIsotropic`, `IsCoisotropic.finrank_le_two_mul_finrank` (`Lagrangian/Basic.lean:338`, :223, :345) |
| C2.0 polar decomposition, uniqueness, determinants in SL (:146–149, :159–160) | `Matrix.GeneralLinearGroup.existsUnique_posDef_mul_unitary`, `det_rpow_sqrt_mul_star_of_det_eq_one`, `det_polarUnitary_of_det_eq_one` (`Analysis/Matrix/Polar.lean:76`, :94, :100) |
| C2.0 log/exp inverse on `Sym_n`/`PD_n`, smooth log (:150–156) | `Matrix.IsHermitian.cfc_log_exp`, `Matrix.PosDef.exp_cfc_log`, `Matrix.contDiffOn_cfc_log` (`Analysis/Matrix/Exponential/Log.lean:66`, :73, :79) |
| C2.0 smooth dependence, equivariance, contraction `P^(1−t)U` (:157–158) | `Matrix.GeneralLinearGroup.contMDiff_coe_polarUnitary`, `polarDeformation`, `polarDeformation_unitary_mul_mul_unitary`, `polarHomotopy` (`Analysis/Matrix/Polar/Deformation.lean:61`, :81, :152, :175) |
| C2.1 polar factors of a symplectic matrix symplectic, `JP^sJ⁻¹=P^(−s)`, path (:229) | `SymplecticGroup.rpow_neg_eq_J_conj_rpow`, `rpow_mem`, `sqrt_mul_star_mem`, `polarUnitary_mem`, `joinedIn_polarUnitary` (`Analysis/Matrix/Polar/Symplectic.lean:63`, :79, :93, :104, :116) |
| C2.1 image of realification = commutant of J (:191, :193) | `Matrix.commute_J_iff_exists_realify_eq`, `Matrix.GeneralLinearGroup.mem_range_realify_iff` (`LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/Unitary.lean:72`, :150) |
| C2.1 three pairwise intersections = realified U(n) (:219–221) | `TauCeti.GLSymplectic.inf_unitarySubgroup`, `inf_range_realify`, `Matrix.GeneralLinearGroup.unitarySubgroup_inf_range_realify`, and matrix-level `Matrix.symplecticGroup_inf_orthogonalGroup` (same file :199, :210, :180, :121) |
| C2.2 conormal fibre has dimension `dim M − dim Q` (:259) | `TauCeti.CotangentBundle.finrank_add_finrank_conormalSpace` (`…/Cotangent/Conormal.lean:85`) |

**Repair:**
- At each sentence, cite the declaration by name and change "prove", "derive" or "own" to "consume".
- Extend the list at `README.md:18`–30 and the docstring's "Proved at the pins" with these items.
- Reduce C2.0 to a statement that the package is Tau Ceti's and is consumed by HF and LieGroups.
- Keep as targets only what the pin lacks: the embedded-predicate wrappers, the C2.1 topology comparisons and the closedness of the realified image if absent, the conormal subbundle and its embedding, and the remaining C2.1 structural and adjoint comparisons.

## R05 (P3) — Two headlines are neither stated nor named as not statable

**Location:**
- `README.md:327`–331: "Prove composition L₁₂×_(M₂) L₂₃→M₁×M¯₃ is Lagrangian under transverse fiber-product and embedding hypotheses".
- `README.md:286`–297: the Kodaira–Thurston compact symplectic non-Kähler example.
- Neither appears in `Suggested.lean`, including its docstring.

**Claim:** the module docstring must name each headline that is not statable, with the missing carrier. Both of these appear to be not statable at the pins:
- The pinned `TauCeti/Geometry/Manifold/FiberProduct/Equation.lean` gives only the local equations of a transverse fibre product, with no manifold structure on it.
- There is no Kähler-manifold carrier in Mathlib or Tau Ceti (the only `Kahler` definitions are linear: `TauCeti/Analysis/InnerProductSpace/HodgeStar/Kahler.lean:80`).

**Witness:** search of the pinned `TauCeti/Geometry/Manifold` and `Mathlib/Geometry/Manifold` for a fibre-product manifold or a Kähler structure returns nothing.

**Repair:** add both to the docstring's "Not statable" list with those reasons, or state them if a carrier is found.

## R06 (P3) — Citations without a locator or section

**Location:**
- `README.md:690`–691: "Weinstein, *Symplectic manifolds and their Lagrangian submanifolds*, … (Lagrangian neighborhood theorem; cited by locator)". The same work is cited at `README.md:580` and :618.
- `README.md:295`–297 cites ComplexKahlerGeometry's "explicit Hodge parity theorem" without a section.
- `README.md:289`–291 cites UniversalCovers without a section.

**Claim:**
- "Cited by locator" needs a locator: the theorem or corollary number and page in the 1971 paper.
- The two cross-roadmap supplier citations name no section.

**Witness:**
- The Weinstein citation gives no number.
- On main, the parity statement is ComplexKahlerGeometry K6.1 (`ComplexKahlerGeometry/README.md:1274`–1280: odd Betti numbers even, "including the degree-one obstruction").
- The covering correspondence is UniversalCovers Stages 1–2 (`Completed/UniversalCovers/README.md:89`, :98).

**Repair:**
- Give Weinstein's theorem number and page, or drop the secondary citation, since Cannas da Silva Thms. 8.4 and 9.3 carry both claims.
- Write "ComplexKahlerGeometry K6.1" and "UniversalCovers Stages 1–2" at those sentences.

## Previous findings

- **R01 (relative Moser and Weinstein statable), repaired.**
  - `Suggested.lean:136` (`exists_diffeomorph_opens_of_eq_along`) and :173 (`exists_diffeomorph_opens_cotangent_of_isLagrangianEmbedding`) state them in the suggested idiom.
  - The point-germ relative Darboux theorem (:154) and coisotropic uniqueness (:192) are added.
  - `README.md:531`, :553, :616, :626 name all four.
  - The narrowed docstring bullet the previous review proposed is contradicted by R01 above.
- **R02 (C3 calculus "not statable"), repaired.**
  - `Suggested.lean:66`–76 lists the pinned generating-function names under "Proved at the pins".
  - `README.md:340`–379 cites them, including `TauCeti.mixedHessian` and its chart lemmas.
  - The remaining bullet that the previous review let stand is R02 above.
- **R03 (C1.3, C1.4, C2.2 restated), repaired for the listed rows.**
  - `README.md:61`–70 (lift and group action), :73–90 (restriction, product, translation, dilation), :241–316 (zero section, graphs, conormal maps, Liouville field, classification, torus graphs, cosphere) and the docstring at `Suggested.lean:34`–65 now cite the pinned names.
  - Further pinned items, including the cotangent relation that review called absent, are R04.

## Verified sound

:robot: AI review. **Full review** of the folder at `c955776`. No pull-request file was edited; every probe is a scratch copy.

**Scope and pins.**
- Pins: Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`; the manifest and the package checkouts agree.
- HEAD is `c9557767` and `origin/main` is `641f296a`.
- The prescribed exclusion diff prints nothing outside the three named folders. The folder holds `README.md` and `Suggested.lean` only.

**Gate and dependency check.**
- The worker's gate reports every counter zero and `build=0`.
- My run of the prescribed gate reports every content counter zero and `outside-folder=4`. The four files are the `ConvexityToric` and `IntegrableSystems` files that the brief names as the pull request's own.
- The dependency check prints `depcheck: 234 roadmaps, 2265 edges, 0 problem(s)`, with no UPWARD or CYCLE line.

**Elaboration and signatures.**
- `lake env lean` on `Suggested.lean` exits 0 with exactly four warnings, at 136, 154, 173 and 192, all `declaration uses sorry`.
- A scratch file importing the built module and running `#check @` on all seven declarations shows every binder; it matches `signatures.md`:
  - `[CompactSpace Q]` is present in the three compact headlines and absent from relative Darboux, as its docstring says.
  - `[T2Space M] [SecondCountableTopology M]` is present in all four.
- `HamiltonianReduction/Suggested.lean`, the consumer of `canonicalForm`, exits 0 with only its five `sorry` warnings.
- The fully qualified names do not clash across the family's `Suggested.lean` files.
- The one-tactic probe does not apply: the four theorems are neighborhood theorems, and the three abbreviations are needed by Weinstein's statement and by HamiltonianReduction R1. No padding.

**Library declarations opened at the pin (about 200 `#check`s).**
- Every Tau Ceti and Mathlib name backticked in the README resolves under the name written, in 134 plus 32 `#check`s. `Conservative.*` and `SymplecticForm.*` resolve with `MeasureTheory` and `TauCeti` open, and `SymplecticGroup.*` is Mathlib's root namespace (`LinearAlgebra/SymplecticGroup.lean:112`).
- R04 used a further 48 checks; the probes and the signature file used 7.
- Statements compared with the README:
  - The Witt extension has `finrank V = finrank W`, arbitrary `S`, `T`, `f : S ≃ₗ T` and form compatibility (`WittExtension.lean:212`), as `README.md:556`–562 says.
  - `IsLagrangianEmbedding` is immersion, embedding and Lagrangian tangent images (`Lagrangian/Embedding/Basic.lean:47`).
  - `IsCoisotropicMap` is coisotropy of the `mfderiv` range at every point (`Lagrangian/Manifold.lean:115`).
  - `IsSymplectic` is closed plus fibrewise nondegenerate (`Manifold/TwoForm.lean:115`).
  - `Conservative.ae_frequently_mem_of_mem_nhds` assumes `SecondCountableTopology` and `OpensMeasurableSpace` (`Mathlib/Dynamics/Ergodic/Conservative.lean:196`), as `README.md:505`–507 says.
  - The pinned generating-function module assumes `C²` at `x₀` and finite dimension for invertibility (`GeneratingFunction/Basic.lean`, docstring and :535), as `README.md:340`–356 says.
- Tubular neighborhoods: the pinned `TauCeti.SmoothEmbedding.exists_diffeomorph_normalBundle_subset` (`Geometry/Manifold/TubularNeighborhood/Existence.lean:53`) is what GeometricTopology 1.5 on main consumes (its `README.md:981`, :1005), so `README.md:32`–33's deferral to GeometricTopology is sound.

**Sources.** Cannas da Silva, *Lectures on Symplectic Geometry*, is read from the open copy on the author's page (revised January 2006); printed page = PDF page − 8.

| Sampled target | Locator | Checked |
|---|---|---|
| Fixed points and finite iterates | Prop. 5.1, p. 29 (text line 1300); Prop. 5.2, p. 30 (line 1331); third-iterate exercise, p. 30 (line 1355) | The correspondence, `ξ = d_xf` and `dψ = d_xf + d_yf` are the README's. Prop. 5.2 has its unique-critical-point and global uniqueness hypotheses, as the README says. |
| Chains of generating functions | the same lines | Vertex equations, the `N = 1` reduction and the open-chain elimination agree. The `N = 2` example in the table reproduces Prop. 5.2's `f^(2)`. |
| Convex planar billiards | §5.2, pp. 30–32 (lines 1361–1418) | Period 1, arclength, tangent-line convexity, `f = −|χ(x)−χ(y)|`, `∂_xf = v`, `∂_yf = −w`, the cyclic sum and area preservation (line 1418). |
| Finite-volume recurrence | Thm. 5.3, p. 32 (line 1420) | Area-preserving diffeomorphism of a finite-area manifold; neighbourhood return. |
| Neighborhood germs with prescribed ambient derivative | Thm. 8.4, p. 48 (line 1974) | Two forms on one `M` and identity on `X`, with no derivative prescription, as the README says. Its proof (lines 1996–2010) builds `h` with `dh_p = L_p` by a Whitney extension and then applies Thm. 7.4: the README's tubular construction replaces exactly this step. |

Also checked at their locators:
- Thm. 6.5, p. 37 (line 1558);
- Prop. 6.8, p. 39 (line 1639): `μ_x = 0` on `X`, a full-tensor vanishing as the README says;
- Thm. 7.4, p. 45 (line 1845);
- Thm. 8.1, p. 46 (line 1875), with the hint that Darboux is relative Moser for `X = {p}` (line 1870);
- Thm. 8.6, p. 49 (line 2030): two forms on one `M`, `k ≥ n`, as the docstring says;
- Thms. 9.1 and 9.3, p. 51 (lines 2093, 2107);
- the §18.1 exercise, p. 106 (line 4267).

**Cross-roadmap citations resolved.** On main `641f296`:
- HeegaardFloer F2.1 (§4.1, `README.md:2437`, domain-local Moser at :2468), F2.6h (:3320), F3 (:3476);
- DifferentialGeometry Layer 4 (:402), 5.4 (:524);
- LieGroups Layers 2, 7, 9 (:356, :787, :1199);
- SmoothBundlesConnections B1 (:221–498), B2 (:559–776), B6.1 (:1375);
- ContactGeometry CG1, CG4, CG5 (:59, :121, :150);
- HamiltonianReduction R1, R3 (:33, :187);
- ComplexKahlerGeometry K6.1 (:1274);
- `Completed/UniversalCovers`;
- GeometricTopology 1.5 (:974).

At this head, IntegrableSystems I5.2 (`README.md:534`–551) instantiates C3.1's chain dictionary with generators `−S_k`. Its critical equation `Y_(k−1) = y_k` is C3.1's `−d_2S_(i−1) = d_1S_i` after the sign change. No gap is declared.

**Overlaps and ownership.**
- #1187 (pin bump) conflicts in this folder. The description's merge-order block orders this pull request first, then #1187.
- No cited id is dropped, and no id of this roadmap is dropped.
- `roadmaps grep` finds relative Moser, Weinstein and coisotropic neighborhoods owned only here. FukayaTheory (open, #1045) consumes "CotangentLagrangian C4 (Weinstein neighbourhood) and C2" (its `README.md:852`), which is consistent with this ownership.
- The family index on main assigns ordinary Darboux and Moser to HeegaardFloer F2.1 and the relative refinements to this family.

**Adversarial table.** Here `ω = dq∧dp` and `λ = p dq`.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Prop. 5.1 dictionary | `S=qQ+q²/2+Q²/2` on ℝ | `φ(q,p)=(p−q,−p)`; fixed only `(0,0)`; `ψ=2q²`, `ψ'=4q`, critical `q=0` ↦ `(0,d_1S(0,0))=(0,0)` | bijection | none |
| Prop. 5.1 sign | wrong model `P=+∂_QS` | `Q=p−q`, `P=p`: whole line `p=2q` fixed vs one critical point | sign pinned | none |
| Chains, `N=2` | same S | `φ²=[[1,−2],[0,1]]` fixes `{p=0}`; `A=(q₀+q₁)²`, critical `q₁=−q₀` ↦ `(q₀,0)` | bijection | none |
| Prop. 5.2, `f^(2)` | same S | critical `z₀=−(x+y)/2`, `f^(2)=(x−y)²/4`, generates `(x,p)↦(x−2p,p)=φ²` | agrees | none |
| Chains, `N=1` | any S | `A(q₀)=S(q₀,q₀)=ψ` | recovers ψ | none |
| Billiards: generating signs | circle radius R | `S=−2R sin((t−s)/2R)`: `∂_sS=cos((t−s)/2R)=v`, `w=−∂_tS=v` | `β(s,v)=(s+2R arccos v,v)` | none |
| Billiards: twist | circle | `∂_s∂_tS=−sin((t−s)/2R)/2R<0`; `∂t/∂v=−2R/√(1−v²)<0` | holds | none |
| Billiards: primitive | circle | `β̃*λ−λ=−2Rv/√(1−v²)dv`; `ℓ=2R√(1−v²)`, `dℓ` equal; Jacobian det 1 | `β̃*ω=ω` | none |
| Billiard measure | `AddCircle L × (−1,1)` | `L·2=2L` (`AddCircle.measure_univ`) | finite, full support | none |
| Perimeter maximizer, `N=4` | circle | square `4√2R≈5.66R`; doubled diameter `8R`; each chord ≤ `2R` | least period 2 | none |
| R03 statement, `N=3` | unit circle, vertices `0, 2π/3, 4π/3` | at `s=0`: `⟪u_(−1),χ'⟫=1/2`, `⟪u_0,χ'⟫=1/2`; sign-flipped law needs `1/2=−1/2` | true; law discriminates | R03 |
| R03 statement, `N=2` | any table | law at `s₀`: `⟪−u₀,χ'⟫=⟪u₀,χ'⟫` ⇒ chord ⊥ tangent | double normal (diameter) | R03 |
| Recurrence hypotheses | translation on ℝ with Lebesgue; point mass at 0, `f(0)=0`, else `f(x)=x+1` | `U=(0.5,0.6)` never returns in either | finiteness and full support both needed, both stated | none |
| Relative Moser (:136) | `T*S¹`, `σ₁=(1+p²)ω`, Q zero section | equal at `p=0`; `φ(q,p)=(q,h(p))`, `h+h³/3=p`: `φ*σ₁=(1+h²)h'ω=ω`, fixes Q | holds | none |
| Relative Moser, degenerate | `Q=∅`; `Q=M` compact | `U₀=U₁=∅`; `σ₀=σ₁`, `φ=id` | holds | none |
| Relative Darboux (:154) | Q = q-axis in ℝ², `σ₁=e^qω` | pullbacks both 0 (dim 1); `φ(q,p)=(q,e^(−q)p)`: `φ*σ₁=ω`, fixes Q | holds without compactness | none |
| Relative Darboux, hypothesis needed | `Q=M=ℝ²`, `σ₁=2ω` | pullbacks differ; φ must be `id` near `q₀`, `id*σ₁=2ω≠ω` | hypothesis necessary | none |
| Relative Darboux, linear step | `f=2·id` on a symplectic plane | `ω(2∂q,2∂p)=4≠1` | Witt compatibility needed, as stated | none |
| Weinstein (:173) | unit circle in ℝ² | `φ(θ,r)=(θ,(1−r²)/2)`: `φ*(dθ∧dp)=r dr∧dθ=ω`; `(r²−1)/2` gives `−ω` | holds; fibre negation fixes zero section | none |
| Weinstein, degenerate | `Q=∅`; zero section of `T*S¹` | `U=V=∅`; `φ=id` | holds | none |
| Coisotropic (:192) | `S³⊂ℝ⁴` | `k=3`, `ker σ` of dim `1=2n−k`, so `dim M=dim N` forced | consistent | none |
| Coisotropic, `hcj` needed | `S¹→ℝ²` Lagrangian, `S¹→ℝ⁴` isotropic | pullbacks both 0; no diffeomorphism of nonempty opens of ℝ² and ℝ⁴ | hypothesis necessary, stated | none |
| R01 statement | `T*S¹`, Q zero section, `f=id`, `A=[[1,c],[0,1]]` | det 1, `A∂q=∂q`; `Φ(q,p)=(q+cp,p)`: `Φ*ω=ω`, `dΦ=A` | true | R01 |
| R01 wrong models | `A=diag(1,2)`; `A=diag(2,1/2)` | det 2, excluded by `hAω`; `A∂q=2∂q≠∂q`, excluded by `hAi` | both laws discriminate | R01 |
| R02 statement | free particle on ℝ, `S=−(q−Q)²/2t` | mixed Hessian `1/t`; `φ(q,p)=(q+tp,p)` | true | R02 |
| R02 wrong model | `S=q²+Q²` | mixed Hessian 0; relation `{p=2q}` is not a graph | excluded by `hH` | R02 |
| R01–R03 elaboration | scratch copy of `Suggested.lean` plus four statements | exit 0; `sorry` warnings at 219, 253, 277, 289 only | statable | R01–R03 |
| `canonicalForm` chart value | `T*ℝ`, `(∂q,∂p)` | `1`; `−ω` gives −1, `2ω` gives 2 | sign pinned | none |
| Consumer Check (:671) | translation, `H=p` | `ι_(∂q)ω=dp=dH` | holds | none |
| Fibre translation (:82) | `α=a(q)dq` | `−d(λ+π*α)=ω−π*dα` | holds | none |
| Liouville field (:271) | `Z=p∂p` | `ι_Zω=−p dq=−λ`; `L_Zω=ω`; flow `(q,eᵗp)` | holds | none |
| Polar, SL case (:159) | `det A=1` | `det P=‖det A‖=1`, `det U=det A/‖det A‖=1` | agrees with the pin | R04 |
| `JPJ⁻¹=P⁻¹` (:229) | `S=diag(2,1/2)`, `n=1` | `JSJ⁻¹=diag(1/2,2)=S⁻¹` | holds | R04 |
| Killing form (:237) | `sp(2,ℝ)` | `(2n+2)tr(XY)=4tr(XY)`, the `sl₂` value | holds | none |
| Kodaira–Thurston `b₁` (:292) | Heisenberg lattice × circle | `H₁` of the lattice quotient has rank 2, so `b₁=2+1=3`, odd | holds | R05 |
| Gate and depcheck | prescribed commands | content counters 0, `outside-folder=4` (authorized); 234 roadmaps, 2265 edges, 0 problems | pass | none |

## Not verifiable

- Weinstein, *Symplectic manifolds and their Lagrangian submanifolds*, Adv. Math. 6 (1971). The sources service reports the DOI prefix `10.1016` as paywalled, and its arXiv search failed with HTTP 429. It is not read; the README cites it only beside Cannas da Silva, whose Thms. 8.4 and 9.3 were checked.

## Source issues

- **Misprint** in Cannas da Silva, *Lectures on Symplectic Geometry* at §5.2, p. 32: the source says the cyclic sum of the generating function equals the sum of the side lengths; it should be minus that sum, since the generating function is minus the chord length; affects nothing.
