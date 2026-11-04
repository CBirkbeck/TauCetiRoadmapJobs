# Review of LocallyAnalyticDistributions (pull request #854 at 5126fe0)

**Verdict:** needs changes

This is a full review of the repaired head. The three findings of the previous review were checked first: R01 (import the open-disc algebra) is repaired, `TauCetiRoadmap/LocallyAnalyticDistributions/README.md:53` and 134–142 now consume RestrictedPowerSeries §§7.1 and 2.1 and §1.2 keeps only the native-series comparison and the tail estimate; R02 (TeX scanner) is repaired, the gate reports `tex=0` and line 378 uses a code span; R03 (naming and layout contract) is repaired in the main (line 35 now says local names refer only to the nine declarations, API bullets and Checks are prose, `Suggested.lean` has the Layer 0 and Layer 4 section comments) with the residue recorded in R03 below. One new blocking finding (R01) was found in the ownership audit of the Lean headlines.

## R01 (P2) — The closed-disc maximum principle is RestrictedPowerSeries §2.4's theorem

**Location:** `TauCetiRoadmap/LocallyAnalyticDistributions/README.md:1042` (“Pointwise realization on a translated closed disc … its Gauss valuation equals inf over B(a,r) of v_p(φ(x))”), the API bullet at line 1048 (“`gaussVal_eq_inf` states this maximum principle”), the scope claim at line 41 (“with the maximum-principle comparison”), and `TauCetiRoadmap/LocallyAnalyticDistributions/Suggested.lean:65` (`gaussVal_eq_inf`, listed in the module docstring as a headline).

**Claim:** the statement “Gauss norm at radius R equals the supremum of the pointwise norms over the closed disc in an algebraically closed complete extension” is planned by a supplier on main, with the same Check and the same source, and this roadmap neither cites that section nor derives its form from it. RestrictedPowerSeries §2.4 (*Identity and maximum principles*) plans: for `f ∈ K⟨X₁,…,X_n⟩` there is a finite extension `L/K` and a point of `(L°)^n` attaining `‖f‖`, hence the Gauss norm is the supremum over extension-valued points; its scope list (line 40) names “maximum modulus” among the unit-radius Tate-algebra results it owns. The translated, arbitrary-radius, one-variable form stated here is a corollary: translate by `a`, scale by `c` with `|c| = R` when `R ∈ |K^×|`, and for `R ∉ |K^×|` (possible even for `ℂ_p`, whose value group is `p^ℚ`) write the closed ball as the increasing union of balls of radii `r_n ↑ R` in `|K^×|`, where `G_R(F) = sup_n G_{r_n}(F)` because the maximum defining `G_r(F)` is over finitely many indices. The roadmap's own supplier table (lines 134–144 and 183) cites RestrictedPowerSeries §§1.1, 2.1, 2.3, 7.1 and 7.2 only.

**Witness:** `TauCetiRoadmap/RestrictedPowerSeries/README.md:377-386` (the attainment statement and “the Gauss norm is the supremum over such extension-valued points”), its Check at line 388 (`X^p − X` has Gauss norm one but values of norm at most `p⁻¹` on `ℤ_p`), and its source line 394 (“[Colmez] §I.4 for the disc realisation”). This roadmap's Check at `README.md:1057` is the same test with `p = 3`: `X³ − X` has Gauss norm 1 and `|x³ − x|₃ ≤ 1/3` for every `x ∈ ℤ₃` (for `x = 1`: `0`; for `x = 2`: `|6|₃ = 1/3`).

**Repair:** add RestrictedPowerSeries §2.4 to the supplier contracts and to the *Needs* of the translated-disc target; rewrite that target as the derived comparison (translation, scaling by a scalar of norm `R`, and the increasing-union limit for radii outside the value group), keeping the `X³ − X` instance as a Check of the adapter; delete `gaussVal_eq_inf` from `Suggested.lean` and from the module docstring's list of stated headlines (the README keeps the comparison as a target), since a theorem a supplier plans is imported and never restated as a headline here. Tested on the witness: after the repair the `R = 1`, `a = 0` instance is exactly RestrictedPowerSeries §2.4's statement at `n = 1`, and the `R = 1/3`, `a = 0` instance of `X³ − X` over `ℚ₃` has Gauss norm `max(1/27, 1/3) = 1/3`, equal to the supremum over `|x| ≤ 1/3` (attained at `x = 3`: `|27 − 3|₃ = 1/3`), by the scaling step with `c = 3`.

## R02 (P3) — A declaration name was deleted from a sentence of the Tau Ceti contract

**Location:** `TauCetiRoadmap/LocallyAnalyticDistributions/README.md:56`: “the already in the tau ceti library (`RingTheory/PowerSeries/Weierstrass/Division.lean`) supplies division at a single radius”.

**Claim:** the sentence lost its subject; the declaration it referred to exists at the pin.

**Witness:** `TauCeti/RingTheory/PowerSeries/Weierstrass/Division.lean:485` declares `IsDistinguished.existsUnique_mul_add_eq` in namespace `TauCeti.PowerSeries` (its `_subring` form at line 530).

**Repair:** restore the name: “`TauCeti.PowerSeries.IsDistinguished.existsUnique_mul_add_eq` (`RingTheory/PowerSeries/Weierstrass/Division.lean`) supplies division at a single radius …”.

## R03 (P3) — Checks that name Lean witnesses, and a p = 3 test harness written as a target

**Location:** `TauCetiRoadmap/LocallyAnalyticDistributions/README.md:1745-1746` (“boxIndicator a m a=1”, “padicBox a (fun _ => 0)=Set.univ”), line 3022 (“With the continuity witnesses hc and hc₀ … transporting through e does not change these maps”), and the target at line 1752, “Normalized locally constant Haar functional on Z₃” (“using the one-coordinate model Fin 1→Z₃”).

**Claim:** these are the residue of the previous R03. A Check never names a Lean counterpart; the Haar paragraph is a unit-test harness fixed at `p = 3` and one coordinate, promoted to a construction target, while its six Checks (masses `3^(−m)`, norms `3^m`, growth one and not below one) are the content.

**Witness:** `Suggested.lean` declares none of `boxIndicator`, `padicBox`, `hc`, `hc₀`, `e`; the Haar functional's values are `3^(−m)` on depth-`m` balls, so `‖μ(1_ball)‖ = 3^m` and `3^m ≤ C·3^(rm)` fails for every `r < 1`, which is the whole use of the paragraph.

**Repair:** rewrite the three Checks in prose (“the indicator of a box at its own centre is 1, in every dimension including zero”, “depth zero in every coordinate gives the whole group”, “the identity cochain endomorphism has identity degree maps and the zero one has zero degree maps, unchanged by the chosen Banach identification”); state the Haar functional for `ℤ_p` (masses `p^(−m)`) as a Check of *Rectangular growth for a locally constant functional* and of *Equal-radius growth*, or keep it as a target only in its `ℤ_p^g` form.

