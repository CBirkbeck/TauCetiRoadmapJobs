# Repair of the design review of YangMillsConnectionsAndCaloricGauge (round 5)

Files edited: `packages/YangMillsConnectionsAndCaloricGauge/design/README.md` and
`packages/YangMillsConnectionsAndCaloricGauge/design/plan.json`. `sources.toml` is unchanged: no new work is
cited, and its `OhTataru-YMHF` entry already covers Theorem 7.8 and target 10.4.

There is one review (REV-DESIGN-YangMillsConnectionsAndCaloricGauge~4) with one finding. The finding is correct
and is applied as asked. Writing 10.4 against Mathlib's notion also required completing 10.4's route:

- an inverse-function-theorem step;
- complements for the slice and for the range of the derivative;
- one bound taken from the source, which was too strong and is replaced by the bound the argument needs.

## F01 (P3) — applied

Old → new: 10.4's chart condition (`C¹`, homeomorphism onto `S ∩ U`, injective derivative of closed complemented
range) → a chart with image `S ∩ U` satisfying `Manifold.IsSmoothEmbedding 𝓘(ℝ, E) 𝓘(ℝ, 𝔅) 1 φ` (`V` as
`TopologicalSpace.Opens`). The tangent clause is kept, API bullets cover both directions and independence of the
chart, and the Mathlib contract lists `Manifold.IsSmoothEmbedding` and `Manifold.IsImmersion`.

**Verification at the pin.** Mathlib `1b1ccf4b`, paths under `Mathlib/`:

- `Geometry/Manifold/SmoothEmbedding.lean:70`: `structure IsSmoothEmbedding`, inside `namespace Manifold` (line
  51). Its fields are `isImmersion : IsImmersion I J n f` and `isEmbedding : IsEmbedding f`. The full name is
  `Manifold.IsSmoothEmbedding`, not the unqualified name the review uses.
- `Geometry/Manifold/Immersion.lean:802`: `Manifold.IsImmersion` is defined as
  `∃ F … , IsImmersionOfComplement F I J n f`. That is, one complement `F` for all points, with the normal form
  `u ↦ (u, 0)` in charts of the maximal `C^n` atlases (lines 136–174).
- `Immersion.lean:1008`: `Manifold.IsImmersion.isDiffImmersionAt`, giving `IsDiffImmersionAt`, which is
  `(mfderiv f x).HasLeftInverse` (`ImmersionDiff.lean:65`). This is a continuous left inverse
  (`Analysis/Normed/Module/ContinuousInverse.lean:86`).
- The converse (a split injective derivative gives an immersion) is listed as a TODO in the module docstring
  (`Immersion.lean` lines 87–95): "requires the inverse function theorem". It is therefore not at the pin.
- `Geometry/Manifold/HasGroupoid.lean:284`: `TopologicalSpace.Opens.instChartedSpace`. The `IsManifold I n s`
  instance for `s : Opens M` is at `Geometry/Manifold/IsManifold/Basic.lean:1012`.
- `Analysis/Calculus/InverseFunctionTheorem/ContDiff.lean:31,66`: `ContDiffAt.toOpenPartialHomeomorph` and
  `ContDiffAt.to_localInverse`, with `[RCLike 𝕂]` and `[CompleteSpace E]`.

**The two definitions agree.**

- *Chart to old condition.* A `Manifold.IsSmoothEmbedding` chart is `C¹` (`IsSmoothEmbedding.contMDiff`). It is a
  homeomorphism onto its image (`IsEmbedding`), and its derivative has a continuous left inverse. A continuous left
  inverse means injective with closed complemented range.
- *Old condition to chart.* Take a `C¹` homeomorphism onto its image with split injective derivative. At `v₀` the
  map `Φ(u, w) = φ(u) + w` on `V × F` has derivative `Dφ(v₀) ⊕ ι`. This is an isomorphism `E × F → 𝔅`, since
  `Dφ(v₀)` is bounded below by the open mapping theorem. So the local inverse is a `C¹` chart in which `φ` reads
  `u ↦ (u, 0)`.
