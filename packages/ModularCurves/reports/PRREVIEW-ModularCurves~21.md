# Review of ModularCurves (pull request #1808 at d1a45bf)

**Verdict:** needs changes

The folder at this head is #1101's revision `063c2e1` plus this pull request's ownership move. It is not #1101's head `c97e9998`. So it reverts the repairs #1101 made after `063c2e1`: in particular the move of `Suggested.lean` onto the pinned Tau Ceti modular-curve carriers. That revert is the cause of R01 and R02. The ownership move itself is sound: every SchemeAndStackFoundations section it cites exists at this head with the cited content (see Verified sound).

## R01 (P2) — `Suggested.lean` redefines pinned Tau Ceti carriers and re-`sorry`s theorems the pin already proves

**Location.** `TauCetiRoadmap/ModularCurves/Suggested.lean` lines 88–94, 137–206, 339–421 (`FiniteFlatCommGroupScheme`, `PointedWeierstrassChart`, `PointedWeierstrassAtlas`, `IsLocallyWeierstrass`, `EllipticCurveGeom`, `EllObj`, `ModuliProblem`, `RelRepData`, `HasProperty`, `IsRigid`). Also lines 121, 182, 190 and 256–318. README 252–255 says: "where the library carries that record, it is the carrier, and `Suggested.lean`'s copy is deleted."

**Claim.** The file states the roadmap's headlines on its own copies of carriers that pinned Tau Ceti already has. It also states, with `sorry`, theorems that the pin proves. The README makes the same mistake for:
- 0B, killed by rank;
- 1A and 1D, the elliptic-curve record and its group law;
- 2A, KM 2.3.1;
- 2D items 1–3, the relative Picard functor, its degree-zero part and Abel–Jacobi;
- 2F, KM 2.7.2;
- 4A, the moduli carriers;
- 5A, `Y₁(N)`.

**Witness.** At Tau Ceti `2fd255d`:
- the carriers: `TauCeti.AlgebraicGeometry.FiniteFlatCommGroupScheme` (`GroupScheme/FiniteFlat.lean:58`), `EllipticCurveGeom` (`EllipticCurve/Scheme/Geom/Basic.lean:577`), `EllObj` (`ModularCurve/Ell.lean:98`), `RelRepData` (`ModularCurve/ModuliProblem.lean:127`) and `IsRigid` (`ModularCurve/ModuliProblem.lean:283`);
- theorems the file re-`sorry`s: `PointedWeierstrassAtlas.isLocallyWeierstrass` (`Geom/Basic.lean:549`) and `FiniteFlatCommGroupScheme.pow_eq_one_of_finrank` (`GroupScheme/KilledByRank.lean:121`).

**Repair.** Rebuild both files on #1101's head `c97e9998`, which states everything on these carriers, and then re-apply this pull request's move:
- delete the strict-henselisation strand and the Artinian test algebras, and cite SchemeAndStackFoundations for the moved content;
- in §Exact supplier contracts, cite the pinned KM 2.3.1 results by name and file: `EllipticCurveGeom.degree_intCast` and `isogenyOfDegree_intCast` (`Geom/Isogeny.lean:117`, `:123`) and `etale_torsion_hom_of_forall_intCast_ne_zero` (`Geom/Torsion/Etale/Locus.lean:89`);
- also cite there the pinned group law `EllipticCurveGeom.grpObj` (`Geom/GroupLaw.lean:272`), the relative Picard package `relativePicardPresheaf` (`PicardFunctor/Relative.lean:84`) with the `PicZero` and `Abel` files, and `ModuliProblem.isRigid_gammaNaive` (`ModularCurve/NaiveLevel.lean:328`);
- delete the README targets those pinned results discharge.

Tested: `c97e9998`'s `Suggested.lean`, elaborated with `lake env lean` at this pin, exits 0 with 36 `sorry` warnings only.

## R02 (P2) — headlines that are statable at the pins are declared "not statable"

**Location.** `Suggested.lean` 41–55: the First Main Theorem for `[Γ(N)]` and `[Γ₁(N)]` "lacks Drinfeld level structures"; KM 8.2.1 lacks "the `j`-invariant … as a morphism to `Spec ℤ[j]`"; `Y₁(N)` and `Y_full(N)` lack "naive level structures on `E[N]`". README 773–774 says the degree bridge "needs the group law … which is not at the pin". README 2166–2167 says the same for the `j`-line.

