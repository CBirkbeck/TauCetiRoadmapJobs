# Review of RationalHomotopyModels (pull request #2298 at a27c21d)

**Verdict:** needs changes

Incremental re-review of the 16 lines added since `2178204`: the section "Provenance: existing formalizations outside Tau Ceti" and one References entry.

## R01 (P3) — The provenance section leaves out the formalization that overlaps this roadmap's targets

**Location:** `TauCetiRoadmap/RationalHomotopyModels/README.md` lines 1229–1240: "## Provenance: existing formalizations outside Tau Ceti … it maps existing Lean code to targets". The section names only `LeanPool/WhiteheadTheorem`.

**Claim:** The section's only entry covers a supplier's theorem. It leaves out apellis/dg-lean, the one outside library that states objects of 1.1, 1.3 and 7.1, so the README cites no existing work on its own mathematics. The repository's "Porting existing work" rules ask for that citation.

**Witness:** dg-lean at 161db4e: `DG.IsFreeGradedCommAlgebra` and `DG.isFormal_of_isFreeGradedCommAlgebra` (`DG/Positive/FreeFormality.lean`), `DG.IsFormal := QuasiIsomorphic A (Cohomology A)` (`DG/Positive/Formality.lean`). The description says this library "overlaps in part".

**Repair:** After the LeanPool paragraph, add:
"`apellis/dg-lean` (References), Apache-2.0, is a Lean 4 library of differential graded algebra. It is built on its own `DGRing` classes, not on Tau Ceti's `TauCeti.IsDGAlgebra`. Its `DG.IsFreeGradedCommAlgebra` is free graded-commutative by the universal property, over a commutative ring. That is the object of 1.1, where the universal property is the theorem `IsFreeGradedCommutative.existsUnique_algHom`. Its `DG.IsFormal` is a zigzag of quasi-isomorphisms of DG rings to the cohomology. It differs from 7.1's `IsFormal`, which needs a graded-commutative middle term: `M₂(K)` in degree `0` with `d = 0` is formal there and not here. `DG.isFormal_of_isFreeGradedCommAlgebra` (free cohomology implies formal) bears on 7.1. dg-lean has no Sullivan algebras, polynomial homotopies, `A_PL` or topology."
Add `- *dg-lean*, Lean 4 library of differential graded algebra, at commit <full hash of 161db4e>. https://github.com/apellis/dg-lean` to the References, and name dg-lean in the description's **Provenance** paragraph.

## R02 (P3) — The Whitehead sentence names the wrong owner and the wrong sections

**Location:** `TauCetiRoadmap/RationalHomotopyModels/README.md` lines 1238–1240: "`LeanPool/WhiteheadTheorem` proves Whitehead's theorem for CW complexes … Scope takes the Whitehead theorem from AlgebraicTopology §§8.3 and 8.5". The description's **Provenance** paragraph says the same thing.

**Claim:** Three things are wrong. Scope (lines 86–87) cites AlgebraicTopology "Stages 4, 6, 8", not §§8.3 and 8.5. §8.3 is the Hurewicz theorem, not Whitehead's. And the theorem the LeanPool project proves is already proved at the pinned Tau Ceti, so the mapping points to no open target.

**Witness:** Tau Ceti `ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv` (`TauCeti/AlgebraicTopology/Homotopy/Whitehead.lean` line 243, `[TauCeti.CWType X] [TauCeti.CWType Y]` at line 236). AlgebraicTopology README on main, line 3455: "Ordinary Whitehead is Tau Ceti's …". Its line 3334: "### 8.3 Absolute Hurewicz".

**Repair:** Replace the second sentence with: "Whitehead's theorem for spaces of CW type is already proved at the pinned Tau Ceti (`ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv`). AlgebraicTopology §8.5 consumes it, and this roadmap takes it from there (Exact supplier contracts). The project maps to no target of this roadmap, and nothing in it treats Sullivan algebras, minimal models, polynomial forms or Quillen's functors." In the description, replace "which Scope takes from AlgebraicTopology §§8.3 and 8.5" with "which Tau Ceti already proves at the pin and this roadmap consumes through AlgebraicTopology §8.5".

## Previous findings

- none: the review of `2178204` accepted with no finding.

## Verified sound

| Statement | Instances | One side | Other side | Result; change |
|---|---|---|---|---|
| Whitehead's theorem as consumed by 6.2–6.4 (cited by the changed text) | `id` of `S²`; `S¹ → pt`; Warsaw circle `W → pt` | `id`: `homotopyEquiv_toFun` gives forward map `id`. `S¹`: `π₁ = ℤ ≠ 0`, not a weak equivalence, so no conclusion | `W`: every `πₙ(W) = 0`, a weak equivalence, but not a homotopy equivalence; `CWType W` fails, so it is excluded | Needs CW type on both sides, as in Tau Ceti (line 236) and LeanPool; R02 |
| 1.1 `IsFreeGradedCommutative` against dg-lean `DG.IsFreeGradedCommAlgebra` | `ℚ[x]`, `\|x\| = 2`; `𝔽₂[e]/(e²)`, `\|e\| = 1`; `𝔽₂[e]`, `\|e\| = 1` | Basis `xᵏ`: true. Basis `{1, e}`: true. Odd exponents `≤ 1`, so the span `{1, e}` misses `e²`: false | Universal property: true; true. `e² ≠ 0` breaks strict commutativity: false | The two agree on all three; R01 |
| 7.1 `IsFormal` against dg-lean `DG.IsFormal` | `d = 0` algebra; Heisenberg `Λ(x₁, y₁, z₁)`, `dz = xy`; `M₂(K)` in degree 0, `d = 0` | `d = 0`: formal (`M = A`). Heisenberg: `⟨x, y, y⟩ = [zy] ≠ 0`, indeterminacy `x·H¹ + H¹·y = 0`, so not formal. `M₂(K)`: not formal (`H(M)` commutative) | dg-lean: formal; not formal (same Massey product); `M₂(K)`: formal, since it is its own cohomology | They differ only on non-commutative algebras; R01's repair states this |

