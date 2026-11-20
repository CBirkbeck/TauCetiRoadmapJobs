# Review of LargeDeviations (pull request #2499 at 63f97fb)

**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 26 lines changed since `deea490` finds the one outstanding finding repaired and no new defect. The moment condition of 2.2 now assumes a measurable `φ` in the README and in `Suggested.lean`, the Conventions paragraph says so and carries the counterexample for a non-measurable `φ`, and the statement was recomputed as true under the new hypothesis. There are no small corrections and no format notes; two points remain for the human reviewers.

## Previous findings

- R01 — repaired: "except that the moment condition of 2.2 asks instead for a measurable `φ`" (README line 109); "for a measurable `φ`, if for some `γ > 1`" (line 412); `(hφ : Measurable φ)` in `Suggested.lean` line 217. Recomputed below.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 2.2 moment condition, `tendsto_limsup_log_setLIntegral_exp_of_moment`, with `Measurable φ` | general `μₙ`, `a n > 0`; `∫⁻ exp(a n γ φ) = ⊤` for finitely many `n`; empty `X` | on `{φ ≥ M}`: `a n φ ≤ a n γ φ - (γ-1) a n M`; `limsup ≤ -(γ-1)M + C`, `C < ⊤` from the hypothesis; empty: `⊥ → ⊥` | true |
| Same statement without measurability (the Conventions' new counterexample) | `ℝ`, trivial σ-algebra, `δ₀`, `φ = |x|`, `γ = 2` | full integral `= inf = 1`, hypothesis `0 < ⊤`; restriction of `δ₀` to `{φ ≥ M}` is `δ₀`, set integral `1`, limit `0 ≠ ⊥` | counterexample true as written |
| Conventions, scope of `OpensMeasurableSpace X` against the Lean binders | theorems of 2.2 | lines 199 and 204 carry `[OpensMeasurableSpace X]`; line 216 carries `Measurable φ` and no instance | README equals Lean |
| 2.2 proof route, moment step | majorant `exp(-(γ-1) a n M) exp(a n γ φ)` | measurable when `φ` is, so the set-integral comparison applies; `a n > 0` eventually from `a → ∞` | sound |
| Check of 2.3 citing the moment form (line 487) | `φ x = x` on Borel `ℝ` | `φ` continuous, hence measurable; new hypothesis met | still true |

The rows for the untouched statements stand as in the previous review, of `deea490`.

- Library declarations opened at the pin: `Mathlib/MeasureTheory/Integral/Lebesgue/Basic.lean` 248 (`setLIntegral_mono`, measurable majorant) and 256 (`setLIntegral_mono'`, measurable set).
- Elaborated type of the changed theorem compared with the README statement: `Measurable φ` present, no section binder lost (the statement needs only the topology-free measurable structure).
- Elaboration of `Suggested.lean`: 36 `sorry` warnings, no error, no other warning; 36 theorems, as the description says.
- Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- The one-tactic probe stands as in the previous review; the changed statement gained a hypothesis and is not closed by unfolding.
- Pull request text read against this head: no sentence contradicted; the change adds a hypothesis to one statement and alters nothing the description lists.
- Source locators: the diff changes none; the sampled targets fall outside the changed passages.

Overlap check: read ConvexAnalysisAndDuality (essential smoothness: owner ConvexAnalysisAndDuality §4.3, the steep predicate here), MathematicalStatisticsHigherOrderAndResampling, OptimalTransport (§13.13 Schilder, owner OptimalTransport), as in the previous review; the change adds no object; nothing else shared.

Source independence: changed passages only: 3 passages compared with 1 source (AGZ Appendix D, which treats none of their topics), none shared; largest share DemboZeitouni, 55 of about 115 locators, text and contents not readable; the diff adds, removes or reorders no layer.

Research link: the headlines are the theorems of Cramér, Gärtner–Ellis, Sanov, Varadhan, Bryc and Dawson–Gärtner as in Dembo–Zeitouni (1998); RandomMatrices §§9.2–9.5 (Anderson–Guionnet–Zeitouni 2009) and OptimalTransport §13.13 (Schilder) are stated in this framework. Rests on the README's Downstream consumers and on AGZ Appendix D, read.

## Not verifiable

- Dembo–Zeitouni, (4.3.3), p. 137, cited for the moment condition: recorded as paywalled, not read; the statement was recomputed from its proof route instead. The source's theorem is for continuous `φ`, which the measurable hypothesis covers on spaces with measurable open sets.
- The other locators into Dembo–Zeitouni, Kallenberg, Klenke, Ellis and Dupuis–Ellis, including those of the sampled targets: unverified, as in the previous reviews; the diff changes none of them.

Automatic checks set aside as false positives: the rule against a section comment with no declaration under it flagged the last heading of `Suggested.lean`; that heading introduces the `#check` lines that pin library declarations, which the form rules allow.

## Source issues

- none

## For the human reviewers

- Licence: the README's "Prior formalization" names three files of lean-CKMA (stated there as Apache 2.0) as design ideas; that repository was not read, so `Suggested.lean` was not compared with it.
- Not tested: DemboZeitouni carries 55 of about 115 locators and could not be read legally; wording and arrangement were not checked against its text.
