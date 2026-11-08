# Review of RandomGraphs (pull request #1223 at 03726dc)

**Verdict:** needs changes

🤖 Independent AI review of `TauCetiRoadmap/RandomGraphs/README.md` and `TauCetiRoadmap/RandomGraphs/Suggested.lean` at `03726dc`. Nothing in the pull request was changed. This is an incremental re-review of the 40 lines changed since `c05fb07` (the head the previous review read): the supplier row for the merged Tau Ceti random-graph work, the two targets moved into this roadmap from it, the exact decoder `boundedDecode` with its new characterization, and four docstrings. The changed passages were checked in full against the Tau Ceti files at the cited revision and against Mathlib at the pin; the rest of the review carries forward from the previous report. 13 findings, 2 of them blocking; 11 are carried from the previous review (the author declined most of them by choice), 2 are new and were introduced by the repair. The pull request touches no file outside the roadmap folder.

## R01 (P1) — The build gate still fails

**Location:** `TauCetiRoadmap/RandomGraphs/Suggested.lean:1`. **Claim:** the acceptance test builds with `sorry` as its only warning. **Witness:** the worker's gate at this head reports `build=1 FAIL` with the warning that the file "imports `Mathlib` from package `mathlib`, which is designed for use with the module system". My probe copy elaborated with exactly 55 `sorry` warnings and no error, so this is build hygiene, not a false statement; P1 follows the brief's classification of a failing build, and no acceptance is possible while the gate fails.

Re-raised: the author's reason ("no repository rule asks for it and only one of the repository's `Suggested.lean` files is a module") does not change the gate's verdict; the gate is per file and fails on this one. **Repair:** start the file with `module`, make the four imports `public import …`, delete the option in R03, and rerun the gate.

## R02 (P2) — Statable headline theorems are absent from the acceptance test, and the unstatable one is not named

**Location:** `TauCetiRoadmap/RandomGraphs/Suggested.lean:6–31` (module docstring, "not exhaustive … suggested forms"); README 376–396, 437–490, 601–616, 648–650, 666–678, 680–705, 758–777, 796–811. Unchanged since the previous review (its R03), whose list of statable, absent endpoints stands: completeness and ℵ₀-categoricity of `T_R` (`Theory.IsComplete`, `Cardinal.Categorical`, `Mathlib/ModelTheory/Satisfiability.lean:385`, 504); primeness (`ElementaryEmbedding`, `ElementaryMaps.lean:44`); `R` as the Fraïssé limit of finite graphs (`IsFraisseLimit`, `Fraisse.lean:279`); atomicity (`typesWith`, `Types.lean:68`); the unconditioned rooted limit (all ingredients already in the file); the all-rank varying-parameter law; the Milestone 8 graph properties (`cliqueFinset`, `degree`, `↪g`, `SimpleGraph.diam`); the invariant-event form and the `bind` mixture identity. Milestone 10 is not statable (no `TauCeti/ModelTheory/Infinitary` at the pin; the directory holds only `Algebra`) and the docstring does not say so.

Re-raised: the author's reason is the repository README's Prototyping paragraph ("read as suggested forms, never as an exhaustive checklist"). That paragraph governs how a reader treats the file; the review contract states what the file must contain: the headline theorems statable at the pins, each with `sorry`, and a docstring naming the ones that are not. **Repair:** as in the previous report: state each listed endpoint with its exact hypotheses, and rewrite the module docstring as "<title>: target signatures" naming Milestone 10 (infinitary syntax), vertex connectivity (`IsVertexConnected`) and the finite-diagram semantics (`firstOrderAtomicDiagram`) as not statable. Test for completeness: the triangle sentence is decided true (witness `{0, 1, 3}` in `R`: bits 0 of 1, 0 of 3, 1 of 3 are all set) and `∃x Adj(x,x)` false.

## R03 (P3) — `set_option` is forbidden

