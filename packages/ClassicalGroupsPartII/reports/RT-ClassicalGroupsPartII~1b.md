<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/130#issuecomment-6336239340 -->
Red team round 1 pass b (claude) of 8932cf5

Verdict: needs_changes

1. **F01** (P2) ClassicalGroups Layers 0 and 1 are cited for comodule comparisons they do not state

   **Location:** `packages/ClassicalGroupsPartII/README.md:1256`: “The defining standard Sp₂g(C) matrix action and invariant alternating pairing agree with point evaluation of the symplectic standard comodule”; `README.md:1258`: “agree with the generic algebraic comodule constructions after point evaluation. Antisymmetrization splits Λ^k V as a direct summand of V^⊗k”; also `README.md:605`.

   **Claim:** The classification imports (`README.md:397`, `:669`, `:706`–707) rest on identifying simplicity of an `O_g(C)`-comodule with simplicity of the point representation of Sp₂g(C)/GSp₂g(C), and on antisymmetrization splitting Λ^k V out of V^⊗k for every k. The README assigns both to ClassicalGroups Layers 0 and 1. On main, ClassicalGroups Layer 0 states `stdRep n : Representation ℂ (GL n ℂ) (Fin n → ℂ)` for the abstract group and `IsRational` as a property (“equivalently a comodule over ℂ[gᵢⱼ, det⁻¹]”) for `GL n ℂ` only; it says nothing about Tau Ceti's symplectic standard comodule or about point evaluation. Layer 1 states only `V^{⊗2} ≅ Sym²V ⊕ ⋀²V`; the general-k statement is Layer 2's Schur-functor case. So the comodule/point-evaluation bridge is owned by nobody, and the antisymmetrization citation points one layer too early.

   **Witness:** `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md:177`–191 (Layer 0: `stdRep`, `symplecticGroup ↪ GL`, `IsRational` for `GL n ℂ`), `:212` (Layer 1: “`V^{⊗2} ≅ Sym²V ⊕ ⋀²V`”), `:231`–232 (Layer 2: “`S^{(1ᵈ)} V ≅ ⋀ᵈ V`”). The rational-representation/comodule dictionary is owned by `TauCetiRoadmap/ReductiveGroups/README.md:180`–182 (“Complete the rational-representation/comodule comparison”).

   **Exact repair text:** Under the standard-representation target (`README.md:467`) add the named target “`standard_point_rep`: for `C` (or any infinite characteristic-zero `K`), point evaluation of `standard K g` at `K`-points is the restriction of ClassicalGroups' `stdRep (2g)` to the similitude subgroup, and a `K`-subspace of a finite `O_g(K)`-comodule is a subcomodule if and only if it is stable under all `K`-points (ReductiveGroups Layer 1, rational-representation/comodule comparison). Simplicity and semisimplicity of a comodule therefore agree with those of its point representation.” Replace the two Dependency-interface bullets with: “ClassicalGroups Layer 0: the `GL n ℂ` standard representation, the inclusion `symplecticGroup ↪ GL` and the equivariant alternating pairing, compared with point evaluation through `standard_point_rep`. ClassicalGroups Layer 2: `S^{(1ᵈ)} V ≅ ⋀ᵈ V` as the image of the Young symmetrizer in `V^{⊗d}`; with complete reducibility this splits `Λ^k V` out of `V^{⊗k}`.” Cite Layer 2, not Layer 1, at `README.md:605`.

