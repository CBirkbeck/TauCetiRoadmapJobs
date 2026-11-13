# Review of ConvexLifting (pull request #2292 at 16d406f)

**Verdict:** needs changes

## R01 (P2) — Domain-restricted comparison drops component convexity and anchor membership

**Location:** `TauCetiRoadmap/ConvexLifting/README.md` line 115: "Also establish the domain-restricted comparison with `MapsTo g D E`, outer convexity on `E`, anchor-image membership, actual derivatives, and explicit monotonicity of every linear `Dh i`. … Under these conditions, prove the same two containments".
**Claim:** Under the listed conditions `S ⊆ fst(sharedOA)` is false; convexity of each component of `g` on `D` and `a i ∈ D` are needed.
**Witness:** `X = ℝ`, `p = 1`, `D = ℝ`, `E = univ`, `g(x) = −x²`, `h(y) = y₀`, anchor `0`, `Dg = 0`, `Dh = h`, `b = −1`: `1 ∈ S`, but `sharedOA` needs `0 ≤ y ≤ −1`, empty.
**Repair:** Replace the sentence by: "Also establish the domain-restricted comparison: assume `MapsTo g D E`, each component of `g` convex on `D`, `h` convex on `E`, every anchor in `D`, `HasFDerivAt g (Dg i) (a i)`, `HasFDerivAt h (Dh i) (g (a i))`, and every `Dh i` monotone." With `g` convex the witness is excluded (`−x²` is not convex).

## R02 (P2) — The general comparison is statable at the pins but only its full-space special case is stated

**Location:** `TauCetiRoadmap/ConvexLifting/Suggested.lean` lines 221–232, `fullspace_analytic_comparison` (uses `sharedOA D Set.univ`); README line 115 states the comparison for a general `E`.
**Claim:** The domain-restricted comparison is the roadmap's general Layer 3 theorem; it is statable with the file's own `sharedOA D E` and implies the stated one (`E = univ`; `Monotone h` gives `Monotone (Dh i)`), yet it is absent.
**Witness:** The statement below elaborates on a scratch copy of the file at the pins (only `sorry` warnings).
**Repair:** Add, with hypotheses as in R01: `theorem analytic_comparison (D : Set X) (E : Set (Fin p → ℝ)) (g) (h) (a) (Dg) (Dh) (b : ℝ) (hgE : MapsTo g D E) (hc : ∀ j, ConvexOn ℝ D (fun x => g x j)) (hhc : ConvexOn ℝ E h) (ha : ∀ i, a i ∈ D) (hg : ∀ i, HasFDerivAt g (Dg i) (a i)) (hh : ∀ i, HasFDerivAt h (Dh i) (g (a i))) (hD : ∀ i, Monotone (Dh i)) : originalSet D g h b ⊆ Prod.fst '' sharedOA D E g h a Dg Dh b ∧ Prod.fst '' sharedOA D E g h a Dg Dh b ⊆ directOA D g h a Dg Dh b`, and name it in README line 115.

## R03 (P3) — Gate fails: LaTeX displays and TeX syntax in the README

**Location:** `TauCetiRoadmap/ConvexLifting/README.md` lines 11, 46, 56, 78, 98, 108, 123 (`\[`); lines 47, 79, 109, 125, 126 (`\operatorname`, `\sum`, `_{`, `\subseteq`, `\texttt`, `\iff`).
**Claim:** Gate rules `latex` (7) and `tex` (7) fail; no acceptance while the gate fails.
**Witness:** Gate at 16d406f: `latex=7 tex=7 … FAIL`; every other counter 0, `build=0`.
**Repair:** Replace each display by an indented code block in Unicode, e.g. line 11–14: `S = {x ∈ D | h(g(x)) ≤ b}`, `L = {(x,y) | x ∈ D, y ∈ E, g(x) ≤ y, h(y) ≤ b}`; line 47: `Prod.fst '' L = S`; line 79: `u_j(x) = Σ_i a_ji x_i + Σ_i b_ji z_i + o_j`.

## R04 (P3) — README is not in the roadmap shape

**Location:** `TauCetiRoadmap/ConvexLifting/README.md` headings: line 1 "# Exact lifting and matched finite outer approximations", line 7 "## Scope and conventions", line 28 "## Existing material and dependency order", line 135 "## Sources and relation to existing work".
**Claim:** The required sections are missing: `# Roadmap: <title>` with `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts` (`### From Mathlib`), `## How to read the build`, `## Downstream consumers`, `## References`; Layers 1, 3, 4 have no `### k.n` subsections; no layer ends with `### Examples` and `### Dependencies`; no target has a `*Needs:*` line.
**Witness:** `grep -c 'Needs:' README.md` = 0; `grep -c '^### ' README.md` = 3 (2.1, 2.2, 2.3 only).
**Repair:** Retitle `# Roadmap: exact lifting and matched finite outer approximations`; split lines 7–40 into the four named sections (the Mathlib list of lines 32–36 becomes `### From Mathlib`); give each layer numbered subsections per target, a `*Needs:*` line per target (e.g. `projection_eq`: Mathlib `Set.MapsTo`, `MonotoneOn`), and closing `### Examples`, `### Dependencies`.

