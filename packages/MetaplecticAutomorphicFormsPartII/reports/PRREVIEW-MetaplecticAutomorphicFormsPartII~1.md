# Review of MetaplecticAutomorphicFormsPartII (pull request #2261 at 32356e5)

**Verdict:** needs changes

## R01 (P3) — Give the even projector its API and Checks

**Location:** `TauCetiRoadmap/MetaplecticAutomorphicFormsPartII/README.md:280`: “Define `evenPart X` as the projector”; the API and Checks follow at lines 286–299.
**Claim:** The projector needs its own API and at least three discriminating Checks. The listed API concerns the normalized Weil representation; the Checks compute restricted determinants without evaluating the projector used in the Lean definition.
**Witness:** `TauCetiRoadmap/MetaplecticAutomorphicFormsPartII/Suggested.lean:208` gives eδ₀=δ₀, eδ₁=(δ₁+δ₂)/2 and e(δ₁−δ₂)=0 over 𝔽₃. None is tested in the README; omitting the denominator doubles the first two outputs.
**Repair:** Add API bullets asserting e²=e, image(e)={even functions}, and kernel(e)={odd functions}. Add three Checks over 𝔽₃: eδ₀=δ₀, excluding the zero and odd projectors; eδ₁=(δ₁+δ₂)/2, excluding the identity and unnormalized sum; e(δ₁−δ₂)=0, excluding the identity. Keep these in the README, with the elementary projector calculation following N02, Theorem 4.2, pp. 20–22.

## Verified sound

Here ζ=exp(2πi/3), δₐ is the indicator of a, and e=(1+R)/2. “Excluded” identifies a negative control violating a stated hypothesis.

