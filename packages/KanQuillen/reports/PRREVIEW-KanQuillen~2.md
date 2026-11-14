# Review of KanQuillen (pull request #2269 at ac5fe3a)
Folder: `TauCetiRoadmap/ModelCategoryTheory/KanQuillen/`
**Verdict:** needs changes

Incremental re-review of the 103 lines changed since `3bceb5a`.

## R01 (P1) — `Suggested.lean` still does not build at the pins

**Location** `Suggested.lean` lines 4, 5, 7, 8 (the imports of `…SimplicialSet.Factorization`, `…SimplicialSet.Fiber`, `…KanComplex.SimplicialGroup.Basic`, `…SimplicialSet.WeakHomotopyEquivalence`); `README.md` "From Tau Ceti".
**Claim** The four imported modules exist at the pinned Tau Ceti.
**Witness** Gate at this head: `imports=4 … build=9 FAIL`, "TauCeti module TauCeti.AlgebraicTopology.SimplicialSet.Factorization does not exist at the pinned Tau Ceti" (and the other three); `lake-manifest.json` still pins Tau Ceti `2fd255d`.
**Repair** Unchanged from the previous review: land the Tau Ceti pin bump (to `8b9f13d993` or later) on main, then merge main into this branch. No README text changes for this finding.

## R02 (P2) — the Kan–Quillen model structure has an owner on main, and Scope does not say so

**Location** `README.md` Scope and ownership, lines 31–78, and §3.2.1 line 648 ("Prove that the monomorphisms, the Kan fibrations and the weak homotopy equivalences form a model structure on `SSet`"), §3.3.1 line 708.
**Claim** This roadmap is the owner of the Kan–Quillen structure, its combinatoriality and the filtered-colimit stability of its weak equivalences.
**Witness** Main, `TauCetiRoadmap/GeneralizedCohomology/README.md` line 220: "First build the unpointed Kan–Quillen model structure"; `TauCetiRoadmap/BordismFormalGroups/README.md` line 1571. The description now names both; the README's Scope names neither as owner.
**Repair** Add to Scope: "GeneralizedCohomology §G2.1 owns the model structure whose weak equivalences are defined through realization, and BordismFormalGroups §F6.5 its combinatoriality; this roadmap owns only the structure on `SSet.IsWeakHomotopyEquivalence` (§§3.2–3.4)." Add "By §3.1.2 the two have the same classes." only if R03 is repaired by its first option.

## R03 (P2) — the comparison of the two classes of weak equivalences is promised and is no target

**Location** `README.md` lines 36–56: "The two classes agree: GeneralizedCohomology §G2.1 defines the realization weak equivalences … the replacement there must be anodyne, or `Ex^∞`." Description: "Together, GeneralizedCohomology §G2.1 and Part KanQuillen §3.1 will show that the two definitions agree".
**Claim** The agreement of `SSet.IsWeakHomotopyEquivalence` with the realization class is established by §3.1 here and §G2.1 there.
**Witness** §3.1 has the single target §3.1.1 (line 615), which does not mention realization; §G2.1 on main (lines 220–226) states no such equivalence. The argument, and a condition on another roadmap's replacement, sit in Scope.
**Repair** Either add "**3.1.2.** Prove that `f` satisfies `SSet.IsWeakHomotopyEquivalence` if and only if it is a weak equivalence for Tau Ceti's realization class. *Needs:* §3.1.1, §2.2.1; AlgebraicTopology §8.2 (realization-unit theorem); GeneralizedCohomology §G2.1 (Kan-group criterion)", moving the argument of lines 41–53 into its proof route; or replace lines 36–56 by "GeneralizedCohomology §G2.1 defines weak equivalences through realization; this roadmap does not compare the two classes." and the description's sentence by the same.

## R04 (P2) — two citations of Part ModelCategories §7.4.2, which does not exist at this head

**Location** `README.md` line 263 ("§7.4.2, §7.5.1 and §7.7.1: Reedy categories, latching and matching objects, good filtrations") and line 865 ("Take a good filtration of a Reedy category (Part ModelCategories §7.4.2)").
**Claim** Part ModelCategories §7.4.2 states good filtrations.
**Witness** `TauCetiRoadmap/ModelCategoryTheory/ModelCategories/README.md` at this head: §7.4 has the one target §7.4.1 (line 1160), whose bullets at lines 1168–1175 state good filtrations; no §7.4.2. The *Needs:* lines 822, 880, 881 already cite §7.4.1.
**Repair** Replace "§7.4.2" by "§7.4.1" at lines 263 and 865.

## R05 (P3) — Lean names and a layer title that the README does not have

