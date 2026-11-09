# Review of ModularCurves (pull request #1808 at a96d197)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since `c9403e2`. The folder is byte-identical to the head the previous review read, so none of its ten findings is repaired. The two commits since then change only `TauCetiRoadmap/LocalPurity/` and `TauCetiRoadmap/BordismFormalGroups/`. One of those changes affects a witness here: LocalPurity no longer cites ModularCurves §4D. The R05 witness and repair are updated to match. The state of main is unchanged since the previous review (ModularCurves last changed on main at `6b029772`, #1101), so the joint repair of R01, R02, R04, R05 and R06 still applies: merge main into the branch, take main's ModularCurves folder, and re-apply the ownership move on top of it.

## R01 (P2): `Suggested.lean` redefines pinned Tau Ceti carriers and re-`sorry`s theorems the pin proves; the branch reverts main

**Location.** `TauCetiRoadmap/ModularCurves/Suggested.lean` lines 88–94 (`structure FiniteFlatCommGroupScheme`), 119–123 (`mulBy_eq_one_of_finrank … := sorry`), and the other hand copies listed in the previous report (137–206, 339–421). README 252–255: "where the library carries that record, it is the carrier, and `Suggested.lean`'s copy is deleted."

**Claim.** Unchanged. The file states its headlines on hand copies of carriers that are already at the Tau Ceti pin, and it re-`sorry`s `pow_eq_one_of_finrank` and `PointedWeierstrassAtlas.isLocallyWeierstrass`. Main carries the repaired folder, so merging this branch replaces main's README and `Suggested.lean` with this older pair.

**Witness.** Tau Ceti pin `2fd255d99`: `FiniteFlatCommGroupScheme` (`AlgebraicGeometry/GroupScheme/FiniteFlat.lean:58`), `pow_eq_one_of_finrank` (`GroupScheme/KilledByRank.lean:121`), `grpObj` (`EllipticCurve/Scheme/Geom/GroupLaw.lean:272`). `git diff --numstat origin/main HEAD -- TauCetiRoadmap/ModularCurves` gives README 451/1387 and `Suggested.lean` 577/819.

**Repair.** As the previous report says. Merge `origin/main` into the branch and take main's side of `README.md` and `Suggested.lean` (the merged #1101 folder), keeping main's `STATUS.md` and `PROGRESS.md`. Then re-apply this pull request's move: delete the strict-henselisation strand and the Artinian test algebras, and cite SchemeAndStackFoundations §§0.12a, 0.21, 1.1, 1.17, 1.23, 4.2, 4.13 and 4.15. Finally, delete the README targets that pinned results discharge and cite those results in §Exact supplier contracts.

## R02 (P2): headlines statable at the pins are declared "not statable"

**Location.** `Suggested.lean` 41–55; README 773–774 ("the group law on `projModel W` (Layer 1D), which is not at the pin") and 2166–2167 ("which lacks the `j`-invariant morphism").

**Claim.** Unchanged. Every object the docstring names as missing is at the pin. Several headlines are therefore absent although statable: the First Main Theorem for `[Γ(N)]` and `[Γ₁(N)]`, KM 6.6.1, KM 8.2.1, and KM 4.7.2 for `Y_full(N)`.

**Witness.** Tau Ceti pin: `ModuliProblem.gamma` (`ModularCurve/FullLevel.lean:86`), `gammaOne` (`Gamma/One.lean:81`), `gammaZero` (`Gamma/Zero.lean:70`), `EllipticCurveGeom.jMap` (`Geom/JInvariant.lean`, module doc line 23), `grpObj` (`GroupLaw.lean:272`). Main's `Suggested.lean` already states them.

**Repair.** The merge of R01 restores them. Then cut the docstring's not-statable list to what is really missing, and delete README 773–774 and 2166–2167.

## R03 (P3): the gate fails on two files outside the folders the pull request names

**Location.** `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`, one line each.

**Claim.** Unchanged. The worker's gate at this head reports `outside-folder=2`.

**Witness.** `git diff --stat origin/main...HEAD`, excluding the fifteen named folders, prints exactly these two files (2 insertions, 2 deletions).

**Repair.** Choose one: revert the two lines, carry them in the pull request that owns those folders, or name both folders as this pull request's own in its description.

## R04 (P3): the branch base predates the merge of #1101, and #1187 conflicts with no stated order

**Location.** The description's merge-order paragraph ("#1101 (ModularCurves) → #1807 (the other loops) → **this pull request**"). Commit `f46eabe0`.

