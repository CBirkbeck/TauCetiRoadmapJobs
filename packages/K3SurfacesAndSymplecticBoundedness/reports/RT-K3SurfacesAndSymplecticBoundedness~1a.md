<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/563#issuecomment-6317163369 -->
Red team round 1 pass a (codex) of db94ab6

Verdict: needs_changes

1. **F01** (P2) The genus-one interface omits the genus-one hypothesis

   **Location:** `packages/K3SurfacesAndSymplecticBoundedness/README.md:85`: “A genus-one fibration f:X→C is a proper morphism from a smooth surface X to a smooth curve C with f_*O_X=O_C, and is relatively minimal”.

   **Claim:** These conditions define the domain of the genus-one canonical-bundle and Jacobian formulas.

   **Witness:** The projection ℙ¹×ℙ¹→ℙ¹ satisfies every displayed condition, but has genus-zero generic fibre. Its canonical line restricts to O(−2) on a fibre, whereas the asserted genus-one formula restricts trivially.

   **Exact repair text:** Replace the definition sentence by: “A genus-one fibration f:X→C is a proper flat surjective morphism from a smooth integral surface to a smooth integral curve, with f_*O_X=O_C and geometrically integral generic fibre of arithmetic genus one; it is relatively minimal. The Euler and global canonical comparisons below assume C proper.” Add the negative-control Check: “The projection ℙ¹×ℙ¹→ℙ¹ is relatively minimal with connected fibres but is excluded because its generic fibre has arithmetic genus zero.”

2. **F02** (P2) The integral-cohomology proof uses a false implication

   **Location:** `packages/K3SurfacesAndSymplecticBoundedness/README.md:448`: “If nx lies in Pic, the map to H²(O), a complex vector space, detects nx=0”.

   **Claim:** Membership of a multiple in the Picard image forces that multiple to vanish.

   **Witness:** On a smooth complex quartic take x=c₁(O(1)) and n=1. Then nx belongs to Pic but x² evaluates to 4, so nx≠0. The correct torsion argument is at huybrechts lines 464–469.

   **Exact repair text:** “If nx=0 for an integer n>0, the image of x in H²(O) is zero because H²(O) is torsion-free. Exactness therefore places x in the image of Pic. Since Pic is torsion-free and c₁ is injective, x=0. Thus H²(M,ℤ) is torsion-free.”

3. **F03** (P1) Height transfer applies a finite-flat trace outside its domain

   **Location:** `packages/K3SurfacesAndSymplecticBoundedness/README.md:902`, “formal-Brauer pullback and trace, with nonzero tangent”; compare the finite-flat-only trace contract at line 165.

   **Claim:** The declared formal-Brauer contract provides pullback and degree trace for the correspondence from the smooth resolution Y of X/G to X, as required for `tameInvariantDimension.supersingularTransfer`.

   **Witness:** For char k≠2, k[x,y] over k[x²,xy,y²] has generic rank 2 but origin fibre k[x,y]/(x²,xy,y²) of dimension 3. Thus even the tame A₁ quotient is not flat. Y→X/G is a resolution, not a birational map between smooth surfaces.

   **Exact repair text:** “Resolve X⇢Y to q:V→Y with V→X a birational morphism between smooth proper surfaces. The formal-Brauer pullback along q and the supplied birational comparison give Br̂(Y)→Br̂(X). To prove its tangent nonzero use coherent duality, not a formal-Brauer trace outside the finite-flat domain: SchemeAndStackFoundations §2.19 `trace`, §2.20 `cm_serre_duality`, and §2.21 `coherent_duality`, `trace_finite` identify the dual of H²(O) pullback with trace on global two-forms. On the dense finite étale locus, trace of the pullback of a two-form is |G| times that form; equality extends between the canonical line sheaves. Since |G| is invertible, the tangent map is nonzero. Apply the formal-group Hom vanishing.” Add these precise supplier citations and the named K3 comparison `tameInvariantDimension.brauerPullback_nonzeroTangent` to §6.8a. The proper coherent trace is already owned in `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4064`, 4321, 4372–4377; no new supplier gap is needed.

4. **F04** (P2) The global frame-torsor interface uses an unavailable line bundle

   **Location:** `packages/K3SurfacesAndSymplecticBoundedness/README.md:1067`: “over a prescribed family ... the torsor of projective frames of f_*L³”; compare the Picard-section-only family at line 1002 and `no_global_root_line` at line 1075.

   **Claim:** Every polarized family has the vector bundle f_*L³ appearing in the global frame-torsor identification.

   **Witness:** A smooth anticanonical surface in a nonsplit real Brauer–Severi threefold is geometrically a quartic K3. Its hyperplane Picard section has quaternion obstruction α≠0; its cube has obstruction 3α=α. There is no global L³ representative.

   **Exact repair text:** “Construct `PolarizedK3Family.cubeProjectiveBundle`: the projective bundles ℙ(f_*L³) for étale-local line representatives L descend canonically to a Brauer–Severi projective bundle P_λ of relative dimension 9d+1. Replacing L by L⊗f^*N changes f_*L³ by tensoring with N³ and leaves its projectivization canonically unchanged. Prove the overlap, cocycle and arbitrary-base-change comparisons. Then `polarizedK3HilbertAtlas.frameTorsor` identifies the stack pullback over a prescribed family with Isom_S(P_λ,ℙ_S^(9d+1)), a PGL_(9d+2)-torsor. When λ has a global representative L, this recovers the projective frames of f_*L³.” Retain the source identification in the stack pullback and cite rizov lines 1023–1067. Add the nonsplit real Brauer–Severi quartic as the negative-control Check.