The adversarial rows for the other statements stand as in the previous review, of `2178204`.

- LeanPool at `f8b9b72`, checked against the changed text. `lean-toolchain` is `leanprover/lean4:v4.35.0` and the Mathlib `inputRev` is `v4.35.0`, against our pin `v4.36.0-rc2`. The README states "permissively licensed (Apache-2.0 or MIT)". `LeanPool/WhiteheadTheorem/Basic.lean` has a sorry-free `WhiteheadTheorem` for CW complexes, and `HEP/Cofibration.lean` covers cofibrations. 6 claims, 0 contradicted.
- Library declarations opened at the pin: Tau Ceti `TauCeti/AlgebraicTopology/Homotopy/Whitehead.lean` lines 236, 243 and 263. Cross-roadmap citations resolved: AlgebraicTopology §8.3 (line 3334), §8.5 (line 3413) and its Tau Ceti contract (line 466), on main.
- Pull request's text: its **Provenance** paragraph matches the head except for the sentence R02 repairs. No other change since `2178204` is left unstated (`git diff 2178204 HEAD`: README only, 16 insertions).
- Gate rerun at this head: every check 0 except `depcheck: NOT IN ORDER: RationalHomotopyModels (insert it after its last supplier)`. That is not a defect: the public order does not list the roadmap yet. The worker's gate passes every check, build included. Dependency check against the candidate order, where the roadmap is at line 430: `depcheck: 234 roadmaps, 2232 edges, 0 problem(s)`, no UPWARD, no CYCLE.
- Elaboration: `lake env lean` on `Suggested.lean` gives 13 `declaration uses sorry` warnings (lines 141–327) and nothing else. `Suggested.lean` has not changed since `2178204`. Nothing outside the folder changed against main.
- Seeded sample: none of the 15 sampled targets falls in a changed passage, and the changed text cites no source locator.

Overlap check: read this round EllAdicHomotopyTypesAndWeights (contracts, lines 67–75), CyclicHomologyLieHomologyAndQuasiFreeAlgebras and HomotopyTheoryOfCategories. KanQuillen, SuperconnectionsAndMathaiQuillenForms, DGAInfinity, DeRhamCohomologyAndDuality and SymplecticFieldTheory stand as read in the previous review. Ordinary Chevalley–Eilenberg cochains belong to ArithmeticLocallySymmetricSpaces §ALS.F.5, which this roadmap and CyclicHomology… both cite. Whitehead's theorem is Tau Ceti's: HomotopyTheoryOfCategories lists it as not used. This roadmap owns the five contracts EllAdic consumes. Nothing else is shared.

Source independence: changed passages only. 3 passages (the two provenance paragraphs and the References entry) were compared with 1 source, the LeanPool README at `f8b9b72`. The longest shared run is the 5-word licence fact "permissively licensed (Apache-2.0 or MIT)"; nothing is copied. The largest locator share is Hess2007, as in the earlier audit. No layer was added, removed or reordered, so the contents were not compared again.

## Not verifiable

- FHT2001 and DGMS1975 are settled as uncertified. Quillen 1969, Bousfield–Gugenheim 1976 and the Félix–Halperin and Amann–Zoller preprints have no text in the sources cache. None of them is cited in the changed passages.
- dg-lean was read at the short hash `161db4e` the description gives. Its full hash was not resolved.

## Source issues

- none

## For the human reviewers

- **Not tested.** FHT2001 and DGMS1975 are uncertified, and Quillen 1969 and Bousfield–Gugenheim 1976 have no open text here. The comparisons for Layers 5–7 used only Hess2007, Morgan1978, Sullivan1977 and the Félix–Halperin survey.
- **Licence.** apellis/dg-lean's README states Apache-2.0. `DG/Algebra/Commutative.lean`, `DG/Positive/FreeFormality.lean` and `DG/Positive/Formality.lean` carry no per-file header. rootkiller6788/mini-algebraic-topology was not opened. The description says nothing in `Suggested.lean` comes from either repository.
- **Licence.** LeanPool's README (`f8b9b72`) states Apache-2.0 or MIT per project, and `LeanPool/WhiteheadTheorem/Basic.lean` has an Apache 2.0 header. The README section says it is not a dependency, and the description says its maintainers have not been contacted.
