# Review of SpatialPointProcessFoundations (pull request #3223 at 2ffc9e8)

**Verdict:** accepted

**Summary.** Accepted: both findings of the previous review are repaired (the zero–infinity law and its two negative controls now carry `d ≥ 1`; uniqueness of Palm kernels is stated on a Polish space with σ-finite intensity, with a route that works), and the repairs introduce no new defect; the two unused hypotheses are dropped and both questions are settled. There is one small correction (a docstring left behind by a repair) and one format note, neither blocking. No source text could be read, so every locator remains unverified; that, the overlap with the open PointProcesses roadmap and the local copies of library definitions newer than the pin are for the human reviewers.

## C01 — The docstring of the window form still says "disjoint" after the hypothesis was dropped

In `Suggested.lean`, lines 527–528, the docstring of `IsReducedPalmKernel.lintegral_factorialCountMoment` reads "satisfies the factorial-count-moment form on disjoint relatively compact windows", while the statement below it no longer assumes disjointness and the README (3.2, line 263) says "relatively compact windows, disjoint or not". A reader of the Lean file takes the statement to be narrower than it is. Drop "disjoint" from the docstring.

## N01 — One heading still reads as a status note

"Beyond this roadmap (a roadmap for a roadmap; do not implement)" (README, line 927) addresses the reader of the moment; "Beyond this roadmap" alone would do. The commit of the Tau Ceti library is now a reference entry, which is fine.

## Previous findings

- R01 — repaired: 7.2 "for `d ≥ 1`, a stationary point process has `P(0 < N(ℝ^d) < ∞) = 0`"; 8.2 "of finite intensity and `d ≥ 1`"; 8.3 "for `d ≥ 1` the law of `N` itself is not `P⁰`".
- R02 — repaired: "Under the hypotheses of the two existence bullets (a Polish space, σ-finite intensity), two Palm kernels of `N` agree for intensity-almost every `x`"; the counterexample is kept as a remark.
- C01 — repaired: the window form holds "on relatively compact windows, disjoint or not" and `hd` is gone; `IsMarking.intensity_eq` has no integer-valued hypothesis and 6.2 gives the route; the docstring lags (C01 above).
- N01 — partly repaired: "the Tau Ceti library [TC]" replaces the commit in the text; the heading of line 927 is unchanged (N01 above).
- Question on measurability along a random measure — settled: 4.1 and `aemeasurable_factorialMeasure` now assume σ-finite intensity, with a partition "fixed and independent of `ω`"; `IsMarking.factorialMomentMeasure_thinning` likewise.
- Question on the `w#`-topology — settled: "agrees with the vague topology when the metric makes bounded sets relatively compact".

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 1.2 `w#` against vague (changed sentence) | `ℝ` with `min(\|x−y\|, 1)`; a metric with compact closed balls | first: every set bounded, hypothesis fails, `δ_n → 0` vaguely only; second: test classes coincide | holds | none |
| 3.2 uniqueness (prose, changed) | `N = δ_U`; countable–co-countable `ℝ`, `N = ν` | `κ(x, L)` fixed a.e. by `C(B × L)` for countably many `L`; `δ_ν` vs `δ_{δ_x}`: `0` vs `1` on `{μ({x}) = 1}`, space not Polish | holds under the new hypotheses | none |
| 3.2 reduced uniqueness | `g = 1_B 1_L`; `N − δ_x ≤ N` | `∫_B κ(x, L) d intensity` fixed; reduced kernel carried by measures finite on `(Bₖ)` | holds | none |
| 3.2 window form without disjointness | `ξ = 3δ_a + δ_b`, `B = ({a,b}, {a})`, `c = (1, 2)`, `x = a`; `m = n = 0` | counts of `N − δ_a`: `(3, 2)`, product `6`, the definition at `g`; `𝔼N(A) = intensity(A)` | holds for overlapping windows | docstring, C01 |
| 4.1 `aemeasurable_factorialMeasure` (σ-finite intensity) | `∑_{q∈ℚ} δ_{q+U}`; `P = 0`; `2δ_a + δ_b` | intensity `∞·`Lebesgue, not σ-finite, excluded; trivially a.e. measurable; `μ⁽²⁾` mass `9 − 3 = 6`, a polynomial in finite counts | holds | none |
| 6.2 `IsMarking.intensity_eq` without integer values | `p = K(x, D_x) = 0.5`, `t = 0.7`; `N = ½δ_a`, Bernoulli`(½)` | `0.2517 ≤ −log(1 − 0.2517) = 0.2900 ≤ 0.35`; derivative at `0` of `((1+e^{-s})/2)^{1/2}`: `¼ = ½·½` | holds | none |
| 6.3 thinning, new hypothesis | retained intensity; `N = 2δ_a`, `p = 0.3` | `∫_A p d intensity ≤ intensity(A)`, σ-finite; `𝔼 M'^{(2)} = 2p² = 0.18` both | holds | none |
| 7.2 zero–infinity law with `d ≥ 1` | `d = 0`, `N = δ_0`; `d = 1`, `δ_U` on `[0,1]` | excluded now; not stationary (`P(N[0,1] = 1) = 1`, `P(N[1,2] = 1) = 0`) | holds | none |
| 8.2, 8.3 negative controls with `d ≥ 1` | stationary, finite `γ`, `d ≥ 1`; `d = 0` | `𝔼N({0}) = γ·\|{0}\| = 0`; excluded | hold | none |

