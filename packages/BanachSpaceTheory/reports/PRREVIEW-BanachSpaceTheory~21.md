# Review of BanachSpaceTheory (pull request #1854 at 9288dee)

**Verdict:** accepted

**Summary.** An incremental re-review: the folder has not changed since the previous review of `9288dee` (0 lines), so this round reads the pull request's title and description against the head. Every sentence of the description that concerns BanachSpaceTheory was checked against the README and `Suggested.lean` and none is contradicted; no change a reader must know of is left unstated. Accepted, with no finding, no small correction and no format note. One point is left for the human reviewers: the most-cited textbook could not be read.

## Previous findings

The previous review, of this same head, had no finding, no small correction and no format note; there is nothing to account for.

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| B6.Cotype2 exclusion of cotype `q < 2`, type `p > 2` (cited by the description as differing from main) | family `(y, …, y)`, `n = 0, 2, n → ∞`; `rademacherSecondMoment` at `Suggested.lean:222` | `n = 2`: `(4 + 0 + 0 + 4)‖y‖²/4 = 2‖y‖²`, so `R₂ = √n‖y‖`; cotype side `n^(1/q)‖y‖ ≤ C√n‖y‖` fails for `q < 2`; `n = 2`, `C = 2`: holds for `q ≥ 2/3`; `n = 0`: `0 ≤ 0` | holds; two-point family excludes only small constants, as the description says | none |
| `dvoretzky` restated without `ε < 1` (description) | signature at `Suggested.lean:288–289`; `T = 0`, `ε = 1/2`, `‖x‖ = 1` | binders `¬ FiniteDimensional ℝ E`, `n`, `0 < ε` only; `1/2 ≤ 0` false, so not trivial | agrees with README §7.3 and the description | none |

The rows of the previous review, of `9288dee`, stand for every statement: the diff changes none.

- Description against the head, counted: 41 *In Tau Ceti:* lines naming 188 distinct declarations; 24 theorems and the two definitions `rademacherSecondMoment` and `HasCotype` in `Suggested.lean`; 17 declarations dropped against main, 10 added, `james`, `kadec_snobar` and `dvoretzky` restated; headings `## B1.`–`## B7.` and `### B4.C.`, `### B4.0.`, `### B4.1.`, `### B5.LocalHaarDual.`, `### B6.Cotype2.` present; B4's subsections numbered 4.2–4.5.
- Description's statements that differ from main, read at the head: trace duality for reflexive or metric-approximation spaces (`README.md:1909`); the `n`-fold family (`:1777–1779`); Bellman estimates for `p ≥ 2` (`:524`, `:533`); `π₁(T) ≤ 16 ‖T‖` (`:1848`); reflexivity iff weakly compact ball with no completeness (`:323`); local reflexivity for every `ε > 0` (`:1895`). None contradicted. The quoted description is cut after these; what follows the cut was not read.
- Suppliers: the description's list of Tau Ceti inputs matches `### From Tau Ceti` (`:2155–2204`); PseudodifferentialOperators Layer 5 added (`:2221`), SelfAdjointSpectralTheory no longer a supplier (it appears only under Downstream consumers, `:2093`), both stated. OperatorIdeals, AmenableGroups, PDE and PseudodifferentialOperators are on main, as the description says.
- Cross-roadmap citations: none unresolved on main or at the open heads. Pull request #3027 still conflicts with this head in the README; the description states the order (this one first).
- Automatic checks: every check passes at this head. Dependency check: `depcheck: 129 roadmaps, 1441 edges, 0 problem(s)`, no UPWARD or CYCLE line. No change outside the pull request's own folders.
- Lean: `lake env lean` on `Suggested.lean` gives 24 `declaration uses sorry` warnings and nothing else; single `import Mathlib` plus six `TauCeti.*` modules, no `set_option`, no sorry'd data. The one-tactic probe was not rerun: no declaration changed since the previous review.
- Source locators: none reread; the diff is empty and the seeded sample falls in no changed passage.
- Overlap check: read BochnerSpaces, VonNeumannAlgebras, SchattenClassesAndSchurMultipliers (open), SNumbers, VariationalMethods, BanachAlgebras (main), as in the previous review; the reflexive-target density theorem of B4.0 is shared with BochnerSpaces §7 and SchattenClassesAndSchurMultipliers, both of which cite BanachSpaceTheory B4.0 as owner; nothing else shared.

Source independence: changed passages only; 0 passages compared with 0 sources (the diff is empty); largest share albiackalton06, about 12 of 80 locator-bearing lines, text not readable; contents not compared: the diff adds, removes and reorders no layer.

Research link: B4.0 and B4.1 state Enflo (1973) and Argyros–Haydon (2009, scalar-plus-compact); B6 is Grothendieck's theorem as surveyed by Pisier (2011); B7 is the local theory of John and Dvoretzky. SNumbers, BanachAlgebras A8 and SelfAdjointSpectralTheory consume them. Rests on the README's sources and its downstream-consumers section.

## Not verifiable

- `megginson98` (§§1.2, 2.1–2.5, 3.2, 4.2): uncertified, no text in the cache; cited by theorem number only.
- `albiackalton06` (§§3.5, 5.7, 6.1, 6.2, 7.1–7.3): uncertified, no text in the cache.
- `conway90`, `ryan02`, `hewittross63`, `garlinggordon71`, `enflo73` and Pietsch 1.7.17: uncertified or without a readable copy; untouched by this change.
- The part of the pull request's description after the cut of the quoted text: not read.

## Source issues

- none

## For the human reviewers

- Not tested: Albiac–Kalton, *Topics in Banach Space Theory* has the largest share of the README's locators (about 12 of 80 lines) and is recorded as uncertified with no readable text; wording and arrangement were not compared with it.
