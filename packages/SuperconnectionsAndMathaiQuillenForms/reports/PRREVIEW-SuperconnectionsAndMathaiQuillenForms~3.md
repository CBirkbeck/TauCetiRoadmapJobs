# Review of SuperconnectionsAndMathaiQuillenForms (pull request #2297 at 0c22c1f)

**Verdict:** needs changes

## R01 (P1) — Preserve the supplier’s signed rank-zero Euler class

**Location:** TauCetiRoadmap/SuperconnectionsAndMathaiQuillenForms/README.md:809, 835, 894: “equals `Pf(R/2π)`” and “`0*τ_∇ = e(∇)`”.
**Claim:** The bundle statements include rank zero but identify its Euler form with the unsigned empty-matrix Pfaffian, contradicting the chosen-orientation convention of the supplier.
**Witness:** For the negatively oriented zero bundle over a point, Berezin(1)=−1 and Euler=−1, whereas Pf(empty)=1. TauCetiRoadmap/CharacteristicClasses/README.md:169–171, 206–208 explicitly retains this sign.
**Repair:** State: “In rank zero let o:M→{±1} be the chosen orientation relative to the empty basis; the fibrewise Berezin map is multiplication by o, and e(∇)=e_(∇,0)=τ_∇=o. The scalar empty-matrix Pfaffian is 1.” Use the signed Euler-form convention in 5.3–5.4; retain the ordinary Pfaffian formula in positive even rank. Add the negative-point Check: e=−1 and oriented fibre integral (−1)(−1)=1.

## R02 (P1) — The Koszul example has the wrong sign for the decay theorem

**Location:** TauCetiRoadmap/SuperconnectionsAndMathaiQuillenForms/README.md:788–790: “`∇_s = ∇ + i(s + s*)` … a superconnection of the form 4.4”.
**Claim:** Section 4.4 requires a self-adjoint odd zeroth-order term. The displayed term is skew-adjoint; with this roadmap’s negative exponential it produces growth.
**Witness:** For s=1 on a trivial line, X=i[[0,1],[1,0]], X*=−X and X²=−I; exp(−t²X²)=exp(t²)I. Garcia2018 line 1128 uses this i with the positive exponential of line 1093.
**Repair:** Replace the example by “On ΛF put c_s=(s∧)+(s∧)*. Then c_s*=c_s, c_s²=‖s‖² and ∇+t c_s satisfies 4.4 off s⁻¹(0). Garcia’s i c_s convention uses exp(+𝔸²).” For s=1 the corrected heat term is exp(−t²)I.

## R03 (P2) — An ungraded bundle can still have a higher-form superconnection

**Location:** TauCetiRoadmap/SuperconnectionsAndMathaiQuillenForms/README.md:734: “`E⁻ = 0: ch(𝔸) = tr exp((i/2π)F)`”.
**Claim:** Vanishing of the odd bundle does not force the superconnection to be an ordinary connection; odd forms of degrees 3,5,… remain allowed by 4.2.
**Witness:** On the trivial line over ℝ⁴ take 𝔸=d+x₁dx₂∧dx₃∧dx₄. Its degree-four character is vol₄/(4π²), whereas the degree-four character of its flat ordinary connection is 0.
**Repair:** Replace by “For E⁻=0 and 𝔸=∇ an ordinary connection, ch(𝔸)=tr exp((i/2π)F_∇).” Add the displayed three-form superconnection as a negative control; retain all higher-form superconnections in 4.2–4.3.

## R04 (P2) — The comparison with Garcia needs a superconnection rescaling

**Location:** TauCetiRoadmap/SuperconnectionsAndMathaiQuillenForms/README.md:147–148: “writes the character with `exp(∇²)` … the same form”.
**Claim:** Changing the exponential sign and the degree normalization alone does not give the same form on a general superconnection.
**Witness:** For 𝔸=d+η, η=x₁dx₂∧dx₃∧dx₄, this convention gives 1+vol₄/(4π²); the stated positive-exponential normalization gives 1−vol₄/(4π²). Garcia2018 lines 1093,1098 specify the latter.
**Repair:** Write “The normalizations agree on ordinary connections. For a general superconnection with form-degree components 𝔸_j, use Garcia’s convention on 𝔸′_j=i^(1−j)𝔸_j; the degree-one connection is unchanged.” In the witness 𝔸′=d−η, and both normalized characters are 1+vol₄/(4π²).

## R05 (P2) — Retain atomicity in the characteristic-current statement

