# PKG-ExplicitMultiplicativeFunctions: package report

Deliverables: `packages/ExplicitMultiplicativeFunctions/README.md` (ten layers, every target, Check
and worked example of the design kept), `packages/ExplicitMultiplicativeFunctions/Suggested.lean`
(13 headline theorems, 13 definitions; the file starts with the line `module`, then
`import Mathlib`), `packages/ExplicitMultiplicativeFunctions/metadata.toml`
(`topic = "math.NT"`), `packages/ExplicitMultiplicativeFunctions/sources.toml` (three entries
updated, no new key), and the top-level `gaps` list of
`packages/ExplicitMultiplicativeFunctions/design/plan.json` (all 17 gaps kept, since targets of the
plan name every one: the eleven that ExplicitPrimeCounting states have their `section` set to the
section that states them, the six it does not state stay owed; nothing else in the file changed,
checked by a key-by-key comparison and by the worker's plan check, which reports no problem).

Inputs: the design on the board (`design/README.md`, `design/plan.json`) and the reports in
`reports/`. There is no `design/review.json`; the accepted review is
`reports/REV-DESIGN-ExplicitMultiplicativeFunctions.md`, whose 17 findings the repair round
applied. Its one open note (F17, the reconciliation of backticked names with `Suggested.lean`) is
done here.

## Headline theorems

| Headline theorem | README | Status |
|---|---|---|
| Ramaré's transfer, 2013 instance `|M(D)| ≤ (0.0130/log D − 0.118/log² D) D` | 1.5 | stated, `abs_moebiusSum_le_ramare` (analytic range `D ≥ 2 161 205`; below it the README's direct verification) |
| Tao's `|m_S(x)| ≤ 1` | 2.1 | stated, `abs_moebiusDivSumIn_le_one` |
| Balazard's inequality | 2.2 | stated, `abs_moebiusDivSum_le_balazard` |
| Ramaré's `|m̌(x) − 1| ≤ ((7/4 − γ)/x²) ∫|M| + 2/x` | 3.1 | stated, `abs_moebiusLogSum_sub_one_le` |
| Comparison theorem of the convolution method, general exponent | 5.1 | stated, `norm_sum_mul_sub_le_comparison` |
| Dirichlet-divisor model (`1.16`, `t ≥ 1`; `1.641`, `t > 0`) | 5.2 | stated, `sum_tau_div_model` |
| Hall–Tenenbaum inequality | 6.3 | stated, `sum_le_hall_tenenbaum` |
| Explicit Mertens product (Rosser–Schoenfeld 7–8) | 8.1 | stated, `mertens_product_explicit` (analytic range `x ≥ 24 284`) |
| Axler's `< 1 + 0.07/log³ x` | 8.1 | stated, `mertens_product_axler` (analytic range `x ≥ 392 687`) |
| Robin's `ω(n) ≤ 1.3841 log n/log log n` | 9.1 | stated, `cardDistinctFactors_le_robin` |
| Nicolas–Robin `τ(n) ≤ n^{1.538 log 2/log log n}` | 9.2 | stated, `sigma_zero_le_nicolasRobin` |
| Robin's `σ(n)/n < e^γ log log n + 0.6483/log log n` | 9.3 | stated, `sigma_one_div_lt_robin` (unconditional, as the README states it) |
| Rosser–Schoenfeld `n/φ(n) < e^γ log log n + 2.50637/log log n` | 9.4 | stated, `div_totient_lt_rosserSchoenfeld` |

Every headline theorem is statable at the pins. Not stated, and said so in the module docstring:
Ramaré–Zuniga Alterman's sharper instance (1.10), because its constant `0.039` rests on the
source's own treatment of the boundary terms, whose finite inputs the README cannot fix, so no
hypothesis list can be written that is known to suffice; and the statements resting on unrefereed
preprints (Chirre–Helfgott's linear bound, Johnston–Leong–Tudzi, Daval, the identity factory, the
smoothed divisor problem, Tudzi and Palojärvi–Tudzi), which stay README targets.

