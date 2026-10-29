# GATE-RepresentationTheory~9: answers to the human review of 2026-10-20

Both comments (roed-math, 19:30 and 19:38) review commit `3bc32309` and raise the same three points. The detailed comment restates the follow-up, so the three points are numbered once each, H01–H03. All three defects are in `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/README.md` and `.../SemisimpleAlgebras/Suggested.lean`, and all three were repaired at head `6045796` by commit `6014e0fe`, which postdates the review. This round re-verified each repair against the pinned Mathlib and Tau Ceti and changed nothing; there is no new commit.

## H01 (roed-math) — applied

Layer 3 of `SemisimpleAlgebras/README.md` (line 252) now reads `R ≃ End_D M ≃ Mₙ(Dᵐᵒᵖ)` with `D = Module.End R M` (it was `Mₙ(D)`). It is restated as `R ≃ Mₙ((Module.End R M)ᵐᵒᵖ)`, the orientation of Mathlib's `IsSimpleRing.exists_ringEquiv_matrix_end_mulOpposite` (`Mathlib/RingTheory/SimpleModule/WedderburnArtin.lean:86`). It carries the column-module witness via `TauCeti.Matrix.mulOppositeRingEquivEnd : Dᵐᵒᵖ ≃+* Module.End (Matrix ι ι D) (ι → D)` (`TauCeti/RingTheory/Semisimple/MatrixDivisionRing.lean:195`) and an `n = 1` negative control: a degree-3 cyclic division algebra over ℚ, whose class has order 3 in `Br(ℚ)`, is not isomorphic to its opposite. The Jacobson–Chevalley bullet (line 268) and the `toModuleEnd_bijective` docstring in `SemisimpleAlgebras/Suggested.lean` (line 122) were corrected the same way. The remaining `Mₙ(D)` occurrences (lines 29, 137, 275–278) are the existential Wedderburn form `A ≅ Mₙ(D)` for *some* central division algebra `D`, which is correct as written.

## H02 (roed-math) — applied

The Skolem–Noether bullet in Layer 5 of `SemisimpleAlgebras/README.md` (line 305 ff.) no longer says "proved via the module density of Layer 3". It now gives the module-classification route:
- (i) `B ⊗[K] Aᵐᵒᵖ` is simple (Layer 4) and finite-dimensional, hence Artinian;
- (ii) `TauCeti.IsSimpleRing.nonempty_linearEquiv_of_finrank_eq` (`TauCeti/RingTheory/Semisimple/SimpleArtinian.lean:115`) makes `TauCeti.Bimodule f` and `TauCeti.Bimodule g` (`TauCeti/Algebra/CentralSimple/Bimodule.lean:107`) isomorphic, since both have dimension `finrank K A`;
- (iii) the isomorphism becomes the conjugating unit via `TauCeti.Bimodule.symm_apply_one_mul_eq_mul_symm_apply_one` (line 196) and `TauCeti.Bimodule.exists_symm_apply_one_mul_eq_one` (line 216).

The non-simplicity counterexample (`B = K`, `A = M₂(K)`, a regular module of length 2) is recorded there. The Ordering section (line 404 ff.) and the `skolemNoether` docstring in `SemisimpleAlgebras/Suggested.lean` were updated to match. Every cited declaration was checked at the pin: `TauCeti.skolemNoether` (`TauCeti/Algebra/CentralSimple/SkolemNoether.lean:107`) uses exactly this chain (lines 116, 120, 133).

## H03 (roed-math) — applied

Layer 0 of `SemisimpleAlgebras/README.md` is now headed "(supporting API, off the critical path)" (line 170); the old heading read "optional". Its text says the layer is "a required part of the roadmap, built in full" and no longer says "Build it … or skip to Layer 1". Ordering (line 397) calls it "required supporting API, off the critical path". The left-right symmetry statements are now consumed from the pinned Tau Ceti (`TauCeti/RingTheory/Jacobson/MulOpposite.lean`: `coe_jacobson_mulOpposite` line 129, `isSemiprimaryRing_mulOpposite_iff` line 256, instance `IsSemiprimaryRing.mulOpposite` line 263, `IsArtinianRing.isNoetherianRing_iff_isArtinianRing_mulOpposite` line 269) rather than planned again. A grep for `optional`, `or skip` and `skip` finds nothing in `SemisimpleAlgebras/README.md` or in the family index `README.md`.

## Adversarial pass on the statements the repairs changed

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Layer 3 `R ≃ Mₙ(Dᵐᵒᵖ)`, `D = End_R M` | `R = Mₙ(Δ)`, `M = Δⁿ`; `n = 1`, `Δ` of degree 3 over ℚ | `D ≃ Δᵐᵒᵖ`, so `Mₙ(Dᵐᵒᵖ) ≃ Mₙ(Δ) = R` ✓. For `n = 1` the unopposed form gives `R ≃ Δᵐᵒᵖ`, false because `[Δᵐᵒᵖ] = [Δ]⁻¹ ≠ [Δ]` in `Br(ℚ)` (order 3) | holds; the unopposed form is refuted | none |
| Jacobson–Chevalley `finrank K R = n · finrank K M` | `R = Mₙ(Δ)`, `M = Δⁿ`, `d = finrank K Δ` | left side `n²d`; right side `n · (n d) = n²d` | holds | none |
| Skolem–Noether route, step "modules need not be simple" | `B = K`, `A = M₂(K)` | `B ⊗ Aᵐᵒᵖ ≃ Aᵐᵒᵖ ≃ M₂(K)`; `A` is its regular module, `= S ⊕ S` with `dim S = 2`, length 2 | the claim is correct, so density does not apply | none |
| Skolem–Noether step (ii) dimension match | `Bimodule f`, `Bimodule g` | both have underlying space `A`, dimension `finrank K A` (`(of f).symm.trans (of g)`, SkolemNoether.lean line 114) | holds | none |
| Centrality of the source is needed | `K = ℝ`, `A = B = ℂ`, `f = id`, `g = conj` | `A` is commutative, so `u·f(x)·u⁻¹ = x ≠ conj x` for `x = i` | conjugation fails, so dropping centrality is refuted | none |
| `FiniteDimensional K B` follows from the other hypotheses | `B` simple, `A ≠ 0` | `ker f` is a proper two-sided ideal, so `⊥`; `B ↪ A` gives `dim B ≤ dim A` | holds; pinned in SkolemNoether.lean lines 108–110 | none |

## Build and gate

- `lake build TauCetiRoadmap.RepresentationTheory.Suggested`: `Build completed successfully (8976 jobs).`
- Gate: `gate RepresentationTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck: `depcheck: 185 roadmaps, 1131 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line for RepresentationTheory.

## Notes

- `TauCetiRoadmap/RepresentationTheory/Suggested.lean` declares nothing, so there was no `#check @name` comparison to make. No signature changed this round.
- `SemisimpleAlgebras/Suggested.lean` still states `skolemNoether` as a headline, although the pinned Tau Ceti proves a more general `TauCeti.skolemNoether`. Under the rule that what exists at the pins is cited rather than restated, that headline should become a citation. The file is outside what this job may edit, and the point was not raised in review, so it is left for the owner of the component roadmap.
- No sources were fetched. Every claim checked in this round is a pinned declaration or a computation recorded above.