**Claim.** Unchanged. #1101 merged into main as `6b029772`, but this branch's merge base is `a891cd19`, which comes before that merge. The paragraph still lists #1101 as pending and omits #1187.

**Witness.** `git merge-base origin/main HEAD` = `a891cd19`. `scratch/overlaps.md` lists #1187 ("chore: bump TauCeti to ab00ba392") as conflicting with #1808 in `TauCetiRoadmap/ModularCurves/Suggested.lean`.

**Repair.** The merge of R01. Drop #1101 from the paragraph, and state which of #1187 and this pull request is rebased on the other.

## R05 (P3): content moved out of Layers 0E, 0G and 4D without an old → new line for the roadmaps that cite it

**Location.** README 1305–1313 (4D now consumes §0.12a), 489–491 (0E → §1.1), 534–537 (0G → §0.3a). §Downstream consumers (2618–2620) has one bullet.

**Claim.** Roadmaps on main still cite ModularCurves §4D, §0G, §0E and the Lean names `EllipticCurve.toOver` and `EllipticCurve.ofWeierstrass`. So do the ReductiveGroups references inside this pull request. The README gives no old → new numbering for them. Changed since the previous report: LocalPurity at this head no longer cites ModularCurves. It now cites the pinned miracle flatness instead, so it drops out of the witness.

**Witness.** Main `28c3fca`: AbhyankarLemma 29, 83, 318, 329, 346, 374 (§4D); EtaleCohomologyFoundations 48, 553 (Layer 4D); SchubertGeometry 19 (§0G); AdicSpacesPartIII 234 (`toOver`, `ofWeierstrass`), 5941 (§0E). This head: ReductiveGroups 36, 364, 368, 389, 2912, 2922, 2988 (§0E).

**Repair.** In §Scope and ownership, add one line per moved item:
- 4D strict henselisation → SchemeAndStackFoundations §0.12a
- 0G Grassmannian → §0.3a
- 0E affine, finite locally free and closed descent → §1.1
- 0C quotients → §1.17
- 7D test algebras → §4.2
- miracle flatness and the regular locus → §§4.13 and 0.21
- `EllipticCurve.toOver`, `ofWeierstrass` → the pinned `EllipticCurveGeom` and `WeierstrassCurve.projModel` API

In §Downstream consumers, list the roadmaps that cite this one at the merged state. At least AbhyankarLemma, EtaleCohomologyFoundations, SchubertGeometry, AdicSpacesPartIII and ReductiveGroups cite moved or kept sections; fifteen roadmaps on main mention ModularCurves. Do not list LocalPurity, which no longer cites this roadmap at this head.

## R06 (P3): padding; three declarations close in one tactic

**Location.** `Suggested.lean` 280–282 (`isCommMonObj_kernel_mulBy`), 886–890 (`ringKrullDim_adicCompletion`), 892–898 (`isRegularLocalRing_adicCompletion_iff`); README 1317–1319.

**Claim.** Unchanged, and reconfirmed by this round's probe. `infer_instance` closes the first; `exact TauCeti.AdicCompletion.ringKrullDim_eq` and `exact TauCeti.AdicCompletion.isRegularLocalRing_iff.symm` close the other two.

**Witness.** Pinned `RingTheory/AdicCompletion/LocalRing.lean:52` and `:58`. The scratch probe adds `import TauCeti.RingTheory.AdicCompletion.LocalRing` and makes the three replacements. It elaborates with exit 0 and 31 `sorry` warnings, down from 34.

**Repair.** Delete the three declarations from `Suggested.lean`, and cite the two pinned lemmas in §Exact supplier contracts. Rewrite the 4D bullet as a consumption.

## R07 (P3): Layer 5C's "external contract" is partly at the pin and planned by named roadmaps

**Location.** README 1470–1476: "No roadmap in this repository owns these statements … a GAGA-style development that no roadmap has adopted".

**Claim.** Unchanged. The first statement is pinned for affine schemes, and ModularCurvesPartII and ComplexComparisonPartII plan the other two.

**Witness.** Pinned `connectedSpace_primeSpectrum_tensorProduct_of_isAlgClosed` (`RingTheory/Idempotents/Connected/ScalarExtension.lean:64`). ModularCurvesPartII Layers 4 and 6; ComplexComparisonPartII C4.

**Repair.** Cite the pinned lemma for the first statement. Say that ModularCurvesPartII Layers 4 and 6 discharge the rest downstream, and delete "no roadmap … has adopted". Keep `hconn`.

