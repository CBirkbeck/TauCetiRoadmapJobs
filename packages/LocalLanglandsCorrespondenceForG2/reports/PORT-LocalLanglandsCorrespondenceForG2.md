# PORT-LocalLanglandsCorrespondenceForG2

## Result

- Branch `roadmap/local-langlands-correspondence-for-g2`, head commit `8d99a61c175b4fa7260042240ee82d272e479b2e` (one commit on `e213fdd`, message `LocalLanglandsCorrespondenceForG2: roadmap (README, Suggested.lean, metadata)`). The diff adds only `TauCetiRoadmap/LocalLanglandsCorrespondenceForG2/{README.md,Suggested.lean,metadata.toml}`.
- Build, `lake build TauCetiRoadmap.LocalLanglandsCorrespondenceForG2.Suggested` on the committed state: `Build completed successfully (18578 jobs).` with 3 warnings, all `declaration uses 'sorry'` (lines 124, 143, 158: `griess_conjugacy`, `spin7_not_acceptable`, `spin7_not_acceptable_weilGroup`). The package file as copied also produced Lake's advisory "imports `Mathlib` … consider adding `module`"; the file now starts with `module` (as 104 of the 251 roadmaps on main do), and that advisory is gone.
- Gate: `gate LocalLanglandsCorrespondenceForG2: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`gate --depcheck … --movable`), output exactly:

      depcheck: 260 roadmaps, 2503 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the ported README with the pinned Lake packages: no cross-roadmap citation and no Lean name found nowhere.
- `metadata.toml` is `topic = "math.NT"`, the same shape as the folders on main (for example `TauCetiRoadmap/ArithmeticGaloisRepresentations/metadata.toml`).

## Draft pull request body

This roadmap constructs the local Langlands correspondence for the split exceptional group G₂ over a p-adic field of characteristic zero, together with the weak local Langlands correspondence for PGSp₆ that the same method produces. Parameters are transported through the three exceptional theta correspondences of G₂ (with PD× for a cubic division algebra D, with PGL₃ ⋊ ⟨duality⟩ and with PGSp₆), through the triality spin transfer of generic representations of PGSp₆ to GL₈, and through comparisons of G₂-, Spin₇- and SO₇-valued parameters. Layer 0 is the dual-group mathematics: Griess's conjugacy theorem for G₂, spin detection, standard injectivity, quadratic-twist rigidity, Chenevier's G₂-descent, and the unacceptability of Spin₇, which is why the PGSp₆ side only has weak parameter classes. Layers 1–2 globalize local representations with quaternion periods, Whittaker models and spin-regular weights, extend Arthur's parameters of Sp₆ and split SO₈ to all irreducible representations, and build the spin transfer with its gamma factors. Layers 3–7 define the parameter map L : Irr(G₂(F)) → Φ(G₂), prove that it detects tempered and discrete representations and Langlands quotients, characterize it by the two theta diagrams and by G₂ × GL_r gamma factors, parametrize the packets over the discrete parameters coming from PGL₃ with their S₃ and μ₃ enhancements, construct Kret–Shin parameters, identify every other discrete fibre with a distinguished Xu packet, and assemble the Gan–Savin Main Theorem, the generic supercuspidal correspondence of Harris–Khare–Thorne and a partial enhanced correspondence for PGSp₆. Layers 8–10 extend the spin method to all of PGSp₆ and prove the weak correspondence L_w : Irr(PGSp₆(F)) → Φ_w(PGSp₆): surjective, compatible with temperedness, discreteness and quadratic twists, with fibres that are unions of Xu packets. `Suggested.lean` states the headlines that the pinned libraries can express: Griess's theorem on the automorphism group of Tau Ceti's complex split octonions, and the unacceptability of Spin₇, for a finite group and on the Weil group of every p-adic field.

## Roadmaps this one depends on that are still pull requests

Suppliers named in the README that are not on main, all earlier than this roadmap in the merge order:

- ExceptionalThetaCorrespondencesForG2 (Layers 0, 1, 5–10 and five supplier contracts; its own consumer paragraph names this roadmap as the owner of the G₂ parameterization)
- ModularityAndLanglandsExtensions (§§2.43, 3.5, 3.8, 3.15, 3.17, 3.19, 3.25, 3.27, 5.1 and six contracts)
- EndoscopicTransferAndUnitaryTraceComparison (§§1.13, 4.7a, 10.1, 10.26, 10.29–10.31 and two contracts)
- MetaplecticAutomorphicForms (§§3.10, 3.34, 3.41, 3.42, 6.13, 6.14 and eight contracts)
- AutomorphicLFunctionsAndLocalFactors (AL.1.4, AL.R.2, AL.3, AL.3.3.8, AL.3.6.2, AL.4)
- AutomorphicLFunctionsAndLocalFactorsPartII (Layer 6, §10.0 and one contract)
- SmoothRepresentationsOfLocalGroupsPartII (SRU.1.1, SRU.1.7–1.10, SRU.3.8, SRU.3.10, SRU.4.7, SRU.4.8, SRU.5.4, SRU.5.5 and one contract)
- AutomorphicSpectralTheory (Layer 6 and one contract)
- AutomorphicGaloisRepresentationsPartII (AG2.2, AG2.5, AG2.6 and one contract)
- GL2AutomorphicRepresentationsAndTransfer (R17.1.5, *Ramification realization*)
- BorelRegulators (§3.1)

On main: AutomorphicFormsOnReductiveGroups, SmoothRepresentationsOfLocalGroups, GlobalQuadraticForms, ReductiveGroups, RepresentationTheory/SpinRepresentations, RepresentationTheory/ClassicalGroups, ClassFieldTheory, and the completed OrthogonalSpinGroups and Chebotarev. No id this README cites is defined only by an open revision (the overlap list: none; re-checked at the heads).

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already had the required form: three headline theorems (`griess_conjugacy`, `spin7_not_acceptable`, `spin7_not_acceptable_weilGroup`) and the three simple definitions they need (`octonionAut`, `octonionRep`, `sumSquaresSeven`), no API lemmas, examples, sorry'd data or `set_option`. Two changes were made to the file:

- `module` added as its first line, so the build has `sorry` as its only warning.
- The docstring entry for standard injectivity and quadratic-twist rigidity (README §§0.4–0.5) now says exactly what the pins have and lack. Tau Ceti has the vector map `CliffordAlgebra.spinToSpecialOrthogonal` and the spin representation `TauCeti.spinRep`. It has no homomorphism from the octonion automorphism group to `spinGroup` and no invariant quadratic form on the spinors. Before the change the entry read as if the pins had no spin-group structure beyond `spinGroup`.

Headline review: no headline that is statable at the pins is missing. The spin maps at the pin would make a finite-group form of §0.7 (elementwise conjugacy against equal q- and s-images) statable, but §0.7 is a supporting lemma (GS Lemma 12.2), not a headline of the Summary. §0.5 needs i : G₂(ℂ) → Spin₇(ℂ) and nonisotropy of spinors, and the pins have neither. It is not stated, because an ad hoc stabilizer of a chosen spinor would be the kind of encoding the rules exclude.

Mechanical signature check: I put `#check @name` for all six declarations at the end of one scratch copy of the module and elaborated it once (exit 0, the three `sorry` warnings only). The elaborated types are identical to the six in the worker's signature list. Every binder is present: `{Γ} [Group Γ]` on `octonionRep` and `griess_conjugacy`, both semisimplicity hypotheses and the intertwiner on `griess_conjugacy`, and `(K) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K] [CharZero K]` on `spin7_not_acceptable_weilGroup`. Each type agrees with its README statement (§0.0, §0.8). Nothing changed.

