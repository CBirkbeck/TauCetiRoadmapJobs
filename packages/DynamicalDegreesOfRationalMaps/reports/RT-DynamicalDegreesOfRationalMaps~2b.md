<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17628#issuecomment-6905475030 -->
Red team round 2 pass b (claude) of f4b22ef

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) no Check separates `e(f)` from `e(g)` for the correspondence of a composite

   - **Location.** `packages/DynamicalDegreesOfRationalMaps/README.md:221` ("`(q_Y, q_Z) : W_{f,g} → Γ_g` is … generically finite of generic degree `e(f)`") and the Checks at `README.md:229–231`.
   - **Claim.** The Checks pin which of the two maps gives the degree.
   - **Witness.** All three Checks take `f = g` (`id, id`; `σ, σ`; `z², z²`), where `e(f) = e(g)`: values `1 = 1`, `1 = 1`, `2 = 2`. The wrong statement "degree `e(g)`" passes all of them. §4.4's route (`README.md:558`) depends on the choice.
   - **Repair.** Add to the §1.3 Checks: "Which map gives the degree: for `f = (z ↦ z²)` and `g = id` on `ℙ¹`, `W_{f,g}` is the closure of `{(x, x², x²)}` and `(q_Y, q_Z)` maps it onto the diagonal `Γ_{id} ≅ ℙ¹` by `x ↦ x²`, of degree `2 = e(f)`, not `e(g) = 1`. For `f = id` and `g = (z ↦ z²)`, `W_{f,g}` is the closure of `{(x, x, x²)}` and `(q_Y, q_Z)` is an isomorphism onto `Γ_g`, of degree `1 = e(f)`, not `e(g) = 2`." Tested: both instances refute "degree `e(g)`".

2. **F02** (P3) the Check of the cycle pullback `f^*(M_1 ⋯ M_k)` holds for the reversed operator

   - **Location.** `packages/DynamicalDegreesOfRationalMaps/README.md:494` ("`f^*(M_1 ⋯ M_k) = π_{1*}(c_1(π_2^*M_1) ∩ ⋯ ∩ [Γ_f])`") and its only Check, `README.md:503` ("for `X = Y = ℙ¹`, `f = id` …").
   - **Claim.** The Check pins the direction `π_{1*}π_2^*`.
   - **Witness.** The Check uses `f = id` three times (`M = O(1)`, `√2·O(1)`, `0`). For `f = id` the reversed operator `π_{2*}(c_1(π_1^*M) ∩ [Γ_f])` gives the same values `[point]`, `√2[point]`, `0`.
   - **Repair.** Append to that Check: "Direction: for `f(z) = z²` on `ℙ¹` and `M = O(1)`, `π_2^*M = O(2)` on `Γ_f ≅ ℙ¹`, so `f^*(M) = 2·[point]`, of degree `2 = deg_{1,H}(f)`. The reversed operator `π_{2*}(c_1(π_1^*M) ∩ [Γ_f])` gives `π_{2*}[point] = [point]`, of degree `1`." Tested: `2 ≠ 1`, and `2` is the value of §4.2 (`deg_d = e(f)·(M^d) = 2·1`).

3. **F03** (P3) the normalisation `C_k(ω)` in the infimum formula has no witness

   - **Location.** `packages/DynamicalDegreesOfRationalMaps/README.md:604` ("it equals `inf_{n ≥ 1} (C_k(ω)·deg_{k,ω}(f^n))^{1/n}` with `C_k(ω) = (d − k + 1)^k/(ω^d)`") and the Checks at `README.md:612–615`; `Suggested.lean:338–340`.
   - **Claim.** The Checks show that the constant belongs in the formula.
   - **Witness.** No Check has `inf_n deg^{1/n} ≠ λ_k`: for morphisms of `ℙ^d` the infimum without the constant is also `a^k`; in dimension `0` it is `inf_n [L:K]^{1/n} = 1 = λ_0`. The formula without `C_k(ω)` (as in dinhsibony2005 line 259) passes every Check.
   - **Repair.** Add to the §5.1 Checks: "The constant is needed: on `ℙ^d`, `d ≥ 1`, take the real polarization `ω = H/2` and `f = id`. Then `deg_{k,ω}(f^n) = (ω^d) = 2^{−d}` for every `n`, and `λ_k = lim (2^{−d})^{1/n} = 1`. The infimum without the constant is `inf_n (2^{−d})^{1/n} = 2^{−d} < 1`, at `n = 1`. With `C_k(ω) = (d − k + 1)^k·2^d` the terms are `((d − k + 1)^k)^{1/n}`, of infimum `1`." Tested: `2^{−d} ≠ 1`, and `inf_n ((d − k + 1)^k)^{1/n} = 1` (attained for `k = 0`, a limit for `k ≥ 1`).

