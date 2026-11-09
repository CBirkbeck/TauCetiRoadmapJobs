# Review of ZerosOfLFunctions (pull request #1913 at c4cb18f)

**Verdict:** needs changes

This is an incremental re-review of the 2 changed lines since `8888fbb`. The only change is one docstring sentence of `rayClassPrimeCount_effective` in `Suggested.lean` (line 307). That change repairs the previous R02. The gate passes and the dependency check reports 0 problems.

One P3 item remains, and it is not mathematical: the pull request's description, and the unstated order against #1907 (R01, carried).

Paths: `TauCeti/…` is a file of the pinned Tau Ceti and `Mathlib/…` a file of the pinned Mathlib. Other roadmaps are read on main unless a pull request is named.

## R01 (P3) — The title, description and merge order are stale, and no order is stated against #1907 (previous R01, not repaired)

**Location.**
- The title still reads "effective statements under the exclusion of Landau–Siegel zeros".
- The description still restates the roadmap "in their unconditional, effective form". It still asks to merge "after AnalyticNumberTheoryPartI (#1126) lands".

**Claim.** The description matches this head, and the order against the other open pull request on this roadmap is settled.

**Witness.**
- README lines 87–88 exclude "the nonexistence of exceptional zeros", and lines 2293–2294 keep "the exceptional-zero alternative of 6.3–6.4". AnalyticNumberTheoryPartI is at `ORDER.txt` line 50, after this roadmap (line 48).
- `roadmaps overlaps ZerosOfLFunctions` still reports "#1907 and #1913 conflict" in both files. #1907's head is unchanged at `123254c`, where:
  - `heckeLFunction_zeroFreeRegion` (line 165) conjoins the two clauses that this head (line 154) states separately;
  - `rayClassPrimeCount_effective` (line 339) counts `{I : integralIdealsPrimeTo 𝔪 | I.IsPrime ∧ …}`, where this head (line 309) counts `HeightOneSpectrum` primes;
  - `frobeniusPrimeCount_effective_abelian` (line 367) takes `K L : Type`, where this head (line 340) takes `Type*`.

**Repair.**
1. Retitle the pull request and describe this head. Its content is:
   - the general-field headlines at the pin;
   - the consumed Tau Ceti holomorphic-logarithm and image lemmas;
   - 8.7's width, uniform over the fields of each degree.
2. Delete the merge-order sentence about AnalyticNumberTheoryPartI.
3. State which of #1913 and #1907 is rebased on the other. The rebased one reconciles the three statements above.

**Test.** The new description agrees with README lines 87–91 and 2293–2294. After the rebase, `roadmaps overlaps ZerosOfLFunctions` reports no conflict between the two heads.

## Previous findings

- R01 — not repaired: the description still says "effective statements under the exclusion of Landau–Siegel zeros … after AnalyticNumberTheoryPartI (#1126) lands". `roadmaps overlaps` still reports "#1907 and #1913 conflict" in both files. Carried as R01.
- R02 — repaired: `Suggested.lean` line 307 now reads "At `n = 1` the width `c` is absolute, and `K = ℚ`, `𝔪 = (q)∞` give `primeCounting_progression_effective`". The repair introduces no new problem (see below).

## Verified sound

### Gate, dependency check and elaboration

- **Gate.** My run of `gate … ZerosOfLFunctions --base origin/main` prints every check at 0, ending `outside-folder=0 source-material=0 OK`, and exits 0. The worker's gate on this head (`build=0` included) also passes.
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check.** It exits 0 and prints no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 236 roadmaps, 2261 edges, 0 problem(s)
```

- **Elaboration.** `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits 0. Its only output is 17 "declaration uses `sorry`" warnings, at lines 97, 109, 123, 136, 154, 173, 184, 201, 214, 228, 246, 261, 277, 293, 309, 327 and 340.
- **`#check` comparison.**
  - I built a scratch copy with `#check @…` for all 20 declarations. It elaborates with 0 errors.
  - `git diff 8888fbb HEAD` changes one docstring line and no declaration type, so all 20 types are those of `signatures.md`, with no binder lost. The elaborated `rayClassPrimeCount_effective` is `∀ n, ∃ c, 0 < c ∧ ∀ (K : Type u_1) [Field K] [NumberField K], finrank ℚ K = n → ∀ 𝔪 a, (…) =O[atTop] fun x => x * rexp (−c * √(log x))`.
- **Lean probes on the changed docstring.** Both elaborate in a scratch copy:
  1. `rayClassPrimeCount_effective.{0} 1`, applied to `ℚ` with `Module.finrank_self ℚ`, proves `∃ c > 0, ∀ (𝔪 : Modulus ℚ) (a : RayClassGroup 𝔪), …`. That is one width for every modulus and class of `ℚ`, which is exactly the new sentence.
  2. `Module.finrank_pos.ne'` closes `finrank ℚ K ≠ 0`, so `n = 0` is vacuous, and true.
