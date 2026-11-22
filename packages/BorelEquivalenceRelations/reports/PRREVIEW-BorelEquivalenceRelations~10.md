# Review of BorelEquivalenceRelations (pull request #1616 at ab52752)

**Verdict:** accepted

**Summary.** Accepted: no finding. The two open targets (the perfect set theorem for analytic sets, and smoothness of closed equivalence relations) are true as stated, agree with their sources at the cited locators, and are not provable in one step from the pins; every Tau Ceti and Mathlib declaration the README names exists at the pins with the stated hypotheses, and every layer and item of the README on main is still present with its statement. There are two small corrections (four "above"/"below" pointers reversed by the reordering of the README, and a description that does not mention the reordering) and one format note, none blocking. Two licence questions are left for the human reviewers.

## C01 — Four pointers say "above" or "below" for material that now lies on the other side

The last commit moved the scope and the supplier contracts after the layers, and four sentences still point the old way, so a reader looks for a table or a list in the wrong half of the document. In *How to read the build*, kind 1 (lines 63–64): "This is every declaration of the table above that is not listed under 2", but the only table of Tau Ceti declarations is the one under *Exact supplier contracts*, some 800 lines below. In *Scope and ownership* (line 819): "Every layer below is required", with the layers above. In *Exact supplier contracts* (lines 864–865): "every layer of the build order below", and (lines 912–913) "the items of kind 3 below"; both are above.

Replace "the table above" by "the Tau Ceti table under [Exact supplier contracts](#exact-supplier-contracts)", "Every layer below" by "Every layer above", "the build order below" by "the build order above", and "kind 3 below" by "kind 3 under [How to read the build](#how-to-read-the-build)".

## C02 — The description does not say that the README was reordered and two headings renamed

Against main, this head removes the headings `## Scope and dependency order` and `## Existing library and ownership` (both near the top) and adds `## How to read the build`, `## Scope and ownership` and `## Exact supplier contracts` (the last two at the end), and each layer's "Acceptance check" paragraph becomes `### Examples` followed by `### Dependencies`. The description lists the content changes but not this one, so a reader of the diff cannot tell a move from a rewrite. No roadmap on main or in an open pull request links to the two old anchors, so nothing breaks.

Add one sentence under *Other content changes*, for example: "The README is brought into the repository layout: the scope table and the supplier contracts move after the layers as *Scope and ownership* and *Exact supplier contracts* (formerly *Scope and dependency order* and *Existing library and ownership*), and each layer's acceptance check becomes its *Examples*, followed by *Dependencies*. No layer or item is removed or renumbered."

## N01 — One consequence clause of 0.1 on main is no longer stated in 0.1

