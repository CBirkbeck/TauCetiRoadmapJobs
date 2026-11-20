# Review of ImaginaryQuadraticClassNumber (pull request #2593 at 1eb5b47)

**Verdict:** accepted

**Summary.** Accepted: no finding. The folder is unchanged since the previous review of this head, and this round read the pull request's description sentence by sentence against the head, against the roadmap on main and against the pinned libraries: no sentence is contradicted and no change a reader must know of is left unstated. No small correction; one format note is carried over (the old heading anchor of §3.1, still linked from two open roadmaps). Three facts are left for the human reviewers, as before.

## N01 — Eleven links to the old §3.1 heading anchor in two open roadmaps will land at the top of the README

ArithmeticStatisticsPartVII (README line 2518) and ComplexMultiplicationAndExplicitReciprocity (README lines 131, 428, 480, 552, 592, 614, 618, 622, 644, 673) link to `#h31-modular-functions-and-the-imaginary-quadratic-cm-dictionary`. Convention 9 (README line 99) maps the labels and the description states the anchor change, so nothing is wrong; an inline anchor with the old id before the heading `### 3.1` would keep those links working.

## Previous findings

The previous review, of `1eb5b47`, had no finding (no R-numbered point) and no small correction. Its one other remark:

- N01 — not repaired (a format note, stated in the description): carried as N01 above.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §3.6 `classNumber_eq_one_iff_negative_squarefree_mem` (the statement the description says changed) | d = −1, −2, −5, −163; d = −4 (θ = 2i); d = 0, 1; d > 0 | h = 1, 1 ∈ list; h = 1, 2 ∈ list; h = 2, 5 ∉ list; h = 1, 163 ∈ list; −4 excluded by `hd`; `X²`, `X² − 1` reducible; d > 0 not totally complex | true | none |
| Description: "`hgen` … follows from `hdeg` and `hmin`" | θ ∈ 𝓞 K, `minpoly ℤ θ = X² − d`, `[K : ℚ] = 2` | `minpoly ℚ θ = X² − d` (ℤ integrally closed), `[ℚ(θ) : ℚ] = 2 = [K : ℚ]`, so `ℚ(θ) = K` | description true | none |
| §3.6 `pic_eq_one_iff_discr_mem` (description: "the thirteen orders") | disc −28, −48, −44, −16 | `#Pic`: 1·2·(1 − 1/2) = 1, in list; 1·4·(3/2)/3 = 2, not in list; 1·2·(3/2) = 3, not in list; 1·2·1/2 = 1, in list | true | none |
| Layer 2 and 3 Examples named in the description | D = −23, −163, −51; point (2, −6) | 3π/√23 ≈ 1.965 ≤ 1 + log 23 ≈ 4.135; π/√163 ≈ 0.246; −51 ≡ 21 mod 24, −163 ≡ 5 mod 8; 36 = 2·2·(8 + 1) | true | none |

The rows for the untouched statements stand as in the previous review, of `1eb5b47`.

