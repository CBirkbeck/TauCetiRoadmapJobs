# Review of RandomGraphs (pull request #3170 at f17d28c)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 69 changed lines since `87e7f72`. Checked: the new subsection 9.5 with its two Checks, its three `Suggested.lean` theorems, and the edits to the build table, the Layer 9 dependencies and the supplier table. Accepted, with no finding: measurability of the de Finetti correspondence in both directions and the filter form of the Diaconis–Janson homeomorphism are true as stated and elaborate at the pins, and both Checks compute correctly. The folder is unchanged since the previous review, so its two small corrections (the routes plan steps the pinned Tau Ceti already has; the ownership sentence no longer matches 9.5) and two format notes stand, none blocking. One question of placement is left to the human reviewers.

## C01 — The routes of 9.5 plan steps that the pinned Tau Ceti already proves

An implementer following the routes would rebuild three things the library has. (a) The forward route asks for measurability of `P ↦ P^{⊗ℕ}` "on cylinders" (README line 1237); that is `TauCeti.MeasureTheory.measurable_infinitePi_const` (`TauCeti/MeasureTheory/Measure/ProductKernel.lean:231`). With `Measure.deFinettiBarycenter_eq_join_map` (`TauCeti/Probability/Process/PathLaw/Mixture.lean:60`), Mathlib's `Measure.measurable_join` and `Measure.measurable_map`, and two `Measurable.subtype_mk`, `measurable_deFinettiEquiv` has a five-line proof, which I elaborated at the pins. (b) The inverse route's parenthetical (line 1239) asks that the Giry σ-algebra be the Borel σ-algebra of the weak topology; that is the instance `TauCeti.MeasureTheory.ProbabilityMeasure.borelSpace` (`TauCeti/MeasureTheory/Measure/ProbabilityMeasure/Borel.lean:140`) with `instSecondCountableTopology` (`…/ProbabilityMeasure/Separable.lean:48`). What the pins lack is only that the weak topology is Polish (neither pin has a `PolishSpace` or `StandardBorelSpace` instance on `ProbabilityMeasure`). (c) The homeomorphism route uses `GraphonSpaceI.instCompactSpace` (`TauCeti/Combinatorics/DenseGraphLimits/GraphonSpace/Compact.lean:59`) and `continuous_homDensityOnSpace` (`…/GraphonSpace/HomDensity.lean:139`); the *Needs:* line names neither.

The smallest change: add these names to the *Needs:* line of 9.5 and reduce the two routes to what is missing (Polishness of the weak topology, then Lusin–Souslin; continuity of the induced densities from the homomorphism densities). `measurable_deFinettiEquiv` can stay as the easy half of the equivalence; its docstring could say that it is.

## C02 — The ownership sentence closing the supplier contracts no longer matches 9.5

A reader of the scope concludes that this roadmap leaves the de Finetti correspondence alone: the closing paragraph of the supplier contracts (line 1696) says "Generic samplers, representation theorems and general EF machinery retain their existing owners", and the ownership list (lines 1608–1618) is silent. But 9.5 now plans the measurable structure of de Finetti's representation over every standard Borel space, and the standard Borel structure of the Giry space, which no roadmap on `main` and no open roadmap I searched plans. One clause in the ownership list would settle it, for instance "the measurable and topological forms of the de Finetti and Diaconis–Janson correspondences (9.5), with the standard Borel structure of the Giry space".

## N01 — Section 9.5 cites no source

Neither result of 9.5, nor the Polishness of the weak topology that the inverse route needs, carries a locator; elsewhere the README gives one or says none is cited (9.2). Add a locator for each, or a sentence that the results are derived here. The pinned Tau Ceti file proving the Borel half cites Kechris, *Classical Descriptive Set Theory*, Theorem 17.24.

## N02 — Untouched text: README 5.2, lines 702–703, "every formula"

