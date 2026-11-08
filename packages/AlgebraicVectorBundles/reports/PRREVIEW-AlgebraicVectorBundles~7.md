# Review of AlgebraicVectorBundles (pull request #1221 at 7054679)

**Verdict:** needs changes

This is an incremental re-review of the 58 lines that changed in the folder since `f040782`.

- **What changed in the folder.** 54 of the lines are the generated `PROGRESS.md` and `STATUS.md`, which the merge of `main` (`cb8e0107`) brought in unchanged. The other 4 are the two power imports of `Suggested.lean`, renamed from `…Sheaf.SymmetricPower` / `…Sheaf.ExteriorPower` to `….SymmetricPower.Basic` / `….ExteriorPower.Basic`.
- **The pin change.** The same merge moved the pull request's `lake-manifest.json` to main's pins: Tau Ceti `2fd255d9` (was `a91d3aa`), Mathlib `1b1ccf4b` (was `6b7abb3`), toolchain `v4.36.0-rc2`. The import rename is right for that pin, and the file builds.
- **What the pin change breaks.** At `2fd255d9`, Tau Ceti already has:
  - five of the ten theorems of `Suggested.lean`;
  - the determinant that the file defines;
  - the three headlines that its docstring calls not statable.

  The README still claims all of these as this roadmap's work, and its supplier inventory still names the old pins.

The previous report warned that a pin bump would need this rewrite, not an import rename. R01–R04 and R08 are that rewrite. R05–R07 are the three `statement-hygiene` hits of the gate.

## R01 (P2) — The module docstring calls three headlines "not statable", but Tau Ceti has them at the pin

**Location.** `TauCetiRoadmap/AlgebraicVectorBundles/Suggested.lean:28–39`: "Headline theorems of the roadmap that are not statable at the pins: * the base-change isomorphism `Y ×_X Spec_X(A) ≅ Spec_Y(f^* A)` … the pinned comparison is only oplax monoidal".

**Claim.** Every carrier this list calls missing exists at Tau Ceti `2fd255d9`, and each of the three headlines is already a library declaration there:
- base change: `QuasicoherentAlgebra.pullback` and `relativeSpecBaseChangeIso`;
- `QCoh(X)ᵒᵖ ≌ LinearSch(X)`: `linearSpecEquiv`;
- `FinLocFree(X) ≌ GeomVB(X)` and the section-valued universal property: `totalSpaceEquiv` and `totalSpaceHomEquiv`.

The docstring's reason for the first bullet, that pulling back an algebra needs a strong monoidal pullback the pin lacks, is also out of date.

**Witness.** These elaborate at the pin:
- `relativeSpecBaseChangeIso : (QuasicoherentAlgebra.pullback f).op ⋙ relativeSpec Y ≅ relativeSpec X ⋙ baseChangeAffineSchemeOver f` (`RelativeSpec/BaseChange.lean:272`);
- `linearSpecEquiv X : (QuasicoherentSheaf X)ᵒᵖ ≌ QuasicoherentLinearScheme X` (`VectorBundle/LinearScheme.lean:299`);
- `totalSpaceEquiv` and `totalSpaceHomEquiv` (`VectorBundle/Geometric.lean:272`, `VectorBundle/TotalSpace.lean:130`).

None of these files exists at `a91d3aa`.

**Repair.**
1. Delete the three bullets.
2. Name the four declarations as Tau Ceti's at the pin, consumed and not restated. They are data (`≅`, `≌`, `≃`), so a restatement would be `Nonempty`-padding.
3. Keep under "not statable" only what the pin really lacks. Grepping the pin, that is two §3.3 statements: the affine comparison between the determinant and the graded-line determinant of PadicMeasuresIwasawaAlgebras §5.1, and the Koszul-sign compatibility on the same graded lines. Both are missing because graded lines are a target of that roadmap, not a declaration at the pins.

Tested: the four `#check`s elaborate in a scratch file that imports `TauCeti.AlgebraicGeometry.RelativeSpec.BaseChange`, `….VectorBundle.Geometric` and `….VectorBundle.TotalSpace`. The Lean side of this repair goes with R03 and R04, and the README side with R02.

## R02 (P2) — The README claims as this roadmap's work, and as missing from the pins, what Tau Ceti states at `2fd255d9`

**Location.**
- `TauCetiRoadmap/AlgebraicVectorBundles/README.md:28–44`: "The roadmap owns: - the dualizability criterion … (Layer 2); … - geometric vector bundles, the total space, its universal property and the sheaf/geometric dictionary (Layer 7)".
- Also the Summary `:8–12`, the "Already at the pins" paragraph `:46–54`, and `:73–75`.

**Claim.** This overclaims the scope. Most items the README says it owns are library declarations at the manifest's pin. Lines `:73–75` also assign general qcqs pushforward and kernels to SchemeAndStackFoundations §0.4, although the library has both.

**Witness.**
- `QuasicoherentSheaf.nonempty_hasLeftDual_iff_isFiniteLocallyFree` holds on every scheme (`VectorBundle/Dual/Dualizable.lean:72`).
- `relativeSpecEquiv` is at `RelativeSpec/Equivalence.lean:114`.
- `Scheme.Modules.isQuasicoherent_pushforward` takes `[QuasiCompact f] [QuasiSeparated f]` (`Modules/Quasicoherent/Pushforward/QuasiSeparated.lean:107`).

The full list is in the table below.

**Repair.**
1. Move each row of the table into the "Already at the pins" paragraph `:46–59`, with its exact name and file.
2. Delete the Layer targets that only restate a library declaration, list them as deferrals under Scope, and rewrite the Summary to say what is left.
3. Keep owning what the pin lacks:
   - §1.1 for all `𝒪_X`-modules;
   - §3.2 for all `𝒪_X`-modules;
   - from §3.3, the direct-sum isomorphism with its sign and the graded-line affine comparison;
   - any part of §7.2 that `VectorBundle/TotalSpace/*.lean` does not already state.
4. Replace `:73–75` with the two library instances.
5. If any section number changes, extend the old → new paragraph `:186–187` to cover it.

All paths below are relative to `TauCeti/AlgebraicGeometry/` at `2fd255d9`.