Statement conventions of `Suggested.lean`, recorded in its docstring and in the README's
Conventions: explicit prime estimates enter as inequality hypotheses of the exact shape the proof
uses (the design's own convention); finite verifications enter as propositions with real bodies,
but never one that restricts the conclusion to an interval: such theorems are stated beyond the
interval (Ramaré, Mertens, Axler), and the README states the full range as the conjunction. Pointwise
tables (primorials, superior highly composite numbers) are hypotheses, as in the sources' proofs.
Precedent: AnalyticNumberTheoryPartI's `Suggested.lean` uses `BBRFiniteInput` the same way.

## Elaboration

`lake env lean packages/ExplicitMultiplicativeFunctions/Suggested.lean`, run from the content
checkout: no errors, exactly **13** warnings, each `declaration uses 'sorry'` (lines 164, 188, 193,
203, 218, 240, 265, 282, 305, 320, 332, 341, 351), no other message. The file starts with the line
`module`, then `import Mathlib` and `import TauCeti.NumberTheory.LFunctions.Mertens` (its object
file was present; nothing was built), as the module-style roadmaps on main do (for example
FiniteGroupExtensionSplitting and PositiveScalarCurvature); with plain imports and no `public
section`, every declaration is private to the module, which changes no statement. No `set_option`,
no sorry'd data, no section variables (every binder is in its declaration's own signature).

Mechanical `#check`: a scratch copy with `#check @name` for all 26 declarations and
`#print RamareTransferComputations` elaborated once on the final file; every elaborated type was
compared with its README statement. Nothing had to change; the comparison confirmed in particular
that `∑ k ∈ s, a + b` parses as `(∑ k ∈ s, a) + b` in the small-values field and the Selberg
remainder, and that the hypotheses of `abs_moebiusSum_le_ramare`, `sum_tau_div_model`,
`mertens_product_axler` and `div_totient_lt_rosserSchoenfeld` are the README's.

Padding probe: the worker's one-tactic probe (`first | rfl | infer_instance | (simp) | sorry`)
only rewrites a `:= sorry` closing, so on this file (every proof is `:= by` then `sorry`) it probes
nothing. It was therefore run by hand on a copy with each closing rewritten to `:=` then `sorry`:
all 13 theorems were probed and none was closed. Nine still report `sorry`; for the other four
(`norm_sum_mul_sub_le_comparison`, `sum_tau_div_model`, `mertens_product_explicit`,
`mertens_product_axler`) `simp` rewrites the goal and leaves it unsolved (an error, not a proof).

Library names: every backticked Mathlib and Tau Ceti name of the README (84 names) was checked at
the pins, by `#check @name` for the modules whose object files are present and by the declaration
in the pinned source for the three Tau Ceti modules without object files on this host
(`TauCeti.NumberTheory.ArithmeticFunction.DivisorBounds`, `TauCeti.NumberTheory.PrimeCounting`,
`TauCeti.NumberTheory.SumPrimeReciprocals`). All exist; seven Tau Ceti names that the README gave
without their namespace are now qualified (`TauCeti.summatory_mul_eq_sub_sub_integral_mul`,
`TauCeti.summatory_mul_eq_sub_integral_mul_of_le`, `TauCeti.summatory_mul_le_of_summatory_le`,
`TauCeti.tsum_mul_le_of_summatory_le`, `TauCeti.sigma_le_rpow_mul_tsum`,
`TauCeti.IdealArithmeticFunction.localArithmeticFactor`,
`TauCeti.IdealArithmeticFunction.isMultiplicative_eulerProduct`).

Worker gates, rerun on the final files with the worker's own scanners: every text-gate count is 0
(`tex`, `latex`, `residue`, `readme-ids-missing`, `imports`, `statement-hygiene`, `depcheck`, …),
the sources manifest has no problem, every `gap:` slug the README names is declared in the plan,
and the plan check (only the top-level `gaps` list changed, no gap that a target names is removed)
reports no problem.

## Corrections to the design (what changed and why)

