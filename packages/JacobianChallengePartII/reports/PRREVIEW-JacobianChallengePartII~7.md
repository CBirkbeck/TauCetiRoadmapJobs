# Review of JacobianChallengePartII (pull request #1225 at 2354d71)

**Verdict:** accepted

No finding. This roadmap folder is ready for a human's final approval.

## Previous findings

- R01 — repaired: the summary block now reads "the polarization is inverse to Esteves–Gagné–Kleiman's autoduality, pullback along their Abel map x ↦ L(−x), glued by descent, not read off theta divisors", which is `(−u)⁻¹ = λ_X` (README.md:292–294).
- R02 — repaired: "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package and for the headline statements in `Suggested.lean`; Claude Fable 5.1 and Claude Opus 5.5 for revisions of the README and `Suggested.lean`."

## Verified sound

:robot: Independent AI review. This is an incremental re-review of 0 changed lines since `2354d71`; this round reads the pull request's title and description, as they stand now, against the head. The worktree was left unchanged.

| Statement | Instances | Head (README, source) | Description | Result; change |
| --- | --- | --- | --- | --- |
| §1.4 sign of `λ_X` | `E/k` elliptic, `β = O(0)`, `a ∈ E(T)` | `egk` lines 35–37: `A_β(x) = β(−x) = [−1]∘i_β`, so `A_β^* = −u`; `λ_X = −u⁻¹`: `a ↦ O([−a]−[0])`, `u∘λ_X = −id` | inverse of `A_β^*`: `(−u)⁻¹ = −u⁻¹`, `a ↦ O([−a]−[0])` | equal; none (R01 repaired) |
| §§2.2, 2.5 Abel maps in every degree, finite for `d ≠ 0` | `E`; `d = 0`, `α = O`; `d = −1`, `α = O(−e)`; `d = 2` | `d = 0`: `i_α ≡ 0`, fibre of dimension 1, not finite; `d = −1`: `[−1]∘i_{O(e)}`, degree 1; `d = 2`: translate of `[2]`, degree 4 | every degree, finite only for `d ≠ 0` | agree; none |
| §§1.2, 1.4 principally polarized abelian scheme of relative dimension `g`, no section | genus-one torsor `C/k`, `C(k) = ∅`; genus 2 | `J(C)` elliptic: dimension `1 = g`, `deg λ_X = 1`; genus 2: dimension 2 | same, positive genus, noetherian base, no section | agree; none |
| Layer 3 identities, any degree-one divisor, any field | genus 2, char ≠ 2, `α = P` non-Weierstrass | `[−1]^*θ_α = θ_{K−α}`; `2P ≁ K`, so `θ_α` not symmetric and `(2g−2)α = 2P ≠ ω_C` | no symmetry or canonical-root assumption | agree; none |
| Layers 6–7 scope sentence | `g = 2` stable family; `ℓ = 3` | Layer 6: `g > 1`, integral noetherian base, semi-abelian `Pic⁰`; Layer 7: `g ≥ 2`, `ℓ ≥ 3`, base over `ℤ[1/ℓ, ζ_ℓ]` | "compare stable-curve and generalized-Jacobian Hodge lines and specialize to full symplectic level" | agree; none |

The rows for the 14 Lean declarations, and for every README target not listed here, stand as in the previous review, of `2354d71`.

- **Gate**, rerun at `2354d71`: every field 0, `OK`; the worker's gate at this head has `build=0`.
- **Elaboration:** `lake env lean` on `Suggested.lean`: nine `declaration uses sorry` warnings (lines 79, 91, 110, 129, 140, 158, 178, 210, 226), no other message. The file is unchanged since the previous review.
- **Dependency check:** `depcheck: 245 roadmaps, 2215 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. `ORDER.txt` has this roadmap at line 72, after AlgebraicModuliForArithmeticGeometry (36), ComplexComparisonPartII (41), AbelianSchemesAndArithmeticModuli (43), NeronModelsAndSemistableAbelianVarieties (68).
- **Roadmap names in the README:** 13 resolved. Six suppliers are on main (JacobianChallenge, StableReduction, AlgebraicVectorBundles, PadicMeasuresIwasawaAlgebras, SchemeAndStackFoundations, ModularCurves); the four open suppliers are new-roadmap pull requests and are exactly the description's depends-on list; three are consumers (ModularCurvesPartII, ArithmeticStatisticsPartVIII, AbelianSchemesAndArithmeticModuliPartII). "Everything else named in the README is a consumer" holds.
- **Description against the folder:** the pull request adds the folder (1403 insertions, 0 deletions; README, `Suggested.lean`, `metadata.toml`) and changes nothing outside it. The title equals README.md:1. `Suggested.lean` imports Mathlib and five `TauCeti.*` modules and no roadmap; its three definitions and two instances have bodies; no `set_option`. The summary block's three paragraphs match README.md:3 (summary), the scope section's export contracts for `modularJacobian` and `hyperellipticJacobian`, and its "Not built here" paragraph (metrics and heights elsewhere).
- **AI-assistance sentence** against `git log origin/main..2354d71`: trailers name Codex (79cf245), Claude Fable 5.1 (0c19546, 1e5949a, 2354d71) and Claude Opus 5.5 (d8d695f); all three are named.
- **Validation sentence:** build, README identifiers, round labels, empty sections, `set_option` and dependency counts reproduce at 0; a search of the README for labelled Checks returns 0.
- **Source locator:** `egk` (arXiv math/9911071v1, fetched through the sources service) lines 33–37 (p. 1): Abel map `P ↦ L(−P)`, autoduality its pullback, independent of `L`. 1 locator checked.

Overlap check: `scratch/overlaps.md` lists no shared roadmap, no dropped id and no second copy; closest lists read as in the previous review (JacobianChallenge on main and its open revision, AbelianSchemesAndArithmeticModuli, RelativeJacobiansAndIntegralCurveModels, StableReductionPartII); nothing changed in the folder, nothing shared: the relative Jacobian, its polarization, Abel maps and twice-theta are owned here; abelian-scheme duality and polarizations by AbelianSchemesAndArithmeticModuli; field Picard torsors by SchemeAndStackFoundations §3.6.

Source independence: changed passages only; the folder has no changed passage. The description's polarization sentence was compared with 1 source (`egk` lines 33–37), no shared wording beyond the formula `L(−P)`. The arrangement was not compared again: no layer was added, removed or reordered.

## Not verifiable

- Zhang, *Gross–Schoen cycles and dualising sheaves*, Lemmas 2.2.1–2.2.3 (§4.9): `uncertified`; outside the change, not reopened.
- Serre, *Lectures on the Mordell–Weil Theorem*, §5.6 (§3.4): `uncertified`; outside the change, not reopened.
- Mumford–Fogarty–Kirwan, *Geometric Invariant Theory*, §6.2 (§3.13): `uncertified`; outside the change, not reopened.

## Source issues

- none

## For the human reviewers

- none