## R04 (P3) — Identical Check triples copied under distinct supplier paragraphs do not test those paragraphs

**Location:** `TauCetiRoadmap/LocallyAnalyticDistributions/README.md`: the triple “Res(1,F)=1 / Res(T−a,F)=F(a) / Res(T²,b+cT)=b²” under five paragraphs (lines 584, 592, 600, 608 and 2652, including *Bounded polynomial coefficient in the resultant Bezout identity* and *Resultant detects analytic coprimality*); “Empty matrices have determinant one / nilpotent Jordan block / scalar a on a line” under six (lines 420, 452, 500, 508, 738 and 2138); “Polynomials are entire / Σp^(n²)Tⁿ / ΣpⁿTⁿ” under three (428, 766, 774); “For zero u the recurrence series … / diag(a,b) / 1+TN” under five (618–662); “For u=1 on a line … / zero u / u=1+N” under four (678–826); “At rank zero with P=1 … / B=T / B=c” under four (704–728).

**Claim:** a Check must discriminate the statement it sits under; none of the copied triples exercises the Bezout identity, the coprimality criterion, the direct-sum formula, the adjugate bound or the padding factor.

**Witness:** for *Bounded polynomial coefficient in the resultant Bezout identity* with `Q = T²`, `F = b + cT`: `Res = b²` and `b² = c²·Q + (b − cT)·F`, since `(b − cT)(b + cT) = b² − c²T²`, with `deg(b − cT) = 1 < 2`; the copied Checks never produce such a `G, H`. For *Resultant detects analytic coprimality*: `Q = T²`, `P = 1` gives `Res = 1` (coprime), `P = T` gives `Res = 0` and the common factor `T`.

**Repair:** replace each copied triple by Checks of the paragraph's own statement, such as the instances above, `P_{u⊕v} = (1 − aT)(1 − bT)` for `u = a`, `v = b` on two lines, and `‖v₂‖ ≤ p^(−3)` for `diag(p, p²)` against the product bound `b₀b₁ = p^(−3)`.

## R05 (P3) — Works cited without a References entry, and an undefined abbreviation

**Location:** `TauCetiRoadmap/LocallyAnalyticDistributions/README.md:1684`, 1690 and 1707 (“Pollack–Stevens' '`h-admissible`' … their Definition 6.1”, “Pollack–Stevens' h-admissibility”); line 3206 (“BCGP25’s relatively compact closure-proper criterion”).

**Claim:** Pollack–Stevens is cited for a definition and a slope condition but appears nowhere in `## References`; “BCGP25” is not a key of the references (they are “BCGP I” and “BCGP II”).

**Witness:** `grep -n Pollack README.md` returns only lines 1684, 1690 and 1707; `grep -n BCGP25` returns only line 3206.

