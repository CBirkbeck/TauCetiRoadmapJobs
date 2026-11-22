# Review of SeesawForThetaChains (pull request #2913 at f20c4ad)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/SeesawForThetaChains/`
**Verdict:** accepted

**Summary.** Accepted: the four changed lines make the hypotheses of 6.15, and their contract line, agree with RowTowerAndRallisIdentities §5.8 as it now stands (a depth constant `C_F ≥ C_F⁰`, a scale `x ≥ x_F`, the gap hypotheses on the weight datum), and the quantifier order was checked against the formal proof. There is no finding and no small correction; two format notes, not blocking (one carried from the previous review). The licence of the formal proof, which the family index now says was published without one, and the new section of the family index on reviewing contributions are left to the human reviewers.

## N01 — Some locators still name a `Prop`-valued definition without the theorem that proves it

Unchanged since the previous review: at 6.8, 6.10 and 6.11 (the definitions of `ValLastX.lean`, for example `GlobalTheory.SeeSaw.CVEq`) and at 6.13 (o), (a) (`GlobalTheory.Core.Mi.EvalAll`, `GlobalTheory.Core.Mi.SBes.PerLaw`) the locator is the definition alone, so a reader cannot tell a proved statement from a hypothesis carried along. Naming the proving theorem there, as at the other targets, would finish it.

## N02 — In 6.15 the letter `x` is both the scale and a vector

The first sentence of 6.15 (line 332) assumes "the scale `x ≥ x_F`" and then states (a) "for `φ ∈ M_u ⊗ 𝕃` and `x` in the `𝕃`-rational structure `𝔼_{1,𝕃}`". Another letter for the vector (the route already writes `e` for elements of `𝔼`) would remove the clash.

## Questions for the author

- 6.14 says the formal proof gives only "a unit at `𝔭`" for `ζ_ℂ(u, ξ_𝔭)`. `Formalism/LocalToGlobal/IndefiniteReal/IsometricPeriodsOfHypotheses.lean` (`MIUnit`) states `ζC u t ^ n = 1` for some `n > 0`. Is `MIUnit` proved for the chain, or only assumed? Its use was not traced (carried from the previous reviews; the text is unchanged).

## Previous findings

- The previous review, of `4fee62d`, had no finding (R) and no small correction (C).
- N01 — not repaired: 6.8, 6.10, 6.11 and 6.13 (o), (a) are unchanged and still cite the definition alone (N01 above; a format note, not blocking).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 6.15, hypotheses taken from RowTowerAndRallisIdentities §5.8 | each clause of the new parenthesis against §5.8 at the supplier's open head | README: grid (§5.8b), `Size_□` (§5.8e), `C_F ≥ C_F⁰`, `x ≥ x_F`, gaps on the weight datum, (L1)–(L7), §5.6. Supplier §5.8: the same seven, with `C_F⁰ ≥ 6510`, `x_F ≥ x₀` | agree; the former "`x ≥ x₀`" was weaker than the supplier's `x ≥ x_F` | none |
| 6.15, order of the quantifiers of `C_F⁰`, `C_F`, `ε`, `x_F` | supplier §5.8 against [FormalProof] `GlobalTheory.RowClaim.Big` | supplier: `∃ C_F⁰, ∀ ε, ∀ C_F ≥ C_F⁰, ∃ x_F, ∀ x ≥ x_F`; formal: `∃ CF0, ∀ ε CF, CF0 ≤ CF → ∃ x₀, … x₀ ≤ x → …` | same order; `x_F` may depend on `ε` and `C_F`, not on the grid | none |
| 6.15, gap hypotheses "on the weight datum" | supplier §5.8 | interlaced; `e_l − e′_l ≥ (t+3)/2`, `e′_{l+1} − e_l ≥ (t+3)/2`; row parameter gaps `≥ 100r⁴`; `e′_{l+1} − e′_l ≥ max(256r⁴, 4N_m³+2t+6)` | all are conditions on the weight datum, as the README says | none |
| 6.15 with 6.14, two scales | `x ≥ x_F` (§5.8) and `x ≥ x₀` (BesselPoincareSeriesAndGramBounds §5.21, assumed through 6.14) | both are lower bounds on the same scale; the conjunction is `x ≥ max` of the two, nonempty | consistent | none |
| Contract line for §§5.8, 5.8b, 5.8d, 5.8e | against the new 6.15 | lists grid, `Size_□`, `C_F ≥ C_F⁰`, `x ≥ x_F`, gaps, (L1)–(L7); §5.6 is on the line above, "Used in 6.14, 6.15" | agrees with 6.15 | none |
| "depth constant" as a name for `C_F` | supplier's table of symbols and §5.8a | supplier: "`C_F` … the depth constant", depth `d_□ = ⌊C_F·f²(r+1)⁶·log(…)/log p_□⌋ + 1` | the supplier's own term | none |

