# Review of GluedTargetAndDivisionInequality (pull request #2922 at b7135ca)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/GluedTargetAndDivisionInequality/`
**Verdict:** accepted

**Summary.** Accepted: no finding. This was an incremental re-review of the 60 lines changed since `3cb4be1`: the two small corrections of the previous review are repaired (8.19e (c3) now has `Ω` algebraic over the fraction field of `T`, `T′` in `Ω` and the unit rescaling of the section; the [FormalProof] reference names its first commit and `src/`), and the new hypothesis of 8.20b, that the theta lattices are taken in the phase-one normalisation of RowTowerAndRallisIdentities §5.11, was read against that section at its open head and against the five declarations of the formal proof it cites. There are one small correction (the credit for the theorem on the phase of (c1) leaves out its standing hypotheses) and three format notes, none blocking. The scope and the licence of the formal proof remain for the human reviewers.

## C01 — The sentence of 8.19e on the phase of (c1) states the theorem of the formal proof without the standing hypotheses that theorem carries.

The Route of 8.19e (lines 992–996) says that [FormalProof] proves "that in that normalisation, when the space of cusp forms of the step is not zero, a phase of absolute value `1` for which the rationality of (c1) holds on every cover … lies in `σ₀(𝕃)`". A reader takes these to be all the conditions. The declaration cited, `GlobalTheory.T.unit_modulus_rational_phase_mem_coefficient_field`, also assumes the record `RatHyp` (`Development/AbelianVarietyTheory/Definitions/Divisors/LevelOfOfSameBut.lean`), whose fields include the rank condition `8fr + 4 ≤ r + t` ((R5)), that the subfield of `𝕃` is Galois over `ℚ`, the phase-one compatibility and the conditions on the twist sets; and the covers it quantifies over are the uniform, pinned ones of (c1) whose field contains that subfield (`IsRatPhase`, `GoodCover`). The conclusion and the three conditions the README does name agree with the declaration (`∀ k, phs k = 1`; the cusp forms not `⊥`; `‖ph‖ = 1`; `∃ c ∈ 𝕃, σ₀(c) = ph`).

Add "under the hypotheses of the chain that it collects, among them (R5) and that the subfield is Galois over `ℚ`" after "proves", or "for the data of the chain".

## N01 — The Conventions, 8.1 and 8.5c cite BernoulliBoundsForClassGroupEigenspaces §6.17, ArithmeticKTheory §6.9, ComplexMultiplicationAndExplicitReciprocityPartII §§0.2, 4.6, ArakelovGeometryAndAbelianHeights §§2.9, 4.6 and HeightsAndUnits §0.3 for comparison; none is in the supplier contracts or a Dependencies list. One line saying that they are comparisons and not inputs would let a reader tell them from suppliers (carried; the text is unchanged).

## N02 — The route of 8.20b (line 1479) uses `Φ_th` in `30·|Φ_th|·m·b·x^{2ε}`; the symbol is not in the table of symbols and is defined only in CongruenceModulesOfThetaLifts §7.16a (3). Add "the thick places, `|Φ_th| = |𝒯| ≤ f/2`" at its use (carried; the text is unchanged).

## N03 — 8.19e (c3) (line 959) restricts to `P` "outside `S(1)`"; this is the only occurrence of `S(1)` in the README, and it is defined in RowTowerAndRallisIdentities (used in its §5.10a). Add "the set `S(1)` of RowTowerAndRallisIdentities §5.10a" or a row in the table of symbols (carried). In the same Route, "a subfield of `𝕃` fixed with the chain" (line 996) names no subfield; "the subfield of `𝕃` of 8.21 over which the base tuple is rational", if that is the one meant, would.

## Questions for the author

