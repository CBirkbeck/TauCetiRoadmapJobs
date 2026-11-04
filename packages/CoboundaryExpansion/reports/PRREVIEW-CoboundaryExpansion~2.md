# Review of CoboundaryExpansion (pull request #1752 at f325947)
**Verdict:** needs changes

:robot: Independent AI review of `TauCetiRoadmap/CoboundaryExpansion/` at `f32594761bf25f7fddd67b5295716caca70fc5cc`, a full re-review after the repair of `0126544`. The pull request files were not changed. One blocking finding (a missing hypothesis in two Layer 2 statements) and three notes; everything else the previous review raised is repaired, and the headline mathematics checks out on every instance computed below.

## Status of the previous review's findings

| Id | Finding at `0126544` | Status at `f325947` |
| --- | --- | --- |
| R01 (P1) | degree 1 made `h1Sym` zero | **Repaired.** `h1Sym X = ⨅ n : ℕ, h1 X (movedNorm (Fin (n + 2)))` (`Suggested.lean:165`); README Conventions "Degrees" and the 3.4 negative-control Check. |
| R02 (P1) | build gate failed on the module-system warning | **Repaired.** `module` / `public import Mathlib` header; the worker's gate records `build=0 … OK`; my elaboration of the scaffold gives 12 `sorry` warnings and nothing else. |
| R03 (P2) | "exactly when `k` is not a power of two" asserted Kozlov's conjecture | **Repaired.** README 16–17: "For `𝔽₂` and `k ≥ 3` not a power of two, Kozlov proves that the bound is attained"; 7.4 "Nothing is asserted at powers of two"; references list Conjecture 5.1 as unused. |
| R04 (P2) | `h1Err` lacked positive-distance and degree domains | **Repaired.** `h1Err` (`Suggested.lean:272`) quantifies over degrees `n + 2`, requires `0 < α.gaugeDistErr`, numerator `defect / (n + 2)`; gauge degrees `m + 2`; README 9.2 and its identity-cochain Check. |
| R05 (P2) | `movedNorm` had sorried law fields | **Repaired.** All four fields proved (`Suggested.lean:57`–67); gate `sorry-data=0`. |
| R06 (P2) | sorried `parityRetract` bundle | **Repaired.** Deleted from the Lean file; README 1.4 keeps it as a target. |
| R07 (P2) | `complete` had sorried fields | **Repaired.** Real proofs via `Finset.mem_powersetCard` (`Suggested.lean:100`–105). |
| R08 (P2) | branch-and-bound search and `decide +kernel` as targets | **Repaired.** Scope excludes "any search procedure, decision procedure or evaluation strategy" (README 53–55); 6.3 states the minima as theorems about cochains. |
| R09 (P2) | second owner of the finite 2-complex | **Repaired.** README 43–47 and 2.1 make `TwoComplex V` the `r = 3` specialization of Regularity Layer 5's `HypergraphComplex` with conversion and round-trip targets; resolved on main (below). |
| R10 (P2) | replication, normalized, all-degree and cross-degree headlines absent | **Repaired.** `Cochain.defect_replicate`, `Cochain.gaugeDist_replicate`, `h1Norm_complete_movedNorm_fin_three`, `h1Sym_complete`, `h1Err_complete` are stated. |
| R11 (P3) | one-lemma conjugation invariance | **Repaired.** Deleted; README 1.3 cites `Equiv.Perm.card_support_conj`. |
| R12 (P3) | README shape | **Repaired.** Nine layers with `### k.n` targets, `*Needs:*` lines, `**Checks.**` blocks, Examples and Dependencies, Summary, Scope, Conventions, supplier contracts, Downstream consumers. |
| R13 (P3) | locators | **Repaired.** Every cited work carries the version read and claim-level locators; all resolved below. The previous review's misprint in Beasley §3.1 is recorded in the References entry. |

## R01 (P2) — 2.4 and 2.5 drop the conjugation-invariance hypothesis

**Location:** `TauCetiRoadmap/CoboundaryExpansion/README.md:311`: "`defect (β • α) = defect α`"; and `README.md:326`–328: "the minimum over gauges with `β v₀ = 1` equals `gaugeDist`, because a constant right factor conjugates every edge term".

