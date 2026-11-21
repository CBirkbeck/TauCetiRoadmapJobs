# Review of SeesawForThetaChains (pull request #2913 at 6a874c7)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/SeesawForThetaChains/`
**Verdict:** needs changes

**Summary.** Changes are needed for one finding: 6.2c asks the map `τ` between the two lines to be an anti-isometry, but in the README's own conventions, in its instance 6.2 and in the formal proof it is an isometry (up to a positive scalar), and with an anti-isometry the integrand of 6.2d is not invariant. Everything else sampled agrees with the formal proof at its locators and with the supplier sections. There are eight small corrections and one format note, none blocking; the human reviewers are asked about the scope and licence of the formal proof, the only source.

## R01 (P2) — In 6.2c the map `τ : L′ → L` must be an isometry up to a positive scalar, not an anti-isometry

An implementer who states 6.2c with an anti-isometry gets a hypothesis that the chain instance does not satisfy, and under which the function `Θ_Y` of 6.2d is not defined.

In 6.2c (line 117) the README takes "`τ : L′ → L`, `τζ′ = −ζ`, an anti-isometry up to the scalar by which the convention identifies the Weil representations". Three checks give the other sign.

- The instance. 6.2 applies 6.2c "with `ζ′ = ζ = z_{m,u}`" (line 157), so `L′ = L = ⟨z_m⟩` and `τ = −1`, an isometry.
- The conventions. Both pairs are homomorphism pairs with the form `Tr_{E/F}(δ_T·tr(x^†y))` (Conventions). If `⟨τa, τb⟩ = c⟨a, b⟩`, then for `x = (τw)^†`, `y = (τw′)^†` in `Hom(L, W₀)` one has `tr(x^†y) = c·conj(tr(w^†w′))`, and since `conj δ_T = −δ_T` the form of `Hom(L, W₀)` pulls back to `−c` times the form of `Hom(W₀, L′)`. 6.2d (line 123) needs the two theta functions to have "inverse central characters", that is `−c = −1`, so `c = 1`. With `c = −1` the product has central character `ψ²` and the integral over `[Hom(W₀, ⟨ζ′⟩)]` defining `Θ_Y` is not of an invariant function.
- The formal proof. `Development/AbelianVarietyTheory/Definitions/LatticeFrames/IsThetaFam.lean` lines 124–127 (`GlobalTheory.Unf.Link`) asks `τζ′ = −ζ` and `⟨ζ, ζ⟩ = ξ₀ξ̄₀·⟨ζ′, ζ′⟩`, a positive scalar. The minus sign appears only in the last double step: `GlobalTheory.Unf.SeeLast` (`IsQuasiFam.lean` line 113) has `−ξ₀ξ̄₀`, which is the `⟨ζ, ζ⟩ = −⟨z, z⟩` of 6.3.

The smallest change: in 6.2c write "an isometry up to the positive scalar by which the convention rescales the form of `L′` (`1` when both pairs are in the normal form with `δ_T`)", and say that the identification `w ↦ (τ∘w)^*` then reverses the symplectic form, which is why `Y` and the kernel of 6.2d have inverse central characters.

## C01 — Four statements have no route or no locator although the formal proof states and proves them

6.6 (e) says of the passage of the `S_j` to the front of the chain that it "is used and its proof is not given here" (line 211), and 6.7 says the same of the row form entering through the `ε_β` (line 229); 6.2c and 6.2d carry no locator. A reader cannot check these four. The declarations exist:

- 6.6 (e), last clause: `Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/NotMemQBase.lean` (`GlobalTheory.MiTop.LinkCommutes`: a similarity `S`, `r > 0`, `s ≠ 0`, the same for all tuples), proved in `…/ThirdPlaceSeries/LinkCommOfLaws.lean` (`GlobalTheory.MiTop.linkComm_of_laws_alt`).
- 6.7 (i): `Development/AbelianVarietyTheory/Definitions/LatticeFrames/PlaceLaws.lean` (`GlobalTheory.SeeSaw.QLaw`, with `QLast` for (ii) and `QFin` for (iii)).
- 6.2c: `Development/AbelianVarietyTheory/Definitions/LatticeFrames/IsQuasiFam.lean` (`GlobalTheory.Unf.LinkLaw`), proved as `GlobalTheory.T.bessel_level_step_fourierJacobi_period_link`.
- 6.2d: the same file (`GlobalTheory.Unf.UnfFB`), proved as `GlobalTheory.T.fourierJacobi_period_unfolding_of_witt_descent`.

