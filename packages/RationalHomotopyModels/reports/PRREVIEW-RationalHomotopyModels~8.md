# Review of RationalHomotopyModels (pull request #2298 at 2178204)

**Verdict:** accepted

No finding. Incremental re-review: the folder has 0 changed lines since `2b7b442` (the head only merges main), and this round reads the title and description against the head.

## Previous findings

- none: the review of `2b7b442` accepted with no finding, and `git diff 2b7b442 HEAD -- TauCetiRoadmap/RationalHomotopyModels` is empty.

## Verified sound

| Statement | Instances | One side | Other side | Result; change |
|---|---|---|---|---|
| 1.1 `IsFreeGradedCommutative.existsUnique_algHom` (description: "universal property is its theorem 1.1") | `A = Λ(x₁)`, `B` graded-commutative, `b ∈ B¹`; then `K = 𝔽₂`, `B = 𝔽₂[e]`, `b = e` | `CharZero`: `b² = −b²` gives `b² = 0`, so `1 ↦ 1`, `x ↦ b` is the one algebra map | `𝔽₂`: `x² = 0` in `A` (degree 2 is zero) but `e² ≠ 0`: no map | Holds with `[CharZero K]`, which the Lean carries; fails without; no change |
| 1.2 `IsSullivanAlgebra.isMinimal_iff` (description: headline 1.2) | `Λ(x₂, y₃)`, `dy = x²`; `Λ(u₁, v₂)`, `du = v` | First: `d(xᵏ) = 0`, `d(xᵏ y) = x^(k+2) ∈ A⁺·A⁺`; minimal. Second: `(A⁺·A⁺)² = K u² = 0` | Second: `du = v ∉ A⁺·A⁺`, so not minimal and `d(A⁺) ⊄ A⁺·A⁺` | Both sides true, resp. both false; no change |
| 3.5 `IsMinimalSullivanAlgebra.baseChange` (description: "three for 3.5") | `Λ(x₂, y₃)`, `dy = x²`, `K = ℚ → L`; `L = K` | `(1 ⊗ d)(1 ⊗ y) = (1 ⊗ x)²`, decomposable; `1 ⊗ xᵏ`, `1 ⊗ xᵏy` an `L`-basis of `L ⊗ A` | `L = K`: the statement is `hx` transported along `K ⊗_K A ≅ A` | Agrees; no change |

The adversarial rows for the other statements stand as in the previous review, of `2b7b442`.

- Pull request's text against the head: title; new folder with 3 files (`metadata.toml` is `topic = "math.AT"`), 1650 inserted lines, 48 headings; Layers 1–7 as the README's headings; 13 `sorry` theorems and 7 definitions (`Suggested.lean` lines 87–331); the six non-statable items (module docstring, lines 48–64); suppliers and sources. 0 sentences contradicted, 0 changes left unstated.
- Suppliers named in the description, resolved now: DGAInfinity, AlgebraicTopology, GeneralizedCohomology, StableHomotopyKTheory, ComplexKahlerGeometry, DifferentialGeometry are on main (2248bbb); DerivedDeRhamCohomology §2.21 (its README line 3418) and ArithmeticLocallySymmetricSpaces §ALS.F.5 (line 958) exist at their open heads and are not on main, positions 24 and 59 of the merge order. EllAdicHomotopyTypesAndWeights's five contracts (its README lines 68–76) carry the section lists the description gives; AlgebraicTopologyPartII Layer 4 is §§4.1–4.6 with no `A_PL` and no Sullivan algebra.
- Source locators of the description found at their text, 25: Hess2007 lines 243, 254, 297, 314, 361, 382, 408, 431, 445, 493, 556, 647, 1093; Morgan1978 lines 1017, 1024, 1036, 1054, 1064, 1119, 1162; Sullivan1977 lines 651, 663, 748, 1121 and Theorem (12.1) as cited at line 336. Each also occurs in the README. The seeded sample falls in no changed passage.
- Remarks on the description, no change asked: "Supporting definitions" names four predicates and the later "7 definitions" adds `positivePart`, `ExponentVector`, `standardMonomial`; the description cites StableHomotopyKTheory §3.36, as the supplier contract does, while the scope paragraph says §§3.36–3.37.
- Gate: the worker's gate at this head passes every check, build included. The rerun differs only in `depcheck: NOT IN ORDER: RationalHomotopyModels (insert it after its last supplier)`, which is not a defect for a roadmap the order does not list. Dependency check against the candidate order: `depcheck: 245 roadmaps, 2235 edges, 0 problem(s)`; no UPWARD, no CYCLE.
- Elaboration: `lake env lean` on `Suggested.lean` gives 13 `declaration uses sorry` warnings (lines 141–327) and nothing else. No change outside the folder against main (`git diff --stat origin/main...HEAD` outside the folder is empty).
- Citations: the resolver lists no cross-roadmap citation found nowhere; its three Lean-name leads (`exists_dgAlgHom_iff`, `bijective_of_bijective_cohomologyMap`, `isFormal_of_complement`) are this roadmap's own declarations, at `Suggested.lean` lines 151, 228, 315.
- Remark on untouched text: SymplecticFieldTheory §0.3 also develops the free supercommutative ℚ-algebra (noted in the earlier reviews).

Overlap check: read EllAdicHomotopyTypesAndWeights, KanQuillen, SuperconnectionsAndMathaiQuillenForms, DeRhamCohomologyAndDuality, DGAInfinity, SymplecticFieldTheory (and AlgebraicTopologyPartII Layer 4); the overlap list reports no shared roadmap, dropped id or second copy. RationalHomotopyModels owns the Sullivan and polynomial-form contracts EllAdicHomotopyTypesAndWeights consumes; DGAInfinity owns tensor coalgebras, cobar, `A∞` formality and Massey products; nothing else is shared.

Source independence: changed passages only. The folder has 0 changed lines; the description's source list (25 locators) was set beside 3 sources (Hess2007, Morgan1978, Sullivan1977) and shares no wording with them. Largest locator share Hess2007, as in the earlier audit; no layer was added, removed or reordered, so contents were not compared again. FHT2001 and DGMS1975 were not read.

## Not verifiable

- FHT2001 and DGMS1975: settled as uncertified; the description's DGMS locators (§4 Definition, Theorem 4.1, p. 261, §6 Main Theorem) agree with the README and were not checked against the paper.
- Quillen 1969 Theorem I, Bousfield–Gugenheim 1976, and the Félix–Halperin and Amann–Zoller preprints: no text in the sources cache; the locators agree with the README.
- The description's "Checks run" (a local Mathlib of 12 Oct. 2026) and "Other formalisations searched" paragraphs report the author's own runs and searches of outside repositories; they describe nothing in the head and were not reproduced.

## Source issues

- **Misprint** in Sullivan1977 at §3, Corollary (3.6), p. 285: the source labels the bijection on homotopy classes a Corollary there but refers to it later as Proposition (3.6); it should use one label; affects nothing.

## For the human reviewers

- **Not tested.** FHT2001 and DGMS1975 are uncertified, and Quillen 1969 and Bousfield–Gugenheim 1976 have no open text here. The comparisons for Layers 5–7 used only Hess2007, Morgan1978, Sullivan1977 and the Félix–Halperin survey.
- **Licence.** The description names apellis/dg-lean (Apache-2.0, with `DG.IsFormal`, `DG.IsFreeGradedCommAlgebra`) and rootkiller6788/mini-algebraic-topology (no licence file) and says nothing in `Suggested.lean` is taken from them. This review did not open either repository.