## Supplier replacements and duplication removals

- **Spin maps now cited at the pin.** The package said that `spinGroup` "carries no representation-theoretic … structure; the spin representation and the map to SO₇ come from SpinRepresentations". At the pinned Tau Ceti they exist. I read each file at the pin:
  - `CliffordAlgebra.spinToSpecialOrthogonal` (`TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpecialOrthogonal.lean:258`): the map `spinGroup Q →* SO(Q)`, assuming 2 is invertible.
  - `CliffordAlgebra.spinDoubleCover` (`…/Spin/DoubleCover.lean:85`): the extension 1 → ℤ/2 → Spin(Q) → SO(Q) → 1. It assumes a separably closed field in which 2 is invertible, a nondegenerate Q and V nonzero and finite-dimensional.
  - `QuadraticMap.IsometryEquiv.spinGroupEquiv` (`…/Spin/Map.lean:151`).
  - `TauCeti.spinRep` (`TauCeti/RepresentationTheory/Spin/Representation.lean:62`): the representation on `ExteriorAlgebra K P.W` for `P : TauCeti.SpinPolarizationData Q`. In rank seven the line has dimension at most one, so W has rank 3 and ΛW has dimension 8.

  The README now names these in the Tau Ceti contract, in the *Needs* of §§0.6, 0.7 and 0.8 and in the Layer 0 Dependencies. SpinRepresentations Layers 2 and 4 stay cited for their properties. The Mathlib bullet on `spinGroup` now points to these declarations.
