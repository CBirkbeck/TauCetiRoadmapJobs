# Review of QuantumFoundations (pull request #1771 at d390951)

**Verdict:** needs changes

Files reviewed: `TauCetiRoadmap/QuantumFoundations/README.md` (2174 lines), `Suggested.lean` (272 lines) and the four companion files `CharacterRegularityTargets.lean`, `RadialHamiltonianTargets.lean`, `SelectedStateExamples.lean`, `SpinHamiltonianTargets.lean`. The pull request changes nothing outside the folder (`git diff --stat origin/main...HEAD` excluding the folder is empty). The gate at this head fails: build=10, no-import-mathlib=1, mathlib-subimports=10, imports=1, sorry-data=4, blob=11, tex=3, prnum=1, residue=1. The dependency check prints `depcheck: 205 roadmaps, 1648 edges, 0 problem(s)` for this README, but only because the README contains no `*Needs:*` line at all (see R03); the supplier audit below was done by reading.

## R01 (P1) — Supply cycle with RelativisticQuantumFieldTheory

Location: README lines 45–53 (“QF4→RQFT2/RQFT3/RQFT10 … RQFT3/RQFT10→QF6b→RQFT9”), line 1867 (“apply RQFT10's Shale criterion to prove pairwise inequivalence”), line 2081 (“QF6b uses RQFT3's physical transverse-photon one-particle space”).

Claim: the roadmap documents, as its own dependency order, that RQFT2/RQFT3/RQFT10 consume QF4 and that QF6b consumes RQFT3 and RQFT10.

