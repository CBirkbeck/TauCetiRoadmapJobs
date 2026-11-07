# Port report: PORT-ExplicitCharacterSumsAndSieves

- Branch: `roadmap/explicit-character-sums-and-sieves`, from `eaf17b1`.
- Head commit: `0655dd7e86e49ceb885fa9954c0c2b8a153aa328`
  ("ExplicitCharacterSumsAndSieves: roadmap (README, Suggested.lean, metadata)").
- Files: `TauCetiRoadmap/ExplicitCharacterSumsAndSieves/README.md` (1886 lines),
  `TauCetiRoadmap/ExplicitCharacterSumsAndSieves/Suggested.lean` (475 lines, 21 theorems, 16
  definitions), `TauCetiRoadmap/ExplicitCharacterSumsAndSieves/metadata.toml` (`topic = "math.NT"`,
  the one-key form of every folder on main). Nothing outside the folder is touched.

Build (`lake build TauCetiRoadmap.ExplicitCharacterSumsAndSieves.Suggested`, on the committed tree):

    Build completed successfully (18239 jobs).

21 warnings, all `declaration uses 'sorry'` (one per theorem), no other message.

Gate (`gate … ExplicitCharacterSumsAndSieves --base origin/main`, after the commit):

    gate ExplicitCharacterSumsAndSieves: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Dependency direction (`gate --depcheck … --movable`):

    depcheck: 243 roadmaps, 2457 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve` on the ported README: no cross-roadmap
citation and no Lean name found nowhere.

## Draft pull request body

This roadmap builds the numerically explicit inequalities of analytic number theory that the later
explicit roadmaps quote as tools, each proved with the constant its source states: the derivative
tests for exponential sums `Σ e(f(n))` (Kusmin–Landau with Landau's sharp constant `cot(πθ/2)`,
Arias de Reyna's second derivative test, Patel's corrected third, fourth and fifth derivative tests,
and the iterated van der Corput inequality with `B = 2 + 2√2`); the first and second derivative tests
for integers at which `f(n)` lies near an integer; the explicit Pólya–Vinogradov inequalities of
Pomerance, Lapkova and Frolenkov–Soundararajan from the Gauss-sum expansion; Burgess's moment bound
from Weil's bound (with McGown–Trudgian's `r = 2` refinement through Hasse's bound) and the
explicit Burgess inequalities of McGown and Treviño for a prime modulus; and the explicit sieve upper
bounds of Montgomery–Vaughan, Ramaré–Viswanadham, Büthe, Greaves and Fan, with explicit lower bounds
for Selberg's diagonal sums. It consumes Mathlib's Dirichlet characters, Gauss sums, `SelbergSieve`
carrier and `Real.fourierChar`, Tau Ceti's primitive Gauss-sum norm, partial-sum lemmas and Hasse
bound, and the large sieve, Weil bound, character-sum point count, Rosser–Schoenfeld estimates and
Brun–Titchmarsh inequality of five earlier roadmaps; every table or finite verification enters as a
named proposition (Layer 6) from which the analytic argument is proved, and `Suggested.lean` states
the 21 headline theorems against the pinned Mathlib with no Tau Ceti import. Its consumers are
ExplicitNumberFields (least primitive roots and norm-Euclidean fields need the Burgess and
Pólya–Vinogradov constants), ProbabilisticAndMetricNumberTheory (van der Corput's finite lag
inequality) and a Part II, whose list of explicit results (the B-process, uniform `k`-th derivative
tests, Bordignon–Kerr, Booker, composite-modulus Burgess, dimension-two sieves) is in Scope and
ownership.

AI-assisted port and mathematical self-review by Claude (Opus 5.5). The accepted scope, layer
structure and Layer 6 hypotheses are retained.

## Roadmaps this one depends on that are still pull requests

All five roadmap suppliers are open pull requests that add a new folder, each earlier in the merge
order (positions in `merge-order/ORDER.txt`; this roadmap is at 272):

- AnalyticNumberTheoryPartI (90): §§0.5, 0.8, 0.19, 0.20.
- EllipticLegendreCharacterInterfaces (96): §5.1.
- CharacterSumsOverFiniteFields (154): §4.7 (`weil_mulChar_sum_bound`).
- SieveMethodsAndPrimePatterns (269): §1.3, §2.9.
- ExplicitPrimeCounting (271): §0.1 (`brun_titchmarsh`).

No citation depends on an id that only an open revision defines; no open pull request drops an id
cited here (scratch `overlaps.md`: none, and none found by reading the heads).

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already had the acceptance-test form: 21 headline theorems,
each with `sorry`, and only the definitions they need (the carriers `intervalExpSum`,
`nearIntegerCount`, `charIntervalSum`, `selbergDiagonal`, `selbergWeightMass`, `roughCount`,
`butheRho`, the constant table `mcgownConstant`, `LapkovaBound`, the six Layer 6 propositions and
`RosserSchoenfeldFiniteRangeInput`). No sorry'd data, no `set_option`, no `example`, no `variable`
block. Two Lean changes only:

- the docstring of `fan_rough_count` misstated the counterexample at `x = 7` (see fix 4 below);
- the `module` header is kept: without it Lake reports a second, non-`sorry` warning ("imports
  `Mathlib` … designed for use with the module system"), which I confirmed by building both forms.
  With `module` and the plain `import Mathlib` that the gate requires, the declarations elaborate as
  `private` (the form of 5 `Suggested.lean` files on main, e.g. `TauCetiRoadmap/HeegaardFloer`);
  nothing imports this file.

No headline statable at the pins was missing. Treviño's Theorems 1–2 and Corollaries 1–2 stay out,
as the module docstring says: they rest on *TrevinoTable1Certificate* and *TrevinoTable3Certificate*,
long closing displays of his induction evaluated for every `p ≥ p₀`.

## Supplier replacements and duplication removals

- Two facts the README stated in prose are now cited to Tau Ceti at the pin:
  `DirichletCharacter.IsPrimitive.eq_one_iff` (`TauCeti/NumberTheory/DirichletCharacter/Conductor.lean`
  line 25; a primitive character is principal exactly at level 1), used in the Layer 3 preamble,
  and `DirichletCharacter.even_of_le_two` (`TauCeti/NumberTheory/DirichletCharacter/Even.lean` line 77),
  replacing a sentence in the Mathlib contract. Both added to "From Tau Ceti".
- No duplication removal was needed. Sweep by object over main and the 475 open heads with
  `roadmaps grep` (Kusmin–Landau, derivative tests, van der Corput, Pólya–Vinogradov, Burgess,
  Brun–Titchmarsh, multiplicative energy, `μ²/φ` diagonal sums, rough numbers `Φ(x, z)`, integer
  points near curves, Fejér kernel, Lapkova/Treviño/McGown/Pomerance/Büthe/Greaves) and by reading
  the sibling heads: no roadmap earlier in the order owns any object owned here. CharacterSumsOverFiniteFields
  explicitly leaves incomplete sums (Pólya–Vinogradov, Burgess, Weyl differencing) to the analytic
  roadmaps (its README line 253); SieveMethodsAndPrimePatterns has only qualitative Brun–Titchmarsh
  and diagonal sums (§§1.1, 1.6); CircleMethodThreePrimes (not in the merge order) uses Mathlib's
  `Real.fourierChar` as this roadmap does.
- `RosserSchoenfeldFiniteRangeInput` stays restated in `Suggested.lean`: AnalyticNumberTheoryPartI
  §0.5 defines it in prose (its README line 257 at the head) but its `Suggested.lean` does not declare
  it, and a roadmap module cannot be imported. The name lives in this roadmap's namespace, so no
  declaration has another roadmap's fully qualified name.
- Later roadmaps that duplicate objects owned here (for the maintainer; nothing to change here,
  this roadmap is earlier): ExplicitMultiplicativeFunctions §7.4 states and proves the Kusmin–Landau
  inequality and a second derivative test inside a target (its README lines 2735–2737; should cite
  §§1.1, 1.3); its §7.2 proves explicit asymptotics for `Σ μ²(d)/φ(d)` (Ramaré, Akhilesh–Ramaré;
  lines 2606–2620), the object of §5.1 here with sharper constants (should cite §5.1 and say how
  it differs); ProbabilisticAndMetricNumberTheory §2.5 still proves `finite_lag_inequality` (its
  README lines 2756–2757; should cite §0.3).

## Fixes from the reviewer reread

Each was found by recomputation (scripts in the job scratch, values below):

1. §3.1 Check, Gauss-sum convention: the claim that the `τ(χ)` and `τ(χ⁻¹)` versions differ "by the
   factor `χ(−1) = −1`" for the quartic character modulo 5 is false. With `χ(2) = i`,
   `τ(χ) = −1.1756 + 1.9021i`, `τ(χ⁻¹) = 1.1756 + 1.9021i`, product `−5`, ratio
   `τ(χ)/τ(χ⁻¹) = (1 + 2i)/√5`; the Check now states these values.
2. §2.1 Checks and Layer 2 Examples: `4N/H` at `N = 4`, `H = 2` is `8`, not `8/2`; the right sides
   are `28` (not `24`) for `f ≡ 0` and `20` (not `16`) for `f = x/2`.
3. §4.1 Check on degenerate tuples: "for even `d` … `8` tuples" holds only for `d = 2`; for
   `d = 4, 6` (indeed every `d ≥ 3 > r = 2`) the count in `{1, 2}⁴` is `6` (brute force). The proof
   route's use of even `d` is an upper bound and was already correct.
4. §5.6 Check and the `fan_rough_count` docstring: on `4.9910 < z < 5` the right side of Fan's (5)
   at `x = 7` decreases from `3` (at `log z = (7 + √7)/6`, `z = 4.99103…`) to `2.9982`; it is
   below `3 = Φ(7, z)`, not below `2.9982` (at `z = 4.995` it is `2.99917`). Also `3.43` → `3.42` for
   the minimum `3.4265` on `[3, 5)` at `x = 8`.
5. §6.4 Check: "forces `z` of the order of `√Y/log Y`" (`= 14.3` at `Y = 20000`) is wrong: `z = 14`
   gives `5026.2 > 4039.0`; every witness at `Y = 20000` lies in `[57, 85)`, e.g. `z = 65`:
   `3655.3 + 330.0 + 18 = 4003.3`. Replaced by these values.
6. §1.4 route: "the trivial `Σ_{m ≤ M} m ≤ M²/2`" is false (`M(M + 1)/2`); the lags are `m < M`,
   and the statement is now `Σ_{1 ≤ m < M} (1 − m/M) m ≤ M(M − 1)/2 ≤ M²/2`; "for each lag
   `m < L`" corrected to `1 ≤ m < M`.
7. Layer 3 Examples: `2.462` is the cosecant-sum bound of §3.1, not "the classical bound"; the
   closed form of §3.2 at `q = 5` is `2.682`. Both are now named.
8. Scope: "its exact refinement at `r = 2`" → "McGown–Trudgian's refinement of it at `r = 2`" (the
   refinement is an inequality, not exact).
9. Mathlib contract: `quadraticChar` is at line 120 of `QuadraticChar/Basic.lean` (line 207 is
   `quadraticChar_ne_one`).

## Citations resolved at the heads and pins

- SieveMethodsAndPrimePatterns (head `39cf901`): §1.1 line 991, §1.3 line 1172 (bold targets
  "Selberg optimal weights", "Selberg upper-bound sieve": `λ_z(1) = 1`, `|λ_z| ≤ 1`, strict cutoff,
  main term `1/G`), §1.6 line 1462 (qualitative interval/progression bounds, twin/Goldbach), §2.9
  line 2316 with the bold "Large sieve for forbidden residues" (`J(Q)|Σaₙ|² ≤ (H − 1 + Q²)Σ|aₙ|²`,
  `Q, H ≥ 1`), §5.2 line 3333.
- CharacterSumsOverFiniteFields (head `b408a45`): §4.7 line 1390, `weil_mulChar_sum_bound` with
  `χ ≠ 1`, `f ≠ 0`, `f ≠ c·h^{ord χ}`, bound `(m − 1)√q` (Lean line 313); §7.1 line 1875, quartic
  check `τ(χ)τ(χ⁻¹) = −5`.
- EllipticLegendreCharacterInterfaces (head `2b50d7a`): §5.1 line 592, point count
  `q + 1 + Σ quadraticChar(f(x))`, trace `−Σ`, singular equations included, odd characteristic.
- AnalyticNumberTheoryPartI (head `2b9b7af`, read with `roadmaps show`): §0.5 line 253 (named input
  for `59 ≤ x < exp 10000`), §0.8 line 292 (`x ≥ 319`), §0.19 line 564 (`x ≥ 286`), §0.20 line 574,
  §0.34 line 805, §1.5a line 979 (constant `3π/2`).
- ExplicitPrimeCounting (head `98329b3`): §0.1 line 411, `brun_titchmarsh` (Lean line 101) for real
  `x, y > 0`, coprime `k, l`, `y > k`.
- ProbabilisticAndMetricNumberTheory (head `e4c4e53`): §2.5 line 2693 (difference theorem 2749,
  finite lag inequality 2756), §2.7 line 3086 (`erdos_turan`). Cited only in Scope and Downstream
  consumers; it is later in the order.
- Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9` (the manifest pins): every declaration of the supplier
  contracts opened at its file and line; the only correction is fix 9. Neither pin has a large
  sieve, Pólya–Vinogradov, Burgess, Kusmin–Landau, Brun–Titchmarsh or van der Corput inequality
  (grep of both trees; the only "Burgess" hits are J. P. Burgess in descriptive set theory).

