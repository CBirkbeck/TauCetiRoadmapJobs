# Review of ClassicalGroupsPartII (pull request #1492 at e26957b)

**Verdict:** needs changes

This is a full review of the folder at e26957b. The folder is unchanged since the previous review; only the pull-request description has changed. The gate passes, the dependency check shows 0 problems, `Suggested.lean` elaborates with only the three `sorry` warnings, and every computed check in the adversarial table holds.

There are three findings, all P3; none is blocking:
- R01 and R02 come from the by-object duplication audit against the pinned Tau Ceti, which no earlier round ran on these objects. Several general theorems are credited to ReductiveGroups layers or restated, although they are already declared at the pin.
- R03 is what remains of the previous review's R01.

## R01 (P3) — General group-scheme and K₀ results that the pinned Tau Ceti already proves are restated or credited to ReductiveGroups

**Location.**
- `TauCetiRoadmap/ClassicalGroupsPartII/README.md:453–454` (CG.0.2): “identify its target as the represented fppf quotient”. The *Needs* at 494 credits “ReductiveGroups Layer 3 for fppf quotient identification”.
- `README.md:714–716` (CG.1.1), and Conventions 113–115: “its split relations agree with the exact-sequence Grothendieck relations”.
- `README.md:759` (CG.1.2): “Build the standard finite algebraic comodule V_g(K)”.
- `README.md:803–806` (CG.1.2): “Use the rational-action/comodule dictionary from ReductiveGroups Layer 1”, followed by the closed-stabilizer step.

**Claim.** Each passage is either a GSp application of a general theorem declared in Tau Ceti at the pin (a91d3aa) or a by-hand rebuild of a native construction. None of these declarations is in the “From Tau Ceti” table. ReductiveGroups Layer 3 on main only says that representability of the fppf quotient is “a theorem with hypotheses”; it does not state the first isomorphism theorem the route uses.

**Witness.** At the pinned Tau Ceti:
- `CommHopfAlgCat.isIso_kernelFppfQuotientHom` (`Fppf/Quotient/Kernel.lean:166`): the target of a faithfully flat, finitely presented homomorphism is the fppf quotient by its kernel.
- `ExactK0.fromSplitRingEquiv` (`Monoidal/Exact.lean:250`).
- `GeneralLinear.corestrictStandardComodule` (`StandardComodule.lean:187`).

**Exact repair.** Add these rows to “From Tau Ceti” and cite them at the passages above. The paths below are under `TauCeti/Algebra/AlgebraicGroup/` unless stated otherwise.
1. **CG.0.2.**
   - Cite `TauCeti.CommHopfAlgCat.isIso_kernelFppfQuotientHom` and `kernelFppfQuotientIso` (`Fppf/Quotient/Kernel.lean:166, 222`) for “identify its target as the represented fppf quotient”.
   - Cite `TauCeti.CommHopfAlgCat.IsCentralIsogeny` (`Isogeny/Basic.lean:77`) as the predicate π satisfies.
   - Keep ReductiveGroups Layer 6 for reductivity only.
   - Tested: π's coordinate map is of finite type over a field, hence finitely presented. It is faithfully flat with finite kernel μ₂, so both hypotheses of `isIso_kernelFppfQuotientHom` hold.
2. **CG.1.1 and Conventions.**
   - Cite `TauCeti.ExactK0.fromSplitRingEquiv` (`TauCeti/CategoryTheory/GrothendieckGroup/Monoidal/Exact.lean:250`). Supply its splitting hypothesis from `TauCeti.Coalgebra.isLinearlyReductive_iff_forall_nonempty_splitting` (`TauCeti/Algebra/Coalgebra/Comodule/Finite/LinearlyReductive.lean:123`), applied to the characteristic-zero linear reductivity of ReductiveGroups Layer 6.
   - Its context needs `[EssentiallySmall]` and `[MonoidalPreadditive]`, both supplied by gap:finite-comodule-category, and `(ExactStructure.abelian _).IsMonoidal`.
   - That last instance is native only for `FDRep` (`TauCeti/RepresentationTheory/GrothendieckGroup/FDRep.lean:82`). State it in CG.1.1 as a target: over a field, ⊗ is exact in each variable on finite comodules.
