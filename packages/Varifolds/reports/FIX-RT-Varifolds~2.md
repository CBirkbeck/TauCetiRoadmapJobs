# FIX-RT-Varifolds~2: repair of red-team round 2 (reviews 2a and 2b)

Five findings, four sections (2a/F02 and 2b/F02 are the same omission and are settled once). Files
changed: `packages/Varifolds/Suggested.lean`, `packages/Varifolds/README.md`,
`packages/Varifolds/sources.toml` (one locator). `design/plan.json` and `metadata.toml` are
unchanged; no supplier gap is needed.

## RT-Varifolds~2a/F01 (P3) — applied

Change: `Euclidean.IsVarifoldTangent.isStationary`, `.isRectifiable`, `.isIntegral`: binder
`(hV : HasLocallyBoundedFirstVariation V)` deleted, docstrings now list only density and decay;
`Euclidean.HasLocallyBoundedFirstVariation` deleted (then unused). README 4.3 drops the name; 7.2
states "Θ finite and ρ¹⁻ᵏ‖δV‖(B_ρ(x)) → 0" (decay gives bounded first variation near x), drops
"the hypotheses taken on W", adds the witness as a Check; 8.2 drops "with locally bounded first variation".

Evidence. For `k ≥ 1` and `ρ > 0`, `ENNReal.ofReal (ρ ^ (1 - k)) ≠ 0`, so `hδ` makes
`Euclidean.firstVariationMass V (ball x ρ)` finite for small ρ; since `X ↦ −X` preserves the
class of test fields, `|δV(X)| ≤ ‖δV‖(B_ρ(x)) sup|X|` for X supported in `B_ρ(x) ∩ W`, which is
bounded first variation near x. The old README already stated the neighbourhood form (7.2, first
paragraph), so the Lean was narrower than the README. The routes are local: the blow-ups on
`B_R(0)` only see `B_{λR}(x)`, and 7.1, 7.6 are applied on balls `B_R(0)`, where
`‖δV_{x,λ}‖(B_R(0)) = λ^{1−k}‖δV‖(B_{λR}(x)) → 0` by `hδ`. Witness (now a 7.2 Check):
V = v(x-axis, 1) + vertical lift of H¹⌞{y₂ = 5}, x = 0: Θ = 1, ‖δV‖(B_ρ(0)) = 0 for ρ < 5,
no locally bounded first variation on ℝ², VarTan = {v(x-axis, 1)}, ‖C‖(B_ρ(0)) = 2ρ = 1·ω₁·ρ.

Pattern. The same redundancy (a first-variation bound implied by another hypothesis) is in
`monotonicity_inequality`, `monotoneOn_exp_mul_densityRatio` (`hV`) and the two compactness
theorems (`hbdd`, implied by `hmass`). There README, Lean and sources (Scharrer2022 line 1123;
Simon1983 line 7886–7890) all state the hypothesis, so README and Lean agree and the review asks
no change; they are kept. 7.3 (`isRectifiable_of_ae_density_pos`) needs its hypothesis and is
unchanged.

## RT-Varifolds~2a/F02, RT-Varifolds~2b/F02 (P3) — applied

Change: README 4.4 *Needs:* "Layer 4.2, Layer 4.3; Mathlib …" → "Layer 3.1–3.2 (the isometry and
dilation laws), Layer 4.2, Layer 4.3; Mathlib …" (rest unchanged).

Evidence: 4.4's bullets use f_#V (3.1) and `V_{x,λ}` (3.2); 3.2 was not reached through 4.1 (1.3,
3.1), 4.2 or 4.3 (4.1, 4.2). No cycle: 3.1 needs 1.1–1.4, 2.2 and 3.2 needs 3.1. Pattern: every
other section using f_#, ι_# or `V_{x,λ}` (3.3, 4.1, 4.5, 5.2, 7.2, 8.1, 8.2, 9.1, 9.2) reaches 3.1
or 3.2 through its own *Needs:* line. The plan's `prerequisites` field is outside what this job
may edit.

## RT-Varifolds~2b/F01 (P3) — applied differently

