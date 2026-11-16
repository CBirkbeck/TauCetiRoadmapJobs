# Review of KanQuillen (pull request #2269 at 2a6d75e)
Folder: `TauCetiRoadmap/ModelCategoryTheory/KanQuillen/`
**Verdict:** needs changes

## R01 (P1) — `Suggested.lean` still does not build at the pins

**Location** `Suggested.lean` lines 4, 5, 7, 8 (imports of `…SimplicialSet.Factorization`, `…SimplicialSet.Fiber`, `…KanComplex.SimplicialGroup.Basic`, `…SimplicialSet.WeakHomotopyEquivalence`); `README.md` lines 210–239, "From Tau Ceti".
**Claim** The four imported modules, and the declarations the contract cites from them, exist at the pinned Tau Ceti.
**Witness** Gate at this head: `imports=4 … build=9 FAIL`, "TauCeti module TauCeti.AlgebraicTopology.SimplicialSet.Factorization does not exist at the pinned Tau Ceti" (and the other three); the pin is `2fd255d`. Eleven cited names (for example `SSet.modelCategoryQuillen.llp_rlp_I`) are absent there.
**Repair** Unchanged: land the Tau Ceti pin bump (to `8b9f13d993` or later, where all four modules and all eleven names are present) on main, then merge main into this branch. No README text changes.

## R02 (P2) — Scope still does not name the plans on main for the same model structure

**Location** `README.md` lines 38–40: "GeneralizedCohomology §G2.1 defines the realization weak equivalences and is the natural owner of that comparison; this roadmap owns only the structure on `SSet.IsWeakHomotopyEquivalence`."
**Claim** Scope says what this roadmap owns and what roadmaps on main own of the Kan–Quillen structure and its properties (§3.2.3, §3.3.1, §3.4.1).
**Witness** Main, `TauCetiRoadmap/GeneralizedCohomology/README.md` line 220: "First build the unpointed Kan–Quillen model structure"; `TauCetiRoadmap/BordismFormalGroups/README.md` lines 1571–1574: combinatoriality and filtered-colimit stability. `grep BordismFormalGroups README.md` returns nothing.
**Repair** Append to that bullet: "GeneralizedCohomology §G2.1 plans the Kan–Quillen model structure on the realization class, and BordismFormalGroups §F6.5 its combinatoriality and the filtered-colimit stability of its weak equivalences; §§3.2–3.4 here state these properties for `SSet.IsWeakHomotopyEquivalence` only."

## R03 (P2) — the route of §5.3.1 uses the Milnor sequence, which nothing supplies

**Location** `README.md` lines 1212–1214: "For a general tower, compare the long exact sequences of the fibrations `lim X → X_n`. Milnor's `lim¹` terms vanish because the groups stabilize." and the *Needs:* lines 1217–1218.
**Claim** Every input of the route is a target, a supplier section or a pinned declaration.
**Witness** The `lim¹` sequence of a tower of Kan fibrations is no target here, is not in *Needs:* (§5.2.1, §1.2.3, §1.3.3), and is in no pinned library; main has it only for CGWH spaces (StableHomotopyKTheory §3.18).
**Repair** Replace the two sentences by: "For a general tower, each `X_(j+1) → X_j` with `j ≥ n + 1` has `(n + 1)`-connective fibers (§1.2.3), so it lifts against `∂Δ[m] ⊆ Δ[m]` for `m ≤ n + 1` (§4.2.1); the lifting property passes to the inverse limit, so `lim X → X_(n+1)` is a Kan fibration with `(n + 1)`-connective fibers and is bijective on `π k` for `k ≤ n` (§1.2.3). Compose with `X_(n+1) → X_n`." and add "§4.2.1" to *Needs:*. Tested on the constant tower and on `k = n = 0`.

## R04 (P3) — connectivity is used for simplicial sets that are not Kan, and is defined only for Kan complexes

