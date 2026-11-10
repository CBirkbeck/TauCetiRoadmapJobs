# Review of OptimalTransport (pull request #950 at 55f4658)

**Verdict:** needs changes

This is a full review. The folder changed by 460 lines since `3639528` (455 in `TauCetiRoadmap/OptimalTransport/README.md`, 5 in the docstring of `Suggested.lean`). Eight findings, all P3, none blocking. The branch still pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3`; main pins Tau Ceti `2fd255d` and Mathlib `1b1ccf4`.

## Status of the previous review's findings (read at `3639528`)

- **R01 (P2, 13.5 zero-temperature limit): repaired.** `README.md:3383–3428` now states three parts, each with its hypotheses: values for discretisable costs and for continuous costs with an integrable split bound; cluster points for lower semicontinuous costs "with `C_ε → C₀`"; selection. The off-diagonal cost is a Check (`:3432–3436`). The seven cited Tau Ceti statements match the README's hypotheses at `2fd255d` (signatures under Verified sound), and all Nutz locators are right.
- **R02 (P2, "proved in the pinned Tau Ceti"): not repaired.** `Suggested.lean:23–24` is unchanged and nine of its seventeen names are absent at the branch pin. Held as R01 below, with a repair inside the folder.
- **R03 (P3, contract names absent at the branch pin): not repaired.** Folded into R01 below.
- **R04 (P3, 1.2–1.3, 2.2, 4.3–4.4 uncited): repaired.** Each subsection names its Tau Ceti declarations in the text and on the *Needs:* line, and 2.2 no longer says "missing" (`:958–962`).
- **R05 (P3, nine targets without locators): repaired for 3.1, 6.10, 6.12, 7.4, 11.2, 13.7, 14.7, 15.4; partly for 14.6.** 14.6 gained the Lott–Villani locators but cites Sturm without a theorem number (R07 below). All added locators were read at the text.
- **R06 (P3, 14.5 theorem numbers): repaired.** `:3761–3776` cites arXiv v2's 6.10, 6.11, 6.18, 6.20 and gives the heat-flow convergence its own locators.
- **R07 (P3, PDE §1.1 for weak derivatives): repaired.** 5.9 and Layer 6 consume `TauCeti.HasWeakFDerivOn`, `TauCeti.W1p`, `TauCeti.Wkp`; PDE §1.1 is no longer cited.
- **R08 (P3, 5.9, 8.8, 8.9 without Checks): repaired.** All eleven new Checks were recomputed (table below).

## R01 (P3) — The docstring and the Tau Ceti contracts describe main's pin, not the pin the folder builds against

Re-raised: H01, H02

**Location.** `Suggested.lean:23–24`: "The following headline theorems of `README.md` are proved in the pinned Tau Ceti, so they are not restated here." Also `README.md:366–367`: "The following theorems of Tau Ceti prove targets of the layers below".

**Claim.** The seventeen listed headlines, and the declarations of "From Tau Ceti", exist at the Tau Ceti this folder pins.

**Witness.** At `a91d3aa`, nine of the seventeen are in no file, for example `mongeCost_eq_transportCost_of_continuous` and `tendsto_entropicTransportCost_transportCost_of_le_add`. Of 136 cited Tau Ceti names 60 resolve there, and 25 of 57 cited paths exist. All 136 names and 57 paths resolve at `2fd255d`.

**Why the earlier reason does not settle it.** The reason was that a folder-only repair cannot merge `origin/main`. The merge is not needed to make the two sentences true: they can name the revision. Three roadmaps on main do this (PDE, AlgebraicVectorBundles, GeometricTopology).

**Repair, inside the folder.**
1. `Suggested.lean:23–24`: "…are proved in Tau Ceti at revision `2fd255d9`, the revision pinned by the roadmap repository's main branch, so they are not restated here." The third list (`:78–80`) already says its carriers are missing from this file's pin; keep it.
2. `README.md`, first sentence of "From Tau Ceti": "Declaration names and paths are those of Tau Ceti at revision `2fd255d9` with Mathlib `1b1ccf4b`, the revisions pinned by the roadmap repository's main branch."
3. After `origin/main` is merged (outside this folder), state the six third-list headlines and delete that list, as the description already plans.

**Check.** With sentence 2 in place, a scan of every backticked `TauCeti.*` name and every `.lean` path of the README against `2fd255d` reports 0 missing.

## R02 (P3) — Sampled targets restate what Tau Ceti proves without citing it

**Location.** `README.md:933–935`, 2.1: "Define dual-feasible potential pairs and their value … Prove weak duality once for the general interface." Also 2.5 (`:1010–1014`), 5.8 (`:1574–1590`), 10.4 (`:2688–2696`), 11.4 (`:2871–2874`), 11.6 (`:2897–2925`), 12.7 (`:3156–3168`), 13.3, 13.7–13.9 (`:3481–3537`).

**Claim.** Scope (`:61–64`) says Tau Ceti's library is the implementation and that implemented targets cite it (`:366`).

**Witness.** Uncited, at both pins: `TauCeti.DualFeasible`, `TauCeti.kantorovichDualValue`, `TauCeti.DualFeasible.kantorovichDualValue_le_transportCost` (`TauCeti/MeasureTheory/OptimalTransport/Duality/Basic.lean:74, 146, 251` at `a91d3aa`). At `2fd255d` only: `Matrix.hilbertProjectiveDist_mulVec_le` (`TauCeti/Data/Matrix/BirkhoffContraction.lean:410`), Birkhoff's contraction with factor `tanh(Δ(K)/4)`, which is 13.9's theorem.

**Repair.** Add to "From Tau Ceti", and to the text and *Needs:* line of each subsection (paths under `TauCeti/`, lines at `2fd255d`; `…/` is `MeasureTheory/OptimalTransport/`):

| Target | Declarations | What they prove |
|---|---|---|
| 2.1 | `TauCeti.DualFeasible`, `TauCeti.kantorovichDualValue`, `TauCeti.DualFeasible.kantorovichDualValue_le_transportCost` (`…/Duality/Basic.lean:75, 147, 245`) | the constraint `φ x + ψ y ≤ c(x,y)`, the dual value, weak duality |
| 2.5 | `TauCeti.relaxedTransportCost` (`…/Cost/Partial/Basic.lean:126`); `TauCeti.DualFeasible.ofReal_kantorovichDualValue_le_relaxedTransportCost`, `TauCeti.relaxedTransportCost_eq_transportCost_of_lowerSemicontinuous` (`…/Duality/Relaxed.lean:129, 163`) | the relaxed value, its weak duality, exactness for lower semicontinuous costs on Polish spaces |
| 5.8 | `TauCeti.subsingleton_setOf_mem_contactSet_of_strictConvexOn`, `TauCeti.IsDualCertificate.eq_of_isOptimalCoupling_of_strictConvexOn` (`…/Twist/StrictConvex.lean:117, 196`) | one contact partner where `φ` is differentiable; uniqueness of the optimal plan for a certified strictly convex cost |
| 10.4, 11.6 | `TauCeti.moreauYosidaResolvent` (`Analysis/GradientFlow/MoreauYosida/Basic.lean:124`); `TauCeti.WassersteinSpace.moreauYosidaResolvent_nonempty` (`…/Wasserstein/Resolvent.lean:115`); `TauCeti.apply_le_apply_add_of_mem_moreauYosidaResolvent` (`…/Wasserstein/EulerLagrange.lean:250`) | the resolvent set; existence of the JKO step; its variational inequality |
| 11.4 | `TauCeti.wassersteinSubdifferential`, `TauCeti.existsUnique_mem_wassersteinSubdifferential_forall_norm_le` (`…/Wasserstein/Subdifferential.lean:106, 175`) | the Fréchet subdifferential in `L²(μ;E)`; its unique element of minimal norm |
| 12.7 | `TauCeti.WassersteinSpace.subsingleton_frechetBarycenters_two_sum_smul_dirac` (`…/Wasserstein/Barycenter/Uniqueness/Euclidean.lean:75`); `TauCeti.iInf_sum_mul_wassersteinEDist_sq_eq` (`…/MultiMarginal/Barycenter.lean:273`) | uniqueness when one input of positive weight is absolutely continuous; equality of the barycentric and multi-marginal values |
| 13.3 | `TauCeti.IsCoupling.exists_eq_withDensity_exp_add_of_klDiv_eq_schroedingerValue` (`…/Entropic/SchroedingerSystem.lean:572`) | Schrödinger potentials for a bounded log-density |
| 13.7 | `TauCeti.klDiv_eq_sum_add_klDiv_proportionalFitting` (`…/ProportionalFitting.lean:148`) | the telescoped Pythagorean identity |
| 13.8 | `Matrix.exists_sinkhorn_scaling_iff` (`Data/Matrix/Scaling/Support.lean:91`); `Matrix.hasTotalSupport_iff_exists_mem_doublyStochastic` (`Data/Matrix/TotalSupport.lean:175`) | the support criterion; total support |
| 13.9 | `TauCeti.hilbertProjectiveDist`, `Matrix.projectiveDiameter`, `Matrix.hilbertProjectiveDist_mulVec_le` (`Data/Matrix/BirkhoffContraction.lean:80, 218, 410`); `Matrix.hilbertProjectiveDist_sinkhornStep_le` (`Data/Matrix/Sinkhorn/Basic.lean:190`); the rates of `Data/Matrix/Sinkhorn/Rate.lean`; `TauCeti.tendsto_proportionalFitting_apply` (`…/Finite/ProportionalFitting.lean:233`) | Hilbert's metric, `Δ(K)`, Birkhoff contraction, the squared factor for a full step, explicit rates, convergence to the Schrödinger minimizer |

Each review samples new targets, so a single pass ends this cycle. Of the 185 files under `TauCeti/MeasureTheory/OptimalTransport/` at `2fd255d`, 130 have no declaration named in the README (55 of them exist at `a91d3aa` too), among them `Duality/Compact.lean`, `Duality/Attainment.lean`, `MetricMeasure/CurvatureDimension.lean`, `GromovWasserstein/Zero.lean` and `Wasserstein/InternalEnergy/DisplacementConvexity.lean`.

**Check.** After the edit, `roadmaps resolve` finds every added name at `2fd255d`, and the gate's `readme-ids-missing` stays `0` (none is this roadmap's own name).

## R03 (P3) — 2.5 has no exact statement, no locator, and no definition or Checks for the relaxed primal

**Location.** `README.md:1010–1014`: "finite-valued nonnegative Borel costs on Polish spaces following Beiglböck--Schachermayer, and extended-valued Borel costs through the relaxed partial-transport primal of Beiglböck--Léonard--Schachermayer. Prove when the relaxed and ordinary primals agree."

**Claim.** Every theorem has its exact hypotheses and a locator; every definition has three Checks.

**Witness.** Neither paper is cited by theorem. The relaxed primal is not defined. The first source needs less than "finite-valued": `c` finite `μ⊗ν`-almost everywhere (arXiv:0807.1468v1, Theorem 1, p. 2).

**Repair.** Rewrite 2.5 as follows, for Polish `X`, `Y` with Borel probability laws and Borel `c : X × Y → [0,∞]`.
1. Define `P^ε` as the infimum of `∫ c dπ` over measures `π` with marginals at most `μ` and `ν` and mass at least `1 - ε`, and `P^rel = lim_{ε→0} P^ε` (Beiglböck–Léonard–Schachermayer, arXiv:0911.4347v2, (7), p. 3). This is `TauCeti.relaxedTransportCost`.
2. `P^rel = D`, both possibly `∞` (their Theorem 1.2, p. 3).
3. `P = P^rel` when `c` is lower semicontinuous, bounded, or `μ⊗ν`-almost everywhere finite (Theorem 1.2 (a)–(c); Corollaries 3.1 and 3.3; Theorem 3.4).
4. For `c` finite `μ⊗ν`-almost everywhere with a finite transport plan, `P = D` and Borel maximizers with values in `[-∞,∞)` exist (Beiglböck–Schachermayer, arXiv:0807.1468v1, Theorems 1 and 2, pp. 2–3).
5. Dual attainment for `P^rel` holds exactly when `P^rel = P_{c∧h}` for some `μ⊗ν`-almost everywhere finite `h` (BLS Theorem 3.5).

Checks to add:
- On `[0,1]` with Lebesgue marginals and `c = 0` below the diagonal, `1` on it, `∞` above: `P = 1`, `D = 0`, `P^rel = 0` (BLS Example 1.1, p. 2).
- For `δ₀`, `δ₀` and `c ≡ 5`: `P^ε = 5(1-ε)`, so `P^rel = 5 = P`.
- A definition with `ε` fixed instead of the limit gives `5(1-ε) < 5` in that case.

**Check on the witness.** In the first example every finite-cost coupling lies in `{y ≤ x}` and has `∫(x-y) dπ = 0`, so it is the diagonal, cost `1`. The shift `x ↦ x - ε` on `[ε,1]` has cost `0` and mass `1 - ε`.

## R04 (P3) — 5.7 has no locator and states a narrower hypothesis than the sharp one

**Location.** `README.md:1564–1568`: "Prove the exact stronger quadratic source theorem: for `μ,ν ∈ P₂(ℝⁿ)`, assume `μ(E)=0` for every Borel `E` covered by countably many `(n-1)`-dimensional Lipschitz submanifolds."

**Claim.** This is the exact source condition.

**Witness.** The exact condition is weaker and is an equivalence: `μ` gives mass `0` to every `c - c` hypersurface exactly when, for every `ν ∈ P₂`, the optimal plan is unique and induced by a map (`ambrosio-gigli-guide` lines 890–902, Definition 1.25 and Theorem 1.26, p. 16). Lines 892–894 note that the Lipschitz-null condition is only sufficient.

**Repair.**
- Define regular measures as those null on `c - c` hypersurfaces, the graphs of differences of two convex functions of `n - 1` variables (Definition 1.25).
- State Theorem 1.26 with both directions, with Theorem 1.24 (the non-differentiability set of a convex function is covered by countably many such hypersurfaces) on the *Needs:* line.
- Keep the Lipschitz-null and absolutely continuous cases as corollaries.

**Check.** On `ℝ`, a `c - c` hypersurface is a point, so the regular measures are the atomless ones. `δ₀ → (δ₋₁+δ₁)/2` has no transport map, as direction (i) ⇒ (ii) requires.

## R05 (P3) — 7.3's cited theorems are for compact manifolds; the noncompact formula has no readable support

**Location.** `README.md:2064–2067`: "for finite-second-moment laws on a finite-dimensional, connected, boundaryless, geodesically complete smooth Riemannian manifold … the unique quadratic optimal plan is induced by `T(x)=exp_x(-∇φ(x))`." Also 7.2, `:2047–2048`: "At every differentiability point `x` of the semiconcave potential `φ`".

**Claim.** The root theorem holds on noncompact `M` with a true gradient.

**Witness.** McCann's Theorems 8 and 9 assume a compact manifold (`mccann-polar` lines 456, 489), and so does Ambrosio–Gigli Theorem 1.33 (`ambrosio-gigli-guide` line 1065). On a compact `M` the potential is Lipschitz. On a noncompact `M` its differentiability `μ`-almost everywhere is a separate theorem.

**Repair.**
- Give the noncompact statement its own locator for the differentiability of `φ`: Figalli–Gigli, *Local semiconvexity of Kantorovich potentials on non-compact manifolds*, ESAIM COCV 17 (2011), doi:10.1051/cocv/2010011, with its theorem number.
- In 7.2 replace "the semiconcave potential `φ`" by "`φ`, locally semiconcave on an open set of full `μ`-measure".
- Confirm the number of Villani's theorem at `:2154` and in the docstring at `Suggested.lean:198` against the book.

I could read neither text (see Not verifiable), so I give no number.

**Check.** The Lean headline `exists_isKantorovichOptimalTransportMap_riemannian` asserts only existence and uniqueness, so it does not depend on this.

## R06 (P3) — 11.4 does not say which subdifferential it defines, and its third Check fails for Tau Ceti's

**Location.** `README.md:2884`: "For an energy constant in `μ` the subdifferential is `{0}` and the slope is `0`." Also `:2873–2874`: "the equivalence with velocity fields under the AGS hypotheses".

**Claim.** The Check holds for the subdifferentials 11.4 defines.

**Witness.** For `μ` uniform on the unit disc and `ξ(x) = (-x₂, x₁)`: `∫⟨ξ, ∇u - id⟩ dμ = 0` for every convex `u`, since `⟨ξ, x⟩ = 0` and `⟨ξ, ∇u⟩ = ∂_θ u` integrates to `0` on each circle. So `ξ ≠ 0` lies in `TauCeti.wassersteinSubdifferential` of a constant energy (`…/Wasserstein/Subdifferential.lean:106` at `2fd255d`).

**Repair.**
- State the definitions with locators. Ambrosio–Gigli Definition 3.26, p. 69, requires subgradients in `Tan_μ(P₂(ℝᵈ))` at a regular `μ` for a `λ`-geodesically convex energy (`ambrosio-gigli-guide` line 3593). Ambrosio–Gigli–Savaré's Fréchet, strong and extended subdifferentials do not; cite them by number under `ambrosio-gigli-savare`.
- Replace "under the AGS hypotheses" by the hypotheses themselves.
- Reword the Check: "For a constant energy the strong subdifferential and the tangent subdifferential are `{0}`. The Fréchet subdifferential at the uniform law on the unit disc also contains `x ↦ (-x₂, x₁)`, which is orthogonal to the tangent space; its element of minimal norm is `0`, equal to the slope."

**Check.** At `δ_a` the tangent space is all of `ℝⁿ`, and `⟨ξ, y - a⟩ ≤ o(|y - a|)` for all `y` forces `ξ = 0`, so there the two notions agree.

## R07 (P3) — 9.3 has no locator and undefined vocabulary; 14.6 cites Sturm without a theorem number

**Location.** `README.md:2473–2474`: "Define ordinary geodesic convexity, strong/weak displacement convexity, and convexity along generalized geodesics". Also `:3801–3802`: "the complete noncompact case and finite `N` with `K ≠ 0` follow the two parts of Sturm's *On the geometry of metric measure spaces*."

**Claim.** Every definition and theorem has a locator, and every term is standard or defined.

**Witness.** 9.3 cites nothing, and "strong/weak" is not defined anywhere in the README. 14.6's stated equivalences (`:3788–3790`) are for complete noncompact `M` and every `K`, which the Lott–Villani theorems cited (compact `M`; `K = 0` at finite `N`) do not cover.

**Repair.**
- 9.3: `λ`-geodesic convexity along some geodesic, Ambrosio–Gigli Definition 3.16, p. 59 (`ambrosio-gigli-guide` line 3107). `λ`-displacement convex (along all Wasserstein geodesics) and weakly `λ`-displacement convex (along some), Lott–Villani Definition 3.15, p. 17 (`lott-villani` line 799). Interpolating curves with a base, Ambrosio–Gigli Definition 3.29, p. 70. Use "displacement convex" and "weakly displacement convex" for the two notions.
- 14.6: give the theorem number in each part of Sturm's paper (weighted manifolds, `K ∈ ℝ`, `N = ∞`; and `CD(K,N)` with `N ≥ n`). Both parts are paywalled, so the manifest records them as uncertified.

**Check.** 9.3's first Check is the equality case of Lott–Villani's (3.16): `2t² = 2t - (1/2)·t(1-t)·4`.

## R08 (P3) — 12.7's third Check is about the Lean statement, which differs from the README at `n = 0`

**Location.** `README.md:3178–3180`: "For `n = 0`, `n - 1` is `0` in `ℕ`, every set has dimension `0`, and no probability law satisfies the predicate, so the Lean statement is vacuous on `ℝ⁰`".

**Claim.** A Check tests the mathematics and names no Lean counterpart; the README's generality equals the Lean's.

**Witness.** In the README `n - 1 = -1` at `n = 0`: no nonempty set has dimension at most `-1`, every law satisfies the predicate, and the theorem holds with barycenter `δ₀`. In `Suggested.lean:254`, `((n - 1 : ℕ) : ℝ≥0∞) = 0` and `hsmall` gives `μ j univ = 0`.

**Repair.**
- Check: "For `n = 0` no nonempty set has dimension at most `-1`, so every law vanishes on small sets and `δ₀` is the unique barycenter."
- Move the remark on truncated subtraction to the docstring of `existsUnique_isMinOn_sum_wassersteinEDist_sq_of_dimH_le`: "For `n = 0` the truncated `n - 1` is `0`, the hypothesis `hsmall` is unsatisfiable, and the statement is vacuous."

**Check.** For `n = 1` both readings give "null on sets of dimension `0`", which the Cantor measure satisfies and `δ₀` does not.

## Verified sound

**Gate, build and diff.**
- The worker's gate on this head: every counter `0`, `build=0`, `OK`.
- `lake env lean` on `Suggested.lean` at the branch pin: exit 0, 32 s, exactly eight `declaration uses 'sorry'` warnings (`:115, :139, :168, :204, :228, :250, :267, :289`).
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/OptimalTransport'` is empty.

