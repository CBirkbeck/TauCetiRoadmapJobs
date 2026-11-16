# Review of RationalHomotopyModels (pull request #2298 at 22ad2c2)

**Verdict:** accepted

Incremental re-review of the 46 lines changed since `a27c21d`: the provenance section (LeanPool sentence, Whitehead paragraph, new dg-lean paragraph), one new References entry, and six References entries re-wrapped. No finding.

## Previous findings

- R01 — repaired: "`apellis/dg-lean` (References), Apache-2.0, is a Lean 4 library of differential graded algebra. … dg-lean has no Sullivan algebras, polynomial homotopies, `A_PL` or topology." (README lines 1245–1253), References entry at full hash `161db4ede65f…` (lines 1343–1344); the description's **Provenance** paragraph names dg-lean.
- R02 — repaired: "Whitehead's theorem for spaces of CW type is already proved at the pinned Tau Ceti (`ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv`). AlgebraicTopology §8.5 consumes it, and this roadmap takes it from there (Exact supplier contracts)." (lines 1239–1243); the description now says the same.

## Verified sound

| Statement | Instances | One side | Other side | Result; change |
|---|---|---|---|---|
| 1.1 `IsFreeGradedCommutative` / `existsUnique_algHom` against dg-lean `DG.IsFreeGradedCommAlgebra` ("That is the object of 1.1") | `Λ(x)`, `\|x\| = 3`, over `ℚ`, target `ℚ[y]/(y²)`, `\|y\| = 3`; `𝔽₂[x]`, `\|x\| = 1`, on generators `(x, x²)`; target `𝔽₂[s]`, `\|s\| = 1` | Ours: basis `{1, x}`, `x ↦ y` extends uniquely. `𝔽₂[x]` on `(x, x²)`: monomials `x^(a+2b)`, `a ≤ 1`, a basis: definition holds; `[CharZero K]` excludes the theorem | dg-lean: `Λ(x)` strict, universal property holds. `𝔽₂[x]`: `isGradedCommStrict` fails (`x² ≠ 0`). `𝔽₂[s]` excluded by `[IsGradedCommStrict ℬ]` | Agree in characteristic zero, where 1.1 identifies `A ≅ ΛV` (Conventions, lines 103–111); no change |
| 7.1 `IsFormal` against dg-lean `DG.IsFormal` | `M₂(ℚ)` in degree 0, `d = 0`; `ℚ[x]/(x²)`, `\|x\| = 2`, `d = 0`; Heisenberg `Λ(x, y, z)`, degree 1, `dz = xy` | Ours: `M₂(ℚ) = f(Z⁰(M))` commutative, yet `E₁₂E₂₁ = E₁₁ ≠ E₂₂`: not formal. `ℚ[x]/(x²)`: formal. Heisenberg: `⟨x, y, y⟩ = [zy] ≠ 0`, indeterminacy 0: not formal | dg-lean: `M₂(ℚ)`: `d = 0`, so `A → H(A)` is an isomorphism: formal. `ℚ[x]/(x²)`: formal. Heisenberg: same Massey product, not formal | Differ exactly on `M₂(ℚ)`, as line 1251 states; no change |
| dg-lean `DG.isFormal_of_isFreeGradedCommAlgebra` ("bears on 7.1") | `Λ(x)`, `\|x\| = 3`, `d = 0`; model of `S²`: `Λ(x, y)`, `\|x\| = 2`, `\|y\| = 3`, `dy = x²` | Hypothesis: `H = Λ(x)` free: yes. `S²`: `H = ℚ[x]/(x²)`, even `x` with `x² = 0`: not free | Conclusion: `Λ(x)` formal (`A = H`). `S²` formal anyway: `x ↦ x`, `y ↦ 0` is a quasi-isomorphism onto `H` | Sufficient, not necessary; "bears on" claims no more; no change |
| Whitehead, Tau Ceti `ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv` (cited by the changed text; used by 6.2–6.4) | `pt → D²`; `S² ↪ ℂP^∞`; McCord map `S¹ → 𝕊`, `𝕊` the four-point pseudocircle | `pt → D²`: weak equivalence between CW spaces, homotopy equivalence. `S² ↪ ℂP^∞`: `π₃`: `ℤ → 0`, not a weak equivalence, no conclusion | McCord: weak equivalence, but every map `𝕊 → S¹` is constant, so no homotopy inverse; `CWType 𝕊` fails: excluded | Needs CW type on both sides (Tau Ceti line 236); README says "spaces of CW type"; no change |

The rows for the statements the diff does not touch stand as in the previous review, of `a27c21d`.

