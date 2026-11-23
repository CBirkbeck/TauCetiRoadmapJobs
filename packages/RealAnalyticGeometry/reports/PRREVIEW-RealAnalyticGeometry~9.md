# Review of RealAnalyticGeometry (pull request #2634 at b6a8442)

**Verdict:** accepted

**Summary.** Accepted: the one sentence changed since the last review (the second Check of §2.0b) is now true, and the pull request's description, read sentence by sentence against this head and against the README and `Suggested.lean` on main, says nothing the head contradicts and leaves no removal, renumbering or supplier change unstated. There are no findings and no small corrections; two format notes, neither blocking. Nothing is left for a human to decide.

## N01 — The second Check of §2.1 counts the cells of one triangulation as if of all

"`B_1` is the image of two open edges and one vertex" (lines 1214–1216) holds for the vertices `0`, `1/2`, `1`; with `0`, `1/4`, `1/2`, `1` it is three open edges and two vertices. "In the triangulation with vertices `0`, `1/2`, `1`" would say which is meant.

## N02 — The description lists main's names in code font as being in Tau Ceti, where the library uses other names

In the `Suggested.lean` paragraph of the description, `LocalAnalyticFunction`, `SemiAnalyticFormula`, `SemiAnalyticAt`, `semianalytic_preimage_local`, `isNashAt_iff_local_semialgebraic_graph`, `projectiveProjector`, `ProjectorLocus` and `range_projectiveProjector` are the names of main's file; a search of the pinned Tau Ceti finds `TauCeti.IsAnalyticBooleanCombination`, `TauCeti.SemianalyticAt` and `TauCeti.SemianalyticAt.preimage` (`Geometry/RealAnalytic/Semianalytic/Basic.lean:81, 242, 371`), `isNashAt_iff_exists_isSemialgebraicOn` (`Geometry/RealAlgebraic/Nash/Graph.lean:163`), and `projector`, `projectorLocus`, `range_projector` (`LinearAlgebra/Projectivization/Projector.lean:187, 105, 214`). The sentence is true of the objects ("the pinned libraries have what they state"); "under the names on the *In Tau Ceti:* lines" after "are in Tau Ceti" would stop a reader searching for the old names.

## Previous findings

The previous review, of `9cd6998`, had no finding (no R-numbered point); its three small corrections and one format note are accounted for here.

- C01 — repaired: the description now has a section "Suggested.lean" saying the file "is rewritten as the roadmap's acceptance test", naming the seventeen declarations that leave and the seventeen added; the counts agree with the diff against main.
- C02 — repaired: the description now reads "It also assumes the datum square-integrable for the weight, as the statement on main does", which is what R3.1 on main and §3.1 at this head (lines 1450–1452) say.
- C03 — repaired: line 796 now reads "the projections of its relatively open subsets are open", which is property (P) as §2 defines it (line 622) and is true of `{u = t²} ∪ {u = −t²}`. The repair introduced no new problem.
- N01 — not repaired: the Check of §2.1 is unchanged at lines 1214–1216; carried as N01 above.

## Verified sound

| Target | Instances tried | Roadmap side (computed) | Source or library side (computed) | Result |
|---|---|---|---|---|
| §2.0b, second Check (the changed sentence) | `Z = {u = t²} ∪ {u = −t²}`: `Z ∩ {t > 0, small}`; a neighbourhood of `(0,0)` in `Z`; `{t² = u}` alone | projections `(−ε, 0) ∪ (0, ε)` (open, not an interval); `(−ε, ε)`; `[0, ∞)`, not open | Lojasiewicz1964 lines 335–337, printed p. 458: (P) means the projection restricted to `Z` is open; README line 622 the same | sound |
| §2.0b, Lemma 7 (cited by the Check) | `f = t² − u`, `g = t² + u` at `(0, 0)` | `f(0, ·) = t²`, `g(0, ·) = t²`, neither identically zero; `fg = t⁴ − u²`, zero set has (P) | Lojasiewicz1964 lines 338–341: `g(c, t)` not identically zero and `{fg = 0}` has (P) | sound |
| §2.0b, topographic of dimension `n − 1` has (P) (cited by the Check) | the four arcs of `Z ∖ {0}`, `n = 2` | each is the graph `t = ±√|u|` over `u > 0` or `u < 0`, of dimension `1 = n − 1`; its projection is an open half-interval, a homeomorphism | Lojasiewicz1964 lines 335–337 | sound |
| Description: `Suggested.lean` counts | declarations at main and at the head | 17 leave, 17 added (6 theorems, 11 definitions), `ChartwiseRealAnalyticSubmanifold` restated with `S.Nonempty ∧ …` and explicit `I`; 8 Tau Ceti imports | head lines 1–9, 72–77; main's file: 22 declarations, Mathlib submodule imports | agrees |
| Description: Theorem 3 and Grauert "keep their statements from main" | statements with docstrings stripped, main against head | `FiniteCompatibleAnalyticTriangulation`, `bounded_semialgebraic_analytic_triangulation`, `ProperRealAnalyticEmbedding`, `grauert_proper_real_analytic_embedding`: identical; only field docstrings added | head lines 139–182, 331–362 | agrees |
| Description: declarations that leave are in the pinned libraries | each object searched at the pin | Tau Ceti: `SemianalyticAt` (`Basic.lean:242`), `.preimage` (371), `IsNashAt` (`Nash/Basic.lean:71`), `IsLocallySemialgebraic` (`Local.lean:252`), bounded case (399), `rankOneProjector` (`Projector.lean:69`), `_smul` (86), `isSemialgebraic_projectorLocus` (`ProjectorEmbedding.lean:97`) | Mathlib `Topology.IsClosedEmbedding.isProperMap` (`Topology/Maps/Proper/Basic.lean:274`) | agrees; names differ, N02 |
| Description: items with *In Tau Ceti:* lines by layer | lines counted per section | §0.1: 3; §1.0: 1; §1.1: 6; §2.0a: 2; §2.0b: 2; §2.0d: 4; §2.0h: 2; §2.1: 1; §2.1a: 2 | description lists R0: 3 items; R1: 1; R1.1: 6; R2: Lemmas 1, 2, §1.V rules, Lemma 6, Lemmas 11–14, Lemma 15, subdivision; R2.1: 3 | agrees |
| Description: suppliers | roadmaps named at main and at the head | main names RealAlgebraicGeometry, AffineMorseLefschetz, ComplexKahlerGeometry ("CK"), ComplexManifolds, GeometricTopology, AlgebraicTopology, SmoothBundlesConnections ("SBC B2"); the head has a contract for each of the same seven | all seven on main; none added, none dropped | agrees |
| Description: "Statements whose content changed" | each bullet against the head | closure of every piece (lines 339, 383, 414); supremum of local dimensions (398); tails `Γ ∩ {|t| ≥ 2}` and `dim Γ < n` (946–949); five steps (615, 1052); semi-definite `B` (1450); `χ₁(q)` (1477–1480); Lindelöf (672); AffineMorseLefschetz lift (2031) | main R3.1: "B is pointwise positive definite and … data f belong to weighted L²" | agrees |

