# Review of GrothendieckInfinityGroupoids (pull request #1060 at a9a3ef1)

**Verdict:** needs changes

## R01 (P3) — The description's ownership paragraph names suppliers the README does not use

**Location:** pull-request description, ownership paragraph: "Homotopy groups and weak homotopy equivalences of spaces come from AlgebraicTopology and Tau Ceti; … model-category infrastructure stays with GeneralizedCohomology G2 and BordismFormalGroups F6.5 … The README has a table with owner, declaration and consumer for each shared export."

**Claim:** The head contradicts all three. Weak homotopy equivalences come from StableHomotopyKTheory §2.1, the only roadmap supplier, which the prose never names. Homotopy groups come from Mathlib and Tau Ceti. Model structures are left to Mathlib and GeneralizedCohomology G2 only. No owner/declaration/consumer table exists.

**Witness:** `TauCetiRoadmap/GrothendieckInfinityGroupoids/README.md:144–148` (From StableHomotopyKTheory: §2.1 `IsWeakHomotopyEquivalence`); `:53–54` (Mathlib `HomotopicalAlgebra.ModelCategory`; GeneralizedCohomology, G2); "BordismFormalGroups": 0 hits; `:593`, the only table: `Consumer | Interface`, one row.

**Repair:** Replace the sentences from "Homotopy groups" to "each shared export." with: "Homotopy groups of spaces are Mathlib's (`ZerothHomotopy`, `HomotopyGroup`), with Tau Ceti's `HomotopyGroup.map`; weak homotopy equivalences are StableHomotopyKTheory §2.1's `IsWeakHomotopyEquivalence`, the one roadmap this roadmap consumes; localization is Mathlib's `MorphismProperty.Localization`; model structures stay with Mathlib's `HomotopicalAlgebra.ModelCategory` and GeneralizedCohomology G2 and are not consumed. The README's table of downstream consumers records the one export, `Globe`, which HomotopyTheoryOfCategories Layer 8.6 consumes."

## R02 (P3) — The description misstates what `Suggested.lean` contains

**Location:** pull-request description: "`Suggested.lean` prototypes Layers 0–3, 5 and 7.1 (… `Π_∞` as a presheaf, and the localized functor); definitions have real bodies, theorems are `sorry`. I checked it against Mathlib with the Tau Ceti import stubbed out"

**Claim:** The file also covers Layer 4 and declares no localized functor. Seven of its ten theorems are proved. The paragraph names none of the three headline theorems the file states, and none of the results the docstring says are not stated. The file builds with the real Tau Ceti import at the pin.

**Witness:** `Suggested.lean:394–467` (`/-! ## Layer 4`, `isWeakEquivalence_iff`); "Localization" in `Suggested.lean`: 0 hits; `sorry` only at 278, 461, 496; proofs at 153, 166, 181, 187, 204, 306, 315; docstring 30–34.

**Repair:** Replace the paragraph with: "`Suggested.lean` states three headline theorems, each with `sorry`: globular sums exist in a category with pushouts (`GlobularSums.nonempty_of_hasPushouts`, Ara 2013, Examples 1.5.1); Theorem 4.18 (1) ⇔ (2) (`PseudoCoherator.isWeakEquivalence_iff`); and Corollaries 8.9–8.11 in `TopCat` (`piPresheaf_isWeakEquivalence_iff`). The definitions these theorems need (Layers 0–5 and the class `W_C` of 7.1) have real bodies, and the seven lemmas those definitions use (the hemisphere inclusions, `ofTable_globe`, `parallel_refl`) are proved. Theorem 8.7 and Proposition 5.5 with Corollary 8.8 are not stated, since they need the group and groupoid structures built from Layer 3.2's operations. The functor `Hot ⥤ Ho(∞-Gpd_C)`, coherators and cellular ∞-groupoids are README targets only. The file builds at this repository's pins of Mathlib and Tau Ceti."

## R03 (P3) — The homotopy hypothesis is not confined to the research-motivation paragraph

**Location:** pull-request description: "The homotopy hypothesis (Ara 2013, Conjecture 8.14) is not a target: it appears only as a short research-motivation paragraph. A « Research context » section records … what the September 24, 2026 preprint … claims"

**Claim:** The Research context section also covers the homotopy hypothesis through Henry's work, and it records strict and semi-strict models. The description mentions neither, and its "only" is false.