5. **F05** (P3) The native congruence boundary Checks have no Lean tests

   **Location:** `packages/K3SurfacesAndSymplecticBoundedness/README.md:557`–560 (`rank0_kernel`, `rank1_prime3`, `prime2_negative`, `unipotent_two_term`); `packages/K3SurfacesAndSymplecticBoundedness/Suggested.lean:17`–40.

   **Claim:** These are the discriminating Checks for the sole layer represented in Suggested.lean.

   **Witness:** Suggested.lean has three admitted theorem statements and zero proved examples. Both −1 examples use its existing GL₁, PadicInt and reduction carriers; neither needs a K3, cohomology or moduli carrier.

   **Exact repair text:** Add a real-bodied light definition `firstCongruenceKernel ell n := (Matrix.GeneralLinearGroup.map (PadicInt.toZMod : PadicInt ell →+* ZMod ell)).ker`, with explicit prime instance and matrix index `Fin n`, and list it in §4.5. Add two proved `example`s testing that definition: “−1 in GL₁(ℤ₃) is outside the kernel” and “−1 in GL₁(ℤ₂) is a nonidentity element in the kernel with square 1.” These are the positive and negative controls for oddness, within the two-example limit. Retain rank zero and the unipotent formula as named README theorem targets if their proofs are deferred; do not replace the missing tests by admitted examples.

6. **F06** (P3) Several page locators disagree with the cached editions

   **Location:** `packages/K3SurfacesAndSymplecticBoundedness/sources.toml:98`, 259, 356; `packages/K3SurfacesAndSymplecticBoundedness/README.md:1195`.

   **Claim:** Mukai (1.4) is on p.188, §§3–8 are on pp.201–217; Artin (1.8) is on p.547; Stacks 54.17.2 is on p.52.

   **Witness:** mukai line 190 labels p.187; lines 1503–1511 place §8 across pp.218–219. artin-supersingular lines 209–210 label (1.8) p.548. stacks-surface-resolution lines 2384–2390 place 54.17.2 on p.53.

   **Exact repair text:** In the Mukai locator replace “pp.184–185, 188; §§3–8, pp.201–217” by “pp.184–185, 187; §§3–8, especially §8, pp.218–221”. In the Artin locator replace “Theorem (1.7)(i) and Lemma (1.8), p.547” by “Theorem (1.7)(i), p.547, and Lemma (1.8), p.548”. In the Stacks locator replace the page “p.52” for 54.17.1–54.17.2 by “pp.52–53”. Also change the README reference range for Resolution of Surfaces from “pp.41–42, 50–52” to “pp.41–42, 50–53”. Keep the verified theorem numbers and extraction-line locators.

7. **F07** (P2) The deformation argument omits normalization of a divisible Chern class

   **Location:** `packages/K3SurfacesAndSymplecticBoundedness/README.md:381`: “crystalline c₁ cannot remain in F² throughout the universal characteristic-p deformation”.

   **Claim:** Nontriviality of L suffices for the displayed mod-p Hodge-filtration obstruction, without dividing its integral crystalline class by a power of p.

   **Witness:** For an ample M and L=M^p, c₁,dR(L)=p·c₁,dR(M)=0, hence belongs to F². Deligne-lift lines 516–525 instead normalize x by its maximal p-divisibility before using either graded Gauss–Manin map.

   **Exact repair text:** “Assume L extends over the entire characteristic-p universal deformation. Its crystalline Chern class x is nonzero, horizontal, and satisfies Fx=px. Divide x by its maximal power p^a and put y=p^(−a)x; p-adic separatedness gives a nonzero reduction y₀. Frobenius divisibility places y₀ in F¹. The graded Gauss–Manin map on F² excludes y₀∈F², while the graded map on F¹/F² excludes its remaining nonzero class. This contradiction shows that the pair-deformation equation is not divisible by p (Deligne §2.11, deligne-lift lines 510–526).” Add the Check: “For L=M^p the unnormalized de Rham Chern class is zero; the flatness proof uses the primitive integral crystalline normalization, not that zero reduction.”

8. **F08** (P2) Relative Galois invariants are confused with geometric invariants

   **Location:** `packages/K3SurfacesAndSymplecticBoundedness/README.md:485`: “For separable Galois extensions ... the Galois-invariant geometric Picard group tensor ℚ”.

   **Claim:** The assertion for an arbitrary Galois extension K/k uses the geometric Picard group rather than Pic(X_K), without specifying the absolute Galois group.

   **Witness:** Take K=k=ℝ on ∑xᵢ⁴=0. Gal(K/k)=1. The line x₀=ζx₁,x₂=ζx₃ and its conjugate, ζ=e^(πi/4), are skew with square −2, hence distinct classes. Real classes are conjugation-invariant.

   **Exact repair text:** “For a finite Galois extension K/k with group G, Picard–Brauer descent induces Pic(X)⊗ℚ ≅ (Pic(X_K)⊗ℚ)^G. For the geometric group, use the absolute Galois group G_k=Gal(kˢ/k): Pic(X)⊗ℚ ≅ (Pic(X_kbar)⊗ℚ)^(G_k), using the purely inseparable comparison after rationalization.” Cite huybrechts lines 14011–14025 and distinguish these two maps in `picard_identity`: K=k gives the identity on Pic(X), not an identification with all geometric classes. The displayed real quartic and conjugate lines give a negative control for replacing the absolute group by Gal(K/k).

9. **F09** (P3) The Artin-invariant definition is tested only by its defining equations

   **Location:** `packages/K3SurfacesAndSymplecticBoundedness/README.md:894`–896, `artin_one_numeric`, `artin_two_control`, `rank_control`.

   **Claim:** These three numerical substitutions are the Checks for the geometric predicate `IsK3.IsArtinInvariantOne`.

   **Witness:** None supplies a K3 surface or evaluates its actual Picard lattice. The assertions about 22, −9 and −81 remain unchanged if the geometric predicate is implemented as constantly false or reads the wrong lattice.

   **Exact repair text:** Add three realized surface Checks: “`artin_fermat_three`: the Fermat quartic over F̄₃ has geometric rank 22 and bilinear discriminant −9, so it satisfies IsArtinInvariantOne”; “`artin_fermat_seven`: the Fermat quartic over F̄₇ has rank 22 and discriminant −49 and also satisfies it, testing that p is read from the base field”; “`artin_fermat_five`: the Fermat quartic over F̄₅ has finite formal Brauer height one, hence rank at most 20, and fails the predicate.” Retain the numerical sign checks as supplementary arithmetic controls. Cite Huybrechts, Chapter 18 §3, Example 3.4, huybrechts lines 15264–15270, together with §6.0, §6.0a and Shioda Proposition 1 and Corollary 2 (shioda-unirational-primary lines 52–53, 137–140) for rank 22. In that draft the word “respectively” reverses the two discriminants: the infinite-height p≡3 mod4 case has −p², as required by rank 22 and p-elementarity; do not copy that misprint into the Checks. These geometric Checks stay in the README until their actual carriers are available.

