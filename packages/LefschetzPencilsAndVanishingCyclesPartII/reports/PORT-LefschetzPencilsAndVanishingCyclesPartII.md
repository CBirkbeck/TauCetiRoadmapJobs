# PORT-LefschetzPencilsAndVanishingCyclesPartII

- **Branch:** `roadmap/lefschetz-pencils-and-vanishing-cycles-part-ii`
- **Head commit:** `ab1e4ae6ab973bc50afc1a37f556c4c6ad4e070e` ("LefschetzPencilsAndVanishingCyclesPartII: roadmap (README, Suggested.lean, metadata)"), one commit on `8970bf3`
- **Folder:** `TauCetiRoadmap/LefschetzPencilsAndVanishingCyclesPartII/` (`README.md` 721 lines, `Suggested.lean` 122 lines, `metadata.toml` with `topic = "math.AG"`); nothing outside the folder is touched.

## Build

`lake build TauCetiRoadmap.LefschetzPencilsAndVanishingCyclesPartII.Suggested`:

```text
Build completed successfully (18239 jobs).
```

4 warnings, all `declaration uses sorry` (lines 59, 70, 85, 109: `polynomialGraph_coeff`, `exists_avoiding_graph`, `exists_marked_etale_curve`, `exists_same_field_curve`). There is no other warning. The package's plain `import Mathlib` header gave an extra Lake warning ("imports `Mathlib` from package `mathlib`, which is designed for use with the module system"). The header is now `module` / `public import Mathlib` / `@[expose] public section`, as in `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` and `TauCetiRoadmap/ClassicalArithmeticCompletion/Suggested.lean` on main. That cleared the warning.

## Gate

```text
gate LefschetzPencilsAndVanishingCyclesPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

## Dependency direction

```text
depcheck: 206 roadmaps, 1896 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line, both before and after the README edits. `roadmaps resolve` on the final README finds no cross-roadmap citation and no Lean name that resolves nowhere.

## Draft pull request body

This roadmap proves that a smooth rational point of a scheme over an arbitrary field `k` lies on a curve defined over `k` itself that meets a prescribed dense open set. If `y ∈ Y(k)` has an open neighbourhood `V` smooth over `k` and `U ∩ V` is dense in `V`, then there are an affine curve `C/k`, smooth of relative dimension one and geometrically integral, a point `c ∈ C(k)` and a `k`-morphism `g : C → Y` with `g(c) = y` and `g⁻¹(U)` nonempty and dense. The point `y` may lie outside `U`, and nothing is assumed of `Y` away from `V`. Over `𝔽_q` both marked residue fields are `𝔽_q`, so Frobenius at `c` is Frobenius at `y`, with no passage to a power. The base roadmap LefschetzPencilsAndVanishingCycles cannot give this: its finite-field descent of pencils produces a good axis only over some `𝔽_{q^r}`. Poonen's finite-field Bertini needs a projective ambient variety, while the smooth charts in Kisin–Zhou's independence-of-ℓ argument (Corollary 5.2.7, Proposition 5.3.5) are affine.

The proof is elementary and local, in two layers:

- **Layer 1** specialises Tau Ceti's Kronecker substitution to the base-`B` weights `X_i ↦ T^(B^i)`. It proves that a base exceeding every exponent preserves coefficients, and that the resulting graph `𝔸¹ → 𝔸^m` is a closed immersion along which a chosen nonzero polynomial stays nonzero.
- **Layer 2** encloses the boundary of a dense open of an étale chart `V → 𝔸^m_k` in a hypersurface, pulls the graph back along the chart, and keeps the connected component through the marked point.

`Suggested.lean` states the four headline theorems with the one definition they need, the real-body ring map `polynomialGraph`. It imports only Mathlib.

## Roadmaps this one depends on that are still pull requests

None. The suppliers are the pinned Mathlib and Tau Ceti and SchemeAndStackFoundations §0.8 (`rational_point_component`) on main.

