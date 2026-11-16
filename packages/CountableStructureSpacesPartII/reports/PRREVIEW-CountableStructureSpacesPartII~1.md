# Review of CountableStructureSpacesPartII (pull request #2418 at 060a878)

**Verdict:** needs changes

## R01 (P3) — The description announces two lists it does not contain

**Location:** Pull request description, prose paragraphs 1 and 3: "It then proves the following:" and "Dependencies (the roadmaps the README cites by name and section, and what they in turn need; the Lean imports none of them)."

**Claim:** Each sentence introduces a list, but no list follows either one. A reader of the description does not learn the headline theorems or the suppliers.

**Witness:** The next paragraph after "It then proves the following:" begins "Roadmap folder …". The head states 13 headline theorems (`README.md` lines 27–33) and has supplier sections for two open roadmaps (`README.md` lines 342–369).

**Repair:** Replace "It then proves the following:" with: "It then proves that countable graphs, linear orders and trees are Borel complete (`borelComplete_graphClass`, `borelComplete_linearOrderClass`, `borelComplete_treeClass`), the last two through one continuous reduction of all codes of `Language.graph` to linear orders (`exists_continuous_reduction_linearOrderClass`). It proves that every Borel S∞-space embeds equivariantly into the logic action of `universalLanguage` (`exists_equivariant_measurableEmbedding_universal`), and that Borel completeness means receiving the graphs, or the orbit relation of every Borel S∞-space (`borelComplete_iff_graphClass`, `borelComplete_iff_forall_permSpace`). It shows that `ω^γ·δ` and `ω^γ·ε` are `BFEquiv γ` for nonzero `δ`, `ε` (`bfEquiv_omega0_opow_mul`). A Borel complete isomorphism relation is not Borel, has unbounded Scott height, lies above E₀ and has 𝔠 classes (`not_measurableSet_classIso_of_borelComplete`, `exists_lt_scottHeight_of_borelComplete`, `borelReducible_eZero_of_borelComplete`, `mk_quotient_classIso_of_borelComplete`). Finally, it proves the Friedman–Stanley obstruction (`not_borelComplete_of_rank_bounded`)." Replace the "Dependencies (…)" sentence with: "Dependencies: CountableStructureSpaces (Layers 0, 1.2, 4.4 and 6.2, worked examples 2 and 3) and NoncompactQuantumSymmetry (Layer 4, M1.BorelRealization), both open pull requests. BorelEquivalenceRelations §5.1–§5.4, CountableModelCounting Layers 0–1, InfinitaryModelExistence Layers 0.3 and 6, and InfinitaryLogic Layer 1 are consumed through their Tau Ceti implementations."

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
| --- | --- | --- | --- |
| 0.2 set reducibility, empty target; converse of Remark 1.5 | `X = Unit`, `Y = Empty`, `A = ∅`; graph of `eZero` against the Cantor diagonal | No map `Unit → Empty`, so not reducible. Two-valued map pulls the diagonal back to `eZero`'s graph; `eZero ≤_B ⊥` contradicts `not_isSmooth_eZero` | holds |
| 1.1 carrier relabelling | one unary `P` on `Fin 3`, `e = (0 1 2)`, code `P = {0}` | `restrict e.symm`: `P` at `j` iff `e⁻¹ j = 0`, giving `{1}`; `restrict e` gives `{2}`. All 8 codes: 4 classes (`|P| = 0..3`) | holds |
| 1.2 `BorelComplete` | `K = ∅`; codes of one unary predicate; `graphClass ∩` orbit of the empty graph | `∅`: no map from nonempty `univ`. One unary predicate: `ℵ₀` classes, below the 𝔠 of the `ℕ → Bool` family. Intersection: one class | holds |
| 1.3 function symbols | one constant `k`, `F k = 3`; unary `f` with `F 0 = n`, `n → ∞` | Graph relation `{3}`; limit code has no value at `0`, so range is Gδ, not closed; relational `L`: range is everything | holds |
| 2.1 incidence graph | binary `R`, `c = {(0,1)}`; two unary symbols, colours forgotten | Tuple vertex at `(0,1)` has 3 neighbours, at `(1,0)` 2. Swapping the symbols makes the uncoloured graphs isomorphic, but the codes are not | holds |
| 2.2 clique tags | one edge, `κ = (0, 1)` | Vertices `2+3+4 = 9`, edges `1+2+3+6 = 12`. Tag 0 of `x`/`y` has 2/3 triangle neighbours, which is `κ + 2` | holds |
| 2.3 `borelComplete_graphClass` | output bit `t_q—u_q`; `L'` with no symbols | Each bit is constant or equals `c.eval q`, so the map is continuous. Empty `L'`: one code, a graph with no edges | holds |
| 3.2 unravelling | `c = {adj 0 1}`, `d = {adj 1 0}`, `τ = (0 1)`; loop code against the empty graph | `[1/2,1]` has `a = (1,0)`; bit `(1,0)`: `c(adj 0 1)` and, at the image, `d(adj 1 0)`, both true. Loop colour absent for empty graph | holds |
| 3.5 cover graphs | star `T`; `T_n` with `0 < n < 1` | Coordinate `(i,j)` of `T_n` equals `T`'s once `n > max(i,j)`; cover edge `{0,1}` in `T`, in no `T_n`: Borel, not continuous | holds |
| 4.1 Borel S∞-spaces | `Perm (Fin 3)`; σ-algebra of `ev₀`; uncountably many unary symbols | 64 sets against 8 for `ev₀`, which cannot separate `id` from `(1 2)`. Uncountably many symbols: singletons not product-measurable, so not standard Borel | holds |
| 4.2 `exists_equivariant_measurableEmbedding_universal` | `X = ℕ`, `S_n = {n}`; `Nat.unpair 0, 1, 2` | `(1,0)` holds at `(a)` iff `x = a`, equivariantly. `unpair 1 = (0,1)`: unary reads `(1,0)`; `unpair 2 = (1,0)`: binary reads nullary `(0,1)` | holds |
| 6.2 `not_measurableSet_classIso_of_borelComplete` | `β` from uniform separation; `ω^(1+β)` against `ω^(1+β)·2`; `β = 0` | 6.1 (`γ = 1+β`, `δ = 1`, `ε = 2`): `BFEquiv (1+β)`, so `BFEquiv β`; types differ, not isomorphic. `β = 0`: `ω`, `ω·2` | holds |
| 6.2 `exists_lt_scottHeight_of_borelComplete` | `K` with all heights `≤ β`; `K = ∅` | On `K`, `comap_isoSetoid_eq_bfEquivSetoid` gives `classIso K = bfEquivSetoid β`; its graph is a measurable preimage (`β < ω₁`), contradicting 6.2. `∅` is vacuous | holds |
| 6.3 `borelReducible_eZero_of_borelComplete` | `x = 0^ω`, `y = 10^ω`; `x = 0^ω`, `y = 1^ω` | Copy `F` of `x`: `P = F`; of `y`: `P = F∆{0}`; `F ↦ F∆{0}` is an isomorphism. `0^ω` copies: finite `P`; `1^ω`: cofinite | holds |
| 6.3 `mk_quotient_classIso_of_borelComplete` | `K = graphClass`; uncountable `L` | Lower bound: `lift 𝔠 = #(Quotient eZero) ≤`. Upper bound: `#Quotient ≤ #RC ≤ 𝔠`, which needs `L` countable; the Lean assumes it | holds |
| 6.4 `not_borelComplete_of_rank_bounded` | well-orders with `ρ` = type; one unary predicate with `ρ = 0`; `graphClass` | WO: `K_α` is countably many Borel orbits (types `ω..α`), giving (a); (b) is `analytic_type_bounded`. `graphClass`: (b) forces `K_α = K`, contradicting 6.2 | holds |
| 6.5 lower part of the order | codes of one unary predicate; `eZero` | `ℵ₀` Borel classes, so smooth (`isSmooth_of_countable_quotient`). `eZero` has 𝔠 classes, so it does not reduce to them, and it is not smooth | holds |
| `exists_continuous_reduction_linearOrderClass` | empty against complete graph; the constant-true code | Colour of `[1, 1/2]` (distinct, non-adjacent) never occurs for the complete graph. Size `χ+2` with true diagonal: no simple graph. Bits read `χ_c(x)` only | holds |
| `borelComplete_linearOrderClass` | condensation classes of `ω + (χ+2)` blocks | `ω`-part against finite part: infinite interval. Finite classes: size `χ+2 ≥ 2`. Dense: `x < x ++ [0] < y` for `x` not a prefix | holds |
| `borelComplete_treeClass` | tag subtrees for `χ = 0, 1`; `c_n → (ℕ, ≥)` | Heights 2 and 3. `c_n ∈ treeClass`; the limit has infinite down-sets, so the class is not closed but is Borel | holds |
| `borelComplete_iff_graphClass` | `K = ∅`; one unary predicate; `graphClass` | Both sides false for `∅` (no map) and for one unary predicate (`ℵ₀ < 𝔠` classes); both true for `graphClass` | holds |
| `borelComplete_iff_forall_permSpace` | trivial action on `ℕ → Bool`; logic action lifted by `ULift` | The right side gives `⊥ ≤_B classIso K`; with `X = ULift (RC L' ℕ)` it gives (3) for every `L'` | holds |
| `bfEquiv_omega0_opow_mul` | `γ = 0`; `γ = 1` with `δ = 0`; `ω` against `ω+1` at level 2 | `γ = 0`: trivial. Empty against nonempty fails at level 1, so `δ ≠ 0` needed. `ω+1`'s maximum has empty upper interval: not `BFEquiv 2` | holds |