2. **F02** (P3) README is not in TauCetiRoadmap form

   **Location:** `packages/ClassicalGroupsPartII/README.md:8`: “\[” (display block through line 14); also lines 196–199, 543–545, 587–589, 618–621, 770–773, 800–803, 874–876; `README.md:212`: “**Prerequisites:**”, `:214` “**Sources:**”, `:222` “**API.**”, `:230` “**Unit tests.**”; `README.md:1239`: “## Dependency interfaces”.

   **Claim:** The package uses eight LaTeX display blocks (`\[ … \]`), 26 `**Prerequisites:**`, 26 `**Sources:**`, 19 `**API.**` and 18 `**Unit tests.**` field lists, and has no `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts` (suppliers sit under `## Dependency interfaces` with no `### From TauCetiRoadmap.X` subsections), no `## How to read the build`, and no `### Examples`/`### Dependencies` closing each layer. The house rules require Unicode/code-span mathematics, prose targets with `*Needs:*` and the locator at the claim, `**Checks.**` bullets, and the fixed heading set; the gate reads supplier contracts from `### From TauCetiRoadmap.X`. The title does not name the base roadmap.

   **Witness:** `README.md:8`–14 (display), `:212`–230 (field lists), `:1239`–1267 (supplier bullets without `### From` headings); the required shape is the roadmap repository's README form (headings 1–7).

   **Exact repair text:** Rename the title to “# Roadmap: classical groups, Part II: rational symplectic-similitude characters”; replace each `\[ … \]` block by an indented code block or inline code span (for example `R_g(K) ≃ ℤ[t^±1, z_1^±1, …, z_g^±1]^{W_g}` and `C_g(K) ≃ ℤ[z_1, …, z_g, t/z_1, …, t/z_g]^{W_g}`); rename `## Scope and dependencies` to `## Scope and ownership`, `## Standing conventions` to `## Conventions`, `## Dependency interfaces` to `## Exact supplier contracts` with subsections `### From Mathlib`, `### From Tau Ceti`, `### From TauCetiRoadmap.ReductiveGroups`, `### From TauCetiRoadmap.ClassicalGroups`, `### From TauCetiRoadmap.LieHighestWeight`; add a one-paragraph `## How to read the build`; in each target fold `**Prerequisites:**` into a closing `*Needs:*` sentence, move each `**Sources:**` locator into parentheses at the claim, rename `**Unit tests.**` to `**Checks.**`, and end each layer with `### Examples` and `### Dependencies`.

3. **F03** (P3) Six `TauCeti.*` imports are unused, while six used declarations come from modules not imported

   **Location:** `packages/ClassicalGroupsPartII/Suggested.lean:15`: “`import TauCeti.Algebra.AlgebraicGroup.Symplectic.StandardComodule`”; also lines 16, 19, 23, 25, 26.

   **Claim:** No declaration defined in `Symplectic/StandardComodule.lean` (6 declarations), `Symplectic/DiagonalTorus/Basic.lean` (19), `Comodule/MatrixCoefficient/Subcoalgebra.lean` (7), `Subcomodule/Comap.lean` (20), `ClassicalGroups/ExteriorPower.lean` (11) or `ClassicalGroups/SymmetricPower.lean` (4) is referenced in the file (`Sym[K]^d` is Mathlib's scoped notation). Conversely the file uses `TauCeti.Subcomodule`, `TauCeti.CommHopfAlgCat.quotient`, `TauCeti.Comodule.endOfPoint`, `TauCeti.GLSymplecticFin.diagonal`, `TauCeti.JFin` and `TauCeti.HopfIdeal`, none of which is defined in an imported module. The import rule is “the individual `TauCeti.*` modules actually used”.

   **Witness:** At the Tau Ceti pin: `TauCeti/Algebra/Coalgebra/Subcomodule/Basic.lean:70` (`structure Subcomodule`), `TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Quotient/Basic.lean:124` (`abbrev quotient`), `TauCeti/Algebra/Coalgebra/Comodule/PointsAction.lean:78` (`def endOfPoint`), `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/Diagonal/Basic.lean:95` (`def diagonal`), `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/Basic.lean:243` (`def JFin`), `TauCeti/Algebra/HopfAlgebra/HopfIdeal/Basic.lean:265` (`structure HopfIdeal`).

   **Exact repair text:** Delete lines 15, 16, 19, 23, 25 and 26. Keep lines 12–14, 17, 18, 20–22 and the corrected `import TauCeti.CategoryTheory.GrothendieckGroup.Monoidal.Basic`. Add `import TauCeti.Algebra.Coalgebra.Subcomodule.Basic`, `import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Quotient.Basic`, `import TauCeti.Algebra.Coalgebra.Comodule.PointsAction`, `import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Symplectic.Diagonal.Basic` and `import TauCeti.Algebra.HopfAlgebra.HopfIdeal.Basic` (the last two only if not reached through `Symplectic.Basic`). Retain any deleted module only if a declaration it defines is used after the repair of the admitted-data items.

4. **F04** (P3) Eighteen admitted proofs close from Mathlib (verified in a probe copy)

   **Location:** `packages/ClassicalGroupsPartII/Suggested.lean:51`: “`instance rankOnePositive : Fact (0 < 1) := ⟨by sorry⟩`”; also lines 52, 166, 178, 338, 341, 343, 346 (proof fields inside real-bodied definitions) and the examples at lines 689, 697, 708, 725, 847, 863, 866, 872, 884, 909.

   **Claim:** These sorries are not targets: each closes with a short proof from the pinned Mathlib. The examples below were elaborated in a probe copy of the Mathlib-only part of the file (the lattice, Laurent, cone and invariant declarations as submitted, with `import Mathlib`), with only `declaration uses 'sorry'` warnings from the surrounding admitted definitions.

   **Witness:** A probe copy; every proof below elaborates against the pinned Mathlib.

   **Exact repair text:**
   ```lean
   instance rankOnePositive : Fact (0 < 1) := ⟨Nat.one_pos⟩
   instance rankTwoPositive : Fact (0 < 2) := ⟨by norm_num⟩
   -- line 166 (torusMatrix) and line 178 (diagonalMatrix): replace `by sorry` by
   --   `by have := a.isLt; omega`   (resp. `by have := i.isLt; omega`)
   def fundamentalIndex {g : ℕ} (i : Fin g) : Fin (g+1) := ⟨i.val+1, by omega⟩
   def fundamentalWeight {g : ℕ} (i : Fin g) : DominantWeight g :=
     ⟨(0, fun j => if j.val ≤ i.val then 1 else 0), by
       refine ⟨fun a b hab => ?_, fun j => ?_⟩
       · beta_reduce; split_ifs <;> omega
       · split_ifs <;> omega⟩
   def zeroWeight (g : ℕ) : DominantWeight g := ⟨(0,0), antitone_const, fun _ => le_rfl⟩
   def twistWeight {g : ℕ} (n : ℤ) (wt : DominantWeight g) : DominantWeight g :=
     ⟨(wt.val.1+n, wt.val.2), wt.property⟩
   -- weight.test_negative_twist, first conjunct
   example : (twistWeight (-1) (zeroWeight g)).val = (-1,0) := by simp [twistWeight, zeroWeight]
   -- torus.test_rank_one (with h6 : (6:ℚ) ≠ 0, h2 : (2:ℚ) ≠ 0 in place of the admitted unit proofs)
   example (h6 : (6:ℚ) ≠ 0) (h2 : (2:ℚ) ≠ 0) :
       diagonalMatrix 1 (Units.mk0 (6 : ℚ) h6) (fun _ => Units.mk0 (2 : ℚ) h2) =
         Matrix.diagonal ![(2 : ℚ),3] ∧
       Matrix.det (diagonalMatrix 1 (Units.mk0 (6 : ℚ) h6) (fun _ => Units.mk0 (2 : ℚ) h2)) = 6 := by
     constructor
     · ext i j; fin_cases i <;> fin_cases j <;> simp [diagonalMatrix, Matrix.diagonal] <;> norm_num
     · simp [diagonalMatrix, Matrix.det_diagonal, Fin.prod_univ_succ]; norm_num
   -- torus.test_scalar
   example (c : ℚˣ) : diagonalMatrix g (c^2) (fun _ => c) =
       (c : ℚ) • (1 : Matrix (Fin (g+g)) (Fin (g+g)) ℚ) := by
     ext i j
     simp only [diagonalMatrix, Matrix.diagonal_apply, Matrix.smul_apply, Matrix.one_apply,
       smul_eq_mul, mul_ite, mul_one, mul_zero]
     split_ifs <;> simp [pow_two, mul_assoc]
   -- weyl.test_wrong_inversion
   example : monomial (-standardWeight (0 : Fin 1)) + t 1 * z (0 : Fin 1) ≠ pairSum (0 : Fin 1) := by
     intro h
     have := congrArg (fun f : Laurent 1 => f.coeff (Multiplicative.ofAdd (standardWeight (0 : Fin 1)))) h
     simp [monomial, t, z, pairedZ, pairSum, MonoidAlgebra.single_mul_single, standardWeight,
       multiplierWeight, ← ofAdd_add, Prod.ext_iff, funext_iff, Fin.forall_fin_one] at this
   -- fullInvariant.test_integral (holds for any equivalence; see pass a F11)
   example (f : invariantSubring g) : ∃! p : MvPolynomial (Fin g) MultLaurent,
       fullInvariantEquiv g p = f := (fullInvariantEquiv g).bijective.existsUnique f
   -- positive.test_multiplier
   example : t g ∈ positiveSubring g := by
     have hg : 0 < g := Fact.out
     have h : t g = z (⟨0, hg⟩ : Fin g) * pairedZ ⟨0, hg⟩ := by
       simp [t, z, pairedZ, monomial, MonoidAlgebra.single_mul_single]
     rw [h]
     exact Subring.mul_mem _ (Subring.subset_closure (Or.inl ⟨_, rfl⟩))
       (Subring.subset_closure (Or.inr ⟨_, rfl⟩))
   -- positive.test_inverse_multiplier, cone conjunct
   example : coneValue (-multiplierWeight g) = -1 := by simp [coneValue, multiplierWeight]
   -- positive.test_boundary
   example (i : Fin g) : pairedZ i ∈ positiveSubring g ∧
       coneValue (multiplierWeight g - standardWeight i) = 0 := by
     refine ⟨Subring.subset_closure (Or.inr ⟨i, rfl⟩), ?_⟩
     simp only [coneValue, multiplierWeight, standardWeight, Prod.fst_sub, Prod.snd_sub, Pi.sub_apply,
       Pi.zero_apply, zero_sub, Pi.single_apply]
     rw [Finset.sum_eq_single i (fun b _ hb => by simp [hb]) (by simp)]
     simp
   -- positiveInvariant.test_constant
   example : positiveInvariantEquiv g (1 : MvPolynomial (Option (Fin g)) ℤ) = 1 := map_one _
   -- tensorCharacter.test_boundary, cone conjunct
   example : coneValue (0 : Weight g) = 0 := by simp [coneValue]
   ```
   The remaining conjuncts of these examples (`centralDegree`, `tInv g ∉ positiveSubring g`, `tensorCharacterEquiv`) depend on admitted definitions and stay README targets until those are real-bodied (pass a F03).

## Verified sound

- Read all 1,290 README lines and all 911 Suggested.lean lines: 233 declarations (110 `def`/`abbrev`/`instance`, 65 `lemma`, 58 `example`), 26 `###` target blocks, the 11 Dependency-interface bullets and the References.
- Elaboration as submitted: the file does not elaborate in the review environment (the first `TauCeti.*` import has no compiled object there; see Not verifiable). A probe copy of the Mathlib-only part (lines 40–134, 139–140, 161–166, 175–178, 201–202, 338–346, 503–536, 549–554, 564–588, 616–620 and the 23 examples that mention only those carriers) under `import Mathlib` elaborates with exit 0 and 67 `declaration uses 'sorry'` warnings and no other diagnostic; every signature in that part is well-typed. The 18 proofs of F04 were then verified in a second probe copy (exit 0).
- Adversarial pass, statement by statement, at g = 0, 1, 2, m = −1, 0, 1, k = 0, 1, 2, g, 2g, 2g+1, the scalar point, the zero and unit objects, and K = Q versus an arbitrary characteristic-zero K: roots e_i−e_{i+1}, 2e_g−e_t with coroot pairings u_i−u_{i+1}, u_g and scalar degree 0; dominance u_1 ≥ … ≥ u_g ≥ 0 with m free; `coverWeight` (m,u) ↦ (u, 2m+Σu_i) injective with image d ≡ Σu_i (mod 2); flip (m,u) ↦ (m+u_i, u[i:=−u_i]) an involution fixing t and the scalar degree, and `permLaurent_flip`; `weyl.test_wrong_inversion`; cone value h = Σ min(a_i,b_i) with normal form t^h ∏ z_i^{max(u_i,0)} w_i^{max(−u_i,0)} (true for g ≥ 1; the g = 0 failure is pass a F01); p_n = x p_{n−1} − t p_{n−2}; E_k = Σ_j C(g−k+2j, j) t^j e_{k−2j}(x), E_2 = x_1x_2 + 2t and F_2 = x_1x_2 + t at g = 2, E_{2g} = t^g, F_1 = E_1; B_g free over ℤ[t] on the cone monomials, B_g^W = ℤ[t, F_1, …, F_g] and L_g^W = ℤ[t^±1][F_1, …, F_g] (both equivalences true already at g = 0); κ_2(v∧w) = ω(v,w) with sign (−1)^{a+b−1}; hJhᵀ = sJ ⇔ hᵀJh = sJ, so ω(hv,hw) = ν(h)ω(v,w); dim P_k = C(2g,k) − C(2g,k−2), dim P_2 = 5 at g = 2; kernel of (a,c) ↦ ca is {(εI, ε) : ε² = 1}; diag(I_g, 2I_g) has multiplier 2 and no lift over Q; 2I has multiplier 4; diag(2,3) with t = 6, z = 2, det 6; the tensor-occurrence criterion m ≥ 0, d = 2m+Σu_i (checked against Schur–Weyl for g = 1: det^m Sym^u at degree 2m+u); Hom and weight-space base change over any characteristic-zero K/F and reflection of isomorphisms via the nonvanishing determinant over an infinite F; all five conjuncts of `rationalHighestWeightClassification` and `homAndWeightBaseChange`. No further false statement found; the rank-zero failure of `mem_positiveSubring` is pass a F01 and is not re-raised. 22 numerical Checks recomputed; all correct as stated for g ≥ 1.
- Locators (16 units across the three cited works, checked in the cached legal copies): Yu §7.1 is on printed p.64 with condition (7.1.1), the two rings, the trace on diag(z, t/z), the generators t^±1 and Λ^kV − tΛ^{k−2}V, the tensor-power subring, and the credit to Deligne (`yu line 3736`, `3744`–3770); the arXiv v5 date 18 July 2022 (`yu line 5`). Milne, Chapter 22 §a: Theorem 22.2 on printed p.464, complements 22.3–22.6 on p.465, 22.12 (central isogeny descent) on p.466; §c: Lemma 22.39 on p.477, Theorem 22.42 on pp.478–479; author PDF dated 5 October 2021 (`milne line 7`, `19091`, `19104`–19119, `19167`, `19613`, `19659`). Sternberg §7.9 pp.131–133: Cartan product, contraction kernel, surjectivity for j = 2,…,n, the misprinted lower index 2j−2 (not copied), and the second fundamental dimension (2n+1)(2n−2)/2 = C(2n,2) − 1 on p.133 (`sternberg line 5020`–5058, `5143`–5149); notes dated 23 April 2004 (`sternberg line 7`).
- Pinned declarations: 27 names checked at Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c`; all exist (`FGComoduleCat`, `SplitK0`, `SplitK0.of`, `liftRingHom`, `of_mul_of`, `mapRingHom`, `of_biprod`, `DiagonalizableGroup.weightSpace` with explicit `V`, `isInternal_weightSpace`, `finite_setOf_weightSpace_ne_bot`, `Comodule.baseChange`, `baseChangeCoact`, `matrixCoefficientSubcoalgebra`(`_finite`), `Symplectic.coordinateHopfAlgebra`, `coordinateMap`, `GeneralLinear.coordinateHopfAlgebra`, `genericMatrix`, `standardCoact`, `char_extPowerRep_diagonal`, `Hom.ker`, `ker_finite`, `JFin`, `GLSymplecticFin.diagonal`, `HopfIdeal`, `CommHopfAlgCat.quotient`, `endOfPoint`, `FGComoduleCat.zero`, `hasBinaryBiproducts`, `instMonoidalCategory`, `instBraidedCategory`), except the module path of pass a F02.
- Suppliers: all 11 cited layer anchors exist on main (ReductiveGroups Layers 0, 1, 3, 6, 7; ClassicalGroups Layers 0, 1, 3, 4, 5; LieHighestWeight Layer 4). ReductiveGroups Layer 6 owns central isogenies and the characteristic-zero linearly-reductive equivalence; Layer 7 the split root datum and Weyl group; ClassicalGroups Layer 3 the connected Sp highest-weight classification and Layer 5 the Sp dimension product form; LieHighestWeight Layer 4 the classification. No supplier is later than this roadmap and no supplier cites it. `ClassicalGroupsPartII` is absent from `merge-order/ORDER.txt` (imported package; not a defect). No `gap:` contracts are declared. The depcheck gate returned:
  ```text
  depcheck: 9 roadmaps, 72 edges, 0 problem(s)
  ```
- Policy: no process words, issue or PR numbers in the README; the Lean form items (`import Mathlib.<submodule>`, `set_option`, `lemma`, namespace, docstrings, admitted data, all-admitted examples) are pass a F03–F05 and are not re-raised.
- Not re-raised from pass a (round 1 pass a, codex): F01 (rank zero), F02 (missing `Monoidal` module, stale pins in links), F03 (admitted data and forced headlines), F04 (all 58 examples admitted), F05 (Lean form), F06 (ReductiveGroups Layer 1/3 contracts absent), F07 (classification replanned), F08 (`TauCeti.Comodule.exteriorPower` at the pin), F09 (reductivity before root data), F10 (Hom base-change locator), F11 (non-discriminating Checks), F12 (Lean names without README contracts), F13 (no `sources.toml`).

## Not verifiable

- Elaboration of the file as submitted: the review environment has no compiled objects for the `TauCeti.*` modules the file imports (the first import already fails), so the 110 declarations and 35 examples whose carriers are `coordinateHopfAlgebra`, `RatRep`, `repRing`, `FGComoduleCat`, `SplitK0` or `weightSpace` were checked by reading the pinned signatures only; the Mathlib-only part was elaborated in a probe copy (above). Independently of this, the import at line 24 does not exist at the pin (pass a F02).
- No `sources.toml` exists at this head (pass a F13); the locators were checked against the cached legal copies of Yu and Sternberg and the author's PDF of Milne, cited here by their line numbers in those copies.
- The ReductiveGroups and ClassicalGroups supplier statements are roadmap targets, not pinned declarations; their hypotheses were compared with the README's prose, not with Lean signatures.
