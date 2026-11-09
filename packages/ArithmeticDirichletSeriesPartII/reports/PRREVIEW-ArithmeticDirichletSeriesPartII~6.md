# Review of ArithmeticDirichletSeriesPartII (pull request #1415 at e87e4fe)

**Verdict:** accepted

:robot: Independent AI review. This is an incremental re-review of the 35 lines of `TauCetiRoadmap/ArithmeticDirichletSeriesPartII/` that changed since `f00bdc5`.

- Both findings of the previous review are repaired.
- The repairs introduce no new problem.
- The gate, the dependency check and the elaboration pass.
- No finding remains.

## Previous findings

- R01 — repaired: the IEANTN entry is gone; `grep IEANTN` over the folder finds 0 lines. References keeps 7 entries (Delange, Wiener.lean, IwaniecKowalskiCh1.lean, Lebl, Wood, Gamburd–Magee–Ronan, Osele), each cited by a section, matching the 7 manifest ids.
- R02 — repaired: `README.md:1343–1352` “`PrimeNumberTheoremAnd/IwaniecKowalskiCh1.lean` at revision `127b50e3`, with `d k` defined as `ζ ^ k` (pnt-ik-ch1 line 193) … `LSeries_d_summable` (pnt-ik-ch1 line 243)”. References `:1470–1477` links `…/blob/127b50e33f…/…IwaniecKowalskiCh1.lean`. `sources.toml` records `pnt-ik-ch1` (certified, `cited_for = ["§5.1"]`).

## Verified sound

### Gate, dependency check, elaboration, signatures

- **Gate.** I re-ran the gate on `e87e4fe`. It printed `set_option=0 blob=0 latex=0 … statement-hygiene=0 … readme-ids-missing=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
  - My run printed no `build` field. The worker's gate on this head has `build=0`.
  - Separately, `lake env lean` on `Suggested.lean` exits 0. Its only output is 19 `declaration uses 'sorry'` warnings.
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside the folder lists 0 paths, and the worktree is clean.
- **Dependency check.** The `--movable` run printed exactly `depcheck: 238 roadmaps, 2353 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
  - In the merge order, AnalyticNumberTheoryPartI is at line 49, AnalyticNumberTheoryPartII at 50, SieveMethodsAndPrimePatterns at 54 and this roadmap at 90.
  - AnalyticNumberTheoryPartIII, which consumes §5.1, is at line 271.
- **Lean diff.** Since `f00bdc5`, the `Suggested.lean` diff changes one docstring only, on `LSeriesHasSum_zeta_pow`.
- **Signatures.** I elaborated a scratch file with `#check @name` for all 24 declarations. Each elaborated type is identical to `scratch/signatures.md`, compared after normalising whitespace: 24 of 24. None lost a binder. `LSeriesHasSum_zeta_pow` still states norm-summability of `LSeries.term (fun n ↦ ((ζ ^ k) n : ℂ)) s` together with `LSeriesHasSum … (riemannZeta s ^ k)` under `1 < s.re`.
- **Padding probe on the touched declaration.** On a scratch copy of `LSeriesHasSum_zeta_pow`, `simp` reports “made no progress” and `exact?` cannot close the goal.
  - A grep of the pinned Mathlib `NumberTheory/` and of Tau Ceti for `riemannZeta s ^`, `zeta ^ ` and `LSeries…pow` finds no zeta-power L-series result.
  - So the declaration is not padding, and it duplicates no pinned declaration.
- **Headline set.** It is unchanged since the previous report: the same 24 declarations, with 19 admitted theorems. The module docstring still says that every headline is statable, and that §5.2 is a README-only negative control.

### Changed passages, checked in full

| Passage | Checked against | Result |
| --- | --- | --- |
| Scope `README.md:120–123`: “Section 5.1 (Layer 5) keeps only the leading term, derived from §4.2.” | The headings: Layer 5 at `:1300` contains §5.1 at `:1305`; Layer 4 at `:1096` contains §4.2 at `:1150` | Correct. This was the remark on untouched text in the previous report, now applied |
| §5.1 *Source.* `:1343–1352` | pnt-ik-ch1, described below | Supported as written |
| References `:1470–1477` | Revision `127b50e33f6033e2147921167a117af96d9ba4ea`, blob link at that revision, and the five line numbers | Line numbers match the extraction. The manifest's `fetched_from` is the raw file at the same owner, repo and commit, with sha256 `7d03e98a…` |
| `Suggested.lean:302–306` docstring | pnt-ik-ch1 lines 243–244 (`LSeriesSummable (↗(d k : ArithmeticFunction ℂ)) s`) and 262–263 (`LSeries (↗(d k)) s = riemannZeta s ^ k`) | “summability of the terms and the value of `LSeries`” is accurate |

**The §5.1 source, line by line** (all paraphrased):