- **Every other declaration re-verified at the pin**, with no change needed:
  - Mathlib: `spinGroup`, `lipschitzGroup`, the `Group` instance, `QuadraticMap.weightedSumSquares`, `Representation.IsSemisimpleRepresentation` and the `Matrix.charpoly` lemmas.
  - Tau Ceti: `TauCeti.Octonion` and its `norm_mul`, `normQuadraticForm`, `imaginary`, `finrank_imaginary`, `trace`, `conj` and `conj_mul`; `TauCeti.CayleyDickson` with `normSq` and `normSq_def`; `TauCeti.DivisionOctonionReal`.
  - Tau Ceti: `QuadraticForm.not_anisotropic_atFinitePlace_of_five_le_finrank`, `QuadraticMap.IsometryEquiv.exists_extension` (field with `Invertible 2`, finite dimension, nondegenerate restriction) and `TauCeti.BrauerGroup.natCard_twoTorsion`.
  - Tau Ceti: `TauCeti.ClassFieldTheory.WeilGroup`, which is the subgroup of G_K acting on K^ur by integral powers of arithmetic Frobenius, with its `weilDegree`, and `instTopologicalSpaceWeilGroup`, in which inertia is open; `TauCeti.D4Tripled.trialityAutomorphism` with `trialityAutomorphism_pow_three`.
  - The Zorn product at the pin, `(x*y).v = a•v′ + b′•v − w×w′` and `(x*y).w = a′•w + b•w′ + v×v′`, reproduces the conjugation Check of §0.0 and the non-associativity Check of §1.1.
- **Duplication sweep by object** with `roadmaps grep`, on main and at the open heads. I searched for: Griess, acceptable/unacceptable, octonion algebras over a number field, the totally definite octonion algebra, composition algebras, Cayley–Dickson, weak equivalence, triality, Kret–Shin, the Langlands classification for classical groups, Spin₇, PGSp₆, GSpin₇ and G₂(F).
  - None of the objects this roadmap owns is owned elsewhere.
  - ExceptionalThetaCorrespondencesForG2 §9.1 is the local pointwise stabilizer, which this roadmap consumes. §1.1 here is the global classification over a number field.
  - SpinRepresentations Layer 8 is complex triality on Spin₈(ℂ). §2.1 here is the F-rational descent to the three central quotients of the split D₄.
  - KloostermanSheavesAndBesselIsocrystals and EndoscopicTransferAndUnitaryTraceComparison mention Spin₇ only for character restrictions and test functions.
  - TwistedAutomorphicDescents and GanGrossPrasadUnitaryGroups, read at their heads, never mention G₂, Spin₇, PGSp₆ or octonions.
  - The 27 gap contracts are not stated by their suppliers. I searched the supplier READMEs for Kret–Shin, the spinor-norm twist of SO₈ packets, a GL_n local converse theorem, Poincaré weak containment, Mœglin's cuspidal support and square-integrability of discrete packets. The only GL_n converse theorems are global (AL.3.9; AutomorphicLFunctionsAndLocalFactorsPartII §10.3) or GL₃ (GL2AutomorphicRepresentationsAndTransfer R16.3).
  - Removals: none. No declaration of `Suggested.lean` shares a fully qualified name with another roadmap.

## Fixes from the reviewer read and the adversarial pass

