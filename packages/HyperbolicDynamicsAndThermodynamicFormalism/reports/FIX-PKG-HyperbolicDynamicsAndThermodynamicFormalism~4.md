# Repair report: FIX-PKG-HyperbolicDynamicsAndThermodynamicFormalism~4

Review settled: REV-PKG-HyperbolicDynamicsAndThermodynamicFormalism~3 (one finding, P2). It is the only review, so the finding is named by its plain id. Its section "For the human reviewers" lists no finding and changed nothing.

## F01 (P2) — applied differently

The finding is right. §2.2 bullet, old → new: "ClassicalErgodicTheory's specification … implies weak specification: … segments separated by exactly the constant M …; gluing times all equal and at most M" → "On a nonempty space, … implies strong specification, with τ = M …: shadow segment j on [s_j, s_j + n_j], intervals exactly M apart; every gluing time equals M". The review's items 1 and 3 are applied, in my own wording.

Why the repair differs from the one proposed. The review's replacement sentence places the segments "separated by the constant M" and shadows a segment of length 0 "as one of length 1". Read literally, a segment of length n_j ≥ 1 then occupies the interval [a_j, a_j + n_j − 1], and the next one starts M steps after its end. That makes the gluing time M − 1, which is −1 when M = 0. M = 0 does occur: on the one-point space every M works. The review's own test uses spacing max(M, 1), which its sentence does not say.

The repair shadows each segment on the closed interval [s_j, s_j + n_j], one time longer than the segment for a map, with s_j = n_1 + ⋯ + n_(j−1) + (j − 1)M. Consecutive intervals are then exactly M apart, every interval satisfies the supplier's requirement that its left end is at most its right end (also when n_j = 0), and every gluing time is exactly M. The bullet therefore keeps the stronger claim, strong specification with τ = M, which its first sentence and the Conventions use. A second Check records the off-by-one.

Changes in `packages/HyperbolicDynamicsAndThermodynamicFormalism/README.md`:
- §2.2 definition: new sentences on the empty list (k = 0) and on segments of length 0. The empty list asks only for a point, so the empty space has neither weak nor strong specification. A segment of length 0 imposes nothing for a map (d_0 = 0). For a flow it imposes closeness at a single time (the flow d_0 is d).
- §2.2, first API bullet: rewritten as above, with the hypothesis "on a nonempty space".
- §2.2 Checks, two new bullets:
  - the empty space, where ClassicalErgodicTheory's two properties hold vacuously and weak specification fails;
  - the off-by-one: intervals of n_j times placed M apart give gluing time −1 on the one-point space with M = 0, and the interval [a_j, a_j − 1] when n_j = 0.

Evidence:
- ClassicalErgodicTheory at the head of its open pull request (`e3c5108`), `Suggested.lean`:
  - line 773 (`HasSpecification`): the conclusion is reached only through `i₀ i₁ : Fin k` and `x : Fin k → X`;
  - line 801 (`HasFlowSpecification`): the same;
  - both require `a i ≤ b i`.
- This roadmap's `HasWeakSpecification` (`Suggested.lean` line 175) and `HasFlowWeakSpecification` (line 182) ask for `y : X` at k = 0.
- A scratch Lean file copies these four definitions verbatim and elaborates at the pins with no error. It proves:
  - `HasSpecification (Homeomorph.refl Empty)` and `¬ HasWeakSpecification (Homeomorph.refl Empty)`;
  - for every flow on `Empty`, `HasFlowSpecification` and `¬ HasFlowWeakSpecification`;
  - `[Nonempty X] → HasSpecification T → HasWeakSpecification T`, and its flow version, with gluing function `fun _ => M` and points T^(−s_j) x_j (resp. ϕ(−s_j) x_j) on the intervals [s_j, s_j + n_j], with no `sorry`. The axioms are `propext`, `Classical.choice` and `Quot.sound`.

  The file is scratch only. `Suggested.lean` does not state the implication: it is a README API bullet, not a headline.

