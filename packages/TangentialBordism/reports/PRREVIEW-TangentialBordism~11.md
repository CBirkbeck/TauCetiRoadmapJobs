# Review of TangentialBordism (pull request #942 at 1d3ca3f)

**Verdict:** needs changes

This is an incremental re-review of the 100 README lines that changed since f315ecb, which PRREVIEW-TangentialBordism~10 read. `Suggested.lean` and `metadata.toml` are byte-identical to f315ecb, and nothing outside the folder changed.

- The repair of ~10 R01 is correct. Every pinned orientation operation the README now cites exists at the Tau Ceti pin (2fd255d9) under the name, in the file and with the hypotheses the README states.
- The repair also added one sentence identifying AlgebraicTopology 6.3's local point generator with the pinned `TauCeti.localOrientationOfManifoldOrientation`. That identity is false in dimension one: the two generators differ by −1 (R01).
- The two revision-naming findings (~10 R02, R03) are not repaired, because the pull request description is unchanged.

## R01 (P1) — 2.2 (B1.1) identifies AlgebraicTopology 6.3's point generator with the pinned one, but in dimension one they have opposite signs

**Location.** `TauCetiRoadmap/TangentialBordism/README.md:501–505` (2.2, B1.1): "AlgebraicTopology 6.3's comparison with the integral homological orientation system, whose pointwise generator on a boundaryless manifold modelled on a real inner-product space of positive dimension is the pinned `TauCeti.localOrientationOfManifoldOrientation`".

**Claim.** For a smooth orientation, the local generator of H_m(M, M∖{x}; ℤ) that AlgebraicTopology 6.3's comparison selects equals the pinned one.

**Witness.** On ℝ with the standard orientation, at x = 0, the pinned generator has connecting-map image [−1]−[1]. AlgebraicTopology 6.3's generator is the segment [−1,1], whose boundary is [1]−[−1] (head of #1652, `README.md:2280–2282`).

**How to check.** Take M = ℝ with the identity chart, and δ the connecting map to H̃₀(ℝ∖{0}).

- **The pinned generator** is computed from definitions at the pin:
  - It is `(singularHomologyComplSingletonIsoOfOrientation …).inv 1`, built from the chart isomorphism, the reduced connecting map and radial projection (`Chart.lean:168`, `LocalHomology/Basic.lean:170`).
  - On S⁰ the native generator is `[-b 0] − [b 0]` (`Sphere.lean:498`).
  - δ sends the increasing simplex to [end] − [start] (`IntervalGenerator.lean:125`).
  - So the pinned generator has δ-image [−1] − [1], and equals −[segment −1→1].
  - The pin's analogue on the interval is `singularHomologyCubeBoundaryPairIso_one_inv` (`IntervalGenerator.lean:295`), which gives −cubeRelClass.
