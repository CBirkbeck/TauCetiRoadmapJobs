# Review of MetaplecticAutomorphicFormsPartII (package, round 2)

**Verdict:** needs changes

Two findings: one P2 and one P3. The previous notation finding is repaired. The package elaborates, and the sampled mathematical formulas pass the computations below. The remaining changes concern an omitted, statable headline and a Check that identifies objects of different dimensions.

## Previous finding and repair verification

**F01 — repaired.** `packages/MetaplecticAutomorphicFormsPartII/Suggested.lean:24` now says `det W(g) = (det W(g)|S⁺)²`; line 34 now says `Ω_{ψ,V}|_{P ⋉ H(V)} ≅ Ind_{P ⋉ H(I^⊥)}^{P ⋉ H(V)} ((χ ∘ det_I) ⊗ Ω_{ψ,I^⊥/I})`. These agree with README §§2.2 and 3.3. Searching both files found no remaining `ω(g)`, `ω_V` or `ω_{...}` used for a representation. The two formulas were recomputed, not merely compared typographically: at q=3, g=J, both determinants in the normalized identity are 1; for dim V=4 and dim I=1, the induction dimensions are 3·3=9. The table below gives the intermediate values.

The additional module-header repair preserves the imports and signatures. The module-system spelling `public import Mathlib` plus three individual used Tau Ceti imports elaborates without a header warning. All 13 fresh elaborated signatures agree, after whitespace normalization, with the supplied signatures. No mathematical declaration changed in that repair. No earlier finding was marked not actionable.

## R01 (P2) — Tensor compatibility is statable with the existing definitions

**Location:** `packages/MetaplecticAutomorphicFormsPartII/Suggested.lean:39`, “Layer 4, tensor compatibility of normalized Weil representations along orthogonal sums”; also `packages/MetaplecticAutomorphicFormsPartII/README.md:69` and §4.2, lines 477–484.

**Claim:** The docstring excludes this headline because it needs a constructed Weil–Heisenberg representation and a Heisenberg sum map absent at the pins.

**Witness:** The finite-family signature below elaborates at the pins with no added definition or import. `IsNormalizedWeil` already specifies the actions; `Mathlib/LinearAlgebra/Pi.lean:110` supplies the coordinate inclusions needed to state the block action.

**Exact repair:** State the normalized Weil tensor-compatibility headline on the existing function models, with arbitrary finite index set and arbitrary finite-dimensional factors. Update the docstring and README's acceptance-test description accordingly. A constructed choice of W is unnecessary: quantify over W and the Wᵢ satisfying the existing normalization predicate, just as §4.1 already does. The following full signature was appended to a scratch copy and elaborated successfully, with only the eight expected `sorry` warnings (seven original and this one). It has no free condition standing in for unexpressible mathematics: `hg` is the explicit canonical block-action equation. Pure product functions span the function space, so the conclusion is precisely equality of the tensor actions, not a bounded or boundary substitute.

```lean
/-- The normalized Weil action on a finite orthogonal product agrees on pure tensors
with the product of the normalized actions. The hypothesis on g is exactly its
block action under the canonical splitting of the dual of a finite product. -/
theorem normalizedWeil_finite_tensor
    {k ι : Type*} [Field k] [Fintype k] [Fintype ι] [DecidableEq ι]
    (X : ι → Type*) [∀ i, AddCommGroup (X i)] [∀ i, Module k (X i)]
    [∀ i, FiniteDimensional k (X i)]
    (hk : ringChar k ≠ 2) (ψ : AddChar k ℂ) (hψ : ψ ≠ 1)
    (W : TauCeti.BilinForm.isometryGroup (polarizationForm k (∀ i, X i)) →*
      (((∀ i, X i) → ℂ) ≃ₗ[ℂ] ((∀ i, X i) → ℂ)))
    (Wi : ∀ i, TauCeti.BilinForm.isometryGroup (polarizationForm k (X i)) →*
      ((X i → ℂ) ≃ₗ[ℂ] (X i → ℂ)))
    (hW : IsNormalizedWeil ψ W) (hWi : ∀ i, IsNormalizedWeil ψ (Wi i))
    (g : TauCeti.BilinForm.isometryGroup (polarizationForm k (∀ i, X i)))
    (gs : ∀ i, TauCeti.BilinForm.isometryGroup (polarizationForm k (X i)))
    (hg : ∀ (v : (∀ i, X i) × Module.Dual k (∀ i, X i)) (i : ι),
      ((g.val v).1 i, (g.val v).2.comp (LinearMap.single k X i)) =
        (gs i).val (v.1 i, v.2.comp (LinearMap.single k X i)))
    (f : ∀ i, X i → ℂ) :
    W g (fun x => ∏ i, f i (x i)) = fun x => ∏ i, Wi i (gs i) (f i) (x i) := by
  sorry
```

