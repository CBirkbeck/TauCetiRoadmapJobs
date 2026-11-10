# Review of HomotopySpheres (pull request #1287 at 7fbf648)

**Verdict:** accepted

Incremental re-review of the 106 lines changed in the folder since `df80d93`. No finding: the three findings of the previous review are repaired, the repairs introduce no new problem, and the gate passes.

## Previous findings

- R01 — repaired: `Suggested.lean`:227 states `exists_homeomorph_isEmpty_diffeomorph_sphere (k) (hk : 1 ≤ k)` in dimension 4k + 3; README 9A.4 (:3167–3175) and the list at :585 name it; the docstring bullet (:60–66) is narrowed to the carrier-level forms.
- R02 — repaired: README:60–63, item 11: Layer 9A proves π₇ˢ ≅ ℤ/240, Θ₇ ≅ ℤ/28 with its comparisons, and the E₈ plumbing boundary homeomorphic but not diffeomorphic to S^(4k−1) for every k ≥ 2.
- R03 — repaired: `Suggested.lean`:261–263 concludes `ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere M 6` for compact second-countable `[T2Space M]`; README:314–320, :554–563 and :3266–3271 describe the predicate and why the two binders are kept.

The earlier settled items (James construction and Toda brackets in the BordismFormalGroups revisions; the three later roadmaps that own objects owned here; the branch pins behind main's) are outside the folder and unchanged by this diff. They are not raised again.

## Verified sound

**Gate and dependency check** (my runs at `7fbf648`):

```text
gate HomotopySpheres: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 235 roadmaps, 2266 edges, 0 problem(s)
```

The worker's gate with the targeted build (`build=0`) also passed. There is no UPWARD, CYCLE or `moved:` line, and `git diff --stat origin/main...HEAD` outside the folder is empty.

**Lean.**
- `lake env lean` on `Suggested.lean` exits with exactly 17 ``declaration uses `sorry` `` warnings (16 before, plus the new theorem) and nothing else.
- `#check @name` on the two changed theorems and on `smoothPoincareSix_oriented`, in a scratch copy:
  - `exists_homeomorph_isEmpty_diffeomorph_sphere : ∀ k, 1 ≤ k → ∃ M _ _ (_ : IsManifold (𝓡 (4k+3)) ∞ M) (_ : M ≃ₜ Sphere (4k+3)), IsEmpty (M ≃ₘ Sphere (4k+3))`, matching README 9A.4.
  - `nonempty_diffeomorph_sphere_six : ∀ (M : Type u) [TopologicalSpace M] [T2Space M] [SecondCountableTopology M] [CompactSpace M], NonemptyDiffeomorphSphere M 6`, matching README 10.4. No binder is lost.
- In the same scratch copy, `exists_homeomorph_isEmpty_diffeomorph_sphere 1 le_rfl` is accepted as a proof of Mathlib's wanted seven-dimensional statement written out on `Metric.sphere`, and `nonempty_diffeomorph_sphere_six M inferInstance inferInstance h` proves the former unfolded statement `Nonempty (M ≃ₘ⟮𝓡 6, 𝓡 6⟯ Sphere 6)`.
- One-tactic probe (`first | simp | trivial | infer_instance | exact?`) on both changed theorems: both fail with unsolved goals. Neither is padding.

**Library declarations opened** (3, at the branch pin and at main's pin, same lines at both).
- `Mathlib/Geometry/Manifold/PoincareConjecture.lean`:41–43: `NonemptyDiffeomorphSphere [T2Space M] (n : ℕ) : Prop := ∀ (_ : ChartedSpace ℝⁿ M) (_ : IsManifold (𝓡 n) ∞ M), M ≃ₕ 𝕊ⁿ → Nonempty (M ≃ₘ⟮𝓡 n, 𝓡 n⟯ 𝕊ⁿ)`. It includes Hausdorffness; it does not include compactness or second countability. README:554–557 describes it accurately.
- `Mathlib/Geometry/Manifold/ChartedSpace.lean`:236: `ChartedSpace.secondCountable_of_sigmaCompact [SecondCountableTopology H] [SigmaCompactSpace M] : SecondCountableTopology M`, as cited at README:562–563 (the model `EuclideanSpace ℝ (Fin 6)` is second countable).
- `Wanted/Geometry/Manifold/PoincareConjecture.lean`:43–46: `proof_wanted exists_homeomorph_isEmpty_diffeomorph_sphere_seven`, on the same carriers as the new theorem, as README:3174–3175 says.

**Sources read for the changed passages** (2).
- Milnor, remark after Proposition B, p.109: `milnor_hcobordism` lines 2847–2862 (Proposition B, its corollary, then the remark that smooth 7-manifolds homeomorphic but not diffeomorphic to S⁷ exist); page 110 starts at line 2869. The locator is correct.
- Hatcher, Proposition 3.29, p.239: `hatcher_at` lines 10362–10371 (a connected noncompact n-manifold has Hᵢ(M;R) = 0 for i ≥ n). Hatcher's manifolds are Hausdorff and locally Euclidean, as README:560–561 says.

**Seeded sample.** The diff touches only 10.4 among the sampled targets. Its locators (Milnor Proposition B p.109, proof p.110, lines 2847–2898; Kervaire–Milnor p.504) are unchanged and were re-read at lines 2847–2898. The other fourteen sampled targets are untouched; their rows in the previous report stand.

**Adversarial table.** Rows for the changed statements, with values computed this round; the rows of the previous report (at `df80d93`) for the untouched statements are carried forward unchanged.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| `exists_homeomorph_isEmpty_diffeomorph_sphere` | Lean k = 1, 2, 3; k = 0 | dimensions 7, 11, 15 = boundaries of P⁸, P¹², P¹⁶ (README k = 2, 3, 4): 7p₂ = −360 has no integral solution; v₂(d₃) = 5, v₂(d₄) = 4 against v₂(−8) = 3. k = 0 is dimension 3, where no exotic sphere exists; excluded by `hk` | Pass |
| index shift README ↔ Lean | README k ≥ 2, dimension 4k − 1; Lean k ≥ 1, dimension 4k + 3 | 4(k+1) − 1 = 4k + 3; k+1 ≥ 2 ⇔ k ≥ 1; boundary of P^(4k+4) | Pass |
| 9A.4 reflection step | diffeomorphism ∂P → S^(4k−1) matching or reversing boundary orientation | matching: cap directly; reversing: compose with a reflection (degree −1, extends linearly over D⁴ᵏ), then cap. Closed M has σ = −8 in both cases | Pass |
| 9A.4 Check at k = 1 | E₈ boundary in dimension 3 | integral homology sphere with π₁ ≠ 1 (6B, README:2355, :2369), so not homeomorphic to S³; the homeomorphism of 6B is claimed only for 4k − 1 ≥ 7 (:2349) | Pass; consistent with 6B |
| `nonempty_diffeomorph_sphere_six` | M = S⁶; M with no chart structure; noncompact M ≃ₕ S⁶ | S⁶: identity. No charts: the predicate is vacuously true. Noncompact Hausdorff 6-manifold: H₆(M) = 0 against H₆(S⁶) = ℤ, so no such M | Pass; binders do not narrow the predicate |
| 10.4 corollary route | smooth structure and h from the predicate | h gives π₁(M) = 1 and H₆(M;ℤ) ≅ ℤ, so an oriented atlas A exists (10.1). `TauCeti.IsOrientedAtlas` rejects the empty atlas, so A and B must be real atlases. Apply `smoothPoincareSix_oriented`, forget the equation | Pass |
| completion item 11 | against Summary, 9A.1–9A.4, `Suggested.lean` | ℤ/240 ↔ `nonempty_sphere_homotopyGroup_seventhStem`; Θ₇ ≅ ℤ/28 ↔ 9A.2–9A.3; E₈ boundaries ↔ 9A.4 and the new theorem | Pass |

**Duplication and ownership.**
- `roadmaps grep` for `isEmpty_diffeomorph` finds only this roadmap's new theorem. For `NonemptyDiffeomorphSphere` it finds this roadmap and Poincare3D on main (`Suggested.lean`:67, the predicate at n = 3), so the two roadmaps now state smooth recognition through the same Mathlib predicate, in different dimensions.
- The pinned Tau Ceti has neither name.
- Other README mentions of exotic spheres (MorseTheory, PositiveScalarCurvature) do not state existence of a manifold homeomorphic but not diffeomorphic to a sphere.
- Overlaps: #284 still conflicts in both files, as in the previous report; its numbering is mapped in "How to read the build". No cited id is dropped by an open pull request, and none is defined only by an open revision other than the one the description already names.

**Text the change could have made wrong.** Searched both files for "unrestricted proposition", "two recognition statements", "all three hypotheses", "un-oriented" and "Nonempty Diffeomorph": 0 remaining occurrences. The 9A.4 `*Needs:*` line now names 6B's boundary homeomorphism; the Layer 9A Dependencies already list Sections 6A–6C.

## Not verifiable

Nothing in the changed passages. The items listed in the previous report (Milnor's *Topology from the Differentiable Viewpoint* §7, Browder 1969, Bott 1959, Gray 2001, Fomenko–Fuchs §27.4, Toda 1962, Wall, Adams–Atiyah) concern untouched text and remain unread for the reasons given there.

## Source issues

- none
