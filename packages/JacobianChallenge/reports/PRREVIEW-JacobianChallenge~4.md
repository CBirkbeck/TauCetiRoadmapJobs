# Review of JacobianChallenge (pull request #1892 at c40cdde)

**Verdict:** needs changes

Two findings, both P3; nothing blocks. This head repairs all seven findings of the previous review in full (details under Verified sound). The gate passes, the module elaborates with `sorry` as the only warning, the dependency check reports no UPWARD or CYCLE line, and every sampled locator supports its statement as written.

## R01 (P3) — Stacks 0BFD is cited for a claim it does not make

**Location.** `TauCetiRoadmap/JacobianChallenge/README.md` line 145: "the Picard group law is commutative directly by tensor product (Stacks [0BFD](https://stacks.math.columbia.edu/tag/0BFD))".

**Claim.** 0BFD supports commutativity of the Picard group law by tensor product.

**Witness.** 0BFD is Groupoid Schemes, Lemma 39.9.5: an abelian variety is a commutative group scheme. Its proof reduces to an algebraically closed field and uses the finiteness of the commutator map near the identity (More on Morphisms, Lemma 37.44.3); tensor products of invertible modules do not enter. The claim it is attached to needs no source: the group law of `relativePicardFppfSheaf` is commutative because its presheaf of classes is, and `IsCommMonObj.ofRepresentableBy` transports that.

**Repair.** Replace the parenthesis with a pointer to where the commutativity is actually proved: "the Picard group law is commutative directly by tensor product (D.2, through `IsCommMonObj.ofRepresentableBy`)", and keep 0BFD, if at all, beside Mathlib's `isCommMonObj_of_isProper_of_geometricallyIntegral` as the Stacks form of that theorem.

Tested on the two instances the sentence covers: for `Jac X` the group law comes from `CommGrpObj.ofRepresentableBy` applied to a sheaf of commutative groups (`Suggested.lean` lines 175–180), no rigidity used; for an abstract `A : AbelianVariety k`, commutativity is the Mathlib theorem, which is 0BFD's content.

## R02 (P3) — Geometric integrality of the standing curve is announced as a theorem but located nowhere

**Location.** `TauCetiRoadmap/JacobianChallenge/README.md` lines 90–92: "Such a curve is geometrically integral (smoothness gives geometric reducedness; regular and connected gives irreducible), and this is recorded as a theorem, never assumed"; line 358: "Prove that the standing curve satisfies their hypotheses: it is integral (Conventions)".

**Claim.** The roadmap proves that a smooth proper geometrically connected curve is geometrically integral.

**Witness.** A.3 points to the Conventions for the proof and the Conventions point to "a theorem" with no layer, locator or input. The fact is used in B.3 (line 501, "by geometric integrality"), D.4 (the standing curve is a "projective geometrically integral scheme"), E.1 and E.2. The inputs exist: Stacks 056T (Varieties, Lemma 33.25.4: smooth over `k` implies geometrically normal and geometrically reduced), Stacks 033M (Properties, Lemma 28.7.6: a Noetherian normal scheme is a finite disjoint union of normal integral schemes, so connected and normal gives integral, after every field extension), and Mathlib's `GeometricallyIntegral.of_geometricallyReduced_of_geometricallyIrreducible` (`Mathlib/AlgebraicGeometry/Geometrically/Integral.lean` line 61).

**Repair.** In A.3, replace "it is integral (Conventions)" with: "it is geometrically integral: smoothness gives geometric reducedness and geometric normality (Stacks 056T), a connected Noetherian normal scheme is integral (Stacks 033M), applied after every field extension, and Mathlib's `GeometricallyIntegral.of_geometricallyReduced_of_geometricallyIrreducible` assembles the two; so it is integral". Add Mathlib's lemma to the "From Mathlib" contract beside `GeometricallyIntegral`, and change line 91 to "this is A.3's first statement".

Tested on `ℙ¹_L` over `k` with `[L : k] = 2` separable: smooth and proper, geometrically reduced and normal, but not geometrically connected (`ℙ¹_L ×_k k̄` has two components), and indeed not geometrically integral, so the geometric-connectedness input is used; and on the pointless conic over `ℝ`: smooth, proper, geometrically connected, hence geometrically integral, as claimed.

## Verified sound

**Previous review, finding by finding.**

