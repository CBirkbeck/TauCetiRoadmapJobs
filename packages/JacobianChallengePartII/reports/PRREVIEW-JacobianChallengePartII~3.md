# Review of JacobianChallengePartII (pull request #1225 at d8d695f)

**Verdict:** needs changes

Incremental re-review of the 124 lines changed since 02f420e (49 in the README, 75 in `Suggested.lean`), plus the consequences of the Tau Ceti pin bump that came with the merge of main (a91d3aa → 2fd255d). Two P3 findings, no P1 or P2. The worker's gate fails on `statement-hygiene` (R01), so the folder cannot be accepted at this head whatever else holds.

## R01 (P3) — `letI` in the signature of `triangularBaseChange` (gate `statement-hygiene`)

**Location:** `TauCetiRoadmap/JacobianChallengePartII/Suggested.lean:219–220`: “letI : F.Monoidal := Functor.Monoidal.ofChosenFiniteProducts F” and “letI : GrpObj (F.obj A) := Functor.grpObjObj”.

**Claim:** The worker's gate reports `statement-hygiene=2 … FAIL`, one hit per `letI` line, with the repair “use an instance binder or a named instance in the signature”. The statement itself is unchanged since the previous head and its mathematics is sound (previous report, rows 5.5); only the form fails the rule, and no acceptance is possible while the gate fails.

**Witness:** `gate JacobianChallengePartII: … statement-hygiene=2 … FAIL`, lines 219 and 220. The pinned Mathlib has no `Monoidal` instance on `Over.pullback f` (grep of `Mathlib/` for `Over.pullback` with `Monoidal`: none) and `Functor.grpObjObj` is only a scoped instance (`Mathlib/CategoryTheory/Monoidal/Grp.lean:586`), so an instance binder would quantify over arbitrary monoidal structures on the pullback functor, which is not the intended statement.

**Exact repair (tested):** declare the two instances once, before the theorem, and delete the two `letI` lines:

```lean
/-- Base change along `f` is a monoidal functor for the chosen fibre products of `Over S`. -/
instance overPullbackMonoidal {S S' : Scheme.{u}} (f : S' ⟶ S) : (Over.pullback f).Monoidal :=
  Functor.Monoidal.ofChosenFiniteProducts _

/-- The group law of the base change of a group object, pulled back along `f`. -/
instance overPullbackGrpObj {S S' : Scheme.{u}} (f : S' ⟶ S) (A : Over S) [GrpObj A] :
    GrpObj ((Over.pullback f).obj A) :=
  Functor.grpObjObj
```

A scratch copy with exactly this change elaborates under `lake env lean` with `sorry` as the only warning, and `#check @triangularBaseChange` prints the same type as before (`let F := Over.pullback f; have C := PreservesProduct.iso F …; F.map (triangularForward A n) ≫ C.hom = C.hom ≫ triangularForward (F.obj A) n ∧ …`). Name both instances in the README's **Lean** convention bullet (README.md:59), since every Lean name of the roadmap must appear in the README.

## R02 (P3) — Pinned Abel-map and base-change natives are not cited after the pin bump

**Location:** `README.md:26` (“Supplied by pinned Tau Ceti.” paragraph), `README.md:342` (§2.1 *Needs:* “§0.4; JacobianChallenge, Layer C.”), `README.md:268` (§1.3 *Needs:*), `README.md:180` (“as in `GrpObj.ofRepresentableBy`”), `Suggested.lean:42` (“Layers 2–3: the relative Picard torsors and Abel morphisms … absent from the pinned libraries”).

