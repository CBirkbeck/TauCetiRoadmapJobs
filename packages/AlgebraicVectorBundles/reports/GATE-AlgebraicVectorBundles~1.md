# GATE-AlgebraicVectorBundles~1: answers to human review

The review on head `17e9887` is by roed-math (2026-10-20). Repairs are in commit `8e1c3f29`, made on top of `17e9887` and not pushed. Only `TauCetiRoadmap/AlgebraicVectorBundles/README.md` and `TauCetiRoadmap/AlgebraicVectorBundles/Suggested.lean` changed.

## H01 (roed-math) — applied

The pins in the README were wrong. It called Mathlib `05ae010` and Tau Ceti `e8af08d` "the exact pins", but `lake-manifest.json` pins Mathlib `6b7abb3` and Tau Ceti `a91d3aa`. The old "Pinned inventory" section, with its stale-commit links, is replaced by "Exact supplier contracts", which states Mathlib `6b7abb3` and Tau Ceti `a91d3aa`. Every library name it cites was checked at those pins (see the `#check` record below).

## H02 (roed-math) — applied differently

`rank`, `symmetricPowerModules` and `exteriorPowerModules`, together with every other prototype that duplicated a pinned construction, are deleted rather than redefined as aliases. Examples are `FiniteLocallyFreeSheaf`, `isFiniteLocallyFreeOfRank`, `rankLocus`, `pullbackFiniteLocallyFree`, `dual`, `doubleDualIso` and `tildeFiniteProjectiveEquiv`. The new headline theorems use the native objects directly: `FiniteLocallyFreeSheaf.rank`, `SheafOfModules.symmetricPower X.sheaf n` and `SheafOfModules.exteriorPower X.sheaf n`. See `Suggested.lean` lines 54–76, `symmetricPower_isFiniteLocallyFree_rank` and `exteriorPower_isFiniteLocallyFree_rank`.

Aliases would be wrong under the acceptance-test rules. A definition may appear only when a headline needs it to be stated, and the natives already make every headline statable. The old file also failed the gate for unrelated reasons: 99 sorry'd data declarations, 6 `set_option`, 14 `Mathlib.<submodule>` imports and no `import Mathlib`. The file is now four headline theorems on native carriers. The README's Scope section maps each consumer-facing object to its Tau Ceti name, for example the fixed-rank predicate to `FiniteLocallyFreeSheaf.isConstantRank`.

## H03 (roed-math) — applied

The roadmap's own sorry'd instances are deleted: `modulesMonoidalCategory`, `modulesSymmetricCategory` and `modulesMonoidalClosedCategory`, their local instances, and `tensorUnderlyingIso`, `tensorSection`, `tensorUnitIso` and `tensorLeftAdjunction`. Every statement now elaborates against `Scheme.Modules.instMonoidalCategory`, `instSymmetricCategory` and `instMonoidalClosed`. README Conventions says that no second monoidal structure is introduced, so `CommMon X.Modules` is the same type here and in Tau Ceti. That removes the carrier mismatch the reviewer reproduced.

Strong symmetric monoidal pullback is not at the pin. It stays a target, at README Layer 1 (cited elsewhere as L0A), §1.1.

## H04 (roed-math) — applied

The roadmap's own `QuasicoherentAlgebra`, `isAffineSchemeOver`/`AffineSchemeOver` (a full subcategory of `Over X`) and the sorry'd `relativeSpec` are deleted. The headline `relativeSpec_isEquivalence (X) : (relativeSpec X).IsEquivalence` (`Suggested.lean` line 85) is stated on Tau Ceti's `relativeSpec`. That functor is defined on `QuasicoherentAlgebra X` and `AffineSchemeOver X = MorphismProperty.Over IsAffineHom ⊤ X`, which is the carrier the reviewer proposed adopting.

The reviewer's alternative, a comparison with the full subcategory of `Over X`, is not needed: nothing in the roadmap uses that carrier any more.

## H05 (roed-math) — applied

The README is restructured. "Scope and ownership" separates what is already at the pins from what the roadmap owns:

