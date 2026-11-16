# Review of BianchiModularForms (pull request #1719 at 32c8acc)

**Verdict:** needs changes

Incremental re-review of 9 changed lines since 722ea50 (two bullets of `## Exact supplier contracts`).

## R01 (P3) — `Doset` is not a declaration of the pinned Mathlib

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:203` (a line this change rewrites): "`MulAction.orbitRel.Quotient`, `Subgroup.relIndex`, `Doset`, and the Hecke ring carrier `HeckeRing Δ H R`".

**Claim:** The bullet lists `Doset` under "From Mathlib"; the pinned Mathlib has no declaration or namespace of that name, and the carrier the same sentence now cites is built on its replacement.

**Witness:** A whole-word search for `Doset` in the pinned Mathlib returns nothing. `Mathlib/GroupTheory/DoubleCoset.lean:34` opens `namespace DoubleCoset` (`doubleCoset` :37, `setoid` :75); `Mathlib/NumberTheory/HeckeRing/Defs.lean:152` defines `HeckeCoset.setoid` from `DoubleCoset.setoid`.

**Repair:** Replace `` `Doset` `` by `` `DoubleCoset.doubleCoset` and `DoubleCoset.setoid` (`Mathlib/GroupTheory/DoubleCoset.lean`) ``. Both names resolve at the pin; the README has no other occurrence of `Doset`.

## Previous findings

- none: the previous report, of `722ea50`, had no finding.

## Verified sound

| Statement | Instances and values on each side | Result |
|---|---|---|
| "From Mathlib": `HeckeRing Δ H R`, notation `𝕋 Δ H R`, finitely supported `R`-combinations of double cosets `H\Δ/H`, in `Mathlib/NumberTheory/HeckeRing/Defs.lean` | Pin: `abbrev HeckeRing Δ H Z := HeckeCosetModule Δ H H Z` (:189), `HeckeCosetModule := HeckeCoset Δ H₁ H₂ →₀ Z` (:183), scoped notation `𝕋` (:193); file imported by `Mathlib` (`Mathlib.lean:6044`). No product in that file. | Sound. |
| "From Tau Ceti": convolution product, semiring; ring when `R` is one; for `IsHeckeTriple Δ H H`; degree; commutativity criterion | `instSemiringHeckeRing [IsHeckeTriple Δ H H]` (`Associativity.lean:477`), `instRingHeckeRing` for `[Ring R']` (:484); `LeftCosetModule.deg : 𝕋 Δ H R →+* R` (`Degree.lean`); `commSemiringOfAntiInvolution` (`Commutativity.lean:478`). `IsHeckeTriple` is Mathlib's class (`Defs.lean:75`), Tau Ceti defines none. | Sound. |
| §4.3, `𝕋 Δ₀(𝔫,𝔞) Γ₀(𝔫,𝔞) ℤ` (cited by the changed bullet) | Coefficients `ℤ`: a ring, so the `Ring` instance applies (over `ℕ` only the semiring). `Δ = H`: one double coset, `𝕋 ≅ R`, degree the identity. `K = ℚ(i)`, `𝔭 = (2 + i)`: `|𝔞⁻¹/π𝔞⁻¹| + 1 = 5 + 1 = 6 = N𝔭 + 1`, the degree of the double coset, as the §4.3 Check says. | Sound. |
| Description: "reuses Mathlib's cohomology, Tau Ceti's Hecke rings" | Head: carrier from Mathlib, ring structure, degree and commutativity from Tau Ceti (`README.md:203–205`, `:236–238`). | Not contradicted. |

Rows for every other statement stand as in the previous review, of `722ea50`.

- Folder change since `722ea50`: 9 lines, `README.md` only; no heading, section number, supplier roadmap or Lean declaration changed; nothing changed outside the folder (`git diff --stat origin/main...HEAD` outside it is empty).
- Library declarations opened at the pins: 9 (Mathlib `HeckeRing`, `HeckeCosetModule`, `HeckeCoset.setoid`, `IsHeckeTriple`, `DoubleCoset`; Tau Ceti `instSemiringHeckeRing`, `instRingHeckeRing`, `LeftCosetModule.deg`, `commSemiringOfAntiInvolution`).
- Other mentions of the Hecke ring in the README (`:1138–1147`, `:1311`) agree with the new attribution.
- Description against the head: the change alters no count or claim it makes (10 layers, 66 sections, 2 theorems, 8 definitions, sole import `Mathlib`, eight open suppliers); no sentence contradicted, nothing left unstated.
- Gate, rerun on this head: every counter 0, `OK`; the worker's gate with the targeted build reports `build=0 OK`.
- Dependency check: `depcheck: 250 roadmaps, 2380 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with exactly two `declaration uses sorry` warnings (lines 140, 160); the file is unchanged since `722ea50`.
- Seeded sample: no target falls in the changed passages; 0 source locators re-read. Cross-roadmap citations: the resolver lists none unresolved (its eight names are LMFDB knowl ids); the change adds none.

Overlap check: read MaassForms, HilbertModularForms, KleinianGroups, EllipticCurvePeriodsAndModularParametrizations, SiegelModularForms, ModularForms, LFunctions, ZerosOfLFunctions as in the previous review; the change moves no ownership (the Hecke ring carrier is Mathlib's, its ring structure Tau Ceti's, neither is a roadmap's); nothing owned twice.

Source independence: changed passages only; 2 passages compared with 0 sources (they cite the pinned libraries only, and describe the carrier in the terms its definition forces); the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- Swan 1971 (Adv. Math. 6): recorded `uncertified` in the manifest; cited by locator, as in the previous reports.
- "One of 23 roadmaps for the mathematics behind the LMFDB, opened as drafts" (description): a statement about other pull requests, outside what this review reads.

## Source issues

- none

## For the human reviewers

- none
