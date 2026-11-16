# FIX-DESIGN-CompressibleEulerEquations~9

This round repairs the two findings of `REV-DESIGN-CompressibleEulerEquations~8`. Both are P3, and
both are mathematically correct. Two files changed: `packages/CompressibleEulerEquations/design/README.md`
and `packages/CompressibleEulerEquations/design/plan.json`. `packages/CompressibleEulerEquations/sources.toml`
did not change, because no work is newly cited. The design stage has no `Suggested.lean`, so no Lean
statement changed. Nothing was elaborated, and the `#check` comparison had no file to run on.

## F01 (P3) — applied differently

Verified at LorentzianGeometry's head, §12.7. Old §8.4: no comparison. New: a paragraph naming
§12.7's identity and how (b) differs, plus the separating truncation. The Scope sentence was split
rather than given "(§9.2, §12.7 there)", because §8.4 does use §9.2's nullity. The §3.2 limit-curve
clause now also names §12.7.

## F02 (P3) — applied

Verified: §6.1 says only `U₁`'s cones enter. Old §6.2: "…and bounded cone fields…agree". New:
"…one of which has a cone field bounded…, agree", with the derivation. Old §7.1: "…with this data
and bounded cone field…". New: "…with this data", because `U` has compact range in `G` (§4.2).
Added a Burgers Check with a negative control; plan 6.2.1 and 7.1 updated.

## What changed, in detail

**F01.** I checked the review's claim against LorentzianGeometry at its open head (§12.7, the
"Slices of a temporal function" paragraph, together with the §12.7 row of its setting table and the
Layer 12 introduction). §12.7 works on manifolds without boundary with a locally Lipschitz metric.
For `S` closed in a slice it proves `∂_U D⁺_U(S) ∩ {t > t₀} = H⁺_U(S) ∩ {t > t₀}`, and it proves the
horizon is null in the sense of §9.2 where it is `C¹`.

- **§8.4** gets the comparison paragraph essentially as the review asked. I made it more precise in
  three places: `∩ {t > t₀}` now appears on both sides of the identity, since the horizon also
  contains points at `t = t₀`; it says "in the sense of its §9.2"; and it says "which has boundary".
  It also carries the review's separating example (computed in the table below).
- **Scope bullet.** The review proposed adding "(§9.2, §12.7 there)" to the sentence "…are
  LorentzianGeometry's as well and are not used here". I did not apply that wording: it would
  declare §9.2's null hypersurfaces unused, while §8.4 (b) and its corollary use them through §9.2's
  equivalent form `g⁻¹(dφ, dφ) = 0`. The sentence is now split three ways: null hypersurfaces are
  LorentzianGeometry §9.2's and enter here through the conormal condition of §3.1; §12.7 proves the
  limit curve theorem and horizon nullity for locally Lipschitz metrics, and §3.2 and §8.4 say how
  they differ; generators and geodesics are not used here.
- **Same pattern elsewhere.** §3.2's limit-curve clause named only LorentzianGeometry §11.4. It now
  also names §12.7's limit curve theorem, which requires a locally Lipschitz metric on a manifold
  without boundary; §3.2 needs only a continuous field on `D`.
- **Plan.** The 3.2.3 "differs" clause, a "differs" sentence in 8.4.1, and a new 8.4.1 test
  `separates_from_horizon_theorem`.
- **Searched, no change needed.** I looked through the rest of the README for statements beside a
  LorentzianGeometry statement on the same object without a comparison. §§3.1–3.3 already have one.
  §8.1–§8.3 cover developments, which LorentzianGeometry hands over to this roadmap. The §3.3 Check
  on the null half-space boundary is a Check, not a kept statement.

**F02.** I checked the claim against the README's own text. §6.1 says "Only the cones of `U₁`
enter". In the Theorem of §6.2, take `D = O = [t₀, t₁) × E` and `S = Σ_{t₀}`. Then
`D⁺_D(Σ_{t₀}) = D` follows from §3.3 (slabs) for the field of `U₁` alone, and `J⁻_D(p) ⊆ O` holds
trivially.

- **§6.2:** "…and bounded cone fields on `[t₀, t₂] × E`… agree" becomes "…one of which has a cone
  field bounded on `[t₀, t₂] × E`…, agree", followed by the derivation from the Theorem.
- **§7.1:** "…with this data and bounded cone field on each `[0, t₂] × E`" becomes "…with this
  data". The reason given is that `U([0, T] × E)` has compact closure in `G`, by §4.2 (continuity
  into `C_b`, and decay orthogonal to the span of `Λ`). So `κ ∘ U` is bounded, and §6.2 needs only
  one field.
- **Added Check in §6.2.** It has two halves: the review's Burgers witness, which shows one bounded
  field suffices; and a negative control, the pair `(0, x)`, `(u, x)` from the Check of §6.1, which
  shows that dropping the bound altogether fails.
- **Plan.** 6.2.1 has a new statement and hypotheses, plus tests `burgers_one_bounded_field` and
  `neither_field_bounded`. The 7.1 statement changed to match.
