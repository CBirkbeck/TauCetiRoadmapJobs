# Review of PDE (pull request #1614 at f019834)

**Verdict:** needs changes

🤖 Independent AI review, incremental: 0 changed lines in `TauCetiRoadmap/PDE/` since f019834 (the head the previous review read), nothing changed outside the folder. Two findings, both P3: the previous report's R01, which this head cannot have repaired, and one on the pull request's description, read against the head for the first time this round. The gate passes.

## R01 (P3) — The Poincaré bullet's `W^{1,p}_Γ` and Poincaré–Wirtinger clauses omit the regularity of `Ω`

**Location:** `TauCetiRoadmap/PDE/README.md:104–106`: "on `W^{1,p}_Γ(Ω)` for `Ω` bounded and connected and a boundary part `Γ` of positive measure (Poincaré–Friedrichs, Lane G); and modulo constants for `Ω` bounded and connected (Poincaré–Wirtinger, zero mean)."

**Claim:** Both clauses assert the inequality on every bounded connected open `Ω`; both fail without a regularity hypothesis. G.30–G.32 carry it ("admissible", "bounded Lipschitz"); this bullet, which the pull request rewrites, does not.

**Witness:** Rooms `R_k` of side `2^{−k}` in a row, passages of width `2^{−k(p+2)}`; `u_k = 0` before `R_k`, `1` from `R_k` on: `‖∇u_k‖_p^p ≈ 2^{−3k}`, `‖u_k − mean‖_p^p ≈ (4/3)4^{−k}`, ratio `≥ c·2^k → ∞`; `u_k` vanishes on `R_0 ⊇ Γ`.

**Repair:** "on `W^{1,p}_Γ(Ω)` for `Ω` bounded, connected and Lipschitz and an admissible boundary part `Γ` of positive measure (Poincaré–Friedrichs, Lane G); and modulo constants for `Ω` bounded, connected and Lipschitz (Poincaré–Wirtinger, zero mean)". The `W^{1,p}_0` clause stays as it is. On the witness domain the repaired text asserts nothing (the domain is not Lipschitz at the accumulation point of the rooms).

## R02 (P3) — The description does not state the changes the pull request makes outside Lane G

**Location:** the pull request's description: "Adds Lane G to the PDE roadmap: mixed and Neumann boundary conditions. … Lane G builds on Lanes A and D and leaves their items as they are."

**Claim:** The sentences are true of the lane items, but the pull request also rewrites a standing convention of main's text and adds to `Suggested.lean`, and the description states neither; a reader expecting an additive lane does not learn that main's Poincaré side conditions change.

**Witness:** `git diff origin/main...HEAD`: `README.md:103–106` replaces main's "or modulo constants (Poincaré–Wirtinger, zero mean), for `Ω` bounded (or of finite measure, or bounded in one direction)"; `Suggested.lean` gains an import and two declarations (`:263`, `:270`).