This signature uses the existing namespace and the existing public section. Add its chosen Lean name to §4.2. The two-plane q=3 test gives `(W(J)δ₀) ⊗ (W(J)δ₀) = −(1/3)·1` on both sides, and dimension 3·3=9. For the empty index set both sides are the constant function 1. These test the full finite-family signature, whose elaboration is the counterexample to the claimed inability to state it. The separate assertion about the constructed semidirect-product representation can remain identified separately if it still needs unavailable constructions; it cannot justify omitting this normalized Weil headline.

## R02 (P3) — The Heisenberg Check confuses θ_U with η_U

**Location:** `packages/MetaplecticAutomorphicFormsPartII/README.md:438`: “In the Heisenberg case `θ_U` is the inflation along `H(I^⊥) → H(V̄)` of §3.1”.

**Claim:** The one-dimensional character θ_U of HU is the representation inflated in §3.1.

**Witness:** Take V=𝔽₃⁴ and I a line. HU has order 9, Q=H(I^⊥) has order 81. θ_U has dimension 1; the inflation of S_{ψ,V̄} to Q has dimension 3.

**Exact repair:** Replace this Check with: “In the Heisenberg case, η_U is the inflation of S_{ψ,V̄} along Q=H(I^⊥) → H(V̄), and its restriction to HU is θ_U-isotypic. For a line I in 𝔽₃⁴, dim η_U=3 and (dim η_U)²·|HU|=9·9=81=|Q|.” This distinguishes the character from the representation and tests the non-Lagrangian case that exposes the confusion. Under the corrected statement, HU maps to the centre of H(V̄), which acts on the three-dimensional representation by ψ times the identity. The main theorem and its Lean signature require no change.

## Verified sound

### Coverage, principles and shape

Read all four package files, all 18 mathematical targets and their API bullets and Checks, the earlier review and repair, the package index, the overlap leads and the library near-matches. For unchanged auxiliary assertions, the prior review's rows with actual computed values were retained as evidence; its prose-only conclusions were rechecked. All 15 seeded targets and every headline were examined again. The earlier table did not test the domain/dimension identification in R02, and its prose-only statability conclusion for tensor compatibility is superseded by the elaborated witness in R01.

The scope is general finite odd-characteristic Weil–Heisenberg theory, including non-prime fields, non-injective nontrivial additive characters, rank zero and the exceptional Sp₂(𝔽₃) normalization. The fully ramified theorem works for general finite J and cyclic centres of arbitrary order. No good-prime restriction, computational algorithm, copied source passage, sorry'd data, `set_option`, `lemma`, admitted example, empty proposition or conclusion-as-hypothesis was found. There is no process narrative, pull-request number, machine path or LaTeX delimiter in the README or Lean. `metadata.toml` contains the topic `math.RT`; the five cited works are all present under their existing unique keys in `sources.toml`. No source was fetched or manifest entry changed.

The opening explains where the base roadmap stops. The finite theory is an extension of its local/adelic theory, not a replacement plan. The order is mathematical: adapted coordinates → Schrödinger/uniqueness → normalized operators → parabolic restriction/induction → fixed lines/tensors. Dependencies force that order; no layer is named for a source chapter or claims to follow a source's exposition. Source conventions are translated explicitly, including the reciprocal multiplier convention relative to N02 line 178.

The README has the required Summary, Scope, Conventions, supplier contracts, reading guide, five layers with Examples and Dependencies, consumers, worked examples and references. Every target has a locator or an exact supplier locator and an itemized Needs line. API and Check counts by target are: 0.1:4, 0.2:3, 1.1:4, 1.2:4, 1.3:4, 1.4:5, 1.5:3, 2.1:3, 2.2:4, 2.3:3, 2.4:3, 2.5:3, 3.1:3, 3.2:3, 3.3:3, 3.4:5, 4.1:4, 4.2:4 Checks. R02 corrects one of those Checks. All six retained definitions have real bodies and are needed by the headline statements. All 13 names attributed to this roadmap resolve to its declarations, and every declared name appears in the README. Mathematical notation such as S_ψ and Ω is not presented as an additional Lean API catalogue.

### Elaboration, signatures, padding and headlines

`lake env lean` on the absolute package Suggested.lean path, run from the content checkout, exited 0: exactly seven `declaration uses 'sorry'` warnings, at lines 79, 91, 116, 130, 201, 223 and 256. No object-file build was needed. A scratch copy appended `#check @name` for all 13 declarations and tried, on every admitted theorem, `simp`, `rfl`, `infer_instance`, and `exact?` (single-lemma search), each requiring the goal to close before falling back to `sorry`. It exited 0; all seven original declarations still used `sorry`, and none produced a successful exact suggestion. Probe-only tactic-linter warnings do not occur in the package. No padding was found by these probes or by inspecting definitions and near-matches.

