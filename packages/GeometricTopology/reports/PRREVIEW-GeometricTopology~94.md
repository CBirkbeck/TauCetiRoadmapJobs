# Review of GeometricTopology (pull request #3170 at f17d28c)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 49 changed lines since `87e7f72`. The folder's text is the one the previous review read (no line of it changed between the two heads), and I recomputed both additions against the pinned libraries: the group of braid words modulo `TauCeti.BraidWord.WordEquiv` and its isomorphism with `TauCeti.BraidGroup n` (4.12), and the `GL₂(ℤ)`-equivariance of slope values (5.1) with the new theorem `slopeEquivStd_congr`, which is true in every case (`q ≠ 0`, `q = 0`, both poles). There is no finding. Three format notes remain, none blocking; the humans have only the standing questions on untouched text.

## N01 — The change puts a non-headline item of 5.1 into `Suggested.lean`, and lists the braid-word group of 4.12 as "not statable" although every carrier it needs is pinned

`slopeEquivStd_congr` (`Suggested.lean` line 112) is an API statement of 5.1, not a headline; the module docstring says so (line 47), and it is not padding (neither `simp` nor `rfl` closes it). If the file is meant to hold headlines only, the README item of 5.1 carries the statement alone. The entry at lines 69–72 stands under *Not statable at the pins*, yet `TauCeti.BraidWord n`, `WordEquiv`, `TauCeti.BraidGroup n` and quotients all exist at the pin: it is left out because it is data. "Not stated: data, not a headline" would be accurate.

## N02 — The *From Tau Ceti* and *From Mathlib* contracts do not name the declarations the two additions consume

The *Needs:* lines of 4.12 and 5.1 name `TauCeti.BraidWord.WordEquiv`, `TauCeti.BraidWord.toBraid`, `TauCeti.Slope.congr`, `TauCeti.slopeEquivStd`, `TauCeti.FramedBoundaryTorus.value_shiftLongitude` and Mathlib's `OnePoint.instGLAction` and `Matrix.GeneralLinearGroup.map`; the braid entry (README line 483) and the slopes entry (line 513) of the contracts do not. Adding them there would keep the contracts complete.

## N03 — "The change-of-basis matrix" in 5.1 (line 5952) can be read in two ways

For the framing `(μ, λ + nμ)` the matrix writing the new basis in the old is `[[1, n], [0, 1]]`, while the matrix acting on coordinates `(p, q)`, the one the Möbius action uses, is its inverse `[[1, −n], [0, 1]]`. The example given fixes the meaning; "the matrix of the change of coordinates" would say it outright.

## Previous findings

The previous AI review of this folder (at `57376f9`) had no findings. Its two format notes are N01 and N02 above: the passages they concern are unchanged at this head.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 4.12 braid words mod `WordEquiv` form a group `≃* BraidGroup n` (5591–5597) | `n = 0, 1, 2`; inverse of `[(0,1)]` | `n ≤ 1`: letters in `Fin 0`, only `[]`, both sides trivial; `n = 2`: reduced words `σ₁^k`, `ℤ ≅ B₂`; `[(0,1)] ++ [(0,−1)]` deletes to `[]` | holds | none |
| 4.12 Check *Free cancellation is needed* (5611–5613) | both `ArtinStep` constructors; `B₂` | `commute`: 2 letters ↔ 2; `braid`: 3 ↔ 3; lengths 2 vs 0; on `Fin 1` neither applies (needs indices differing by ≥ 1); `σ₁σ₁⁻¹ = 1` | holds | none |
| 5.1 equivariance, `slopeEquivStd_congr` (5946–5951; Lean 112) | `q ≠ 0`; `q = 0, p = ±1`; `g = [[1,0],[1,1]]` on `(1,−1)` | `q ≠ 0`: `cp+dq = q(cx+d)`, both `∞` or both `(ax+b)/(cx+d)`; `q = 0`: `(ap, cp)`, both `a/c` or `∞` iff `c = 0`; example: `(1,0) = ∞`, Möbius `(−1+0)/(−1+1) = ∞` | holds | none |
| Check *Möbius action* (5962–5965) | `−I`; swap; shear, `(3,2)`, `n = 1` | `−I`: `(−p,−q)` same class, `(−x)/(−1) = x`; swap: `(3,2) → (2,3)`, `3/2 → 2/3`, `(1,0) → (0,1)`, `∞ → 0`; shear: `(1,2)`, `3/2 − 1 = 1/2`, `∞` fixed (`c = 0`) | holds | none |
| Same Check against wrong conventions | row-vector action; value `q/p` | row vectors, shear `n=1`: `(3,2) → (3,−1)`, value `−3 ≠ 1/2`; value `q/p`: `(1,2)` has 2, Möbius of `2/3` is `−1/3` | both excluded | none |
| `value_shiftLongitude` is the case `[[1,−n],[0,1]]` (5953) | pinned `coord_shiftLongitude` | coordinates `(p − nq, q)` = matrix on `(p,q)`; value `x − n`, `∞ ↦ ∞`: equals `(·).map (· − n)` | holds | N03 |
| `property_P` hypothesis on the meridian (affected, untouched) | framings sharing `μ` | coordinate matrix `[[±1,k],[0,±1]]`, `c = 0`, so `∞` fixed (`smul_infty_eq_self_iff`) | consistent | none |
| Docstring entry on the braid-word group (Suggested 69–72) | carriers at the pin | `BraidWord`, `WordEquiv`, `BraidGroup`, `Quotient` all present; the three cited theorems exist | true except "not statable" | N01 |

