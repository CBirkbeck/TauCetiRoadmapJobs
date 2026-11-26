# Review of GeometricTopology (pull request #3170 at 57376f9)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 49 changed lines since `87e7f72`. I checked both additions against the pinned libraries. The first is the group of braid words modulo `TauCeti.BraidWord.WordEquiv` and its isomorphism with `TauCeti.BraidGroup n` (4.12), with its Check. The second is the `GL₂(ℤ)`-equivariance of slope values (5.1), with its Check and the new `Suggested.lean` theorem `slopeEquivStd_congr`. A test proof of that theorem goes through at the pins, so it is true as stated. There is no finding. Two format notes remain, neither blocking: non-headline material in `Suggested.lean`, and supplier contracts that do not name the newly consumed declarations. The humans have only the standing questions on untouched text.

## N01 — The change puts two non-headline items of 4.12 and 5.1 into `Suggested.lean`, and calls one of them "not statable" although nothing it needs is missing at the pin

`slopeEquivStd_congr` (line 112) is an API statement of 5.1, not a headline theorem. It is not padding: `simp` and `rfl` do not close it, and a proof needs a case split on `q = 0` and on `c·p + d·q = 0`. Still, the file is the roadmap's acceptance test. The docstring already marks it as "beside the headlines" (line 47). If the author wants a file of headlines only, the README item of 5.1 carries the statement on its own.

The entry at lines 69–72 lists the braid-word group under *Not statable at the pins*. Every object it needs is pinned: `TauCeti.BraidWord n`, `WordEquiv`, `TauCeti.BraidGroup n`, and the quotient by an equivalence relation. It is left out because it is data and not a headline. Wording such as "not stated: data, and not a headline" would be accurate.

## N02 — The *From Tau Ceti* and *From Mathlib* contracts do not name the declarations the two additions consume

The *Needs:* lines of 4.12 and 5.1 name `TauCeti.BraidWord.WordEquiv`, `TauCeti.Slope.congr`, `TauCeti.slopeEquivStd`, `TauCeti.FramedBoundaryTorus.value_shiftLongitude` and Mathlib's `OnePoint.instGLAction`. The braid entry (line 483) and the slopes entry (line 513) of *From Tau Ceti* do not name the Tau Ceti ones. Adding them there would keep the contracts complete.

## Previous findings

