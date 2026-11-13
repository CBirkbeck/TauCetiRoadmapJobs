# Review of BorelEquivalenceRelations (pull request #1616 at 6ca8a4f)

**Verdict:** needs changes

## R01 (P3) — The two open targets still have no source locator

**Location:** `README.md:624–625` "an uncountable analytic subset of a Hausdorff space contains the range of a continuous injection of Cantor space."; `README.md:692–693` "a closed equivalence relation on a Polish space is smooth."

**Claim:** Every theorem needs a locator. This is the previous review's R03. The author kept it because the texts could not be read. Both theorems are in open texts that the References already list, so that reason no longer applies.

**Witness:** Miller, Lecture I (glimmeffros.github.io/unpublished/parisone.pdf), p. 8, Exercise 16 (Souslin): an analytic Hausdorff space is countable or receives a continuous injection of Cantor space. HKL 1990 (AMS open backfile), p. 905, Corollary 1.2: Gδ equivalence relations on Polish spaces are smooth.

**Repair:**
- At 625, after "Cantor space", insert: "(Miller, *Forceless, ineffective, powerless proofs*, Lecture I, Exercise 16 (Souslin), p. 8, stated for an analytic Hausdorff space)".
- At 693, after "is smooth", insert: "(Harrington–Kechris–Louveau 1990, Corollary 1.2, p. 905, for Gδ relations, proved there through their dichotomy; the Gδ form is not a target here)".
- At 915, append `https://glimmeffros.github.io/unpublished/parisone.pdf` to the Miller lecture-notes entry.
- At 931, change "Cited for the out-of-scope general dichotomy." to "Cited for the out-of-scope general dichotomy and, by Corollary 1.2, for 5.2."

## R02 (P3) — Scope and ownership claims to build what every layer consumes from Tau Ceti

**Location:**
- `README.md:58`: "| Layer | Builds | Consumes | …".
- Row 60: "Builds: Word cylinders and the coordinate flip; functional Borel graphs; the cardinality bound…".
- `README.md:793`: "Each introduced definition comes with its basic rewriting, monotonicity and transport API".

**Claim:** The table says Layers 0–5 build material that 0.1–5.4 then consume from Tau Ceti, and the roadmap introduces no definition. Read as the ownership statement, the table directs an implementer to rebuild Tau Ceti. It also contradicts *How to read the build*.

**Witness:** README 282 says "Consumed from Tau Ceti: functional Borel graphs", which is `MeasurableSet.measurableEmbedding_domRestrict_fst` (`TauCeti/MeasureTheory/Constructions/Polish/Graph.lean:77`). README 218–227 lists as open only two theorems and worked examples 3, 5 and 8.

**Repair:**
- Rename the column "Builds" to "Covers".
- After line 65, add: "This roadmap owns only the perfect set theorem for analytic sets (4.2), `isSmooth_of_isClosed` (5.2) and worked examples 3, 5 and 8. Every other item of the table is a Tau Ceti declaration at the pin; see [How to read the build](#how-to-read-the-build)."
- At 793–794, replace the first sentence with: "The two theorems of 4.2 and 5.2 and worked examples 3, 5 and 8 are proved on Tau Ceti's carriers, with the stated examples."

## R03 (P3) — The description presents the widened Alexandrov converse as unchanged

**Location:** Description, *Other content changes*: "Alexandrov's converse keeps the roadmap's `T6` form."

**Claim:** On main the converse is stated for a metrizable ambient space. This head widens it to `T6` spaces. A reader of the description cannot tell that the statement changed.

**Witness:**
- Main `README.md:215`: "a subset of a metrizable space that is completely metrizable … is Gδ".
- Main `Suggested.lean:76–77`: `isGδ_of_polishSpace_subtype` with `[MetrizableSpace X] … [PolishSpace s]`.
- Head `README.md:260`: "a subset of a `T6` space".