LefschetzPencilsAndVanishingCycles is still a pull request and is later in the merge order. It is named only in "Scope and ownership": its Layer LPV.3, §3.4 and §3.5 say where the base roadmap stops and whose the pencils are. It is not a supplier: no `*Needs:*` line, contract or proof route uses it. I checked these ids at its head: §3.4 "Existence of Lefschetz pencils", §3.5 with the "descent of pencils to a finite field" theorem, and "Layer LPV.3: Lefschetz pencils".

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already had the required form: one real-body definition, four headline theorems with `sorry`, and no padding, sorry'd data, `set_option` or examples. The only Lean change is the module-system header described under Build. I kept every statement as written. No headline that is statable at the pins is missing:

- The README's end theorems (§2.3, §2.4) and algebraic milestones (§1.2, §1.3) are all stated.
- The marked component (§2.2) stays a README target: defining it as an open subscheme needs the proof that a connected component of a Noetherian scheme is open.
- The §2.1 boundary polynomial and the residue-field identity at the marks are intermediate results. The second follows directly from Tau Ceti's `residueDegree_eq_one_of_section` and `residueFieldMap_bijective_of_section`.

**`#check @name` audit.** I appended `#check @name` for all five declarations to the module, elaborated it once with the permitted build command, and then restored the file, which `git` confirms. Every elaborated type matches its README statement. No binder was lost: `[CommRing k]`, `[Field k]`, `[IsIntegral V]`, `[IsAffine V]`, `[Etale π]`, `[Smooth (V.ι ≫ f)]` and the section, origin, support-bound, query-bound and density hypotheses are all present. There are no section `variable`s. No change was needed.

## Supplier replacements and duplication removals

- **Supplier replacements: none needed.** I checked every supplier name the README uses at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`), with file and line. Mathlib:
  - `MvPolynomial.eval₂Hom_C`/`_X'`/`_monomial`, `comp_eval₂Hom`, `aeval_def` (`Mathlib/Algebra/MvPolynomial/Eval.lean:181–203, 575`)
  - `Nat.ofDigits_inj_of_len_eq` (`Mathlib/Data/Nat/Digits/Defs.lean:310`), `Nat.ofDigits_eq_sum_mapIdx` and `Nat.injOn_ofDigits` (`Mathlib/Data/Nat/Digits/Lemmas.lean:37, 360`)
  - `IsClosedImmersion.spec_of_surjective` (`…/ClosedImmersion.lean:97`)
  - the `HasRingHomProperty @Etale RingHom.Etale` instance, `Etale.etale_isStableUnderBaseChange` and `Etale.iff_smoothOfRelativeDimension_zero` (`…/Morphisms/Etale.lean:52, 70, 104`)
  - `smoothOfRelativeDimension_comp` (`…/Morphisms/Smooth.lean:201`)
  - `AffineSpace.SpecIso_inv_over` and `AffineSpace.smoothOfRelativeDimension_fin` (`…/AffineSpace.lean:248, 395`)
  - `MvPolynomial.uniqueAlgEquiv` (`…/MvPolynomial/Equiv.lean:63`) and `MvPolynomial.renameEquiv` (`…/Rename.lean:213`)
  - `Flat.generalizingMap`, `isOpenMap_of_generalizingMap` and `Scheme.Hom.isOpenMap` (`…/UniversallyOpen.lean:129, 105, 43`)
  - `Algebra.Etale.iff_exists_algEquiv_prod` (`Mathlib/RingTheory/Etale/Field.lean:271`) and `Algebra.Etale.baseChange` (`…/Etale/Basic.lean:241`)
  - `Ideal.under_ne_bot_of_algebraic_mem` (`…/Ideal/GoingUp.lean:196`, hypotheses `[Algebra R S] [IsDomain S]`, as used)
  - `IsFractionRing.isAlgebraic_iff` (`…/Localization/Integral.lean:146`) and `isAlgebraic_algebraMap_iff` (`…/Algebraic/Basic.lean:328`)
  - `IsOpen.dense` and `IsOpenMap.denseRange_of_isPreirreducibleSpace` (`Mathlib/Topology/Irreducible.lean:198, 202`; the second needs `[Nonempty U]`, as the §2.3 route supplies)
  - `TopologicalSpace.NoetherianSpace.finite_irreducibleComponents` (`Mathlib/Topology/NoetherianSpace.lean:194`) and `isClosed_connectedComponent` (`Mathlib/Topology/Connected/Basic.lean:606`).

  Tau Ceti:
  - `MvPolynomial.coeff_aeval_X_pow_weight`, `MvPolynomial.injOn_aeval_X_pow` and `Finsupp.exists_injOn_weight` (`TauCeti/RingTheory/MvPolynomial/Kronecker.lean:96, 109, 75`)
  - `AlgebraicGeometry.Smooth.exists_etale_affineSpace` and `…SmoothOfRelativeDimension.exists_etale_affineSpace` (`…/Smooth/EtaleCoordinates.lean:98, 86`, namespace `AlgebraicGeometry`)
  - `TauCeti.AlgebraicGeometry.Smooth.geometricallyIntegral` (`…/Smooth/GeometricallyIntegral.lean:37`)
  - `TauCeti.AlgebraicGeometry.residueDegree_eq_one_of_section` and `residueFieldMap_bijective_of_section` (`…/RationalPoint/Basic.lean:97, 122`, namespace `TauCeti.AlgebraicGeometry`).

  SchemeAndStackFoundations §0.8 `rational_point_component` is on main (README line 1233). The step it supplies, that a connected scheme with a rational point is geometrically connected (Stacks 04KV), is in neither pinned library: Mathlib's `Geometrically/Connected.lean` and Tau Ceti's `Geometrically/Connected.lean` have no such result.