**Location:** TauCetiRoadmap/SuperconnectionsAndMathaiQuillenForms/README.md:1067–1069: “for sections `s₀, …, s_k` … differs from the current of their linear-dependence locus”.
**Claim:** The cited theorem is not a statement for arbitrary sections. Its degeneracy current and locally integrable transgression require the induced bundle map to be k-atomic.
**Witness:** HarveyLawson1994 line 365 (§8, preprint p.8; published p.61) explicitly requires k-atomicity; lines 343–346 define that condition before defining the current.
**Repair:** Replace by “For n=rankℂF and 0≤k<n, if α:ℂ^(k+1)→F determined by the sections is k-atomic in Harvey–Lawson §7, then c_(n−k)(Ω_F)−LD(s₀,…,s_k)=dT with T locally integrable (§8, p.61).” The identically zero section of a line, whose zero set has codimension zero, is excluded.

## R06 (P3) — A rank jump does not prevent choosing a resolvent circle

**Location:** TauCetiRoadmap/SuperconnectionsAndMathaiQuillenForms/README.md:779–781: “near `0` no circle `|w| = ρ` avoids the spectrum”.
**Claim:** The obstruction is that a fixed circle cannot isolate only the zero eigenvalues, not that it must intersect the spectrum on every neighbourhood.
**Witness:** For T=z and |z|<ρ/2, the eigenvalues ±|z| are strictly inside |w|=ρ. The resolvent exists on the circle; its integral is I, while ker X=0 at z≠0.
**Repair:** Replace by “For any ρ>0, on |z|<ρ/2 the circle avoids the spectrum but encloses both eigenvalues; its Riesz projection is I, not the projection onto ker X away from 0. No fixed circle locally isolates precisely the zero eigenvalues.”

## R07 (P3) — Use a nonzero witness for the transgression sign

**Location:** TauCetiRoadmap/SuperconnectionsAndMathaiQuillenForms/README.md:737–738: “The sign of the transgression form is fixed … over a point”.
**Claim:** The proposed Check cannot discriminate the sign: both signs give zero over a point.
**Witness:** The current Check gives 0=−0=+0. For 𝔸_t=d+i t x dy on ℝ², d/dt str exp(−𝔸_t²)=−i dx∧dy; the opposite transgression sign gives +i dx∧dy.
**Repair:** Replace the Check by the latter family: “𝔸_t²=i t dx∧dy, so the derivative is −i dx∧dy=−d(i x dy); the positive sign would give +i dx∧dy.”

## R08 (P3) — The factorial negative control needs rank four

**Location:** TauCetiRoadmap/SuperconnectionsAndMathaiQuillenForms/README.md:605–607: “a value a definition with `(r!)⁻¹` cannot give outside `ℚ`-algebras”.
**Claim:** The example has r=1, so its denominator is the unit 1 in every ring and detects no factorial problem.
**Witness:** For the displayed 2×2 matrix, 1!=1 and the divided-power and factorial formulas both give 1. Over 𝔽₂, J⊕J instead has Pf=1 but (e₀e₁+e₂e₃)²=0.
**Repair:** Keep the 2×2 sign Check, and replace its factorial assertion by “Over 𝔽₂ take Σ=J⊕J. Then ω^[2]=e₀e₁e₂e₃, Pf=1, while ω²=0 and 2!=0; division by the factorial cannot recover Pf.”

## R09 (P3) — The earlier exact-locator finding remains unresolved

**Location:** TauCetiRoadmap/SuperconnectionsAndMathaiQuillenForms/README.md:756–757, 938–939, 989–990: “Ch. 9 … pp. 263–310”; “as stated in its review Zbl 0671.57013”.
**Claim:** Previous R10 is not repaired: a chapter-wide range and a review identifier still do not locate the kernel-limit theorem, the Cayley correspondence or the invariant forms in their sources.
**Witness:** The head retains the same 48-page range for 4.4(b), and neither 6.1 nor 6.2 names a section, equation or page of Quillen1988.
**Repair:** Supply exact theorem/equation and page locators for 4.4(b), 6.1 and 6.2, or a legally readable alternative proving those same statements. Keep BGV1992 and Quillen1988 marked uncertified; this does not request their texts again.

## R10 (P3) — The ring-valued Pfaffian identities lack supporting locators