- pnt-ik-ch1 line 193 defines `d k` as `zeta ^ k` in `ArithmeticFunction ℕ`.
- Line 243 is `LSeries_d_summable (k) (hs : 1 < s.re)`, concluding `LSeriesSummable`.
- Line 262 is `LSeries_d_eq_riemannZeta_pow`, with the same hypotheses.
- Line 176 is `LSeries_tau_eq_riemannZeta_sq`. `τ` is `σ 0` (line 32), and `d 2 = τ` (line 223).
- Line 622 is `LSeries_sigma_eq_riemannZeta_mul (ν : ℂ)`, with `1 < s.re` and `1 < (s − ν).re`. `σᴿ 0 n = #n.divisors` (line 468).

**The Mathlib facts the Source line relies on** (pinned `1b1ccf4b`):

- `LSeriesSummable f s := Summable (term f s)` (`Mathlib/NumberTheory/LSeries/Basic.lean:178`). This is summability in `ℂ`, as the README says.
- `LSeriesSummable.LSeriesHasSum` gives `LSeriesHasSum f s (LSeries f s)` (`:228`).
- `summable_norm_iff` needs `FiniteDimensional ℝ E` (`Mathlib/Analysis/Normed/Module/FiniteDimension.lean:605`), which holds for `E = ℂ`.
- Matching PNT's `↗(d k : ArithmeticFunction ℂ)` with the roadmap's `fun n ↦ ((ζ ^ k) n : ℂ)` takes `ArithmeticFunction.natCoe_apply` (`ArithmeticFunction/Defs.lean:136`) and unfolding `d`. This is a simp step, so “follow by” is fair; no change is needed.

### Sources (seeded sample)

- **§5.1.** This is the only sampled target the diff touches. It is verified above against pnt-ik-ch1 lines 176, 193, 243, 262 and 622.
- **The other sampled targets** are §0.1, §0.1a, §0.2, §1.1, §2.1, §2.2, §2.2a, §3.2, §4.1, §4.2, §4.3, §4.4, §4.5 and §5.2. The diff leaves them untouched. Their locator checks are carried from the previous report (r5) and the reports before it:
  - §0.1a: lebl-diffyqs line 14907.
  - §2.2a: pnt-wiener lines 1877–1883 and 2147–2150.
  - §4.2: wood2019 lines 1652 and 1692, on pp. 416–417.
  - §0.2 and §4.1: delange1954 lines 24–28, 42–44 and 818.
- **Unverified flags.** The README flags no locator as unverified: `grep -i 'unverified|uncertified'` finds 0 lines.

### Adversarial table

New rows, for the changed statements:

| Statement | Instances | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| §5.1 Source: `LSeries_d_eq_riemannZeta_pow` at `127b50e3` | k = 0, 2, 3; s = 2; partial sums to N = 2·10⁵ | k = 0: `1 = ζ(2)⁰ = 1`. k = 2: `ζ(2)² = 2.7058`, partial sum 2.7057. k = 3: `ζ(2)³ = 4.4509`, partial sum 4.4503 | Agree | none |
| §5.1 Source: `d k := zeta ^ k` (line 193) | n = 1, …, 8, k = 3 | `d₃` = 1, 3, 3, 6, 3, 9, 3, 10. `d₃(4) = 6`, against 2 unordered factorisations, as in the README's elementary values | Ordered convention, as stated | none |
| §5.1 Source: `ν = 0` of `LSeries_sigma_eq_riemannZeta_mul` | n = 12, s = 2 | `σᴿ 0 (12) = #{1,2,3,4,6,12} = 6 = d₂(12)`. The hypothesis `Re(s − 0) > 1` is the same as `Re s > 1`. `ζ(s)ζ(s − 0) = ζ(s)²` | `d₂ = σ₀` instance is correct | none |
| §5.1 Source: summability route | `ℂ` as a real normed space | `Summable (term f s)` (`Basic.lean:178`) ⇔ `Summable ‖term f s‖`, since `dim_ℝ ℂ = 2 < ∞` (`summable_norm_iff`). Value: `LSeries f s = ζ(s)^k` | Our conjunction follows | none |
| Scope bullet `:120–123` | Heading lines | §5.1 at 1305 > Layer 5 at 1300; §4.2 at 1150 lies between Layer 4 at 1096 and Layer 5 at 1300 | Parenthetical attached correctly | none |
| References | 7 entries against 7 manifest ids | IEANTN: 0 occurrences. Every entry is cited by a section. `pnt-ik-ch1` sha256 equals its cache key `7d03e98a…` | Consistent | none |
| `LSeriesHasSum_zeta_pow` docstring | `simp`, `exact?` | “no progress” and “could not close” | Not padding | none |

Rows for the statements the diff leaves untouched are carried from the previous report (r5, adversarial table), whose values I re-read. Their Lean statements are unchanged (24 of 24 signatures identical).

