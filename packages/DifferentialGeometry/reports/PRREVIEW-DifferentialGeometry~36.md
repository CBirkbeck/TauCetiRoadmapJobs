# Review of DifferentialGeometry (pull request #3011 at da2fad0)

**Verdict:** accepted

**Summary.** Accepted: the folder has not changed since the head the previous review accepted, and this round read the pull request's title and description against that head and against the change from main. Every sentence of the summary block and of the five bullets describes the change as it is: the signed cylinder Stokes theorem of 5.4 with its prerequisites, the same factor in 10.5, the restriction of 10.2's Sard theorem to boundaryless sources with the extension handed to TangentialBordism §2.1, and the reworded opening. There are no findings, no small corrections and no format notes. For the human reviewers: [Lee], the most-cited source, could be read only as far as its contents pages.

## Previous findings

- none: the previous review, of this same head `da2fad0`, raised no finding, no small correction and no format note; the five points it accounted for from earlier rounds stay repaired, the folder being unchanged.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 5.4 cylinder Stokes (README 1815–1828), as the description's first bullet states it | `M = ℝ`, `ω = tφ(x)dx`, `∫φ = 1`, orientation `dx∧dt` | `dω = φ dt∧dx = −φ dx∧dt`, left side `−1`; right side `(−1)¹(1 − 0) = −1`; unsigned formula gives `+1` | holds; description agrees | none |
| 10.5 display (2774–2776), third bullet | closed top form `ω`, `n = 1` | `∫f₁^*ω − ∫f₀^*ω = (−1)^n ∫d(F^*ω)` since `((−1)^n)² = 1`; `d(F^*ω) = F^*(dω) = 0` | holds; description quotes it exactly | none |
| 10.2 Sard, boundaryless source (2720–2733), fourth bullet | flat theorem at the pin; search of both pins for an extension across a model boundary | `addHaar_image_criticalPoints_eq_zero`: `∀ x ∈ U, ContDiffAt ℝ n f x`, `(finrank E)² + 1 ≤ n`, conclusion for `fderiv`; no extension theorem found | description's reasons hold | none |
| "10.3–10.5 take boundaryless manifolds" (fourth bullet) | README 2748, 2754 | 10.4: "boundaryless Hausdorff manifolds of the same dimension `n ≥ 1`"; 10.5 uses 5.3's boundaryless Stokes | holds | none |
| "TangentialBordism §2.1, on main, already reads 10.2 as the boundaryless case" | TangentialBordism README on main, lines 219–233, 419, 3143–3144, 3466 | "§10.2's Sard theorem in all dimensions for boundaryless sources"; B1.6 "extends 10.2's Sard theorem to half-space and face-structured sources" | holds | none |
| 5.4 *Needs:* (1829–1833), second bullet | README at the merge base and at the head | base: "not 5.3. For the separate Stokes … 5.2's integral and the interval fundamental theorem of calculus"; head lists 2.2, 5.2, 5.3, Fubini, the interval theorem | description states both correctly | none |
| "retains layers 0–12", headline list (summary block) | README 27–37 and 13–19 | scope lists layers 0–12; opening lists the same nine headline theorems; change against main: 0 headings, 0 Lean declarations removed or added | holds | none |
| Sentence on #334 | overlap data and the list of open pull requests | #334 is a draft, changes `README.md` and `Suggested.lean` of this folder, heads conflict in both | holds | none |

The rows for every untouched statement stand as in the previous review, of `da2fad0`.

- The pull request's text: title, the three paragraphs of the summary block, the five bullets and the sentence on #334 read against the 64-line change from main (seven hunks: opening, two in *Scope and ownership*, two in 5.4, 10.2, 10.5) and against the head; no sentence is contradicted and no change is left unstated (no layer, heading, target id, Lean declaration or supplier is added or dropped; TangentialBordism §2.1 is named as owner of an extension, not as a supplier).
- Library declarations opened at the pin: 1 (`TauCeti.addHaar_image_criticalPoints_eq_zero`, `Analysis/Calculus/Sard/OutermostStratum.lean:347`); a search of both pins for a smooth-extension (Whitney-type) theorem found none.
- Cross-roadmap citations resolved on main: 1 (TangentialBordism §2.1, lines 219–233 and 3466).
- Record check against the merge base: no layer, heading or Lean declaration removed, renamed or added. Nothing changes outside the folder.
- Automatic checks: every check of the worker passes on this head. Dependency check output: `depcheck: 15 roadmaps, 219 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 36 `declaration uses sorry` warnings and nothing else; the file is unchanged, so the previous one-tactic probe and signature comparison stand.
- Seeded sample: the folder has no changed passage, so none of its targets falls in one; they stand as verified earlier.
- Source locators checked against text: none (no changed passage).

Overlap check: read DeRhamCohomologyAndDuality, RiemannianGeometry, ContactGeometry and TangentialBordism (main) as in the previous review, and ComplexKahlerGeometry, GeometricMeasureTheory and HamiltonianSystems as it records. Sard for boundaryless sources is DifferentialGeometry 10.2's and its extension to half-space and face-structured sources TangentialBordism §2.1's; no object has two owners.

Source independence: changed passages only; 0 passages compared with source text, because the folder has no changed passage and no cited source is legally readable beyond [Lee]'s front matter; largest share [Lee], 59 of the 60 bracketed citations that carry a locator; contents compared with [Lee]: independent (no layer added, removed or reordered).

Research link: layers 8–10 build the de Rham theorem, Poincaré duality and degree theory (Lee 2013, Ch. 17–18; Bott–Tu 1982, I §5; Milnor 1965, §5), which DeRhamCohomologyAndDuality, HeegaardFloer and the symplectic roadmaps consume; 5.6 matches the HOL Light and Abdulaziz–Paulson formalisations of Green's theorem. Rests on the README's References and *Downstream consumers*.

## Not verifiable

- [Lee], GTM 218 (Springer): paywalled; the author's page gives the front matter only, so the theorem-level "[Lee, …]" locators were not checked against the text.
- [Bott–Tu], GTM 82; [Tu], GTM 275; [Milnor], University Press of Virginia: no legal open copy was found in an earlier round; not looked for again, since nothing changed.

## Source issues

- none

## For the human reviewers

- Not tested: [Lee] holds 59 of the 60 bracketed citations that carry a locator and only its front matter (author's page) could be read; its contents were compared with the layers, no wording was compared with its text.
