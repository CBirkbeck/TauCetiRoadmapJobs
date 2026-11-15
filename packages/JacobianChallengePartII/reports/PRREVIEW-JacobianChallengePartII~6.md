# Review of JacobianChallengePartII (pull request #1225 at 2354d71)

**Verdict:** needs changes

## R01 (P3) — The summary block gives the polarization with the wrong sign

**Location:** Pull-request description, `<!-- roadmap-summary -->` block, paragraph "Approach and generality": "the polarization is minus the inverse of Esteves–Gagné–Kleiman's Abel-pullback autoduality, glued by descent, not read off a theta divisor."

**Claim:** The head contradicts the sign. Esteves–Gagné–Kleiman's autoduality is pullback along their Abel map `x ↦ L(−x)`. README.md:292 identifies that isomorphism with `−u_β`, and README.md:294 sets `λ_X = −u⁻¹`, which is the inverse of their isomorphism. Minus that inverse is `u⁻¹ = −λ_X`. That map is the divisor-class map, and it is not a polarization.

**Witness:** `egk` lines 35–37 (p. 1) define `A_L(P) = L(−P)` and take `A_L^*` as the autoduality. For an elliptic curve `E` with `β = O(0)`, README.md:307 gives `λ_X(a) = O([−a] − [0])`. The description's map sends `a ↦ O([a] − [0])`.

**Repair:** Replace the clause with: "the polarization is the inverse of Esteves–Gagné–Kleiman's autoduality isomorphism (pullback along their Abel map `x ↦ L(−x)`), equivalently minus the inverse of the positive Abel pullback, glued by descent, not read off a theta divisor." On `E` this gives `(−u)⁻¹(a) = O([−a] − [0]) = λ_X(a)`.

## R02 (P3) — The AI-assistance sentence omits models that co-authored the head

**Location:** Pull-request description, last prose paragraph: "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package, with author-side red-team passes to follow."

**Claim:** CONTRIBUTING.md ("Attribute AI assistance") asks the description to name the models used. Four of the folder's nine commits are co-authored by Claude models that the sentence does not name. The red-team and review repair passes it announces are already in the branch history.

**Witness:** `git log origin/main..2354d71 -- TauCetiRoadmap/JacobianChallengePartII`: commits 0c19546, 1e5949a and 2354d71 carry `Co-Authored-By: Claude Fable 5.1`, d8d695f carries `Claude Opus 5.5`, and 53dc331 and 5a975b3 are titled "red-team repairs".

**Repair:** "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package and the headline statements in `Suggested.lean`; Claude Fable 5.1 and Claude Opus 5.5 for the review repairs that followed."

## Previous findings

- none: the review of `2354d71` (report ~5) raised no finding.

## Verified sound

:robot: Independent AI review. This is an incremental re-review of 0 changed lines since `2354d71`. This round checks the pull request's title and description against the head. The worktree was left unchanged, and probe copies are in the job's scratch directory.

| Statement | Instances | Head (README, source) | Description | Result; change |
| --- | --- | --- | --- | --- |
| §1.4 sign of `λ_X` | `E/k` elliptic, `β = O(0)`, `a ∈ E(T)` | `egk`: `A_β = [−1]∘i_β`, so `A_β^* = −u`; `λ_X = −u⁻¹ = (A_β^*)⁻¹`: `a ↦ O([−a]−[0])`, `u∘λ_X = −id` | `−(A_β^*)⁻¹ = u⁻¹`: `a ↦ O([a]−[0])`, `u∘u⁻¹ = +id`; README.md:36 calls this map `−λ_X` | head agrees with `egk`; description off by `[−1]`; R01 |
| §§2.2, 2.5 Abel maps in every degree, finite for `d ≠ 0` | `E`; `d = 0, α = O`; `d = −1, α = O(−e)`; `d = 2` | `d = 0`: `i_α ≡ 0`, constant on a one-dimensional fibre, not finite (README.md:362); `d = −1`: `[−1]∘i_{O(e)}`, finite; `d = 2`: translate of `[2]`, rank 4 | maps for every `d ∈ ℤ`, finiteness only for `d ≠ 0` | agree; none |
| §§1.2, 1.4 principally polarized abelian scheme of relative dimension `g`, no section | genus-one torsor `C/k` with `C(k) = ∅`; genus 2 | `J(C)` elliptic, dimension `1 = g`, `λ_X` of degree 1 (README.md:259); genus 2: dimension 2 | same, with no section assumed | agree; none |
| Layer 3 identities for every degree-one divisor, with no symmetry or canonical-root hypothesis | genus 2, char ≠ 2, `α = P` not a Weierstrass point | `[−1]θ_α = θ_{K−α}`, symmetric iff `2α ~ K`; `2P ≁ K`, so `θ_α` is not symmetric and `(2g−2)α ≠ ω_C`; README.md:55 admits this | identities for any degree-one divisor over any field | agree; none |

