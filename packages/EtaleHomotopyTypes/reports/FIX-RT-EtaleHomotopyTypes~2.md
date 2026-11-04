# FIX-RT-EtaleHomotopyTypes~2: red-team round 2 repaired

Six findings from two reviews (RT-EtaleHomotopyTypes~2a and ~2b) were settled on the sources. Two overlap and are settled once. All five resulting sections are applied; nothing is disputed and nothing is out of this package's reach. Files changed: `packages/EtaleHomotopyTypes/README.md`, `packages/EtaleHomotopyTypes/Suggested.lean`, `packages/EtaleHomotopyTypes/design/plan.json` (one new entry in its top-level `gaps` list, nothing else), `packages/EtaleHomotopyTypes/sources.toml`.

## RT-EtaleHomotopyTypes~2a/F01, RT-EtaleHomotopyTypes~2b/F02 (P2) — applied

Verified: SGA1 XIII Corollary 3.2 (SGA1 line 11938) is stated for a coherent morphism to an arbitrary field, (1) for every sheaf of sets with no resolution hypothesis, (2) for every sheaf of ind-p′-groups under resolution over the algebraic closure; Corollary 3.4(b) (SGA1 line 12077) likewise over an arbitrary field. The README's qcqs target kept K algebraically closed, finite constant groups and finite étale schemes.

Old → new: §3.8a gains a separately named target, **Arbitrary fields of characteristic zero and arbitrary coefficients**, for a qcqs scheme over any field k of characteristic zero: (a) cohomological properness in dimension ≤ 0 for every étale sheaf of sets, (b) in dimension ≤ 1 for every ind-finite sheaf of groups (defined there: stalks locally finite), (c) universal local 1-asphericity; with the base-change definition, the strictly henselian reformulation being reserved to separably closed fields. The route reduces to the algebraic closure through Remarks 1.5(b) (SGA1 line 10347, the stalk criterion for coherent morphisms over any base) and Hensel's lemma, treats constant sets through Proposition 1.13(3) with a symmetric group, constructible sets through the Stacks embedding (tag 09Z7), Corollary 1.9, closure under finite colimits (tag 03RZ) and Proposition 1.13(1), constructible groups through SGA 4 IX 2.14 and Proposition 1.13(2), and general coefficients and qcqs schemes through filtered colimits (tag 03SA, SGA 4 IX 2.7.2, VII 3.3) and descent of constructible sheaves along limits (tag 09YU). The finite-constant and finite-étale targets stay as the special case. The reviewer-proposed repair text of 2b/F02 (replace the finite étale clause in the existing target) is realised through this new target instead, because its sheaf-of-sets clause is the (a) clause and the existing target's finite étale sentence remains true as a special case.

Added: a supplier contract `gap:constructible-set-continuity` (EtaleCohomologyFoundations §F.0.1) in the README and in `design/plan.json`, naming each continuity and constructibility input with its Stacks tag or SGA 4 locator, as the reviewer asked; the Stacks Project chapter Étale Cohomology as source key `StacksEtale` (fetched through the service, certified); SGA 4 locators VII 3.3, IX 2.7.2 and IX 2.14 in the README references and `sources.toml`; SGA1 Proposition 1.3.1 and Corollary 1.9 in the SGA1 reference. Four new Checks: the identity-map case over ℝ with the 2-versus-1 global torsor count as the excluded wrong reading, Gₘ over ℚ with its infinitely many global classes against the 2 and 2 compared by the definition, the skyscraper and the constant-ℕ sheaves outside the finite étale clause, and ℚ/ℤ torsors against the non-ind-finite ℤ. The §3.8a convention sentence now exempts this target from the standing algebraically-closed K. The module docstring of `Suggested.lean` names the added theorem and what it lacks at the pins (direct-image and base-change exchange of sheaves of sets on small étale sites along a morphism, ind-finite sheaves of groups with their torsor stacks, constructible sheaves with their descent along limits). The Scope paragraph and the Layer 3 Dependencies and §3.8a Needs lines name the new gap.

In the qcqs step the affine scheme V is written as the limit of the spectra of the finitely generated K-subalgebras of its coordinate ring; Stacks Lemma 32.7.2 (tag 09MV, StacksLimits line 791) is cited for the general limit statement, whose stages are of finite presentation rather than affine, and the affine stages are the elementary case.

Pattern search: the other §3.8a targets (normal-crossings complements over any ℚ-scheme, projections, product formula) and §3.9a (arbitrary characteristic-zero field by Galois descent) already carry the generality their sources state; no other target narrows a field or coefficient range below its source.

## RT-EtaleHomotopyTypes~2a/F02 (P3) — applied

Verified: the third Check of §2.4 only restated the undercategory condition. Old → new: the bullet now computes, for X = Δ[1] marked at its endpoints and Y = BC₂, the endpoint-preserving classes π₁(BC₂) = C₂ (edges 1 and g, two classes) against the free classes π₀(BC₂) (one class, Δ[1] being contractible), and names the wrong cylinder that would merge them.

