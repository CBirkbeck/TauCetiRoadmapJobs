# Red-team review of #1948 ExplicitCharacterSumsAndSieves at 0655dd7 (pass b (claude))

**Verdict:** changes needed

Package: `TauCetiRoadmap/ExplicitCharacterSumsAndSieves/README.md` (1886 lines, every line read),
`TauCetiRoadmap/ExplicitCharacterSumsAndSieves/Suggested.lean` (475 lines, 37 declarations, every
line read), `metadata.toml`. The pull request changes nothing outside the folder
(`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ExplicitCharacterSumsAndSieves'` is
empty). Settled findings of the last repair report (F02 merge-order placement, F03 the
ProbabilisticAndMetricNumberTheory citation) are not re-raised.

Dependency check, run as instructed:

    depcheck: 243 roadmaps, 2457 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

## R01 (P2) — ExplicitMultiplicativeFunctions §7.2 builds the object §5.1 owns

Location: `README.md` §5.1 (lines 1393–1404, "Explicit asymptotics … `S(z) = log z + γ + Σ_p log p/(p(p − 1)) + θ · 58/√z`") and "Scope and ownership" (lines 41–50), which names no later owner of the explicit Selberg diagonal asymptotic.

Claim: §5.1 owns the explicit asymptotics of `S(z) = Σ_{n ≤ z} μ²(n)/φ(n)` and `H₁(z)`, and the only neighbouring owner named is SieveMethodsAndPrimePatterns §1.1 (qualitative).

Witness: ExplicitMultiplicativeFunctions at its head (`TauCetiRoadmap/ExplicitMultiplicativeFunctions/README.md` lines 2588–2611, §7.2) plans Ramaré's Theorem 3.1, `Σ_{d ≤ D} μ²(d)/φ(d) = log D + c₀ + O*(2.44/√D)` for `D ≥ 1`, and Akhilesh–Ramaré's coprime form `G_q(D)`, with the same constant `c₀ = γ + Σ_p log p/(p(p − 1))`; its "Not owned here" (lines 122–124) says nothing is consumed from this roadmap. Two open pull requests build the same object (the explicit asymptotic of the Selberg diagonal sum); ExplicitMultiplicativeFunctions is later in the merge order (line 273 against 272), so this roadmap is the owner and must say so.

Repair: in "Scope and ownership", after the SieveMethodsAndPrimePatterns sentence on §1.1, add: "§5.1 owns the explicit asymptotics of the Selberg diagonal sums `S(z)`, `S_k(z)` and `H₁(z)` on the carrier `selbergDiagonal`; ExplicitMultiplicativeFunctions §7.2, later in the order of supply, sharpens their constants (Ramaré's Theorem 3.1, Akhilesh–Ramaré's Theorem 1.1) and consumes the shape from here." Add the matching bullet under "Downstream consumers": "**ExplicitMultiplicativeFunctions** §7.2: the explicit Selberg diagonal asymptotics of §5.1, which it refines." For the intake: ExplicitMultiplicativeFunctions §7.2 needs a citation of §5.1 (its package, not this one).

## R02 (P2) — the ExplicitPrimeCounting §0.1 supplier edge is unneeded and closes a cycle with ExplicitZetaBounds

Location: `README.md` "### From TauCetiRoadmap.ExplicitPrimeCounting" (lines 298–302, "Consumed as the prime-count case of 5.5 and in the Checks of 5.4"), Layer 5 "Dependencies" (line 1626, "ExplicitPrimeCounting §0.1 (Checks of 5.4, and the prime case of 5.5)").

Claim: this roadmap consumes ExplicitPrimeCounting §0.1 (`brun_titchmarsh`).

Witness: §5.5 (lines 1500–1512) proves the sifted form, of which §0.1's statement is read off ("the prime count of ExplicitPrimeCounting §0.1 is read off from it"); the edge is used in no proof. ExplicitPrimeCounting consumes ExplicitZetaBounds (`TauCetiRoadmap/ExplicitPrimeCounting/README.md` line 362, "### From TauCetiRoadmap.ExplicitZetaBounds", and line 481, a `*Needs:*` on its target 13), and ExplicitZetaBounds' accepted triage (`packages/ExplicitZetaBounds/target.md` lines 267–269 and 379–383) consumes this roadmap's Layer 1 and Layer 3 and records "The order of supply must be ECS → ExplicitZetaBounds → ExplicitPrimeCounting". With the edge kept, the three roadmaps form the cycle ExplicitCharacterSumsAndSieves → ExplicitPrimeCounting → ExplicitZetaBounds → ExplicitCharacterSumsAndSieves as soon as ExplicitZetaBounds is designed; the mechanical check is clean today only because ExplicitZetaBounds has no README yet. The settled finding F02 concerned the ORDER placement at a time when "this roadmap names neither sibling as a supplier"; the package introduced the edge.