- Source locators checked against the text: 41 (paolini-shelah-tfab 10, camerlo-gao-boolean 9, becker-kechris-bams 7, montalban-cst1 7, montalban-cst2 8). These include the Montalbán route in the `bfEquiv_omega0_opow_mul` docstring through Definition II.32, Observation II.35, Lemma II.38 and Corollary II.39, re-derived by induction on `γ`.
- Library declarations opened at the pins: 78 Tau Ceti names, including `IsIsolatingRank` (`ModelTheory/Counting/Stratification.lean:79`), `Equiv.Perm.instTopologicalSpace` (`Topology/Algebra/Group/Perm.lean:42`) and `graphExpansion` (`ModelTheory/Infinitary/GraphTranslation/Language.lean:230`, last argument is the value). Also 41 Mathlib names, including `MeasurableSMul₂` (`MeasureTheory/Group/Arithmetic.lean:463`). Neither pin has a σ-algebra instance on `Equiv.Perm α`.
- Cross-roadmap citations resolved: 17. These are CountableStructureSpaces Layers 0, 1.2, 4.1–4.4 and 6.2 with worked examples 2, 3 and 5, at its open head; NoncompactQuantumSymmetry Layer 4 `exists_polishTopology_continuousSMul`, at its open head; and BorelEquivalenceRelations §5.1–§5.4, CountableModelCounting Layers 0–1, InfinitaryModelExistence 0.3 and 6, and InfinitaryLogic Layer 1, on main.
- Gate rerun on this head: every check 0, `OK`. Dependency check: `depcheck: 236 roadmaps, 2241 edges, 0 problem(s)`.
- Elaboration: `lake env lean` of `Suggested.lean` gives 13 `sorry` warnings and nothing else. All 20 elaborated types were compared with the README, 6 of them re-elaborated with `#check @name` in a scratch copy. Every binder is present; no change.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `trivial`, `decide`): 0 of 13 theorems close. No padding. Every statable headline is stated.
- Overlap check: read CountableStructureSpaces, CountableModelCounting, BorelEquivalenceRelations, RandomGraphs, HanfNumbers and NoncompactQuantumSymmetry. The only shared object is restricted isomorphism: owner CountableModelCounting (`isoSetoidOn`, at the Tau Ceti pin). `classIso` differs from it by allowing arbitrary sets, which the README states in one clause. Borel completeness, `universalLanguage` and the ordinal back-and-forth lemma have no other owner.
- Source independence: 54 passages (41 locators, 13 docstrings) compared with 5 sources, none shared beyond forced formulas. The largest share is paolini-shelah-tfab, 13 of 54 locators. Contents compared with paolini-shelah-tfab: independent (its §1 definitions feed Layers 0–1 only). The order of montalban-cst1 VI.27 and VI.18 is reversed by the *Needs:* lines of 3.3 and 3.4 on 2.3.