The 13 fresh signatures equal the worker's signatures after whitespace normalization. In particular the seven headlines retain finite field/dimension, odd characteristic, nontrivial ψ, irreducibility, normality, character invariance, nondegenerate commutator pairing and θ(U∩H)=1 where needed. The broader real-bodied definitions are guarded by these theorem hypotheses; they do not silently inherit finiteness or nondegeneracy. The six definitions are `heisenbergFactorSet`, `Heisenberg`, `polarizationForm`, `schrodingerOp`, `evenPart`, `IsNormalizedWeil`.

| README headline | Acceptance-test coverage |
|---|---|
| §1.3 finite Stone–von Neumann existence | `finite_stoneVonNeumann_exists` |
| §1.3 dimension, character support, uniqueness | `finite_stoneVonNeumann` |
| §1.4 fully ramified existence | `fullyRamified_exists` |
| §1.4 dimension, support, uniqueness | `fullyRamified_unique` |
| §2.2 normalized Weil existence and uniqueness, including Sp₂(𝔽₃) | `existsUnique_isNormalizedWeil` |
| §3.3 corrected Gérardin induction | Named in the module docstring; the constructed quotient Heisenberg/semidirect-product representations and their induction comparison are not supplied as such at these pins |
| §3.4 isotropic invariants | `fullyRamified_isotropicInvariants`; Q-stability, irreducibility and the dimension equation are explicit |
| §4.1 determinant character on Lagrangian fixed lines | `isNormalizedWeil_lagrangian_fixed` |
| §4.2 normalized Weil tensor compatibility | Absent despite being statable; R01 |

### Computed adversarial table

New complex-matrix checks used ordinary Python complex arithmetic, tolerance 10⁻⁹; the maximum measured error was below 6.1·10⁻¹⁵. The complete groups generated were SL₂(𝔽₃), order 24, and SL₂(𝔽₅), order 120. All 576 and 14,400 multiplication pairs were tested. Heisenberg multiplication was tested on all 729 and 15,625 pairs respectively. Algebraic equalities and dimension counts below are exact; these numerical checks are convention witnesses, not substitutes for the proof routes.

