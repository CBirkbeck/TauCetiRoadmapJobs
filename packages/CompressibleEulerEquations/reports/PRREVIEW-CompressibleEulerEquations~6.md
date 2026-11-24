# Review of CompressibleEulerEquations (pull request #2442 at aea6db3)

**Verdict:** accepted

**Summary.** Accepted: no finding at this head. This is an incremental re-review of the 28 lines of `TauCetiRoadmap/CompressibleEulerEquations/README.md` changed since `4ae1090`: a new paragraph of §8.1 on data posed on closed sets, and three bullets of Downstream consumers that now send the comparison with closed data sets, the acoustical functions and the characteristic-data theorems of Luo–Yu to CompressibleEulerEquationsPartII. The new mathematical claim (two solutions on a slab with the same data on `S` agree up to the boundary of `D⁺_O({t₀} × S)` in the slab) follows from §8.3, the four new locators are right, and every cited section of Part II exists at its open head with the stated content. There is one small correction (the pointer in §8.1 names the closed set `F` where the comparison it points to is with `closure (int F)`) and one format note carried over; neither blocks. Two points remain for the human reviewers (Majda1984 could not be read; LukNotes is unpublished).

## C01 — The pointer in §8.1 promises a comparison with the domain of dependence of `{t₀} × F`; the passage it points to compares with `{t₀} × closure S`, which is `F` only when `F` is the closure of its interior

A reader who follows the pointer from §8.1 with a closed `F` that is not the closure of its interior finds no statement about `F`. The new paragraph (README.md:1867–1873) admits any Λ-invariant closed `F` with nonempty interior, sets `S = int F`, and ends "the comparison with the domain of dependence of the closed set `{t₀} × F` is under Downstream consumers, below". The Downstream bullet (README.md:2168–2172) and CompressibleEulerEquationsPartII §2.1 at its open head state the comparison for an open `S` with `interior (closure S) = S` and the closed set `{t₀} × closure S`. For `n = 1` and `F = {−1} ∪ [0, ∞)`: `S = (0, ∞)`, `closure S = [0, ∞) ≠ F`. (`S = int F` is always regular, so the hypothesis of Part II is met; only the closed set differs.) Nothing stated becomes false: the paragraph's own claim, agreement on the closure of `D⁺_O({t₀} × S)` in `O`, does not use `F`.

The text that would be right, at README.md:1872–1873: "the comparison with the domain of dependence of the closed set `{t₀} × closure S` (which is `{t₀} × F` when `F` is the closure of its interior, as for `{x¹ ≥ 0}`) is under Downstream consumers, below".

## N01 — LorentzianGeometry §8.1 is named in three places but has no line in the supplier contracts

The Conventions, §3.1 and Scope and ownership name LorentzianGeometry §8.1 for the orientation by `[B]`, while "From TauCetiRoadmap.LorentzianGeometry" (README.md:2569–2598) lists §6.1, §6.3, §7.3, §8.2 and §12.6 only. Nothing of §8.1 is consumed, so a clause in the §7.3 contract line saying that §8.1 is named for comparison only would save a reader the search.

## Previous findings

The previous review, of `4ae1090`, had no finding (no R01). Its small correction and format note:

- C01 (the description called MathematicalStatisticsNonparametric "still open") — repaired: the description now reads "PDE, ComplexKahlerGeometry and MathematicalStatisticsNonparametric, on main, and RelativisticQuantumFieldTheory, still open, are named only to mark scope boundaries".
- N01 (LorentzianGeometry §8.1 absent from the supplier contracts) — not repaired: the subsection still lists §6.1, §6.3, §7.3, §8.2, §12.6; written again as N01 above.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §8.1, new paragraph: two classical solutions on a slab `O` with the same data on `S = int F` agree on the closure of `D⁺_O({t₀} × S)` in `O` (README.md:1867–1873) | `n = 1`, `p = ρ²`, `ρ = 1/2`, `v = 0`, `t₀ = 0`, `F = [0, ∞)`, `S = (0, ∞)` | `c² = 2ρ = 1`; `D⁺_O = {x > t}`, closure in `O` `{x ≥ t}`, boundary `{x = t}`; tangent `(1, 1)`: `g = −1 + 1 = 0`, null | holds: §8.3 applied to each solution gives equal `D⁺_O` and equality on it; continuity on `O` gives the closure | none |
| The same, negative control | counter-flow of §8.2: second solution differing on `x < t` | at `(2, 0)`: velocities `2` and `−2`; point outside `{x ≥ t}` | no agreement claimed off the closure; consistent with §8.2 | none |
| §8.3 slab statement, cited by the new paragraph (`EquationOfState.isDevelopment_slab`, Suggested.lean:482) | second solution `U′` with `hdata`; `S = {x¹ > 0}` constant state | Lean: development, and every development `D ⊆ O` has `D ⊆ D⁺_O` and `EqOn U U′ D`; README Check: `{x¹ > (v₀¹ + c₀)(t − t₀)}` | README and Lean agree; supports the cited use in both directions | none |
| §8.1 pointer to the closed-set comparison (README.md:1872–1873, 2168–2172) | `F = {−1} ∪ [0, ∞)`; `F = {x¹ ≥ 0}` | `int F = (0, ∞)`, `closure S = [0, ∞) ≠ F`; half-space: `closure S = F` | pointer names `F`, target states `closure S` | C01 |
| Downstream, Part II bullet: its §2.1 for regular open `S` | Part II §2.1 at its open head; its Check `S = (−1, 0) ∪ (0, 1)` | Part II: `interior (closure S) = S`, `D = interior Ď` in `{t > t₀}`; non-regular `S`: `D = {|x| < 1 − t} ∖ {|x| ≤ t} ≠ interior Ď` | as cited | none |
| Downstream, shock bullet: Part II Layers 1–2 | Part II headings and its Downstream consumers | §1.2 outgoing acoustical functions, §1.3 acoustical coordinates, §2.3 eikonal description; Part II names Layers 1–2 for the shock papers | as cited | none |
| Downstream, rarefaction bullet: Part II §3.3, Layer 4; Luo–Yu locators | LuoYu2023a line 1458; LuoYu2023b lines 745, 769, 658–660 | Main Theorem: data on a slice `t = δ` part and on `C₀`; Corollary 1: solution on `𝒟(δ)`; Theorem 2: rarefaction waves on `𝒲` matching on `C₀`; Part II §3.3 names `𝒟(δ)` on `Σ_δ ∪ C₀` | as cited | none |
| Description, summary block and prose | each sentence against the head | fourteen theorems (14 `sorry` warnings); suppliers LorentzianGeometry, SymmetricHyperbolicSystems open; MathematicalStatisticsNonparametric on main | agrees | none |