- **At the pins:** monoidal, symmetric and closed `X.Modules`; `QuasicoherentSheaf`; `FiniteLocallyFreeSheaf` with pullback and its identity and composition isomorphisms; rank, rank loci and rank formulas; fixed rank and rank one ≌ `InvertibleSheaf`; dual, rigidity and bidual; the affine finite-projective equivalence; the sheaf Sym/∧ functors; relative Spec and its affine computation.
- **Still owned here:** strong monoidal pullback; the dualizability criterion and internal-Hom comparisons; Sym/∧ rank formulas, pullback comparisons and the determinant; the pushforward algebra, functor of points, anti-equivalence and base change of relative Spec; graded algebras and linear schemes; geometric vector bundles.

The preservation, coherence, determinant and total-space work the reviewer asked to keep is kept, as README targets.

The layers are renumbered 1–7 because the gate requires `### k.n` target ids. "How to read the build" records that other roadmaps cite them as L0A, L0B, L0C, L1A, L1B, L2A, L2B (and L0).

## H06 (roed-math) — applied differently

`pullbackFiniteLocallyFreeObjIso` is not changed to `Iso.refl _`; it is deleted along with the roadmap's `pullbackFiniteLocallyFree`. Its content is Tau Ceti's `FiniteLocallyFreeSheaf.pullback` together with the simp lemma `FiniteLocallyFreeSheaf.pullback_obj_obj`, so restating it would duplicate the pin.

## H07 (roed-math) — applied

The README now has a supplier section "From TauCetiRoadmap.PadicMeasuresIwasawaAlgebras". It cites §5.1: the ring-level determinant by clopen rank decomposition, equal-rank determinant maps and base change. Layer 3, §3.3 "The determinant", lists §5.1 in its *Needs:* line and glues it on affine opens.

This matches the reciprocal contract already on main. PadicMeasuresIwasawaAlgebras README "Shared with TauCetiRoadmap.AlgebraicVectorBundles, layer 0C" says that layer owns the sheaf construction and §5.1 the ring level.

## H08 (roed-math) — answered

On dependencies: no pull request is a supplier. The suppliers are Mathlib, Tau Ceti at the pins and PadicMeasuresIwasawaAlgebras on main. The depcheck below reports 0 problems.

On the mathematical assessment (variance of `linearSpec` and `totalSpace`, the `Spec F_p[t]/(t^p)` non-example, the internal-Hom hypotheses): the README keeps these claims unchanged in substance.

- Variance is in Conventions, with a computed witness.
- The `𝔽_p[t]/(t^p)` non-example is a Check in Layer 6, §6.2 "Linear schemes".
- The internal-Hom hypotheses are in Layer 2, §2.2 "Internal Hom comparisons", which now has two separating counterexamples:
  - finitely presented `E = 𝒪/(t)`, pulled back to the origin (not flat): `0 → k`;
  - `E = 𝒪^(ℕ)`, which is not finitely presented, along flat `Spec ℚ → Spec ℤ`: the map `(∏ℤ)⊗ℚ → ∏ℚ` is not surjective.

## Build

`lake build TauCetiRoadmap.AlgebraicVectorBundles.Suggested`: `Build completed successfully (9057 jobs)`. There are four warnings, all `declaration uses 'sorry'`, at lines 45, 57, 71 and 85: the four headline theorems.

## Gate

`gate AlgebraicVectorBundles: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`

Depcheck (`--movable`): `depcheck: 148 roadmaps, 996 edges, 0 problem(s)`. There are no UPWARD, CYCLE or moved lines.

## Notes for the worker

**What `Suggested.lean` now states.** It imports only `Mathlib` plus the Tau Ceti modules `VectorBundle.Rank`, `VectorBundle.Dual.Basic`, `RelativeSpec.Functor`, `Sheaf.SymmetricPower` and `Sheaf.ExteriorPower`. The four headlines are:

- `isFiniteLocallyFree_iff_nonempty_hasLeftDual`
- `symmetricPower_isFiniteLocallyFree_rank`
- `exteriorPower_isFiniteLocallyFree_rank`
- `relativeSpec_isEquivalence`

The docstring names the headlines that cannot be stated at the pins, and what each lacks:

- base change of relative Spec: needs a monoidal structure on `Scheme.Modules.pullback`;
- `QCoh(X)ᵒᵖ ≌ LinearSch(X)`: needs the sheaf symmetric algebra as a quasi-coherent algebra and graded quasi-coherent algebras;
- `FinLocFree ≌ GeomVB` and the section universal property: need the same missing carriers.

