# Review of CountableStructureSpacesPartII (pull request #2418 at e5ed4f8)

**Verdict:** accepted

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 `classIso` | `K = ∅`; one unary predicate on `Fin 2`; `K = modelsOf φ` | `∅`: empty map reduces into any `K`, reverse forces `K = ∅`. `Fin 2`: 4 codes, 3 classes. Pin: `isoSetoidOn` is `(isoSetoid L V).comap Subtype.val` | holds | none |
| 0.2 set reducibility; converse fails | `Y = Empty`; graph of `eZero` against the diagonal | `Unit → Empty`: no map, clause `IsEmpty X ∨ Nonempty Y` false. Two-valued map `(0,0)`/`(0,1)` pulls the diagonal back to any Borel set; pin has `not_isSmooth_eZero` | holds | none |
| 1.1 carrier relabelling | 3-cycle `0↦1↦2↦0` on `Fin 3`, `P = {0}`; `Fin 0` | New value at `w` is `c(e.symm w)`: `P' = {e 0} = {1}`; reverse convention `{2}`. `Fin 0`: 1 code without nullary symbols, 2 codes and 2 classes with one | holds | none |
| 1.2 `BorelComplete` | `K = ∅`; one unary predicate; `K ⊆ K₂` | `∅`: no map from nonempty `univ`. Closed class "each `P_i` is `∅` or `ℕ`": `2^ℵ₀` types against `ℵ₀`. Inclusion measurable for arbitrary `K₂` | holds | none |
| 1.3 function symbols | one constant; unary function symbol | Graph code of `F k = 3` is `{3}`. Codes with value `n` at `0`, `n → ∞`, converge to a code with no value: range not closed, Gδ | holds | none |
| 2.1 incidence graph | binary `R = {(0,1)}`; two unary symbols; nullary symbol | Colours `0`, `1`, `2+2j`, `3+2ι(R)` pairwise distinct across sorts. Degrees 3 and 2. From an isomorphism: `d(R(σ∘v)) = c(R(v))`, which is `d = σ • c` | holds | none |
| 2.2 clique tags | one edge, `κ = (0,1)`; a triangle | Vertices `2+3+4 = 9`, edges `1+2+3+6 = 12`. Tag `0` has `κ x + 2` triangle neighbours. Triangle in `H`: originals lie in triangles, recognition fails | holds | none |
| 2.3 `borelComplete_graphClass` | `L'` empty; any `L' : Language.{0,0}` | Vertex set contains the points, so it is countably infinite for every `L'`; each output coordinate is constant or one coordinate of `c` | holds | none |
| 3.1 dense colouring | `3/4`, `5`, `-1/6`, `1/8008`, `0`; sign colouring | `ν = 2, 0, 1, 3, 0` (`8008 = 8·1001`, `0.den = 1`). Negatives are an initial segment, so no colour-swapping automorphism | holds | none |
| 3.2 unravelling lemma | parent of `x`; edge `{0,1}`; `adjAtom 0 1` against `adjAtom 1 0`; loop against empty | A second candidate `p` of length `|x|−1` admits a shorter `z` between. `a([1/2,1]) = (1,0)`. Bits at `(1,0)` both true. Loop colour at `[1]` absent from the empty graph | holds | none |
| 3.3 `exists_continuous_reduction_linearOrderClass`, `borelComplete_linearOrderClass` | block `ω + (χ+2)`; empty against complete graph; constant-true code | Finite condensation classes are exactly the tails, of size `χ+2 ≥ 2`; `ω`-parts infinite; no adjacent blocks (`List ℚ` dense). Colour at `[1,1/2]` differs | holds | none |
| 3.4 `borelComplete_treeClass` | `χ = 0`, `χ = 1`; `c_n → (ℕ, ≥)` | Chain above `(x, some 0)` has `χ+2` nodes: heights 2 and 3. For `n ≥ j > i`: `j ≤ i` in `c_n`, so the limit is `(ℕ, ≥)`; class not closed | holds | none |
| 3.5 two presentations of trees | star `T`, `T_n` with `0 < n < 1`; finite tree | Coordinates `(i,j)` agree once `n > max(i,j)`, so `T_n → T`; `0—1` is a cover in `T` only: not continuous, closed condition | holds | none |
| 4.1 `instMeasurableSpacePerm`, Borel S∞-spaces | `Perm (Fin 3)`; `{σ | σ 0 = 0}`; uncountably many unary symbols | 64 measurable sets; evaluation at `0` alone gives 3 atoms, 8 sets. No `MeasurableSpace (Equiv.Perm _)` instance in either pin | holds | none |
| 4.2 `exists_equivariant_measurableEmbedding_universal` | `X = ℕ`, `S_n = {n}`; one point; `Nat.unpair 0, 1, 2`; `X` empty | `g' = g h` gives the condition at `h⁻¹ ∘ a`, matching `eval_perm_smul`. `unpair = (0,0), (0,1), (1,0)`; `pair 1 0 = 2`. Injectivity: `g_k → 1`, `g_k • y ∈ S_n` | holds | none |
| 5 `borelComplete_iff_graphClass`, `borelComplete_iff_forall_permSpace` | `K = ∅`; `K` = one unary predicate; `X : Type w` | `∅`: both sides false. Unary: `𝔠` graph types against `ℵ₀`, both false. (5)⇒(3) needs `ULift.{w}` of a `Type 0` space; (3)⇒(5) is 4.2 in any universe | holds | none |
| 6.1 `bfEquiv_omega0_opow_mul` | `γ = 0`; `γ = 1`, `δ = 0`; `ω` against `ω·2`, `ω+1`; successor step | Level 0 trivial. Empty against nonempty fails at 1. `ω ≡₂ ω·2` (answer `ω` by `n ≥ 1`); `ω ≢₂ ω+1`. Tail after `m` is `ω^(γ+1)·(δ−a)`; `ω^γ + ρ < ω^(γ+1)` | holds | none |
| 6.2 `not_measurableSet_classIso_of_borelComplete` | `β = 0`; `K = ∅`; uncountable `L` | `ω^(1+0) = ω` against `ω·2`: infinite, non-isomorphic, `≡₁`. `ω^β` alone would be `1` at `β = 0`, not codable on ℕ. Only `Language.order` needs countability | holds | none |
| 6.2 `exists_lt_scottHeight_of_borelComplete` | `β ≥ ω₁` | Without `hβ` false: pin `scottHeight_lt_omega_one`. Pin `comap_isoSetoid_eq_bfEquivSetoid` assumes nothing of `K` | holds | none |
| 6.3 `borelReducible_eZero_of_borelComplete`, `mk_quotient_classIso_of_borelComplete` | `0^ω` against `1 0^ω` and `1^ω`; copy `F = ∅` only | `F ↦ F ∆ {0}` matches copies; finitely against cofinitely many `P`-points. Bounds: `𝔠 ≤ #` by `lift_mk_quotient_le`, `# ≤ 𝔠` by `mk_le_continuum` (countable `L`) | holds | none |
| 6.4 `not_borelComplete_of_rank_bounded` | analytic `K`, `ρ = 0`; `wellOrderClass`; non-measurable `A ⊆ graphClass` | Analytic `K`: `K_α = K`, contrapositive of 6.2. Well-orders: `K_α` is countably many Borel orbits, `ρ` unbounded. Diagonal of `A`: measurable in `A × A`, not in the square | holds | none |
| 6.5 lower part of the order | one unary predicate | Countably many Borel classes, so smooth by pin `isSmooth_of_countable_quotient`; `eZero` has `𝔠` classes, no reduction into it | holds | none |

