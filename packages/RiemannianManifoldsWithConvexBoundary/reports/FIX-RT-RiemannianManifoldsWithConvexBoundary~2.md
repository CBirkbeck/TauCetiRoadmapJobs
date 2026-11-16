# FIX-RT-RiemannianManifoldsWithConvexBoundary~2

Eight findings were raised by two red-team passes. None of them overlapped, so each is settled
below on its own. Every pinned name cited here was opened at the pin and, where its module is
built, checked by `#check`.

## RT-RiemannianManifoldsWithConvexBoundary~2a/F01 (P3) — applied differently

6.4: "`d(p, ·) = |z|` (HopfRinow Layer 2)" and "(HopfRinow Layer 2's local distance identity)" →
full-radius Tau Ceti `IsNormalDomain.edist_riemannianExp_eq_of_mem_ball` and
`IsNormalDomain.image_riemannianExp_ball`, which states the image identity directly. It replaces
the reviewer's `edist_eq_ofReal_add_infEDist`, from which it is proved. The names are added to the
contracts, `*Needs:*` and Dependencies.

## RT-RiemannianManifoldsWithConvexBoundary~2b/F01 (P2) — applied

3.1: "prove Levi-Civita compatibility" → `j` is a `TauCeti.IsLocalRiemannianIsometry` (via
`pullback_inner`). `mfderiv_leviCivitaConnection_mpullback` and `hessian_comp` are consumed; only
the gradient identity remains. `IsLeviCivitaConnection.uniqueness` is dropped. The Conventions name
`TauCeti.RiemannianIsometry` as the carrier of "isometry". 4.1 shows realisation independence via
`isGeodesicCurveOn(From)_comp_iff`.

## RT-RiemannianManifoldsWithConvexBoundary~2b/F02 (P3) — applied

5.3 route: "IFT, Hadamard factorisation, inverse function theorem for `r = sF^{1/2}`" → "IFT gives
`g`. `k(y, s) = h(s + g(y), y)`, cut off, then `TauCeti.exists_parametric_morse_chart` gives
`k = k(y, 0) − cϑ²`. Then `a`, `Q` and `∂_r Q > 0`." The route also fixes the sign of `∂_s ϑ`,
which the reviewer's text left open. Cited in `*Needs:*`, contracts and Dependencies.

## RT-RiemannianManifoldsWithConvexBoundary~2b/F03 (P3) — applied

The GeometricTopology contract and 3.3 (twice): "the linear reordering `(y, t) ↦ (t, y)`" → Tau
Ceti `TauCeti.EuclideanHalfSpace.collarDiffeomorph` (`(𝓡 n).prod (𝓡∂ 1)` → `𝓡∂ (n+1)`, normal
coordinate in slot `0`, `Boundary/Collar/Basic.lean:92`). Added to "From Tau Ceti", 3.3's
`*Needs:*` and the Layer 3 Dependencies.

## RT-RiemannianManifoldsWithConvexBoundary~2b/F04 (P2) — applied

5.4: "`μ/τ̃` … extends to a smooth positive function on `∂SM` whose value at …" (this shares 11 words
with `paternain-salo-uhlmann2023` lines 2936–2937) → "On `∂SM ∖ ∂₀SM`, where `μ` and `τ̃` have the
same sign, `μ/τ̃` is the restriction of a smooth function on `∂SM` that is everywhere positive and
equals `II_q(u, u)/2` at glancing `(q, dι u)`." 5.3's opening clause was also reworded (pattern
scan, below).

## RT-RiemannianManifoldsWithConvexBoundary~2b/F05 (P3) — applied

Three Checks were added to 5.6:

- disc at `(0, −1)`, `w = (c, 0)`: `L = (y, (c(2c² − 1), 2c²√(1 − c²)))`, of norm `|c|`;
  `ℓ(c = 0) = 2`, `ℓ(|c| = 1) = 0`; lifting through `∂₋SM` gives `ℓ ≡ 0`;
- `[a, b]`: `L` swaps the zero vectors, and `ℓ = b − a`;
- ball of radius `R`: `ℓ = 2R√(1 − |w|²)`.

## RT-RiemannianManifoldsWithConvexBoundary~2b/F06 (P3) — applied

4.5: "There are (`exists_convexityFunction`) an open `U` …" → "There is (`exists_convexityFunction`)
a convexity function at `q` for `ρ`, by which this roadmap means an open `U` …". The Conventions
point to 4.5, and the Lean docstring says the same. New non-example Check: `x̃ = −ρ` on
`U = B(q, 1/2)` in the disc fails only compactness.

## RT-RiemannianManifoldsWithConvexBoundary~2b/F07 (P3) — applied

4.3 and 4.4: "Ch. 5–6" → "Ch. 5, 'Tubular Neighborhoods and Fermi Coordinates', pp. 133–136, and
Ch. 6 for the Gauss lemma". 6.4: "Ch. 6" → "Ch. 6, Lemma 6.16 and Theorem 6.17". References and
`sources.toml` are updated. The locators are those Surfaces and SmoothBundlesConnections carry on
main; the source stays uncertified. The Ch. 7–8 locators keep chapter level: no corroborated exact
locator exists for them.

## Verification of the witnesses

- 2a/F01: `Completed/HopfRinow/README.md` lines 440–443 shrink the ball. The pinned
  `Gauss/Distance.lean:151` and `:251` hold at full radius on a boundaryless base, for
  `[EMetricSpace M] [IsRiemannianManifold I M]`.
