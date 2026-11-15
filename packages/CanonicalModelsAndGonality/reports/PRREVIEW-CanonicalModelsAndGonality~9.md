# Review of CanonicalModelsAndGonality (pull request #1726 at ed90937)
**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: `README.md:2059–2061` reads “(Derickx–van Hoeij 2014, §1, inequality (1), state the first inequality for a curve over `ℚ` at a prime of good reduction; the proof above gives it for every `R` and `𝒳` as above.)”. The Poonen entry (`:2217–2218`) no longer names 9.3, and the Derickx–van Hoeij entry (`:2234–2236`) carries the locator.

## Deferred findings

- D01 — stands: at the open head of GroupActionsOnRiemannSurfaces (`bb14724`), `README.md:1696` still names this roadmap as consumer, and its 6.4 (`:1386–1388`) still proves `g ≤ 4` for two trigonal subfields.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 9.3 `gonality_specialFiber_le` against its new locator | `R = ℤ_(p)`, `K = ℚ`, `κ = 𝔽_p` | README: `gonality κ F_κ ≤ gonality K F`. Source inequality (1): `𝔽_p`-gonality at most `ℚ`-gonality at good `p` | Same direction, same hypotheses (the source's curves are smooth, projective, geometrically irreducible); the README's general `R` is claimed for its own proof only |
| 9.3 with 1.8, `#X(𝔽_{p^m}) ≤ gon_{ℚ̄}(X)·(p^m+1)` | Klein quartic, `p = 2`, `m = 3` (good reduction away from 7); a genus-2 curve at good `p` | `24 ≤ 3·9 = 27`; `#X(𝔽_p) ≤ 2(p+1)` is the double-cover count | True |
| 9.3, direction | `ℙ¹_{ℤ_(p)}`; a smooth family of plane quartics specializing to a hyperelliptic genus-3 curve | `1 ≤ 1`; special `2 ≤ 3` generic, strict | True; the reverse inequality is false |
| Poonen entry after the deletion (1.3, 1.6, 1.7) | Prop. A.1 (ii) and (vii), cited at `README.md:462, 566` and `Suggested.lean:146, 181` | every remaining citation of Poonen is to Appendix A; none is for 9.3 | Consistent |
| Description: “9 layers and 61 milestones” | headings at the head | 9 `## Layer`, 61 `### k.n` | True |
| Description: “Layer 8 consumes BelyiMaps §§9.2–9.4, on main” | BelyiMaps on main (`276e711`) | 9.2 the meromorphic function field (`:3495`), 9.3 the degree theorem (`:3581`), 9.4 points and places (`:3659`) | True |
| Description: Tau Ceti results “cited by their pinned declarations” (quotient genus with its orbit form) | `README.md:186–189` | `hurwitz_genus_formula`, `TauCeti.Divisor.degree_tameDifferent_eq_finrank_mul_sum` cited; not in *Owned here* | True |
| Description: trigonal uniqueness “owned here (5.2(f))”; nothing consumed from GroupActionsOnRiemannSurfaces | `README.md:183–189, 1501, 1645, 2085, 2184` | every mention hands to the sibling or assigns it the hgcwa columns; none is a `*Needs:*` or a supplier row | True |
| Description: `Suggested.lean` states the analytic gonality, Abramovich's unconditional bound and the specialization on Tau Ceti's fibres | `Suggested.lean:663, 675`; docstring `:53–58` | both theorems present; the docstring lists §9.1–9.2, not 9.3, as not statable | True |

The rows for untouched statements stand as in the previous review, of `b184835`.

- **Pull request text:** title, summary block and prose read sentence by sentence against the head and against the folder's change (a new roadmap, 3 files, 89 headings, 69 declarations, nothing removed): no sentence is contradicted and no change is left unstated. `metadata.toml` has `topic = "math.AG"` as described.
- **Gate:** the worker's gate passes at `ed90937` (`build=0`, every count 0). My rerun has the same counts except `depcheck: NOT IN ORDER`, which comes from the default order; with the candidate order: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Nothing changes outside the folder.
- **Elaboration:** `lake env lean` on `TauCetiRoadmap/CanonicalModelsAndGonality/Suggested.lean` exits 0 with 51 `sorry` warnings and nothing else. The diff changes no Lean.
- **Sources, 2 locators checked:** derickx-van-hoeij-2014 lines 16–25 (§1, inequality (1), page 1 of arXiv v3; footnote at lines 39–40 for the meaning of “curve”); poonen-2007 Appendix A, Prop. A.1, for the shortened entry.
- **Cross-roadmap citations resolved:** BelyiMaps §§9.2–9.4 and RiemannianGeometry.MinimalSurfaces 10.3–10.4 on main; GroupActionsOnRiemannSurfaces at its open head. The changed passages add no citation of another roadmap.
- **Overlap check:** read GroupActionsOnRiemannSurfaces (#1728), its scope and 6.4; AlgebraicCurves (main, #1807, #1808), AdelicImagesAndModularCurves (#1727) and HyperellipticCurves (#1707) were searched for the changed object only. Gonality under good reduction is stated nowhere else on main or at the open heads (owner: this roadmap); trigonal uniqueness is D01.
- **Source independence:** changed passages only: 2 passages compared with 2 sources, none shared (the longest common run is the standard phrase “prime of good reduction”); the diff adds, removes or reorders no layer, so the arrangement was not compared again.

## Not verifiable

- The published J. Algebra text of Derickx–van Hoeij was not read; the README cites arXiv v3 by section, inequality number and page, which is the version checked.
- Derickx 2012, Frey 1994 and Deuring 1942, which the source credits for inequality (1), are not cached and were not read; the README does not cite them for 9.3.

## Source issues

- **Misprint** in derickx-van-hoeij-2014 at §1, p. 1 (arXiv v3): the source says a prime of good reduction “of then”, omitting the curve; it should be “of `C`, then”; affects nothing.

## For the human reviewers

- none
