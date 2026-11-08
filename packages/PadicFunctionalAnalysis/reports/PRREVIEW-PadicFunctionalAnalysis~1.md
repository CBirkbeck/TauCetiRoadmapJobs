# Review of PadicFunctionalAnalysis (pull request #1807 at fa7b83e)

**Verdict:** needs changes

This pull request changes `TauCetiRoadmap/PadicFunctionalAnalysis/README.md` in two places only (§5.3, lines 918–925, and the dependency-order bullet, lines 1056–1059), replacing the import of PadicMeasuresIwasawaAlgebras §1.7 by a locally stated composite of §3.4's integral Amice equivalence with ProfiniteProPGroups Layer 9's power-series coordinate. That new text is mathematically sound (see the table). `Suggested.lean` is unchanged and builds with `sorry` as the only warnings. The gate fails on rules that predate this pull request (imports, an admitted example, pull-request numbers, an upward supplier) and on the pull request's own aim: the loop with PadicMeasuresIwasawaAlgebras is not fully cut (R02). Findings R04–R11 are pre-existing on main; they are listed because the gate and the shape rules hold every revision to them.

## R01 (P2) — Upward supplier: LocallyAnalyticDistributions §0.0 feeds §2.4

Location: `README.md` lines 44, 471–474 ("Use the separated completed projective tensor and functoriality of LocallyAnalyticDistributions §0.0"), 1052–1055; gate line `UPWARD: PadicFunctionalAnalysis (on main) -> LocallyAnalyticDistributions (#64) at README lines [1052]`.

Claim: the completed-extension corollary of §2.4 (strict exactness is preserved by `K'⊗̂_K(−)`) takes its tensor carrier from LocallyAnalyticDistributions §0.0.

