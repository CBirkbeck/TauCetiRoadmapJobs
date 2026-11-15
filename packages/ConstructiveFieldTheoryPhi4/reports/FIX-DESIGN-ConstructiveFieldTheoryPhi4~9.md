# FIX-DESIGN-ConstructiveFieldTheoryPhi4~9

The review REV-DESIGN-ConstructiveFieldTheoryPhi4~8 has one finding, F01 (P2). I verified it against the cached sources and repaired it. I did not act on the review's "For the human reviewers" section (uncertified texts, the licence of `frohlich-1982`, the scope of the downstream goals): it lists no finding.

## F01 (P2) — applied

**Verified.** 8.1 and 8.2 covered every convergent scheme of 7.2, with any `J_n ≥ 0`. The cited results do not go that far:

- `aizenman-duminilcopin-2021 lines 127–128`: the d > 4 no-go results concern scaling limits "at β ≤ β_c".
- `lines 323–326` (Proposition 1.4): β ≤ β_c, L ≤ ξ(β).
- `lines 1438–1442` (Section 6): the proofs are for the side β ≤ β_c.
- `lines 2007` and `2015` (Theorem 7.1, Proposition 7.2): β ≤ β_c(ρ), L ≤ ξ(ρ, β).
- `frohlich-1982 lines 84–85` and `115`: the d ≥ 4 inequality (13) is stated under `M_{β,a} ≡ 0`. Line 84 says M² is the long-range order. This is a third occurrence of the same restriction, which the review did not name.

The theorem that the README attributes to the sources is therefore wider than the theorem they prove.

**Change (old → new).**

- 8.1, old: "Every 𝒞-reachable random field that has …". New: "Every random field reachable from 𝒞 by a convergent scheme of 7.2 with `J_n ≤ β_c(ρ_n, J^{nn})` for every n, where β_c is the critical point of 4.3 …, and that has …". After the locators, a new sentence says that the cited estimates are proved for β ≤ β_c and L ≤ ξ(β), and that couplings above β_c are excluded.
- 8.2: the same change.
- The framing paragraph now names "Layers 0, 2, 4, 6 and 7".
- Plan 8.1 and 8.2: the hypothesis was added and `target:4.3` was added to their prerequisites.

**What goes beyond the suggested text.**

1. The review's added sentence mentions the condition L ≤ ξ(β) but does not say who handles larger scales. I did not add L_n ≤ ξ as a hypothesis, for three reasons:
   - the source states Theorem 1.2 for every reachable field and says its proofs cover the whole side β ≤ β_c (`lines 1441–1442`);
   - this roadmap defines no correlation length;
   - narrowing the statement below the source is not allowed.

   Instead the README says plainly that scales L_n beyond the correlation length are part of the statement, and that ConstructiveFieldTheoryPhi4PartII owns their treatment.
2. I added the Fröhlich long-range-order locator (lines 84–85, 115) to the d ≥ 5 citation.
3. β_c is well defined here:
   - 4.3 requires ρ to be even and admissible. Every member of 𝒞 is even and admissible: for 8.1 by 0.2; for 8.2 by the API bullet of 2.2.
   - 4.3's β_c is the susceptibility threshold. If χ < ∞, the two-point function is summable, so there is no long-range order. Hence 4.3's β_c is at most the transition point used by the source. If the two ever differed, the new hypothesis would be the stronger one, so it can only be on the safe side.

**Pattern sweep.**