**Location** `Suggested.lean` lines 84–142 (`lastVertexOrderHom`, `lastVertexPartOrd`, `nerveToStdSimplex`, `lastVertexStdSimplex`, `exPow`, `exPowSequence`) and line 267 ("Layer 5: Truncation, Postnikov sections and Eilenberg–MacLane complexes").
**Claim** Every Lean name appears in the README and layer comments follow the README.
**Witness** None of the six names occurs in `README.md` (searched at this head); the README's Layer 5 heading reads "Truncation, Postnikov towers and Eilenberg–MacLane complexes".
**Repair** In §2.1.1 add "(built in `Suggested.lean` from `lastVertexOrderHom`, `lastVertexPartOrd`, `nerveToStdSimplex` and `lastVertexStdSimplex`)" after `lastVertex`; in §2.2.1 add "(`exPow`, `exPowSequence`)" after "the colimit of `X → Ex X → Ex² X → ⋯`"; make line 267 "Layer 5: Truncation, Postnikov towers and Eilenberg–MacLane complexes".

## R06 (P3) — a Mathlib notion is still listed in the Part ModelCategories contract

**Location** `README.md` line 257: "Model categories (HTT, Def. A.2.1.1, PDF p. 828), in Mathlib's form; this one is Mathlib's, not this supplier's."
**Claim** The bullets under "From TauCetiRoadmap.ModelCategoryTheory, Part ModelCategories" are what that supplier provides.
**Witness** The bullet itself says the notion is Mathlib's; `HomotopicalAlgebra.ModelCategory` is Mathlib's (`Mathlib/AlgebraicTopology/ModelCategory/Basic.lean`).
**Repair** Delete line 257 and add under "From Mathlib": "`HomotopicalAlgebra.ModelCategory`: model categories (HTT, Def. A.2.1.1, PDF p. 828)."

## R07 (P3) — the Checks of §5.5.1 are run into the statement

**Location** `README.md` lines 1118–1122: "… to an `(n − 1)`-reduced Kan complex). **Checks.** For the nerve of a group and `n = 1` the subset is the whole nerve. … The route: by connectivity …".
**Claim** The section has a `**Checks.**` bullet list, one bullet per test.
**Witness** The three Checks stand inline between the statement and "The route:"; every other section (for example line 1070) opens `**Checks.**` on its own line with one bullet each.
**Repair** End the statement at "`(n − 1)`-reduced Kan complex).", continue with "The route: …" and the *Needs:* line, then a block "**Checks.**" with three bullets: the nerve of a group; the groupoid with two uniquely isomorphic objects; `Δ[0] ⊔ Δ[0]`.

## R08 (P3) — a whitespace-only line inside a binder list

**Location** `Suggested.lean` line 310, between `(hY : …)` and `(hb : …)` of `bijective_π_limit_π`.
**Claim** The deletion of `ht` left the signature clean.
**Witness** Line 310 consists of four spaces (`grep -n ' $' Suggested.lean` returns `310:`).
**Repair** Delete line 310.

## Previous findings

- R01 — not repaired: `Suggested.lean` lines 4, 5, 7, 8 import modules absent at Tau Ceti `2fd255d`; gate `imports=4`, build fails (R01).
- R02 — not repaired: Scope unchanged; only the description now names §G2.1 and §F6.5 (R02).
- R03 — not repaired: lines 36–56 unchanged, no §3.1.2 (R03).
- R04 — repaired: "Take a good filtration of a Reedy category …, the object `j` it adjoins at some stage, and an endomorphism `f ≠ id` of `j`"; the supplier id in it is stale (R04).
- R05 — repaired: `ht` deleted and "each `X_n` `n`-truncated" removed from §5.3.1; a blank line is left (R08).
- R06 — repaired: `llp_rlp_J` deleted; §3.3.1 and the docstring say "follows from `anodyneExtensions_eq`".
- R07 — not repaired: the six names are absent from the README; line 267 still reads "Postnikov sections" (R05).
- R08 — repaired: "whereas it is only 1-connective (Kerodon, Corollary 3.5.2.6): `π 1` of `Ex^∞ ∂Δ[2]` is ℤ (§2.2)".
- R09 — partly repaired: bullets carry §3.4.2, §3.5.1, §4.1.1, §3.1.2, §6.1.1, §7.5.1, §7.7.1; "§7.4.2" is stale (R04) and the Mathlib bullet stays (R06).
- R10 — partly repaired: three Checks added, inline in the statement paragraph (R07).
- R11 — repaired: the description lists combinatoriality and filtered-colimit stability under §F6.5 and the open citations of §G2.1.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §5.3.1 `bijective_π_limit_π` without `ht` | constant tower `K(ℤ, 5)`; `k = 0`, `n = 0`; tower of circles with degree-`p` maps | conclusion holds; `lim¹ π_(k+1)(X_j) = 0` since transitions are bijective for `j ≥ k + 1`, `lim π_k = π_k X_n`; `hb` fails at `k = 1`, `lim¹ = ℤ_p/ℤ ≠ 0` | true as restated; `hb` needed |
| §3.6.2 as reworded | `f ≠ id`, Reedy factorization `j → k → j`; `k = j` | `k = j` makes both legs endomorphisms in the two classes, hence identities, `f = id`; so `k ≺ j`, the category is nonempty | agrees with HTT Lemma A.2.9.17 |
| Conventions Check on `∂Δ[2]` | `n = 2` in Kerodon Cor. 3.5.2.6 | `(n − 1) = 1`-connective; `π 1 = ℤ ≠ 0`, so not 2-connective | correct |
| §5.5.1 Checks | `N(G)`, `n = 1`; groupoid on two uniquely isomorphic objects; `Δ[0] ⊔ Δ[0]` | one vertex: whole nerve; simplices with all vertices `x`: `Δ[0]`, wrong bound `< n − 1` gives 2 vertices; `{x} ⊆ X`: 1 against 2 components | Checks correct; form R07 |
| §3.3.1 after deleting `llp_rlp_J` | Mathlib `anodyneExtensions_eq_llp_rlp` with kept `anodyneExtensions_eq` | `J.rlp.llp = anodyneExtensions = monomorphisms ⊓ weakHomotopyEquivalences` | "follows from `anodyneExtensions_eq`" holds |
| Contract for Part ModelCategories | each section id at this head | §3.1.2 line 491, §3.4.2 line 597, §3.5.1 line 611, §4.1.1 line 700, §6.1.1 line 936, §7.5.1 line 1204, §7.7.1 line 1290 exist; §7.4.2 does not | R04 |