**Location:** `TauCetiRoadmap/RandomGraphs/Suggested.lean:33`, `set_option autoImplicit false`. **Witness:** gate `set_option=1`. **Repair:** delete the line; the probe copies of this and the previous review elaborate without it, with every `#check @name` type unchanged.

## R04 (P3) — Padding in the acceptance test

**Location:** `TauCetiRoadmap/RandomGraphs/Suggested.lean:155`, 163, 345, 636. Unchanged since the previous review (its R07): `hasExtensionUpTo_zero_iff` is the boundary case `d = 0` (README Convention 5; values `Fin 0` false, `Fin 1` true); `HasExtensionUpTo.mono` closes with one term (`exact fun U Z hUZ hc => h U Z hUZ (hc.trans hed)`); `exists_isQF_equivalent` closes with one term from `exists_computable_quantifierElimination`; `productGraphon_isolated_expectation` mirrors the README Check (`n = 1, 2, 3`: `1, 3/2, 7/4`). **Repair:** delete the four declarations; the README keeps each as an API bullet or Check. This is deletion, not a request to prove them in place.

## R05 (P3) — LaTeX delimiters throughout the README

**Location:** `TauCetiRoadmap/RandomGraphs/README.md:9`, 12–16, 63, 75–84 and throughout. **Witness:** gate `latex=476`, unchanged. **Repair:** Unicode prose with ASCII in code spans, display formulas as indented code blocks; keep `0^0 = 1`, `n ≥ d` and the exponent `−(n−d)δ^d` exactly, so that `B₀(0, p) = 1` still holds in the checked case `n = d = 0`.

## R06 (P3) — Pull-request numbers and process narrative

**Location:** README 106 ("merged in Tau Ceti #19595, cited at Tau Ceti revision 85f3eb5, later than this repository's pin"), 107, 143–155, 357, 376–377, 471–472, 839, 954–970; `Suggested.lean:27–30`, 149 ("Tau Ceti #19595"), 333. **Witness:** gate `prnum=1` at line 958; the change replaced one pull-request number with another at lines 106 and 967 and in the docstring at line 149, and kept the revision hash and the pin remark. **Repair:** cite the supplier as "InfinitaryLogic, random-graph worked example" with the Tau Ceti file names only (the file names are stable; the pull-request number, the hash and "later than this repository's pin" are process narrative), and treat the Mathlib proposals as in the previous report.

## R07 (P3) — Supplier declarations named as if pinned, and one supplier object no roadmap owns

**Location:** README 106–107, 127–133, 346–359, 380–396, 444–447. Partly repaired since the previous review (its R07): the supplier row now names the merged declarations with their files, and every name on it exists at Tau Ceti revision `85f3eb5` exactly as cited (`tauceti-extensionproperty` lines 55, 97, 106; `tauceti-scott-randomgraph` lines 103, 131). **Witness that it remains open:** none of `SimpleGraph.HasExtensionProperty`, `TauCeti.radoGraph`, `hasExtensionProperty_radoGraph`, `nonempty_iso`, `isExtensionPair`, `SimpleGraph.Iso.toLanguageEquiv`, `sameAtomicType_iff`, `TauCeti.EFStrategy`, `TauCeti.BFEquiv`, the `BackAndForth.*`/`Infinitary.QuantifierRank` modules or `firstOrderAtomicDiagram` occurs in Tau Ceti at the pin `358314d` (grep of the whole package in both the worktree and the content checkout: 0 hits each; `TauCeti/ModelTheory` holds only `Algebra`); `Completed/InfinitaryLogic/README.md` on main (line 670) plans the random graph as a one-line worked example and names none of them; the gate still reports `readme-ids-missing` for `HasExtensionProperty.nonempty_iso` and `SimpleGraph.HasExtensionProperty.nonempty_iso`; the finite first-order atomic diagram (row 107) is still a supplier row rather than a target of 5.2, and no roadmap on main plans it. **Repair:** as in the previous report: cite the InfinitaryLogic sections and state the consumed facts in prose without the backticked names the gate rejects, and make the finite diagram a target of 5.2 with the Tau Ceti file as provenance (test: on `(a, a)` it asserts `x₀ = x₁` and `¬Adj(x₀, x₁)`; on an edge `(a, b)` it asserts `x₀ ≠ x₁` and `Adj(x₀, x₁)`).