3. **CG.1.2.**
   - Define V_g as `TauCeti.GeneralLinear.corestrictStandardComodule` (`GeneralLinear/StandardComodule.lean:187`) along O(GL₂g)→O_g(K). Tested: its coaction sends e_j to Σ_i e_i⊗x_ij (`standardCoact_apply_basisFun`, same file), which is the README's δ(e_b)=Σ_a e_a⊗x_ab.
   - Cite `corestrictStandardComodule_mulVec_mem` (line 201) for the direction “subcomodule ⇒ point-stable”.
   - Cite `Submodule.stabilizerHopfIdeal`, `stabilizerHopfIdeal_eq_bot_iff` and `stabilizerHopfIdeal_le_ker_iff` (`Representation/Stabilizer.lean:188, 233, 273`) for the closed-stabilizer step.
   - Cite `TauCeti.fgPointRepresentationCategoryEquivalence` (`Representation/Comodule/Equivalence.lean:231`) for the rational-action/comodule dictionary, instead of ReductiveGroups Layer 1.

## R02 (P3) — The t=1 torus, root and Weyl comparisons of CG.0.4–CG.0.5 ignore the native all-ring Sp diagonal torus

**Location.**
- `README.md:557–558` (CG.0.4): “At t=1 identify its immersion with `TauCeti.GLSymplecticFin.diagonal`.”
- `README.md:564`: the restricted base is matched to “the block upper-triangular Borel subgroup of ClassicalGroups §3A.1”.
- `README.md:589–590` (CG.0.5): “identify this group with the normalizer Weyl group of the diagonal torus”.

**Claim.** CG.0.4–CG.0.5 work over every characteristic-zero K. Their Sp-side comparisons go to a matrix-level monoid map and to §3A.1, which is stated over ℂ only and exists only in an open revision. Tau Ceti already has, over every commutative ring, the scheme-level Sp diagonal torus, its maximality, its type-C root datum and base, and its Weyl group.

**Witness.** At the pin:
- `TauCeti.Symplectic.diagonalTorus` (`Symplectic/DiagonalTorus/Basic.lean:406`).
- `isMaximalTorus_diagonalTorusDefiningIdeal` (`Maximal.lean:189`).
- `diagonalRootBase` (`Base.lean:225`), whose base is e_i−e_(i+1) and 2e_(m−1).
- `diagonalWreathProductMulEquivWeylGroup` (`WeylGroup.lean:264`).

**Exact repair.**
- Add these four declarations, together with `TauCeti.Symplectic.diagonalRootDatum` (`RootDatum.lean:257`) and `TauCeti.GLSymplecticFin.diagonalNormalizerQuotientMulEquivWreathProduct` (`TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/Diagonal/WeylGroup.lean:250`), to “From Tau Ceti”.
- In CG.0.4, state the t=1 comparison at the Hopf level. The GSp torus coordinate map O_g(K)→K[X_g], followed by t↦1, equals the quotient O_g(K)→O(Sp₂g) (s=1) followed by the coordinate map of `Symplectic.diagonalTorus`. Match the restricted roots and base with `diagonalRootDatum`/`diagonalRootBase`.
- In CG.0.5, cite the two wreath-product equivalences for the Sp normalizer Weyl group.
- §3A.1 is then needed at most for the complex Borel picture.
- Tested at g=2: the restricted simple roots (0,(1,−1)) and (−1,(0,2)) give ε₁−ε₂ and 2ε₂. Under 0-based indexing these are the native base elements e₀−e₁ and 2e₁.

## R03 (P3) — Partly repaired: the description still calls every chain member “ours” and lists no open suppliers

**Location.** The pull-request description (`scratch/pull-request.md`).
- Dependencies paragraph: “In open pull requests of ours: none. … everything else named in the README is a consumer, not a prerequisite.”
- Merge-order paragraph: “Every pull request in this chain is ours.”