**Claim.** Each object said to be missing is at the pin. As a result the following statable headlines are absent:
- the First Main Theorem for `[Γ(N)]` and for `[Γ₁(N)]`;
- KM 6.6.1;
- KM 8.2.1 over `ℤ` and over every ring;
- KM 4.7.2 for `Y_full(N)`.

**Witness.** All at the pin:
- `ModuliProblem.gamma` (`ModularCurve/FullLevel.lean:86`), `gammaOne` (`ModularCurve/Gamma/One.lean:81`) and `gammaZero` (`ModularCurve/Gamma/Zero.lean:70`);
- `EllipticCurveGeom.jMap` (`Geom/JInvariant.lean:142`);
- `EllObj.yOne` (`ModularCurve/YOne.lean:475`);
- `grpObj` (`Geom/GroupLaw.lean:272`).

`c97e9998` states these headlines as `firstMainTheorem_gamma` (line 929), `firstMainTheorem_gammaOne` (942), `exists_relRepData_gammaZero` (978), `exists_coarseModuliData_gamma_one` (1109), `exists_coarseModuliData_gamma_one_of_ring` (1120) and `exists_representableBy_gammaNaive` (757).

**Repair.** This is the same rebase as R01:
- restore those six statements;
- cut the docstring's list of non-statable headlines to what is really missing at the pin: balanced `[Γ₁(N)]`; KM 6.1.1, 6.2.1 and 6.5.1; the dual isogeny, Cartier–Nishi and Weil pairing; `det_N`, `Y(N, ζ)` and `Y(ρ)`; Layer 10;
- delete the false sentences at README 773–774 and 2166–2167.

Tested: all six elaborate at this pin (same run as R01).

## R03 (P3) — the gate fails: files outside the roadmap folders the pull request names

**Location.** `Completed/ArithmeticDirichletSeries/README.md:331` and `TauCetiRoadmap/SymplecticGeometry/README.md:77`.

**Claim.** The worker's gate reports `outside-folder=2`. My re-run of the gate shows the same two files among its outside-folder list. Neither folder is one of the pull request's named roadmap folders.

**Witness.** `git diff --stat origin/main...HEAD` restricted outside the 15 named folders lists exactly these two one-line edits. They came in from the decycle merges (commits `e591d103` and `61e5385e`).

**Repair.** Drop both edits from this branch: revert the two lines, or carry them in the pull request that owns those folders. Alternatively, name both folders as this pull request's own in its description.

## R04 (P3) — the stacked base is a stale revision of #1101, and #1187 conflicts with no stated order

**Location.** Commit `f46eabe0` ("the revision of pull request 1101 as the base"). The overlaps report: "#1101 and #1808 conflict in `TauCetiRoadmap/ModularCurves/README.md`, `…/Suggested.lean`". The same file reports that #1187 conflicts in `…/ModularCurves/Suggested.lean`.

**Claim.** The description says the branch "starts from #1101's head". In fact the folder at `f46eabe0` is byte-identical to #1101 at `063c2e1`, and it differs from #1101's head `c97e9998` by 425/1273 README and 731/819 Lean lines. The merge-order paragraph does not mention #1187, the Tau Ceti bump.

**Witness.** `git diff --numstat 063c2e1 f46eabe0 -- TauCetiRoadmap/ModularCurves` is empty. `git diff --numstat c97e9998 f46eabe0 -- TauCetiRoadmap/ModularCurves` gives 425/1273 and 731/819.

