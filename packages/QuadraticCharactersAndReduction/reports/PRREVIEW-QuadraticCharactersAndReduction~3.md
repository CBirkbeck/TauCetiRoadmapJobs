# Review of QuadraticCharactersAndReduction (pull request #1904 at c237aa8)

**Verdict:** needs changes

This is an incremental re-review of the 134 lines that changed since `5170511`, at the pins Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`.

- All seven previous findings are repaired.
- One new blocking finding: AnalyticNumberTheoryPartI has moved since the last review (its head is now `979e68c`), and its §0.34a now declares the discriminant form that §1.4 here re-derives.
- One P3 finding: the repairs introduced library names that do not exist at the pin.
- The gate passes, Suggested.lean elaborates with exactly 10 `sorry` warnings, and both new Lean headlines are true on every instance tried.

## R01 (P2) — AnalyticNumberTheoryPartI §0.34a now declares the primitive discriminant form that §1.4 re-derives

**Location.**

- README.md line 9: "§1.4 consumes the declaration's conclusion and adds the passage from `d` to `D`".
- Line 57: "Its declaration `quadratic_character_kronecker` states … the radicand form only … §1.4 … passes from `d` to `D` itself".
- The §1.4 route at line 121 and its *Needs:* at line 135.
- Suggested.lean lines 58–60: "reached from the radicand of AnalyticNumberTheoryPartI §0.34a".

**Claim.** §0.34a supplies only the radicand `d`, and this roadmap owns the step from `d` to `D`, which takes the route through `fundamentalDiscriminant`, the Legendre comparison and PrimeValues.

**Witness.** ANT I at `979e68c`, Suggested.lean line 69: `quadratic_character_eq_fundamentalDiscriminantChar` gives, for primitive quadratic `χ ≠ 1` at level `q` and `D := ±q` by the sign of `χ(−1)`, `∃ hD, ∀ n, χ n = fundamentalDiscriminantCharCast ℂ D hD n`. Its README line 870 derives the radicand form from it.

**Why this matters.** The statement "a primitive nonprincipal real character is `χ_D` with `D = χ(−1) q` at every integer" now has two owners: ANT I's declaration, and §1.4's route, which Scope line 9 claims as this roadmap's own. ANT I proves the radicand form from the `D` form, and §1.4 then rebuilds the `D` form from the radicand form.

**Repair.**

1. At lines 9 and 57, name `quadratic_character_eq_fundamentalDiscriminantChar` as §0.34a's statement of the primitive case, and delete "the passage from `d` to `D`" from what §1.4 adds.
2. Reroute §1.4. If `χ* = χ.primitiveCharacter` is not principal, apply that declaration to `χ*` at level `q = χ.conductor`. It gives `D = ±q` fundamental and `χ*(n) = χ_D(n)` at every integer `n`, so `|D| = q`. Then `primitiveCharacter_apply_of_isCoprime` gives agreement at every `n` coprime to `N`. Uniqueness stays as written, by sign.
3. In the *Needs:* line, replace `quadratic_character_kronecker` with the new declaration. Drop `fundamentalDiscriminant`, `isFundamentalDiscr_fundamentalDiscriminant`, `fundamentalDiscriminantChar_natCast_eq_legendreSym`, `legendreSym.to_jacobiSym` and the two PrimeValues names from it.
4. Update the Lean docstring to match.

**Tested on the repaired route.**

- `q = 12`, `χ = χ₄·L₃`: `χ(−1) = (−1)(−1) = 1`, so `D = 12`, which is fundamental. At level 24, `n = 5`: `χ(5) = −1 = (12/5)`. The alternative `D = −12` is not fundamental (`decide +kernel`).
- `q = 8`: `χ₈(−1) = 1` gives `D = 8`, and `χ₈'(−1) = −1` gives `D = −8` (`decide`).

## R02 (P3) — Three cited library names do not exist at the pin

**Location.**

