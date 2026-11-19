# Review of CountableModelCounting (pull request #2555 at df41e71)

**Verdict:** needs changes

**Summary.** One finding. The new summary lists the equivalence of Vaught's conjecture with its restriction to countably infinite models as a headline, but `Suggested.lean` does not state it, although it can be stated with the file's own definitions. No statement was found false. All nine statements whose content this revision changes were recomputed and are correct, all 208 library names the README cites by namespace resolve at the pins, and the sampled locators in Baldwin–Friedman–Koerwien–Laskowski and Montalbán support the text. There are two small corrections (missing locators at the Morley and CH/¬CH claims, and three sentences of the description) and one format note. Two points go to the human reviewers: the draft status of the most-cited source, and the licence of the external formalisation named in the provenance section.

## R01 (P2) — The summary presents "Vaught's conjecture is equivalent to its restriction to countably infinite models" as a headline, but `Suggested.lean` does not state it

The acceptance test does not test this equivalence. An implementer who discharges every statement in `Suggested.lean` has not proved it, although the summary (README lines 25–26) lists it alongside the other reformulations: "It is equivalent to its restriction to countably infinite models, to "every sentence with scattered countably infinite models has countably many of them", and, by the Harnik–Makkai argument, to …". The other four equivalences in that bullet are stated: lines 288 and 294 (the CH and ℵ₁ < 𝔠 forms), line 322 (the scattered form) and line 445 (minimally uncountable sentences). For the restriction to ℕ, the file states only the per-sentence reduction `hasVaughtDichotomy_and_infiniteSentence_iff` (line 315) and the finite tiers (line 72). The conjecture-level equivalence, which §5.3 asserts at README lines 893–895, appears nowhere. It can be stated at the pins with the file's own definitions: the statement below elaborates there with only the `sorry` warning.

The smallest change is to add, in the Layer 5 section,

```lean
theorem vaughtConjecture_iff_nat :
    VaughtConjecture ↔
      ∀ (L : FirstOrder.Language.{0, 0}) [L.IsRelational] [Countable (Σ l, L.Relations l)]
        (φ : L.Sentenceω),
          Countable (Quotient (isoSetoidOn ℕ φ)) ∨ HasPerfectSetOfNonisoModelsOn ℕ φ := by
  sorry
```

and to name it in §5.3, where the README already states the equivalence. Alternatively, if the author does not count this equivalence as a headline, the clause could leave the summary and stay in §5.3 as prose.

## C01 — Morley's theorem (§3.3) and the CH/¬CH reformulations (§5.3) carry no source locator at the claim

A reader cannot check these headline claims against a source from the text. §3.3 (lines 515–527) and the third to fifth bullets of §5.3 (lines 882–888) cite nothing, and the reference list gives Morley 1970 without a theorem number. Two legal texts the README already lists support the claims at exact places. Montalbán, Part 2, §XII.1, p. 216 proves Morley's theorem from Silver's theorem, level by level (Montalban-CSTpart2 lines 9286–9302). Andrews, Goldbring, Hachtman, Keisler and Marker, §1, p. 1 state that the cardinal form is trivial under CH and equivalent to the absolute form when CH fails (AGHKM-Scattered lines 32–35). Putting these locators at the two claims would fix it. The bounded-rank dichotomy (§2.1, lines 416–421) likewise has no locator. The only one I could verify, Montalbán p. 216 (lines 9303–9307), covers only scattered sentences.

## C02 — Three sentences of the description do not match the head

- "This update changes the form of the README only" is contradicted by the description's own list of nine statements whose content changed. Would read: "This update reorganises the README into the current shape and corrects the nine statements listed below."
- "The API of the new definition `HasPerfectSetOfNonisoModelsOn` is spelled out": the definition is not new, since main's `Suggested.lean` already declares it and the change adds no declaration. Would read: "The API of `HasPerfectSetOfNonisoModelsOn` is spelled out."
- "Each section has *Needs:* lines": §5.2, which only states the conjectures, has none. The renumbering sentence could also say that the old 4a and 4b merge into §4.1.

## N01 — §5.8 and §5.9 open with "Following Montalbán, Part 2, Ch. XII §2 (…)"

A roadmap does not say it follows a source. Each section's argument is its own: saturation by uniform separation, and a limit model with offset ω. Would read "(cf. Montalbán, Part 2, Lemmas XII.5–XII.6)" at line 1043 and "(cf. Montalbán, Part 2, Theorem XII.7)" at line 1068.

## Verified sound

