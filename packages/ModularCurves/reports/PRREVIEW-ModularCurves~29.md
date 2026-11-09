# Review of ModularCurves (pull request #1808 at edc8e6a)

**Verdict:** needs changes

This is an incremental re-review of 0 changed lines since `a96d197`. `git diff --stat a96d197 HEAD -- TauCetiRoadmap/ModularCurves` is empty, so none of the ten previous findings is repaired. The nine commits since `a96d197` touch only AlgebraicCurves, AlgebraicTopology, BordismFormalGroups, CharacteristicClasses, ComplexKahlerGeometry and LocalPurity. Of these, only the AlgebraicCurves rewrite affects text this roadmap cites. Its Layers 7, 8, 9 and 12 still resolve (see Verified sound). Main moved from `28c3fca` to `8192659`, but ModularCurves' README and `Suggested.lean` on main are unchanged since `6b029772` (#1101); `0b2b0ef4` touches only `PROGRESS.md`. The joint repair of R01, R02, R04, R05 and R06 therefore still applies: merge main into the branch, take main's ModularCurves folder, and re-apply the ownership move on top of it.

## R01 (P2) — `Suggested.lean` redefines pinned Tau Ceti carriers and re-`sorry`s theorems the pin proves; the branch reverts main

**Location.** `TauCetiRoadmap/ModularCurves/Suggested.lean` 88–94 (`structure FiniteFlatCommGroupScheme (S : Scheme.{u})`), 119–123 (`theorem mulBy_eq_one_of_finrank … mulBy G n = 1`), plus the other hand copies at 137–206 and 339–421. README 252–255: "where the library carries that record, it is the carrier, and `Suggested.lean`'s copy is deleted."

**Claim.** The file states its headlines on hand copies of carriers that are at the Tau Ceti pin, and it re-`sorry`s `pow_eq_one_of_finrank` and `PointedWeierstrassAtlas.isLocallyWeierstrass`. Main carries the repaired folder, so merging this branch would replace main's README and `Suggested.lean` with this older pair.

**Witness.** Tau Ceti pin `2fd255d99`: `FiniteFlatCommGroupScheme` (`AlgebraicGeometry/GroupScheme/FiniteFlat.lean:58`), `pow_eq_one_of_finrank` (`GroupScheme/KilledByRank.lean:121`), `grpObj` (`EllipticCurve/Scheme/Geom/GroupLaw.lean:272`). Against main `8192659`, `git diff --numstat origin/main HEAD -- TauCetiRoadmap/ModularCurves` gives README 451/1387 and Lean 577/819.

**Repair.**
1. Merge `origin/main` into the branch and take main's `README.md` and `Suggested.lean` (the merged #1101 folder), keeping main's `STATUS.md` and `PROGRESS.md`.
2. Re-apply this pull request's move on top: delete the strict-henselisation strand and the Artinian test algebras, and cite SchemeAndStackFoundations §§0.12a, 0.21, 1.1, 1.17, 1.23, 4.2, 4.13 and 4.15.
3. Delete the README targets that pinned results discharge, and cite those results in §Exact supplier contracts.

## R02 (P2) — headlines statable at the pins are declared "not statable"

**Location.** `Suggested.lean` 39–55, e.g. "the coarse `j`-line KM 8.2.1: the `j`-invariant of an elliptic curve over a base as a morphism to `Spec ℤ[j]`". README 773–774 ("the group law on `projModel W` (Layer 1D), which is not at the pin") and 2166–2167 ("which lacks the `j`-invariant morphism").

**Claim.** Every object the docstring names as missing is at the pin. These headlines are therefore absent although statable: the First Main Theorem for `[Γ(N)]` and `[Γ₁(N)]`, KM 6.6.1, KM 8.2.1, and KM 4.7.2 for `Y_full(N)`.

