# FIX-DESIGN-QuasiregularMaps~2

Repair round on the review `REV-DESIGN-QuasiregularMaps` (four P3 findings). Files edited:
`packages/QuasiregularMaps/design/README.md` and `packages/QuasiregularMaps/design/plan.json`.
`packages/QuasiregularMaps/sources.toml` is unchanged; every locator used is already recorded.

## F01 (P3) — applied

Verified: for `M = ∅` and the empty cover, §2.2 and §2.3 give `K_O(f) = max(1, ess sup ∅) = 1`.
The supremum of the empty family in `[0, ∞]` is `0`, so the old identity was false there and
correct for every non-empty index set, since each `K_O(f|_{U_i}) ≥ 1`.

§2.5: `K_O(f) = sup_i K_O(f|_{U_i})` → `K_O(f) = max(1, sup_i K_O(f|_{U_i}))`, plus a clause that
the `max` matters only for the empty cover. A new Check covers the empty cover (`1` versus `0`).
plan.json 2.5 has the same statement and a new test `local_empty_cover`.

Pattern: every other supremum in the roadmap already carries `max(1, ·)` or an explicit
non-emptiness clause: §2.2, §2.7, §3.1, §3.4, §4.3 (`K_θ`), §6.4 (`K_p`, with "`K_p ≥ 1` when
`M` is non-empty", used only through `max(1, K_p)`), §7.4 (`K_q`) and §7.6. No other change.

## F02 (P3) — applied

Verified: §2.8 defines only "locally Lipschitz in charts" for maps `M → N`. A closed top simplex
image is compact but need not lie in one chart domain, so "`κ|σ` bi-Lipschitz in charts onto its
image" had no fixed meaning.

§6.1 bullet: "bi-Lipschitz in charts onto its image" → for every `x ∈ σ`, a neighbourhood `σ'`
and `0 < c ≤ C` with `κ(σ') ⊆` source of `extChartAt 𝓘(ℝ, E) (κ x)` and
`c|y − z| ≤ |φκy − φκz| ≤ C|y − z|`, in barycentric coordinates (`σ → ℝ`, as
`TauCeti.IsSimplexImmersion` uses). The text adds that this does not depend on the chart.

Route: the old global compactness argument is replaced by a local one. `A(x)` is injective on
sum-zero directions and `A` is continuous within `σ`. `Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le'`
then gives the lower bound and `Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le` the upper.

§6.3 now states the local chart bounds it uses, and how the local pieces of the finitely many
simplices through a point cover a neighbourhood.

Other places with the same notion: the Scope bullet ("top simplices locally bi-Lipschitz in
charts"), Check 3 of §6.1 (failure at the vertex `0`), the §6.1 *Needs* line, and the Mathlib
supplier contracts (`extChartAt`, the primed mean value lemma). plan.json 6.1 has the statement,
three new `mathlib:` prerequisites and two updated tests.

## F03 (P3) — applied

Verified: the route of §7.6 (§4.3, §6.4, density of the open top simplices from §6.1) never uses
compactness of `N`. §6.4 needs only `K_p < ∞`, which is a hypothesis. Witness:
`T = N = ℝ²` with the integer grid triangulated by diagonals, `s = id`, `π = id`. Then
`K_π = K_p = 1` and `p ∘ π = id` is non-constant and `1`-quasiregular.

§7.6: "Let `N` be closed, `T` …" → "Let `T` …", plus "No compactness of `N` is assumed". The
closedness stays in the sentence about HeikkilaPankka2025 (lines 32–34, 85–91; Proposition B.1
at line 1247). The witness is a new Check. plan.json 7.6: "N closed" removed from the statement
and the hypotheses, and a new test `simplicial_elliptic_noncompact`.

Pattern: the Summary bullets for §6.4 and §7.6 also said "closed". They now match the targets:
"bounded simplexwise distortion, in particular one with closed source" for §6.4, and "a connected
oriented Riemannian manifold that receives … from a flat torus" for §7.6. The other uses of
"closed" do real work: in §7.3 and §7.4 compactness makes the bounds automatic, and Part III is
about closed manifolds.

## F04 (P3) — applied differently

Verified: HeikkilaPankka2025 lines 85–91 compose a piecewise linear branched covering `T⁴ → N`
with the locally isometric covering `ℝ⁴ → T⁴`. They contain no fibre argument.

The reviewer's repair (attach the locator to "a closed manifold finitely … covered …") is not
applied. Those lines do not state that claim either: their second map is branched, not a finite
unbranched covering, so the same defect would come back.

What changed instead: the discrete-fibre step is now uncited and spelled out (the fibres of a
local homeomorphism are discrete; a connected subset of a discrete set is a point). A new sentence
says what the source actually does: it postcomposes a non-constant quasiregular `ℝⁿ → N` with a
map `N → N'`, there a branched covering (§7.6). plan.json 7.4 locator: "lines 85-91" → "lines
85-91 (the same postcomposition, there with a piecewise linear branched covering in place of q)".

Pattern: §7.2 had the same placement, "and it is non-constant (HeikkilaPankka2025 lines 20–21)",
where lines 20–21 only define ellipticity. It now reads: "It is non-constant because `R` is a
bijection, so it is a witness in the sense of the definition (HeikkilaPankka2025 lines 20–21)".
plan.json 7.2's locator says the same.

The other HeikkilaPankka2025 and Prywes2019 locators were re-read at their lines and each
supports the sentence it is attached to: 18–27, 32–34, 52–57, 94–96, 271–273, 1236–1260,
1317–1339 for HeikkilaPankka2025, and 22–30, 33–36, 41–53, 59–62 for Prywes2019. The §7.6
citation of lines 85–91 is correct, since that is the branched-covering construction.

## Adversarial pass on the changed statements

| statement | instances tried | values computed on each side | result | change |
| --- | --- | --- | --- | --- |
| §2.5 `K_O(f) = max(1, sup_i K_O(f|U_i))` | `M = ∅`, empty cover; `M = ∅`, cover `{∅}`; shear `(x, y + x³/3)`, cover `{|x| < k}`; `z²` on `ℂ`, three half-planes; fold, cover `{x₁ < 1}, {x₁ > −1}` | `1 = max(1, 0)`; `1 = max(1, 1)`; `((k² + √(k⁴+4))/2)² → ∞ = K_O`; `1 = 1`; `∞` (`q_O = ∞` on `x₁ < 0` inside `{x₁ > −1}`) `= ∞` | holds; bare sup fails only at the empty cover | F01 |
| §6.1 local bi-Lipschitz | inscribed triangle on `S¹`, edge `p(t) = (1−t)v₀ + t v₁`; `t ↦ t²` on `[0, 1]`; affine triangulation of `ℝ`; a vertex `x` of `σ` | `|p|² = 1 − 3t + 3t² ∈ [1/4, 1]`, `dθ/dt = (√3/2)/|p|² ∈ [√3/2, 2√3]`, arc `2π/3` misses each antipode (chart source `{−v}ᶜ`, Mathlib `chartAt v := stereographic' n (−v)`); `|y² − z²| / |y − z| = y + z → 0` at `0`, lower bound fails; `c = C`; convex `σ ∩ B(x, r)`, `y − z` sum-zero, bound `c₀/2` | holds for `C¹` triangulations; fails exactly where the differential is not injective | F02 |
| §6.1 route, lower bound | `|A(x)v| ≥ c₀|v|` on sum-zero `v`, `‖A(y) − A(x)‖ ≤ c₀/2` | `|φκy − φκz| ≥ |A(x)(y−z)| − (c₀/2)|y−z| ≥ (c₀/2)|y−z|` | holds | F02 |
| §6.3 gluing lemma, finitely many closed pieces | `[a, b] = C₁ ∪ … ∪ C_k`, `t = max(C₁ ∩ [a, b])` | `|f(t) − f(a)| ≤ L(t − a)`, `t ∈ C₂ ∪ … ∪ C_k` by closedness, induction on `k` gives `≤ L(b − a)` | holds without assuming connected pieces | none |
| §7.6 without `N` closed | `T = N = ℝ²`, grid with diagonals, `s = π = id`; `T = N = T²`, doubling; `n = 1`, `T = N = ℝ`, integer triangulation | `K_π = K_p = 1`, `id` non-constant, `1`-QR; `K = 2`; `K = 1` | holds | F03 |
| Summary §6.4 bullet | compact source; strip map of §6.4 | finitely many `n`-simplices, `K_p < ∞`; `K_p = ∞`, excluded by "bounded simplexwise distortion" | matches §6.4 | F03 pattern |
| §7.4 discrete-fibre step | `q` the doubling of `T²`; inclusion `ℂ ∖ {0} → ℂ` | fibres `2` points and `1` point, discrete; a connected `f(ℝⁿ)` inside one fibre is a point | holds | F04 |
| §7.2 non-constancy | `f` non-constant, `R` a bijection | `f ∘ R` constant would force `f = (f ∘ R) ∘ R⁻¹` constant | holds | F04 pattern |

## Checks

- Dependency check (gate), after the edits:

  ```
  candidate: QuasiregularMaps is not in the merge order yet; checked as if placed after TeichmullerGeometry (the intake inserts it when its design is accepted)
  depcheck: 240 roadmaps, 2354 edges, 0 problem(s)
  ```

  No UPWARD or CYCLE line. The output is the same before and after the edits.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
  The tool did not check names outside TauCetiRoadmap. I checked the new Mathlib names by hand
  at the pin: `extChartAt` (`Mathlib/Geometry/Manifold/IsManifold/ExtChartAt.lean`, top level),
  `Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le` and
  `Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le'`
  (`Mathlib/Analysis/Calculus/MeanValue.lean`, namespace `Convex`).
- `sources check` on `packages/QuasiregularMaps/sources.toml`: 0 problems.
- `plan.json` parses, and its formatting round-trips unchanged.
- `Suggested.lean`: none at the design stage. No Lean declaration changed, so the `#check @name`
  elaboration step does not apply.

## Ownership and overlaps

- Ownership by object: `roadmaps grep` finds no statement on bi-Lipschitz simplices or
  triangulations on main or in any open roadmap pull request. The local bi-Lipschitz fact stays
  owned here, in §6.1, as before.
- Overlap lead from `scratch/overlaps.md`: the Downstream consumers line on Part III cites
  "DifferentialGeometry Layers 6–9". That id is correct on main. The open revision of
  DifferentialGeometry (#886) drops Layers 6–11 and assigns de Rham cohomology, the de Rham
  theorem and Poincaré duality to DeRhamCohomologyAndDuality. But DeRhamCohomologyAndDuality at
  the head of its own open pull request (#1768) imports exactly these from DifferentialGeometry
  Layers 6–9 and does not plan them. At the heads, each hands the object to the other, so it has
  no owner there. Citing either head's numbering would not fix the citation, and stating de Rham
  cohomology here would be out of scope. The line describes a later roadmap's needs, not a
  supplier of this one. I left it unchanged. The maintainer should settle that ownership between
  those two pull requests; this line then follows whichever merges.
- No suspicious instructions were found in the review text.

## For the maintainer

- No name that another roadmap cites has changed. The section numbers are unchanged.
- §7.6 is now more general (no closed `N`). Any consumer that relied on the extra hypothesis is
  unaffected, since a closed `N` is still covered.
