# Review of FormalConnectionsOpers (pull request #1056 at 0694f07)

**Verdict:** needs changes

This is a full review of head `0694f07`. Since `a2334b4`, 482 lines changed, all in `TauCetiRoadmap/FormalConnectionsOpers/README.md`. `Suggested.lean`, `metadata.toml`, the pins (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`) and everything outside the folder are unchanged.

**Previous findings.** All seven findings of the review of `a2334b4` are repaired.

- R01 (second topology on the native carrier): repaired. §4.3 (1506–1518) now reads "`WithConv.ofConv` followed by `TauCeti.SchemePointTopology.affineHomeomorph` … is a homeomorphism from the pinned point topology `TauCeti.PointTopology.instTopologicalSpaceWithConv` onto ReductiveGroups 3A.5c's topology … No second topology is put on the carrier". The Tau Ceti contract (245–261) lists the four global instances and `affineHomeomorph`; Conventions 172–176 are reworded as asked. Each named instance exists at the pin (file and line below).
- R02 (two owners for the `X^an` identification): repaired. The C−1.1 contract (354–360) now carries "the identification of the underlying topological space of `X^an` with `X(ℂ)` carrying ReductiveGroups 3A.5c's classical topology … for a smooth affine group `G` … the identification by the identity of `G(ℂ)` of ReductiveGroups 3A.5d–3A.5e's charts with the smooth charts of `G^an`"; §2.4 (794–796) cites it: "both are cited and not proved again here". ComplexComparisonPartII at #848 states exactly this (its C−1.1, lines 1086–1088 of the listing).
- R03 (§2.4 re-plans 3A.5b–3A.5d): repaired. §2.4 (800–802) takes open embeddings, Hausdorffness and second countability from "ReductiveGroups 3A.5b–3A.5c"; (823–826) "each is a homeomorphism from an open subset of `X(ℂ)` onto an open subset of `ℂ^d`, they cover `X(ℂ)`, their transitions are holomorphic, and étale maps become local biholomorphisms; none of this is proved again here"; the Spec-adjunction step cites `AlgebraicGeometry.Spec.homEquivAlgHom` and `affineHomeomorph` (797–800); Scope 60–66 is "§2.4 owns the fixed-model realization". ReductiveGroups #1676 (now at `4f4198cb`) states 3A.5b–3A.5e at lines 1291–1410 as the contract describes.
- R04: repaired, lines 707–709 now carry `−d − a dx` with the values `(−1 − ax) dx ≠ (1 − ax) dx`.
- R05: repaired, lines 1030–1034 use `g = t^M`, inverse pole orders `1, 2, 3`.
- R06: repaired, lines 2191–2197 give the `0`-primary argument and `H²(ẑ, ℤ) ≃ ℚ/ℤ`.
- R07: repaired. Kostant is cited by Proposition 0.4, Theorem 0.1 (p. 521), Theorem 0.6 (p. 522) and (0.1.8) (p. 524) at 1654–1667 and 2631–2636; §1.1 cites Frenkel–Gaitsgory §19.1, pp. 110–111; §2.3 cites Katz 1970 §1.0–1.1; §3.1 cites Frenkel (1.3-1), p. 19; §5.2 cites Frenkel–Gaitsgory Corollary 1.3.2 and Frenkel (4.3-1), Lemma 4.3.5; §7.1 cites Huebschmann Theorem 3.8, Addendum 3.8.4 and Frenkel–Gaitsgory Lemma 4.3.1; Rinehart has Theorem 3.1, p. 198, and the Mathlib link is at the pin `1b1ccf4b`; "uncertified" is dropped for Kostant and Rinehart. Every one of these locators was read in the cached texts (table below).

## R01 (P2) — §§3A.3 and 3A.5 re-plan the Iwahori–Weyl group, the Iwahori–Bruhat decomposition and the Cartan decomposition that ReductiveGroupsPartII states on main

**Location.** `TauCetiRoadmap/FormalConnectionsOpers/README.md:1310–1323`: "Prove the complex loop Cartan decomposition on complex points, `G(ℂ((t))) = ⊔_(λ ∈ Y⁺) G(ℂ[[t]]) t^λ G(ℂ[[t]])` … the extension to every connected reductive complex `G` … is a target here … Prove the Coxeter relations of the affine Weyl group … and the Iwahori–Bruhat decomposition `G(ℂ((t))) = ⊔_(w ∈ Y ⋊ W) I w I`". The same objects are planned at:
- 1223–1225: "prove … the corresponding formal normalizer quotient modulo `T(ℂ[[t]])`" (`N_G(T)(ℂ((t)))/T(ℂ[[t]]) ≃ Y ⋊ W`);
- 1231–1233: "Identify the affine Coxeter subgroup as `Q^∨ ⋊ W` … and its extended quotient as `Y/Q^∨`";
- API bullets 1330–1333; the ReductiveGroupsPartII contract (321–325) names only RG2.5.1.

**Claim.** These decompositions on `ℂ`-points are targets of this roadmap, with Iwahori–Matsumoto as the source.

**Witness.** ReductiveGroupsPartII on main (`TauCetiRoadmap/ReductiveGroupsPartII/README.md`) states them for every `ModelField K` (henselian, discrete, perfect residue field, line 127), which `ℂ((t))` is:
- RG2.1 *affine-weyl-group* (line 2233): `(W_a, S_aff)` is a Coxeter system and `W_a = W(Φ) ⋉ Q^∨`;
- RG2.4.1 *iwahori-weyl-group* (line 5533): `W̃ = N(K)/Z(K)_0`, `W̃ = W_a ⋊ Ω`, with the Check `splitTorus` giving `Z(K)/Z(K)_0 ≅ X_*(T)` for a split torus, so `W̃ ≅ Y ⋊ W` for split `G`;
- RG2.4.2 *iwahori-bruhat-decomposition* (line 5730): `w ↦ IẇI` is a bijection `W̃ → I\G(K)/I`;
- RG2.4 *cartan-decomposition* (line 6215): `G(K) = KN(K)K` and `W_0\W̃/W_0 ≅ K\G(K)/K` for a special point, with the split hyperspecial form `⊔_{λ ∈ X_*(T)^+} Kλ(ϖ)K`.

SheafTheoreticSmithTheory (#1734, listing line 678) already cites RG2.4 for exactly these inputs. ReductiveGroupsPartII cites nothing from this roadmap, so the citation creates no cycle.

**Repair.**
- Add RG2.1 *affine-weyl-group*, RG2.3 *parahoric-subgroup* and RG2.4 *iwahori-weyl-group*, *iwahori-bruhat-decomposition* and *cartan-decomposition* to the ReductiveGroupsPartII contract, at the instance `K = ℂ((t))`, `G` split (ReductiveGroups Layers 8–9), `K = G(ℂ[[t]])` hyperspecial and `I = I_form(ℂ)`.
- In §3A.3 keep the polynomial quotient `N_G(T)(ℂ[t, t⁻¹])/T(ℂ[t]) ≃ Y ⋊ W` as a target; for the formal quotient, the Coxeter structure of `Q^∨ ⋊ W` and the component group `Y/Q^∨ ≅ Ω` cite RG2.1 and RG2.4.1 instead of proving them.
- In §3A.5 replace the two "Prove" sentences and the Iwahori–Matsumoto extension paragraph by: identify `I_form(ℂ)` with RG2.3's Iwahori of the base alcove and `G(ℂ[[t]])` with the hyperspecial parahoric; then cite RG2.4's bijections `Y⁺ ≃ G(ℂ[[t]])\G(ℂ((t)))/G(ℂ[[t]])` and `Y ⋊ W ≃ I\G(ℂ((t)))/I`. What stays here: the functorial `LG`, `L⁺G`, `I_form` on all `R`, the ind-schemes `Gr_G` and `Fℓ_G`, the lattice charts, the identification of RG2.4's double cosets with the strata `Gr^λ` and the pole-order bound, and §3A.6's polynomial comparison.
- Add the same items to §3A.5's `*Needs:*` (1352–1353) and the layer's Dependencies (1424–1425); keep Iwahori–Matsumoto in References as the primary source RG2.4 also cites.

**Test on `GL₁` and `SL₂`.** For `GL₁`, RG2.4.1's `splitTorus` Check gives `W̃ = ℤ`, and *cartan-decomposition* gives `ℂ((t))ˣ = ⊔_n ℂ[[t]]ˣ t^n`, the Check at 1337–1339. For `SL₂`, RG2.4.1's `sl2_eq_affineWeyl` gives `W̃ = W_a` infinite dihedral, and RG2.4's double-coset set is `Y⁺ = ℕα^∨`, so `diag(t, t⁻¹)` and `diag(t², t⁻²)` lie in distinct double cosets, the Check at 1340–1343; both Checks survive as Checks of the identification.

## R02 (P3) — Four sampled sections carry no locator, and one locator points after the lemma it precedes

**Location.**
- §3.3 (1045–1062), §3.4 (1066–1096), §7.3 (2300–2326) and §8.4 (2553–2579) give no locator for any target.
- `README.md:2268–2270`: "prove its action free (Frenkel, Lemma 4.2.2 and the display following Lemma 8.3.2's statement)".

**Witness.** In Frenkel, the freeness of `N((t))` on the moment-map level is the sentence before Lemma 8.3.2 ("in the same way as in the proof of Lemma 4.2.2", Frenkel2007 lines 10505–10506, p. 247); the text after the lemma's statement is its proof (lines 10513–10524). Frenkel2007 line 994 is (1.2-7), p. 18, the gauge classes `{∂_t + A(t)}/LG((t))` of §§3.3–3.4; lines 3043 and 3103 are §3.1.2 (Segal–Sugawara relations, p. 65) and §3.1.3 (the Virasoro algebra, p. 66) for the `L_n` relations of §§7.3 and 8.4.

**Repair.**
- Write "(Frenkel, the paragraph preceding Lemma 8.3.2, p. 247)" at 2269.
- Add one locator per target: §§3.3–3.4 to Frenkel §1.2.6, (1.2-7), p. 18, and Frenkel–Gaitsgory §4.1 for the groupoid; §7.3 to Frenkel §3.1.3, p. 66, for the Virasoro relations and to Drinfeld–Sokolov for the KdV flow; §8.4 to Frenkel §3.1.2, p. 65, for the Segal–Sugawara normalization and to Frenkel–Gaitsgory §4.3 for the cotangent algebroid. A standard textbook suffices for the standard facts.

**Test.** With `P_q = 2q∂ + q′ − ½∂³` and `L_n = Res(t^(n+1) q dt)`, the central term of `{L_m, L_n}` is `−½(m³ − m)δ_(m+n,0)`, which is the Virasoro relation of Frenkel §3.1.3 at central charge `−6`; the locator supports the statement.

## R03 (P3) — A deprecated Mathlib name in the contracts

**Location.** `README.md:222–223`: "`nhds_basis_clopen`: open subgroups inside clopen neighbourhoods of `1`, for the finite-monodromy classification of Layer 6"; also §6.1, line 1973.

**Witness.** Elaborating `#check @nhds_basis_clopen` at the pin prints "`nhds_basis_clopen` has been deprecated: Use `nhds_basis_isClopen` instead" (`Mathlib/Topology/InductiveDimension/Classes.lean`); the replacement has the conjuncts in the order `IsClopen s ∧ x ∈ s`.

**Repair.** Cite `nhds_basis_isClopen` at 222 and 1973.

**Test.** `#check @nhds_basis_isClopen` elaborates without a warning, with hypothesis `[ZeroDimensionalSpace X]`, which a profinite group satisfies.

## Verified sound

**Gate and direction**
- Gate run here on `0694f07`: `set_option=0 … source-material=0 OK` (EXIT 0); the worker's run adds `build=0`.
- Dependency check: `depcheck: 237 roadmaps, 2310 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. Merge order: ComplexComparisonPartII line 39, FormalConnectionsOpers line 40, CrystallineCohomology 23, KacMoody 3; PadicDifferentialEquationsAndRigidCohomology 120, GeometricSatakeAndFusion 130, SheafTheoreticSmithTheory 357 are later.
- `roadmaps resolve`: no cross-roadmap citation and no Lean name found nowhere.
- `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`.

**Lean**
- `lake env lean` on `Suggested.lean`: exit 0, three `declaration uses sorry` warnings (lines 71, 130, 160), nothing else.
- `#check @name` for all nine declarations in a scratch copy of the file (the module system hides them from an importing file): every elaborated type equals `signatures.md`, and no binder is lost: `[Algebra ℚ R]`, `reductiveCommHopfAlgProperty ℂ H`, `[CharZero F]`, `Differential.deriv ≠ 0`, `[FiniteDimensional F V]`, `[HopfAlgebra k H] [Algebra k R]` are all present.
- One-tactic probes on the same copy: `regularGauge_constantCoeff_bijective`: `simp` makes no progress, `exact?` fails; `exists_cyclicVector`: `exact?` fails, `simp` makes no progress; `formalLoop_eq_polynomial_mul_positive` is Česnavičius Theorem 19 (line 359 of the cached text). None is padding. The rank-`0` instance `V = Fin 0 → F` closes by `⟨0, by simp⟩`: the degenerate case is a Check, not a counterexample.
- `#synth` on `WithConv (Polynomial ℂ →ₐ[ℂ] ℂ)` returns `instTopologicalSpaceWithConv`, `instT2SpaceWithConv`, `instSecondCountableTopologyWithConv`, `instLocallyCompactSpaceWithConv`: the pinned instances are global, as the contract (259–261) says.

**Headlines.** Stated: Layer 2 (`regularGauge_constantCoeff_bijective`), Layer 3A (`formalLoop_eq_polynomial_mul_positive`), Layer 6 (`exists_cyclicVector`). Named in the docstring as not statable, each with its missing carrier: F2.1/F2.3 flatness criterion (no form-connection carrier at the pins), F4.3 Drinfeld–Sokolov and Chevalley–Kostant, F4–F5 opers and `Fun Op(D×)`, F6.1/F6.5 Frenkel–Zhu and torsor triviality, F7–F8 Poisson structure, Miura and the isomonodromy algebroid. Grep of the pins for an algebraic connection carrier (`M → M ⊗ Ω¹` with curvature) finds none; `TauCeti.HopfAlgebra.points` has no `ChartedSpace` instance at the pin, as §4.3 (1516–1517) says.

**Library declarations opened at the pins (36)**
- Tau Ceti: `PointTopology.topology` (`Topology/Algebra/PointTopology/Basic.lean:83`), `instTopologicalSpaceWithConv` (`:110`), `isHomeomorph_ofConv` (`:115`), `isEmbedding_eval_generators` (`:185`), `isClosedEmbedding_eval_generators` (`:245`, hypotheses `[IsTopologicalSemiring R] [T1Space R]`), `locallyCompactSpace_of_finiteType` (`:261`); `isTopologicalGroup` (`Group.lean:102`, `[HopfAlgebra k H] [IsTopologicalSemiring R]`); `instT2SpaceWithConv` (`Separation.lean:64`), `instSecondCountableTopologyWithConv` (`:97`, `[Algebra.FiniteType k A]`), `instLocallyCompactSpaceWithConv` (`:113`, `[T1Space R] [LocallyCompactSpace R] [Algebra.FiniteType k A]`); `SchemePointTopology.Points` (`Scheme.lean:47`), `topology` (`:127`), `affineHomeomorph` (`:165`, underlying equivalence `Spec.homEquivAlgHom.symm`); `chartedSpaceOfIsOpenEmbedding` (`Geometry/Manifold/Gluing/Basic.lean:87`), `isManifold_chartedSpaceOfIsOpenEmbedding` (`:135`), `maximalAtlas_chartedSpaceOfIsOpenEmbedding_eq` (listed at `:54`; elaborated type: equal maximal atlases for any second `IsManifold` structure in which every piece is an `IsLocalDiffeomorph`); `smoothCommHopfAlgProperty_of_charZero`, `finrank_lie_eq_ringKrullDim_of_charZero`; `zHat.gen`, `hom_ext`, `lift`, `lift_gen`, `lift_unique`, `liftEquiv` (`ZHat/Basic.lean:89–170`); `cohomologicalDimensionAt_le_one` (`hp : p ≠ 0`), `cohomologicalDimensionAt_eq_one` (`[Fact p.Prime]`), `cohomologicalDimension_eq_one` (`ZHat/CohomologicalDimension.lean:191, 199, 206`); `IsPPrimaryTorsion`; `Toric.regularAffinePointHomeomorph`, `coneChartEquiv`; `ContinuousMonoidHom.exists_mem_nhds_one_forall_le_ker`; `AlgHom.mapValue`; `ProjectiveGeneralLinear`; `Bialgebra.CounitAlgebra`.
- Mathlib: `Spec.homEquivAlgHom`, `Spec.map_comp`; `HahnSeries.ofPowerSeriesAlg`; `Differential`; `GroupLieAlgebra`, `LeftInvariantDerivation` (`[ContMDiffMul I ⊤ G]`); `IsTopologicalGroup.exist_openSubgroup_sub_clopen_nhds_of_one` (`[CompactSpace G]`), `ProfiniteGrp.exist_openNormalSubgroup_sub_open_nhds_of_one`; `RootPairing.Base.flip`; `Algebra.Smooth.exists_span_eq_top_isStandardSmooth`, `Algebra.IsSmoothAt.exists_isStandardEtale_mvPolynomial` (`[Algebra.FinitePresentation R S]`); `MvPolynomial.vanishingIdeal_zeroLocus_eq_radical` (`[IsAlgClosed K] [Finite σ]`), `eq_vanishingIdeal_singleton_of_isMaximal`, `isMaximal_iff_eq_vanishingIdeal_singleton`; `Matrix.linftyOpNormedAlgebra`, `linftyOpNormedRing`; `HahnModule`; `LieRinehartRing`; `Scheme.PresheafOfModules`; `Pseudofunctor.IsPrestack`.

**Cross-roadmap citations resolved**
- ReductiveGroups #1676 (`4f4198cb`): lines 22–43 (pinned chart topology, 3A.5 the single owner, C−1.1 owns the `X^an` identification, "FormalConnectionsOpers §2.4 consumes 3A.5c–3A.5d, and its §4.3 consumes 3A.5e"); 1291–1332 (3A.5b), 1334–1373 (3A.5c, with `affineHomeomorph`, `isClosedEmbedding_eval_generators`, `isOpen_iff`), 1375–1394 (3A.5d: homeomorphism onto an open subset of `ℂᵈ`, holomorphic transitions, étale local biholomorphisms), 1396–1417 (3A.5e). The contract at 305–319 restates these faithfully.
- ComplexComparisonPartII #848 (listing): 792–795 and 1086–1088 (the identity on `G(ℂ)` identifies 3A.5's topology and charts with `G^an`); 1090–1096 (F2.4 keeps fixed-model atlases, second countability, tangent, toric, group and gauge comparisons). Its table line 153 still says F2.4 retains "second countability", which F2.4 now takes from 3A.5b; that is C−1.1's description, not a contract this roadmap consumes.
- CrystallineCohomology #857 CR.1.3 (listing 1121–1312): connection `∇ : M → M ⊗ Ω`, extension, curvature, base change, tensor connection, and the Hom/dual connection "for `M` finitely generated projective", horizontal maps: the contract at 335–338 matches.
- LieHighestWeight (main, `RepresentationTheory/LieHighestWeight/README.md` 981–1067): `lieInvariantSymmetricAlgebra`, `lieCartanRestriction`, `killingSymmetricEquiv_cartan_restriction`, `lieChevalleyRestrictionIso`, `lieChevalleyRestrictionIso_mem_homogeneous_iff`. LieGroups (main) Layers 0, 6, 7 at lines 252, 673, 787. RootSystems, FormalLaurentPuiseux L1–L3, L7 (lines 70–315), AnalyticToricGeometry (Completed; `affinePointTopology`, `coneChartedSpace`, Layer 3G at 333), AffineMorseLefschetz A4.0–A4.1, ReductiveGroupsPartII RG2.5.1 (line 6724), SchemeAndStackFoundations §§1.1, 1.14–1.18, ComplexManifolds Milestones 1, 2, 7, SmoothBundlesConnections B3–B4, CharacteristicClasses C5.1: all present on main.
- Consumers on main: KacMoody KM8A (line 79: "FormalConnectionsOpers Layer 3A owns the functorial polynomial and formal loop theory"); AffineLieAlgebras (lines 36–38, 118); GeometricRepresentationCategories (R5.1–R5.3, FCO F3–F8); NilpotentOrbits (lines 60–63); SchubertGeometry (line 111 consumes F2.4). PainleveEquations #1955 consumes F1.1–F1.3, F2.1, F2.4, F3.3–F3.4 by these labels.

**Ownership**
- `roadmaps grep` for affine/loop Grassmannian, Kostant slice, isomonodromy, cyclic vector, Drinfeld–Sokolov, Miura, Iwahori, complex Lie group and polynomial loop. SheafTheoreticSmithTheory #1734 (line 14, 98, 654) names "FormalConnectionsOpers §3A.5 the loop Grassmannian and affine flags over ℂ" as owner and consumes it; GeometricSatakeAndFusion #1235 and #1836 build the Witt-vector and perfect affine Grassmannians, a different object; SpringerResolutionAndCharacteristicCycles #1828 (line 134) consumes F4.3; PainleveEquations #1955 owns isomonodromic deformations on curves and consumes this roadmap's formal carriers.
- PadicDifferentialEquationsAndRigidCohomology #1002 (listing line 153) still writes "This roadmap owns the cyclic-vector theorem … FormalConnectionsOpers F6 consumes the `F = ℂ` specialization". This roadmap is at merge-order line 40 and #1002 at line 120, and the Downstream bullet (2623–2627) already says #1002 is to import §6.2. The settlement is #1002's to make; nothing in this folder changes, as in the previous review.
- `overlaps.md`: no open pull request changes this roadmap; no cited id is dropped.

**Seeded sample of sources.** Every locator below was read in the cached text; page numbers are the printed ones, checked against the running heads.

| Target | Source and locator | Supports the statement |
| --- | --- | --- |
| F1.1 | Frenkel–Gaitsgory §19.1, pp. 110–111 (lines 5286–5357): `V₁ ⊗^! V₂ = lim V₁ⁱ ⊗ V₂ʲ`; the maps `⊗^* → ⊗^→ → ⊗^!`, the first an isomorphism for `V₂` discrete, the second for `V₁` discrete | Yes |
| F1.2 | Frenkel §3.5.4, pp. 91–92 (lines 4109–4120): `Aut O = ℂˣ ⋉ Aut⁺O`, `Der⁺O = t²ℂ[[t]]∂_t` pro-nilpotent; §3.5.7, p. 96 (4350–4362): λ-forms | Yes |
| F1.3 | Drinfeld v4 §§3.2.1–3.2.3 (218–237), (3.1) (232), Theorem 3.3 (264), Lemma 3.9 (477–482), Theorem 3.10 (486), Theorem 3.11 (490–496, `f(a) = 1 ⊗ a`, `g(a) = a ⊗ 1`) | Yes |
| F2.2 | Rinehart Theorem 3.1, p. 198 (152–153): `S(L) → gr V(R, L)` an isomorphism for `L` projective | Yes |
| F2.3 | Katz 1970 §1.0, pp. 178–179 (158–203): curvature, integrability, the bracket identity (1.0.5); §1.1, pp. 180–181 (208–262): horizontal maps, tensor, internal Hom, inverse image | Yes |
| F3.1 | Frenkel §1.3.1, (1.3-1), p. 19 (1029–1035): `K_N = {g ∈ G[[t]] : g ≡ 1 mod t^N}`, a base of neighbourhoods of `1` | Yes |
| F3.3, F3.4 | no locator | R02 |
| F3A.2 | Česnavičius Theorem 16 (= Česnavičius–Fedorov Theorem 4.2, line 332), Theorem 17 (334), Theorem 19 (359–365: `G(A((t)))/G(A[[t]]) ≃ G(A[t, t⁻¹])/G(A[t])` for `G_ad` totally isotropic), Example 15 (327–331: split ⇒ totally isotropic) | Yes |
| F3A.5 | Iwahori–Matsumoto Proposition 2.34(iii) (1521–1528), Theorem 2.16 (1248) | Yes, and R01 |
| F4.3 | Kostant Proposition 0.4 and Theorem 0.1, p. 521 (134–146), Theorem 0.6, p. 522 (196), (0.1.8), p. 524 (243); Frenkel §4.2.4, pp. 112–113 (4991–5024): `b_i = [p₋₁, b_(i+1)] ⊕ V_i`, Lemma 4.2.2 | Yes |
| F4.4 | Frenkel–Gaitsgory Corollary 1.3.2, p. 17 (787–789) | Yes |
| F5.2 | Frenkel (4.3-1), p. 118 (5243); Lemma 4.3.5, p. 123 (5446–5461) | Yes |
| F5.3 | Frenkel (4.2-13)–(4.2-14), pp. 116–117 (5183–5198): monic of order `n`, zero `∂^(n−1)` coefficient, from `Ω^((1−n)/2)` to `Ω^((n+1)/2)` | Yes |
| F5.4 | Frenkel (3.5-11), (3.5-12), p. 98 (4427–4438) | Yes |
| F6.1 | Frenkel Conjecture 10.1.1, p. 310 (12882); Steinberg Theorem 1.9 (134–136, perfect `k`, `dim ≤ 1`) | Yes |
| F6.2 | Deligne Ch. II, Lemme 1.3, p. 42 (1367); Katz 1987, pp. 65–67 (34–43: `c(e, t − a_i)`, `0 ≤ i ≤ n(n − 1)`) | Yes |
| F6.3 | Frenkel–Zhu Lemma 10 (348–354, `r ≤ −1`, "since `𝔤` is semisimple"); Theorem 4 (193, `r ≤ −2`); Remark 1 (80) | Yes; Kazhdan–Lusztig not readable |
| F7.1 | Huebschmann Theorem 3.8, p. 23 (953–957, bracket (3.8.1)), Addendum 3.8.4, p. 24 (986–993) | Yes |
| F7.2 | Frenkel §8.3.2, pp. 246–247 (10465–10512); Lemma 8.3.2 (10512); Frenkel–Gaitsgory §4.3 (1822–1852) | Yes; one locator slip, R02 |
| F7.3 | no locator | R02 |
| F7.4 | Frenkel–Gaitsgory Lemma 4.4.1 (1880–1888) | Yes |
| F8.2 | Frenkel–Gaitsgory Proposition 4.1.1 (1764), §4.2 with `I² = 0` (1765–1784), (4.2)–(4.4) (1790–1798), Lemmas 4.3.1–4.3.2, p. 39 (1825–1852) | Yes |
| F8.3 | Frenkel–Gaitsgory Lemma 4.4.2 (1894–1900) | Yes |
| F8.4 | no locator | R02 |

**Adversarial table.** Each row gives values computed here; rows touched by a finding say so.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `regularGauge_constantCoeff_bijective` | `n = 1`, `A = 1`, `B = 0`; `ℚ[ε]/ε²`, `A = εI`; `𝔽_p`; `n = ∅`; zero ring | `g′ = g`, `g = g₀eᵗ`; `g = g₀(1 + εt)`; `g = 1 + tᵖ` solves `g′ = 0` with constant term `1`, two preimages; singleton to singleton; singletons | holds; `[Algebra ℚ R]` needed | none |
| `regularGauge` action law | `h, g` | `(hg)′(hg)⁻¹ = h′h⁻¹ + hg′g⁻¹h⁻¹`; `gauge(1, A) = A` | as stated | none |
| `formalLoop_eq_polynomial_mul_positive` | `G = 1`; `𝔾_m`, `R = ℂ`; `𝔾_m`, `R = ℂ[ε]/ε²`; `SL₂` | point; `u = atⁿw`; `u = atⁿw(1 + εv)`, `v = v₋ + v₊`, `p = atⁿ(1 + εv₋)`, `q = w(1 + εv₊)`; `(1 − t)⁻¹t⁻¹ − t⁻¹ = (1 − t)⁻¹` | holds | none |
| `exists_cyclicVector` | `V = 0`; `V = F²`, `D = 0`; `𝔽_p(t)`, `D = ∂` on `F^(p+1)` | `Fin 0` family independent (elaborated); no cyclic vector; `∂ᵖ = 0` | both hypotheses needed | none |
| `IsDifferentialModuleMap` | `D = ∂` on `F`; `D = id`; `D = 0`, `∂ ≠ 0` | Leibniz holds; fails by `f′v`; fails | determines its object | none |
| `formalParameterUnit`, `laurentPolynomialToLaurentSeries` | `T n` | `single 1 1 · single (−1) 1 = 1`; `T n ↦ tⁿ` | as stated | none |
| F1.1 completions | `Σ tⁿ ⊗ t⁻ⁿ`; `ℚ[ε]/ε²` | only `n < M` survive in `(V/tᴹV⁺) ⊗ (W/tᴺW⁺)`; `d(εt) = εdt`; FG's two comparison maps iso when `V₂`, resp. `V₁`, discrete | as stated, locator verified | none |
| F1.2 | `φ = t + t²`; `φ = 2t`, `ψ = t + t²`; `f = t⁻¹`; `φ = t²` | `ψ = t − t² + 2t³ − 5t⁴`; `2t + 4t²` against `2t + 2t²`; `(f∘φ)′ = −t⁻² + 1`; `Res = 2 ≠ 1` | as stated | none |
| F1.3 lattices, duality | `tᴺR[[t]]`, `U = tᴹR[[t]]`; residue pairing; `t`, `t⁻¹`, `0` | rank `M − N`; annihilator of `V[[t]]` is `V^∨[[t]]dt`, constant-term pairing gives `tV^∨[[t]]`; nilpotent automorphism / not nilpotent / not automorphism | as stated | none |
| F2.2 Atiyah, opposite sign | `A = k[x]`, `σ(f) = f(1 ⊗ 1 − aξ)` | `∇f = (f′ + af)dx`; `ξ ↦ −dx` gives `−d − a dx`; `(−1 − ax)dx ≠ (1 − ax)dx` | repaired Check correct | none |
| F2.3 flatness | `d + N dx`; `d + yN dx` | curvature `0`, bracket `0`; curvature `N dy ∧ dx`, `[∂_x + yN, ∂_y] = −N` | as stated; Katz (1.0.5) verified | none |
| F2.4 charts, model | `𝔾_m`; `𝔾_m ⊔ 𝔸²`; `Spec ℂ[x]/x²` | chart `ℂˣ ⊂ ℂ` from 3A.5d; two clopen strata; point with cotangent rank `1`, Krull dimension `0` | as stated | none |
| §2.4 gluing hypotheses | `maximalAtlas_chartedSpaceOfIsOpenEmbedding_eq` | needs open embeddings, cover, `C^n` deck maps (3A.5d's transitions), pieces manifolds (open subsets of `Fin d → ℂ`), second structure with each piece a local diffeomorphism | hypotheses supplied by 3A.5d and 3A.5e | none |
| §4.3 pinned topology | `𝔾_m`, `H = ℂ[x, x⁻¹]` | `isClosedEmbedding_eval_generators` with generators `x, x⁻¹` and relation ideal `(XY − 1)`: subspace topology of `{uv = 1}`; `affineHomeomorph` has underlying map `Spec.homEquivAlgHom.symm` | as stated | none |
| §3.2 bounds | `g = tᴹ`, entry bound `0` | `g⁻¹ = t⁻ᴹ`, pole orders `1, 2, 3` for `M = 1, 2, 3` | repaired Check correct | none |
| F3.3–3.4 | `𝔾_m`, `tⁿ`, `exp f`; `1 + εx` | `−nt⁻¹dt`, `−f′dt`; `A + ε([x, A] − x′)` | as stated; no locator | R02 |
| F3A.3 lattice | `(λ, w)(μ, v)(ν, u)`; `SL₂` | `(λ + wμ + wvν, wvu)` in both bracketings; `n t^λ n⁻¹ = t^(−λ)` | as stated; formal quotient is RGPII's | R01 |
| F3A.4 | `t^λ = diag(t, t⁻¹)` | conjugates `[[1, u], [0, 1]]` to `[[1, t²u], [0, 1]]`, `α(λ) = 2` | as stated | none |
| F3A.5 Cartan, Iwahori–Bruhat | `GL₁`; `SL₂` | `ℂ((t))ˣ = ⊔ ℂ[[t]]ˣtⁿ`; `(t, t⁻¹)` and `(t², t⁻²)` distinct elementary divisors; both are RG2.4's `splitTorus` and `sl2_eq_affineWeyl` instances | true, but planned twice | R01 |
| F3A.5 charts | `GL₂`, pole order `0` and `1`; no lower bound | single point `L₀`; `L = e₁ ⊕ t⁻¹e₂` in order `1`; colength-`k` sublattices for every `k` | as stated | none |
| F3A.6 | `GL₂`, `diag(t, t)`; `(1 − t)⁻¹·1` | `det∘λ = t²`, component `2`; truncation `1 + t` has `det = (1 + t)²`, not a unit | as stated | none |
| F3A.7 | `Σ n! tⁿ` | unit of `ℂ[[t]]`, radius of convergence `0` | as stated | none |
| F4.2–4.3 normal form | `𝔰𝔩₂`, `a = t`, `b = 0`; `a = εt⁻¹` | `q = b + a² + a′ = t² + 1`; `q = −εt⁻²` | as stated | none |
| F4.3 Kostant | `𝔰𝔩₂`; `𝔤𝔩₂`; `𝔰𝔩₃` | `det ↦ −h²`, slice `f + ℂe`, complement `{0}` of codimension `3`; degrees `1, 2`; exponents `1, 2`, `1 + 2 = 3` | as stated; locators verified | none |
| F4.4 lifts | `diag(√t, 1/√t)` on `[[0, q], [1, 0]]` | `[[−1/(2t), tq], [t⁻¹, 1/(2t)]]`; residue `−½ ∉ ℤ` | as stated | none |
| F5.2 characters | `q = t⁻²`, `N = 2, 5`; `q_j ↦ 1`; `εt⁻⁷` | `eval(q₋₂) = 1` both; kills no projection kernel; not regular, reduction `0` regular | as stated | none |
| F5.3 elimination | `n = 2`, diagonal `(a, −a)` | `y₂″ − (q + a² + a′)y₂ = 0` | as stated | none |
| F5.4 gauge | `g = [[c − ts, −s], [−s + tc, c]]`; `ε = t³` | `gA₀ − A₁g = [[−tc, −c], [ts, s]] = g′`, `det g = c² − s² = 1`; `−½ε‴ = −3` | as stated | none |
| F6.2 Katz candidates | `e₀ = (1, t)`, `e₁ = (−t⁻¹, 0)`, `a = 0, 1` | `det(e₀, e₁) = 1`; `a = 0`: `0`; `a = 1`: `(t⁻¹, 1)`, with `(−t⁻², 0)` of determinant `t⁻²` | as stated | none |
| F6.3 conventions | `r = −1, −2`; `(g⁻¹, 1)` | `t∂ ∈ Lie Aut⁰ ∖ Lie Aut⁺`, `t²∂` in both; first component `t^(−r)(g⁻¹Ag − (g⁻¹)′g) = t^(−r)gauge(g⁻¹, A)` | as stated; FZ Lemma 10 and its semisimplicity caveat verified | none |
| F6.4 | `A = 0`, `r = −2`; `t^λ`; `exp(t⁻³x)` | `gauge(t^(−λ), 0) = λt⁻¹`, order `−1`; `gauge(exp(−t⁻³x), 0) = −3t⁻⁴x`, order `−4` | as stated | none |
| F6.5 | `p = 0`, `M = ℤ`; `p = 2` | `0¹·m = 0`; `H²(ẑ, ℤ) ≃ ℚ/ℤ`; `2ᵏ·1 ≠ 0` | repaired Check correct | none |
| F7.1 cotangent algebroid | `{x, y} = 1`; `{x, y} = x`; `k[x, y]/(x², y²)` | `anchor(dx) = ∂_y`, `anchor(dy) = −∂_x`, `[dx, x dy] = 0`; `[dx, dy] = dx`; `{x², y} = 2x ≠ 0` | as stated; Huebschmann (3.8.1) agrees | none |
| F7.2 signs | rank one `x = tᵐ`, `y = tⁿ` | `{H_(tᵐ), H_(tⁿ)} = −Res(tᵐ n tⁿ⁻¹dt) = −nδ_(m+n,0)` | as stated; freeness locator slip | R02 |
| F7.3 Virasoro | `P_q = 2q∂ + q′ − ½∂³`; `m = 2`, `n = −2` | cubic term `−½(m+1)m(m−1)t^(m−2)`, residue `−½(m³ − m)`; `{L₂, L₋₂} = 4L₀ − 3`; `c = −6` | as stated; no locator | R02 |
| F7.4 | `L_n = q_(−n−2)` | `L_n ∈ I ⟺ n ≥ −1`; `{L₂, L₋₂}|_(Op(D)) = −3`; `{L₋₁, L₋₂} = q₁ ∉ I` | as stated | none |
| F7.5 Miura | `[[−u, 0], [1, u]]`; `[[1, εx], [0, 1]]` | `q = u² − u′`; `(∂ − u)(∂ + u)f = f″ + (u′ − u²)f`; variation `[[−u + εx, 2uεx − εx′], [1, u − εx]]`, `x′ = 2ux`, `δ(u² − u′) = 0` | as stated | none |
| F8.2 | `𝔰𝔩₂`; `ε, η` | class of `αh + βe` is `(β + α′)e`; `(1 − ηy)(1 − εx)(1 + ηy)(1 + εx) = 1 − εη[x, y]`; `[F_e, F_f] = −F_h` | as stated; FG's anchor is `+∇`, the sign convention is stated | none |
| F8.3 | `𝔾_m`, `a, b ∈ ℂ[[t]]` | `g′/g = nt⁻¹ + u′/u ∈ ℂ[[t]] ⟺ n = 0` | as stated | none |
| F8.4 | rank one | `κ₀∨(α, α) = κ₀(h, h) = 2`; central term `−½(m³ − m)` | as stated; no locator | R02 |

## Not verifiable

- Kazhdan–Lusztig 1980 §2 and 1988 §4, Lemmas 6 and 8: no legal copy; cited through Frenkel–Zhu line 230, which attributes `[X] ≠ 0` to 1988 §4 Lemma 6.
- Chevalley 1955; Matsushima 1960; Drinfeld–Sokolov 1985: cited by locator only.
- Česnavičius–Fedorov Theorem 4.2: read only as restated in Česnavičius Theorem 16.
- Frenkel §3.5.7, p. 97 (the two square roots of `ω`) and the Stacks tags of §2.2: verified in the previous review, not re-read.
- Kostant's full paper in the American Journal of Mathematics: not read; the Bulletin announcement was.

## Source issues

- **Misprint** in Drinfeld2006 at Lemma 3.9(i), p. 11 (line 479): the source says `Tⁿ` tends to zero as `n` tends to zero; it should be as `n` tends to infinity, as its own gloss says; affects nothing.
- **Misprint** in FrenkelGaitsgory2006 at equation (4.3), p. 38 (line 1792): the source twists `𝔤/𝔫` by the `G`-bundle `F_G`; `𝔤/𝔫` is only a `B`-module, so it should be `F_B`; affects nothing.