**Claim:** The head now pins Tau Ceti 2fd255d (the README table header says so at line 71), and that revision adds the functorial half of Layer 2 and of §1.3. §2.1's route (“make `Γ_x` a relative effective Cartier divisor, take its invertible sheaf and map to the relative Picard sheaf”) and its *Needs:* line credit JacobianChallenge Layer C for what the pin owns; the §2.1 bullet “subtracting `a₁(x₀)` gives the parent pointed Abel–Jacobi map” and §2.3's pointed map restate the pinned `abelJacobiMap`; §1.3 and §0.2 credit AlgebraicModuliForArithmeticGeometry §7.6.1 for the presheaf-level base-change comparison the pin has; and the docstring says Abel morphisms are absent, which is true only of the scheme morphism `X → Pic¹` (no representing torsor at the pin), not of the Abel map on functors of points. The rule is that what exists at the pin is cited with its exact name and file, not re-derived from a roadmap supplier.

**Witness (all at Tau Ceti 2fd255d, namespace `TauCeti.AlgebraicGeometry`):**

- `graphDivisor` (`AlgebraicGeometry/EffectiveCartierDivisor/Graph.lean:100`): `yoneda.obj (Over.mk f) ⟶ Div_{X/S}`, the graph of a `T`-point as a relative effective Cartier divisor, for `f` separated and smooth of relative dimension one;
- `graphDivisorDegreeOne` (`EffectiveCartierDivisor/Representable.lean:129`, `IsIso` at :151): `Hom_S(-, X) ≅ Div¹_{X/S}`;
- `abelMap` (`PicardFunctor/Abel/Basic.lean:84`): `Div_{X/S} ⟶ relativePicardPresheaf f`, `D ↦ [𝒪(D)]`, natural in `T`;
- `relativePicardFiberDegree_abelMap_app_of_mem` (`PicardFunctor/Abel/PicZero.lean:109`): a degree-`d` divisor has fibre degree `d`, so `graphDivisor ≫ abelMap` has degree one at every field-valued point — the section-free `a₁` of §2.1 at the level of the Picard presheaf;
- `abelJacobiMap` (`PicardFunctor/Abel/Jacobi.lean:89`): the pointed map `x ↦ [𝒪(Γ_x − x₀_T)]` and `abelJacobiMap_app_basePoint`; `abelJacobiMapOfDegree` (`Abel/Degree.lean`) with its additivity and base-point laws;
- `relativePicardPresheafBaseChangeIso` (`PicardFunctor/BaseChange.lean:115`): `relativePicardPresheaf (pullback.fst g f) ≅ (Over.map g).op ⋙ relativePicardPresheaf f`, and `relativePicardDegreeZeroFunctorBaseChangeIso` (`PicZero/BaseChange.lean`) for the degree-zero presheaf;
- `CommGrpObj.ofRepresentableBy` (`Mathlib/CategoryTheory/Monoidal/Cartesian/CommGrp_.lean:37`): the commutative group object of a represented presheaf of commutative groups, which is what §0.3 and §1.2 use; `GrpObj.ofRepresentableBy` (`Grp.lean:34`) gives only the group object.

**Exact repair:** add one row to the **From Tau Ceti (pinned)** table naming `graphDivisor`, `graphDivisorDegreeOne`, `abelMap`, `relativePicardFiberDegree_abelMap_app_of_mem`, `abelJacobiMap`, `abelJacobiMapOfDegree` and `relativePicardPresheafBaseChangeIso` with their modules, and list them in the “Supplied by pinned Tau Ceti.” paragraph. In §2.1 replace the two construction sentences by “The graph divisor `graphDivisor` composed with `abelMap` is the natural transformation `x ↦ [𝒪(Γ_x)]` into `relativePicardPresheaf π`, of fibre degree one by `relativePicardFiberDegree_abelMap_app_of_mem`; compose with `relativePicardToFppfSheaf` and use representability (§0.3) for the `S`-morphism”, and change its *Needs:* to “§0.4; Tau Ceti `graphDivisor`, `abelMap`, `relativePicardFiberDegree_abelMap_app_of_mem`, `relativePicardToFppfSheaf`” (Kleiman, Definition 4.6, p. 27 stays as the locator). In the §2.1 bullet on the pointed comparison and in §2.3 cite `abelJacobiMap` and `abelJacobiMapOfDegree` for the pointed map. In §0.2 and §1.3 cite `relativePicardPresheafBaseChangeIso` for the presheaf-level comparison and keep §7.6.1's `relativePicardBaseChange` for the sheaf-level statement. At README.md:180 and in §1.2 write `CommGrpObj.ofRepresentableBy`. In the docstring's Layers 2–3 bullet write “the representing Picard torsors (the Abel map on functors of points, `graphDivisor ≫ abelMap`, exists at the pin; the scheme morphism `X → Pic¹_{X/S}` needs its representing object)”. No statement, hypothesis or Lean declaration changes.

