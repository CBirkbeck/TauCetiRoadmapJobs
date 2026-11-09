# Review of EllipticCurvePeriodsAndModularParametrizations (pull request #1715 at 91ab26b)

**Verdict:** accepted

This is an incremental re-review of the 15 lines changed since cb2a609 (9 insertions, 6 deletions, all in `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/README.md`). The change repairs both findings of the previous review: it qualifies the Tau Ceti name at README 286 and 942, and it fixes the range of `θ` and the split-case error term in 4.10 at README 1734–1745. Neither repair introduces a new defect. The gate passes, `Suggested.lean` is unchanged and still elaborates, and no finding remains.

## Previous findings

- R01 — repaired: README 286 now reads “`Newform.analyticRank_eq_analyticOrderNatAt` (any entire function agreeing with the coefficient series on `Re s > k/2 + 1` computes it)”, and README 942 reads “`Newform.analyticRank_eq_analyticOrderNatAt` and EllipticCurveModularity R29.3–R29.4”. The gate gives `readme-ids-missing=0`.
- R02 — repaired: README 1734 now reads “is O((n+1)θⁿ) for some θ with √p ≤ θ < p (α and β have product p, …)”. README 1744 reads “m_n(w) = h_K c_w (p−1)pⁿ⁻¹ + O((n+1)θⁿ), the alternating sum of the error terms being dominated by its last term because θ ≥ √p > 1”.

## Verified sound

**Scope.** I read the folder diff from cb2a609 to 91ab26b line by line, together with everything that cites it or that it depends on:

- the `From Tau Ceti` contract bullet (README 281–289);
- 3.4 and its `*Needs:*` line (README 911–945);
- the 4.10 CM-reduction argument from the tree classification to the Ramanujan remark (README 1690–1770);
- the sections that argument cites.

No file outside the folder changes: `git diff --stat origin/main...HEAD` outside the folder is empty, and the gate reports `outside-folder=0`. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` only. `scratch/overlaps.md` lists no open pull request that changes this roadmap, no dropped id in either direction, and no id that only an open revision defines.

### Gate, dependency check, elaboration, binders, padding

**Gate.** I ran the gate on this head with the candidate merge order and the targeted build:

```text
gate EllipticCurvePeriodsAndModularParametrizations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

This agrees with the worker's gate at this head. Without `--order`, the gate falls back to the configured order, which does not list this roadmap yet, so it prints `NOT IN ORDER` (insert after the last supplier). That is the design-stage placement, not a defect.

**Dependency check** (candidate order, `--movable`):

```text
depcheck: 237 roadmaps, 2309 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The roadmap sits at position 340, after GrossZagierAndArithmeticHeights (339). The suppliers that the changed passages and their `*Needs:*` lines name all come earlier:

| Supplier | Position |
|---|---|
| AdelicAlgebraicGroups | 52 |
| NeronModelsAndSemistableAbelianVarieties | 66 |
| WeightsInEtaleCohomology | 147 |
| HilbertModularVarietiesAndShimuraCurves | 160 |
| SerreWeightAndLevelOptimisation | 163 |
| ComplexMultiplicationAndExplicitReciprocity | 166 |
| EllipticCurveModularity | 169 |
| PeriodsAndSpecialValues | 319 |

Tau Ceti is the pin.

**Elaboration.** `lake env lean` on `Suggested.lean` gives 37 `declaration uses sorry` warnings and nothing else, exit 0. `Suggested.lean` is byte-identical to cb2a609 (`git diff cb2a609 HEAD -- Suggested.lean` is empty).

**Binders.** The worker's `#check @` file now elaborates, since the targeted build has supplied the missing Tau Ceti object files. It printed 55 signatures. The 56th line is a spurious `#check @…and` produced by the generator from a docstring; it is not a declaration of the roadmap. The signature of `analyticRank_eq_newform_analyticRank` is identical to the one recorded in the previous report: `{U F}`, `E : WeierstrassCurve ℚ`, `[E.IsElliptic]`, `{N} [NeZero N]`, `f : Newform N 2`, coefficient hypothesis for `n ≠ 0`, every `h : IsContinuation E U F`. The binder comparison and the one-tactic probe of the earlier reviews therefore stand unchanged; no Lean statement is touched.

**Headline theorems.** The module docstring lists the period-lattice characterization and its real shapes, model independence of the global period, the isogeny lattice inclusion and degree index, nonvanishing of the L-series, the continuation-independent leading term and its comparison with the newform's analytic rank, Stevens' minimal curve, rank-zero period rationality, and Faltings ratio one. All of these are unchanged.

### Pinned declarations opened this round

