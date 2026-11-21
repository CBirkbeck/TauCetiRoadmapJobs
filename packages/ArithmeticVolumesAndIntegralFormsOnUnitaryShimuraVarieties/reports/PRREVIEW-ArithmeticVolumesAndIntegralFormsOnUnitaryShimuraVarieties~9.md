# Review of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (pull request #2923 at 264fef4)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties/`
**Verdict:** accepted

**Summary.** Accepted: this is an incremental re-review of the 55 lines changed since a690df7, and the one finding of the previous review is repaired. 8.19d (i)–(ii) are now stated for every CM field unramified over its real subfield with any CM type, which is the generality of the cited declaration of the formal proof, and the argument added for `𝒪_𝔠^× = 𝒪_F^×` is correct. The three small corrections and the format note are repaired as well; there are no new findings, small corrections or format notes. The human reviewers keep the scope question (an unrefereed formal proof as the main source) and one licence question.

## Questions for the author

- Carried over, the change does not bear on it: several cited declarations of the formal proof take named statements as hypotheses (`testFacts` at 8.14b; `tower_weil_theorem` at 8.15c, with the tower properties `I1`–`I7`). Are the forms recorded at 8.14b and 8.15c meant without these hypotheses? I did not trace where each is discharged. (For 8.5 (b) I did: the hypothesis `CMCurve` of `GlobalTheory.chowla_selberg_lie_lines` is proved, `GlobalTheory.T.exists_cmEllipticCurve_withPeriod`, line 9 of `Development/AbelianVarietyTheory/Proofs/UniformizationProofs/ExistsCmEllipticCurveWithPeriodStatement.lean`.)

## Previous findings

- R01 — repaired: 8.19d now opens "For (i) and (ii) let `E` be a CM field, unramified over its maximal real subfield `F` at all finite places, with a CM type `Φ`"; (iii) keeps the setting of 8.19b.
- C01 — repaired: "(b) for every curve and every `k ⊃ K` is this roadmap's own. [FormalProof] … has one curve for each `D ≥ 7` squarefree with `D ≡ 3 (mod 4)`".
- C02 — repaired: the local factor stands "in place of the two Euler factors at each `𝔮 ∈ Q` above which `χ` is unramified (at the other `𝔮 ∈ Q` the local factor is `1` …)".
- C03 — repaired: the route of 8.19b names "two general statements that are steps of this roadmap" (the shifted Hilbert–Eisenstein expansion, the isogeny formula for `G₂^*`); the *Needs* of 8.19b and 8.19c say the same.
- N01 — repaired: the supplier contracts now have EllipticCohomology Layer 1, ClassicalArithmeticCompletion §7.5, UniformWildKernelBounds §7.6 and ComplexMultiplicationAndExplicitReciprocity §2.3; the Dependencies paragraph lists the three roadmaps.

## Verified sound

| Statement | Instances tried | README side (computed) | Other side (computed) | Result | Change |
|---|---|---|---|---|---|
| 8.19d (i), general CM field | formal `toric_sum_eq_hecke_L_value_mul_auxiliary_factors` (line 7 of its file) | any CM `E`, any CM type, `E/F` unramified, `s ≥ 1`, base conductor, `Q` split prime to `𝔣` | `IsCMField E`, `IsCMType φ`, `UnramFin E`, `1 ≤ s`, `IsBaseCond 𝔣`, `IsFinSetSplitPlacesCoprimeConductor`; no `K`, no `D` | agree | none |
| 8.19d (i), units | `u ∈ 𝒪_𝔠^×`, `u = a + c`, `a ∈ 𝒪_F`, `c ∈ 𝔠𝒪_E` | `u/ū − 1 = (c − c̄)/ū ∈ 𝔠𝒪_E ⊂ P`, `P` over odd `l` unramified | root of unity `ζ ≠ 1`, `ζ ≡ 1 (P)`: order `l^k`, so `ℚ(ζ_{l^k}) ⊂ E` ramified at `l`; contradiction, `u ∈ F` | holds | none |
| 8.19d (i), local factor | `Y = 1`, `N𝔮 = 2`, `w = ½`; `χ` ramified at `𝔮`; `Q = ∅` | `X = 1 + (N𝔮−1)w²/((1−Yw)(1−Y⁻¹w)) = 2`; `X·(½)(½) = ½` | bracket of (i): `(½)² + ¼ = ½`; ramified: sum of a nontrivial character over `N𝔮 − 1` classes `= 0`, factor `1`; `Q = ∅`: `T(χ; 𝔣) = Λ(s, χ)` | holds | none |
| 8.19d (ii) | (i) for `Q` over (i) for `Q ∖ {𝔮}` | quotient `= (1 − Yw)(1 − Y⁻¹w) + (N𝔮 − 1)w²` | uses nothing of `K`, `D`, or `E/ℚ` abelian | holds | none |
| 8.5 (b), credit | `chowla_selberg_lie_lines` (line 218), `chowla_selberg_of_mean_log` (line 189), `IsLieNormSq` | one curve, `D ≥ 7` squarefree `≡ 3 (4)`, over `𝒪_M`, `M ⊂ ℂ`; mean `log(π·H(v, v)) = −log Ω_K` | `7 ≤ d`, `Squarefree d`, `d % 4 = 3`, `M : IntermediateField ℚ ℂ`; `r = π·Re hermForm`; `−meanLog M n = γ + log(2π/√d) − L′/L(1)` | agree | none |
| 8.19b route, step (4) supplier remark | NoncommutativeAndEquivariantIwasawa §6.1, step 0(c) | series of a finite-order character, depleted, no additive shift | `G_{k,ε}` with constant term `2^{−r}L_Σ(ε, 1 − k)`; no shift `ξ₀` | agree | none |
| 8.19c *Needs*, §2.3 | ComplexMultiplicationAndExplicitReciprocity §2.3 at its open head | level functions with semilinear action of `GSp_{2g}(ℤ/N)`, weight `0` | "semilinear right action of `GSp_{2g}(ℤ/Nℤ)`" on quotients of equal-weight forms; `g = 1` through ImaginaryQuadraticClassNumber H3.1 | agree | none |
| New contracts | EllipticCohomology Layer 1; ClassicalArithmeticCompletion §7.5; UniformWildKernelBounds §7.6 | `ℤ[c₄, c₆, Δ]/(c₄³ − c₆² − 1728Δ)`, weights 4, 6, 12; `det(X_{gh⁻¹}) = ∏_χ Σ_g χ(g)X_g`; budget bound with `J` | each stated so at the cited place (Layer 1 on main; §7.5 on main; §7.6 at the open head, `J ≥ 1`) | agree | none |

