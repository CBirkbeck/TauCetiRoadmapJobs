# Review of ExactPenalties (pull request #2193 at 4729ee9)

**Verdict:** needs changes

## R01 (P2) — The hypotheses are narrower than the theorem: a global oscillation bound, unit gap, ℝ only, and a redundant `0 ≤ B`

**Location:** README.md:23–26, "`0 ≤ B` and `B < ρ`; … `1 ≤ w x` …; `f x - f y ≤ B` for every ordered pair `x,y ∈ D`"; README.md:12–16; `Suggested.lean:22–26`.

**Claim:** 1.3 holds over any linearly ordered commutative ring and any gap `δ`, with the threshold needed only between one feasible point and the infeasible ones. The global bound excludes exact instances. `0 ≤ B` follows from the bound at `x = y`.

**Witness:** `D = ℕ`, `P x ↔ x = 0`, `f = id`, `w 0 = 0`, `w n = 1` otherwise, `ρ = 1`: both minimizer sets are `{0}`, yet `f n − f 0 = n` has no bound `B` (both proved at the pins).

**Repair:** in `## Conventions`, write: "Let `R` be a linearly ordered commutative ring (`[CommRing R] [LinearOrder R] [IsStrictOrderedRing R]`; ℝ is the main case), and let `ρ δ : R` with `0 ≤ ρ`, `w x = 0` on `F` and `δ ≤ w x` on `D \ F`."

State the targets as follows:

- **1.1:** for feasible `y` and infeasible `x` in `D` with `f y − f x < ρ * δ`, the penalized value at `y` is strictly smaller.
- **1.2–1.3:** assume that some `y₀ ∈ F` has `f y₀ − f x < ρ * δ` for every `x ∈ D \ F`. The conclusion is `a ∈ D ∧ IsMinOn (fun x ↦ f x + ρ * w x) D a ↔ a ∈ F ∧ IsMinOn f F a`.

Restate `isMinOn_penalized_iff` in this form, and delete the second and third sentences of README.md:12–16. This form is proved at the pins and covers the ℕ instance with `y₀ = 0`. The present statement is its case `R = ℝ`, `δ = 1` (when `F = ∅`, both sides are false).

## R02 (P2) — The roadmap is one elementary lemma, and this head deleted a complete proof of it

**Location:** README.md:3, "Build a small global exact-penalty API"; README.md:12–16 (exclusions); `Suggested.lean:21–29`, the only declaration.

**Claim:** A roadmap plans a library that still has to be built. This one defines no object, and its single headline has an elementary proof. The exact-penalization theory of the title is excluded at README.md:13–16.

**Witness:** the proof that this head deleted (62c675e, `Suggested.lean:27–84`) closes `isMinOn_penalized_iff` at the same pins with no message. Re-elaborated here as one self-contained proof, it also produces no message.

**Repair:** make R01's gap penalty Layer 1 and add layers that need building. Give each layer source locators, and state its headlines in `Suggested.lean` with `sorry`:

- **Layer 2: distance-function exact penalization.** Let `S` be a subset of a metric space, `C ⊆ S` closed, `f` `LipschitzOnWith L` on `S`, and `L < K`. Then `a ∈ S ∧ IsMinOn (fun y ↦ f y + K * Metric.infDist y C) S a ∧ C.Nonempty ↔ a ∈ C ∧ IsMinOn f C a` (Clarke's exact penalization principle).
- **Layer 3: ℓ¹ exactness at a Lagrangian saddle point.** Suppose `x*` is feasible (`gᵢ x* ≤ 0` for all `i`), `λ ≥ 0`, `λᵢ gᵢ x* = 0`, and `x*` minimizes `f + Σ λᵢ gᵢ` on `X`. Then `x*` minimizes `f + ρ Σ max(gᵢ, 0)` on `X` for every `ρ ≥ maxᵢ λᵢ`.

Shrink README.md:12–16 to what stays excluded. If the scope stays at Layer 1 alone, the theorem is a Tau Ceti library contribution, not a roadmap.

## Previous findings

- R01 — repaired: `Suggested.lean:6`, "import Mathlib" is the only import; the gate reports `imports=0 mathlib-subimports=0 no-import-mathlib=0 … OK`.
- R02 — not repaired: README.md:23–26, "`0 ≤ B` and `B < ρ`; … `1 ≤ w x` …; `f x - f y ≤ B` for every ordered pair `x,y ∈ D`"; README.md:13–15 still excludes "General numerical gaps, rescaling, broader scalar types" → R01.
- R03 — not repaired: README.md:3, "Build a small global exact-penalty API"; the only headline is 1.3, and this head replaced its complete proof with `sorry` → R02. The Layer 3 repair now also requires `x*` to be feasible (see the table).
- R04 — repaired: `Suggested.lean` declares only `isMinOn_penalized_iff`; README 1.1 and 1.2 keep their targets.
- R05 — repaired: `Suggested.lean:9`, "Exact penalties with a unit violation gap: target signatures"; README.md:77, "For every `a`, prove `isMinOn_penalized_iff`".
- R06 — repaired: `## Conventions` is at README.md:18; README.md:49–54 gives the layer order; the implementation sentence and `## Secondary provenance` are gone, and the links are under `## References`.
- R07 — repaired: the description reads "The three mathematical milestones cover …" and "The pull request adds `TauCetiRoadmap/ExactPenalties/README.md`, `Suggested.lean` (one headline signature prototype …, admitted with `sorry`), and `metadata.toml` (`math.OC`)".

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 Strict comparison (sampled) | H21 instance: `x ∈ {0,1}ⁿ`, `B = ‖c‖₁`, penalty `Σᵢ(1 − Σᵣ δᵢᵣxᵣ)²` (an integer, ≥ 1 off `F`) | `\|c·x − c·y\| ≤ ‖c‖₁ = B < ρ ≤ ρ·w x`; H21 line 1634 reaches `−‖c‖₁ + ρ < 0` | hypotheses met; matches H21's step |
| 1.2 Feasibility of a minimizer (sampled) | H21 converse, lines 1638–1660 | infeasible minimizer gives `−‖c‖₁ + ρ ≤ 0`, contradicting `ρ > ‖c‖₁` | matches |
| 1.3 Exact correspondence (sampled, headline) | H21 Prop. 1, lines 1603–1610 | left side "minimizes H and (2) is feasible", right side "solves (2)": the same three-conjunct shape | matches; B21 unread |
| 1.3, Check 1 | Bool, `B = ρ = 1` | `g false = 1`, `g true = 1`; at `a = true` the left side is true, the right side false (`true ∉ F`) | `B < ρ` needed; README consistent |
| 1.3, Check 2 | `P ≡ false`, `f = 0`, `w = 1`, `ρ = 1` | `g ≡ 1`; left side false (no witness), right side false; dropping the witness makes the left side true | guard needed |
| 1.3, Check 3 | `D = {false}`, `a = true`, `f true = −1` | left side false (`a ∉ D`), right side false; dropping `a ∈ D`: `g true = −1 ≤ 0 = g false` | guard needed |
| 1.3, empty sets | `D = ∅`; `F = ∅ ≠ D` | both sides false in each case | true |
| 1.3, one-tactic probe | `grind [isMinOn_iff]`, `aesop`, `simp_all [isMinOn_iff]` | all three fail | not padding |
| `0 ≤ B` | any `x ∈ D` | `f x − f x = 0 ≤ B` | redundant → R01 |
| global bound `B` | ℕ, `P x ↔ x = 0`, `f = id`, `ρ = 1` | `g 0 = 0`, `g n = n + 1`; minimizer sets `{0} = {0}`; `f n − f 0 = n > B` for `n > B` | exact instance excluded → R01 |
| R01 repair | proved at the pins; ℕ instance with `y₀ = 0` | `f 0 − f n = −n < 1 = ρ·δ`; the theorem applies | repair tested |
| R02 headline | 62c675e proof, re-elaborated at this head's pins | no error, no `sorry` | nothing left to build → R02 |
| R02 Layer 2 | ℝ, `S = ℝ`, `C = {0}`, `f = id` (`L = 1`) | `K = 2`: `g y = y + 2\|y\| ≥ 0 = g 0`, both sides true; `K = ½`: `g(−n) = −n/2`, left false, right true | `L < K` needed |
| R02 Layer 3 | `X = ℝ`, `f = 0`, `g = id`, `λ = 0`, `x* = 1`, `ρ = 1`, feasibility dropped | slackness `0·1 = 0` holds, `x*` minimizes `0`; penalized value `1 > 0` at `x = 0` | feasibility of `x*` added |

The rows for untouched statements stand as in the previous review of 62c675e.

- Source locators checked against the text: 2 of 4 new. H21 Appendix B, Prop. 1, PDF pp. 16–17 (H21 lines 1591–1660) is correct, as is its author list. L14 §3 and §4.1 (arXiv v3, L14 lines 429–519) are correct. B21 and G22 are under Not verifiable.
- Library declarations opened at the pin: `IsMinOn` (`Order/Filter/Extr.lean:111–113`; its docstring says that `a ∈ s` is not assumed), `isMinOn_iff` (`:129`), `Metric.infDist` (`Topology/MetricSpace/HausdorffDistance.lean:464`), `Metric.infDist_empty` (`:478`) and `LipschitzOnWith` (`Topology/EMetricSpace/Lipschitz.lean:63`). The README anchors are right.
- Elaboration: `lake env lean` on `Suggested.lean` gives one warning, `declaration uses 'sorry'`, at 21:8. `#check @isMinOn_penalized_iff` matches README 1.3 and `## Conventions`, with every binder explicit and no section variables.
- Gate: every check is 0, OK. Dependency check: `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`.
- Cross-roadmap citations: none. Overlaps: none. Changes outside the folder: none.
- The pull request's title and description were read against this head: no sentence is contradicted, and Lean v4.36.0-rc2 and Mathlib `1b1ccf4b` match `lean-toolchain` and `lake-manifest.json`.
- Remark: the docstring phrase "suggested forms, not an exhaustive checklist" also appears in 34 `Suggested.lean` files on main.
- Remark: H21 Appendix B, Prop. 1 (open access, CC BY 4.0) states the finite Boolean case of 1.1–1.3.

## Not verifiable

- B21 (Bernal Neira, thesis, CMU 2021, Prop. 10.B.1, printed pp. 414–416): KiltHub record 19146305 lists the PDF as not embargoed, but the record page and its file link (ndownloader file 34018628) both returned HTTP 403 to the sources service.
- G22 (Díez García, Ayodele and Moraglio, GECCO Companion 2022, §§2–3, pp. 184–187): the ACM DL (via the DOI) returned HTTP 403, and so did the University of Exeter repository's accepted manuscript (ORE bitstream 185242).

## Source issues

- **Error** in L14 at Section 3, eqs. (24)–(26), arXiv v3 pp. 9–10: the source says the objective gain from leaving a feasible point is at most the sum of the positive parts of `c`; it should be the sum of `|cᵢ|` (with `N = 1`, `S = 1`, `b = 1`, `c = −1`, `A/B = ½`, the ground state `x = 0` is infeasible); affects nothing.
- **Error** in L14 at Section 3, eq. (26), arXiv v3 p. 10: the source says `A/B ≥ C/S` suffices; it should be strict (with `N = 1`, `S = 1`, `b = 0`, `c = 1`, `A = B`, both states have `H = 0`, so an infeasible ground state exists); affects nothing.