## Previous findings

- R01 — repaired: README.md:1146 now reads “Torelli-locus applications consume §§1.2–1.4: the relative Jacobian, its base change and the principal polarization.” The unresolved roadmap name is gone; no supplier edge was added (depcheck below).

## Verified sound

:robot: Independent AI review. Incremental re-review of 124 changed lines since 02f420e, at the pin the head's `lake-manifest.json` records (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`, both equal to main's). The outside-folder diff against `origin/main` is empty. The worktree was left unchanged.

**Gate and elaboration.** The worker's gate at this head:

```text
gate JacobianChallengePartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=2 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 FAIL
```

The only failing check is `statement-hygiene` (R01). `lake env lean` on `Suggested.lean` from the worktree: exit 0, nine `declaration uses sorry` warnings (lines 78, 90, 109, 128, 139, 157, 177, 209, 216) and nothing else. The file's `module` / `public import` / `@[expose] public section` form is the form of 26 `Suggested.lean` files on main; the gate's import checks accept it.

The dependency check, rerun as the brief prescribes:

```text
depcheck: 240 roadmaps, 2350 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The *Needs:* lines the diff touched (§0.1, §0.3, §1.2) add only Tau Ceti and Mathlib names and §0.1; the roadmap suppliers named are unchanged and all on main (JacobianChallenge Layers A–E, ComplexComparisonPartII §§C3.2d.2–d.3 and C3.2f.1–f.2, AlgebraicModuliForArithmeticGeometry §§7.3, 7.6.1, SchemeAndStackFoundations §4.14, AbelianSchemesAndArithmeticModuli A0.1). No declared gap; no `set_option`, no sorry'd data, no copied passage, no algorithm, no pull-request number in the folder.

**The three new Lean statements against the pin.** Every carrier was opened at Tau Ceti 2fd255d:

| Declaration | File and line at the pin | What it is |
| --- | --- | --- |
| `relativePicardPresheaf f` | `PicardFunctor/Relative.lean:84` | `T ↦ Pic(X_T)/Pic(T)` as `CommGrpCat.{u+1}`-valued presheaf on `Over S`; `@[expose]` so sections are `QuotientGroup.mk a` |
| `relativePicardAddPresheafMk`, `relativePicardFppfSheaf`, `relativePicardToFppfSheaf` | `PicardFunctor/Fppf.lean:73, 104, 125` | additive section of an actual class; fppf sheafification (`presheafToSheaf (Scheme.fppfTopology.over S)`); the unit map |
| `relativePicardFiberDegree` | `PicardFunctor/PicZero/Basic.lean:141` | `χ(a|X_ξ) − χ(𝒪_{X_ξ})` over `Ω` at `ξ : Spec Ω ⟶ T`, well defined on the quotient; `_mk` :161, naturality `_map` :283 |
| `relativePicardDegreeZeroFppfSheaf`, `…ι` | `PicardFunctor/PicZero/Fppf.lean:114, 192` | degree-zero fppf subsheaf and its monomorphism (standing hypotheses proper, smooth of relative dimension 1, geometrically connected) |
| `LineBundleClass.IsAmple` | `LineBundle/Ample.lean:71` | ampleness of a class (nonvanishing loci of sections of a power form an affine cover) |
| `Functor.RepresentableBy`, `IsRepresentable`, `reprX`, `representableBy` | `Mathlib/CategoryTheory/Yoneda.lean:282, 514, 564, 568` | `homEquiv : (X ⟶ Y) ≃ F.obj (op X)` with `F : Cᵒᵖ ⥤ Type v` and `Category.{v₁} C` independent (variable block at :37), so the `Type u` morphisms of `Over S` may be compared with `Type (u+1)` sections, as the docstring and README.md:67 say |
| `representableByUliftFunctorEquiv` | `Yoneda.lean:466` | the universe-lifted form named at README.md:67 |
| `GrpObj.ofRepresentableBy`, `CommGrpObj.ofRepresentableBy` | `Monoidal/Cartesian/Grp.lean:34`, `CommGrp_.lean:37` | transported (commutative) group object; see R02 for the exact name |
| `Scheme.fppfTopology` | `Mathlib/AlgebraicGeometry/Sites/Fpqc.lean:54` | the fppf Grothendieck topology (covers jointly surjective, flat, locally of finite presentation), which is what uniqueness in §0.3 uses |

The signature audit: a scratch copy appended `#check @name` for all twelve declarations (and the two repair instances) and elaborated; the printed types agree with `signatures.md` and with the README: §0.1 keeps `IsLocallyNoetherian S`, `IsProper f`, `SmoothOfRelativeDimension 1 f`, an arbitrary `T : Over S` and a class of `relativePicardPresheaf`; §0.3's degree theorem the same hypotheses with a section of the fppf sheaf and `∃!` over `LocallyConstant T.left ℤ`; representability keeps `IsAffine S`, `IsNoetherian S`, properness, smooth relative dimension one, `GeometricallyConnected f` and the ample class. No section binder was lost.

