# Review of EffectiveClassNumbers (pull request #1406 at ba3ce95)

**Verdict:** needs changes

This is an incremental re-review of the 27 lines changed since 28521c8, all in `TauCetiRoadmap/EffectiveClassNumbers/README.md`. `Suggested.lean` and `metadata.toml` are byte-identical to the files the previous review read. The change hands the rational prime-count adapter and p_n ∼ n log n to ExplicitPrimeCounting §0.3b, which states both, and §4.4 keeps only the sum of p^(−1/2). There is one P3 finding: the two Lean names the README gives these imported statements exist nowhere. Nothing blocks. As configured, the gate prints one `UPWARD` line; it is the merge-order move the brief exempts (see "Gate, dependency check and elaboration").

## R01 (P3) — The two Lean names attributed to ExplicitPrimeCounting §0.3b do not exist there

**Location.** `TauCetiRoadmap/EffectiveClassNumbers/README.md` lines 129, 130, 956 and 958. Line 129 reads: "[§0.3b](…), `primeCount_rat_eq_primeCounting`: for every real x, `TauCeti.primeCount ℚ Set.univ x = (Nat.primeCounting ⌊x⌋₊ : ℝ)`". Line 130 names `nth_prime_isEquivalent` the same way, and lines 956 and 958 (*Needs:*) repeat both names.

**Claim.** ExplicitPrimeCounting §0.3b supplies the adapter and the n-th-prime asymptotic under the declaration names `primeCount_rat_eq_primeCounting` and `nth_prime_isEquivalent`.

**Witness.** At ExplicitPrimeCounting's head (bb08e9e), neither name occurs in its README or its `Suggested.lean`. Its Downstream consumers (README lines 4302–4305) says the two §0.3b results reach this roadmap "taken by section" and that `Suggested.lean` declares no Lean name for them. `roadmaps grep` finds both names only in this README, and neither exists in the pinned Mathlib or Tau Ceti.

**Repair.** Drop the two backticked names at lines 129, 130, 956 and 958, and cite the statements by section in words:
- Line 129: "§0.3b, the adapter: for every real x, …"
- Line 130: "§0.3b, the n-th prime: `Nat.nth Nat.Prime n ∼ n log n` as n → ∞"
- Lines 956 and 958: "ExplicitPrimeCounting §0.3b (the rational prime-count adapter and p_n ∼ n log n)"

The Lean statements already written in the two table rows stay. Tested on the instance: after the edit, a grep of the README for either name is empty. Each remaining §0.3b citation then points at a bullet that ExplicitPrimeCounting states: README line 909 (the adapter, inclusive cutoff) and line 915 (`Nat.nth Nat.Prime n ∼ n log n`). `scratch/citations.md` missed these names because the index finds them in this README itself.

## Previous findings

- None: the report at 28521c8 accepted the folder with no findings, so nothing carries over.

## Verified sound

### The changed passages, each against its witness