## Signature pass

A scratch copy of `Suggested.lean` with `#check @name` for all 37 declarations and `#print` for all
16 definitions was elaborated once (`lake env lean`, exit 0, 21 `sorry` warnings). Each elaborated
type was compared with its README statement: every hypothesis is in the declaration's own signature
(the file has no `variable` block), every real exponent is a real literal, `2r − 1` is real
subtraction in real factors and natural only inside `Nat.doubleFactorial` with `r ≥ 1`, and the
`let`-bound constants of the fourth and fifth derivative tests match the README term by term.
Nothing changed: the elaborated types equal the package's.

## Ownership against open pull requests

Checked: the sibling heads given in the brief (ExplicitMultiplicativeFunctions, ExplicitPrimeCounting,
ExplicitNumberFields, SieveMethodsAndPrimePatterns, CharacterSumsOverFiniteFields,
EllipticLegendreCharacterInterfaces, ProbabilisticAndMetricNumberTheory), AnalyticNumberTheoryPartI
and CircleMethodThreePrimes through `roadmaps show`, and all 475 open heads through `roadmaps grep`.
This roadmap owns its objects as listed in Scope and ownership; the later duplicates are listed above.
It is the owner because no earlier roadmap states them and its consumers (ExplicitNumberFields,
ExplicitMultiplicativeFunctions, ProbabilisticAndMetricNumberTheory) are all later.

