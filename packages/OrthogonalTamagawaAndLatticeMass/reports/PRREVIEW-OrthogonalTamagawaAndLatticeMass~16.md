# Review of OrthogonalTamagawaAndLatticeMass (pull request #1222 at de8efdc)

**Verdict:** needs changes

This is an incremental re-review of the 2 lines changed since `92c0d27`. The change adds one sentence to the From Tau Ceti contract (README line 28), naming Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b` as the revisions the contract is written against. The sentence is accurate: every name, file and line number it covers checks out at those revisions. It does not repair R01, because the branch still pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3c`. One finding remains.

## R01 (P2) — The README is written against main's Tau Ceti, but the branch still pins `a91d3aa`

Re-raised: H01

**Location.**
- `lake-manifest.json` pins Tau Ceti `a91d3aafa8cd…` and Mathlib `6b7abb3c…`. Main pins `2fd255d9…` and `1b1ccf4b…`.
- `TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass/README.md` line 28: "The declarations, files and line numbers of this contract, and every Tau Ceti declaration cited in the layers, are those of Tau Ceti at `2fd255d9`, with Mathlib at `1b1ccf4b`."
- `TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass/Suggested.lean` lines 9–10: "It states, against the pinned Mathlib and Tau Ceti, the headline theorems …"

**Claim.** The README's Tau Ceti contract, and the Tau Ceti declarations cited in §§1.1–1.4, 2.2, 2.3, 3.1, 4.1 and 4.2, are statements about the library this pull request is built and reviewed against.

**Witness.** The branch pins `a91d3aa`. Of the README's 50 cited Tau Ceti files, 50 exist at `2fd255d9` and 15 at `a91d3aa`; all 16 line locators (`Genus.lean` 77 to `JordanSplitting.lean` 189) point into files absent at `a91d3aa`.

**What the new sentence changes, and what it leaves.**
- **What it fixes.** The README no longer implies that its contract holds at the branch pin. Naming a revision follows main's precedent: AlgebraicVectorBundles lines 50, 226 and 269 and GeometricTopology line 323 name the same `2fd255d9` and `1b1ccf4b`.
- **The two files now name different revisions.** The README names `2fd255d9`/`1b1ccf4b`. The acceptance test is built at `a91d3aa`/`6b7abb3c`, which its docstring calls "the pinned Mathlib and Tau Ceti".
- **Duplication at the revision the README names.** At `2fd255d9`, `Suggested.lean`'s `SameGenus`, `genusMass` and `localDensity` restate three native declarations:
  - `TauCeti.IntegralLattice.SameGenus` (`Genus.lean` line 77);
  - `TauCeti.IntegralLattice.mass` (`Mass.lean` line 91);
  - `Matrix.localDensity` (`LocalDensity/Basic.lean` line 546).

  The README confirms this: line 9 says each "agrees with its native counterpart", and §1.3 (line 280) gives each "its agreement with the native object". The house rule is that what exists at the pins is deleted and cited.

**Why the repair report's reason does not settle it.** H01 says that steps 1 and 2 "cannot be committed inside the folder before that merge". That is true as far as the author is concerned. It assigns the step to someone else, but it is not a reason the defect is absent. The pull request still pins `a91d3aa`, and if it merged unchanged it would put three restatements of native Tau Ceti declarations on main. The remaining step is the merge of `origin/main`, which a worker or a human has to make. Until that happens the finding stands.