**Witness.** Tau Ceti pin `2fd255d99`: `ModuliProblem.gamma` (`ModularCurve/FullLevel.lean:86`), `gammaOne` (`Gamma/One.lean:81`), `gammaZero` (`Gamma/Zero.lean:70`), `EllipticCurveGeom.jMap` (`Geom/JInvariant.lean`, module doc line 23), `grpObj` (`GroupLaw.lean:272`). Main's `Suggested.lean` already states these headlines.

**Repair.** The merge of R01 restores the headlines. Then cut the docstring's not-statable list to what is really missing, and delete README 773–774 and 2166–2167.

## R03 (P3) — the gate fails on two files outside the folders the pull request names

**Location.** `Completed/ArithmeticDirichletSeries/README.md` ("`LFunctions` consumes this package and supplies its own character-specific continuation") and `TauCetiRoadmap/SymplecticGeometry/README.md` ("boundary and sign adapters consumed by HeegaardFloer and consumed by DGFloer"). Each file changes one line.

**Claim.** The worker's gate at `edc8e6a` reports `outside-folder=2` and FAIL. No acceptance is possible while the gate fails.

**Witness.** `git diff --stat origin/main...HEAD`, excluding the fifteen named folders, prints exactly these two files (2 insertions, 2 deletions). My gate re-run lists both among its 28 `outside-folder` lines; the other 26 lines belong to the named folders.

**Repair.** Choose one of: revert the two lines; carry them in the pull request that owns those folders; or name both folders as this pull request's own in its description.

## R04 (P3) — the branch base predates the merge of #1101, and #1187 conflicts with no stated order

**Location.** The description's merge-order paragraph: "#1101 (ModularCurves) → #1807 (the other loops) → **this pull request**".

**Claim.** #1101 merged into main as `6b029772`, but this branch's merge base comes before that merge. The paragraph still lists #1101 as pending and omits #1187.

**Witness.** `git merge-base origin/main HEAD` = `a891cd19`. `scratch/overlaps.md` (index of 2026-11-09) lists #1187 ("chore: bump TauCeti to ab00ba392", head `66ed0d4`) as conflicting with #1808 in `TauCetiRoadmap/ModularCurves/Suggested.lean`.

**Repair.** The merge of R01. Then drop #1101 from the paragraph, and state which of #1187 and this pull request is rebased on the other.

## R05 (P3) — content moved out of Layers 0E, 0G and 4D without an old → new line for the roadmaps that cite it

**Location.**
- README 1305–1313: 4D now consumes "the strict henselisation of a local ring … (§0.12a …)".
- README 489–491: 0E moves to §1.1.
- README 534–537: 0G moves to §0.3a.
- §Downstream consumers (2618–2620) has one bullet.

**Claim.** Roadmaps on main still cite ModularCurves §4D, §0G and §0E, and the Lean names `EllipticCurve.toOver` and `EllipticCurve.ofWeierstrass`. So does ReductiveGroups inside this pull request. The README gives none of them an old → new line.

**Witness.**
- Main `8192659`: AbhyankarLemma 29, 83, 318, 329, 346, 374 (§4D); EtaleCohomologyFoundations 48, 553 (Layer 4D); SchubertGeometry 19 (§0G); AdicSpacesPartIII 234 (`toOver`, `ofWeierstrass`) and 5941 (§0E).
- This head: ReductiveGroups 36, 364, 368, 389, 2912, 2922, 2988 (§0E).

**Repair.** In §Scope and ownership, add one line per moved item:
- 4D strict henselisation → SchemeAndStackFoundations §0.12a
- 0G Grassmannian → §0.3a
- 0E affine, finite locally free and closed descent → §1.1
- 0C quotients → §1.17
- 7D test algebras → §4.2
- miracle flatness and the regular locus → §§4.13 and 0.21
- `EllipticCurve.toOver`, `ofWeierstrass` → the pinned `EllipticCurveGeom` and `WeierstrassCurve.projModel` API

In §Downstream consumers, list the roadmaps that cite this one at the merged state: at least AbhyankarLemma, EtaleCohomologyFoundations, SchubertGeometry, AdicSpacesPartIII and ReductiveGroups. Do not list LocalPurity or BordismFormalGroups; neither mentions ModularCurves at this head.

