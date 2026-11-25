# Review of ExactPenalties (pull request #2193 at 46ad0b3)

**Verdict:** needs changes

**Summary.** Needs changes: the files are as the previous review read them, and the rewritten description declines both findings rather than repairing them, so both stand. The hypotheses of 1.3 are narrower than the theorem (a global oscillation bound, unit gap, ℝ only) and exclude an exact-cover instance stated as a Check in QuantumOptimization §1.4 on main; and the roadmap is still one lemma whose complete proof elaborates at the pins. One small correction to the description, no format notes. Whether the deliberately small scope is acceptable is left to the human reviewers, as the description asks.

## R01 (P2) — The hypotheses of 1.1–1.3 are narrower than the theorem: a global oscillation bound, unit gap, ℝ only, and a redundant `0 ≤ B`

A consumer whose threshold is sharp cannot use 1.3. QuantumOptimization §1.4 on main states exactness of the exact-cover energy `A Σ_a (1 − #{i | x i, a ∈ S i})² + B·#x` for `A > |α|·B`, with the Check `α = {1,2}`, `S = ({1},{2},{1,2})`, `A = 3`, `B = 1` (its README line 197). There `f = #x` takes the values `0..3` on `D = {0,1}³`, so the bound of `## Conventions` ("`f x - f y ≤ B` for every ordered pair `x,y ∈ D`", README line 26) forces `B ≥ 3 = ρ` and "`B < ρ`" (line 23) fails; yet the penalized energies are 1 at `{S₃}`, 2 at `{S₁,S₂}`, and 4, 4, 5, 5, 6, 9 at the six infeasible points, so the penalized minimizer is `{S₃}`, which is also the minimizer of `f` on `F`. The same happens on `D = ℕ`, `P x ↔ x = 0`, `f = id`, `w 0 = 0`, `w n = 1` otherwise, `ρ = 1`: both minimizer sets are `{0}` and no `B` exists. Separately, `0 ≤ B` (line 23, `hB` in `Suggested.lean` line 23) follows from the bound at `x = y` when `D` is nonempty and is not needed when it is empty. The description now lists "Broader scalar/gap … developments" as outside the scope; that states the restriction, it does not remove it, and the general form costs nothing extra.

The smallest change: in `## Conventions`, let `R` be a linearly ordered commutative ring (`[CommRing R] [LinearOrder R] [IsStrictOrderedRing R]`; ℝ the main case), `ρ δ : R` with `0 ≤ ρ`, `w x = 0` on `F`, `δ ≤ w x` on `D \ F`. State 1.1 for feasible `y` and infeasible `x` with `f y − f x < ρ * δ`. State 1.2–1.3 under: some `y₀ ∈ F` has `f y₀ − f x < ρ * δ` for every `x ∈ D \ F`; conclusion `a ∈ D ∧ IsMinOn (fun x ↦ f x + ρ * w x) D a ↔ a ∈ F ∧ IsMinOn f F a`. Restate `isMinOn_penalized_iff` so, and shorten the exclusions of `## Scope and ownership` (lines 104–108) accordingly. I proved this form again at the pins and derived the present statement from it (`R = ℝ`, `δ = 1`, `y₀` the feasible witness). It covers the exact-cover instance with `y₀ = {S₃}` (`f y₀ − f x ≤ 1 < 3`) and the ℕ instance with `y₀ = 0`.

## R02 (P2) — The roadmap is one elementary lemma with a complete proof at the pins, so it plans nothing that remains to be built

A roadmap plans a library, and `Suggested.lean` states results the finished roadmap will be able to prove. Here Layer 1 is the whole roadmap, no object is defined, and the single headline ("Build a small global exact-penalty API", README line 3; `Suggested.lean` lines 21–29) has a proof of about fifty lines from the definition of `IsMinOn` and `linarith`: it elaborates at the pins with no message (through the general form of R01). The theory the title names is excluded at README lines 104–108, and the description now excludes it as well ("metric-distance, and Lagrangian-saddle developments are outside the submitted scope").

The smallest change that makes this a roadmap: keep R01's gap penalty as Layer 1 and add layers that need building, each with source locators and `sorry` headlines, for example (a) distance-function exact penalization: `S` a subset of a metric space, `C ⊆ S` closed, `f` `LipschitzOnWith L` on `S`, `L < K`; then `a ∈ S ∧ IsMinOn (fun y ↦ f y + K * Metric.infDist y C) S a ∧ C.Nonempty ↔ a ∈ C ∧ IsMinOn f C a` (Clarke's exact penalization principle); (b) ℓ¹ exactness at a Lagrangian saddle point: `x*` feasible, `λ ≥ 0`, `λᵢ gᵢ x* = 0`, `x*` minimizing `f + Σ λᵢ gᵢ` on `X`; then `x*` minimizes `f + ρ Σ max(gᵢ, 0)` on `X` for every `ρ ≥ maxᵢ λᵢ`. If the scope stays at Layer 1 alone, the theorem is a direct Tau Ceti library contribution rather than a roadmap. The description asks for a human decision on the small scope; it is flagged below.

## C01 — The description's "project-owned formalization" is the author's own, not Tau Ceti's

The description says "Existing project-owned formalization is cited as secondary source material." In a Tau Ceti pull request "project" reads as Tau Ceti, but the formalisations the README cites (lines 135–141) are in the author's personal repositories `routing-penalty-adapters` and `complete-retained-library`; neither the pinned Tau Ceti nor Mathlib has the statement. "The author's own earlier formalization is cited as secondary source material" would be right.

## Previous findings