- **Supplier gaps resolved by the ExplicitPrimeCounting design** (on the board; read at
  `packages/ExplicitPrimeCounting/design/README.md`): 11 of the 17 gaps are stated there and are now
  citations: `psi-ratio-max` → §3.2 (`1.03883`); `psi-dusart-log` → §3.3 (`0.006409`, `x > e²²`; the
  need is restated with the strict range, the closed form following by right-continuity);
  `psi-relative-large` → §6.1 (row `(1, 0.000213, 10¹⁰)`; also §1.3 + §3.3); `psi-tilde-explicit` →
  §4.2; `mertens-reciprocal-cubic` and `mertens-reciprocal-large` → §4.3; `theta-progression-explicit`
  → §6.3; `nth-prime-lower` → §5.3; `prime-count-lower` → §3.5; `psi-sqrt-buthe` → §1.3
  (*ButheVerified*); `theta-lower` → §3.2. Kept as gaps (each still absent in that shape):
  `psi-initial-range` (the `0.8 √x` clause), `mertens-reciprocal-axler`, `psi-relative-bklnw`
  (narrowed: the `e⁴⁰` row is §3.1's *BKLNWPsiTable*), `psi-tilde-difference` (§4.2 has only
  `1/(2√x)`), `psi-log-power`, and `zeta-reciprocal-bounds` (ExplicitZetaBounds has no design yet).
  The eleven met gaps stay declared in the plan's `gaps` list, because targets of the plan name
  them in their prerequisites: each keeps its slug, title, `neededBy` and `needs` (only
  `psi-dusart-log`'s `needs` takes the open range `x > e²²`, as the README states it), its `section`
  names the ExplicitPrimeCounting section above (in that design's numbering, replacing the older
  "Layer 2 (T2.1 …)" pointers), and its `detail` adds "Stated by ExplicitPrimeCounting §…". They were
  announced when the design was accepted, so keeping them announces nothing new. The README cites
  those sections in its ExplicitPrimeCounting contract and has no "What ExplicitPrimeCounting must
  provide" line for them; its six `gap:` lines are the six still owed.
- **Upward citation removed**: ProbabilisticAndMetricNumberTheory is after this roadmap in the merge
  order (274 against 272); its supplier subsection and its *Needs* entry in Layer 6 are deleted
  (6.1 never used it; the Rankin-type bound is now derived in 6.1 itself), and it is listed as a
  downstream consumer.
- **Downstream consumers earlier in the order**: ExplicitCharacterSumsAndSieves (271) and
  ExplicitZetaBounds (269) precede this roadmap, so their uses are listed as their Part IIs; 9.4's
  "the character-sums roadmap consumes" is reworded the same way.
- **Object handed over by ExplicitPrimeCounting**: its §4.7 leaves the product forms of the Mertens
  sums under the Riemann hypothesis to this roadmap; 8.1 now proves them from §4.7 by the transfer
  (with a Check at `x = 100`), so the object has an owner.
- **Ramaré 2013 instance**: restated on its analytic range `D ≥ 2 161 205` (the range
  `[1 078 853, 2 161 205]` is the direct verification, an instance of *MoebiusRangeVerified*);
  `RamareTransferComputations` now has exactly the seven fields the analytic part uses (renumbered
  (i)–(vii)); the design's fields (vii), (viii) and (x) became instances of *MoebiusRangeVerified*,
  *MoebiusDivRangeVerified* and the new *MoebiusLogIntegralLE*; the hypothesis list of the instance
  (including the `0.7 √x` squarefree bound and `(6/π²) log y + 1.166`) is written out; the Lemma 7.2
  route names its three ranges.
- **The Dirichlet-divisor model (5.2)**: the route is the source's own proof (`berkaneBordellesRamare2012`
  lines 1125–1159): integration by parts with `|Δ| ≤ 0.961√u`, which gives `1.16` from `t ≥ 235.2`, and
  the evaluation on `[1, 236]`; the design's route through the hyperbola form is not the source's.
- **9.1 (Robin)**: the summation deficit was not reproducible in the design's form (`1.2475 k` for
  `k ≥ 17`): with the lower bound for `p_i` from `i ≥ 4` the deficit reaches `1.268 k` (at `k = 20`)
  and `1.2615 k` at `k = 27`. The route now uses the actual primes `p₁, …, p₅` and the lower bound from
  `i = 6`, with deficit at most `1.2034 k` for `k ≥ 27` (computed to `k = 3·10⁵`, maximum at `k = 31`).
  The table no longer contains `3 ≤ n < 30`: for `ω(n) ≤ 3` the bound holds because
  `log n/log log n ≥ e` and `1.3841 e = 3.762`.