- Source locators checked against the text: 40, in paolini-shelah-tfab (10), camerlo-gao-boolean (8), montalban-cst2 (8), becker-kechris-bams (7), montalban-cst1 (7); all support the statements as written.
- Library declarations opened at the pins: 103 in Tau Ceti (among them `ModelTheory/BackAndForth/Equivalence.lean:50`, `ModelTheory/Counting/Stratification.lean:79, 154, 238`, `ModelTheory/Counting/Classes.lean:92`, `SetTheory/Descriptive/BorelReducibility.lean:159, 289`, `Topology/Algebra/Group/Perm.lean:42, 143, 149, 178`) and 30 in Mathlib (among them `Data/List/Lex.lean:141`, `ModelTheory/Order.lean:163, 166`, `MeasureTheory/Constructions/Polish/Basic.lean:353, 524, 883`); none missing.
- Cross-roadmap citations resolved: 15 (CountableStructureSpaces Layers 0, 1.2, 4.1–4.4, 6.2 and worked examples 2, 3, 5 at its open head, with `exists_uniform_bfSeparation`, `wellOrderClass`, `analytic_type_bounded`; NoncompactQuantumSymmetry Layer 4 M1.BorelRealization, `exists_polishTopology_continuousSMul`; BorelEquivalenceRelations §5.1–§5.4, CountableModelCounting Layers 0–1, InfinitaryModelExistence 0.3 and Layer 6, InfinitaryLogic Layer 1 on main).
- Dependency check: `depcheck: 236 roadmaps, 2232 edges, 0 problem(s)`; no UPWARD or CYCLE line. CountableStructureSpaces is another author's open pull request that adds a new folder.
- Gate at e5ed4f8: every check 0, build OK. Elaboration of `TauCetiRoadmap/CountableStructureSpacesPartII/Suggested.lean`: 13 `sorry` warnings, no error, no other warning. The 20 elaborated signatures were compared with the README statements; no binder lost, nothing changed.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `trivial`, `simp` unfolding `BorelComplete` and `classIso`) on a scratch copy: 0 of 13 theorems close. Every headline of the Summary that is statable is stated; the module docstring names the Layer 1.3 comparison as not statable (carrier missing).
- Duplication: no `BorelComplete`, universal S∞-space, Friedman–Stanley coding or `ω ^ γ` back-and-forth computation in either pin, on main or at the open heads; CountableStructureSpaces and BorelEquivalenceRelations list Borel completeness and the logic action's universality as out of scope.
- Pull-request text read against the head: title, summary block and prose agree with the folder (new roadmap, 20 declarations, two open suppliers).

