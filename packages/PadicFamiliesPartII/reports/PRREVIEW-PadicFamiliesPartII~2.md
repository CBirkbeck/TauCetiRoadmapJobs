# Review of PadicFamiliesPartII (pull request #2280 at 40706dd)

**Verdict:** needs changes

Incremental re-review of the 85 lines changed since `88b66ee`.

## R01 (P2) — Layers 4–6 still follow the table of contents of BCGP21 §§4–6 (previous R05)

**Location.** `TauCetiRoadmap/PadicFamiliesPartII/README.md:582`, `:763`, `:925` (the three layer headings, unchanged) and `:260`: "within the Hilbert layers, Layer 4 supplies both Layer 5 and Layer 6, which do not use each other."

**Claim.** The organisation of the Hilbert layers is the roadmap's own.

**Witness.** The diff rewords `:11` and adds the sentence at `:260`; no section moved. Pairs, as before: `Layer 4 ↔ §4`, `Layer 5 ↔ §5`, `Layer 6 ↔ §6`; `6.2 ↔ 6.2`, `6.3 ↔ 6.3`, `6.4 ↔ 6.4`, `6.5 ↔ 6.5`, `6.6–6.7 ↔ 6.6` (BCGP21 lines 56–80).

**Repair.** The sentence added at `:260` itself says that nothing forces Layer 5 before Layer 6; the *Needs* lines force only Layer 4 before both and the chain §6.1 → §6.2 → §6.3 → §6.5 → §6.6 → §6.7. Reorganise by what §4.7, §5.8 and §6.7 need: (a) one layer "special-fibre ordinary amplitude and the spherical-to-Klingen comparison" holding §§3.2–3.3, 4.4, 4.4a and 4.6, stated for totally real F with `F = ℚ` as a case (further sources P20 Proposition 8.2.1, p. 53, and Corollary 14.9.1, p. 102); (b) one layer "partial-ordinary families and derived control" holding §§4.1–4.3, 4.5, 4.7 with §§3.4–3.5 and the operator identities §§5.1 and 5.5 (P20 Theorem 11.3.1, p. 71); (c) the overconvergent comparison §§6.1–6.7 (P20 Theorem 14.7.1, p. 99; AIP15 Propositions 7.2.3 and 7.3.1, pp. 34–35); (d) the doubling layer last, split into the companion-operator algebra (§5.6) and the divisor geometry (§§5.2–5.4, 5.7–5.9). Extend the former-numbering table at `:19–51` with one row per moved section, and update the Summary, "How to read the build" and the docstring of `Suggested.lean` to the new numbers.

## R02 (P3) — the contract says §9.6 of HigherHidaAndColemanTheory is used; no target needs it any more

**Location.** `README.md:92`: "Of §9.6 this roadmap uses the exact two-term BGG sequence of its item 4 and the slope ranges stated there, `s<k−2` (every degree) and `s<k+1` (isomorphism on `H⁰`, injection on `H¹`)."

**Claim.** A target of this roadmap consumes the sequence and the ranges of §9.6.

**Witness.** The diff removes §9.6 from the *Needs* line of §6.4 (`README.md:996`) and from the Dependencies of Layer 6 (`:1062`); no *Needs* or Dependencies line names it now. §6.4 takes its sequences from HigherHidaAndColemanTheory §6.6; only its last Check (`:1001`) mentions §9.6.

**Repair.** Replace the sentence by: "§9.6 is not a prerequisite of a target of this roadmap: its exact two-term BGG sequence (item 4) and its slope ranges `s<k−2` (every degree) and `s<k+1` (isomorphism on `H⁰`, injection on `H¹`) are the case `F = ℚ`, `I = {p}` with which the last Check of §6.4 compares that target." Keep the sentence on the intertwining that follows, and in the row `K2/bgg-scaling` (`:28`) write "§6.4 (compared with HigherHidaAndColemanTheory §9.6 in its last Check)".

## Previous findings

