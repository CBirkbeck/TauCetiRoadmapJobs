# GATE-TemperleyLieb~2: answers to human review

Reviewed head `3c903ce`; repairs committed as `6d5a5c7` (not pushed). There is one review, by CBirkbeck, with six findings, numbered H01–H06 in the order they appear.

## H01 (CBirkbeck) — applied

The claim checks out against the source. GoodmanWenzl2003 line 125–129 (Proposition 1.1, p. 4) states constancy of dimension for the span `A` of *any* set of diagrams. The proof at lines 138–140 adds up the four corners, which needs `eA ⊆ A` and `Af ⊆ A`. I recomputed the reviewer's counterexample in TL₃ with `δ(τ) = 1`: `p² = p`, `px = x = xr`, `xp = x² = 0`, so `E` and `F` are evaluable idempotents. Then `EAF = span((t−τ)x)` has dimension 1, while `E(τ)A(τ)F(τ) = p(τ)r(τ)ℂ = 0` has dimension 0. The refuted statement is the auxiliary lemma, not the classification theorem.

In `TauCetiRoadmap/TemperleyLieb/README.md` Layer 6 ("Tensor ideals and negligibles", lines 713–775), the old text "expose … its constant-dimension statement" is replaced by two named statements:
- **Constancy of dimension, restricted.** It is stated for the image of an `𝒪`-linear idempotent on a finite free `𝒪`-module, where `𝒪` is the local ring of rational functions regular at the specialization point. This covers full Hom corners `e·Hom·f` and lattices preserved by `e` and `f`. The counterexample is kept as the negative test.
- **Specialization-injectivity of `x ↦ z_α(τ)(x ⊗ 1_m)`** on `e(τ)T_n(τ)f(τ)`, as a separate target (GoodmanWenzl2003 line 795–800, Theorem 3.3, pp. 10–11). It names saturation of the image lattice (for example via an `𝒪`-linear left inverse) as the required step, or allows another proof. The first equality of the source's chain is not an instance of constancy, because multiplication by `z_α` need not preserve `T_n ⊗ 1_m`.

## H02 (CBirkbeck) — applied

At the Tau Ceti pin, `TauCeti/CategoryTheory/Preadditive/MorphismIdeal/Basic.lean` has:
- `TauCeti.MorphismIdeal` (line 85) and `smul_mem` (line 117);
- `Quotient` and `quotientFunctor` (lines 194–199), with `Preadditive` (line 202) and `Linear R` (line 338) instances;
- `quotientFunctor_map_eq_zero_iff` (line 213) and `lift` (line 306).

`Additive.lean` lines 43–52 add zero objects and biproducts.

What changed:
- **Layer 7, lines 801–850.** The old `MonoidalIdeal S C` built from separate hom-submodules, and its own `MonoidalQuotient` category, are replaced. `MonoidalIdeal C` now `extends TauCeti.MorphismIdeal C` with `whiskerLeft_mem` and `whiskerRight_mem`. `MonoidalQuotient I` and `toMonoidalQuotient I` are `abbrev`s for `I.toMorphismIdeal.Quotient` and `quotientFunctor`. Only the monoidal and `MonoidalLinear` instances remain as targets here.
- **Layer 6, lines 713–720.** Tensor ideals are now defined the same way.
- **Tau Ceti consume list.** A new entry for the morphism-ideal API (line 193).
- **Mathlib-gaps paragraph, "What is missing" and Ordering.** Reworded to say "monoidal structure on quotients".

## H03 (CBirkbeck) — applied

On main, PivotalSpherical Layer 3 puts `IsFiniteSemisimpleCategory` on a `k`-linear abelian category. Its Layer 4 fusion hypotheses also require `[Abelian C]`, `[MonoidalPreadditive C]`, `[MonoidalLinear k C]`, `[Simple (𝟙_ C)]` and Hom-finiteness. So "verbatim" with the old shorter list was wrong.