**Claim:** Both hold for the `ℓ : GroupNorm G` of the Conventions, with no further hypothesis in the sentence (2.3 is written "Under a conjugation-invariant norm"; 2.4 and 2.5 are not, and 5.2 shows the README does mean to state some results for every group norm).

**Witness:** Take the weighted word norm on `Sym(3)` from the 1.1 Check (`t ↦ 1`, `s ↦ 2`, so `ℓ = 0, 1, 2, 3, 3, 4` on `e, t, s, c, c⁻¹, r`), a `GroupNorm` that is not conjugation invariant. On `complete (Fin 3)` put `α 0 2 = s⁻¹`, identity elsewhere, so the holonomy `α 0 1 · α 1 2 · α 2 0 = s` and `defect α = 2`. The constant gauge `β ≡ c` gives holonomy `c⁻¹ s c = t` and `defect (β • α) = 1 ≠ 2`. For the same cochain the minimum cost over all gauges is `1`, while the minimum over gauges with `β 0 = e` is `2`. Both values were computed by exhausting all `216` gauges.

**Repair:** In 2.4 write "for conjugation-invariant `ℓ`, `defect (β • α) = defect α`" (the cost identity and `gaugeDist (β • α) = gaugeDist α` hold for every group norm and may stay unconditional). In 2.5 state the root-fixing minimum "for conjugation-invariant `ℓ`". In 3.2, which cites 2.3 for relabelling invariance, say the same once. Add the instance above as a negative-control Check in 2.4 (defect `2` versus `1`) and in 2.5 (minimum `1` versus root-fixed `2`). Retested on the moved-point norm: the same cochain keeps `defect = 2` under every constant gauge and has minimum `2` both ways, so the corrected statements are consistent with every other Check of Layer 2.

## R02 (P3) — Three API lemmas in the acceptance file

**Location:** `Suggested.lean:72` `hammingDist_eq_movedNorm`; `:143` `Cochain.gaugeDist_eq_zero_iff`; `:170` `h1Sym_le_h1_fin_two`.

**Claim:** These are headline theorems.

**Witness:** None is listed among the headlines in the module docstring or the README's end-theorem list. `h1Sym_le_h1_fin_two` is the `n = 0` term of the definition of `h1Sym` plus nonnegativity of `h1`; the other two are the library bridge of 1.3 and the finite-coefficient API of 2.5. One-tactic probes (`simp` with the unfolded definitions; `exact ciInf_le …`) did not close them, so they are not one-liners, but the file's contract is headlines only.

**Repair:** Delete the three from `Suggested.lean`; the README already carries each as a target (1.3, 2.5, 3.4). Not a blocker.

## R03 (P3) — Docstrings versus the README's conventions and headline list

**Location:** `Suggested.lean:276`: "Chapman–Lubotzky's cross-degree constant of the complete complex is `k/3`"; `Suggested.lean:8`–22 (module docstring).

**Claim:** The stated value is the Chapman–Lubotzky constant; the docstring lists the roadmap's headlines.

**Witness:** Chapman–Lubotzky II, Proposition 3.2 and Remark 3.3 (chapman-lubotzky-ii lines 335–337, 364), state the normalized value `(d+1)/(d−1) = k/(k−2)`; `k/3` is this roadmap's counting convention (README Conventions, "The constant"). The README's end-theorem list (lines 21–24) also names `card_div_three_le_h1`, `Cochain.defect_replicate` and `Cochain.gaugeDist_replicate`, which the docstring's list omits; and the docstring calls the file "suggested, non-exhaustive signatures" where the house form says it states the headline theorems against the pinned APIs.

**Repair:** Say "in the counting convention of the README" in the `h1Err_complete` docstring (and that the normalized value is `k/(k−2)` by 3.3), add the three Layer 4–5 end theorems to the module docstring's list, and drop "suggested, non-exhaustive". Not a blocker.

## Verified sound

**Gate and scope.** The worker's gate at this head passes every check (`set_option=0 … sorry-data=0 … depcheck=0 … build=0 OK`). The diff against `origin/main` outside `TauCetiRoadmap/CoboundaryExpansion/` is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml` (`topic = "math.CO"`). The worktree is clean at `f325947`.

