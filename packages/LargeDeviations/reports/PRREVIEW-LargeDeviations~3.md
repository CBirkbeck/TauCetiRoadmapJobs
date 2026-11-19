# Review of LargeDeviations (pull request #2499 at deea490)

**Verdict:** needs changes

**Summary.** Changes are needed, for one reason, repaired by one phrase and one binder. The new Conventions paragraph on measurable open sets exempts the moment condition of 2.2, and that statement is false under the same trivial σ-algebra the paragraph uses against 2.1; its Lean form, which assumes neither measurability nor continuity of `φ`, is false with it. The rest of the previous review is repaired: both Checks, the route of 4.3, the Checks of 3.2, the description and the citation of ConvexAnalysisAndDuality §4.3. There are no small corrections and no format notes; two points remain for the human reviewers.

## R01 (P2) — The moment condition of 2.2 fails without measurability, and the new Conventions paragraph exempts it

The paragraph "Measurable open sets" (README line 108) assumes measurable open sets "in 2.1–2.5 (except the moment condition of 2.2)", and `tendsto_limsup_log_setLIntegral_exp_of_moment` (`Suggested.lean` line 216) accordingly takes an arbitrary `φ : X → ℝ` on an arbitrary measurable structure. An implementer therefore has a false target.

The paragraph's own example refutes it. Take `X = ℝ` with the trivial σ-algebra, `μₙ = δ₀`, speed `n + 1`, `φ x = |x|`, `γ = 2`. A lower integral is the infimum of the integrand, so `∫⁻ exp (2(n+1)|x|) dδ₀ = 1` and the hypothesis reads `limsup = 0 < ⊤`. For every `M` the set `{M ≤ φ}` is nonempty and not measurable, its outer measure is `1`, and the restriction of `δ₀` to it is `δ₀` again (a measure on the trivial σ-algebra is its value on the whole space, and `Measure.restrict_apply` gives that value as the outer measure of the set). So `∫⁻_{φ ≥ M} exp ((n+1)|x|) dδ₀ = 1`, the inner `limsup` is `0` for every `M`, and the limit in `M` is `0`, not `⊥`. The step of the proof route that breaks is the pointwise bound on `{φ ≥ M}`: integrating it needs the majorant `exp (a n γ φ)` to be measurable (Mathlib `setLIntegral_mono`, `Mathlib/MeasureTheory/Integral/Lebesgue/Basic.lean` line 248) or the set to be (`setLIntegral_mono'`, line 256).

The smallest change: delete "(except the moment condition of 2.2)" from the paragraph, and give the Lean theorem `(hφ : Measurable φ)`, which is all that route needs, or `[OpensMeasurableSpace X]` with `(hφ : Continuous φ)` to match the tail form beside it.

## Previous findings

- R01 — repaired: "since the open set `(1/2, 3/2)` has measure `0` and the lower bound there would read `0 ≤ ⊥`" (line 345); "fails the upper bound on the closed set `[1, 2]`" with mass `0.102416` (line 702). Both recomputed.
- R02 — partly repaired: the Conventions now assume `OpensMeasurableSpace X` in "Polish forces tightness", 2.1–2.5 and the inverse contraction, with the counterexample to 2.1; the exception "(except the moment condition of 2.2)" is false. Written again as R01.
- C01 — repaired: the route of 4.3 now uses "the Markov step of the route of 4.2, which needs no integrability", and the *Needs* line names it (lines 662–665, 673).
- C02 — repaired: "at any speed tending to `∞`" in both Checks of 3.2 (lines 571, 577).
- C03 — repaired: the description lists OptimalTransport §13.13 under "Downstream".
- N01 — repaired: "owned by ConvexAnalysisAndDuality §4.3" in 5.3 (line 781) and in the docstring of `IsEssentiallySmoothSteep`; that section defines `IsEssentiallySmooth` at the roadmap's open head.
- N02 — not repaired, and dropped: 169 `Suggested.lean` files on main open with `module` and `public import` lines, so the header is a form in use.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conventions, measurable open sets: counterexample to 2.1 | `ℝ`, trivial σ-algebra, `δ₀`, `F j x = j x`, `K = {0}` | `∫⁻ = inf = 0` for `j ≠ 0`, so `Λ j = ⊥`; left `log 1 = 0`, right `-(0 - ⊥) = ⊥` | true as written |
| Conventions, scope of the assumption | binders of each Lean theorem of 1.5, 2.1–2.5, 3.1–3.3, 4–6 | `OpensMeasurableSpace` on lines 165, 188, 199, 204, 227, 232, 241, 269; `BorelSpace` in 3.2, 3.3, 4.4, 5, 6; none on line 216 | matches Lean; exception R01 |
| 2.2 moment condition | same space, `φ = |x|`, `γ = 2`; `φ` measurable | hypothesis `0 < ⊤`; `∫⁻_{φ ≥ M} = 1`, inner `limsup = 0` for all `M`; with measurable `φ`: `≤ -(γ-1) M + C` | false as stated: R01 |
| 1.1 Check, `δ₀` with rate `0` | `(1/2, 3/2)`; closed sets | lower `0 ≤ ⊥` fails; every upper bound `≤ 0` holds | true |
| 4.1 Check, Cauchy with `cgf` | `[1, 2]` | `(1.107149 - 0.785398)/π = 0.102416`; `limsup = 0`, right `⊥` | true |
| 4.3 route, non-integrable laws | mean `-∞`; mean `+∞`; undefined | `E X⁻ = ∞` gives `Λ = ⊤` on `(-∞, 0)`, transform `= sup_{λ ≥ 0}`, nondecreasing; mirror; both `⊤`, rate `0`, `λ = 0` gives `≤ 0` | sound |
| 3.2 Checks | `a n → ∞`; `a n = -1` | eventually `a n > 0`, `(a n)⁻¹ · ⊥ = ⊥`; `(-1) · ⊥ = ⊤` excluded by the new wording | true |
| 5.3 citation | ConvexAnalysisAndDuality §4.3 at its open head | heading "Functions of Legendre type", `IsEssentiallySmooth` and the steep equivalence there | resolves |

The rows for the untouched statements stand as in the previous review, of `34e511e`.

- Library declarations opened at the pin: `Mathlib/MeasureTheory/Measure/Restrict.lean` 75 (`restrict_apply`, no measurability of the restricting set); `Mathlib/MeasureTheory/Integral/Lebesgue/Basic.lean` 239, 248, 256.
- Cross-roadmap citations resolved: ConvexAnalysisAndDuality §4.3 (open head). It is named as the owner of another notion, not as a supplier.
- Dependency check: `depcheck: 200 roadmaps, 2190 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration of `Suggested.lean`: 36 `sorry` warnings, no error, no other warning; the new `#check @OpensMeasurableSpace` resolves. 36 theorems, as the description says.
- The diff changes no Lean statement, so the one-tactic probe and the comparison of elaborated types stand as in the previous review.
- Pull request text read against this head: no sentence contradicted.

