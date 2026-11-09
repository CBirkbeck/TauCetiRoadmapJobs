# Review of ArithmeticDirichletSeriesPartII (pull request #1415 at f00bdc5)

**Verdict:** needs changes

:robot: Independent AI review. This is an incremental re-review of the 130 lines of `TauCetiRoadmap/ArithmeticDirichletSeriesPartII/` that changed since `aa2af10`.

- All six findings of the previous review are repaired.
- The gate, the dependency check and the elaboration pass.
- Two new P3 findings remain, both in the reference material added in the last commit. Neither blocks.

## R01 (P3) — A References entry that no section cites

**Location.** `TauCetiRoadmap/ArithmeticDirichletSeriesPartII/README.md:1470–1472`: “T. Tao and contributors, *IEANTN: Integrated Explicit Analytic Number Theory Network*, revision `466b41b2…` (Apache-2.0), [repository](…). Cited for no section of this roadmap.”

**Claim.** The References section lists the works the roadmap cites. This entry says it supports nothing. It also records that a search was made, which is process narrative.

**Witness.**
- `IEANTN` occurs only at README lines 1470 and 1472. No *Source.* line, *Needs* line or Check mentions it.
- The package `sources.toml` has no entry for it. Its six ids are delange1954, wood2019, gmr2019, osele-laplace, pnt-wiener and lebl-diffyqs.

**Repair.** Delete the three-line entry. Afterwards every remaining References entry is cited by a section:

| Reference | Cited by |
| --- | --- |
| Delange | Layers 0–4 |
| Wiener.lean | §2.2a |
| IwaniecKowalskiCh1.lean | §5.1 |
| Lebl | §0.1a |
| Wood | §4.2 |
| Gamburd–Magee–Ronan | Downstream consumers |
| Osele | §0.1 |

If a section does rely on IEANTN, cite it there with a file and declaration instead.

## R02 (P3) — The new §5.1 source has no locators, an unpinned link and no manifest record

