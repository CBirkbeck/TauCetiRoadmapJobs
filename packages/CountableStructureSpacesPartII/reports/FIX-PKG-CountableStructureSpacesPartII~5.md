# FIX-PKG-CountableStructureSpacesPartII~5

This round repairs the two findings of `REV-PKG-CountableStructureSpacesPartII~4`. Both are P3.
I checked each one against the README, the manifest and the base roadmap, and applied both as the
review asked.

Files changed:
- `packages/CountableStructureSpacesPartII/README.md` (one contract line, two physical lines);
- `packages/CountableStructureSpacesPartII/sources.toml` (one field).

Files unchanged:
- `Suggested.lean` (byte-identical to the reviewed head);
- `metadata.toml`;
- `design/plan.json`: no supplier gap is needed, so `gaps = []` stays.

No mathematical statement, hypothesis, Lean name or Check changed.

## REV-PKG-CountableStructureSpacesPartII~4/F01 (P3) — applied

Changed: README, supplier contract "From TauCetiRoadmap.CountableStructureSpaces", Layer 0 entry:
"(Checks of 1.2 and 2.3)" → "(the API of 2.3 and its third Check)".

Verification. The finding is right. Closedness of `graphClass` is used in two places:
- **The first API bullet of 2.3:** "it is measurable … and closed (CountableStructureSpaces
  Layer 0 …)".
- **The third Check of 2.3:** membership depends only on the atoms `adjAtom i i`, `adjAtom i j` and
  `adjAtom j i`, so `graphClass` is an intersection of clopen sets.

The four Checks of 1.2 do not use it:
- `BorelComplete ∅` uses no graph class.
- The `P_i` Check is about a closed class in another language.
- The `K ∪ K₂` Check uses only that `graphClass` is Borel complete and invariant.
- The renaming Check uses only Borel completeness of the image.

The Dependencies already agree with the repaired line. Layer 1 lists no base Layer 0. Layer 2
lists "CountableStructureSpaces Layer 0 (closedness of `graphClass`)".

Pattern search. I checked every other where-used clause in the supplier contracts against the uses
it names:
- **Mathlib `FirstOrder.Language.ring`, `Theory.field`, `Theory.fieldOfChar`, "used only in the
  Checks of Layer 1.3":** the only use is the fourth Check of 1.3 (`Theory.fieldOfChar 2`). Correct.
- **Mathlib `equiv_between_cg`, "used for the coloured Cantor theorem":** the only use is 3.1.
  Correct.
- **Base Layer 6.2, "used in Checks of Layers 0.2, 3.3 and 6.4":** the uses are the third Check of
  0.2, the third Check of 3.3 (`exists_mem_wellOrderClass_type_eq`) and the `wellOrderClass lt`
  Check of 6.4. Correct.

The other contract entries carry no where-used clause:
- base Layer 1.2;
- base Layer 4.4;
- base worked example 2;
- NoncompactQuantumSymmetry.

The Scope line ("closedness of the set of simple-graph codes (Layer 0)") names the base layer and
not a use, so it needed no change.

The citation resolves at the base's open head. CountableStructureSpaces Layer 0 lists "closedness
of the range of the graph coding" among the items still to build. Its graph-coding bullet describes
the range as "the closed set of codes of symmetric irreflexive relations".

## REV-PKG-CountableStructureSpacesPartII~4/F02 (P3) — applied

Changed: `sources.toml`, entry `montalban-cst2`: `locator_scheme = "section"` →
`locator_scheme = "theorem"`. Nothing else in the entry changed.

Verification. The finding is right. Every locator of the entry is a numbered statement: Lemma
II.37, Lemma II.38, Corollary II.39 and Lemma XI.2. Every README citation of the work is too: the
Scope cites Lemma XI.2, and 6.1 cites Lemma II.37 and Lemma II.38 with Corollary II.39. None is a
section.

Pattern search over all eleven entries. A scheme that matches none of the entry's locators occurs
only here:
- **`montalban-cst1` (`theorem`):** Lemma VI.18, Theorem VI.27. Consistent.
- **`kechris-cdst`, `hjorth-kechris-1996`, `mekler-1981` (`section`):** every locator is a section.
  Consistent.
