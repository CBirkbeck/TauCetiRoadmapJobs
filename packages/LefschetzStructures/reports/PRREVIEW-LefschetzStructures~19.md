# Review of LefschetzStructures (pull request #1061 at 2394d73)

**Verdict:** needs changes

## R01 (P3) — Provenance overstates what the Weil repository's Duality files prove

**Location:** `TauCetiRoadmap/LefschetzStructures/README.md` 580–585: « proves Poincaré duality for the étale cohomology of smooth projective varieties with ℓ-adic and rational coefficients … labelled by Freitag–Kiehl's numbering rather than Stacks tags). These are the Poincaré pairings of 0.5 and the duality axiom of 2.1 »

**Claim:** The cited files do not contain this statement (a locator into code that lacks it). They work only over a finite field. Their "rational" coefficients are `ℚ_ℓ`. They only assert that some perfect pairing exists, never that the cup-product pairing is perfect. Only 1 of the 11 files carries a Freitag–Kiehl label.

**Witness:** `Duality/RationalPoincareDuality.lean`, `exists_isPerfPair_rationalFrobenius_of_topFrobenius`: `X` proper over a finite field. Its conclusion is `∃ β` perfect with `β(Fv, Fw) = q^d β(v, w)`. On `ℙ²`, `β(1, ξ²) = 1, β(ξ, ξ) = 5` qualifies, yet `β(L1, ξ) = 5 ≠ β(1, Lξ) = 1`.

**Repair:** Replace lines 580–585 with: « A second AxiomMath project on the same library, *The Weil conjectures in Lean* (References), proves the following for `X` proper and smooth over a finite field `k`, with `X_k̄` connected and `ℓ ≠ char k`. For each `i ≤ 2d` some perfect pairing `H^i(X_k̄, ℚ_ℓ) × H^{2d−i}(X_k̄, ℚ_ℓ) → ℚ_ℓ` is multiplied by `q^d` under Frobenius. Cup products in odd degree anticommute. Frobenius acts on `H^{2d}(X_k̄, ℚ_ℓ)` by `q^d`. These results are in `Weil/AlgebraicGeometry/EtaleCohomology/Duality/` (11 files, one with a Freitag–Kiehl label). The pairing is asserted to exist and is not identified with `Tr(a ∪ b)`. So it gives neither the compatibility `⟨L x, y⟩ = ⟨x, L y⟩` of a Poincaré pairing (0.5) nor the perfectness of the cup-product pairing that 2.1's duality axiom requires. Nothing there concerns the Lefschetz operator. »

## R02 (P3) — The projection formula is not in `ClassicalTheory.lean`

**Location:** `TauCetiRoadmap/LefschetzStructures/README.md` 571–573: « `ClassicalTheory.lean` defines classical Weil cohomology theories over abstract Chow cycle data, with the Künneth map, cycle classes of external products and the projection formula (Tag 0FGV) »

**Claim:** `ClassicalTheory.lean` neither states nor names a projection formula. The formula is in another file, under another tag.

**Witness:** At `c496df0`, `ClassicalTheory.lean` does not contain the word "projection". `WeilCohomology/ProjectionFormula/Formula.lean` proves `pushforward_mul_pullback`, `f_*(f^*b ∪ a) = b ∪ f_*a`, tagged `@[stacks 0FGT "projection_formula"]`.

**Repair:** « `ClassicalTheory.lean` defines classical Weil cohomology theories over abstract Chow cycle data (Tag 0FGV), with the Künneth map and cycle classes of external products. `ProjectionFormula/Formula.lean` proves the projection formula for the Poincaré-dual pushforward (Tag 0FGT). »

## R03 (P3) — « All checked on zbMATH » now covers two repositories

**Location:** `TauCetiRoadmap/LefschetzStructures/README.md` 589: « All checked on zbMATH. » (above the new entries at 607–614)

**Claim:** This change added the two AxiomMath formalizations to the References. They have no zbMATH entry, so the heading sentence is false for them.

**Witness:** README 607–614: both new entries give a GitHub commit and no `Zbl` number. All 8 other entries carry one.

**Repair:** « The publications are checked on zbMATH; the two formalizations are cited by repository and commit. »