## R06 (P3) — padding: three declarations close in one tactic

**Location.** `Suggested.lean` 280–282 (`isCommMonObj_kernel_mulBy`), 886–890 (`ringKrullDim_adicCompletion`), 892–898 (`isRegularLocalRing_adicCompletion_iff`); README 1317–1319.

**Claim.** This round's probe confirms it again: `infer_instance` closes the first declaration, `exact TauCeti.AdicCompletion.ringKrullDim_eq` closes the second, and `exact TauCeti.AdicCompletion.isRegularLocalRing_iff.symm` closes the third.

**Witness.** The two lemmas are pinned at `RingTheory/AdicCompletion/LocalRing.lean:52` and `:58`. The scratch probe adds `import TauCeti.RingTheory.AdicCompletion.LocalRing` and makes the three replacements. It elaborates with exit 0, 0 errors and 31 `sorry` warnings (34 before).

**Repair.** Delete the three declarations from `Suggested.lean`, cite the two pinned lemmas in §Exact supplier contracts, and rewrite the 4D bullet as a consumption.

## R07 (P3) — Layer 5C's "external contract" is partly at the pin and planned by named roadmaps

**Location.** README 1470–1474: "No roadmap in this repository owns these statements … all three statements sit behind a GAGA-style development that no roadmap has adopted."

**Claim.** The first of the three statements is pinned for affine schemes. ModularCurvesPartII says it discharges the other two, and ComplexComparisonPartII plans the analytic side.

**Witness.**
- Pinned `connectedSpace_primeSpectrum_tensorProduct_of_isAlgClosed` (`RingTheory/Idempotents/Connected/ScalarExtension.lean:64`).
- ModularCurvesPartII at its open head, line 230: "Layer 5C: … Its three comparison contracts are discharge[d]".
- ComplexComparisonPartII C4.

**Repair.**
1. Cite the pinned lemma for the first statement.
2. Say that ModularCurvesPartII Layers 4 and 6 discharge the rest downstream, and delete "No roadmap … owns" and "no roadmap has adopted". Keep `hconn`.
3. In the same paragraph, the AlgebraicCurves exclusion of the compact-Riemann-surface comparison is now stated in its §Scope and ownership ("Outside the roadmap", line 90–91), not in its Layer 12; cite it there.

## R08 (P3) — the rigidity route makes 4C and 5B wait on Picard duality, but the pinned rigidity needs none

**Location.** README 366–367 ("Full-level representability in Layer 5B also uses the endomorphism rigidity of Layer 2F, hence the Picard duality of Layer 2D"), 1241–1242, 1285–1286, 1413–1414.

**Claim.** The pin proves KM 2.7.2 for the naive full-level problem without any Picard input.

**Witness.** `ModuliProblem.isRigid_gammaNaive` (`ModularCurve/NaiveLevel.lean:328`, `(hN : 3 ≤ N)`) rests on `Geom/Rigidity.lean`, whose only import is `TauCeti.AlgebraicGeometry.EllipticCurve.Scheme.ZeroSection`.

**Repair.** Name the pinned rigidity as the input in all four places, and drop the Picard-duality dependency there.

## R09 (P3) — supplier-contract claims: `#check` pins, the strict henselisation at the pin, an undocumented Lean name

**Location.** README 252 ("Each of these is pinned by a `#check` in `Suggested.lean`"); README 1305–1313; `Suggested.lean` 590 (`structure ArtinianTestAlgebra (p : ℕ) [Fact p.Prime] (k : Type u) [CommRing k]`).

**Claim.** The file has 13 `#check` lines for 26 listed names. The strict henselisation is at the pin but is cited only to §0.12a. `ArtinianTestAlgebra` does not appear in the README.

**Witness.** `grep -c '^#check' Suggested.lean` = 13. `TauCeti.StrictHenselization` is in `RingTheory/StrictHenselization/Algebra.lean` (namespace at line 36). `grep -c ArtinianTestAlgebra README.md` = 0.

