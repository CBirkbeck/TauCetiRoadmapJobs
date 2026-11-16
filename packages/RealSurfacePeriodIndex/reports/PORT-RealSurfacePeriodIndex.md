# PORT-RealSurfacePeriodIndex

## Result

- Branch `roadmap/real-surface-period-index`, head `36cfe04a` (36cfe04ac267d3a2fc3c1a1ac7222d86d98e4535), one commit on `bf232a2`: `RealSurfacePeriodIndex: roadmap (README, Suggested.lean, metadata)`. It adds `TauCetiRoadmap/RealSurfacePeriodIndex/{README.md,Suggested.lean,metadata.toml}` and nothing else.
- Build, `lake build TauCetiRoadmap.RealSurfacePeriodIndex.Suggested`: `Build completed successfully (18332 jobs).` with 8 warnings, all `declaration uses 'sorry'` (lines 85, 94, 106, 117, 128, 138, 148, 161). No other warning.
- Gate: `gate RealSurfacePeriodIndex: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check, whole output: `depcheck: 264 roadmaps, 2584 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- Citation resolver on the ported README: no cross-roadmap citation and no Lean name found nowhere.

## Draft pull request body

This pull request adds the roadmap **Period and index on real surfaces**. It builds Olivier Benoist's solution of the period-index problem for function fields of real algebraic surfaces, starting from the Brauer groups, central simple algebras, orderings, real closed fields and quadratic forms that Mathlib and Tau Ceti already have. The foundation is a general theory of real function fields: the space of orderings with the Harrison topology, real closures at a given ordering, signatures as functions of a varying ordering, the Elman–Lam u-invariant with Pfister's local–global principle, the Tsen–Lang theorem, the period and index of a Brauer class, and the classical theorems of Witt, Springer, Amer–Brumer, Albert and Elman–Lam. On top of it the roadmap gives Benoist's Hodge-theoretic proof of de Jong's theorem (period equals index over function fields of complex surfaces) and the bound ind | 2·per over any real closed field. It then builds double covers branched along curves with prescribed real topology, uses them to split classes of period two, and reaches the end theorems. Period equals index on real surfaces without real points (Theorem 0.3), and for classes that vanish at every real point (Theorem 0.4). Unramified classes satisfy a topological criterion and have ind ∈ {per, 2·per} (Theorem 0.5). The real Enriques surfaces with ind ≠ per are classified (Theorem 0.6), and the criterion fails over the real Puiseux field (Proposition 0.7). Quadratic forms of dimension five are isotropic over real surfaces without real points (Theorem 0.10), the Elman–Lam invariant is at most 4 in transcendence degree 2 and equals 4 for function fields of real surfaces (Theorem 0.12), and degree-four del Pezzo surfaces over real curves without real points have rational points (Theorem 0.13). Benoist's argument has several gaps and misprints. The roadmap records each one in a source-corrections section and plans the corrected statements instead. In particular, his Propositions 4.4 and 4.5 are replaced by exact criteria for a given cover, and his Proposition 6.6 is kept in its stated generality. `Suggested.lean` states eight headline theorems at the pins, among them de Jong's theorem, the real norm bound, Theorems 0.3, 0.10 and 0.12 and the birational form of Theorem 0.4. Its docstring names the headlines that need carriers not yet at the pins: Brauer groups of schemes, equivariant cohomology of real varieties, Enriques and K3 surfaces.

## Dependencies still in pull requests

By name, all earlier than this roadmap in the merge order except the last:
HeightsRationalPointsAndObstructions, PurityForFlatCohomology, LefschetzPencilsAndVanishingCycles, MotivesAndAlgebraicCycles, AlgebraicTopologyPartII, PELModuli, ShimuraData, K3BlochGroups, WeilConjectures; and EnriquesSurfaces. EnriquesSurfaces is not in the merge order. It is another author's open pull request and adds a new roadmap folder, which this brief allows as a supplier. Each cited section was read at that pull request's head: EnriquesSurfaces §§1.1, 1.3 (c₁ : Pic ≅ H²(S(ℂ), ℤ)) and 1.4 (π₁ = ℤ/2, H³ = ℤ/2, the Brauer term of the 2-primary Kummer sequence).

The suppliers on main are SchemeAndStackFoundations, ResolutionOfSingularitiesCharacteristicZero, AlgebraicModuliForArithmeticGeometry, AlgebraicTopology, ComplexComparisonPartII, AffineMorseLefschetz, QuadraticFormInvariants, RepresentationTheory/SemisimpleAlgebras, FormalLaurentPuiseux, StableReduction, ModularCurves and PurityOfBranchLocus. RealAlgebraicGeometry is under `Completed/`. No cited id is defined only by an open revision.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already had the required form: one definition with a real body (`HasZeroTotalSignature`) and eight headline theorems. It had no padding, no sorry'd data, no `set_option` and no examples. The docstring lists the headlines that cannot be stated at the pins (the scheme form of Theorem 0.4, Theorems 0.5 and 0.6, Proposition 0.7, and the del Pezzo form of Theorem 0.13), each with the carrier it lacks. No headline that is statable at the pins is missing from the file.