- Both goal statements, every Check of 8.1 and 8.2, the plan statements, hypotheses, locators and tests of both goals, and the framing paragraph were updated.
- The 7.4 Check that calls the d = 4 free field "a non-vacuous instance of the field hypotheses of downstream goal 8.1" refers only to the field hypotheses (d ≥ 4, S₂ satisfying (1.10)), which did not change. It is left as it is.
- The Summary, Scope and Downstream-consumers paragraphs state no hypotheses for 8.1 and 8.2. The Downstream-consumers paragraph already lists the critical point (Layer 4) as consumed.
- Proposition 1.4 is newly cited, so it was added to the reference line of `aizenman-duminilcopin-2021` in the README and to that entry's `locator` in `sources.toml`.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 8.1 coupling hypothesis, d = 1 telegraph (dimension Check) | ρ_I, `tanh J_n = e^{−c/L_n}` | `χ(ρ_I, βJ^{nn}) = (1 + tanh β)/(1 − tanh β) = e^{2β}`, finite for every β (7.389 at β = 1), so `β_c(ρ_I, J^{nn}) = ∞ > J_n` | the counterexample satisfies the new hypothesis, so it still shows that d ≥ 4 is needed | Check reworded |
| 8.1, white noise | J_n = 0 | `χ(ρ, 0) = ∫φ² < ∞`, so `β_c ≥ 0 = J_n` | still a valid Check; the hypothesis holds | Check reworded |
| 8.1, critical schemes (new Check) | `J_n = β_c(ρ_I, J^{nn})`; strict-inequality variant | the non-strict inequality admits J_n = β_c; ξ(β_c) = ∞ for Ising (`lines 250–252`), so every L_n ≤ ξ; source `lines 259–260` place critical Ising limits inside Theorem 1.2 | the plausible wrong model `J_n < β_c` would drop the main instance | Check added |
| 8.1, equivalent forms of the hypothesis | `1 ≤ β_c(ρ_n, J_nJ^{nn})` against `J_n ≤ β_c(ρ_n, J^{nn})` | `β_c(ρ, aJ) = β_c(ρ, J)/a` for a > 0; at J_n = 0, `β_c(ρ, 0) = ∞` | the two forms agree, including J_n = 0 | none |
| 8.1, d = 4 Gaussian free field (recomputed) | `|b_n| = 4 + m²/(2L_n²)`, J_n = 1; m = 1 with L = 10; m = 0 | `χ(β) = 1/(2(|b_n| − 4β))`; at β = 1 this is `L²/m²` = 100; critical coupling `|b_n|/4 = 1 + m²/(8L²)` = 1.00125 > 1; at m = 0 the critical coupling is 1 = J_n. Cross-check by the Neumann series: `(1/(2|b|))Σ_k(dβ/|b|)^k = 1/(2(|b| − dβ))`; and `Σ_x G_μ(x) = 1/(E(0) + μ²) = 1/μ²` with μ = m/L | the Gaussian analogue of the hypothesis holds (strictly for m > 0, with equality for m = 0); 4.3 does not apply to the non-admissible γ_b, and the Check says so | Check rewritten |
| 8.2 implies 8.1 | 𝒞₈.₁ ⊂ Griffiths–Simon class; the same scheme | the condition `J_n ≤ β_c(ρ_n, J^{nn})` depends only on (ρ_n, J_n), not on 𝒞 | the implication survives the new hypothesis | Check reworded |
| 8.2, δ₀ (new Check) | 𝒞 = {δ₀} | 4.3 Check: S ≡ 0, χ = 0, `β_c = ∞`; 7.2 Check: the field is zero; `S₂ ≡ 0` gives `lim S₂ = 0`, so (1.10) holds; Dirac laws are Gaussian at the pin (`Mathlib/Probability/Distributions/Gaussian/Basic.lean:112`, `IsGaussian (Measure.dirac x)`; `Real.lean:227`, `gaussianReal_zero_var`) | a degenerate instance consistent with 8.2 | Check added |
| 8.2, context | members of the class | 2.2 API: every member is even (weak closure of negation invariance) and admissible (`cφ² − |φ|^α` bounded above for α > 2) | 4.3's standing hypotheses hold, so β_c is defined | parenthesis added |
| 8.1 and 8.2, scale regime | β ≤ β_c, L ≫ ξ | Proposition 1.4 at scale L′ = ξ with g(u) = f(uξ/L) gives an error of order `(L/ξ)^{12}(log ξ)^{−c}`, which is not small when L/ξ is large | not covered by the cited estimate alone; recorded in the README as part of PartII's proof, not added as a hypothesis (reasons under F01) | sentence added |

## Checks run

Dependency check (`gate --candidate … --only ConstructiveFieldTheoryPhi4`), run after all edits:

```text
candidate: ConstructiveFieldTheoryPhi4 is not in the merge order yet; checked as if placed after RelativisticQuantumFieldTheory (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2236 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The two extra edges, compared with the review's run, are the new internal prerequisites `target:4.3` of 8.1 and 8.2.

Citation resolution (`roadmaps resolve` on the README): no cross-roadmap citation and no Lean name is found nowhere.

`Suggested.lean`: the design stage has no Lean file, so there was no `#check` scratch file and no elaboration to run. Elaboration was not run.

Ownership: no new construction was introduced. `roadmaps grep -i 'marginal triviality|ConstructiveFieldTheoryPhi4'` matches nothing on main or at any open head outside this package. The goals stay assigned to ConstructiveFieldTheoryPhi4PartII.

Sources: no new source was fetched and `needs-references.toml` was not written. The only manifest change is the added "Proposition 1.4" in the `locator` of `aizenman-duminilcopin-2021`.

## For the maintainer

- The ids 8.1 and 8.2 and every section id are unchanged, and no other roadmap cites them. No name that another roadmap cites has changed.
- When ConstructiveFieldTheoryPhi4PartII is written, it must state 8.1 and 8.2 with the coupling hypothesis `J_n ≤ β_c(ρ_n, J^{nn})`. It must also supply the regime of scales beyond the correlation length, which the cited Propositions 1.4 and 7.2 (L ≤ ξ) do not cover alone.