**Generality of the representability statement.** The README's §0.3 target is over a noetherian base with `X/S` projective; the Lean states the affine-base case with an ample class on `X`, and README.md:179 registers exactly that with the gluing step (Stacks 01JJ). This is not a stand-in: no projective-morphism predicate exists at the pin (grep of `Mathlib/AlgebraicGeometry` and `TauCeti/AlgebraicGeometry` for `IsProjective` as a morphism class: none; the 75 Tau Ceti hits are module-theoretic), ampleness on `X` over affine `S` with `f` proper is projectivity, and Kleiman's own proof reduces (1) to this case (`kleiman` lines 1318–1321). Stacks Lemma 26.15.4 (tag 01JJ, `stacks-book` line 109351) is exactly the gluing of a Zariski sheaf covered by representable open subfunctors, applied to the subfunctors of `T`-points landing in an affine open of `S`.

**Seeded sample in the changed passages.** Sources read from the cache (`kleiman` = arXiv math/0504020v1, `yuan` = arXiv 2108.05625v4, `stacks-book` = the Stacks project book PDF).

| Target | Locator opened | Support |
| --- | --- | --- |
| 0.1 Local constancy | `kleiman` lines 1341–1344 (printed p. 28: `T'_φ` open by EGA III₂ 7.9.11) | The fixed-Hilbert-polynomial locus of an invertible sheaf on `X_{T'}` is open; `χ` is invariant under base change (lines 1335–1339). The README's statement for a non-noetherian test scheme is obtained by its own §0.0 descent, as it says; Kleiman's page is cited for the noetherian step only. |
| 0.2 (touched by the §0.3 edits) | `kleiman` lines 1367–1369 (p. 29) | the `T^φ` are disjoint, open and cover `T`, so `Pic` is the disjoint union of the `P^φ`. |
| 0.3 Representability | `kleiman` lines 1309–1317 (Theorem 4.8, pp. 27–28), 1318–1321 (locality on `S`), 2219–2221 (Proposition 5.19, p. 47: `H²(𝒪_{X_s}) = 0` gives smoothness near `s`), 2390–2393 (Exercise 5.23, p. 50: `Pic⁰` of a projective flat family of integral curves over a noetherian base is a smooth quasi-projective family, projective iff `X/S` smooth) | Hypotheses of 4.8(2): `S` noetherian, `X/S` projective, flat, integral geometric fibres; the Lean's smooth, geometrically connected curve fibres are geometrically integral. `stacks-book` line 109351 (Lemma 26.15.4, 01JJ) for the gluing. |
| 1.2 Relative Jacobian | `yuan` line 978 (§2.2.1, p. 29); `kleiman` lines 2435–2438 (Remark 5.26, p. 51: `J = Pic⁰_{X/S}` exists and is a projective abelian `S`-scheme by Exercise 5.23, for `X/S` projective smooth with connected fibres of genus `g > 0` and `S` noetherian) | Matches the target's hypotheses and the new paragraph (the representing object of `relativePicardDegreeZeroFppfSheaf π` with the transported law). |