4. **F04** (P3) `Scheme.canonicallyOverPullback` is used by an acceptance statement and absent from the Mathlib contracts

   - **Location.** `packages/DynamicalDegreesOfRationalMaps/Suggested.lean:210–211` ("the fibre product is a `K'`-scheme through its second projection (Mathlib's `AlgebraicGeometry.Scheme.canonicallyOverPullback`)") and `README.md:71` ("For the statements of `Suggested.lean`: …").
   - **Claim.** `README.md:71` lists the Mathlib declarations the statements use.
   - **Witness.** `mixedDegree_baseChange` applies `realIntersection K'` to `pullback (graph f ↘ Spec K) (Spec.map …)`; the `K'`-structure is the instance at `Mathlib/AlgebraicGeometry/Pullbacks.lean:816`. `grep canonicallyOverPullback README.md` returns nothing; §4.3 does not say which structure morphism is meant.
   - **Repair.** In `README.md:71`, after "cartesian squares `CategoryTheory.IsPullback` (…Defs.lean:61)", add: ", and the instance `AlgebraicGeometry.Scheme.canonicallyOverPullback` (Mathlib/AlgebraicGeometry/Pullbacks.lean:816), which makes `pullback (M ↘ S) f` a `T`-scheme through its second projection, for `f : T ⟶ S`; `mixedDegree_baseChange` uses it for `Γ_f ×_K Spec K'` over `Spec K'`". In `README.md:535`, after "the fibre product `Γ_f ×_K Spec K'` over `K'`", add "(through its second projection, Mathlib's `Scheme.canonicallyOverPullback`)". No change to `Suggested.lean`.

Four P3 findings (S01–S04): three conventions without a discriminating Check, and one pinned declaration that `Suggested.lean` uses and the supplier contracts do not list. No P1 or P2. The ten findings of round 1 are all repaired, and no repair introduced an error.

## Round 1 findings at this head

| id | status | repaired passage (quoted) | witness re-tested |
| --- | --- | --- | --- |
| 1a/F01 | repaired | `Suggested.lean:59–61`: "For a reduced `X` the image does not depend on the representative, and for `K`-rational maps between `K`-schemes it lies in the closed subscheme `X ×_K Y`"; `README.md:213` new Check | `k[x,y]/(xy,y²) → k[x,x⁻¹]` has kernel `(y)`: images `X` and `Spec k[x]`; `a ↦ a + a′y` is a ring map (`y² = 0`), equals the structure map on `D(x)`, sends `t ↦ t + y`. Both excluded by "reduced". |
| 1a/F02 = 1b/F01 | repaired | `README.md:151`: "integrality and dimension of the graph, and the properties of its two projections (§1.2)" | Lean conclusion has 5 conjuncts, none `IsProjectiveOver`; bullet now names the same 5. |
| 1a/F03 = 1b/F02 | repaired | `algebraicEntropy_baseChange` absent from `Suggested.lean` (32 declarations) and from the README; `README.md:671`: "follows term by term over `0 ≤ k ≤ d` from `dynamicalDegree_baseChange` … and from `dynamicalDegree_birational_conj`" | `README.md:155` now claims field-extension invariance for `λ_k` only. |
| 1a/F04 | repaired | `Suggested.lean:237–248` has no `hL₂d`; `README.md:553`: "No positivity of `L_2` is assumed"; Check at `README.md:572` | `ℙ¹×ℙ¹`, `L_2 = O(1,0)`, `L_1 = L_3 = O(0,1)`: `0·0 = 0 ≤ 2·1·1 = 2`. With `L_3 = O(1,0)`: `0·1 = 0 ≤ 2·1·0 = 0`. `d = 0`: `[K_2:K][K_1:K] = [K_1:K][K_2:K]`. |
| 1b/F03 | repaired | `README.md:45`: "By AlgebraicModuliForArithmeticGeometryPartII §1.6, with §2.2 here … this is the same as `L` nef and big in the sense of section growth"; contract bullet `README.md:108`; `README.md:394`, `:476` | Supplier §1.6 on main (its README line 364): integral proper `k`-scheme, growth along sufficiently divisible `m`, and for nef `L` big ⇔ `(L^n·V) > 0`. Same hypotheses. |
| 1b/F04 | repaired | `README.md:91`: "`TauCeti.AlgebraicGeometry.IsModification` (TauCeti/AlgebraicGeometry/Morphisms/Modification/Basic.lean:53)"; `README.md:197`, `:204`, `:131`, `:20`, `:262` | Pin line 53: `class IsModification (f : X ⟶ Y) : Prop extends IsProper f where`. |
| 1b/F05 | repaired | `README.md:131`: "an alteration from an integral `X_1` with an open immersion into a regular scheme projective over the base field" | Supplier §4.19 on main (its README lines 7739–7742) says the same; no finite extension. |
| 1b/F06 | repaired | `Suggested.lean:254–255`: "Dang, Theorem 1 (ii); Dang–Favre, Theorem 1.3 (second item)"; `:279–280`; `README.md:579` | dangfavre2021 lines 457–460: two-class comparison. dinhsibony2005 lines 260–262: conjugacy estimate inside the proof of Corollaire 7. |

