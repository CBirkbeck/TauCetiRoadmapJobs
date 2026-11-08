# Red-team review of #1945 ExplicitPrimeCounting at 65f9a25 (pass b (claude))

**Verdict:** changes needed

Package read in full: `TauCetiRoadmap/ExplicitPrimeCounting/README.md` (3690 lines) and
`TauCetiRoadmap/ExplicitPrimeCounting/Suggested.lean` (416 lines, 30 declarations). The pull
request changes nothing outside the folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ExplicitPrimeCounting'` is empty).
No Lean was run (the brief forbids builds); the worker's elaborated signatures in
`scratch/signatures.md` were compared declaration by declaration with the README (the one
"elaboration error" there is the scanner picking up `*,` from a docstring, not a file defect).
No earlier repair report marks any finding `not actionable`, so nothing is settled.

## R01 (P2) — §4.3, Vanlalngaia's second instance: the stated route does not reach the stated bound

Location: `README.md:2346-2351` ("Vanlalngaia's second instance … `≤ 1.1 exp(−√(0.175 log x))/(log x)^{3/4}` for `log x ≥ 4635`. Route: the transfer with the relative error `ε(t) = √(8/π) R₀^{−1/4} (log t)^{1/4} exp(−√(log t/R₀))` of that corollary, with `1/R₀ = 0.17553 > 0.175`").

Claim: the §4.3 transfer applied to Dusart 2016's Corollary 1.2 proves
`|∑_{p ≤ x} 1/p − log log x − B| ≤ 1.1 (log x)^{−3/4} exp(−√(0.175 log x))` for `log x ≥ 4635`.

Witness (computed): with `ε(t) = c (log t)^{1/4} e^{−√(log t/R₀)}`, `c = √(8/π) R₀^{−1/4} = 1.0329`,
`R₀ = 5.69693`, the transfer gives `ε(x)/log x + ∫ₓ^∞ ε(t)(1 + log t)/(t log² t) dt`, and the
substitution `u = log t`, `v = √(u/R₀)` evaluates the tail as
`2√R₀ · c · (log x)^{−1/4} e^{−√(log x/R₀)} (1 + O(1/log x))`: the transfer yields
`≈ 4.93 (log x)^{−1/4} exp(−√(log x/R₀))`, with exponent `−1/4`, not `−3/4`. At `log x = 4635`
the ratio of what the transfer gives to the stated bound is `293` (the slack
`e^{(√0.17553 − √0.175)√(log x)} = e^{0.043}` is far too small), and the transfer only reaches the
stated bound once `4.5 √(log x) ≤ e^{0.000633 √(log x)}`, i.e. `log x ≳ 4·10⁸`. So the route as
written proves the statement on no part of `[4635, 4·10⁸]`. (The extracted text of
`vanlalngaia-2017` line 65 is letter-coded and the sign of the exponent `3/4` cannot be read
from it; the source's own route is its Theorem 4 through the zeros, which is where a factor
`1/|ρ|` and hence `(log x)^{−3/4}` can come from.)

Repair: replace the route sentence by: "Route: the source's Theorem 4, the explicit formula of
§2.1 integrated against `(1 + log t)/(t log² t)` (its Lemma 8), with the zero sums of §3.1(a)
under the region with `R₀ = 5.69693`; the transfer of this section from Dusart's Corollary 1.2
gives only `4.95 (log x)^{−1/4} exp(−√(log x/R₀))` on `log x ≥ 4635` (the tail integral
`∫ u^{−3/4} e^{−√(u/R₀)} du` is `2√R₀ U^{−1/4} e^{−√(U/R₀)}`), which is weaker than the stated
bound by the factor `4.5 √(log x) e^{−0.000633 √(log x)}` until `log x ≈ 4·10⁸`." Add that
computation as a Check. If, on reading the published Corollary 2, the exponent of `log x` is
`+3/4`, state the bound with `(log x)^{3/4}` instead and keep the transfer route (the transfer
then has room `(log x)/4.5`). Either way the `*Needs:*` line of §4.3 gains §2.1 and §3.1(a)
unless the weaker transfer form is what is stated.

## R02 (P2) — §0.1 consumes "ExplicitZetaBounds target 13" as supplied, but it is neither in the plan's suppliers nor a declared gap