The rows for untouched statements stand as in the previous review, of `3bceb5a`.

- Source locators checked against the text: HTT Lemma A.2.9.17 (HTT line 38982, PDF p. 856); Kerodon Corollary 3.5.2.6 (Kerodon line 20664). Sampled targets 3.3, 3.6 and 5.5 fall in changed passages and were checked there; the others are untouched.
- Cross-roadmap citations resolved: the eight Part ModelCategories ids of lines 257–264, 822–825, 865, 880–881 at this head; GeneralizedCohomology §G2.1 (line 220) and BordismFormalGroups §F6.5 (line 1571) on main.
- Dependency check: `depcheck: 244 roadmaps, 2197 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file outside the family folder is changed.
- Gate: fails (`imports=4`, build), R01; every other check is 0.
- Elaboration: `lake env lean` on `Suggested.lean` stops at line 1, the object file of `TauCeti.AlgebraicTopology.SimplicialSet.Factorization` being absent at the pin; no signature could be compared this round. The diff deletes one theorem and one hypothesis that no other binder mentions.
- Description against the head: word count 12.3k (12,335), four members, the overlap paragraph and the pin paragraph agree with the head; the sentence on the two classes is R03.
- Remark: StableHomotopyKTheory §§3.18–3.20 on main state Postnikov towers and their convergence for CGWH and CW spaces; §§5.1–5.3 here are on Kan complexes, a different carrier.
- Overlap check: read InfinityCategoryFoundations, LimitsAndKanExtensions, CartesianFibrations (open), StableHomotopyKTheory, BordismFormalGroups, AlgebraicTopology (main) and GeneralizedCohomology §G2.1; shared: the Kan–Quillen model structure (owner on main GeneralizedCohomology §G2.1) and its combinatoriality (BordismFormalGroups §F6.5), R02; nothing else shared.

Source independence: changed passages only: 3 passages compared with 2 sources (HTT, Kerodon), none shared (§3.6.2 no longer follows HTT line 38982); largest share Kerodon, 89 of 164 locators as counted at `3bceb5a`; the diff adds, removes or reorders no layer, so the contents were not compared again. May and Goerss–Jardine, cited in the changed §5.5.1 and §5.3.1, were not read.

## Not verifiable

- May, §8 (§5.5.1): no legal copy found by the sources service.
- Goerss–Jardine, §VI.2 (§5.3.1): paywalled, cited by locator.
- Elaboration of `Suggested.lean` at this head: the imports are absent at the pinned Tau Ceti.

## Source issues

- **Error** in Kerodon at Corollary 3.5.7.19 (tag 0556): the source says a Kan complex is equivalent to K(G, 0) for a set G exactly when it is 0-truncated and 0-connective; it should be a nonempty set G, since K(∅, 0) is empty and not 0-connective; affects a stated result.
- **Misprint** in Kerodon at Definition 3.5.8.1 (tag 055L): the source says the map from X to the n-th stage exhibits that stage as an n-truncation of the tower Y; it should be an n-truncation of X; affects nothing.

## For the human reviewers

- **Scope.** GeneralizedCohomology §G2.1 and BordismFormalGroups §F6.5 on main plan the Kan–Quillen structure that §§3.2–3.3 plan (R02); open pull request #1807 revises §G2.1 as its owner, and the description asks the maintainers to choose.
- **Scope.** 89 of 164 locators are to Kerodon, an online text without a refereed edition; the same results are cited in May, Goerss–Jardine, Quillen and Moss (arXiv:1506.04887).
- **Licence.** HTT was read from the author's page and Kerodon from kerodon.net; neither host is in a licence class of the sources service, and both were classed by hand as author pages.
- **Not tested.** `Suggested.lean` needs Tau Ceti 8b9f13d993 or later; the description says it was elaborated with Mathlib e8ba86fa97, while this repository pins Tau Ceti 2fd255d and Mathlib 1b1ccf4b.