## Dependency check

    depcheck: 240 roadmaps, 2257 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The roadmap is at line 361 of `merge-order/ORDER.txt`; its suppliers are at lines 35, 36, 75, 275, 357, 360 or on main (SchemeAndStackFoundations, StableReduction). Declared gaps: none (`design/plan.json` has `"gaps": []`), and no citation needed one.

## Record of the pass: `Suggested.lean`

The file has no `variable` block; every binder is in the declaration's own signature. I compared each elaborated type in the job's signature list with its README statement: 32 declarations, none changed, none lost a binder. Standing context of every theorem below unless noted: `K` a field, `X` (and `Y`, `X_i`) with `[X.Over (Spec K)] [IsIntegral X] [X.IsProjectiveOver K]`, `topologicalKrullDim X = d`.

| declaration (layer) | instances tried | values computed | result |
| --- | --- | --- | --- |
| `graph`, `graphFst`, `graphSnd` (1; no instance arguments) | `id`; `z ↦ z²`; non-reduced `k[x,y]/(xy,y²)` | diagonal; `Γ ≅ ℙ¹`, `π_2` of degree 2; two representatives give `X` and `Spec k[x]` | docstring scoped to reduced `X`; sound |
| `topologicalDegree` (1; `[IsIntegral X] [IsIntegral Y] [f.IsDominant]`) | `z²` in char 2; projection `ℙ² ⤏ ℙ¹` | 2 (inseparable counted); junk 0 | sound |
| `graph_isIntegral_and_projections` (1; `f.IsOver`) | arbitrary `representative` not chosen over `K`; constant map; `X × Y` absolute | representative agrees with a `K`-map on a dense open, `V` reduced, `Spec K` separated ⇒ it is over `K`; `π_2` not surjective for the constant map, and the conjunct is conditional on dominance; `Γ → X ×_K Y → X` is closed then proper | true |
| `numericalIntersection` (2; `[X.Over (Spec K)]`) | `r = 0`; `r = 1`, `O(−2)` on `ℙ¹`; `P = n_1² + n_1n_2` | `h⁰(O_X)`; `(0−1) − (1−0) = −2`; mixed difference `2−1−0+0 = 1` | sound |
| `realIntersection` (2) | `[O(1,0)]+[O(0,1)]` vs `[O(1,1)]`; `[O(1,0)]+[O(0,1)]−[O(1,1)]` | `0+1+1+0 = 2 = 2`; `2−4+2 = 0` | sound |
| `IsNef` (2) | `−O(1)` on `ℙ¹`; `2[O(1,1)] − [O(1,0)]`; supplier's `IsNef` | `−1 < 0`; degrees 2, 1 ≥ 0; same curves and same `intersectionNumber` as AlgebraicModuliForArithmeticGeometryPartII `Suggested.lean:116` | sound, same convention |
| `khovanskii_teissier` (3; `dim V = m + 2`) | `m = 0`, `ℙ¹×ℙ¹`: `(1,0),(0,1)`; `(2,1),(1,1)`; `E×E` boundary class; `ℙ² ⊔ ℙ²` | `0·0 ≤ 1`; `4·2 = 8 ≤ 9`; `0·2 ≤ 9`; `25 > 16` but not integral | true |
| `siu_inequality_products` (3; `dim V = i + j`) | `i = 0`; `j = 0`; `i = j = 1` on `ℙ¹×ℙ¹` with `B = O(1,1)`; `(ℙ¹)³` with `(i,j) = (1,2)` and `(2,1)`; `B = O(1,0)` | equality; equality; `2·1 ≤ 2·1·1`; `6 ≤ 3·2·1 = 6`, `6 ≤ 4·1·2 = 8`; `0 ≤ 2` | true |
| `mixedDegree` (4; `[X.Over (Spec K)]`) | `z²`, `H`: `(p,q) = (1,0)`, `(0,1)` | 1; 2 | index convention as README |
| `mixedDegree_pos` (4) | `ω = O(1,0)+O(0,1)`; `d = 0` | `(ω²) = 2 > 0`; `[L:K] > 0` | true |
| `mixedDegree_boundary` (4) | `d = 0`; `z²`; Frobenius | `[K(X):K] = e(f)·[K(Y):K]`; `(1, 2)`; `e = p^d` | true |
| `mixedDegree_baseChange` (4; extra `[(graph f).Over] [(graphFst f).IsOver]`) | `ℙ¹_ℂ` over `ℝ`, `id`, `K' = ℂ`; `p + q ≠ d` | `2 = 1 + 1` over two diagonals; flat base change holds degree by degree, so `hpq` is harmless | true; see S04 |
| `mixedDegree_comp_le` (4) | `z²∘z²`; Cremona; `d = 0`; `L_2` not big; `E×E` | `1·4 ≤ 1·2·2`; `1·1 ≤ 2·2·2`; equality; `0 ≤ 2`; `2·0 ≤ 2·3·3` | true |
| `exists_mixedDegree_comparison` (4) | `O(1,1)`, `O(2,1)` and the swap; `f = id` | `C = 9`, ratio `5/2`; `(ω'²) ≤ C(ω²)`: `4 ≤ 18` | true |
| `isDominant_partialIso` (4; proved) | — | body is three library steps; it makes the conjugate typecheck | kept (needed by two statements) |
| `exists_mixedDegree_birational_comparison` (4) | `φ` linear automorphism of `ℙ²`, Cremona | `2 ≤ C·2` | true; composite is `φ∘f∘φ⁻¹` on `Y` |
| `iterate`, `isDominant_iterate` (5; `[IrreducibleSpace X]`) | `n = 0, 1, 2` | `id`, `f.comp id = f`, `f.comp f` | sound |
| `dynamicalDegree`, `algebraicEntropy` (5) | `k > d` with `d = 0` | `d − k = 0` in `ℕ`, intersection of 1 class on a point is 0, limit 0, `log 0 = 0` | junk values do not falsify any statement below |
| `tendsto_dynamicalDegree` (5) | `n = 0` term; `d = 0`; `ω = H/2`, `f = id` | `x^{1/0} = 1`; `(1/[L:K]·[L:K])^{1/n} = 1`; infimum `1 = λ_k` | true; see S03 |
| `one_le_dynamicalDegree`, `dynamicalDegree_eq_of_polarizations` (5) | Cremona; `H` vs `H/2` | `λ_1 = 1`; both limits 1 | true |
| `dynamicalDegree_iterate` (5) | `m = 0`; `z²`, `m = 2` | `λ_k(id) = 1 = λ^0`; `4 = 2²` | true |
| `dynamicalDegree_zero_and_top` (5) | `d = 0`; Frobenius | `1 = e = 1`; `p^d` | true |
| `dynamicalDegree_log_concave` (5; `1 ≤ k`, `k + 1 ≤ d`) | Fibonacci map; extension of `(x², y)` | `1·1 ≤ φ²`; `1·2 ≤ 4` | true |
| `dynamicalDegree_birational_conj` (5) | Cremona conjugated linearly | `1 = 1` | true |
| `dynamicalDegree_baseChange` (5; `GeometricallyIntegral`, `IsPullback`, `f'.IsOver K'`) | `ℙ¹_ℝ`, `K' = ℂ`, conjugation `c`; absolute Frobenius over `𝔽_p(t)` | `c` and the absolute Frobenius satisfy `hf` but are not over `K'`, so the binder `f'.IsOver` excludes them; `λ = (1, 2)` on both sides for `z²` | true |
| `algebraicEntropy_iterate` (5) | `n = 0`; `z²`, `n = 3` | `0 = 0`; `3 log 2` | true |
| `algebraicEntropy_bounds` (5) | `d = 0`; `d = 1`; Fibonacci | `0 ≤ 0 ≤ 0·0`; `log e ≤ log e ≤ log e`; `0 ≤ log φ ≤ 2 log φ` | true |