The untouched sampled targets (2.1, 2.5, 2.6, 2.7, 3.2, 3.4, 3.10, 3.12, 4.4, 4.5, 6.1, 7.2) are unchanged since the previous report, whose verification stands; §2.1 is touched only through R02.

**Computed adversarial pass.** Rows for the changed statements; the previous report's 61 rows (its table under “Computed adversarial pass”) carry forward unchanged for every statement the diff leaves untouched, including the three descent theorems, §4.8–4.9 and the §5.5 triangular maps (whose statements are unchanged; only the `letI` form of `triangularBaseChange` is at issue). `E` is an elliptic curve with origin `e`, `k` a field, `l/k` a finite extension of degree at least two, `A = k[ε]/ε²`.

| Statement | Instances tried | Values on each side / excluded model | Result; change |
| --- | --- | --- | --- |
| 0.1 Lean, degree locally constant | `S = Spec k`, `X = E`, `T = Spec l`, class of `𝒪(e_l)` | fibre degree `χ(𝒪(e_l)) − χ(𝒪) = 1 − 0 = 1` at the only point, for `Ω = l` and for any `Ω ⊇ l`; `d ≡ 1`. | Holds; invariance under `Ω` extension is `χ ⊗ Ω` (Kleiman line 1337). None. |
| 0.1 Lean, disconnected `T` | `T = Spec k ⊔ Spec k`, bundle `(𝒪, 𝒪(e))` | `d = (0, 1)` is locally constant; a single integer is not available. | `LocallyConstant` carrier correct. None. |
| 0.1 Lean, non-noetherian `T` | `T = Spec k[x₁, x₂, …]`, `L` descended from stage `n` (§0.0) | degree computed at stage `n` is constant on `Spec k[x₁..x_n]`, pulled back along the (flat) projection; `d` constant. | The statement's `T` is arbitrary; route via §0.0. None. |
| 0.1 Lean, junk | `T = ∅` | `LocallyConstant ∅ ℤ` has one element, the `∀ ξ` is vacuous. | True, not vacuous elsewhere (every point of `T` is `ξ p` for `ξ = Spec κ(t) → T`). None. |
| 0.1 negative control | `X = 𝔸¹_S` (smooth of relative dimension 1, not proper) | `eulerDegree` returns the junk value of a truncated `χ` of infinite-dimensional cohomology; local constancy is meaningless. | `IsProper f` excludes it. None. |
| 0.3 Lean, `∃!` degree of a sheaf section | `S = Spec ℝ`, `X` the pointless conic (genus 0 is allowed; no genus hypothesis), `T = Spec ℝ`, `σ` the sheaf section of degree one | no actual class on `X` has degree 1 (`Pic(X) = 2ℤ`); over `T' = Spec ℂ → T`, `𝒪(1)` represents `σ|_{T'}` with degree 1; `d = 1`. Uniqueness: `Spec ℂ → Spec ℝ` is surjective. | Existence via a cover, uniqueness via joint surjectivity, as README.md:181 says. None. |
| 0.3 Lean, consistency across representatives | two pairs `(T'₁, a₁)`, `(T'₂, a₂)` over the same `t ∈ T` | the pullbacks to `T'₁ ×_T T'₂` agree in the sheaf, hence in the presheaf after an fppf cover `V` of that fibre product, which is nonempty over `(t'₁, t'₂)`; `relativePicardFiberDegree_map` transports the degree along `V → T'ᵢ`. Both equal `d(t)`. | The condition quantifies over all `(T', g, a)`, not only covers; still consistent. None. |
| 0.3 Lean, local constancy of `d` on `T` | fppf cover `{T'ᵢ → T}` with representatives | `d ∘ gᵢ` locally constant on `T'ᵢ` (0.1 Lean); `gᵢ` flat locally of finite presentation hence open; images cover `T`. | `d ∈ LocallyConstant T.left ℤ` justified. None. |
| 0.3 Lean, representability | `S = Spec k`, `X = E` | `Pic_{E/k} = ⊔_{d∈ℤ} Pic^d ≅ ⊔ E`; representable. `S = Spec ℝ`, pointless conic: `Pic_{X/ℝ} = ℤ_ℝ` representable although `Pic(X) → Pic_{X/ℝ}(ℝ)` is not onto. | Representability of the sheaf, not of the presheaf, is what is stated. None. |
| 0.3 Lean, hypotheses | drop `GeometricallyConnected`: `X = E ⊔ E'` over `k` | Kleiman 4.8 needs integral geometric fibres; the hypothesis is present. `S = ∅`: `Over ∅` is trivial and the sheaf is represented by `∅`. | None. |
| 0.3 Lean, universes | `F = (relativePicardFppfSheaf f).obj ⋙ forget` into `Type (u+1)`, homs of `Over S` in `Type u` | `RepresentableBy` with `(X ⟶ Y) ≃ F.obj (op X)` across universes elaborates (`#check` printed). | None. |
| 0.3 Check “Field points” | `T = Spec l`, `𝒪(e_l)` | degree function `1`; in `Pic¹(T)`, not in `Pic⁰(T)`; a degree read at `k`-points of `T` (none) would impose nothing. | Discriminates the wrong definition. None. |
| 0.3 Check “Infinitesimal” | `T = Spec A`, `E` | `ker(Pic(E_A) → Pic(E)) = H¹(E, 𝒪_E)`, dimension `1 = g`; presheaf = sheaf here since `E` has a `k`-point (§7.6.1a). | Correct. None. |
| 0.3 Check “Group law” | `x, y ∈ E(T)` | `𝒪(x−e) ⊗ 𝒪(y−e) ≅ 𝒪((x+y)−e)` is the definition of `+` on `E`; transported law = elliptic addition. | Correct. None. |
| 1.2 Check “Degree at field points” | `T = Spec l`, `𝒪(e_l)` | degree `1 ≠ 0`, so not a `T`-point of `J`, although `T(k) = ∅`. | Correct. None. |
| 1.2 new paragraph | `J` as representing object of `relativePicardDegreeZeroFppfSheaf π` | its bijections restrict those of `Pic` along `relativePicardDegreeZeroFppfSheafι` (a monomorphism at the pin, `PicZero/Fppf.lean:210`); `J(T) = Pic⁰(T)` additively. | Definition determines the object up to unique isomorphism (`RepresentableBy.isoReprX`). None. |
| Conventions “Picard objects” | sheafification of `Pic(Y_T)/Pic(T)` versus of `Pic(Y_T)` | line bundles on `T` are Zariski-locally trivial, so both sheafifications agree. | Correct. None. |
| §5.5 `triangularBaseChange` after R01 | repair instances in the scratch copy | elaborated type identical to the current one (quoted in R01). | None beyond R01. |
| Consumers bullet (previous R01) | genus two | `dim J = 2`, principal polarization of degree 1; no roadmap name to resolve. | Repaired. |

