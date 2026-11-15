<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13739#issuecomment-6897206071 -->
Review (claude) of 465b93e

Verdict: accepted

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

No finding. The one round-7 finding is repaired, the repaired passage survives the adversarial
pass, and an independent pass over all seven layers, the 15 sampled targets, the suppliers and the
pins found nothing to repair. This is a design: there is no `Suggested.lean`, and elaboration is
not available (this lane does not elaborate), so no elaboration, `#check` inventory or one-tactic
probe was run and none is claimed. No supplier gap is declared (`gaps: []` in `design/plan.json`),
so the acceptance is unconditional. No maintainer note was left for this roadmap.

## Previous finding (round 7), checked first

| Finding | Status | Repaired passage and my check |
| --- | --- | --- |
| F01 (P3) two works in the References cited nowhere | repaired | `design/README.md:118–120`: "This is the logic action of S∞ on the space of countable structures (kechris-cdst §16.C; becker-kechris-bams lines 159–164, where `g · x` reads `x` at the image of each tuple under `g⁻¹`)". The hjorth-2000 line is gone from the References (`design/README.md:1318–1339`, 11 entries) and from `sources.toml` (11 `[[source]]` tables, same 11 keys). Read: becker-kechris-bams lines 159–164 define the space of structures and the action by reading `x_i` at `g⁻¹` of each entry, and name it the logic action (line 164); camerlo-gao-boolean line 93 names section 16.C of [Kec95] for the action of S∞ whose orbits are isomorphism classes. The manifest's `cited_for` of kechris-cdst and becker-kechris-bams now names the convention. |

Nothing in the repair report was marked not actionable; nothing is re-raised.

Pattern search (a work listed but cited nowhere; a `cited_for` that supports no statement): counted
each of the 11 manifest keys in the README text before the References: paolini-shelah-tfab 13,
camerlo-gao-boolean 8, friedman-stanley-1989 7, montalban-cst1 6, becker-kechris-bams 5,
gao-idst 3, montalban-cst2 3, becker-kechris-1996 2, hjorth-kechris-1996 2, kechris-cdst 1,
mekler-1981 1; total 51, none zero. Every key of the manifest is in the References and conversely.

## Verified sound

### Coverage

Read in full: `design/README.md` (1,339 lines), `sources.toml`, the diff of the repair
(README 3 lines, manifest 2 entries changed and 1 removed; `design/plan.json` unchanged), the
round-7 review and the repair report; `design/plan.json` by script (7 layers, 6 + 7 + 5 + 13 + 5 +
4 + 9 = 49 targets, `gaps: []`, baseline Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, equal to the
revisions in the content repository's `lake-manifest.json`). The changed passage (Convention 4) and
the 15 sampled targets were reviewed with their sources; every other section was recomputed
independently of the round-7 table (rows below).

### Principles

Part II of CountableStructureSpaces (an open new roadmap of another author), whose head lists
"Borel completeness of isomorphism of countable graphs or linear orders" and Vaught transforms as
out of scope (its line 1032–1033). Imported, not planned again: general Borel reducibility,
smoothness and E₀ (BorelEquivalenceRelations §5.1–§5.4), back-and-forth (InfinitaryLogic Layer 1,
completed), the small presentation and graph translation (InfinitaryModelExistence 0.3, Layer 6),
`isoSetoidOn` and transport between presentations (CountableModelCounting Layer 0), the Polish
realization (NoncompactQuantumSymmetry Layer 4). Statements are general (any countable relational
language in any universes, nullary symbols, function symbols, arbitrary codes in Layer 3, arbitrary
`K` in Layer 5 and 6.2). No copied passage, no algorithm, no `set_option`, no sorry'd data (no Lean
file). Layer order is forced by the *Needs:* lines: 1 needs 0.1; 2.3 needs 1.1, 1.2; 3.3–3.4 need
2.3 and 3.2; 5 needs 0.1, 1.2, 1.3, 2.3, 4.1, 4.2; 6.2 needs 6.1 and 3.3; 4 needs only 4.1 and the
supplier, and 6.1 only the pins, and the README says so. No layer is named after a source chapter
and the README does not say it follows a source.

### Adversarial table

