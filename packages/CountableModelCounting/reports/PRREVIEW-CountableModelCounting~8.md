# Review of CountableModelCounting (pull request #2012 at 6f3a7b4)

**Verdict:** needs changes

Incremental re-review of the 75 lines changed since `17f7816`. Paths are under `TauCetiRoadmap/CountableModelCounting/`; Tau Ceti paths, at the pin, are under `TauCeti/`. Three P3 findings remain, each the unrepaired part of a finding of the previous review; the changed passages themselves are correct.

## R01 (P3) — `MinimallyUnboundedOn` still has two Checks

**Location.** `README.md:828–831`: "**Checks.** For `MinimallyUnboundedOn`: `∅` fails: `β = 0` bounds `ρ` on it. … a nonempty set inside the isomorphism class of `c` fails: `ρ c + 1` bounds `ρ` on it."

**Claim.** Two Checks pin the definition.

**Witness.** Every definition carries at least three; both Checks are failures, so neither separates `MinimallyUnboundedOn` (`Suggested.lean:393`) from the predicate that is always false. The passage is unchanged since `17f7816`.

**Repair.** Add a third bullet after `:831`, a positive instance: "It can hold when `ρ` is not isomorphism invariant. With one unary `P`, let `K` be the isomorphism class of the code in which `P` is the even numbers (`𝔠` codes, one class), and let `ρ` take values cofinal in `ω₁` on `K`. Then `ρ` is unbounded on `K`, and for every `θ` one of `K ∩ modelsOf θ`, `K \ modelsOf θ` is empty, bounded by `β = 0`. So the equivalence with `MinimallyUncountableOn` needs an isolating rank." Tested against the second Check: an isolating rank is constant on `K`, bounded by `ρ c + 1`.

## R02 (P3) — The instance that forces the countability hypothesis is not a Check

**Location.** `README.md:431`, Layer 0 acceptance check: "… and `countableModelCount φ = 𝔠`."

**Claim.** The hypothesis added at `:382` and `:392` ("With countably many relation symbols") has its negative control.

**Witness.** Unary `P_r`, `r ∈ ℝ`, same `φ`: the codes on `Fin 1` are `ℝ → Bool`, isomorphism is equality, count `2^𝔠 > 𝔠`. No Check states it; `:453–456` uses `P_r` for level sentences only.

**Repair.** After "`countableModelCount φ = 𝔠`." at `:431` add: "With unary `P_r`, `r ∈ ℝ`, instead, the same sentence has `2^𝔠` one-element models: the upper bound `𝔠` needs countably many relation symbols." Tested: with `P_i`, `i ∈ ℕ`, the count is `𝔠`; with `P_r` it is `2^𝔠`, and `countableModelCount_le_continuum` (`Counting/Classes.lean:190`) does not apply.

## R03 (P3) — The description does not say the Layer 0 block left `Suggested.lean`

**Location.** Description, "**Scope.**": "Every target of this roadmap is kept. The definitions Tau Ceti already has … are used directly, and the theorems Tau Ceti already proves are cited from it rather than restated".

**Claim.** Every Lean declaration removed is one Tau Ceti has.

**Witness.** `Rel`, `oneElement`, `hasPerfectSetOfNonisoModelsOn_fin_one_unaryPredicates`, `modelsOf_oneElement_nat`, `countableModelCount_oneElement` are removed against main; `oneElement` and `UnaryPredicates` occur 0 times in the pinned Tau Ceti.

**Repair.** Add to **Scope**: "The Layer 0 acceptance check (the one-element sentence with countably many unary predicates) is no longer stated in `Suggested.lean`; the README keeps it."

## Previous findings