10. **F10** (P2) The SL₂ supplier contract names the ordinary polyhedral groups

   **Location:** `packages/K3SurfacesAndSymplecticBoundedness/README.md:175`, and the matching `gap:tame-linear-groups` needs sentence in `packages/K3SurfacesAndSymplecticBoundedness/design/plan.json`.

   **Claim:** The SL₂ classification lists “binary dihedral, tetrahedral, octahedral and icosahedral” groups, leaving the last three unqualified.

   **Witness:** dolgachev-keum lines 399–402 specifies binary tetrahedral, binary octahedral and binary icosahedral. The ordinary tetrahedral group A₄ has three involutions; in SL₂(ℂ) the only nonidentity involution is −I, so A₄ cannot embed.

   **Exact repair text:** In both copies of the needs sentence write: “Supply the classification of finite prime-to-p subgroups of SL₂ over algebraically closed fields of characteristic p>0, and finite subgroups in characteristic zero, as cyclic, binary dihedral, binary tetrahedral, binary octahedral or binary icosahedral groups.” Retain the same supplier, section and gap slug. Their orders are respectively n, 4n, 24, 48 and 120, subject to the indicated tameness condition; the ordinary rotation groups belong to the projective quotient classification instead.

11. **F11** (P3) The geometric-rank Checks also pass for arithmetic rank

   **Location:** `packages/K3SurfacesAndSymplecticBoundedness/README.md:527`–529, the three Checks for `IsK3.geometricPicardRank`.

   **Claim:** The Checks distinguish geometric Picard rank from an incorrect replacement.

   **Witness:** Defining ρ_geom(X/k):=ρ(X/k) still passes equality over closed fields, the possibility of rank 22, and positivity. On the real Fermat quartic, conjugate skew lines instead force ρ(X/ℝ)<ρ_geom(X/ℝ).

   **Exact repair text:** Add the Check: “`arithmetic_geometric_rank_control`: for the real Fermat quartic ∑xᵢ⁴=0, geometric Picard rank is 20, but arithmetic Picard rank is strictly smaller. The skew lines x₀=ζx₁, x₂=ζx₃ and their conjugates, ζ=e^(πi/4), have distinct classes, so conjugation is nontrivial on geometric Pic⊗ℚ. After extending ℝ to ℂ, geometric rank remains 20 while arithmetic rank increases.” Cite the corrected Galois comparison of §4.1, huybrechts lines 14011–14018, and the complex Fermat rank at huybrechts line 12288. Keep the rank-22 and positive-rank controls, but this nonclosed-field test must be included: the closed-field equality alone cannot test geometric base change. No Lean stand-in is requested before the actual Picard carrier exists.

## Verified sound

Read all 1,203 README lines and all 43 Suggested.lean lines. Coverage: **3 Lean theorem declarations**, **60 numbered README targets**, **84 named interface entries**, and **197 Checks** (191 target Checks and 6 supplier Checks). Every declaration's explicit binders were audited; there are no ambient variable blocks, definitions, instances or examples in Suggested.lean. The three mathematical Lean statements survive rank zero, the odd-prime boundary and finite-subgroup tests. All three Lean names occur in the README. No forced geometric stand-in or additional missing easy geometric headline was found.

**Locators:** all 60 target locator groups and 25 declared supplier-contract groups were inspected. Theorem/section text was checked in the **23 certified cited source records**; incorrect page metadata is recorded in R06. Five other active source records have settled waived/uncertified status, listed below. The two certified but unused records (illusie-witt and gros-chern) are not counted as verified citations. This is source-location verification, not a claim to have reconstructed every published proof.

**Supplier citations:** checked the 15 consumed roadmap owners, including the exact relative-Picard interfaces at the current ComplexComparisonPartII and AlgebraicModuliForArithmeticGeometry heads and the integral crystalline interfaces at the current CrystallineCohomology head. Checked all five separately supplied sibling heads for overlapping objects; none supplies a cited premise here. ArithmeticDynamics §1.26 uses a K3 height example, not this package's symplectic-group theorem. AdicSpacesPartIII's existing quartic formal-deformation counterexample is not replanned as an independent formal-geometry library. Generic Picard, lattice, duality, Kummer and GAGA ownership remains with the named suppliers.

The supplier-head checks used ComplexComparisonPartII `c9ccfac82885efe9b0ba23cc8df12ddb5512af37`, CrystallineCohomology `2c8b22a1737d1660f1baf397926b41e90139a80d`, and AlgebraicModuliForArithmeticGeometry `98fd03823a4797777f298cf65d50ff0cafb51c43`; main-roadmap checks used content main `c4d22422c3f1aaa3d806c42f432953c26cb91969`. Each of the 25 gap slugs has the same named owner and needs sentence in the README and plan. Existing gap absence from a supplier was not treated as a defect; R10 concerns precision of the contract itself.

Pinned-carrier checks used Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The matrix map is a homomorphism on matrix units (`Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:187`); residue separation and its prime context are in `Mathlib/NumberTheory/Padics/RingHoms.lean:713`. The pinned Witt DVR/residue declarations, native relative-differential and line-bundle carriers, rational-ambient lattice constructor, and finite-field Brauer/comparison declarations were read. The existing scalar principal-unit torsion theorem does not already provide the matrix theorem. No redefinition of these pinned carriers was found.

The PR diff has six changed files, all within the package folder. Suggested.lean has one `import Mathlib`, three `theorem`s and no `set_option`, admitted data, `True` placeholder, imported open-roadmap module, or build command. No computational algorithm is proposed by the K3 targets. No Lean command or build was run during this review.

