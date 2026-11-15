# Review of MordellLawrenceVenkatesh (pull request #1231 at 3756140)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 3756140; this round reads the pull request's title and description against the head. No finding.

## Previous findings

- none: the previous report, of `3756140`, was an acceptance with no finding, and the folder has not changed since.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Description, "Faltings's lemma must allow ramification above p" ↔ §1.2 | `ρ = χ_cyc⁻¹` over `ℚ`, `T = ∅` versus `T = {p}` | Ramified at `p`, so excluded by `T = ∅`, admitted by `T = {p}`; §1.2 and Conventions take `T = S ∪ {places above p}` | Description agrees with head | none |
| Description, "Frobenius powers only up to seven" ↔ §11.4 | `N = 34`, `r = 17`, `u = 2`; `N = 106`, `g = 2` | `2⁴ = 16 ≢ 1`, `2⁸ = 256 ≡ 1 (mod 17)`: unit condition holds for `i ≤ 7`, fails at 8. `7·4·106² = 314608 < 106⁴ = 126247696` | Description agrees with head | none |
| Description, S-unit finiteness ↔ §6.10, `sUnitEquation_finite` | `K = ℚ`, `S = ∅`; `S = {2}` | `S = ∅`: units `±1`, sums `2, 0, 0, −2`, no solution. `S = {2}`: `(2,−1), (−1,2), (1/2,1/2)`, three solutions | Finite in both; statement names native `Set.unit` | none |
| Description, Faltings's theorem ↔ §11.6, `mordell_finite` | Genus 0 (`ℙ¹`), genus 1 of positive rank, `2 ≤ genus` | `ℙ¹(ℚ)` and a rank-one curve are infinite; both excluded by `2 ≤ C.genus K`; hypotheses smooth, proper, geometrically connected, dimension 1 as the description says | Description agrees with head | none |
| Description, "centralizer bound" ↔ §0.4, `finrank_semilinearCentralizer_le` | `E = ℂ`, `F = ℝ`, `σ` = conjugation, `V = ℂ`, `φ = σ` | Multiplication by `a` commutes iff `a = ā`: centralizer `ℝ`, dimension `1 ≤ 1²` | Pass | none |

The rows for all other statements stand as in the previous review, of `3756140`.

- Pull request text: title and 14 sentences of the description's prose and summary block read against the head; each of the eight end theorems, layers and suppliers they name is at the head (§§0.4, 1.2, 4.5, 6.10, 7.9, 10.9, 10.10, 11.4, 11.6); the folder list (README, `Suggested.lean`, `metadata.toml`) and the five Lean declarations match the computed change (192 headings and 5 declarations added, none removed).
- Cross-roadmap citations resolved for the description's two owner names: `mordell_finite` at HeightsRationalPointsAndObstructions `Suggested.lean` line 79 (open head); `finite_two_term_unit_equation` at DiophantineApproximationAndTranscendence README §2.4, line 1092 (main).
- Gate at this head: every scanner 0, `OK`. Dependency check: `depcheck: 245 roadmaps, 2254 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/MordellLawrenceVenkatesh/Suggested.lean`: four `declaration uses sorry` warnings (lines 65, 78, 92, 106), nothing else. Elaborated signatures compared with §§0.3, 0.4, 5.2, 6.10, 11.6: no binder lost, nothing changed.
- Changes outside the folder: none. No `set_option`, no sorry'd data, one `import Mathlib` and one `TauCeti` module.
- Remark (untouched text): `TauCeti.IsJordanCurve.exists_homeomorph_image_sphere`, which GeometricTopology on main cites, is not in Tau Ceti at the pin `a91d3aa`, so `schoenflies_extension` is not a one-lemma consequence at the pin.
- Remark (untouched text): GeometricTopology on main (README lines 165–168) names its Layer 1.7.2 the single owner of mapping class groups of compact surfaces and Dehn twists and says this roadmap's §§5.9–5.12 take them from it; §§5.9–5.12 here define them and cite GeometricTopology Layer 1 only.
- Remark: the description's "author-side red-team passes to follow" predates the red-team repairs already in the branch; nothing in the folder depends on it.

Overlap check: read GaloisSectionsPadicPeriodMaps, MappingClassGroupsAndCanonicalRepresentations, TeichmullerGeometry, GeometricTopology; the first two cite this roadmap as owner of what they share (§§0.5, 0.18, 1.4–1.16, 2.1, 3.1–3.11, LV.5, LV.8, LV.10, LV.11); mapping class groups and Dehn twists of compact surfaces: owner GeometricTopology Layer 1.7.2 (remark above), punctured surfaces and marked points: this roadmap.

Source independence: changed passages only; the diff of the folder is empty, so 0 passages compared with 0 sources; largest share LV20 (220 mentions in the README); contents not compared again (no layer added, removed or reordered).

## Not verifiable

- BO78, Corollary 7.4 (§2.11): no legal readable text found by the earlier search; carried, not rechecked.
- Fal83, §6, proof of Satz 5, pp. 362–363: paywalled, cited by locator alone (uncertified); carried.
- GX13: the legal author copy read earlier is dated 2025, not 2013; Appendix E numbering matched, edition identity uncertified; carried.
- The seeded sample falls in no changed passage (there is none), so no source locator was reopened this round.

## Source issues

- none (no source was reopened this round; the eleven entries of the previous report, of `3756140`, stand).

## For the human reviewers

- none