Overlap check: read ConvexAnalysisAndDuality (essential smoothness: owner ConvexAnalysisAndDuality §4.3, the steep predicate here), MathematicalStatisticsHigherOrderAndResampling, OptimalTransport (§13.13 Schilder, owner OptimalTransport), as in the previous review; the change adds no object; nothing else shared.

Source independence: changed passages only: 6 passages compared with 1 source (AGZ Appendix D, which treats none of their topics), none shared; largest share DemboZeitouni, 55 of about 115 locators, text and contents not readable; the diff adds, removes or reorders no layer.

Research link: the headlines are the theorems of Cramér, Gärtner–Ellis, Sanov, Varadhan, Bryc and Dawson–Gärtner as in Dembo–Zeitouni (1998); RandomMatrices §§9.2–9.5 (Anderson–Guionnet–Zeitouni 2009) and OptimalTransport §13.13 (Schilder) are stated in this framework. Rests on the README's Downstream consumers and on AGZ Appendix D, read.

## Not verifiable

- Dembo–Zeitouni, Lemma 2.2.5(b), cited in the changed route of 4.3 for the monotonicity of the transform: recorded as paywalled, not read; the monotonicity was recomputed instead.
- The other locators into Dembo–Zeitouni, Kallenberg, Klenke, Ellis and Dupuis–Ellis, including those of the sampled targets: unverified, as in the previous review; the diff changes none of them.

Automatic checks set aside as false positives: the rule against a section comment with no declaration under it flagged the last heading of `Suggested.lean`; that heading introduces the `#check` lines that pin library declarations, which the form rules allow.

## Source issues

- none

## For the human reviewers

- Licence: the README's "Prior formalization" names three files of lean-CKMA (stated there as Apache 2.0) as design ideas; that repository was not read, so `Suggested.lean` was not compared with it.
- Not tested: DemboZeitouni carries 55 of about 115 locators and could not be read legally; wording and arrangement were not checked against its text.