**Claim.** The depends-on block now lists #856, #1192 and #966, and the merge order now places #1192 before this pull request, so the previous R01's steps 1 and 2 are done, apart from the sentence that step 2 asked to replace. Two sentences are still false:
- #1192 is another author's revision, so “every pull request in this chain is ours” does not hold.
- The README consumes ArithmeticGaloisRepresentations §7.3 (#856) and PELModuli §§M0.5–M0.8 (#966). Both are open, both are by this author, and they are prerequisites, not consumers.

**Witness.** `roadmaps list` attributes #1192 ClassicalGroups (head 47ca68e) to a different author from #856, #966 and this pull request. `README.md:75–85` and 325–357 consume §7.3 and §§M0.5–M0.8.

**Exact repair.** Edit the description:
- Replace the Dependencies sentence with: “Open suppliers: ArithmeticGaloisRepresentations (#856) §7.3; PELModuli (#966) §§M0.5–M0.8; ClassicalGroups revision (#1192) §§3A.1–3A.3.”
- Replace “Every pull request in this chain is ours” with “#1192, the ClassicalGroups revision that defines Layer 3A, is by another author; the other members are ours.”

Tested: the depends-on block already lists exactly these three numbers.

## Previous findings

- **R01 (description does not name the ClassicalGroups revision) — partly repaired.**
  - Repaired: the depends-on block now reads “- [ ] #1192 ClassicalGroups”, and the merge order ends “#966 (PELModuli) → #1192 (ClassicalGroups) → **this pull request**”.
  - Not repaired: “Every pull request in this chain is ours” and “In open pull requests of ours: none … everything else named in the README is a consumer” remain. They are carried as R03.
  - Under the overlap rule, the §3A citations are now acceptable, because the description names the revision.

## Verified sound

**Gate, order and build.**
- Gate rerun at e26957b: `gate ClassicalGroupsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (exit 0). The worker's gate also records `build=0`.
- Dependency check with `--movable`: `depcheck: 239 roadmaps, 2320 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Merge order: ArithmeticGaloisRepresentations is line 58, PELModuli line 115 and ClassicalGroupsPartII line 199. ReductiveGroups and ClassicalGroups are on main (f4c75d3; their folders are identical to 60284c4).
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.RT"`).
- `lake env lean TauCetiRoadmap/ClassicalGroupsPartII/Suggested.lean` exited 0 in 18 s. Its only warnings are `declaration uses sorry` at 109, 130 and 136.
- A scratch copy with `#check @…` for all 21 declarations elaborated cleanly. Each type equals its README statement:
  - `fullInvariantPresentation : ∀ g : ℕ, ∃ e, …`, for every natural g, as CG.2.4 says.
  - `mem_positiveSubring : ∀ g, 0 < g → …` and `positiveInvariantPresentation : ∀ g, 0 < g → …`, for g≥1, as CG.3.1–CG.3.2 say.
  - There is no `variable` block, so no binder can be lost. Nothing was changed.

**Headlines and padding.**
- README headlines:
  - full invariant presentation (CG.2.4), support criterion (CG.3.1) and positive invariant presentation (CG.3.2), which are stated;
  - central isogeny and reductivity (CG.0.2), primitive decomposition (CG.1.5), rational Cartan models (CG.1.7–CG.1.8), scalar-extension ring equivalence (CG.1.9), rational character isomorphism (CG.2.6), tensor occurrence (CG.3.4), tensor-character isomorphism (CG.3.5) and localization (CG.3.6). The module docstring names all eight of these as not statable.
- The missing carrier is real. No similitude or GSp group scheme exists at either pin; the case-insensitive search hits only `algSpec`. Stating the eight with `TauCeti.repRing` of the abstract group GSp(Q) would be false: the sign of the multiplier is a non-algebraic character.
- One-tactic probes (`simp`, `aesop`) on a scratch copy fail on all three theorems.
- The 18 definitions are each used by a stated theorem. The `T(−1)` conjunct of `fullInvariantPresentation` follows from the `T 1` conjunct, as the README itself notes at 1269–1271; this is harmless.

**Library declarations opened at the pins.**
- Mathlib 6b7abb3:
  - `Matrix.GeneralLinearGroup` (`GeneralLinearGroup/Defs.lean:42`);
  - `MonoidAlgebra.domCongr` (`MonoidAlgebra/Basic.lean:302`);
  - `LaurentPolynomial` and `T` (`Polynomial/Laurent.lean:84, 155`);
  - `MvPolynomial.esymmAlgEquiv` (`Symmetric/FundamentalTheorem.lean:340`).
- Tau Ceti a91d3aa, each cited name at its stated file and line:
  - `FGComoduleCat` (`Finite/Basic.lean:96`), `instMonoidalCategory` (:161), `instBraidedCategory` (:81), `hasBinaryBiproducts` (:158);
  - `SplitK0`, `SplitK0.of` (`Split.lean:114, 124`) and `liftRingHom`, `of_mul_of`, `mapRingHom` (`Monoidal/Basic.lean:263, 179, 324`);
  - `weightSpace`, `isInternal_weightSpace`, `finite_setOf_weightSpace_ne_bot` (`Weight.lean:83, 105, 112`);
  - `Comodule.baseChange` (`BaseChange.lean:166`). Its target is a comodule, while `FGComoduleCat.scalarExtensionFunctor` lands only in `SemimoduleCat`, exactly as the README says;
  - `matrixCoefficientSubcoalgebra` and `_finite` (:53, :92);
  - `Symplectic.coordinateHopfAlgebra` (`Symplectic/Basic.lean:104`), cut out by X·JFin·Xᵀ−JFin, and `GeneralLinear.coordinateHopfAlgebra` (:479);
  - `char_extPowerRep_diagonal` (:138); `Comodule.Hom.ker` and `ker_finite` (`Comap.lean:238, 249`);
  - `Comodule.exteriorPower`, `Hom.exteriorPowerMap`, `baseChange_subtype_endOfPoint_ιMulti` (`Power.lean:73, 110, 166`);
  - `Matrix.transpose_mul_J_mul_eq_det_smul` (`SymplecticMultiplier.lean:76`);
  - `JFin` and `JFin_two_eq` (:243, :263). The latter has upper-right −I and lower-left I, so J=−JFin;
  - `GLSymplecticFin.diagonal` (:95) and the three Weyl elements (`Weyl.lean:79, 422, 428`);
  - `repRing` (:106); `smoothCommHopfAlgProperty_of_charZero` and `HopfAlgebra.isReduced_of_charZero` (`CharZero.lean:148, 166`);
  - the two highest-weight theorems of lines 60–61 (`Existence.lean:240`, `FiniteDimensional.lean:126`).
- The native declarations of R01–R02 were read at their pinned source lines. Their object files are not built, so they were not elaborated.

**Declared gaps.**
- The three slugs agree between `design/plan.json` and the README (lines 228, 248, 270), and each names ReductiveGroups Layer 1 or Layer 3.
- None is already provided:
  - No native instance gives `EssentiallySmall`, `MonoidalPreadditive`, F-linearity or finite-dimensional Hom spaces on `FGComoduleCat`.
  - `Subcomodule` has only suprema (`Subcomodule/Lattice.lean`), and `exists_finite_subcomodule_mem` (`Subcomodule/Finite.lean:144`) is existential, so it does not give the least generated subcomodule.
  - No native representation-descent equivalence exists for central quotients. The fppf quotient pieces of R01 serve its route.
- Each gap is precise.

**Cross-roadmap citations resolved.**
- ArithmeticGaloisRepresentations §7.3, at #856 head 00e8930, line 4614: `SimilitudeGroup.groupScheme`, `multiplier`, and `GSp` with J=−`Matrix.J`. Its Checks give GSp₂=GL₂ with ν=det and the multiplier-one points equal to `Matrix.symplecticGroup`.
- PELModuli at #966 head 697b514:
  - §M0.5 (631; `IntegralPELDatum.siegel` 663);
  - §M0.6 (683; `toRational` 691, which needs a faithful rationalized action);
  - §M0.7 (713; `PELDatum.similitudeGroup`, `RationalPELDatum.coordinate`, `coordinatePoints` 725–726);
  - §M0.8 (766; `similitudeGroupStructure` 768, `_siegel` 784: connected, G^der=Sp₂g simply connected, D=G_m).
  - Neither roadmap cites this one.
- ClassicalGroups revision #1192, head 47ca68e:
  - §3A.1 (658, the torus and Borel at 666–671, the dominant tuples at 737), §3A.2 (749) and §3A.3 (801–916);
  - the commutator (r−k)·id, surjectivity of κ_k for k≤r+1, the simple kernel of weight ω_k and dimension binom(2r,k)−binom(2r,k−2), and the U(g)-generated Cartan component. Its scope (52–56) assigns the GSp forms to this roadmap.
- ClassicalGroups main: Layers 0 (175), 1 (200), 2 (216; S^(1^d)V≅ΛᵈV) and 4 (272).
- ReductiveGroups main: Layers 0 (129), 1 (176), 3 (234), 6 (466; central isogenies, and reductive ⇔ linearly reductive in characteristic zero), 7 (627), 7C (652), §10A (1733) and §10B (1759; X⁺ classification, End=k, absolute simplicity, base change).
- Every anchor slug matches its heading.
- Consumers: #1547 cites CG.0.4, CG.0.5 and CG.2.6, and #1714 cites CG.0.1. All exist.
- `roadmaps grep` finds no second owner of GSp character rings among the open pull requests. ReductiveGroups revisions #1332 and #1676 contain no GSp or similitude target.

**Sources: the seeded sample.** I chose sections that the previous round did not sample.

*Construction and proof*:
- CG.0.1: `yu line 3746–3755` defines GSp₂g by h·J·ᵗh=zJ with J=[[0,I],[−I,0]], printed p.64. This is the README's equation.
- CG.0.3: `milne line 19149–19153` (Summary 21.98, printed p.461) gives roots ±2ε_i, ±ε_i±ε_j and base ε_i−ε_(i+1), 2ε_n. `milne line 19285–19290` (p.464) gives the root order λ−μ∈ΣNα and Definition 22.1.
- CG.1.2: `milne line 15761–15765` (Theorem 17.93(a), printed p.382, PDF p.393) says that for a connected group variety over a perfect field k, G(k) is dense when k is infinite. `milne line 4245–4249` (Proposition 4.32, p.96) gives the stabilizer argument.
- CG.1.6: `milne line 4256–4260` (Corollary 4.34, p.96) and `milne line 4281–4287` (Exercise 4-4(a,b), p.97): Hom base change, and isomorphism descent over infinite k.
- CG.2.4 and CG.3.2: `yu line 3766–3770`: R(GSp₂g) is polynomial in t^±1 and ΛᵏV−tΛ^(k−2)V; the tensor subring is generated by t and these.
- CG.3.1: `yu line 3731–3739`, equation (7.1.1). Yu states the support criterion for W-invariant polynomials. The README's criterion on all of B_g is strictly stronger, and its three-step proof checks (table).
- CG.3.4: `sternberg line 5024–5029` (§7.9, p.131), the Cartan product.

Gap and CG.0.2 locators:
- Milne Proposition 4.7 (`milne line 3834–3869`, p.86) is the coefficient span; (24)–(25) are `milne line 3742, 3763` (p.84).
- Lemma 5.9 and Proposition 5.10 are `milne line 4370–4392` (p.100); Proposition 5.21 is `milne line 4517–4527` (p.104).
- Complement 22.12 is `milne line 19367–19371` (p.466); Proposition 19.13 is `milne line 16462–16464` (p.400). Milne's reductive includes smooth and connected (`milne line 16441–16442`).
- Theorem 22.2 and 22.3–22.6 are `milne line 19291–19319` (pp.464–465).
- The second fundamental dimension (2n+1)(2n−2)/2=binom(2n,2)−1 is `sternberg line 5141–5149` (p.133).

*Consequences to check*: CG.0.1, CG.0.5, CG.1.3, CG.2.3, CG.2.6, CG.3.5 and CG.3.6, as rows below. The README flags no locator as unverified.

**Adversarial table.** Rows marked (new) were computed this round with exact-integer scripts on the Laurent group algebra and the exterior algebra (basis order e₁…e_g, f₁…f_g, J=[[0,I],[−I,0]]). Rows marked (r8) or (r5–r7) concern unchanged text; they are carried from those rounds with the values recorded there.

| Statement (line) | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| (new) `fullInvariantPresentation` (Lean 109; CG.2.4) | g=0,1,2,3; 30/30/12 random invariants built from orbit sums | g=0: invariants = all of ℤ[t±1], T↦t. g=1: z³+(t/z)³ reduces to x³−3tx (terms (1,t⁰,a=3), (−3,t¹,a=1)), integral. Every random invariant reduces to ℤ[t±1][F₁…F_g] and rebuilds exactly. T↦T⁻¹ sends T 1 to t⁻¹≠t | True; retain |
| (new) `mem_positiveSubring` (Lean 130; CG.3.1) | g=1,2,3, boxes m∈[−3,5], u_i∈[−3,3]; g=0 | Cone value ≥0 versus membership in the monoid ⟨z_i, t/z_i⟩: 63, 441 and 3087 weights, 0 mismatches. g=0: t has cone value 1 but B₀=ℤ | True; `0<g` needed; retain |
| (new) `positiveInvariantPresentation` (Lean 136; CG.3.2) | 40/40/15 random invariants supported in the cone; 28/27/11 outside it | Cone-supported: every t-exponent in the normal form is ≥0. Outside: some exponent is <0. g=1: z²+(t/z)² ↦ X₁²−2T | True; retain |
| (new) E_k generating function and formula (CG.2.3, 1215, 1127) | g=0..4, k=−1..2g+1 | Coefficient of U^k in ∏(1+x_iU+tU²) equals e_k of the 2g letters for every k. E_(2g)=t^g, E_(−1)=E_(2g+1)=0. Σ_j binom(g−k+2j,j)t^j e_(k−2j)(x)=E_k for 0≤k≤g. g=2: E₂=x₁x₂+2t, F₂=x₁x₂+t | True; retain |
| (new) F_k augmentations (CG.2.3, CG.2.5) | g=1..4 | aug F_k: [2]; [4,5]; [6,14,14]; [8,27,48,42]. binom(2g,k)−binom(2g,k−2) gives the same values | True; retain |
| (new) CG.2.6 consequence: ch P_k=F_k | g=2,3, every weight space | dim ker κ_k by weight equals each coefficient of F_k (k=2; k=2,3) | True; retain |
| (new) CG.1.5 commutator and surjectivity (927–931, 945) | g=1,2,3, every basis wedge, k=0..2g | [κ,L]=(g−k)·id on every wedge. κ_k surjective exactly for k∈{2}, {2,3}, {2,3,4}, i.e. up to g+1. dim ker κ_k = [5] and [14,14], matching binom | True; retain |
| (new) CG.1.5 Checks at g=2 (938–939) | L₁(e₁), L₁(e₂) | L₁(e₁)=e₁∧e₂∧f₂ and κ₃=e₁. L₁(e₂)=−e₁∧e₂∧f₁ and κ₃(e₁∧e₂∧f₁)=−e₂. Unsigned formula: +e₂ on both orderings | True, discriminating; retain |
| (new) CG.0.1 Checks (443, 441) | g=2, A=[[1,1],[0,1]]; g=0 | diag(A,3A⁻ᵀ): hJhᵀ=3J and hᵀJh=3J. With 3A⁻¹ the off-diagonal block is [[0,3],[−3,3]]≠3I. g=0: s=1 and s=2 both satisfy the equation | True; retain |
| (new) CG.0.1 consequences (446) | relation ideals; g=1 | XJXᵀ−J = −(X·JFin·Xᵀ−JFin), which is Tau Ceti's `relationMatrix_def`. g=1: XJXᵀ=det(X)J via `transpose_mul_J_mul_eq_det_smul` on Xᵀ | True; retain |
| (new) CG.0.2 (R01 touches) | kernel; c²a variant; Q-point diag(I,2I); Q[ε]; g=1 diag(2,3) | ca=I with a∈Sp gives c²=1, so μ₂ ↪ (εI,ε). c²a=I gives c⁴=1 (μ₄). diag(I,2I)J(…)ᵀ=2J needs c²=2. (1+ε/2)²=1+ε. hᵀJh=[[0,6],[−6,0]]=hJhᵀ, so s=6 | True; retain |
| (new) CG.0.3 pullback and pairing (504–507, 513) | g=1,2,3, box m∈[−3,3], d∈[−8,8] | (m,u)↦(u,2m+Σu) is injective, and its image is exactly d≡Σu (mod 2). α_g=(−1,2δ_g) pairs with u_g to 2; e_t pairs to 0 with every coroot | True; retain |
| (new) CG.0.4 (R02 touches) | g=1,2 | D=diag(z,t/z): DJDᵀ=tJ. t=6, z=2 gives diag(2,3) with det 6. At t=1 the g=2 simple roots restrict to ε₁−ε₂ and 2ε₂, the native `diagonalRootBase` | True; retain |
| (new) CG.0.5 consequences and Checks (636–642) | g=1,2,3 | Flip degree: 2(m+u_i)+Σu−2u_i=2m+Σu. g=2 swap: (−1,(2,−3))→(−1,(−3,2)). g=1 flip: (−1,2)→(1,−2)→(−1,2). g=3 cycle: z₁→z₂ with σ⁻¹ and z₁→z₃ with σ | True; retain |
| (new) CG.1.1 (R01 touches) Checks (728–730) | unit; trivial F²; maps ±2 | Hom(1,1) has dim 1. End(F²)=Mat₂, dim 4, with E₁₂E₂₁=E₁₁≠E₂₂. (2+(−2))⊗id=0=2id−2id | True; retain |
| (new) CG.1.2 (R01 touches) Checks (820–825) | g=1 big cell; F₄; 2I | u⁻(2)diag(5,7)u⁺(3)=[[5,15],[10,37]], det 35=rs. On [[α,1],[1,0]], x₁₁²−x₁₁=α²+α=1 and det=1. s−1 at 2I is 3. The native GL coaction is e_j↦Σ_i e_i⊗x_ij, matching δ(e_b) | True; retain |
| (new) CG.1.3 consequences (856, 854) | cI; ν⁻¹ | ν(2I)=4=c². ν⁻¹=(−1,0) has m<0, so by CG.3.4 it occurs in no V^⊗d | True; retain |
| (new) CG.1.6 Checks (981–983) | Q→C unit; V→ν | Hom(1,1): C⊗Q→C, dim 1 on both sides. Hom(V,ν): central degrees 1≠2, so 0 on both sides | True; retain |
| (new) CG.3.4 (1498–1509) | weights of V^⊗d; u=(2,1) | (Σb, a−b) has degree Σa+Σb=d, and m=Σb≥0. a=(1,1) gives Σk·a_k=1+2=3=Σu | True; retain |
| (new) CG.3.5 consequences and Checks (1538–1542) | g=1 Sym²V | [V]²−[ν] ↦ x²−t = z²+t+(t/z)², with coefficients 1,1,1 and cone values 0,1,0 | True; retain |
| (new) CG.3.6 consequences (1563) | g=1 | Full ring ℤ[[ν]^±1,[V]] and constituent ring ℤ[[ν],[V]]. F₁=E₁, since E₋₁=0, so there is no −t term | True; retain |
| (new) CG.3.1 superadditivity (1426–1427) | g=1 | h(0,1)+h(0,−1)=0+(−1)=−1 while h(0,0)=0, so h is not additive. The monoid test above confirms closure | True; retain |
| (r8) Scope/contract §§3A.1–3A.3 transport (34–48, 298–321) | g=1..4 | κ_ours=−κ_nat and L_ours=−L_nat on every wedge. κ₂(Σa_i∧b_i)=g | Retain |
| (r8) CG.1.7 orbit span = U(sp)-span = Weyl dimension | g=1 u=(2); g=2 five weights; g=3 two weights | 3; 4, 5, 10, 16, 14; 14, 70, equal to Weyl C_g | Retain |
| (r8) GSp(ℂ)=ℂ^×·Sp(ℂ) on tensors (1003–1005, 1019) | g=1, h=diag(2,3) | h=√6·h₀; the scalar acts by c^(Σk·a_k). n+1 in ν⊕1 spans a line under Sp and a plane under GSp | Retain |
| (r5–r7) PELModuli and §7.3 contracts (325–357) | g=0,1 | g=0: ℚ→End(0) is not injective, so there is no `toRational`. −`Matrix.J`=J₂ of §7.3 | Retain |
| (r5) CG.0.3 Checks and root order (526–545) | g=1,2 | (−1,0) has degree −2. 0≤2α₁=(−2,4); 0≤e₁ fails (degrees 0 and 1) | Retain |

## Not verifiable

- The pull-request description was judged from the worker's quoted copy (`scratch/pull-request.md`), not from the live page.
- The native Tau Ceti declarations of R01–R02 were not elaborated: their object files are not built at this worker. Their names, hypotheses and lines were read in the pinned sources, and those reads are cited above.
- ArithmeticGaloisRepresentations (#856) and PELModuli (#966) were read through `roadmaps show` at their heads. Neither has a sibling checkout in this brief.
- Ownership against open pull requests was checked with `roadmaps grep`, `scratch/overlaps.md` and the sibling checkouts of #1192, #1332 and #1676.

## Source issues

- **Misprint** in sternberg at §7.9, printed p.131 (`sternberg line 5054`): the source subtracts binom(2n,2j−2) in the contraction-kernel dimension; it should be binom(2n,j−2), the dimension of Λ^(j−2)V; affects a stated result.
- **Misprint** in sternberg at §7.9, printed p.132 (`sternberg line 5123`): the source gives numerator j in the second difference-factor product; it should be j−1, since r₂−r_j changes from j−2 to j−1; affects the proof.