The rows for the 14 Lean declarations, and for every README target not listed here, stand as in the previous review, of `2354d71`.

- **Gate**, rerun at `2354d71`: every field is 0, `OK`. The rerun prints no `build` field; the worker's gate at this head has `build=0`.
- **Elaboration:** `lake env lean` on a scratch copy of `Suggested.lean` with 14 `#check @` lines added. It gives nine `declaration uses sorry` warnings (lines 79, 91, 110, 129, 140, 158, 178, 210, 226) and no other message, and all 14 types print. The file is unchanged since the previous review.
- **Dependency check:** `depcheck: 245 roadmaps, 2215 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. `ORDER.txt` lists this roadmap at line 72, after AlgebraicModuliForArithmeticGeometry (36), ComplexComparisonPartII (41), AbelianSchemesAndArithmeticModuli (43) and NeronModelsAndSemistableAbelianVarieties (68).
- **Roadmap names in the README:** 13 resolved. Six suppliers are on main (JacobianChallenge, StableReduction, AlgebraicVectorBundles, PadicMeasuresIwasawaAlgebras, SchemeAndStackFoundations, ModularCurves). Four open suppliers are exactly the description's depends-on list. Three are consumers (ModularCurvesPartII, ArithmeticStatisticsPartVIII, AbelianSchemesAndArithmeticModuliPartII). The description's "everything else … is a consumer" holds.
- **Description against the folder:** the folder holds README, `Suggested.lean` and `metadata.toml`, and nothing changed outside it. `Suggested.lean` imports only `Mathlib` and five `TauCeti.*` modules. Its four definitions and two instances have real bodies. The title matches README.md:1.
- **Validation sentence:** the build, README identifiers, round labels, empty sections, `set_option` and dependency-gate counts all reproduce at 0. "Check labels" is not a field of the gate at this head, so that count was not reproduced (remark).
- **Source locator:** `egk` (arXiv math/9911071, fetched through the sources service), lines 33–37 (p. 1) and 205–235 (Theorem (2.1), pp. 5–6). They define `A_L(P) = L(−P)` and the autoduality `A_L^*`, independent of `L`. This supports README.md:292.

Overlap check: read JacobianChallenge (main, and the open revision's ownership lines 48–50 and 991–992), AbelianSchemesAndArithmeticModuli, RelativeJacobiansAndIntegralCurveModels, StableReductionPartII and HeightsRationalPointsAndObstructionsPartII, and searched StableReduction and SchemeAndStackFoundations on main. The relative Jacobian, its polarization, the Abel maps and twice-theta are owned here, and each open roadmap above cites this roadmap for them. Abelian-scheme duality and polarizations belong to AbelianSchemesAndArithmeticModuli (README.md:40), and field Picard torsors to SchemeAndStackFoundations §3.6 (README.md:34).

Source independence: changed passages only. The folder has no changed passage. The description's polarization sentence was compared with 1 source (`egk` lines 33–37, 205–235), with no shared wording. The arrangement was not compared again, since no layer was added, removed or reordered.

## Not verifiable

- Zhang, *Gross–Schoen cycles and dualising sheaves*, Lemmas 2.2.1–2.2.3 (§4.9): `uncertified`; outside the change, not reopened.
- Serre, *Lectures on the Mordell–Weil Theorem*, §5.6 (§3.4): `uncertified`; outside the change, not reopened.
- Mumford–Fogarty–Kirwan, *Geometric Invariant Theory*, §6.2 (§3.13): `uncertified`; outside the change, not reopened.

## Source issues

- none

## For the human reviewers

- none
