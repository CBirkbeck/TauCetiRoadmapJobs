# Review of ExplicitCharacterSumsAndSieves (pull request #1948 at 0c4bb76)

**Verdict:** needs changes

This is a full review of the head `0c4bb76`. The folder changed by 600 lines since `7dbb08f`: the README
went from 1903 to 1789 lines and `Suggested.lean` gained 35 lines. The pull request changes nothing
outside `TauCetiRoadmap/ExplicitCharacterSumsAndSieves/`. The gate fails on two `statement-hygiene`
hits. Both come from the one new object, which already has an owner elsewhere (R01).

## Previous findings

The previous review, at `7dbb08f`, had no findings. The two repairs it confirmed are still in place
at this head:
- the odd main part with `χ⁻¹(m)`, at README lines 884–885;
- the integer cut `T = ⌊√y⌋` in the squarefree count, at README lines 1324–1328.

The 600 changed lines touch neither of them.

## R01 (P2) — §0.6a re-plans the quadratic-character point count of EllipticLegendreCharacterInterfaces §5.1

**Location.**
- `TauCetiRoadmap/ExplicitCharacterSumsAndSieves/README.md` lines 547–578: "Prove
  `pointCount_eq_card_add_sum_quadraticChar` and `frobeniusTrace_eq_neg_sum_quadraticChar`:
  `#W(F) = q + 1 + Σ_{x ∈ F} η(f(x))`, `a_q(W) = … = −Σ_{x ∈ F} η(f(x))`".
- Scope, lines 47–48, which claims ownership.
- `TauCetiRoadmap/ExplicitCharacterSumsAndSieves/Suggested.lean` line 4 (the new
  `import TauCeti.AlgebraicGeometry.EllipticCurve.PointCount`) and lines 92–111.

**Claim.**
- This head drops the citation of EllipticLegendreCharacterInterfaces §5.1 and plans the same
  identities here as §0.6a. It also states them as headline theorems in `Suggested.lean`.
- They are not headlines:
  - the README's own list of end theorems (lines 24–36) does not contain them;
  - `frobeniusTrace_eq_neg_sum_quadraticChar` is the first theorem rewritten with Tau Ceti's
    `WeierstrassCurve.frobeniusTrace_def`.
- §4.1 does not need them. The squarefree cubic `h` that §4.1 reaches can be bounded by Weil's
  bound of CharacterSumsOverFiniteFields §4.7 with `m = 3`, which already gives `2√p`. §4.7 is
  already a supplier.
- The new reference `silverman2009` is not recorded in the package's `sources.toml`.

**Witness.**
- EllipticLegendreCharacterInterfaces README line 594, at its head, proves
  `(W.pointCount:ℤ) = q+1+Σ_x quadraticChar(F)(f(x))` and `W.frobeniusTrace = −Σ…`, singular
  equations included.
- It is at merge-order line 96; this roadmap is at 272.
- CharacterSumsOverFiniteFields README lines 516–519 consume it from there.

**Repair.**
1. Delete §0.6a, the new sentence of Layer 0's Examples, the two theorems, the `TauCeti` import
   line and the `silverman2009` reference.
2. Delete the supplier bullets used only by §0.6a:
   - Mathlib `quadraticChar_card_sqrts` and `WeierstrassCurve.IsCharNeTwoNF`;
   - the Tau Ceti `pointCount`/`frobeniusTrace` bullet.
3. Restore the Summary, Scope and "How to read the build" sentences.
4. In §4.1's order-2 case, bound `Σ_u χ(h(u))` for `h(u) = ∏_{j ∈ {b,c,d}} (1 + (j − a)u)`
   (squarefree, three distinct roots, not `c·g²`) by CharacterSumsOverFiniteFields §4.7 with
   `m = 3`.
5. Drop `WeierstrassCurve.frobeniusTrace_sq_le_four_mul_card` and §0.6a from §4.1's *Needs:* and
   from Layer 4's Dependencies.

Citing EllipticLegendreCharacterInterfaces §5.1 again, with Tau Ceti's Hasse bound, is an
acceptable alternative.

