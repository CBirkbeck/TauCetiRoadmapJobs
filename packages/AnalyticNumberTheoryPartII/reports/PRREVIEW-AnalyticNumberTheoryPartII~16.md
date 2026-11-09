# Review of AnalyticNumberTheoryPartII (pull request #1167 at 3f8e782)

**Verdict:** accepted

This is an incremental re-review of the 18 lines of `TauCetiRoadmap/AnalyticNumberTheoryPartII/README.md` that changed since c0e5090. `Suggested.lean` and the files outside the folder did not change. This report has no findings: both previous findings are repaired, and the repairs introduce no new problem.

## Previous findings

- R01 — repaired: `README.md:510` now reads "The `k=1` comparison consumes Ingham's unconditional asymptotic `zetaSecondMoment.mean_square` of AnalyticNumberTheoryPartI §3.23 … both comparisons are unconditional." Lines `:43`, `:117`, `:512`, `:514` and `:518` were changed to match.
- R02 — repaired: `README.md:1543` now reads "proof of Theorem 1 §§2–8 pp.240–265, proof of Corollaries 1–2 §9 pp.265–266, fourth-moment bound of Theorem 2 §10 pp.267–269". `:3139` now reads "(3.138) for `0<β≤1` and (3.139) for the Gibbs states, p. 475".

## Verified sound

### Gate, dependencies and build

- **Gate rerun at 3f8e782.** It printed `gate AnalyticNumberTheoryPartII: set_option=0 blob=0 latex=0 … outside-folder=0 source-material=0 OK`. My rerun's line has no `build=` field. The worker's gate at this head records `build=0`, and my own elaboration below exits 0.
- **Dependency check.** `gate --depcheck … --movable` printed `depcheck: 239 roadmaps, 2361 edges, 0 problem(s)` and exited 0. There is no UPWARD, CYCLE or `moved:` line. In `ORDER.txt`, PolylogarithmFunctions is on line 38, AnalyticNumberTheoryPartI on line 49 and this roadmap on line 50.
- **Scope of the change.** `git diff --stat c0e5090 HEAD` shows only `README.md`, with 9 insertions and 9 deletions. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Elaboration.** I made a scratch copy of `Suggested.lean`, added `#check @…` for all 31 declarations and ran `lake env lean` on it.
  - It exits 0 with 14 "declaration uses `sorry`" warnings and no other diagnostic, and prints 31 `#check` results.
  - The types are unchanged from `signatures.md`. For example, `quadratic_large_sieve` sums over odd squarefree `m≤M` and `n≤N` with `jacobiSym n m`, which is Heath-Brown's Theorem 1 as §5.29 states it.
  - No binder was lost and nothing changed.
- **One-tactic padding probe.** I replaced every `sorry` with each of `simp`, `rfl`, `infer_instance`, `norm_num`, `trivial`, `aesop` and `decide`, one scratch file per tactic.
  - Every run gives exactly 14 errors, one at each of the 14 theorems. That is 98 attempts, and none closed.
  - There is no padding.

### Cross-roadmap citations resolved (the changed passages)

These were checked against AnalyticNumberTheoryPartI at its open head 8984606. The previous review read 6d2ce47.

- **§3.23** is at PartI `README.md:2625`.
  - `:2627` says the asymptotic is Ingham's unconditional theorem.
  - `:2634` says `zetaSecondMoment.mean_square` is unconditional and that "No BBR inequality enters".
  - `:2670` says only the explicit Atkinson bound and `zetaSecondMoment.atkinson_bound` carry `BBRFiniteInput`.
- **The three names §4.14 cites are declared in PartI's `Suggested.lean`.**
  - `zetaSecondMoment.atkinson_bound (hBBR : BBRFiniteInput)` is at `:1067`.
  - `zetaSecondMoment.mean_square : error =O[atTop] (√T·log T)` is at `:1073` and has no hypothesis.
  - `zetaFourthMoment.asymptotic` (`∫|ζ|⁴ − T(log T)⁴/(2π²) = O(T(log T)³)`) is at `:1089`.

  The two names `citations.md` lists as "found nowhere" are these PartI declarations. They are not expected in Mathlib or Tau Ceti, so they are not supplier drift.
