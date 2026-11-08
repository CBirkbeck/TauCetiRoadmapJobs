# FIX-DESIGN-ExplicitZetaBounds~2

Review settled: `REV-DESIGN-ExplicitZetaBounds` (five findings, F01–F05). Files edited:
`packages/ExplicitZetaBounds/design/README.md`, `packages/ExplicitZetaBounds/design/plan.json`,
`packages/ExplicitZetaBounds/sources.toml`. `plan.json` now has 71 targets, 142 tests, 0 gaps.

## F01 (P1) — applied differently

Changed: gap `explicit-vinogradov-mean-value` deleted (`plan.json` `gaps: []`; README "Declared gap" section and its "Not owned here" bullet removed). New target **4.9a The explicit Vinogradov mean value theorem**: Ford's Theorems 3 (both clauses), 4 and 2, and Bellotti's Theorems 1.4–1.5, with exact hypotheses and locators. 4.10 needs 4.9a; 7.4, 7.6, 7.10, 8.5 drop the gap.

The finding is right. The gap had `supplier: none`, and its hypotheses (`k ≥ 2`, `s ≥ 1`) were not Ford's: `ford2002vinogradov` line 220 has `k ≥ 1000`, `2k² ≤ s ≤ (k²/2)(1/2 + log(3k/8))`, and line 225 has the clause for `k ≥ 129`.

Why "differently":
- **Theorem 3 alone does not carry 4.10.** Ford's Theorem 1 is proved from Theorem 2, the bound `S(N, t) ≤ 9.463 N^{1−1/(133.66λ²)}` (line 129). Theorem 2 in turn uses:
  - for `λ ≥ 87`: the second clause of Theorem 3 together with Theorem 4, the incomplete-system bound (lines 293–296 and 2290–2300);
  - for `λ ≤ 87`: §6, which iterates mean-value bounds for small `k` (Lemma 6.8, Table 6.1, line 2950).

  So 4.9a states Theorems 2 and 4 as well as Theorem 3. The route of 4.10 now inserts 4.9a's bound for `S(N, t)` into Ford's Lemmas 7.1–7.3; Lemma 7.3's hypothesis is at line 3158. Bellotti's constants come from Theorem 1.5 (`bellotti2024` lines 228–230), which uses Ford's Theorem 4 (line 1023).
- **4.9a is named only in the Needs of 4.10.** 7.4, 7.6, 7.10 and 8.5 reach the mean value theorem only through 4.10, which they already list:
  - Khale uses only the Hurwitz Richert bound (`khale2024` lines 396–400);
  - Yang uses the Ford–Richert bound (`yang2024` lines 1359–1362);
  - Bellotti's density paper uses only the zero-free regions (`bellotti2025density` lines 346–365).

Ownership: nobody else owns it, so this roadmap does.
- `roadmaps grep` for Vinogradov's mean value theorem, Vinogradov's integral, `J_{s,k}`, efficient congruencing and decoupling, over main (`d3838a8`) and 476 open heads, finds only ExplicitCharacterSumsAndSieves, and its README line 91 places the theorem outside its scope.
- There is no `Vinogradov` file in Mathlib or Tau Ceti at the pins.
- The Scope paragraph now says so.

4.9a has five Checks, all computed:
- `J_{2,1}(2) = 6` (brute force and Parseval; with exponent `s` instead of `2s` the integral is `2`);
- `J_{2,2}(3) = 15` (only diagonal solutions);
- `Δ_s = 11 343 → 1001.7` across the range at `k = 1000`;
- the trivial-bound thresholds `log N > 300.39λ²` (Ford) and `289.09λ²` (Bellotti);
- `S(1, t) = 1`.

Summary, Scope, How to read the build, the Layer 4/7/8 Dependencies and `plan.json` (summary, 4.10 statement and locator) are updated to match.

## F02 (P1) — applied

