# Review of CstConjectureForDaggerVarieties (pull request #1759 at af57e66)

**Verdict:** accepted

Incremental re-review of the 20 lines changed since cb613f0 (seven library locators moved to the new pins, one `*Needs:*` item added to §3.4, six docstring bullet titles), and a check of the pull request's title and description as they stand now. No finding.

## Deferred findings

- D01 — stands

## Previous findings

- R01 — repaired: the description now reads “`Suggested.lean` declares nothing: no headline theorem is statable at the pinned Mathlib and Tau Ceti, and its docstring names the 34 headline theorems …” and “the targeted Lake build succeeds with no warning (the file has no declaration)”.
- R02 — repaired: `Suggested.lean:25, 28, 33, 39, 43, 46` now name “The height formula and its sign”, “Splitting the crystalline eigenspace complex”, “Almost proper varieties have nonnegative de Rham slopes”, “Étale Künneth with a proper factor”, “Vanishing on the differential error term”, “Geometric recovery of the extended period modules”.

## Verified sound

| Statement (cited by a changed passage) | Instances and values computed on each side | Result / change |
|---|---|---|
| §3.4 almost proper varieties (its `*Needs:*` line gained §2.7) | Z=∅: U=X proper, the proper case. Z=X: U=∅, all groups 0, zero bundle acyclic by the Conventions. P¹∖{0,∞}=G_m, i=r=1: H¹_HK of rank 1 with φ=p, t_N=1; dlog z spans H¹_dR, t_H=1; degree 1−1=0, bundle O, H¹(O)=0, H⁰=Q_p. | Holds; no change. |
| §3.4 route step “Apply induction and §2.7” against the new `*Needs:*` item “§2.7, acyclicity from bicartesian squares” | CN25 lines 2501–2527: surjectivity of f_(i,2) for all i≤r gives injectivity of f_(i,1), i.e. the bicartesian square; passing to slopes ≥0 uses the equivalence (CN25 lines 2462–2465), which is §2.7 here. Layer 2 precedes Layer 3. | The item names a real input of the route; downward; no change. |
| §2.5 height formula (docstring line 25 now names it) | Point, r=0: 1=1+0+0. Disc, r=1: ht(O(D)/C)=0=0+0+0. O(−1): Euler height 0−(−1)=1, so nonzero H¹ has height −1<0. Bullet title matches the first target of §2.5 (README line 561). | Holds; no change. |

The diff changes no statement; the rows of the untouched statements stand as in the previous review, of `cb613f0`.

- Library locators: all 12 file-and-line locators of README lines 48–56 opened at the pins; each line is the declaration named: `BDeRhamPlus` :75, `BDeRham` :88, `WittVector.Isocrystal` :112, `WittVector.isocrystal_classification` :179, `Module.Free` :44, `Module.Finite` :121, `CategoryTheory.BicartesianSq` :57, `TauCeti.AdicSpace` :249, `spaY` :116, `frobeniusHomeomorph` :220, `spaX` :59; `ModuleCat/Basic.lean` exists.
- Docstring bullets: 34 bullets (`Suggested.lean:14–47`); the six retitled ones each name the first target of README §§2.5, 2.8, 3.4, 4.4, 5.1, 5.4 (README lines 561, 609, 717, 849, 927, 969); lines 25/26, 39/40, 43/45 now name different theorems.
- Source locators checked against the text in the changed passages: 2 (CN25 Theorem 8.1(c), p. 51, line 2501, with its proof to line 2527; CN25 §8.1, line 2462). The seeded sample falls in the diff only at §3.4.
- Description against the head: title (adds a roadmap; the folder is not on main), folder contents (README, `Suggested.lean`, `metadata.toml`), 34 headline theorems, no declaration, build with no warning, 0 outside-folder paths, 0 dependency problems, the standing hypotheses on K (README line 23), the three Mathlib names, the seven open suppliers (the README's ten suppliers less AdicSpacesPartII–IV, on main), 3 package reviews and 2 red-team rounds on the board: all agree with the head. The change since cb613f0 adds, removes or renumbers no section, headline or supplier, so the description leaves nothing unstated.
- Cross-roadmap citations: the diff adds none (the new item cites this roadmap's own §2.7); the resolver lists nothing missing; the overlap list has no dropped id, no second copy and no other pull request changing this folder.
- Gate rerun at af57e66: `set_option=0 … statement-hygiene=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the folder: empty.
- Elaboration: `lake env lean` on `TauCetiRoadmap/CstConjectureForDaggerVarieties/Suggested.lean` exits 0 with no output; zero declarations, so the signature, padding and duplicate-name probes have no case. No headline became statable: the diff touches bullet titles only.

Overlap check: read VectorBundlesAndIsocrystalsPartII, ProetaleCohomologyOfPAdicCurvesAndTowers, VectorBundlesAndIsocrystals, PadicHodgeTheory, CohomologyComparisons, AdicSpacesPartIV (scopes as in the previous review; the diff changes no ownership); qBC, reasonable Pairs and period Hom are owned by VectorBundlesAndIsocrystalsPartII and cited here; the Stein and affinoid diagram (§1.5) is owned here; nothing has two owners.

Source independence: changed passages only; 7 passages (the §3.4 `*Needs:*` item and the six bullet titles) compared with 1 source (CN25, at lines 2335–2367, 2397, 2466–2527, 2746, 2821), none shared; largest share CN25, as in the previous review; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- The supplier sections of the seven open suppliers are statements of open pull requests, and the 23 README gaps are contracts; none is a proved library theorem.

## Source issues

- none

## For the human reviewers

- The board plan (`packages/CstConjectureForDaggerVarieties/design/plan.json`) names VectorBundlesAndIsocrystals, not its Part II, as supplier of `gap:qbc-pairs` and `gap:natural-period-hom`; the README (lines 110, 112) names Part II. On the board's record as D01.
