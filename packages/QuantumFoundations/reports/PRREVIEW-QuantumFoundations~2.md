# Review of QuantumFoundations (pull request #1771 at d682450)

**Verdict:** needs changes

Files reviewed: `TauCetiRoadmap/QuantumFoundations/README.md` (1121 lines), `Suggested.lean` (154 lines) and the four companion files `CharacterRegularityTargets.lean`, `RadialHamiltonianTargets.lean`, `SelectedStateExamples.lean`, `SpinHamiltonianTargets.lean` (unchanged since d390951). The pull request changes nothing outside the folder (`git diff --stat origin/main...HEAD` excluding the folder is empty). The worker's gate at this head passes every check (`build=0`, `depcheck=0`, `stray-files=0`, `outside-folder=0`); `lake env lean` on `Suggested.lean` gives 8 `declaration uses sorry` warnings and no error. This is a full review of the repaired head: the repair status of the twelve previous findings comes first, then the findings of this round.

## Repair status of the previous review (r1 at d390951)

- R01 (RQFT cycle): repaired. The README names RelativisticQuantumFieldTheory only as a consumer (Scope line 27, Downstream consumers line 1093) and §9.9 states the `S_t` family without the Shale inequivalence ("it is not stated here", line 1070). RQFT's README at d5f595e still cites this roadmap (one direction).
- R02 (NQS re-plan): repaired. Wigner, Polish structure, Pettis, Borel characters, the twisted cocycle law, `H²_lc`, Whitehead, position/momentum and permutation sectors are consumed from NoncompactQuantumSymmetry P.1–P.6 (supplier table line 65; §4.3, §6.2, §7.1–7.2, §8.1), all of which exist at 777a2fe (P.1 line 170, P.2 line 240, P.5 line 514, P.6 line 543). `rayTransitionProbability` is gone from `Suggested.lean`. One residue in the companion files (R02 below).
- R03 (house form): repaired. Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 0–9 with `### k.n` subsections, `*Needs:*` lines (69 of them), `**Checks.**` lists (three per subsection), Examples and Dependencies per layer, Downstream consumers, References. The dependency check now reads 14 edges from this README (`1662` against `1648` before).
- R04 (Lean catalogue): repaired. Twelve declarations: two definitions and two theorems for §0.1, the two Kakutani–Mackey theorems, `FinitePOVM` with finite Naimark dilation, `IsOrthogonal` with Uhlhorn, `kummerM` with two Kummer equations; namespace `TauCetiRoadmap.QuantumFoundations`; the docstring names what is not statable (partly: see R06).
- R05 (imports): repaired for `Suggested.lean` (`module`, `public import Mathlib`), not for the companions (R02 below).
- R06 (companion files): not repaired. The four files are byte-identical to d390951 (`git diff --quiet d390951 HEAD -- <file>` succeeds for each) and the README no longer mentions them (grep for their names: 0). See R02.
- R07 (blob links, pull-request numbers, VariationalMethods V2.3): repaired (grep `github.com`, `#NNNN`, `VariationalMethods`: 0 each).
- R08 (TeX, anchors): repaired (gate `tex=0`, `latex=0`, `residue=0`).
- R09 (padding): repaired; none of the listed declarations remains.
- R10 (process narrative): repaired as far as the transcript commentary goes (grep `transcript`, `Luna`, `Dooley`, `Grundling`, `faint`: 0); a different kind of process vocabulary has replaced it (R04 below).
- R11 (references): repaired. Pulmannová 1978 has an entry and a legal source (DML-CZ); Gudder–Boyce, the three Alfsen–Shultz works, Iochum–Shultz, Connes and DLMF have entries; Tau Ceti is credited for its spectral theorem (§3.3).
- R12 (unused hypotheses): repaired (`hb` dropped; the lift structure is gone).

## R01 (P2) — §3.2 claims an arbitrary full countably convex state family is all the normal states

Location: README line 438 ("Prove, for the Hilbert model of §1.2 on such H, that the full family J of Principle III consists exactly of the normal states") and the bullet at line 440 ("Principle III's state family is the normal states").

Claim: for separable `H` with `dim H ≥ 3`, the family `J` of §1.2 (any nonempty, full, countably convex family of countably additive probabilities on `P(H)`) equals the set of normal states.

Witness: on `B(ℂ³)` let `J` be the faithful normal states (densities with trivial kernel). It is countably convex: a countable mixture `Σt_iρ_i` with `t_i ≥ 0`, `Σt_i = 1` has some `t_i > 0` and `t_iρ_i ≤ ρ`, so `ρ` is faithful. It is full: for projections `a ≰ b` choose a unit `ψ ∈ ran a` with `‖bψ‖ < 1` and put `ρ_ε = (1−ε)|ψ⟩⟨ψ| + ε·1/3`, which is faithful and has `Tr(ρ_ε(a−b)) = (1−ε)(1−‖bψ‖²) + ε(Tr a − Tr b)/3 > 0` for `ε` small. It contains no vector state, so `J ≠` normal states, although every element of `J` is a density operator. The inclusion `J ⊆` normal states is what V12.J.Scalar gives; equality needs `J` to be all countably additive probabilities.

Repair: state "every member of `J` is a normal state, hence a density operator with `m(V) = Tr(ρP_V)`; when `J` is the full set of countably additive probabilities on `P(H)`, `J` is exactly the normal-state family", and reword the bullet accordingly. Add the faithful-state family as a Check that `J` can be a proper full subfamily (the half-ball of Bloch vectors of radius `1/2` is the dimension-two analogue).

## R02 (P2) — The four companion files are unchanged, orphaned and outside the Lean form

Location: `CharacterRegularityTargets.lean` lines 1–2, 11, 17–18, 21–49; `RadialHamiltonianTargets.lean` lines 1, 7, 16–29; `SelectedStateExamples.lean` lines 1–9, 32–44; `SpinHamiltonianTargets.lean` lines 1–4, 9, 33–50.

Claim (each docstring): "representative", "suggested" signatures for `QF5.CharacterRegularity`, `QF6a.RadialHamiltonians`, `QF1.S.QuestionFullnessExample`, `QF6b.SpinHamiltonians`.

Witness: none of these labels exists in the README at this head (grep `QF[0-9]`: 0), and the README names none of the four files or their declarations, so the rule "every Lean name appears in the README" fails for all 13 declarations. The form rules of the brief apply to every listed `.lean` file: three files import `Mathlib.<submodule>` lines (`SelectedStateExamples.lean` five of them, `SpinHamiltonianTargets.lean` four, `RadialHamiltonianTargets.lean` one), all four use `noncomputable section`, one has two `local instance` lines, the namespaces are `QuantumFoundations.*`, and the docstrings carry process text ("future proof targets", "not exhaustive"). `exists_hamel_map`, `hamelCharacter_irregular` and `measurable_character_classification` are the Borel-character and Hamel-basis objects of NoncompactQuantumSymmetry P.2 (its README line 310: "Every Borel character of ℝ is `t↦exp(ict)`; a Hamel-basis additive map …"), which the README now defers (line 22); `not_order_determining` and `norm_and_square_gap` compute `state (1/4) x = 1/2` and `‖x‖ = 1`, the §1.5 Checks; `axis_isHermitian`, `projection_laws`, `symbol_decomposition` are the §9.1 Checks on `n·σ`. Previous finding R06, repeated.

