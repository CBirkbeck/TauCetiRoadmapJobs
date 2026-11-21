# Review of LinearMultistepMethods (pull request #2859 at eff77dd)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every stated theorem, Check and route was recomputed (degenerate cases `k = 0`, `h = 0`, `α_k = 0`, `ρ = 0`, the zero space, `p = 0`; all printed numbers; the Adams and backward differentiation coefficients, orders and root moduli in exact arithmetic) and every locator into the two readable sources was read at its place; nothing false was found. There are two small corrections (two attributions to the sources) and two format notes, none blocking. For the humans: all locators point into two sets of lecture notes, and the refereed primary papers were not readable.

## C01 — Süli does not prove the sufficiency half of his Theorem 6; the sentence in the route of 2.1 reads as if he did

In the route of 2.1 (README lines 203–205) the text says "Süli proves sufficiency differently, through the boundedness of the coefficients of `1 / (ζ^k ρ(1/ζ))`". A reader who opens Theorem 6 finds the opposite: the sufficiency proof is declared long and technical and is omitted, with a pointer to Morton and Henrici (Suli2022 line 1197). What is true is that the bound on the homogeneous solutions, which is this roadmap's notion of zero-stability and not Süli's Definition 4 (Suli2022 line 1142), follows from his Lemma 1 and from Lemma 2 applied with all `β_(j,n) = 0` and `λ_n = 0` (Suli2022 lines 1506, 1530–1548; the lemma itself asks for a positive constant `β`, which may then be arbitrary).

The smallest change: "Süli omits the sufficiency proof of his Theorem 6; the bound on the solutions of the homogeneous recurrence follows from his Lemma 1 and from Lemma 2 with vanishing `β_(j,n)` and `λ_n`, through the boundedness of the coefficients of `1 / (ζ^k ρ(1/ζ))`."

## C02 — Mirzaei's Theorem 6.5 assumes `a_j ≥ 0` in his normalisation, which is `α_j/α_k ≤ 0` for `j < k` here, not `α_j ≥ 0`

In 3.2 (README line 338) the rate is attributed to "Mirzaei 2024, Theorem 6.5 under `α_j ≥ 0`". Mirzaei writes the method solved for the new value, `y_(k+1) = ∑ a_j y_(k−j) + h ∑ b_j f(…)` (Mirzaei2024 line 2453), and assumes `a_j ≥ 0` (Mirzaei2024 line 2514). In this roadmap's notation `a_j = −α_(k−1−j)/α_k`, so the condition is `α_j/α_k ≤ 0` for `j < k`. Read literally in the roadmap's notation, `α_j ≥ 0` for all `j` together with `∑ α_j = 0` gives `α = 0`, so the attribution describes no method at all.

The smallest change: "Mirzaei 2024, Theorem 6.5, under his sign condition `a_j ≥ 0` (here `α_j/α_k ≤ 0` for `j < k`)".

## N01 — The Layer 5 section comment of the Lean file has another title than the README's Layer 5

`Suggested.lean` line 218 reads "Layer 5: the barriers and linear stability"; the README heading is "Layer 5: the barriers and A-stability". Use one title.

## N02 — Three sentences describe how the text was prepared and will not age

