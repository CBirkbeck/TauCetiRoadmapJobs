# Review of ModularCurves (pull request #1808 at c9403e2)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since `d1a45bf`. The folder is byte-identical to the head the previous review read, so none of its ten findings is repaired. One fact outside the folder changed and sharpens R01 and R04: #1101 has merged into main (`6b029772`), so main's `TauCetiRoadmap/ModularCurves/` is now the folder this pull request was asked to rebuild on, and this branch, which forks from `a891cd19` before that merge, would revert it. The repair of R01, R02, R04, R05 and R06 is therefore one operation: merge main into the branch, take main's ModularCurves folder, and re-apply the ownership move on top of it.

## R01 (P2) — `Suggested.lean` redefines pinned Tau Ceti carriers and re-`sorry`s theorems the pin proves; the branch now reverts main

**Location.** `TauCetiRoadmap/ModularCurves/Suggested.lean` lines 88–94, 137–206, 339–421 (`FiniteFlatCommGroupScheme`, `PointedWeierstrassChart`, `PointedWeierstrassAtlas`, `IsLocallyWeierstrass`, `EllipticCurveGeom`, `EllObj`, `ModuliProblem`, `RelRepData`, `HasProperty`, `IsRigid`); lines 121, 182, 190, 256–318. README 252–255: "where the library carries that record, it is the carrier, and `Suggested.lean`'s copy is deleted."

**Claim.** Unchanged since the previous review: the file states the headlines on hand copies of carriers that pinned Tau Ceti has, and re-`sorry`s `pow_eq_one_of_finrank` and `PointedWeierstrassAtlas.isLocallyWeierstrass`. The README makes the same mistake in 0B, 1A, 1D, 2A, 2D items 1–3, 2F, 4A and 5A. What is new: main now carries the repaired folder, so merging this branch replaces main's README (3692 lines, 214 `#check` pins, no hand-declared carrier) and `Suggested.lean` (1142 lines) with this older pair (2756 and 900 lines).

**Witness.** At Tau Ceti `2fd255d9`: `FiniteFlatCommGroupScheme` (`AlgebraicGeometry/GroupScheme/FiniteFlat.lean:58`), `pow_eq_one_of_finrank` (`GroupScheme/KilledByRank.lean:121`), `EllObj` (`ModularCurve/Ell.lean:98`), `grpObj` (`EllipticCurve/Scheme/Geom/GroupLaw.lean:272`). On main at `7bf4638`: `git diff --numstat origin/main HEAD -- TauCetiRoadmap/ModularCurves` gives README 451/1387, `Suggested.lean` 577/819, `STATUS.md` 22/18 and deletes `PROGRESS.md` (0/9); main's `Suggested.lean` declares none of the three carrier structures above.

**Repair.** Merge `origin/main` into the branch. In the conflict on `README.md` and `Suggested.lean` take main's side (the merged #1101 folder), keep main's generated `STATUS.md` and `PROGRESS.md`, and then re-apply this pull request's move on top of it: delete the strict-henselisation strand and the Artinian test algebras from main's file, and cite SchemeAndStackFoundations §§0.12a, 0.21, 1.1, 1.17, 1.23, 4.2, 4.13 and 4.15 as the current README does. Then delete the README targets the pinned results discharge and cite them in §Exact supplier contracts: `EllipticCurveGeom.degree_intCast`, `isogenyOfDegree_intCast` (`Geom/Isogeny.lean`), `etale_torsion_hom_of_forall_intCast_ne_zero` (`Geom/Torsion/Etale/Locus.lean`), `grpObj`, `relativePicardPresheaf` (`PicardFunctor/Relative.lean`), `ModuliProblem.isRigid_gammaNaive` (`ModularCurve/NaiveLevel.lean`). Tested: main's `Suggested.lean` (`c97e9998`'s text) elaborates at this pin with `sorry` as the only warning, as recorded in the previous review.

## R02 (P2) — headlines statable at the pins are declared "not statable"

**Location.** `Suggested.lean` 41–55; README 773–774 ("the group law on `projModel W` (Layer 1D), which is not at the pin") and 2166–2167 ("lacks the `j`-invariant morphism").