Headline theorems of the README (`README.md:149–156`): graph (§1.2), Khovanskii–Teissier and Siu for products (§§3.5–3.6), positivity, boundary values and field extension of the degrees (§§4.2–4.3), sub-multiplicativity and comparison (§§4.4–4.5), existence and properties of `λ_k` and `h_alg` (§§5.1–5.4): all stated. The projective-space formulas (§§6.2–6.4) are named in the module docstring as not statable, with the missing carrier (the rational map `[F_0 : ⋯ : F_d]`). Padding probe: no remaining declaration follows from one library lemma or one other declaration of the file.

## Record of the pass: README targets

| target | instances tried | values computed | result |
| --- | --- | --- | --- |
| Conventions (intersection, composition, degrees, Fibonacci) | `O(−2)`; `f = z²`, `g = z+1` at `z = 1`; `fib` | `−2`, truncation at 1 gives `−1`; `2` vs `4`; `fib 2 = 1`, `fib 3 = 2` | sound |
| 1.1 pullback, `e(f)`, multiplicativity, birationality | `z²` char 2; projection; cuspidal normalization | 2; junk 0; rank 1 vs fibre dimension 2 | sound |
| 1.2 graph | Cremona; projection from a point; constant map | blow-up at 3 points; `π_2` not an alteration; `π_2` not surjective | sound |
| 1.3 `W_{f,g}` | `ℙ¹_ℂ/ℝ`; `σ,σ`; `z²,z²`; `(z², id)`, `(id, z²)` | degrees 1; 1; 2; 2 and 1 | sound; S01 |
| 1.4 normalization, field extension, characterization | `𝔾_m → 𝔸¹` at the origin; conjugation on `ℙ¹_ℂ` | image `∅` vs point; not over `ℂ` | sound |
| 2.1 component formula | double point; line ∪ point; `V(xy)` | `2 = 2·1`; 1; `1 + 1` | sound |
| 2.2 Chow comparison | blow-up, `χ(O(bE)) = 1 + (b − b²)/2` | recomputed by the exact sequences and by Riemann–Roch: equal; `(E²) = −1` | sound |
| 2.3 real coefficients | `√2·O(1,0) + O(0,1)` | `2√2` | sound |
| 2.4 reduction | `ℙ¹_ℂ/ℝ`; pointless conic; `x² + ty²` over `𝔽_2(t)` | `c_V = 2, 1, 2`; chart `K[x,z]/(x²+t) = K'[z]` | sound |
| 3.1 nefness, ample approximation | route inequality; `E×E`, `m = 3`, `δ = 1/5`, `N = 100` | `(β·C) ≥ (ω·C) − n·(δ/2mn)·m(H·C) + (δ/2)(H·C) = (ω·C)`; determinants `−0.0463`, `0.5897`, `5897`; decomposition of `A + F_1 + F_2` recomputed coefficient by coefficient | sound |
| 3.2 Kleiman | double line; `O(1,−1)` | 2; `−2` | sound |
| 3.3 Siu | route: `vol(pA − qB) ≥ p^{r−1}(p(A^r) − rq(A^{r−1}B))`; `E×E` | expands correctly; `24 ≤ 30` | sound |
| 3.4 Hodge | `D'' = (H'²)φ^*D − (φ^*D·H')H'`; `H = 2L + E`; `E_1, E_2` | `(D''²) = (H'²)((H'²)(D²) − (D·H')²)`; `1 ≥ −3`, `4 ≥ 3`; `0 < 1` | sound |
| 3.5 Khovanskii–Teissier | `A + εI` on `E×E` | `(3+2ε)² − (12ε + 4ε²) = 9` | sound |
| 3.6 Siu for products | telescoping `y_{j+1}x_j ≤ (r−i+1)y_jx_{j+1}`; `ℙ² ⊔ ℙ²` | each of the four numbers identified on `Z_j`; `5 > 2` | sound |
| 4.1 mixed degrees, models, cycle pullback | models `(id, f)`, `(f, f∘f)`; `z²` | 1, 2 and `2 = 2·1`; `f^*(O(1)) = 2[pt]` | sound; S02 |
| 4.2 values, positivity, monotonicity | `1.5·O(1,0) + 0.5·O(0,1)`; `E×E` | `1.5 < 2`; `0 ≤ 3 ≤ 8` | sound |
| 4.3 normalization, field extension | cuspidal cubic | `ν^*O(1) = O(3)`, `deg_0 = 3` | sound |
| 4.4 sub-multiplicativity | route on `W` with `i = k` | `(A^kB^{d−k}) = e(f_1)·deg_k(f_2)`, `(B^d) = e(f_1)(L_2^d)`; `k = 0, d` equalities | sound |
| 4.5 comparison, conjugacy | four-copy chain; swap on `ℙ¹×ℙ¹`; swap on `E×E` | `C_1 = (d−k+1)^{2k}c(ω,ω')`; `9/4`, `9/16`, `C = 9`; `2·2 + 3·3 − 2·2 = 9`, `C = 25` | sound |
| 5.1 existence | `u_0 = k·log(d−k+1) ≥ 0`; `u_0/0 = 0` | `Subadditive` holds at `m = 0`; bounded below | sound; S03 |
| 5.2–5.4 properties, invariance, entropy | Frobenius; Fibonacci | `λ_k = p^k`; `log φ ≈ 0.4812` | sound |
| 6.1 maps by forms | Cremona overlap; `(0,0,1)` then `σ`; `d = 0` | unit `x_1/x_0 = F_0/F_1`; `G(F) = 0`; reduced form `(1)` | sound |
| 6.2 degrees on `ℙ^d` | section of `aA − B`; Cremona | `a·deg_k − deg_{k+1} = (A^{d−k−1}B^k·E) ≥ 0`; `4 − 3 = 1` | sound |
| 6.3 examples | Fibonacci `n = 1, 2, 3` and `n = 0` | exponents from `[[0,1],[1,1]]^n`: degrees 2, 3, 5; `(1, y, z)` not homogeneous | sound |
| 6.4 affine maps | `(x², y)`; Hénon; `(x, xy)` | base point `[0:0:1]`, `(1,2,2)`; `2^n`; fibre over `(0,1)` empty | sound |

