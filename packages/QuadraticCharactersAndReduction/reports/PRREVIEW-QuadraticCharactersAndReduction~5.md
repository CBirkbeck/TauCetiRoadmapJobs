# Review of QuadraticCharactersAndReduction (pull request #2119 at 82fe257)

**Verdict:** needs changes

One finding. The pull request changes four lines of `TauCetiRoadmap/QuadraticCharactersAndReduction/README.md`, and each change replaces a Tau Ceti name or file that resolves at the pinned Tau Ceti (`2fd255d9`, the `lake-manifest.json` of this head and of main) by one that does not. The rest of the folder is identical to main and was reviewed in full below; nothing else was found.

## Previous findings

The previous review (pull request #1904 at `5c219f7`) accepted with no finding, so there is nothing to check for repair. Its remarks concerned text outside this folder and are not re-raised.

## R01 (P2) — the renamed Tau Ceti suppliers do not exist at the pin; the names on main do

**Location.** `TauCetiRoadmap/QuadraticCharactersAndReduction/README.md` line 47: "`MulChar.IsQuadratic.changeLevel` and `DirichletCharacter.isQuadratic_changeLevel_iff` in `TauCeti/NumberTheory/DirichletCharacter/Quadratic.lean`, and `MulChar.isQuadratic_prod` in `TauCeti/NumberTheory/MulChar/Basic.lean`"; the same `MulChar.IsQuadratic.changeLevel` in the §1.1 route (line 70) and in the *Needs:* lines of §1.1 (line 85) and §1.2 (line 101). The pull-request description makes the same claim: "The lift lemma is `MulChar.IsQuadratic.changeLevel` (with the converse `DirichletCharacter.isQuadratic_changeLevel_iff`), not `isQuadratic_changeLevel`, and `MulChar.isQuadratic_prod` lives in `TauCeti/NumberTheory/MulChar/Basic.lean`".

**Claim.** At the pinned Tau Ceti the lift lemma is named `MulChar.IsQuadratic.changeLevel`, a converse `DirichletCharacter.isQuadratic_changeLevel_iff` exists, and `MulChar.isQuadratic_prod` is in `MulChar/Basic.lean`.

**Witness.** At Tau Ceti `2fd255d9`, `TauCeti/NumberTheory/DirichletCharacter/Quadratic.lean` declares `MulChar.isQuadratic_prod` (line 28) and `DirichletCharacter.isQuadratic_changeLevel` (line 55), and nothing else. In a scratch file importing that module and `TauCeti.NumberTheory.MulChar.Basic`:

- `#check @DirichletCharacter.isQuadratic_changeLevel` elaborates: `χ.IsQuadratic → ∀ (h : n ∣ m), (changeLevel h χ).IsQuadratic`;
- `#check @MulChar.isQuadratic_prod` elaborates, and the environment reports its module as `TauCeti.NumberTheory.DirichletCharacter.Quadratic`;
- `#check @MulChar.IsQuadratic.changeLevel` and `#check @DirichletCharacter.isQuadratic_changeLevel_iff` both fail with `Unknown constant`;
- `TauCeti/NumberTheory/MulChar/Basic.lean` at the pin contains no occurrence of `isQuadratic_prod` or `IsQuadratic`.

The copy of Tau Ceti's main branch available here (`34069c9`, 8 November) still has the two declarations under the old names in `Quadratic.lean`, so the new names come from a revision later than the pin and later than that copy; I could not read it.

**Repair.** Restore the four lines to their text on main: line 47 "`DirichletCharacter.isQuadratic_changeLevel` and `MulChar.isQuadratic_prod` in `TauCeti/NumberTheory/DirichletCharacter/Quadratic.lean`: lifts and finite products of quadratic characters are quadratic", and `isQuadratic_changeLevel` at lines 70, 85 and 101. Tested: both names elaborate at the pin with the statements the README uses (instance: `χ₄` with complex values lifted along `4 ∣ 12` takes values `1, −1, 0` only, as `isQuadratic_changeLevel` gives). That leaves this pull request with no change, so it can be closed. If the intention is to follow a Tau Ceti revision that renames these declarations, the README changes when the repository's pin moves to that revision, in the change that moves the pin; a roadmap is checked against the pin of its own head.

## Verified sound

**Gate and tools.**

- The worker's gate at `82fe257` passes every check, including the targeted build. (Its `readme-ids-missing` check counts this roadmap's own backticked names, not library names, which is why R01 passes the gate; the citation tool lists `isQuadratic_changeLevel_iff` as found nowhere.)
- Dependency check: `depcheck: 234 roadmaps, 2264 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The roadmap is on main, and every supplier it names (AnalyticNumberTheoryPartI, ClassicalArithmeticCompletion) is on main.
- `git diff --stat origin/main...HEAD` shows one file, this roadmap's README, 4 insertions and 4 deletions; nothing outside the folder.
- `lake env lean` on `Suggested.lean`: exactly 10 `declaration uses sorry` warnings, nothing else. One `import Mathlib` and one `TauCeti.*` module, no `set_option`, no sorry'd data; `reductionQuotientHom` has a real body.
- Overlaps: none listed. The names of the 11 declarations occur in no other roadmap's namespace (`norm_embedding_le` also appears in DiophantineApproximationAndTranscendence, under that roadmap's own namespace and about a different object).

**Binders.** `#check @name` for all 11 declarations in one scratch file; each elaborated type matches its README statement (`[NeZero N]` on `exists_unique_fundamental_discriminant`, `[Fact p.Prime]` and `p ≠ 2` on `odd_prime_power_classification`, `0 < m` on `card_reduction_quotient`, `Odd (Nat.card F)`, `IsSquare r`, `r ≠ 0` on `pow_card_eq_self_of_square`). No binder is lost.

