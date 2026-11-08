# Review of SieveMethodsAndPrimePatterns (pull request #1495 at 39cf901)

**Verdict:** accepted

This is an incremental re-review of the 14 lines changed since b309f90. The diff adds 8 lines to README.md and deletes 6. Suggested.lean, metadata.toml and every file outside the folder are unchanged. Both previous findings are repaired, and the repairs introduce no new problem. My rerun of the gate passes, the dependency check reports 0 problems, and `lake env lean` gives exactly 36 `sorry` warnings and nothing else. This report has no findings.

## Previous findings

- R01 — repaired: `README.md:1063` reads "(HB-SIEVES, §3, Lemma 3.1 and its proof, pp.15–16. The source treats squarefree d<x, … its summatory bound has exponent h; the extension to every n≤Z and the summatory exponent k−1 come from the convolution step …)". `README.md:1075` now lists `ArithmeticFunction.sum_Ioc_mul_eq_sum_sum` and `ArithmeticFunction.sum_Ioc_mul_zeta_eq_sum`.
- R02 — repaired: `README.md:45` reads "Mathlib `1b1ccf4b…` and Tau Ceti `2fd255d9…`", which match `lake-manifest.json` and the checked-out package heads. The references now read `Normed.lean` (lines 35, 71 and 79; `integral_pos` 66), `Bertrand.lean` (line 225), `Defs.lean:254`, `ApproximateSubgroup.lean` (64, 120, 128), `VonMangoldt.lean` (82, 178) and `Convolution/Basic.lean:366`. Each one opens at its declaration.

## Verified sound

**Scope of the reading.** I read:
- the whole diff;
- §1.1 in full (`README.md:991–1075`);
- the supplier-contract block (`README.md:39–63`);
- the six citations of the majorant, which still cite it by name: `README.md:1472`, `1502`, `1562`, `2964`, `3286` and `3313`;
- the previous report, `gate.md`, `overlaps.md` and `citations.md`.

`git diff b309f907 HEAD --stat` shows one file (README.md) with +8/−6. `git diff --stat origin/main...HEAD` outside the folder is empty, and the folder contains only README.md, Suggested.lean and metadata.toml. I changed no worktree file. The probe script is in the job's scratch directory.

**Gate.** The worker's gate on 39cf901 reports every check 0, including `build=0`, and `OK`. My rerun of the full gate on this head printed every scanner at 0 and `OK`.

**Dependency check (verbatim):**