**Location:** TauCetiRoadmap/SuperconnectionsAndMathaiQuillenForms/README.md:583–585: “Prove `factorial_mul_pfaffian` … `pfaffian_sq` … `pfaffian_mul_mul_transpose`”.
**Claim:** The only nearby source locator is Wu §2.1, which defines a Pfaffian on a real Euclidean space; it does not state these identities over arbitrary commutative rings.
**Witness:** Wu2006 lines 60–81 introduce an oriented real space and define Pf by a Berezin exponential. No determinant-square or congruence identity occurs there; 𝔽₂ is outside that setup.
**Repair:** Attach exact source locators to all three identities, and explicitly identify the arbitrary-ring statement as an integral polynomial extension if the chosen source works over characteristic zero. Retain the zero-diagonal hypothesis and the rank-four 𝔽₂ Check.

## R11 (P3) — Name the pinned normal-form input in the Pfaffian proof route

**Location:** TauCetiRoadmap/SuperconnectionsAndMathaiQuillenForms/README.md:591–595: “the block-diagonal normal form over its fraction field”; “*Needs:* 3.1; Mathlib …”.
**Claim:** The proof route uses the alternating-form normal-form theorem without identifying its existing supplier.
**Witness:** TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean:357 proves LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J for a finite-dimensional nondegenerate alternating form over a field; the roadmap cites no such input.
**Repair:** Add that declaration and module to the Tau Ceti contract and 3.2’s Needs. State that the generic determinant is nonzero by specialization to J⊕⋯⊕J (determinant 1), so the fraction-field form is nondegenerate; reindex the symplectic basis into adjacent pairs before applying the congruence formula.

## R12 (P3) — Give the Thom-form definition its API bullets

**Location:** TauCetiRoadmap/SuperconnectionsAndMathaiQuillenForms/README.md:891–905: “define `τ_∇ = e_(π*∇, x)`”; the paragraph is followed by “**Checks.**”.
**Claim:** The Thom form is a new definition with no API bullet list, although the required prose statements and three Checks are present.
**Witness:** Section 5.4 passes from Needs at line 903 directly to Checks at line 905; it has no API list.
**Repair:** Add API bullets for pullback under bundle pullback, orientation reversal, and ordered direct sums of the Thom forms, alongside s*τ_∇=e_(∇,s) and fibre integral 1. For trivial oriented lines the direct-sum formula gives the positive two-dimensional Gaussian.

## R13 (P3) — Update the description for the new scope and suppliers

**Location:** Pull request #2297 description, “Scope” supplier list and “Acceptance test” definition list.
**Claim:** The description omits the added kernel-projection and Grassmannian-embedding targets, the inverse Cayley theorem and definition, and three new roadmap suppliers.
**Witness:** TauCetiRoadmap/SuperconnectionsAndMathaiQuillenForms/README.md:244–251 adds GeneralizedCohomology, LieGroups and LieGroupoidsPoisson; :747–765 adds the projection; :978–985 adds the embedding; TauCetiRoadmap/SuperconnectionsAndMathaiQuillenForms/Suggested.lean:415,437 adds cayleyInv and its converse.
**Repair:** Add: “This head also constructs the locally constant kernel’s spectral projection, the embedding W↦2P_W−1 and its tautological connection, and the inverse Cayley correspondence. New suppliers are GeneralizedCohomology G4.0b, LieGroups Layer 2 and LieGroupoidsPoisson G0.1; additional contracts are SmoothBundlesConnections B2.2 and CharacteristicClasses C5.5. The exterior-supercommutativity target is consumed from Mathlib; The acceptance test adds the definition cayleyInv and the theorem cayley_cayleyInv, and drops the exterior-supercommutativity theorem, retaining 16 admitted theorems.” GeneralizedCohomology’s cited content already exists on main; no dependency on #1808 is needed.

## Verified sound

