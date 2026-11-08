# Review of ExplicitMultiplicativeFunctions (pull request #1946 at 1739d7f)

**Verdict:** accepted

This is an incremental re-review of the 74 changed lines (41 insertions, 33 deletions) of `TauCetiRoadmap/ExplicitMultiplicativeFunctions/` since `7f06557`. Nothing outside the folder changed. The previous report had five P3 findings, R01–R05. All five are repaired, and the repairs introduce no new defect.

- **Findings of this report.** None.
- **Gate.** It passes.
- **Dependency check.** It reports 0 problems.
- **Elaboration.** `Suggested.lean` elaborates with 16 `sorry` warnings and nothing else.
- **Mathematics.** Every constant the changed text states was recomputed and reproduces.

## Previous findings

- R01 — repaired: README 0.5, Checks, lines 764–769: "Rogers' `Q(N) ≥ (53/88) N` for every natural `N ≥ 1` … At real arguments it fails: `Q(1.9) = 1 < … 1.144`, and it fails just below `N + 1` on `17` unit intervals …; for `x ≥ 7820` the bound `|R(x)| < √x/2` of 7.1 excludes any failure".
- R02 — repaired: README 9.3a, lines 4298–4310: the general constants now rest on the route's own computation. The step labels are scoped "(The same steps for `n ≥ 89 693²` …)". `lem:eps-bounds`, `lem:poly-ineq`, `lem:final-comparison` and `prop:ineq-holds-large-n` are attached to the `X₀ = 89 693` case "with `ε ≤ 0.000675` and the coefficients `3.01` and `3.36683`".
- R03 — repaired: References lines 4514–4520 and 4562–4573 pin `ieantn` "at revision `466b41b…`" and `primeNumberTheoremAnd` "at revision `127b50e…`". `packages/ExplicitMultiplicativeFunctions/sources.toml` has both entries, `certified`, with the sha256 of every file named.
- R04 — repaired: `not_isHighlyAbundant_lcmUpto` is deleted from `Suggested.lean`, the module docstring's headline list ends "with `log X₀ ≥ 5`, and Rosser–Schoenfeld's bound", and README 9.3a line 4253 keeps the instance in prose with no backticked own name.
- R05 — repaired: README 6.2, lines 2977–2980: "the simplified forms with `K` replaced by `K(7) = … 1.0888…`, which follow from the general forms since `K` increases on `[1, ∞)` … The source prints the simplified forms at lines 336–360 with `K` replaced by `1` … (lines 361–362)".

## Verified sound

### Gate, order, elaboration

- **Gate.** I ran it on this head. It printed `gate ExplicitMultiplicativeFunctions: set_option=0 blob=0 latex=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` and exited with 0. The worker's `gate.md` adds `build=0`.
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds exactly `README.md`, `Suggested.lean` and `metadata.toml`.
- **Dependency check.** `gate --depcheck … --movable` printed `depcheck: 239 roadmaps, 2356 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. The suppliers' positions are unchanged since the previous report: ExplicitZetaBounds, ExplicitPrimeCounting and ExplicitCharacterSumsAndSieves come before this roadmap.
- **Elaboration.** `lake env lean` on `Suggested.lean` printed exactly 16 warnings, `declaration uses sorry`, at lines 166, 198, 205, 210, 220, 235, 256, 274, 291, 314, 332, 358, 369, 385, 400 and 411, and nothing else. This is one fewer than before: the deleted instance.
- **Signatures.** I appended `#check @…` for all 30 declarations to a scratch copy and elaborated it once.
  - All 30 types are identical to the worker's `signatures.md`. The worker counted 31 because a docstring line beginning "instance `(0.571, 10¹²)`" (line 93) was read as a declaration; that is not a defect of the file.
  - `not_isHighlyAbundant_lcmUpto_of_primeGap` elaborates as `∀ X₀, 5 ≤ log X₀ → (∀ y, X₀ ≤ y → ∃ p, Nat.Prime p ∧ y < ↑p ∧ ↑p ≤ y * (1 + 1 / log y ^ 3)) → ∀ n, X₀ ^ 2 ≤ ↑n → ¬IsHighlyAbundant n.lcmUpto`. That is unchanged and matches README 9.3a at the same generality.
  - Only its docstring changed. The previous one-tactic probe stands: `simp [IsHighlyAbundant]` leaves an open goal, so the theorem is not padding.