Changed: 2.6 bullet `(−1)^{N} γ_{2N−1} ≥ 0, (−1)^{N+1} γ_{2N} ≥ 0` → `(−1)^{N+1} γ_{2N−1} ≥ 0 and (−1)^{N+1} γ_{2N} ≥ 0` (signs `+, +, −, −, …`), with the convention note: Nemes' `γ_n` is `(−1)^n` times ours. Added a Check on `γ₅`, `γ₆`, `γ₇` and on the convention clash. `plan.json` 2.6: `signs` API, a new test, locator line 38.

Evidence:
- `nemes2015` line 38 prints `γ₁ = −1/12` and `γ₃ = 139/51840`; line 87 is (1.4) in that convention.
- Exact rational computation of `exp(Σ B_{2j} w^{2j−1}/(2j(2j−1)))` gives `γ₁..γ₁₀ = 1/12, 1/288, −139/51840, −571/2488320, 163879/209018880, 5246819/75246796800, −534703531/902961561600, −4483131259/86684309913600, +, +`.
- The new form holds for `N = 1, …, 5`. The old form fails at `N = 1`: `−γ₁ = −1/12 < 0`.
- The absolute-value bounds and the "reciprocal" bullet are unaffected; the inverse series `Σ(−1)^k γ_k w^k` is Nemes' (1.2).

## F03 (P2) — applied

Changed:
- (a) 7.9 now defines *HasLandauSiegelGap* `c Q` for real `c` and `Q ∈ ℕ ∪ {∞}`, with the instances `(1/5, 10¹⁰)` (from 7.8) and `(3.0·10⁻³, ∞)` (Banks).
- (b) 0.2 gains the law for passing to imprimitive characters.
- (c) Downstream consumers names ExplicitPrimeCounting §§1.1, 1.2, 1.7 as citations of 0.2 and 7.9.

Evidence:
- ExplicitPrimeCounting (head read with `roadmaps show`) defines `RiemannHypothesisUpTo` (§1.1), `GRH(q, H)` over all characters modulo `q` (§1.2) and *RealZeroGap* `c Q` (§1.7).
- Its contract `gap:real-zero-gap` asks this roadmap for the capped predicate with exactly these two instances.
- ExplicitMultiplicativeFunctions takes `RH(H)` from ExplicitPrimeCounting §1.1, not from here.
- In `ORDER.txt`, ExplicitZetaBounds is line 269 and ExplicitPrimeCounting line 270, so this roadmap is the earlier owner.

The 0.2 law (two directions, `s ≠ 1`) rests on these pinned declarations: `DirichletCharacter.LFunction_changeLevel` (`DirichletContinuation.lean` line 149), `DirichletCharacter.primitiveCharacter` and `DirichletCharacter.changeLevel_primitiveCharacter` (`DirichletCharacter/Basic.lean` lines 306–310).

The adversarial pass on the old 7.9 found three defects, all repaired in the same edit:
- The zero-free law claimed `L(σ, χ) ≠ 0` on the closed interval `[1 − c/log q, 1]`. That is false at the endpoint (`≥ c` allows `β = 1 − c/log q`), and for large `c` it would reach `σ ≤ 0`. It is now an iff on `0 < σ < 1`, `σ > 1 − c/log q`.
- "`c ≥ 1/9.645908801` excludes McCurley's zero" fails at equality; it now reads `c > …`.
- The Check "fails for every `c` if `q = 1` were allowed" was vacuous: there is no primitive nonprincipal character of conductor 1 or 2. It is replaced by a discriminating Check (the modulus 6 against the conductor 3).

Not editable from this package: removing the duplicate definitions from ExplicitPrimeCounting §§1.1, 1.2 and 1.7 is that roadmap's revision. The supplier side it needs is now here.

## F04 (P3) — applied

