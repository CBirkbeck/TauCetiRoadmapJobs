# Review of ProbabilisticAndMetricNumberTheoryPartII (pull request #1838 at 4820065)

**Verdict:** needs changes

This is an incremental re-review of the 11 lines changed since 08e41f3. They are all in `README.md`: one locator in §2.5 and two new References entries. `Suggested.lean` is unchanged. Both findings are P3 and concern the new citations.

## R01 (P3) — §2.5: the new PNT+ locator proves a narrower statement than the bullet it supports

**Location.** `TauCetiRoadmap/ProbabilisticAndMetricNumberTheoryPartII/README.md` lines 720–722: "PNT+, `KadiriEq12Helpers.lean`, `Phi_analyticOnNhd`, for holomorphy of a two-sided transform on a strip."

**Claim.** The parenthetical is the only locator for the bullet "Holomorphy on strips" (line 711). That bullet takes an a.e. strongly measurable `f : ℝ → V` with `V` a complex Banach space. For every compact `[c, d] ⊂ (a, b)` it assumes that `sup_{σ∈[c,d]} e^{−σt}‖f(t)‖` is integrable, and it concludes that the transform is holomorphic on `a < Re s < b`.

The cited declaration proves much less:
- `φ` is scalar and continuous.
- The bound `φ(x)e^{x/2} = O(e^{−(1/2+b)|x|})` only yields strips `−(1+b) < Re s < b`, and every such strip has centre `Re s = −1/2`.

It therefore does not support the bullet as written, and it fails on the section's own Check. For `f(t) = e^{−|t|}` the transform is `2/(1 − s²)` on `−1 < Re s < 1`. The PNT+ hypothesis holds only for `b ≤ 0`, so PNT+ covers only `−1 < Re s < 0`.

The pinned Mathlib already has the Banach-valued power-bound case, `mellin_differentiableAt_of_isBigO_rpow`. Through the bullet's own Mellin adapter it gives the full strip, so it is the declaration to cite.

**Witness.** PNT+ lines 320–324 (continuous `φ : ℝ → ℂ`, strip `−(1+b) < Re s < b`). For `φ = e^{−|x|}` the ratio `|φ(x)e^{x/2}| / e^{−(1/2+b)|x|}` at `x = 50, 100` is `1, 1` when `b = 0` and `148, 2.2·10⁴` when `b = 0.1`.

**Repair.** Replace lines 721–722 from "PNT+," onwards by:

> Mathlib `mellin_differentiableAt_of_isBigO_rpow`, through the Mellin bullet with `g(u) = f(log u)`, for locally integrable `f` with `‖f(t)‖ = O(e^{at})` as `t → ∞` and `‖f(t)‖ = O(e^{bt})` as `t → −∞`; PNT+ `Phi_analyticOnNhd` is the case of continuous scalar `f` on the strips `−(1 + c) < Re s < c`.)

Also add `mellin_differentiableAt_of_isBigO_rpow` to the §2.5 *Needs:* line. The bullet's absolute-convergence form stays a target, because neither declaration states it.

Tested on `e^{−|t|}`:
- Take `a = −1` and `b = 1`. Then `g(u) = min(u, 1/u)` is `O(u^{−1})` at `∞` and `O(u^{1})` at `0⁺`.
- Mathlib then gives `mellin g` differentiable on `−1 < Re z < 1`. With `z = −s`, that is `−1 < Re s < 1`, the full strip.
- At `s = 1/2`: `2/(1 − 1/4) = 8/3`, and numerical quadrature gives `2.66667`.

## R02 (P3) — References: two new entries cite nothing in the roadmap

**Location.** `README.md` lines 1558–1565:
- PNT+ entry: "`Phi_analyticOnNhd` and `meromorphicOrderAt_riemannZeta_one`. Cited for §2.5."
- IEANTN entry: "Cited for no section of this roadmap."

**Claim.**
- `meromorphicOrderAt_riemannZeta_one` says that ζ has order `−1` at `1`. The entry assigns it to §2.5, but §2.5 is about Laplace and Mellin adapters and never mentions ζ, and no other section uses that order either.
- The IEANTN entry says itself that no section cites it. Its subject (explicit bounds for π(x) and ψ(x), zero-free regions) has no counterpart in this roadmap.

A locator that points at no statement is a locator defect. The sources manifest also records neither work.

**Witness.**
- PNT+ line 110 (`meromorphicOrderAt riemannZeta 1 = -1`).
- README lines 1–1535: `meromorphicOrderAt_riemannZeta_one` occurs 0 times and `IEANTN` occurs 0 times. The only ζ facts used are `hasSum_zeta_two` (line 151) and values of `ζ(2)`.
- IEANTN lines 348–355 describe its subject.

