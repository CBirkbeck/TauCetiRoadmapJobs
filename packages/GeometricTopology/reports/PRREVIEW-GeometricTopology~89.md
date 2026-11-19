# Review of GeometricTopology (pull request #1791 at a370b60)

**Verdict:** needs changes

**Summary.** Changes are needed, and three of the four findings concern the thirteen lines this pull request adds. The two new paragraphs make Layers 1.7 and 11.2.1 depend on SurfaceTopology and PlanarTopology, which are not on main and one of which consumes this roadmap's Layer 11, and they name a second owner for Radó's theorem, the two-dimensional Hauptvermutung, the classification of compact surfaces and the mapping class groups without saying which roadmap owns them; the pull request also edits `Completed/ConformalMapping/README.md`. The fourth finding is a rank formula in 4.3.2 that is false for disconnected disc-band surfaces. There is one small correction and one format note, one question for the author, and one point for the human reviewers.

## R01 (P2) — The two added paragraphs make this roadmap depend on SurfaceTopology and PlanarTopology, which are not on main, and SurfaceTopology consumes this roadmap

The new paragraph of 1.7 (line 1051) ends "Compare that topological classification with the smooth classification here through compatible triangulations and Layer 11.2.1's category comparison", and the new paragraph of 11.2.1 (line 7834) ends "Compare these constructions using the shared native simplicial realizations and combinatorial-manifold vocabulary". Each is an instruction to build something in this roadmap whose statement needs SurfaceTopology Layer 8 or PlanarTopology Layers 3, 5 and 8. An implementer of 1.7 or 11.2.1 is therefore blocked behind two roadmaps that exist only in pull request #271, and a roadmap on main may consume only roadmaps on main.

The direction is also circular. SurfaceTopology's README at the head of #271 lists this roadmap as its supplier: its supplier table has "The ordered-simplex chain complex in GeometricTopology layer 11" (line 99), its Layer 7 says "Consume the ordered-simplex complex and the simplicial chain maps through `GeometricTopology` layer 11" (line 1181) and uses "`GeometricTopology` layer 11's CW structure" (line 1321). So GeometricTopology 1.7 → SurfaceTopology 8 → … → GeometricTopology 11. The dependency check reports no problem only because neither roadmap is on main or in the merge order, so the edges are outside what it sees. Neither comparison is stated either: no hypotheses, no conclusion, no `*Needs:*` entry.

The smallest change: delete the two "Compare …" sentences here. The comparison belongs where its inputs are, in the later roadmaps (PlanarTopology Layer 8 already states the bridge to the chart-based PL manifolds, its README line 1383). Once those roadmaps are on main, list them under *Downstream consumers* with what they take from Layers 1.6, 11.1 and 11.3.

## R02 (P2) — The added paragraphs name a second owner for theorems this roadmap owns, and neither text says which is the owner

*Scope and ownership* says this roadmap owns "the smooth classification of compact surfaces (Layer 1.7)", that "Layer 1.7.2 is the single owner of the mapping class groups of compact surfaces, their Dehn twists … and Lickorish's theorem", and that Layer 11 owns "Radó's theorem, the two-dimensional Hauptvermutung". The new paragraphs point to PlanarTopology Layers 3, 5 and 8 for "Radó, the two-dimensional Hauptvermutung and compatible PL/smooth structures" and to SurfaceTopology Layer 8 for the classification, as parallel developments. At the head of #271 those roadmaps claim to supply this one: PlanarTopology's consumer table gives "`GeometricTopology` layer 11 | triangulability is unconditional in dimension two; the two-dimensional Hauptvermutung …" (its README line 63, proved as `isTriangulable_of_compactSurface`, line 876), and SurfaceTopology's gives "`GeometricTopology` layer 9 | the classification of closed orientable surfaces" and "surface mapping classes" (lines 39–40; its Layer 9 proves the Dehn–Lickorish theorem, line 1609). Each side hands the object to the other, so a reader cannot tell whose statement a consumer should import; TeichmullerGeometry and MordellLawrenceVenkatesh already import these from Layers 1.7.2 and 11.2.1 here.

A roadmap on main is the owner. The smallest change in this README is to say so in the two paragraphs and to state in one clause how the later variants differ: PlanarTopology's Radó is for compact surfaces by finite triangulations (its line 937 leaves the non-compact case out), while 11.2.1 item 3 is for every Hausdorff second-countable surface; SurfaceTopology's classification and mapping classes are topological, on finite generalized maps, while 1.7 and 1.7.2 are smooth. The citation of these layers from SurfaceTopology and PlanarTopology, or the narrowing of their statements, is a change to #271.

## R03 (P2) — The pull request changes `Completed/ConformalMapping/README.md`, outside the roadmap folders it carries