## Verified sound

- Declarations read: 32 (11 definitions, 2 proved instances, 19 `sorry` theorems). Targets read: 27 (§§1.1–6.4) and the Conventions. Checks and witnesses recomputed: about 80.
- Pinned declarations found at the cited file and line: Mathlib 57 of 57, Tau Ceti 41 of 41 (including the five imported modules and `IsModification`, added in round 1). The descriptions of `IsAmple`, `IsProjectiveOver`, `eulerCharBelow`, `Subadditive.lim`, `Scheme.Hom.finrank` and `fromOfGlobalSections_eq_of_unit_rescaling` agree with the pinned text.
- Sibling citations checked at their current text: 36 sections located (CyclotomicClassGroupsAndStickelberger §4.3; AlgebraicModuliForArithmeticGeometryPartII §§0.1, 1.1, 1.2, 1.4, 1.5, 1.6, 1.7; AlgebraicModuliForArithmeticGeometry §§1.4, 5.4, 9.10; ArakelovGeometryAndAbelianHeightsPartII §§0.1, 0.3; LefschetzPencilsAndVanishingCycles §5.1; SchemeAndStackFoundations, 17 sections; StableReduction Layer 2; ArithmeticDynamics §§0.18, 0.26), 20 of them read for the statement consumed. Each states what the contract says, with the same hypotheses.
- Ownership: `roadmaps grep` finds no dynamical degree, graph of a rational map or algebraic entropy on main or at any open head; no declaration name of `Suggested.lean` is declared in another roadmap's `Suggested.lean`. ArithmeticDynamics owns maps of `ℙ¹` only. The overlap with AlgebraicModuliForArithmeticGeometry §9.10 and AlgebraicModuliForArithmeticGeometryPartII §1.7 (iii), (v) is delimited in the scope section.
- Policy: `git diff --stat origin/main...HEAD` changes only `packages/DynamicalDegreesOfRationalMaps/`. No `lemma`, `set_option`, pull-request number or process narrative in the README or the Lean file. Imports: `import Mathlib` and five `TauCeti.*` modules, each used and present at the pin.
- Source locators opened this pass: 46 ranges in 13 texts; each supports the statement it is cited for.
- Wording, arrangement, reuse: no sentence, list or proof plan of the README or of a docstring reproduces a source passage. dang2020's sections (Chow groups, numerical cycles, positivity, relative classes, dynamics, semi-conjugation, mixed degrees) and dangfavre2021's (cycles, b-classes, Banach spaces, operators, spectral theory) do not map onto Layers 1–6: Layers 1 and 6 have no counterpart, and the sources' numerical cycle spaces, relative classes and b-classes are excluded here. The order intersection numbers → positivity → degrees → dynamical degrees is forced by the *Needs:* lines of §§3.2, 4.2, 4.4 and 5.1. The examples (Cremona, Fibonacci, `ℙ² ⊔ ℙ²`) are single cited facts restated with their values computed.