On main, 0.1 ends its meagreness bullet with "a nonempty perfect Polish space contains a Cantor copy and has cardinality 𝔠". The head drops the clause from 0.1; its content survives in 0.4 (`Perfect.mk_eq_continuum`, applied to the whole space) and in Mathlib's `Perfect.exists_nat_bool_injection`. The clause could be kept in 0.1 with a pointer to 0.4, so that the record of 0.1 reads as it does on main.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| 4.2 analytic perfect set theorem (README 530–540; `Suggested.lean` 39–43) | `A = ∅`; `A = ℚ ⊆ ℝ`; `A = ℝ∖ℚ`; `X` uncountable discrete, `A = X` | ∅, ℚ: `hunc` false. ℝ∖ℚ: Cantor copy exists. Discrete `X`: not analytic (image of separable space is separable), so no counterexample | true; README "Hausdorff" = Lean `[T2Space X]` |
| 4.2 proof route and *Needs* | `g : β → X` continuous, `β` Polish, range `A` | kernel = preimage of closed diagonal (needs T2); classes ↔ `A`, uncountable; `silver_dichotomy` gives antichain `h`; `g ∘ h` injective | every input on the *Needs* line; none derived from the target |
| 4.2 against Miller, Lecture I, Ex. 16 | source: analytic Hausdorff space `X`, countable or Cantor injection | target = alternative (2) for the subspace `A`; continuity into `A` is continuity into `X` with range in `A` | locator and hypotheses agree |
| 5.2 `isSmooth_of_isClosed` (README 603–612; `Suggested.lean` 52–55) | `X = ∅`; `⊥`; `\|x\| = \|y\|` on ℝ; E₀; Vitali | ∅: empty map reduces. `⊥`, `\|x\|=\|y\|`: closed, smooth. E₀, Vitali: dense and meagre in the square, so not closed; not smooth | true; negative controls excluded by `hE` |
| 5.2 proof route and *Needs* | `U ×ˢ V` disjoint from `E`; Tau Ceti's separation with `A = U`, `B = V` | class-images of `U`, `V` disjoint (else `u E x E v`); output `C` invariant, `⊇ U`, disjoint from `V`, so separates `[x]`, `[y]` | *Needs* line suffices; saturation lemma not needed |
| 5.2 against HKL 1990, Cor. 1.2 | Gδ versus closed | closed in metrizable `X × X` is Gδ; source's "smooth" = Borel separating family = `Setoid.isSmooth_iff_countablySeparated` | locator p. 905 agrees; README says Gδ form is not a target |
| One-tactic probes of both targets | `simp`, `infer_instance`, `rfl`, `aesop`, `simp_all [isSmooth_iff_countablySeparated]`, `exact isSmooth_of_countable_quotient …` | each leaves errors on both theorems (2, 2, 2, 2, 2, 4 errors) | not padding |
| 0.1 instances | Mathlib alone; Mathlib + Tau Ceti | Mathlib alone: `StandardBorelSpace`, `BorelSpace (ℕ → Bool)`, `PolishSpace (ℕ → ℕ)` found; `PolishSpace`, `PerfectSpace (ℕ → Bool)` fail. With Tau Ceti: all five found | as README 143–149 and 907–909 say |
| 0.1 comeagre sets uncountable | `TauCeti.not_countable_of_mem_residual` | pin: `[T1Space] [PerfectSpace] [BaireSpace] [Nonempty]` | matches "nonempty perfect T₁ Baire space" |
| 0.2 Alexandrov, T6 form | `T6Space X ⊢ PerfectlyNormalSpace X ∧ T2Space X`; converse instance; uncountable discrete space | both directions elaborate; pin statement has `[PerfectlyNormalSpace X] [T2Space X]`, subspace `IsCompletelyMetrizableSpace` | "exactly the T6 spaces" true; non-Polish example correct |
| 0.3 analytic closure and Borel graph theorem | pin signatures of `.inter`, `.prod`, `.offDiag`, `.image_fst`, `preimage_image_quotientMk`, `analyticSet_graph_iff_measurable` | `inter`, `offDiag`, saturation need `[T2Space]`; `prod`, `image_fst` none; graph iff: both Polish Borel | README hypotheses match |
| 0.4 perfect sets and cardinality | `MeasurableSet.exists_nat_bool_injection_of_not_countable`, `Perfect.mk_eq_continuum`, `mk_le_continuum_of_countablySeparated` | Polish Borel; `[PolishSpace X]`, `Perfect C`, `C.Nonempty`; `[CountablySeparated X]` only | match; the last is more general, as stated |
| 0.5 antichains | `mono_relation`; `mono_topology`; `mk_quotient_eq_continuum`; `hasCantorAntichainOn_image_iff` | `E ≤ F → F.Has… → E.Has…`; `t ≤ t'` carries `t`-antichain to `t'`; `[SecondCountableTopology] [T0Space]`; measurable embedding, any `A` | directions as README states |
| 0.5 countable splits | `P i` all with countable truth side; `X` empty | pin: countable `N`, `P i x ↔ P i y` off `N`; constant-off-countable form has `[Nonempty X]` | match |
| 1.1 Kuratowski–Ulam | direction of `curry_le_residual`; which factor is second countable | `(residual X).curry (residual Y) ≤ residual (X × Y)`: comeagre sets have comeagrely many comeagre sections; `[SecondCountableTopology Y]`, no Baire hypothesis | match; right-hand form needs `X` second countable, swap both |
| 1.2 Mycielski | `k n = 0`; `k n = 2`; hypotheses | `Fin 0 → X` is a point, meagre `R n` is ∅, vacuous; binary = `mycielski_prod`; pin: completely metrizable, perfect, nonempty | match; "no separability" true |
| 1.3 Baire-measurable maps | pin signatures | `[SecondCountableTopology Y]`, open preimages Baire-measurable ⇒ Gδ comeagre `G`, `ContinuousOn f G`; subcopy: countable family, Borel fibres | match |
| 4.1 category route | steps against pin | `exists_continuous_forall_gSGraph_adj_not` (sparse `S`), `isMeagre_comap_…` (dense `S`), `mycielski_prod`; `canonicalWords` is both | route closes; three named lemmas exist |
| 4.2 forms of Silver | Polish, standard Borel, cardinal, relative | pin types equal README's: `Countable (Quotient E) ∨ E.HasCantorAntichainOn univ`; measurable embedding; `≤ ℵ₀ ∨ = 𝔠`; `Countable (Quotient F) ∨ R.HasCantorAntichainOn A` | match (and the Summary's code block) |
| 4.3 consumer interface | seven names against CountableModelCounting on main | its supplier section cites the same seven, §0.5 and §4.2–4.3 | ids kept; nothing dropped |
| 5.1 reducibility | `⊥ ≤_B ⊥` on `Fin 2`, ℕ, ℝ | iff `lift #X ≤ lift #Y` at the pin; one universe gives `#X ≤ #Y` | match, lift noted in README |
| 5.2 smoothness API | `IsSmooth` body; countable quotient | `E.BorelReducible ⊥` on `ℕ → Bool`; `[Countable (Quotient E)]` + measurable classes | match |
| 5.3 Silver in reducibility form | trichotomy | `(∃ n, ≈ Fin n) ∨ ≈ ℕ ∨ ⊥_Cantor ≤ E`; bireducible with Cantor iff smooth and uncountable quotient | match |
| 5.4 E₀ | antichain map `x ↦ x ∘ (unpair ·).1`; body of `eZero` | `x k ≠ y k` gives infinitely many `n` with `(unpair n).1 = k`; `Filter.atTop.germSetoid Bool` | match |
| Layer 3 example | `S = {[]}` | one word of length 0: sparse; `[true]` not a prefix of `[]`: not dense; edges `(false::x, true::x)` 2-coloured by `x 0` | true |
| 1.4 canonical words | `canonicalWord` body | decode `(unpair n).1`, pad with `false` to `n` if length ≤ `n`, else all `false`; `pair a k ≥ k` | README description matches the pin |
| Worked examples 2, 3, 5 | `x 0 = y 0`; constant map ℝ → ℝ; Vitali | 2 and ℵ₀ classes, closed; one class; rational translates of an interval cover ℝ, so meagre or comeagre | true |
| Record: main against head | Layers 0–5, 19 numbered subsections, 8 worked examples | every item present with statement; one consequence clause of 0.1 moved in effect to 0.4 (N01) | no layer or item removed or renumbered |
| C01 pointers | lines 63, 819, 864, 912 | targets at 869–894 (below 63), 139–665 (above 819, 864), 77–86 (above 912) | four reversed |