## R04 (P3) — The description repeats R01's overclaim

**Location:** pull request description, **Provenance** paragraph: « AxiomMath, *The Weil conjectures in Lean* (Apache-2.0, commit 27cdb20), whose Poincaré duality for étale cohomology gives the pairings of 0.5 and the duality axiom of 2.1. »

**Claim:** The Weil repository proves an existential, Frobenius-compatible pairing over finite fields. It does not give 0.5's compatible pairing or 2.1's cup-product duality. Once R01 is repaired, the README contradicts this sentence.

**Witness:** The same as R01: `RationalPoincareDuality.lean` concludes `∃ β` perfect with `β(Fv, Fw) = q^d β(v, w)`, for `X` proper over a finite field. The `ℙ²` pairing above is not compatible with `L`.

**Repair:** « … (Apache-2.0, commit 27cdb20), whose étale duality files prove, over finite fields, that a perfect Frobenius-compatible pairing with `ℚ_ℓ` coefficients exists. That pairing is not identified with the cup-product pairing that 0.5 and 2.1 use. »

## Previous findings

- none: the review of `d3b9c22` raised no finding. The R01 it carried from earlier is still repaired: README 373–377 is unchanged.

## Verified sound

This incremental re-review covers the 35 lines added since `d3b9c22`: README 560–586, the Provenance section, and README 607–614, two references. `Suggested.lean` is byte-identical, and nothing outside the folder differs from `origin/main`.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| « These are the Poincaré pairings of 0.5 » (580–585) | `X = ℙ²/𝔽_q`, Frobenius `1, q, q²` on `H⁰, H², H⁴`; `IsCompatiblePairing`, `Suggested.lean` 102–104 | `β(1,ξ²)=1`, `β(ξ,ξ)=5`, `β(ξ²,1)=1`: perfect, `β(Fv,Fw)=q²β(v,w)`. Yet `β(L1,ξ)=5 ≠ β(1,Lξ)=1`, so `hpair` of 1.4 fails | false | R01 |
| « the duality axiom of 2.1 » | MotivesAndAlgebraicCycles §2.2 (perfect cup pairing, `k` algebraically closed) against the Weil files | Weil: `X` over finite `k`, existential `β`, `ℚ_ℓ`. §2.2: `H^i × H^{2d−i} → H^{2d} → F` perfect. `X/ℂ` is not covered | overclaim | R01 |
| « 11 files, labelled by Freitag–Kiehl's numbering » | the 11 files of `Duality/` at `27cdb20` | 11 files. One `@[weil]` label, `lem_fk401_char_poly_top_degree`, in `PoincareDualityConstantSystem.lean`; the other 10 have none | partly false | R01 |
| « skew-symmetry of the cup pairing in odd degrees » | `CupSkewConstantCoefficients.lean` | `cup_eq_neg_cup_of_odd_of_iso`: `a ∪ b = −(b ∪ a)` for odd `p`; `X` proper over a field | sound | none |
| « weak and hard Lefschetz are not among the axioms of 0FGV » | Stacks Definition 45.7.3 (0FGV) | Data D1–D3. Axioms (A) a–d duality, (B) Künneth, (C) a–d cycle classes. No Lefschetz | sound | none |
| « `ClassicalTheory.lean` … projection formula (Tag 0FGV) » | `ClassicalTheory.lean`, `ProjectionFormula/Formula.lean` | No "projection" in the first file. `pushforward_mul_pullback`, tagged 0FGT, is in the second | misplaced | R02 |
| « `Motives/` builds Chow motives as a Karoubi envelope (Tag 0FGA) » | `Motives/Category.lean` | `abbrev Motive := Karoubi S.Obj`, tagged `@[stacks 0FGA]` (Stacks 0FGA = Lemma 45.4.1) | sound | none |
| « No file name or tag there treats Lefschetz structures … » | 58 entries of `WeilCohomology/` and the listings of 6 subdirectories | Only `Concrete/LefschetzMotive*.lean`, which is the motive `(ℙ¹, c₂, 0)`, tag 0FGE. No operator `L`, `Λ` or primitive part | sound | none |
| « Apache-2.0 … AI agents … without `sorry` … v4.35.0, earlier than our pin » | Stacks README, `lean-toolchain`, `lakefile.toml` at `c496df0`; `lake-manifest.json` | Stacks: Apache 2.0, "no `sorry`", Frontier AI-written and awaiting review, toolchain `v4.35.0`, Mathlib `v4.35.0`. Pin: `v4.36.0-rc2` | sound | none |
| Title and description against this head | 10 sentences against README and `Suggested.lean` | The Provenance paragraph reports the new section. « `sorry` as the only warning »: 12 warnings, all `sorry`. The Weil clause overclaims | one wrong sentence | R04 |