The rows for the untouched statements stand as in the previous review, of `4ae1090`; `Suggested.lean` is unchanged since that head.

- Source locators read against the text: 4 new (LuoYu2023b lines 658–660, 745, 769; LuoYu2023a line 1458) and 3 older ones of §8.1 (ChristodoulouMiao2014 lines 864–880; LuoYu2023b lines 417–419 and 910); all support the text. The README flags no locator as unverified.
- Seeded sample: of the sampled targets only §8.1 lies in a changed passage; §8.3 is cited by it and was read with its Lean statement.
- Cross-roadmap citations resolved at the open head of CompressibleEulerEquationsPartII: §2.1, §3.3, Layers 1–2, Layer 4; its supplier contract from this roadmap lists §§1.1–1.3, 2.1–2.2, 3.1–3.3, 6.1–6.2, 7.1–7.3, 8.1–8.4, as the bullet here says. Part II is named as a consumer only; no `*Needs:*` line names it.
- Dependency check: `depcheck: 131 roadmaps, 1464 edges, 0 problem(s)`; no UPWARD or CYCLE line. The automatic checks all pass. The diff outside the folder is empty.
- Elaboration of `Suggested.lean`: 14 `declaration uses sorry` warnings (lines 257–535) and nothing else; no `set_option`. No statement changed, so the `#check @name` comparison and the one-tactic probe of the earlier reviews stand.
- Duplication: the change adds no object, layer or declaration; it hands the closed-data comparison to Part II, whose Scope and ownership lists it as its own.
- Pull request text: title and description read against the head; no sentence is contradicted, and the roadmap is new, as stated.

Overlap check: read CompressibleEulerEquationsPartII, LorentzianGeometry, SymmetricHyperbolicSystems, IncompressibleFluids, PDE, SobolevPolynomialApproximation, YangMillsConnectionsAndCaloricGauge (scopes as read for the earlier heads; CompressibleEulerEquationsPartII read again at its head). The comparison of open-data developments with domains of dependence of closed sets, acoustical functions and coordinates, characteristic data and centered rarefaction waves are Part II's, named here as consumer subjects only. The acoustical form, causal curves and domains of dependence in subsets are LorentzianGeometry's, cited. Linear systems are SymmetricHyperbolicSystems', cited. Nothing else is shared.

Source independence: changed passages only: 4 passages compared with 2 sources (LuoYu2023b lines 656–660, 745–749, 769–776; LuoYu2023a lines 1458–1464), none shared; largest share Majda1984, 18 of 117 locators (113 at the previous head and the four the change adds), whose text and contents could not be read; the arrangement was not compared again, the diff adding, removing and reordering no layer.

Research link: §7.2 and §§8.2–8.4 are the well-posedness, maximal-development and null-boundary statements on which Christodoulou–Miao 2014, Luk–Speck 2018, Abbrescia–Speck 2022 (shock formation) and Luo–Yu 2025 (rarefaction waves) pose their theorems; §8.2 takes up Eperon–Reall–Sbierski 2019 on non-unique maximal developments. Rests on the README's Downstream consumers and the cached texts.

## Not verifiable

- Majda1984, Kato1975 and Dafermos2016: uncertified, no legal text; no changed passage cites them.
- Friedrichs1954, Christodoulou2007, HawkingEllis1973 and ONeill1983: waived, cited by locator alone; the changed shock bullet names Christodoulou2007 without a locator.

## Source issues

- **Gap** in ChristodoulouMiao2014 at §2.1.2, printed pp. 24–25: the source says two developments of the same data agree on the whole intersection of their domains, so the union of all developments is the unique maximal one; it should be that they agree on the points whose acoustical causal past lies in both domains, uniqueness of a maximal development needing a separate argument; affects a stated result.

## For the human reviewers

- **Not tested.** Majda1984 holds the largest share of locators (18 of 117, `TauCetiRoadmap/CompressibleEulerEquations/README.md`). Its text and table of contents could not be read legally, so wording and arrangement were not checked against it.
- **Licence.** LukNotes is unpublished lecture notes read from the author's page (manifest `licence_class` author-page). It is cited for standard facts in README.md §§4.2, 4.3, 5.1–5.4, 6.1 and 7.1.