**Repair.**
1. In the PNT+ entry, delete "and `meromorphicOrderAt_riemannZeta_one`" so that it ends "`Phi_analyticOnNhd`. Cited for §2.5."
2. Delete the IEANTN entry (lines 1563–1565).
3. Record PNT+ in the roadmap's sources manifest, with the revision URL and `cited_for = ["§2.5"]`. The manifest currently lists only GMR19, LAL89, LIV95, MN75, KLO19 and HEN95.
4. If the repair of R01 drops PNT+ altogether, delete the PNT+ entry as well.

Tested: after these deletions, every References key is cited in the body (occurrences in lines 1–1535: GMR19 51, Lalley 4, Liverani 3, Morris–Noussair 1, Kloeckner 3, Hennion 8, PNT+ 1).

## Previous findings

- None. The review of 08e41f3 raised no finding (verdict accepted), so there is nothing to account for.

## Verified sound

### Gate, elaboration, dependency direction

- **Worker's gate at 4820065:** `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`.
- **Gate re-run by this review** (`gate … --base origin/main`): the same counts, all 0, OK. This invocation reports no `build` field, so the build was checked by elaboration below.
- **Elaboration:** `lake env lean` on `TauCetiRoadmap/ProbabilisticAndMetricNumberTheoryPartII/Suggested.lean` exits 0. It gives 16 warnings, `declaration uses sorry`, one for each theorem (lines 100, 125, 140, 159, 176, 197, 220, 240, 250, 265, 283, 292, 306, 313, 323, 331), and 0 errors.
- **`Suggested.lean` unchanged:** `git diff --stat 08e41f3 HEAD` touches `README.md` only. The previous report's comparison of the 25 elaborated signatures with the README therefore stands, and so does its one-tactic padding probe, in which all 16 theorems failed to close. `signatures.md` reports 0 dropped section binders.
- **Dependency check:** `depcheck: 237 roadmaps, 2343 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. In the merge order, ProbabilisticAndMetricNumberTheory is line 60, ArithmeticDirichletSeriesPartII line 90 and this roadmap line 91.
- **Outside the folder:** `git diff --stat origin/main...HEAD` lists only the folder's `README.md` (+1608), `Suggested.lean` (+336) and `metadata.toml` (+1). The long outside-folder list in the change summary comes from merging main into the branch (05f144a), not from this pull request.

### The changed passages

- **PNT+ at revision `127b50e33f6033e2147921167a117af96d9ba4ea`:** I fetched the file through the sources service without touching the manifest (535 lines). `meromorphicOrderAt_riemannZeta_one` is at PNT+ line 110 and `Phi_analyticOnNhd` at line 320, with the statements quoted in R01 and R02. The file describes itself as helper lemmas for one explicit-formula proof (PNT+ lines 18–22).
- **PNT+ against the README bullet:** under PNT+'s bound, `|φ(y)| ≤ C e^{−(1+b)y}` for `y > 0` and `|φ(y)| ≤ C e^{by}` for `y < 0`. So `e^{−σy}|φ(y)|` is integrable exactly when `−(1+b) < σ < b`, and the README's local-uniform hypothesis holds on that strip. PNT+ is a true special case, with no contradiction; R01 concerns generality only.
- **Mathlib at the pin:** `mellin_differentiableAt_of_isBigO_rpow` (`Mathlib/Analysis/MellinTransform.lean` 401) takes `NormedSpace ℂ E`, `LocallyIntegrableOn f (Ioi 0)`, `f =O[atTop] (· ^ (-a))`, `f =O[𝓝[>] 0] (· ^ (-b))` and `b < s.re < a`. `mellinConvergent_of_isBigO_rpow` is at line 277 and `mellin_hasDerivAt_of_isBigO_rpow` at line 320. Mathlib has no bilateral Laplace transform (a grep for `bilateral` / `two-sided Laplace` finds nothing).
- **IEANTN:** `https://github.com/teorth/IEANTN` resolves (IEANTN line 348). Its subject is a graph of explicit analytic number theory claims, and the same page says it grew out of a PNT+ subproject (IEANTN line 434).
- **Sections depending on §2.5:**
  - §6.2 uses the zero-extension and Mellin bullets (text line 1227, *Needs:* line 1235).
  - §6.4 uses the one-sided transform on `Re s > a` (*Needs:* line 1290).
  - Neither depends on the changed locator.