| § | What the README says it owns | What Tau Ceti `2fd255d9` has |
| --- | --- | --- |
| 1.1 | strong symmetric monoidal pullback on all modules | only when one factor is quasi-coherent: `Scheme.Modules.isIso_pullback_δ_of_isQuasicoherent`, `…_right` (`Modules/Pullback/Quasicoherent.lean:151`, `:172`), and `QuasicoherentSheaf.pullbackBraided` on QCoh (`Modules/Pullback/Monoidal/Basic.lean:169`). **Keep the all-module statement.** |
| 2.1 | dualizability criterion | `QuasicoherentSheaf.nonempty_hasLeftDual_iff_isFiniteLocallyFree`, every scheme (`VectorBundle/Dual/Dualizable.lean:72`) |
| 2.2 | quasi-coherence of internal Hom; base-change comparison and its criteria | `isQuasicoherent_ihom_of_isFinitePresentation` (`Modules/InternalHom/Quasicoherent.lean:92`); `pullbackIhomComparison` (`Modules/Pullback/InternalHom/Basic.lean:49`); flat base change on any base, `Scheme.Hom.isIso_pullbackIhomComparison_app` (`…/InternalHom/Flat.lean:115`, `[Flat f]` at `:63`) |
| 3.1 | finite local freeness and ranks of powers | `FiniteLocallyFreeSheaf.rank_symmetricPower_apply` (`VectorBundle/SymmetricPower/Basic.lean:74`), `…rank_exteriorPower_apply` (`VectorBundle/ExteriorPower/Basic.lean:93`) |
| 3.2 | power–pullback isomorphisms, all modules | quasi-coherent case only: `isIso_pullbackSymmetricPowerComparison_app` (`Modules/SymmetricPower/Pullback/Quasicoherent.lean:52`), `isIso_pullbackExteriorPowerComparison_app` (`Modules/ExteriorPower/Pullback/Quasicoherent.lean:53`). **Keep the all-module statement.** |
| 3.3 | determinant, fixed-rank functor, core functoriality, pullback | `FiniteLocallyFreeSheaf.det` (`VectorBundle/Determinant/LocallyConstantRank.lean:62`), `determinantCore` (`:103`), `FiniteLocallyFreeSheaf.determinant` (`VectorBundle/Determinant/Basic.lean:59`), `pullbackDeterminantIso` (`VectorBundle/Determinant/Pullback.lean:76`). No direct-sum isomorphism: **keep it and the graded-line comparison.** |
| 4.1 | pushforward algebra, pullback of algebras | `affineFunctions` (`RelativeSpec/AffineFunctions.lean:65`), `QuasicoherentAlgebra.pullback` (`RelativeSpec/PullbackAlgebra.lean:158`) |
| 4.2 | functor of points | `relativeSpecHomIso` (`RelativeSpec/UniversalProperty.lean:455`) |
| 5.1 | anti-equivalence | `relativeSpecEquiv` (`RelativeSpec/Equivalence.lean:114`) |
| 5.2 | base change | `relativeSpecBaseChangeIso` (`RelativeSpec/BaseChange.lean:272`) |
| 6.1 | sheaf symmetric algebra, graded QC algebras | `GradedQuasicoherentAlgebra` (`Modules/Quasicoherent/GradedAlgebra/Basic.lean:96`), `gradedSymmetricAlgebraEquiv` (`…/GradedAlgebra/Free.lean:68`) |
| 6.2 | linear schemes, `QCoh(X)ᵒᵖ ≌ LinearSch(X)` | `QuasicoherentLinearScheme` (`VectorBundle/LinearScheme.lean:97`, defined as the README's `LinearSch(X)`: graded affine, freely generated in degree one, grading-preserving maps), `linearSpecEquiv` (`:299`) |
| 7.1 | `GeomVB`, total space, equivalence, universal property | `GeometricVectorBundle` (`VectorBundle/Geometric.lean:118`; degree-one piece finite locally free at `:96`, the README's `GeomVB(X)`), `totalSpaceEquiv` (`:272`), `totalSpaceHomEquiv` (`VectorBundle/TotalSpace.lean:130`), naturality in `T` (`VectorBundle/TotalSpace/FunctorOfPoints.lean:61`) |
| 7.2 | sheaf/geometric dictionary | `VectorBundle/TotalSpace/{Biproduct,Tensor,InternalHom,SymmetricPower,ExteriorPower,Determinant,Fiber,Group}.lean`, for example `totalSpaceSchemeBiprodIso`, `totalSpaceTensorHomEquiv`, `totalSpaceFiberIso`, `totalSpaceHomAddEquiv` |
| `:73–75` | qcqs pushforward and kernels, handed to SchemeAndStackFoundations §0.4 | `Scheme.Modules.isQuasicoherent_pushforward` (`Modules/Quasicoherent/Pushforward/QuasiSeparated.lean:107`), `Scheme.Modules.isQuasicoherent_kernel` (`Modules/Quasicoherent/Kernels.lean:60`) |

## R03 (P3) — Five theorems of `Suggested.lean` close in one tactic at the pin

**Location.** `Suggested.lean:83` `isFiniteLocallyFree_iff_nonempty_hasLeftDual`, `:93` `ihom_isQuasicoherent`, `:105` `symmetricPower_isFiniteLocallyFree_rank`, `:119` `exteriorPower_isFiniteLocallyFree_rank`, `:183` `relativeSpec_isEquivalence`.

**Claim.** At this pin these five are padding: each restates a Tau Ceti declaration.

**Witness.** On a scratch copy elaborated with `lake env lean`, each closes with no error by one tactic:

| Theorem | Closing tactic |
| --- | --- |
| `isFiniteLocallyFree_iff_nonempty_hasLeftDual` | `exact (QuasicoherentSheaf.nonempty_hasLeftDual_iff_isFiniteLocallyFree E).symm` |
| `ihom_isQuasicoherent` | `infer_instance` |
| `symmetricPower_isFiniteLocallyFree_rank` | `exact ⟨_, FiniteLocallyFreeSheaf.rank_symmetricPower_apply n E⟩` |
| `exteriorPower_isFiniteLocallyFree_rank` | `exact ⟨_, FiniteLocallyFreeSheaf.rank_exteriorPower_apply n E⟩` |
| `relativeSpec_isEquivalence` | `exact (relativeSpecEquiv X).isEquivalence_functor` |

**Repair.**
1. Delete the five theorems from `Suggested.lean`.
2. Cite the library declarations in the README (R02), and remove the five backticked names from the README, which the gate requires.

The deletion also removes a wrong citation. The docstring at `:80–82` calls `QuasicoherentSheaf.nonempty_hasLeftDual_iff_isFiniteLocallyFree` "the affine case", but at this pin that name is the theorem for every scheme. The affine-only version that the name denoted at `a91d3aa` (`Modules/Tilde/Dual.lean:113`, `[IsAffine X]`) is gone.

## R04 (P3) — The determinant block restates Tau Ceti's `FiniteLocallyFreeSheaf.det`

**Location.** `Suggested.lean:148–176`: `determinantModule`, `isInvertible_determinantModule`, `determinantObj`, `determinantModule_restrict_rankLocus`.

**Claim.** This duplicates an object the library already has. At the pin, Tau Ceti builds the same sheaf as an `InvertibleSheaf X`: the product over `n` of the pushforwards of `∧ⁿ E` restricted to the rank fibres. It also has the restriction of that sheaf to a constant-rank open.

**Witness.**
- `FiniteLocallyFreeSheaf.det : FiniteLocallyFreeSheaf X → InvertibleSheaf X` (`VectorBundle/Determinant/LocallyConstantRank.lean:62`) is built on `locallyConstantExteriorPower` (`Modules/ExteriorPower/LocallyConstant.lean:57–76`).
- `restrictLocallyConstantExteriorPowerIso E.rank (E.rankLocus r).toOpens _` elaborates in a scratch file.

**Repair.**
1. Keep only the alias that consumers use:

   ```lean
   noncomputable abbrev determinantObj {X : Scheme.{u}} (E : FiniteLocallyFreeSheaf X) :
       InvertibleSheaf X :=
     FiniteLocallyFreeSheaf.det E
   ```

   It elaborates at the pin (scratch). SchemeAndStackFoundations uses `determinantObj E` only as an `InvertibleSheaf X` (`TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean:2565`), so the alias keeps its type.
2. Delete `determinantModule`, `isInvertible_determinantModule` and `determinantModule_restrict_rankLocus`.
3. In README §3.3, cite `det`, `determinantCore`, `FiniteLocallyFreeSheaf.determinant` and `pullbackDeterminantIso`. Keep the direct-sum and graded-line targets.

This repair also clears R07.

## R05 (P3) — Gate `statement-hygiene`: `symmetricPower_pullback` concludes `Nonempty (… ≅ …)`

**Location.** `Suggested.lean:130–132`: "`Nonempty ((SheafOfModules.symmetricPower X.sheaf n ⋙ Scheme.Modules.pullback f) ≅ (Scheme.Modules.pullback f ⋙ SheafOfModules.symmetricPower Y.sheaf n))`".

**Claim.** An existential isomorphism does not fix the comparison. It is weaker than §3.2, which asks for the canonical comparison, compatible with the degree-zero and degree-one isomorphisms and with `pullbackComp`.

**Witness.** Over `Spec ℚ` with `f = 𝟙` and `n = 1`, the negative of the canonical isomorphism also satisfies `Nonempty`. At this pin the canonical map exists: `Scheme.Modules.pullbackSymmetricPowerComparison f n : Symⁿ ⋙ f^* ⟶ f^* ⋙ Symⁿ` (`Modules/SymmetricPower/Pullback/Basic.lean:47`).

**Repair.** State the following, and rename README §3.2's backticked name to match:

```lean
theorem symmetricPower_pullback_isIso {X Y : Scheme.{u}} (f : Y ⟶ X) (n : ℕ) :
    IsIso (Scheme.Modules.pullbackSymmetricPowerComparison f n)
```

Tested:
- It elaborates with `import TauCeti.AlgebraicGeometry.Modules.SymmetricPower.Pullback.Basic`.
- `infer_instance` fails on it, because the library instance needs `[M.IsQuasicoherent]`, so the statement is not padding.
- On the non-quasi-coherent `j_! 𝒪_U` of the §1.1 Check, with `n = 2`, both sides are `κ(x)` at `x ∈ U` and the comparison sends `1·1 ↦ 1·1`. At the origin both sides are `0`.

## R06 (P3) — Gate `statement-hygiene`: `exteriorPower_pullback` concludes `Nonempty (… ≅ …)`

**Location.** `Suggested.lean:137–139`: "`Nonempty ((SheafOfModules.exteriorPower X.sheaf n ⋙ Scheme.Modules.pullback f) ≅ (Scheme.Modules.pullback f ⋙ SheafOfModules.exteriorPower Y.sheaf n))`".

**Claim.** Same defect as R05.

**Witness.** The same negated isomorphism. The canonical map is `Scheme.Modules.pullbackExteriorPowerComparison f n` (`Modules/ExteriorPower/Pullback/Basic.lean:129`).

**Repair.** State the following, and rename the README name to match:

```lean
theorem exteriorPower_pullback_isIso {X Y : Scheme.{u}} (f : Y ⟶ X) (n : ℕ) :
    IsIso (Scheme.Modules.pullbackExteriorPowerComparison f n)
```

Tested in the same way: it elaborates, and `infer_instance` fails. On `j_! 𝒪_U` both sides are `κ(x)` in degree 1 and `0` in degree 2 at `x ∈ U`, and `0` at the origin.

## R07 (P3) — Gate `statement-hygiene`: `determinantModule_restrict_rankLocus` concludes `Nonempty (… ≅ …)`

**Location.** `Suggested.lean:170–175`: "`Nonempty ((Scheme.Modules.pullback (Scheme.Opens.ι (E.rankLocus r).toOpens)).obj (determinantModule E) ≅ …)`".

**Claim.** An existential isomorphism does not identify the restriction with `∧ʳ E` by the canonical map.

**Witness.** For `X = Spec ℚ`, `E = 𝒪` and `r = 1`, both the canonical identification and twice it satisfy `Nonempty`. The library's `restrictLocallyConstantExteriorPowerIso` is the canonical map: the projection onto factor `r`, read through the restriction unit (`Modules/ExteriorPower/LocallyConstant.lean:164`).

**Repair.** Delete the theorem together with R04, since the library's isomorphism states it. If it is kept, state `IsIso` of the projection-then-counit map instead.

## R08 (P3) — The supplier inventory names the old pins, files missing at the new pin, and a declaration missing at the new pin

**Location.** `README.md:107` "At Mathlib `6b7abb3`:"; `:127` "At Tau Ceti `a91d3aa`:"; `:145–147` `Scheme.Modules.isQuasicoherent_pushforward_specMap` "(…/Modules/Quasicoherent/Pushforward.lean)"; `:160–162`; `:167` "(…/Sheaf/SymmetricPower.lean, ExteriorPower.lean)".

**Claim.** This is supplier drift. The manifest pins Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`, and the cited declaration and files do not exist there. Lines `:160–162` also call the criterion affine-only and place it in `Modules/Tilde/Dual.lean`.

**Witness.**
- No declaration `isQuasicoherent_pushforward_specMap` exists at `2fd255d9` (grep).
- `Modules/Quasicoherent/Pushforward`, `Sheaf/SymmetricPower` and `Sheaf/ExteriorPower` are now directories.
- The criterion is at `VectorBundle/Dual/Dualizable.lean:72`, for every scheme.

**Repair.**
1. Change the headings to `1b1ccf4b` and `2fd255d9`.
2. Replace `:145–147` with `Scheme.Modules.isQuasicoherent_pushforward` (`…/Pushforward/QuasiSeparated.lean`), or drop it along with Layer 4 under R02.
3. Point `:160–162` at `VectorBundle/Dual/Dualizable.lean`, and `:167` at `SymmetricPower/Basic.lean` and `ExteriorPower/Basic.lean`.

The other 81 backticked names of `:103–175` resolve at the new pins by declaration name (grep), so no further edits are needed there.

## Previous findings

- none: the previous report (`PRREVIEW-AlgebraicVectorBundles~5`, at `f040782`) raised no finding and accepted. R08 of this report is the defect class of R02 of `PRREVIEW-AlgebraicVectorBundles~4` (the inventory naming files absent at its pin). That report's repair held at `a91d3aa`, and the move to `2fd255d9` has brought the defect back.

## Verified sound

**Head, scope and worktree.**
- HEAD is `7054679bc2cbfbd25cb4b3670a4b3ffb96ad4589` and the worktree is clean.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The files listed outside the folder in the change summary are main's own commits, brought in by the merge `cb8e0107`.
- Since `f040782` there are two commits: that merge, and `7054679b`, which changes the two import lines.
- `git diff origin/main HEAD` on the folder touches only `README.md` and `Suggested.lean`, so `PROGRESS.md` and `STATUS.md` equal main's.

**Pins.** The manifest pins Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` and Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, with toolchain `v4.36.0-rc2`. The packages checkout is at exactly these revisions. Before the merge they were `a91d3aa` / `6b7abb3` / `v4.35.0-rc3`. The Tau Ceti clone carries `a91d3aa` in its history, so every "absent at `a91d3aa`" claim in this report was checked with `git cat-file` / `git grep` at that commit.

**Gate rerun (independent).** The rerun matches the worker's: the only failing check is `statement-hygiene`, with three P3 hits at lines 131, 138 and 172 (R05–R07).

```text
gate AlgebraicVectorBundles: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=3 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
```

The worker's gate at this head also reports `build=0`.

**Dependency check (independent)**, run with the prescribed `--movable` and `--content` arguments:

```text
depcheck: 238 roadmaps, 2349 edges, 0 problem(s)
```

It reports no UPWARD, CYCLE or moved line. The diff changes no `*Needs:*` line and cites no roadmap.

**Elaboration and signatures.**
- `lake env lean` on `TauCetiRoadmap/AlgebraicVectorBundles/Suggested.lean` exits 0. It reports exactly ten `declaration uses 'sorry'` warnings (lines 54, 83, 93, 105, 119, 130, 137, 159, 170, 183) and no other diagnostic. Both new imports have object files at the pin.
- A scratch copy with `#check @name` for all 15 declarations prints the types in the worker's signature list, and the same types as at `f040782`.
  - `ihom_isQuasicoherent` keeps `[E.IsFinitePresentation] [F.IsQuasicoherent]`.
  - `pullback_tensor_isIso` quantifies over every `f` and every `E F : X.Modules`.
  - No binder disappeared and no signature changed.
- The one-tactic probe (R03) and the repaired statements (R05, R06, R04's alias) were elaborated in two further scratch files. Their modules were built from the cache with `lake build <module>`.

**Library locations opened at Tau Ceti `2fd255d9` (39).** All paths are relative to `TauCeti/AlgebraicGeometry/`:
- dual and internal Hom: `VectorBundle/Dual/Dualizable.lean:72`; `Modules/InternalHom/Quasicoherent.lean:92`; `Modules/Pullback/InternalHom/Basic.lean:49`; `…/InternalHom/Flat.lean:63, 103, 115`;
- relative Spec: `RelativeSpec/Equivalence.lean:114, 123`; `RelativeSpec/BaseChange.lean:272`; `RelativeSpec/PullbackAlgebra.lean:158`; `RelativeSpec/UniversalProperty.lean:455`; `RelativeSpec/AffineFunctions.lean:65`;
- powers and their ranks: `VectorBundle/SymmetricPower/Basic.lean:74`; `VectorBundle/ExteriorPower/Basic.lean:93`;
- power–pullback comparisons: `Modules/SymmetricPower/Pullback/Basic.lean:47`; `Modules/ExteriorPower/Pullback/Basic.lean:129`; `Modules/SymmetricPower/Pullback/Quasicoherent.lean:52`; `Modules/ExteriorPower/Pullback/Quasicoherent.lean:53`;
- determinant: `VectorBundle/Determinant/LocallyConstantRank.lean:62, 103`; `VectorBundle/Determinant/Basic.lean:59`; `VectorBundle/Determinant/Pullback.lean:76`; `Modules/ExteriorPower/LocallyConstant.lean:57, 164`;
- tensor pullback: `Modules/Pullback/Quasicoherent.lean:151, 172`; `Modules/Pullback/Monoidal/Basic.lean:169`;
- graded algebras, linear schemes, geometric bundles: `Modules/Quasicoherent/GradedAlgebra/Basic.lean:96`; `…/GradedAlgebra/Free.lean:68`; `VectorBundle/LinearScheme.lean:97, 299`; `VectorBundle/Geometric.lean:96, 118, 272`; `VectorBundle/TotalSpace.lean:130`;
- other: `Modules/Quasicoherent/Pushforward/QuasiSeparated.lean:107`; `Modules/Quasicoherent/Kernels.lean:60`; `Modules/Tilde/Dual.lean:56`; `LineBundle/TensorProduct.lean:65`.

At `a91d3aa` I opened `Modules/Tilde/Dual.lean:113`, the affine-only criterion under the name R03 discusses, and `LineBundle/TensorProduct.lean:63`.

**Cross-roadmap citations resolved.**
- The SchemeAndStackFoundations consumer on main imports this module and uses four names, at `TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean:1872, 2535, 2537, 2550, 2565`: `isFiniteLocallyFree`, `isFiniteLocallyFreeOfRank`, `FiniteLocallyFreeSheaf` and `determinantObj`.
- The two open SchemeAndStackFoundations revisions in the brief (pull requests 1656 and 1276) do not reference this module.
- The deletions that R03 and R04 ask for remove none of these names. R04 keeps `determinantObj` with its type.
- The PadicMeasuresIwasawaAlgebras §5.1 citation is untouched and carries forward.

**Citation lead.** `Scheme.Modules.isQuasicoherent_pushforward_specMap` (`README.md:145`) resolved at `a91d3aa` and does not exist at this pin (R08).

**Overlaps.** No other open pull request changes this roadmap. No id this README cites is dropped elsewhere, and none is defined only by an open revision.

**Headline theorems and padding.** The headlines of the README, with where each stands at this pin:

| Headline | Status at `2fd255d9` |
| --- | --- |
| strong symmetric monoidal pullback on all modules | stated (`pullback_tensor_isIso`); still beyond the library |
| dualizability criterion | library; R03 |
| quasi-coherence of internal Hom | library; R03 |
| finite local freeness and ranks of powers | library; R03 |
| power–pullback isomorphisms on all modules | stated in `Nonempty` form; R05, R06 |
| determinant and its invertibility | library; R04 |
| determinant restricted to a rank locus | library; R04, R07 |
| direct-sum determinant isomorphism | statable, absent; see the remark below |
| affine graded-line comparison | not statable: graded lines are a PadicMeasuresIwasawaAlgebras target |
| relative-Spec anti-equivalence | library; R03 |
| base change | library; R01 |
| `QCoh(X)ᵒᵖ ≌ LinearSch(X)` | library; R01 |
| `FinLocFree(X) ≌ GeomVB(X)` and the universal property | library; R01 |

After R03, R04 and R07, the remaining statements are `pullback_tensor_isIso` and the two repaired `…_isIso` theorems. None of them closes by `infer_instance`, because the library's instances need a quasi-coherence hypothesis.

**Seeded sample: 14 targets.** No claim passage, hypothesis or locator of any of them changed; the README diff since `f040782` is empty. The source checks of the earlier reports carry forward, and no text was newly fetched. No locator is flagged unverified. The third column is new and records where each target now stands at the pin.

| Target | Locator (as read in the earlier reports) | At Tau Ceti `2fd255d9` |
| --- | --- | --- |
| 1.1 Strong monoidal pullback | Stacks Tag 01CD, Modules Lemma 16.4, p. 22 | only with one quasi-coherent factor; the all-module claim stays here |
| 2.1 Dualizability | Modules §18, p. 25 (Tag 0FNU); Algebra Lemma 78.2, p. 184 (Tag 00NX) | `QuasicoherentSheaf.nonempty_hasLeftDual_iff_isFiniteLocallyFree`, every scheme (R02, R03) |
| 2.2 Internal Hom | Tag 01CQ, Modules Lemma 22.6, pp. 32–33; Tag 0C6I, Lemma 22.5, p. 32 | quasi-coherence instance and flat base change on any base (R02, R03) |
| 3.1 Rank formulas | Modules Lemma 21.5(3),(5),(6), p. 30 (Tag 01CK) | `rank_symmetricPower_apply`, `rank_exteriorPower_apply` (R02, R03) |
| 3.2 Pullback comparisons | Tag 01CI, Modules Lemma 21.3, p. 30 | quasi-coherent case only; the all-module claim stays here (R05, R06) |
| 3.3 Determinant | Modules Lemma 21.6, pp. 30–31 (Tag 01CL); Hartshorne II, Ex. 5.16 (uncertified) | `FiniteLocallyFreeSheaf.det`, `determinantCore`, `determinant`, `pullbackDeterminantIso`; no direct sum (R02, R04) |
| 4.1 Pushforward and pullback algebras | Tag 01SA, Morphisms Lemma 11.5, p. 19; Tag 01LC, Schemes Lemma 24.1, pp. 46–47; Tag 01LQ, Constructions §4, p. 5 | `affineFunctions`, `QuasicoherentAlgebra.pullback` (R02) |
| 4.2 Functor of points | Constructions §4 and Lemma 4.2, pp. 5–7 | `relativeSpecHomIso` (R02) |
| 5.1 Anti-equivalence | Tag 01SA, Morphisms Lemma 11.5, p. 19 | `relativeSpecEquiv` (R02, R03) |
| 5.2 Base change | Constructions Lemma 4.6(2), p. 7 (Tag 01LX) | `relativeSpecBaseChangeIso` (R01, R02) |
| 6.1 Graded and symmetric algebras | Tag 01CL, pp. 30–31; EGA II §1.7.4, p. 15, and Prop. 1.7.6, p. 16 | `GradedQuasicoherentAlgebra`, `gradedSymmetricAlgebraEquiv` (R02) |
| 6.2 Linear schemes | Constructions Lemma 6.3, p. 9 (Tag 062N); Definition 6.2, pp. 8–9 (Tag 01M1) | `QuasicoherentLinearScheme`, `linearSpecEquiv`; same convention, Tags 01M1 and 062M (R01, R02) |
| 7.1 Geometric equivalence | Constructions §6, pp. 8–9 (Tag 01M1); EGA II Def. 1.7.8, p. 16 | `totalSpaceEquiv`, `totalSpaceHomEquiv`, with the dual taken as in the README's covariant convention (`TotalSpace.lean:120–130`) (R01, R02) |
| 7.2 Dictionary | EGA II §§1.7.9–1.7.10, Prop. 1.7.11(iii)–(iv), pp. 16–17 | `VectorBundle/TotalSpace/*.lean` (R02) |

**Remarks on untouched text that earlier reviews passed (no change requested).**
- The §3.3 direct-sum isomorphism `det(E ⊕ F) ≅ det E ⊗ det F` was statable at both pins, using `InvertibleSheaf.tensorProduct` (`LineBundle/TensorProduct.lean:63` at `a91d3aa`, `:65` at `2fd255d9`), and is absent from `Suggested.lean`.
- `README.md:186–187` maps the labels L0A–L2B to Layers 1–7 in a single sentence. The heading anchor `#l0b--quasicoherent-and-finite-locally-free-sheaves`, cited by GeneralAlgebraicKTheory (pull request 1212, line 17), does not survive the renamed headings.
- The pull request's description speaks of twelve retained-input definitions and proved functor laws. Neither is in this folder at this head: the only change to `Suggested.lean` since `f040782` is the two import lines, and none of its ten theorems is proved.

**Adversarial table.** The rows for the changed lines and for the text the pin change touches come first, with values computed on each side. The previous report's rows follow, carried forward because the statements they test did not change.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `Suggested.lean:8–9`, imports `….SymmetricPower.Basic`, `….ExteriorPower.Basic` | pins `2fd255d9`, `a91d3aa` | files present / absent; object files present at `2fd255d9` | resolve at this review's pin | none |
| the whole file | `lake env lean` at `2fd255d9` | 10 `sorry` warnings, 0 errors, 0 other warnings; 15 `#check` types equal to the signature list | builds | none |
| docstring bullet 1: base change "not statable" | `A = Sym(𝒪_X) = 𝒪_X[t]`, any `f : Y → X` | `Spec_Y(f^* 𝒪_X[t]) = Spec_Y 𝒪_Y[t] = 𝔸¹_Y`; `Y ×_X 𝔸¹_X = 𝔸¹_Y`; `relativeSpecBaseChangeIso` elaborates with exactly these two functors | statable, and stated by the library | R01 |
| docstring bullet 2: `QCoh ≌ LinearSch` "not statable" | `F = 𝒪_X²` | `linearSpec`: `Spec_X 𝒪_X[x,y] = 𝔸²_X`, whose degree-one piece recovers `𝒪_X²`; `linearSpecEquiv` elaborates; its carrier is the README's `:19–21` | statable, and stated | R01 |
| docstring bullet 3: `FinLocFree ≌ GeomVB` and the universal property | `E = 𝒪_X`, `T = Spec R → X` | total space `𝔸¹_X`; `Hom_X(T, 𝔸¹_X) = R` on one side of `totalSpaceHomEquiv`, `Hom(𝒪_T, 𝒪_T) = R` on the other | statable, and stated | R01 |
| `isFiniteLocallyFree_iff_nonempty_hasLeftDual` | one-tactic probe; the name at both pins | `exact (… E).symm` closes; at `a91d3aa` the name carried `[IsAffine X]` | padding at this pin | R03 |
| `ihom_isQuasicoherent` | probe | `infer_instance` closes, via `isQuasicoherent_ihom_of_isFinitePresentation` | padding | R03 |
| `symmetricPower_isFiniteLocallyFree_rank` | probe; `(r,n) = (2,2), (0,0)` | `exact ⟨_, rank_symmetricPower_apply n E⟩` closes; library values `multichoose 2 2 = 3`, `multichoose 0 0 = 1`, as in the README | padding | R03 |
| `exteriorPower_isFiniteLocallyFree_rank` | probe; `(r,n) = (2,3), (2,2)` | `exact ⟨_, rank_exteriorPower_apply n E⟩` closes; `choose 2 3 = 0`, `choose 2 2 = 1` | padding | R03 |
| `relativeSpec_isEquivalence` | probe | `exact (relativeSpecEquiv X).isEquivalence_functor` closes; the functor is `relativeSpec X` by `rfl` (`Equivalence.lean:123`) | padding | R03 |
| `determinantModule` against `FiniteLocallyFreeSheaf.det` | `Spec k ⊔ Spec k`, ranks `(1,2)` | each is the product over `n` of `∧ⁿ E` restricted to rank fibre `n` and pushed forward; underlying sheaf `(∧¹ k, ∧² k²) = (k, k)` on both; the library restricts with `restrictFunctor`, the roadmap with `pullback` along `Scheme.Opens.ι` | one object, two carriers | R04 |
| `determinantObj` as an alias | elaboration; consumer | the body `FiniteLocallyFreeSheaf.det E : InvertibleSheaf X` elaborates; the consumer at `:2565` needs only `InvertibleSheaf X` | type kept | R04 |
| `symmetricPower_pullback` (`Nonempty`) against the canonical map | `Spec ℚ`, `f = 𝟙`, `n = 1` | the canonical comparison is the identity; its negative is another isomorphism of the same functors; `Nonempty` holds for both | does not fix the map | R05 |
| repaired `symmetricPower_pullback_isIso` | `𝔸¹_k`, `E = j_! 𝒪_U`, `n = 2`; `x ∈ U` and the origin | `x^* Sym² E = 𝒪_{X,x} ⊗ κ(x) = κ(x)` and `Sym² κ(x) = κ(x)`, with `1·1 ↦ 1·1`; origin `0 = 0`; `infer_instance` fails (needs quasi-coherence) | true, and beyond the library | R05 |
| repaired `exteriorPower_pullback_isIso` | same sheaf, `n = 1, 2` | `n = 1`: `κ(x) = κ(x)`; `n = 2`: `∧²` of a rank-one stalk is `0`, as is `∧² κ(x)`; origin `0 = 0`; `infer_instance` fails | true, and beyond the library | R06 |
| `determinantModule_restrict_rankLocus` (`Nonempty`) | `Spec ℚ`, `E = 𝒪`, `r = 1`; the empty `U_7` | the identity and multiplication by 2 both satisfy it; on the empty locus `0 ≅ 0` | does not fix the map | R07 |
| `README.md:107`, `:127` headings | the manifest | `6b7abb3 ≠ 1b1ccf4b`; `a91d3aa ≠ 2fd255d9` | stale | R08 |
| `README.md:145` name; `:147`, `:167` paths | grep at `2fd255d9` | no such declaration; `Pushforward.lean`, `SymmetricPower.lean`, `ExteriorPower.lean` absent (now directories) | stale | R08 |
| `README.md:160–162`, the affine criterion | both pins | `a91d3aa`: `Tilde/Dual.lean:113`, `[IsAffine X]`; `2fd255d9`: `Dualizable.lean:72`, every scheme | stale | R08 |
| `pullback_tensor_isIso` at the new pin | the §1.1 Check `j_! 𝒪_U`; the library | the library needs one quasi-coherent factor (`Pullback/Quasicoherent.lean:151`, `:172`) and `j_! 𝒪_U` is neither; both sides `κ(x)` on `U`, `0` at the origin | still a headline | none |
| Conventions; finite locally free predicate and alias | `k⁰`, `k`, `k^(ℕ)` | Locally free/finitely presented are `(true,true)`, `(true,true)`, `(true,false)`; FLF values `true,true,false` | Correct distinction from infinite local freeness | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| Fixed-rank predicate `isFiniteLocallyFreeOfRank` | `k²`, mixed ranks `(1,2)`, empty scheme | `k²` satisfies rank 2, not 1; mixed sheaf satisfies no constant rank; empty scheme satisfies every rank | Quantifier and empty-base behavior correct | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| Rank locus convention | `X = Spec k ⊔ Spec k`, ranks `(1,2)` | `U₁ = {left}`, `U₂ = {right}`, `U₀ = ∅`; union is `X`, pairwise intersections empty | Distinguishes one global rank from rank function | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 2.1 dualizability iff, positive | `k⁰`, `k²` | FLF true in both; coevaluation `0`, respectively `1 ↦ e₁*⊗e₁ + e₂*⊗e₂`; triangle maps are identity | Both implications agree | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 2.1 iff, negative | `k^(ℕ)`; `k[t]/(t)` over `k[t]` | First has infinite rank but every coevaluation has finite tensor support; second has `Tor₁(k,k)=k`; FLF and dualizable both false | Neither local freeness alone nor finite presentation alone suffices | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 2.1 iff, empty scheme | `Spec 0` | Unique module is zero and unit; both sides true; triangle endomorphism is the unique map | No illicit nonemptiness | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 2.2 flat base-change iso | `ℤ → ℚ`, `E=ℤ/2`, `F=ℤ` | `Homℤ(ℤ/2,ℤ)⊗ℚ=0`; `Homℚ(0,ℚ)=0` | Stated flat criterion agrees | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 2.2 failure without flatness | origin in `Spec k[t]`, `E=k[t]/(t)`, `F=k[t]` | Pullback of Hom is `0`; Hom of pullbacks is `k`; map is `0→k` | Negative control correct | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 2.2 finite-free base change with arbitrary target | `R→k`, `E=R²`, `F=R/(ε)` | Left `k²`; right `Hom_k(k²,k)=k²`; comparison identity on coordinate functionals | No flatness needed for FLF source | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 2.2 dual–tensor identification | `E=R²`, `F=R/(ε)` | `Hom_R(R²,F)=F²`; `(R²)^∨⊗R F=F²`; `eᵢ*⊗a` evaluates to `a` on `eᵢ` | Same evaluation, not a rescaled map | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 2.2 naturality/composition | free source, maps multiplication by 2 and 3; base `ℤ→ℤ/4→𝔽₂` | Composite scalar `6→0`; sequential scalars `0·1=0`; evaluation after either route is zero | Comparison has correct variance/composition | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 3.1 symmetric rank | `(r,n)=(0,0),(0,1),(1,2),(2,2)` | Basis sizes `1,0,1,3`; `multichoose` values `1,0,1,3` | Includes zero-degree unit, no 0/0 | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 3.1 exterior rank | `(r,n)=(0,0),(0,1),(1,2),(2,2),(2,3)` | Basis sizes `1,0,0,1,0`; binomial values identical | Out-of-rank degree gives zero | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 3.1 characteristic-two relations | `k=𝔽₂`, rank 2, degree 2 | Antisymmetric-only quotient has basis `e₁²,e₁e₂,e₂²`, dimension 3; alternating quotient has dimension 1 | Exterior convention is necessary | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 3.1 variable rank and square-zero base | ranks `(1,2)` over two components; `R²` | Sym² ranks `(1,3)`, exterior² ranks `(0,1)`; over `R`, free ranks 3 and 1 survive reduction to `k` | No reducedness or constant-rank assumption | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 3.3 determinantModule product, rank loci | ranks `(1,2)` on `Spec k ⊔ Spec k` | Restricted factors give `(k,0)` at degree 1, `(0,k)` at degree 2, zero otherwise; product `(k,k)`, ranks `(1,1)` | Actual product defines a line | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 3.3 determinant restriction theorem | same scheme, `r=1,2,7` | On `U₁`: `k≅k`; on `U₂`: `k≅∧²k²=k`; on empty `U₇`: `0≅0` | The new theorem includes empty rank loci honestly | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 3.3 rank zero and unbounded rank | zero bundle; `⊔_{n≥0} Spec k` with rank `n` on component `n` | At rank 0 the surviving factor is `∧⁰0=k`; at every component `∧ⁿkⁿ=k`; all determinant stalk ranks 1 | No quasi-compactness needed for countable product construction | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 3.3 wrong product without restrictions | rank-one `k` | Unrestricted product has factors `∧⁰k=k`, `∧¹k=k`, others zero: dimension 2; prescribed product dimension 1 | Restriction excludes wrong model | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 3.3 determinantObj invertibility | `R²`; empty base | Determinant is free `R` of rank 1; on empty base unique sheaf is also unit | Packaging uses a proof, not admitted data | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 3.3 equal-rank functor | maps `a,b:k→k`; zero map; rank 0 | Determinant maps are `a,b,ab`; zero has determinant 0 in rank 1; unique rank-zero endomorphism has determinant 1 | Target category must allow non-isomorphisms, as pinned | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 3.3 affine graded comparison | ranks `(1,2)` over `k×k` | Both constructions have underlying `(k,k)`, rank labels `(1,2)`, parity `(1,0)` | Prior parity finding repaired | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 3.3 sum/swap sign | two lines over `ℚ`, then `𝔽₂`; ranks 1 and 2 | Swap determinant `−1` vs sign `(−1)¹=−1`; mod 2 both become 1; rank 1/2 swap sign `+1` | Koszul and ordinary line braidings properly distinguished | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 3.3 determinant pullback | matrix `diag(2,3)` over `ℤ`, reduction mod 5 | Pullback determinant `6 mod 5=1`; determinant of reduced matrix `2·3=1` | Affine comparison retains determinant, not inverse determinant | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 4.2 universal property, unit/polynomial | `T=Spec R`, algebras `𝒪`, `𝒪[t]` | Unit: one morphism/one algebra map. Polynomial: maps indexed by `R`; `t↦a` corresponds to point `a` | Both directions agree including nilpotent `a=ε` | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 4.2 product algebra and disconnected tests | `A=k×k`, `T=Spec k` then `Spec(k×k)` | Respectively 2 and 4 algebra maps/clopen decompositions; empty `T` gives 1 | Both clopen pieces may be empty | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 4.2 naturality | `t↦a`, test map `R→S`; algebra endomorphism `t↦t²` | Test pullback gives image of `a` in `S`; precomposition gives `a²` on both sides | Correct variance in each variable | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 5.1 anti-equivalence | `A=k[t]/(t²)`; empty base | Global functions of affine Spec recover `A`; unit/counit act identically on `1,t`; empty categories each have one isomorphism class | Nonreduced input retained | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 5.1 necessity of affine structure map | punctured affine plane over `k` | Functions `k[x,y]`; relative Spec gives whole `𝔸²`, including origin, rather than the punctured plane | Correct negative control | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 5.1 ramified/inseparable Check | `A=k[x,t]/(t²−x)` | As `k[x]`-module, basis `1,t`, rank 2; fibre at 0 is `k[t]/t²`; in char 2 generic extension purely inseparable of degree 2 | Equivalence needs no étaleness; ramification is not restricted to char ≠2 | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 5.2 base change | `A=𝒪[t]`; `A=𝒪×𝒪`; identity | Both sides `𝔸¹_Y`; at a residue field both sides `Spec κ ⊔ Spec κ`; identity gives same algebra `A` | Arbitrary base change correct | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 5.2 non-flat fibre | `k[x]→k`, double-cover algebra above | Both coordinate algebras `k[t]/t²`, not `k×k` | Nilpotents preserved | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 6.1 graded algebra and symmetric adjunction | `F=k²`; graded `k[t]/t²` | Sym pieces dimensions `1,2,3` in degrees 0,1,2; quotient pieces `1,1,0`; maps from `Sym(k)` to a graded algebra correspond exactly to its degree-one elements | Generated-in-degree-one differs from free | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 6.1 affine/localization/base-change interface | `M=R/(ε)`; localization of `k[x]` at `x` | `Sym_R(M)=R[t]/(εt)` on both affine descriptions; after reduction to `k`, `k[t]`; localized polynomial algebra `k[x,x⁻¹,t]` on both routes | Comparisons preserve relation and degree | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 6.1 finite generation, degree-one generation | `k[t]/t²` degree 1; `k[t]` degree 2 | First generated by one degree-one element; second finitely generated but degree-one part 0 and not degree-one generated | Distinguishes the two preservation claims | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 6.2 linear-scheme definition/equivalence | `F=0,k²`; `α_p` over `𝔽_p`, `p=2,3` | `Sym(0)=k`, `Sym(k²)=k[x,y]`; degree-one recovery gives `0,k²`. For `α_p`, relation `tᵖ=0` has nonzero kernel from `k[t]` | Free-generation condition excludes module-scheme wrong model | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 6.2 morphisms and module structure | `t↦at`; `t↦t²` over `𝔽₂` | Scaling has degree 1 and satisfies `(sv)↦s(av)`; squaring is additive but `(sv)²=s²v²≠sv²` in `𝔽₂[s,v]` | Scheme-level scalar action, not only rational-point linearity | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 6.2 zero/addition/scalar laws | one free coordinate | Ring maps `t↦0`, `t↦t₁+t₂`, `t↦st`; addition associative since both composites `t₁+t₂+t₃` | Canonical module-scheme operations determined | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 7.1 total-space convention and variance | `E=k²`, `A=[[1,2],[0,3]]`, `v=(4,5)` over `ℚ` | Covariant action `Av=(14,15)`; using un-dualized contravariant coordinates gives transpose action `(4,23)` | Dual is essential | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 7.1 geometric equivalence | finite free ranks 0,1,2; infinite free degree-one piece | Totals `X,𝔸¹,𝔸²`; degree-one modules of coordinates are dual ranks `0,1,2`; infinite rank is excluded from GeomVB | Correct finite subcategory and bidual inverse | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| 7.1 universal property and zero map | `T=Spec R`, `E=𝒪²`; zero `E→E` | Both sets `R²`; point `(ε,1)` corresponds to same section; zero map sends it to `(0,0)`, not itself | Nonreduced tests and zero-section map retained | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| §1.1 canonical tensor comparison; `pullback_tensor_isIso` | `ℤ→𝔽₂`, `E=F=ℤ/4` | Pullback of tensor is `𝔽₂`; tensor of pullbacks is `𝔽₂`; canonical map sends `1⊗1` to `1⊗1`, inverse does likewise | Non-flat base and non-flat inputs retained | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| §1.1 zero module and empty base | `E=0,F=R`; `Spec 0` | Tensor sides are `0=0`; over empty base the only map is the identity of the zero object | No nonemptiness condition needed | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| §1.1 unit and `pullback_η` | `R→k`, element `1` | `k⊗R R→k` sends `1⊗1↦1`; inverse sends `1↦1⊗1` | Invertible unit matches pinned law | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| §1.1 free comparison and symmetry | ranks 2 and 3; self-tensor of rank 2 | Both free bases have 6 elements; either braid path sends `e₁⊗e₂↦e₂⊗e₁`, coefficient `+1` | No extraneous determinant sign | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| §1.1 identity/composition, tensor and unit | identity; `ℤ→ℤ/4→𝔽₂` | Identity sends `(1,2)` to `(1,2)`; direct and iterated reduction give `(1,0)`; both tensor routes preserve basis tensors; both unit routes send `1↦1` | Coherence agrees with pinned comparisons | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| §2.2 affine internal-Hom kernel route; exact tilde contract | `E=R/(ε), F=R` | `ε(a+bε)=aε`; kernel is `kε=(ε)`; a homomorphism is determined by the image of 1 in the same ideal | Handles nonreduced base and non-flat source | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| §2.2 full faithfulness and matrix identification | `E=coker(diag(ε,1):R²→R²), F=R` | Hom kernel is `ker(diag(ε,1):R²→R²)=(ε)×0`; associated sheaf and sheaf kernel both have sections `(ε)×0` on this affine local scheme | The actual presentation determines the scalar matrix, not an arbitrary endomorphism of `F` | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| §2.2 exactness in degenerate cases | Identity and zero maps `R→R`; empty affine base | Module kernels `0,R`; tilde kernels `0,R~`; empty scheme gives unique zero sheaf on both sides | No domain or reducedness assumption added | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| §2.2 infinite-rank product sheaf | Generic point of `Spec ℤ`, `E=𝒪^(ℕ), F=𝒪` | Source `colim_m ∏ℤ[1/m]` admits `(2⁻ⁱ)` at `m=2`; `(∏ℤ)⊗ℚ` does not, since a common denominator cannot bound all 2-adic denominators | Distinguishes sheaf pullback from localization of global sections | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| §2.2 failure without finite presentation | Same source; `pᵢ` pairwise distinct | Target `∏ℚ` contains `(1/pᵢ)`; source does not: no fixed nonzero `m` contains infinitely many distinct prime divisors | Flat comparison is genuinely non-surjective | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| §3.2 `symmetricPower_pullback` | `ℤ/4` over `ℤ`, reduction to `𝔽₂`, degree 2; free rank 2 | First pair of modules `𝔽₂=𝔽₂`; second pair has bases `x²,xy,y²`, ranks `3=3` | Arbitrary-module, non-flat statement correct on these tests | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| §3.2 `exteriorPower_pullback` | `R²` reduced to `k²`, degrees 0,1,2,3 | Both sides are `k,k²,k,0`; degree-two map sends `e₁∧e₂` to itself, coefficient `+1` | Zero, top and excessive degrees agree | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| §3.2 normalization and composition | `ℤ²` reduced through `ℤ/4` to `𝔽₂`; degrees 0,1,2 | Unit `1↦1`; degree-one vector `(1,2)↦(1,0)`; degree-two symmetric generators and exterior generator are unchanged on both routes | Existing README coherence requirements retained | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| §3.2 naturality | Multiplication by 2 over `ℤ`, reduction modulo 3 | Sym² and exterior² of a rank-two scalar map multiply by `4`; after reduction both give multiplication by `1`; either side of naturality gives `1` | Functor isomorphisms have the promised variance | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| §4.1 structure-algebra pushforward | Identity, disjoint union of two copies, `Spec R→Spec k` | Algebras `𝒪`, `𝒪×𝒪`, `R`; tensoring the two units instead gives `𝒪` and loses the two idempotents | Actual functions distinguish the construction | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| §4.1 affine pushforward quasi-coherence | `k→R`, localizations; empty inverse image | Pushforward module is `k⊕kε` with `ε²=0`; restriction at nonzero `a∈k` is the same localization on both sides. Empty inverse image gives the zero algebra | Pinned spectra case suffices on affine charts | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| §4.1 functor on morphisms | Maps on coordinates `t↦u²`, `u↦v³` | Composite sends `t↦v⁶`; successive pullbacks also give `v⁶`; identity sends `t↦t` | Contravariant functor law | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| §4.1 pullback algebra and structure unit | `ℤ[t]` reduced to `𝔽₂`; `R→k` on unit algebra | Both algebra descriptions give `𝔽₂[t]`, with `1↦1`; unit comparison `k⊗R R=k` respects multiplication | Ordinary, not derived, base change | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| §7.2 sections and field-valued fibre | `E=k²`, vector `(2,3)` over `ℚ` | Section and point are `(2,3)`; coordinate functional `λ=(5,7)` evaluates to `5·2+7·3=31` in both descriptions | Dualization gives vectors, not covectors | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| §7.2 base change, including a nilpotent point | `E=R²`, `R→k`; section `(ε,1)` | Coordinate algebras base change from `R[x,y]` to `k[x,y]`; section reduces to `(0,1)` on both routes | Scheme fibre and rational point identification agree | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| §7.2 direct-sum comparison | `E=k²,E'=k`, vector `(a,b,c)` | `k[x,y]⊗k k[z]=k[x,y,z]`; comparison sends `(a,b,c)↦((a,b),c)` with inverse concatenation | Product over the base, correct direction | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| §7.2 zero and addition | Sections `(1,2),(3,4)` over `ℚ`; zero section | Both descriptions give sum `(4,6)` and zero `(0,0)`; coordinate addition is `x↦x₁+x₂` | Operations determined by the universal property | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| §7.2 transported dual, tensor and internal Hom | Ranks 2 and 3 over `k` | Dual rank `2`; tensor and Hom ranks `6`; on bases evaluation gives `e₁*(e₁)=1`, not 0 | Transport uses the established sheaf operations and evaluation | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |
| §7.2 transported powers and determinant | Rank 2 in degrees 0,1,2,3; two-line swap over `ℚ` | Sym ranks `1,2,3,4`; exterior ranks `1,2,1,0`; determinant rank 1. Swap acts by `−1` on both determinant descriptions | Normalizations and determinant sign preserved | carried from PRREVIEW-AlgebraicVectorBundles~5 (statement untouched) |

## Not verifiable

- **Hartshorne, *Algebraic Geometry*, II, Exercise 5.16** (`hartshorne`): settled as uncertified in the earlier reports. It is not newly certified and no new request is made.
- **The consumer build with the proposed repairs.** I did not build `TauCetiRoadmap.SchemeAndStackFoundations.Suggested` against R03/R04 applied, because the brief's Lean commands do not include it. The worker's targeted build at this head built it with the current names. The repairs keep the four names it uses, and `determinantObj` keeps its type `InvertibleSheaf X`, but that is checked by reading, not by a build.
- **Ownership against open pull requests.** The diff adds no construction, and the repairs only delete or cite. Apart from the two SchemeAndStackFoundations revisions above, the sibling checkouts were not re-searched this round. The ownership audit of `PRREVIEW-AlgebraicVectorBundles~3` carries forward.

## Source issues

- none