## R05 (P3) — No target carries a source locator; three references are not locatable

**Location:** `TauCetiRoadmap/ConvexLifting/README.md` Layers 1–4 (lines 42–133) and lines 140, 144: "preprint and 2013 Articles in Advance, §3.1"; "The dissertation's Chapter 2 adopts this lifting literature."
**Claim:** Every locator sits in the closing list; no theorem (in particular none in the sampled 2.1, 2.2, 2.3) cites a source at the claim. [HBO] names two unspecified versions; "the dissertation" is never identified; [LYBV16]/[LYBV] "author manuscript" gives no identifier.
**Witness:** `grep -n 'TS05\|HBO\|LYBV\|KLW18\|KBLG' README.md` hits only lines 139–144. The texts read: arXiv:1511.06710v3 §4 p. 9; arXiv:1607.03566v2 §4 p. 12, equations (8)–(10).
**Repair:** Put the locator in parentheses at each claim: `projection_eq` and `epigraph` identity (LYBV16, arXiv:1511.06710v3, §4, p. 9; TS05, Theorem 1); 2.2 (TS05, §2, Proposition 1); 2.3 (HBO, §3.1, one named version with its page); Layer 3 (TS05, Proposition 5); Layer 4 (KLW18, Proposition 1). Name the arXiv identifiers in [LYBV16], [LYBV]; give the dissertation's author, title, year or delete the sentence.

## R06 (P3) — Definitions have no API bullets and no per-definition Checks

**Location:** `TauCetiRoadmap/ConvexLifting/README.md` lines 64, 92, 117, 133 (one `**Checks.**` paragraph per layer); definitions at lines 16, 70, 82, 88, 104, 121, 131.
**Claim:** Each definition needs a bulleted API (prose facts with hypotheses) and at least three discriminating Checks as a bullet list; here Checks are run-on paragraphs per layer and e.g. `independentRows`, `directOA`, `relaxationOn` have fewer than three Checks of their own.
**Witness:** Line 133 holds the only Check touching `independentRows` ("repeated anchors give equality cases"); `grep -c '^- ' README.md` counts only the Mathlib list and the references.
**Repair:** Under each definition add `- ` API bullets and a `**Checks.**` bullet list, one computed value per bullet; e.g. for `independentRows`: `k = 0` gives projection `D`; `p = 0` gives `x ∈ D ∧ ∀ a, 0 ≤ b a`; the Layer 3 example with two anchors gives `|x₁+x₂| ≤ 5/4`, not `|x₁|+|x₂| ≤ 5/4`.

## R07 (P3) — Process narrative and undefined vocabulary

**Location:** `TauCetiRoadmap/ConvexLifting/README.md` line 5: "This README is definitive. The thirteen theorem declarations there represent thirteen selected interface roles…"; line 146: "Related project-owned formalization is available in the complete retained library…"; line 26: "PSC/KKT completion".
**Claim:** Lines 5 and 146 describe the file's production and an external implementation rather than mathematics (policy: timeless, no process text). "PSC/KKT completion", "mismatched-history example" (line 117), "source-facing finite models" (line 24), "physical height" (line 92), "all-height monotone comparison" (line 24) are neither standard nor defined.
**Witness:** None of the five terms occurs in arXiv:1511.06710v3 or arXiv:1607.03566v2 (grep, 0 hits each).
**Repair:** Delete lines 5 (after its first sentence) and 146. Write "an example where the two approximations use different anchor families" for "mismatched-history"; "the comparison assuming `h` monotone in every coordinate" for "all-height monotone"; define or delete "PSC/KKT completion" and "physical height"; drop "source-facing".

## R08 (P3) — Suggested.lean form

**Location:** `TauCetiRoadmap/ConvexLifting/Suggested.lean` lines 3–10 (module docstring), 21, 24, 60, 62, 72, 75, 78, 85, 88, 94, 198, 201, 205, 209, 214, 239, 243.
**Claim:** The module docstring is not "<title>: target signatures" and does not say which headline theorems are not statable (or that all are); 17 declarations have no docstring; there are no `/-! ## Layer k: <title> -/` comments though four layers are stated.
**Witness:** Only `separableLift` and `normalizedLift` among the 19 non-theorem declarations carry a `/-- … -/`; `grep -c '## Layer' Suggested.lean` = 0.
**Repair:** Title the docstring "Exact lifting and matched finite outer approximations: target signatures", state that every headline is statable at the pins; add a mathematical docstring to each of the 17 declarations; insert `/-! ## Layer 1: exact composition lifts -/` … `/-! ## Layer 4: finite support elimination -/` in README order.