**Location** `README.md` line 134 ("Both notions are stated for Kan complexes only."), line 1075 ("`∂Δ[n]` is `(n − 1)`-connective"), line 1144 ("`S^n = Δ[n]/∂Δ[n]` is `n`-connective").
**Claim** Every term used is defined.
**Witness** `∂Δ[n]` and `Δ[n]/∂Δ[n]` are not Kan; §4.1.1 defines `n`-connective Kan complexes and `n`-connective maps only. Kerodon line 20263 (Variant 3.5.1.6) and line 20337 (Example 3.5.1.18) give the missing notion.
**Repair** In §4.1.1, after the definition for maps, add: "A simplicial set `X` is `n`-connective when `X → Δ[0]` is, equivalently when `Ex^∞ X` is (Kerodon, Variant 3.5.1.6 and Example 3.5.1.18)." and make line 134 "Both notions are defined on Kan complexes; §4.1.1 extends connectivity to all simplicial sets."

## R05 (P3) — §3.5.2 splits §3.5.1 from its route, and Scope excludes what it states

**Location** `README.md` lines 940–950 (§3.5.2, between the statement of §3.5.1 at 935 and its *Proof route.* at 952); lines 63–66: "Model categories in general, … and Reedy model structures belong to ModelCategoryTheory, Part ModelCategories".
**Claim** Each target carries its own route, Checks and *Needs:*; Scope lists what is stated here.
**Witness** The *Proof route.*, **Checks.** and *Needs:* at lines 952–981 are §3.5.1's but follow §3.5.2's *Needs:* line; §3.5.2 is about an arbitrary model category `M` and Reedy category `J`, which Scope sends to Part ModelCategories, where no section states it.
**Repair** Move lines 940–950 after line 981 (numbers unchanged), and in line 66 write "except §A.2.7, Lemma A.2.9.17, which is §3.6 here, and the colimit lemma for Reedy categories whose matching categories are empty or connected, which is §3.5.2 here".

## R06 (P3) — a proof route names a later Part as a second owner

**Location** `README.md` lines 837–838: "Part SimplicialCategories §1.3 owns this cylinder too, but it is downstream of this Part and citing it here would be circular."
**Claim** The cylinder `X × ∂Δ[1] ⊆ X × Δ[1] ⟶ X` has two owners.
**Witness** `TauCetiRoadmap/ModelCategoryTheory/SimplicialCategories/README.md` lines 337–338 state that `X ⊗ Δ[1]` is a cylinder object in any simplicial model category, a different and more general statement; the route above already proves the cylinder here.
**Repair** Delete the sentence.

## Previous findings