| Statement | Instances tried | Values on the two sides | Result / change |
|---|---|---|---|
| §0.1 adapted decomposition | I=0; plane with I=k e₁; two planes with I=k e₁ | dim V = 0+dim V; 2=2·1+0; 4=2·1+2. For the last case dim I^⊥=3 and dim(I^⊥/I)=2. The incorrect subtraction dim V−dim I gives 3. | Sound. Pairing e₁,f₁=1 identifies J with I*, not its negative. |
| §0.2 `polarizationForm` | k-plane; X=0; images under J | ω(e₁,f₁)=1, ω(f₁,e₁)=−1; ω(Je₁,Jf₁)=ω(−f₁,e₁)=1. On zero space the two radicals are {0}; dim=0. A nonzero plane with zero form has radical dimension 2 and is excluded. | Sound. Matrix.J has the opposite sign. |
| §1.1 `heisenbergFactorSet`, `Heisenberg` | q=3, e₁,f₁; V=0; characteristic 2 as negative control | Products have central coordinates 2 and 1; commutator coordinate 2−1=1=ω(e₁,f₁). Coordinate change sends (2,1,1) to (1,1,1), the native polarized product. V=0 gives the additive centre k. In characteristic 2, division by 2 gives 0, so the raw extension commutator is 0 rather than 1. | Sound under the explicit odd-characteristic hypotheses; the characteristic-2 junk value is not used by a theorem. |
| §1.2 `schrodingerOp` and induction model | q=3,5; all Heisenberg pairs; T,M on δ₁; X=0 | Both product exponents are t+s+y(z)+y′(z)+y′(x)+y(x)/2+y′(x′)/2. Maximum pair errors 6.5·10⁻¹⁶ and 2.8·10⁻¹⁶. TMδ₁=ζδ₀, MTδ₁=δ₀. Zero-space dimension=1, central action=ψ(t). | Sound. Wrong modulation sign reverses ζ. |
| §1.3 both Stone–von Neumann headlines | q=3,5, n=1; q=9 trace character; n=0; ψ=1 | Character qψ(t) on centre, 0 off it; norm q⁻³·q·q²=1 (computed 0.9999999999999999 and 0.9999999999999998). In 𝔽₉, each trace value has 3 preimages, so sum=3(1+ζ+ζ²)=0 despite a kernel of size 3. At n=0, d²=1=|V|. With ψ=1 on the 𝔽₃ plane, there are 9 distinct quotient characters, so uniqueness fails. | Sound. Nontriviality, not injectivity, is the needed condition. |
| §1.4 both fully ramified headlines | H=J; cyclic J/H≠1 with trivial pairing; Q₈ with H={±1}, θ(−1)=−1; central product of H(𝔽₃²) with C₉ | H=J: d²=1=[J:H]. Abelian proper quotient: all pairings=1 and [J:H] extensions. Q₈: [i,j]=−1, θ([i,j])=−1, dimension 2, 2²=8/2; character (2,−2,0,…,0), norm (4+4)/8=1. Central product: order81, centre9, d=3, d²=81/9=9. | Sound. S₃ with H=A₃ and nontrivial θ fails invariance: conjugation changes ζ to ζ⁻¹; θ=1 fails nondegeneracy. |
| §1.5 left-average intertwiners | A=B line in 𝔽₃²; distinct lines; V=0 | Same line: T=3 id, T²=9 id, |A||A∩B|=3·3=9. Transverse lines: character sum 1+ζ+ζ²=0 off intersection, composite=3 id=3·1 id. Zero space: 1·1=1. | Sound. Neither uniform identity nor uniform factor 9 is correct. |
| §2.1 projective covariance and multiplier | rescale μ(u(1)) by ζ; parity | c(g,g) changes by ζ², whereas covariance is unchanged. Rπ(t,x,y)R⁻¹=π(t,−x,−y). Parity trace=1; an intertwiner scalar a on conjugated parity satisfies a·1=1 and hence a=1. | Sound. README's c is reciprocal to N02's c; native Tau Ceti uses the README convention. |
| §2.2 `evenPart` | q=3,5; even δ₀; odd δ₁−δ₋₁; X=0 | eδ₀=δ₀ and e(δ₁−δ₋₁)=0; e²=e. Dimensions (2,1), (3,2), (1,0); N−2N⁺=−1 in all three cases. | Sound. The identity projector would fail the odd-vector test. |
| §2.2 normalization / `existsUnique_isNormalizedWeil`; repaired docstring | all g,h in SL₂(𝔽₃), SL₂(𝔽₅); scalar rescaling a; n=0 | Multiplication errors ≤3.7·10⁻¹⁵ and ≤6.1·10⁻¹⁵; covariance ≤3.7·10⁻¹⁵; determinant-identity errors ≤2.7·10⁻¹⁵. For q=3: det F=−i, det(F on S⁺)=−1, κ=−i, det W(J)=1=(det W(J) on S⁺)². For q=5: det F=−1, det(F on S⁺)=−1, det W(J)=1=1. Rescaling multiplies κ by a⁻¹, so κμ is unchanged. At n=0, a/a²·a=1. | Sound. An order-3 twist has determinant factors λ³=1 versus λ⁴=λ, so fails where λ≠1. |
| §2.3 generator formulas | q=3,5, n=1; J; m(2) over 𝔽₅ | W(u(1)) over 𝔽₃ is diag(1,ζ,ζ); W(m(−1))=−R; F²=R; κ_J=−i or −1. W(m(2))δ₀=−δ₀ and χ₅(2)=χ₅(3)=−1. J e₁=−f₁, so conjugating T gives M⁻¹. | Sound. Generator covariance and all resulting group relations were recomputed. |
| §2.4 Weil–Heisenberg product and transport | (h,1)(1,J); h=(0,e₁); V=0 | Correct Ω product is π(h)W(J). Reversed recipe gives W(J)π(h), whereas π(h)W(J)=W(J)π(J⁻¹h), J⁻¹e₁=f₁≠e₁. At V=0, Ω(t,1)=ψ(t). | Sound. General product gives π(h(g·h′))W(gg′) on both sides. |
| §2.5 special-isomorphism pullback | j=id,s=id; inner automorphism w=e₁ on v=f₁ over 𝔽₃; exponent-9 group | Identity data gives Ω. Inner action sends (0,f₁) to (1,f₁), while s=1 sends it to (0,f₁): equivariance fails. H(𝔽₃²) has exponent3 versus exponent9, so no such isomorphism exists for the latter. | Sound. The explicit equivariance equation excludes the wrong lift. |
| §3.1 mixed models | I=0; Lagrangian I; dim V=4, dim I=1 over 𝔽₃ | Invariant dimensions qⁿ,1,3 respectively; in the last case index3 × inducing dimension3=9. With i=e₁,j=f₁, ω(j,i)=−1, so phase ψ(−1)=ζ⁻¹; sum over multiples is 1+ζ+ζ²=0 unless j=0. | Sound. Projection K→H(V₀) has kernel 0×I and respects the half-form law. |
| §3.2 parabolic action | 𝔽₅ plane, I=y-axis or x-axis, g=m(2); I=0 | On y-axis det=3 and δ₀ eigenvalue χ₅(3)=−1; on x-axis det=2 and constant-line eigenvalue χ₅(2)=−1. Untwisted formula gives +1. At I=0 the determinant on zero space is1. | Sound. Prior unchanged higher-rank row checks all 1296 elements of the 𝔽₃⁴ line stabilizer. |
| §3.3 corrected induction; repaired docstring | 𝔽₃⁴, dim I=1; I=0; 𝔽₅ Lagrangian | Index=3, smaller space dimension=3, induced dimension=9=dim S. At I=0 index=1 and twist=1. For the 𝔽₅ Lagrangian, the fixed line has eigenvalue−1; omission of the twist predicts+1. | Sound. The quotient for I=0 is V itself, not the zero space. |
| §3.4 isotropic-invariants headline and auxiliary character | general finite A=J/H; U=1; U⊂H with θ(U)=1; 𝔽₃ plane; U=H with nontrivial θ as negative control | dim E^U=d/|Ū|, |Q|=|H||A|/|Ū|, |HU|=|H||Ū|, so (d/|Ū|)²|HU|=|H||A|/|Ū|. Plane with U an isotropic lift: 1²·9=9. U=1 gives d²|H|=|J|. Bad U=H gives 0·|H|≠|J|. | Headline sound. Q-stability uses θ([q,u])=1; the radical of Ū^⊥ is Ū, giving irreducibility. |
| §3.4 final Check, R02 | 𝔽₃⁴ with I a line | θ_U: domain HU of order9, dimension1. Inflated S_{ψ,V̄}: domain Q of order81, dimension3. Correct η_U dimension equation: 3²·9=81. | Check fails; replace θ_U by η_U and specify its restriction, as R02. |
| §4.1 Lagrangian fixed-line formula | every line and every stabilizing g in 𝔽₃² and 𝔽₅²; X=0; flag I⊂L | All 4 and 6 line projectors have trace1. Across 24 and 120 stabilizer cases, W(g)P_L=χ(det(g on L))P_L with error≤2.1·10⁻¹⁵. At q=3,g=−1 scalar=−1 on both constants and δ₀. At X=0 scalar=χ(1)=1. Flag determinant is a·b, and χ(ab)=χ(a)χ(b). | Sound. gL⊆L is equality because g is injective and L finite-dimensional. |
| §4.2 tensor compatibility; R01 | two 𝔽₃ planes; common versus different characters; empty family | Dimensions3·3=9. Both J factors send δ₀⊗δ₀ to (−i/√3)²·1=−1/3·1. If det Wᵢ⁺=αᵢ and dim Sᵢ=nᵢ, full determinant=α₁^(2n₂)α₂^(2n₁), even determinant squared=(α₁^n₂ α₂^n₁)². For ψ₁(1)=ζ, ψ₂(1)=ζ², central (1,−1) acts by ζ²≠1. Empty product has dimension1 and action1. | Mathematics sound; the general normalized Weil compatibility is statable and must be added to Lean. |