| Statement | Instances | Computed left side | Computed right side | Result | Change |
|---|---|---|---|---|---|
| 1.1 IsSuperCommutative | Λ(ℤ²), e₀,e₁; trivially graded M₂(ℤ) | e₀e₁; E₁₁ | −e₁e₀; E₂₂ | exterior agrees; matrix nonexample | — |
| 1.1 parityInv | 1+e₀+e₀e₁; apply twice | 1−e₀+e₀e₁; 1+e₀+e₀e₁ | σ(1+e₀+e₀e₁); original element | agrees | — |
| 1.1 parityPow | odd e, k=0,1; 𝔽₂ | e,−e; e | (−1)^k e; e | agrees | — |
| 1.1 exterior-supercommutativity supplier | Q=0; odd e₀,e₁ | e₀e₁ | −e₁e₀ | agrees | — |
| 1.2 sPar | inl(*),inr(*) | 0,1 | even,odd | agrees | — |
| 1.2 blockGrading | I,E₁₂; m=n=1 | I∈B₀, E₁₂∈B₁ | I∉B₁, E₁₂∉B₀ over ℤ | agrees | — |
| 1.2 blockPart | X=[[1,2],[3,4]] | X₀=diag(1,4); X₁=[[0,2],[3,0]] | entry projections of X | agrees | — |
| 1.2 blockPart_mem | X above; i=1 | off-diagonal projection | forbidden diagonal entries 0 | agrees | — |
| 1.2 blockPart_zero_add_blockPart_one | X above | diag(1,4)+[[0,2],[3,0]] | [[1,2],[3,4]] | agrees | — |
| 1.2 blockPart_of_mem | X=E₁₂∈B₁ | blockPart₁ X=X; blockPart₀ X=0 | if 1=j then X else 0 | agrees | — |
| 1.2 blockDecompose | X above | in₀(diag(1,4))+in₁([[0,2],[3,0]]) | reconstruction [[1,2],[3,4]] | agrees | — |
| 1.2 blockGradedAlgebra | E₁₂,E₂₁; empty matrix | E₁₂E₂₁=E₁₁∈B₀; 1=0 | 1+1=0 in ZMod 2; unique empty matrix | agrees | — |
| 1.2 superMul | E₂₁ and eE₁₁; trivial grading | −eE₂₁; ordinary XY | Koszul sign −1; σ=identity | agrees | — |
| 1.2 IsSuperHomogeneous | eE₁₂, with e odd | entry parity 1 | total parity 0+row 0+column 1=1 | agrees | — |
| 1.2 superMatrixEquiv | e⊗E₁₂ | eE₁₂ | tensor coefficient e in entry (1,2) | agrees | — |
| 1.2 superMatrixEquiv_mul | (1⊗E₂₁)(e⊗E₁₁) | −eE₂₁ | E₂₁⋆eE₁₁=−eE₂₁ | agrees | — |
| 1.2 isSuperHomogeneous_superMatrixEquiv_tmul | e odd, E₁₂ odd | eE₁₂ has total parity 0 | 1+1=0 | agrees | — |
| 1.3 superTrace | diag(2,5); empty matrix | −3; 0 | 2−5; empty sums 0−0 | agrees | — |
| 1.3 superTrace_superMul_comm | E₁₂,E₂₁; general homogeneous entries | 1; sign exponent pq | (−1)(−1)=1; entry-swap exponent pq | agrees | — |
| 2.1 SuperDGA | de Rham d; fake d=id on ℤ | d(y dx)=−dxdy; fake d(1)=1 | −dxdy; Leibniz would require 1=2 | d passes; fake differential excluded | — |
| 2.1 parityGrading | ℤ[x], 1+x+x² | even=1+x²; odd=x | sum=1+x+x²; odd·even=x³ | agrees | — |
| 2.1 exists_superDGA_of_isDGAlgebra | degree −1 and +2; d=0 | σ(a)=−a,+a; δ.d=0 | Int.negOnePow gives −1,+1; d=0 | agrees | — |
| 2.1 dMat | [[x,y],[0,1]] of functions | [[dx,dy],[0,0]] | entrywise differentiation | agrees | — |
| 2.1 superComm | E₁₂,E₂₁ both odd | E₁₁+E₂₂ | I; supertrace 0 | agrees | — |
| 2.2 curvature | d=0, Θ=[[0,1],[1,0]] | Θ²=I | diag(T*T,TT*)=I | agrees | — |
| 2.2 covD | same Θ and F=I; p=0 or 1 | covD₀(F)=0; covD₁(F)=2Θ | even commutator 0; odd anticommutator 2Θ | agrees | — |
| 2.2 bianchi | odd Θ; general d | dF=dΘ⋆Θ−Θ⋆dΘ | −[Θ,F]=dΘ⋆Θ−Θ⋆dΘ | agrees | — |
| 2.3 superPow | Θ above, F=I; k=0,2 | I,I | unit, I⋆I | agrees | — |
| 2.3 isClosed_superTrace_superPow | k=0; d=0, Θ²=I | d(m−n)=0; d str(I)=0 | 0;0 | agrees | — |
| 2.4 transgression | Θ_t=t xdy, k=0; 𝔽₂[x], Θ=x, d=0,k=1 | dxdy; (x∂x)(x⁴)=0 | d(xdy)=dxdy; 2d(…)=0 | agrees | — |
| 2.5 trace_exp_sub_trace_exp | T=(1,0); m=0,n=1; t=0 | (e^(−t)+1)−e^(−t)=1; −1; m−n | 2−1=1; 0−1=−1; m−n | agrees | — |
| 3.1 berezin | e₀+3e₀e₁; rank 0 | 3; 1 | top coefficient 3; empty coefficient 1 | agrees | — |
| 3.1 berezin_map | swap e₀,e₁; zero map in rank 2 | −1;0 | det(swap)·1=−1; det(0)·1=0 | agrees | — |
| 3.1 contraction API | ι₀(e₀e₁)=e₁ | Berezin(e₁)=0 | no degree-three input; 0 | agrees | — |
| 3.2 ijPairs | N=0,1,2 | ∅,∅,{(0,1)} | strict upper-triangular pairs | agrees | — |
| 3.2 pairForm | S₀₁=a; i=j | ae₀e₁;0 | a times oriented pair; eᵢ²=0 | agrees | — |
| 3.2 commute_ι_mul_ι_ι | e₀,e₁,e₂ | e₀e₁e₂ | e₂e₀e₁=(−1)²e₀e₁e₂ | agrees | — |
| 3.2 commute_pairForm | pairs 01,23; overlapping 01,12 | e₀e₁e₂e₃;0 | e₂e₃e₀e₁=e₀e₁e₂e₃;0 | agrees | — |
| 3.2 skewForm | J⊕J | e₀e₁+e₂e₃ | upper-triangular two-form | agrees | — |
| 3.2 skewFormDivPow | J⊕J, r=0,1,2,3 | 1; e₀e₁+e₂e₃; e₀e₁e₂e₃;0 | divided powers with coefficients 1,1,1,0 | agrees | — |
| 3.2 pfaffian | empty; [[0,a],[−a,0]]; generic 4×4 | 1; a; S₀₁S₂₃−S₀₂S₁₃+S₀₃S₁₂ | top exterior coefficients with signs +,−,+ | agrees | — |
| 3.2 factorial_mul_pfaffian | J⊕J over ℤ and 𝔽₂ | 2·1=2; 0·1=0 | Berezin(ω²)=2;0 | agrees | — |
| 3.2 pfaffian_sq | 2×2 alternating; 𝔽₂ all-ones matrix | a²; Pf²=1 | det=a²; det=0 | alternating agrees; missing-diagonal nonexample | — |
| 3.2 pfaffian_mul_mul_transpose | S=J, B=diag(2,1); B=0 | Pf(2J)=2; Pf(0)=0 | det B·Pf S=2;0 | agrees | — |
| 3.2 factorial Check | r=1; corrected r=2 over 𝔽₂ | 1!⁻¹·1=1; Pf(J⊕J)=1 | Pf(J)=1; power ω²=0 | first fails to discriminate | R08 |
| 3.2 generic normal form | specialize generic matrix to adjacent J blocks | det=1 | nonzero polynomial determinant | route input omitted | R11 |
| 3.3 Gaussian density | r=0,1,2 | 1; √(2π)/√(2π); (2π)/(2π) | 1;1;1 | agrees | — |
| 4.1 graded bundles and supertrace | one-form ω; E of rank 1│0; odd endomorphism | str(ωI)=ω; str(ωu)=0 | ω·str I=ω; ω·str u=0 | agrees | — |
| 4.1 naturality/direct sums | two rank 1│0 lines; pullback to point | str(I⊕I)=2; pullback ω=0 | 1+1=2; trace of pulled-back one-form=0 | agrees | — |
| 4.2 superconnection/Bianchi | flat d plus odd X; even scalar u=1 | 𝔸²=X²; even choice has defect 2df | Ω-linear X²; required defect 0 | odd passes; even excluded | — |
| 4.3 closedness and class | 𝔸=d+η on ℝ⁴; η=x₁dx₂dx₃dx₄ | ch=1+vol₄/(4π²); d ch=0 | class=1 since vol₄=dη; d ch=0 | agrees | — |
| 4.3 ordinary-connection Check | same higher-form example | degree-four component vol₄/(4π²) | flat ordinary ch has component 0 | missing ordinary-connection hypothesis | R03 |
| Convention 2 comparison | same 𝔸=d+η | negative-exponential form 1+vol₄/(4π²) | unconverted Garcia form 1−vol₄/(4π²) | unequal; η↦−η fixes it | R04 |
| 4.3 transgression sign | point; corrected 𝔸_t=d+i t xdy | 0; −i dxdy | both ±0; −d(i xdy)=−i dxdy | point witness nondiscriminating | R07 |
| 4.4(a) invertible character | T=z, z≠0; compact annulus | −t² e^(−t²│z│²)dxdy/π →0 | exponential bound →0; exact on annulus | agrees | — |
| 4.4 kernel projection | T=0; T=1, ρ<1 | contour projection I;0 | kernel projection I;0 | agrees | — |
| 4.4(b) kernel limit | point; T=(1,0) | str exp(−t²X²)=1 | dim ker T−dim ker T*=1 | agrees | — |
| 4.4 rank-jump Check | T=z, │z│<ρ/2 | contour resolvent exists; integral I | kernel projection 0 at z≠0 | wrong stated obstruction | R06 |
| 4.4 localization Check | T=z on ℝ² | ∫ −t² e^(−t²│z│²)dxdy/π=−1 | limit current −δ₀ has mass −1 | agrees | — |
| Layer 4 Koszul example | s=1; X=i[[0,1],[1,0]] | X²=−I; exp(−t²X²)=e^(t²)I | 4.4 needs X²≥0 and decay | wrong convention | R02 |
| 5.1 Euler/Berezin comparison | rank 2, R=[[0,−dα],[dα,0]]; odd rank | −dα/(2π);0 | Pf(R/(2π))=−dα/(2π);0 | agrees | — |
| 5.1 rank-zero orientation | negative orientation on zero fibre | oriented Berezin(1)=−1 | empty-matrix Pf=1 | supplier convention mismatch | R01 |
| 5.1 direct-sum Euler API | two flat real lines | e(ℝ⊕ℝ)=0 | e(ℝ)∧e(ℝ)=0 | agrees | — |
| 5.2 Mathai–Quillen Euler form | s=x in rank 1,2; s=0 in rank 2 | positive Gaussian dx,dxdy; Pf(R/(2π)) | two Berezin signs cancel; Euler form | agrees | — |
| 5.2 odd derivation | rank 1, S=s²/2+ds·e | dS=s ds; ι_sS=−s ds | (d+ι_s)S=0; wrong sign gives 2s ds | agrees | — |
| 5.2 scaling/direct sums | s=βx, β>0; two trivial lines | integral βʳβ^(−r)=1; Gaussian dxdy | 1; product of one-dimensional Gaussians | agrees | — |
| 5.3 localization/Poincaré–Hopf | S² height gradient; flat T² | Euler integral 2;0 | index sum and χ:2;0 | agrees | — |
| 5.3 localization current | s=x, φ continuous compact support | rescaling gives φ(0)·∫Gaussian=φ(0) | ∫_{0}φ=φ(0) | agrees | — |
| 5.4 Thom form | point, rank 1; zero-section | Gaussian integral 1; pullback dx=0 | fibre normalization 1; Euler=0 | agrees | — |
| 5.4 compact vertical support | ρ(y)=y/√(1−│y│²) | boundary jets of Gaussian pullback=0 | jets of zero extension=0 | agrees | — |
| 6.1 grading | m=n=1 | ε=diag(1,−1); ε²=I; ε*=ε | grading involution identities | agrees | — |
| 6.1 cayley | X=[[0,−1],[1,0]]; X=0 | g=X; I | rotation by π/2; identity | agrees | — |
| 6.1 cayleyInv | same g; forbidden scalar g=−1 | cayleyInv g=X; inverse expression has zero denominator | original X; IsUnit(g+1) fails | agrees | — |
| 6.1 isUnit_one_sub_of_skew | X above; X=iθ | det(I−X)=2; 1−iθ≠0 | unit; squared modulus 1+θ²>0 | agrees | — |
| 6.1 cayley_mem_unitaryGroup | same X | g*g=I | unitary equation I | agrees | — |
| 6.1 grading_mul_cayley_mul_grading | same X; even X=diag(i,0) | εgε=−g; even case diag(i,1) | g⁻¹=−g; even inverse diag(−i,1) | odd case agrees; even excluded | — |
| 6.1 cayley_cayleyInv | rotation g above; W=span(1,−1) | X*=−X; εXε=−X; cayley X=g | inverse-Cayley conclusion; εg fixes (1,−1) | agrees | — |
| 6.1 operator-Cayley comparison | scalar X=i; X=0 | g=i;1 | −U₁=i; −U₀=1 | agrees | — |
| 6.2 Grassmannian embedding | N=1; N=2,p=1, F=σ₃ | two points; tangent span(σ₁,σ₂) | dimensions 0;2p(N−p)=2 | agrees | — |
| 6.2 regular-level negative control | F=σ₃ | H↦FH+HF has rank 2 | ambient Hermitian dimension 4 | not a regular-level construction | — |
| 6.2 invariant even character | k=1,F=σ₃; tangent σ₁,σ₂ | tr(F[dF,dF])=4i | 8tr(P[dP,dP])=8·i/2=4i | agrees | — |
| 6.2 normalization and k=0 exclusion | ℂP¹; k=0,N=2,p=1 | ∫(i/2π)tr(PdPdP)=−1; tr F=0 | c₁(O(−1))=−1; 2tr P=2 | k≥1 required | — |
| 6.2 invariant odd character | U(1), g=e^(iθ) | tr(g⁻¹dg)=i dθ; integral 2πi | closed; invariant; period 2πi | agrees | — |
| Research-context current formula | zero section of trivial complex line | zero locus is entire base, codimension 0 | divisor requires codimension 2 and atomicity | hypothesis omitted | R05 |

