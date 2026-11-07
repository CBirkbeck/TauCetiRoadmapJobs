# Package report: PKG-ExplicitCharacterSumsAndSieves

Files written: `packages/ExplicitCharacterSumsAndSieves/README.md` (1866 lines, Layers 0–6),
`packages/ExplicitCharacterSumsAndSieves/Suggested.lean` (475 lines, 21 theorems, 16 definitions),
`packages/ExplicitCharacterSumsAndSieves/metadata.toml` (`topic = "math.NT"`, as on main),
`packages/ExplicitCharacterSumsAndSieves/sources.toml` (two entries added, six locators widened).
`design/plan.json` is unchanged: no supplier gap is needed (its `gaps` list stays `[]`).

## Headline theorems

Stated in `Suggested.lean` (each with `sorry`):

| headline | Lean name | README |
|---|---|---|
| Kusmin–Landau, Landau's constant `cot(πθ/2)` | `kusmin_landau` | §1.1 |
| Second derivative test (Arias de Reyna Lemma 4) | `second_derivative_test` | §1.3 |
| Second derivative test, van der Corput form `A = 2.79368…` | `second_derivative_test_sqrt` | §1.3 |
| Patel's corrected third derivative test | `third_derivative_test` | §1.4 |
| Patel's fourth derivative test (with `9/5`) | `fourth_derivative_test` | §1.5 |
| Patel's fifth derivative test | `fifth_derivative_test` | §1.5 |
| Iterated van der Corput, `B = 2 + 2√2` | `iterated_vanDerCorput` | §1.6 |
| First derivative test for integer points | `first_derivative_test_points` | §2.2 |
| Second derivative test for integer points | `second_derivative_test_points` | §2.3 |
| Classical explicit Pólya–Vinogradov (primitive) | `polya_vinogradov_classical` | §3.2 |
| Pomerance's Pólya–Vinogradov | `polya_vinogradov_pomerance` | §3.4 |
| Lapkova's Lemma 3A (under `LapkovaSmallModuliVerified`) | `polya_vinogradov_lapkova` | §3.5 |
| Frolenkov–Soundararajan, nonprincipal, `q ≥ 1000` | `polya_vinogradov_frolenkov_soundararajan` | §3.6 |
| Burgess's moment bound, every `r ≥ 1` | `burgess_moment_bound` | §4.1 |
| McGown's parametric Burgess inequality (A.9) | `burgess_mcgown_parametric` | §4.4 |
| McGown's table A.1 (under `McGownTableCertificate`) | `burgess_mcgown_table` | §4.4 |
| Greaves's density-sum bound | `greaves_density_sum` | §5.2 |
| Büthe's weighted Brun–Titchmarsh, general modulus | `buthe_weighted_brun_titchmarsh` | §5.4 |
| Büthe's weighted prime sum, modulus one | `buthe_weighted_prime_sum` | §5.4 |
| Ramaré–Viswanadham prime-power sum (Lemma 14) | `ramare_viswanadham_prime_powers` | §5.5 |
| Fan's bounds (4)–(6) for `Φ(x, z)` | `fan_rough_count` | §5.6 |

Definitions kept because a headline needs them: `intervalExpSum`, `nearIntegerCount`,
`charIntervalSum`, `selbergDiagonal`, `selbergWeightMass`, `roughCount`, `butheRho`,
`LapkovaBound`, `mcgownConstant`; the Layer 6 propositions `LapkovaSmallModuliVerified`,
`MVDiagonalFiniteRange`, `ButheSmallRangeVerified`, `ButheMediumRangeVerified`, `FanFiniteRange`,
`McGownTableCertificate`; and `RosserSchoenfeldFiniteRangeInput`, a restatement (same content) of
the named input of AnalyticNumberTheoryPartI §0.5, whose Lean file does not declare it, so that the
two headlines consuming that section are statable. No declaration has another roadmap's fully
qualified name.

Not statable at the pins (named in the module docstring): Treviño's Theorems 1 and 2 with Tables
1 and 3 and Corollaries 1 and 2 (§4.5). They rest on *TrevinoTable1Certificate* and
*TrevinoTable3Certificate*, numerical inequalities on the closing displays (46)–(47) and (58)–(59)
of Treviño's induction with the parameters of his Tables 5 and 7 for every `p ≥ p₀`; those displays
are long explicit functions of eight quantities and a parameter defined by a minimum, not simple
definitions, and stating the theorems without them would assert more than the roadmap proves. The
README writes the two propositions in italics, not as Lean names.

