# Review of GeneralizedCohomology (pull request #2535 at 8d8d411)

**Verdict:** accepted

**Summary.** Accepted with no finding, no small correction and no format note. The folder is unchanged since the previous review of this head, which raised no finding; this round read the title and description against the head and against the change from main, and every sentence of them agrees with both. One point about ownership against two open pull requests is left for a human to decide, as before.

## Previous findings

- The previous review, of `8d8d411`, raised no finding (no R01), no small correction and no format note; the folder has not changed since (0 lines).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| Description: "F2.2 … proves that comparison for every bounded-below spectrum" | BordismFormalGroups F2.2 on main; X=Hℤ; X=KU | F2.2 (README 748–755) states it for bounded-below X and owns it. Hℤ: both completions have π₀=ℤ_p. KU: HF_p∧KU≃0, yet π₀KU^∧_p=ℤ_p. | Agrees with head |
| Description: G3.9 supplies `π_n E_(p)=π_n E⊗ℤ_(p)` and, for finitely generated `π_*E`, `π_n E^∧_p=π_n E⊗ℤ_p` (README 2422–2426) | E=Hℤ; Hℤ/q, q≠p; Hℚ | Hℤ: ℤ_(p), ℤ_p. Hℤ/q: 0=0 both. Hℚ: Ext¹ and Hom from ℤ[1/p]/ℤ vanish, completion 0≠ℚ_p; excluded by finite generation. | Agrees with head |
| Description: `rationalHurewicz` in any universe `u`, coefficients `ModuleCat.of ℚ (ULift.{u} ℚ)`, hypotheses otherwise unchanged (`Suggested.lean` 204–212) | k=0,1,2; X=S² | k=0: 2·0−2=2·0−1=0 in ℕ, nothing asserted. k=1: only n=0 spanning. S², k=2: ℤ→ℚ kernel 0; degree 3: ℤ→0 onto, kernel not claimed. Diff changes only the universe and coefficient object. | Agrees with head |
| Description: "two sentences of G3.9", no heading, supplier contract or other declaration changed | diff against the merge base `4306cc7` | 11 insertions, 11 deletions; README hunk 2420–2426 only; one Lean declaration restated; 0 headings removed or added; nothing outside the folder. | Agrees with head |

The rows for the untouched statements stand as in the previous review, of `8d8d411`.

- Source locators checked against the text: none new; no passage changed since the previous review, whose checks for G5.6 (HatcherSSAT line 2024, HatcherAT line 15686) stand.
- Library declarations opened at the pin: none new; `HomotopyGroup.hurewiczHom` as in the previous review.
- Cross-roadmap citations resolved on main at `726beff`: BordismFormalGroups F2.2 (README lines 659, 748–755); TangentialBordism's citations of G3.9 (lines 1749, 1802, 1888, 1988, 2033, 2041, 3026), none asking G3.9 for the nilpotent-completion comparison. Main has not changed this folder's README or `Suggested.lean` since the merge base.
- Automatic checks: every check passes at this head. Nothing changes outside the folder.
- Dependency check output: `depcheck: 131 roadmaps, 1460 edges, 0 problem(s)`. No UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: seven `sorry` warnings (lines 80, 96, 134, 155, 173, 189, 204) and nothing else.
- Pull request text: the title names the G3.9 pointer. The summary block's five layers match the README's layer headings (lines 164, 418, 1938, 2500, 3167); Serre's torsion theorem and the rational Hurewicz statements are at README lines 35–39 and 4221–4231. The prose states that this revises a roadmap on main, the changed sentences of G3.9, what G3.9 keeps, and the restatement of `rationalHurewicz`; the dependency and merge-order blocks name no open supplier, and BordismFormalGroups and TangentialBordism are on main.

Overlap check: read StableHomotopyKTheory, TopologicalKTheory and TangentialBordism on main, and SimplicialCategories (#2269), as the previous review has them; the change adds no object. The comparison of derived and HF_p-nilpotent completion: owner BordismFormalGroups F2.2, cited here. The Bergner and Joyal model structures and straightening: owner here (G2.11, on main); see the note for the human reviewers.

Source independence: changed passages only; no passage changed since the previous review, so none compared anew. As in the previous review: 3 passages compared with 3 sources, none shared; largest share LurieHTT, 28 of about 103 locators; contents compared with LurieHTT: independent. No layer is added, removed or reordered.

Research link: Layers 2–3 give the stable homotopy category of Hovey, Shipley and Smith (2000) and the derived p-completion that BordismFormalGroups F2.2 uses for the Adams spectral sequence; G5.5 uses the operator model of KO of Joachim (2001) and Hebestreit–Sagave (2020). This rests on README lines 49–53 and 3732–3738 and on BordismFormalGroups F2.2.

## Not verifiable

- QuillenHA, ABSClifford, McDuffSegal, SegalCategories and JoachimKO are recorded as uncertified and were not read; no changed passage cites them.

## Source issues

- none

## For the human reviewers

- Open pull requests #2269 and #2270 plan the Bergner and Joyal model structures and straightening, which G2.11 on main owns (README lines 4685–4691), and neither cites G2.11. Which side keeps them is not settled in either text.