Location: `README.md:68-70` ("its proof uses Montgomery–Vaughan's weighted large sieve, ExplicitZetaBounds target 13"), `README.md:353`, `README.md:450`, `README.md:481` (`*Needs:* ExplicitZetaBounds target 13`).

Claim: the weighted large sieve `∑_x (N + (3/2) δ(x)⁻¹)⁻¹ |S(x)|² ≤ ∑ |a_n|²` is supplied by
ExplicitZetaBounds.

Witness: ExplicitZetaBounds has no design; `packages/ExplicitZetaBounds/target.md` (Verdict:
design) lists it as target 13 with `c = 3/2`, so the citation resolves today, but
`packages/ExplicitPrimeCounting/design/plan.json` names ExplicitZetaBounds only through its
eleven `gaps` (slugs listed in the README) and its `suppliers` list has no ExplicitZetaBounds
entry at all; every other use of that roadmap is a `gap:` so that the intake announces it. The
weighted sieve is the only input of the Brun–Titchmarsh headline (`brun_titchmarsh`) and was
introduced after the design (commit 65f9a25 replaced the §2.9 route), so no contract will be
announced on the supplier's job, and a design of ExplicitZetaBounds may renumber or drop the
target (its own Scope says it owns the weighted form; its Risks say the order
ECS → ExplicitZetaBounds → ExplicitPrimeCounting is still open). The Layer 0 `### Dependencies`
paragraph (`README.md:740-746`) does not list ExplicitZetaBounds at all.

Repair: add to `plan.json` `gaps` and to the ExplicitZetaBounds subsection of the README the
contract "What ExplicitZetaBounds must provide (gap:weighted-large-sieve): For a finite set
`X ⊂ ℝ/ℤ`, `δ(x)` the distance from `x` to the rest of `X`, `N ≥ 1` and complex `a_n` on
`M < n ≤ M + N`, `∑_{x ∈ X} (N + (3/2) δ(x)⁻¹)⁻¹ |∑_n a_n e(nx)|² ≤ ∑ |a_n|²`
(`montgomery-vaughan-1973`, Corollary 3 form with `c = 3/2`). Required location: target 13.";
cite it as `gap:weighted-large-sieve` in §0.1's route and `*Needs:*`, and add
"ExplicitZetaBounds (the gap `weighted-large-sieve`)" to the Layer 0 Dependencies paragraph.

## R03 (P3) — `montgomery-1978` is cited by line numbers but is not in `sources.toml`

Location: `README.md:442` ("`montgomery-1978` lines 377–388 and 517–528"), `README.md:454` ("`montgomery-1978` lines 482–497"), `README.md:3567-3569` (References entry).

Claim: the line locators refer to the line-numbered text recorded under that key.

Witness: `packages/ExplicitPrimeCounting/sources.toml` has 85 entries and no `montgomery-1978`
(`grep -n montgomery sources.toml` finds only `montgomery-vaughan-1973`); the brief's cache list
has no such text. The References paragraph says locators of the form `<id> line N` refer to the
text listed under the key, so these three locators point nowhere, and the work is cited without
a manifest entry.

Repair: fetch the paper through the sources service (Bull. Amer. Math. Soc. 84 (1978), AMS open
back volume, `--licence-class` as the service records it), record it as `montgomery-1978`, and
re-check the three line ranges against the extracted text; if it cannot be fetched, record it
`uncertified` and cite "§6, display (16)" and "§8" without line numbers.

## R04 (P3) — the plan's gap `explicit-brun-titchmarsh` has `supplier = "none"`

Location: `packages/ExplicitPrimeCounting/design/plan.json`, `gaps`, slug `explicit-brun-titchmarsh` (not named anywhere in the README).

