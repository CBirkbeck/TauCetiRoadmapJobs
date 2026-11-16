# Review of LefschetzStructures (pull request #1061 at e1fe843)

**Verdict:** accepted

## Previous findings

- R01 — repaired: README 581–584 « proves the following for `X` proper and smooth over a finite field `k`, with `X_k̄` connected and `ℓ ≠ char k`. For each `i ≤ 2d` some perfect pairing … is multiplied by `q^d` under Frobenius. »
- R02 — repaired: README 571–574 « `ClassicalTheory.lean` defines classical Weil cohomology theories over abstract Chow cycle data (Tag 0FGV), with the Künneth map and cycle classes of external products; `ProjectionFormula/Formula.lean` proves the projection formula for the Poincaré-dual pushforward (Tag 0FGT) »
- R03 — repaired: README 593 « The publications are checked on zbMATH; the two formalizations are cited by repository and commit. »
- R04 — repaired: description, **Provenance** « whose étale duality files prove, over finite fields, that a perfect Frobenius-compatible pairing with `ℚ_ℓ` coefficients exists. That pairing is not identified with the cup-product pairing that 0.5 and 2.1 use. »

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| README 391–393: `B_H(X)` iff some element of `𝒜(X)` maps `H^(2d−i)(X)` bijectively onto `H^i(X)` (only the notation changed) | `ℙ¹`, `d = 1`; `ℚ[ξ]/(ξ³)`, `d = 2`; `Z′ = diag(1, 3)`, `m = 2` | `ℙ¹`: `[X×X]_* ξ = 1`, bijective `H² → H⁰`. `Λ²ξ² = 1`, bijective `H⁴ → H⁰`. `det(T − Z′/2) = T² − 2T + ¾ = 2^{−2} det(2T − Z′)` | sound | none |
| README 564–565: `StacksFrontier` is AI-written and kept apart from the human-reviewed `StacksCore` | Stacks `README.md` lines 11–14 and 53, at `c496df0` | Core is "human-reviewed". Frontier is "written by AI agents". The maintainers review pull requests to both tiers | sound | none |
| README 566: Lean and Mathlib v4.35.0, earlier than our pin | Stacks `lean-toolchain` and `lakefile.toml`; our `lean-toolchain` and `lake-manifest.json` | Stacks: `v4.35.0`, Mathlib `rev = "v4.35.0"`. Our pin: `v4.36.0-rc2`, Mathlib `1b1ccf4` | sound | none |
| README 571–572: `ClassicalTheory.lean`, Tag 0FGV, the Künneth map, external products | `ClassicalTheory.lean` at `c496df0` | `@[stacks 0FGV]` on `ClassicalWeilCohomologyTheory` (line 157); `kunnethMap` (109); `ChowCycleData.externalProduct` (145). The word "projection" does not occur | sound | none |
| README 573–574: `ProjectionFormula/Formula.lean`, Tag 0FGT | `Formula.lean` 76–79; Stacks Lemma 45.7.1 | `pushforward_mul_pullback`, `@[stacks 0FGT "projection_formula"]`: `f_*(f^*b ∪ a) = b ∪ f_*a`. Tag 0FGT is Lemma 45.7.1, the same formula plus `g_*f_* = (gf)_*` | sound | none |
| README 581–584: hypotheses, and a perfect `q^d`-pairing for each `i ≤ 2d` | `exists_isFrobeniusDuality_rationalFrobenius` (`PoincareDualityConstantSystem.lean` 256); `IsFrobeniusDuality` (`Defs/LinearAlgebra/PerfectPairing/Basic.lean` 50) | Binders: `ℓ ≠ ringChar k`, smooth of dimension `d`, `X_k̄` connected, `ν ≤ 2d`; no rational point. `IsFrobeniusDuality`: zero kernels, `B(fx)(gy) = c·B x y` | sound | none |
| README 584: cup products anticommute in odd degree | `cup_skew_constantSystem` (`CupSkewConstantCoefficients.lean` 341) | For `Odd d`, `a ∪ b = −(b ∪ a)` at each level `ℤ/ℓⁿ⁺¹`, with `X` proper over a field | sound | none |
| README 584–585: Frobenius acts on `H^(2d)` by `q^d` | `rationalFrobenius_top_constantSystem_eq_smul` (`PoincareDualityConstantSystem.lean` 137) | Frobenius `= q^d • id` and `finrank = 1`, with `X` proper and smooth, `X_k̄` connected and `ℓ ≠ p`. No rational point is assumed | sound | none |
| README 586: 11 files, one with a Freitag–Kiehl label | the `Duality/` listing at `27cdb20` | 11 files. One `@[weil "lem_fk401_char_poly_top_degree"]` (`PoincareDualityConstantSystem.lean` 226). FK appears elsewhere only in docstrings | sound | none |
| README 586–589: the pairing is not `Tr(a ∪ b)`, so it gives neither 0.5's `⟨Lx, y⟩ = ⟨x, Ly⟩` nor 2.1's cup duality | `X = ℙ²/𝔽_q`, Frobenius `1, q, q²`; `IsCompatiblePairing` (`Suggested.lean` 102–104); MotivesAndAlgebraicCycles §2.2 | `β(1,ξ²) = 1`, `β(ξ,ξ) = 5`: perfect, and `β(Fξ,Fξ) = 5q² = q²β(ξ,ξ)`. Yet `β(L1,ξ) = 5 ≠ β(1,Lξ) = 1` | sound | none |
| README 593: the publications are on zbMATH, the formalizations are cited by commit | References, README 595–617 | 8 publications, each with a `Zbl` number that the reflow leaves unchanged. 2 repositories, each with a 40-digit commit and a URL | sound | none |
| Title and description against this head | 11 sentences, against README 560–617 and `Suggested.lean` | The Provenance paragraph matches README 581–589. « `sorry` as the only warning »: 12 warnings, all `sorry`. « imports only Mathlib »: `public import Mathlib` alone | sound | none |

