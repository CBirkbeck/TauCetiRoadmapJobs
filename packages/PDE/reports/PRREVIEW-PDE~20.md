# Review of PDE (pull request #3027 at 18a262e)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 144 changed lines since `192ed92`. The pull request's own change to PDE is the two added sections, §3.2a (upper semicontinuous subharmonic functions) and §3.4a (the Riesz representation on balls and Hartogs' lemma), with their overview, contract, Examples, Dependencies and References lines; it is the text the previous review read, two overview sentences re-wrapped, on top of a newer `main`. The statements, routes and Checks were recomputed, the eight Demailly locators re-read, and the cited library names opened at the pins. No finding: accepted, with two small corrections (one in a proof route of §3.4a, one in untouched text for a separate pull request) and no format note. Nothing is left for a human to decide.

## C01 — The route of §3.4a (b) calls the set of points with means bounded below non-empty because of "a limit point of maximising points in `K`", which gives the bound only along a further subsequence

In the route of (b) (line 1841) the subsequence `u_{k_j}` is fixed by `sup_K u_{k_j} ≥ −c` alone. A limit point `w` of the maximising points `x_j ∈ K` has `x_j ∈ B(w, ρ/2)` only for infinitely many `j`, not all, so the argument as written bounds the means over `B(w, ρ)` along a sub-subsequence; an implementer following it literally is stuck at the indices whose maximising points lie elsewhere in `K`. The conclusion is true (for every `j`, the mean over `B(x_j, ρ)` is `≥ −c`, and the chain-of-balls step of the same paragraph carries the bound across the compact `K` with constants independent of `j`), so no statement is affected. The smallest repair: choose the subsequence so that the maximising points converge ("… and a subsequence `u_{k_j}` with points `x_j ∈ K`, `x_j → w`, `u_{k_j}(x_j) ≥ −c`"), which the closing sentence "the subsequence is chosen first" already suggests.

## C02 — Untouched text: `TauCetiRoadmap/PDE/README.md`, section "From Tau Ceti" and §§1.6, 5.4, cites four library names that the pinned libraries do not contain

The contract says its names are those of the pinned Tau Ceti revision `2fd255d` (line 288), but `TauCeti.sq_le_integral_Ioi_sq_add_deriv_sq` and `TauCeti.sq_le_integral_sq_add_deriv_sq` (line 359, and §1.6 at line 1020), `MeasureTheory.Lp.exists_w1p_value_eq_of_memSobolev_one` (line 386) and `TauCeti.PDE.exists_ae_value_le_add_mul_rpow_mul_sqrt_setIntegral_of_inv_add_eq_inv` (line 2449) occur nowhere in the pinned Tau Ceti or Mathlib sources, so a reader who searches for them finds nothing. The change neither touches nor relies on these passages; for a separate pull request: give the names the pin has, or say in prose what is cited.

## Previous findings