The diff against main adds six lines to `Completed/ConformalMapping/README.md` (a *Downstream consumers* bullet for PlanarTopology Layer 2, at line 1369). That file belongs to a completed roadmap that this review does not cover and that has no review of its own in this pull request, so the edit would merge unreviewed. Move it to its own pull request, or to #271, which introduces the roadmap the bullet names.

## R04 (P2) — In 4.3.2 the rank `b+1−d` of the first homology of a disc-band surface holds only for a connected surface

Under "Euler characteristic and one-disc models" (line 2546) the text says a deformation retraction onto the spine "gives `χ=d−b`, integral first homology free of rank `b+1−d` and vanishing higher homology", before any connectedness hypothesis; the section explicitly admits disconnected presentations ("Disconnected inputs", and the components of the incidence multigraph). Two disjoint discs have `d = 2`, `b = 0`: the rank is `0`, the formula gives `−1`. The two-component unlink of the section's own *Tubing* Check is this case. With `c` components the rank is `b + c − d`, which is what the next paragraph's `b′ + d = b + c` encodes.

Write "free of rank `b + c − d` for `c` components (`b + 1 − d` when connected)".

## C01 — The description does not say what the GeometricTopology edit is

The description says "Add the supplier and consumer links from GeometricTopology, BelyiMaps and the completed ConformalMapping area", and of this folder only "The added GeometricTopology links compare its smooth approach with the classical finite-triangulation and polygon route." A reader cannot tell whether SurfaceTopology and PlanarTopology become suppliers of this roadmap. The head adds two paragraphs (in 1.7 and 11.2.1, thirteen lines, no heading, target or `Suggested.lean` declaration changed) that instruct a comparison with those roadmaps. After R01, the right sentence would be: "GeometricTopology gains no supplier; SurfaceTopology and PlanarTopology are recorded as its downstream consumers."

## N01 — Links and one citation in the new paragraphs

The relative links `../SurfaceTopology/README.md` and `../PlanarTopology/README.md` resolve to nothing until #271 merges; and "SurfaceTopology's generalized maps" names no layer (it is Layer 1 there).

## Questions for the author

