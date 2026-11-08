# Review of QuadraticCharactersAndReduction (pull request #1904 at 5170511)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/QuadraticCharactersAndReduction/` (README.md 298 lines, Suggested.lean 125 lines, metadata.toml) at the pins Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`. The worker's gate passes at this head, the dependency check reports no UPWARD or CYCLE line, Suggested.lean elaborates with only `sorry` warnings, and nothing outside the folder changes. All ten sorried statements are true on every instance tried (table below). Seven findings, three of them blocking.

## R01 (P2): The Frobenius congruence and the coordinate bound have a second owner in AnalyticNumberTheoryPartI §0.34c, which comes before this roadmap

Location: README.md line 290: "together they give the elementary inputs of determinant and interpolation arguments on points of `ℤ[√d]` … AnalyticNumberTheoryPartI is a supplier of Layer 1 and takes nothing from it". Also Suggested.lean lines 110–113 (`frobenius_congruence`) and 120–123 (`norm_embedding_le`).

Claim: this roadmap owns Layers 3–4, and no earlier roadmap uses them.

Witness: AnalyticNumberTheoryPartI at its head, README.md line 807 (§0.34c, fact 3): `(d/p)=−1` gives `(x+y√d)^p≡x−y√d mod pℤ[√d]`. Line 806 (fact 2): `|x±y√d|≤N(1+√|d|)`. Its *Needs:* names no supplier. Merge order: ANT I 49, this roadmap 50.

Repair: ANT I's proof route has to prove both facts itself, while this roadmap states them as headlines and consumes ANT I §0.34a. The two roadmaps supply each other, and each of these two objects has two owners. Give each fact one owner placed before ANT I. There are two ways to do this:

- **Split this roadmap.** Move Layers 2–4 into a separate roadmap placed before AnalyticNumberTheoryPartI. Their own `### Dependencies` already say they take nothing from Layer 1 or from ANT I, so they move unchanged. ANT I §0.34c then cites `frobenius_congruence` for fact 3 and `norm_embedding_le` for fact 2, and this roadmap keeps Layer 1 after ANT I.
- **Move the facts into ANT I.** ANT I §0.34c states both facts as targets, and §§3.3 and 4.1 here cite them.

Either way, the Downstream consumers paragraph should then name the consumer.

The citation checks on the witness:

- **Fact 3.** Take `r = d` squarefree and an odd prime `p ∤ d`. Then `legendreSym p d = −1` is exactly `¬ IsSquare (d : ZMod p)`, so `frobenius_congruence` applies as stated.
- **Fact 2.** Take `u = x`, `v = y` with `0 ≤ x, y < N`. Then `norm_embedding_le` gives `|x ± y√d| ≤ x + y√|d| < N(1 + √|d|)`.

## R02 (P2): §§1.1–1.3 re-prove the shape of a quadratic conductor, which pinned Tau Ceti and ClassicalArithmeticCompletion already own

Location: README.md line 7: "This roadmap owns the conductor classification of quadratic Dirichlet characters at prime-power levels and its assembly". Line 98: "Consequently the conductor of a quadratic character is `2^ε · ∏ p_i` with `ε ∈ {0, 2, 3}`". Also the routes at lines 66 and 82, the bullet at line 85, and Suggested.lean lines 31–41.

Claim: no one else states these conductor facts, and the cyclic-structure routes are needed. (The Scope bullet at line 10 lists ClassicalArithmeticCompletion §§1.1 and 1.3–1.8 only.)

Witness:

- Tau Ceti `DirichletCharacter.IsPrimitive.factorization_two_eq_zero_or_two_or_three` (`NumberTheory/DirichletCharacter/Dyadic/Quadratic.lean` line 83): a primitive quadratic character's level has 2-adic exponent 0, 2 or 3.
- ClassicalArithmeticCompletion on main, §1.21: its odd part is squarefree.

Repair: the README never mentions ClassicalArithmeticCompletion §§1.2, 1.9, 1.20, 1.21 or 1.32, nor the Tau Ceti files `Dyadic/Basic.lean` (`IsPrimitive.factorization_two_ne_one`, line 68), `Dyadic/Quadratic.lean` (lines 77 and 83) or `Quadratic.lean` (`isQuadratic_changeLevel`, line 55; `MulChar.isQuadratic_prod`, line 28). Granting that `χ.primitiveCharacter` is quadratic (the README asserts this at line 114), the two Lean headlines follow in two steps.