- R01 — not repaired: lines 4, 5, 7, 8 unchanged, gate `imports=4`, build fails (R01).
- R02 — partly repaired: "this roadmap owns only the structure on `SSet.IsWeakHomotopyEquivalence`"; §G2.1's model structure and §F6.5 are still unnamed (R02).
- R03 — repaired: "Whether the two classes coincide is not settled here and is not claimed: no target of this roadmap asserts it".
- R04 — repaired: "Take a good filtration of a Reedy category (Part ModelCategories §7.4.1)"; the sibling maps the former §7.4.2 to §7.4.1.
- R05 — repaired: "built there from `lastVertexOrderHom`, `lastVertexPartOrd`, `nerveToStdSimplex` and `lastVertexStdSimplex`"; "as `exPow` and `exPowSequence`"; the README's Layer 5 heading now reads "Postnikov sections", as line 268 does.
- R06 — repaired: "`HomotopicalAlgebra.ModelCategory`: model categories (HTT, Def. A.2.1.1, PDF p. 828)." under "From Mathlib".
- R07 — repaired: §5.5.1 ends with a `**Checks.**` list of three bullets.
- R08 — repaired: no line of `Suggested.lean` ends in whitespace.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §1.1 product convention, `π_mul_comm` | `N(S₃)`, `g = (12)`, `h = (23)`; degree `n + 2` | `d₁ = hg = (132)`, opposite order `(123)`; Kerodon line 15988 composes the other way | convention pinned; degree 1 excluded |
| §1.2.1 connecting map | `τ̃` on `Λ[n+1, 0]`; projection `X × Y → Y` | faces `d_i`, `1 ≤ i ≤ n+1`, constant, `∂[τ] = [d₀τ̃]` as Kerodon line 16397; lift `(e, τ)`, `∂ = 1` | agrees |
| §1.2.2 action | README order `[p]·[q]` = `p` then `q` | `a(q, a(p, x)) = (x·p)·q`: right action here, left in Kerodon's order (line 16508) | "left after inversion" correct |
| §1.2.3, `range_π_map_fiber_ι` | `p = id`, `n = 0`; `N(ℤ ⋉ ℤ/2) → N(ℤ)` | both sides `{1}`; fiber 2 points, one orbit, stabilizer `2ℤ` = image of `π 1 E` | sound, Checks correct |
| §1.3.2–1.3.3 Whitehead | `Δ[0] ⊔ Δ[0] → Δ[0]`; `∅ → Δ[0]` | `π₀`: 2 → 1, higher bijective; `π₀` not surjective; neither a w.h.e. | both sides false; connectedness step present |
| §2.1.1 `lastVertex`, `exComparison` | `sd Δ[2]`; `ρ` at `Δ[1]`; minimum instead of maximum | 7 vertices, 6 + 3 + 3 = 12 edges, 6 triangles; edge ↦ `0 → 1 ← 1`; minimum reverses inclusion | Checks correct |
| §2.2.1 `exInfty` | transition at `k = 0`; countable product | `g({1}) = 0 ≠ 1 = g({0,1})`, same last vertex, so `g` is not in the image; `Ex^k` union misses the edge | finite limits only, as stated |
| §2.2.2 `kanComplex_exInfty_obj`, `strongAnodyneExtensions_toExInfty_app` | horn `Λ[2,0] → Ex ∂Δ[2]` | filler needs `{1,2}, {0,1,2} ↦ 2` and a nondegenerate 2-simplex `(0,1,2)` of `∂Δ[2]`: none | `Ex ∂Δ[2]` not Kan; Mathlib's class is "mono with a regular pairing" |
| §3.2.1–3.2.2 `rlp_monomorphisms_eq`, `anodyneExtensions_eq` | `Δ[0] ⊔ Δ[0] → Δ[0]`; `∅ ⊆ Δ[0]`; `Δ[1] → Δ[0]` | fibration, fiber 2 points, no lift against `∂Δ[1] ⊆ Δ[1]`; mono, `π₀` 0 → 1; w.h.e., not mono | both sides agree in each |
| §3.2.3 `modelCategory` | body | `mk'` from the two identities, two factorization systems, two out of three; a `def` over a local instance | no clash with the scoped instance |
| §3.3.1 filtered colimits | spans `Δ[0] ← ∂Δ[1] → Δ[1]` and `→ Δ[0]` | pushouts `Δ[1]/∂Δ[1] → Δ[0]`, `π 1 = ℤ` against 0 | filtered needed; Kerodon line 16838 |
| §3.4.1 properness | `IsPushout f i j g`; `IsPullback fst snd v p`; `{1} ⊆ Δ[1]` along `∂Δ[1] ⊆ Δ[1]` | `g` opposite `f`, `snd` opposite `v`; pullback `{1} ⊆ ∂Δ[1]`, 1 against 2 components | orientation right; fibration needed |
| §3.5.1–3.5.2 | `S = ∅`; `Λ[2,1] ⊆ Δ[2]` over `{0,2}`; matching category of `σ` in `el(S)` | hypothesis vacuous, `X = ∅`, iso; two points; empty if nondegenerate, else terminal object (Eilenberg–Zilber) | sound, converse false; layout R05 |
| §3.6.1–3.6.2 | `{0} → [1]`; middle object `i = j` | `Hom(0, y) = * = Hom(0, r y)`: right adjoint; both legs identities, `f = id` excluded | agrees with HTT line 38982 |
| §4.1.1 transitivity | `F_f → F_(gf) → F_g`, `m < n`; `n = −1` | `π_(m+1) F_g = 0`, `π_m F_(gf) = 0`, so `π_m F_f = 0`; nonempty since `F_g` connected | Kerodon line 20447 (2) |
| §4.1.1 Checks | `∂Δ[n]`, `n = 0, 1, 2`; `Δ[0] → K(A, n)` | empty; 2 components; `π 1 = ℤ`; fiber `K(A, n−1)`, `π_(n−1) = A ≠ 0` | correct; vocabulary R04 |
| §4.2.1 `isConnective_fiber_iff` | `n = 0`; `n = 1`; `∅ → Δ[0]`; `id` | fibers nonempty ⟺ lift against `∅ ⊆ Δ[0]`; connected ⟺ also `∂Δ[1] ⊆ Δ[1]`; both false; both true | sound |
| §5.1.1 Postnikov sections | `N(G)`; `K(A, 2)`; `m = n = 0` | simplices determined by edges: `X(1) = X`, `X(0) = Δ[0]`; 2-cocycles: `X(2) = X`, `X(1) = Δ[0]`; `π₀ X(0) = π₀ X` | Checks correct |
| §5.2.1, §5.5.3 | fiber `F` of `X(n+1) → X(n)` | `π_m F = 0` for `m ≤ n` (iso, iso at `m < n`; `π_(n+1) X(n) = 0` at `m = n`), `π_(n+1) F = π_(n+1) X` | sound |
| §5.3.1 `bijective_π_limit_π` | constant tower; `k = n = 0`; direct route of R03 | fibers of `X_(j+1) → X_j` are `j`-connective; `lim X → X_(n+1)` has `(n+1)`-connective fibers; bijective for `k ≤ n` | true; route input R03 |
| §5.4.1 `eilenbergMacLane` | `(n+1)`-simplices; `n = 0`; `m = 0 < n` | `n + 1` surjections `[n+1] → [n]`: `A^(n+1)`; discrete on `A`, `π 0 = A`; connected | sound |
| §5.5.2 `exists_isWeakHomotopyEquivalence_of_mulEquiv` | `n = 0` (`π 1` non-abelian); `K(∅, 0)` | `m = 0 < n + 1` forces connected; both are `K(G, 1)`; empty is not 0-connective | hypotheses present |
| §5.6.1 `pointedMap`, the two theorems | `K(ℤ, 2)`; `Hom(S₃, S₃)`; the `curry` vertex | `π_m Map_* = H̃^(n−m)(K(A,n); B) = 0` for `m ≥ 1`; `1 + 3 + 6 = 10`; `Δ[0] ⟶ Fun(Δ[0], Y)` at `y` | sound |