- **`gao-idst`, `becker-kechris-1996` (`chapter`):** every locator is a chapter with its sections.
  Consistent.
- **`paolini-shelah-tfab` (`theorem`):** Facts, Definitions and a Remark, all numbered statements,
  plus the Main Theorem. Consistent.
- **`becker-kechris-bams`, `camerlo-gao-boolean` and `friedman-stanley-1989` (`theorem`):** these
  mix numbered theorems with sections or line ranges, and each contains at least one theorem
  locator (Theorem 2.1 and Corollary 2.2; Theorem 1; Theorem 1). The one field cannot name both
  schemes, so `theorem` is not a mismatch. I left these entries unchanged. `friedman-stanley-1989`
  is settled as uncertified, and its locators stay as recorded.

## Adversarial pass on the touched passages

No statement changed. The pass covers the mathematics that the changed contract line describes,
and the uses it names.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.3 API: `graphClass` closed | `graphClass = ⋂ᵢ {c \| ¬ c.eval (adjAtom i i)} ∩ ⋂ᵢⱼ {c \| c.eval (adjAtom i j) ↔ c.eval (adjAtom j i)}`; empty code; code with `adj(0,0)`; code with only `adj(0,1)` | each set depends on 1 or 2 coordinates, so it is clopen (`isClopen_setOf_eval`), and the intersection is closed; the empty code lies in every set; `adj(0,0)` fails the `i = 0` set; `adj(0,1)` without `adj(1,0)` fails the `(0,1)` set | closed; matches the base's description of the range | contract names this use |
| 2.3 third Check | the codes `c_n` with the single true atom `adjAtom 0 n`, `n ≥ 1`, as `n → ∞` | none of the `c_n` is symmetric, so none is in `graphClass`; the limit is the empty code, which is in `graphClass`; so `graphClass` is not open, and closed is the right claim | Check uses closedness | contract names this use |
| 1.2 Checks (claimed use) | `∅`; `P_i ∈ {∅, ℕ}`; `K ∪ K₂` with `K = graphClass` and `K₂` the empty graph's orbit; renaming `adj` | no map into `∅`; `2^ℵ₀` classes against `ℵ₀` for one predicate; `K ∩ K₂` is one orbit, with no closedness used; renaming transports Borel completeness through `LEquiv.onConfiguration` | no use of closedness of `graphClass` | removed from the contract |
| 6.4 proof (possible hidden use) | `MeasurableSet.analyticSet_image` on `graphClass` | needs only `graphClass` measurable (`measurableSet_setOf_isSimpleGraph`) and a second-countable target | measurability, not closedness | none |
| Layer dependencies | Layer 1, Layer 2 | Layer 1 lists base Layer 1.2 only; Layer 2 lists base Layer 0 | agree with the new contract line | none |
| `montalban-cst2` scheme | its four locators; its three README citations | 4 of 4 are lemmas or corollaries; 3 of 3 citations are Lemma XI.2, Lemma II.37, and Lemma II.38 with Corollary II.39 | `theorem` matches all | applied |

## Checks run

- **Elaboration.** I ran `lake env lean` on `packages/CountableStructureSpacesPartII/Suggested.lean`
  from the content checkout. No error. There are 15 warnings, all "declaration uses `sorry`", at
  lines 69, 95, 102, 107, 128, 138, 144, 151, 160, 173, 182, 190, 197, 204 and 217. No `TauCeti.*`
  module needed building.
- **Binders.** `Suggested.lean` is unchanged, and it has no `variable` or `include` line. The
  worker's elaborated signatures of the 22 declarations, taken at this head, show no lost binder. I
  did not write a new `#check @name` file, because no declaration changed.
- **Dependency direction.** Output of the gate's depcheck:

      depcheck: 244 roadmaps, 2236 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line.
- **Gate failures listed in the brief:** none.

## For the maintainer

- No name that other roadmaps cite changed. No id was dropped or renumbered.
- No supplier gap was added. No notion moved down from a later roadmap.
- Ownership: this round adds no object, so no new ownership question arises. The contract line
  still cites CountableStructureSpaces Layer 0, at its open head (another author's new roadmap),
  where closedness of the range of the graph coding is listed as a target.
