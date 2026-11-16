# Review of CurvesOverFiniteFields (pull request #1729 at 6930552)

**Verdict:** accepted

No finding. Incremental re-review of the 49 lines changed since `408a5d8`.

## Previous findings

- R01 — repaired: `lake-manifest.json` pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`; `NewtonPolygon/Slopes.lean:110`, `Mul.lean:319`, `Roots.lean:111`, `Hermitian/Basic.lean:66`, `Hermitian/Genus.lean:69, 81`, `Isogeny/Frobenius/Zeta.lean:93, 153, 171, 184, 220`, `Affine/Point/Frobenius/Fixed.lean` exist there.
- R02 — repaired: `README.md` line 1165 "Call `F` **maximal** when `N_1(F) = q + 1 + 2g√q` and **minimal** when `N_1(F) = q + 1 − 2g√q`"; line 1324 "(3.2; not maximal in the sense of 3.5, since `q = 2` is not a square)".
- R03 — repaired: lines 214, 363 and 1021 write LPolynomial k F and weilPolynomial k F without backticks; lines 1021–1037 and 1097 use `P_F`, `L_F`; the module docstring says `IsWeilPolynomial q P_F`. Gate `readme-ids-missing=0`.
- R04 — repaired: `theorem card_frobeniusAngles (P : ℤ[X]) : 2 * card (frobeniusAngles P) = P.natDegree + card ((P.aroots ℂ).filter fun z => z.im = 0)`; `README.md` lines 692–695 state the same for every `P ∈ ℤ[X]`.
- R05 — repaired: the description now reads "comparison contracts with Tau Ceti's elliptic curves … this roadmap builds no genus-2 interface" and "4 layers and 23 numbered sections".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 1.7 `card_frobeniusAngles` (restated for every `P ∈ ℤ[X]`) | `P = 0`; `P = 3`; `X`; `2X`; `X²+1`; `(X−2)²`; `T⁴+T`; `(T²−2)²` | `0 = 0+0`; `0 = 0+0`; `2·1 = 1+1`; `2·1 = 1+1`; `2·1 = 2+0`; `2·2 = 2+2`; `2·3 = 4+2`; `2·4 = 4+4` | holds, including the junk case `aroots 0 = 0` and non-monic `P` | none |
| Convention 10, "`m` is even" in degree `2g` | `X²+1`, `(X−2)²`, `T⁴+T`; odd degree `X` | `m = 0, 2, 2` with `2g − m = 2, 0, 2` non-real roots; `X`: `m = 1`, degree odd, outside the clause | holds: `2g − m` is even by conjugation, no appeal to 1.5 needed | none |
| 3.5 definition of maximal / minimal | `g = 0`; Hermitian `q₀ = 2, 3`; `1.2.c`; `1.2.ac` | `N_1 = q+1` both; `9 = 4+1+4`, `28 = 9+1+18`; `5 < 5.83` (not maximal, attains 3.2: `5 = 3+⌊2.83⌋`); `1 > 0.17` (not minimal) | definition agrees with the criterion `L_F = (1 ± √q T)^{2g}` and with lines 1143, 1182, 1324 | none |
| 2.1 / 3.1 in `P_F`, `L_F` notation | `1.2.ac`; `ℙ¹`; `2.2.a_a` | `reverse(1−2T+2T²) = T²−2T+2`, `∑α = 2 = 3 − N_1`; `P_F = 1`; `reverse(1+4T⁴) = T⁴+4`, `P(0) = 4 = q^g` | renaming only; values unchanged | none |

The rows for the untouched statements stand as in the previous review, of `408a5d8`.

- Gate, run on this head: every check `0`, `OK` (the worker's record adds `build=0`). Dependency check: `depcheck: 234 roadmaps, 2228 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean` at the head's pins: 22 `declaration uses sorry` warnings and nothing else. `#check @card_frobeniusAngles` gives `∀ (P : ℤ[X]), 2 * (frobeniusAngles P).card = P.natDegree + (filter (fun z => z.im = 0) (P.aroots ℂ)).card`, the README's statement.
- One-tactic probe of the restated theorem on a scratch copy (`simp`, `simp [frobeniusAngles]`, `rfl`, `exact?`, `omega`): stays open in all five.
- Library declarations opened at the head's pins: the twelve Tau Ceti locations of R01 above and `Hermitian/Existence.lean:37`; Mathlib `Algebra/Polynomial/Reverse.lean:254` (`reverse_natDegree`), `LinearAlgebra/Matrix/Charpoly/Coeff.lean:290` (`charpolyRev`), `NumberTheory/NumberField/Basic.lean:447` (`NumberField (AdjoinRoot f)`), which the previous review could not open at the head's pin.
- Pull request text against the head: 4 layers, 11 + 4 + 5 + 3 = 23 numbered sections, `metadata.toml` with `topic = "math.NT"`, 36 declarations, no file changed outside the folder against the merge base; no sentence contradicted.
- The changed passages add no cross-roadmap citation and no supplier; overlaps report: no other open pull request changes this roadmap, no cited id dropped.
- Overlap check: read AbelianVarietiesOverFiniteFields, HyperellipticCurves, HypergeometricMotives, WeilConjectures, CharacterSumsOverFiniteFields, PadicExtensionFamilies, AlgebraicCurves, ClassicalArithmeticCompletion (as in the previous review; the change touches no owned object); nothing shared.
- Source independence: changed passages only; 5 passages compared (conventions 5 and 10, the 1.7 bullet, the opening of 3.5, the `card_frobeniusAngles` docstring) with 0 sources readable at their locators (they cite none but Stichtenoth Theorem 5.2.1, unreadable); no layer added, removed or reordered, so the arrangement stands as compared before.

## Not verifiable

- Stichtenoth, *Algebraic Function Fields and Codes* (Theorem 5.2.1 and §6.4, cited in the changed 3.5): paywalled; the new definition of maximal and minimal was checked against the criterion and the Hermitian instance, not against the book's wording.
- Ihara 1981, Serre 1983 and Serre 2020, the LMFDB record `1.4.ae`, the invariants of `2.2.ab_a`, and the three external formalisations named in *References*: as in the previous review; the change does not touch them.

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md` *References* says three external Lean formalisations are Apache-2.0 and were consulted as proof sources; the repositories and licences were not opened. `Suggested.lean` shares no declaration name with the ones cited.
- **Licence.** Ser12 was read (previous review) from the author's page on the Collège de France site, a host the sources service does not classify; it was fetched as an author-page copy.
- **Licence.** The worked examples (`README.md` lines 1300–1385) carry LMFDB labels and invariants of 13 isogeny classes; the values were recomputed, and the LMFDB's content licence was not read.
- **Not tested.** Stichtenoth (11 locators, the largest share among the printed sources) could not be read: wording was not compared with it, and the contents comparison used its public chapter headings only.
