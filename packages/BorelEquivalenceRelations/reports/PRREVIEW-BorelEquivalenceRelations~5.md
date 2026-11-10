# Review of BorelEquivalenceRelations (pull request #1616 at 68c5f0b)

**Verdict:** needs changes

Full review (423 lines changed since 6908d40). The gate passes on this head and the file elaborates with `sorry` as its only warning. The blocking defect is the one the previous review announced for this round: at the pinned Tau Ceti (2fd255d9) the library already proves the roadmap's two summits and almost everything beneath them, and `Suggested.lean` still admits those statements with `sorry` under its own copies of the definitions. The head repaired this for Layers 0.1–0.4 and 1.1–1.2 only; R01 is the same repair for the rest. Seven P3 findings follow.

## R01 (P2) — 42 of the 44 admitted theorems, and all 18 definitions, restate Tau Ceti at the pin

**Location:** `TauCetiRoadmap/BorelEquivalenceRelations/Suggested.lean:54–444` (every declaration except `isSmooth_of_isClosed`, line 404, and `AnalyticSet.exists_nat_bool_injection_of_not_countable`, line 362); `README.md:189–192` ("The targets of this roadmap are the word cylinders and coordinate flip of 0.1, the functional Borel graphs of 0.3, the standard Borel cardinality bound of 0.4, the antichains and countable splits of 0.5, and Layers 1.3–5"); `README.md:78–92` ("Suggested homes"); `README.md:161–162` ("These are Layers 0.1–0.4 and 1.1–1.2").

**Claim:** `silver_dichotomy`, its standard Borel, cardinal and relative forms, `g0_dichotomy`, both halves of the oriented dichotomy, Miller's independence lemma, the KST superset lemma, invariant Lusin separation, the small-family ideal, Borel reducibility, smoothness and the whole E₀ block are theorems of the pinned library, on definitions with the same bodies. A statement the pin proves is cited and dropped, not admitted; and two definitions of one object (`HasCantorAntichainOn` here, `Setoid.HasCantorAntichainOn` in Tau Ceti) is the two-owner defect.

**Witness:** A scratch copy of `Suggested.lean`, with the eleven needed Tau Ceti modules imported, elaborates with each `sorry` replaced by the Tau Ceti declaration below; only lines 362 and 404 keep their `sorry`. Ten definitions are equal to Tau Ceti's by `rfl` (`HasCantorAntichainOn`, `HasPerfectAntichainOn`, `IsThinOn`, `RelIndependent`, `DenseWords`, `SparseWords`, `canonicalWord`, `BorelReducible`, `IsSmooth`, `eZero`); `prependWord = PiNat.prependWord` by `funext` and the two coordinate lemmas, from which `wordCylinder`, `orientedGS`, `gSGraph`, `canonicalWords`, `gZero` follow by rewriting; `HasCountableBorelColoring` differs only in currying the pair; `IsSmallFamily` only in binder order.