Repair: delete the "### From TauCetiRoadmap.ExplicitPrimeCounting" subsection and the words "ExplicitPrimeCounting §0.1 (Checks of 5.4, and the prime case of 5.5);" from the Layer 5 Dependencies. In "Scope and ownership" replace "ExplicitPrimeCounting §0.1 owns Montgomery–Vaughan's Brun–Titchmarsh inequality … `brun_titchmarsh`); §5.5 here owns the sifted form, which differs from it …" by "ExplicitPrimeCounting §0.1 states Montgomery–Vaughan's prime-count form `π(x + y; k, l) − π(x; k, l) ≤ 2y/(φ(k) log(y/k))`; it is the prime case of the sifted form of §5.5 and is not consumed here." In the §5.4 Check ("weaker than ExplicitPrimeCounting §0.1 by the factor `1 + 8/log(y/k)`") and in §5.5 ("so the prime count of ExplicitPrimeCounting §0.1 is read off from it") keep the mentions as comparisons, not consumption. In the Summary (line 18, "and the Brun–Titchmarsh inequality of ExplicitPrimeCounting") delete the clause. Tested on the instance: with the edge removed, §5.5's `*Needs:*` (SieveMethodsAndPrimePatterns §2.9; §5.1; `MVDiagonalFiniteRange`) still covers every input of its proof route, and the §5.4 Check at `k = 1`, `x = 0`, `y = 10` (`4 ≤ 8.69`) is unchanged. For the intake: ExplicitPrimeCounting §0.1 then has no consumer that justifies "stated here because ExplicitCharacterSumsAndSieves … is later"; the ownership of the Brun–Titchmarsh argument between the two packages is a cross-package decision.

## R03 (P2) — Treviño's Burgess theorems are statable at the pins but absent

Location: `Suggested.lean` lines 33–42 (module docstring, "Headline theorems that are not statable at the pins … Those displays are explicit but long functions of eight quantities … they are not simple definitions"); `README.md` §4.5 (lines 1297–1360) and §§6.7–6.8 (lines 1799–1842).

Claim: Treviño's Theorems 1 and 2 with Tables 1 and 3, and Corollaries 1 and 2, cannot be stated at the pins.

Witness: every carrier in their statements exists in the file (`charIntervalSum`, `DirichletCharacter ℂ p`, `Real.rpow`, `Real.log`); the missing piece is a `Prop` with a real body, the closing inequality of trevino2015 display (46) or (47) (lines 889–941) at the parameters of Table 5 (lines 1013–1024), with `s` in closed form (§6.8 itself computes `s = (1.6283/1.579)^{90}`), and the same for (58)–(59) with Table 7 (lines 1218–1265, 1311–1322). Length is not a carrier gap, and the brief's rule is that a statable headline absent from the acceptance test is a defect. Corollary 1 (`2.74 N^{1−1/r} p^{(r+1)/(4r²)} (log p)^{1/r}` for `p ≥ 10⁷`, every `r ≥ 1`) is the result TME-EMT quotes (tmeemt-art15 lines 154–157) and the one ExplicitNumberFields' Scope names.

