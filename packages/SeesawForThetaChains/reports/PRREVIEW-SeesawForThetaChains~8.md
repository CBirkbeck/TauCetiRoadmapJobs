# Review of SeesawForThetaChains (pull request #2913 at 4fee62d)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/SeesawForThetaChains/`
**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired. 6.2c now takes `τ` to be a similitude with factor `δ₂/δ₁` (an isometry for the pairs of the chain), which is the sign that the conventions, the instance 6.2 and the formal proof give, and the new sentence on central characters is correct. The eight small corrections are repaired, and every file, declaration and supplier section the repair cites was opened and says what the README attributes to it. One format note remains, not blocking; the scope and licence of the formal proof, the only source, are left to the human reviewers.

## N01 — Some locators still name a `Prop`-valued definition without the theorem that proves it

The repair names the proving theorem at 6.2b, 6.2c, 6.2d, 6.3, 6.4, 6.6 (e), 6.7 and 6.9. At 6.8, 6.10 and 6.11 (the definitions of `ValLastX.lean`, for example `GlobalTheory.SeeSaw.CVEq`) and at 6.13 (o), (a) (`GlobalTheory.Core.Mi.EvalAll`, `GlobalTheory.Core.Mi.SBes.PerLaw`) the locator is still the definition alone, so a reader cannot tell a proved statement from a hypothesis carried along. Naming the theorem there as well would finish it.

## Questions for the author

- 6.14 says the formal proof gives only "a unit at `𝔭`" for `ζ_ℂ(u, ξ_𝔭)`. `Formalism/LocalToGlobal/IndefiniteReal/IsometricPeriodsOfHypotheses.lean` (`MIUnit`) states `ζC u t ^ n = 1` for some `n > 0`. Is `MIUnit` proved for the chain, or only assumed? Its use was not traced (carried from the previous review; the text is unchanged).

## Previous findings

- R01 — repaired: 6.2c now reads "a similitude with factor `δ₂/δ₁` (`⟨τa, τb⟩ = (δ₂/δ₁)·⟨a, b⟩`) … an isometry when `δ₁ = δ₂`, as for every pair of the chain", with the reversal of the symplectic form stated.
- C01 — repaired: 6.2c, 6.2d, the last clause of 6.6 (e) and 6.7 (i)–(iii) carry the files and declarations of the formal proof; all were opened and exist as cited.
- C02 — repaired: 6.2a records that the formal proof states 6.2a (ii)–6.2d for the CM host and 6.2a, 6.2b, 6.2d under `GlobalTheory.Unf.Descent`, proved by `GlobalTheory.Desc.weil_data_descend`.
- C03 — repaired: the introduction compares `Bes` with "the global Bessel period `P(f ⊗ φ)` of GanGrossPrasadUnitaryGroups §4.1"; TwistedAutomorphicDescents is no longer named in the README.
- C04 — repaired: the *Needs:* line of 6.13 lists ArithmeticLocallySymmetricSpaces §ALS.F.6 (iii), and its contract says "Used in 6.2, 6.13".
- C05 — repaired: the introduction states that `E/F` is unramified at every finite place, citing the introduction of Layer 2 of ThetaChainsOnDefiniteUnitaryGroups, and §2.2 (g) for the dyadic places; both are in the contract.
- C06 — repaired: the docstring says "no theta kernel or theta functional of a dual pair" and names `jacobiTheta` and `ZLattice.thetaSeries` as not of this kind.
- C07 — repaired: the description says the targets cite files and declarations of the formal proof, lists the seven roadmaps on main, and no longer speaks of failing checks.
- C08 — repaired: the route of 6.14 (d) now says "so the central translation in the description of `V` in (d) is trivial in this route", which agrees with the statement.
- N01 — partly repaired: eight targets now name the proving theorem; 6.8, 6.10, 6.11 and 6.13 (o), (a) do not (N01 above).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 6.2c, condition on `τ` | similitude factor `c`; `c = δ₂/δ₁`, `c = 1`, `c = −1`; chain `ζ′ = ζ` | for `x = (τw)^*`, `y = (τw′)^*`: `tr(x^†y) = c·conj tr(w^†w′)`; `Tr(δ₁c·conj t) = −c·Tr(δ₁t)`; `c = δ₂/δ₁ ∈ F^×` gives `−Tr(δ₂t)` | form reversed, as stated; chain: `τ = −1`, `c = 1` | none |
| 6.2c, the anti-isometry remark | `c = −1`, `δ₁ = δ₂` | pulled-back form `= +`form of the second pair; product of the two theta functions has central character `ψ_F²` | remark true | none |
| 6.2c, form of the formal proof | `GlobalTheory.Unf.Link`, `ofAdj`, `xi0` | fields `τζ′ = −ζ`, `⟨ζ,ζ⟩ = ξ₀·star ξ₀·⟨ζ′,ζ′⟩`; `ofAdj` scales the adjoint by `−ξ₀⁻¹`; `star ξ₀ = −ξ₀`, so `ξ₀ξ̄₀ > 0` | as README says | none |
| 6.2a, form of the formal proof | four theorems | `unfold_over_flagUnipotent_thetaLift`, `besselPeriod_thetaLift_unfolding`, `fourierJacobi_period_unfolding_of_witt_descent`: `∀ D : D7, Descent D → …`; `bessel_level_step_fourierJacobi_period_link`: `∀ D : D7, LinkLaw D`; `weil_data_descend : ∀ D, Descent D` | as README says | none |
| Introduction, `Bes` against GanGrossPrasadUnitaryGroups §4.1 | pair `V_A ⊂ V`, ranks `n`, `n + 2ρ + 1` | §4.1: `P(f) = ∫_[H] f(h)ν(h)⁻¹dh`, `f` cuspidal on `U(V) × U(W)`; `ν = ψ_B` gives `conj ψ_B(n)`; `Bes` integrates `φ(h)f(nh)conj ψ_B(n)` | agree on cusp forms | none |
| Introduction, places outside the bad sets | unramified everywhere and dyadic split | a finite place is split or inert; inert ⇒ not dyadic ⇒ odd residue characteristic | holds | none |
| 6.4 (e), new locator | `VacOfShape`, `VacLaw` | `VacOfShape D`: for `c`, `v` with `ShapeOff v o`, `VacLaw v` for every tuple; proved `∀ D : D7` | "derived for the lattices of the chain" accurate | none |
| 6.6 (e), last clause | `LinkCommutes`, `linkComm_of_laws_alt` | `∃ S ≃ₗ, r > 0, s ≠ 0`, `‖Sφ‖ = r‖φ‖`, `tail(up(col0 φ)) = s·tail(col(col0(Sφ)))` for all tuples `t`; the theorem derives it from `LiftS`, `ReadS` | matches the README clause | none |
| 6.7 (i)–(iii), new locator | `seeSawTwistPlaceLaws_of_rootOfUnityRescaling` | concludes `QLaw v w ∧ QLast v w ∧ QFin v w` from `WeilOK`, `QPinU` | matches | none |
| 6.14 (d), `V` | statement against route | statement: identification of 6.13 (o) composed with a central translation common to all words; route: that translation is trivial here, `c_u` sits on the column | consistent | none |
| `Suggested.lean` docstring | library names | `jacobiTheta` in Mathlib; `ZLattice.thetaSeries` at `TauCeti/NumberTheory/ModularForms/ThetaSeries/Basic.lean:102`, a sum over a lattice in `ℍ` | accurate | none |