| Statement | Instances tried | Values computed | Result; change |
| --- | --- | --- | --- |
| Convention 4 (changed): logic action | one unary `P = {0}`, `g` the 3-cycle `0 ↦ 1 ↦ 2 ↦ 0`; wrong model `y(s) = x(g s)` | source rule (becker-kechris-bams lines 162–163) `y(s) = x(g⁻¹ s)`: `g⁻¹ 1 = 0` so `y(1) = 1`, `g⁻¹ 0 = 2` so `y(0) = 0`: `P = {1}`; pin `(σ • c).eval a = c.eval (a.map σ.symm)` (`Basic.lean:309`) gives the same; wrong model gives `{2}` | agrees with the witness in the convention and the base's acceptance check (`P = {1}`, inverse convention `{2}`); none |
| 0.1 `classIso`, Checks | `K = {∅, ℕ}`; `K = ∅`; `Fin 2`; `P` infinite coinfinite | both codes fixed by all permutations: 2 classes; maps into `∅` only from `∅`; 4 codes, classes by `|P| = 0, 1, 2` (3 classes); one orbit, constant map reduces and is not injective | Checks hold; none |
| 0.2 `SetReducible`, empty and full targets | `X = Unit, Y = Empty`; `X = Y = Empty`; one-point `Y`; `{0} ⊆ ℕ` | 0 maps `Unit → Empty`: not reducible although `A = ∅`; empty map: both hold; diagonal of a point is `univ`; `0 ↦ (0,0)`, `n+1 ↦ (0,1)` has preimage `{0}` | both directions of each iff; none |
| 0.2 converse fails | `eZero` against `⊥` on Cantor space | two-valued map on a Borel graph (`measurableSet_eZero`, `EZero.lean:105`): set reducible; Borel reducible to `⊥` is `IsSmooth eZero` (`BorelReducibility.lean:229`), false (`EZero.lean:214`) | T and F; none |
| 1.1 relabelling direction | `Fin 3`, `e = (0 1 2)`, `P = {0}` | pin `restrict (f : V → W) : Config W → Config V`, value `c.eval (a.map f)` (`Basic.lean:211`); `restrict e.symm`: `{w | e⁻¹ w = 0} = {1}`; `restrict e`: `{w | e w = 0} = {2}`; twice: `{2} ≠ {0}` | matches Convention 4; none |
| 1.1 empty carrier | `Fin 0`, no nullary symbol; one nullary | atoms of arity `> 0` need a map `Fin n → Fin 0`: none, 1 code; nullary: 2 codes, 2 classes | Check correct; none |
| 1.2 `BorelComplete` | `K = ∅`; `P_i ∈ {∅, ℕ}`; `K ⊆ K₂` | no map from nonempty `univ` to `∅`; `2^ℵ₀` types against `ℵ₀` for one unary predicate; inclusion reduces | Checks and transfer hold; none |
| 1.3 graph-code map | constant `k`, `F k = 3`; values `n → ∞`; relational `L`; action on tables | relation `{3}`; relations `{n}` converge to the empty relation (totality fails): range not closed, also with constants only; empty table, range everything; graph bit of `σ • F` at `w` is `F(σ⁻¹ ∘ init w) = σ⁻¹ (last w)`, the bit of `F` at `σ⁻¹ ∘ w` | Gδ, not closed, equivariant; none |
| 2.1 incidence graph | `R = {(0,1)}`; two unary symbols; nullary symbol | colours `0`, `1`, `2 + 2j` (even ≥ 2), `3 + 2ι(R)` (odd ≥ 3) pairwise distinct sorts; degrees 3 and 2; image of `t_q` forced to `t_{atom R (σ ∘ v)}` through the unique colour-`(2+2j)` and point neighbours; `(σ • c).eval (atom R (σ ∘ v)) = c.eval (atom R v)` | both directions; colours needed; none |
| 2.2 clique tags | edge with `κ = (0, 1)`; triangle; `κ = 0` against `1` | `2 + 3 + 4 = 9` vertices, `1 + 2 + 3 + 6 = 12` edges; non-tag `x` has neighbours in `H` and tag `0`, pairwise non-adjacent: no triangle; tag `0` has `κ x + 2` triangle neighbours; `K₃` against `K₄` | recognition holds exactly for triangle-free `H`; none |
| 2.3 `borelComplete_graphClass` | any `L'`; `L'` empty | vertex set and tags independent of `c`; each adjacency coordinate constant or one coordinate of `c` (truth edges); empty `L'`: points with `K₃` tags, one code | continuous on the whole space, lands in `graphClass`, reflects and preserves; none |
| 3.1 dense colouring | `3/4`, `5`, `−1/6`, `1/8008`; sign colouring; `σ = (0 1)` | `ν = 2, 0, 1, 3`; `ν(π r) = σ(ν r)` is exactly an isomorphism of `(ℚ, <, ν⁻¹(m))` onto `(ℚ, <, ν⁻¹(σ m))`; negatives an initial segment, non-negatives not | sound; density needed; none |
| 3.2 parent definable | `x = p·r`; competitor `p'` first differing from `x` at `i` | `p < z < p·r` forces `z = p·s·w` with `s < r`, length `≥ |x|`; `z = (x_0 … x_{i−1}, q)` with `p'_i < q < x_i` has length `i + 1 < |x|` and lies in `(p', x)` | unique; none |
| 3.2 unravelling, all codes | `c` = only `adjAtom 0 1`, `d = τ • c`, `τ = (0 1)`; loop against empty; (iii) ⇒ (i) back step | `d` has only `adjAtom 1 0`; node `[1/2, 1]`, `a = (1,0) ↦ (0,1)`: bits at `(1,0)` T, T and at `(0,1)` F, F; loop colour at `[1]` occurs nowhere for the empty graph; `z = Ψ⁻¹(Ψx · r')` has `Ψ(parent z) = Ψ x`, so `parent z = x`; root fixed since colour encodes length 0 | (i) ⇔ (ii) ⇔ (iii) off `graphClass`; none |
| 3.3 block order | `χ = 0, 4`; distinct blocks; constant-true against simple graphs | thresholds 2 and 6: `(x,5) < (x,0)` against `(x,0) < (x,5)`; distinct blocks compare by `[x < y]`; finite condensation classes are the final parts of size `χ + 2` (ω-part to finite part and block to block are infinite intervals, `List ℚ` dense: `x < x·(r−1) < x·r`) | continuous, in `linearOrderClass`, reflects for all codes; none |
| 3.4 tagged tree; `treeClass` not closed | `χ = 0, 1`; `c_n`: `n < … < 0 < n+1 < …` | chain `some 0 < … < some (χ+1)`: heights 2, 3; down-set of `(x, some m)`: `|x| + 1` prefixes and at most `χ + 2` tags; originals are the starts of infinite chains; for `n > max(i,j)` the bit at `(i,j)` is `[i ≥ j]`, limit `(ℕ, ≥)` | in `treeClass` for every code, reflects; Check correct; none |
| 3.5 presentations | `{[],[0],[1],[0,0]}`; star `T`, `T_n` with `0 < n < 1`; ray marked at `0` or `1` | 4 nodes: no code on ℕ; pin `tree A` is closure under `x ++ [a] ∈ T → x ∈ T` (`Descriptive/Tree.lean:32`); `T_n → T` coordinatewise, cover edge `(0,1)` T in `T`, F in every `T_n`; degree of marked vertex 1 against 2 | (a) holds; (b) Borel, not continuous; none |
| 4.1 Borel S∞-spaces | evaluation on ℕ; trivial action; uncountably many unary symbols; equivariant injection | 1 orbit; orbits are points; `MeasurableSpace.pi` sets depend on countably many coordinates (the σ-algebra is that of `Atom L V → Bool`, `Basic.lean:182`): no singleton measurable; `f x = g • f y = f (g • y)` gives `x = g • y` | sound; none |
| 4.2 universal embedding | `X = ℕ`, `S_n = {n}`; one point; `h • x`; `x ≠ y` | `(1,0)` at `(a)`, `x`: `∃ g, g a = 0 ∧ g x = 0` iff `x = a`; non-injective `a`: no `g`; `g' = g h` has `g'(h⁻¹ (a i)) = i`: condition at `x`, `h⁻¹ ∘ a`; `g_k`, `g_k⁻¹` fix `0..k−1`, `g_k → 1` (`Perm.lean:149`), `g_k • y → y ∈ closure S_n` | equivariant for Convention 4, injective, open conditions; none |
| 4.2 packing | `m = 0, 1, 2` | `unpair 0 = (0,0)`; `unpair 1`: `sqrt = 1`, `1 − 1 = 0 < 1`, so `(0,1)`; `unpair 2`: `2 − 1 = 1 ≮ 1`, so `(1, 0)`; `pair 1 0 = 1 + 1 + 0 = 2`; `(n,k) = unpair m`: unary reads `(k,n) = (1,0)`, binary reads nullary `(0,1)`; other order: unary would read `(0,1)` | Checks correct; `k ≤ m` (`Pairing.lean:108`), `k ≤ pair n k` (`:103`); none |
| Layer 5 | `graphClass`; `∅`; one unary predicate | T ×5; F ×5 (each clause has a nonempty instance: `univ`, `graphClass`, a nonempty `X`); (2) F by `2^ℵ₀` against `ℵ₀` classes | cycle (1)⇒(3)⇒(4)⇒(1), (1)⇔(2), (3)⇔(5) closes; none |
| 6.1 interval lemma | level 0; successor; tuple with a repeated entry | level 0 is `SameAtomicType` (`Equivalence.lean:65`), assumed, and intervals compare trivially; at `γ + 1` (`add_one`, `:70`): forth inside interval `I_j` splits it into two sub-intervals matched at level `γ`, an entry is answered by the corresponding entry; distinct values listed once | holds with the same-atomic-type hypothesis; none |
| 6.1 `bfEquiv_omega0_opow_mul` | step `γ + 1`, cut after `ξ = ω^γ μ + ρ`; `γ = 1`; `ω` against `ω·2` and `ω + 1` | `ξ = ω^(γ+1) δ₁ + ξ'`, rest after `ξ + 1` is `ω^(γ+1)(δ − δ₁) ≠ 0`; `m'` exists as `ω^γ + ρ < ω^(γ+1)`; `ω`, `ω·2` at level 2: answers need only nonempty against nonempty at level 1; `ω + 1`: maximum cuts an empty upper interval, empty against nonempty fails level 1 | sound; `δ, ε ≠ 0` needed; none |
| 6.2 headline | types `ω^(1+β)`, `ω^(1+β)·2`; `K = ∅` | countable, infinite, distinct ordinals; `BFEquiv (1+β)` by 6.1 (`δ = 1`, `ε = 2`), `β ≤ 1 + β`, `mono` (`:96`); the base's separation level `β` says F; `K = ∅`: hypothesis F | contradiction for arbitrary `K`; none |
| 6.2 consequences | invariant Borel `K` | complement of the non-isomorphic pairs is `(iso ∩ K ×ˢ K) ∪ (K ×ˢ K)ᶜ`, analytic (`Isomorphism.lean:187`); Suslin (`Polish/Basic.lean:524`) | sound; none |
| 6.3 E₀ coding and count | `0^ω` against `1 0^ω` and `1^ω`; `F = ∅` only | copy `F ∆ {0}` of `y` has `P = y ∆ F ∆ {0} = x ∆ F`; finite against cofinite `P` in every copy; single copies reduce equality only; `𝔠 = #(Quotient eZero)` (`EZero.lean:238`) `≤ #types ≤ 𝔠` (`Topology.lean:109`) | reduces `eZero`; continuum many types; none |
| 6.4 obstruction | `ρ = 0`; `K = ∅`; `A = g '' B`, `B` non-measurable | `K_0 = K`: (a) negates 6.2; `K = ∅`: (a), (b) hold and `¬ BorelComplete ∅` is true; diagonal of `A` measurable in the subtype square, its preimage under `c ↦ (c,c)` is `A`: not in the ambient square | subtype reading is what the proof uses; none |
| 6.5 lower part | one unary predicate against `eZero` | `ℵ₀` Borel classes: smooth (`BorelReducibility.lean:289`); `eZero →` unary F by cardinality (`:146`); unary `→ ⊥ → eZero` T (`EZero.lean:243`) | sound; none |

