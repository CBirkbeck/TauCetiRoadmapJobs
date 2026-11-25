# Review of ExactPenalties (pull request #2193 at 46ad0b3)

**Verdict:** needs changes

**Summary.** Needs changes: this head only reorders the README's sections (Scope and Exact supplier contracts moved after the layers), so the two findings of the previous review stand unchanged. The hypotheses of 1.3 are narrower than the theorem (a global oscillation bound, unit gap, ℝ only), and they now demonstrably exclude an exact-cover instance stated as a Check in QuantumOptimization §1.4 on main; and the roadmap still consists of one lemma whose complete proof elaborates at the pins. No small corrections or format notes. The description asks a human to decide whether the deliberately small scope is acceptable; that question is recorded for the human reviewers.

## R01 (P2) — The hypotheses of 1.1–1.3 are narrower than the theorem: a global oscillation bound, unit gap, ℝ only, and a redundant `0 ≤ B`

A consumer whose threshold is sharp cannot use 1.3. QuantumOptimization §1.4 on main states exactness of the exact-cover energy `A Σ_a (1 − #{i | x i, a ∈ S i})² + B·#x` for `A > |α|·B`, and gives the Check `α = {1,2}`, `S = ({1},{2},{1,2})`, `A = 3`, `B = 1`. There `f = #x` ranges over `0..3` on `D = {0,1}³`, so the bound of `## Conventions` ("`f x - f y ≤ B` for every ordered pair `x,y ∈ D`", README line 26) forces `B ≥ 3 = ρ`, and "`B < ρ`" (line 23) fails; yet the penalized minimizer is the single set `{1,2}` (value 1; the other exact cover has value 2, every infeasible point at least 3), which is also the minimizer of `f` on `F`. The same happens on `D = ℕ`, `P x ↔ x = 0`, `f = id`, `w 0 = 0`, `w n = 1`, `ρ = 1`: both minimizer sets are `{0}` and no `B` exists. The proofs cited from [B21] and [H21] themselves bound only the difference feasible-minus-infeasible. Finally `0 ≤ B` (line 23, `hB` in `Suggested.lean` line 23) follows from the bound at `x = y` once `D` is nonempty, and is not needed when it is empty.

The smallest change: in `## Conventions`, let `R` be a linearly ordered commutative ring (`[CommRing R] [LinearOrder R] [IsStrictOrderedRing R]`; ℝ the main case), `ρ δ : R` with `0 ≤ ρ`, `w x = 0` on `F`, `δ ≤ w x` on `D \ F`. State 1.1 for feasible `y` and infeasible `x` with `f y − f x < ρ * δ`. State 1.2–1.3 under: some `y₀ ∈ F` has `f y₀ − f x < ρ * δ` for every `x ∈ D \ F`; conclusion `a ∈ D ∧ IsMinOn (fun x ↦ f x + ρ * w x) D a ↔ a ∈ F ∧ IsMinOn f F a`. Restate `isMinOn_penalized_iff` so, and shorten the exclusions of `## Scope and ownership` (lines 104–108) accordingly. I proved this form at the pins, and derived the present statement from it (case `R = ℝ`, `δ = 1`; when `F = ∅` both sides are false). It covers the exact-cover instance with `y₀ = {1,2}` (`f y₀ − f x ≤ 1 < 3`) and the ℕ instance with `y₀ = 0`.

## R02 (P2) — The roadmap is one elementary lemma with a complete proof at the pins, so it plans nothing that remains to be built

A roadmap plans a library; `Suggested.lean` is meant to state results the finished roadmap will be able to prove. Here Layer 1 is the whole roadmap, no object is defined, and the single headline ("Build a small global exact-penalty API", README line 3; `Suggested.lean` lines 21–29) has a proof of about fifty lines from `isMinOn_iff` and `linarith`: I elaborated one at the pins (via the general form of R01) with no message. The exact-penalization theory the title names is excluded at lines 104–108.

