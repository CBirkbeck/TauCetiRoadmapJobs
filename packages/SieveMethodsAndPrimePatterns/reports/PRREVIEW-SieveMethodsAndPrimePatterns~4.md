# Review of SieveMethodsAndPrimePatterns (pull request #1495 at b309f90)

**Verdict:** needs changes

This is an incremental re-review of the 41 lines changed since 23901d4: the `module` line, the two reference entries, the new ordered-divisor majorant in Layer 1 §1.1 and its six citations, and the §4.4 sentence. All four previous findings are repaired. The gate passes, and the mathematics of the new target checks out at every instance tried. Two P3 findings remain. The new target has no source locator. Separately, the supplier contracts give a superseded pin and six file:line references from it; that defect is older than this diff, and the previous report repeated the README's hashes instead of reading the manifest.

## R01 (P3) — The ordered-divisor harmonic majorant has no locator

**Location.** `TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md:1055–1073`, "**Ordered-divisor harmonic majorant.** … Prove that for every integer k≥1 and every real Z≥1 `Σ_(1≤n≤Z) τ_k(n)/n ≤ (1+log Z)^k` and `Σ_(1≤n≤Z) τ_k(n) ≤ Z (1+log Z)^(k−1)`". The paragraph names no source.

**Claim.** Every theorem target needs a locator. This one is the only theorem target in Layers 0–5 without one. A scan of the bold-titled targets found three other locator-free paragraphs: line 1357 is a proof requirement, and lines 3534–3554 are supplier-gap contracts. A suitable locator is already in the roadmap's own manifest. Also, the *Needs:* line leaves out the pinned identity that the summatory step of the proof sketch restates.

**Witness.** HB-SIEVES lines 802–847, §3, Lemma 3.1 (statement on printed p. 15, proof on p. 16). For h∈ℕ it proves `Σ_(d<x)μ(d)²h^ω(d) ≤ x(1+log x)^h` and `Σ_(d<x)μ(d)²h^ω(d)/d ≤ (1+log x)^h`, by bounding the second sum by `(Σ_(d<x)μ(d)²/d)^h`. Lines 851–855 apply it at h=3 to the 3^ω remainder of §1.6. Mathlib `ArithmeticFunction.sum_Ioc_mul_zeta_eq_sum` (`Mathlib/NumberTheory/ArithmeticFunction/Misc.lean:430`) states `Σ_(n≤N)(f*ζ)(n)=Σ_(n≤N)f(n)⌊N/n⌋`.

**Repair.** After the statement, add: "(HB-SIEVES, §3, Lemma 3.1 and its proof, pp. 15–16. The source treats squarefree d<x and gets the summatory exponent h; the extension to all n≤Z and the exponent k−1 come from the convolution step of the proof sketch.)" Add Mathlib `ArithmeticFunction.sum_Ioc_mul_zeta_eq_sum` to the *Needs:* line.

**Repair tested.** HB's argument without μ² gives the README's harmonic form directly: n=c₁⋯c_k≤Z forces every c_i≤Z, so `Σ_(n≤Z)τ_k(n)/n ≤ H_⌊Z⌋^k`. At k=3, Z=2 the sum is 4; HB's summatory form gives 2(1+log 2)³ = 9.71, and the README's sharper form gives 5.733.

## R02 (P3) — The supplier contracts state a superseded pin and cite lines from it

**Location.** `README.md:45`, "The pinned APIs are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`". Four stale references follow:
- `README.md:49`: `ContDiffBump.normed`, `.integral_normed` and `.tsupport_normed_eq` at "(lines 32, 68 and 76)";
- `README.md:53`: `ArithmeticFunction.mul_apply` at "`Mathlib/NumberTheory/ArithmeticFunction/Defs.lean:236`";
- `README.md:61`: "`TauCeti/NumberTheory/ArithmeticDirichletSeries/Convolution.lean:369`";
- `README.md:61`: "`VonMangoldt.lean` (lines 84 and 180)".

**Claim.** `lake-manifest.json` pins Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. These pins hold at this head, at 23901d4 and on main, and arrived with the merge of main that carried the Tau Ceti pin bump (a891cd19). At these pins the line references above miss their declarations, and one Tau Ceti file no longer exists. This paragraph is also the contract behind the new target's "Dirichlet-convolution `Mul` instance".

**Witness.** At the manifest pins:
- `mul_apply` is at `Defs.lean:254`; line 236 is the docstring of the `SMul` instance.
- `ContDiffBump.normed`, `.integral_normed` and `.tsupport_normed_eq` are at `Normed.lean:35`, `:71` and `:79`.
- `convolution_one_one_apply` is at `TauCeti/NumberTheory/ArithmeticDirichletSeries/Convolution/Basic.lean:366`; `Convolution.lean` does not exist.
- `vonMangoldt` and `norm_vonMangoldt_le_log` are at `VonMangoldt.lean:82` and `:178`.

