# Review of PadicFunctionalAnalysis (pull request #1807 at 113b939)

**Verdict:** needs changes

Incremental re-review: `TauCetiRoadmap/PadicFunctionalAnalysis/` changed by 0 lines since fa7b83e (the head the previous review read). The pull request's own change to this folder is still the §5.3 rewrite (lines 918–925) and the dependency-order bullet (lines 1056–1059), which the previous review verified as mathematically sound; that verification stands (table below). What changed since fa7b83e is outside the folder: the two consumer-sentence edits in `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md` were reverted, so the earlier R11 is repaired. Every other finding of the previous review is unrepaired at this head, each re-verified at its line below, and the gate still fails (`prnum`, `sorry-examples`, `imports`, `mathlib-subimports`, `no-import-mathlib`, `depcheck`, `build` warnings). Findings R04–R10 predate this pull request on main; they are listed because the gate and the shape rules hold every revision to them.

## R01 (P2) — Upward supplier: LocallyAnalyticDistributions §0.0 feeds §2.4

Location: `README.md` line 44 ("and LocallyAnalyticDistributions §0.0 supply the completed-tensor carriers"), lines 471–474 ("Use the separated completed projective tensor and functoriality of LocallyAnalyticDistributions §0.0"), lines 1052–1055 (dependency bullet "LocallyAnalyticDistributions §0.0 supplies the general completed tensor construction").

Claim: the completed-extension corollary of §2.4 takes its tensor carrier from LocallyAnalyticDistributions §0.0.

Witness: the dependency check on this head: `UPWARD: PadicFunctionalAnalysis (on main) -> LocallyAnalyticDistributions (#64) at README lines [1052]`. LocallyAnalyticDistributions is merge-order line 65, is not on main (no folder under `TauCetiRoadmap/` or `Completed/`), and consumes this roadmap (§1.4, §2.1–§2.2, §2.6, §4.3–§4.4, §4.7): the edge is a cycle.

Repair: give the corollary one tensor carrier that is on main. AdicSpacesPartII R0.3 (its README line 1769, already cited at line 44) supplies the Banach-module completed tensor; keep that citation alone, or state the Banach-space completed tensor over a complete isometric field extension as a §2.4 target with its universal property. Delete the LocallyAnalyticDistributions §0.0 citations at lines 44, 472–474 and the bullet at 1052–1055. Mentions of LocallyAnalyticDistributions §0.1, §1.1, §1.4 (lines 697–698, 808–809, 815–816) stay only reworded as what that consumer proves later, never as "supplied by".

## R02 (P2) — The loop with PadicMeasuresIwasawaAlgebras is not cut

Location: `README.md` lines 927–935 ("use the general coefficient-extension interface to view an integral measure ν on ℤ_pˣ as a ℂ_p-valued measure ... Use the supplier's coefficient extension for `extendIntegralMeasure`"), line 32 (scope row "Measures": "coefficient extension ... PadicMeasuresIwasawaAlgebras, Layers 0–1"), lines 559–560 ("General integration and measure topologies come from PadicMeasuresIwasawaAlgebras Layers 0–1").

Claim: after this pull request, PadicFunctionalAnalysis no longer consumes PadicMeasuresIwasawaAlgebras.

Witness: "the supplier's coefficient extension" is PadicMeasuresIwasawaAlgebras Layer 1 `completedGroupAlgebraBaseChange` (its README on main, lines 982–989); its supplier table line 367 records this roadmap's `extendIntegralMeasure` "with O coefficients supplied by §1.7"; its lines 94–95 and 2675–2677 declare this roadmap its supplier ("to be contributed to TauCetiRoadmap ahead of this one"). Each roadmap consumes the other. The dependency check does not see it because both are on main.

Repair: own the extension here. In §5.3 state the target: for a profinite space `X` (here `ℤ_pˣ`), a bounded `ℤ_p`-linear functional on `C(X,ℤ_p)` extends uniquely to a `ℂ_p`-linear functional on `C(X,ℂ_p)` of the same norm, by density of locally constant functions (§3.1) and completeness of `ℂ_p`; `AbstractMeasure` at the pin has `map` (`Mathlib/NumberTheory/Padics/Measure/Basic.lean` line 105) and no coefficient extension, so nothing is duplicated. Reword line 32 so PadicMeasuresIwasawaAlgebras appears only as a consumer, and lines 559–560 as a deferral. Tested on the README's own Check (lines 1039–1040): the extension of `δ_a` has norm one and `|measureFun δ_a κ| = |κ(a)| = 1`, which the local statement gives directly.