| # | Statement | Instances tried | Values computed (one side / other side) | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | §0.1 `HasPerfectSetOfNonisoModelsOn` (`Suggested.lean:66`), three Checks | `∃x∀y y=x` with `P_i` at `Fin 1`; `⊤` empty language at `ℕ`; `⊤` at `Fin 0` | `Fin 1`: codes `ℕ→Bool`, iso = equality, whole space perfect: holds. `ℕ`: one code: fails. `Fin 0`: `ℕ→Bool` with ℵ₀ nullary symbols holds; one code with none fails | Checks true | none |
| 2 | §0.1 bound `𝔠 ≤ #classes`; Layer 0 Examples | `P_i` (`i∈ℕ`) and `P_r` (`r∈ℝ`) at `Fin 1` | `P_i`: count `𝔠` (`countableModelCount_eq` needs `∀ n, Countable`). `P_r`: `#(ℝ→Bool) = 2^𝔠 > 𝔠`, a compact perfect set still gives `≥ 𝔠` | holds | none |
| 3 | §0.2 finite tiers (`:72`) | `P_i` example; `Fin 0` with ℵ₀ nullary symbols | `n≠1`: 0 classes (countable); `n=1`: `2^ℵ₀` classes, perfect. `Fin 0`: `2^ℵ₀` classes, perfect. `measurableSet_setOf_isoSetoid` needs `[Finite V]` | both alternatives realised | none |
| 4 | §0.3 `φ ⊓ L.infiniteSentence` | `⊤` in empty language | `count ⊤ = 1 + Σ_n 1 = ℵ₀`; `count (⊤ ⊓ inf) = 1 + Σ_n 0 = 1` (`countableModelCount_eq_add_sum`) | holds | none |
| 5 | §1.1 Check: level classes not sentence cuts | `P_r`, `r∈ℝ`; `c₀` all empty | level-1 class of `c₀` is `{c₀}`; a sentence misses some `P_s`, so it cannot separate `c₀` from `P_s` true at 0 | holds | none |
| 6 | §1.2 `IsIsolatingRank` (`Stratification.lean:79`), Scott height | fields; `isIsolatingRank_scottHeight` | fields: `iso_invariant`, `lt_omega_one`, `isolates` = README's three; instance takes no countability; `StabilizesCompletely` quantifies over countable `N : Type` (`Height.lean:78`) | matches | none |
| 7 | §1.4 Check at a limit | one binary `E`, class of size `k+2` for `k∈S` | finite language: finitely many classes at each finite level; depth-`(k+3)` sentence separates `S ≠ S'`: `2^ℵ₀` classes at level `ω` | holds | none |
| 8 | §2.1 bounded-rank dichotomy (`:89`, `:98`) | `P_i` one-element; `E` with infinite classes | `P_i`: ℕ-tier empty, `β=0` bounds, count `𝔠`, perfect only at `Fin 1`. `E`: count `ℵ₀`, first alternative | both forms hold | C01 |
| 9 | §2.2 internal-rank form (`:109`) | `E` with all classes infinite | SR = 1 for every model (homogeneity; Tau Ceti `Setoid.internalScottRank_fromRel_eq_one`); SH ≤ 1 + ω < ω₁; count `ℵ₀` | holds | none |
| 10 | §3.3 Morley witnessed and cardinal (`:141`, `:146`) | all equivalence relations; `P_i`; Ehrenfeucht | `f z` continuous injective, class sizes `{k+2 : z k}`: perfect, count `𝔠`. `P_i`: perfect at `Fin 1` only. Ehrenfeucht: count 3 ≤ ℵ₁ | holds | C01 |
| 11 | §3.4 `IsThinOnNatModels` (`:135`) | `P_i`; `E`; `E` infinite classes | ℕ-models `∅`: thin. `f`-range perfect: not thin. `ℵ₀ < 𝔠` classes: thin (perfect set would give `𝔠`) | Checks true | none |
| 12 | §4.1 `not_hasCantorAntichainOn_of_bfScattered` (`:166`) | all equivalence relations | level `ω` meets `𝔠` classes (depth `k+3` sentences), so not scattered, consistent with the antichain `f` | consistent | none |
| 13 | §4.2 thin ↔ scattered (`:174`); BFKL Thm 3.3 | `P_i`; `E` | `P_i`: both sides true (no ℕ-models). `E`: both false. BFKL-RedHerrings lines 468–470, p. 12: (a)⇔(b) as stated | holds; locator correct | none |
| 14 | §4.4 relative López–Escobar, added countability | `P_r`; `f x` = code with `P_x` at 0; `U = [0,∞)` | `f` measurable (coordinate preimages are singletons); values pairwise non-isomorphic; any sentence omits some `x<0` and `y≥0`, so the two take equal truth values | hypothesis needed | none |
| 15 | §4.4 `isThin_iff_countable_sentenceSpectra` (`:200`) | `C = ∅`; all `E`-codes | `∅`: thin, spectra empty. `E`: `θ_k` = "a class of size `k+2`": `2^ℵ₀` sequences; not thin | both sides agree | none |
| 16 | §4.7 tail lemma, added hypotheses | `P_r` codes, any `r` | each `θ` constant off countably many `x`: hypothesis holds with `b=0` for every `r`, conclusion fails for unbounded `r` | hypotheses needed | none |
| 17 | §5.1 Check 3 | `P_r`, `∃x∀y y=x` | perfect set at `Fin 1`: dichotomy true; count `2^𝔠 ∉ {≤ℵ₀, 𝔠}`: cardinal form false | holds | none |
| 18 | §5.3 `not_hasVaughtDichotomy_iff`, `not_hasVaughtCount_iff` (`:300`, `:308`) | `ℵ₀ < count`, no perfect set | Morley gives `count ≤ ℵ₁`, so `count = ℵ₁` (`aleph_one_le_iff`); `count = ℵ₁ ≠ 𝔠` with `ℵ₁ ≤ 𝔠` gives `ℵ₁ < 𝔠` | holds | none |
| 19 | §5.3 CH, ℵ₁ < 𝔠 (`:288`, `:294`) | `count = 𝔠` | CH: `≤ ℵ₁ = 𝔠`; `ℵ₁ < 𝔠`: `count = 𝔠 > ℵ₁` forces the perfect alternative | holds | C01 |
| 20 | §5.3 infinite-model reduction (`:315`) and conjecture-level form | `φ` with perfect finite tier | per sentence: finite tiers of `φ ⊓ inf` empty, so PM ↔ perfect at ℕ. Conjecture form: needs §0.2; absent from the file, elaborates at the pins | true; Lean absent | R01 |
| 21 | §5.4 scattered and rank forms (`:322`, `:331`, `:340`) | thin `φ` | thin ⇒ scattered ⇒ (countable ↔ `ρ` bounded) (`countable_isoClasses_iff_bounded`); not thin ⇒ perfect at ℕ | holds | none |
| 22 | §5.6 universes (`:351`) | `L : Language.{u,v}` | `exists_language_zero_countableModelCount`: lift of count equal, PM ↔; `smallPresentationEquiv` also needs countable functions, empty for relational `L` | holds | none |
| 23 | §5.7 `MinimallyUncountableOn`, `MinimallyUnboundedOn` (`:378`, `:385`) | `∅`; `E`; well-orders; `P` = evens with cofinal `ρ` | `∅`: both fail. `E`: "class of size 2" leaves `𝔠`/`𝔠`. Well-orders: `ℵ₁`/`ℵ₁`. `P` = evens: MinUnbdd true, MU false | Checks true | none |
| 24 | §5.7 iff with isolating `ρ` (`:405`); Montalbán Def XII.4 | Check-3 `ρ`; isolating `ρ` | non-isolating: LHS false, RHS true; isolating: invariant, constant on classes. Def XII.4 p. 218 (line 9359) matches | `hρ` needed | none |
| 25 | §5.7 generic engine | smallness: countable classes; `ρ` bounded | countable union of small is small (sup of ℵ₀ many `β_i < ω₁`), so some class is not small and its complement is small | holds | none |
| 26 | §5.8 saturation (`:425`); Lemmas XII.5–XII.6 | `θ` arbitrary | `modelsOf θ ×ˢ (modelsOf θ)ᶜ` analytic, no iso pair, so CSS §4.4 gives `β₀`, `mono` for `β ≥ β₀`. XII.6 hypothesis `≡_{α_i+3}` (line 9378), p. 218 | holds; locators correct | N01 |
| 27 | §5.9 reduction (`:436`); Theorem XII.7 | `X,Y` first differ at `i` | `A_X ~ A_{X↾(i+2)} ~ A_{X↾(i+1)} ≁ A_{Y↾(i+1)}` at `α_{i+1}`; limit needs `α_i+ω ≤ α_{i+1}`: given. XII.7 pp. 219–220; attribution p. 218 | holds; locators correct | N01 |
| 28 | §5.9 `vaughtConjecture_iff_forall_not_minimallyUncountableOn` (`:445`) | `¬VD φ` | finite tiers countable (§0.2), so the ℕ-tier is uncountable and thin, hence scattered; the reduction gives an MU `φ ⊓ θ` | holds | none |
| 29 | §6.1 `Language.Equiv.internalScottRank_eq` (`:459`) | — | not at the pin (`Scott/Rank.lean` has no invariance); `orbitRank` is defined within `M` (lines 52, 87), carried by `Equiv.bfEquiv` | target needed | none |
| 30 | §6.2 `RowAssembly` defs (`:467`–`:484`) | `lang ℕ Language.empty` | functions `PEmpty` → `IsRelational` instance; `lift` only at arity ≥ 1, `lift0` per label; empty `Lc` adds none | well-formed | none |
| 31 | §6.3 witness (`:492`) | rows `[0..k]`, `[0..k,k]`; `π_z` | fibers `ℕ` vs `Fin(k+1)` at `[0..k,k]`, `ℕ ≡_k Fin(k+1)`; orbit rank `> k`. `π_z(2n+1)=n+z n` injective; shift from `2m`: `Fin(≥m+1) ≡_m ℕ` | holds | none |
| 32 | §6.4 `not_isIsolatingRank_internalScottRank` (`:505`) | codes of `M`, `N_z` | rank `ω` at `c_M`; `c_M ~_ω c_{N_z}`, not isomorphic, so `isolates` fails | holds | none |
| 33 | Worked example: Ehrenfeucht | DLO, `c_n` increasing | cofinal; bounded with supremum; bounded without: 3 models; `P_0` excludes the empty structure | count 3 | none |