Overlap check: read CountableStructureSpaces, CountableModelCounting, BorelEquivalenceRelations, InfinitaryLogic, RandomGraphs, HanfNumbers; nothing shared (`classIso` on a model class equals CountableModelCounting's `isoSetoidOn`, which the README cites and does not restate).

Source independence: 20 passages compared with 5 sources, none shared; largest share paolini-shelah-tfab, 13 of 54 locators; contents compared with paolini-shelah-tfab: independent (only Layers 0–1 draw on its introduction, Definitions 1.2–1.6; its construction sections are not used).

## Not verifiable

- friedman-stanley-1989 Theorem 1, §2, §3, §4: uncertified, cited by locator only; the cached sources confirm the attributions (paolini-shelah-tfab lines 124–128, camerlo-gao-boolean lines 111–113).
- gao-idst §5.2, §13.1: uncertified, text not read.
- becker-kechris-1996 §2.6–§2.7, §3.4: uncertified, text not read; camerlo-gao-boolean lines 94–101 confirms the attribution of the complete orbit relation.
- hjorth-kechris-1996 §4–§5: uncertified, text not read.
- mekler-1981 §2: uncertified, text not read (scope paragraph only).
- kechris-cdst §16.C: uncertified, text not read; camerlo-gao-boolean line 93 gives the same locator for the logic action.

## Source issues

- none

## For the human reviewers

- **Licence.** montalban-cst1 and montalban-cst2 are cited as author's drafts (`TauCetiRoadmap/CountableStructureSpacesPartII/README.md` lines 1509–1512), 11 of 54 locators; their numbering was not compared with the published volumes.
- **Not tested.** The headline theorems' primary source, friedman-stanley-1989, is uncertified: its wording and section order were not compared with Layers 2, 3 and 6.4.