Changed: Kadiri's criterion in 7.3 is now stated in the form the method proves. Hypothesis and conclusion are "every zero has `β ≤ 1 − 1/(R log|γ|)`", that is the region with `>`; the `≥` region holds for `R₀` strictly above the maximum. Instances: `5.573412` and `4.896` with `>`; the `≥` form at `5.573412` is derived from `5.558691`. Added a boundary Check at `3·10¹²`, and 7.4 in Needs.

Evidence:
- `mossinghofftrudgian2015` line 118 and `bellottitrudgianyang2026` line 67 are strict.
- The method proves `β₀ ≤ 1 − 1/(R₀ log γ₀)` (`mossinghofftrudgian2015` lines 157–163).

The repair goes beyond the suggested one. The old hypothesis demanded the `≥` region with constant `R`, yet the `5.558691` instance is fed the strict `5.573412` region; deriving that `≥` form from `5.558691` would be circular. The hypothesis is therefore weakened to the strict form.

Boundary values at `log|t| = 28.72963`: `0.9937548` (5.573412), `0.9937382` (5.558691), `0.9928907` (4.896). Kadiri's computed maximum `5.696924…` is below the printed `5.69693` (line 240).

Same pattern searched across Layer 7; every region below matches its source:
- `≥` in the source: `ford2002zerofree` Thms 3–5, `mty2024` 1.1/1.3, `bellotti2024` 1.2–1.3, `khale2024`, `kadiri2018`, TZ Lemma 2.3/Thm 2.6, LZZ Thm 1.1;
- `>` in the source, `>` in the README: `kadiri2002thesis` (111), LZZ Cor. 1.2, `yang2024` Cor. 1.2;
- Bordignon: stated with `≤`, as in the README.

## F05 (P3) — applied

Changed:
- 6.4: Lemma 6.2 → Lemma 6.5 (`ramare2016density` line 828), with the upper-bound clause; References now cite Lemma 5.4 and Lemma 6.5.
- 6.1: kernel bound → CHJ Lemma 2.2, line 163, rescaled to height `T`.
- 4.7: certificate `2Σ ≤ 1.4988`.
- 1.4: `θ₁₀₀ = 0.98632`.
- `IsPrimitive.completedLFunction_one_sub` in four places.
- 7.3 *Needs* gains 7.4.

Evidence:
- **6.4:** line 828 states only `∫₀^T |Σ u_n n^{it}|² ≤ Σ|u_n|²(2πc₀(n+1) + T)`. The two-sided form follows because the proof bounds the off-diagonal Hilbert forms in absolute value; for real `a_n` the second form is antisymmetric.
- **6.1:**
  - The rescaling `z = Tw` turns line 163 into `min(y^κ/(πT|log y|), |v − y^κπ⁻¹arctan(T/κ)| + T|log y|y^κ/π)`, with equality at `y = 1`.
  - The constant `7/2` is not at line 163, nor derivable from it: the second branch only gives `(π+1)y^κ/π` near `y = 1⁺`.
  - Lines 683–684 are a zero sum, and Lemma 7.1 (line 943) is a zero-density lemma.
  - `plan.json` 6.1 locator updated.
- **4.7:** `Σ_{j≥0}(−1)^j log ζ(j+3/2) = 0.749397`, so `2Σ = 1.498793 ≤ 1.4988`. The source's display is at `thornerzaman2024` lines 366–379. `plan.json` 4.7c gains the statement and a test.
- **1.4:** 80-digit `Decimal` computation from `100!`: `θ₁₀₀ = 0.9863210552`. Double precision gives `0.98625`, which is cancellation error. Also `θ₁ = 0.3359287`, `θ₂ = 0.5117623`, `θ₁₀ = 0.8700064`.
- **Mathlib name:** `theorem completedLFunction_one_sub` is at `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean` line 291 inside `namespace IsPrimitive` (line 288). Fixed in Conventions, the Mathlib contract, 4.7 Needs and 9.1 Needs, and in `plan.json` 4.7c and 9.1.

## Checks run

