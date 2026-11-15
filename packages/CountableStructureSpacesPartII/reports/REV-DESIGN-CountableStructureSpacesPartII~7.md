<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13739#issuecomment-6896144641 -->
Review (claude) of e1586f4

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) two works in the References are cited nowhere

   **Location:** `design/README.md:1333–1334`: "kechris-cdst: A. S. Kechris, *Classical Descriptive Set
   Theory*, GTM 156, 1995." and "hjorth-2000: G. Hjorth, *Classification and Orbit Equivalence
   Relations*, AMS, 2000."

   **Claim:** every work in the References supports a statement of the roadmap at a locator.

   **Witness:** a search of `design/README.md` and `design/plan.json` finds `kechris-cdst` and
   `hjorth-2000` only on those two lines; the manifest gives both `cited_for` as "background" only. The
   other ten works carry 49 locators.

   **Exact repair:** cite kechris-cdst at Convention 4, after "(`eval_perm_smul`, as in base
   Layer 1.2)": "the logic action of kechris-cdst §16.C and becker-kechris-bams lines 159–164"; delete
   the hjorth-2000 line from the References. Tested: camerlo-gao-boolean line 93 names that section of
   Kechris's book for exactly this action, and becker-kechris-bams lines 162–163 state the same
   convention (`g·x` reads `x` at `g⁻¹` of the tuple), which is `eval_perm_smul` at the pin.

One finding, P3, and it asks for a repair, so the verdict is needs changes; no P1 or P2. Both round-6 findings are repaired.
This is a design: there is no `Suggested.lean`, and elaboration is not available (this lane does
not elaborate), so no elaboration, `#check` inventory or one-tactic probe was run and none is
claimed. No supplier gap is declared. No maintainer note
was left for this roadmap.

## Previous findings (round 6), checked first

| Finding | Status | Repaired passage and my check |
| --- | --- | --- |
| F01 (P3) locator of `classIso` pointed at the definition of reducibility | repaired | `design/README.md:322–325`: "(paolini-shelah-tfab Fact 1.1, lines 56–58, and lines 65–68 for the induced Borel structure on a class and relations on it as subsets of its square; paolini-shelah-tfab Definition 1.6, lines 95–96 …". Read: lines 56–58 are Fact 1.1 (the induced Borel structure on a Borel subset), 65–68 treat a class as a standard Borel space with relations as subsets of its square, 95–96 name the isomorphism relation on a class. Definition 1.4 moved to Convention 2 (`:106–109`, "lines 83–87, on standard Borel spaces"); lines 83–87 are that definition. Plan target 0.1 and the manifest locator agree. |
| F02 (P3) unravelling lemma and reflections stated for `graphClass` only | repaired | `design/README.md:755–758`: "for all codes `c, d : RelationalConfiguration Language.graph ℕ`, simple graphs or not, the following are equivalent"; `:833–836` and `:897–899`: "for all codes `c, d`, simple graphs or not, the images are isomorphic exactly when `c` and `d` are"; `:829–830`: "each comparison depends on at most one colour, that of the common block". Plan targets 3.4, 3.6, 3.7, 3.10, 3.11 say the same. Recomputed below (rows 3.2–3.4). |

Nothing in the repair report was marked not actionable; nothing is re-raised. Pattern search over
the rest of the design: (i) every source locator of the sampled sections was read again at its
lines (table below): none cites a passage that defines something else; (ii) every reduction that is
stated for a class was checked for a proof that works on more codes: 2.3 is already stated on the
whole of `RelationalConfiguration L' ℕ`; 3.5 (b) rightly stays on `treeClass` (off it the cover graph
does not determine the order: a least element `0` below one dense chain and `0` below two
incomparable dense chains both have the empty cover graph with `0` marked); 2.2 keeps triangle-freeness, which its third Check shows necessary.

## Verified sound

### Coverage

