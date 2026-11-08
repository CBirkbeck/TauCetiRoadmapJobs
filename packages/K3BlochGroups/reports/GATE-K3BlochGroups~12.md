# GATE-K3BlochGroups~12: answers to human review

One comment needs an answer: roed-math, 2026-11-06T06:18:42Z, on head `12c408e`. It is a cross-PR overlap note that makes one point (H01). It requests no change.

## H01 (roed-math) — applied differently

README lines 17 and 2289 no longer say which downstream roadmap owns the weight-two Bloch–Wigner/Borel comparison and its analytic scalars. Both lines now name Polylogarithms Layer 2 and PadicHodgeRegulators §4.7 as the consumers that evaluate this roadmap's Suslin map, and say the comparisons and scalars belong to those two consumers. Both lines are therefore correct however the two roadmaps divide the work, so they need no later edit.

- Line 17, old: "…Polylogarithms Layer 2 constructs the descended real regulator and compares it with the Borel regulator, and its Layer 4 uses the rational-curve presentation of §4.21."
- Line 17, new: the same sentence, with "PadicHodgeRegulators §4.7 evaluates the complex regulator on Suslin's Bloch classes" added, followed by "Those weight-two regulator comparisons and their analytic scalars belong to these consumers, not to this roadmap."
- Line 2289, old: "…the analytic scalars belong there. PadicHodgeRegulators and HabiroNumberFields are anticipated consumers of the integral maps, finite-field conventions and finite-coefficient comparison; no section-specific contract is asserted for them."
- Line 2289, new: it gives PadicHodgeRegulators' actual contract:
  - §§3.1, 3.3–3.6;
  - §§4.12–4.14, 4.20 and 6.6, for the complex-regulator evaluation;
  - §§6.3–6.6, for the local K₃ calculation.

  It then says "The weight-two regulator comparisons and their analytic scalars belong to these two consumers; this roadmap supplies them only the algebraic maps that those comparisons evaluate."

**Evidence for the reviewer's facts** (all confirmed):
- Polylogarithms at `fc000435`, `TauCetiRoadmap/Polylogarithms/README.md`:
  - §2.1 (line 138) defines `blochWignerDesc`.
  - §2.3 (line 191) proves `weightTwoRegulator_borel` and `borelCalibration_two`.
  - The README never mentions PadicHodgeRegulators.
- PadicHodgeRegulators at `b4b7727a`, `TauCetiRoadmap/PadicHodgeRegulators/README.md`:
  - Line 7 claims single ownership of the Suslin–Bloch–Wigner evaluation and κ₂, with Polylogarithms §2.3 consuming them.
  - §4.7 (lines 1030–1061) states `reg_σ(s_F⁻¹ b) = κ₂·Σ n_i P₂(σx_i)` and routes it through K3BlochGroups §§4.12–4.14 and 4.20.

**Why this roadmap is unaffected.** In `ORDER.txt`, K3BlochGroups is at line 128, Polylogarithms at 288 and PadicHodgeRegulators at 309. Both claimants are therefore consumers here, and nothing in this roadmap uses a regulator or a scalar.

**For the coordination between #1424 and #1498.** Under the current order, the arrangement in PadicHodgeRegulators line 7 has Polylogarithms (288) consuming from PadicHodgeRegulators (309). That is an upward edge unless the order or the ownership changes.

**Same pattern elsewhere in the README**, repaired in the same commit:
- Line 2017 (Layer 5 Dependencies) said "Downstream, Polylogarithms Layer 2 consumes these maps for its regulator comparison; PadicHodgeRegulators is an anticipated consumer". Neither consumer cites any K3BlochGroups Layer 5 section:
  - Polylogarithms cites Layers 3–4, §§3.3, 3.6–3.7, 3.13–3.16, 4.21 and Layer 6.
  - PadicHodgeRegulators cites §§2.3, 3.x, 4.12–4.14, 4.20 and 6.3–6.6.
  
  The sentence is deleted.