**Claim.** Unchanged. Each object named as missing is at the pin, so the First Main Theorem for `[Γ(N)]` and `[Γ₁(N)]`, KM 6.6.1, KM 8.2.1 over `ℤ` and over every ring, and KM 4.7.2 for `Y_full(N)` are absent although statable.

**Witness.** At the pin: `ModuliProblem.gamma` (`ModularCurve/FullLevel.lean:86`), `gammaOne` (`Gamma/One.lean:81`), `gammaZero` (`Gamma/Zero.lean:70`), `EllipticCurveGeom.jMap` (`Geom/JInvariant.lean:142`), `EllObj.yOne` (`ModularCurve/YOne.lean:475`). Main's `Suggested.lean` states them: `exists_representableBy_gammaNaive` (757), `firstMainTheorem_gamma` (929), `firstMainTheorem_gammaOne` (942), `exists_coarseModuliData_gamma_one` (1109), `exists_coarseModuliData_gamma_one_of_ring` (1120).

**Repair.** The merge of R01 restores all six. Then cut the docstring's not-statable list to what is really missing (balanced `[Γ₁(N)]`; KM 6.1.1, 6.2.1, 6.5.1; dual isogeny, Cartier–Nishi, Weil pairing; `det_N`, `Y(N, ζ)`, `Y(ρ)`; Layer 10) and delete the sentences at README 773–774 and 2166–2167, as main already does.

## R03 (P3) — the gate fails: two files outside the roadmap folders the pull request names

**Location.** `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`, one line each.

**Claim.** Unchanged. The worker's gate at this head reports `outside-folder=2`; my re-run lists the same two files. Neither folder is one of the fifteen the brief names as this pull request's own.

**Witness.** `git diff --stat origin/main...HEAD` excluding the fifteen named folders prints exactly these two files, 2 insertions and 2 deletions.

**Repair.** Revert the two lines, or carry them in the pull request that owns those folders, or name both folders as this pull request's own in its description.

## R04 (P3) — the branch base predates the merge of #1101, and #1187 conflicts with no stated order

**Location.** Commit `f46eabe0` ("the revision of pull request 1101 as the base"); the description: "The branch starts from #1101's head … Merge order. #1101 (ModularCurves) → #1807 → this pull request." The overlaps report: "#1187 and #1808 conflict in … `TauCetiRoadmap/ModularCurves/Suggested.lean`".

**Claim.** The folder at `f46eabe0` was #1101's revision `063c2e1`, not its head; #1101 has since merged into main as `6b029772`, and this branch's merge base with main is `a891cd19`, before that merge. So the stated base is now simply main, and the branch is behind it by the whole of #1101's final form. The merge-order paragraph still does not mention #1187, which bumps the Tau Ceti pin and touches this folder's `Suggested.lean`.

**Witness.** `git merge-base origin/main HEAD` = `a891cd19`; `git log origin/main -- TauCetiRoadmap/ModularCurves` has `6b029772 … (#1101)` on top. `scratch/overlaps.md` lists #1187 as the only open pull request changing this roadmap.

**Repair.** The merge of R01. Drop #1101 from the merge-order paragraph (it is on main) and state which of #1187 and this pull request is rebased on the other.

## R05 (P3) — content moved out of Layers 0E, 0G and 4D, and Lean names dropped, without an old → new line for the roadmaps that cite them

**Location.** README 1305–1313 (4D consumes §0.12a), 536 and 491 (0G → §0.3a, 0E → §1.1); `EllipticCurve.toOver` and `EllipticCurve.ofWeierstrass` not declared; §Downstream consumers at 2618–2620 has one bullet.

**Claim.** Unchanged. On main at `7bf4638`, AbhyankarLemma (lines 29, 83, 318, 329, 346, 374), EtaleCohomologyFoundations (48, 553), SchubertGeometry (19) and AdicSpacesPartIII (234, 5941) still cite ModularCurves §4D, §0G, §0E and the two Lean names; inside this pull request LocalPurity line 141 and ReductiveGroups lines 36, 364, 368, 389, 2912, 2922, 2938, 2956 do the same.

**Witness.** Each line quoted above exists at this head and on main `7bf4638`; main's post-#1101 README keeps 0E at line 839, 0G at 901 and 4D at 1882 with the content this branch moves.

