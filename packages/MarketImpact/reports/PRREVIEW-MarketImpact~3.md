# Review of MarketImpact (pull request #1655 at 1f4eaab)
Folder: `TauCetiRoadmap/FinancialMathematics/MarketImpact/`

**Verdict:** needs changes

Incremental re-review: the folder is unchanged since the review of `1f4eaab`; this round reads the pull request's title and description against the head and re-resolves the citations. All five findings are P3.

## R01 (P3) — The description's validation paragraph describes the first commit, not the head

**Location:** pull request description, "Validation" paragraph: "a focused independent mathematical review of the complete roadmap and prototype found no actionable defects … Its five admitted theorems are future targets".

**Claim:** `Suggested.lean` admits five theorems and the reviewed text is the head.

**Witness:** `Suggested.lean` at `1f4eaab` elaborates with 17 `declaration uses sorry` warnings (lines 52, 107, 120, 134, 144, 162, 192, 197, 202, 214, 223, 230, 254, 297, 306, 325, 352). `ce99715` had 5; `1f4eaab` ("review repairs") rewrote 602+/247− lines.

**Repair:** replace the paragraph's first three sentences by: "Validation: `lake build TauCetiRoadmap.FinancialMathematics.MarketImpact.Suggested` passes with `sorry` as the only warning. Its 17 admitted theorems are the roadmap's headline targets, from global clearing to the fixed-cutoff fit limit; the headlines that are not statable at the pins are named in the module docstring. The financial parent keeps its one admitted target."

## R02 (P3) — The description announces numerical and statistical methods and reported experiments that the head excludes

**Location:** pull request description, second prose paragraph: "… least-squares volatility fits, and numerical/statistical methods. The article's hard-cutoff price slices and reported experiments retain their precise scope and source qualifications."

**Claim:** the roadmap contains numerical and statistical methods and the article's experiments.

**Witness:** `README.md:10`: "Computational search, grid solvers, random simulation and reproduction outputs are outside scope." The layer "M5. Numerical and statistical results" of `ce99715` is gone; Layer 5 is "Coordinate identities and feedback systems" (`README.md:540`).

**Repair:** replace the two sentences by: "… least-squares volatility fits, and the log-price and residual-cash coordinate identities with rank-one system estimates and the exact positive asset identity. Computational search, grid solvers, simulation and reproduction of the article's experiments are outside scope. The article's hard-cutoff model is kept as a separate price-slice model with its source qualifications."

## R03 (P3) — The description names lecture notes as the source; the head cites only the article

**Location:** pull request description, first prose paragraph: "The SDE notes reproduce Sircar–Papanicolaou's feedback-pricing article on physical pages27–46."

**Claim:** the roadmap's source and locators are the SDE notes, pages 27–46.

**Witness:** `README.md:611` cites only the April 1997 author preprint, "35 pages. All page numbers here refer to this version"; `README.md:613`: "No pagination or edition of unidentified lecture notes is used as a locator."

**Repair:** replace the sentence by: "The roadmap is built on Sircar–Papanicolaou's feedback-pricing article, cited from the April 1997 author preprint (35 pages) by section, equation and page; where its statements are strengthened or corrected, the README says so at the locator."

## R04 (P3) — "Lane F" is no longer a label of PDE on main

**Location:** `README.md:8` ("[PDE](../../PDE/README.md), Lane F, F27.1–F27.6 owns generic parabolic Hölder spaces"), `README.md:48` ("[Lane F, F27.1–F27.6]") and `README.md:558` ("PDE Lane F F27.2–F27.5").

**Claim:** PDE has a "Lane F" containing F27.1–F27.6.

**Witness:** PDE's README on main has no occurrence of "Lane F"; the ids are tags of Layer 6: `### 6.4 Parabolic Hölder spaces, calculus and traces (F27.1)` (`TauCetiRoadmap/PDE/README.md:2374`) through `### 6.9 Spatial weights (F27.6)` (line 2616).

**Repair:** write "PDE §§6.4–6.9 (F27.1–F27.6)" at lines 8 and 48 and "PDE §§6.5–6.8 (F27.2–F27.5)" at line 558. The bare ids F27.n elsewhere resolve as they stand; the six sections still state what each `*Needs:*` line consumes.

## R05 (P3) — Two headline hypotheses are redundant (carried from the previous review's R01)

**Location:** `Suggested.lean:56` (`hinfty : Filter.Tendsto (clearingMap H) Filter.atTop Filter.atTop`) and `Suggested.lean:136` (`hζzero : ∀ K, K ≤ 0 → ζ K = 0`).

**Claim:** each hypothesis is needed for its theorem.

**Witness:** `hH`, `hmargin` give `g′ ≥ δ` on `(0,∞)` for `g = clearingMap H`, so `g(x) ≥ g(1) + δ(x−1) → ∞`. `strikeSmoothedCallPayoff` integrates over `Set.Ioi 0` (`Suggested.lean:131`), so ζ on `K ≤ 0` never enters.