Every denominator in these routes is nonzero: 2 in k by odd characteristic, finite cardinalities and positive square roots in ℂ, and determinants of invertible operators (including their parity restrictions). Finite J excludes the infinite-index junk value 0 of Subgroup.index. Finite-dimensional function spaces exclude the default determinant value used on spaces without a finite basis. The field hypotheses exclude the zero ring and q=1. Noncompactness, inseparability, nonreduced bases, DVR coefficients and arbitrary covers/fans are not admitted carriers of these statements. Rank-zero cases above are genuine nonzero one-dimensional representations. Nonabelian Q₈ and S₃ tests supplement the Heisenberg and cyclic tests.

### Source sample and locator verification

Read the four available cached texts at their numbered lines; did not infer the contents of the settled paywalled source. The cited F21 and S08 page numbers are the declared arXiv versions, N02 numbers are journal pages, and FS25 is the declared author manuscript. No duplicate key, absent cited work or newly requested source was needed.

| Seeded target | Text opened and comparison |
|---|---|
| 0.1 | FS25 lines 540–559, Lemma 3.3.4 and preceding paragraph, p.15: partial polarization and quotient/mixed model. N02 lines 64–70, §2, p.16: standard finite-field form. The construction for an arbitrary isotropic subspace uses the explicitly named symplectic-basis supplier, rather than claiming the paper proves a new abstract basis theorem. |
| 0.2 | Exact native supplier `IsAlt.exists_basis_toMatrix_eq_J`, `TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean:357`; N02 lines 68–70 checks the sign. It gives the standard form after swapping/reordering the basis. |
| 1.1 | F21 lines 1320–1321, p.33, and FS25 lines 391–395, Example 3.1.6, p.11: coefficient placement translated, half-form law unchanged. General field version also appears in N02 lines 64–70. |
| 1.2 | N02 lines 71–75, §2, p.16; FS25 lines 544–559, Lemma 3.3.4, p.15: operator formula, induction and evaluation model. Right-coset sign verified against the pinned induction action. |
| 1.5 | FS25 lines 544–559 and N02 lines 185–225, Theorem 4.1, pp.19–20, support induced/Fourier models. The particular unnormalized averaging constant is expressly the roadmap's own and follows by the displayed character-sum computation. |
| 2.1 | N02 lines 175–184, §4, p.19; FS25 lines 626–632, Construction 3.4.2, p.17. N02's multiplier equation is reciprocal to the roadmap's; the roadmap is consistent with its pinned Tau Ceti convention. |
| 2.2 | N02 lines 230–245, Theorem 4.2, pp.20–21, and lines 298–316, Theorem 4.3, p.22. Line311 gives the legible determinant ratio despite damaged OCR elsewhere. FS25 lines 626–632 confirms the three linearizations at Sp₂(𝔽₃). The roadmap's scalar-rescaling proof establishes its uniqueness normalization. |
| 2.3 | N02 lines 131–132, Theorem3.3, p.18; lines185–225, Theorem4.1, pp.19–20; lines322–349, p.23; lines351–372, Example4.4, pp.23–24. Signs, positive Fourier normalization, quadratic determinant and κ_J agree. |
| 2.4 | FS25 lines626–632, Construction3.4.2, p.17; F21 lines1286–1293, p.32: assembling and using the Weil–Heisenberg action. The roadmap states its normal-first multiplication explicitly. |
| 2.5 | FS25 lines633–640 and649–662, Remark3.4.3 and Definitions3.4.4–3.4.5, pp.17–18: special isomorphism and the required extension/equivariance. The abstract pullback assertion follows for any K with the stated equivariance. |
| 3.1 | FS25 lines540–559, Lemma3.3.4(a),(b), p.15; F21 lines1298–1326, pp.32–33. Support at zero and evaluation are supported; the sign was recomputed in the roadmap's own half-form/right-translation convention. |
| 3.3 | F21 lines1321–1326 and1346–1349, proof of Lemma7.10 and footnote3, p.33: quadratic twist before induction. Direct Gerardin77 verification remains uncertified. |
| 3.4 | S08 lines1241–1274, Lemma5.6 pp.29–30 and Corollary5.7 p.30; lines1387–1406, Lemma5.12 p.33; FS25 lines544–559. These give the classical-group and Heisenberg instances. The general finite-group assertion is the roadmap's character-pairing derivation, checked above; the sources do not independently assert its full abstract signature. R02 corrects a Check, not that derivation. |
| 4.1 | F21 lines1327–1337, proof of Lemma7.10 p.33, plus N02 lines328–349, p.23: invariant line and determinant character. The roadmap gives its own argument via generators, avoiding a blanket use of general-linear commutator subgroups. |
| 4.2 | F21 lines1178–1186 p.30,1287–1291 p.32,1338–1345 p.33; S08 lines572–578 p.14,1272–1274 p.30,1392–1406 p.33: tensor/induction instances. General normalized compatibility is proved by the roadmap's parity-determinant route; these source instances alone do not replace that argument. |

