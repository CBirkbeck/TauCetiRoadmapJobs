# Review of ZerosOfLFunctions (pull request #1913 at 8888fbb)

**Verdict:** needs changes

This is an incremental re-review of the 94 changed lines since `e39fba2`. The changes are:

- the Check in 1.1 showing that `Complex.log ∘ Γ` is not a branch;
- the scope paragraph on uniformity (README lines 87–91);
- the width statement in 8.7 and its new Check (README lines 2028–2047, 2082–2087);
- the Lean statement `rayClassPrimeCount_effective` and the module docstring.

All new mathematics checks out: the width argument, the threshold values, the ray crossings and the quantifier order. The gate passes and the dependency check reports 0 problems. Two P3 items remain, and neither is mathematical:

- the pull request's description and order against #1907 (R01, carried);
- one ambiguous docstring sentence (R02, new).

Paths: `TauCeti/…` is a file of the pinned Tau Ceti and `Mathlib/…` a file of the pinned Mathlib. Other roadmaps are read on main unless a pull request is named.

## R01 (P3) — The title, description and merge order are stale, and no order is stated against #1907 (previous R01, not repaired)

**Location.**
- The title still reads "effective statements under the exclusion of Landau–Siegel zeros".
- The description still restates the roadmap "in their unconditional, effective form". It asks to merge "after AnalyticNumberTheoryPartI (#1126) lands".

**Claim.** The description matches this head, and the order against the other open pull request on this roadmap is settled.

**Witness.**
- README lines 87–88 still exclude "the nonexistence of exceptional zeros", and lines 2293–2294 keep "the exceptional-zero alternative of 6.3–6.4". AnalyticNumberTheoryPartI is at `ORDER.txt` line 50, after this roadmap (line 48).
- `roadmaps overlaps` still reports "#1907 and #1913 conflict" in both files. At #1907's head `123254c`:
  - `heckeLFunction_zeroFreeRegion` (line 165) conjoins the two clauses that this head (line 154) states separately.
  - `rayClassPrimeCount_effective` (line 339) now has this head's quantifier order, with `c` chosen before `K`. It still counts a different set, `{I : integralIdealsPrimeTo 𝔪 | I.IsPrime ∧ …}`, where this head (line 309) counts `HeightOneSpectrum` primes.
  - `frobeniusPrimeCount_effective_abelian` (line 367) takes `K L : Type`, where this head (line 340) takes `Type*`.

**Repair.**
1. Retitle the pull request and describe this head. Its content is:
   - the general-field headlines at the pin;
   - the consumed Tau Ceti holomorphic-logarithm and image lemmas;
   - 8.7's width, uniform over the fields of each degree.
2. Delete the merge-order sentence about AnalyticNumberTheoryPartI.
3. State which of #1913 and #1907 is rebased on the other. The rebased one reconciles the three statements above.

**Test.** The new description agrees with README lines 87–91 and 2293–2294. After the rebase, `roadmaps overlaps ZerosOfLFunctions` reports no conflict between the two heads.

## R02 (P3) — "the constant is absolute" in the docstring of `rayClassPrimeCount_effective` does not say which constant

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` lines 303–307 contain two sentences that collide:
- "…`O(x exp(−c √log x))`, the implied constant depending on `K` and `𝔪`…"
- "…the ideal-counting constant `rayClassIdealMainTerm 𝔪`. At `n = 1` the constant is absolute, and `K = ℚ`, `𝔪 = (q)∞` give `primeCounting_progression_effective`."

**Claim.** At `n = 1`, the width `c` is absolute.

**Witness.**
- The sentence comes right after the docstring names an implied constant and an ideal-counting constant. Read as the implied constant, it is false: at `K = ℚ` the implied constant still depends on `𝔪 = (q)∞`.
- README lines 89–91 say exactly this: "no implied constant … is uniform in the modulus".
- README lines 2028 and 2047 say "absolute at `n = 1`" and "where the width is absolute", which are unambiguous.

**Repair.** Replace "At `n = 1` the constant is absolute" with "At `n = 1` the width `c` is absolute".

**Test.** The reworded sentence agrees with README lines 2028 and 2047. It also agrees with `primeCounting_progression_effective` (line 327), whose `c` is absolute and whose `IsBigO` constant depends on `q`.

## Previous findings

- R01 — not repaired: the description still says "effective statements under the exclusion of Landau–Siegel zeros … after AnalyticNumberTheoryPartI (#1126) lands". `roadmaps overlaps` still reports "#1907 and #1913 conflict" in both files. Carried as R01.

## Verified sound

### Gate, dependency check and elaboration

- **Gate.** My run of `gate … ZerosOfLFunctions --base origin/main` prints every check at 0, ending `outside-folder=0 source-material=0 OK`, and exits 0. The worker's gate on this head (`build=0` included) also passes.
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check.** It exits 0 and prints no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 236 roadmaps, 2259 edges, 0 problem(s)
```