- Source locators checked against the text: 2 of 2 (Miller's lecture notes, its text, lines 296–303, Exercise 16 on printed p. 8, from the author's page; Harrington–Kechris–Louveau 1990, its text, lines 104–109, Corollary 1.2 on p. 905, proof at lines 727–728, from the AMS open archive).
- Library declarations opened at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`): 192 names of the README elaborated with `#check @`, none missing; 14 definitions printed and compared with the README's descriptions.
- Sampled targets: all 15 of the seeded sample have a row above; 13 carry no source locator and were checked against their pinned declarations.
- Cross-roadmap citations resolved: CountableModelCounting, CountableStructureSpaces and InfinitaryLogic links exist on main; inbound citations of §0.5, §2.2, §4.2–4.3 still resolve.
- Automatic checks: every check passed at this head. Dependency check output: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives two `declaration uses sorry` warnings and nothing else; `#check @` of both theorems matches README 530–535 and 603–605, no binder lost. No file outside the folder changes.
- Previous finding R01 (the description called the widened Alexandrov converse unchanged): repaired; the description now reads "Alexandrov's converse is widened from a metrizable to a `T6` ambient space".
- Headline theorems: Silver's theorem and the G₀ dichotomy are theorems of the pinned Tau Ceti and are not restated; the two statable open theorems are both stated.