**Repair.** In §Scope and ownership, one line per moved item: 4D strict henselisation → SchemeAndStackFoundations §0.12a; 0G Grassmannian → §0.3a; 0E affine, finite locally free and closed descent → §1.1; 0C quotients → §1.17; 7D test algebras → §4.2; miracle flatness and the regular locus → §§4.13 and 0.21; `EllipticCurve.toOver`, `ofWeierstrass` → the pinned `EllipticCurveGeom` and `WeierstrassCurve.projModel` API. Restore main's §Downstream consumers list (AbhyankarLemma, EtaleCohomologyFoundations, AdicSpacesPartII 2B, AdicSpacesPartIII, EllipticCohomology, ReductiveGroups 0F, BordismFormalGroups 7E, LocalPurity).

## R06 (P3) — padding: three declarations close in one tactic

**Location.** `Suggested.lean` 280–282 (`isCommMonObj_kernel_mulBy`), 886–890 (`ringKrullDim_adicCompletion`), 892–898 (`isRegularLocalRing_adicCompletion_iff`); README 1317–1320 lists the two completion statements as 4D's own.

**Claim.** Unchanged. `infer_instance` closes the first; `exact TauCeti.AdicCompletion.ringKrullDim_eq` and `exact TauCeti.AdicCompletion.isRegularLocalRing_iff.symm` close the other two.

**Witness.** Pinned `RingTheory/AdicCompletion/LocalRing.lean:52` (`ringKrullDim_eq`) and `:59` (`isRegularLocalRing_iff`), both for a Noetherian local ring. This round's probe copy, with `import TauCeti.RingTheory.AdicCompletion.LocalRing` added and the three `sorry`s replaced (`by infer_instance`, the two `exact`s), elaborates with exit 0, no error and 31 `sorry` warnings, down from 34.

**Repair.** Delete the three from `Suggested.lean` (the first goes with the pinned `torsion` after R01); cite the two pinned lemmas in §Exact supplier contracts with their file; make the 4D bullet a consumption; drop them from the docstring's headline list.

## R07 (P3) — Layer 5C: the "external contract" is partly at the pin and planned by named roadmaps

**Location.** README 1470–1476: "No roadmap in this repository owns these statements … a GAGA-style development that no roadmap has adopted"; `Suggested.lean` 850–853.

**Claim.** Unchanged. The first statement (connectedness insensitive to `ℚ̄ ↪ ℂ`) is pinned for affine schemes, and `Y(ρ)` is affine; ModularCurvesPartII discharges "its three comparison contracts … in Layers 4 and 6"; ComplexComparisonPartII C4 plans `affineCurveConnectedness`.

**Witness.** Pinned `connectedSpace_primeSpectrum_tensorProduct_of_isAlgClosed` (`RingTheory/Idempotents/Connected/ScalarExtension.lean:64`); ModularCurvesPartII at its head, the Layer 5C scope bullet (line 230) and line 1537; ComplexComparisonPartII at its head, README line 52 and 2654.

**Repair.** Cite the pinned lemma (and `connectedSpace_primeSpectrum_of_injective` for the converse) for the first statement; say this roadmap stops at the conditional statement and that ModularCurvesPartII Layers 4 and 6 discharge the uniformisation and analytic comparison downstream; delete "no roadmap … has adopted"; keep `hconn` as the hypothesis.

## R08 (P3) — the rigidity route makes 4C and 5B wait on Picard duality, but the pinned rigidity needs none

**Location.** README 366–367, 1241–1242, 1285–1286, 1413–1414.

**Claim.** Unchanged. KM 2.7.2 for the naive full-level problem is proved at the pin by a variable-change argument with no Picard input, so 2D is a route, not a need, for 4C, 5B and the freeness step of 5C.

**Witness.** `ModuliProblem.isRigid_gammaNaive` (`ModularCurve/NaiveLevel.lean`, cited in its module docstring at line 50) rests on `Geom/Rigidity.lean` (`IsFiberwiseInjective.eq_id_of_isPullback`), which imports no Picard file.

**Repair.** Name the pinned rigidity as the input in the four places; drop "hence the Picard duality of Layer 2D"; keep 2F only for KM 2.7.1, 2.7.3 and 2.7.4.