- **Seeded sample:** none of the 15 sampled targets (0.1, 0.5, 1.1, 1.3, 1.4, 2.1, 2.2, 2.4, 3.1, 3.4, 3.5, 4.1, 4.2, 6.1, 7.2) lies in the changed passages or cites §2.5, so none was re-verified against its source this round. The previous report checked 1.3, 2.4, 3.1, 3.5, 4.2 and 7.2 at their locators. The adversarial rows below cover all 15.
- **Unverified flags:** the README flags no locator as unverified.
- **Overlaps:** `overlaps.md` lists no other pull request changing this roadmap, no id that another pull request drops, and no id defined only by an open revision.
- **Ownership of what the change touches:**
  - `roadmaps grep Phi_analyticOnNhd` finds only this README.
  - IEANTN is also cited, as an external source, by ZerosOfLFunctions, ArithmeticDirichletSeriesPartII and SieveMethodsAndPrimePatterns at their heads. That creates no ownership edge.
  - ArithmeticDirichletSeriesPartII §0.1 (at its open head) owns `HasLaplace` and its API but states no strip holomorphy, so the §2.5 bullet has no second owner.

### Remark on untouched text (no change requested)

- The GMR19 locator kept in §2.5 (GMR19 §4.1, (4.2)–(4.4)) concerns the one-sided transform of a function vanishing at negative times. The general strip bullet therefore had no source text before this change either; the repair of R01 supplies the pinned declaration for its power-bound case.

### Adversarial table

Rows for the changed statements, computed this round:

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §2.5 Holomorphy on strips, against the PNT+ locator | `f = e^{−|t|}`; PNT+ bound at `b = 0` and `b = 0.1`; `s = 1/2, −1/2, 0.9` | `2/(1 − s²)` = `8/3` at `±1/2` (quadrature `2.66667`), `10.526` at `0.9` (quadrature truncated at `|t| = 60`: `10.50`); ratio `1, 1` (`b = 0`) and `148, 2.2·10⁴` (`b = 0.1`) at `x = 50, 100`, so `b ≤ 0`; centre `(−(1+b) + b)/2 = −1/2` for every `b` | PNT+ covers `−1 < Re s < 0` only: R01 |
| §2.5 through Mathlib `mellin_differentiableAt_of_isBigO_rpow` | `g = min(u, 1/u)` | `O(u^{−1})` at `∞`, `O(u^{1})` at `0⁺`; `−1 < Re z < 1`, `z = −s` | full strip `−1 < Re s < 1`: repair of R01 |
| PNT+ hypotheses against the bullet's | general `φ` with PNT+'s bound | `|φ(y)| ≤ Ce^{−(1+b)y}` (`y > 0`), `Ce^{by}` (`y < 0`); integrable iff `−(1+b) < σ < b` | special case, consistent |
| PNT+ `meromorphicOrderAt_riemannZeta_one` against §2.5 | occurrences | PNT+ line 110: order `−1` at `1`; README body: 0 occurrences; ζ only via `hasSum_zeta_two` and `ζ(2)` | cites nothing: R02 |
| IEANTN entry | occurrences | README body: 0 | cites nothing: R02 |

Rows carried forward from the previous report (review of 08e41f3, adversarial table; the statements are untouched by the diff). The values are the ones recorded there; the rows marked "this round" were recomputed now.

