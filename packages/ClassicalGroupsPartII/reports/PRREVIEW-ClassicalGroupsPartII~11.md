# Review of ClassicalGroupsPartII (pull request #1492 at e211c63)

**Verdict:** needs changes

This head is the one the previous review read. The roadmap folder has not changed since then, and neither has the pull-request description. I re-ran every check independently: the gate, the dependency check, the elaboration, the `#check` pass, the one-tactic probe, the source locators, the library declarations and the computed adversarial table. The folder itself has no finding. One P3 remains in the pull-request description, carried from the previous review's R01 and still unrepaired.

## R01 (P3) — The pull-request description still says it has no open suppliers and leaves kim-em out of the list of other authors

**Location.** Pull-request description (as quoted by the worker), Dependencies paragraph: “In open pull requests of ours: none. Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite.” Merge-order paragraph: “Pull requests by other authors in this chain: Paul-Lez, mycaule.”

**Claim.** Both sentences are false. The README consumes two open suppliers by the same author as prerequisites: ArithmeticGaloisRepresentations §7.3 (#856) and PELModuli §§M0.5–M0.8 (#966). It also consumes ClassicalGroups §§3A.1–3A.3, which exist only at the head of #1192. That pull request is by kim-em, and the list of other authors omits kim-em. The description's own depends-on block lists #856, #1192 and #966, so the description contradicts itself.

**Witness.** `roadmaps list`: “#856 ArithmeticGaloisRepresentations (new) @CBirkbeck 00e8930”, “#966 PELModuli (new) @CBirkbeck 697b514”, “#1192 ClassicalGroups @kim-em 47ca68e”. `TauCetiRoadmap/ClassicalGroupsPartII/README.md:539–541` (CG.0.2 *Needs*): “ArithmeticGaloisRepresentations §7.3 for `SimilitudeGroup.GSp` over Q; PELModuli §M0.5 …, §M0.8 for connected reductivity over Q”.

**Exact repair.** Edit the description only; no file in the folder changes.
- Replace the two Dependencies sentences with: “Open suppliers: ArithmeticGaloisRepresentations (#856) §7.3; PELModuli (#966) §§M0.5–M0.8; the ClassicalGroups revision (#1192) §§3A.1–3A.3. Everything else the README names is on main or is a consumer.”
- Replace “Pull requests by other authors in this chain: Paul-Lez, mycaule.” with “Pull requests by other authors in this chain: Paul-Lez, mycaule, kim-em (#1192, the ClassicalGroups revision that defines Layer 3A).”

Tested against the rest of the description: the depends-on block already lists exactly #856, #1192 and #966. The merge-order chain already has #856 before #966 and #1192 immediately before this pull request, which matches the merge order (ArithmeticGaloisRepresentations line 58, PELModuli line 115, ClassicalGroupsPartII line 199).

## Previous findings

- **R01 (description misstates the open suppliers and the other authors) — not repaired.** The description quoted by the worker at this review is word-for-word the one the previous review quoted, and the head is unchanged (`scratch/changes.md`: 0 changed lines). It is carried as R01 above. No repair report marks it as not actionable.

## Verified sound

**Gate, order, build, signatures and padding**
- Gate re-run at e211c63 (`gate ClassicalGroupsPartII --base origin/main`) printed `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` and exited 0. The worker's gate also records `build=0`.
- Dependency check with `--movable`: `depcheck: 236 roadmaps, 2281 edges, 0 problem(s)`, exit 0. There is no UPWARD, CYCLE or `moved:` line.
- Merge order: ArithmeticGaloisRepresentations is at line 58, PELModuli at 115 and ClassicalGroupsPartII at 199. ReductiveGroups and ClassicalGroups are on main (623f5d6). Neither PELModuli at #966 nor ArithmeticGaloisRepresentations at #856 cites this roadmap, so there is no back edge.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.RT"`).
- `lake env lean TauCetiRoadmap/ClassicalGroupsPartII/Suggested.lean` exited 0 in 26 s. The only warnings are `declaration uses sorry` at lines 109, 130 and 136.
- I elaborated a scratch copy with `#check @name` for all 21 declarations. The file has no `variable` block, so no binder can be lost. Each elaborated type matches the README:
  - `fullInvariantPresentation : ∀ g, ∃ e, (∀ i, ↑(e (X i)) = fundamentalCharacter i) ∧ ↑(e (C (T 1))) = t g ∧ ↑(e (C (T (-1)))) = tInv g` holds for every natural g, as CG.2.4 states.
  - `mem_positiveSubring` and `positiveInvariantPresentation` carry `0 < g`, matching CG.3.1–3.2's “g≥1”.
  - `MonoidAlgebra.coeff : MonoidAlgebra R M → M →₀ R` at the pin, so `f.coeff (ofAdd wt)` is the coefficient.
  - A proved scratch `example` gave `flipWeight 0 (−1,2) = (1,−2)` at g=1.
  - Nothing needed changing.
- One-tactic probe on a scratch copy, with each `sorry` replaced by `first | rfl | simp | infer_instance | trivial | decide | omega | aesop`: line 113 failed (`aesop` made no progress), line 132 failed (unsolved goals) and line 140 failed (`aesop` made no progress). None of the three theorems is padding. All 18 definitions are used by a stated theorem.
- Headlines in the README:
  - Stated in `Suggested.lean`: the full invariant presentation (CG.2.4), the support criterion (CG.3.1) and the positive invariant presentation (CG.3.2).
  - Named in the module docstring as not statable, with the missing carrier (the GSp coordinate Hopf algebra and its finite comodules): the central isogeny and reductivity (CG.0.2), primitive decomposition (CG.1.5), the Cartan models (CG.1.7–1.8), scalar extension (CG.1.9), the rational character isomorphism (CG.2.6), tensor occurrence (CG.3.4), the tensor-character isomorphism (CG.3.5) and localization (CG.3.6).
  - Pinned Tau Ceti a91d3aa has no similitude carrier: a case-sensitive search for `Similitude|\bGSp\b|GeneralSymplectic` returns nothing, and Mathlib 6b7abb3 has only `Matrix.symplecticGroup`.

**Library declarations opened at the pin** (Tau Ceti a91d3aa, paths under `TauCeti/`; each at the line the README gives, with matching hypotheses)
- `CommHopfAlgCat.isIso_kernelFppfQuotientHom` (`Algebra/AlgebraicGroup/Fppf/Quotient/Kernel.lean:166`, hypotheses `FaithfullyFlat` and `FinitePresentation`) and `kernelFppfQuotientIso` (:222).
- `isColimitFppfQuotientCokernel` (`Fppf/Quotient/Cokernel.lean:66`).
- `IsIsogeny`/`IsCentralIsogeny` (`Isogeny/Basic.lean:69, 77`: `Finite ∧ FaithfullyFlat`, plus a central kernel Hopf ideal).
- `reductiveCommHopfAlgProperty` (`Reductive/Basic.lean:70`) and `HopfIdeal.IsMaximalTorus` (`Torus/Maximal.lean:50`).
- `ExactStructure.abelian` (`CategoryTheory/Exact/Abelian.lean:123`).
- `ExactK0.fromSplitEquiv` (`CategoryTheory/GrothendieckGroup/Exact.lean:625`), in context `[Preadditive C] [HasZeroObject C] [HasBinaryBiproducts C] [EssentiallySmall C]` (:155), with hypothesis `E.Conflation S → Nonempty S.Splitting`.
- `Abelian (FGComoduleCat R C)` (`Comodule/Finite/Abelian.lean:68`).
- `Coalgebra.isLinearlyReductive_iff_forall_nonempty_splitting` (`Finite/LinearlyReductive.lean:123`, universes `{u,v,u}`).
- `GeneralLinear.corestrictStandardComodule` (:187) and `standardCoact_apply_basisFun` (:74).
- `Comodule.basePointsRepresentation` (:90) and `_mem` (:108).
- `Submodule.stabilizerHopfIdeal` (:188), `_eq_bot_iff` (:233) and `_le_ker_iff` (:273: an A-point carries A⊗W onto itself).
- `fgPointRepresentationCategoryEquivalence` (:231).
- Sp diagonal torus:
  - `Symplectic.diagonalTorusCoordinateMap` (:186), `diagonalTorus` (:406) and `isMaximalTorus_diagonalTorusDefiningIdeal` (`Maximal.lean:189`).
  - `diagonalRootDatum` (`RootDatum.lean:257`) and `diagonalRootBase` (`Base.lean:225`).
  - `diagonalWreathProductMulEquivWeylGroup` (`WeylGroup.lean:264`).
  - `GLSymplecticFin.diagonalNormalizerQuotientMulEquivWreathProduct` (`…/Symplectic/Diagonal/WeylGroup.lean:250`, with `(u : kˣ) (hu : u ≠ u⁻¹)`).
  - `GLSymplecticFin.diagonal` (:95), `JFin`/`JFin_two_eq` (:243/:263; `JFin 2` has upper-right block −I) and the three Weyl elements (`Weyl.lean:79, 422, 428`).
- Other cited declarations:
  - `repRing` (`RepresentationRing/Basic.lean:106`).
  - `smoothCommHopfAlgProperty_of_charZero` and `HopfAlgebra.isReduced_of_charZero` (`Smooth/CharZero.lean:148, 166`).
  - `Comodule.exteriorPower`, `Hom.exteriorPowerMap` and `baseChange_subtype_endOfPoint_ιMulti` (`ExteriorAlgebra/Power.lean:73, 110, 166`).
- The README's remark that the finite scalar-extension functor lands in `SemimoduleCat` is correct: `FGComoduleCat.scalarExtensionFunctor : FGComoduleCat R C ⥤ SemimoduleCat A` (`Comodule/Finite/ScalarExtension/Basic.lean:54`).
- Duplication by object. Tau Ceti's `Subcomodule/PointSeparation.lean` tests geometric points over an algebraically closed field, whereas CG.1.2's criterion uses rational points plus density, so it is not a restatement. Tau Ceti's `Symplectic.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra` (`Symplectic/Reductive.lean:102`) concerns Sp, and the README does not restate it. `Reductive/LinearlyReductive.lean:337` proves only linearly reductive ⇒ reductive, so citing ReductiveGroups Layer 6 for the characteristic-zero converse is correct.
- Mathlib 6b7abb3: `MonoidAlgebra.domCongr`, `LaurentPolynomial.T`, `MvPolynomial.esymmAlgEquiv` and `Matrix.GeneralLinearGroup`, as cited.

**Declared gaps**
- The three slugs in `design/plan.json` match the README at lines 258, 278 and 304, and each names ReductiveGroups Layer 1 or Layer 3.
- None is already provided at the pin:
  - `Subcomodule` has suprema only (`Subcomodule/Lattice.lean:149`) and `exists_finite_subcomodule_mem` (`Subcomodule/Finite.lean:144`), but no least generated subcomodule.
  - No `EssentiallySmall`, `MonoidalPreadditive` or `Linear` instance exists on `FGComoduleCat`.
  - No central-quotient representation descent exists.
- `roadmaps grep` over the open heads finds no other planned least generated subcomodule.

**Cross-roadmap citations resolved**
- ClassicalGroups at #1192 head 47ca68e (`RepresentationTheory/ClassicalGroups/README.md`):
  - §3A.1 (line 658): torus diag(t,t⁻¹), Borel [[A,B],[0,(Aᵀ)⁻¹]], positive roots ε_i±ε_j and 2ε_i.
  - §3A.2 (749).
  - §3A.3 (801): native ω(f_i,e_j)=δ_ij, Ω_J=Σf_i∧e_i, commutator (r−k)·id for every k≥0, surjectivity for k≤r+1, kernels simple of highest weight ω_k with dimension binom(2r,k)−binom(2r,k−2), and the U(g)-generated Cartan component.
  - Its scope (lines 52–56) assigns the GSp theory to this roadmap.
  - The description names #1192 in its depends-on and merge-order blocks, so the overlap rule is met for the six §3A ids that `scratch/overlaps.md` lists.
- ClassicalGroups on main: Layers 0, 1, 2 and 4 at lines 175, 200, 216 and 272. The README's anchors match these headings.
- ReductiveGroups on main:
  - Layers 0 (129), 1 (176), 3 (234) and 6 (466; characteristic-zero reductive ⇔ linearly reductive).
  - Layer 7 (627) and its `#### Layer 7C` (652; all-field rank-one charts and Bruhat cell coordinates).
  - §10A (1733, “The rational category and actual torus lattice”) and §10B (1759, “Induction, Weyl modules and simple heads”: classification by X⁺, absolute simplicity, End=k, field base change).
- ArithmeticGaloisRepresentations at #856, §7.3 (line 4614): `SimilitudeGroup.groupScheme` with points gᵀJg=νJ, `SimilitudeGroup.multiplier`, and `SimilitudeGroup.GSp` for (0 1;−1 0)=−`Matrix.J`. Its Checks: GSp₂=GL₂ with ν=det, and Sp is `Matrix.symplecticGroup`.
- PELModuli at #966:
  - §M0.5 (631): `IntegralPELDatum.siegel` with Gram matrix −`Matrix.J`.
  - §M0.6 (683): `toRational` for a faithful action.
  - §M0.7 (713): `PELDatum.similitudeGroup`, `RationalPELDatum.coordinate` and `coordinatePoints`.
  - §M0.8 (766): `similitudeGroupStructure` (Case C connected reductive) and `_siegel`.
- These five names are the leads in `scratch/citations.md`; all are other roadmaps' names, not library names.
- Ownership: no open head plans GSp highest-weight representations or GSp character rings (searched with `roadmaps grep`, and in #1817, #1822, #1746 and #1714). CountingBundlesAndHallAlgebrasOfCurves (#1547: CG.0.4, CG.0.5, CG.2.4–2.6) and SiegelModularForms (#1714: CG.0.1) consume this roadmap, and the ids they cite exist here. `scratch/overlaps.md` lists no other pull request that changes this roadmap and no dropped id.

**Sources: the seeded sample** (all read in the cached texts; Milne's printed page is the PDF page minus 11)
- *Construction and proof* locators:
  - `yu line 3745–3770`: Remark 7.1.1, printed p.64; GSp defined by hJᵗh=zJ with J=(0 I;−I 0), R(GSp)≅ℤ[t±,z±]^W, polynomial in t± and ∧ᵏV−t∧ᵏ⁻²V, and the tensor-power subring.
  - `milne line 16462–16463`: Proposition 19.13, p.400. Milne's “reductive” includes connectedness (`milne line 5731–5734`).
  - `milne line 15761–15765`: Theorem 17.93(a), p.382, G(k) dense for k perfect and infinite.
  - `milne line 4245–4249`: Proposition 4.32, p.96, the stabilizer argument.
  - `milne line 4256–4259`: Corollary 4.34.
  - `milne line 4281–4287`: Exercise 4-4(a,b), p.97.
  - `milne line 3834–3850`: Proposition 4.7 in §4c, p.86.
  - `milne line 3742, 3763`: coaction identities (24)–(25), p.84.
  - `milne line 4370–4394`: Lemma 5.9 and Proposition 5.10 in §5b, p.100.
  - `milne line 4517–4527`: Proposition 5.21 in §5c, p.104.
  - `milne line 19149–19153`: Summary 21.98, p.461.
  - `milne line 19287–19319`: the root order before Definition 22.1, Theorem 22.2 and 22.3–22.6, pp.464–465.
  - `milne line 19367–19371`: 22.12, p.466.
  - `milne line 19813–19815`: Lemma 22.39, p.477.
  - `milne line 19859–19863`: Theorem 22.42, p.478.
  - `sternberg line 5039–5059, 5112–5152`: §7.9, pp.131–133.
- *Consequences to check*, each computed:
  - CG.0.1: the s=1 fibre is the native Sp quotient (entries of XJXᵀ−J are the negatives of those for JFin), and at g=1 the multiplier is det.
  - CG.0.3: d(e_t)=2, d(e_i)=d(e_t−e_i)=1.
  - CG.0.4: pair weights e_i and e_t−e_i.
  - CG.0.5: d(flip(m,u))=2(m+u_i)+Σu−2u_i=2m+Σu, and z↦z⁻¹ changes degree 1 to −1.
  - CG.1.3: ν(cI)=c².
  - CG.1.5 and CG.2.5: aug F₂=5 at g=2.
  - CG.2.4: e₂(x)↦X₂−T.
  - CG.3.1: t∈B_g, t⁻¹∉B_g.
  - CG.3.2: z²+(t/z)²↦X₁²−2T, 1↦1.
  - CG.3.4: g=1 occurrence; see the table.
- The README flags no locator as unverified.

**Adversarial table** (exact integer scripts in the scratch directory: the Laurent algebra as a dictionary of weights; the exterior algebra on e₁…e_g,f₁…f_g with J=[[0,I],[−I,0]])

| Statement (location) | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| `fullInvariantPresentation` (`Suggested.lean:109`; CG.2.4) | g=1,2,3: 30/30/8 random ℤ-combinations of W-orbit sums with t-exponents in [−2,2]; g=0 | Every invariant reduces by leading dominant z-exponent to a unique Σc·t^m∏F_k^a_k and rebuilds exactly. Normal forms: z²+(t/z)²→X₁²−2T, z³+(t/z)³→X₁³−3TX₁, Sym² char→X₁²−T, 1→1, and at g=2 e₂(x)→X₂−T. At g=0 the fixed ring is all of ℤ[t±] = ℤ[T±] | True; retain |
| `mem_positiveSubring` (130; CG.3.1) | g=1,2,3, all weights in [−3,3]^(g+1) (49/343/2401); g=0 | cone value ≥0 versus brute-force membership in the monoid ⟨e_i, e_t−e_i⟩: 0 mismatches. At g=0, t has cone value 1 but B₀=ℤ | True; `0<g` needed and present; retain |
| `positiveInvariantPresentation` (136; CG.3.2) | the samples above split by support (8/5/1 inside, 22/25/7 outside) | cone-supported ⇔ every t-exponent of the normal form ≥0, with 0 exceptions. At g=0, ℤ[T]≇B₀^W=ℤ | True; retain |
| `exteriorCharacter`, `fundamentalCharacter` (97–104; CG.2.3) | g=0..4, k=−1..2g+1 | coefficient of U^k = e_k of the 2g letters; E_(−1)=E_(2g+1)=0, E_(2g)=t^g; Σ_j binom(g−k+2j,j)t^j e_(k−2j)(x)=E_k; aug F_k=[2],[4,5],[6,14,14],[8,27,48,42]=binom(2g,k)−binom(2g,k−2); E₂=x₁x₂+2t, F₂=x₁x₂+t at g=2; all F_k W-invariant | True; retain |
| `flipWeight`, `permWeight`, CG.0.5 Checks (706–709) | g=1 flip; g=2 swap; g=3 cycle σ=(1 2 3) | (−1,2)↦(1,−2)↦(−1,2); (−1,(2,−3))↦(−1,(−3,2)); u∘σ⁻¹ sends z₁↦z₂, while u∘σ sends z₁↦z₃; flip z²=t²/z² | True; retain |
| `coneValue` Checks (1514–1516) | 2000 random weight pairs at g=3 | h(p+q)≥h(p)+h(q) in every case; h(0,1)+h(0,−1)=−1<h(0,0)=0 | True; retain |
| CG.0.1 Check g=2 (478) | A=[[1,1],[0,1]], h=diag(A,3A⁻ᵀ); variant 3A⁻¹ | hJhᵀ=hᵀJh=3J. Variant: upper-right block [[0,3],[−3,3]], and hᵀJh≠3J | True; retain |
| CG.0.2 presentation O(Sp×G_m)≃O_g[C]/(C²−s) (513–522) and Checks (531–536) | both composites; c²a variant; g=1 diag(2,3); ε-algebra | x↦ca↦C·C⁻¹x=x, s↦c²↦C²=s; C⁻¹=C·s⁻¹; (C⁻¹X)J(C⁻¹X)ᵀ=C⁻²sJ=J. Variant kernel {(c⁻²I,c):c⁴=1}. hᵀJh=[[0,6],[−6,0]]=6J; (1+ε/2)²=1+ε | True; retain |
| CG.0.3 pullback and parity (554–557, 576–578) | torus of Sp×G_m: (diag(s_i,s_i⁻¹),c) | t^m∏z_i^u_i ↦ ∏s_i^u_i·c^(2m+Σu); injective with image d≡Σu (mod 2); the standard Sp weight in degree 0 has Σu=1≢0 | True; retain |
| CG.0.4 torus, roots and t=1 comparison (603–637) | g=1 (t,z)=(6,2); g=2 roots | DJDᵀ=6J for D=diag(2,3); roots (0,δ_i−δ_j), (−1,δ_i+δ_j), (1,−δ_i−δ_j) restrict bijectively to ±e_i±e_j, ±2e_i; coroot (0,δ_g) pairs with (−1,2δ_g) to 2; x₂₂↦tz⁻¹↦z⁻¹ | True; retain |
| CG.0.5 normalizer quotient (648–666, 710) | g=1 n=[[0,1],[−1,0]], D=diag(2,3); diag(1,6) | nDn⁻¹=diag(3,2), nJnᵀ=J; diag(1,6)Jdiag(1,6)ᵀ=6J, so diag(1,s)∈T carries the multiplier; kernel of N_Sp/T_Sp→N/T is T∩Sp | True; retain |
| CG.0.6 Checks (735–743) | square map G_m→G_m; ε=−1 | c^n pulls back to c^(2n); −1 acts on c by −1 and on c² by +1; standard weight Σu=1 with d=1 gives ε²=1, with d=0 gives −1 | True; retain |
| CG.1.1 split vs exact K₀ Checks (806–809, 828–830) | g=1 V⊗V; GL₂ Borel on K²; 2I | (z+t/z)²=z²+2t+(t/z)² = Sym² char + t; dimensions 4=3+1; characters at 2I: 4, 1, 1/4; K² indecomposable with unique stable line | True; retain |
| CG.1.2 coaction convention, big cell, F₂ example (909–914) | h=[[1,1],[0,1]]; (a,b,r,s)=(2,3,5,7); α²+α+1=0 over F₄ | h e₁=(1,0), h e₂=(1,1) (columns); cell [[5,15],[10,37]] with det 35=rs; x₁₁²−x₁₁ at α equals α²+α=1, det=1; s−1 at 2I is 3 | True; retain |
| CG.1.4 sign Checks (989–991) | κ₂ on e₁∧f₁, f₁∧e₁; native J | +1, −1; native κ = −κ on every wedge (g=1,2,3) | True; retain |
| CG.1.5 commutator, surjectivity, kernels (999–1022, 1034) | g=1,2,3, every basis wedge, every k=0..2g | κ_(k+2)L_k−L_(k−2)κ_k=(g−k)id on all wedges, including g−k<0; κ_k surjective exactly for k∈{2}, {2,3}, {2,3,4} (k≤g+1); dim ker κ_k = 5 (g=2,k=2) and 14, 14 (g=3,k=2,3), equal to binom(2g,k)−binom(2g,k−2); e₁∧⋯∧e_k∈ker with weight (0,(1^k,0)) | True; retain |
| CG.1.5 Checks (1026–1031) | g=2 basis e₁,e₂,f₁,f₂; g=1 degree 2 | L₀(1)=e₁∧f₁+e₂∧f₂, κ₂L₀(1)=2; L₁(e₁)=e₁∧e₂∧f₂, κ₃L₁(e₁)=e₁; L₁(e₂)=−e₁∧e₂∧f₁, κ₃(e₁∧e₂∧f₁)=−e₂; κ₄L₂(q₁)=L₀κ₂(q₁)=q₁+q₂; g=1: κ₄L₂(q₁)=0, L₀κ₂(q₁)=q₁; native L = Σf_i∧e_i = −L | True; retain |
| §3A transport (Scope 34–48; contracts 340–355) | g=1,2,3 | κ_nat=−κ, L_nat=−L on every wedge, so the commutator and kernels are unchanged | True; retain |
| CG.2.5 ch(P_k)=F_k (1375) | g=2,3, every weight space of ker κ_k | the weight multiplicities of ker κ_k equal the coefficients of F_k exactly | True; retain |
| CG.3.4 exact occurrence (1587–1598) | g=1, (z+t/z)^d for d=0..6, peeled by GL₂ simple characters det^m Sym^u | d=4: (0,4)×1, (1,2)×3, (2,0)×2; d=6: (0,6)×1, (1,4)×5, (2,2)×9, (3,0)×5; every constituent has m≥0 and 2m+u=d, and every such (m,u) occurs | True; retain |
| PELModuli and §7.3 contracts (359–391) | g=0,1 | g=0: ℚ→End(0) is not injective, so there is no `toRational` and the README requires g≥1; −`Matrix.J`=[[0,I],[−I,0]] is this roadmap's J | True; retain |

## Not verifiable

- The pull-request description was judged from the worker's quoted copy (`scratch/pull-request.md`), not from the live page.
- The native Tau Ceti declarations were read in source at their pinned lines. I did not elaborate their object files separately; `Suggested.lean` imports only `Mathlib`.
- ArithmeticGaloisRepresentations (#856) and PELModuli (#966) were read through `roadmaps show` at their heads. ClassicalGroups (#1192), SiegelModularForms (#1714) and CountingBundlesAndHallAlgebrasOfCurves (#1547) were read from the sibling checkouts.
- Main now pins Tau Ceti 2fd255d, Mathlib 1b1ccf4 and Lean v4.36.0-rc2, while this branch pins a91d3aa, 6b7abb3 and v4.35.0-rc3. This review checked the branch's pins, as the brief requires. At main's pins, all 16 cited Tau Ceti names I searched for still exist, as do `MonoidAlgebra.domCongr`, `MonoidAlgebra.coeff` and `LaurentPolynomial.T`, and no GSp carrier or gap instance has appeared. I did not elaborate the file there.

## Source issues

- **Misprint** in sternberg at §7.9, printed p.131 (`sternberg line 5047–5055`): the contraction-kernel dimension subtracts binom(2n,2j−2); it should subtract binom(2n,j−2), the dimension of the target Λ^(j−2)V; affects a stated result.
- **Misprint** in sternberg at §7.9, printed p.132 (`sternberg line 5121–5124`): the second ratio product, from r₂−r_j, has numerator j; it should be j−1, since r₂−r_j moves from j−2 to j−1 (the combined product j/(j−2) printed next is right); affects the proof.
