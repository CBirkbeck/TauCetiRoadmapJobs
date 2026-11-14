# Review of CountableStructureSpaces (pull request #1316 at 27e4b31)

**Verdict:** needs changes

`README.md` and `Suggested.lean` are in `TauCetiRoadmap/CountableStructureSpaces/`. Library paths are at the pins (Mathlib `1b1ccf4b0`, Tau Ceti `2fd255d99`). Source ids: `marker2013notes` (Marker's 2013 notes, the README's "Marker's notes") and `vaught1974`. R01 is P2; R02 and R03 are P3. All eight findings of the previous review are repaired.

## R01 (P2) — Layer 4.3, 4.4 and 6.1 state Borelness without the countability hypothesis the Lean carries

**Location:** `README.md:642–644`: "if every code in `modelsOf φ` has Scott height at most `β < ω₁`, then isomorphism restricted to `modelsOf φ` is Borel". Same omission at 645–648, 671–674, 874–875 and 882–883.

**Claim:** The statements hold as written, for every relational `L` (Convention 1 carries countability "only where a statement needs" it; 6.2 states it bullet by bullet, these bullets do not).

**Witness:** Unary `P_r`, `r ∈ ℝ`, `φ = ⊤`: every code has Scott height ≤ ω. A product-measurable set has countable support; `c₀` (all empty) and `d` (`P_r = {0}`, `r` off the support) agree there, `(c₀, c₀)` is isomorphic, `(c₀, d)` is not. `Suggested.lean:245, 255, 314, 421, 429` carry the binder.

**Repair:**
- 642: "`measurableSet_iso_inter_of_scottHeight_le`: for relational `L` with countably many relation symbols, if every code in `modelsOf φ` …".
- 645: "`measurableSet_setOf_selfStabilizationOrdinal_le`: for relational `L` with countably many relation symbols and `β < ω₁`, the codes with …".
- 671: "`measurableSet_iso_inter_iff_exists_bfLevel`: for relational `L` with countably many relation symbols, isomorphism restricted to `modelsOf φ` is Borel exactly when …".
- 874: "`invariant_analytic_separation`: for a language with countably many relation symbols, if `A` and `B` are analytic, …".
- 882: "`exists_sentence_separating`: for relational `L` with countably many relation symbols, by López–Escobar, …".
- Add to the Layer 4 Checks, as a negative control: "with unary predicates `P_r` for `r ∈ ℝ`, every code has Scott height at most `ω`, but isomorphism is not measurable for the product σ-algebra on pairs: the all-empty code is isomorphic to itself and not to a code with `P_r = {0}`, and a measurable set cannot tell the two pairs apart once `r` is outside its countable support. So 4.3 needs countably many relation symbols."

Tested: with countably many symbols the witness is excluded, and the square is Polish with `measurableSet_setOf_bfEquivSetoid` applying.

## R02 (P3) — The scope table's inputs for Layers 5 and 6 omit layers their sections use

**Location:** `README.md:49–50`: "| 5 | López–Escobar: … | 2–4; InfinitaryModelExistence PC-separation |" and "| 6 | … | 1–5; BorelEquivalenceRelations (invariant Lusin separation) |".

**Claim:** The table gives each layer's inputs.

**Witness:** `README.md:765` "*Needs:* L0 (`queryCode`, `Equiv.encodeVia`)"; 845 "L1.2"; 866 "Layers 0–4"; 929 "L0 (decoding)"; 947 "Layers 0–5".

**Repair:** Row 5 inputs: "0–4; InfinitaryModelExistence PC-separation". Row 6 inputs: "0–5; BorelEquivalenceRelations (invariant Lusin separation)".

## R03 (P3) — The description's count of `sorry` warnings is of an earlier head

**Location:** Pull-request description, Validation: "with only the expected `sorry` warnings (38)".

**Claim:** `Suggested.lean` at this head elaborates with 38 `sorry` warnings.

**Witness:** `lake env lean` on `Suggested.lean` at `27e4b31` exits 0 with 35 warnings, all `declaration uses sorry` (four sorried declarations deleted since, `toStructure_toRelationalConfiguration` added).

**Repair:** "with only the expected `sorry` warnings (35)".

## Previous findings

