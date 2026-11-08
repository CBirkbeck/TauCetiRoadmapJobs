# Review of EffectiveClassNumbers (pull request #1406 at 9553391)

**Verdict:** accepted

This is an incremental re-review of the 16 lines changed since ba3ce95, all in `TauCetiRoadmap/EffectiveClassNumbers/README.md`, at lines 86, 122, 129, 130, 792, 798, 956 and 958. `Suggested.lean` and `metadata.toml` are byte-identical to the files the previous review read. R01 is repaired, and the change adds no new problem. The second repair (line 122 and its echoes at 792 and 798) also fixes a citation that had gone stale at the supplier: AnalyticNumberTheoryPartI no longer declares the two `gammaRemainder.*` names this README used to cite. No finding remains.

## Previous findings

- R01 — repaired: line 129 now reads "[§0.3b](…), the adapter: for every real x, `TauCeti.primeCount ℚ Set.univ x = (Nat.primeCounting ⌊x⌋₊ : ℝ)`". Lines 956 and 958 read "ExplicitPrimeCounting §0.3b (the rational prime-count adapter and p_n ∼ n log n)".

## Verified sound

### The changed passages, each against its witness

| README line | Change | Witness |
|---|---|---|
| 86 | The file locator of `WeierstrassCurve.Affine.regulator` changes from `MordellWeil/Regulator.lean` to `MordellWeil/Regulator/Basic.lean` | At the Tau Ceti pin `2fd255d9`, `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/` has a directory `Regulator/` containing `Basic.lean` and `Isogeny.lean`, and no file `Regulator.lean`. The definition `noncomputable def regulator [W.toAffine.IsElliptic] [Module.Finite ℤ (PointModTorsion W)] : ℝ` is at `Regulator/Basic.lean:96`, inside `namespace WeierstrassCurve.Affine` (line 53). It is the absolute determinant of the Néron–Tate Gram matrix on `Module.finBasis`, and 1 in rank 0. I re-checked the rest of the row at the pin: `quadraticTwistOf` at `QuadraticTwist/Basic.lean:164`, with the simp lemmas `a₁_quadraticTwistOf`, … from line 174; `Point.canonicalHeight` at `CanonicalHeight/Basic.lean:119`; `Point.canonicalHeight_zero` at line 171; `Point.canonicalHeight_neg` at line 181; and the abbreviation `PointModTorsion` at `MordellWeil/PointModTorsion/Basic.lean:63`. |
| 122 | The names `gammaRemainder.slit_logGamma` and `gammaRemainder.stieltjes_integral` are replaced by a description of what §0.23a supplies | At AnalyticNumberTheoryPartI's head (70913eb), neither name occurs in its README or `Suggested.lean`. `roadmaps grep 'gammaRemainder'` finds only ExplicitZetaBounds README line 359. Its §0.23a paragraph (README lines 653–660) supplies the five items the new row lists: (1) log Γ on ℂ∖(−∞, 0], normalised by log Γ(1) = 0; (2) R(z) = logΓ(z) − (z − 1/2)Log z + z − log(2π)/2, with principal Log; (3) the Stieltjes identity R(z) = ∫₀^∞ Q(t)/(z + t)² dt with compact domination; (4) R^(j) = (−1)^j (j + 1)! ∫ Q/(z + t)^(j+2); (5) the bound \|R^(j)(z)\| ≤ j! sec^(j+2)(arg z/2)/(8\|z\|^(j+1)) for j ≥ 1. The anchor `#023-finite-order-hadamard-factorization` is GitHub's slug of the §0.23 heading (line 639). §0.23a is a bold paragraph inside §0.23 and has no heading of its own. |
| 792 | The same replacement in the route of the finite self-pair growth adapter | It agrees with line 122. The *Needs:* line still cites "AnalyticNumberTheoryPartI §0.23a", which exists. The route bounds the remainder itself (j = 0) on a strip with positive real part. That bound follows from the consumed identity by the supplier's own estimate (Q ≤ 1/8 and \|z + t\| ≥ cos(arg z/2)(\|z\| + t)), which gives \|R(z)\| ≤ sec²(arg z/2)/(8\|z\|). The values are in the table below. |
| 798 | The third Check now says "derived above from §0.23a" | This matches the derivation at line 792. Line 800 already uses the same wording. |
| 129, 130, 956, 958 | R01's repair | At ExplicitPrimeCounting's head (c4b8ff9), the §0.3b heading is at README line 947, and its slug matches the link. The adapter bullet is at line 949 (inclusive cutoff) and the n-th prime bullet at line 955 (`Nat.nth Nat.Prime n ∼ n log n`). Its Downstream consumers (line 4547) take both results from this roadmap "by section" and declare no Lean name for them. `roadmaps grep 'primeCount_rat_eq_primeCounting\|nth_prime_isEquivalent'` over main and every open head: no hit. |