**Repair.**
- Either correct the `#check` sentence or add the missing `#check` lines.
- In 4D, cite the pinned `TauCeti.StrictHenselization` declarations by name.
- Either name `ArtinianTestAlgebra` in 7D or remove it with the R01 move.

## R10 (P3) — Layer 4D has two contradictory `**Dependencies.**` lines

**Location.** README 1336–1338: "**Dependencies.** Layers 4A and 4C, SchemeAndStackFoundations §§0.12a, 0.21 and 4.13, and Mathlib's regular-local-ring theory." and "**Dependencies.** Layers 4A and 4C and Mathlib's regular-local-ring theory."

**Claim.** The second line contradicts the first by omitting the SchemeAndStackFoundations dependencies.

**Witness.** `sed -n 1336,1338p README.md` prints both lines.

**Repair.** Delete line 1338.

## Previous findings

- R01 — not repaired: `Suggested.lean` 88 still declares `structure FiniteFlatCommGroupScheme (S : Scheme.{u})`; 119–123 still `sorry` `mulBy_eq_one_of_finrank`; the folder still differs from main `8192659` by 451/1387 (README) and 577/819 (Lean).
- R02 — not repaired: the docstring at 39–55 still lists the First Main Theorem, KM 8.2.1 and `Y₁(N)`, `Y_full(N)` as not statable; README 773–774 and 2166–2167 are unchanged.
- R03 — not repaired: the worker's gate at `edc8e6a` reports `outside-folder=2` for the same two files.
- R04 — not repaired: the merge base is still `a891cd19`; the merge-order paragraph still reads "#1101 (ModularCurves) → #1807 (the other loops) → this pull request" and omits #1187.
- R05 — not repaired: §Scope and ownership has no old → new line; §Downstream consumers still has one bullet, "The Eisenstein-ideal application of §The Mazur interface consumes Layer 10."
- R06 — not repaired: the three declarations are still at 280–282 and 886–898 with `sorry`; the probe closes all three again (31 sorries).
- R07 — not repaired: README 1470 still says "No roadmap in this repository owns these statements".
- R08 — not repaired: README 366–367 still says "hence the Picard duality of Layer 2D".
- R09 — not repaired: README 252 is unchanged; the file has 13 `#check` lines; `ArtinianTestAlgebra` is still absent from the README.
- R10 — not repaired: lines 1336 and 1338 both still begin `**Dependencies.**`.

## Verified sound

### Change set and pins

- `git diff --stat a96d197 HEAD -- TauCetiRoadmap/ModularCurves lake-manifest.json lean-toolchain` is empty. The pins are Mathlib `1b1ccf4b` and Tau Ceti `2fd255d99`.
- The nine commits since `a96d197` (`01872e77`, `6c9a62ac`, `1e85c710`, `55323ac5`, `79331692`, `09909fe5`, `43a6b849`, `43224230`, `edc8e6a7`) change only AlgebraicCurves, AlgebraicTopology, BordismFormalGroups, CharacteristicClasses, ComplexKahlerGeometry and LocalPurity.
- Main is at `8192659`. Of the 67 commits since `28c3fca`, the only one touching ModularCurves is `0b2b0ef4` (`PROGRESS.md`, +9).

### Effect of the sibling changes on this roadmap

`grep -c ModularCurves` on each changed sibling README, at this head and at `a96d197`:

| Sibling | This head | `a96d197` |
|---|---|---|
| AlgebraicCurves | 1 | 0 |
| AlgebraicTopology | 0 | 0 |
| BordismFormalGroups | 0 | 3 |
| CharacteristicClasses | 0 | 0 |
| ComplexKahlerGeometry | 0 | 0 |
| LocalPurity | 0 | 0 |

