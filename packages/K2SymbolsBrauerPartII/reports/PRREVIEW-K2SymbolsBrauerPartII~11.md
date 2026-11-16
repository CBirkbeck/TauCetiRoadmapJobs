# Review of K2SymbolsBrauerPartII (pull request #1432 at 4916d30)

**Verdict:** needs changes

## R01 (P3) — The description's co-author count predates this head

**Location:** pull request description, "AI assistance" paragraph: "the later review-repair commits name Claude Fable 5.1 (three commits) and Claude Opus 5.5 (one commit) as co-authors".

**Claim:** The head contradicts the count: two commits name Claude Opus 5.5, and the description does not mention the change this head makes.

**Witness:** `git log origin/main..HEAD -- TauCetiRoadmap/K2SymbolsBrauerPartII`: `Co-Authored-By: Claude Opus 5.5` on e96bc520 and on 4916d30c; Claude Fable 5.1 on d3eace43, a495ae1e, 158e932e.

**Repair:** Replace the clause by "the later review-repair commits name Claude Fable 5.1 (three commits) and Claude Opus 5.5 (two commits) as co-authors". Nothing in the folder changes.

## Previous findings

- none: the previous report, of `e96bc52`, had no finding of its own (its R01 and R02 bullets record repairs of an earlier report, and both sentences still stand, except the count in R01 above).

## Verified sound

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| README line 56: algebraic Brauer group is Mathlib's `BrauerGroup` with `TauCeti.BrauerGroup.instCommGroup`, "on algebras in the universe of K" | pin: `Mathlib/Algebra/BrauerGroup/Defs.lean:100`; `TauCeti/Algebra/BrauerGroup/Group.lean:174–190` | `abbrev BrauerGroup := Quotient (Brauer.CSA_Setoid K)`; instance on `BrauerGroup.{u, u} K`; `inv` is `mk (CSA.op A)`; identity is the class of K | as written, universe restriction included |
| README line 58: `h2MuToBr` lands in `TauCeti.ClassFieldTheory.Br F = H²(G_F,(Fˢ)ˣ)` | `Brauer/Torsion.lean:67`; `Brauer/Basic.lean:151` | `h2MuToBr : continuousCohomology 2 (muNRep n F) →+ Br F`; `Br := continuousCohomology 2 (unitsRep F)`; `h2MuToBr_injective`, `h2MuToBr_range` take `IsUnit (n : F)` | as written |
| README line 58: `brauerGroupEquivBr` is `brauerExplicitH2Equiv` followed by the change of model, and agrees with `brauerCohomologyEquiv` after it | `Brauer/CentralSimple/Basic.lean:55`; `CrossedProduct/Comparison.lean:193, 274` | `brauerGroupEquivBr = (brauerExplicitH2Equiv F).trans (unitsRepH2Equiv F)`; `brauerCohomologyEquiv = (brauerExplicitH2Equiv K).trans explicitH2AddEquivContinuousCohomology`; they differ by `explicitH2…symm` then `unitsRepH2Equiv`, the transport of `h2MuToBr_apply` | true by unfolding |
| §1.4, line 191: algebraic class of β_ζ exported through `brauerGroupEquivBr` | target of β_ζ against the source of the equivalence; m=2 | β_ζ ends with the Kummer map, i.e. `h2MuToBr`, in `Br F`; `brauerGroupEquivBr : Additive (BrauerGroup F) ≃+ Br F`; the pin's `h2MuEquivZMod_eq_one_iff_hilbertSymbol_eq_neg_one` writes `h2MuToBr 2 K y = brauerGroupEquivBr K (quaternionClass a b)` | carriers now match; the earlier name had target `continuousCohomology 2 (ofDiscreteModule …)`, a different type |
| §2.4, lines 399–409 (cite `brauerCohomologyEquiv_crossedProductClass`, `_quaternionClass`; untouched, depend on the change) | the two comparisons on a crossed-product class | both factor through `brauerExplicitH2Equiv_crossedProductClass` (`Comparison.lean:222`), so the inflated-cocycle value transports to `Br F` by the model change stated in line 58 | consistent with §1.4 |

The rows for the statements of `Suggested.lean` and for the rest of the README stand as in the previous review, of `e96bc52`; the diff changes no Lean statement.

- Library declarations opened at the pins: 9 (`BrauerGroup`, `instCommGroup`, `CSA.op`, `brauerExplicitH2Equiv`, `brauerCohomologyEquiv`, `Br`, `unitsRepH2Equiv`, `h2MuToBr` with `_apply`, `brauerGroupEquivBr` with `_apply`); every name and file path in the three changed passages exists as cited.
- Sources: one seeded target falls in the change, §1.4; its locator (Weibel III.6.10.1, Remark 6.10.4) is untouched and the changed clause cites only a library name, so no locator was re-opened.
- Gate, my run at 4916d30: every count 0, OK; the worker's run adds `build=0`. Worktree clean; no change outside the folder against `origin/main`.
- Dependency check: `depcheck: 250 roadmaps, 2380 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. The change adds no supplier.
- Elaboration: `lake env lean` on `TauCetiRoadmap/K2SymbolsBrauerPartII/Suggested.lean` exits 0; the only warnings are the five `sorry`s (lines 54, 65, 83, 117, 124). The file is unchanged, so signatures and one-tactic probes stand.
- Pull-request text: title, summary block and prose read against 4916d30; apart from R01 no sentence fails (the folder is still new on the base: 1065 insertions, 55 headings, 8 declarations, none removed).
- Citations and overlaps: no cross-roadmap citation unresolved; the two flagged Lean names (README line 70) are untouched text that earlier reviews passed; no cited id dropped, no other open pull request changes this roadmap.

Overlap check: closest roadmaps K2SymbolsBrauer, KTheoryFiniteLocalFields, ArithmeticKTheory, EllipticKTheory, K3BlochGroups (open) and QuadraticFormInvariants (main), scope read in the earlier review of this text; the change names only pinned library carriers and adds no object; nothing shared.

Source independence: changed passages only; 3 passages compared with 1 source (weibel, at the §1.4 locator), none shared: the added text describes library declarations; largest share weibel, 21 of 50 locators, carried from the earlier review; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- none