**Padding probe.** Each of the 10 sorried theorems tried with `simp`, `rfl` and `decide` on a scratch copy: none closes (10 `sorry` warnings remain). Headlines listed in the README Summary and the module docstring: the two local classifications, the primitive discriminant, the reduction kernel, quotient comparison and cardinality, the two Frobenius identities, the integral congruence, the coordinate bound. All are stated; none is missing or forced through a stand-in.

**Library declarations opened at the pin (15 by `#check`, the rest by file and line).** Tau Ceti `2fd255d9`: `TauCeti.Nat.IsExactDivisor.unitsEquivProd` (`Data/ZMod/ExactDivisor.lean` 104: `(ZMod N)ˣ ≃* (ZMod Q)ˣ × (ZMod (N / Q))ˣ`) and `eq_mul_comp_unitsMap` (124); `DirichletCharacter.conductor_ringHomComp` (45), `isPrimitive_ringHomComp_iff` (53), `conductor_mul_of_coprime` (62), `conductor_prod_of_pairwise_coprime` (76, with the side condition `s.Nonempty ∨ N ≠ 0`, satisfied at the positive levels of §1.3) in `DirichletCharacter/Conductor.lean`; `IsPrimitive.factorization_two_le_three` (77) and `factorization_two_eq_zero_or_two_or_three` (83) in `Dyadic/Quadratic.lean`, `factorization_two_ne_one` (`Dyadic/Basic.lean` 68); `QuadraticAlgebra.isMaximal_span_natCast_iff` (`QuadraticOrder/PrimeIdeal.lean` 330: maximal iff no integer root of `X² − bX − a` modulo `p`); `algEquivProdOfRoots` (59) and `algEquivProdOfSq` (96, `[Invertible 2]`, `u : Rˣ`, `a = u²`) in `Algebra/QuadraticAlgebra/Split.lean`; `complexEmbedding` (72), `complexEmbedding_apply` (79), `algHom_eq_or_eq_comp_starAlgEquiv` (99), all under `a ≤ 0`, in `NumberField/Quadratic/ComplexEmbedding.lean`; `arithFrobAt_eq_one_iff_legendreSym_eq_one` (`Quadratic/Frobenius.lean` 40: `p ≠ 2`, `¬ p ∣ d`, `[IsGalois ℚ K]`); `kroneckerChar` (376), `kroneckerChar_apply` (397), `kroneckerChar_intCast` (403); `conductor_fundamentalDiscriminantCharCast` (`[CharZero R]`), `fundamentalDiscriminantChar_neg_one` (`= D.sign`). Mathlib `1b1ccf4b`: `QuadraticAlgebra.re_mapRingHom_apply`, `algebraMap_dvd_iff`, `isUnit_im_omega_iff_bijective`, `isRegular_im_omega_iff_injective`, with the statements the contract gives.

**Cross-roadmap citations resolved on main (`651d082`).**