I tested the §4.7 route on the README's own negative control:
- At `p = 19`, tuple `(1, 2, 4, 9)`: `Σ_x χ(f(x)) = −9` and `Σ_u χ(h(u)) = −8`. This gives
  `|−8| ≤ 2√19 = 8.718`, hence `|Σ_x| ≤ 9.718`.
- At `p = 53`, tuple `(1, 3, 4, 7)`: `−15` and `−14 ≤ 14.56`.

## R02 (P3) — gate `statement-hygiene`: `[Fintype F]` beside `[Field F]` (line 99)

**Location.** `TauCetiRoadmap/ExplicitCharacterSumsAndSieves/Suggested.lean` line 99:
`theorem pointCount_eq_card_add_sum_quadraticChar {F : Type*} [Field F] [Fintype F]`.

**Claim.** The push gate fails on this line.

**Witness.** The gate rerun at this head:
`statement-hygiene: line 99: P3 [Fintype F] beside [Field F] … repair: use [Finite F]; Nat.card F is the cardinality`.

**Repair.**
- Deleting the theorem under R01 removes the hit.
- If the theorem is kept, use `[Finite F]` and `Nat.card F`. That is the form of Tau Ceti
  `WeierstrassCurve.frobeniusTrace_def` (`TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean`,
  line 109).

## R03 (P3) — gate `statement-hygiene`: `[Fintype F]` beside `[Field F]` (line 108)

**Location.** `TauCetiRoadmap/ExplicitCharacterSumsAndSieves/Suggested.lean` line 108:
`theorem frobeniusTrace_eq_neg_sum_quadraticChar {F : Type*} [Field F] [Fintype F]`.

**Claim.** The push gate fails on this line.

**Witness.** The gate rerun at this head: `statement-hygiene: line 108: P3 [Fintype F] beside [Field F]`.

**Repair.** Same as R02: delete the theorem under R01, or use `[Finite F]` with `Nat.card F`.

## R04 (P3) — Layer 6's definitions lost all their Checks, and the layer lost its shape

**Location.** `TauCetiRoadmap/ExplicitCharacterSumsAndSieves/README.md` lines 1629–1691: "Each item
is a proposition declared in `Suggested.lean` and carried as an explicit hypothesis by every theorem
that uses it; this roadmap proves none of them."

**Claim.**
- Layer 6 lists ten `Prop` definitions as bullets, 6.1–6.10. Bullets 6.6 and 6.7 also define
  `trevinoTable5` and `trevinoTable7`. All of these are declared in `Suggested.lean`.
- The layer has:
  - no Check for any of these definitions;
  - no `### 6.n` subsections;
  - no `### Examples` and no `### Dependencies`.
- The house shape asks for at least three discriminating Checks per definition and for every
  layer to end with Examples and Dependencies.
- These Checks are the README's only evidence that each hypothesis is satisfiable. A false Layer 6
  proposition would make every headline that assumes it vacuous.
- The new `McGownSmallRange` never had a Check. The Checks of 6.1–6.7 were deleted, including the
  wrong-encoding control of 6.6 (prefactor `12^{1/4}` against `(1/2)^{1/4}`).

**Witness.** No `**Checks.**` block follows README line 1601. The diff since `7dbb08f` deletes 18
Check bullets from 6.1–6.7.

**Repair.**
1. Restore `### 6.1`–`### 6.10`, each with at least three Checks that state values and controls.
   They should not describe how a table is computed (Scope, lines 106–107). Values computed this
   round, usable as given:
   - **6.5:** `C₀(2) = 10.036550 < 10.0366` and `C₀(8) = 2.2720993 < 2.2721` (the tightest row);
     (A.1) at `r = 2` is `1093.18 ≥ 1056`.
   - **6.6:** `num/den = 2.738070` at `(e, r) = (7, 2)` (`A = 40.27`) and `1.256098` at `(20, 10)`.
   - **6.7:** `3.652847` at `(10, 2)` (`A = 140.97`).
   - **6.8:**
     - tightest case: `Σ_{a ≤ 23 prime}(π(a) − 1)/a = 2.97934 < 3 = π(23)/3`;
     - `π(4) = 2 ≥ 4/(1 + log 4) = 1.6762`;
     - `π(4) < 4/log 4 = 2.885`, so the form with `1 + log A` is needed.
   - **6.2:** `Y = 100`, `z = 7` gives `42.86 < 43.43`.
   - **6.10:** `S(5.99) = 2.75`. This is below `6`, so the range `6 ≤ z` matters.