**Location.**
- `README.md:1343–1346`: “*Source.* Kontorovich, Tao et al., PrimeNumberTheoremAnd, `IwaniecKowalskiCh1.lean`: `LSeries_d_summable` and `LSeries_d_eq_riemannZeta_pow` …”.
- References entry at `README.md:1464–1469`, which links “[repository](https://github.com/AlexKontorovich/PrimeNumberTheoremAnd)”.

**Claim.** The §5.1 source gives no revision and no line numbers. The References entry names revision `127b50e3` but links to the moving repository head. The package `sources.toml` does not record the work. By contrast, §2.2a cites `pnt-wiener line 1877`, links the file at its revision, and has a manifest entry.

**Witness.**
- `sources.toml` lists six ids, none of them for this file.
- A probe fetch of the raw file at `127b50e33f6033e2147921167a117af96d9ba4ea` succeeds (author-page, Apache-2.0).
- The four declarations are at file lines 172, 239, 258 and 618. These are lines 176, 243, 262 and 622 of the line-numbered extraction.
- `d k := zeta ^ k` is at file line 189.

**Repair.**
- Link `…/blob/127b50e33f6033e2147921167a117af96d9ba4ea/PrimeNumberTheoremAnd/IwaniecKowalskiCh1.lean`.
- Record the file in `sources.toml` with `cited_for = ["§5.1"]`.
- Name the revision in the §5.1 *Source.* line.
- Cite each declaration as `<id> line N`, as §2.2a does.

With these changes, each claim of the Source line can be checked at a fixed text: summability for every `k`, the sum `ζ(s)^k`, and the `k = 2` and `ν = 0` instances.

## Previous findings

- R01 — repaired: `README.md:956–966` now cites `wiener_ikehara_smooth` (pnt-wiener line 1877) and `WienerIkeharaInterval` (pnt-wiener line 2147) at `2667e414`. It lists as derived here: complex `A`, continuous `ψ` with `ψ(0) ≠ 0`, derived summability, complex interval form, `a = 0`.
- R02 — repaired: `README.md:450–455` cites “Lebl, *Notes on Diffy Qs*, version 6.11, §6.2.1, p. 300 and Table 6.2 (lebl-diffyqs line 14907)”, with exponential order and real `s > c`. The integrability-only complex form is marked as derived.
- R03 — repaired: `README.md:111–117` and `:259–262` cite `TauCeti.LSeries.tendsto_inv_mul_tsum_mul_div_atTop` (`SharpCutoff.lean`, line 125) and say how the variant differs. Step 4 (`:926–928`) attributes its argument.
- R04 — repaired: `README.md:120–123` and `:1312–1320` cite AnalyticNumberTheoryPartI §3.12a (`f = τ_(k+1)`, `α = k + 1`, `q_0 = 1`) and §3.22. §5.1 now owns only the series, and `zetaPow_counting` serves as the normalisation test.
- R05 — repaired: `README.md:169` “From Mathlib (pinned 1b1ccf4b)”; `:234` “From Tau Ceti (pinned 2fd255d9)”; `:266` “`TauCeti/Analysis/Asymptotics/Sum/Window.lean`”.
- R06 — repaired: `README.md:28–30` uses “(with `C₂ = ℤ/2ℤ` written additively) … `C₂^r × {0}`”, and `:1168–1176` says “Wood (2019), §7, p. 416 … (§7, p. 417; wood2019 line 1692)”. The `× {0}` form is also at `:1288` and `:1385`.

## Verified sound

### Gate, dependency check, elaboration, signatures

- **Gate.** My re-run on `f00bdc5` printed `set_option=0 … statement-hygiene=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`. This matches the worker's gate.
- **Outside the folder.** The diff against `origin/main` outside the folder has 0 paths, and the worktree is clean.
- **Dependency check.** The `--movable` run printed exactly `depcheck: 238 roadmaps, 2352 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. In the merge order, AnalyticNumberTheoryPartI is at line 49, AnalyticNumberTheoryPartII at 50, SieveMethodsAndPrimePatterns at 54 and this roadmap at 90. The new citation of AnalyticNumberTheoryPartI therefore points downward, and the description's merge-order paragraph names it.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0. Its only output is 19 `declaration uses sorry` warnings.
- **Lean diff.** The `Suggested.lean` diff since `aa2af10` changes docstrings only: five docstrings and the module docstring. No signature changed.
- **Signatures.** A scratch file with `#check @name` for all 24 declarations elaborated, and the types are unchanged from the previous report's comparison. For example, `wienerIkehara_smoothed` still takes `Continuous ψ`, `HasCompactSupport ψ` and `A : ℂ`, with no sign or summability hypothesis. `zetaPow_counting` still uses `ArithmeticFunction.zeta ^ (k + 1)` and the limit `1 / k!`.
- **Docstrings.** The new docstring claims agree with the README and the sources: Lebl's exponential-order form; PNT+'s smooth `ψ` supported away from `0`, real residue and separate summability; `WienerIkeharaInterval` with `f ≥ 0` and `0 < a ≤ b`.

### Sources (seeded sample)

These are the sampled targets that fall in changed passages. All passages are paraphrased.

| Target | Locator checked | Result |
| --- | --- | --- |
| §0.1a | lebl-diffyqs line 14904 (page header “300”), line 14907 (§6.2.1): differentiable `g` with `\|g\| ≤ M e^(ct)`; for real `s > c` the transform of `g′` is `s G(s) − g(0)`; Table 6.2 at lines 14925–14937. Version 6.11, May 2026, at lines 8–9 | Supported as written; the derived extensions are marked |
| §2.2a | pnt-wiener line 36 (`A : ℝ`, `f : ℕ → ℂ`, `Ψ : ℝ → ℂ`); lines 840–842 (`cheby`: `∑_{n<N} ‖f n‖ ≤ C N`); line 50 (`nterm` = `‖f n‖/n^σ`); lines 1877–1883 (smooth `Ψ`, compact support, closure of support in `Ioi 0`); lines 2147–2150 (`f : ℕ → ℝ`, `0 ≤ f`, `0 < a`, `a ≤ b`, `Ico a b`) | Supported as written |
| §4.2 (Wood) | wood2019 line 1614 (header 416), line 1617 (p. 416), line 1652 (p. 416, multiplicative `C₂^k × 1`), line 1682 (header 417), line 1692 (p. 417, pole order `2^k`, partial sums `c_k X (log X)^(2^k−1)`) | Supported; pages now correct |
| §5.1 | `IwaniecKowalskiCh1.lean` at `127b50e3` (probe fetch): `LSeries_tau_eq_riemannZeta_sq` (file line 172), `d k := zeta ^ k` (189), `LSeries_d_summable` (239, `Re s > 1`), `LSeries_d_eq_riemannZeta_pow` (258), `LSeries_sigma_eq_riemannZeta_mul` (618, `Re s > 1`, `Re(s − ν) > 1`) | Supported; locators missing (R02) |
| §0.2, §4.1 (unchanged; spot check) | delange1954 lines 24–28 (p. 213 standing hypotheses), lines 42–44 (footnote: subtract `α(0)`), line 818 (Theorem III, p. 235, continued on p. 236 from line 820) | Supported |

The other sampled targets (§0.1, §1.1, §1.2, §2.2, §3.1, §3.2, §4.3, §4.4 and §5.2) are untouched by the diff. They were verified in the previous report, and I carry those results forward. The README flags no locator as unverified.

### Adversarial table

Changed statements get new rows with computed values:

| Statement | Instances | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| §5.1 / Scope: AnalyticNumberTheoryPartI §3.12a at `f = τ_(k+1)` | k = 0, 1, 3 | `α = k+1`, `Q(s) = ((s−1)ζ(s))^(k+1)`, `q_0 = Q(1)/1 = 1`; main term `x q_0 (log x)^k/Γ(k+1)` = `x`, `x log x`, `x(log x)³/6`; `zetaPow_counting` limits `1/k!` = 1, 1, 1/6 | Consistent | none |
| §5.1: AnalyticNumberTheoryPartI §3.22 | X = 4 | exact sum 8; `4 log 4 + (2γ−1)·4 = 5.545 + 0.618 = 6.163`; gap 1.84 ≤ `√4 = 2`; leading ratio `8/(4 log 4) = 1.443 → 1` | Consistent | none |
| Scope: Tau Ceti `tendsto_inv_mul_tsum_mul_div_atTop` | `a = 1`; tent `Ψ = max(0, 1 − 2\|y−1\|)` (value check only); x = 10 | `(1/10) ∑_{n=6}^{14} Ψ(n/10) = 5.0/10 = 0.5`; `A ∫Ψ = 0.5`. `tsupport ⊆ Ioi 0` forces `Ψ(0) = 0`, so `ψ = (1−\|y\|)₊` (`ψ(0) = 1`) is outside it; under §2.2a it gives 0.45 at x = 10, tending to 1/2 (previous report) | The stated difference is accurate | none |
| §2.2a source: `wiener_ikehara_smooth` | f ≡ 1 (including n = 0) | `cheby`: `∑_{n<N} 1 = N ≤ 1·N`, C = 1; residue `A = 1 ∈ ℝ`; `A : ℂ` in `wienerIkehara_smoothed` is beyond the source | Description accurate | none |
| §2.2a source: `WienerIkeharaInterval` | f = 1, a = 1, b = 2, x = 10; a = 0, b = 1, x = 10.5 | `#{10 ≤ n < 20}/10 = 1 = A(b−a)`; ours `#{10 < n ≤ 20}/10 = 1`; `a = 0` is excluded there (`0 < a`), and ours gives `10/10.5 = 0.952 → 1` | Endpoint and cutoff extensions marked | none |
| §2.2a step 4 attribution | Tau Ceti `SharpCutoff.lean:141–144` | calls `tendsto_tsum_term_mul_fourier_schwartz_atTop ha …` (`Approximation.lean:394`, needs `0 ≤ a`); scale `2πA·(2π)⁻¹∫Ψ = A∫Ψ` | Exactly the input step 3 replaces | none |
| §0.1a source (Lebl) | `g = e^(2t)`, c = 2, s = 3 | `L{g′} = 2/(3−2) = 2`; `s·1 − g(0) = 3 − 1 = 2` | Holds | none |
| §0.1a beyond source | f = sin, s = 1 + i | `s · 1/(s²+1) − 0 = (1+i)(1−2i)/5 = (3−i)/5`; `L{cos}(s) = (1+i)/(1+2i) = (3−i)/5` | Complex `s` holds, as marked | none |
| §4.2 Wood pages | wood2019 lines 1652, 1692, 1617 | page headers 416 at line 1614 and 417 at line 1682, so pp. 416, 417, 416 | Correct | none |
| Wood notation | r = 1, ℚ(i) character | additive `{0}×C₂ ∩ C₂×{0} = {(0,0)}`; multiplicative `ρ(I_p) ∩ (C₂ × 1) = 1`, the same condition; complex conjugation maps to `(0,1)`, so it is excluded from `F_1` | The Check agrees with the headline | none |
| §5.1 source declarations | k = 2, s = 2; ν = 0, n = 4 | `ζ(2)² = π⁴/36 ≈ 2.7058`; `∑_{n≤4} d₂(n)/n² = 1.9097`, increasing; `σᴿ 0 (4) = 3 = d₂(4)`; `Re(s − 0) > 1` is the same as `Re s > 1` | Supported | R02 (locators) |
| References | IEANTN entry | 0 citing sections; 0 manifest entries | Uncited | R01 |
| Pins and path | `lake-manifest.json` | TauCeti `2fd255d9…`, mathlib `1b1ccf4b…`; `exists_sum_Icc_le_mul_of_isBigO` at `Sum/Window.lean:111` (namespace `TauCeti`, line 40) | Match | none |

Untouched statements: these rows are carried from the previous report (r3), whose values I re-read. The Lean statements are unchanged.

| Statement | Values computed (r3) | Result |
| --- | --- | --- |
| `northcott_natId` | b = 0, 2: sublevels of size 1, 3 | finite, inclusive |
| `HasLaplace` | f = 1, s = 2: 1/2; s = 0: norm integral ∞, so false; f = t², s = 1: 2 = 2/s³ | convergence enforced |
| `hasLaplace_deriv_of_primitive` | f = t, s = 2: 1/2 = 1/2; f = sin, s = 1: 1/2 = 1/2; f = e^(−2t), s = −1: −2 = −2; control f = 1[t>0]: 1 ≠ 0 | holds; hypothesis needed |
| `hasLaplace_deriv` | f = t², s = 1: 2 = 2 | holds |
| `PoleBoundary` | 1/(s−1) with A = 2: rejected (1 ≠ 2); ζ with A = 1: accepted | coefficient tied to F |
| `squaredSinc`, `_fourier`, `_mass` | λ = 1: K(0) = 1/π, K(π/2) = 4/π³, K(π) = 0; mass 1 at λ = 1, 2; 0 at λ = 0 | agree; λ > 0 needed |
| `delangeWeight`, shift | w₀(1) = 1 − 1/e, w₁(1) ≈ 0.264, w₂(1) ≈ 0.080; shift k = 1, h = 1, t = 10: ≈ 0.9095 → 1 | factorial correct |
| `regularizedBoundaryL1` | k = 1, R = c/(s−a): `b(y) ~ c log\|y\|`, integrable | holds |
| `delangeSmoothedLimit` | α = e^(at)t^k, A = k!: limit 1 = 1 | agree |
| `wienerIkehara_smoothed` | f = 1, ψ = (1−\|y\|)₊, x = 10: 0.45 → 1/2; f = 0: 0 = 0 | holds |
| `wienerIkehara_interval` | f = g = 1, [1, 2]: 1, 1.0476 → 1; f = (−1)^n: → 0; dyadic control with no limit (1 and 0); a = b: 0 = 0 | majorant needed |
| `monotoneUnsmoothing` | α = e^t: 1; α = 0: 0 | sign-free holds |
| `delangeLaplace` | te^(at), t²e^(at): 1/1!, 2/2! = 1 | constants agree |
| `logSummatory_hasLaplace` | c₁ = 1, s = 2: 1/2; c₂ = 1, s = 2: 1/8 = (1/4)/2; s = 0 diverges | Re s > 0 needed |
| `delangeDirichlet`, `_positiveAbscissa` | c = 1: → 1; c = d₂: → 1; c_n = n, a = 2: → 1/2 = A/a; a = 0 excluded (∑1/n ~ log X) | holds |
| `finiteChange_asymptotic` | d₂ + 7·1[n=1]: 7/(X log X) → 0 | holds |
| `lowerPole_perturbation` | d₂ + (−1)^n, l = 0 < k = 1: limit unchanged; l = k = 0 gives limits 1 against 2 | strict l < k needed |
| `LSeriesHasSum_zeta_pow` | k = 0: 1 = ζ⁰; k = 2, s = 2: 2.706 against partial sum 1.910; d₃(4) = 6, unordered 2 | Dirichlet power correct |
| `zetaPow_counting` | k = 0, 1, 3: 1, 1 (8/(4 log 4) ≈ 1.44 at X = 4), 1/6 against 1/3, 1/2, 1/24 | true |
| §5.2 dyadic | S(2^j) = 1, 3, 7, 15, ratio → 2; S(3·2^j) ratio → 4/3 | negative control holds |

### Library declarations opened at the pins (Tau Ceti `2fd255d9`)

- `TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.lean`: line 69 (`namespace TauCeti.LSeries`), :119 (`a : ℕ → ℂ`, `A : ℂ`), :125 (`tendsto_inv_mul_tsum_mul_div_atTop`: `0 ≤ a`, `hG`, `hG'`, `hsum`, `ContDiff ℝ ∞ Ψ`, `HasCompactSupport Ψ`, `tsupport Ψ ⊆ Ioi 0`), :141 (its Schwartz input).
- `…/WienerIkehara/Approximation.lean:394` (`tendsto_tsum_term_mul_fourier_schwartz_atTop`, needs `0 ≤ a`).
- `TauCeti/Analysis/Asymptotics/Sum/Window.lean`: line 40 (`namespace TauCeti`), :111.
- The other Tau Ceti and Mathlib declarations of the unchanged supplier contracts were opened in the previous review at the same pins, and are unchanged.

### Cross-roadmap citations and ownership

**Citations resolved**, each against its open head:
- AnalyticNumberTheoryPartI (#1126 head `8984606`): §3.12a is the bold paragraph at `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:2396`. It covers coprime-multiplicative `f_z`, `|f_z| ≤ τ_k`, and the prime sum `α x + O_A(x/log^A x)`, with main term `x q_0 (log x)^(α−1)/Γ(α)`. §3.22 is at `:2602`, with `x log x + (2γ−1)x + O(√x)`.
- SieveMethodsAndPrimePatterns (head `66e58fc`): §1.1 is at `:1077`, and the τ_k majorants are at `:1142–1146`.
- AnalyticNumberTheoryPartIII (#2008): it cites this roadmap's §5.1 for the `d_k` series at `:88` and `:127`, so the ownership stated here is consistent.
- ProbabilisticAndMetricNumberTheoryPartII: its citations of §§0.1, 1.1, 3.1 and 3.2 (`:208` and the following lines) still resolve. The diff moves no heading.

**Ownership by object.** I grepped main and the open heads for the `d_k = ζ^k` Dirichlet series, using its identity and its Lean names. The only other roadmap stating it is AnalyticNumberTheoryPartIII, which cites §5.1. No `Suggested.lean` elsewhere declares this roadmap's fully qualified names. `scratch/overlaps.md` lists no open pull request that changes this roadmap and no dropped id.

### Remarks on untouched text (no change requested)

- `README.md:122–123`: “Section 5.1 keeps only the leading term, derived from §4.2 (Layer 5)” attaches “(Layer 5)” to §4.2 rather than to §5.1. The meaning is still recoverable.

## Not verifiable

- None in the changed passages. IwaniecKowalskiCh1.lean is not in the manifest, so I read it through a probe fetch into a scratch manifest copy, not the package's `sources.toml` (R02). As before, this is a statement and source review: the 19 admitted theorems are not proved, and the tables record computed instances, not formal proofs.

## Source issues

- **Gap** in lebl-diffyqs at §6.2.1, printed p. 300: the source says differentiability and exponential order of `g` justify integrating `e^(−st) g′` by parts; it should also assume `g′` locally integrable (for example piecewise continuous), since a derivative need not be; affects nothing (§0.1a assumes integrability explicitly).