- R01 — not repaired: README lines 23–26 unchanged, "`0 ≤ B` and `B < ρ`; … `1 ≤ w x` …; `f x - f y ≤ B` for every ordered pair `x,y ∈ D`"; the description declares the wider form out of scope. Carried as R01.
- R02 — not repaired: README line 3, "Build a small global exact-penalty API"; `Suggested.lean` has one declaration; the description asks a human to judge the small scope. Carried as R02.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.3 `isMinOn_penalized_iff` (headline; cited by the description) | full proof at the pins via the general form; `simp_all [isMinOn_iff]` as one-tactic probe | proof: no message; probe: unsolved goals | true as stated; not padding by the one-tactic test; nothing left to build (R02) |
| Conventions, global bound (R01) | QuantumOptimization §1.4 Check: `α={1,2}`, `S=({1},{2},{1,2})`, `A=3`, `B=1` | `f ∈ {0,…,3}`, bound ≥ 3 = ρ; energies ∅ 6, `{S₁}` 4, `{S₂}` 4, `{S₃}` 1, `{S₁,S₂}` 2, `{S₁,S₃}` 5, `{S₂,S₃}` 5, all 9 | exact instance excluded |
| Conventions, global bound (R01) | ℕ, `P x ↔ x = 0`, `f = id`, `ρ = 1` | `g 0 = 0`, `g n = n + 1`; `f n − f 0 = n` unbounded | exact instance excluded |
| `0 ≤ B` | any `x ∈ D` | `f x − f x = 0 ≤ B` | redundant |
| R01 repair | ordered-ring form with witness `y₀`, proved at the pins; present statement derived with `δ = 1` | exact cover: `f y₀ − f x ≤ 1 < 3`; ℕ: `0 − n < 1` | repair tested |
| Description, scope sentence | README lines 20–29, 103–108; `Suggested.lean` lines 21–28 | real-valued, strict `B < ρ`, zero on feasible, `1 ≤ w` on infeasible, no attainment: all as described | description agrees |
| Description, files and pins | folder diff against the base; toolchain and manifest | three files, 192 insertions; `metadata.toml` has `math.OC`; Lean 4.36.0-rc2, Mathlib `1b1ccf4` | description agrees |

The rows for untouched statements (1.1, 1.2, the four README Checks, the empty-set cases, the source rows) stand as in the previous review, of `46ad0b3`.

- Source locators checked against the text: none again this round (no passage of the folder changed); the sampled 1.1–1.3 locators stand as the previous review of this same head read them in [B21] (corrected edition) and [H21].
- Library declarations opened at the pin: `IsMinOn` (`Mathlib/Order/Filter/Extr.lean` lines 111–113, membership of the candidate not included) and `isMinOn_iff` (lines 129–130).
- Elaboration: `Suggested.lean` gives one warning, `declaration uses 'sorry'`, at 21:8; the elaborated type of `isMinOn_penalized_iff` matches README 1.3 with `## Conventions`, all binders explicit.
- Automatic checks: all passed. Dependency check: `depcheck: 122 roadmaps, 1385 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Cross-roadmap citations: none in the README. QuantumOptimization §1.4 (used in R01) resolved on main, README lines 182–204. Changes outside the folder: none.
- Pull request text read against this head, every sentence: title, milestones, scope, files, sources, pins and head hash agree with the head; one wording slip (C01); the CI and process sentences are under Not verifiable.
- Overlap check: read FiniteAffineBoundTightening, ConvexLifting, QuantumOptimization (main), BoundedConicHulls, SupportVectorMachines (open); nothing shared. QuantumOptimization §1.4 owns specific penalty formulations, not the abstract comparison; NonlinearProgrammingOptimality (open, README line 486) does not state exact penalty functions.

Source independence: changed passages only; the folder has no changed passage and the description quotes no source; 0 new passages compared; largest share [B21], 4 of 7 locators; arrangement not compared again (no layer added, removed or reordered).

Research link: Layer 1 abstracts the sufficient-penalty proposition of Harwood, Gambella, Trenev, Simonetto, Bernal and Greenberg (2021, Appendix B, Prop. 1) and Bernal Neira's thesis (2021, Prop. 10.B.1), in the line of QUBO penalty formulations of Lucas (2014); rests on the README's references and on [H21] and [B21] as read.

## Not verifiable

- [B21], printed pp. 414–416 of the May 2021 thesis: the readable copy is the author's corrected edition (November 2026), where Proposition 10.B.1 is on its printed p. 278; the 2021 pagination could not be checked.
- [G22] (Díez García, Ayodele and Moraglio, GECCO Companion 2022, §§2–3): not readable from a legal place.
- The description's statements about hosted CI runs, the topic checker, the models used and the author's approval: process facts, not checked from the files.

## Source issues

- **Misprint** in H21 at Appendix B, proof of Proposition 1, PDF p. 16: the source says ρ is the smallest value the penalty term takes at an infeasible point; it should be that ρ is a lower bound, equality need not occur on a given instance; affects nothing.
- **Misprint** in H21 at Appendix B, proof of Proposition 1, PDF p. 16: the source says the minimum over the superset must be less; it should be less than or equal; affects nothing.

## For the human reviewers

- Scope: the roadmap is one lemma (README 1.3) with a fifty-line proof at the pins; the description says the small real-valued unit-gap scope is deliberate and requests a human decision on it. R02 depends on that decision.
- Scope: the sources for the headline are appendices of the author's thesis [B21] and of [H21]; [G22] was not readable.
- Licence: README line 135 cites the author's own formalisation (bernalde/routing-penalty-adapters, `Chapter10IntegerPenalty.lean`); its licence and its relation to `Suggested.lean` were not examined.
- Not tested: [B21] was read only in the author's corrected edition of November 2026, not the 2021 thesis the README cites; pagination differs.
