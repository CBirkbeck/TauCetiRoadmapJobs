# Repair report: FIX-DESIGN-ExplicitCharacterSumsAndSieves~2

Files changed: `packages/ExplicitCharacterSumsAndSieves/design/README.md`,
`packages/ExplicitCharacterSumsAndSieves/design/plan.json` (67 targets, 139 tests; one target
added, 4.2c), `packages/ExplicitCharacterSumsAndSieves/sources.toml` (locators and `cited_for`
only; no entry added). One review (REV-DESIGN-ExplicitCharacterSumsAndSieves), twelve findings.

## F01 (P2) — applied

Old: "Outside this roadmap altogether are" the k-th derivative test, Bordignon–Kerr/Bordignon,
composite moduli, Francis, Siebert/Riesel–Vaughan, linear sieves; summary "Treviño, McGown and
Booker". New: an "ExplicitCharacterSumsAndSieves, Part II" paragraph in Scope and ownership, one
bullet per group with source and locator; summary "Treviño and McGown".

Evidence and mapping (filed target → Part II bullet): 9 → k-th derivative test (bordelles2012
Theorem 5.12, huxleysargos1995 Théorème 1 line 39, zhao2024 Theorem 2.1 line 84); 12 →
Bachman–Rachakonda (bachmanrachakonda2001 Theorem 1; the bullet records that §3.5 implies it for
primitive χ, coefficientwise `0.2026 < 0.3034`, `0.9467 + 1.668 ≤ 6.5√q`, and §3.6 for
`q ≥ 1000`, `0.2251 < 0.3034`, `2.351 < 6.5`); 15 → bordignonkerr2020 Theorem 2, Corollary 1,
Theorem 5 (lines 156–220) and bordignon2022partial Theorem 1.1 (lines 69–75, published numbering,
read in the cached published copy) with Theorem 1.3 (lines 123–126); 19 → booker2006 Proposition 2
and Table 1 (lines 350–379); 20 → jainsharmakhaleliu2021 Theorem 1.1, Corollary 1.2 (lines 86–91);
23 → Siebert (tmeemt-art14 line 119), Riesel–Vaughan (tmeemt-art14 lines 126–155), the enclosure
of `C₂` (platttrudgian2018 line 163 encloses `2C₂ = 1.320323…`), Platt–Trudgian display (11)
(line 188) and the Montgomery–Vaughan weighted large sieve (platttrudgian2018 Theorem 2, line
131); 26 → bordignonjohnstonstarichkova2022 Theorem 6 (line 147). The B-process (filed target 6,
whose drop the review accepts), Francis's constants and Yamada's inequality (addendum items) are in
the same paragraph so that nothing excluded is left without an owner. The twin-prime constant is
written `C₂` because `ω` is `cardDistinctFactors` in the Conventions. Ownership was checked by
object (`roadmaps grep` for stationary phase, truncated Poisson, Bordignon, Siebert, Riesel,
Yamada, partial Gaussian, Huxley–Sargos, Bachman, composite modulus, weighted large sieve,
Preissmann): no roadmap on main or in the 472 open pull requests owns any of them, and no Part II
of this roadmap exists yet. The ExplicitZetaBounds consumer line now says the B-process belongs to
the Part II. One correction to the witness: `packages/ExplicitZetaBounds/target.md` line 276 lists
this roadmap as a *consumer* of ExplicitZetaBounds' weighted and maximal large sieves, not as their
supplier; either way this roadmap now names the Part II as the owner of the weighted large sieve and
consumes nothing from ExplicitZetaBounds.

## F02 (P3) — not actionable in this package: merge-order placement

No README change. Verified: `merge-order/ORDER.txt` lines 268–271 are SieveMethodsAndPrimePatterns,
ExplicitZetaBounds, ExplicitPrimeCounting, ExplicitCharacterSumsAndSieves, while both sibling
targets require this roadmap first (`packages/ExplicitZetaBounds/target.md` lines 268–269). This
roadmap names neither sibling as a supplier, so its gate is clean; moving it directly after
SieveMethodsAndPrimePatterns is a merge-order decision outside the files this job may edit.

## F03 (P3) — not actionable in this package: ProbabilisticAndMetricNumberTheory must cite §0.3

No README change. Verified: ProbabilisticAndMetricNumberTheory is at ORDER line 274, after this
roadmap (271); Scope and ownership already owns the finite lag inequality at §0.3 and lists that
roadmap's §2.5 under Downstream consumers. The remaining action is in the other roadmap's README.

