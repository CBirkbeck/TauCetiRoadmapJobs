# FIX-PKG-DimerModelsAndLozengeTilings~6

Repair of the one finding of `REV-PKG-DimerModelsAndLozengeTilings~5` (P3). File changed:
`packages/DimerModelsAndLozengeTilings/README.md`, the "Angles" bullet of the 9.1 API (one clause
deleted, the bullet reflowed to keep its lines short). `Suggested.lean`, `sources.toml`,
`metadata.toml` and `design/plan.json` are unchanged.

## F01 (P3) — applied

The review is right on both counts. (i) As mathematics, the gloss said the density *is* the angle,
dropping the factor `1/π`: at `w = (1,1,1)` the angle is `π/3 ≈ 1.047`, while the density is
`1/3`, as the same bullet's formulas `w_kG_w(·) = θ_k/π` and the first Check of 9.1 say. (ii) As
wording, it follows the sentence of gorin2021 lines 2278–2279 closely. Old: "(gorin2021 Theorem
6.1, lines 2256–2279: the density of a lozenge is the angle opposite the side of its weight;
kenyon2009 lines 976–1007)". New: "(gorin2021 Theorem 6.1, lines 2256–2279; kenyon2009 lines
976–1007)". The statement itself is unchanged; the locators still support it (gorin2021 Theorem 6.1
at lines 2269–2277 gives densities `θ/π` with each angle opposite the side of its weight;
kenyon2009 lines 976–1007 computes `θ_a/π` for the `a` edge).

Pattern: a search of `README.md` and `Suggested.lean` for "angle", "opposite" and "encoded" finds
no other gloss of Theorem 6.1 (the other hits are the slope triangle, the triangle inequality and
the `ξ(s,t)` apex in the Conventions and 9.6, all with explicit `π` factors). A search for every
source citation followed by a colon gloss, `(<source key> …: …)`, finds one other: the Conventions
bullet on Gorin's height (README line 180, "gorin2021 lines 447–453: positive directions `(1,0)`,
`(0,1)`, `(−1,−1)`, increment `+1` along a lozenge side and `−2` across a lozenge"). It lists the
three vectors and the two values of the source's local rule (gorin2021 lines 447–453) as data, in
its own words, and is mathematically right (checked by the review's Conventions row and below); no
change.

### Adversarial pass on the changed bullet

The bullet's statement is unchanged; its values are recomputed here, including a scalene triangle,
to check that the convention "`θ_k` opposite `w_k`, divided by `π`" survives the edit. For
`d₁ ∈ {0,1}` the `θ`-integral of `G_w` is done by residues: for `a = w₃ + w₁e^{−iφ}`,
`(2π)⁻¹∫ dθ/(a + w₂e^{iθ}) = [|a| > w₂]/a` and `(2π)⁻¹∫ e^{iθ}dθ/(a + w₂e^{iθ}) = [|a| < w₂]/w₂`;
so `w₂G_w(e₁)` is the fraction of `φ` with `|w₃ + w₁e^{−iφ}| < w₂`, and
`w₁G_w(−e₂) = Pr_φ(|a| > w₂) − w₃G_w(0)`.

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| `w₃G_w(0) = θ₃/π` | `w = (1,1,1)`; `w = (3,4,5)` | `(1,1,1)`: `θ₃ = π/3`, `1/3` both sides (also the first Check); `(3,4,5)`: `θ₃ = π/2` (right angle opposite `5`), right side `1/2`; a 600 × 600 midpoint sum of `w₃G_w(0)` gives `0.5001` | agree |
| `w₂G_w(e₁) = θ₂/π` | `w = (3,4,5)` | `|5 + 3e^{−iφ}|² = 34 + 30cos φ < 16` iff `cos φ < −0.6`, an arc of length `2π − 2arccos(−0.6) = 1.8546`, fraction `0.2952`; `θ₂ = arccos((9+25−16)/30) = arccos 0.6 = 0.9273`, `θ₂/π = 0.2952` | agree |
| `w₁G_w(−e₂) = θ₁/π` | `w = (3,4,5)` | `Pr_φ(|a| > 4) − w₃G(0) = 0.7048 − 0.5 = 0.2048`; `θ₁ = arcsin(3/5) = 0.6435`, `θ₁/π = 0.2048` | agree |
| densities sum to one | `(1,1,1)`; `(3,4,5)` | `1/3·3 = 1`; `0.2048 + 0.2952 + 0.5 = 1` | agree, as for a tiling every white face meets one lozenge |
| the deleted gloss read literally | `w = (1,1,1)` | "density = angle": `π/3 ≈ 1.047 > 1`, impossible for a probability | the gloss was false; deleted |
| row formula at `m → 0` | `w = (1,1,1)` | `(−1)^m sin(θ₁m)/(πm) → θ₁/π = 1/3`, matching `w₁G_w(−e₂)` | consistent with the edited bullet |
| frozen and degenerate weights (the bullet's scope) | `(1,1,3)`; `(1,1,2)` | `(1,1,3)`: no triangle, `w₃G(0) = 1` (Check 2 of 9.1, gorin2021 Exercise 6.2); `(1,1,2)`: degenerate triangle with `θ₃ = π`, `θ₁ = θ₂ = 0`, excluded from "liquid" by Check 3 | the bullet is stated for liquid `w` only; unchanged |
| Gorin height gloss (Conventions, line 180) | `M₃` (all type 3) | `h_G = x + y − 3·0`: `+1` along `e₁`, `e₂` (lozenge sides), `−2` along `−e₃` (across the inner edge of each square), the values `+1`, `−2` of gorin2021 lines 449–452 | true; no change |

The edit adds no new statement; no Check of 9.1 uses the deleted clause, and the three Checks of
9.1 (`G(0) = 1/3` and `G(0,−2) = √3/(2π) − 1/3` at `(1,1,1)`; `w₃G(0) = 1` at `(1,1,3)`; the
singular Jacobian at `(1,1,2)`) are unaffected.

## Checks run

- **Elaboration.** `lake env lean packages/DimerModelsAndLozengeTilings/Suggested.lean` from the
  content repository: exit 0; 17 warnings, each "declaration uses `sorry`", at lines 115, 168,
  184, 198, 234, 245, 331, 343, 375, 387, 409, 422, 453, 490, 503, 523, 553; no other message.
- **Signatures.** A scratch copy of `Suggested.lean` with `#check @name` appended for all 57 named
  declarations (35 `def`, 1 `abbrev`, 4 `structure`, 17 `theorem`), elaborated once: exit 0, no
  error, 17 `sorry` warnings. `Suggested.lean` is unchanged this round, so the elaborated types are
  those of the review's signature check; the two Layer 4 theorems still carry `[Countable Γ]
  [Infinite Γ] [Countable I] [DecidableEq I] [Finite S] [DiscreteTopology S]
  [DiscreteMeasurableSpace S]`, properness, `X`, `γ` and `γ.IsEquivariant`, and
  `torus_partitionFunction_eq` both `NeZero` instances and the periodicity of `w`. Nothing changed.
- **Dependency check** (`gate --depcheck` on the README, `--movable`):

      depcheck: 244 roadmaps, 2235 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line.

## Gate failures

None were listed for this round.

## For the maintainer

- No Lean name, section number or target changed; no other roadmap is affected.
- Ownership against open pull requests: unchanged by this repair (no construction was added).
- The review's "For the human reviewers" items (the gorin2021 author-page licence, the 3 × 3
  unit-hexagon example of 3.1, the DimerModelsAndLozengeTilingsPartII scope) list no finding and
  were not acted on.