- Source locators checked against the text: Kerodon 90 statements found at their numbers (the statements of the 15 sampled sections read); Moss 14 (lines 106–670); HTT 12 (§A.2.7 at PDF pp. 846–847, Lemma A.2.9.17 at p. 856, Remark A.2.9.13 at p. 855, the Part ModelCategories locators at pp. 828–859).
- Mathlib at the pin: `anodyneExtensions` (`AnodyneExtensions/Basic.lean` 75), `anodyneExtensions_eq_llp_rlp` (84), `strongAnodyneExtensions` (131), `sdExAdjunction` (`Subdivision.lean` 55), `sdIso` (67), `coskAdj` (`SimplicialSet/Basic.lean` 146), `Subcomplex.range`/`toRange` (`Subcomplex.lean` 184, 187), `ModelCategory.mk'` (`ModelCategory/Basic.lean` 118), `IsStableUnderFilteredColimits` (`MorphismProperty/Limits.lean` 616), `RelativeMorphism.ofSimplex₀` (`RelativeMorphism.lean` 59), `KanComplex.hornFilling` (`KanComplex.lean` 45).
- Tau Ceti at the pin: `KanComplex.π` (`HomotopyGroup.lean` 55, no Kan instance in its type), `doldKanPiAddEquivHomology` (`DoldKan/HomotopyGroups.lean` 46); the eleven names of the worker's citation list are absent (R01).
- Cross-roadmap citations resolved: Part ModelCategories §3.1, §3.1.1, §3.4.2, §3.5.1, §4.1.1, §6.1.1, §7.4.1, §7.5.1, §7.7.1 at this head; GeneralizedCohomology §G2.1, AlgebraicTopology §8.2, DGFloer Layer 1 item 4 on main.
- Dependency check: `depcheck: 261 roadmaps, 2594 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file outside the family folder is changed.
- Gate: fails (`imports=4`, `build=9`), R01; every other check is 0.
- Elaboration and `#check` comparison: not possible at the pins (R01). Since the head whose signatures the first review compared, `Suggested.lean` lost one theorem and one hypothesis and changed docstrings only. Padding was judged by reading: no sorried theorem restates a definition or one pinned lemma; the `KanComplex` instance on `eilenbergMacLane` is needed by the `→*` and `≃*` statements.
- Description against the head: 14,127 words (14.1k), the overlap, weak-equivalence and pin paragraphs agree with the head; nothing to change.