## F04 (P3) — applied

1.3 Check 1: "exceeds it by `L/V + 1 > 0`" → "exceeds it by `L/V + 1 + (4√(W/π) + 1)/V > 0`",
with the computed value `8.454` at `L = 10`, `V = 2`, `W = 3`. plan.json 1.3c gains the test
`excess`.

Evidence: `2(L/V+2)(2s+1) − [2((L−1)/V+2)(2s+1/2)+1] = L/V + 1 + (4s+1)/V`; with `s = √(3/π) =
0.97721` the value is `8.45441`, against `L/V + 1 = 6`.

## F05 (P3) — applied

3.5: "satisfies `1 ≤ L ≤ q` exactly when `q > 25`" → "for `q > 25`, the split used in lapkova2018's
proof (in fact from `q = 19` for even and `q = 24` for odd `χ`)", plus a Check with the
witnesses. plan.json 3.5a gains the test `L_range`.

Evidence: even, `π²√19/4 + 9.15 = 19.90` gives `L = 19 ≤ 19`, `q = 18` gives `L = 19 > 18`; odd,
`π√24 + 9.15 = 24.54` gives `L = 24 ≤ 24`, `q = 23` gives `L = 24 > 23`.

## F06 (P3) — applied differently

The suggested repair keeps a false lemma. Old 4.1: "every value occurs at least twice …
`≤ (2r − 1)!! H^r` for `r ≤ 9H`". New: the count is over `d`-degenerate tuples, for all `H, r ≥ 1`,
with a complete route; the moment bound holds for every `B > 0`, `r ≥ 1`.

Evidence: the "at least twice" count is `Σ_k A(2r, k) H^{(k)}` (set partitions into blocks of size
≥ 2, falling factorials); at `r = 6`, `H = 100` it is `10,672,134,076,622,800 > 11!! · 100⁶ =
10,395,000,000,000,000` (ratio 1.0267), and the ratio exceeds 1 for every `6 ≤ r ≤ 20` at
`H = 100` (computed), all within `r ≤ 9H`. The second-order coefficient
`r(r−1)/6 + r(r−1)(r−2)/9 − r(r−1)/2` is positive exactly for `r ≥ 6`. The set Weil's bound leaves
over is the `d`-degenerate set (`f` is `c·h^d` iff `a_v ≡ c_v mod d`). New proof route: the count
equals `E|Z₁ + ⋯ + Z_H|^{2r}` for independent uniform `d`-th roots of unity; even `d`: perfect
matchings; `d > r`: rearrangements, `r!H^r`; odd `3 ≤ d ≤ r`: random rotation in `[0, 2π/d)` and
Jensen give `(π/(d sin(π/d)))^{2r} r! H^r`, at most `(2r−1)!!H^r` for `r ≥ 5` (`d = 3`:
`1.4622^r r!`, e.g. `801.98 ≤ 945` at `r = 5`, and the ratio `(2r+1)/(1.4622(r+1)) ≥ 1` keeps it);
`(d, r) = (3, 3), (3, 4)`: exact counts `6H³ − 8H² + 3H` and `24H⁴ − 56H³ + 42H² − 9H`
(interpolated from `H = 0, …, r + 1` and confirmed at `H = r + 4`), below `15H³`, `105H⁴`. Exact
counts computed for `d ∈ {2, 3, 4, 5, 7}`, `r ∈ {2, 3, 6, 8, 10, 15}`, `H` up to `10⁵`: maximal
ratio `1.0000` (`d = 2`) and `r!/(2r−1)!!` (`d ≥ 3`). The route also reduces `⌊B⌋` modulo `p` (Tau
Ceti `DirichletCharacter.sum_range_level_eq_zero`), which the old route omitted (for `H ≥ p`
distinct `b_i` need not give distinct roots). Pattern: 4.5's route no longer says "needing
`r ≤ 9B`"; new Checks (odd multiplicity at `d = 3`, the too-large "at least twice" set); Mathlib
`ConvexOn.map_integral_le` added to the supplier contract; plan.json 4.1a, 4.1b restated.

## F07 (P3) — applied differently

