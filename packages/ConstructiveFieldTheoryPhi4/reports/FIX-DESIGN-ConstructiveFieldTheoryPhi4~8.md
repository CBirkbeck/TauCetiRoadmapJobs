# FIX-DESIGN-ConstructiveFieldTheoryPhi4~8

Findings of REV-DESIGN-ConstructiveFieldTheoryPhi4~7: two, both P3, both verified and repaired. The review's "For the human reviewers" section (uncertified texts, the licence of `frohlich-1982`, the scope of the downstream goals) lists no finding and was not acted on.

## F01 (P3) — applied

Verified: the `*Needs:*` line of 0.1 (`packages/ConstructiveFieldTheoryPhi4/design/README.md`, section 0.1) names Mathlib `MeasureTheory.Measure.map` (used for the images under φ ↦ sφ in the closure bullet), and the line of 0.2 names `MeasureTheory.ProbabilityMeasure` (used for the weak limit `ρ_{λ,2λ} → ρ_I`). Plan targets 0.1, 0.2 and 0.2.1 lacked them. Both names exist at the pinned Mathlib: `Mathlib/MeasureTheory/Measure/Map.lean:96` (`def map`) and `Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean:103` (`def ProbabilityMeasure`), and both are already in the README's Mathlib supplier contract (lines 47 and 53) and in Layer 0's Dependencies.

Change: plan 0.1 prerequisites gain `mathlib:MeasureTheory.Measure.map`; plan 0.2 prerequisites gain `mathlib:MeasureTheory.ProbabilityMeasure`. README unchanged.

Pattern sweep: a script compared every README `*Needs:*` line of each `### k.n` section with the union of the prerequisites of the plan targets of that section (k.n and k.n.m). After the repair, no Mathlib or Tau Ceti name is listed on one side only. The script also flagged five sections (2.1, 6.1, 6.3, 6.4, 7.4) where a roadmap supplier appeared only in the plan. Each is a false positive: the README line names the supplier in plain text rather than in backticks (2.1: ZerosOfLFunctions §5.5; 6.1 and 6.3: StochasticCalculus §1.1; 6.4: StandardDistributions §5.3; 7.4: RelativisticQuantumFieldTheory §7.1), and I read each line to confirm.

## F02 (P3) — applied differently

Verified: "retain identifiers 8.1 and 8.2" tells the reader about an earlier numbering, and "The base completion ends at Layer 7" is a milestone phrase. Both break the timeless rule.

Change: the paragraph before 8.1 now reads: "This roadmap ends with Layer 7. The two statements below, numbered 8.1 and 8.2, are the goals of ConstructiveFieldTheoryPhi4PartII, stated with their sources so that the hypotheses Layers 0, 2, 6 and 7 must serve are visible; they are not targets of this roadmap." This departs from the suggested text in one place: it adds Layer 0. The class 𝒞 of 8.1 consists of the φ⁴ measures `ρ_{λ,b}` and the Ising measure ρ_I, which are defined in 0.2, and plan 8.1 lists `target:0.2` among its prerequisites.

Pattern sweep: the README has no other occurrence of "retain", "base", "earlier", "previous", "former", "removed", "renumber" or "completion"; "still holds" at line 473 is a mathematical statement. In the plan, the ownership notes of downstream goals 8.1 and 8.2 said "not a base acceptance target". Both now say "not a target of this roadmap", the same wording as the README.

## Adversarial pass on the changed text

No mathematical statement, hypothesis, Check or worked example changed. The changes are two prerequisite entries and one framing paragraph. Rows for the facts the new entries and wording depend on:

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1: admissibility preserved under the image by φ ↦ sφ (`Measure.map`) | ρ = δ₁, s = ½, c = 2; s = 0 | `∫e^{cφ²} d(map (s·) δ₁) = e^{cs²} = e^{0.5} = 1.6487 < ∞`; at s = 0 the image is δ₀ with integral 1 | sound; `map` is the right carrier (Mathlib's `map` of an a.e.-measurable map, here continuous) | prerequisite added |
| 0.2: `ρ_{λ,2λ} → ρ_I` weakly (`ProbabilityMeasure` topology) | λ = 1, 10, 100, by quadrature on [−6, 6] | `∫φ² dρ_{λ,2λ}` = 0.8327, 0.9725, 0.9975; `∫φ⁴` = 1.0827, 0.9975, 1.0000; both tend to `∫φ² dρ_I = ∫φ⁴ dρ_I = 1` | sound; second and fourth moments converge, as weak convergence together with the uniform `e^{cφ²}` bound requires | prerequisite added |
| Framing: 8.1 and 8.2 use Layers 0, 2, 6, 7 | 8.1's 𝒞; 8.2's 𝒞; the field hypotheses | 8.1: 𝒞 ⊂ 0.2 (Layer 0), reachability 7.2, S₂ from 6.2, Gaussian process 6.3; 8.2: 𝒞 = class of 2.2 (Layer 2); plan prerequisites of 8.1 are {0.2, 6.2, 6.3, 7.2} and of 8.2 are {2.2, 6.2, 6.3, 7.2} | the layer list {0, 2, 6, 7} equals the union of the layers of both prerequisite lists; without 0 it would miss 8.1's class | wording fixed |

## Checks run

Dependency check (`gate --candidate … --only ConstructiveFieldTheoryPhi4`), after the edits:

```text
candidate: ConstructiveFieldTheoryPhi4 is not in the merge order yet; checked as if placed after RelativisticQuantumFieldTheory (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2232 edges, 0 problem(s)
```

The output has no UPWARD, CYCLE or `moved:` line.

Other checks:
- `design/plan.json` parses as JSON after the edits.
- **No Lean check was possible.** The design stage has no `Suggested.lean`, so there was nothing to elaborate and no `#check` scratch file was written.
- **Ownership was not re-checked.** No new construction, carrier or target was introduced, and the suppliers and their sections are unchanged.
- **No new sources.** No source was fetched or added, `sources.toml` is unchanged, and no `needs-references.toml` was written.

## For the maintainer

- No name or id that another roadmap could cite changed. The ids 8.1 and 8.2 and every section number stay the same.
- Files changed: `packages/ConstructiveFieldTheoryPhi4/design/README.md` (one paragraph before 8.1) and `packages/ConstructiveFieldTheoryPhi4/design/plan.json` (prerequisites of 0.1 and 0.2, and the ownership notes of downstream goals 8.1 and 8.2).
- No suspicious instructions were found in the review text.