The previous AI review of this folder was of the other open revision of this roadmap (#1797), at its own head. It had no findings. Its one format note, on a lens-space locator in 5.2, concerns a passage that only that pull request adds. The passage is not in this head, so nothing carries over.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 4.12 braid words mod `WordEquiv` form a group `≃* BraidGroup n` (lines 5591–5597) | `n = 0, 1, 2, 3` | `n ≤ 1`: only `[]`, both trivial; `n = 2`: free on `σ₁`, `≅ ℤ ≅ B₂`; `n = 3`: `[(0,1),(1,1)]` and its reverse-negation cancel to `[]` | holds | none |
| 4.12 Check *Free cancellation is needed* (5611) | `ArtinStep` cases; `B₂` | both steps keep length; lengths 2 vs 0; on `Fin 1` neither step applies; `toBraid = σσ⁻¹ = 1` | holds | none |
| 5.1 equivariance, `slopeEquivStd_congr` (5946–5953; Lean 112) | `q ≠ 0`; `q = 0`, `p = ±1`; `g = [[1,0],[1,1]]`, `(1,−1)` | `q ≠ 0`: `(ap+bq)/(cp+dq)` both sides; `q = 0`: both `a/c` (`∞` if `c = 0`); example: image `(1,0)`, Möbius `−1/0 = ∞` | holds; test proof, no `sorry` | none |
| Check *Möbius action* (5962–5965) | `−I`; swap; shear `n = 1` | `−I`: `(−p,−q)` same slope, `(−x)/(−1) = x`, `∞` fixed; swap: `(3,2)→(2,3)`, `∞=(1,0)→(0,1)=0` (elaborated); shear: `(3,2)→(1,2)`, `3/2→1/2` (elaborated) | holds | none |
| Same Check against wrong conventions | row-vector action; value `q/p` | row: `(3,2)→(3,−1)`, value `−3 ≠ 1/2`; `q/p`: image `(1,2)` has 2, Möbius of `2/3` is `−1/3`: both excluded | pins convention | none |
| `value_shiftLongitude` is the case `[[1,−n],[0,1]]` (5953) | `n = 1`, `(3,2)` | `coord_shiftLongitude`: `(p−nq, q) = (1,2)`; `value_shiftLongitude`: `3/2 − 1 = 1/2`; matches Check *Framing change* `λ → λ+nμ` | holds | none |
| `property_P` hypothesis `slopeEquiv s ≠ ∞` (affected) | framings with the same meridian | change matrix `[[±1,k],[0,±1]]`, `c = 0`, so `g•∞ = ∞` (`smul_infty_eq_self_iff`): independent of framing, as its docstring says | consistent | none |
| Docstring entry on the braid-word group (Suggested 69–72) | carriers at pin | `BraidWord`, `WordEquiv`, `BraidGroup`, `Quotient` all pinned; content = the three cited theorems | true except "not statable" | N01 |

- Change: 49 lines (README 30, `Suggested.lean` 19). Nothing changes outside the folders the pull request owns. No heading, layer or item is removed and no id is dropped; 11 layers at the base and at the head.
- Library declarations opened at the pin: 17.
  - Tau Ceti, `KnotTheory/BraidWord/Equivalence.lean`: `WordEquiv` (35), `WordEquiv.append` (116), `toBraid_eq_iff_wordEquiv` (219).
  - Tau Ceti, other braid files: `ArtinStep` (`ArtinEquivalence.lean` 36), `FreeCancelStep` (`FreeCancellation/Basic.lean` 53).
  - Tau Ceti, `GroupTheory/SpecificGroups/Braid/Word.lean`: `toBraid` (73), `toBraid_append` (88), `toBraid_reverse_map_neg` (92), `toBraid_surjective` (109).
  - Tau Ceti, `LowDimTopology/DehnSurgery/Slope.lean`: `Slope.congr` (152), `slopeEquivStd` (310), `coord_shiftLongitude` (478), `value_shiftLongitude` (510).
  - Mathlib, `Topology/Compactification/OnePoint/ProjectiveLine.lean`: `OnePoint.instGLAction` (126), `smul_infty_eq_ite` (141), `smul_some_eq_ite` (149).
  - Mathlib, `LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`: `GeneralLinearGroup.toLin` (121; `coe_toLin` 175, column vectors) and `map` (188).
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 27 warnings, all `declaration uses sorry`, for 27 theorems. The file has no `variable`, `set_option`, definition or instance. I compared the elaborated type of `slopeEquivStd_congr` with the README: there is no section binder to lose, and the generality is the same.
- One-tactic probe on `slopeEquivStd_congr`: `simp` leaves a goal on `Slope.value` and `rfl` fails. A test proof of the identical statement elaborates with 0 errors.
- Automatic checks: all passed, the targeted build included. Dependency check: `depcheck: 122 roadmaps, 1390 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The new *Needs:* entries are Tau Ceti and Mathlib only.
- Seeded sample: none of the 15 targets falls in the changed or affected passages; all lie in untouched text. The diff adds one locator (Birman, Chapter 1), listed under *Not verifiable*.
- Pull request text, read against this head:
  - The GeometricTopology bullet, the pin `2fd255d`, "data … listed there as not statable", the elaboration claim and the count of sixteen folders all hold.
  - The merge order "#1797 → this pull request" is stated. #1797 keeps 4.12 and 5.1 under the same ids and adds neither statement.

Overlap check: read FourManifolds, KhovanovHomology and TeichmullerGeometry (main), and HeegaardFloer, PlanarTopology, SurfaceTopology, HomotopySpheres and TangentialBordism (open). I also read DiagrammaticCoherence (main), which consumes `toBraid_append`. None owns the braid-word quotient or the `GL₂(ℤ)` action on slopes. TeichmullerGeometry's `Mod±(T²) ≅ GL₂(ℤ)` is a different object. The owner of both additions is this roadmap (4.12, 5.1).

Source independence: changed passages only. I compared 5 passages (two README paragraphs, two Checks, the Lean docstring) with the one source they cite (Birman, Chapter 1, not readable); none is taken from a source. Largest share: lickorish1997, 66 of about 600 locators, as in the previous review. No layer is added, removed or reordered, so the arrangement was not compared again.

Research link: the end theorems are resolved problems of Kirby's list, with these published proofs: Agol–Groves–Manning 2012, Gabai–Meyerhoff–Milley 2009, Li 2011, Kronheimer–Mrowka 2003, Levine 2014, Watanabe 2018, Yazdi 2016, Manolescu 2016. This rests on the README's references and the texts in the sources cache.

## Not verifiable

- Birman, *Braids, Links, and Mapping Class Groups*, Chapter 1 (4.12, line 5596): not in the sources cache or the manifest, and no open copy of the Princeton book is known. The fact it is cited for is Artin's presentation, which the pinned `toBraid_eq_iff_wordEquiv` proves.

## Source issues

- none

## For the human reviewers

- **Not tested.** `lickorish1997`, the source with the largest share of locators, is uncertified, so wording and arrangement were never compared with its text. The change adds no locator to it.
- **Licence.** Artin's *Theory of braids* (1947) is linked to a copy on A. Ranicki's page (README lines 2187 and 8138), a third party's page. This is in untouched text.
- **Supply.** 4.8.3 consumes the Milnor conjecture "as stated" (lines 4873–4876), citing Kronheimer–Mrowka and Rasmussen, with no supplier roadmap earlier in the order. This is in untouched text, the same as on main.
