# Review of CompressibleEulerEquations (pull request #2442 at 26699db)

**Verdict:** accepted

**Summary.** Accepted: no finding at this head. This is an incremental re-review of the 127 lines changed since `aea6db3`: the citations of LorentzianGeometry in `TauCetiRoadmap/CompressibleEulerEquations/README.md` and in three docstrings of `Suggested.lean` now follow that roadmap's renumbering (its former §§6.1–12.7 are §§1.1–7.7), and the pointer of §8.1 names the closed set `{t₀} × closure S`. Each of the ten renumbered sections was read at the open head of LorentzianGeometry and states what is cited from it; no mathematics changed. One format note is carried over and does not block. Two points remain for the human reviewers (Majda1984 could not be read; LukNotes is unpublished).

## N01 — LorentzianGeometry §3.1 is named in three places but has no line in the supplier contracts

The Conventions (README.md:150), §3.1 (README.md:423) and Scope and ownership (README.md:2264) name LorentzianGeometry §3.1 for the orientation by `[B]`, while "From TauCetiRoadmap.LorentzianGeometry" (README.md:2570–2598) lists §1.1, §1.3, §2.3, §3.2 and §7.6 only. Nothing of §3.1 is consumed, so a clause in the §2.3 contract line saying that §3.1 is named for comparison only would save a reader the search.

## Previous findings

The previous review, of `aea6db3`, had no finding (no R01). Its small correction and format note:

- C01 (the pointer in §8.1 named `{t₀} × F`) — repaired: "the closed set `{t₀} × closure S` (which is `{t₀} × F` when `F` is the closure of its interior, as for `{x¹ ≥ 0}`)" (README.md:1873–1874), as the Downstream bullet and CompressibleEulerEquationsPartII §2.1 state it.
- N01 (the time-orientation section of LorentzianGeometry absent from the supplier contracts) — not repaired: the subsection lists §1.1, §1.3, §2.3, §3.2, §7.6; written again as N01 above, with the new number §3.1.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §3.1 with LorentzianGeometry §2.3 (acoustical form, `det g = −c²`, `g(B, B) = −c²`) | `n = 1`, `c = 1`, `v = 2`, the third Check of §2.3 there | Gram `[[3, −2], [−2, 1]]`, det `3 − 4 = −1 = −c²`; `g(B, B) = 3 − 8 + 4 = −1`; frame `(τ, ξ) ↦ (cτ, ξ − τv)` has det `c = 1`, `c²·(−1) = −1` | both sides agree; §2.3 is the acoustical section at that head | none |
| §3.1 covector classification with LorentzianGeometry §1.3 (hyperplane trichotomy by the sign of `g⁻¹(ζ, ζ)`) | `c = 2`, `v = 0`, `ζ = dt`; `c = 1`, `v = 0`, `ζ = dt − dx` | `g⁻¹(dt, dt) = −1/4 < 0`, spacelike, and `|ζ₀| = 1 > 0 = c|ζ′|`; `g⁻¹ = −1 + 1 = 0`, null, and `|ζ₀| = 1 = c|ζ′|` | agree; §1.3 there has the trichotomy with `ker ξ` | none |
| Conventions: orientation by `[B]` (LorentzianGeometry §3.1, §2.3) | `c = 1`, `v = 0`, `X = (1, 1/2)` | `g(X, X) = −1 + 1/4 = −3/4`; `g(B, X) = −c²τ = −1 < 0`, future, `τ = 1 > 0` | agrees with §7.6 there (future iff `g(v, T) < 0`) and §3.1 there (quotient of timelike fields) | none |
| §3.3 and §8.3 Check with LorentzianGeometry §7.6 (`futureDomainOfDependenceIn`, slab identity) | constant state, `S = {x¹ ≥ 0}` there, `S = {x¹ > 0}` here | there `{t ≥ 0, x¹ ≥ (v¹ + c)t}`; here `{x¹ > (v₀¹ + c₀)(t − t₀)}`; at `t = t₀` both give `S`, the slice identity | consistent; §7.6 there has every cited name and statement | none |
| §8.4 comparison with LorentzianGeometry §7.7 and §4.2 | `c = 1`, `v = 0`, `n = 1`, `U = ℝ²`, `S = {0} × [−1, 1]` | `D⁺_U = {0 ≤ t ≤ 1 − |x|}`; boundary `t = 1 − |x|`, conormal `dt ± dx`, `g⁻¹ = −1 + 1 = 0`, null | as §7.7 and §4.2 state there (`du ≠ 0`, `g⁻¹(du, du) = 0`) | none |
| §8.1 pointer (README.md:1867–1874) | `n = 1`, `F = {−1} ∪ [0, ∞)`; `F = {x¹ ≥ 0}` | `S = (0, ∞)`, `closure S = [0, ∞) ≠ F`; half-space: `closure S = F` | the pointer now names `closure S`, with the parenthesis true in both cases | none |