**Repair:** Add to the description: "Outside Lane G, it rewrites the Poincaré-normalization bullet of 'Getting the statements right': the finite-measure and one-direction alternatives now apply to `W^{1,p}_0` only, and Poincaré–Wirtinger requires `Ω` bounded, connected and Lipschitz. It adds a scope bullet, an acceptance check and two references, and in `Suggested.lean` the import `TauCeti.Analysis.Sobolev.W1p.Zero`, the definition `w1pVanishingOnSubmodule` and the theorem `w1pVanishingOnSubmodule_frontier`." (The word "Lipschitz" there is R01's repair.)

## Previous findings

- R01 — not repaired: the head is the one the previous review read; `README.md:104–106` still reads "for `Ω` bounded and connected and a boundary part `Γ` of positive measure … modulo constants for `Ω` bounded and connected". Written again as R01.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Poincaré bullet, `W^{1,p}_Γ` clause (`README.md:104–105`) | rooms and passages, `Γ` the far side of `R_0`; `(0,1)`, `Γ = {0}` | rooms: `u_k` is a function of the row coordinate alone, Lipschitz on the plane, so in `W^{1,p}_Γ`; `‖u_k‖_p^p/‖∇u_k‖_p^p ≥ c·2^k`; interval: `|u(x)| ≤ x^{1−1/p}‖u'‖_p`, `C = 1` | false without Lipschitz; true with it (G.30) | R01 |
| Poincaré bullet, Wirtinger clause (`:105–106`) | rooms and passages; `(0,1)`, `p = 2` | rooms: mean of `u_k` is `O(4^{−k})`, ratio `≥ c·2^k → ∞`; interval: `C = 1/π` (first Neumann eigenvalue `π²`) | false without Lipschitz | R01 |
| Poincaré bullet, `W^{1,p}_0` clause (`:103–104`) | strip `ℝ × (0,1)`, `p = 2`; `ℝⁿ` | strip: `‖u‖₂ ≤ (1/π)‖∂_y u‖₂`; `ℝⁿ`: `φ(·/R)` has ratio `R‖φ‖/‖∇φ‖ → ∞` | true; needs no regularity | none |
| `w1pVanishingOnSubmodule_frontier` (`Suggested.lean:270`), the one Lean statement the description's bullets cover | `Ω = ⊥`, `Ω = ⊤`; one-tactic probe | `⊥`: `W1p` is zero, both sides `⊥`; `⊤`: frontier empty, both sides the closure of `C_c^∞(F)`; `rfl`, `simp [w1pVanishingOnSubmodule, W1p0]`, `exact?` all fail | true; not padding | none |
| Description, five bullets and "leaves their items as they are" | each bullet against G.28–G.32; the diff's hunks against Lanes A and D | G.28 cites A.6's predicate; G.29 has the trace characterisation; G.30; G.31 has Lax–Milgram, `∫_Ω f + ∫ h = 0`, Fredholm; G.32; no hunk lies in `README.md:228–269` or `:308–326` | no sentence contradicted; two changes unstated | R02 |

Rows for the statements no change touches (G.28–G.32, the Lean binders) stand as in the previous review, of `f019834`.

- Gate, run again at this head: every check 0, `OK` (the worker's gate file adds `build=0`). `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/PDE'` is empty; the worktree is clean.
- Dependency check: `depcheck: 245 roadmaps, 2219 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration at the pins: `lake env lean` on `Suggested.lean` gives one diagnostic, `270:8: declaration uses sorry`.
- Signatures: the definition's elaborated type drops `[FiniteDimensional ℝ F]`, which neither its body nor G.29 needs; the theorem keeps it together with `[BorelSpace F]`, `[IsAddHaarMeasure volume]` and `[Fact (1 ≤ p)]`. `w1p0Submodule` read at the pinned Tau Ceti, `Analysis/Sobolev/W1p/Zero.lean:123`.
- Seeded sample, all in text the pull request does not change: "Fredholm alternative for compact operators" (`README.md:7`): pinned Mathlib `Analysis/Normed/Operator/Compact/FredholmAlternative.lean:164` (`hasEigenvalue_or_mem_resolventSet`) and `:221`; "Carleson project" (`:273`, `:670`) and "Lane A comes first" (`:676`), the latter consistent with G.28–G.32 citing only A.6 and D.16–D.19 (`:248`, `:313–322`).
- Cross-roadmap citations: the worker's resolver lists none unresolved; Lane G cites no other roadmap.
- Remark, untouched by this pull request: YangMillsConnectionsAndCaloricGauge (open) declares a gap asking PDE for the `L^p` Neumann problem on the unit ball with `W^{2,p}` estimates; Lane G's weak `H¹` Neumann problem is a different statement and does not answer it.
- Overlap check: read SobolevDifferentialForms, YangMillsConnectionsAndCaloricGauge, SobolevPolynomialApproximation, PseudodifferentialOperators, CombinatorialHeegaardFloer; a search of main and the open heads for `W^{1,p}_Γ`, Poincaré–Friedrichs, mixed boundary conditions and Neumann spectra finds them only in this folder; nothing shared.

Source independence: changed passages only; the folder has no changed line since f019834, so 0 passages compared and the arrangement not compared again; the previous comparison stands.

## Not verifiable

- Gröger, Math. Ann. 283 (1989): paywalled; cited as a work only, no Lane G statement rests on a locator into it.
- The Carleson repository beyond its reference line: main's text, not read this round.
- "Related PRs #1609 and #1612" in the description: #1609 is SobolevDifferentialForms; #1612 is not among the open roadmap pull requests given to this review. Lane G cites neither.

## Source issues

- none

## For the human reviewers

- none