Also reopened N02 lines81–104 (Lemma2.1 and following Stone–von Neumann discussion, pp.16–17), FS25 lines509–514 (Lemma3.3.1, p.14), S08 lines572–578 (Proposition3.5, p.14), and F21 lines1197–1250 (Lemmas7.7–7.8, pp.30–31) for the additional headlines. FS25 initially works with Heisenberg F_p-groups and F21/S08 with their constructed groups; the README's explicit elementary arguments handle its wider finite-field and fully ramified settings. No unsupported generalization was needed in a proof step.

### Pinned declarations and duplication audit

Pins checked from `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The following are file-and-line references within those pinned libraries; their definitions/statements, not just their names, were opened.

| File at pin | Declarations / content verified |
|---|---|
| `TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean:96` | `TauCeti.FactorSet`; `Extension` at180 has coefficient `left` and quotient `right`; `inl` at296 sends a to (a,1). |
| `TauCeti/Algebra/GroupAction/Trivial.lean:51` | `trivialMulDistribMulAction`, the action used by the factor-set body. |
| `TauCeti/LinearAlgebra/BilinearForm/Isometry.lean:183` | `isometryGroup`; membership theorem at196 is preservation of B on every pair. |
| `TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean:357` | `IsAlt.exists_basis_toMatrix_eq_J`; `IsAlt.even_finrank` at365, with finite-dimensionality, alternation and nondegeneracy. |
| `TauCeti/GroupTheory/SpecificGroups/Heisenberg.lean:58` | `HeisenbergGroup`, `card_eq` at89, multiplication at95 and `commutatorElement_eq` at116: central coordinate z+z′+xy′ and commutator xy′−x′y. |
| `TauCeti/RepresentationTheory/LinearCharacter/Basic.lean:162` | `FDRep.ofLinearCharacter`, one-dimensional module with scalar action (unbundled definition at81). |
| `TauCeti/RepresentationTheory/Induction/FiniteDimensional/Basic.lean:259` | `Rep.indSubtypeEquivPi_ρ_apply`: right-coset representative q.out*g, with the positive subgroup action; `indFDRep` at375, `indFDRepForgetEquiv` at381, `finrank_indFDRep` at640. |
| `TauCeti/RepresentationTheory/ProjectiveRepresentation/Basic.lean:97` | `IsProjectiveRep`: ρ(g)ρ(h)=α(g,h)ρ(gh), identity normalization; `rescale` at133 gives c(g)c(h)c(gh)⁻¹α(g,h). |
| `Mathlib/LinearAlgebra/BilinearForm/Properties.lean:236` | `IsAlt`; `Nondegenerate` at291 delegates to two-sided separation, defined in `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean:547`. |
| `Mathlib/LinearAlgebra/BilinearForm/Orthogonal.lean:102` | `orthogonal`; `finrank_orthogonal` at240. Underlying carrier in `Mathlib/LinearAlgebra/SesquilinearForm/Orthogonal.lean:48` is all y with B(x,y)=0 for x in the subspace; alternation makes the orientation harmless here. |
| `Mathlib/LinearAlgebra/BilinearMap.lean:317` | `LinearMap.mk₂`; `Module.Dual` in `Mathlib/LinearAlgebra/Dual/Defs.lean:61` is the native linear-map dual. |
| `Mathlib/LinearAlgebra/SymplecticGroup.lean:58` | `Matrix.J = fromBlocks 0 (-1) 1 0`, the negative of the README matrix. |
| `Mathlib/Algebra/Group/AddChar.lean:72` | `AddChar` supplies zero/add laws, not injectivity or nontriviality. |
| `Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean:83` | `AddChar.IsPrimitive.of_ne_one`; `sum_mulShift` at257, with finite ring and domain coefficients. |
| `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean:120` | `quadraticChar`; `quadraticChar_neg_one` at267. `quadraticChar_two` is in `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/GaussSum.lean:37`. |
| `Mathlib/RepresentationTheory/Basic.lean:48` | `Representation` is G→*End(V); no irreducibility is built into the carrier. |
| `Mathlib/RepresentationTheory/Irreducible.lean:29` | `Representation.IsIrreducible` uses a simple order of subrepresentations, including nontriviality. |
| `Mathlib/RepresentationTheory/Intertwining.lean:320` | `Representation.Equiv`; near-match `Equiv.dualTensorHom` at857 is the dual-tensor/Hom equivalence, not a Stone–von Neumann or Weil theorem. |
| `Mathlib/RepresentationTheory/Character.lean:56` | `Representation.character`; `Representation.char_orthonormal` at144 and `FDRep.char_orthonormal` at248, with invertible group order and algebraic closure. |
| `Mathlib/RepresentationTheory/FinGroupCharZero.lean:90` | `simple_iff_end_is_rank_one`; `simple_iff_char_is_norm_one` at121 has characteristic-zero hypothesis, satisfied by ℂ. |
| `Mathlib/RepresentationTheory/Maschke.lean:159` | `MonoidAlgebra.Submodule.exists_isCompl`. |
| `Mathlib/RepresentationTheory/Invariants.lean:73` | `Representation.invariants` is the subspace of v with ρ(g)v=v for every g; it does not assert nonzero dimension. |
| `Mathlib/RepresentationTheory/Induced.lean:132` | `Rep.indResHomEquiv`, induction/restriction Frobenius reciprocity, with universe-maximized carriers. |
| `Mathlib/LinearAlgebra/Determinant.lean:164` | `LinearMap.det`, default1 if no finite basis; `LinearEquiv.det` at416; finite-dimensionality prevents misuse of the default here. `LinearMap.trace` is in `Mathlib/LinearAlgebra/Trace.lean:75`. |
| `Mathlib/Algebra/Module/Submodule/LinearMap.lean:209` | `LinearMap.restrict`, explicit subspace-preservation hypothesis. |
| `Mathlib/GroupTheory/SemidirectProduct.lean:46` | Normal-first carrier and multiplication at63. `Subgroup.index` in `Mathlib/GroupTheory/Index.lean:55` has default0 for infinite index; all uses here are finite. `Subgroup.Normal.conj_mem` is in `Mathlib/Algebra/Group/Subgroup/Defs.lean:608`. |
| `Mathlib/LinearAlgebra/Pi.lean:110` | `LinearMap.single`, used by the R01 signature to state the actual block decomposition. |

Object searches in the pinned representation-theory and linear-algebra trees found no supplied finite Weil/Stone–von Neumann theorem matching these headlines. The rank-one Heisenberg carrier is imported and explicitly compared. The apparent dual-product near-match in `Mathlib/LinearAlgebra/QuadraticForm/Dual.lean:38` is the symmetric form f(y)+g(x), not this alternating form. `Module.natCard_eq_pow_finrank` in `Mathlib/FieldTheory/Finiteness.lean:98` and `finrank_eq_nat_card_basis` in `Mathlib/LinearAlgebra/Dimension/StrongRankCondition.lean:433` do not give the representation-theoretic dimension, character support or uniqueness conclusions. None of the seven admitted statements is supplied by those near-matches. No package declaration uses another roadmap's fully qualified name.

### Suppliers, ownership and open-head overlaps

Read two main-branch roadmap examples in full where relevant to their contracts and shape: `TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md` and `TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md`. Resolved every cross-roadmap supplier citation afresh:

- `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md`, open PR #1063: §0.1 line77; §§0.3–0.8 lines103,119,127,135,154; §§0.9–0.10 lines172,194; §0.9a line180. Factor sets, half-form commutator/centre, isometry extension/action, polarization correction/equivalence and Lagrangian complements/transitivity all have the cited content. The open-head tool adds one banner line; these references remove it. Local smooth/unitary Stone–von Neumann is in §§1.1–1.2, lines346 and356; §4.7 line1244 concerns the discriminant module and Mp₂(ℤ), not the finite symplectic-group representation here.
- `TauCetiRoadmap/MordellLawrenceVenkatesh/README.md`, open PR #1231: §§3.1–3.2 lines1331 and1343. The first is the Lagrangian dimension criterion; the second extends an entire prescribed basis over every field. It consumes MetaplecticAutomorphicForms §0.9a, consistent with the supply direction.
- `TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md` on main: Layers0,2,4,5,7 at lines213,268,503,607,721. Read the corresponding current PR #1187 head too: the cited layers still exist and consume the native induction/projective/character library. This package cites the roadmap on main, not a revision-only identifier.
- `TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md` on main: native orthogonality at lines174 and299. The consumed characteristic-zero character inputs are correctly delegated.

The mechanical dependency check was run exactly as prescribed. Output:

```text
depcheck: 236 roadmaps, 2137 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. In `merge-order/ORDER.txt`, MetaplecticAutomorphicForms is line151, MordellLawrenceVenkatesh line161 and this package line200. Read all 18 Needs lines and all supplier-contract bullets: no prohibited supplier, nonexistent supplier target, upward edge or unowned proof prerequisite was found. `design/plan.json` has an empty gaps list and the README declares none.