Read the whole README (1,338 lines), the plan (49 targets in 7 layers, `gaps: []`, baseline Mathlib
`1b1ccf4b`, Tau Ceti `2fd255d9`, equal to the checked-out pins), the manifest (12 entries), the
round-6 review and its repair report, and the diff of the repair. The changed passages (Convention 2,
0.1, 3.2, 3.3, 3.4) and the 15 sampled targets were reviewed in full, sources included. Sections 0.1,
1.2, 3.4 and 6.3, which round 6 covered by reference to round 5, were recomputed here.

### Principles

Part II of CountableStructureSpaces, whose open head lists "Borel completeness of isomorphism of
countable graphs or linear orders" and Vaught transforms as out of scope. General Borel
reducibility, smoothness and E₀ (BorelEquivalenceRelations §5.1–§5.4, on main), back-and-forth
(InfinitaryLogic Layer 1, completed), the small presentation and graph translation
(InfinitaryModelExistence 0.3 and Layer 6, on main), transport between presentations and
`isoSetoidOn` (CountableModelCounting Layer 0, on main) and the Polish realization
(NoncompactQuantumSymmetry Layer 4) are imported, not planned again. No copied passage, no
algorithm, no `set_option`, no sorry'd data (no Lean file). Statements are general: arbitrary
countable relational languages in any universe, nullary symbols, function symbols, arbitrary codes
in Layer 3. Layer order is forced by the *Needs:* lines (0 → 1 → 2 → 3; 4 needs 4.1 and
NoncompactQuantumSymmetry; 5 needs 0–4; 6.1 is free and the README says so). No layer is named
after a source chapter and the README does not say it follows a source.

### Adversarial table