- **Elaboration.** `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits 0. Its only output is 17 "declaration uses `sorry`" warnings, at lines 97, 109, 123, 136, 154, 173, 184, 201, 214, 228, 246, 261, 277, 293, 309, 327 and 340.
- **`#check` comparison.**
  - I built a scratch copy with `#check @…` for all 20 declarations. It elaborates with 0 errors.
  - All 20 types match `signatures.md` once namespace prefixes (`Set.`, `Real.`, `Filter.`) are normalized. No binder is lost.
  - The changed `rayClassPrimeCount_effective` elaborates as `∀ n, ∃ c, 0 < c ∧ ∀ (K : Type u_1) [Field K] [NumberField K], finrank ℚ K = n → ∀ 𝔪 a, (…) =O[atTop] …`. This is the README's quantifier order: the width comes before `K`, and the `IsBigO` constant comes after `K`, `𝔪` and `a`.
- **Lean probes on the changed statement.** Both elaborate in the scratch copy:
  1. `rayClassPrimeCount_effective.{0} 1` applied to `ℚ` with `Module.finrank_self ℚ` proves one `c` for every modulus of `ℚ`. This is the uniform-in-`𝔪` form that `primeCounting_progression_effective` needs.
  2. `Module.finrank_pos.ne'` closes `finrank ℚ K ≠ 0`, so `n = 0` is vacuous, and true.
- **Headlines and padding.** No declaration was added or removed. The 17 headline theorems of the previous report are all stated. The changed theorem is the deep 8.7 count and is not closable in one tactic, so there is no padding.

### The changed passages, checked

- **1.1, the "not a branch" Check (README 595–601).**
  - I recomputed the expansion from Stirling: `Im((s − ½) log s − s) = r sin θ log r + r(θ cos θ − sin θ) − θ/2` at `s = r e^{iθ}`.
  - The next term, `Im(1/(12s)) = −sin θ/(12r)`, matches the computed remainder × `r`: `−0.08333`, `−0.05893` and `−0.00832` at `r = 200` for `θ = π/2, π/4, 0.1`.
  - The ray lies in `S_δ` for every `δ < π` once `0 < θ < π − δ`. `θ = π/2` needs `δ < π/2`, as the Check says.
  - This repairs the remark on 1.1's Check in the previous report.
- **Scope (README 87–91).** It agrees with each effective statement:
  - 8.5's `c` is per `K` (line 1943);
  - 8.6's is per `K` and `χ` (1965);
  - 8.7's width is per degree, with its implied constant per `K` and `𝔪`;
  - 8.8's `c₀` is per `L/K` (2099).
- **8.7, the width (README 2028–2041).**
  - 6.4's constant depends on `n` alone and is chosen before `K` and `χ` (README 1527–1528, Lean line 155).
  - The 6.4 source locator says the same: kadiri2012 lines 70–71 call `R₄` "independent of `K`".
  - The chain `log(|d_K|𝔑𝔣(T+3)^n) ≤ n√log x + log(|d_K|𝔑𝔪) + n log 2` holds when `T ≥ 3`, which "once `x` is large" covers. The truncation error `O(x log x log(xT)/T)` of 8.3 at `T = exp(√log x) ≤ x` is `O(x log² x e^{−√log x})`.
  - Zeros in the 6.4 region that 6.3 does not call exceptional satisfy `β < 1 − c_n/log q(χ,0)`. That is a constant for fixed `K` and `𝔪`, so these zeros also obey `|x^ρ| ≤ x e^{−(c_n/2n)√log x}` for large `x`, with `c_n = heckeZeroFreeConstant n` (6.2).
  - *Needs:* now lists 6.4 and 4.5, and Layer 8's Dependencies already include Layers 4.5 and 6.
- **The module docstring (lines 40–44)** agrees with the new statement.

### Sources: the seeded sample

- **In the changed passages.**
  - **1.1.** The changed Check carries no locator.
  - **1.2**, which the changed Check uses. DLMF 5.11.1 (dlmf5 lines 104–108) gives the expansion of the general `Ln Γ(z)` in the sector `|ph z| ≤ π − δ`, with first correction `B₂/(2z) = 1/(12z)`. That supports 1.2's `O(1/‖s‖)` and the Check's remainder.
  - **6.2/6.3**, through 6.4, which 8.7's width uses. kadiri2012 lines 65–73 report the Lagarias–Montgomery–Odlyzko regions (1.5)–(1.6) with `R₄` independent of `K`. Lemma 2.3 itself is settled as uncertified.