- The References give "L. Kronecker; M. Lerch, *Sur quelques formules relatives au nombre des classes*, Bull. Sci. Math. 21 (1897)". Is that title not Lerch's paper alone, with Kronecker's limit formula a separate work? I did not open either text (carried from the three previous reviews).
- 8.20b says the formal proof supplies the phase-one compatibility "for both runs". The declaration cited, `GlobalTheory.T.bar_tie_om_pins_phase_tie_of_pt_split`, gives it for the one core of the point (`p.T`), with no run in its statement. Do both runs have that core, so that one statement serves both? I read the statement and `compareOffOwn_atRuns_alt`, not the proof that passes from one to the other.

## Previous findings

- The review of `3cb4be1` had no finding (no R01).
- C01 — repaired: "over an algebraically closed field `Ω` … `Ω` being algebraic over the fraction field of `T`, then after a finite extension `T′` of `T` in `Ω` … and a rescaling of its trivialising section by a unit of `T′`".
- C02 — repaired: References, "Its file paths given above are relative to the directory `src/` of the first commit of that repository, `40e56bab026552e089d7afcfeff08d2defb9c005`"; the family index no longer says that each roadmap's reference names the commit.
- N01 — not repaired: written again as N01.
- N02 — not repaired: written again as N02.
- N03 — not repaired: written again as N03.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 8.19e (c3) | `HeckeInt` through `AtHeckePoints`, `IsIntegralUpToUnits` | formal: `k : Frac T → Ω`, `Algebra.IsAlgebraic (Frac T) Ω`, `T′` with `Frac T′ → Ω`, unit diagonal and unit `w` in `FrBor`; README now the same | matches |
| 8.19e, phase of (c1) | `unit_modulus_rational_phase_mem_coefficient_field`; cusp space `0`; `ph = 0` | formal: `phs = 1`, `cuspA ≠ ⊥`, `‖ph‖ = 1`, `IsRatPhase` ⟹ `∃ c ∈ 𝕃, σ₀(c) = ph`; cusp space `0`: every `ph` rational, so the condition is needed; README has it | matches; standing hypotheses unstated (C01) |
| 8.19e (c), class-sum lifts "with no phase" | RowTowerAndRallisIdentities §5.11, Normalisation | §5.11: pair fixed so that `κ_rat = 1`, `j_{σ₀}(y) = θ_j(1)x` with no phase, for every tuple of the Lemma; README cites exactly this | matches |
| 8.20, projected lattice `P_jM` | `RealDat3.toCx3`; change of normalisation `(a, b)` | formal lift `θ′ = phs • lift`, `phs = 1` gives the lift itself; under `(a, b)` the lift scales by `ab`, `𝒞(W_j)_𝕃` by `b^{−1}`, `κ_rat` by `(ab)^{−1}` | matches |
| 8.20b, clause `Tr_j ⊂ Th_j` away from `p_o` | `traceLattice_le_span_thetaSeries_awayFromOwnPrime`; `seriesSet`; `PhaseTie`; `b = e^{iθ}` transcendental | formal: lattice with phase parameter `ph`, conclusion `CompareOffOwn … ψ 1 v`, hypothesis `PhaseTie … (fun _ => 1) i`; with `b` transcendental the scalar `c·b ∉ σ₀(𝕃)`, so the inclusion needs the normalisation | matches |
| 8.20b, the hypothesis supplied | `bar_tie_om_pins_phase_tie_of_pt_split` | under the point conditions: `∀ i, PhaseTie p.T (R2 p) p.κ p.v₀ (om2 p) (fun _ => 1) i` | matches (the two runs: question) |

The rows for the untouched statements stand as in the previous review, of `3cb4be1`.