## C02 — 6.2a and 6.2b cite the formal proof without recording its form, which is narrower

The paragraph "Statements of the formal proof" (line 82) promises that the form the proof establishes is recorded at each target. 6.2a and 6.2b are stated for any quadratic extension of number fields. `GlobalTheory.T.unfold_over_flagUnipotent_thetaLift` and `GlobalTheory.T.besselPeriod_thetaLift_unfolding` are stated for the CM host of the chain (`D : D7`) and, the second, under the hypothesis `GlobalTheory.Unf.Descent D` (Weil data exist on the cores of every pair, `IsQuasiFam.lean` lines 25–28). Would add one sentence at each target saying so, as 6.12, 6.14 and 6.15 do.

## C03 — The layer introduction cites TwistedAutomorphicDescents §1.1, which is later in the merge order and absent from the supplier contracts

Line 97 identifies `Bes` with "the bilinear Bessel period `P_O(f, φ)` of TwistedAutomorphicDescents §1.1". The comparison is accurate (its §1.1 defines `P_O(f, g) = ∫_[H] B_O(f)(h)g(h)dh`, case (ii) for `g` cuspidal on `H` with trivial split centre), but that roadmap is placed directly after this one in the merge order and appears in neither the Dependencies nor the contracts nor the description. Nothing is consumed, since `Bes` is defined here in full. Would either drop the sentence in favour of GanGrossPrasadUnitaryGroups §4.1, already cited in 6.2 for the same comparison, or say that the comparison is not a dependency.

## C04 — 6.13 uses the rapid decay of cusp forms, which its *Needs:* line does not list

The route of 6.13 (o) and (b) (line 309) uses rapid decay twice, and the formal statement it cites, `GlobalTheory.T.pairForm_of_conjVec_of_botHyp`, takes `GlobalTheory.Published.CuspRapidDecay` as a hypothesis. The *Needs:* line (line 311) omits ArithmeticLocallySymmetricSpaces §ALS.F.6 (iii), and that supplier's contract says "Used in 6.2" only. Would add it to both.

## C05 — That `E/F` is unramified at every finite place is used but not recorded

6.4 assumes `E_v/F_v` "unramified quadratic or split" (line 179), and 6.8 applies 6.4 at every place outside the type primes, the level prime and the twist places. The introduction (line 91) only says these places are "of odd residue characteristic or split", which does not exclude an odd ramified place. The fact is in the overview of ThetaChainsOnDefiniteUnitaryGroups ("so `E/F` is unramified at every finite place") and in the formal proof (`GlobalTheory.T.isTameFinitePlaceHermitian_all`). Would add it to the sentence of line 91 with that citation.

## C06 — The docstring of `Suggested.lean` says Mathlib has "no theta series"; the pins have classical ones

Line 20 of `Suggested.lean`. Mathlib has `jacobiTheta` (`Mathlib/NumberTheory/ModularForms/JacobiTheta/OneVariable.lean:29`) and Tau Ceti has `thetaSeries` of a lattice (`TauCeti/NumberTheory/ModularForms/ThetaSeries/Basic.lean:102`). Neither is the theta functional of a dual pair, so no headline becomes statable. Would write "no theta kernel or theta functional of a dual pair".

## C07 — Three sentences of the description no longer describe the head

- "The targets marked *NEW* … have the formal proof as their source, cited as a whole." At the head every such target, and seven of the *KNOWN* ones, cite a file and a declaration of the formal proof (60 locators).
- "Of the roadmaps on main it uses MetaplecticAutomorphicForms, AutomorphicFormsOnReductiveGroups and AdelicAlgebraicGroups". The supplier contracts also use ArithmeticLocallySymmetricSpaces, AutomorphicLFunctionsAndLocalFactors, FourierDeligneTransform and RepresentationTheory/CompactGroups, all on main.
- The closing sentence, which says that two of the repository's automatic checks fail because the roadmap is "not yet in the order". The roadmap is now in the merge order, after GanGrossPrasadUnitaryGroups, so a reader is told of a failure that no longer occurs; the sentence would be dropped or say that the roadmap is placed after GanGrossPrasadUnitaryGroups.

## C08 — 6.14 (d) describes `V` in two ways