1. Cite the Tau Ceti theorems above under `### From Tau Ceti` and in Scope. Cite ClassicalArithmeticCompletion §§1.2 and 1.21 in Scope and in the contracts heading.
2. Replace the "Consequently …" sentence of §1.3 by a citation of the Tau Ceti dyadic theorem together with ClassicalArithmeticCompletion §1.21, which are its primitive case.
3. Reroute §§1.1–1.2 as follows. The conductor of `χ` is the level of `χ.primitiveCharacter`, a primitive quadratic character of level `p^j` (resp. `2^j`). ClassicalArithmeticCompletion §1.21 forces `j ≤ 1`, and the Tau Ceti theorem forces `j ∈ {0, 2, 3}`. Name both in the *Needs:* lines.
4. What §§1.1–1.2 add beyond this is the enumeration: exactly two (resp. four) quadratic characters at the level, namely the principal one and the lift of `quadraticChar (ZMod p)` (resp. the lifts of `1`, `ZMod.χ₄`, `ZMod.χ₈`, `ZMod.χ₈'`). State that as the target and as the Lean headline. It is statable at the pins with `changeLevel` and `MulChar.ringHomComp`, and it is what the Summary's "local classification" means.
5. Delete the bullet at line 85. It is ClassicalArithmeticCompletion §1.4's first Check and `fundamentalDiscriminantChar_neg_one`.

Tested on two instances:

- At level 9, the nonprincipal quadratic character has the Legendre character modulo 3 as its primitive character, so `j = 1` and the conductor is 3.
- At level 16, the order-four character `5 ↦ i` is not quadratic, so the Tau Ceti theorem does not apply to it. This is consistent with the Check at line 92.

## R03 (P2): §2.2's bound `#U · #V ≤ m²` is missing `m > 0`

Location: README.md line 163: "For `U, V` with injective reduction, `ρ_m` restricted to the coordinate rectangle is injective, and the image has `#U · #V` elements in a set of size `m²`; hence `#U · #V ≤ m²`."

Claim: the bound holds for every `m`.

Witness: `m = 0`, `U = V = {0}`. Reduction modulo 0 is the identity of ℤ, injective on `{0}`. The rectangle has 1 element, but `m² = 0`. The Check at line 170 asserts that `{0}` reduces injectively for every `m`.

Repair: the "set of size `m²`" is the junk value `Nat.card ℤ[ω] = 0` at `m = 0`. Write "For `m > 0` and `U, V` with injective reduction, …". Tested:

- `m = 1`, `U = V = {0}`: `1 ≤ 1`.
- `m = 2`, `U = V = {0, 1}`: `4 ≤ 4`.

## R04 (P3): The supplier contracts credit ANT I's declaration with more than it states, and omit declarations the routes use

Location:

- README.md line 52: "`quadratic_character_kronecker`: a primitive nonprincipal real Dirichlet character `χ` of conductor `q` is the complexification of `fundamentalDiscriminantChar D`, transported to level `q`, for the fundamental discriminant `D = χ(−1) q`".
- Line 114: "Otherwise AnalyticNumberTheoryPartI §0.34a gives `D = χ(−1) · χ.conductor`".
- Lines 31 and 54–56.

Claim: the named declaration supplies `D` and the identification.

Witness: AnalyticNumberTheoryPartI's Suggested.lean, line 66 at its head, concludes only `∃ d, Squarefree d ∧ d ≠ 1 ∧ |d| ≤ q ∧ ∀ p` odd prime `∤ q`, `χ p = jacobiSym d p`. `D = χ(−1) q` appears only in its prose (README line 797).

Repair: the contracts also have gaps in both directions. `DirichletCharacter.conductor_changeLevel` (in the *Needs:* lines of §§1.1 and 1.2), `ZMod.chineseRemainder`, `quadraticChar` and `legendreSym` are used but missing from the contracts. ClassicalArithmeticCompletion §§1.7 and 1.8 are in the contracts heading, but no *Needs:* line uses them.

1. At line 52, attribute the full statement to "§0.34a" and the declaration only with the conclusion it states.
2. Add the bridge to §1.4's route and *Needs:* line:
   - Set `D = fundamentalDiscriminant d` (Tau Ceti `…/FundamentalDiscriminant/OfSquarefree.lean` line 51).
   - `fundamentalDiscriminantChar_natCast_eq_legendreSym` gives agreement with `χ` at the odd primes `p ∤ q`.
   - `DirichletCharacter.conductor_eq_of_eventually_apply_prime_eq` and `primitiveCharacter_apply_eq_of_eventually_apply_prime_eq` (Tau Ceti `NumberTheory/DirichletCharacter/PrimeValues.lean` lines 86 and 94) give `|D| = q` and equality at every integer.
   - The sign is `χ(−1) = sign D`.

   Tested at `q = 12`: the declaration gives `d = 3`, with `(3/5), (3/7), (3/11) = −1, −1, 1`. Then `fundamentalDiscriminant 3 = 12` (since `3 % 4 = 3`), the conductor is `12 = |D|`, and `χ(−1) = 1 = sign 12`.