Repair: delete the four files. Their content is already in the README as Checks (§1.5 Check 3, §9.1 Checks 1–3, §7.3) or belongs to NQS P.2. If `exists_radial_symbol` (an O(n)-invariant bounded measurable symbol on `ℝⁿ` is a.e. a function of `|ξ|²`) is wanted as a tested statement, it is statable at the pins and goes into `Suggested.lean` under Layer 8 with its README sentence (§8.3's measurable descent); otherwise it stays a README target.

## R03 (P3) — §2.1 Check 2 is false: every effect of `M₂(ℂ)` is a mixture of projections

Location: README line 373 ("every effect `(e₁,e₂)` with `0 ≤ eᵢ ≤ 1` is a mixture of projections, which fails in `M₂(ℂ)`").

Witness: an effect `E` of `M₂(ℂ)` has eigenvalues `0 ≤ λ₁ ≤ λ₂ ≤ 1` with spectral projection `P₂` for `λ₂`, and `E = λ₁·1 + (λ₂−λ₁)P₂ + (1−λ₂)·0` is a convex combination of the projections `1`, `P₂`, `0`; for `E = (1/2)(1 + (1/2)σ_x)` of Check 1, `E = (1/4)·1 + (1/2)·(1+σ_x)/2 + (1/4)·0`. The layer-cake argument works for every self-adjoint operator with finite spectrum in `[0,1]`.

Repair: replace the clause by the statement that is true and quantum: the trine POVM of §2.2 is not a convex combination of PVMs, since a PVM component below the rank-one effect `(2/3)|v_k⟩⟨v_k|` is `0` or `|v_k⟩⟨v_k|`, and no two of `v₁,v₂,v₃` are orthogonal (`|⟨v_j,v_k⟩| = 1/2`).

## R04 (P3) — Locators: Teschl edition, Gehér Theorem 3, V12.J.Bloch, cache line numbers and manifest vocabulary

Location: README line 1119 (References: "second edition"), lines 496, 512, 885, 958, 974, 1006 (Teschl theorem numbers and "TESCHL line N"); line 812 ("in dimension two the conclusion fails, Gehér 2017, Theorem 3, GEHER line 219"); lines 438, 449, 539, 598, 812 ("V12.J.Bloch's frame function", "V12.J.Bloch for the dimension-two counterexample"); 14 "<id> line N" locators (lines 101, 280, 298, 302, 496, 512, 634, 755, 812, 885, 932, 958, 974, 990, 1006); "Uncertified" (16), "Source id" (8), "cited by locator" (13), line 29 ("Ownership was checked … whose files were available").

Witness: the theorem numbers 5.1, 5.2, 7.8, 7.9, 8.1, 8.2, 8.4, 8.5, 10.2, 10.3, 10.7, 10.8, 10.9 and the line numbers 5183, 5232, 7095, 7098, 7130, 7363, 7377, 7394, 7512, 7558, 9578, 9604, 9631, 9782, 9913, 9918 are those of the first edition (author's `schroe.pdf`, cache 8dc8de0b, where each line is exactly the cited theorem); in the second edition (`schroe2.pdf`, cache ee2cfd1c) Stone's theorem is 5.3 (line 6322), the free Schrödinger operator 7.17 (8578), the `C_c^∞` core 7.19 (8633), the `L²` spectrum 10.8 (11445), the radial domain 10.9 (11575) and the uncertainty principle keeps the number 8.2 (8996). Gehér's Theorem 3 (cache 1388deed lines 219–230) concerns bijections of `P(ℂ²)` preserving a fixed angle `α ∈ (0,π/2)` and concludes a Wigner symmetry (or `[Uv]` versus `[Uv]⊥` at `α = π/4`); it does not state the dimension-two failure for orthogonality, which is the trivial remark the README's own Check 1 of §7.1 makes. The sgn frame function `f(n) = 1/2 + (1/4)sgn(n₃)` is stated under V12.J.Frame (VonNeumannAlgebras at dee8088, line 3527), while V12.J.Bloch (line 3604) is the antipodal orthoautomorphism `(x,y,z) ↦ (x,y,2z)/‖·‖` and its non-Born pullback. The "line N" numbers are positions in a worker's local text extraction (they match that extraction for Pulmannová, Pankov, Connes, Iochum–Loupias, Hairer, DLMF and Gehér, and a different extraction for Teschl), which no reader of the README has; "Uncertified", "Source id" and "cited by locator" are manifest statuses, and line 29 narrates the review process.

Repair: cite Teschl by the edition whose numbers are used (first edition, AMS GSM 99, 2009, author's version) or renumber to the second; for the dimension-two failure cite no theorem (the Check is the witness) or Gehér's introduction; cite V12.J.Frame for the sgn frame function and V12.J.Bloch for the antipodal map; delete every "<id> line N", "Source id", "Uncertified" and "cited by locator" (the References list carries the bibliographic data; the manifest carries the status) and the sentence at line 29.

## R05 (P3) — Supplier conventions and overlaps: NQS P.5's Fourier transform, NQS M1's section comparison, BanachSpaceTheory B5's measure class

Location: README lines 37, 870 ("Consume NoncompactQuantumSymmetry P.5 for position `Q_j`, momentum `P_j`, the Fourier transform and the Schwartz core on `L²(ℝ³)`, in this roadmap's `2π` convention"), 885 (spectral measure `dμ_ψ(λ) = ½λ^(n/2−1)(∫|ψ̂(√λω)|²dω)dλ`), 828 ("its image consists exactly of the classes whose extension admits a global continuous section"), 74 and 901 ("BanachSpaceTheory B5's σ-finite `L¹/L^∞` duality").

Witness: NQS P.5 (777a2fe line 514–528) defines `F_ℏψ(p) = (2πℏ)^(−3/2)∫exp(−ip·x/ℏ)ψ(x)dx` and proves `F_ℏP_jF_ℏ⁻¹ = ` multiplication by `p_j`; this roadmap's transform is Mathlib's `Lp.fourierTransformₗᵢ` with multiplier `2πξ_j`. The operators `Q_j`, `P_j` and the Schwartz core agree (with ℏ = 1), the transforms differ by the dilation `F_1ψ(p) = (2π)^(−n/2)(Fψ)(p/2π)`, which no section owns. The displayed spectral measure of §8.2 is Teschl's formula for `H₀ = −Δ` with his `(2π)^(−n/2)e^(−ipx)` transform; in Mathlib's convention the substitution `ξ = √λ ω/(2π)` gives `dμ_ψ(λ) = ½(2π)^(−n)λ^(n/2−1)(∫|ψ̂(√λω/(2π))|²dω)dλ`. NQS M1 (line 1285–1288) already states "A global continuous section exists exactly when this principal circle bundle is trivial; prove the section/trivialization comparison", which is the image statement of §7.2 in bundle language. BanachSpaceTheory B5 (main, line 255–257, 336) opens with "This milestone uses Banach spaces and finite measure spaces" and constructs `(L¹(μ))* ≃ L∞(μ)` there; §8.3 applies it to Lebesgue measure on `ℝⁿ`.

Repair: own the dilation adapter in §8.1 (one sentence and a Check on the Gaussian `e^(−π|x|²)`, fixed by Mathlib's transform, against NQS's `F_1`-fixed `π^(−3/4)e^(−|x|²/2)`); write §8.2's measure in the roadmap's convention or attribute the display to Teschl's; cite NQS M1's section/trivialization comparison in §7.2 and keep only the cohomological restatement; either confirm that B5's duality is stated for σ-finite `μ` or own the σ-finite extension by exhaustion in §8.3.

## R06 (P3) — The module docstring omits a headline, and the two Kummer statements are one theorem

Location: `Suggested.lean` lines 11–26; lines 140–150.

Witness: the Summary (README line 3) lists among the end theorems "the repeatability characterization of sharp instruments (Layer 2)" (§2.3, Ozawa's theorem); it is not statable at the pins (normal instruments on the trace class are an OperatorIdeals Part B object) and the docstring does not say so. `kummerM a b z = Γ(b)·regularizedHGFun {a} {b} z`, so `kummerM_differential_equation` is `regularizedHGFun_kummer_equation` multiplied by the constant `Γ(b)` (the probe `simp only [kummerM, deriv_const_mul_field']; linear_combination Γ(b) * …` does not close it only because `deriv` is applied to the unexpanded function, so it is not one-tactic padding, but it tests nothing the other does not).

Repair: add the repeatability theorem (with what it lacks) to the docstring; keep one of the two Kummer equations (the regularized one covers every `b`).

## Verified sound

Gate and build. The worker's gate at d682450 passes every check. `lake env lean TauCetiRoadmap/QuantumFoundations/Suggested.lean` from the worktree: 8 `declaration uses sorry` warnings (lines 50, 59, 71, 83, 104, 121, 140, 147), no error. A scratch copy with `#check @` for all 12 declarations elaborated once: every type agrees with the worker's `signatures.md` and with the README (rank hypotheses `3 ≤ Module.rank` for §0.1, §0.3, §7.1 and `2 ≤` for the scalar uniqueness; `¬ FiniteDimensional ℂ B` for the complex Kakutani–Mackey theorem; `CompleteSpace` carried explicitly in the three Banach/Hilbert theorems); no declaration lost a section binder. Dependency check output: `depcheck: 205 roadmaps, 1662 edges, 0 problem(s)` (no `moved:`, `UPWARD` or `CYCLE` line); this roadmap is at line 198 of the merge order, after VonNeumannAlgebras (5), HilbertModules (11), MetaplecticAutomorphicForms (136), NoncompactQuantumSymmetry (141) and CompactQuantumMetricSpaces (197); CStarAlgebras (#860), UnboundedOperators (#1027) and LaguerreJacobi (#117) are open pull requests adding new folders that the order does not list yet (placed after their last supplier; not a finding). Padding probe on the scratch copy: `simp` closes none of `naimark_dilation_finite`, `regularizedHGFun_kummer_equation` (unfolds to the power-series sum and stops) or the Kummer equation for `kummerM`; no declaration restates a definition or mirrors a Check (the `FinitePOVM` and `IsOrthogonal` definitions have real bodies on native carriers).

Library declarations opened at the pins (Mathlib f6090c7, Tau Ceti 358314d; file and line): `Projectivization.map` (`LinearAlgebra/Projectivization/Basic.lean` 193, semilinear over `σ : K →+* L` with injectivity), `ClosedSubmodule` (`Topology/Algebra/Module/ClosedSubmodule.lean` 36), `InnerProductSpace.toDual` (`Analysis/InnerProductSpace/Dual.lean` 136, conjugate-linear isometry), `IsHilbertSum` (`Analysis/InnerProductSpace/l2Space.lean` 266), `Complex.regularizedHGFun` (`Analysis/SpecialFunctions/RegularizedHypergeometric.lean` 172, on `Multiset ℂ` parameters, with `regularizedHGFunCoeff_add_one` 92 under `∀ k ∈ b, k ≠ −n` and `radius_regularizedHGFunSeries_eq_top` 229 under `a.card ≤ b.card`; the file contains no derivative or differential-equation lemma, so the Kummer equation is not a Mathlib duplicate), `Complex.Gamma_neg_nat_eq_zero` (`Gamma/Basic.lean` 344), `MeasureTheory.resolventTransform` (`Measure/ResolventTransform.lean` 108), `ContinuousLinearMap.finite_dimensional_eigenspace` (`Analysis/InnerProductSpace/Spectrum.lean` 461, `IsCompactOperator T`, `μ ≠ 0`), `IsCommJordan` (`Algebra/Jordan/Basic.lean` 90), `Circle.toUnits` (`Analysis/Complex/Circle.lean` 103), `Lp.compMeasurePreserving` (`LpSpace/Basic.lean` 595), `Lp.fourierTransformₗᵢ` (`Analysis/Fourier/LpSpace.lean`), `Measure.ext_of_charFun` (`CharacteristicFunction/Basic.lean` 257, `[CompleteSpace E]` as the README says), `ProbabilityTheory.IsGaussian` (`Gaussian/Basic.lean` 45), `Polynomial.hermite` (`RingTheory/Polynomial/Hermite/Basic.lean` 48), `Matrix.specialUnitaryGroup` (`LinearAlgebra/UnitaryGroup.lean` 247); Tau Ceti `exists_hilbertBasis_forall_hasEigenvector` (`Analysis/InnerProductSpace/Spectrum.lean` 119, `IsCompactOperator`, symmetric, no separability) and `hasSum_smul_repr_of_apply_eq_smul` (same file), `gaussianHermiteHilbertBasis`, `gaussianHermitePiBasis`, `hermiteFunction` (`Hermite/Function/Basic.lean` 38: `He_n(x√2)e^(−x²/2)/√(n!√π)`, which is the README's `h_n` since `H_n(x) = 2^(n/2)He_n(√2x)`), `hermiteFunction_oscillator`, `hermiteHilbertBasis`, `hasSum_hermiteFunctionLp_expansion`, `IsClassicalSolution`, `IsMildSolution`, `isClassicalSolution_realOperator`, `isMildSolution_realOperator`, `IsClassicalSolution.eq_realOperator` (`CauchyProblem/Uniqueness.lean` 70), `IsClassicalSolution.unique` (80), `existsUnique_eq_expUnitHom_complex`. Grep of Mathlib and Tau Ceti for `Naimark` (only Gelfand–Naimark–Segal), `Uhlhorn`, `Kakutani` (only Riesz–Markov–Kakutani), `collineation`, `PreservesLines`, `POVM`: no owner of the §0.1, §0.2–0.3, §2.2 or §7.1 objects.

Cross-roadmap citations resolved at the heads named in the brief. NoncompactQuantumSymmetry (777a2fe): P.1 (line 170), P.2 (240, Pettis, Borel characters at 310), P.5 (514), P.6 (543), Layers M0–M6 (585–8944), `M4.SpatialLocalization` (2348), `M5.AffineG5` (5889); it cites this roadmap nowhere. VonNeumannAlgebras (dee8088): V12.J.Maps (3477), V12.J.Frame (3511, finite Gleason with the dimension-two sgn function), V12.J.Scalar (3545, the Mackey–Gleason–Bunce–Wright theorem with "countable additivity suffices for σ-finite M; do not identify these notions on arbitrary M", as the README uses), V12.J.Dye (3571), V12.J.Bloch (3604, antipodal map), V12.J.Enriched (3625), V12.J.CentralSplitting (3650), V2.NonmodularProjectionLattice (871), V2.BorelCalculus (219), V4.Core/PositivePredual/Normality (244), V4.0.Decomposition (258), V5.LatticeFinite (1446), V6.LatticeTypes (1595), V8 (1950–2103), V10.ClosedOperators (39), V10.Affiliation (2305), V10.ModularTheory (2364), V11 (3159–3203), V13 (Layer 13, 3688), the incomplete tensor product (2456); these labels resolve at #889 only (#1041 at d9e53b3 carries V0–V4 and no V12.J), and the README cites by name and section, not by pull request, as required. SelfAdjointSpectralTheory on main (`OperatorTheory/SelfAdjointSpectralTheory`): SA-B01 (274), B31 (363), B35 (376), B37 (391), B39 (399), B72 (565), B80 (598), E01 (1202), E05 (1211), E13 (1230), E26 (1260), E28 (1264), E29–E30 (1266–1267), E44 (1316), E45 (1319), E46 (1322), E47 (1324); Stone convention `U(t) = exp(itA)` (206) matches the README's. UnboundedOperators (#1027 at e626430): UO-A01 (95), A04 (127), A07 (157), A08 (175), B03 (256), B04 (295), C02 (349), C03 (367), D06 (512), D07 (611: `−u″ + (ν²−¼)u/r² − bu/r`, limit circle at 0 for `0 ≤ ν < 1`, so `ν = ℓ+½`, `b = −2μα` as in §9.5), E01 (668), E03 (716), E05 (787), E06 (793), F02 (833), F03 (845); `R_A(z) = (z−A)⁻¹` (15), which §9.5's sign adapter addresses. OperatorIdeals on main: OI-A29 (181), OI-B29 (349), OI-B30 (350), Part B (282). OperatorAlgebraDynamics on main: D1 (75), D3 (205), D8 (554) with `W(f)W(g) = exp(−iσ(f,g)/2)W(f+g)` (583), `‖W(f)−1‖ = 2` (590), `ω₀(W(f)) = exp(−‖f‖²/4)` (595), `σ(f,g) = Im⟨f,g⟩` (593): the README's Conventions and §6.4–6.6 use the same signs. CStarAlgebras (#860 at 1d4e2ed): C2 (263), C4 (497, Stinespring), C5 (546). HilbertModules (#861): H3 (259), H6 (692, deficiency spaces 739–746). MetaplecticAutomorphicForms (via `roadmaps show`): §1.2 "Unitary Stone–von Neumann theorem" (357), Layer 0 Schrödinger models (76). RandomMatrices on main §3.1 (485–498: Stieltjes inversion with half-atom endpoint terms, `μ{a} = lim η Im m(a+iη)`, built on `MeasureTheory.resolventTransform`). RiemannianGeometry on main: R7.1–R7.8 (1303), R8.1 (1406), R8.2 (1420). SpinGeometry G1.3 (107, scalar trace at 204). SpinRepresentations on main Layer 7 (881, real Clifford algebras and Bott periodicity). CompactGroups Layers 1–5 (226–318), LieHighestWeight Layers 2, 4, 5 (370, 537, 567), LieGroups Layers 2, 3, 5 (275, 300, 358), PDE Lane A (82), BanachSpaceTheory B5 (255), CompactQuantumMetricSpaces (#1155 at 25e9712) 1.4 (534), 3.3 (825), 3.6 (905), Completed/OrthogonalL2Bases A3′, B3, Part D, LaguerreJacobi (#117) A1–A4, B1–B4 with the weighted norm `Γ(n+α+1)/n!` (316). The worker's citation check lists four Lean-name leads (`SpatialLocalization`, `AffineG5`, `BorelCalculus`, `NonmodularProjectionLattice`): all four are section labels of NQS and VNA, found at the lines above; they are not claims about `Suggested.lean`.

Sources read at the locator (cache ids are the sources service's content hashes). Pulmannová 1978 (DML-CZ, 79007bd7): the Definition of an imbedding with clauses (i)–(iii) at line 136; Theorem 1 (the function set `L₁` with conditions (i)–(iv)) at 159; Theorem 2 (condition (a) = (CA), with the supremum remark at 192) at 179; Theorem 3 ((a) ⇔ (β) ∧ (γ)) at 198; Theorem 4 ((β) ⇔ (δ) for the product `½((a+b)²−a²−b²)`) at 235; Theorem 5 (distributive systems: `a∘b = a∧b` iff compatible, then `a∨b = a+b−a∘b`) at 262; the paper's statement of Segal's postulates (lines 98–107) matches §1.5's list, including `‖u²−v²‖ ≤ max(‖u‖²,‖v‖²)`. Pankov (175769b0): Theorem 3.16 at 319 with exactly the three conditions and the infinite-dimensional complex hypothesis of §0.2, and the annihilator route (337–340). Connes 1974 (95bd73d2): Théorème 1.3 (152), 5.2 (969), 5.8 (1148, "genre dénombrable" = countable genus). Iochum–Loupias (dba8b513): Propositions I.4 (133), I.5 (149), Theorem V.1 (473), Corollary V.3 (492). Gehér (1388deed): Uhlhorn's two-sided hypothesis (104–108) and Theorem 4 (233–238, `3 ≤ dim H`). Hairer (0907.4178v2, d4309b35): Proposition 4.17 at 1133 (trace-class covariance, `∫‖x‖²dμ = tr Ĉ_μ`, and the converse). DLMF 13.2 (3dd9f9b0): 13.2.5 (288, `𝐌(a,−n,z) = (a)_(n+1)z^(n+1)/(n+1)!·M(a+n+1,n+2,z)`, the §9.4 singular-parameter data), 13.2.9–13.2.11 (456–557), 13.2.34 (1336), 13.2.41 (1596); 13.3 (e516cd7f): 13.3.7 at 233; 13.6 (d370f39b): 13.6.19 at 815 (`U(−n,α+1,z) = (−1)ⁿ(α+1)_nM(−n,α+1,z) = (−1)ⁿn!L_n^(α)(z)`, equivalent to §9.4's comparison); DLMF 33.2 (494cb28c): 33.2.4 (191), 33.2.6 (282), 33.2.8 (374), 33.2.9 (410), 33.2.10 (448), 33.2.11 (494), 33.2.12 (549). Teschl first edition (8dc8de0b): each cited line is the cited theorem (see R04); the attributions themselves are right.

Adversarial table (values computed on each side; the sampled targets, the headlines and every target a finding touches are included):

| Statement | Instances | Computed | Result |
|---|---|---|---|
| §0.1 rank hypothesis (Check 1) | `ℙ ℝ ℝ²`, swap of `e₁`,`e₂` | a linear map fixing the three points `e₁+e₂`, `e₁−e₂`, `e₁+2e₂` of `ℙ¹` is scalar, so fixes `e₁`; the swap is not induced | hypothesis sharp |
| §0.1 scalar uniqueness needs rank 2 | `V = K`, `S = σ`, `S′ = σ′` | both induce the identity of the one-point space with `σ ≠ σ′`; rank ≥ 2 gives `c_v` constant and `σ = σ′` | `2 ≤ rank` right |
| §0.2 finite dimension excluded | `ℂ³`, wild involutive automorphism τ with real-closed fixed field `F` | `Σ τ(x_i)x_i` is a sum of `F`-norms, zero only at `0`: an anisotropic involution not from any inner product | `¬FiniteDimensional` needed |
| §0.2 Check 3 | `J = diag(1,−1,1,…)`, `X⊥ = (JX)ᗮ` | `(JY)ᗮ = J(Yᗮ)` gives `perp(perp X) = J²X = X`; `⟨J(e₁+e₂),e₁+e₂⟩ = 1−1 = 0` | trivial-intersection hypothesis needed |
| §0.2 Example | `J = diag(1,1/2,1/3,…)`, `X = uᗮ` with `u ∉ ran J` | `perp X = J⁻¹(ℂu) = 0`, `perp(perp X) = ℓ² ≠ X` | not involutive, as stated |
| §0.3 Check 1 | `ℝ²` discontinuous fixed-point-free involution of `ℙ¹` | inner-product involutions are `θ ↦ θ+π/2` up to `GL₂`, continuous; the given one is not | dimension two fails |
| §0.3 Check 3 | `x₁y₁+x₂y₂−x₃y₃`, `v = (1,0,1)` | `h(v,v) = 1−1 = 0` | isotropic line |
| §0.3 dimensions 0, 1 | lattices `{0}`, `{0,B}` | involution forced (`B⊥ = 0` by trivial intersection) | unique and realized |
| §0.5 Check 3 | `x^(k) = (1,…,1,0,…)` | `‖x^(k)−x^(l)‖² = \|k−l\|` | topologies differ |
| §1.1 question criterion | `Q = diag(1,0)`, `ρ = I/2`; `Q = 2I` | `p(Q,ρ,{1}) = 1/2 ∉ {0,1}`, `p(Q,ρ,{0,1}) = 1`; `δ₂` is `{0,1}`-valued but `Q² = 4I ≠ Q` | both halves of the Check |
| §1.1 squaring-invariant measures | `F(r) = μ[0,r]` | `F(r) = F(√r)`: for `r<1`, `F(r) = μ[0,1)` (continuity from below); for `r>1`, `F(r) = μ[0,1]` (from above); `μ((−∞,0)) = 0` | support `{0,1}` |
| §1.1 evaluation additivity | `r₀ = q′`, `r_(n+1) = q_n`, `L_E = ⋁{r_k : k∈E}` | `L_ℝ = q′∨q = 1`, `L_({n+1}) = q_n`, (a) on singletons gives `m_α(q) = Σm_α(q_n)` | sound |
| §1.2 Check 2 | two-point Boolean model, `J = {(δ₁+δ₂)/2}` | `m({ω₁}) = m({ω₂}) = 1/2` while `{ω₁} ≰ {ω₂}` | fullness is a real condition |
| §1.3 Check 1 | `{0,a,a′,1}`, `ω(a) = 1/3` | `(ω∘swap)(a) = ω(a′) = 2/3 ≠ 1/3` | only the identity |
| §1.4 `MO_n` automorphisms | `(p,e)(q,f)` at `(i,b)` | `(q,f)`: `(q(i), b+f_i)`; then `(p,e)`: `(pq(i), b+f_i+e_(q(i)))`; order `2ⁿn!`, `8` for `n = 2`; the wrong formula differs at `p = id`, `q = (12)`, `e = (1,0)`, `f = 0`, `i = 1` (`0` versus `1`) | sound |
| §1.4 `MO₂` in `M₂(ℂ)` | `p = diag(1,0)`, `q = ½[[1,1],[1,1]]` | `p∧q = 0`, `p∨q = 1`, `p∧(1−q) = 0`; a normal state with `ω(p) = 1`, `ω(q) = 0` has support `≤ p∧(1−q) = 0` | sublattice yes, states no |
| §1.5 Check 1 | `ℝ²`, sup norm, `m_w` | `‖(1,−1)‖ = 1 = sup_w\|2w−1\|` | sound |
| §1.5 Check 2 | `w ∈ [1/10,1/5]` | `w ≤ 1−w` so `(1,0) ≤_M (0,1)`; at `w = 1`: `1 ≤ 0` false | not order-determining |
| §1.5 Check 3 | `w ∈ [1/4,3/4]` | full on `{0,(1,0),(0,1),1}` (`w ≤ 1−w` fails at `3/4`, the reverse at `1/4`); `m_w(−1,3) = 3−4w ≥ 0`; `sup\|m_w(1,−1)\| = 1/2 < 1`; `m_w((1,−1)²) = 1 ≠ (1/2)²` | sound |
| §1.6 `x∘ₛx = x²` | polynomial law | `(2X)² = 4X²` and `0² = 0` give `¼((2x)² − 0) = x²` | sound |
| §1.6 Check 1 | `U_p`, `p = diag(1,0)` | special product `U_a b = aba`; `U_p[[a,b],[b̄,d]] = diag(a,0)` | compression |
| §1.6 Check 2 | `a = σ_x`, `b = diag(1,0)` | `aba = diag(0,1) ≥ 0` | sound |
| §1.6 Check 3 | `σ_x`, `σ_z` | `(σ_x±σ_z)² = 2·1`, so `x∘ₛy = 0 = x∘ₚy`; `σ_xσ_z = −iσ_y` | sound |
| §1.7 Theorems 1–5 | Pulmannová lines 136–263 | statements agree with the README's (CA), (β), (γ), (δ), compatibility (table above) | sound |
| §1.7 Check 2 | `p_n = Σ_(k≤n)e_ke_k*` | `Tr(ρp_n) → 1`, `‖p_n−1‖ = 1` | (γ) is not norm convergence |
| §1.7 Check 3 | `a = diag(1,0)`, `c = ½[[1,1],[1,1]]` | `a∘c = ¼[[2,1],[1,0]] = ½[[1,½],[½,0]] ≠ 0` | sound |
| §1.8 Checks 1–2 | `T = σ_x`, `ρ = ½[[1,1],[1,1]]`; `a = E₁₂`, `ρ = diag(1,0)` | `Tr(ρT) = 1`; `(a+a*)/2 = σ_x/2`, `(a−a*)/(2i) = σ_y/2`, `φ_ℂ(a) = 0 = Tr(ρa)` | sound |
| §1.9 Check 3 | orthogonal `P_x(E₁)`, `P_x(E₂)` | a projection dominating two orthogonal projections dominates their sum | axiom (5) in `B(H)` |
| §2.1 Check 1 | `ρ = ½(1+r·σ)`, `E_± = (1±σ_z)/2` | `Tr(ρE_±) = (1±r₃)/2`; `E = ½(1+½σ_x)`: `E² = ¼(5/4+σ_x) ≠ E` | sound |
| §2.1 Check 2 | `E = ½(1+½σ_x)` | `E = ¼·1 + ½·(1+σ_x)/2 + ¼·0`: a mixture of projections | **false, R03** |
| §2.1 Check 3 | `E(S) = Σ_(n∈S)e_ne_n*` | `‖E({n})‖ = 1` for all `n`, norm series diverges | WOT additivity only |
| §2.2 trine Check | `E_k = (2/3)\|v_k⟩⟨v_k\|`, angles `2π/3` | `Σ\|v_k⟩⟨v_k\| = (3/2)·1`, `V*V = 1`, `Σ rank E_k = 3` | sound |
| §2.2 `naimark_dilation_finite` degenerate | `n = 0`: `m = 0` works; `outcomes = 0`, `n ≥ 1`: `FinitePOVM` empty (`Σ_∅ = 0 ≠ 1`) | vacuous but not false; `m ≤ n·outcomes` holds for the minimal `m = Σ rank E_i` | sound |
| §2.3 Check 1 | `E₁ = diag(1,½,0)`, `E₂ = diag(0,½,1)` | `I₁∘I₁ = I₁` (`Tr(E₁\|e₁⟩⟨e₁\|) = 1`), `I₂∘I₁ = 0`, `I₁+I₂` trace preserving, `E₁² ≠ E₁` | strong repeatability without sharpness |
| §2.3 Check 2 | `ψ = (e₁+e₂)/√2` | `P({1,2})ρP({1,2}) = ρ`, `P₁ρP₁+P₂ρP₂ = ½·1 ≠ ρ` | set-indexed family not additive |
| §3.1 Check 1 | `p = diag(1,0)`, `q = ½[[1,1],[1,1]]` | `p∧(q∨q′) = p`, `(p∧q)∨(p∧q′) = 0` | nondistributive |
| §3.1 Check 2 | `ψ = Σ2^(−n/2)e_n` | `Σ2^(−n) = 1` | sound |
| §3.2 `J` = normal states | faithful normal states of `B(ℂ³)` | countably convex, full (`ρ_ε` above), no vector state | **false as stated, R01** |
| §3.2 Check 1 | `ρ = diag(1/2,1/3,1/6)` | `1/2+1/3 = 5/6`, `Tr ρ = 1` | sound |
| §3.2 Check 2 | `f(n) = ½+¼sgn(n₃)` | `f(n)+f(−n) = 1`; Born functions are affine in `n` | sound (located at V12.J.Frame, R04) |
| §3.3 Check 2 | `ρ = Σ2^(−n)e_ne_n*` | `‖ρ−Σ_(n≤N)‖₁ = Σ_(n>N)2^(−n) = 2^(−N)` | sound |
| §4.1 Checks 1–2 | `ψ ∝ (1+\|x\|)^(−2)`, `(1+\|x\|)^(−1)` | `\|ψ\|² ~ x^(−4)`: `∫x²\|ψ\|² < ∞`, `∫x⁴\|ψ\|² = ∞`; `\|ψ\|² ~ x^(−2)`: `∫\|x\|\|ψ\|² = ∞` | sound |
| §4.2 Check 1 | `ψ = (2πσ²)^(−1/4)e^(−x²/(4σ²))` | `\|ψ\|²` is `N(0,σ²)`, `ΔQ = σ`; `Pψ = (ix/(2σ²))ψ`, `ΔP = 1/(2σ)`; product `1/2` | sound |
| §4.2 Check 3 | `σ_x`, `σ_y`, `e₁` | `Aψ = e₂`, `Bψ = ie₂ = i·Aψ`, `[A,B] = 2iσ_z`, `½\|⟨e₁,2iσ_ze₁⟩\| = 1 = ΔAΔB` | sound |
| §4.3 Check 1 | `H = σ_z`, `A = σ_x` | `e^(itσ_z)σ_xe^(−itσ_z) = cos2t σ_x − sin2t σ_y`, derivative `−2σ_y = i[σ_z,σ_x]` | sign convention right |
| §4.4 Check 1 | `(1/√2)(1⊕e₁)` | reduced state `½δ⊕½\|e₁⟩⟨e₁\|`, mixed on `M` | sound |
| §4.5 first-moment lemma | bands `\|t\| ≥ 2^(2n)`, weights `2^(−n)` | `Σ2^(−n)2^(2n) = Σ2ⁿ = ∞`, `Σ2^(−n) = 1` | sound |
| §5.1 Check 1 | `ℓ^∞(ℕ)`, free-ultrafilter limit | not normal, excluded | sound |
| §5.2 Check 2 | `ℂ⊕R_(II₁)` | atom `(1,0)`, summand `R` atomless | one-atom criterion fails for nonfactors |
| §5.3 Check 1 | `a = σ_z`, `b = σ_x` | `ψ_a(b) = (i/2)(2iσ_y) = −σ_y`; `a∘b − iψ_a(b) = iσ_y = σ_zσ_x` | sign right |
| §5.3 bracket identity | general `a,b,c` | `[L_a,L_b]c = ¼(abc+cba−bac−cab) = ¼[[a,b],c]`; `[ψ_a,ψ_b] = (i/2)²ad[a,b] = −¼ad[a,b]` | `[ψ_a,ψ_b] = −[L_a,L_b]` |
| §5.3 Check 2 | `c = σ_z` | `¼[2iσ_y,σ_z] = ¼·2i·2iσ_x = −σ_x`; `[ψ_a,ψ_b]σ_z = +σ_x` | opposite signs as stated |
| §5.3 AS dictionary | `ψ^AS = −ψ` | `a∘b − iψ^AS_b(a) = a∘b + iψ_b(a) = a∘b − iψ_a(b)` (antisymmetry) | consistent |
| §5.4 Check 1 | `p = (1+σ_z)/2` | `2(U_p+U_(p′))−I` sends `σ_x,σ_y ↦ −σ_x,−σ_y`, `σ_z ↦ σ_z` | half-turn about `z` |
| §5.4 Check 2 | `J(a) = Tr(a)1−a` | `J(σ_x)J(σ_y) = iσ_z`, `J(iσ_z) = −iσ_z`; `J = Ad(σ_y)∘transpose` on `1,σ_x,σ_y,σ_z` | Jordan, not multiplicative |
| §5.4 Check 3 | spin factor `V₄` | normal-state base `B⁴`, antipodal extreme points, join `B⁴ ≇ B³` | global 3-ball fails |
| §5.4 `O(3)` splitting | `g ↦ ((det g)g, det g)` | `det((det g)g) = (det g)⁴ = 1` | sound |
| §5.5 Check 2 | `M₂(ℂ)`, `J(x) = x*` | `Φ(x)(y) = xy+yx*`; `Φ(i1) = 0`; `e^(tΦ(σ_z))y = e^(tσ_z)ye^(tσ_z) ≥ 0` | sound |
| §5.5 Check 3 | `Φ(σ_z) ∓ iΦ(iσ_z)` | `2σ_zy` (left) and `2yσ_z = 2Jσ_zJ y` (right) | `M_(I_M) = M`, `M_(−I_M) = M′` |
| §5.6 Check 3 | `(x,y) ↦ (x,yᵀ)` on `M₃⊕M₃` | image of `(e₁₃,e₁₃)` is `(e₁₃,e₃₁)`; products `(e₁₃,0)`, antiproducts `(0,e₃₁)` | neither |
| §5.7 Check 1 | `θ = transpose`, `W(y) = yᵀ` | `WR_zW⁻¹ = L_(zᵀ)`, `WJ = JW`, `A = WJ`: `y ↦ ȳ`, `Ax*A⁻¹ = L_(xᵀ)` | sound |
| §6.2 Check 1 | `dim H = 2`, `n = 3` | `dim Sym³ = 4`, `Λ³ = 0`, `8−4 = 4` | mixed symmetry |
| §6.3 Check 2 | `c_n = 1/(n+1)`, `(n+1)^(−3/2)` | `Σn/(n+1)² = ∞`; `Σn(n+1)^(−3) < ∞`, `Σn²(n+1)^(−3) = ∞` | domains as stated |
| §6.4 Weyl sign | `W = e^(iΦ)`, `[Φ(f),Φ(g)] = i Im⟨f,g⟩` | BCH: `e^(iΦ(f))e^(iΦ(g)) = e^(−i Im⟨f,g⟩/2)W(f+g)` | matches D8 |
| §6.4 shift | `W(ith)Φ(h)W(ith)*` | `Φ(h) − Im⟨ith,h⟩ = Φ(h) + t‖h‖²` | sound |
| §6.4 field bound Check | `ψ = e`, `f−g = e` | `(Ω+√2e⊗e)/√2`, norm `√(3/2) > 1` | coefficient `√2` needed |
| §6.5 Check 1 | `a† ↦ ξ−∂` | `(ξ−∂)He_n = He_(n+1)`; `S a† S⁻¹h_n = √(n+1)h_(n+1) = He_(n+1)/√n!` | consistent |
| §6.5 `Φ(ie)` | `a(ie) = −ia(e)` | `i(−∂+ξ−∂)/√2 = i(ξ−2∂)/√2` | sound |
| §6.6 Schrödinger multiplier | `W(q,p)ψ(x) = e^(ip(x+q/2))ψ(x+q)` | phase difference `(p′q−pq′)/2 = −B/2`, `B = pq′−qp′` | `exp(−iB/2)`, D8's sign |
| §6.6 Check 2 | `B((q,0),(0,p)) = −qp`, `B((0,p),(q,0)) = pq` | ratio `e^(ipq)` equals the direct `W(q,0)W(0,p) = e^(ipq)W(0,p)W(q,0)` | sound |
| §6.6 nonregular rep | `W₊(q,p)e_x = e^(ip(x+q/2))e_(x+q)` | multiplier `e^(i(pq′−p′q)/2)` | opposite sign, as stated |
| §6.7 Check 3 | `Q = σ_z`, `P = σ_x` | `[σ_x,σ_z] = −2iσ_y` | not scalar |
| §7.1 route | `e_i+ze_j ⊥ −z̄e_i+e_j` | `−τ(z̄)‖v_i‖² + conj(τz)‖v_j‖² = 0`, `‖v_i‖ = ‖v_j‖` ⇒ `τ(z̄) = conj(τz)` | τ ∈ {id, conj} |
| §7.1 Check 1 | swap of antipodal pairs on `ℙ(ℂ²)` | transition probability `ℂe₁`–`ℂ(e₁+2e₂)`: `1/5 ↦ 9/10` | not Wigner; dimension two excluded |
| §7.1 Check 3 | `V = U′⁻¹U` fixing rays | `Ve₁ = ce₁`, `Ve₂ = c′e₂`, `V(e₁+e₂) ∈ ℂ(e₁+e₂)` ⇒ `c = c′`; antiunitary `V` moves `ℂ(e₁+ie₂)` to `ℂ(e₁−ie₂)` | unique up to phase |
| §7.2 Check 3 | `ω_θ`, `U_a = W(a)` | commutator `e^(iθ(a₁b₂−a₂b₁))`, rephasing-invariant | nontrivial class |
| §7.3 Check 1 | `I₁I₂`, `I₂I₁` | `(i/4)(−E₁₁+E₂₂)`, `(i/4)(E₁₁−E₂₂)`; `[I₁,I₂] = −(i/2)(E₁₁−E₂₂) = −I₃` | sound |
| §7.3 charges | `Q = H(1/3,−2/3)`, weights `(1,0),(0,1),(−1,−1)` | `(k−2l)/3 = 1/3, −2/3, 1/3`; `(k−l)/2 = 1/2, −1/2, 0`; real basis count `2+3+3 = 8` | sound |
| §7.3 Check 3 | `J_a = ℏ(1/i)dπ(I_a)` | `[J₁,J₂] = −ℏ²dπ(−I₃) = iℏJ₃` | sound |
| §8.1 Check 3 | `X = x²` | `A*u = ±iu` ⇒ `u′ = (−1/x ∓ 1/x²)u`, `u = e^(±1/x)/\|x\|`, each `L²` on one half-line (`1/x²` integrable at ∞) | indices `(1,1)` |
| §8.2 Check 2 | `ψ = e^(−y²)`, `t = 1` | `ψ̂ = √πe^(−π²ξ²)`, `e^(−4π²iξ²)ψ̂` inverts to `(1+4i)^(−1/2)e^(−x²/(1+4i))` | sound |
| §8.2 spectral measure | `λ = 4π²\|ξ\|²` | Mathlib convention needs `(2π)^(−n)` and `ψ̂(√λω/(2π))` | Teschl's convention, R05 |
| §8.3 Checks | `(−Δ)²`; `P = −i∂` on ℝ; `g = 1_({0})` | `λ²` not affine; `2πξ` odd; `ν({0}) = 0` | sound |
| §9.1 Check 2 | `s = s_z(θ)` | `e^(−iθσ_z/2)σ_xe^(iθσ_z/2) = cosθσ_x+sinθσ_y`, `R_se_x = (cosθ,sinθ,0)` | covariance |
| §9.2 Checks 1–2 | `e_0,e_1`; `a†h₀` | `∫e^(−x²) = √π`, `∫4x²e^(−x²) = 2√π`; `(x−∂)h₀/√2 = √2xh₀ = h₁`; Tau Ceti's `hermiteFunction n` equals `h_n` | sound |
| §9.2 `H = 2N+1` | `a†a = ½(Q²+P²−1)` | `Q²+P² = 2N+1` | sound |
| §9.3 Check 1 | `Y_10`, `Y_(2,±2)` | `(3/4π)·2π·(2/3) = 1`; `(15/32π)·2π·(16/15) = 1` | sound |
| §9.3 Check 3 | `[L_x,L_y]` | `y[P_z,z]P_x + x[z,P_z]P_y = i(xP_y−yP_x) = iL_z` | sound |
| §9.4 Checks | `a = 0`; `a = b`; `b = −1`, `a = 1` | `ℳ(0,b,z) = 1/Γ(b)`, `W = 0 = −e^zz^(−b)/Γ(0)`; `e^z` solves; `c₂ = (1)₂/2! = 1`, DLMF 13.2.5 gives `z²e^z` | sound |
| §9.4 connection formula signs | `ph z ∈ (−π,0)` upper, `(0,π)` lower | `e^(±πi)z` stays on the principal sheet in each case | consistent with 13.2.41 |
| §9.5 reduced operator | `−u″ + ℓ(ℓ+1)u/r² + 2μαu/r` against UO-D07 | `ν²−¼ = ℓ(ℓ+1)` ⇒ `ν = ℓ+½`; `−b = 2μα` | limit circle only for `ℓ = 0` |
| §9.5 Weyl–Kodaira data | `β = √(−2μz)`, `Re β > 0`, `z = E+i0` | `β → −ik`, `a_z → ℓ+1+iη`, `η = μα/k`; `ψ_(E+i0) = e^(iρ)(−2iρ)^(−iη)e^(−iθ_ℓ)H⁺ = i^ℓe^(−πη/2−iσ_ℓ)H⁺` | formula at line 1006 right |
| §9.5 Wronskian and kernel | `φ_z,ψ_z` | `W_r = 2β·e^(−x)x^(2ℓ+2)·(−Γ(b)x^(−b)e^x/Γ(a)) = −2βΓ(2ℓ+2)/Γ(a_z)`; Green function of `−u″+qu−λu` is `−φ(r_<)ψ(r_>)/W(φ,ψ)`, times `2μ` | sign right |
| §9.5 boundary jump | constants | `(−2i)^(ℓ+1)i^ℓ = −i2^(ℓ+1)`; kernel `(2μ/k)F(r_<)H⁺(r_>)`, imaginary part `(2μ/k)FF`, divided by π; `dE = k dk/μ` makes `√(2/π)F` the unitary kernel | `𝒞_ℓ` normalization right |
| §9.5 Checks 1–3 | `m₁ = m₂ = 1`, `α = −1`; gradients; `η = 0` | `μ = 1/2`, `−1/(4n²)`, multiplicities `1`, `4`; `∇₁ = ½∇_R+∇_r`; `C₀(0) = 1`, `W(cos,sin) = 1` | sound |
| §9.6 Checks | `⟨η_n,ζ_n⟩ = (−1)ⁿ`, `1−1/n²`, `1−1/n` | tails alternate; `Σ1/n² < ∞`; `∏(1−1/n) → 0` | sound |
| §9.7 Checks | `n = 1`; `σ_x,σ_y`; slit plane | `[−i∂,M_f] = −if′`; `D² = −Δ`, eigenvalues `±2π\|ξ\|`; Euclidean `2ε`, intrinsic `≥ 2` | sound |
| §9.8 Check 1 | `ω = q₂p₁−q₁p₂`, `B = p₂q₁−q₂p₁` | `ω = −B` | sign dictionary right |
| §9.9 symplecticity, group law | `S_t = cosh t + sinh t·C` | `Im⟨S_tx,S_ty⟩ = (cosh²−sinh²)Im⟨x,y⟩`; `S_tS_s = cosh(t+s)+sinh(t+s)C`; column energy `d·sinh²t` finite in dimension `d`, infinite otherwise | sound |
| `kummerM` at `b = −n` | `Γ(−n) = 0` | `kummerM ≡ 0` solves the equation; the regularized equation carries the content | R06 note |

Ownership statement: against main, the board packages and the open pull requests the brief lists (grep through `roadmaps grep` for Uhlhorn, Naimark, Kakutani, Segal system, Gudder, instrument/Lüders, hydrogen, Coulomb wave, fundamental theorem of projective geometry, Iochum, Alfsen, collineation, second quantization, Tricomi, Gaussian measures on Hilbert space, Macdonald/Shirshov, orthomodular, frame function), the objects of §0.1–0.3, §1.1–1.9, §2.2–2.3, §5.3–5.5, §6.3–6.6, §7.1 and §9.4–9.5 have no other owner (the matches elsewhere are Gelfand–Naimark, Riesz–Markov–Kakutani, Naimark's principal series in NQS, FreeProbability's free second quantization for contractions, and VonNeumannAlgebras' frame functions, which this roadmap consumes); RelativisticQuantumFieldTheory (#1772) consumes this roadmap and is not consumed. Ownership against open pull requests without files in the brief was not checked beyond the `roadmaps grep` index.

## Not verifiable

- Alfsen–Shultz 1998, PNAS 95 (Theorem 1, Corollary 2): pnas.org answers HTTP 403 to the service; the CMP companion (doi 10.1007/s002200050350) is paywalled. Listed in `needs-references.toml`; §5.3's sign conventions were checked by computation instead (table).
- Alfsen–Shultz 1978, Acta Math. 140 (§2): the Springer DOI is paywalled; Project Euclid's copy was not reachable through the service. Uncertified.
- Alfsen–Shultz–Størmer 1978, Adv. Math. 28 (Propositions 2.1–2.7, Corollary 2.10); Iochum–Shultz 1983, J. Funct. Anal. 50 (Definition 1.2, Theorem 1.5, Proposition 1.8, Theorems 2.9–2.10): Elsevier, paywalled. Uncertified.
- Davies–Lewis 1970, CMP 17; Łuczak–Podsędkowska 2015, IJTP 54 (Theorem V.7); Gudder–Boyce 1970, IJTP 3 (§2, §6, Theorems 6.1, 6.4, Corollaries 6.2–6.3): Springer, paywalled. Uncertified; §1.9's axiom list and §2.3's repeatability distinctions were checked for internal consistency only.
- Ozawa 1984, J. Math. Phys. 25 (Theorem 6.6): AIP answers HTTP 403. Listed in `needs-references.toml`.
- Kakutani–Mackey 1944, Ann. of Math. 45 (Theorems 1–2) and Segal 1947, Ann. of Math. 48 (Postulates): JSTOR only. Listed in `needs-references.toml`; Segal's postulates were read in Pulmannová's restatement (79007bd7 lines 98–107), which agrees with §1.5.
- Artin, *Geometric Algebra* (II.2.26); Paulsen (Theorem 4.6); Janson (Chapters 2, 4); Mackey 1963; Davies 1976 (Chapter 4); Reed–Simon; Uhlhorn 1963 (Arkiv för Fysik): books and a journal with no open copy; cited for standard facts, not opened.

## Source issues

- none