The rows for the untouched statements stand as in the previous review, of `aea6db3`; no Lean statement changed (three docstring lines only).

- Cross-roadmap citations resolved at the open head of LorentzianGeometry, all 27 README lines citing a section and the three docstrings: §1.1 (`minkowskiForm E`), §1.3 (hyperplane trichotomy), §2.3 (acoustical form, its first Check the frame to Minkowski), §3.1 (time orientations), §3.2 (locally Lipschitz causal curves, restriction, concatenation, piecewise `C¹`), §3.3 (causal pasts in a spacetime), §4.2 (null hypersurfaces, `g⁻¹(du, du) = 0`), §6.4 (limit curves by arc length of a complete auxiliary metric), §7.6 (curves and `D⁺_D(S)` in subsets, time functions, slab identity, determination, coverings), §7.7 (limit curves and horizons for locally Lipschitz metrics). No citation with the former numbers remains.
- CompressibleEulerEquationsPartII at its open head still has §2.1, §3.3, Layers 1–2 and Layer 4 with the cited subjects; SymmetricHyperbolicSystems §1.2 and §7.3 exist at its open head.
- Source locators: the change adds none; LuoYu2023b lines 656–660 read again for the reworded pointer of §8.1. Seeded sample: of the sampled targets §3.1 lies in changed passages (rows above); §8.3 is cited by the changed pointer. The README flags no locator as unverified.
- Dependency check: `depcheck: 110 roadmaps, 1269 edges, 0 problem(s)`; no UPWARD or CYCLE line. The automatic checks all pass. The diff outside the folder is empty.
- Elaboration of `Suggested.lean`: 14 `declaration uses sorry` warnings (lines 257–535) and nothing else; no `set_option`. No signature changed, so the `#check @name` comparison and the one-tactic probe of the earlier reviews stand.
- Duplication: the change adds no object, layer or declaration.
- Pull request text: title and description read against the head; they name no section of LorentzianGeometry, the merge-order paragraph lists SemiRiemannianFoundations, LorentzianGeometry and SymmetricHyperbolicSystems, and no sentence is contradicted.

Overlap check: read CompressibleEulerEquationsPartII, LorentzianGeometry, SymmetricHyperbolicSystems, SemiRiemannianFoundations (as LorentzianGeometry's supplier of causal characters), IncompressibleFluids, PDE, SobolevPolynomialApproximation (scopes of the last three as read for the earlier heads). The acoustical form, time orientation, causal curves, null hypersurfaces and domains of dependence in subsets are LorentzianGeometry's, cited at its present numbering. Acoustical functions, characteristic data and rarefaction waves are Part II's, named as consumer subjects. Linear systems are SymmetricHyperbolicSystems', cited. Nothing else is shared.

Source independence: changed passages only: 1 passage compared with 1 source (LuoYu2023b lines 656–660), none shared; the other changed passages are section numbers of another roadmap; largest share Majda1984, 18 of 117 locators, whose text and contents could not be read; the arrangement was not compared again, the diff adding, removing and reordering no layer.

Research link: §7.2 and §§8.2–8.4 are the well-posedness, maximal-development and null-boundary statements on which Christodoulou–Miao 2014, Luk–Speck 2018, Abbrescia–Speck 2022 (shock formation) and Luo–Yu 2025 (rarefaction waves) pose their theorems; §8.2 takes up Eperon–Reall–Sbierski 2019 on non-unique maximal developments. Rests on the README's Downstream consumers and the cached texts.

## Not verifiable

- Majda1984, Kato1975 and Dafermos2016: uncertified, no legal text; no changed passage cites them.
- Friedrichs1954, Christodoulou2007, HawkingEllis1973 and ONeill1983: waived, cited by locator alone; no changed passage alters a citation of them.

## Source issues

- **Gap** in ChristodoulouMiao2014 at §2.1.2, printed pp. 24–25: the source says two developments of the same data agree on the whole intersection of their domains, so the union of all developments is the unique maximal one; it should be that they agree on the points whose acoustical causal past lies in both domains, uniqueness of a maximal development needing a separate argument; affects a stated result.

## For the human reviewers

- **Not tested.** Majda1984 holds the largest share of locators (18 of 117, `TauCetiRoadmap/CompressibleEulerEquations/README.md`). Its text and table of contents could not be read legally, so wording and arrangement were not checked against it.
- **Licence.** LukNotes is unpublished lecture notes read from the author's page (manifest `licence_class` author-page). It is cited for standard facts in README.md §§4.2, 4.3, 5.1–5.4, 6.1 and 7.1.