**Dependency check.** The command printed:

```
depcheck: 233 roadmaps, 2263 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The six supplier folders (HopfRinow and OneParameterSemigroups under `Completed/`, RiemannianGeometry, DifferentialGeometry, GeometricMeasureTheory, PDE) are on main, and the cited sections exist there: RiemannianGeometry R4 item 6 (`README.md:717`), DifferentialGeometry 12.2–12.5 (`:918–930`), PDE §1.6, §1.7, §2.4, §6.3 (`:905, :996, :1241, :2309`).

**Signatures and padding.**
- A scratch copy with `#check @name` for all eight declarations elaborated all eight. The file has no `variable` block, so no binder can be lost; each type matches its README statement.
- On the same copy every `sorry` was replaced by `first | rfl | infer_instance | (simp; done) | trivial | exact ⟨_, rfl⟩ | (intros; exact ⟨_, rfl⟩) | aesop`. All eight fail (8 errors). No headline closes in one tactic.
- None of the eight is proved in Tau Ceti at `2fd255d`. The nearest are partial: `Twist/StrictConvex.lean` (uniqueness given a certificate), `Entropic/SchroedingerSystem.lean` (bounded log-density), `Wasserstein/Gaussian/FixedPoint.lean` (given the fixed point), `Barycenter/Uniqueness/Euclidean.lean` (absolutely continuous input).