The smallest change that makes this a roadmap: keep R01's gap penalty as Layer 1 and add layers that need building, each with source locators and `sorry` headlines, for example (a) distance-function exact penalization: `S` a subset of a metric space, `C ⊆ S` closed, `f` `LipschitzOnWith L` on `S`, `L < K`; then `a ∈ S ∧ IsMinOn (fun y ↦ f y + K * Metric.infDist y C) S a ∧ C.Nonempty ↔ a ∈ C ∧ IsMinOn f C a` (Clarke's exact penalization principle); (b) ℓ¹ exactness at a Lagrangian saddle point: `x*` feasible, `λ ≥ 0`, `λᵢ gᵢ x* = 0`, `x*` minimizing `f + Σ λᵢ gᵢ` on `X`; then `x*` minimizes `f + ρ Σ max(gᵢ, 0)` on `X` for every `ρ ≥ maxᵢ λᵢ`. If the scope stays at Layer 1 alone, the theorem is a direct Tau Ceti library contribution rather than a roadmap. The description says the small scope is deliberate and asks for a human decision; it is flagged below.

## Previous findings

- R01 — not repaired: README lines 23–26, "`0 ≤ B` and `B < ρ`; … `1 ≤ w x` …; `f x - f y ≤ B` for every ordered pair `x,y ∈ D`"; the exclusions now stand at lines 104–108, unchanged. Carried as R01.
- R02 — not repaired: README line 3, "Build a small global exact-penalty API"; `Suggested.lean` is unchanged, one declaration. Carried as R02.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 Strict comparison (sampled) | [B21] corrected edition, proof of Prop. 10.B.1; [H21] line 1634 | infeasible penalty ≥ ρ; `−c·(x†−x*) ≤ ‖c‖₁`; gives `−‖c‖₁ + ρ < 0`, contradiction with `ρ > ‖c‖₁` | source supports 1.1; bound used is feasible-minus-infeasible only |
| 1.2 Feasibility of a minimizer (sampled) | [B21] converse; [H21] lines 1638–1660 | infeasible minimizer vs feasible witness: `−‖c‖₁ + ρ ≤ 0`, contradiction | matches |
| 1.3 Exact correspondence (sampled, headline) | [B21] Prop. 10.B.1 statement; [H21] lines 1603–1610 | left: "minimizes H and the problem is feasible"; right: "solves the problem"; same three-conjunct shape | matches |
| Conventions, global bound (R01) | QuantumOptimization §1.4 Check: `α={1,2}`, `S=({1},{2},{1,2})`, `A=3`, `B=1` | `f ∈ {0,…,3}` so bound ≥ 3 = ρ, hypothesis fails; energies: `{S₃}` 1, `{S₁,S₂}` 2, infeasible ≥ 3; minimizer `{S₃}` on both sides | exact instance excluded |
| Conventions, global bound (R01) | ℕ, `P x ↔ x = 0`, `f = id`, `ρ = 1` | `g 0 = 0`, `g n = n+1`; `f n − f 0 = n` unbounded (proved at the pins) | exact instance excluded |
| `0 ≤ B` | any `x ∈ D` | `f x − f x = 0 ≤ B` | redundant |
| R01 repair | general ordered-ring form proved at the pins; present statement derived from it; exact cover with `y₀ = {S₃}`; ℕ with `y₀ = 0` | `f y₀ − f x ≤ 1 < 3`; `0 − n < 1`; no elaboration message | repair tested |
| 1.3, one-tactic probe | `simp_all [isMinOn_iff]`, `grind [isMinOn_iff]` | both fail | not padding by that test |
| R02 headline | full proof at the pins (general form, then specialisation) | no error, no `sorry` | nothing left to build |

The rows for untouched statements (the three README Checks, the empty-set cases, the R02 layer suggestions) stand as in the previous review, of `4729ee9`.