Lean changes:
- `HasZeroTotalSignature` is now phrased with Tau Ceti's `QuadraticMap.IsTotallyIsotropic` (`TauCeti/LinearAlgebra/QuadraticForm/TotallyIsotropic.lean:51`, `∀ v ∈ W, Q v = 0`). It previously restated that condition inline, so the definition is unchanged; the file gains the import `TauCeti.LinearAlgebra.QuadraticForm.TotallyIsotropic`.
- `index_eq_orderOf_of_isAlgClosed` and `index_dvd_two_mul_orderOf_of_isRealClosed` now take the coefficient field `k`, respectively `R`, in its own universe instead of the universe of `K`. The README states both for any algebraically closed `k` of characteristic 0 and any real closed `R`, so the Lean statements now match that generality.
- Two docstring lines were reflowed, and one sentence on the universes was added to the module docstring.

The `module` / `public import` / `@[expose] public section` header is kept. Main has both header forms, and the gate accepts this one.

**Signature check.** I appended `#check @name` for all nine declarations to the module, built it once, compared each elaborated type with its README statement, and then removed the lines. The clean file was rebuilt afterwards. Every type matches its README statement. The binders `[Invertible 2]`, `[FiniteDimensional K V]`, `[Algebra.EssFiniteType …]`, `Algebra.trdeg … = 2` (or `= 1`) and `¬IsSemireal K` are present exactly where the README has them. Nothing was lost. The only change is that `k` and `R` are now in universe `u_2`, separate from `K` in `u_1`.

## Supplier replacements and duplication removals