Dependency gate (`tauceti-roadmap gate --candidate …/design/README.md --only ExplicitZetaBounds --order …/ORDER.txt --content …`), after the last edit:

```
depcheck: 244 roadmaps, 2461 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

`roadmaps resolve packages/ExplicitZetaBounds/design/README.md` (main `d3838a8`, 476 open heads): no cross-roadmap citations found nowhere and no Lean names found nowhere. The three earlier leads were supplier names; they are no longer reported.

`plan.json` parses and keeps the original formatting (`indent=1`, no trailing newline). `sources.toml` parses (`tomllib`, 89 sources).

There is no `Suggested.lean` at the design stage, so the `#check @name` comparison and elaboration were not applicable and were not run.

Every Mathlib name added was opened at the pin: `DirichletCharacter.changeLevel` (`Basic.lean` 65), `LFunction_changeLevel`, `primitiveCharacter`, `changeLevel_primitiveCharacter`, `Real.fourierChar` (`Analysis/Complex/Circle.lean` 221), `Nat.primeFactors` (`Data/Nat/PrimeFin.lean` 38) and `MeasureTheory.volume` (`MeasureSpaceDef.lean` 361).

No gate failures were listed for this round.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 4.9a `J_{s,k}` definition | `J_{2,1}(2)`, `J_{1,1}(5)`, `J_{2,2}(3)`, `J_{3,2}(3)` | brute force `6, 5, 15, 93`; `∫|e(α)+e(2α)|⁴ = 6.000`, `∫|·|² = 2.000` | count = integral with `2s`; `s ≤ k` diagonal `2P² − P = 15` | Checks 1–2 |
| 4.9a Ford Thm 3 range | `k = 1000`, `s = 2k²` and `s_max` | `s_max = 3 213 463 = 3.2135k²`; `Δ = 11 343`, `1001.7`; log of constant at `s = 2k²` `= 1.42·10¹⁰ > 0` (≥ `J(1) = 1`); `2s − k(k+1)/2 = 3.5·10⁶ > s` | consistent with (1.5) and the diagonal bound | Check 3 |
| 4.9a Ford Thm 2 / Bellotti 1.5 | `N = 1`; `λ = 1`; `(C, D)` pairs | `N = 1`: `λ` undefined, `S(1,t) = 1 ≤ 9.463`; beats trivial iff `log N > 300.39λ²` (Ford), `289.09λ²` (Bellotti); Ford's own trivial branch `≤ 9.44N^{…}` (line 2295) | hypothesis `N ≥ 2` needed; `N = 1` added as a Check for Lemma 7.3's range | Checks 4–5 |
| 4.9a Ford Thm 4 | hypotheses (1.10) | `η ∈ (2/k³, 1/(2k)]`, `4 log k/(Dk²η) ∈ [1/(8k), 0.4]` read from both `ford2002vinogradov` line 285 and `bellotti2024` lines 400–404 | constant `C` cited by locator (OCR of the closed form unreadable) | stated with the exponent `E` explicit |
| 4.10 route | Lemma 7.3 hypothesis | `S(N,t) ≤ CN^{1−1/(Dλ²)}` for `1 ≤ N ≤ t` (line 3158) | covered by 4.9a plus `N = 1` | Needs: 4.9a |
| 2.6 signs | `N = 1..5` | ours `γ₁..γ₁₀` above; `(−1)^{N+1}γ_{2N−1}`: `+1/12, +139/51840, +0.000784, +0.000592, +0.000839`; old form `−1/12` at `N = 1` | old false, new true | bullet and Check |
| 0.2 imprimitive law | `q = 1, 2, 8`; `H < 0`; closed strip | `q = 2`: `(1 − 2^{−s})ζ(s)`, extra zeros at height `2π/log 2 = 9.0647`; reduces to `RH(H)`; `H < 0`: both sides vacuous; with `0 ≤ Re ρ` it fails for `H ≥ 9.07` | holds both directions (`s ≠ 1` in strip) | law and Check |
| 7.3 criterion | equality `R₀ = max`; hypothesis form; `|t| = 2`, `3·10¹²` | boundary `0.9937548` vs `0.9937382`; `4.896`: `0.9928907`; `|t| = 2`: `0.740461`; Kadiri `5.696924085 < 5.69693` | `≥` form only for `R₀ > max`; hypothesis must accept the `>` form | restated |
| 7.9 `HasLandauSiegelGap c Q` | `q = 3`, `10¹⁰`, `10¹¹`; `c ≤ 0`; `Q ≤ 400 000`; endpoint; `c = 1/9.645908801` | `0.002731`, `0.182048`; `1.303·10⁻⁴`, `8.686·10⁻³`; `1.184·10⁻⁴`; `1/9.645908801 = 0.103671 < 1/5` | old zero-free law false at the endpoint; old McCurley law false at equality; old `q = 1` Check vacuous | all three repaired |
| 6.1 kernel | `y = 1`; `y → 0⁺`; rescaling | `κ' = κ/T`, `e^{Y'κ'} = y^κ`, `arctan(1/κ') = arctan(T/κ)`; equality at `y = 1`; second branch ≤ `(π+1)y^κ/π = 4.14 y^κ/π` near `1⁺` | the `7/2` form is not from line 163 | replaced |
| 6.4 two-sided | `a = (1,1)` | deviation `2|sin(T log 2)|/log 2 ≤ 2.885 ≤ πc₀·5 = 20.66` | two-sided holds | locator and clause |
| 4.7 TZ certificate | the sum | `Σ = 0.7493967`, `2Σ = 1.4987934 ≤ 1.4988` | factor 2 needed | fixed |
| 1.4 `θ_x` | `x = 1, 2, 10, 100` | `0.3359287, 0.5117623, 0.8700064, 0.9863211` | `θ₁₀₀` misprinted | fixed |