The rows for the untouched statements stand as in the previous review, of a690df7.

- Source locators checked against the text: [FormalProof], three files opened for the changed credits and settings (the two cited at 8.5 (b) and 8.19d (i), and the definition of `IsLieNormSq` and `CMCurve` in `Development/AbelianVarietyTheory/Statements/PrincipalLattices/LogHermFormOfUnitDiscriminant.lean`, lines 28 and 35). The sampled targets 8.5, 8.19b and 8.19d fall in the changed passages and were checked there; the others are untouched.
- Library declarations opened at the pins: none new; the change touches no Lean statement.
- Cross-roadmap citations resolved: 5 (NoncommutativeAndEquivariantIwasawa §6.1 step 0(c), ComplexMultiplicationAndExplicitReciprocity §2.3, EllipticCohomology Layer 1, ClassicalArithmeticCompletion §7.5, UniformWildKernelBounds §7.6); the citation resolver lists no cross-roadmap citation as missing.
- Automatic checks: all passed. Dependency check: `depcheck: 169 roadmaps, 2000 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder and the family index.
- Elaboration: `lake env lean` on `Suggested.lean` gives the `sorry` warning only (line 68); the file is unchanged since a690df7, so the signature comparison and the one-tactic probe of the previous review stand.
- The pull request's title and description: read against this head; no sentence is contradicted ("The CM values (8.19b–8.19d) state their own fields" still holds).
- Overlap check: read HeightsForLogSingularMetrics, GluedTargetAndDivisionInequality, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties, HodgeTateLatticesAndLubinTateLogarithms, ThetaChainsAndFrobeniusPrimeSums, ArakelovGeometryAndAbelianHeights, ShimuraCompactifications in the previous review; the change adds no object and no layer; nothing shared.
- Source independence: changed passages only; 4 passages compared with 1 source (the credit of 8.5 (b), the setting and the unit argument of 8.19d, the route sentence of 8.19d (i), against the three files of [FormalProof] above, which contain no prose), none shared; largest share [FormalProof], 40 of 46 locators; no layer added, removed or reordered, so the arrangement was not compared again.
- Research link: 8.5 is the Chowla–Selberg formula (Chowla–Selberg 1967); 8.19b–8.19d are CM-value results of Damerell (1970), Shimura and Hecke; 8.15–8.17 are arithmetic proportionality for flag bundles, relatives of Köhler and Burgos Gil–Kramer–Kühn; all serve Alpöge's formal proof (2026). Rests on the README References and the three texts read.

## Not verifiable

- [Announcement] (README References): not read.
- The other published works of the References (Colmez 1993, Hecke, Katz, Kollár, Bost and others): cited without locators; not fetched.
- Whether [FormalProof] discharges the named hypotheses of the declarations cited at 8.14b and 8.15c: not traced (see the question).

## Source issues

- none

## For the human reviewers

- Scope: most targets are marked *NEW* and specify the mathematics of a formal Lean proof announced on 2026-11-20 by one author (README References, [FormalProof], [Announcement]); no refereed source states them. Chowla–Selberg 1967 and Damerell 1970 are published.
- Licence: `chowlaSelberg_classMean` in `Suggested.lean` has the hypotheses and the conclusion of `GlobalTheory.chowla_selberg_eta` in the public repository leanprover-community/riemann-hypothesis (`Development/AbelianVarietyTheory/Proofs/HomogeneousIdeals/DedekindZetaEqSumRealEisenstein.lean`, line 222); names differ. Its docstring cites that file. I did not read that repository's licence.
- Not tested: [Announcement] was not read; wording was not compared with it.