- Changed passages: none (0 changed lines in the folder, no path outside it changed). The pull request's description was read against the head and against the README on main.
- Description against the head, counts verified: 45 Check bullets (counted); 14 `*Needs:*` lines, one per section; three `### Examples` and three `### Dependencies`; Convention 9 maps H1.1–H3.6 and H1–H3 (README lines 99–102); five supplier subsections as the description lists them; six theorems in `Suggested.lean`, of which one lost `hgen` and three had binders moved from a section `variable` into the signature (diff against main read); section comments `Layer 2` and `Layer 3`.
- Description against main: the old README's §§4.8–4.9 citation of EffectiveClassNumbers and its description of AnalyticNumberTheoryPartI §0.9 (main line 17), its uniformization target with the Lie-group exponential (main line 108) and its "Required tests" list (main line 177) are as the description says; ModularCurvesPartII is not named on main and is named at the head, which the description states as an added supplier.
- Library declarations named in the description, opened at the pin (12): `numberFieldOrderOfSqrt_eq_intAddMulOrder` (`NumberTheory/NumberField/Global/Orders/Quadratic/OrderOfConductor.lean:266`), `fractionalIdeal_smul` (`NumberTheory/BinaryQuadraticForm/Ideal/Change.lean:138`), `card_units_quotient_span_natCast_of_prime` (`NumberTheory/NumberField/Quadratic/ResidueUnits.lean:79`), `compactifiedQuotientFiniteHolomorphicMap` (`Analysis/Complex/Fuchsian/Compactification/FiniteHolomorphicMap.lean:38`), `hilbertClassArtinEquiv`, `finrank_rayClassField`, `finrank_hilbertClassField` (`NumberTheory/ClassFieldTheory/ClassFields/RayClassField.lean:262, 230, 299`), `ringClassArtinEquiv` (`.../RingClass/Field.lean:178`), the two real-integer statements (`NumberTheory/NumberField/Quadratic/MaximalRealSubfield.lean:60, 70`), `norm_siegelFunction_le_of_le_half` (`NumberTheory/ModularForms/SiegelFunction/Bounds.lean:103`), `heegnerGamma` (`NumberTheory/ClassNumberOne/FourthPowerCubic.lean:65`).
- Cross-roadmap citations resolved on main (3): ModularForms §10D (homogeneity of `℘` and homotheties, README line 1332), ModularCurvesPartII §1.1 (README line 393, the pointed biholomorphism), ClassFieldTheory Layers 10–13 (README lines 1638, 1781, 1834, 1924).
- Lean: `Suggested.lean` elaborates with six `sorry` warnings and nothing else; one `import Mathlib` and three Tau Ceti modules, no `set_option`, no sorried data.
- Dependency check: `depcheck: 200 roadmaps, 2209 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. The automatic checks, run again on this head, all passed.
- Source locators: none in changed passages (there are none); the seeded sample (§§1.1–3.6) falls in untouched text, verified in the earlier reviews.

Overlap check: read QuadraticCharactersAndReduction, AnalyticNumberTheoryPartI and MultiquadraticPartII on main, EffectiveClassNumbers and ComplexMultiplicationAndExplicitReciprocity at their open heads (scopes as in the previous review; nothing changed). `χ_D`: owned by the pinned Tau Ceti library, consumed here and by QuadraticCharactersAndReduction. Siegel's ineffective bound, the class-number-one theorem, the CM dictionary of §3.1: owned here, cited by EffectiveClassNumbers and ComplexMultiplicationAndExplicitReciprocity. Effective bounds of Goldfeld's type: EffectiveClassNumbers. Complex uniformization: ModularForms §10D and ModularCurvesPartII §1.1, consumed here.

Source independence: changed passages only; 0 passages compared (the folder has no changed passage); largest share shin2010, 14 of 22 locators; contents not compared again (no layer added, removed or reordered; independent in the earlier review).

Research link: Siegel's theorem (1935, via Davenport Chapter 21) and the Heegner–Stark class-number-one theorem (Heegner 1952, Stark 1967 and 1969) proved by Shin's Siegel-function route (2010); consumed by EffectiveClassNumbers and ComplexMultiplicationAndExplicitReciprocity. Rests on the README's References and Downstream consumers and on shin2010 lines 61–66.

## Not verifiable

- davenport1980, Chapters 6 and 21 (§§2.1–2.4): settled as uncertified; not opened.
- stark1969 (§3.3) and Stark 1967: settled as uncertified or no legal open copy; not opened.
- Cox, *Primes of the Form x² + ny²*, Theorems 7.7 and 7.24 (§§1.3–1.4): no legal open copy; not opened.
- The description's split of the 45 Checks into "about 21" old required tests and "about 24" new ones: the old list has 11 bullets, each holding several tests, so the split depends on how they are counted; the total of 45 was counted.

Automatic checks set aside as false positives: none failed; the listing of Lean declarations added against main reports one, `of`, that does not exist: it is the word after "theorem" in the module docstring of the Lean file.

## Source issues

- **Misprint** in shin2010 at Proposition 2.5, p. 5: the source lists ±[[−1, −3], [1, −2]], of determinant 5, in the kernel for ℚ(√−3); it should be ±[[1, −3], [1, −2]], the matrix of the unit τ_K − 2; affects nothing.

## For the human reviewers

- AnalyticNumberTheoryPartI on main says the effective forms of this roadmap's §§2.3–2.4 follow from its own exclusion of Landau–Siegel zeros, an open problem; this README states no effective form and relies on none (Scope).
- The group isomorphism `ℂ/Λ ≅ E_Λ(ℂ)` is stated by two roadmaps on main, ModularForms §10D and ModularCurvesPartII §1.1; this README consumes both (§3.1).
- Davenport, Stark 1967/1969 and Cox could not be read, so the wording of §§1.3–1.4 and Layer 2 was not compared with them; shin2010, the source with the largest share, was read in full in an earlier review.