**Repair.**
1. **Worker or human.** Merge `origin/main` into the branch, which moves the pins to Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`.
   - All 50 cited files exist there.
   - The repair report says `git merge-tree origin/main HEAD` is clean; this review did not rerun it.
2. **Author, after the merge, inside the folder.** Commit the post-merge form that the repair report for H01 already wrote and elaborated at `2fd255d9`/`1b1ccf4b`.
   - Delete `SameGenus`, `genusMass`, `localDensity` and the definitions that only serve them.
   - Add `halfDensityInv`.
   - State `genusMass_eq` and `genusMass_eq_rank_two` on `(nativeLattice G).mass`.
   - State `evenUnimodularMass_eq` and the four class counts on `IntegralLattice.e8PowLattice k`, keeping `0 < k`.
   - Make the matching README edits in Scope, Conventions, §0.0, §1.3, §3.1 and §§4.1–4.3.

   Line 28 can stay as written.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. README line 28 now names `2fd255d9`, and `Suggested.lean` still defines `SameGenus`, `genusMass` and `localDensity`. Held as R01 above.

## Verified sound

### The changed passage (README line 28)

The diff adds that sentence and one blank line, and nothing else. `git diff 92c0d273 HEAD --stat` reports 2 insertions to `README.md`. `Suggested.lean` is byte-identical to `92c0d27`. Every claim the sentence makes was checked at the revisions it names.

- **Line locators: 16 of 16 correct at `2fd255d9`.** Each line read by `git show 2fd255d9:<file>` is the declaration the README names:
  - `Genus.lean` 77 is `def SameGenus`.
  - `ClassNumber.lean` 76 and 144 are `genusClasses` and `classNumber`.
  - `Mass.lean` 91, 100 and 221 are `mass`, `properMass` and `sum_inv_natCard_isometry_eq_mass_iff`.
  - `LocalDensity/Basic.lean` 546 is `localDensity`.
  - `LocalDensity/EulerProduct.lean` 109 and 161 are the two `hasProd_inv_half_localDensity_*` theorems.
  - `EvenUnimodularGenus.lean` 64 is `IsPosDef.sameGenus_of_isEven_of_isUnimodular`.
  - `E8Genus.lean` 65 is `mass_typeE₈RootLattice`.
  - `PosDef/EvenUnimodular.lean` 84 is `e8PowLattice`.
  - `Dyadic/DensityExponent/Basic.lean` 154, 164 and 178 are `nM`, `nQ` and `densityExponent`.
  - `JordanSplitting.lean` 189 is `dyadicJordanProfile`.

  All 10 of these files are absent at `a91d3aa`. (The repair report says 17 locators; the README has 16.)
- **Files.**
  - Of the 40 full paths, 40 exist at `2fd255d9` and 15 at `a91d3aa`.
  - Of the 10 paths relative to `TauCeti/NumberTheory/IntegralLattice/`, 10 exist at `2fd255d9` and 0 at `a91d3aa`.
- **Names.**
  - Of the 206 backticked tokens, 88 are `TauCeti.`-prefixed. All 88 are declared at `2fd255d9`; 37 are declared at `a91d3aa`.
  - Counting the Mathlib-namespace declarations that Tau Ceti owns (`Matrix.localDensity*`, `RootPairing.*`, `CoxeterSystem.parabolicHom*`, `RootfulNiemeierType.*`, `DirichletCharacter.conductor_ringHomComp`), 148 library names are declared in Tau Ceti at `2fd255d9` and 60 at `a91d3aa`.
- **Mathlib at `1b1ccf4b`.** All 18 contract names I searched are declared there. Among them:
  - `DirichletCharacter.LFunction_changeLevel`, `differentiable_LFunction`, `LFunction_ne_zero_of_one_le_re` and `changeLevel`;
  - `Int.IsFundamentalDiscr`, `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`, `riemannZeta_residue_one` and `riemannZeta_two_mul_nat`;
  - `Real.Gamma_one_half_eq` (`Gaussian/GaussianIntegral.lean` line 306) and `Real.Gamma_add_one`;
  - `bernoulli_one`, `sum_bernoulli` and `bernoulliPowerSeries_mul_exp_sub_one`;
  - `lipschitzGroup`, `spinGroup`, `RootPairing.instFlipIsReduced`, `exists_rat_btwn` and `Filter.limUnder` (`Topology/Defs/Filter.lean` line 270).
- **Imports.** The four `TauCeti.*` modules that `Suggested.lean` imports (`IntegralLattice.Basic`, `Isometry.Group`, `Even`, `Unimodular`) exist at both revisions, so the merge does not break them.
- **Text that now reads at `2fd255d9`.** README line 140 says the "pinned library" proves smoothness and reductivity only for the standard form. That is true at `2fd255d9` as at `a91d3aa`: `TauCeti/Algebra/AlgebraicGroup/ConstantForm/` contains only `Basic.lean` and `Tangent.lean`, and neither has a smoothness, connectedness or reductivity theorem.
- **Seeded sample.** The diff falls in the supplier contract that targets 1.1, 1.2, 1.3, 2.3, 3.1, 4.1 and 4.2 consume. Every Tau Ceti name they cite is in the counts above. No source locator, statement or hypothesis of any sampled target changed. The source checks of earlier reports (Conway–Sloane, Belolipetsky–Gan, Cho, Chenevier–Lannes, Fomin–Reading, Milne, Borcherds) carry forward unchanged.

### Gate, dependency check, Lean

- **Worker's gate** (`gate.md`): `OK`, every counter 0, including `build=0`.
- **My rerun of the gate on `de8efdc`:** `OK`, every counter 0, including `outside-folder=0`, `stray-files=0`, `readme-ids-missing=0` and `depcheck=0`.
- **Pull request contents.** The folder holds `README.md`, `Suggested.lean` and `metadata.toml`. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check with `--movable`:**

  ```text
  depcheck: 235 roadmaps, 2268 edges, 0 problem(s)
  ```

  It printed no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` of `Suggested.lean` at the branch pins printed exactly seven warnings, `declaration uses 'sorry'`, at lines 133, 148, 179, 186, 190, 194 and 198, and nothing else.