## R08 (P3): the rigidity route makes 4C and 5B wait on Picard duality, but the pinned rigidity needs none

**Location.** README 366–367 ("hence the Picard duality of Layer 2D"), 1241–1242, 1285–1286, 1413–1414.

**Claim.** Unchanged. The pin proves KM 2.7.2 for the naive full-level problem without any Picard input.

**Witness.** `ModuliProblem.isRigid_gammaNaive` (`ModularCurve/NaiveLevel.lean:328`) rests on `Geom/Rigidity.lean`, and the only import of that file is `…/Scheme/ZeroSection`.

**Repair.** Name the pinned rigidity as the input in all four places, and drop the Picard-duality dependency there.

## R09 (P3): supplier-contract claims: `#check` pins, the strict henselisation at the pin, an undocumented Lean name

**Location.** README 252 ("Each of these is pinned by a `#check` in `Suggested.lean`"); README 1305–1313; `Suggested.lean` 590 (`structure ArtinianTestAlgebra`).

**Claim.** Unchanged. The file has 13 `#check` lines for 26 listed names. The strict henselisation is at the pin but is cited only to §0.12a. `ArtinianTestAlgebra` does not appear in the README.

**Witness.** `grep -c '^#check' Suggested.lean` = 13; `StrictHenselization.algebra` (`RingTheory/StrictHenselization/Algebra.lean:75`); `grep -c ArtinianTestAlgebra README.md` = 0.

**Repair.** Either correct the `#check` sentence or add the missing `#check` lines. In 4D, cite the pinned declarations by name. Either name `ArtinianTestAlgebra` in 7D or remove it with the R01 move.

## R10 (P3): Layer 4D has two contradictory `**Dependencies.**` lines

**Location.** README 1336–1338.

**Claim.** Unchanged. Line 1336 lists SchemeAndStackFoundations §§0.12a, 0.21, 4.13, and line 1338 repeats the line without them.

**Witness.** `sed -n 1336,1338p README.md` shows two lines, both beginning `**Dependencies.**`.

**Repair.** Delete line 1338.

## Previous findings

- R01 — not repaired: `Suggested.lean` 88 still declares `structure FiniteFlatCommGroupScheme`; 119–123 still `sorry` `mulBy_eq_one_of_finrank`; the folder still differs from main's by 451/1387 and 577/819 lines.
- R02 — not repaired: the docstring at 41–55 still lists the First Main Theorem, KM 8.2.1 and `Y₁(N)`, `Y_full(N)` as not statable; README 773–774 and 2166–2167 unchanged.
- R03 — not repaired: the worker's gate at this head reports `outside-folder=2` for the same two files.
- R04 — not repaired: the merge base is still `a891cd19`; the merge-order paragraph is unchanged and omits #1187.
- R05 — not repaired: no old → new line in §Scope and ownership; §Downstream consumers still has one bullet. LocalPurity's citation of §4D is gone at this head, so it leaves the witness.
- R06 — not repaired: the three declarations are still at 280–282 and 886–898 with `sorry`; the probe closes all three again.
- R07 — not repaired: README 1470 still says "No roadmap in this repository owns these statements".
- R08 — not repaired: README 366–367 still says "hence the Picard duality of Layer 2D".
- R09 — not repaired: README 252 unchanged; 13 `#check` lines; `ArtinianTestAlgebra` absent from the README.
- R10 — not repaired: lines 1336 and 1338 both begin `**Dependencies.**`.

## Verified sound

**Change set.** `git diff --stat c9403e2 HEAD -- TauCetiRoadmap/ModularCurves` is empty. The two commits since `c9403e2` touch only `TauCetiRoadmap/LocalPurity/` (`dc47c7e0`) and `TauCetiRoadmap/BordismFormalGroups/` (`a96d1971`). `lake-manifest.json` is unchanged, so the pins are still Mathlib `1b1ccf4b` and Tau Ceti `2fd255d99`. Main is at `28c3fca`, and its ModularCurves folder is unchanged since `6b029772`.

**Effect of the two sibling changes on this roadmap.**
- LocalPurity: the passage at old line 141 that consumed ModularCurves §4D's miracle flatness is gone. LocalPurity now cites `TauCeti.Algebra.flat_of_isCohenMacaulay` (`RingTheory/RegularLocalRing/MiracleFlatness.lean:72`, opened). `grep -c ModularCurves` on its README at this head is 0. This changes the R05 witness only.
- BordismFormalGroups: lines 53, 457 and 2534 say that ModularCurves consumes F1's height classification. The same claim stood at `c9403e2` (old line 143) and on main (line 142). No ModularCurves passage depends on the rewritten F1 text.