Repair: add to `Suggested.lean`, after `burgess_mcgown_table`, a `def TrevinoTable1Certificate : Prop` whose body is, for each row `(r, p₀, c₁, k, c′₁)` of Tables 1 and 5 (written as a `Finset` of tuples or as fourteen conjuncts) and every real `p ≥ p₀`, with `B = ((2r − 3)!!(r − 1))^{1/r} p^{1/(2r)}`, `A = k c′₁^r p^{1/4 − 1/(4r)} log p / ((2r − 3)!!(r − 1))^{1/r}` and `s = (c₁(r − 1)/c′₁)^{r(r−1)}` for `r ≥ 3`, the conjunction `28 ≤ ⌊A⌋ ∧ c′₁ < c₁ ∧ 0 < (denominator of (46)/(47)) ∧ (right side of (46)/(47)) ≤ c₁`, transcribed from trevino2015 lines 889–941; then

    theorem burgess_trevino_table1 (hT : TrevinoTable1Certificate) {p : ℕ} [Fact p.Prime]
        (χ : DirichletCharacter ℂ p) (hχ : χ ≠ 1) (r : ℕ) (hr : 2 ≤ r) (hr' : r ≤ 10)
        (p₀ c₁ : ℝ) (hrow : (r, p₀, c₁) ∈ trevinoTable1) (hp : p₀ ≤ p) (M : ℤ) (hM : 0 ≤ M)
        (N : ℕ) (hN : 1 ≤ N) :
        ‖charIntervalSum χ M N‖ ≤ c₁ * (N : ℝ) ^ (1 - 1 / r : ℝ) * (p : ℝ) ^ ((r + 1) / (4 * r ^ 2) : ℝ) * log p ^ (1 / r : ℝ)

and `burgess_trevino_corollary1` (`p ≥ 10⁷`, every `r ≥ 1`, constant `2.74`, exponent `1/r`), with `trevinoTable1 : Finset (ℕ × ℝ × ℝ)` the 27 rows of Table 1 (lines 97–107); likewise `TrevinoTable3Certificate`, `burgess_trevino_table2` (with `hN' : (N : ℝ) ≤ 2 * (p : ℝ) ^ (1/2 + 1/(4r))`, strict `<`, exponent `1/(2r)`) and Corollary 2. Rewrite the module docstring's "not statable" paragraph accordingly. If the intake instead accepts the transcription-risk argument, the docstring must say that the carriers exist and that the omission is a decision about transcribing displays (46)–(47) and (58)–(59), not a missing carrier, and the README §4.5 must mark the four statements as README-only targets. Tested on the instance: Table 1 at `r = 2`, `p = 10⁷`, `N = 10⁵` gives `2.7381 · 20.535 · 4.0147 · 316.2 = 71 400 ≥ |S| ≤ 10⁵`, consistent with the Check at line 1352.

## R04 (P3) — §6.7 misreads Treviño's admissibility condition

Location: `README.md` line 1806 ("one has `A ≥ 29`") and line 1814 ("Table 4 … lists the least `c₁` compatible with `A ≥ 29`").

Claim: the certificate requires `A ≥ 29`, and Table 4 is computed for `A ≥ 29`.

Witness: trevino2015 lines 1006–1007 (Table 4 is the least `c₁` "to satisfy ⌊A⌋ ≥ 28") and Lemma 1, line 210 (`A ≥ 28` an integer with `A < N/12`). §6.8 (line 1824) correctly writes `⌊A⌋ ≥ 30` for Lemma 6.

Repair: replace "`A ≥ 29`" by "`⌊A⌋ ≥ 28`" at both places (line 1806 and the Check at line 1814). The Check at line 1818 (`A = 40.3`) is unaffected.

## R05 (P3) — §3.3's harmonic-number input is the wrong Mathlib lemma

Location: `README.md` line 927 ("and `H_n < log n + γ + 1/n`") against the `*Needs:*` at lines 944–946 ("`harmonic_le_one_add_log`") and the Mathlib contract at line 217.

Claim: `harmonic_le_one_add_log` supplies the bound Lemma 3 needs.

Witness: `Mathlib/NumberTheory/Harmonic/Bounds.lean` line 34 states `harmonic n ≤ 1 + log n`, which is weaker than `log n + γ + 1/n` for `n ≥ 3` (`1 > 0.5772 + 1/3`), so Pomerance's constant `(2/π)(γ + log 2 + 3/n)` does not follow from it. The needed bound is `Real.eulerMascheroniSeq_lt_eulerMascheroniConstant` (`Mathlib/NumberTheory/Harmonic/EulerMascheroni.lean` line 159, with `eulerMascheroniSeq n = harmonic n − log (n + 1)`, line 50) together with `log(1 + 1/n) ≤ 1/n`.

Repair: in the §3.3 `*Needs:*` and in the Mathlib contract list, replace "`harmonic_le_one_add_log`" by "`Real.eulerMascheroniSeq_lt_eulerMascheroniConstant` (`Mathlib/NumberTheory/Harmonic/EulerMascheroni.lean`, line 159: `harmonic n − log(n + 1) < γ`), with `log(1 + 1/n) ≤ 1/n`". `log_add_one_le_harmonic` (used in §5.1) stays.

## R06 (P3) — numeric slip in the §5.6 negative control

Location: `README.md` line 1595 ("equals `3` at `z = 4.99103…` (where `log z = (7 + √7)/6`)").

Claim: the threshold is `4.99103…`.

Witness: `(7 + √7)/6 = 1.607625…` and `exp(1.607625) = 4.99094…`; at `z = 4.99103` the right side is `2.99999 < 3`. The quoted interval "`4.9910 < z < 5`" and the conclusion are unaffected.

Repair: replace "`4.99103…`" by "`4.99094…`" (line 1595) and keep "`4.9910 < z < 5`".

## Verified sound

Counts: 37 declarations read (21 theorems, 16 definitions); 36 README targets read (§§0.1–6.8); 44 library locators verified at the pins (33 Mathlib, 11 Tau Ceti, every file and line in "Exact supplier contracts"; pins `1b1ccf4b` and `2fd255d9` match `lake-manifest.json`); 71 source locators verified against the cached texts; 63 Checks recomputed; 17 sibling citations resolved (SieveMethodsAndPrimePatterns §§1.1, 1.3, 1.6, 2.9, 5.2; CharacterSumsOverFiniteFields §§4.7, 7.1; EllipticLegendreCharacterInterfaces §5.1; AnalyticNumberTheoryPartI §§0.5, 0.8, 0.19, 0.20, 0.34, 1.5a at #1126; ExplicitPrimeCounting §0.1; ProbabilisticAndMetricNumberTheory §§2.5, 2.7), each at its open head, each with the hypotheses this roadmap quotes.

- Policy: no pull-request numbers or process words in README or docstrings; `theorem` only; no `set_option`, `#eval`, `#print`, `example`, `opaque`, `lemma`; `import Mathlib` alone; 21 `sorry`, all on theorems; every Lean name appears in the README and every backticked own name is declared (the resolve tool and my grep agree); `metadata.toml` `topic = "math.NT"`.
- Ownership: grepped all 476 open roadmap pull requests and main for Pólya–Vinogradov, Burgess, Kusmin, Brun–Titchmarsh, Büthe, Greaves, "free of small prime", "derivative test": no second owner of any Layer 1–5 object except R01; ProbabilisticAndMetricNumberTheory's "Kuzmin" hits are Gauss–Kuzmin (unrelated); its §2.5 states the finite lag inequality inside a proof, as the README says (settled F03). ExplicitNumberFields declares two gaps on this roadmap (`gap:burgess-moment-estimate`, `gap:polya-vinogradov-lapkova`); §4.1 provides the first exactly (shifted form and both `r = 2` refinements). The second asks for `A(q₀)` with `0.8204/√q₀`, the misprint of kerrmcgowntrudgian2020 line 122; §3.5 correctly provides `0.8204/log q₀` and says why (verified: at `q₀ = 10⁶` the printed form gives `2211.2 < 3020.2 =` Lapkova's odd bound). The ExplicitNumberFields gap text, not this package, needs the correction.
- `RosserSchoenfeldFiniteRangeInput` restates AnalyticNumberTheoryPartI §0.5's named input with the same range and strict inequalities; that roadmap's `Suggested.lean` does not declare it, so no fully qualified name is duplicated.
- Mathematics checked by computation (values on both sides): Kusmin–Landau attained by `x/2` on `[0, 2]` (`1 = cot(π/4)`); `A = 2.79368`; Patel's excess `8.454` at `L = 10, V = 2, W = 3`; `α₃ = 6.702`, `β₃ = 16.036` at `W = η = λ = 1`; the seven lag-sum coefficients `72/91, 72/55, 9/5, 392/435, 392/351, 98/78, 392/275`; `(B² − 4)(B − 4) = 16` at `B = 2 + 2√2`, `28 ≤ 28.97` at `H = 1, T = 6`, `27 < 28` at `B = 4.5`; the §1.6 example `1 ≤ 3.414`; Fejér constant `0.8106 > 0.81`; §2.1–2.3 examples (`5 ≤ 28`, `3 ≤ 20`, `3 ≤ 10`, count `6` against `227.4`, reduction `3 ≤ 6`); cosecant sums `4/3` and `2.462`, closed forms `1.579` and `2.682`; `0.911 ≤ 1.0986` at `p = 3`, `0.726 > 0.693` at `p = 2`; Pomerance's `2.087`, `4.515`; Lapkova's thresholds `980/979`, `33/32`, `L` at `18/19`, `23/24`, `A(10⁶) = 0.21861`, `A(1200) = 0.27905`; Frolenkov–Soundararajan `123.5`, `283`, `442`, crude factor `0.331`; the imprimitive witnesses `M_χ = 5` (modulus 2310) and `8` (4620), computed; `W₂(2) = 34` (quadratic, `p = 7`) and `22` (cubic); the per-tuple witness `Σ_x χ((x+1)(x+2)(x+4)(x+9)) = −9` at `p = 19` (and `11 > 2√29` at `p = 29`); the `r = 1` identity `12 = 3·7 − 9`; degenerate counts `22` (`d = 3, r = 3, H = 2`), `9.398·10¹⁵` and `1.0672·10¹⁶` at `r = 6, H = 100`; Jensen's factor `1.4622` and `r! 1.4622^r ≤ (2r − 1)!!` exactly from `r = 5`; §4.2's `88 447`, `313 600`, `446 ≤ 452.7` (pairs `33, 20, 20`); all fourteen rows of `McGownTableCertificate` (`C₀(8) = 2.272099 < 2.2721` the tightest; (A.1) from `1093 ≥ 1056` to `166 281 ≥ 7920`); `S(6) = 3.25`, `S(10) = 3.667`, `2.75 < 2.860`, `2.5 ≥ 2.497`, `S₆(7) = 1.4167 ≥ 1.139`, `H₁ = 1, 4, 6`, `γ + Σ log p/(p(p−1)) = 1.3326`; the §6.2 minimum margin on `[6, 2·10⁶)` is `0.0441` at `z → 10⁻` (full scan over squarefree jump points); Büthe's `42.86 < 43.43`, `2.5 < 7.40`, `24.57/21/13` against `13.35`, `4003.3 < 4039.0`, `4154.9`, `4073.0`, witnesses exactly `57 ≤ z ≤ 84`; Greaves `0.3155`, `0.374`, `0.748 ≤ 2`; §5.5's `8.69`, `13.03`, `3.434 ≤ 3.5`, `4.83 ≤ 7.19`; Fan's `3 < 4.46`, `11 < 15.4`, `1 < 3.70`, the `x = 7` failure (right side `2.99999` at `z = 4.991`, `2.9983` at `z → 5`), the `x = 8` values `3.43, 3.05, 2.92`, `0.76` at `z = e¹⁰`, and inequality (5) with ratio at most `0.898` for all `8 ≤ x < 600`; Treviño's `225.8√N`, `A = 40.3`, `s = 15.91`, `c = 0.2250`, `1.080 < 1.649`; the 123 primitive characters of modulus `≤ 25` all satisfy `LapkovaBound` (tightest the odd quadratic character modulo 23, `5 ≤ 7.356`); the largest ratios over primitive characters of modulus `3 ≤ q ≤ 47` are `0.746` (classical), `0.478` (Pomerance even), `0.571` (odd).
- Proof routes re-derived: §0.3 (Cauchy–Schwarz expansion, the `|C(h)|` corollary and the `2Y` normalisation); §1.4 (every term of `α₃`, `β₃` from Patel's (26) and the lag sums, including the sign of the `W` exponents: the proof gives `W^{−1/3}`, `W^{−2/3}`, and Patel line 183 confirms monotonicity); §1.5 (each of the ten fourth- and fifth-derivative constants with its `L` and `W` exponent, and `β₄ = 9/5` from displays (33) and (35)); §2.2 (the product bound and the two-value case); §4.1 (the Jensen argument for odd `d`, the moment bound, and the `r = 2` order-2 correction: with the true per-tuple bound `2√p + 1` the difference right side minus `W₂` is at least `4h(h−1)(3h−4)√p + h + 10h(h−1) − 12h(h−1)(h−2) − h(h−1)(h−2)(h−3)`, which contains the README's weaker lower bound, and the large-`h` branch `h²(hp − h²) < h⁴√p`); §5.1 (kernel identity, coprime comparison, `58/√z ≤ 0.2626` from `z ≥ 48 783`); §5.2 (Rankin's bound: `(1 + g p^σ)/(1 + g) = 1 + κ(p)(p^σ − 1)/p` and `z^σ = s/(2B)`); §5.3 (`selbergTerms(d) = 1/φ(d)` at `ν = 1/p`, the level `⌊z⌋ + 1/2`, `Σ|λ_n| = H_k/S_k`); §5.5 dyadic corollary (`3(1 + log 2/log 121) = 3.434`); §5.6 (`(x + z²)/S(z)` from §2.9 with class `0`).
- Lean against README: every binder, cast and exponent compared with the elaborated types in `signatures.md`; all real exponents are real literals; `2r − 1` is natural only inside `Nat.doubleFactorial`; no section variable lost; degenerate instances (`a = b`, `L = 1`, `H = 1`, `d = 1` with `H₁ = 1`, `B < 1`, `y = 0`, `N = 0`) are vacuous or trivially true, never false; the quantifier order of every "uniform" bound matches its source.
- Sibling conventions: `S_χ(M, N) = Σ_{M<n≤M+N}` agrees with trevino2015 line 10, mcgown2012 (`(N, N + H]`), tmeemt-art15 and ExplicitNumberFields' gap text; `e(x) = exp(2πix)` with `Real.fourierChar_apply`; `π(x; k, l)` agrees with ExplicitPrimeCounting §0.1; the forbidden-residue large sieve constant `H − 1 + Q²` and `J(Q)` agree with SieveMethodsAndPrimePatterns §2.9; Weil's bound `(m − 1)√q` with CharacterSumsOverFiniteFields §4.7; the point count `q + 1 + Σ χ(f(x))` with EllipticLegendreCharacterInterfaces §5.1 (singular equations included, odd characteristic); the Rosser–Schoenfeld ranges `59`, `319`, `286`, `319` with AnalyticNumberTheoryPartI §§0.5, 0.8, 0.19, 0.20.

### Adversarial pass record

| statement | instances tried | values (left / right) | result | change |
|---|---|---|---|---|
| `intervalExpSum` | `f ≡ 0` on `[0,2]`, `[0.2,0.8]`; `x/2` on `[0,3]`, `[0,2]` | `3`; `0`; `0`; `1` | as README | none |
| `nearIntegerCount` | `x/3`, `a=0,N=6,δ=0.1`; `a=N=1,δ=1/3`; `N=0` cases | `3`; `0`; `1`, `0` | as README | none |
| §0.3 lag inequality | `N=1`; `H=1`; `b=(1,1),H=2`; `(1,−1)`; `b=(1),H=3`; normalised `(1,1,1)` | `16 ≤ 18`; `0 ≤ 6`; `9 ≤ 9`; `1 ≤ 3.33` | true | none |
| `charIntervalSum`, `M_χ` | quadratic mod 3, 5; principal mod 3 | `M_χ = 1, 2`; `S(0,6)=4 > 2` | as README | none |
| §0.5 even symmetry | mod 5 even; `χ₄`; principal mod 5 | `2 = 2·1`; `1 < 2`; `φ(5) − Σ` | as README | none |
| §0.6 reduction | principal mod 6; `χ₄` at level 12; primitive | `2 = 6−3−2+1`; `2 = 1+1`; `r = 1` | true | none |
| `kusmin_landau` | `x/2` on `[0,2]`; `x/3` on `[0,1]`, `[0,2]`; `a = b` | `1 = cot(π/4)`; `1 ≤ √3`; `0`; vacuous | true | none |
| §1.2 asymmetric | `U=V=1/θ`; `x/3`, `U=3,V=3/2`; `U=1` | `2/(πθ)`; `1 ≤ 1.43`; excluded | true | none |
| `second_derivative_test(_sqrt)` | `x²/200` on `[0,10]`; `λ ≥ π/4` regime; `a=b` | `≤ 11` vs `50.5`; `λ + 4√(λ/π) ≥ 1` so trivial; vacuous | true | none |
| `third_derivative_test` | constants at `W=η=λ=1`; sign of `W` exponents re-derived; `L=1` | `6.702`, `16.036`; negative exponents; vacuous | true | none |
| `fourth/fifth_derivative_test` | all ten constants and exponents re-derived; `W/m ≤ 1` branch | `9/5` from (33),(35); `α̃₃ ≥ 2+2√2`, `α̃₄ ≥ 1.739` | true | none |
| `iterated_vanDerCorput` | `d=1,H₁=1`; `d=1,H₁=Y=2,f≡0`; `B` property at `H=1,T=6`; `f=x²`, `a=(1)`, `(1,1)` | `≤ 2` vs `4.83`; `1 ≤ 3.414`; `28 ≤ 28.97`; `2x+1`, `2` | true | none |
| §2.1 reduction | `f≡0`, `x/2`, `N=4,δ=0.1,H=2`; `δ=0.2` | `5 ≤ 28`; `3 ≤ 20`; `K=1` | true | none |
| `first_derivative_test_points` | `x/10`, `N=20`, `δ=0.05`; `δ=0.49`; `N=0`; two-value case algebra | `3 ≤ 10`; `≥ N+1`; `≤ 1 ≤ RHS` | true | none |
| `second_derivative_test_points` | `x²/100`, `N=50`, `δ=0.01`; `N=10` excluded; reduction example; `δ ∈ [1/4,1/2)` | `6 ≤ 227`; `0.2 < 1`; `3 ≤ 6`; `≥ 10.4N` | true | none |
| `polya_vinogradov_classical` | `q = 3, 5`; `q = 2`; `q = 1`; all primitive `q ≤ 47` | `1 < 1.579`; `2 < 2.682`; no primitive χ; excluded; ratio `0.746` | true | none |
| `polya_vinogradov_pomerance` | `q = 3` odd, `5` even; `q ≤ 47` | `1 ≤ 2.087`; `2 ≤ 4.515`; `0.478/0.571` | true | none |
| `LapkovaBound`, `polya_vinogradov_lapkova` | all 123 primitive χ, `q ≤ 25`; thresholds `980/33` | tightest `5 ≤ 7.356`; `31.304 ≤ 31.305`, `5.741 ≤ 5.745` | true | none |
| `polya_vinogradov_frolenkov_soundararajan` | `q=1000`; mod 2310 from χ₃; mod 4620 from χ₄ | `123.5` vs trivial `200`; `5 ≤ 196.8`; `8 ≤ 288.9` | true | none |
| `burgess_moment_bound` | `r=1,B=3,p=7`; `r=2,p=7,h=2`; `B<1`; `B ≥ p`; `d=3,r=3,H=2` count | `12 = 12`; `34 ≤ 211`; `0`; periodic; `22 ≤ 120` | true | none |
| §4.1 `r=2` refinement | `p=19` tuple `(1,2,4,9)`; `p ≤ 1200` ratio at `h=1` | `−9`, modulus in `(8.72, 9.72]`; `(p−1)/p` | true, source's `2√p` false | none (README already corrects) |
| §4.2 energy counts | `A=28,N=400,p=10⁷`; primes `{2,3,5}`, `N=100`, `p=1009` | `88 447 < 313 600`; `446 ≤ 452.7` | true | none |
| `burgess_mcgown_parametric` | `d = 4` excluded; `π(4)` against `4/(1+log 4)` | denominator `0`; `2 ≥ 1.676` | true | none |
| `McGownTableCertificate`, `burgess_mcgown_table` | all `r = 2..15` | `C₀ < C(r)` every row, tightest `10⁻⁶`; (A.1) every row | true | none |
| §4.5 / §6.7 / §6.8 | `r=2,p=10⁷` Table 1; `A` at `k=2/45`; `s`, `c`, `c√u` | `225.8√N`; `40.3 ≥ 28`; `15.91`, `0.2250`, `1.080` | true; `A ≥ 29` misread | R04 |
| `selbergDiagonal`, `selbergWeightMass` | `z = 6, 10, 5.99, 3..5, 2.99`; `S₆(7)`; `H₁(1..3)` | `3.25 ≥ 2.862`; `2.75 < 2.860`; `2.5 ≥ 2.497`; `1.4167 ≥ 1.139`; `1,4,6` | true | none |
| `MVDiagonalFiniteRange` | all squarefree jump points `6 ≤ n < 2·10⁶` | min margin `0.0441` at `10⁻` | true on scanned range | none |
| `greaves_density_sum` | `s = 2B`; `κ ≡ 1, z = 3, s = 2`; `B = 0`; `κ ≡ 0`; `z` non-integer | `0`; `2 ≥ 0.748`; excluded; `1 ≥ 1`; `p < z` exact | true | none |
| `butheRho` | `f ≡ 1`; tent; `y = 0`; `f = 0` | `y`; `y/6`; `0`; `0` | as README | none |
| `buthe_weighted_brun_titchmarsh` | `f ≡ 1` (van Lint–Richert form); `l = 0, k = 1` | factor `1 + 8/log(y/k)`; whole progression | true | none |
| `ButheSmallRangeVerified` | `Y=100,z=7`; `Y=1.5,z=1`; `Y=20,z=7,1,2` | `42.86 < 43.43`; `2.5 < 7.40`; `24.57, 21 > 13.35 > 13` | as README | none |
| `ButheMediumRangeVerified` | `Y = 20000`, `z = 65, 40, 100`, all `z < 200` | `4003.3 < 4039.0`; `4154.9`, `4073.0`; witnesses `57..84` | as README | none |
| `buthe_weighted_prime_sum` | `[0,10]`; `[1.9,5.1]`; `y → 1⁺` | `4 < 8.69`; `3 < 5.50`; bound `→ ∞` | true | none |
| `ramare_viswanadham_prime_powers` | `d=1,A=B=10`; `d=3,a=1,A=B=30`; `A=1,B=7`; `A=B=2` | `4.25 ≤ 8.69`; `3.5 ≤ 13.03`; `4.83 ≤ 7.19` (outside hypotheses); `1.5 ≤ 5.77` | true | none |
| §5.5 dyadic | `M = 121, q = 1`; `q = 5` | `3.434 ≤ 3.5 ≤ 4.5`; needs `M ≥ 125` | true | none |
| `roughCount`, `fan_rough_count` | `(9,3)`, `(32,4)`, `(1.5,1.5)`, `(7, 4.991..5)`, `(8, z)`, `(8, e¹⁰)`, `8 ≤ x < 600` | `3 < 4.46`; `11 < 15.4`; `1 < 3.70`; `3 > 2.99999`; `≥ 2.92`; `1 > 0.76`; ratio `≤ 0.898` | true with `x ≥ 8`; decimal slip | R06 |
| `FanFiniteRange`, `RosserSchoenfeldFiniteRangeInput`, `LapkovaSmallModuliVerified` | content against fan2022 lines 215–222, 290–292; AnalyticNumberTheoryPartI §0.5; lapkova2018 lines 354–381 | same ranges, same strictness | as sources | none |

## Not verifiable

- The published version of trevino2015 (Int. J. Number Theory 11, 2015): the README cites the arXiv v2 tables; tmeemt-art15 lines 236–284 print a `c₂` table with a `p₀ = 10⁷` column and different values (e.g. `3.5341` against `3.5751` at `r = 2`, `p₀ = 10²⁰`), which may be the journal's table. The README states which version it reads; the discrepancy is recorded under Source issues as a gap, not resolved.
- The sign of the `W` exponents in patel2022 Lemma 2.5 (lines 163–164) and hiary2016zeta Lemma 1.2 (lines 93–94): the OCR drops the minus signs there while keeping them on the same lines elsewhere; tmeemt-art05 line 121 prints them negative, and the proof gives negative. Not a source issue; the README's reading is the proof's.
- Uncertified or waived texts cited by locator only: montgomeryvaughan1973 (Theorem 2, (3.3), Lemmas 7, 10), frolenkovsoundararajan2013 (Theorems 1, 2, Corollary 1), greaves2001 Theorem 1 p. 52, montgomeryvaughan2007 §9.4, bordelles2012, filaseta1990, karatsubakorolev2007, qiu1991, trevino2015kth Theorem 1.2, vanlintrichert1965, huxley-sargos-2006, bachmanrachakonda2001, siebert1976, rieselvaughan1983, nathanson1996, chenggraham2004, vinogradov2004, huxley1996, grahamkolesnik1991.
- Randomised Checks (`20 000` quadratics in §1.1, `4000` cubics in §1.3, `1500` functions in §1.6, `20 000` quadratics in §2.3, `150` characters in §3.6, `300` functions in §5.2, `20 000` progressions in §5.4, `3000` cases in §5.5): sampled statements, not recomputed.
- `MVDiagonalFiniteRange` above `2·10⁶`, `ButheSmallRangeVerified` off the stated grid, `ButheMediumRangeVerified` beyond `Y = 20000`, `FanFiniteRange` for `600 ≤ x < 2·10⁶` and for (4), (6): hypotheses of Layer 6, not recomputed.
- §6.8's values of the bracket of (59) (`4.7426`, `4.8535`) and of its right side (`1.57930`, `1.51537`): display (59) is not legible in the extraction beyond its first terms.
- Lean elaboration: no Lean was run (read-only brief); the `#check` pass is the package report's, and I compared its `signatures.md` with the README statement by statement.

## Source issues

- **Error** in kerrmcgowntrudgian2020 at Lemma 3, line 122: the source says the middle term of `A(q₀)` is `0.8204/q₀^{1/2}`; it should be `0.8204/log q₀`, since Lapkova's odd bound divided by `√q log q` has that term; affects a stated result.
- **Misprint** in patel2022 at Lemma 3.1, line 196: the source says `β₄` carries the factor `18/20`; it should be `18/10 = 9/5`, the factor its own displays (33) and (35) produce (lines 241, 263); affects a stated result.
- **Misprint** in patel2022 at Lemma 2.5, line 160: the source says four continuous derivatives; it should be three, the hypothesis the proof uses (the mean value theorem for `f″`) and the one Hiary's Lemma 1.2 states; affects nothing.
- **Error** in fan2022 at the Theorem, inequality (5), and its proof, line 222: the source says (5) holds for all `3 ≤ x < 289` from a verification over `9 ≤ n < 289`; it fails at `x = 7` for `4.99094 < z < 5`, where `Φ = 3` and the right side is below `3`; affects a stated result.
- **Error** in mcgowntrudgian2020 at the proof of Proposition 1, line 180: the source says the sum over four distinct roots is at most `2(r − 1)√p = 2√p` at `r = 2`; it should be `2√p + 1` (two points at infinity; witness `p = 19`, `(x+1)(x+2)(x+4)(x+9)`, sum `−9 > 8.72`); affects the proof (the stated (3) survives, as README §4.1 shows).
- **Misprint** in tmeemt-art05 at section 3 (the third-derivative theorem), line 123: the source says the constant `65/15`; it should be `64/15` (hiary2016zeta line 94); affects nothing.
- **Gap** in tmeemt-art15 at the `c₂` table, lines 236–284: the source says the columns are `p₀ = 10⁷, 10¹⁰, 10²⁰` with values such as `3.7451` and `3.5341`; the arXiv v2 Table 3 (trevino2015 lines 145–155) has columns `10¹⁰, 10¹⁵, 10²⁰` and `3.5751` at `(2, 10²⁰)`, and no cited text supports the page's column; affects nothing here (the README states the arXiv table).
