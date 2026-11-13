# Review of KanQuillen (pull request #2269 at 3bceb5a)
Folder: `TauCetiRoadmap/ModelCategoryTheory/KanQuillen/`
**Verdict:** needs changes

## R01 (P1) — `Suggested.lean` does not build at the pins; the Tau Ceti contract cites declarations the pin lacks

**Location** `Suggested.lean` lines 4, 5, 7, 8; `README.md` lines 62–70 and 217–249 ("Tau Ceti has the two weak factorization systems … Kerodon's weak homotopy equivalences … None of them is a target here").
**Claim** The four imported modules and 18 declarations of "From Tau Ceti" exist at the pinned Tau Ceti.
**Witness** Gate: "TauCeti module TauCeti.AlgebraicTopology.SimplicialSet.Factorization does not exist at the pinned Tau Ceti" (likewise `Fiber`, `KanComplex.SimplicialGroup.Basic`, `WeakHomotopyEquivalence`); pin 2fd255d has no `SSet.IsWeakHomotopyEquivalence`, `SSet.fiber`, `llp_rlp_I`.
**Repair** Land the Tau Ceti pin bump on main first (all four modules, `AnodyneExtensions/WeakHomotopyEquivalence.lean` and every cited name are present at Tau Ceti 8b9f13d993, which I read), then merge main into this branch. No README text changes for this finding once the pin has them.

## R02 (P2) — the Kan–Quillen model structure has an owner on main

**Location** `README.md` §3.2.1 line 645 ("Prove that the monomorphisms, the Kan fibrations and the weak homotopy equivalences form a model structure on `SSet`") and §3.3.1 line 705.
**Claim** This roadmap is the owner of the Kan–Quillen structure, its combinatoriality and the filtered-colimit stability of its weak equivalences.
**Witness** Main, `TauCetiRoadmap/GeneralizedCohomology/README.md` line 220: "First build the unpointed Kan–Quillen model structure"; `TauCetiRoadmap/BordismFormalGroups/README.md` lines 1571–1574: combinatoriality and filtered-colimit stability. Open EtaleHomotopyTypes and HomotopyTheoryOfCategories cite §G2.1 as owner.
**Repair** Add to Scope: "GeneralizedCohomology §G2.1 owns the model structure whose weak equivalences are defined through realization, and BordismFormalGroups §F6.5 its combinatoriality; this roadmap owns only the structure on `SSet.IsWeakHomotopyEquivalence` (§§3.2–3.4). By §3.1.2 the two have the same classes." with §3.1.2 as in R03. Which roadmap keeps the model axioms is put to the human reviewers.

## R03 (P2) — the comparison of the two classes of weak equivalences is promised in Scope and is no target

**Location** `README.md` lines 36–56: "The two classes agree: GeneralizedCohomology §G2.1 defines the realization weak equivalences … It is a requirement on the replacement used in GeneralizedCohomology §G2.1 … the replacement there must be anodyne, or `Ex^∞`."
**Claim** The agreement of `SSet.IsWeakHomotopyEquivalence` with the realization class is established by §3.1 here and §G2.1 there.
**Witness** No section of this README, and no item of §G2.1 on main (lines 220–226), states "f is in Kerodon's class iff its realization is a weak homotopy equivalence"; the argument and a condition on another roadmap's replacement sit in Scope.
**Repair** Either add "**3.1.2.** Prove that `f` satisfies `SSet.IsWeakHomotopyEquivalence` if and only if it is a weak equivalence for Tau Ceti's realization class. *Needs:* §3.1.1, §2.2.1; AlgebraicTopology §8.2 (realization-unit theorem); GeneralizedCohomology §G2.1 (Kan-group criterion)", moving the argument of lines 41–53 into its proof route; or replace lines 36–56 by "GeneralizedCohomology §G2.1 defines weak equivalences through realization; this roadmap does not compare the two classes."

## R04 (P2) — §3.6.2 restates HTT Lemma A.2.9.17 clause by clause

**Location** `README.md` lines 861–865: "Let `𝒥` be a Reedy category with a good filtration `{𝒥_β}_(β < α)`, let `𝒥_β` be obtained from `𝒥_<β` by adjoining the object `j`, and let `f : j → j` be a non-identity endomorphism."
**Claim** The statement is in the roadmap's own words.
**Witness** HTT line 38982: the same five clauses in the same order with the same notation (J, J_β, J_<β, f, I, I₀); longest shared run 8 words.
**Repair** "**3.6.2.** Prove that factorizations through earlier stages are weakly contractible (HTT, Lemma A.2.9.17, PDF p. 856). Take a good filtration of a Reedy category (Part ModelCategories §7.4.2), the object `j` it adds at some stage, and an endomorphism `f ≠ id` of `j`. The factorizations `j → i → j` of `f` whose middle object `i` was added at an earlier stage, with maps of middle objects compatible with both legs as morphisms, form a category whose nerve is weakly contractible."

