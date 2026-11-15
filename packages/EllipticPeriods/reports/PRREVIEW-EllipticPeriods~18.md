# Review of EllipticPeriods (pull request #1059 at 88b745b)

**Verdict:** needs changes

## R01 (P3) — The description's ownership sentence contradicts the README's Scope

**Location:** pull request description, last sentence of the **Boundary.** paragraph: "This roadmap owns only the E₂ dictionary and its scaled form for a positive period pair."

**Claim:** As written, the sentence says this is all the roadmap owns. The README's Scope and ownership (README 24–41) also gives it the Layer 1 elliptic-function API, the part of Layer 2 that Tau Ceti lacks, the period matrix and period field (Layers 3 and 5), and `HasCM` (Layer 4). The description's own Scope list, items 1–5, says the same. The "only" is meant for the Eisenstein comparison, and the sentence does not say so.

**Witness:** README 30–33: the roadmap owns "what the pinned Tau Ceti lacks about its Weierstrass `ζ` and quasi-period map (Layer 2): meromorphy …, the Laurent expansion, `ζ_{cΛ}(cz) = c⁻¹ ζ_Λ(z)`, `quasiPeriod_smul` and `quasiPeriod_congr`"; README 39–41 owns Layers 3, 5 and `HasCM`.

**Repair:** replace the sentence with: "Of the comparison with Eisenstein series, this roadmap owns only the E₂ dictionary `η(1) = G₂(τ)` for `ℤ + ℤτ` (2.4, `quasiPeriod_ofUpperHalfPlane_one`) and its scaled form for a positive period pair." This agrees with README 34–38.

## Previous findings

- none: the review of `88b745b` raised no finding.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 2.4 `quasiPeriod_ofUpperHalfPlane_one`, `η(1) = G₂(τ)` (the dictionary R01 names) | `τ = i`; `τ = 0.3 + 1.1i`; lattice sum `\|m\|, \|n\| ≤ 300` against the `q`-series | `3.1415936` vs `G₂(i) = π = 3.1415927`; `3.3143664 − 0.0746727i` vs `3.3143658 − 0.0746731i` | sound | none |
| 2.4 scaled dictionary `η(ω₁) = ω₁⁻¹(π²/3)E₂(τ)` (R01) | `(ω₁, τ) = (2, i)`; `(1 + i, 0.3 + 1.1i)`, lattice sum `N = 300` | `1.5707968` vs `π/2 = 1.5707963`; `1.6198469 − 1.6945195i` vs `1.6198464 − 1.6945194i` | sound | none |
| Description item 5, README 12, 791–792: invariants of `π·ℤ[i]` | `L = (π, πi)` | `g₂ = 1.9410121` vs `Γ(1/4)⁸/(16π⁶) = 1.9410172` (not algebraic); `g₃ = 0` by `iΛ = Λ` | the 5.3 hypothesis fails, as stated | none |
| 5.3 `two_le_trdeg_periodField` and the `π·ℤ[i]` counterexample (README 806) | `L = (π, πi)` | `η(π) = 1.0000003`, `η(πi) = −1.0000003i`; field `ℚ(π, πi, 1, −i) = ℚ(π, i)`, trdeg `1 < 2`; Legendre `6.283187i` vs `2πi = 6.283185i` | sound; hypothesis needed | none |

Rows for the untouched statements stand as in the previous review, of `88b745b`.

- Gate: the worker's gate and my rerun with the candidate order and `--build` both report every counter 0 and `build=0 OK`. Rerun against the configured order instead, its depcheck prints `NOT IN ORDER: EllipticPeriods (insert it after its last supplier)`. The candidate order lists this roadmap at line 74, after ModularCurvesPartII (73), so this is not a finding.
- Dependency check (`--movable`, candidate order): `depcheck: 245 roadmaps, 2211 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- Elaboration of `TauCetiRoadmap/EllipticPeriods/Suggested.lean`: exit 0, 27 diagnostics, all "declaration uses `sorry`". The folder diff since `88b745b` and the diff outside the folder are both empty.
- Description checked sentence by sentence against the head, with one contradiction (R01). Checked: the three files and nothing outside them; the six layers and their contents (README 236–855); five supplier subsections (121–212); all 27 `### k.n` targets, each with *Needs:* and **Checks.**; Examples and Dependencies in all six layers; the five headlines (`Suggested.lean` 175, 224, 232, 244, 248), in module form (line 1); the docstring's `ζ = σ′/σ` (43–46); Sources against References (903–941); the gate claim.
- Cross-roadmap citations resolved, 9 in all: ModularCurvesPartII at its open head `9be1eb8`, §1.1 (its README 394, 402) and §1.4a (488, 502: `latticeQuasiPeriod`, `latticeSigma_quasiPeriod`, `latticeQuasiPeriod_legendre`); DiophantineApproximationAndTranscendence on main, §5.6 (3555), `nesterenko` (3658), `eisenstein_values_at_i` (3660); ModularForms §10D on main (58, 145), whose text arrived in the merge commit of the "Depends on" entry the description ticks.
- Seeded sample: none of the sampled targets is in changed text. The README flags no locator as unverified.

Overlap check: read EllipticCurvePeriodsAndModularParametrizations (open), ModularForms, DiophantineApproximationAndTranscendence and EllipticIntegrals (main). The `g₂, g₃`–`E₄, E₆` comparison is owned by ModularForms §10D and Tau Ceti `UpperHalfPlane.g₂_periodPair`, and consumed here; EllipticCurvePeriodsAndModularParametrizations §1.1 states its scaled form and is not in the merge order. `σ`, quasi-periods and Legendre are owned by ModularCurvesPartII §1.4a and Tau Ceti; EllipticIntegrals defers them. `nesterenko` is owned by DiophantineApproximationAndTranscendence §5.6.

Source independence: changed passages only, 0 passages compared, because the folder did not change since `88b745b`. The largest share is NIST DLMF ch. 23, with 15 of 28 pattern-matched locators (Silverman 5, Chudnovsky ICM 1978 3, Waldschmidt 3, Bost–Charles 2). No layer was added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- Silverman, AEC ch. VI and ATAEC chs. I–II (1.4, 2.4, 4.1): no legal copy found; cited by chapter. 2.4 is checked numerically above.
- Chudnovsky 1976 and 1984, Nesterenko 1996, André 2004, Grothendieck 1966, Lang 1966, and Waldschmidt's *Diophantine Approximation on Linear Algebraic Groups*: not read. They are cited by locator in References and Research context only, and no locator changed.

## Source issues

- none

## For the human reviewers

- none