Not headlines (README targets only): the van der Corput finite inequality (§0.3), the asymmetric
Kusmin–Landau lemma (§1.2), the reduction to exponential sums (§2.1), the Gauss-sum expansion
(§3.1), Pomerance's lemmas (§3.3), the energy counts and amplification inequality (§§4.2–4.3),
the `r = 2` refinement of the moment bound (§4.1), the diagonal-sum bounds (§5.1), Büthe's
weighted sieves (§5.3), the sifted Brun–Titchmarsh bound and the dyadic sums (§5.5).

## Elaboration

`lake env lean packages/ExplicitCharacterSumsAndSieves/Suggested.lean` from the content checkout
(pinned Mathlib `1b1ccf4b`, no Tau Ceti import needed): exit 0, **21** warnings
`declaration uses 'sorry'` (one per theorem), no other message.

Notation repair: three formula lines had exponent and subscript braces outside a one-line code
span. README §1.5 had an indented display line that opened with `+`, which reads as a list item. The
docstrings of `fifth_derivative_test` and `greaves_density_sum` had code spans that ran across a
line break. The README display now carries the `+` at the end of the previous line. Each docstring
formula is now split into code spans that close on their own line; the mathematics is unchanged.
After this edit the file was elaborated again, with the same result: exit 0, 21 `sorry` warnings,
no other message.

`#check` pass: a scratch copy of the file with `#check @name` for all 37 declarations and
`#print` for every definition was elaborated once; each elaborated type was compared with its
README statement. Findings and changes: (1) `roughCount` and `greaves_density_sum` first failed to
elaborate because a binder was inferred as `ℝ`; the binders were typed `ℕ`. (2) Every real
exponent is a real literal (`W ^ (-(1/3 : ℝ))`, never a natural-number `1/3 = 0`), and every
`2r − 1` in a real factor is real subtraction; the natural `2 * r - 1` appears only inside
`Nat.doubleFactorial` with `r ≥ 1`. (3) The `let`-bound constants of the fourth and fifth
derivative tests match the README formulas term by term. (4) No `variable` block is used; every
hypothesis is in its declaration's own signature. (5) A `@[expose] public section` was tried and
dropped: with the required plain `import Mathlib` it does not elaborate, and 131 roadmaps on main
use the plain form. (6) After the adversarial pass, Fan's inequality (5) gained the hypothesis
`8 ≤ x` in both `fan_rough_count` and `FanFiniteRange` (below); the final `#check` shows it.

## Dependency check

    depcheck: 243 roadmaps, 2457 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. Suppliers and their merge-order positions: AnalyticNumberTheoryPartI