- *One complement.* `IsImmersion` fixes a single `F`, while the complement at `v` is determined only up to
  isomorphism, as `𝔅/Dφ(v)E`. It is locally constant, because one chart pair serves a neighbourhood. So it is
  constant on a connected `V`. Every chart restricts to a ball, so the two definitions define the same subsets.
  The README states this as the second API bullet, with its route.

**What else changed in 10.4.**

1. *Normal form for the caloric chart.* The route ended with "bounded below + local surjectivity". To reach
   Mathlib's normal form it needs the range of the derivative to be complemented, and the old definition already
   required this without a route. The route now:
   - defines the gauge directions `𝒢_a = D(a)Δ_a⁻¹(ℓ¹L²)`;
   - shows that `Ph = h − D(a)Δ_a⁻¹(D(a)^ℓh_ℓ)` is a bounded projection of `ℋ` onto the slice `E_a` with kernel
     `𝒢_a`;
   - shows that `c = dO(0)b` is the 8.2 solution: uniqueness among solutions vanishing at infinity follows from
     `Δ|z|² = 2|D(a)z|²` and the weak maximum principle (PDE §3.2);
   - concludes `PL = id`.
2. *The chart's domain.* The chart's domain is now a ball in the linear slice `E_a`, matching the definition's
   `V ⊆ E`. Before, it was the affine slice `{a + b}`.
3. *A bound that was too strong.* The old route's bound `‖D(a)c‖_{ℓ¹Ḣ¹} ≲ ‖Δ_a c‖_{ℓ¹L²}` "(8.2)" is not what 8.2
   states, and it fails (see "Source issue" below). It is replaced by `‖D(a)Δ_a⁻¹f‖_ℋ ≲ ‖f‖_{ℓ¹L²}`, which is all
   the lower bound needs.
4. *Checks.*
   - The `U(1)` Check now names the slice, `𝒢_a` and `P` (the Leray projection).
   - The sphere Check now exhibits the normal-form chart of `𝔅`.
   - The cross / `|x₁|` bullet is split into two Checks. The new `|x₁|` Check separates the definition from the
     plausible wrong model "a `C¹` homeomorphism onto `S ∩ U`", via `t ↦ (t³, |t|³)`.
5. *Supplier and dependency lines.*
   - The Mathlib contract has a new bullet.
   - The PDE contract adds §3.2 and names the `ℓ¹` product bound `‖[u, v]‖_{ℓ¹L²} ≲ ‖u‖_{Ḣ¹}‖v‖_{Ḣ¹}` under §7.3.
   - Layer 10's Dependencies and Scope (one clause on how the notion differs) are updated.
6. *`plan.json`.*
   - 10.4: new statement, nine new prerequisites, three updated tests and one new test `abs-graph`.
   - PDE supplier sections gain `§3.2`.
   - Totals: 10 layers, 52 targets, 120 tests (was 119), 4 gaps.

**Pattern search.** I searched the README for "submanifold", "immersion", "embedding", "homeomorphism onto",
"complemented" and "injective derivative". The only restated chart condition was 10.4. §1.2's "compact embedded
submanifold" (`G ⊆ U(N)`) is consumed through Tau Ceti's tubular-neighbourhood theorems, not restated. 10.5's
"tangent space of 10.4" is consistent: it is the range of `L`, complemented in `ℋ` by `𝒢_a`, which matches 10.5's
`‖b‖_ℋ + ‖c‖_{ℓ¹Ḣ²} ≲ ‖w‖_ℋ`.

## Checks

Dependency check (`gate --only YangMillsConnectionsAndCaloricGauge`), after all edits:

