# Review of ApproximationSpaces (pull request #3203 at ad8e9d5)

**Verdict:** accepted

**Summary.** Accepted: the folder is unchanged since the review of `bf314fd`, which accepted it, and the title and description of the pull request, read this round against the head, say nothing about this folder that the head contradicts. There are four small corrections (three carried, one on the description's count of commits) and three carried format notes, none blocking. The human reviewers have the licence question of the Provenance section; Bergh–Löfström and DeVore's survey were read this round, so the earlier note that the most-cited source was not tested no longer applies.

## C01 — AS-A12 and AS-A17 cite DeVore–Popov 1988 for general schemes without saying that the source treats dyadic splines

Theorem 5.1 and Corollary 5.3 of DeVore–Popov are for dyadic splines of order `r` on the cube, and Corollary 5.3 is phrased in B-spline coefficients. The abstract statements of AS-A12 (line 203) and AS-A17 (line 260) are this roadmap's generalisation by the same argument. AS-A16 and AS-B10 say "for dyadic splines" and "for splines"; the same two words at AS-A12 and AS-A17 would do.

## C02 — `complexity`, `eFunctional` and `eFunctional_complexity` serve no headline statement

Their only use in `Suggested.lean` is `eFunctional_complexity` (line 329), which says that two definitions agree (`complexity y ≤ n` exactly when `y ∈ A n`). If it is kept as a sanity check that the E-functional of AS-B05 specialises to `E_n`, its docstring would say so.

## C03 — Six headline statements give membership only, where the README claims equivalent quasi-norms

AS-A12, AS-A13, AS-A17, AS-B06, AS-B07 and AS-B10 each end "with equivalent quasi-norms" in the README, while the Lean statements say only that one side is finite exactly when the other is. The two-sided bound is statable in the form of `exists_approxNorm_equiv` (`∃ C ≠ ⊤, ∀ f, … ≤ C * … ∧ … ≤ C * …`); for AS-B06 it then also needs the bound `N_X (ι y) ≤ C N_Y y` of AS-A09.

## C04 — The description counts one commit on each side where the branch has three and two

The description says "Its own commit touches only `TauCetiRoadmap/ClassicalApproximationSpaces/`; the branch also carries the commit of #3202". At this head the branch has three commits on ClassicalApproximationSpaces and two on ApproximationSpaces (the roadmap and its repair after the first review). The substance holds: the three touch only ClassicalApproximationSpaces, and the ApproximationSpaces folder is file for file the head of the pull request that adds it. "Its own commits touch only …; the branch also carries the commits of #3202" would be exact.

## N01 — The thirteen theorem names of `Suggested.lean` do not appear in the README

Only `eLpNorm_add_rpow_min_le` is named at its target; naming the others at their targets (AS-A02, AS-A05, AS-A12, AS-A13, AS-A15 to AS-A17, AS-B05 to AS-B07, AS-B10) lets a reader match prose and Lean.

## N02 — Import and docstring form

The file has `module` and `public import Mathlib` where the house form is the single line `import Mathlib`, and its docstring says that the declarations are public so that another roadmap's `Suggested.lean` imports them. The docstring also says the file "states some of the roadmap's targets"; all six headline theorems of the summary are stated, and it would say so.

## N03 — "On Tau Ceti `main`, newer than the Tau Ceti pin of this repository" dates the text

The sentence (AS-B01, line 293, and the Tau Ceti contract, line 490) is true only until the pin moves. A timeless form: "not at the Tau Ceti pin; NoncommutativeIntegration §2.2 and §2.4 specify them".

## Previous findings

The review of `bf314fd` had no finding (its R01 to R03 of the round before were repaired there, and the folder has not changed since). Its small corrections C01 to C03 and format notes N01 to N03 are unchanged at this head and are written again above.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| AS-A16 in Lean (`exists_besovENorm_le_of_nikolskii`), cited by the description as "Nikolskii's embeddings" | one point of mass 1, `A_n = ℂ` for `n ≥ 1`; two points of mass 1/2; `p = r = ∞`; `r = ∞`, `p < ∞` | `E_{2^k} = 0`, both sides `‖f‖`, `K = 1`; `‖f‖_r ≤ ‖f‖_∞ ≤ 2^{1/p} ‖f‖_p`, `K = 2^{1/p}`; `toReal ∞ = 0` gives `α = 0`, `n^{D/0} = 1`; `α = D/p` | true | none |
| Description: "consumes the approximation schemes, the Besov spaces of a scheme with Nikolskii's embeddings and the real interpolation of quasi-normed couples" | headings of this README | AS-A03; AS-A14 with AS-A15, AS-A16; Part B (AS-B01 to AS-B10) | all present | none |
| Description: "its `Suggested.lean` imports that roadmap's" | `TauCetiRoadmap/ClassicalApproximationSpaces/Suggested.lean` line 9 | `public import TauCetiRoadmap.ApproximationSpaces.Suggested` | holds | none |
| Description: the folder is carried from the pull request that adds it | README and `Suggested.lean` against that pull request's head `8f70654` | 0 differing lines in each | holds | C04 (count of commits) |
| AS-B04 locator | Bergh–Löfström, Theorems 3.5.3 and 3.11.5 | 3.5.3: normed couples, `1 ≤ q ≤ ∞` (line 1646); 3.11.5: quasi-normed Abelian groups, complete, `θ₀ ≠ θ₁` (line 2081) | supports the statement | none |
| AS-B03 locator | Bergh–Löfström, Theorem 3.6.1; notes to Chapter 3 | 3.6.1: normed, `1 ≤ q_i ≤ ∞` (line 1685); notes: Holmstedt has the quasi-normed case, `0 < q_i ≤ ∞` (line 2598) | supported by the primary source cited first | none |
| AS-B06, AS-B07, AS-A13 locators | DeVore 1998, Theorems 1, 2, 4 | Thm 1: `A^γ_q = (X, Y)_{γ/r,q}`, `0 < γ < r` (line 1510); Thm 2: `Y = A^r_s`, every `s` (line 1528); Thm 4: `ℓ_{τ,q}`, `1/τ = α + 1/2` (line 1860), `q = τ` gives `ℓ_τ` | match | none |

The rows for the untouched statements stand as in the previous review, of `bf314fd`.

- Source locators checked against the text: 9 (Bergh–Löfström: Lemma 3.1.3, Theorems 3.5.3, 3.6.1, 3.11.5, §3.11, Definition 7.1.5; DeVore 1998: Theorems 1, 2 and 4). Theorem 4 of DeVore stands in his §5, not §4.3; the README cites it by number only.
- Cross-roadmap citations: none found nowhere; the 20 Lean names found nowhere are the Tau Ceti K-method names the README says are not at the pin and the names of the Provenance section, which says they belong to the external repository.
- Dependency check: `depcheck: 94 roadmaps, 1055 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with 13 `sorry` warnings, all on theorems, and nothing else.
- Changes outside the two folders of the pull request: none.
- Pull request text: title and description read against the head; every sentence about this folder holds (rows above), apart from the count of commits (C04). The title names only ClassicalApproximationSpaces; the description states that this folder comes with the pull request it depends on.
- Overlap check: read NoncommutativeIntegration, SNumbers, PolynomialInterpolationAndBestApproximation; the Banach K-method is NoncommutativeIntegration's (§2.2, §2.4) and is cited; Bernstein and approximation numbers are SNumbers'; the uniform polynomial `Eₙ(f)` of PolynomialInterpolationAndBestApproximation §2.1 is a concrete distance. Nothing has two owners. The other open pull request that changes this roadmap is the one that adds it; the two heads carry the same files and merge cleanly.

Source independence: changed passages only: the folder has no changed passage; 9 locators and their surrounding README sentences compared with 2 sources (Bergh–Löfström 1976, DeVore 1998), none shared; largest share Bergh–Löfström, about 8 of 23 locators; contents compared with Bergh–Löfström: independent (Part A has no counterpart there; Part B takes Holmstedt's formula before reiteration and the quasi-normed case first, against §3.5, §3.6, §3.11 there).

Research link: The headline targets are Pietsch's approximation spaces (1981) and the interpolation and embedding theorems of DeVore–Popov (1988) for `p < 1`, used in nonlinear approximation (DeVore 1998) and in heat-kernel Besov theory (Kerkyacharian–Petrushev 2015); this rests on the README's references and on the DeVore–Popov and Kerkyacharian–Petrushev texts read.

## Not verifiable

- That the `CompatibleCouple` declarations exist on Tau Ceti's main branch: only the pin was read, and they are not there.
- Pietsch 1981, §1 (AS-A03, AS-B06): paywalled; no legal copy found.
- Holmstedt 1970, Kalton–Peck–Roberts 1984, DeVore–Popov 1988 and LNM 1302: no legal copy read; Holmstedt's range is taken from Bergh–Löfström's notes to Chapter 3.
- The Lean-FunctionSpaces repository named in the Provenance section was not opened.

Automatic checks set aside as false positives: the TeX-syntax scan flags the display of Holmstedt's formula in AS-B03, which is an indented code block; the scan for names presented as this roadmap's own flags three names of the Provenance section, which says that every name there is a declaration of the external repository.

## Source issues

- none

## For the human reviewers

- **Licence.** The README's Provenance section says a large part of the roadmap is formalised in the author's own repository Lean-FunctionSpaces (Apache 2.0); `Suggested.lean` may be adapted from it. The repository was not opened or compared.