**Consumers on main cite deleted Lean names.** Main cannot be edited from this job, so these citations will need updating:

- SchemeAndStackFoundations README lines 85–88, 156–162 and 401–405: `isFiniteLocallyFreeOfRank`, `pullbackQuasicoherentAlgebra`, `relativeSpecHomEquiv`, `relativeSpecEquiv`, `relativeSpecBaseChangeIso`, `GradedQuasicoherentAlgebra`, `symmetricAlgebra`, `gradedSymmetricAlgebra`, `totalSpaceScheme`, `totalSpace`, `determinant`;
- AdicSpacesPartIII: L0A and L0B;
- GroebnerGeometry: L0 and L2A.

Their layer labels still resolve through the label sentence in "How to read the build". The native replacements are listed in README Scope.

**`#check` record.** `#check @name` was run for all four headlines and 62 library names cited in the README, by appending them temporarily to `Suggested.lean` and building once; the file was then restored and rebuilt clean.

- The four headline signatures match their README statements. Their only binders are their own: `{X : Scheme.{u}}`, `E` and `n`. None depends on section variables.
- Twelve README names did not resolve at first and were corrected: `TauCeti.SheafOfModules.monoidalClosed`, `Scheme.Modules.isFiniteLocallyFree_iff_exists_openCover`, `InvertibleSheaf.fixedRankOneEquiv`, `TauCeti.AlgebraicGeometry.relativeSpecAffineIso`, and the namespaced `FiniteLocallyFreeSheaf.rank*` lemmas.
- The rest (`pullbackId`, `pullbackComp`, `isConstantRank`, `FixedRank`, `evalIso`, `finiteProjectiveEquiv`, `ihomStalkEquiv`) exist at the pin in modules that were not imported. Their namespaces were confirmed in the source: `Functoriality.lean`, `FixedRank.lean`, `Dual/Bidual.lean`, `Affine/Basic.lean`, `InternalHom/FinitePresentation.lean` line 306.

**Ownership.** Each owned object was searched for by subject (dualizability criterion, Sym/∧ rank, determinant sheaf, relative Spec equivalence or base change, linear schemes, total space) with `roadmaps grep` and in the Tau Ceti pin.

- The only overlaps found are the pinned Tau Ceti constructions, which are now consumed, and PadicMeasuresIwasawaAlgebras §5.1, which is ring-level only and cited.
- SchemeAndStackFoundations consumes these objects and does not own them.
- `roadmaps resolve` on the new README reports no unresolved cross-roadmap citation.
- No declaration in `Suggested.lean` shares a fully qualified name with another roadmap's declaration.

**Sources.**

- Stacks tags were fetched through the sources service and read at:
  - Modules: 0FNU line 1171, 01CI line 1404, 01CK line 1414, 01CM line 1454, 0C6I line 1521;
  - Algebra: 00NX line 8610;
  - Constructions: 01LQ line 202, 01M1 line 336, 062N line 364;
  - Morphisms: 01SA line 865.
- Old README locators corrected: the relative-Spec equivalence is cited as 01SA, not 01LQ alone; the old README's EGA and Huybrechts–Lehn references are no longer used and are dropped; "Stacks §27.6" is replaced by tag 01M1.
- This job may not create `sources.toml`, and the folder has none, so the fetched entries are not recorded in a manifest. The worker should add `stacks-0FNU`, `stacks-00NX`, `stacks-01CI`, `stacks-01CK`, `stacks-01CM`, `stacks-0C6I`, `stacks-01LQ`, `stacks-01M1`, `stacks-062N` (fetched under `stacks-01M1`, the same PDF) and `stacks-01SA` (fetched under `stacks-01S5`, the same PDF).
- No `needs-references.toml` was written.

**Untrusted text.** The review contains no instructions beyond mathematical and API claims; nothing suspicious.