- No finding (P1 or P2) was open: the previous review accepted.
- C01 of the previous review (untouched text: the Tau Ceti contract named a revision that was not the pin) — partly repaired by the text of `main` this head contains: line 288 now reads "the Tau Ceti revision pinned by the content repository's `lake-manifest.json` (`2fd255d`)", which is the pin; the two absent names remain at lines 359 and 1020, in untouched text, and are in C02 above.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §3.2a mean and definition | `log|x|` on `|x| = r`; the `0`/`−∞` step function on a sphere centred on `|x| = 1`; `u ≡ −∞`; `n = 1` | `log r`; positive-measure arc at `−∞` gives `−∞ < 0`; `−∞ ≤ −∞`; `n = 1` two-point sphere `(0 + (−∞))/2 = −∞` | holds; third Check excludes the "send `−∞` to `0`" model | none |
| §3.2a (a) | `log|x|` in `ℝ²`; `−1/|x|` in `ℝ³`; `0`/`−∞` on two disjoint balls | sphere means `log r`, `−1/r`; ball means `log r − ½`, `−3/(2r)`; all increase, tend to `−∞ = u(0)`; disjoint case not `L¹_loc` | holds; connectedness needed | none |
| §3.2a route of (a), open-closed step | point where `u` is not integrable on any neighbourhood | mean over `B(x, r)` is `−∞`; for `y` near `x`, `u(y) ≤` mean over a ball `⊇ B(x, r)` `= −∞` | complement of the integrability set is open | none |
| §3.2a (b) | `|x|²` on the unit ball; `0`/`−1` on two balls; `u ≡ −∞` | supremum `1` not attained; attains `0`, not constant; constant | holds; Demailly 4.13 | none |
| §3.2a bullet | Demailly 4.12 d), e); `TauCeti.SubharmonicOn` | field is `∃ᶠ r in 𝓝[>] 0, u x ≤ ⨍ y in ball x r, u y`, with `ContinuousOn` | ball form along `r_ν → 0` matches | none |
| §3.4a (a), `n = 2` (seeded sample) | `log|x|`; `|x|²` | `0 − (2π)⁻¹ log(1/|x|)·2π = log|x|`; `P = 1`, `μ = 4dx`, potential `1 − |x|²`, gives `|x|²` | holds; sign opposite to Demailly's `G_r ≤ 0`, consistent | none |
| §3.4a (a), `n = 1` | `|x|` on `(−1, 1)` | `−G″ = δ₀` for `G = (1 − |x|)/2`; `1 − 2·(1 − |x|)/2 = |x|`; without `1/2`: `2|x| − 1` | holds | none |
| §3.4a mass bound | `log|x|`, `K = {0}`, radial `ψ` | `μ(K) = 2π = ∫uΔψ = 2πψ(0)` | holds; Demailly 4.21, proof | none |
| §3.4a route of (a) | `∫_B G_{a,R}(x, y) dx` as `y → ∂B`; vector-valued weak limit | `(R² − |y − a|²)/(2n) → 0`; bounded masses and uniform finite-rank approximation give norm convergence | sound | none |
| §3.4a (b) | `k·log|x|`; `(1/k)·log|x|`; `0, −1, 0, −2, …`; all `≡ −∞`; zeros interleaved with `≡ −∞` | `k log ρ → −∞`; `L¹` norm `∝ 1/k`, `u_k(0) = −∞ < 0`; zeros converge; first alternative; zeros converge | holds | none |
| §3.4a (b) `limsup` clause | `u_{k_j}(x) ≤` ball mean, `L¹_loc` limit, radius `→ 0` | `limsup ≤` mean of `u` over `B(x, r) → u(x)` by §3.2a (a) | holds | none |
| §3.4a route of (b) (C01) | maximising points alternating between two points of `K` | bound at `w` only for `j` with `x_j` near `w`; chain of balls gives `2ⁿ(−c − C)`-type bounds uniformly in `j` | conclusion true, justification short | C01 |
| §3.4a third Check | dense poles, `u_k = v/k` | `∫_D log(2/|x − q|) ≤ π log 2 + π/2 ≈ 3.75 ≤ 2π`; `u_k(q_m) = −∞`, limit `0` | true | none |