Mechanical dependency-check output:

```text
depcheck: 6 roadmaps, 42 edges, 0 problem(s)
```

The internal plan graph has 60 targets and 175 target-reference edges; after resolving the explicit §4.4 `picardCycle_saturated` reference to its owning target, every edge points earlier. There is no internal forward reference or cycle. The supplied merge order and the existing-main status of the remaining owners give no upward supplier dependency. No ownership move is required by this pass.

The tables below record the adversarial pass. “No defect found” applies to the listed cases; it does not certify an unavailable primary source or an unformalized proof.

### Headline targets

| Statement / location | Context and instances tried | Result | Change |
| --- | --- | --- | --- |
| §1.1 `AlgebraicGeometry.IsK3` (README:191) | k a field; X a native Scheme with f:X→Spec k. Smooth quartic; empty scheme; E×E with h¹=2; ℙ² with ω=O(−3). | No defect found in these cases. | — |
| §1.2 `isK3_iso_and_fieldExtension_iff` (README:208) | k,K fields; K/k any extension, including inseparable; f:X→Spec k. Identity and purely inseparable extensions; nonzero rescaling of a volume form; descent of triviality via sections of L and L⁻¹. | No defect found in these cases. | — |
| §1.3 `IsK3.projective` (README:222) | k an arbitrary field, including imperfect fields; IsK3(X/k). Smooth quartic over an imperfect field; relative smoothness versus absolute regularity; dimension-three generalization excluded. | No defect found in these cases. | — |
| §1.4 `IsK3.riemannRoch` (README:236) | IsK3(X/k); L invertible; σ nonzero for contraction. L=O gives 2χ=4; quartic H²=4 gives χ(H)=4; contraction e₁↦e₂*, e₂↦−e₁*, also p=2. | No defect found in these cases. | — |
| §1.5 `IsK3.numericalKernel_eq_zero` (README:250) | IsK3(X/k); L invertible on X. O; p-torsion in characteristic p; a rational curve of square −2; ample intersection excludes nontrivial effective classes in the kernel. | No defect found in these cases. | — |
| §1.6 `smoothQuartic_isK3` (README:264) | k a field; smoothness of the quartic for its K3 assertion. Quartic Hilbert polynomial at t=0,1; Fermat quartic in characteristic 2 is nonsmooth; disconnected nonample divisor in ℙ¹×ℙ². | No defect found in these cases. | — |
| §2.1 `IsK3.relativePicardSpace` (README:289) | S a scheme; X→S smooth proper finitely presented; each geometric fibre a native K3 scheme. Algebraically closed field; zero and torsion sections; jumping Picard rank; arbitrary nonreduced base; no relative flatness assumed. | No defect found in these cases. | — |
| §2.1a `IsK3.infiniteHeightDifferentialKernel` (README:305) | k algebraically closed of characteristic p>0; IsK3(X/k); infinite formal Brauer height and nonzero global vector field for the kernel assertion. Zero element is not the required kernel witness; p=2; finite versus infinite height; vector-field hypothesis retained. | Boundary cases consistent; primary kernel lemma is waived. | — |
| §2.2 `IsK3.regularOneForms_closed` (README:321) | IsK3(X/k); char k=p>0. Zero one-form; p=2; finite-height degeneration and infinite-height kernel branches separately. | No defect found in these cases. | — |
| §2.3 `IsK3.noVectorFields` (README:335) | IsK3(X/k). E×E excluded; identity tangent; p=2 Cartier argument; characteristic-zero spreading and Hodge symmetry. | No defect found in these cases. | — |
| §2.4 `IsK3.hodgeAndCrystallineRanks` (README:349) | IsK3(X/k); k perfect for crystalline cohomology over W(k). Hodge positions outside 0…2; Euler sum 24; W/p in M² would force nonzero H¹_dR; W/p in M⁰ would force H⁻¹_dR. | No defect found in these cases. | — |
| §2.5 `IsK3.formalDeformation` (README:364) | k algebraically closed; IsK3(X/k); deformations include a special-fibre marking. Dual numbers: tangent dimension 20; finite automorphisms removed by special-fibre marking; characteristic-zero versus Witt base. | No defect found in these cases. | — |
| §2.6 `IsK3.lineBundleDeformationDivisor` (README:377) | k algebraically closed; IsK3(X/k); L nontrivial; ampleness for smoothness clauses. L=O has dimension 20; p divides 2d; L=M^p has zero unnormalized de Rham Chern class. | Theorem supported; displayed mod-p argument misses normalization. | R07 |
| §2.7 `IsK3.polarizedLift` (README:391) | k algebraically closed of characteristic p>0; IsK3(X/k); L ample. Ramified lift at p=2; existence of one trait versus lifting along every deformation. | No defect found in these cases. | — |
| §3.1 `ComplexManifold.IsK3Analytic` (README:414) | M a native complex manifold. Analytic quartic; complex torus with h¹(O)=2; empty manifold; compact connectedness for constant functions. | No defect found in these cases. | — |
| §3.2 `IsK3.analytification` (README:430) | IsK3(X/C) for forward statements; IsK3Analytic M for the essential-image assertion. GAGA for O and ω; projective analytic essential image; no algebraization asserted for arbitrary analytic K3. | No defect found in these cases. | — |
| §3.3 `IsK3.complexIntegralBetti` (README:444) | M a projective analytic K3. H² torsion; x=c₁(O(1)), n=1 on a quartic; cup square +4; exp(2πiz) winding +1. | Theorem supported; displayed implication is false. | R02 |
| §3.4 `IsK3.integralEtaleRanks` (README:459) | IsK3(X/k); ℓ prime and invertible in k. ℓ=p excluded; ℓ=2 retained when invertible; H⁰ and trace rank one; all other degrees and integral torsion. | No defect found in these cases. | — |
| §4.1 `IsK3.picardBaseChange` (README:483) | IsK3(X/k); K/k a field extension; separable Galois extension for the last assertion. K=k=ℝ and conjugate skew lines on the Fermat quartic; closed base extension; inseparable degree p^n; Brauer obstruction. | Relative/absolute Galois groups must be distinguished. | R08 |
| §4.2 `IsK3.picardLattice` (README:497) | IsK3(X/k). Rank-one Gram [4] has determinant 4 and half-norm 2; O has norm zero; rational curve square −2; residue-weighted arithmetic degree. | No defect found in these cases. | — |
| §4.3 `IsK3.geometricPicardRank` (README:515) | IsK3(X/k). Closed field; rank 22 versus h¹¹=20 in characteristic p; ample class excludes rank zero; arbitrary field extension. | Arithmetic rank passes the present Checks. | R11 |
| §4.4 `IsK3.picardRank_bounds` (README:531) | IsK3(X/k); ℓ invertible for the cycle statement. Characteristic-zero rank ≤20 versus positive-characteristic rank ≤22; quartic c₁²=4; multiplication by ℓ is not saturated. | No defect found in these cases. | — |
| §4.5 `GeneralLinearGroup.oddCongruenceKernel_torsionFree` (README:545) | ℓ an odd prime; n a natural number, including0. n=0; −1 over ℤ₃ versus ℤ₂; E₁₂²=0 and (I+3E₁₂)^m=I+3mE₁₂; infinite cyclic subgroup excluded by finiteness. | All three Lean signatures true; native Checks unmirrored. | R05 |
| §4.6 `IsK3.boundedPicardDescent` (README:562) | IsK3(X/k); extra hypotheses only for bounded integral Picard descent. Closed field degree one; full Picard descent versus rank descent; rational-point and Br(k)=0 alternatives. | No defect found in these cases. | — |
| §5.1 `IsK3.IsSymplectic` (README:586) | IsK3(X/k); f a k-automorphism. Identity, composition and inverse; rescale σ by b≠0; scalar −1 fails only away from characteristic 2. | No defect found in these cases. | — |
| §5.2 `IsK3.polarizedAut` (README:603) | IsK3(X/k); L ample. Identity; distinct scalar choices of a line isomorphism; stabilizers of L and L^n for n>0. | No defect found in these cases. | — |
| §5.3 `IsK3.polarizedAut_finiteEtale` (README:619) | IsK3(X/k); L ample. Nontrivial finite stabilizer; nonclosed field forms; zero tangent in characteristic 2; subgroup of finite étale group. | No defect found in these cases. | — |
| §5.4 `wehler_infiniteSymplectic` (README:633) | base field C; choose a smooth member with both finite projections. S₂S₁=[[-1,−4],[4,15]], trace 14, determinant 1; Gram determinant −12; each involution negates the form; nonample disconnected divisor. | No defect found in these cases. | — |
| §6.0 `IsK3.supersingularDiscriminant` (README:658) | k algebraically closed of characteristic p>0; IsK3(X/k); ρ(X)=22. Signature (1,21) has negative determinant; σ=0 and 11 contradicted by even unimodularity; p=2 requires even B/p separately. | No defect found in these cases. | — |
| §6.0a `IsK3.artinHeightInequality` (README:673) | k algebraically closed of characteristic p>0; IsK3(X/k); finite formal Brauer height h for the inequality. h=1 gives ρ≤20; h=10 gives ρ≤2; h=11 contradicts an ample class; infinity is not an integer substitution. | No defect found in these cases. | — |
| §6.0b `IsK3.genusOnePencil_of_rank_ge_five` (README:687) | k algebraically closed; IsK3(X/k). Positive rank-one lattice [4] has no isotropic vector; 2F is not a primitive pencil; p=2,3 may be quasi-elliptic; local ℚ₂ isotropy retained. | No defect found in these cases. | — |
| §6.0c `IsK3.ellipticSupersingular_rank22` (README:701) | k algebraically closed of characteristic p>0; IsK3(X/k); infinite formal Brauer height and an elliptic fibration for the first assertion; a quasi-elliptic fibration for the second. No section on an elliptic pencil; finite height does not imply rank 22; quasi-elliptic unirationality; rank 21 contradiction. | No defect found in these cases. | — |
| §6.1 `IsK3.tameSymplecticQuotient` (README:720) | k algebraically closed; IsK3(X/k); G finite, faithful, symplectic; ∣G∣ invertible in k. G=1; involution gives eight A₁ curves; wild actions excluded from local linearization; binary versus ordinary polyhedral groups. | Tame theorem supported; supplier group names need correction. | R10 (supplier) |
| §6.1a `IsK3.tameCyclicFixedPointArithmetic` (README:734) | k algebraically closed; IsK3(X/k); faithful symplectic C_n action with n>1 invertible in k. n=2 and n=4 orbit identities; extra n=11 and 15 candidates have rank-20 square discriminants; n=1 excluded. | No defect found in these cases. | — |
| §6.2 `IsK3.tameSymplectic_fixedPoints` (README:750) | IsK3(X/k); g nonidentity of finite order; char k=0 or ord(g) prime to char k. Orders 2,7 give 8,3 fixed points; identity fixed locus is the whole surface; nongeometric base counts geometric points. | No defect found in these cases. | — |
| §6.2a `IsK3.wildFixedLocusAlternatives` (README:764) | k algebraically closed of characteristic p>0; IsK3(X/k); ord(g)=p; F is the reduced fixed locus, not an assumed reduced fixed scheme. Empty fixed locus only in characteristic 2; reduced versus scheme fixed locus; κ=0,1,2; fixed-fibre multiplicities retained. | No defect found in these cases. | — |
| §6.3 `IsK3.wildCyclicQuotient` (README:780) | k algebraically closed of characteristic p>0; IsK3(X/k); ord(g)=p; ℓ invertible in k for cohomology clauses. Empty fixed locus and characteristic-2 Enriques quotient; Enriques b₂=10; rational resolution algebraic H²; singular quotient not substituted for resolution. | No defect found in these cases. | — |
| §6.3a `IsK3.wildPrimeBound_fixedLocusRefinements` (README:795) | k algebraically closed of characteristic p>0; IsK3(X/k); ord(g)=p for the fixed-locus and invariant-pencil assertions; elliptic K3 fibration with section and p>7 for the torsion assertion. p=11 exceptional branch; p=2,3 quasi-elliptic alternative; p=13 exclusion; no p-torsion section for p>7. | No defect found in these cases. | — |
| §6.4 `IsK3.wildPrime_le_eleven` (README:811) | IsK3(X/k); char k=p>0; G a finite subgroup with p dividing ∣G∣. p>11 forces tame finite actions; p=2 retained; Cauchy extracts an order-p subgroup. | No defect found in these cases. | — |
| §6.4a `IsK3.supersingularPicardFaithfulness` (README:824) | k algebraically closed of characteristic p>0; IsK3(X/k); rank Pic(X)=22. Identity kernel; p=2; rank <22 is not covered; full automorphism group rather than just its finite subgroups. | Keum corroborates its use; primary Picard-faithfulness text waived. | — |
| §6.5 `IsK3.etaleAction_faithful` (README:840) | IsK3(X/k); ℓ prime and invertible in k. Identity; ℓ=p excluded; finite order follows from fixing an ample class; wild Enriques branch at p=2. | No defect found in these cases. | — |
| §6.6 `IsK3.finiteSubgroup_uniformBound` (README:854) | IsK3(X/k); G a finite subgroup. Trivial subgroup; characteristic 3 chooses ℓ=5; characteristic 2 permits ℓ=3; wild group orders allowed. | No defect found in these cases. | — |
| §6.7d `IsK3.symplecticInvolution_genusOnePencil` (README:868) | k algebraically closed of characteristic p>0, p≠2; IsK3(X/k); g symplectic of exact order 2. Swap matrix [[0,1],[1,0]] is nonidentity mod 2; identity excluded; p=3 quasi-elliptic branch; integral splitting cannot be assumed. | Statement matches source; repaired integral rank argument not certified. | — |
| §6.8 `IsK3.IsArtinInvariantOne` (README:882) | k algebraically closed of characteristic p>0; IsK3(X/k). Rank 22, discriminants −9,+9,−81 at p=3; rank 20; these are arithmetic substitutions rather than geometric fixtures. | Definition consistent; current Checks do not evaluate it. | R09 |
| §6.8a `IsK3.tameInvariantDimension_ge_five` (README:898) | k algebraically closed; IsK3(X/k); G acts faithfully and symplectically, ∣G∣ invertible in k; in positive characteristic at least one of X,Y is not of Artin invariant one. G=1 gives 24; C₇ gives 6; order-21 character average gives 6; both σ=1 excluded from bound five; tame quotient need not be flat. | Trace domain is not supplied as written. | R03 |
| §6.9 `IsK3.tameMathieuCharacter` (README:914) | k algebraically closed; IsK3(X/k); G finite symplectic; char k=0 or p∤∣G∣. Identity trace 24; order-2 trace 8; order-7 trace 3; wild trace excluded; inverse pullback has the same fixed-point counts. | No defect found in these cases. | — |
| §6.10 `IsK3.charZeroSymplectic_bound` (README:929) | IsK3(X/k); char k=0; G finite and symplectic. Trivial group has 24 orbits; involution has 16; C₂₃ fails the five-orbit condition; nonclosed characteristic-zero field spreads. | No defect found in these cases. | — |
| §6.11 `IsK3.tameSymplectic_bound` (README:943) | IsK3(X/k); char k=p>0; G finite symplectic with p∤∣G∣; geometric hypotheses tested after algebraic closure. Both σ=1 allows four invariants; tame groups in p=2 have odd order; field extension preserves injectivity into Aut. | No defect found in these cases. | — |
| §7.1 `IsK3.IsPrimitivePicardClass` (README:967) | IsK3(X/k); λ a Picard class or relative Picard section. Zero class divisible by 2; generator versus twice generator in ℤ; n² divides d if an ample degree-2d class is divisible by n. | No defect found in these cases. | — |
| §7.2 `IsK3.picardMultiplication_closed` (README:983) | S Noetherian for the strongly projective assertion; X→S a K3 family; n>0. n=0 excluded; n=3 at p=3; primitive nonzero isotropic fibre versus 2F; root locus closed rather than open. | No defect found in these cases. | — |
| §7.3 `PolarizedK3Family` (README:1000) | d a positive integer; S a scheme. Constant family; d=0 excluded; local line representatives with Brauer obstruction; arrows retain no line-isomorphism scalar. | No defect found in these cases. | — |
| §7.4 `IsK3.amplePowerCohomology` (README:1017) | IsK3(X/k); L ample of square2d; d>0; m>0 for vanishing. m=0 excluded from positive vanishing; quartic h⁰(O(1))=4; negative powers have h⁰=0; χ(L^m)=dm²+2. | No defect found in these cases. | — |
| §7.5 `IsK3.cubeVeryAmple` (README:1031) | IsK3(X/k); L ample with L²=2d>0; Noetherian base and relative representative for the family clause. Quartic cube; degree-two cube has 11 sections and target ℙ¹⁰; p=2 retained; relative statement requires its base and representative. | No defect found in these cases. | — |
| §7.6 `k3HilbertLocus` (README:1045) | d>0; the Hilbert universal family with the specified polynomial. Quartic Veronese embedding; equality of canonical Picard section with zero; nonsmooth Hilbert point excluded. | No defect found in these cases. | — |
| §7.7 `polarizedK3HilbertAtlas` (README:1061) | d>0. Multiplication by 3 at p=3; frame torsor retains family identification; nonsplit real Brauer–Severi quartic has no global L³. | Global vector-bundle frame assertion fails for Picard sections. | R04 |
| §8.1 `polarizedK3ModuliStack` (README:1087) | d>0. Nontrivial stabilizers retained; no fine moduli claim; p=2 and p=3 atlas; quotient presentation must use corrected frame torsor. | Stack theorem supported; presentation depends on R04. | Use R04 correction |
| §8.2 `polarizedK3ModuliStack.separated` (README:1103) | d>0; both families polarized as7.3; a DVR for the extension clause. Identity over a trait; smooth special fibre nonruled by a two-form; separated does not mean proper; local representatives descend. | No defect found in these cases. | — |
| §8.3 `polarizedK3ModuliStack.coarse` (README:1116) | d>0. Finite stabilizers and nontrivial forms; coarse space is not asserted to represent the family groupoid. | No defect found in these cases. | — |
| §8.4 `polarizedK3ModuliStack.smooth` (README:1129) | d>0; base restricted to Spec ℤ[1/(2d)]. d=1 gives base ℤ[1/2]; p divides 2d excluded from smoothness assertion; flat pair locus is insufficient for smoothness. | No defect found in these cases. | — |
| §8.5 `polarizedK3_finiteField_finite` (README:1142) | k a finite field; d>0. Both degree and finite field fixed; twists counted; Br(k)=0 gives a line representative and a rational projective frame. | No defect found in these cases. | — |