**Witness:** `README.md:603–612` (Henry 2016, Corollary 5.3.13; Theorem 5.1.2 for cylinder coherators; Henry–Lanari 2023); `:615–632` (Simpson 1998, Henry 2018, Blanc–Paoli 2014); `:634–643` (the preprint).

**Repair:** Replace the text up to "claims" with: "The homotopy hypothesis (Ara 2013, Conjecture 8.14) is not a target, and no item states it or depends on it. A « Research context » section, which has no targets, records work on it: Henry's reduction to the elementary expansion conjecture and his proof for cylinder coherators (Henry 2016), Grothendieck 3-groupoids (Henry–Lanari 2023), strict and semi-strict models (Simpson 1998; Henry 2018; Blanc–Paoli 2014), and, at the pinned openai/math commit `7ef5c0cc5ca4b0e072b7a050fca09ab24bc6fa3a`, what the September 24, 2026 preprint « The Grothendieck homotopy hypothesis via elementary expansions » claims". Keep the rest of the sentence as it is.

## R04 (P3) — The README asks for no agreement and no Zulip discussion

**Location:** pull-request description, sources paragraph: "the README cites it as a source and asks for the authors' agreement and a Zulip discussion before any porting."

**Claim:** The README asks for neither. It says the development's Apache 2.0 licence permits adaptation with attribution and the licence notice, and that the development is a cited source, not the roadmap's specification.

**Witness:** `README.md:673–675`; "Zulip" and "agreement" in `README.md`: 0 hits each.

**Repair:** Replace the clause with: "the README cites it as a source, not as the roadmap's specification, and notes that its Apache 2.0 licence permits adaptation with attribution and the licence notice."

## Previous findings

- R01 (the item the review of 9c5e3aa carried) — repaired: `Suggested.lean:1–4` and `37` keep `module`, `public import Mathlib`, `public import TauCeti.Topology.Homotopy.HomotopyGroup.Map`, `@[expose] public section`; unchanged at this head, and it elaborates. That review raised no finding of its own.

## Verified sound

The folder has no change between 9c5e3aa and a9a3ef1. The head merges main into the branch. `git diff --stat origin/main...HEAD` outside the folder is empty, so the outside files in the change list are main's.

| Statement | Instances | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `piPresheaf_isWeakEquivalence_iff` (description "corollaries 8.9–8.11"; R02) | `{0, 1} → [0, 1]`; `[0, 1] → *` | first: `π₀` map 2 → 1, `weTop` false; 0-cells not `CellJoined` in `{0, 1}`, `Π` side false. second: both true | iff holds on both; matches ara2013 lines 2708–2724 | none |
| `PseudoCoherator.isWeakEquivalence_iff` (Theorem 4.18; Layer 4, R02) | constant `Bool` presheaf → terminal; `𝟙` of terminal | first: LHS `π₀` 2 → 1 not injective, false; RHS has the same conjunct, false. second: both true | ⇐ by `u := 1^n_x`; ⇒ is 4.18 (ara2013 line 1645) | none |
| `weTop` vs StableHomotopyKTheory §2.1 `IsWeakHomotopyEquivalence` (R01) | bodies; `∅ → *`; `𝟙_X` | bodies identical up to `f.hom` (main `StableHomotopyKTheory/Suggested.lean:74–79`, ours 474–478); `∅ → *` false both; `𝟙` true both | supplier is StableHomotopyKTheory §2.1 | none |
| `PseudoCoherator.weakEquivalences` (7.1; "localized functor", R02) | `𝟙_X`, any presheaf `X` | 1-cell `X.map (identityMap 0).op x` has source and target `x` by `isLifting_idLift`; `𝟙 ∈ W_C` true | a class only; 0 `Localization` declarations | none |
| `GlobularSums.nonempty_of_hasPushouts` (R02) | `K = Type`, coglobular object constant at a point; table `(n)` | every sum a point, comparison map unique; `(n)`: sum `D_n`, `incl = eqToHom`, `u = φ 0` unique | holds; needs iterated pushouts, not one tactic | none |
| Ara Theorem 8.7 (description; README 5.3, not in Lean) | `X = S¹`, `n = 1`; `X = *` | `π_1(Π_∞ S¹, x) = ℤ` (loops `D¹ → S¹` rel ends), `π_1(S¹) = ℤ`; point: singleton and trivial on both sides | agrees with ara2013 lines 2692–2699 | none |
| Ara Proposition 5.5, Corollary 8.8 (description; README 7.2) | `R ≠ R'` globular into `TopCat`; `X = S¹` | `ϖ_1` of both equals `ϖ_1(y_TopCat S¹)` (ara2013 line 1745); `π_1 = ℤ` for both | independent of `R` and of the coherator (lines 2706–2707) | none |
| Conjecture 8.14 "not a target" (description; R03) | README and Lean searched for `8.14` | 1 hit, `README.md:17`, motivation; 0 `*Needs:*` lines, 0 Lean declarations | not a target, as the description says | none |