- Source locators checked against the text: [H21] Appendix B, Proposition 1, PDF pp. 16–17 (its text, lines 1591–1660): correct. [B21] Proposition 10.B.1: statement and proof read in the author's corrected edition of November 2026 (its text, lines 13412–13470); the content supports 1.1–1.3 as abstractions; the 2021 printed pages are under Not verifiable.
- Library declarations opened at the pin: `IsMinOn` and `isMinOn_iff` (`Mathlib/Order/Filter/Extr.lean` lines 111–113, 129–130), used in the probe proofs.
- Elaboration: `lake env lean` on `Suggested.lean` gives one warning, `declaration uses 'sorry'`, at 21:8. The elaborated type of `isMinOn_penalized_iff` matches README 1.3 with `## Conventions`; all binders are explicit.
- Automatic checks: all passed. Dependency check: `depcheck: 122 roadmaps, 1386 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Cross-roadmap citations: none in the README. Changes outside the folder: none.
- The diff since `4729ee9` moves `## How to read the build` before `## Conventions` and `## Scope and ownership` and `## Exact supplier contracts` after `## Downstream consumers`, and changes "used below" to "used in Layer 1"; no statement, locator or layer changes.
- Pull request text read against this head: no sentence is contradicted (the CI sentence names head `4729ee9` explicitly).
- Overlap check: read FiniteAffineBoundTightening, ConvexLifting, QuantumOptimization (main), BoundedConicHulls, SupportVectorMachines (open); nothing shared. QuantumOptimization §1.4 owns specific penalty formulations (independent set, vertex cover, exact cover) and SupportVectorMachines §3.2 a specific soft-margin exactness; neither states the abstract comparison. NonlinearProgrammingOptimality (open) explicitly leaves exact penalties to this roadmap.

Source independence: changed passages only; the diff adds no new prose (three sections moved, one phrase changed); 1.1–1.3 compared with 2 sources ([B21] corrected edition, [H21]), none shared; largest share [B21], 4 of 7 locators; arrangement not compared again (no layer added, removed or reordered).

Research link: Layer 1 abstracts the sufficient-penalty proposition of Harwood, Gambella, Trenev, Simonetto, Bernal and Greenberg (2021, Appendix B, Prop. 1) and Bernal Neira's thesis (2021, Prop. 10.B.1), in the line of QUBO penalty formulations of Lucas (2014); rests on the README's references and on [H21] and [B21] as read.

## Not verifiable

- [B21], printed pp. 414–416 of the May 2021 thesis: the readable copy is the author's corrected edition (November 2026, on the author's own page), where Proposition 10.B.1 is on its printed p. 278; the 2021 pagination could not be checked.
- [G22] (Díez García, Ayodele and Moraglio, GECCO Companion 2022, §§2–3): not readable from a legal place (publisher page refused, as in the previous review).

## Source issues

- **Misprint** in H21 at Appendix B, proof of Proposition 1, PDF p. 16: the source says ρ is the smallest value the penalty term takes at an infeasible point; it should be that ρ is a lower bound, equality need not occur on a given instance; affects nothing.
- **Misprint** in H21 at Appendix B, proof of Proposition 1, PDF p. 16: the source says the minimum over the superset must be less; it should be less than or equal; affects nothing.

## For the human reviewers

- Scope: the roadmap is one lemma (README 1.3) with a fifty-line proof at the pins; the description says this small real-valued unit-gap scope is deliberate and requests a human decision on it. R02 depends on that decision.
- Scope: the sources for the headline are appendices of the author's thesis [B21] and of [H21]; [G22] was not readable.
- Licence: README line 135 cites the author's own formalisation (bernalde/routing-penalty-adapters, `Chapter10IntegerPenalty.lean`); its licence and its relation to `Suggested.lean` were not examined.
- Not tested: [B21] was read only in the author's corrected edition of November 2026, not the 2021 thesis the README cites; pagination differs.