Pattern: other places where specification follows from a property that is vacuous on the empty space. Mathlib's `AddAction.IsTopologicallyTransitive` (`Mathlib/Dynamics/Transitive.lean` line 31) quantifies over nonempty open sets, so every system on ∅ is transitive. Axiom A*, (A2)–(A3) and (F2)–(F3) are also vacuous there. Repaired:
- Route paragraph: "a system transitive in forward time with hyperbolic local product structure has this weak specification" → "a nonempty system …".
- Conventions, weak-specification item: "asks for periodic shadowing points and implies weak specification (§2.2)" → "… and, on a nonempty space, implies strong and hence weak specification (§2.2)".
- §6.3 hypothesis: "for a homeomorphism f satisfying Axiom A*" → "for a homeomorphism f of a nonempty compact metric space X satisfying Axiom A*". On ∅, the first item fails: f is transitive, but there are m = 0 pieces and their permutation has no cycle. The third item fails too: there is no weak specification. A Check states this.
- §6.6, last item: "if g is transitive in forward time, it has weak specification" → "if the space is nonempty and g is transitive in forward time, g has weak specification". A Check about the flow on ∅ is added.

Left as they are, with reasons:
- §2.2, second bullet ("of a nonempty system"): now redundant, since weak specification forces a point, but true.
- §2.1, mixing implies transitivity: both are vacuous on ∅.
- §6.2, last item, and §6.6, third item (density of periodic points): true on ∅.
- §§5.2, 5.3, 6.8, 10.2–10.4 and 11.6 already assume a nonempty space. In `Suggested.lean`, the §6.8 theorems (lines 286, 302) carry `[Nonempty X]` from the section variable at line 278, and the §5.2–5.3 theorems carry it from line 204. Both are confirmed in the elaborated types.
- `Suggested.lean` is unchanged: its definitions are the README's, and no declaration states a "transitive ⇒ weak specification" or "specification ⇒ weak specification" implication.

## Checks run

- **Elaboration.** `lake env lean` on `packages/HyperbolicDynamicsAndThermodynamicFormalism/Suggested.lean`, run from the content checkout, gives no error. There are 15 warnings, all `declaration uses sorry`, at lines 194, 211, 223, 286, 302, 406, 464, 475, 539, 557, 591, 601, 617, 668 and 686. The file was not changed in this round.
- **Signatures.** All 50 declarations of `Suggested.lean` were put as `#check @name` at the end of one scratch copy of the file, which was elaborated once with no error. Each elaborated type was compared mechanically with the recorded signatures: all 50 are identical.
  - The 51st recorded entry, `of` (structure, line 29), is an artefact of parsing the module docstring.
  - The nine "looks dropped" leads are not hypotheses of any statement:
    - seven are `[MeasurableSpace X]` or `[UniformSpace X]` on definitions whose bodies do not use them;
    - `[FiniteDimensional ℝ V]` on `hadamardPerronGraph` and `[FiniteDimensional ℝ E]` on `flowUnstableSubspace` are not needed to form the graph set or the submodule.

  Nothing changed.