### Sources: the seeded sample

The manifest flags as unverified the section and theorem numbers of friedman-stanley-1989 and
mekler-1981 ("from memory"), those of gao-idst ("to be checked") and the Annals numbering of
paolini-shelah-tfab; none of those texts can be read here (see Not verifiable). Cached texts read
at the cited lines this round:

| Target | Locator read | Result |
| --- | --- | --- |
| Convention 4 | becker-kechris-bams lines 159–164; camerlo-gao-boolean line 93 | match |
| 0.1, Convention 2 | paolini-shelah-tfab lines 56–58, 65–68, 83–87, 95–101; camerlo-gao-boolean lines 106–110 | match |
| 0.2 | paolini-shelah-tfab lines 70–73, 88–91 | match (the source has standard Borel spaces; the README's measurable spaces are wider and the statements were checked directly) |
| 1.1 | becker-kechris-bams lines 159–164 | match |
| 1.2 | paolini-shelah-tfab lines 95–101; camerlo-gao-boolean lines 106–110 | match |
| 1.3 | camerlo-gao-boolean lines 87–93; paolini-shelah-tfab lines 60–64 | match |
| 2.3 (and 2.1, 2.2) | camerlo-gao-boolean lines 111–112; paolini-shelah-tfab line 125; montalban-cst1 lines 4572–4576, 4623–4654 | match; the gadgets are the roadmap's own |
| 3.1 | montalban-cst1 lines 4258–4260, 4273–4275 | match |
| 3.2 | montalban-cst1 lines 4205–4285 | match (category argument there, tuple systems here) |
| 3.3 | montalban-cst1 lines 4246–4288 | match (label plus two at 4287–4288) |
| 3.5 | camerlo-gao-boolean lines 257–263, 276–281 | background for the binary case, as stated |
| 4.2 (and 4.1) | becker-kechris-bams lines 126–133, 172–177, 247–268 | match; the anchored route is the roadmap's own |
| 6.2 (and 6.1) | paolini-shelah-tfab lines 103–106; montalban-cst2 lines 2322–2331, 2337–2339, 2424–2425 | match |
| 6.3 | camerlo-gao-boolean lines 94–100 | match |
| 6.4, 6.5 | friedman-stanley-1989 §4, hjorth-kechris-1996 §4–§5, gao-idst §5.2, §13.1 | not read (settled uncertified); statements checked directly |

Every work cited in the text has a manifest entry. Nothing was fetched, nothing added to the
manifest, no request written.

### Pinned declarations opened

Tau Ceti, by file and line at the pin: `restrict`, `restrict_id`, `restrict_comp`,
`measurable_restrict`, `ofStructure`, `perm_smul_def`, `eval_perm_smul`, `instMulActionPerm`, the
`MeasurableSpace` instance (`ModelTheory/RelationalConfiguration/Basic.lean:211, :219, :222, :228,
:287, :304, :309, :314, :182`); `continuous_iff`, `continuous_restrict`,
`continuous_uncurry_restrict`, `isClopen_setOf_eval`, `mk_le_continuum` (`Topology.lean:52, :64,
:70, :89, :109`); `toStructure_relMap`, `encodeVia`, `eval_encodeVia`, `nonempty_equiv_encodeVia`,
`encodeVia_trans` (`Structure.lean:42, :93, :98, :111, :126`); `perm_smul_eq_encodeVia`,
`isoSetoid_iff_exists_perm_smul_eq`, `isoSetoid_eq_orbitRel`, `Equiv.isoSetoid_encodeVia_iff`,
`analyticSet_setOf_isoSetoid`, `IsomorphismInvariant`, `isomorphismInvariant_iff_isInvariantBlock`
(`Isomorphism.lean:100, :135, :141, :149, :187, :227, :244`); `modelsOf` (`ModelsOf.lean:66`);
`onConfiguration`, `isoSetoid_onConfiguration_iff`, `image_onConfiguration_modelsOf`
(`LanguageMap.lean:186, :240, :277`); `adjAtom`, `IsSimpleGraph`, `IsSimpleGraph.restrict`,
`measurableSet_setOf_isSimpleGraph`, `eval_toRelationalConfiguration_adjAtom`,
`relationalConfigurationEquiv`, `range_toRelationalConfiguration`,
`measurableEmbedding_toRelationalConfiguration`
(`Combinatorics/SimpleGraph/RelationalConfiguration.lean:73, :97, :120, :126, :210, :222, :267,
:277`); `instTopologicalSpace`, `continuous_inv_apply`, `instIsTopologicalGroup`,
`instPolishSpace`, `hasBasis_nhds_one_fixingSubgroup` (`Topology/Algebra/Group/Perm.lean:42, :58,
:110, :143, :149`); `BorelReducible`, `borelReducible_comap`,
`BorelReducible.exists_measurable_injective_quotient`, `BorelReducible.lift_mk_quotient_le`,
`BorelReducible.measurableSet_setOf`, `IsSmooth`, `IsSmooth.measurableSet_setOf`,
`isSmooth_of_countable_quotient` (`SetTheory/Descriptive/BorelReducibility.lean:100, :115, :135,
:146, :159, :229, :246, :289`); `eZero`, `eZero_iff_finite`, `measurableSet_eZero`,
`not_isSmooth_eZero`, `not_isSmooth_of_borelReducible_eZero`, `mk_quotient_eZero`,
`borelReducible_bot_eZero` (`EZero.lean:81, :95, :105, :214, :219, :238, :243`); `BFEquiv`,
`BFEquiv.zero`, `add_one`, `limit`, `mono`, `symm`, `trans`, `FirstOrder.Language.Equiv.bfEquiv`
(`ModelTheory/BackAndForth/Equivalence.lean:49, :65, :70, :90, :96, :126, :144, :210`);
`IsTupleBFSystem` (`TupleSystem.lean:39`), `potentialIso_iff_exists_isTupleBFSystem`
(`Presentation.lean:207`), `countable_potentialIso_iff_iso` (`Countable.lean:99`),
`sameAtomicType_order_iff` (`DiscreteOrder.lean:86`); `scottHeight` (`Scott/Height.lean:133`);
`smallPresentation`, `smallPresentationEquiv`, `isRelational_smallPresentation`,
`countable_relations_smallPresentation` (`Infinitary/SmallPresentation.lean:56, :72, :111, :120`);
`GraphRelation`, `graphExpansion` (`GraphTranslation/Language.lean:72, :230`), `graphAxioms`,
`model_graphAxioms_iff`, `reconstructStructure`, `reconstructStructure_graphExpansion`
(`Reconstruct.lean:161, :209, :248, :315`).

Mathlib at the pin: `Language.graph`, `SimpleGraph.structure`, `Theory.simpleGraph`,
`Theory.simpleGraph_model_iff` (`ModelTheory/Graph.lean:49, :57, :68, :72`); `Language.order`,
`linearOrderTheory`, `orderStructure` (`ModelTheory/Order.lean:76, :163, :209`);
`Theory.fieldOfChar` (`ModelTheory/Algebra/Field/CharP.lean:47`); `IsExtensionPair`,
`equiv_between_cg` (`ModelTheory/PartialEquiv.lean:380, :499`); `Structure.cg_of_countable`
(`ModelTheory/FinitelyGenerated.lean:278`); `Order.iso_of_countable_dense`
(`Order/CountableDenseLinearOrder.lean:246`); `MeasurableSMul₂`
(`MeasureTheory/Group/Arithmetic.lean:463`); `ContinuousSMul.measurableSMul₂`, `Prod.borelSpace`
(`MeasureTheory/Constructions/BorelSpace/Basic.lean:614, :656`); `Measurable.exists_continuous`,
`MeasurableSet.analyticSet_image`, `AnalyticSet.preimage`, `AnalyticSet.measurableSet_of_compl`,
`MeasurableSet.image_of_measurable_injOn`, `MeasurableSet.standardBorel`
(`MeasureTheory/Constructions/Polish/Basic.lean:331, :353, :366, :524, :836, :1110`);
`Descriptive.tree` (`SetTheory/Descriptive/Tree.lean:32`); `Nat.right_le_pair`,
`Nat.unpair_right_le` (`Data/Nat/Pairing.lean:103, :108`); `Encodable.ofCountable`
(`Logic/Encodable/Basic.lean:387`). No cited name is missing at the pins.

Duplication by object: a grep of both pins for `BorelComplete`, `SetReducible`, `classIso`,
`linearOrderClass`, `treeClass`, `universalLanguage` finds no file; Mathlib has no file with a
`TopologicalSpace` on `Equiv.Perm` or `BorelReducible`; neither pin has a `MeasurableSpace`
instance on `Equiv.Perm` (Tau Ceti's `Probability/Distributions/Uniform/Permutation.lean:38`
takes one as a hypothesis). The three "Mathlib has no …" and "Neither pin puts …" claims of the
supplier contracts hold.

### Cross-roadmap citations, ownership and overlap

- CountableStructureSpaces (open, a new roadmap folder of another author; read at its head):
  Layer 0 closed range of the graph coding (its line 279–281); Layer 1.2 "The action is jointly
  continuous (a `ContinuousSMul` instance), for every language" from the same two ingredients; the
  3-cycle acceptance check under Layer 1 Examples (`P = {1}`, inverse convention `{2}`); Layer 3
  `analytic_treeHeight_bounded` (closed node sets, bound below `ω₁`); 4.3
  `measurableSet_iso_inter_of_scottHeight_le`; 4.4 `exists_uniform_bfSeparation`; 5.3
  `lopez_escobar`; 6.2 `wellOrderClass` (strict), `analyticSet_compl_wellOrderClass`,
  `exists_mem_wellOrderClass_type_eq` (`ω ≤ β < ω₁`), `not_measurableSet_wellOrderClass`; worked
  example 2 (countably many orbits, each Borel, Scott height at most `ω`). Each exists with the
  hypotheses this design uses.
- NoncompactQuantumSymmetry (earlier in the merge order): Layer 4, M1.BorelRealization,
  `exists_polishTopology_continuousSMul`, with the hypotheses the contract states (Polish group
  with `BorelSpace`, standard Borel `X`, `MeasurableSMul₂`).
- On main, and unchanged at the heads of their open revisions: BorelEquivalenceRelations
  §5.1–§5.4 (headings 5.1 Borel reducibility, 5.2 Smoothness, 5.3 Silver in reducibility form,
  5.4 E₀, on main and at the revision's head); CountableModelCounting Layer 0 (`isoSetoidOn`,
  "Transport between presentations", on main and at the revision's head); InfinitaryModelExistence
  0.3 (`smallPresentation`, `smallPresentationEquiv`) and Layer 6 (the graph translation).
  InfinitaryLogic is under `Completed/`.
- `roadmaps grep` over main and the open heads: `classIso`, `SetReducible`, `universalLanguage`,
  `linearOrderClass`, `treeClass`, "Friedman–Stanley", a `MeasurableSpace` on `Equiv.Perm`: no
  match outside this package; "Borel complete" matches only the base's out-of-scope line, an
  unrelated notion in RefinedTraceMethods (Borel-complete spectra) and CountableModelCounting's
  "Borel complete invariant", another notion. The board's package index lists no other package on
  this subject. The overlaps file lists no other pull request changing this roadmap, no dropped
  id, no revision-only id and no second copy; `roadmaps resolve` lists no citation or Lean name
  found nowhere.

Overlap check: read CountableStructureSpaces, BorelEquivalenceRelations, CountableModelCounting; nothing shared (the coding space, the logic action and López–Escobar are CountableStructureSpaces'; general reducibility, smoothness and E₀ are BorelEquivalenceRelations'; isomorphism on the models of one sentence is CountableModelCounting's; `classIso` on arbitrary sets of codes, Borel completeness and the universal S∞-space are this roadmap's).

### Supplier order

All *Needs:* lines and layer Dependencies read: no upward citation, cycle, forbidden supplier or
unowned prerequisite; no gap is declared and none is needed. Gate output:

```text
candidate: CountableStructureSpacesPartII is not in the merge order yet; checked as if placed after NoncompactQuantumSymmetry (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2232 edges, 0 problem(s)
```

### Shape, headline theorems, residue

Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, seven
layers each ending with Examples and Dependencies, Downstream consumers, References. Every
definition (`classIso`, `SetReducible`, relabelling, `BorelComplete`, the functional coding space,
the incidence and tagged graphs, `graphClass`, the colouring, the colour `χ_c`, `linearOrderClass`,
`treeClass`, Borel S∞-spaces, `universalLanguage`) has API bullets and at least three Checks; every
theorem its hypotheses and a locator or the mark "own construction". A grep for LaTeX delimiters,
pull-request numbers, dates, machine paths, round labels, "optional", "deferred", "removed",
"current" finds nothing; "lemma" occurs only as a word for named results, never as a Lean keyword.

Headline theorems for the package stage, all statable at the pins with real-bodied definitions:
`borelComplete_graphClass`, `borelComplete_linearOrderClass`, `borelComplete_treeClass`,
`exists_continuous_reduction_graphClass_linearOrderClass`,
`exists_equivariant_measurableEmbedding_universal`, `borelComplete_iff_graphClass`,
`borelComplete_iff_forall_structureSpace`, `borelComplete_iff_forall_measurableSet`,
`borelComplete_iff_forall_permSpace`, `bfEquiv_omega0_opow_mul`,
`not_measurableSet_classIso_of_borelComplete`, `borelReducible_eZero_of_borelComplete`,
`not_isSmooth_of_borelComplete`, `not_borelComplete_of_rank_bounded`. The padding probe has nothing
to run on at this stage.

### Copyright and arrangement

Wording compared at the 14 read rows of the sample table and at these further passages: the
definition of `BorelComplete` (`design/README.md:486–490`) against paolini-shelah-tfab lines
95–101; `SetReducible` (`:375–377`) against lines 70–73; Borel S∞-spaces and embeddings (`:968–984`)
against becker-kechris-bams lines 126–131; the proof of 4.2 (`:1014–1031`) against lines 247–268;
the parent definition of 3.2 (`:754–756`) against montalban-cst1 lines 4279–4283; clique tags
(`:645–655`) against lines 4641–4654; the interval lemma (`:1117–1126`) against montalban-cst2
lines 2322–2331; Layer 5 (`:1073–1092`) against camerlo-gao-boolean lines 94–105. The statements
share only what the mathematics forces (the reducibility formula, the parent condition, "label plus
two"); the longest shared run is a standard name of five words. The proofs take other routes (tuple
systems for a category argument, anchored symbols for closed-set codes, clique tags for flags and
connectors). No table, figure or list is taken over. paolini-shelah-tfab has the largest share of
locators; its sections (introduction and history, the combinatorial frame, the group construction)
correspond to no layer here, and only its introduction is cited.

Source independence: 22 passages compared with 5 sources, none shared; largest share paolini-shelah-tfab, 13 of 51 locators; contents compared with paolini-shelah-tfab: independent. The six uncertified works (16 of the 51 locators) could not be read.

## Not verifiable

- The six settled uncertified texts (friedman-stanley-1989, gao-idst, becker-kechris-1996,
  kechris-cdst, hjorth-kechris-1996, mekler-1981): cited by locator only. The manifest records the
  numbers of friedman-stanley-1989 and mekler-1981 as from memory and those of gao-idst as to be
  checked; they could not be read and were not requested again. Certified texts corroborate the
  attributions, not the numbers: paolini-shelah-tfab line 125 and camerlo-gao-boolean lines
  111–116 (graphs, trees, linear orders, fields, torsion abelian groups), camerlo-gao-boolean
  line 93 (kechris-cdst 16.C). The proofs of the targets citing them (2.3, 3.3–3.5, Layer 5, 6.4,
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
- **Not tested.** Six cited works are uncertified and unread, among them friedman-stanley-1989, the primary source of Layers 2, 3 and 6.4 (7 of 51 locators; `sources.toml` records its theorem and section numbers as from memory): wording, arrangement and numbers were not compared.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "465b93e6fb3ef1acd68b1efea0121d4dfba0da21", "job": "REV-DESIGN-CountableStructureSpacesPartII~8", "model": "fable", "worker": "chris-x30"} -->