- **Source locators checked against the text (15).** BFKL-RedHerrings: Theorem 3.3 (a)⇔(b) p. 12 (lines 468–470), Lemma 3.4 p. 13 (491–492), Morley's definition p. 2 (49–51). Montalban-CSTpart2 (draft of 22 April 2025): Morley's proof §XII.1 p. 216, Definition XII.1 p. 216, Definition XII.4 p. 218, the Harnik–Makkai attribution p. 218, Lemma XII.5 p. 218, Lemma XII.6 pp. 218–219, Theorem XII.7 pp. 219–220, Lemma XII.8 p. 220 with the proof on p. 221. AGHKM-Scattered: §1 forms p. 1, Fact 2.2 p. 3, Corollary 2.3 p. 4.
- **Library at the pins.** All 208 dotted Mathlib and Tau Ceti names the README cites resolve under `#check` (66 Tau Ceti modules plus Mathlib, 0 errors). Definitions opened: `Counting/Stratification.lean:79`, `SetTheory/Descriptive/Antichain.lean:107–117`, `Scott/Rank.lean:52–163`, `BackAndForth/Equivalence.lean:49`, `Scott/Height.lean:78`, `BackAndForth/ExtensionSpectrum.lean:183`, `Data/Setoid/Isolation.lean:65`, `Scott/EquivalenceRelation.lean:245`. The four supplier targets (`isomorphismInvariant_modelsOf`, `exists_uniform_bfSeparation`, `exists_sentence_separating`, `fragmentType`/`Fragment.slice`) are absent at the pin, as the README says. `TauCeti.VaughtConjecture` and `Counting/Vaught.lean` are not at the pin (2fd255d, 4 Nov).
- **Cross-roadmap citations resolved (18).** On main: CountableStructureSpaces Layer 2, §1.2 (saturation for every language), §4.1, §4.2, §4.4 (`exists_uniform_bfSeparation`), Layer 5, §6.1 (`exists_sentence_separating`, for every relational `L`); InfinitaryModelExistence §0.1, §0.3, §1.1, §1.2, §4.1 (`fragmentType`, `Fragment.slice`), Layer 5, Layer 6; BorelEquivalenceRelations §0.5, §4.2, §4.3; Completed/InfinitaryLogic. The open revision of CountableStructureSpaces keeps every cited id.
- **Automatic checks and elaboration.** Every gate check is 0 (OK) at df41e71, including the targeted build; I re-ran the gate myself. The dependency check reports `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`, with no UPWARD or CYCLE line. `lake env lean` on `Suggested.lean` gives 33 `declaration uses sorry` warnings and nothing else. No file changed outside the folder.
- **Signatures and the one-tactic probe.** I compared the 51 elaborated signatures with the README statements. The two dropped-binder leads are intended: `IsThinOnNatModels` is defined for every relational `L` (§3.4), and `morleyBase` needs no relational instance. Replacing each `sorry` with `first | rfl | (simp; done) | infer_instance | (intro h; simp_all; done)` closed none of the 33 statements.
- **Previous findings.** The previous review (at b79bc76, under the earlier pull request) raised no finding. The two README repairs it recorded are present at this head: the `P_r` control at lines 253–256 and the positive `MinimallyUnboundedOn` Check at 1003–1009.
- **Description.** Read against the diff: the renumbering (4a–4h become §4.1–§4.7, with 4a and 4b merged; Layer 5 becomes §5.1–§5.9), the nine content changes (each recomputed; rows 14, 16 and 17), no Lean declaration added or removed, and the `Suggested.lean` docstring changes all match. Exceptions are under C02.
- **Overlap check.** I read CountableStructureSpacesPartII (open head), HanfNumbers, RandomGraphs, InfinitaryModelExistence, BorelEquivalenceRelations, CountableStructureSpaces (main and its open revision) and InfinitaryLogic. CountableStructureSpacesPartII consumes this roadmap's Layers 0–1, whose owner is this roadmap (implemented in Tau Ceti), and owns its own `classIso K`. No other roadmap declares or owns this roadmap's objects, and nothing else is shared.