2. Add `### Examples`, and `### Dependencies` naming the consumers: §§3.4, 3.5, 4.4, 4.5, 5.4, 5.6.

## R05 (P3) — §4.4: `mcgownConstant` has no Check on its values

**Location.** `TauCetiRoadmap/ExplicitCharacterSumsAndSieves/README.md` lines 1216–1220:
"`d = 4` is excluded … The prime-count lower bound is the one with `1 + log A` …".

**Claim.**
- `mcgownConstant` is defined at line 1203. Neither of §4.4's two remaining Checks tests it.
- The Checks `C₀(2) = 10.03655` and `C₀(3) = 4.95382`, and the (A.1) check, were deleted.

**Witness.** The diff since `7dbb08f` removes exactly those three bullets. Line 1218 tests (A.2)
and line 1219 tests `π`. Neither mentions `mcgownConstant`.

**Repair.** Add at least three Checks on `mcgownConstant`:
- `mcgownConstant 2 = 10.0366` is `C₀(2) = 252^{1/4}/(1 − 2/√11) = 10.036550` rounded up;
- `mcgownConstant 8 = 2.2721` against `C₀(8) = 2.2720993`, so rounding to `2.2720` would make
  `McGownTableCertificate` false;
- `mcgownConstant 1 = mcgownConstant 16 = 0`, outside the table, where no theorem is stated.

## Verified sound

**Gate, build and dependency check.**
- The gate, rerun at this head, gives `statement-hygiene=2 … FAIL`. Every other counter is `0`.
  These two hits are R02 and R03.
- The dependency check, as run: `depcheck: 240 roadmaps, 2435 edges, 0 problem(s)`. No `UPWARD`,
  `CYCLE` or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- `lake env lean …/Suggested.lean` exits `0` with 21 warnings, all `declaration uses sorry`, at
  lines 99, 108, 121, 140, 151, 166, 190, 201, 213, 223, 254, 292, 357, 369, 435, 449, 465, 481,
  508, 527 and 550.
- `PointCount.olean` exists at the pinned Tau Ceti.
- The file has no `set_option`, no `lemma` and no sorry'd data. Every `def` has a real body.

**Signatures.**
- I elaborated `#check @…` for all 44 declarations in a scratch copy, with no error.
- Each type matches its README statement, including:
  - `burgess_mcgown_parametric` and `burgess_mcgown_table`, which now take
    `RosserSchoenfeldFiniteRangeInput → McGownSmallRange → …` as README §4.4 says;
  - `McGownSmallRange : Prop`, whose body matches 6.8.
- The file has no `variable` block, so no binder is lost.

**Previous findings, seeded sample and changed text.** The seeded sample covers 15 targets. I read
each locator in the cached text and checked the theorem number, hypotheses and statement.