- **Same pattern elsewhere, no change needed.** §7.3 already uses only the constructed solution's
  field `(m, 0)`. §8.2 and §8.3 apply the Theorem directly. §7.2's uniqueness is within the `Hᵏ`
  class and is true as stated. 1.3.1 concerns one solution.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §6.2 slab uniqueness, one bounded field | Burgers, `κ(u) = (1 + |u|, 0)` (largest root of `ωu − λ = 0` over `ω = ±1` is `|u|`); `U₁ ≡ 0`; arbitrary `C¹` `U₂`, zero data | `κ(0) = (1, 0)`; along `ẋ = U₂`, `d/dt U₂(t, x(t)) = ∂_tU₂ + U₂∂_xU₂ = 0`, so `x(t) = x_p + U₂(p)(t − t_p)`, which stays bounded, so the maximal backward interval reaches `0`; `U₂(p) = U₂(0, x(0)) = 0` | holds without a bound on `U₂` |
| same, both fields unbounded (negative control) | system `A⁰ = I`, `A¹ = diag(z², 0)`, `Λ = 0`, solutions `(0, x)`, `(u, x)`, `u = g(t + 1/x)` | `κ = (1 + z², 0) = (1 + x², 0)`, unbounded; at `t = 0`, `1/x < 0`, so `u = 0`; at `(0.9, −10/3)`, `t + 1/x = 0.9 − 0.3 = 0.6 ∈ (1/2, 1)`, so `u = g(0.6) ≠ 0` | the one-field hypothesis is needed |
| same, degenerate slab | `t₁ = t₀` | `[t₀, t₀) × E = ∅`, vacuous | sound |
| §7.1 uniqueness among all classical solutions | Burgers `u₀ = −e^{−x²}`, `Λ = 0`; `G = (0, ∞)`, `Ū = 1`, `U₀ = 1 − e^{−x²}/2`; `Λ = 2πℤ`, `n = 1`; `U₀ ≡ Ū` | values in `[−1, 0]`, `κ ≤ (2, 0)`; values in `[1/2, 1]`, closure = image ∪ `{1}` ⊆ `G`; `E/Λ` compact, so the image is compact; constant field | sound |
| §7.1 compactness argument | `t_m → t*`, `|y_m| → ∞` orthogonal to `V` | `|U(t_m, f_m + y_m) − Ū| ≤ ‖U(t_m) − U(t*)‖_∞ + |U(t*, f_m + y_m) − Ū| → 0`; `Λ` is a lattice in `V`, so `V/Λ` is compact | closure ⊆ `G` |
| §8.4 comparison paragraph | `c = 1`, `v = 0`, `n = 1`, `S = (−1, 1)`, truncation at `t = 1/2`; `U = ℝ²`, `S = [−1, 1]` | top `φ = t − 1/2`: `∂_tφ = 1 > 0 = c|∇φ|` (spacelike); for `t > 0`, `|x| ≤ 1 − t`, every past curve crosses `t = 0` at `|x(0)| ≤ |x| + t ≤ 1`; for `|x| > 1 − t` the outward null line gives `|x| + t > 1`, so `D⁺_U = {0 ≤ t ≤ 1 − |x|}`; side `φ = |x| − 1 + t`: `∂_tφ = 1 = c|∇φ|` (null) | separates (a), (b) and §12.7 |
| §12.7 identity at `t = t₀` (wording) | same `U = ℝ²` | `H⁺_U(S)` contains `edge(S) = {(0, ±1)}` at `t = 0`, which is not in `∂_U D⁺_U(S) ∩ {t > 0}` | `∩ {t > t₀}` is needed on both sides |
| Scope: §9.2 form for §8.4 | constant state ball; expanding flow at `t = 1` | `g⁻¹(dφ, dφ) = −c₀⁻²(c₀ − e·v₀ + v₀·e)² + 1 = 0`; `−2·(1/√2)² + 1 = 0` | agrees with §3.1 and §9.2 |
| §3.2 clause, §12.7 limit curves | field `c = 1 + |x|^{1/2}`, `v = 0` on `H₀` | continuous, not locally Lipschitz at `x = 0`: §3.2 applies, §12.7 does not | clause separates |

## Checks

Dependency check:

```text
candidate: CompressibleEulerEquations is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2233 edges, 0 problem(s)
```

- **Dependency check:** no UPWARD or CYCLE line.
- **Edge count:** the review reported 2232 edges. Running the check on the pre-edit README also gives 2233, so the difference comes from the state of the content repository, not from this edit.
- **Citations:** `roadmaps resolve` on the edited README lists nothing for either cross-roadmap citations or Lean names.
- **Plan:** `design/plan.json` parses, with 53 targets and `gaps: []`.
- **Elaboration and `#check` comparison:** not run, because there is no `Suggested.lean` at the design stage.

## Gate failures

None were listed for this round.

## Notes for the maintainer

- **LorentzianGeometry §12.7:** now cited only as a comparison. It adds no `*Needs:*` line, supplier-contract row or plan prerequisite, so there is no new edge.
- **Ownership:** horizon nullity in a fixed spacetime stays with LorentzianGeometry. Nullity of the boundary of a maximal development stays here. This was checked at LorentzianGeometry's open head through `roadmaps show`.
- **Names and ids:** no target id or name changed, and no notion moved down.
- **Untrusted text:** the review contains no instruction-like passage.