Source independence: 11 passages compared with 3 sources (BFKL-RedHerrings, Montalban-CSTpart2, AGHKM-Scattered); they share only bibliographic titles and one 11-word phrase that the mathematics forces ("the number of countable models of φ is the number of" its isomorphism classes, Montalban-CSTpart2 line 9258). Largest share: Montalban-CSTpart2, 26 of 44 locators. Contents compared with Montalban-CSTpart2 (Chapters I–XII): Layers 0–6 map onto none of its chapters. §5.8–§5.9 take its §XII.2 order (Lemmas XII.5, XII.6, Theorem XII.7) because the §5.9 *Needs:* line requires the level sentences and the limit model first, and §5.8 adds a saturation step of its own. Independent.

Research link: the headline targets are Morley's theorem (Morley 1970, via Silver 1980), the Baldwin–Friedman–Koerwien–Laskowski characterisation of scattered sentences (2016, Theorem 3.3), and the reformulations of the open Vaught conjecture (Vaught 1961), including the Harnik–Makkai and Steel reduction (1977, 1978). This rests on the README's references and on BFKL-RedHerrings p. 2 and Montalban-CSTpart2 p. 215.

## Not verifiable

- Morley 1970, Silver 1980, Vaught 1961, Steel 1978, Harnik–Makkai 1977, Lopez-Escobar 1965: journal and proceedings texts, not opened. The README cites them without locators.
- Marker, *Lectures on Infinitary Model Theory* (CUP 2016), pp. 29–38 and 83–96; Becker–Kechris pp. 82–97; Gao 2009; Kechris §31: publishers' books, not opened.
- The description's count of 27 Check bullets in the old README: main mixes Checks with "Acceptance check" paragraphs, so I did not recount it.