1. **Tau Ceti contract understated the pins.** The spin representation and the map to SO₇ were attributed to a roadmap although they exist at the pin. Fixed as above.
2. **A definition without an API list.** §0.8 introduced `sumSquaresSeven` with three Checks and no API. §0.8 now has three API bullets:
   - its polar form is 2(x₁y₁ + ⋯ + x₇y₇), so it is nondegenerate;
   - every nondegenerate form on ℂ⁷ is isometric to it and induces an isomorphism of spin groups (`QuadraticMap.IsometryEquiv.spinGroupEquiv`), so the statements do not depend on the form;
   - q has kernel {±1} and is surjective (`CliffordAlgebra.spinDoubleCover`), so the centre of `spinGroup sumSquaresSeven` is {±1}. This is the centre used by the Lean statement's `Subgroup.center`.
3. **A Check that claimed a hypothesis was necessary when it is not.** The §1.4 Check said "S must be nonempty". With S = ∅, statement (i) is true: take the trivial representation, whose period is the nonzero volume (the §1.1 Check). The Check now says that S ≠ ∅ excludes a degenerate case, not a false one.
4. **Process residue.** I rewrote "(v1 read; theorem numbers as cited)", "(v1 read)", "(v2 read)", "(v3 read)" as "(locators of vN)". I dropped "cited by its locator (the text is not open access)" and "cited by their locators (the text is not open access)" from §0.0 and from the References entries for Griess and SpV.

No statement of the README was found false. The four P3 repairs of the accepted review (Corollary 6.8 pages, the cuspidal Steinberg contract with MagaardSavin, §3.25 at unbounded localizations, and "occurs in a restriction" in §10.5) and the two red-team rounds are present in the ported text.

## Adversarial mathematics pass