Overlap check: read CountableStructureSpacesPartII, CountableStructureSpaces, CountableModelCounting, InfiniteGamesAndDeterminacy, HanfNumbers, RandomGraphs; nothing shared. The first three consume Tau Ceti declarations this roadmap records and own nothing of it; no roadmap on main or open states the analytic perfect set theorem or `isSmooth_of_isClosed`, and neither pin has them.

Source independence: 7 passages compared with 2 sources (README 4.1, 4.2, 5.2, 1.4 independence lemma, 2.2 superset lemma, Layer 3 exclusivity, 5.4 non-smoothness of E₀; against Miller's lecture notes §§2, 3, 5, 6 and Harrington–Kechris–Louveau §1), none shared beyond statements the mathematics forces; largest share Miller's lecture notes and Harrington–Kechris–Louveau, 1 of 2 locators each; contents compared with Miller's lecture notes (Preliminaries, Corollaries of separation, the Kechris–Solecki–Todorcevic theorem, Kanovei's generalization, Silver's theorem, Exercises): independent, the order of Layers 2 → 3 → 4 is forced by the *Dependencies* lines and Layers 0, 1 and 5 have no counterpart there.

Research link: The summits are Silver 1980 and Kechris–Solecki–Todorcevic 1999, by the classical route of Miller 2012; 5.2 and 5.4 are the smooth side and the easy half of the Glimm–Effros dichotomy of Harrington–Kechris–Louveau 1990. CountableModelCounting uses Layer 4 for Morley's theorem. Rests on the README's references and the two texts read.

## Not verifiable

- Kechris 1995, Gao 2009, Kechris–Solecki–Todorcevic 1999, Miller 2012, Silver 1980, Burgess 1978, Kuratowski–Ulam 1932 and Mycielski 1964 are listed as references with no locator in the README; they were not opened.
- The Provenance table's statements about `cameronfreer/infinitary-logic` at `518a366` were not checked against that repository.
- The description's integration build at `d52f7ee5` cannot be reproduced from the pull request's files.

## Source issues

- **Misprint** in Miller's lecture notes (*Forceless, ineffective, powerless proofs of descriptive dichotomy theorems*, Lecture I) at Exercise 15, p. 8: the source says the derivative can be eliminated "at the expensive of" countable choice; it should be "at the expense of"; affects nothing.

## For the human reviewers

- **Licence.** The only locator for 4.2 (README line 533) is Miller's lecture notes, marked "DRAFT" and hosted under `/unpublished/` on the author's own page; the statement itself is Souslin's classical theorem.
- **Licence.** README lines 782–795 name `cameronfreer/infinitary-logic` (Apache-2.0, `518a366`) as proof-script reference and ask ported files to credit it; neither statement of `Suggested.lean` is listed as coming from it (table rows 4 and 5 say "new").