**Elaboration.** A scratch copy of `Suggested.lean` with `#check @name` for all 29 declarations elaborated under `lake env lean` with exactly 12 `declaration uses sorry` warnings (the 12 sorried theorems) and no other diagnostic. The two binders the worker's signature scan flagged as dropped (`[Fintype V]` on `Cochain` and on `Cochain.IsCoboundary`) are benign: neither type mentions a finite sum or infimum, and every consumer (`defect`, `cost`, `gaugeDist`, `h1`, the headlines) retains `[Fintype V]`. `[Finite G]` survives on `gaugeDist_eq_zero_iff`; `IsConjInvariant ℓ` on both star-bound statements; `3 ≤`/`4 ≤ Fintype.card V` and `¬ ∃ a, card = 2 ^ a` on the headlines. A `rfl` probe confirmed `h1Norm X ℓ = ((X.edges.card : ℝ) / (X.triangles.card : ℝ)) * h1 X ℓ`, so the normalizing factor is real division of casts, not natural-number division. A `simp` probe closed `h1 X ℓ = 0` for a subsingleton `G`, confirming the 3.1/3.4 degenerate-case Checks. No `set_option`, no extra import, no `lemma`, no `True` placeholder, no sorried data; the single import is `public import Mathlib` under `module`.

**Dependency check** (the prescribed command, this head, `--movable`):

```text
depcheck: 205 roadmaps, 1658 edges, 0 problem(s)
```

No `UPWARD`, `CYCLE` or `moved:` line. The only cross-roadmap citation is Regularity Layer 5, on main (`929496d`): `TauCetiRoadmap/Regularity/README.md:249`–263 ("Layer 5 — hypergraph complexes") and `TauCetiRoadmap/Regularity/Suggested.lean:305` (`structure HypergraphComplex (r : ℕ) (V : Type*)`), `:314` (`toPreAbstractSimplicialComplex`), `:334` (`ofPreAbstractSimplicialComplex`), `:353` and `:359` (the two round trips). The level-`k` faces are `k`-sets with downward closure and the empty face, exactly as README 158–161 describes; the `TwoComplex → HypergraphComplex 3` map must add the singletons, which 2.1 says. Regularity is on main, so the edge is downward. No declared gap; none needed.

**Ownership.** `roadmaps grep` over the 440 open pull requests and main for "coboundary expan", "Cheeger constant", "cosystol", "Linial", "HypergraphComplex", "movedNorm", "staircase", "TwoComplex": the only hits for the expansion objects are this roadmap; `TwoComplex` elsewhere is EnhancedDerivedSheaves' `zmodFourTwoComplex` (a chain complex, unrelated) and `HypergraphComplex` is Regularity's. The five board packages of the index (AnalyticNumberTheory, AutomorphicCongruences, KatoEulerSystems, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory) are number-theoretic; none can own a cochain Cheeger constant. This roadmap is the owner of conjugation-invariant norms, group-valued 1-cochains on finite 2-complexes, their gauge distance and Cheeger constants, replication and the complete-complex values.

**Pinned declarations opened** (Mathlib `f6090c70`, Tau Ceti `358314d4`, both equal to `lake-manifest.json`): `GroupSeminorm`/`GroupNorm` `Mathlib/Analysis/Normed/Group/Seminorm.lean:76`, `:110`, the `Add (GroupNorm E)` instance `:728`; `Equiv.Perm.IsSwap` `Mathlib/GroupTheory/Perm/Support.lean:192`, `support_eq_empty_iff :265`, `support_one :270`, `support_mul_le :285`, `support_inv :306`, `card_support_eq_two :584`, `card_support_conj :660`; `Equiv.Perm.sign` `Mathlib/GroupTheory/Perm/Sign.lean:357`, `IsSwap.sign_eq :395`; `hammingDist` `Mathlib/InformationTheory/Hamming.lean:41`; `Finset.powersetCard` `Mathlib/Data/Finset/Powerset.lean:197`, `mem_powersetCard :201`, `card_powersetCard :211`; `Finset.sum_comm` (additive of `prod_comm`) `Mathlib/Algebra/BigOperators/Group/Finset/Sigma.lean:121`; `Finset.sum_le_sum` `Mathlib/Algebra/Order/BigOperators/Group/Finset.lean:116`–121; `Finset.inf'` (dual of `sup'`) `Mathlib/Data/Finset/Lattice/Fold.lean:528`–531; `toLex`/`ofLex` `Mathlib/Order/Lex.lean:52`, `:57`; `SimpleGraph.fromRel` `Mathlib/Combinatorics/SimpleGraph/Basic.lean:135`; `SimpleGraph.edgeFinset` `Mathlib/Combinatorics/SimpleGraph/Finite.lean:58`; `PreAbstractSimplicialComplex`/`AbstractSimplicialComplex` `Mathlib/AlgebraicTopology/SimplicialComplex/Basic.lean:51`, `:154`; `Real.sInf_empty` `Mathlib/Algebra/Order/Archimedean/Real/Basic.lean:189`. Every name in the supplier contracts exists at the pin with the role the README gives it. No Tau Ceti module is imported; the README's statement about `hammingDist_eq_hammingNorm_sub` was checked by the previous review at `TauCeti/InformationTheory/Hamming.lean:96` and the file is unchanged at this pin.