Source independence: 46 passages compared with 13 sources (the locator ranges, among them the §3.3 and §3.6 routes against dang2020 lines 840–883, the §4.5 route against dinhsibony2005 lines 256–263, §5.1 against dangfavre2021 lines 448–467, the scope paragraph on correspondences against truong2020 lines 77–89, and the docstring of `mixedDegree_comp_le` against dang2020 lines 27–30), none shared; largest share dangfavre2021, 16 of 101 locators; contents compared with dangfavre2021 and dang2020: independent. Not read: lazarsfeld2004, fulton1998 (uncertified).

## Not verifiable

- Elaboration: this pass runs no Lean. The Lean side was read against the elaborated signatures supplied to the job and the repair report's statement that the file elaborates with 19 `sorry` warnings.
- lazarsfeld2004 (Theorems 1.4.9, 1.6.1, 2.2.15; Corollaries 1.4.10, 1.6.3) and fulton1998 (Theorem 1.4, Proposition 2.5): uncertified, cited by locator, not read. dang2020 line 842 cites the bigness criterion as Theorem 2.2.13 of the same book where the README has 2.2.15; which number is the book's was not checked.
- Not reopened this pass, verified in round 1: guedj2010 lines 1099–1110, dang2020 lines 1285–1334, the standing hypotheses of truong2020 §5 beyond lines 1101–1106.
- LefschetzPencilsAndVanishingCycles is neither on main nor among the 234 checkouts listed to this job; §5.1 was read through `roadmaps show`. Ownership against the open pull requests not listed to the job was checked only through `roadmaps grep`.