## R05 (P3) — convergence of towers carries a truncation hypothesis it does not need

**Location** `README.md` §5.3.1 lines 1048–1049 ("with each `X_n` `n`-truncated"); `Suggested.lean` line 318, `(ht : ∀ n : ℕ, IsTruncated n (Y.obj (op n)))`.
**Claim** Truncation of the stages is needed for `lim X → X_n` to be bijective on `π k`, `k ≤ n`.
**Witness** Constant tower at `K(ℤ, 5)` with identity maps: `hY`, `hb` hold, `ht` fails at `n = 0`, the conclusion holds. In general `lim¹ π_(k+1)(X_j) = 0` because the maps are bijective for `j ≥ k + 1`.
**Repair** Delete `ht` from `bijective_π_limit_π` and "each `X_n` `n`-truncated and" from §5.3.1; keep truncation only in the sentence about Postnikov towers ("in particular for a tower of `n`-truncated stages, a Postnikov tower in the sense of Kerodon, Definition 3.5.8.1").

## R06 (P3) — `llp_rlp_J` is padding

**Location** `Suggested.lean` lines 230–232: `theorem llp_rlp_J … := by rw [← anodyneExtensions_eq_llp_rlp, anodyneExtensions_eq]`.
**Claim** It is a headline statement.
**Witness** Its proof is one rewrite by Mathlib `SSet.anodyneExtensions_eq_llp_rlp` (`Mathlib/AlgebraicTopology/SimplicialSet/AnodyneExtensions/Basic.lean` line 84) and the kept headline `anodyneExtensions_eq`.
**Repair** Delete it from `Suggested.lean`; in §3.3.1 drop "the generation by the horn inclusions is the `Suggested.lean` declaration `llp_rlp_J`" (the statement stays in prose), and in the module docstring replace "its generating sets are stated below as `llp_rlp_J`" by "its generating sets follow from `anodyneExtensions_eq`".

## R07 (P3) — Lean names and a layer title that the README does not have

**Location** `Suggested.lean` lines 84, 92, 112, 123, 137, 142 and 275.
**Claim** Every Lean name appears in the README and layer comments follow the README.
**Witness** `lastVertexOrderHom`, `lastVertexPartOrd`, `nerveToStdSimplex`, `lastVertexStdSimplex`, `exPow`, `exPowSequence` occur nowhere in `README.md`; line 275 reads "Postnikov sections", the README's Layer 5 "Postnikov towers".
**Repair** In §2.1.1 add "(built in `Suggested.lean` from `lastVertexOrderHom`, `lastVertexPartOrd`, `nerveToStdSimplex` and `lastVertexStdSimplex`)" after `lastVertex`; in §2.2.1 add "(`exPow`, `exPowSequence`)" after "the colimit of `X → Ex X → Ex² X → ⋯`"; make line 275 "Layer 5: Truncation, Postnikov towers and Eilenberg–MacLane complexes".

## R08 (P3) — a locator cited for a statement the source does not make

**Location** `README.md` lines 147–148: "would make it 2-connective, whereas it is not (Kerodon, Corollary 3.5.2.6)".
**Claim** Kerodon, Corollary 3.5.2.6 shows that `∂Δ[2]` is not 2-connective.
**Witness** Kerodon line 20664: the corollary states only that `∂Δ^n` is `(n − 1)`-connective.
**Repair** "would make it 2-connective, whereas it is only 1-connective (Kerodon, Corollary 3.5.2.6): `π 1` of `Ex^∞ ∂Δ[2]` is `ℤ` (§2.2)".

## R09 (P3) — the Part ModelCategories contract names no sections

**Location** `README.md` lines 253–261, for example "Left properness of a model category in which every object is cofibrant (HTT, Prop. A.2.4.2, PDF p. 832)."
**Claim** The contract lists the sections consumed, by name.
**Witness** The bullets give HTT locators only; the sections appear only in *Needs:* lines (§3.1.2, §3.4.2, §3.5.1, §4.1.1, §6.1.1, §7.4.2, §7.5.1, §7.7.1). The first bullet is Mathlib's `ModelCategory`, not this supplier's.
**Repair** Prefix each bullet with its section: "§3.4.2: left properness …", "§3.5.1: homotopy pushout squares …", "§4.1.1: Quillen adjunctions and Ken Brown's lemma …", "§3.1.2: the homotopy category …", "§6.1.1: combinatorial model categories …", "§7.4.2, §7.5.1, §7.7.1: Reedy categories …"; move the first bullet under "From Mathlib".