- AnalyticNumberTheoryPartI §0.34a (README line 889) and `Suggested.lean` lines 72–79: `quadratic_character_eq_fundamentalDiscriminantChar` with `[NeZero q]`, `IsPrimitive`, `IsQuadratic`, `χ ≠ 1`, `D := if χ (-1) = 1 then q else -q`, conclusion at every integer `n`; `quadratic_character_kronecker` at lines 83–88 with `Squarefree d`, `d ≠ 1`, `|d| ≤ q` and the Jacobi values at odd primes `p ∤ q`. Both as the Scope and the contract describe. §0.34c at line 893 with facts 2 and 3 of its determinant method.
- ClassicalArithmeticCompletion §§1.1–1.9, 1.20, 1.21, 1.32: the twelve headings exist with the content the Scope paragraph attributes to each (lines 321–1213 of its README).
- GlobalNumberFields (completed), Layer 11 "orders and Picard groups" (line 571); NumberFieldArithmetic (completed); ThetaSeries 2H (line 562); ImaginaryQuadraticClassNumber H2.1 (line 69).

**Sources (the seeded sample, read in the cached texts).**

- §§1.1–1.3 and the contracts: mv-mnt1-ch9 line 57 (Theorem 9.2) and line 62 (Lemma 9.3) on PDF page 2 = printed 283; §9.3 opens at line 638 on PDF page 14 = 295; the odd prime-power discussion at lines 664–674 and the dyadic one (level `4`, then `m = 3`) at lines 676–682, PDF page 15 = 296. The README's convention note (their "quadratic" is exact order two) matches line 642.
- §1.4: Theorem 9.13 at line 742 on PDF page 16, running head 297; quadratic discriminants defined at lines 691–694 (p. 296).
- §2.1: milne-ant Theorem 3.41 at line 2772 (PDF 64 = printed 62) and the reduction step of its proof at lines 2783–2786 (printed 63), for a prime ideal; the README says so and states its own target for every `m`.
- §2.3: Example 2.41 at line 1797 (PDF 41 = printed 39), `m` squarefree; the README restricts the citation to that case.
- §3.2: Example 7.54 at line 5671 (PDF 131 = printed 129); lines 5673–5676 give the cyclic Galois group of the residue extension with generator `x ↦ x^q`, which is what the README cites it for.
- §3.3: Example 3.44 at line 2807 (printed 63), parts (ii) at 2817–2819 and (iii) at 2820–2822; conrad-quadchar Theorem 2.4 at line 141 (PDF page 3) and Corollary 3.1 at line 150 (PDF page 4), both for `p ∤ D`.
- §§2.2 and 4.1 cite no source beyond "elementary consequence"; their statements were checked by computation (table).

