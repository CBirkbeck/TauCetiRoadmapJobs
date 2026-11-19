# Review of CountableModelCounting (pull request #2555 at 4d0f213)

**Verdict:** accepted

**Summary.** Accepted, with no findings, small corrections or format notes. The previous review found one gap: the restriction of Vaught's conjecture to countably infinite models was listed as a headline but not stated. `vaughtConjecture_iff_nat` now states it in `Suggested.lean` and §5.3, the statement is true in both directions, and its route uses only declarations present at the Tau Ceti pin. The new locators (Montalbán, Theorem XI.3, §XII.1, Lemmas XII.5–XII.6 and Theorem XII.7; Andrews–Goldbring–Hachtman–Keisler–Marker, §1) say what the text claims at the pages given. Two points carried from the previous review are left for the human reviewers: the draft status of the most-cited source, and the licence of the external formalisation named in the provenance section.

## Previous findings

- R01 — repaired: `vaughtConjecture_iff_nat` is stated in the Layer 5 section of `Suggested.lean` (line 325), in the form the previous report proposed, and named in §5.3 (README line 898) with its route: forward through `φ ⊓ L.infiniteSentence`, backward through §0.2.
- C01 — repaired: §2.1 (line 426) cites "Montalbán, Part 2, Theorem XI.3, (2)⇒(1), p. 207"; §3.3 (line 517) "Morley 1970; Montalbán, Part 2, §XII.1, p. 216"; §5.3 (lines 888, 892) "Andrews, Goldbring, Hachtman, Keisler and Marker, §1, p. 1".
- C02 — repaired: the description now reads "corrects the nine statements listed below, and adds one headline theorem", "The API of `HasPerfectSetOfNonisoModelsOn` is spelled out", "Every section that states a target has a *Needs:* line", and says that 4a and 4b merge into §4.1.
- N01 — repaired: §5.8 opens with "The three inputs of §5.9 … (cf. Montalbán, Part 2, Lemmas XII.5–XII.6, pp. 218–219)" (line 1054). §5.9 opens with "(cf. Montalbán, Part 2, Theorem XII.7, pp. 219–220)" (line 1079).

## Verified sound

