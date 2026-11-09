# Review of EllipticCurvePeriodsAndModularParametrizations (pull request #1715 at cb2a609)

**Verdict:** needs changes

An incremental re-review of the 32 lines changed since 7a356fe (the Tau Ceti contract bullet for the newform analytic rank, the new 3.4 identification `analyticRank_eq_newform_analyticRank` with its `*Needs:*` line, and the matching Lean statement). The new mathematics is right and the Lean statement elaborates at the generality the README states. Two P3 findings remain: the gate fails on one unqualified Tau Ceti name in the changed contract text, and the one finding of the previous review is unrepaired.

## R01 (P3) — Gate `readme-ids-missing`: an unqualified Tau Ceti name read as this roadmap's own

**Location:** `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/README.md:286` (“`analyticRank_eq_analyticOrderNatAt` (any entire function agreeing with the coefficient series …”) and `:942` (“`analyticRank_eq_analyticOrderNatAt` and EllipticCurveModularity R29.3–R29.4”).

**Claim:** The worker's gate at this head reports `readme-ids-missing=1` for `analyticRank_eq_analyticOrderNatAt`, so the gate fails and no acceptance is possible while it does.

**Witness:** The declaration is Tau Ceti's `HeckeRing.GL2.Newform.analyticRank_eq_analyticOrderNatAt` (`TauCeti/NumberTheory/ModularForms/Newforms/AnalyticInvariants.lean:92` at the pin); written bare it matches the stem of this roadmap's own `analyticRank`, `analyticRank_congr` and `analyticRank_eq_newform_analyticRank`, and `Suggested.lean` never mentions it. README line 927 already writes `Newform.analyticRank_eq_analyticOrderNatAt`, which the gate does not flag.

**Repair:** Write `Newform.analyticRank_eq_analyticOrderNatAt` at lines 286 and 942 (or the fully qualified `HeckeRing.GL2.Newform.analyticRank_eq_analyticOrderNatAt`). Tested: the gate's text scanners on a scratch copy with exactly those two edits report `readme-ids-missing=0` (the remaining scratch failures, `depcheck: NOT IN ORDER` and `git`, are artefacts of the copy having no merge order and no repository; on the worktree with the candidate order the dependency check passes, below).

## R02 (P3) — `max(θ, 1)` in the split-case asymptotic is vacuous (carried from the previous review)

**Location:** `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/README.md:1742` (“m_n(w) = h_K c_w (p−1)pⁿ⁻¹ + O(n·max(θ,1)ⁿ)”); `θ` is introduced at line 1734 (“is O((n+1)θⁿ) for some θ < p”) with no lower bound.

**Claim:** The guard `max(θ, 1)` never acts, and the only case it would change (`θ = 1`) it gets wrong.

**Witness:** `θ` bounds the larger root modulus of `x² − λx + p` over the eigenvalues `λ` of `T_p` on the orthogonal complement; the roots have product `p`, so that modulus is at least `√p > 1` for every `λ` (`|λ| ≤ 2√p`: both moduli equal `√p`; `2√p < |λ| < p+1`: real roots with larger one in `(√p, p)`). Solving `m_n + m_(n−1) = M_n − M_(n−1)` accumulates `Σ_(k≤n) (k+1)θ^k`, which is `O((n+1)θⁿ)` exactly when `θ > 1` and `O(n²)` at `θ = 1`. Instance `p = 3`, `λ = 0`: `θ = √3 = 1.7321`, `max(θ, 1) = θ`.

**Repair:** As in the previous review: write `O(nθⁿ)` at line 1742 and add “`θ ≥ √p`” (so `√p ≤ θ < p`) where `θ` is introduced at line 1734. Nothing else in the argument (the leading term `h_K c_w (p−1)pⁿ⁻¹`, the positivity from `θ < p`) changes.

## Previous findings

- R01 — not repaired: README 1742 still reads “+ O(n·max(θ,1)ⁿ)” and line 1734 still introduces `θ` only by “for some θ < p”; the 32-line change set touches lines 281–289 and 911–945 only. Written again as R02.

## Verified sound

An incremental re-review: the diff of the folder since 7a356fe (30 insertions, 2 deletions) was read line by line, together with everything it cites: Tau Ceti's `AnalyticInvariants.lean` at the pin, Mathlib's `LFunction.lean` at the pin, 3.2–3.4 of this README (lines 860–960), the Layer 3 section of `Suggested.lean` (lines 252–318), and EllipticCurveModularity R29.3–R29.4 at the head of its open pull request. No file outside the folder changes (`git diff --stat origin/main...HEAD` outside the folder is empty, as the worker's `outside-folder=0` also says); `scratch/overlaps.md` lists no open pull request changing this roadmap, no dropped id either way, and no id defined only by an open revision.

### Gate, dependency check, elaboration, binders, padding

Worker's gate at cb2a609: every check passes except `readme-ids-missing=1` (R01); `build=0`. Dependency check run here on the candidate order:

```text
depcheck: 238 roadmaps, 2321 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line; the roadmap is at position 340, after GrossZagierAndArithmeticHeights (339); the suppliers the change set names are earlier: EllipticCurveModularity (169), PeriodsAndSpecialValues (319); Tau Ceti is the pin.

`lake env lean` on `Suggested.lean` (2.8 s): 37 `declaration uses sorry` warnings (36 at the previous head plus the new theorem), exit 0, nothing else. A scratch copy with `#check @analyticRank_eq_newform_analyticRank` elaborated to

```text
∀ {U : Set ℂ} {F : ℂ → ℂ} (E : WeierstrassCurve ℚ) [E.IsElliptic] {N : ℕ} [NeZero N]
  (f : HeckeRing.GL2.Newform N 2),
  (∀ n : ℕ, n ≠ 0 → (PowerSeries.coeff n) (UpperHalfPlane.qExpansion 1 ⇑f.toCuspForm) = ↑(E.LFunction n)) →
  ∀ (h : IsContinuation E U F), analyticRank E h = f.analyticRank ⋯
```

which is the README's statement: over `ℚ`, elliptic, any level `N`, weight `2`, coefficients agreeing at every positive index, every continuation `h`. No binder is lost (the `U`, `F` section variables are the continuation's own data). One-tactic probe (`first | rfl | simp | infer_instance | exact trivial | decide | (intros; simp_all)`) on the new theorem: goal left open (`⊢ analyticRank E h = f.analyticRank ⋯`), so it is not padding; the 36 other sorry sites were probed at the previous head and are untouched. The new import `TauCeti.NumberTheory.ModularForms.Newforms.AnalyticInvariants` exists at the pinned Tau Ceti; no `set_option`, no sorry'd data, no admitted `example`.

### Pinned declarations opened this round

| Object | File at the pin | What was read |
|---|---|---|
| `HeckeRing.GL2.Newform.analyticRank f hk := analyticOrderNatAt (ModularForm.L hk f.toCuspForm) (k/2)` | `TauCeti/NumberTheory/ModularForms/Newforms/AnalyticInvariants.lean:80` | the right side of 3.4's identification; `hk : 0 < k`, `k : ℤ` (`two_pos` is `(0 : ℤ) < 2`) |
| `analyticRank_eq_analyticOrderNatAt` | same file, line 92 | hypotheses `Differentiable ℂ F` and `F s = LSeries (fun n ↦ (qExpansion 1 f.toCuspForm).coeff n) s` for `k/2 + 1 < Re s`; conclusion `f.analyticRank hk = analyticOrderNatAt F (k/2)`; its proof goes through `CuspForm.eq_strictWidthInfty_cpow_mul_L` with `strictWidthInfty_Gamma1` (width `1`, so the `cpow` factor is `1`) |
| `analyticOrderAt_L_ne_top`, `L_ne_zero` | lines 72, 65 | finiteness of the order, from `a₁ = 1` (`Newform.isNorm`, `Newform.lean:108`) |
| `Newform N k` | `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104` | `(N : ℕ) [NeZero N] (k : ℤ)`: the `[NeZero N]` binder of the Lean statement is the carrier's |
| `WeierstrassCurve.LFunction : ArithmeticFunction ℤ`, `WeierstrassCurve.LSeries W s = LSeries ((↑) ∘ W.LFunction) s` | `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:79`, 84 | the cast `(E.LFunction n : ℂ)` in `hf` is this coercion; `IsContinuation.eqOn` is against this `LSeries` |
| `analyticOrderNatAt f z₀ := (analyticOrderAt f z₀).toNat` | `Mathlib/Analysis/Analytic/Order.lean:62` | equals this roadmap's `analyticRank W h := (analyticOrderAt F 1).toNat` on the same `F` |

### Cross-roadmap citations resolved (EllipticCurveModularity at the head of #1018, via `roadmaps show`)

- R29.3 “One newform with exact coefficients” (line 1021): `IsNewformOf E F` for a normalized weight-two newform `F` of level `M` (line 1070), cross-level uniqueness, and the existence construction selecting `F_E` primitive at the exact level `N_E` (line 924); its `Suggested.lean` defines `coeff F n := (UpperHalfPlane.qExpansion 1 F.toCuspForm).coeff n` and `IsNewformOf` on Tau Ceti `Newform M 2` with `lCoeff E n := E.LFunction n` (line 477).
- R29.4 “Tate modules, exact conductor and every Euler factor” (line 1262): `IsNewformOf.coeff_eq`, `A_n(F) = a_n(E)` for every `n ≥ 0` (lines 1430–1432; Lean line 129: `coeff F n = (lCoeff E n : ℂ)`).

So the hypothesis `hf` of the new theorem is exactly what R29.3–R29.4 deliver, on the same carriers (`qExpansion 1` of the newform's cusp form; Mathlib's `LFunction`), and the README's description of the two layers is accurate. The `*Needs:*` line names them for the `ℚ` identification only, which is the only place they are used.

### Ownership

The analytic rank of a newform is Tau Ceti's (`Newform.analyticRank`); the analytic rank of `E/K` from a continuation is this roadmap's (3.4), and the new target is the comparison between the two over `ℚ`, which no other roadmap states (`roadmaps grep` of `analyticRank` and “analytic rank” over the open heads and main in the previous round; EllipticCurveModularity R29.6 states continuation, functional equation and parity, not the rank). Tau Ceti at the pin has `analyticRank` only in `Newforms/AnalyticInvariants.lean` and `LFunction/Sign.lean` (no elliptic-curve analytic rank), so nothing is restated.

### Adversarial mathematics table

The changed statement is the first row; the other rows are the previous report's, carried forward for the statements the diff leaves untouched.

| Statement | Instance | Left side | Right side / control | Result |
|---|---|---|---|---|
| 3.4 `analyticRank_eq_newform_analyticRank`: coefficient hypothesis | 11a1, `f = 11.2.a.a = η(z)²η(11z)²` | `(qExpansion 1 f).coeff n` for `n = 1…13`: `1, −2, −1, 2, 1, 2, −2, 0, −2, −2, 1, −2, 4` | `E.LFunction p = p + 1 − #E(𝔽_p)`: `−2, −1, 1, −2, 4` at `p = 2, 3, 5, 7, 13`; `a₁₁ = 1` (split, `1 − T`); `a₄ = a₂² − 2 = 2`, `a₆ = a₂a₃ = 2` | agree; `hf` is satisfiable |
| 3.4 same: `n = 0` | any `E`, `f` | `(qExpansion 1 f).coeff 0 = 0` (cusp form) | `E.LFunction 0 = 0` (`ArithmeticFunction.map_zero`); `LSeries.term a s 0 = 0` on both sides | `n ≠ 0` restriction exact, harmless either way |
| 3.4 same: half-planes | `k = 2` | Tau Ceti needs `F = LSeries(coeff)` on `Re s > k/2 + 1 = 2` | `IsContinuation.eqOn` gives `F = E.LSeries` on `Re s > 3/2 ⊇ Re s > 2` | the route's `Re s > 2` is right |
| 3.4 same: both sides on 11a1, 37a1 | `L(11a1, 1) = 0.2538419 ≠ 0`; `L(37a1, 1) = 0`, `L′(37a1, 1) = 0.3059998` | `analyticRank E h = 0`; `1` | `f.analyticRank = analyticOrderNatAt (ModularForm.L) 1 = 0`; `1` (same entire function) | agree |
| 3.4 same: wrong model | `f.analyticRank` taken at `s = k − 1 = 1` versus `k/2 = 1` | coincide only at `k = 2` | the statement fixes `k = 2`, so no ambiguity; for `Newform N k`, `k ≠ 2`, no `hf` can hold (weight-`k` coefficients are not `E.LFunction`) | no wider class admitted |
| 3.4 same: level | `f` of any level `N` with `hf` | both sides depend on `F` and on the coefficient series only | `N` free; R29.3–R29.4 supply `N = N_E` | true for every `N`, as stated |
| 3.4 same: non-elliptic `E` | `[E.IsElliptic]` present | needed for `isContinuation_of_modularity` (the route), not for the statement's elaboration | consistent with Conventions line 138 | kept |
| 1.1–1.2, 1.6, 2.3, 2.5–2.7, 3.1–3.2, 3.6, 4.7, 4.10, 4.12, 5.1–5.6 (41 rows) | as in the previous report | as in the previous report (values recorded there) | unchanged text | carried from the review at 7a356fe |
| 4.10 split-case asymptotic (R02) | `p = 3`, `λ = 0`; `λ = 3.9` | `θ = √3 = 1.7321`; larger root `2.846` | `≥ √3 = 1.732`, `< 3`; `max(θ,1) = θ` | guard vacuous; `θ = 1` would give `O(n²)` not `O(n)` |

### Seeded sample

Of the sampled targets only 3.4 falls in the change set; its new inputs are Tau Ceti declarations and EllipticCurveModularity sections, resolved above at the pin and at the open head. The other sampled targets (1.2, 2.1, 2.3, 3.3, 3.6, 4.2, 4.3, 4.6, 4.8, 4.10, 4.11, 5.1, 5.2, 5.6) are untouched since the previous full review, whose conclusions stand.

### Remarks on untouched text (no change requested)

- The 3.4 `*Needs:*` line now lists Tau Ceti names for the `ℚ` identification; the `## Exact supplier contracts` bullet (281–289) is the only other place they appear, as the house shape asks.

## Not verifiable

Nothing in the change set cites a paper source. The previous report's list stands unchanged: Rubin 1991/1994, Hida 2004, Brumer 1967 (paywalled; read as restated in Vatsal and Greenberg); Vatsal 2003 §6 (no readable text); Silverman AEC and Advanced Topics, BLR §1.2, Mazur Cor. 4.1, Manin 1972 §5, Abbes–Ullmo Thm A, Zagier 1985 (paywalled); the LMFDB knowls `ec.q.optimal`, `ec.q.manin_constant`, `ec.q.modular_degree`, `ec.q.faltings_height`, `ec.q.faltings_ratio` (browser checks); the journal pagination of Vatsal 2005 and Cornut 2002.

## Source issues

- none (no paper source was opened this round; the gap in vatsal §4.6 recorded by the previous review stands).
