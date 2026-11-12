# Repair of the round-5 review of QuasicoherentSheavesOnPrestacks (design)

One finding, settled on the mathematics.

## F01 (P2) — applied

README 2.3: "a map, or an object, is an equivalence, or zero, exactly when every evaluation is" → "a map is an equivalence, and an object is zero, exactly when every evaluation is, whereas the vanishing of a map is not detected pointwise in general (on `Spec A` it is …)". The Check "Joint conservativity uses all points …" → "Vanishing of maps is not detected pointwise …". `plan.json` test `one_point_insufficient` → `vanishing_not_pointwise`.

**Verification.** The finding is right, and the failure is broader than it says. On any prestack X, any map `O_X → O_X[1]` evaluates at `(A, η)` into `π₀ Map_{Mod_A}(A, A[1]) = π₋₁A`. That group is 0 because every test ring is connective (discrete in `CRing`), so every such evaluation is null.

On `X = BΓ × Spec 𝔽₂` with `Γ = ℤ/2`, `π₀ Map(O, O[1]) = H¹(ℤ/2; 𝔽₂) = Hom(ℤ/2, 𝔽₂) = 𝔽₂`, so the nonzero class has all its evaluations zero. A point `(A, (b, φ))` is joined to `(A, (∗, φ))` by a path in the connected BΓ. That point is the image of the atlas point `(𝔽₂, (∗, id))` under `φ`. So no point detects the class, and the old Check's suggestion that other points would is false.

The intended reading is true. By 1.5, a morphism of a limit is an equivalence exactly when every image is. An object F is zero exactly when `F → 0` is an equivalence, because evaluations are exact. On X the atlas point alone suffices, since `Fun(BΓ, Mod_𝔽₂) → Mod_𝔽₂` is conservative.

**Repair as applied** (the suggested wording, sharpened in three places):
- The 2.3 statement adds that vanishing *is* detected on `Spec A`, where evaluation at the initial point is an equivalence. Without this, "not detected pointwise" would also be false there.
- The proof route of 2.3 had no step for detection. It now cites 1.5 and the exactness of evaluations. The *Needs:* line and the `plan.json` 2.3 prerequisites gain 1.5, which is earlier in the build.
- The new Check gives the general reason `π₋₁A = 0` rather than only `Ext¹_A(A, A) = 0`. It keeps the reviewer's factorization through the atlas point, now to show that no choice of points helps. It also checks that the class is not an equivalence, since its evaluation `𝔽₂ → 𝔽₂[1]` is not one.

**Other occurrences of the pattern, all repaired:**
- README 2.2, fourth Check: "the value at one atlas point does not determine maps" invited the same misreading (that more points would). It now says that the pullback to *every* point lies in `π₋₁A = 0`, so maps are not determined by their evaluations. It names the wrong model this excludes: the limit of the homotopy categories, whose Hom sets are the Γ-invariants of `Ext¹_k(k, k) = 0` and lose the class. The mapping-space formula is made explicit as `Ω^∞` of `(k[1])^{hΓ}`. `plan.json` 2.2 test `BZ2_class` follows.
- Layer 2 Examples: "every evaluation is the forgetful functor to `Mod_k`" was wrong at points with `A ≠ k`. It now reads "the forgetful functor to `Mod_k` followed by `A ⊗_k −`", with the reason: points factor through the atlas because BΓ is connected.
- `plan.json` 2.3: the `statement` adds "vanishing of maps is not (except on affines, through the initial point)", and the API `conservative` adds zero objects and the citation of 1.5. This keeps the plan in agreement with the README.
- Searched and found correct as written:
  - 1.5, line 252: equivalences in a limit are detected componentwise.
  - 6.1: perfectness on `BΓ × Spec k` is perfectness of the underlying k-module, an object property.
  - 6.3, statement and Check on `B(ℤ/p) × Spec 𝔽_p`: invertibility and dualizability of objects are detected pointwise.
  - 8.3 route: `N|_{Y_η} = 0` and every point factoring through some `Y_η`, which is object vanishing.
  - `plan.json` 7.2 test (`H¹` invisible to ordinary invariants) and 6.2 test (heart of `QCoh(B(ℤ/2) × Spec 𝔽₂)`).