- README.md lines 35, 152 and 163: `QuadraticAlgebra.mapRingHom_apply_re`, `mapRingHom_apply_im`.
- Lines 32, 121 and 135: `legendreSym.to_jacobiSym`.

These names were added by the repairs of the previous R04 and R06.

**Witness.**

- `#check @QuadraticAlgebra.mapRingHom_apply_re` (and `_im`) gives "Unknown constant". `@[simps!]` on `mapRingHom` (`Algebra/QuadraticAlgebra/Basic.lean` line 517) generates `re_mapRingHom_apply` and `im_mapRingHom_apply`; `simp?` returns these.
- `legendreSym.to_jacobiSym` is `jacobiSym.legendreSym.to_jacobiSym` (`JacobiSymbol.lean` line 115).

**Repair.** Write `QuadraticAlgebra.re_mapRingHom_apply`, `QuadraticAlgebra.im_mapRingHom_apply` and `jacobiSym.legendreSym.to_jacobiSym`; or drop the last one if the R01 reroute no longer uses it. All three corrected names resolve at the pin: they appear in the environment listing, and `simp?` closes `(mapRingHom f 3 0 z).re = f z.re` with `re_mapRingHom_apply`.

## Previous findings

- R01 — repaired: line 10 now records ANT I §0.34c facts 2 and 3 as special cases, gives the general forms here with how they differ, and says ANT I "takes nothing from it". At `979e68c` both facts are still inline (README lines 879–880), and nothing flows upward.
- R02 — repaired: §§1.1–1.2 now go through `χ*`, ClassicalArithmeticCompletion §1.21 and Tau Ceti `IsPrimitive.factorization_two_eq_zero_or_two_or_three`. The headlines are now the enumerations `odd_prime_power_classification` and `two_power_classification`. The "Consequently…" sentence and the parity bullet are gone.
- R03 — repaired: line 170 reads "for `m > 0` the image has `#U · #V` elements in a set of size `m²` … At `m = 0` the bound fails". The Check at line 177 agrees.
- R04 — repaired against the head it read: the contract states only `quadratic_character_kronecker`'s conclusion, the bridge is in §1.4, the four names are listed, and §§1.7–1.8 are dropped. ANT I has changed since then: R01 of this report.
- R05 — repaired: the locators are Theorem 9.13 at §1.4, the proof of Theorem 3.41 at §2.1 and Example 7.54 at §3.2. §§2.2, 3.1 and 4.1 say they are elementary consequences, and Theorem 9.2 is cited at lines 12 and 32.
- R06 — repaired: `norm_mapRingHom`, `trace_mapRingHom`, `isRegular_im_omega_iff_injective` and `isUnit_im_omega_iff_bijective` are cited at lines 152 and 184. The coordinate names added beside them are R02.
- R07 — repaired: (i) line 106 defines the local factor by `x ≡ a (mod p^k)`, `x ≡ 1 (mod N/p^k)`. (ii) Line 276 has "for every `z` if and only if `r < 0`" under "for nonsquare `r`". (iii) `hk` is dropped and `k : ℕ` is free.

## Verified sound

**Gate and tools.**

- The worker's gate passes every check.
- My re-run differs only in `depcheck: NOT IN ORDER`, because it reads main's merge order. That is not a finding.
- The dependency check against the candidate order prints `depcheck: 238 roadmaps, 2342 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. ANT I is at 49 and this roadmap at 50.
- Nothing outside the folder changes.
- `lake env lean` on Suggested.lean (6 s) gives exactly 10 `declaration uses sorry` warnings.

**Binders.** I ran `#check @` on all 11 declarations in one scratch file, after `lake build` of the missing Tau Ceti modules `Dyadic.Quadratic` and `PrimeValues`. Each elaborated type matches its README statement, including `k : ℕ` with no `hk`, and no binder is lost. Nothing changed.

**Padding probe.** I tried `first | rfl | simp | infer_instance | aesop | grind | norm_num` and, in a separate file, `exact?` on `odd_prime_power_classification` and `two_power_classification`. None closes either theorem.