- The docstring of `smale_conjecture` in `Suggested.lean` (line 91) and the References attach Kirby's Problem 4.34 to the Smale conjecture for `S³`. Watanabe cites Problems 4.34 and 4.126 together for the four-dimensional conjecture `Diff(S⁴) ≃ O(5)` (watanabe2018 lines 29–30 and 61). Is 4.34 the four-dimensional question, so that the reference belongs on `watanabe_theorem`? I could not read Kirby's list: the cached copy of the editor's PostScript file did not render.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.2 complements of balls | `ℝ ∖ (−1,1)`; `Sⁿ` minus two balls; `S¹` minus one | 2 components; `Sⁿ⁻¹×[0,1]`; interval with 2 boundary points | holds; `n ≥ 2` needed as stated |
| 1.3 gluing | two solid tori by identity / swap; double of `[0,∞)` | `π₁ = ℤ` / `1`; `ℝ`, not compact | holds |
| 1.4, 1.7 invariants | `T²#T²`; torus; once-holed torus; two tetrahedra at a vertex | `χ = −2`; genus 1 both, wrong formula gives 3/2; `7−12+8 = 3` | holds |
| 1.7.1 polygon model and Veronese map | word with `p, q, r`; `Q`, `dQ`, pole `P` | `V = r+1` from `χ = 2−2p−q−r`; `‖Q‖² = 1`; `‖dQ(w)‖² = 3‖w‖²`; `⟨P, diag(1,−2,1)⟩ = 0` | holds |
| 3.4 Cerf, Smale | `−I₄`; reflection | `det = 1`, degree `−1`; `O(4)` compact, `Diff(S³)` not | holds; smale1959 Thms A, B, 4 match |
| 4.2.6 bounded moves | `B = 0`, `μ = 2` | plane: 3 side-by-side + 4 nested = 7; sphere: 3; unoriented 2 and 1 | holds |
| 4.3.2 disc-band surfaces | 1 disc 1 band; 2 bands interleaved / not; two discs | `r = 2` or `1`; `(r,g) = (1,1)`, `(3,0)`; rank `0` vs formula `−1` | R04 |
| 4.4.5 Conway | Hopf±, trefoil, figure-eight; `D_V` for `[−1]` and trefoil matrix | `±z`, `1+z²`, `1−z²`; `s−s⁻¹`; `s²−1+s⁻²`; unlink phase `s+s⁻¹` | holds |
| 4.4.8 two-bridge | `K(5,7)`; 13 continued fractions; order-18 quotient | signs `−++−`, `P = 3−t−t⁻¹`; all fractions match; `tat = ata = (−e₁,1)` | holds |
| 4.5.2 Jones support | empty word; `σ₁²`; `σ₁³` | `±(n−1)`; bounds 1, 7 with `−u−u⁵`; lower bound 2 with `u²+u⁶−u⁸` | holds; Jones Thm 5 matches |
| 4.5.7 cubic quotient | orders; `σ₁³σ₂³σ₃³σ₄³` | `2⁷·3⁵·5 = 155520`, `/6 = 25920`; five-cycle, `(−i)⁴ = 1` | holds; Jones Thm 7, Marin intro match |
| 4.6, 4.6.1 HOMFLY, Kauffman | trefoil, Hopf, unlink; `a ↦ −A³` | `2v²−v⁴+v²z²`; `Λ₂`, `Λ₃` by the recursion; image `A⁻⁴+A⁻¹²−A⁻¹⁶`; `d ↦ −A²−A⁻²` | holds |
| 4.7.2 transposition labels | trefoil labels; `(123), (345)` | cycle of three label pairs; factors form a tree on 5 vertices | holds |
| 4.10.1 tangles | `1·2`, `2·1`, `(1·2)·3`, `1·(2·3)`; `∞+∞`; `N(0)`, `D(0)` | `3`, `3/2`, `10/3`, `9/2`; one circle; 2 and 1 components | holds |
| 4.12, 4.12.1 Garside, Brunnian | `σ₁σ₂⁻¹`; `[a²,b²]`; `n = 4` Lie polynomial | `Δ₃⁻¹σ₂(σ₂σ₁)`; equals `(ab⁻¹)³` by the braid relation; four words `±1` | holds |
| 6.2.1 signatures | trefoil at `e^{iπ/3}`; the 4×4 regression matrix; figure-eight; square knot | inertia `(0,1,1)`, sides `0, −2`; `(2,1,1)`, sides `0`; `q = x²+xy+y²`; all four values 0 | holds |
| 5.3, 7.4, 9.2 | Mathieu `9/1, 9/2`; Weeks; `T³` | `|p−6q| = 3` twice, `H₁ = ℤ/9`; `H₁ = (ℤ/5)²`; genus 3 = rank | holds |
| `annulus_conjecture` | `n = 0`; non-injective `f` | two points inside two points: `S⁰×I`; excluded, `IsLocallyFlat` contains `IsEmbedding` | sound |
| `rado_`, `moise_`, `manolescu_` | `TriangulationConjecture n` at 0, 2, 3, ≥5 | compact Hausdorff charted spaces; 0 proved at the pin; 2, 3 not | sound, not padding |
| `sphere_theorem`, `waldhausen_theorem` | `S¹×ℝP²`; free vs based homotopy | `π₂ = ℤ`, irreducible (hatcher-3m 2158–2161); zero class fixed by `π₁` | sound |
| `property_P`, `property_R`, `cyclic_surgery_theorem` | unknot `±1`, `0`; framing change | `S³`, `S¹×S²` excluded by hypotheses; integrality of a slope is framing-free | sound |
| other pinned propositions | `MostowRigidity`, `LiRankGenusTheorem`, `SmaleConjecture`, `WatanabeTheorem` | dimension ≥ 3 and closedness inside; `rank + n < genus` for all `n`; map fixed to the inclusion; `π₁(DiscDiff 4)` | sound |
| New paragraphs (1.7, 11.2.1) | edges to and from SurfaceTopology, PlanarTopology | 2 edges out; SurfaceTopology has 3 lines consuming Layer 11 | R01, R02 |