In 4.2 (line 427), "no openly readable proof was available for this roadmap, so it is not a target here", and in the References (lines 723–724 and 728), "Attributed in prose; not opened". A reader next year needs only the scope: the instability of the formulas for `k ≥ 7` is Cryer's theorem and is outside this roadmap. It would also help to name it in the "Out of scope" paragraph of the scope section, where it is missing.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 methods, `ρ`, `σ`, residual | Euler `α=(−1,1)`, `β=(1,0)`; Simpson; BDF2 reversed | residual `Y₁−Y₀−h f₀`; `ρ=X²−1`, `σ=(X²+4X+1)/3`; root `1/3` ↔ `3` | agree | none |
| 1.2 defect bound | AB2, `y=e^t`, `h=0.1`; `k=0`, `α=(0)`, `β=(1)`; `h=0`; `p=0` | defect `4.5620e−4` vs bound `2.7482e−3`; `k=0`: defect `−h`, bound `0` (so `0<k` needed); `h=0`: `0 ≤ 0` | holds | none |
| 1.2 order-condition Checks | AB2 `q=3`; Simpson `q=5`; Euler `q=2`; `β=(2,0)` | `7−9/2=5/2`; `32−100/3=−4/3`; `1`; `ρ′(1)=1≠2` | agree | none |
| 1.3 `HasOrder p ↔ OrderConditions p` | `k=0` (`h` unbounded), `y=1` at `h=0`, `y=t^q` at `t=0`, zero method, `a>b` | `k=0,p=0`: defect `−hβ₀y′`, `C=‖β₀‖max‖y′‖`; `y=t^q`: `h^q(∑α j^q−q∑β j^(q−1))` | both directions hold | none |
| 2.1 root condition ↔ zero-stable | `ρ=0`; `α=(1,0,0)`; `(−1,1,0)`; `(−2,1,0)`; `(0,1)`; `k=0`; BDF2; `(X−1)²`; `X²+1` | `ρ=0`: both false; `(1,0,0)`: both true, `K=0`; BDF2 solution `3/2−(3/2)3^(−n)`, `K=3/2` suffices | iff holds without `α_k≠0` | none |
| 2.1 Süli Example 4 c) | `α=(−11,−27,27,11)`, `β=3(1,9,9,1)` | roots `1, −0.3189, −3.1356`; conditions hold `q≤6` (`9720=9720`), fail `q=7` (`27486≠27594`) | agrees | none |
| 2.2 discrete stability | route recomputed; `Λ<0`, `k=2`, `N=1`; implicit Euler `hL=1`; explicit Euler | `‖e_n‖ ≤ D_n + c∑_(i<n)‖e_i‖`, `c=2KLBh/‖α_k‖`; `n<k` uses `K≥1`; Checks: RHS `<0`, RHS `0` with `Y₁` free | holds; hypotheses needed | none |
| 3.1 Dahlquist equivalence | zero space; `k=0`; `a=b`; `N<k`; `α=(−1,1,0)`; `f=0`, `f=v` | `k=0`: `Y=0` vs `y=v`, both sides false; `f=v`: residual `(cρ′(1)−σ(1))hv`; cosine lemma: `1−s²/8 < 1−s²/4` false | iff holds as stated | none |
| 3.2 rate | `p=0`; `N<k`; `a=b`; AB2 on `y=t³`; Euler with offset `δ` | AB2 error `−(5/2)h³(n−1)`; `N<k`: error is a term of the sum, `C≥1`; `C=2Ke^(2KLB(b−a)/‖α_k‖)max(1,Mc_p(b−a)/‖α_k‖)` | holds | none |
| 4.1 Adams orders | `k=1..6` exactly from the Lagrange definitions | AB first failing values `1, 5/2, 9, 251/6`; AM `−1/2, −1, −19/6, −27/2`; `β` as printed | exact orders `k`, `k+1` | none |
| 4.2 BDF order, `ρ` formula, root condition | `k=1..9` exactly; roots numerically | failing value `−k!`; formula for `ρ` equal for all `k`; largest non-unit moduli `0.8634` (`k=6`), `1.0222`, `1.1839` | order `k`; root condition iff `k≤6` in range | none |
| 4.2 positivity route | `Re(g_k Q_k)` on the circle, `k=1..6` | minima `1, 1, 0.9896, 0.8141, 0.1856`; `k=6`: `−1.3711` (`g=1`), `0` at `c=−1` (`g=1+u`), `1.6470` (`g=5+4u`); `k=5` quartic matches at 5 points | as stated | none |
| 5.1 first barrier | `k=0`; Simpson; trapezoid; `α=(−33,−24,57,0)`, `β=(10,57,24,−1)`; Kaluza recurrence | `α_k=0` example: conditions hold `q≤5` (`1800=1800`), `ρ=3(X−1)(19X+11)`; series `1/2−z²/6−2z⁴/45`; weights `≥0` by log-convexity | holds; `α_k≠0` needed | none |
| 5.2 explicit ⇒ not A-stable | `k=0`; `α_k=0`; `σ=0`; `α=(−1/2,1)`, `β=0`; AB2 `μ=−1`; Simpson `μ=−1/2` | inconsistent example: `ρ−μσ=X−1/2`, A-stable; AB2: `(X+1)(X−1/2)`; Simpson: `7X²+4X−5`, root `−1.178` | holds; consistency needed | none |
| 5.2 second barrier | route recomputed: Cayley map, `ψ=σ/ρ−z/2`, shift by `ε`; `k=0`; `σ=0` | `1/log ζ = x/2 − 1/(6x) + …`; `ψ(x)=−1/(6x)+O(x⁻²)<0` against `Re ψ ≥ 0` | route sound | none |
| 5.3 `bdf 2` A-stable | `w=x+iy`, `‖w‖≤1`; BDF3 at `ζ=e^(iπ/3)`; trapezoid | `Re μ ≥ (1−x)² ≥ 0`; BDF3: `μ=−1/12+(3√3/4)i`; trapezoid root `(1+μ/2)/(1−μ/2)` | holds | none |
| README against Lean | all 31 elaborated signatures read against the prose | `IsConvergent` takes `E` explicitly; `E` and `k` binders present in every theorem; generality equal | agree | N01 only |