- Source locators checked against the text: 8, all in `demailly-agbook` Chapter I §4 (4.12 at line 1523, 4.13 at 1542, 4.14 at 1556, 4.17 at 1625, 4.18 at 1632, 4.19 at 1652, 4.21 at 1686 with the mass bound at 1690–1700, 4.22 a) at 1717; printed pages 33–37).
- Library declarations opened at the pins: `TauCeti.SubharmonicOn` (`Analysis/InnerProductSpace/Harmonic/Subharmonic.lean:74`), `SubharmonicOn.le_of_le_sphere` (`:189`), `ballGreenKernel`, `ballPoissonKernel` (`Analysis/PDE/GreenFunction/Ball.lean:266, 360`), `ballPoissonIntegral` (`Analysis/PDE/PoissonIntegral/Ball.lean:142`), `planarGreenKernelDisk` (`Analysis/PDE/GreenFunction/Disk.lean:35`); Mathlib `UpperSemicontinuous`, `EReal`, `MeasureTheory.LocallyIntegrableOn` at the three lines the README gives.
- Cross-roadmap citations resolved: the change cites only PDE's own §§3.1, 3.2a, 3.4; its consumers at this head, ComplexComparisonPartII (C5.4a onwards) and SingularHermitianMetricsAndL2Methods, cite §3.2a and §3.4a (a), (b) for what they state.
- Record of the README at the merge base: no `##` or `###` heading removed or retitled, two added (3.2a, 3.4a); the 4 deleted lines are extended in place.
- Dependency check: `depcheck: 125 roadmaps, 1417 edges, 0 problem(s)`; no UPWARD or CYCLE line. Automatic checks: all passed. No file outside the roadmap folders the pull request owns is changed.
- Elaboration: `lake env lean` on `TauCetiRoadmap/PDE/Suggested.lean` gives 17 warnings, all `declaration uses sorry`, no error. The pull request does not change `Suggested.lean` (0 declarations added, removed or restated against the merge base), so the `#check @name` comparison and the one-tactic probe were not run.
- Headline theorems: §§3.2a and 3.4a are supporting results for consumers, not headlines; `Suggested.lean` states neither, and an `EReal`-valued subharmonic carrier is not at the pins.
- The description's text on PDE ("PDE gains §3.2a … and §3.4a"; "None of PDE, … loses or renumbers a section or gains a supplier") agrees with the head.

Overlap check: read IncompressibleFluids, HamiltonJacobiAndConservationLaws, CompressibleEulerEquations, IncompressibleFlows, SchrodingerOperatorsAndSpectralTypes (open) and ComplexHessianEquations, YangMillsConnectionsAndCaloricGauge, SobolevPolynomialApproximation (main) for the objects of the change (upper semicontinuous subharmonic functions, Riesz measure, Hartogs' lemma); the list by results is empty; nothing shared. PDE is the only owner; ComplexComparisonPartII and SingularHermitianMetricsAndL2Methods cite it.

Source independence: changed passages only; 11 passages (both statements, the two routes of each section, the bullet, the Checks, the Examples sentence) compared with 1 source (`demailly-agbook` Ch. I §4), none shared beyond standard names and formulas; Hörmander could not be read; largest share of the README's citations Gilbarg–Trudinger (31 mentions; Evans 21, Stein 16); contents not compared (no layer added, removed or reordered).

Research link: Layers 3–5 are the classical elliptic theory of Gilbarg–Trudinger (1983). The added §§3.2a and 3.4a supply the subharmonic-function input (Demailly's book, Ch. I §4; Hörmander 1990, Theorem 4.1.9) to the pluripotential theory of ComplexComparisonPartII. Rests on the README's overview and references and on `demailly-agbook`.

## Not verifiable

- Hörmander, *The Analysis of Linear Partial Differential Operators I*, Theorem 4.1.9 (§3.4a (b)): a Springer book with no legal open copy and no text in the sources cache; the locator was not opened. The statement was checked by computation and its compactness half against Demailly 4.21.
- The seeded sample targets other than §3.4a (1.3, 1.4, 1.7, 3.2, 3.4, 4.2, 4.3, 4.6, 5.1, 5.4, 6.5, 6.6, 6.8, 8.3) lie in text the change neither touches nor affects, and are outside a review of the change.

## Source issues

- **Misprint** in demailly-agbook at Theorem 4.18, proof, printed page 35: the source derives the inequality between the mollification and the function from (4.19), a corollary stated after 4.18 and deduced from it; it should be formula (4.11) with the sub-mean-value inequality 4.12 b); affects nothing.

## For the human reviewers

- none
