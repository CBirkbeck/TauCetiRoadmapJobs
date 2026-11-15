# FIX-DESIGN-GaussianIsoperimetryAndClusters~9

Repair round for the review `REV-DESIGN-GaussianIsoperimetryAndClusters~8`. It has two findings, both P3. Both are right and both are applied, each together with the other places in the roadmap where the same pattern occurs. The review's "For the human reviewers" section lists no finding, so nothing was changed because of it.

## F01 (P3) — applied

`### From Mathlib` gains four bullets. Two are the ones asked for: `Besicovitch.ae_tendsto_measure_inter_div` (§5.1, §7.2) and `ContDiffBump` with `ContDiffBump.normed` (§2.1). Two were found by the pattern search: `MeasureTheory.NullMeasurableSet` (Conventions) and `MeasureTheory.Measure.prod`/`.pi` with `MeasureTheory.measurePreserving_piFinTwo` (§1.3).

**Verification at the pins** (Mathlib `1b1ccf4b`):
- `Besicovitch.ae_tendsto_measure_inter_div` is at Mathlib/MeasureTheory/Covering/Besicovitch.lean:1104. Its section variables are `[MetricSpace β] [MeasurableSpace β] [BorelSpace β] [SecondCountableTopology β] [HasBesicovitchCovering β]` (line 1072–1073). It takes a locally finite `μ` and an arbitrary `s`, and concludes `∀ᵐ x ∂μ.restrict s` that the ratio `μ(s ∩ closedBall x r)/μ(closedBall x r)` tends to `1` as `r → 0⁺`. Every finite-dimensional real normed space has the Besicovitch property by the instance at Mathlib/MeasureTheory/Covering/BesicovitchVectorSpace.lean:500. The bullet says exactly this; I cite the instance by file and line, not by name.
- `ContDiffBump` is the structure at Mathlib/Analysis/Calculus/BumpFunction/Basic.lean:70, which carries `rIn` and `rOut` with `0 < rIn < rOut`. Its function is smooth whenever `HasContDiffBump E` holds, and every inner product space has that by `hasContDiffBump_of_innerProductSpace` (InnerProduct.lean:60). `ContDiffBump.normed` (Normed.lean:35) divides by the integral, and `integral_normed` (line 71) gives integral `1`.

**Pattern repair.** I compared every backticked identifier outside the contract section with those inside it. Apart from the two the review named, the search found:
- `Measure.pi` and `Measure.prod` in the route of §1.3;
- `NullMeasurableSet` in the Conventions.

Facts checked at the pins:
- `MeasureTheory.NullMeasurableSet` is at NullMeasurable.lean:91, with the measure defaulting to `volume`.
- `MeasureTheory.Measure.prod` is at Prod.lean:172.
- `MeasureTheory.Measure.pi` is at Constructions/Pi.lean:211.
- `MeasureTheory.measurePreserving_piFinTwo` (Pi.lean:850, section `MeasurePreserving` in namespace `MeasureTheory`) does the reindexing that §1.3's route describes, for σ-finite measures indexed by `Fin 2`. `MeasurableEquiv.piFinTwo` is at MeasurableSpace/Embedding.lean:552, in namespace `MeasurableEquiv`.