- **Dependency check** (output): `depcheck: 239 roadmaps, 2251 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Citations** (`roadmaps resolve` on the README): no cross-roadmap citation and no Lean name found nowhere.
- **Overlaps.** The one lead, "GeneralizedCohomology §G4.0b is defined only by an open revision", is a false positive. Main (`51d880d`) defines G4.0b in `TauCetiRoadmap/GeneralizedCohomology/README.md` at line 1082 ("G4.0b: construct smooth real manifold structures …"). No citation changes.
- **Sources.** No new source was cited. `sources.toml`, `metadata.toml` and `design/plan.json` are unchanged, and nothing was added to `needs-references.toml`.
- **Ownership.** The repair adds no construction and no declaration. It adds a nonemptiness hypothesis and two comparisons with the supplier's existing definitions, so no ownership question arises. ClassicalErgodicTheory, which supplies `HasSpecification` and `HasFlowSpecification`, is a new-folder pull request by another author. Its definitions were reread at its head.

## Adversarial pass

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §2.2 definition, k = 0 sentence | X = ∅; one-point X; X nonempty with k = 0 | ∅: the definition needs y : ∅, false (Lean); one point: y = the point, every d = 0 < δ; nonempty: any y | holds as stated | sentence added |
| §2.2 definition, length-0 segments | map with n_j = 0; flow with n_j = 0 | map: d_0 = 0 < δ, no condition (Lean: `∀ i < 0` vacuous); flow: s ∈ [0, 0] gives d(g^(N) y, x_j) < δ at one time | holds | sentence added |
| §2.2 bullet 1, maps (repaired) | X = ∅; one point with M = 0; k = 1; k = 2 with n = (3, 0); swap; full shift | ∅: supplier true, weak false (Lean). M = 0, one point: intervals [0, n_1], [n_1, n_1 + n_2] touch at n_1 = b_1 + 0 = a_2, gluing 0 = M. n = (3, 0), M = 2: s = (0, 5), intervals [0, 3], [5, 5], gap 3 + 2 = 5, p = 7, gluing 5 − 0 − 3 = 2 = M. Swap: no strong spec ⇒ no periodic spec, matches the Check's odd-p argument | holds on nonempty X; false on ∅ | hypothesis added; Lean proof in scratch |
| §2.2 bullet 1, flows (repaired) | X = ∅; n_j = 0; M = 1/2, n = (1.5, 0.2); constant-roof suspension | ∅: as above (Lean). n_j = 0: interval [s_j, s_j], admissible. n = (1.5, 0.2): s = (0, 2), intervals [0, 1.5], [2, 2.2], gap 1.5 + 0.5 = 2, p = 2.7, gluing 2 − 1.5 = 0.5 = M ∈ [0, M]. Suspension: no strong spec (§6.6 Check) ⇒ no `HasFlowSpecification`, matches the §2.2 Check on half-integer periods | holds on nonempty X | hypothesis added; Lean proof in scratch |
| The literal proposed text (spacing M, n_j times) | one point, M = 0, n = (1, 1) | intervals [0, 0], [0, 0]: gluing = 0 − 0 − 1 = −1, not in ℕ | fails | not used; Check added |
| New §2.2 Check, empty space | X = ∅, ε = 1, M = 0 | supplier: at k = 0 no `i₀ : Fin 0`; at k ≥ 1 no `x : Fin k → ∅`; weak at δ = 1, k = 0: no y | Check correct (Lean) | Check added |
| New §2.2 Check, off-by-one | one-point space, M = 0, n_j = 1 and n_j = 0 | gluing M − 1 = −1; interval [a, a − 1] violates a ≤ b | Check correct | Check added |
| Existing §2.2 Checks against the repaired bullet | swap; roof-1 suspension of the two-shift; full shift; two full shifts | swap and suspension: no strong spec, so no periodic spec by the bullet, agreeing with the Checks; full shift: strong spec τ = 2m + 1 and periodic spec, both consistent; two full shifts: no weak spec ⇒ no periodic spec | consistent | none |
| Conventions item (repaired) | ∅; one point | ∅: supplier true, strong and weak false; one point: all three true | holds with "nonempty" | hypothesis added |
| Route sentence (repaired) | ∅; roof-1 suspension of the monotone shift | ∅: transitive and (F2)–(F3) vacuous, no weak spec; monotone suspension: not transitive in forward time, so it is not a counterexample | holds with "nonempty" | hypothesis added |
| §6.3 items 1 and 3 (repaired hypothesis) | X = ∅; one point; swap; two full shifts | ∅: m = 0, no cycle, transitive (vacuous), no weak spec ⇒ both items false; one point: m = 1, a single 1-cycle, transitive, weak spec with τ = 0; swap: m = 2, a 2-cycle, weak spec τ = 1; two shifts: two fixed pieces, not transitive | holds on nonempty X | hypothesis and Check added |
| §6.3 item 3, h_top clause | ∅; one point | ∅ is finite; one point is finite; no claim of positivity | holds | none |
| §6.6 item 4 (repaired) | X = ∅; flow on a periodic orbit of period 1; roof-1 suspension of the two-shift | ∅: no fixed points, (F2), (F3) and transitivity vacuous, no weak spec; periodic orbit: gluing times in [0, 1]; suspension: gluing times in [0, τ₀ + 1] | holds on nonempty X | hypothesis and Check added |
| §6.6 item 3 and §6.2 last item (not changed) | X = ∅ | periodic points dense in ∅: closure of ∅ is ∅ = X | true on ∅ | none |
| §2.2 bullet 2 (not changed) | X = ∅ | weak specification is false on ∅, so the implication holds vacuously, and "nonempty" is redundant | holds | none |
| `Suggested.lean` §5 and §6.8 theorems (nonemptiness in scope) | elaborated types | lines 211, 223, 286 and 302 contain `[Nonempty X]` in their `#check` output | in scope | none |

## For the maintainer

- `design/plan.json` still lists the gap `sphere-bundle-embedding`, which the README no longer uses. The previous round explains why this job cannot remove it: target 9.3's `prerequisites` still name it. The review passed this to the human reviewers, and this round leaves it untouched.
- No name that another roadmap cites has changed, and no section or target id moved. ClassicalErgodicTheory is unaffected.
- On ClassicalErgodicTheory's side, not actionable here: its `HasSpecification` and `HasFlowSpecification` hold vacuously on the empty space. Its uniqueness theorems carry `[Nonempty X]`, so nothing there is false. If that roadmap ever states "specification implies transitivity" or similar API, it will need a nonempty space too.