The rows for the statements this change does not touch stand as in the previous review, of `d3b9c22`.

- **Gate.** The worker's gate at `2394d73` reports OK. Re-run with `--build` against the candidate order: every check is 0, `build=0`, OK. Against the default order the only failure is `depcheck: NOT IN ORDER: LefschetzStructures`. That is not a finding: the candidate order lists the roadmap at line 99, right after MotivesAndAlgebraicCycles at line 98.
- **Dependency check** (candidate order, `--movable`): `depcheck: 237 roadmaps, 2244 edges, 0 problem(s)`. No UPWARD or CYCLE line.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with 12 `declaration uses sorry` warnings and nothing else. The file is unchanged since `d3b9c22`.
- **External code opened, at the cited commits:** Weil: 11 files in `Duality/`, plus `LICENSE`, `README.md` and `lean-toolchain`. Stacks: `ClassicalTheory.lean`, `Motives/Category.lean`, `ProjectionFormula/Formula.lean`, `Concrete/LefschetzMotive.lean`, `README.md`, `lean-toolchain` and `lakefile.toml`, plus listings of 7 directories.
- **Source locators checked: 2.** Stacks tags 0FGV (Definition 45.7.3) and 0FGA (Lemma 45.4.1).
- **Citations resolved:** README 0.5 and 2.1–2.2. MotivesAndAlgebraicCycles §§0.1–0.2, 2.2, 2.3 and its consumer paragraph naming this roadmap, read at its open head.
- **Remark (untouched text).** The Stacks repository's README gives Lean `v4.34.0-rc2`, but its toolchain is `v4.35.0`. README 566 follows the toolchain, which is right.

Overlap check: read MotivesAndAlgebraicCycles and DeligneWeightsAndPurity, the two closest open roadmaps; no roadmap on main or by results is listed. The change names correspondences and Weil cohomology, which belong to MotivesAndAlgebraicCycles §§0.1–0.2 and 2.2 and are cited as such, and Poincaré pairings, which belong to 0.5 here, with the pairing theory from DeligneWeightsAndPurity §9.7. No new object and no second owner.

Source independence: changed passages only. 3 passages (README 562–568, 570–578 and 580–585) were compared with 4 sources: the Stacks README, the Weil README, Stacks 0FGV and the Duality module docstrings. The longest shared run is 4 words (« written by AI agents »). The opening paragraph matches DerivedDeRhamCohomology's Provenance paragraph on main, which is project text. The largest share is unchanged: Arapura2006, 6 of 12 exact locators. The arrangement was not compared again, since no layer was added, removed or reordered.

## Not verifiable

- Kleiman 1994, Theorem 4.1, pp. 14–15, and §5, pp. 16–19 (the sources of 1.2 and 1.4, outside the changed passages). Earlier rounds found no legal copy, and it was not fetched again.

## Source issues

- **Misprint** in AxiomMath Stacks (commit c496df0) at README.md, opening paragraph: the source says the library is built on Lean v4.34.0-rc2; it should be v4.35.0, as its `lean-toolchain` and the Mathlib `rev` in `lakefile.toml` pin; affects nothing.

## For the human reviewers

- **Licence.** README 560–586 cites AxiomMath Stacks (`c496df0`) and Weil (`27cdb20`). Both are Apache-2.0 (Stacks README; Weil `LICENSE`), AI-written, and recorded by their READMEs as not reviewed by humans. The description says their maintainers have not been contacted. `Suggested.lean` states Layer 0–1 linear algebra, which no file name or tag in the cited directories covers.