## R09 (P3) — supplier-contract claims: `#check` pins, the strict henselisation at the pin, an undocumented Lean name

**Location.** README 252 ("Each of these is pinned by a `#check` in `Suggested.lean`"); README 1305–1313 and 2572; `Suggested.lean` 590 (`structure ArtinianTestAlgebra`).

**Claim.** Unchanged. The file has 13 `#check` lines against 26 listed Tau Ceti names; the strict henselisation is constructed at the pin yet cited only to §0.12a; `ArtinianTestAlgebra` occurs nowhere in the README.

**Witness.** `grep -c '^#check' Suggested.lean` = 13; pinned `StrictHenselization.algebra` (`RingTheory/StrictHenselization/Algebra.lean:75`); `grep ArtinianTestAlgebra README.md` is empty.

**Repair.** Replace the `#check` sentence or add the 14 missing `#check` lines; in 4D cite the pinned strict-henselisation declarations by name and file and keep §0.12a for the rest; name `ArtinianTestAlgebra` in 7D as the parameter structure matching SchemeAndStackFoundations §4.2's `Formal.ArtinianTestAlgebra`.

## R10 (P3) — Layer 4D has two contradictory `**Dependencies.**` lines

**Location.** README 1336–1338.

**Claim.** Unchanged: line 1336 lists SchemeAndStackFoundations §§0.12a, 0.21, 4.13; line 1338 repeats the line without it.

**Witness.** `sed -n 1336,1338p README.md` shows both lines opening with `**Dependencies.**`.

**Repair.** Delete line 1338.

## Previous findings

- R01 — not repaired: `Suggested.lean` 88–94 still declares `structure FiniteFlatCommGroupScheme`, and 121 still `sorry`s `mulBy_eq_one_of_finrank`; #1101's merge to main makes the branch a revert of main.
- R02 — not repaired: the docstring at 41–55 still lists the First Main Theorem, KM 8.2.1 and `Y₁(N)` as not statable; README 773–774 and 2166–2167 unchanged.
- R03 — not repaired: the worker's gate at this head still reports `outside-folder=2` for the same two files.
- R04 — not repaired: the merge base is `a891cd19`; the description's merge-order paragraph is unchanged and omits #1187.
- R05 — not repaired: §Scope and ownership has no old → new line; §Downstream consumers (2618–2620) still has one bullet.
- R06 — not repaired: the three declarations are at 280–282 and 886–898 with `sorry`.
- R07 — not repaired: README 1470–1476 still says "No roadmap in this repository owns these statements".
- R08 — not repaired: README 366–367 still says "hence the Picard duality of Layer 2D".
- R09 — not repaired: README 252 unchanged; 13 `#check` lines; `ArtinianTestAlgebra` absent from the README.
- R10 — not repaired: lines 1336 and 1338 both begin `**Dependencies.**`.

## Verified sound

**Change set.** `git diff --stat d1a45bf HEAD -- TauCetiRoadmap/ModularCurves` is empty. The commits since `d1a45bf` touch only `TauCetiRoadmap/CharacteristicClasses/` and `TauCetiRoadmap/ComplexKahlerGeometry/`, neither of which this roadmap cites or is cited by. The sibling SchemeAndStackFoundations folder this roadmap consumes is unchanged since the previous review, so the resolutions of §§0.3a, 0.12a, 0.21, 1.1, 1.17, 1.23, 4.2, 4.13 and 4.15 recorded there still hold.

**Gate.** Worker gate at `c9403e2`: every scanner 0, `outside-folder=2`, `build=0`. My re-run of the gate with `--base origin/main` (no folder exclusions) reports every scanner 0 and `outside-folder=26`, which is the two files of R03 plus the fifteen named folders' files.

**Dependency check.** `depcheck: 238 roadmaps, 2372 edges, 0 problem(s)`. No UPWARD or CYCLE line.

**Elaboration.** `lake env lean TauCetiRoadmap/ModularCurves/Suggested.lean` at Mathlib `1b1ccf4b` / Tau Ceti `2fd255d9`: exit 0, 34 `declaration uses sorry` warnings and nothing else; the remaining output is the 13 `#check` pins.