The rows of the review of 9c5e3aa for the statements this head leaves untouched stand as in that review.

- Description: the title equals the README's H1; every sentence of the prose was read against the head; the contradicted ones are R01–R04. The rest agree: Ara 8.7, 8.9–8.11, 8.13, 5.5, 8.8 and 8.14; HomotopyTheoryOfCategories 8.6 and Layers 7–8; `OAI.Grothendieck.elementary_expansion` (`README.md:645–646`).
- Source locators: 11 read in ara2013 (arXiv:1206.2941v2, fetched through the sources service without a manifest): 4.10 line 1375, 4.18 line 1645, 5.5 line 1745, 5.6 line 1759, 8.7 line 2692, 8.8 line 2706, 8.9 line 2708, 8.10 line 2717, 8.11 line 2721, 8.13 line 2727, 8.14 line 2733.
- Cross-roadmap citations resolved: StableHomotopyKTheory §2.1 on main (`README.md:534`, `Suggested.lean:74`); HomotopyTheoryOfCategories at the head of #1521 (Layer 7 at `README.md:901`, Layer 8 at 1007, 8.6 at 1101–1105, ownership row 64); GeneralizedCohomology G2 on main (`README.md:211`).
- Gate: the worker's gate at a9a3ef1 passes every check, including the build. My plain rerun passes every scanner; its only failing line is `depcheck: NOT IN ORDER: GrothendieckInfinityGroupoids (insert it after its last supplier)`, the not-yet-placed case the brief exempts. The candidate-order check prints `depcheck: 245 roadmaps, 2207 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0, with only `declaration uses sorry` at 276, 456 and 493.
- Overlap check: read HomotopyTheoryOfCategories (#1521 head), the only roadmap on the three lists. Shared: `Globe` and globular sets, owned here (0.1) and cited by HomotopyTheoryOfCategories (`README.md:64`, 8.6). Direct, inverse and Reedy categories are owned by HomotopyTheoryOfCategories Layers 7–8 and deferred here (`README.md:53`).
- Source independence: changed passages only. The folder has none, so no README passage was compared, and no layer was added, removed or reordered. Largest share: ara2013, 70 of about 107 author–year citations; the description's Ara locators were read at their places.
- Remark on untouched text (no change asked): AlgebraicTopology on main also plans `ContinuousMap.IsWeakHomotopyEquivalence` (`TauCetiRoadmap/AlgebraicTopology/README.md:463`); this README consumes StableHomotopyKTheory §2.1's predicate instead, which earlier reviews passed.

## Not verifiable

- The published numbering of Ara 2013 (J. Pure Appl. Algebra 217, no. 7) was not compared with arXiv v2, which was read. The description's locators are v2's and agree with the README's.
- github.com/openai/math (the preprint, `lean/docs/312.md`, `lean/OAI/CategoryTheory/Globular/`) was not fetched this round. The description's account of it was checked against the README only.

## Source issues

- **Misprint** in ara2013 at the proof of Proposition 5.5, p. 36: the source says the lower triangle of the proof's diagram commutes by Proposition 5.5, the statement being proved; it should be Proposition 4.10 (`ϖ_n` is unchanged by inverse image along a morphism of contractible globular extensions, p. 27); affects nothing.

## For the human reviewers

- Licence: `README.md:634–676` describes and cites the Apache-2.0 Lean development github.com/openai/math `lean/OAI/CategoryTheory/Globular/` (`Table n`, `GlobularTheory`, `IsCoherator`). This round did not fetch it, so `Suggested.lean`'s declarations were not compared with it.
- Scope: the Research context section (`README.md:599–676`) rests partly on unrefereed preprints (OpenAI, 24 September 2026; Henry arXiv:1609.04622 and arXiv:1807.02627). `README.md:601` says nothing there is a target. The headline source, Ara 2013 (J. Pure Appl. Algebra), is refereed.