## R09 (P3) — Padding in Suggested.lean

**Location:** `TauCetiRoadmap/ConvexLifting/Suggested.lean` lines 50–54 `epigraph_composition_iff`; line 229, first conjunct of `fullspace_analytic_comparison`.
**Claim:** `epigraph_composition_iff` is `projection_eq` at `b := p.2` with both sets unfolded; the conjunct `∀ i, HasFDerivAt (h ∘ g) ((Dh i).comp (Dg i)) (a i)` is one library lemma.
**Witness:** On a scratch copy, `simp [originalSet, liftedSet, and_comm]` of `Set.ext_iff.mp (projection_eq D E g h p.2 hg hm) p.1` leaves the goal up to reassociating `∧`; `fun i => (hh i).comp (a i) (hg i)` closes the conjunct (`HasFDerivAt.comp`, `Mathlib/Analysis/Calculus/FDeriv/Comp.lean:103`).
**Repair:** Delete `epigraph_composition_iff` and the chain-rule conjunct from `Suggested.lean` (the README keeps both statements).

## R10 (P3) — Pull-request description does not say it adds a new roadmap

**Location:** Pull request #2292 description, first paragraph: "Specify exact monotone-composition lifting and matched finite outer approximations as a reusable optimization library."
**Claim:** The text does not state that the pull request adds the roadmap folder `ConvexLifting`, which is not on main, with no supplier roadmap.
**Witness:** Folder change against main: 413 insertions, 0 deletions, three new files; `depcheck: 240 roadmaps, 2171 edges, 0 problem(s)`.
**Repair:** Add: "This pull request adds the new roadmap folder `TauCetiRoadmap/ConvexLifting/` (README, `Suggested.lean`, `metadata.toml`); it consumes Mathlib only and no other roadmap."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `projection_eq` | `g = x²`, `h = 1−y` (not monotone), `b = 0`; `D = ∅`; `g(x) ∈ E` via `MapsTo` | Non-monotone: `S = {|x| ≥ 1}`, `fst(L) = ℝ` (take `y ≥ max(x²,1)`); monotone: `h(g x) ≤ h(y) ≤ b`; `∅ = ∅` | true as stated; hypothesis needed | none |
| `feasible_minimum_iff`, `attainment_iff` | `D = [−1,1]`, `g = x²`, `b = 1`, `f = −x`; extra bound `y ≤ 1/4` | Lift min `−1` at `(1,1)`; with `y ≤ 1/4`: `x ≤ 1/2`, min `−1/2`; both sides reduce to `∀ x ∈ fst(L), f(p.1) ≤ f(x)` | true; README Check line 64 agrees | none |
| `epigraph_composition_iff` | compare with `projection_eq` at `b := p.2` | Identical up to order of conjuncts | true, redundant | R09 |
| 2.1 `feasibleOn`, `relaxationOn`, `objective` | `m = 0`; `(x+z)² ≤ 1`, `z ∈ {0,1}`, `−1 ≤ x ≤ 1`, objective `x+z` | `m = 0`: integrality vacuous, sets equal; example min `−1` at `(−1,0)`; `(1/2,0)` feasible | consistent | none |
| 2.2 `normalizedLift`, `normalization_projection` | rows `j`, `q+j` of the added block | `−a·x − b·z + u_j ≤ o_j` and `a·x + b·z − u_j ≤ −o_j`: `u_j = affineArgument`; `g_i(project z) = Σ w φ_j(u_j)`; no sign condition used | true | none |
| 2.2/2.3 minimum transport | lifted objective at `z` | `Σ addCases(c1,0)·z.1 + c2·z.2 = objective(project z)`; `IsMinOn` over lift ⇔ over image | true | none |
| 2.3 `separableLift`, `separable_projection` | `q = 0`; weight `−1`, component `x`, `d.g = −x` | `q = 0`: `g = 0`, budget row `0 ≤ 0`; negative weight: `x ≤ y`, `−y ≤ 0` admits `x = −1` with `d.g = 1 > 0`, so `hw` needed | true as stated | none |
| `fullspace_analytic_comparison` | `g = (x₁²,x₂²)`, `h` = sum, anchors `(1,1)`, `(−1,−1)`, `b = 1/2`, `f = −x₁+x₂`; `k = 0` | Direct: `|x₁+x₂| ≤ 5/4`, min `−2`; shared: `|x₁|+|x₂| ≤ 5/4`, min `−5/4`; original min `−1`; `H_i(G_i(x)) = C_i(x)`; `k = 0`: `D ⊆ D` | true; Check line 117 agrees | R09 (first conjunct) |
| Domain-restricted comparison (README line 115) | `g = −x²`, `h = id`, anchor `0`, `b = −1` | `1 ∈ S`; `sharedOA = ∅` | false as listed | R01, R02 |
| `shared_rows_projection` | `p = 0`; one empty `H_j` (excluded by `hne`); `p = 2`, rows `{1,3}`, `{2}` | `p = 0`: all three sides `x ∈ D ∧ 0 ≤ b`; example: `Σ max = 5`, mixed choices `3, 5`, both give `5 ≤ b` | true | none |
| `independent_rows_projection` | `k = 0`; witness `y a j = row a j x` | `k = 0`: `x ∈ D`; witness gives equality in each row sum | true | none |

