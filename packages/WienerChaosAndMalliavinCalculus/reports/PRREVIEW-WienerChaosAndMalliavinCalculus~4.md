# Review of WienerChaosAndMalliavinCalculus (pull request #2972 at 9b20328)

**Verdict:** accepted

**Summary.** Accepted: the format note of the previous review is repaired, and the 68 changed lines (the wording "real inner product space" for `H`, links to three roadmaps, re-wrapped lines) introduce no false statement; the existence theorem of §1.1, whose prose now matches its Lean signature, holds without completeness. There are two format notes, neither blocking. As before, none of the five cited books could be read legally, so no locator was checked against its text; that is left to the human reviewers.

## N01 — One sentence of the scope still says "every real Hilbert space"

In "Scope and ownership", item 1 of "Completion means" (README line 703) reads "Isonormal processes on every real Hilbert space", while the summary, the Conventions, §1.1 and the Lean docstring now say "real inner product space". The sentence is true but narrower than the target it summarises; "every real inner product space" would agree with them.

## N02 — "(on main)" survives in one place

The change removed "(on main)" from the two bullets of the overview, but the supplier contract "From other roadmaps" (README line 772) still reads "StochasticCalculus … (on main):". It describes the state of the repository rather than the mathematics; the link alone would do, as in the overview.

## Previous findings

- N01 — repaired: `Suggested.lean` line 18 now reads "`H` is a real inner product space and `W : H → Ω → ℝ` an isonormal Gaussian process", in agreement with lines 26–29 and with the README's Conventions.

(The previous report had no finding and no small correction.)

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 `exists_isIsonormal`, prose now "every real inner product space" | H = c₀₀ ⊂ ℓ² (incomplete); H = 0; H = ℝ | Restriction of an isonormal W on ℓ² to c₀₀: centred Gaussian family, E[W(h)W(g)] = ⟪h, g⟫. H = 0: W(0) = 0, variance 0 = ‖0‖². H = ℝ: W(h) = hZ, E = h·g | true; prose equals the signature (no `CompleteSpace`) |
| Summary: "complete wherever the derivative and the divergence enter" | sections `Derivative`, `Divergence`; Layer 6 | `[CompleteSpace H]` in scope there, as recorded for `cec201e`; Layers 1–2 signatures carry only `InnerProductSpace ℝ H` (lines 58, 83) | agrees with the Lean |
| Links added: StochasticCalculus, RandomMatrices, BooleanFunctionAnalysis | folder on main for each | all three folders exist on main with a `README.md`; the cited ids §§1.2–1.3, Layer 3, §6.1, Layer 8, §2.2 are untouched by the change | resolve |

The rows for the untouched statements stand as in the previous review, of `cec201e`.

- Source locators checked against the text: 0. The changed passage of §1.1 keeps its locators (Nualart, Remark 3, p. 4; Nourdin–Peccati, Proposition 2.1.1; Da Prato, Propositions 2.18–2.20); none of these texts is readable, and no sampled section falls in a changed passage.
- Elaboration of `Suggested.lean`: no error, 45 `sorry` warnings and nothing else but the output of the `#check` lines; no `set_option`; imports `Mathlib` and one `TauCeti` module. The diff changes docstrings only, no signature, so the `#check @name` comparison and the one-tactic probe of the previous review stand.
- Dependency check: `depcheck: 106 roadmaps, 1217 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Cross-roadmap citations resolved in the changed passages: 3 links (above); SteinsMethodForNormalApproximation and OrnsteinUhlenbeckSemigroup are open new roadmaps, named for what they own and not consumed.
- Open roadmaps citing this one: MalliavinSteinAndFourthMoment (open) cites §§1.1, 3.1, 3.3, 4.1–4.4, 5.1, 6.1–6.4; all of these sections exist at this head with their subjects, and the change renumbers nothing.
- Pull request text against the head: "real inner product space (complete for the statements about the derivative and the divergence)" agrees with the summary and the Conventions; 45 theorems and 45 `sorry`; imports and suppliers as described. Nothing to correct.
- No line of either file exceeds 100 characters.

Overlap check: read MalliavinSteinAndFourthMoment (open), OrnsteinUhlenbeckSemigroup (open), StochasticCalculus, RandomMatrices and YoungIntegrationAndRoughPaths (main). MalliavinSteinAndFourthMoment owns the Stein bounds, the fourth moment theorem and the symmetrized contraction, and consumes this roadmap's isonormal processes, chaos, multiple integrals, contractions, D, δ, the semigroup and L⁻¹ ("this roadmap owns none of them", "Nothing passes back"): owner of those objects is this roadmap. Finite-dimensional Mehler kernel, generator and Nelson: OrnsteinUhlenbeckSemigroup. Finite-dimensional Poincaré and logarithmic Sobolev: RandomMatrices §2.2. Brownian exponential density and grid Hermite basis: StochasticCalculus §6.1. Nothing has two owners.

Source independence: changed passages only; 5 passages compared (the summary sentence, the first summary bullet, the existence item of §1.1, the scope bullet on StochasticCalculus, the docstring paragraph) with 0 sources, since none of the five cited texts could be read; the changes are a change of one term and of links. Largest share Nualart 2006, about half of the locators; contents not compared, its table of contents could not be opened. No layer was added, removed or reordered.

Research link: Layers 4–6 are the prerequisites of the Malliavin–Stein method of Nourdin–Peccati (2012): the total-variation bound through ⟪DF, −DL⁻¹F⟫ and the fourth moment theorem; also of the Bouleau–Hirsch criterion and Hörmander's theorem (Nualart 2006, §§2.1, 2.3). Rests on the README's "Downstream consumers" and "Beyond this roadmap".

## Not verifiable

- Nualart 2006, Nourdin–Peccati 2012, Nualart–Nualart 2018, Bogachev 1998, Da Prato 2014: no legal copy readable (paywalled publishers; none in the sources cache), so the sampled locators of §§1.2–7.3 remain unchecked against the texts.
- Wording and arrangement against the sources: not checked, for the same reason.

Automatic checks set aside as false positives: the section comment at the end of `Suggested.lean` with no declaration under it introduces the `#check` lines that pin library names, which is an allowed use.

## Source issues

- none

## For the human reviewers

- Not tested: Nualart 2006 carries about half of the README's locators; neither its text nor its table of contents could be read, so wording and arrangement were not compared with it.
- Not tested: none of the five cited books (README "References") was readable from a legal place; every locator is unverified.
