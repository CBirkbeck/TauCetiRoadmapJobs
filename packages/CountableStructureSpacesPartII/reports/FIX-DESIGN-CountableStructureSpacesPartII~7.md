# FIX-DESIGN-CountableStructureSpacesPartII~7

Repair of the design (`packages/CountableStructureSpacesPartII/design/README.md`, `design/plan.json`,
`sources.toml`) against the two findings of REV-DESIGN-CountableStructureSpacesPartII~6. Both
findings are right; both are applied. No `Suggested.lean` exists at the design stage, so no Lean
file was changed and no elaboration or `#check` inventory applies.

## F01 (P3) — applied

Verified: paolini-shelah-tfab line 83 opens Definition 1.4, Borel reducibility between equivalence
relations on two standard Borel spaces (lines 83–87); the induced Borel structure on a class is
Fact 1.1 (lines 56–58) and lines 65–68 (a class as a standard Borel space, relations as subsets of
its square); Definition 1.6 names the isomorphism relation on a class (lines 95–96).

Change. README 0.1: "Definition 1.4, line 83" → "Fact 1.1, lines 56–58, and lines 65–68 …;
Definition 1.6, lines 95–96, and camerlo-gao-boolean lines 106–110 …". Plan 0.1 locator likewise.
Definition 1.4 (lines 83–87) moved to Convention 2, where Borel reduction between classes is
introduced. Manifest locator gains Fact 1.1 and lines 65–68; `cited_for` gains "Conventions".

Pattern search: "line 83" / "Definition 1.4" occurred only at README 0.1 and plan 0.1 (and the
manifest locator list, now `lines 83-87`). No other locator in the design cites line 83.

## F02 (P3) — applied

Verified: the proof given never uses symmetry or irreflexivity (computations below). The review
names plan targets 3.5, 3.8, 3.11; in the plan the affected targets are 3.4 (`unravel_iso_iff`),
3.7 (`exists_continuous_reduction_graphClass_linearOrderClass`) and 3.11 (`borelComplete_treeClass`);
3.5 and 3.8 (`linearOrderClass`, `borelComplete_linearOrderClass`) needed no change.

Change. 3.2: "for `c, d ∈ graphClass`" → "for all codes `c, d : RelationalConfiguration
Language.graph ℕ`", plus a directed-pair/loop Check. 3.3, 3.4: reflection "for `c, d ∈ graphClass`"
→ "for all codes", the `graphClass` headlines kept as restrictions. 3.3: "depends on two colours" →
"at most one colour, that of the common block". Plan 3.4, 3.6, 3.7, 3.10, 3.11 likewise.

Details: 3.2's (i) ⇒ (ii) step writes `d = σ • c` and cites `eval_perm_smul` (added to *Needs:*);
3.4's continuity remark now also covers tag nodes of distinct `x`, `y` (incomparable). Plan: new test
`directed_codes` (3.4), API `blockOrder_continuous` corrected and `blockOrder_iso_iff` added (3.6),
`tagTree_continuous` completed and `tagTree_iso_iff` added (3.10). The fourth Checks of 3.3 and 3.4
are kept unchanged (instances of the wider statement).

Pattern search: Layer 2.3 already states its coding for all codes of `L'` (continuous on the whole
space, reflects and preserves isomorphism, then restricted to `K'`), so Layer 3 now matches it. 3.5 (b)
(cover graph) correctly stays on `treeClass`: off `treeClass` the cover graph does not determine the
order. 2.2 keeps triangle-freeness, which its third Check shows necessary.

