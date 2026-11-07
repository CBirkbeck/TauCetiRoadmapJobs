# Review of JacobianChallengePartII (pull request #1225 at 1e5949a)

**Verdict:** needs changes

Incremental re-review of the 59 lines changed since d8d695f (41 in the README, 18 in `Suggested.lean`). Both findings of the previous report are repaired and the gate now passes; the repair of R02 introduced two P3 inaccuracies in the new supplier text. No P1 or P2.

## R01 (P3) — The new Tau Ceti row drops a hypothesis of `relativePicardFiberDegree_abelMap_app_of_mem`

**Location:** `TauCetiRoadmap/JacobianChallengePartII/README.md:85`: “`relativePicardFiberDegree_abelMap_app_of_mem` (for `f` proper and smooth of relative dimension one, a divisor of degree `d` has fibre degree `d` …)”.

**Claim:** The row states the supplier's hypotheses as properness and smoothness of relative dimension one. At the pin the theorem also requires geometrically connected fibres: it sits under `variable … [IsProper f] [SmoothOfRelativeDimension 1 f] [GeometricallyConnected f]` (`TauCeti/AlgebraicGeometry/PicardFunctor/Abel/PicZero.lean:63–64`), and the elaborated type printed by `#check @TauCeti.AlgebraicGeometry.relativePicardFiberDegree_abelMap_app_of_mem` carries `[AlgebraicGeometry.GeometricallyConnected f]` as its third instance binder. The roadmap's use in §2.1 is sound, because the conventions assume geometrically connected fibres; but the contract row is the roadmap's statement of what the pin proves, and it understates the hypotheses. The neighbouring rows are accurate (`abelMap` for every `f`; `graphDivisor` separated and smooth of relative dimension one; `graphDivisorDegreeOne` and `abelJacobiMapOfDegree` proper, relative dimension at most one, smooth of relative dimension one; `relativePicardDegreeZeroFunctorBaseChangeIso` with geometrically connected fibres), so only this one needs the clause.

**Witness:** `Abel/PicZero.lean:63–64` (the `variable` line) and `:109–117` (the theorem, whose statement mentions `f`, so the instance binder is included).

**Exact repair:** in the row, write “(for `f` proper and smooth of relative dimension one with geometrically connected fibres, a divisor of degree `d` has fibre degree `d` …)”. No statement or Lean declaration changes.

## R02 (P3) — The §2.3 route through `abelJacobiMapOfDegree d` is written for every `d` but the pinned map takes `d : ℕ`

**Location:** `TauCetiRoadmap/JacobianChallengePartII/README.md:372`: “`[d]∘i_{O(x₀)}` sends `x` to the class that `abelJacobiMapOfDegree d` assigns to the degree-`d` divisor `dΓ_x`, so the identity follows from `abelJacobiMapOfDegree_app_mul` and the base-point laws.”