- **R01 (Layer B anchor): repaired.** Line 391 reads "## Layer B: coherent cohomology over `k`: genus, Riemann–Roch, Serre duality", identical to main. All six `## Layer` headings agree with main (lines 308, 391, 557, 718, 1020, 1201 against main), so the links from AbundanceStatement (#545) line 64, CrystallineCohomology (#857) and AnabelianGeometryAndNonabelianChabauty (#1021) lines 5342 and 5448 resolve.
- **R02 (two proofs of `isRepresentable_picZeroSets`): repaired.** D.5 (lines 862–865) proves it once, by the open and closed locus of fibre degree zero; D.8 (lines 946–954) names the representing object and identifies it with `Pic⁰_{X/k}` by `Functor.RepresentableBy.isoReprX`. The field base change (lines 956–971) uses D.2's base change and `relativePicardDegreeZeroFunctorBaseChangeIso`; the descent route is gone (`DescentDatum` occurs in neither file; Stacks 0CDR, 0245, 0AP4 and 01ZY are no longer cited in D.8). "Galois descent" occurs nowhere. `Suggested.lean` line 144 reads "(README D.5 represents it by the open and closed locus of fibre degree zero in the Picard scheme of `hasPicardScheme_of_curve`)".
- **R03 (cube narrowed): repaired.** E.1 (lines 1024–1036) states the cube for `U`, `V` proper geometrically integral with rational points and `W` connected with a point, citing Stacks 0BF4 and Milne I Theorem 5.1; the `ℙ¹ × ℙ¹ × ℙ¹` Check is at lines 1041–1042, and ArakelovGeometryAndAbelianHeightsPartII §10.9a is listed under Downstream consumers (lines 1350–1351).
- **R04 (ModularCurves): repaired.** Lines 1337–1342 describe the three prose contracts and Layer 2D.
- **R05 (D.1 locators): repaired.** Lines 728–729 cite Stacks 0B9N at the split sequence with a section; lines 734–736 cite Kleiman Remark 2.11, sequence (2.11.4), pp. 20–21, with 0B9M for the first three terms.
- **R06 (Tau Ceti contract, Layer F Dependencies): repaired.** The contract now names `AbelianVariety.TangentSpace`, `finrank_tangentSpace_eq_dim`, `AbelianVariety.baseChange_toOver` (lines 272–279), `relativePicardDegreeZeroFunctorBaseChangeRepresentableBy`, `rigidifiedPicardDegreeZeroFunctor` (lines 259–268), the B.1, C.1 and B.2 inputs (lines 194–212, 218–222). F.3's *Needs:* no longer lists C.2 (line 1289), so "Layers B, D, E" at line 1315 is now the correct Dependencies line.
- **R07 (docstring reason): repaired.** `Suggested.lean` lines 37–45 give the corrected reason, matching `relativeDifferentialsIsoDivisorSheaf` at `Modules/Differentials/Canonical.lean` line 170 (`[IsIntegral X]`, `ht`, `K`, `hK` arguments).

**Gate, build, dependency check.**

- My gate run at this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's run also reports `build=0`.
- `lake env lean` on a scratch copy of `Suggested.lean` with `#check @` for all 27 declarations appended: exit 0, 14 warnings, all "declaration uses `sorry`", at lines 70, 83, 99, 130, 147, 185, 198, 224, 234, 242, 265, 273, 283 and 309.
- Dependency check with `--movable`: `depcheck: 239 roadmaps, 2353 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. JacobianChallenge is line 1 of the merge order; its only roadmap supplier, SchemeAndStackFoundations, is on main.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The pins equal main's: Tau Ceti 2fd255d9, Mathlib 1b1ccf4b.

**Signatures.** The 27 elaborated types agree with the worker's `signatures.md` up to notation (`𝟙_` for `tensorUnit`, `⋙` for `.comp`). Every `def`, `abbrev` and `instance` carries `SmoothOfRelativeDimension 1`, `IsProper` and `GeometricallyConnected` explicitly; the three genus statements carry the `FiniteDimensional` guard of `Scheme.genus`; `multiplication_etale_iff` carries `0 < A.dim`. Each README statement matches its Lean generality. Nothing changed.

**Padding probe.** Each of the 14 `sorry`s replaced by `first | infer_instance | rfl | (simp; done) | aesop | sorry` in a scratch copy: none closes. Nine fall through to `sorry`; on `dim_jacobianVariety`, `multiplication_isogeny`, `multiplication_etale_iff`, `isClosedImmersion_abelJacobi` and `isIso_abelJacobi_of_genus_eq_one` the probe leaves the goal open (the pin has representability instances only for `d = 0, 1`, isogeny results only for `n = −1` and `n = 0`, and no general finite-dimensionality for proper schemes, as the previous review recorded). No declaration restates a definition, mirrors a Check or computes a value.

**Headline theorems** (Summary and Layers B–F) against `Suggested.lean`:

| Headline | Status |
|---|---|
| finite-dimensional coherent cohomology on proper `X/k` | stated |
| Serre duality through a trace | stated with the trace quantified; the named trace is in the docstring as not statable, for the reason verified above |
| Hilbert scheme of points of a curve | stated |
| Picard scheme of the curve without a point | stated, with `HasPicardScheme`, `picardScheme`, `picardSchemeIso` |
| `Jac X` represents `Pic⁰` over any field | stated |
| `Jac X` proper, geometrically integral, `dim = g` | stated |
| Albanese property; closed immersion for `g ≥ 1`; isomorphism for `g = 1` | stated |
| field base change | pointed Albanese form stated; the pointless representation is in the docstring (only presheaf base change at the pin: `PicZero/BaseChange.lean` lines 158, 234) |
| `[n]` isogeny; `[n]` étale iff `(n : k) ≠ 0` | stated |
| dual, polarizations, theta, autoduality | in the docstring; `AbelianVariety/` at the pin has no dual carrier |

**Library declarations opened at the pins** (paths under `TauCeti/` unless marked Mathlib). All 79 Tau Ceti names in the contract resolve: `relativePicardFppfSheaf` (`PicardFunctor/Fppf.lean` 104), `relativePicardDegreeZeroFppfSheaf` (`PicZero/Fppf.lean` 114, the fppf sheafification of the presheaf of classes of degree zero on every geometric fibre, which is what D.5 describes), `relativePicardDegreeZeroFppfSheafι` (192), `relativePicardPresheafBaseChangeIso` (`PicardFunctor/BaseChange.lean` 115), `relativePicardDegreeZeroFunctorBaseChangeIso` and `…RepresentableBy` (`PicZero/BaseChange.lean` 158, 234), `relativePicardFiberDegree` (`PicZero/Basic.lean` 141), `relativePicardDegreeZeroFunctor` (374), `rigidifiedPicardFunctor` (`Rigidified.lean` 70), `rigidifiedPicardDegreeZeroFunctor` and `…Iso` (`PicZero/Rigidified.lean` 108, 255), `abelJacobiMapOfDegree` (`Abel/Degree.lean` 110), `abelJacobiMapToPicZeroFppf` (`Abel/Fppf.lean` 91), `abelJacobiMap_app_injective_of_genus_pos` (`Abel/PointSeparation.lean` 119), `relativeEffectiveCartierDegreeSubfunctor` and `…OneSection` (`EffectiveCartierDivisor/Degree/Basic.lean` 59, 85), `AbelianVariety` (`Basic.lean` 95), `baseChange_toOver` (292), `TangentSpace` and `finrank_tangentSpace_eq_dim` (`TangentSpace.lean` 85, 193), `IsAlbanese` and `isAlbanese_of_isIso` (`Albanese.lean` 84, 215), `finiteDimensional_cohomology_one_trivial_of_smooth` (`RiemannRoch/Finiteness.lean` 79), `finrank_cohomology_zero_trivial_eq_one_of_isIntegrallyClosedIn` and `genus_eq_genus_functionField` (`WeilDivisor/Scheme/SerreDuality.lean` 236, 245; the latter takes `hex hdim hF hk`, the regularity-type hypotheses B.3's Check names), `eulerCharBelow_eq_relativeDegree_add_one_sub_genus` (`RiemannRoch/Basic.lean` 263), `finrank_cohomology_zero_sub_finrank_cohomology_zero_tensor_dual` and `nonempty_cohomologyOneDualEquivCohomologyZero_tensor_dual` (`LineBundle/SerreDuality.lean` 204, 105), `relativeDegree_principalDivisor`, `eulerDegree_eq_relativeDegree`, `eulerDegree_mul` (`EulerCharacteristic.lean` 256, 303, 343), `picZero` (`WeilDivisor/Scheme/PicZero.lean` 92), `eulerDegree_eq_finrank_mul` (`LineBundle/Degree.lean` 157), `cohomologyMapBaseLinear` (`Cohomology/Module/Base.lean` 60), `relativeDifferentialsIsoDivisorSheaf`, `nonempty_…_differentials_tensor_dual`, `finrank_cohomology_zero_relativeDifferentials`, `finrank_…_differentials_tensor_dual`, `eulerDegree_relativeDifferentials` (`Modules/Differentials/Canonical.lean` 170, 248, 262, 286, 305), `repartitionToCohomologyOne` and `repartitionQuotientEquivCohomologyOne` (`RepartitionCohomology.lean` 155, 262), `cohomologyOneDualEquivCohomologyZero` and its `_symm_apply_…` lemma (`SerreDuality.lean` 122, 137), `subsingleton_cohomologyOn_succ_of_isAffineOpen` (`Cohomology/Affine.lean` 243), `homologyCechComplexIsoCohomology` (`Cech/Basic.lean` 103), `subsingleton_cohomology_of_two_le_of_smooth` and `finiteDimensional_cohomology_of_smooth` (`Curves/Cohomology.lean` 149, 159), `isZero_higherDirectImage_succ_of_isClosedImmersion` (`ClosedImmersion.lean` 44), `isZero_higherDirectImage_succ_of_isAffineHom` and `isFinitePresentation_higherDirectImage_of_isFinite` (`HigherDirectImage/Affine.lean` 109, 120), `higherDirectImageRestrictIso` (`Restrict.lean` 52), `bijective_cohomologyBaseChange`, `cohomologyBaseChangeLinearEquiv`, `finrank_cohomology_pullback_eq_of_isPullback` (`FlatBaseChange.lean` 173, 241, 277), `genus_eq_of_isPullback_of_smooth` (`Curves/Genus/BaseChange.lean` 72), `upperSemicontinuous_finrank_cohomology_one_fiber` (`Semicontinuity.lean` 130), `bijective_cohomologyBaseChange_zero_of_subsingleton_cohomology_one` (`CohomologyAndBaseChange.lean` 113), `free_cohomology_zero_twistingSheaf` and `subsingleton_cohomology_twistingSheaf_of_lt_card` (`ProjectiveSpace/TwistingSheaf.lean` 113, `HigherCohomology.lean` 740), `toAbelianVariety`, `projModelPointsMulEquiv`, `pointAddEquivPicZero`, `natCard_comp_mulBy_eq_one` (`EllipticCurve/Scheme/AbelianVariety.lean` 65, `GroupLaw.lean` 117, `PicZero.lean` 120, `FieldPoints.lean` 183), `weilDifferentialOfSeparating`, `kaehlerDifferentialEquivWeilDifferentialOfSeparating` (`Differential/Comparison.lean` 91, 156), `repartitionDualComponent`, `apply_eq_finsum_…`, `finsum_…_eq_zero` (`LocalComponent.lean` 84, 186, 219), `Place.traceResidue_coord_smul_eq_repartitionDualComponent` (`Independence.lean` 275), `FinitelyPresentedSheaf` (`FinitelyPresentedSheaf/Basic.lean` 48), `principalSubgroup_eq_ker`, `classGroupAddEquivLineBundleClass`, `nonempty_iso_sheaf_iff` (`CartierDivisor/ClassGroup.lean` 61, 123, 158), `LineBundleClass` (`LineBundle/Class.lean` 50), `SchemeWeilDivisor.relativeDegree` (`WeilDivisor/Scheme/Degree.lean` 39), `InvertibleSheaf.eulerDegree` (`LineBundle/Degree.lean` 74). `Scheme.Modules.Cohomology.formalFunctionsIso` is absent at the pin and planned by SchemeAndStackFoundations §4.9 (its README line 5467), which resolves the resolver's one lead.

Mathlib: `uliftYonedaReprXIso` (`CategoryTheory/Yoneda.lean` 596), `RepresentableBy.isoReprX` (572), `reprX` and `representableBy` (564, 568), `IsRepresentable` (514), `uliftYoneda` (63), `GrpObj.ofRepresentableBy` (`Monoidal/Cartesian/Grp.lean` 34), `IsCommMonObj.ofRepresentableBy` (`CommMon_.lean` 29), `CommGrpObj.ofRepresentableBy` (`CommGrp_.lean` 37), `AddCommGrpCat.toCommGrp` (`Algebra/Category/Grp/EquivalenceGroupAddGroup.lean` 63), `isCommMonObj_of_isProper_of_geometricallyIntegral` (`AlgebraicGeometry/Group/Abelian.lean` 131), `ClassGroup.equivPic` (`RingTheory/PicardGroup.lean` 876), `GeometricallyConnected` (`Geometrically/Connected.lean` 40, through `ConnectedSpace`, which includes `Nonempty`, so the standing curve is nonempty and 056U applies), `GeometricallyIntegral.of_geometricallyReduced_of_geometricallyIrreducible` (`Geometrically/Integral.lean` 61).

**Cross-roadmap citations resolved** (main 2083308; open heads of the 2026-11-09 index).

- SchemeAndStackFoundations on main: §0.9 (line 848), §0.11 (938), §1.1 (2071), §2.2 (3309), §2.11 (3656), §2.20 (4275; `cm_serre_duality` 4352, `curve_dualizing_comparison` 4358), §3.3 (4713; `vectorBundle_riemann_roch` 4735, `curve_serre_duality` 4741), §3.6 (4905; `picardComponent_torsor` 4914, `jacobian_dim` 4913), §3.7 (4937), §4.9 (5448), §4.12 (5613; `chow_lemma` 5625), §4.14 (5706). §4.9's and §4.14's *Needs:* lines name JacobianChallenge Layers B–C, and §3.6's *Needs:* is §3.1, §3.4, so the target-level direction is as the README documents.
- StableReduction on main: contracts J-A1, J-A2, J-B, J-C, J-B / SR-2, J-D, J-E (README lines 304–310) match the Downstream entry.
- EtaleCohomologyFoundations §0.11 (lines 52, 1159–1177), AlgebraicCurves Layer 12 (lines 44–90), EnhancedDerivedSheaves E2.8 (lines 27, 137), AdicSpacesPartIII (lines 369–401), AlgebraicVectorBundles (lines 403–406), ModularCurves Layer 2D and its three prose contracts (lines 59–61, 585) match their Downstream entries.
- Open heads: ArakelovGeometryAndAbelianHeightsPartII (#1833) §10.9a exists and its cube-for-products contract (README line 125) is now covered by E.1 (E.1's `W` may be any connected scheme with a point, which includes the contract's complete variety with a rational point); JacobianChallengePartII (#1225) §§0.1–0.4, 2.1, 2.6 exist (lines 144, 154, 175, 199, 328, 401); AbelianSchemesAndArithmeticModuli (#849) A0.2 and A2.2 exist (lines 676, 1082) and consume Layer E; AlgebraicModuliForArithmeticGeometry (#853) §7.3 exists (line 9297).
- Observations that are not this roadmap's findings: #1225 §0.3 (line 184) still defines its relative Picard scheme as `Functor.reprX` of the sheaf rather than consuming D.2's `picardScheme`, and HyperellipticCurves (#1707) line 476 cites `JacobianVariety X hdim` with an argument this head's signature does not have; both roadmaps are later in the merge order and update their citations when they merge.

**Overlaps.** #1187 (the Tau Ceti bump) conflicts textually in `Suggested.lean`, but its target `ab00ba392` (2026-10-19) is an ancestor of the pin 2fd255d9 (2026-11-04), checked with `git merge-base`, so it is superseded. No id cited here is dropped by an open pull request; no id cited here is defined only by an open revision; this pull request drops no id (the Layer B heading is restored). Ownership by object across all open heads and main: `HasPicardScheme`, `picardScheme`, `jacobianScheme`, `isRepresentable_picZeroSets`, "Hilbert scheme of points" and `relativeEffectiveCartierDegreeSubfunctor` occur in no other roadmap; `JacobianVariety` only as a consumed name (HyperellipticCurves); the theorem of the cube in #849 (A1.5, over a general base, consuming Layer E), #1833 (consumer) and HeightsRationalPointsAndObstructions (consumers); no second owner.

**Sources: the seeded sample.**

*"Cohomology and base change" (C.2).* Stacks 02KH (Cohomology of Schemes, Lemma 30.5.2): `g` flat, `f` quasi-compact quasi-separated, `F` quasi-coherent, parts (1) and (2) as written. 0B91 (Derived Categories of Schemes, Lemma 36.30.4): `f` proper of finite presentation, `G` of finite presentation flat over `S`, `Rf_*G` perfect with formation commuting with base change; supports the bounded complex of finite projectives over affine `S`. 0BDN (Lemma 36.32.1): upper semicontinuity under those hypotheses. 0B9T (Lemma 36.32.2): `χ` locally constant and compatible with base change. The README's statements are at or below the sources' generality (it adds "locally Noetherian" where the source does not need it).

*"Field base change" (D.8).* The argument uses D.2's base change (a representing object base-changes because the fppf sheaf of `X_K` is the restriction of that of `X` along `Over.map`, and `Hom_K(T, P_K) = Hom_k(T, P)`) and `relativePicardDegreeZeroFunctorBaseChangeIso_hom_comp_ι` (`PicZero/BaseChange.lean` 213), which is the compatibility with `ι` the paragraph asserts. The docstring's "not statable" reason holds: `PicZero/BaseChange.lean` has only the presheaf comparison and representing-object transport (lines 158, 234), nothing for the fppf sheaf.

*"Properness and geometric integrality" (D.8).* Stacks 056U (Varieties, Lemma 33.25.6): on `X` smooth over `k` the closed points with finite separable residue field are dense; with `X` nonempty this gives `l`. Descent of properness along `Spec l ⟶ Spec k` is SchemeAndStackFoundations §0.11 (line 938). Geometric connectedness and dimension after extension to an algebraic closure containing `l` are statements about `(Jac X)_{k̄} = Pic⁰_{X_{k̄}/k̄}`, supplied by D.6–D.7 over `l` and then `k̄`.

*"Jacobian" (D.8, `dim_jacobianVariety`).* Kleiman, Theorem 5.11 (preprint p. 42, cache line 2002): `T₀ Pic_{X/k} = H¹(𝒪_X)` when `Pic_{X/k}` exists over a field; Milne, *Abelian Varieties* v2.0, III Proposition 2.1 (printed p. 91, cache line 3702): `T₀ J ≅ H¹(C, 𝒪_C)` and `dim J = g`. Both support the statement as written.

*New locators of this head, also checked.*

- Stacks 0BF4 (More on Morphisms, Theorem 33.8, cache line 4825): `X, Y → S` flat proper finitely presented with geometrically integral fibres and sections, `Z` connected with a point `z` over which `L` is trivial, `L` trivial on the two section faces; E.1 is its case `S = Spec k`.
- 0BFE (Groupoid Schemes, Lemma 39.9.6): the cube relation on `A × A × A` with the `m_I` of E.1.
- 0B9M (Picard Schemes of Curves, Lemma 44.4.2): `0 → Pic(T) → Pic(X_T) → Pic_{X/S}(T)` exact when `𝒪_T → f_{T*}𝒪_{X_T}` is an isomorphism for all `T`; 0B9N (Lemma 44.4.3): with a section, the sequence is short exact and split by `σ_T^*`.
- Kleiman Remark 2.11, (2.11.4) and the following paragraph: cache lines 980–1036, pages 20–21; Theorem 2.5 p. 18 (line 880); Theorem 4.8 pp. 27–28 (line 1309); Lemma 4.9 pp. 30–31 (line 1440); Proposition 5.19 p. 47 (line 2219); Remark 5.24 p. 50 (line 2394); the Noetherian limit reduction on p. 15 (lines 751–752).
- Milne (printed page = PDF page − 6): I Theorem 5.1 p. 21 (line 947), Corollary 5.2 pp. 21–22 (956), Theorem 5.5 and Remark 5.6 p. 23 (1004, 1010), Theorem 6.4 p. 29 (1262), Theorem 7.2 p. 33 (1417), Remark 7.3 p. 34 (1453), Proposition 8.4 p. 35 (1526), Remark 8.7 and Theorem 8.9 p. 37 (1577, 1606); III Proposition 2.3 and Lemma 2.4 p. 92 (3747, 3750), Proposition 6.1 p. 104 (4230), Theorem 6.6 p. 105 (4289), Lemmas 6.8–6.9 p. 106 (4317, 4350), Remark 6.10 and Summary 6.11 p. 107 (4361, 4381); the index places "polarization" at p. 53.
- Tate 1968: the Definition of `res` at a closed point, §3, p. 154 (cache line 234); Theorem 2 (rational points) and Theorem 3 with its Corollary, p. 155 (243, 256, 262); Theorem 5 p. 158 and its Corollary p. 159 (371, 377).
- 0BA0 (Lemma 44.6.7, separably closed): parts (3), (5), (6) as D.5 and D.7 cite them; 03RP (Proposition 39.9.11): (5)–(7) as E.7 cites them, (7) over an algebraically closed field; 0BFG (Lemma 39.9.8): `[d]` finite locally free of degree `d^{2 dim A}`; 0BFH (Lemma 39.9.9): `A` nonzero, `[d]` étale iff `d` invertible in `k`, matching `0 < A.dim`; 0C1A (Lemma 53.8.4): `H⁰ = k` hypothesis, `h⁰(Ω) = g`, `deg Ω = 2g − 2`; 0BUG (Lemma 33.9.3): (8) as B.3 cites it; 0BS2 (Lemma 53.4.1): (5) and (6) as `serreDuality_exists_trace` cites them.
- Locators unchanged since the previous review and verified there (0B9A, 0B9D, 0B9I, 0B9J, 0A26, 01ZY, 01TP, 01TX, 0897, 02O5, 02O6, 01XK, 02L6, 01XS, 0B9Z, 0D04): re-read in the README at this head; the statements they are attached to did not change.

**Adversarial table.**

| statement | instances tried | values on each side | result | change |
|---|---|---|---|---|
| `finiteDimensional_cohomology` | `X = ∅`; `ℙ¹_k`, `𝒪(−2)`; `ℙ²_k`, `𝒪(−3)`; `𝔸¹_k` | `0`; `h⁰ = 0, h¹ = 1`; `h² = 1`; `H⁰ = k[t]`, excluded by `IsProper` | holds | none |
| `serreDuality_exists_trace` | `ℙ¹_k`, `F = 𝒪(n)`; `X = ∅`; `ℙ¹ ⊔ E`, `F = 𝒪` | `dim Hom(𝒪(n), 𝒪(−2)) = max(−1−n, 0) = h¹(𝒪(n))`; `0 = 0` with `t = 0`; `(0 + 1) = (0 + 1)` with `t = tr_{ℙ¹} + tr_E` | holds | none |
| B.2 negative control | `𝔽_p(t)`, `P : x^p = t`, `η = x^{p−1}dx/(x^p − t)` | `u = 1/x`: `η = −du/(u(1 − tu^p))`, `res_∞ = −1`, so `res_P = 1`; `Tr_{κ(P)/k} = 0` | holds | none |
| B.3 degree formula | `ℙ¹_L/k`, `[L:k] = 2` | `χ_k(Ω) − χ_k(𝒪) = −2 − 2 = −4 ≠ 2g − 2 = −2`; 0C1A needs `H⁰ = k` | hypothesis needed, as stated | none |
| B.4 Riemann–Roch | pointless conic `C/ℝ`, `P` of degree 2 | `χ(𝒪(P)) = 3 = 2 + 1 − 0` with no rational point | holds | none |
| A.3 standing-curve hypotheses | `ℙ¹_L/k` (not geometrically connected); conic `C/ℝ` | `ℙ¹_L ×_k k̄` has 2 components, not geometrically integral; `C` geometrically integral | true, unlocated | R02 |
| A.3 base-field Check | conic `→ ℂ` | `deg_ℝ 𝒪(P) = 3 − 1 = 2`; `deg_ℂ = 2`; over `ℝ` of `ℙ¹_ℂ`: `6 − 2 = 4 = 2·2` | holds | none |
| `isRepresentable_relativeEffectiveCartierDegreeSubfunctor` | `d = 0, 1`; `ℙ¹`, `d = 2`; `ℙ¹ ⊔ ℙ¹`, `d = 2` | `Spec k`, `X`; `ℙ²`; `ℙ² ⊔ (ℙ¹ × ℙ¹) ⊔ ℙ²`, three components of dimension 2 | holds | none |
| D.2 Checks | `f = 𝟙 S`; fold `S ⊔ S → S` on `T = ℙ¹_k` | `Pic(T)/Pic(T) = 0`, `picardScheme = S`; presheaf `ℤ` on `ℙ¹_k`, `0` on the two affines, sheafification `0`, `picardScheme = S` | holds | none |
| `hasPicardScheme_of_curve` | `ℙ¹_k`; `C/ℝ` | `∐_ℤ Spec k`; `∐_ℤ Spec ℝ`, `Pic(C) = 2ℤ ⊊ Pic_C(ℝ) = ℤ` | holds | none |
| D.1 obstruction sequence | `C/ℝ`, `T = Spec ℝ`; `ℙ¹_k` with a point | `0 → 0 → 2ℤ → ℤ → ℤ/2 → Br(C)`, `1 ↦` the quaternion class, killed in `Br(C)`; split by the section (0B9N) | holds | none |
| D.5 `isRepresentable_picZeroSets` | `C/ℝ`; Selmer cubic over `ℚ`; `ℙ¹_k` | `Pic⁰ = Spec ℝ`, the degree-0 component; an elliptic curve over `ℚ`; `Spec k ⊂ ∐_ℤ Spec k` | holds, one route | none |
| D.5 degree locally constant | `X_T → T` for any `T` | 0B9T needs only finite presentation, which `X_T → T` inherits from `X → Spec k` | holds (the §0.9 limit step is redundant, not wrong) | none |
| D.8 field base change | `K = k`; `C/ℝ → ℂ`; `E/ℚ → ℂ` | pullback along `𝟙`; `(Spec ℝ)_ℂ = Spec ℂ = Jac ℙ¹_ℂ`; `E_ℂ` | holds | none |
| `isProper_jacobianScheme`, `geometricallyIntegral_jacobianScheme` | `ℙ¹`; `E`; genus 2; `C/ℝ` with `l = ℂ` | `Spec k`; `E`; a surface; `Spec ℝ` after descent from `Spec ℂ` | holds | none |
| `dim_jacobianVariety` | `ℙ¹`; `E`; Selmer cubic; `y² = x⁵ + 1` | `0 = 0`; `1 = 1`; `1 = 1`; `2 = 2` | holds | none |
| `multiplication_isogeny` | `dim 0`, `n = 5`; `E`, `n = −2`; supersingular `E`, `n = p`; `n = 0` | `id`; degree 4; purely inseparable of degree `p²`; `[0]` is an isogeny only in dimension 0 | holds; `n ≠ 0` needed | none |
| `multiplication_etale_iff` | `E/𝔽_3`, `n = 2, 3, 6, 0`; `dim A = 0`, `n = 3` | étale and `2 ≠ 0`; not étale and `3 = 0`; not étale and `6 = 0`; `[0]` not flat and `0 = 0`; `[3] = id` étale while `3 = 0`, so `0 < dim` needed | iff holds | none |
| E.1 cube, Check 1 | `ℙ¹ × ℙ¹ × ℙ¹`, `𝒪(1,0,0)` | trivial on `{u₀} × ℙ¹ × ℙ¹`; `𝒪(1,0)` on the other two faces | holds | none |
| E.1 cube, Check 2 | `U = Spec k ⊔ Spec k`, `V = W = E`, `L = 𝒪(Δ − {0}×E − E×{0})` on the second copy | on `{0} × E`: `[0] + 0 − [0] = 0`, trivial; on `E × {0}`: trivial by symmetry; on `{a} × E`: `[a] − [0] ≠ 0` for `a ≠ 0` | holds; geometric integrality needed | none |
| E.1 cube, Check 3 | `A × A × {0}` | `m₁₂₃ ↦ m₁₂`, `m₁₃ ↦ m₁`, `m₂₃ ↦ m₂`, `m₃ ↦ 0`: both sides `m₁₂^*L ⊗ m₁^*L ⊗ m₂^*L` | holds | none |
| E.1 square on `T`-points | `a, b ∈ A(T)`, pull back Milne's Corollary 5.2 sheaf along `(a, b, id)` | `t_{a+b}^*L ⊗ t_a^*L⁻¹ ⊗ t_b^*L⁻¹ ⊗ L ⊗ (a^*L ⊗ b^*L)`, the last two from `Pic(T)`, so trivial in `Pic(A_T)/Pic(T)` | holds | none |
| Mathlib contract, 0BFD | the Picard sheaf; an abstract `A` | commutative by tensor product, no source needed; 0BFD proves commutativity by the commutator argument | locator wrong | R01 |
| `abelJacobi` | `E` with `O`, `P` | `a_P = t_{𝒪(O − P)} ∘ a_O` since `𝒪(x − P) = 𝒪(x − O) ⊗ 𝒪(O − P)` | holds | none |
| `isAlbanese_abelJacobi` | `g = 0`; `g = 1` | every pointed `ℙ¹ → A` is `0`, factoring uniquely through `Spec k`; `φ = f ∘ a⁻¹` | holds | none |
| `isClosedImmersion_abelJacobi` | `g = 0` excluded; `g = 1, 2, 3` | `ℙ¹ → Spec k` is not; `h⁰(Ω(−x)) = g − 1 = 0, 1, 2 < g`, evaluation surjective | holds | none |
| `isIso_abelJacobi_of_genus_eq_one` | `g = 1`; `g = 2` | closed immersion of integral curves, `1 = 1`; `1 ≠ 2` | holds; hypothesis needed | none |
| `isAlbanese_baseChange_abelJacobi` | `K = k`; `E/ℚ → ℂ`; `ℙ¹` | `ε` invertible; `a_ℂ` an isomorphism; constant to `Spec K` | holds | none |
| E.5–E.6 signs | `E`, `L = 𝒪([0])` | `φ_L(b) = 𝒪([−b] − [0])`; `q(𝒪([−b] − [0])) = −b = [−1]b` | holds | none |
| E.7 torsion | `E` over `k^sep`, `n` invertible; `n = p` | `(ℤ/n)²` of order `n²`; order `p` or `1` against degree `p²` | holds | none |
| C.2 three-point Check | `[1:0:0]`, `[0:1:0]`, `[1:1:t]` in `ℙ²_{𝔸¹}` | collinear iff `t = 0`; `h⁰ = 1, 0`; `χ = 3 − 3 = 0`; `f_*F = 0` | holds | none |
| C.3 non-proper Check | `ℙ¹_A ∖ {∞₀}` | `H⁰ = A`; `lim (A/tⁿ)[x] = A⟨x⟩ ≠ A` | holds | none |
| C.4 `𝔽_q` Check | `ℙ¹_{𝔽_q}`, `d = 2` | `(q+1)(q+2)/2 + (q² − q)/2 = q² + q + 1 = #ℙ²(𝔽_q)` | holds | none |
| D.4 Check | `ℙ¹`, `L = 𝒪(−1)`, `m = 1` | `H⁰ = H¹ = 0`; `E = H⁰(𝒪) = k`; `∅ ↦ 𝒪(−1)` | holds | none |
| D.5 Abel-map Checks | `E`, `d = 1`; genus 2, `AJ_2` | surjective, smooth, birational, so an isomorphism; fibre over `[Ω(−2x₀)]` is the canonical pencil `ℙ¹`, `2 < 3` | holds | none |
| F.2 tangent map | `g ≥ 1` | `T_0J = H¹(𝒪) ≅ H⁰(Ω)^∨`; dual of `T_xX → T_0J` is evaluation, surjective since `h⁰(Ω(−x)) = g − 1` | holds | none |

## Not verifiable

- Hartshorne, *Algebraic Geometry*, II.6.13–6.15, III.5.1–5.2, III §7, III.12.8–12.11: settled as uncertified. The C.2 cohomology-and-base-change and Grauert clauses were cross-checked against Stacks 0B91, 0BDN and 0B9T.
- Mumford, *Abelian Varieties*, §§5 and 13: no legal copy; cross-checked against Stacks 0B91, 0BDN and Kleiman Remark 5.24.
- Serre, *Algebraic Groups and Class Fields*, Chapter II; Stichtenoth, Sections I.7 and 4.3; Liu; Bosch–Lütkebohmert–Raynaud, Chapters 8–9: settled as uncertified; cited as background only.
- Milne, *Jacobian Varieties* (Cornell–Silverman): settled as uncertified; the README's Part III numbering and pages were checked against the *Abelian Varieties* v2.0 notes in the cache.
- The Stacks tags other than 0BF4 are not in the sources cache; they were read on the Stacks project site.
- Ownership against open pull requests was checked with the roadmap index's search over all 466 open heads and the sibling checkouts this brief lists.

## Source issues

- **Gap** in milne-av at I §5, Theorem 5.1, p. 21: the notes defer the proof of the theorem of the cube to a later version and give none; it should give the full argument or cite one (Stacks 0BF4, Mumford §10); affects the proof.