3. Add the four missing names under `### From Mathlib`.
4. Either use ClassicalArithmeticCompletion §1.8 (or the PrimeValues forms) in §1.4's *Needs:* line, or drop §§1.7–1.8 from the heading at line 54.

## R05 (P3): Targets without locators (the previous review's R08 is only partly repaired)

Location: these targets carry no locator:

- §1.4 (line 114, `exists_unique_fundamental_discriminant`)
- §2.1 (line 142, `reduction_kernel`, `bijective_reductionQuotientHom`)
- §2.2 (line 160, `card_reduction_quotient`)
- §3.1 (line 203, the trichotomy)
- §3.2 (line 220, `pow_card_eq_star`, `pow_card_eq_self_of_square`)
- §4.1 (line 264, `norm_embedding_le`)

The References list Theorem 9.2, Theorem 9.13 (line 296) and Theorem 3.41 (line 298), but no claim cites them.

Witness: the matching source passages are mv-mnt1-ch9 line 742 (Theorem 9.13, p. 297) and line 57 (Theorem 9.2, p. 283); milne-ant lines 2783–2786 (proof of Theorem 3.41, p. 63); and milne-ant line 5671 (Example 7.54, p. 129).

Repair:

1. Cite (mv-mnt1-ch9, Theorem 9.13, p. 297) at §1.4's claim, for the primitive case.
2. Cite (mv-mnt1-ch9, Theorem 9.2, p. 283) at line 102, for the deleted-factor formula.
3. Cite (milne-ant, proof of Theorem 3.41, p. 63) at §2.1. That proof identifies `A[X]/(f)` modulo a prime `p` with `k[X]/(f̄)`, the prime case of the quotient comparison that §2.1 extends to every `m`.
4. Cite (milne-ant, Example 7.54, p. 129) at §3.2. There the `q`-th power map generates `Gal(k_n/k)`, so the `Q`-th power map generates `Gal(F_{Q²}/F_Q)`.
5. For §§2.2, 3.1 and 4.1, give a textbook locator, or say in the sentence that they are elementary consequences of the cited statements.
6. Add Example 7.54 to the milne-ant reference and to the manifest's locator.

## R06 (P3): Layer 2 restates pinned Mathlib lemmas

Location: README.md line 145: "`norm (ρ_m z) = (norm z : ZMod m)` and `trace (ρ_m z) = (trace z : ZMod m)`, by the coordinate formulas of norm and trace". Line 177: "Prove that `ι` is injective".

Claim: these are targets of this roadmap.

Witness: Mathlib `QuadraticAlgebra.norm_mapRingHom` and `trace_mapRingHom` (`Algebra/QuadraticAlgebra/Basic.lean` lines 554, 558) state line 145. `isRegular_im_omega_iff_injective` (`AlgHom.lean` line 65) makes `ι` injective: `(ι ω).im = 2` is regular in ℤ.

Repair: `isUnit_im_omega_iff_bijective` (`AlgHom.lean` line 75) also gives bijectivity modulo odd `m`. Cite the four names at lines 145 and 177 and under `### From Mathlib`. Keep the route for the image `{y even}` and for the failure at `m = 2`. On `d = 5`: `(ι ω).im = 2`. That is regular in ℤ (so `ι` is injective), a unit in `ZMod 3` (so the map is bijective modulo 3), and zero in `ZMod 2` (so it is not injective modulo 2), as the Check at line 185 says.

## R07 (P3): Statement precision

Location:

- README.md line 100: "The local factors are `χ ∘ changeLevel`-sections".
- Line 269: "`‖σ₊ z‖² = norm z` exactly when `r < 0`".
- Suggested.lean line 32 and README line 66: `hk : 0 < k` ("`k ≥ 1`").

Witness: (i) `χ ∘ changeLevel` does not type as a character of level `p^k`, and the term is never defined. (ii) At `r = 2`, `z = 1`: `‖σ₊ 1‖² = 1 = norm 1`; at `z = ω`: `2 ≠ −2`. (iii) `k = 0`: level 1, conductor 1.

Repair:

- (i) Write instead: "the local factor at `p` is the character of level `p^k` whose value at a unit `a` is `χ(x)` for the `x` with `x ≡ a (mod p^k)` and `x ≡ 1 (mod N/p^k)`".
- (ii) Write: "`‖σ₊ z‖² = norm z` for every `z` if and only if `r < 0`".
- (iii) Drop `hk` in both files. This states §1.1 for every `k ≥ 0`, the generality §1.2 already has.

## Verified sound

**Previous review, finding by finding.**

