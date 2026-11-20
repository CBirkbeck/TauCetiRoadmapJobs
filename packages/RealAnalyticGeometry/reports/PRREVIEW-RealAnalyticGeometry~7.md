# Review of RealAnalyticGeometry (pull request #2634 at 38c4ef3)

**Verdict:** accepted

**Summary.** Accepted: the folder is unchanged since the previous review of `38c4ef3`, which had no finding, and this round read the pull request's description against the head and found no sentence the head contradicts and no change of the kind a reader must know of left unstated. Both small corrections of the previous review, which concerned the description, are repaired. One format note is carried, not blocking; nothing is left for a human to decide.

## N01 — The second Check of §2.1 counts the cells of one triangulation as if of all

"`B_1` is the image of two open edges and one vertex" (lines 916–917) holds for the triangulation of `[0, 1]` with vertices `0`, `1/2`, `1`; the compatible one with vertices `0`, `1/4`, `1/2`, `1` gives three open edges and two vertices. "In the triangulation with vertices `0`, `1/2`, `1`" would say which is meant.

## Previous findings

The previous review, of the same head `38c4ef3`, had no finding; its two small corrections and one format note are accounted for here.

- C01 — repaired: the description now reads "the old anchors of §3.0 and §3.1, which other roadmaps link to, are kept as explicit anchors before those headings, so the link from ComplexComparisonPartII still lands on §3.1"; the head has both (lines 1041, 1132).
- C02 — repaired: the description now reads "Grauert 1958 is cited as Theorem 3, p. 470, for the embedding theorem (§4.2); §3, Propositions 6 and 7, for the p-function (§3.0); and §2, Theorem 2, with §3, for the Stein criterion (§3.1)", as README lines 1085, 1537, 1993 have it.
- N01 — not repaired: the Check is unchanged (lines 916–918); carried as N01 above.

## Verified sound

| Target | Instances tried | Roadmap side (computed) | Source or library side (computed) | Result |
|---|---|---|---|---|
| Theorem 3, `bounded_semialgebraic_analytic_triangulation` (the Check N01 touches) | `n = 1`, `B_1 = (0,1)`, `B_2 = {1/2}`; vertex sets `{0,1}`, `{0,1/2,1}`, `{0,1/4,1/2,1}`; `k = 0` | `{0,1}`: open edge `(0,1)` meets `B_2` and its complement, fails; `{0,1/2,1}`: 2 edges + 1 vertex in `B_1`, passes; finer: 3 edges + 2 vertices; `k = 0`: empty complex | structure field `compatible` (Suggested.lean lines 168–171) asks each open simplex inside `B i` or its complement: same three outcomes | sound; the Check's count is of the coarsest triangulation (N01) |
| Kept anchors of §3.0 and §3.1 (described in the description) | the two inbound links | ids at README lines 1041 and 1132, each directly before its heading | ComplexComparisonPartII line 245 on main uses `#r31-…`; Hyperfunctions line 21 uses `#r30-…` at a fixed commit | sound; description agrees |
| Weighted `∂̄` theorem, §3.1 (description: semi-definite `B`, Demailly VIII 4.5, p. 371) | `B = 0` at a point with `f ≠ 0`; `B = ε·Id` | no `α` with `|⟨f,v⟩|² ≤ 0`: value `+∞`, hypothesis fails, no claim; `⟨B⁻¹f,f⟩ = |f|²/ε`, bound `‖u‖ ≤ ε^(−1/2)‖f‖` | DemaillyAgbook line 18125: (4.5) Theorem on printed p. 371, complete metric, semi-positive curvature operator | sound; description agrees with README lines 1139–1148 |
| Description's counts and lists against the head | layers; sections; Checks; imports; declarations | 6 layers (0–5); every numbered section has a `*Needs:*` line (35); 30 Check bullets in 19 lists; `import Mathlib` + 8 Tau Ceti modules; 23 declarations, 8 with `sorry` | description: "six layers", "30 Checks", "eight individual Tau Ceti modules"; its 17 added and 17 removed declarations match the diff, `Multiprojective` unnamed | agrees |

The rows for the untouched statements stand as in the previous review, of `38c4ef3`.