**Not changed.** `PROGRESS.md`, `STATUS.md` and `metadata.toml`. `PROGRESS.md`, which is the progress-report text of this pull request, still describes proving functor laws in declarations that no longer exist. The worker should update or drop it when replying.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `isFiniteLocallyFree_iff_nonempty_hasLeftDual` | X = ∅; `𝒪^(ℕ)` on Spec k; `k[t]/(t)` on Spec k[t]; `𝒪^r` | ∅: zero sheaf, both sides true. `𝒪^(ℕ)`: locally free, not finite; coevaluation lands in finite sums, so no dual; both sides false. `k[t]/(t)`: f.p. not flat, both false. `𝒪^r`: both true | holds. A QCoh dual is an `X.Modules` dual because the subcategory is full monoidal, then 0FNU and 00NX | new headline; the first two instances are Checks in §2.1 |
| `symmetricPower_isFiniteLocallyFree_rank` | (r, n) = (0,0), (0,1), (0,2), (1,n), (2,2); char 2 | multichoose: 1, 0, 0, 1, 3; ranks of Sym: 1 (𝒪), 0, 0, 1, 3 (x², xy, y²); char 2: still 3 | holds; tensor-power model gives 4 at (2,2), excluded | new headline; Checks in §3.1 |
| `exteriorPower_isFiniteLocallyFree_rank` | (r, n) = (0,0), (2,2), (2,3); over 𝔽₂ the antisymmetric-only quotient | choose: 1, 1, 0; ∧: 𝒪, rank 1, 0. Over 𝔽₂, `V⊗V/(v⊗w+w⊗v)` has dim 4 − 1 = 3 ≠ 1 | holds; the alternating relation is needed | new headline; Check in §3.1 |
| `relativeSpec_isEquivalence` | X = ∅; X = Spec k with `𝔸²∖0`; A = 𝒪[t]/(t²−x) on 𝔸¹ | ∅: both categories trivial. `𝔸²∖0 → Spec k`: not affine, so not an object; its function algebra k[x,y] gives `𝔸²`. Double cover: pushforward free of rank 2, basis 1, t, gives back A | holds for arbitrary X with all X-morphisms (01SA) | new headline; an incorrect skyscraper Check was replaced (a skyscraper at a closed point *is* quasi-coherent) |
| L1 pullback monoidal (README §1.1) | `ℤ/p² ⊗ ℤ/p²` pulled back to 𝔽_p | `(ℤ/p²)⊗𝔽_p = 𝔽_p`; `𝔽_p⊗𝔽_p = 𝔽_p` | iso without flatness | Check kept |
| internal-Hom base change (README §2.2) | `𝒪/(t)` to the origin of `𝔸¹`; `𝒪^(ℕ)` along Spec ℚ → Spec ℤ | `f^*Hom(E,𝒪) = 0` vs `Hom(k,k) = k`; `(∏ℤ)⊗ℚ → ∏ℚ` misses (1, 1/2, 1/3, …) | both hypotheses needed | Checks added |
| determinant (README §3.3) | `𝒪^r` with matrix A; Spec k ⊔ Spec k with ranks 1, 2; r = 0 | A acts by det A (dual convention would give det A⁻¹; transpose gives det A, so it was removed from the Check); det invertible of rank 1, ∧¹ and ∧² are not; det(0) = 𝒪 | holds | Check wording fixed (transpose) |
| functor of points (README §4.2) | A = 𝒪, 𝒪[t], 𝒪×𝒪 | 1 map; Γ(T,𝒪_T); idempotents of Γ(T,𝒪_T) = clopen splittings | holds | — |
| base change (README §5.2) | A = 𝒪[t]; f = id; f = closed point, A = 𝒪×𝒪 | `𝔸¹_Y` both sides; identity; two points both sides | holds | — |
| linear schemes (README §6.2) | `Spec 𝔽_p[t]/(t^p)`; `𝒪^r`; t ↦ t² | module scheme, Sym(A₁) = 𝔽_p[t] → A not injective, so excluded; `𝔸^r`; over X but not graded, so not a morphism | holds | — |
| total space (README §7.1) | E = 𝒪^r with matrix A; E = 0; zero map | `𝔸^r`, T-points transform by f^*A (the V_lin(E) model gives the transpose in the opposite direction); V(0) = X; zero-section map | holds | — |
| variance witness (Conventions) | E = 𝒪, multiplication by a | `V(𝒪) = 𝔸¹`, acts by f^*a on T-points | holds | — |