**Repair:** add “Pollack–Stevens: R. Pollack and G. Stevens, *Overconvergent modular symbols and p-adic L-functions*, Ann. Sci. ÉNS 44 (2011), Definition 6.1” to the references (or cite RJW's Theorem B.1, already listed, for the slope condition), and write “BCGP II” at line 3206.

## R06 (P3) — Locator and attribution slips

**Location:** `TauCetiRoadmap/LocallyAnalyticDistributions/README.md:2016` (“Schneider–Teitelbaum, *p-adic Fourier theory*, Theorem 2.2, printed p. 8”); lines 1077, 1105, 1109 and 1123 (“Colmez–Nizioł, Appendix A, Proposition A.1 / Remark A.2 / Proposition A.3 / Proposition A.4 …; derived from the cited passage, not printed there”); the subsection numbering `### 4.13` → `### 4.15` at lines 2725 and 2822.

**Claim:** Theorem 2.2 of the Fourier paper is on printed page 9 (the page-8 footer precedes it); Propositions A.1, A.3 and A.4 and Remark A.2 are printed statements of exactly the Banach, Fréchet and compact-type extension and splitting assertions, so the “not printed there” tag is wrong for those four targets; §4.14 is absent while CompactOperators §3.4 on main refers to “LocallyAnalyticDistributions §4.14” for the monic-polynomial invertibility formulation.

**Witness:** st-fourier line 316 (Theorem 2.2, after the “8” footer at line 314); colmez-niziol-cst lines 2876, 2892, 2896 and 2922; `TauCetiRoadmap/CompactOperators/README.md:762`.

**Repair:** write “printed p. 9”; drop the “derived … not printed there” tag on the four Appendix A targets (keep it on the §1.5 nonsplit-sequence target, whose Remark A.6 is a remark); either renumber §§4.15–4.17 as §§4.14–4.16 or restore a §4.14 heading for the polynomial-invertibility interface so that the supplier's cross-reference resolves.

## Verified sound

**Head and gate.** Head `5126fe0f71071c2d4dff89b1d26166a9332e1e72`; `git diff --stat origin/main...HEAD` outside the roadmap folder is empty; the folder contains `README.md`, `Suggested.lean` and `metadata.toml` only. The worker's gate at this head: every scanner zero, `depcheck=0`, `build=0`, overall `OK`. The dependency check run here:

```text
depcheck: 201 roadmaps, 1311 edges, 0 problem(s)
```

No UPWARD or CYCLE line; the merge order lists LocallyAnalyticDistributions after CrystallineCohomology, PhiGammaModulesAndIwasawaCohomology and PadicLocalLanglandsForGL2Qp, its latest suppliers. No `set_option`, `lemma`, `#eval`, `#print`, sorry'd data, LaTeX delimiter, pull-request number or process word was found in the folder (scans of both files).

**Lean.** `lake env lean` on `Suggested.lean` elaborates with exactly five `declaration uses 'sorry'` warnings (lines 65, 76, 87, 131, 145). A scratch file with `#check @name` for all nine declarations elaborated once; every binder the README states is present: `gaussVal_eq_inf` keeps `CompleteSpace K`, `IsUltrametricDist K`, `IsAlgClosed K`, `Isometry φ`, `0 < R` and `IsRestricted R F`; `naHahnBanach` keeps the chain-of-closed-balls spherical completeness, `IsUltrametricDist K` and `IsUltrametricDist V`; `naFrechet_openMapping` keeps `T2Space`, `MetrizableSpace`, `CompleteSpace` and `WithSeminorms` on both sides; `tendsto_spectral_fixed_polynomial_gauss` keeps `NormOneClass`, `CompleteSpace`, `Nontrivial`, the ultrametric hypothesis, `IsEntire B`, `P.coeff 0 = 1`, `P.natDegree ≤ n` and `0 < R`; `tateAlgebra_isCompactOperator` keeps `FiniteDimensional ℚ_[p] K` and `IsUltrametricDist B`. No binder was lost. The one-tactic probe (`first | simp | rfl | infer_instance`) on a scratch copy closes none of the five theorems (errors at the five `sorry` sites); no padding. The four definitions have real bodies on native carriers and are used by the §4.13 headline.

**Headline inventory.** From the README: compact-type and strong-duality comparisons (Layer 0); finite-piece, Stein and tower Hyodo–Kato comparisons (§0.CR.6.6); Hahn–Banach and Fréchet open mapping (§0.2); topological Amice and the two nonsplitting theorems (Layer 1); Amice–Vélu–Vishik with the sharp bound, its vector form and the isotropic extension (Layer 2); the Mellin algebra identification and rigid–adic comparison (Layer 3); fixed-rank spectral convergence, operator spectral mapping, slope decompositions, perfect complexes, exact-slope constancy, Fréchet windows and the torus order (Layer 4). Stated: Hahn–Banach, Fréchet open mapping, fixed-rank spectral convergence, Tate-algebra compactness, and the maximum principle (R01). The others are named in the module docstring with the missing carrier each. Mathlib at the pin has no nonarchimedean Hahn–Banach (`exists_extension_norm_eq` needs `IsRCLikeNormedField`, `Mathlib/Analysis/Normed/Module/HahnBanach.lean:37-43`) and no Fréchet open-mapping theorem (`ContinuousLinearMap.isOpenMap` in `Analysis/Normed/Operator/Banach.lean` is Banach-only; `Topology/Algebra/Group/OpenMapping.lean` is the σ-compact group version); PadicFunctionalAnalysis's scope (`README.md:54`) excludes Hahn–Banach, and the only other mention across main and the open pull requests is a consumer, PadicDifferentialEquationsAndRigidCohomology, citing this roadmap's §0.2.

**Library declarations opened at the pins** (Mathlib `6b7abb3`, Tau Ceti `a91d3aa`): a `#check` file with 167 of the names the README cites elaborated; 165 resolved directly and the two completed-group-algebra names resolved after confirming their namespace (`TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:103,145` and `PowerSeries.lean:107,350`). The four one-variable Tau Ceti modules have no object file in this worktree's lake path and were checked in source instead: `isRestricted_of_abs_le` (`RingTheory/PowerSeries/Restricted.lean:51`), `isRestricted_polynomial` (64), `polynomialToRestricted` (85), `hasGaussNorm_of_isRestricted` (`GaussNorm.lean:91`), `IsDistinguished` (122), `gaussValuation` (500), `norm_eq_gaussNorm` and `norm_le_iff` (`TateAlgebra.lean:76,86`), `restrictedMvPowerSeriesGaussEquiv` (`Huber/Restricted/GaussNorm.lean:80`), `existsUnique_mul_add_eq` (`Weierstrass/Division.lean:485`, R02). Conventions checked at the pin: `Polynomial.resultant_X_sub_C_left` gives `Res(X − r, g) = g(r)` with no sign (`Mathlib/RingTheory/Polynomial/Resultant/Basic.lean:372`), `resultant_one_right` gives `f.coeff m ^ n` (368), `Polynomial.Monic.resultant_of_le` makes the resultant independent of the bound on the second argument for monic first argument (`TauCeti/RingTheory/Polynomial/Resultant/Basic.lean:65`), `MvPowerSeries.gaussNorm` is the supremum of `‖coeff‖·r^t` (`Mathlib/RingTheory/MvPowerSeries/GaussNorm.lean:57`), `IsStrictMap` is the quotient-to-range comparison without closed image (`Topology/Maps/Strict/Basic.lean:49-53`), `AbstractMeasure.dirac` exists (`NumberTheory/Padics/Measure/Basic.lean:97`), `IsTopologicallyNilpotent.isUnit_one_sub` (`TauCeti/Topology/Algebra/Nonarchimedean/GeometricSeries.lean:76`).

**Cross-roadmap citations resolved** (every supplier re-read at its current main or open head): PadicLocalLanglandsForGL2Qp §0.1 at #1312 (`AnalyticSupport.functions`, `AnalyticSupport.distributions`, `analyticPullback`, `analyticTensor_equiv`, `distributionConvolution`, strong biduality, discretely valued `L`; no inductive tensor, as the README says); PhiGammaModulesAndIwasawaCohomology §4.0–4.1 at #1310 (`compactCharacterSpace`, `rigidCharacterSpace`, `abelianAnalyticDistributions`, `scalarAbelianMellin`, `scalarAbelianMellin_coefficients`, `distributionMellin`, `analyticGammaRing`, `relativeMellin`); CrystallineCohomology at #857 (§CR.6.2 line 10495, §CR.6.5 lines 11100 and 11182); on main: CompactOperators §§0.1–0.5, 1.1–1.7, 2.4, 3.1, 3.3–3.5 with every named label and declaration (`IsFiniteRank.isCompletelyContinuous`, `isFiniteRank_iff_range_fg`, `IsRowCompact.isCompletelyContinuous`, `IsRowCompact.of_tendsto_opNorm_sum_pow`, `colemanDBounded_*`, `colemanDEntire*`, `charPowerSeries_eq_colemanDEntire`, `IsRieszProjection`, `IsRieszColemanProjection`, `c0_completedBaseChange`, `charPowerSeries_map`), PadicFunctionalAnalysis §§1.2, 1.4, 2.1–2.2, 2.4, 2.6, 4.3–4.4, 4.6–4.7 (`amiceDualNorm`, `amiceDiscNorm` and both inequalities, `IsONable`, `IsPotentiallyONable`, `exists_finset_norm_le`, `exists_continuousLinearEquiv_prod_of_countableType`, `HasPr`, the `D_h` and `S_h ≤ D_h ≤ p·S_{h+1}` contract, the level criterion `‖t‖ < p^(−1/((p−1)p^h))`), RestrictedPowerSeries §§1.1, 2.1, 2.3, 7.1–7.2 (`entireResultant`, `isUnit_of_evalAt_eq_zero`, the explicit monic quotient `Σ_k coeff(n+d+k)F·b_k`, `Res(T²,a+bT)=a²`, the `T³/(T²+aT+b)` division) and §2.4 (R01), RigidAnalyticGeometry §7.2 (`IsSlopeLE`, `IsSlopeDecomposition`, `exists_projection`, slope `≤ h` means annihilator roots of norm at least `r`) and §§2.1–2.2, AdicSpacesPartII R0.5 clauses (a), (b), (d), (f) (line 2789 ff.), R1.1 and R1.7 targets, AdicSpacesPartIII R3.4 (*quasi-stein-space* 10055, *quasi-stein-theorem-a* 10138), R3.6 (*completely-continuous-map* 10757 with `Huber.IsCompletelyContinuous`) and R3.9 (12480), AdicSpacesPartIV F1.5 (3820), F1.7 (4240) and F1.11 (5741), ReductiveGroupsPartII §RG2.1.2 (*torus-valuation-map* at 1809 with `⟨χ, v(z)⟩ = −ω(χ(z))`, `boundedPart`, `boundedPart_isCompact`, `translationLattice`), ReductiveGroups Layers 4 and 7, PadicMeasuresIwasawaAlgebras §§0.1–0.2, 2.1–2.5, 2.11–2.12, 3.1, 3a.1 (its own line 1668 places the Dirac naturality in §2.4), Completed AdicSpaces §§0.5, 3.1, 5.1, 5.3. Supplier-side cross-references back to this roadmap were noted: PadicFunctionalAnalysis §4.7 and §2.4 and CompactOperators §§1.7 and 3.4 cite LocallyAnalyticDistributions §§0.0, 1.1, 1.4, 4.2 and 4.14; RigidAnalyticGeometry §7.2 attributes a declaration name `slopeCriterion_classical_iff_geometric` to this roadmap's §4.16, which the README states in prose (not this roadmap's defect). Ownership by object was searched with `roadmaps grep` over main and all 430 open pull requests for Hahn–Banach, Fréchet open mapping, maximum modulus (R01), Amice–Vélu–Vishik, slope decompositions and Stein Hyodo–Kato cohomology: apart from R01, every other hit is a consumer or an unrelated archimedean statement. Ownership against open pull requests whose files the brief does not give was not checked beyond that index.

**Sources.** Twenty-two works were fetched through the sources service (arXiv, Numdam, and author pages with `--licence-class author-page`); the Coleman manuscript was fetched from its University of Chicago host as `institutional` (see *Not verifiable*). The seeded sample, read at the locators (line numbers are those of the service's extractions):

| Sample target | Locators opened | Outcome |
|---|---|---|
| §0.0 | schneider-nfa lines 4487 (Lemma 17.2, p. 110), 4576–4613 (Prop. 17.4, Cor. 17.5, pp. 112–113), 4635 (Prop. 17.6, p. 114); cdn-stein lines 342–445 (§§2.1.1–2.1.3, pp. 7–10); schneiders-qac lines 908–999 (Prop. 1.2.27, Cor. 1.2.28, Prop. 1.2.29, pp. 26–29); emerton-la lines 877–931 (Lemma 1.1.30, Props. 1.1.31–1.1.32, pp. 18–19, standing hypothesis spherically complete, lines 89–94) | Cross-norm of pure tensors, Hausdorffness, Fréchet ι = π, nonseparated cokernels and the left heart, compact-type ι = π with nuclear strong dual all as stated. |
| §0.1 | colmez-fonctions lines 657–671 (Prop. I.4.3, pp. 13–14, inf over `ℂ_p`-points), 712–720 (Thm. I.4.7, Cor. I.4.8, p. 15); rjw-intro lines 1419–1422 (Remark 3.41, p. 24), 1453–1465 (Thm. 3.43, pp. 24–25) | Statements as written; the maximum-principle ownership is R01. |
| §0.2 | schneider-nfa lines 2074–2093 (Prop. 8.6, Cor. 8.7, pp. 54–55; `W` Hausdorff barrelled, satisfied by Fréchet `W`), 2181–2234 (Prop. 9.2, Cors. 9.3–9.4, pp. 58–59); colmez-niziol-cst lines 2876–2952 (Props. A.1, A.3, A.4, Remarks A.2, A.6, pp. 58–59) | Hypotheses agree; the “not printed” tag is R06. |
| §1.3 | colmez-fonctions lines 1836–1905 (§II.4, pp. 34–36); st-la-dist lines 312–329 (λ⊗̂μ and ∗ = m_*∘⊗̂, p. 8) | Pushforward, convolution order `(λ∗μ)(f) = (λ⊗̂μ)(f∘m)`, derivative convention `∫φ dμ = ∫φ′μ` as stated. |
| §2.1 | colmez-fonctions lines 1166–1172 (Thm. I.5.14, p. 23), 1179–1186 (Prop. I.5.16, p. 24), 1206–1238 (Thm. I.5.17, Cor. I.5.18, Prop. I.5.19, pp. 24–25), 1564–1566 (Prop. II.3.1, p. 31), 1627–1649 (Thm. II.3.2, `N ≥ [r]`, pp. 32–33), 1728–1759 (Prop. II.3.3, pp. 33–34); rjw-intro lines 4410–4412 (Thm. B.1, `v_p(α_p) < k+1`, p. 79) | As stated; Pollack–Stevens reference missing (R05). |
| §2.2 | loeffler-rayclass lines 160–186 (Def. 2.8, Thm. 2.9, Remark 2.10, p. 4), 200–256 (Defs. 2.12, 2.14, Remark 2.13, Thm. 2.15, pp. 4–5) | The simultaneous-difference definition and the tensor remark conflict on `1 ⊗ 1_{pℤ_p}` (source issue below); the roadmap's tensor form is the consistent one. |
| §2.3 | loeffler-rayclass lines 118–157 (Def. 2.5, Remarks 2.6–2.7, p. 3), 277–345 (Defs. 3.1–3.2, Thm. 3.3 with `r = Σ e_𝔭 v_p(α_𝔭)`, pp. 6–7), 510–523 (Example 3.12, p. 10) | Isotropic order, ramification-index comparison and the cubic-field quasi-factorization `(s₁+s₃, s₂+s₃)` as stated. |
| §3.4 | bcgp2-modularity lines 1013–1018 (Def. 2.2.17, p. 21), 4196–4265 (§§4.6.46–4.6.49, pp. 93–95), 418–428 (§1.8.5, (1.8.6), p. 9); rjw-intro lines 1492–1500 (Remark 3.47, pp. 25–26), 2059–2070 (Mellin formula before Remark 5.22, p. 34) | Stein covering, slope map with `v(p) = 1`, partial order on `X*(T^d)_ℝ`, Serre's Prop. 12 for Banach compact operators, as stated. |
| §4.3, §4.4 | coleman-families lines 662–671 (Lemma A3.1, ms. p. 22), 707–725 (Lemma A3.4), 795–814 (resultant as a norm, Lemmas A3.5, A3.7, ms. p. 26); colmez-niziol-cst not used | Monic division, norm interpretation, Bezout and coprimality as stated; two source issues below. |
| §4.7 | serre-cc lines 388–430 (Prop. 10, Lemme 3, pp. 78–79), 448–470 (Prop. 12, pp. 80–81); buzzard-eigen lines 771–819 (Prop. 3.2, pp. 22–24) | Resolvent bounds by products of distinct row norms, Hasse-derivative identity, finite projective root kernel of rank `h`, as stated. |
| §4.9 | coleman-families lines 820–843 (definition of `D(B,P)`, Lemma A3.8, ms. p. 27), 846–853 (Thm. A3.9, ms. p. 28) | Prescribed-rank definition `∏(1 − TB(T_i))`, multiplicativity, `D(1 − Q*, P)(1) = Res(Q, P)` as stated. |
| §4.12, §4.13 | coleman-families lines 672–682 (entire ring, ms. p. 23), 827–833 (limit definition with `B(0) = 0`, `P(0) = 1`) | Gauss topology and double-truncation limit as stated. |
| §4.15 | urban-eigen lines 876–889 (§2.3.1, p. 23), 890–929 (Lemma 2.3.2, Cors. 2.3.3–2.3.4, pp. 23–24), 1713–1753 (Lemmas 3.4.6–3.4.7, pp. 43–44), 1779–1790 (Cor. 3.4.10, `D_{n,U}`, `D_U`, p. 45); pan-la2 lines 558–581 (§2.2.1, Example 2.2.2, p. 13); chj-ocmf lines 902–921 (Lemma 2.23, pp. 19–20) | Universal-character analyticity at a common level, complete continuity of stage inclusions, compactness from topologically nilpotent coordinate images, orthonormal-basis tensor comparison, as stated. |

Additional locators opened: cdn-stein lines 756–757 (Lemma 3.4, p. 15) and 905–916 (Prop. 3.12, p. 18); st-fourier lines 105–107 (Lemma 1.1, p. 3), 138–148 (Lemma 1.2, p. 4), 169–181 (countable type and Hahn–Banach quotient, p. 5), 194–198 (Lemma 1.3, p. 5), 223–225 (Prop. 1.4, p. 6), 316–320 (Thm. 2.2, p. 9); bcgp1-potential lines 6714–6724 (§6.1.1, p. 139); pilloni-hida lines 3837–3850 (§13.1.1, p. 84), 3873–3878 (Prop. 13.1.3.1, p. 85), 4017–4030 (Cor. 13.2.4.2, pp. 87–88).

**Adversarial pass.** A locator such as L1047 is the line of `TauCetiRoadmap/LocallyAnalyticDistributions/README.md` where the statement begins; “Lean Lnn” is `Suggested.lean`. “✓” means the computed instance agrees with the stated law or excludes the named wrong model.

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| Lean L65 `gaussVal_eq_inf` | `F = X³ − X`, `R = 1`, `K = ℂ₃`, `a = 0`; `R = 1/3` | Gauss: `max(1,1) = 1`; sup over `ℤ₃`-points `≤ 1/3` (x=1: 0, x=2: 1/3); sup over the `ℂ₃`-ball is 1, attained at any unit whose residue lies outside `𝔽₃`; at `R = 1/3`: Gauss `max(1/27, 1/3) = 1/3`, attained at `x = 3` | ✓ true; ownership R01 |
| Lean L65 degenerate | `F = 0`; `R ∉ |K^×|` (`R = 3^(−π)`) | both sides 0; ball = union of balls of radii `r_n ↑ R`, Gauss `= sup_n` by finite attainment | ✓ |
| Lean L76 `naHahnBanach` | `U = K×0 ⊂ K²`, `ℓ(a,0) = a`; `U = 0` | extension `(a,b) ↦ a` has norm 1 = `‖ℓ‖`; zero extension fails `ℓ(1,0)=1`; `U = 0`: `ℓ' = 0`, norms 0 = 0 | ✓ |
| Lean L76 field hypothesis | `K = ℂ_p` | chain-of-balls condition fails (ℂ_p not spherically complete), so the theorem does not apply there, as the README says | ✓ |
| Lean L87 `naFrechet_openMapping` | identity; `V → 0`; `diag(p^n)` on `c₀` | identity open; surjection onto 0 open; diagonal not surjective (`e_n` has preimage norm `p^n`, `Σ e_n p^{-n}`… image dense proper) and not open | ✓ |
| Lean L100 `IsEntire` | `0`; `T²`; `Σ p^n T^n` | restricted at every `R`; at `R = p`: weights `1` do not tend to 0 | ✓ |
| Lean L105 `polynomialSpectralResultant` | `n = 0, P = 1`; `n = 2, P = 1, B = 1`; zero ring | `1`; `Res(Y², 1 − X) = (1 − X)²`; `0 = 1` | ✓ |
| Lean L112 `entireMonicQuotient` | `Q = T − a`, `F = T²`; `Q = 1`; `Q = T²+aT+b`, `F = T³` | `q₀ = f₁ + f₂a = a`, `q₁ = 1`, quotient `T + a`, remainder `a²`; quotient `F`; quotient `T − a`, remainder `(a²−b)T + ab` | ✓ |
| Lean L119 `entirePolynomialSpectral` | `n = 1`, `P = 1 − aT`, `B = T²`; `n = 2`, `P = 1 − eT²`, `e² = 0`, `B = T` | `Q₁ = Y − a`, `B mod Q₁ = a²`, output `1 − a²T`; `Q₂ = Y² − e`, roots sum 0 product `−e`, output `1 − eT²` | ✓ |
| Lean L131 `tendsto_spectral_fixed_polynomial_gauss` | `n = 0`; `P = 1 − aT`, `B` entire | both sides 1, difference 0; coefficient `−Σ_{k≤N} b_k a^k → −B(a)` (entire), degree ≤ 1 so Gauss convergence at every `R` | ✓ |
| Lean L145 `tateAlgebra_isCompactOperator` | `d = 0`; `K⟨T⟩ → K⟨T/p⟩`; `K = ℂ_p` | `K → B`, image of unit ball `O_K·1` compact since `O_K` compact; `‖T‖ = p^{-1}` nilpotent, rows `p^{-n}`; over `ℂ_p` the `d = 0` map is not compact, so `FiniteDimensional ℚ_p K` is needed and present | ✓ |
| L262 LA_h stage exclusion | `h = 0`; character `(1+√p)^x` | indicator of `ℤ_p` is `1 ∈ LA_0`; valuations `n/2 − v_p(⌊n/p^h⌋!)`: `p = 3, h = 0, n = 3^k`: `1/2`; `p = 2, h = 1, n = 2^k`: `1`; `p ≥ 5, h = 0`: `≥ n/4 → ∞` | ✓ |
| L288 distributions | `δ_{−1}`; `b_n = 1/n!` | `D_h = sup |(−1)^n|·|⌊n/p^h⌋!| = 1`; `D_0 = 1`, `D_1 = sup |⌊n/p⌋!/n!| = ∞` | ✓ |
| L385 row compactness | `diag(p^i)`; identity; `x ↦ (Σx_i)e₀` | `r_j = p^{-j} → 0`, `‖u − π_{0..N}u‖ = p^{-N-1}`; `r_j = 1`; `r₀ = 1`, `r_j = 0` | ✓ |
| L395 finite image vs fg range | `F₂[X₀,X₁,…]`, `x ↦ Σ x_i X_i`; `ℤ_p`, `e_i ↦ p^{i+1}` | range `(X₀,X₁,…)` not fg inside fg `A`; range `pℤ_p` fg | ✓ |
| L478 cyclic identity | `v: 1 ↦ (x,y)`, `u: (s,t) ↦ αs+βt`; `u = v = 1` | `P_{vu} = 1 − (αx+βy)T = P_{uv}`; `P_{uv} = 1 − T ≠ (1−T)²` | ✓ |
| L517 column bound | rows `(p,1),(0,1)` over `ℚ_p`; real rows `(1,1),(−1,1)` | `|det| = p^{-1} = b₀b₁`; real det 2 > 1 | ✓ |
| L563 monic division | `Q = T²+aT+b`, `F = T³` | quotient `T − a`, remainder `(a²−b)T + ab` (expand `(T²+aT+b)(T−a) = T³ + (b−a²)T − ab`) | ✓ |
| L581 resultants | `Q = 1`; `Q = T−a`; `Q = T²`, `F = b + cT` | `Res(1,F) = 1` (rank-0 norm); `Res = F(a)` (pin: `resultant_X_sub_C_left`); multiplication-by-`b+cT` matrix on `{1,T}` is `[[b,0],[c,b]]`, norm `b²` | ✓ |
| L605 Bezout | `Q = T²`, `F = b + cT` | `b² = c²·T² + (b − cT)(b + cT)`, `deg(b − cT) < 2` | ✓ (R04 asks for this Check) |
| L633 resolvent | `u = diag(a,b)`; `N² = 0` | `P = (1−aT)(1−bT)`, `(1−Tu)^{-1}P = diag(1−bT, 1−aT)`; `(1−TN)^{-1} = 1 + TN` | ✓ |
| L661 Hasse | `Δ₁((AT)(BT))`; `Δ₂(T²)` in char 2 | `binom(2,1)AB·T = 2ABT`; `binom(2,2)·1 = 1` vs ordinary `2 = 0` | ✓ |
| L699 Riesz | `u = 1`, `a = 1`, `h = 1`; `u = 1+N`, `a = 1`, `h = 2` | `P = 1 − T`, `c = Δ₁P(1) = −1`, `v = 0`, `E = 1`; `P_u = (1−T)²`, `c = Δ₂P_u(1) = 1`, `v = −N`, `v² = 0`, `E = 1` | ✓ |
| L729 finite transform | rank 0, `P = 1`; `B = T`; `B = c`, `P = 1`, rank `n` | `1`; `Res(reflect_n P, 1 − XY) = P`; `(1 − cT)^n` | ✓ |
| L753 finite spectral mapping | `J = [[2,1],[0,2]]` over `ℤ/8`, `B = Y + Y²` | `B(J) = [[6,5],[0,6]]`; `P_{B(J)} = (1−6T)² = 1 − 12T + 36T² = 1 + 4T + 4T²`; `D_{2,2}(B, P_J)` with `P_J = (1−2T)² = 1 − 4T + 4T²` gives `(1 − B(2)T)² = (1−6T)²` | ✓ |
| L777 Newton majorants | `B = T`, `0`, `T²` | `β(ρ) = sup_{m≥1}‖b_m‖ρ^m = ρ`, `0`, `ρ²` | ✓ |
| L787 entire transform | `B = 1`, `P = 1`, rank `N` | `(1−T)^N`, linear coefficient `−N`, not Cauchy in `ℚ_p` (`|N − (N+1)| = 1`) | ✓ |
| L831 finite summands | `u = diag(p,p²)`, `Q = 1 − pT`; `u = p` on `ℚ_p²`, `Q = S = 1 − pT` | `Q*(u) = u − p` kills `e₀`, invertible on `e₁`; `u − p = 0`, no splitting | ✓ |
| L855 numerical slopes | `U = p²`, `h = 1`, `Q = X − p^{-2}` | `Q* = 1 − p^{-2}X`, `Q*(U) = 0`; root valuation `−2 < −h = −1`, so `Q` is not slope-`≤ r` and need not act bijectively | ✓ |
| L1081 Hahn–Banach (prose) | `v ∉ closure(U)` | separating functional from Prop. 9.2 with `q = dist(·, U)`-type seminorm | ✓ |
| L1101 Banach extension | `0 → K → K² → K → 0` | middle `K²` with max norm complete; Prop. A.1 printed (R06) | ✓ |
| L1111 Roos comparison | `C_n = K^n` in degree 0, deletion | `H⁰(lim) = K^ℕ = lim H⁰`, contains `(1,1,…)`, not `c₀` | ✓ |
| L1397 pullback | `f(x) = 1 + 3x` on `ℤ₃`, `g = y²`; indicator of `1 + 3ℤ₃` along `x ↦ 3x` | `1 + 6x + 9x²`; `1_{1+3ℤ₃}(3x) = 0` | ✓ |
| L1374 F-analytic | `χ(x) = exp(c·Tr_{F/ℚ_p}(x))` | `dχ = c·Tr` is `ℚ_p`-linear, not `F`-linear for `[F:ℚ_p] > 1` | ✓ |
| L1471 Amice (unbounded) | `δ_{−1}`; `dδ₀`; `b_n = 1/n!` | `(1+T)^{-1}`, `S_h = D_h = 1`; `log(1+T)`, coefficients `(−1)^{n+1}/n`; `exp(T)` radius `p^{-1/(p-1)} < 1` | ✓ |
| L1479 operations | `σ_a`, `φ`, `ψ`; `Res_{b+p^nℤ_p}` | `A_{σ_aμ} = A_μ((1+T)^a − 1)` (colmez-fonctions 1876), `ψ∘φ = id` (1895), restriction formula (1842) | ✓ |
| L1508 tail estimate | `F = ΣT^n` over `ℚ₃`, `t = 3`, `R = 1/3`, `S = 2/3`, `M = 1`, `N = 0,1,2` | errors `3^{-N}`: `1, 1/3, 1/9`; bounds `(1/2)^N`: `1, 1/2, 1/4` | ✓ |
| L1548 pushforward | `f = 1 + 3x`, `μ = dδ₀`, `g = y²` | `(g∘f)′(0) = 3·g′(1) = 6`; `f_*dδ₀ = 3dδ₁` gives `3·2 = 6` | ✓ |
| L1566 convolution | `S₃`: `δ_{(12)} ∗ δ_{(23)}`; `dδ₀ ∗ dδ₀` on `x²` | `δ_{(12)(23)} = δ_{(123)} ≠ δ_{(132)}`; `∂_x∂_y (x+y)²|₀ = 2` | ✓ |
| L1673 `C^r` | `p = 3`, `r = 1`, `a_{3^k} = 3^k`; digit doubling | `v₃ − ℓ = k − (k+1) = −1`, not `C¹`, but `→ 0` so continuous; `d(3^h)/9^h = 1`, `d(2·3^h)/(4·9^h) = 1/2`; `p = 2`: `1` and `5/9` | ✓ |
| L1684 order `r` | `log(1+T)`; `b_{p^k} = p^{-k²}` | `v_p(1/n) + ℓ(n) ≥ 1` and `−k + r(k+1) → −∞` for `r < 1`: order exactly 1; `−k² + r(k+1) → −∞` for every `r`, yet `p^{k²}R^{p^k} → 0` for `R < 1` | ✓ |
| L1707 AVV | `r = N + 1`, `d^{N+1}δ₀` | kills degrees `≤ N`, sends `x^{N+1} ↦ (N+1)! ≠ 0`; Thm. II.3.2 needs `N ≥ [r]` | ✓ |
| L1727 wavelets | `r = (1/4,1/4)`, value `p^{-2k}` on depth `(4k,0)`; `r = (1/2,0)`, `1 ⊗ 1_{pℤ_p}` | tensor-scaled value `p^k·p^{-2k}`, norm `p^k` unbounded; isotropic scale `p^{2k}`, value 1 bounded; simultaneous difference at `(m,0)`, `y = (0,1)`: valuation 0 vs required `> m/2` | ✓ |
| L1748 Haar on `ℤ₃` | depth `m` | mass `3^{-m}`, three children sum `3·3^{-m-1}`; norm `3^m ≤ C·3^{rm}` fails for `r < 1`, holds `r = 1` | ✓ (R03 on form) |
| L1821 isotropic growth | `r = 1`, `dδ₀` | vanishes on `LC`, `dδ₀(x) = 1`: no uniqueness at `r = 1` | ✓ |
| L1868 filtration adapter | containment at depth `c + 2m`, order `s` | `r = 2s`, not `4s` | ✓ |
| L1905 Mellin component | `δ_{(δ,1)}`; `G = ℤ_p`, `ν = 1` | `ν(δ)(1+T)`; equals `amiceTransform μ` coefficientwise | ✓ |
| L1943 branches | `B_{T,q}(1)`; `B_{1+T,q}(0)`; `q = p` at odd `p` | `κ_q(1) − 1 = q`; `κ_q(0) = 1`, value 1; `⟨x⟩^s = (1+p)^{sH_ℤ(x)} = κ_p(s)^{H_ℤ(x)}` | ✓ |
| L2010 character space | `G = ℤ_p`, coefficient `p^{-k}` at `n = p^k`; `γ ↦ γ^u`; `z ↦ pz` | `p^kR^{p^k} → 0` for `R < 1`, unbounded coefficients; `T′ = (1+T)^u − 1`; pullback `(1+T)^p − 1` | ✓ |
| L2041 generator change | `γ′ = γ^u` | `1 + t′ = (1+t)^u`, `F′(t′) = F((1+t′)^{u^{-1}} − 1)` | ✓ |
| L2045 weight derivative | `Mel(s) = F(γ^s − 1)` | `d/ds = F′(t(s))·γ^s log γ = log(γ)(1 + t(s))F′(t(s))` | ✓ |
| L2129 Lipschitz degree | `n = 1`, `u = a`, `v = b` | `|c₁(u) − c₁(v)| = |a − b| ≤ ‖u − v‖C⁰` | ✓ |
| L2158 base change | `K[ε]/ε²`, `‖·‖_A = max(|a|,|b|)`, `‖·‖_B = max(|a|,p|b|)` | `L = p`, `‖ε⊗1‖_π ≤ 1 < p = ‖ε‖_B`: no isometry | ✓ |
| L2196 linear tail | `Q_a(T²)`; `Q_e(eT²)`, `e² = 0` | `(a, 1)`: `T + a`; coefficients `e·e^k`: `(0, e)`: `eT` | ✓ |
| L2214 bound | `‖a‖ ≤ S`, `‖c_m‖S^m ≤ M` | `‖c_{n+1+k}a^k‖ ≤ M S^{-(n+1+k)}S^k = M/S^{n+1}` | ✓ |
| L2218 no constant product | `H = Σ a^nT^n`, `(1−aT)H = 1`, `a = p` | `‖p^n‖R^n = (R/p)^n`, fails at `R = p`: not entire, so the lemma's hypothesis excludes it | ✓ |
| L2341 Hasse bound | `s = 0`; `f = T²`, `s = 2` | `R^n ≤ (2R)^n`; `binom(2,2) = 1` | ✓ |
| L2371 adjugate | `diag(a,0)` | `adj(I − TD) = diag(1, 1 − aT)`: `T`-coefficient `0` at `(0,0)`, `−a` at `(1,1)` | ✓ |
| L2425 geometric factor | `h = 2`, `u = 1 + j`, `j² = 0`, `a = 1` | `B = Σ_{j<2}(−j)^j = 1 − j`, `uB = (1+j)(1−j) = 1 − j² = 1 = 1 − v²` | ✓ |
| L2497 reversal | `P = 1 − eT²`, `n = 2`; `n = 1`, `P = 1 − aT` | `Y² − e` monic degree 2; `Y − a` | ✓ |
| L2591 reciprocal evaluation | `D_{1,1}(3T, 1 − 2T)(1)` over `ℤ`; `D_{5,1}(2T, 1+T²)(1)` over `ℤ/8`; `D_{0,2}(0,2)(1)` vs `D_{0,0}` | `Res(Y−2, 1−3Y) = −5 = (1−2T)|_{T=3}`; `Res(Y⁵+Y³, 1−2Y) = (1−2i)(1+2i) = 5 = (1+T²)|_{T=2}`; `2² = 4` vs `2⁰ = 1` | ✓ |
| L2672 two-radius | `F = aT^N`, truncation at `N` | tail `= F`, `G_R = ‖a‖R^N` | ✓ |
| L2703 Gauss product | `f = eT`, `e² = 0` | `G_R(f²) = 0 < G_R(f)² = ‖e‖²R²` | ✓ |
| L2785 stabilization | `B = T²`, `P_N = 1 + c₁T + c₂T² + …`, `N ≥ 2` | `T`-coefficient `−Σλ_i² = −(c₁² − 2c₂) = 2c₂ − c₁²` | ✓ |
| L2888 one-disc action | `a = 0`; `e₂ ↦ a²e₂` | retains `f₀`; coordinate dilation ≠ scalar | ✓ |
| L2933 specialization | `A = K×K`, `μ(e₀) = (1,2)`, `μ(e₁) = (3,4)`, `f = e₀ + 5e₁` | second projection `2 + 20 = 22`, first `1 + 15 = 16`; with `μ(e_n) = (1,2)`, `f_n = 3^n` in `ℚ₃`: `2·Σ3^n = 2·(−1/2) = −1`, first `−1/2` | ✓ |
| L2950 common radius | `t = √2` over `ℚ₂(√2)`, `h = 1, 2` | `|(1+√2)² − 1| = |2(1+√2)| = 1/2` (not `< 1/2`); `|(1+√2)⁴ − 1| = |4(4+3√2)| = 2^{-2}·2^{-1/2} < 1/2` | ✓ |
| L2962 coefficient action | `φ(z) = pz`, `j(z) = (1+W)^{p^hz}`, `μ = δ₁`, test `z²`; `A = K×K`, multiplier `(2,3)`, `μ = (5,7)δ₁`, `p = 3` | `(1+W)^{p^h}·p²`; second fibre `21·9 = 189`, first `10·9 = 90` | ✓ |
| L3062 slope criteria | `Q = X − S` on `|S| = |p|`; `Q = X` | root norm `|p|` at every point incl. the Gauss point; zero constant term excluded | ✓ |
| L3076 normalization | `U = p`, `h = 1`; `U = 0` | `|p| = r = |p|^1`, included; valuation `+∞`, excluded | ✓ |
| L3105 local windows | `A = ℚ_p⟨S⟩`, `U = S`, slope `a/b` | refinement `|S|^b = |p|^a` keeps `1 − ST` with root of exact slope `a/b`; `|e_j| ≤ r^{d−j}` and `|e₀| ≥ r^d` force every root to norm `r` | ✓ |
| L3138 algebraic slope part | `A = ℚ₃⟨S⟩`, `U = 1`, `h = 0` on `A/(S)`; `U = 0` | `P = X − 1` kills all; `P(0)` unit so `ker P(0) = 0` | ✓ |
| L3160 exact-slope rank | `U = S` on `ℚ_p⟨S⟩`, irrational `h` | no rational neighborhood isolates radius `p^{-h}`; excluded by `h ∈ ℚ` | ✓ |
| L3196 compact factorization | constant `c_K(ℕ)` with identity transitions, `U = 0` | identity transition not compact on infinite `c₀`: hypothesis fails, as the Check says | ✓ |
| L3217 valuation adapter | `G_m`, `t = p`, `p^{-2}`, unit; `SL₂`, `t = p` | `w = 1, −2, 0`; `α(diag(p,p^{-1})) = p²`, pairing `2`; `ν_RG = −1` at `t = p` (ReductiveGroupsPartII line 1810) | ✓ |
| L3236 spanning | `G_m` rootless; `SL₂` | `T⁺ = T`, image `ℤ` with both signs; `λ = (λ + Nλ₀) − Nλ₀` | ✓ |
| L3246 slope order | `λ_s(n) = sn` | `λ_s ≥ λ_t ⇔ s ≥ t` on `T⁺ = {p^n : n ≥ 0}`; declaring `w = ν_RG` gives slope `−1` to the identity character at `p` | ✓ |
| §0.CR.6.6 L1133 finite-piece HK | good-reduction dagger line; chart `xy = π` | `H¹ = 0` both sides; `dlog x ↦ dlog x`, one-dimensional after extension | ✓ |
| §0.CR.6.6 L1198 Stein HK | `A¹` exhausted by `|T| ≤ |π|^{-m}`; countable disjoint multiplicative lines | constant `K₀` system, `H¹_HK = 0`; `∏_ℕ K₀` with product topology, not `c₀` | ✓ |
| Convention 5 (Amice sign) | `μ = dδ_a` | moments `1`, `a − 1/2` = coefficients of `log(1+T)(1+T)^a`; opposite sign gives `−log(1+T)` | ✓ |
| Convention 6/13 (Fredholm) | `u = a`; nilpotent `2×2` | `1 − aT`; `1` | ✓ |
| Convention 9 (slopes) | `u = a`, `v_p(a) = h` | in the `≤ h` summand; reciprocal root valuation `−h ≥ −h` | ✓ |
| Convention 13 (Hasse) | `Δ₂(T²)` in char 2 | `1` vs ordinary `0` | ✓ |
| Convention 13 (Mellin at `p = 2`) | `δ_{−1}` | components `ω = ±1`, `⟨−1⟩ = 1`; on the trivial torsion branch value `1` at `k = 1` while `∫x dδ_{−1} = −1` | ✓ |

Rows for the statements the findings touch: R01 is the first two rows; R02–R06 do not change any computed value.

## Not verifiable

- **Kohlhaase**, *The cohomology of locally analytic representations*, Prop. 4.2 and Cor. 4.3, cited for §1.5. Fetched legally from the author's page (`kohlhaase-coh`), but the PDF is an image-only scan and OCR is not installed on this worker, so the text could not be read; Colmez–Nizioł Remark A.6 (colmez-niziol-cst line 2942) states the nonsplitting it is cited for, with the attribution to Kohlhaase Cor. 4.3. Recorded in `needs-references.toml`; the review is not parked for it.
- **BGR**, *Non-Archimedean Analysis* (Springer, DOI prefix `10.1007`): paywalled, not fetched; cited for §4.16's affinoid supremum comparison and the Convention 1 background. The RigidAnalyticGeometry §§2.1–2.2 contract on main carries the same statements with their BGR locators.
- **Ingleton** (1952): not fetched; the README cites it only as the historical attribution, and Schneider Prop. 9.2 and Cors. 9.3–9.4 were read for the theorem.
- **Coleman**, published page numbers: the text read is the author manuscript hosted on a University of Chicago faculty page (`coleman-families`, fetched as `institutional`; it is not the author's own page). Its manuscript pages 22–30 correspond to the README's published pages 432–436 by the offset the README describes, but the published pagination was not seen.
- **Colmez–Dospinescu–Nizioł, Drinfeld tower** (`cdn-drinfeld`) and **Grosse-Klönne** (`gk-frobenius`) were fetched but only their existence at the cited sections was checked; §0.CR.6.6 is not in the seeded sample and the previous review read them.

## Source issues

- **Error** in coleman-families at Lemma A3.1, manuscript p. 22 (line 662): the source says a restricted series H on the closed unit disc with polynomial G and constant GH forces G constant or H zero; it should require H entire, since G = 1 − pT, H = Σ pⁿTⁿ give GH = 1; affects a stated result.
- **Misprint** in coleman-families at the proof of Lemma A3.4, manuscript p. 23 (line 717): the source says K(T) is the alternating coefficient sum without its degree-n term; it should include the leading term Tⁿ, as the monic Q requires; affects the proof.
- **Error** in loeffler-rayclass at Definition 2.12 and Remark 2.13, pp. 4–5 (lines 200–231): the source says the simultaneous first-difference condition along the cofinite filter describes the completed tensor of one-variable C^{r_i} spaces; it should use separate tensor-wavelet conditions, since 1 ⊗ 1_{pℤ_p} lies in the tensor at order (1/2, 0) but fails the displayed condition at every (m, 0); affects a stated result.
- **Error** in pilloni-hida at §13.1.1 condition 4, p. 84 (line 3846): the source says Q⋆(U) must be invertible on M^{>h} for every Q whose roots have valuation greater than h; it should test Q whose reciprocal roots have valuation at most h, otherwise U = 1, h = 1 admits both M^{≤h} = M and M^{>h} = M and the uniqueness cited from Urban fails; affects a stated result.
- **Error** in bcgp1-potential at §6.1.1, p. 139 (line 6721): the source says Q(U) acts invertibly on M^{>h} for monic Q whose roots have valuation strictly less than h and claims uniqueness; it should include roots of valuation equal to h, otherwise U = p^h on a line admits two decompositions; affects a stated result.
- **Misprint** in pilloni-hida at the proof of Corollary 13.2.4.2, pp. 87–88 (line 4026): the source says the extension is P(Ũ)f with Ũ a map between different spaces; it should be Ũ(Q(U)f) for P = XQ; affects the proof.
- **Error** in bcgp2-modularity at Remark 4.6.47, p. 94 (lines 4230–4234): the source says the displayed geometric-series inverse exists for s ≥ n; it should require s > n, since at s = n the element 1 − U·pⁿX⁻¹ vanishes at U = 1, X = pⁿ; affects the proof.