## R10 (P3) — the subcomplex of §5.5.1 is defined without Checks

**Location** `README.md` lines 1112–1114: "the simplicial subset of `X` of simplices all of whose faces of dimension `< n` are degenerate at `x`".
**Claim** Every definition has at least three discriminating Checks.
**Witness** §5.5.1 has one inline example (`Δ[0] ⊔ Δ[0]`) and no `**Checks.**` list.
**Repair** Add: "**Checks.** For the nerve of a group and `n = 1` the subset is the whole nerve. For the nerve of the groupoid with two uniquely isomorphic objects and `n = 1` it is `Δ[0]` at either object, and a definition constraining only the faces of dimension `< n − 1` would return the whole nerve, which is not 0-reduced. For `Δ[0] ⊔ Δ[0]` and `n = 1` it is `{x}`, and the inclusion is not bijective on `π₀`."

## R11 (P3) — the description's overlap list is incomplete

**Location** Pull request description: "**BordismFormalGroups §F6.5 item 1:** the Bergner model structure, weak exponentials and Reedy structures."
**Claim** The description lists what this family plans that roadmaps on main also plan.
**Witness** Main, `TauCetiRoadmap/BordismFormalGroups/README.md` lines 1571–1574 also plan combinatoriality and filtered-colimit stability of the Kan–Quillen structure (§3.3.1 here); open EtaleHomotopyTypes asks §G2.1 for properness (§3.4.1 here).
**Repair** Add: "BordismFormalGroups §F6.5 also plans the combinatoriality of the Kan–Quillen structure and the filtered-colimit stability of its weak equivalences (Part KanQuillen §3.3.1). Open EtaleHomotopyTypes and HomotopyTheoryOfCategories cite GeneralizedCohomology §G2.1 as the owner of the Kan–Quillen structure and of its properness (Part KanQuillen §3.4.1)."

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| Product convention (Conventions, §1.1) | nerve of `S₃`, `g = (12)`, `h = (23)` | `hg = (132)`, `gh = (123)`; pinned `MulStruct p q pq (last n)`: `d_n = q`, `d_(n+1) = pq`, `d_(n+2) = p` | agrees with AlgebraicTopology §8.2 Check |
| §1.1.2 `π_mul_comm` | `n + 2` forces degree ≥ 2; degree 1 on `N(S₃)` | `π 1 ≅ S₃ᵒᵖ`, not commutative; excluded by the index | sound |
| §1.1.3 change of basepoint | `γ = (123)`, `a = (12)`; `e = (12)`, `e′ = (23)` | `γaγ⁻¹ = (23)`, `γ⁻¹aγ = (13)`; `e′_♯e_♯(12) = (13)`, other order `(23)` | Checks correct |
| §1.1.4 | indiscrete groupoid on `n + 1` objects | free rank `n(n+1) − (n+1) + 1 = n²` | Check correct |
| §1.2.1 `range_π_map_fiber_ι` | `p = id`; `Δ[0] ⊔ Δ[0] → Δ[0]`, `n = 0` | range `{1}` = `{a ∣ a = 1}`; both sides all of `π 0 E` (2 elements) | sound |
| §1.3.3 Whitehead | `∅ → Δ[0]`; `Δ[0] ⊔ Δ[0] → Δ[0]` | `π₀` not surjective, not a w.h.e. (`Z` two points: 1 vs 2 classes); higher `π` bijective, `π₀` 2 → 1 | both sides false, sound |
| §2.1–2.2 `exComparison`, `exInfty` | `sd Δ[2]`; horn of `Λ[2, 0]` in `Ex` | 7 vertices, 12 edges, 6 triangles; image of `{1,2}` needs edges from 1 and 2: none | Checks correct; maps `ρ_(Ex^k X)` as stated |
| §3.1.1 | `∂Δ[1] → Δ[0]`, `Z = Δ[0] ⊔ Δ[0]` | 4 components against 2 | not a w.h.e., as stated |
| §3.2.1 `rlp_monomorphisms_eq`, `anodyneExtensions_eq` | `∅ → Δ[0]`; `Δ[0] ⊔ Δ[0] → Δ[0]`; `∂Δ[1] ⊆ Δ[1]`; `Λ[1, 0]` | no lift against `∅ ⊆ Δ[0]`, not w.h.e.; no lift against `∂Δ[1] ⊆ Δ[1]`; mono, not w.h.e., not anodyne; all three hold | both sides agree |
| §3.2.1 `modelCategory` | body with the two identities and two factorization systems | elaborates in the probe; a `def` over a local instance | sound |
| §3.3.1 | generators at `n = 0`; pushout of spans | `∅ → Δ[0]` lifts against `∂Δ[n] ⊆ Δ[n]`, `n ≥ 1`; `Δ[1]/∂Δ[1] → Δ[0]` has `π 1 = ℤ` | Checks correct; `llp_rlp_J` one rewrite (R06) |
| §3.4.1 properness | `IsPushout f i j g`; pullback of `{1} ⊆ Δ[1]` along `∂Δ[1] ⊆ Δ[1]` | `g` is opposite `f`, `snd` opposite `v`; `{1} ⊆ ∂Δ[1]`: 1 against 2 components | orientation right, fibration hypothesis needed |
| §3.5.1–3.5.2 | `S = Δ[0]`; `Λ[2, 1] ⊆ Δ[2]` over `{0, 2}`; constant diagram | hypothesis equals conclusion; pullback two points; matching map `Y → Y′` (empty) or an isomorphism (connected, Eilenberg–Zilber root terminal) | sound, converse false as stated |
| §3.6.1–3.6.2 | `{0} → [1]`; middle object of the factorization of `f ≠ id` | right adjoint exists; `i = j` would force both legs to be identities | sound; wording R04 |
| §4.1.1, §4.2.1 `isConnective_fiber_iff` | `n = 0`; `Δ[0] → K(A, n)`; `∂Δ[n]`, `n = 0, 1` | fibers nonempty ⟺ lift against `∅ ⊆ Δ[0]`; `π n`: `0 → A` not surjective; empty, two components | sound |
| §4.3.1 | `Δ[0] ← ∂Δ[n] → Δ[0]` | `Δ[0] → S^n` is `(n − 1)`-connective, not `n`-connective (`π n`: `0 → ℤ`) | consistent |
| §5.1.1 Postnikov sections | `N(G)`; `K(A, 2)` | 2-simplex determined by its edges: `X(1) = X`, `X(0) = Δ[0]`; simplices are 2-cocycles: `X(2) = X`, `X(1) = Δ[0]` | Checks correct |
| §5.2.1, §5.5.3 | fiber `F` of `X(n+1) → X(n)`, `n = 0` and `n ≥ 1` | `π m F = 0` for `m ≤ n`, `π (n+1) F = π (n+1) X`; `π₀ F` injects as `π 1 X(0) = 0` | sound |
| §5.3.1 `bijective_π_limit_π` | constant tower `K(ℤ, 5)`; Milnor sequence | conclusion holds with `ht` false; `lim¹` vanishes from `hb` alone | true, hypothesis unneeded (R05) |
| §5.4.1 `eilenbergMacLane` | `(n+1)`-simplices; `m = 0 < n`; `n = 0` | `n + 1` surjections `[n+1] → [n]`: `A^(n+1)`; connected; discrete on `A` | sound |
| §5.5.1–5.5.2 | `Δ[0] ⊔ Δ[0]`, `n = 1`; `K(∅, 0)` | `{x} ⊆ X` not `π₀`-bijective; the subset is the fiber of `X → X(n − 1)`, base contractible; empty, not 0-connective | hypotheses needed and present |
| §5.6.1 `pointedMap` | `Hom(S₃, S₃)`; `K(ℤ, 2)` | `1 + 3 + 6 = 10`, six automorphisms inner; `π k Map_* = H̃^(n−k) = 0` for `0 < k ≤ n` | Checks correct |

