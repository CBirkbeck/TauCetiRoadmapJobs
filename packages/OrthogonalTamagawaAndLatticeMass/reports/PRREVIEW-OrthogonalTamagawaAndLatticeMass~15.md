# Review of OrthogonalTamagawaAndLatticeMass (pull request #1222 at 92c0d27)

**Verdict:** needs changes

This is an incremental re-review of the 11 lines changed since `12c963e`. The change repairs R02 of the previous review (the Conway–Sloane §12 locator) correctly and introduces no new problem. One finding remains, carried unchanged: the branch pin.

## R01 (P2) — The README is written against main's Tau Ceti, but the branch still pins `a91d3aa`

Re-raised: H01

**Location.**
- `lake-manifest.json`: Tau Ceti `a91d3aafa8cd…`, Mathlib `6b7abb3c…`. Main pins Tau Ceti `2fd255d` and Mathlib `1b1ccf4b`.
- `TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass/README.md` line 30: "The genus, the masses and the local densities are native; the files below are in `TauCeti/NumberTheory/IntegralLattice/`."

**Claim.** The From Tau Ceti contract and the Tau Ceti declarations cited in §§1.1–1.4, 2.2, 3.1, 4.1 and 4.2 exist at the pin.

**Witness.** Recounted at this head: of the 40 Tau Ceti files the README cites by full path, `git cat-file -e` finds 15 at `a91d3aa` and all 40 at `2fd255d`. `git grep` at `a91d3aa` finds no file mentioning `localDensity`, `SameGenus`, `specialOrthogonalGroupVolume` or `binaryDiscriminant`; at `2fd255d` it finds 6, 13, 1 and 8.

**Why the repair report's reason does not settle it.** H01's answer assigns the merge of `origin/main` to the worker. That is the right owner of the step, but the merge has not happened at `92c0d27`, and the contract of lines 26–58 still names objects that the pins this review must use do not contain.

**Repair.** Unchanged from the previous review.
1. **Worker or human.** Merge `origin/main` into the branch, which moves the pins to Tau Ceti `2fd255d` and Mathlib `1b1ccf4b`. All cited files exist there.
2. **Author, after the merge, inside the folder.** `localDensity`, `genusMass` and `SameGenus` of `Suggested.lean` then restate `Matrix.localDensity`, `TauCeti.IntegralLattice.mass` and `TauCeti.IntegralLattice.SameGenus`.
   - Restate `genusMass_eq` and `genusMass_eq_rank_two` on `(nativeLattice G).mass` and `Matrix.localDensity`.
   - State `evenUnimodularMass_eq` and the four class counts on `TauCeti.IntegralLattice.e8PowLattice`.
   - Delete the three duplicated definitions and the three "agrees with its native counterpart" bullets of §1.3.
   - Un-backtick the README names of what is deleted.

   This step was not elaborated: this review's Lean commands run only at the branch pins.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; README line 30 still reads "The genus, the masses and the local densities are native". Held as R01 above.
- R02 — repaired: README lines 253, 274, 323 and 462 and `Suggested.lean` lines 146–147 now add "with the density α_p and the p-mass related in §12, p.281" to the Conway–Sloane locators. No new problem.

## Verified sound

### The changed passages

- **The diff.** Four README sentences and one docstring gain the §12 clause, and nothing else changes. No statement, hypothesis, name, section number or supplier citation is touched, and no Lean signature changes: the docstring edit moves `genusMass_eq_rank_two` from line 147 to 148.
- **The new locator, read in the cached text.**
  - ConwaySloaneMass line 186 opens §4 on printed p.263 (line 185). Lines 187–190 say the formula uses the p-masses rather than the densities α_p and point to §12. Equation (2) is at lines 191–194, for n ≥ 2 and all primes.
  - §12 starts at line 1086, on printed p.281 (the next page header, line 1106, is p.282). Lines 1092–1099 define α_p as the count of X with XᵀAX ≡ A mod p^r divided by p^(rn(n−1)/2). Lines 1100–1104 give m_p = p^(s(n+1)/2)/α_p with p^s the exact power in det A.
  - So "the density α_p and the p-mass related in §12, p.281" is exact at all five places.
- **Consistency.** The six README mentions of §12 (lines 253, 274, 313, 323, 462 and the reference entry at 609) and the two docstring mentions (lines 132, 147) agree on section and page.
- **Seeded sample.** Of the sampled targets, the diff falls in 1.3 (lines 274, 323) and 2.3 (line 462), plus 1.2 (line 253). Their only changed text is this locator.

### Gate, dependency check, Lean

- **Worker's gate** (`gate.md`): `OK`, every counter 0, `build=0` included.
- **My rerun of the gate on `92c0d27`:** `OK`, every counter 0, including `outside-folder=0`, `stray-files=0`, `readme-ids-missing=0` and `depcheck=0`.
- **Pull request contents.** The folder holds `README.md`, `Suggested.lean` and `metadata.toml`. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check with `--movable`:**

  ```text
  depcheck: 235 roadmaps, 2268 edges, 0 problem(s)
  ```

  It printed no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` of `Suggested.lean` printed exactly seven warnings, `declaration uses 'sorry'`, at lines 133, 148, 179, 186, 190, 194 and 198. These are the previous report's seven declarations, shifted by the one added docstring line.
- **Binder audit and padding probe.** No declaration's type changed, and `signatures.md` reports 0 of 22 with a lost binder. The previous report's `#check @` audit and one-tactic probe (all seven fail) stand.
- **Overlaps and citations.** `overlaps.md` lists no pull request that changes this roadmap and no dropped id. `citations.md` has the one lead the previous report resolved (`IntegralQuadraticLattice.ofCarrier`, a README target of GeometryOfNumbersAndQuadraticArithmetic §2.2). The diff adds no cross-roadmap citation and no library name.