**Repair:** delete `hinfty` from `global_clearing` and `hζzero` from `strikeSmoothedCall_gamma`; `README.md:73` then ends "a uniform strictly positive derivative margin and limit zero at 0", and `README.md:229` drops "vanishing at nonpositive strikes". `hzero` stays: `H = −1/x` has margin 1 and `g = x + 1`, with no root at `y = 1/2`.

## Previous findings

- R01 — not repaired: `Suggested.lean:56` still has `hinfty`, `Suggested.lean:136` still has `hζzero`; the folder is unchanged since `1f4eaab`. Carried as R05.

## Verified sound

| Statement / location | Instances tried | Values on the two sides | Result; change |
| --- | --- | --- | --- |
| `global_clearing`, `Suggested.lean:52` (R05) | `H = −1/x`; `H = 0`, `y = 2` | margin `1 + 1/x − 1/x = 1`, `g(10⁻⁶) = 1.000001`, `g(1) = 2`, `g(10) = 11`: `g → 1` at 0, `g ≥ g(1) + (x−1)`; root 2 | true; `hinfty` implied, `hzero` needed (R05) |
| `strikeSmoothedCall_gamma`, `Suggested.lean:134` (R05) | `ζ = 6(K−1)(2−K)` on `[1,2]`, by quadrature over `(0,3)` | `h(3) = 1.5000`, second difference of `h` at `3/2` is `1.4999`, `ζ(3/2) = 1.5` | true; `hζzero` unused (R05) |
| `call_fit_cutoff_limit`, `Suggested.lean:352` (the acceptance theorem the description cites) | `K = σ = ε = 1`, `r = 0`; ratio at `τ = 1.05, 1.01, 1.002` | numerator `0.0918881492 = 1/(2π√3)`, denominator `0.5971946789 = e^{3/4}/(2√π)`, slope `0.1538663228`; `callFitVariation/(τ−ε) = 0.14238, 0.15146, 0.15338` | positive finite slope, as the description's third paragraph says; none |
| PDE contract, `README.md:48` (R04) | F27.1–F27.6 on main | §6.4 spaces and traces, §6.5 bounded comparison and heat isomorphism, §6.6 variable coefficients and backward problems, §6.7 BUC traces, §6.8 every order, §6.9 weights with bounded Hölder derivatives of `log w` | contract holds; label stale (R04) |

The remaining rows stand as in the previous review, of `1f4eaab`.

- Gate: the worker's gate at this head passes every check (`build=0 … OK`). The brief's gate command, run without the candidate merge order, prints `depcheck: NOT IN ORDER: MarketImpact` and `outside-folder: TauCetiRoadmap/FinancialMathematics/README.md`; neither is a finding (the candidate order lists the roadmap, and the family index is this pull request's own).
- Dependency check with the candidate order: `depcheck: 244 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` of `Suggested.lean` exits 0 with the 17 `sorry` warnings listed in R01 and nothing else. No statement changed, so the `#check` comparison and the one-tactic probe of the previous review stand.
- Cross-roadmap citations resolved on main: FinancialMathematics M0.1–M0.4 (`README.md:11`, 29, 45, 57); StochasticCalculus §§3.2, 3.3, 3.4, 5.1, 9.4 (`README.md:1456`, 1540, 1559, 1834, 3055; it is on main now); PDE F27.1–F27.6 (`README.md:2374`–2616); StandardDistributions Layers 2–3.
- Description sentences checked and found right at this head: the title; the summary block; "link it from the financial foundation" and "one parent navigation link" (the diff outside the folder is one line of `TauCetiRoadmap/FinancialMathematics/README.md`); "the existing financial parent has one admitted target" (one `sorry`, `TauCetiRoadmap/FinancialMathematics/Suggested.lean:123`); the fixed-cutoff paragraph.
- Remark, no change asked: `TauCetiRoadmap/FinancialMathematics/README.md:3` says MarketImpact owns "coupled pricing and its numerical models", while `README.md:10` puts computation outside scope.
- Duplication: `roadmaps grep` for feedback volatility, Sircar, `clearingMap` and market impact returns nothing outside this folder; ownership against open pull requests whose files the brief does not provide was not checked.
- Overlap check: read PDE (main and the open revision), FinancialMathematics, StochasticCalculus, DysonBrownianMotion; nothing shared (FinancialMathematics `README.md:3` and StochasticCalculus `README.md:40` assign feedback models to MarketImpact; DysonBrownianMotion excludes finance models).
- Source independence: changed passages only; 0 passages changed, so 0 compared with 0 sources; largest share sircar-papanicolaou (every source locator of the README); the arrangement was not compared again, since no layer was added, removed or reordered.

## Not verifiable

- The source text was not opened this round: no passage changed, and the sample of the previous review stands as recorded there.
- The description's statements about how the text was prepared and reviewed before the pull request (which tools, which transcripts) cannot be checked from the repository.

## Source issues

- none

## For the human reviewers

- **Scope.** Every source locator is to one article, Sircar–Papanicolaou, read as the April 1997 author preprint (`README.md:611`); the journal version's numbering was not compared.
- **Licence.** The description says the text was prepared from "the SDE notes" through "existing Luna Markdown transcripts"; the first commit's README cited MATH5695 lecture notes. The head cites neither; the notes' status was not established.