| Previous finding | Passage at this head | Status |
|---|---|---|
| R01 | “with GeneralizedCohomology G4.0b’s smooth graph-chart structure” (:975); “Prove that W↦F_W … is a smooth embedding” (:978–979) | repaired |
| R02 | “Mathlib’s CliffordAlgebra.map_mul_map_of_isOrtho_of_mem_evenOdd” (:282); old Lean theorem absent | repaired |
| R03 | “Shared with RandomMatrices” (:69); “on real skew matrices it takes the values” (:71–72) | repaired: arbitrary-ring extension distinguished |
| R04 | “P_K … is defined and smooth, and is the orthogonal projection onto ker X” (:748–750) | repaired; new Check defect is R06 |
| R05 | “CharacteristicClasses C2, item 3, C5, item 5” (:880) | repaired |
| R06 | “Wu 2006, §1, p. 1 … for (c)” (:873) | repaired |
| R07 | “and subspaces W with W ∩ E⁻=0 and dim W=m” (:937); “Prove the converse” (:934) | repaired |
| R08 | “For a ℤ-graded algebra 𝒜, parityGrading 𝒜 is a ZMod 2-graded algebra” (:421–422) | repaired |
| R09 | API bullets at :559, :664, :688, :815, :842, :950 | repaired for the definitions identified previously; 5.4 remains R12 |
| R10 | “Ch. 9 … pp. 263–310” (:756); “as stated in its review” (:939,990) | not repaired: R09 |
| R11 | “No other roadmap owns …” (:60); “No roadmap consumes …” (:1042) | repaired |
| R12 | “against the pinned Mathlib and Tau Ceti” (Suggested.lean:10); matching module and Layer 6 headings (:7,:404) | repaired |