Change: `Suggested.lean` docstring, second "not statable" bullet: "a metric … is the instance
`Bundle.RiemannianBundle`, so a sequence of metrics … have no carrier" → names what exists
(`Bundle.ContMDiffRiemannianMetric`, `TauCeti.WithMetric g`,
`TauCeti.Manifold.ContMDiffNondegenerateMetric.leviCivitaConnection`) and what is missing (no
`EMetricSpace` on these copies, over which this file's definitions are stated; no §1.2 identification
between two metrics' Grassmann bundles).

Why differently. The finding is right (Mathlib `Bundle.ContMDiffRiemannianMetric`,
`Mathlib/Geometry/Manifold/VectorBundle/Riemannian.lean:245`). The proposed replacement is not:
it says the Levi-Civita connection with the metric as an argument and `C²` convergence of metrics on compact sets
are not at the pins. At the pinned Tau Ceti:

- `TauCeti.Manifold.ContMDiffNondegenerateMetric.leviCivitaConnection` takes the metric as data
  (`TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Nondegenerate/Existence.lean:102`),
  and `Bundle.ContMDiffRiemannianMetric.toNondegenerateMetric` (`NondegenerateMetric/Basic.lean:432`)
  feeds it a Riemannian metric.
- `TauCeti.WithMetric g` (`TauCeti/Geometry/Manifold/Riemannian/WithMetric.lean:68`) is a copy of
  `M` whose `RiemannianBundle` instance is `g`. It is built so that two metrics on one manifold can
  be compared.
- `ContMDiffMap.manifoldWeakWhitneyTopology`
  (`TauCeti/Geometry/Manifold/ContMDiffMap/Chart/Topology.lean:72`) tests chart derivatives of order
  ≤ n on compact sets, which is `Cⁿ` convergence on compacta. I did not elaborate it on a metric
  viewed as a map into the bilinear-form bundle, so the docstring makes no claim about `C²`
  convergence either way.

What is truly absent is narrower. The copies have topology, charts, manifold structure and Borel
σ-algebra, but no `EMetricSpace` instance (none in `WithMetric.lean`, none elsewhere in Tau Ceti).
`grassmannBundle`, `HasDensity` and `IsRectifiable` are stated over `[EMetricSpace M]` (the elaborated
signature of `grassmannBundle` carries it). Neither Mathlib nor Tau Ceti has a Grassmann bundle of a
manifold, let alone the §1.2 identification between two of them. `EMetricSpace.ofRiemannianMetric`
(Mathlib `Geometry/Manifold/Riemannian/Basic.lean:546`, needs `T3Space`) could build a distance per
copy, so the statement would be a per-index instance encoding, which the rules exclude. The
conclusion "not stated" stands. The three library declarations the new bullet names were checked
with `#check` at the pins (below); the classes it names are those of the file's variable block. The README makes no such claim (`grep` for "carrier", "fixed metric").

## RT-Varifolds~2b/F03 (P3) — applied

Change: README 7.5, after the hypothesis display, new paragraph: the third quantity is "the tilt
of V over B_3(0)", unsquared, operator norm of 1.1, not radius-normalised, and not Simon1983 §22's
tilt-excess (line 3779–3798: squared, divided by ρᵏ). Check: "has tilt excess" → "has tilt",
adding the squared value sin²α‖V‖(B_3(0)). 7.6: "tilt → 0" → "tilt (7.5) → 0".

Evidence: Simon1983 line 3779–3798 defines the tilt-excess as a mean-square deviation normalised by
ρ^{−n} (§22), so the Check's |sin α|‖V‖(B_3(0)) was not a tilt-excess. Every other use ("tilt 0" at
the plane, disc and dense-discs Checks; "the thresholds ε² … for the tilt"; "tilt below 1/100") now
refers to the defined quantity and its values (0, 0, 0, < ε²) are unchanged.
`packages/Varifolds/sources.toml`: Simon1983 `locator` gains "5 (§22)".

## Checks run

- **Elaboration**: `lake env lean packages/Varifolds/Suggested.lean` from the content checkout:
  15 warnings "declaration uses `sorry`" (the 15 theorems), no error, no other message. No
  `TauCeti.*` build was needed.
- **Signatures**: a scratch copy of the file with `#check @name` for all 38 declarations and for the
  six library names the docstring and report rely on (`Bundle.ContMDiffRiemannianMetric`,
  `TauCeti.WithMetric`, `TauCeti.Manifold.ContMDiffNondegenerateMetric.leviCivitaConnection`,
  `Bundle.ContMDiffRiemannianMetric.toNondegenerateMetric`, `EMetricSpace.ofRiemannianMetric`,
  `ContMDiffMap.manifoldWeakWhitneyTopology`) elaborated in one run. The three changed theorems
  keep `InnerProductSpace ℝ F`, `FiniteDimensional ℝ F`, `BorelSpace F`, `W`, `hk`, `hx`, `hθ`, `hdens`,
  `hδ` (and `hlow`, `hint`), and lost only `hV`, as intended; the README states the same hypotheses.
  The seven Riemannian theorems spot-checked (`exists_firstVariation_eq_riesz`,
  `monotonicity_inequality`, `ae_hasDensity`, `isRectifiable_of_ae_density_pos`, `constancy`,
  `rectifiable_compactness`, `integral_compactness`) carry `I.Boundaryless`,
  `SecondCountableTopology M`, `IsContMDiffRiemannianBundle`, `IsRiemannianManifold I M`,
  `BorelSpace M`. The "dropped binder" leads of `scratch/signatures.md` are definitions whose bodies
  do not use the dropped classes; nothing else changed.