**Tau Ceti declarations opened at `2fd255d` (31).**
- `Entropic/ZeroTemperature.lean:240, 270, 477, 504` and `Entropic/Selection.lean:89, 109, 178`: hypotheses as recorded in 13.5 (`[IsFiniteMeasure μ]`; tight singletons, `c : X × Y → ℝ≥0` continuous, split bound with finite `lintegral`s; `LowerSemicontinuous c` on bundled probability measures).
- `Duality/Basic.lean:75, 147, 245`; `Duality/Relaxed.lean:69, 129, 163`; `Cost/Partial/Basic.lean:126`.
- `Twist/StrictConvex.lean:117, 196`; `Wasserstein/Subdifferential.lean:106, 175`; `Wasserstein/Resolvent.lean:115`; `Wasserstein/EulerLagrange.lean:250`.
- `Wasserstein/Barycenter/Uniqueness/Euclidean.lean:75`; `MultiMarginal/Barycenter.lean:273`.
- `Data/Matrix/Scaling/Basic.lean:894` (`Matrix.exists_sinkhorn_scaling`, at the path the README gives); `Data/Matrix/Scaling/Support.lean:91`; `Data/Matrix/TotalSupport.lean:175`; `Data/Matrix/BirkhoffContraction.lean:80, 218, 410`; `Data/Matrix/Sinkhorn/Basic.lean:190`.
- `Finite/ProportionalFitting.lean:233`; `ProportionalFitting.lean:148`; `Entropic/SchroedingerSystem.lean:480, 572`.
- At `a91d3aa`: `Duality/Basic.lean:74, 146, 251`; `Data/Matrix/Scaling.lean:922`.
- Mathlib at `6b7abb3`: `MeasureTheory.Measure.IsCondKernel` and `disintegrate` (`Probability/Kernel/Disintegration/Basic.lean:57, 62`), `MeasureTheory.Measure.condKernel` (`…/Disintegration/StandardBorel.lean:360`).