- Source sample: all 15 selected targets examined; 13 have readable Wu2006/Garcia2018 anchors, while 1.1’s BGV locator and 6.1’s Quillen locator remain uncertified; 26 wording comparisons across 3 sources.
- Sources opened at locators: Wu2006 lines 23–26, 60–100, 139–210, 213–238, 330–354; Garcia2018 lines 1063–1148; HarveyLawson1994 lines 190–229, 337–371; the additional locator defects are R09–R10.
- Pinned declarations opened: Clifford graded commutation (Mathlib/LinearAlgebra/CliffordAlgebra/Prod.lean:54), graded tensor sign (Mathlib/LinearAlgebra/TensorProduct/Graded/Internal.lean:182), matrix/tensor equivalence (Mathlib/RingTheory/MatrixAlgebra.lean:206), rectangular power traces (Mathlib/LinearAlgebra/Matrix/Trace.lean:172), Gaussian integral (Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:330), DG structure (TauCeti/Algebra/Homology/DG/Algebra/Defs.lean:206), Duhamel formula (TauCeti/Analysis/SpecialFunctions/Exponential.lean:378), symplectic basis (TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean:357).
- Carrier checks: TauCeti/Geometry/Manifold/DifferentialForm/Curvature.lean:33 is a real endomorphism-valued two-form carrier, not an exterior covariant derivative; Wedge/Smooth/Bundle.lean:172 supplies the paired wedge; DeRham/Basic.lean:127 supplies real cohomology; Topology/Grassmannian/Basic.lean:52 supplies the finrank-submodule carrier, not smooth charts.
- Supplier citations resolved on main: CharacteristicClasses Conventions/C2.1/C2.3/C2.5/C4.1–2/C5.5; DifferentialGeometry Layers 0–2,5–6; SmoothBundlesConnections B2.2/B3.3/B4.1; GeneralizedCohomology G4.0b; LieGroups Layer 2; LieGroupoidsPoisson G0.1; comparison citations to RandomMatrices §8.5, SelfAdjointSpectralTheory SA-D24/27, HeegaardFloer F0.0, SymplecticFieldTheory §0.3 and NoncommutativeGeometry N1–N2.
- Gate: every worker check passed; independent elaboration passed with exactly 16 sorry warnings. Dependency output: `depcheck: 240 roadmaps, 2171 edges, 0 problem(s)`. No UPWARD/CYCLE lines, external-folder changes or worktree edits.
- Signatures: independently elaborated #check @name for all 49 declarations; compared all with the README. The 10 reported binder alerts concern unnecessary finite-index/decidable-equality instances; no required binder was lost. No source declarations changed.
- Headline coverage: 16 admitted targets cover tensor-product multiplication/parity, supertrace, DG parity comparison, Bianchi, closedness, transgression, McKean–Singer, Berezin change of variables, 3 Pfaffian identities and 4 Cayley results; all bundle/Thom/localization/invariant-form headlines are identified in the docstring. None of the 16 closed with rfl, simp or infer_instance; inspected near-matches do not supply their full signatures.