| README line | Change | Witness |
|---|---|---|
| 27 | Scope: the adapter and p_n ∼ n log n now go to ExplicitPrimeCounting §0.3b | ExplicitPrimeCounting README line 107 claims exactly these two in its ownership list, and §0.3b (line 907) states them at lines 909 and 915. A `roadmaps grep` for `primeCount ℚ`, `π(⌊x⌋₊)`, `p_n ∼`, `nth Nat.Prime n ∼` and `primeCounting ⌊x⌋₊` over main and the open heads finds no other owner: the hits in AnalyticNumberTheoryPartI, ExplicitCharacterSumsAndSieves, SieveMethodsAndPrimePatterns and ClassicalSerreModularity are explicit bounds or notation, not this asymptotic. One owner. |
| 39 | Tau Ceti prime-number-theorem bullet: §4.4 uses it "through ExplicitPrimeCounting §0.3b" | consistent with §4.4's *Needs:* (line 958) |
| 74 | `IsIntegralClosure.intEquiv` dropped from the Mathlib table | no other occurrence in the README. `Rat.HeightOneSpectrum.primesEquiv` stays (Mathlib `NumberTheory/Padics/HeightOneSpectrum.lean:109`) and is still used by the R29.4 transport at line 154. |
| 90 | `TauCeti.primeCount_eq_card` dropped from the Tau Ceti table | no other occurrence in the README; it is now ExplicitPrimeCounting's input (its *Needs:*, line 922) |
| 125–130 | New supplier subsection | The anchor `#03b-the-rational-prime-count-and-the-n-th-prime` is GitHub's slug of the heading at ExplicitPrimeCounting line 907. Row 129 matches its line 909, including the inclusive cutoff, and row 130 matches its line 915. Both statements elaborate at the pins (below). |
| 954–963 | §4.4 keeps only Σ_(j<n) p_j^(−1/2) ∼ 2√(n/log n) | The route's inputs are ExplicitPrimeCounting §0.3b, Tau Ceti's prime ideal theorem at ℚ, and Mathlib `Nat.nth`/`Nat.primeCounting`, matching line 27's "uses only these". GZ86 locator: printed p. 232 is GZ86 line 337, (8.2) is at line 345, and the sentence after it (lines 346–349) gives the asymptotic of log C(t) as t → ∞, which needs this sum. The dropped Check (x = 1, 2, 5/2) now lives in ExplicitPrimeCounting's §0.3b Checks (line 928: at x = 2 both sides are 1, a strict cutoff gives 0). |
| 967–969 | (unchanged) §4.5 consumes §4.4 | §4.5 cites "the reciprocal-square-root prime sum asymptotic of §4.4", which is still a target of §4.4 with the same statement |
| 1044 | Layer 4 Dependencies adds ExplicitPrimeCounting §0.3b | matches line 958 |
| 1186 | References link `../ExplicitPrimeCounting/README.md` | same link form as the other open suppliers on that line |

**Index conventions.** This roadmap counts primes from p₀ = 2 (line 49); ExplicitPrimeCounting counts from p₁ = 2 (its line 248). The contract row 130 avoids the mismatch by writing `Nat.nth Nat.Prime n` explicitly, the same form as ExplicitPrimeCounting line 915. Both readings give the same asymptotic (table below).

### Pinned declarations opened (9)