**Ownership against open pull requests.** `overlaps.md` lists no conflicting head and no dropped id. `roadmaps grep` over all open heads for Brenier, Sinkhorn, Gromov–Wasserstein, Benamou, Monge–Ampère, `RCD(` and Schrödinger bridge finds no second owner: ManifoldOptimization consumes 13.8, IncompressibleFlows is not cited, and the other Monge–Ampère hits are the complex equation.

**Seeded sample, locators read at the text (15 targets).**

| Target | Locator in the README | Result |
|---|---|---|
| 2.1 | none | Tau Ceti proves it at both pins, uncited (R02); Checks hold |
| 2.5 | authors only | R03; statements read in arXiv:0807.1468v1 and arXiv:0911.4347v2 |
| 5.5 | Brenier 1991; Villani 2003 Thm 2.12; Tau Ceti | Tau Ceti statement matches; books not verifiable; Ambrosio–Gigli Thm 1.26 agrees (line 896) |
| 5.7 | none | R04 |
| 5.8 | Gangbo–McCann Thm 1.2 | statement and Lean hypotheses match (H1)–(H3); Tau Ceti partial results uncited (R02) |
| 6.5 | Tau Ceti | `mongeAmpereMeasure_eq_of_hasLaw` as recorded; three Checks hold |
| 7.3 | McCann Thms 8, 9, pp. 12–13; Ambrosio–Gigli Thm 1.33, p. 19 | numbers and pages correct (`mccann-polar` lines 456, 489; guide line 1065); both compact (R05) |
| 9.3 | none | R07; Checks hold |
| 10.4 | Ambrosio–Gigli §3.2.2, pp. 55–57: Def 3.7, Thm 3.9, Def 3.11, Cor 3.12 | correct (lines 2891, 2921, 2958, 2979) |
| 11.4 | none | R06 |
| 11.6 | Ambrosio–Gigli Assumption 3.24, Thm 3.25, p. 64; Def 3.29, (3.43), pp. 70–71 | correct (lines 3340, 3358, 3667, 3679); `λ = 2` for `W₂(μ,·)²` agrees with the Conventions |
| 12.7 | Agueh–Carlier Prop 2.3, Def 3.2, Prop 3.5, Thm 5.1, Rem 5.2 | correct (HAL `hal-00637399` lines 394, 617–619, 650, 1018–1022, 1108); exponent `λ₁^{-d}` as stated |
| 13.9 | Peyré–Cuturi Thm 4.1, p. 70; Thm 4.2, p. 71 | correct (`peyre-cuturi` lines 3092, 3133; printed page = PDF page − 4); `(√η−1)/(√η+1) = tanh(Δ/4)` |
| 14.6 | Lott–Villani Def 0.10, Thm 0.12, p. 4; Thm 7.3, p. 41; Sturm | Lott–Villani correct (`lott-villani` lines 160, 2103); Sturm unnumbered (R07) |
| 16.2 | not a theorem | no mathematical claim to locate |