- R01 (graph events unowned) — repaired: `README.md:281–284` makes `toStructure_toRelationalConfiguration` a Layer 0 target ("the pin states no such lemma, so it is a target here"); `Suggested.lean:83` states it and `:137–143` derives the graph events from it.
- R02 (Layer 4 supplier) — repaired: `README.md:48` "…; BorelEquivalenceRelations (products of analytic sets)", 53 "(Layers 1, 2, 4 and 6)", 716–717.
- R03 (padding) — repaired: the five declarations are gone; `README.md:589` "Still to build: `stabilizesCompletely_iff_univ` and `selfStabilizationOrdinal_le_scottHeight`"; 905 "the descending-sequence tree of `c`".
- R04 (two-class corollary) — repaired: declaration deleted; `README.md:667` "The form for two classes, a corollary".
- R05 (locators) — repaired: 336–338, 508–516, 628–633, 685–695, 923–927; each checked below.
- R06 (Checks) — repaired: `README.md:528–538`, 860–862, 711–712.
- R07 (unnamed declarations) — repaired: 654–656, 732, 752, 898.
- R08 (description, merged siblings) — repaired: "Its suppliers InfinitaryModelExistence and BorelEquivalenceRelations, and its consumer CountableModelCounting, are on `main`".

## Verified sound

