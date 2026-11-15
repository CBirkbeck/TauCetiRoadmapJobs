# Review of HyperellipticCurves (pull request #1707 at ea85c21)

**Verdict:** accepted

Incremental re-review of 9 changed lines since `b238f61` (the "Downstream consumers" paragraph of `TauCetiRoadmap/HyperellipticCurves/README.md`), and of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: the description now reads "It evaluates the heights and effective Diophantine roadmaps' Selmer, descent and local-solubility notions on hyperelliptic equations"; consumers named are group actions, abelian varieties over finite fields, adelic images.
- R02 — repaired: the description now reads "the 2-torsion and Euler factors of the Jacobian, and the local solvability of the curve"; the summary block says "the curve's local solubility".

## Verified sound

| Statement | Instances and computed values | Result |
| --- | --- | --- |
| 1.4 involution criterion (cited by the changed paragraph) | `y² = x⁵ − 1`, `g = 2`: `ι` fixes 5 roots and `∞`, 6 = `2g + 2`; Riemann–Hurwitz `2 = 2·(−2) + 6`. Converse: `2g − 2 = 4g′ − 4 + 2g + 2` gives `g′ = 0`. | Holds both ways. |
| 1.4, negative control | Klein quartic, `g = 3`: an involution has quotient genus 1, so `4 = 0 + r`, `r = 4 ≠ 8`; not hyperelliptic. Characteristic 2, `y² + y = x⁵`: `ι` fixes only `∞`, `1 ≤ g + 1 = 3`. | Criterion separates; the characteristic-2 clause is needed. |
| 0.4 hyperelliptic predicate (cited by the changed paragraph) | `y² = x³ − x` over ℚ: genus 1, fails `g ≥ 2`. `y² = x⁵ − t` over `𝔽₅(t)`: genus 2 in the function-field sense, geometric genus 0. | Predicate is the function-field one, as the consumer uses it. |
| 0.6 Weierstrass points (cited by the changed paragraph) | `y² = x⁵ − 1`: `deg(4f + h²) = 5 = 2g + 1`, so `∞` is a rational Weierstrass point; 5 + 1 = 6 points, 2 of them rational (`x = 1`, `∞`). | Agrees with "roots of `f` and `∞`" at the consumer. |
| "Downstream consumers", three claims | GroupActionsOnRiemannSurfaces line 371 cites §1.4 for the involution criterion; AbelianVarietiesOverFiniteFields lines 2172, 2219, 2226 cite the models and the hyperelliptic predicate; AdelicImagesAndModularCurves lines 139, 3001 cite genus-two models, Igusa invariants, Weierstrass points. | Each claim matches the consumer's head. |
| "None of them supplies this roadmap" | The supplier contracts (README lines 440–520) and every `*Needs:*`/Dependencies line name none of the three; depcheck reports 0 problems. | True. |

The rows for every other statement of the roadmap stand as in the previous review, of `b238f61`.

- Changed passage: 4 lines added, 5 removed, one paragraph; the three section ids it cites (0.4, 0.6 through "Weierstrass points", 1.4) exist at this head (README lines 634, 709, 836) and contain what the paragraph attributes to them.
- Cross-roadmap citations resolved at the open heads: 3 consumers named (heads of the pull requests of GroupActionsOnRiemannSurfaces, AbelianVarietiesOverFiniteFields, AdelicImagesAndModularCurves), 8 citing lines read. The three roadmaps dropped from the paragraph (CanonicalModelsAndGonality line 177, CurvesOverFiniteFields line 147, SatoTateGroups line 168) describe themselves at their heads as supplying to or sitting beside this roadmap, not as consuming the items the old paragraph named.
- Description against the head, sentence by sentence: title (adds a roadmap; the folder is not on main), the three paragraphs of the summary block, the prose paragraph and the three file bullets. Each is supported: commutative-ring models (README lines 32–33), Igusa and Mestre (2.4, 2.7), minimal models and Liu's criterion and conductor–discriminant inequality (3.7, line 1385), cluster pictures in odd residue characteristic (Layer 4), 2-torsion, descent, Euler factors, real period, local solvability of the curve and the BSD quotient as an implication (5.1–5.7), Tau Ceti's binary-form action (lines 430–432), 6 layers and 6 + 5 + 7 + 7 + 13 + 7 = 45 sections, `topic = "math.NT"`, 35 declarations; 0 headings and 0 declarations removed against the base, so nothing to state.
- Gate at `ea85c21`, my run: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate also records `build=0`.
- Dependency check: `depcheck: 237 roadmaps, 2250 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `TauCetiRoadmap/HyperellipticCurves/Suggested.lean`: 16 `declaration uses sorry` warnings, nothing else; the file is unchanged since `b238f61`. Changes outside the folder: none.
- Overlap check: read CurvesOverFiniteFields, CanonicalModelsAndGonality, EffectiveDiophantineMethods, AbelianVarietiesOverFiniteFields, NeronModelsAndSemistableAbelianVarieties, EllipticCurves, AlgebraicCurves (the third list is empty); nothing shared: each hands hyperelliptic equations and genus-two invariants to this roadmap or is cited by it as owner. No open pull request changes this roadmap, no dropped id, no revision-only id.
- Source independence: changed passages only; 1 passage compared with 0 sources (it carries no source locator and names only roadmaps and this roadmap's sections), none shared; the arrangement was not compared again (no layer added, removed or reordered).
- Remark, no change asked: the paragraph is not exhaustive. At their open heads SiegelModularForms (5.3, 5.6), AbelianSurfacesModularity (§0.3) and QuadraticFormsOverABase (§0.1, `formDiscr`) also cite this roadmap; all three citations resolve at this head.

## Not verifiable

- "One of 23 roadmaps for the mathematics behind the LMFDB, opened as drafts" and the AI-assistance line: statements about the pull request series, not about this folder; not checked.
- The source locators of the seeded sample were not re-read: none falls in the changed paragraph, which cites no source.

## Source issues

- none

## For the human reviewers

- none