The sentence says "every formula is `Language.Theory.IsQFEquivalent` modulo `T_R`", while `HasQuantifierElimination` in `Suggested.lean` quantifies over variable types in `Type` only. "Every formula whose free variables form a type in `Type`" would match. For a separate pull request.

<details><summary>What was checked</summary>

The worker's automatic checks all passed at this head. The supplier-order check (every supplier named is earlier in the merge order, no two roadmaps supply each other) covered 113 roadmaps and 1287 supplier edges and found no problem: no upward supplier and no cycle for this roadmap. `Suggested.lean` elaborates with exit code 0 and 78 `sorry` warnings, nothing else; the three new theorems carry all their binders in their own signatures. One-tactic probes (`fun_prop`, `measurability`, `simp`) close none of the three. No file outside the pull request's own folders changed. The previous review had no finding; its two small corrections and two format notes are not repaired (the folder is unchanged since that head) and are repeated above. The sampled target in the changed text, 9.5, has no locator to verify; the other sampled targets lie in untouched text the change does not affect and were not reopened. Ownership against open pull requests was checked by searching the open heads and `main` for the 9.5 objects.

</details>

## Verified sound

| Statement | Instances tried | Computed | Claimed | Result | Change |
| --- | --- | --- | --- | --- | --- |
| `measurable_deFinettiEquiv` (9.5) | α = Unit; α = Bool, cylinders `{x₀=1}`, `{x₀=x₁=1}`; proof at pins | Unit: one point each side. Bool: `δ_{Ber(1/2)}` ↦ 1/2, 1/4; `½δ_{δ₀}+½δ_{δ₁}` ↦ 1/2, 1/2; five-line proof elaborates | measurable (join ∘ map) | true | C01 |
| `measurable_deFinettiEquiv_symm` (9.5) | α = Unit; α = Bool | Bool: inverse is the Hausdorff moment map `ρ{x₀=…=x_{k−1}=1} = ∫θᵏdπ`; source P(P(α)) standard Borel, forward map injective measurable, so image-measurable | measurable by Lusin–Souslin | true; needs Polish weak topology, absent at pins as README says | C01, N01 |
| `tendsto_iff_tendsto_mixtureExchangeableLaw` | `δ_{const(1/2+1/n)} → δ_{const 1/2}`; constant `δ_{const 1/2}` vs `½δ₀+½δ₁`; `l = ⊥` | masses `1/2+1/n → 1/2`, `(1/2+1/n)³ → 1/8`; second: LHS false (T2), RHS fails at k=3 (1/8 vs 1/2); `⊥`: both true | iff | true: continuous injection, compact T2 source, Hausdorff target, hence inducing; holds for every filter | none |
| README: `mixtureExchangeableLawEquiv` is a homeomorphism | marginal topology | `CompactSpace`, `T2Space (ProbabilityMeasure GraphonSpaceI)` both synthesize; `ExchangeableGraphLaw.ext` by `law k`; finite carrier so singleton masses determine `law k` | homeomorphism; filter form equivalent | true | C01 |
| Check 1 of 9.5 | constant graphon p | `law 2 {⊤} = p`; `law 3 {⊤} = p³ = 1/8` at p = 1/2 | p; 1/8 | true | none |
| Check 2 of 9.5 | `½δ₀+½δ₁` | `law 2 {⊤} = ½·0+½·1 = 1/2`; `law 3 {⊤} = 1/2` vs 1/8 | k = 2 does not separate, k = 3 does | true | none |
| "The pins lack that standard Borel instance" | synthesis of `StandardBorelSpace (ProbabilityMeasure α)`; text search both pins | synthesis fails; 0 declarations | lacking | true | C01 |
| *Needs:* names of 9.5 | opened at pins | `deFinettiEquiv` (DeFinetti/Correspondence.lean:104), `mixtureExchangeableLawEquiv` (ExchangeableGraphLaw/Correspondence.lean:68), `mixtureExchangeableLaw_law` (Mixture.lean:158), `probabilityMeasureCode_injective` (Coding.lean:129), `Measurable.measurableEmbedding` (Polish/Basic.lean:883), compactness (Mathlib Prokhorov.lean:176) | exist as cited | resolve | C01 |
| Ownership sentence, line 1696 (affected) | against 9.5 | 9.5 plans structured forms of two representation theorems | "representation theorems … retain their existing owners" | out of date | C02 |
| Headline: zero–one law (untouched) | `∃x∃y Adj`; "some isolated vertex" | `1−(1−p)^{C(n,2)} → 1`; `≤ n(1−p)^{n−1} → 0` | `𝟙[R⊨φ]` = 1; 0 | consistent | none |
| 5.2 sentence (untouched) | variable type in a higher universe | definition quantifies over `Type` | "every formula" | wording broader | N02 |