| Statement | Instances | Values |
|---|---|---|
| `orderedSimplex d` (0.1) | `d = 1, 2, 0` | `[0, 1/2]`; `(1/2, 1/2)` excluded (`w₃ = 0`); one point |
| §0.5 C¹ calculus (this round) | `f = g = x` on `[0,1]`; `Φ(x) = 2x`, `[0, 1/2] → [0, 1]`, `f = x` | `‖fg‖_{C¹} = 1 + 2 = 3 ≤ 4`; `‖f∘Φ‖_{C¹} = 1 + 2 = 3 ≤ max(1, 2)·2 = 4` |
| §1.1 core and cusp (this round) | `n = 4`: `(1/5,1/5,3/5)`, `(0,0,1)`, `(0,1/2,1/2)` | `b = 2/5`, `1 − 2b = 1/5 = w₂`: both pieces, `w₃ = 3/5 = (1 + 1/5)/2`; `1 − 2b = 1 > 0 = w₂`: cusp only; `1 − 2b = 0 < 1/2`: core only |
| `branchDenom`, `branchMap` | `n = 4`, `w = (1/6,1/3,1/2)`, `(0,1)` | `q = 11/6`, `F = (2/11, 3/11, 6/11)` |
| `wordDelay`, `wordCount` | `w = (1/2,1/2)`, `r = log 2`; `r < 0`; `r = 0` | `N = 3`; `0`; `1` |
| `C1BoundedOn` | `f = 2x₀ + 3` on `[0, 1/2]` | least bound `6` |
| `eventual_contraction` (1.3) and §1.2 | single branch; blocks | `‖dγ₂‖₁ = 4/3`; `4/9`, `7/25`; `|det dγ₁| = 216/1331` |
| §1.4 attractor | `n = 3`, `u = [(0,1),(1,1)]` | fixed point `2 − √3 = 0.26795`; `x = 0` not coded |
| `transferOp` (2.1, 2.2) | `n = 3`, `s = 2`, `f = 1` | `ζ(2) − 1 = 0.6449`, upper `4(ζ(2) − 5/4) = 1.5797`; printed factor `2` gives `0.7899` |
| §2.4 derivatives | `w = (0,1)`, `s = 2` | `ζ′(2) = −0.9375`; `Σ(log k)²/k² = 1.9892` |
| `schauder_tychonoff` (3.1) | `C = ∅`; `[0,∞)` with `x + 1`; circle rotation | no fixed point in each negative control |
| `IsEigenprobability`, `eigenprobability_three` | `ν = 2dw₁`, `f = w₁²` | both sides `1/12`; `δ₀` fails (`F_A(0) = 1/(A+2)`) |
| `birkhoff_contraction` | `K = [[2,1],[1,2]]` | `log 4 = 1.3863`, `tanh(log4/4) = 1/3`, `0.2231 ≤ 0.2310` |
| §3.4 `χ` (this round) | `B₁ + ∅`, infinite dimension | `χ(B₁ + ∅) = χ(∅) = 0 ≠ 1 = χ(B₁)` |
| `hennion_essential_radius` (3.5) | `r ≥ ρ(T)`; `(1/2)id` on `ℂ` | vacuous; spectrum `{1/2}` |
| `ruelle_perron_frobenius` | `n = 3`, `σ = 2` | `λ = 1`, `∫h₂ dν₂ = 1.0000` |
| `simple_eigenvalue_analytic` (4.1, 4.2) | `T(z) = e^z`; Jordan block `[[0,1],[z,0]]` | `ev′(0) = 1`; normalised eigenform absent, `±√z` excluded |
| `uniform_ruelle_perron_frobenius` | `a > b` | vacuous; constants quantified before `σ` |
| `wielandt_separation` | constant delays | radius `λ_σ` at `tc ∈ 2πℤ` |
| `pressure_eigenvalue` | `n = 3`, `σ = 2` | `λ′₂ = −π²/(12 log 2) = −1.1866 ≤ −0.4055` |
| §6.1 bound | `w = (1/2,1/2)`, `r = log 2` | `N e^{−2r} = 3/4 > 6/π² = 0.6079` |
| `uniform_renewal_tauberian` | one point, `α = e^{at}` | `F = 1/(s − a)`, `B = 1` |
| `conformal_exponent` | `s ≤ 1` | impossible (native sum `0 = 1`) |
| `uniform_counting`, `counting_three` (7.2) | `R = 150`, `w₁ = 0, 1/4, 1/2` | `N = 6858, 9124, 13699` against `6839.2, 9118.9, 13678.4` |
| `conformal_exponent_pseries` | `n = 3, 4` | roots `1.72865`, `2.42411` enclose `2` |
| `conformal_exponent_mono` | `w = (1/3, 2/3)` | `q_{(A,1)} = 1 + (A+1)(2/3) = q_{(A,2)}(0, 1/3, 2/3)` |
| §§5.1–5.2, 7.1, 7.3, Lalley (7.7) | as recorded there | gaps `0.4002, 0.3134`; `64/81`; Rauzy matrices; `(1−λ)⁻¹h + h` against `(1−λ)⁻¹h` |

### Library declarations opened at the pins this round

- Mathlib `mellin_differentiableAt_of_isBigO_rpow` (`Mathlib/Analysis/MellinTransform.lean` 401), `mellinConvergent_of_isBigO_rpow` (277) and `mellin_hasDerivAt_of_isBigO_rpow` (320).
- `mellin` (91) and `MellinConvergent` (45), with variable block `[NormedAddCommGroup E] [NormedSpace ℂ E]` (42).
- `riemannZeta_residue_one` (`Mathlib/NumberTheory/LSeries/RiemannZeta.lean` 242).

## Not verifiable

- Nothing in the changed passages. The four items in the previous report concern untouched text and stand as recorded there.

## Source issues

- none