### Gate, dependency check and elaboration

- **The worker's gate** (`scratch/gate.md`): every check passed, including `depcheck=0` and `build=0`.
- **My gate run** at this head printed one failing line:

  ```text
  depcheck: UPWARD: EffectiveClassNumbers (#266) -> ExplicitPrimeCounting (#267) at README lines [90, 125, 129, 130, 958, 1044]
  ```

  This is a false positive: the merge-order move that the brief exempts. The board's `merge-order/ORDER.txt` lists this roadmap at 266 and ExplicitPrimeCounting at 267. The brief's order lists them the other way round and names ExplicitPrimeCounting as a permitted supplier. With `--movable` against `ORDER.txt`, the check prints `moved: EffectiveClassNumbers moved in the merge order from #266 to #267, right after its last supplier ExplicitPrimeCounting` and `0 problem(s)`. The pull request's merge-order paragraph puts #1945 (ExplicitPrimeCounting) immediately before #1406.
- **The brief's dependency check** (`--movable`, the brief's order): `depcheck: 237 roadmaps, 2341 edges, 0 problem(s)`.
- **No cycle.** At c4b8ff9, ExplicitPrimeCounting names this roadmap only under Downstream consumers, as "later in the order of supply" (README line 4547).
- **Outside the folder:** `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- **Elaboration:** I ran `lake env lean` on a scratch copy of `Suggested.lean` with `#check @` appended for all 17 declarations. It exited 0 in 13.2 s with ten "declaration uses `sorry`" warnings, one for each theorem (lines 61, 80, 127, 134, 143, 150, 166, 177, 193 and 206), and no other message. A scripted, whitespace-normalised comparison found all 17 elaborated types identical to `scratch/signatures.md` (0 mismatches). The file is unchanged since r6, so nothing changes in the earlier one-by-one comparison with the README.
- **Citation leads:** `roadmaps resolve` on the README and `scratch/citations.md` both list no cross-roadmap citation and no Lean name that is found nowhere.

### Adversarial table

Rows 1–8 have values computed this round for the changed statements. Rows marked (r6), (r5), (r4), (r3), (r2) or (r1) carry that report's values for statements this diff leaves untouched.