| Target | Source and locator | What I checked |
|---|---|---|
| 0.5 | pomerance2011 lines 89–95; tmeemt-art15 lines 126–129; frolenkov2011 lines 22–27, (1) | `S(χ) = 2S₀(χ)` for even `χ` |
| 2.3 | zhao2024 Lemma 2.6, lines 284–319; Theorem 2.7, lines 324–330; proof lines 337–371; tmeemt-art11 lines 130–137 | `(3c₂)^{1/3}Nλ₂^{1/3}`, `(12c₂)^{1/2}Nδ^{1/2}` and `Nλ₂ ≥ c₂⁻¹` |
| 3.2 | pomerance2011 (4)–(5), lines 183–203 | |
| 3.3 | pomerance2011 Lemma 2 (lines 112–134), Lemma 3 (147–161), Lemma 4 (172–204), tail bound at line 180 | |
| 3.4 | pomerance2011 Theorem 1 (lines 78–86); even case 263–361; `n = ⌊2√q log q⌋` at line 351; `q ≥ 21` at 357; Bober–Goldmakher 357–360; odd case 362–438; `n` at 424; `q ≥ 45` at 432; small cases 432–437 | |
| 3.5 | lapkova2018 Lemma 3A (line 245, constants at 281); `L` with `9.15` at lines 309 and 327; `q ≤ 25` with Bober–Goldmakher at 372–381; tmeemt-art15 lines 114–118; hunter2016 Theorem 1.3, lines 680–684; kerrmcgowntrudgian2020 Lemma 3, lines 117–122 | The printed `0.8204/q₀^{1/2}` is at line 122 |
| 3.6 | tmeemt-art15 lines 106–109; hunter2016 Theorem 1.2 (`q > 100`), lines 646–664 | |
| 4.1 | trevino2015 Theorem A, lines 57–63 (`r ≤ 9B`); booker2006 (28)–(30), lines 494–510; mcgowntrudgian2020 Proposition 1, (3), lines 120–126; the claim at line 180 | |
| 4.2 | trevino2015 Lemma 1 (210–219), Lemma 5 (419–423), proof 462–622, Lemma 6 (1088–1093); mcgown2012 Lemmas A.6–A.7, lines 1119–1142 | |
| 4.4 / 6.8 | mcgown2012 Lemma A.8, lines 1192–1204 (`X ≤ 100` by computation, `(π(n) − 1)/n ≤ 1/3` for `n ≥ 100`); `π(A) ≥ A/(1 + log A)` for integers `A ≥ 3` at lines 1376–1377; Theorem A.1 from A.9 at line 1433 | |
| 5.1 | buthe2014 (4.3), lines 340–345; Lemma 4.4, lines 365–367; (4.7) and `h(1) = 5/2`, lines 440–447; line 448; `H₁ ≤ 1.53z`, lines 617–622; fan2022 lines 185–187 | |
| 5.2 | tmeemt-art14 lines 159–170 | Form, `s ≥ 2B` and `z ≥ 2` |
| 5.3 | buthe2014 Lemma 3.1 (69–73); Proposition 3.2 (139–158); van Lint–Richert values (226–236); Proposition 3.3 (237–284) | |
| 5.6 | fan2022 Theorem (4)–(6), lines 157–163; cases `z < 3`, lines 164–174 (as the new route says); tmeemt-art14 lines 181–191 | |
| Layer 6 | buthe2014 lines 633–649 and 650–655; trevino2015 Table 5 (lines 1013–1024) and Table 7 (1311–1322) | |

Targets 0.4 and 0.6 carry no source locator. I checked their library inputs instead (below).

**Library declarations opened at the pins.**

Mathlib:
- `quadraticChar` (`Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean` lines 120, 207
  and 214), with `quadraticChar_ne_one` and `quadraticChar_card_sqrts`:
  `#{x | x² = a} = η(a) + 1` under `ringChar F ≠ 2`.
- `WeierstrassCurve.IsCharNeTwoNF` (`Mathlib/AlgebraicGeometry/EllipticCurve/NormalForms.lean`
  line 107: `a₁ = 0`, `a₃ = 0`).
- `DirichletCharacter.conductor`, `IsPrimitive`, `primitiveCharacter`,
  `changeLevel_primitiveCharacter`, `primitiveCharacter_isPrimitive`,
  `eq_one_iff_conductor_eq_one`, `IsPrimitive.inv`, `Odd`, `Even`, `even_or_odd`, `Odd.eval_neg`
  and `Even.eval_neg` (`…/DirichletCharacter/Basic.lean` lines 245, 291, 306, 309, 313, 267, 413,
  537, 540, 542, 567 and 572).
- `gaussSum_mulShift_of_isPrimitive` (`…/DirichletCharacter/GaussSum.lean` line 59).
- `norm_le_one` (`…/Bounds.lean` line 44).
- `ZMod.stdAddChar` and `isPrimitive_stdAddChar` (`CircleAddChar.lean` lines 83 and 95).

Tau Ceti:
- `WeierstrassCurve.pointCount`, `pointCount_def`, `frobeniusTrace` (which requires `[Finite F]`),
  `frobeniusTrace_def` and `frobeniusTrace_eq_card_point`
  (`TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean` lines 73, 80, 101, 109 and 115).