Pins: Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9` in this head's `lake-manifest.json`, equal to the content main's manifest and to README line 65.

- `TauCeti.primeCount` (`TauCeti/NumberTheory/ArithmeticDirichletSeries/Counting.lean:630`): `(K) → Set (HeightOneSpectrum (𝓞 K)) → ℝ → ℝ`, which counts the primes of S with absolute norm ≤ x. It is the carrier of row 129, with K explicit as written.
- `TauCeti.primeCount_eq_card` (same file, line 648).
- `TauCeti.primeCount_univ_isEquivalent_div_log` (`…/Prime/PrimeIdealTheorem.lean:46`): `primeCount K Set.univ ~[atTop] fun x ↦ x / log x` for every number field K.
- `TauCeti.primeNumberTheoremTransfer` (`…/Prime/Boundary.lean:171`).
- `TauCeti.LSeries.wienerIkehara` (`NumberTheory/LSeries/WienerIkehara/SharpCutoff.lean:300`).
- `Rat.HeightOneSpectrum.primesEquiv` (Mathlib, as above).
- `Nat.add_two_le_nth_prime` and `Nat.nth_prime_zero_eq_two` (Mathlib).
- `Nat.primeCounting_nth_prime` (Tau Ceti `NumberTheory/PrimeCounting.lean:90`, `π(p_k) = k + 1`).

No pin states `Nat.primeCounting ∼ x/log x` or `p_n ∼ n log n`. Mathlib's `Chebyshev.primeCounting_sub_theta_div_log_isBigO` (`Mathlib/NumberTheory/Chebyshev.lean:824`) is only the partial-summation big-O, and Tau Ceti's theorem counts prime ideals. So the adapter is needed, and ExplicitPrimeCounting owns it. Neither the pins nor any roadmap states Σ p^(−1/2) ∼ 2√(n/log n) (`roadmaps grep`), so §4.4 still owns it.

### Gate, dependency check and elaboration

My gate run at this head:

```text
gate EffectiveClassNumbers: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
  depcheck: UPWARD: EffectiveClassNumbers (#268) -> ExplicitPrimeCounting (#269) at README lines [90, 125, 129, 130, 958, 1044]
```

The brief's dependency check, with the brief's merge order:

```text
depcheck: 234 roadmaps, 2418 edges, 0 problem(s)
```

The same check with `--movable` against the board order the gate reads:

```text
moved: EffectiveClassNumbers moved in the merge order from #268 to #269, right after its last supplier ExplicitPrimeCounting; checked as moved (the worker moves it there when it submits)
depcheck: 234 roadmaps, 2418 edges, 0 problem(s)
```

- **The `UPWARD` line is a false positive in the brief's sense.** The board's `merge-order/ORDER.txt` (last re-sort 5304d9d6) places this roadmap at 268 and ExplicitPrimeCounting at 269. The brief's order places them the other way round and lists ExplicitPrimeCounting among this roadmap's permitted suppliers. The `--movable` run prints the exempt `moved:` line, and the worker's own gate (`scratch/gate.md`) shows `depcheck=0` and `build=0`. The pull request's merge-order paragraph already lists #1945 (ExplicitPrimeCounting) before #1406. I count no finding for it.
- **No cycle.** ExplicitPrimeCounting at its head names this roadmap only under Downstream consumers, as "later in the order of supply" (line 4302). Its own dependency check with the brief's order reports `235 roadmaps, 2424 edges, 0 problem(s)`.
- **Remark for the worker, not a finding.** The board package `packages/ExplicitPrimeCounting/README.md` (last changed 2026-11-07) still imports "EffectiveClassNumbers §4.4" (lines 112, 151, 348, 565). Until that package is synced with its pull request head, a re-sort of the board order from it would place this roadmap above its supplier again.
- **Outside the folder:** `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` only.
- **Elaboration, the file itself:** a scratch copy of `Suggested.lean` plus `#check @` for all 17 declarations, run with `lake env lean` from the worktree. Exit 0 in 6.4 s, with ten "declaration uses `sorry`" warnings (the ten theorems) and no other message. A scripted, whitespace-normalised comparison found the 17 elaborated types identical to `scratch/signatures.md` (0 mismatches); the earlier rounds compared those one by one with the README.
- **Elaboration, the new contract statements:** a second scratch file elaborates the 9 pinned declarations above, the statements of rows 129 and 130 exactly as written, and §4.4's target in the form `(fun n ↦ ∑ j ∈ range n, (nth Prime j : ℝ)^(−1/2)) ~[atTop] fun n ↦ 2√(n/log n)`. Exit 0, with three `sorry` warnings for the three scratch statements and no other message. `Nat.nth Nat.Prime 4 = 11` closes by `simp [Nat.nth_prime_four_eq_eleven]`.

### Adversarial table

The first six rows have values computed this round. Rows marked (r5), (r4), (r3), (r2) or (r1) carry that report's values for statements this diff leaves untouched.

| Statement | Instances tried | Values computed on the two sides | Result; change |
|---|---|---|---|
| Contract row 129: `primeCount ℚ univ x = π(⌊x⌋₊)` | x = −1, 0, 1, 2, 5/2, 10 | π(⌊x⌋₊) = 0, 0, 0, 1, 1, 4. A strict cutoff gives 0, 0, 0, **0**, 1, 4, which differs only at x = 2. The statement elaborates with `TauCeti.primeCount : (K) → Set … → ℝ → ℝ`. | keep; R01 concerns only the name |
| Contract row 130: `Nat.nth Nat.Prime n ∼ n log n` | n = 10, 10², 10³, 10⁴, 10⁵, 10⁶ | p_n = 31, 547, 7927, 104743, 1299721, 15485867; p_n/(n log n) = 1.3463, 1.1878, 1.1476, 1.1372, 1.1289, 1.1209, decreasing towards 1 like 1 + log log n/log n | keep; R01 concerns only the name |
| Index shift between the two roadmaps | p₀ = 2 here; p₁ = 2 in ExplicitPrimeCounting | at n = 10⁶ the zero-based value is 15485867 and the one-based value is 15485863, giving the same ratio to 4 decimals. Row 130 fixes the Lean form. | keep |
| §4.4: Σ_(j<n) p_j^(−1/2) ∼ 2√(n/log n) | n = 5, 10², 10⁴, 10⁵, 10⁶ | S_n = 2.4111, 10.1657, 71.3257, 196.4522, 556.1924 against 2√(n/log n) = 3.5252, 9.3198, 65.9010, 186.3962, 538.0796, a ratio of 0.684, 1.091, 1.082, 1.054, 1.034. The first three S_n agree with (r1). | keep |
| §4.4 partial-summation step: Σ_(p≤x) p^(−1/2) ∼ 2√x/log x | x = 10⁴, 10⁶, 10⁷ | the sum is 29.144, 176.352, 461.622; ∫₂ˣ t^(−1/2)/log t dt = 30.229, 177.329, 460.968; 2√x/log x = 21.715, 144.765, 392.388. The integral tracks the sum, and its leading term is approached slowly (second term 4√x/log²x). | keep |
| §4.4 Checks: indexing and the bound S_n ≤ 2√(n + 1) | n = 0, 1, 4, 99; n = 5, 10⁶ | p₀, p₁, p₄ = 2, 3, 11 and π(p_n) = 1, 2, 5, 100 = n + 1; 2.41 ≤ 4.90 and 556.19 ≤ 2000.00, by p_j ≥ j + 2 (`Nat.add_two_le_nth_prime`) | keep |
| §0.1 sign transport in degree two | ℚ(i); ℚ(√5); ℚ(∛2) | disc −4 < 0, totally complex; disc 5 > 0; disc −108 < 0 with one real place | keep (r5) |
| `Int.IsFundamentalDiscr` on the Checks' values | D = −5077, −243, −4, −3, 1 | false, false, true, true, true (by `decide`/`decide +kernel`) | keep (r5) |
| §3.5 exclusion of −5077 | D = ±5077 | −5077 % 4 = 3; +5077 is prime and ≡ 1 (mod 4) | keep (r5) |
| R29.4 transport wording (lines 154, 635) | EllipticCurveModularity head | layer at its line 1262, transport at 1396–1397 | keep (r5) |
| §4.9 class-number value L(1,χ_D) = 2πh/(w√d) | D = −3, −4, −907 | 0.604600; 0.785398; 0.312945 | keep (r4) |
| §4.8 power bound h ≥ (c₀/π)√d/log d | D = −3, −4, −907 | 0.3333 ≤ 1; 0.5 ≤ 1; 3.000 = h | keep (r3) |
| c₀ ≤ π log 3/(3√3) < 2/3 | q = 3 | 0.66422 < 0.66667 | keep (r3) |
| Cutoff x ≤ 2a log a, a = 2πH/c₀ | a > 3π; H ≥ 1 | a − 2 log a ≥ 0.614 > 0 | keep (r3) |
| §4.9 effective Siegel bound; the η = 1/2 Check | log d ≤ d^η/(eη) | 0.2885 < 0.29 | keep (r3) |
| Lean `effective_cutoff` | H = 0 | impossible by `classNumber_pos` | keep (r3) |
| R16.0.1 contract formula; self-pair; ramified twist | p = 5 | 125/96; 625/576; R_p = 25/36 | keep (r2) |
| 2.3 parity; 3.1 derivative and strip; 3.3 factor at 139 | E₁₃₉; σ = 1, 2 | 37·139² = 714877; √(1+t²); 0.1330372874 | keep (r1) |
| 3.6, 3.7 headlines | d = 3, 4, 23, 139, 907 | θ log d = 1.0986, 1.3863, 3.1355, 4.9345, 6.8101 | keep (r1) |
| 0.6, 0.7; 1.3, 1.8 | q = (2,1,3); d = 4, 23 | 4, 6 over 2; 1 vs 2.3562, 20 vs 45.2815; C ≥ 1.0452 | keep (r1) |
| 2.4, 2.10, 2.12–2.13 | 3×3 height determinants; λ = (3+√−139)/2 | 0.41715, 15.3649; λλ̄ = 37; 18.4294, 1.7318 | keep (r1) |
| 4.5–4.8 | n = 5, 100, 10000; d = 907 | S_n as above; κ√log 907 ≈ 3.2·10⁻⁹¹ < 3 | keep (r1) |
| 5.1–5.8 | h = 3; χ₋₃ at t = 0; k = 17923, 115147, 123204 | t = 1; Z(0) ≈ 0.480868; three sign changes; sixteen discriminants | keep (r1) |

### Seeded sample

None of the fifteen sampled targets falls in the changed passages: 0.4, 0.5, 1.1, 1.3, 1.4, 2.4, 2.6, 2.12, 2.13, 3.2, 3.7, 4.9, 5.1, 5.2 and 5.6, with headings at lines 235, 249, 338, 371, 392, 566, 612, 725, 740, 812, 885, 1023, 1052, 1063 and 1117. None of them cites §4.4; only §4.5 does (lines 967 and 969). §4.9's *Needs:* (line 1027) is §§4.7–4.8, AnalyticNumberTheoryPartI §§0.34 and 0.9, and ImaginaryQuadraticClassNumber H2.2 and H2.4. Following the incremental brief, I did not re-read their locators; the earlier full reviews checked the sample of their rounds. The README flags no locator as unverified (a grep for "unverified", "uncertified" and "not verified" is empty). The one locator on a changed line, GZ86 I §8 p. 232 at §4.4, is checked above.

### Duplication, ownership and the lead files

- `scratch/citations.md` lists the same two leads as last round, `gammaRemainder.slit_logGamma` and `gammaRemainder.stieltjes_integral`. They remain AnalyticNumberTheoryPartI's own README target names, cited at line 122. The file does not list the two names of R01.
- `scratch/overlaps.md`: no other open pull request changes this roadmap, no cited id is dropped, and no id is defined only by a revision. ExplicitPrimeCounting is a new roadmap, not a revision, and the description names it under "Depends on" and in the merge-order paragraph.
- Ownership against the open pull requests was checked with `roadmaps grep` over every open head and main, and with ExplicitPrimeCounting's README and `Suggested.lean` at bb08e9e (`roadmaps show`). The diff adds no object; it moves two statements to a single earlier owner.
- The declared gap `gap:fundamental-reduced-forms-primitive` is untouched.

### Headlines and padding

`Suggested.lean` is unchanged (`git diff --stat 28521c8 HEAD` on the file is empty), so the earlier rounds' headline inventory and one-tactic padding probe stand. Ten statable headlines are stated, §§2.8, 2.11 and 3.1 are named in the docstring as not statable, and nothing is padding. §4.4 was never a headline. ExplicitPrimeCounting likewise declares neither imported statement as a headline, which is why R01's repair is on this side.

### Remark on the changed scope line (no change requested)

- Line 39 lists three Tau Ceti declarations (the prime number theorem, `primeNumberTheoremTransfer`, `wienerIkehara`) and says §4.4 uses "them". §4.4's *Needs:* names only the first. The phrase was already there at the head the previous review passed, and the restriction it states ("only to read off the sum of p^(−1/2)") holds for the one §4.4 uses.

## Not verifiable

- **O88** is recorded as waived; it is cited by locator only, as before.
- **The effective computability of c_LS** is AnalyticNumberTheoryPartI §0.34's claim, a target of an open roadmap, as the README attributes it.
- **The GL₂×GL₂ pair-factor compatibility** remains a target of an open supplier roadmap, as in r2.
- **The adapter and p_n ∼ n log n** are targets of ExplicitPrimeCounting §0.3b, an open roadmap. This roadmap consumes them by section; their routes (ExplicitPrimeCounting lines 909–920) use only pinned declarations that I opened above.

## Source issues

- none
