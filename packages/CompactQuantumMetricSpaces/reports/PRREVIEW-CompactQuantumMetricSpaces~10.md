# Review of CompactQuantumMetricSpaces (pull request #1155 at 455918c)

**Verdict:** accepted

No finding. This is an incremental re-review: the folder is unchanged since 7db4c19 (0 lines), and the title and description were read against this head.

## Previous findings

- R01 — repaired: "Validation: `Suggested.lean` states 17 theorems, each with `sorry`, together with the definitions they need, and elaborates against the pinned Mathlib and Tau Ceti." The CI and course-note sentences are gone.
- R02 — repaired: "Roadmap suppliers, as in the README's Exact supplier contracts:" followed by 12 items, the same 12 as README lines 254–316; #1047 and #1137 are no longer named.
- R03 — repaired: "Adds the new roadmap CompactQuantumMetricSpaces (`TauCetiRoadmap/CompactQuantumMetricSpaces/`: `README.md`, `Suggested.lean`, `metadata.toml`); no other roadmap folder is changed." No "retained", "remain" or "unchanged" is left.
- R04 — repaired: "Admissible Lip-norms (§5.1) have the full product finite domain needed for gluing." and "A bridge (§5.2) is Rieffel's auxiliary seminorm `N`".

## Verified sound

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| Description: "`Suggested.lean` states 17 theorems, each with `sorry`" | head 455918c | 17 `theorem` lines; `lake env lean` gives 17 `sorry` warnings and no other message | true | none |
| Description: the three headlines named as not statable | module docstring, lines 25–34 | docstring names the isometry-class space (§5.5), `Φ_θ` (§6.1) and torus continuity (§6.5): 3 against 3 | true | none |
| Description: "Adds the new roadmap …; no other roadmap folder is changed" | `git diff --stat origin/main...HEAD` | 3 files, 2156 insertions, 0 deletions, all in the folder; 0 files outside it | true | none |
| Description: supplier list | README "From other roadmaps" | 12 items against 12 bullets, same sections; OperatorAlgebraDynamics and AmenableGroups appear in the README only as inputs of HeisenbergImprimitivity §3.1 | agrees | none |
| Description: bridge `δ⁻¹‖a − b‖` "takes `δ > 0` and the compatibility `L_E ≤ L_F` on `F`"; §5.2 | (i) `E = ℝ²`, `L_E = \|a₁ − a₂\|`, `F = ℝ(1, 1)`, `L_F = 0`, `Pa` = mean. (ii) `E = F = ℝ²`, `L_E = 2\|a₁ − a₂\|`, `L_F = \|a₁ − a₂\|`, `P = id` | (i) `‖a − Pa‖ = \|a₁ − a₂\|/2`, so `δ = 1/2`; bound `1/2` equals §5.1's computed `1/2`. (ii) lift bounds hold for every `δ`, yet diameters `1/2`, `1` give `dist_q ≥ 1/4` | holds; (ii) violates `L_E ≤ L_F`, so the hypothesis is needed | none |
| Description: regularization "with state metric within `2ε`"; §5.1 | `E = F = ℝ`, `M = δ⁻¹\|a − b\|`, `δ = 1/10`, `ε = 1/4` | max norm: `N_ε = \|a − b\|·min(1/δ, 1/(2ε)) = 2\|a − b\|`; `ρ_M = 0.1`, `ρ_(M_ε) = 0.5 ≤ 0.1 + 0.5` | holds | none |
| Description: `exists_closedLipNorm_actionLip` "takes a continuous length function as additional input"; §4.3 | `G = T` on `C(T)` by rotation, `ℓ(g) = 1` for `g ≠ 1` (not continuous) | `L_α(a) = sup ‖α_g a − a‖ ≤ 2‖a‖`: finite on all of `C(T)`; its unit ball modulo scalars contains a norm ball, not totally bounded | fails without continuity; Lean has `hℓ : Continuous ℓ`, `[CompactSpace G] [T2Space G]`, `herg` | none |
| Description: rigidity gives "a unital order isometry", "does not detect the C*-multiplication"; `quantumGHEDist_eq_zero_iff` | transpose `T` on self-adjoint `M₂(ℂ)` | `T(σ_x, σ_y, σ_z) = (σ_x, −σ_y, σ_z)`; unital, positive, isometric; `σ_x∘σ_y = 0` both sides; `[σ_x, σ_y] = 2iσ_z` but `[Tσ_x, Tσ_y] = −2iσ_z` | true; Lean conclusion is `E ≃ₗᵢ[ℝ] F` with `T e = f`, order and `L` preserved | none |
| Description: §2.3 Check "zero-sum span `span(K − K)` from the bounded hexagon `K − K`" | `(1, −1, 0)`, `(2, −2, 0)` | both have sum `0`; `Σ\|x_i\|` is `2` and `4`; bound is `2` | first in `K − K`, second only in the span | none |
| Description: torus continuity "rational and degenerate parameters and `d = 0` included"; §6.5 | `d = 0`, `d = 1` | `d = 0`: `A_Θ = ℂ`, distance `0`; `d = 1`: only skew matrix is `0`, constant family `C(T)` | true; named not statable | none |