Layer 6 preamble and "How to read the build": "each is a finite list of numerical inequalities" →
6.1–6.6 bounded numerical statements, 6.7–6.8 inequalities between explicit functions of `p` on
`[p₀, ∞)`, not finite verifications. Certificates keep "every `p ≥ p₀`"; 4.5's route says the source
evaluates at `p₀`; two Checks added (6.7, 6.8).

Evidence against the suggested repair (certificates at `p₀` plus a general monotonicity lemma): I
reconstructed displays (46), (47), (58), (59) of trevino2015 (lines 888–941, 1217–1265); with
Table 5 and Table 7 parameters they reproduce all 54 entries of Tables 1 and 3 to four decimals
(e.g. `2.73807` for `2.7381`, `1.57930` for `1.5794`). For (46) the reviewer's derivative is right
(numerator `−5.03` at `log 10⁷`, `k = 1/30`). For (59) it is false as a lemma: the bracket
`log(c√u)/(ku) + const` increases while `c√u < √e`, and `c√(log p₀) < 1.6487` in eight rows (`10¹⁰`:
`r = 6, …, 10`; `10¹⁵`: `r = 8, 9, 10`; `10²⁰`: `r = 10`); at `r = 10`, `p₀ = 10¹⁰` the bracket
rises from `4.7426` to `4.8535` at `p = 10^{23.3}`. On a grid of `p` from `p₀` to `p₀ · e^{200}` the
whole right side is largest at `p₀` in every row (at that row `1.57930 → 1.51537`, because
`A/(A−1) · B/(B−1)` falls from `1.0485` to `1.0097`), so the certificates are plausible as stated,
but the monotonicity is a property of each row, not a lemma the roadmap can prove in general.

## F08 (P3) — applied

4.2 Check: `88,437` → `88,447` (with `3.9474`). 6.6 Check and Layer 6 Examples: `10.0364` →
`10.03655`. Same slip repaired in 4.4's Check: `4.9539` → `4.9538…, rounded up to 4.9539`. New 6.6
Check: the tightest row `r = 8`.

Evidence: `22400(0.00112 + log 51.8) = 22400 · 3.94851 = 88,446.6`; `252^{1/4}/(1 − 2/√11) =
3.98428/0.396977 = 10.03655`; `660^{1/6}/(1 − 2 · 11^{−2/3}) = 4.95382`. All fourteen `C₀(r)`
recomputed: every `C₀(r) < C(r)`, tightest `C₀(8) = 2.27209925 < 2.2721`; (A.1) holds in every row
(`1093.2 ≥ 1056` … `166,280.6 ≥ 7920`).

## F09 (P3) — applied

§0.3: "Lemma 6 …, which is the corollary … Re(…)" → a third corollary
`|Y⁻¹Σb_n|² ≤ 4/H + (4/(HY)) Σ_{h<H} |C(h)|` (`|b_n| ≤ 1`, `1 ≤ H ≤ Y`) and a sentence that
Lemma 6's real-part form is not a corollary. §1.6's route uses the new form. Two Checks added;
plan.json 0.3, 1.6 updated.

Evidence: the corollary follows from `N + H − 1 ≤ 2Y` and `Y + 1 ≤ 2Y`; it is the form the source's
own proof of Theorem 7 uses (ariasdereyna2024 lines 405–415). At `b = (1, −1)`, `H = Y = 2` the
real-part term is `3 · 2 · (−1) = −6`, and `−8` with `2Y`: enlarging the factor lowers the bound.

## F10 (P3) — applied

Locators widened: frolenkovsoundararajan2013 "Theorems 1 and 2; Corollary 1"; montgomeryvaughan1973
"Theorem 2; Lemmas 7 and 10; display (3.3) and §3"; fan2022 "(4), (5) and (6)"; trevino2015 adds
Theorem A, Theorem C, Lemmas 1-6, displays, Tables 1-7; mcgown2012 "Theorems A.1, A.9, Lemmas
A.5-A.8"; hunter2016 "Theorems 1.2 and 1.3".

Same pattern repaired in: patel2022 (Lemmas 2.1, 2.5 and displays added), hiarypatelyang2024
(Lemma 2.4), ariasdereyna2024 (Lemma 6, Remark 2), buthe2014 (Lemmas 3.1, 4.4, 4.5, Propositions
3.2, 3.3), pomerance2011 (Lemmas 2–4), frolenkov2011 (equation (1)), granville-ramare-1996 (Lemma
8.4), zhao2024 (Theorems 2.5, 2.7, Lemma 2.6), bordelles2012 (Lemma 5.7), booker2006 (displays
(28)–(30)), bordignonkerr2020 (Theorem 2), patelyang2024, platttrudgian2018 (display (11)); and
bordignon2022partial, whose locator and version note now give the published numbering of the copy
read (Theorem 1.1 is the Pólya–Vinogradov bound, Theorem 1.3 the twisted Burgess bound). The
`cited_for` of the sources the Part II paragraph now cites say "Scope and ownership:
ExplicitCharacterSumsAndSieves, Part II".