The rows of the previous review for the untouched statements stand as in that review, of `9cd6998`.

- Source locators checked against the text this round: 2 (Lojasiewicz1964, property (P) at lines 335–337 and Lemma 7 at lines 338–341, printed p. 458).
- Library declarations opened at the pin this round: 14 (those of the table and of N02).
- Cross-roadmap citations: none in the changed sentence; the seven supplier roadmaps were confirmed present on main.
- Record: the folder on main equals the folder at the merge base, so the previous layer-by-layer comparison stands; the change since `9cd6998` removes or renumbers nothing.
- Automatic checks: all pass at this head (rerun); nothing changes outside the roadmap folder.
- Dependency check: `depcheck: 133 roadmaps, 1474 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with eight `sorry` warnings and no error; the file is unchanged since `9cd6998`, so the one-tactic probe and the comparison of elaborated signatures of that review stand.
- Headline theorems stated: Theorems 1–4, the Stein criterion, Cartan A and B, Grauert's theorem; the module docstring names the Stein tube and the weighted `L²` estimate as not statable, as the description says.

Overlap check: read AffineMorseLefschetz, ComplexKahlerGeometry and RealAlgebraicGeometry (main), and the open AffineMorseLefschetz, ComplexKahlerGeometry and Hyperfunctions; the changed sentence shares no object with them, and the ownership recorded in the previous review is unchanged (finite semialgebraic triangulation: AffineMorseLefschetz §5.1; holomorphic structure sheaf: ComplexKahlerGeometry §4.1; semianalytic theory, Stein predicate, Cartan A/B: this roadmap). No open pull request changes this roadmap or drops an id it cites, and this head drops no id another roadmap cites.

Source independence: changed passages only: 1 passage compared with 1 source (Lojasiewicz1964 lines 335–341), none shared; largest share Lojasiewicz1964, 29 of 46 locators; contents not compared again (the change adds, removes and reorders no layer; the previous comparison found the arrangement independent). Grauert1958, Hormander1965 and Hormander1990 could not be read.

Research link: Theorems 1–4 are Łojasiewicz's 1964 triangulation of locally finite semianalytic families; R3–R4 are Hörmander's 1965 `L²` theory, Cartan's theorems A and B and Grauert's 1958 embedding, which Theorem 2 uses. Rests on Lojasiewicz1964 lines 491–529 and the README's consumers section (analytic cycles in ComplexKahlerGeometry, Hyperfunctions).

## Not verifiable

- Grauert1958 (*Annals* 68): cited by locator alone; "Theorem 3, p. 470" (§4.2), "§3, Propositions 6 and 7" (§3.0) and "§2, Theorem 2" (§3.1) could not be checked against the text.
- Hormander1990, Chapter VII: cited by locator alone; the numbers (7.2.2), (7.2.4), (7.2.7), (7.2.8), (7.2.9) and (7.4.3) of §3.2 could not be checked. Hormander1965 likewise.
- Lojasiewicz1964, §4, step I, property (3), printed p. 465: the inequality after "they are empty when" is lost in the extraction (line 553), so the README's report that the source prints `dim Γ < n` there was not read.
- The description's generated blocks and anything after the quoted text were outside this check.

## Source issues

- **Error** in Lojasiewicz1964 at §4, step I, property (1), printed p. 465: the source says every member of the family is bounded, yet the family contains the hyperplanes at heights 1 and −1 (p. 466); it should be bounded over every bounded subset of the base; affects nothing.
- **Misprint** in Lojasiewicz1964 at §4, step II, proof of (2), printed p. 468: the source says the remaining case is a member of dimension n; it should be n − 1, members being graphs over subsets of the (n − 1)-dimensional base; affects nothing.

## For the human reviewers

- none