## R08 (P3) — Two targets moved into this roadmap are named as its own declarations, and `Suggested.lean` declares neither

**Location:** `TauCetiRoadmap/RandomGraphs/README.md:352` ("conclude `HasExtensionProperty.infinite`: the carrier is infinite") and 358 ("Give `FirstOrder.Language.Equiv.toSimpleGraphIso`, the converse of Tau Ceti's `SimpleGraph.Iso.toLanguageEquiv`"). New at this head.

**Claim:** the two are targets of this roadmap (the previous text attributed both to the supplier; the change moves them here because the merged supplier lacks them, which is correct: `tauceti-extensionproperty` has no `infinite` lemma and `tauceti-scott-randomgraph` line 201 uses only `toLanguageEquiv`). **Witness:** a backticked name of this roadmap's own is a claim that `Suggested.lean` declares it; `grep infinite\|toSimpleGraphIso TauCetiRoadmap/RandomGraphs/Suggested.lean` finds only `infiniteSampleLaw…` (lines 492–522). The gate's `readme-ids` rule did not catch these two because their prefixes are the supplier's namespaces, but the rule's intent applies.

**Repair:** state both facts in prose without the names: "prove that a graph with the extension property has infinite vertex set" and "give the inverse adapter, from a graph-language equivalence between `G.structure` and `H.structure` to a graph isomorphism, inverse to the Tau Ceti adapter from isomorphisms to equivalences" (the forward adapter is Tau Ceti main's `SimpleGraph.Iso.toLanguageEquiv`, `BackAndForth/Graph.lean` line 44, not at the pin). Neither is a headline, so nothing is added to the Lean file. Test for infinitude: `Fin 0` fails the request `U = Z = ∅`; any finite `V` fails `U = ∅, Z = V`.

## R09 (P3) — The supplier row omits the supplier's identification of `R`, which `nonempty_iso_rado` restates

**Location:** `TauCetiRoadmap/RandomGraphs/README.md:106` (supplier row), 391–392 ("The supplier provides countable uniqueness (`HasExtensionProperty.nonempty_iso`) and the extension-pair bridge"); `TauCetiRoadmap/RandomGraphs/Suggested.lean:211–213` (`nonempty_iso_rado`, no docstring). New at this head (the row was rewritten against the merged file).

**Claim:** the row lists what the merged supplier provides. **Witness:** `tauceti-scott-randomgraph` line 196 states `TauCeti.nonempty_iso_radoGraph_iff : [Countable V] → (Nonempty (G ≃g radoGraph) ↔ G.HasExtensionProperty)`, whose backward direction is exactly `nonempty_iso_rado` (`[Countable V] (G) (hG : HasExtensionProperty G) : Nonempty (G ≃g radoGraph)`), and line 68 states `SimpleGraph.HasExtensionProperty.exists_adj_iff` (a witness outside any tuple realizing any pattern compatible with its repetitions), which is the tuple form of 4.1's "avoidance of an additional prescribed finite set". Neither is on the row, and `nonempty_iso_rado` carries no docstring saying it stands in for the supplier's theorem while the pin lacks the carrier.

**Repair:** add both names to the row with their file, and give `nonempty_iso_rado` the same "stand-in for the supplier's …" docstring that `HasExtensionProperty` and `radoGraph` have (or delete it, since it is not a headline and the supplier owns it). Test: `G = R` (identity isomorphism); `Fin 0` has no extension property and no isomorphism.

## R10 (P3) — README shape: no target-level dependencies and no Checks

**Location:** `TauCetiRoadmap/RandomGraphs/README.md:27–47`, 161–931. Unchanged since the previous review (its R08): zero `*Needs:*` lines and zero `**Checks.**` lists; no `## Exact supplier contracts`, `## How to read the build`, per-layer `### Examples`/`### Dependencies`, or `## Downstream consumers`. **Repair:** as in the previous report, with the discriminating Checks listed there (`EP_{≤d}` on `Fin 0`, `K₁`, `C₄`; `E_{r,s}` vacuous cases; strong AP versus AP on sets of size ≤ 1; `witnessProbability` at `p = 0, r = s = 0`).

## R11 (P3) — Targets without a locator

**Location:** README 163–173 (0.1), 618–650 (7.3), 680–705 (8.2), 724–756 (9.2), 758–777 (9.3), 880–930 (11.3); 1025–1026 (Cameron reference). Unchanged since the previous review (its R09). **Repair:** attach the Cameron and Fagin locators listed there (property (∗) and Facts 1–2 §1.1 pp. 1–2; Theorem 3 and Proposition 11 pp. 8–9; Theorem 6 and Corollary 1 p. 10; Fagin Theorem 1 p. 51, Theorem 2 and Corollary 3 p. 52, Corollary 5 p. 53), and say where a target is a new derivation.

## R12 (P3) — Procedures and implementations are specified where theorems are meant

**Location:** README 449–474 ("the input and output format of the procedures", "consistency procedure", "a genuine terminating syntactic procedure", "A semantic QE statement without the procedure does not discharge this target"); `Suggested.lean:14–17` ("the README requires executable implementations"). Unchanged since the previous review (its R10); the Lean already states the mathematics as theorems (existence of `Computable₂`/`Computable` maps on codes with correctness), and the new decoder makes those statements exact. **Repair:** phrase 5.2 as the theorems the Lean states, with the pattern-formula elimination as the proof route rather than a mandated implementation; delete "executable implementations" from the docstring.

## R13 (P3) — README and Lean do not agree in form

**Location:** `TauCetiRoadmap/RandomGraphs/Suggested.lean:6–31`; README 791 (9.4), 290–296, 449–460. Unchanged since the previous review (its R11), and the change adds to it: of the 87 declared names, only `boundedCode`, `boundedDecode` and `boundedDecode_eq_some_iff` are now described in the README (5.2, lines 449–455, in prose without the names); none of the 87 appears in backticks there. README 9.4 states singularity for distinct `p, q ∈ (0, 1)`; `binomialRandom_singular_separator` states it for all distinct `p, q ∈ [0, 1]`, which is the true generality. **Repair:** name each kept declaration in its README subsection, widen 9.4 to distinct `p, q ∈ [0, 1]`, and rewrite the module docstring per R02.

## Previous findings

- R01 — not repaired: gate `build=1 FAIL`, "imports `Mathlib` from package `mathlib`, which is designed for use with the module system"; declined by the author. Now R01.
- R02 — not repaired: `Suggested.lean:33` still reads `set_option autoImplicit false`; gate `set_option=1`. Now R03.
- R03 — not repaired: the module docstring still says "not exhaustive … suggest Lean forms for selected definitions and milestones"; no listed endpoint was added. Now R02.
- R04 — not repaired: lines 155, 163, 345, 636 are unchanged. Now R04.
- R05 — not repaired: gate `latex=476`. Now R05.
- R06 — not repaired: gate `prnum=1`; "#18726" became "#19595" at README 106, 967 and `Suggested.lean:149`; "cited at Tau Ceti revision 85f3eb5, later than this repository's pin" was added at README 106. Now R06.
- R07 — partly repaired: the row's names now match the Tau Ceti files at `85f3eb5` (verified), but none is at the pin, the gate still lists two `readme-ids-missing`, and the finite diagram is still a supplier row. Now R07; the repair introduced R08 and R09.
- R08 — not repaired: zero `*Needs:*` lines, zero `**Checks.**` lists. Now R10.
- R09 — not repaired: the listed sections still carry no locator. Now R11.
- R10 — not repaired: README 449–474 and docstring lines 14–17 unchanged in substance. Now R12.
- R11 — not repaired: no declared name appears in backticks in the README; 9.4 still says `(0, 1)`. Now R13.

## Verified sound

**Gate and dependency check.** The worker's gate at this head: `set_option=1 blob=0 latex=476 tex=0 prnum=1 sorry-data=0 sorry-examples=0 … readme-ids-missing=2 … depcheck=0 … stray-files=0 dirty=0 outside-folder=0 … build=1 FAIL` (each failing category is a finding above). The dependency check I ran at this head:

```text
depcheck: 236 roadmaps, 2231 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line; RandomGraphs is in the merge order (line 380 of 380). `git diff --stat origin/main...HEAD` outside the folder is empty; the folder contains only `README.md`, `Suggested.lean`, `metadata.toml`.

**Pins.** Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`, Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a` (the worktree manifest; the content checkout has the same pins).

**Elaboration.** A scratch copy of `Suggested.lean` as it stands, with `#check @name` for the eight declarations the change touches and nine `#eval`s on the coding, elaborated with `lake env lean`: 55 `sorry` warnings, 0 errors. The eight elaborated types agree with `signatures.md` and with the README (the decoder takes `α`, `n` and the code; the characterization is `boundedDecode α n c = some φ ↔ boundedCode φ = c`; the QE and decision theorems are unchanged in type). No one-tactic probe was needed: the change adds no sorried theorem, and `boundedDecode_eq_some_iff` is proved in the file (the build checks it). The computed values:

| Expression | Value | Meaning |
| --- | --- | --- |
| `encode [inr (inr 2)]` in `List (GraphAlphabet (Fin 0))` | 133 | by hand: `inr (inr 2) ↦ 2·(2·2+1)+1 = 11`, `succ (pair 11 0) = 121+11+1 = 133` |
| `boundedCode (⊥ : BoundedFormula (Fin 0) 0)`, same over `Fin 5` | 133, 133 | the code is independent of the context `m`, as 5.2 says |
| `boundedCode (⊥ : BoundedFormula (Fin 0) 1)` | 241 | `inr (inr 3) ↦ 15`, `succ (pair 15 0) = 241`: depends on `n` only |
| `encode [inr (inr 2), inr (inr 2)]` (a formula code with a trailing symbol) | 17701 | `succ (pair 11 133) = 133² + 11 + 1` |
| `(boundedDecode (Fin 0) 0 17701).isSome` | `false` | Mathlib's `encoding.decode = (listDecode l)[0]?` (`Mathlib/ModelTheory/Encoding.lean:280`) would return `⊥` here; the re-encoding filter rejects it, so the previous decoder's over-acceptance is gone |
| `(boundedDecode (Fin 0) 0 133).isSome` | `true` | round trip |
| `(boundedDecode (Fin 0) 1 133).isSome` | `false` | level mismatch (`φ.1 = 0 ≠ 1`) |
| `(boundedDecode (Fin 0) 0 0).isSome` | `false` | the empty list decodes to nothing |
| `boundedCode (⊥ → ⊥)` and its decode | 313325405, `true` | `succ (pair 3 17701) = 17701² + 3 + 1` |

**Library declarations opened at the pin for the change.** `BoundedFormula.listDecode` (`Mathlib/ModelTheory/Encoding.lean:194–213`: `falsum` at `inr (inr (n+2))`, `imp` at `inr (inr 0)` taking the first two decoded formulas, `all` at `inr (inr 1)`, `default` on malformed atoms) and `BoundedFormula.encoding` (line 277–285: `decode l := (listDecode l)[0]?`): the README's "Mathlib's list decoder ignores trailing symbols" is exactly right, and the `default` branches are a second reason the re-encoding check is needed (a malformed atom list decodes to `default`, whose re-encoding differs from the input). `Encodable.Sum`, `Encodable.list`, `Nat.pair`: the hand values above. `BoundedFormula.IsQF`, `Computable₂`, `Theory.simpleGraph`, `SimpleGraph.fromRel_adj`: unchanged from the previous report.

**Supplier files read at Tau Ceti revision `85f3eb5` (both fetched into a scratch manifest; neither is at the pin).**

| Cited name | Where it is | Agrees with the README? |
| --- | --- | --- |
| `SimpleGraph.HasExtensionProperty` | `tauceti-extensionproperty` line 55: `∀ s t, Disjoint s t → ∃ z, z ∉ t ∧ (∀ u ∈ s, Adj z u) ∧ ∀ w ∈ t, ¬Adj z w` | Yes: omits `z ∉ s`, as README 346–348 and the Lean docstring say; equivalent in a loopless graph |
| `TauCeti.radoGraph`, `radoGraph_adj`, `hasExtensionProperty_radoGraph` | lines 97, 102, 106 of the same file, `Combinatorics/SimpleGraph/ExtensionProperty.lean` | Yes: `fromRel fun i j => j.testBit i`; the supplier's `i ≠ j ∧ (j.testBit i ∨ i.testBit j)` equals the roadmap's ordered form (`testBit j i = true` forces `2^i ≤ j`, so `i < j`) |
| `SimpleGraph.HasExtensionProperty.isExtensionPair`, `nonempty_iso` | `tauceti-scott-randomgraph` lines 103, 131, `ModelTheory/Scott/RandomGraph.lean` | Yes; `nonempty_iso` needs `[Countable V] [Countable W]` and both extension properties, as 4.2 says |
| `HasExtensionProperty.infinite`, `Equiv.toSimpleGraphIso` | absent from both files (line 201 uses `toLanguageEquiv` only) | Correctly moved to this roadmap; R08 is about the names |
| `TauCeti.nonempty_iso_radoGraph_iff`, `exists_adj_iff` | lines 196 and 68 | Present; not on the row (R09) |

**Cross-roadmap citations resolved on main (`3b51055`).** `Completed/InfinitaryLogic/README.md` line 670 (the one-line random-graph worked example the row cites; it names no declaration), Layer 1 and the `QuantifierRank` module as in the previous report; DenseGraphLimits, Exchangeability, GraphConnectivityAndFlows, StandardDistributions unchanged. No upward citation. The two moved-down targets have no other owner: `roadmaps grep --fixed` for `toSimpleGraphIso` and `HasExtensionProperty.infinite` over main and the 452 open pull requests hits only this README (lines 352, 358). Ownership against Tau Ceti main beyond the two fetched files was not checked.

**Adversarial pass.** Rows for the statements the change touches, with computed values; every other row of the previous report's table (`representativeClass` through README 11.2, 62 rows) is carried forward unchanged, since the diff does not touch those statements.

| Statement | Instances and values | Result |
| --- | --- | --- |
| `boundedDecode` (277) | Values in the elaboration table: 17701 (formula code plus a trailing `⊥` symbol) ↦ `none`, where the previous decoder gave `some ⊥`; 133 ↦ `some ⊥`; `n = 1` at 133 ↦ `none`; 0 ↦ `none`; code of `⊥ → ⊥` (313325405) ↦ itself. A malformed atom list `[inl ⟨0,t⟩, inl ⟨1,t'⟩]` decodes to `default` in Mathlib and is rejected by re-encoding. | Accepts exactly the formula codes. |
| `boundedDecode_boundedCode` (283) | Proved in the file; instance 133 and 313325405 above. | Sound. |
| `boundedDecode_eq_some_iff` (290) | Proved in the file. `→`: `Option.filter_eq_some_iff` gives `boundedCode φ == c`, hence `= c` by `beq_iff_eq` (lawful `BEq ℕ`). `←`: the round trip. Consequence used by 5.2: a number that is no code decodes to `none`, so "values on numbers that are not formula codes are unconstrained" (docstring, line 333) is the right phrasing. | Sound both ways. |
| `HasExtensionProperty` docstring (148–151) | Supplier body at line 55 of the fetched file: omits `z ∉ s`; `R` with `U = {0}, Z = {1}`: witness 5 under both predicates; `x = 0` fails `x ∉ U` here and fails `Adj 0 0` there. | Docstring accurate; number is R06. |
| `radoGraph` docstring and `radoGraph_adj` (205–210) | Supplier `radoGraph_adj`: `(0,1)`: `0 ≠ 1 ∧ testBit 1 0` true; roadmap: `0 < 1 ∧ testBit 1 0` true. `(0,2)`: `testBit 2 0 = false`, `testBit 0 2 = false`: both false. `(1,2)`: `testBit 2 1 = true`: both true. `(1,1)`: both false. | The two forms agree. |
| `nonempty_iso_rado` (211) | `G = R`: identity. `Fin 0`: no extension property, no isomorphism. Backward direction of the supplier's `nonempty_iso_radoGraph_iff` (line 196). | Sound; R09 is about citation. |
| `exists_computable_quantifierElimination` docstring (329–334) | `m = 0`: quantifier-free sentences over `Empty ⊕ Fin 0` are `⊥` and `⊥ → ⊥`; completeness picks one. `φ = ∃y Adj(x₀,y)` ↦ `⊤`. Junk inputs: 17701 is no code, so `Q m 17701` is unconstrained, consistent with the new wording. | Sound. |
| README 4.1 infinitude (352) | `Fin 0` fails `U = Z = ∅`; finite `V` fails `U = ∅, Z = V`; `R` satisfies every request. | True; name is R08. |
| README 4.1 inverse adapter (357–358) | Graph-language equivalence between `K₂.structure` and `K₂.structure` swapping the vertices: `RelMap adj` is preserved, so the induced map is a graph isomorphism; the composite with `toLanguageEquiv` is the identity on both sides. | Statable with Mathlib alone; name is R08. |
| README 5.2 coding (449–455) | Values of the elaboration table; the `m`-independence of codes (`133` over `Fin 0` and `Fin 5`). | Agrees with the Lean. |

**Seeded sample.** Of the fifteen sampled targets, the change touches 4.1, 4.2 and 5.2: their supplier names were checked line by line in the two fetched Tau Ceti files (table above) and the coding against `Mathlib/ModelTheory/Encoding.lean` at the pin. The source rows of the previous report (cameron2013 (∗) §1.1 p. 1 and Prop. 11 p. 9 for 4.1–4.2 and 5.2; fagin1976 Theorem 1 p. 51 for 5.2) are unchanged, as are the rows for 0.3, 2.1, 5.3, 7.1–7.3, 8.2, 9.1–9.3 and 11.1, which the diff does not touch.

## Not verifiable

- **Spencer (2001)**, **Bollobás (2001)**, **Hodges (1993)**: as in the previous report, no legal text; cited by locator alone. The change does not touch their locators.
- **Tau Ceti pull request #19595's page**: the sources service refuses the GitHub landing page (no licence class); the merged state was not confirmed from the page. The two files were read at the revision `85f3eb5` the README cites, which contains every name on the row, so the citation is verified at that revision regardless.
- **Mathlib proposals #20649, #41113, #41115, #18876**: not audited; used for shape only, absent at the pin.
- **Ownership against Tau Ceti main** beyond the two fetched files (for example a `toSimpleGraphIso` elsewhere in Tau Ceti main): not checked; the grep index covers roadmaps, not the library.

## Source issues

- **Gap** in cameron2013 at §1.1 property (∗), printed p. 1: the source says a witness adjacent to the `u`'s and nonadjacent to the `v`'s is automatically distinct from all of them; it should require the witness outside the `v`'s explicitly, since a `v_j` is trivially nonadjacent to itself; affects the proof. (Carried from the previous report; the supplier's definition at `tauceti-extensionproperty` line 55 requires `z ∉ t` explicitly, as it must.)
- **Error** in cameron2013 at Theorem 3(a), printed p. 8: the source says closure under isomorphism and substructures, countably many isomorphism types and amalgamation characterize ages; it should also require the class to be nonempty; affects a stated result. (Carried.)
- none further found in the passages the change touches.