## Adversarial mathematics pass

"Ratio" is left side over right side. All values recomputed for this port.

| statement | instances tried | values computed | result | change |
|---|---|---|---|---|
| `intervalExpSum` | `f ≡ 0` on `[0,2]`, `[0.2,0.8]`; `x/2` on `[0,3]`, `[0,2]` | `3`; `0`; `0`; `1` | as stated | — |
| `nearIntegerCount` | `x/3`, `a = 0`, `N = 6`, `δ = 0.1`; `a = N = 1`, `δ = 1/3` | `3`; `0` (strict) | as stated | — |
| §0.3 vdC inequality | `b = (1,1)`, `H = 2`; `(1,−1)`; `(1)`, `H = 3`; normalised `(1,1,1)` | `16 ≤ 18`; `0 ≤ 6`; `9 ≤ 9`; `1 ≤ 3.33` | true | — |
| §0.4/0.5/0.6 identities | quadratic mod 5; principal mod 3, 6; `χ₄` lifted to 12 | `S(1,2) = −2`, `M = 2`; `S(0,6) = 4 > M = 2`; `6−3−2+1 = 2`; `1 + 1 = 2` (`0` without `χ*(d)`) | true | — |
| `kusmin_landau` | `x/2` on `[0,2]`; 3000 random quadratics; `a = b` | `1 = cot(π/4)`; max ratio `0.9976`; vacuous (`θ ≤ −k ≤ 1−θ` impossible) | true, sharp | — |
| `second_derivative_test` | `x²/200` on `[0,10]`; `λ = Λ = 10⁻⁴` on `[0,10⁴]`; 1500 random cubics; `λ > π/4` | `6.24 ≤ 50.49`; `100.7 ≤ 681.0`; max ratio `0.242`; `λ + 4√(λ/π) ≥ 2.785` covers the trivial range | true | — |
| `second_derivative_test_sqrt` | `A`; same families | `A = 2.793684`; `6.24 ≤ 58.67`, `100.7 ≤ 838.1`; max ratio `0.208` | true | — |
| `third_derivative_test` | `W = λ = η = 1`; `x³/(6W)`, `W = 10⁵, 10⁶, 10⁸`, `L ≤ 10⁵`, shifted `N` | `α₃ = 6.70215`, `β₃ = 16.03604`; `|S|² = 21754 ≤ 3.44·10⁸` etc. | true | — |
| §1.4 lag sum (32) and trivial sum | `M ≤ 399`, `s ∈ (−1,1)` step `0.01`; `Σ_{m ≤ M} m` | max ratio `0.99999` (`s → 1`); `Σ_{m ≤ M} m = M(M+1)/2 > M²/2` | (32) true; trivial sum misstated | fix 6 |
| `fourth/fifth_derivative_test` | `x⁴/(24W)`, `W = 10¹², 10¹⁴`; `x⁵/(120W)`; lag coefficients | `1.07·10⁶ ≤ 1.12·10¹⁰`, `8.8·10⁶ ≤ 2.4·10¹⁰`; `10¹⁰ ≤ 1.7·10¹²`; `72/91, 72/55, 9/5 (s = −1/3), 392/435, 392/351, 49/39, 392/275` | true | — |
| `iterated_vanDerCorput` | `d = 1, H = Y = 2, f ≡ 0`; `d = 1, H = 1`; 600 random `d ≤ 2`, `H ≤ 6`; property of `B` | `1 ≤ 3.414` (`T = 1/4`); `0.2 ≤ 4.83`; max ratio `0.422`; `28 ≤ 28.97`, `B = 4.5`: `28 > 27`, `(B²−4)(B−4) = 16` | true; `B` least | — |
| §2.1 Fejér reduction | `f ≡ 0`, `x/2`, `N = 4`, `δ = 0.1`, `H = 2`; constant | `5 ≤ 28`; `3 ≤ 20`; `(sin(π/4)/(π/4))² = 0.8106` | true; Check values wrong | fix 2 |
| `first_derivative_test_points` | `x/10` on `[0,20]`, `δ = 0.05`; 3000 random near-linear `f`; product algebra of the route | `3 ≤ 10`; max ratio `0.435`; `(c₁λ₁N + 2δ + 1)(2δ/λ₁ + 1) ≤` bound for `δ ≤ 1/4` | true | — |
| `second_derivative_test_points` | `x²/100`, `N = 50`, `δ = 0.01`; random quadratics/cubics with `Nλ ≥ c⁻¹` | `6 ≤ 227.4`; max ratio `0.058` | true | — |
| `polya_vinogradov_classical` | all 430 primitive `χ`, `3 ≤ q ≤ 47`; `q = 3, 5` | max ratio `0.746` (`q = 5`, `2 < 2.682`); `1 < 1.579` | true | Examples reworded (fix 7) |
| `polya_vinogradov_pomerance` | same family; `q = 3`, `5` | max ratio even `0.478` (`q = 37`), odd `0.571` (`q = 47`); `2.087`, `4.515` | true | — |
| `LapkovaSmallModuliVerified`, `polya_vinogradov_lapkova` | all primitive `χ`, `2 ≤ q ≤ 25`; rounded forms at `q = 980/979`, `33/32`; `A(10⁶)` | `123` characters, none at `q = 2, 6, 10, 14, 18, 22`; max ratio `0.680` (odd quadratic mod 23, `5 ≤ 7.356`); `31.304 ≤ 31.305`, `5.741 ≤ 5.745`, `5.669 > 5.657`; `A = 0.218612`, `A√q log q = 3020.2` = odd bound | true | — |
| `polya_vinogradov_frolenkov_soundararajan` | induced characters mod `2310` (from mod 3) and `4620` (from `χ₄`); `q = 1000`, `10⁴` | `M_χ = 5 ≤ 196.75`, `8 ≤ 288.86`; `123.5`; `442.4` vs §3.5's `283.0` | true | — |
| §3.1 Gauss expansion | quadratic mod 3; quartic mod 5, `n = 0..4` | `τ = i√3`; identity holds for all `n` with `τ(χ⁻¹)`, fails for `n ≠ 0` with `τ(χ)`, ratio `(1+2i)/√5` | Check's `χ(−1)` claim false | fix 1 |
| `burgess_moment_bound` | all nonprincipal `χ` mod `5 ≤ p ≤ 23`, `1 ≤ r ≤ 4`, `B ∈ {H, H + 1/2}`, `1 ≤ H ≤ p + 2`; `r = 1` | max ratio `0.791` (`p = 23`, `r = 1`, `B = 1`); `r = 1`, `p = 7`, `H = 2`: `10 = Hp − H²` for all five characters | true | — |
| §4.1 degenerate tuples | `r = 2, H = 2`, `d = 2..6`; `d = 3`, `r = 3`, `H ≤ 3`; `d = 3`, `r = 4`, `H ≤ 2`; `r = 6`, `H = 100` | `8, 6, 6, 6, 6`; `1, 22, 99` = formula; `1, 86` = formula; `1.06721·10¹⁶` (every value twice) vs `11!!·10¹² = 1.0395·10¹⁶` vs even-multiplicity `9.3976·10¹⁵` | Check wrong for even `d ≥ 4` | fix 3 |
| §4.1 `r = 2` refinement | quadratic `χ`, primes `p < 200`, `1 ≤ h < p`; `p = 7`, `h = 2`, quadratic and cubic; per-tuple bound at `p = 19` | max ratio `0.995`; `W₂ = 34 ≤ 98.33`, `22 ≤ 121.37`; `Σχ((x+1)(x+2)(x+4)(x+9)) = −9`, `|−9| > 2√19 = 8.718` | aggregate true; source's per-tuple step false (route already repaired) | — |
| §4.2 energy | `A = 28, N = 400, p = 10⁷`; primes `{2,3,5}`, `N = 100`, `p = 1009` | `88,447`; `V₁ = 300`, `V₂ = 446 ≤ 452.7` (brute force) | true | — |
| `McGownTableCertificate`, `burgess_mcgown_*` | all 14 rows | `C₀(2) = 10.03654994 < 10.0366`, …, tightest `C₀(8) = 2.27209925 < 2.2721`, `C₀(15) = 1.76993882 < 1.77`; (A.1) `1093.2 ≥ 1056`, …, `166280.6 ≥ 7920` | true | — |
| `selbergDiagonal`, `MVDiagonalFiniteRange` | `S(6)`, `S(5.99)`, `S(10)`; all left limits on `(6, 10⁶]`; `S₆(7)` | `3.25 ≥ 2.8618`; `2.75`; `3.667`; min margin `0.04408` at `z → 10⁻`; `1.4167 ≥ 1.1389` | true on the range tested | — |
| `selbergWeightMass` | `H₁(1), H₁(2), H₁(3)` | `1, 4, 6` | as stated | — |
| `greaves_density_sum` | `κ ≡ 1`, `z = 3`, `s = 2`; 200 random `κ ≤ 3`, `z ≤ 30`, `B`, `s` | `B = 0.31546`, `2 ≥ 0.74896`; max rhs/lhs `0.989` | true | — |
| `buthe_weighted_brun_titchmarsh` (`f ≡ 1`, `ρ = y`) | 20 000 random `k ≤ 30`, `x ≤ 3000`, `k < y ≤ 30k` | max ratio `0.152` (vLR form), `0.359` (3-form) | true | — |
| `buthe_weighted_prime_sum` (`f ≡ 1`) | 20 000 random `x ≤ 3000`, `1 < y ≤ 300`; `[1.9, 5.1]` | max ratio `0.610`; `3 < 5.502` | true | — |
| `ButheSmallRangeVerified` | `Y = 100`, `z = 7`; `Y = 20` with `z = 1, 2, 7` | `42.857 < 43.429`; `21`, `13 < 13.352`, `24.571` | true where tested | — |
| `ButheMediumRangeVerified` | `Y = 20000`, all integers `z ≤ 5000` | witnesses exactly in `[57, 85)`; `z = 65`: `4003.3 < 4039.0`; `z = 14`: `5026.2` | true at `Y = 20000`; Check's scale wrong | fix 5 |
| `ramare_viswanadham_prime_powers` | 3000 random `d ≤ 30`, `d < B ≤ 40d`, `B ≤ A ≤ 5B`; Checks | max ratio `0.505`; `4.25 ≤ 8.69`, `3.5 ≤ 13.03`, `A = 1, B = 7`: `4.83 ≤ 7.19` | true | — |
| `roughCount`, `fan_rough_count` (4)–(6) | `x = 9, z = 3`; `x = 32, z = 4`; `x = 7`, `z = 4.991, 4.995`; grid `8 ≤ x < 600` for (5) | `3 < 4.464`; `11 < 15.389`; rhs `2.99999`, `2.99917` against `Φ = 3`; max ratio `0.834` | (5) false at `x = 7` as the README says; docstring value wrong | fix 4 |
| `FanFiniteRange` | as (5) | false without `x ≥ 8`, true at the tested points with it | as stated | — |
| `RosserSchoenfeldFiniteRangeInput` | `x = 59` | `16.244 < 17 < 19.792` | true at the end point | — |
| Context (all) | each declaration's elaborated type | no `variable` block; all binders explicit | — | — |

