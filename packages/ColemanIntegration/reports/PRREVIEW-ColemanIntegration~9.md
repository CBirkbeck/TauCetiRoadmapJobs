# Review of ColemanIntegration (pull request #2864 at 3aafbcf)

**Verdict:** needs changes

**Summary.** Changes are needed, for one finding: the complex Artin L-function theory that L3.Fd.1 and L3.Fd.2 import is cited to AdelicAlgebraicGroups §2.4, which states it only for character modules of algebraic groups and itself names AnalyticNumberTheoryPartI §2.18a as the owner; the four citations should point there. The mathematics sampled is sound, and the library names this change introduces all resolve at the pins. There are three small corrections (a false statement that the pinned libraries lack a formal primitive, a description written before the RestrictedPowerSeries revision merged, two page locators off by one) and one format note. Nothing is left for a human to decide.

## R01 (P2) — The Artin L-function inputs of L3.Fd.1 and L3.Fd.2 are cited to AdelicAlgebraicGroups §2.4, which does not state them

An implementer of L3.Fd.1 who opens the cited section finds no general Artin L-function there, so the "imported" complex theory behind the p-adic Beilinson statement L3.36 has no supplier at the place the contract names.

The contract (line 3344) says AdelicAlgebraicGroups §2.4 gives "for a finite-image complex Galois representation, the local factor on inertia invariants, its induction formula and the Euler product of the global `L`-function on `Re s > 1` with its continuation". The same attribution is in the *Needs* line of L3.Fd.1 (line 2661), in Scope and ownership (line 3303), and in the *Needs* line of L3.Fd.2(a) (line 2680), which also credits §2.4 with "the one-dimensional Artin–Hecke comparison and complex continuation". On main, AdelicAlgebraicGroups §2.4 is "Gauge forms and Tamagawa normalization". Its item *convergence-factors* (README line 1641) treats only the representation `X*(G_F̄) ⊗ ℂ` of a connected affine algebraic group and says its local factors and `L`-function "are those of AnalyticNumberTheoryPartI §2.18a". The section has no induction formula and no Artin–Hecke comparison. That roadmap's ownership paragraph (line 5294) says the finite-image Artin factors, their induction identity and Brauer continuation "are owned by AnalyticNumberTheoryPartI §2.18a; AA.2.4 consumes them". AnalyticNumberTheoryPartI §2.18a on main (README line 1565, "Artin `L`-functions: local factors, induction and Brauer continuation") states exactly the four things consumed here: `P_v` on inertia invariants at every finite place, `L_F(s, Ind σ) = L_M(s, σ)`, the one-dimensional comparison with the primitive Hecke character, and Brauer continuation.

The smallest change: in the four places, replace "AdelicAlgebraicGroups §2.4 (convergence factors)" by "AnalyticNumberTheoryPartI §2.18a" (it is on main and earlier in the merge order), and drop the AdelicAlgebraicGroups entries from Scope and ownership and from the supplier contracts, since nothing else here uses that roadmap.

## C01 — The Conventions bullet says neither pinned library has a formal primitive of a power series, but the pinned Tau Ceti has one

An implementer of L0.2–L0.5 would build a second primitive when the library already has it. The bullet (line 55) ends "neither pinned library has a formal primitive of a power series". At the Tau Ceti pin, `MvPowerSeries.primitive` (`TauCeti/RingTheory/MvPowerSeries/Primitive/Basic.lean:58`) is the linear termwise primitive over a `ℚ`-algebra, with coefficient `(ν_i)⁻¹·a_(ν−e_i)`; `MvPowerSeries.pderiv_primitive` (line 121) and `MvPowerSeries.coeff_primitive_pderiv` (line 142) are the two identities of L0.3, and `MvPowerSeries.eq_primitive_iff` (line 152) is L0.4 with `c = 0`. `PowerSeries ℚ = MvPowerSeries Unit ℚ` holds by `rfl`. The sibling file `Primitive/GaussNorm.lean` has the Gauss bound and the radius-loss restrictedness of L0.5(b) (lines 117 and 132), and `NormedField.exists_norm_inv_natCast_le_rpow` (`TauCeti/Analysis/Normed/Field/NatCast.lean:45`) is the bound `‖1/n‖ ≤ n^s` of L0.1.