`c₀` is the all-empty code for unary `P_r`, `r ∈ ℝ`. `P{S}` is the code of one unary `P` equal to `S`.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.1 S∞ Polish, basis at 1 | `α` finite; `α = ℕ` | finite: `fixingSubgroup univ = {1}` open, discrete; `vaught1974` line 399: permutations of ω, product topology | pass | — |
| 1.2 action convention | 3-cycle `σ`, transposition `τ`, `P{0}` | `σ • P{0} = P{1}` (inverse gives `P{2}`); `(στ) • c = P{2}`, `τ • (σ • c) = P{0}` | pass | — |
| `analyticSet_iUnion_smul`, no binder | `A = {c₀}`; `A = ∅` | saturation `{c₀}`, a constant image; `∅`; `AnalyticSet.prod` (Tau Ceti `Polish/Analytic.lean:96`) has no Polish hypothesis | pass | — |
| `mem_stabilizer_iff` | `P{0}`, `τ = (0 1)`, `(1 2)` | `τ • P{0} = P{1} ≠ P{0}`, and `P(τ 0) = P(1)` false ≠ `P(0)`; `(1 2)` fixes both sides | pass | — |
| 4.1 isomorphism classes Borel | countable vocabulary | `marker2013notes` line 1005–1007 (Cor. 3.4, Scott sentence); `vaught1974` line 311 (Cor. 2.6: metrizable `X`, Polish `G`) | pass | — |
| 4.2 Scott height of pure sets | `Fin 0`, `Fin 2`, `ℕ` | `BFEquiv k` ⟺ `r = r'` or both ≥ `k`; SH = 1, 3, ω; SR = 1 (Tau Ceti `Scott/PureSet.lean:68`); `1 + ω = ω` attained | pass | — |
| 4.2 `selfStabilizationOrdinal_le_scottHeight` | `Fin 2`, `ℕ` pure | s = 0 ≤ 3; 0 ≤ ω | pass | — |
| 4.3 `measurableSet_iso_inter_of_scottHeight_le` | one unary `P`, `φ = ⊤`; `P_r`, `φ = ⊤` | SH ≤ ω, iso = `bfEquivSetoid ω`, Borel; `P_r`: SH ≤ ω but `(c₀,c₀)`, `(c₀,d)` inseparable by countable support | Lean pass; README lacks hypothesis | R01 |
| 4.3–4.4 locator | Theorem 11.19 | `marker2013notes` lines 4776–4788; (⇐) fails at `|P| = 2` vs `3`: SR = 1, `∼₂` holds, `∼₃` fails | pass | — |
| 4.4 `bfTree`, `lt_treeHeight_bfTree` | `P{0}` vs `P{∅}`; `P{0}` vs `P{1}`; nullary `Q` disagreeing | tree `{[]}`, height 1, `BFEquiv 0` T and 0 < 1, `BFEquiv 1` F; branch `1,1,0,0,2,2,…`; `⊥`, `BFEquiv 0` F | pass | — |
| `exists_uniform_bfSeparation`, no countability | `A = {(P{0}, P{∅})}`; `A = ∅` | β = 1; β = 0; node sets are intersections of clopen conditions over all symbols, closed | pass | — |
| `measurableSet_iso_inter_iff_exists_bfLevel` | `φ = ⊥`; one unary `P`, `φ = ⊤`; `P_r` | both sides T; β = ω, both T; `P_r`: right T (β = ω), left F | Lean pass; README lacks hypothesis | R01 |
| 5.1 easy direction | Lemma 3.1, Cor. 3.3 | `marker2013notes` lines 956, 1000–1002; here `measurableSet_modelsOf` (Tau Ceti `ModelsOf.lean:165`) needs no countable language | pass | — |
| 5.2 `exists_pcSentence` | `T = ⊥`; full tree; `ℕ ⊔ ℤ`; `ψ = ⊥`, `ψ = ⊤` | no model; every `c` with `g = 0` a model; numeral axiom fails on `ℤ`; `⊥` fails completeness, `⊤` fails soundness | pass | — |
| 5.3 `lopez_escobar`, every relational `L` | empty language; `B = {c₀}` for `P_r`; non-invariant `{P{0}}` | `⊥` or `⊤`; `{c₀}` not product-measurable, hypothesis fails; not a model class, invariance needed | pass | — |
| 5.3 step 0 | `B = {c | P_{r₀}(0)}` saturated | support atoms use `R = {P_{r₀}}`; `B = reduct⁻¹ B₀`, `B₀` invariant | pass | — |
| 5.4 `lopezEscobar_iff`, action form, invariant σ-algebra | empty language; one unary `P`, `B` = "finitely many" | `∅`, `univ`; `B = modelsOf (⋁ₖ "at most k")`, Borel, invariant, not Gδ | pass | — |
| 5.4 `analyticSet_iff_exists_pc` | `B = ∅`; `P_r`, `B = {c₀}` | `pcSentence ⊥`; `{c₀}` invariant analytic, no `ψ` (countably many symbols): binder needed | pass | — |
| 6.1 `invariant_analytic_separation` | `A = ∅`; `A = {P{0}}`, `B` = orbit of `P{0,1}` | `C = ∅`; `C` = "exactly one `P`-element"; `vaught1974` line 350, statement (10), both sets invariant there | Lean pass; README lacks hypothesis | R01 |
| 6.2 `wellOrderClass` | `(ℕ, <)`; `(ℤ, <)` on `ℕ`; `(ℕ, ≤)` | type ω, tree height ω + 1; branch; reflexive, constant branch | pass | — |
| `analytic_type_bounded`, `not_analyticSet_wellOrderClass` | `A = {(ℕ,<)}`; `A = WO` | β = ω + 1; a bound β contradicts a code of type max(β, ω) | pass | — |
| `not_measurableSet_wellOrderClass`, `not_exists_modelsOf_eq_wellOrderClass` | countable `L` | Borel ⇒ analytic needs Polishness; model classes are measurable | pass | — |
| Layer 3 `treeHeight`, `KBLT`, `body` | `⊥`, `{[]}`, decreasing sequences; `[0,1]`/`[0]`, `[0,5]`/`[1]` | 0, 1, ω + 1; T, T, reverse F; `body {[]} = ∅` | pass | — |
| `analytic_treeHeight_bounded` | `A = ∅`; closed, not open, node sets | β = 0; a branch `(x, y*)` of `W` gives `x|m ∈ T (f y*)` by closedness | pass | — |
| scope table rows 5, 6 | 5.2, 5.4, 6.2 *Needs:* | L0, L1.2, L0 against "2–4" and "1–5" | mismatch | R02 |