(90), EllipticLegendreCharacterInterfaces (96), CharacterSumsOverFiniteFields (154),
SieveMethodsAndPrimePatterns (269), ExplicitPrimeCounting (271); this roadmap is at 272.
`roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.

## Corrections to the design, and what changed

1. **Duplication removal (ExplicitPrimeCounting).** The design's §5.5 corollary
   "Brun–Titchmarsh (Montgomery–Vaughan) `π(x + y; k, ℓ) − π(x; k, ℓ) ≤ 2y/(φ(k) log(y/k))`"
   (plan target 5.5b) is ExplicitPrimeCounting §0.1, `brun_titchmarsh` (open head #1945, README
   line 412, Lean line 102), earlier in the order. It is deleted here and cited in Scope and
   ownership and in a new supplier subsection. The sifted form (count of integers of the
   progression free of prime factors `≤ z`, plus `π(z)`) is kept here as the owner, with one clause
   saying how it differs: it is the form the prime-power sums need, and it is a sieve bound, the
   subject of this roadmap (ExplicitPrimeCounting's own Scope says this roadmap "plans the explicit
   sieve bounds"). ExplicitPrimeCounting is no longer listed as a downstream consumer.
2. **ExplicitNumberFields' two gaps on this roadmap are now planned.** (a) `gap:burgess-moment-estimate`:
   §4.1 states the shifted form `Σ_x |Σ_{m<h} χ(x + m)|^{2r} ≤ ((2r)!/(2^r r!)) p h^r + (2r − 1)√p h^{2r}`
   as the case `B = h` of the moment bound, and the `r = 2` refinements of mcgowntrudgian2020
   Proposition 1 as a target with a complete route. The source's route bounds a quartic quadratic
   character sum with four distinct roots by `2√p` (line 180, "genus at most `r − 1`"); the correct
   bound is `2√p + 1` (the substitution `x = −a + 1/u` gives `Σ_u χ(g(u)) − 1` with `g` a cubic,
   bounded by Hasse), and `2√p` is false for single tuples: at `p = 19`,
   `Σ_x χ((x + 1)(x + 2)(x + 4)(x + 9)) = −9`, `|−9| > 2√19 = 8.72`. The stated aggregate
   inequality is nonetheless true: the README route absorbs the `+1` in the slack of the tuples
   with a repeated value for `h ≤ 12√p − 9` and uses `W₂ ≤ h²(hp − h²) < h³p` above that; checked
   by brute force for the quadratic character and all primes `p ≤ 1200`, `1 ≤ h < p` (largest ratio
   `0.9992`, at `h = 1`). This needs EllipticLegendreCharacterInterfaces §5.1 (trace as a character
   sum) and Tau Ceti `WeierstrassCurve.hasse_bound`, both added to the supplier contracts.
   (b) `gap:polya-vinogradov-lapkova`: §3.5 states the initial-sum corollary with
   `A(q₀) = 1/(2π) + 0.8204/log q₀ + 1.0285/(√q₀ log q₀)`. The gap (and its source,
   kerrmcgowntrudgian2020 Lemma 3, line 122) prints `0.8204/√q₀`, which does not follow from
   Lapkova's Lemma 3A: at `q = q₀ = 10⁶` the printed constant gives `2211.2`, below Lapkova's odd
   bound `3020.2`, which the corrected constant reproduces exactly. ExplicitNumberFields should take
   the corrected constant (see the maintainer notes).
3. **Fan's inequality (5) is false as printed.** At `x = 7` and `4.9910 < z < 5`, `Φ(7, z) = 3`
   (`1, 5, 7`) while `7/log z − 7/(2 log² z) < 2.9982`. Fan's machine check covers integers
   `9 ≤ n < 289` (fan2022 lines 215–222) and his text claims all `3 ≤ x < 289`. The README and the
   Lean file state (5) for `x ≥ 8` (verified by hand on `[8, 9)`: right sides `3.43, 3.05, 2.92`
   against `Φ = 3, 2, 1`, and numerically for every real `x < 600`), and `FanFiniteRange` restricts
   (5) to `x ≥ 8`; without that restriction the proposition is false and `fan_rough_count` would be
   vacuous.
4. **Hypotheses made explicit.** Fan's theorem (§5.6) uses `S(z) ≥ log z + 0.89` for every
   `z ≥ 3`, which rests on `MVDiagonalFiniteRange`; the design listed it only in the layer's
   Dependencies. The sifted bound and both Ramaré–Viswanadham corollaries (§5.5) use the same bound
   through `J(Q) ≥ (φ(k)/k)(log Q + 1.07)`; all now carry `MVDiagonalFiniteRange`, in the README and
   in Lean.
5. **Frolenkov–Soundararajan's route (§3.6).** Its *Needs:* line named "the cited corollary" of an
   uncertified source. It now names §§0.4, 0.6, 3.1 and describes the route as the source's
   (smoothing the interval, the finite Fourier expansion), from the secondary descriptions
   (hunter2016 lines 646–650). See "What the README could not support".
6. **Smaller fixes.** §5.4's `ρ_I(f) > 0` bullet was false for `y = 0`; restated. §1.4's route now
   names the trivial lag sum `Σ m ≤ M²/2` that Patel's `2λ` terms use (the `s`-range of display
   (32) excludes `s = 1`). §2.3's route now cites the lines of Zhao's proof (337–371) and states the
   two trivial cases. §6.2 gained the tightest margin (`0.044` just below `z = 10`, not `0.388` at
   `z = 6`). Every definition and theorem of `Suggested.lean` is named where the README states it.
7. **Part II.** Arias de Reyna's `d`-th derivative test (Theorem 11, line 555) and the recursive
   `k`-th derivative tests of yang2024 (Lemma 2.5, line 487) and patelyang2024 (Lemma 1.4, line 150)
   were planned nowhere (the target's literature addendum recommends them); they are added to the
   Part II list so that they have an owner.

Review notes applied: the reviewer's Scope remark (SieveMethodsAndPrimePatterns §1.1 owns the
qualitative diagonal-sum asymptotics; §5.1 here is a kept variant differing in explicitness) is now
one clause in Scope and ownership; the eight Layer 6 names are declared in `Suggested.lean` or, for
the two Treviño certificates, written in italics. F02 (merge order) and F03
(ProbabilisticAndMetricNumberTheory must cite §0.3) remain maintainer actions (below).

## What the README could not support

- frolenkovsoundararajan2013 is uncertified: its Theorem 1 (the bound for periodic functions on
  which §3.6 rests) could not be read, so it is not stated as a target with exact hypotheses. §3.6
  is stated from tmeemt-art15 lines 106–109 (quoting Corollary 1) and hunter2016 lines 651–664, and
  its route is described at the level those texts support. Numerically it holds with room (largest
  ratio `0.40` on 150 characters modulo `1009, 1013, 1019`, and `5 ≤ 196.8`, `8 ≤ 288.9` for two
  highly imprimitive characters).
- montgomeryvaughan1973 (uncertified): the sifted form of §5.5 and its choice of `z` are taken from
  ramareviswanadham2021 lines 660–666 and fan2022 lines 185–187.
- lapkova2018's proof beyond the statement and the split `q ≤ 25`/`q > 25` was not followed;
  `LapkovaSmallModuliVerified` was instead verified directly (below).

## Notions moved down from later roadmaps

None. The two ExplicitNumberFields gaps are requests from a later roadmap, planned here as asked.

## Ownership against open pull requests

Checked with `roadmaps grep` over main and the 475 open heads, and by reading the closest roadmaps'
scopes (SieveMethodsAndPrimePatterns #1495, CircleMethodThreePrimes #1803 via the earlier review,
AnalyticNumberTheoryPartI #1126, CharacterSumsOverFiniteFields #1712,
ProbabilisticAndMetricNumberTheory #1421) and the three explicit siblings, now open as #1944
(ExplicitNumberFields), #1945 (ExplicitPrimeCounting) and #1946 (ExplicitMultiplicativeFunctions).
Kusmin–Landau, derivative tests, Pólya–Vinogradov, Burgess, Büthe, Greaves, Lapkova, Pomerance and
"free of small prime factors" have no other owner, except the duplications listed for the
maintainer. Every cited section was resolved at its head: ExplicitPrimeCounting §0.1 (README line
412), EllipticLegendreCharacterInterfaces §5.1 (line 593 of #1545), CharacterSumsOverFiniteFields
§4.7 (line 1391), SieveMethodsAndPrimePatterns §§1.1, 1.3, 1.6, 2.9, 5.2 (lines 992, 1173, 1463,
2317, 3334), AnalyticNumberTheoryPartI §§0.5, 0.8, 0.19, 0.20 (lines 253, 292, 564, 574), 0.34,
1.5a, ProbabilisticAndMetricNumberTheory §2.5 (line 2694, the difference theorem at 2749) and §2.7.
`roadmaps overlaps`: no open pull request changes this roadmap; no cited id is dropped.

## For the maintainer

- **Order of supply.** ExplicitPrimeCounting (271) consumes ExplicitZetaBounds (270) and now
  supplies this roadmap (272), so ExplicitZetaBounds → ExplicitPrimeCounting →
  ExplicitCharacterSumsAndSieves is forced; the earlier suggestion to move this roadmap before
  ExplicitZetaBounds (review F02) is no longer possible. ExplicitZetaBounds (no design yet) expects
  the derivative tests of Layer 1 from this roadmap; when it is designed it must either own them
  (and this roadmap then cites it) or the derivative tests must move to a roadmap before it. This
  README therefore does not list ExplicitZetaBounds as a consumer.
- **ProbabilisticAndMetricNumberTheory §2.5** proves the finite lag inequality that §0.3 owns; it
  should cite §0.3 (review F03).
- **ExplicitMultiplicativeFunctions (#1946)**, later in the order: its §7.4 (README line 2738)
  states and proves the Kusmin–Landau inequality and a second derivative test inside a target;
  they should cite §§1.1 and 1.3 here. Its §7.2 explicit asymptotics for `Σ_{d ≤ D} μ²(d)/φ(d)` are
  the object of §5.1 here (different error term and range): it should cite §5.1 and say how its
  bound differs.
- **ExplicitNumberFields (#1944)**: its `gap:polya-vinogradov-lapkova` text (README line 497)
  should read `0.8204/log q₀` (point 2b above).

## Sources

Fetched through the sources service: `mcgowntrudgian2020` (arXiv:1904.12373v1, certified) and
`kerrmcgowntrudgian2020` (arXiv:1908.11497v1, certified), the sources of ExplicitNumberFields'
gaps, recorded under the keys that roadmap's manifest uses. Locators widened: ariasdereyna2024
(Theorem 11), yang2024 (Lemma 2.5), patelyang2024 (Lemma 1.4); `cited_for` updated for
montgomeryvaughan1973 and fan2022. No text was missing; no `needs-references.toml` was written.
Uncertified and waived keys are cited by locator only.

Source issues found (beyond the review's list): mcgowntrudgian2020 Proposition 1 proof, line 180
(the genus remark gives `2√p + 1`, not `2√p`; the stated bound survives, point 2a);
kerrmcgowntrudgian2020 Lemma 3, line 122 (`0.8204/√q₀` should be `0.8204/log q₀`, point 2b);
fan2022 inequality (5), lines 160–161 and 215–222 (false at `x = 7`, `4.991 < z < 5`, point 3).

No passage in the review, the sources or the other roadmaps asked for anything outside this job.

## Adversarial pass

Brute-force scripts (scratch only) computed the values below; "ratio" is left side over right side.

| statement | instances tried | values computed | result | change |
|---|---|---|---|---|
| `intervalExpSum` | `f ≡ 0` on `[0,2]`, `[0.2,0.8]`; `x/2` on `[0,3]`, `[0,2]`; `[0.5,2.5]` | `3`; `0`; `0`; `1`; terms `n = 1, 2` | as stated | Check added |
| `nearIntegerCount` | `x/3`, `a = 0`, `N = 6`, `δ = 0.1`; `a = N = 1`, `δ = 1/3`; `N = 0` | `3`; `0` (strict); `1` and `0` | as stated | — |
| `kusmin_landau` | `x/2` on `[0,2]`; 20 000 random quadratics; `a = b` | `1 = cot(π/4)`; max ratio `0.99999`; vacuous (`derivWithin` on a point is `0`, `θ ≤ −k ≤ 1 − θ` impossible) | sharp, true | — |
| `second_derivative_test` | `x²/200` on `[0,10]`; 4000 random cubics; `λ = 0` | `50.49`; max ratio `0.239`; excluded | true | — |
| `second_derivative_test_sqrt` | `A`; 4000 random cubics, `b − a ≥ 1` | `A = 1.128379 · 2.475838 = 2.79368`; max ratio `0.252` | true | — |
| `third_derivative_test` | `W = λ = η = 1`; reading of `W^{±1/3}`; route recomputed | `α₃ = 6.70218`, `β₃ = 16.036`; `W^{+1/3}` would give an `L²` term; terms of (26) reproduce `α₃`, `β₃` | matches source | route names `Σ m ≤ M²/2` |
| `fourth/fifth_derivative_test` | lag coefficients; `β₄` factor | `72/91, 72/55, 9/5, 392/435, 392/351, 98/78, 392/275`; proof (35) line 263 has `18/10` | as design | — |
| `iterated_vanDerCorput` | `d = 1, H = 1`; `d = 1, H = Y = 2, f ≡ 0`; 1500 random `d ≤ 2` | `T = 0`, bound `4.83 ≥ 2`; `1 ≤ 3.41`; max ratio `0.368` | true; sign `f(x+a) − f(x)` | Check added |
| `first_derivative_test_points` | `x/10` on `[0,20]`, `δ = 0.05`; 20 000 random linear `f` | `3 ≤ 10`; max ratio `0.455` | true | — |
| `second_derivative_test_points` | `x²/100`, `N = 50`, `δ = 0.01`; 20 000 random quadratics | `6 ≤ 227`; max ratio `0.071` | true | Check added |
| `polya_vinogradov_classical` | all primitive `χ`, `3 ≤ q ≤ 47`; `q = 3, 5`; `q = 1` | max ratio `0.746`; `1 < 1.579`, `2 < 2.462`; `q ≥ 2` needed (trivial `χ` mod 1 is primitive) | true | — |
| `polya_vinogradov_pomerance` | same family | max ratio even `0.478`, odd `0.571`; `q = 3`: `2.087`; `q = 5`: `4.515` | true | — |
| `LapkovaSmallModuliVerified` | all 123 primitive `χ`, `2 ≤ q ≤ 25` | max ratio `0.680` (odd quadratic mod 23, `M = 5 ≤ 7.356`) | true | Check added |
| `polya_vinogradov_lapkova` corollary `A(q₀)` | `q₀ = 10⁶`, `1200`, `3` | `0.21861` (`3020.2` = Lapkova), printed form `0.16005` (`2211.2`); `0.27905`; `1.4464` | printed form unsupported | corrected constant |
| `polya_vinogradov_frolenkov_soundararajan` | 150 chars mod `1009, 1013, 1019`; induced mod `2310`, `4620`; `χ = 1` | max ratio `0.397`; `5 ≤ 196.8`, `8 ≤ 288.9`; principal unbounded | true | Checks added |
| `burgess_moment_bound` | all nonprincipal `χ`, `5 ≤ p ≤ 37`, `r ≤ 5`, `⌊B⌋ ≤ p + 2`; `r = 1` | max ratio `0.836`; `⌊B⌋p − ⌊B⌋²` exact (`p = 7`, `B = 2`: `10 ≤ 24.6`) | true | — |
| §4.1 `r = 2` refinement | quadratic, `p ≤ 1200`, `h < p`; per-tuple bound at `p ≤ 29`; `p = 7`, `h = 2` | max ratio `0.9992` (`h = 1`); per-tuple max `9 > 2√19` at `p = 19`; `W₂ = 34` vs `98.3`; cubic `22` vs `121.4` | aggregate true, source's per-tuple step false | route repaired |
| `burgess_mcgown_parametric` | `d = 4`; `A = 4` prime count | `(A.2)` undefined; `π(4) = 2 ≥ 1.676`, `A/log A = 2.885` fails | as stated | — |
| `McGownTableCertificate` | all 14 rows | `C₀(2) = 10.03655 < 10.0366`, …, `C₀(8) = 2.27209925 < 2.2721`, `C₀(15) = 1.76994 < 1.77`; (A.1) `1093.2 ≥ 1056` … `166 280.6 ≥ 7920` | true | — |
| `greaves_density_sum` | `κ ≡ 1, z = 3, s = 2`; 300 random `κ ≤ 3`, `z ≤ 40`; `z = 2` | `0.749 ≤ 2`; max rhs/lhs `0.986`; `P = 1`, `1 ≥ rhs` | true | — |
| `MVDiagonalFiniteRange` | every jump point `6 ≤ z < 2·10⁶` | min margin `0.044` at `z → 10⁻` (`3.4167` vs `3.3726`) | true on that range | Check added |
| `buthe_weighted_brun_titchmarsh` | `f ≡ 1`: 20 000 random `k ≤ 40`, `k < y ≤ 30k`; `[0,10]` | max ratio `0.350` (3-form), `0.135` (vLR form); `4 < 13.03` | true | Check added |
| `buthe_weighted_prime_sum` | `f ≡ 1`, 20 000 random intervals `y ≤ 300`; `[1.9, 5.1]` | max ratio `0.617`; `3 < 5.50` | true | Check added |
| `ButheSmallRangeVerified` | grid step `0.001` on `(1,101)`, `1` on `[101, 20000)`, `z` among primes `< 200` | witness found everywhere; `Y = 100`, `z = 7`: `42.86 < 43.43` | true on grid | Check added |
| `butheRho` | `f ≡ 1`; tent; `y = 0`; `f = 0` | `y`; `y/6`; `0`; `0/0 = 0` | design bullet false at `y = 0` | restated |
| `ramare_viswanadham_prime_powers` | 3000 random `d ≤ 30`, `B ≤ 40d`, `A ≤ 5B`; `A = B = 10`; `d = 3, A = B = 30` | max ratio `0.489`; `4.25 ≤ 8.69`; `3.5 ≤ 13.03` | true | Checks added |
| `fan_rough_count` (4), (6) | every real `x < 600`, `z` at primes, just below primes and at `√x`, `x^{2/5}` | max ratio `0.732`, `0.915` | true | — |
| `fan_rough_count` (5) | same grid | ratio `1.00055` at `x = 7`, `z → 5⁻` (`3 > 2.9981`); `x ∈ [7, 7.0043)` only | **false as printed** | `x ≥ 8` added |
| `FanFiniteRange` | as (5) | would be false at `x = 7` | fixed | `x ≥ 8` in (5) |
| `RosserSchoenfeldFiniteRangeInput` | `x = 59` | `16.24 < 17 < 19.79` | true at the end point | — |
| Context (all) | each declaration's signature | no `variable` block; all binders explicit; real literals in every exponent | — | — |