| Statement | Instances tried | Values computed | Result; change |
| --- | --- | --- | --- |
| 0.1 `classIso`, Checks | `K = {P = ∅, P = ℕ}`; `K = ∅`; `Fin 2`, one unary symbol; `A = {P = {0}}` | both codes fixed by every permutation: 2 classes, equality; maps into `∅` exist only from `∅`; `Fin 2`: 4 codes, classes `|P| = 0, 1, 2`, `{0} ~ {1}` by the transposition; `A` one code, one class | all five Checks hold; none |
| 0.1 corestriction | `f` measurable, `f '' K' ⊆ K`, iso reflected on `K'` | `x ↦ ⟨f x, _⟩` measurable by `Measurable.subtype_mk`; `classIso K' = comap` of `classIso K` | reduction by `borelReducible_iff_exists_eq_comap` (`BorelReducibility.lean:108`); none |
| 0.2 `SetReducible`, empty and full targets | `X = Unit, Y = Empty`; `X = Y = Empty`; one-point `Y` | maps `Unit → Empty`: 0, so not reducible though `A = ∅`; empty map: T; one-point `Y`: diagonal = `univ`, receives exactly `A = univ` | iff with the existence clause holds both ways; none |
| 0.2 converse fails | `E = eZero`, `F = ⊥` on Cantor space | two-valued map `(0,0)` on the graph, `(0,1)` off it: preimage of the diagonal = graph, measurable (`measurableSet_eZero`); reducibility to `⊥` is `IsSmooth eZero` by definition (`BorelReducibility.lean:229–230`), F | set reducible T, Borel reducible F; none |
| 1.1 relabelling direction | `Fin 3`, `e = (0 1 2)`, `P = {0}`; `e` twice | pin: `restrict (f : V → W) : Config W → Config V` (`Basic.lean:211`); `restrict e.symm`: `{w | e⁻¹ w = 0} = {1}`; `restrict e`: `{2}`; twice: `{2} ≠ {0}`; for `α = β`, `restrict σ⁻¹ = σ • ·` (`perm_smul_def`, `:304`) | agrees with Convention 4 and the base's acceptance check; none |
| 1.1 empty carrier | `Fin 0`, no nullary symbol; one nullary symbol | atoms of arity `n > 0` need `Fin n → Fin 0`: none; 1 code; with a nullary symbol 2 codes, 2 classes | Check correct; none |
| 1.2 `BorelComplete` | `K = ∅`; one unary predicate; `graphClass ∩` orbit of the empty graph | no map from nonempty `univ` into `∅`; `ℵ₀` classes against the `2^ℵ₀` types of the `P_i ∈ {∅, ℕ}` class; intersection = one code | Checks correct; none |
| 1.3 graph-code map | constant `k`, `F k = 3`; unary `f`, value at `0` equal to `n → ∞`; relational `L` | relation `{3}`; limit has no value at `0` (totality F): range not closed; relational: empty table, range everything. Last argument is the value (`GraphTranslation/Language.lean:71–77`) | Gδ, not closed, closed as stated; none |
| 1.3 action on tables | `(σ • F)⟨f, v⟩ = σ (F ⟨f, σ⁻¹ ∘ v⟩)` | graph bit at `w`: `F(σ⁻¹ ∘ init w) = σ⁻¹ (last w)` = bit of `F` at `σ⁻¹ ∘ w` | equivariant for Convention 4; none |
| 2.1 incidence graph | `R = {(0,1)}`; two unary symbols; nullary symbol; no symbols | colour classes `0`, `1`, even `≥ 2`, odd `≥ 3` disjoint; degrees 3 and 2 at the two tuple vertices; `t_q ↦ t_{q'}` forces `q' = atom R (σ ∘ v)` through the unique neighbours; `(σ • c).eval (atom R (σ ∘ v)) = c.eval (atom R v)` (`eval_perm_smul`, `:309`); uncoloured graphs of `P₁ = {0}`, `P₂ = {0}` isomorphic, codes not | both directions; none |
| 2.3 `borelComplete_graphClass` | one edge with `κ = (0,1)`; vertex set | tagged graph: `2+3+4 = 9` vertices, `1+3+6+2 = 12` edges; a non-tag `x` has neighbours `H`-neighbours and tag `0`, pairwise non-adjacent: in no triangle; tag `0` has `κ x + 2` triangle neighbours; vertex set and tags independent of `c`, each output coordinate constant or one coordinate of `c` | continuous on the whole space, reflects and preserves; none |
| 3.1 dense colouring | `3/4`, `5`, `−1/6`, `1/8008`; sign colouring; `σ = (0 1)` | `ν = 2, 0, 1, 3` (`8008 = 2³·1001`); `j/(2^m q)`, `j, q` odd, dense for each `m`; negatives are an initial segment, non-negatives are not; `ν(π(1/2)) = σ(1) = 0`; an isomorphism of `(ℚ, <, ν⁻¹(m))` onto `(ℚ, <, ν⁻¹(σ m))` is `ν ∘ π = σ ∘ ν` | sound; density needed; none |
| 3.2 parent definable | `x = p·r`; competitor `p'` first differing at `i` | `p < z < p·r` forces `z = p·s·w`, `s < r`, length `≥ |x|`; `z = (x_0…x_{i−1}, q)`, `p'_i < q < x_i`, length `i + 1 < |x|` | unique; none |
| 3.2 unravelling, all codes | `c` = only `adjAtom 0 1`, `d` = only `adjAtom 1 0`, `τ = (0 1)`; loop at `0` against empty; loops `{0}` against `{0,1}` | `(τ • c).eval (adjAtom u v) = c.eval (adjAtom (τ u) (τ v))`: T iff `(u,v) = (1,0)`, so `d = τ • c`; node `[1/2, 1]`: `a = (1,0)` ↦ `(0,1)`, bits at index `(1,0)`: T, T; at `(0,1)`: F, F; loop: colour (length 1, diagonal T) at `[1]`, nowhere for the empty graph; `{0,1}`: a length-2 node with two distinct looped entries, none for `{0}` | (i) ⇔ (ii) ⇔ (iii) off `graphClass`; repaired statement holds |
| 3.2 (iii) ⇒ (i) | `Ψ` preserving parents and colours; back step | colours fix lengths; `z = Ψ⁻¹(Ψ x · r')` is not the root, `Ψ(parent z) = Ψ x`, so `parent z = x`; pairs `(a(x), a(Ψ x))` extend by `snoc`, the shape of `IsTupleBFSystem.forth`/`back` (`TupleSystem.lean:39–50`) | a tuple system; none |
| 3.3 block order, all codes | `χ = 0, 4` at one block; distinct blocks; constant-true code against the complete graph | `χ = 0`: threshold 2, `(x,5) < (x,0)`; `χ = 4`: threshold 6, `(x,0) < (x,5)`; distinct blocks: bit `[x < y]`, no coordinate of `c`; finite condensation classes = final parts of size `χ + 2` (ω-part against finite part: infinite interval; two blocks: infinite by density); length-1 colour with diagonal T against F: sizes differ | continuous, lands in `linearOrderClass`, reflects for all codes; none |
| 3.4 tagged tree, all codes | `χ = 0, 1`; tags of distinct `x`; constant-true code | chain `some 0 < … < some (χ+1)`: heights 2 and 3; surplus leaves give chains of 2; tags of distinct `x` incomparable; down-set of `(x, some m)`: `|x| + 1` prefixes and at most `χ + 2` tags, a finite chain; originals = starts of infinite chains (`x < x·0 < x·0·0 < …`) | in `treeClass` for every code, reflects; none |
| 3.4 `treeClass` not closed | `c_n`: `n < n−1 < … < 0 < n+1 < …` | type ω with least element `n`: in `treeClass`; for `n > max(i,j)` the bit at `(i,j)` is `[i ≥ j]`: limit `(ℕ, ≥)`, infinite down-sets | Check correct; none |
| 3.5 presentations | `{[],[0],[1],[0,0]}`; star `T` and `T_n`; ray marked at `0` or `1`; `(ℕ, ≥)` | 4 nodes: no code on ℕ; `tree` is `x ++ [a] ∈ T → x ∈ T` (`Descriptive/Tree.lean:32–33`), matching the increasing-list map; `T_n → T` coordinatewise, cover edge `(0,1)` T in `T`, F in every `T_n`; marked vertex of degree 1 against 2 | Borel and not continuous; (b) stays on `treeClass`; none |
| 4.1 Borel S∞-spaces | evaluation on ℕ; trivial action; uncountably many unary symbols; equivariant injection `f` | 1 orbit; orbits are points; product σ-algebra sets depend on countably many coordinates, no singleton measurable; `f x = g • f y = f (g • y)` gives `x = g • y` | sound; none |
| 4.2 anchored map | `X = ℕ`, `S_n = {n}`; one point; `h • x`; `x ≠ y` | `(1,0)` at `(a)`, `x`: `∃ g, g a = 0 ∧ g x = 0` ⇔ `x = a`; non-injective `a`: no `g`; `g' = g h`: `g'(h⁻¹ (a i)) = i`, the condition at `x`, `h⁻¹ ∘ a`; `g_k`, `g_k⁻¹` fix `0..k−1`, so `g_k → 1` (`hasBasis_nhds_one_fixingSubgroup`, `Perm.lean:149`), `g_k • y → y ∈ closure S_n` | equivariant, injective; none |
| 4.2 packing | `m = 0, 1, 2` | `pair 0 1 = 1`, `pair 1 0 = 2`: `unpair 1 = (0,1)`, `unpair 2 = (1,0)`; `(n,k) = unpair m`: unary reads `(1,0)`, binary reads nullary `(0,1)`; `k ≤ m` (`Nat.unpair_right_le`, `Pairing.lean:108`), `k ≤ pair n k` (`right_le_pair`, `:103`) | Checks correct; none |
| Layer 5 | `graphClass`; `∅`; one unary predicate | T×5; F×5 (each clause has a nonempty instance); (2) F: `2^ℵ₀` against `ℵ₀` classes | sound; none |
| 6.1 `bfEquiv_omega0_opow_mul` | step `γ + 1`, cut after `ξ = ω^γ μ + ρ`; `γ = 1`; `ω`, `ω + 1` | rest after `ξ + 1`: `ω^(γ+1)(δ − δ₁) ≠ 0`; `m'` exists since `ω^γ + ρ < ω^(γ+1)`; empty against nonempty F at level 1; `ω + 1` has a maximum cutting an empty upper interval | sound; `δ, ε ≠ 0` needed; none |
| 6.2 headline | types `ω^(1+β)`, `ω^(1+β)·2`; `β = 0` | countable, infinite (`ω`, `ω·2`), not isomorphic; `BFEquiv (1+β)` by 6.1 with `δ = 1`, `ε = 2`; `β ≤ 1 + β`, so `BFEquiv β`; base `exists_uniform_bfSeparation` says F | contradiction for arbitrary `K`; none |
| 6.2 consequences | invariant Borel `K`; `K = ∅` | complement of the non-isomorphic pairs `= (iso ∩ K ×ˢ K) ∪ (K ×ˢ K)ᶜ`, analytic (`analyticSet_setOf_isoSetoid`, `Isomorphism.lean:187`); `K = ∅`: empty relation, not Borel complete | sound; none |
| 6.3 E₀ coding | `x = 0^ω`, `y = 1 0^ω`; `y = 1^ω`; `F = ∅` only | copy `F` of `x` has `P = F`; copy `F ∆ {0}` of `y` has `P = {0} ∆ F ∆ {0} = F`; `1^ω`: cofinite `P` in every copy against finite; single copies of `x ≠ y` differ: equality, not `eZero` | reduces `eZero` (`eZero_iff_finite`, `EZero.lean:95`); none |
| 6.3 count | `BorelComplete K` | `𝔠 = #(Quotient eZero)` (`mk_quotient_eZero`, `:238`) `≤ #(Quotient (classIso K)) ≤ #K ≤ 𝔠` (`mk_le_continuum`, `Topology.lean:109`, countable symbols and carrier, in Convention 1) | continuum many; none |
| 6.5 lower part | one unary predicate against `eZero` | classes `|P| = n`, `|Pᶜ| = n`, both infinite: `ℵ₀`, each Borel, so smooth (`isSmooth_of_countable_quotient`, `BorelReducibility.lean:289`, hypothesis: each class measurable); `eZero →` unary F by `2^ℵ₀ > ℵ₀`; unary `→ ⊥ → eZero` T | sound; none |
| 6.4 obstruction | `ρ = 0`; `A = g '' B`, `ρ = 0` on `A`, `1` off it | `K_0 = K`: (a) is the negation of 6.2; diagonal of `A` measurable in the subtype product, not in the ambient square (preimage under `c ↦ (c,c)` is `A`) | subtype reading is the one the proof uses; none |

