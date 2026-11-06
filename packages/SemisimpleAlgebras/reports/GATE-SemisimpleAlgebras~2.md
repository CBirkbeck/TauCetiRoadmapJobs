# GATE-SemisimpleAlgebras~2: answers to human review at 3e33c66

## H01 (roed-math) — answered

Confirmed: main's "Layer 1.5: every simple module is a minimal left ideal" is §1.3 "Simple modules as minimal left ideals" here (Mathlib `IsSemisimpleRing.exists_linearEquiv_ideal_of_isSimpleModule`, `TauCeti.isSimpleModule_iff_exists_isPrimitiveIdempotent`, and the class bijection through §1.2). The only roadmap on main or at any open head that cites "Layer 1.5" of this roadmap is QuiverRepresentations at #1526 (its README L45, L258, L441, L511), and what it consumes there maps to §1.3, §2.1 and §2.3, so its locator should read "§1.3 and Layer 2". No change was needed for the point itself. Checking the same pattern (headings changed in this PR, breaking inbound locators) found two repairable cases and one that cannot be repaired. All three are listed under "Pattern repairs" below.

## Pattern repairs for H01

- **Anchors.** The en dash in the Layer 2 and Layer 5 headings changed their GitHub anchors from main's, because an en dash is dropped from the slug. README L308 `## Layer 2: Artin–Wedderburn, …` → `## Layer 2: Artin-Wedderburn, assembled with uniqueness`, restoring `#layer-2-artin-wedderburn-assembled-with-uniqueness`, which IntegralHeckeAndGaloisDeterminants links at #1689. Layer 5 (L603) is changed the same way, to `Skolem-Noether` (main's anchor), and the matching `/-! ## Layer 5: … -/` comment in `Suggested.lean` is changed with it. The same PR also links `#layer-0-the-jacobson-radical-and-the-semisimplicity-criterion-supporting-api-optional`. That anchor cannot be restored, because house style forbids "optional" in a heading, so that consumer must update the link. All other inbound anchors already resolve: Layer 1 (main, #1187), Layer 3 (#1689), Layer 4 (#1405, #1689) and Layer 6 (nine on main, #1409).
- **Downstream consumers.** The QuiverRepresentations entry (L837) said "Layer 0 … and Layer 2". It now names §1.3 as well (simple modules as minimal left ideals), together with the parts of Layer 2 it uses. This matches main's QuiverRepresentations ("its Wedderburn decomposition indexes the simple modules") and the revised text at #1526.

## Additional repairs: the pins the brief names (not raised by a reviewer)

The branch's own `lake-manifest.json` pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3`. The pins this job is checked against, from the content repository's manifest and therefore main's, are Tau Ceti `2fd255d` and Mathlib `1b1ccf4`. The worker's citation list flagged six README names that do not exist at those pins. Resolving each by full name (namespace-aware, at `2fd255d`) gave the following:

1. **Two of the three headlines are pinned theorems.** `Subalgebra.centralizer_centralizer_of_isSimpleRing` (`TauCeti/Algebra/CentralSimple/Centralizer/Simple.lean:47`) has exactly the binders and conclusion of our `centralizer_centralizer`: `[Field K] [Ring A] [Algebra K A] [Algebra.IsCentral K A] [IsSimpleRing A] [FiniteDimensional K A] (B : Subalgebra K A) [IsSimpleRing B] ⊢ centralizer K (Set.centralizer (B : Set A)) = B`. `Subalgebra.isSimpleRing_centralizer_of_isSimpleRing_tensorProduct` (`Centralizer/Basic.lean:331`) gives our `centralizer_isSimpleRing` by instance resolution, and `Centralizer/Simple.lean:49` invokes it in exactly that context. Both are deleted from `Suggested.lean`. README §5.2 and §5.3 now record these pinned theorems, keeping their section numbers and all their Checks, and the Summary, Scope and "How to read the build" say so. The general simple-source Skolem–Noether is **not** at the pin: the only conjugacy theorems are central-source `TauCeti.skolemNoether` (`SkolemNoether.lean:107`) and the ℂ ⊆ ℍ special case in `TauCeti/Algebra/Quaternion/ComplexSubfield.lean`. Mathlib has none. So `skolemNoether` stays, as the one headline.
2. **Renamed or moved at `2fd255d`** (old → new):
   - `TauCeti.IsSimpleRing.{nonempty_linearEquiv_of_finrank_eq, moduleEnd, finrank_end_mul_finrank_eq_sq, tensorProduct, tensorProduct_of_isCentral_right, exists_algEquiv_matrix_centralDivisionRing, isSquare_finrank, isAzumaya}` → the same names in the root `IsSimpleRing` namespace.
   - `TauCeti.IsSemisimpleRing.wedderburnPresentation` → `IsSemisimpleRing.wedderburnPresentation` (`Presentation.lean:293`).
   - `TauCeti.card_blocks_eq` → `RingEquiv.card_blocks_eq` (`BlockCount.lean:52`), now for matrix blocks over simple rings.
   - `TauCeti.wedderburn_blocks_unique` → `RingEquiv.wedderburn_blocks_unique` (`Uniqueness.lean:47`), now with arbitrary block index types.
   - `TauCeti.blocks_equiv_simpleModules` and `TauCeti.exists_simpleSubmodule_of_ringEquiv_pi` → `RingEquiv.exists_simpleSubmodule_of_pi` (`Blocks.lean:144`), with `RingEquiv.nonempty_equiv_simpleSubmoduleClasses_of_pi` (`:107`) and `TauCeti.exists_nonempty_linearEquiv_of_forall_submodule` (`:173`).
   - `TauCeti.card_eq_of_ringEquiv_pi_of_isSimpleRing` → `RingEquiv.card_eq_of_pi_of_isSimpleRing` (`TauCeti/RingTheory/SimpleRing/Pi.lean:203`).
   - `TauCeti.exists_equiv_factors_of_ringEquiv_pi` → `RingEquiv.exists_equiv_factors` (`Pi.lean:184`).
   - `TauCeti.Algebra.exists_isSplittingField_finrank_eq_deg` → `TauCeti.Algebra.exists_isSplittingField_isSeparable_finrank_eq_deg` (`MaximalSubfield/Separable.lean:96`), which now also gives separability.
   - Files: `Centralizer.lean` → `Centralizer/Basic.lean` + `Centralizer/Simple.lean`; `MaximalSubfield.lean` → `MaximalSubfield/Separable.lean`.
3. **Line numbers** re-pinned:
   - Mathlib: `exists_linearEquiv_ideal_of_isSimpleModule` 417; the `Finite (isotypicComponents R M)` instance 308; `Subalgebra.eq_of_le_of_finrank_eq` 277.
   - Tau Ceti: `WedderburnPresentation` 75; `SimpleArtinian.lean` 106; `EndAlgebra.lean` 106 and 147; `TensorProduct.lean` 183 and 225; `Centralizer/Basic.lean` 313, 364, 422 and 454; `Splitting.lean` 113.
   - The other cited lines were confirmed unchanged: Mathlib 28, 89, 72 and 969; Tau Ceti `BaseChange.lean:89`, `SkolemNoether.lean:107`, `Group.lean:174`, `Division.lean:69/92`, `FiniteSeparable.lean:45`, `Trivial.lean:247` and `Real.lean:102`.
   - The contract preamble no longer claims every Tau Ceti name carries the prefix `TauCeti`.

After the edits, every dotted backticked name in the README resolves by full name at `2fd255d`/`1b1ccf4` (98 of 98 dotted names; the six stale names and `TauCeti.IsSimpleRing.moduleEnd` are confirmed absent as controls; the three undotted leftovers are `Fin`, the namespace `TauCeti`, and the field `instNeZeroDegree` at `Presentation.lean:85`).

Not changed, for the merge: main's QuadraticFormInvariants `Suggested.lean` (after the pin-bump commit a891cd19) imports Tau Ceti directly and no longer imports this module. The `TauCeti.Algebra.BrauerGroup.Group` import and the `IsSplittingField` re-export are therefore needed only while the branch carries its merge-base copy, which this job's build target still compiles. They remain, and can be dropped together with the two README sentences about them once the branch is rebased onto main.

Ownership: `roadmaps grep -i 'skolem.?noether' --lean-only` over main and all 460 open heads finds no other statement of simple-source Skolem–Noether. Nothing is newly owned. Two declarations moved from "owned" to "consumed".

## Signatures

`Suggested.lean` now has one declaration, `skolemNoether`. Its text is byte-identical to the one whose elaborated type is in the job's signature list (`diff` of the theorem block against HEAD: no difference): all binders are in its own signature and there are no section `variable`s. That type matches README §5.1 exactly: field K, `Algebra.IsCentral K A`, `IsSimpleRing A`, `FiniteDimensional K A`, `IsSimpleRing B`, and g x = u f(x) u⁻¹. I did not elaborate a separate `#check @name` scratch file, because the only Lean command this brief allows is the `lake build` below, and that build elaborated it.

## Adversarial pass (statements this round adds or changes)

| # | Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | §1.3 is main's Layer 1.5 | main L200–210 vs §1.3 | 3 of 3 milestones (iso to ideal, primitive idempotent, class bijection) present | agrees | none |
| 2 | Heading anchors | slug of "Artin–Wedderburn" vs "Artin-Wedderburn" | `artinwedderburn` vs `artin-wedderburn`; inbound links to Layer 2 resolving before 0/1, after 1/1 | broken → fixed | applied |
| 3 | QuiverRepresentations consumes §1.3 and Layer 2 | main QR L285–287; #1526 L257–260 | items consumed: minimal left ideals (§1.3), presentation (§2.1), invariants (§2.3) | agrees | applied |
| 4 | `RingEquiv.exists_simpleSubmodule_of_pi`: blocks enumerate simple left ideals, any ι | K×K; M₂(K); ι = ∅; K^ℕ | 2 ideals, nonisomorphic (idempotent (1,0) acts as 1 vs 0); 1 class (two column ideals isomorphic); R = 0, 0 classes; K^ℕ not Noetherian (finitely supported ideal not f.g.), so not semisimple and outside the theorem | agrees | §2.2 rewritten, Check added |
| 5 | Matrix presentations qualify | Mₙ(D), n = 2, 1, 0 | M₂, M₁ simple; M₀(D) = 0, not simple | n = 0 excluded | Check reworded |
| 6 | `RingEquiv.card_blocks_eq` over simple coefficients | M₂(K) vs M₁(M₂(K)); K vs K × M₀(K) | 1 = 1; padded 2 ≠ 1, excluded by `NeZero` | agrees | §2.3 |
| 7 | `RingEquiv.card_eq_of_pi_of_isSimpleRing`, arbitrary index | two empty products; ∏_ℕ K twice | 0 = 0; `Nat.card ℕ = 0 = 0` (junk value, so the README says "equal `Nat.card`") | agrees | §2.3 |
| 8 | `RingEquiv.exists_equiv_factors` acts coordinatewise | M₂(K)×K → K×M₂(K) | σ = swap; (X,0) ↦ (0,X), (0,a) ↦ (a,0); identity σ would pair sizes 2,1 | agrees | §2.3 |
| 9 | `RingEquiv.wedderburn_blocks_unique` | M₂(K)×K vs K×M₂(K); ℍ vs M₁(ℍ); M₂(K) vs M₁(M₂(K)) | sizes (2,1)↔(1,2) by swap; 1 = 1, ℍ ≃ ℍ; last inapplicable (M₂(K) not a division ring) | agrees | §2.3 |
| 10 | §5.2 pinned simplicity of Cₐ(B) | K ⊂ M₂(K); M₂(K) ⊂ M₂(K); ℂ ⊂ ℍ; K×K ⊂ M₂(K); upper triangular B; L = 𝔽₂(t)(√t) ⊂ M₂(𝔽₂(t)) | C = M₂(K), K, ℂ simple; (K×K)⊗M₂(K)ᵒᵖ ≅ M₂(K)², not simple, and C = K×K not simple; T₂ ⊗ M₂ᵒᵖ not simple, 3·1 ≠ 4; C = L, 2·2 = 4 | hypotheses exclude the non-examples | §5.2 rewritten as a record |
| 11 | §5.3 pinned double centralizer | K ⊂ M₂(K); ℂ ⊂ ℍ; inseparable L; ℝ ⊂ ℂ (A = ℂ) | CC = K; ℂ; L (dims 1, 2, 2); ℝ ⊂ ℂ gives CC = ℂ ≠ ℝ, A not central, excluded | agrees | §5.3 rewritten as a record |
| 12 | Instance found for simple B in central simple A | pinned use at `Centralizer/Simple.lean:49` under the same binders | compiles at the pin | agrees | none |
| 13 | §6.2 separable maximal subfield | ℍ/ℝ; D = K | L = ℂ, separable, [ℂ:ℝ] = 2 = deg ℍ, splits; L = K, degree 1 | agrees | §6.2 |
| 14 | Remaining headline `skolemNoether` | f = g; ℂ ⊂ ℍ with g(i) = −i; A = B = ℂ/ℝ | u = 1; u = j: j·i·(−j) = −i; ℂ/ℝ not central, conjugation fixes i ≠ −i | agrees, unchanged | none |

## Sources

No new citation was added. The Stacks locators are unchanged, and the roadmap folder has no `sources.toml` to edit. No `needs-references.toml` entry was needed.

## Untrusted text

The review comment contains no instruction directed at this job beyond its coordination note. Nothing suspicious.

## Build

Commit `9fcf232f` "SemisimpleAlgebras: review repairs (restore main anchors, re-pin names, consume pinned centralizer theorems)" (README.md and Suggested.lean only; not pushed).

`lake build TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras.Suggested TauCetiRoadmap.QuadraticFormInvariants.Suggested`: **exit 0**, "Build completed successfully (9593 jobs)", 0 errors. This module emits exactly one warning, the `sorry` of `skolemNoether` (`Suggested.lean:40`). QuadraticFormInvariants (the branch's copy, which reads `IsSplittingField` and the group law through this module) builds unchanged. This build runs at the branch's own pins (Tau Ceti `a91d3aa`). The surviving declaration and the import/export lines also exist at `2fd255d` (imports `TauCeti/Algebra/BrauerGroup/Group.lean` and `TauCeti/Algebra/CentralSimple/Splitting.lean` present; `TauCeti.Algebra.IsSplittingField` at `Splitting.lean:113`), checked by file and name, not by elaboration.

## Gate

    gate SemisimpleAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Dependency check:

    depcheck: 241 roadmaps, 2362 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line.