Automatic checks set aside as false positives: the signature listing's two dropped-binder leads (both intended, see above); its elaboration errors at line 538 and its unnamed declaration at line 287 (artefacts of its probe file, since the file itself elaborates cleanly); and the citation tool's four "found nowhere" names (`ConcentratedAtBFLevels.bfScattered`, `Language.Equiv.internalScottRank_eq` and the two `RowAssembly` theorems), which are this file's own declarations under its namespace.

## Source issues

- **Gap** in Montalban-CSTpart2 at Theorem XII.7, proof, p. 220: the source says the limit models satisfy equivalence at levels α_i − 3, which is undefined when α_i is a limit, and its choice of α_{i+1} does not ensure α_{i+1} ≥ α_i + 3. It should choose α_{i+1} ≥ α_i + 3 and apply Lemma XII.6 at the levels α_{i−1}. Affects the proof.
- **Gap** in Montalban-CSTpart2 at Lemma XII.8, pp. 220–221: the source says only that Θ is minimally unbounded, but its proof uses that the models of Θ have countably many ≡β-classes. It should assume Θ scattered (a minimally unbounded counterexample). Affects the proof.

## For the human reviewers

- **Scope / licence.** The most-cited source, Montalban-CSTpart2 (26 of 44 locators), is an unpublished draft on its author's page (compiled 22 April 2025). The results cited from it are published: Harnik–Makkai 1977, Steel 1978, Morley 1970.
- **Licence.** The provenance section (README lines 1249–1274) maps the layers onto `cameronfreer/infinitary-logic`, which it states is Apache-2.0. `Suggested.lean`'s `IsThinOnNatModels` shares its name with a declaration the table lists there (line 1261). I did not compare binder names with that repository.