- **Pinned declarations opened.**
  - `Module.finrank_self` (`Mathlib/LinearAlgebra/Dimension/StrongRankCondition.lean:464`);
  - `Modulus` (`TauCeti/NumberTheory/NumberField/Global/RayClass/Modulus.lean:98`);
  - `integralIdealsPrimeTo` (same file, line 544);
  - `RayClassGroup` (`TauCeti/NumberTheory/NumberField/Global/RayClass/Basic.lean:130`);
  - `idealClass` (same file, line 182);
  - `TauCeti.Real.logIntegral`, `∫₂ˣ dt / log t` (`TauCeti/Analysis/SpecialFunctions/LogIntegral.lean:141`).
- **Headlines and padding.** No declaration was added or removed. The 17 headline theorems of the previous report are all stated, and the change adds no padding.

### The changed passage, checked

The new sentence (line 307) says that at `n = 1` the width `c` is absolute. It agrees with:
- **The Lean statement.** `∃ c` precedes `K`, `𝔪` and `a`, and every `K` with `finrank ℚ K = 1` is `ℚ` (probe 1).
- **The README.**
  - Line 2028: `c₀` depends "only on the degree … and absolute at `n = 1`".
  - Line 2063: "At `K = ℚ`, where the width is absolute".
  - Lines 2087–2088: the `n = 1` case must match `primeCounting_progression_effective`, "whose `c` is absolute".
  - Scope lines 89–91: the width, not any implied constant, is uniform in the modulus.
- **The rest of the same docstring.** It still says that the implied constant depends on `K` and `𝔪` (line 304). The two constants are now named apart.
- **`primeCounting_progression_effective`.** Its docstring (line 322) says "There is an absolute `c > 0`" and that "the implied constant depend[s] on `q`". This matches the specialization `𝔪 = (q)∞`, where `#Cl_𝔪 = φ(q)`.

### Sources: the seeded sample