| Roadmap declaration (line) | Tau Ceti declaration at 2fd255d9 | Difference |
| --- | --- | --- |
| `isOpenEmbedding_prependWord` (60), `wordCylinder_reverse_res` (66) | `PiNat.isOpenEmbedding_prependWord`, `PiNat.wordCylinder_reverse_res`, `TauCeti/Topology/Instances/CantorSpace.lean:324,261` | library: any discrete alphabet |
| `mk_le_continuum_of_standardBorelSpace` (81) | `TauCeti.mk_le_continuum_of_countablySeparated`, `TauCeti/MeasureTheory/MeasurableSpace/Card.lean:38` | library: countably separated suffices |
| `HasCantorAntichainOn.injective` (106), `.mono_relation` (112), `.mono_topology` (116), `hasCantorAntichainOn_subtype_iff` (123), `.continuum_le_mk_quotient` (128), `hasCantorAntichainOn_iff_hasPerfectAntichainOn` (132), `hasCantorAntichainOn_image_iff` (138) | `Setoid.HasCantorAntichainOn.exists_injective`, `.mono_relation`, `.mono_topology`, `Setoid.hasCantorAntichainOn_subtype_iff`, `.continuum_le_mk_quotient`, `Setoid.hasCantorAntichainOn_iff_hasPerfectAntichainOn`, `Setoid.hasCantorAntichainOn_image_iff`, `TauCeti/SetTheory/Descriptive/Antichain.lean:182,154,173,191,201,260,304` | library: the iff needs only complete metrizability |
| `exists_countable_exceptions_of_splits` (153) | `TauCeti.exists_countable_exceptions_of_splits`, `TauCeti/Data/Set/Countable.lean:53` | none |
| `exists_isGδ_mem_residual_continuousOn` (166), `exists_cantor_subcopy_continuous` (174) | same names in `TauCeti`, `TauCeti/Topology/Baire/BaireMeasurableMap.lean:72,122` | none |
| `gSGraph_adj_iff` (193), `denseWords_canonicalWords` (216), `exists_unique_mem_canonicalWords_length` (219), `measurableSet_orientedGS` (226), `exists_gSGraph_adj_of_not_isMeagre` (231) | same names in `TauCeti`, `TauCeti/SetTheory/Descriptive/GSGraph.lean:136,270,281,176,350` | none |
| `hasCountableBorelColoring_iff_exists_cover` (252), `simpleGraph_hasCountableBorelColoring_iff` (258), `exists_measurableSet_relIndependent_superset` (267) | `SetRel.hasCountableBorelColoring_iff_exists_cover`, `SimpleGraph.hasCountableBorelColoring_adj_iff`, `SetRel.exists_measurableSet_isIndependent_superset`, `TauCeti/SetTheory/Descriptive/BorelColoring.lean:148,217,185` | library: KST lemma for Hausdorff Borel spaces |
| `exists_invariant_measurableSet_separating` (273) | `Setoid.exists_invariant_measurableSet_separating`, `TauCeti/SetTheory/Descriptive/InvariantSeparation.lean:117` | library: Hausdorff, `OpensMeasurableSpace`, and "no class meets both" in place of invariance of `B` |
| `isSmallFamily_iUnion` (287), `not_isSmallFamily_comb_cross` (294) | `SetRel.isSmallFamily_iUnion`, `SetRel.not_isSmallFamily_comb_cross`, `TauCeti/SetTheory/Descriptive/SmallFamily/Basic.lean:138,203` | library: an iff over any countable index; `ι`, `κ` in independent universes |
| `exists_continuous_orientedGS_hom` (311), `g0_dichotomy` (323) | `TauCeti.exists_continuous_orientedGS_hom`, `SimpleGraph.g0_dichotomy`, `TauCeti/SetTheory/Descriptive/GZeroDichotomy.lean:382,431` (and `TauCeti.g0_dichotomy_oriented`, 414) | none |
| `not_hasCountableBorelColoring_of_orientedGS_hom` (317) | same name in `TauCeti`, `GSGraph.lean:388` | library: `φ` measurable suffices |
| `silver_dichotomy` (334), `silver_dichotomy_standardBorel` (340), `mk_quotient_le_aleph0_or_eq_continuum` (347), `countable_or_hasCantorAntichainOn_of_measurableSet` (354), `borelReducible_bot_cantor_iff` (409) | `Setoid.silver_dichotomy`, `Setoid.silver_dichotomy_standardBorel`, `Setoid.mk_quotient_le_aleph0_or_eq_continuum`, `Setoid.countable_or_hasCantorAntichainOn_of_measurableSet`, `Setoid.borelReducible_bot_iff_not_countable_quotient`, `TauCeti/SetTheory/Descriptive/Silver.lean:130,142,153,163,184` | none |
| `BorelReducible.refl` (380), `.trans` (383), `isSmooth_iff_countablySeparated` (394), `isSmooth_of_countable_quotient` (398) | `Setoid.BorelReducible.refl`, `.trans`, `Setoid.isSmooth_iff_countablySeparated`, `Setoid.isSmooth_of_countable_quotient`, `TauCeti/SetTheory/Descriptive/BorelReducibility.lean:120,127,253,289` | library: measurable classes suffice in the last |
| `measurableSet_eZero` (421), `isMeagre_or_mem_residual_of_eZero_invariant` (425), `not_isSmooth_eZero` (430), `hasCantorAntichainOn_eZero` (434), `borelReducible_bot_eZero` (437), `not_isSmooth_of_borelReducible_eZero` (442) | same names in `TauCeti`, `TauCeti/SetTheory/Descriptive/EZero.lean:105,162,214,228,243,219` | none |