**Repair.**
1. Rebase the ModularCurves part on `c97e9998` (this is R01's repair).
2. State in the merge-order paragraph which of #1187 and this pull request is rebased on the other.

## R05 (P3) — content moved out of Layers 0E, 0G and 4D, and Lean names dropped, without an old → new line for the roadmaps that cite them

**Location.**
- README 1305–1313: Layer 4D now consumes the strict henselisation from SchemeAndStackFoundations §0.12a.
- README 536 and 491: the Grassmannian is now §0.3a's, and affine descent is now §1.1's.
- The names `EllipticCurve.toOver` and `EllipticCurve.ofWeierstrass`, declared on main, are not declared here.
- §Downstream consumers, README 2618–2620, has one bullet.

**Claim.** Roadmaps not changed by this pull request still cite the old owners:
- AbhyankarLemma lines 29, 83, 318 and 329: "ModularCurves §4D, which owns the strict henselisation";
- EtaleCohomologyFoundations lines 48 and 553: "Layer 4D strict henselizations";
- SchubertGeometry line 19: "ModularCurves §0G owns finite-locally-free Grassmannian representability";
- AdicSpacesPartIII line 234 (`EllipticCurve.toOver`, `EllipticCurve.ofWeierstrass`) and line 5941 (§0E affine descent).

Two of this pull request's own folders do the same: LocalPurity line 141 ("ModularCurves §4D's miracle flatness") and ReductiveGroups line 36 ("ModularCurves §§0E–0F supply effective affine descent").

**Witness.** Each quoted line exists at this head. Main's README has the strict henselisation at 4D (lines 1183, 1221); main's `Suggested.lean` declares `toOver` (345) and `ofWeierstrass` (359). The overlaps tool misses moved content.

**Repair.** In §Scope and ownership, add one line per moved item:
- 4D strict henselisation → SchemeAndStackFoundations §0.12a;
- 0G Grassmannian → §0.3a;
- 0E affine, finite locally free and closed descent → §1.1;
- 0C quotient theorems → §1.17;
- 7D test algebras → §4.2;
- miracle flatness and the regular locus → §§4.13 and 0.21;
- `EllipticCurve.toOver` and `ofWeierstrass` → the pinned `EllipticCurveGeom` and `WeierstrassCurve.projModel` API.

Then list in §Downstream consumers the roadmaps that consume this one: AbhyankarLemma, EtaleCohomologyFoundations, AdicSpacesPartII 2B, AdicSpacesPartIII, EllipticCohomology, ReductiveGroups/ReductiveGroupsPartII 0F, BordismFormalGroups 7E and LocalPurity, as `c97e9998` did for its consumers.

## R06 (P3) — padding: three declarations close in one tactic

**Location.** `Suggested.lean` 280–282 (`isCommMonObj_kernel_mulBy`) and 886–898 (`ringKrullDim_adicCompletion`, `isRegularLocalRing_adicCompletion_iff`). README 1317–1320 says Layer 4D "owns" the two completion statements.

**Claim.** In a scratch copy, `infer_instance` closes the first. The other two close with `exact TauCeti.AdicCompletion.ringKrullDim_eq` and `exact TauCeti.AdicCompletion.isRegularLocalRing_iff.symm`.

**Witness.** Pinned `TauCeti/RingTheory/AdicCompletion/LocalRing.lean:52` is `@[stacks 07NV] ringKrullDim_eq`, and line 59 is `@[stacks 07NY] isRegularLocalRing_iff`. Both have exactly these hypotheses: a Noetherian local ring. The probe elaborates with 0 errors, and both sites drop out of the `sorry` warnings.

**Repair.**
- Delete all three from `Suggested.lean`. After R01, `isCommMonObj_kernel_mulBy` goes anyway with the pinned `torsion`.
- Cite the two pinned completion lemmas in §Exact supplier contracts with their file.
- Make the 4D bullet a consumption, not a target.
- Remove them from the docstring's list of headlines.

## R07 (P3) — Layer 5C: the "external contract" is partly at the pin and is planned by named roadmaps

**Location.** README 1470–1476: "No roadmap in this repository owns these statements … all three statements sit behind a GAGA-style development that no roadmap has adopted." `Suggested.lean` 850–853 says the same.

**Claim.**
- The first statement, that connectedness is insensitive to `ℚ̄ ↪ ℂ`, is pinned for affine schemes, and `Y(ρ)` is affine.
- ModularCurvesPartII says it discharges "Layer 5C … Its three comparison contracts … in Layers 4 and 6".
- ComplexComparisonPartII C4.5 plans `affineCurveConnectedness`.

**Witness.** Pinned `TauCeti.connectedSpace_primeSpectrum_tensorProduct_of_isAlgClosed` (`RingTheory/Idempotents/Connected/ScalarExtension.lean:64`), with `connectedSpace_primeSpectrum_of_injective` (`…/Connected/Spectrum.lean`) for the converse. Also ModularCurvesPartII §Scope, the bullet for Layer 5C, and ComplexComparisonPartII C4.5.

**Repair.**
- Cite the two pinned lemmas for the first statement.
- Say that this roadmap stops at the conditional statement and that ModularCurvesPartII Layers 4 and 6 discharge the uniformisation and the analytic comparison downstream.
- Delete "no roadmap … has adopted".
- Keep `hconn` as the hypothesis: Part II is a consumer, not a supplier.

## R08 (P3) — the rigidity route makes 4C and 5B wait on Picard duality, but the pinned rigidity needs none

**Location.**
- README 366–367 (the sampled "Consumers" paragraph): "Full-level representability in Layer 5B also uses the endomorphism rigidity of Layer 2F, hence the Picard duality of Layer 2D."
- The same claim at 1241–1242 and 1285–1286 (4C) and at 1413–1414 (5B).

**Claim.** KM 2.7.2 for the naive full-level problem is proved at the pin with a variable-change argument and no Picard input. So 2D is a route, not a need, for 4C, 5B and the freeness step of 5C.

**Witness.** `ModuliProblem.isRigid_gammaNaive` (`ModularCurve/NaiveLevel.lean:328`) rests on `EllipticCurveGeom.IsFiberwiseInjective.eq_id_of_isPullback` (`Geom/Rigidity.lean:109`). The docstring of `Rigidity.lean` gives the argument through `VariableChange.eq_one_of_isUnit_sub`. No Picard file is imported.

**Repair.** In the four places, name the pinned rigidity as the input. Drop "hence the Picard duality of Layer 2D" from the Consumers paragraph and from the 4C and 5B dependency lines. Keep 2F only for KM 2.7.1, 2.7.3 and 2.7.4 where those are used.

## R09 (P3) — supplier-contract claims: `#check` pins, the strict henselisation at the pin, and an undocumented Lean name

**Location.**
- README 252: "Each of these is pinned by a `#check` in `Suggested.lean`."
- README 1305–1313 and 2572: the strict henselisation is cited only to SchemeAndStackFoundations §0.12a.
- `Suggested.lean` 590: `structure ArtinianTestAlgebra`.

**Claim.**
- Of the 26 Tau Ceti names listed in §From Tau Ceti, 14 have no `#check`: `projModelOver`, `projModelZero`, `projModelZero_projModelOver`, `projModelVariableChangeIso`, `mulByIntIsogenyOfNeZero`, `fieldPullback`, `degree`, both `comap_of_*` lemmas, `projection`, `desc`, `existsUnique_desc`, `isPullback_kernel` and `isPullback_kernel_scheme`.
- The strict henselisation is constructed at the pin.
- `ArtinianTestAlgebra` occurs nowhere in the README.

**Witness.** The file has 13 `#check` lines (68–80). The pin has `TauCeti.StrictHenselization.algebra` (`RingTheory/StrictHenselization/Algebra.lean:75`), `toTarget` (`:194`) and `neighbourhood_isFiltered` (`…/Filtered.lean:77`). `grep ArtinianTestAlgebra` on the README finds no match.

**Repair.**
- Replace the `#check` sentence with "at the pin, file as listed", or add the 14 `#check` lines.
- In 4D, cite the pinned strict-henselisation declarations by name and file, and keep §0.12a for the clauses not at the pin.
- Name `ArtinianTestAlgebra` in 7D as the parameter structure that restates SchemeAndStackFoundations §4.2's `Formal.ArtinianTestAlgebra`.

## R10 (P3) — Layer 4D has two contradictory `**Dependencies.**` lines

**Location.** README 1336–1338: "**Dependencies.** Layers 4A and 4C, SchemeAndStackFoundations §§0.12a, 0.21 and 4.13, and Mathlib's regular-local-ring theory." The next line repeats it without SchemeAndStackFoundations.

**Claim.** This is editing residue. The second line contradicts the first and the `*Needs:*` line at 1333.

**Witness.** Lines 1336 and 1338 both open with `**Dependencies.**`.

**Repair.** Delete line 1338.

## Verified sound

**Gate and build.**
- Worker gate at this head: every check 0 except `outside-folder=2` (R03). My re-run of the gate confirms the same text scanners.
- `lake env lean TauCetiRoadmap/ModularCurves/Suggested.lean` exits 0 with 34 `sorry` warnings and nothing else.
- I built `TauCeti.RingTheory.AdicCompletion.LocalRing` with `lake build` for the probe.

**Dependency check.** Output: `depcheck: 239 roadmaps, 2431 edges, 0 problem(s)`. No UPWARD or CYCLE line.

**Signatures.** The worker's `signatures.md` lists 83 declarations, none with a dropped section binder. I compared these against the README:
- `torsionInclusion` keeps `[NeZero m] [NeZero n]`;
- `hasProperty_finite` keeps `[IsNoetherianRing ↑R]`;
- the `KatzMazurQuotientData` theorems keep `[Group H] [Finite H]`;
- `exists_universalDeformation` keeps `[IsAlgClosed k] [CharP k p]`;
- `exists_representedBy_of_isRigid` has the README's hypotheses (affine, rigid).

The worker's generated `SignatureCheck.lean` has two malformed lines (902–903, `#check @;` and `#check @of`), so it exits 1. The other 94 `#check` lines elaborate.

**One-tactic probe.** I tried `first | rfl | infer_instance | simp` on all 34 `sorry` sites. It closes one (`isCommMonObj_kernel_mulBy`). The pinned-lemma probe closes the two completion theorems (R06). The other 31 stay open.

**Repair test.** #1101's head `Suggested.lean` (`c97e9998`) elaborates at this pin: exit 0, 36 `sorry` warnings.

**Library declarations opened at the pins** (Tau Ceti paths relative to `TauCeti/`):
- `AlgebraicGeometry/GroupScheme/FiniteFlat.lean:58`, `GroupScheme/KilledByRank.lean:121`;
- `EllipticCurve/Scheme/Geom/Basic.lean:107, 153, 167, 549, 577`;
- `Geom/GroupLaw.lean:272`, `Geom/Hom.lean:78`, `Geom/MulBy.lean:85`, `Geom/Torsion.lean:107`;
- `Geom/Isogeny.lean:117, 123`, `Geom/Torsion/Etale/Locus.lean:89`, `Geom/Rigidity.lean:109`, `Geom/JInvariant.lean:142`;
- `ModularCurve/Ell.lean:98`, `ModuliProblem.lean:90, 127, 188, 283`, `FullLevel.lean:86`, `Gamma/Full.lean:318`, `Gamma/One.lean:81`, `Gamma/Zero.lean:70`, `YOne.lean:475`, `NaiveLevel.lean:328, 348`, `Comparison.lean:351`;
- `PicardFunctor/Relative.lean:84`;
- `RingTheory/StrictHenselization/Algebra.lean:75, 194`, `RingTheory/AdicCompletion/LocalRing.lean:52, 59`, `RingTheory/Idempotents/Connected/ScalarExtension.lean:64`;
- `ProjModel.lean:177` (`projModelZero`), `EffectiveCartierDivisor/Relative.lean:172, 186`, `Quotient/FiniteGroup/Affine.lean` (`isFinite_projection_of_finiteType`), `GroupScheme/Kernel.lean` (`isPullback_kernel`, `isPullback_kernel_scheme`).

Mathlib:
- `AlgebraicGeometry/Normalization.lean:122, 132, 169, 371, 435, 576, 598`. Here `normalizationPullback` runs from the normalisation of the base change to the base change of the normalisation, as the README says, and it is an isomorphism for smooth `g`.
- `Morphisms/FlatRank.lean` (`Scheme.Hom.isLocallyConstant_finrank`).

**Cross-roadmap citations resolved at this head** (all exist with the cited content):

SchemeAndStackFoundations:
- §0.3a (line 593);
- §0.12a (1086; the colimit, universal property, 06LJ completion clauses);
- §0.21 (1531; `regularLocus_open_of_finiteType`);
- §1.1 (2212; *affine_fpqc_descent*, finite locally free and closed cases);
- §1.17 (2774);
- §1.23 (3197; *coarse_finite_group_quotient*);
- §4.2 (5296; the `W(k)` test algebras, "ModularCurves consumes them");
- §4.13 (5836; *miracle_flatness_finite*, including finite maps of smooth relative curves);
- §4.15 (6072–6088; the row-vector full-level convention, "naive full-level structures are the case `g = 1`, `J = E`").

SchemeAndStackFoundations' `Suggested.lean:2197` `ArtinianTestAlgebra` agrees field by field with ours (line 590).

AlgebraicCurves:
- Layer 7 (805), Layer 8 (892; Hilbert's different formula, pinned as `TauCeti.Place.differentExponent_eq_finsum_card_ramificationGroup_sub_one`, 1055), Layer 9 (1150), Layer 12 (1548);
- the GAGA exclusion (2031).

Others:
- EllipticCurves `Aut (E_{Kˢᵉᵖ}, O)` (1173);
- ModularForms' analytic-only Riemann–Roch chain (1073);
- JacobianChallenge exists on main.

The 10 "Lean names found nowhere" in `citations.md` are all declared in `Suggested.lean`: `ofCurve` 657, `yonedaProblem` 390, `isFinite_mulBy` 256, `isGroupHom_of_mapsZero` 244, `specialObj` 608, `toGeom` 223, `mulBy_eq_one_of_finrank` 121, `exists_of_hasProperty_affine` 497, `RepresentedBy` 419, `exists_representedBy_of_isRigid` 426. Every Lean declaration except `ArtinianTestAlgebra` (R09) occurs in the README.

**Sources.** Stacks 07NV and 07NY are confirmed in the cached More-on-Algebra text (`STACKS-0A02` cache): line 5216 (Lemma 15.44.1, `dim A = dim A^∧`) and line 5229 (Lemma 15.44.4, regular iff completion regular). No README locator is flagged unverified.

**Ownership against open pull requests.** I checked ModularCurvesPartII (its scope imports Layers 0–10 and rebuilds nothing; it discharges 5C downstream) and ComplexComparisonPartII (C4.5). There is no second owner of a ModularCurves object. SchemeAndStackFoundations is in this pull request and now owns the moved foundations.

### Adversarial table

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| `mulBy_eq_one_of_finrank` (0B) | `μ_p/𝔽_p`; `(ℤ/2)_ℤ`; `S = ∅`, `n = 0` | `[p]x = x^p = 1` on `μ_p`: trivial; `[2] = 0` on `ℤ/2`; rank function on `∅` is `fun _ ↦ 0`, both sides the unique map | true; pinned `pow_eq_one_of_finrank` | R01 |
| `finrank_mulBy`, `finrank_torsion` (2.3.1) | `E/ℚ`, `N = 2`; supersingular `E/𝔽̄_p`, `N = p`; `N = 1` | rank 4 = 2²; `[p]` purely inseparable, `E[p]` connected of rank `p²`; rank 1 | true; pinned `degree_intCast` gives `n.natAbs^2` | R01 |
| `etale_torsion_of_isUnit` | `ℤ[1/2]`, `N = 2`; `𝔽₂`, `N = 2`; `S = ∅` | étale of rank 4; `2 = 0` so hypothesis fails and `E[2]` is not étale (negative control); `Γ(∅) = 0`, `IsUnit 2` holds, the empty map is étale | true; pin uses the equivalent residue-field form | R01 |
| `isCommMonObj_kernel_mulBy` | probe | `infer_instance` closes it | padding | R06 |
| `isGroupHom_of_mapsZero` (2.5.1) | `f = [−1]`; translation by `P ≠ 0`; zero map | unique `F = −𝟙`; excluded by `hf_zero` (`P ≠ 0`); `F = 0` | true | R02 (state on `EllipticCurveGeom`) |
| `exists_representedBy_of_isRigid` (4.7.0) | naive `[Γ(3)]` over `ℤ[1/3]`; naive `[Γ(2)]`; `P(E/S) = ∅` for `S ≠ ∅` and a singleton for `S = ∅`; `R = 0` | `Y_full(3) = Spec ℤ[1/3,ζ₃][μ,1/(μ³−1)]`; `[−1]` fixes every basis, so not rigid; `rep X = ∅`, affine and vacuously rigid, represented by the empty-base object; over `0` every relatively representable problem is a singleton, represented by the empty object | true | none |
| `IsRegularOfDimTwo` (def) | `rep = Spec ℤ[1/3,ζ₃][μ,1/(μ³−1)]`; `rep = ∅`; `rep = Spec 𝔽_p` | holds; fails on `Nonempty` (wrong model "∅" excluded); fails, dimension `0 ≠ 2` | discriminates | none |
| `axiomaticRegularity` (5.1.1) | Drinfeld `[Γ(2)]` at `p = 2`; trivial problem | rank `|GL₂(𝔽₂)| = 6 > 0`; Reg. 1–4 hold (Reg. 4B: `Spec W(k)[[T]]` regular of dimension 2), so rank 1 and `𝕄(δ)` étale over `Ell`, regular of dimension 2 | consistent | none |
| `formalGroup_p_eq_zero_of_pow_mem_span` | additive law over `𝔽_p`; over `ℤ` with `p = 2`, `n = 1`; over `ℤ/4` with `p = 2`, `n = 2` | hypothesis and `p = 0` both hold; `2XY ∉ (X², Y²)`, so the hypothesis fails; middle coefficients 4, 6, 4 ≡ 0, 2, 0, hypothesis fails, consistent with `2 ≠ 0`; `C(4,2) = 6 = 2·3` | true | none |
| `exists_universalDeformation` (7D) | supersingular `E₀/𝔽̄_p` | tangent space `H¹(T) = 1`, `H² = 0`, so pro-represented by `W(k)[[T]]`; automorphisms trivial on the special fibre, so `ψ` is unique | true | none |
| `isCategoricalQuotient_of_isUnit_card` (7.1.3(3)) | `ℤ[x]`, `x ↦ −x`, base change to `𝔽₃` and to `𝔽₂` | `𝔽₃[x²] = (𝔽₃[x])^{C₂}`; `𝔽₂[x²] ≠ 𝔽₂[x]`, excluded since 2 is not a unit | true | none |
| `etale_mapRep_of_free` (7.1.3(2)) | empty base | `𝒫(E/∅)` is a singleton fixed by `H`; `hfree` ranges over nonempty bases only, so not vacuous | true | none |
| `isFinite_mapRep` | `A = ℚ[x₁,x₂,…]`, `C₂` negates every variable | `A/B₊A` infinite-dimensional, so not finite; `hP_ft` excludes it | hypothesis load-bearing | none |
| `axiomaticRegularityOfQuotients` (7.5.1) | `[Γ₁(pⁿ)]`, `H = (ℤ/pⁿ)ˣ` | degree `|H| = φ(pⁿ)` = 8D's rank of `[Γ₁] → [Γ₀]` | consistent | none |
| `exists_coarseModuliData`, `coarseModuli_quotient` (8.1.1, 8.1.5) | naive `[Γ(3)]`, `H = GL₂(𝔽₃)` | `M = Y_full(3)`; `Y_full(3)/H = Spec ℤ[1/3][j]` since `[Frac A₃ : ℚ(j)] = 24 = 48/2` | consistent | R02 (8.2.1 statable) |
| `ker_baseChange_of_noZeroSMulDivisors_coker` (9E) | `D = ℤ`, `f = ·2`, `R = 𝔽₂`; `f` the diagonal `ℤ → ℤ²` | cokernel `ℤ/2` excluded, and indeed the left side is `𝔽₂`, the right side 0 (negative control); cokernel `ℤ` torsion-free, both sides 0. `[Module.Flat D M]` is unused (`range f ⊆ N` suffices) | true; P3 note | none |
| quotient smoothness, 9D (sample) | `ℤ_(2)[x]`, `x ↦ −x`; `k[ε]/(ε²)`, char 2, `x ↦ x+ε`; `R[x,y]/(xy−π)` | `Spec ℤ_(2)[x²]` smooth although `𝔽₂[x²] ≠ (𝔽₂[x])^{C₂}`; invariants `k[x²] ⊕ εk[x]`, `ker ε = εk[x] ≠ εk[x²] = im ε`, so not flat: the regularity hypothesis is load-bearing; regular and flat but singular fibre, as the README says | consistent | none |
| "diamond group has even order" (9D) | `N = 7`, `N = 13` | `|(ℤ/N)ˣ| = 6, 12` (even); `|Δ| = 3, 6` | true on the `(ℤ/N)ˣ` reading | none |
| `irreducibleSpace_of_connectedSpace` (5C) | `𝔸¹_k`; `𝔸¹ ⊔ 𝔸¹`; `k[x,y]/(xy)` | irreducible; not connected (excluded); connected but singular (excluded). `IsAlgClosed` is unused | true | none |
| `irreducibleSpace_baseChange_…` (5C sample) | `Y = 𝔸¹_{ℚ(i)}` over `ℚ` | `Y_ℚ̄ = 𝔸¹ ⊔ 𝔸¹`: `hconn` fails and the conclusion fails | hypothesis load-bearing | R07 (text) |
| `ringKrullDim_adicCompletion`, `isRegularLocalRing_adicCompletion_iff` (4D) | `ℤ_(p)`; `k[x,y]_(x,y)/(xy)` | 1 = 1; not regular on either side; one `exact` closes each | padding | R06 |
| 8C rings (sample) | `p = 2`, `n = 1` | `X² − X(X − P) = PX`, so `K̲ = (P)` and `h̲ = ([1]P) = (P)`; `e₁(0, P) = P = P^{φ(2)}·1` | consistent | none |
| 8C proof lemmas (sample) | general `n` | `det(Q·|A₁) = ±∏[b](P)` (constant term); `e_φ` = units product + terms in `P^φ·𝔪`; snake gives `0 → Ker/Q → A₂/Q → A₁/Q → 0` given injectivity on `A₁` | consistent | none |
| 8C problems compared (sample) | `N = p` | `{aP : (a,p) = 1}` are generators, so `D ⊆ Gˣ`, and the forgetful map exists before `D = Gˣ` | consistent | none |
| Layer 10 class (sample) | `N = 5, 11, 13` | `N = 5`: `|Δ| = 2`, `|H| = 2`, `n = 1`. `N = 11`: `|H| = 1`, `n = 5` (Shimura subgroup of order 5); 10 cusps, `5·1 + 5·11 = 60 = (121−1)/2`. `N = 13`: `|H| = 6`, `n = 1` | consistent | none |
| Layer 10 Lean note (sample) | Mathlib names | all seven at `Normalization.lean`; the direction of `normalizationPullback` matches | verified | none |
| 0A Consumers (sample) | the 5B rigidity route | the pinned `isRigid_gammaNaive` uses the variable-change argument, with no Picard input | overstated | R08 |
| 5C contract (sample) | first statement, affine `Y(ρ)` | pinned `connectedSpace_primeSpectrum_tensorProduct_of_isAlgClosed` | "no roadmap owns" is false | R07 |
| `EllipticCurve` (def) | unit at a 2-torsion section `Q` | `one_eq_zero` excludes it; any other unit-0 structure is the canonical one by 2.5.1 | discriminates; the pin has the canonical `grpObj` | R01 |
| `IsCategoricalQuotient` (def) | `Spec k[x] → Spec k[x²]`; the identity | invariant and universal; the identity fails invariance for `h ≠ 1` | discriminates | none |
| `KatzMazurQuotientData` (def) | `q = 𝟙`, `H` acting nontrivially | `q1` fails (wrong model excluded) | discriminates | none |
| README 2166, 773 | the pin | `jMap` at `JInvariant.lean:142`; `grpObj` at `GroupLaw.lean:272` | false | R02 |

## Not verifiable

- Katz–Mazur, *Arithmetic Moduli of Elliptic Curves*: no legal text (Princeton; not in the manifest; no open copy).
  - The sampled 8C locators (6.1 p. 155; 6.3.2 pp. 157–158; 6.3.3–6.3.6 pp. 159–162) and the 9D Notes Added in Proof (pp. 508–509) are cited by locator only. Their mathematics is recomputed in the table.
  - The same holds for KM 10.9.2 (5C) and the 4.6.2 erratum.
- Buzzard, *Formalizing Fermat* Lecture 8 (5C "Geometric irreducibility, conditionally"), Katz's *Serre–Tate local moduli*, Lazard 1955, Loeffler, Deligne–Rapoport, SGA 3, Igusa and Conrad: not in the cache. None of them is cited for a step taken from inside its proof.
- Silverman `AEC`: settled as uncertified.
- The board manifest records `STACKS-0A02` and `STACKS-0A03` for 4D, which no longer cites them. It also records `AEC` for "7E PD-6", which does not exist. These are left to the worker, since a review cannot edit the manifest.

## Source issues

- none