**Repair:** Replace the bullet with: "Alexandrov's converse is widened from a metrizable to a `T6` ambient space. It is consumed from `TauCeti.isGδ_of_isCompletelyMetrizableSpace`, which is stated for perfectly normal Hausdorff spaces; `T6Space` supplies both hypotheses by instance search. The forward direction is Mathlib's `IsGδ.polishSpace`."

## Previous findings (review of 81fe877)

- **R01, pull-request numbers: repaired.** `grep 'pull/1316'` is empty. Line 846 reads "[CountableStructureSpaces](../CountableStructureSpaces/README.md) consumes four general results".
- **R02, CountableModelCounting sentence: repaired.** Lines 855–858 read "Where its prototype writes the antichain predicates out … it writes the bodies of Convention 6". That is true on main: CountableModelCounting `Suggested.lean:209–211` has the body of `Setoid.HasPerfectAntichainOn`, as at `Antichain.lean:112–113`.
- **R03, locators: not repaired.** This is R01 above.
- **R04, shape: repaired.**
  - `**Summary.**` is at line 3.
  - The headings `## Scope and ownership`, `## Exact supplier contracts` and `## How to read the build` are at 54, 129 and 195.
  - There are six `### Examples` and six `### Dependencies`.
  - The `*Needs:*` lines are at 628 and 698.
  - The docstring is titled "…: target signatures".
