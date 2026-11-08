# FIX-DESIGN-QuasicoherentSheavesOnPrestacks~5

Repair of the findings of `REV-DESIGN-QuasicoherentSheavesOnPrestacks~4`. The review has one finding, F01 (P3); its body also calls it R01. Files edited: `packages/QuasicoherentSheavesOnPrestacks/design/README.md`, `packages/QuasicoherentSheavesOnPrestacks/design/plan.json` and `packages/QuasicoherentSheavesOnPrestacks/sources.toml`.

## REV-DESIGN-QuasicoherentSheavesOnPrestacks~4/F01 (P3) — applied differently

**Change.** In the 3.4 route, "`h_X` is the Zariski sheafification of the colimit … and of `|h_{U_•}|`; apply 3.3" became a route that treats the two maps separately:
- The hypercover realization is ∞-connective and is inverted by hypersheafification (HTT 6.5.3.11, 6.5.3.13), not by sheafification in general (HTT 6.5.3.12).
- The affine-open colimit is inverted by ordinary sheafification.

Both then feed 3.3(a) and 2.3.

**Verified: the hypercover half is right as stated.**
- HTT Lemma 6.5.3.11 (HTT line 31671, PDF p. 698): the realization of a hypercovering is ∞-connective.
- HTT Theorem 6.5.3.12 (HTT line 31680, p. 698): every hypercovering of every slice is effective exactly when the ∞-topos is hypercomplete.
- HTT Corollary 6.5.3.13 (HTT line 31693, p. 698): hypercompletion is the localization at these realizations.

So "sheafification" was unjustified for an arbitrary Zariski hypercover. It can also fail. HTT Remark 6.5.4.7 (line 31895, PDF p. 703) draws from Counterexample 6.5.4.5 (line 31847, p. 702) that the coherent space `X = S^ℕ` has `Shv(X)^∧ ≠ Shv(X)`. That space is spectral (a product of finite T0 spaces), so by Hochster it is `Spec A` for some ring A, and the Zariski ∞-topos of `Spec A` is not hypercomplete.

**Why "differently": the poset half needs only sheafification.** The suggested text, "Zariski hypersheafification" for both maps, is true but weaker than what holds for the poset colimit. The review's ground for it ("contractible stalkwise, so ∞-connective") also leans on enough points in the big Zariski ∞-topos, which no supplier states. The route now gives a direct Čech argument:
- Let B be the affine opens and S the opens contained in some affine open, so `B ⊆ S`. Then `colim_B h_U ≃ colim_{W∈S} colim_{U∈B, U⊆W} h_U`, a left Kan extension along `B ⊆ S`.
- Each W in S is an open of an affine scheme, hence separated. So the affine opens inside W are closed under finite intersections, and S is too.
- At a test ring R, each inner colimit is therefore the disjoint union over f of nerves of posets with binary meets, contractible when nonempty. So it is a subfunctor of `h_W`, respectively of `h_X`.
- These monomorphisms are surjective Zariski-locally, because affine opens form a basis. So L, being left exact and colimit-preserving, inverts them (3.1).

The review's own test instance agrees. In the doubled plane with Jouanolou point `R = k[x,y,a,b]/(ax+by−1)`, the presheaf fibre is the two points `{U, U′}`. On the cover `D(x)`, `D(y)` of `Spec R` the images `{x ≠ 0}`, `{y ≠ 0}` are least affine opens containing them, so the fibre becomes contractible after Čech sheafification. This instance is now a fourth Check of 3.4, in the README and as `plan.json` test `doubled_plane`.

**Other edits made for this repair.**
- *Needs:* of 3.4 gains 2.3, 3.1, EnhancedDerivedSheaves E2.7 (`hypercompleteSpaceSheaves`, on main under heading E2.7 at its line 2375) and HigherToposTheory L11.3. L11.3 at its head states 6.5.3.11, 6.5.3.12 and 6.5.3.13 under "Realizations of hypercoverings are ∞-connective" and "Hyperdescent". `plan.json` 3.4 prerequisites follow.
- The HigherToposTheory L11.3 contract bullet, the Scope line and the `plan.json` supplier `what` now name the hypercovering results.
- `sources.toml` HTT gains Lemma 6.5.3.11, Theorem 6.5.3.12 and Corollary 6.5.3.13, and `cited_for` gains 3.4. The manifest parses as TOML.
- 3.4's empty-scheme Check said "the limit is empty-indexed". That was wrong: ∅ is an affine open (Mathlib `AlgebraicGeometry.isAffineOpen_bot`, `Mathlib/AlgebraicGeometry/Limits.lean:137`), so the indexing poset is `{∅}` and the limit is `Mod_0 = 0`. It now says this, and notes that `h_∅` is the prestack `Spec 0`. The `plan.json` `empty_scheme` test follows.

