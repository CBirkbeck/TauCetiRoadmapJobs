# Review of ClassicalGroupsPartII (pull request #1492 at e211c63)

**Verdict:** needs changes

This is a full review of the folder at e211c63, which changed `README.md` by 193 lines since the previous review (e26957b); `Suggested.lean` and `metadata.toml` are unchanged. The gate passes at this head, the dependency check shows 0 problems, `Suggested.lean` elaborates with the three `sorry` warnings only, every newly cited Tau Ceti declaration exists at the pin at the file and line the README gives, and every computed check in the adversarial table holds.

The previous review's R01 and R02 are repaired. One P3 remains, carried from the previous review's R03: the pull-request description still misstates the open suppliers. It concerns the description only; the roadmap folder itself has no finding.

## R01 (P3) — The pull-request description still lists no open suppliers and omits the other author in the chain

**Location.** The pull-request description (`scratch/pull-request.md`, quoted by the worker), Dependencies paragraph: “In open pull requests of ours: none. Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite.” Merge-order paragraph: “Pull requests by other authors in this chain: Paul-Lez, mycaule.”

**Claim.** Both sentences are false for this head. The README consumes ArithmeticGaloisRepresentations §7.3 (open at #856) and PELModuli §§M0.5–M0.8 (open at #966), both by this author, as prerequisites (`TauCetiRoadmap/ClassicalGroupsPartII/README.md:82–106, 359–392, 493–510`), and the description's own depends-on block lists exactly #856, #966 and #1192. The chain lists #1192 (ClassicalGroups) without an author tag, but the open-pull-request index attributes #1192 to kim-em, so the list of other authors in the chain omits kim-em.

**Witness.** `roadmaps list`: “#856 ArithmeticGaloisRepresentations (new) @CBirkbeck 00e8930”, “#966 PELModuli (new) @CBirkbeck 697b514”, “#1192 ClassicalGroups @kim-em 47ca68e”. `README.md:538–543` (CG.0.2 *Needs*): “ArithmeticGaloisRepresentations §7.3 for `SimilitudeGroup.GSp` over Q; PELModuli §M0.5 … §M0.8 for connected reductivity over Q”.

**Exact repair.** Edit the description only; no file in the folder changes.
- Replace the Dependencies sentences with: “Open suppliers: ArithmeticGaloisRepresentations (#856) §7.3; PELModuli (#966) §§M0.5–M0.8; the ClassicalGroups revision (#1192) §§3A.1–3A.3. Everything else the README names is on main or is a consumer.”
- Replace “Pull requests by other authors in this chain: Paul-Lez, mycaule.” with “Pull requests by other authors in this chain: Paul-Lez, mycaule, and kim-em (#1192, the ClassicalGroups revision that defines Layer 3A).”

Tested: the depends-on block already lists exactly #856, #966 and #1192, and the merge order already places #1192 immediately before this pull request, so the replacement sentences agree with the rest of the description.

## Previous findings

- **R01 (general group-scheme and K₀ results restated or credited to ReductiveGroups) — repaired.** The “From Tau Ceti” table now has rows for `TauCeti.CommHopfAlgCat.isIso_kernelFppfQuotientHom`/`kernelFppfQuotientIso`, `isColimitFppfQuotientCokernel`, `IsCentralIsogeny`, `TauCeti.reductiveCommHopfAlgProperty`, `TauCeti.HopfIdeal.IsMaximalTorus`, `TauCeti.ExactStructure.abelian`/`TauCeti.ExactK0.fromSplitEquiv`, `TauCeti.Coalgebra.isLinearlyReductive_iff_forall_nonempty_splitting`, `TauCeti.GeneralLinear.corestrictStandardComodule`/`standardCoact_apply_basisFun`, `TauCeti.Comodule.basePointsRepresentation`/`_mem`, `Submodule.stabilizerHopfIdeal`/`_eq_bot_iff`/`_le_ker_iff` and `TauCeti.fgPointRepresentationCategoryEquivalence` (`README.md:212–226`). CG.0.2 (`README.md:487–492, 513–528`) now proves the coordinate map of π finite, faithfully flat and finitely presented through the presentation O(Sp₂g×G_m)≃O_g(K)[C]/(C²−s) and cites the fppf first isomorphism theorem and the central-isogeny predicate; CG.1.1 (`README.md:788–795, 814`) cites the split-to-exact comparison with its splitting hypothesis; CG.1.2 (`README.md:838–846, 885–896`) defines V as the corestricted standard comodule and runs the point criterion through the stabilizer Hopf ideal; the gap text (`README.md:289–297`) descends along the cokernel and the first isomorphism theorem. The previous review suggested `ExactK0.fromSplitRingEquiv`; the author cites the additive `fromSplitEquiv` and keeps the ring structure of `SplitK0`, which is consistent with the README's use.
- **R02 (the t=1 torus, root and Weyl comparisons ignore the native Sp diagonal torus) — repaired.** CG.0.4 (`README.md:606–620, 628, 634–637`) states the Hopf-level comparison of the torus coordinate map after t↦1 with `TauCeti.Symplectic.diagonalTorusCoordinateMap`, matches roots and base with `diagonalRootDatum`/`diagonalRootBase`, and keeps §3A.1 only for the complex Borel subgroup and dominant chamber. CG.0.5 (`README.md:648–662, 672`) identifies N(T)(K)/T(K) with the Sp normalizer quotient and cites `diagonalNormalizerQuotientMulEquivWreathProduct` and `diagonalWreathProductMulEquivWeylGroup`. Both carry new discriminating Checks (`README.md:635–636, 710`).
- **R03 (description calls every chain member “ours” and lists no open suppliers) — partly repaired.** “Every pull request in this chain is ours” is gone; the Dependencies sentence is unchanged and the new author list omits kim-em. Carried as R01 above.

## Verified sound

**Gate, order and build.**
- Gate rerun at e211c63 (`gate ClassicalGroupsPartII --base origin/main`): `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's gate additionally records `build=0`.
- Dependency check with `--movable`: `depcheck: 237 roadmaps, 2310 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Merge order: ArithmeticGaloisRepresentations line 58, PELModuli line 115, ClassicalGroupsPartII line 199; ReductiveGroups and ClassicalGroups are on main (db5e748).
- `git diff --stat origin/main...HEAD` outside the folder: empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml` (`topic = "math.RT"`).
- `lake env lean TauCetiRoadmap/ClassicalGroupsPartII/Suggested.lean`: exit 0 in 35 s, warnings only at lines 109, 130, 136 (`declaration uses sorry`).
- A scratch copy with `#check @name` for all 21 declarations elaborated; each type equals its README statement (`fullInvariantPresentation` for every natural g; `mem_positiveSubring` and `positiveInvariantPresentation` with `0 < g`). There is no `variable` block, so no binder can be lost. Nothing changed.

**Headlines and padding.**
- README headlines: the full invariant presentation (CG.2.4), the support criterion (CG.3.1) and the positive invariant presentation (CG.3.2) are stated; the central isogeny and reductivity (CG.0.2), primitive decomposition (CG.1.5), rational Cartan models (CG.1.7–CG.1.8), scalar-extension ring equivalence (CG.1.9), rational character isomorphism (CG.2.6), tensor occurrence (CG.3.4), tensor-character isomorphism (CG.3.5) and localization (CG.3.6) are named in the module docstring as not statable, with the missing carrier (the GSp coordinate Hopf algebra). The pins have no similitude group: case-sensitive `GSp`/`imilitude` finds nothing in Tau Ceti a91d3aa; Mathlib 6b7abb3 has only `Matrix.symplecticGroup`.
- One-tactic probe on a scratch copy, each `sorry` replaced by `first | rfl | simp | infer_instance | trivial | decide | omega`: all three theorems fail (unsolved goals or `omega` counterexample), so none is padding. The 18 definitions are each used by a stated theorem.

**Library declarations opened at the pins** (Tau Ceti a91d3aa; paths under `TauCeti/`):
- `CommHopfAlgCat.isIso_kernelFppfQuotientHom` (`Algebra/AlgebraicGroup/Fppf/Quotient/Kernel.lean:166`), hypotheses `FaithfullyFlat` and `FinitePresentation` of the coordinate ring map; `kernelFppfQuotientIso` (:222), `fppfQuotientSheaf K (kernelHopfIdeal f) ≅ pointsFppfGroupObject H`.
- `CommHopfAlgCat.isColimitFppfQuotientCokernel` (`Fppf/Quotient/Cokernel.lean:66`): `IsColimit (fppfQuotientCokernelCofork H I hI)` in group objects of fppf sheaves.
- `CommHopfAlgCat.IsIsogeny`/`IsCentralIsogeny` (`Isogeny/Basic.lean:69, 77`): `Finite ∧ FaithfullyFlat`, and `(kernelHopfIdeal f).IsCentral`.
- `reductiveCommHopfAlgProperty` (`Reductive/Basic.lean:70`) with `reductiveCommHopfAlgProperty_iff` (:77): smooth, geometrically connected, no nontrivial connected normal smooth unipotent closed subgroup over the algebraic closure; its docstring names it the Layer 6 definition target of ReductiveGroups.
- `HopfIdeal.IsMaximalTorus` (`Torus/Maximal.lean:50`): `Minimal` among Hopf ideals with torus quotient, for finite-type H over a field.
- `ExactStructure.abelian` (`CategoryTheory/Exact/Abelian.lean:123`; conflations are `ShortExact`, :71); `ExactK0.fromSplitEquiv` (`CategoryTheory/GrothendieckGroup/Exact.lean:625`) in the context `[Preadditive C] [HasZeroObject C] [HasBinaryBiproducts C]` (:155) with hypothesis `E.Conflation S → Nonempty S.Splitting`, and `fromSplitEquiv_apply`, `fromSplit_of` (:583, 639); `SplitK0` (`Split.lean:114`) needs `EssentiallySmall`.
- `instance : Abelian (FGComoduleCat R C)` (`Algebra/Coalgebra/Comodule/Finite/Abelian.lean:68`) under `[IsNoetherianRing R] [Module.Flat R C]`.
- `Coalgebra.isLinearlyReductive_iff_forall_nonempty_splitting` (`Finite/LinearlyReductive.lean:123`): `IsLinearlyReductive.{u,v,u} k C ↔ ∀ S : ShortComplex (FGComoduleCat.{u,v,u} k C), S.ShortExact → Nonempty S.Splitting`; `IsLinearlyReductive` (`Comodule/LinearlyReductive.lean:227`) is complete reducibility of every finite comodule.
- `GeneralLinear.corestrictStandardComodule` (`GeneralLinear/StandardComodule.lean:187`), along `f : coordinateHopfAlgebra R n →ₐc[R] H`; `standardCoact_apply_basisFun` (:74): e_j ↦ Σ_i e_i ⊗ x_ij.
- `Comodule.basePointsRepresentation` (`Representation/PointsAction.lean:90`), `basePointsRepresentation_apply` (:99), `_mem` (:108).
- `Submodule.stabilizerHopfIdeal` (`Representation/Stabilizer.lean:188`, over a field, :67), `_eq_bot_iff` (:233: zero iff every coaction of W lands in W⊗H), `_le_ker_iff` (:273: ideal ≤ ker g iff g maps A⊗W onto itself).
- `fgPointRepresentationCategoryEquivalence` (`Representation/Comodule/Equivalence.lean:231`): `FGPointRepresentationCat R H ≌ FGComoduleCat R H`.
- `Symplectic.diagonalTorusCoordinateMap` (`Symplectic/DiagonalTorus/Basic.lean:186`) to `MonoidAlgebra R (Multiplicative (ULift (Fin m) →₀ ℤ))`; `diagonalTorusPoints` (:82) through `GLSymplecticFin.diagonal`, whose second block is `(t i)⁻¹` (`LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/Diagonal/Basic.lean:95`); `diagonalTorus` (:406).
- `Symplectic.isMaximalTorus_diagonalTorusDefiningIdeal` (`Maximal.lean:189`, every field).
- `Symplectic.diagonalRootDatum` (`RootDatum.lean:257`, type C_m), `diagonalRootBase` (`Base.lean:225`): support e_i−e_(i+1), 2e_(m−1); positive long roots 2e_i and e_i−e_j for i<j (:233–245).
- `Symplectic.diagonalWreathProductMulEquivWeylGroup` (`WeylGroup.lean:264`); `GLSymplecticFin.diagonalNormalizerQuotientMulEquivWreathProduct` (`…/Symplectic/Diagonal/WeylGroup.lean:250`) with `(u : kˣ) (hu : u ≠ u⁻¹)` (:99), on `Subgroup.normalizerQuotient (diagonalTorus k m)`, the range of `diagonal` (`Diagonal/Basic.lean:136`).
- Carried from the previous rounds and unchanged: `FGComoduleCat`, `SplitK0.of/liftRingHom/of_mul_of/mapRingHom`, `DiagonalizableGroup.weightSpace` family, `Comodule.baseChange`, `matrixCoefficientSubcoalgebra`, `Symplectic.coordinateHopfAlgebra`, `GeneralLinear.coordinateHopfAlgebra`, `char_extPowerRep_diagonal`, `Comodule.Hom.ker/ker_finite`, `Comodule.exteriorPower` family, `Matrix.transpose_mul_J_mul_eq_det_smul`, `JFin`, the three Weyl elements, `repRing`, `smoothCommHopfAlgProperty_of_charZero`, `HopfAlgebra.isReduced_of_charZero`; Mathlib `Matrix.GeneralLinearGroup`, `MonoidAlgebra.domCongr`, `LaurentPolynomial.T`, `MvPolynomial.esymmAlgEquiv`.
- Each table row's hypotheses agree with the pinned statement. The native declarations were read in source; their object files were not elaborated.

**Declared gaps.** The three slugs in `design/plan.json` (`generated-vector-base-change`, `central-quotient-representations`, `finite-comodule-category`) match the README (`README.md:258, 278, 304`), each names ReductiveGroups Layer 1 or Layer 3, each `needs` sentence is one precise statement, and none is already provided: `Subcomodule` has no least-generated construction at the pin, no native central-quotient representation descent exists, and `FGComoduleCat` has no native `EssentiallySmall`, `MonoidalPreadditive` or linear structure.

**Cross-roadmap citations resolved.**
- ArithmeticGaloisRepresentations at #856 head 00e8930: `### 7.3 Similitude groups` (line 4614) with `SimilitudeGroup.groupScheme`, `multiplier`, `GSp` (4617–4619).
- PELModuli at #966 head 697b514: §M0.5 (631) with `IntegralPELDatum.siegel` (663, Gram matrix −`Matrix.J`); §M0.6 (683) with `toRational` (691, faithful rationalized action); §M0.7 (713) with `PELDatum.similitudeGroup`, `RationalPELDatum.coordinate`, `coordinatePoints` (725–726); §M0.8 (766) with `similitudeGroupStructure` and `_siegel` (768, 784).
- ClassicalGroups revision #1192 head 47ca68e: §3A.1 (659; Sp torus diag(t,t⁻¹), Borel [[A,B],[0,(Aᵀ)⁻¹]], positive roots ε_i−ε_j, ε_i+ε_j, 2ε_i), §3A.2 (750), §3A.3 (802; commutator (r−k)·id, surjectivity for k≤r+1, kernel of highest weight ω_k and dimension binom(2r,k)−binom(2r,k−2), U(g)-generated Cartan component); its scope (52–57) assigns the GSp forms to this roadmap. The description names #1192, so the §3A citations are in order under the overlap rule.
- ClassicalGroups main: Layers 0 (175), 1 (200), 2 (216), 4 (272). ReductiveGroups main: Layers 0 (129), 1 (176), 3 (234, fppf sheaf quotient, representability a theorem with hypotheses), 6 (466, reductive ⇔ linearly reductive in characteristic 0), 7 (627), 7C (652), §10A (1733), §10B (1759).
- `roadmaps grep 'GSp'` over the open heads: no second owner of a GSp representation or character ring; #1547 consumes §CG.2.6 (its line 195) and #1192 names this roadmap as the owner of the GSp rings (its line 55).
- `scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped, no dropped id of ours is cited elsewhere.

**Sources: the seeded sample.** All locators were read in the cached texts (page markers are PDF pages; Milne's printed page is the PDF page minus 11).
- *Construction and proof* of CG.0.2: `milne line 16462–16464` (Proposition 19.13, printed p.400: reductivity of a group variety is invariant under field extension); `yu line 3745–3756` (Remark 7.1.1, p.64). CG.0.4: `milne line 19149–19153` (Summary 21.98, p.461: base ε_i−ε_(i+1), 2ε_n) and `milne line 19291–19319` (Theorem 22.2, 22.3–22.6, pp.464–465). The gap text and CG.0.6: `milne line 4370–4394` (Lemma 5.9, Proposition 5.10, p.100), `4517–4527` (Proposition 5.21, p.104), `19367–19371` (22.12, p.466: a simple V(λ) of G′ factors through a central isogeny iff λ∈X(T)). CG.1.2: `milne line 15761–15765` (Theorem 17.93(a), p.382), `4245–4249` (Proposition 4.32, p.96). CG.1.5–CG.1.6: `milne line 4256–4260` (Corollary 4.34), `4281–4287` (Exercise 4-4(a),(b), p.97); `sternberg line 5039–5059, 5141–5152` (§7.9, pp.131–133). CG.1.8: `milne line 19813–19815` (Lemma 22.39, p.477: semisimplicity descends from k̄) and `19859–19863` (Theorem 22.42, p.478: connected G in characteristic 0 is reductive iff every finite-dimensional representation is semisimple). CG.2.4 and CG.3.2: `yu line 3766–3770`.
- *Consequences to check* of CG.0.1: `yu line 3746–3755` (hJᵗh=zJ with J=[[0,I],[−I,0]]). CG.0.3, CG.0.4, CG.0.5, CG.1.3, CG.1.4, CG.2.3, CG.3.1, CG.3.6: `yu line 3731–3739` (the ring, the reciprocal substitutions and (7.1.1)); their values are in the table. The README flags no locator as unverified.

**Adversarial table.** Rows marked (new) were computed this round with exact integer scripts (Laurent group algebra as a dictionary; exterior algebra on e₁…e_g,f₁…f_g with J=[[0,I],[−I,0]]). Rows on text unchanged since round 8 were recomputed where the script covers them.

| Statement (line) | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| (new) CG.0.2 presentation O(Sp₂g×G_m)≃O_g(K)[C]/(C²−s) (513–522) | both composites; the c²a variant; g=1 | on O_g[C]: x_ab↦c·a_ab↦C·C⁻¹x_ab=x_ab, s↦c²↦C²=s, C↦c↦C; on O(Sp×G_m): a_ab↦C⁻¹x_ab↦c⁻¹·c·a_ab=a_ab, c↦C↦c. Well defined since (ca)J(ca)ᵀ=c²J=sJ and C⁻²xJxᵀ=J. Variant: a_ab=C⁻²x_ab, C⁴=s, rank 4. g=1: a₁₁=x₁₁C/det | True; retain |
| (new) CG.0.2 Checks (530–538) | g=1 diag(2,3); 2I; kernel | hᵀJh=hJhᵀ=[[0,6],[−6,0]]=6J; (2I)J(2I)ᵀ=4J; ca=I forces c²=1 | True; retain |
| (new) CG.0.1 Check g=2 (476) | A=[[1,1],[0,1]], h=diag(A,3A⁻ᵀ) | hJhᵀ=hᵀJh=3J (lower-left block −3I, upper-right 3I). With 3A⁻¹: upper-right block [[0,3],[−3,3]]≠3I | True; retain |
| (new) CG.0.4 torus and t=1 comparison (603–620, 634–636) | D=diag(2,3), diag(5,7/5); g=1 x₂₂; g=2 simple roots | DJDᵀ=6J, 7J (t=6, t=7); x₂₂↦t z⁻¹↦z⁻¹ = native (t₀)⁻¹; (0,(1,−1))↦e₁−e₂, (−1,(0,2))↦2e₂ = base e₀−e₁, 2e₁ (0-based); e_t↦0 | True; retain |
| (new) CG.0.5 N(T)(K)/T(K) (648–662, 710) | g=1 n=[[0,1],[−1,0]], D=diag(2,3); diag(1,s); decomposition | nJnᵀ=J; nDn⁻¹=diag(3,2); diag(1,6)J diag(1,6)ᵀ=6J so diag(1,s)∈T with multiplier s; h=diag(I,sI)·(diag(I,s⁻¹I)h) with second factor of multiplier 1; kernel of the induced map = T∩Sp; order 2=|Sym(Bool)≀Sym(1)| | True; retain |
| (new) CG.0.5 Weyl relations and Checks (704–711) | g=2 transposition; g=1 flip; g=3 cycle | (−1,(2,−3))↦(−1,(−3,2))↦back; (−1,2)↦(1,−2)↦(−1,2), e_t fixed; z²↦t²/z²; σ=(1 2 3) with σ⁻¹ sends z₁↦z₂ | True; retain |
| (new) CG.0.3 pullback (569–573) | g=1,2,3, m∈[−3,3], u∈[−3,3]^g, d∈[−8,8] | (m,u)↦(u,2m+Σu) injective on 7·7^g weights; image exactly d≡Σu (mod 2) within the box | True; retain |
| (new) CG.1.1 Checks (809–812) | g=1 V⊗V; Borel of GL₂ on K² | [V⊗V]=[ν]+[Sym²V] in both K₀; K² indecomposable with unique line Ke₁, so SplitK0 (free on indecomposables by Krull–Schmidt) has [K²]≠[Ke₁]+[K²/Ke₁] while exact K₀ has equality | True; retain |
| (new) CG.1.2 point convention Check (909) | g=1 h=[[1,1],[0,1]] | columns: h e₁=e₁, h e₂=e₁+e₂; row convention gives h e₁=e₁+e₂ | True, discriminating; retain |
| (new) CG.1.2 stabilizer route (883–896) | W point-stable, A=K | g(W)⊆W and g⁻¹(W)⊆W give g(W)=W, the right side of `stabilizerHopfIdeal_le_ker_iff`; intersection of kernels of all K-points = 0 by density; then `_eq_bot_iff` | Sound; retain |
| (new) `fullInvariantPresentation` (Lean 109; CG.2.4) | g=1,2,3: 40/40/12 random ℤ-combinations of orbit sums | each reduces to a unique normal form in ℤ[t±1][F₁…F_g] and rebuilds exactly; z³+(t/z)³ ↦ X₁³−3TX₁; z²+(t/z)² ↦ X₁²−2T; x₁²−t ↦ X₁²−T | True; retain |
| (new) `positiveInvariantPresentation` and `mem_positiveSubring` (Lean 130, 136; CG.3.1–3.2) | the same samples split by cone support (11/11/2 inside, 29/29/10 outside); g=1,2,3 boxes of 63/441/3087 weights; g=0 | cone-supported ⇔ every t-exponent of the normal form ≥0, 0 exceptions; cone value ≥0 ⇔ membership in the monoid ⟨z_i,t/z_i⟩, 0 mismatches; g=0: t has cone value 1 but B₀=ℤ | True; `0<g` needed; retain |
| (new) E_k and F_k (CG.2.3, Lean 97–104) | g=0..4, k=−1..2g+1 | coefficient of U^k in ∏(1+x_iU+tU²) = e_k of the 2g letters; E_(−1)=E_(2g+1)=0, E_(2g)=t^g; Σ_j binom(g−k+2j,j)t^j e_(k−2j)(x)=E_k; aug F_k = [2],[4,5],[6,14,14],[8,27,48,42] = binom(2g,k)−binom(2g,k−2); E₂=x₁x₂+2t, F₂=x₁x₂+t at g=2 | True; retain |
| (new) CG.1.5 commutator (942–948) | g=1,2,3, every basis wedge, every k=0..2g | κ_(k+2)L_k − L_(k−2)κ_k = (g−k)·id on all wedges, including g−k<0 | True; retain |
| (new) CG.1.5 surjectivity and dimensions (938, 955–958, 974) | g=1,2,3, k=2..2g | κ_k surjective exactly for k∈{2},{2,3},{2,3,4} (k≤g+1); dim ker κ_k=5 (g=2,k=2), 14,14 (g=3,k=2,3); g=2,k=3: rank 4, kernel 0 | True; retain |
| (new) CG.2.5/CG.2.6 ch(P_k)=F_k | g=2,3, every weight space | weight-space dimension of ker κ_k equals each coefficient of F_k, and F_k has no other weights | True; retain |
| (new) CG.1.5 Checks (962–970) | g=2 basis e₁,e₂,f₁,f₂; g=1 | L₀(1)=e₁∧f₁+e₂∧f₂, κ₂L₀(1)=2; L₁(e₁)=e₁∧e₂∧f₂, κ₃L₁(e₁)=e₁; L₁(e₂)=−e₁∧e₂∧f₁, κ₃(e₁∧e₂∧f₁)=−e₂; κ₂(e₁∧f₁)=1, κ₂(f₁∧e₁)=−1; κ₄L₂(q₁)=q₁+q₂=L₀κ₂(q₁); g=1: κ₄L₂(q₁)=0, L₀κ₂(q₁)=q₁ | True; retain |
| (new) CG.0.6 Checks (727–729, 733–735) | square quotient of G_m; ε=−1 | c↦c pulls back to c↦c², −1 acts by −1 on c↦c and by +1 on c↦c²; standard Sp weight sum 1 with degree 0 gives ε^(0+1)=−1, degree 1 gives +1 | True; retain |
| (r8) Scope and §§3A.1–3A.3 transport (34–48, 318–341) | g=1..4 | κ_ours=−κ_nat and L_ours=−L_nat on every wedge; the commutator and kernels are unchanged | Retain |
| (r8) CG.1.7 orbit span = U(sp)-span = Weyl dimension | g=1 u=(2); g=2 five weights; g=3 two weights | 3; 4,5,10,16,14; 14,70 | Retain |
| (r5–r7) PELModuli and §7.3 contracts (357–392) | g=0,1 | g=0: ℚ→End(0) not injective, so no `toRational`; −`Matrix.J`=J of this roadmap | Retain |

## Not verifiable

- The pull-request description was judged from the worker's quoted copy (`scratch/pull-request.md`), not from the live page.
- The native Tau Ceti declarations were read at their pinned source lines; their object files are not built at this worker, so they were not elaborated.
- ArithmeticGaloisRepresentations (#856), PELModuli (#966) and ClassicalGroups (#1192) were read through `roadmaps show` at their heads.
- Ownership against open pull requests was checked with `roadmaps grep`, `scratch/overlaps.md` and the sibling checkouts of #1192, #1332 and #1676; no other open pull request was read in full.

## Source issues

- **Misprint** in sternberg at §7.9, printed p.131 (`sternberg line 5054`): the source subtracts binom(2n,2j−2) in the contraction-kernel dimension; it should be binom(2n,j−2), the dimension of Λ^(j−2)V; affects a stated result.
- **Misprint** in sternberg at §7.9, printed p.132 (`sternberg line 5123`): the second difference-factor product is written with numerator j; it should be j−1, since r₂−r_j changes from j−2 to j−1 (the combined product j/(j−2) that follows is right); affects the proof.