- **9.2**: `superiorHighlyComposite` now has an API list and a degenerate Check; the reduction is
  stated with Teo's thresholds `λ₁(k)` and the parameters `ε₁(2) = 0.1950`, `ε₂(2) = 0.3466`,
  `λ₁(2) = 1.5126` (`teo2026` lines 1792–1796, 1920–1925), which the design left implicit.
- **9.4**: the direct check `3 ≤ n ≤ 26` is replaced by the proof that every `n` with `ω(n) ≤ 2` is
  covered (`n/φ(n) ≤ 3 < 2√(2.50637 e^γ) = 4.2257`); the table is the primorials only.
- **5.1**: stated for every exponent `α > 0` (the weighted variant keeps `α < 1`); the route never
  used `α < 1`.
- **3.1**: the step from the identity to Theorem 1.4 is written out (`x` times the polynomial part
  lies in `[−1.0712, 0.4608]`).
- **Layer 0.1–0.6, 1.1**: names that `Suggested.lean` does not declare are prose (`R₁`, `R`, `σ*`,
  `ℓ_p`, `b_k`, `b̃_k`, `φ_k`, `ε₁`, `w_S`, "`S`-factored"); the propositions of 0.7 that it does not
  declare are italic. Checks were added so that each definition has at least three (σ*, `R`, `γ₁`,
  `ε₁`, `R₂*`, `Δ_k`, the six declared propositions).
- **Pinned names**: `Real.fract` does not exist at the pin; it is `Int.fract`. The Tau Ceti names are
  given with their namespaces (`TauCeti.LFunctions.mertensConstant`,
  `TauCeti.IdealArithmeticFunction.normCoeff_eq_eulerProduct`, `Nat.primeCounting_nth_prime`, …).
- **AnalyticNumberTheoryPartI §3.23a**: its target names for the square-root and cubic bounds
  (not declarations of its `Suggested.lean`) are cited in prose; `divisorError` and `BBRFiniteInput`
  (declared there) stay in code. `BBRFiniteInput`'s first conjunct is the `0.961` row on
  `[1, 10¹⁰]`, so 7.4 cites it rather than restating that range.
- **Process wording** removed ("current" ×12, "now", "until", "deleted", "the current standard").
- **Layout of code spans**: no inline code span crosses a line break. In 117 places the line break
  that fell inside a span now falls before the word that opens it, and in 4 places (where nothing
  came before the span on its line) the two lines are joined. Every TeX-style `_{…}` and `^{…}` is
  therefore inside a code span on a single line. The continuation line of the indented display of
  Cully-Hugill–Trudgian's Theorem 1 (7.5) began with `+ `, which reads as a list item; it now begins
  with the term, and the `+` ends the line before. The README is otherwise unchanged word for word
  (a word-sequence comparison before and after is identical). After this change the worker's text
  scanners report 0 hits each (`tex` was 157).

## Duplication sweep (removals)

| Removed here | Owner cited |
|---|---|
| *EulerGammaEnclosure* `d` | ExplicitPrimeCounting §1.6 (*EulerGammaEnclosure*, stated there "for this roadmap and for ExplicitMultiplicativeFunctions") |
| *MeisselMertensConstantEnclosure* | ExplicitPrimeCounting §1.6 (*MeisselMertensEnclosure*) |
| *SiegelGapExplicit* `c Q₀` | ExplicitPrimeCounting §1.7 (*RealZeroGap*, *BanksGap*); AnalyticNumberTheoryPartI §0.34 for the qualitative form |
| *QuadraticRealZeroFreeVerified* `Q c` | ExplicitPrimeCounting §1.7 (*LuZamanZhaoSweep*) |
| clause (a) of *ZetaResidueSumVerified* (zeros on the line) | ExplicitPrimeCounting §1.1 (`RH(H)`); only simplicity is added here |
| *SelbergSmallValuesVerified* | identical to field (iv) of `RamareTransferComputations` |
| the `0.961` range of *DivisorRangeVerified* on `[1, 10¹⁰]` | AnalyticNumberTheoryPartI §3.23a, first conjunct of `BBRFiniteInput` |
| eleven supplier-gap restatements as owed (the plan keeps the entries, pointing at these sections) | ExplicitPrimeCounting §§1.3, 3.2, 3.3, 3.5, 4.2, 4.3, 5.3, 6.1, 6.3 (list above) |