The statement (line 317) says `V` is the identification of 6.13 (o) "composed with a central translation common to all words"; the route (line 326) says "with the trivial central translation". The formal proof has a central element `z` of `U(Y_0)(𝔸_f)` common to all words (`GlobalTheory.MiTop.JointCondition`, `FormsAtZero.lean`). Would use one description.

## N01 — About half of the locators name a `Prop`-valued definition, not the theorem that proves it

For example 6.2b names `GlobalTheory.Unf.UnfBF`, 6.3 `GlobalTheory.Unf.LastLaw`, 6.9 `GlobalTheory.SeeSaw.BiAct`; the theorems are `GlobalTheory.T.besselPeriod_thetaLift_unfolding`, `GlobalTheory.T.doubleLiftPeriod_rankZero_fubini_compactQuotient` and `GlobalTheory.T.seeSawWeilBiAction_commutes`. Naming the theorem as well lets a reader tell a proved statement from a hypothesis carried along.

## Questions for the author

- 6.4, 6.6, 6.8 cite `GlobalTheory.SeeSaw.VacLaw` and `GlobalTheory.SeeSaw.CVEq`. Both are fields of the structure `GlobalTheory.SeeSaw.PlaceLaws`, which the theorems I opened take as a hypothesis (`GlobalTheory.T.seeSawLastTwoSteps_doubleLiftPeriod_value`). Which declaration proves `PlaceLaws` for the data of the chain? I did not find it by search in the 175,000 files.
- 6.14 says the formal proof gives only "a unit at `𝔭`" for `ζ_ℂ(u, ξ_𝔭)`. `Formalism/LocalToGlobal/IndefiniteReal/IsometricPeriodsOfHypotheses.lean` lines 92–95 (`MIUnit`) states `ζC u t ^ n = 1` for some `n > 0`. Is `MIUnit` proved for the chain, in which case the root of unity of 6.12 is in the formal proof, or only assumed? I did not trace its use.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 6.2a (headline 1) | `ρ = 1`, `q₀ = 0` and `q₀ ≠ 0`; README Gram `q₀E_{ρρ}` against formal `IsBase` | `u^*·E_{ρρ}·u = E_{ρρ}` for unitriangular `u`; `x = 0` killed by (T2), wrong Gram by (T1); formal `IsTh.cen`, `.dep` = (T1), (T2) | holds; formal is for `D7` | C02 |
| 6.2b | formal `UnfBF` | `IsQuotIntL1`: `f(h) = ∫_R F(rh)`, `z = ∫F`; hypotheses `IsContAut`, `RapidDec` as in README | matches | C02, N01 |
| 6.2c | chain `ζ′ = ζ`; `c = ±1` | pulled-back form `= −c·`form; inverse central characters need `c = 1`; formal `Link.norm` scalar `ξ₀ξ̄₀ > 0` | README sign wrong | R01 |
| 6.2d | formal `UnfFB`; base point `(e′, ζ′)` | Gram `⟨ζ′,ζ′⟩E_{ρ+1,ρ+1}`; `JacLev (σ+1)`, `BesLev σ`: one plane fewer | matches | C01 |
| 6.1 | formal `sec`, `BuDefQ` | `sec = incl ∘ (ι|_Q)⁻¹ ∘ proj_{ι(Q)}`, `Q = V0 ⊓ Uᗮ`; `Bu = perCol(·, sec x)` | matches | none |
| 6.2 | even `j ≤ m − 4` | `h_j = h_{j+1} = (m−2−j)/2 = ρ+1`, `h_{j+2} = ρ`; formal `DoubleStep` needs `RapidDec` of the inner lift, as README | holds | none |
| 6.3 | `ζ = z_m`, `z` | `⟨z,z⟩ = T(u_*) = −⟨z_m,z_m⟩`; formal `SeeLast` scalar `−ξ₀ξ̄₀`; triple integral over compact quotients | holds | none |
| 6.4 | formal `Tame`, `VacLaw` | `Tame = ExtUnramAt ∧ (2 ∉ v ∨ split idempotent)`; contraction of vacua off `T(u)` is a bi-vacuum | matches | C05 |
| 6.5 (c), Check | `j`, `m` even; `k, r_S ≥ 1` | `c(j) = 1 + 2h_j = m−1−j` odd; boxes `ϖ^{∓(r′+1)}𝒪ⁿ`; `(z_m, f_{r_S})` not simple, no `(z_m, β_i)` to generate it | holds | none |
| 6.6 (a), (b), Check | `n = 1`, `Λ = 𝒪`; last coordinate ideal `𝒪` or `ϖ⁻¹𝒪` | `1[z ∈ ϖΛ′] = q^{−n′}Σ_ϑ ϑ(z)`; three shapes; `q−1` pairs, new forms `q−2`; formal constant `q^{−card}` of the target | holds | none |
| 6.6 (e) | formal `TLaw`, `LinkCommutes` | `bl φ = cT·bl(Sad φ)(dT ⊗ dT ∘ op)`; `‖Sφ‖ = r‖φ‖`, `s ≠ 0`, all tuples | matches; locator missing | C01 |
| 6.7 | formal `QLaw`, `QFin` | sum over `α, γ, β` with `dQ(α,γ) ⊗ dQ(γ,β)`, `trc(ε_β)f`, factor `cQ`; support `R_J·T₁·K₁`, `T₁` finite | matches | C01 |
| 6.8 | formal `CVEq` | `cV = kap·(sc·sc)·cQ·cG·cT`; last step without `kap` | matches | none |
| 6.9 | formal `BiAct`; `E` CM | actions commute and preserve bi-theta functions; `E_∞^× = (ℂ^×)^f` connected | holds | N01 |
| 6.10 | formal `PerX`; variance | `perT = cP·a·tail`; both sides linear in `Υ`, conjugate-linear in `φ′`; `ι_top·c_P = V_T·vol_f(J_1)·s(ξ)` | holds | none |
| 6.11 | formal `MainX`, `cTop`, `cBot`, `up` | `cTop = ∏ cV(2i)cK(2i)cK(2i+1)·cP`, `cBot = ∏_{j<m} cI(j)`, `up = K K S` iterated; (b) from (a): map on `0` or `ℂ` | matches | none |
| 6.12 | index bookkeeping; `q_v = 5` | `c_Q(j)/(c_I(j+1)c_I(j+2))`: `idx` cancels, stages `1..m` covered once; formal `UnitRatio`: `(x/y)^n ∈ ℚ^×`, primes in `Q(ξ)`; `q+1 = 6` | holds | question |
| 6.13 | formal `EvalAll`, `PerLaw`, `PairingFormCondition`, `BottomRelation` | semilinear bijection with `star`; `⟨φ̄, P_uT⟩ = c∫ per(…)`; `κ ≠ 0`; isometry `R` of `M_u` | matches | C04 |
| 6.14 (headline 2) | `ξ = 1`; chain of the route | `ζ_ℂ = c_bot(ξ)c_top(1)/(c_bot(1)c_top(ξ))`, `= 1` at `ξ = 1`; `D_1 sec x = x`; formal `BesselId`: `V`, `U` isometries, `a ≠ 0` | holds | C08 |
| 6.15 (headline 3) | `B_u = 0`, `B_u ≠ 0` | `B_u ≠ 0` ⇒ `B_u∘ι_ξ ≢ 0` ⇒ `ζ = σ₀⁻¹ζ_ℂ`; formal `ZetaOK`: `ζ(μ0) = 1`, `ζ ≠ 0`, `v_w(ζ(u, μ(w))) = 0` | holds | none |
| Conventions | `δ_T`; `|Φ|` | `(√−d/d)·√−d = −1`; `[E:K] = f` | holds | none |
| Introduction, `Bes` | TwistedAutomorphicDescents §1.1 | `P_O(f,g) = ∫_[H] B_O(f)g`, bilinear; merge order: this roadmap, then that one | accurate, later roadmap | C03 |
| `Suggested.lean` docstring | library claims | `NumberField.AdeleRing`, `IsCMField`, `Matrix.unitaryGroup`, `SchwartzMap` exist; `jacobiTheta`, `thetaSeries` also exist | one clause inexact | C06 |

