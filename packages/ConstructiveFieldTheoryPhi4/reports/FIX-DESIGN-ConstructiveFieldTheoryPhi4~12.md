# FIX-DESIGN-ConstructiveFieldTheoryPhi4~12

Findings from REV-DESIGN-ConstructiveFieldTheoryPhi4~11 (two, both P3). The only file edited is `packages/ConstructiveFieldTheoryPhi4/design/README.md`. `design/plan.json` and `sources.toml` are unchanged: the plan has no claim about Mathlib's projective limits, and its entry for 3.6 gives no proof route.

## F01 (P3) — applied

Exact supplier contracts, From Mathlib, the `IsProjectiveLimit` bullet. Old: "Mathlib itself contains no existence theorem for projective limits; its Brownian motion file says so explicitly." New: Mathlib has no Kolmogorov extension theorem for a general projective family (GaussianProjectiveFamily.lean:24–26). It proves projective limits exist only for product families (`MeasureTheory.Measure.isProjectiveLimit_infinitePi`, ProductMeasure.lean:362), for Ionescu-Tulcea trajectories (`ProbabilityTheory.Kernel.isProjectiveLimit_trajFun`, Traj.lean:484) and for the finite-dimensional laws of a process that already exists (`ProbabilityTheory.isProjectiveLimit_map`, FiniteDimensionalLaws.lean:53). In general, the families of 6.1 and 6.3 are of none of these kinds.

Evidence, read at Mathlib pin 1b1ccf4b:
- `isProjectiveLimit_infinitePi` is at line 362, inside `namespace MeasureTheory` / `namespace Measure`.
- `isProjectiveLimit_trajFun` is at line 484, inside `namespace ProbabilityTheory.Kernel` (lines 215–793).
- `isProjectiveLimit_map` is at line 53, inside `namespace ProbabilityTheory`.
- Lines 24–26 of the Brownian file call the Kolmogorov extension theorem "not in Mathlib yet".

A grep finds `IsProjectiveLimit` in four files only. The only existence results among them are:
- `isProjectiveLimit_infinitePiNat` (:208) and `isProjectiveLimit_infinitePi`, both for product families;
- `isProjectiveLimit_trajFun`;
- `isProjectiveLimit_map`.

So the word "only" is accurate. I named a third case that the review's wording left out (`isProjectiveLimit_map`). It is a real existence statement, but it presupposes the process.

Pattern sweep:
- README line 11 (Scope) and the StochasticCalculus §1.1 contract say nothing about what Mathlib lacks. They stay correct: the countable case comes from Tau Ceti, and the arbitrary-index case from StochasticCalculus §1.1.
- No other sentence in the README or the plan claims that Mathlib lacks projective limits.

## F02 (P3) — applied

In the 3.6 proof route, old: "the remaining Hamiltonian is a quadratic form … with coefficients ½(J_{xy} + J_{x,Ry}) on s_x s_y, ½(J_{xy} − J_{x,Ry}) on t_x t_y and J_{xz} on s_x φ_z, all nonnegative". New: "minus the Hamiltonian with the crossing terms taken out, `−H_{V,J} − Σ_{x∈V₊} J_{x,Rx}φ_xφ_{Rx}`, is a quadratic form …". The new text also:
- says which index sets each family ranges over;
- adds the family `J_{zz′}` on `φ_z φ_{z′}` for {z, z′} ⊆ V₀;
- states that there is no mixed `s_x t_y` term.

The finding is right. Take d = 2, reflection in x₁ = 0, V = {−1, 0, 1} × {0, 1}. The fixed sites (0,0) and (0,1) are neighbours, so the term `Jφ_{(0,0)}φ_{(0,1)}` is in none of the three families. I also corrected the sign in the same sentence. The Conventions write `H = −Σ J_{xy}φ_xφ_y`, so the quadratic form with nonnegative coefficients is −H, not "the Hamiltonian". The statement of 3.6, its Checks and plan entry 3.6 do not change.

Pattern sweep: no other route in the README expands a Hamiltonian over a site partition. The routes of 4.4, 5.2 and 5.3 cite 3.6 or the reflection-positivity propositions without listing terms, so no other place needed a change.