**Claim:** §2.3 asserts `i_α = t_β ∘ [d] ∘ i_{O(x₀)}` for the `d ∈ ℤ` of §2.2, which explicitly includes `d = 0` and negative `d` (§2.2's Non-example uses `d = −1`). The pinned `abelJacobiMapOfDegree` is indexed by `d : ℕ` and is defined on `Div^d_{X/S}`, the relative effective Cartier divisors of degree `d` (`Abel/Degree.lean:110–116`; the `#check` prints `(d : ℕ) → (relativeEffectiveCartierDegreeSubfunctor f d).toFunctor ⋙ uliftFunctor ⟶ …`). For `d < 0` there is no effective divisor `dΓ_x`, so the sentence as written has no meaning there; the statement itself remains true, since `[d] = [−1] ∘ [−d]` and `i_α` is an inverse in the Picard group, but the route cites the pinned lemma beyond its generality. For `d ≥ 0` the route is correct: `abelJacobiMapOfDegree_app_apply` gives `𝒪(dΓ_x) / 𝒪(x₀_T)^d = (𝒪(Γ_x)/𝒪(x₀_T))^d = i_{𝒪(x₀)}(x)^d`, and `dΓ_x ∈ Div^d` by `mul_mem_relativeEffectiveCartierDegreeSubfunctor_obj` iterated.

**Witness:** `Abel/Degree.lean:110` (`def abelJacobiMapOfDegree (d : ℕ)`), `:137–148` (`_app_mul`, additivity in `ℕ`-degrees); README §2.2 Non-example “With `α=O_E(−[0])` and `d=−1`, the map is `[−1]`”.

**Exact repair:** write the clause for non-negative degree and reduce the rest by inversion: “for `d ≥ 0`, `[d]∘i_{O(x₀)}` sends `x` to the class that `abelJacobiMapOfDegree d` assigns to the degree-`d` divisor `dΓ_x`, so the identity follows from `abelJacobiMapOfDegree_app_mul` and the base-point laws; for `d < 0` apply this to `−d` and invert in the Picard group.” No statement or Lean declaration changes.

## Previous findings

- R01 — repaired: `Suggested.lean:215–222` declares `overPullbackMonoidal` (`Functor.Monoidal.ofChosenFiniteProducts _`) and `overPullbackGrpObj` (`Functor.grpObjObj`) before `triangularBaseChange`, whose signature has no `letI`; README.md:59 names both instances; gate `statement-hygiene=0`.
- R02 — repaired: README.md:26 lists the Abel-map, graph-divisor and presheaf base-change natives; rows at README.md:84–86 name their modules; §§0.2, 0.3, 1.2, 1.3, 2.1, 2.3 cite them with `CommGrpObj.ofRepresentableBy`; the docstring's Layers 2–3 bullet reads as requested. The new row and the §2.3 route carry the two inaccuracies above (R01, R02 of this report).

## Verified sound

:robot: Independent AI review. Incremental re-review of 59 changed lines since d8d695f, at the pins the head's `lake-manifest.json` records (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`). The outside-folder diff against `origin/main` is empty. The worktree was left unchanged; probe copies live in the job's scratch directory.

**Gate and elaboration.** The worker's gate at this head and my rerun both pass:

```text
gate JacobianChallengePartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

`lake env lean` on a scratch copy of `Suggested.lean` (the file plus `#check` lines appended): nine `declaration uses sorry` warnings (lines 79, 91, 110, 129, 140, 158, 178, 210, 226) and nothing else from the file itself. The dependency check, rerun as the brief prescribes:

```text
depcheck: 240 roadmaps, 2371 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The *Needs:* lines the diff touched (§§0.2, 0.3, 1.3, 2.1, 2.3) add only Tau Ceti and Mathlib names and §0.3; §2.1 drops “JacobianChallenge, Layer C” in favour of the pinned natives, and no roadmap supplier was added. No declared gap; no `set_option`, no sorry'd data, no copied passage, no algorithm, no pull-request number in the folder.

**Signature audit.** `#check @name` for the two new instances and the three declarations the diff touches, elaborated in the scratch copy: `overPullbackMonoidal : (f : S' ⟶ S) → (Over.pullback f).Monoidal`; `overPullbackGrpObj : (f : S' ⟶ S) → (A : Over S) → [GrpObj A] → GrpObj ((Over.pullback f).obj A)`; `triangularBaseChange` prints the same type as at d8d695f (`let F := Over.pullback f; have C := PreservesProduct.iso F …; F.map (triangularForward A n) ≫ C.hom = C.hom ≫ triangularForward (F.obj A) n ∧ …`), with the pulled-back group law now found by instance resolution. `signatures.md` agrees (14 declarations, none with a dropped binder). Neither instance has a section variable to lose; both bodies are real.

**The cited natives at the pin** (namespace `TauCeti.AlgebraicGeometry`; the two `BaseChange` modules had no object file in the worktree and were built with `lake build` of those modules before the `#check`):

| Name | File and line at Tau Ceti 2fd255d9 | Elaborated hypotheses | README row |
| --- | --- | --- | --- |
| `graphDivisor` | `EffectiveCartierDivisor/Graph.lean:100` | `[IsSeparated f] [SmoothOfRelativeDimension 1 f]`; `yoneda.obj (Over.mk f) ⟶ Div_{X/S}` | agrees (:84) |
| `graphDivisorDegreeOne`, `IsIso` | `EffectiveCartierDivisor/Representable.lean:129, 151` | `[IsProper f] [RelativeDimensionLE 1 f] [SmoothOfRelativeDimension 1 f]`; into `Div¹_{X/S}` | agrees (:84) |
| `graphDivisorDegreeOne_app_basePoint` | `Representable.lean:166` | base point ↦ `relativeEffectiveCartierDegreeOneSection f x₀ hx₀` | agrees (:84) |
| `abelMap` | `PicardFunctor/Abel/Basic.lean:84` | no hypothesis on `f`; `Div_{X/S} ⋙ uliftFunctor ⟶ relativePicardPresheaf f ⋙ forget`, `D ↦ (class of ideal sheaf)⁻¹` | agrees (:85) |
| `relativePicardFiberDegree_abelMap_app_of_mem` | `Abel/PicZero.lean:109` | `[IsProper f] [SmoothOfRelativeDimension 1 f] [GeometricallyConnected f]` | R01 |
| `abelJacobiMap`, `_app_basePoint` | `Abel/Jacobi.lean:89, 111` | `[IsSeparated f] [SmoothOfRelativeDimension 1 f]`, section `hx₀`; `x ↦ 𝒪(Γ_x)/𝒪(x₀_T)` | agrees (:85) |
| `abelJacobiMapOfDegree`, `_app_mul` | `Abel/Degree.lean:110, 137` | `[IsProper f] [RelativeDimensionLE 1 f] [SmoothOfRelativeDimension 1 f]`, section, `d : ℕ` | agrees on hypotheses; R02 on `d` |
| `relativePicardPresheafBaseChangeIso` | `PicardFunctor/BaseChange.lean:115` | no hypothesis; `relativePicardPresheaf (pullback.fst g f) ≅ (Over.map g).op ⋙ relativePicardPresheaf f` | agrees (:86) |
| `relativePicardDegreeZeroFunctorBaseChangeIso` | `PicZero/BaseChange.lean:158` | `[IsProper f] [SmoothOfRelativeDimension 1 f] [GeometricallyConnected f]` | agrees (:86) |
| `relativePicardDegreeZeroFunctor` | `PicZero/Basic.lean:374` | the degree-zero presheaf (same three hypotheses) | agrees (:86) |
| `CommGrpObj.ofRepresentableBy` | `Mathlib/CategoryTheory/Monoidal/Cartesian/CommGrp_.lean:37` | `[CartesianMonoidalCategory C] [BraidedCategory C]`, `F : Cᵒᵖ ⥤ CommGrpCat`, `(F ⋙ forget).RepresentableBy X` | agrees (:67, :180, :253) |
| `Functor.Monoidal.ofChosenFiniteProducts` | `Mathlib/CategoryTheory/Monoidal/Cartesian/Basic.lean:937` | `noncomputable def`, `[PreservesFiniteProducts F]` | agrees (:65, “a definition, not an instance”) |
| `Functor.grpObjObj` | `Mathlib/CategoryTheory/Monoidal/Grp.lean:577`, scoped instance at `:586` (`scoped[CategoryTheory.Obj]`) | `[F.Monoidal] [GrpObj G] → GrpObj (F.obj G)` | agrees (:65, “a scoped instance”) |

**Seeded sample in the changed passages.** Only §0.3 and §1.2 of the sample fall in the diff, and the diff changes their Lean-name citations, not their claims or locators; both were reopened in the cache (`kleiman` = arXiv math/0504020v1, `yuan` = arXiv 2108.05625v4).

| Target | Locator opened | Support |
| --- | --- | --- |
| 0.3 Representability | `kleiman` lines 1309–1321 (Theorem 4.8, pp. 27–28: projective Zariski-locally, flat, integral geometric fibres; part (2) for `S` noetherian and `X/S` projective; the proof reduces to `S` noetherian, `X/S` projective) | The Lean's affine noetherian base with an ample class is that reduction; the README registers the gluing. Unchanged. |
| 1.2 Relative Jacobian | `kleiman` lines 2435–2438 (Remark 5.26, p. 51: `J := Pic⁰_{X/S}` exists and is a projective abelian scheme for `X/S` projective smooth with connected curve fibres of genus `g > 0` over noetherian `S`); `yuan` line 978 (§2.2.1, p. 29) | Matches the paragraph's definition as the representing object of `relativePicardDegreeZeroFppfSheaf π` with the transported commutative group law. |
| 2.1 (touched by the repair) | `kleiman` lines 1299–1304 (Definition 4.6, p. 27: the Abel map `Div_{X/S}(T) → Pic_{X/S}(T)`, `D ↦ 𝒪_{X_T}(D)`, with the scheme morphism when `Pic_{X/S}` exists) | Exactly the shape of the repaired route: `graphDivisor ≫ abelMap` on presheaves, then representability for the scheme morphism. |

The other sampled targets (0.0, 1.1, 1.3a, 1.4, 2.6, 3.3, 4.1, 4.5, 4.6, 4.8, 5.6, 6.3, 7.2) are untouched by the diff; the verification of the previous reports stands.

**Computed adversarial pass.** Rows for every changed statement; the previous reports' rows carry forward for every statement the diff leaves untouched (the three descent theorems, §§0.1, 0.3 Lean, §4.8–4.9, `triangularForward`, `triangularInverse`, `triangularIsomorphism`: report ~3's table and the 61 rows of ~2 it cites). `E` is an elliptic curve with origin `e` over a field `k`, `l/k` a finite extension of degree at least two.