Checked by object at the pins (grep of Mathlib and Tau Ceti): no Stieltjes constant (only
Stieltjes measures), no Mertens function or real-argument Möbius summatory function, no Selberg
remainder (only `SelbergSieve`), no superior highly composite numbers, no squarefree counting
remainder; `mertensConstant` is Tau Ceti's and is consumed. Checked by object on main and at the
heads of the 472 open roadmap pull requests (`roadmaps grep` for the first Stieltjes constant, the
Selberg remainder, superior highly composite numbers, the Mertens function, Balazard,
Hall–Tenenbaum, Nicolas–Robin, `1.3841`): no match. Ownership against the open pull requests was
therefore checked; the only overlaps are the AnalyticNumberTheoryPartI sections already imported.

## Notions moved down from later roadmaps

None. The one later roadmap the design cited (ProbabilisticAndMetricNumberTheory) supplied nothing
this roadmap needs; the citation is deleted rather than moved.

## What the README could not support

- The Ramaré–Zuniga Alterman instance (1.10) and the `m`-bound 2.7 are stated as the sources state
  them, but the finite inputs of the sharper boundary treatment of 1.10 are only partly named
  (*RamareZunigaAltermanComputations*); the target says the treatment is part of it.
- *SuperiorTableVerified* is given numerically only for `k ≤ 5`; for `6 ≤ k ≤ 100` the README points
  to Teo's Tables 16–18.