| Statement | Instances tried | Computed left side | Computed right side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| Conventions: nontrivial versus injective ψ | 𝔽₉=𝔽₃(i), i²=−1, ψ=ψ₃∘Tr | ψ(i)=1; Σψ=3(1+ζ+ζ²)=0 | Nontrivial character sum=0 | Noninjectivity allowed | — |
| §0.1 adapted coordinates; FS25 line 1698, Appendix A, p. 44 | I an axis in 𝔽₂²; a line in 𝔽₃⁴ | dim V=2; 4 | 2 dim I+dim V₀=2; 4 | Equal, including characteristic 2 | — |
| §0.1 quotient and complement | I=0; I Lagrangian; I a line in 𝔽₃⁴ | dim(I⊥/I)=dim V; 0; 2 | dim V₀=dim V; 0; 2 | Equal | — |
| §0.1 isotropic-complement condition | I=⟨e₁,e₂⟩; proposed partners f₁+e₂,f₂ | ω(f₁+e₂,f₂)=1 | Standard dual-half pairing=0 | Wrong complement excluded | — |
| §0.2 polarizationForm; TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean:357 | Plane, reversed pair, zero space | ω(e,f)=1; ω(f,e)=−1; radical(0)=0 | Dual evaluation=1; −1; nondegenerate zero space | Equal | — |
| §0.2 J, Levi and shear | J(e)=−f, J(f)=e; m(2) over 𝔽₅; u(1) | Pairings=1; 2·3=1; ω((1,1),(0,1))=1 | Original pairing=1 in each case | Isometries; opposite J changes the element | — |
| §1.1 heisenbergFactorSet and Heisenberg | 𝔽₃ plane; e then f | Product=(2,e+f); reverse=(1,e+f) | Commutator=(1,0)=ω(e,f) | Equal | — |
| §1.1 characteristic and rank boundaries | Characteristic 2; V=0 over 𝔽₃ | Half-form commutator=0; order=3 | Nonzero plane form=1; q=3 | Characteristic 2 excluded; rank zero valid | — |
| §1.1 comparison with native HeisenbergGroup | (0,e)(0,f) over 𝔽₃ | Corrected central coordinate=2+1/2=1 | Native xy′ contribution=1 | Equal; uncorrected value=2 fails | — |
| §1.1 heisenbergAction | J applied to e·f; non-isometry diag(2,1) | J image=(2,(1,−1)); non-isometry image=(2,(2,1)) | Product of images=(2,(1,−1)); (1,(2,1)) | Isometry works; non-isometry excluded | — |
| §1.1 action composition | J u(1) on e over 𝔽₃ | Direct action=(1,−1) | Sequential action=(1,−1) | Equal; inverse-action convention gives (0,1) versus (1,1) | — |
| §1.2 Schrödinger representation; N02 line 72, §2, p. 16 | T,M on δ₁; z=0 | TMδ₁(0)=ζ; MTδ₁(0)=1 | ζ·MTδ₁(0)=ζ | Correct commutator sign | — |
| §1.2 half phase and induced comparison | Product (2,1,1); induced section z=0 over 𝔽₃ | π(2,1,1)δ₁(0)=ζ | Induced coset phase=ψ(2+1/2)=ζ | Equal; negative half phase gives 1 | — |
| §1.2 model boundaries | X=0; ψ=1 on a plane | Model dimensions=1; 3 with invariant constants | Central-character line; proper invariant dimension=1 | Zero model avoided; trivial ψ reducible | — |
| §1.3 character; N02 line 81, Lemma 2.1, pp. 16–17 | 𝔽₃ plane: central 1, translation, modulation | Traces=3ζ, 0, 1+ζ+ζ²=0 | qψ(1), 0, 0 | Equal; norm=3·9/27=1 | — |
| §1.3 finite_stoneVonNeumann (headline) | q=3, n=0,1,2; trivial ψ control | Irreducible dimensions squared=1,9,81; control=1 | Cardinalities=1,9,81; control=9 | Equal under hypotheses; trivial ψ excluded | — |
| §1.3 uniqueness and isotypy | Two copies of Sψ over 𝔽₃ | Character norm=4; multiplicity pairing with Sψ=2 | Two copies; dimension=6 | General representation is isotypic, not irreducible | — |
| §1.4 fullyRamified_unique (headline); S08 line 572, Proposition 3.5, p. 14 | Q₈, H={±1}, θ(−1)=−1 | d²=4; character=(2,−2,0,0,0); norm=(4+4)/8=1 | Index=4; off-H character=0 | Equal, including 2-groups | — |
| §1.4 normality/nondegeneracy boundaries | J=H=S₃, θ=sign; J=C₃,H=1 | d²=1; three extensions for C₃ | Indices=1; 3 | First valid; C₃ fails nondegeneracy | — |
| §1.4 cyclic centre beyond exponent p | Order-p⁴ central product, centre Cₚ² | d²=p²; character norm=p²·p²/p⁴=1 | Index=p² | Equal; no exponent-p hypothesis | — |
| §1.5 averaging intertwiners; N02 line 185, Theorem 4.1, pp. 19–20, plus stated derivation | Equal/transverse lines over 𝔽₃; V=0 | TAA=3id; TABTBA=9id,3id,1id | Card(A)Card(A∩B)=9,3,1 | Equal; identity normalization fails transversely | — |
| §2.1 projective action; N02 line 175, §4, p. 19 | μ(J)=F; rescale by 2 | F²=R; (2F)²=4R | c(J,J)=1; rescaled c=4 | Coboundary direction agrees with pin | — |
| §2.1 exact parity commutation | 𝔽₃ model | Tr(R)=1; Tr(−R)=−1 | Trace after conjugation=1 | Negative parity scalar excluded | — |
| §2.2 evenPart (R01) | δ₀, δ₁, δ₁−δ₂ over 𝔽₃ | e outputs δ₀, (δ₁+δ₂)/2, 0 | e² outputs the same; unnormalized sum doubles first two | Formula valid; API/Checks absent | R01 |
| §2.2 existsUnique_isNormalizedWeil (headline); N02 line 311, Theorem 4.3, p. 22 | q=3,u(1); order-three scalar twist | det W=ζ²; det(ζW)=ζ² | (det W⁺)²=ζ²; (det(ζW)⁺)²=1 | Normalization distinguishes exceptional linearizations | — |
| §2.2 scalar correction and rank zero | Rescale μ by 2; q=5; n=0 | κ(2μ)=κ(μ)/2; 5−2·3=−1; det=1 | κ(2μ)·2μ=κ(μ)μ; exponent=−1; det²=1 | Equal; inverse ratio would multiply W by 4 | — |
| §2.3 generator formulas; N02 lines 185, 328, 347, pp. 19, 23 | q=3,u(1),m(−1),J | diag(1,ζ,ζ); −R; det F=−i | ψ(−z²/2); χ₃(−1)R; κJ F=−iF | Equal | — |
| §2.3 generator signs; N02 line 351, Example 4.4, pp. 23–24 | q=5,m(2),J; q=3,J on translation | W(m(2))δ₀=−δ₀; det F=−1; FTF⁻¹=M⁻¹ | χ₅(2)δ₀=−δ₀; κJ=−1; J(e)=−f | Equal; inverse Fourier sign fails | — |
| §2.4 semidirect representation; FS25 line 626, Construction 3.4.2, p. 17 | (h,1)(1,J), h=(0,e), over 𝔽₃; V=0 | Ω product=TWJ; rank-zero centre=ψ | Ω(h,J)=TWJ; ψ | Equal; reversed order WJT differs | — |
| §2.5 equivariant transport; FS25 lines 649, 656, Definitions 3.4.4–5, pp. 17–18 | K=⟨u(1)⟩; w=f or e | u(1)f=f; u(1)e=e+f | Required fixed vector=f; e | First transport valid; second central coordinates 1 versus 0 | — |
| §2.5 conjugated data and exponent boundary | g₀=J; exponent-p² group versus plane H | J u(1) J⁻¹ acts on Jv as J u(1)v; element order p² | Same vector; every H element has order dividing p | Conjugation valid; group isomorphism excluded | — |
| §3.1 mixed model; FS25 line 544, Lemma 3.3.4, p. 15 | 𝔽₃ plane, I=y-axis, j=x-axis | π(0,i) at j=1 multiplies by ζ | ψ(ω(j,i))=ζ | Correct sign; FS25 display has opposite sign | — |
| §3.1 invariant support and evaluation | I=0, Lagrangian, line in 𝔽₃⁴ | Invariant dimensions=qⁿ,1,3 | q^(dim V₀/2)=qⁿ,1,3 | Support at zero in the complementary coordinate | — |
| §3.2 parabolic fixed space; F21 line 1322, proof of Lemma 7.10, p. 33 | q=5,I=y-axis,m(2) | W(m(2))δ₀=−δ₀ | χ₅(det on I)=χ₅(3)=−1 | Twist required; untwisted value +1 fails | — |
| §3.2 radical and quotient factor | q=3,X=k²,I=first dual axis; shear phase x₁x₂ | On x₁=0 phase=ψ(0)=1; residual model dimension=3 | Radical action=id; quotient model dimension=3 | Equal | — |
| §3.3 parabolicSubgroup | q=3,I=x-axis,P=⟨J⟩ | Generated subgroup contains x- and y-translations, hence H | Set with v∈I⊥ contains only x-translations | Stabilizer hypothesis necessary | — |
| §3.3 weilHeisenberg_parabolic_induction (headline); F21 line 1346, footnote 3, p. 33 | q=3,n=2,dim I=1 | dim Ω=9 | Index·dim σ=3·3=9 | Equal; determinant character retained | — |
| §3.3 quotient presentation boundaries | I=0; I Lagrangian, q=5 | Q=whole group, det on 0=1; dim Ω=5 | Induction index=1; index·dim σ=5·1 | Equal; r has prescribed kernel and form | — |
| §3.4 fullyRamified_isotropicInvariants (headline); S08 line 1392, Lemma 5.12, p. 33, plus stated derivation | H(𝔽₃⁴), U lifting a line | dim(Eᵁ)² Card(HU)=3²·9=81 | Card(Q)=81; induced dimension=3·3=9 | Equal; character θU is not the 3-dimensional ηU | — |
| §3.4 invariance hypothesis boundaries | U=1; U=H with nontrivial θ | d² Card(H)=Card(J); bad case=0 | Card(Q)=Card(J)>0 in both cases | First valid; second excluded by hU | — |
| §4.1 isNormalizedWeil_lagrangian_fixed (headline); N02 line 328, p. 23; F21 line 1332, p. 33 | q=5,m(2) on constants; q=9,−1 on δ₀; X=0 | Eigenvalues=−1,+1,+1 | χ₅(2)=−1; χ₉(−1)=+1; det on 0=1 | Equal | — |
| §4.1 determinant along a flag | q=5, determinants 2 and 2; unipotent pair | χ₅(2·2)=χ₅(4)=1; χ(1)=1 | χ₅(2)χ₅(2)=1; fixed scalar=1 | Equal; square hypotheses sufficient | — |
| §4.2 isNormalizedWeil_pi_tensor (headline); F21 line 1178, p. 30; S08 line 1401, p. 33 | Two 𝔽₃ planes, J⊕J, δ₀⊗δ₀ | det(F⊗F)·1/3=(−i)⁶/3=−1/3 | (−i/√3)²=−1/3 | Equal; dimensions 9=3·3 | — |
| §4.2 common character and empty tensor | ψ₁=ψ₃,ψ₂=ψ₃⁻¹; central tuple (1,−1); empty family | Central scalar=ζ²; empty value=1 | Descent requires 1; empty product=1 | Different characters excluded; empty family valid | — |