The §1.3 route now names the reindexing lemma. Its *Needs:* line and its plan prerequisites both gain `MeasureTheory.measurePreserving_piFinTwo`, so the *Needs:* line and the plan agree again. The Layer 2 dependency paragraph now mentions smooth bump functions (Layer 1's already mentions product measures, and Layer 5's and Layer 7's already mention the Lebesgue density theorem). After the edit, re-running the comparison finds no absentee: the only bare tokens left are `Measure.prod` and `NullMeasurableSet`, which the contract names in full.

## F02 (P3) — applied

§6.5 locator: (4.10), line 624–631, proof 633–779, noting that the printed form lacks `√(2π)` on the variation term and fails. §6.5 second Check: source-normalization witness added. §6.3 locator: (4.7) is weaker by `√(2π)`. The pattern repair adds a Conventions sentence and remarks at §6.4 (with a Check) and §8.3. The plan mirrors these.

**Verification** (CianchiFuscoMaggiPratelli2011):
- Their `P_γ(E) = H^{n−1}_γ(∂^M E)`, with `H^k_γ = (2π)^{−k/2} e^{−|x|²/2} H^k` (line 185–196). So their perimeter is `√(2π)` times ours, and their section perimeter `p_E = H^0_γ(∂^M E_z)` (line 555) is too.
- In (4.10) (line 626–631) the variation term `(2π)^{−(n−1)/2} ∫_B e^{−|z|²/2} d|Dv_E|` does not scale, because `v_E = γ¹(E_z)` (line 545) is a probability.
- The proof explains the slip. The left side is the probability-measure integral of (2.5), and (4.13) bounds the `e^⊥` part by `∫ |∇v| dγ_{n−1}` (line 711–720). The `e` part, however, is written with `dx` and `H^{n−1}_γ` (line 747–762), so it is too large by `√(2π)`.

My computation for the half-plane `{x_2 < 1 + x_1}` with `e = e_2`:
- variation term `∫ φ(1 + z) φ(z) dz = e^{−1/4}/(2√π) = 0.219696`;
- perimeter: ours `φ(1/√2) = 0.310697`, theirs `e^{−1/4} = 0.778801`;
- section term in their normalization `0.550695`.

So (4.10) as printed claims `0.778801 ≤ 0.770391`, which is false. With `√(2π)` on the variation term the right side is `1.101391` (the review's `1.101390` is rounded down: `2e^{−1/4}/√2 = 1.1013906`), and dividing by `√(2π)` gives the README's `0.310697 ≤ 0.439391`. The README's statement of §6.5 was already right; only its locator needed the remark. (4.7) as printed, `V ≤ √(2π) P_ours`, is true but weaker than §6.3's `V ≤ P_ours` (`0.219696 ≤ 0.778801` against `≤ 0.310697`).

**Pattern repair.** The same normalization slip affects every formula of their Section 4.1 that contains the derivative of `v_E`.
- **(4.14) and (4.6).** The proof of Lemma 4.6 takes `∇v_E` from (4.8) (line 797), and (4.8) uses the weights `e^{−y²/2}` without `(2π)^{−1/2}`. So (4.14) and (4.6) hold, and match §6.4 and §8.3, only when the gradient is read as that of `√(2π) v_E`. For the same half-plane, the (4.8) gradient gives `√(4π) · 0.219696 = 0.778801`, which is an equality. The true gradient `φ(1 + z)` gives `√(2π + 1) · 0.219696 = 0.592901`, so the printed equality case fails for a symmetral and (4.6) is false as printed.
- **One reading for all of them.** Read the derivative of `v_E` as the derivative of `√(2π) v_E`. Then (4.7), (4.8), (4.10), (4.14) and (4.6) are all correct and transfer unchanged. The Conventions now say this in one sentence, and they no longer claim that every cited inequality transfers by homogeneity.
- **(4.13) is unaffected.** It concerns a smooth `v` and is consistent in both readings.
- **Other locators checked.** Every other citation of this source was checked: line 55–57, (3.2), (2.3)–(2.5), line 209–213, Proposition 3.1, Lemma 3.3, Theorems 4.1–4.3 and Section 4.2. Each is homogeneous in perimeter or already marked "in their normalization", and none needs a change.

Places changed:
- Conventions;
- the §6.3 locator;
- the §6.4 locator and its first Check;
- the §6.5 locator and its second Check;
- the §8.3 locator;
- in the plan: the locators of 6.3, 6.4, 6.5 and 8.3, the test `tilted_equality` of 6.4, and a new test `source_normalization` for 6.5.

## Checks

**Dependency gate** (command of the brief), after all edits:

```text
candidate: GaussianIsoperimetryAndClusters is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2233 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line. The edge count went up by one, from the new Mathlib prerequisite of 1.3.

**Citations.** `roadmaps resolve` on the README reports no cross-roadmap citation and no Lean name found nowhere. The tool did not check names outside TauCetiRoadmap ("no pinned Lake packages on this host"), so I checked every new Mathlib name myself by grep at the pinned checkout (file, line and namespace above).

**Lean.** There is no `Suggested.lean` at the design stage, so there was nothing to elaborate and no `#check` binder audit to run. No Lean command was run.

**Other checks.**
- `plan.json` parses, and its layout (one-space indent, no final newline) is preserved.
- No LaTeX delimiters, process words or machine paths were added.
- No source was fetched, no manifest entry was added, `sources.toml` is unchanged, and `needs-references.toml` was not written.
- No gate failures were listed for this round.

## Adversarial pass on the changed text

| Statement | Instances tried | Values on each side | Result / change |
|---|---|---|---|
| §6.5 bound (ours) | `{x_2 < 1 + x_1}`, `e = e_2` | `0.219696 + 0.219696 = 0.439391 ≥ 0.310697` | holds; statement unchanged |
| (4.10) as printed, their normalization | same | `0.219696 + 0.550695 = 0.770391 < 0.778801` | fails; locator note and Check added |
| (4.10) with `√(2π)` on variation | same | `0.550695 + 0.550695 = 1.101391 ≥ 0.778801`; `÷√(2π)`: `0.439391 ≥ 0.310697` | holds; equals ours |
| §6.5, flat case `{x_2 < a}` (re-run) | `a = 1` | variation `0`, section `φ(1) = 0.241971`; their form `0 + e^{−1/2}`, equality either way | the slip is invisible on flat half-planes; the tilted witness is needed |
| §6.3 bound vs (4.7) | tilted half-plane | ours `0.219696 ≤ 0.310697`; (4.7) printed `0.219696 ≤ 0.778801` | (4.7) weaker by `√(2π)`; locator note added |
| §6.3 bound, degenerate | `U = ∅`, `U = E`, `{x_2 < a}` | `v_U ≡ 0`, `≡ 1`, `≡ Φ(a)`: variation `0 ≤ 0`, `0 ≤ 0`, `0 ≤ φ(a)` | holds |
| §6.4 equality, three readings | tilted half-plane | ours `√2 · 0.219696 = 0.310697 = 0.310697`; (4.8)-gradient `√(4π) · 0.219696 = 0.778801 = 0.778801`; true gradient in their normalization `0.592901 < 0.778801` | Check added to §6.4 |
| §6.4, slab (re-run) | `{|x_2| < 1}` | `∇v_U = 0`, `p_U = 2φ(1)`: `0.483941 = 0.483941` both normalizations up to `√(2π)` | homogeneous when `∇v = 0`; unchanged |
| §8.3 subgraph formula vs (4.6) | `f = Φ` on `ℝ`, `∫ φ² dx = 1/(2√π) = 0.282095` | ours `√2 · 0.282095 = 0.398942 = I(1/2)`; their normalization, perimeter `√(2π) · 0.398942 = 1`: with the true gradient `√(2π + 1) · 0.282095 = 0.761300 ≠ 1`, with the (4.8) gradient `√(4π) · 0.282095 = 1.000000` | locator note added; statement unchanged |
| Conventions sentence | (4.7), (4.8), (4.10), (4.14), (4.6) with `D(√(2π) v_E)` | (4.7): `√(2π)V ≤ √(2π)P` ⟺ §6.3; (4.10): `√(2π)P ≤ √(2π)V + √(2π)∫I` ⟺ §6.5; (4.14): `√(2π)P ≥ √(2π)∫√(p² + ‖∇v‖²)` ⟺ §6.4 | consistent |
| `Besicovitch.ae_tendsto_measure_inter_div` as used in §5.1 | `U = (0, 1) ∪ (1, 2)`; `U = ℚ` | density `1` at a.e. point of `U` and of its complement; at `1` the density is `1` (null point); for `U = ℚ`, a null set, every point has density `0` | matches §5.1 Checks |
| `measurePreserving_piFinTwo` in §1.3 | `F = {0}`, `F = E` | product over `Fin 2` of `δ_0` and `γ_E` → `δ_0 ⊗ γ_E`, pushed by addition to `γ_E` | matches §1.3 third Check; both factors are probability measures, so σ-finite |
| `ContDiffBump` as mollifier in §2.1 | `rIn < rOut`, normalized | `∫ normed = 1` (Normed.lean:71); support `ball(c, rOut)` | needs `HasContDiffBump E`, which holds on inner product spaces |

In the §8.3 row, with their `p = √(2π) φ` and the true gradient `φ`, the integrand is `√(2π φ² + φ²) = √(2π + 1) φ`. Integrating against `dγ = φ dx` gives `√(2π + 1) ∫ φ² dx`.

## Ownership

No construction was added. The new contract bullets are pinned Mathlib declarations, consumed and not stated. No ownership changed, no supplier was added, and no cross-roadmap citation changed. Ownership against open pull requests was checked through the `roadmaps` tool in earlier rounds, and no new object in this round calls for a new check.

## For the maintainer

- No name that another roadmap cites changed. No section, layer or target was renumbered.
- Source issue, for the source-issues list: CianchiFuscoMaggiPratelli2011 (cvgmt preprint) Section 4.1 measures the derivative of `v_E = γ¹(E_z)` in two normalizations at once.
  - (4.8), (4.9), (4.14) and (4.6) are correct only with the gradient of `√(2π) v_E`.
  - (4.7) is correct but weaker by `√(2π)`.
  - (4.10) is false as printed (the tilted half-plane above).
  - The theorem it serves, Theorem 4.3's (4.3), is homogeneous and unaffected.