README-only targets are in the library too: the coordinate flip (`PiNat.flipAt`, `CantorSpace.lean:370`), functional Borel graphs (`MeasurableSet.measurableEmbedding_domRestrict_fst`, `measurableSet_graphOn_iff`, `TauCeti/MeasureTheory/Constructions/Polish/Graph.lean:77,113`), the Cantor-scheme extraction (`CantorScheme.VanishingDiam.exists_antichain_map`, `TauCeti/SetTheory/Descriptive/CantorScheme.lean:65`), the hinge of 2.1 (`Setoid.hasCountableBorelColoring_not_iff`, `BorelColoring.lean:271`), the seed (`SetRel.isSmallFamily_univ_iff`), reductions between equalities (`Setoid.borelReducible_bot_bot_iff_lift_mk_le`), the trichotomy of 5.3 (`Setoid.borelReducibility_trichotomy`, `TauCeti/SetTheory/Descriptive/NormalForms.lean:47`). Every path of the "Suggested homes" block exists at the pin.

Not in Tau Ceti or Mathlib at the pins, by name and by object (no theorem concluding `IsSmooth` from a closed graph; no Cantor injection from an uncountable `AnalyticSet`): `isSmooth_of_isClosed` and the perfect set theorem for analytic sets. Neither closes by `simp`, `exact?` or `infer_instance`.

**Repair:** In `Suggested.lean`, delete the 18 definitions and the 42 theorems of the table; import `TauCeti.SetTheory.Descriptive.BorelReducibility` (and what the second statement needs) and keep the two open headlines on the library's carriers. This form was elaborated in a scratch file with `sorry` as its only warning:

```lean
theorem isSmooth_of_isClosed {X : Type*} [TopologicalSpace X] [PolishSpace X] [MeasurableSpace X]
    [BorelSpace X] (E : Setoid X) (hE : IsClosed {p : X × X | E p.1 p.2}) : E.IsSmooth := by
  sorry
```

together with line 362 unchanged. In the README, extend the `From Tau Ceti` table with the modules above and their declarations by exact name, turn each of Layers 0.5, 1.3–1.4, 2, 3, 4.1–4.3 and 5 into "consumed from Tau Ceti" as 0.1–0.4 already are, rewrite 189–192 to list only what the pin lacks (the two theorems above, and whichever worked examples are still open, for instance the Vitali relation), and delete the "Suggested homes" block. If the author judges that nothing substantial remains, the folder's place is with the completed roadmaps; that is the maintainers' decision, not a condition of this review.

## R02 (P3) — Pull-request numbers in the README

**Location:** `README.md:698` and `709`: "[CountableStructureSpaces](../CountableStructureSpaces/README.md) ([#1316](…/pull/1316))".

**Claim:** A roadmap is cited by name and section, never by pull-request number. The previous review's R04 asked for this; the `checkpoint` residues and docstring numbers are gone, these two remain.

**Witness:** `grep -n 'pull/1316' README.md` returns lines 698 and 709.

**Repair:** Delete "([#1316](…))" in both places. (The four Mathlib proposal links at 176–180 carry descriptive labels and may stay.)

## R03 (P3) — Backticked names that neither file nor library declares