| Finding | Status | What changed |
| --- | --- | --- |
| R01 (Q2 had a second owner in ANT I §0.34a) | Repaired | Scope line 9 now names "AnalyticNumberTheoryPartI §0.34a" as owner, and §1.4 "adds only the conductor-one case, the uniqueness of `D` and the extension to imprimitive characters at any level". The radicand theorem, the sorried example and the pull-request URL are gone. A residual over-attribution is R04. |
| R02 (ClassicalArithmeticCompletion Layer 1 and Tau Ceti value tables restated) | Repaired for the items it listed | Scope line 10 cites ClassicalArithmeticCompletion §§1.1, 1.3–1.8, and line 11 cites the native Tau Ceti tables. The new duplication against Tau Ceti's dyadic files and ClassicalArithmeticCompletion §§1.9, 1.21 and 1.32 was not in R02; it is R02 of this review. |
| R03 (gate failures) | Repaired | No `set_option`, no admitted examples, `reductionQuotientHom` with `bijective_reductionQuotientHom` instead of `Nonempty (≃+*)`, `[Finite F]` with `Nat.card F`, no LaTeX, no pull-request numbers. |
| R04 (README form) | Repaired | House shape throughout: `# Roadmap:`, `**Summary.**`, Scope, Conventions, Exact supplier contracts, How to read the build, `### k.n` sections with *Needs:* lines, bulleted Checks (at least 3 per definition), Examples, Dependencies, Downstream consumers. |
| R05 (supplier-table drift) | Repaired | MultiquadraticPartII and ImaginaryQuadraticClassNumber rows dropped. Line 13 now says ThetaSeries §2H and ImaginaryQuadraticClassNumber H2.1 are "neither a supplier nor a consumer". |
| R06 (padding) | Repaired | All six listed declarations and the examples are deleted. |
| R07 (docstring and imports) | Repaired | The docstring reads "Quadratic characters and reduction: target signatures", with the sentence that nothing is unstatable. The only import besides Mathlib is `…FundamentalDiscriminant.Realization`. `open Polynomial` is gone. |
| R08 (locators) | Partly repaired | Conrad Theorem 2.4 and Corollary 3.1 are now at §3.3; Milne is cited by example with page; "five nonprincipal characters" at level 9 is fixed. Target locators are still missing: R05. |

**Gate and tools.**

- The worker's gate passes every check.
- My re-run differs only in `depcheck: NOT IN ORDER`, because it read main's merge order, which does not list a new roadmap. That is not a finding.
- The dependency check against the candidate order prints `depcheck: 237 roadmaps, 2420 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- `lake env lean` on Suggested.lean takes 7 s and gives exactly 10 `declaration uses sorry` warnings.

**Binders.** I ran `#check @` on all 11 declarations in one scratch file. Each elaborated type matches its README statement. The file has no `variable` block, so no binder is lost. No change was needed.

**One-tactic probe.** On a scratch copy I tried `first | rfl | (simp; done) | infer_instance | (aesop; done) | (grind; done) | (norm_num; done)`, and separately `exact?`, on all 10 sorried theorems. Neither closes any of them. No padding.

**Computations in Lean.** Seven `decide` checks pass on a scratch copy:

- `(1+ω)^3 = star (1+ω)` in `QuadraticAlgebra (ZMod 3) (-1) 0`
- `(1+ω)^5 = 1+ω` in `(ZMod 5) (-1) 0`
- `(1+ω)^3 = 1` in `(ZMod 3) 0 0`
- `ω^7 = -ω` in `(ZMod 7) 3 0`
- `(1+ω)^2 = 0` in `(ZMod 2) 1 0`
- `ω^5 ≠ ω` in `(ZMod 5) 0 0`
- `ω^2 ≠ ω` in `(ZMod 2) 1 0`

**Headline theorems.** The Summary names four end theorems, and all are stated in Suggested.lean:

1. the local classification at prime-power levels (`odd_prime_power_conductor`, `two_power_conductor`) and the primitive discriminant at any level (`exists_unique_fundamental_discriminant`);
2. the reduction comparison (`reduction_kernel`, `bijective_reductionQuotientHom`, `card_reduction_quotient`);
3. the Frobenius identities (`pow_card_eq_star`, `pow_card_eq_self_of_square`, `frobenius_congruence`);
4. the coordinate bound (`norm_embedding_le`).

None is unstatable, as the docstring says. The only definition, `reductionQuotientHom`, has a real body. No sorried data, `set_option`, `lemma` or extra import.

**Library declarations opened at the pins (file:line).**

*Mathlib.*