**AlgebraicCurves** (rewritten, 4370 lines changed). ModularCurves cites its Layers 7–9 and 12 at README 278–280, 2404–2410 and 2557–2560. Each citation resolves at this head:
- Layer 7 (line 1067): §7.1 different divisor, §7.2 Dedekind's different theorem, §7.4 the Hurwitz formula `[k′ : k](2g′ − 2) = [F′ : F](2g − 2) + [k′ : k] deg Diff`.
- Layer 8: §8.6 lower ramification groups; §8.7 Hilbert's different formula; §8.9 states the boundary, with upper numbering, Herbrand and Hasse–Arf consumed from LocalFieldsRamification Layer 3, so "lower numbering only" still holds.
- Layer 9: §9.3 the Kähler-differential comparison.
- Layer 12: §12E, the `χ`-form comparison and genus; §12C, the anti-equivalence specialised to isogenies, which is what README 69 and 779 hand to AlgebraicCurves.

Its new line 2267 ("ModularCurves consumes Layers 7–9 and 12") agrees with this README. Its scope line 72–75 ("the moduli-theoretic theory is no part of this roadmap") leaves no shared object.

**BordismFormalGroups.** Its three claims that ModularCurves consumes F1's height classification (old lines 53, 457, 2534) are gone. ModularCurves never cites BordismFormalGroups; PD-5 (README 1619–1624) cites Lazard. The supply mismatch noted as a remark in the previous report is resolved by the sibling change.

**The other four** (AlgebraicTopology, CharacteristicClasses, ComplexKahlerGeometry, LocalPurity) neither cite ModularCurves nor are cited by it.

### Remark on untouched text (no change requested beyond R07's repair)

README 1472 places AlgebraicCurves' exclusion of the compact-Riemann-surface comparison in "its Layer 12". At this head that exclusion is stated in AlgebraicCurves §Scope and ownership (line 90–91), and Layer 12 indeed does not contain it. The claim stays true; only the locator moved. R07's repair rewrites this paragraph anyway.

### Gate

- The worker's gate at `edc8e6a`: every scanner 0, `build=0`, `outside-folder=2`, FAIL (R03).
- My re-run with `--base origin/main`, without the folder exclusions: every scanner 0, `outside-folder=28`, FAIL. The 28 are the two files of R03 plus files of the named folders.

### Dependency check

```
depcheck: 237 roadmaps, 2309 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

### Elaboration

`lake env lean TauCetiRoadmap/ModularCurves/Suggested.lean`, run from the worktree root:
- exit 0, in 14 s;
- 34 `declaration uses sorry` warnings, 0 other warnings, 0 errors;
- the rest of the output is the 13 `#check` pins.

### One-tactic probe (R06)

A scratch copy with one added import and three one-tactic replacements elaborates with exit 0 and 31 `sorry` warnings. The other 31 sorried statements were probed in earlier rounds with `first | rfl | infer_instance | simp` and stayed open; the file and pins are unchanged.

### Signatures

`signatures.md` lists 83 declarations, none with a dropped section binder. Its two parse errors (`#check @;`, `#check @of`) are artefacts of the tool's name extraction, not of `Suggested.lean`, which elaborates cleanly. Spot-checked binders:
- `torsionInclusion` has `[NeZero m] [NeZero n]` and `m ∣ n`;
- `hasProperty_finite` has `[IsNoetherianRing ↑R]`;
- `exists_universalDeformation` has `[IsAlgClosed k] [CharP k p]`.

### Library declarations opened at the pin this round

All under `TauCeti/`:
- `AlgebraicGeometry/GroupScheme/FiniteFlat.lean:58`
- `GroupScheme/KilledByRank.lean:121`
- `EllipticCurve/Scheme/Geom/GroupLaw.lean:272`
- `Geom/JInvariant.lean:23`
- `ModularCurve/FullLevel.lean:86`
- `Gamma/One.lean:81`
- `Gamma/Zero.lean:70`
- `NaiveLevel.lean:328`
- `Geom/Rigidity.lean:11` (its only import)
- `RingTheory/AdicCompletion/LocalRing.lean:43, 52, 58`
- `RingTheory/Idempotents/Connected/ScalarExtension.lean:64`
- `RingTheory/StrictHenselization/Algebra.lean:36`
- `RingTheory/RegularLocalRing/MiracleFlatness.lean:72`