```text
depcheck: 244 roadmaps, 2465 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. This roadmap is `ORDER.txt` line 269, after its last analytic supplier AnalyticNumberTheoryPartI (line 90). ProbabilisticAndMetricNumberTheory, which the ownership note at §1.1 contrasts, is line 275, later in the order and not cited as a supplier. The diff adds no `*Needs:*` edge to another roadmap: the new entries on the *Needs:* line are Mathlib declarations only.

**Lean.** `lake env lean TauCetiRoadmap/SieveMethodsAndPrimePatterns/Suggested.lean` exits 0 with 36 lines of output. All 36 are `declaration uses 'sorry'`, one for each of the file's 36 `sorry`s. Suggested.lean is byte-identical to b309f90. So these all stand unchanged:
- the binder check, re-confirmed by the worker's 56-declaration `signatures.md` with 0 lost binders;
- the one-tactic padding probe;
- the headline list in the module docstring (Selberg Gram, Brun fundamental and upper sieves; interval, progression and twin/Goldbach bounds; Brun convergence; large sieves; Jutila means; Linnik; Smith and Koymans–Pagano; Vaughan; small-conductor; Bombieri–Vinogradov forms; Maynard clusters; Chen's two theorems), with its not-statable list.

The majorant is an elementary lemma, not a headline, so it is correctly absent from the Lean file.

**Library declarations opened at the manifest pins** (Mathlib 1b1ccf4, Tau Ceti 2fd255d; 18 declarations):

| README reference | At the pin |
|---|---|
| `ContDiffBump.normed` (line 35) | `Mathlib/Analysis/Calculus/BumpFunction/Normed.lean:35`, `protected def normed` |
| `ContDiffBump.integral_pos` (line 66) | `Normed.lean:66` |
| `ContDiffBump.integral_normed` (line 71) | `Normed.lean:71` |
| `ContDiffBump.tsupport_normed_eq` (line 79) | `Normed.lean:79` |
| `Nat.exists_prime_lt_and_le_two_mul` (line 225) | `Mathlib/NumberTheory/Bertrand.lean:225`, inside `namespace Nat` (195–245) |
| `ArithmeticFunction.mul_apply` (`Defs.lean:254`) | `Mathlib/NumberTheory/ArithmeticFunction/Defs.lean:254`, `protected theorem mul_apply` |
| `IsApproximateSubgroup` (64) | `Mathlib/Combinatorics/Additive/ApproximateSubgroup.lean:64` (structure) |
| `IsApproximateSubgroup.subgroup` (120) | same file, line 120 |
| `IsApproximateSubgroup.of_small_tripling` (128) | same file, line 128 |
| `TauCeti.IdealArithmeticFunction.vonMangoldt` (82) | `TauCeti/NumberTheory/ArithmeticDirichletSeries/VonMangoldt.lean:82` |
| `TauCeti.IdealArithmeticFunction.norm_vonMangoldt_le_log` (178) | `VonMangoldt.lean:178` |
| `TauCeti.IdealArithmeticFunction.convolution_one_one_apply` (`Convolution/Basic.lean:366`) | `TauCeti/NumberTheory/ArithmeticDirichletSeries/Convolution/Basic.lean:366`, namespaces `TauCeti`/`IdealArithmeticFunction` (77, 205). The old flat `Convolution.lean` is absent from the directory listing. |
| `Pi.norm_def`, `norm_le_pi_norm` (unchanged lines 310, 346) | `@[to_additive Pi.norm_def]` at `Constructions.lean:309` on `Pi.norm_def'` (310); `@[to_additive norm_le_pi_norm]` at 345 on line 346 |
| `Polynomial.monicEquivDegreeLT` (141), `Polynomial.degreeLTEquiv` (114) | `Mathlib/RingTheory/Polynomial/Basic.lean:141` and `:114` |
| `AddChar.sum_eq_zero_of_ne_one` (240), `AddChar.sum_eq_card_of_eq_one` (250) | `Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean:240` and `:250` |
| `ArithmeticFunction.sum_Ioc_mul_eq_sum_sum` (new) | `Mathlib/NumberTheory/ArithmeticFunction/Misc.lean:414`: `Σ_(n∈Ioc 0 N)(f*g)(n) = Σ_(n∈Ioc 0 N) f n · Σ_(m∈Ioc 0 (N/n)) g m` |
| `ArithmeticFunction.sum_Ioc_mul_zeta_eq_sum` (new) | `Misc.lean:430`: `Σ_(n∈Ioc 0 N)(f*ζ)(n) = Σ_(n∈Ioc 0 N) f n · ↑(N/n)`, with natural-number division, that is ⌊N/n⌋, as the README writes |

No other `*.lean` file reference or pin hash occurs anywhere in the README; the full grep finds only lines 45–63.

**The new locator against the source.** HB-SIEVES is arXiv math/0209360v1, extracted with pdftotext.
- HB-SIEVES lines 802–811: Lemma 3.1, on printed p. 15. For h∈ℕ, S₁ = `Σ_(d<x)μ(d)²h^ν(d) ≤ x(1+log x)^h` and S₂ = `Σ_(d<x)μ(d)²h^ν(d)/d ≤ (1+log x)^h`.
- Lines 813–847: the proof, on p. 16. It bounds S₂ by `(Σ_(d<x)μ(d)²/d)^h`.

So all four claims of the parenthesis are accurate: the section, the pages, the squarefree d<x, and the summatory exponent h. ν is the source's name for ω. The README's own form is a strict extension: it drops μ², uses n≤Z, and lowers the summatory exponent to k−1. The locator says so and attributes the extension to the proof sketch, which proves it (table below). The paragraph sits after the hypothesis line and before the proof sketch, as the GGPY Lemma 3 target does (locator at `README.md:1029`).