- Field (ii) of `RamareTransferComputations` is a finite verification no source performed (it
  replaces the printed proof's use of a false range); the design's estimate makes it very likely
  true (`|R₂*(D)| ≲ 1.93 √D log D ≈ 10⁻³ D` at `1.8·10⁹`, against `0.0213 D`), but it is unverified.
- Axler's threshold `392 687` holds with a logarithmic margin of `5·10⁻¹³` for the crude tail
  `1/(x − 1)`; the README notes that Axler's sharper tail may be used there.

## Adversarial pass

Values are computed (exact sieves in pure Python; real arguments at both ends of every step interval,
interior extrema where a weight makes them possible).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `abs_moebiusDivSumIn_le_one` | `S = ∅`; `S = {2,3}`, `x = 6`; all `S ⊆ {primes ≤ 19}`, `x ≤ 200`; `x < 1` | `1`; `1/3`; max `|m_S| = 1.0` (at `n = 1`); `0` | holds | README: `S : Set ℕ`, non-primes ignored |
| `abs_moebiusDivSum_le_balazard` | `x = 1, 2`; every `[n, n+1)`, `n ≤ 3000` | `1 ≤ 11/3`; `1/2 ≤ 19/12`; max(lhs − rhs) `= −0.00172` | holds | none |
| `abs_moebiusLogSum_sub_one_le` | `x = 1, 2`; `[1, 3001)`; polynomial part | `1 ≤ 2`; `0.307 ≤ 1.293`; max(lhs − rhs) `= −0.00248`; `x·poly ∈ [−1.07115, 0.46076]` | holds | step written out in 3.1 |
| `norm_sum_mul_sub_le_comparison` | `h = δ`; `h = 0`; `t ∈ (0, 1)`; `h(d²) = μ(d)/d²` | `u, v, w = A, B, C`; `0 ≤ 0`; empty sum against `|A L² + B L + C| ≤ D t^{−α}` from the hypothesis at `t/m`; `H̄(−1/3) = 2.80405`, `H̄(−2/5) = 4.04208`, `H̄(−1/2) = ∞` | holds for every `α > 0` | generalised from `(0, 1)` |
| `sum_tau_div_model` | `t = 1`; `t = 0.01`; `(0, 1)`; `[1, 10⁵]`; `t ≥ 236` | `0.521 ≤ 1.16`; `5.766 ≤ 7.617`; sup `|P| t^{1/3} = 1.640819` (at `u = 7.2163`); max `|S − P| t^{1/3} = 0.6542`; `3·0.961 t^{−1/6} ≤ 1.16` iff `t ≥ 235.2` | holds | route replaced by the source's |
| `sum_le_hall_tenenbaum` | `f = 1`, `x = 2`; `x → 1⁺`; `A, B` signs | `2 ≤ 4.37·2.885·1.5 = 18.9`; right side `→ ∞`; `A ≥ 0`, `B ≥ 0` forced by `y = 2`, `N = 0` | holds | none |
| `mertens_product_explicit` | `x = 24 284`; every prime gap of `[24 284, 2·10⁶]`, both ends | `ε + 1/(x−1) = 1.0125·10⁻³` against `4.8919·10⁻³`, `4.9159·10⁻³`, `9.7599·10⁻³`, `9.8561·10⁻³`; 0 violations | holds | stated beyond `24 284` |
| `mertens_product_axler` | `x = 392 686, 392 687, 4·10⁵, 46 909 074, 10¹⁵`; direct `[2, 2·10⁶]` | transfer margin `+5.9·10⁻¹²`, `−4.7·10⁻¹³`, `−4.5·10⁻⁸`, `−1.7·10⁻⁶`, `−3.5·10⁻⁷`; max `(Q − 1) log³ x = −0.0287` | holds from `392 687` exactly | stated beyond `392 687` |
| RH product form (8.1, new) | `x = 100`; `x = 10¹⁹` | window `(0.9465, 1.0673)` ∋ `0.9869`; `ε_RH = 1.65·10⁻⁹` against Axler's `1.05·10⁻⁷` | holds | added |
| `cardDistinctFactors_le_robin` | `n ∈ [3, 10⁵]`; primorials `k = 3…26`; analytic step `k = 26, 27, 10¹²`; deficit | max `ω log log n/log n = 1.3578` (at `30 030`); max ratio `1.384013` (`k = 9`); `log(kℓ)` vs `1.3841ℓ`: `4.418 > 4.414`, `4.471 ≤ 4.482`, `31.0 ≤ 41.1`; deficit `≤ 1.2034 k` (`p₁…p₅` actual) but `1.2615 k` at `k = 27` with the design's scheme | holds | route corrected; `n < 30` clause dropped (`1.3841 e = 3.762`) |
| `sigma_zero_le_nicolasRobin` | `n = 6 983 776 800`; `n ∈ [3, 10⁵]`; `n = 3`; `ε = 0.3` | `f₂ = 1.5379399`; max `1.5118` at `55 440`; `2 ≤ 3^{11.3}`; `f₂(5040) = 1.48485` | holds; `1.5379` fails | Teo's `(ε₁, ε₂, λ₁)` written in |
| `sigma_one_div_lt_robin` | `n ∈ [3, 10⁵]`; `n = 12` | max `(σ/n − e^γ log log n) log log n = 0.648214` at `12` | holds strictly (`0.6483`) | none |
| `div_totient_lt_rosserSchoenfeld` | primorials with `p_k < 24 284`; `n ∈ [3, 10⁵]`; `p_k = 24 284, 10⁵, 10⁸`; `ω(n) ≤ 2` | max `2.506369` at `k = 9`; max `2.4687` at `30 030`; analytic `18.002 < 18.144`, `20.519 < 20.645`, `32.814 < 32.896`; `3 < 4.2257` | holds | small-`n` case proved, table reduced |
| `selbergRemainder` checks | `D = 0.5, 1, 2, 3, 4, 10, 30` | `0`, `1.1544`, `1.8284`, `1.7759`, `2.4499`, `5.0664`, `0.5688`; without `2γ⌊D⌋`: `R₂*(3) = −1.6874` | sign and normalisation pinned | Checks added |
| `RamareTransferComputations` | field (v) with `3.48`; field (vi) at `D₀`; field (i) at `3` | `3.4852 > 3.48`; `98 403.05 ≤ 98 594.8`; `1.7759 ≤ 3.4251` | fields consistent | renumbered (i)–(vii) |
| `MoebiusTableVerified` | `x = 31, 32, 33`; `[33, 2000]`; `(0.5, 10¹⁰)` | `0.7184`, `0.7071` (> `0.571`); `3 ≤ 3.280`; max `0.5671`; `0.5706 > 0.5` | lower end `33` needed | Check added |
| `stieltjesGammaOne` | `N = 10`; wrong normalisations | `0.04123` against `γ₁ + log 10/20 = 0.04231`; `log² N` version `→ −∞`; `Σ log n/n²` version `→ 0.9375` | definition determines `γ₁` | Checks added |
| `StieltjesGammaOneEnclosure` | sign; `γ² − 2γ₁` | `+0.0728` excluded by the sum at `10⁶`; `0.478810` vs `0.47890` | consistent | split into three Checks |
| `superiorHighlyComposite` | `ε = 0.3`: `5040`, `2520`, `1`; `ε > 1`: `1`; `≥` reading | `4.6497 > 4.5795`; `N = 1` fails (`4.65 > 1`); `N = 1` holds; empty | determines its object | API and Check added |
| m̌ / `m` Checks with placeholders | `m(13)`, `m(30)`, `m(32)`, `m(33)` | `−2323/30030`, `−0.030475`, `−0.06273`, `−0.03243` | `0.19/log x` fails at `32` (`0.0627 > 0.0548`): threshold `33` needed | placeholders replaced |
| `σ*` Checks | `σ*(12)`, `σ*(30)`, `σ*(8)`, `Coprime d n` reading | `20`, `72`, `9`; wrong reading `1` | determines its object | split, one added |
| `Δ_k` (7.9) | `k = 2` residue | `P₂(L) = L + 2γ − 1` (`= divisorError`); without `1/w`: `L + 2γ` | normalisation pinned | Check added |
| gap `psi-dusart-log` restated `x > e²²` | `x = e²²` | right-continuity of `ψ` gives the closed bound with `0.006409 < 0.0065`; in 1.5 the point lies in `[3 430 190, 10¹⁰]`, covered by `0.8 √x` | no loss | strict range |
| gap `psi-relative-large` from §1.3 + §3.3 | `[10¹⁰, 10¹⁹]`; `> 10¹⁹` | `0.94/√x ≤ 9.4·10⁻⁶`; `0.006409/log x ≤ 1.47·10⁻⁴`, both `≤ 2.13·10⁻⁴` | implied | cited |

Recomputed independently on the final statements (exact rational products, 40-digit decimals):

| Statement | Instance | Values | Result |
|---|---|---|---|
| `sum_tau_div_model`, second conjunct | `t = e^{−u}`, `u ∈ (0, ∞)`, sum empty | `sup_u (u²/2 − 2γu + γ² − 2γ₁) e^{−u/3} = 1.6408192` at `u = 7.21631`; the other critical point `u = 1.09255` gives `−0.12897` | `≤ 1.641` (margin `1.8·10⁻⁴`) |
| `sum_tau_div_model`, first conjunct | `t = 1`; `t → 2⁻` | `|1 − 0.47881| = 0.5212 ≤ 1.16`; `|1 − 1.51917|·2^{1/3} = 0.6542 ≤ 1.16` | holds |
| `div_totient_lt_rosserSchoenfeld` | primorials `k = 1…11` | `(N_k/φ(N_k) − e^γ log log N_k) log log N_k`: `−0.972, 1.144, 1.922, 2.329, 2.388, 2.469, 2.451, 2.498, 2.5063693, 2.428, 2.404` | max at `k = 9`, `< 2.50637` (margin `7·10⁻⁷`); `k = 1` (`n = 2`) is outside `n ≥ 3` |
| `sigma_one_div_lt_robin` | `n = 12` | `(28/12 − e^γ log log 12) log log 12 = 0.6482136` | `< 0.6483` |
| `sigma_zero_le_nicolasRobin` | `n = 6 983 776 800 = 2⁵3³5²·7·11·13·17·19` | `τ = 2304`; `log τ · log log n/(log 2 · log n) = 1.5379399` | `≤ 1.538` |
| `abs_moebiusDivSum_le_balazard` | source | `ramare2015mc` lines 91–95 (Theorem 1.1, Balazard, `x ≥ 1`): same three terms, `8/(3x)` | matches |
| `abs_moebiusLogSum_sub_one_le` | source; identity → bound | `ramare2015mc` lines 155–162 (Theorem 1.4, `x ≥ 1`); substituting `u = x/t` turns `(1/x)∫_1^x |M(x/t)| (7/4 − γ) t^{−2} dt` into `((7/4 − γ)/x²)∫_1^x |M(u)| du`, and `x` times the polynomial part lies in `[−1.0712, 0.4608]`, inside `[−2, 2]` | matches |
| `abs_moebiusDivSumIn_le_one` | source; infinite `S` | `tao2010` lines 111–116 (Theorem 1.1, any `P`, any `x`); for fixed `x` only the primes `≤ x` of `S` matter, so an infinite `S` reduces to a finite one | matches |
| `norm_sum_mul_sub_le_comparison` | expansion | `Σ_{n ≤ t}(h ⋆ k)(n) = Σ_{m ≥ 1} h(m) K(t/m)` (`K(t/m) = 0` for `m > t`, covered by the hypothesis on `(0, 1)`); `A(L − log m)² + B(L − log m) + C` summed against `h` gives `u = A H(0)`, `v = −2A Σ h log + B H(0)`, `w = A Σ h log² − B Σ h log + C H(0)`; the error `|h(m)| D (t/m)^{−α} = D t^{−α} |h(m)| m^α` | the Lean coefficients are these |
| `sum_le_hall_tenenbaum` | proof shape; `x ∈ (1, 2)` | `log x Σ f = Σ f log n + Σ f log(x/n)`, the first `≤ (A + B) x Σ f(m)/m` by `f(p^ν m) = f(p^ν) f(m)` and the two hypotheses at `y = x/m`, the second `≤ x Σ f(n)/n`; at `x ∈ (1, 2)` the left side is `f(1) = 1` and `A, B ≥ 0` (hypotheses at `y = 2`, `N = 0`) give `(A + B + 1) x/log x ≥ x/log x > 1` | holds |
| `mertens_product_explicit` | derivation | `log(∏(1 − 1/p)^{−1}/(e^γ log x)) = (Σ 1/p − log log x − B) − T(x)` with `0 ≤ T(x) ≤ 1/(x − 1)`; at `x = 24 284`: `1/log³ x + 1/(x − 1) = 1.0125·10⁻³ < 1/(2 log² x) = 4.904·10⁻³` | holds, ratio improves with `x` |

## Dependency check

    depcheck: 240 roadmaps, 2435 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The suppliers named are Mathlib, Tau Ceti,
AnalyticNumberTheoryPartI (90), ZerosOfLFunctions (85), SieveMethodsAndPrimePatterns (268),
ExplicitZetaBounds (269) and ExplicitPrimeCounting (270), all before this roadmap (272).

Citation resolver (`roadmaps resolve` on the README): no Lean name found nowhere; one lead,
"ExplicitPrimeCounting §§1.1: no roadmap ExplicitPrimeCounting on main or in an open pull request".
This is expected: ExplicitPrimeCounting is a board-stage design earlier in the merge order, not yet
on main or in a pull request; every section cited (§§1.1, 1.3, 1.6, 1.7, 3.1–3.3, 3.5, 4.2, 4.3,
4.7, 5.3, 6.1, 6.3) was read in `packages/ExplicitPrimeCounting/design/README.md`. AnalyticNumberTheoryPartI
sections were checked at the head of its open pull request (sections 0.8–3.35a unchanged from the
design's reading), SieveMethodsAndPrimePatterns §§0.5 and 1.1 at its head, ZerosOfLFunctions
Layer 9 on main.

Sources: `sources check` reports 0 problems. No new source was needed, so no
`needs-references.toml` was written; the manifest's `teo2026`, `dress1993` and
`berkaneBordellesRamare2012` entries have updated locators and `cited_for`, and `dress1993` is now
cited in the README (it was in the manifest but uncited).

## Suspicious text

None. No fetched text, design or review passage contained instructions.