That is 14 locations.

### Cross-roadmap citations resolved this round

- Main `8192659`: AbhyankarLemma 29, 62, 83, 111, 318, 329, 346, 374; EtaleCohomologyFoundations 48, 335, 350, 553; SchubertGeometry 19; AdicSpacesPartIII 117, 234, 402, 5941, 8821–8918. Sixteen other roadmap READMEs on main mention ModularCurves.
- This head:
  - AlgebraicCurves 72–79, 90–91, 1067–1198, 1349–1436, 1528–1611, 2037–2243 and 2267;
  - ReductiveGroups 36, 287, 364, 368, 389, 2912, 2922, 2938, 2956, 2988 (unchanged since `a96d197`);
  - SchemeAndStackFoundations (unchanged since `a96d197`; §§0.12a, 0.21, 4.13 as resolved in the previous report).
- Open heads: ModularCurvesPartII (Layer 4 at its line 1356, the Layer 5C contract at line 230); ComplexComparisonPartII (C4 at line 54); #1807 (draft, `cabeb14`) and #1187 (`66ed0d4`) for R04.

### Overlaps

- `overlaps.md` reports no cited id dropped by an open pull request, no id that only an open revision defines, and no id this pull request drops that others cite. The tool does not detect moved content, hence R05.
- #1187 is the only other open pull request that changes this folder (R04).
- Ownership against the listed open heads is unchanged: ModularCurvesPartII imports Layers 0–10 and rebuilds nothing. The AlgebraicCurves rewrite takes no ModularCurves object.

### Citations

The 10 "Lean names found nowhere" in `citations.md` are all declared in `Suggested.lean`, e.g. `EllObj.ofCurve`, `ModuliProblem.RepresentedBy`, `KatzMazurQuotientData.exists_of_hasProperty_affine`.

### Seeded sample

All nine targets fall in unchanged text: "Consumers" (360), 5C (1444, 1459), 8C (1806, 1827, 1846), 9D (2099) and Layer 10 (2236, 2456). Their rows are carried below. The 1472 neighbour of 1459 is the remark above.

### Adversarial table