**Location:** `README.md:279` `eq_continuum_of_hasCantorAntichainOn`; `README.md:249` `value_mem`, `value_eq_of_mem`; `README.md:281` `CantorScheme.exists_antichain_map`.

**Claim:** A backticked name of the roadmap's own claims a declaration of `Suggested.lean`; a library name is cited exactly.

**Witness:** None of the first three is declared in `Suggested.lean` or in Tau Ceti or Mathlib at the pins (the only `value_mem` is `TripleMasseyDefiningSystem.value_mem`, unrelated). The pinned names are `Setoid.HasCantorAntichainOn.mk_quotient_eq_continuum` (`Antichain.lean:216`, second countable `T₀`) and `CantorScheme.VanishingDiam.exists_antichain_map`.

**Repair:** Cite the two Tau Ceti names; state the partial-function facts of 0.3 in prose, or cite `MeasurableSet.measurable_domRestrict_of_graphOn` (`Polish/Graph.lean:102`).

## R04 (P3) — The Coordination paragraph describes CountableModelCounting as it is in an open revision

**Location:** `README.md:717–719`: "CountableModelCounting states its targets with Tau Ceti's `Setoid.HasPerfectAntichainOn`, `Setoid.HasCantorAntichainOn` and `Setoid.IsThinOn`".

**Claim:** On main the consumer does not do this.

**Witness:** `TauCetiRoadmap/CountableModelCounting/Suggested.lean` on main imports only Mathlib and `Completed.InfinitaryLogic.Suggested` and writes the vocabulary out (`IsThinOnNatModels`, line 479; README line 183 "written out inline"); no `Setoid.HasCantorAntichainOn` occurs in the folder. The sentence is true only of an open revision of that roadmap.

**Repair:** Say what holds on main, or drop the sentence: after R01 the vocabulary is Tau Ceti's and this roadmap no longer owns an interface to propagate.

## R05 (P3) — Targets without locators

**Location:** `README.md:199–618`.

**Claim:** No target carries a theorem, section or page locator; the References list (766–795) names works only. Unchanged from the previous review's R06.

**Witness:** `grep -nE 'Theorem [0-9]|Lemma [0-9]|Proposition [0-9]|p\. [0-9]' README.md` is empty. The fifteen sampled targets (0.2–0.5, 1.1–1.3, 2.1, 2.3, 4.1, 4.3, 5.1–5.4) have no locator to check.

**Repair:** A locator beside each claim that stays a target after R01 (closed relations are smooth; the analytic perfect set theorem), and one beside each consumed theorem's first mention (Kechris for Kuratowski–Ulam, Mycielski, Baire-measurable maps and Alexandrov; Kechris–Solecki–Todorcevic and Miller for Layers 2–4; Gao for Layer 5). The Tau Ceti module docstrings name the sources they follow.

## R06 (P3) — README shape and Lean form

**Location:** `README.md:52,146` and every layer; `Suggested.lean:14–34` and the 18 undocumented theorems (60, 81, 106, 116, 128, 132, 216, 219, 226, 252, 258, 287, 380, 383, 398, 421, 430, 437).

**Claim:** Unchanged from the previous review's R07: no `**Checks.**` (count 0), no `*Needs:*` (count 0), no `### Examples` or `### Dependencies`, headings "Scope and dependency order" and "Existing library and ownership" where the form has `## Scope and ownership` and `## Exact supplier contracts`, no `**Summary.**`, no `## How to read the build`; the module docstring is titled "suggested signatures", calls the file "not exhaustive" and names no headline as stated or not statable.

**Witness:** the two greps return 0; the heading list of the README.

**Repair:** After R01 the README is mostly supplier contracts; give what remains the standard headings, a `*Needs:*` line and Checks per kept target (for `isSmooth_of_isClosed`: `|x| = |y|` on ℝ is closed with 𝔠 classes; E₀ is Fσ, not closed, and not smooth; the universal relation is closed with one class). Retitle the module docstring "…: target signatures", state that the file gives the headline theorems against the pinned APIs, and give every kept declaration a docstring.