- Source locators checked against a text: 0 (9.5 cites none; no locator is changed).
- Library declarations opened at the pins: 14 (those in the table and in C01, plus `ExchangeableGraphLaw` at `ExchangeableGraphLaw/Defs.lean:79`, whose `law k` is a `Measure`, so the masses are in `ℝ≥0∞`).
- Cross-roadmap citations resolved: Exchangeability and DenseGraphLimits (both completed, links resolve); neither plans the 9.5 statements.
- Automatic checks: all passed; supplier order `0 problem(s)`.
- Elaboration: exit 0, 78 `sorry` warnings only; one-tactic probes close none of the three new theorems; the multi-step proof of the forward half elaborates (C01).
- Pull-request text: the RandomGraphs bullet (new §9.5, three declarations) and the count of sixteen roadmaps agree with the head.

Overlap check: read Exchangeability and DenseGraphLimits (completed, and DenseGraphLimits at its open revision), and searched `main` and the open heads, including SaturationAndQuantifierElimination, Forcing, QuasirandomGraphs, FreeGroupsAndLimitGroups, InfinitaryLogic, CountableStructureSpaces and CountableModelCounting, for the measurability of the de Finetti correspondence, a standard Borel Giry space and a topology on exchangeable graph laws; nothing shared. The 9.5 objects are owned by RandomGraphs through this change.

Source independence: changed passages only; 7 passages (two paragraphs of 9.5, two Checks, three docstrings) compared with the pinned Tau Ceti docstrings of `deFinettiEquiv` and `mixtureExchangeableLawEquiv`, the only texts 9.5 rests on, none shared beyond formulas and standard names; 9.5 adds no locator, so the shares are as on `main`; the diff adds, removes and reorders no layer, so the arrangement was not compared.

Research link: the principal theorem is the graph case of the Glebskii–Kogan–Liogon'kii–Talanov/Fagin zero–one law (README summary). Section 9.5 adds measurable and topological forms of the de Finetti and Diaconis–Janson (2008, §5) representations; this rests on the README and the pinned Tau Ceti docstrings.

## Not verifiable

- Kechris 1995, Theorems 17.23–17.24 (Polishness of the weak topology and its Borel σ-algebra): not cited by the README and not opened; named only through the pinned Tau Ceti file.
- The locators of untouched sections in the sample (Layers 0–8, 9.1–9.2, 11): not reopened, the change does not affect them.

Automatic checks set aside as false positives: the lead that four backticked names occur nowhere (they are this roadmap's own declarations, declared in `Suggested.lean`); the lead that seven graphon theorems lost a section binder (untouched declarations; the three new theorems use no section variable).

## Source issues

- none

## For the human reviewers

- **Scope (placement).** 9.5 (README lines 1226–1256; `Suggested.lean` lines 889–897) places two theorems on Exchangeability's de Finetti correspondence over any standard Borel space, with the standard Borel Giry space, in this graph roadmap; neither mentions a graph. Exchangeability is completed and has no Part II.