Overlap check: read SpinGeometry, CalibratedGeometry and IndexTheory (the three closest-roadmap lists), plus RandomMatrices, CharacteristicClasses, GeneralizedCohomology, SymplecticFieldTheory, DGAInfinity and StablePeriodicCurved. Owners: Clifford algebra/module geometry—Mathlib/Tau Ceti and SpinGeometry; real skew normal form and its calibrated-volume comparison—CalibratedGeometry §4.2; real matrix Pfaffians—RandomMatrices §8.5, with this roadmap’s arbitrary-ring Berezin extension; ordinary Chern/Euler/Thom classes and Poincaré–Hopf—CharacteristicClasses; index formulas—IndexTheory; Grassmannian smooth charts—GeneralizedCohomology G4.0b. The generic supertrace/Berezin/superconnection constructions have no second owner in the object searches. The reported #1808-only G4.0b overlap is a false positive: main’s TauCetiRoadmap/GeneralizedCohomology/README.md:1082 names G4.0b, and :1149–1153 explicitly supplies the real/complex smooth graph-chart upgrades.

Source independence: 26 passages compared with 3 sources; no distinctive copied prose or reused example list found. Wu2006 has the largest locator share: 23 of 51 source citations in Conventions and Layers 1–6 (Garcia2018 12, BGV1992 14, Quillen1988 2), counting grouped locators once and excluding source mentions without locators. Contents compared with Wu2006: independent; its §2.1/§2.2/§2.3 split across roadmap Layers 3/5/4, while Layers 1/2/6 have no corresponding run. Needs 4.1←1.3 and 5.1←3.1,3.2 force algebra before bundle constructions. BGV1992’s contents and the three Quillen/Mathai–Quillen texts were unavailable.