- Source locators checked against the text: 24 in Suli2022 ((37), Example 3, Section 3.1 with (40)–(42), Definition 4, Theorem 6, Example 4, (46), (47), Definitions 6, 7, 9–11, Theorems 7–10, 12, 16, Lemmas 1–3, Example 5, Section 4.2, Table 3) and 8 in Mirzaei2024 (Sections 6.1, 6.2, 6.3 with (6.3), (6.5)–(6.8), Theorems 6.3 and 6.5, Section 6.5); two attributions imprecise (C01, C02).
- Library declarations opened at the pinned Mathlib: 21, among them `taylor_mean_remainder_lagrange` (`Mathlib/Analysis/Calculus/Taylor.lean:330`), `exists_dual_vector` (`Mathlib/Analysis/Normed/Module/HahnBanach.lean:66`), `LinearRecurrence.solSpace_rank` (`Mathlib/Algebra/LinearRecurrence.lean:197`), `IsIntegralCurveOn` (`Mathlib/Analysis/ODE/Basic.lean:44`), `PhragmenLindelof.right_half_plane_of_bounded_on_real` (`Mathlib/Analysis/Complex/PhragmenLindelof.lean:717`), `Complex.norm_le_of_forall_mem_frontier_norm_le` (`Mathlib/Analysis/Complex/AbsMax.lean:404`), `Polynomial.coeff_eq_esymm_roots_of_card` (`Mathlib/RingTheory/Polynomial/Vieta.lean:116`); all exist with the stated content.
- Duplication by object: no linear multistep method, root condition, zero-stability, Adams or backward differentiation object in the pinned Mathlib or Tau Ceti, nor in any roadmap on main or open; the only library declaration named `residual` is the residual filter of a topological space, unrelated.
- Cross-roadmap citations resolved: 11 (OneStepMethodsForODEs Conventions, 1.2, 1.3, 1.5, 3.1, 3.3, 5.2; DiracScatteringAndNonlinearFourierTransform 1.7 on main; IterativeMethodsForLinearSystems 1.2; PolynomialInterpolationAndBestApproximation 1.1; the scope of ExponentialIntegrators); each says what is claimed of it.
- Overlap check: read OneStepMethodsForODEs, ExponentialIntegrators, PolynomialInterpolationAndBestApproximation, IterativeMethodsForLinearSystems; nothing shared. OneStepMethodsForODEs lists linear multistep methods, zero-stability and the Dahlquist barriers as outside its scope; its `ButcherTableau.stabilityRegion` (with `≤`, closed half-plane) is a different object from the region of 5.2, and the difference is stated on both sides.
- Supplier order: `depcheck: 172 roadmaps, 1999 edges, 0 problem(s)`; no UPWARD or CYCLE line. The one roadmap supplier that is not on main, OneStepMethodsForODEs, is a new roadmap in an open pull request and is named in the description; it is consumed for conventions and Checks only.
- Elaboration: `lake env lean` on `TauCetiRoadmap/LinearMultistepMethods/Suggested.lean` gives 14 `sorry` warnings and nothing else; a single `import Mathlib`, no `set_option`, no sorried data. One-tactic probe (`rfl`, `simp`, `simp_all`, `infer_instance`) on a scratch copy closes none of the 14 theorems. The automatic checks all passed. No change outside the roadmap folder.
- Headline theorems (order ↔ order conditions, defect bound, root condition ↔ zero-stability, discrete stability, Dahlquist's equivalence, the rate, Adams and BDF orders, BDF root condition for `k ≤ 6`, both barriers, explicit ⇒ not A-stable, `bdf 2` A-stable): all 14 stated in the Lean file. The pull request's title and description agree with the head (16 definitions, 1 structure, 14 theorems counted).

Source independence: 14 passages compared with 2 sources, none shared; largest share Suli2022, 25 of 32 locators; contents compared with Suli2022: independent (Layer 1 draws on its 3.3, Layer 2 on 3.2 and the lemmas of 3.4.2, Layer 4 on 3.1 and 4.2, Layer 5 on 3.5, 3.6 and 4.1; its 3.7 and 3.8 are not taken up; the order Layer 1 → 2 → 3 is forced by the *Needs* lines of 2.2 and 3.1).

Research link: The targets are the theorems of Dahlquist (1956, convergence equivalence and first barrier; 1963, A-stability and the second barrier) and the stability of the backward differentiation formulas (Cryer 1972; Hairer–Wanner 1983), the basis of stiff integration theory; this rests on the README's reference list and on Suli2022 Sections 3.4, 3.5 and 4.1.

## Not verifiable

- Dahlquist 1956 (Math. Scand. 4): the journal's landing page is on a host the sources service does not classify; not read. The README gives no locator into it.
- Dahlquist 1963, Cryer 1972, Wanner 2006 (BIT): paywalled publisher; not read. No locator into them; the attribution of the instability for `k ≥ 7` to Cryer and of the short proof to Hairer–Wanner was not checked against the papers.
- Hairer–Wanner 1983 (SIAM J. Numer. Anal.): the publisher refused access; not read.
- The claim in 3.1 that the equivalence also holds for Süli's pointwise notion of convergence is not a target and was not proved here; Suli2022 Theorems 7–10 state it.

## Source issues

- **Misprint** in Suli2022 at Example 3 c), printed page 22: the source says the Adams–Moulton formula has coefficient −9/24 on the oldest field value; it should be +1/24, since the four coefficients must sum to 1; affects nothing.
- **Misprint** in Suli2022 at the paragraph after Example 3, printed page 22: the source says the Adams–Bashforth family is implicit and the Adams–Moulton family explicit; it should be the reverse; affects nothing.
- **Error** in Suli2022 at Theorem 16 (i), printed page 55: the source says no explicit linear multistep method is A-stable; it should assume consistency (or `σ ≠ 0`): `y_(n+1) = y_n/2` meets the standing assumptions and is A-stable; affects a stated result.
- **Misprint** in Suli2022 at Example 5, printed page 40: the source says the left side of the third-order method is `y_(n+2) − (1+λ) + λ y_n`; it should be `y_(n+2) − (1+λ) y_(n+1) + λ y_n`; affects nothing.

## For the human reviewers

- Scope: all 32 source locators point into two sets of lecture notes (Suli2022, on the author's page; Mirzaei2024, arXiv). The refereed primaries in the References (Dahlquist 1956, 1963; Cryer 1972; Hairer–Wanner 1983) carry no locator and were not readable.
- Scope: no source that was read proves the second barrier (Suli2022 Theorem 16 states it without proof); the route in 5.2 is the roadmap's own. It was checked step by step in this review and found sound.
- Licence: Suli2022 was read from the author's university page; the file states no licence.