## F11 (P3) — applied

Conventions and §0.2: "real `N > 0`" → "real `N ≥ 0`" (length 0 counts `a` alone); §2.2 likewise
(its bound is at least `1` there). New §0.2 Check: `R(x/3, 3, 0, 0.1) = 1`,
`R(x/3, 2.5, 0, 0.5) = 0`. plan.json 0.2, 2.2 updated.

## F12 (P3) — applied

3.3 Lemma 2 route: "is at least `log n − 2n/(n + 1) > −2/n`" → "increases up to `s = 1/(n + 1)` and
decreases after it, so it is at least `min(log n − 2n/(n + 1), −2/(n + 1)) > −2/n`". New Check at
`n = 2`; plan.json 3.3b gains the test `route_endpoint`.

Evidence: the derivative is `(1/s²)(1/(n+1) − s)`; at `n = 2` the endpoint values are `−0.640` and
`−0.667` (the right one is smaller), both above `−1`; at `n = 3`, `−0.401` and `−0.5`; at `n = 1`
the middle range is empty.

## Further repairs found by the adversarial pass

- **McGown's route (4.4) averages over prime multipliers.** mcgown2012 Lemma A.5 (lines
  1083–1118) shifts by `ab` with `a` prime and Lemma A.7 counts the energy over prime pairs; §4.3
  covered only all integers `a ≤ A`. §4.3 now takes any nonempty multiplier set `𝒜 ⊂ [1, A]`
  (`H = |𝒜|⌊B⌋`), and §4.2 gains McGown's prime-multiplier count (new plan target 4.2c,
  `burgess_energy_prime_multipliers`), with the computed Check `𝒜 = {2, 3, 5}`, `N = 100`,
  `p = 1009`: `V₂ = 446 ≤ 452.7`.
- **4.4 needs an explicit prime-count lower bound.** McGown bounds `H/π(A)` with
  `π(A) ≥ A/(1 + log A)` for integers `A ≥ 3` (lines 1376–1390, from Rosser–Schoenfeld). It now
  comes from AnalyticNumberTheoryPartI §0.5 (already a supplier) for `A ≥ 59` and a direct count
  for `3 ≤ A ≤ 58` (minimum margin `0.32` at `A = 4`), so both 4.4 theorems carry
  `RosserSchoenfeldFiniteRangeInput`, as the Conventions require. McGown's other estimates are
  elementary and in the route: Lemma A.8 (checked for `X ≤ 100`; `(π(n) − 1)/n ≤ 0.2569` for
  `100 ≤ n ≤ 10⁵`) and `π(A) ≤ (A + 1)/2`. §4.1 implies McGown's weaker moment bound since
  `(2r − 1)!! ≤ (4r)^r/4`.
- **Stale section numbers.** The supplier contracts said §2.9 is consumed "in 5.4 and 5.7", §1.3
  "in 5.6", AnalyticNumberTheoryPartI "only in 5.7"; Sources stated at second hand said
  Montgomery–Vaughan "(5.4)" and Greaves "(5.3)". Corrected to 5.5/5.6, 5.3, 5.6 (and 4.4), 5.5,
  5.2.

## Checks run

Dependency gate, exactly as given in the brief:

    depcheck: 240 roadmaps, 2433 edges, 0 problem(s)

No UPWARD or CYCLE line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean
name found nowhere. There is no `Suggested.lean` at the design stage, so the `#check` elaboration
was not run; the Lean names the README backticks are still only the eight Layer 6 `Prop`s.
Ownership against open pull requests was checked with `roadmaps grep` (above) and
`roadmaps overlaps` (no pull request changes this roadmap; no cited id is dropped). No source was
fetched and no `needs-references.toml` was written: every locator added was read in the cached
texts, and the uncertified or waived keys are cited by locator only.

## Adversarial pass (changed or added statements)