- **Is `polynomialGraph_coeff` already proved?** No. Tau Ceti's `coeff_aeval_X_pow_weight` needs injectivity of the weight on a set containing the support and the query, and the pins do not state injectivity of the base-`B` weight on the box. Mathlib's Noether normalisation proves it only in the private lemma `sum_r_mul_ne`. Tau Ceti's `IsLazardEvaluator.weight_injOn` would give it for the reversed order on `Fin m`, but it is not stated for `i ↦ B^i`.
- **Duplication removals: none.** I searched by object (`roadmaps grep`, main and all open heads) for: curves through a rational point, same-field curves, the Kronecker substitution and graph, base-`B` weights, the boundary polynomial, marked components and curves, Bertini, Poonen and Kisin–Zhou. There is no second owner.
  - ArithmeticInterpolationDeterminants §0.3 `powerSubstitution` (main) is the two-variable strip version. For `m = 2` it has the same underlying ring map; I recomputed `B^0 = 1`, `B^1 = B`. The README states how ours differs.
  - The Bertini curves of DeligneWeightsAndPurity ("curve reduction preserves monodromy", "full prime-to-`p` abelian curve reduction") are taken after a finite constant extension and through no prescribed rational point.
  - ArithmeticGaloisRepresentations cites Kisin–Zhou Proposition 5.3.5 only for Chebotarev density on curves.
  - ReductiveGroupsPartIII consumes Kisin–Zhou's group-theoretic half.
  - AlgebraicModuliForArithmeticGeometry and its Part II have no finite-field Bertini or marked-curve target.
- **Restructuring, no content removed.** The ArithmeticInterpolationDeterminants §0.3 comparison sat under "Owned elsewhere and consumed here", but nothing here consumes it. It now sits with the ownership paragraph on the Kronecker substitution, as a one-clause statement of how the kept variant differs.

## README fixes from the upstream-reviewer reread