Overlap check: read InfinityCategoryFoundations, LimitsAndKanExtensions, CartesianFibrations, Straightening, PresheavesAndCompletions (open), StableHomotopyKTheory, BordismFormalGroups, AlgebraicTopology (main), and GeneralizedCohomology §G2.1; shared: the Kan–Quillen model structure (on main GeneralizedCohomology §G2.1) and its combinatoriality (BordismFormalGroups §F6.5), R02; Postnikov towers of StableHomotopyKTheory §§3.18–3.20 are on spaces, a different carrier; nothing else shared.

Source independence: 12 passages compared with 3 sources (Kerodon, HTT, Moss), none shared (longest common run 6 words, in a statement the mathematics forces); largest share Kerodon, about 90 of about 165 locators; contents compared with Kerodon Chapter 3: Layers 1, 2 and 4 run beside §§3.2, 3.3 and 3.5.1–3.5.2 in the order the *Needs:* lines force (§2.2.2 needs §1.3.3, §3.1.1 needs §2.2.2, §4.1.1 needs §3.1.1), Layers 3 and 5 match no section: independent. May, Goerss–Jardine, Quillen and Hirschhorn were not read.

Research link: Layers 2–3 give the Kan–Quillen model structure (Quillen 1967) by the combinatorial route of Moss (arXiv:1506.04887, 2019) through Kan's `Ex^∞`; it is the base of the appendix of Lurie's *Higher Topos Theory* (2009), which the InfinityCategoryTheory family consumes. Rests on the README's References and on Moss §§3–4.

## Not verifiable

- May, §8 and §23 (§§5.1, 5.2, 5.5, 5.6): the sources service found no legal copy.
- Goerss–Jardine, Theorem I.11.3 and §VI.2 (§3.2.3, §5.3.1), Quillen, Ch. II §3 (§3.2.3), Hirschhorn, §15.10 (§3.5.2): not fetched, cited by locator.
- Elaboration of `Suggested.lean`, the elaborated signatures and the one-tactic probe: the imports are absent at the pinned Tau Ceti.
- That no target is already proved at Tau Ceti `8b9f13d993`: only the cited names were looked up there, not built.

## Source issues

- **Error** in Kerodon at Corollary 3.5.7.19 (tag 0556): the source says a Kan complex is equivalent to K(G, 0) for a set G exactly when it is 0-truncated and 0-connective; it should be a nonempty set G, since K(∅, 0) is empty and not 0-connective; affects a stated result.
- **Misprint** in Kerodon at Definition 3.5.8.1 (tag 055L): the source says the map from X to the n-th stage exhibits that stage as an n-truncation of the tower Y; it should be an n-truncation of X; affects nothing.

## For the human reviewers

- **Scope.** GeneralizedCohomology §G2.1 and BordismFormalGroups §F6.5 on main plan the Kan–Quillen structure and its properties that §§3.2–3.4 plan for another class of weak equivalences (R02); open pull request #1807 revises §G2.1; the description asks the maintainers to choose.
- **Scope.** About 90 of about 165 locators are to Kerodon, an online text without a refereed edition; the same results are cited in May, Goerss–Jardine, Quillen and Moss (arXiv:1506.04887).
- **Licence.** HTT was read from the author's page and Kerodon from kerodon.net; neither host is in a licence class of the sources service, and both were classed by hand as author pages.
- **Not tested.** `Suggested.lean` needs Tau Ceti `8b9f13d993` or later, which this repository does not pin; it was not elaborated in this review.