**Seeded sample where it falls in the change (§1.1).** The diff touches §1.1 only.
- New locator: checked above.
- §1.1's other locators, read against the cached texts:
  - GGPY-2009 Lemma 3 with (2.3)–(2.5) is on PDF pp. 9–10 (lines 410–424, page 10 starts at line 425), and Lemma 4 is on p. 10 (line 443).
  - MAYNARD-2015 Lemma 6.1 is on PDF page 18 (line 1100), which is printed p. 400 under the README's "printed = PDF + 382".
  - HB-SIEVES (3.5) and (3.6) are at lines 885 and 902, on printed pp. 17–18.
- None of the other sampled targets (§§0.6, 0.11, 1.2, 1.3, 1.6, 2.6, 2.9, 3.3, 3.4, 4.3, 4.4, 4.7, 5.3, 5.5) is touched by the diff. §1.6 and §4.4 cite the majorant, whose statement is unchanged. The r4 consumer rows below stand.

**Overlaps and ownership.**
- `overlaps.md` reports no open pull request that changes this roadmap and no dropped id.
- Its one lead ("IntegralLattices Layer 0 … only #1239 defines it") is again false. Main 3b3f7ef has `### Layer 0: lattices, the dictionary, and the first invariants` at `TauCetiRoadmap/IntegralLattices/README.md:507` and Layer 3 at line 829. The tool misses level-3 headings.
- The diff adds no object, so the ownership conclusions of r4 stand.
- `citations.md` lists no cross-roadmap citation found nowhere. Its Lean-name leads are this roadmap's own declarations in Suggested.lean (e.g. `SieveApplications.brun_reciprocals`, `Suggested.lean:135`). None of them is in the changed lines.

**Adversarial pass.** The first five rows cover the statements this diff changes, with values computed exactly by `probe/majorant.py` in scratch (integer τ_k tables to 20000, rational arithmetic). The remaining rows are carried forward from the previous report (r4) for statements the diff leaves untouched. r4 in turn carried r3's rows and r2's 160 rows, which include the earlier seeded sample §§0.2, 0.3, 0.4, 0.7, 1.3, 2.1, 2.2, 2.3, 2.5, 3.0, 3.2, 4.1, 4.6, 4.8 and 5.3 and the headline statements.

