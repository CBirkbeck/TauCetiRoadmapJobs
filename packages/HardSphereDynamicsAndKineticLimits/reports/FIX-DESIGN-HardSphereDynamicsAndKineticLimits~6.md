# Repair of HardSphereDynamicsAndKineticLimits (design, round 6)

This round settles the one finding of `REV-DESIGN-HardSphereDynamicsAndKineticLimits~5`, F01 (P3). I checked it against the README's own `*Needs:*` lines and against §3.5 of ClassicalErgodicTheory at the head of its open pull request. The finding is right. It is applied as asked, and the same omission is repaired in the other layers where it occurs (details below). Only `packages/HardSphereDynamicsAndKineticLimits/design/README.md` was edited. `plan.json` has no layer-level dependency field and needed no change. `sources.toml` was not touched.

## F01 (P3) — applied

The `### Dependencies` lines of Layers 7, 8 and 9 now name the roadmap supplier, item by item:

- Layer 7: "Layers 5–6." → "Layers 5–6; …; ClassicalErgodicTheory §3.5 (items 1 and 3)."
- Layer 8: "Layer 7." → "Layer 7; …; ClassicalErgodicTheory §3.5 (item 4)."
- Layer 9: "Layers 7–8." → "Layers 7–8; …; ClassicalErgodicTheory §3.5 (item 3)."

The same omission for Mathlib and Tau Ceti is repaired in Layers 3, 4, 7, 8, 9 and 10 (below).

## Evidence and the repaired pattern

- **The claim holds.** Four `*Needs:*` lines cite ClassicalErgodicTheory §3.5: §7.2 (item 1), §7.5 (item 3), §8.1 (item 4) and §9.4 (item 3). The Dependencies lines of Layers 7–9 listed internal layers only. No internal layer depends on §3.5, so the transitive reading does not cover it either. Layers 1 and 2 say "Mathlib only", so these lines are meant to cover external suppliers too.
- **The supplier text, read this round.** I read ClassicalErgodicTheory at the head of its open pull request (an open pull request by another author that adds a new roadmap folder), §3.5 "Flows defined almost everywhere":
  - item 1 is conull flows and their identity extension;
  - item 3 is disjoint unions, including "a measure on the union is invariant iff each component restriction is";
  - item 4 is the transport of densities, `(Φ t)_* ν = μ.withDensity (W ∘ Φ (-t))`.

  The item numbers in the new lines match these.