**Repair.** Write the two manifest hashes at line 45. Change the references to `Normed.lean` (lines 35, 71 and 79), `Defs.lean:254`, `Convolution/Basic.lean:366` and `VonMangoldt.lean` (lines 82 and 178). The other references in lines 49–57 already resolve at these pins (see Verified sound).

**Repair tested.** Each replacement line was opened at the manifest pins and shows the named declaration.

## Previous findings

- R01 — repaired: `Suggested.lean:1–2` reads "module" then "import Mathlib". This is the form of three module-form files on main (CFSGBasicProperties, FiniteGroupExtensionSplitting, HeegaardFloer). The worker's gate reports `build=0`, and `lake env lean` gives 36 `sorry` warnings and nothing else.
- R02 — repaired: `README.md:4164`, "OpenAI mathematics release of 1 October 2026, repository `openai/math`, file `preprints/…/paper.pdf`, 9 pages; the numbering is that of the 1 October 2026 version". `README.md:4166`: "Hexagon 2610.00311v2, 2026, 5 pages; Theorem 1.1". `sources.toml` records both as `certified`, with sha256 equal to the cached texts.
- R03 — repaired: no "1.2a" is left in the README or the Lean. The majorant is stated at `README.md:1055` and cited downward at 1470, 1500, 1560, 2962, 3284 and 3311. The new target lacks a locator: R01 above.
- R04 — repaired: `README.md:2972`, "the implied constants and the threshold in N are effective, because the level estimate of Layer 3 §3.3 is effective, through AnalyticNumberTheoryPartI §0.34." Layer 3 §3.3 exists at line 2613.

## Verified sound

**Scope of the reading.** I read the full diff (31 insertions and 10 deletions in README.md, 1 insertion in Suggested.lean) and every changed passage in context at this head. I also read the previous report, the gate, overlaps and citations records, and the supplier passages the changed text cites. The pull request changes nothing outside the folder: the outside-folder diff against origin/main is empty, and the folder holds only README.md, Suggested.lean and metadata.toml. No worktree file was changed; the probe scripts are in the job's scratch directory.

**Gate and dependency check.** The worker's gate on this head reports every check 0 and `build=0 OK`. My rerun of the full gate prints `OK`. The dependency check:

```text
depcheck: 239 roadmaps, 2427 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. This roadmap is merge-order line 268, after AnalyticNumberTheoryPartI (line 90); ProbabilisticAndMetricNumberTheory is line 269. The six new citations of the majorant all point from Layers 1 and 4 to Layer 1 §1.1, so they are downward.

**Lean.** `lake env lean` on `TauCetiRoadmap/SieveMethodsAndPrimePatterns/Suggested.lean` gives 36 `declaration uses 'sorry'` warnings, matching the file's 36 `sorry`s, and no other warning or error. The diff adds only the `module` line, so no statement or binder changed since 23901d4. The previous binder check (0 lost binders, re-confirmed by the worker's 56-declaration `signatures.md`) and the one-tactic probe stand. The headline list in the module docstring is unchanged. The new majorant is an elementary lemma, not a headline, so it is correctly absent from the Lean file.

**New target, mathematics.**
- Harmonic step: `Σ_(n≤Z)τ_(k+1)(n)/n = Σ_(d≤Z)(τ_k(d)/d)H_⌊Z/d⌋ ≤ (1+log Z)Σ_(d≤Z)τ_k(d)/d`, valid because Z/d≥1 and `harmonic_le_one_add_log` (`Mathlib/NumberTheory/Harmonic/Bounds.lean:34`, `harmonic n ≤ 1+log n`).
- Summatory step: `Σ_(n≤Z)τ_k(n)=Σ_(d≤Z)τ_(k−1)(d)⌊Z/d⌋` is `sum_Ioc_mul_zeta_eq_sum`.
- Prime-power comparisons: `τ₃(p^a)=(a+1)(a+2)/2` and `τ₄(p^a)=(a+1)(a+2)(a+3)/6`. Also (a+1)² ≤ τ₄(p^a) ⟺ a ≤ a²; at a=1, 2, 3 the values are 4=4, 9≤10, 16≤20.
- Mathlib names in the *Needs:* line, all present at the pin: `ArithmeticFunction.zeta` (`Zeta.lean:39`, `ζ 0 = 0`, otherwise 1), the convolution `Mul` instance (`Defs.lean:250`), `sigma` (`Misc.lean:146`), `cardDistinctFactors` (`Misc.lean:329`) and `IsMultiplicative` (`Defs.lean:434`). `zeta_mul_pow_eq_sigma` (`Misc.lean:198`) with `pow 0 = ζ` gives ζ²=σ₀=τ, as the target says.

**Ownership of the majorant.** Mathlib at the pin has the identities `sum_Ioc_sigma0_eq_sum_div` and `sum_Ioc_mul_zeta_eq_sum` but no τ_k bound; Tau Ceti has none. `roadmaps grep` over main and the 468 open heads finds two related passages:
- AnalyticNumberTheoryPartI, head 2b9b7af, line 890: one sentence inside the §1.2a proof route, not a target.
- ProbabilisticAndMetricNumberTheory §3.7: the C_k mean bound for 0≤f≤τ_k, which the new target explicitly excludes, and a Rankin bound for f(p^ν)=f(p). That roadmap is also later in the merge order.

So §1.1 is the owner.

**Consumers.**
- §1.6 interval bound (1470). The k=4 citation is valid through 3^ω≤τ₃≤τ₄; τ₄=τ₃∗1 gives τ₄(n)≥τ₃(n). It reproduces HB's displayed remainder shape z²(1+log z)³ (HB-SIEVES line 855). Citing the k=3 consequence would give exponent 2. Both are correct.
- §1.6 twin/Goldbach (1500): the remainder is `Σ_(d<z²)3^ω(d) ≤ z²(1+log z²)²`.
- §4.4 S₁ (2962): Maynard (5.3) (MAYNARD-2015 lines 507–515) needs `Σ_(d<R)τ_k(d) ≪ R(log R)^k`, and the majorant gives R(1+log R)^(k−1).

**References.**
- LS-EXCLUSION (4164): fab9f6e8 line 1 (9 pages), line 2 (the stated `openai/math` raw URL), lines 23–25 (Theorem 1, `(1−β)log q≥c` for conductor q≥3).
- GREEN-LS (4166): 6b948696 line 1 (5 pages), line 2 (`2610.00311v2`), lines 25–34 (sufficiently large conductor, C a sufficiently large even integer, X=q^C, bound `(1/2+O(1/C))log X+O_C(1)`).
- At the AnalyticNumberTheoryPartI head, §0.34 (line 805) covers every q≥3, and the bounded conductors are its own step, as the entry says. §0.34c `inert_prime_sum_le` states 3/4 for C divisible by 3, and line 834 cites [110] Theorem 1.1. The README's "consumed through §0.34c" is accurate.
- The body citation at `README.md:2457` is unchanged.

**Library references re-swept at the manifest pins.** The pin line is wrong (R02). The other references in lines 49–57 resolve:
- `Pi.norm_def` and `norm_le_pi_norm` are generated by `to_additive` from `Constructions.lean:310` and `:346`.
- `Bertrand.lean:222` opens the docstring of `exists_prime_lt_and_le_two_mul` (line 225).
- `ApproximateSubgroup.lean:63`, `:119` and `:127` are the attribute lines of the declarations at 64, 120 and 128.
- `Polynomial/Basic.lean:141` and `:114` are `monicEquivDegreeLT` and `degreeLTEquiv`.
- `AddCharacter.lean:240` and `:250` are exact.

**Overlaps.** No open pull request changes this roadmap or drops a cited id. The one lead ("IntegralLattices Layer 0 … only #1239 defines it") is false. On main, `TauCetiRoadmap/IntegralLattices/README.md` has `### Layer 0: lattices, the dictionary, and the first invariants` (line 507) and `### Layer 3: localization, Jordan splittings, the genus, and the dyadic density data` (line 829), which is what the Scope sentence at line 11 cites. The tool misses level-3 headings.

**Adversarial pass.** Below are rows with computed values for every changed statement, then the previous report's rows (r3) for statements this diff leaves untouched. r3 in turn carried forward r2's 160 rows, which include the seeded sample §§0.2, 0.3, 0.4, 0.7, 1.3, 2.1, 2.2, 2.3, 2.5, 3.0, 3.2, 4.1, 4.6, 4.8 and 5.3. None of those sections changed in this diff. The values in the new rows were computed exactly by short enumeration scripts (integer τ_k tables up to 20000), not estimated.