The rows for the untouched statements stand as in the previous review, of `4fee62d`.

- Source locators checked against the text: 1 file and 6 declarations of [FormalProof] behind the changed hypotheses (`Development/AbelianVarietyTheory/Statements/HeckeThetaIntegrals/FormulaAt.lean`: `HidaSetting`, `Big`, `ConstK`, `Formula2K`, `SumRatK`, `RatioK`), in the operator's copy and at the commit `40e56bab` that the family index names.
- Library declarations opened at the pin: none (the change cites none; `Suggested.lean` is unchanged and declares nothing).
- Cross-roadmap citations resolved: RowTowerAndRallisIdentities §§5.6, 5.8, 5.8a (symbol `C_F`), 5.8b, 5.8e at its open head; all exist and say what 6.15 attributes to them.
- Dependency check: `depcheck: 133 roadmaps, 1481 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean` with `lake env lean`: exit 0, no message. The file declares nothing, so there is no signature comparison and no one-tactic probe.
- Automatic checks: all passed. Outside the folder the pull request changes only the family index, which is its own; since `4fee62d` the index gained the commit and licence statement of the formal proof (checked against the public repository: one commit at `40e56bab`, a directory `src/`, the licence sentence as reported), a section "When a roadmap is wrong", and a reworded entry for another sub-roadmap; its entry for this roadmap is unchanged and agrees with the README.
- Pull request text: read against this head; no sentence is contradicted, and the change (hypotheses of 6.15 made explicit) alters nothing the description states.

Overlap check: read RowTowerAndRallisIdentities, ThetaChainsOnDefiniteUnitaryGroups, GluedTargetAndDivisionInequality, ThetaKernelsForUnitaryDualPairs, BesselPoincareSeriesAndGramBounds, GanGrossPrasadUnitaryGroups as in the previous reviews (the change adds no object; RowTowerAndRallisIdentities §5.8 read again); nothing shared: the rational structure, `C_F`, `x_F` and the gap hypotheses are owned by RowTowerAndRallisIdentities and cited here.

Source independence: changed passages only; 2 passages compared with 1 source ([FormalProof], Lean code), none shared; largest share [FormalProof], all locators; contents not compared again (the change adds, removes and reorders no layer).

Research link: Layer 6 of the chain of theta lifts in L. Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions (announced 2026); its general statements are Bessel and Fourier–Jacobi period unfoldings of theta lifts and Kudla's seesaw, in the setting of the Gan–Gross–Prasad periods. Rests on the README, the family index and the announcement.

## Not verifiable

- The claim in 6.15 that [FormalProof] states (a) and (b) under the additional hypotheses of RowTowerAndRallisIdentities §§5.7, 5.9–5.12: the hypotheses of `Formalism.BasicNotions.D7.BuRational` were not traced through the structure `D7` (unchanged text).
- Whether the hypotheses `WeilOK`, `QPinU` and `ShapeOff` of the theorems cited at 6.4 and 6.7 are discharged for the data of the chain: not traced (unchanged text).
- Whether the clauses of `GlobalTheory.RowClaim.HidaSetting` are exactly the gap hypotheses that RowTowerAndRallisIdentities §5.8 lists: that is the supplier's statement, and only its quantifier prefix was compared with the formal proof here.

## Source issues

- none

## For the human reviewers

- Scope: the only source is [FormalProof], a Lean development announced on 20 November 2026, unrefereed; the announcement says no written account exists yet (Announcement lines 45–49, 72–76).
- Scope: several cited statements of [FormalProof] take propositions named `GlobalTheory.Published.*` (`DiscreteSeriesClassification`, `CuspRapidDecay`, `HarishChandraModules`) as hypotheses, for example `PairFormStatement.lean` line 20; whether they are discharged elsewhere was not checked.
- Licence: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, first paragraph) now states that [FormalProof] was published without a licence and is mirrored for verification only; the public repository's README says the same. The roadmap cites file paths and declaration names, no text.
- Scope of the index: the family index gained a section "When a roadmap is wrong", which tells reviewers of contributions what not to block on; whether a family index may set review policy is not a question of this roadmap's mathematics.
- The README states 6.2a–6.2d for every quadratic extension, and 6.12 and 6.14 (c) with roots of unity, as "this roadmap's own" widening or sharpening of the formal statements; only the sign and index bookkeeping of their routes was recomputed.