- R01 — repaired: "For rationals `0 < ε_v ≤ 1/p` at every v, so that `X((ε_v)_v)` lies in the locus where `deg_v ≥ 1 − 1/p` at `v ∈ I` and `deg_v ≥ 2 − 1/p` at `v ∈ Iᶜ`" (`README.md:939`), with a Check and a Source issues bullet.
- R02 — repaired: "pullback to the height-one tower followed by the highest-weight projection `ω^κ → Ω^κ` of §4.2 is a quasi-isomorphism from `e(U^I)RΓ` … with the full coefficient `ω^κ(−D)` to the derived `δ_κ`-fibre of `M_I`" (`:743`).
- R03 — repaired: "The intertwining from which those ranges follow is not imported … §6.4 states this identity at each place" (`:7`); likewise `:92`, `:1001`, `:1494`. The repair leaves §9.6 with no consumer (R02 of this report).
- R04 — repaired: "Fréchet–Stein algebras over a complete discretely valued field and their coadmissible modules in general are LocallyAnalyticDistributionsPartII §1.4" (`:13`); `:15`, the contract (`:251`) and the *Needs* of §7.1 (`:1072`) agree; PadicLocalLanglandsForGL2Qp is no longer named.
- R05 — partly repaired: `:11` now reads "the Hilbert–Siegel higher Coleman families with their comparison to the partial-ordinary complexes at at most one Klingen place (Layers 4–6)"; the layers and sections are as before (R01 of this report).
- R06 — repaired: "Were `ker Δ` nonzero, after extending scalars it would contain a line on which `U_{w,2}` is a scalar u and C a scalar ξ, both nonzero" (`:895`); longest run shared with BCGP21 lines 6535–6545 is two words.
- R07 — repaired: `### 2.8 The dimension-one case` (`:454`, conclusion stated in full, *Needs* §2.7) precedes `### 2.9 Small-slope classicality` (`:466`, *Needs* §2.7; §2.8); Summary, `:482`, `:1472` and the docstring of `Suggested.lean` use the new numbers.
- R08 — repaired: "a point of the étale-ordinary tube `δ = 0` is reached after h steps, one per place (BPS §4.5, HAL p. 26)" (`:452`); the statement says "iterating over the places" (`:444`).
- R09 — repaired: "N is the product of the primes `ℓ ≠ p` with `K_ℓ ≠ GSp₄(ℤ_ℓ)` (P20 §15.2, p. 107)" (`:490`).
- R10 — repaired: "(BCGP21, the matrix before Lemma 5.8.2, p. 133, and its inverse in the proof of Lemma 5.8.3, pp. 133–134)" (`:859`).
- R11 — repaired: the description lists LocallyAnalyticDistributionsPartII and LocallyAnalyticRepresentationsOfLocalGroups among the open suppliers and says "Not yet in a pull request: HigherHidaAndColemanTheory."
- R12 — repaired: "`Suggested.lean` states no declaration: none of the headline theorems is statable at the pinned Mathlib and Tau Ceti"; "the targeted Lake build succeeds with no warning".

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §6.1 comparison map, range of radii | `p = 3, 5`; `v ∈ I`, `v ∈ Iᶜ`; BCGP21 lines 7471–7477, 7496–7499; P20 lines 4207, 4237 | `ε = 1/3`: `deg ≥ 2/3`, `≥ 5/3`; `ε = 1/5`: `deg ≥ 4/5`; P20 needs `deg ≥ 1 − 1/p`; `ε₁ = 1/2`, `3/4` | agrees | none |
| §4.7 derived ordinary control | `k_v − l_v = 2`; BCGP21 lines 5147–5150, 5663 | source of the map has `ω^κ(−D)`, `Sym²` factor of rank 3; target the fibre of `M_I`; part (3) is Lemma 4.6.25 | agrees | none |
| §6.4 relative BGG, with the import of §9.6 | `k = 3`; P20 line 4140; AIP15 line 1520; BCGP21 line 7417; supplier item 4 | P20 and supplier print `p^{−k−1}U`; AIP15 `ΘU = p^m UΘ`; `−3 + 4 = 1 = k − 2`, `0 + 4 = k + 1` | agrees; contract overstated | R02 |
| §5.6 companion operator, inverse | `T = 5`, `U = 6`, `(x, y) = (2, 3)`; BCGP21 lines 6443–6446, 6475–6479 | `C(2,3) = (28, −2)`; inverse gives `(2, (28 − 10)/6) = (2, 3)`; both composites identity without commutation | agrees | none |
| §5.8 doubling injection, route | `ξ = 3`, `u = 6` | `f = −3g`; `U_Kli f = (3 + 2)f`; `Zf = 3f`; `U_Iw f = (5 − 3)f = 2f`; `αβ = 6 = u` | agrees | none |
| §2.7 continuation, step count | Siegel threefold (`h = 1`, `d a = 2`); two places with `d a = 1`; BPS lines 1123–1131, 1267–1271 | `]1,2] → [0,2]`: 1 step, walls 1 and 0 would give 2; `]0,1]² → [0,1]×]0,1] → [0,1]²`: 2 steps | agrees | none |
| §2.8 dimension-one case (sampled) | modular curve; compact Shimura curve; BPS lines 1331–1356 | `n = 1`, `c = k`: slope `< k − 1`; Theorem 5.3.1 and Remark 5.3.2 on printed p. 31 | agrees | none |
| §2.9 small-slope classicality | Siegel threefold `κ = (6,6)`, `(k₁, 3)` | `c = 6`, `n = 3`: slope `< 3`; `k₂ = 3`: `s < 0`, none | agrees | none |
| §3.4–3.5 level and N | P20 lines 4867–4869 | `K = ∏ K_ℓ`; N the product of ℓ with `K_ℓ ≠ GSp₄(ℤ_ℓ)`; §15.2 on p. 107 | agrees | none |
| §7.1 Fréchet–Stein import (sampled) | LocallyAnalyticDistributionsPartII §1.4 at its open head, `README.md:196–206` | supplier: K complete nonarchimedean, not necessarily discretely valued; left noetherian stages, flat transitions; sequence-independence, exactness, abelian category | agrees | none |
| Layers 4–6 against BCGP21 §§4–6 | BCGP21 lines 56–80 | layer and section pairs as in R01; no heading moved in the diff | disagrees | R01 |

