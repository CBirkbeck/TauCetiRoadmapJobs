# Review of GeometricTopology (pull request #3170 at 9552dbc)

**Verdict:** accepted

**Summary.** Accepted: no line of the folder changed since the head the previous review read (`f17d28c`), and this round read the pull request's title and description against the head; every sentence that concerns this folder holds (the §§4.12 and 5.1 additions, the one new declaration `slopeEquivStd_congr`, the pin `2fd255d`, sixteen folders, the braid-word group listed as data). There is no finding and no small correction. The three format notes of the previous review stand, none blocking; the humans have only the standing questions on untouched text.

## N01 — `Suggested.lean` carries a non-headline item of 5.1, and lists the braid-word group of 4.12 as "not statable" although every carrier it needs is pinned

`slopeEquivStd_congr` (`Suggested.lean` line 112) is an API statement of 5.1, not a headline; the module docstring says so (line 47), and it is not padding. The entry at lines 69–72 stands under *Not statable at the pins*, yet `TauCeti.BraidWord n`, `WordEquiv`, `TauCeti.BraidGroup n` and quotients all exist at the pin: it is left out because it is data. "Not stated: data, not a headline" would be accurate.

## N02 — The *From Tau Ceti* and *From Mathlib* contracts do not name the declarations the two additions consume

The *Needs:* lines of 4.12 and 5.1 name `TauCeti.BraidWord.WordEquiv`, `TauCeti.BraidWord.toBraid`, `TauCeti.Slope.congr`, `TauCeti.slopeEquivStd`, `TauCeti.FramedBoundaryTorus.value_shiftLongitude` and Mathlib's `OnePoint.instGLAction` and `Matrix.GeneralLinearGroup.map`; the braid entry and the slopes entry of the supplier contracts do not. Adding them there would keep the contracts complete.

## N03 — "The change-of-basis matrix" in 5.1 (line 5952) can be read in two ways

For the framing `(μ, λ + nμ)` the matrix writing the new basis in the old is `[[1, n], [0, 1]]`, while the matrix acting on coordinates `(p, q)`, the one the Möbius action uses, is its inverse `[[1, −n], [0, 1]]`. The example given fixes the meaning; "the matrix of the change of coordinates" would say it outright.

## Previous findings

The previous AI review of this folder (at `f17d28c`) had no findings. Its three format notes are N01–N03 above: the passages they concern are unchanged at this head.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 5.1 equivariance, `slopeEquivStd_congr` (cited by the description's bullet; Lean line 112) | `g = [[2,1],[1,1]]` on `(1,1)`, `(1,−1)`, `(1,0)` | `(1,1) → (3,2)`, value `3/2`; Möbius `(2·1+1)/(1+1) = 3/2`. `(1,−1) → (1,0) = ∞`; Möbius `−1/0 = ∞`. `(1,0) → (2,1)`, value `2 = a/c` | holds | none |
| Same, case `[[1,−n],[0,1]]` against pinned `value_shiftLongitude` | `(p,q) = (3,2)`, `n = 1`; `∞` | `(3,2) → (1,2)`, `3/2 − 1 = 1/2`; `c = 0` fixes `∞`; pinned lemma: `(·).map (· − n)` | agrees | N03 |
| Description: "braid words modulo moves form a group isomorphic to the braid group" (4.12) | `n = 2`; `n ≤ 1` | `n = 2`: classes `σ₁^k`, `ℤ ≅ B₂`; `n ≤ 1`: letters in `Fin 0`, only the empty word, both sides trivial | holds | none |

The rows for all other statements stand as in the previous review, of `f17d28c`: no statement changed.

- Change since `f17d28c`: 0 lines in the folder; the Lake manifest and the toolchain are unchanged between the two heads. Against the base: 49 lines (README 30, `Suggested.lean` 19), 0 headings removed or added, 11 layers kept, 1 declaration added.
- Pull request text against this head, 7 claims checked: sixteen folders (16 in the diffstat); DynamicalDegreesOfRationalMaps the only folder whose `Suggested.lean` is untouched (15 others change it); pin `2fd255d` (Lake manifest); the GeometricTopology bullet (§§4.12, 5.1, `slopeEquivStd_congr`); data listed as not statable (docstring lines 69–72); elaboration with `sorry` warnings only; the order against the other open revision of this folder (stated, the two heads merge cleanly). No change outside the folders the pull request owns.
- Library declarations opened at the pin, 8: Tau Ceti `LowDimTopology/DehnSurgery/Slope.lean` `Slope.congr` (152), `slopeValue` (224), `slopeEquivStd` (310), `value_shiftLongitude` (510); `KnotTheory/BraidWord/Equivalence.lean` `toBraid_eq_iff_wordEquiv` (219); `GroupTheory/SpecificGroups/Braid/Word.lean` `toBraid_append` (88), `toBraid_surjective` (109); Mathlib `Topology/Compactification/OnePoint/ProjectiveLine.lean` `instGLAction` (126).
- Elaboration: `lake env lean` on `Suggested.lean` gives 27 warnings, all `declaration uses sorry`, and no error.
- Automatic checks: all passed, the targeted build included. Dependency check output: `depcheck: 94 roadmaps, 1059 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Seeded sample: none of the 15 targets lies in a changed passage (there is none); source locators checked this round: 0. Cross-roadmap citations: the citation resolver reports none unresolved.

Overlap check: read KhovanovHomology, FourManifolds and TeichmullerGeometry (main) and PlanarTopology, SurfaceTopology, HomotopySpheres, HeegaardFloer and TangentialBordism (open) as in the previous review, whose result stands since neither this folder nor the overlap facts changed; nothing shared. No id cited here is dropped by an open pull request, and this pull request drops none.

Source independence: changed passages only; 0 passages compared (the folder has no changed passage since the previous review, which compared 5 passages with 1 source, none shared); largest share lickorish1997 (uncertified, not recounted); no layer added, removed or reordered, so contents not compared.

Research link: the end theorems are resolved problems of Kirby's list with published proofs (Agol–Groves–Manning 2012, Gabai–Meyerhoff–Milley 2009, Li 2011, Kronheimer–Mrowka 2003, Levine 2014, Watanabe 2018, Yazdi 2016, Manolescu 2016); rests on the README's references and the cached texts.

## Not verifiable

- Birman, *Braids, Links, and Mapping Class Groups*, Chapter 1 (4.12, line 5596): not in the manifest or the sources cache. It is cited for Artin's presentation, which the pinned `TauCeti.BraidWord.toBraid_eq_iff_wordEquiv` proves.

## Source issues

- none

## For the human reviewers

- **Not tested.** `lickorish1997`, the source with the largest share of locators, is uncertified, so wording and arrangement were not compared with its text. The change adds no locator to it.
- **Licence.** Birman's book (README 4.12, line 5596) is cited by chapter without a manifest entry; its text was not read.