`roadmaps resolve` reports no missing roadmap citation or Lean name; its own warning says it did not check external library names, so the pinned-file checks above supply that evidence independently. The supplied `scratch/overlaps.md` reports no conflicting head, dropped cited id, dropped owned id or revision-only identifier. The live `roadmaps overlaps` command cannot locate this package as a content roadmap yet, so it adds no contrary evidence; this is not treated as a missing-roadmap finding.

Used `roadmaps grep` over main and the available open heads for the objects “fully ramified”, “Gérardin”, “finite Weil”, “Schrödinger” and “special isomorphism”, then read relevant scopes. The nearest additional head, PR #1736, `TauCetiRoadmap/ExceptionalThetaCorrespondencesForG2/README.md:6` and `:101`, owns exceptional local-field/minimal-representation comparisons and consumes the base local oscillator theory, not these finite-field constructions. No competing finite general owner was found. The board-package index was read before this conclusion; its three listed packages concern analytic number theory, Lawrence–Venkatesh and logic/definability, not a competing declared finite Weil library. No assertion that a roadmap exists nowhere was based on this board checkout alone. Ownership against open pull requests without accessible files was not checked beyond the provided indexed main/head searches.

## Not verifiable

- **Gerardin77, Theorem2.4(b):** direct text remains paywalled and explicitly `uncertified` in the existing manifest. No new request was made. The reported correction was read in F21 lines1346–1349, and its quadratic character was independently tested above.
- **N02 OCR:** exponents in lines300,310 and316 are damaged. The legible ratio in line311, the generator discussion in lines322–349 and the independent determinant calculations support the roadmap's formula. The damaged glyphs themselves were not certified against a newly rendered image.
- **Open-overlap service:** this package is not yet indexed as a content-roadmap pull request, so the live per-roadmap overlap command cannot recompute its package-specific list. The worker-provided head-derived overlap file and direct resolutions were used, as described above.

## Source issues

- **Misprint** in N02 at the computation after Theorem4.3, printed p.23 (N02 lines343–344): the source says the generator's permutation is even but has sign minus one; it should be an odd permutation, since its single cycle has even length; affects nothing.
- **Misprint** in FS25 at equation(3.3.3), p.14 (FS25 line522): the source says the pairing of representatives x and y is their commutator with z; it should be the commutator of x and y; affects nothing.
- **Error** in Gerardin77 at Theorem2.4(b), as reported by F21 footnote3, p.33 (F21 lines1346–1349): the source says to induce the pulled-back smaller Weil–Heisenberg representation without a determinant twist; it should first tensor with the quadratic determinant character of the isotropic subspace; affects a stated result; corrected in print at F21, footnote3.