| statement | instances tried | values | result | change |
|---|---|---|---|---|
| 1.3 Check excess | `L=10, V=2, W=3` | `8.45441` vs `L/V+1 = 6` | old wrong | fixed |
| 3.5 range of `L` | even `q=18,19`; odd `q=23,24,25` | `19.62→19>18`, `19.90→19`; `24.22→24>23`, `24.54→24`, `24.86→24` | holds from 19 / 24 | wording, Check |
| 4.1 count | `d=2,3,4,5,7`; `r=1..15`; `H=1..10⁵` | max ratio `1.0000` (`d=2`), `0.6667` (`d≥3`, `r=2`) | true | restated |
| 4.1 old count | `r=6, H=100`; `r=5, H=10⁶` | `1.0267 > 1`; `1.0000 ≤ 1` | false for `r ≥ 6` | replaced |
| 4.1 degenerate | `H=1`; `r=1`; `(3,3)` at `H=2` | `1 ≤ (2r−1)!!`; `H`; `22 ≤ 120` | ok | Checks |
| 4.1 Jensen factor | `d=3, r=3,4,5,6`; `d=5, r=2` | `18.76>15`, `109.7>105`, `801.98≤945`, `7035.7≤10395`; `2.61≤3` | needs exact `(3,3),(3,4)` | in route |
| 4.1 moment bound | `B<1`; `B≥p`; `B=1.5, r=13` | `0`; reduce `⌊B⌋ mod p`; `p−1 ≤ 25!!·1.5¹³p` | ok without `r ≤ 9B` | hypothesis dropped |
| 4.2 prime count | `𝒜={2}`; `{2,3,5}, N=100, p=1009` | `V₂=N=` bound; `446 ≤ 452.7` | ok | new bullet |
| 4.3 multiplier set | `A<2` primes; `A=5, B=3` | empty (excluded); `H=9` vs `15` | ok | Check |
| 4.4 `π(A)` lower | `A=3..58`; `A=4` | min margin `0.32`; `2 ≥ 1.676`, `A/log A = 2.885` | ok | hypothesis added |
| 4.4 Lemma A.8 | `X ≤ 100`; `100 ≤ n ≤ 10⁵` | holds; max `(π(n)−1)/n = 0.2569` | ok | in route |
| 6.6 `C₀(r)` | `r=2..15` | `10.03655`, `4.95382`, `2.27209925` | all `< C(r)` | values fixed |
| 6.7 (46)/(47) | 27 rows, `p ∈ [p₀, p₀e²⁰⁰]` | reproduce Table 1; max at `p₀` | ok | Check |
| 6.8 (58)/(59) | 27 rows | reproduce Table 3; bracket rises in 8 rows; max at `p₀` | ok as stated | Check, preamble |
| 0.3 normalised | `(1,1,1), H=2`; `Y=1, H=1`; `(1,−1)` | `1 ≤ 3.33`; `≤ 4`; `−6` vs `−8` | ok; Re-form not derived | restated |
| 0.2 / 2.2 at `N=0` | `R(x/3,3,0,0.1)`, `R(x/3,2.5,0,0.5)`; 2.2 bound | `1`, `0`; `≥ 1` | ok | domain widened |
| 3.3 Lemma 2 route | `n=1,2,3` | empty; `−0.640/−0.667`; `−0.401/−0.5` | all `> −2/n` | fixed |
| Part II: BR vs §3.5, §3.6 | coefficients | `0.2026, 0.1592 < 0.3034`; `0.2251 < 0.3034`, `2.351 < 6.5` | implied as stated | — |

## For the maintainer

- The merge order still lists ExplicitZetaBounds and ExplicitPrimeCounting before this roadmap
  (F02); the intake should move this roadmap directly after SieveMethodsAndPrimePatterns.
- ProbabilisticAndMetricNumberTheory §2.5 should cite §0.3 instead of proving its lag inequality
  (F03).
- The design now names ExplicitCharacterSumsAndSieves, Part II as the owner of nine groups of
  results; that roadmap does not exist yet. ExplicitZetaBounds, if it uses the B-process, consumes
  the Part II, not this roadmap.
- Both theorems of 4.4 now carry AnalyticNumberTheoryPartI's `RosserSchoenfeldFiniteRangeInput`;
  a consumer of McGown's table (ExplicitNumberFields) inherits it.
- New plan target id 4.2c; no target id was removed or renumbered. No suspicious instruction was
  found in the review or the sources read.