Each row gives the values I computed. "Pin" means the declaration as read at the pinned Tau Ceti or Mathlib.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: \|·\| and rec | arithmetic Frob_a (deg 1), geometric Φ (deg −1); ET §10.1's ω(w) = q^(deg w) | \|Frob_a\| = q⁻¹; ω(Φ) = q⁻¹, \|Φ\| = q, so ω = \|·\|⁻¹ | consistent with ET §10.1 and SR.5.2 | none |
| `octonionAut` (§0.0) | id; 2·id; zero map; conjugation; t ∈ SL₃ acting as ⟨a,b,tv,t^(−T)w⟩ | 2(1·1) = 2 ≠ 4 = (2·1)(2·1); conj(uu′) = ⟨0,0,0,−e₃⟩ ≠ ⟨0,0,0,e₃⟩ = ūū′ (pin product); (tv)×(tv′) = det t · t^(−T)(v×v′) = t^(−T)(v×v′) | definition determines G₂(ℂ); conjugation excluded | none |
| `octonionRep` | t = diag(ζ,ζ,ζ³), ζ⁵ = 1 | det t = ζ⁵ = 1; eight eigenvalues 1,1,ζ,ζ,ζ³,ζ⁴,ζ⁴,ζ² = trivial line ⊕ v-eigenvalues 1,ζ,ζ,ζ³,ζ⁴,ζ⁴,ζ² | holds | none |
| `griess_conjugacy` | Γ trivial; Γ = ℤ/5 with ρ(1) = t, ρ′(1) = t²; Γ = SL₂ with v∘ρ = Sym⁶ | trivial: g = 1; t²: v-multiset {1,ζ,ζ²,ζ²,ζ³,ζ³,ζ⁴}, multiplicity of ζ is 1 against 2, so no intertwiner and the hypothesis fails; Sym⁶ ⊕ 1 has dimension 8 | true and not vacuous; hρ′ follows from hρ and the intertwiner (P3, kept as in Griess) | none |
| §0.0 four corollaries | characters of completely reducible reps; Γ = ℤ semisimple; Γ = WD_F | equal characters ⇒ isomorphic in characteristic 0; semisimple g, g′ with equal charpoly on v give isomorphic ℤ-reps | hold | none |
| §0.1 branching | torus diag(2,3,1/6); a = −1, b = 1; centre −1; ClassicalGroups rows at r = 4 | {1,2,3,1/6,1/2,1/3,6}, product 1; (X−1)³(X+1)⁴; traces 8 (1 ⊕ q) and −8 (s) at −1; λ = (1,0,0,0) gives μ = (1,0,0) and (0,0,0), so 7 + 1; spin rows give (½,½,½), dimension 8 | holds; the wrong branching 1 ⊕ Std ⊕ Std gives {1,2,3,1/6,2,3,1/6} | none |
| §0.1 central twist | φ̃ with Frob ↦ i(j(diag(−1,1,−1))) | v-eigenvalues 1,−1,1,−1,−1,1,−1, trace −1; spin 1⁴(−1)⁴, trace 0, closed under negation | one weak class, as stated | none |
| §0.2 | principal SL₂ of SL₃; χ ⊗ Sym² with χ cubic; 1 ⊕ 1 ⊕ 1 | subregular, S₃; det = χ³ = 1, dual χ⁻¹ ⊗ Sym², μ₃; L = (1 − q^(−s))^(−7), pole of order 7 | criterion holds for discrete φ only, as stated | none |
| §0.3 | principal; subregular | s∘i∘φ = 1 ⊕ Sym⁶, one invariant line; 1 ⊕ 1 ⊕ Sym² ⊕ Sym²: L(s, Sym²) = (1 − q^(−s−1))⁻¹ has no pole at 0, so the pole has order 2; Sym² with multiplicity 2, not discrete | holds; converse only for discrete φ̃ | none |
| §0.4 | A₂ image | 1 ⊕ φ_τ ⊕ φ_τ∨ reducible, injectivity still holds; Spin₇ pair of §0.8 has equal q- and s-images | holds | none |
| §0.5 | ρ = 1 with χ ≠ 1; ρ into j(SL₃) ⋊ ⟨duality⟩ | χ^⊕7 has no invariant vector and 1 is not conjugate to the central χ; χ ⊂ v∘ρ gives χ⊗v∘ρ ∋ 1, so the conclusion is conjugacy; V^Γ is orthogonal to the nontrivial isotypic parts, hence nondegenerate | holds | none |
| §0.6 weak equivalence | trivial vs unramified central −1 | spin traces at Frob 8 and −8, vector traces 7 and 7 | relation needs both images | none |
| §0.7 | same pair; pair of §0.8 | Frob ↦ 1 and −1, central and not conjugate; the §0.8 pair is elementwise conjugate, weakly equivalent and not conjugate | holds | none |
| §0.8 finite (`spin7_not_acceptable`) | Γ = PUnit; Γ = μ₄ × μ₄ | trivial Γ: g = 1 refutes the last clause; weights of V (1,0),(1,2),(0,1),(2,1) sum to (4,4) ≡ 0; η⊗V = {(1,2),(1,0),(0,3),(2,3)} ≠ V, ≠ V∨ = {(3,0),(3,2),(0,3),(2,3)}; every (x,y) has x, y or x + y even | witness correct | none |
| §0.8 local (`spin7_not_acceptable_weilGroup`) | r = η = 1; r = 1, η = sgn_(E/F); F = ℚ₅; F = ℚ₃; p = 2 | trivial pair meets every clause but the last; IsConj(1, −1) false; ℚ₅×/ℚ₅×⁴ ≅ (ℤ/4)², 16 elements; ℚ₃×/ℚ₃×⁴ ≅ ℤ/4 × ℤ/2, 8 < 16; dim F×/F×² is 2 (p odd) or 2 + [F:ℚ₂] | true (CG Prop. 8.3); the generality (`IsNonarchimedeanLocalField` + `CharZero`) equals the README's | none |
| `sumSquaresSeven` | e₁; (1,…,1); e₁ + i e₂; polar(e_i,e_j); weights (1,…,1,0) | 1; 7; 1 + i² = 0, isotropic, so Spin₇(ℂ) and not Spin(7); 2δ_ij; e₇ in the radical | nondegenerate split form | API bullets added |
| §0.9 | A = Sym⁶ f, f non-CM with trivial character | Satake classes Sym⁶ of SL₂ elements lie in v(G₂(ℂ)); Steinberg place gives the principal parameter | holds | none |
| §0.10 | r = 1 ⊕ ρ ⊕ ρ∨ | lift j∘ρ (§0.1) | holds | none |
| §1.1(i) | ℝ: division octonions vs `TauCeti.Octonion ℝ`; conjugation of ℍ | signatures (8,0) and (4,4); conj(ij) = −k, conj(i)conj(j) = k | holds | none |
| §1.1(ii) | ℚ at 2; ℚ(√2) with c = −(1+√2) | −7 ≡ 1 mod 8 is a square in ℚ₂, so 7·1² + (√−7)² = 0; −c ↦ 2.414 > 0 and −0.414 < 0, definite at one place only | holds | none |
| §1.1(iii) | ℚ with S = {2} and D₂ split | (−1,−3) has symbols −1 at 3 and ∞ and +1 at 2 by the product formula; R = {∞} is odd, so one prime is added | holds | none |
| non-associativity Check §1.1 | u = ⟨0,0,e₁,0⟩, u′ = ⟨0,0,e₂,0⟩, w = ⟨0,0,0,e₁⟩ on the pin product | uu′ = ⟨0,0,0,e₃⟩; (uu′)w = ⟨0,0,−e₃×e₁,0⟩ = ⟨0,0,−e₂,0⟩; u′w: a = e₂·e₁ = 0, every other entry 0, so u(u′w) = 0 | holds | none |
| L²_D, L²_(ψ,σ) (§§1.1–1.2) | V ⊕ V with P = P₀ + P₀ | antidiagonal has zero period; diagonal selected; first coordinate copy has nonzero period but is not in L²_D | holds | none |
| §1.3 | S = ∅; trivial rep of ℝ in L²(ℝ); (c) with δ_v = 1 | constant function; invariants of L²(ℝ) = 0 although weakly contained; PD_v× compact | holds | none |
| §1.4 | S = ∅; ℚ with S = {p,∞} vs {p,p′} | S = ∅: conclusion true with the trivial representation; no free archimedean place in the first case, so only (i) | holds | Check reworded |
| §1.5 | δ = St; δ = π_gen[1] | θ(St) = St with parameter Sym⁶, irreducible, so discrete; θ(π_gen[1]) has 1 ⊕ Sym² ⊕ Sym², not discrete, so excluded | hypothesis discriminates | none |
| §1.6 | PGL₂ Steinberg (split rank 1); SL₂(ℝ) D_k^±; D₂^± | not isolated in rank 1; for each ψ exactly one of D_k^± is generic; D₂^± in the closure of the complementary series | holds | none |
| §1.7 | t = 0, 1 | h = (3,2,1), spin weight 0 twice; h = (11,6,3), weights ±10, ±7, ±4, ±1; λ_t has coordinate sum 14t, even | t ≥ 1 needed and used | none |
| §2.0 | trivial reps of Sp₆ and SO₈; St_Sp₆ | eigenvalues q^(−3),…,q³ with N = 0; dimension 6 + 2 = 8; for St, the support exponents 3,…,−3 each occur once, so a = 7 and Sym⁶ | holds; St ≠ 1 by N | none |
| §2.1 | centres; restriction to Spin₇ | Z(Spin₈) = μ₂², three distinct kernels; f₂, f₃ restrict to s and f₁ to 1 ⊕ q | holds | none |
| §2.2 | unramified trivial parameter and its central twist | 8 eigenvalues 1 against −1, standard eigenvalues 1⁷ both times | not determined by standard data | none |
| §2.3 | Σ a G₂ lift; St at u; lift from PGO₆ | spin polynomial has the factor X − 1, so 1 ⊞ A; Λ²Sym³ = Sym⁴ ⊕ 1, two invariant lines against Sym⁶ with none | holds | none |
| §2.4 | ℚ₅, trivial class, s = 2; ψ₅; St; T of size 1 and 2 | Tate factor (1 − 5⁻²)/(1 − 5) = −6/25, product (6/25)⁸; factor 5⁻¹² = 5^(−8·3/2); 2ρ∨ = (6,4,2) on the spin weights gives 6,4,2,0,0,−2,−4,−6; R_uR_wR_σ = 1 and R_uR_wR_σ² = 1 give R_σ = 1 | holds | none |
| §2.5 | St, unramified χ | traces of 1 ⊕ Sym⁶ at (Frob,1): 8 against −8; f₁ pulls back χ∘sim to 1 | holds | none |
| §3.1–3.2 | St_G₂; trivial rep | Sym⁶; v∘L(1) has eigenvalues q^(−3),…,q³ with N = 0 | holds | none |
| §3.3–3.4 | τ = St_PGL₃; τ unramified diag(2,3,1/6) | 1 ⊕ Sym² ⊕ Sym²; spectrum {1,2,3,1/6,1/2,1/3,6} on both sides | holds | none |
| §3.5 | two GL₂ Levis, φ_τ′ = \|·\|² ⊕ \|·\| | Heisenberg rule exponents {2,1,−2,−1,3,−3,0}; other rule {2,1,−2,−1,1,0,−1}; they differ | embeddings must be treated separately, as stated | none |
| §3.6–3.8 | St; trivial rep; image T[2] ⊂ T∨ | St tempered with unbounded SL₂; trivial rep has \|eigenvalue\| q³; W(G₂) → GL₂(𝔽₂) has kernel {±1}, so S_φ = ℤ/2 and the fibre has 2 elements | holds | none |
| §3.9–3.10 | ranks; ψ_a with τ = μ | 3 + 1 + 3; multiplier μ(a)⁷ \|a\|^(7(s−1/2)), exponent 7r and not 8r | holds | none |
| §3.11 rules and FE | P- and Q-Levi dimensions; ζ at s = 2 | 2+2+1+1+1 = 7 and 2+2+3 = 7; Γ_ℝ(−1) = −2π, Γ_ℝ(2) = π⁻¹, γ_∞(2) = −2π², −2π²·(−1/12) = π²/6 | direction right | none |
| §3.11 real factor | λ = 0 on compact G₂ | with (a,a) = 2, (b,b) = 6, (a,b) = −3: long coroots b/3, a + b/3, a + 2b/3 pair with ρ as 1,2,3; short ones as 1,4,5; det of three Ind((z/z̄)^m) at j is (−1)³, so sgn on the zero weight gives det 1 | holds | none |
| §3.11 unbounded real place | (a+b, b, a) with a + b < 1/2 | coroot pairings a, b, b−a, a+2b, 2a+b, a+b, a+b, b, a all in (−1,1) | irreducible, so §3.25 applies | none |
| §3.11 Steinberg forces a generic parameter | (a,b) summands | exponent (a+b)/2 − 2 occurs twice when a, b ≥ 2; 0 occurs once, so (7,1) | holds | none |
| §3.11 Π′ = 1 | ramified u | 1_GL₃ and St₃ share the support \|·\|, 1, \|·\|⁻¹; both sides are γ(T)γ(St₃ × T)² | holds | none |
| §3.12–3.14 | St × 1; Irr♠; St via the diagrams | γ(s, Sym⁶); dimensions 3r + r + 3r; Sym⁶ forces the principal parameter by §0.4 | holds | none |
| §3.15 | Frobenius convention; weights at ρ | eigenvalues {1, a^(±1), b^(±1), (ab)^(±1)} closed under inversion; 3,…,−3 distinct | holds | none |
| §4.1 | opposite algebra | 1/3 ↔ 2/3; χ(ζ₃) = ζ₃ against χ⁻¹(ζ₃) = ζ₃² | holds | none |
| §4.2–4.3 | p ≠ 3, p = 3; self-dual supercuspidals of PGL₃ | three members; image A₄, S₄ or A₅ needs a non-cyclic normal 2-group or is not solvable, so p = 2 only; at p = 3 only Sym² | holds | none |
| §4.4–4.5 | subregular; std₂ on μ₃ | 3 members against \|S₃\| = 6; trace of std₂ at the generator of μ₃ is ζ + ζ² = −1 | holds | none |
| §5.1–5.2 | St; χ·φ̃ | q = Sym⁶ and s = 1 ⊕ Sym⁶; spin trace −8 excludes χ·φ̃; two lifts differ by c : W_F → μ₂ (trivial on SL₂, which is connected) | holds | none |
| §5.3–5.6 | St_G₂; π_gen[1]; τ = St_PGL₃ | KS = {principal}; θ(π_gen[1]) not discrete, so excluded from §5.3; Sym² ⊕ Sym² ⊕ 1 ⊕ 1, dimension 3+3+1+1 = 8 | holds | none |
| §6.1–6.3 | principal; St ⊗ χ∘sim with χ unramified | π = St_G₂; the twist's KS parameter has spin trace −8 ≠ 8, so its G₂ lift is zero; X* = {St} | holds | none |
| §6.4–6.5 | two equal places | sign ε(s)² = 1 with ε(s) ∈ {±1}; L^S(s, Σ′, spin) = ζ^S(s)L^S(s, Σ, std), a simple pole at 1 since L^S(1, std) ≠ 0 | holds | none |
| §6.6–6.7 | principal; S₃ | singletons; 3 against 6 | holds | none |
| §7.1–7.4 | subregular, principal, non-self-dual A₂ with p ≠ 3 | sizes 3, 1, 3; exactly one generic member | holds | none |
| §8.1 | trivial rep of PGSp₆; q = 5 | λ = (q³,q²,q), coroot λ₁/λ₂ = q, reducible; JS gives \|λ_i\| < √5 ≈ 2.236, so \|λ_iλ_j^(±1)\| < 5 = q | holds | none |
| §8.2 | St, χ | traces 8 and −8; principal spin weights include 0 twice, but regularity is imposed at the real places, where h = (11,6,3) | holds | none |
| §9.1–9.2 | φ_τ = Sym³ | dimension 4 + 4 = 8; Λ²Sym³ = Sym⁴ ⊕ 1 (6 = 5 + 1); 1 ⊕ 1 ⊕ Sym⁴ not discrete | holds | none |
| §9.3 | Levis; Klingen; Siegel | 2³ − 1 = 7; (a,g) ↦ a⁻¹g has kernel {(z, z·1₄)}; (A,λ) ↦ λ⁻¹det(A)ᵗA⁻¹ has kernel {(c, c²)} and is onto; the GL₁ × PGSp₄ model has central character χ(z²) | holds | none |
| §9.4–10.2 | St; Sym³ through h | principal class; 1 ⊕ 1 ⊕ Sym⁴ not discrete; φ̃ is discrete iff q∘φ̃ is (the centralizers have the same identity component) | holds | none |
| §10.3–10.4 | χ quadratic, μ with μ² ≠ 1 | Λ²(φ ⊗ χ) = χ²Λ²φ = Λ²φ; with μ the standard parameter changes | holds | none |
| §10.5 | σ ⊗ χ∘sim ≅ σ; dihedral σ of PGL₂ | restriction reducible; for SL₂ two constituents | "occurs in a restriction", as stated | none |
| §10.6–10.9 | unramified φ_τ with eigenvalues a, b, c, (abc)⁻¹ and χ unramified | Λ² unchanged, the eight eigenvalues of φ_τ ⊕ φ_τ∨ negated | comparison on φ_τ, as stated | none |