## Adversarial pass on the changed text

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| F01: "only product families, trajectories, and laws of a given process" | grep of `IsProjectiveLimit` over the pinned Mathlib | 4 files. Existence results: `infinitePiNat` (:208), `infinitePi` (:362), `trajFun` (:484), `map` (:53). The others are API in Projective.lean (:123–151) and the characterisations `isProjectiveLimit_nat_iff`, `isProjectiveLimit_nat_iff'` (Traj.lean :151, :161) | holds |
| F01: J = 0 state of 4.2 | `MeasureTheory.Measure.infinitePi` of copies of ρ | is a projective limit of `Measure.pi` by `isProjectiveLimit_infinitePi`. Consistent with the bullet before it (`infinitePi` at :354) | consistent |
| F01: families of 6.1/6.3 are not product families | white noise on F = {f, g} with ∫fg ≠ 0 | covariance `[[∫f², ∫fg], [∫fg, ∫g²]]` is not diagonal, so the law is not a product. It is not a Markov kernel chain on ℕ, and no process is given in advance | not covered by Mathlib; StochasticCalculus §1.1 is still needed |
| F02: change of variables, pair in V₊ | x ≠ y ∈ V₊ | `φ_xφ_y + φ_{Rx}φ_{Ry} = ½(s_xs_y + t_xt_y)`; `φ_xφ_{Ry} + φ_{Rx}φ_y = ½(s_xs_y − t_xt_y)`; `J_{x,Ry} = J_{Rx,RRy} = J_{Rx,y}`, so the coefficient is symmetric in x, y | coefficients ½(J_{xy} ± J_{x,Ry}) ≥ 0 under the hypothesis |
| F02: V₊–V₀ terms | x ∈ V₊, z ∈ V₀ | `J_{xz}φ_xφ_z + J_{Rx,z}φ_{Rx}φ_z`, with `J_{Rx,z} = J_{Rx,Rz} = J_{xz}`, equals `J_{xz}s_xφ_z` | coefficient J_{xz} ≥ 0 |
| F02: V₀–V₀ terms (the added family) | z ≠ z′ ∈ V₀ | unchanged by the substitution: `J_{zz′}φ_zφ_{z′}` | coefficient ≥ 0 |
| F02: completeness | V = {−1, 0, 1} × {0, 1}, R(x₁, x₂) = (−x₁, x₂), nearest-neighbour J | 7 bonds give J s_{(1,0)}φ_{(0,0)} (2 bonds), J s_{(1,1)}φ_{(0,1)} (2 bonds), (J/2)(s s + t t) for the pair (2 bonds) and Jφ_{(0,0)}φ_{(0,1)} (1 bond). The crossing terms are 0, since (1,0) and (−1,0) are not neighbours | 7 of 7 bonds covered; without the fourth family 6 of 7 |
| F02: sign | H = −Σ_{{x,y}} J_{xy}φ_xφ_y (Conventions) | the coefficients of H are −½(J_{xy} + J_{x,Ry}) ≤ 0; those of −H minus the crossing terms are as listed, ≥ 0 | sign corrected |
| F02: no mixed term | all four families and the crossing term | the pairs give s s and t t, V₊–V₀ gives s φ, V₀–V₀ gives φ φ, and the crossing term gives `¼J_{x,Rx}(s_x² − t_x²)` in the pair law | no s t term |
| F02: rest of the route | A = B = {x} | `φ_x² − φ_xφ_{Rx} = ½(s_xt_x + t_x²)`, nonnegative coefficients. Under the pair law, `∫s^a t^b` is 0 unless a and b are both even, and then it is ≥ 0 | the route closes |
| 3.6 Checks (recomputed, unchanged) | chain {0,1,2,3}; only J₀₂ = J₁₃ = K; site reflection | `tanh J ≥ tanh² J`, `1 ≥ tanh³ J`; `0 < tanh K`; `1 ≥ tanh² J` | unchanged |

## Checks run

Dependency gate:

```text
candidate: ConstructiveFieldTheoryPhi4 is not in the merge order yet; checked as if placed after RelativisticQuantumFieldTheory (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2244 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

`roadmaps resolve` on the README found no cross-roadmap citation and no Lean name missing. The tool does not check names outside TauCetiRoadmap, so I checked the three Mathlib names this round adds by hand at the pin (file, line and namespace above).

Other checks:
- No LaTeX delimiters, process words or machine paths in the changed text.
- No `Suggested.lean` at the design stage, so no Lean command was run.
- No `#check` comparison applies.

## Notes for the maintainer

- No name of this roadmap changed, and no id was dropped. No supplier, gap or merge-order edge changed.
- Ownership: no new object, so no new ownership question.
- The review's "For the human reviewers" section (uncertified texts, the IHES preprint licence, the PartII scope) lists no finding, and nothing was changed because of it.