### Suggested.lean variable and instance contexts

| Suggested.lean declaration | Explicit context | Instances tried | Result / change |
| --- | --- | --- | --- |
| `GeneralLinearGroup.oddCongruenceKernel_torsionFree`, line 17 | ell:ℕ; Fact ell.Prime; ell≠2; n:ℕ; A:GL(Fin n,ℤ_ell); reduction A=1; IsOfFinOrder A. No ambient variables. | n=0,1,2; ell=3; excluded ell=2 and A=−1; unipotent I+3E₁₂. | True as typed. R05 concerns tests, not its signature. |
| `finiteSubgroup.reduction_injective`, line 27 | Same explicit prime/oddness/dimension; H:Subgroup GL_n(ℤ_ell); [Finite H]. No ambient variables. | H=1; n=0; infinite cyclic unipotent subgroup would fail without finiteness; ell=2 subgroup {±1}. | True as typed; A B⁻¹ belongs to the finite subgroup and the kernel. |
| `finiteSubgroup.integral_reduction_injective`, line 37 | n:ℕ; H:Subgroup GL_n(ℤ); [Finite H]. No ambient variables. | n=0; H=1; H={±1}; reduction modulo 3 separates ±1. | True as typed. All matrix, group and coefficient carriers exist at the pins. |