- **The same pattern elsewhere.** The defect is "a layer's Dependencies line leaves out an external supplier that its sections' `*Needs:*` lines name". It also affected Tau Ceti and Mathlib. I compared every layer's Dependencies line with the union of its sections' `*Needs:*` lines, both mechanically and by reading. The other changed lines:
  - Layer 3: Mathlib (relabelling of product measures, null spheres, `Flow`, `MeasureTheory.MeasurePreserving`) and Tau Ceti `TauCeti.flowOfLipschitz` (§3.4) are added.
  - Layer 4: Mathlib (Euclidean space, block determinants, the Lebesgue change of variables, null spheres and proper subspaces) is added.
  - Layer 7: besides the finding's item, Mathlib (composition operators on `Lp`, density of compactly supported continuous functions, measures on sigma types) and Tau Ceti `TauCeti.Semigroups.StronglyContinuousGroup` (§7.4) are added.
  - Layer 8: besides the finding's item, Mathlib (fundamental theorem of calculus, `Nat.descFactorial`, relabelling of product measures) is added.
  - Layer 9: besides the finding's item, Mathlib (Gaussian integrals and laws, `Nat.descFactorial`, `ProbabilityTheory.poissonMeasure`) and the two Tau Ceti Gaussian-density declarations (§9.1) are added.
  - Layer 10: Mathlib (sphere measure, Gaussian integrals, Chebyshev's inequality) and Tau Ceti `TauCeti.Probability.empiricalMeasureOfFintype` (§10.1) are added.

  Layers 1, 2, 5 and 6 are unchanged. Layers 1–2 are "Mathlib only", which is correct. The `*Needs:*` lines of Layers 5–6 name no library or roadmap declaration.
- **Internal layer lists are unchanged.** They are read transitively, and every section a layer's `*Needs:*` lines cite lies in the transitive closure of the layers listed. Examples: Layer 5 needs §2.1, reached through Layer 3; Layer 10 needs §1.1, §1.3, §2.1 and §2.2, reached through Layer 7. A mechanical check found no uncovered section in any layer.
- **Every name added is already in the README, and each was checked at the pins.**
  - Tau Ceti `2fd255d9`: `TauCeti/Dynamics/Flow/OfLipschitz.lean:59`, `TauCeti/Analysis/Semigroups/Group/Basic.lean:74`, `TauCeti/Probability/Distributions/Gaussian/Density.lean:82` and `:265`, `TauCeti/Probability/Process/EmpiricalMeasure.lean:224`.
  - Mathlib `1b1ccf4b`: `Mathlib/Dynamics/Flow.lean:85`, `Mathlib/Dynamics/Ergodic/MeasurePreserving.lean:44`, `Mathlib/Data/Nat/Factorial/Basic.lean:332`, `Mathlib/Probability/Distributions/Poisson/Basic.lean:40`.

## Adversarial pass

Only Dependencies lines changed. No theorem, definition, convention, Check or worked example changed, so no Check needed recomputing. Each row compares a new line with the `*Needs:*` lines it summarises.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Layer 3 Dependencies | `*Needs:*` of §3.1–3.5 | sections cited: Layers 1, 2 ⊆ "Layers 1–2"; Mathlib names: `measurePreserving_piCongrLeft`, `addHaar_sphere`, `Flow`, `MeasurePreserving` ↔ the four subjects listed; Tau Ceti: {`flowOfLipschitz`} = {`flowOfLipschitz`} | agree | Mathlib, Tau Ceti added |
| Layer 4 Dependencies | `*Needs:*` of §4.1–4.5 | sections: Layers 1, 2, 3 = "Layers 1–3"; Mathlib: `EuclideanSpace`, `det_fromBlocks_zero₁₂`, `lintegral_abs_det_fderiv_eq_addHaar_image`, `addHaar_sphere`, `addHaar_submodule` ↔ the four subjects; Tau Ceti: ∅ = ∅ | agree | Mathlib added |
| Layer 5 Dependencies | `*Needs:*` of §5.1–5.5 | sections: Layers 2, 3, 4; closure of "Layers 3–4" = {1, 2, 3, 4} ⊇ {2, 3, 4}; libraries and roadmaps: ∅ | agree | none |
| Layer 6 Dependencies | `*Needs:*` of §6.1–6.4 | sections: Layers 1, 3, 4, 5; closure of "Layers 4–5" = {1, …, 5}; libraries: ∅ | agree | none |
| Layer 7 Dependencies | `*Needs:*` of §7.1–7.5 | sections: Layers 5, 6 = "Layers 5–6"; §3.5 items: {1 (§7.2), 3 (§7.5)} = {1, 3}; Tau Ceti: {`StronglyContinuousGroup`} = same; Mathlib: `Lp.compMeasurePreserving`, `MemLp.exists_hasCompactSupport_eLpNorm_sub_le`, `Sigma.instMeasurableSpace`, `Measure.sum` ↔ three subjects | agree | F01 item, Mathlib, Tau Ceti added |
| Layer 8 Dependencies | `*Needs:*` of §8.1–8.4 | sections: Layers 3, 7; closure of "Layer 7" = {1, …, 7}; §3.5 items: {4 (§8.1)} = {4}; Mathlib: `integral_eq_sub_of_hasDerivAt_of_le`, `Nat.descFactorial`, `measurePreserving_piCongrLeft` ↔ three subjects; Tau Ceti: ∅ | agree | F01 item, Mathlib added |
| Layer 9 Dependencies | `*Needs:*` of §9.1–9.6 | sections: Layers 1, 2, 3, 7, 8; closure of "Layers 7–8" = {1, …, 8}; §3.5 items: {3 (§9.4)} = {3}; Tau Ceti: {`multivariateGaussianPDFReal`, `multivariateGaussian_eq_withDensity`} = same; Mathlib: Gaussian integral, `gaussianPDFReal`, `multivariateGaussian`, `poissonMeasure`, `Nat.descFactorial` ↔ three subjects | agree | F01 item, Mathlib, Tau Ceti added |
| Layer 10 Dependencies | `*Needs:*` of §10.1–10.5 | sections: Layers 1, 2, 7, 9; closure of "Layers 7–9" = {1, …, 9}; Tau Ceti: {`empiricalMeasureOfFintype`} = same; Mathlib: `toSphere`, Gaussian integral, `meas_ge_le_variance_div_sq` ↔ three subjects; §3.5: ∅ | agree | Mathlib, Tau Ceti added |
| Layers 1–2 Dependencies | `*Needs:*` of §1.1–1.4, §2.1–2.2 | sections outside the layer: ∅; Tau Ceti and roadmaps: ∅; Mathlib only | agree | none |

## Checks

Dependency check (output verbatim):

```text
candidate: HardSphereDynamicsAndKineticLimits is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2229 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line. The roadmap supplier ClassicalErgodicTheory is an open pull request that adds a new roadmap folder. It is in neither `merge-order/ORDER.txt` nor main, so the check does not see that edge. I checked its direction by reading: ClassicalErgodicTheory cites nothing from this roadmap and names the hard-sphere flow only as a consumer of its §3.5.

Citations (`roadmaps resolve` on the edited README): no cross-roadmap citation and no Lean name is reported as found nowhere. The worker's list of 17 names came from an earlier run; it contains only this roadmap's own `HardSphere.*` declarations for the package stage, listed in the README's "How to read the build".

This is the design stage, so there is no `Suggested.lean`. I ran no Lean command, and there was nothing for the `#check` comparison to run on.

## For the maintainer

- No name that another roadmap cites changed, and no id was dropped or renumbered.
- This roadmap's pull request has to name ClassicalErgodicTheory in its merge-order paragraph. That supplier is not yet in the merge order or on main.
- The repair states no new construction, so ownership needed no new search. The one cross-roadmap citation, ClassicalErgodicTheory §3.5 items 1, 3 and 4, was re-read at that pull request's head this round.