Remarks needing no change: `graphLanguage L` is `Language.{u, max u v}` at the pin
(`GraphTranslation/Language.lean:82`), which the README calls "in the universes of `L`"; for the
languages in `Language.{0, 0}` that 1.2 quantifies over the two agree. In 3.4 the removal of labels
by tags is the roadmap's own; montalban-cst1 lines 4205–4245 support the labelled trees only, as
the plan's locator for 3.10 says.

### Sources: the seeded sample

The manifest flags as unverified only the section numbers of settled uncertified works
(friedman-stanley-1989 and mekler-1981 "from memory", gao-idst "to be checked") and the Annals
numbering of paolini-shelah-tfab; none of these texts can be read here (see Not verifiable). Cached
texts opened at the cited lines:

| Target | Locator read | Result |
| --- | --- | --- |
| 0.1, Convention 2 | paolini-shelah-tfab lines 56–58, 65–68, 83–87, 95–96; camerlo-gao-boolean lines 106–110 | match |
| 0.2 | paolini-shelah-tfab lines 70–73 (Definition 1.2), 88–91 (Remark 1.5; converse at line 91) | match; the source has standard Borel spaces, the README measurable spaces |
| 1.1 | becker-kechris-bams lines 159–164 | match; same convention as `eval_perm_smul` |
| 1.3 | camerlo-gao-boolean lines 87–93; paolini-shelah-tfab lines 60–64 | match |
| 2.1 | montalban-cst1 line 4572 (Theorem VI.27), lines 4623–4654 | supports "classical, different gadgets"; the construction is the roadmap's own, checked directly |
| 2.3 | camerlo-gao-boolean lines 111–112; paolini-shelah-tfab line 125 | match; friedman-stanley-1989 Theorem 1 not read |
| 3.1 | montalban-cst1 lines 4258–4260, 4273–4275 | match |
| 3.3 | montalban-cst1 lines 4246–4288 (label plus two at 4288) | match |
| 3.4 | montalban-cst1 lines 4205–4245 | match for labelled trees of tuples |
| 3.5 | camerlo-gao-boolean lines 257–263, 276–281 | background for the binary case, as stated |
| 4.1 | becker-kechris-bams lines 126–131 | match (Borel embeddings of Borel G-spaces; the definition of a Borel action is at line 26) |
| 4.2 | becker-kechris-bams lines 132, 172–177, 247–268 | match; the anchored route is the roadmap's own |
| 6.2 | paolini-shelah-tfab lines 103–106 (Fact 1.7) | match (non-Borel part) |
| 6.3 | camerlo-gao-boolean lines 94–100 | match (orbit relations of closed subgroups of S∞ reduce) |
| 6.1 | montalban-cst2 lines 2322–2331 | match, with the source's slip recorded below |
| 6.5, parts of 2.3, 3.3–3.5, Layer 5 | gao-idst, friedman-stanley-1989, becker-kechris-1996 | not read (settled uncertified) |