| Object | File and line at the pin | What was checked |
|---|---|---|
| `HeckeRing.GL2.Newform.analyticRank_eq_analyticOrderNatAt` | Tau Ceti `NumberTheory/ModularForms/Newforms/AnalyticInvariants.lean:92` | The name the repaired lines write as `Newform.…`; namespace `HeckeRing.GL2.Newform` (line 58). Hypotheses: `Differentiable ℂ F`, and `F s = LSeries (coeff) s` for `k/2 + 1 < Re s`. Conclusion: `f.analyticRank hk = analyticOrderNatAt F (k/2)`. |
| `HeckeRing.GL2.Newform.analyticRank` | same file, line 80 | `analyticOrderNatAt (ModularForm.L hk f.toCuspForm) (k/2)`, as the contract bullet says |
| `analyticOrderAt_L_ne_top` | same file, line 72 | Named in the same bullet; exists |
| `ModularForm.L` | Mathlib `NumberTheory/ModularForms/LFunction.lean:134` (namespace `ModularForm`, line 36) | The bullet's “entire `L`-function” |
| `AnalyticAt.meromorphicOrderAt_eq` | Mathlib `Analysis/Meromorphic/Order.lean:303` | 3.4's comparison with PS.3.3: `meromorphicOrderAt f x = (analyticOrderAt f x).map (↑)` |
| `analyticOrderNatAt` | Mathlib `Analysis/Analytic/Order.lean:62` | `(analyticOrderAt f z₀).toNat`, the same as this roadmap's `analyticRank` |

### Cross-roadmap citations resolved this round

These are the citations in the changed passages and their `*Needs:*` lines, resolved at the heads named:

- **EllipticCurveModularity, open head:**
  - R29.3 (heading at line 1021) defines `IsNewformOf` for a normalized weight-two newform.
  - R29.4 (heading at line 1262) gives `IsNewformOf.coeff_eq`, `A_n(F) = a_n(E)` for every `n ≥ 0`, at line 1430.
- **PeriodsAndSpecialValues, open head:** PS.3.3 “Leading terms and their rationality”, line 861.
- **HilbertModularVarietiesAndShimuraCurves, open head:**
  - §R18.3.5 “Perfect quaternionic pairing” (2886);
  - §R18.3.6 “Split Hecke normalization” (2898);
  - §R18.3.7 “Norm-factor forms and Eisenstein support” (2914);
  - §R18.3.22 “Definite Jacquet–Langlands realization” (3211).
- **WeightsInEtaleCohomology, open head:** §6.1 “Eigenform purity and the Ramanujan bound”, line 695.

### Adversarial mathematics table

The first nine rows are the changed statements, with values computed this round by a scratch script. The remaining rows carry the previous reports' rows forward for the statements the diff leaves untouched.