**Remarks on untouched text (no change requested in this round).**
- PD-5 (README 1619–1624) cites only Lazard 1955 for the height-2 uniqueness, not BordismFormalGroups F1, which says it supplies it.
- Layer 4D (README 1311–1312) takes miracle flatness from SchemeAndStackFoundations §4.13, whose text does not name the pinned `TauCeti.Algebra.flat_of_isCohenMacaulay`.

**Gate.** The worker's gate at `a96d197` reports every scanner 0, `outside-folder=2`, `build=0` and FAIL. My re-run with `--base origin/main`, without the folder exclusions, also reports every scanner 0. It shows `outside-folder=28`: the two files of R03 plus the files of the fifteen named folders.

**Dependency check.** `depcheck: 239 roadmaps, 2350 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean TauCetiRoadmap/ModularCurves/Suggested.lean` exits 0 with 34 `declaration uses sorry` warnings and no other warning or error. The rest of the output is the 13 `#check` pins.

**One-tactic probe (R06), re-run this round.** On a scratch copy with the three replacements, the file elaborates with exit 0, 0 errors and 31 `sorry` warnings. The other 31 sorried statements were probed in earlier rounds with `first | rfl | infer_instance | simp` and stayed open; the file and pins are unchanged.

**Signatures.** `signatures.md` lists 83 declarations and none has a dropped section binder. Spot-checked binders: `torsionInclusion` has `[NeZero m] [NeZero n]`, `hasProperty_finite` has `[IsNoetherianRing ↑R]`, and `exists_universalDeformation` has `[IsAlgClosed k] [CharP k p]`.

**Library declarations opened at the pin this round** (under `TauCeti/`):
- `AlgebraicGeometry/GroupScheme/FiniteFlat.lean:58`
- `GroupScheme/KilledByRank.lean:121`
- `EllipticCurve/Scheme/Geom/GroupLaw.lean:272`
- `Geom/JInvariant.lean:23`
- `ModularCurve/FullLevel.lean:86`
- `Gamma/One.lean:81`
- `Gamma/Zero.lean:70`
- `YOne.lean:36`
- `NaiveLevel.lean:50, 328`
- `Geom/Rigidity.lean:11` (its only import)
- `RingTheory/AdicCompletion/LocalRing.lean:52, 58`
- `RingTheory/Idempotents/Connected/ScalarExtension.lean:64`
- `RingTheory/StrictHenselization/Algebra.lean:75`
- `RingTheory/RegularLocalRing/MiracleFlatness.lean:72, 90, 104`

**Cross-roadmap citations resolved this round.**
- Main `28c3fca`: AbhyankarLemma 29, 83, 318, 329, 346, 374; EtaleCohomologyFoundations 48, 553; SchubertGeometry 19; AdicSpacesPartIII 234, 5941; LocalPurity 138; BordismFormalGroups 142; ModularCurves §Downstream consumers. Fifteen roadmaps on main mention ModularCurves.
- This head: ReductiveGroups 36, 364, 368, 389, 2912, 2922, 2938, 2956, 2988; SchemeAndStackFoundations §§0.12a (1086), 0.21 (1531), 4.13 (5836, miracle flatness at its line 15); BordismFormalGroups 53, 457, 2534; LocalPurity 71, 186–188.

**Overlaps.** `overlaps.md` reports no cited id dropped by an open pull request, no open-revision-only id, and no id this pull request drops that others cite. The tool does not detect moved content, hence R05. #1187 is the only other open pull request changing this folder (R04). Ownership against the listed open heads is as in the previous report: ModularCurvesPartII imports Layers 0–10 and rebuilds nothing.

**Citations.** The 10 "Lean names found nowhere" in `citations.md` are all declared in `Suggested.lean`, at the lines the previous report gives.

**Seeded sample.** All nine targets fall in unchanged text and were checked in earlier rounds: "Consumers" (360), 5C (1444, 1459), 8C (1806, 1827, 1846), 9D (2099), Layer 10 (2236, 2456). Their rows are carried below.

### Adversarial table