1. **Base-roadmap citation made exact.** The "Where the base roadmap stops" paragraph named LefschetzPencilsAndVanishingCycles without sections, and said "sufficiently ample projective embeddings". It now cites §3.4 (existence of Lefschetz pencils, after a Veronese embedding of degree at least two) and §3.5 (descent of pencils to a finite field), checked at that roadmap's head. "Not in this roadmap" now names it as the owner of Lefschetz pencils (its Layer LPV.3).
2. **Noether normalisation substitution corrected.** The README described Mathlib's substitution as `X_i ↦ X_i + X_0^(r_i)`. At the pin it is `X_0 ↦ X_0`, `X_i ↦ X_i + c·X_0^(r_i)` (`Mathlib/RingTheory/NoetherNormalization.lean`, the `aeval fun i ↦ if i = 0 then X 0 else X i + c • X 0 ^ r i` map).
3. **Inputs of the marked component made precise (§2.2).** The text said the construction is "for fixed `(V, π, y, U, h, B)`". In fact the connected component of `V ×_{𝔸^m} 𝔸¹` through `(y, 0)` depends only on `π`, `y` and `B ≥ 1`. `U` and `h` enter only through the choice of `B` and the good-open statement. The intended form now says this and names the carrier: an open subscheme of Mathlib's `pullback` of `π` and `Spec.map (CommRingCat.ofHom (polynomialGraph k m B))`. It also records that `B ≥ 1` is what makes `(y, 0)` a point of the fibre product.
4. **Good-open API bullet (§2.2) points to its argument.** The bullet now says that the inclusion `q⁻¹(D(φ(h))) ⊆ g⁻¹(U)` and the density follow from the argument in the §2.3 proof sketch, with the three inputs it uses.
5. **Unlocated Mathlib names given files and statements.** `TopologicalSpace.NoetherianSpace.finite_irreducibleComponents` and `isClosed_connectedComponent` now have files in the supplier contracts and References. The contract also states what `IsOpen.dense` and `IsOpenMap.denseRange_of_isPreirreducibleSpace` say.
6. **Form.** The title uses an em dash in place of a second colon, matching the "…, Part II — …" titles on main. A stray line break in "Also not here:" is joined.

No mathematical claim of the package was false. Every Check and worked example was recomputed against its section (table below).

## Adversarial mathematics pass

`φ_B` denotes `polynomialGraph k m B` and `w_B` the base-`B` weight. Small computations were run in a scratch Python script (exact integer and finite-field arithmetic). The rest were computed by hand.