What changed:
- **New target, Layer 7 lines 851–873.** A `K`-linear additive idempotent-complete category with objects `X_i`, `End(X_i) ≃ₐ[K] K`, `Hom(X_i, X_j) = 0` for `i ≠ j`, and finite biproduct decompositions is abelian and Hom-finite.
- **Checks for the new target.** `Mat_ K` is a positive check. Projectives over the path algebra of `• → •` show the off-diagonal condition is needed: the map `P₂ → P₁` is mono and epi but not an isomorphism. Free `K[ε]/(ε²)`-modules show `End ≃ K` is needed: `ε` has no kernel.
- **Generic classification (line 874).** It now goes through the bridge before stating `IsFiniteSemisimpleCategory`.
- **Root-of-unity quotient (line 889).** It lists PivotalSpherical's full Layer 4 hypothesis set and says where each comes from.

## H04 (CBirkbeck) — applied

At the pin:
- `TauCeti/Combinatorics/Enumerative/PerfectMatching.lean` line 71 defines `IsPerfectMatching f` as `(∀ a, f (f a) = a) ∧ ∀ a, f a ≠ a`. That is exactly the first two conjuncts of our old `PlanarMatching`.
- `TauCeti.composeDiagram_assoc` is in `Brauer/Associativity.lean` (line 363), and `TauCeti.middleLoopCount` is in `Brauer/LoopCount.lean`. Both are for fixed size `k` only, and there is no associativity of the total loop count.

What changed:
- **Tau Ceti consume list.** New entry (line 181).
- **Boundary with Schur–Weyl (line 207).** The old sentence "the associativity argument does not transfer, so … TL-private" is replaced. It now says what Tau Ceti covers and what stays here: different sizes, the rotation and Dyck models, and total circle-count associativity.
- **Layer 1 (line 285).** `PlanarMatching` is now defined as a subtype of `TauCeti.PerfectMatching (Fin k)`.
- **New Layer 2 target (line 343): comparison with Brauer stacking.**
  - The boundary relabelling is: bottom `i ↦ inl i`, top `n + j ↦ inr (n−1−j)`.
  - The map is injective, and its image is the non-crossing Brauer diagrams.
  - The matching of `f ≫ g` goes to `composeDiagram` (image of `g`) (image of `f`), and the number of new circles is `middleLoopCount` of that pair.
  - Checks: `e₁` maps to cap `{inl 0, inl 1}` and cup `{inr 0, inr 1}`. `e₁ ≫ e₁` has loop count 1. The Brauer crossing is not in the image.
- **`TauCetiRoadmap/TemperleyLieb/Suggested.lean`.** `PlanarMatching` is now `{σ : TauCeti.PerfectMatching (Fin k) // non-interleaving}` (line 66), with `import TauCeti.Combinatorics.Enumerative.PerfectMatching`. The proved nested/crossing example is adapted to the new definition.

## H05 (CBirkbeck) — applied

The reviewer's counterexample holds. `ℤ` with one cell, `C = 1` and `ι = id` is cellular with cell form `(u, v) ↦ uv`, which is perfect, yet `ℤ` is not a semisimple ring.

Layer 5 "Cellular algebras" (line 608) now keeps the definition, cell modules, forms and base change over a commutative ring. The simple-module classification and "semisimple iff every cell form is nondegenerate" are now stated over a field (Graham–Lehrer, §3), with the `ℤ` example as the negative test. The Lean headlines already assume `[Field K]`.

## H06 (CBirkbeck) — applied

With one-based generators, the left–right reflection sends the arc `{i, i+1}` to `{n−i, n+1−i}`, that is `e_i ↦ e_{n−i}`, so it swaps `e₁` and `e₂` on three strands. Vertical reflection fixes each `e_i`.

- **Worked examples (line 921).** The old "`reflect` fixes every `e_i`" becomes: vertical reflection (`star`) fixes every `e_i`; `reflect` sends `e_i ↦ e_{n−i}` and exchanges `e₁` and `e₂` on three strands.
- **Layer 3 "The reflection involutions" (line 499).** It now names `reflect` as the horizontal reflection and records both behaviours on generators.

## Build

`lake build TauCetiRoadmap.TemperleyLieb.Suggested` succeeded with `Build completed successfully (8984 jobs).` The only warnings are `declaration uses 'sorry'` on the 8 headline theorems.

