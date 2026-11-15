# FIX-DESIGN-HyperbolicDynamicsAndThermodynamicFormalism~12

One review (REV-DESIGN-HyperbolicDynamicsAndThermodynamicFormalism~11) with two findings, both P3 locator findings. Files changed: `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/README.md`, `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`, `packages/HyperbolicDynamicsAndThermodynamicFormalism/sources.toml` (only the TsujiiZhang2023 entry's `locator` and `cited_for`). No source was fetched and no new work is cited. No mathematical statement changed.

## F01 (P3) — applied

Verified at the source. BowenRuelle1975 line 165 (footnote 2, attached to the mixing subshift of line 141) defines mixing of a homeomorphism F. BCS2022 lines 43–44 define it for a diffeomorphism f. Neither mentions flows, and BowenRuelle1975 defines mixing nowhere else (a search of the text finds lines 141–156 and 165 only). TsujiiZhang2023 line 125 (Theorem 1.1(1)) and line 156 (Theorem 1.2) use topological mixing of an Anosov flow as a hypothesis.

§2.1: "(BowenRuelle1975, line 165, footnote 2; BCS2022, lines 43–44)" → "(the continuous-time form of the notion for homeomorphisms of BowenRuelle1975, line 165, footnote 2, and for diffeomorphisms of BCS2022, lines 43–44; it is the hypothesis on Anosov flows in TsujiiZhang2023, Theorem 1.1, line 125, and Theorem 1.2, line 156)". This is the review's wording with "for diffeomorphisms" added so that each source is matched to its own setting.

Plan 2.1 `where` → "line 165, footnote 2 (homeomorphisms); BCS2022 lines 43-44 (diffeomorphisms); TsujiiZhang2023 lines 125, 156 (flows)".

Other places that cite the same passages:
- The References entry for TsujiiZhang2023 now lists "Theorems 1.1 and 1.2". In `sources.toml`, its `locator` is now "Theorem 1.1; Theorem 1.2; Definition 3.5" and its `cited_for` gains "2.1".
- The References entry for BCS2022 ("Topological mixing (lines 43–44)") and the BowenRuelle1975 entry were already correct and are unchanged.

## F02 (P3) — applied

Verified at the source:
- BowenRuelle1975 lines 190–199 cover the time-one case: P(F, φ) = P(f¹, Φ) with Φ the time-one average (lines 191–192), ∫φ dμ = ∫Φ dμ for μ ∈ M(F) (line 192), and the pressure as a supremum over M(F) (lines 193–199).
- Lines 213–222 are Proposition 3.1(a)–(d), which is about special flows over subshifts and has nothing to do with time-t maps.
- Remark 4.5 (lines 409–413) is the rescaling of time.
- TsujiiZhang2023 lines 106–109 only name ν_{g,F}.

§4.1: "(BowenRuelle1975, lines 190–192 for t = 1, lines 213–219 and 409–413; TsujiiZhang2023, lines 106–109)" → "(BowenRuelle1975, lines 190–199, for the time-one map: P_g(F) = P_{g^1}(F_1), ∫F dμ = ∫F_1 dμ for μ ∈ M(g), and P_g(F) as the supremum of the free energy over M(g); Remark 4.5, lines 409–413, for the rescaling of time)".

This applies the review's repair in the README's own notation (g is the flow, F the potential, F_1 the time-one average of the Conventions), not the source's (F the flow, φ the potential), so that the parenthesis is consistent with the bullets it introduces.

Plan 4.1 `where` → "lines 190-199 (t = 1); Remark 4.5, lines 409-413 (rescaling)". In `sources.toml`, TsujiiZhang2023 `cited_for` loses "4.1".

The same citations elsewhere were checked and are correct:
- §10.3 keeps "Proposition 3.1, lines 213–222" and "TsujiiZhang2023, lines 106–109". There Bowen–Ruelle derive Theorem 3.3 (lines 272–277) from Proposition 3.1 through the symbolic coding, and the TsujiiZhang lines give the consumers' form of ν_{g,F}. The review says these belong there. Plan 10.3 is unchanged.
- The Conventions cite BowenRuelle1975 lines 191–192 for F_1, which is correct.
- §11.1 cites Remark 4.5, lines 409–413, for the change of metric, which is correct.

## Adversarial pass on the changed text

Only locators changed. Each row checks the passage against the statement it is now attached to.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.1 definition against BowenRuelle1975 line 165 (U ∩ FⁿV ≠ ∅ for large n) | swap the roles of U and V; restrict to the times t ∈ ℕ | Swapping the names gives Fⁿ(U) ∩ V ≠ ∅ for large n, which is §2.1's condition at the integer times for the time-one map. For a flow, mixing at all t ≥ t₀ implies it at all n ≥ ⌈t₀⌉, so g¹ is mixing (§2.1, third API item). | consistent: "continuous-time form" is accurate | locator reworded |
| §2.1 against BCS2022 lines 43–44 (fⁿ(U) ∩ V ≠ ∅ for large n) | f a diffeomorphism | Same condition as ours at integer times, with nothing about flows. | consistent | locator reworded |
| §2.1 against TsujiiZhang2023 lines 125, 156 | g a C^∞ Anosov flow on a 3-manifold | Topological mixing of the flow is a hypothesis there and is not defined. The suspension in §9.2(a) is transitive and not mixing, so it is excluded by that hypothesis, as §2.1 Check 3 computes (meetings only near 1/2 + ℤ). | consistent: "the hypothesis on Anosov flows" | new locator |
| §4.1 first item against lines 190–192 at t = 1 | F = c on the roof-one suspension of the full two-shift | F_1 = c, and P_{g¹}(c) = h_top(g¹) + c = log 2 + c = P_g(c), matching the source's P(F, φ) = P(f¹, Φ) | Pass | none |
| §4.1 second item against lines 193–199 | μ ∈ M(g), t = 1 | The free energy for (g¹, F_1) is hμ(g¹) + ∫F_1 dμ = hμ(g¹) + ∫F dμ (line 192). The supremum over M(g) ⊆ M(g¹) equals P_g(F) (line 199). | Pass | none |
| §4.1 rescaling against Remark 4.5, lines 409–410 | t′ = t/t₀, so g_a with a = t₀ = 2; suspension, F = 1 | g_a¹ = g², so hμ is multiplied by 2 and the potential becomes 2F. P_{g_2}(2) = 2 log 2 + 2 = 2(log 2 + 1) = 2P_g(1), which is §4.1 Check 1. | Pass | none |
| Proposition 3.1 (lines 213–222) no longer cited by §4.1 | read (a)–(d) | uniqueness, the product form, ergodicity, and the Gibbs bound for the special flow G on Λ(A, ψ), with no statement about time-t maps or rescaling | correct removal | removed from §4.1 and plan 4.1 |

No Check or worked example uses the changed parentheses, so nothing needed recomputing. §2.1 Checks 1–3 and §4.1 Checks 1–5 were reread against the reworded parentheses and agree.

## Checks run

Dependency check:

    candidate: HyperbolicDynamicsAndThermodynamicFormalism is not in the merge order yet; checked as if placed after ArithmeticDynamics (the intake inserts it when its design is accepted)
    depcheck: 246 roadmaps, 2245 edges, 0 problem(s)

There is no UPWARD or CYCLE line.

`plan.json` parses as JSON and `sources.toml` parses as TOML after the edits.

There is no `Suggested.lean` at the design stage, so the `#check` elaboration comparison does not apply and nothing was elaborated.

No gate failures were listed for this round.

## Notes for the maintainer

- **No changes visible to other roadmaps.** No id, section, heading or Lean name changed, so no roadmap that cites this one is affected. No ownership question arises, because no construction was added.
- **The overlap lead on GeneralizedCohomology §G4.0b is refuted.** The lead says only an open revision defines it. In fact the content repository's main (1a19c9f) states G4.0b at `TauCetiRoadmap/GeneralizedCohomology/README.md` line 1082 ("G4.0b: construct smooth real manifold structures on the same finite carriers …"). This roadmap's citation (§11.2 and the supplier contracts) therefore needs no open pull request. The review reached the same conclusion.
- **The review's "For the human reviewers" item was not acted on, as instructed.** It notes that ClassicalErgodicTheory is an open pull request outside the merge-order file.