| Statement | Instances tried | Values computed | Result; change |
|---|---|---|---|
| §1.1 `polynomialGraph`, first coordinate | `m = 1, 2`; `B = 0, 1, 3` | `X_0 ↦ T^(B^0) = T` for all `B` (`0^0 = 1`); `X_1 ↦ T^(0^1) = T^0 = 1`, `T^1`, `T^3` | as README; none |
| §1.1 origin preservation (`B ≥ 1`) | `ℤ`, `m = 2`, `B = 0` vs `3`, input `X_1` | origin value of `X_1` is `0`; value at `T = 0` of `φ_0(X_1) = 1` is `1`, of `φ_3(X_1) = T³` is `0` | hypothesis needed; none |
| §1.1 kernel for `m ≥ 2`, `k ≠ 0` | `X_1 − X_0^B`, `B = 0, 2` | images `1 − 1 = 0`, `T² − T² = 0`; coefficient of `X_1` is `1` (`X_1 ≠ X_0^B`) | nonzero kernel element; none |
| §1.1 `m = 0` | `k = 𝔽_2` | map is `Polynomial.C`; `T` not in image; `Spec k[T] → Spec k` not injective on points | not surjective, not a closed immersion; none |
| §1.1 zero ring | `ℤ/1ℤ`, `m = 0, 2`, `B = 0` | both rings singletons, `0 = 1`; both spectra empty | non-triviality hypotheses needed; none |
| §1.1 `m = 2` vs ArithmeticInterpolationDeterminants `powerSubstitution` | `B = 0..4` | `B^0 = 1`, `B^1 = B` give `(X, X^B)` = `![X, X^B]` | same ring map; comparison clause kept |
| §1.2 `polynomialGraph_coeff` | `h = X_0²X_1 − X_0X_1²`, `B = 3`, queries `(2,1), (1,2), (0,2)` | weights `5, 7, 6`; image `{5: 1, 7: −1}`; coefficients `1, −1, 0` on both sides | holds; none |
| §1.2 box injectivity | all boxes, `m = 0..3`, `B = 0..4` (20 boxes) | each box has as many distinct weights as elements; `m = 3` box sizes `0, 1, 8, 27, 64` | injective, including `B ≤ 1`; none |
| §1.2 support bound (negative control) | `X_1 − X_0²`, `B = 2` | image `{}` (i.e. `0`); coefficient of `X_1` is `1`, LHS at weight `2` is `0` | bound needed; none |
| §1.2 query bound (negative control) | `h = X_1`, `B = 2`, `e = (2, 0)` | `w_2(e) = 2`; image `T²`; LHS `1`, RHS `0` | bound needed; none |
| §1.2 degenerate bases | `(m, B) = (0, 0), (2, 0), (2, 1)` | box `{0}`, `∅`, `{0}`; equation `a = a` or vacuous | holds; none |
| §1.3 `exists_avoiding_graph` | `X_1 − X_0²` over `𝔽_2`; `m = 1`, `h = X_0`; `ℤ/4`, `h = 2` | `B = 3`: image `{3: 1, 2: −1}` = `T²(T − 1)`, zeros `{0, 1}`; `T ≠ 0`; `φ(2) = 2 ≠ 0` but `2² = 0`, so `D(2) = ∅` | holds; geometric clause field-only; none |
| §1.3 `B` chosen after `h` | `m = 2`, `h = X_1 − X_0^B` | `φ_B(h) = 0`; `m = 1`: graph is the identity | quantifier order needed; none |
| §1.3 no rational point required | `X_0^q − X_0`, `q = 2, 3` | values at `𝔽_q` points `[0,0]`, `[0,0,0]`; polynomial `T^q − T ≠ 0` | holds; none |
| Worked example 1 / §1.1 Check 1 | `𝔽_2`, `h = X_0X_1(X_0 − X_1)` | `h` vanishes at all 4 points of `𝔽_2²` (3 rational lines); image `T⁵ + T⁷ = T⁵(1 + T)²`; `𝔽_4` points of `D` are the 2 elements of `𝔽_4 ∖ 𝔽_2` | as README; none |
| §2.1 boundary polynomial | identity chart, `Z = V(X_0X_1)`; `𝔾_m ⊂ 𝔸¹`, `Z = {1}`; projection `𝔸² → 𝔸¹`, `Z = V(x_1)` | `h = X_0X_1`; `h = X_0 − 1`; `π(Z) = 𝔸¹`, no `h` | holds; étaleness needed; none |
| §2.1 route | injectivity of `π^*`; `Ideal.under_ne_bot_of_algebraic_mem` hypotheses | open image of `π` is dense in irreducible `𝔸^m`, so `ker π^*` is in the nilradical, which is `0`; lemma needs only `[IsDomain S]` and algebraicity | sound; none |
| §2.2 disconnected pullback, worked example 2 | `𝔽_3`, `π(x,z) = (x, z² − 1 − 2x)`, `B = 2` | Jacobian `2z`; `T² + 2T + 1 = (T+1)²` on all of `𝔽_9`; `W(𝔽_9)` has 16 points = 8 + 8 on branches `z = ±(T+1)`, overlap 0; mark `(0, 1)` on `+` only | two components, mark picks one; none |
| §2.2 inputs of the construction | `U = V` vs `U = D(X_0)` on the identity chart, `B = 2` | `C = 𝔸¹`, `g = (T, T²)` in both cases; only the good open changes (`C` vs `D(T)`) | construction independent of `U`, `h`: README fix 3 |
| §2.2 `m = 0` | `V = Spec k` | `φ = Polynomial.C`, `W = C = 𝔸¹`, `g` constant | holds; none |
| §2.2 base change | `𝔽_3 → 𝔽_9`; `Spec 𝔽_9 / 𝔽_3` | branch stays one component; `𝔽_9 ⊗ 𝔽_9 ≅ 𝔽_9 × 𝔽_9` splits | rational mark needed; none |
| §2.3 `exists_marked_etale_curve` | identity chart `𝔸²`, `U = D(X_0)`, `h = X_0`, `B = 2` | good open `D(T)` ∌ `c = 0`; `q⁻¹D(φ h) = D(T) ⊆ g⁻¹U = D(T)` | `y ∉ U` allowed; none |
| §2.3 smooth of relative dimension one | composition `q` then `Spec k[T] → Spec k` | `0 + 1 = 1`; transport isomorphisms have dimension `0` | holds; none |
| §2.4 `exists_same_field_curve`, density only on `V` | `Y = 𝔸¹ ⊔ 𝔸¹`, `U = V` = first copy | `U` not dense in `Y`, dense in `V`; curve = first copy | holds; none |
| §2.4 singular elsewhere | `k[x, w]/(xw)`, `y = (1, 0)`, `V = D(x)` | `V ≅ Spec k[x, x⁻¹]` smooth; translate `x ↦ x − 1` | holds; none |
| §2.4 smoothness at `y` (negative control), worked example 3 | `𝔽_3`, `x² − 2w² = x² + w²` | `𝔽_3` points `{(0,0)}`; squares mod 3 are `{0, 1}`; `𝔽_9` points 17 = 9 + 9 − 1 on `x = ±iw`, meeting at `0`; Frobenius `i³ = −i` swaps the lines | conclusion fails without smoothness; none |
| §2.4 non-rational point | `Spec 𝔽_{q²}` over `𝔽_q` | no `𝔽_q`-algebra map `𝔽_{q²} → 𝔽_q`, so no section | hypothesis is a section; none |
| §2.4 dimension zero | `Y = Spec 𝔽_2`, `U = V = Y` | `C = 𝔸¹`, `g = s_C`, `c = 0`, good open `C` | morphism, not immersion; none |
| §2.4 residue fields | sections `c`, `y` | residue degree `1` at both (Tau Ceti `residueDegree_eq_one_of_section`) | Frobenius exponent `1`; none |
| Poonen synopsis (scope) | `X = Spec 𝔽_2` vs `ℙ¹_{𝔽_2}` | dimension `0` (no curve inside) vs `1`; `dim X ≥ 1` stated | correct; none |

Context check: the file has no `variable` or `include`. Every hypothesis is in the declaration's own signature, as confirmed by the `#check @name` audit.

## Unresolved and notes for the worker

- **A gap this roadmap fills.** The board package ShimuraVarietiesPartII (§6.3 construction, README line 1218, and the `*Needs:*` lines at 1224 and 1246) has a gap "finite-field-bertini". It addresses that gap to AlgebraicModuliForArithmeticGeometry Layer 1, whose head has no such target. Its request is a smooth geometrically connected curve over `𝔽_q` through a specified `𝔽_q`-point of a smooth scheme of positive dimension, whose inverse image of a dense open is nonempty. That is a special case of `exists_same_field_curve`, and that package could cite this roadmap's §2.4. ShimuraVarietiesPartII is neither on main nor an open pull request, so the README names no roadmap in "Downstream consumers"; it keeps the generic description.
- **Ownership coverage.** Ownership against open pull requests was checked with `roadmaps grep` over all 436 indexed heads and main. The three remote-only board packages (AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory) were not opened.
- **No suspicious instructions.** No text read during the job contained instructions addressed to the porter.


Pull request: #2254 (roadmap/lefschetz-pencils-and-vanishing-cycles-part-ii at ab1e4ae)