Witness: RelativisticQuantumFieldTheory (pull request #1772, head d5f595e) README line 35 says RQFT2, RQFT3 and RQFT10 consume QF4's Fock interface and RQFT9 consumes QF6b.SharedKummer; its lines 3614 and 3643 consume QF6b's Kummer interface. A roadmap has a single direction of supply; QF4→RQFT3→QF6b is a cycle between the two folders whatever milestone labels are attached. The depcheck cannot see it because neither README has `*Needs:*` lines.

Repair: remove every RQFT input from QF6b. The photon application of Dooley p.15 and the Shale-criterion inequivalence of the `S_t` family (lines 1867, 2081) move to RelativisticQuantumFieldTheory (RQFT9/RQFT10) as consumers of QF4 and QF6a; QF6b states the `S_t` family, its symplecticity and the non-Hilbert–Schmidt antilinear part only. RelativisticQuantumFieldTheory then appears in this README only under Downstream consumers.

## R02 (P1) — QF5, QF6a and QF4 re-plan NoncompactQuantumSymmetry Layer P

Location: README lines 1367–1373 (Wigner and transition probability on `Projectivization ℂ H`), 1400–1446 (QF5.P: `U(H)_s`, `UA_C(H)`, `PU`, `PUA`, Polish structure, Borel sigma algebras, Banach–Pettis), 1449–1478 (QF5.CharacterRegularity), 1480–1531 (local sections of `U(H)→PU(H)`, `H²_lc`, local-exponent smoothing, Borel sections), 1539–1557 (Whitehead lemmas, `H²_lc(SO(3),𝕋)≅ℤ/2`, `U(2)→SO(3)`), 1758–1763 (QF6a position, momentum, Fourier, Schwartz core), 1335–1336 (QF4 permutation sectors); `Suggested.lean` line 211 (`rayTransitionProbability`).

Claim: these are QF targets, and “NQS M1/M2 consume this result” (line 1441), “NQS M3 consumes QF5 and QF6a” (line 1867).

Witness: NoncompactQuantumSymmetry (pull request #1015, head 777a2fe) is earlier in the merge order (line 140; this roadmap is placed at line 198). Its README line 18 states that Layer P owns “rays, the unitary–antiunitary group and Wigner's theorem (P.1); strong-operator Polish groups, coefficient and quotient Borel structures, the local section of `U(H)→PU(H)` and Pettis's theorem (P.2); normalized locally continuous multipliers and their topological extensions (P.3); finite-dimensional Lie smoothing, differentiation, integration and Whitehead lemmas (P.4)”, with P.5 “Free-particle position and momentum” (line 514, and line 18: “M3 consumes Layer P.5”) and P.6 “Permutation sectors of completed tensor powers” (line 543). Its line 278 states Pettis's theorem, lines 308–310 the `U(2)→SO(3)` no-global-section argument and the Hamel-basis Borel-character example, line 569 the spin class of SO(3). Its `Suggested.lean` lines 62–75 declare `rayTransitionProbability` on `Projectivization ℂ H` and `wigner_reconstruction`. NQS never cites QuantumFoundations (grep of its README for `QuantumFoundations` and `QF[0-6]` finds only the symbol `QF` in a Fourier formula at lines 8153 and 8180), so the consumption claims are false at its head.

Repair: delete the duplicated targets and cite NQS P.1–P.6 by section in the supplier contracts; delete `rayTransitionProbability` and `rayTransitionProbability_mk` from `Suggested.lean`. What NQS does not state stays here as QF's own: QF0's cross-space projective theorem, Uhlhorn's theorem (NQS mentions Uhlhorn nowhere), the ray-to-projection-lattice adapter, the quaternionic and Banach Hilbertization targets. Drop every sentence asserting that NQS consumes QF.

## R03 (P2) — The README is not in TauCetiRoadmap form and carries no `*Needs:*` line

Location: README line 1 (“# Mathematical foundations of quantum systems”), headings at lines 97, 159, 176, 723, 797, 1199, 1207, 1271, 1322, 1365, 1756, 1865, 2084, 2139.

Claim: a roadmap README with Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers with `*Needs:*` lines, API bullets, `**Checks.**` lists, Examples and Dependencies per layer, Downstream consumers.

Witness: none of these headings exists; `grep -c 'Needs:' README.md` gives 0 and `grep -c 'Checks' README.md` gives 0. The text is milestone prose (“Milestone QF1 — …”) in which single paragraphs run to 4462 characters (line 1299) and mix definitions, theorems, proof routes and commentary on misprints in the course notes. With no `*Needs:*` lines the dependency check sees 1648 edges from the other roadmaps and none from this one; I ran it on a scratch copy carrying the README's named suppliers as `*Needs:*` lines to see what it would check. No definition has three discriminating Checks; no target has a `*Needs:*` line naming its inputs item by item.

Repair: rewrite in the house shape (read two or three roadmaps on main, for example OperatorAlgebraDynamics or RepresentationTheory/CompactGroups): one `### k.n` subsection per target with hypotheses, locator, API bullets, at least three Checks and a `*Needs:*` line; the misprint commentary on Dooley and Grundling moves out of the targets (see R10). The roadmap is far too large for one folder (eleven milestones from operational axioms to hydrogen spectral theory and Connes' cone theorem); split into Parts.

## R04 (P2) — `Suggested.lean` is an API catalogue with sorry'd data, and the statable headlines are absent

Location: `Suggested.lean` lines 16–20 (docstring), 45–51, 110–115, 164–171, 231–232 (sorry'd data), 22 (namespace).

Claim (docstring): “These declarations prototype finite matrix measurement data and the projective-ray carrier.”

Witness: four definitions have `sorry` in their bodies: `FinitePOVM.reindex` (field `complete`), `FiniteInstrument.toPOVM` (field `positive`), `FiniteFrameFunction.normalize` (field `basis_sum`) and `kummerU` (the whole body), and `kummerU` is mentioned by four theorems (lines 235–252), so every Kummer statement is a theorem about an opaque function. On a scratch copy the first three closed in one tactic each (`rw [← M.complete]; exact Fintype.sum_equiv e _ _ (fun _ => rfl)`; `simp [← Finset.sum_div, f.basis_sum b, hw.ne']`; positivity of `effect` is `Matrix.posSemidef_sum` of `posSemidef_conjTranspose_mul_self`), so they are not even hard. The headline theorems of the README that are statable at the pins are not stated: finite-dimensional Gleason (QF2.Frame, line 745: for `n ≥ 3` a `FiniteFrameFunction n` is `v ↦ ⟪v, T v⟫` for a unique positive `T`; the carrier `FiniteFrameFunction` is defined at line 147 but the theorem is absent), Uhlhorn's theorem on `Projectivization ℂ H` with orthogonality preserved in both directions (line 1371), the finite-outcome Naimark/instrument identities, the bounded Segal-to-normal-state adapter. The docstring does not say which headlines are not statable and what each lacks. The namespace is `QuantumFoundations`, not `TauCetiRoadmap.QuantumFoundations`; `StronglyContinuousProjectiveRepresentation` (line 200) is an alias of a structure, not a theorem.

Repair: state finite Gleason, Uhlhorn (QF-owned after R02) and the other statable headlines with `sorry`; delete the sorry'd data (the Kummer `U` is a README target with its intended signature, so the four Kummer theorems go to the README until a real body exists, or are restated on `Complex.regularizedHGFun` alone, as `kummerM_differential_equation` already is); keep only the definitions a stated headline needs; rename the namespace; say in the docstring which headlines are not statable (hydrogen spectrum, Stone–von Neumann, Naimark on an arbitrary measurable space if its POVM carrier is judged too heavy) and why.

## R05 (P1) — The gate build fails: imports

Location: `Suggested.lean` lines 5–14.

Claim: ten `import Mathlib.<submodule>` lines and no `import Mathlib`.

Witness: gate `build=10` (one module-system warning per import), `no-import-mathlib=1`, `mathlib-subimports=10`, `imports=1`; the file rule is the single line `import Mathlib` followed only by `TauCeti.*` modules. Elaboration itself passes (`lake env lean` on the file gives 16 `declaration uses sorry` warnings and no error).

Repair: replace lines 5–14 by `import Mathlib`. The same repair applies to the four companion files (`CharacterRegularityTargets.lean` is the only one that already has `import Mathlib`).

## R06 (P2) — Four companion `.lean` files are outside the acceptance-test form

Location: `CharacterRegularityTargets.lean` lines 11–18 (`noncomputable section`, two `local instance` lines), `RadialHamiltonianTargets.lean` lines 1, 67–80 (`abbrev`s, `def`s, a maximal-domain `def` on `Lp`), `SelectedStateExamples.lean` lines 5–9, 121–146, `SpinHamiltonianTargets.lean` lines 1–4, 167–179; README lines 591, 1477, 1851, 1927 link them as “representative”, “suggested”, “calibration” targets.

Claim: “five native Lean companions provide representative signatures” (pull request text).

Witness: the roadmap's acceptance test is `Suggested.lean`; each companion elaborates (3, 3, 3 and 4 `sorry` warnings respectively, no error) but is a second sorried file with its own namespace (`QuantumFoundations.CharacterRegularity` and so on), submodule imports, `local instance` declarations and definitions (`axis`, `plus`, `minus`, `symbol`, `energy`, `radialMeasure`, `domain`, `state`) that exist only to carry API-level statements (`axis_isHermitian`, `projection_laws`, `symbol_decomposition`, `norm_and_square_gap`, `not_order_determining`). These are README Checks and API bullets, not headline theorems. `SelectedStateExamples.not_order_determining` and `norm_and_square_gap` compute small values (`state (1/4) x = 1/2`, `‖x‖ = 1`).

Repair: delete the four files; their contents become README Checks and API bullets (the SU(3)/Pauli calibrations, the two-point Segal counterexample, the radial-symbol domain) and, where one is a genuine headline statable at the pins (`exists_radial_symbol`, `measurable_character_classification`), it moves into `Suggested.lean`.

## R07 (P2) — QF6b consumes NQS, LaguerreJacobi and VonNeumannAlgebras by pull-request number and pinned blob links; one cited section does not exist

Location: README line 1219 (“VariationalMethods V2.3”), 1986 (“LaguerreJacobi A1–A3 and B1–B4 contract (PR #117)” with a `blob/<sha>` link), 23, 29, 31, 1218, 1578, 1580, 2022, 2044, 2056, 2114 (eleven `github.com/…/blob/<sha>/…` links).

Claim: VariationalMethods has a section V2.3 that UnboundedOperators consumes.

Witness: VariationalMethods (pull request #1028, head 7ea28a3) has no V2.3 (the worker's citation check and my grep agree); UnboundedOperators (pull request #1027, head e626430) README line 74 says “VariationalMethods 5.1 consumes them and supplies nothing here”, so the direction is also reversed. The V5–V13 citations (V5.LatticeFinite, V6.LatticeTypes, V10.ClosedOperators, V10.Affiliation, V11, V12.J.Scalar/Dye/Maps/Enriched/CentralSplitting, V13, V2.NonmodularProjectionLattice, V4.0.Decomposition) resolve only at pull request #889's head dee80881 (Layers 0–13); pull request #1041's head d9e53b3e carries V0–V4 only. Two open pull requests build the VonNeumannAlgebras folder; this README pins one of them by commit.

Repair: delete the VariationalMethods clause (UO's prerequisite table is UO's); cite LaguerreJacobi, VonNeumannAlgebras, NoncompactQuantumSymmetry, UnboundedOperators, CompactQuantumMetricSpaces and RepresentationTheory/LieGroups by roadmap name and section with relative links or no link, never by pull-request number or commit (gate rules `blob` and `prnum`).

## R08 (P3) — Gate style rules: TeX, residue

Location: README line 1257 (`e^{it(A⊗1+1⊗B)}=e^{itA}⊗e^{itB}` outside a code span), line 1448 (`<a id="qf5-character-regularity"></a>`).

Repair: put the display in a code span; delete the anchor and link QF5.CharacterRegularity by its heading slug.

## R09 (P3) — Padding in `Suggested.lean`

Location: `FinitePOVM.contractive` (line 39, proved API lemma), `FinitePOVM.reindex_effect` (53, `rfl`), `FiniteInstrument.toPOVM_effect` (117, `rfl`), `UniformFiniteOperationalModel.toOperationalModel_state` (141, `rfl`), `FiniteFrameFunction.normalize_value` (173, `rfl`), `bornWeight_sum_one` (83), `FiniteFrameFunction.weight_nonnegative` (159), `GlobalContinuousProjectiveUnitaryLift.operator_one` (203), `FinitePVM.projection_mul_eq_zero` (65), `FiniteInstrument.born_probability` (101), `bornWeight_isProbability` (76); the data-only structures `UniformFiniteOperationalModel`, `FiniteOperationalModel` (122, 128) and the alias at 200.

Witness: on a scratch copy `bornWeight_sum_one` closed with `simp [bornWeight, ← Matrix.trace_sum, ← Finset.mul_sum, M.complete, ρ.2.2]` and `weight_nonnegative` with one `exact` (`f.basis_sum (EuclideanSpace.basisFun (Fin n) ℂ) ▸ Finset.sum_nonneg …`); the `rfl` lemmas restate definitions; `contractive`, `projection_mul_eq_zero`, `born_probability`, `bornWeight_isProbability` and `operator_one` are API facts the README states at lines 232, 229, 311, 236 and 1495.

Repair: delete them from `Suggested.lean` (the README keeps each as an API bullet or Check).

## R10 (P3) — Process narrative and source-transcript commentary

Location: README lines 1639 (“including the Luna reader's uncertainty about the handwritten charge coefficient”, “confirmed by the pagewise reread”), 117–127 (“the parenthetical abbreviation … is faint”, “No unread glyph is supplied”), 2087–2091 (“all 34 source pages”, “all 225 transcript pages”), and the many “preserve the recorded … separately”, “retain the literal …”, “the transcript records” sentences (for example lines 1267, 1295, 1297, 1299, 1341, 1853–1857, 1937–1957, 2104–2129).

Witness: the sources are unpublished course notes (Dooley, *Foundations of Quantum Mechanics*; Grundling, *MATH3680 Quantum Mechanics*) read from images by an AI reader (pull request text); a large part of the README is a register of their misprints and unreadable glyphs. A reader a year from now cannot use “the Luna reader”, “transcript”, “recorded” or “faint glyph” and should not have to; none of this is a target. The notes are not legally readable by a reviewer (see Not verifiable), so every “Dooley p.N” and “Grundling p.N” locator is unverifiable as well.

Repair: state each adopted theorem with a locator into a published source (Reed–Simon, Holevo, Davies, Varadarajan, the primary papers already linked) and drop the transcript commentary; keep at most one sentence per convention clash (“our sign convention is …; some texts use the opposite”).

## R11 (P3) — Missing or incomplete references

Location: README lines 574, 640, 720 (“Pulmannová (1978) … Theorems 1–5”), 2139–2174 (References).

Witness: Pulmannová 1978 has no entry in References (no title, journal or locator anywhere); Dooley, Grundling and Rieffel's excerpt are described at line 2087 but have no bibliographic entry; Gudder–Boyce, Alfsen–Shultz (three works), Iochum–Shultz, Connes and DLMF are cited inline by link only. `hasSum_smul_repr_of_apply_eq_smul` (line 789) is Tau Ceti's (`TauCeti/Analysis/InnerProductSpace/Spectrum.lean` line 157), not “native” Mathlib.

Repair: one entry per cited work with locator scheme and locator; attribute the Tau Ceti declaration to Tau Ceti.

## R12 (P3) — Unused hypotheses in `Suggested.lean`

Location: `kummerM_differential_equation` line 256 (`hb : ∀ n : ℕ, b ≠ -(n : ℂ)`); `GlobalContinuousProjectiveUnitaryLift` line 181 (`[IsTopologicalGroup G]`).

Witness: `kummerM a b = Complex.Gamma b * regularizedHGFun {a} {b}`, and `Complex.Gamma_neg_nat_eq_zero` (Mathlib `Analysis/SpecialFunctions/Gamma/Basic.lean` line 439) makes `kummerM a (-n) = 0`, which satisfies the equation; the regularized function is entire in `z` for every `b`, so the statement holds without `hb`. No field of the structure uses the group topology beyond `TopologicalSpace G` (continuity of the multiplier and of `g ↦ operator g x`).

Repair: drop `hb`; drop `IsTopologicalGroup G` or use it in a field.

## Verified sound

Gate and build. `lake env lean TauCetiRoadmap/QuantumFoundations/Suggested.lean` from the worktree: 16 `declaration uses sorry` warnings, no errors; the four companions elaborate with 3, 3, 3 and 4 sorry warnings. The worker's `signatures.md` (36 declarations) was compared with the README: no declaration lost a section binder; `FinitePOVM`, `FinitePVM`, `FiniteInstrument`, `FiniteFrameFunction` and `GlobalContinuousProjectiveUnitaryLift` carry exactly the hypotheses the README states at lines 227–232, 1495. Depcheck output: `depcheck: 205 roadmaps, 1648 edges, 0 problem(s)` (no `moved:`, `UPWARD` or `CYCLE` line; see R03 for why this is not evidence).

Library declarations opened at the pins (Mathlib f6090c7, Tau Ceti 358314d): `Complex.regularizedHGFun` (`Analysis/SpecialFunctions/RegularizedHypergeometric.lean` 172, with `regularizedHGFunCoeff_add_one` 92 and `radius_regularizedHGFunSeries_eq_top` 229, which the README's coefficient recurrence and convergence claims at line 1968 rely on), `MeasureTheory.resolventTransform` (`MeasureTheory/Measure/ResolventTransform.lean` 108: `∫ x, resolvent a x ∂μ`, with `resolvent a r = (↑ₐ r − a)⁻¹`, so the transform at `z` is `∫ (λ − z)⁻¹ dμ(λ)` as the README says at line 1993), `Lp.fourierTransformₗᵢ` (`Analysis/Fourier/LpSpace.lean` 51), `ContinuousLinearMap.finite_dimensional_eigenspace` (`Analysis/InnerProductSpace/Spectrum.lean` 461, hypotheses `IsCompactOperator T`, `μ ≠ 0`), `ProbabilityTheory.IsGaussian` (`Probability/Distributions/Gaussian/Basic.lean` 45), `Lp.compMeasurePreserving` (`MeasureTheory/Function/LpSpace/Basic.lean` 595), `Measure.ext_of_charFun` (`MeasureTheory/Measure/CharacteristicFunction/Basic.lean` 257, needs `CompleteSpace E`), `IsCommJordan` (`Algebra/Jordan/Basic.lean` 90), `Circle.toUnits` (`Analysis/Complex/Circle.lean` 103), `Complex.Gamma_neg_nat_eq_zero`; Tau Ceti `exists_isCompl_of_isKilling` (`Algebra/Lie/HighestWeight/CompleteReducibility.lean` 259, `[FiniteDimensional K M]`), `gaussianHermiteHilbertBasis` (`Probability/Distributions/Gaussian/Hermite/Basis.lean` 138), `gaussianHermitePiBasis` (`…/Hermite/Pi/Basis.lean` 54), `ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector` (`Analysis/InnerProductSpace/Spectrum.lean` 119, hypotheses compactness and symmetry as the README says at line 789), `hasSum_smul_repr_of_apply_eq_smul` (same file 157), `existsUnique_eq_expUnitHom_complex` (`Geometry/Lie/Exponential/Units/Complex.lean` 39, on continuous homomorphisms `Multiplicative ℝ →ₜ* ℂˣ`), `IsClassicalSolution`/`IsMildSolution` and their `unique`, `eq_realOperator` theorems (`Analysis/Semigroups/CauchyProblem/Basic.lean` 49, 91; `Uniqueness.lean` 70–136), `hermiteFunction_oscillator`, `hermiteHilbertBasis`, `hasSum_hermiteFunctionLp_expansion`.

Cross-roadmap citations resolved: SelfAdjointSpectralTheory SA-B01, B31, B35, B37, B39, B72, B80, C86, E01–E13, E26, E28–E30, E44–E47 (all present on main); OperatorIdeals OI-A29, B29, B30, Parts A–B; OperatorAlgebraDynamics D1, D3, D8; RepresentationTheory CompactGroups, LieGroups Layers 2–5, LieHighestWeight Layer 5, SpinRepresentations Layer 7; SpinGeometry G1.3; BanachSpaceTheory B5; RiemannianGeometry R7 (R7.1–R7.8 is one subsection heading at line 1303); Completed/OrthogonalL2Bases A3, A3′, B3, Part D; LieGroupoidsPoisson G1.3 (#1050); HilbertModules H3, H6 (#861); CStarAlgebras C2, C4, C5 (#860, whose line 76 names QF2 as a consumer); UnboundedOperators UO-A01–A07, B03, D06, D07, E01, E03, E05, E06, F02, F03 (#1027); CompactQuantumMetricSpaces Q1, Q3 (#1155); StochasticCalculus (#1030; S6.1 not found as a heading, cited only for what it does not own); VonNeumannAlgebras V0–V4 at both heads and V5–V13 at #889 only (R07). Ownership against the open pull requests listed in the brief was checked by grep for QuantumFoundations and the QF labels: only CStarAlgebras and RelativisticQuantumFieldTheory mention this roadmap (R01).

Sources read at the locator (cache ids are the sources service's content hashes):

- Iochum–Loupias 1985 (Numdam, cache dba8b513…): Proposition I.4 (bilinear continuous product from the parallelogram-type hypothesis) and I.5 (power-associativity from `A²·A²=A⁴`) at printed p.214, lines 133–156; Theorem V.1 (a Banach-power-associative algebra is a JB algebra) at p.222, line 473; Corollary V.3 at p.223, line 492. Matches README line 594.
- Moretti–Pastorello (arXiv 1205.4504v2, cache b23953b7…): Theorem 10, line 321: `dim H ≥ 3` and `f ∈ L²(S(H))` give a unique linear `A` with `f(z)=⟨z|Az⟩`. The README's caveat (line 2171) that boundedness alone supplies no measurability is right; QF2.Frame itself states Gleason's bounded version, which is a different theorem with its own regularity argument.
- Gehér (arXiv 1606.03584v1, cache 1388deed…): Theorem 4, line 233 (complex, `dim ≥ 3`, angle-preserving bijections of `P(H)` are Wigner symmetries); Uhlhorn's two-sided-orthogonality hypothesis at lines 104–106. Matches README line 1371.
- Pankov 2020 (CUP sample chapter, cache 175769b0…): Theorem 3.16, lines 319–336, is exactly the complex Kakutani–Mackey statement of README lines 141–145 (infinite-dimensional complex Banach space, conditions (1)–(3), inner product with the same closed subspaces and `X⊥` the orthogonal complement); the proof route via the annihilator map `P ↦ P⁰` and a semilinear `L : B → B*` (lines 337–346) is the README's κ construction.
- Connes 1974 (Mersenne, cache 95bd73d2…): Théorème 1.3, line 152 (unique autopolar form `s` with `s_φ = φ` for each faithful normal positive form); Théorème 5.2, lines 969–980 (facially homogeneous self-dual cone with an orientation: `M = {δ₁ − iδ₂}` is a von Neumann algebra, `M′ = {δ₁ + iδ₂} = JMJ`, `xJxJ 𝓗⁺ ⊆ 𝓗⁺`, a strictly positive vector is cyclic and separating with `J` and the natural cone recovered); Théorème 5.8, lines 1148–1153 (ordered complex vector space with order unit underlies a countably decomposable von Neumann algebra iff an autopolar form exists whose completed cone is self-dual, homogeneous and orientable). All three match README lines 1127–1140 and 1167–1185; the formula for `s_φ` through `Δ^{1/4}` (line 1190) was not checked term by term.
- DLMF (cache 3dd9f9b0… for §13.2, 494cb28c… for §33.2): 13.2.34 `𝒲{𝐌(a,b,z),U(a,b,z)} = −z^{−b}e^{z}/Γ(a)` (line 1336) matches `kummerU_wronskian_regularized`; 33.2.4 (F_ℓ through M), 33.2.8 (H_ℓ^± through U), 33.2.11 (`H⁺ = G + iF`), 33.2.12 (`𝒲{G,F} = 𝒲{H^±,F} = 1`) match README lines 1986–1988.

Adversarial table (values computed on each side):

| Statement | Instances | Computed | Result |
|---|---|---|---|
| QF1.G MO₂ automorphism group (l.549) | atoms a,a′,b,b′ | swaps inside each complementary pair give C₂×C₂, swapping pairs gives S₂; order 2·2·2 = 8 | sound |
| MO_n composition law (l.562) | (p,e),(q,f) on (i,b) | (q,f): (i,b)↦(q(i),b+f_i); then (p,e): ↦(pq(i), b+f_i+e_{q(i)}) | matches `(p∘q,(f_i+e_{q(i)})_i)` |
| MO₂ full state at vertex s=1,t=0 not normal (l.558) | support ≤ a∧b′ | a, b′ incomparable in MO₂ so a∧b′=0; support 0 forces ω=0 | sound |
| Question predicate counterexamples (l.134, 137) | Q=diag(1,0), ρ=I/2; Q=2I | p({1}) = Tr(ρQ) = 1/2 ∉ {0,1}; 2I has point law δ₂ with values in {0,1} on every event but (2I)²≠2I | sound |
| Squaring-invariant Borel μ supported on {0,1} (l.138) | F(r)=μ[0,r] | F(r)=F(√r); r<1 iterates to μ[0,1); r>1 to μ[0,1] | sound |
| Selected family not order-determining (l.584–588) | A=ℝ², w∈[1/4,3/4] | m_w(−1,3)=3−4w ≥ 0; sup\|m_w(1,−1)\|=\|2w−1\|≤1/2, =1/2 at w=1/4; ‖(1,−1)‖_∞=1; m_w((1,−1)²)=m_w(1,1)=1 vs (1/2)²=1/4 | sound (`SelectedStateExamples.lean` agrees) |
| Point-full but not canonically ordered (l.574) | w∈[1/10,1/5] | m_w(1,0)=w ≤ 1−w=m_w(0,1) for all w≤1/2; canonical order uses w=1: 1 > 0 | sound |
| Strongly repeatable non-sharp instrument (l.326) | E₁=diag(1,½,0), E₂=diag(0,½,1) | I₁∘I₁(ρ)=Tr(E₁e₁e₁*)I₁(ρ)=I₁(ρ); I₂∘I₁=0 since Tr(E₂e₁e₁*)=0; E₁²≠E₁ | sound |
| Bloch sgn frame function (l.765) | f(n)=½+¼sgn(n₃) | antipodes: (½+¼s)+(½−¼s)=1; Born functions are affine in n, sgn is not | sound |
| Antipodal map (l.759) | (x,y,z)↦(x,y,2z)/√(x²+y²+4z²) | fixes the six axis points, moves (0,1,1)/√2 to (0,1,2)/√5: angle to e_z changes from 45° to 26.6° | preserves orthogonality, not transition probability |
| QF3.S first moment (l.1203) | bands \|t\|≥2^{2n}, weights 2^{−n} | ∫\|t\|dTr(ρE) ≥ Σ 2^{−n}·2^{2n} = Σ 2ⁿ = ∞; Tr ρ = Σ2^{−n} = 1 | sound |
| AS dynamical-correspondence sign (l.978–980) | ψ_a(b)=(i/2)(ab−ba) | a∘b − iψ_a(b) = (ab+ba)/2 + (ab−ba)/2 = ab; [L_a,L_b]c = ¼(abc+cba−bac−cab) = ¼[[a,b],c]; [ψ_a,ψ_b]c = −¼([a,[b,c]]−[b,[a,c]]) = −¼[[a,b],c] | sound |
| O(3)=SO(3)×{±1} (l.1089) | g ↦ ((det g)g, det g) | (det g)g has determinant (det g)³det g = 1 for det g=±1 | sound |
| Spin flip on M₂(ℂ) (l.1094) | a=α1+r·σ | Tr(a)1−a = 2α1−α1−r·σ = α1−r·σ: Bloch inversion, an antiautomorphism, hence Jordan | sound |
| Field-bound example (l.1299) | one mode, f−g=e, ψ=e | Φ(e)e=(Ω+√2 e⊗e)/√2, norm √(3/2)≈1.225; claimed bound √2·√2·… : (1/√2)(1+√2)=1.707 ≥ 1.225; source's (1/√2)·√2 = 1 < 1.225 | README's correction sound |
| Weyl shift sign (l.1297) | W(ith)Φ(h)W(ith)* | e^{iΦ(g)}Φ(h)e^{−iΦ(g)} = Φ(h)+i[Φ(g),Φ(h)] = Φ(h)−Im⟨g,h⟩; Im⟨ith,h⟩=−t‖h‖² | +t‖h‖² as stated |
| Wintner bound (l.1341) | [P,Q]=c, Q self-adjoint | [P,Qⁿ]=ncQ^{n−1}; n\|c\|‖Q‖^{n−1} ≤ 2‖P‖‖Q‖·‖Q‖^{n−1} | sound |
| Nonregular representation multiplier (l.1356) | W(q,p)e_x=e^{ip(x+q/2)}e_{x+q} | exponent of W(q,p)W(q′,p′) minus W(q+q′,p+p′): pq′−pq′/2−p′q/2 = (pq′−p′q)/2 | matches e^{i(pq′−qp′)/2} |
| z=p+iq dictionary (l.1299) | second-linear ⟨z,z′⟩ | (p−iq)(p′+iq′): imaginary part pq′−qp′ = B | sound |
| Twisted cocycle and rephasing (l.1534–1535) | U_gU_hU_k both ways | ω(g,h)ω(gh,k) = ω(h,k)^{σ_g}ω(g,hk); b(g)U_g·b(h)U_h = b(g)b(h)^{σ_g}b(gh)^{−1}ω(g,h)·U′_{gh} | sound |
| SU(3) matrices (l.1563–1575) | I_a = iσ_a/2 embedded | [I₁,I₂] = (i/2)²·2iσ_z = −iσ_z/2 = −I₃; (H₁−H₂)/3 = i·diag(1/3,−2/3,1/3) = Q; I₃ = H₁/2 | sound |
| Charge/isospin dictionary (l.1598–1606) | Q=H(1/3,−2/3), I₃=H(1/2,−1/2) | A_Q v_j = (k_j/3 − 2l_j/3)v_j; A_{I₃}v_j = (k_j−l_j)/2 v_j; weights (1,0),(0,1),(−1,−1) give 1/3,−2/3,1/3 and 1/2,−1/2,0 | sound |
| [J_a,J_b]=iℏε J_c (l.1609) | J_a=ℏ(1/i)dπ(I_a) | [A_{I_a},A_{I_b}] = −dπ([I_a,I_b]) = dπ(ε I_c) = iA_{I_c} | sound |
| U(2)→SO(3) no global section (l.1551) | π₁ | π₁(U(2))=ℤ, π₁(𝕋×SO(3))=ℤ×ℤ/2 | sound (and NQS line 308) |
| FlowPullbacks generator (l.1780–1792) | V_tu=\|det DT_t\|^{1/2}u∘T_t | d/dt\|_0: Jacobi gives (div X)/2, chain rule X·∇u; x-rotation X=(0,−z,y), div 0, A_X=−i(y∂_z−z∂_y) | sound |
| Free kernel (l.1854) | H=−∂², t≠0 | (4πit)^{−1/2} = (4π\|t\|)^{−1/2}e^{−iπ sgn(t)/4}; mass m: H=−∂²/(2m) is the t↦t/(2m) rescaling | sound |
| Two-body gradients (l.1974) | R=(m₁x₁+m₂x₂)/M, r=x₁−x₂ | ∇₁=(m₁/M)∇_R+∇_r, ∇₂=(m₂/M)∇_R−∇_r; (m₂P₁−m₁P₂)/M = −i∇_r; with P_j=+im_j∇_j the total is i[(m₁²+m₂²)/M∇_R+(m₁−m₂)∇_r] | sound |
| Hydrogen counts (l.1995) | α<0 | Σ_{ℓ<n}(2ℓ+1)=n²; energies −μα²/(2n²); full σ(H)=[−μα²/2,∞) | sound |
| Coulomb Wronskian (l.1988) | DLMF 33.2.12 | 𝒲{G,F}=𝒲{H^±,F}=1 | matches |
| Kummer Wronskian (`Suggested.lean` 248) | a=1,b=2 | 𝐌=(e^z−1)/z, U=1/z; 𝐌U′−𝐌′U = −e^z/z²; −z^{−b}e^z/Γ(a) = −e^z/z² | sound; DLMF 13.2.34 |
| Stieltjes inversion (`Suggested.lean` 263) | μ=δ_λ, a<b | Im(λ−E−iε)⁻¹ = ε/((λ−E)²+ε²); π⁻¹∫_a^b = π⁻¹[arctan((b−λ)/ε)−arctan((a−λ)/ε)] → 1, ½, 0 for λ inside, at an endpoint, outside | sound, sign of `resolventTransform` confirmed at the pin |
| Position examples (l.2108–2109) | 1_[a,a+1]; u_k=e^{ikx}χ | ∫_a^{a+1}x²dx = a²+a+1/3; P₊u_k=(−kχ+iχ′)e^{ikx}, norm ≥ k−‖χ′‖; −∂²(e^{ikx}χ) = (k²χ−2ikχ′−χ″)e^{ikx} | sound |
| Weyl coefficients (l.2127) | T_sψ(x)=ψ(x−s/2π), M_tψ=e^{itx}ψ | M_tT_s = e^{+ist/2π}T_sM_t; W_+ product coefficient e^{i(s′t−st′)/4π}; W_− coefficient e^{i(st′+3s′t)/4π} | both as stated |
| Hermite normalization (l.1937) | ψ=Σh_n/‖e_n‖ | Σ1/(√π2ⁿn!)<∞ so ψ∈L²; ⟪ψ,e_n⟫ = ‖e_n‖/‖e_n‖ = 1 | sound |
| Resolvent coefficient (l.1943) | a_n=1/(λ−2n−1) | (2n+1)a_n → −1, not square-summable: a ∉ D(H) although a ∈ ℓ² | README's reading sound |
| Gaussian realization (l.1318) | a↦∂_ξ, a†↦ξ−∂_ξ | Φ(e)=(a+a†)/√2 ↦ ξ/√2; Φ(ie)=i(a†−a)/√2 ↦ i(ξ−2∂)/√2 | sound |
| `S_t` symplectic (l.1867) | S_t=cosh t+sinh t·C | Im⟨S_tx,S_ty⟩ = (cosh²−sinh²)Im⟨x,y⟩ since ⟨Cx,Cy⟩ = conj⟨x,y⟩ and the cross terms are real | sound |
| `FiniteFrameFunction` at n=0 (`Suggested.lean` 147) | unique empty basis | Σ over Fin 0 = 0 = weight; `weight_nonnegative` holds | sound |
| `operator_one` (`Suggested.lean` 203) | g=h=1 | U₁U₁ = ω(1,1)U₁ = U₁; U₁ surjective isometry hence invertible, so U₁=1 | sound |
| `kummerM_differential_equation` at b=−n | Γ(−n)=0 | kummerM ≡ 0 satisfies the equation; `hb` unused | R12 |

Ownership statement: against main, the board packages and the open pull requests named in the brief, the objects of QF0 (cross-space projective collineation theorem), QF1's Mackey/Segal interfaces, the Banach Hilbertization theorems, QF2's finite frame-function theorem, QF3's state-dependent outcome laws, QF3.G's Jordan reconstruction and Connes' cone comparison, the Naimark and instrument laws and the hydrogen expansion theorem have no other owner; QF5.P, QF5's Whitehead and `H²_lc` material, QF6a's position/momentum and QF4's permutation sectors are NQS's (R02); Wigner's theorem is NQS P.1's. The RQFT folder was read through the roadmaps tool, not from a checkout, so its Lean names were not compared with this roadmap's.

## Not verifiable

- Dooley, *Foundations of Quantum Mechanics* (course notes, 34 pages) and Grundling, *MATH3680 Quantum Mechanics* (225 pages): the sources service holds no local copy and finds no legal copy; the pull request says the text was read from images by an AI reader. Every “Dooley p.N” and “Grundling p.N” locator in the seeded sample (QF1.G p.11, QF3.G.Model p.7, Grundling pp.106, 121–126, 161–162, 168, 216–225, SU(3) pp.27–28) is unverifiable; the mathematics attributed to them was checked by computation (table).
- Gudder–Boyce 1970, *Int. J. Theor. Phys.* 3, doi 10.1007/BF00674006 (QF1.S.GudderBoyce, Theorems 6.1, 6.4, Corollaries 6.2–6.3): paywalled; uncertified.
- Alfsen–Shultz–Størmer 1978, *Adv. Math.*, doi 10.1016/0001-8708(78)90044-0 (Proposition 2.7, Corollary 2.10): paywalled; the ResearchGate link at README line 598 is not a legal source.
- Alfsen–Shultz 1998, *PNAS* (PMC22571; Theorem 1, Corollary 2): PMC answered with a browser check and pnas.org with HTTP 403.
- Alfsen–Shultz 1978, *Acta Math.* 140, doi 10.1007/BF02392307 (§2, pp.158–159): Project Euclid's download is bot-blocked.
- Iochum–Shultz 1983, *J. Funct. Anal.*, doi 10.1016/0022-1236(83)90008-3 (§1 p.318, Definition 1.2, Proposition 1.8, Theorems 1.5, 2.9–2.10): paywalled.
- Kakutani–Mackey 1944, *Ann. of Math.* (Theorems 1–2, the real case): JSTOR only.
- Łuczak–Podsędkowska 2015, doi 10.1007/s10773-014-2485-y (Theorem V.7): paywalled.
- Pulmannová 1978 (Theorems 1–5): no bibliographic data in the README to search for (R11).
- Varadarajan 1971 p.136ff, Conway VII.9 exercise 7, Holevo, Peres, Davies, Reed–Simon, Mackey 1963/1968: books, cited for standard facts; not opened.

## Source issues

- none