- `NumberTheory/DirichletCharacter/Basic.lean`: `FactorsThrough.existsUnique` 136, `conductor_dvd_level` 250, `eq_one_iff_conductor_eq_one` 267, `changeLevel_primitiveCharacter` 309, `primitiveCharacter_isPrimitive` 313, `primitiveCharacter_apply_of_isCoprime` 327, `conductor_changeLevel` 363.
- `NumberTheory/MulChar/Basic.lean`: `IsQuadratic` 443, `IsQuadratic.comp` 515.
- `RingTheory/ZMod/UnitsCyclic.lean`: `isCyclic_units_of_prime_pow` 206, `isCyclic_units_two_pow_iff` 238 (`↔ n ≤ 2`).
- `NumberTheory/LegendreSymbol/Basic.lean`: `ZMod.euler_criterion` 62, `legendreSym.eq_pow` 116.
- `FieldTheory/Finite/Basic.lean`: `FiniteField.pow_card` 228, `ZMod.pow_card` 557, `isSquare_of_char_two` 737, `exists_nonsquare` 742, `odd_card_of_char_ne_two` 761, `isSquare_iff` 798.
- `Algebra/QuadraticAlgebra/Defs.lean`: `ext` 43, `equivProd` 58, `algebraMap_dvd_iff` 461.
- `Algebra/QuadraticAlgebra/Basic.lean`:
  - `star` 212, `star_mk` 216: `⟨x + b·y, −y⟩`, so `star ω = −ω` at `b = 0`.
  - `mul_star` 230; `norm` 266 and `norm_def` 271 (`re² + b·re·im − a·im²`, as in the Conventions); `norm_star` 308.
  - `trace` 395 and `trace_def` 402 (`2re + b·im`).
  - `mapRingHom` 518, `_omega` 526, `_injective` 529, `_surjective` 535, `_comp` 544 (`rfl`), `norm_mapRingHom` 554, `trace_mapRingHom` 558, `mapRingHom_star` 562.
  - The `Field` instance 624, and its `b = 0` bridge from `Fact (¬IsSquare a)` at 640.
- `Algebra/QuadraticAlgebra/Discriminant.lean`: `discr` 52 (`b² + 4a`).
- `Algebra/QuadraticAlgebra/AlgHom.lean`: `isRegular_im_omega_iff_injective` 65, `isUnit_im_omega_iff_bijective` 75, `trace_algHom` 103, `algHom_star` 109, `norm_algHom` 114. All three of the last need `Function.Injective f` and the same base ring, which §2.3's `ι` satisfies.
- `Algebra/QuadraticAlgebra/Int.lean`: `algebraMap_omega` 60, `isDomain_iff` 109.
- `Algebra/QuadraticAlgebra/Rat.lean` 35 and 48.
- `RingTheory/Ideal/Quotient/Defs.lean`: `mk` 83, `lift` 144, `quotEquivOfEq` 212.
- `RingTheory/Ideal/Quotient/Operations.lean`: `quotientKerEquivOfSurjective` 89.
- `RingTheory/Ideal/Span.lean`: `mem_span_singleton'` 93, `span_singleton_le_iff_mem` 98.
- `Data/ZMod/Basic.lean`: `natCast_self` 145, `intCast_zmod_eq_zero_iff_dvd` 513, `intCast_eq_intCast_iff_dvd_sub` 516, `chineseRemainder` 889.
- `SetTheory/Cardinal/Finite.lean`: `Nat.card_congr` 93, `card_prod` 227, `card_zmod` 251.
- `Analysis/Complex/Norm.lean`: `norm_real` 105, `norm_intCast` 131, `norm_ratCast` 138.
- `Analysis/Real/Sqrt.lean`: `sqrt_mul_self` 152, `sqrt_sq` 180.
- `Algebra/DualNumber.lean`: `lift` 148.

Nothing at the pin states the kernel or the quotient of `QuadraticAlgebra ℤ a b` modulo a general `m`, the finite-field identities on `QuadraticAlgebra F r 0`, the integral congruence, the `DualNumber` model of `r = 0`, or the embedding bound for `r > 0`. Tau Ceti has the prime case of the kernel only as a local `have` inside `isMaximal_span_natCast_iff`.

*Tau Ceti.*