The rows for the statements this change does not touch stand as in the previous review, of `2394d73`.

- **Gate.** The worker's gate at `e1fe843` reports OK. My re-run against the configured order fails only on `depcheck: NOT IN ORDER: LefschetzStructures`. With the candidate order and `--build`, every check is 0, `build=0`, OK. The candidate order lists this roadmap at line 100, after DeligneWeightsAndPurity (80) and MotivesAndAlgebraicCycles (99).
- **Dependency check** (candidate order, `--movable`, `--pr 1061`): `depcheck: 258 roadmaps, 2450 edges, 0 problem(s)`. No UPWARD or CYCLE line.
- **Elaboration.** `Suggested.lean` is byte-identical to `2394d73`. `lake env lean` exits 0 with 12 `declaration uses sorry` warnings and nothing else. A scratch file of 24 `#check @name` lines elaborates; its binders (`FiniteDimensional` ×11, `CharZero` ×6) match `signatures.md`. The 25th name in the worker's listing, `of`, is docstring text at `Suggested.lean` 39, not a declaration.
- **External code opened, at the cited commits.** Stacks: `README.md`, `lean-toolchain`, `lakefile.toml`, `ClassicalTheory.lean` and `ProjectionFormula/Formula.lean`. Weil: the 11 files of `Duality/` and its listing, `Defs/LinearAlgebra/PerfectPairing/Basic.lean`, `LinearAlgebra/PerfectPairing/FrobeniusDuality.lean`, `README.md`, `LICENSE` and the repository tree.
- **Source locators checked: 1.** Stacks Tag 0FGT (Lemma 45.7.1), the locator this change adds. The Katz–Messing locators of 1.3 (README 388 and 390) are unchanged.
- **Citations resolved.** MotivesAndAlgebraicCycles §§0.1–0.2, 0.5, 2.2, 2.3, 7.3 and 7.4, read at its open head, and its consumer paragraph that names this roadmap (its README line 1712). §2.2 contains the perfect Poincaré pairings that README 588 relies on. DeligneWeightsAndPurity §9.7 (`lefschetzPairings`, `primitivePiece`), read at its open head.
- **Remark.** README 392, 583 and 585 write superscripts as `H^(…)`; the README's other 59 superscripts write `^{…}`. Both read unambiguously.

Overlap check: read MotivesAndAlgebraicCycles, DeligneWeightsAndPurity and PCurvature, the three closest open roadmaps; none is listed on main or by results. The changed passages name Weil cohomology theories, correspondences and motives, which belong to MotivesAndAlgebraicCycles §§0.1–0.2 and 2.2 and are cited from there. They also name Poincaré pairings, which belong to 0.5 here, taking `lefschetzPairings` from DeligneWeightsAndPurity §9.7. PCurvature shares nothing. No new object and no second owner.

Source independence: changed passages only. 4 passages (README 562–568, 570–579, 581–589 and 593) were compared with 5 sources: the Stacks README, the docstrings of `ClassicalTheory.lean`, `ProjectionFormula/Formula.lean` and `PoincareDualityConstantSystem.lean`, and Stacks Lemma 45.7.1. The longest shared run is 4 words (« written by AI agents », present at the previous head). The other overlaps are standard names and hypothesis lists (« the projection formula », « proper and smooth »). The largest share is as counted at `2394d73`, Arapura2006 with 6 of 12 exact locators; this change adds one, Stacks Tag 0FGT, which makes it 6 of 13. The arrangement was not compared again, since no layer was added, removed or reordered.

## Not verifiable

- Kleiman 1994, Theorem 4.1, pp. 14–15, and §5, pp. 16–19 (the sources of 1.2 and 1.4, outside the changed passages). Earlier rounds found no legal copy, and it was not fetched again.

## Source issues

- **Misprint** in AxiomMath Stacks (commit c496df0) at README.md, line 7: the source says the library is built on Lean v4.34.0-rc2; it should be v4.35.0, as its `lean-toolchain` and the Mathlib `rev` in `lakefile.toml` pin; affects nothing.

## For the human reviewers

- **Licence.** README 560–589 cites AxiomMath Stacks (`c496df0`) and Weil (`27cdb20`), both Apache-2.0 (Stacks README line 59; Weil `LICENSE`). The cited Stacks tier is AI-written; the Weil README (line 112) records no human review.
- **Licence.** The description says the AxiomMath maintainers have not been contacted. `Suggested.lean` imports only Mathlib, and no file name or tag in the cited directories covers its Layer 0–1 statements.
