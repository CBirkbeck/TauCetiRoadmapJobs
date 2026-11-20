# Review of DecisionTreeComplexity (pull request #2746 at 2a42d5b)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every definition, inequality and numerical Check was recomputed by brute force on all Boolean functions on at most four variables, every source locator of the three texts was read at its place, and the routes of 3.2, 4.1, 4.2, 4.3, 4.4, 5.1 and 5.2 were checked step by step. There is one small correction (the later versions of Huang's paper state Theorem 1.5 with a different constant) and one format note, neither blocking; nothing is left for a human to decide beyond the final approval.

## C01 — Theorem 1.5 of Huang's paper reads `bs(f) ≤ 2 s(f)⁴` only in version 1 of the preprint

A reader who opens the current arXiv version under the locator of 5.3 ("Huang, Theorem 1.5, p. 3", line 500) finds a different inequality. Version 1 states `bs(f) ≤ 2 s(f)⁴` at Theorem 1.5 on its page 3, as cited; version 2 states `bs(f) ≤ s(f)⁴` under the same number, because it replaces the Nisan–Szegedy constant by Tal's `bs ≤ deg²`. The References do say that version 1's numbering is used, and the statement of 5.3 is true and is what 4.3 and 5.2 give, so nothing stated is affected.

A clause in 5.3 would settle it, for instance: "(Huang, version 1, Theorem 1.5, p. 3; later versions state `bs ≤ s⁴`, using Tal's `bs ≤ deg²`, which is outside this roadmap)".

## N01 — `open scoped Classical` at file level in `Suggested.lean`

The definitions built with set-builder `Finset`s (`certComplexityOn`, `sensitivityAt`, `blockSensitivityAt`) then carry classical decidability instances in their bodies, although `f x = b` and `f (flipBlock x {i}) ≠ f x` are decidable outright. An implementer may prefer `open Classical in` on the one definition that needs it (`blockSensitivityAt`). Form only.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `DecisionTree`, `decisionTreeDepth` | n = 0; constants; `OR₂`, parity₂, `MAJ₃`; all f, n ≤ 4 | `D`: 0; 0; 2, 2, 3. `D = 0` iff constant on all 65814 functions; `D ≤ n` always | holds | none |
| 1.2 certificates, `C`, `C^(b)` | `OR₃`; `f = false`; `OR₂`; wrong "outside S" variant | `OR₃`: `C¹ = 1`, `C⁰ = C = 3`; `false`: `C¹ = 0`; `C(OR₂) = 2`; `C = max(C⁰, C¹)` on all n ≤ 4 | holds | none |
| 1.3 `s`, `bs` | `OR₃`, `AND₃`, parity₃, `MAJ₃`; the four-variable polynomial; n = 4 count | 3, 3, 3 and 2; polynomial values in {0,1}, `s = 2`, `bs = 3`, blocks {2},{3},{0,1} sensitive at 0000; 24 functions with `s < bs` | holds | none |
| 1.4 chain `s ≤ bs ≤ C ≤ D` | all f, n ≤ 4 | 0 violations; n = 4: `s < bs` 24, `bs < C` 0, `C < D` 21040; `MAJ₃`: 2 < 3 | holds | none |
| 2.1 `degree`, unique multilinear representative | n = 0; `X₀²`; parity₂; exactly-1-or-2 of 3; address on 6 | Möbius degree: 0; 1 (not 2); 2; 2 with `s = bs = C = D = 3`; address: `deg = s = bs = C = D = 3` | holds | none |
| 2.2 `deg ≤ D` | all f, n ≤ 4; AND of two ORs | 0 violations; n = 3: 8 functions with `deg < D`; AND-OR: `deg = D = 4` | holds | none |
| 3.1 `C ≤ s · bs` | all f, n ≤ 4; `x ↦ x 0`; AND-OR | 0 violations; 1 = 1 · 1; 2 ≤ 2 · 2 | holds | none |
| 3.2 `D ≤ C^(b) · bs`, both `b` | all f, n ≤ 4; constants; `OR_n`; route by hand | 0 violations for `b = false` and `b = true`; constants 0 ≤ 0; AND-OR 4 = 2 · 2; `β(g) ≤ β(f) − 1` and `C¹(g) ≤ C¹(f)` rechecked | holds | none |
| 3.3 `D ≤ s·bs²`, `D ≤ bs³`, `D ≤ C⁰C¹` | all f, n ≤ 4; AND-OR | 0 violations; AND-OR: 4 = 2 · 2, `s·bs² = bs³ = 8` | holds | none |
| 4.1 symmetrization | m = 0; `X₀X₁`; `X₀ − X₁`; `X₀²`, m = 1; k < j | constant: `q(0)·1 = c`; sums 0,0,1 with `q = X(X−1)/2`; sums 0,0,0, `q = 0`; `q = X`, degree 1 ≤ 2; `C(k,j) = 0` matches empty count | holds | none |
| 4.2 integer-point lemma | m = 0; d = 0; moved Chebyshev m = 4; `c = −10`; `x = 100` | 0 ≤ `d²(c+b₂−b₁)`; `c = 0`; 8 ≤ 16; −10 ≤ −40 false; 975 ≤ 804 false; Markov step gives `mM ≤ d²(b₂−b₁+M)` | holds; both controls separate | none |
| 4.3 `bs ≤ 2 deg²` | all f, n ≤ 4; constants | 0 violations; `bs ≤ deg²` also holds on all; constants 0 ≤ 0; route: `r(0)=0`, `r(1)=1`, `b ≤ 2d²` from 4.2 with `c = 1` | holds | none |
| 4.4 `D ≤ deg² · bs` | all f, n ≤ 4; recursion | 0 violations; `d + (d−1)² = d² − d + 1 ≤ d²` for `d ≥ 1` | holds | none |
| 5.1 Huang, all n | exhaustive n ≤ 4 at size `2^(n−1)+1` (size 1 for n = 0); signs of `A` | least maximum number of neighbours 0, 1, 2, 2, 2 against `√n` = 0, 1, 1.41, 1.73, 2; two 2-paths have opposite signs; `2·dim E ≥ 2^n` | holds, tight at n = 4 | none |
| 5.2 `deg ≤ s²` | all f, n ≤ 4; AND-OR; route | 0 violations; `deg = s²` attained (4 = 2²); class size `2^(d−1) ± (O₁ − E₁) ≠ 2^(d−1)` | holds | none |
| 5.3 `bs ≤ 2 s⁴` | all f, n ≤ 4; the function of 1.3 | 0 violations; 3 ≤ 32; constants 0 ≤ 0; source constant differs by version (C01) | holds | C01 |
| Supplier: Markov's inequality | open head of PolynomialInterpolationAndBestApproximation 4.3 | `abs_derivative_le_sq_mul`: `natDegree ≤ n`, `|p| ≤ M` on `[−1,1]` gives `|p′(x)| ≤ n² M`; equals the contract | resolves | none |
| Archive statement of Huang | `Archive/Sensitivity.lean`, `huang_degree_theorem` | `Card H ≥ 2^m + 1` in `Q (m+1)` gives `√(m+1) ≤` neighbours in `H`; as Scope describes; not importable | agrees | none |