Every work cited in the text has a manifest entry; nothing was added or changed; no request was
written.

### Pinned declarations opened

A script searched both pins for the last component of each of the 266 identifier-shaped backticked
spans of the README (variables included): the 30 not found are this roadmap's own names, the base's
targets, NoncompactQuantumSymmetry's theorem and the vertex name `u_q`. Opened by
hand this round: `restrict`, `eval_restrict`, `perm_smul_def`, `eval_perm_smul`, `instMulActionPerm`
(`ModelTheory/RelationalConfiguration/Basic.lean:211, :215, :304, :309, :314`); `Equiv.encodeVia`,
`nonempty_equiv_encodeVia` (`Structure.lean:93, :111`); `perm_smul_eq_encodeVia`,
`isoSetoid_iff_exists_perm_smul_eq`, `Equiv.isoSetoid_encodeVia_iff`, `analyticSet_setOf_isoSetoid`
(`Isomorphism.lean:100, :135, :149, :187`); `mk_le_continuum` (`Topology.lean:109`);
`IsTupleBFSystem` (`BackAndForth/TupleSystem.lean:39`); `BorelReducible`,
`borelReducible_iff_exists_eq_comap`, `IsSmooth`, `isSmooth_of_countable_quotient`
(`SetTheory/Descriptive/BorelReducibility.lean:100, :108, :229, :289`); `eZero_iff_finite`,
`not_isSmooth_of_borelReducible_eZero`, `mk_quotient_eZero`, `borelReducible_bot_eZero`
(`EZero.lean:95, :219, :238, :243`); `GraphRelation`, `graphLanguage`
(`Infinitary/GraphTranslation/Language.lean:71, :82`); `hasBasis_nhds_one_fixingSubgroup`
(`Topology/Algebra/Group/Perm.lean:149`). Mathlib: `Language.graph` (`ModelTheory/Graph.lean:49`),
`Theory.simpleGraph_model_iff` (`:72`), `Language.order`, `linearOrderTheory`
(`ModelTheory/Order.lean:76, :163`), `equiv_between_cg` (`PartialEquiv.lean:499`),
`Structure.cg_of_countable` (`FinitelyGenerated.lean:278`), `Theory.fieldOfChar`
(`Algebra/Field/CharP.lean:47`), `Descriptive.tree` (`SetTheory/Descriptive/Tree.lean:32`),
`Nat.right_le_pair`, `Nat.unpair_right_le` (`Data/Nat/Pairing.lean:103, :108`), `MeasurableSMul₂`
(`MeasureTheory/Group/Arithmetic.lean:463`), `ContinuousSMul.measurableSMul₂`
(`Constructions/BorelSpace/Basic.lean:614`), `Measurable.exists_continuous`,
`MeasurableSet.analyticSet_image`, `AnalyticSet.preimage`, `AnalyticSet.measurableSet_of_compl`,
`MeasurableSet.image_of_measurable_injOn`, `MeasurableSet.standardBorel`
(`Constructions/Polish/Basic.lean:331, :353, :366, :524, :836, :1110`).