```
candidate: YangMillsConnectionsAndCaloricGauge is not in the merge order yet; checked as if placed after GlaubermanZStar (the intake inserts it when its design is accepted)
depcheck: 237 roadmaps, 2344 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. PDE (§3.2 is new here) is on main.

Citation resolver (`roadmaps resolve` on the README):

- cross-roadmap citations found nowhere: none;
- Lean names found nowhere: none.

The resolver says it did not check Lean names outside TauCetiRoadmap, because there are no pinned Lake packages
on that host. So I checked every Mathlib name added this round by hand at the pin, with file and line (above).
PDE §3.2 is on main: `TauCetiRoadmap/PDE/README.md` line 1344, "3.2 Maximum principles, the Hopf lemmas and the
Aleksandrov–Bakelman–Pucci estimate", which takes the weak maximum principle for weak solutions from Tau Ceti.

Elaboration: there is no `Suggested.lean` at the design stage, and the brief gives no Lean command, so no
`#check` file was elaborated. The README still has no backticked Lean name of this roadmap's own.

## Adversarial pass (every statement added or changed)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Definition via `IsSmoothEmbedding` | `S = ∅`; `S = 𝔅`; `S = {a}` | `∅`: vacuous. `𝔅`: `E = 𝔅`, `φ = id`, `F = 0` (`IsSmoothEmbedding.id`). `{a}`: `E = 0`, `V = {0}`, `φ(0) = a`, codomain chart `y ↦ y − a`, `equiv : 0 × 𝔅 ≅ 𝔅`, normal form `0 ↦ (0, 0)` | point and whole space are split submanifolds of dimension `0` and `𝔅` | none |
| Global complement of `IsImmersion` | `V` disconnected | complement at `v` is `≅ 𝔅/Dφ(v)E`. Differentiating `ψ∘φ = equiv∘ι` gives `Dφ(v)E = Dψ⁻¹·equiv(E × 0)`, cokernel `≅ F`, the same for every `v` served by one chart pair | locally constant, so constant on a ball; charts restrict to balls, so no subset gains or loses the property | stated in the second API bullet |
| API 1: left inverse | `T = Dφ(v)`, left inverse `ℓ` | `Tℓ` is idempotent with range `T(E)`; kernel `ker ℓ`; `T : E → T(E)` has inverse `ℓ|` | tangent space closed, complemented, `≅ E` | none |
| API 2: inverse function theorem | `Φ(u, w) = φ(u) + w`, `DΦ(v₀, 0)(h, k) = Dφ(v₀)h + k` | injective: `Dφ(v₀)h = −k ∈ R ∩ F = 0`. Surjective: `𝔅 = R ⊕ F`, `R = Dφ(v₀)E`. Bounded inverse: `Dφ(v₀)` is bounded below by the open mapping theorem, `R` being closed. `E × F` is complete (`E`, `F` closed in `𝔅`), as `ContDiffAt.toOpenPartialHomeomorph` requires | normal form near `v₀` | none |
| API 3: chart independence | `φ₂⁻¹∘φ₁ = pr_{E₂}∘equiv₂⁻¹∘ψ₂∘φ₁` near `v₁` | `φ₁(u)` lies in `φ₂(ball)` for `u` near `v₁`, since `φ₂` is a homeomorphism onto `S ∩ U₂`. `D(φ₂∘τ)(v₁) = Dφ₁(v₁)` gives `Dφ₁E₁ ⊆ Dφ₂E₂`, and the symmetric inclusion | equal | none |
| Check: sphere | `φ(v) = (e+v)/‖e+v‖`, `ψ(y) = (y − ⟨y,e⟩e)/⟨y,e⟩ + (‖y‖ − 1)e` | `⟨φ(v), e⟩ = (1+‖v‖²)^{−1/2} > 0`; `ψ(φ(v)) = v + 0·e`. Inverse of `ψ`: `y = (1+t)(e+v)/‖e+v‖` gives `⟨y,e⟩ = (1+t)/‖e+v‖`, `y − ⟨y,e⟩e = (1+t)v/‖e+v‖`, ratio `v`, `‖y‖ − 1 = t`. `Dφ(0)h = h − e⟨e,h⟩ = h` for `h ⊥ e` | normal form for `e^⊥ ⊕ ℝe` | Check rewritten |
| Check: cross | small `U`; `E` of dimension 0, 1, 2 | `(S ∩ U)∖{0}` has 4 components. A connected open subset of a line minus a point has 2; of the plane, 1. A point is not a neighbourhood | excluded | Check rewritten |
| Check: graph of `|x₁|` | `t ↦ (t³, |t|³)`; any `t ↦ (x(t), |x(t)|)` | derivative `(3t², 3t|t|)`, continuous, `0` at `t = 0`; inverse `(x, y) ↦ x^{1/3}` continuous. If `x'(t₀) ≠ 0`, the one-sided derivatives of `|x|` are `±|x'(t₀)|`, so `|x|` is not differentiable. So `x'(t₀) = 0`, and `|x| ≥ 0 = |x(t₀)|` gives `(|x|)'(t₀) = 0`. Dimension 2 is excluded by empty interior, dimension 0 by no isolated points | homeomorphic `C¹` parametrisation exists, chart does not | new Check, plan test `abs-graph` |
| Check: `U(1)` | `𝔤 = iℝ`, `[a, b] = 0` | `E_a = {∂^ℓb_ℓ = 0} = 𝒞`; `Cal(a + b) = a + b`, `O = 1`, `c = 0`; `𝒢_a = ∇Δ⁻¹(ℓ¹L²)`; `P h = h − ∇Δ⁻¹∂^ℓh_ℓ`, with `‖∇Δ⁻¹f‖_{Ḣ¹} = ‖f‖_{L²} ≤ ‖f‖_{ℓ¹L²}` | Leray projection, bounded on `ℋ` | Check rewritten |
| Product bound `‖uv‖_{ℓ¹L²} ≲ ‖u‖_{Ḣ¹}‖v‖_{Ḣ¹}` on `ℝ⁴` | paraproduct pieces, `u_j = 2^j‖P_ju‖₂ ∈ ℓ²` | `T_uv`: `‖P_{<k}u‖_∞ ≲ Σ_{j<k}2^ju_j`, `‖P_kv‖₂ = 2^{−k}v_k`, `Σ_kΣ_{j<k}2^{j−k}u_jv_k ≲ ‖u‖‖v‖` (Young). `R(u,v)`: Bernstein `L¹ → L²` gains `2^{2k}`, `‖P_juP_jv‖₁ ≤ 2^{−2j}u_jv_j`, `Σ_kΣ_{j≥k}2^{2(k−j)}u_jv_j ≲ Σu_jv_j` | holds; needs `d = 4` | named under PDE §7.3 |
| `‖D(a)Δ_a⁻¹f‖_ℋ ≲ ‖f‖_{ℓ¹L²}` | `B = Δ_a⁻¹f ∈ ℓ¹Ḣ²` | `‖B‖_∞ ≲ Σ2^{2k}‖P_kB‖₂` (Bernstein). `∂[a,B] = [∂a,B] + [a,∂B]`: `L²·L^∞` and `L⁴·L⁴`. Divergence: `∂^ℓ(D(a)B)_ℓ = f − [a^ℓ, D(a)_ℓB] ∈ ℓ¹L²` (product bound, `D(a)B ∈ Ḣ¹`) | holds | route |
| `P` is a projection onto `E_a` with kernel `𝒢_a` | `h ∈ E_a`; `g = D(a)Δ_a⁻¹f` | `D(a)^ℓ(Ph)_ℓ = D(a)^ℓh_ℓ − Δ_aΔ_a⁻¹(D(a)^ℓh_ℓ) = 0`. `h ∈ E_a`: `Ph = h − D(a)Δ_a⁻¹0 = h`. `D(a)^ℓg_ℓ = f`, so `Pg = g − D(a)Δ_a⁻¹f = 0` | holds (linearity of `Δ_a⁻¹`) | route |
| `c = Δ_a⁻¹(Δ_ac)` | `z = c − Δ_a⁻¹(Δ_ac)` | `Δ_a z = 0`; `z ∈ C⁰` → 0 at `∞`; `∂²z ∈ L²`. `Δ|z|² = 2⟨D^jz, D_jz⟩ + 2⟨z, Δ_az⟩ = 2|Dz|²`, using `⟨z,[a_j,z]⟩ = 0` (ad-skew). `(|z|² − ε)^+ ∈ H¹₀(B_R)` for large `R`, so `|z|² ≤ ε` | `z = 0` | route |
| `PL = id`, range complemented | `L b = b − D(a)c`, `D(a)c ∈ 𝒢_a` | `P(Lb) = b − 0 = b`, so `‖b‖_ℋ ≤ ‖P‖‖Lb‖_ℋ`. `LP` is idempotent, `range LP = range L`, `ker LP = ker P = 𝒢_a` (`L` injective) | `ℋ = range L ⊕ 𝒢_a` | route |
| Old bound `‖D(a)c‖_{ℓ¹Ḣ¹} ≲ ‖Δ_ac‖_{ℓ¹L²}` | `a = t + g(t) ∈ 𝒞` near `0`, `t` divergence-free with `2^k‖P_kt‖ = 1/k` (`k ≥ 1`) concentrated in `B₁`; `c = c₀ψ`, `ψ ∈ C_c^∞`, `[c₀, ·]` injective on `t`'s values (`𝔰𝔲(2)`: `[i, j] = 2k`) | `T_0𝒞` = divergence-free fields, complement = gradients `∇φ`, `Δφ ∈ ℓ¹L²`, which lie in `ℓ¹Ḣ¹`; so `a ∉ ℓ¹Ḣ¹`. `Δ_ac ∈ ℓ¹L²` (`[a,∂ψ]`: `Σ_k2^{−k}a_k < ∞`). `∂c ∈ ℓ¹Ḣ¹`, but `‖P_k[a,c]‖_{Ḣ¹} ≈ 1/k` for large `k` | false as written; the `ℋ` form holds | replaced |
| Local injectivity and continuous inverse | normal form on a ball `B` | `ψ∘φ = equiv∘(·, 0)` on `B`, so `φ⁻¹ = pr∘equiv⁻¹∘ψ` on `φ(B)` | topological embedding on `B` | route |