- Sources: all 15 seeded targets covered (14 against F21/S08/N02/FS25, §0.2 against the pinned symplectic-basis theorem); 0 README locators flagged unverified; Gérardin access limitation below.
- Pinned Mathlib: 18 declarations inspected, including `Mathlib/RepresentationTheory/Character.lean:144`, `:248`; `FinGroupCharZero.lean:90`, `:121`; `Induced.lean:77`, `:132`; `Invariants.lean:73`; `Maschke.lean:159`; `Basic.lean:618`; `Mathlib/LinearAlgebra/BilinearForm/Orthogonal.lean:240`, `Properties.lean:350`; `SymplecticGroup.lean:59`; `Determinant.lean:164`; `Mathlib/FieldTheory/Finiteness.lean:98`; `Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean:83`, `:257`; `QuadraticChar/Basic.lean:134`, `:159`.
- Pinned Tau Ceti: 18 declarations inspected in `TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean:554`, `:561`; `SpecificGroups/Heisenberg.lean:89`, `:116`; `TauCeti/LinearAlgebra/BilinearForm/Isometry.lean:183`, `:196`, `SymplecticBasis.lean:357`, `:365`, `LagrangianBasis.lean:131`; `Matrix/GeneralLinearGroup/Symplectic/TorusGeneration.lean:145`; `TauCeti/Geometry/Symplectic/Cotangent/Basic.lean:80`; `TauCeti/RepresentationTheory/LinearCharacter/Basic.lean:162`, `Induction/FiniteDimensional/Basic.lean:259`, `:375`, `:381`, `:640`, `ProjectiveRepresentation/Basic.lean:97`, `:133`.
- Supplier citations: 6 roadmap scopes resolved against main or their supplied open heads; all `Needs` lines read; no missing cited section, second copy, dropped-id conflict or shared-folder conflict found.
- Dependency output: `depcheck: 214 roadmaps, 1900 edges, 0 problem(s)`.
- Lean: all 15 declarations checked with `#check @name`; 0 lost required binders; 7 headline signatures present; 7/7 fail the `simp`, `rfl`, `infer_instance` padding probes; inspected library candidates do not prove them.
- Validation: worker gate passes every check; direct elaboration exits 0 with exactly 7 `sorry` warnings; numerical matrix verification of 729 Heisenberg products has maximum discrepancy below 7×10⁻¹⁶.
- Pull-request text and scope: new folder, 969 added lines, 0 removed declarations, 0 outside-folder paths; description matches the head; worktree remains clean.