The repair: drop the last clause of the bullet, and give L0.1–L0.5 *In Tau Ceti:* lines naming these declarations; the items and their statements stay, and the one-variable names of L0.2 can remain as proposed adapters. The matching clause of the description goes with it.

## C02 — The description describes RestrictedPowerSeries as it was before its revision merged

The description says "On main, RestrictedPowerSeries §§2.1 and 7.1 name no declaration … so the contract holds whichever of the two merges first", and "It does not depend on that pull request". Main now contains that revision: its §2.1 (line 470) names `PowerSeries.evalAt` and its §7.1 (line 1217) names `PowerSeries.OnOpenDisc`, and its `Suggested.lean` no longer declares the two prototypes, while this roadmap's README on main still cites `eval₂`. A reader is not told that the contract on main now names declarations that no longer exist and that this change repairs it. The text would read: "RestrictedPowerSeries, as revised on main, states §§2.1 and 7.1 on these Tau Ceti declarations and has removed the prototypes `OnOpenDisc` and `eval₂` that this roadmap's contract on main still names; this change brings the contract into line."

## C03 — Two page locators are off by one

- L2.2 cites "BHYY §3.1, p. 14". The statement about torsion points and the residue disc of the identity is at the foot of p. 13 (BHYY line 495); p. 14 opens with Definition 3.1 (BHYY line 505).
- L2.25 cites "GSWZ Proof of Lem. 3.1, `(175)`, p. 37". Printed p. 37 carries (174) (GSWZ line 1965); Lemma 3.1 and (175) are on printed p. 38 (GSWZ lines 1975–1977).

## N01 — Some words are still fused to code spans or split across them

For example "the identity sendsv tov" (line 1315), "`1-x,1-u,1`-xu" (line 1703), "``HurwitzZeta.expZeta``(x,k)" (line 1823), and "nontrivial `primitive θ`" and "not `a p`-power" (lines 1791 and 3136).

## Verified sound