- **README ↔ Lean names**: 38 declarations, each backticked in the README; no backticked name of
  this roadmap's own in the README is undeclared (`Euclidean.HasLocallyBoundedFirstVariation`
  appears in neither).
- **Citations** (`roadmaps resolve packages/Varifolds/README.md`): "Cross-roadmap citations found
  nowhere: None. Lean names found nowhere: None."
- **Dependency check**:

```
depcheck: 249 roadmaps, 2377 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

- **Ownership**: no new object, construction or supplier citation was introduced; the new
  docstring names only pinned library declarations. Nothing to check against open pull requests.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `Euclidean.IsVarifoldTangent.isStationary` without `hV` | V = v(L,1) + vertical lift at y₂ = 5, x = 0, k = 1; vertical lift at x = 0; step multiplicity 1 → 2 on L; Lebesgue with a constant line | Θ = 1, ‖δV‖(B_ρ) = 0 (ρ < 5), C = v(L,1), ‖C‖(B_ρ) = 2ρ; ‖δV‖(B_ρ) = ⊤, ofReal 1·⊤ = ⊤ ↛ 0, excluded (its C = V is not stationary); ‖δV‖(B_ρ) = 1 ↛ 0, excluded (its cone has δC = δ₀); Θ = πρ²/2ρ → 0, C = 0 | true; `hδ` alone excludes every non-stationary limit tried |
| `…isRectifiable` without `hV` | the first V; ½v(L,1) | {Θ* < 1} ∩ B_ρ(0) is ‖V‖-null (ρ < 5), C = v(L,1) rectifiable, `blowUp C 0 s = C`; `hlow` fails (ρ⁻¹·ρ = 1) | true |
| `…isIntegral` without `hV` | v(L,1) + Σ_j v(S_j,1), S_j segments of length 1/j² accumulating at (0,5) | integral, ‖V‖ finite near (0,5) (Σ 1/j² = π²/6), ‖δV‖ = ∞ near (0,5), = 0 on B_ρ(0) for ρ < 4; C = v(L,1) integral stationary cone | true; old `hV` failed here |
| README 7.2 hypotheses | k = 1 and k = 2 (plane in ℝ³) | ρ⁰ = 1; ρ⁻¹·0 = 0 | equals the Lean |
| README 8.2 "integral and 7.2's hypotheses" | segments example above | as the Lean row | equals the Lean |
| README 4.4 *Needs:* | dependency closure | 4.1 → {1.3, 3.1}; 4.2, 4.3 → no 3.2; 3.2 → 3.1 | 3.2 now listed, no cycle |
| README 7.5 tilt | k-plane rotated by α in span(e_k, e_{k+1}); horizontal plane; disc | ‖P_S − p‖ = \|sin α\|, tilt \|sin α\|‖V‖(B_3(0)), squared sin²α‖V‖(B_3(0)), Hilbert–Schmidt square 2sin²α; 0; 0 | Checks agree with the definition |
| Docstring bullet (7.4/7.6, varying metrics) | `#check` of the five names; grep of `WithMetric.lean` instances | all elaborate; instances: topology, compact, Lindelöf, measurable, Borel, charted, manifold; no `EMetricSpace` | accurate |

## For the maintainer

- `TauCetiRoadmap.Varifolds.Euclidean.HasLocallyBoundedFirstVariation` is deleted. No roadmap on
  main or in an open pull request cites it (`roadmaps grep --fixed`: no match). `design/plan.json`
  does not mention it.
- The three Euclidean tangent theorems keep their names and lose one binder; no other roadmap cites
  them.
- Redundant first-variation hypotheses remain in `monotonicity_inequality`,
  `monotoneOn_exp_mul_densityRatio`, `rectifiable_compactness` and `integral_compactness`, where
  README, Lean and sources agree (see 2a/F01). This is a P3 note, not a defect.
- Tau Ceti now has most pieces for metrics given as data (`TauCeti.WithMetric`, a Levi-Civita
  connection with the metric as argument, the weak Whitney topology). If it gains an
  `EMetricSpace` on `WithMetric g`, the varying-metric forms of §7.4 and §7.6 are worth
  reconsidering for `Suggested.lean`; for now they remain stated in the README only.