The rows of the previous review, of `88b66ee`, for the statements the diff does not touch stand as they are.

- Source locators checked against the texts this round: 17 (BCGP21 8, P20 6, BPS 2, AIP15 1), every one at the theorem number and page the README gives; of the seeded sample, §2.8, §5.8 and §7.1 fall in changed passages and were checked.
- Cross-roadmap citations resolved: LocallyAnalyticDistributionsPartII §§1.4 and 2.5 at its open head; HigherHidaAndColemanTheory §§6.6, 9.6 (item 4), 9.7 in its board package. No other roadmap cites §2.8, §2.9, §4.7, §5.8 or §6.4 of this one.
- Gate at this head: every check passed (`build=0` in the worker's run; rerun here with all counters 0). Dependency check: `depcheck: 239 roadmaps, 2174 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: exit 0, no output. The file declares nothing, so the `#check` comparison and the one-tactic probe have no subject; the diff changes one docstring line (the two section numbers).
- Nothing outside the roadmap folder changes; the description's prose agrees with the head (suppliers, the dropped PadicLocalLanglandsForGL2Qp, the Lean file).
- Remark: the generated `merge-order` block of the description still ends "… #1823 (AutomorphicBundlesPartII) → this pull request" and omits the open suppliers LocallyAnalyticDistributionsPartII and LocallyAnalyticRepresentationsOfLocalGroups, which the `depends-on` block lists.
- Remark: item 4 of HigherHidaAndColemanTheory §9.6 still words the intertwining with `p^(−k−1)U`; the correction belongs to that package.

Overlap check: the diff moves no ownership except the Fréchet–Stein import, now LocallyAnalyticDistributionsPartII §1.4 (read at its open head, owner confirmed); for GSp4NonregularModularityLifting, AutomorphicBundlesPartII, AlgebraicModularFormsAndSerreWeightsPartII, OverconvergentAutomorphicForms and PerfectoidShimuraVarieties the previous review's result stands and was not read again.

Source independence: changed passages only; 6 passages compared with 4 sources (BCGP21, P20, BPS, AIP15), none shared (longest common run two words, in the route of §5.8); largest share BCGP21 (94 of 237 locators at `88b66ee`; the diff adds 4 BCGP21, 2 P20 and 2 BPS locators); contents compared with BCGP21: the diff adds, removes and reorders no layer, and Layers 4–6 map onto its §§4–6 as before (R01).

## Not verifiable

- HigherHidaAndColemanTheory is on neither main nor an open pull request; its sections were read in the board package, which is still under review and may change.
- BP26: cited once, through HigherHidaAndColemanTheory; its text was not opened.
- The Source issues bullets of the README other than the two the diff touches (P20 Proposition 13.3.3.1 with BCGP21 §6.4; BCGP21 §6.5.3) were not rechecked.
- Ownership of weight-two doubling against GSp4NonregularModularityLifting §4.2 was not compared statement by statement.

## Source issues

- **Error** in BCGP21 at §6.5.3 and Lemma 6.5.4, p. 155: the source says the degree neighbourhoods of radius at least `1 − 1/p` (respectively `2 − 1/p`) lie in the Hodge–Tate neighbourhood; it should be radius at most `1/p`, its §6.5.2 measuring from the multiplicative end; affects a stated result.
- **Error** in BCGP21 at §6.4, proof of Corollary 6.4.3, p. 154: the source says the second operator applied after the differential is `p^{k_v−l_v+1}` times the reverse composite; it should be the differential after the operator, as in AIP15 Proposition 7.2.3; affects the proof.
- **Misprint** in P20 at Proposition 13.3.3.1, p. 90: the source says the operator on the last term of the BGG sequence matching U is `p^{−k−1}U`; it should be `p^{k+1}U`, as AIP15 Proposition 7.2.3 and Corollary 13.3.3.1 require; affects nothing.

## For the human reviewers

- **Scope.** BCGP25 (arXiv:2502.20645v1, 2025) is cited as a preprint with no journal reference (`README.md:1483`); Layers 7–9 take 86 of the 237 locators from it.
- **Scope.** The base roadmap HigherHidaAndColemanTheory exists only as a board package under review; LocallyAnalyticRepresentationsOfLocalGroups and LocallyAnalyticDistributionsPartII are open pull requests. This pull request cannot merge before the three are on main.
- **Licence.** P20 locators use the author's PDF on the author's university page (113 pages), not the Duke pagination (`README.md:1481`); BP26 is cited as "author version".