- **AlgebraicTopology 6.3** (head of #1652, `README.md:2280–2282`; the same normalisation is on main at `:1262`) fixes the m = 1 generator as the segment [−1,1], with boundary [1] − [−1]. Its comparison (`:2045–2046`) takes the signed image of this simplex.

The two generators have opposite signs. AlgebraicTopology 6.3 itself treats native generators as differing from its classes by units to be computed (σₙ = (−1)ⁿaₙ, `:2238–2242`).

**Repair.**
1. At `:501–505`, replace the identification with: "and compare AlgebraicTopology 6.3's ordered-simplex point generator with the pinned `TauCeti.localOrientationOfManifoldOrientation` on boundaryless manifolds modelled on a real inner-product space of dimension m≥1. They differ by a sign u_m∈{±1}, which B1.1 computes in every dimension, using AlgebraicTopology 6.3's comparison units; u₁ = −1."
2. Add a Check to 2.2: "On ℝ with the increasing orientation, the pinned generator at 0 has connecting-map image [−1]−[1], while AlgebraicTopology 6.3's segment [−1,1] has [1]−[−1]. Identifying them without u₁ reverses the fundamental class of every oriented 1-manifold."
3. In From Tau Ceti (`:222–223`), where the README says "the pin does not prove that these generators form a homological orientation", name the pinned carrier `TauCeti.HomologicalOrientation` (`TauCeti/AlgebraicTopology/Singular/LocalHomology/Orientation/Homological.lean:75`).

**Test on the instance.** With u₁ = −1, the pinned generator −[segment] is u₁ times AlgebraicTopology 6.3's +[segment], so it agrees with both sides of the witness. Its δ-images are [−1]−[1] and [1]−[−1].

## R02 (P3) — AlgebraicTopology 8.13 is defined only at open revision #1663, which the pull request still does not name

**Location.**
- `README.md:231`: "Layers2–4,6,8 and 8.13".
- `:75`: "AlgebraicTopology 8.13's".
- `:376`, `:400`, `:411`, `:433`, `:474`, `:776` and `:2851`.
- The pull request description: "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1652".

**Claim.** The cited layer numbering, 8.13 included, is defined by the named revision.

**Witness.**
- AlgebraicTopology on main (eaf17b1) has no "8.13".
- The head of #1652 (c686921) has none either.
- 8.13 exists only at the head of #1663 (8029fe9), at `README.md:68` and `:2704`, which uses "Stage" headings.

**Repair.**
- Name #1663 beside #1652 in the revision-dependencies paragraph, and say which of the two merges first.
- The other is rebased on it, so that one head carries both "Layer 8" and "8.13".
- No README change is needed.

## R03 (P3) — DifferentialGeometry 5.5b is defined only at open revision #886, which the pull request still does not name

**Location.**
- `README.md:232`: "5.5b's smooth face structure and face-indexed abstract boundary … with the outward-first orientation of its sheets and the product boundary sign".
- `:539`: "DifferentialGeometry 5.5b's".
- `:326`, `:361`, `:441`, `:474`, `:486`, `:585`, `:684` and `:776`.
- The same description paragraph, which names only #1652.

**Claim.** DifferentialGeometry 5.5b is a citable supplier section.

**Witness.**
- DifferentialGeometry on main (eaf17b1) has no "5.5b" (0 hits).
- At the head of #886 (a565de6) it is defined at `README.md:850`, and its orientation clauses are at `:914–924`.
- `overlaps.md` lists "DifferentialGeometry §5.5b … #886 … must merge first".

**Repair.** Name #886 in the revision-dependencies paragraph. No README change is needed.

## Previous findings

- R01 — repaired:
  - From Tau Ceti `:182–223` now cites `Manifold.Orientation.neg`, `pullback`, `prod`, `boundaryOrientation` (with `_spec` and `_neg`), `interval` and its endpoint lemmas.
  - 2.2 (`:527–535`) consumes them, and *Needs:* `:585` and the DifferentialGeometry row `:232` list them.
  - The repair introduced R01 above.
- R02 — not repaired (now R02): the description still reads "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1652", and `:231` still cites "Layers2–4,6,8 and 8.13".
- R03 — not repaired (now R03): the same paragraph names only #1652, and `:232` and `:539` now cite 5.5b's sheet orientations and product boundary sign as well.

## Verified sound

### Gate, dependency direction, outside-folder diff, elaboration

- **Gate.** Rerun at 1d3ca3f with `--base origin/main`:

  ```text
  gate TangentialBordism: set_option=0 … statement-hygiene=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

  Exit 0. The worker's record adds `build=0`.
- **Dependency check** with `--movable`:

  ```text
  depcheck: 239 roadmaps, 2427 edges, 0 problem(s)
  ```

  There is no UPWARD or CYCLE line.
- **Folder and outside-folder diff.** The folder holds `README.md`, `Suggested.lean` and `metadata.toml`. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Elaboration.** I elaborated a scratch copy of `Suggested.lean` with `#check @…` appended for both declarations (`lake env lean`, exit 0). The only diagnostics were the two `sorry` warnings.
  - Both elaborated types are identical to the worker's signature file and to ~10's record.
  - No section binder was lost.
- **Padding probe.** I carried it forward from ~9 and ~10 because the file is byte-identical: both theorems survive the one-tactic probe.

### Pinned declarations opened this round

Tau Ceti 2fd255d9. I built `Orientation.Interval`, `LocalHomology.Orientation.Chart` and `IntervalGenerator` with `lake build` (unpacked from the cache). Two scratch files of `#check`s then elaborated every name below.

- **Reversal.** `Manifold.Orientation.neg` (`Geometry/Manifold/Orientation/Basic.lean:97`) and `orientationAt_neg` (`:157`), which gives `orientationAt (-o) x = -orientationAt o x`.
- **Pullback.** `pullback` (`Orientation/Pullback.lean:173`), with hypotheses `ContMDiff I I' 1 f`, `∀ x, (mfderiv … f x).IsInvertible` and `Fintype.card ι = finrank ℝ E` (source model).
  - `eq_pullback_iff` (`:212`): the pullback is the unique orientation preserved at every point.
  - `IsOrientationPreservingAt` (`Orientation/Preserving.lean:63`).
  - This is as `:186–193` says.
- **Product.** `prod` and `orientationAt_prod` (`Orientation/Prod.lean:112`, `:131`), with the first factor before the second, as at `:194–197`.
- **Boundary orientation.** `boundaryOrientation` (`Boundary/InducedOrientation.lean:108`) on `(𝓡∂ (n+1)).boundary M` for every n.
  - `boundaryOrientation_spec` (`:145`) is an iff: (outward, b) is oriented exactly when b is.
  - `boundaryOrientation_neg` (`:177`).
  - `orientationAt_boundaryOrientation_model` (`:188`): the standard half-space induces −basisFun on its boundary.
  - This is as at `:197–205`.
- **Interval.** `Manifold.Orientation.interval` (`Orientation/Interval.lean:62`), with signs +1 in left charts and −1 in right charts. The endpoint lemmas (`:153`, `:163`) give −basisFun(Fin 0) at ⊥ and +basisFun(Fin 0) at ⊤, as at `:205–210` and `:562–565`.
- **Oriented atlas.** `IsOrientedAtlas.orientation` (`Orientation/Atlas.lean:145`), including boundary and corner points. The module docstring says the converse is not proved. A grep of the pin for an orientation-to-atlas theorem finds only the `HasGroupoid` instances, which supports "the converse … is not at the pin" (`:214–215`).
- **Local orientation.** `localOrientationOfManifoldOrientation` (`AlgebraicTopology/Singular/LocalHomology/Orientation/Chart.lean:202`): `ChartedSpace E M`, `IsManifold 𝓘(ℝ, E) 1 M`, `T2Space M`, finrank E = n+1, values in `LocalOrientation M x (n+1)` (`Orientation/Basic.lean:53`), and `_neg` (`:227`). This is as at `:215–222`. Its sign normalisation is R01.
- **Homological orientation.** `TauCeti.HomologicalOrientation` (`Orientation/Homological.lean:75`): there is no declaration at the pin that relates it to `Manifold.Orientation`, so `:222–223` is accurate.

### Cross-roadmap citations resolved

- **AlgebraicTopology 6.3** (`:231`, `:501`, `:585`, `:776`) resolves at the head of #1652 (named in the description):
  - "### 6.3 Homological orientation and fundamental classes" (`README.md:1936`), which owns the comparison with `Manifold.Orientation` (`:2045`).
  - Main has the same content as "Stage 6.3" (`:76`, `:1262`).
- **DifferentialGeometry 2.2 on main** (`README.md:352–356`) plans orientation-preserving maps, pullback and product orientations, and the oriented-atlas criterion for boundaryless M. This matches the reworded row at `:232`, which consumes only the orientation-to-atlas direction from 2.2 and the rest from the pin.
  - No roadmap on main or at an open head owns the half-space or corner case in dimension ≥ 2. I searched the open roadmap index for "oriented-atlas criterion".
  - B1.1 therefore owns that case, as `:541–545` says.
- **DifferentialGeometry 5.5b** (head of #886, `:914–924`) states three things:
  - outward-first sheet orientations;
  - facet coefficient (−1)^(i+1) on Q^n;
  - opposite orientations of the two lifts at a codimension-two corner, and the product boundary sign (−1)^m on M×∂̃N.

  This supports `:232` and `:536–541`. That the section is open only at #886 is R03.
- **Citation resolver.** The worker's resolver found no unresolved citation or Lean name.

### Seeded sample, where it meets the change

- **2.2 (B1.1)** is the changed passage. It carries no external source locator: its claims rest on the pinned declarations above and on DifferentialGeometry 2.1, 2.2 and 5.5b and AlgebraicTopology 6.3. All of these were checked, and R01 is the one defect.
- **2.4 (B1.2) and 2.5 (B1.3)** depend on the witness boundary convention. Their Checks (`:659`, `:681`) agree with the pinned endpoint lemmas and with the new cylinder Check; the computation is below.
- **2.3, 2.7, 3.4, 4.1, 4.3, 4.4, 5.2, 5.5, 6.2, 7.1, 9.1, 9.2 and 9.3** are untouched by the diff. Their locator checks are carried from earlier rounds (~9 and ~10, and ~7 for 2.7, 3.4, 9.2 and 9.3).

### Ownership and overlaps

- **Overlap scan.** `overlaps.md` lists five items:
  - DifferentialGeometry 5.5b at #886: R03.
  - AlgebraicTopology Layers 2, 4, 6 and 8 at #1652: named.
- **Other changes to this roadmap.** No open pull request changes TangentialBordism or drops an id this README cites.
- **Ownership.**
  - The diff moves reversal, pullback, product and boundary orientation from "construct" to "consume from the pin", and adds no new owned object.
  - The corner-face identification and the half-space or corner atlas converse in dimension ≥ 2 stay with B1.1, with no other owner found.
- **Unchecked pull requests.** Ownership against open pull requests whose files the brief does not supply was not checked.

### Adversarial mathematics table

Rows marked "new" were computed this round. Rows marked "~10" or "~7" carry values from those reports for passages the diff leaves untouched.

| Statement / target | Instances tried | Values computed on both sides | Result / change |
| --- | --- | --- | --- |
| `:107–108` convention: outward-first = pinned `boundaryOrientation` | half-space ℝ², standard (e₀,e₁) | (−e₀, v) positive iff v = −e₁, det(−e₀,−e₁) = +1; pin `orientationAt_boundaryOrientation_model`: −basisFun | Pass, new |
| From Tau Ceti `neg`, `orientationAt_neg` | `interval 0 1` at 1/2; endpoints | +ray ↦ −ray; endpoint signs (−1,+1) ↦ (+1,−1) via `boundaryOrientation_neg` | Pass, new |
| From Tau Ceti `pullback`, `eq_pullback_iff` | f = id on [0,1]; f(t) = 1−t; M = ∅ | id: derivative 1, pullback = interval; 1−t: derivative −1 everywhere, pullback = −interval, endpoints (+1,−1); ∅: `hι` not implied (pin docstring), README keeps the cardinality hypothesis | Pass, new |
| From Tau Ceti `prod`, `orientationAt_prod` | [0,1]×[0,1]; Fin 0 × Fin 1 | ordered (e₁,e₂), swap det −1 (Check `:582`); 0-dim factor: Fin(0+1), det +1 | Pass, new |
| From Tau Ceti interval endpoint lemmas | a = 0, b = 1 | ⊥: −basisFun(Fin 0), σ = −1; ⊤: +basisFun(Fin 0), σ = +1; README ∂[0,1] = [1]−[0] (`:562`) | Pass, new |
| From Tau Ceti `IsOrientedAtlas.orientation`, converse absent | ℝ with {id}; [0,1] | {id} gives standard orientation; [0,1]: transition derivative −1, no oriented atlas, yet `interval` exists, so converse fails in dim 1 with boundary | Pass, new |
| 2.2 `:501–505` pinned generator vs AT 6.3 | ℝ, chart id, standard orientation, x = 0 | pin: δ-image [−1]−[1], generator −[segment −1→1]; AT 6.3 (#1652 `:2280–2282`): +[segment], δ-image [1]−[−1] | **Fail: R01** |
| From Tau Ceti `localOrientationOfManifoldOrientation_neg` | same, −o | δ-image [1]−[−1] = −([−1]−[1]) | Pass, new |
| 2.2 cylinder Check `:583` | I×[0,1], orientation (e_t,e_s) | t=1: det(e_t,e_s) = +1, +e_s; t=0: det(−e_t,−e_s) = +1, −e_s; s=0: det(−e_s,e_t) = +1, +e_t; s=1: det(e_s,−e_t) = +1, −e_t; I×([1]−[0]) gives +e_t at s=1, −e_t at s=0, so faces = −product = (−1)^1; reversed: +[0,1] at t=0, −[0,1] at t=1; inward-first flips t-ends | Pass, new |
| 2.2 / DG 5.5b facet coefficients | Q² facets i=0 (t=0), i=1 (s=0) | (−1)^(0+1) = −1, so −e_s; (−1)^(1+1) = +1, so +e_t; both equal the Check's faces | Pass, new |
| 2.2 / DG 5.5b corner lifts | corner (0,0) of the cylinder | end of facet t=0 (oriented −e_s, outward −e_s): +1; end of facet s=0 (oriented +e_t, outward −e_t): −1; opposite | Pass, new |
| 2.2 atlas converse, dim ≥ 2 vs DG 2.2 | ℝ² half-space; quadrant; [0,1] | reflection (x₀,x₁) ↦ (x₀,−x₁) det −1; coordinate swap det −1; [0,1] excluded (dim 1) | Pass, new + ~10 |
| From Tau Ceti `Manifold.Orientation` flip quotient | lift l vs l.flip; ∅; [0,1] | mk l = mk l.flip; ∅: 1 class; [0,1]: 2 classes | Pass, ~10 |
| From Tau Ceti `Orientable` vs oriented atlas | [0,1] on 𝓡∂1 | sign products (+1)(−1)(−1) = +1 > 0, orientable; no oriented atlas | Pass, ~10 |
| From Tau Ceti `orientable_closedBall` | n = 1, 2, 0 | [−1,1] orientable; disc orientable; `NeZero 0` fails | Pass, ~10 |
| 2.1 Sard target: degenerate data | M = ∅; pt → ℝ²; dim N = 0; dim M < dim N | image ∅; one point null; no critical point; flat theorem with (dim M)²+1 | Pass, ~10 |
| 2.1 Sard stratum reduction | f(t) = t², t on [0,∞) | critical at 0; t regular for f, critical for 0-dim stratum | Pass, ~10 |
| 2.1 parametric projection | M = pt, S = N = ℝ², Z = {0} | bad parameters {0}, null | Pass, ~10 |
| `exists_contMDiff_homotopicRel` (headline) | M = ∅; C = U = ∅; C = M; P = pt | empty g; Whitney approximation; g = f; g = f | Pass, ~10 |
| 2.1 relative transversality | β = ψ² | dβ = 0 on ψ = 0; affine on β > 0 | Pass, ~10 |
| 2.2 dimension-zero signs | two point rays; product swap | ±1 on the same empty basis; det −1 (1,1), +1 with a 0-dim factor | Pass, ~10 |
| 2.3 relative triangulation | [0,1], D², ∅ | two vertices + edge; cone on triangle; empty | Pass, ~10 |
| 2.4 Check: gluing positive intervals | [0,1] ∪ [1,2] | +1 and −1 at 1 cancel; [0,2]: (−1,+1), total 0 | Pass, ~10 |
| 2.5 Check: relative interval | ([0,1],{0,1}) | (−1,+1) ∈ ℤ², nonzero | Pass, ~10 |
| 2.7 quartic / reversal / E(1) | degree 4; F = 3H−ΣE_i | χ = 24, p₁ = −48, σ = −16, Â = 2; reversed +48, +16, −2; F² = 0, χ = 12, σ = −8 | Pass, ~7 |
| Gap: Arf laws | V = 0, H, A, H⊕H, H⊕A, A⊕A | Gauss sums 1, 2, −2, 4, −4, 4 | Pass, ~10 |
| 3.1 inverses / 3.2 interchange sign | O points; SO points; two 1-dim factors | 1+1 = 0; +1−1 = 0; (−1)^(1·1) = −1 | Pass, ~10 |
| 3.4 orientation map | pt, ∅, points over x,y | 1, 0, (1,0), (0,1) | Pass, ~7 |
| 4.1–4.4 operations | a ∈ H¹(RP∞); RP²; p = 3 | Sq¹a = a², Sq²a² = a⁴; w(RP²) = 1+a+a²; P¹y = y³ | Pass, ~10 |
| 5.1–5.2 collapse / labelled points | framed point; aba⁻¹b⁻¹ | degrees ±1; abelianised (0,0) | Pass, ~10 |
| 5.5 framed degrees | +pt; reversed; ∅; interval | +1; −1; 0; 0 | Pass, ~10 |
| 5.6 graph-embedding ranks | (0,1,1), (2,2,5), (1,3,3) | normal ranks 2, 5, 5 | Pass, ~10 |
| 5.7 AHSS | pt; two components | E² = Ω_q at p = 0; Ω₀⊕Ω₀; `hatcherSS line 1010` | Pass, ~10 |
| 6.2–6.3 numbers | id S¹; RP²; H_ℝ(2,4) | 0 vs 1; w₁² = w₂ = 1; binom(6,2) = 15 ≡ 1 | Pass, ~10 |
| 6.6 Wall derivations | σ₄; Y₆Y₅ | ∂₂σ₄ = σ₂; Y₅² ≠ 0 | Pass, ~10 |
| 7.1–7.2 ABS, K3 | +pt; K3 | 1; Â = 2, σ/16 = −1 | Pass, ~10 |
| 8.1 quadratic refinement | Lie torus; S² | Arf 1; Arf 0 | Pass, ~10 |
| `orientedThreeManifold_parallelization` (headline, 8.4) | ∅; ℝ³; half-space; negated e₁ | vacuous; det 1; det 1; det −1 excluded; dim 3 ≥ 2, so the atlas converse of 2.2 applies | Pass, ~10 |
| 8.5 projective fillings | n = 1, 2; Hopf chart | S¹ = ∂D²; (−1)(−1) = +1 | Pass, ~10 |
| 9.1 idempotent charts | (1,0,0), (1,1,0); zero matrix | trace 1; trace 0 excluded | Pass, ~10 |
| 9.2 Clifford relations / volume | nine generators; flip C₈ | 2δI₁₆; −I₁₆ vs +I₁₆ | Pass, ~7 |
| 9.3 normal Bott / OP² data | OP¹ ⊂ OP²; p₂ = 6u, p₄ = 39u² | e(ν) = u, ∫u = 1; (381·39−19·36)/14175 = 1 | Pass, ~7 |
| 9.4 Pontryagin classes of HP^k | k = 1, 2 | 1+2u+7u², (49−4)/45 = 1 | Pass, ~10 |
| 10.1–10.4 realization, transfers | C₃; HP² Gysin; KS numbers | ker(3) = 0; π!u₄² = 1; gcd 28 | Pass, ~10 |

Every row passes except the R01 row.

## Not verifiable

- **Lee, *Introduction to Smooth Manifolds*** (Springer, paywalled), Proposition 15.6. DifferentialGeometry 2.2 cites it for the oriented-atlas criterion that `:232` and `:541–545` rely on. I relied on DifferentialGeometry's own statement and the pinned declarations, not the text.
- **Munkres, Atiyah–Bott–Shapiro, Anderson–Brown–Peterson, Milnor 1960, McCleary, Stong, Gompf–Stipsicz, Stolz 1992:** cited by locator alone. These are untouched by the diff and unchanged since ~9.
- **AlgebraicTopology 8.13 and DifferentialGeometry 5.5b** exist only at open heads (#1663, #886): R02 and R03.

## Source issues

- none