- Source locators checked against the text: 2 (arXiv:1511.06710v3 §4, lines 385–392; arXiv:1607.03566v2 §4, equations (8)–(10), lines 479–491); both support the monotone-outer epigraph identity.
- Library declarations opened at the pin (Mathlib 1b1ccf4): 9 — `IsMinOn.comp_of_mapsTo` (`Order/Filter/Extr.lean:409`), `isMinOn_iff` (:129), `ConvexOn.convex_epigraph` (`Analysis/Convex/Function.lean:289`), `convexOn_iff_convex_epigraph` (:301), `ConvexOn.le_slope_of_hasDerivAt` (`Analysis/Convex/Deriv.lean:596`), `Finset.sup'_le_iff`, `Finset.le_sup'`, `Finset.exists_mem_eq_sup'` (`Data/Finset/Lattice/Fold.lean:555, 561, 758`), `HasFDerivAt.comp`. All exist as cited.
- Tau Ceti at the pin: `mem_subdifferential_of_hasFDerivAt` (`TauCeti/Analysis/Convex/Differentiability.lean:144`) is the full-space `EReal` tangent inequality; no target here restates it.
- Cross-roadmap citations resolved: 3 (OptimalTransport, VariationalMethods, GeometricTopology, all on main; named as non-suppliers). The 8 "found nowhere" Lean names are this file's own `FiniteModel.*` declarations.
- Dependency check: `depcheck: 240 roadmaps, 2171 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: FAIL on `latex=7`, `tex=7` (R03); all other counters 0, build passes. `lake env lean` on `Suggested.lean`: `sorry` warnings only.
- `#check`-level comparison of the 32 elaborated signatures with the README: the 6 "dropped binder" leads are harmless (`hg`, `hm` are present in all four Layer 1 theorems; the instance binders are unused by the definitions); nothing changed.
- Overlap check: read FiniteAffineBoundTightening, ExactPenalties, BoundedConicHulls, ExponentialCone, OptimalTransport; the nonnegative-weight sum-lifting mechanism is owned here (2.3, Layer 4), ExponentialCone §3 states only its exponential-cone instance; no shared declaration name; nothing else shared.
- Source independence: 7 passages compared with 2 sources, none shared; largest share TS05, 4 of 12 locators; contents of TS05 not compared (text not readable).

## Not verifiable

- [TS05] §2, Proposition 1, Theorem 1, Proposition 5: DOI 10.1007/s10107-005-0581-8 is paywalled; no open copy found by the sources service.
- [HBO] §3.1 (sampled sections 2.1–2.3 rest on it): DOI landing page returned HTTP 403; no legal copy found.
- [KLW18] Proposition 1, §4 and [KBLG] §3.7.1: the sources service classed both DOIs as paywalled; not read.
- [LYBV16] published IPCO pages 102–113: only arXiv:1511.06710v3 was read; pagination of the proceedings not compared.
- "The dissertation's Chapter 2" (README line 144): the work is not identified.

## Source issues

- none

## For the human reviewers

- **Licence.** README line 146 says the lifting modules of `github.com/bernalde/complete-retained-library` (commit 59c355e) provide reference constructions; `Suggested.lean` may be adapted from it. Its licence was not read.
- **Not tested.** TS05 has the largest share of locators (4 of 12) and is paywalled: wording and arrangement were not compared with it.
- **Scope.** The readable sources state the Layer 1 identity as a one-paragraph remark (arXiv:1511.06710v3 lines 385–392; arXiv:1607.03566v2 lines 479–491), not as a numbered theorem; the stated headlines are order and finite-sum set identities.
- **Scope.** README line 144 cites an unidentified dissertation and line 146 the author's own repository as related material.