- **The other ids in the rewritten paragraph at `:43` exist at 8984606.**
  - Sections:
    - Layer 0: §0.9 (`:288`), §0.23a (`:658`), §0.31b (`:843`), §0.34 (`:883`).
    - Layer 2: §2.1a (`:1216`), §2.3a (`:1356`), §2.5 (`:1397`), §2.7 (`:1419`), §2.15 (`:1581`), §2.21 (`:1723`), §2.31e (`:1887`). §2.31e's bound `κ_K≥c min(1/log D_K,1−β_K)` and its quadratic subfield are at `:1889`–`:1895`.
    - Layer 3: §3.1 (`:2224`), §3.24 (`:2990`).
  - Names: `dedekindZeta_residue_le`, `besselK`, `heckeContinuation`, `heckeFiniteFactor`, `heckeArchFactor`, `heckeConductorScale` and `landau_siegel_exclusion`.
- **No roadmap cites §§4.13–4.14 of this roadmap.** `roadmaps grep` finds no match on main or at any open head, so turning the `k=1` comparison unconditional affects no consumer.
- **§5.29's consumers** are ArithmeticStatisticsPartI `:22`, ArithmeticStatisticsPartV `:947`, ArithmeticStatisticsPartVII `:1068` and SieveMethodsAndPrimePatterns `:15, :2260, :2325, :2502, :2520`. They cite it by id. The change touches only its locators, so every consumer still resolves.
- **Overlaps.** `overlaps.md` reports no other pull request changing this roadmap and no dropped or revision-only ids. The diff changes no heading, so it drops no id.
- **Ownership.** The changed passages add no object. The moments are owned by AnalyticNumberTheoryPartI §§3.23–3.24 and cited, and §4.13's constants are this roadmap's own. AnalyticNumberTheoryPartIII (#2008) plans none of them.

### Sources read at the changed locators

- **Heath-Brown [109], `HeathBrown95`.** Printed page = PDF page + 234.
  - §2, "Proof of Theorem 1; the plan of attack", starts at line 346, on p.240.
  - §9, "Proof of the corollaries", starts at line 2437, on p.265.
  - The proof of Corollary 2 ends at line 2552, on p.266.
  - Page 267 opens with Corollary 3 at line 2555, and §10 starts at line 2637, also on p.267.
  - The first part of Theorem 2, the bound, is finished at line 2723, on p.269. §11 starts at line 2890, on p.272.

  So "§§2–8 pp.240–265", "Corollaries 1–2 §9 pp.265–266" and "bound of Theorem 2 §10 pp.267–269" are exact. "Corollaries 1–2 … pp.265–266" is tighter than the previous review's suggested pp.265–267, and it is correct. Corollary 2, the square-pair form `Σ_{n₁n₂=□}|a_{n₁}a_{n₂}|`, is at line 220, p.238, as `:1531` and `:1543` say.
- **Connes–Marcolli [112], `ConnesMarcolli08`.** Printed page = PDF page − 22.
  - Theorem 3.32 starts at line 21629, p.474.
  - The `0<β≤1` formula (3.138) is at line 21662, p.475. It is introduced as the unique KMS state above critical temperature.
  - The Gibbs formula (3.139) is at line 21669, p.475.

  These are the locators the new `:3139` gives.
- **§6.43 (seeded sample) agrees with the new §6.50 locator.** It cites (3.135) and (3.139), p.475. Its Check `φ_{β,u}(e(1/2))=2^(1−β)−1` is (3.139) at `b=2`, and its Check `φ_{β,u}(x₂x′₂)=2^(1−β)` equals `φ(1)+φ(e(1/2))`.
- **The rest of the seeded sample** (4.1, 5.8, 5.9, 5.17, 5.23, 5.25, 6.2, 6.12, 6.17, 6.19, 6.29, 6.33) lies outside the changed passages. It is unchanged since the full review that the previous report carried, and I did not re-read it here.

### Remark on untouched text (no change requested)

The §4.14 heading still says "conditional comparison". It reads correctly, because the general-`k` model stays conjectural; only `k=1,2` are compared, unconditionally.

### Adversarial table

The first eight rows are new; they cover the changed statements. The rest are carried from the previous review (r15) for statements this diff leaves untouched.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §4.14 `k=1` comparison (`:510`, `:514`) | `a(1)`, `g(1)`; PartI `mean_square`; `T=10^6`, `10^30` | `(1−1/p)Σ_j p^(−j)=1` per prime; `G(2)²/G(3)=1`; main term `T log(T/2π)+(2γ−1)T`; ratio to `T log T` is `12.1321/13.8155=0.8781` and `67.3942/69.0776=0.9756`, tending to 1 | Holds unconditionally; `mean_square` has no `BBRFiniteInput` binder | None |
| §4.14 `k=1` Check, linear coefficient | `2γ−1−log 2π` | `0.1544313−1.8378771=−1.6834457`, which the README gives as `≈−1.6834`; `T log(T/2π)=T log T−T log 2π`, so the two displays agree | Holds | None |
| §4.14 `k=2` comparison | `a(2)`, `g(2)`; PartI `asymptotic` | `∏(1−p⁻²)=6/π²=0.6079271`; `G(3)²/G(5)=1/12`; product `0.0506606`; `1/(2π²)=0.0506606`; remainder `O(T(log T)³)` | Holds unconditionally | None |
| §4.14 BBR clause | the three PartI signatures | `atkinson_bound` takes `hBBR`; `mean_square` and `asymptotic` do not; the README excludes only `atkinson_bound` | Consistent with the supplier | None |
| §4.13 constants (seeded sample, a §4.14 input) | `k=1,2,3`; `p=2`, `k=2` | `g(3)=2²/34560=1/8640=42/9!`; `G(7)=1·2·6·24·120=34560`; `(1/16)(3/2)(8)=3/4`; `k=1` factor `(1/2)·2=1` | Holds | None |
| `:43` and `:117` supplier contract | §3.23 and §3.24 wording | "unconditional second-moment asymptotic `mean_square`" matches PartI `:2627`, `:2634`; "unconditional fourth-moment `asymptotic`" matches `:2990`–`:2994` | Holds | None |
| §5.29 locators (`:1533`, `:1543`) | Heath-Brown section starts and ends | §2 p.240, §9 p.265, end of Corollary 2 p.266, Corollary 3 and §10 start p.267, Theorem 2 bound done p.269 | Exact | None |
| §6.50 `e(1/2)` comparison and locator (`:3137`, `:3139`) | (3.138) and (3.139) at `b=2`; `β=½,1,2` | `2^(−β)(1−2^(β−1))/(1/2)=2^(1−β)−1`; (3.133) gives `(2^(1−β)−1)/φ(2)`, the same; `−η(β)/ζ(β)=2^(1−β)−1`; values `0.41421`, `0`, `−½` (`(−π²/12)/(π²/6)`) | Holds; both formulas on p.475 | None |
| `lerch_completed_functional_equations` (r15) | `a=c=½`; `s=0` | even multiplier `−i`, odd `1`; `L₊(s,½,½)=0`; `L₊(0,a,c)=0` | Holds | None |
| `lerch_completed_functional_equations`, domain (r15) | `(s,a,c)∈D` | `(1−s,1−c,a)` has `Re(1−c),Re a∈(0,1)`; connected domain | Well posed | None |
| `lerchContinuation_solvable` (r15) | `π₁=F₂×F_∞`; `Y_n`, `Y_m` | monodromy upper triangular with diagonal `(1,λ,λ)`; `F_∞″` acts trivially; basepoint `(½,−1,½)` admissible | Holds | None |
| `complexHurwitzContinuation_exists` (r15) | `m=0,1`; `c=1,½,1+i` | `−½`; `−1/12`; `0`; `−½−i` | Holds | None |
| `barnesG` (r15) | `z=4,5,0` | `2`; `12`; `k=0` factor `0` | Holds | None |
| `barnesG_asymptotic` (r15) | `z→∞`; `N=1` | main terms `(z²/2−1/12)log z−3z²/4+(z/2)log 2π`; coefficient `B/(2k(2k+1)(2k+2))`; `|R₁(r)|<1/(720r²)` | Holds | None |
| `quadratic_large_sieve` (r15) | `M=1`, `N=3` | `a₁=1,a₃=−1` gives `0`; `a₁=a₃=1` gives `4`; `(3/3)=0` | Holds | None |
| `quadratic_fourth_moment` (r15) | `σ=½,1`; `q=1` | size `Q(1+|t|)`; `Q+1`; `chi.2≠1` removes only conductor 1 | Holds | None |
| `quadraticReciprocity` (r15) | rows 0, 2, 4 | `(½,½,½,−½)`, `(½,½,½,−½)`, `(½,½,−½,½)`, equal to Blomer's `A` | Holds | None |
| `quadraticReflection` (r15) | `ψ1[0,0]`; `B(0)` entry | `4^(1−s)/(4−4^s)=B₁`; `4/(3π)=B₂(0)` | Holds | None |
| `quadraticReflectionFactors` (r15) | `η=0..3` | `q=1` for residues `≡1` resp. `≡3 mod 4`; `e=±1` pattern as at `:994` | Holds | None |
| `exists_unique_restrictedAddHaar` (r15) | `Ẑ`; `p^(−1)ℤ_p`; `ι=∅` | `1`; `p`; point mass `1` | Holds | None |
| `adeleRing_selfDual` (r15) | `ψ(1/6)`; reversed sign | `1`; `exp(2πi/3)`, excluded | Holds | None |
| `exists_unique_quotientMeasure` (r15) | `ℤ≤ℝ`; `S₃`; `ax+b` | `1`; `6`; `Δ_G=2≠1`, hypothesis fails | Holds | None |
| `gl2_classNumber` (r15) | `ℚ`; `ℚ(√−5)`; `diag(p,1)` | `1`; `2`; `1/p∉ℤ_p` | Holds | None |
| `firstEisenstein_generate` (r15) | `e(1/2)`; `e(1/4)²` | `0`; `[1/2]` in algebra; `cot(πt)/(2i)` | Holds | None |
| `IsScalingMeasure` (r15) | `δ₀`; Haar | `2_*δ₀=δ₀≠2δ₀`; density `2` | Discriminates | None |
| `critical_scaling_measure_unique` (r15) | `e(a/p^k)`; `b=2` | `p^(−kβ)(1−p^(β−1))/(1−p^(−1))`; `2^(1−β)−1` | Matches (3.138) | None |
| `supercritical_scaling_measures` (r15) | `ν=δ₁`; `β=2` | mass `n^(−β)/ζ(β)`; `W` mass `6/π²` | Holds | None |
| §5.3, §5.7, §5.9, §5.24 (r15) | as in r15 | `(1,−½)`, `(−1,9/2)`; `h_E` bound; weight `1/6`; `sin(2π)=0` | Holds | None |
| §6.6, §6.11, §6.28, §6.31 (r15) | as in r15 | `(s−½)²`; `Z′/Z` series; `1+(−1)^k`; `P₄=X⁴−X²/3+1/48` | Holds | None |
| Sarnak constant, §5.3h Jacobi, §5.3n (r15) | as in r15 | `−(g−1)/2`; `1.0000070` against `1.0000068`; `7/6`, `2`, `π` | Holds | None |

## Not verifiable

- **Keating–Snaith [100] (§§4.13–4.14, locator unchanged).** The DOI leads only to a paywall. The README's link is a copy on a third-party course page, which I did not use. The `k=1,2` constants were checked by computation (table) and against PartI's moment statements.
- **Not re-read here.** The previous review's other unverifiable items are outside the changed passages and are unchanged: Wright [103] and Datskovsky–Wright [105] (image-only scans), Blomer's published page numbers, §0.34's sources, Bost–Connes [113], Sarnak [115] and Neshveyev [117].

## Source issues

- **Misprint** in ConnesMarcolli08 at Theorem 3.32, (3.136), p.475: the bullet is about the zero-temperature extremal states `E_∞`, but the displayed inclusion quantifies over `E_β`; it should quantify over `E_∞`; affects nothing.
- **Misprint** in HeathBrown95 at Theorem 1 and Corollaries 1–3, pp.237–238: the coefficient list is written `a_1,…,a_n` with a lowercase last index; it should end at `a_N`, the summation cutoff; affects nothing.
