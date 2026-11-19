# Review of CountableModelCounting (pull request #2555 at f43ea66)

**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 29 lines changed since `4d0f213` found nothing false or unsupported. Both small corrections of the previous review are repaired, and the repairs are mathematically correct: the theorem that a scattered set carries no Cantor antichain now holds for every relational language, and the remarks on isolation in §1.2 and §6.4 now say what the witness shows. One small correction remains, on the description (it announces nine corrected statements and lists ten); there are no format notes. Two points are left for the human reviewers, as before.

## C01 — The description announces nine corrected statements and lists ten

The description says "corrects the nine statements listed below, and adds one headline theorem". The list under "Statements whose content changed" now has ten bullets: the first, on `not_hasCantorAntichainOn_of_bfScattered` (§4.1) dropping its countability hypothesis, was added with the latest change and the count was not updated. A reader who checks the list against the count will look for a bullet that is not a statement change. "corrects the ten statements listed below" would be right. Everything else in the description that bears on the change agrees with the head: the §4.1 bullet, the last bullet's account of the §1.2 warning and the §6.4 remark, "One existing headline theorem changed", "35 Check bullets in 15 blocks" (recounted: 35 in 15), and the one added and one restated Lean declaration.

## Previous findings

The previous review raised no finding; its two small corrections are accounted for here.

- C01 (previous) — repaired: §4.1 now reads "for every relational `L`, a scattered `K` carries no Cantor antichain for isomorphism, and, with countably many relation symbols, is thin"; the Lean theorem carries `[L.IsRelational]` alone.
- C02 (previous) — repaired: §6.4 now says "every isolating rank exceeds `ω` at every code of this class, not only at the code of `M`"; §1.2 says the field with `ρ d` "is the same contract, both relations being symmetric".

## Verified sound

| # | Statement | Instances tried | Values computed (one side / other side) | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | §4.1 `not_hasCantorAntichainOn_of_bfScattered`, every relational `L` (changed; sample) | uncountable `L` (unary `P_r`, `r∈ℝ`); `K = ∅`; `K` with `𝔠` level-`ω` classes (family `f z` of Layer 3) | Pairs `(f x, f y)`, `x≠y`: continuous image of an open (Polish) subset, analytic in any target. Supplier separation carries `[L.IsRelational]` only. `∅`: no map into it. `f z`: not scattered, hypothesis fails | holds without countability; elaborated type has no `Countable` instance | none |
| 2 | §4.1 added clause "with countably many relation symbols, is thin" (changed) | countable `L`; uncountable `L` | countable: code space Polish, thin ⇔ no Cantor antichain (pinned `Setoid.isThinOn_iff_not_hasCantorAntichainOn`); uncountable: clause not asserted | consistent with §4.4 line 704 and §5.7 line 1035 | none |
| 3 | §1.2 warning: `bfEquivSetoid (ρ c)` decides isomorphism with `c` only (changed; sample) | `d, e` both `ρ c`-equivalent to `c`; `d, e` not isomorphic to `c`, `ρ d > ρ c` | first: `d ≅ c ≅ e`. Second: field `isolates` (pin `Stratification.lean:85`) gives nothing at level `ρ c`; needs level `≥ ρ d` (`isolates_of_le`, `:112`) | true | none |
| 4 | §1.2 "the field with `ρ d` in place of `ρ c` is the same contract" (changed) | swap `c, d` in `∀ c d, c ≡_{ρ c} d → c ≅ d` | `d ≡_{ρ d} c → d ≅ c`; both relations symmetric, so equal to `c ≡_{ρ d} d → c ≅ d` | equivalent | none |
| 5 | §6.4 "every isolating rank exceeds `ω` at every code of this class" (changed) | code `e` in the level-`ω` class of `M`, `ρ e ≤ ω`; `e` = code of `M`; `e` = code of `N_z` | `ρ e ≤ ω` gives `e ≅` code of `M` and `e ≅` code of `N_z` by `isolates_of_le`, but `M ≇ N_z` (§6.3): contradiction, so `ρ e > ω` | true | none |
| 6 | §6.4 "meets `𝔠` isomorphism classes, a single class at every level up to `ω`" (cited by the change) | `N_z`, `z : ℕ → Bool` | `2^ℵ₀` pairwise non-isomorphic, each `BFEquiv ω` to `M`; levels `≤ ω` coarser than `ω` (`bfEquivSetoid_anti`) | true | none |