- Source locators checked against the text: 1 (DemaillyAgbook line 18125, Theorem 4.5 on p. 371, as the description cites it); the folder is unchanged, so no seeded-sample section falls in a changed passage.
- Library declarations opened at the pin (those the description names): `FormalMultilinearSeries.le_radius_complexifyPi_two_mul` (`Analysis/Analytic/Complexification/Basic.lean:285`), `norm_complexifyPi_le_two_pow` (same file, 173), the instance `HasSemialgebraicProjections ℝ` (`Geometry/RealAlgebraic/CAD/Existence.lean:102`), `semialgebraicDim_eq_finrank_of_chartedSpace` (`…/Dimension/Manifold.lean:40`), `exists_subdivision_extending` (`Analysis/Convex/SimplicialComplex/Subdivision.lean:312`), `IsAnalyticSubmanifold.image_of_leftInvOn` (`Analysis/Analytic/Submanifold/Image.lean:48`), `exists_diffeomorph_normalBundle_subset` (`Geometry/Manifold/TubularNeighborhood/Existence.lean:53`), `Projectivization.affineChart` (`LinearAlgebra/Projectivization/AffineChart.lean:101`), `SheafOfModules.ringCatSheaf` (`Algebra/Category/ModuleCat/Sheaf/Defs.lean:62`), all Tau Ceti; Mathlib `sheafOfModulesEquivOver` (`Topology/Sheaves/Module.lean:28`).
- Cross-roadmap citations resolved: the 2 inbound links above; SmoothBundlesConnections §§B2.1–B2.2 on main (Hermitian bundle metrics at line 853, square-integrable sections at line 886), the one supplier this pull request adds; all seven supplier roadmaps are on main (RealAlgebraicGeometry under `Completed/`).
- Dependency check: `depcheck: 182 roadmaps, 2069 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all pass except one form check, set aside below; nothing changes outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates with eight `sorry` warnings and no error; no statement changed, so the signatures and the one-tactic probe stand as before.
- Description read against the head, sentence by sentence: revision of a roadmap on main, renumbering (old Rk → Layer k, Rk.n → §k.n, items 0–6 of §3.2 kept), added sections, removed and added declarations, suppliers and consumers all agree with the head.

Overlap check: read AffineMorseLefschetz, ComplexKahlerGeometry and RealAlgebraicGeometry on main and StratifiedSpacesAndTameTopology, ComplexComparisonPartII and Hyperfunctions at their open heads, as in the previous review; the folder is unchanged. Finite semialgebraic triangulation and semialgebraic dimension: AffineMorseLefschetz §5.1, cited here. Semianalytic decomposition, Łojasiewicz's theorems, complexification, the Stein predicate and Cartan A/B: this roadmap. Holomorphic structure sheaf: ComplexKahlerGeometry §4.1. No open pull request changes this roadmap or drops an id it cites, and this head drops no anchor another roadmap uses.

Source independence: changed passages only; the folder has no changed passage, so 0 passages compared with 0 sources; largest share Lojasiewicz1964, as in the previous review; no layer added, removed or reordered, so the arrangement was not compared again.

Research link: Theorems 1–4 are Łojasiewicz's 1964 simultaneous triangulation of locally finite semianalytic families, answering the question of Lefschetz, Koopman–Brown and Lefschetz–Whitehead (1930–33); Layers 3–4 give Cartan's theorems and Grauert's 1958 embedding, which the manifold theorem uses. Rests on Lojasiewicz1964 lines 25–42 and the README's consumers section.

## Not verifiable

- Grauert1958 (*Annals* 68): cited by locator alone, not readable; "Theorem 3, p. 470", "§3, Propositions 6 and 7" and "§2, Theorem 2", which the description repeats from the README, could not be checked against the text.
- Hormander1965 and Hormander1990: cited by locator alone; the description's statement that the numbers (7.2.2)–(7.4.3) are those of Chapter VII of the 1990 book could not be checked against the text.

Automatic checks set aside as false positives: the rule against anchor tags in the README flagged the explicit anchor before the heading of §3.0 (line 1041); it is the permitted kind, an old heading id kept before a renamed heading that another roadmap links to (Hyperfunctions, line 21 on main), but that link goes through a commit-pinned URL, which the scanner does not recognise as a link to this README.

## Source issues

- none

## For the human reviewers

- none