## Not verifiable

- BGV1992 §§1.3–1.6, Proposition 1.41 and Chapter 9, including the full smooth kernel-limit theorem: settled uncertified; no text was requested again.
- Quillen1985, MathaiQuillen1986 and Quillen1988, including Quillen1988’s exact 6.1–6.2 locators: settled uncertified; checked accessible secondary statements and explicit instances only.
- Research-context Bismut1986, Getzler1983, AtiyahBott1984, Kalkman1993, Getzler1991 and AtiyahJeffrey1990: sources service classified their DOI routes as paywalled/uncertified.
- Research-context BismutGilletSoule1990: bibliographic search through the sources service found no legal text; Chern1944, HarveySemmes1992 and MacPherson1974 resolved to JSTOR without a classified legal copy; BerlineVergne1983 resolved to Project Euclid without a PDF link.
- HarveyLawson1993: the sources service returned the distinct 1994 Bulletin announcement; its title page was checked and it was used only as HarveyLawson1994, not as the Astérisque monograph.
- Quillen’s notebook references at README:1072–1073 were not used to certify any target.

## Source issues

- **Misprint** in Wu2006 at (2.6), printed page 2: the source says the test-form degree is n−m without defining those letters there; it should be dim M−r, with dim M≥r; affects nothing.
- **Misprint** in Garcia2018 at (A.8), printed page 24: the source says the two Chern–Weil summands have indices j=1,2; it should be j=0,1; affects nothing.
- **Error** in Garcia2018 at the paragraph after (A.4), printed page 23: the source says the extended supertrace of every endomorphism-valued form is even; it should be even on total-even inputs, while an odd scalar form times an even identity has odd supertrace; affects a stated result.

## For the human reviewers

- **Not tested.** The unavailable BGV1992 text and contents prevent wording/arrangement certification against that book; Quillen1988’s original statements and exact locators also remain uncertified. Wu2006, the most-cited target source, was readable and compared.