- Source locators checked against the text: Kerodon 84 statements at their number and kind (15 tags given, all match); HTT 13 (§A.2.7 at PDF pp. 846–847, Lemma A.2.9.17 at p. 856, Remark A.2.9.13 at p. 855, the Part ModelCategories locators); Moss 14.
- Library declarations opened at the pin: Mathlib `anodyneExtensions_eq_llp_rlp` (`AnodyneExtensions/Basic.lean` 84), `strongAnodyneExtensions` (131), `sdExAdjunction` (`Subdivision.lean` 55), `coskAdj` (`SimplicialSet/Basic.lean` 146), `ModelCategory.mk'` (`ModelCategory/Basic.lean` 118), `IsStableUnderFilteredColimits` (`MorphismProperty/Limits.lean` 616), `PtSimplex.MulStruct` (`KanComplex/MulStruct.lean` 202); Tau Ceti `KanComplex.π` (`HomotopyGroup.lean` 55), `π.group` (194), `mul_mk_eq_iff` (204), `IsWeaklyContractible` (`WeaklyContractible.lean` 99), `rlp_monomorphisms_iff` (`TrivialFibration.lean` 171).
- Cross-roadmap citations resolved: Part ModelCategories §3.1.2, §3.4.2, §3.5.1, §4.1.1, §6.1.1, §7.4.2, §7.5.1, §7.7.1 at this head; GeneralizedCohomology §G2.1, AlgebraicTopology §8.2 and DGFloer Layer 1 item 4 on main.
- Dependency check: `depcheck: 223 roadmaps, 1972 edges, 0 problem(s)`. No file outside the family folder is changed.
- Gate: fails (imports 4, build), R01; every other check is 0.
- Elaboration: `Suggested.lean` stops at its imports. A scratch copy with stand-ins for the four missing modules elaborates at the pinned Mathlib with `sorry` the only warning; `#check @name` on all 42 declarations was compared with the README, no binder lost, nothing changed.
- One-tactic probe (`rfl`, `infer_instance`, `simp`, `exact?`) on the 21 sorried theorems: none closes.
- Overlap check: read InfinityCategoryFoundations, LimitsAndKanExtensions, CartesianFibrations (open), BordismFormalGroups, AlgebraicTopology, EnhancedDerivedSheaves (main), and GeneralizedCohomology §G2.1; shared: the Kan–Quillen model structure (owner on main GeneralizedCohomology §G2.1) and its combinatoriality (BordismFormalGroups §F6.5), R02; nothing else shared.