- **Supplier replacement (Lean and README):** the inline totally-isotropic condition in `HasZeroTotalSignature` was replaced by Tau Ceti `QuadraticMap.IsTotallyIsotropic`. That declaration is added to the Tau Ceti contract, to the *Needs:* line of §0.6, to the Layer 0 Dependencies and to the scope bullet on quadratic forms.
- **Supplier attribution:** FormalLaurentPuiseux on main has no declarations named `puiseuxField`, `ramifiedEmbedding` or `puiseuxField_isAlgClosed`; its L4 and L5 are prose sections. The README now cites FormalLaurentPuiseux L4 (ramified levels and the Puiseux field) and L5 (the root theorem) by section. The objects themselves are consumed as the Tau Ceti declarations `TauCeti.puiseuxField`, `LaurentSeries.ramifiedEmbedding` and `TauCeti.puiseuxField.instIsAlgClosed`, all three checked at the pin.
- **Duplication removals:** none were needed. Sweep by object over main, the open roadmap heads (`roadmaps grep` over all 458 and the 240 local checkouts) and the board's packages, for: spaces of orderings and the Harrison topology, real closures at an ordering, signatures at orderings, Pfister's local–global principle, the u-invariant and Elman–Lam, the Tsen–Lang theorem and C_i fields, Springer's theorem for complete DVRs, Amer–Brumer, the Albert criterion, period and index of a Brauer class, Artin–Lang, de Jong's theorem, and a real closed Puiseux field.
  - Every hit is either an unrelated use of the words (Harrison homology, Harrison-Trainor, "U-invariant", Springer's odd-degree theorem in QuadraticFormInvariantsPartII §2.5, the number-field period–index input of BorelRegulators §3.1) or a citation of this roadmap.
  - The one real second owner is the Tsen–Lang theory, covered under Unresolved.
- Pinned declarations: all 36 Tau Ceti (including the added `QuadraticMap.IsTotallyIsotropic`) and 35 Mathlib name-and-line locators in the two contracts were compared with the pinned files, and each cited line carries the cited declaration, with namespaces checked. Further pin checks:
  - `AlgebraicGeometry.Scheme.Hom.smoothLocus` is at `AlgebraicGeometry/Morphisms/Smooth.lean:300`.
  - `RingPreordering` and `RingPreordering.IsOrdering` are deprecated at the pin, as the contract says.
  - `LinearOrder.ofAddSubmonoid` is the `to_additive` of `LinearOrder.ofSubmonoid`.

## Fixes an upstream reviewer would make (made)

1. **ModularCurves "4D" is a former-numbering id.** ModularCurves on main maps "Layer 4D" to "Layer 0.9 and Layer 3.6" in its old-to-new table. Miracle flatness for finite morphisms between regular local schemes of equal dimension is in §0.9. All four citations (scope, contract, §8.1 and its *Needs:*, Layer 8 Dependencies) now read ModularCurves §0.9.
2. **FormalLaurentPuiseux name attributions** were unsourced, since the three names do not occur in that README. They were repaired as above.
3. **AffineMorseLefschetz "§A3/§A5"** are labels in parentheses in that roadmap's layer titles, not sections. The contract now says "A3, its Layer 3" and "A5, its Layer 6", and the other citations say "A3" and "A5".
4. **Source-correction labels ran E1–E26 with E16 and E19 missing**, which shows that entries were deleted. They were renumbered consecutively E1–E24: E17→E16, E18→E17, E20→E18, E21→E19, E22→E20, E23→E21, E24→E22, E25→E23, E26→E24. Each in-text "source correction E…" still points at the entry it named; I checked all nine moved labels against their sections.
5. **Tsen–Lang ownership wording.** The README said QuadraticFormInvariantsPartII "imports" §§5.1, 5.4–5.6 from §0.7 as "their single owner". At its head that roadmap states those sections itself, so the scope sentence now says the theory is owned here and consumed there. Downstream consumers lists its Layer 5 as the consumer and keeps the statement that nothing flows from it to this roadmap.
6. **Lean generality** of de Jong's theorem and the norm bound: see the Lean changes above.

## Unresolved

- **Tsen–Lang has two plans.** QuadraticFormInvariantsPartII (open; merge order line 422, this roadmap line 247) states C_i fields, Lang–Nagata, algebraic extensions and the Tsen–Lang theorem in its §§5.1, 5.4–5.6. Its line 118 says this roadmap's "Layer PI.0" takes Tsen–Lang from it. That is a mutual handoff, and "Layer PI.0" does not exist here (it means Layer 0). By the merge-order rule this roadmap, the earlier one, is the owner (§0.7). That pull request should cite §0.7 and correct its "Layer PI.0" reference; this port cannot edit it.
- **Three declared supplier gaps are still unprovided at the heads read:**
  - `gap:picard-cokernel-torsion-free`: MotivesAndAlgebraicCycles §7.8 uses the torsion-free cokernel of the divisor class map inside its proof but does not state it as a named result.
  - `gap:real-artin-comparison`: ComplexComparisonPartII §C6.3 is over ℂ only.
  - `gap:at2-stratified-pair-transport`: AlgebraicTopologyPartII §16.2 still takes invariant control data as a hypothesis.

  The `What X must provide (gap:…)` form is used on main (AlgebraicModuliForArithmeticGeometryPartII, IndexTheory, ArithmeticGaloisRepresentations), so they are kept as they were.
- **Items the final package review left to human reviewers:**
  - §§5.5 and 5.8 and source corrections E3 and E23 replace B19's Propositions 4.4 and 4.5 and declare Theorem 0.6 (ii) vacuous. No refereed source states these corrections.
  - Thirteen works are cited by locator without their text: BCR, ARA75, SPR55, EL73, BRO80, DK96, DIK00, CTP90, SCH94, SER06, GG73, BRE97 and DIM85.
  - §§6.5, 6.6 and 9.13 are classical inputs whose proof sketch is the cited theorem itself.
- **Ownership against open pull requests** was checked for the 240 roadmaps with local checkouts and, through `roadmaps grep`, for all 458 open heads. No declaration of `Suggested.lean` shares a fully qualified name with a declaration in any readable roadmap.
- I found no suspicious instruction in any text I read.

## Adversarial mathematics pass

Each row gives the statement, the instances tried and the values computed on each side. "Sound" means every computed value agrees with the statement and with the other Checks on the same object. Where a row says that no change was needed, the package text was kept.

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| Convention ℤ(j), ω | G acting on ℤ by (−1)^j | H¹(G, ℤ(1)) = ℤ/2 ∋ ω; H^q(G, ℤ(1)) = 0, ℤ/2, 0, ℤ/2 for q = 0..3 | sound |
| Convention μ_n ≅ ℤ/n(1) | k ↦ exp(2πik/n), conjugation | conj(exp(2πik/n)) = exp(−2πik/n), so σ acts on ℤ/n(1) by k ↦ −k, which is the sign twist | sound |
| Convention nonreal ⇔ `¬ IsSemireal` | 𝔽₃, ℂ, ℝ(t) | `IsSemireal` is "1 + s ≠ 0 for every sum of squares s" (Mathlib Defs:38). 𝔽₃: 1+1+1 = 0, so not semireal and −1 = 1+1. ℂ: −1 = i². ℝ(t): semireal | sound |
| Convention per = `orderOf`, ind = `TauCeti.Algebra.index` | ℍ over ℝ; M₂(ℍ) | orderOf = 2 (`TauCeti.Quaternion.orderOf_mk_eq_two`); index 2 for both, although deg M₂(ℍ) = 4 | sound |
| §0.1 X_F | ℝ; ℂ; ℚ(√2); ℝ(t); 𝔽₃ | 1 point; ∅; 2 points (sign of √2); Σ squares contains neither t nor −t, so it is not an ordering; ∅ (−1 = 1+1) | sound |
| §0.2 compactness, limits | F_n = ℚ(√p₁,…,√p_n) | \|X_{F_n}\| = 2ⁿ, restriction 2-to-1 and onto; Z_n = {−1 > 0} empty for all n; Z_n = {√p₁ < 0} has 2ⁿ⁻¹ points and a nonempty limit | sound |
| §0.3 real closure at P | ℝ; ℚ; ℂ ⊃ ℝ; Br(R) | (ℝ, id); real algebraic numbers; ℂ not real closed; Br(R(i)/R) = Rˣ/R_{>0} = ℤ/2 | sound |
| §0.4 signature at P | ⟨1,1⟩, ⟨1,−1⟩, ⟨−1,−1⟩ over ℝ; ⟨1,−t⟩; ⟨√2⟩ | 2, 0, −2; 0 at t > 0 and 2 at t < 0; −1 at √2 < 0 | sound |
| §0.5 survival locus | trace forms of M_d, ℍ, M_{d/2}(ℍ); (−1, t) over ℝ(t) | signatures d, −2 and (d/2)(−2) = −d, the off-diagonal pairs being hyperbolic; Z((−1, t)) = H(−t); Z(0) = ∅ | sound |
| §0.5a Artin–Lang | x²+y²+z² = −1; x²+y² = 0; ℚ[t]/(t²−2) | V(ℝ) = ∅ and −1 is a sum of 3 squares; (y/x)² = −1 with only the singular real point; two orderings but no ℚ-point | sound |
| §0.6 u, `HasZeroTotalSignature` | u(ℝ), u(ℂ), u(ℝ(t)), u(𝔽₃), u(ℂ(x,y)); ⟨1,−1⟩, ⟨1,1⟩, ⟨1,1,−1⟩, ⟨1,0⟩ over ℝ; V = 0 | 0, 1, 2, 2, 4. W = {x = y} has dim 1 = 2/2; ⟨1,1⟩ has no isotropic line; 2·dim W = 3 is impossible; ⟨1,0⟩ holds through the radical line and is isotropic; W = ⊥ satisfies 2·0 = 0 | sound; now phrased with `QuadraticMap.IsTotallyIsotropic` |
| §0.6a Pfister local–global | ⟨1,−(1+t²)⟩; ⟨1,−t⟩; ⟨1⟩ over 𝔽₃; W(ℝ) | 2q hyperbolic, so order 2; signature 2n at t < 0, so infinite order; order 4 = 2²; ℤ, torsion-free | sound |
| §0.7 Tsen–Lang, C_i | d = 0; ℂ(x) with ⟨1,x⟩; ℂ(x,y) with ⟨1,x,y,xy⟩; ℝ; Lang–Nagata over ℂ with r = 2, d = 2, N = 5 | a constant has no zero, so d ≥ 1 is needed; 2 = 2¹ variables anisotropic; 4 = 2² anisotropic; Σ x_i² anisotropic for all N; height ≤ 2 < 5 gives a zero | sound |
| §0.8 u ≤ 2, transcendence degree 1 | ℝ(t) | ⟨1,−(1+t²)⟩ of dim 2 attains the bound | sound |
| §0.9 Witt | conic x²+y² = −1; (−1,t); (−1,1+t²) | Br = 0 (nonreal); nonzero at t < 0; zero | sound |
| §0.10 Springer | ⟨1,t⟩ and ⟨1,1⟩ over ℂ((t)); ⟨1,−1⟩ ⊥ t⟨1⟩ over ℝ((t)) | residue forms ⟨1⟩, ⟨1⟩, so anisotropic; isotropic; zero (1,1,0) with only one residue form isotropic | sound |
| §0.11 Amer–Brumer | (⟨1,−1⟩, ⟨1,−1⟩); (⟨1,1⟩, ⟨1,−1⟩); x²+xy+y² over 𝔽₂ | common zero (1,1); ⟨1+t, 1−t⟩ anisotropic since t²−1 is not a square; (1+t)(x²+xy+y²) anisotropic since 𝔽₄ ⊄ 𝔽₂(t) | sound |
| §0.12 period and index | ℍ; M₂(ℍ); 0; Albert's class over ℝ(x,y); ℝ ⊂ ℝ(t) and ℝ ⊂ ℂ(t) | (2,2); ind 2 at degree 4; (1,1); per 2, ind 4; ind 2 → 2 and 2 → 1, both dividing; the reverse bound needs [L:K] finite | sound |
| §0.13 Albert | a = b = c = d = −1; the normal form | ⟨−1,−1,−1,1,1,1⟩ isotropic and (−1,−1)⊗(−1,−1) ≅ M₄(ℝ) has ind 1; ex₃ ≡ −ab, and ex₆ ≡ cd ⟺ −x₁⋯x₆ is a square; Nrd(i) = 1 while i² = −1 | sound |
| §0.14 Elman–Lam | ℝ(x,y); π = ⟨1,−(1+x²)⟩⊗⟨1,−y⟩; 𝔽₃ | u(F(i)) = 4 gives u ≤ 6; π(x,1,0,0) = −1 and π(0,0,x,1) = y, with π anisotropic and torsion, so I² is not torsion-free; u(𝔽₉) = 2 gives u(𝔽₃) = 2 ∈ {0,1,2,4,6} | sound |
| §0.15 Pfister criterion | nonreal K = ℂ(x,y) | Br[2] consists of quaternion classes of index ≤ 2, and u = 4 ≤ 4 | sound |
| §1.1 U_α | (x,y) on 𝔸²; 2α; ℙ²_ℝ | U = 𝔸² ∖ {xy = 0}; U = 𝔸²; Br = ℤ/2 ↪ Br(ℝ(x,y)) (ℍ stays division) | sound |
| §1.2 Kummer and topological sequences | Spec ℝ; ℙ¹_ℂ | H²_G = 0 and H³_G = ℤ/2 = Br(ℝ)[2]; H² = ℤ/n = Pic/n, so Br[n] = 0; κ(O(1)) = c₁ mod 2 | sound |
| §1.3 cl_R(υ(e)) = [e]₁ | Spec ℝ; e = ω | both sides 0; untwisted formula gives ω² ≠ 0, twist adds ω², 1 + 1 = 0 = H²_G(pt, ℤ(1)) | sound |
| §1.4 evaluation | (−1,x) on 𝔾_m; n = 2, 4 | Θ = {x < 0}; Θ(2α) = ∅; [α̃]₀ = 1_Θ for n = 2 and 0 for n = 4 | sound |
| §1.5 algebraically closed extension | ℚ̄ ⊂ ℂ with (x,y); ℝ ⊂ ℂ | 2 = 2; 2 against 1, so algebraic closedness is needed | sound |
| §1.6 Azumaya models | ℍ ⊗ ℝ[t]_(t); M₂(ℍ); (−1,t); the order O ⊂ M₂(ℂ(t)) | fibre index 2 = d; degree 4 kept with fibre index 2; residue −1 ≠ 1, so no model; O/tO has dim 4 with radical J (x² = y² = xy = yx = 0) and (O/tO)/J ≅ ℂ × ℂ, so O is not Azumaya | sound |
| §1.7 Saltman | (s,t); (1+t,s); (−1, 1+s²+t²) | r = 1, while r = 0 leaves a residue of valuation 1; u = 1+t; unramified and nonzero, since otherwise 1+s² would be a square in ℝ(s) | sound |
| §1.8 de Jong's reduction | l = 2, s₀ = s₁ = x | fibre over 0 is z² = x, irreducible of degree 2; fibre over 1 is (z−x)(z+x), two degree-1 components; so the specialisation is taken at 1 | sound (E24) |
| §1.9 extension, injectivity | S²; ℝ² ⊂ ℝℙ²; ℙ² ⊃ 𝔸²; quadric cone | 0 → 0; 0 → 𝔽₂; ℤ → ℤ → 0; Pic = 0 against Cl(V) = ℤ/2, not onto | sound |
| §2.1 H²·K_X | ℙ² with O(1); quintic with O(1) and O(2); n = d = 1 | 2(−3−1) = −8; 5 = 5 excluded; 20 > 10; T_b = Bl_{A²} S of degree 1 | sound |
| §2.2 Kodaira–Spencer and Griffiths | constant family; quartic surfaces | κ = 0; rank 34 − 15 = 19 < 20 = h¹(T_T), h^{2,0} = 1, h^{1,1} = 20 | sound |
| §2.3 τ = 0 | S = ℙ² | H³ torsion-free, τ_S = 0 | sound |
| §2.4 compatible lift | α̃ = 0; n = 1 | β = 0; every β | sound (E2) |
| §2.5 Voisin cone | p*σ with σ not of type (1,1) | p_*p*σ = dn·σ, Hodge type preserved, so the cone must be in ker p_* | sound (E16) |
| §2.6 lattice cosets | ℝ, ℤ, n = 2 | 1 ∈ (0,∞) ∩ (1+2ℤ); the ball of radius ½ misses 1+2ℤ; ℤ×{0} misses {y > 0} | sound |
| §2.7 dense splitting | α = 0 | every b | sound |
| §2.8 unramified per = ind | Enriques n = 2; d alone; 2T₀ | gcd(2d, 2d+2) = 2; ind \| 4 only; length 2 against degree 1, so reducedness is used | sound |
| §2.9 de Jong, `index_eq_orderOf_of_isAlgClosed` | k = ℂ, K = ℂ(x,y), A = (x,y); A = M_n(K); k = ℚ̄ | 2 = 2; 1 = 1; (x,y) over ℚ̄(x,y) has 2 = 2 | sound; Lean `k` now in its own universe |
| §2.10 norm bound, `index_dvd_two_mul_orderOf_of_isRealClosed` | Albert's class; odd n; R = real algebraic numbers | 4 \| 2·2; ind ∈ {n, 2n} with the same primes gives n; R(i) = ℚ̄ is algebraically closed | sound; Lean `R` now in its own universe |
| §3.1 finite cover | z² = xy; R = D = ∅; discriminant | A₁ at the origin; S ⊔ S; `QuadraticAlgebra` O b 0 has discr 0² + 4b = 4b | sound (E1) |
| §3.2 incidence model | crossing charts; 𝔸²_ℝ, s = 1 | y = xa², x = yc², c = a⁻¹; T = 𝔸² ⊔ 𝔸², not proper over ℝ | sound (E17) |
| §3.3 Stein factorisation | Čech computation | k[r, rx, rx²] with z = rx and s = rx² gives z² = rs; exceptional curve has self-intersection −2 | sound |
| §3.4 strata | smooth point of R off D | κ[z]/z² has length 2 and 1 geometric point; S* fibres have 2 points | sound |
| §3.5 pushforward | i = 4 | components of T(ℂ) and S(ℂ) correspond | sound |
| §3.6 equivariant image | p_* onto in H¹ of real loci | every class is a pushforward | sound (E11) |
| §4.1 parameters | ℙ², O(1), l = 2, N = O; N = O(−1); odd l | L = O(1), H¹(O(2)) = 0, x²+y²+z² meets the line in 2 conjugate points; L = O is not very ample; A^{l/2} undefined | sound |
| §4.2 point of B | strict transform of C | v = ±√a₁·g·w, meeting over {g = 0} | sound |
| §4.3 anti-invariant summand | z = rv/w | √a₁·r·g, or r·g after rescaling | sound |
| §4.4 Assumption 5.2 | ℙ², R a line, N = O(−1); N = O | H⁰(O(−4)) = 0, H⁰(O(−1)) = 0, H¹(ℙ¹, O(−1)) = 0; fails when p_g > 0 | sound |
| §4.5–§4.6 | rational S | h¹ ≤ 0; the cup-product step is empty | sound |
| §4.7 KS through normal bundles | C = ∅; quartic containing a line | 0 = 0; Noether–Lefschetz divisor of codimension 1 = h^{2,0} | sound (E12) |
| §4.8 Noether–Lefschetz dimension | rational S | φ_λ onto | sound |
| §4.9 blow-ups | ℙ², R a line, A₀ = O(2) and O(1); P = Q = ∅ | cl_R(N) = 0; cl_R(N) = μ*h ≠ 0; (i) fails when H⁰(A₀ ⊗ K) ≠ 0 | sound |
| §5.1 Assumption 4.1 | (−1, x/z) on ℙ² | residues −1 along x = 0 and z = 0; Θ = {x/z < 0}; H¹(Ψ) = 0; cl_R(line) generates, cl_R(R) = 2h = 0 does not | sound |
| §5.2 unramified pullback | split cover | α_T = (α, α), and ℝ(S) × ℝ(S) is not a field | sound (E18) |
| §5.3 τ ∪ ω = 0 | T(ℝ) = ∅ | only the norm step is needed | sound |
| §5.4 boundary component | t = 0, t = 1, mixed (0,1); Möbius loop | 0; [e]₁; (0, e₁) against the printed (e₀, e₁); w₁ = 1 = [e]₁(γ) | sound (E3) |
| §5.5 vanishing criterion | the Enriques K3 with B Vandermonde in 1, 2, 3 | det = (2−1)(3−1)(3−2) = 2 and every 2×2 minor nonzero; X(ℝ) is 8 spheres modulo ±, so 4; c_Ψ = h₁ has coefficient sum 1 ∉ J, so τ ≠ 0; c_Ψ = h₁ + h₂ ∈ J, so τ = 0 | sound |
| §5.6 Picard correction | α̃ = 0; α̃ = κ(N′) | μ = 0; η = cl(N′) | sound |
| §5.7 curve adjustment | [d]₁ = 0 | ν = 0 | sound |
| §5.8 integral adjustment | t = 0; t = 1; Enriques h₁ + h₂ | θ = θ₁+2μ+2ν; θ = θ₁+2μ+2M+2ν; (c) holds with φ_Ψ = L | sound (E3, E4, E5, E21) |
| §6.1 squared positivity | rescaling by −1; zero section | positive and negative swap; zero is neither | sound |
| §6.2 Assumption 6.1 | S² with one circle; torus with a null-homotopic circle; Ξ = ∅ | holds (closed disc connected); fails (iii); empty embedding | sound |
| §6.3 stability | small isotopy | conditions kept | sound |
| §6.4 blow-ups | torus with a, b, c ~ a+b | pairwise intersections 1, 1, 1; total class 2(a+b) = 0; Ξ′ = T² # 3ℝℙ² with dim H¹ = 5; strict transforms μ*(·) − 2Σe_i ≡ 0 | sound |
| §6.5–§6.6 Nash, Bröcker | ℝℙ²: two lines; a degree-1 divisor | l₁l₂/(x²+y²+z²); cl_R ≠ 0, so excluded | sound (cited inputs) |
| §6.7 branch section | ord_R(t) | −1 + 1 = 0; the printed choice gives order 2 | sound (E20) |
| §6.8 cover hypotheses | rv² = sw² | real solutions need rs ≥ 0, so p(T(ℝ)) ⊂ Ξ | sound (E22) |
| §6.9 Green over ℝ | (0,2)-part 0; ten-sphere quartic | Ω is the whole space; invariant (1,1) part has rank 1, so the hypothesis fails | sound |
| §6.10 vanishing variation | ℙ¹×ℙ¹ → ℙ²; conic C | p*h = (1,1), p_*(a,b) = a+b, lattice ℤ(1,−1), det 1 against −2; p_*λ_van = 2h − 2h = 0 | sound |
| §6.11 stratification | R = ∅; R smooth with R ∩ D = ∅ | P = ∅; a single stratum | sound |
| §6.12 transport | β = cl(O(1,0)) | β mod 2 = (1,0) ≠ 0 = p*α̃, so it is normalised away | sound (E19) |
| §6.13 degree-two splitting | S(ℝ) = ∅; 4 \| n; δ with a constant part | splitting cover; evaluation 0 on Ψ; p_* breaks unless δ ∈ _van | sound |
| §7.1 uniform evaluation | n = 2, 4, 6 | t = 1, 0, 1 | sound (E8) |
| §7.2 induction | cor(α_T) | 2α of period n/2; n = 2 gives α_T = 0 | sound |
| §7.3 sufficient condition | n even | ind \| 2·(n/2) = n | sound |
| §7.4 Theorem 0.3, `index_eq_orderOf_of_not_isSemireal` | ℝ(x,y,z \| x²+y²+z² = −1); ℂ(x,y) as an ℝ-algebra; ℝ(x,y) with Albert's class | nonreal, ind = per; trdeg 2 and nonreal, consistent with de Jong; 4 ≠ 2 but excluded because ℝ(x,y) is real | sound |
| §7.5 real closures and real points | (−1,−1) on U | nonzero over both R₀ and K | sound |
| §7.6 Theorem 0.4, `index_eq_orderOf_of_forall_isRealClosed` | (−1, 1+x²); ℍ; (1+x², y); nonreal K | 0; excluded (survives everywhere); hypothesis holds and per = ind = 2 (residue 1+x² at y = 0); hypothesis empty, giving Theorem 0.3 | sound |
| §7.7 sufficient half of 0.5 | ℙ²_ℝ with ℍ | 4 lifts; ξ₀ has components (1,0,0) and ξ₀ + κ(O(1)) has [·]₁ = h; ind = per = 2 | sound |
| §7.8 u ≤ 4, `not_anisotropic_of_hasZeroTotalSignature` | 5-dim nondegenerate over real K; ⟨1,1,1,−1,−1,−1⟩; nonreal K | predicate false (2·dim W = 5); isotropic; classical bound | sound (E9) |
| §7.9 anisotropic witness | 𝔪 = (u²+1, v) | w′²+1 = (u²+1)²/(4u²); y₁ ≡ 2(1+i)v and y₂ ≡ −2(1+i)v − 2(u²+1), det 4(1+i); with w, y₂ ≡ −y₁ since α₁ = α₂ = −(1+i); z₁ = u²+1 gives y₁ ≡ (3+2i)z₁ | sound (E10) |
| §7.10 u = 4, `exists_anisotropic_hasZeroTotalSignature` | ℝ(x,y); ℂ(x,y); algebraic closure of ℝ(x,y) | ⟨1,y₁,−y₂,−y₁y₂⟩ of signature 0; ⟨1,x,y,xy⟩ with the predicate vacuous; no anisotropic form on K⁴, so finite generation is needed | sound |
| §7.11 Theorem 0.10, `not_anisotropic_of_not_isSemireal` | ⟨1,1,1,1,1⟩ over ℝ(x,y); ℂ(x,y,z); algebraic closure of ℝ(x,y) | anisotropic (real); dim 8 anisotropic (trdeg 3); dim ≥ 2 isotropic | sound |
| §7.12 del Pezzo of degree 4 | h⁰ count; cubic | 5, 13 and 15 − 13 = 2 quadrics; 10 = 10, no quadric | sound |
| §7.13 pair of quadrics, `exists_common_zero_of_not_isSemireal` | ℂ(x,y); ℝ(x); K(t) | ⟨1,x,y,xy,0⟩ and ⟨0,0,0,0,1⟩ have no common zero (trdeg 2); ⟨1,1,1,1,1⟩ has no zero (real); K(t) is nonreal of trdeg 2, so q₁ + tq₂ is isotropic and Amer–Brumer gives a common zero | sound |
| §8.1 U₀ | p étale | U₀ = U | sound |
| §8.2 alternating cover | n = 2; simple branch point | V = S ∖ Δ; m = 1 | sound |
| §8.3 trace lift | κ(O(1,0)) on ℙ¹×ℙ¹ | η = cl(O(1,0)); η = ζ = 0 gives 0 ≠ α̃ | sound |
| §8.4 sign-corrected lift | n = 4, ζ = [e₁] | ψ(e₁) = (−3,1,1,1) = Tr·𝟙 − 4e₁; −ψ(ζ) = (3,−1,−1,−1) ≡ (3,3,3,3) = p*α̃; +ψ gives (1,1,1,1) | sound (E6, E7) |
| §8.5–§8.8 circle cover, correction | n = 2, 4; m_i = 2, 4; Θ₀ = ∅ | stalks ℤ/4 and 𝔽₂²; m_i = 2 contributes and m_i = 4 does not; empty statement | sound |
| §8.9–§8.10 obstruction | T(ℝ) = ∅; period 4 on Enriques | [ξ]₁ algebraic; ind = 2n = 4, consistent with §9.4 | sound |
| §9.1 image of ρ | S(ℝ) = ∅; ℙ²_ℝ | 0; H¹_G = {0, ω} with [ω]₀ = 1, so the image is 𝔽₂² | sound |
| §9.2–§9.3 halves, Br killed by 4 | S(ℝ) = ∅; cor∘res | both halves empty; 4α = cor(2·res α) = 0 with Br(S_ℂ) = ℤ/2 | sound |
| §9.4 period 4 | ind \| 2·2, per = 4 | ind = 4 | sound |
| §9.5 empty-half detector | H¹_G of order 4 | the unique nonzero δ with [δ]₀ = 0 (0 also has [0]₀ = 0) | sound (E15) |
| §9.6–§9.7 | spheres and tori; w₁ ≠ 0 | cl_R onto, ind = per; a₁ ∉ w₁^⊥ exists | sound |
| §9.8 deg(w₁²) = 0 | 2 ℝℙ²; 1 ℝℙ²; 2 Klein bottles; 4 ℝℙ² | 1+1 = 0; 1, excluded; 0+0 with w₁ ≠ 0; 0 | sound (E23) |
| §9.9 one nonempty half | correcting component Σ | deg(a ∪ w₁) = 1 + χ(Σ) = 1 + 1 = 0 | sound |
| §9.10 Theorem 0.6 | 4 ℝℙ² with an empty half; spheres and tori | nonorientable but ind = per; no class | sound (E23) |
| §9.11 Puiseux field real closed | t^{1/2}; −t; X³ − t; n·t | (t^{1/2})² = t; leading coefficient −1, not a square; one root in K and two in K(i) ∖ K; n·t < 1, non-archimedean | sound |
| §9.12–§9.15 Puiseux counterexample | sign quadrants; t = 0; quaternion at a real-closed point | 4 components; normalisation z² = w² − u² − v²; (f,g) vanishes iff f > 0 or g > 0 | sound (E13, E14; cited CTP90, BCR) |
| Lean context | all nine declarations | no section `variable`s; every binder is in the signature (elaborated types above) | sound |


Pull request: #2462 (roadmap/real-surface-period-index at 36cfe04)