- `LegendreSymbol/KroneckerSymbol.lean`: `kroneckerChar` 376, `_apply` 397, `_intCast` 403.
- `Multiquadratic/FundamentalDiscriminant/Character.lean`: definition 38, `_intCast` 45, `_neg_one` 76 (`D.sign`), `_isQuadratic` 81, `isPrimitive_` 92, `_natCast_eq_legendreSym` 100, `_two` 109, `_ne_one` 122.
- `Values.lean`: `_natCast_eq_jacobiSym` 32, `_oddPrimeDiscriminant` 47, `_mul` 58, `_neg_four` 84, `_eight` 99, `_neg_eight` 107.
- `Realization.lean`: definition 32, `_apply` 37, `_ringHomComp` 43, `_isQuadratic` 51, `isPrimitive_` 59, `conductor_` 66, `_eq_one_iff` 71.
- `OfSquarefree.lean`: `fundamentalDiscriminant` 51 (`if d % 4 = 1 then d else 4d`), `isFundamentalDiscr_fundamentalDiscriminant` 95.
- `DirichletCharacter/Conductor.lean`: `conductor_ringHomComp` 45, `isPrimitive_ringHomComp_iff` 53, `conductor_mul_of_coprime` 62, `conductor_prod_of_pairwise_coprime` 76.
- `DirichletCharacter/PrimeValues.lean` 57–94, `Dyadic/Basic.lean` 68, `Dyadic/Quadratic.lean` 77 and 83, `Quadratic.lean` 28 and 55 (R02, R04).
- `QuadraticOrder/PrimeIdeal.lean`: `eq_or_eq_of_natCast_mem` 304, `isMaximal_span_natCast_iff` 330.
- `Algebra/QuadraticAlgebra/Split.lean`: `algEquivProdOfRoots` 59, `algEquivProdOfSq` 96 (`[Invertible 2]`, `ω ↦ (u, −u)`), and its `_apply` and `_symm_apply`, which agree with §3.1's formulas.
- `NumberField/Quadratic/ComplexEmbedding.lean`: `complexEmbedding` 72 (`a ≤ 0`, `ω ↦ √(−a)·i`), `_apply` 79, `algHom_eq_or_eq_comp_starAlgEquiv` 99, `ringHom_eq_or_eq_conjugate` 165.
- `NumberField/Quadratic/Frobenius.lean`: `arithFrobAt_eq_one_iff_legendreSym_eq_one` 40 (`p ≠ 2`, `p ∤ d`, `minpoly θ = X² − d`).

**Cross-roadmap citations resolved.**

- *AnalyticNumberTheoryPartI*, at its open head (6429a72):
  - §0.34a is at README line 797 and its Lean form at Suggested.lean line 66 (R04); §0.34c facts are at lines 806–807 (R01).
  - Its README cites "QuadraticCharactersAndReduction §Q2" at lines 13 and 3164. That id no longer exists here; the content is now §1.4. The repair belongs to ANT I's text, so it is not a finding against this folder.
  - This pull request's description still says Q2 supplies ANT I §0.34a, which is the reverse of the README; the description should be updated.
- *ClassicalArithmeticCompletion*, on main: §1.1 line 346 (`unitsTwoPowEquiv`, `(ℤ/2^(e+3))ˣ ≃ ℤ/2 × ℤ/2^(e+1)`); §1.3 at 410; §1.4 at 436; §1.5 at 459; §1.6 at 480; §1.7 at 501; §1.8 at 545; §1.9 at 566; §1.21 at 991; §1.32 at 1296; §1.51 at 1789. §1.51 is the character of a rational square class, a different object from §1.4's level-`N` uniqueness.
- *ImaginaryQuadraticClassNumber* H2.1, on main, line 53.
- *ThetaSeries* §2H, on main, lines 563–574 (its own `kroneckerSym`/`kroneckerChar`).
- *GlobalNumberFields* (Completed), Layer 11 "orders and Picard groups", line 571; *NumberFieldArithmetic* (Completed) exists.

**Ownership against open pull requests.** `roadmaps grep` over main and the 470 open heads found only this roadmap for each of these objects: `mapRingHom (Int.castRingHom`, `QuadraticAlgebra (ZMod`, `z ^ … = star`, conductor `{1, 4, 8}`, "primitive discriminant" and "Frobenius congruence". The exceptions:

- ANT I §0.34c, which is R01.
- AdelicImagesAndModularCurves line 1042 uses conductors 1, 4 and 8 as a fact and owns nothing here.
- The closest roadmaps in the overlaps report (ImaginaryQuadraticClassNumber, EffectiveClassNumbers, CharacterSumsOverFiniteFields, ErdosProgressionPowers, the ClassicalArithmeticCompletion revision) own nothing of Layers 1–4.

No open pull request changes this roadmap, and no cited id is dropped.

**Sources (seeded sample 1.1–4.1).**

- [mv-mnt1-ch9]: PDF page `n` is printed page `281 + n`.
  - Theorem 9.2 (line 57) and Lemma 9.3 (line 62) are on p. 283. They support §1.3 as written: Lemma 9.3 gives primitivity of the product; the conductor product is `conductor_prod_of_pairwise_coprime`.
  - §9.3 is at lines 638–685, pp. 295–296. "Real" equals principal-or-quadratic (lines 639–642), as the Conventions say. Modulo `p^m` the only quadratic character is induced from modulo `p` (lines 669–674): §1.1. Modulo `2^m`, primitive quadratic characters exist only at 4 and 8, and there are four real characters (lines 675–685): §1.2.
  - Theorem 9.13 is at line 742, p. 297 (R05).