## Source issue

**Error** in OhTataru-YMHF, proof of Theorem 7.8, Step 2, (7.10), PDF page 70 (line 3325). The left side is
printed as `‖D(a)c‖_{ℓ¹Ḣ¹}`. It should be `‖D(a)c‖_ℋ`:

- for caloric `a ∉ ℓ¹Ḣ¹`, the term `[a, c]` lies in `Ḣ¹` but not in `ℓ¹Ḣ¹` (row above);
- the lower bound (7.9) needs only the `ℋ` form.

The error affects the proof, not the theorem.

## For the maintainer

- **Ownership.** `roadmaps grep -i 'split submanifold|IsSmoothEmbedding|submanifold of a Banach'` over main and
  every open head finds no second owner of split submanifolds of a Banach space:
  - ManifoldOptimization O0.1 (open): finite-dimensional, smooth, locally defined level sets;
  - GeometricTopology, HomotopySpheres and AlgebraicTopologyPartII: they use `Manifold.IsSmoothEmbedding` for
    finite-dimensional manifolds.

  Pinned Tau Ceti has `TauCeti.SmoothEmbedding`, which only bundles Mathlib's predicate, and no submanifold
  notion. Ownership against the open pull requests named in the brief was checked with these tools.
- **Overlaps.** The overlaps listing (`roadmaps overlaps`) is unchanged from round 4. The only dropped id is DifferentialGeometry
  Layer 10, round 1's not-actionable item, which this round does not touch.
- **Names.** No name or id cited by another roadmap changed. The PDE sections consumed now include §3.2.
- **Suspicious text.** None. The review contains no instruction outside its findings.