## RT-EtaleHomotopyTypes~2b/F01 (P3) — applied

Verified at the open head of ComplexComparisonPartII (read through the roadmap service), §C−1.1, its line 774 onward: only `complexSchemeAnalytification` is declared; the complex-points topology, fibre products, reduction, étale local biholomorphisms and smooth product charts are prose comparisons, and none of the five dotted names occurs anywhere in that roadmap. Old → new: the five dotted names at README line 143 and in §§5.3a–5.3b (route and Needs lines) are replaced by prose naming the comparisons of `complexSchemeAnalytification`. The resolver now lists no Lean name found nowhere.

## RT-EtaleHomotopyTypes~2b/F03 (P3) — applied

Verified: the statement and route of §3.5 mention no completion. Old → new: "; §3.0a for completion" deleted from the §3.5 Needs line. The §3.6, §4.0a and §4.5 citations of §3.0a are genuine uses of completion and stay.

## RT-EtaleHomotopyTypes~2b/F04 (P3) — applied

Verified at the pins: `ProfiniteGrp.profiniteCompletion` (`Mathlib/Topology/Algebra/Category/ProfiniteGrp/Completion.lean` line 191), `ProfiniteGrp.toFiniteQuotientFunctor` (`Limits.lean` line 48), `ProfiniteGrp.limitCone` and `ProfiniteGrp.limitConeIsLimit` (`Basic.lean`, lines 330 and 347). Old → new: the Layer 3 docstring bullet no longer claims a missing pro-group carrier; it says §3.0a is an adapter, not a headline, and that its finite-quotient form is expressible with native levelwise completion, the native profinite limit cone and limits and colimits of types. No declaration added.

## Checks run

- `lake env lean` on `packages/EtaleHomotopyTypes/Suggested.lean` from the content checkout: exit 0, no output. The file still declares nothing (one module docstring, empty namespace), so there is no `#check @name` comparison to make; the signatures record is accordingly empty.
- The file now opens with the `module` header and `public import Mathlib`. The worker's build of the module in a fresh worktree had reported Lake's warning that a file without a `module` header imports Mathlib, whose pinned lakefile sets `requiresModuleSystem`; the warning is emitted by the targeted build, not by `lake env lean`, and counts as a problem. With the header the warning's condition (a non-module importer) no longer holds. The header form is the one of the roadmaps on main that already use the module system (CoboundaryExpansion, TypeAHeckeAlgebras), the import scanner of the gate accepts `public import Mathlib` as the single Mathlib import, and every Lean scanner of the gate (imports, residue, sub-imports, missing import, `set_option`, sorried data, sorried examples) was run on the file and passes. No declaration, docstring sentence or namespace changed with it.
- Dependency check, exact command of the brief, after the final edits:

      depcheck: 209 roadmaps, 1815 edges, 0 problem(s)

  No UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere (the five earlier leads were the dotted analytification names, now gone).
- All 30 gap slugs, suppliers and `needs` strings compared by script between the README contracts and `design/plan.json`: identical.
- The README scanners of the gate (LaTeX, layer ids, pull-request numbers, private paths, process residue, target ids, TeX residue) were run on the README: all pass; the README contains no brace subscript and no machine path.
- `sources.toml` parses; 18 entries; the `StacksEtale` entry carries the service's url, fetched_from, fetched_at, sha256, licence_class and status.
- No gate failure was listed in this round's brief.

## Adversarial pass on the new and changed statements