| Statement | Values computed (r5, from r3) | Result |
| --- | --- | --- |
| `northcott_natId` | b = 0, 2: sublevels of size 1, 3 | finite, inclusive |
| `HasLaplace` | f = 1, s = 2: 1/2. s = 0: norm integral ∞. f = t², s = 1: 2 = 2/s³ | convergence enforced |
| `hasLaplace_deriv_of_primitive` | f = t, s = 2: 1/2 = 1/2. f = sin, s = 1: 1/2 = 1/2. Control f = 1[t>0]: 1 ≠ 0 | hypothesis needed |
| `hasLaplace_deriv` (Lebl) | `e^(2t)`, s = 3: 2 = 2. Complex s = 1 + i: (3−i)/5 = (3−i)/5 | holds |
| `PoleBoundary` | 1/(s−1) with A = 2: rejected. ζ with A = 1: accepted | coefficient tied to F |
| `squaredSinc` and its lemmas | K(0) = 1/π, K(π/2) = 4/π³, K(π) = 0; mass 1 at λ = 1, 2 | λ > 0 needed |
| `delangeWeight`, shift | w₀(1) = 1 − 1/e, w₁(1) ≈ 0.264; shift ≈ 0.9095 → 1 | factorial correct |
| `regularizedBoundaryL1` | k = 1: `b(y) ~ c log\|y\|`, integrable | holds |
| `delangeSmoothedLimit` | α = e^(at)t^k, A = k!: 1 = 1 | agree |
| `wienerIkehara_smoothed` | f = 1, ψ = (1−\|y\|)₊, x = 10: 0.45 → 1/2. f = 0: 0 = 0 | holds; `A : ℂ` beyond source, marked |
| `wienerIkehara_interval` | f = 1 on [1, 2]: 1. Dyadic control: no limit (1 and 0). a = 0: 0.952 → 1 | majorant needed |
| `monotoneUnsmoothing` | α = e^t: 1. α = 0: 0 | holds |
| `delangeLaplace` | te^(at), t²e^(at): 1/1!, 2/2! = 1 | constants agree |
| `logSummatory_hasLaplace` | c₁ = 1, s = 2: 1/2. c₂ = 1, s = 2: 1/8. s = 0 diverges | Re s > 0 needed |
| `delangeDirichlet` and `_positiveAbscissa` | c = d₂: → 1. c_n = n, a = 2: → 1/2 = A/a | holds |
| `finiteChange_asymptotic` | d₂ + 7·1[n=1]: 7/(X log X) → 0 | holds |
| `lowerPole_perturbation` | l = 0 < k = 1: limit unchanged. l = k = 0: 1 against 2 | strict l < k needed |
| `zetaPow_counting` | k = 0, 1, 3: limits 1, 1, 1/6 against 1/3, 1/2, 1/24 for wrong factorials. §3.12a gives `q_0 = 1` and main term `X(log X)^k/k!`. §3.22 at X = 4: 8 against 6.163, gap 1.84 ≤ 2 | true |
| §5.2 dyadic | S(2^j) = 1, 3, 7, 15, ratio → 2. S(3·2^j) ratio → 4/3 | negative control holds |
| §4.2 Wood (pp. 416–417) | `C₂^k × {0}` notation; pole order `2^r` | Check agrees |

### Cross-roadmap citations and ownership

These are the citations in the changed passages, resolved again at their heads:

- **AnalyticNumberTheoryPartI** (open head `8984606`): §3.12a is at `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:2395`; §3.22 is at `:2601`.
- **SieveMethodsAndPrimePatterns** (open head `66e58fc`): §1.1 is at `:1077`, and the `τ_k` majorants are at `:1142–1146`.
- **AnalyticNumberTheoryPartIII** (open head): it cites §5.1 and `LSeriesHasSum_zeta_pow` at `:88`, `:127` and `:1261`. That name is unchanged here, so the citation still resolves.

Ownership and overlaps:

- `scratch/overlaps.md` lists no open pull request that changes this roadmap, no dropped id, and no id that only an open revision defines.
- The diff moves no heading.
- No pinned library declaration and no other roadmap owns the `ζ^k` Dirichlet series. AnalyticNumberTheoryPartIII cites it from here.

### Remarks on untouched text (no change requested)

- None.

## Not verifiable

- None in the changed passages. pnt-ik-ch1 is in the sources cache at the recorded sha256, and I read it there.
- As in every round, this is a statement and source review. The 19 admitted theorems are not proved; the tables record computed instances, not formal proofs.

## Source issues

- **Misprint** in pnt-ik-ch1 at the docstring of `d`, line 184 (revision `127b50e3`): the source says `d k n` counts ordered factorisations of `n` into `k` natural numbers; it should say positive integers and `n ≥ 1`, since `d k 0 = 0` while `0` has infinitely many such factorisations for `k ≥ 2`; affects nothing.
