# Review of AnalyticStableMaps (pull request #2529 at dc68c95)

**Verdict:** accepted

**Summary.** An incremental re-review of the 6 lines changed since `21cf625`. Accepted: the three sentences of the scope and supplier-contract sections that said "below" of the layers now say "in this roadmap", each is true of the whole README, and the description now states the move of those sections; no statement, Check, citation or Lean declaration changed. There is one small correction (the description calls the wording of the moved sections unchanged, and three phrases of it differ from `main`) and no format note; nothing is left for a human to decide.

## C01 — The description says the wording of the moved sections is unchanged, and three phrases of it differ from `main`

A reader who compares the moved sections with `main` on the strength of "apart from the updates listed above, the wording of these three sections is unchanged" finds three unlisted differences. In `## Scope and ownership` (line 1156) "Every Čech group below" is now "Every Čech group in this roadmap"; in the Mathlib contracts "Every Fredholm statement below" (line 1168) and "No relative class is used anywhere below" (line 1170) are changed the same way. The comparison of the directional phrases of these sections at `main` and at this head shows exactly these three and no other. A clause would do: "…the wording of these three sections is unchanged, except that three sentences which said 'below' of the layers now say 'in this roadmap'."

## Previous findings

The previous review, of `21cf625`, was an acceptance with no finding; its small correction and its format note are accounted for.

- C01 (previous) — repaired: the description now reads "The Scope and ownership and Exact supplier contracts sections move to the end of the README, after the layers and Downstream consumers and before the References"; the head has them at lines 1135 and 1164.
- N01 (previous) — repaired: line 1156 reads "Every Čech group in this roadmap is the Čech cohomology of ImplicitAtlases §0.7"; the two Mathlib bullets were reworded the same way, which is also correct. No new problem introduced.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| "Every Čech group in this roadmap is the Čech cohomology of ImplicitAtlases §0.7" (line 1156) | every occurrence of Čech in the README | 9 lines mention it: §9.2/§13.1 functional (lines 945, 1071, 1075), §12 (1049, owned by Gromov–Witten), the rest scope and contracts; all through ImplicitAtlases §0.7, §5.4–§5.5 | true; ImplicitAtlases §0.7, §5.4, §5.5 exist on main (lines 134, 576, 590) | none |
| "Every Fredholm statement in this roadmap is about these" (line 1168) | Fredholm predicates named in the README | lines 66, 78, 392, 401, 1181–1182 use `ContinuousLinearMap.IsFredholm` and its lemmas only; no other predicate declared | true; `IsFredholm.index_comp` at Mathlib/Analysis/Normed/Operator/Fredholm/Basic.lean:613 | none |
| "No relative class is used anywhere in this roadmap" (line 1170) | search for relative homology classes, `H₂(X, L)` | 0 uses; one mention (line 1049) assigns the relative fundamental class to Gromov–Witten theory | true; `singularHomologyFunctor` at Mathlib/AlgebraicTopology/SingularHomology/Basic.lean:52 | none |
| §0.7 index of the normal operator (cited by the description; untouched) | line in `ℂP²`: χ = 2, c₁ = 3, Z = 0, m = 2 | `ind D^N = (m−3)χ + 2c₁ − 2Z = −2 + 6 = 4`; `D(u) − 2Z = (2·2 + 6) − 6 − 0 = 4` after subtracting `ind D^T = 3χ + 2Z = 6` | holds | none |

The rows for all other statements stand as in the previous review, of `21cf625`: the diff changes no statement, Check or Lean declaration.

- Changed passages: 3 sentences, each read against the whole README; the directional phrases of the moved sections compared between `main` and this head (3 differences, all intended).
- Remaining "below"/"above" in the moved sections (lines 1177, 1183, 1185): they point at `### From the remaining roadmaps on main` (line 1220, which follows) and at the Tau Ceti bullets preceding them; correct.
- Library declarations opened at the pins: 3 (`ContinuousLinearMap.IsFredholm`, `IsFredholm.index_comp`, `AlgebraicTopology.singularHomologyFunctor`); TauCeti/AlgebraicTopology/Singular/Relative.lean exists.
- Cross-roadmap citations resolved on main: ImplicitAtlases §0.7, §5.4, §5.5; TopologicalSheafCohomology TS1.1–TS1.2 (cited by ImplicitAtlases §0.7's Needs line).
- Seeded sample: none of the fifteen targets falls in the changed passages; no source locator is touched.
- Automatic checks at this head: all passed. Dependency check: `depcheck: 124 roadmaps, 1405 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- `lake env lean` on `TauCetiRoadmap/AnalyticStableMaps/Suggested.lean` exited 0 with three `sorry` warnings (lines 106, 129, 162) and nothing else; the file is unchanged since `21cf625`. The diff outside the roadmap folder is empty.
- Pull request text: title and description agree with the head except as in C01; "How to read the build" stands at line 5, directly after the summary, as the description says.
- Overlap check: read HeegaardFloer, ComplexCurveModuli, GromovWittenTheory, ComplexKahlerGeometry, TaubesGromov; the embedded-sphere normal operator is owned by HeegaardFloer F2.6e and cited by §0.7, the embedded-curve and twisted torus operators by TaubesGromov Layers 1–2 (a consumer, named as such), Koszul–Malgrange by ComplexKahlerGeometry §4.2; nothing else shared. No open pull request changes this roadmap or drops an id it cites.
- Source independence: changed passages only; 3 passages compared with 0 sources (they are bookkeeping sentences with no source counterpart), none shared; largest share pardon13, 28 of about 63 named locators; the diff adds, removes and reorders no layer, so the contents comparison stands: independent.
- Research link: §0.6–§0.8 and §2.24 are the normal operator and regularity criterion of Wendl (2010) and the super-rigidity setting of Wendl (2023); Layers 5–9 build Pardon's (2013) implicit atlas on stable maps; Layer 3 is the compactness theorem of Ivashkovich–Shevchishin (1999). Rests on the README's References and the texts read.

## Not verifiable

- Ivashkovich–Shevchishin, Invent. Math. 136 (1999): paywalled, settled as uncertified; cited by locator only, in untouched text.
- McDuff–Salamon, *J-holomorphic Curves and Symplectic Topology*: not available from an open source; cited only in untouched text.

## Source issues

- none

## For the human reviewers

- none