- 2b/F01:
  - `Isometry/LeviCivita.lean:130`, `Hessian/Isometry.lean:45` and `Isometry/Geodesic.lean:92`,
    `:115` are stated for an arbitrary `ModelWithCorners`, with `IsManifold I 2` and `C¹` metrics.
  - `pullback_inner` (`Pullback/Basic.lean:193`) is `rfl`.
  - `IsLocalRiemannianIsometry` (`Isometry/Local.lean:70`) has three fields: `contMDiff`,
    `isInvertible_mfderiv`, `inner_mfderiv`.
- 2b/F02: `Morse/Parametric.lean:100` needs global `ContDiff ℝ (n+2) f` (hence the cutoff), a
  critical zero section near `a`, an invertible fibre Hessian at `(a, 0)`, and complete `P` and `E`.
- 2b/F04: the source sentence was opened at lines 2935–2939.
- 2b/F06: none of the three cached texts names the function.
- 2b/F07: Surfaces README line 308 and SmoothBundlesConnections README line 1325 carry these
  locators on main.
- Pattern scan for F04:
  - 7- and 9-word runs of the README and `Suggested.lean` were compared with all three cached
    texts.
  - Beyond the repaired sentence, the only shared runs are the term "strictly concave from the
    superlevel sets", formula fragments, bibliography titles, and the 5.3 hypothesis clause, now
    reworded.
  - `Suggested.lean` has no shared run of 9 or more words.

## Checks run

- **Elaboration.** `lake env lean packages/RiemannianManifoldsWithConvexBoundary/Suggested.lean`
  (from the content checkout): 11 `declaration uses 'sorry'` warnings (lines 113, 150, 179, 190,
  214, 280, 296, 313, 328, 349, 367), no errors, no other messages.
- **Signatures.** One scratch file holds `Suggested.lean` plus `#check @name` for all 22
  declarations and for the 11 newly cited pinned names. It elaborated with 0 errors.
  - Each of the 22 elaborated types was compared with its README statement; they are the same as
    in the worker's signature file. The only change to the Lean file is one docstring.
  - The `IsManifold` binder dropped from `IsBoundaryDefiningFunctionOn` is unused by its fields,
    so it was left as is.
- **Dependency check.** `depcheck: 254 roadmaps, 2401 edges, 0 problem(s)`: no UPWARD, CYCLE or
  `moved:` line.
- **`roadmaps resolve` on the README.** Nothing was found unresolved.
- **Gate failures.** None were listed.

## Adversarial pass on changed statements

| Statement | Instances | Values | Result |
|---|---|---|---|
| 3.1 `hessian_comp` consumption | unit ball `f = 1 − \|x\|²`; half-space `f = x⁰`; `n = 0`, `[−1, 1]` | `Hess^D = Hess^N = −2g`, so `II = 2h/2 = h`; `0 = 0`; `−2 = −2` | agrees with 1.4 |
| 3.1 gradient identity | ball `f = 1 − \|x\|²` | `grad^N f = −2x`; `dj grad^D(f ∘ j) = −2x` at boundary points | holds |
| isometry carrier | `x ↦ 2x` from `(B₁, 4g)` to `(B₂, g)`; the same map with `g` on both sides | `⟨2v, 2w⟩ = ⟨v, w⟩_{4g}`; inner product scaled by 4 | isometry; not an isometry |
| 4.1 realisation | disc in `ℝ²` and in its double `S²` | the chord from `(0, −1)` with velocity `(0, 1)` has `τ = 2` in both | independent of the realisation |
| 6.4 image identity | flat torus `r = 1/2`; `S^{n+1}`, `r = π`; `S¹`; `r ≤ 0` | `B(p, 1/2)`; `S^{n+1} ∖ {−p}`; `S¹ ∖ {−p}`; `∅ = eball p 0` | holds |
| 5.3 route | `y − t²`; `y + 2ty − t²`; `y − t⁴`; `K = 0` | `Q = r`, `a = y`; `g = y`, `k = y + y² − s²`, `Q = y + r`, roots `y ± √(y² + y)`; vertical Hessian `0`, lemma does not apply; base `ℝ⁰` | holds |
| 5.4 `μ/τ̃` | disc; ball of radius `R` | `sin θ/(2 sin θ) = 1/2`, same sign on `θ ∈ (0, π)` and `(−π, 0)`; `1/(2R) = II/2` | holds |
| 5.6 lens data | disc `c = 0, ±1`; `[a, b]`; ball of radius `R` | values as in F05 | holds |
| 4.5 definition | disc `x̃ = −ρ − ε\|z − q\|²`; `x̃ = −ρ` | `K_c ⊆ {\|z − q\|² ≤ c/ε}`, compact; `K₀` an open arc | example; non-example |
| collar model | `n = 0`; `n = 1` | identity of `[0, ∞)`; `(y, t) ↦ (t, y)`, `x⁰ = t` | holds |

## For the maintainer

- No name of this roadmap changed, and no section, layer or id was renumbered.
- No new targets were added beyond the gradient bullet that 3.1 keeps.
- Ownership against open pull requests is unchanged: every new citation is a pinned Tau Ceti or
  Mathlib declaration.
- No supplier gap is declared (`gaps = []`). None is needed.
- No text in either review was an instruction.