## Not verifiable

- friedman-stanley-1989 (Theorem 1, §2, §3, §4): uncertified, settled; text not read.
- hjorth-kechris-1996 (§4–§5): uncertified, settled; text not read.
- gao-idst (§5.2, §13.1): uncertified, settled; text not read.
- becker-kechris-1996 (§2.6–§2.7, §3.4): uncertified, settled; text not read.
- kechris-cdst (§16.C): uncertified, settled; text not read.
- mekler-1981 (§2): uncertified, settled; text not read.

## Source issues

- **Misprint** in montalban-cst2 at §XI.2, p. 208: the source says graphs are on top by "Part 1, Theorem ??", an unresolved reference; it should name the Part 1 theorem coding every structure into a graph (Theorem VI.27 of the 2019 draft); affects nothing.
- **Misprint** in montalban-cst2 at Corollary II.39, p. 38: the source says it holds for any linear ordering `A`; for empty `A` the strict failure `ω^α ≰_{2α+1} ω^α` is false; it should assume `A` nonempty; affects nothing.
- **Error** in becker-kechris-bams at §2, p. 4: the source says the structure space `X_L` is homeomorphic to Cantor space whenever `L` is nonempty; a finite language of nullary symbols gives a finite space; it should require a symbol of positive arity or infinitely many symbols; affects nothing.

## For the human reviewers

- none