| Statement | Instance | Left side | Right side / control | Result |
|---|---|---|---|---|
| README 286, 942: `Newform.analyticRank_eq_analyticOrderNatAt` | `k = 2` | Tau Ceti hypothesis on `Re s > k/2 + 1 = 2` | 3.4's proof (README 927) uses `Re s > 2`; `IsContinuation.eqOn` gives `Re s > 3/2 ⊇ Re s > 2` | Resolves at `AnalyticInvariants.lean:92`. Same qualification as README 927. Gate id check passes. |
| 4.10 range of `θ` (README 1734) | `p = 3`, `λ ∈ {0, −1, 2√3, 3.9, −3.9}` | larger root modulus of `x² − λx + p`: `1.7321, 1.7321, 1.7321, 2.8458, 2.8458` | `[√3, 3) = [1.7321, 3)`; product of the moduli `3.0000` in each case | in range |
| same | `p = 5`, `λ ∈ {−1, 5.9}`; `p = 7`, `λ = 7.99` | `2.2361, 4.8742`; `6.9883` | `[2.2361, 5)`; `[2.6458, 7)` | In range. As `λ → p+1` the modulus `→ p`, so `θ < p` uses `|λ| < p+1`, as the new parenthesis says. |
| 4.10 eigenvalue `μ_n − μ_(n−2)` of `T^cyc(pⁿ)` | `p = 3`: constants (`λ = 4`); `λ = 0` | `4, 12, 36, 108, 324`; `0, −4, 0, 12, 0, −36` | `(p+1)pⁿ⁻¹ = 4, 12, 36, 108, 324`; `|·| ≤ (n+1)3^(n/2)` | agree |
| 4.10 `(n+1)` factor | double root `λ = 2√3`, `p = 3` | `|ν_n|/θⁿ = 4.67, 8.00, 14.67, 28.00` at `n = 5, 10, 20, 40` | `|ν_n|/((n+1)θⁿ) = 0.778, 0.727, 0.698, 0.683` | `O(θⁿ)` would be false; `O((n+1)θⁿ)` holds |
| 4.10 alternating error sum (README 1744) | `θ = √3` | `Σ_(j≤n)(j+1)θʲ / ((n+1)θⁿ) = 1.847, 2.073, 2.212, 2.303, 2.334` at `n = 5, 10, 20, 50, 100` | `θ/(θ−1) = 2.366` | Bounded. At `θ = 1` the same ratio is `3.5, 6, 11, 26, 51`, unbounded, so the stated `θ ≥ √p > 1` is the hypothesis that is used. |
| 4.10 spectral input, concrete Brandt matrix | `q = 11`, `N = 1`, `p = 3`; classes `j = 0, 1728`, `e = (3, 2)` | `B(3) = [[1,3],[2,2]]`: `e_j B_ij = e_i B_ji`, row sums `4`, eigenvalues `4` and `−1 = a₃(11a)`, so `θ = √3 = √p` | `c_w = 2/5, 3/5` (mass `1/3 + 1/2 = 5/6`); `max_(n≤29, v, w) |A_n(v,w) − c_w(p+1)pⁿ⁻¹| / ((n+1)θⁿ) = 0.200` | `A_n` estimate holds; `θ = √p` attains the new lower bound |
| 4.10 split-case solution | same matrix, `h_K = 2`, one conductor-one point over each class (illustrative); solve `m_n + m_(n−1) = M_n − M_(n−1)` from `m_0` | `m_1…m_6 = 1, 5, 16, 41, 127, 398` and `3, 7, 20, 67, 197, 574` | main `h_K c_w(p−1)pⁿ⁻¹ = 1.6, 4.8, 14.4, 43.2, 129.6, 388.8` and `2.4, 7.2, 21.6, 64.8, 194.4, 583.2`; `max_(n≤29) |m_n − main| / ((n+1)θⁿ) = 0.173` for both `w` | Agrees. `Σ_w m_n = 4, 12, 36, 108 = h_K(p−1)pⁿ⁻¹`; `M_n − 2M_(n−1) > 0` for `n = 1…29`. |
| 4.10 positivity (README 1741, untouched, consistent with the change) | `p = 3`, `n = 2` | `M_n − 2M_(n−1)` main `= h_K c_w(p+1)(p−2)pⁿ⁻² = 4h_K c_w` | `θ < p` | Still positive for `n ≥ n₀`. The new `θ ≥ √p` does not weaken it. |
| 3.4 `analyticRank_eq_newform_analyticRank` (7 rows) | 11a1, 37a1, `n = 0`, half-planes, level, weight, `[IsElliptic]` | values as in the previous report, for example coefficients `1, −2, −1, 2, 1, 2, −2, 0, −2, −2, 1, −2, 4`; `L(11a1,1) = 0.2538419`; `L′(37a1,1) = 0.3059998` | `p + 1 − #E(𝔽_p)`; ranks `0`, `1` on both sides | carried from the review at cb2a609 |
| 1.1–1.2, 1.6, 2.3, 2.5–2.7, 3.1–3.2, 3.6, 4.7, 4.10 (Vatsal data, tree classification, Greenberg route, Eichler mass), 4.12, 5.1–5.6 (41 rows) | as recorded there, for example 11a1 `Δ = −11⁵`, `Ω = 1.2692093`, Néron covolumes `1.8515436, 0.3703067, 9.2577181`, `h_Fal(11a1) = −0.3080098` | as recorded there | as recorded there | unchanged text; carried from the review at 7a356fe |

### Seeded sample

Of this round's sampled targets (2.1, 2.4, 2.5, 3.3, 3.4, 3.6, 3.7, 4.1, 4.7, 4.8, 4.9, 4.11, 5.1, 5.2, 5.4), only 3.4 falls in the change set, through its `*Needs:*` line. That line cites no paper. Its Tau Ceti and Mathlib inputs were opened at the pin and its supplier sections resolved at their heads (above). The other sampled targets are untouched since the full review, whose conclusions stand. The README flags no locator as unverified.

### Ownership

The change adds no object and no ownership claim. It only qualifies a Tau Ceti name and sharpens a proof sketch. The ownership assessment of the previous reviews stands:

- the newform's analytic rank belongs to Tau Ceti;
- the rank of `E/K` from a continuation, and its comparison over `ℚ`, belong to this roadmap.

## Not verifiable

Nothing in the change set cites a paper source. The previous report's list is unchanged:

- Rubin 1991/1994, Hida 2004 and Brumer 1967 are paywalled; they were read as restated in Vatsal and Greenberg.
- Vatsal 2003 §6 has no readable text.
- Silverman AEC and Advanced Topics, BLR §1.2, Mazur Cor. 4.1, Manin 1972 §5, Abbes–Ullmo Thm A and Zagier 1985 are paywalled.
- The LMFDB knowls `ec.q.optimal`, `ec.q.manin_constant`, `ec.q.modular_degree`, `ec.q.faltings_height` and `ec.q.faltings_ratio` need a browser check.
- The journal pagination of Vatsal 2005 and Cornut 2002 could not be checked.

## Source issues

- none