Duplication by object: neither pin has Borel completeness, a restricted isomorphism setoid on an
arbitrary set of codes, set reducibility, a class of linear-order or tree codes, or a σ-algebra on
`Equiv.Perm`. Tau Ceti has a `graphClass` in `TauCeti.ContCohomology`
(`RepresentationTheory/Homological/ContCohomology/Evens/`), another object in another namespace:
no clash with this roadmap's namespace.

### Cross-roadmap citations, ownership and overlap

- CountableStructureSpaces (open, a new roadmap of another author; read at its head): Layer 0
  closed range of the graph coding; Layer 1.2 "The action is jointly continuous (a `ContinuousSMul`
  instance), for every language" from the same two ingredients; the acceptance check with the
  3-cycle under Layer 1 Examples; Layer 3 `analytic_treeHeight_bounded`; 4.3
  `measurableSet_iso_inter_of_scottHeight_le`; 4.4 `exists_uniform_bfSeparation`; 5.3
  `lopez_escobar`; 6.2 `wellOrderClass` (strict), `exists_mem_wellOrderClass_type_eq`
  (`ω ≤ β < ω₁`), `analyticSet_compl_wellOrderClass`, `not_measurableSet_wellOrderClass`; worked
  example 2. Each exists with the hypotheses this design uses.