- Source locators checked against the text: 7 declarations of [FormalProof] read at the changed passages (`unit_modulus_rational_phase_mem_coefficient_field`, `IsRatPhase`, `RatHyp`, `RealDat3.toCx3`, `OnTies.seriesSet`, `FWT.PhaseTie`, `bar_tie_om_pins_phase_tie_of_pt_split`), with `traceLattice_le_span_thetaSeries_awayFromOwnPrime`, `compareOffOwn_atRuns_alt` and `HeckeInt` read again for the changed clauses. Of the seeded sample, 8.19e falls in the changed passages and was checked there; 8.20b, not in the sample, was checked in full at its changed clause.
- The 114 distinct file paths of [FormalProof] that the README cites all exist under `src/` at the commit `40e56bab026552e089d7afcfeff08d2defb9c005` that the reference now names (checked object by object in a clone); the copy read differs from that commit under `src/` only by one added file, which the README does not cite.
- Cross-roadmap citations resolved at the open head of RowTowerAndRallisIdentities: §5.10a (the rational forms depend on the extremal vector; it is that of §5.11), §5.11 (Lemma, "Normalisation (phase one)", the phase-one compatibility, the form on covers), §5.7. That roadmap's consumer paragraph names §§8.19e, 8.20, 8.20b of this one for the same normalisation.
- Dependency check: `depcheck: 133 roadmaps, 1479 edges, 0 problem(s)`; no UPWARD or CYCLE line. Automatic checks: all passed.
- Elaboration: `Suggested.lean` is unchanged since `3cb4be1`; it elaborates with `declaration uses sorry` (line 74) the only warning; single `import Mathlib`, no `set_option`. The elaborated type of its one declaration stands as compared with 7.12 in the earlier reviews.
- Headlines: three in the README; (1) stated, (2) and (3) named in the module docstring with the carriers they lack (unchanged).
- The pull request's text: title and description read against the head; no sentence contradicted, and the change (a normalisation made explicit in 8.19e–8.24, no section, headline, declaration or supplier added or removed) alters nothing they describe. #2919 and #2954, which the description names, are open. Changes outside the folder: the family index only (the sentence the previous C02 was about is withdrawn; one clause reworded).
- Duplication: the normalisation is cited from RowTowerAndRallisIdentities §5.11 and not restated; no layer or item added, removed or reordered; the overlap facts list nothing dropped or shared.

Overlap check: read RowTowerAndRallisIdentities, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties; nothing shared (RowTowerAndRallisIdentities §5.11 owns the rational lift and its phase-one normalisation, which 8.19e, 8.20 and 8.20b cite; the lattices `Tr_j`, `Th_j` and their comparison are stated only here).

Source independence: changed passages only: 5 passages compared with 1 source ([FormalProof]: the phase theorem of 8.19e, the normalisation sentence of 8.20, the hypothesis, the Route and the credit of 8.20b), none shared (the files carry no prose); largest share [FormalProof], 161 of 164 locators; no layer added, removed or reordered, so the arrangement was not compared again.

Research link: Layers 7–8 give the integrality, heights and target slopes that the slope inequality for chains of theta lifts needs in Alpöge's formal proof (announced 2026) of the Riemann hypothesis for Dirichlet L-functions, by Bost's slope method (Bost 1996, Prop. 4.3). Rests on the README's Routes paragraph, the family index and Bost1996.

## Not verifiable

- The proofs behind the declarations read: I compared statements. In particular how the phase of (c2) is removed in the proof of (L1), which the README says is not given, and whether a phase in `σ₀(𝕃)` of absolute value `1` is a unit at the places concerned.
- That the phase-one compatibility serves both runs (the second question above).
- The clauses without routes listed in the earlier reviews (8.19e (L1), (L2) and the distribution relation; 8.20 (vii) (a)–(g); 8.20 (o); 8.24b; 8.24c): unchanged, not read again.

## Source issues

- none

## For the human reviewers

- Scope: the README follows a formal proof announced on 20 November 2026 (Routes paragraph, line 132; References). No refereed source states the targets 8.9 or 8.22; three of 164 locators are to published texts.
- Licence: the family index says the formal proof "was published without a license" and is mirrored for verification only. `pairing_integral_of_localDivision` generalises `Formalism.DivisionValues.DivIntoDualShift` with the same letters `B, R, M, P, ζ, N, σ, τ` and the same order of hypotheses.
- Licence: the repository in the References is on a host the sources service does not classify; the manifest records only Bost1996 and GaudronRemond2014.
