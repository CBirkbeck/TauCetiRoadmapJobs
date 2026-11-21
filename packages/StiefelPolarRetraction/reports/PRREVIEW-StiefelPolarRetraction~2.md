# Review of StiefelPolarRetraction (pull request #2815 at 65e5fe1)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review, the false reason for leaving out the quintic Newton–Schulz step, is repaired, and the replacement sentence was recomputed and is true. The small correction and the two format notes of that review are repaired as well, and the 19 changed lines introduce no new problem; there are no small corrections and no format notes. R.-C. Li's report still could not be read from a legal place, so its locators remain unverified; that, its hosting and the status of the Su–Huang preprint are left to the human reviewers.

## Previous findings

- R01 — repaired: "the quintic Newton–Schulz step, which SpectralSteepestDescent 4.2 treats on `(0, 1]`; at `X + Z` it maps singular values above `1` to values above `1`, so its iterates leave `B`" (README lines 577–579).
- C01 — repaired: "owns the Sylvester bounds (Part B, SSP-B09)" in the scope section (line 557) and "Part B, SSP-B09: the interval/exterior Sylvester bound" in the supplier contract (line 655); no "2.9" remains.
- N01 — repaired: "gradient descent with `η` times the smoothness constant at most `1`" (lines 554–555).
- N02 — repaired: "`Mathlib/Analysis/Matrix/Spectrum.lean`: `Matrix.IsHermitian.eigenvalues`" on its own line (line 599).

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| Scope, quintic sentence (changed; was R01) | `q(t) = (15t − 10t³ + 3t⁵)/8` at `t = 1, 1.0001, 1.2, 1.5, 1.7, 3`; `q' = 15(1 − t²)²/8 ≥ 0` | `1 − q(t) = (1−t)³(3t²+9t+8)/8 < 0` for `t > 1`; values `1, 1.0000000000025, 1.02312, 1.44140625, 2.3707, 63`, all `> 1` when `t > 1` | true: for `Z ≠ 0` the largest singular value `√(1+s₁²) > 1` stays above `1`, so every iterate has operator norm `> 1` | none |
| Scope, "SpectralSteepestDescent 4.2 treats on `(0, 1]`" | that roadmap's 4.2 at its open head | 4.2: "For `s ∈ (0, 1]`, `q^[k] s → 1`", no claim outside the interval | citation matches | none |
| Scope, FirstOrderOptimization 2.1 paraphrase (changed) | that roadmap's 2.1 at its open head | 2.1: `K`-smooth, `η K ≤ 1`, `Σ_{i<k} ‖∇f x_i‖² ≤ 2 (f x₀ − m)/η` | paraphrase agrees | none |
| Supplier contract, SSP-B09 (changed) | SpectralSubspacePerturbation on main | id `SSP-B09 — Interval/exterior Sylvester bound` present (README line 231) | resolves | none |
| From Mathlib, `Matrix.IsHermitian.eigenvalues` (changed) | pinned Mathlib | declared in `Mathlib/Analysis/Matrix/Spectrum.lean:67`; `instContinuousFunctionalCalculus` in `HermitianFunctionalCalculus.lean:98` | both file attributions correct | none |

The rows for the untouched statements (1.1–1.3, 2.1–2.5, 3.1, 3.2, 4.1, 4.2, 5.1–5.4) stand as in the previous review, of `6e228cc`: the diff changes no stated target and no Lean statement, and none of the seeded sample's targets lies in a changed passage.

- Changed passages reviewed: 4 (quintic sentence, FirstOrderOptimization paraphrase, two SSP-B09 citations, the Mathlib file line); `Suggested.lean` unchanged since `6e228cc`; no file changed outside the folder.
- Library declarations opened at the pin: 2 (`Matrix.IsHermitian.eigenvalues`, `Spectrum.lean:67`; `Matrix.IsHermitian.instContinuousFunctionalCalculus`, `HermitianFunctionalCalculus.lean:98`).
- Cross-roadmap citations resolved again: SpectralSteepestDescent 4.2 and 4.3 and FirstOrderOptimization 2.1 at their open heads; SpectralSubspacePerturbation SSP-B09 on main.
- Source locators: none in the changed passages; no source in the cache mentions the quintic step, so the new sentence is the roadmap's own.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed on this head. Elaboration of `Suggested.lean`: 12 `sorry` warnings, nothing else.
- Pull request's title and description read against this head: no sentence contradicted (the description cites `SSP-B09` without "2.9", and lists the quintic step as out of scope without giving a reason); the change since `6e228cc` alters nothing they describe.
- Overlap check: read SpectralSteepestDescent, ManifoldOptimization, FirstOrderOptimization, Majorization, SpectralSubspacePerturbation, PolarDecomposition; nothing shared (as in the previous review; the change touches no ownership statement beyond dropping the "2.9" alias).

Source independence: changed passages only; 4 passages compared with 3 sources (Boumal2023, BoumalAbsilCartis2019, SuHuang2026), none shared; largest share Li1994, 8 of 22 locators, whose text and contents could not be read; arrangement not compared again (no layer added, removed or reordered).

Research link: Layer 3 makes explicit the pullback constant of Boumal–Absil–Cartis (2019), Lemma 4, for the polar retraction; Layer 2 states R.-C. Li's bounds (1994/1995); Layer 5 analyses the iteration of Su–Huang (2026) with a fixed step. Rests on the README's scope section and on BoumalAbsilCartis2019 and SuHuang2026 as read.

## Not verifiable

- Li1994 (R.-C. Li, UCB/CSD-94-852; SIAM J. Matrix Anal. Appl. 16 (1995)): Lemma 1, (12)–(20), Theorems 1–3, Remarks 1–2, pp. 3–6, cited in 2.1–2.4. Unchanged from the previous review: the report's host is in no licence class of the sources service and the journal version is behind a paywall; the statements were recomputed, the attribution of constants and equation numbers to Li was not checked.

## Source issues

- **Error** in SuHuang2026 at §7, (70), p. 33: the source says the defect after one Newton–Schulz step is strictly below the squared defect whenever the defect is below 1; it should be non-strict, or exclude the case of orthonormal columns, where both sides are 0; affects nothing.

## For the human reviewers

- Licence: Li's report UCB/CSD-94-852 is cited from the Berkeley EECS technical-report pages, a host the sources service places in no licence class; its text was not read (README, References).
- Not tested: Li1994 has the largest share of the locators (8 of 22); wording and arrangement were not compared with it. Sections 2.1–2.4 cite its Theorems 1, 2, 3 and Remark 2 in that order.
- Scope: the main source of Layer 5, Su–Huang arXiv:2608.22774v1 (August 2026), is an unrefereed preprint; the README says of 3.1, 4.2 and 5.3 that no source states them.
