# Review of PotentialModularityAndCompatibleSystems (pull request #1075 at 62af310)

**Verdict:** accepted

Incremental re-review of the 16 lines changed since `5a6a670`, and of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: README line 546 reads "Those reductions are stated for both kinds of base; over a number-field base they are steps of the supplier's target and are not proved again here"; §§2.3, 2.6, 2.7 *Needs:* now cite only geometric-base inputs.
- R02 — repaired: the description reads "`Suggested.lean` states one theorem and no definitions: additive strong approximation away from one place of a number field (§2.5a). Its module docstring names the headlines consumed from ClassicalSerreModularity I.0 and DeformationAndDerivedPatchingAlgebra §3.5".
- R03 — repaired: the description reads "red-team and review repairs are applied on this branch, the review repairs with Claude (Fable 5.1 and Opus 5.5)"; the commit trailers of `56ec9b71`, `d54b60dd`, `5a6a6707`, `62af3108` agree.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §2.7 unit quotient `K_Σ^×/R^×`, number-field base (changed sentence, line 682) | `K = ℚ`, `R = ℤ[1/2]`, `S∞ = {∞, 2}`; `Σ = {∞}`, then `Σ = S∞` | `ℝ^×/⟨−1, 2⟩ ≅ ℝ_(>0)/2^ℤ`, a circle; for `Σ = S∞` the map `(x, y) ↦ ‖x‖·‖y‖₂` is onto `ℝ_(>0)` and kills `⟨−1, 2⟩` | compact exactly under incompleteness; the supplier's idèle-class compactness covers it | none |
| §2.7 unit quotient, geometric base (changed sentence) | `K = 𝔽_q(t)`, `R = 𝔽_q[t, 1/t]`, `S∞ = {0, ∞}`; `Σ = {0}`, then `Σ = S∞` | `K_0^×/⟨𝔽_q^×, t⟩ ≅ O_0^×/𝔽_q^×`, compact; for `Σ = S∞` unit valuations `(n, −n)` have rank 1 in `ℤ²` | compact for proper `Σ`, not for `Σ = S∞`; no number-field S-unit input is used | none |
| §2.3 *Needs:* (changed, line 597) | `R = 𝔽_q[t]`, `T = {(t)}`; an elliptic affine model, `T = {P}` | `B \ T = Spec 𝔽_q[t, 1/t]`; `Cl(R) ≅ E(𝔽_q)` finite, `nP = div(f)`, `B \ {P} = D(f)` affine | AlgebraicCurves Layer 3 (divisor sequence) and Layer 5 (`Finite Cl⁰(F)`, affine bridge) supply exactly this | none |
| §2.6 *Needs:* (changed, line 676) | consumers of the two forms of §2.5a | §2.8 (line 722) consumes §2.6 over a geometric base only; the function-field form is the pinned declaration | dropping the number-field name loses no edge | none |
| §2.5a Lean headline (docstring changed, statement not) | `K = ℚ`: `w = 2`, `S = ∅`, `T = {∞}`, `V = (1/4, 3/4)`; `w = ∞`, `S = {3}`, `U = 1 + 3ℤ₃`, `T = ∅` | `x = 1/2`, integral at every odd prime; `x = 1`, integral everywhere | true as stated; the docstring's "of a number field" equals the signature `[NumberField K]` | none |

The rows for the untouched statements stand as in the previous review, of `5a6a670`.

- Gate, re-run at `62af310`: every counter 0, `OK` (the worker's run adds `build=0`). Dependency check: `depcheck: 246 roadmaps, 2273 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file changed outside the folder; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- Elaboration: `lake env lean` on a scratch copy with `#check @additiveStrongApproximationAwayFromPlace`: `sorry` the only warning; the elaborated type keeps `[Field K] [NumberField K]`, `w`, `S`, `T`, `hS`, `hT`, `harch`, `U`, `V`, `hU`, `hV`, as README §2.5a states. The statement is unchanged since `5a6a670`, where the one-tactic probe failed. `signatures.md`'s declaration "over" is the docstring's word "theorem over" (line 15), not a declaration.
- Library at the pin: `TauCeti/FieldTheory/FunctionField/Consequences/StrongApproximation.lean` line 88, `exists_forall_mem_valuation_sub_le_and_forall_mem_integers`, the function-field form §2.6 now cites alone; no number-field strong approximation in the pinned Tau Ceti.
- Cross-roadmap citations resolved this round: AlgebraicCurves Layers 3 and 5 on main (README lines 520, 624, 673–690: `Finite Cl⁰(F)` and the affine bridge); ClassicalSerreModularity `I.0/moret-bailly-split-points` at its open head (README lines 402, 404: "the relative Picard and idèle-class compactness … are part of this target"). HeightsAndUnits is cited nowhere in the README after its removal from §2.7 and the Layer 2 Dependencies; GlobalNumberFields remains a Layer 2 supplier (the *Needs:* lines 666 and 813).
- Seeded sample: of its fifteen targets (1.3, 1.6, 1.7, 1.11, 2.8, 2.14, 3.5, 5.1, 8.3, 9.2, 10.1, 10.11, 12.2, 12.3, 13.3) none lies in a changed passage; §2.8 is cited by the changed line 546 and its *Needs:* (line 722) agrees with it. No source locator changed.
- Description checked against the head, sentence by sentence: the folder with its three files, a roadmap not on main (the change against the base: 2187 insertions, no deletion), "consumed over number fields from ClassicalSerreModularity I.0 and proved here over global function fields" (lines 546, 716–718), Layer 8 (headings 8.3–8.6), the six consumers (line 1963), the one Lean theorem and its docstring, the validation counters (the gate); the summary block agrees with the headings it names. Nothing contradicted, no change left unstated.
- Overlap check: read ClassicalSerreModularity, GL2ModularityLifting, PotentialAutomorphyInfrastructurePartII, ModularityAndLanglandsExtensions, PotentialAutomorphyInfrastructure; shared object: the integral-point theorem over a number-field base with its reductions, owner ClassicalSerreModularity I.0, cited here; the geometric base, §2.15, §§8.3–8.6 and Layer 1 are owned here and the others cite them.
- Remark: after this change no section of this roadmap consumes the number-field form of §2.5a (the single Lean statement); it stands as a library theorem of its own, and no other roadmap states it.

Source independence: 5 passages compared (changed passages only: the Layer 2 introduction, the *Needs:* lines of §§2.3, 2.6 and 2.7, the §2.7 sentence and the module docstring's clause), all statements of ownership or supply with no counterpart in a source, so with 0 sources, none shared; largest share and contents not recomputed (the diff adds, removes and reorders no layer).

## Not verifiable

- Nothing new this round; the items of the review of `d54b60d` (Thorne 2017 §7; the published page of BHKT Proposition 9.2; Larsen 1995, Sen 1973, Skinner–Wiles Duke 107, Savitt's corrigendum) are in untouched text and were not reopened.

## Source issues

- none

## For the human reviewers

- none