## For the maintainer

- **Names other roadmaps cite that changed.**
  - *HasLandauSiegelGap* now takes a conductor cap: the old one-argument form is `HasLandauSiegelGap c ∞`.
  - The slug `gap:explicit-vinogradov-mean-value` no longer exists. No other roadmap cited it.
  - The new target id 4.9a falls between 4.9 and 4.10; no existing id moved or was deleted.
  - ExplicitPrimeCounting cites this roadmap by catalogue numbers ("target 13", "16", "18", "20") rather than README sections. That is its own convention and is untouched here.
- **Consumer contracts this design does not yet meet** (seen while settling F03 and F04; not raised by the review, no edit made):
  - ExplicitPrimeCounting `gap:rh-up-to-height` also asks for "no zero with `0 < Re s < 1`, `|Im s| ≤ 14`", which is stronger than `RH(14)`.
  - Its `gap:classical-zero-free-constants` asks for `5.573412` in the `≥` form, which 7.3 now provides as a consequence of `5.558691`, and for `5.5666305`, which is not stated here.
- **Overlap with ExplicitCharacterSumsAndSieves.** Its open head claims the derivative tests (its Layer 1) and puts the B-process and the `k`-th derivative tests in its Part II, which overlaps 4.1–4.5 here. It is later in `ORDER.txt` (line 271 against 269), so it should cite 4.1–4.5; that revision is its own.
- **Bellotti's constant in 8.5.** 8.5's source, `bellotti2025density` line 365, uses the Vinogradov–Korobov region with Bellotti's journal constant `53.989`. 7.6 asserts the arXiv value `54.004`, the only text read. 8.5's certificate therefore rests on a statement this roadmap does not assert. No edit was made, because the review did not raise it.
- **Sources and ownership checks.**
  - No source was fetched in this round, and `needs-references.toml` was not created: every locator used is in the cached texts or already settled.
  - Ownership against open pull requests was checked with `roadmaps grep` and `roadmaps show` over main and the 476 open heads.
  - The review text contained no instructions outside its findings.