The montalban-cst1 remark in 3.2 now says the source proves the steps for an arbitrary structure
(montalban-cst1 lines 4205–4211: tuples without repetitions of any structure, labelled by atomic
diagrams), which supports the wider statement.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result; change |
| --- | --- | --- | --- |
| 0.1 locator | paolini-shelah-tfab lines 56–58, 65–68, 83–87, 95–96 | 56–58: induced Borel structure on a Borel subset; 65–68: class as standard Borel space, relations ⊆ K′ × K′; 83–87: `E₁ ≤_B E₂` between two spaces; 95–96: `≅₁` on a class `K₁` | cites the definition it supports; applied |
| Convention 2 locator | Tau Ceti `Setoid.BorelReducible` (`SetTheory/Descriptive/BorelReducibility.lean:100`) | measurable `f : X → Y` with `E x y ↔ F (f x) (f y)`; the source's version has standard Borel spaces | agrees, wider carrier stated; added |
| 3.2 (i) ⇒ (ii), all codes | `c` = only `adjAtom 0 1`, `d` = only `adjAtom 1 0`, `τ = (0 1)` | `(τ • c).eval (adjAtom u v) = c.eval (adjAtom τu τv)`: true iff `(u, v) = (1, 0)`, so `d = τ • c`; node `[1/2, 1]`: `ν(1/2) = 1`, `ν(1) = 0`, `a = (1, 0)`; image node `a = (0, 1)`; bits at `(1, 0)`: `c.eval (adjAtom 0 1) = T`, `d.eval (adjAtom 1 0) = T`; at `(0, 1)`: F, F; diagonals F, F; entries distinct on both sides | colours equal; holds off `graphClass`; new Check |
| 3.2 (iii) ⇒ (i), all codes | loop code (`adjAtom 0 0` only) against the empty graph | `a([1]) = (0)`; colour (length 1, diagonal T) at `[1]`; empty graph: diagonal F at every length-1 node | no colour-preserving `Ψ`, codes not isomorphic (loop at 0 against none); consistent; in new Check |
| 3.2, loops of different counts | `c` loops at `{0}`, `d` loops at `{0, 1}` | length 1: both colours (1, T) and (1, F) occur densely in both; length 2: `d` has a node with two distinct looped entries (`ν = 0, 1`), `c` has none (only vertex 0 loops) | (ii), (iii) fail, (i) fails; consistent; none |
| 3.2 parent preservation one way | bijection `Ψ` preserving parents forward, colours preserved | colours fix lengths; for `y` a child of `Ψ x`, `z = Ψ⁻¹ y` has length `|x| + 1`, its parent `p` has `Ψ p` = parent of `y` = `Ψ x`, so `p = x` | back step needs only forward preservation plus lengths; none |
| 3.2 tuple system, atomic types | Tau Ceti `SameAtomicType` (`BackAndForth/AtomicType.lean:82`), `sameAtomicType_iff` | equality pattern and `RelMap adj (a ∘ f)` for every `f : Fin 2 → Fin n`, diagonal included: exactly what `χ` records | no simple-graph hypothesis needed; none |
| 3.3 continuity remark | `χ_c(x) = 0` against `4`; points `(x, 0)`, `(x, 5)`; `(x, n)` against `(y, m)`, `x ≠ y` | `χ = 0`: threshold 2, `5` in the ω-part, `(x, 5) < (x, 0)`; `χ = 4`: threshold 6, both in the finite part, `(x, 0) < (x, 5)`; distinct blocks: bit `[x < y]`, no coordinate of `c` | at most one colour; "two colours" corrected |
| 3.3 reflection, all codes | constant-true code against the complete graph; directed pair above | finite classes of length-1 blocks: size `χ + 2` with diagonal T against diagonal F, sizes differ, images not isomorphic, codes not isomorphic; directed pair: `Φ` of the 3.2 Check extended block by block | both directions hold off `graphClass`; stated for all codes |
| 3.4 continuity remark | `([0], some 1)` against `([0], some 2)`; `([0], some 1)` against `([1], some 1)` | `χ_c([0]) ≥ 1`: `1 ≤ 2 ≤ χ + 1`, comparable; `χ_c([0]) = 0`: `2 > 1`, leaf, incomparable; distinct `x`: incomparable for every `c` | remark completed with distinct `x`, `y` |
| 3.4 reflection, all codes | constant-true code against the complete graph; heights | height above `([1], some 0)`: `χ + 2`, `χ` with diagonal T against F, heights differ; for `χ = 0` height 2 (`(x, some 0) < (x, some 1)`), `χ = 1` height 3, as the first Check | both directions hold off `graphClass`; stated for all codes |
| 3.7, 3.11 headlines | restriction to `graphClass` | general reflection restricted to `c, d ∈ graphClass` gives the stated `↔`; 2.3 (`borelComplete_graphClass`) and transitivity give `BorelComplete` | unchanged headlines, now named as corollaries |

## Checks

- Dependency check (`gate`), after the edits:

```text
candidate: CountableStructureSpacesPartII is not in the merge order yet; checked as if placed after NoncompactQuantumSymmetry (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2230 edges, 0 problem(s)
```

  No UPWARD or CYCLE line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- `plan.json` parses; its formatting is unchanged (1-space indent).
- No `Suggested.lean` at the design stage: no elaboration, `#check` inventory or binder comparison
  was run, and none is claimed.
- No gate failure was listed for this round.

## For the maintainer

- No name that another roadmap cites changed: `roadmaps grep` for `unravel_iso_iff`,
  `exists_continuous_reduction_graphClass_linearOrderClass`, `borelComplete_linearOrderClass`,
  `borelComplete_treeClass` finds no use on main or at any open head. Headline names are unchanged;
  the new plan API entries `blockOrder_iso_iff` and `tagTree_iso_iff` are internal to the plan and
  carry no backticked name in the README.
- No new object, supplier or gap was introduced; ownership is unchanged (the generalised
  statements are this roadmap's own Layer 3 targets). No source was fetched or requested; the
  manifest's paolini-shelah-tfab entry gained two locators and one `cited_for` item.