**Adversarial table.**

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Contract line 47 and §§1.1–1.2 "listed characters are quadratic" | `χ₄` (ℂ-valued) lifted along `4 ∣ 12` | values `1, −1, 0` at `1, 7, 2`; pinned `isQuadratic_changeLevel` gives it; the cited `MulChar.IsQuadratic.changeLevel` is an unknown constant | statement true, citation fails | R01 |
| `odd_prime_power_classification` | `p = 3`: `k = 0`, `k = 1`, `k = 2`; `p = 2` control | `k = 0`: one character, `3 ∤ 1`, right side `χ = 1`; `k = 1`: 2 characters, both quadratic, right side 2; `k = 2`: `(ℤ/9)ˣ ≅ C₆`, 6 characters, 2 with values `±1`, right side 2 (principal, lifted Legendre, distinct since conductors `1 ≠ 3`). `p = 2, k = 2`: `χ₄` quadratic, `quadraticChar (ZMod 2) = 1`, right side has 1 character against 2 | true; `hp2` needed | none |
| `two_power_classification` | `k = 0, 1, 2, 3, 4` | characters with values `±1`: `1, 1, 2, 4, 4` (at `k = 4`, `(ℤ/16)ˣ ≅ C₂ × C₄`, 8 characters, `Hom` to `±1` has 4); right side: `1, 1, 2, 4, 4`. `χ₈(3,5,7) = −1,−1,1`, `χ₈'(3,5,7) = 1,−1,−1`, `χ₄(3) = −1` (`decide`): the four value rows at level 16 in the §1.2 Check are distinct | true | none |
| `exists_unique_fundamental_discriminant` | `N = 1`; `χ₈` at 8; `χ₄` lifted to 12; principal at 6 | `N = 1`: conductor 1, `D = 1`, `−1` not fundamental (`decide +kernel`). `χ₈`: `|D| = 8`, `χ₈(−1) = 1 = sign 8`, `sign(−8) = −1` excluded. Level 12: conductor 4, `4` not fundamental, `D = −4`; at `n = 3` (not coprime) `0 ≠ −1`, excluded by `IsCoprime`. Level 6: `D = 1`, `|−3| = 3 ≠ 1` | true | none |
| §1.4 Checks | `D = 12, −12`; radicands | `12` fundamental, `−12` not (`decide +kernel`); `fundamentalDiscriminant 3 = 12`, `(−1) ↦ −4`, `(−3) ↦ −3` (`decide`); `legendreSym 3 12 = 0`, `legendreSym 2 5 = 1`, `χ₈(5) = −1` (`decide`); `12 ≡ 2`, `3` nonsquares mod 5, so both Legendre symbols are `−1` | true | none |
| `reduction_kernel`, `bijective_reductionQuotientHom` | `m = 0, 1, 2` with `a = 5, b = 0` | `m = 0`: `ZMod 0 = ℤ`, kernel `0 = span {0}`. `m = 1`: target zero ring, kernel `⊤ = span {1}`. `m = 2`: `ω − 1 ↦ ω̄ + 1 ≠ 0`, square `0`; `1 + ω ∉ (2)` | true | none |
| `card_reduction_quotient` | `m = 1, 2, 3`; `m = 0` | `1, 4, 9`. At `m = 0` the quotient is infinite and `Nat.card = 0 = 0²`: the equation survives only as a junk value, which §2.2 says; `hm` keeps the statement a count | true | none |
| §2.2 rectangle bound | `U = V = {0}`, `m = 0`; `U = [0, m]` | `1 ≤ 0` false at `m = 0`, bound stated for `m > 0`; `0 ≡ m`, injectivity fails at length `m + 1` | true | none |
| §2.3 `ι` | `d = 5`; `d = −3`; `m = 2, 3` | `(2ω' − 1)² = 4(ω' + 1) − 4ω' + 1 = 5`; `4(ω' − 1) − 4ω' + 1 = −3`; `(ι ω).im = 2`, a unit mod 3 and `0` mod 2 | true | none |
| `pow_card_eq_star` | `𝔽₃, r = −1, z = 1 + ω`; `𝔽₇, r = 3`; characteristic 2 | `z³ = 1 + 3ω − 3 − ω = 1 − ω = star z`; `3³ = −1` in `ZMod 7` (`decide`), `ω⁷ = −ω`; over `𝔽₂` no nonsquare, hypothesis empty | true | none |
| `pow_card_eq_self_of_square` | `𝔽₅, r = −1 = 2²`; `𝔽₂, r = 1`; `𝔽₃, r = 0` | split, `z⁵ = z`, while `star z ≠ z`; `𝔽₂`: `ω² = 1 ≠ ω`, excluded by `hodd`; `r = 0`: `ω³ = 0 ≠ ω`, excluded by `hr0` | true; both hypotheses needed | none |
| `frobenius_congruence` | `r = −1, p = 3, z = ω`; `r = −1, p = 5`; `r = 5, p = 2`; `r = 3, p = 3` | `ω³ − star ω = −ω + ω = 0`; mod 5: `ω⁵ − star ω = 2ω ∉ (5)`, `−1` a square; `p = 2`: second coordinate `2uv + v ≡ v`; `p = 3`: `3u²v + 3v³ + v ≡ v` | true; hypotheses needed | none |
| `norm_embedding_le` | `r = −1, z = 1 + ω`; `r = 4, σ ω = −2, z = ω`; `r = 0`; `r = 20, z = 1 ± ω` | `√2 ≤ 2`; `2 ≤ 0 + 1 · 2`; `σ ω = 0`, `|u| ≤ |u|`; `1 + 2√5` equality, `2√5 − 1 < 1 + 2√5` | true | none |
| §4.1 norm comparison | `r = 2, z = ω`; `r = −2, z = ω` | `‖σ₊ ω‖² = 2`, `norm ω = −2`; `2 = 2` | true (`iff r < 0`) | none |
| Conventions | `star`, `norm`, `trace` on `x + yω` | `(x + yω)(x + by − yω) = x² + bxy − ay²`; `2x + by`; at `b = 0`, `star ω = −ω` | true | none |

## Not verifiable

- The Tau Ceti revision that introduces `MulChar.IsQuadratic.changeLevel` and `DirichletCharacter.isQuadratic_changeLevel_iff`: not the pin, and not in the copy of Tau Ceti's main branch held here (`34069c9`). It does not affect R01, which is about the pin.
- Ownership against open pull requests was checked with the roadmap search over the open heads for the 11 declaration names only; the roadmap's content is unchanged from main, where it is the owner.

## Source issues

- none