## R07 (P3) — Two proved `example`s pin library facts

**Location:** `Suggested.lean:49–50` and `75–77`.

**Claim:** A proved `example` stays only when it tests something nontrivial about a kept definition; these test instance search and restate `TauCeti.isGδ_of_isCompletelyMetrizableSpace` (the body is that one name).

**Witness:** both bodies: `⟨inferInstance, inferInstance, inferInstance⟩` and the single library name.

**Repair:** Delete both from `Suggested.lean`; the README's 0.1 and 0.2 keep the facts. (`BorelReducible.refl`, `.trans` and line 442, the previous review's R08, go with R01.)

## R08 (P3) — The description contradicts the head

**Location:** pull-request description, third revision bullet: "as `main` did for `IsGδ.polishSpace`, they are now stated in the roadmap namespace".

**Claim:** The head states none of the seven; they were deleted in favour of the Tau Ceti declarations.

**Witness:** `grep -n 'isMeagre\|standardBorelSpace\|AnalyticSet.inter\|mk_eq_continuum' Suggested.lean` finds only the module docstring's citations.

**Repair:** Replace the sentence by what the head does (the seven are consumed from Tau Ceti and not stated), and let the title describe the change as a whole.

## Previous findings

- R01 (eight restated Tau Ceti declarations) — repaired: the eight are deleted; "consumes them and does not restate them" (README 161–162); the `From Tau Ceti` table names each. The same defect for the remaining declarations is R01 here.
- R02 (seven Mathlib names read as the roadmap's own) — repaired: gate `readme-ids-missing=0`.
- R03 (`set_option autoImplicit false`) — repaired: no `set_option` in the file.
- R04 (process wording, pull-request references) — partly: "revision `518a366`" (README 733, 795), no "has landed" or "prototype"; lines 698 and 709 keep "#1316" (R02 here).
- R05 (`isThinOn_image_iff`) — repaired: "`g '' A` is thin for `F` exactly when `A` is thin for `E`" in prose (README 289); three other names are R03 here.
- R06 (locators) — not repaired; R05 here.
- R07 (shape, Checks, docstrings) — not repaired; R06 here.
- R08 (padding) — not repaired: lines 380, 383, 442 are present; covered by R01 here.

## Verified sound

**Gate**, rerun at 68c5f0b: every counter 0, `OK`. **Depcheck**: `depcheck: 229 roadmaps, 2122 edges, 0 problem(s)`; no UPWARD or CYCLE line. The roadmap is on main; it names no roadmap as a supplier (CountableModelCounting and CountableStructureSpaces appear as consumers and deferrals only). **Outside-folder diff**: empty. **Overlaps**: none listed; `roadmaps grep` finds `HasCantorAntichainOn`, `gZero`, `silver_dichotomy`, `BorelReducible`, `IsSmooth` declared in no other roadmap's `Suggested.lean`, and no other README plans `isSmooth_of_isClosed` or the analytic perfect set theorem.

**Elaboration**: `lake env lean` on `Suggested.lean` exits with 44 `declaration uses sorry` warnings and nothing else; the eleven imported Tau Ceti modules exist at the pin.

**Probe** (scratch copy; Tau Ceti modules `SetTheory.Descriptive.{Silver, EZero, GZeroDichotomy, BorelReducibility, InvariantSeparation, NormalForms, CantorScheme, BorelColoring}`, `Topology.Baire.BaireMeasurableMap`, `Topology.Instances.CantorSpace`, `Data.Set.Countable`, `MeasureTheory.MeasurableSpace.Card` built first): 42 statements close from the declarations of R01's table, 2 remain. The one-tactic probe on those two fails for `simp`, `exact?`, `infer_instance`.

**Signatures**: all 62 elaborated types compared with the README. The two binder-loss leads are not defects: `RelIndependent` does not need the σ-algebra, and `IsSmallFamily` keeps it. `not_hasCountableBorelColoring_of_orientedGS_hom` loses `[PolishSpace X]`, which its statement does not need (Tau Ceti proves it for any measurable space).

**Library declarations opened at the pins** (58): the 42 of R01's table; `PiNat.prependWord` (`CantorSpace.lean:82`), `PiNat.wordCylinder` (157), `PiNat.flipAt` (370); the three antichain definitions (`Antichain.lean:107,112,116`); `SetRel.IsIndependent`, `SetRel.HasCountableBorelColoring` (`BorelColoring.lean:86,138`); `SetRel.IsSmallFamily` (`SmallFamily/Basic.lean:90`); `Setoid.BorelReducible`, `Setoid.IsSmooth` (`BorelReducibility.lean:100,229`); `TauCeti.eZero` (`EZero.lean:81`); `TauCeti.mycielski`, `TauCeti.mycielski_prod` (`Topology/Baire/Mycielski.lean:165,207`); `TauCeti.curry_le_residual` (`Topology/Baire/KuratowskiUlam.lean:100`); Mathlib `IsGδ.polishSpace` (`Mathlib/Topology/MetricSpace/Polish.lean:309`). Every one of the 34 names in the README's `From Tau Ceti` table resolves at the pin in the file the table gives.

### Adversarial table

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| `silver_dichotomy` (Lean 334; 4.2) | `X = ∅`; `E = ⊥` on ℝ; E₀; `E = ⊤` on ℝ | ∅: quotient empty, countable T. `⊥` on ℝ: countable F, Cantor antichain T (any Cantor set). E₀: countable F, antichain `x ↦ x ∘ (unpair ·).1` T. `⊤`: 1 class, antichain F | true; = `Setoid.silver_dichotomy`; R01 |
| `mk_quotient_le_aleph0_or_eq_continuum` (347) | `X = ∅`; `Fin 2`; ℝ with `⊥`; ℝ with Vitali | 0 ≤ ℵ₀; 2 ≤ ℵ₀; 𝔠 = 𝔠; Borel with countable classes, so 𝔠 | true; R01 |
| relative form (354; 4.3) | `A = ∅`; `A = X`, `F = R`; `R = ⊥`, `F = ⊤` | `Quotient F` empty, countable T; reduces to 334; `F` has 1 class, left side T though `R` has an antichain (an "or", not "xor") | true; hypothesis direction `R → F` is the needed one; R01 |
| `g0_dichotomy` (323; Layer 3) | `G = ⊥`; `G = gZero`; `G = gSGraph {[]}` (sparse, not dense) | ⊥: constant coloring T, hom F (gZero has an edge). gZero: coloring F (Miller's lemma), identity hom T. `{[]}`: 2-colored by coordinate 0, so no hom from gZero | `Xor` holds in each; = `SimpleGraph.g0_dichotomy`; R01 |
| oriented halves (311, 317) | `G = ∅`; `G` with a loop `(x, x)`; `S = ∅` | ∅: coloring T, so 311 vacuous. Loop: coloring F, constant `φ = x` is a hom T. `S = ∅` sparse: any `φ` is a hom; not dense, so 317 does not apply | consistent; sparse for existence, dense for exclusivity, as stated |
| `SparseWords`/`DenseWords`/`canonicalWord` (198–214) | `n = 0`; `r = [true]`, `k = 1` | `canonicalWord 0 = []` (decoded word has length ≤ 0 only if `[]`; else `replicate 0`); length `n` in both branches; `[true] <+: canonicalWord (pair (encode [true]) 1)` since `1 ≤ pair _ 1` | one word per length, dense |
| `HasCantorAntichainOn` vs `HasPerfectAntichainOn` (94–100, 132; 0.5) | `A = ∅`; `E = ⊤`; uncountable discrete `X` with `E = ⊥` | ∅: both F. `⊤`: Cantor needs `a ≠ b → False`, F; perfect set would be a nonempty perfect subsingleton, F in T₁. Discrete: no nonempty perfect set, and a continuous map from Cantor space has finite image, both F | agree; excludes the model "any uncountable set" |
| `hasCantorAntichainOn_image_iff` (138) | `g = id`; `A = ∅`; `g` the inclusion of a Borel subset | identity: trivial; ∅: F ↔ F; inclusion: the relative form's use | both directions hold (Borel-set transport) |
| `mk_le_continuum_of_standardBorelSpace` (81) | `X = ∅`; ℝ | 0 ≤ 𝔠; 𝔠 ≤ 𝔠 | true; library form weaker in hypothesis |
| `exists_isGδ_mem_residual_continuousOn` (166; 1.3) | `f` = indicator of ℚ on ℝ; `X` discrete | continuous on ℝ ∖ ℚ, comeagre Gδ T; discrete: `C = X` | true |
| `exists_cantor_subcopy_continuous` (174) | `ι = ∅`; `g` constant; `g` = indicator of a countable dense set | `e = id`; `e = id`; `e` into the complement, composite constant | true |
| Miller's lemma (231; 1.4) | `S = {[]}`, `B` = cylinder `[false]`; dense `S`, `B = univ` | `B` non-meagre, no `G_S`-edge inside (edges flip coordinate 0): density necessary. `univ`: any edge | true as stated |
| `exists_invariant_measurableSet_separating` (273; 2.2) | `E = ⊥`; `A = ∅`; `B` not invariant | `⊥`: plain Lusin separation. ∅: `C = ∅`. Non-invariant `B` meeting the saturation of `A` away from `A`: no invariant `C` exists, so `hBinv` is needed | true; library form assumes disjoint images instead |
| `IsSmallFamily` (283; 2.3) | `Φ = ∅`; `ι` empty, `Φ = univ`; `Fin 1`, `G` = inequivalence of E₀ | ∅: small T. `ι = ∅`: `∃ i` fails, not small whatever `G`, so "nonempty `ι`" in the seed is needed. E₀: not small (no countable coloring) | README's seed and acceptance check consistent |
| `not_isSmallFamily_comb_cross` (294) | `G = ∅` | every set is independent, so `B k = univ` captures any `φ` with a value; `hΦ` then forces `ι = ∅`, and no `s : ι` exists: the statement is vacuous there | no counterexample; hypotheses consistent |
| `isSmooth_iff_countablySeparated` (394; 5.2) | `E = ⊥` on ℝ; `E = ⊤`; E₀ | ℝ countably separated T, smooth T; one-point quotient T/T; E₀: F/F (generic ergodicity) | true |
| `isSmooth_of_isClosed` (404; kept) | `X = ∅`; `x 0 = y 0` on `ℕ → Bool`; `\|x\| = \|y\|` on ℝ; E₀ | ∅: empty map reduces. Two classes: reduce by `x ↦ const (x 0)`. `\|·\|` composed with a Borel injection ℝ → Cantor. E₀: Fσ dense, not closed, hypothesis fails and conclusion fails | true; route of 5.2 checked: saturations of `U`, `V` disjoint when `U ×ˢ V` misses `E` (a common point would give `u E v`) |
| analytic perfect set theorem (362; kept) | `A = ∅`; `A = ℚ`; `A = ℝ`; uncountable indiscrete `X` | ∅, ℚ: `hunc` fails. ℝ: Cantor set. Indiscrete: every set analytic, an injection of Cantor space needs `#X ≥ 𝔠`, not provable for `#X = ℵ₁`, so `T2Space` is doing work | true as stated; kernel of `g` closed needs Hausdorff |
| `borelReducible_bot_cantor_iff` (409; 5.3) | `X = ∅`; `E = ⊥` on ℕ; E₀ | no map from Cantor space to ∅, quotient countable: F ↔ F. ℕ: an injective reduction is impossible, F ↔ F. E₀: T ↔ T | true |
| `eZero` (419; 5.4) | `x = y`; `x`, `y` differing at one place; at all even places | related; related; unrelated. Map `x ↦ (n ↦ x (unpair n).1)`: `x ≠ y` at `k` gives differences at every `pair k j`, infinitely many | Borel (Fσ), antichain correct |
| `not_isSmooth_of_borelReducible_eZero` (442) | `E = eZero`; `E = ⊥` on Cantor | reduces by identity, not smooth T; `⊥` smooth, so E₀ does not reduce to it, consistent with 430 | true; one composition |
| 0.1 "nonempty perfect T₁ Baire: comeagre sets uncountable" | ℝ, `s = ℝ ∖ ℚ`; ℕ discrete; ∅ | uncountable T; not perfect; `univ = ∅` comeagre and countable, so nonemptiness needed | matches `TauCeti.not_countable_of_mem_residual` (`[Nonempty X]`) |
| 1.1 `TauCeti.curry_le_residual` | `s = (ℝ ∖ ℚ) ×ˢ ℝ` | comeagre in ℝ²; sections comeagre for comeagrely many `x` | direction as the README states |
| 1.2 `TauCeti.mycielski` | `k n = 0`; `k n = 1`; `X` a point | one-point tuple space has only ∅ meagre; `f` avoids a meagre set; a point is not perfect, excluded | README hypotheses equal the declaration's |
| README 5.1 "`⊥` on `X` reduces to `⊥` on `Y` iff `#X ≤ #Y`" | `X = Fin 3`, `Y = Fin 2`; ℝ, Cantor | 3 ≤ 2 F, no injection F; 𝔠 ≤ 𝔠 T, Borel isomorphism T | true; the library states it with `Cardinal.lift` for two universes |
| README Layer 3 check "`gSGraph {[]}` 2-colored" | edge `(false ⌢ x, true ⌢ x)` | colors `false`, `true` at coordinate 0 | true |
| README 189–192 "The targets of this roadmap are …" | each item against 2fd255d9 | all present except two theorems (R01's list) | false at the pin; R01 |
| README 717–719 | CountableModelCounting on main | no `Setoid.` antichain name; vocabulary inline | R04 |

**Seeded sample** (15 targets): 0.2, 0.3, 0.4, 1.1, 1.2 are consumed sections whose every cited declaration was opened at the pin and matches the prose (hypotheses included: `T2Space` on `AnalyticSet.inter` and `.offDiag`, none on `.prod`; second countability of the second factor in Kuratowski–Ulam; no separability in Mycielski). 0.5, 1.3, 2.1, 2.3, 4.1, 4.3, 5.1, 5.2, 5.3, 5.4 were checked against the Tau Ceti theorems that prove them (table of R01) and on the instances above; the route of 4.1 is the proof of `Setoid.silver_dichotomy` step for step (`Setoid.exists_continuous_forall_gSGraph_adj_not`, `Setoid.isMeagre_comap_of_forall_gSGraph_adj`, `Setoid.hasCantorAntichainOn_range_of_forall_gSGraph_adj`). None of the fifteen carries a locator (R05).

## Not verifiable

- No text of the References was read. The sources cache records none for this roadmap. The sources service was asked for Kechris–Solecki–Todorcevic 1999 and Silver 1980 (both resolve only to paywalled publisher pages) and for Miller 2012 (no copy on a host of a known licence class); nothing was recorded in a manifest. Kechris 1995, Gao 2009, Miller's lecture notes, Kuratowski–Ulam 1932 and Mycielski 1964 were not requested. Since the README gives no locator, there was no theorem number or page to confirm; the mathematical content of the sampled targets was checked against the pinned library's proofs instead.
- The external formalization at revision `518a366` and the claims of the Provenance table about it were not opened.
- Ownership against open pull requests was checked with `roadmaps grep` over the indexed heads only.

## Source issues

- none