**Pattern sweep.** Every "sheafification" and "hypercover" in the README was checked:
- 2.1 Check, `Spec 0` versus ∅: the empty family covers 0, a Čech statement.
- 2.5: stackification versus fppf sheafification of 1-truncated prestacks; truncated objects are hypercomplete (HTT 6.5.2.9).
- 3.3(c): the Čech nerve of an effective epimorphism.
- 5.2: hyperdescent of `D∞(O)` through EnhancedDerivedSheaves `hypercoverPullback_unit` and `hypercoverDescent_boundedBelow`, which hold for every hypercover.
- 5.3: cites 3.4's statement, not its route.
- 7.1: defines `[X/G]` through hypersheafification.
- 7.4(a): the bar construction is the Čech nerve of `h_X → [X/G]^♮`.

None needs a change.

## Checks

**Dependency direction** (exact output):

```
candidate: QuasicoherentSheavesOnPrestacks is not in the merge order yet; checked as if placed after GlaubermanZStar (the intake inserts it when its design is accepted)
depcheck: 237 roadmaps, 2342 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line.

**Citation resolver** (`roadmaps resolve` on the edited README): "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None."

**Counts.** 33 targets and 117 Checks: 3.4 now has 4. `plan.json` has the same 33 targets and 117 tests, parses, and has the gap unchanged.

**Style.** No LaTeX delimiters, process words, local paths or pull-request numbers were added.

**`Suggested.lean`.** The design stage has no `Suggested.lean`, so there was no `#check` pass and nothing to elaborate.

## Adversarial pass on the changed statements

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 3.4 route: `colim_B h_U → h_X` inverted by sheafification | doubled plane, `f` from `R = k[x,y,a,b]/(ax+by−1)` | `ax₀ + by₀ = 1` is solvable whenever `(x₀, y₀) ≠ 0`, so f is onto `𝔸² ∖ 0`. Opens containing it: `𝔸² ∖ 0`, U, U′, X. `𝔸² ∖ 0` is not affine (`O = k[x,y]`), and X is not separated. Presheaf fibre `{U, U′}`, two points. `R_x = k[x^{±1}, y, b]` maps onto `{x ≠ 0}`, which is the least affine open containing it, so the fibre is contractible. `(x, y) = R`, so `D(x)`, `D(y)` cover. | sound; the presheaf map is not an equivalence, the sheafified one is |
| same | `ℙ¹_k` | separated, so B is closed under intersections. Every proper open of `ℙ¹` is affine (the complement of a nonempty finite set of closed points of a projective curve), and `ℙ¹` is not, so `S = B`. Fibres are contractible or empty. | sound |
| same | `X = ⨿_ℕ Spec ℤ`, `R = ℤ × ℤ`, f hitting components 0 and 1 | the image `Spec ℤ ⊔ Spec ℤ` is affine. The affine opens containing it are closed under binary meets (X separated), so the fibre is contractible. | sound |
| same | `X = ∅` | `B = {∅}`; `h_∅(R)` is a point iff `R = 0`, equal to `Spec 0`; the colimit is `h_∅` already as prestacks | sound |
| 3.4 route: `|h_{U_•}| → h_X` | Čech nerve of `{D(t), D(t⁻¹)}` on `ℙ¹`; arbitrary hypercover of `Spec A ≅ S^ℕ` | 0-coskeletal, so effective (HTT 6.5.3.9) and sheafification suffices. `Shv(S^ℕ)` is not hypercomplete (HTT Remark 6.5.4.7 with Counterexample 6.5.4.5), so by 6.5.3.12 some hypercover of a slice is not effective. The hyper version holds by 6.5.3.13. | the original wording fails in general; repaired |
| L carries Zariski hypercovers to fpqc hypercovers | `U_n → (cosk_{n−1}U_•)_n` a surjective local isomorphism | h preserves fibre products, L preserves finite limits, so coskeleta commute. Lifts exist Zariski-locally, so the map is an effective epimorphism after L. `{A → A_{g_i}}` with `(g_i) = A` gives `A → ∏ A_{g_i}` faithfully flat, e.g. `ℤ → ℤ[1/2] × ℤ[1/3]`. | sound |
| 3.4(a) limit formula via 2.3 | `ℙ¹_k` | the two-chart Čech totalization is `D∞(k[t]) ×_{D∞(k[t,t⁻¹])} D∞(k[t⁻¹])`. `H¹(ℙ¹, O(−2))` is the cokernel of `(a, b) ↦ a − t⁻²b`, spanned by `t⁻¹`, so `= k`. | unchanged and consistent |
| empty-scheme Check | `X = ∅` | old text "empty-indexed" is false (`isAffineOpen_bot`); the value `Mod_0 = 0` is the same either way | fixed |

## For the maintainer

- No name that other roadmaps cite changed. Target 3.4 keeps its id, name and statement; only its route, *Needs:* and Checks changed.
- HigherToposTheory is cited as it is at the head of its open new-roadmap pull request. L11.3 was already a supplier section, so no new dependency enters. Nothing here is defined only by an open revision.
- Ownership against open pull requests was not rechecked: this repair adds no owned object and no construction another roadmap could own.
- No source was missing; `needs-references.toml` was not written.
- No suspicious instruction was found in the review text.