**One-tactic probes.** For each of the three new theorems, separate copies with `simp`, `rfl` and `infer_instance` in a scratch file: all nine fail (`unsolved goals`, `rfl failed`, `type class instance expected` / `failed to synthesize`). No pinned declaration states local constancy of the fibre degree or representability of the fppf sheaf (`PicZero/Basic.lean` docstring: “Local constancy of the degree in flat families and representability are not treated here”; `Fppf.lean`: “makes no representability claim”). No padding.

**Headlines.** Layer 0 now states three of its headlines natively (0.1, 0.3 degree, 0.3 representability over an affine base); the docstring's list of what remains unstatable was re-checked at 2fd255d after the pin bump: no abelian scheme, polarization, theta divisor, Poincaré bundle, algebraic equivalence of line bundles, semi-abelian scheme, relative dualizing sheaf, symplectic level structure or projective-morphism class under `TauCeti/AlgebraicGeometry` (grep by object; the `Polarization`/`Poincare`/`Jacobian` hits are quadratic forms, Poincaré series and other namespaces). The pin did add `PicardFunctor/Abel/*`, `PicardFunctor/BaseChange.lean`, `PicZero/BaseChange.lean`, `GroupScheme/Isogeny/*`, `GroupScheme/Torsion/*` and `EffectiveCartierDivisor/{Graph,Representable}.lean`; of these only the Abel-map and base-change natives bear on this roadmap (R02). Isogenies (`GroupScheme/Isogeny/Basic.lean`, finite flat surjective homomorphisms) do not give multiplication on abelian schemes, which is what §5.6 needs.