**Other locators read (24).**
- Nutz: Example 5.1 p. 41, Cor 5.4 p. 43, Thm 5.5 p. 44, Lemma 5.7 and Prop 5.9 p. 46, Thm 5.10 p. 47, §6 p. 51, Lemma 6.4 p. 55, Prop 6.5 and Cor 6.6 p. 56, Thm 6.15 p. 62 (`nutz-eot` lines 1694, 1791, 1831, 1917, 1936, 1954, 2123, 2282, 2327, 2347, 2579).
- Ambrosio–Gigli: Thm 1.5 p. 5, Lemma 2.1 and Thm 2.2 p. 25, Thm 2.10 p. 31, Prop 2.30 p. 45.
- Peyré–Cuturi Prop 2.3, p. 21 (line 952).
- AGS arXiv:1109.0222v2: Thm 5.1 p. 40, Thm 6.2 p. 45, Thms 6.10, 6.11, 6.18, 6.20, pp. 50–57 (`ags-rcd` lines 2065, 2314, 2530, 2584, 2873, 2896).
- Gigli–Mondino–Savaré: Thm 5.7 p. 39, Thm 7.2 p. 54, Thm 7.7 p. 57 (`gms-convergence` lines 1924, 2760, 2927).
- McCann Cor 10 and Thm 11, pp. 14–15; BMNN Thm 29, p. 26 (`bmnn-zgw` line 1155).