- `frobeniusTrace_sq_le_four_mul_card` and `hasse_bound` (`…/HasseBound.lean` lines 44 and 57,
  under `[Finite F] [W.IsElliptic]`).
- `sum_range_level_eq_zero`, `sum_range_eq_sum_range_mod` and `norm_sum_Icc_le_level`
  (`…/PartialSum.lean` lines 30, 37 and 49).
- `gaussSum_mul_gaussSum_inv_eq_card_of_isPrimitive` and `IsPrimitive.norm_gaussSum` (lines 43
  and 82).
- `IsPrimitive.eq_one_iff` (`Conductor.lean` line 25).
- `even_of_le_two` (`Even.lean` line 77).

**Cross-roadmap citations resolved at the heads.**
- EllipticLegendreCharacterInterfaces §5.1 (line 592; the R01 witness).
- CharacterSumsOverFiniteFields §4.7 (line 1436; `weil_mulChar_sum_bound` at `Suggested.lean`
  line 320, with `m` the number of distinct roots over `AlgebraicClosure F`) and its §7.1.
- SieveMethodsAndPrimePatterns §§1.1, 1.3, 1.6, 2.9 and 5.2 (lines 1037, 1218, 1508, 2362 and
  3297).
- AnalyticNumberTheoryPartI:
  - §0.5, whose `RosserSchoenfeldFiniteRangeInput` is "every real `59 ≤ x < exp(10000)`", the same
    content as 6.9;
  - §§0.8, 0.19, 0.20, 0.34 and 1.5a.
- ExplicitZetaBounds §§4.1–4.5 and §6.5. I read the §4.2 text: the finite inequality and the
  normalised form are as contracted, and so is §6.5 with `c = 3/2`.
- ExplicitPrimeCounting §0.1. Its `MVDiagonalFiniteRange` is "`6 ≤ u < 10⁹`, `S(u) ≥ log u + 1.07`",
  the same content as 6.10. `BrunTitchmarshFiniteRange` and `brun_titchmarsh` are as contracted.
- ProbabilisticAndMetricNumberTheory §2.7 is cited only under "Not owned here". It is at
  merge-order line 275, but it is not a supplier, and the dependency check confirms this.
- `scratch/overlaps.md` reports no other pull request changing this roadmap and no dropped id.

**Downstream citations.**
- ExplicitNumberFields cites §§3.5, 4.1 and 6.1, and `LapkovaSmallModuliVerified` with the same
  content (its README lines 376–379 and 2172–2179). The id 6.1 still exists, as bullet 6.1.
- No roadmap cites `burgess_mcgown_*`, so the new `McGownSmallRange` hypothesis breaks no
  consumer's citation.

**Ownership.** I searched by object with `roadmaps grep`, for `quadraticChar_card_sqrts` and the
point count, and for explicit Pólya–Vinogradov inequalities:
- The only second owner is the one in R01.
- AnalyticNumberTheoryPartI, ArithmeticStatisticsPartV and ExplicitZetaBounds use or defer
  Pólya–Vinogradov. They do not own it.

**Changed text that is correct.**
- §4.4's derivation of Lemma A.8 for every `X ≥ 2` from `McGownSmallRange` and
  `π(n) − 1 ≤ n/3` (`n ≥ 100`) is valid.
- §5.1's diagonal bound from `3`, with exact values, is correct.
- §5.6's new `z < 3` cases are correct.
- §4.1's substitution `x = −a + 1/u` turns the quartic sum into `Σ_u χ(h(u)) − 1`, because
  `χ(u⁻⁴) = 1` and `h(0) = 1`. I recomputed this at `p = 19` and `p = 53`.
- `second_derivative_test_points` carries `δ < 1/2`, which nothing needs: for `δ ≥ 1/2` the right
  side exceeds `N + 1`. It is harmless, and I request no change.

**Adversarial table.** All values were computed this round with scratch scripts; I carry nothing
forward.