Witness: LocallyAnalyticDistributions is merge-order line 65 (pull request #854) and consumes this roadmap in 80 README lines (its scope section names §1.4, §2.1–§2.2, §2.6, §4.3–§4.4, §4.7 as supplied here). The edge here is therefore a cycle, and the dependency check reports it every round.

Repair: give the corollary one tensor carrier that is on main. AdicSpacesPartII R0.3 ("the completed tensor product", its README line 1769) already supplies the Banach-module completed tensor and is cited at line 44; keep that citation alone, or state the Banach-space completed tensor over a complete isometric field extension as a §2.4 target with its universal property. Delete the LocallyAnalyticDistributions §0.0 citations at lines 44, 472–474 and the first bullet at 1052–1055. Mentions of LocallyAnalyticDistributions §0.1, §1.1 and §1.4 (lines 697–698, 808–809, 815–816) stay only if reworded as what that consumer proves later, never as "supplied by".

## R02 (P2) — The loop with PadicMeasuresIwasawaAlgebras is not cut

Location: `README.md` lines 927–935 ("use the general coefficient-extension interface to view an integral measure ν on ℤ_pˣ as a ℂ_p-valued measure ... Use the supplier's coefficient extension for `extendIntegralMeasure`"), line 32 (scope row "Measures": "coefficient extension ... PadicMeasuresIwasawaAlgebras, Layers 0–1") and lines 559–560 ("General integration and measure topologies come from PadicMeasuresIwasawaAlgebras Layers 0–1").

Claim: after this pull request, PadicFunctionalAnalysis no longer consumes PadicMeasuresIwasawaAlgebras.

Witness: the "supplier's coefficient extension" is PadicMeasuresIwasawaAlgebras Layer 1, `completedGroupAlgebraBaseChange` (its README lines 979–991), and its supplier table line 367 records this roadmap's `extendIntegralMeasure` "with O coefficients supplied by §1.7". PadicMeasuresIwasawaAlgebras declares itself downstream of this roadmap (its lines 94–95 and 2675–2677: "to be contributed to TauCetiRoadmap ahead of this one") and consumes §3.4 and §§5.1–5.3 in its §§2.2, 2.5, 3a.1 and 4.5. Two roadmaps each consuming the other is the loop the pull request set out to remove; the dependency check does not see it only because both roadmaps are on main.

Repair: own the extension here. In §5.3 state the target: for a profinite space `X` (here `ℤ_pˣ`), a bounded `ℤ_p`-linear functional on `C(X,ℤ_p)` extends uniquely to a `ℂ_p`-linear functional on `C(X,ℂ_p)` of the same norm, by density of locally constant functions (§3.1) and completeness of `ℂ_p`; `AbstractMeasure` at the pin has `map` (`Mathlib/NumberTheory/Padics/Measure/Basic.lean` line 105) and no coefficient extension, so nothing is duplicated. Then reword line 32 so that PadicMeasuresIwasawaAlgebras appears only as a consumer (its general clopen calculus, topologies and completed-group-algebra base change are its own and are not inputs here), and reword lines 559–560 as a deferral, not a supply. Tested on the instance the README's own Check uses (line 1039–1040): the extension of the Dirac measure `δ_a` has norm one and `|measureFun δ_a κ| = |κ(a)| = 1`, which the local statement gives directly.

## R03 (P2) — Serre's theorem is statable at the pins and absent from `Suggested.lean`

Location: `README.md` lines 10–11 ("The central results are Serre's orthonormalisation theorem; ..."), §2.3 lines 452–454; `Suggested.lean` has no statement of it and its module docstring (lines 20–40) names no headline as not statable.

Claim: the acceptance test states the roadmap's headline theorems or says which are not statable.

Witness: [Serre] Proposition 1 and its Corollaire (Serre line 60–85, printed pp. 69–70) are statable with the file's own `IsONable`/`IsPotentiallyONable` (lines 163, 189): for `K` a complete ultrametric `NontriviallyNormedField` whose nonzero norms lie in `r^ℤ` for some `0<r<1`, every Banach `K`-space `E` (`NormedSpace K E`, `IsUltrametricDist E`, `CompleteSpace E`) satisfies `IsPotentiallyONable K E`, and `IsONable K E` when its nonzero norms lie in `r^ℤ`. Every carrier exists at the pin. The Amice isometry `C₀(ℕ,E) ≃ LA_h(E)` (§4.4) and the unbounded Amice bijection `D(ℤ_p,K) ≃ R⁺` (§4.7, [Col] Théorème II.2.2, Col line 1502) are also absent, and the docstring does not say what they lack (the disc-expansion map of `m_h(n)·binom(x,n)`, and a carrier for `LA(ℤ_p,K)` and its bounded dual).

Repair: add the two Serre statements with the discreteness hypothesis written as `∃ r : ℝ, 0 < r ∧ r < 1 ∧ ∀ x : K, x ≠ 0 → ∃ n : ℤ, ‖x‖ = r ^ n`; in the module docstring name the Amice isometry and the unbounded Amice bijection as not statable and say which carrier each lacks.

## R04 (P3) — Gate: `Mathlib.<submodule>` imports, no `import Mathlib`

Location: `Suggested.lean` lines 1–16 (16 `import Mathlib.…` lines); gate rules `imports`, `mathlib-subimports`, `no-import-mathlib`.

Repair: replace lines 1–16 by the single line `import Mathlib`, keeping lines 17–18 (`TauCeti.RingTheory.Huber.Basic`, `TauCeti.NumberTheory.Padics.PadicIntegers`, both present at the pin). The 16 "designed for use with the module system" build warnings disappear with them.

## R05 (P3) — Gate: an admitted `example`

Location: `Suggested.lean` lines 317–325 (`example (h : ℕ) : let F : PowerSeries ℚ_[p] := ... := by sorry`).

Claim: an admitted example tests nothing. Witness: gate rule `sorry-examples`; under the one-tactic probe `simp` rewrites the goal and leaves it open (probe line 324).

Repair: delete it; the README keeps the derivative-functional Check (lines 823–825: moments `(−1)^(n−1)/n`, transform `log(1+T)`).

## R06 (P3) — Gate: pull-request numbers and process links in the README

Location: lines 29–31 (links to pull requests #854, #919, #926), 37, 40, 43 (#817, #813), 158, 166, 170–171 (Mathlib pull requests #42865, #42836, #23772, #23791), 1106–1118 (section "Existing Lean work" with a pinned commit hash and GitHub tree links, "Coordinate integration with the author"), 1120–1121 (fork links pinned to commits).

Repair: cite roadmaps by name and section (RestrictedPowerSeries, NewtonPolygons, AdicSpacesPartII R0.3/R0.4, AdicSpacesPartIII R3.6, LocallyAnalyticDistributions as a consumer); describe the intended operator-norm and `amiceTransformₐ` API shapes in words (neither `ContinuousLinearMap.opNorm` over a semiring nor `AbstractMeasure.amiceTransformₐ` exists at the pin: `Mathlib/Analysis/Normed/Operator/Basic.lean` line 170 defines `opNorm` over a `NontriviallyNormedField`, and `amiceTransformₐ` occurs nowhere); delete the "Existing Lean work" section and the two reference-style fork links.

## R07 (P3) — README and `Suggested.lean` disagree on declared names

Location: README backticked names of this roadmap's own that the Lean file does not declare: `pMultiplesIndicator`, `weightMeasure`, `existsUnique_psiMeasure` (lines 638–639), `eq_aeval_binomialSeries` (903), `nonempty_weightSpace_equiv` (862), `extendIntegralMeasure`, `measureFun`, `measureFun_norm_le`, `measureFun_injective` (934–938), `isLinearTopology_padicInt` (916), `isBoundedSMul_padicInt_padic` (621), `amiceTransform_completedGroupAlgebra_compat` (923, in the paragraph this pull request rewrites), and `NormedRing.IsTate`, `NormedRing.PseudoUniformizer` (71–73, which exist nowhere at the pins). Lean declarations the README never names: `IsDiscRealization`, `single`, `IsMultiplicative`, `IsTate`, `IsOrthonormalFamily`, `TCoord`, `q`, `matrixCoeffInputFirst`, `opNorm`, `le_opNorm`, `opNorm_eq`, `nonempty_mahler_coordinates`, `coeff_amiceTransform_eq_mahlerTerm`, `measurePairing_norm_le`, `measurePairing_injective`, `exists_linearIsometryEquiv_of_isOrthonormalBasis`, `exists_isOrthonormalBasis_iff`.

Witness: `grep -c` of each name in the two files (0 on one side, ≥1 on the other). Additionally `IsDiscRealization` (`Suggested.lean` 292–295) is consumed by no theorem, and its `∑'` is the junk value `0` unless `E` is complete, ultrametric and has a bounded `ℤ_p`-action, binders its signature lacks (it carries only `NormedAddCommGroup E`, `Module ℤ_[p] E`).

Repair: remove the backticks from the undeclared names (the prose stays), delete `IsDiscRealization`, and name every kept declaration where its README statement lives.

## R08 (P3) — Padding in `Suggested.lean`

Location: `PseudoUniformizer.isTopologicallyNilpotent` (line 70), `PseudoUniformizer.isPseudoUniformizer` (75), `PseudoUniformizer.isTateRing` (81), `opNorm_eq` (137), `nonempty_mahler_coordinates` (238), `coeff_amiceTransform_eq_mahlerTerm` (244).

Witness: each is proved by one term or one tactic from the library: `tendsto_pow_atTop_nhds_zero_of_norm_lt_one`; the two-field anonymous constructor; `opNorm_eq` is `rfl` against `ContinuousLinearMap.opNorm` (`Mathlib/Analysis/Normed/Operator/Basic.lean` line 170); `nonempty_mahler_coordinates` wraps `PadicInt.mahlerEquiv` (`Mathlib/NumberTheory/Padics/MahlerBasis.lean` line 356); `coeff_amiceTransform_eq_mahlerTerm` is one `rw [AbstractMeasure.coeff_amiceTransform]` (`Mathlib/NumberTheory/Padics/Measure/AmiceTransform.lean` line 81).

Repair: delete them from `Suggested.lean`; the README keeps the statements (lines 151–154, 163–164, 264–268).

## R09 (P3) — Lean form

Location: module docstring lines 20–40 ("representative interfaces", "not an exhaustive checklist", "Do not import this roadmap prototype into production mathematics"); `open scoped ... Classical` at line 45; declarations without a docstring: `IsMultiplicative`, `IsONable`, `IsPotentiallyONable`, `exists_tateSeminorm`, `tateGauge_eq_zero_iff`, `tateGauge_equiv`, `tateGauge_rpow`, `le_opNorm`, `opNorm_eq`, `exists_finset_norm_le`, `exists_continuousLinearEquiv_prod_of_countableType`, `norm_toCLMEquiv_eq_iSup_coeff`, `mem_range_amiceTransform_iff`, `existsUnique_integral_iff_norm_le_one`, `phiMeasure`, `amiceTransform_phiMeasure`, `LocallyAnalytic`, `amiceDualNorm`, `amiceDiscNorm`, `amiceDiscNorm_le_amiceDualNorm`, `amiceDualNorm_le_amiceDiscNorm`, `q`, `WeightSpace`, `TCoord`, `existsUnique_character_of_norm_lt_one`, `weightTest`.

Repair: docstring "P-adic functional analysis: target signatures" saying the roadmap is README.md, that the file states the headline theorems against the pinned APIs, and which are not statable (R03); a docstring on every declaration stating the mathematics and source; drop the global `Classical`.

## R10 (P3) — README shape

Location: the whole README predates the current shape: no `## Exact supplier contracts`, `## How to read the build`, `## Downstream consumers`; no `*Needs:*` line on any target; layers end in bold "Dependencies." paragraphs rather than `### Examples` and `### Dependencies`; definitions carry no API bullets; process wording at lines 17–22 ("Suggested homes", "representative interfaces"), 48–49 ("the prototype imports library modules"), 154 ("the prototype proves"), 161, 173–174, 182 ("when available"), 269 ("Reuse `IsTateRing.of_isUnit_norm_lt_one` when that native comparison is available", a name that exists nowhere at the pin), 1110–1113.

Repair (minimum for the text this pull request touches): give the §5.3 comparison paragraph (lines 918–925) a `*Needs:*` line, "§3.4 the integral Amice equivalence (`AbstractMeasure.amiceTransformEquiv`), ProfiniteProPGroups Layer 9 the power-series coordinate (`TauCeti.completedGroupAlgebra.powerSeriesCoordinate`, `powerSeriesCoordinate_binomialSeries`), §5.1 the decomposition", and a locator ([RJW] Proposition 3.16, RJW line 816, printed p. 16 of the arXiv version, for the group-algebra side; [RJW] Theorem 3.25, RJW line 959, for the Amice side). The full reshaping is a separate revision of this roadmap.

## R11 (P3) — Edits outside the folders this review was told are the pull request's own

Location: `Completed/ArithmeticDirichletSeries/README.md` (one line) and `TauCetiRoadmap/SymplecticGeometry/README.md` (one line), both consumer-sentence rewordings.

Witness: `git diff --stat origin/main...HEAD` lists them; the review brief names thirteen other folders as the pull request's own and not these two, although the pull request description does claim them ("ArithmeticDirichletSeries ... SymplecticGeometry").

Repair: none to the text; the worker or a human should either register both folders as the pull request's own (so each gets its review) or split the two lines into their own change.

## Verified sound

**Gate and build.** `lake env lean TauCetiRoadmap/PadicFunctionalAnalysis/Suggested.lean` exits 0 in 5 s; 20 `declaration uses sorry` warnings (lines 100, 106, 111, 119, 131, 176, 183, 213, 220, 251, 257, 264, 274, 307, 312, 318, 344, 356, 374, 380) plus the 16 module-system warnings tied to R04; no error. Dependency check output on this head:

```
UPWARD: PadicFunctionalAnalysis (on main) -> LocallyAnalyticDistributions (#64) at README lines [1052]
depcheck: 236 roadmaps, 2070 edges, 1 problem(s)
```

The same line is reported on main's copy of the README (there at line 1051): it is not introduced by this pull request. Running the check on PadicMeasuresIwasawaAlgebras's README reports 0 problems, which is why R02 is invisible to it (both roadmaps are on main).

**Elaborated signatures.** All 48 elaborated types read against the README. The 4 "dropped binder" leads (`exists_tateSeminorm`, `tateGauge_eq_zero_iff`, `tateGauge_equiv`, `tateGauge_rpow`) are false positives: `include ha hϖ hnil hb` (line 98) carries them, and the elaborated types show `1 < a → ↑ϖ ∈ A₀ → IsTopologicallyNilpotent ↑ϖ → (nhds 0).HasBasis … →`. No definition or sorried theorem lost a hypothesis its README statement has.

**One-tactic probe.** A scratch copy with every proof `sorry` replaced by `first | rfl | simp | infer_instance | sorry`: 17 of the 20 still admit; the other 3 (`exists_tateSeminorm` line 100, the example line 318, `existsUnique_character_of_norm_lt_one` line 356) error with unsolved goals after `simp` rewrote them. Nothing sorried closes in one tactic; the padding in R08 is the already-proved declarations.

**The pull request's own change (§5.3 lines 918–925, 1056–1059).** The composite is: integral Amice equivalence `AbstractMeasure ℤ_p ℤ_p ℤ_p ≃ ℤ_p⟦T⟧`, `δ_a ↦ (1+T)^a` (`AbstractMeasure.amiceTransformEquiv`, `Mathlib/NumberTheory/Padics/Measure/AmiceTransform.lean` line 157), followed by the power-series coordinate `ℤ_p⟦T⟧ ≅ ℤ_p⟦Γ⟧`, `T ↦ [γ]−1` (`TauCeti.completedGroupAlgebra.powerSeriesCoordinate`, `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/PowerSeries.lean` lines 350, 368, 401, 432; ProfiniteProPGroups is in `Completed/`, its Layer 9 "Power-series coordinates" paragraph at README line 1793–1810), for `Γ = 1+qℤ_p` with generator `γ = exp(q)` and `a ↦ γ^a`. Computed: `δ_a ↦ (1+T)^a ↦ [γ]^a = [γ^a]` (the binomial series goes to `of(γ^u)`, `powerSeriesCoordinate_binomialSeries`); `δ_0 ↦ 1 ↦ [1]`; `δ_1 ↦ 1+T ↦ [γ]`, so `T = [γ]−1` as stated; at `p = 2`, `q = 4`, `γ = 5` generates `1+4ℤ_2`, which is procyclic as Layer 9 requires. PadicMeasuresIwasawaAlgebras §4.5 (its README lines 2673–2679) expects exactly this statement from "PadicFunctionalAnalysis §5.3, clause 4" and transports it along `a ↦ γ^a`; its §1.7 (lines 909–922) states it takes the compatibility from §5.3 and never as an input of its own comparison. The old text's citation of §1.7 as a supplier was therefore circular and the new text is the right direction.

**Cross-roadmap citations resolved (all on main).** PadicMeasuresIwasawaAlgebras §1.7 (line 909), §2.2 (1229), §2.11 (1865), §4.5 (2620), Layers 0–1; ProfiniteProPGroups Layer 9 (`Completed/`, line 1656 onward, coordinate at 1793); RestrictedPowerSeries §2 (304–364), §7.1 (704), Layers 0–2; AdicSpacesPartII R0.3 (1769), R0.4 (2270); AdicSpacesPartIII R3.6 (95–103, the countable-type section interface); NewtonPolygons Layer 1 (442–508); LocalFieldsRamification Teichmüller section (`Completed/`, 343–354) and `U(K,i) ≃ 𝓂^i` by log/exp (395–396); CompactOperators §0.2 (221); AdicSpaces (`Completed/`). LocallyAnalyticDistributions was read at the head of pull request #854 (R01). Ownership of the §5.3 comparison: no other roadmap on main or at an open head states the specialised composite (`roadmaps grep` on "completed group algebra" with "Amice" hits only this roadmap, PadicMeasuresIwasawaAlgebras as its consumer, and ColemanPowerSeries citing PadicMeasuresIwasawaAlgebras); the two halves are library declarations, so the composite is correctly owned here. Ownership against open pull requests whose files the brief did not give me was not checked beyond that grep.

**Library declarations opened at the pins.** Mathlib: `AbstractMeasure` (= `C(X,R) →L[R] E`, `Measure/Basic.lean` 40), `toCLMEquiv` (84), `map` (105), `amiceTransform` (`AmiceTransform.lean` 76), `coeff_amiceTransform` (81), `injective_amiceTransform` (92), `amiceTransformEquiv` (157); convolution ring on `D(G,R)` with `diracHom`, `monoidAlgebraHom` (`Measure/Monoid.lean` 64–139); `PadicInt.mahlerTerm` (253), `mahlerEquiv` (356); `PowerSeries.IsRestricted` (`Restricted.lean` 28), `HasEval` and `aeval` (`Evaluation.lean` 71–210), `binomialSeries` (`Binomial.lean` 47); `ℂ_[p]` (`Complex.lean` 137–140); `ContinuousLinearMap.opNorm` field-only (`Operator/Basic.lean` 51, 170); `UnconditionalSchauderBasis` (`Analysis/Normed/Module/Bases.lean`); `C₀` completeness and norm instances (`ZeroAtInfty.lean` 445–467) and no bounded-ring-action instance there (Convention 1 and §2.1 are right that it must be supplied); no `IsLinearTopology ℤ_[p] ℤ_[p]` instance (so `exists_character_of_hasEval`'s hypothesis is needed, as §5.3 says); `amiceTransformₐ`, `amiceTransformEquivₐ`, `IsTateRing.of_isUnit_norm_lt_one` absent. Tau Ceti: `IsHuberRing` (`RingTheory/Huber/Basic.lean` 156), `IsPseudoUniformizer` (165), `IsTateRing` (192), `IsTateRing.exists_hasBasis_nhds_zero` (704); `Huber/Normed.lean` (power-boundedness versus norm, 56–71) and `Huber/OpenMapping.lean` (`IsTateRing.isOpenMap`, `isStrictMap_of_isClosed_range`, `isQuotientMap`, 178–218) exist as §0.4 and §1.2 say; `PadicInt.compactSpace_units`, `totallyDisconnectedSpace_units` (`NumberTheory/Padics/PadicIntegers.lean` 85, 93).

**Sources (sampled targets).** Read at the locators: JN line 374–390 (Def 2.1.1–2.1.2, Banach–Tate rings, multiplicative pseudo-uniformiser, printed p. 7), 394 (`|ϖ⁻¹| = |ϖ|⁻¹` characterises multiplicativity), 397–402 (Remark 2.1.3: the gauge `inf{a⁻ⁿ : r ∈ ϖⁿR₀}` with `ϖ` in a ring of definition, p. 8), 411–422 (normed modules, exact scaling by multiplicative units, continuity ⇔ boundedness over Tate rings, open mapping), 423–428 (BGR 3.7.2–3.7.3 over Noetherian Banach–Tate rings), 429–437 (Def 2.1.5: `c_R(I)`, ON-able, potentially ON-able, (Pr) as a direct summand), 460–505 (Lemmas 2.1.6–2.1.7 with the power exponent `s` from `|ϖ|₂ = |ϖ|₁^s`, p. 9–10); Buz line 181–202 (Prop 2.1 open mapping and canonical topology, Lemma 2.2, pp. 6–7), 221–233 (ON basis), 328–373 (Lemma 2.3 (a)–(c): finite-coordinate injectivity, closedness, relative approximation, pp. 10–11), 606–617 ((Pr) and its lifting universal property, p. 18), 627–628 (Lemma 2.11); Serre line 60–85 (Prop. 1, Lemme 1, Corollaire, pp. 69–70); KL line 1538–1544 (Remark 2.4.4, arXiv v5 p. 39) and 1376–1383 (Remark 2.3.9 uniform units); Col line 436–468 (I.3, Prop. I.3.2 wavelet basis, p. 9–10), 707–720 (Cor. I.4.6, Thm I.4.7, Cor. I.4.8, p. 15), 1502–1508 (Thm II.2.2 with `v_{B(0,u_h)}(A_μ) ≥ v_{LA_h}(μ) ≥ v_{B(0,u_{h+1})}(A_μ) − 1`, p. 30); RJW line 816–827 (Prop. 3.16, arXiv p. 16), 959 (Thm 3.25), 1453–1478 (Thm 3.43 and diagram (3.12), arXiv p. 25); Amice line 1226–1241 (Chap. III Théorème 2, pp. 150–151: `(P_n/S_n)` is a normal basis of `A_h(M)` iff `u` is well distributed of order `h`), 1532–1554 (Théorème 3, pp. 159–160: radius of analyticity from `v(a_n)`); ST line 316–322 (Thm 2.2, Amice's Fourier isomorphism, p. 9); LWX line 1215–1218 (Lemma 3.15: `Λ⟦pT⁻¹⟧ ⊗ ℤ_p[Δ]`, `𝔪Λ·Λ_{>1/p} = (T)`); Conrad line 274–302 (Lemma 1.1.5 and the countable-type section from BGR 2.7.1/4, pp. 6–7). Every sampled statement (0.2, 0.3, 0.4, 1.1, 1.2, 2.1, 2.2, 2.3, 3.3, 4.1–4.5, 5.1) is supported at the generality the README states; the one source slip found is under "Source issues".

**Adversarial table.** Values computed on each side; `g` is `tateGauge`.

| Statement | Instance | Left | Right | Result | Change |
| --- | --- | --- | --- | --- | --- |
| §5.3 composite `δ_a ↦ [γ^a]`, `T = [γ]−1` (this PR) | `a = 0, 1`; `p = 2`, `γ = 5` | `δ_0 ↦ 1 ↦ [1]`, `δ_1 ↦ 1+T ↦ [γ]` | `[γ^0] = [1]`, `[γ^1]` | agrees | none |
| same, generator change | `γ' = γ^u`, `u ∈ ℤ_pˣ` | `T' = [γ']−1 = (1+T)^u − 1` | PPG L9 `exists_isUnit_powerSeriesCoordinate_eq_subst` | agrees with §5.2 line 877–878 | none |
| §0.4 Check `(ℤ_p, p², p)` | `x = p`, `x = p²`, `a = p`, `ϖ = p²` | `g(p) = inf{p⁻ⁿ : 1−2n ≥ 0} = 1`; `g(p²) = p⁻¹` | README `1, p⁻¹` | agrees; `g(p)² = 1 ≠ g(p²)` so not multiplicative | none |
| §0.4 Check membership `ϖ ∈ A₀` | `A = ℚ_p²`, `A₀ = {x ≡ y mod p²}`, `ϖ = (p, p²)` | `g(1) = 1`, `g(ϖ) = a⁻¹`, `g(1+ϖ)`: `n = 0, −1` fail (`v(p−p²) = v(p−p⁴) = 1`), `n = −2` works | `a²` | `a² > max(1, a⁻¹)`: ultrametricity fails, `hϖ` is needed and present in `exists_tateSeminorm` | none (source gap recorded) |
| §0.4 Check `N(x) = max(|x|, |x|²)` on `ℚ_p` | `|ϖ| = r < 1` | `N(ϖ)N(ϖ⁻¹) = r · r⁻²` | `r⁻¹ > 1 = N(1)` | no multiplicative pseudo-uniformiser; topological Tate ≠ normed Tate | none |
| `tateGauge_rpow` | `x = 0`; `x` with `n_x` | `g_b(0) = sInf{b⁻ⁿ} = 0`; `g_b(x) = b^{−n_x}` | `0^{log b/log a} = 0`; `(a^{−n_x})^{log b/log a} = b^{−n_x}` | agrees | none |
| `tateGauge_eq_zero_iff` | `A = ℚ_p`, `A₀ = ℤ_p`, `ϖ = p`; `A` indiscrete | `g x = 0 ⇔ x ∈ ⋂ pⁿℤ_p = {0}` ; indiscrete: `g ≡ 0`, closure{0} = A | `T2 ⇔ closure{0} = {0}` | agrees both directions | none |
| `tateGauge_equiv` | `A = ℚ_p²`, `ϖ = (p,p)`, `A₀ = ℤ_p²`, `B₀ = {x ≡ y mod p}` (both rings of definition containing `ϖ`) | `B₀ ⊆ A₀ ⊆ ϖ⁻¹B₀`, so `g_A ≤ g_B ≤ a·g_A` | `C = a` | holds; in general `ϖⁿA₀ ⊆ B₀` for some `n` because `ϖⁿA₀` is a basis and `B₀` a neighbourhood | none |
| §0.2 Neumann `‖(1−x)⁻¹‖ = 1`, `‖(1−x)⁻¹−1‖ = ‖x‖` | `‖x‖ < 1` in a complete ultrametric norm-one ring; `x = 0` | `‖1 + Σ_{n≥1} xⁿ‖ = ‖1‖` since `‖Σ_{n≥1}xⁿ‖ ≤ ‖x‖ < 1`; `‖x + x² + …‖ = ‖x‖` since `‖x²+…‖ ≤ ‖x‖² < ‖x‖` | `1`; `‖x‖`; at `x = 0`: `1`, `0` | agrees (needs ultrametric, which Convention 1 fixes) | none |
| §0.3 power comparison | JN 2.1.7, common `ϖ`, `|ϖ|₂ = |ϖ|₁^s` | `C₁|a|₁^s ≤ |a|₂ ≤ C₂|a|₁^s` | README "exponent determined by its two norms" | agrees; equal topology alone gives only JN 2.1.6's `|a|_ϖ ≤ C₂|a|_π^s` | none |
| `le_opNorm` | `R = ℤ_p` (not Tate), `u = id : (ℤ_p, |·|²) → (ℤ_p, |·|)` | bound set empty, `sInf ∅ = 0`, `‖u x‖ ≤ 0` false for `x ≠ 0` | — | the `IsTate R` hypothesis is exactly what excludes this (README line 377–379 Check) | none |
| `le_opNorm` | `R` Tate, `M` zero module | `‖u 0‖ = 0 ≤ opNorm u · 0` | `0` | holds; `opNorm = 0` | none |
| `exists_isOrthonormalBasis_iff` | `I = ∅` | `IsOrthonormalBasis R (e : ∅ → M)` ⇔ `Dense {0}` ⇔ `M = 0` | `C₀(∅, R) = 0` | agrees | none |
| same | `R` zero ring | `NormOneClass` forces `‖1‖ = 1 ≠ ‖0‖ = 0` | — | zero ring excluded by the binders | none |
| same, `→` direction | `M = c₀(ℕ,ℚ_p)` finite-support subspace (incomplete) | has an orthonormal family with dense span | no isometry to `C₀` (not complete) | `CompleteSpace M` is in the `variable` block (line 173) and used | none |
| `exists_finset_norm_le` | `P = 0` | `S = ∅`, `C = 1`: `‖0‖ ≤ 1·0` | `0` | holds | none |
| same | `P = R·single i₀ 1` | `S = {i₀}`, `C = 1`: `‖f‖ = ‖f i₀‖` | equality | holds (README Check line 542–543) | none |
| `exists_continuousLinearEquiv_prod_of_countableType` | `M = 0`, `q = id` | `d = (0, id)` | `d(i m) = (0,0)`, `(d x).2 = x` | holds | none |
| same | `E = K⟨T⟩`, `i` = constants, `q` = constant-term kernel quotient | Schneider countable-type splitting | — | README Check line 540 | none |
| §2.6 adapter `B(u∘v) = B(v)B(u)` | `A(u)` 2×3 and `A(v)` 3×2 over `ℚ_p` | `A(u∘v) = A(u)A(v)` (2×2) | transpose reverses order | consistent with LocallyAnalyticDistributions Convention 2 (`a_ij = matrixCoeff u j i`) | none |
| §3.2 Check Mahler of `x²` | `x² = x + 2·x(x−1)/2` | `binom(x,1) + 2 binom(x,2)` | same | agrees | none |
| §3.4 Check `x^p − x` | `x = 1+p` | `(1+p)^p − (1+p)`: valuation 1 | sup norm `p⁻¹`, Gauss norm of coefficients `1` | agrees | none |
| `existsUnique_integral_iff_norm_le_one` | `ν = δ₀`; `ν = p⁻¹δ₀` | `‖δ₀‖ = 1`, restriction `μ = δ₀` integral; `‖p⁻¹δ₀‖ = p` | `≤ 1` true; false | `p⁻¹δ₀` has no integral restriction (`μ(1) = p⁻¹ ∉ ℤ_p`) | none |
| same, `→` | `f` with `‖f‖ = p^{−j}` | `g = p^{−j}f` integral of norm 1, `ν(f) = p^{j}μ(g)` | `‖ν f‖ ≤ p^{−j}` | holds | none |
| `amiceTransform_phiMeasure` | `μ = δ₁`; `μ = δ₀`; `μ = 0` | `A(φδ₁) = A(δ_p) = (1+T)^p`; `1`; `0` | `subst((1+X)^p−1)(1+T) = (1+T)^p`; `1`; `0` | agrees (README Check line 649–650); `(1+X)^p − 1` has zero constant term so `subst` is honest | none |
| §3.4 Check `φ, ψ` at `p = 3` | `δ₂`, `δ₆`, `δ₁` | `φδ₂ = δ₆`; `ψδ₆ = δ₂` (`6 ∈ 3ℤ_3`); `ψδ₁ = 0` | README | agrees | none |
| `norm_toCLMEquiv_eq_iSup_coeff` | `μ = δ_a`, `a ∈ ℤ_p` | `‖δ_a‖ = 1` | `sup_n ‖binom(a,n)‖ = 1` (attained at `n = 0`) | agrees | none |
| §4.3 transition formula | `k = 1`, `w = b + pv` | `c₁(b + pv) = c₁b + p c₁ v` | `d_0 = Σ_k bᵏc_k`, `d_1 = Σ_k k b^{k−1} p c_k` | agrees; contraction factor `p^j` | none |
| §4.4 Check `E = 𝔽_p`, `x^p − x` | level-one discs | `d_(a,j)` carry `p^j` for `j ≥ 1`, `d_(a,0) = a^p − a` | `0` in `𝔽_p` | nonzero vector evaluates to zero: injectivity needs `p`-torsion-freeness, as stated | none |
| `amiceDiscNorm ≤ amiceDualNorm` | `m = ⌊n/p^h⌋`, Legendre | `v_p(m!) = (m − s_p(m))/(p−1) ≤ n/((p−1)p^h)` | `p^{−n/((p−1)p^h)} ≤ ‖m!‖` | holds termwise | none |
| `amiceDualNorm ≤ p · amiceDiscNorm (h+1)` | `n = p^h` (`m = 1`); `n = p^{h+1}` (`m = p`); `m = p^k − 1` | `‖1‖ = 1 ≤ p·p^{−1/(p−1)}`; `p⁻¹ ≤ p^{1−1/(p−1)}`; `v_p(m!) = (p^k−1)/(p−1) − k ≥ (p^k−1+θ)/((p−1)p) − 1` | — | holds; without the factor `p` it fails at `n = p^h` (`1 > p^{−1/(p−1)}`); matches Col Thm II.2.2's `−1` | none |
| both inequalities, junk control | `F` with `‖coeff n‖ = p^{v_p(n)}` (the example) | restricted on all `ρ < 1`, both suprema finite (`‖b_n‖ρ_h^n n^{O(1)} → 0`) | — | the `hF` hypothesis prevents a junk `⨆` | none |
| §4.7 Check `b_n = 1/n!` | `h = 0`; `h = 1` | `D_0 = sup ‖1/n!‖‖n!‖ = 1`; `D_1 = sup p^{v(n!) − v(⌊n/p⌋!)} = sup p^{⌊n/p⌋}` | `1`; `∞` | agrees | none |
| §4.6 / §4.7 Check `‖t‖ = 2^{−1/2}` | `p = 2`, `h = 1, 2` | threshold `2^{−1/((p−1)p^h)} = 2^{−1/2}, 2^{−1/4}` | `2^{−1/2} ≮ 2^{−1/2}`; `< 2^{−1/4}` | fails level 1, passes level 2 | none |
| §5.2 conductor valuations | `p` odd, `m ≥ 2`; `p = 2`, `m ≥ 3` | `ψ(γ)` primitive `p^{m−1}`-th (resp. `2^{m−2}`-th) root of unity | `v_p(ζ−1) = 1/(p^{m−2}(p−1))`; `1/2^{m−3}` | agrees | none |
| §5.4 equivalence | `‖(1+T_κ)^{p^h/q} − 1‖ < r_p` | §4.6 with exponent `p^{h−v_p(q)}`: `‖T_κ‖ < p^{−1/((p−1)p^{h−v_p(q)})}` | `p^{−q/(p^h(p−1))}` since `p^{v_p(q)} = q` for all `p` | agrees | none |
| `exists_character_of_hasEval` | `x = γ`; `S` the zero ring | `κ γ = η(1)·aeval(binomialSeries 1) = 1+z` so `TCoord = z` | consistent with the first conjunct | holds; zero ring trivial | none |
| `existsUnique_character_of_norm_lt_one` | dual numbers, `z = ε`, `‖ε‖ = 1` | excluded by `‖z‖ < 1` | README Check line 1029–1031 | the negative control is outside the hypothesis, as intended | none |
| `measurePairing_norm_le` | `κ` continuous, `ℤ_pˣ` compact | `‖κ(x)‖` ranges in a compact subgroup of `ℝ_{>0}` | `{1}` | `‖weightTest κ‖ = 1`, bound holds | none |
| `measurePairing_injective` | `μ = δ_a − δ_b`, `a ≠ b` | at `κ = 1`: `0`; at `κ(x) = x`: `a − b ≠ 0` | — | separates (README Check line 1037–1038); polynomials restricted to the clopen `ℤ_pˣ` are dense | none |
| §5.6 gauge | `A₀ = H`, `ϖ = T`, `a = α⁻¹` | `‖T‖ = α` (`T⁻¹T = 1 ∈ H`, `T⁻²T = U/p ∉ H`); `‖U‖ = 1` (`U ∈ H`, `T⁻¹U = p/T² ∉ H`); `‖p‖ = α` | README `‖T‖ = α`, `‖U‖ = 1` | agrees; `Σ Uʲ` formal but not convergent | none |
| §5.6 evaluation at `t` | `p⁻¹ < |t| < 1`, `m → −∞` | `|d_m||t|^m ≤ (p|t|)^{−|m|}` | `→ 0` iff `p|t| > 1` | the annulus is exactly right | none |
| §5.3 extension (R02) | `ν = δ_a` extended to `ℂ_p` | `‖ν_{ℂ_p}‖ = 1`, `measureFun δ_a κ = κ(a)` | `|κ(a)| = 1` | the extension is elementary and must be owned here | R02 |

## Not verifiable

- [Sch] Schneider, *Nonarchimedean Functional Analysis* (Springer): paywalled; cited at §§3–4, 8–10 by locator only.
- [Bel] Bellaïche, *The Eigenbook* (Birkhäuser): paywalled; cited at Chapter II.1 by locator only.
- [BGR] Bosch–Güntzer–Remmert (Springer): paywalled; its 2.7.1/4 and 3.7.2–3.7.3 are relayed through Conrad line 300 and JN line 423–428, which were read.
- [Mah] Mahler 1958 (Crelle): not fetched; §3.2 is outside the sampled targets and is also covered by Col line 294 onward.

## Source issues

- **Gap** in KL at Remark 2.4.4, arXiv v5 p. 39: the source says that for any ring of definition `A₀` and topologically nilpotent unit `z` the function `inf{cⁿ : z⁻ⁿx ∈ A₀}` is a Banach-ring norm; it should require `z ∈ A₀` (or a power of `z` in `A₀`), since otherwise the ultrametric inequality can fail (`ℚ_p²`, `A₀ = {x ≡ y mod p²}`, `z = (p,p²)`); affects a stated result. The roadmap already adds the hypothesis (README line 1089, §0.4).
- **Error** in JN at Lemma 2.1.6, published version (JN footnote 3, line 500): the source says the published statement of the lemma is incorrect; it should be the arXiv v4 statement with the two-regime bound `|a|_ϖ ≤ C₁` for `|a|_π < 1` and `|a|_ϖ ≤ C₂|a|_π^s` otherwise; affects a stated result; corrected in print at arXiv:1604.07739v4 Lemma 2.1.6.
