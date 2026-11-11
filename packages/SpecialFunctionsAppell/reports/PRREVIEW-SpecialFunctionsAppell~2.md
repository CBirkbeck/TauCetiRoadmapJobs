# Review of SpecialFunctionsAppell (pull request #2166 at ac7377f)

**Verdict:** accepted

Incremental re-review of the 150 lines changed since `9238be3`. No finding.

## Previous findings

- R01 — repaired: README 5.3 now bounds the fibre by `C (1 + m)^K (√|y| − 1)^{−2m} (|y|^{−Re α} + |y|^{−Re β})`, derives it from `∑ₙ ((m+n)!/(m! n!))² tⁿ ≤ (1 − √t)^{−2m−2}`, and concludes from `‖x‖ < (√‖y‖ − 1)²`.
- R02 — repaired: the supplier facts of SpecialFunctionsHypergeometric 1.2–1.4, 4.2, 5.1 are stated in prose with their DLMF numbers; the gate's `readme-ids-missing` is 0.
- R03 — repaired: the ownership table lists 16.14.5–16.14.6 as the series only and the systems of `G₂`, `G₃` as auxiliary results of 3.2; 3.2 says they are derived here from the coefficient recurrences.
- R04 — repaired: 3.2 has six Checks for `hornG2`/`hornG3`, among them the index-direction test, two exact coefficients, the `x = 0` section of `G₃` and the negative control at `β = 1`.
- R05 — repaired: 2.2 is "*Needs:* 1.1"; 2.4 and 4.1 have their own lines; each of 16.16.1–16.16.5 carries its own needs.
- R06 — repaired: 5.1 and 5.2 display the two coefficient identities with the route by a recurrence in `M` and its initial values; "certificate", `ring`, `field_simp` and "still `sorry`" are gone.
- R07 — repaired: `isOpen_appellDomain1` is deleted from `Suggested.lean`; README 2.1 states openness in prose without the name.
- R08 — repaired: `isConnected_appellDomain1`, `isOpen_appellDomain2` and `starConvex_appellDomain2` each have their own docstring.

## Verified sound

| Statement | Instances | Values (left; right) | Result |
|---|---|---|---|
| 5.1 coefficient identity (16.16.7) | exact rationals, `M, N ≤ 5`, `(α, β, γ, γ′) = (0.3, 0.85, 1.6, 1.25)` and `(0.3, 0.45, −1, 1.25)` | equal as fractions in all 72 cases; e.g. `(2, 3)`: `−0.09468 78017 28…` and, at `γ = −1`, `0.51926 06405 7` (normalised by `Γ(γ′)`, and `Γ(γ)` in the first set) | holds, at the pole too |
| 5.2 coefficient of the Euler integral | same 72 cases | equal as fractions to the left side of 5.1; `(5, 5)` at `γ = −1`: `60.99265 82395 776` on all three sides | holds |
| 5.2 coefficient, derivation | binomial series of the three powers, Beta integrals | `B(α+M, γ−α) B(β+N, γ′−β)` with the prefactor gives `(α)_M (β)_N/(Γ(γ+M) Γ(γ′+N))` | agrees with the display |
| 5.1, 5.2 values at `M = 0` | by hand | left: only `m = 0`, `n = N`; right: `k = 0`; 5.2: `(−r − q)_N/N!` with `−r − q = α` | all `(α)_N (β)_N/(Γ(γ) Γ(γ′+N) N!)` |
| 5.3 fibre bound | `α = 0.3`, `β = 0.85`, `γ′ = 1.25`, `y = 5 + 0.1i`, `m = 10, 20, 40, 80` | `|F| |y|^m = 3.58e3, 2.98e8, 3.5e18, 8.09e38`; `|F| (√|y| − 1)^{2m} = 0.0254, 0.0151, 0.00893, 0.00528` | the README's values; new bound holds |
| 5.3 `∑ₙ C(m+n, n)² tⁿ ≤ (1 − √t)^{−2m−2}` | `(m, t) = (3, 0.2), (40, 0.2), (10, 0.9)` | `15.1 ≤ 114.7`; `4.74e19 ≤ 1.29e21`; `1.10e26 ≤ 2.37e28` | holds |
| 5.3 factor `(1 + m + n)^K` | `(m+1+n) C(m+n, n) = (m+1) C(m+n+1, n)`, iterated | `∑ₙ ≤ (m+1)⋯(m+K) (1 − s)^{−m−1−K}` | `C (1+m)^K (1 − √t)^{−K}` as stated |
| 5.3 `U` | `√‖x‖ + 1 < √‖y‖` | `⇔ ‖x‖ < (√‖y‖ − 1)²`, ratio of the geometric majorant `< 1` | convergence on exactly `U` |
| 3.2 Check, `G₂(α, 0; β, β′; x, y)` | `α = 0.3`, `β = 0.45`, `β′ = 0.7`, `x = 0.3` | `0.90520 28618 4835…` both sides; exchanged indices `0.88863 92498 5782…` | agrees, discriminates |
| 3.2 Check, coefficients | same, `α′ = 0.55` | `α β′/(β − 1) = −0.38181 8…` both; `α(α+1)/(α′ − 1) = −0.86666 6…` both | agree |
| 3.2 Check, `G₃(α, α′; 0, y)` | `α = 0.3`, `α′ = 0.55`, `y = 0.1` | `0.93072 62972 3586…` both sides | agrees |
| 3.2 negative control | `β = 1`, `m = 1`, `n = 0` | `pochZ(1, −1) = Γ(0)/Γ(1) = 0` with Mathlib's `Γ` | as stated |

The rows for the untouched statements stand as in the previous review, of `9238be3`.

- Source locators checked against the text (3): DLMF §16.14(ii) (line 234: the reference to Erdélyi et al. 1953a, §§5.7.1–5.7.2; the systems of `G₂`, `G₃` are not displayed), DLMF §16.16(i) (line 265: Burchnall and Chaundy 1940, 1941), DLMF §16.15 (line 39: Burchnall and Chaundy 1940, (68) for 16.15.4).
- `*Needs:*` lines of 2.2, 2.4, 4.1 and the five items of 4.2 read against their proof routes: each lists what the route uses; no later layer is named.
- Cross-roadmap citations in the changed passages (SpecialFunctionsHypergeometric 1.2–1.4, 4.2, 5.1) stand as resolved on main in the previous review; the change removes backticked names only.
- Gate at this head: every scanner 0, `OK`. Dependency check: `depcheck: 237 roadmaps, 2139 edges, 0 problem(s)`.
- `lake env lean` on `TauCetiRoadmap/SpecialFunctionsAppell/Suggested.lean`: 56 `sorry` warnings and nothing else. The Lean change deletes one theorem and splits two docstrings; no statement changed.
- No file outside the folder is changed; `overlaps.md` and the citation resolver list nothing for this roadmap.
- The pull request's text agrees with the head: a new roadmap, one supplier on main, 56 headline theorems, Layer 3 with the systems of `G₂` and `G₃`.

## Not verifiable

- Burchnall and Chaundy 1940, 1941 (the identities of 5.1 and 5.2 at their source): not reachable legally; both identities were checked in exact arithmetic instead, and DLMF's citation of them was read.

## Source issues

- none
