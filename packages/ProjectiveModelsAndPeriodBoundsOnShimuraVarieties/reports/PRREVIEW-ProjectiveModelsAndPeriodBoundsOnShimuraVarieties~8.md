# Review of ProjectiveModelsAndPeriodBoundsOnShimuraVarieties (pull request #2910 at 6f15194)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ProjectiveModelsAndPeriodBoundsOnShimuraVarieties/`
**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 65 lines changed since `39bcc3d` finds no finding. The one blocking point of the previous review is repaired: 7.31a (b) no longer asserts that `ℒ_A` extends to a cubical line bundle over the normal model, and the cubical line bundle is carried by the marked form (b′) (ii), which [FormalProof] states; the level hypotheses of (b′) now sit where that proof has them, which I checked in its source. There is one format note, not blocking. A human should note that the main source is an unrefereed Lean repository, that Lan's two papers could not be read, and that the consumer roadmap of this family still cites (b) for the cubical line bundle at its open head.

## N01 — The References entry for Faltings–Chai (1990) names no chapter or page for "the computation behind ArakelovGeometryAndAbelianHeights §5.3", while 6.2a cites the work in its text ("after Deligne and Faltings–Chai", line 104); a chapter or section number would let a reader find it.

## Previous findings

- R01 — repaired: line 301 now reads "(b) does not assert that `ℒ_A` extends to `G`; in the marked form (b′), (ii) extends the line bundle of the marked object, with these isomorphisms, over its global model"; Route paragraph, Scope and ownership sentences agree.
- C01 — repaired: the first Check of 6.9a opens "The chart formulas alone, with `g = 1` and without the action of `O`. These two cases are not instances of 6.9a", with the rank argument; the Examples paragraph says the same.
- C02 — repaired: the condition `M/ℓ^{v_ℓ(M)} ≥ 3` left the common setting; (ii) asks it for every prime `ℓ`, (iii) for the residue characteristic `p` of `𝔭` only, (i) not at all; 7.12a states it explicitly.
- C03 — repaired: the description lists "AbelianSchemesAndArithmeticModuli and EquivariantIntersectionTheory (linearisations, for 9.1) on main" and says that (b) "does not assert that it extends over the global model".
- N01 — repaired: 6.9a has relative dimension `g`, rank `2g`, and `𝒪^g → 𝒪^{2g}` in step (5) of its Route; `d` is the prime of the CM data only.
- N02 — partly repaired: the [FormalProof] entry lists 6.2a, 6.7a, 6.9a, 7.12a, 7.17a, 7.31a and 9.1; the five entries without locator are gone and Lan (2017) has its DOI and Theorem 6.1; Faltings–Chai remains without one (N01 above).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 6.9a statement (dimension letter) | rank of `H`; Route step (5) | relative dimension `g`, `rk H = 2g = rk ω + rk Lie = g + g`; `𝒪^g → 𝒪^{2g}` Lagrangian of rank `g` | consistent | none |
| 6.9a first Check (rewritten) | `E ⊇ ℚ(√−d)`, `d` prime; `End 𝔾_m`; elliptic curve | `ℚ(√−d)/ℚ` ramified at `d`, so `[E:ℚ] ≥ 4`; a ring map from `𝒪_E` to a torsion-free ring is injective; commutative subrings of `End` have rank `≤ 2 < 4` | true; now labelled as chart formulas | none |
| 6.9a Check values | `𝔾_m`; supersingular curve; trivial `L_0` | `V = 1`: `α = (1,0)`, `β = (0,1)`, `β∘α = 0`; `dV = 0`: `α = (0,a)`, injective iff `a ≠ 0`; `a = 0`: `α = (dV, 0)` not injective when `dV` is not | agree | none |
| 7.31a (b) (headline) | the sentence on `ℒ_A` at line 301; Route paragraph at 455 | `φ_{ℒ_A} = λ∘(w_0 + w̄_0) = λ` on `A` only; no `ℒ_G` on the `Y` or `Y_L` of (b) anywhere in the text (every `ℒ_G` is in (b′) or 7.12a) | no unsupported clause left | none |
| 7.31a (b′) (i) without the level condition | `M = 3`; [FormalProof] `N1ab` | `N1ab`: every `Level` (`3 ≤ M`, `Odd M`), `1 ≤ p + q`; rigidity at `M = 3`: trivial on `A[𝔐]` and polarisation-preserving gives trivial on `A[𝔐̄]`, so on `A[3]`, so identity | agrees with source | none |
| 7.31a (b′) (ii) level condition | `M = 15, 21, 3, 9`; [FormalProof] `N6` | `15`: `15/3 = 5`, `15/5 = 3`, good; `21`: `7`, `3`, good; `3`: `3/3 = 1`, not good at 3; `9`: `1`; `N6` asks `∀ p prime, l.GoodAt p` and `A = 1` | agrees with source | none |
| 7.31a (b′) (iii) level condition | `M = 3` at `p = 5` and `p = 3`; `Idx`, `N2`, `Level.GoodAt` | `GoodAt p := 3 ≤ M / p^{v_p(M)}`; `Idx` carries `good : l.GoodAt p`; `M = 3`: `3/5⁰ = 3` asserted at 5, `3/3 = 1` not asserted at 3; `PushInvertible` in `LevelStructureConditions` | agrees with source | none |
| 7.12a (added hypothesis) | uses `Y`, `ℒ_G` of (b′) (ii) | (ii) exists only when `M/ℓ^{v_ℓ(M)} ≥ 3` for all `ℓ`; 7.12a now assumes exactly that; `global_model_power_free` is "at a level good at every prime" | consistent | none |
| Scope and ownership sentences | consumer list; owner of the cubical line bundle | (a), (b): models and covers; (b′): cubical line bundle; "given by 7.31a (b′) (ii), not by (b)" matches line 301 | consistent | none |
| References, Lan (2017) | doi:10.1093/imrn/rnw123; ShimuraCompactifications §7.31 on main | Crossref record: K.-W. Lan, the cited title, IMRN; the supplier cites "[Lan17] … Theorem 6.1, pp. 22–24" for the same step | DOI and locator consistent; text not read | none |