## Gate

`gate TemperleyLieb: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Depcheck (`--movable`): `depcheck: 162 roadmaps, 1163 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.

## Notes

- **Signatures.** The only Lean declaration whose type changed is `PlanarMatching (k : ℕ) : Type`. The file has no `variable` or `include` lines, so no binder can drop out. I did not elaborate a scratch `#check` file, because the brief allows only the build and gate commands. I compared each signature with its README statement by reading.
- **Citations.** `roadmaps resolve` reports none unresolved for either cross-roadmap citations or Lean names. The earlier lead `IsMarkovTrace.apply_jonesWenzl` is this roadmap's own declaration in `Suggested.lean`.
- **Ownership of the new or changed constructions.** The objects are `MonoidalIdeal` as a whiskering-closed `TauCeti.MorphismIdeal`, the monoidal quotient, the abelian/Hom-finite bridge, and the Brauer comparison. I searched by object across main and the open heads. HopfologicalAlgebra's tensor ideals live in stable or triangulated categories and are a different object. TemperleyLiebOperatorAlgebras A6 consumes this roadmap's fusion conditions. PivotalSpherical owns the semisimple predicate but not the bridge. No other owner was found, so this roadmap owns them. Nothing was moved down from a later roadmap.
- **Sources.**
  - Goodman–Wenzl was read at arXiv:math/0206301v1 (GoodmanWenzl2003).
  - Graham–Lehrer (DOI 10.1007/BF01232365) resolves only to a paywall. It is cited at section level (§3) without theorem numbers, and the service recorded it as `uncertified`.
  - The roadmap folder has no `sources.toml`, and the brief does not let me create files outside README and Suggested.lean, so neither key was written to a manifest.
- **Untrusted text.** The review contains no instruction-like text.

## Adversarial pass on changed statements

| Statement | Instances tried | Values | Result |
|---|---|---|---|
| Constancy (idempotent on finite free 𝒪-module) | `E` = corner map on `Hom^𝒪(3,3)`; reviewer's `A = span(1)` | image summand ⇒ free ⇒ rank equal; `A` not `E`-stable: generic 1 vs special 0 | true as restricted; counterexample excluded by hypothesis |
| Injectivity at τ | generic vs special rank of `x ↦ z_α(x⊗1)` | reduction gives special ≤ generic only | stated as separate target with saturation step |
| `MonoidalIdeal` / quotient | ℤ-linear `End n = ℤ` category, `I(n,n)=3^(2^n)ℤ` | `4−1=3∈I(0,0)`; whiskered `16−1=15∉9ℤ` | descent needs `[MonoidalPreadditive C]`, kept as binder |
| Abelian bridge | `Mat_ K`; proj over `K(•→•)`; free `K[ε]/ε²` | abelian; `P₂→P₁` mono+epi not iso; `ε²=0`, no kernel | both hypotheses necessary |
| `Simple 𝟙` from `End 𝟙 ≃ K` | 𝟙 = S ⊞ S' nonzero | `dim End ≥ 2` | holds in semisimple setting |
| Brauer relabelling | `e₁` on 2 strands; identity; crossing | `{0,1},{2,3}↦{inl0,inl1},{inr1,inr0}`; `{0,3},{1,2}` nested; crossing `{0,2},{1,3}` interleaves | encoding and image claim correct |
| Total circle associativity | `f ≫ g ≫ h` | `c(f,g)+c(f≫g,h)` = `c(g,h)+c(f,g≫h)` = total circles | stated as remaining target |
| Cellular criterion over ring | `ℤ`, one cell | form `1` perfect; ℤ not semisimple | restricted to fields |
| `reflect e_i = e_{n−i}` | n = 3, i = 1, 2 | `{1,2}↦{2,3}`, `{2,3}↦{1,2}` | `e₁↔e₂`; star fixes both |
| Lean `PlanarMatching` example | nested `(0 3)(1 2)`, crossing `(0 2)(1 3)` | `decide` accepts, rejects | builds |