| Statement | Instances tried | Values on each side | Result / change |
| --- | --- | --- | --- |
| Reduction to k̄: cohomological properness over k equals that of X_k̄ over k̄ (Remarks 1.5(b): strict localizations of Spec k and of S′ at a geometric point) | k = ℝ, X = Spec ℝ, F = C₂; X = Spec ℂ over ℝ | strict localization of Spec ℝ is Spec ℂ; identity map: every base-change functor is an identity; X_ℂ = Spec ℂ ⊔ Spec ℂ over ℂ, componentwise identity | agree; Check added |
| same | k = ℚ, X = Gₘ, F = C₂, A = strict henselization of ℚ̄[t] at 0 | classes on Gₘ,ℚ̄: 1, z (2); on Gₘ,A: units A^×z^ℤ with A^× 2-divisible, Pic 0: 2; global classes on Gₘ over ℚ: ℚ^×/ℚ^{×2} × {1,z}, infinite | the definition compares the first two; Check added |
| Hensel lift k̄ → A | A = ℂ[[t]]^{sh} = ℂ[[t]] over k = ℚ; A = ℝ-algebra ℂ | ℚ̄ ⊂ ℂ lifts to ℂ[[t]] as constants, uniquely; ℝ̄ = ℂ into ℂ, identity | unique lift, as used |
| (a) for the skyscraper of a 2-set at 0 ∈ 𝔸¹_K | A strictly henselian over K | sections 2 on 𝔸¹_K; pullback is the skyscraper on Spec A ⊂ 𝔸¹_A, sections 2 | agree; not finite étale, so new |
| (a) for constant ℕ on Spec ℂ | A strictly henselian | ℕ and ℕ (connected spectra) | agree |
| constant set C = G/H | C = {a,b}: G = S₂, H = 1; C = {a}: G = H = 1; C = ∅ | S₂/1 has 2 elements; 1/1 has 1; empty sheaf: sections empty over nonempty schemes on both sides | 1.13(3) applies (F := H in dimension ≤ 1, G in dimension ≤ 0); C = ∅ trivial |
| equalizer of the cokernel pair of F ↪ G | F = {a} ⊂ G = {a,b} in sets | G ∐_F G = {a,b,b′}; equalizer of the two coprojections = {a} = F | as used |
| (b) for ℚ/ℤ on Spec ℂ | A strictly henselian | one torsor class, automorphisms ℚ/ℤ, on both | agree; ind-finite, not finite |
| ind-finite definition | ℚ/ℤ; ℤ; C₂ | ℚ/ℤ: every f.g. subgroup finite, torsion; ℤ: 1 has infinite order, excluded; C₂ finite | definition discriminates; Check added |
| Q/F constructible | F = C₂ ⊂ G = S₃ constant, Q trivial | S₃/C₂ has 3 points, a coequalizer of constant sheaves | tag 03RZ applies |
| Y₁ étale over Spec K | Y₁ = Spec K ⊔ Spec K | X × Y₁ = X ⊔ X; base change componentwise | as used |
| colimit step for sets | F = ℕ = colim of finite subsets on Spec ℂ | f_* commutes with the filtered colimit (coherent f); base-change maps bijective at each stage | agree |
| qcqs step: affine V as a limit of affine finite-type stages | V = Spec K[t₁,t₂,…], F = C₂ (the existing qcqs Check); V = Spec K (one stage) | stages Spec K[t₁,…,tₙ], affine, transition maps affine; torsors come from some 𝔸ⁿ_K, where there is one class; one class on V ⊗ A; for Spec K the limit is constant | agree with existing Check; clause reworded to the affine case of tag 09MV |
| §2.4 Check | X = Δ[1], Y = BC₂ | relative classes C₂ (2); free classes π₀(BC₂) (1) | both computed |
| §3.5 Needs | Kummer cover of degree 2 of Gₘ | fibre C₂, cartesian square of component sets; no completion used | stale item removed |
| §3.0a docstring | constant ℤ, H = C₂ | Hom_cont(ℤ̂,C₂) = 2 = lim_N colim Hom(ℤ, C₂/N) with N = 1, 2 | expressible natively, adapter |

## Ownership and sources

The new target is owned here: cohomological properness, local asphericity and the SGA1 XIII homotopy-sequence inputs are already assigned to §3.8a by the Scope paragraph; no roadmap on main, on the board or at the open heads listed in the brief states Corollary 3.2 or 3.4 (the service grep for "cohomologically proper", "1-aspheric" and "locally 0-acyclic" over main and all open roadmap pull requests returns no match; the board's own package index lists no package on these objects). The continuity and constructibility inputs are requested from EtaleCohomologyFoundations §F.0.1, which owns constructible étale sheaves (its module version on main, line 175) and already receives the sibling gap on subsheaves. Ownership against open pull requests without files was not checked beyond the service index.

Sources: the Stacks chapter Étale Cohomology was fetched through the service and is certified; its lemmas are cited at StacksEtale lines 3402, 5469, 5647, 5681, 5824 and 6045, each re-read this round. SGA 4 VII 3.3, IX 2.7.2 and IX 2.14 are cited by locator without text under the settled uncertified key SGA4, with the SGA1 lines where SGA1 invokes them. No request was opened; `needs-references.toml` was not created.

## For the maintainer

- EtaleCohomologyFoundations receives a fifth gap from this roadmap, `gap:constructible-set-continuity` (§F.0.1). Its items are all Stacks lemmas (tags 03SA, 03RZ, 095Q, 09Z7, 09YU) plus SGA 4 VII 3.3, IX 2.7.2 and IX 2.14 for the group versions.
- `Suggested.lean` now uses the module system (`module`, `public import Mathlib`). This is what the targeted build of a Mathlib-importing file needs to run warning-free at the pinned Mathlib; any future declaration in the file whose signature names Mathlib constants needs the import to stay `public`.
- No Lean name of this roadmap changed (the file declares nothing). The five names `complexSchemeAnalytification.*` that this README used to attribute to ComplexComparisonPartII never existed there; any other consumer citing them should cite the prose comparisons of `complexSchemeAnalytification` in its §C−1.1.
- The sheaf-of-sets clause (a) is stated, like the rest of §3.8a, in characteristic zero. SGA1 XIII Corollary 3.2(1) holds over every field; a positive-characteristic form would need the purely inseparable normalisation step of SGA1's proof of Theorem 3.1(1)(a) and is outside this roadmap's characteristic-zero scope.