| Statement | Instances tried | Values computed on the two sides | Result; change |
|---|---|---|---|
| Row 122: R(z) = logΓ(z) − (z − 1/2)Log z + z − log(2π)/2 equals ∫₀^∞ Q/(z + t)² | z = 1, 10, 1 + i | R(1): closed form 1 − log(2π)/2 = 0.0810615, Stieltjes integral 0.0810614. R(10): 0.00833056 both ways, against 1/(12z) = 0.00833333. Re R(1 + i): 0.0422496 both ways, using \|Γ(1 + i)\|² = π/sinh π. The sign-flipped model (−z in place of +z) gives −19.99 at z = 10, which is not a remainder. | keep |
| Row 122: the iterated-derivative formula and its sign (−1)^j (j + 1)! | j = 1, 2 at z = 1 | R′(1) = −2∫Q/(1 + t)³ = −0.0772155, against 1/2 − γ = −0.0772157. R″(1) = 6∫Q/(1 + t)⁴ = 0.144934, against π²/6 − 3/2 = 0.144934. | keep |
| Row 122: the sector bound; j = 0 by the same estimate | z = 1; z = i, −1 + i, 3 + 4i | At z = 1: \|R′\| = 0.0772 ≤ 1/8 and \|R″\| = 0.1449 ≤ 1/4. At z = i: \|R\| = 0.0870 ≤ 0.25 and \|R′\| = 0.0948 ≤ 0.3536. At z = −1 + i (Re z < 0): 0.0575 ≤ 0.6036 and 0.0296 ≤ 1.1152. At z = 3 + 4i: 0.01667 ≤ 0.03125 and 0.00334 ≤ 0.00699. | keep |
| Line 792: c\|t\|^(σ−1/2)e^(−π\|t\|/2) ≤ \|Γ(σ + it)\| ≤ C\|t\|^(σ−1/2)e^(−π\|t\|/2), uniformly for a ≤ σ ≤ b and \|t\| ≥ T | σ = −3/2, −1/2, 0, 1/2, 1, 2 and t = 1, 10, 50 (exact \|Γ\| from π/cosh, π/sinh and the recurrence) | The ratio \|Γ\|/(√(2π)\|t\|^(σ−1/2)e^(−π\|t\|/2)) at t = 1, 10, 50 is 0.4957, 0.9877, 0.9995 (σ = −3/2); 0.8936, 0.9988, 0.99995 (σ = −1/2); 1.0009, 1.0000, 1.0000 (σ = 0); 0.9991, 1, 1 (σ = 1/2); 1.0009, 1, 1 (σ = 1); 1.4155, 1.0050, 1.0002 (σ = 2). It stays bounded above and below and tends to 1, so c, C and T exist. | keep |
| Line 798 Check: \|Γ(s)\|² ≤ C\|Im s\|^(2 Re s − 1)e^(−π\|Im s\|), and the divisor u(u − 1) | s = 1 + it with t = 1, 10, 50; s = 1 + i | \|Γ(1 + it)\|²/(t e^(−πt)) = πe^(πt)/sinh(πt) = 6.2949, 6.2832, 6.2832, tending to 2π, with exponent 2·1 − 1 = 1. u = 2s − 1 = 1 + 2i and u(u − 1) = −4 + 2i, of modulus 4.472 ≠ 0. | keep |
| Line 86: the regulator's location and its value in rank 0 | Tau Ceti pin 2fd255d9 | `Regulator/Basic.lean:96` exists and `MordellWeil/Regulator.lean` does not. In rank 0 the regulator is the empty determinant, 1 (docstring at line 93). | keep |
| Rows 129 and 130 (reworded): `primeCount ℚ univ x = π(⌊x⌋₊)` and `Nat.nth Nat.Prime n ∼ n log n` | x = −1, 0, 1, 2, 5/2, 10; n = 10, 10², 10⁴, 10⁶ | π(⌊x⌋₊) = 0, 0, 0, 1, 1, 4; a strict cutoff gives 0 at x = 2. p_n = 31, 547, 104743, 15485867, with p_n/(n log n) = 1.3463, 1.1878, 1.1372, 1.1209. | keep |
| §4.4 (reworded *Needs:*): Σ_(j<n) p_j^(−1/2) ∼ 2√(n/log n) | n = 5, 10², 10⁴, 10⁶ | S_n = 2.4111, 10.1657, 71.3257, 556.1924, against 3.5252, 9.3198, 65.9010, 538.0796. The ratios are 0.684, 1.091, 1.082, 1.034, the same as r6. | keep |
| §4.4 partial-summation step and Checks | x = 10⁴, 10⁶, 10⁷; n = 0, 1, 4, 99 | 29.144, 176.352, 461.622 against the integral 30.229, 177.329, 460.968; p₀, p₁, p₄ = 2, 3, 11 | keep (r6) |
| Index shift between this roadmap and ExplicitPrimeCounting | p₀ = 2 here, p₁ = 2 there | 15485867 against 15485863 at n = 10⁶; the ratio agrees to 4 decimals | keep (r6) |
| §0.1 sign transport in degree two | ℚ(i); ℚ(√5); ℚ(∛2) | −4 < 0, totally complex; 5 > 0; −108 < 0 with one real place | keep (r5) |
| `Int.IsFundamentalDiscr` on the Checks' values | D = −5077, −243, −4, −3, 1 | false, false, true, true, true | keep (r5) |
| §3.5: exclusion of −5077 | D = ±5077 | −5077 % 4 = 3; +5077 is prime and ≡ 1 (mod 4) | keep (r5) |
| §4.9: L(1, χ_D) = 2πh/(w√d) | D = −3, −4, −907 | 0.604600; 0.785398; 0.312945 | keep (r4) |
| §4.8: h ≥ (c₀/π)√d/log d; c₀ < 2/3; the cutoff a − 2 log a | D = −3, −4, −907; q = 3; a > 3π | 0.3333 ≤ 1; 0.5 ≤ 1; 3.000 = h; 0.66422 < 0.66667; 0.614 > 0 | keep (r3) |
| §4.9 effective Siegel bound with η = 1/2; `effective_cutoff` at H = 0 | log d ≤ d^η/(eη); H = 0 | 0.2885 < 0.29; impossible by `classNumber_pos` | keep (r3) |
| R16.0.1 contract formula; self-pair; ramified twist | p = 5 | 125/96; 625/576; R_p = 25/36 | keep (r2) |
| §2.3 parity; §3.1 derivative and strip; §3.3 factor at 139 | E₁₃₉; σ = 1, 2 | 37·139² = 714877; √(1 + t²); 0.1330372874 | keep (r1) |
| §§3.6, 3.7 headlines | d = 3, 4, 23, 139, 907 | θ log d = 1.0986, 1.3863, 3.1355, 4.9345, 6.8101 | keep (r1) |
| §§0.6, 0.7; §§1.3, 1.8 | q = (2, 1, 3); d = 4, 23 | 4 and 6 over 2; 1 vs 2.3562, 20 vs 45.2815; C ≥ 1.0452 | keep (r1) |
| §§2.4, 2.10, 2.12–2.13 | 3×3 height determinants; λ = (3 + √−139)/2 | 0.41715, 15.3649; λλ̄ = 37; 18.4294, 1.7318 | keep (r1) |
| §§5.1–5.8 | h = 3; χ₋₃ at t = 0; k = 17923, 115147, 123204 | t = 1; Z(0) ≈ 0.480868; three sign changes; sixteen discriminants | keep (r1) |