Claim (the brief's rule): a gap with supplier `none` is unowned.

Witness: the object is owned here, `README.md:426-440` (`brun_titchmarsh`, §0.1), and the
gap's `needs` says so; the package report explains that the design's target 2.5 names the gap
and the plan tooling refuses to drop it. The entry is therefore not an unowned prerequisite,
but it is a contract with no supplier that the intake cannot announce, and the README does not
record its discharge.

Repair: if the plan schema admits it, set the gap's `supplier` to `ExplicitPrimeCounting` and
`section` to `§0.1`; otherwise add one sentence under `## Exact supplier contracts` (or at the
end of §0.1): "The design's gap `explicit-brun-titchmarsh` is discharged by this section; no
supplier owes it." Not raised as P1 because the prerequisite is owned.

## Verified sound

Counts: 30 declarations of `Suggested.lean` read and compared with the elaborated signatures
(all 30 agree with the README's statements, binders and thresholds); 61 bold/named README targets
and Props read; 118 source locators opened in the cached texts (every one that is readable
supports the claim at the stated generality, see the table); 174 README Checks and worked
examples recomputed or inspected, 39 of them by a prime sieve to `2.1·10⁷` with `θ`, `ψ` to
`3·10⁶`; 51 cross-roadmap citations resolved (ZerosOfLFunctions, LFunctions and
ClassicalArithmeticCompletion on main; AnalyticNumberTheoryPartI at #1126,
SpecialFunctionsEiLiErfIncompleteGamma at #1924, ComputationalNumberTheory at #1408,
SieveMethodsAndPrimePatterns at #1495, EffectiveClassNumbers at #1406,
ProbabilisticAndMetricNumberTheory at #1421, ExplicitZetaBounds at the board target); 77
pinned Mathlib and Tau Ceti names grepped at the pins (all exist; `principalLogIntegral` is the
supplier's planned name, as the README says).

Dependency check (run as instructed, with `--movable`):

```
depcheck: 243 roadmaps, 2456 edges, 0 problem(s)
```

No UPWARD or CYCLE line. SpecialFunctionsEiLiErfIncompleteGamma (#1924, another author's new
folder, not in ORDER.txt) is an allowed supplier; ExplicitCharacterSumsAndSieves (#1948) cites
§0.1 here as the owner of `brun_titchmarsh` with the identical statement, and
ExplicitMultiplicativeFunctions (#1946) and ExplicitNumberFields (#1944) cite this roadmap only
as a supplier: no second owner and no cycle. `GRHMod` of ExplicitNumberFields duplicates the
`DirichletGRH` body that `lamzouri_li_soundararajan` writes out, but that is a declaration of
the later roadmap, not of this one.

Declared gaps: all eleven slugs of the README's `## Exact supplier contracts` are in
`plan.json` with the same supplier and section; each `needs` sentence is precise and asks for
what ExplicitZetaBounds' target list (targets 8, 9, 10, 16, 17, 18, 19, 20) promises or can
specialise; none asks for what the pins or an earlier roadmap already provide (checked: Mathlib
has no explicit zero count, region constant or density; Tau Ceti has `logIntegral`,
`mertensConstant`, the asymptotic prime theorems only).

Adversarial pass (one row per statement; values computed are the ones that decide):

| Statement | Instances tried, values computed | Result |
|---|---|---|
| `liTwo` (series) | `γ + log log 2 + ∑ (log 2)ⁿ/(n·n!)` = `0.5772157 − 0.3665129 + 0.8344610 = 1.0451638`; SFELI §8.2 Check gives `li 2 ∈ (1.0451637801, 1.0451637802)` | agrees; DLMF 6.6.2 at `z = log 2` |
| `li x = Li x + liTwo` | `x < 1`: `logIntegral` over an interval containing `1` is the junk `0`; used only with `x > 3/2` or `x ≥ 2` in the file | sound on its range |
| `riemannPrimeCount` | `x = 96.5`: `24 + 2 + 2/3 + 1/2 + 1/5 + 1/6 = 27.533`; `x = 97`: `28.533`; `x < 2`: `0`; tsum has finite support for every real `x` (`|x^{1/(k+1)}| ≤ |x|^{1/(k+1)} < 2` eventually) | sound |
| `primeReciprocalSum` | `Nat.primesLE n = primesBelow (n+1)` at the pin: `x = 10`: `1/2+1/3+1/5+1/7 = 1.1762` ✓; `x = 1000`: `2.19808` ✓ | sound |
| `brun_titchmarsh` | `k=1,x=1.5,y=3`: `2 ≤ 5.46`; `k=3,l=2,x=10,y=30`: `4 ≤ 13.03`; `k=1,x=1.9,y=3.2`: `3 ≤ 5.50`; `y = k` excluded (`log 1 = 0`, junk `0`); statement matches `tmeemt-art14` lines 84–87 word for word; `Finset.Ioc ⌊x⌋₊ ⌊x+y⌋₊` is exactly the integers of `(x, x+y]` for `x > 0` | sound |
| §0.1 route | weighted-sieve step: `Σ*_a|S(a/q)|² ≥ Z²/φ(q)` from `p∑_h Z(p,h)² ≥ pZ²/(p−1)` minus `Z²` ✓; `L₁ ≤ (k/φ(k)) L_k` ✓ (`∑_{d|k} μ²(d)/φ(d) = k/φ(k)`); `1/L₁(807) = 136188.18`, `π(807) = 139`, `2·10⁶/log 10⁶ = 144764.8` ✓; `t = 10³`: `269.53 < 289.53` ✓; `t = 25`: `15.5105 ≤ 15.5334` ✓; `t = 24`: best `15.1067 > 15.1036` ✓; no integer `t ∈ [25, 3000]` fails; `min_{6 ≤ u ≤ 3000} (∑ μ²/φ − log u) = 1.219 ≥ 1.07` ✓ | sound (the `(k/φ(k))(1/L₁ + π(Q))` bound is slightly larger than the sharp `(k/φ(k))/L₁ + π(Q)`, still valid) |
| `logPsiAP`, `C(q,a)` (§0.2) | `C(1,0) = −γ` from `1 + ∫₁^∞ (ψ−t)/t² = 1 − 1 − γ` ✓; `C(2,1) = −γ − log 2` ✓; `C(4,1)+C(4,3) = C(2,1)` ✓; non-unit class bounded ✓ | sound |
| §0.3 `ψ − θ` | `x = 8`: `2 log 2` both sides ✓; `x = 121`: `log 332640 = 12.715` ✓, `K = 6` (the README's seventh term `θ(1.98) = 0` is harmless); `x = 120.9`: `10.317 < 10.981` ✓ | sound |
| §0.4 identity | `x = 2`: `1` ✓; `x = 3`: Simpson `1.994`, exact `2` (quadrature `2.000`) ✓; `li 1.4 < 0 < li 2` ✓ (Soldner `1.4513`) | sound |
| §0.5 transfer | `ε ≡ 0` gives `(log 4)x^{−1/2}` not `0` ✓; `ε₀(e¹⁰⁰) = 0.02777` ✓ | sound |
| §0.6 agreement | `q = 0`: `(−5 : ZMod 0).val = 5` counterexample ✓ (Sieve §3.1 uses ℕ residue, equality at `q = 0`) | sound |
| §0.7 transfer | `x = 1`: both sides `−∫₁^∞ E/t²` ✓; constant `ε` diverges ✓ | sound |
| `RiemannHypothesisUpTo` | `H = 0` not vacuous (`ζ < 0` on `(0,1)`) ✓; `H = 14` true, `H = 15` first zero ✓; trivial zeros excluded by `0 < re` ✓; `H < 0` vacuous ✓; agreement with the completion on the closed strip: edges carry no zero ✓ | sound |
| `ClassicalZeroFreeRegion R t₀` | `t₀ = 2π > 1` so `log` positive; first zero in region iff `R ≤ 0.7551` ✓ | sound |
| `ButheVerified` | each clause is `buthe-2018` lines 74–85 verbatim except `1427` for `1423`: sieve `x − θ(1426.9) = 74.08 > 1.95√x = 73.66` ✓ and holds from `1427` ✓ | sound |
| `Buthe2016Range` | `buthe-2016` Theorem 2 and line 754 ✓; `π*` from `97`: `29.473 − 27.533 = 1.94 > 1.79` just below `97`, `0.94 < 1.79` at `97` ✓ | sound |
| `Schoenfeld1976Range` | every clause matches `schoenfeld-1976` lines 20–28, 98–100, 668–669, 729–733 (strict `121 < x`, `1 155 901 < x` as printed) ✓ | sound |
| `LeeNosalRange` | `ψ(100.99)`: `6.94 > 5.695`; `|ψ(101) − 101| = 2.34` ✓; `θ(2656)`: excess `2.66` ✓; tight points `x = 223⁻` (`11.49` vs `11.95`), `3299⁻` (`108.99` vs `111.26`) ✓ | sound |
| `ZetaZeroReciprocalSum` | main term `(1/4π) log²(10⁷/2π) = 16.23` vs `16.21` ✓; finite set, multiplicity by `analyticOrderNatAt` ✓ | sound (value not readable, `lee-nosal-2026` uncertified) |
| `PrimeGapLogSquareVerified` | `p = 7`: `4 ≥ 3.79` fails ✓; `p = 11`: `2 < 5.75`; last record `1476 < 1747` ✓; tightest `(1693182318746371, 1132)`: `1132 < 1230` ✓ | sound |
| `VanlalngaiaRange` | ranges and constants match `vanlalngaia-2017` lines 26–51 (letter-coded digits) ✓ | sound |
| `LamzouriLiSoundararajanRange` | `q = 3, a = 1`: `7 > 4.83` excluded ✓; worst ratio over `4 ≤ q ≤ 1200`: `0.650` at `q = 4` ✓ | sound |
| `schoenfeld_of_riemannHypothesis` | all 7 clauses = Theorem 10 and Corollary 1 as printed; `x ∈ (3/2, 2)`: `π = 0 < li x` ✓; `x = 100`: `ψ` bound `8.44 ≥ 5.96`, `θ` fails `16.27` (threshold `599`) ✓ | sound |
| `leeNosal_of_riemannHypothesis` | threshold sharp (`101⁻` fails) ✓; `ButheVerified` reaches it from `337.09` (`0.94 ≤ log x(log x − log log x)/8π`) ✓ | sound |
| `leeNosal_theta_of_riemannHypothesis` | `PsiThetaUpper` at `e⁴⁰` = BKLNW Cor 5.1 row (`a₁ = 1 + 1.93378·10⁻⁸`, `a₂ = 1.04320`) ✓; `2657` prime, sharp ✓ | sound |
| `buthe_of_riemannHypothesisUpTo` | hypothesis `RH(T)` = "RH for `0 < Im ρ ≤ T`" ✓; `x = 60`: `18.8 ≤ T` and `5.17 ≥ 2.47` ✓; `x ≤ 1`: `√(x/log x) = 0` and no clause applies ✓ | sound |
| `johnston_of_riemannHypothesisUpTo` | crossing `exp(exp(9.06/4.92)) = 547.7` ✓; at `x = 1.1020·10²⁶` LHS `3.0002·10¹²` (so `1.101·10²⁶` inside) ✓; `T < 3·10¹²` reduces to the instance ✓ | sound (Theorem 3.2 not readable) |
| `carneiro_milinovich_soundararajan` | `[x, x + (22/25)√x log x]` closed as `cms` line 262 ✓; `x = 4`: `[4, 6.44] ∋ 5`; `[4, 11)`: `5, 7, 11` ✓; `log² x ≤ 0.88√x log x` for all `x ≥ 1` (`2/e < 0.88`) ✓ | sound |
| `dusart_of_zeroFreeRegion` | hypothesis = `dusart-2016` Theorem 1.1 with `8/R` (lines 471, 531) ✓; Lemma 2.2 drops its `T₀` boundary terms by sign (lines 204–205, 224–225), so `T₀ = 9.6769` with `N(T₀) = M(T₀) = 0` from `hlow` is admissible ✓; `log x = 400`: `X = 8.379`, `ε = 1.060·10⁻³` ✓; `R ≤ 0.7551` makes the region false ✓ | sound |
| `axler_primeCounting_upper` | coefficients `461 ± 15η − η²`, `3447 − 122η − η²` reproduce the printed `461.364417856444`, `460.634397856444`, `3444.031844143556` with `η = 0.024334` ✓; `x = 10⁴`: `1246.02 ≥ 1229` ✓; `x = 48`: denominator positive ✓ | sound (journal text uncertified) |
| `vanlalngaia_sum_inv_prime` | transfer `k = 3, η = 1`: `(1/3 + 5/(4·18.315))/log³ x = 0.4016/log³ x ≤ 0.41` ✓; `x = 10`: `0.0807 < 0.3276` ✓ | sound |
| `dusart_nth_prime_lower` | inputs = `schoenfeld-1976` (5.6b*) `e²² < x`, (5.8*) `x > 1`, `dusart-1999-mc` Theorem 2 `x ≥ e⁵⁰` ✓; Robin's `θ(p_k)` bound for `k ≥ 3` holds up to `k = 216 816` (sieve) ✓; conclusion holds for `2 ≤ k ≤ 1.27·10⁶` ✓; `k = 2`: `−1.35 ≤ 3` ✓ | sound |
| `lamzouri_li_soundararajan` | `hGRH` = AnalyticNumberTheoryPartI §1.6 `DirichletGRH` body exactly ✓; `q = 4, 5, 6, 8, 10, 12` classes ✓; non-unit `a` false (no prime `≡ 0 (4)`), hypothesis present ✓ | sound (Corollary 1.2 uncertified) |
| `schoenfeld_interval` | threshold `2 010 759.85` from the record `(2010733, 148)` ✓ (`2010733`, `2010881` consecutive primes); `x = e³⁰`: `4.35·10⁸ > 1.96·10⁸` ✓; gap step `1834.6 < 6025` ✓ | sound |
| `trudgian_interval` | `2898239`, `2898359` consecutive primes; at `x = 2898240` right end `2898357.93` ✓ (printed threshold false); `c(1 − η/log² e³⁵) = 0.0090089 > 0.009` ✓; records `(4652353, 154)`: length `177.8` ✓ | sound |
| `axler_interval` | `17051707`, `17051887` consecutive; at `17051707` length `179.73 < 180`, at `17051708` `179.73` reaches `17051887` ✓; rows cover `log x ≤ 104.2` and `≤ 277.9`; lemma at `e²⁵⁰` has `6.4·10⁻¹²` to spare; `2η²/log³ x₀ = 8.22·10⁻¹¹` at `log x₀ = 243.3` ✓ | sound |
| §1.4 gap bounds for §7.4 | `(20831323, 210)`: `211.8 ≥ 210` ✓; `(1294268491, 288)`: `588` ✓; `(436273009, 282)` largest below `1.1·10⁹` ✓ | sound |
| §2.1 zero sums | `1 + γ/2 − (log 4π)/2 = 0.023096` ✓; first seven zeros `0.01217` ✓; `∑ 1/(ρ(1−ρ)) = 2∑1/ρ` ✓ | sound |
| §2.3 JohnstonTable | `1.19√(x/log³x)` at `2.165·10³⁰` = `2.9993·10¹²` ✓; last row `2.9999·10¹²` ✓ | sound |
| §2.6 `C_T` | `log(3·10¹²/2π) = 26.892`, `C_T = 113.669` ✓; `π²/(3T²) = 3.3·10⁻¹⁴` at `T = 10⁷` ✓ | sound |
| §3.4 Trudgian's region | `17e^{2/6.455} = 23.17`; crossing `3.0014·10¹⁰ < 3.061·10¹⁰` ✓ | sound |
| §3.4 FKS constants | `121.096/5.5666305^{3/2} = 9.2202`, `2/√R = 0.84768`, `121.107/R^{3/2} = 9.2211` ✓ | sound |
| §3.5 RS and Dusart | `π(113) log 113/113 = 1.2550587 < 1.25506` ✓; `88771`, `88789` consecutive, two-term lower bound `8596.04 > 8596` at `88783` ✓ | sound |
| §3.7 BKLNW rows | Table 14 (`40`: `1.9338·10⁻⁸`, `2.1482·10⁻⁸`; `50`: `1.1199·10⁻⁹`, `1.1344·10⁻⁹`) and Table 15 (`29`: `0.024334`; `34`: `9.3023·10⁻⁵`; `33`: `1.4454·10⁻⁴`; `19 log 10`: `3.7979·10⁻⁵`, `57.184`, `1.3441·10⁵`) ✓ at `bklnw` lines 1669–1672, 1727–1742 | sound |
| §4.2 | `∑_{n≤10} Λ(n)/n = 1.6947`, `log 10 − γ = 1.7254` ✓; negative control `0.000291/log x < 1.75·10⁻¹²` at `log x = 2·10⁸` ✓ | sound |
| §4.3 exact form, `B` | `x = 3`: `0.5436 + 0.2897 = 0.8333` ✓; wrong kernel `0.61` ✓; transfer `η(1/k + (k+2)/((k+1)log x))/log^k x` ✓; Axler's `(η/3)(1 + 15/(4 log x))` ✓ | sound |
| §4.4 Ramaré | `ramare-2016` Lemma 3.2 ✓ (`P ≥ 3600000`, `1/914`; `4` for `P ≥ 2`; `1/36260` from Dusart) ✓ | sound |
| §4.5 Treviño | Table 1/2 rows ✓; `x = 10⁴` bracket `[5670868, 5818257] ∋ 5736396` ✓ | sound |
| §4.6 Deléglise–Nicolas | `(0.15·592 + 168)/384 = 107/160` ✓; `1069/648`, `1181/648` ✓; `π₅(3) = 275` ✓; `663.35` ✓ | sound |
| §4.7 | thresholds `24.4`, `43.1` per README's sieve; `x = 100`: `0.0141 ≤ 0.0550` ✓ | sound (Corollary 1.3 uncertified) |
| §5.2 RS Theorem 3 | `n = 5, 6, 19, 20` sharp ✓; `rosser-schoenfeld-1962` lines 231–241 ✓ | sound |
| §5.3 Robin | `k = 7022` and `8581 ≤ k ≤ 8601` fail, none in `[8602, 40000)` (sieve) ✓; Dusart's upper two-term bound fails last at `688382` ✓ | sound |
| §5.4 Cipolla | `n = 10⁶`: `15 481 000` vs `15 485 863` ✓ | sound |
| §5.5–5.6 | `B₉ = 3.5`, `B₈ = −1` ✓; Axler lower bound holds `2 ≤ n ≤ 1.27·10⁶` ✓; `10.667 < 11 < 11.508` ✓ | sound |
| §6.1–6.4 | `ramare-rumely-1996` Theorems 1, 2, 3.6.3, row `(8, 0.002811)` ✓; `dusart-2002` Theorem 5 radical display ✓; McCurley Theorems 1.1–1.2 ✓; `ramare-2002` Théorème 2, Corollaires 1, 4, 5, §9 (44)–(45), §10 ✓ | sound |
| §6.5 | `|disc ℚ(ζ_q)|` at `q = 3, 4, 5, 12` ✓; Bach–Sorenson Theorems 5.1, 5.3 ✓; `3/(2 log 2)² = 1.561 > 1.56` ✓ | sound |
| §6.6–6.7 | Kadiri Theorem 1.1, Table 1 row `5·10⁴`, Theorems 2.1–2.2, `7.281`/`4.401` ✓; `(1−β) log q ≥ c > 1/R ⇒ β < 1 − 1/(R log q)` ✓; `q = 10¹⁰` numbers ✓ | sound |
| §7.2–7.3 | `10726904659 + 382 = 10726905041` ✓ (consecutive primes); KL Theorem 1.1, 2.7, (3.1) ✓; CHL Table 1 ✓ | sound |
| §7.5 | `33.990 − log 3 = 32.891` ✓; Cully-Hugill lines 662–666 ✓; Dudek (24) ✓ | sound |

Lean-versus-README: every theorem keeps its binders explicitly (no `variable` block); `[NeZero q]`
with `3 < q` in `lamzouri_li_soundararajan` is redundant but needed for `LFunction`; no
`set_option`, no `lemma`, no `True`, no sorry'd data, one `import Mathlib` and two existing
`TauCeti.*` modules; every Lean name appears in the README and every backticked own name of the
README is declared (`liTwo`, `li`, `riemannPrimeCount`, `primeReciprocalSum`,
`RiemannHypothesisUpTo`, `ClassicalZeroFreeRegion`, the ten Props, the 14 theorems). The finite-
range hypotheses that coincide with the conclusion on a bounded range (`hfin` of
`axler_primeCounting_upper`, `trudgian_interval`, `axler_interval`; the interval clause of
`Schoenfeld1976Range`) are the roadmap's stated convention for computations, and each theorem's
content lies beyond that range; not raised.

Padding probe: no declaration restates a definition, follows in one tactic or mirrors a Check;
the headlines named as not statable (Rosser–Schoenfeld's `1.03883`, BKLNW's `θ` bound, FKS, the
progression rows) would, stated "from their inputs", be arithmetic on the inputs or need table
propositions, so their omission stands.

## Not verifiable

- `lee-nosal-2026`, `johnston-2022`, `lamzouri-li-soundararajan-2015`, `axler-2018`,
  `axler-2024`, `axler-2019-nth-prime`, `dusart-2018`, `chirre-helfgott-2025`,
  `ramare-2023-corrigendum`, `ramare-saouter-2003`, `cully-hugill-lee-2024`,
  `fiori-kadiri-swidinsky-2023-psi`, `brent-platt-trudgian-2021`, `platt-2016`,
  `lu-zaman-zhao-2026`, `thorner-zaman-2024`, `banks-2026`, `broadbent-fiori-kadiri-ng-wilk-2026`,
  `fiori-jaskari-2026`, `zhang-xiong-2025`, `rosser-1938`, `rosser-1941`, `cipolla-1902`,
  `montgomery-vaughan-1973`: uncertified or waived; their statements are checked only for
  internal consistency (every threshold the README calls sharp was confirmed by the sieve).
- `vanlalngaia-2017`: the cached text renders digits as letters and flattens fractions; the sign
  of the exponent in Corollary 2 (R01) could not be read.
- The value `16.2106480369` of `ZetaZeroReciprocalSum` (Lee–Nosal display (10)).
- Dusart 2018's arXiv row `(4, 1300, 2)`: BKLNW's Corollary 11.2 (journal rows) prints `151.3`
  and its Table 15 row `0` gives `151.23`; the README attributes `1300` to the arXiv copy, which
  is uncertified. The BKLNW extraction prints `112 568 683` and `7 713 113 853` for the rows the
  README gives as `122 568 683` and `7 713 133 853`; the README's values are primes and the
  extraction's are not, so the extraction is the likely error.
- Ownership against open pull requests other than the sibling checkouts the brief lists was
  checked only through the board's `roadmaps grep` index as recorded in the package report.

## Source issues

- **Misprint** in axler-2016 at §1, the list after Theorem 1.2 (line 41): the source says `k₆ = 3441`; it should be `k₆ = 3447` (`4320 − 461 − 142 − 78 − 72 − 120`), the value its Theorems 1.3–1.4 use (`(3489.8225 + 3404.4225)/2 = 3447.1225`); affects nothing.
- **Error** in buthe-2018 at Theorem 2, (1.6), printed p. 2 (line 75): the source says `x − θ(x) ≤ 1.95√x` for `1423 ≤ x ≤ 10¹⁹`; it should start at `1427`, since `x − θ(1426.9) = 74.08 > 73.66`; affects a stated result.
- **Error** in buthe-2016 at Theorem 2, (7.1), printed p. 13 (line 701): the source says `|π*(x) − li x| ≤ √x log x/(8π)` for `x > 59`; it fails on `96.29 < x < 97` (`1.94 > 1.79`) and should start at `97`; affects a stated result.
- **Error** in trudgian-2016 at Corollary 2 (line 229): the source says the interval `[x, x(1 + 1/(111 log² x))]` contains a prime for `x ≥ 2 898 239`; it should say `x ≥ 2 898 242`, since at `x = 2 898 240` the interval ends at `2 898 357.93` inside the gap `(2 898 239, 2 898 359)`; affects a stated result.
- **Error** in robin-1983 at (23), printed p. 376 (line 378): the source says `p_k ≤ k(log k + log log k − 0.9385)` for `k ≥ 7022`; it fails at `k = 7022` and at `8581 ≤ k ≤ 8601` and holds from `8602` to `40 000`; affects a stated result.
- **Misprint** in dusart-2016 at Theorem 1.1 (line 79): the source says `X ≥ max(8.36, 8R)`; it should say `X ≥ max(8.36, 8/R)`, the condition its proof uses (lines 471, 531) and its Corollary 1.2 needs; affects a stated result.
- **Misprint** in johnston-yang-2023 at Theorem 1.4, (1.9) (line 80): the source says `|π(x) − x|`; it should say `|π(x) − li(x)|`; affects a stated result.
- **Error** in bach-sorenson-1996 at the proof of Theorem 5.3, printed p. 1732 (line 937): the source says the computation for `q ≤ 1000` gives `p ≤ 1.56 (q log q)²`; at `q = 2`, `m = 1` the least prime is `3` and `3/(2 log 2)² = 1.561`; the theorem's constant `2` is unaffected; affects nothing.