- R01 — partly repaired: `README.md:382` "With countably many relation symbols, `countableModelCount_le_continuum`"; likewise `:392`, `:514`, `:545`, `:612`, `:657`, `:758`. The negative control at `:431` is not added (R02).
- R02 — not repaired: `README.md:828–831` still lists two Checks for `MinimallyUnboundedOn`, both failures (R01).
- R03 — repaired: `README.md:529` names `countableModelCount_le_aleph0_or_hasPerfectlyMany_of_internalScottRank_le`, `:620` `ConcentratedAtBFLevels.bfScattered`, `:940–944` `Label ℕ`, `Sym ℕ Language.empty`, `lang ℕ Language.empty`, `lift`, `lift0`.
- R04 — repaired: `Suggested.lean:490`, "The assembled language is relational: it has no function symbols."
- R05 — partly repaired: the description reads "33 `sorry`s" and "33 `declaration uses sorry` warnings"; the removal of the Layer 0 block is not stated (R03).

## Verified sound

| # | Statement | Instances | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | Upper bound and `…countableModelCount_eq` (`README.md:382`, `:392`) | `P_i`, `i ∈ ℕ`; `P_r`, `r ∈ ℝ`; one element | `𝔠 ≤ 𝔠`, `= 𝔠`; `2^𝔠`, now excluded. Pin: `Counting/Classes.lean:190`, `:367`, both `[∀ n, Countable (L.Relations n)]` | prose = pin | control missing (R02) |
| 2 | Layer 0 acceptance check (`:425–434`) | `P_i`; `P_r` | codes on `Fin 1` = `ℕ → Bool`, trivial `Perm (Fin 1)`, other tiers empty: `𝔠`. Uncountable: `2^𝔠` | holds as stated | R02 |
| 3 | Layer 2 preamble (`:514–517`) | `K` in one class; `P_r` | bound `β`: isomorphism = level `β` on models; Borel graph needs the Polish code space, countable `L`. Lean `:92` has the binder | agrees | none |
| 4 | Internal form (`:529–531`) | Layer 2 acceptance check, rank `1` | height `≤ 1 + ω = ω < ω₁`; `Scott/Height.lean:169` gives `scottHeight ≤ internalScottRank + ω`; `β + ω < ω₁` for `β < ω₁` | holds | none |
| 5 | Converse, "with no countability of `L`" (`:532–534`) | `P_r`, `φ := ∃ x ∀ y, y = x`; `K` one class | no models on `ℕ`: `β = 0` bounds; one class: `ρ c + 1`. `Counting/Stratification.lean:211`: no countability instance, strict bound | holds | none |
| 6 | Layer 3 preamble (`:545`); thin sentences | `P_i` one-element sentence; equivalence relations | no models on `ℕ`: thin, perfect set at `Fin 1`; `f z`: `𝔠` classes, not thin. Lean `:131` has the binder | agrees | none |
| 7 | 4c (`:611–615`) | `modelsOf φ = ∅`; equivalence relations | `∅`: scattered T / thin T; `f z`: level `ω` has `𝔠` classes F / perfect set F. Lean `:182` has the binder | agrees | none |
| 8 | `ConcentratedAtBFLevels.bfScattered`, no countability (`:619–620`) | `∅`; countably many classes; centre `k` | level classes met: at most `1 +` countably many, since `isoSetoid ≤ bfEquivSetoid` (`RelationalConfiguration/BackAndForth.lean:127`, no countability) | holds; Lean `:195` without binder | none |
| 9 | `isThin_iff_countable_sentenceSpectra` (`:657–661`) | `C = ∅`; `C` = range of `f` | `∅`: T / T; `f`: not thin / `θ k` = "a class of `k + 2` elements" realizes every sequence, `𝔠`. Lean `:208` has the binder | agrees | none |
| 10 | Layer 5 preamble, `not_hasVaughtCount_iff` (`:758–764`) | `P_i`; `P_r` | `P_i`: count `𝔠`, F ↔ (`𝔠 = ℵ₁` ∧ `ℵ₁ < 𝔠`) F. `P_r`: `2^𝔠`, T ↔ F, excluded by the stated hypothesis; Lean `:316` | agrees | none |
| 11 | "the infinite-model reduction needs no countability" (`:759`, `:770`) | `P_r`, one-element `φ`; any `L`, `Fin 0` | `φ ⊓ infiniteSentence`: count `0`, T / quotient of `∅` countable, T; perfect antichain needs a nonempty set. Lean `:323` without binder | holds | none |
| 12 | The witness (`:938–949`) | `Language.empty`; `π_z` | `lift`, `lift0` need `Lc.Relations`, empty: symbols `row`, `own`, `lab τ` only (`Suggested.lean:479–484`). `π_z(2n) = n ≤ 2n`, `π_z(2n+1) = n + z n ≤ 2n + 1` | holds | none |
| 13 | `MinimallyUnboundedOn`, Checks (`:823–831`) | `∅`; one class; non-invariant `ρ` | `∅`: `β = 0`; one class, isolating `ρ`: `ρ c + 1`; one class, `ρ` cofinal in `ω₁`: unbounded, every cut has an empty side: holds | 2 Checks, both negative | R01 |