**One-tactic probe.** On a scratch copy with the three replacements of R06: exit 0, 0 errors, 31 `sorry` warnings (34 − 3): `by infer_instance` closes `isCommMonObj_kernel_mulBy`, and `exact TauCeti.AdicCompletion.ringKrullDim_eq` and `exact TauCeti.AdicCompletion.isRegularLocalRing_iff.symm` close the two completion theorems. The other sorried statements were probed in the previous review with `first | rfl | infer_instance | simp` and stayed open; the file has not changed.

**Signatures.** `signatures.md` lists 83 declarations with no dropped section binder, identical to the previous round's list; the binders checked there (`torsionInclusion` `[NeZero m] [NeZero n]`, `hasProperty_finite` `[IsNoetherianRing ↑R]`, `KatzMazurQuotientData` `[Group H] [Finite H]`, `exists_universalDeformation` `[IsAlgClosed k] [CharP k p]`) are unchanged.

**Library declarations opened at the pins this round** (Tau Ceti paths under `TauCeti/`): `AlgebraicGeometry/GroupScheme/FiniteFlat.lean:58`, `GroupScheme/KilledByRank.lean:121`, `EllipticCurve/Scheme/Geom/Basic.lean:55–61`, `Geom/GroupLaw.lean:272`, `Geom/JInvariant.lean:142`, `ModularCurve/Ell.lean:98`, `ModuliProblem.lean:42–56`, `FullLevel.lean:86`, `Gamma/One.lean:81`, `Gamma/Zero.lean:70`, `YOne.lean:475`, `NaiveLevel.lean:50, 134`, `RingTheory/AdicCompletion/LocalRing.lean:52, 59`, `RingTheory/Idempotents/Connected/ScalarExtension.lean:64`, `RingTheory/StrictHenselization/Algebra.lean:75`.