### Seeded sample

None of the fifteen sampled targets (§§0.1, 0.5, 0.6, 0.7, 1.4, 1.5, 1.8, 2.5, 2.10, 2.12, 3.7, 4.1, 4.2, 5.3, 5.5) falls in the changed passages, so I did not re-read their locators. These were checked earlier, in the full rounds. I also checked which of them mention the changed material:

- §1.5 cites "O85 §3.1". That is the source's section, not this roadmap's §3.1.
- The §3.7 range ends in Layer 3's Dependencies (line 905), which lists §0.23a unchanged and consistent with line 122.
- §5.3 uses "the phase and Stirling remainder of §5.2", which is §5.2's own target, not the changed contract.

None of the fifteen cites §4.4 or the contract rows at lines 86, 122, 129 and 130. The README flags no locator as unverified.

One locator sits on a changed line: GZ86 I §8, p. 232, at line 956. Printed p. 232 is GZ86 line 337, (8.2) is at line 345, and the sentence after it (lines 346–348) requires the asymptotic of log C(t), which needs §4.4's sum. COG04 and DLMF at line 792 are unchanged words that earlier rounds checked. The cached DLMF page places (5.11.9) in §5.11(i) (DLMF line 61).

### Duplication, ownership and supplier drift

- **No new object.** The diff replaces two invented names by section citations, rewrites one stale supplier citation in prose, and corrects one file locator.
- **Overlaps.** `scratch/overlaps.md` lists no other open pull request that changes this roadmap, no cited id that an open pull request drops, and no id that only a revision defines. AnalyticNumberTheoryPartI (#1126) and ExplicitPrimeCounting (#1945) are new-roadmap pull requests, and both are named under "Depends on" and in the merge-order paragraph.
- **Ownership against open pull requests** was checked with `roadmaps grep` and `roadmaps show` at the heads above.
- **The declared gap** `gap:fundamental-reduced-forms-primitive` is untouched.

**Remarks on untouched text (no change requested):**

- ZerosOfLFunctions §1.3 on main (its README line 469) states log‖Γ(σ + it)‖ = (σ − 1/2) log\|t\| − π\|t\|/2 + log(2π)/2 + O(1/\|t\|) uniformly for σ in a compact interval. This is the strip bound that §3.1 derives from AnalyticNumberTheoryPartI §0.23a (lines 122 and 792). AnalyticNumberTheoryPartI itself imports it from there (its README line 84). Citing §1.3 would shorten §3.1's route. The derivation sentence predates this diff and was passed earlier.
- r6's remark on line 39 (three Tau Ceti declarations, of which §4.4 names one) stands.

**For the worker, not about this folder:**

- ExplicitZetaBounds README line 359 still cites `gammaRemainder.slit_logGamma`, which AnalyticNumberTheoryPartI no longer declares.
- The board package `packages/ExplicitPrimeCounting/README.md` (last changed 2026-11-07) still imports "EffectiveClassNumbers §4.4" at lines 112, 151, 348 and 565. Until that package is synced with its pull request head, it keeps the board order's UPWARD line alive.

### Headlines and padding

`Suggested.lean` is unchanged, so r6's inventory and one-tactic padding probe stand: ten statable headlines are stated, nothing is padding, and the docstring names §§2.8, 2.11 and 3.1 as not statable. The changed passages touch §3.1, which the docstring names with its missing carriers (the elliptic Weil–Deligne parameters and the symmetric-square L-function), and §4.4, which is not a headline. Neither supplier declares the imported §0.3b or §0.23a statements in Lean, which matches citing them by section here.

## Not verifiable

- **O88** is recorded as waived and is cited by locator only.
- **AnalyticNumberTheoryPartI §0.23a and ExplicitPrimeCounting §0.3b** are targets of open roadmaps. I checked their statements at the heads named above, not their proofs.
- **The effective computability of c_LS** (AnalyticNumberTheoryPartI §0.34) and **the GL₂×GL₂ pair-factor compatibility** (GL2AutomorphicRepresentationsAndTransfer R16.0.1) remain targets of open supplier roadmaps, as in r6.

## Source issues

- none