| Statement (line) | Instance | Values computed | Result |
|---|---|---|---|
| 1.1 majorant, harmonic form (1057) | k=1…5, all Z≤20000 (Z=n and n+0.999) | max of `Σ τ_k(n)/n ÷ (1+log Z)^k` = 1.0000, reached only at Z=1 | holds |
| 1.1 majorant, summatory form (1057) | k=1…5, all Z≤20000 | max of `Σ τ_k(n) ÷ Z(1+log Z)^(k−1)` = 1.0000, reached only at Z=1 | holds |
| same, Checks (1067–1069) | k=1, Z=2; k=2, Z=2, 3, 4; k=3, Z=2 | 1.5≤1.693, 2≤2; 3≤3.386, 5≤6.296, 8≤9.545; 4≤5.733, 2.5≤4.854 | all reproduced |
| same, negative control (1068) | Z(log Z)^(k−1) without the 1, k=2, Z=2 | 2 log 2 = 1.386 < 3 | fails, as the Check says |
| same, degenerate Z<1 (1071) | k=1, Z=0.2 | empty sum 0 against 1+log 0.2 = −0.609 | false, so Z≥1 is needed, as stated |
| same, Z=1 (1071) | any k | both sums τ_k(1)=1; both bounds 1 | equality |
| 3^ω≤τ₃ (1059, 1070) | all n≤20000; n=4, 6 | true for all; 3≤6, 9=9; unordered counts 2, 2 do not majorize | holds |
| τ²≤τ₄ (1059) | all n≤20000; a=1, 2, 3 | true for all; 4=4, 9≤10, 16≤20 | holds |
| consumer §4.4 S₁ (2962) | k=3, R=10⁴ | `Σ_(d<R)τ₃` = 496398 ≤ R(1+log R)² = 1042511 ≤ Maynard's R(log R)³ = 7813166 | consistent |
| consumer §1.6 twin/Goldbach (1500) | z=100 | `Σ_(d≤10⁴)3^ω` = 220912 ≤ 1042511 | consistent |
| consumer §1.6 interval (1470) | y=e³⁰, z=√y/(log y)³ | z²(1+log z²)³ = 1.74e7 and HB's z²(1+log z)³ = 2.86e6, both ≤ y/(log y)³ = 3.96e8 | O(y/(log y)³) as sketched |
| §4.4 effectivity sentence (2972) | Layer 3 §3.3 | heading at 2613, "Bombieri–Vinogradov gives every level below one half" | well-formed and resolves |
| LS-EXCLUSION entry (4164) | q=3 | `(1−β)log 3 ≥ c`; page count 9 = cache; URL = cache line 2 | matches source |
| GREEN-LS entry (4166) and §0.34c | C=9, 30, 100 for §0.34c's `(1+1/C)(2/3+1/(2C))` | 0.8025, 0.7061, 0.6784: ≤3/4 only for large C; Green's 1/2+O(1/C) is stronger | consistent |
| 3.0 small_conductor_maximal (r3) | χ mod 3, x=y=3, s=1, c=C=1 | sum −log 2, norm 0.693; RHS 2.619+0.762 = 3.38 | holds (r3) |
| same (r3) | s=2 | masked sum 0 ≤ 3.38 | holds (r3) |
| same, junk level r=0 (r3) | χ(n)=0 for n≥2 | sum 0; RHS ≥ 0 | harmless (r3) |
| same, r=1, 2 (r3) | only the trivial character | `χ ≠ 1` empties the quantifier | vacuous, as the Check says (r3) |
| 3.0 envelope monotone (r3) | L=log 2, ℓ=log 3 | f′ = 0.406 < 1 | sup at y=x justified (r3) |
| 3.0 below-threshold absorption (r3) | r=3 | (log 3)⁴ = 1.457 > 1 | bounded by C (r3) |
| 3.0 mask weight (r3) | s=12, y=10 | log 72 = 4.277 ≤ 2 log 10 = 4.605 | holds (r3) |
| 3.0 logarithmic-range form (r3) | B=1, log x=100 | log r ≤ 4.6 ≤ 5 = (1/2)√(log x) | follows (r3) |
| 3.2–3.4 effectivity (r3) | inputs | only Siegel–Walfisz was ineffective; now effective through §0.34 | effective (r3) |
| supplier §3.24 at 1≤Y<2 (r3) | Y=1; Y=2 | τ(1)²=1; 1+4=5 | consistent (r3) |
| Hilbert ownership (r3) | δ=1/2, H=1 | sharp constant 2 needs π; 3π/2 would give 3 | split correct (r3) |
| Corollary 18.6 convention (r3) | Δ=1/16, x=16, y=1, Q=2 | corrected 3; printed ≈ 6.09 | correction stands (r3) |

**Shape.** The new target follows the house form: statement, hypothesis line, proof sketch, five Checks (two of them negative controls: the missing 1, and the unordered count) and a *Needs:* line. It names no Lean declaration of this roadmap, so it claims nothing in Suggested.lean. The diff contains no process words, pull-request numbers or LaTeX (gate scanners 0).

## Not verifiable

- None in the changed passages. The previous reports' items (CHEN-73-CN Lemma 6, waived; the proofs of LS-EXCLUSION and GREEN-LS, which are AnalyticNumberTheoryPartI's targets) are unaffected by this diff.

## Source issues

- none (HB-SIEVES Lemma 3.1, read for R01, is correct as stated; the earlier reports' entries stand).