- **R05, examples: repaired.** `Suggested.lean` holds the two theorems only. README 216 reads "`haveI := hs`".
- **R06, imports: repaired.** The file has two import lines. The docstring at 21–22 reads "The README names each consumed Tau Ceti declaration and its module."
- **R07, adapter rows: repaired.** The rows for `prependWord`, the curried coloring, the curried homomorphism and the measurable `φ` are gone, and so is the "maintainers" sentence.
- **R08, title and description: repaired, except the Alexandrov bullet.** That bullet is R03 above.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| 0.1 `TauCeti.not_countable_of_mem_residual` | ℝ with `s = ℝ∖ℚ`; indiscrete `{a, b}`; discrete ℕ | uncountable; perfect and Baire but not T₁, `univ` comeagre and countable; ℕ not perfect | T₁ and perfectness both needed; README 239–241 keeps both |
| 0.1 instances | `import Mathlib` alone | `PolishSpace (ℕ → Bool)` and `PerfectSpace (ℕ → Bool)` fail; `PolishSpace (ℕ → ℕ)` and `StandardBorelSpace (ℕ → Bool)` succeed | matches README 187–188, 235–238 |
| 0.2 `TauCeti.isGδ_of_isCompletelyMetrizableSpace` | ℝ∖ℚ ⊆ ℝ; ℚ ⊆ ℝ; `{ω₁} ⊆ ω₁+1`; uncountable discrete `D ⊆ D` | Gδ; ℚ neither completely metrizable nor Gδ; `{ω₁}` completely metrizable, not Gδ, space not perfectly normal; `D` Gδ, not Polish | T6 needed, separability not (README 264–265) |
| 0.3 `AnalyticSet.relPreimage` of `G ∪ G.inv`; saturation | `G = {(0,1)}`, `A = {1}` in ℝ; `E = ⊤`, `A ≠ ∅`; `E = ⊥` | neighbourhood `{0}`, as the README formula gives; saturations ℝ and `A` | agree with README 273–276 |
| 0.3 `MeasurableSet.measurableEmbedding_domRestrict_fst` | graph of `1_ℚ` on ℝ; `{0} × ℝ` | `fst` injective on the graph, an embedding; on `{0} × ℝ` the fibre is ℝ, so `InjOn` fails | "at most one point above each x" needed |
| 0.5 `.mono_relation` (`E ≤ F`) | `E = ⊥`, `F = E₀`, `x ↦ x ∘ (unpair ·).1`; the reverse with `id` | E₀-antichain, hence injective, hence a ⊥-antichain; `id` is not an E₀-antichain | direction as in README 308–309 |
| 0.5 `CantorScheme.VanishingDiam.exists_antichain_map` | siblings `A (false :: l)` and `A (true :: l)` | `res` lists newest first, so siblings differ in the last bit | matches "E-inequivalent siblings", no disjointness assumed |
| 1.1 `BaireMeasurableSet.mem_curry_iff_mem_residual` | `(ℝ∖ℚ) × ℝ`; `ℚ × ℝ` | comeagre, with comeagre sections over ℝ∖ℚ; meagre, with comeagre sections only over the meagre set ℚ | both directions consistent |
| 1.2 `TauCeti.mycielski` | `k ≡ 1`, `R n = ℚ ⊆ ℝ`; `X` a point | Cantor copy among the irrationals; a point is not perfect, so it is excluded | hypotheses equal README 381–385 |
| 1.3 `TauCeti.exists_cantor_subcopy_continuous` | `g = 1_B`, `B` = {infinitely many `true`s}; indicator of a Bernstein set | interleaving with all-`true` gives `g ∘ e ≡ 1`; Bernstein fibres are not Borel, and no perfect set splits clopenly | Borel fibres needed |
| 1.3 `TauCeti.exists_isGδ_mem_residual_continuousOn` | `1_ℚ : ℝ → Bool` | continuous on ℝ∖ℚ, a comeagre Gδ | true |
| 1.4 Miller's lemma | `S = {[]}` with `A` the cylinder of `[false]`; `canonicalWords` with `A = univ` | no edge inside `A`, since edges flip bit 0; an edge exists | density needed |
| 2.1 `Setoid.hasCountableBorelColoring_not_iff` | `⊥` on ℝ; `x 0 = y 0` on Cantor space; `G = ⊤` | no coloring, uncountable; coloring by `x 0`, two classes; loop, so no coloring | true |
| 2.2 KST; invariant separation | `G = ≠` on ℝ, `A = {0}`; Vitali, `A = [0,1]`, `B = [2,3]` | `B = {0}`; both saturations are ℝ, the hypothesis fails, and no invariant Borel separator exists | disjoint saturations are the right hypothesis |
| 2.3 `SetRel.isSmallFamily_univ_iff` | `ι` empty; `ι = Fin 1`, `G = ≠` on ℝ; `Φ = ∅` | `univ = {the empty map}` not small, though `G = ∅` is colorable; not small, no coloring; small | `[Nonempty ι]` needed |
| 4.1 category route | `⊥` on ℝ | `φ`; the pullback `{φ a = φ b}` is closed with meagre sections; Mycielski `ψ`; `φ ∘ ψ` injective | agrees with the closed perfect set theorem |
| Silver `Setoid.silver_dichotomy` (headline, Tau Ceti) | `X = ∅`; `⊥` on ℝ; E₀; `⊤` on ℝ | countable / antichain: T/F; F/T; F/T; T/F | true; cited, not restated |
| G₀ `SimpleGraph.g0_dichotomy` (headline, Tau Ceti) | `G = ⊥`; `G = gZero`; `G = gSGraph {[]}` | coloring / homomorphism: T/F; F/T (identity); T/F | `Xor` holds |
| 4.2 analytic perfect set (`Suggested.lean:39`, open) | `A = ℚ`; `A = ℝ∖ℚ`; discrete ℝ with `A = ℝ`; worked example 8 | countable, hypothesis fails; Cantor set of irrationals; not analytic (not separable), and no injection since a compact image is finite; Cantor copy | analyticity essential; true; `exact?` and `simp_all` fail |
| 4.2 route | `g : β → X` continuous, `E = ker g` | closed by `isClosed_diagonal`; `Quotient E ≃ A` uncountable; Silver gives `h`; `g ∘ h` injective | every input is at the pins |
| 5.1 `Setoid.borelReducible_bot_bot_iff_lift_mk_le` | `Fin 2` to ℕ; Cantor space to ℕ | 2 ≤ ℵ₀, reducible; 𝔠 ≤ ℵ₀ false, not reducible | true |
| 5.2 `Setoid.isSmooth_iff_countablySeparated` | `⊥` on ℝ; `⊤`; E₀ | smooth / separated: T/T; T/T; F/F | true |
| 5.2 `isSmooth_of_isClosed` (`Suggested.lean:52`, open) | `X = ∅`; `\|x\| = \|y\|`; `x 0 = y 0`; E₀; Vitali | trivial; reduce by `\|·\|`; reduce by `x 0`; E₀ and Vitali are dense and `≠ ⊤`, so not closed, and are not smooth | true; `exact?` and `simp [isSmooth_iff_countablySeparated]` fail |
| 5.2 route | `\|·\|` at `1, 2`: `U = (0.9,1.1)`, `V = (1.9,2.1)` | `U ×ˢ V` misses the graph; saturations `±U`, `±V` disjoint; Tau Ceti's separator takes `U`, `V` | every input is at the pins |
| Scope row 0 (R02) | "functional Borel graphs" | table: built here; 0.3: consumed, `Graph.lean:77` | contradictory |
| Alexandrov, description (R03) | main against head | main: metrizable `X`; head: `T6Space X` | widened, not kept |
| Worked example 3 | `f = \|·\|`; constant `f` | image `[0,∞)`, 𝔠 classes; one point, one class; Silver's cardinal form already gives "exactly when" | true |
| Locators (R01) | Miller Lecture I p. 8; HKL p. 905 | Exercise 16 for an analytic Hausdorff space = 4.2; Corollary 1.2 for Gδ relations ⊇ 5.2 | both sources support the statements |