**Ownership.** `roadmaps grep` for `relativePicardFppfSheaf|relativePicardFiberDegree|isRepresentable_relativePicard` over the 459 open roadmap pull requests and main: hits only in this folder, in ModularCurves #1101 (a revision of a roadmap on main; it consumes the natives, builds nothing of Layer 0) and in JacobianChallenge #1892 (a draft revision of the parent roadmap by the same author, head 6bdc968, not on main). Against main the parent's Layer D is over a field (`TauCetiRoadmap/JacobianChallenge/README.md:218–275`: field Picard scheme, “representing comparison on all test schemes, the tensor-product group law, the unit”), so this roadmap owns the family statements of §§0.1–0.3 and the README's new supplier row “JacobianChallenge, Layer D (representing comparison)” resolves on main. **Note for the approver and the author:** the draft #1892 plans, in its Layer D, `HasPicardScheme f` for every `f : X ⟶ S`, the degree pieces `Pic^d_{X/S}` and `Pic⁰_{X/S}` representing `relativePicardDegreeZeroFppfSheaf f` for a proper smooth curve family over a general base, with base change by `relativePicardPresheafBaseChangeIso` (its README lines 436–476), while its `Suggested.lean` states only the field case (`hasPicardScheme_of_curve`). Those general-base targets are this roadmap's §§0.1–0.3. A revision pull request is never a supplier, and this pull request is the earlier one and the Part II by convention, so no change is requested here; but one of the two has to cede the general-base Picard scheme before both merge, and the parent's revision is the one re-planning. The fully qualified Lean names do not collide (`TauCetiRoadmap.JacobianChallenge.*` versus `…JacobianChallengePartII.RelativeJacobian.*`). `citations.md`'s 15 “Lean names found nowhere” are this file's twelve declarations and the three supplier API names of AbelianSchemesAndArithmeticModuli (`AbelianScheme.poincare`, `Polarization.graphBundle`, `Polarization.principal_iff`) already resolved by the previous report.

## Not verifiable

- Zhang, *Gross–Schoen cycles and dualising sheaves*, Lemmas 2.2.1–2.2.3 (§4.9, through Yuan §A.3): `uncertified` in the previous round; the passage is unchanged and was not reopened.
- Serre, *Lectures on the Mordell–Weil Theorem*, §5.6 (§3.4): `uncertified`; unchanged, not reopened.
- Mumford–Fogarty–Kirwan, *Geometric Invariant Theory*, §6.2 (§3.13): `uncertified`; unchanged, not reopened.

No manifest or pull-request file was edited; nothing parks the review.

## Source issues

- none