The diff is empty, so every statement is untouched.
- (r21): values carried from PRREVIEW-ModularCurves~21 to ~23.
- (r25): values carried from PRREVIEW-ModularCurves~25.
- (r29): recomputed this round.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| `mulBy_eq_one_of_finrank` (0B) | `μ_p/𝔽_p`; `(ℤ/2)_ℤ`; `S = ∅`, `n = 0` | `[p]x = x^p = 1` on `μ_p`; `[2] = 0` on `ℤ/2`; on `∅` both sides the unique map | true; pinned `pow_eq_one_of_finrank:121` (r29 re-opened) | R01 |
| `finrank_mulBy`, `finrank_torsion` (2.3.1) | `E/ℚ`, `N = 2`; supersingular `E/𝔽̄_p`, `N = p`; `N = 1` | rank 4 = 2²; `E[p]` connected of rank `p²`; rank 1 | true (r21) | R01 |
| `etale_torsion_of_isUnit` | `ℤ[1/2]`, `N = 2`; `𝔽₂`, `N = 2`; `S = ∅` | étale rank 4; hypothesis fails, `E[2]` not étale; empty map étale | true (r21) | R01 |
| `isCommMonObj_kernel_mulBy` | probe | `by infer_instance` closes it; exit 0, 31 sorries | padding (r29) | R06 |
| `isGroupHom_of_mapsZero` (2.5.1) | `f = [−1]`; translation by `P ≠ 0`; zero map | `F = −𝟙`; excluded by `hf_zero`; `F = 0` | true (r21) | R02 |
| `exists_representedBy_of_isRigid` (4.7.0) | naive `[Γ(3)]/ℤ[1/3]`; naive `[Γ(2)]`; `P(E/S) = ∅`; `R = 0` | `Y_full(3) = Spec ℤ[1/3,ζ₃][μ,1/(μ³−1)]`; `[−1]` fixes every basis; `rep X = ∅`; singleton over `0` | true (r21) | none |
| `IsRegularOfDimTwo` (def) | `Spec ℤ[1/3,ζ₃][μ,1/(μ³−1)]`; `∅`; `Spec 𝔽_p` | holds; fails `Nonempty`; dimension `0 ≠ 2` | discriminates (r21) | none |
| `axiomaticRegularity` (5.1.1) | Drinfeld `[Γ(2)]` at `p = 2`; trivial problem | rank `|GL₂(𝔽₂)| = 6`; `Spec W(k)[[T]]` regular of dimension 2 | consistent (r21) | none |
| `formalGroup_p_eq_zero_of_pow_mem_span` | additive law over `𝔽_p`; `ℤ`, `p = 2`, `n = 1`; `ℤ/4`, `p = 2`, `n = 2` | `p = 0` holds; `2XY ∉ (X², Y²)`; coefficients 4, 6, 4 ≡ 0, 2, 0 | true (r21) | none |
| `exists_universalDeformation` (7D) | supersingular `E₀/𝔽̄_p` | `H¹(T) = 1`, `H² = 0`, pro-represented by `W(k)[[T]]` | true (r21) | none |
| PD-5 height-2 uniqueness (7E) | `𝔾̂ₘ`, `𝔾̂ₐ` over `𝔽̄_p`; supersingular `Ê₀` | heights 1, ∞, 2, pairwise non-isomorphic; cited to Lazard; BordismFormalGroups at this head no longer claims to supply it | consistent (r29) | none |
| `isCategoricalQuotient_of_isUnit_card` (7.1.3(3)) | `ℤ[x]`, `x ↦ −x`, over `𝔽₃` and `𝔽₂` | `𝔽₃[x²] = (𝔽₃[x])^{C₂}`; `𝔽₂[x²] ≠ 𝔽₂[x]`, excluded | true (r21) | none |
| `etale_mapRep_of_free` (7.1.3(2)) | empty base | `𝒫(E/∅)` singleton; `hfree` over nonempty bases | not vacuous (r21) | none |
| `isFinite_mapRep` | `ℚ[x₁,x₂,…]`, `C₂` negating | `A/B₊A` infinite-dimensional; `hP_ft` excludes it | load-bearing (r21) | none |
| `axiomaticRegularityOfQuotients` (7.5.1) | `[Γ₁(pⁿ)]`, `H = (ℤ/pⁿ)ˣ` | degree `φ(pⁿ)` = 8D rank | consistent (r21) | none |
| `exists_coarseModuliData`, `coarseModuli_quotient` (8.1.1, 8.1.5) | naive `[Γ(3)]`, `H = GL₂(𝔽₃)` | `Y_full(3)/H = Spec ℤ[1/3][j]`; `[Frac A₃ : ℚ(j)] = 24 = 48/2` | consistent (r21) | R02 |
| `ker_baseChange_of_noZeroSMulDivisors_coker` (9E) | `D = ℤ`, `·2`, `R = 𝔽₂`; diagonal `ℤ → ℤ²` | `𝔽₂` vs 0 (excluded); 0 = 0 | true (r21) | none |
| 9D quotient smoothness (sample 2099) | `ℤ_(2)[x]`, `x ↦ −x`; `k[ε]`, char 2; `R[x,y]/(xy−π)` | smooth quotient; invariants not flat; regular, singular fibre | consistent (r21) | none |
| 9D diamond group even order | `N = 7, 13` | `|(ℤ/N)ˣ| = 6, 12`; `|Δ| = 3, 6` | true (r21) | none |
| Layer 10 item 3, `χ`-form different vs AlgebraicCurves §7.4 at this head | Shimura cover `X₁(N) → X₀(N)`, `d = (N−1)/2`; `N = 11`, `N = 13` | `N = 11`: `g₁ = g₀ = 1`, `−2·0 + 10·0 = 0` = Hurwitz `0 − 5·0 = 0`. `N = 13`: `g₁ = 2`, `g₀ = 0`, `−2(−1) + 12·1 = 14` = Hurwitz `2 − 6(−2) = 14` = local count `2·3·1 + 2·2·2 = 14` (ν₂ = ν₃ = 2) | consistent; citation resolves (r29) | none |
| `irreducibleSpace_of_connectedSpace` (5C, sample 1444) | `𝔸¹_k`; `𝔸¹ ⊔ 𝔸¹`; `k[x,y]/(xy)` | irreducible; excluded; excluded | true (r21) | none |
| 5C base change (sample 1459) | `𝔸¹_{ℚ(i)}` over `ℚ` | `Y_ℚ̄ = 𝔸¹ ⊔ 𝔸¹`, `hconn` fails | load-bearing (r21) | R07 |
| `ringKrullDim_adicCompletion`, `isRegularLocalRing_adicCompletion_iff` (4D) | probe; `ℤ_(p)`; `k[x,y]_(x,y)/(xy)` | both close by one `exact`, exit 0; 1 = 1; not regular on either side | padding (r29) | R06 |
| 8C rings (sample 1827) | `p = 2`, `n = 1` | `K̲ = (P)`, `h̲ = (P)`; `e₁(0, P) = P` | consistent (r21) | none |
| 8C proof lemmas (sample 1846) | general `n` | `det(Q·|A₁) = ±∏[b](P)`; snake `0 → Ker/Q → A₂/Q → A₁/Q → 0` | consistent (r21) | none |
| 8C problems compared (sample 1806) | `N = p` | `{aP : (a,p) = 1}` generators, `D ⊆ Gˣ` | consistent (r21) | none |
| Layer 10 class (sample 2236) | `N = 5, 11, 13` | `|Δ| = 2, 5, 6`; `N = 11`: `5·1 + 5·11 = 60 = (121−1)/2` | consistent (r21) | none |
| Layer 10 Lean note (sample 2456) | Mathlib `Normalization.lean` | seven names; `normalizationPullback` direction matches | verified (r21) | none |
| 0A Consumers (sample 360) | 5B rigidity route | pinned `isRigid_gammaNaive:328`; `Rigidity.lean` imports only `ZeroSection` | overstated (r29 re-opened) | R08 |
| 5C contract | affine `Y(ρ)` | pinned `connectedSpace_primeSpectrum_tensorProduct_of_isAlgClosed:64`; ModularCurvesPartII line 230 discharges 5C | "no roadmap owns" false (r29) | R07 |
| `EllipticCurve` (def) | unit at a 2-torsion section | `one_eq_zero` excludes it | discriminates; pin has `grpObj:272` (r25) | R01 |
| `IsCategoricalQuotient` (def) | `Spec k[x] → Spec k[x²]`; identity | invariant and universal; identity fails invariance | discriminates (r21) | none |
| `KatzMazurQuotientData` (def) | `q = 𝟙`, `H` nontrivial | `q1` fails | discriminates (r21) | none |
| README 2166, 773 | the pin | `jMap` in `JInvariant.lean`; `grpObj` at `GroupLaw.lean:272` | false (r29 re-opened) | R02 |
| branch vs main | `git diff --numstat origin/main HEAD -- TauCetiRoadmap/ModularCurves` at `8192659` | README 451/1387; Lean 577/819; STATUS 22/18; PROGRESS 0/18 | reverts main (r29) | R01, R04 |

## Not verifiable

- Katz–Mazur, *Arithmetic Moduli of Elliptic Curves*: no legal text (not in the manifest; no open copy). The sampled 8C locators (6.1, p. 155; 6.3.2, pp. 157–158; 6.3.3–6.3.6, pp. 159–162) and the 9D locator are cited by locator only. Their mathematics is recomputed in the table.
- Not in the cache: Lazard 1955, Katz's *Serre–Tate local moduli*, Buzzard's *Formalizing Fermat* Lecture 8, Deligne–Rapoport, SGA 3, Igusa, Conrad. None is cited for a step taken from inside its proof.
- Silverman `AEC`: settled as uncertified.

## Source issues

- none