Overlap check: read MetaplecticAutomorphicForms (#1063), MordellLawrenceVenkatesh (#1231), and RepresentationTheory/InductionRestriction (main), the complete closest-roadmap lists; bilinear extensions/action/complements belong to MetaplecticAutomorphicForms §0, the Lagrangian dimension criterion to MordellLawrenceVenkatesh §3.1, and induction/Clifford/projective APIs to InductionRestriction and its pinned implementations. Also read CharacterTheory, ReductiveGroupsPartII, SmoothRepresentationsOfLocalGroups and OperatorAlgebraDynamics; the latter's Hilbert-space Weyl classification has different carriers from the finite algebraic character and normalized-Weil targets here. No second owner of those targets found.

Source independence: 20 passages compared with 4 source texts, with no copied expression or reused tables detected; largest share FS25, 17 of 41 source-citation occurrences before References. FS25 contents (line 33) compared: independent arrangement, splitting its §3.3 between Layers 1 and 3 and placing Appendix A first. The dependencies §1.3→§2.1→§2.2 and §§2.3,3.1→§3.2 force the principal order. Gérardin's text and contents were unavailable.

## Not verifiable

- Gerardin77, Theorem 2.4(b): publisher DOI access is settled as uncertified in the source manifest; direct text was not inspected. Its correction is readable in F21 line 1346, footnote 3, p. 33; no new source request made.

## Source issues

- **Misprint** in N02 at the computation after Theorem 4.3, printed p. 23 (N02 line 343): the source says a cycle of length q−1 is even while assigning it sign −1; it should be odd, since q−1 is even; affects nothing.
- **Misprint** in FS25 at equation (3.3.3), p. 14 (FS25 line 522): the source says the pairing of the cosets represented by x and y uses a commutator with z; it should be the commutator of x and y; affects nothing.
- **Error** in FS25 at the displayed action in the proof of Lemma 3.3.4, p. 15 (FS25 line 557): the source says translation is by +v⁻ and the modulation phase is ψ(ω(v⁺,x)); it should be ψ(ω(x,v⁺)+ω(v⁻,v⁺)/2) in half-form coordinates, retaining the displayed ω₀(a,v₀) factor; affects the proof.
- **Error** in Gerardin77 at Theorem 2.4(b), as reported by F21 footnote 3, p. 33 (F21 line 1346): the source says to induce the quotient Weil–Heisenberg representation without the determinant character; it should be tensored with the quadratic determinant character on the isotropic subspace before induction; affects a stated result; corrected in print at F21, footnote 3.

## For the human reviewers

- FS25 is the author-hosted manuscript dated April 15, 2025 (FS25 line 20), recorded as `author-page` in `packages/MetaplecticAutomorphicFormsPartII/sources.toml`; publication and reuse licence are not established by that access classification.
- Gerardin77 is settled as uncertified in `packages/MetaplecticAutomorphicFormsPartII/sources.toml`; wording and arrangement could not be compared directly with it. F21 supplies the readable correction, and FS25 has the largest citation share.