- Change: 49 lines (README 30, `Suggested.lean` 19); no difference in the folder, the Lake manifest or the toolchain between the previously reviewed head and this one. Nothing changes outside the folders the pull request owns. No heading, layer or item removed; 11 layers at the base and at the head.
- Library declarations opened at the pin, 15: Tau Ceti `KnotTheory/BraidWord/Equivalence.lean` `WordEquiv` (35), `WordEquiv.append` (116), `toBraid_eq_iff_wordEquiv` (219); `KnotTheory/BraidWord/ArtinEquivalence.lean` `ArtinStep` (36); `KnotTheory/BraidWord/FreeCancellation/Basic.lean` `FreeCancelStep` (53); `GroupTheory/SpecificGroups/Braid/Word.lean` `toBraid` (73), `toBraid_append` (88), `toBraid_reverse_map_neg` (92), `toBraid_surjective` (109); `LowDimTopology/DehnSurgery/Slope.lean` `Slope.congr` (152), `slopeValue` (224), `slopeEquivStd` (310), `coord_shiftLongitude` (478), `value_shiftLongitude` (510); Mathlib `Topology/Compactification/OnePoint/ProjectiveLine.lean` `instGLAction` (126) with `smul_infty_eq_ite` (141), `smul_some_eq_ite` (149); `LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean` `toLin` (121), `map` (188).
- Elaboration: `lake env lean` on `Suggested.lean` gives 27 warnings, all `declaration uses sorry`, and no error. No `variable`, `set_option`, definition or instance in the file; the elaborated type of `slopeEquivStd_congr` has the README's generality (all of `GL₂(ℤ)`, all slopes of `ℤ × ℤ`).
- One-tactic probe on `slopeEquivStd_congr`: `simp` leaves the goal on `Slope.value`; `rfl` fails.
- Automatic checks: all passed, the targeted build included. Dependency check output: `depcheck: 113 roadmaps, 1292 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The new *Needs:* entries are Tau Ceti and Mathlib only.
- Seeded sample: none of the 15 targets lies in the changed or affected passages. The diff adds one locator (Birman, Chapter 1), under *Not verifiable*.
- Pull request text against this head: the GeometricTopology bullet ("§§4.12 and 5.1 … `Suggested.lean`: `slopeEquivStd_congr`"), the pin `2fd255d`, "data … listed there as not statable", sixteen folders and the elaboration claim all hold; the order with the other open revision of this folder is stated in the description.
- Cross-roadmap search for `WordEquiv`, `slopeEquivStd`, `Slope.congr` over the open heads and main: no hit outside this folder.

Overlap check: read KhovanovHomology, FourManifolds and TeichmullerGeometry (main; scope passages on braid words and slopes) and searched the heads of PlanarTopology, SurfaceTopology, HomotopySpheres, HeegaardFloer and TangentialBordism (open) for the two objects; nothing shared. KhovanovHomology consumes `TauCeti.BraidWord` closures only; TeichmullerGeometry's torus slopes are measured laminations, a different object. This roadmap owns both additions (4.12, 5.1).

Source independence: changed passages only; 5 passages (two README paragraphs, two Checks, the Lean docstring) compared with the 1 source they cite (Birman, Chapter 1, not readable), none taken from a source; largest share lickorish1997 (uncertified, share as on main, not recounted); no layer added, removed or reordered, so contents not compared.

Research link: the end theorems are resolved problems of Kirby's list with published proofs (Agol–Groves–Manning 2012, Gabai–Meyerhoff–Milley 2009, Li 2011, Kronheimer–Mrowka 2003, Levine 2014, Watanabe 2018, Yazdi 2016, Manolescu 2016); rests on the README's references and the cached texts.

## Not verifiable

- Birman, *Braids, Links, and Mapping Class Groups*, Chapter 1 (4.12, line 5596): not in the manifest or the sources cache. It is cited for Artin's presentation, which the pinned `TauCeti.BraidWord.toBraid_eq_iff_wordEquiv` proves.

## Source issues

- none

## For the human reviewers

- **Not tested.** `lickorish1997`, the source with the largest share of locators, is uncertified, so wording and arrangement were not compared with its text. The change adds no locator to it.
- **Licence.** Birman's book (README 4.12, line 5596) is cited by chapter without a manifest entry; its text was not read.