**Cross-roadmap citations resolved this round.** Main at `7bf4638`: ModularCurves (post-#1101) README 839 (0E), 901 (0G), 1882 (4D); `Suggested.lean` 757, 929, 942, 1109, 1120 and its 214 `#check` lines; AbhyankarLemma 29, 83, 318, 329, 346, 374; EtaleCohomologyFoundations 48, 553; SchubertGeometry 19; AdicSpacesPartIII 234, 5941. Open heads: ModularCurvesPartII (#913) lines 11, 230, 1537; ComplexComparisonPartII (#848) lines 52, 2654. Inside this pull request: LocalPurity 141; ReductiveGroups 36, 287, 364, 368, 389, 2912, 2922, 2938, 2956.

**Overlaps.** `overlaps.md`: no cited id dropped by an open pull request, no id this pull request drops that others cite (the tool misses moved content, hence R05), no open-revision-only id; #1187 is the one other open pull request changing this folder (R04). Ownership against the listed open heads: ModularCurvesPartII imports Layers 0–10 and rebuilds nothing; no second owner found.

**Citations.** The 10 "Lean names found nowhere" of `citations.md` are all declared in `Suggested.lean` (`ofCurve` 657, `yonedaProblem` 390, `isFinite_mulBy` 256, `isGroupHom_of_mapsZero` 244, `specialObj` 608, `toGeom` 223, `mulBy_eq_one_of_finrank` 121, `exists_of_hasProperty_affine` 497, `RepresentedBy` 419, `exists_representedBy_of_isRigid` 426).

**Seeded sample.** The nine sampled targets fall in unchanged text; each was checked in the previous review and its row is carried below. Nothing in this head's change touches them.

### Adversarial table

All statements are untouched by the (empty) diff; every row is carried from the previous report (PRREVIEW-ModularCurves~21), with its values, and the rows for R06 were recomputed by this round's probe.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| `mulBy_eq_one_of_finrank` (0B) | `μ_p/𝔽_p`; `(ℤ/2)_ℤ`; `S = ∅`, `n = 0` | `[p]x = x^p = 1` on `μ_p`; `[2] = 0` on `ℤ/2`; rank on `∅` is `fun _ ↦ 0`, both sides the unique map | true; pinned `pow_eq_one_of_finrank` (r21) | R01 |
| `finrank_mulBy`, `finrank_torsion` (2.3.1) | `E/ℚ`, `N = 2`; supersingular `E/𝔽̄_p`, `N = p`; `N = 1` | rank 4 = 2²; `[p]` purely inseparable, `E[p]` connected of rank `p²`; rank 1 | true; pinned `degree_intCast` gives `n.natAbs^2` (r21) | R01 |
| `etale_torsion_of_isUnit` | `ℤ[1/2]`, `N = 2`; `𝔽₂`, `N = 2`; `S = ∅` | étale of rank 4; `2 = 0`, hypothesis fails, `E[2]` not étale; empty map étale | true (r21) | R01 |
| `isCommMonObj_kernel_mulBy` | probe, this round | `by infer_instance` closes it; the site's `sorry` warning disappears, exit 0 | padding | R06 |
| `isGroupHom_of_mapsZero` (2.5.1) | `f = [−1]`; translation by `P ≠ 0`; zero map | `F = −𝟙`; excluded by `hf_zero`; `F = 0` | true (r21) | R02 |
| `exists_representedBy_of_isRigid` (4.7.0) | naive `[Γ(3)]/ℤ[1/3]`; naive `[Γ(2)]`; `P(E/S) = ∅`; `R = 0` | `Y_full(3) = Spec ℤ[1/3,ζ₃][μ,1/(μ³−1)]`; `[−1]` fixes every basis, not rigid; `rep X = ∅`; over `0` singleton | true (r21) | none |
| `IsRegularOfDimTwo` (def) | `Spec ℤ[1/3,ζ₃][μ,1/(μ³−1)]`; `∅`; `Spec 𝔽_p` | holds; fails `Nonempty`; dimension `0 ≠ 2` | discriminates (r21) | none |
| `axiomaticRegularity` (5.1.1) | Drinfeld `[Γ(2)]` at `p = 2`; trivial problem | rank `|GL₂(𝔽₂)| = 6`; Reg. 4B `Spec W(k)[[T]]` regular of dimension 2 | consistent (r21) | none |
| `formalGroup_p_eq_zero_of_pow_mem_span` | additive law over `𝔽_p`; `ℤ`, `p = 2`, `n = 1`; `ℤ/4`, `p = 2`, `n = 2` | hypothesis and `p = 0` hold; `2XY ∉ (X², Y²)`; coefficients 4, 6, 4 ≡ 0, 2, 0 | true (r21) | none |
| `exists_universalDeformation` (7D) | supersingular `E₀/𝔽̄_p` | `H¹(T) = 1`, `H² = 0`, pro-represented by `W(k)[[T]]`; `ψ` unique | true (r21) | none |
| `isCategoricalQuotient_of_isUnit_card` (7.1.3(3)) | `ℤ[x]`, `x ↦ −x`, over `𝔽₃` and `𝔽₂` | `𝔽₃[x²] = (𝔽₃[x])^{C₂}`; `𝔽₂[x²] ≠ 𝔽₂[x]`, excluded | true (r21) | none |
| `etale_mapRep_of_free` (7.1.3(2)) | empty base | `𝒫(E/∅)` singleton; `hfree` over nonempty bases | not vacuous (r21) | none |
| `isFinite_mapRep` | `ℚ[x₁,x₂,…]`, `C₂` negating | `A/B₊A` infinite-dimensional; `hP_ft` excludes it | load-bearing (r21) | none |
| `axiomaticRegularityOfQuotients` (7.5.1) | `[Γ₁(pⁿ)]`, `H = (ℤ/pⁿ)ˣ` | degree `φ(pⁿ)` = 8D rank | consistent (r21) | none |
| `exists_coarseModuliData`, `coarseModuli_quotient` (8.1.1, 8.1.5) | naive `[Γ(3)]`, `H = GL₂(𝔽₃)` | `Y_full(3)/H = Spec ℤ[1/3][j]`, `[Frac A₃ : ℚ(j)] = 24 = 48/2` | consistent (r21) | R02 |
| `ker_baseChange_of_noZeroSMulDivisors_coker` (9E) | `D = ℤ`, `·2`, `R = 𝔽₂`; diagonal `ℤ → ℤ²` | `𝔽₂` vs 0 (excluded); 0 = 0 | true; `Module.Flat` unused (r21) | none |
| quotient smoothness, 9D (sample) | `ℤ_(2)[x]`, `x ↦ −x`; `k[ε]`, char 2; `R[x,y]/(xy−π)` | smooth quotient; invariants not flat (`ker ε ≠ im ε`); regular, singular fibre | consistent (r21) | none |
| "diamond group has even order" (9D) | `N = 7, 13` | `|(ℤ/N)ˣ| = 6, 12`; `|Δ| = 3, 6` | true (r21) | none |
| `irreducibleSpace_of_connectedSpace` (5C) | `𝔸¹_k`; `𝔸¹ ⊔ 𝔸¹`; `k[x,y]/(xy)` | irreducible; excluded; excluded | true (r21) | none |
| `irreducibleSpace_baseChange_…` (5C sample) | `𝔸¹_{ℚ(i)}` over `ℚ` | `Y_ℚ̄ = 𝔸¹ ⊔ 𝔸¹`, `hconn` fails | load-bearing (r21) | R07 |
| `ringKrullDim_adicCompletion`, `isRegularLocalRing_adicCompletion_iff` (4D) | probe, this round; `ℤ_(p)`; `k[x,y]_(x,y)/(xy)` | `exact ringKrullDim_eq` and `exact isRegularLocalRing_iff.symm` close both, exit 0; 1 = 1; not regular either side | padding | R06 |
| 8C rings (sample) | `p = 2`, `n = 1` | `K̲ = (P)`, `h̲ = (P)`; `e₁(0, P) = P` | consistent (r21) | none |
| 8C proof lemmas (sample) | general `n` | `det(Q·|A₁) = ±∏[b](P)`; snake `0 → Ker/Q → A₂/Q → A₁/Q → 0` | consistent (r21) | none |
| 8C problems compared (sample) | `N = p` | `{aP : (a,p) = 1}` generators, `D ⊆ Gˣ` | consistent (r21) | none |
| Layer 10 class (sample) | `N = 5, 11, 13` | `|Δ| = 2, 5, 6`; `N = 11`: `5·1 + 5·11 = 60 = (121−1)/2` | consistent (r21) | none |
| Layer 10 Lean note (sample) | Mathlib `Normalization.lean` | seven names; `normalizationPullback` direction matches | verified (r21) | none |
| 0A Consumers (sample) | 5B rigidity route | pinned `isRigid_gammaNaive` uses variable change, no Picard | overstated (r21) | R08 |
| 5C contract (sample) | affine `Y(ρ)` | pinned `connectedSpace_primeSpectrum_tensorProduct_of_isAlgClosed` | "no roadmap owns" false (r21) | R07 |
| `EllipticCurve` (def) | unit at a 2-torsion section | `one_eq_zero` excludes it | discriminates; pin has `grpObj` (r21) | R01 |
| `IsCategoricalQuotient` (def) | `Spec k[x] → Spec k[x²]`; identity | invariant and universal; identity fails invariance | discriminates (r21) | none |
| `KatzMazurQuotientData` (def) | `q = 𝟙`, `H` nontrivial | `q1` fails | discriminates (r21) | none |
| README 2166, 773 | the pin | `jMap` at `JInvariant.lean:142`; `grpObj` at `GroupLaw.lean:272` | false (r21, reconfirmed) | R02 |
| branch vs main (this round) | `git diff --numstat origin/main HEAD -- TauCetiRoadmap/ModularCurves` | README 451/1387; Lean 577/819; STATUS 22/18; PROGRESS 0/9 | reverts main | R01, R04 |

## Not verifiable

- Katz–Mazur, *Arithmetic Moduli of Elliptic Curves*: no legal text (not in the manifest; no open copy). The sampled 8C locators (6.1 p. 155; 6.3.2 pp. 157–158; 6.3.3–6.3.6 pp. 159–162), 9D (pp. 508–509), KM 10.9.2 and the 4.6.2 erratum are cited by locator only; their mathematics is recomputed in the table.
- Buzzard's *Formalizing Fermat* Lecture 8, Katz's *Serre–Tate local moduli*, Lazard 1955, Loeffler, Deligne–Rapoport, SGA 3, Igusa and Conrad: not in the cache; none is cited for a step from inside its proof.
- Silverman `AEC`: settled as uncertified.
- The board manifest still records `STACKS-0A02`/`STACKS-0A03` for 4D and `AEC` for "7E PD-6"; neither is cited at this head. Left to the worker.

## Source issues

- none