## R03 (P2) — Serre's theorem is statable at the pins and absent from `Suggested.lean`

Location: `README.md` lines 10–11 ("The central results are Serre's orthonormalisation theorem; ..."), §2.3 lines 443–456; `Suggested.lean` states no form of it, and its module docstring (lines 20–40) names no headline as not statable.

Claim: the acceptance test states the roadmap's headline theorems or says which are not statable.

Witness: [Serre] Proposition 1 and its Corollaire (Serre line 60–85, printed pp. 69–70) are statable with the file's own `IsONable` (line 163) and `IsPotentiallyONable` (line 189): for `K` a complete ultrametric `NontriviallyNormedField` whose nonzero norms lie in `r^ℤ` for some `0 < r < 1`, every Banach `K`-space `E` satisfies `IsPotentiallyONable K E`, and `IsONable K E` when its nonzero norms lie in `r^ℤ`. Every carrier exists at the pin. The Amice isometry `C₀(ℕ,E) ≃ LA_h(E)` (§4.4) and the unbounded Amice bijection `D(ℤ_p,K) ≃ R⁺` (§4.7, [Col] Théorème II.2.2, Col line 1502) are also absent, and the docstring does not say what they lack.

Repair: add the two Serre statements with the discreteness hypothesis written as `∃ r : ℝ, 0 < r ∧ r < 1 ∧ ∀ x : K, x ≠ 0 → ∃ n : ℤ, ‖x‖ = r ^ n`; in the module docstring name the Amice isometry and the unbounded Amice bijection as not statable and say which carrier each lacks (the disc-expansion map of `m_h(n)·binom(x,n)`; a carrier for `LA(ℤ_p,K)` and its bounded dual).

## R04 (P3) — Gate: `Mathlib.<submodule>` imports, no `import Mathlib`

Location: `Suggested.lean` lines 1–16 (16 `import Mathlib.…` lines); gate rules `imports`, `mathlib-subimports`, `no-import-mathlib`, and the 16 "designed for use with the module system" build warnings.

Repair: replace lines 1–16 by the single line `import Mathlib`, keeping lines 17–18 (`TauCeti.RingTheory.Huber.Basic`, `TauCeti.NumberTheory.Padics.PadicIntegers`, both present at the pin).

## R05 (P3) — Gate: an admitted `example`

Location: `Suggested.lean` lines 317–325 (`example (h : ℕ) : let F : PowerSeries ℚ_[p] := ... := by sorry`).

Witness: gate rule `sorry-examples`; elaboration reports `declaration uses sorry` at line 318. An admitted example tests nothing.

Repair: delete it; the README keeps the derivative-functional Check (lines 823–825: moments `(−1)^(n−1)/n`, transform `log(1+T)`).

## R06 (P3) — Gate: pull-request numbers and process links in the README