- Source locators checked against the text: all 60 locators into [FormalProof] resolve (file and declaration, in the operator's copy of the source at commit `e50d098`); 34 declarations read and compared, covering the fifteen sampled targets. The README flags no locator as unverified.
- Library declarations opened at the pin: `Mathlib/NumberTheory/NumberField/AdeleRing.lean:56`, `Mathlib/NumberTheory/NumberField/CMField.lean:70`, `Mathlib/LinearAlgebra/UnitaryGroup.lean:105`, `Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean:75`, `Mathlib/NumberTheory/ModularForms/JacobiTheta/OneVariable.lean:29`, `TauCeti/NumberTheory/ModularForms/ThetaSeries/Basic.lean:102`.
- Cross-roadmap citations resolved: every cited section heading exists at the open heads or on main (17 roadmaps); statements read for ThetaChainsOnDefiniteUnitaryGroups §§2.2, 2.8, 2.9b, 3.7, RowTowerAndRallisIdentities §§5.4, 5.6, 5.9, BesselPoincareSeriesAndGramBounds §5.21, TwistedAutomorphicDescents §1.1, AdelicAlgebraicGroups §§3.4, 3.5, ArithmeticLocallySymmetricSpaces §ALS.F.6 (iii), AutomorphicLFunctionsAndLocalFactors §AL.0.1.7, FourierDeligneTransform §0.2, MetaplecticAutomorphicForms §§5.2, 6.15, 6.17. The ids other roadmaps cite from this one (6.1, 6.5, 6.8, 6.13, 6.14, 6.15) all exist.
- Dependency check: `depcheck: 171 roadmaps, 1996 edges, 0 problem(s)`; no UPWARD or CYCLE line. The family's sub-roadmaps it consumes are open pull requests that add new folders.
- Elaboration of `Suggested.lean` with `lake env lean`: exit 0, no message. The file declares nothing, so there is no `#check @name` comparison and no one-tactic probe to run; no headline is statable at the pins (no adelic unitary group, automorphic form, Weil representation or period in Mathlib or Tau Ceti).
- Automatic checks: all passed at the worker. The only changes outside the folder are the three files of the family index, which belong to this pull request.
- Ownership: Fourier–Jacobi periods and the Bessel-to-Fourier–Jacobi unfolding of theta lifts have no other owner on main or in the open pull requests searched (GanGrossPrasadUnitaryGroups leaves Fourier–Jacobi to its Part II; RowTowerAndRallisIdentities owns 5.1–5.12).

Overlap check: read RowTowerAndRallisIdentities, ThetaChainsOnDefiniteUnitaryGroups, BesselPoincareSeriesAndGramBounds, GluedTargetAndDivisionInequality, ThetaKernelsForUnitaryDualPairs, ThetaLiftsForDefiniteUnitaryGroups, GanGrossPrasadUnitaryGroups, TwistedAutomorphicDescents; nothing shared (the global Bessel period is GanGrossPrasadUnitaryGroups §4.1 and TwistedAutomorphicDescents §1.1, cited; `Bes` here is the variant for continuous automorphic functions on an anisotropic group, and says so).

Source independence: 39 passages compared with 2 sources (34 declarations of [FormalProof], which is Lean code, and 5 prose passages against the announcement: the overview, the Markers, 6.1, 6.12, 6.14), none shared; largest share [FormalProof], 60 of 60 locators; contents compared with [FormalProof]: it has no table of contents, and the cited declarations lie in some forty files of unrelated directories in no order matching 6.1–6.15: independent.

Research link: Layer 6 of the chain of theta lifts in L. Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions (announced 2026); its general statements are Bessel and Fourier–Jacobi period unfoldings of theta lifts and Kudla's seesaw, in the setting of the Gan–Gross–Prasad periods. Rests on the README, the family index and the announcement.

## Not verifiable

- The claim in 6.15 that [FormalProof] states (a) and (b) under the additional hypotheses of RowTowerAndRallisIdentities §§5.7, 5.9–5.12: the hypotheses of `Formalism.BasicNotions.D7.BuRational` were not traced through the structure `D7`.
- Which declaration proves `GlobalTheory.SeeSaw.PlaceLaws` for the chain (see the questions).

## Source issues

- none

## For the human reviewers

- Scope: the only source is [FormalProof], a Lean development announced on 20 November 2026, unrefereed; the announcement says no written account exists yet (Announcement lines 45–49, 72–76).
- Scope: several cited statements of [FormalProof] take propositions named `GlobalTheory.Published.*` (`DiscreteSeriesClassification`, `CuspRapidDecay`, `HarishChandraModules`) as hypotheses, for example `PairFormStatement.lean` line 20; whether they are discharged elsewhere was not checked.
- Licence: [FormalProof] was read in the operator's local copy of the public repository named in the References; the licence of that repository was not checked.
- The README states 6.12 and 6.14 (c) with roots of unity as "this roadmap's own" sharpening of the formal statement (a rational number with primes at the twist places); only the index bookkeeping of its route was recomputed.