### Named interface entries

Standing context and tested boundary cases are inherited from the explicitly identified parent target above.

| Interface entry | Context and instances | Result / change |
| --- | --- | --- |
| `IsK3.mk` | §1.1 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `IsK3.iff_conditions` | §1.1 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `IsK3.canonicalIso` | §1.1 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `IsK3.projective` | §1.1 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `relativePicardSpace.universal` | §2.1 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `relativePicardSpace.baseChange` | §2.1 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `relativePicardSpace.ext` | §2.1 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `relativePicardSpace.tangent` | §2.1 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `relativePicardSpace.arithmeticPoints` | §2.1 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `relativePicardSpace.universalFunctions` | §2.1 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `infiniteHeightDifferentialKernel.vectorField_unirational` | §2.1a standing context and instances above; identity, zero and base-change laws where applicable. | Primary kernel lemma remains waived; no extra scope defect. |
| `infiniteHeightDifferentialKernel.vectorField_rank` | §2.1a standing context and instances above; identity, zero and base-change laws where applicable. | Primary kernel lemma remains waived; no extra scope defect. |
| `infiniteHeightDifferentialKernel.exists_nonzero` | §2.1a standing context and instances above; identity, zero and base-change laws where applicable. | Primary kernel lemma remains waived; no extra scope defect. |
| `IsK3Analytic.mk` | §3.1 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `IsK3Analytic.iff_conditions` | §3.1 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `IsK3Analytic.congr` | §3.1 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `IsK3Analytic.canonicalSections` | §3.1 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `picardLattice.carrierEquiv` | §4.2 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `picardLattice.pair_class` | §4.2 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `picardLattice.halfNorm` | §4.2 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `picardLattice.ext` | §4.2 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `picardLattice.iso` | §4.2 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `picardLattice.numericalComparison` | §4.2 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `geometricPicardRank.closureIndependent` | §4.3 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `geometricPicardRank.baseChange` | §4.3 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `picardRank.eq_finrank` | §4.3 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `geometricPicardRank.closed` | §4.3 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `picardCycle_saturated` | §4.4 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `oddCongruence.coprimePowerDepth` | §4.5 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `oddCongruence.primePowerDepth` | §4.5 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `finiteSubgroup.reduction_injective` | §4.5 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `isSymplectic_iff_generator` | §5.1 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `symplecticAut.mem` | §5.1 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `isSymplectic_one_mul_inv` | §5.1 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `isSymplectic_baseChange_iff` | §5.1 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `symplecticRepresentation.map_mul` | §5.1 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `polarizedAut.mem_iff` | §5.2 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `polarizedAut.subgroup` | §5.2 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `polarizedAut.conjugate` | §5.2 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `polarizedAut.symplecticInclusion` | §5.2 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `polarizedAut.symplecticFiniteEtale` | §5.3 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `IsK3.picardRank_ge21_iff_eq22` | §6.0c standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `IsK3.genusOneJacobian_isK3` | §6.0c standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `tameCyclicFixedPointArithmetic.euler` | §6.1a standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `tameCyclicFixedPointArithmetic.fixed` | §6.1a standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `tameCyclicFixedPointArithmetic.extra_exclusions` | §6.1a standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `wildFixedLocusAlternatives.anticanonical` | §6.2a standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `wildFixedLocusAlternatives.kappaZeroQuotient` | §6.2a standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `wildFixedLocusAlternatives.kappaOneBase` | §6.2a standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `wildPrimeBound_fixedLocusRefinements.big` | §6.3a standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `wildPrimeBound_fixedLocusRefinements.nodal` | §6.3a standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `wildPrimeBound_fixedLocusRefinements.rationalPoint` | §6.3a standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `wildPrimeBound_fixedLocusRefinements.pencil` | §6.3a standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `wildPrimeBound_fixedLocusRefinements.noPTorsion` | §6.3a standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `supersingularPicardFaithfulness.kernel` | §6.4a standing context and instances above; identity, zero and base-change laws where applicable. | Primary source remains waived; no extra scope defect. |
| `supersingularPicardFaithfulness.ext` | §6.4a standing context and instances above; identity, zero and base-change laws where applicable. | Primary source remains waived; no extra scope defect. |
| `isArtinInvariantOne_iff_sigma` | §6.8 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `isArtinInvariantOne.congr` | §6.8 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `isArtinInvariantOne.baseChange` | §6.8 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `isArtinInvariantOne.disc` | §6.8 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `tameInvariantDimension.nonsupersingularQuotient` | §6.8a standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `tameInvariantDimension.involutionPencil` | §6.8a standing context and instances above; identity, zero and base-change laws where applicable. | Depends on uncertified corrected argument in §6.7d. |
| `tameInvariantDimension.supersingularTransfer` | §6.8a standing context and instances above; identity, zero and base-change laws where applicable. | R03: replace the trace input. |
| `tameInvariantDimension.artinGreaterOne` | §6.8a standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `isPrimitivePicardClass_iff_not_dvd` | §7.1 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `isPrimitivePicardClass.iso` | §7.1 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `isPrimitivePicardClass.baseChange` | §7.1 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `isPrimitivePicardClass.saturated` | §7.1 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `PolarizedK3Family.mk` | §7.3 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `PolarizedK3Family.pullback` | §7.3 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `PolarizedK3Family.ext` | §7.3 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `PolarizedK3Family.localRepresentative` | §7.3 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `PolarizedK3Family.fieldComparison` | §7.3 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `k3HilbertLocus.family` | §7.6 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `k3HilbertLocus.factor_iff` | §7.6 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `k3HilbertLocus.baseChange` | §7.6 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `polarizedK3HilbertAtlas.family` | §7.7 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `polarizedK3HilbertAtlas.cover` | §7.7 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `polarizedK3HilbertAtlas.frameTorsor` | §7.7 standing context and instances above; identity, zero and base-change laws where applicable. | R04: global L³ unavailable. |
| `polarizedK3HilbertAtlas.baseChange` | §7.7 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `polarizedK3ModuliStack.fibre` | §8.1 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `polarizedK3ModuliStack.quotientEquiv` | §8.1 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `polarizedK3ModuliStack.pullback` | §8.1 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |
| `polarizedK3ModuliStack.primitiveOpen` | §8.1 standing context and instances above; identity, zero and base-change laws where applicable. | No additional interface defect found. |