The rows of the previous review for the statements this change does not touch (6.2a, 6.7a, 7.17a, 9.1, the body of 6.9a and of 7.31a (a), (b), the Checks of 7.31a) stand as in the previous review, of `39bcc3d`.

- Source locators checked against the text: 5 in [FormalProof], all in the folder `ReciprocityTheory/ReductiveGroups/ArithmeticGeometry/BirationalGeometry/ToroidalCompactification/`: `Level` and `Level.GoodAt` (`TwoWeightEqOneAddRoot.lean`), `N1ab` (`HeckeKer.lean`), `Idx`, `N2` with `LevelStructureConditions`, `N6` (`Clauses.lean`). The new locator `Level.GoodAt` exists and says what the README says.
- Library declarations opened at the pins: none new; the change touches no claim about Mathlib or Tau Ceti, and `Suggested.lean` is unchanged.
- Cross-roadmap citations resolved in the changed passages: ShimuraCompactifications §§6.15, 7.18, 7.31 and PELModuli M2.8, M2.9 (main), ArakelovGeometryAndAbelianHeights §5.3 (main), AbelianSchemesAndArithmeticModuli A2.3, A2.6 (main); none missing. No citation is reported as found nowhere.
- Dependency check output: `depcheck: 170 roadmaps, 1987 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. Since `39bcc3d` only the README of the folder changed; outside the folder the pull request changes only the three files of the family index.
- Elaboration: `lake env lean` on `Suggested.lean` gives no output and exit code 0. The file declares nothing, so there was nothing to `#check` and no one-tactic probe to run; its three headlines (6.2a, 7.17a, 7.31a) are each named in the docstring with the carriers they lack, and the docstring's parenthesis on 7.31a already places the cubical line bundle in (b′).
- The pull request's title and description were read against this head: they state the addition of the folder, the eight suppliers, that (b) does not assert the extension, and the three level ranges of (b′); no sentence is contradicted.
- Overlap check: read ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, HeightsForLogSingularMetrics, HodgeTateLatticesAndLubinTateLogarithms, DiscreteSeriesCoefficientsAndAutomorphicMetrics (open), ShimuraCompactifications, ArakelovGeometryAndAbelianHeights, PELModuli (main); nothing shared. The change adds, removes and reorders no layer and no target.

Source independence: changed passages only: 4 passages compared with 1 source ([FormalProof], Lean declarations without prose), none shared; largest share [FormalProof], 42 of 52 locators; the arrangement was not compared again, the change adding, removing and reordering no layer.

Research link: The headline targets are inputs of Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions (2026; README and [FormalProof], read). 6.2a rests on the growth computation of Faltings–Chai (1990); 7.17a and 7.31a extend Lan's integral compactifications (2016, 2017); these two rest on the README alone.

## Not verifiable

- [Lan16], Propositions 6.1 and 6.4, pp. 32–35 (7.31a (a)): the DOI resolves only to the publisher's page, which is in no class I may read from.
- Lan (2017), Theorem 6.1 (the Route of 7.31a (b)): no copy in a place I may read from; the DOI now given resolves to this paper, and ShimuraCompactifications §7.31 uses the same locator.
- Faltings–Chai (1990): listed in the References without a locator; nothing to check.

## Source issues

- **Misprint** in DN at Théorème 2.3, printed page 11: the source says the equivariant bundle is called `F` and then that `E` descends; it should be that `F` descends; affects nothing.

## For the human reviewers

- Scope: 6.9a, 7.12a and 7.31a (b′) rest on [FormalProof] alone, a Lean repository announced on 20 November 2026 and not refereed; no published text states these forms (README References).
- Licence: the licence of the [FormalProof] repository was not read; the README restates 36 of its declarations as mathematics and `Suggested.lean` declares nothing.
- Not tested: [Lan16] and Lan (2017) could not be read, so 7.31a (a) and the bad-prime step of 7.31a (b) were not checked against them.
- Merge coordination: ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, at its open head (README line 81), still takes "the cubical line bundle that … §7.31a (b) attaches to the principal polarisation"; this head gives it in (b′) (ii) only.