- Source locators read against the text: 26 (Buhrman–de Wolf 18, Huang version 1 7, Beals et al. 1); all agree, with the remark of C01.
- Library declarations opened at the pin: 35 in Mathlib, each in the file the supplier contracts name (for example `MvPolynomial.eq_zero_of_eval_zero_at_prod_finset`, `Mathlib/Combinatorics/Nullstellensatz.lean` line 63; `Real.le_sqrt`, `Mathlib/Analysis/Real/Sqrt.lean` line 239; `Nat.choose_mul`, `Mathlib/Data/Nat/Choose/Basic.lean` line 160); `Archive/Sensitivity.lean` line 410.
- Cross-roadmap citations resolved: 1 supplier (PolynomialInterpolationAndBestApproximation 4.3, at its open head) and 1 non-supplier mention (BooleanFunctionAnalysis, whose Conventions say no degree function is defined).
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: 17 `sorry` warnings and no other message; no `set_option`, no sorry'd data, single `import Mathlib`. The only section variable is `{n : ℕ}`, so no declaration can lose a hypothesis; the 33 elaborated types agree with the README statements.
- One-tactic probe on a copy of the file (`rfl`, `simp`, `simp_all`, `omega`, `positivity`, `infer_instance`, `decide`): none of the 17 theorems closes. Nothing is padding.
- Headline theorems: all those of the Summary (chain, `deg ≤ D`, Nisan, depth bounds and consequences, symmetrization, integer-point lemma, Nisan–Szegedy, Nisan–Smolensky, Huang, sensitivity theorem, `bs ≤ 2s⁴`) are statable at the pins and stated.
- Automatic checks: all passed on this head; no change outside the roadmap folder.

Overlap check: read BooleanFunctionAnalysis, CommunicationComplexity, PolynomialInterpolationAndBestApproximation (and the scope lines of SpectralGraphBounds and ComparisonSortingAndSelection, which exclude the sensitivity theorem and Boolean decision trees); nothing shared. Markov's inequality is owned by PolynomialInterpolationAndBestApproximation 4.3 and cited; the pinned Mathlib and Tau Ceti have no decision trees, certificates or block sensitivity.

Source independence: 12 passages compared with 3 sources, none shared; largest share BuhrmanDeWolf2002, 18 of 26 locators; contents compared with BuhrmanDeWolf2002: independent (its symmetrization and uniqueness lemmas sit in its §2, Nisan's bound and Nisan–Szegedy in its §4, the depth bounds in its §5; the layers here regroup them by dependency, and Layer 5 is not in it).

Research link: The layers are the polynomial relations surveyed by Buhrman and de Wolf (2002) and end with Huang's proof (2019) of the sensitivity conjecture of Nisan–Szegedy (1994) in the Gotsman–Linial (1992) form; rests on the README's sources BuhrmanDeWolf2002 and Huang2019, both read.

## Not verifiable

- The journal versions (Theoretical Computer Science 288; Annals of Mathematics 190; Journal of the ACM 48) were not read; the locators were checked against the preprints the README says it used.
- The Buhrman–de Wolf preprint was read through character recognition; Definition 3 on its page 10 is garbled there and was matched by position and context only.
- The primary papers attributed in prose without a locator (Nisan, Nisan–Szegedy, Ehlich–Zeller, Rivlin–Cheney, Minsky–Papert, Gotsman–Linial, Markov) were not opened; no statement depends on them beyond the cited survey.
- The README's counts on random functions on five variables and on random polynomials were not rerun; the exhaustive counts were.

## Source issues

- **Gap** in BuhrmanDeWolf2002 at Theorem 3, printed page 11: the source says the derivative bound holds for a constant `c` with no sign condition; it should be `c ≥ 0` with `c + b₂ − b₁ > 0`, since the bound is a square root of a quotient; affects nothing.

## For the human reviewers

- Mathlib's `Archive/Sensitivity.lean` (line 410) formalises Huang's theorem for dimension `m + 1`; the statement of 5.1 in `TauCetiRoadmap/DecisionTreeComplexity/Suggested.lean` uses other carriers, names and hypotheses, and the README names the Archive as prior formalization.