- [conrad-quadchar]: Theorem 2.4 at line 141 (PDF p. 3) and Corollary 3.1 at line 150 (PDF p. 4). They support §3.3's comparison as written (for odd `p ∤ D`, `(D|p) = (d|p)`).
- [milne-ant], v3.08, PDF page = printed page + 2:
  - Example 2.41 at line 1797, p. 39: the integral basis `1, (1+√m)/2` for squarefree `m ≡ 1 (mod 4)`, as §2.3 cites.
  - Theorem 3.41 at line 2772, pp. 62–63.
  - Example 3.44 at line 2807, p. 63: (ii) for the odd inert primes and (iii) for 2 inert iff `m ≡ 5 (mod 8)`. Both are cited correctly at §2.1's Check, §2.3 and §3.3.
- §§1.4, 2.1, 2.2, 3.1, 3.2 and 4.1 have no locator: R05.

**Adversarial table** (values computed on each side; `A = QuadraticAlgebra ℤ a b`, `ω² = a + bω`).

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `odd_prime_power_conductor` (§1.1) | `p=3,k=2`; `p=5,k=2`; `k=0` | Level 9: characters of orders 1, 2, 3, 3, 6, 6; the quadratic ones have conductors 1 and 3, the order-3 ones conductor 9 (not quadratic). Level 25: the nonprincipal quadratic character has `χ(2)=−1`, `χ(5)=0`, conductor 5. `k=0`: level 1, conductor 1. | true | drop `hk` (R07); reroute (R02) |
| `two_power_conductor` (§1.2) | `k=0,…,4`; level 16 table | Conductor sets: `{1}`, `{1}`, `{1,4}`, `{1,4,8,8}`, `{1,4,8,8}`. At level 16, the values at 3, 5, 7 are `1,1,1`; `−1,1,−1`; `−1,−1,1`; `1,−1,−1`. The order-4 character `5↦i` has `χ(9)=i²=−1`, so it is primitive of conductor 16 but not quadratic. | true | reroute (R02) |
| §1.2 Check: no `−1,−1,−1` | level 16 | `χ(3)χ(5)=χ(15)=χ(−1)` and `χ(7)=χ(−1)χ(9)=χ(−1)χ(5)²=χ(−1)`, so `χ(3)χ(5)=χ(7)`; `(−1)(−1)≠−1` | true | none |
| §1.3 conductor of a product | level 45; level 12 | Level 45 (`9·5`): local conductors 3 and 5, conductor 15. `χ₄·L₃` at 12: conductor 12, values at 5, 7, 11 are `−1,−1,1` (= ClassicalArithmeticCompletion §1.7 Check). `χ₄` lifted to 12: conductor 4. | true | "Consequently" duplicated (R02) |
| `exists_unique_fundamental_discriminant` (§1.4) | `N=1,3,8,12,6` | `N=1`: only `D=1`, since `−1≡3 (mod 4)`. `N=3`: `D=−3`, `χ(2)=−1=(−3/2)_K` since `−3≡5 (mod 8)`. `N=8`: `χ₈(−1)=1` gives `D=8`, `χ₈'(−1)=−1` gives `D=−8`. `N=12`, `χ₄` lift: `D=−4`; `n=5`: `1=1`; `n=7`: `−1=−1`; `n=3` excluded (lift 0, `χ_{−4}(3)=−1`). `N=6` principal: `D=1`; `D=−3` fails since `3≠1`. | true, `∃!` justified by sign | contract bridge (R04) |
| ANT I contract (§1.4 route) | `q=12` | Lean form: `d=3`, `(3/5),(3/7),(3/11)=−1,−1,1`. `fundamentalDiscriminant 3=12` (`3%4=3`); conductor `12=\|D\|`; `χ(−1)=1=sign 12`. | bridge works with PrimeValues | R04 |
| `reductionQuotientHom` (def) | `a=5,b=0,m=2` | `ρ_2(2)=0`, so the lift is defined; classes `0,1,ω,1+ω ↦ 0,1,ω̄,1+ω̄` | defined | none |
| `reduction_kernel` (§2.1) | `m=0`; `m=1`; `m=2,a=5` | `m=0`: `ZMod 0=ℤ`, kernel `⊥=span{0}`. `m=1`: zero ring, kernel `⊤=span{1}`. `ω−1`: `im=1≢0` on both sides; `2+2ω` lies in both. | true | none |
| `bijective_reductionQuotientHom` | `m=2,a=5`; `m=0` | 4 classes on each side; `m=0`: `A/(0)≅A` and `ρ_0=id` | true | none |
| `card_reduction_quotient` (§2.2) | `m=1,2`; `m=3,a=20`; `m=0` | `1=1²`; `4=2²`; `9=3²` (`20≡2` is a nonsquare mod 3, so `F_9`). `m=0`: `Nat.card A=0=0²` only as a junk value, so `hm` is kept. | true | none |
| §2.2 bullet `#U·#V≤m²` | `m=0,U=V={0}`; `m=2,U=V={0,1}` | `1 ≤ 0` is false; `4 ≤ 4` | **false at `m=0`** | R03 |
| §2.2 interval Check | `U=[0,m]` | `0≡m (mod m)`: injectivity fails at length `m+1` | true | none |
| §2.3 `ι` | `d=5`; `d=−3`; `d=1`; `m=2,3` | `(2ω'−1)²=4(ω'+1)−4ω'+1=5`; `4(ω'−1)−4ω'+1=−3`; at `d=1`, `ω'²=ω'` and `(2ω'−1)²=1`. Mod 2: image `{(s,0)}`, 2 of 4; `ι(ω−1)=2ω'−2∈(2)B`. Mod 3: `det[[1,−1],[0,2]]=2` is a unit. `B/(2)=F₄` for `d≡5 (mod 8)` and `F₂×F₂` for `d≡1 (mod 8)`. | true | cite Mathlib (R06) |
| §3.1 trichotomy | `F₅,r=−1`; `F₃,r=0`; `F₂,r=1` | `1+ω↦(3,4)`, `3·4=12≡2=norm(1+ω)`; `ω≠0`, `ω²=0`; `(1+ω)²=0` (decide), so not `F×F` | true | locator (R05) |
| `pow_card_eq_star` (§3.2) | `F₃,r=−1,z=1+ω`; `F₇,r=3,z=ω`; char 2 | `z³=1−ω=star z` (decide); `ω⁷=ω·3³=−ω` (decide; `3³≡−1`); char 2: every `r` is a square, so the statement is vacuous there | true | locator (R05) |
| `pow_card_eq_self_of_square` | `F₅,r=−1,z=1+ω`; `F₅,r=0`; `F₂,r=1` | `(1+ω)⁵=1+ω` (decide); `ω⁵=0≠ω` (decide), so `hr0` is needed; `ω²=1≠ω` (decide), so `Odd Q` is needed | true, both hypotheses necessary | none |
| §3.2 repeated-root Check | `F₃,r=0,z=1+ω` | `z³=1=z.re`, neither `z` nor `star z` (decide) | true | none |
| `frobenius_congruence` (§3.3) | `r=−1,p=3`; `r=−1,p=5`; `r=5,p=2`; `r=3,p=3` | `(u+vi)³−(u−vi)=(u³−u−3uv²)+(3u²v−v³+v)i`, both coordinates `≡0 (mod 3)`; at `z=1+i`: `−3+3i`. `p=5`: `−1=2²`, `(1+i)⁵−(1−i)=−5−3i∉(5)`, so `hr` is necessary. `r=5,p=2`: second coordinate `2uv+v≡v`. `r=3`: `3≡0` is a square and the second coordinate is `≡v`. | true | none |
| §3.3 coordinate form | `p=3,r=−1` | `u^p−u` and `v^p r^((p−1)/2)+v=v−v³`, both `≡0 (mod 3)` | true | none |
| `norm_embedding_le` (§4.1) | `r=−1`; `r=20,z=1±ω`; `r=4,σω=−2,z=ω+2`; `r=0` | `√2≤2`; `1+2√5≈5.472` equals the bound; `\|1−2√5\|≈3.472<5.472`; `0≤4`; `\|u\|≤\|u\|` | true for every `r` | locator (R05) |
| §4.1 norm comparison | `r=2,z=1`; `r=2,z=ω`; `r=−1` | `1=1` at `r>0`; `2≠−2`; `u²+v²=norm` | true only "for every `z`" | R07 |
| §4.1 `σ±` laws | `z=u+vω` | `σ₊σ₋=u²−rv²=norm`; `σ₊+σ₋=2u=trace`; `σ₊(star z)=u−vs=σ₋ z` | true | none |
| Conventions | `star ω`, `discr r 0`, `norm` | `⟨0+0·1,−1⟩=−ω`; `0²+4r=4r`; `norm_def = re²+b·re·im−a·im²` | match Mathlib | none |

## Not verifiable

- none. All three cited texts were read from the legal copies in the sources cache (the author's page for Montgomery–Vaughan Chapter 9, Conrad's course page, Milne's site). AnalyticNumberTheoryPartI was read at its open head through `roadmaps show`.

## Source issues

- **Misprint** in mv-mnt1-ch9 at §9.3, definition of quadratic discriminant and Theorem 9.13, pp. 296–297: condition (a) admits `d = 1`, so the theorem calls the principal character modulo 1 quadratic; it should exclude `d = 1`, since quadratic there means order two; affects nothing.
- **Misprint** in milne-ant at Example 3.44 (ii)–(iii), p. 63: it says `(p)` is a prime ideal "in `ℚ[√m]`", and in (iii) writes `(p)` for the prime 2; it should say the ring of integers `O_K`, and `(2)`; affects nothing.
- **Misprint** in conrad-quadchar at Definition 3.2, PDF p. 4: the Jacobi symbol `(N|·)` is defined on integers prime to `D`; it should be integers prime to `N`; affects nothing.