**Headlines.** The four end theorems of the Summary are all stated, and the docstring correctly says nothing is unstatable. The two new Layer 1 headlines are what the previous R02 asked for.

**Library declarations opened at the pins (new this round).**

*Mathlib.*

- `Data/ZMod/Units.lean`: `unitsMap_surjective` 50.
- `LegendreSymbol/QuadraticChar/Basic.lean`: `quadraticChar` 120, `_isQuadratic` 199, `_ne_one` 207.
- `LegendreSymbol/ZModChar.lean`: `χ₄` 42, `χ₈` 118, `χ₈'` 157.
- `LegendreSymbol/JacobiSymbol.lean`: line 115.
- `DirichletCharacter/Basic.lean`: `changeLevel_injective` 79, `factorsThrough_iff_ker_unitsMap` 149, `conductor_changeLevel` 363.
- `MulChar/Basic.lean`: `map_nonunit` 130, `ringHomComp` 455.
- `FundamentalDiscriminant.lean`: `isFundamentalDiscr_iff_squarefree` 60. It matches Montgomery–Vaughan's conditions (a)/(b), `1` included.
- `QuadraticAlgebra/Basic.lean`: 517.

*Tau Ceti.*

- `Data/ZMod/ExactDivisor.lean`: `unitsEquivProd` 104 and `eq_mul_comp_unitsMap` 124. Its first factor is `a ↦ χ(x)` with `x ≡ a`, `x ≡ 1`, which is §1.3's local factor.
- `Dyadic/Quadratic.lean` 77 and 83, and `Dyadic/Basic.lean` 68.
- `DirichletCharacter/Quadratic.lean` 28 and 55.
- `PrimeValues.lean` 86, 94 and 115.
- `Conductor.lean`: `conductor_prod_of_pairwise_coprime` 76, which needs pairwise coprime conductors at one level, as §1.3 uses it.
- No odd-part-squarefree theorem exists in Tau Ceti's DirichletCharacter folder, so ClassicalArithmeticCompletion §1.21 is the right owner.

**Cross-roadmap citations resolved.**

- ClassicalArithmeticCompletion, on main (`b67091a`): §1.2 at line 389, §1.4 at 436, §1.5 at 459, §1.9 at 566, §1.20 at 968, §1.21 at 991 (any commutative ring, nonzero level) and §1.32 at 1296. Each states what Scope line 11 attributes to it.
- AnalyticNumberTheoryPartI, at `979e68c`: §0.34a at README line 870 (Suggested.lean lines 69 and 80), and §0.34c facts 2 and 3 at lines 879–880. Its consumer line 3399 cites "QuadraticCharactersAndReduction … §1.4", which exists.
- No roadmap on main cites this one, as line 297 says. No open pull request changes this roadmap.

**Sources (seeded sample, where the change touches it).**

- [mv-mnt1-ch9]:
  - Theorem 9.2 and Lemma 9.3: line 57 and line 62, p. 283.
  - Odd prime powers, for §1.1: lines 664–674, pp. 295–296.
  - `2^m`, for §1.2: lines 675–685, p. 296. "Real iff `2^(m−3) ∣ k`" gives four real characters for `m ≥ 3`.
  - Quadratic discriminants: lines 691–694, p. 296.
  - Theorem 9.13: line 742, p. 297.
- [milne-ant]:
  - Theorem 3.41 at line 2772, with its proof at lines 2783–2786 on p. 63. The tensoring step `A[X]/(f) ⊗ A/p ≅ k[X]/(f̄)` holds for any monic `f`, as §2.1 uses it.
  - Example 7.54 at line 5671, p. 129, for §3.2.
- §§2.2, 3.1 and 4.1 are stated as elementary consequences.

**Remarks on untouched text (no change requested).**