| Statement | Instances tried | Values on each side / excluded model | Result; change |
| --- | --- | --- | --- |
| `overPullbackMonoidal` | `f = 𝟙 S`; `f : Spec l → Spec k` | `Over.pullback f` preserves finite products (Mathlib instance found by `#check`); the monoidal structure is the one by chosen products, so `μ : F(A) ⊗ F(B) ≅ F(A ⊗ B)` is the product comparison, which is what `PreservesProduct.iso` in `triangularBaseChange` uses. A different monoidal structure on the same functor (the wrong model Mathlib's docstring warns about) would make the two comparisons disagree; naming the instance pins it. | Correct. None. |
| `overPullbackGrpObj` | `A = E` over `Spec k`, `f : Spec l → Spec k` | `GrpObj (F.obj E)` is the pulled-back addition: on `T`-points over `l`, `(x, y) ↦ x + y` computed in `E(T)`; the inverse is `[−1]`. The trivial group structure (constant `e`) is excluded because `mul` is `μ ≫ F.map mul`, not a constant. | Correct. None. |
| `triangularBaseChange`, `n = 0` | any `A`, `f` | both maps are `Pi.lift (π₀) = 𝟙`; `F.map 𝟙 ≫ C.hom = C.hom = C.hom ≫ 𝟙`. | Holds. None. |
| `triangularBaseChange`, `n = 1`, `A = E` | `T`-point `(x₀, x₁)` of `E_l × E_l` | left: pull back `(x₀, x₁ − x₀)` then compare; right: compare then `(x₀, x₁ − x₀)` in the pulled-back law, which is the same subtraction coordinatewise; equal. Inverse: `(x₀, x₁ + x₀)` both ways. | Holds; wrong model (`x₀ − x₁`) would fail the forward row. None. |
| `triangularBaseChange`, non-abelian `A` | `A = GL₂` over `S`, `f` any | forward `(a, b) ↦ (a, b·a⁻¹)` and inverse `(a, c) ↦ (a, c·a)`, right division both sides; base change preserves `comp_div` order. | Holds without commutativity. None. |
| §2.1 route, degree of `graphDivisor ≫ abelMap` | `S = Spec k`, `X = E`, `T = Spec l`, `x ∈ E(l)` | `Γ_x ∈ Div¹` (`graphDivisorDegreeOne_ι`), so `relativePicardFiberDegree` of `𝒪(Γ_x)` is `1` at `ξ : Spec l → T` by `…_abelMap_app_of_mem` with `d = 1` (hypotheses: proper, smooth rel. dim. 1, geometrically connected: all hold for `E`). | Correct; the hypothesis `GeometricallyConnected` is needed in the lemma and present in the conventions (R01 is about the row's wording). |
| §2.1 route, naturality | `φ : Spec l' → Spec l`, `x ∈ E(l)` | `graphDivisor_app_comp`: `Γ_{φ ≫ x} = φ^*Γ_x`; `abelMap` natural; so `a₁(x_{l'}) = a₁(x)|_{l'}`. | The “pullback law of the diagonal” is exactly this. None. |
| §2.1 bullet, pointed comparison | `x₀ = e`, `x ∈ E(T)` | `abelJacobiMap_app_apply`: `𝒪(Γ_x)/𝒪(Γ_{e_T})`, i.e. `a₁(x) − a₁(x₀)`; at `x = e_T` it is `1` (`_app_basePoint`). | Correct. None. |
| §2.3 route, `d = 2`, `α = 𝒪(2e)` | `x ∈ E(T)` | `abelJacobiMapOfDegree 2` on `2Γ_x`: `𝒪(2Γ_x)/𝒪(e_T)^2 = (𝒪(Γ_x)/𝒪(e_T))^2 = [2] i_{𝒪(e)}(x)`; `β = [2e − α_T] = 0`; `i_α(x) = [2Γ_x − 2e] = [2]x`. Equal. | Holds for `d ≥ 0`. None. |
| §2.3 route, `d = −1`, `α = 𝒪(−e)` | `x ∈ E(T)` | statement: `i_α(x) = [−Γ_x + e] = −i_{𝒪(e)}(x) = [−1] i_{𝒪(e)}(x)`, `β = [−e − α_T] = 0`: true. Route: `abelJacobiMapOfDegree (−1)` does not exist (`d : ℕ`), and `−Γ_x` is not an effective divisor. | Statement true, route overreaches: R02. |
| §0.2 bullet, presheaf base change of `Picᵈ` | `g : Spec l → Spec k`, class of `𝒪(e)` on `E` | `relativePicardPresheafBaseChangeIso` sends it to the pullback class; fibre degree `1` on both sides (`relativePicardFiberDegree_relativePicardPresheafBaseChangeIso_hom_app`, `PicZero/BaseChange.lean:87`, hypotheses quasi-compact and separated: hold). For `d = 0`, `𝒪` ↦ `𝒪` in `relativePicardDegreeZeroFunctor`. | Correct; the fppf-sheaf statement stays with §7.6.1 as the bullet says. None. |
| §1.3 route | `g : Spec k[ε]/ε² → Spec k`, `X = E` | the presheaf comparison restricted to degree zero identifies `Pic⁰(E_A)/Pic(A)` on both sides; the tangent space `H¹(E, 𝒪)` is seen (the presheaf is the sheaf here since `E` has a `k`-point). | Correct. None. |
| §0.3 / §1.2, `CommGrpObj.ofRepresentableBy` | `E` over `k` | `GrpObj.ofRepresentableBy` gives the law `x · y = x + y` with no commutativity field; `CommGrpObj.ofRepresentableBy` adds `IsCommMonObj` from `CommGrpCat`; the Jacobian is commutative, so the previous name named the wrong structure. `Over S` is braided as a cartesian monoidal category, so the instance argument is available. | Correct now. None. |
| README.md:65 claims on Mathlib | `Functor.Monoidal.ofChosenFiniteProducts`, `Functor.grpObjObj` | `noncomputable def` at `Cartesian/Basic.lean:937`; `abbrev` at `Monoidal/Grp.lean:577` with `scoped[CategoryTheory.Obj] attribute [instance]` at `:586`. | The parenthetical claims are exact. None. |
| Docstring Layers 2–3 bullet | `graphDivisor ≫ abelMap` | elaborates as a natural transformation `yoneda.obj (Over.mk f) ⟶ Div_{X/S}` followed by `Div_{X/S} ⋙ uliftFunctor ⟶ relativePicardPresheaf f ⋙ forget` (the `uliftFunctor` is needed to compose; the docstring writes the composite informally). No representing torsor exists at the pin (grep of `TauCeti/AlgebraicGeometry` for a representing object of `Pic¹`: none). | Correct. None. |

**One-tactic probes.** On a scratch copy, three copies of `triangularBaseChange` closed with `simp`, with `intro F C; exact ⟨rfl, rfl⟩`, and with `intro F C; constructor <;> ext <;> simp`: all three fail (`unsolved goals` with the `piComparison` equations left; `rfl` type mismatch; two unsolved `Over.Hom.left` goals). The two instances are definitions with real bodies, needed for the headline to be statable, and are not padding. No other statement changed.

**Headlines.** Unchanged since the previous report; the docstring's list of unstatable headlines was re-read after the repair and still names, per layer, the missing carriers (abelian schemes and polarizations, representing torsors, algebraic equivalence, multiplication isogenies, semi-abelian Picard schemes and level structures).

**Ownership.** `roadmaps grep` for `abelJacobiMapOfDegree|relativePicardPresheafBaseChangeIso|graphDivisorDegreeOne|overPullbackMonoidal` over main and the 466 open roadmap pull requests: hits only in this folder and in the draft revision of the parent, JacobianChallenge #1892 (its README lines 457–504), which consumes the same natives. The natives are owned by the pin; neither roadmap restates them. The previous report's note stands: #1892's Layer D plans `HasPicardScheme f`, the degree pieces and `Pic⁰_{X/S}` representing `relativePicardDegreeZeroFppfSheaf f` over a general base (its lines 436–476), which are this roadmap's §§0.1–0.3 on main's parent (field case only). A revision pull request is never a supplier and this pull request is the earlier one, so no change is requested here; the overlap is for #1892 to settle before both merge. `overlaps.md` lists no dropped or revision-only id and no other pull request changing this roadmap. `citations.md`'s 17 “Lean names found nowhere” are this file's fourteen declarations and the three supplier API names of AbelianSchemesAndArithmeticModuli (`AbelianScheme.poincare`, `Polarization.graphBundle`, `Polarization.principal_iff`) resolved by earlier reports.

## Not verifiable

- Zhang, *Gross–Schoen cycles and dualising sheaves*, Lemmas 2.2.1–2.2.3 (§4.9): `uncertified` in an earlier round; the passage is unchanged and was not reopened.
- Serre, *Lectures on the Mordell–Weil Theorem*, §5.6 (§3.4): `uncertified`; unchanged, not reopened.
- Mumford–Fogarty–Kirwan, *Geometric Invariant Theory*, §6.2 (§3.13): `uncertified`; unchanged, not reopened.

No manifest or pull-request file was edited; nothing parks the review.

## Source issues

- none