- **Gate and dependency check.** The gate at 6ca8a4f reports every counter 0 and `OK`. The dependency check reports `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`, with no UPWARD or CYCLE line. The diff outside the folder is empty. Pins: Mathlib 1b1ccf4b, Tau Ceti 2fd255d9.
- **Elaboration.** `lake env lean` gives two `declaration uses sorry` warnings and nothing else. `#check @` of both theorems matches README 622–626 and 692–693; no binder is lost. Four one-tactic probes fail.
- **Names at the pins.** 255 backticked README identifiers were checked with `#check @` against the 28 cited Tau Ceti modules. All resolve: the namespace-relative forms, and the roadmap's own target in `Suggested.lean`. Fifty-eight signatures were compared with the README prose.
- **Definitions opened.** `Antichain.lean:107–133`, `BorelReducibility.lean:229–290`, `InvariantSeparation.lean:117`, `GSGraph.lean:80`, `SmallFamily/Basic.lean:90`, `GZeroDichotomy.lean:431`, `MeasurableSpace/Graph.lean:72`.
- **The open targets are open.** The only Cantor-injection theorems are the closed case (Mathlib `Topology/MetricSpace/Perfect.lean:136`) and the Borel case (Tau Ceti `MeasureTheory/Constructions/Polish/Perfect.lean:51`). No theorem derives `IsSmooth` from a closed graph. There is no Vitali relation at either pin.
- **Cross-roadmap citations.** CountableModelCounting on main (README 221–238 (E0)–(E2), `Suggested.lean:209–211`) and at its open revision, and CountableStructureSpaces (0.2, 0.3, 2.2), resolve. No anchor or section id of this roadmap is cited elsewhere.
- **Overlap check.** Read CountableStructureSpaces, CountableModelCounting (main and its open revision), HanfNumbers and InfinitaryLogic: nothing shared. The first two consume this roadmap's Tau Ceti interface, and HanfNumbers excludes coanalytic Silver as this roadmap does.
- **Sources.** Two open texts were read for the open targets. The fifteen sampled targets carry no source locator and were checked against their pinned declarations.

## Not verifiable

- **References without locators.** Kechris 1995, Gao 2009, Kechris–Solecki–Todorcevic 1999, Miller 2012, Silver 1980, Burgess 1978, Kuratowski–Ulam 1932 and Mycielski 1964 were not fetched: the README gives no locator in them to check.
- **Provenance.** Revision `518a366` of the external formalization, and the Provenance table's claims about it, were not opened.
- **Integration build.** The description's integration build `73a55196` cannot be reproduced from this worktree.

## Source issues

- none
