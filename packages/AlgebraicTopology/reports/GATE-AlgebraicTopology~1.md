# GATE-AlgebraicTopology~1: answers to review

Commit `8da418b5` on top of `d4d77c6`. Files changed: `TauCetiRoadmap/AlgebraicTopology/README.md`, `TauCetiRoadmap/AlgebraicTopology/Suggested.lean`.

## H01 (CBirkbeck) — answered
The folder still holds `PROGRESS.md` and `STATUS.md` besides README.md, Suggested.lean and metadata.toml. Both are on main and are generated files that the content repository's top-level `README.md` permits in every roadmap directory (section "Generated status files"). The gate reports `stray-files=0`, so nothing needs removing.

## H02 (CBirkbeck) — applied
Removing the separate `TauCetiRoadmap/AlgebraicTopology/TopologicalGroupFundamentalGroup.lean` is correct and stays done. A roadmap folder may not carry an extra Lean module.

## H03 (CBirkbeck) — applied differently
The folded `section TopologicalGroupFundamentalGroup` (`multiplicationMap`, `pointwise`, `commGroup` and seven theorems, Suggested.lean old lines 667–731) is removed rather than kept with `sorry`. There are two reasons:
- **It duplicates Tau Ceti at the pin.** `TauCeti/AlgebraicTopology/FundamentalGroup/TopologicalMonoid.lean` already proves both results under the same binders (`[TopologicalSpace M] [MulOneClass M] [ContinuousMul M]`):
  - line 118, `FundamentalGroup.instCommGroup : CommGroup (FundamentalGroup M 1)`;
  - line 108, `FundamentalGroup.cast_map_prod_mul`: the pointwise product of two loop classes is their product.
- **The fold made things worse.** It replaced proofs that were complete in the deleted file (including a `rfl` for `commGroup_toGroup`) with `sorry`, and seven of the ten declarations were unit/interchange/naturality API lemmas rather than headlines.

The Suggested.lean docstring now says this result is not stated because it is `FundamentalGroup.instCommGroup` at the pin. Both Tau Ceti declarations are pinned with `#check`, with the import `TauCeti.AlgebraicTopology.FundamentalGroup.TopologicalMonoid` added. The README inventory gains a bullet naming both declarations and their module.

## H04 (CBirkbeck) — applied differently
The link "[Suggested.lean] (section `TopologicalGroupFundamentalGroup`)" and the commit's label "Stage 3" were both wrong: the item is Stage 1 item 6 (README "Stage 1: van Kampen through the fundamental groupoid").

That item, previously "construct pointwise multiplication … prove that `FundamentalGroup G 1` is abelian … The accompanying Suggested.lean states the native construction", now reads "Consume Tau Ceti's `FundamentalGroup.instCommGroup` … Consume `FundamentalGroup.cast_map_prod_mul`". Naturality for a continuous unital multiplicative map is derived in one line from that identification plus the fact that `mapOfEq` is a homomorphism, and three Checks are added. This matches the "consume native …" form of Stage 1 items 1–5.

## Ownership
Tau Ceti owns this result at the pin, so this roadmap states nothing about it. No roadmap on main or in the listed open pull requests is cited for it.

## Signature check
I added `#check FundamentalGroup.instCommGroup` and `#check FundamentalGroup.cast_map_prod_mul` and elaborated them in the build. Each elaborated type carries exactly `{M} [TopologicalSpace M] [MulOneClass M] [ContinuousMul M]`, the same generality as the removed section and the README prose. No declaration of this roadmap was added or changed, and the remaining declarations are untouched.

## Adversarial pass (changed statements only)

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| Stage 1.6: π₁(G,1) commutative for `MulOneClass` + `ContinuousMul` | unit circle in ℂ; one-point monoid; wedge S¹∨S¹ (no unital multiplication); non-associative unital G | S¹: π₁ = ℤ, abelian ✓. Point: π₁ = 1 ✓. Wedge: π₁ = F₂ with ab ≠ ba, so the contrapositive rules out a strict unit at the wedge point, as expected. The Eckmann–Hilton argument uses only the units and interchange, so associativity is not needed, matching the `MulOneClass` binder. | holds | non-example added as a Check |
| Stage 1.6: class of `t ↦ γ t * δ t` equals `[γ]·[δ]` | S¹, γ = δ = degree-1 loop | Left: `z ↦ z²`, degree 2. Right: generator², i.e. 1+1 = 2 in ℤ ✓ | holds | added as a Check |
| Stage 1.6: naturality for continuous unital multiplicative `f` | `f = z ↦ z²` on S¹ | Left: `f∘(γ·δ)` has degree 2(1+1) = 4. Right: `f∘γ · f∘δ` has degree 2+2 = 4 ✓ | holds | none |
| Reversed composition (`FundamentalGroup.mul_def`) | any a, b in a commutative π₁ | a·b = b·a, so the order convention cannot change any value | immaterial here | noted in prose |
| Basepoint | the statement is about π₁(G,1) only | no claim is made at other basepoints | n/a | none |

## Build
The targeted build had one non-`sorry` warning, which the worker counts as a build problem: Lake warns that the file imports `Mathlib`, which is built for the module system, and suggests starting the file with `module`. The repair in `TauCetiRoadmap/AlgebraicTopology/Suggested.lean`:
- the header is now `module`, then `public import Mathlib` and the same fourteen `TauCeti.*` modules as `public import` (each of them is itself a `module` file at the pin), and `noncomputable section` → `@[expose] public noncomputable section`. This is the header `TauCetiRoadmap/CoboundaryExpansion/Suggested.lean` already uses on main, and the gate accepts `public import`;
- under the module system, the bodies of the Tau Ceti definitions are not exposed, so two definition bodies that type-checked by unfolding them now spell out the identification instead. `twistedSupportLocalMap` puts an `eqToHom` between `pullback (ContinuousMap.id X)` and pullback along `(supportLocalPairMap X B x hx).fst`. That equality is proved from `TopPair.ofSubsetMap_fst_apply`, which gives `fst = 𝟙 X`. `localHomologyMap` puts an `eqToHom (TopPair.singularHomologyFunctor_obj _ (ModuleCat.of R R) n)` after `singularHomologyInclIso.hom.app X`. Both transports are identities, so the two maps are the same as before. No signature, statement or README text changed, and the README descriptions of both maps still hold as written.

`lake build TauCetiRoadmap.AlgebraicTopology.Suggested` now gives `Build completed successfully (9063 jobs).` Every remaining warning is `declaration uses 'sorry'`; the module-system warning is gone.

## Gate
Without `--order`, the gate stopped twice on a GitHub API rate limit while fetching the merge order. It was rerun with `--order` pointing at the board's merge-order file:

`gate AlgebraicTopology: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

## Depcheck
`depcheck: 235 roadmaps, 2063 edges, 0 problem(s)`. There are no UPWARD, CYCLE or moved lines.

## Scope note
The pass covers the statements this repair changes. The other roadmap headlines were not re-audited for duplication with the pin in this job.