| Statement (line) | Instance | Values computed | Result |
|---|---|---|---|
| Needs: `sum_Ioc_mul_eq_sum_sum`, harmonic regrouping (1075, sketch 1065) | f=τ₂/id, g=1/id, so f*g=τ₃/id; N=4 and N=10 | N=4: `Στ₃(n)/n` = 5 and `Σ(τ₂(d)/d)H_⌊4/d⌋` = 5. N=10: 869/84 = 869/84 (10.345) | identity as cited |
| Needs: `sum_Ioc_mul_zeta_eq_sum`, summatory step (1075) | f=τ₂, N=4 and 10 | `Στ₃(n)` = 13 = `Στ₂(d)⌊4/d⌋`; at N=10, 53 = 53 | identity as cited |
| Locator: HB Lemma 3.1 against the README form, h=k=3 (1063) | x=Z=10 | HB S₂ = 6.029 ≤ `(Σμ²/d)³` = 12.860 ≤ 36.02; README harmonic 10.345 ≤ 36.02. HB S₁ = 22 ≤ x(1+log x)³ = 360.2; README summatory 53 ≤ x(1+log x)² = 109.1 | locator accurate; README form is the stated extension |
| same | x=Z=100; 1000 | 100: S₂ 17.49 ≤ 56.43 ≤ 176.10; README 40.93 ≤ 176.10; summatory 1471 ≤ 3141.8. 1000: S₂ 35.66 ≤ 144.08 ≤ 494.49; README 105.12 ≤ 494.49; summatory 29425 ≤ 62532.6 | holds; exponent k−1 strictly sharper than HB's h |
| Pin line and file:line references (45–63) | the 18 declarations of the table above | 18 of 18 open at the stated line (or its `to_additive` attribute line) at 1b1ccf4 / 2fd255d; the manifest revs equal `git rev-parse HEAD` of both packages | repaired |
| 1.1 majorant, harmonic form (r4) | k=1…5, all Z≤20000 | max ratio 1.0000, only at Z=1 | holds (r4) |
| 1.1 majorant, summatory form (r4) | k=1…5, all Z≤20000 | max ratio 1.0000, only at Z=1 | holds (r4) |
| majorant Checks (r4) | k=1,2,3 at Z=2,3,4 | 1.5≤1.693, 2≤2; 3≤3.386, 5≤6.296, 8≤9.545; 4≤5.733, 2.5≤4.854 | reproduced (r4) |
| majorant negative control (r4) | Z(log Z)^(k−1), k=2, Z=2 | 1.386 < 3 | fails as stated (r4) |
| majorant at Z<1 (r4) | k=1, Z=0.2 | 0 against −0.609 | Z≥1 needed, as stated (r4) |
| 3^ω≤τ₃, τ²≤τ₄ (r4) | n≤20000; a=1,2,3 | all true; 4=4, 9≤10, 16≤20 | holds (r4) |
| consumer §4.4 S₁ (r4) | k=3, R=10⁴ | 496398 ≤ 1042511 ≤ 7813166 | consistent (r4) |
| consumer §1.6 twin/Goldbach (r4) | z=100 | 220912 ≤ 1042511 | consistent (r4) |
| consumer §1.6 interval (r4) | y=e³⁰ | 1.74e7 and 2.86e6 ≤ 3.96e8 | consistent (r4) |
| §4.4 effectivity sentence (r4) | Layer 3 §3.3 | heading resolves (now line 2615) | well-formed (r4) |
| LS-EXCLUSION, GREEN-LS entries (r4) | q=3; C=9, 30, 100 | `(1−β)log 3≥c`; 0.8025, 0.7061, 0.6784 | consistent (r4) |
| 3.0 small_conductor_maximal (r3, via r4) | χ mod 3, x=y=3, s=1 | norm 0.693 ≤ 3.38 | holds |
| 3.0 junk level r=0, r=1,2 (r3, via r4) | χ(n)=0; trivial only | 0 ≤ RHS; quantifier empty | harmless / vacuous as the Check says |
| 3.0 envelope, absorption, mask (r3, via r4) | L=log 2, ℓ=log 3; r=3; s=12, y=10 | f′=0.406<1; 1.457; 4.277≤4.605 | holds |
| Hilbert ownership; Corollary 18.6 (r3, via r4) | δ=1/2, H=1; Δ=1/16, x=16 | constant 2 needs π; corrected 3 against printed ≈6.09 | split and correction stand |

**Remark on untouched text (no change requested).** The k=3 Check at `README.md:1071` writes (1+log 2)³ ≈ 4.853. The computed value is 4.8538, which rounds to 4.854 (r4's table already has 4.854). The inequality 5/2 ≤ 4.85 is unaffected.

**Shape and policy of the changed lines.** The locator is prose in the author's own words, with the strict-d<x and squarefree restrictions stated. The *Needs:* line names only pinned Mathlib declarations, each in backticks with its namespace. There is no LaTeX, process word, pull-request number or machine path: the gate scanners report latex, prnum, round-labels and private-paths all 0.

## Not verifiable

- Nothing in the changed passages. The earlier reports' items are untouched by this diff: CHEN-73-CN Lemma 6 (waived), and the proofs of LS-EXCLUSION and GREEN-LS, which are AnalyticNumberTheoryPartI's targets.

## Source issues

- **Misprint** in HB-SIEVES at §3, proof of Lemma 3.1, printed p. 16 (line 845): the source says that for squarefree d written as a product of h primes, h^ν counts the ordered h-fold factorizations; it should be d a product of ν(d) primes, since h is the number of factors, not of primes; affects nothing.