- dg-lean resolved at `161db4ede65f2dd359263a301c33ec39036988eb` (commit of 2026-10-19 UTC). `DG/Positive/FreeFormality.lean`: `namespace DG`, `IsFreeGradedCommAlgebra` (fields `mem`, `isGradedCommStrict`, `existsUnique_lift`; `[CommRing R]`), `isFormal_of_isFreeGradedCommAlgebra` (`[IsCDGA A]`). `DG/Positive/Formality.lean`: `IsFormal := QuasiIsomorphic A (Cohomology A)`, an `EqvGen` zigzag of `BundledDGRing`s over `[Ring A] [DGAddCommGroup A] [DGRing A]`. `LICENSE`: Apache-2.0. 9 claims of the paragraph, 0 contradicted.
- dg-lean's 262 `.lean` paths: none on Sullivan algebras, polynomials, simplicial sets or topology. `DG/Positive/Minimal.lean` treats minimal finite-cell DG modules. `DG/Lie/ChevalleyEilenbergAlgebra.lean` covers ordinary Lie algebras, the object 5.2 takes from ArithmeticLocallySymmetricSpaces §ALS.F.5, so leaving it out of the map is consistent.
- LeanPool at `f8b9b72`: 30 of the 31 `.lean` files of `LeanPool/WhiteheadTheorem` have the header "Authors: Jiazhen Xia"; the aggregator `Imports.lean` has "Lean Pool contributors". NOTICE line 328 gives the upstream repository `jzxia/WhiteheadTheorem`, and lines 9–11 refer authorship to the file headers. Remark: the NOTICE names the repository rather than the author.
- Declarations opened at the pin: Tau Ceti `TauCeti/AlgebraicTopology/Homotopy/Whitehead.lean` lines 236, 243, 263, 345. Cross-references resolved: AlgebraicTopology §8.5 (line 3413, main `9e3a5b8`); the README's contract "§§8.3 and 8.5: Hurewicz and Whitehead theorems (6.2, 6.3, 6.4)" (lines 221–223); `Suggested.lean` lines 141 (`existsUnique_algHom`) and 303 (`IsFormal`).
- Gate: the worker's gate passes every check, build included. Rerun at this head: every check 0 except `depcheck: NOT IN ORDER: RationalHomotopyModels (insert it after its last supplier)`, which is not a defect. Against the candidate order (roadmap at line 442): `depcheck: 259 roadmaps, 2458 edges, 0 problem(s)`, no UPWARD, no CYCLE.
- Elaboration: `lake env lean` on `Suggested.lean` gives 13 `declaration uses sorry` warnings (lines 141–327) and nothing else. `Suggested.lean` has not changed since `a27c21d`; its 20 elaborated signatures, 0 with a dropped binder, stand. Nothing outside the folder changed against main.
- Pull request's text: the **Provenance** paragraph and the dg-lean item under **Other formalisations searched** agree with the head (commit, licence, declarations, the `IsFormal` difference). No change since `a27c21d` is left unstated, since the References re-wraps change only line breaks. Seeded sample: none of the 15 targets falls in a changed passage, and the changed text cites no source locator.
- Remark on untouched text: `IsFreeGradedCommutative` is `ΛV` only in characteristic zero. Conventions (lines 103–111) already says this, with the `𝔽₂[e]` witness.

Overlap check: read this round EllAdicHomotopyTypesAndWeights (lines 63–75: its five contracts still cite §§1.1–1.3, 2.1–2.4, 3.1–3.5, 4.1–4.4, all present), and searched all open heads and main for dg-lean (only this README). KanQuillen, CyclicHomologyLieHomologyAndQuasiFreeAlgebras, SuperconnectionsAndMathaiQuillenForms, HomotopyTheoryOfCategories, DGAInfinity, DeRhamCohomologyAndDuality and SymplecticFieldTheory stand as read in the earlier reviews. The changed text adds no owned object: Whitehead's theorem is Tau Ceti's, consumed through AlgebraicTopology §8.5. Nothing else is shared.

Source independence: changed passages only. 4 passages (the LeanPool adaptation sentence, the Whitehead paragraph, the dg-lean paragraph, the dg-lean References entry) were compared with 2 sources: LeanPool's NOTICE and file headers at `f8b9b72`, and dg-lean's docstrings and definitions at `161db4e`. The longest shared run is "free graded-commutative" (2 words), besides declaration names, so nothing is copied. The largest locator share is Hess2007, as in the earlier audit. No layer was added, removed or reordered, so the contents were not compared again.

## Not verifiable

- FHT2001 and DGMS1975 are settled as uncertified. Quillen 1969, Bousfield–Gugenheim 1976 and the Félix–Halperin and Amann–Zoller preprints have no text in the sources cache. None of them is cited in the changed passages.
- dg-lean was read through GitHub's raw files at the full hash, file by file. `DG/Algebra/Commutative.lean` (the `IsCDGA` class) was not opened this round.

## Source issues

- none

## For the human reviewers

- **Not tested.** FHT2001 and DGMS1975 are uncertified, and Quillen 1969 and Bousfield–Gugenheim 1976 have no open text here. The comparisons for Layers 5–7 used only Hess2007, Morgan1978, Sullivan1977 and the Félix–Halperin survey.
- **Licence.** apellis/dg-lean's `LICENSE` at `161db4e` is Apache-2.0 and names no copyright holder. Its formality files carry no per-file header. README lines 1245–1253 map it, and the description says nothing in `Suggested.lean` comes from it. rootkiller6788/mini-algebraic-topology was not opened.
- **Licence.** In LeanPool's NOTICE (`f8b9b72`, line 328), `WhiteheadTheorem` is listed under Apache-2.0 with upstream `jzxia/WhiteheadTheorem`, and its file headers state Apache 2.0. The README calls LeanPool not a dependency. The description says its maintainers have not been contacted.
