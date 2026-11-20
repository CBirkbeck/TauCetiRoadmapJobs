# Review of GeometricMeasureTheory (pull request #2581 at a6197f3)

**Verdict:** accepted

**Summary.** Accepted: the folder has not changed since the review of `a6197f3`, and this round read the pull request's description against the head and against the change from main; no sentence of it is contradicted and no change a reader must know of is left unstated. The one small correction of the previous review, the sentence about the links from RiemannianGeometry, is repaired. There are no findings, no small corrections and no format notes. The human reviewers have four points, unchanged, and one text (Federer 1969) could not be read.

## Previous findings

The previous review, of `a6197f3`, had no finding (no R01); its one remark is accounted for here.

- C01 (the description said the links from RiemannianGeometry need new anchors) — repaired: "the two anchors that RiemannianGeometry links (`#g1--…`, `#g3--…`) are kept as explicit anchors on Layers 1 and 3, so its three links still resolve"; README lines 119 and 384 carry them.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| §5.1, truncation by balls (the description: `P(s ∩ ball) ≤ P(s; ball) + Hⁿ⁻¹(s ∩ sphere)`) | `s = (0,1)²`, `x₀ = 0`, `r = 1/2` | left: quarter disc, `1/2 + 1/2 + π/4`; right: `1` (two edges in the ball) `+ π/4` (quarter circle of radius `1/2`) | equality `1 + π/4`; without the sphere term `1 + π/4 ≤ 1` fails |
| §4.1 Check cited in the description (`2/π`) | `u = 1` on `(0,1)`, `u_j = 1 + sin(jx)/j` | `‖u_j − u‖_{L¹} ≤ 1/j → 0`; `∫_0^1 |cos(jx)| dx →` mean of `|cos|` `= 2/π`; `|Du|(Ω) = 0` | `L¹` convergence without strict convergence, as described |
| §3.2 dilation (`r^{1−n}`) | `u = 1_{ball 0 1}`, `ℝⁿ` | `u(r·) = 1_{ball 0 (1/r)}`: variation `n ω_n (1/r)^{n−1} = n ω_n r^{1−n}`; `L¹` norm `ω_n r^{−n}` | agrees with the stated factor; `r^{n−1}` is excluded |
| Convention 3 (`16` versus `4π`) | unit sphere of `ℝ³` | normalized: `4π`; unnormalized `μH[2]`: `4π / (ω_2/2²) = 4π/(π/4) = 16` | agrees |
| Description's count of the file's statements against `Suggested.lean` | ten bullets | `1+1+1+1+1+2+2+1+1+3 = 14` theorems; the file has 14 `sorry` theorems and the two predicates the bullets name | agrees |

The rows for the untouched statements stand as in the previous review, of `a6197f3`.