Source independence: 14 passages compared with 3 sources, one shared (R04); largest share Kerodon, 89 of 164 locators; contents compared with Kerodon Chapter 3: Layers 1, 2 and 4 run parallel to §§3.2, 3.3 and 3.5.1–3.5.2 in an order the *Needs:* lines force (§2.2.1 needs §1.3.3, §3.1.1 needs §2.2.1, §4.1.1 needs §3.1.1), Layers 3 and 5 match no section: independent. May, Goerss–Jardine, Quillen and Hirschhorn were not read.

## Not verifiable

- May, §8 and §23 (§§5.1–5.6): no legal copy found by the sources service.
- Goerss–Jardine, Theorem I.11.3 and §VI.2 (§3.2.1, §5.3.1): paywalled, cited by locator.
- Quillen, Ch. II, §3 (§3.2.1): paywalled, cited by locator.
- Hirschhorn, §15.10 (§3.5.2): no legal copy found.
- Elaboration of `Suggested.lean` against Tau Ceti 8b9f13d993 as the description reports: the files were read at that commit, not built.
- Kerodon statements cited without a tag: checked against the numbering of the cached Kerodon PDF, which the site may renumber.

## Source issues

- **Error** in Kerodon at Corollary 3.5.7.19 (tag 0556): the source says a Kan complex is equivalent to K(G, 0) for a set G exactly when it is 0-truncated and 0-connective; it should be a nonempty set G, since K(∅, 0) is empty and not 0-connective; affects a stated result.
- **Misprint** in Kerodon at Definition 3.5.8.1 (tag 055L): the source says the map from X to the n-th stage exhibits that stage as an n-truncation of the tower Y; it should be an n-truncation of X; affects nothing.

## For the human reviewers

- **Scope.** GeneralizedCohomology §G2.1 and BordismFormalGroups §F6.5 on main plan the Kan–Quillen structure that §§3.2–3.3 plan (R02); open pull request #1807 revises §G2.1 as its owner, and the description asks the maintainers to choose.
- **Scope.** 89 of 164 locators are to Kerodon, an online text without a refereed edition; the same results are cited in May, Goerss–Jardine, Quillen and Moss (arXiv:1506.04887).
- **Licence.** HTT was read from the author's page and Kerodon from kerodon.net; neither host is in a licence class of the sources service, and both were classed by hand as author pages.
- **Not tested.** `Suggested.lean` needs Tau Ceti 8b9f13d993 or later; the description says it was elaborated with Mathlib e8ba86fa97, while this repository pins Tau Ceti 2fd255d and Mathlib 1b1ccf4b.
