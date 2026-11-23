# Review of HeegaardFloer (pull request #2477 at 4b56aac)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review, the Finder metadata file committed outside the roadmap folder, is removed, and the pull request now changes only `TauCetiRoadmap/HeegaardFloer/`. The 12 changed lines repair the previous small correction and both format notes without touching any mathematical statement. One small correction remains (a sentence of the description that the repair made out of date), not blocking; two licence points for the human reviewers are carried over.

## C01 — The description still says the README points HamiltonianSystems to a pull-request number

Under "Carried fixes outside M.0c" the description says "HamiltonianSystems is pointed to its open roadmap PR #480." This head removed the three occurrences of "(proposed in TauCetiRoadmap#480)" from `README.md` (lines 56, 2559, 4964), which now cite "HamiltonianSystems Layer 1" by name. A reader of the description looks for a pull-request reference that is no longer there. A sentence that would be right: "HamiltonianSystems Layer 1 is cited by roadmap name and layer as the consumer of the F2.1 contraction inverse."

## Previous findings

- R01 — repaired: `git diff --stat origin/main...HEAD` outside `TauCetiRoadmap/HeegaardFloer` is empty; `TauCetiRoadmap/.DS_Store` is not tracked at this head (removed by commit 77a65de).
- C01 (docstring lists a removed statement) — repaired: "cover sharp finite-dimensional Sard, Banach-manifold Sard–Smale, Darboux normal forms, nonsqueezing and the compact Lagrangian holomorphic-disc theorem", which matches the six declarations.
- N01 (pull-request number in the README) — repaired: "HamiltonianSystems, HamiltonianFloerOperations, FukayaTheory and …"; "HamiltonianSystems Layer 1 specializes this inverse to differentials of Hamiltonians"; no `#480` remains in the folder. The description was not updated: C01 above.
- N02 (two unused imports) — repaired: the imports are `Mathlib` and three `TauCeti.*` modules; the file elaborates with the same six `sorry` warnings.

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| F2.1 contraction inverse, df specialization (cited by the changed sentences at lines 2559 and 4964) | ℝ², ω = dq∧dp, `ι_Xω = ω(X,·) = df` | ω(X,·) = X_q dp − X_p dq = f_q dq + f_p dp gives X_f = (f_p, −f_q); HamiltonianSystems Layer 1 states (∂H/∂p, −∂H/∂q) | conventions agree; one inverse, built in F2.1, specialized there |
| Module docstring of `Suggested.lean` (changed) against its declarations | the six theorems | `sharp_sard`, `sharp_sardSmale`, `exists_darbouxChart`, `exists_standardDarbouxChart`, `nonsqueezing`, `exists_nonconstant_holomorphic_disc_in_component`: five topics named, five covered, none extra | docstring = file |
| §4.6a sharp triple transitivity after the import removal | README lines 128, 2868 | Still cited as the pinned `OnePoint.existsUnique_psl_smul_zero_one_infty_eq` at K=ℂ; the Lean file no longer states or uses it, so the two dropped imports have no user | consistent |

The rows of the previous reviews for untouched statements stand as in the previous review, of `935a631`.

- Source locators checked against the text: 0 this round (no target of the seeded sample falls in the 12 changed lines; the change adds or alters no locator).
- Library declarations opened at the pin: 0 new; the `OnePoint` citation is unchanged from the previous review, which opened it.
- Cross-roadmap citations resolved: 1 (HamiltonianSystems Layer 1 at its open head: the contraction inverse "on arbitrary covectors" is in its Layer 1, which names HeegaardFloer F2.1 as the builder; it consumes this roadmap and supplies nothing).
- Dependency check: `depcheck: 133 roadmaps, 1475 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean`: six `declaration uses sorry` warnings (lines 69, 82, 114, 125, 149, 172), nothing else; no `set_option`; signatures unchanged from the previous review.
- Record against main: no layer removed, retitled or added; one heading added (1.0c); the one Lean declaration removed is the pinned sphere statement, cited in §4.6a.
- Pull request text: title and description agree with the head except the sentence of C01.
- Overlap check: read DGFloer, AnalyticStableMaps, FukayaTheory, PseudoholomorphicCurveAnalysis (scopes as in the previous review; the change adds no object); nothing shared.

Source independence: changed passages only; the 12 changed lines add no prose (three deletions of a pull-request reference, one docstring sentence shortened, two imports removed), so 0 passages compared with 0 sources this round; largest share and contents comparison unchanged from the earlier reviews (Ozsváth–Szabó, about 20 of 110 citations; contents compared with os-disks-invariants: independent), the diff adding no layer.

Research link: Layers 6–8 state results of Ozsváth–Szabó (2001–2004), Lipshitz (2006), Lipshitz–Ozsváth–Thurston (2008) and Manolescu–Ozsváth–Sarkar (2006); M.0c supplies the Morse–Smale hypothesis of the trajectory-space theory in the sense of Smale (1961). Rests on the README's References and the sources read.

## Not verifiable

- Robbin–Salamon, Bull. LMS 27 (1995), Theorem 4.21: not readable at the previous review (publisher's and author's pages refused the request) and not touched by this change; the sign `index = −SF(A)` was recomputed there on A(s)=tanh s.
- The items of the earlier reviews (Audin–Damian page numbers and Lemme 2.2.8, Smale 1961 and 1965, McDuff–Salamon, Lee, Floer–Hofer–Salamon, Oh) stand; the change does not touch them.

Automatic checks set aside as false positives: the three hits for a name on the project's list of dropped roadmap names (HamiltonianSystems, README lines 56, 2559, 4964): the README names it only as a downstream consumer that supplies nothing, and a roadmap of that name is open with the layer described.

## Source issues

- none

## For the human reviewers

- Licence: `README.md` §4.1 cites the repository `t4v1/damian_formalizare`, file `MorseFloer/Part2/Darboux.lean`, "as existing work"; its licence was not read, and the Darboux declarations of `Suggested.lean` were not compared with that file.
- Licence: Hutchings' lecture notes (cited in §§1.1–1.9, 3.3) are unpublished notes read from the author's Berkeley page.