## Adversarial pass on the changed statements

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 2.3: map equivalence ⇔ all evaluations equivalences | `X = ∅`; `Spec A`; `BΓ × Spec 𝔽₂` | `QCoh(∅) = 0`: both sides hold vacuously; `Spec A`: initial point `(A, id)` evaluates by an equivalence; `BΓ × Spec 𝔽₂`: atlas evaluation = forgetful functor, conservative | holds |
| 2.3: object zero ⇔ all evaluations zero | same; `F = O` on `Spec 0` | `F ≃ 0` ⇔ `F → 0` equivalence; exact evaluations preserve 0; `QCoh(Spec 0) = Mod_0 = 0`, so `O = 0` and its single evaluation `0` is 0 | holds |
| 2.3: vanishing of maps not pointwise in general; detected on `Spec A` | `BΓ × Spec 𝔽₂`, `Γ = ℤ/2`; `Spec A` | class in `H¹(ℤ/2; 𝔽₂) = 𝔽₂` nonzero, evaluations in `π₋₁A = 0`; on `Spec A` evaluation at `(A, id)` is the equivalence `QCoh(Spec A) ≃ Mod_A`, so a map is zero iff that evaluation is | both clauses hold |
| 2.3 Check: every point of `BΓ × Spec 𝔽₂` factors through the atlas point | `(A, (b, φ))`; classical context with `char A ≠ 2` | path `b ∼ ∗` in connected BΓ; `(∗, φ) = φ_*(∗, id)`; for `char A ≠ 2` there is no point, since `Map_{CRing}(𝔽₂, A) = ∅` | holds |
| 2.3 Check: the nonzero class is not an equivalence | atlas evaluation | the zero map `𝔽₂ → 𝔽₂[1]`: `π₀` of source `𝔽₂`, of target 0 | not an equivalence, as stated |
| 2.2 Check: `Map(O, O[1]) = Ω^∞((k[1])^{hΓ})`, `π₀ = H¹(Γ; k)` | `Γ = ℤ/2`, `k = 𝔽₂`; trivial Γ | `X = colim_{BΓ} Spec k`, so `Map = lim_{BΓ} Map_k(k, k[1])`; `π₀((k[1])^{hΓ}) = π₋₁(k^{hΓ}) = H¹(Γ; k) = 𝔽₂`; trivial Γ: `H¹ = 0` = `Ext¹_k(k, k)`, consistent | holds |
| 2.2 Check: limit of homotopy categories loses the class | 2-limit over BΓ of `ho Mod_k` with trivial action | Hom from `(k, triv)` to `(k[1], triv)` = Γ-invariants of `Hom_{D(k)}(k, k[1]) = 0` | gives 0 ≠ 𝔽₂: the wrong model is excluded |
| Layer 2 Example: evaluation at `(A, η)` is forgetful then `A ⊗_k −` | `A = k`; `A = k[t]`; `Γ` trivial | `A = k`: the forgetful functor; `A = k[t]`: `V ↦ k[t] ⊗_k V`; trivial Γ: `QCoh = Mod_k` and evaluation = base change | holds |
| `plan.json` 2.3 prerequisite `target:1.5` | build order | 1.5 is in Layer 1, before 2.3; its part (b) states detection of equivalences in a limit | no forward edge |

The Check counts are unchanged: 2.2 still has four Checks and 2.3 four. The `plan.json` test count is still 117, with one test renamed. The JSON parses.

## Checks run

**Dependency check** (exact output):

```
candidate: QuasicoherentSheavesOnPrestacks is not in the merge order yet; checked as if placed after QuasiregularMaps (the intake inserts it when its design is accepted)
depcheck: 234 roadmaps, 2111 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

**Citation resolver** on the edited README: "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None." The repair adds no cross-roadmap citation, no supplier and no backticked Lean name of this roadmap's own. 1.5 is internal, and the spans `Ω^∞`, `(k[1])^{hΓ}` and `π₋₁A` are mathematics.

**Lean:** the design stage has no `Suggested.lean`, so no `#check` pass applies, and none was run.

**Gate failures:** none were listed for this round.

## Notes for the maintainer

- The repair adds no target, no supplier and no gap, and changes no name that other roadmaps cite. The section ids are unchanged. The only renamed item is the `plan.json` test of 2.3 (`one_point_insufficient` → `vanishing_not_pointwise`), which is internal to the plan.
- `sources.toml` is unchanged. No new source was cited, and nothing was added to `needs-references.toml`.
- Ownership: the repair restates an existing statement of 2.3 and introduces no new construction, so no new ownership question arises. The earlier rounds' ownership record stands: the overlaps report lists no open pull request that changes this roadmap and no cited id dropped.
- None of the data read in this round contained instructions.