- **Outside the changed passages.** These targets are untouched by the diff and were not re-verified this round: 0.2, 0.3, 0.4, 1.4a, 3.1, 3.4, 3.5, 4.3, 5.3, 7.3 and 7.6.
- **Unverified flags.** The README flags no locator as unverified.

### Ownership and citations

- **The 8.7 names.** `roadmaps grep 'rayClassPrimeCount|primeCounting_progression_effective'` finds no second owner. The only other occurrences are:
  - #1907, a revision of this roadmap (R01);
  - ExplicitPrimeCounting (#1945) README line 430, a consumer of `primeCounting_progression_effective`, whose statement is unchanged.
- **Old signature.** No roadmap on main or at an open head consumes the old `rayClassPrimeCount_effective (K) (𝔪)` signature.
- **`citations.md` leads (13).** All are in untouched text and were resolved in the previous report:
  - six PrimeNumberTheoremAnd names in the Provenance table;
  - seven L-functions Layer 6 names.
- **`overlaps.md`.** It reports no dropped id and no revision-only id. The #1907 conflict is R01.

### Adversarial table

- **Method.** Values were computed this round in pure Python, using:
  - `log Γ` by 20-step recurrence plus the Stirling series, checked against Lanczos `Γ` to `10⁻¹³`;
  - bisection for the crossings;
  - a sieve to `10⁶`;
  - the Ramanujan series for `li`.

  The Lean probes are the ones above.
- **Carried rows.** Rows marked "r23" are carried from the previous report, PRREVIEW-ZerosOfLFunctions~23, for statements this diff leaves untouched.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.1 Check, `Complex.log ∘ Γ` not a branch (changed) | rays `θ = π/2, π/4, 1/10` | first odd-multiple crossing `r = 5.5386, 4.1513, 12.6264` (README `5.539, 4.151, 12.626`); `Γ(s)` there `−1.774·10⁻⁴`, `−0.43124`, `−1.50·10⁸` (negative reals); minimum of `Im logGamma` before it `−1.872, −0.601, −0.058 > −π`, so the first crossing is `+π`; expansion there `3.1567, 3.1558, 3.1423` against `π = 3.1416` | sound | none |
| 1.1 Check, ray in `S_δ` (changed) | `δ = 0.1, 1.6, 3.0` | `θ = π/2` admissible iff `δ < 1.5708`; `θ = 0.1` admissible iff `δ < 3.0416`; some `θ ∈ (0, π − δ)` exists for every `δ < π` | sound | none |
| Scope, lines 87–91 (changed) | 8.5, 8.6, 8.7, 8.8 | width per `K`; per `K, χ`; per `n` (implied constant per `K, 𝔪`); per `L/K`; no implied constant uniform in `𝔪` or `χ` anywhere | sound | none |
| 8.7 width chain (changed) | 10⁵ random `n ≤ 8`, `d_K, 𝔑𝔪 ≤ 10⁶`, `𝔑𝔣 ≤ 𝔑𝔪`, `log x ∈ [1.207, 400]`; `log x = 0.5` | no failure when `T ≥ 3`; at `log x = 0.5`, `log(T+3) = 1.6150 > √log x + log 2 = 1.4003` (covered by "x large") | sound | none |
| 8.7 `c₀ = min(c_n/2n, 1)/2` (changed) | `c_n = 0.1, n = 3`; `c_n = 5, n = 1` | `(log x·e^{−(c_n/2n)u} + log²x·e^{−u})/e^{−c₀u}` at `log x = 10², 10⁴, 10⁶, 10⁸`: `92.5, 4346.0, 240.4, 6.4·10⁻²⁹`; `67.4, 1.9·10⁻¹⁴, 0, 0`: bounded | sound | none |
| 8.7 new Check, thresholds (changed) | `q = 1, 3, 10⁶` | `T = 2.302776, 4.854102, 1000002.99999`; `log x = 0.6957, 2.4958, 190.8684` (README `0.696, 2.496, 190.868`); at the threshold `log(q(T+3)) = 2√log x = 1.668230, 3.159648, 27.631027`; at `0.999·log x` the bound fails | sound | none |
| `rayClassPrimeCount_effective` (changed) | `n = 0`; `n = 1, K = ℚ`; `𝔪 = (3)∞`, `𝔪 = 1`, `x = 10⁶` | `n = 0` vacuous (`finrank_pos`); `n = 1` gives one `c` for all moduli of `ℚ` (probe); counts `39231` (`≡ 1`), `39266` (`≡ 2`) against `Li/2 = 39313.252`; `78498` against `Li = 78626.504` (`li 2 = 1.045164`) | sound | none |
| Docstring of `rayClassPrimeCount_effective` (changed) | "the constant" read as implied constant at `n = 1` | depends on `q` for `𝔪 = (q)∞`: false reading; read as width: true | ambiguous | R02 |
| Module docstring (changed) | lines 40–44 against line 309 | "width uniform over the fields of degree `n`" matches `∃ c, ∀ K, finrank ℚ K = n → …` | sound | none |
| 1.1 `S_δ = exp '' Ω_δ` | r23 | `‖exp(0.3+2.5i)‖ = 1.349859`, `arg 2.5 < 2.6416` | sound (r23) | none |
| 1.1 branch | r23 | `logGamma 3 = 0.693147`; `3 + 4i`: `−1.756627 + 4.742664i` (recomputed this round: `−1.7566268 + 4.7426644i`) | sound (r23) | none |
| 1.1 uniqueness and contracts | r23 | `S_1 ⊆ S_0.5`, `h 2 = 0`; 9 names elaborate | sound (r23) | none |
| 8.8 Checks 1–3 | r23 | fibre `2·1/4 = 1/#G`; `(1/2)(−1) = −0.5`; `χ₈(5) = χ₋₈(5) = −1` | sound (r23) | none |
| 0.2 (sample) | r23 | `2Λ(2) = 1.047198 = π/3`; `ζE(0) = 1` | sound (r23) | none |
| 1.3 / 1.3a | r23 | `−14.789025`, `−61.912915`; `π/cosh πt` | sound (r23) | none |
| 2.1, 2.3, 2.4 | r23 | `12`; `90` against `15.75`; `Δ`: `90.0` | sound (r23) | none |
| 4.2, 4.4 | r23 | divisor at `0` is `0`; `−75.665` against `−78.540` | sound (r23) | none |
| 5.3, 5.5 (sample) | r23 | `0.540303` against `cos 1 = 0.540302`; `−0.546302 = −tan 0.5` | sound (r23) | none |
| 6.5, 7.2, 8.4, 8.9 | r23 | `0.5`; `0` against `1`; residues `+m_ρ φ̃(ρ)`; `5.120436` | sound (r23) | none |
| `dirichletLFunction_convexity` | r23 | `‖ζ(½)‖ = 1.4603545` | sound (r23) | none |
| `hadamard_of_orderLE_one`, `zetaEntireCompletion_hadamard` | r23 | `1 − s = e^{−s}E₁(s)`; `B = −0.0230957` | sound (r23) | none |
| `riemannZeta_zeros_summable_ordinate` | r23 | first pair `0.0099606` | sound (r23) | none |
| `heckeLFunction_zeroFreeRegion` | r23 | `c < log 45 = 3.806662` | sound (r23) | none |
| `riemannZeta_zeroFreeRegion`, `dirichletLFunction_zeroFreeRegion` | r23 | `c < 3 log 3 = 3.295837`; `0.69343` at `ρ = 0` | sound (r23) | none |
| `neg_re_logDeriv_riemannZeta_le` | r23 | `−ζ'/ζ(2) = 0.56996` | sound (r23) | none |
| `riemannVonMangoldt`, `_heckeLFunction`, `_dirichlet` | r23 | `29.0023` against `29`; `156.636494`; `7.3366` | sound (r23) | none |
| `chebyshevPsi_explicitFormula`, `riemannZeta_weilExplicitFormula` | r23 | `‖x^ρ/ρ‖ ≤ x/T`; reflection `y = 1/u` | sound (r23) | none |
| `primeIdealCount_effective` | r23, recomputed | `78498` against `78626.504` | sound | none |
| `primeCounting_progression_effective` | r23, recomputed | `q = 4, a = 3`: `39322` against `39313.252` | sound | none |
| `frobeniusPrimeCount_effective_abelian` | r23 | `39322` against `39313.252` | sound (r23) | none |
| #1907 against #1913 | the three shared names at `123254c` | conjoined clauses; same quantifier order but a different counted set; `Type` against `Type*` | order unstated | R01 |

### Remarks on untouched text

- Lagarias–Odlyzko 1977, cited by locator in 8.8 and in References, still has no entry in the package's `sources.toml`.

## Not verifiable

- **Paywalled books and papers, cited by locator.** These were not read, and no legal open copy is known. Every value the changed text relies on was recomputed instead (table above).
  - Davenport §§17–20 (8.3, 8.7);
  - Titchmarsh Theorem 9.2 (4.5);
  - Lagarias–Odlyzko 1977 (8.8).
- **Lagarias–Montgomery–Odlyzko 1979, Lemma 2.3** (6.4, behind 8.7's width). Settled as uncertified. Only its report in kadiri2012 lines 65–73 was read.

## Source issues

- **Misprint** in kadiri2012 at §1, display (1.6), p. 2 (arXiv v1): the source says Lagarias–Montgomery–Odlyzko show `L(s, χ)` has no zeros in region (1.6), which near the real axis overlaps (1.5), where one zero is allowed; it should be no zeros in (1.6) apart from the possible real zero of (1.5); affects nothing.