- **Source locators:** 27 checked against the text, 19 in `marker2013notes` (lines 570–596, 956–1007, 1666–1731, 3861–3881, 3973–3980, 3999–4002, 4776–4788) and 8 in `vaught1974` (lines 311, 350, 364–375, 399–403, 436–457); all support the statements as written.
- **Library declarations at the pins:** 20 opened and 24 more located by name, among them Tau Ceti `RelationalConfiguration/Isomorphism.lean:187, 268, 323`, `BackAndForth.lean:70, 144`, `Scott/Height.lean:78, 133, 186`, `Interpolation/PCClass.lean:76`, `SetTheory/Descriptive/InvariantSeparation.lean:117`, `SimpleGraph/RelationalConfiguration.lean:205`; Mathlib `MeasureTheory/Constructions/Cylinders.lean:476`.
- **Cross-roadmap citations resolved on main:** InfinitaryModelExistence `pcSeparation` (Layer 7.2, README 685, `Suggested.lean:723`, same statement), graph translation (Layer 6); BorelEquivalenceRelations Layers 0.2, 0.3, 2.2; InfinitaryLogic Layers 0–3; CountableModelCounting README 196, 214, 217 cites the three names this README lists.
- **Gate:** every check 0, `OK`, `build=0`; nothing changes outside the folder. **Dependency check:** `depcheck: 244 roadmaps, 2197 edges, 0 problem(s)`.
- **Elaboration:** exit 0, 35 warnings, all `declaration uses sorry`. The 54 elaborated signatures were compared with the README; no binder is lost; the differences are R01.
- **Padding probe:** in a scratch copy each of the 35 `sorry`s was replaced by `first | rfl | simp | infer_instance | exact? | sorry`; none closed.
- **Headlines:** `lopezEscobar_iff`, its action and σ-algebra forms, `measurableSet_iso_inter_of_scottHeight_le`, `not_measurableSet_wellOrderClass` and `not_analyticSet_wellOrderClass` are stated; Borel satisfaction, Borel back-and-forth levels and Borel isomorphism classes are at the pin (`measurableSet_modelsOf`, `measurableSet_setOf_bfEquiv`, `realize_scottSentence_iff`).
- **Overlap check:** read CountableModelCounting, InfinitaryModelExistence, BorelEquivalenceRelations, InfinitaryLogic, HanfNumbers, RandomGraphs; nothing shared. RandomGraphs' `measurableSet_setOf_realize_graph` is the first-order event at fixed assignments and cites Layer 0 here for `toStructure_toRelationalConfiguration`; InfinitaryModelExistence's well-order target is the model-class form (its README 785).
- **Remark** (no change asked): `exists_pcSentence` gives one sentence per universe `w`; Layer 5.3 uses it at `w = 0` only.

Source independence: 32 passages compared with 2 sources, none shared beyond the displayed formula of Convention 3; largest share `marker2013notes`, 19 of 27 locators; contents compared with `marker2013notes` (§§2.2, 3.1, 4.3, 9.4–9.5, 11 against Layers 0–6): independent.

## Not verifiable

- Kechris 1995, Gao 2009, Keisler 1971 and Marker 2016 (the book) are paywalled with no legal open copy; the README cites them by chapter or as whole works. The attribution of the tree-of-attempts proof to Kunen (Kechris §31) was not checked.
- López-Escobar 1965 is cited at no claim and was not fetched.
- `vaught1974` is an OCR of a two-column scan: p. 282's sentence on the Polish group is legible only in part (lines 399–403).

## Source issues

- **Error** in marker2013notes at Theorem 11.19 (proof, ⇐), p. 144: the source says that when every model has Scott rank below α, isomorphism is ∼α; it should use a level such as α + ω, since (ℕ, P) with |P| = 2 and |P| = 3 have SR = 1 and are ∼₂; affects the proof.
- **Misprint** in marker2013notes at Theorem 11.19 (proof, ⇒), p. 144: the source says the order types are "less that α"; it should be "less than α"; affects nothing.
- **Misprint** in marker2013notes at Definition 9.38, p. 120: the source says "Kleene–Brower order"; it should be "Kleene–Brouwer order"; affects nothing.
- **Misprint** in marker2013notes at Lemma 2.17 (proof, claim 1), p. 18: the source says the witness d is taken in N; it should be in M, the only structure present; affects nothing.

## For the human reviewers

- **Licence.** README `## Provenance` (lines 1071–1089) names `cameronfreer/infinitary-logic` at `518a366` (stated Apache-2.0) as the origin of the layer files. `Suggested.lean` was not compared with that repository and its licence was not read.
- **Licence.** `vaught1974` was read from `matwbn.icm.edu.pl` (file `fm82118.pdf`), the ICM digital library's copy of Fundamenta Mathematicae 82; this review classed the host as institutional.