### Conventions and supplier-domain controls

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Field and smoothness conventions | Zero ring excluded; imperfect base; purely inseparable extension | Correct domains retained | — |
| Bilinear discriminant versus half-norm | Gram [4]: determinant 4, Q(H)=2; rational curve square −2; signature (1,21) negative determinant | Correct normalization | — |
| Cup/trace and exponential orientation | Quartic value +4; exp(2πiz) has positive winding +1; Rizov's auxiliary form has opposite sign | Correct distinction | — |
| Pullback composition | Two Wehler involutions: f*=S₂S₁, not S₁S₂ | Correct reversal; inverse pullback gives a left action | — |
| Contraction sign | σ(e₁,e₂)=1 gives e₂*,−e₁*; at p=2 minus equals plus | Correct | — |
| Genus-one supplier domain | ℙ¹×ℙ¹→ℙ¹; p=2,3 quasi-elliptic fibres | Genus omitted from definition | R01 |
| Genus-one canonical/Jacobian formulas on their intended domain | Wild torsion T retained; section–fibre matrix determinant −1; χ=2 yields O(−2) on ℙ¹ | Formulas match enriques-one; no equality of unrelated canonical bundles asserted | R01 fixes domain |
| Projectivity over arbitrary base | Disjoint union of ℙ^n over points; global line versus mere Picard section; qcqs base versus arbitrary base | Local/global and H-projective distinctions retained | R04 fixes later frame use |
| Mathieu retained-letter convention | Identity 24; involution 8 fixed letters and 16 orbits; order-23 element only two orbits | Correct | — |
| Finite-flat formal norm | Scalar u maps to u^degree; tame A₁ quotient has fibre rank jump 2→3 | Norm valid only within its finite-flat domain | R03 |
| Relative Galois versus absolute Galois | Identity real extension and conjugate skew quartic lines | Geometric invariants require absolute group | R08 |
| Tame SL₂ classification | A₄ has three involutions; SL₂(ℂ) has only −I | Binary qualifications necessary | R10 |