- **Headlines.** The README summary (lines 3–54) lists these headlines:
  - Ramaré's transfer (1.5) and `L_λ(x) = o(x)` (1.6a);
  - Tao's and Balazard's bounds (2.1–2.2) and `m̌` (3.1);
  - the comparison theorem and the divisor model (5.1–5.2) and Hall–Tenenbaum (6.3);
  - the three Mertens products (8.1–8.1a);
  - Robin's `ω`, Nicolas–Robin's `τ`, the six-prime criterion, the threshold form and Rosser–Schoenfeld's `n/φ(n)` (Layer 9).

  Each is stated. The docstring names, with a reason, the three groups that are not stated: 1.10, Robin's `0.6483`, and the preprint statements. The `89 693²` instance is now covered by the threshold theorem with Dusart's interval as its hypothesis. The new docstring says so and cites ExplicitPrimeCounting §7.4 and Tao's answer.

### The changed passages

- **0.5, the Rogers Check.**
  - `moserMacLeod1966` line 9 prints Rogers' bound "for all x" with equality only at `176`. The Check now restricts it to natural `N ≥ 1` and records that the source prints it more broadly.
  - The 17 failing unit intervals are reproduced exactly: `N = 1, 4, 9, 28, 29, 54, 56, 64, 172, 176, 177, 180, 376, 378, 380, 381, 388`.
  - None fails on `[389, 7820)`: the least margin `Q(N) − (53/88)(N + 1)` there is `0.1136`.
  - From `7820` on, the argument through 7.1 is valid. 7.1 states `|R(x)| < √x/2` for real `x ≥ 8` (README line 3119, `moserMacLeod1966` lines 13–14). With `c = 6/π² − 53/88 = 0.00565437`, `c x ≥ √x/2` holds exactly when `x ≥ (1/(2c))² = 7819.354`.
  - I also checked `|R(x)| < √x/2` at both ends of every unit interval of `[8, 2·10⁵]`: there is no violation.
  - The Check cites a later layer only as an explanation, not as a `*Needs:*` edge. That is not a build-order problem.
- **6.2, the simplified forms.**
  - `daboussiRivat2001` lines 336–360 print the exponent `−log y/log z`. Lines 361–362 derive it from `K(t) ≥ K(7) ≥ 1` for `t ≥ 7`. The README now says exactly this.
  - `K'(t) = 1/t − 1/t² = (t − 1)/t²`; numerically, at `t = 2` it is `0.2500000`.
  - The new Check holds: `exp(−10 K(7)) = exp(−10.88767) = 1.869·10⁻⁵ < exp(−10) = 4.540·10⁻⁵`.
- **9.3a, the route and its citations.**
  - In `primeNumberTheoremAnd` at `127b50e`, `IEANTN/Lcm.lean` fixes `X₀ := 89693` (`primeNumberTheoremAnd` line 988). The step lemmas take `hn : n ≥ X₀ ^ 2` (lines 1034, 1090, 1252, 1306, 1367).
  - `lem:eps-bounds` bounds `1/log³ √n ≤ 0.000675` (lines 1404–1422).
  - `lem:poly-ineq` has `3.01` and `3.36683` in `ε = 1/n` (lines 1485–1501, 1520–1536). `lem:final-comparison` is at lines 1558–1565 and `prop:ineq-holds-large-n` at lines 1587–1599.
  - The README's description, "`ε ≤ 0.000675` and the coefficients `3.01` and `3.36683` of polynomials in `1/n`", is exact.
- **The new docstring of `not_isHighlyAbundant_lcmUpto_of_primeGap`.**
  - `tao2025mo` lines 233–238 give the Theorem, lines 240–261 its proof, and lines 265–297 apply Dusart's interval at `√n` for `n ≥ 89 693²`. The URL fragment `#501229` confirms the answer number.
  - ExplicitPrimeCounting §7.4, at its open head, states Dusart's interval `(x, x(1 + 1/log³ x)]` for every `x ≥ 89 693` (the *Dusart2018Range* bullet).
  - `log 89 693 = 11.404 ≥ 5`, so the instance satisfies the threshold theorem's hypothesis.