| Statement | Instances tried | Values computed (README side / library or source side) | Result | Change |
|---|---|---|---|---|
| L3.Fd.1, L3.Fd.2(a) supplier | AdelicAlgebraicGroups §2.4 and its ownership paragraph; AnalyticNumberTheoryPartI §2.18a, on main | §2.4: only `X*(G)⊗ℂ`, no induction, no Hecke comparison; §2.18a: all four inputs | cited section does not state them | R01 |
| L0.10 (restated on `NormedSpace.log`) | `u = 0`; `ℚ₂`, `u = 2`; `ℚ_p`, `q_n = p^(−n)` | value 0, derivative 1; `1/3`; `‖q_n‖_p = p^n` unbounded so no continuous `ℚ≥0` action | true; Tau Ceti lemma needs `ContinuousSMul ℚ≥0` (`Logarithm/Basic.lean:68`) | none |
| Conventions: no primitive at the pins | `#check` of four Tau Ceti declarations; `PowerSeries ℚ = MvPowerSeries Unit ℚ` | all elaborate; `rfl` succeeds | claim false | C01 |
| L0.8 / `existsUnique_primitive_disc` | recentring at `b`; `G′ = 0` | `(n+1)g_(n+1) = 0` forces `g_(n+1) = 0` in characteristic 0 | true; README = Lean | none |
| L0.12 / `exists_laurent_primitive_iff` (Theorem) | `n = −1`; `T⁻² dT`; single radius | `0·g(0) = a(−1)`; primitive `−T⁻¹`; closed case fails by L0.6, so openness needed | true; BBK Rem. 2 on p. 3 | none |
| L0.15 / `IsLogBranch` (Definition) | `a`, zero map, `x = p` | `log_a(p) = 0 + a·1`; zero map fails series law | determined on `ℂ_p^×`; F §2.1 | none |
| L0.21 / `logBranch_laurent_transcendental` (Lemma) | degree 1 with `f₁ = 1`; disconnected open `I` | residue of `dT/T` is `1 ≠ 0`; sub-annulus argument still applies | true | none |
| L0.22 / `existsUnique_logLaurent_primitive` (Theorem) | `F = T⁻¹`; kernel | `G = l`: `k=0,n=−1` gives `0 + 1·1 = 1`; kernel `K`, killed by `G₀(0) = 0` | true; coefficient equation matches `d` | none |
| L1.6 (Lemma) | fixed point of `y^(q^m) + πH(y)` | `ρ ≤ max(ρ^(q^m), ‖π‖)` gives `ρ ≤ ‖π‖ ≤ ‖π‖^(1/q^m)` | true (stated bound weaker than available) | none |
| L1.8 (Lemma) | `q = 2`, `λ = 2`; empty product; weight 0 | `2^m > 1`; `1`; `λ = 1` | true; `n ≥ 1`, `w ≥ 1` needed | none |
| L1.18 (Theorem), L1.19 (Construction) | `log_a` on `𝔾_m`; `p ≥ 5`, discs of 2, 3 | `log_a(1) = 0`, `d log_a ≠ 0`; indicator primitive gives `log_a(2/3) + 1` | Checks true; F Prop. 2.4 p. 8, BBK Thm. 5 p. 4 | none |
| L2.9 inversion (Theorem) | `k = 0`; `k = 1`; constant `C_k`, `m = 2` | `z/(1−z) + 1/(z−1) = −1`; `−log z`; `2C = 2^(1−k)C` gives `C = 0` | true; BDJ (1.2) p. 3 of v2 | none |
| L2.10 branch change | `k = 1`; norm of `z` above 1; `z` in the outer annulus of the disc of 1 | `−βv(1−z)`; `v(z) = v(1−z)`; `v(1−z^p) = p·v(1−z)` cancels | true | none |
| L2.11 (Lemma) | `m = 2`, `p` odd; `k = 1` sequences | `Li_k(−1) = (2^(1−k) − 1)ζ_p(k)`; `−na` and `−na − log(1+p)` | true; F Thm. 2.13 p. 10, Lem. 2.14 p. 11 | none |
| L2.12 (Comparison) | `p = 5`, `k = 2`, disc of 2 | `2, −2 ≡ 3, 4` in three discs: defect exactly 1; `c = p^(kf)c` gives `c = 0` | true | none |
| L2.18 (Definition, Lemma) | branch change; Frobenius; `dD` | `(β/2)(v(z)log_b(1−z) − v(1−z)log_b z)`; `Li₂^(p) − log z·Li₁^(p)/2`; DJ p. 6 | all three recomputed, agree | none |
| L2.2, L2.25 locators | BHYY p. 13–14; GSWZ printed pp. 37–38 | statement on p. 13; (175) on printed p. 38 | pages off by one | C03 |
| L2.69–L2.70 five-term (headline Theorem) | reflection, inversion; admissibility of the five arguments | `D(1−z) = D(1/z) = −D(z)`; `y/x` and both ratios avoid `0, 1, ∞` when `x ≠ y` | consistent; not statable, named in docstring | none |
| L3.13 / `LFunction_nat_eq_gaussSum_inv_mul_sum_complexPolylog` (headline) | `χ₋₄`, `k = 1`; `c = 0` term | `G = 2i`, sum `= iπ/2`, quotient `π/4`; `θ⁻¹(0) = 0` for `N ≥ 2` | true; README = Lean | none |
| L3.28 (headline Theorem) | parity of `Σθ⁻¹(c)Li_k(ε^c)`; `p = 5`, `χ₋₃`, `k = 2` | sum nonzero only if `θ(−1) = (−1)^(k−1)`; `θ` odd, `θω⁻¹` even | twist required; RJW Thm. 6.7(ii) p. 39 prints none | source issue |
| L3.29, L3.30 (Theorem) | `k = 3`, `m = 2`; `ψ = θω^(k−1)` | `Li₃(−1) = −¾Li₃(1)`; `ψω^(1−k) = θ` | true; BBdJR p. 23 | none |
| L3.36 (headline Theorem) and Conventions sign | `N = 3`, `n = 3`; `N = 4`, `n = 3`; `N = 2` | `χ(−1) = −1 ≠ 1`; `π(1⊗i) = 0`, `[−1]₃ = 4([i]₃+[−i]₃) = 8[i]₃`; `−2P₃(−1) = (3/2)ζ(3)` | matches BBdJR Prop. 4.17 p. 22; not statable, named | none |
| RestrictedPowerSeries contract | `PowerSeries.OnOpenDisc`, `evalAt`, `OnOpenDisc.evalAtHom` at the pin; main §§2.1, 7.1 | elaborated types: `ℝ → R⟦X⟧ → Prop`; `evalAtHom` needs `‖b‖ < R₀`, complete `A` | contract true | C02 (description only) |
| `Subgroup.indClassFun_indClassFun_subgroupOf` | elaborated type | `L ≤ T`, `L.FiniteIndex`, `f` conjugation-invariant | matches L3.Fd.2(d) | none |

