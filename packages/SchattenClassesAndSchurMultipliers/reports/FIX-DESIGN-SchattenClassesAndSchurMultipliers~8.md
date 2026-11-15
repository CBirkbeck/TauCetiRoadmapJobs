# FIX-DESIGN-SchattenClassesAndSchurMultipliers~8

Repair of the design after review REV-DESIGN-SchattenClassesAndSchurMultipliers~7, which has one
finding. Files changed: `packages/SchattenClassesAndSchurMultipliers/design/README.md` and
`packages/SchattenClassesAndSchurMultipliers/design/plan.json`. `sources.toml` is unchanged
because no new work is cited.

## F01 (P2) — applied

Old: §2.5, Scope, contract and plan credited BochnerSpaces §7.4 with the positivity, tower law
and `𝒜`-measurable values of `E[· | 𝒜]`. New: §2.5 proves these and the agreement with `condExp`
from the properties of `E₁`, each with a one-line route and with two new Checks. The contract now
lists only what §7.4 states.

### Verification

The finding is correct. I read BochnerSpaces §7.4 at the head of its open pull request, through
`roadmaps show BochnerSpaces`: section "7.4 Stability and separable determination", whose text and
API list are unchanged between the head the review read and the present head. Its API bullets
prove positivity, the modulus inequality, a.e. congruence and the tower law for the `L¹` projection
`E₁`, together with its idempotence and range. For the `L^∞` object it states only three things:
the construction as the adjoint of `E₁` (a contraction), agreement on intersections with `L²`, and
"the L∞ adjoint formulas". It does not state `𝒜`-measurability of the values, positivity, the tower
law or agreement with `condExp` on `L^∞ ∩ L¹`. The previous contract sentence ("carried over by
the adjoint formula") named no target that does the carrying over.

### Changes in detail

- **§2.5, opening.** "linear, positive and contractive, with values in the `𝒜`-measurable classes,
  satisfying the tower law …" becomes "the linear contraction of `L^∞(Ω, 𝓑, μ)` adjoint to `E₁`,
  `∫ E[φ | 𝒜] g dμ = ∫ φ E₁(g) dμ`, agreeing with `condExpL2` on `L^∞ ∩ L²`". The identity
  `∫ E[φ | 𝒜] g = ∫ φ g` for `𝒜`-measurable `g` is now derived from `E₁` fixing its range. A
  sentence records that an `L^∞(μ)` class is determined by its integrals against `L¹(μ)`. This
  holds because `μ` is σ-finite, which follows from σ-finiteness on `𝒜`.
- **§2.5, four new statements, placed first:**
  - *`𝒜`-measurable values:* `1_A E[φ | 𝒜] = E[1_A φ | 𝒜] = condExpL2(1_A φ)` for `A ∈ 𝒜` of
    finite measure. This uses `E₁(1_A g) = 1_A E₁(g)`, from `E₁ = condExp` on `L¹` and
    `MeasureTheory.condExp_indicator`. The pieces are then glued over a countable cover.
  - *Positivity:* from the positivity of `E₁`.
  - *Tower law:* for `𝒜' ⊆ 𝒜` with `μ` σ-finite on `𝒜'`, via `E₁ E₁' = E₁'`.
  - *Agreement with `condExp`:* `L^∞ ∩ L¹ ⊆ L²`, then `MeasureTheory.MemLp.condExpL2_ae_eq_condExp'`.
- **§2.5, existing statements.** The characterisation bullet now says where existence comes from
  (the first statement). The finite-equivalent-measure bullet now cites the agreement statement
  instead of §7.4, and its trailing sentence "Whenever `φ` is also `μ`-integrable …" moved into the
  agreement statement.
- **§2.5, two new Checks:**
  - The adjoint of the non-conditional projection `g ↦ g(1)·1` (masses `1, 3`) sends `1` to
    `(4, 0)`. So measurable values are a property of `E₁`, not of adjointness.
  - A tower-law example with a non-nested negative control.
- **Scope, Layer 2 bullet.** Lists the four new facts.
- **Scope, BochnerSpaces bullet.** Lists the adjoint formula, contractivity and the `condExpL2`
  agreement of `E[· | 𝒜]`, and the positivity, idempotence, tower law and `condExp` agreement of
  `E₁` (§7.4). It says that §2.5 proves the carried-over facts.
- **Contract "From TauCetiRoadmap.BochnerSpaces", §7.4.**
  - Removed: "with values in the `𝒜`-measurable classes", "and with `condExp` on `L^∞ ∩ L¹`", and
    "Positivity, contractivity and the tower law of `E[· | 𝒜]` are those of `E₁` carried over …".
  - Added: "idempotent with range the `𝒜`-measurable classes" for `E₁`, and "Nothing else is
    assumed of `E[· | 𝒜]`: … proved in §2.5".
- **Contract "From Mathlib".** New bullet for `MeasureTheory.condExp_indicator` and
  `MeasureTheory.MemLp.condExpL2_ae_eq_condExp'`. These are pinned names, checked in the
  "Pinned names" section below.
- **"How to read the build".** Layer 2 also proves "the `𝒜`-measurability of its values, its
  positivity and tower law".
- **§2.5 Needs.** Adds Mathlib `MeasureTheory.condExp_indicator`, `MeasureTheory.lpMeas` and
  `MeasureTheory.MemLp.condExpL2_ae_eq_condExp'`.
- **plan.json, target 2.5.**
  - The statement is rewritten the same way.
  - New hypothesis: "for the tower law: A' a sigma-algebra contained in A, with mu sigma-finite
    on A'".
  - Prerequisites gain the three Mathlib names.
  - Two new tests: `linftyCondExp_measurable_values` and `linftyCondExp_tower`.
- **plan.json, BochnerSpaces supplier.** The `what` field is rewritten to match the contract.

### The same pattern elsewhere in the roadmap

I looked for consumers that use these properties of `E[· | 𝒜]` without citing §2.5:

- **§5.2** cites "the tower property of §2.5". It is now a stated proof in §2.5, so no edit.
- **§7.3** used the tower law silently: `E[E[M | 𝓑' ⊗ 𝓑'] | 𝒜 ⊗ 𝒜] = E[M | 𝒜 ⊗ 𝒜]` in its chain
  of inequalities. The route now names it ("by the tower law of §2.5"), and its Needs gain §2.5.
- **§7.2** has `E[φ | 𝒜 ⊗ 𝒜]` in its statement. Its Needs gain §2.5.
- **§6.4** applies Lévy's theorem to `M_n = E[M | 𝓑_n ⊗ 𝓑_n]` on a finite measure, which needs
  the agreement with `condExp`. The route now says "on which the expectations of §2.5 are
  `MeasureTheory.condExp`", and its Needs gain §2.5.
- **Layer 5 introduction.** The sentence "`condExp` agrees with them on integrable symbols" now
  cites §2.5.
- **Layer dependencies.** As a result:
  - Layer 6 Dependencies: "Layers 1 (§1.4), 2 (§2.5) and 3–5".
  - Layer 7 Dependencies: "Layers 2 (§2.5), 3 and 5".
  - "How to read the build": "Layer 6 needs Layers 1–5 (§6.1–6.3 need only Layers 1, 3 and 4).
    Layer 7 needs Layers 2, 3 and 5."
  - plan.json: targets 6.4, 7.2 and 7.3 gain the prerequisite `target:2.5`.
- I recomputed the layer dependencies from all 45 Needs lines by script: 1:{}, 2:{1}, 3:{1,2},
  4:{1,2,3}, 5:{2,3}, 6:{1,2,3,4,5}, 7:{2,3,5}, 8:{1,3,5}, 9:{1,3,4,8}, 10:{1,3},
  11:{2,3,4,7,10}. This equals the updated summary.
- No other section ascribes to BochnerSpaces something it does not state. The only other citation
  is §7.5 in §7.1, which the review's table already checked against §7.5.

## Adversarial pass on the new and changed statements

| Statement | Instances | Values computed on each side | Result / change |
|---|---|---|---|
| §2.5 `𝒜`-measurable values | masses `(1, 3)`, trivial `𝒜`, `A = Ω` | `E[(a, b)] = condExpL2(a, b) = ⟨(a, b), 1⟩/⟨1, 1⟩ = (a + 3b)/4`, a constant | holds |
| same | Lebesgue on `ℝ`, `𝒜` by unit intervals, `A = [0, 1)`, half-indicator `φ` | `1_A E[φ] = E[1_A φ] = condExpL2(1_A φ) = (∫_A φ/μ(A)) 1_A = (1/2) 1_A` | holds |
| same, module identity | `g ∈ L¹`, `A ∈ 𝒜` | `∫ 1_A E[φ] g = ∫ φ E₁(1_A g) = ∫ φ 1_A E₁(g) = ∫ (1_A φ) E₁(g) = ∫ E[1_A φ] g` | holds |
| same, wrong model | masses `(1, 3)`, `P(g) = g(1)·1` (an idempotent onto the constants) | `∫ φ P(g) dμ = g(1)(φ(1) + 3φ(2))`, so `P*(φ) = (φ(1) + 3φ(2), 0)` and `P*(1) = (4, 0)`, not constant; `E[1] = 1` | added as a Check |
| same, degenerate | `μ = 0`; `𝒜 = 𝓑` | `L^∞ = 0`, `0 = 0`; `E₁ = id`, `E = id`, measurable | holds |
| §2.5 positivity | masses `(1, 3)`, `a, b ≥ 0`; `φ = i` | `(a + 3b)/4 ≥ 0`; `E[i] = i`, not `≥ 0`, and the hypothesis `φ ≥ 0` fails | holds; the hypothesis is needed |
| same, complex test | `B ⊆ {Im E[φ] > 0}`, `0 < μ(B) < ∞` | `Im ∫_B E[φ] > 0` contradicts `∫ E[φ] 1_B = ∫ φ E₁(1_B) ∈ [0, ∞)` | holds |
| §2.5 tower law | counting measure on `{1, …, 4}`, `φ = 1_{{1}}`, `𝒜 = σ({1,2},{3,4})`, `𝒜'` trivial | `E[φ \| 𝒜] = (1/2, 1/2, 0, 0)`, mean `1/4`; `E[φ \| 𝒜'] = 1/4` | holds (Check) |
| same, weighted | masses `(1, 3, 1, 1)`, same `𝒜`, `𝒜'`, `φ` | `E[φ \| 𝒜] = (1/4, 1/4, 0, 0)`, outer mean `(1/4 + 3/4)/6 = 1/6 = E[φ \| 𝒜']`; unweighted inner averaging gives `(1/2 + 3/2)/6 = 1/3` | holds |
| same, non-nested | `𝒜'' = σ({1,3},{2,4})` | `E[(1/2, 1/2, 0, 0) \| 𝒜''] = 1/4` constant; `E[φ \| 𝒜''] = (1/2, 0, 1/2, 0)` | the inclusion is needed (Check) |
| same, degenerate | `𝒜' = 𝒜`; `𝒜'` not σ-finite (trivial on `ℝ`) | `E[E[φ]] = E[φ]`, i.e. idempotence from `E₁E₁ = E₁`; `E[· \| 𝒜']` is undefined, excluded by hypothesis | holds |
| §2.5 agreement with `condExp` | counting `ℕ`, `𝒜 = 𝓑`, `φ = 1` | `1` is not integrable: `E[1] = 1`, `condExp = 0`, and the statement asserts nothing | the integrability hypothesis is needed (existing Check) |
| same | `φ ∈ L^∞ ∩ L¹` | `∫ \|φ\|² ≤ ‖φ‖_∞ ∫ \|φ\| < ∞`; `E[φ] = condExpL2 φ` (§7.4) `= condExp 𝒜 μ φ` (pinned lemma, hypotheses integrable, `MemLp 2`, `SigmaFinite (μ.trim hm)`) | holds |
| same, finite `μ` | masses `(1, 3)` | `condExp` = weighted mean `(a + 3b)/4` = `E[(a, b)]` | holds |
| §2.5 characterisation, existence | any `φ` | `𝒜`-measurable by the first statement; `∫ E[φ] g = ∫ φ E₁(g) = ∫ φ g` since `E₁ g = g` for `𝒜`-measurable `g` | holds |
| §2.5 finite equivalent measure (changed citation) | masses `(1, 3)`, `w = (1, 1)`; unit intervals on `ℝ` with `w = Σ_k 2^{−\|k\|} 1_{[k,k+1)}` | `w·μ = μ`, `condExp = (a + 3b)/4`; per-interval average unchanged by a constant weight on each interval, `1/2` | holds |
| §6.4 (new citation) | finite `μ ⊗ μ`, `M_n = E[M \| 𝓑_n ⊗ 𝓑_n]` | `M` is bounded, hence integrable on a finite measure, so `M_n = condExp(M)` and Lévy's theorem applies; `\|M_n\| ≤ ‖M‖_∞` by contractivity (§7.4) | holds |
| §7.3 (tower named) | `𝒜 ⊆ 𝓑'` finite | `E[E[M \| 𝓑'²] \| 𝒜²] = E[M \| 𝒜²]` by the tower law, with `𝒜² ⊆ 𝓑'²` and a finite measure | holds |
| Contract §7.4 (restated) | masses `(1, 3)`, `g = (g₁, g₂)` | `∫ E[φ] g = ((a + 3b)/4)(g₁ + 3g₂) = ∫ φ E₁(g)` with `E₁(g) = (g₁ + 3g₂)/4` | holds |

The design stage has no `Suggested.lean`, so there was no Lean statement to change, no `#check`
audit to run and no elaboration. No README name of this roadmap's own was added or removed: the
new backticked names are Mathlib names.

## Checks run

Dependency check (command of the brief), exact output:

```
candidate: SchattenClassesAndSchurMultipliers is not in the merge order yet; checked as if placed after AutomorphicSpectralTheory (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2236 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line. BochnerSpaces is an open pull request by another author that
adds a new roadmap folder. The check does not see that edge (BochnerSpaces is in neither the
merge order nor main), as in the previous round.

Other checks:

- **Citations.** `roadmaps resolve` on the README reports "Cross-roadmap citations found
  nowhere: None" and "Lean names found nowhere: None".
- **Shape** (script):
  - 45 `### k.n` headings, equal to the 45 plan ids in order.
  - 45 Needs lines, 11 `### Examples`, 11 `### Dependencies`.
  - No LaTeX delimiter, pull-request number, process word or machine path.
  - `plan.json` parses.
- **Pinned names**, each checked by grep at the Mathlib pin:
  - `MeasureTheory.condExp_indicator`
    (`Mathlib/MeasureTheory/Function/ConditionalExpectation/Indicator.lean` 73: integrable `f`,
    `MeasurableSet[m] s`).
  - `MeasureTheory.MemLp.condExpL2_ae_eq_condExp'` (`…/ConditionalExpectation/Basic.lean` 388:
    `Integrable f μ`, `MemLp f 2 μ`, `SigmaFinite (μ.trim hm)`, `E` a complete inner-product space
    over an `RCLike` field).
  - `MeasureTheory.lpMeas` (`…/ConditionalExpectation/AEMeasurable.lean` 88).
  - `MeasureTheory.condExpL2` (`…/ConditionalExpectation/CondexpL2.lean` 68, with values in
    `lpMeas`).
- **Ownership by object.** `roadmaps grep` for the `L^∞` conditional expectation as the adjoint
  of the `L¹` projection matches only BochnerSpaces §7.4, the cited owner. The facts proved in
  §2.5 are consequences that §7.4 does not state. They are proved here because only this roadmap
  needs them, and they concern the supplied object. Nothing is planned again.
- **Overlaps.** No heading, section or target id changed, so no id other roadmaps cite is dropped.
  The citation BochnerSpaces §7.4 and §7.5 resolves at that roadmap's present head. Its only
  changes since the reviewed head are in its contract and §8.3.

No gate failures were listed for this round.

## For the maintainer

- The repair does not change what BochnerSpaces must provide. It narrows what this roadmap assumes
  of §7.4 to what §7.4 states. No supplier gap is added, and both declared gaps are unchanged.
- No name that other roadmaps cite changed. No heading was renumbered, and target 2.5 keeps its
  plan name `SchattenClasses.linftyCondExp_calculus`.
- Layer-level dependencies changed: Layer 6 now lists Layer 2, and Layer 7 now lists Layer 2,
  both through §2.5. These edges were already implied through §5.1, so the build order is
  unchanged.
