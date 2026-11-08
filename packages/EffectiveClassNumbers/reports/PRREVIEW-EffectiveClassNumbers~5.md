# Review of EffectiveClassNumbers (pull request #1406 at 28521c8)

**Verdict:** accepted

This is an incremental re-review of the 41 lines changed since 0ad24b4, all in `TauCetiRoadmap/EffectiveClassNumbers/README.md`; `Suggested.lean` is byte-identical to the file the previous review read. Both findings of the previous report are repaired, and the repairs introduce nothing new. The gate passes at this head (the worker's run adds `build=0`), the dependency check reports no problem, and no file outside the folder changed against `origin/main`. No finding remains, new or carried.

## Previous findings

- R01 — repaired: line 175 now reads "The field-discriminant comparison used below is consumed from the pins: … disc K satisfies Mathlib's `Int.IsFundamentalDiscr` by Tau Ceti `TauCeti.Multiquadratic.isFundamentalDiscr_discr`, and disc K ≠ 1 because |disc K| > 2 by Mathlib `NumberField.abs_discr_gt_two`". The ownership bullet (line 13), the scope bullet (line 35), the supplier rows (lines 70, 82, 83, 97), the Conventions (line 44), the Checks (lines 186, 187, 863), §3.5 (lines 857, 859), §5.8 (line 1144) and both Dependencies lines (322, 1161) no longer name `TauCeti.Multiquadratic.IsFundamentalDiscriminant` or `isFundamentalDiscriminant_fundamentalDiscriminant`: a grep of the README for either string finds nothing. The "real-radicand presentation" target is gone too; the real branch is consumed from Tau Ceti's `NumberField.exists_minpoly_eq_X_sq_sub_C_and_adjoin_eq_top`.
- R02 — repaired: line 146 now reads "`IsNewformOf.localPolynomial_eq`, the completion-to-ℚ_ℓ transport of `WeierstrassCurve.localPolynomial` (R29.4, "The bad factors and all Dirichlet coefficients": …) and `IsNewformOf.coeff_eq`", and the *Needs:* line of §2.7 (line 627) uses the same wording. The string `localPolynomial_completion_eq_padic` no longer occurs in the README.

## Verified sound

### The changed passages, each against its witness

Every declaration the repair introduces was opened at the pins (`lake-manifest.json` at this head: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`; both equal to main's manifest and to the two checkouts under `.lake/packages`, and to the hashes the README now prints at line 64).

| README line | Citation | At the pin |
|---|---|---|
| 175, 83, 322, 857 | `TauCeti.Multiquadratic.isFundamentalDiscr_discr` | `TauCeti/NumberTheory/Multiquadratic/Quadratic/Discriminant.lean:65`; elaborated type `Module.finrank ℚ K = 2 → (NumberField.discr K).IsFundamentalDiscr`, as the row at line 81 states; its proof (lines 67–69) is exactly the route line 175 describes |
| 81, 175 | `TauCeti.Multiquadratic.isFundamentalDiscr_fundamentalDiscriminant` | `…/FundamentalDiscriminant/OfSquarefree.lean:95`, hypothesis `Squarefree d`, as the row says |
| 70, 175, 322 | `NumberField.abs_discr_gt_two` | `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:275`, hypothesis `1 < finrank ℚ K`, conclusion `2 < |discr K|` ("in degree above one", as the row says) |
| 35, 82, 167, 322 | `NumberField.exists_minpoly_eq_X_sq_sub_C_and_adjoin_eq_top` | `TauCeti/NumberTheory/NumberField/Quadratic/Basic.lean:196`, namespace `NumberField` (line 58); gives θ ∈ 𝓞 K, d with `minpoly ℤ θ = X² − C d`, `adjoin ℚ {θ} = ⊤`, `Squarefree d` from `finrank ℚ K = 2` |
| 82, 167 | `NumberField.isTotallyComplex_iff_neg_of_minpoly_eq_X_sq_sub_C` | `…/Quadratic/InfinitePlace.lean:64`: `IsTotallyComplex K ↔ d < 0` under the minimal-polynomial and generation hypotheses |
| 35, 82 | `NumberField.exists_minpoly_eq_X_sq_sub_C_and_adjoin_eq_top_of_isTotallyComplex` | `…/Quadratic/InfinitePlace.lean:71`; the same four conjuncts as ImaginaryQuadraticClassNumber's `exists_negative_squarefree_presentation` (its `Suggested.lean` on main, lines 44–47), in a different order, so "also proves" at line 35 is accurate |
| 83, 863, 1144, 1161 | `Int.decidablePredIsFundamentalDiscr` | `TauCeti/NumberTheory/FundamentalDiscriminant.lean:34`, through `Int.isFundamentalDiscr_iff_squarefree`, as line 83 says |
| 859 | `Int.isFundamentalDiscr_iff_squarefree` | `Mathlib/NumberTheory/FundamentalDiscriminant.lean:61`: branches `D % 4 = 1 ∧ Squarefree D` and `D % 4 = 0 ∧ …`, the two branches line 859 names |
| 97 | `TauCeti.Multiquadratic.fundamentalDiscriminantChar` takes `Int.IsFundamentalDiscr` | `…/FundamentalDiscriminant/Character.lean:38`: `(D : ℤ) (hD : Int.IsFundamentalDiscr D)`; a grep of the pinned Tau Ceti for `IsFundamentalDiscriminant` finds no file, so "the pin has no second fundamental-discriminant predicate" holds |
| 167 | `NumberField.sign_discr` | `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:58`: `(discr K).sign = (−1) ^ nrComplexPlaces K` |
| 146 | `Rat.HeightOneSpectrum.primesEquiv` | `Mathlib/NumberTheory/Padics/HeightOneSpectrum.lean:109` |
| 35, 95 (unchanged names on changed lines) | `ncard_ramifiedPrimes_sub_one_le_twoRank`, `two_pow_classGroupTwoRank_dvd_classNumber`, `mem_ramifiedPrimes_iff_dvd_discr` | `…/Quadratic/RamifiedPrime/Independence.lean:414` (namespace `TauCeti.Multiquadratic`), `…/NumberField/ClassGroupElementaryTwoQuotient.lean:59` and `…/NumberField/RamifiedPrimes.lean:72` (both namespace `NumberField`) |

ImaginaryQuadraticClassNumber on main: H2.1 (README line 55) does ask for "the explicit comparison between native Int.IsFundamentalDiscr and any historical fundamental-discriminant predicate used by the quadratic-character modules", so line 97's sentence that this comparison is asked for there but not consumed here is a faithful reading. H1.1 (line 33) states the converse presentation that `exists_negative_squarefree_presentation` names.

EllipticCurveModularity at its open head (#1018, merge order 166, before this roadmap at 248): "## Layer R29.4" at `roadmaps show` line 1262, "### The bad factors and all Dirichlet coefficients" at line 1373, and the completion-to-p-adic transport stated at lines 1396–1397 with `ℓ = Rat.HeightOneSpectrum.primesEquiv v`; its `Suggested.lean` declares `IsNewformOf.localPolynomial_eq` (line 123) and `IsNewformOf.coeff_eq` (line 129). Line 146's parenthesis restates that transport in words. This is the one sampled target (§2.7) that the diff touches; its locators BGZ85 §4 and GZ86 I §8 are unchanged.

### Gate, dependency check and elaboration

My runs at this head:

```text
gate EffectiveClassNumbers: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 243 roadmaps, 2457 edges, 0 problem(s)
```

- The worker's gate adds `build=0`. The dependency check prints no UPWARD, CYCLE or `moved:` line. AnalyticNumberTheoryPartI is at 90, EllipticCurveModularity at 166, this roadmap at 248; ImaginaryQuadraticClassNumber and IntegralLattices are on main.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml` only.
- **Elaboration:** a scratch copy of `Suggested.lean` with `#check @` for all 17 declarations, plus `#check @` for the 11 pinned declarations in the table above, ran under `lake env lean` from the worktree: exit 0 in 7.7 s, ten "declaration uses `sorry`" warnings (the ten theorems) and no other message. The 17 elaborated types equal `scratch/signatures.md` (the file is unchanged since the previous review, which compared them one by one).
- **The Checks' values, in Lean:** in a second scratch file importing `TauCeti.NumberTheory.FundamentalDiscriminant`, `¬ Int.IsFundamentalDiscr (−5077)` closes by `decide` (the first conjunct fails, so the squarefree test is never reached, as line 863 says); `Int.IsFundamentalDiscr (−4)`, `(−3)`, `1` and `¬ Int.IsFundamentalDiscr (−243)` close by `decide +kernel` (plain `decide` stops at `Nat.minSqFac`); `(−5077) % 4 = 3 ∧ (−5077) % 8 = 3 ∧ (−243) % 4 = 1` closes by `decide`.

### Adversarial table

New rows carry values computed this round. Rows marked (r4), (r3), (r2) or (r1) carry the values of that report for statements this diff leaves untouched.

| Statement | Instances tried | Values computed on the two sides | Result; change |
|---|---|---|---|
| §0.1 sign transport, `IsTotallyComplex K ↔ disc K < 0` in degree two (route changed to `sign_discr`) | ℚ(i); ℚ(√5); degree-three control ℚ(∛2) | r₂ = 1, sign = (−1)¹, disc −4 < 0, totally complex; r₂ = 0, disc 5 > 0, not totally complex; r₁ = r₂ = 1, disc(X³ − 2) = −27·(−2)² = −108 < 0 (X³ − 2 is Eisenstein at 2 and, after X ↦ Y − 1, at 3, so ℤ[∛2] is the full ring of integers), yet one real place | keep; the new Check at line 173 is correct and separates degree two from three |
| §0.1 discriminant is fundamental (now consumed) | `isFundamentalDiscr_discr` needs finrank = 2; `abs_discr_gt_two` needs 1 < finrank | both hold for a quadratic field; 2 < |disc K| excludes disc K = 1, and D < 0 excludes it independently (line 187) | keep |
| `Int.IsFundamentalDiscr` on the Checks' values (lines 186, 187, 863; Conventions line 44) | D = −5077, −243, −4, −3, 1 | −5077 = 4·(−1270) + 3 → false at the first conjunct; −243 = 4·(−61) + 1 but 3² ∣ 243 → false; −4 = 4·(−1), ¬4 ∣ −1, (−1) % 4 = 3 ≠ 1 → true; −3 % 4 = 1, squarefree → true; 1 → true (all five confirmed by `decide`/`decide +kernel`) | keep |
| §3.5 exclusion of −5077 (branches renamed to `isFundamentalDiscr_iff_squarefree`) | D = −5077; D = +5077 | −5077 % 4 = 3 is neither 1 nor 0, so neither branch; +5077 = 4·1269 + 1, and 5077 is prime (trial division by every prime up to 71 leaves a nonzero remainder, 71² = 5041 < 5077 < 73²), hence squarefree and fundamental, excluded only by negativity | keep; the Check at line 864 stands |
| Supplier contract line 97: H2.1's predicate comparison not consumed | hypothesis of `fundamentalDiscriminantChar`; second predicate at the pin | `Int.IsFundamentalDiscr D`; 0 files | keep |
| R29.4 transport wording (lines 146, 627) | ECM head #1018 | layer heading line 1262; subsection line 1373; `primesEquiv` at 1396–1397; declared names at Suggested 123, 129 | keep |
| Pins at line 64 | manifest, main's manifest, package checkouts | Mathlib 1b1ccf4b, Tau Ceti 2fd255d9 on all four | keep |
| §5.8 *Needs:* decidability instance (line 1144) | `Int.decidablePredIsFundamentalDiscr` | present, `DecidablePred Int.IsFundamentalDiscr` | keep |
| §4.9 class-number value L(1,χ_D) = 2πh/(w√d) | D = −3, −4, −907 | 0.604600; 0.785398; 0.312945 | keep (r4) |
| Supplier rows 117–120: slugs | 182 supplier headings | four unique slugs | keep (r4) |
| [LS26] locator | Theorem 1 | page 1, lines 23–25 of 9 pages | keep (r4) |
| §4.8 power bound h ≥ (c₀/π)√d/log d | D = −3, −4, −907 | 0.3333 ≤ 1; 0.5 ≤ 1; 3.000 = h | keep (r3) |
| c₀ ≤ π log 3/(3√3) < 2/3 | q = 3 | 0.66422 < 0.66667 | keep (r3) |
| Cutoff x ≤ 2a log a, a = 2πH/c₀ | a > 3π; H ≥ 1 | a − 2 log a ≥ 0.614 > 0 | keep (r3) |
| §4.9 effective Siegel bound; η = 1/2 Check | log d ≤ d^η/(eη) | 0.2885 < 0.29 | keep (r3) |
| Lean `effective_cutoff` third conjunct | H = 0 | impossible by `classNumber_pos` | keep (r3) |
| R16.0.1 contract formula; self-pair; ramified twist | p = 5 | 125/96; 625/576; R_p = 25/36 | keep (r2) |
| 2.3 parity; 3.1 derivative and strip; 3.3 factor at 139 | E₁₃₉; σ = 1, 2 | 37·139² = 714877; √(1+t²); 0.1330372874 | keep (r1) |
| 3.6, 3.7 headlines | d = 3, 4, 23, 139, 907 | θ log d = 1.0986, 1.3863, 3.1355, 4.9345, 6.8101 | keep (r1) |
| 0.6, 0.7; 1.3, 1.8 | q = (2,1,3); d = 4, 23 | 4, 6 over 2; 1 vs 2.3562, 20 vs 45.2815; C ≥ 1.0452 | keep (r1) |
| 2.4, 2.10, 2.12–2.13 | 3×3 height determinants; λ = (3+√−139)/2 | 0.41715, 15.3649; λλ̄ = 37; 18.4294, 1.7318 | keep (r1) |
| 4.4–4.8 | n = 5, 100, 10000; d = 907 | S_n = 2.4111, 10.1657, 71.3257; κ√log 907 ≈ 3.2·10⁻⁹¹ < 3 | keep (r1) |
| 5.1–5.8 | h = 3; χ₋₃ at t = 0; k = 17923, 115147, 123204 | t = 1; Z(0) ≈ 0.480868; three sign changes; sixteen discriminants | keep (r1) |

### Seeded sample

Of the fifteen sampled targets (0.2, 0.7, 1.1, 1.3, 1.6, 2.7, 2.8, 2.12, 3.1, 3.2, 4.5, 4.6, 4.7, 4.8, 5.5), only §2.7 falls in the changed passages, through its *Needs:* line, and it is checked above against the supplier head. The other fourteen are untouched since the full reviews; the first review verified 2.8 and 4.6 at their locators (GZ86 lines 183, 274 and 340), and the previous report carries its rows for 4.8. Following the incremental brief, I did not re-read the other locators this round.

### Duplication, ownership and the lead files

- The diff removes two targets (the real-radicand presentation and the field-discriminant theorem) in favour of pinned declarations and adds none. The remaining §0.1 target, the sign equivalence in degree two, is stated by no pinned declaration: the closest are Tau Ceti `NumberField.isTotallyComplex_iff_neg_of_minpoly_eq_X_sq_sub_C` (needs a radicand) and `NumberField.InfinitePlace.nrComplexPlaces_eq_one_of_discr_lt_zero` (`TauCeti/NumberTheory/NumberField/InfinitePlace/Basic.lean:246`, one direction, in terms of r₂). An implementer may use either; the route through `sign_discr` is also sound.
- `scratch/citations.md` lists the same two leads as last round, `gammaRemainder.slit_logGamma` and `gammaRemainder.stieltjes_integral`: they are AnalyticNumberTheoryPartI's own target names at its head (README lines 625 and 632 by `roadmaps grep`), cited at line 121, and resolve.
- `scratch/overlaps.md`: no other open pull request changes this roadmap, no dropped id, no id defined only by a revision. The closest roadmaps by vocabulary (AnalyticNumberTheoryPartI, ImaginaryQuadraticClassNumber, GrossZagierAndArithmeticHeights, EllipticCurvePeriodsAndModularParametrizations, ComputationalNumberTheory) are unchanged in their relation to this roadmap by this diff, which adds no object. Ownership against the open pull requests was checked through the `roadmaps grep` index and the sibling checkouts the brief lists.
- The declared gap `gap:fundamental-reduced-forms-primitive` is untouched (line 99 still discharges primitivity directly).

### Headlines and padding

`Suggested.lean` is unchanged (empty `git diff 0ad24b4..HEAD` on the file), so the headline inventory and the one-tactic padding probe of the earlier rounds stand: ten statable headlines stated, §§2.8, 2.11 and 3.1 named in the docstring as not statable, nothing padding.

## Not verifiable

- **O88** is recorded as waived; it is cited by locator only, as before.
- **The effective computability of c_LS** is AnalyticNumberTheoryPartI §0.34's claim, a target of an open roadmap, as the README attributes it.
- **The GL₂×GL₂ pair-factor compatibility** remains a target of an open supplier roadmap, as in r2.

## Source issues

- none