## Not verifiable

- **Lean elaboration:** no build or elaboration was authorized in this read-only pass. The audit checked literal signatures against pinned declarations and mathematical boundary cases; it does not claim a compiler run.
- **Settled primary-source limits:** `nygaard-vectorfields`, Lemma 3.3 (kernel input in §2.1a); `rudakov-shafarevich`, §8 Proposition 3 (Picard faithfulness in §6.4a); and `matsusaka-mumford`, Theorem 2 (separatedness) are waived. `shioda-transcendental`, Proposition 5, and `arapura-chern`, §7.5, are uncertified locator-only records. The accessible citations corroborating their uses were checked, but those five primary texts were not certified or reopened. The unused waived Liu entry creates no active verification request.
- **Corrected integral involution argument in §6.7d:** dolgachev-keum lines 607–608 and 643–647 use integral splitting/mod-2 steps that cannot be justified for arbitrary involutions; the swap matrix is a counterexample. The package explicitly rejects that inference and owns a replacement calculation. Its instruction to track all integral extension terms is not itself the completed replacement proof, so this pass does not certify that proof. The source's lemma locator exists and its conclusion matches the target; no false generic mod-2 assertion was found copied into the package.
- **Future supplier contracts:** all 25 declarations remain contracts, not implemented theorems at the library pins. Their absence today is accepted conditionally as instructed. Generic theory was checked for ownership and stated domains; completion of those future proofs is outside this review.
- No new missing-reference request is needed: every actively cited, nonwaived, non-uncertified source has a legal cached text and was consulted. No source extraction was copied into the package or report.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "db94ab66ff742f22f558692395ebadc9019975bc", "job": "RT-K3SurfacesAndSymplecticBoundedness~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