| # | Statement | Instances tried | Values computed (one side / other side) | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | §5.3 `vaughtConjecture_iff_nat` (`Suggested.lean:325`), backward | `∃x∀y y=x` with unary `P_i`, `i∈ℕ`; `⊤` in the empty language | `P_i`: ℕ-tier empty, so countable; `Fin 1` is perfect (`of_fin`), so the dichotomy holds. `⊤`: 1 class per tier; `countableModelCount_le_aleph0_iff` gives `ℵ₀` | holds | none |
| 2 | §5.3 `vaughtConjecture_iff_nat`, forward | all equivalence relations; `∃x∀y y=x` | equivalence relations: `φ ⊓ inf` has a perfect set at ℕ; the reduction at `:315` gives a perfect set on ℕ. `∃x∀y y=x`: `φ ⊓ inf` has count 0, ℕ-quotient empty | holds | none |
| 3 | §5.3 `vaughtConjecture_iff_nat`, form | `#check @`; one-tactic probe | binders `Language.{0,0}`, `IsRelational`, countable relations, the same as `VaughtConjecture` and README line 898; `rfl`/`simp`/`infer_instance`/`simp_all` close nothing | target, not padding | none |
| 4 | Tau Ceti inputs of row 1 | `Counting/Classes.lean:169, 340, 354, 360` | `countableModelCount_le_aleph0_iff`: `≤ ℵ₀` ↔ ℕ and every `Fin n` countable; `HasPerfectlyMany` is ℕ or `∃ n`, with `of_nat`/`of_fin` | route sound | none |
| 5 | §2.1 bounded-rank dichotomy, new locator (sample) | `P_i` one-element; `E` with infinite classes | `P_i`: count `𝔠`, perfect only at `Fin 1`. `E`: count `ℵ₀`. Montalban-CSTpart2 lines 8997–9006, p. 207: SR `< α` ⇒ `≡_{α+2}` decides ≅, so Borel | locator supports the Borel step | none |
| 6 | §3.3 Morley, new locator (sample) | all equivalence relations; Ehrenfeucht | perfect, count `𝔠`; Ehrenfeucht 3 `≤ ℵ₁`. Montalban-CSTpart2 lines 9286–9302, p. 216: ω-presentations, `< 𝔠` ⇒ `≤ ℵ₁` via Silver per level | cardinal form on ℕ, as stated | none |
| 7 | §5.3 `cardinalVaughtConjecture_of_aleph_one_eq_continuum`, new locator | count `= ℵ₁` under CH | `≤ ℵ₁ = 𝔠`, so `≤ ℵ₀` or `= 𝔠` (`aleph_one_le_iff`). AGHKM-Scattered lines 32–33, p. 1: trivial for `ϕ` under CH | holds; locator correct | none |
| 8 | §5.3 `cardinalVaughtConjecture_iff_vaughtConjecture`, new locator | count `= 𝔠` with `ℵ₁ < 𝔠` | `𝔠 > ℵ₁`, so witnessed Morley forces the perfect alternative. AGHKM-Scattered lines 33–35: absolute ⇔ Vaught for `ϕ` when CH fails; §5.2 names the absolute form | holds; "absolute form in place of" accurate | none |
| 9 | §5.8 opening (Lemmas XII.5–XII.6) | the items of §5.8 | three numbered items, all on §5.9's *Needs:* line. XII.5 at line 9367 (p. 218); XII.6 at lines 9376–9396 (pp. 218–219) | locators correct | none |
| 10 | §5.9 opening (Theorem XII.7) (sample) | `X,Y` first differ at `i` | `A_X ~ A_{X↾(i+2)} ~ A_{X↾(i+1)} ≁ A_{Y↾(i+1)}` at `α_{i+1}`. XII.7 at lines 9426–9471, pp. 219–220 | locator correct | none |

The rows for the statements this change leaves untouched stand as in the previous review, of `df41e71`. That includes the sampled targets 0.2, 1.1, 2.2, 3.4, 4.1, 4.2, 4.7, 5.4, 5.6, 5.7, 6.1 and 6.3.

- **Source locators checked against the text (6).** Montalban-CSTpart2 (draft of 22 April 2025): Theorem XI.3 p. 207 (lines 8997–9012); proof of Morley's theorem §XII.1 p. 216 (9283–9302); Lemma XII.5 p. 218 (9367); Lemma XII.6 pp. 218–219 (9376–9396); Theorem XII.7 pp. 219–220 (9426–9471). AGHKM-Scattered: §1 p. 1 (lines 27–37).
- **Library at the pins.** Opened Tau Ceti `Counting/Classes.lean` at lines 160–176 and 335–364 (`countableModelCount_le_aleph0_iff`, `HasPerfectlyManyCountableModels`, `.of_nat`, `.of_fin`). The library near-match leads for the new theorem are generic (`FirstOrder.Language`, `Cardinal.Categorical`). The pinned Mathlib and Tau Ceti have no Vaught statement.
- **Cross-roadmap citations.** The change adds none. Main's README (line 776) states the restriction in prose, as the description says. The overlap report lists no dropped or revision-only ids, and no other open pull request changes this roadmap.
- **Automatic checks and elaboration.** I re-ran the gate at 4d0f213: every check is 0 (OK), including the depcheck and the targeted build. Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`, with no UPWARD or CYCLE line. `lake env lean` on `Suggested.lean` gives 34 `declaration uses sorry` warnings (33 plus the new theorem) and nothing else. No file changed outside the folder.
- **Signatures.** `#check @vaughtConjecture_iff_nat` matches README line 898. The two dropped-binder leads (`IsThinOnNatModels`, `morleyBase`) have not changed and are intended, as the previous review found.
- **Description.** Read against the head. The added theorem, the three new locators, the §5.8–§5.9 citations, "35 Check bullets in 15 blocks" (recounted: 15 blocks, 35 bullets), a *Needs:* line in every section that states a target (§5.2 states none), Examples and Dependencies closing each layer, and the section comments carrying the README's layer titles all match.