- Source locators checked against the text: 14 (smale1959 Thms A, B, 4; watanabe2018 Thm 1.1; hatcher-3m Thms 1.1, 1.5, 3.8, Prop 1.4, 1.7; pyronneau2024 Cor 2.19 p. 6; Jones 1985 Thms 5, 7 pp. 105–106; Hoste Thm 1; Marin intro and Thm 1.2; Burton et al. §§1.1–1.2; Lickorish–Millett Example 16; Ng §8.6; Kauffman's curl and circle values).
- Library declarations opened at the pin (Tau Ceti 2fd255d9): `AnnulusConjecture` and `CoboundAnnulus` (`Geometry/Manifold/LocallyFlat/Annulus.lean:105, 91`), `IsSliceEmbedding`, `IsLocallyFlat` (`LocallyFlat/Basic.lean:375, 390`), `SmaleConjecture` (`Diffeomorphism/Smale.lean:46`), `WatanabeTheorem` (`Disc.lean:77`), `FreedmanSliceTheorem` (`KnotTheory/Slice/Freedman.lean:66`), `IsMostowRigid`, `MostowRigidity` (`Hyperbolic/Mostow.lean:40, 72`), `TriangulationConjecture` (`Topology/TriangulationConjecture.lean:77`, with `triangulationConjecture_zero` at 130), `IsSphereBoundsBall` (`Geometry/Manifold/Irreducible.lean:42`), `LiRankGenusTheorem` (`LowDimTopology/Heegaard/RankGenus.lean:138`).
- Cross-roadmap citations resolved: the seven supplier roadmaps are on main (DifferentialGeometry, HopfRinow, TypeAHeckeAlgebras, TemperleyLieb, Subfactors, ReductiveGroups, SuccessiveMinima); SurfaceTopology and PlanarTopology only at the head of #271.
- Dependency check on this head: `depcheck: 200 roadmaps, 2202 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line (it cannot see the two roadmaps of R01).
- Elaboration of `Suggested.lean`: 26 declarations, `sorry` the only warning; no `set_option`, no sorried data, no definition. Elaborated signatures compared with the README statements: no binder lost.
- Padding: none of the 26 statements is proved at the pin or closes by unfolding (the only pinned case is dimension 0 of the triangulation conjecture, which is not stated). Statable headlines absent: none found; the docstring names Cerf, Levine's satellite theorem, mutation, Kondo, Novikov–Rosenberg and Zeeman with reasons.
- Previous review: its findings on the build, the stray reference files, process wording, the decidability sentence and the old text (foliations, PL local flatness, JSJ minimality, Smale, Cerf, concordance, Zeeman, link recursion, knot carrier, Heegaard orientability, Conway route, the CombinatorialHeegaardFloer cycle, native objects, absent headlines, narrowed theorems, sign conventions, shape) are repaired by the rewritten text now on main; the SurfaceTopology cycle and the ConformalMapping edit are not (R01, R03); the Radó generality claim is repaired, the section-less citation partly (N01).

Overlap check: read SurfaceTopology, PlanarTopology, TeichmullerGeometry, RibbonKnots, HeegaardFloer, KhovanovHomology, FourManifolds, DiagrammaticCoherence; shared with SurfaceTopology and PlanarTopology: Radó, the two-dimensional Hauptvermutung, the classification of compact surfaces, mapping class groups and Lickorish's theorem, owner GeometricTopology (on main); the others cite this roadmap as owner. The other open revision of this folder, #1797, merges cleanly with this head.

Source independence: 12 passages compared with 10 sources, none shared beyond formulas and standard names; largest share Lickorish, *An Introduction to Knot Theory*, about 19 of some 150 locators; contents compared with its public chapter list only (text not readable): Layer 4's order differs (Jones before Alexander there, prime decomposition in its Chapter 2 against 4.9 here): independent.

Research link: the headline statements are Hatcher 1983 (Smale conjecture), Watanabe 2018, Kronheimer–Mrowka 2004 (Property P), Agol 2013, Gabai–Meyerhoff–Milley 2009, Li 2013, Levine 2016 and Manolescu 2016, as the README's References and the cached texts of five of them give; Part II and FourManifolds build on them.

## Not verifiable

- Kirby's problem list: the editor's PostScript file did not render, so no problem number was checked against it.
- Lickorish, Hirsch, Rourke–Sanderson, Moise, Cerf (LNM 53), Hatcher's Annals paper, Garside, Elrifai–Morton, Epstein et al., Gabai, Mathieu, Scharlemann's Theorem 3.4 and 3.7: cited by locator, text not read this round.
- That `8₈` and the mirror of `10₁₂₉` have different `Q` (4.6.1): Lickorish–Millett's Example 16 gives only the equal `P`. That `11a255` and `11a257` have different `P` (4.6.1): Ng §8.6 gives only the equal Kauffman polynomial. Neither was recomputed.
- The trace values in the *Full twist* Check of 4.5.7 and the weighted trace `10` in the Check of 4.6 were not recomputed.
- Layers 4.2.1–4.2.5, 4.2.7–4.2.10, 4.3.3–4.4.4, 4.4.6–4.4.7, 4.5.3–4.5.6, 4.6.2–4.7.1, 4.7.3–4.9.1, 4.10.2–4.11.3, 4.13–4.15, 5.4.1–5.4.2, 6.2, 6.4, 7.1–7.3.1, 8.3–8.4, 8.5.1–8.5.2 and 10 were read for supplier lines and statements only, not recomputed line by line.

## Source issues

- none

## For the human reviewers

- **Not tested.** The source with the largest share of locators, Lickorish's *An Introduction to Knot Theory* (key `lickorish1997`, recorded as uncertified), could not be read; wording was not compared with it and the arrangement only with its public chapter list.