Context: each Lean statement carries its standing hypotheses in its own signature, as the `#check @` output above shows. Generality matches in both directions: an arbitrary group Γ in §0.0; ∃ Γ : Type finite in §0.8; nonarchimedean local fields of characteristic zero for the local form. Unused hypotheses, recorded as P3 notes only: hρ′ in `griess_conjugacy` follows from hρ and the intertwiner, and `η w * η w = 1` follows from `η w ∈ Subgroup.center`, since the centre is {±1}.

## Overlap with open pull requests

`roadmaps overlaps` for this roadmap:

- No other pull request changes this roadmap.
- No cited id is dropped by an open pull request.
- No cited id is defined only by an open revision.
- There is no second copy of this roadmap.

The closest roadmap is ExceptionalThetaCorrespondencesForG2 (scores 0.43 and 0.67). Its scope and ownership is complementary: it owns the octonion model, the dual-group inclusions, complex parameters, component groups and the three theta correspondences. Its Downstream consumers paragraph names this roadmap as the one that proves the complete G₂ parameterization. AutomorphicLFunctionsAndLocalFactorsPartII and ModularityAndLanglandsExtensions are suppliers. TwistedAutomorphicDescents and GanGrossPrasadUnitaryGroups have no G₂, Spin₇ or PGSp₆ objects. Ownership against open pull requests was checked through the `roadmaps` tools at their heads and the dumped supplier READMEs. The listed sibling checkouts do not include most of these suppliers, so their heads were read through `roadmaps show`.

## Unresolved

- From the accepted review, for the human reviewers: Griess (Theorem 1) and SpV (§1.5, Theorems 1.7.1 and 1.8.1) are cited by locator only. Shin's page numbers are those of the author PDF. GF is an arXiv v1 with no journal reference. None of these changes the port.
- The 27 gap contracts remain requests to earlier roadmaps; none of their suppliers states them at its head. The dependency check is clean.
- No text read during the port contained instructions. Nothing suspicious to quote.


Pull request: #2458 (roadmap/local-langlands-correspondence-for-g2 at 8d99a61)