## Source issues

- **Misprint** in dinhsibony2005 at the proof of Corollaire 7, printed page 7 (line 263): the source says the estimate for the conjugate gives that the degree of the map is at most that of its conjugate, and the symmetric argument the reverse; it should be the other way round, the displayed estimate bounding the conjugate by the map; affects nothing.
- **Error** in dinhsibony2005 at the proof of Corollaire 7, printed page 7 (line 259): the source says the sequence of roots converges to the infimum of the roots of the degrees; it should be the infimum of the roots of the degrees multiplied by the constant of Proposition 6; affects the proof.
- **Misprint** in dang2020 at the proof of Theorem 3.4.4, printed page 18 (line 883): the source says the final constant is a power of `n − i + 1`; it should be a power of `r − i + 1`, as in the statement and in each step; affects nothing.
- **Misprint** in dang2020 at Theorem 5.2.1, printed page 25 (lines 1275–1279): the source labels both base maps with index 2; it should be index 1 for the first; affects nothing.
- **Misprint** in guedj2010 at Théorème 2.4 (a) (line 1180): the source gives the log-concavity range as all indices from 1 to `k`; it should be from 1 to `k − 1`, the degree of index `k + 1` being undefined; affects a stated result.
- **Misprint** in silverman2014 at Example 6, printed page 9 (line 376): the source says the degree of the `n`-th iterate is the `n`-th Fibonacci number; it should be the `(n + 2)`-th, the first iterates having degrees 2, 3, 5; affects nothing.

## For the human reviewers

- **Licence.** `cutkosky2015` and `kleiman2005` are cited from arXiv preprints (1304.1218v1, math/0504020v1; `README.md:814–815`) without the published versions; numbering was checked against the preprints only.
- **Not tested.** `lazarsfeld2004` and `fulton1998` are uncertified (`README.md:817–818`): wording and locators were not compared with their texts.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f4b22ef6279dfb1f294f757bdf3ec17bdf2b9dea", "job": "RT-DynamicalDegreesOfRationalMaps~2b", "model": "fable", "worker": "chris-x30"} -->