The diff is empty, so every statement is untouched. Rows marked (r21) carry their values from PRREVIEW-ModularCurves~21 through ~23. Rows marked (r25) were recomputed this round.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| `mulBy_eq_one_of_finrank` (0B) | `μ_p/𝔽_p`; `(ℤ/2)_ℤ`; `S = ∅`, `n = 0` | `[p]x = x^p = 1` on `μ_p`; `[2] = 0` on `ℤ/2`; on `∅` both sides the unique map | true; pinned `pow_eq_one_of_finrank:121` (r25) | R01 |
| `finrank_mulBy`, `finrank_torsion` (2.3.1) | `E/ℚ`, `N = 2`; supersingular `E/𝔽̄_p`, `N = p`; `N = 1` | rank 4 = 2²; `E[p]` connected of rank `p²`; rank 1 | true (r21) | R01 |
| `etale_torsion_of_isUnit` | `ℤ[1/2]`, `N = 2`; `𝔽₂`, `N = 2`; `S = ∅` | étale rank 4; hypothesis fails, `E[2]` not étale; empty map étale | true (r21) | R01 |
| `isCommMonObj_kernel_mulBy` | probe (r25) | `by infer_instance` closes it; exit 0, 31 sorries | padding | R06 |
| `isGroupHom_of_mapsZero` (2.5.1) | `f = [−1]`; translation by `P ≠ 0`; zero map | `F = −𝟙`; excluded by `hf_zero`; `F = 0` | true (r21) | R02 |
| `exists_representedBy_of_isRigid` (4.7.0) | naive `[Γ(3)]/ℤ[1/3]`; naive `[Γ(2)]`; `P(E/S) = ∅`; `R = 0` | `Y_full(3) = Spec ℤ[1/3,ζ₃][μ,1/(μ³−1)]`; `[−1]` fixes every basis; `rep X = ∅`; singleton over `0` | true (r21) | none |
| `IsRegularOfDimTwo` (def) | `Spec ℤ[1/3,ζ₃][μ,1/(μ³−1)]`; `∅`; `Spec 𝔽_p` | holds; fails `Nonempty`; dimension `0 ≠ 2` | discriminates (r21) | none |
| `axiomaticRegularity` (5.1.1) | Drinfeld `[Γ(2)]` at `p = 2`; trivial problem | rank `|GL₂(𝔽₂)| = 6`; `Spec W(k)[[T]]` regular of dimension 2 | consistent (r21) | none |
| `formalGroup_p_eq_zero_of_pow_mem_span` | additive law over `𝔽_p`; `ℤ`, `p = 2`, `n = 1`; `ℤ/4`, `p = 2`, `n = 2` | `p = 0` holds; `2XY ∉ (X², Y²)`; coefficients 4, 6, 4 ≡ 0, 2, 0 | true (r21) | none |
| `exists_universalDeformation` (7D) | supersingular `E₀/𝔽̄_p` | `H¹(T) = 1`, `H² = 0`, pro-represented by `W(k)[[T]]` | true (r21) | none |
| PD-5 height-2 uniqueness (7E, sample-adjacent) | `𝔾̂ₘ` and `𝔾̂ₐ` over `𝔽̄_p`; supersingular `Ê₀` | heights 1, ∞, 2: pairwise non-isomorphic, consistent with BordismFormalGroups F1 Checks (457) | consistent (r25) | remark |
| `isCategoricalQuotient_of_isUnit_card` (7.1.3(3)) | `ℤ[x]`, `x ↦ −x`, over `𝔽₃` and `𝔽₂` | `𝔽₃[x²] = (𝔽₃[x])^{C₂}`; `𝔽₂[x²] ≠ 𝔽₂[x]`, excluded | true (r21) | none |
| `etale_mapRep_of_free` (7.1.3(2)) | empty base | `𝒫(E/∅)` singleton; `hfree` over nonempty bases | not vacuous (r21) | none |
| `isFinite_mapRep` | `ℚ[x₁,x₂,…]`, `C₂` negating | `A/B₊A` infinite-dimensional; `hP_ft` excludes it | load-bearing (r21) | none |
| `axiomaticRegularityOfQuotients` (7.5.1) | `[Γ₁(pⁿ)]`, `H = (ℤ/pⁿ)ˣ` | degree `φ(pⁿ)` = 8D rank | consistent (r21) | none |
| `exists_coarseModuliData`, `coarseModuli_quotient` (8.1.1, 8.1.5) | naive `[Γ(3)]`, `H = GL₂(𝔽₃)` | `Y_full(3)/H = Spec ℤ[1/3][j]`; `[Frac A₃ : ℚ(j)] = 24 = 48/2` | consistent (r21) | R02 |
| `ker_baseChange_of_noZeroSMulDivisors_coker` (9E) | `D = ℤ`, `·2`, `R = 𝔽₂`; diagonal `ℤ → ℤ²` | `𝔽₂` vs 0 (excluded); 0 = 0 | true (r21) | none |
| 9D quotient smoothness (sample, 2099) | `ℤ_(2)[x]`, `x ↦ −x`; `k[ε]`, char 2; `R[x,y]/(xy−π)` | smooth quotient; invariants not flat; regular, singular fibre | consistent (r21) | none |
| 9D diamond group even order | `N = 7, 13` | `|(ℤ/N)ˣ| = 6, 12`; `|Δ| = 3, 6` | true (r21) | none |
| `irreducibleSpace_of_connectedSpace` (5C, sample 1444) | `𝔸¹_k`; `𝔸¹ ⊔ 𝔸¹`; `k[x,y]/(xy)` | irreducible; excluded; excluded | true (r21) | none |
| 5C base change (sample 1459) | `𝔸¹_{ℚ(i)}` over `ℚ` | `Y_ℚ̄ = 𝔸¹ ⊔ 𝔸¹`, `hconn` fails | load-bearing (r21) | R07 |
| `ringKrullDim_adicCompletion`, `isRegularLocalRing_adicCompletion_iff` (4D) | probe (r25); `ℤ_(p)`; `k[x,y]_(x,y)/(xy)` | both close by one `exact`, exit 0; 1 = 1; not regular on either side | padding | R06 |
| 8C rings (sample 1827) | `p = 2`, `n = 1` | `K̲ = (P)`, `h̲ = (P)`; `e₁(0, P) = P` | consistent (r21) | none |
| 8C proof lemmas (sample 1846) | general `n` | `det(Q·|A₁) = ±∏[b](P)`; snake `0 → Ker/Q → A₂/Q → A₁/Q → 0` | consistent (r21) | none |
| 8C problems compared (sample 1806) | `N = p` | `{aP : (a,p) = 1}` generators, `D ⊆ Gˣ` | consistent (r21) | none |
| Layer 10 class (sample 2236) | `N = 5, 11, 13` | `|Δ| = 2, 5, 6`; `N = 11`: `5·1 + 5·11 = 60 = (121−1)/2` | consistent (r21) | none |
| Layer 10 Lean note (sample 2456) | Mathlib `Normalization.lean` | seven names; `normalizationPullback` direction matches | verified (r21) | none |
| 0A Consumers (sample 360) | 5B rigidity route | pinned `isRigid_gammaNaive:328`; `Rigidity.lean` imports only `ZeroSection` | overstated (r25) | R08 |
| 5C contract | affine `Y(ρ)` | pinned `connectedSpace_primeSpectrum_tensorProduct_of_isAlgClosed:64` | "no roadmap owns" false (r25) | R07 |
| `EllipticCurve` (def) | unit at a 2-torsion section | `one_eq_zero` excludes it | discriminates; pin has `grpObj:272` (r25) | R01 |
| `IsCategoricalQuotient` (def) | `Spec k[x] → Spec k[x²]`; identity | invariant and universal; identity fails invariance | discriminates (r21) | none |
| `KatzMazurQuotientData` (def) | `q = 𝟙`, `H` nontrivial | `q1` fails | discriminates (r21) | none |
| README 2166, 773 | the pin | `jMap` in `JInvariant.lean`; `grpObj` at `GroupLaw.lean:272` | false (r25) | R02 |
| branch vs main | `git diff --numstat origin/main HEAD -- TauCetiRoadmap/ModularCurves` at `28c3fca` | README 451/1387; Lean 577/819; STATUS 22/18; PROGRESS 0/9 | reverts main (r25) | R01, R04 |

## Not verifiable

- Katz–Mazur, *Arithmetic Moduli of Elliptic Curves*: no legal text (not in the manifest; no open copy). The sampled 8C locators (6.1, p. 155; 6.3.2, pp. 157–158; 6.3.3–6.3.6, pp. 159–162) and the 9D locator are cited by locator only. Their mathematics is recomputed in the table.
- Not in the cache: Lazard 1955, Katz's *Serre–Tate local moduli*, Buzzard's *Formalizing Fermat* Lecture 8, Deligne–Rapoport, SGA 3, Igusa, Conrad. None is cited for a step taken from inside its proof.
- Silverman `AEC`: settled as uncertified.

## Source issues

- none