- Description against the head, each count recomputed: four headline theorems in the summary; 11 numbered conventions; 6 layers and 20 numbered sections (1 + 4 + 4 + 3 + 4 + 4), 20 *Needs:* lines, 20 Checks blocks holding 49 bullets, 6 Examples and 6 Dependencies sections; the table of former labels G1–G6 (README lines 1032–1039); five works in the References.
- Description against the change from main: the roadmap is on main and is revised (README and `Suggested.lean` only; `metadata.toml`, `PROGRESS.md`, `STATUS.md` untouched, nothing outside the folder); the 11 old headings and their redistribution, the five removed declarations with the four pinned names that replace them (README lines 1043–1047), the dropped links (five Mathlib pull-request links, one Zulip link and a roadmap pull-request link on main, none at the head), "Lane A.1–A.6" → PDE §1.1–§1.3 and §1.5–§1.6, "L5" → ConformalMapping §5.3–§5.6, and the added supplier ContourIntegration Layer 0 are all stated.
- Source locators the description names, found at the claims: Simon 1983 Definition 11.2 (line 218), Theorem 11.6 (222), 12.1–12.8 (305, 330, 335), Theorem 14.3 (681, 715, 825); Anzellotti–Giaquinta Theorem 1 (552), Proposition 3 (843), Theorems 4, 7, 8 (870); Federer 1969 4.5.11 (768); Federer 1958 p. 450 (925); Maggi §13.2 (649), Chapter 16 (754). The folder is unchanged, so no locator of the seeded sample falls in a changed passage.
- Library declarations opened at the pin: `TauCeti.addHaar_image_criticalPoints_eq_zero` (`TauCeti/Analysis/Calculus/Sard/OutermostStratum.lean:347`, the Morse–Sard theorem on a set, as the description says).
- Cross-roadmap citations: the three RiemannianGeometry links on main (its lines 974, 3008, 3026) against the anchors at README lines 119 and 384. Isoperimetry and Varifolds, on main and at their open heads, and GaussianIsoperimetryAndClusters and GeometricCurrents on main cite this roadmap by G1–G6, which the table maps. No open pull request changes this roadmap or drops an id it cites.
- Dependency check: `depcheck: 179 roadmaps, 2030 edges, 0 problem(s)`; no UPWARD or CYCLE line. The automatic checks all passed.
- Elaboration of `Suggested.lean`: 14 `sorry` warnings, nothing else; single `import Mathlib` followed by eight Tau Ceti modules, no `set_option`. The file is unchanged, so the `#check` comparison and the one-tactic probe of the earlier reviews stand. The predicate `IsApproxTangentPlane` does not carry `[FiniteDimensional ℝ E]`; its body does not need it and the theorems about it carry it.
- Statements described as changed, read at the head: §2.1 measurability (line 220), §2.3 compatibility with charts (293–297), §5.1 truncation (650–652), §5.2 "at every point" (19, 681), §6.1 noncompact hypotheses (827–828), §6.3 jump term (885), §6.4 inscribed polygons and ConformalMapping §5.4–§5.6 (913–921).

Overlap check: read Isoperimetry (main and its open revision), GaussianIsoperimetryAndClusters (main), Varifolds (main and its open revision), GeometricCurrents (main); nothing shared. Each consumes this roadmap's layers by label; the sharp isoperimetric theory and the signed-area identification are Isoperimetry's, varifolds and currents are Varifolds' and GeometricCurrents', as the Scope section says.

Source independence: changed passages only; the folder did not change, so 0 passages compared with 0 sources in this round; largest share Simon1983, 12 of 19 locators; no layer was added, removed or reordered, so the comparison of contents stands: independent.

Research link: Layers 2 and 5 are the rectifiability, area–coarea and De Giorgi–Federer structure theory of Simon 1983 (§§11–14) and Maggi 2012 (Chapters 15–16, per its contents), on which the varifold and regularity theory of the same texts is built; §6.3 is Anzellotti–Giaquinta 1978. Rests on the README and the texts read.

## Not verifiable

- Federer1969, 4.5.11 (the criterion of §5.4, in the whole space): the text is paywalled and recorded as cited by locator only.
- Maggi2012 §13.2, p. 150 and Chapter 16, pp. 183–184: only the author's extract (contents, synopses, index) is legally readable, as before.
- The description after the generated dependency and merge-order blocks: nothing follows them in the quoted text.

Automatic checks set aside as false positives: none failed.

## Source issues

- none

## For the human reviewers

- Licence: the Maggi2012 extract was read from the CVGMT server of the Scuola Normale Superiore, linked in the README's References; classed as an institutional copy.
- Licence: the References name prior formalisations (MovingSofa, a Hugging Face problem archive, hojonathanho/isoperimetric and its LeanPool copy, kim-em/isoperimetric). The declarations of `Suggested.lean` were not compared with them.
- Not tested: Maggi2012's statements at §13.2 and Chapter 16, and Federer1969 4.5.11, could not be read; wording and hypotheses were not compared with them. Simon1983, the source with the largest share, was read where cited.
- Fact: the folder's generated `STATUS.md` reports Lipschitz coarea, the blow-up theorem and the Jordan index theorem as landed in Tau Ceti after the pin; at a later pin those statements of `Suggested.lean` would restate library theorems. The description says so.
