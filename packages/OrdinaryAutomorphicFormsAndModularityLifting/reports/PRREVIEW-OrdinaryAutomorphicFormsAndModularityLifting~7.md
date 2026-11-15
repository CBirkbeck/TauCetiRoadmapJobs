# Review of OrdinaryAutomorphicFormsAndModularityLifting (pull request #1066 at e906412)

**Verdict:** accepted

Incremental re-review of the 27 changed lines since `e2406a3` (README pins, the Tau Ceti Cohen–Macaulay contract, §4.3's Lean paragraph and `*Needs:*` line, Layer 4's Dependencies; `Suggested.lean`: the import, the module docstring, the deleted `IsCohenMacaulayLocal`, the two §4.3 signatures), and a check of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: the description's opening paragraph now reads "It supplies the inputs and refinements of the Skinner–Wiles ordinary deformation–Hecke route that no earlier roadmap states", and its second paragraph says "The route itself is not planned here", naming ClassicalSerreModularity §I.1.
- R02 — repaired: the summary now reads "its ordinary projector is the factorial-powers idempotent of IntegralHeckeAndGaloisDeterminants and PadicFamilies, with which Skinner–Wiles' exponent is only compared", as README 15 and 64 say.

## Verified sound

| Statement | Instance | Computed | Result |
|---|---|---|---|
| `puncturedSpectrum_connected` (signature changed) | `A = k[[x,y]]`, `f = []`, `d = 2` | `0 + 2 ≤ 2`; the set is `Spec A ∖ {m}`, which contains the generic point `(0)`: irreducible, connected | ✓ |
| same | `A = k[[x,y,z]]`, `f = [x]`, `d = 3` | `1 + 2 ≤ 3`; `V(x) ∖ {m}` is the punctured spectrum of `k[[y,z]]`: connected | ✓ |
| same, boundary and negative controls | `k[[x,y]]/(xy)` (`d = 1`); a field (`d = 0`); `k[[x,y,u,v]]/((x,y) ∩ (u,v))` | `d = 1`: two points, disconnected, excluded by `0 + 2 ≤ 1` false; `d = 0`: empty set, excluded; the last has dimension 2, depth 1, disconnected puncture: not Cohen–Macaulay, excluded by the class | ✓ |
| `components_meet_in_large_dimension` (signature changed) | `A = k[[x,y,z]]`, `f = [xy]`, `C₁ = {(x)}`, `C₂ = {(y)}` | minimal primes over `(xy)` are `(x), (y)`; `Q = (x,y)`, `dim A/Q = 1 = 3 − 1 − 1`; `f.length + 2 ≤ d` gives `d − r − 1 ≥ 1`, so no truncated subtraction | ✓ |
| same | `f = [x]`, one minimal prime | a singleton is not `C₁ ∪ C₂` with both nonempty and disjoint: hypotheses unsatisfiable, as the source's partition requires | ✓ |
| dropped binder `[IsNoetherianRing A]` | the class at the pin | `class IsCohenMacaulay … extends IsNoetherianRing R` (TauCeti/RingTheory/CohenMacaulay/Ring.lean 40); `IsNoetherianRing A` found by `inferInstance` from the new binders in a probe copy | ✓ |
| README 47: agreement with `Module.IsCohenMacaulay A A` for a Noetherian local ring | definition at the pin | `Subsingleton M ∨ depth = supportDim` (CohenMacaulay/Basic.lean 67–68); a local ring is nontrivial, so the first disjunct is false; `isCohenMacaulay_iff_of_isLocalRing` (Ring.lean 68) applied in the probe | ✓ |
| README 47: "the predicate does not include locality" | `k × k` | Noetherian of dimension 0: Cohen–Macaulay by `IsCohenMacaulay.of_krullDimLE_zero` (Ring.lean 131); two maximal ideals, not local | ✓ |
| old predicate against new | `k[[x,y]]/(x², xy)` | dimension 1, depth 0 (`m` is associated): no regular sequence of length 1, and depth ≠ dimension: false on both sides; `k[[x,y]]`: `[x,y]` regular, depth 2 = dim: true on both | ✓ |
| README 39: the pins | `lake-manifest.json` | mathlib `1b1ccf4b…`, TauCeti `2fd255d9…`; both package checkouts are at those commits | ✓ |
| Description: "four theorems … two supporting definitions … imports `Mathlib` and one Tau Ceti module" | `Suggested.lean` | theorems at lines 39, 50, 75, 105; definitions at 63, 96; imports at lines 1–2 | ✓ |
| Description: consumers | sibling heads | GL2ModularityLifting cites §§5.1a, 5.9 (its README 2646, 2669) and §5.8 (1383); PotentialModularityAndCompatibleSystems cites §§1.4–1.5, 2.9–2.11, 2.1, 4.20, 6.14 | ✓ |

Rows for every untouched statement stand as in the previous review, of `e2406a3`.

- Sampled target in the changed passages: §4.3 only. Its locators (SW99 Appendix A, Proposition A.1 and Corollary A.2, p. 123) and hypotheses are untouched and were not read again; the fourteen other sampled targets lie outside the diff.
- Library declarations opened at the pin: 4 (`TauCeti.Ring.IsCohenMacaulay`, `isCohenMacaulay_iff_of_isLocalRing`, `IsCohenMacaulay.of_krullDimLE_zero`, `Module.IsCohenMacaulay`). Duplication: pinned Mathlib and Tau Ceti searched for a punctured-spectrum connectedness theorem; only the open subscheme and its quasi-compactness exist (TauCeti/AlgebraicGeometry/PuncturedSpectrum.lean), so §4.3 stays a target.
- README and Lean agree: no `IsCohenMacaulayLocal` and no old pin hash left in the README; README 497–499 ("Noetherian local Cohen–Macaulay") equals the new binders; `#check @name` on both changed theorems prints the signatures of the worker's file.
- Gate, rerun on this head: every check 0, `OK`. Dependency check: `depcheck: 246 roadmaps, 2259 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Changes outside the folder against the base: none.
- Elaboration: `lake env lean` on `Suggested.lean`: four `declaration uses sorry` warnings (lines 39, 50, 75, 105), no error. Neither changed theorem closes in one tactic: no pinned lemma concludes connectedness of a punctured spectrum.
- Description against the head: title equals the README's; the six layer sentences match the 59 headings; ownership sentences match README 7, 11, 64 and 854; the summary block's claims as checked in the previous review, with R02's sentence corrected.
- Remark (untouched text, no change asked): README 854 lists what GL2ModularityLifting takes without §5.9, which that roadmap cites.
- Overlap check: read GL2ModularityLifting, ClassicalSerreModularity, PadicFamilies (scope as resolved in the earlier reviews; the diff adds no object of this roadmap's own and removes one definition); nothing shared.
- Source independence: changed passages only; 3 passages compared with 1 text (README 47, README 503 and the module docstring against the pinned Tau Ceti docstring, Ring.lean 37–38: a nine-word run that is the definition itself; no source passage is involved); arrangement not compared again, since the diff adds, removes or reorders no layer.

## Not verifiable

- SW99 Appendix A (behind §4.3): not read again in this round; the diff leaves its locators and statement unchanged.
- Shimura 1978 Proposition 3.4, Chai 1990 §4.5, Wiles 1986 Proposition 1.6, Hida [H3] Corollary 2.2: as in the earlier reviews, untouched by the diff.

## Source issues

- none

## For the human reviewers

- none