**Adversarial table.**

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| H1 Gangbo–McCann | `d = 0`; `r < 0` in `h_cone`; `d = 1`, `h = x²/2`, `U[0,1] → U[1,2]` | point space: `cobounded = ⊥`, `T = id`; cone is empty; `T = x+1`, cost `1/2` | holds |
| H2 Caffarelli | `X = (0,1)`, `Y = (0,2)`, `l = 1/2`; `l > 1` | `T = 2x`, `C = 2`, `α = 1`; `l ≤ f ≤ 1/l` unsatisfiable | holds |
| H3 De Philippis–Figalli | `c ≡ 0`; `c = 2 - ⟨x,y⟩` on unit balls | `-Dₓc = 0`, not injective; `-Dₓc = y`, `D_yDₓc = -id` | twist excludes `c ≡ 0`; matches Thm 1.3 |
| H4 McCann | `dim E = 0`; `ℝ`, `U[0,1] → U[1,2]` | one point, `T = id`; `T = x+1`, cost `1/2`, unique | holds |
| H5 Figalli | `U[0,1] → U[1,2]`, `c = \|x-y\|` | `x+1` and `2-x` both cost `1` | existence only, as stated |
| H6 Agueh–Carlier | `ι` empty; `n = 0`; `n = 1`, Cantor law | `∑ w = 0 ≠ 1`; `hsmall` gives `μ j univ = 0`; null on dimension-`0` sets | holds; `n = 0` vacuous (R08) |
| H7 Gaussian | `n = 1`, `C = (1,4)`, `w = (1/2,1/2)`; `n = 0` | `√S = (1+2)/2`, `S = 9/4`; empty matrices | holds |
| H8 Schrödinger potentials | `μ = ν = (δ₀+δ₁)/2`, `R = μ⊗ν` | `dπ/dR = 1`, pairs `(a,-a)` | holds |
| 2.1 Checks | `δ₀`, `(δ₀+δ₁)/2`, `\|x-y\|`; `δ₀`, `δ₂`, `(x-y)²`; reversed constraint | value `0 + 1/2 = 1/2`; `4 = 4`; `20 > 4` | hold |
| 2.5 (R03) | BLS Example 1.1; `δ₀`, `δ₀`, `c ≡ 5` | `P = 1`, `D = 0`, `P^rel = 0`; `P^ε = 5(1-ε) → 5` | repair consistent |
| 5.7 (R04) | `n = 1` | `c - c` hypersurfaces are points; regular = atomless | stated hypothesis sufficient, not exact |
| 6.5 Checks | `u = x²`, `g = 1/2` on `[0,2]`; `u = \|x\|` | `∫_{2E} 1/2 = \|E\|`; `MA({0}) = \|[-1,1]\| = 2` | hold |
| 7.3 (R05) | compact vs noncompact `M` | cited theorems assume compactness | locator gap |
| 9.3 Checks | `δ_{2t}`, `V = x²/2`; `W = x²` | `2t² = 2t - 2t(1-t)`; without `1/2`: `2t² ≤ 4t²-2t` fails at `t = 1/2`; interaction energy `0`, `W₂² = 4` | hold |
| 10.4 Checks | `Φ = ‖x‖²/2`; `Φ = \|x\|` | `y + (y-x)/τ = 0`, `y = x/(1+τ)`; `y = x - τ sign x` for `\|x\| > τ` | hold |
| 11.4 Checks | `V = x²/2` at `δ_a`; Gaussian; constant energy on the disc | `‖x‖_{L²(δ_a)} = \|a\|`; `∇log ρ = -x`; rotation field pairs to `0` | third Check false for the Fréchet notion (R06) |
| 11.6 Checks | `∫x²/2`; `∫gx`; `Φ ≡ 0` from `δ_a` | `a/(1+τ)`; `a - τg`; `a` | hold |
| 12.7 | Thm 5.1 exponent; `n = 0` | `λ₁^{-d}`; README non-vacuous, Lean vacuous | holds; R08 |
| 13.5 (repaired) | off-diagonal `0/1` cost; `\|x-y\|`; two-point marginals | `C₀ = 0`, `C_ε = 1`; `C_ε → 0`; `π₀₀ = 1/(2(1+e^{-1/ε}))`, entropy `log 2` | holds |
| 13.9 Checks | `[[2,1],[1,2]]`; `[[1,2],[3,6]]`; a zero entry | `η = 4`, `tanh(log 4/4) = 1/3`; `Δ = 0`; `Δ = ∞`, factor `1` | hold |
| 14.6 | weighted `ℝ`, `V = x²/2`, `N > 1` | `Ric + Hess V = 1`; `1 - x²/(N-1) < 0` for large `\|x\|` | holds |
| 5.9 Checks | `P` uniform, `v = x`; `1_{(1/2,1)}`; `P = 2x dx`, `v = x^{-1/2}`, `p = 1` | `(1/(p+1)+1)^{1/p}`; derivative `δ_{1/2}`; `4/3 + 2 = 10/3`, `∫\|v'\| dx = ∞` | hold |
| 8.8 Checks | `T = x+w`; `(δ₀+δ₂)/2`, `T ≡ 1`; `T = 2x` on `U[0,1]` | `v ≡ w`; `v_{1/2} = ±1`, `v₁(1) = 0`; `v_t(y) = y/(1+t)`, action `1/3 = W₂²` | hold |
| 8.9 Checks | circle, `δ_{tθ}`; `δ₀ → δ_{3π/2}` | `φ(1,θ) - φ(0,0) = 0`; `(3π/2)²` vs `(π/2)²` | hold |
| 16.2 / Layer 16 Examples | `δ₀`, `δ₂`, `(x-y)²`; `(δ₀+δ₂)/2` | cost `4`, `W₂ = 2`; barycenter `1`, radius `1` | hold |
| R01 scan | 136 names, 57 paths | `a91d3aa`: 60 names, 25 paths; `2fd255d`: 136, 57 | pin lag |

## Not verifiable

- **Villani 2009** (2.4 Theorem 5.10; 7.7 and the McCann docstring, "Chapter 10, Theorem 10.35") and **Villani 2003** (5.5 Theorem 2.12): paywalled, not in the sources cache.
- **Figalli–Gigli 2011** (proposed in R05): the sources service found no legal copy (the publisher's page returned HTTP 403).
- **Sturm 2006, Parts I and II** (14.6): the service resolves both only to a paywalled publisher.
- **Brenier 1991** and **Gangbo–McCann 1996** beyond Theorem 1.2: not re-read this round.
- **Ambrosio–Gigli–Savaré 2008, Kechris, Huang**: settled as uncertified, cited by locator only.
- **Elaboration at main's pin** was not run: the object files of the imported Tau Ceti modules are missing in the lake directory of that pin, and this review may run Lean only from the pull-request worktree.
- **Ownership against open pull requests** was checked by object grep and `overlaps.md`; the five closest open roadmaps were read only at their matching lines.

## Source issues

- none