Location: lines 29–31 (links to pull requests #854, #919, #926), 37, 40, 43 (#817, #813), 158, 166, 170–171 (Mathlib pull requests #42865, #42836, #23772, #23791), 1106–1118 ("Existing Lean work", a pinned commit hash, GitHub tree links, "Coordinate integration with the author"), 1120–1121 (fork links pinned to commits). Gate rule `prnum` (5 lines).

Repair: cite roadmaps by name and section (RestrictedPowerSeries, NewtonPolygons, AdicSpacesPartII R0.3/R0.4, AdicSpacesPartIII R3.6, LocallyAnalyticDistributions as a consumer); describe the intended operator-norm and `amiceTransformₐ` shapes in words (neither `ContinuousLinearMap.opNorm` over a semiring nor `AbstractMeasure.amiceTransformₐ` exists at the pin: `Mathlib/Analysis/Normed/Operator/Basic.lean` line 170 defines `opNorm` over a `NontriviallyNormedField`; `amiceTransformₐ` occurs nowhere); delete the "Existing Lean work" section and the two fork links.

## R07 (P3) — README and `Suggested.lean` disagree on declared names

Location: README backticked names of this roadmap's own that the Lean file does not declare (README count / Lean count, each `1/0` or `2/0`): `pMultiplesIndicator`, `weightMeasure`, `existsUnique_psiMeasure` (lines 638–639), `eq_aeval_binomialSeries` (903), `nonempty_weightSpace_equiv` (862), `extendIntegralMeasure`, `measureFun`, `measureFun_norm_le`, `measureFun_injective` (934–938), `isLinearTopology_padicInt` (916), `isBoundedSMul_padicInt_padic` (621), `amiceTransform_completedGroupAlgebra_compat` (923), and `NormedRing.IsTate`, `NormedRing.PseudoUniformizer` (71–73, nowhere at the pins). Lean declarations the README never names (`0/≥1`): `IsDiscRealization`, `single`, `IsMultiplicative`, `IsTate`, `IsOrthonormalFamily`, `TCoord`, `q`, `matrixCoeffInputFirst`, `opNorm`, `le_opNorm`, `opNorm_eq`, `nonempty_mahler_coordinates`, `coeff_amiceTransform_eq_mahlerTerm`, `measurePairing_norm_le`, `measurePairing_injective`, `exists_linearIsometryEquiv_of_isOrthonormalBasis`, `exists_isOrthonormalBasis_iff`.

Witness: the grep counts above, recomputed at this head. `IsDiscRealization` (`Suggested.lean` 292–295) is consumed by no theorem, and its `∑'` is the junk value `0` unless `E` is complete, ultrametric and has a bounded `ℤ_p`-action, binders its signature lacks (it carries only `NormedAddCommGroup E`, `Module ℤ_[p] E`).

Repair: remove the backticks from the undeclared names (the prose stays), delete `IsDiscRealization`, and name every kept declaration where its README statement lives.

## R08 (P3) — Padding in `Suggested.lean`

Location: `PseudoUniformizer.isTopologicallyNilpotent` (line 70), `PseudoUniformizer.isPseudoUniformizer` (75), `PseudoUniformizer.isTateRing` (81), `opNorm_eq` (137), `nonempty_mahler_coordinates` (238), `coeff_amiceTransform_eq_mahlerTerm` (244).

Witness: each is proved by one term or one tactic from the library, as the file itself shows: `tendsto_pow_atTop_nhds_zero_of_norm_lt_one`; the two-field anonymous constructor; `opNorm_eq` is `rfl` against `ContinuousLinearMap.opNorm` (`Mathlib/Analysis/Normed/Operator/Basic.lean` line 170); `nonempty_mahler_coordinates` wraps `PadicInt.mahlerEquiv` (`Mathlib/NumberTheory/Padics/MahlerBasis.lean` line 356); `coeff_amiceTransform_eq_mahlerTerm` is one `rw [AbstractMeasure.coeff_amiceTransform]` (`AmiceTransform.lean` line 81).

Repair: delete them from `Suggested.lean`; the README keeps the statements (lines 151–154, 163–164, 264–268).

## R09 (P3) — Lean form

Location: module docstring lines 20–40 ("representative interfaces", "not an exhaustive checklist", "Do not import this roadmap prototype into production mathematics"); `open scoped ... Classical` at line 45; declarations without a docstring at lines 53, 100, 106, 111, 119, 131, 137, 163, 189, 213, 220, 251, 257, 264, 270, 274, 288, 297, 300, 312, 331, 333, 336, 356, 367, 374 (`IsMultiplicative`, `exists_tateSeminorm`, `tateGauge_eq_zero_iff`, `tateGauge_equiv`, `tateGauge_rpow`, `le_opNorm`, `opNorm_eq`, `IsONable`, `IsPotentiallyONable`, `exists_finset_norm_le`, `exists_continuousLinearEquiv_prod_of_countableType`, `norm_toCLMEquiv_eq_iSup_coeff`, `mem_range_amiceTransform_iff`, `existsUnique_integral_iff_norm_le_one`, `phiMeasure`, `amiceTransform_phiMeasure`, `LocallyAnalytic`, `amiceDualNorm`, `amiceDiscNorm`, `amiceDualNorm_le_amiceDiscNorm`, `q`, `WeightSpace`, `TCoord`, `existsUnique_character_of_norm_lt_one`, `weightTest`, `measurePairing_norm_le`).

Repair: docstring "P-adic functional analysis: target signatures" saying the roadmap is README.md, that the file states the headline theorems against the pinned APIs, and which are not statable (R03); a docstring on every declaration stating the mathematics and source; drop the global `Classical`.

## R10 (P3) — README shape

Location: the whole README predates the current shape: no `## Exact supplier contracts`, `## How to read the build`, `## Downstream consumers`; no `*Needs:*` line on any target; layers end in bold "Dependencies." paragraphs rather than `### Examples` and `### Dependencies`; definitions carry no API bullets; process wording at lines 17–22 ("Suggested homes", "representative interfaces"), 48–49 ("the prototype imports library modules"), 154 ("the prototype proves"), 161, 173–174, 182 ("when available"), 269 ("Reuse `IsTateRing.of_isUnit_norm_lt_one` when that native comparison is available", a name that exists nowhere at the pin), 1110–1113.

Repair (minimum for the text this pull request touches): give the §5.3 comparison paragraph (lines 918–925) a `*Needs:*` line, "§3.4 the integral Amice equivalence (`AbstractMeasure.amiceTransformEquiv`), ProfiniteProPGroups Layer 9 the power-series coordinate (`TauCeti.completedGroupAlgebra.powerSeriesCoordinate`, `powerSeriesCoordinate_binomialSeries`), §5.1 the decomposition", and a locator ([RJW] Proposition 3.16, RJW line 816, arXiv p. 16, for the group-algebra side; [RJW] Theorem 3.25, RJW line 959, for the Amice side). The full reshaping is a separate revision of this roadmap.

## Previous findings

- R01 — not repaired: lines 44, 471–474, 1052–1055 unchanged ("Use the separated completed projective tensor and functoriality of LocallyAnalyticDistributions §0.0"); the dependency check reports the same UPWARD line.
- R02 — not repaired: lines 927–935 unchanged ("Use the supplier's coefficient extension for `extendIntegralMeasure`"); line 32 and lines 559–560 still name PadicMeasuresIwasawaAlgebras Layers 0–1 as suppliers.
- R03 — not repaired: `Suggested.lean` unchanged; no Serre statement; the docstring (lines 20–40) still names no headline as not statable.
- R04 — not repaired: lines 1–16 are still sixteen `import Mathlib.<submodule>` lines; no `import Mathlib`.
- R05 — not repaired: the admitted `example` at lines 317–325 remains (`:= by sorry`).
- R06 — not repaired: lines 29–31, 37, 40, 43, 158, 166, 170–171, 1106–1121 unchanged; gate `prnum` still lists five lines.
- R07 — not repaired: the name counts are unchanged (twelve README-only backticked names, two names that exist nowhere, seventeen Lean-only declarations); `IsDiscRealization` still at lines 292–295.
- R08 — not repaired: the six one-tactic declarations remain at lines 70, 75, 81, 137, 238, 244.
- R09 — not repaired: the docstring at lines 20–40, `open scoped … Classical` at line 45 and the undocumented declarations are unchanged.
- R10 — not repaired: the README still has no supplier-contract, build-order or consumer sections, no `*Needs:*` lines, and the process wording at lines 17–22, 48–49, 154, 161, 173–174, 182, 269, 1110–1113.
- R11 — repaired: `git diff --stat origin/main...HEAD` outside the pull request's own folders is empty; `Completed/ArithmeticDirichletSeries/README.md` line 331 and `TauCetiRoadmap/SymplecticGeometry/README.md` line 77 are back to main's text.

## Verified sound

**The change since fa7b83e.** `git diff --stat fa7b83e..HEAD -- TauCetiRoadmap/PadicFunctionalAnalysis` is empty. The folder's diff against main is unchanged (README 13 insertions, 11 deletions; `Suggested.lean` untouched). The files changed since fa7b83e are the other roadmap folders this pull request owns (BordismFormalGroups, CharacteristicClasses, ClassifyingSpaces, TopologicalKTheory, each with its own review) and the two reverted consumer sentences (R11). None of the roadmaps this folder cites is among the changed ones.

**Gate, dependency check and build at this head.** The worker's gate fails on `prnum` (5), `sorry-examples` (1), `imports` (1), `mathlib-subimports` (16), `no-import-mathlib` (1), `depcheck` (1) and `build` (16 module-system warnings), all tied to R01 and R04–R06. Rerun of the dependency check:

```
UPWARD: PadicFunctionalAnalysis (on main) -> LocallyAnalyticDistributions (#64) at README lines [1052]
depcheck: 230 roadmaps, 2167 edges, 1 problem(s)
```

`lake env lean TauCetiRoadmap/PadicFunctionalAnalysis/Suggested.lean` exits 0 in 9 s; 20 `declaration uses sorry` warnings at lines 100, 106, 111, 119, 131, 176, 183, 213, 220, 251, 257, 264, 274, 307, 312, 318, 344, 356, 374, 380 (the same lines as at fa7b83e), plus the 16 module-system warnings of R04; no error.

**Elaborated signatures.** The file is byte-identical to the one the previous review checked, and the 4 "dropped binder" leads in the worker's signature file are the same four (`exists_tateSeminorm`, `tateGauge_eq_zero_iff`, `tateGauge_equiv`, `tateGauge_rpow`): false positives, since `include ha hϖ hnil hb` at line 98 carries them and the elaborated types show `1 < a → ↑ϖ ∈ A₀ → IsTopologicallyNilpotent ↑ϖ → (nhds 0).HasBasis … →`. No `#check` rerun was needed for an unchanged file. The one-tactic probe of the previous review (`first | rfl | simp | infer_instance | sorry` on a scratch copy: 17 of 20 still admit, 3 leave unsolved goals, nothing sorried closes) stands for the byte-identical file; the padding in R08 is the six already-proved one-tactic declarations.

**Suppliers resolved on main (content at 3b51055).** `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras` (lines 94–95, 367, 982–989, 2675–2677 read for R02), `RestrictedPowerSeries`, `AdicSpacesPartII`, `AdicSpacesPartIII`, `NewtonPolygons`, `CompactOperators`; `Completed/ProfiniteProPGroups`, `Completed/LocalFieldsRamification`, `Completed/AdicSpaces` all exist. `LocallyAnalyticDistributions` is on neither list (R01). The two "Lean names found nowhere" leads of the worker's citation check (`AbstractMeasure.amiceTransformₐ`, README 167; `IsTateRing.of_isUnit_norm_lt_one`, README 269) are confirmed absent at the pins and are covered by R06 and R10. Ownership against open pull requests beyond the previous review's grep was not rechecked, since no passage changed.

**Library declarations opened at the pin for this round.** `PadicInt.mahlerEquiv : C(ℤ_[p], E) ≃ₗᵢ[ℤ_[p]] C₀(ℕ, E)` (`Mathlib/NumberTheory/Padics/MahlerBasis.lean` line 356, with `mahlerEquiv_apply` at 381 giving the forward-difference coefficients and `mahlerEquiv_symm_apply` at 383 the series), which is the inverse §3.2 uses. The previous review's list (`AbstractMeasure` and its `map`, `amiceTransform`, `coeff_amiceTransform`, `amiceTransformEquiv`; `PowerSeries.IsRestricted`, `HasEval`, `binomialSeries`; `ContinuousLinearMap.opNorm`; `IsHuberRing`, `IsPseudoUniformizer`, `IsTateRing`; `PadicInt.compactSpace_units`) stands for the unchanged file.

**Seeded sample.** No sampled target lies in a changed passage. Four sample targets the previous review did not cover were spot-checked anyway:

- §2.7 (triangular perturbations): [Col] line 467–469 (Prop. I.3.2: the change of basis is triangular with integer entries and 1 on the diagonal) and line 753–757 (proof of Thm I.4.7: block upper-triangular with lower-triangular diagonal blocks whose diagonal entries are invertible); [Buz] line 221–233 (ON basis) and 328–342 (Lemma 2.3 (a)–(c)). The abstract statement is right: with `M = (D+U) + L`, `D+U` is invertible with inverse of norm at most one (finite columns, unit diagonal of norm one, ultrametric), and `M = (D+U)(1 + (D+U)⁻¹L)` with `‖(D+U)⁻¹L‖ ≤ c < 1`, so the Neumann series gives an isometric automorphism.
- §3.2 (Mahler): [Mah] line 156–160 (Theorem 1, scan page 4, printed p. 25 of Crelle 199: the Mahler coefficients of a continuous function on `ℤ_p` form a null sequence and the series converges to it), scalar-valued; the module-valued form is the pinned `mahlerEquiv` with exactly the binders §3.2 names (`IsBoundedSMul ℤ_[p] E`, `IsUltrametricDist E`, `CompleteSpace E`).
- §4.6 (additive characters): from [Col] Thm I.4.7 (line 712), `χ_t ∈ LA_h` iff `v(t)·n − v(⌊n/p^h⌋!) → ∞`, i.e. `v(t) > 1/((p−1)p^h)`; at the boundary the subsequence `n = p^{h+k}` gives the bounded value `s_p(p^k)/(p−1) = 1/(p−1)`, so the boundary is excluded as stated.
- §5.5 (scalar factors): `t_h = κ(exp(p^h)) − 1` is well defined because §5.4 restricts to `h ≥ v_p(q)` (`exp(p^h)` converges for `h ≥ 1` at odd `p`, `h ≥ 2` at `p = 2`); the two radius conditions are the convergence of `log(1 + d⁻¹cz)` (needs `r‖c‖ < r_p`) and of `exp(log(1+t_h)·log(1+d⁻¹cz)/p^h)` (needs `r‖c‖‖t_h‖ < ‖p^h‖ r_p`), and the Gauss norm is one because the constant term `κ(d)` has norm one and every other coefficient has norm less than one.

**Adversarial table.** Rows for unchanged statements are carried from the previous report (r1), with their values; the changed-statement row (§5.3 composite) is recomputed. `g` is `tateGauge`.

| Statement | Instance | Left | Right | Result | Change |
| --- | --- | --- | --- | --- | --- |
| §5.3 composite `δ_a ↦ [γ^a]`, `T = [γ]−1` (this PR; recomputed) | `a = 0, 1`; `p = 2`, `q = 4`, `γ = 5` | `δ_0 ↦ 1 ↦ [1]`, `δ_1 ↦ 1+T ↦ [γ]`; `5` generates `1+4ℤ_2` | `[γ^0] = [1]`, `[γ^1]` | agrees | none |
| same, generator change (r1) | `γ' = γ^u`, `u ∈ ℤ_pˣ` | `T' = [γ']−1 = (1+T)^u − 1` | PPG L9 `exists_isUnit_powerSeriesCoordinate_eq_subst` | agrees with §5.2 line 877–878 | none |
| §2.7 triangular perturbation (new) | `M = 1 + pS` (`S` the shift) at `p = 2`; `M` with entry `p` in every position below the diagonal | `1+pS`: columns finite, diagonal 1, subdiagonal norm `1/2`; `(1+pS)⁻¹ = Σ(−pS)^k` norm 1 | second matrix: column `j` is `p` in all rows `> j`, not null | first is an isometric automorphism, second is excluded, as the Checks say | none |
| §3.2 character coefficients (new) | `χ(x) = (1+t)^x`, `n = 0, 1, 2` | `Δ^nχ(0) = Σ_k (−1)^{n−k} binom(n,k)(1+t)^k = t^n`: `1, t, t²` | README `(χ(1)−1)^n` | agrees | none |
| §4.6 criterion (new) | `p = 2`, `t = 2` (`χ = 3^x`), `h = 0, 1` | `‖2‖ = 1/2 < 2^{−1/2^h}`: false at `h = 0`, true at `h = 1` | `3^x = (−1)^x(−3)^x`, `(−1)^x` locally constant mod 2, `exp(log 3) = −3` | `3^x ∈ LA_1 \ LA_0`: agrees | none |
| §4.6 second form (new) | same | `‖3^{2^h} − 1‖`: `1/2` at `h = 0` (not `< r_2 = 1/2`), `1/8` at `h = 1` | first form | agrees both levels | none |
| §5.5 Gauss norm (new) | `p = 2`, `h = 2`, `κ(1+4y) = exp(ℓ·log(1+4y)/4)`, `‖ℓ‖ < 1/2` | `log(1+4y)/4 = y − 2y² + …`, coefficient `v = 2(n−1) − v(n) ≥ 0`; `‖ℓ^n/n!‖ < 1` for `n ≥ 1` | constant term 1 | Gauss norm 1 | none |
| §0.4 Check `(ℤ_p, p², p)` (r1) | `x = p`, `x = p²`, `a = p`, `ϖ = p²` | `g(p) = 1`; `g(p²) = p⁻¹` | README `1, p⁻¹` | agrees; `g(p)² ≠ g(p²)` | none |
| §0.4 membership `ϖ ∈ A₀` (r1) | `A = ℚ_p²`, `A₀ = {x ≡ y mod p²}`, `ϖ = (p, p²)` | `g(1) = 1`, `g(ϖ) = a⁻¹`, `g(1+ϖ) = a²` | `a² > max(1, a⁻¹)` | ultrametricity fails; `hϖ` needed and present | none |
| §0.4 `N(x) = max(|x|, |x|²)` (r1) | `|ϖ| = r < 1` | `N(ϖ)N(ϖ⁻¹) = r⁻¹` | `> 1 = N(1)` | no multiplicative pseudo-uniformiser | none |
| `tateGauge_rpow` (r1) | `x = 0`; `x` with `n_x` | `0`; `b^{−n_x}` | `0^{log b/log a}`; `(a^{−n_x})^{log b/log a}` | agrees | none |
| `tateGauge_eq_zero_iff` (r1) | `ℚ_p`, `A₀ = ℤ_p`; indiscrete `A` | `g x = 0 ⇔ x = 0`; `g ≡ 0` | `T2`; closure{0} = A | agrees both directions | none |
| `tateGauge_equiv` (r1) | `ℚ_p²`, `ϖ = (p,p)`, `A₀ = ℤ_p²`, `B₀ = {x ≡ y mod p}` | `g_A ≤ g_B ≤ a·g_A` | `C = a` | holds | none |
| §0.2 Neumann (r1) | `‖x‖ < 1`; `x = 0` | `‖(1−x)⁻¹‖ = 1`, `‖(1−x)⁻¹−1‖ = ‖x‖` | `1`; `0` | agrees | none |
| §0.3 power comparison (r1) | JN 2.1.7, `|ϖ|₂ = |ϖ|₁^s` | `C₁|a|₁^s ≤ |a|₂ ≤ C₂|a|₁^s` | README | agrees | none |
| `le_opNorm` (r1) | `R = ℤ_p`, `u = id : (ℤ_p, |·|²) → (ℤ_p, |·|)`; `M = 0` | `sInf ∅ = 0`; `0 ≤ 0` | — | `IsTate R` excludes the first; second holds | none |
| `exists_isOrthonormalBasis_iff` (r1) | `I = ∅`; zero ring; incomplete `c₀` | `M = 0`; `‖1‖ = 1 ≠ 0`; no isometry | `C₀(∅,R) = 0`; excluded; `CompleteSpace` at line 173 | agrees | none |
| `exists_finset_norm_le` (r1) | `P = 0`; `P = R·single i₀ 1` | `S = ∅, C = 1`; `S = {i₀}, C = 1` | `0`; equality | holds | none |
| `exists_continuousLinearEquiv_prod_of_countableType` (r1) | `M = 0`; `K⟨T⟩` constants | `d = (0, id)`; Schneider splitting | — | holds | none |
| §2.6 adapter (r1) | 2×3 and 3×2 over `ℚ_p` | `A(u∘v) = A(u)A(v)` | transpose reverses | consistent with LAD Convention 2 | none |
| §3.2 Mahler of `x²` (r1) | `x² = x + 2·x(x−1)/2` | `binom(x,1) + 2 binom(x,2)` | same | agrees | none |
| §3.4 `x^p − x` (r1) | `x = 1+p` | valuation 1 | sup `p⁻¹`, Gauss `1` | agrees | none |
| `existsUnique_integral_iff_norm_le_one` (r1) | `δ₀`; `p⁻¹δ₀`; `‖f‖ = p^{−j}` | `1`; `p`; `ν(f) = p^{j}μ(g)` | `≤ 1`; false; `‖ν f‖ ≤ p^{−j}` | agrees | none |
| `amiceTransform_phiMeasure` (r1) | `δ₁`, `δ₀`, `0` | `(1+T)^p`, `1`, `0` | `subst((1+X)^p−1)` | agrees | none |
| §3.4 `φ, ψ` at `p = 3` (r1) | `δ₂`, `δ₆`, `δ₁` | `φδ₂ = δ₆`, `ψδ₆ = δ₂`, `ψδ₁ = 0` | README | agrees | none |
| `norm_toCLMEquiv_eq_iSup_coeff` (r1) | `δ_a` | `1` | `sup_n ‖binom(a,n)‖ = 1` | agrees | none |
| §4.3 transition (r1) | `k = 1`, `w = b + pv` | `d_0 = Σ bᵏc_k`, `d_1 = Σ k b^{k−1} p c_k` | contraction `p^j` | agrees | none |
| §4.4 `E = 𝔽_p` (r1) | `x^p − x` | `d_(a,0) = a^p − a = 0` | nonzero vector | injectivity needs `p`-torsion-freeness, as stated | none |
| `amiceDiscNorm ≤ amiceDualNorm` (r1) | Legendre | `v_p(m!) ≤ n/((p−1)p^h)` | termwise | holds | none |
| `amiceDualNorm ≤ p · amiceDiscNorm (h+1)` (r1) | `n = p^h`, `p^{h+1}`, `m = p^k − 1` | `1 ≤ p·p^{−1/(p−1)}` etc. | — | holds; factor `p` necessary | none |
| both inequalities, junk (r1) | `‖coeff n‖ = p^{v_p(n)}` | both suprema finite | — | `hF` prevents junk `⨆` | none |
| §4.7 `b_n = 1/n!` (r1) | `h = 0, 1` | `D_0 = 1`, `D_1 = ∞` | README | agrees | none |
| §4.6/4.7 `‖t‖ = 2^{−1/2}` (r1) | `p = 2`, `h = 1, 2` | thresholds `2^{−1/2}, 2^{−1/4}` | fails level 1, passes 2 | agrees | none |
| §5.2 conductor valuations (r1) | odd `p`, `m ≥ 2`; `p = 2`, `m ≥ 3` | `1/(p^{m−2}(p−1))`; `1/2^{m−3}` | README | agrees | none |
| §5.4 equivalence (r1) | exponent `p^{h−v_p(q)}` | `p^{−1/((p−1)p^{h−v_p(q)})}` | `p^{−q/(p^h(p−1))}` | agrees | none |
| `exists_character_of_hasEval` (r1) | `x = γ`; zero ring | `κ γ = 1+z` | first conjunct | holds | none |
| `existsUnique_character_of_norm_lt_one` (r1) | dual numbers, `‖ε‖ = 1` | excluded by `‖z‖ < 1` | README Check 1029–1031 | as intended | none |
| `measurePairing_norm_le` (r1) | `κ` continuous on compact `ℤ_pˣ` | `‖κ(x)‖ ∈ {1}` | bound | holds | none |
| `measurePairing_injective` (r1) | `δ_a − δ_b` | `0` at `κ = 1`; `a − b` at `κ(x) = x` | — | separates | none |
| §5.6 gauge (r1) | `A₀ = H`, `ϖ = T`, `a = α⁻¹` | `‖T‖ = α`, `‖U‖ = 1`, `‖p‖ = α` | README | agrees | none |
| §5.6 evaluation at `t` (r1) | `p⁻¹ < |t| < 1` | `|d_m||t|^m ≤ (p|t|)^{−|m|}` | `→ 0` iff `p|t| > 1` | annulus right | none |
| §5.3 extension (R02) (r1) | `ν = δ_a` to `ℂ_p` | `‖ν_{ℂ_p}‖ = 1`, `κ(a)` | `|κ(a)| = 1` | elementary, must be owned here | R02 |

## Not verifiable

- [Sch] Schneider, *Nonarchimedean Functional Analysis* (Springer): settled as uncertified; cited at §§3–4, 8–10 by locator only.
- [Bel] Bellaïche, *The Eigenbook* (Birkhäuser): settled as uncertified; cited at Chapter II.1 by locator only.
- [BGR] Bosch–Güntzer–Remmert (Springer): settled as uncertified; its 2.7.1/4 and 3.7.2–3.7.3 are relayed through Conrad line 300 and JN line 423–428.
- [Mah] is an OCR'd scan (12 of 13 pages image-only); Theorem 1 at line 156–160 is legible, the displayed formula at line 157–160 only partly.

## Source issues

- **Gap** in KL at Remark 2.4.4, arXiv v5 p. 39: the source says that for any ring of definition `A₀` and topologically nilpotent unit `z` the function `inf{cⁿ : z⁻ⁿx ∈ A₀}` is a Banach-ring norm; it should require `z ∈ A₀` (or a power of `z` in `A₀`), since otherwise the ultrametric inequality can fail (`ℚ_p²`, `A₀ = {x ≡ y mod p²}`, `z = (p,p²)`); affects a stated result. The roadmap already adds the hypothesis (README line 1089, §0.4).
- **Error** in JN at Lemma 2.1.6, published version (JN footnote 3, line 500): the source says the published statement of the lemma is incorrect; it should be the arXiv v4 statement with the two-regime bound `|a|_ϖ ≤ C₁` for `|a|_π < 1` and `|a|_ϖ ≤ C₂|a|_π^s` otherwise; affects a stated result; corrected in print at arXiv:1604.07739v4 Lemma 2.1.6.
