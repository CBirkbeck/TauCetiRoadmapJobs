# Review of EllipticCurvePeriodsAndModularParametrizations (pull request #1715 at 91ab26b)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 91ab26b; this round reads the pull request's title and description against the head. No finding.

## Previous findings

- The previous report (of 91ab26b) had no finding; nothing to account for.

## Verified sound

### The pull request's text against the head

| Sentence of the title or description | What the head shows | Result |
|---|---|---|
| Title: “roadmap for elliptic curve periods and modular parametrizations” | The folder is not on main; the change is 2832 insertions, 0 deletions, in `README.md`, `Suggested.lean`, `metadata.toml` | agrees: adds a roadmap |
| “the roadmap, 5 layers and 38 milestones” | 5 `## Layer` headings; numbered subsections 6 + 7 + 7 + 12 + 6 = 38 | agrees |
| “`metadata.toml`: arXiv topic `math.NT`” | `topic = "math.NT"` | agrees |
| “analytic rank, special value, BSD quotient, analytic order of Ш” from a “pinned continuation hypothesis” | README 815 names the same four; `IsContinuation` has the field `convex : Convex ℝ U` (README 869) | agrees |
| “continuation hypothesis on a convex domain, which ensures independence of the analytic rank and leading coefficient” | README 876–877: two continuations agree on the convex, hence connected, intersection | agrees |
| “the Manin constant read from the Gross–Zagier roadmap's c_φ” | README 197, 1178–1182: the Manin constant is `|c_φ|` for GrossZagierAndArithmeticHeights §3.5's `c_φ` | agrees |
| “Stevens’ theorem on the unique curve of least Faltings height … identify the Faltings ratio with a lattice index” | README 1434 (unique `E_min`), 2138; README 214: the ratio is `[Λ_E : Λ_{E_min}]` | agrees |
| “CM reduction uses Hecke operators on the supersingular module” | README 104 | agrees |
| “The period comparisons supply the EllipticIntegrals roadmap” | README 112, 2178: EllipticIntegrals Milestone 8 is a downstream consumer; EllipticIntegrals is on main | agrees |
| “Mathlib’s lattice infrastructure and Tau Ceti’s minimal models” | `ZLattice.covolume`, `IsZLattice` (README summary); pinned Tau Ceti has `AlgebraicGeometry/EllipticCurve/MinimalModel`, `GlobalMinimalModel.lean` | agrees |
| “`Suggested.lean`: what can be stated over Mathlib and the pinned Tau Ceti” | elaborates at the pins, 37 `sorry` warnings, nothing else | agrees |

No section, headline theorem, declaration or supplier is removed (0 headings and 0 declarations removed), so the description leaves no such change unstated.

- Remark, no change asked: the summary block's “Tau Ceti’s modular forms and Arakelov heights” reads correctly only with “Tau Ceti” as the project; the Faltings height is ArakelovGeometryAndAbelianHeights §3.1 (README 400–404), not a pinned declaration, and the `depends-on` block lists that roadmap.
- Remark, no change asked: the generated `depends-on` block does not list WeightsInEtaleCohomology (README 1746) or NoncommutativeAndEquivariantIwasawa (README 100); the generated `merge-order` block does list both.

### Adversarial table

The folder is unchanged, so no statement changed; the row below is for the statements the description cites (covolume form of the Faltings height, the Faltings ratio as a lattice index), recomputed this round by AGM from the Weierstrass equations.

| Statement | Instance | Left side | Right side | Result |
|---|---|---|---|---|
| 5.1 `h_Fal = −½ log covol Λ_E`; 5.5 `faltingsRatio = [Λ_E : Λ_{E_min}]` | `11a1`, `11a2`, `11a3` | `Ω = 1.2692093, 0.2538419, 6.3460465`; `covol = 1.8515436, 0.3703087, 9.2577181`; `−½ log covol = −0.3080098, 0.4967091, −1.1127288` | README 2194–2213: the same values; `9.2577181/1.8515436 = 5.00000`, `9.2577181/0.3703087 = 25.00000` | agree: `11a3` has least height, ratios `5` and `25` as README 2200, 2209 |

The rows for all other statements stand as in the previous review, of `91ab26b`.

### Counts

- Source locators checked against the text: 0 (no passage changed; the seeded sample falls in no changed passage, and the README flags no locator as unverified).
- Library locations opened at the pin: Tau Ceti `AlgebraicGeometry/EllipticCurve/` (`MinimalModel`, `GlobalMinimalModel.lean` present); a search of pinned Tau Ceti for `faltingsHeight` and `Arakelov` returns nothing, as the README's supplier contract implies.
- Cross-roadmap citations: the worker's resolver finds none unresolved; the 11 unresolved Lean-name leads are LMFDB knowl ids (`ec.q.…`) and the supplier name `AbelianVariety.faltingsHeight`, none a claim about the pins.
- Gate: the worker's gate at this head passes every check, `build=0`. Re-run without the candidate order it prints only `depcheck: NOT IN ORDER` (the roadmap is placed after its last supplier; not a defect).
- Dependency check with the candidate order: `depcheck: 241 roadmaps, 2234 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `Suggested.lean`: exit 0, 37 `declaration uses sorry` warnings, no other message. Binder and padding checks stand as in the previous review; no Lean line changed.
- Changes outside the folder: none (`git diff --stat origin/main...HEAD` outside the folder is empty).
- Ownership: Manin constant, modular degree, analytic order of Ш, Faltings ratio searched in main and the open heads; every other roadmap that names them cites GrossZagierAndArithmeticHeights or this roadmap (AdelicImagesAndModularCurves README 475), and EllipticCurves on main (README 1388–1390) hands them off.

Overlap check: read HeegnerPointEulerSystems, GrossZagierAndArithmeticHeights, EllipticCurveModularity, BianchiModularForms, ModularIwasawaMainConjectures, EllipticCurves, ModularForms (the third list is empty); the Manin constant `c_φ` of a parametrization is owned by GrossZagierAndArithmeticHeights §3.5 and cited here; nothing else shared.

Source independence: changed passages only; 0 passages compared with 0 sources, since the folder is unchanged since 91ab26b; shares and contents not recomputed, the earlier reviews' comparison stands.

## Not verifiable

- Carried from the previous report: Rubin 1991/1994, Hida 2004, Brumer 1967, Silverman AEC and Advanced Topics, BLR §1.2, Mazur Cor. 4.1, Manin 1972 §5, Abbes–Ullmo Thm A, Zagier 1985 are paywalled; Vatsal 2003 §6 has no readable text.
- The LMFDB knowls (`ec.q.optimal`, `ec.q.manin_constant`, `ec.q.modular_degree`, `ec.q.faltings_height`, `ec.q.faltings_ratio`) need a browser check; journal pagination of Vatsal 2005 and Cornut 2002 not checked.
- Description: “One of 23 roadmaps for the mathematics behind the LMFDB, opened as drafts” is not a statement about this folder and was not checked.

## Source issues

- none

## For the human reviewers

- Not tested: the paywalled sources listed under `## Not verifiable` were cited by locator only in every round; wording and arrangement were never compared against them.
- Licence: the README's worked values are tied to LMFDB knowls (README 2425–2426 and the `ec.q.…` ids); whether citing LMFDB data this way needs an attribution line is a human's call.