The rows for the untouched statements stand as in the previous review, of `6a874c7`.

- Source locators checked against the text: the 12 files and 16 declarations of [FormalProof] that the change adds or re-describes (in the operator's copy of the source) all exist as cited; each statement was read.
- Library declarations opened at the pin: `TauCeti/NumberTheory/ModularForms/ThetaSeries/Basic.lean:96–102` (`ZLattice.thetaSeries`); `jacobiTheta` as in the previous review.
- Cross-roadmap citations resolved at the open heads: ThetaChainsOnDefiniteUnitaryGroups, introduction of Layer 2 (unramified at every finite place) and §2.2 (g) (dyadic places split); GanGrossPrasadUnitaryGroups §4.1; the contract line of ArithmeticLocallySymmetricSpaces §ALS.F.6 (iii).
- Dependency check: `depcheck: 170 roadmaps, 1991 edges, 0 problem(s)`; no UPWARD or CYCLE line. GanGrossPrasadUnitaryGroups is earlier in the merge order.
- Elaboration of `Suggested.lean` with `lake env lean`: exit 0, no message. The file declares nothing (only its docstring changed), so there is no signature comparison and no one-tactic probe.
- Automatic checks: all passed at the worker. The change since `6a874c7` touches only the two files of the folder; outside it the pull request has only the three files of the family index, which are its own.
- Pull request text: read against this head; no sentence is contradicted and no change is left unstated.

Overlap check: read RowTowerAndRallisIdentities, ThetaChainsOnDefiniteUnitaryGroups, BesselPoincareSeriesAndGramBounds, GluedTargetAndDivisionInequality, ThetaKernelsForUnitaryDualPairs, ThetaLiftsForDefiniteUnitaryGroups, GanGrossPrasadUnitaryGroups as in the previous review (the change adds no object); nothing shared (the global Bessel period is GanGrossPrasadUnitaryGroups §4.1, cited; `Bes` here is the variant for continuous automorphic functions on an anisotropic group, and says so).

Source independence: changed passages only; 16 passages compared with 1 source (declarations of [FormalProof], which is Lean code), none shared; largest share [FormalProof], all locators; contents not compared again (the change adds, removes and reorders no layer).

Research link: Layer 6 of the chain of theta lifts in L. Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions (announced 2026); its general statements are Bessel and Fourier–Jacobi period unfoldings of theta lifts and Kudla's seesaw, in the setting of the Gan–Gross–Prasad periods. Rests on the README, the family index and the announcement.

## Not verifiable

- The claim in 6.15 that [FormalProof] states (a) and (b) under the additional hypotheses of RowTowerAndRallisIdentities §§5.7, 5.9–5.12: the hypotheses of `Formalism.BasicNotions.D7.BuRational` were not traced through the structure `D7` (unchanged text).
- Whether the hypotheses `WeilOK`, `QPinU` and `ShapeOff` of the theorems newly cited at 6.4 and 6.7 are discharged for the data of the chain: not traced.

Automatic checks set aside as false positives: run by hand without the candidate merge order, the dependency check says the roadmap is not in the order (with the candidate order it reports no problem); and the three files of the family index are listed as changes outside the folder, though they belong to this pull request.

## Source issues

- none

## For the human reviewers

- Scope: the only source is [FormalProof], a Lean development announced on 20 November 2026, unrefereed; the announcement says no written account exists yet (Announcement lines 45–49, 72–76).
- Scope: several cited statements of [FormalProof] take propositions named `GlobalTheory.Published.*` (`DiscreteSeriesClassification`, `CuspRapidDecay`, `HarishChandraModules`) as hypotheses, for example `PairFormStatement.lean` line 20; whether they are discharged elsewhere was not checked.
- Licence: [FormalProof] was read in the operator's local copy of the public repository named in the References; the licence of that repository was not checked.
- The README states 6.2a–6.2d for every quadratic extension, and 6.12 and 6.14 (c) with roots of unity, as "this roadmap's own" widening or sharpening of the formal statements; only the sign and index bookkeeping of their routes was recomputed.