The rows for the untouched statements stand as in the previous review, of 7db4c19.

- **Gate:** my rerun with `--base origin/main` reports every check at 0, then `OK`, exit 0. The worker's gate at 455918c passes too, `build=0` included.
- **Dependency check:** `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 17 `sorry` warnings and nothing else. A scratch copy with `#check @name` for the 37 declarations prints 37 types; `quantumGHEDist_eq_zero_iff` and `exists_closedLipNorm_actionLip` keep every binder their README statements name.
- **Changes since 7db4c19:** 0 lines in the folder. The files listed as changed outside it come from merging main; against `origin/main` the pull request changes nothing outside the folder.
- **Source locators:** 1 checked for the bridge row: rieffel00 lines 1562–1572 (Proposition 8.5, `δ > 0`, `P` not necessarily linear). The source takes `L_B` as the restriction of `L_A`; the README's `L_E ≤ L_F` on `F` contains that case and says so.
- **Cross-roadmap citations:** 5 resolved at their current heads: HeisenbergImprimitivity §3.1 (line 503 at 185669b), SmoothBanachRepresentations §§2.1, 3.1, 8.1 (lines 217, 261, 525 at 18e94ff), OperatorKTheory K7.5 (main). `scratch/citations.md` and `scratch/overlaps.md` list nothing unresolved, dropped or conflicting.
- **Title and summary block:** read against README lines 1–21, the Scope section, §§2.1, 2.3, 4.3, 5.1, 5.2, 5.4–5.6, 6.3, 6.5 and Downstream consumers: no contradiction, and no unstated removal, renumbering or supplier change (the pull request only adds).

Overlap check: read HeisenbergImprimitivity, AmenableTracesOnCStarAlgebras, SpectralManifolds, VonNeumannAlgebras (open revision), QuantumFoundations, OptimalTransport, OperatorAlgebraDynamics, BanachAlgebras as in the review of 7db4c19, with the overlap list unchanged; `C*(L, c)` with trace and gauge action: HeisenbergImprimitivity §3.1 and OperatorKTheory K7.5; `W₁`: OptimalTransport; states and V8: VonNeumannAlgebras; SpectralManifolds consumes §§3.1, 3.6; the rest share nothing.

Source independence: changed passages only; the folder has no changed passage. 1 README passage (§5.2's common-ambient-norm bridge) compared with 1 source (rieffel00 lines 1562–1572): they share only the forced formula `δ⁻¹‖a − b‖` and the two inequalities; largest share rieffel00, 39 of 71 Rieffel locators; the arrangement was not compared again, since no layer was added, removed or reordered.

## Not verifiable

- hkls81 (Høegh-Krohn–Landstad–Størmer, Ann. of Math. 114 (1981)): paywalled; consumed only through VonNeumannAlgebras V8.CompactErgodicActions.
- The description's "AI assistance" paragraph: a statement about authorship, outside what the head can show.

## Source issues

- none

## For the human reviewers

- none