- Source locators checked against the text: 24, in RJW (Thm. 6.1, Lem. 6.4, Rem. 6.6, Thm. 6.7, Rem. 3.39, Rem. 5.19), BBdJR (Rem. 3.23, Rem. 4.16, Prop. 4.17 and its proof, Rem. 4.19), F (Prop. 2.4, Thm. 2.13, Lem. 2.14), BBK (Rem. 2, Thm. 5, Alg. 8), BHYY (§3.1, Def. 3.1), GSWZ ((174), Lem. 3.1, (175)), DJ (p. 6), BDJ-preprint ((1.2), (2.4), Prop. 2.6). All correct except the two pages of C03.
- Library declarations opened at the pins: 14, eleven by `#check` in one file (`MvPowerSeries.primitive`, `pderiv_primitive`, `eq_primitive_iff`, `NormedField.exists_norm_inv_natCast_le_rpow`, `PowerSeries.OnOpenDisc`, `PowerSeries.evalAt`, `PowerSeries.OnOpenDisc.evalAtHom`, `Subgroup.indClassFun_indClassFun_subgroupOf`, `NormedSpace.log_eq_tsum`, `HurwitzZeta.hasSum_expZeta_of_one_lt_re`, `NormedSpace.one_le_logSeries_radius`) and three read in source (`NormedSpace.log`, `logSeries`, `log_eq_logSeries_sum`, Mathlib `Analysis/Normed/Algebra/Logarithm.lean:72–130`). No `logOneAdd` remains at either pin or in the README.
- Cross-roadmap citations resolved on main: 24 supplier roadmaps exist on main (GlobalNumberFields under Completed); section headings found for RestrictedPowerSeries §§1.1, 2.1, 2.4, 3.2, 7.1, 7.2, PadicFunctionalAnalysis §4.5, DirichletPadicLFunctions §0.6 (with its five named declarations), PadicDifferentialEquationsAndRigidCohomology RD.0.1, 0.2, 0.18, 0.36, 3.5, 3.12, 3.17, 3.18, K3BlochGroups §§3.1, 3.3–3.5, PolylogarithmFunctions §§1.1–1.7, 3.1, 4.2–4.7, 5.8, ArithmeticKTheory §3.4, MotivicEtaleKTheory §§2.0a, 2.2, 7.1, 7.2, 7.4, NewtonPolygons §§0.3, 0.5, AdicSpacesPartII §§R0.9, R1.9, PartIII §§R2.3, R2.4, R2.9, R3.4, R3.7, PartIV §§F1.2–F1.9, F1.11, F1.12, RigidAnalyticGeometry §7.3, GeometryOfNumbersAndQuadraticArithmetic §§6.1.1–6.1.3, 6.10, DerivedModuleAlgebra §0.K.1, ClassFieldTheory Layers 11–12. One does not state what is cited: R01.
- Record of the roadmap on main: the README at the merge base has 4 layers; none is removed or retitled, no heading other than the two pin headings changes, and `Suggested.lean` is unchanged. Nothing outside the folder changes.
- Automatic checks: every check passed. Dependency check output: `depcheck: 172 roadmaps, 2009 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ColemanIntegration/Suggested.lean` gives five `declaration uses sorry` warnings (lines 52, 68, 76, 97, 118) and nothing else. The elaborated types of the nine declarations were compared with the README; `IsLaurentOn` drops only instance binders its body does not use. One-tactic probe (`rfl`, `simp`, `infer_instance`, `aesop`) on a copy of the file: none of the five theorems closes. No `set_option`, no `lemma`, no sorried data.
- Previous review (same head, no finding): its three small corrections and its format note are unrepaired, as the head is unchanged; each was re-verified here and is carried as C01–C03 and N01.
- Headline theorems: Frobenius characterisation of integration (L1.20), uniqueness principle (L1.18), five-term relation (L2.69–L2.70), Coleman's formula (L3.28–L3.30), complex formula (L3.13), cyclotomic regulator (L3.15), Dirichlet-motive Beilinson statement (L3.36). Only L3.13 is statable at the pins and it is stated; the module docstring names each of the others with the missing carrier. L0.8, L0.12, L0.21 and L0.22 are stated as the L0 representatives.