The rows of the previous review for untouched statements stand as in the previous review, of `17f7816`.

- **Gate.** The worker's run at `6f3a7b4`: every check passes, with the targeted build.
- **Elaboration.** `lake env lean` on `Suggested.lean`: 33 `declaration uses sorry` warnings and no other message. The diff changes no statement (one docstring added), so the one-tactic probe and the signature comparison stand as at `17f7816`.
- **Dependency check.** `depcheck: 241 roadmaps, 2252 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- **Library (6 declarations opened at the pin).** `Counting/Classes.lean:190`, `:367`; `Counting/Stratification.lean:211`; `Scott/Height.lean:169`; `RelationalConfiguration/Topology.lean:109`; `RelationalConfiguration/BackAndForth.lean:127`.
- **Citations.** The citation tool's two leads, `ConcentratedAtBFLevels.bfScattered` and `Language.Equiv.internalScottRank_eq`, are declared at `Suggested.lean:195` and `:467`. The changed passages add no cross-roadmap citation.
- **Description.** Checked against the head: the 33 count, the heading "Targets of this roadmap in Tau Ceti", Layer 4g, the conventions (`README.md:83–86`, `:108`, `:232–233`) agree; one omission (R03).
- Overlap check: read CountableStructureSpaces, CountableStructureSpacesPartII, HanfNumbers, InfinitaryModelExistence, BorelEquivalenceRelations, InfinitaryLogic, RandomGraphs; CountableStructureSpacesPartII consumes this roadmap's Layer 0 (`isoSetoidOn`, transport between presentations) and owns Borel completeness; the owners named in the previous review stand; nothing else shared.
- Source independence: changed passages only; 9 changed passages read, which add no source locator and no statement taken from a source, so none was set beside a source text (the one locator inside a changed passage, Theorem 3.3 of Baldwin et al., is unchanged and was verified at `17f7816`); largest share Montalban-CSTpart2, 20 of 40 locators; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- The description's integration run at `62530771` ("ALL COMPILED") is outside this repository and was not run.
- Whether 4f and 4h, which the changed text does not touch, need countably many relation symbols: no instance found either way; `README.md:672–682`, `:716–722` state none.
- Sources: none opened in this re-review; the items of the previous review's list stand.

## Source issues

- none

## For the human reviewers

- **Scope.** `README.md:245–294` names CountableStructureSpaces as supplier of (S1)–(S7); that roadmap is an open pull request, not on main and not in the merge order. Main's README already cites it; the dependency check reports no problem.
- **Licence.** The README's references say a Lean formalisation of most of the material exists in `cameronfreer/infinitary-logic` (stated Apache-2.0) and map its files to the layers; the pull request's author owns that repository.
- **Licence.** The source with the largest share of locators, Montalban-CSTpart2, is an unpublished draft on its author's page; the theorem it is cited for is published (Harnik–Makkai 1977).