Overlap check: read CountableStructureSpaces (main and open head), CountableStructureSpacesPartII, HanfNumbers, InfinitaryModelExistence (main and open head), BorelEquivalenceRelations and InfinitaryLogic; shared objects and their owners: code spaces, López–Escobar and uniform back-and-forth separation owned by CountableStructureSpaces; perfect and Cantor antichains, thinness and Silver's theorem by BorelEquivalenceRelations; fragments, fragment types and Morleyization by InfinitaryModelExistence; infinitary syntax and Scott rank by InfinitaryLogic; this roadmap's Layers 0–1, consumed by CountableStructureSpacesPartII, by this roadmap; HanfNumbers leaves counting countable models, Morley's theorem and Vaught's conjecture here, and a grep of main and the open heads finds no other Vaught reformulation, so this roadmap owns `vaughtConjecture_iff_nat`; nothing else shared.

Source independence: changed passages only. I compared 8 passages with 2 sources (Montalban-CSTpart2 lines 8997–9006, 9266–9270, 9283–9302, 9367–9396, 9426–9438; AGHKM-Scattered lines 30–35): the §2.1 and §3.3 citation clauses, the two §5.3 AGHKM clauses, the `vaughtConjecture_iff_nat` prose and docstring, the §5.8 and §5.9 openings, and the new reference entry. They share only phrases the mathematics forces ("perfect set of … non-isomorphic"). The largest share is Montalban-CSTpart2, about 28 of 48 locators. The change adds, removes and reorders no layer, so the arrangement was not compared again (independent in the previous review).

Research link: the headline targets are Morley's theorem (Morley 1970, via Silver 1980), the Baldwin–Friedman–Koerwien–Laskowski characterisation of scattered sentences (2016, Theorem 3.3), and the reformulations of the open Vaught conjecture (Vaught 1961), including the Harnik–Makkai and Steel reduction (1977, 1978). This rests on the README's references and on BFKL-RedHerrings p. 2 and Montalban-CSTpart2 p. 215.

## Not verifiable

- Morley 1970, Silver 1980, Vaught 1961, Steel 1978, Harnik–Makkai 1977, Lopez-Escobar 1965: journal and proceedings texts, not opened. Morley 1970 is cited at §3.3 without a theorem number, beside the Montalbán locator that was checked.

Automatic checks set aside as false positives: the signature listing's two dropped-binder leads (`IsThinOnNatModels` is defined for every relational language, and `morleyBase` needs no relational instance; both intended), and the citation tool's four "found nowhere" names (`ConcentratedAtBFLevels.bfScattered`, `Language.Equiv.internalScottRank_eq` and the two `RowAssembly` theorems). Those four are this file's own declarations, at `Suggested.lean` lines 187, 471, 504 and 517.

## Source issues

- **Misprint** in Montalban-CSTpart2 at Theorem XI.3, proof of (1)⇒(2), p. 207: the source says that the structure has Scott rank "at below" the ordinal; it should say the Scott rank is below the ordinal; affects nothing.

## For the human reviewers

- **Scope / licence.** The most-cited source, Montalban-CSTpart2 (about 28 of 48 locators), is an unpublished draft on its author's page (compiled 22 April 2025). The results cited from it are published: Harnik–Makkai 1977, Steel 1978, Morley 1970.
- **Licence.** The provenance section (README lines 1260–1285) maps the layers onto `cameronfreer/infinitary-logic`, which it states is Apache-2.0. `Suggested.lean`'s `IsThinOnNatModels` shares its name with a declaration the table lists there. Binder names were not compared with that repository.