### Adversarial table

The diff changes no statement, so rows 1–34 of the previous report (at `12c963e`) carry forward unchanged; the rows for the sampled targets, the headlines and the finding are repeated here with that report's computed values. Row L is new.

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| L | §12 clause (lines 253, 274, 323, 462; docstring 146–147) | A₂ in equation (2) with 2m_p = p^(s(n+1)/2)/β_p; I₃ at 2 | A₂: s = 0 at 2, s = 1 at 3, α₂ = α₃ = 12, so (2/π)·3^(3/2)·(1/6)·(1/6)·(3/2)·π/(3√3) = 1/12 = `genusMass`; I₃: N(2³)/2⁹ = 6144/512 = 12 = α₂ | §12 gives exactly the conversion the formulas use | none |
| 1–2 | 0.0 Checks (previous rows 1–2) | diag(1,2), A = [[1,1],[0,1]]; empty matrix | AᵀGA = [[1,1],[1,3]]; \|O\| = 4, \|SO\| = 2; empty: 1 | True | none |
| 3 | 0.1 Checks (row 3) | V = 0; x²+y²+z² | C⁰ norm-one {±1} vs Spin {1}; spinor norm 1·2 = 2, not a square | True | none |
| 4 | 0.1a orders (row 4) | xy, x²+xy+y² over 𝔽₂; r = 0 | 2 = 2(2−1); 6 = 2(2+1); split formula at r = 0 gives 0, not 1 | True | none |
| 5 | 0.2 transpose Check (row 5) | C = diag(1,4), M = [[0,1/2],[2,0]] | MCMᵀ = diag(1,4); MᵀCM = diag(16,1/4) | True | none |
| 6 | 1.1 Checks (row 6) | A₂; [[4,1],[1,6]] | m⁺ = 1/6 = 2·(1/12); 3/2 = 2·(1/4+1/2) | True | none |
| 7 | 1.2 gauge (row 7) | n = 3, 4 | V₃ = 8π², s₃V₃ = 4π²; V₄ = 16π⁴ | True | none |
| 11–13 | `genusMass_eq` (rows 11–13) | I₃, I₄, E₈ | (1/π²)(1/6)(π²/8) = 1/48; π⁻⁴·(1/6)·π⁴/64 = 1/384; 1/696729600 | True | none |
| 14 | rank hypothesis (row 14) | ⟨1⟩ | expression 1 vs mass 1/2 | `3 ≤ n` needed | none |
| 15–19 | `genusMass_eq_rank_two` (rows 15–19) | I₂, A₂, [[4,1],[1,6]], diag(1,3), diag(1,5) | limits 1/8, 1/12, 3/4, 1/4, 1/4; products to 2·10⁶: 0.1250066, 0.0833372, 0.7500620, 0.2500116, 0.2500132 | True | locator now complete |
| 20–23 | 1.4 Checks (rows 20–23) | A₂, diag(1,3), −23 | Δ = −3, −12, −23; (1/36)(3/2) = 1/24; 1/184 = 1/(8·23) | True | none |
| 24–26 | 2.1, 2.2 (rows 24–26) | ⟨1⟩, ⟨2⟩, U, [[1,1],[1,2]] over ℤ₂ | #𝒢̃(𝔽₂) = 2; α₂ = 4, 8, 4, 8 | Match | none |
| 27 | 2.3 Checks (row 27) | A₂, −23 genus, E₈ | 1/12, 3/4; without the 2⁸ at 2: 256/696729600 | True | none |
| 28 | `evenUnimodularMass_eq` (row 28) | m = 4, 8 | 1/696729600; 691/277667181515243520000 | True | none |
| 30 | `rank16_classNumber` (row 30) | the two orders | 1/970864271032320000 + 1/685597979049984000 = M₁₆ | True | none |
| 31–33 | 4.1, 4.2 (rows 31–33) | D₄, E₆, E₇; 24 classes | 192; 51840; 2903040; Σ = 1027637932586061520960267/129477933340026851560636148613120000000 = M₂₄ | True | none |
| 34 | `rank32/40` bounds, 4.3 (row 34) | M₃₂, M₄₀ | 2M₃₂ = 80618465.87; 2M₄₀ = 8.786·10⁵¹ | True | none |
| P | Pin (R01) | 40 Tau Ceti files cited by full path | 15 at `a91d3aa`, 40 at `2fd255d` | Defect | R01 |

### Headline inventory

Unchanged from the previous report.
- **Stated:** `genusMass_eq`, `genusMass_eq_rank_two`, `evenUnimodularMass_eq`, `rank16_classNumber`, `rank24_classNumber`, `rank32_classNumber_lower_bound`, `rank40_classNumber_lower_bound`.
- **Named in the module docstring as not statable:** 0.1, 0.1a, 0.3, the 1.2–1.3 measure identities, and 2.1–2.2.

## Not verifiable

- O'Meara, *Introduction to Quadratic Forms*, 104:4–5 (§0.3): the manifest records it as uncertified and settled, so it is cited by its locator only. The diff does not touch it.
- Lean at main's pins: step 2 of R01's repair was not elaborated, since this review's Lean commands run at the branch pins.

## Source issues

- none