Overlap check: read PadicHodgeRegulators, PeriodsAndSpecialValues, ZagierConjecturePolylogarithms, HabiroNahmSeries (open), ColemanIntegrationPartII, PolylogarithmFunctions, PadicDifferentialEquationsAndRigidCohomology and BorelRegulators (main); the first seven consume ColemanIntegration ids that are all present or supply to it, and BorelRegulators identifies its regulator with L3.Fc.1's map, owned here; nothing shared. The open DirichletPadicLFunctions revision was not read: its head is not among the checkouts given, and the roadmap is cited as it is on main.

Source independence: 24 locators and 5 further passages (L3.36 against BBdJR Prop. 4.17, L3.28 against RJW Thm. 6.7, L1.18 against F Prop. 2.4, L1.19 against BBK Thm. 5, L2.18 against DJ p. 6) compared with 8 sources, none shared beyond hypothesis lists that can be written one way (at most 6 consecutive words); largest share BDJ, 88 of about 430 locators, then RJW 78 and BBdJR 67; contents compared with BDJ-preprint §§1–7 and RJW §§1–13: independent. BDJ §§3–6 run in the order of L3.Fa, L3.Fb.1–2, L3.Fb.3–4, L3.Fb.5, an order the *Needs* lines force (K-groups before regulators before the integration functional before its value on symbols); these are sub-blocks of one layer that also holds L3.Fc, L3.Fd and the measure-theoretic half, and L0–L2 have no counterpart in either text. The BDJ version of record was not opened; the preprint was.

Research link: L3.28 is Coleman's 1982 formula for Kubota–Leopoldt values at positive integers (RJW Thm. 6.7; BHYY Thm. 1.1). L3.36 is Besser–Buckingham–de Jeu–Roblot 2009, Prop. 4.17, on the p-adic Beilinson conjecture for abelian Artin motives. L1 underlies Chabauty–Coleman (Balakrishnan–Bradshaw–Kedlaya 2010). Rests on the README and these sources as read.

## Not verifiable

- RJW page numbers marked "published" (Essential Number Theory 4, 2025) and BDJ published pages (Ann. Sci. ENS 2003): the versions of record were not opened; the arXiv numbering was checked instead.
- Lazard, Kedlaya, Serre, Weibel, Quillen, Feliu, BH, MP, BT, BF, W, BC and FPZ locators: outside this round's sample, not opened.
- The remaining statements of the 3393-line README outside the rows above were read only where a sampled target depends on them.

## Source issues

- **Error** in RJW at Theorem 6.7(ii), p. 39 (arXiv v2): the source gives the left side as the p-adic L-value of `θ` itself at `k`; it should be that of `θω^(1−k)`, since the right side vanishes unless `θ(−1) = (−1)^(k−1)` while the untwisted value vanishes for odd `θ`; affects a stated result.

## For the human reviewers

- none
