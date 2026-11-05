# Review of PDE (pull request #93 at b13f80f)

**Verdict:** needs changes

Incremental re-review of the 11 lines changed since fd8e87f: the References bullets at `TauCetiRoadmap/PDE/README.md:1414–1422`, which split the Krylov entry from the Da Prato–Debussche entries and give the 2003 quantization paper a journal locator and a theorem number. Nothing else in the folder changed; `Suggested.lean` is byte-identical to the head the previous review read. The change itself is sound as far as it can be checked (see `## Verified sound`), but it repairs only part of one P3 finding of the previous review. The eight blocking findings of the previous review stand untouched and are written again below (R02–R09), and the worker's gate now fails its dependency check with a PDE–VariationalMethods cycle (R01).

## R01 (P1) — The gate reports a cycle PDE ↔ VariationalMethods

**Location:** `TauCetiRoadmap/PDE/README.md:648`: "VariationalMethods supplies generic direct minimization (V1.4), the complex and shifted coercive-energy adapters (V2.3, V2.4) …"; the reverse edge is in `TauCetiRoadmap/VariationalMethods/README.md:1031` and `:1050` at its open head.

**Claim:** The dependency check fails at this head: `CYCLE among: PDE, VariationalMethods`. The PDE → VariationalMethods edge is genuine (Lane D.19 consumes V1.4, V2.3, V2.4, V4.1, V5.1, V5.2, all of which exist at the VariationalMethods head, see the previous review's contract table). The VariationalMethods → PDE edge is a tooling false positive: its `*Needs:*` line at `:1031` and its `### Dependencies` line at `:1050` name the Tau Ceti module path `Analysis/PDE/Spectrum`, and the checker's name matcher splits on slashes and reads the segment `PDE` as this roadmap. VariationalMethods' own prose (`:84`, `:1069–1070`) says PDE is a consumer, not a supplier, and nothing in VariationalMethods consumes a PDE section.

**Witness:** Full output of the prescribed command:

```text
CYCLE among: PDE, VariationalMethods
depcheck: 204 roadmaps, 1392 edges, 1 problem(s)
```

The previous review's run (162 roadmaps, 1176 edges) reported no problem; the new edge appears because VariationalMethods is now in the open-roadmap index the checker reads. `grep -n PDE` on the VariationalMethods README at its head finds the token only in the Tau Ceti path `Analysis/PDE/Spectrum` and in "PDE Lane D–E" prose, never on a line citing a PDE section.

**Repair:** On the PDE side nothing produces the false edge, so there is no PDE edit that clears it. The clearing edit is in the VariationalMethods folder: write the Tau Ceti module in words on its `*Needs:*` and `### Dependencies` lines ("the Dirichlet spectral instance in the `Spectrum` file of Tau Ceti's PDE analysis folder"), as the project's earlier Temperley–Lieb case did. The gate cannot pass for PDE until that lands or the checker is told to ignore library paths; I record this as a false positive with the exact lines, and the verdict does not rest on it (R02–R09 block on their own).

## R02 (P1) — Break the PDE–GeometricMeasureTheory supply cycle

Re-raised from the previous review's R01; unchanged at this head.

**Location:** `TauCetiRoadmap/PDE/README.md:466`: "Sobolev traces consume GMT G2's area formula, independently of G6's BV trace comparison"; `:589`: "Use GMT G2's area formula for the Lipschitz gradient".

**Claim:** PDE A6 and C13 consume GeometricMeasureTheory G2 while GeometricMeasureTheory on main consumes PDE A1–A3 and A5–A6. Two directed roadmap edges of opposite direction are a cycle, whichever sections carry them.

**Witness:** Main `TauCetiRoadmap/GeometricMeasureTheory/README.md:57–61` and `:279–282` consume PDE Sobolev spaces and traces; PDE `:466` consumes G2. The mechanical check does not see these prose edges (its output above lists only the VariationalMethods cycle).

**Repair:** As in the previous review: give the Lipschitz graph-measure/area input one owner earlier than both roadmaps, or move it into PDE and have GeometricMeasureTheory import it; the repaired graph has a single direction between PDE and GeometricMeasureTheory. Do not duplicate G2.

## R03 (P1) — The interval-operator supplier exists only in an inadmissible revision

Re-raised from the previous review's R02; unchanged at this head.

**Location:** `TauCetiRoadmap/PDE/README.md:384–387`: "the existing interval-derivative partial operator in OperatorTheory/UnboundedOperators; that owner retains the operator, graph/adjoint and boundary-condition realizations".

**Claim:** On main, OperatorTheory has no UnboundedOperators sub-roadmap; it exists only in an open pull request that revises an existing roadmap, which this review may not treat as a supplier.

**Witness:** Main `TauCetiRoadmap/OperatorTheory/README.md:31–64` lists the sub-roadmaps without UnboundedOperators; the directory `TauCetiRoadmap/OperatorTheory/UnboundedOperators` does not exist on main.

**Repair:** Replace the asserted contract by a declared gap naming the owner and the exact comparison needed (the H¹ interval derivative, its graph/adjoint, the two boundary domains), or cite a producer on main or at the pin; A1's own absolutely-continuous-representative theorem stays independent. For `u(x) = x` on `(0,1)` the maximal derivative is `1` while `u` is outside the two-zero-trace minimal domain.

## R04 (P2) — Rebase the construction inventory on the pinned Tau Ceti

Re-raised from the previous review's R03; unchanged at this head.

**Location:** `TauCetiRoadmap/PDE/README.md:318–326`, `:376–378`, `:414–417`, `:450–456`, `:623–627`, `:1422–1423`.

**Claim:** The README still asks for weak Sobolev carriers and completeness, zero-boundary spaces, finite-p zero-boundary Poincaré and Rellich, and L² coercive Dirichlet existence as missing work; all exist at the Tau Ceti pin.

**Witness:** At the pin, `TauCeti/Analysis/Sobolev/Wkp/Basic.lean:145,165` (carrier, completeness), `W1p/Zero.lean:246`, `RellichKondrachov.lean:141`, `Analysis/PDE/DirichletProblem.lean:292`; `Mathlib/MeasureTheory/Covering/Differentiation.lean:855` for B8's differentiation corollary.

**Repair:** Cite the implemented cases in the inventory and supplier contracts and keep only the genuine extensions (arbitrary-open higher-order density, traces and extension, endpoints, dual forcing, variable coefficients, evolution). Keep the pinned operator-bound ellipticity predicate and state the a.e. inverse-coercivity adapter separately: for `[[1,−1],[1,1]]` the operator bound is `√2` while inverse coercivity needs upper parameter `2`.

## R05 (P2) — State the statable headline theorems

Re-raised from the previous review's R04; `Suggested.lean` is unchanged.

**Location:** `TauCetiRoadmap/PDE/Suggested.lean:36–50`, `:78–80`, `:83–284`.

**Claim:** The file states zero headline theorems; it contains 32 parabolic-coordinate declarations, 21 of them proved. D18's adjoint-kernel Fredholm compatibility is statable on native carriers now.

**Witness:** The previous review elaborated a D18 statement on `TauCeti.W1p0`, `energyFormH1L0` and `StrongDual` with bounded Ω and a quantified Gårding bound, with only the intended `sorry` warning. This head's file still has no `sorry`'d theorem (elaboration output below is empty).

**Repair:** State the statable headlines (D18 with conclusion `(∃ u, ∀ v, B u v = ℓ v) ↔ ∀ w, (∀ v, B v w = 0) → ℓ w = 0`, and the other A/D/E headlines on pinned carriers), cite the already-proved special cases instead of restating them, and name each unstatable headline and its missing carrier in the module docstring.

## R06 (P2) — Resolve duplicate ownership of the dyadic Besov foundation

Re-raised from the previous review's R05; unchanged at this head.

**Location:** `TauCetiRoadmap/PDE/README.md:968–979` (X0): "Build the missing smooth dyadic partition, Bernstein estimates and Littlewood–Paley square-function theorem here".

**Claim:** PseudodifferentialOperators at its open head builds the same Euclidean dyadic partition, Besov carrier, cutoff independence and Bessel comparison before transporting them to bundles; two owners for one object.

**Witness:** `TauCetiRoadmap/PseudodifferentialOperators/README.md:497–515` at its head; its `:46–50` consumes PDE harmonic analysis. PseudodifferentialOperators is line 8 of the merge order.

**Repair:** Record one owner for the Euclidean dyadic/Besov construction and have the other import it; a compatible choice is PDE owning X0 with PseudodifferentialOperators keeping the interpolation and bundle adapters. For one annular block at frequency `2^j` both interfaces must give the same contribution `2^(js)‖P_j f‖_p`.

## R07 (P2) — State the operator hypothesis behind Calderón–Zygmund boundedness

Re-raised from the previous review's R06; unchanged at this head.

**Location:** `TauCetiRoadmap/PDE/README.md:493`: "CZ singular integral operators (standard kernel bounds) bounded on `Lᵖ`, `1<p<∞`".

**Claim:** Kernel size and smoothness bounds alone do not give weak-(1,1) or Lᵖ bounds; the L² bound is part of the hypothesis and is not stated.

**Witness:** On ℝ, `Tf(x) = x f(x)` has off-diagonal kernel `0`, satisfying every standard kernel estimate; for `f = 1_[R,R+1]`, `‖f‖₂² = 1` and `‖Tf‖₂² = R² + R + 1/3`.

**Repair:** Define a CZ operator as an L²-bounded linear operator with a standard kernel off the diagonal, with the L² bound among the constants, or own a testing theorem that yields it; the multiplication example then fails the hypothesis and the Hilbert transform passes.

## R08 (P2) — Exclude the empty domain when asserting a first eigenvalue

Re-raised from the previous review's R07; unchanged at this head.

**Location:** `TauCetiRoadmap/PDE/README.md:643–645` (Lane D.19) and `:1361–1362`: "the first Dirichlet eigenvalue of `−Δ` is positive".

**Claim:** The standing bounded-open assumption admits `Ω = ∅`, where `L²(Ω) = H¹₀(Ω) = {0}` and no first eigenvalue exists.

**Witness:** On `∅` every candidate eigenvector is `0`, so the point spectrum is empty; on `(0,π)` the first eigenpair is `(1, sin x)`.

**Repair:** Require `Ω` nonempty for the enumerated spectrum and the first-eigenvalue conclusion; keep the zero space as the empty-basis case; add both instances as Checks.

## R09 (P2) — Account for the dimension restriction in the weak Hopf source

Re-raised from the previous review's R08; unchanged at this head.

**Location:** `TauCetiRoadmap/PDE/README.md:550–562` (Lane C.13) under the standing `n ≥ 1` at `:114`; no `n ≥ 2` occurs in the passage.

**Claim:** The weak divergence-form Hopf milestone carries Rosales's contract but drops the paper's standing `n ≥ 2`; no separate one-dimensional producer is named.

**Witness:** `rosales` line 94 assumes `n ≥ 2`. At `n = 1` the roadmap permits `q = 3/2`, hence `q/2 = 3/4`, whereas the source's `q > n ≥ 2` forces `q > 2`.

**Repair:** Keep `n ≥ 2` on the source-derived theorem and state the `n = 1` flux/ODE version separately with its own integrability hypotheses. For `a = 1`, `b = c = d = 0` on `(−1,1)`, `u = x + 1` vanishes at `−1` with inward quotient `1`: the interval producer must include it; the cited theorem must not claim it.

## R10 (P3) — Finish the locator repair the diff began

Partly repaired from the previous review's R09.

**Location:** `TauCetiRoadmap/PDE/README.md:1414–1422` (new), `:1339` (Keel–Tao named without a bibliography entry), `:217`, `:275` and `Suggested.lean:15` (`TemperedDistribution.memSobolev`), `Suggested.lean:16` (`InnerProductSpace.continuousLinearEquivOfBilin`), X0–X3 claims without theorem/page locators, and no `sources.toml` in the folder.

**Claim:** The diff separates Krylov, the 2003 quantization paper and the 2002 Navier–Stokes paper and attaches a journal locator and "Theorem 4.2" to the first Da Prato–Debussche entry. The rest of the previous finding is untouched: Keel–Tao still has no entry; X0–X3 still have no locators at their claims; the two pinned names are still misspelt (`TemperedDistribution.MemSobolev` at `Mathlib/Analysis/Distribution/Sobolev.lean:153`; `IsCoercive.continuousLinearEquivOfBilin` at `Mathlib/Analysis/InnerProductSpace/LaxMilgram.lean:105`); no manifest records any source.

**Witness:** Three slips in the new lines: "Ann. Probab.31(4)", "Theorem4.2", "J. Funct. Anal.196 (2002),180–210" (missing spaces; the same kind as "factor3" at `:1267`). "Theorem 4.2" could not be certified (see `## Not verifiable`); the bibliographic data and the invariant-law-almost-every qualifier are corroborated by `mourrat-weber-plane` lines 67–71, 172–177 and 3600–3601, which also say that global existence on the torus for an arbitrary negative-Besov initial datum is their Theorem 6.1, the statement X3.3 promises "for each F₀-measurable initial u₀ ∈ c^(−κ)" without any source.

**Repair:** Fix the three spacings; cite Mourrat–Weber (arXiv:1501.06191, Theorem 6.1, and its a priori estimates of Section 6) for X3.3's all-initial-data torus globalization rather than leaving it sourceless; add the Keel–Tao entry (Theorem 1.2, printed p. 956) and the Tao locators (Theorem 2.3, printed p. 74; Theorem 2.6, printed pp. 77–79) at X1; correct the two declaration names; record every cited work once in `sources.toml` with the 2002 paper as `uncertified` (it resolves only to a paywalled page) and the 2003 paper with the DOI and the theorem locator.

## R11 (P3) — Supply the required README shape, per-definition API, Checks and dependency lines

Not repaired from the previous review's R10; the heading structure is unchanged (`# Roadmap`, `## The end goal (v1)`, `## Standing hypotheses`, … `## How to drive it`, `## Acknowledgements`), there is no `## Scope and ownership`, no `## Exact supplier contracts`, no `## Layer k` heading, and the README has zero `*Needs:*` lines.

**Repair:** As in the previous review: reorganise into the required sections, give each definition its API and at least three discriminating Checks (A7's three Hölder variants at `:470–479` and X0's three Besov spaces at `:972–983` still have none), each target its own `*Needs:*` line and locator, each layer its Examples and Dependencies.

## R12 (P3) — Delete the coordinate API padding from `Suggested.lean`

Not repaired from the previous review's R11; the file is unchanged.

**Location:** `TauCetiRoadmap/PDE/Suggested.lean:124–173`, `:179–206`, `:220–282`.

**Witness:** Nine declarations close by `rfl` (for example `coordsHomeomorph_apply`, `timeReverse_time_val`); `dist_eq_parabolicDist` is one `simpa` from `WithLp.prod_dist_eq_add` (`Mathlib/Analysis/Normed/Lp/ProdLp.lean:256`).

**Repair:** Delete them from `Suggested.lean`; the README keeps their statements as Checks. Do not prove them in place and do not replace them with admitted versions.

## Previous findings

- R01 — not repaired: `README.md:466` still reads "Sobolev traces consume GMT G2's area formula"; GeometricMeasureTheory on main still consumes PDE A1–A3, A5–A6. Re-raised as R02.
- R02 — not repaired: `README.md:386` still cites "the existing interval-derivative partial operator in OperatorTheory/UnboundedOperators", which is absent on main. Re-raised as R03.
- R03 — not repaired: the inventory at `:318–326`, `:376–378`, `:414–417`, `:450–456`, `:623–627` still lists the pinned carriers and theorems as missing. Re-raised as R04.
- R04 — not repaired: `Suggested.lean` is unchanged and states no headline; elaboration gives no `sorry` warning because there is none. Re-raised as R05.
- R05 — not repaired: X0 at `:968–979` still builds the dyadic partition, Bernstein and Littlewood–Paley "here". Re-raised as R06.
- R06 — not repaired: `:493` still reads "CZ singular integral operators (standard kernel bounds) bounded on `Lᵖ`". Re-raised as R07.
- R07 — not repaired: `:643–645` and `:1361–1362` still assert a positive first eigenvalue on a bounded open Ω with no nonemptiness. Re-raised as R08.
- R08 — not repaired: `:550–562` still carries Rosales's contract without `n ≥ 2` or an interval producer. Re-raised as R09.
- R09 — partly repaired: `:1414–1422` now separate Krylov, the 2003 quantization paper (DOI, Ann. Probab. 31(4), 1900–1916, Theorem 4.2) and the 2002 Navier–Stokes paper (J. Funct. Anal. 196, 180–210); Keel–Tao, X0–X3 locators, the two declaration names and `sources.toml` are untouched. Re-raised as R10 with the three new spacing slips.
- R10 — not repaired: no `## Scope and ownership`, `## Exact supplier contracts`, `## Layer k` or `*Needs:*` line exists. Re-raised as R11.
- R11 — not repaired: `Suggested.lean` is byte-identical. Re-raised as R12.

No repair introduced a new mathematical problem: the new 2003 bullet's qualifier agrees with X3.3's and X3.4's own text ("The μ-null exceptional set is an actual part of this global theorem", `:1310–1311`) and with the corroborating source.

## Verified sound

**Scope.** HEAD is `b13f80f64f65109fa2827837b9a0dd994d799d2c`; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/PDE'` is empty. The folder diff since fd8e87f is the single hunk at `README.md:1411–1422` (9 insertions, 2 deletions), in the References section; no Lean line, no section heading, no target statement changed. The folder contains `PROGRESS.md`, `STATUS.md`, `metadata.toml`, `README.md`, `Suggested.lean`; the gate's `stray-files` is 0.

**Gate.** The worker's gate at this head: every scanner 0 except `depcheck=1` (`CYCLE among: PDE, VariationalMethods`), `build=0`, verdict FAIL. My own run of the prescribed movable dependency command printed exactly

```text
CYCLE among: PDE, VariationalMethods
depcheck: 204 roadmaps, 1392 edges, 1 problem(s)
```

with no UPWARD, no `moved:` line. The cycle's reverse edge is traced to library-path tokens in VariationalMethods (R01). PDE is on main; VariationalMethods and StochasticCalculus (line 195 of the merge order) and PseudodifferentialOperators (line 8) are the open suppliers PDE names; GeometricMeasureTheory and OperatorTheory are on main.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/PDE/Suggested.lean` from the worktree exited 0 with no output at all (no `sorry` warning, because the file admits nothing). The supplied `signatures.md` lists 34 entries: the 32 declarations (2 abbreviations, 9 definitions, 21 theorems) plus two parser artefacts named `,` at lines 71 and 79 inside prose comments, as the previous review found; the file is unchanged, so the previous review's binder check (no declaration lost a section binder; the file has no standing hypothesis to lose) carries over, and I re-ran no `#check` transcript for an unchanged file. No new one-tactic probe: there is no sorried theorem to probe; the padding verdict (R12) rests on the nine `rfl` proofs and the one-`simpa` identity already recorded.

**The changed passage.** The three new bullets were checked as follows.

| Bullet | What was checked | Result |
| --- | --- | --- |
| Krylov, *An Analytic Approach to SPDEs*: "analytic Lp stochastic PDE" | X3.1 at `:1167–1211` is the Lp theory the bullet names; the text itself was not retrievable (previous review, unchanged). | Consistent attribution; locator still absent (R10). |
| Da Prato–Debussche 2003, DOI 10.1214/aop/1068646370, Ann. Probab. 31(4), 1900–1916, Theorem 4.2 | Bibliographic data: `mourrat-weber-plane` lines 3600–3601 give the same journal, volume, issue, pages and year. Mathematical claim: lines 67–71 describe short-time strong well-posedness on the two-dimensional torus by a Besov fixed point and non-explosion for almost every initial datum with respect to the reversible measure; lines 172–177 say the all-initial-data torus globalization is new there (their Theorem 6.1). The bullet's "Stronger all-initial-data conclusions require the separate dissipative estimates" matches X3.3 `:1251–1263`, which owns such an estimate. | Qualifier correct; "Theorem 4.2" uncertified (not readable, see below); spacing slips (R10). |
| Da Prato–Debussche 2002, J. Funct. Anal. 196, 180–210 | Resolves to Elsevier DOI 10.1006/jfan.2002.3919, paywalled: `uncertified` by locator. X3.4 `:1275–1331` is the two-dimensional cylindrical-noise Navier–Stokes model with the invariant Gaussian law of covariance `(2νA)^(−1)`, which is that paper's setting. | Consistent attribution; text not read. |

**Seeded sample.** Of the seven seeded targets only "X3 stochastic PDE: analytic Lp and both Da Prato–Debussche models" lies in the changed passage; its row is above. "Fredholm alternative for compact operators", "Carleson project", "X0 shared analytic spaces", "X1 Strichartz estimates for both Schrödinger and wave equations", "X2 quasilinear elliptic existence with an actual compact map" and "Lane A comes first" are untouched since fd8e87f and keep the previous review's results: Mathlib `Mathlib/Analysis/Normed/Operator/Compact/FredholmAlternative.lean:156–166` (complete space, μ ≠ 0); `carleson` lines 35, 210–231, 297–325; `keel-tao` lines 80–144 (Theorem 1.2, printed p. 956) and `tao` lines 3856–3892, 4023–4064 (Theorems 2.3 and 2.6); X0 and X2 without primary locators; "Lane A comes first" a dependency slogan whose premise is stale at the pin (R04).

**Cross-roadmap citations resolved this round.** VariationalMethods at its open head 7ea28a3b: V1.4, V2.3, V2.4, V4.1, V5.1, V5.2 exist (previous review's table, re-checked by heading grep); its `:84` and `:1069–1070` name PDE as a consumer only; its `:1031` and `:1050` carry the library path that triggers the cycle. GeometricMeasureTheory and OperatorTheory on main as in the previous review (the R02/R03 witnesses re-read at this head of main, commit fa41b374).

**Adversarial table.** The 108 programme rows and 32 declaration rows of the previous review (its "Adversarial mathematics table") carry forward unchanged for every statement the diff leaves untouched, each with the values recorded there. Rows for the changed statements:

| Statement / location | Instances tried | Computed values on the two sides | Result / change |
| --- | --- | --- | --- |
| 2003 bullet, "global existence for invariant-law-almost-every initial datum", `:1418` | initial law `δ_x` with `x` in the μ-null exceptional set `N`; initial law `ν ≪ μ` | `δ_x(N) = 1`, so the theorem gives nothing for that datum; `ν(N) = 0` since `μ(N) = 0`, so the global solution exists with `ν`-probability 1 | Pass: the qualifier is the correct reading of the cited result and agrees with X3.4 `:1310–1311`. |
| 2003 bullet versus X3.3's all-initial-data claim, `:1241–1245` and `:1418–1419` | `u₀ ∈ c^(−κ)` with `κ = 1/24`, `m = 1`; deterministic noise `0`, spatially constant remainder `v` | X3.3's dissipative route gives `(1/2) d(v²)/dt = −v² − v⁴ = −2` at `v = 1`, a bound independent of any invariant law; the 2003 route gives only μ-a.e. data | Pass: the two conclusions are distinct and the bullet says so; the all-data producer needs its own source (R10). |
| 2003 bullet, "periodic two-dimensional Wick-polynomial quantization", `:1417` | Fourier zero mode, `m = 1`, noise `√2` | stationary variance `2/(2·1) = 1`; `:Z²: = Z² − 1`, `:Z³: = Z³ − 3Z`, matching X3.3 `:1247–1250` with `C_ε → 1` | Pass: Wick polynomial description is consistent with the roadmap's displayed expansion. |
| 2002 bullet, "the distinct stochastic Navier–Stokes model", `:1420–1422` | single solenoidal mode `k = (1,0)`, viscosity `ν` | `A`-eigenvalue `4π²`; stationary covariance `1/(8νπ²)`; `Π div C_ε = 0` for the constant matrix `C_ε`, so no scalar counterterm, unlike the Φ⁴ drift `+3C_ε u` | Pass: the two models are distinct exactly as the split bullets say. |
| Krylov bullet, "analytic Lp stochastic PDE", `:1414` | `p = 2, γ = 0`; `p = 4, γ = 0` | trace orders `γ + 2 − 2/p` equal `1` and `3/2`; solution-space order `2` | Pass: the bullet names the theory X3.1 states; no locator (R10). |

**Library declarations opened this round.** None new; the previous review's 19-entry pin table (Mathlib `6b7abb3c…`, Tau Ceti `a91d3aa…`) is unchanged by this diff and is the evidence for R04 and R10's name corrections (`Mathlib/Analysis/Distribution/Sobolev.lean:153`; `Mathlib/Analysis/InnerProductSpace/LaxMilgram.lean:105`).

**Principles.** The changed lines contain no copied passage, no algorithm, no process word, no pull-request number, no LaTeX delimiter; the gate's text scanners agree (all 0).

## Not verifiable

- `da-prato-debussche-quantization` (Da Prato–Debussche, *Strong solutions to the stochastic quantization equations*, Ann. Probab. 31(4), 2003, DOI 10.1214/aop/1068646370): the article is listed as open access, but every route returned no text. The sources service: the DOI landing page (no PDF link); `projecteuclid.org/journalArticle/Download?urlId=…` and `projecteuclid.org/download/pdf_1/euclid.aop/1068646370` both returned an Incapsula "Request unsuccessful" page (cache texts `e6b7ac60…` and `f3def0b0…`, one line each); the Scuola Normale Superiore repository handle `11384/91981` and its `retrieve/…/euclid.aop.1068646370.pdf` bitstream returned HTTP 403. A direct page read of the Project Euclid PDF and full-text page returned empty bodies and the SNS bitstream HTTP 403. "Theorem 4.2" is therefore uncertified; the journal data and the almost-every qualifier are corroborated only through Mourrat–Weber (arXiv:1501.06191, cache `78cd2f76…`, lines 67–71, 172–177, 3600–3601). The missing-reference record in the job's `needs-references.toml` lists this work with the routes tried; no manifest was edited.
- `da-prato-debussche-ns` (J. Funct. Anal. 196, 2002, DOI 10.1006/jfan.2002.3919): resolves only to a paywalled Elsevier page; `uncertified` by locator, as in the previous review.
- The ten works the previous review listed as unretrievable (`lunardi`, `krylov`, `evans`, `chiarenza-frasca-longo-interior`, `chiarenza-frasca-longo-dirichlet`, `di-fazio`, `auscher-qafsaoui`, `stein`, `stein-shakarchi`, and the Springer-only `gilbarg-trudinger`, `grafakos-classical`, `grafakos-modern`) are untouched by the diff and were not re-fetched.
- Ownership against open pull requests whose files the brief does not supply (for example IncompressibleFlows, surfaced by the previous review's grep) was not checked.

## Source issues

- none