The rows for the untouched statements stand as in the previous review, of `83b48de`.

- Source locators checked against the text: 0 (no source text could be read; one more request for LP found no legal copy).
- Library declarations opened at the pin: `Measure.lintegral_bind`, `Measure.bind`, `Measure.compProd` through the file's `#check` lines; the local `IsIntegerValued`, `markExponent`, `IsMarking`, `IsReducedPalmKernel` and `factorialMeasure` read in `Suggested.lean` (lines 70, 684, 690, 361, 410).
- Cross-roadmap citations: none in the changed passages; the tools report none unresolved and no overlap change.
- Dependency check: `depcheck: 94 roadmaps, 1055 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with exit 0 and 57 `sorry` warnings, nothing else; no `set_option`, no sorry'd data, `import Mathlib` and one Tau Ceti module.
- `#check @name` on the four changed theorems: each signature carries its binders (`[SigmaFinite (intensity P N)]`, `[MeasurableSpace.CountablyGenerated X]`, `[SFinite (intensity P N)]`) and agrees with its README statement.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp_all`) on the four changed theorems: none closes.
- No change outside the roadmap folder. The description agrees with the head (57 `sorry`, one proved sanity check, both suppliers on main); the change since the previous head alters nothing it states.

Overlap check: read PointProcesses (open), ShotNoiseAndCampbellTheorem (open), LevyProcesses (open), MarkovChainsAndRenewal, DimerModelsAndLozengeTilings, PoissonApproximation (main), as in the previous review; the change adds no object. PointProcesses plans the same substrate (its Layers 0–4 and 6–8) and is on the project's list of roadmaps not to be cited as suppliers, so this roadmap is the owner here and the question goes to the human reviewers; nothing else is shared.

Source independence: changed passages only; 0 passages compared with 0 sources (no source text could be read); largest share LP, 84 of 212 locators; no layer added, removed or reordered, so the comparison of contents with LP's chapter list stands: independent.

Research link: The README places the roadmap as the common base of determinantal, Gibbs, Cox and cluster processes, random closed sets and tessellations, with the Mecke equation, Palm kernels and the refined Campbell theorem as in Last–Penrose (2018), Kallenberg (2017) and Baccelli–Błaszczyszyn–Karray (2024). This rests on the README only.

## Not verifiable

- The locators of the changed passages ([DVJ2, Proposition 9.1.IV(i), p. 6]; [LP, Proposition 4.3, p. 29; Proposition 5.5, p. 42; Proposition 8.4, p. 71]; [BBK, Proposition 2.3.24, p. 62]) and of the sampled targets: no legal copy of LP, BBK, K, DVJ1, DVJ2, CSKM or SW could be read. The mathematics was checked independently; theorem numbers and pages were not.
- The claims about the Tau Ceti library beyond the pin (reference [TC], commit `d395922`) and about the lean-MSSS repository.

Automatic checks set aside as false positives: the four hits on a dropped roadmap name are a directory name inside file paths of an external repository in the Prior formalization section, not a citation of that roadmap; the section comment of `Suggested.lean` reported as having no declaration under it is followed by the `#check` lines that pin the consumed library declarations.

## Source issues

- none

## For the human reviewers

- **Scope / ownership.** The open roadmap PointProcesses plans the same substrate (its Layers 0–4 and 6–8); the description says this roadmap covers that part so the spatial family need not wait. Which of the two owns it is settled in neither text.
- **Library newer than the pin.** `Suggested.lean` lines 62–156 copy eight definitions of a Tau Ceti commit newer than the pin; by the README (Prior formalization) that commit already proves about ten targets of Layers 2, 5 and 6. Not checked beyond the pin.
- **Not tested.** LP has the largest share of locators (84 of 212); neither its text nor any other source was read, so wording was not compared; only its chapter list was.
- **Licence.** BBK is cited as a 2024 manuscript (README, References), not a published book; 49 locators rest on it.
- **Reuse.** The README says lean-MSSS (Apache-2.0, by the roadmap's author) proves several targets; whether `Suggested.lean` adapts its declarations was not checked.