## Unresolved and notes for the maintainer

- The package has no `review.json`; the decisions kept are those of the design review and its
  repair (`reports/REV-DESIGN-…`, `reports/FIX-DESIGN-…~2`) and the package report: Layer 6 named
  hypotheses, Treviño not stated in Lean, the sifted Brun–Titchmarsh form owned here, the `x ≥ 8`
  restriction of Fan's (5).
- `LapkovaSmallModuliVerified` and `FanFiniteRange` coincide with the conclusion of the theorem
  that consumes them on a bounded range (`q ≤ 25`, `x < 2·10⁶`); the theorems' content is the
  unbounded range, and the propositions are finite verifications. This is the accepted design (Layer
  6 is where every table and finite verification enters); an upstream reviewer may ask about it.
- The random-sample maxima quoted in some Checks (§§1.6, 2.3, 5.5) depend on the sample; my reruns
  gave `0.42`, `0.435`/`0.058` and `0.505` against the README's `0.37`, `0.46`/`0.07` and `0.49`, all
  below `1`. They are left as written.
- AnalyticNumberTheoryPartI §0.7 (its README line 281) uses "explicit Pólya–Vinogradov" in a proof
  route; that roadmap is earlier (90) than this one (272), so the use points upward from it.
- ExplicitNumberFields' `gap:polya-vinogradov-lapkova` (its README line 496 at the head) still
  prints `0.8204/√q₀`; §3.5 here states the corrected `0.8204/log q₀` with the computed witness.
- The order of supply between this roadmap and ExplicitZetaBounds (which expects Layer 1 from here
  but precedes it) remains as the package report describes; ExplicitZetaBounds has no roadmap yet.
- No text read for this job asked for any action outside the job; nothing suspicious to quote. The
  only network-backed tool used was `tauceti-roadmap roadmaps` (grep, show, resolve, overlaps).


Pull request: #1948 (roadmap/explicit-character-sums-and-sieves at 0655dd7)