- **Binder audit and padding probe.** No declaration changed. `signatures.md` reports 0 of 22 with a lost binder. The earlier `#check @` audit and one-tactic probe (all seven headlines fail it) stand.
- **Overlaps and citations.**
  - `overlaps.md` lists no pull request that changes this roadmap and no dropped id.
  - The single lead in `citations.md`, `IntegralQuadraticLattice.ofCarrier` at README line 76, resolves to GeometryOfNumbersAndQuadraticArithmetic 2.2.1 at the head of its open pull request (its README line 511).
  - The diff adds no cross-roadmap citation and no construction, so ownership is unchanged.

### Adversarial table

The diff changes no mathematical statement. Rows 1–34 of the earlier reports carry forward unchanged (computed at `12c963e`, carried at `92c0d27`). The rows for the sampled targets and the headlines are repeated with their computed values. Rows V, D and P are new.

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| V | README line 28: contract and layer citations at `2fd255d9`/`1b1ccf4b` | 16 line locators; 50 files; 88 `TauCeti.` names; 148 Tau Ceti-declared names; 18 Mathlib names | 2fd: 16/16 lines name the cited declaration, 50/50 files, 88/88, 148/148, 18/18 at `1b1ccf4b`. a91: 0/16 files present, 15/50, 37/88, 60/148 | True at the named revision | none |
| D | README line 28 against the `Suggested.lean` docstring ("the pinned Mathlib and Tau Ceti") | revisions named in each file | README: `2fd255d9`/`1b1ccf4b`; manifest: `a91d3aa`/`6b7abb3c` | Disagree | R01 |
| P | Pin, and duplication at the named revision | `SameGenus`, `genusMass`, `localDensity` | 2fd: natives at `Genus.lean` 77, `Mass.lean` 91, `LocalDensity/Basic.lean` 546, so 3 restatements. a91: the 3 files are absent | Defect | R01 |
| L | §12 clause (r15 row L) | A₂ at 2 and 3; I₃ at 2 | A₂: α₂ = α₃ = 12, (2/π)·3^(3/2)·(1/36)·(3/2)·π/(3√3) = 1/12. I₃: 6144/512 = 12 = α₂ | True | none |
| 1–2 | 0.0 Checks | diag(1,2) with A = [[1,1],[0,1]]; empty matrix | AᵀGA = [[1,1],[1,3]]; \|O\| = 4, \|SO\| = 2; empty: 1 | True | none |
| 3 | 0.1 Checks | V = 0; x²+y²+z² | C⁰ norm-one {±1} vs Spin {1}; spinor norm 1·2 = 2, not a square | True | none |
| 4 | 0.1a orders | xy and x²+xy+y² over 𝔽₂; r = 0 | 2 = 2(2−1); 6 = 2(2+1); the split formula at r = 0 gives 0, not 1 | True | none |
| 5 | 0.2 transpose Check | C = diag(1,4), M = [[0,1/2],[2,0]] | MCMᵀ = diag(1,4); MᵀCM = diag(16,1/4) | True | none |
| 6 | 1.1 Checks | A₂; [[4,1],[1,6]] | m⁺ = 1/6 = 2·(1/12); 3/2 = 2·(1/4+1/2) | True | none |
| 7 | 1.2 gauge | n = 3, 4 | V₃ = 8π², s₃V₃ = 4π²; V₄ = 16π⁴ | True | none |
| 11–13 | `genusMass_eq` | I₃, I₄, E₈ | (1/π²)(1/6)(π²/8) = 1/48; π⁻⁴·(1/6)·π⁴/64 = 1/384; 1/696729600 | True | none |
| 14 | rank hypothesis `3 ≤ n` | ⟨1⟩ | expression 1 vs mass 1/2 | Hypothesis needed | none |
| 15–19 | `genusMass_eq_rank_two` | I₂, A₂, [[4,1],[1,6]], diag(1,3), diag(1,5) | limits 1/8, 1/12, 3/4, 1/4, 1/4; partial products to 2·10⁶: 0.1250066, 0.0833372, 0.7500620, 0.2500116, 0.2500132 | True | none |
| 20–23 | 1.4 Checks | A₂, diag(1,3), −23 | Δ = −3, −12, −23; (1/36)(3/2) = 1/24; 1/184 = 1/(8·23) | True | none |
| 24–26 | 2.1, 2.2 | ⟨1⟩, ⟨2⟩, U, [[1,1],[1,2]] over ℤ₂ | #𝒢̃(𝔽₂) = 2; α₂ = 4, 8, 4, 8 | Match | none |
| 27 | 2.3 Checks | A₂, the −23 genus, E₈ | 1/12, 3/4; without the 2⁸ at 2: 256/696729600 | True | none |
| 28 | `evenUnimodularMass_eq` | n = 8, 16 | 1/696729600; 691/277667181515243520000 | True | none |
| 30 | `rank16_classNumber` | the two orders | 1/970864271032320000 + 1/685597979049984000 = M₁₆ | True | none |
| 31–33 | 4.1, 4.2 | D₄, E₆, E₇; the 24 classes | 192; 51840; 2903040; Σ = 1027637932586061520960267/129477933340026851560636148613120000000 = M₂₄ | True | none |
| 34 | rank-32/40 bounds, 4.3 | M₃₂, M₄₀ | 2M₃₂ = 80618465.87; 2M₄₀ = 8.786·10⁵¹ | True | none |

### Headline inventory

Unchanged.
- **Stated:** `genusMass_eq`, `genusMass_eq_rank_two`, `evenUnimodularMass_eq`, `rank16_classNumber`, `rank24_classNumber`, `rank32_classNumber_lower_bound`, `rank40_classNumber_lower_bound`.
- **Named in the module docstring as not statable:** 0.1, 0.1a, 0.3, the measure identities of 1.2–1.3, and 2.1–2.2.

## Not verifiable

- **O'Meara, *Introduction to Quadratic Forms*, 104:4–5 (§0.3).** The manifest records it as uncertified and settled, so it is cited by its locator only. The diff does not touch it.
- **Lean at main's pins.** This review's Lean commands run only at the branch pins, so neither of these was elaborated by me:
  - that `Suggested.lean` builds unchanged at `2fd255d9`/`1b1ccf4b`;
  - the post-merge form in step 2 of R01's repair.

  The repair report states both elaborate with seven `sorry` warnings. The import and name checks above are consistent with that.

## Source issues

- none
