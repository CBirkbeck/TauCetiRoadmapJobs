# Review of ReductiveGroups (pull request #1676 at 9846d26)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/ReductiveGroups/` at `9846d26f203b8ba01102391a21dfa60ea6adb6c6`. The folder changed by 222 lines since `66eb91b`, the head the previous review read. The gate passes and the dependency check is clean. `Suggested.lean` elaborates with exactly seven `sorry` warnings, both at the branch pin and at main's pin.

There are six findings. Four are P2:
- the branch still pins a Tau Ceti revision where 84 cited names do not exist (R01);
- two Layer 7 headlines are statable but not stated (R02);
- Layer 3A.5's point-topology targets have two more planners (R03);
- Layers 1.1 and 7f restate pinned Tau Ceti theorems (R04).

Two are P3: a repurposed Layer 8 id (R05) and no stated order against five conflicting pull requests (R06).

Paths: `README.md` and `Suggested.lean` mean `TauCetiRoadmap/ReductiveGroups/…`. The branch pin is Tau Ceti `a91d3aaf` with Mathlib `6b7abb3c` (this head's `lake-manifest.json`). Main's pin is Tau Ceti `2fd255d9` with Mathlib `1b1ccf4b`.

**The previous review's findings at this head.**

- **R01** (P2, rebase onto main's pin). *Not repaired.* The manifest still pins `a91d3aaf`. This head adds about 25 more names that exist only at `2fd255d9`: the point topology, the parabolic predicate and the finite-field Frobenius. It also no longer merges cleanly with main. Re-raised as R01.
- **R02** (P2, the point topology is library-owned). *Partly repaired.* The construction paragraph is gone. `README.md:19–28` and the new contract *Native complex-point topology* (`:405–443`) consume `TauCeti.SchemePointTopology.topology` and `TauCeti.PointTopology.topology`, and `Suggested.lean:85–88` now names the smooth charts as the missing carrier. I checked every name and hypothesis of the new contract against `Topology/Algebra/PointTopology/*.lean` at `2fd255d9` (under *Verified sound*). The two-owner half remains, and a third planner already on main turned up: see R03.
- **R03** (P3, `RootPairing.dominantChamber`). *Withdrawn as a separate finding.* The previous witness was wrong about `2fd255d9`. There, `LinearAlgebra/RootSystem/Chamber.lean` opens `namespace RootPairing` at line 97 and declares `def dominantChamber` at line 141, so `README.md:250` is right at main's pin. Only at `a91d3aaf` is it `TauCeti.dominantChamber` (`namespace TauCeti` at line 94, def at line 137). The R01 rebase settles it.
- **R04** (P3, no stated order against #1332, #1797, #1807, #1808, #1854). *Not repaired*: the description is unchanged. Raised again as R06.

## R01 (P2) — the branch pins Tau Ceti `a91d3aaf`, where 84 cited declarations do not exist

**Location.** The new passages are:
- `README.md:19–24`: "The classical topology on the complex points of a scheme is a pinned Tau Ceti carrier, the chart topology `TauCeti.SchemePointTopology.topology`";
- `README.md:219–235`, `:405–443`, `:1567–1579` and `:1707–1731`.

The previous round's contracts are at `:63–71`, `:345–403` and `:478–493`. In `Suggested.lean` the affected docstring lines are `:31–41`, `:51`, `:61–62`, `:69`, `:86–87` and `:157`.

**Claim.** The cited declarations exist in the pinned Tau Ceti.

**Witness.** At `a91d3aaf`, none of these exists:
- `TauCeti/Topology/Algebra/PointTopology/`;
- `Algebra/AlgebraicGroup/Parabolic/`;
- `Algebra/AlgebraicGroup/Frobenius/FiniteField.lean`;
- `AlgebraicGeometry/GroupAction/`.

All four exist at `2fd255d9`.

**Detail.** A declaration index of both pins resolves 84 of the README's 362 backticked names only at `2fd255d9`. Thirteen of them are in `Suggested.lean`'s module docstring:
- `TauCeti.SchemePointTopology.topology` and `TauCeti.PointTopology.topology`;
- `TauCeti.FiniteField.frobeniusPoints`;
- `TauCeti.HopfIdeal.IsParabolic` and `TauCeti.HopfIdeal.IsParabolicOverAlgClosed`;
- the five `TauCeti.SchemeAction.*` orbit theorems;
- `TauCeti.reductiveCommHopfAlgProperty.linearlyReductive`;
- `…isIso_fppfHomogeneousQuotientToCoinvariantsPoints_of_reductive`;
- `TauCeti.HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq`.

The count is namespace-aware: a declaration counts only under its full name, with nested `namespace` and `section` blocks tracked.

The gate's build passes only because no declaration uses them.

There is also a merge problem. `git merge-tree --write-tree HEAD origin/main` reports two modify/delete conflicts, on `OrbitGeometryTargets.lean` and `SpectralWeylTargets.lean`. This branch deletes both files, and main's pin bump `a891cd19` edited them.

**Repair.** Rebase onto current main, so that the manifest pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`. Resolve the two conflicts by keeping the deletion: nothing on main or in any open roadmap imports or cites those modules (searched with `roadmaps grep`). Tested: I elaborated this head's `Suggested.lean` unchanged at main's pins, from the content checkout. It exits 0 with the same seven warnings, at lines 107, 120, 140, 159, 181, 345 and 354. After the rebase, apply R02 and R04, which are written against that pin.

## R02 (P2) — two Layer 7 headlines are statable but neither stated nor named in the docstring

**Location.**
- `README.md:1557`: "that any two maximal tori are conjugate (Milne, Theorem 17.10, p. 354)".
- `README.md:1582`: "a reductive `k`-subgroup `L` exists with `P=L⋉U`".
- `Suggested.lean:48–52`: "the represented quotient `G/P` by a parabolic subgroup and the Levi subgroup functors … lack the required comparison carriers. The parabolic predicate itself is pinned".

**Claim.** Neither theorem can be stated with pinned carriers. The docstring names the Levi decomposition as not statable and says nothing about maximal tori.

**Witness.** Two scratch modules elaborate with one `sorry` warning per theorem:
- **Maximal-torus conjugacy, at the branch pin `a91d3aaf`.** It needs `TauCeti.HopfIdeal.IsMaximalTorus` (`Torus/Maximal.lean:50`) and `HopfIdeal.conjugate` (`HopfIdeal/Conjugation.lean:66`), both of which exist there.
- **Both theorems, at main's pin `2fd255d9`.** The Levi statement uses the pinned `TauCeti.HopfIdeal.IsParabolic` (`Parabolic/Basic.lean:248`), the same carrier the docstring itself cites.

The pinned `TauCeti.HopfIdeal.exists_conjugate_eq_of_isMaximalTorus` (`Torus/Conjugation.lean:149` at `2fd255d9`) is not this theorem. It assumes `hcontainI`/`hcontainJ`, that diagonalizable subgroups can be conjugated into a fixed torus.

**Repair.**
1. In `StructureAcceptance`, add `/-! ## Layer 7: structure theory -/` with the two statements below.
2. Name both in the README's Layer 7 bullets (`:1557` and `:1582`).
3. Delete "and the Levi subgroup functors" from `Suggested.lean:48–49`.

The first statement elaborates at both pins:

```lean
theorem exists_conjugate_eq_of_isMaximalTorus {k : Type u} [Field k] [IsAlgClosed k]
    {H : Type u} [CommRing H] [HopfAlgebra k H] [Algebra.FiniteType k H]
    (hsm : Algebra.Smooth k H)
    (hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty k (CommHopfAlgCat.of k H))
    {I J : TauCeti.HopfIdeal k H}
    (hI : TauCeti.HopfIdeal.IsMaximalTorus k (CommHopfAlgCat.of k H) I)
    (hJ : TauCeti.HopfIdeal.IsMaximalTorus k (CommHopfAlgCat.of k H) J) :
    ∃ g : WithConv (H →ₐ[k] k), I.conjugate g = J
```

Source: Milne 2017, Theorem 17.10, p. 354. The second statement elaborates at `2fd255d9` and has the same shape as `exists_levi_complement`:

```lean
theorem exists_levi_of_isParabolic {k : Type u} [Field k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k)
    (hred : TauCeti.reductiveCommHopfAlgProperty k H)
    (I : TauCeti.HopfIdeal k H.obj) (hP : TauCeti.HopfIdeal.IsParabolic k H.obj I) :
    ∃ J : TauCeti.HopfIdeal k (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I),
      Function.Bijective ((Ideal.Quotient.mkₐ k J.toIdeal).comp
        (TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadicalDefiningIdeal
          (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I)).coinvariants.val)
```

It holds over every field. `conrad-feng` lines 10375–10380 (§H.1, p. 238) show that `R_u(P_k̄)` descends to a smooth connected normal `k`-subgroup `U`, which is then the native `k`-unipotent radical, and that a Levi `k`-subgroup exists. Proposition 12.3.1 (line 5345, p. 127) adds the `U(k)`-simple transitivity. The completeness characterization of parabolics, which needs a represented `G/P`, stays in the docstring's not-statable list.

## R03 (P2) — Layer 3A.5's point-topology comparisons are also planned on main by ReductiveGroupsPartII RG2.0.1 and by ComplexComparisonPartII C-1.1

**Location.** `README.md:24–26`: "Layer 3A.5 owns what that library does not state: the scheme-level functoriality, open-cover gluing, immersion, fibre-product, reduction, separated and proper comparisons of that topology". The matching targets are at `:952–960` and `:963–974`. `README.md:22–24` adds: "it is the underlying space of the scheme analytification of ComplexComparisonPartII C-1.1, the two agreeing by the identity on `X(ℂ)`".

**Claim.** Layer 3A.5 is the single owner of these comparisons.

**Witness.**
- **ReductiveGroupsPartII, on main** (`README.md:539–587`, RG2.0.1). It states `isOpenEmbedding_affineOpen`, `continuous_map`, `isOpenEmbedding_of_isOpenImmersion`, `isClosedEmbedding_of_isClosedImmersion` and `t2Space_of_isSeparated`. Its hypothesis is local `R` with open units and continuous inversion, so it covers `R = ℂ`.
- **ComplexComparisonPartII (#848)** (`README.md:915–921`). It glues over any affine cover and proves separated ⇒ Hausdorff, proper ⇒ compact preimages, the smooth charts and the étale local biholomorphisms.

Neither cites this roadmap.

**Why this roadmap must own them.** Both other planners are consumers: ReductiveGroupsPartII consumes this roadmap, and ComplexComparisonPartII is later in the merge order (ORDER.txt line 43). Citing either from here would be a cycle or an upward edge, so ownership moves down to this roadmap.

The Scope's "the two agreeing by the identity on `X(ℂ)`" asserts a comparison that neither roadmap states as a target. ComplexComparisonPartII C-1.1 builds `X^an` by gluing analytic local models, not from `TauCeti.SchemePointTopology`.

**Repair.**
1. State §3A.5's first two bullets at RG2.0.1's generality, as targets of this layer, with `R = ℂ` as the instance used here:
   - each affine open chart is an open embedding;
   - morphisms act continuously;
   - open immersions give open embeddings and closed immersions give closed embeddings (`R` Hausdorff);
   - separated `X` has Hausdorff points (`R` Hausdorff);
   - local compactness for `X` locally of finite type (`R` Hausdorff, locally compact).

   The hypotheses on `R` are local, open units and continuous inversion.
2. Keep the reduction, fibre-product, proper/compact and smooth-chart targets as they are.
3. In Scope, record that ReductiveGroupsPartII RG2.0.1 and ComplexComparisonPartII C-1.1 consume these §3A.5 comparisons.
4. Replace "the two agreeing by the identity on `X(ℂ)`" with "ComplexComparisonPartII C-1.1 owns the identification of the underlying space of its analytification with this topology".

The matching citations in ReductiveGroupsPartII and ComplexComparisonPartII belong to those roadmaps' own pull requests.

Tested on the instance: `TauCeti.PointTopology.localizationAwayXHomeomorph` (`Localization.lean:115`) makes `D(t)(ℂ) ≃ₜ ℂˣ`, open in `ℂ = 𝔸¹(ℂ)`. RG2.0.1's `isOpenEmbedding_affineOpen` at `R = ℂ` and the generalized §3A.5 target both give this open chart.

## R04 (P2) — Layers 1.1 and 7f restate theorems that the pinned Tau Ceti proves

**Location.**
- `README.md:639–642`: "Evaluate a coaction M → M⊗O(G) at each g∈G(S) to obtain an S-linear action on M⊗S, naturally in the R-algebra S".
- `:699–706`: induction as an equalizer, and "Prove reciprocity".
- `:2118–2119`: "this roadmap does not treat it as already proved".
- `:2124–2130`: the target identity.
- `:2149–2157`: the GL3 worked example.

**Claim.** These are targets of this roadmap.

**Witness.**
- **At `a91d3aaf`.** `TauCeti.Comodule.endOfPoint` and `pointsRepresentation` (`Comodule/PointsAction.lean:78, :409`) already act on `A ⊗ V` through points, and `pointsAction` (`AlgebraicGroup/Representation/PointsAction.lean`) is the group version.
- **At `2fd255d9`.** `Subgroup.natCard_fixedBy_mul_natCard` (`GroupTheory/QuotientGroup/Basic.lean:177`) is the target identity verbatim.

**Detail at `2fd255d9`:**
- **Layer 1.1 induction.** `TauCeti.Comodule.induced`, `inducedEquiv`, `inducedEquiv_comp`, `inducedEquiv_inducedMap_comp`, `inducedMap_id` and `inducedMap_comp` (`Algebra/Coalgebra/Comodule/Induced.lean:102–294`). Here `f : C →ₗc[R] D` is any coalgebra map with `C` flat. The equalizer is the README's, and the reciprocity maps are exactly `:704–705`'s: composition with counit evaluation, and `u ↦ (u ⊗ id)ρ_N`.
- **Layer 7f criterion.** `Subgroup.AlmostConjugate` (`GroupTheory/AlmostConjugate.lean:92`) and `TauCeti.almostConjugate_iff_nonempty_equiv_ofMulAction` (`RepresentationTheory/CharacterTable/FixedPointCount.lean:183`, `[CharZero k]`). Also `nonempty_equiv_ind_trivial_iff_forall_natCard_fixedBy_eq` (`:156`), which already contains the `indTrivialEquiv` conversion that `:2110–2113` plans.
- **The worked example.** `TauCeti.almostConjugate_lineStabilizer_hyperplaneStabilizer` (`[Finite K]`) and `conj_smul_lineStabilizer_ne_hyperplaneStabilizer` (`3 ≤ card n`), in `LinearAlgebra/Matrix/GeneralLinearGroup/LineHyperplane.lean:241, :201`.

**Repair.**
1. In *From Tau Ceti*, cite `endOfPoint`, `pointsRepresentation` and `pointsAction`. Keep as the §1.1 target only the inverse direction, coaction recovered from the universal point, and the equivalence.
2. After the rebase, also cite the `Comodule/Induced.lean` declarations. Delete the definition and reciprocity sentences at `:699–706` and the first API bullet's reciprocity and naturality clause. Keep left exactness, transitivity, the points/antipode description and the field transport.
3. In 7f, delete "The target identity is …" and "this roadmap does not treat it as already proved". Consume `Subgroup.natCard_fixedBy_mul_natCard`, and `Subgroup.AlmostConjugate` with `TauCeti.almostConjugate_iff_nonempty_equiv_ofMulAction`, in place of `Gassmann.almostConjugate_iff_permutation_equiv`. Keep only the Harish–Chandra-to-permutation adapter. In the worked example, cite the two `LineHyperplane.lean` theorems at `n = Fin 3`.

Tested: the 7f Check `S₃`, `H = ⟨(12)⟩`, `g = (12)` gives `1·2 = 2·1` on both sides of the pinned identity. At `g = 1` it gives `3·2 = 6·1`.

## R05 (P3) — the id "Layer 8" now names different content, with no old → new numbering

**Location.** `README.md:2176`: "## Layer 8: split groups and pinnings"; `:3069`: "## Layer 9D: classification, relative groups and forms"; `:3192`: "## Layer 9E: Steinberg endomorphisms …".

**Claim.** The ids that other roadmaps cite keep their meaning.

**Witness.** On main, Layer 8 is "classification and existence": the isogeny and existence theorems, relative reductive groups and the scheme of Borels (`git show origin/main:…/README.md`, line 1023). Main's Layer 7g is now this head's Layer 9E. Open roadmaps cite Layer 8 in main's sense:
- GroupSchemesOverABase (#1522) `README.md:54`, "Layer 8, bullet *Relative reductive groups over an affine Noetherian base*";
- SchubertGeometry (#1224) `:453`, "Layer 8's Borel scheme";
- EndoscopicTransferAndUnitaryTraceComparison (#999) `:268`, "Layer 8 (Isogeny and existence theorems)";
- also #1056 `:1486`, #1069 `:117` and #1837 `:301`.

The overlap index reports no dropped id because the heading "Layer 8" still exists, with different content.

**Repair.** Add one old → new line per moved id under *How to read the build*:
- "Layer 8 (classification, relative groups and forms) → Layer 9D";
- "Layer 7g → Layer 9E";
- "Layer 8 now holds the split data and pinnings".

## R06 (P3) — five other open pull requests change this roadmap and conflict with this head; the description states no order

**Location.** The pull-request description, which is unchanged.

**Witness.** The overlap index lists #1332 (same author), #1797, #1807, #1808 and #1854 as conflicting in `README.md`, `Suggested.lean` or the deleted `*Targets.lean` files. `roadmaps list` shows all five open.

**Repair.** State in the description which pull request is rebased on which. Either this one lands first and the others re-copy or drop the folder, or the reverse. Close or retarget #1332 if this pull request supersedes it. Update the description, which still mentions a "new native companion module" that this head no longer has.

## Verified sound

**Head, scope, gate.**
- Head `9846d26f…`, worktree clean.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ReductiveGroups'` is empty.
- In the folder the pull request rewrites `README.md` and `Suggested.lean` and deletes seven `*Targets.lean` modules, which no roadmap imports or cites.

The gate rerun (`--base origin/main`):

```text
gate ReductiveGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

**Dependency check** (`--movable`, content main, the board's ORDER.txt):

```text
depcheck: 243 roadmaps, 2457 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. ReductiveGroups is on main and not in ORDER.txt.

**Elaboration.** `lake env lean` on `Suggested.lean` in this worktree, at `a91d3aaf`/`6b7abb3c`, exits 0 with seven warnings, at lines 107, 120, 140, 159, 181, 345 and 354. The same file elaborated from the content checkout, at `2fd255d9`/`1b1ccf4b`, gives the same result. `halfTwist_injective` and `halfTwistLoop` are fully proved.

**Padding probe.** I replaced each `sorry` by `first | rfl | (simp; done) | infer_instance | trivial | decide | (simp_all; done) | exact?` and ran it at the branch pin. All seven fail: six with "`exact?` could not close the goal", and `lang_surjective` with a heartbeat timeout. Nothing is padding.

**Signatures.** I compared the worker's `#check @…` of all 17 declarations with the README, and the hypotheses match:
- `[CharZero k]` and `AlgebraicClosure k` in `linearlyReductive_iff_reductive_identityComponent`;
- `[IsAlgClosed k]`, `[CharP k p]`, `hsm` and `hconn` in `linearlyReductive_iff_torus`;
- `[CharZero k]`, `hsm` and `hconn` in `exists_levi_complement`;
- `[Finite k]`, `[IsAlgClosed K]` and `hF : F a = a ^ Nat.card k` in `lang_surjective`, which is the map of the pinned `frobeniusPoints k 1` (`FiniteField.lean:112`) at main's pin;
- `2 ≤ n` in `permutation_nonsplit`.

No binder was lost, and `Suggested.lean` itself was not changed by this review.

**New supplier contracts, checked at `2fd255d9`.**
- **Point topology.** These match the README's descriptions and hypotheses:
  - `PointTopology.topology` (`Basic.lean:83`), `isEmbedding_eval_generators` (`:185`), `isClosedEmbedding_eval_generators` (`:245`, `[T1Space R]`), `polynomialHomeomorph` (`:134`), `mvPolynomialHomeomorph` (`:162`) and `locallyCompactSpace_of_finiteType` (`:261`);
  - `continuous_comap` and `isClosedEmbedding_comap_of_surjective` (`Functoriality.lean:46, :110`, `[T1Space R]`);
  - `isEmbedding_localization` and `isOpenEmbedding_localization` (`Localization.lean:64, :92`), with `hR : IsEmbedding Units.val` and `hU : IsOpen {r | IsUnit r}`;
  - `relativeTensorProductHomeomorph` (`FiberProduct.lean:46`);
  - `instT2Space` and `instSecondCountableTopology` (`Separation.lean:59, :89`);
  - `isTopologicalGroup` (`Group.lean:102`) and the root-namespace `BialgHom.continuous_mapDomain` and `AlgHom.continuous_mapValue` (`:120, :129`);
  - `SchemePointTopology.Points`, `topology`, `isOpen_iff`, `continuous_chartPoint`, `continuous_iff`, `exists_mem_range_chartPoint` and `affineHomeomorph` (`Scheme.lean:49, :127, :143, :150, :157, :109, :165`).

  `Scheme.lean`'s docstring says it does not prove that the charts are open embeddings, as `README.md:439–442` says. `Units.isOpenEmbedding_val` (Mathlib `Analysis/Normed/Ring/Units.lean:200`) exists at both pins.
- **Frobenius** (`Frobenius/FiniteField.lean`, `namespace TauCeti.FiniteField`, `[Fintype K]`):
  - `frobeniusPoints` (`:105`, post-composition with `x ↦ x^(q^n)`) and `frobeniusPoints_apply_apply` (`:112`);
  - `mapDomain_comp_frobeniusPoints` (`:142`);
  - `rationalPointsMulEquiv` (`:249`, `L` a domain) and `coe_rationalPointsMulEquiv_mapDomain` (`:277`);
  - `finite_fixedSubgroup_frobeniusPoints` (`:299`, `[Algebra.FiniteType K H] [IsDomain A]`, `n ≠ 0`);
  - `_root_.BialgHom.map_fixedSubgroup_frobeniusPoints_of_surjective` (`:309`);
  - `geometricFrobeniusBialgHom` (`:328`), `baseChangePointsMulEquiv_symm_comp_mapDomain_geometricFrobeniusBialgHom` (`:343`) and `baseChangePointsMulEquiv_symm_frobeniusPoints` (`:497`, `Nat.card K = p ^ n`).
- **Parabolic** (`Parabolic/Basic.lean`):
  - `IsParabolicOverAlgClosed` (`:82`) and `IsParabolic` (`:248`, smooth with a Borel after base change to `AlgebraicClosure k`);
  - `IsBorel.isParabolic` (`:269`), `IsParabolic.of_le` (`:347`) and `isParabolic_conjugate_iff` (`:417`);
  - `isParabolicOverAlgClosed_iff_exists_conjugate_le` (`:229`).

**Other library names.** The root-system names of `README.md:239–263` are in `namespace TauCeti` at `2fd255d9`, except `RootPairing.Base.existsUnique_map_eq` (`Weyl/Bases.lean:170`, `_root_`) and `RootPairing.dominantChamber` (see above). `TauCeti.existsUnique_dynkinType` is at `FiniteType/Classification.lean:136`, beside `IsFiniteType.existsUnique_dynkinType` at `:88`. The following exist at both pins:
- `TauCeti.HopfIdeal.IsMaximalTorus` (`Torus/Maximal.lean:50`);
- `TauCeti.Bialgebra.iterateFrobeniusPoints` (`Frobenius/Points.lean:66`) and `frobeniusFixedPointsMulEquiv` (`Frobenius/FixedPoints.lean:174`);
- `TauCeti.Cocharacter.leviDecompositionMulEquiv` (`Dynamic/LeviDecomposition/Basic.lean:194`);
- `indTrivialEquiv` and `indTrivialIso` (`Induction/Permutation.lean:133, :166`);
- `TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear` (`Representation/Embedding.lean:213`) and `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor` (`Tannaka/GroupFunctor.lean:138`).

These Mathlib names exist at the branch pin:
- `ContDiffAt.to_localInverse` (`InverseFunctionTheorem/ContDiff.lean:66`);
- `IsCoveringMap.existsUnique_continuousMap_lifts` and `IsQuotientCoveringMap.fundamentalGroupToMulOpposite` (`Topology/Homotopy/Lifting.lean`);
- `IsCoveringMap.eq_of_comp_eq` (`Topology/Covering/Basic.lean`);
- `isCommMonObj_of_isProper_of_geometricallyIntegral` (`AlgebraicGeometry/Group/Abelian.lean`);
- `Rep.indResAdjunction` and `Rep.indCoindIso`;
- `Adjunction.ofNatIsoLeft` and `rightAdjointUniq`.

`Gassmann.almostConjugate_iff_permutation_equiv` is InductionRestriction's own target on main, in `namespace …InductionRestriction.Gassmann`, at `Suggested.lean:729`. The anchor `#layer-21-almost-conjugacy-and-permutation-representations` matches its README:346.

**Cross-roadmap citations, resolved on main.**
- SchemeAndStackFoundations §§0.3, 0.7, 0.8, 1.1, 1.5, 1.13–1.15, 2.6 and 4.12 (README:551, 755, 798, 2071, 2167, 2418, 2458, 2502, 3437, 5613).
- ModularCurves §§0E–0F (:386, :412; §0F covers finite-locally-free Weil restriction).
- SmoothBundlesConnections B1.0, B1.1 and B1.4 (:221, :315, :421).
- LieGroups Layers 2, 7 and 8 (:275, :407, :428).
- DGFloer Layer 1, item 2, the fibration exact sequence (:451–500).
- GroebnerGeometry G5 (:394).

`roadmaps resolve` finds no cross-roadmap citation missing. The overlap index lists no id dropped by another pull request and no id defined only by an open revision.

**Seeded sample.**
- **1.1 Rational cohomology and algebraic induction** (`jantzen-1985`, printed page = PDF page − 5):
  - §2.8, the comodule map, at line 1100, p. 36, with its Remark on p. 39 (line 1151), so "pp. 36–39" is right;
  - "We assume from 3.2 on that G is a flat k-group scheme" (line 1487), matching the README's flat Hopf algebras;
  - §3.3 at line 1507, p. 52, and §3.8 opens on p. 58 (line 1647), so §§3.3–3.7 are pp. 52–58;
  - §3.9, injective modules and `I ⊗ k[G]`, at line 1688, p. 60, with the README's enough-injectives route, part b);
  - §4.2 at line 1923, p. 69;
  - §4.7 Lemma a), `Hⁿ(G, N ⊗ k[G]) = 0` for `n > 0`, at line 2001, p. 73;
  - §4.14, the Hochschild complex `M ⊗ k[G]^⊗n`, at line 2102, p. 77, with §4.16 on pp. 79–79a (lines 2136, 2159).
- **8.1 Split reductive data.** `conrad-rgs` Definition 5.1.1 at line 5651, p. 136: a maximal torus `T ≃ D_S(M)`, constant roots and coroots, rank-one root spaces, imposed even on disconnected bases (lines 5661–5667). `README.md:2180–2186` restates it on an affine base, the roadmap's carrier.
- **8.2 Pinnings.** `conrad-rgs` Definition 6.1.1 (line 7725) and Remark 6.1.2 (line 7738), both on p. 186. The README's Borel/positive-system equivalence and its `Spec(k×k)` Check follow the remark.

**Other locators checked this round.**
- Milne, *Algebraic Groups* (2017), cached `iAG2017.pdf`, printed page = PDF page − 12:
  - Theorem 7.18 at line 6102, p. 143: `G/H` exists as a separated algebraic scheme for smooth affine `G`;
  - Definition 17.15 and Theorem 17.16 at lines 14605 and 14608, p. 356.
- `conrad-feng`:
  - Proposition 12.3.1 at line 5345, p. 127;
  - Definition H.1.1 at line 10356, p. 238;
  - Theorem F.3.7 at line 8986, p. 208;
  - the pseudo-reductive definition and Proposition F.5.10 at lines 9445–9448, p. 218.
- `conrad-rgs`: Definition 3.1.1 (p. 81, which defines reductive S-groups), Theorem 3.3.4 (p. 98), 4.1.7 (p. 112), 5.1.13 (pp. 143–145), 6.1.16 (p. 196) and 6.1.17 (p. 197).

The manifest's `milne-iag` entry points to the 2015 v2.00 notes, while the README cites the 2017 edition. I checked against the cached 2017 text.

**Adversarial calculations** (values computed this round).

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| `linearlyReductive_iff_reductive_identityComponent` | constant `S₃`/ℚ; `𝔾_a`/ℚ; `O₂`/ℂ | `S₃`: LHS true (Maschke, `6 ∈ ℚˣ`), `(G_k̄)° = 1` reductive; `𝔾_a`: line `k·e₁` under `[[1,a],[0,1]]` has no stable complement, LHS false, `R_u = 𝔾_a`, RHS false; `O₂`: `G° = SO₂ ≅ 𝔾_m`, both true | Pass |
| same, negative control | constant `ℤ/p` over `𝔽_p` | `k[x]/(x^p − 1) = k[u]/(u^p)` indecomposable: LHS false; `G° = 1`: RHS true; excluded by `[CharZero k]` | Pass |
| `linearlyReductive_iff_torus` | `𝔾_m`, `SL₂`, trivial group, `μ_p` over `𝔽̄_p` | `𝔾_m` both true; `SL₂`: `⟨x^p, y^p⟩ ⊂ R_p` has no complement, not a torus; trivial group: rank-0 torus, LR; `μ_p`: LR, not a torus, `k[t]/(t−1)^p` nonreduced, so `hsm` fails | Pass |
| `exists_levi_complement` | Borel `B ⊂ GL₂`/ℚ, `J` = ideal of `T` vs of `U` | `O(B)^U = ℚ[a^{±1}, d^{±1}] → O(T)` bijective; `→ O(U)` sends `a, d ↦ 1`, not injective | Pass |
| `lang_surjective` | `𝔾_a`/𝔽₂ and `𝔾_m`/𝔽₂ at `θ ∈ 𝔽₄`; constant `C₂` | `θ² − θ = 1`; `θ⁻¹θ² = θ`; `C₂`: only value `1`, the other element missed, excluded by `hconn` | Pass |
| `hF` vs pinned `frobeniusPoints_apply_apply` | `q = 2`, `n = 1`, `f(t) = θ` | `θ^(2^1) = θ² = F(θ)` | Pass |
| `exists_coordinatePresentation` | `n = 0, 1, 2`; ℤ/4 | `det(∅) − 1 = 0`, quotient ℤ; `x − 1`, quotient ℤ; `ad − bc − 1`; `[[1,1],[0,1]]⁻¹` has upper-right `−1 = 3` | Pass |
| `halfTwist`, `plane_braid` | `n = 2`, `i = 0`, `t = 0, ½, 1` | `(0,1)`; `(½ − i/2, ½ + i/2)`, counterclockwise; `(1,0)`; `Conf₂(ℂ) ≅ ℂ × ℂ*` by centroid and `(z₁−z₂)²`, `π₁ = ℤ = B₂` | Pass |
| `permutation_nonsplit` | `n = 2`; `n = 0, 1` | `B₂ = ℤ → C₂` by parity; a section sends the swap to `m` with `2m = 0`, so `m = 0`, even; for `n ≤ 1` both groups trivial (hypothesis excludes) | Pass |
| §1.1 Hochschild (sample) | `ℤ[t,t⁻¹]`, weight one; trivial group over ℤ | `d⁰(1) = 1⊗(t−1)`; `d¹(t−1) = t⊗(t−1) − (t⊗t − 1⊗1) + (t−1)⊗1 = 0`; trivial group: `d⁰, d¹, d² = 0, id, 0` (2, 3, 4 alternating identities) | Pass |
| §1.1 induction (sample) | `C₂ ⊂ S₃`, trivial coefficients | equalizer rank `|S₃/C₂| = 3`; pinned `inducedEquiv` maps equal `:704–705`'s | Pass; R04 |
| §8.1 split datum (sample) | `SL₂` vs `PGL₂`; `SL₂/𝔽₂` | root `2ϖ` vs generator of `X`; centre `𝔽₂[t]/(t−1)²`, length 2 | Pass |
| §8.2 pinning (sample) | `x_α(t)` vs `x_α(2t)`/ℚ; `Spec(k×k)` | tangents `E₁₂` vs `2E₁₂`; `B⁺ ⊔ B⁻` gives signs `(+,−)`, no constant `Φ⁺` | Pass |
| R02 maximal tori | `SL₂`/ℂ, `T` and `uTu⁻¹`, `u = [[1,1],[0,1]]`; `SL₂`/ℝ | `u·diag(t,t⁻¹)·u⁻¹ = [[t, t⁻¹−t],[0,t⁻¹]]`, conjugate by `u`; over ℝ, `T(ℝ)` unbounded and `SO₂(ℝ)` compact, not conjugate, so `[IsAlgClosed k]` is needed | Statable; R02 |
| R02 parabolic Levi | `P = B ⊂ GL₂` over `𝔽₂(s)`; `P = G` | `R_{u,k}(B) = U`, `O(B)^U → O(T)` bijective over an imperfect field; `P = G`: `R_u = 1`, `J = 0` | Statable; R02 |
| R03 separated ⇒ Hausdorff | `𝔸¹`; doubled-origin line | `ℂ` Hausdorff; two origins inseparable; stated in §3A.5 (`:969`), RG2.0.1 `t2Space_of_isSeparated`, and CCPII C-1.1 (`:921`) | Duplicate |
| R03 chart open embedding | `D(t) ⊂ 𝔸¹` | `localizationAwayXHomeomorph`: `D(t)(ℂ) ≃ₜ ℂˣ`, open in `ℂ`; §3A.5 `:952–954` and RG2.0.1 `isOpenEmbedding_affineOpen` | Duplicate |
| R04 Layer 7f identity | `S₃`, `H = ⟨(12)⟩`, `g = (12)`; `g = 1` | `1·2 = 2·1`; `3·2 = 6·1`; same two sides as `Subgroup.natCard_fixedBy_mul_natCard` | Duplicate |
| R04 worked example | `GL₃(𝔽₂)`, line vs plane stabilizer | `|GL₃(𝔽₂)| = 168`, 7 lines and 7 planes, `|P| = |Q| = 24`; pinned almost-conjugate, non-conjugate for `card n ≥ 3` | Duplicate |
| Point-topology contract | `𝔸¹`; `D(t)` over ℂ | `polynomialHomeomorph`: `𝔸¹(ℂ) ≃ₜ ℂ`; `isOpenEmbedding_localization`'s `hR`, `hU` both from `Units.isOpenEmbedding_val` | Pass |
| Parabolic contract | `SL₂`: Borel `B`; diagonal `T` | `B` parabolic (`IsBorel.isParabolic`); `T_k̄` (dim 1) contains no Borel (dim 2), not parabolic | Pass |
| 7a fixed-coset Check | `H = 𝔽̄₃ˣ`, `J = {±1}` | Lang on `J`: `x² = 1`, misses `−1`; `a² = −1` in `𝔽₉`: `σ(a) = a³ = −a`, coset `{a, −a}` has no fixed point | Pass |
| 7a `SL₂` count | `q = 3` | `|SL₂(𝔽₃)| = 24`, `|B⁺(𝔽₃)| = 6`, `24/6 = 4 = q + 1 = |ℙ¹(𝔽₃)|` | Pass |
| §9B elementary subgroups | `SL₂(ℤ/4)`, `[[0,1],[3,0]]`; `[[2,1],[3,2]]`/ℤ | `x_α(1)x_(−α)(−1)x_α(1) = [[0,1],[−1,0]] ≡ [[0,1],[3,0]]`, `a = 0`, `c = 3` a unit; `det = 1` but `2, 3` non-units in ℤ: no single chart | Pass |
| Milne 7.18 locator | — | line 6102, p. 143: separated quotient for smooth affine `G` and any subgroup | Pass |

## Not verifiable

- Cited by locator only (uncertified or not cached): Jantzen 2003 Part II §§3.18–3.19, Conrad–Gabber–Prasad, Waterhouse, Borel, Springer, Lang 1956, Steinberg 1968, Howlett–Lehrer, Dipper–Du, Carter, Serre and Gassmann.
- SGA 1 XII, Riche, Gros–Kaneda, Brieskorn, Salvetti, Callegaro, Fox–Neuwirth, Fadell–Neuwirth, Birman–Brendle, Hedén, Dudas–Michel, Frenkel–Kac and McNinch are cached. Their locators sit in passages that are unchanged since earlier rounds. The rewritten 3A.5 paragraph keeps the same SGA 1 XII §§1.1–1.2 locator, and I did not re-read these this round.
- Ownership against open pull requests was checked with the roadmaps tool and the sibling checkouts:
  - ComplexComparisonPartII #848;
  - SchubertGeometry #1224, ClassicalGroupsPartII #1492 and RootSystemsPartII #1731;
  - GroupSchemesOverABase #1522;
  - the Layer 8 citers #999, #1056, #1069 and #1837.

  The RootSystems #1196 sibling path holds no README. The heads of #1332, #1797, #1807, #1808 and #1854 were read only through the overlap index.

## Source issues

- **Misprint** in conrad-rgs at Remark 6.1.2, printed p. 186: the source says the expectation about Borels "it not true", with the verb missing; it should be "is not true"; affects nothing.
- **Misprint** in conrad-feng at the proof of Proposition 12.3.1, printed p. 127: the source says L "is is generated" by T and root groups, a doubled word; it should be "is generated"; affects nothing.