| # | Statement | Instances | Values (left / right) | Result |
|---|---|---|---|---|
| 1 | §0.6a point count (R01) | `𝔽₅`, `y² = x³ + x`; cusp `y² = x³`; `𝔽₂`, `y² = x³ + 1`; every `(a₂,a₄,a₆)` over `𝔽_p`, `p = 3…13`, and all 729 over `𝔽₉` | `4 / 6 − 2 = 4`, trace `2`; `6 / 6`; `3 / 4` (needs odd char); `0` mismatches | true; owned elsewhere (R01) |
| 2 | §4.1 order-2 refinement, and the R01 repair | `W₂(h)` for all `p < 80`, `h ≤ p`; tuples `p = 19 (1,2,4,9)`, `p = 53 (1,3,4,7)` | max `W₂/bound = 0.9873` (`p = 79`, `h = 1`: `78 / 79`); `Σ_x = −9`, cubic `−8 ≤ 8.718`; `−15`, `−14 ≤ 14.56` | true; single tuple exceeds `2√p` (`9 > 8.72`) |
| 3 | `burgess_moment_bound` | every `χ ≠ 1` mod `p ∈ {3,5,7,11,13}`, `r ≤ 3`, 12 values of `B`; `W₂(2)` mod `7` | max ratio `0.7226` (`p = 13, r = 1, B = 12`: `12.0 / 16.61`); quadratic `34 / 98.33`; cubic `22 / 121.37` | true |
| 4 | `McGownSmallRange` (6.8, new) | `2 ≤ X ≤ 100`; `3 ≤ A ≤ 58`; extension to `20000` | min margin `0.02066` at `X = 23` (`2.97934 < 3`); `0.3238` at `A = 4` (`2 ≥ 1.6762`); A.8 holds to `20000`; `π(n) − 1 ≤ n/3` on `[100, 20000]`; `4/log 4 = 2.885 > 2` | true |
| 5 | `McGownTableCertificate`, `mcgownConstant` (R05) | `r = 2…15` | `C₀(2) = 10.036550 < 10.0366`; `C₀(3) = 4.953819 < 4.9539`; `C₀(8) = 2.2720993 < 2.2721` (margin `7.5·10⁻⁷`); (A.1) `1093.18 ≥ 1056`, min ratio `1.035` | true |
| 6 | `TrevinoTable1Certificate` (Lean encoding) | 27 rows, `p = 10^{e + j/2}`, `j ≤ 400` | `num/den`: `2.738070` (7,2), `1.349428` (10,10), `1.256098` (20,10); all four conjuncts hold; max `(num/den)/c = 0.9999953` at (7,10,`p₀`) | true |
| 7 | `TrevinoTable3Certificate` (Lean encoding) | same grid | `3.652847` (10,2), `1.579302` (10,10), `1.521507` (20,10); all five conjuncts hold; max ratio `0.9999955` at (20,7,`p₀`) | true |
| 8 | `polya_vinogradov_classical` | all 661 primitive `χ`, `2 ≤ q ≤ 60`; `q = 3, 5` | max `M_χ/bound = 0.7458`; `q^{−1/2}Σcsc = 1.3333`, `2.4621`; closed form `1.5785`, `2.6818` | true |
| 9 | `polya_vinogradov_lapkova`, 6.1 | same 661 | max ratio `0.737` at `q = 47`, odd (`8 / 10.854`); no violation for `q ≤ 25` | true |
| 10 | `polya_vinogradov_pomerance` | same 661 | no violation | true |
| 11 | `polya_vinogradov_frolenkov_soundararajan` | induced from mod `3` to `2310`, from `χ₄` to `1000` | `5 / 196.75`; `2 / 123.50` | true |
| 12 | §0.4 / §0.5 / §0.6 | quadratic mod `5`; `χ₄`; principal mod `3`; principal mod `6`; mod `12` from `χ₄` | `M = 2`, initial max `1`; `M = 1 = ` initial max; `S(0,6) = 4 > M = 2`; `2 = 6 − 3 − 2 + 1`; `2 = 2`, without `χ*(d)`: `0` | sound |
| 13 | `iterated_vanDerCorput` | `d = 1`, `H = Y = 2`, `f ≡ 0`; 3000 random `d ≤ 2` polynomial phases | `1 / 3.414`; max ratio `0.5485` | true |
| 14 | §0.3 real-part form | 20000 random sequences | max ratio `0.607` | true |
| 15 | `first_derivative_test_points` | `x/10`, `N = 20`, `δ = 0.05`; 4000 random | `3 / 10`; max ratio `0.546` | true |
| 16 | `second_derivative_test_points` | `x²/100`, `N = 50`, `δ = 0.01`; random | `6 / 227.37`; max ratio `0.060` | true |
| 17 | §3.3 Lemmas 2–3 | `C₃(π)`; Lemma 3 at `n = 1`, `x = π/2` | `−0.8333 > −1.3598`; `1 < 2.7186` | true |
| 18 | §4.2 prime multipliers | `{2,3,5}`, `N = 100`, `p = 1009` | `V₂ = 446 ≤ 452.67` | true |
| 19 | `greaves_density_sum` (Lean form, `p < ⌈z⌉`) | `κ ≡ 1, z = 3, s = 2`; 3000 random `κ`, `z ≤ 40` | `0.749 ≤ 2`; max rhs/lhs `0.9854` | true |
| 20 | `buthe_weighted_prime_sum` corollary (`f ≡ 1`) | `x < 300`, 9 lengths | max ratio `0.6438` (`[2,7]`: `4 / 6.21`) | true |
| 21 | `ramare_viswanadham_prime_powers` | `d ≤ 6`, sample `A ≥ B > d` | max ratio `0.5175` (`d = 1`, `A = B = 100`: `22.48 / 43.43`) | true |
| 22 | `fan_rough_count`, 6.4 | integer `x ∈ [2, 4000]`, every cell end in `z`; `x = 7` control | no violation, min margin of (5) `0.426` at `x = 8`, `z → 5⁻`; `x = 7`: rhs `3.00001` (`z = 4.9909`), `2.99999` (`4.991`), `2.99815` (`4.99999`) against `Φ = 3` | true with `x ≥ 8` |
| 23 | §5.1 diagonal bound from `3` (changed) | `S` on `[3,5)`, `[5,6)`, at `6` | `2.5 > 2.49944`; `2.75 > 2.68176`; `3.25` | true |