**Sources** (all read from the worker's cache; page numbers are the `=== page N ===` markers of the versions cited):

| Target | Locator | Found |
| --- | --- | --- |
| 1.1, 2.2 convention | chapman-lubotzky-i §5.1, pp. 15–16, lines 587–609 | Antisymmetric 1-cochains `α(c̄) = α(c)⁻¹`, bi-invariant metric, `δα(e) = α(x)⁻¹α(y)`, holonomy as the product along a polygon. Supports the convention and the stated `β ↦ β⁻¹` difference. |
| 3.4 | chapman-lubotzky-ii footnote 2, p. 1, line 42 | `𝔽₂` constants bounded below by the permutation constants. |
| 3.4, 9.2 | chapman-lubotzky-ii (2.8), pp. 6–7, lines 230–255 | Coboundary constant over `α ∉ B¹`; the permutation union starts at `n = 2`. |
| 9.1 | chapman-lubotzky-ii (2.9), p. 6, lines 241–243 | `1 − #{i ∈ [n] : σ(i) = τ(i)}/N` for `σ ∈ Sym(n)`, `τ ∈ Sym(N)`, `N ≥ n`; the README's `min`/`max` form is its symmetrization. |
| 4.1, 4.2 | chapman-lubotzky-ii Prop. 3.2 and Remark 3.3, pp. 8–9, lines 335–366 | Complete complex on `d+1 ≥ 3` vertices, `h₁(X, Sym) ≥ (d+1)/(d−1)`, star spanning tree, holonomies conjugate; `k/(k−2)` normalized is `k/3` counting. |
| 4.1 | beasley Prop. 1, pp. 2–3, lines 87–116 | Star identity for any group with a bi-invariant metric; `Σ_x cost(β_x) = 3N`, `D ≤ 3N/k`. |
| 4.3 | beasley Cor. 2, p. 3, lines 119–122 | Equality iff every star gauge is optimal, for `α ∉ B¹`. |
| 6.3 | beasley Thm. 4, pp. 3–4, lines 130–135; Appendix A, p. 19, lines 860–872 | The four witnesses agree edge for edge and value for value with the README table. |
| 6.1, 6.4 | beasley Prop. 5, pp. 4–5, lines 172–200 | Seed `N = 8`, `D = 6`; subgroup values `2` and `3/2`. |
| 5.1, 5.2 | beasley Lemma 6, pp. 6–7, lines 245–286 | `N ↦ q³N`, `D ↦ q²D` for any bi-invariant coefficient group; the section double count with `q^k` sections and `q^(k−2)` per inter-cluster edge; near-optimal gauges for infinite groups. The README's Lean form drops even bi-invariance, which the double count never uses (checked below). |
| 6.2, 8.1 | beasley Cor. 7 and Thm. 8, pp. 7–8, lines 287–300 | Multiples of four by replication; otherwise Kozlov's witness with values in `Sym(3)`. |
| 9.3, 9.4 | beasley Prop. 10, pp. 8–9, lines 332–380 | Lower bound by the same-degree star gauge; baselines `1/3` and `1 − 3/m`; seed minima `10/3, 2, 3`; section count independent of gauge degree; the inequality `q(4t²+4t+3) ≥ 6t+3`. |
| 7.3 | kozlov Def. 3.2, p. 6, lines 255–263 | `G_n(λ)`: `l = λ₁` left vertices, `t` right vertices, `n − l − t` isolated, `v_i ~ w_j ⟺ λ_j ≥ i`; for `λ = c·cor(t)` this is the README's `i < c·(t − j/c)` in zero-based indices, with `c` isolated vertices. |
| 7.3 | kozlov Lemma 3.8, p. 8, lines 351–356; Cor. 3.13, p. 11, lines 513–519 | Legal partitions give cut-minimal staircase graphs; `N(cλ) = c·N(λ)` when `N(λ) = N_d(λ)`, which holds for `cor(t)` (line 350). |
| 7.3 | kozlov Lemma 3.12, p. 9, lines 397–400; (2.5), p. 5, line 205; Lemma 3.10, p. 9, lines 380–384 | `|cλ| = c²|λ|`, `|E|·h(G) = |T(G)|`, `h(λ) = h(G_{N(λ)}(λ))`. |
| 7.4 | kozlov Thm. 4.2 and Cor. 4.3, p. 11, lines 534–542 | `h(n) = n/3` for `n = c(2t+1)`, `t ≥ 1`, hence for every non-power of two. Kozlov's `h₁(Δ[n]) = min_G |T(G)|/|E|` over cut-minimal `G` (Prop. 2.7, lines 208–214) is the README's `N/D` with both sides doubled. |
| 8.3 | kozlov p. 12, line 567 | `h(8) − 8/3 = 4/21`, i.e. `h(8) = 20/7`. |
| intro, 7.4 | kozlov Conj. 5.1, p. 13, line 601 | Strictness at powers of two is a conjecture; the README uses it nowhere. |
| 4.2 background | meshulam-wallach Prop. 2.1, pp. 4–5, lines 147–165 | `b(φ) ≥ n·w(φ)/(k+1)`, giving `n/3` for 1-cochains. |

**Adversarial values.** Permutations of `{0,1,2}` in one-line notation, `e = (0 1 2)`, `t = (1 0 2)`, `s = (0 2 1)`, `c = (1 2 0)`, `r = (2 1 0)`, products right to left (`t·s = c` checked). `N` and `D` are moved-point counts; gauges were enumerated with `β 0 = e` (legitimate under conjugation invariance, which is the only setting in which these values are claimed) and, where marked, over all gauges. All computations were made by an independent plain-Python checker written for this review; no external code was run.

| Statement / location | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| Seed, 6.1 | `α 1 2 = t, α 1 3 = s, α 2 3 = r` on `K₄`; all six assignments | `N = 8`; `D = 6` over `216` root-fixed and over all `1296` gauges; star costs `(6,6,6,6)`; each assignment `(8, 6)` | Keep |
| Witnesses, 6.3 | the printed `k = 5, 6, 7, 8` cochains | `(N, D) = (10, 6), (36, 18), (28, 12), (72, 27)`; ratios `5/3, 2, 7/3, 8/3 = k/3`; all `k` star costs equal `D` in each row | Keep (4.3 equality case confirmed) |
| `h1 (K₄, Sym(3)) = 4/3`, 3.1/6.1 | all `6³` gauge-fixed cochains, and all `6⁶` cochains | minimum ratio `4/3` both ways, attained at `(8, 6)` | Keep |
| Subgroups at `k = 4`, 6.4 | `{e,t}`, `A₃`, trivial, `Sym(2)`, `Sym(1)` | `2` (at `(4,2)`), `3/2` (at `(9,6)`, `α 1 3 = c, α 2 3 = c⁻¹`), empty set, `2`, empty set | Keep; `A₃` witness corrects Beasley's printed `(6,4)` |
| Replication, 5.1–5.3 | seed, `q = 2`, all `6⁷` root-fixed gauges on `K₈` | `N = 64 = 2³·8`, `D = 24 = 2²·6`, ratio `8/3 = 2·4/3` | Keep |
| `gaugeDist_replicate` without conjugation invariance, 5.2 | the section double count | `q^k·D ≤ q^(k−2)·cost_inter(β)` uses only `ℓ ≥ 0` and `ℓ(1) = 0`; `k = 0, 1` give `0 = 0` | Keep for every group norm |
| `defect_replicate`, 5.1 | triangle types | three clusters: holonomy of the base triangle, `q³` lifts; two clusters: `1·α_ij·α_ji = 1`; one cluster: `1`; `q = 0`: `0 = 0` | Keep |
| Star identity, 4.1 | seed; binary `k = 5` witness; `K₃` one `t` edge | `24 = 3·8`; `30 = 3·10`; `6 = 3·2` | Keep |
| Star bound, 4.2 | `k = 0, 1, 2`; identity cochain; trivial group at `k = 4` | `0 ≤ 0`; `0 ≤ 0`; hypothesis `∃ α, 0 < D` false, conclusion `4/3 ≤ 0` false, so the hypothesis is needed | Keep |
| 2.4 defect invariance, 2.5 root fixing | weighted word norm on `Sym(3)`, `K₃` with holonomy `s` | `defect = 2`; constant gauge `c` gives `1`; min cost `1` versus root-fixed min `2` | **R01**; under the moved norm the same instance gives `2`, `2`, `2`, `2` |
| Cost identity, 2.4 | identity edge, `β = (e, t)`, `γ = (e, s)` | `cost (β • α) γ = ℓ(t·s) = 3 = cost α (β * γ)` | Keep for every norm |
| Action order, 2.2 | `β = (e, s)`, `γ = (e, t)` | `β • (γ • α) = t·s = c = (γ * β) • α`; `(β * γ) • α = s·t = c⁻¹` | Keep |
| `gaugeDist_eq_zero_iff`, 2.5 | `K₃` one odd edge over `{e,t}`; tree with one `t` | `D = 2`, not a coboundary; `D = 0`, coboundary | Keep; `[Finite G]` present |
| `h1Norm` factor, 3.3 | `k = 3, 4, 5` | `3, 3/2, 1 = 3/(k−2)`; `k = 2` gives `1/0`, excluded by the hypothesis, Lean value `0` | Keep |
| `h1Sym`, 3.4/8.2 | `K₄` degrees 1, 2, 3; `K₆` degrees 2, 3 | `0` (empty set), `2`, `4/3`; `2`, `2`; degrees `≥ 4` are `≥ 4/3` by 4.2 with 4.4 | Keep |
| Edge-set bridge, 7.1 | one edge of `K₄`; flip an endpoint; `S = ∅` | `N = 2·2 = 4`; `|E ∆ δS| = 2`, cost `4`; cost `2·#E` | Keep |
| Cut minimality iff `D = 2#E`, 7.2 | `|E ∆ δS| = #E + (non-edges across) − (edges across)` | minimum `#E` iff every cut has non-edges ≥ edges across; star of `K₄`: `D = 0 ≠ 6` | Keep |
| Staircase, 7.3 | `(c,t) = (1,1),(1,2),(1,3),(1,4),(2,1),(2,2),(4,1)`, every cut enumerated | `#E = 1, 3, 6, 10, 4, 12, 16 = c²t(t+1)/2`; cut-minimal in all seven; `min|E ∆ δS| = #E`; odd triangles `1, 5, 14, 30, 8, 40, 64 = n·#E/3`; `N/D = n/3` | Keep |
| Kozlov's theorem, 7.4 | `h1 (K_n, 𝔽₂)` by exhausting all gauge-fixed cochains, `n = 3..7` | `1, 2, 5/3, 2, 7/3`; `n = 4` is the excluded power of two with `2 > 4/3` | Keep |
| `Sym(3)` headline, 8.1 | `k = 4, …, 8` (witnesses), `k = 8, 12` (replication) | `4/3, 5/3, 2, 7/3, 8/3`; `8/3, 4`; normalized `2, 5/3, 3/2, 7/5, 4/3 = k/(k−2)` | Keep |
| Parity retraction, 1.4/8.1 | `e, c ↦ e`; `t, s ↦ t`; `ts = c ↦ e = t·t` | norms `0 ≤ 0`, `0 ≤ 3`, `2 ≤ 2`; a 4-cycle `2 ≤ 4` | Keep; gives `D_{Sym(3)} = D_{e,t}` for `{e,t}`-valued cochains |
| `distErr`, 9.1 | `(id₂, id₃)`, `(t, id₃)`, `(t, s)`, `(id₃, id₄)`, `(id₃, id₅)` | `1/3`, `2/3`, `1 = 3/3`, `1/4`, `2/5` | Keep |
| `n·costErr = cost` at equal degree, 9.2 | five random `Sym(3)` gauges on the seed | `3·costErr = cost` in every case (`12, 15, 12, 9, 16`) | Keep |
| Seed cross-degree minima, 9.3 | gauge degrees `1, 2, 3, 4` (root-fixed; degrees 2, 3 also over all gauges) | `14/3, 10/3, 2, 3`; `m ≥ 5` baseline `6(1 − 3/m) ≥ 12/5 > 2`; `gaugeDistErr = 2` | Keep; `(8/3)/2 = 4/3` |
| Replicated seed cross-degree, 9.3 | `q = 2`, gauge degrees 2 and 3 (`2⁷`, `6⁷` root-fixed gauges) | `44/3` and `8 = 2q²`; `(64/3)/8 = 8/3` | Keep |
| Binary baseline inequality, 9.3 | `(q,t) = (1,1),(1,2),(2,1)` | `q(4t²+4t+3) = 11, 27, 22 ≥ 9, 15, 9 = 6t+3`; general `c = 1` difference `2t(2t−1) > 0` | Keep |
| `h1Err` admissibility, 9.2 | degree-3 identity cochain on `K₄` | `defect = 0`, `gaugeDistErr = 0`, excluded; Lean junk `0/0 = 0` never enters | Keep |
| Cross-degree lower bound, 9.3 | star gauge of the cochain's own degree `n` | `Σ_x costErr(star_x) = 3N/n`, so `k·gaugeDistErr ≤ 3N/n` for admissible `α` | Keep |
| Intro and 7.4 at powers of two | `n = 4, 8` | `2 > 4/3`, `20/7 > 8/3` (Kozlov p. 12); nothing claimed at `16` | Keep |

The headline inventory is the README's: the star bound (Layer 4), the two replication laws (Layer 5), Kozlov's binary value (Layer 7), the `Sym(3)` value in the counting, normalized and all-degree conventions (Layer 8), and the cross-degree value (Layer 9). All seven are stated in `Suggested.lean` at the README's generality, with the hypotheses the proofs need (`IsConjInvariant`, `∃ α, 0 < D`, `3 ≤`/`4 ≤ card`, non-power of two), and the proof routes (Beasley Thm. 8 and Prop. 10, Kozlov Cor. 4.3) were checked step by step above rather than cited. None is padding; the one-tactic probes closed none of the sorried statements.

## Not verifiable

- **Linial–Meshulam (2006), References item [linial-meshulam]:** cited by bibliographic data only, for the definition of the `𝔽₂` constant; no legal text in the cache and the previous review recorded it as paywalled. Nothing in the roadmap depends on its text.
- **Published-edition pagination:** Chapman–Lubotzky I and II, Kozlov and Meshulam–Wallach were read in the arXiv versions the README names; the README cites those versions, so no published page numbers were asserted or checked.
- **The provenance repository:** the cached GitHub README and `CoboundaryK3/Constant.lean` were not built; the README cites it as a source and not as the specification, and every numeric claim the roadmap makes was recomputed here.
- **Cross-degree infimum at degrees `≥ 5` and all-degree constants at degrees `≥ 4`:** not enumerated; covered by the baseline inequality and the star bound, both checked as proofs.

## Source issues

- **Misprint** in kozlov at (2.4), printed p. 5: the source writes the set of odd triangles as a set of vertex–edge pairs with the edge in the graph, which counts a triangle with three graph edges three times; it should be the set of odd triangles, as the surrounding sentence and the identity with the sum of the weights say; affects nothing here (staircase graphs are bipartite).
- **Misprint** in beasley at §3.1, printed p. 5: the source says the two-3-cycle witness on `K₄` pays defect `6` against gauge cost `4`; it should be defect `9` against gauge cost `6`, ratio `3/2` unchanged; affects nothing (the README's 6.4 already records the correct values).