The rows for the untouched statements stand as in the previous review, of `4d0f213`.

- Source locators checked against the text: 1 (BFKL-RedHerrings lines 468–477, Theorem 3.3, p. 12, which §4.2 cites for the equivalence §4.1 feeds). The change adds or alters no locator.
- Library declarations opened at the pin: 4. `TauCeti.IsIsolatingRank` (`ModelTheory/Counting/Stratification.lean:79`, field `isolates` at `:85`), `TauCeti.IsIsolatingRank.isolates_of_le` (`:112`), `TauCeti.BFScattered` (`ModelTheory/Counting/Scattered/Basic.lean:79`), `Setoid.HasCantorAntichainOn` (`SetTheory/Descriptive/CantorScheme.lean`, use at `:101`).
- Cross-roadmap citations resolved: CountableStructureSpaces §4.4 `exists_uniform_bfSeparation`, on main (`TauCetiRoadmap/CountableStructureSpaces/Suggested.lean` line 305, `[L.IsRelational]` and an analytic set of pairs, no countability) and at the head of its open revision, where the statement is the same.
- Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file changed outside the folder.
- Automatic checks rerun at this head: all pass.
- Elaboration: `lake env lean` on `Suggested.lean` gives 34 `declaration uses sorry` warnings and nothing else. `#check @not_hasCantorAntichainOn_of_bfScattered`: `∀ {L} [L.IsRelational] {K}, BFScattered K → ¬(isoSetoid L ℕ).HasCantorAntichainOn K`, as §4.1 states. One-tactic probe on a copy (`rfl`, `simp` with `BFScattered` unfolded, `infer_instance`, `exact?`): does not close.
- Headlines: unchanged in number; the restated one remains stated, at the README's generality. The module docstring's list of what is not statable is unaffected.
- Description read against the head and the change against the base: one miscount (C01); nothing else contradicted or left unstated.

Overlap check: read CountableStructureSpaces (main and its open revision), CountableStructureSpacesPartII (open), InfinitaryModelExistence, BorelEquivalenceRelations, InfinitaryLogic and HanfNumbers, as in the previous review; the change moves no object between owners: uniform separation stays with CountableStructureSpaces §4.4, antichains and thinness with BorelEquivalenceRelations, isolating ranks and scatteredness with Tau Ceti; nothing else shared.

Source independence: changed passages only; 3 passages (the §1.2 warning, the §4.1 statement, the §6.4 remark) compared with 2 sources (BFKL-RedHerrings lines 466–485; Montalban-CSTpart2 §XII.1), none shared; largest share Montalban-CSTpart2, about 18 of 33 locators, unchanged; no layer added, removed or reordered, so the contents comparison stands: independent.

Research link: the headline targets are Morley's theorem (Morley 1970, via Silver 1980), the Baldwin–Friedman–Koerwien–Laskowski characterisation of scattered sentences (2016, Theorem 3.3), and reformulations of the open Vaught conjecture (Vaught 1961), with the Harnik–Makkai and Steel reduction (1977, 1978); README references, BFKL-RedHerrings p. 12, Montalban-CSTpart2 pp. 215–220.

## Not verifiable

- Nothing in the changed passages. The items of the previous review stand: the journal texts of Morley 1970, Silver 1980, Vaught 1961, Steel 1978, Harnik–Makkai 1977 and Lopez-Escobar 1965 and the cited books were not opened, and none carries a theorem-level locator in the README.
- Uniform back-and-forth separation for an uncountable relational language is a supplier target with `sorry`; it was checked as stated by its owner and by reading the standard boundedness argument, not against a source text.

Automatic checks set aside as false positives: the two declarations reported as having lost a section hypothesis (`IsThinOnNatModels` is defined for every relational language and `morleyBase` needs no relational instance; both intended), and the four names reported as found in no library, which are this roadmap's own declarations in `Suggested.lean`.

## Source issues

- none (none new in this round; the five recorded by the previous review stand)

## For the human reviewers

- **Scope / licence.** The most-cited source, Montalban-CSTpart2 (about 18 of 33 locators), is an unpublished draft on its author's page (compiled 22 April 2025). The results cited from it are published: Morley 1970, Harnik–Makkai 1977, Steel 1978.
- **Licence.** The README's provenance section maps the layers onto `cameronfreer/infinitary-logic`, which it states is Apache-2.0; `IsThinOnNatModels` shares its name with a declaration listed there. Statements and binder names were not compared with that repository.
