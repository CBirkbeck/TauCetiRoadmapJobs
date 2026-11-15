# Review of PCurvature (pull request #1747 at 774be2e)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 774be2e: the folder is byte-identical to the head the previous review read. This round read the pull request's title and description against the head. No finding.

## Previous findings

- The previous report (on 774be2e) had no finding; nothing to account for.

## Verified sound

**Title and description against the head.** Each sentence was compared with `TauCetiRoadmap/PCurvature/` at 774be2e:

- Title: equal to the README's title (line 1).
- "adds the folder … with `README.md`, `Suggested.lean` and `metadata.toml`, and changes nothing outside it": the folder holds exactly these three files; it is not on main (3cf7342); `git diff --stat origin/main...HEAD` outside the folder is empty.
- The five layers: the description's items 0–4 match the headings at README lines 141, 274, 417, 537, 593 and their subsections (0.1–0.4, 1.1–1.5, 2.0–2.4, 3.1–3.2, 4.1–4.4); the comparison with CrystallineCohomology's quasi-nilpotence is in 1.5 (lines 390–393); "research context only" matches lines 727–733.
- Ownership and suppliers: the owned objects are those of lines 27–34; the four roadmaps and sections are those of the supplier contracts (lines 111–122) and of Scope (lines 36–39); the four Tau Ceti items are those of lines 98–107.
- README shape: Scope and ownership, Conventions (six, each with a witness), Exact supplier contracts, How to read the build, then Downstream consumers, Research context, References (lines 25, 56, 83, 129, 721, 727, 758); each of the 18 `### k.n` targets has one *Needs:* line and 3 to 10 Checks (counted mechanically).
- `Suggested.lean`: module form (`module`, `public import`, line 1–5); the headlines listed are the ones stated (0.1, 0.3, 1.4, 2.0, 2.3, 4.1, 4.3); the docstring names 1.1–1.3, 1.5, 2.1–2.2, 3.1–3.2, 4.4 as not statable, each with its missing carrier (lines 31–39).
- Sources: every work the description lists is in the References; the works it does not list (Beukers–Peters, Christol, Brunella, Berthelot, Ogus–Vologodsky) are cited in *Research context* only.
- Checks run: 11 `sorry` warnings and nothing else; `pPow` has a real body and uses the admitted theorem `iterate_leibniz` only as the Leibniz proof (lines 97–106); the gate is 0 on every check; the dependency check places PCurvature directly after FormalConnectionsOpers (candidate order lines 42, 43) with no problem.

Remark, no change asked: the description's source list is a selection, not the full reference list.

**Adversarial table.** No statement changed; the rows are for statements the description cites, recomputed this round.

| Statement | Instances | Values each side | Result |
| --- | --- | --- | --- |
| 1.4 rank-one formula `ψ = ω(D)^p + D^{p−1}(ω(D)) − ω(D^p)` (`rankOne_pCurvature_eq`) | `𝔽_p[x]`, `D = d/dx`, `ω(D) = 1`; `𝔽_p(x)`, `ω(D) = 1/x`, `p = 2, 3` | `1 + 0 − 0 = 1` (Convention 4: `+1`); `p = 2`: `x⁻² + x⁻² = 0`; `p = 3`: `x⁻³ + 2x⁻³ = 0` | holds |
| 4.3 `honda` | `a = 1/(2x)` over `ℚ`; `a = 1`; `v = 2` for `a = 1/(2x)` | odd `p`, `c = 1/2 ∈ 𝔽_p`: `(c^p − c)x^{−p} = 0`, and `2a = x′/x`; `a = 1`: `ψ = 1` at every `p`, and `n = f′/f` has no solution (`f′/f` vanishes at `∞`); junk `0` at one prime only | both sides true, both sides false; the excluded prime is harmless |
| 4.1 Kronecker (`exists_intCast_eq_of_forall_pow_sub_mem`) | `L = ℚ(i)`, `c = i`; `c = 3` | `i^p − i = 0` for `p ≡ 1 (4)`, `= −2i ∉ P` for `p ≡ 3 (4)`: hypothesis fails at infinitely many `P`; `3^p − 3 ∈ (p)` always, `n = 3` | holds, not vacuous |

All other rows stand as in the previous review, of 774be2e.

**Counts.**

- Gate (`gate … PCurvature --base origin/main` with the candidate order), run for this review: every check 0, `OK`; the worker's record for this head agrees, including `build=0`. Without the candidate order the only line is `depcheck: NOT IN ORDER: PCurvature (insert it after its last supplier)`, which is not a defect.
- Dependency check: `depcheck: 245 roadmaps, 2214 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Order: DerivedDeRhamCohomology 24, CrystallineCohomology 25, FormalConnectionsOpers 42, PCurvature 43; SchemeAndStackFoundations is on main.
- Elaboration, `lake env lean` on `Suggested.lean`: exit 0, 11 `sorry` warnings (lines 71, 97, 109, 114, 119, 138, 160, 167, 174, 200, 224), nothing else. The worker's elaborated signatures: 19 declarations, none having lost a section binder.
- Cross-roadmap citations resolved again, 9 ids: CrystallineCohomology CR.1.3 (open head, line 1121); FormalConnectionsOpers §§2.1, 2.2, 2.3 (open head, lines 668, 708, 783); DerivedDeRhamCohomology §3.6 with `DerivedDeRham.smoothCartier` (open head, lines 3899, 3912); SchemeAndStackFoundations §§0.8, 0.9, 0.29 (main, lines 1194, 1262, 2575). The two leads of the citation listing (`smoothCartier`, `schemeFrobeniusTwist`) are supplier roadmap names, found at those places.
- Source locators: none checked this round; no passage changed, so no target of the seeded sample falls in a change, and the README flags no locator as unverified.
- Headline theorems and padding: unchanged text; stated and not-statable lists as in the previous review.
- Declared gaps: none declared.

Overlap check: the three closest-roadmap lists are empty (no roadmap to read); nothing shared. No other open pull request changes this roadmap, drops an id it cites, or defines one it cites; `roadmaps grep` for p-curvature finds no second owner.

Source independence: changed passages only, 0 passages compared with 0 sources (no passage changed); largest share and arrangement not recomputed, since the diff adds, removes or reorders no layer.

## Not verifiable

- Honda 1981, Kronecker 1880, Katz 1972 and 1982, Chudnovsky–Chudnovsky 1985, André 1989 and 2004, Beukers–Peters 1984: not read, as in the earlier reviews; nothing changed cites them anew.
- The description's sentence that the author's local dependency check "finds 3 edges": the author's run is not reproducible here; this review's run finds no problem at the same placement.

## Source issues

- none

## For the human reviewers

- Licence: Fürnsinn–Pannier, arXiv:2510.00892, is a preprint; `TauCetiRoadmap/PCurvature/README.md` lines 603 and 664–666 cite its Theorems for Kronecker's theorem and the effective form of Honda's theorem, beside published sources.
- Scope: `TauCetiRoadmap/PCurvature/README.md` lines 744–748 cite Grothendieck's unpublished notes (Montpellier fonds, folder 93) in *Research context* only; no target rests on them.