- Line 17's sentence "No regulator, dilogarithm or Habiro comparison is used to prove anything in this roadmap" now ends "; the interval Rogers function enters only through the real detector of §5.8". To make the README agree with that, the *Needs* lines of §§5.1–5.7 (lines 1749, 1800, 1833, 1883, 1924, 1947, 1965) change from "the finite-field, arithmetic and interval Rogers contracts" to "the finite-field and arithmetic contracts". None of those sections uses L, ρ or π² in its statement or route; the §5.8 *Needs* line (2009) keeps the Rogers contract.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values found | Result | Change |
|---|---|---|---|---|
| L17: Polylogarithms Layer 2 constructs the descended regulator and compares it with Borel's | Polylogarithms at `fc000435` | §2.1 line 138: `blochWignerDesc`, `[z]₂ ↦ D(z)`; §2.3 line 191: `weightTwoRegulator_borel`, `borelCalibration_two` | true | kept |
| L17: PadicHodgeRegulators §4.7 evaluates the complex regulator on Suslin's Bloch classes | PadicHodgeRegulators at `b4b7727a` | heading line 1030; line 1036: `reg_σ(s_F⁻¹ b) = κ₂·Σ n_i P₂(σx_i)`, Borel scalar −2κ₂ | true | added |
| L17/L2289: the comparisons and scalars belong to these consumers, not here | outcome A: #1424 as written (Polylogarithms owns §2.3 and the scalar); outcome B: #1498 line 7 (κ₂ in PadicHodgeRegulators, Borel/Tate conversion in Polylogarithms) | A: owner Polylogarithms (288); B: owners PadicHodgeRegulators (309) and Polylogarithms (288); in both, K3BlochGroups (128) owns nothing | true in both outcomes; the old "belong there" fails in B | rewritten neutrally |
| L17: the Rogers function enters only through §5.8 | search for Rogers, ρ, π² and dilog in Layers 1–6 | hits: §5.8 (1967–2009), contract line 133, Layer 5 *Needs* lines, line 2017; §§5.1–5.7 bodies: 0 hits; §5.7 uses only ArithmeticKTheory and K2SymbolsBrauer §10.32 | true after the *Needs* repair; before it, 7 *Needs* lines contradicted it | 7 *Needs* lines trimmed |
| L2289: PadicHodgeRegulators consumes §§3.1, 3.3–3.6 | PadicHodgeRegulators lines 7, 61, 847, 860 | §§3.1, 3.3–3.6 (carriers, boundary, ⟨x⟩, field maps); §§3.4–3.5 transport | true | added |
| L2289: … §§4.12–4.14, 4.20, 6.6 for the regulator evaluation | lines 1032, 1036, 1061, 1078 | s_F from §§4.20, 6.6; route through §§4.12–4.14 | true; matches our §6.6: K₃(F)⊗ℚ ≃ B(F)⊗ℚ for number fields | added |
| L2289: … §§6.3–6.6 for the local K₃ calculation | lines 388, 1047, 1174–1192, 1259, 1338, 1406 | §6.3 root multiples, §6.4 localized root classes, §6.5 fibres, §6.6 snake sequence `K₃^ind(L)/p^ν ≃ B(L)/p^ν` | true | added |
| Old L2289: PadicHodgeRegulators consumes the finite-coefficient comparison | PadicHodgeRegulators line 61 | finite-coefficient Chern maps come from KTheoryFiniteLocalFields §§1.8, 6.6–6.7; no K3BlochGroups §6.7 citation | old text false | removed |
| L2289: Polylogarithms Layer 2 uses the Layer 4 map; its Layer 4 uses §4.21 and §3.12 | Polylogarithms lines 104, 108, 608; K3BlochGroups lines 123, 1709 | "Layer 4 supplies the rational Suslin comparison"; §4.21 relations are the X = ℙ¹ case of §3.12 | true | "of Layer 4" added |
| Deleted line-2017 sentence: Polylogarithms Layer 2 consumes Layer 5 maps | every K3BlochGroups citation in both consumers | 0 citations of §§5.1–5.8 in either | false | deleted |

## Other checks

- **Lean.** `Suggested.lean` is unchanged. The 13 elaborated signatures in the job's signature file still apply, and that file flags 0 dropped section binders. Because no declaration changed, I did not rerun `#check @name`. README and Lean still agree: the gate reports `readme-ids-missing=0`, and `roadmaps resolve` finds no unresolved citation or Lean name.
- **Ownership.** No construction was added; the edits change only descriptions of downstream consumers.
  - Consumer contracts were read at the given heads: Polylogarithms (`fc000435`), PadicHodgeRegulators (`b4b7727a`), BorelRegulators (`44ba1943`), HabiroNumberFields (`84e120a0`), EllipticKTheory (`356badff`) and HabiroNahmSeries (`d526e66e`).
  - BorelRegulators does not cite K3BlochGroups.
  - No notion moved down from a later roadmap.
- **Observations outside this point, not edited:**
  - EllipticKTheory at `356badff` cites only K3BlochGroups §§2.1, 2.2 and 2.5, while line 2289 also lists §4.20 as an anticipated use.
  - HabiroNumberFields at `84e120a0` declares a section-specific contract (§§3.12–3.16, Layer 4, §§5.4–5.5, §§6.3–6.7) and a "gap:bloch-foundations" request for a B_old(𝔽₂)/3 ≃ K₃(𝔽₂)/3 comparison. Line 2289 still calls it an anticipated consumer with no section-specific contract.
- **Sources.** No source was cited or read for this point. `needs-references.toml` is not needed.
- **Suspicious text.** None. The comment contains links and claims only.

## Build and gate

Commit `c9ca3118` "K3BlochGroups: review repairs (ownership-neutral regulator consumers, exact PadicHodgeRegulators contract, Rogers needs)". One file changed: `TauCetiRoadmap/K3BlochGroups/README.md`. Not pushed.

`lake build TauCetiRoadmap.K3BlochGroups.Suggested`: `Build completed successfully (8976 jobs).` The only warnings are the expected `declaration uses 'sorry'` at Suggested.lean lines 40, 95, 108, 120, 133, 145, 157 and 170.

Gate after the commit:

    gate K3BlochGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Depcheck (`--movable`), after the edits:

    depcheck: 241 roadmaps, 2362 edges, 0 problem(s)

There was no UPWARD, CYCLE or moved line.