- **The pinned revisions.**
  - In `ieantn` at `466b41b`:
    - `IEANTN/Nodes/Lcm/v2/Conclusions.lean` defines `HighlyAbundant` (`ieantn` line 44) and `lcmUpto_not_highlyAbundant_of_primeGap` (lines 75–77) with `HasPrimeInInterval.logPower X₀ 3`.
    - `IEANTN/Vocabulary/PrimeGaps.lean`, read online at the same commit, defines `HasPrimeInInterval.logPower X₀ k` as `∀ x ≥ X₀, HasPrimeInInterval x (x / (log x) ^ k)`, with `HasPrimeInInterval x h := ∃ p, p.Prime ∧ x < p ∧ p ≤ x + h`. That is the README's `(y, y + y/log³ y]`.
    - `IEANTN/Nodes/Lcm/v1/Conclusions.lean` defines `lcmUpto_not_highlyAbundant` as `∀ n, 89693 ^ 2 ≤ n → ¬ HighlyAbundant (Nat.lcmUpto n)`.
    - The `citations.md` lead on `HasPrimeInInterval.logPower` is therefore resolved: it names an IEANTN declaration, cited as a locator. It is not one of this roadmap's names and not a pinned-library one.
  - All 40 `primeNumberTheoremAnd` labels the References list exist at `127b50e`:
    - the 22 labels of `IEANTN/Lcm.lean`, in the cached text;
    - `mun`, `mu-pnt` and `mu-pnt-alt` in `Consequences.lean`;
    - `d_apply_prime_pow`, `d_apply` and `two_pow_omega_le_sigma_zero` in `IwaniecKowalskiCh1.lean`;
    - the 7 MobiusLemma labels;
    - `Meissel-Mertens-eq`, `Mertens-third-error` and `Mertens-third-theorem-error` in `IEANTN/Mertens.lean`;
    - `Dusart_thm_5_9a` and `Dusart_thm_5_9b` in `IEANTN/Dusart.lean`.

    The 18 labels outside `IEANTN/Lcm.lean` were read online at the pinned commit. Their statements are those the previous report recorded (for example, `mu-pnt-alt` is `Σ_{n ≤ x} μ(n)/n = o(1)`).
- **The deleted instance.** No file on main or in any open roadmap pull request mentions `not_isHighlyAbundant_lcmUpto` (`roadmaps grep`), and the README no longer backticks it.
- **Text scan of the changed lines.** There are no process words, pull-request numbers, LaTeX delimiters, machine paths or `lemma`.

### Seeded sample

