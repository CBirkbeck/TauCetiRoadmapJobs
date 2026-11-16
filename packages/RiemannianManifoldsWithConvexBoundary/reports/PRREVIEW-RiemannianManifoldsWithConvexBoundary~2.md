# Review of RiemannianManifoldsWithConvexBoundary (pull request #2451 at 689d6f5)

**Verdict:** accepted

No findings. Incremental re-review of the 45 changed lines since bde64ee.

## Previous findings

- R01 — repaired: README §4.5 "On the Euclidean plane `N = ℝ²` take the parabola epigraph `M = {y ≥ x²}` … so no `U` and no `c₀` work. For `x̃ = −ρ − ε(x² + y²)` with `0 < ε ≤ 1/2`, `U` the open disc of radius `1/2` …"
- R02 — repaired: §4.4 "(Paternain–Salo–Uhlmann, Proposition 11.2.2, lines 10065–10077, for compact `M` in a closed manifold; Lee, …)"; §4.3 "(Stefanov–Uhlmann–Vasy, lines 99–100; Paternain–Salo–Uhlmann, Lemma 3.1.10, …)"; References add Section 11.2.
- R03 — repaired: description "Dependencies, all roadmaps on main …: DifferentialGeometry (5.1, 12.1–12.3, 12.5), HopfRinow (Layers 1–2), RiemannianGeometry (R5a; R5c, items 1 and 3; R7.9), GeometricTopology (1.1, 1.3), ComplexKahlerGeometry (K5a) and SmoothBundlesConnections (B6.0)."

## Verified sound

| Target | Instances tried | Values computed (roadmap / independent) | Result |
|---|---|---|---|
| 4.5 `exists_convexityFunction`: negative control `x̃ = −ρ` | parabola `ρ = y − x²`, `q = 0`, any open `U ∋ 0` | `dx̃ = (2x, −1) ≠ 0`; kernel `(1, 2x)`, `Hess x̃ = diag(2, 0)` gives `2 > 0`; `K_0 = U ∩ {y = x²}` open, connected parabola: not compact | Check true; Lean's `Icc 0 c₀` includes `c = 0` |
| 4.5 `exists_convexityFunction`: corrected `x̃ = −ρ − ε(x² + y²)` | `ε = 1/2` and `ε = 0.1`, `U = B(0, 1/2)`, `c₀ = ε/8` | `1 + 2εy > 1 − ε ≥ 1/2`; `4ε(1 − ε)x² < 1/4`; so kernel Hessian `> 0`. `K_c ⊆ B(0, √(1/8) ≈ 0.354)`, inside `U` | holds |
| 4.5 positive control, unit disc | `x̃ = \|z\|² − 1`, `q = (0, −1)`, `U = ℝ² ∖ {0}`, `c₀ = 1/2`; `U = B(q, 1/2)` | `K_c = {1 − c ≤ \|z\|² ≤ 1}`, inner radius `≥ 1/√2`, compact; with `B(q, 1/2)`, `K_0` is an open arc, not compact | holds; consistent with first disc Check |
| 4.4 boundary normal coordinates vs PSU Prop. 11.2.2 | unit ball in `ℝ³` (compact, closed extension); strip `[0, 1] × ℝ` | `E(q, t) = (1 − t)q`, `d(·, ∂M) = \|t\|` for `\|t\| < 1`; `h_t = (1 − t)²h₀`, `−½∂_t h_t\|₀ = h₀ = II`; strip lies outside the source's compactness hypothesis | locator and qualifier match lines 10065–10077 (p. 253) |
| 4.3 signed distance vs SUV Thm 1.2 | `Σ = S¹ ⊆ ℝ²`, `f = 1 − \|x\|²` | `r_Σ = 1 − \|x\|`, `\|grad r_Σ\| = 1`, `\|r_Σ(y)\| = d(y, S¹)` on `0 < \|y\| < 2`; SUV lines 99–100 define the signed distance near a hypersurface | holds |

The rows for the statements this change does not touch stand as in the previous review, of `bde64ee`.

- Source locators checked against the text: 3 (`paternain-salo-uhlmann2023` lines 10065–10077, Prop. 11.2.2, p. 253: compact `M` with boundary in a closed `N`, collar diffeomorphisms, distance `|t|`, `g = g_αβ dx^α dx^β + dt²`; lines 2766–2773, Lemma 3.1.10; `stefanov-uhlmann-vasy2021` lines 99–100, Thm 1.2). The old locators "20–22" and "220–221" are no longer cited anywhere in the folder.
- Lean: `IsStrictlyConcaveLevelSetAt` (`Suggested.lean`:137) and `exists_convexityFunction` (`Suggested.lean`:214) re-read against the new Checks: positivity convention and the closed range `Icc 0 c₀` agree with the README.
- Cross-roadmap citations in the changed sections resolved on main (5ff4294): RiemannianGeometry R7.9 (heading at README line 4469), GeometricTopology 1.1 (line 788), HopfRinow Layers 1–2 (`Completed/HopfRinow/README.md` lines 264, 427). All six suppliers named in the description are on main.
- Gate: every check passes, the targeted build included. Dependency check: `depcheck: 258 roadmaps, 2463 edges, 0 problem(s)`. Outside-folder diff: empty.
- Elaboration: `lake env lean` on `Suggested.lean` gives 11 `sorry` warnings and nothing else. `Suggested.lean` is unchanged since bde64ee, so the signature comparison and padding probe of that review stand.
- Pull-request text read against this head: title, summary block and prose agree with it. The change renames, removes and renumbers nothing and adds no supplier.
- Overlap check: no open pull request changes this roadmap or drops an id it cites. The closest-roadmap lists are unchanged since bde64ee (open: ManifoldOptimization, LorentzianGeometry, Varifolds, HyperbolicDynamicsAndThermodynamicFormalism, SmoothBundlesConnections; main: RiemannianGeometry, HopfRinow, Surfaces), and the change adds no object. Ownership stands as read at bde64ee: RiemannianGeometry owns R5a, R5c and R7.9, Surfaces owns the normal strips and SmoothBundlesConnections owns B6.0, each cited from its owner.
- Source independence: changed passages only; 4 passages compared with 2 sources (4.3 and 4.4 against `stefanov-uhlmann-vasy2021` lines 99–100 and `paternain-salo-uhlmann2023` lines 10065–10077; the new 4.5 Checks and the Layer 4 Examples have no source text). Nothing shared beyond formulas. Largest share `paternain-salo-uhlmann2023`, 48 of 87 locators. No layer was added, removed or reordered, so the contents comparison of bde64ee (independent) stands.

## Not verifiable

- `lee-riemannian2018` Ch. 5 pp. 133–136 and Ch. 6 (cited again in 4.3–4.4): settled as uncertified, no legal copy; cited by locator.

## Source issues

- none

## For the human reviewers

- none