## Not verifiable

- **silverman2009 §V.1.** The book is not in the manifest, so I could not read it. The identity it
  is cited for is verified by computation (row 1). The citation goes with R01.
- **Overbars in pomerance2011.** They are lost in the extraction at lines 236 and 384. The
  `χ⁻¹(m)` of §3.4 rests on §3.1, as the previous review showed.
- **Uncertified or waived citations.** These were cited by locator, without a text:
  - uncertified: greaves2001 Theorem 1, p. 52; montgomeryvaughan2007 §9.4; montgomeryvaughan1973;
    frolenkovsoundararajan2013; bordelles2012; filaseta1990; trevino2015kth;
    bachmanrachakonda2001; siebert1976; rieselvaughan1983;
  - waived: vanlintrichert1965.
- **Bober–Goldmakher's data** is not in the manifest.
- **Treviño's published tables.** The `c₂` column of tmeemt-art15 (lines 236–282, headed
  `p₀ = 10⁷`) differs from the arXiv Table 3. I could not check the published version.

## Source issues

- **Error** in fan2022 at the Theorem, inequality (5), p. 4: the source states (5) for every `x`
  with `z ≥ max(3, √x)`; at `x = 7`, `4.991 < z < 5` the count `3` exceeds the right side; it
  should require `x ≥ 8`; affects a stated result.
- **Error** in mcgowntrudgian2020 at the proof of Proposition 1, p. 5 (line 180): the source says
  the per-tuple Weil constant improves to `2(r − 1)` for quadratic `χ`; at `p = 19` a single tuple
  gives `9 > 2√19`; it should be `2(r − 1)√p + 1` per tuple; affects the proof.
- **Error** in kerrmcgowntrudgian2020 at Lemma 3, p. 3 (line 122): the source prints the middle
  term of `A(q₀)` as `0.8204/√q₀`; derived from Lapkova's Lemma 3A it should be `0.8204/log q₀`;
  affects a stated result.
- **Misprint** in buthe2014 at the proof of Lemma 4.4, p. 6 (line 419): the source writes
  "computar calculation"; it should be "computer calculation"; affects nothing.