- Contract line 33 still lists `ZMod.isCyclic_units_of_prime_pow` and `ZMod.isCyclic_units_two_pow_iff`, which no route uses after the reroute.
- The pull-request description still says the roadmap supplies ANT I §0.34a, the reverse of the README.
- The board manifest's milne-ant locator lacks Example 7.54, and its `cited_for` lacks §§2.1 and 3.2. That is the worker's file, not this folder's.

**Adversarial table.** Rows for unchanged statements carry over from the previous report's table (`reductionQuotientHom`, `reduction_kernel`, `bijective_reductionQuotientHom`, `card_reduction_quotient`, §2.2 interval, §3.1, `pow_card_eq_star`, `pow_card_eq_self_of_square`, §3.2 repeated root, `frobenius_congruence`, §3.3 coordinates, `norm_embedding_le`, §4.1 `σ±` laws, Conventions): true, no change. New and changed rows:

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `odd_prime_power_classification` | `p=3,k=0,1,2`; `p=5,k=2` | `k=0`: level 1 has one character, and `3∣1` is false, so RHS `{1}`. `k=1`: 2 = 2. `k=2`: 6 characters of orders 1,2,3,3,6,6, of which 2 are quadratic; `L₃(2)=−1` (decide) separates the lift from 1. Level 25: `legendreSym 5 2=−1` | true | none |
| same, at `p=2` (control) | level 4 | `quadraticChar (ZMod 2)` takes 1 at 1 and 0 at 0 (decide), so RHS `{1}`, while `χ₄` is quadratic | false without `hp2` | `hp2` needed (Check line 84 agrees) |
| `two_power_classification` | `k=0,…,4` | counts 1, 1, 2, 4, 4. At 3, 5, 7: `χ₄` −1,1,−1; `χ₈` −1,−1,1; `χ₈'` 1,−1,−1 (decide), pairwise distinct. Level 16: 8 characters, 4 of them 2-torsion; `5↦i` gives `i∉{0,±1}` | true | none |
| §1.2 route, `j=3` | `(ℤ/8)ˣ→(ℤ/4)ˣ` | kernel `{1,5}` (`5↦1`, decide). `χ(5)=1` for 1 and for the `χ₄` lift; `χ₈(5)=χ₈'(5)=−1` | true | none |
| §1.3 local factors | level 12; level 6; level 45 | `χ₄·L₃` at 5, 7, 11 gives −1,−1,1, equal to `jacobiSym 3 ·` (decide); `χ(−1)=1`, so `D=12`. Level 6: 1 = 1·1. Level 45: conductor 15 | true | none |
| `exists_unique_fundamental_discriminant` (new route) | `q=12`; `q=1`; `q=8` | `fundamentalDiscriminant 3=12`, `(−1)↦−4`, `2↦8`, `(−3)↦−3` (decide). `−12` and `−1` are not fundamental (decide +kernel). ANT I's D-form gives `D=12`, `8`, `−8` directly | true | R01 |
| §2.2 bullet with `m>0` | `m=0,1,2` | `m=0` is excluded (`1≤0` false); `1≤1`; `4≤4` | true | none |
| §2.3 via Mathlib names | `d=5`; `m=0,1,2,3` | `(ι ω).im=2`: regular in ℤ; a unit mod 3 (2·2=1); mod 1, unit; mod 0, not a unit; mod 2, zero and not regular | true, "odd `m`" exact | none |
| §4.1 norm comparison | `r=−1,2,0` | `u²+v²=norm`; at `r=2`, `ω` gives `2≠−2`; `r=0` gives equality, but it is outside "nonsquare `r`" | true as scoped | none |
| §3.2 route | `F₇,r=3`; `F₃,r=0` | `ω⁷=ω·3³=−ω`; `(1+ω)³=1=re` | true | none |

## Not verifiable

- none. Montgomery–Vaughan, Milne and Conrad were read from the legal copies in the sources cache, and AnalyticNumberTheoryPartI at its open head through `roadmaps show`.

## Source issues

- none