- NoncompactQuantumSymmetry (earlier in the merge order; open head): Layer 4, M1.BorelRealization,
  `exists_polishTopology_continuousSMul`, with the signature the contract states (Polish group with
  `BorelSpace`, `StandardBorelSpace X`, `MeasurableSMul₂`).
- On main: BorelEquivalenceRelations §5.1–§5.4; InfinitaryModelExistence 0.3 (the small
  presentation is in that section) and Layer 6; CountableModelCounting Layer 0 (`isoSetoidOn`,
  transport between presentations); InfinitaryLogic Layer 1 (completed).
- `roadmaps grep` over main and the open heads for `BorelComplete`, `classIso`, `SetReducible`,
  `universalLanguage`, `linearOrderClass`, `treeClass`, "Borel G-space", "S∞-space", a
  `MeasurableSpace` on `Equiv.Perm`, Friedman–Stanley: no other owner. CountableModelCounting's
  "Borel complete invariant" is another notion. The overlaps file lists no other pull request
  changing this roadmap, no dropped id, no revision-only id and no second copy; `roadmaps resolve`
  lists no citation or Lean name found nowhere.

Overlap check: read CountableStructureSpaces, BorelEquivalenceRelations, CountableModelCounting; nothing shared (the coding space and its base theorems are CountableStructureSpaces', general reducibility and E₀ are BorelEquivalenceRelations', isomorphism on the models of one sentence is CountableModelCounting's, `classIso` on arbitrary sets and Borel completeness are this roadmap's).

### Supplier order

All *Needs:* lines and layer Dependencies read: no upward citation, cycle, forbidden supplier or
unowned prerequisite; no gap is declared and none is needed. Gate output:

```text
candidate: CountableStructureSpacesPartII is not in the merge order yet; checked as if placed after NoncompactQuantumSymmetry (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2230 edges, 0 problem(s)
```

### Shape, headline theorems, residue

Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, seven
layers each ending with Examples and Dependencies, Downstream consumers, References. Every
definition has API bullets and at least three Checks; every theorem its hypotheses and a locator or
the mark "own construction". A grep finds no LaTeX delimiters, pull-request numbers, dates, machine
paths, round labels or "optional/deferred" wording.