| Target | In the change? | What was checked |
|---|---|---|
| 9.3a | yes | `tao2025mo` lines 233–238, 240–261, 265–297; the 22 `IEANTN/Lcm.lean` labels with their hypotheses (`n ≥ X₀²`, `X₀ = 89 693`); `ieantn` `Lcm/v1`, `Lcm/v2` and `PrimeGaps.lean` at `466b41b`: matches |
| 1.4 | through the re-pinned References | `primeNumberTheoremAnd` `mu-pnt` (`M(x) = o(x)`) and `mu-pnt-alt` (`m(x) = o(1)`) exist at `127b50e` with those statements: matches |
| 0.4, 0.7, 1.1, 1.6a, 1.10, 2.4, 5.3, 5.5, 7.3, 7.4, 7.7, 8.2, 9.4 | no | untouched text that earlier reviews passed; not re-reviewed (9.4's headline gets a computed row below) |

No locator in the README is flagged as unverified.

### Adversarial table

Rows marked "(r15)" are carried from the previous report, for statements this change leaves untouched; their values are those computed there. The other rows were computed in this review: double precision, 40-digit `Decimal` where noted, and a squarefree sieve to `2·10⁵`.

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| 0.5 Rogers Check (changed) | `x = 1.9`; integers in `[1, 2·10⁵]`; unit intervals | `Q(1.9) = 1 < 1.144318`; integer minimum `Q(N)/N = 53/88`, at `N = 176` only; 17 failing intervals, `N = 1 … 388` as listed; least margin on `[389, 7820)` `0.1136` | sound | — |
| 0.5 Rogers Check, the tail | `c = 6/π² − 53/88` | `c = 0.00565437`; `(1/(2c))² = 7819.354 ≤ 7820`; `\|R(x)\| < √x/2` at both ends of every unit interval of `[8, 2·10⁵]` | sound | — |
| 6.2 simplified forms (changed) | `K(7)`; `K'`; `log y/log z = 10` | `K(7) = 1.0887673`; `K'(2) = 0.25` (numerical `0.2500000`); `exp(−10.887673) = 1.8687·10⁻⁵ < exp(−10) = 4.5400·10⁻⁵` | sound | — |
| 9.3a route, general constants (changed text) | `ε = 1/125`, `n = e^{10}` (40 digits) | left `3.0483971 ≤ 3.0484`; right `3.2322001 ≥ 3.2322`; `(1 + 1/125)⁶ = 1.0489703 < 1.05 < e⁵ = 148.41` | sound | — |
| 9.3a route, `X₀ = 89 693` (changed text) | `ε = 1/log³ 89 693`, `n = 89 693²` | `ε = 6.74235·10⁻⁴ ≤ 6.75·10⁻⁴`; `1/89 693 = 1.11491·10⁻⁵ ≤ 1.115·10⁻⁵`; left `3.0040472`, right `3.3668463`; PNT+ `3.01 ≤ 3.36683` | sound | — |
| `not_isHighlyAbundant_lcmUpto_of_primeGap` (docstring changed) | `X₀ = 89 693` with ExplicitPrimeCounting §7.4 | `log X₀ = 11.40415 ≥ 5`; §7.4 gives `(x, x(1 + 1/log³ x)]` for `x ≥ 89 693`, the Lean `hgap` at `X₀ = 89 693` | sound | — |
| 9.3a threshold, room (r15) | `c = 4.1 … 4.13` | separation between `4.11` and `4.12` | sound | — |
| 9.3a hypothesis not vacuous (r15) | `X₀ = 150`, `y = 155` | `(155, 156.208]` contains no prime | sound | — |
| 9.3a steps (r15) | `n = 10⁴`, `(101, 103, 107)`, `(9949, 9967, 9973)` | `P = 1 113 121`, `Q = 988 939 464 559`, `m = 222 109`, `r = 2 695 803` | sound | — |
| 9.3a `IsHighlyAbundant` (r15) | `n = 0`; `n ≥ 1` | ours false at `0`, IEANTN's vacuously true; identical for `n ≥ 1` | sound | — |
| 9.4 headline (sampled) | primorials `3#` to `47#`; `n = 3, 4, 5, 6` | `n/φ(n)` against the bound: `1.5 < 26.82`, `2 < 8.26`, `1.25 < 6.11`, `3 < 5.34`; least margin at `23# = 223 092 870`, where `(n/φ(n) − e^γ log log n) log log n = 2.50636928 < 2.50637` (40 digits); next `19#`: `0.00298` | sound (tight at `23#`) | — |
| 9.2 Nicolas–Robin (headline) | `n = 6 983 776 800 = 2⁵3³5²·7·11·13·17·19` | `τ = 2304 ≤ n^{1.538 log 2/log log n} = 2304.70`; attained exponent `1.53794` | sound | — |
| 9.2 `k^{ω} ≤ τ_k ≤ k^{Ω}` (r15) | `n = 12`, `k = 0`, `n = 0` | `4 ≤ 6 ≤ 8`; `9 ≤ 18 ≤ 27`; `τ₀(6) = 0` | sound | — |
| 9.1 headline (r15) | `k = 9` | `1.384013 ≤ 1.3841` | sound | — |
| 0.4 (r15, sampled) | `X = 1, c = 1`; `X = 0.5, c = 3` | `1 = 1`; `1/8 > 1/16` (excluded) | sound | — |
| 0.5 `R`, `Δ`, `γ₁` (r15) | `x = 1, 4, 176`; `Δ` at `1980, 5460, 5559` | `R = 0.392073, 0.568292, −0.995170`; `22.33876 > 22.24860`; `31.39072 > 29.55673`; `−0.70533` | sound | — |
| 0.6 (r15) | `h = μ(n)/n²` | `ζ(5/3)/ζ(10/3) = 1.850797` | sound | — |
| 1.1 identities (r15, sampled) | `ε₁(1.5)`, Balazard at `x = 2`, El Marraki at `D = 3` | `17/162`; `5/12 + 1/12 = 1/2`; `1.098612 = log 3` | sound | — |
| 1.2–1.4 values (r15, sampled 1.4) | `M` at `199 … 10⁶` | no violation of `x/80`, `0.10917`, `0.002969` up to `2.2·10⁶`; Corollaire `0.6437752` | sound | — |
| 1.5 headline (r15) | squarefree inputs on `[1, 10⁶]` | `max \|R\|/√x = 0.67909 < 0.7` | satisfiable | — |
| 2.2 headline (r15) | `x = 1, 2`; `I(1)` | `1 ≤ 11/3`; `I(1) = 0.1727846 = 3/4 − γ` | sound | — |
| 3.1–3.4 (r15) | integers and critical points to `10⁶` | last violations `6, 3161, 9548`; sup `0.16532795 = 2(2 − log 2)³/27` | sound | — |
| 6.1, 6.2 general, 6.5 (r15) | `f = 1`, `z = y = 2`; `d = 2, 4` | `3/2 = 3/2`; bound `1.648721`; `3 ≤ 4 ≤ 6` | sound | — |
| 7.1a, 7.5 (r15) | `x = 10.7`; `S₃(12)`, `S₄(6)` | `0.4951800` both sides; `74 > 72.87`; `39 ≤ 54.5` | sound | — |
| 8.1, 8.1a headlines (r15) | `x = 2 … 293`; `x = 2 278 381 … 3 445 943` | inside the windows; `0.199933 < 0.2` | sound | — |
| 8.2, 8.3 (r15, sampled 8.2) | `ε = ±1`; `q = 1, 2, 4` | `e^{γ(1) + B} = 1.08277 = (6/π²)e^γ`; `C = 1.83675` | sound | — |
| 5.1, 5.2 headlines (r15) | `h = δ`; threshold | `Σ_{n ≤ 10⁶} τ(n) = 13 970 034`; `235.68 ≤ 236` | sound | — |

### Library declarations, citations, ownership

- **Mathlib at the pin.** These declarations, opened by the previous report at the files and lines it gives, are still cited by the changed 9.3a text: `Nat.lcmUpto`, `Nat.factorization_lcmUpto` and `Chebyshev.psi_eq_log_lcmUpto` (`NumberTheory/Chebyshev.lean:211, 220, 311`), and `ArithmeticFunction.isMultiplicative_sigma`. The change cites no new library declaration.
- **Cross-roadmap citations in the changed text.** Only ExplicitPrimeCounting §7.4 (in the Lean docstring and the 9.3a `*Needs:*` line), and 7.1 of this roadmap. I resolved both at the current heads above. `citations.md` lists no cross-roadmap citation found nowhere.
- **Declared gaps.** The change touches no gap and no supplier contract.
- **Overlaps and ownership.** `overlaps.md` lists no other pull request changing this roadmap and no dropped id. No other roadmap owns highly abundant numbers or `lcmUpto` (`roadmaps grep`, as in the previous report). Ownership against open pull requests was checked through `roadmaps grep` and `overlaps.md`, not by reading every sibling checkout.

### The previous report's source issues

The eight issues of the previous report are unchanged. The README records two of them in its text: Rogers' range in 0.5, and Daboussi–Rivat's printed `1` in 6.2.

## Not verifiable

- **Files read online.** For `primeNumberTheoremAnd`, only `IEANTN/Lcm.lean` is in this worker's sources cache. The 18 labels of the five other files were read online at the pinned commit (raw files at `127b50e`). For `ieantn`, `Lcm/v1` and `PrimeGaps.lean` were read the same way at `466b41b`. I did not recompute their sha256 against the manifest's values.
- **`leong2026` (1.9, untouched).** Image-only on this worker; its `[[missing]]` entry stands.
- **Uncertified sources.** They are cited by locator, as in the previous report: `daval2025`, `bordelles2002`, `bordelles2006`, `dusart2018`, `bordelles2005`, `languascoZaccagnini2009`, `rieselVaughan1983`, and `rosserSchoenfeld1962` (9.4; its constant was recomputed at `23#` above).

## Source issues

- **Error** in tao2025mo at answer 501229, the verification for `n ≥ 89693²`, line 294: the source says the reduced right side is at least `1 + 3.37ε − 0.01ε²`; it should say about `1 + 3.3668ε − 0.01ε²`, since its own linear coefficient `Σ 1.000675^{−2i} + 3/8 − 4·1.000675^{12}/89693` is `3.36687`; affects nothing.
- **Gap** in tao2025mo at answer 501229, lines 281–290: the source says that bounding `1/log³√n` by `(1/log³√n)(1 + 1/√n) ≤ 0.000675` lets it drop the factor from `n + √n`; it does not, since `(1 + ε)²(1 + 1/√n) = 1.0013601 > 1.000675² = 1.0013505`. It should keep the factor `1/(1 + 1/89693)`, as `primeNumberTheoremAnd` `lem:poly-ineq` does, which gives `3.36683`; affects the proof.