- **8.7 Effective counting in a ray class.** This is the only sampled target in the changed passage.
  - The width comes from 6.4. kadiri2012 lines 65–73, re-read this round, report Lagarias–Montgomery–Odlyzko Lemma 2.3: regions (1.5)–(1.6) with `R₄` "independent of `K`". That supports a width depending only on the degree, in particular an absolute one at `n = 1`.
  - Davenport §20 (8.7's `K = ℚ` locator) is settled as uncertified; see Not verifiable.
- **Not re-verified this round.** These sampled targets lie outside the changed passage: 0.1, 0.3, 1.1, 2.1, 2.4, 3.1, 3.4, 4.3, 4.5, 6.1, 6.2, 6.3, 6.4 and 7.6. Their earlier verification stands (previous reports).
- **Unverified flags.** The README flags no locator as unverified.

### Ownership and citations

- **Ownership.** The change touches no name. `rayClassPrimeCount_effective` and `primeCounting_progression_effective` have no second owner; the previous report's grep found only #1907 (R01) and the consumer ExplicitPrimeCounting.
- **`citations.md` leads (13).** All are in untouched text and were resolved in earlier reports:
  - six PrimeNumberTheoremAnd names in the Provenance table;
  - seven L-functions Layer 6 names.
- **`overlaps.md`.** It reports no dropped id and no revision-only id. The #1907 conflict is R01.

### Adversarial table

- **Method.** Values were computed this round in pure Python, using a sieve to `10⁶` and the Ramanujan series for `li`. The Lean probes are the ones above.
- **Carried rows.** Rows marked "r24" are carried from the previous report, PRREVIEW-ZerosOfLFunctions~24, for statements this diff leaves untouched.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Docstring of `rayClassPrimeCount_effective`, line 307 (changed) | `n = 1`: `K = ℚ`, `𝔪 = (3)∞, (4)∞, (5)∞`, every class, `x = 10⁶` | one `c` for all `𝔪` (probe 1). Counts against `Li/φ(q)`: `q = 3`: `39231`, `39266` vs `39313.252`; `q = 4`: `39175`, `39322` vs `39313.252`; `q = 5`: `19617`, `19622`, `19665`, `19593` vs `19656.626`. Errors run from `−138.252` to `+8.748` and vary with `q` (implied constant per `𝔪`) | sound: "width `c` absolute" is true | none (repairs R02) |
| `rayClassPrimeCount_effective`, type (unchanged) | `n = 0`; `n = 1, K = ℚ`; `𝔪 = 1`, `x = 10⁶` | `n = 0` vacuous (`finrank_pos`); `78498` vs `Li = 78626.504` (`li 2 = 1.045164`) | sound | none |
| `primeCounting_progression_effective` | `q = 4, a = 3`; `q = 1` | `39322` vs `39313.252`; `78498` vs `78626.504` (recomputed) | sound | none |
| 1.1 Check, `Complex.log ∘ Γ` not a branch | r24 | crossings `r = 5.5386, 4.1513, 12.6264`; expansion `3.1567, 3.1558, 3.1423` vs `π` | sound (r24) | none |
| 1.1 Check, ray in `S_δ` | r24 | `θ = π/2` admissible iff `δ < 1.5708`; `θ = 0.1` iff `δ < 3.0416` | sound (r24) | none |
| Scope, lines 87–91 | r24 | width per `K`; per `K, χ`; per `n`; per `L/K` | sound (r24) | none |
| 8.7 width chain and `c₀ = min(c_n/2n, 1)/2` | r24 | no failure in 10⁵ draws when `T ≥ 3`; ratios `92.5, 4346.0, 240.4, 6.4·10⁻²⁹` bounded | sound (r24) | none |
| 8.7 Check, thresholds | r24 | `log x = 0.6957, 2.4958, 190.8684` at `q = 1, 3, 10⁶` | sound (r24) | none |
| Module docstring, lines 40–44 | r24, re-read | "width uniform over the fields of degree `n`" matches `∃ c, ∀ K, finrank ℚ K = n → …` | sound | none |
| 1.1 `S_δ`, branch, uniqueness | r24 | `‖exp(0.3+2.5i)‖ = 1.349859`; `logGamma 3 = 0.693147`; `3+4i`: `−1.7566268 + 4.7426644i` | sound (r24) | none |
| 8.8 Checks 1–3 | r24 | fibre `2·1/4 = 1/#G`; `−0.5`; `χ₈(5) = χ₋₈(5) = −1` | sound (r24) | none |
| 0.2; 1.3 / 1.3a | r24 | `2Λ(2) = 1.047198 = π/3`; `−14.789025`, `−61.912915` | sound (r24) | none |
| 2.1, 2.3, 2.4 | r24 | `12`; `90` vs `15.75`; `Δ`: `90.0` | sound (r24) | none |
| 4.2, 4.4; 5.3, 5.5 | r24 | divisor at `0` is `0`; `−75.665` vs `−78.540`; `0.540303` vs `cos 1`; `−0.546302 = −tan 0.5` | sound (r24) | none |
| 6.5, 7.2, 8.4, 8.9 | r24 | `0.5`; `0` vs `1`; residues `+m_ρ φ̃(ρ)`; `5.120436` | sound (r24) | none |
| `dirichletLFunction_convexity` | r24 | `‖ζ(½)‖ = 1.4603545` | sound (r24) | none |
| `hadamard_of_orderLE_one`, `zetaEntireCompletion_hadamard` | r24 | `1 − s = e^{−s}E₁(s)`; `B = −0.0230957` | sound (r24) | none |
| `riemannZeta_zeros_summable_ordinate` | r24 | first pair `0.0099606` | sound (r24) | none |
| `heckeLFunction_zeroFreeRegion` | r24 | `c < log 45 = 3.806662` | sound (r24) | none |
| `riemannZeta_zeroFreeRegion`, `dirichletLFunction_zeroFreeRegion` | r24 | `c < 3 log 3 = 3.295837`; `0.69343` at `ρ = 0` | sound (r24) | none |
| `neg_re_logDeriv_riemannZeta_le` | r24 | `−ζ'/ζ(2) = 0.56996` | sound (r24) | none |
| `riemannVonMangoldt`, `_heckeLFunction`, `_dirichlet` | r24 | `29.0023` vs `29`; `156.636494`; `7.3366` | sound (r24) | none |
| `chebyshevPsi_explicitFormula`, `riemannZeta_weilExplicitFormula` | r24 | `‖x^ρ/ρ‖ ≤ x/T`; reflection `y = 1/u` | sound (r24) | none |
| `primeIdealCount_effective` | r24, recomputed | `78498` vs `78626.504` | sound | none |
| `frobeniusPrimeCount_effective_abelian` | r24 | `39322` vs `39313.252` | sound (r24) | none |
| #1907 vs #1913 | the three shared names at `123254c` (re-read) | conjoined clauses; the same quantifier order but a different counted set; `Type` vs `Type*` | order unstated | R01 |

### Remarks on untouched text

- Lagarias–Odlyzko 1977, cited by locator in 8.8 and in References, still has no entry in the package's `sources.toml`.

## Not verifiable

- **Davenport §20** (8.7 at `K = ℚ`). Settled as uncertified, cited by locator; not read. The changed sentence's content was checked against the Lean statement (probe 1) and recomputed counts instead.
- **Lagarias–Montgomery–Odlyzko 1979, Lemma 2.3** (6.4, behind 8.7's width). Settled as uncertified. Only its report in kadiri2012 lines 65–73 was read.

## Source issues

- **Misprint** in kadiri2012 at §1, display (1.6), p. 2 (arXiv v1): the source says Lagarias–Montgomery–Odlyzko show `L(s, χ)` has no zeros in region (1.6), which near the real axis overlaps (1.5), where one zero is allowed; it should be no zeros in (1.6) apart from the possible real zero of (1.5); affects nothing.