Headline theorems for the package stage, all statable at the pins with real-bodied definitions:
`borelComplete_graphClass`, `borelComplete_linearOrderClass`, `borelComplete_treeClass`,
`exists_continuous_reduction_graphClass_linearOrderClass`,
`exists_equivariant_measurableEmbedding_universal`, the four `borelComplete_iff_…` equivalences,
`bfEquiv_omega0_opow_mul`, `not_measurableSet_classIso_of_borelComplete`,
`borelReducible_eZero_of_borelComplete`, `not_isSmooth_of_borelComplete`,
`not_borelComplete_of_rank_bounded`. The padding probe has nothing to run on at this stage.

### Copyright and arrangement

Wording compared at the 15 read rows of the sample table and at six further passages (the definition
of `BorelComplete` against paolini-shelah-tfab lines 95–101; `SetReducible` against lines 70–73; the
proof of 4.2 against becker-kechris-bams lines 247–268; the parent definition of 3.2 against
montalban-cst1 lines 4279–4283; 2.2 against lines 4641–4654; 6.1 against montalban-cst2
lines 2322–2331): the statements share only what the mathematics forces (the reducibility formula,
the parent condition); the proofs take other routes (tuple systems for a category argument, anchored
symbols for closed-set codes, clique tags for flags and connectors). No table, figure or list is
taken over. paolini-shelah-tfab has the largest share of locators; its sections (introduction,
preliminaries, the combinatorial frame, the group construction) correspond to no layer here.

Source independence: 21 passages compared with 5 sources, none shared; largest share paolini-shelah-tfab, 13 of 49 locators; contents compared with paolini-shelah-tfab: independent. The seven uncertified works (15 of the 49 locators) could not be read.

## Not verifiable

- The seven settled uncertified texts (friedman-stanley-1989, gao-idst, becker-kechris-1996,
  kechris-cdst, hjorth-2000, hjorth-kechris-1996, mekler-1981): cited by locator only; their
  section numbers, three of which the manifest says are from memory or to be checked, could not be
  read. Not requested again. The proofs of the targets citing them (2.3, 3.3–3.5, Layer 5, 6.4,
  6.5) were checked directly.
- The Annals numbering of paolini-shelah-tfab: the cached text is arXiv v6, as the manifest notes.
- The published numbering of montalban-cst1 and montalban-cst2: the cached texts are the author's
  drafts, and the README cites them as drafts.
- Lean elaboration, binder inventories and the one-tactic probe: no `Suggested.lean` at the design
  stage, and this lane does not elaborate.
- Ownership against open pull requests was checked through the roadmap index (README and
  `Suggested.lean` at each head), not through other files of those branches.

## Source issues

- **Error** in montalban-cst2 at Lemma II.37, printed pages 35–36: the source says comparing the intervals cut out by weakly increasing tuples decides the back-and-forth relation; it should also require the two tuples to have the same equality pattern; affects a stated result.
- **Error** in montalban-cst1 at the proof of Lemma VI.18, printed page 91: the source says finite sequences of rationals in lexicographic order form a copy of the rationals; it should say a dense order whose least element is the empty sequence; affects the proof.
- **Error** in camerlo-gao-boolean at the definition of rooted binary tree, printed page 496: the source says a root, unique parents and at most two children identify the order with a subtree of binary sequences; it should also require finite ancestor sets; affects a stated result.
- **Error** in becker-kechris-bams at §2, arXiv page 4: the source says the coding space of every nonempty countable relational language is homeomorphic to Cantor space; it should exclude languages with only finitely many symbols, all nullary; affects nothing.

## For the human reviewers

- **Licence.** montalban-cst1 and montalban-cst2 are author's drafts fetched from the author's page (manifest entries of those ids); they are cited for locators only, and the published volumes' numbering was not compared.
- **Not tested.** Seven cited works are uncertified and unread, among them friedman-stanley-1989, the primary source of Layers 2, 3 and 6.4 (7 of 49 locators, section numbers recorded as from memory): wording and arrangement were not compared with them.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e1586f4f70e61227359994a1aa31f0df5c440326", "job": "REV-DESIGN-CountableStructureSpacesPartII~7", "model": "fable", "worker": "chris-x26"} -->
