# Red-team review of #2137 GL2ModularityLiftingPartII at 35ff3e0 (pass a (codex))

**Verdict:** changes needed

## R01 (P2) — Do not require an integral ordinary flag in the scalar branch

**Location:** `TauCetiRoadmap/GL2ModularityLiftingPartII/README.md:589` (also 213, 523): “Use the ordinary high-weight local triangular representation with the chosen Frobenius eigenvalue”.

**Claim:** The scalar local comparison constructs its ring map from a triangular representation over the entire ordinary image. The ordinary-Hasse contract also requests triangular characters over that image without separating the nonscalar and scalar cases.

**Witness:** cg18 lines 1355–1383 exclude the scalar case from the integral free filtration. `TauCetiRoadmap/AutomorphicGaloisRepresentations/README.md:3483` supplies a flag space, expressly not an integral flag on the unflagged image.

For an explicit obstruction, let A = k[a,b]/(a,b)², char(k) odd, inertia trivial, and arithmetic Frobenius F = I+aE₁₂+bE₂₁. Then det(F)=1, tr(F)=2, (F−I)²=0, and the chosen eigenvalue 1 satisfies its characteristic polynomial. Thus this is an unramified scalar-residual eigenvalue-ring point. An invariant free direct-summand line would reduce to a common invariant line of E₁₂ and E₂₁ in k². The first forces ke₁ and the second forces ke₂, so there is none. Field specialization gives I and does not detect this obstruction.

**Exact repair text:** Replace the quoted proof step with: “In the scalar branch use ordinary triangularity only at characteristic-zero field points. Verify the defining ordinary eigenvalue-ring equations there and descend their vanishing through the reduced O-flat high-weight Hecke image. This constructs the map to the unflagged ordinary eigenvalue ring without an integral rank-one filtration. Use its doubling-ideal comparison on finite quotients. Integral rank-one ordinary filtrations are invoked only in the nonscalar branches under CG18 Lemma 3.15.” In §2.4 replace “ordinary triangular description” by “ordinary Frobenius trace identity, descended from the reduced O-flat high-weight image”. Clarify gap:integral-ordinary-hasse, in both README and plan, to request the integral filtration only in the nonscalar case, and the ordinary eigenvalue equations and trace identity in the scalar case.

**Repair test:** For the displayed A-point the repaired scalar premise holds: det(F−1)=0 and all inertia equations vanish; its trace identity is 2=1+1. No nonexistent line is required. The nonscalar Jordan case continues to use the separately supplied filtration.

## R02 (P2) — Supply the general torsion-preserving duality used in §0.3

**Location:** `TauCetiRoadmap/GL2ModularityLiftingPartII/README.md:352`: “AlgebraicModularFormsAndSerreWeights §3.12, Twisted duality and the supersingular boundary.”

**Claim:** This citation supplies the duality used for every finite locally free L on every smooth proper relative curve, including torsion in H¹. The cited target is instead the Hodge-power comparison on fine modular curves, under finite-free/base-change hypotheses, and its displayed integral comparison controls only the opposite cohomological degree.

**Witness:** `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/README.md:849–857` restricts the input accordingly. The actual general owner is `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4528–4542`, especially sheafified_grothendieck_duality and relativeDualizingModule_smooth.

An explicit separating instance is X=ℙ¹_O and the rank-two vector bundle L given by the extension 0→O(−2)→L→O→0 with extension class π. Its connecting map O→O is multiplication by π, so H⁰(L)=0 and H¹(L)=O/π. On the special fibre the extension splits and H⁰(L_k)=k. Thus H⁰(L)⊗k=0 differs from H⁰(L_k)=k: one cannot apply a finite-free/base-change theorem by silently assuming its hypotheses. Since Ω⊗L∨≅L here, the definition's H₀ is the dual of ker(π:K/O→K/O), namely O/π, as the target correctly requires.

**Exact repair text:** Add SchemeAndStackFoundations §2.20 to the supplier contracts and §0.3 Needs: “For smooth proper X/O and finite locally free L, use relativeDualizingModule_smooth and sheafified_grothendieck_duality to identify RΓ(X,Ω¹⊗L∨)[1] with RHom_O(RΓ(X,L),O). Specialize this perfect-complex duality to K/O and take Pontryagin duals to obtain H_i(X,L)≃H^(1−i)(X,L), retaining the torsion term and correspondence adjoints. No cohomology base-change or torsion-freeness hypothesis is imposed.” Keep AlgebraicModularFormsAndSerreWeights §3.12 for the additional root-Fricke Hecke identity in §0.4, not as the general duality supplier.

**Repair test:** The derived route gives H₀=O/π and H₁=0 for the displayed extension, matching H¹(L) and H⁰(L). It also gives O and 0 respectively for L=O(−2), and 0 and O for L=O. No narrowing to cohomologically flat bundles is needed.

## R03 (P3) — Replace the Conjecture A definition's restatements with discriminating Checks

**Location:** `TauCetiRoadmap/GL2ModularityLiftingPartII/README.md:1145–1149`: “A proof at Q=∅ alone supplies no contract at Q_a”.

**Claim:** The three Checks of the definition in §8.4 repeat its requirements: the whole image, every auxiliary level, and the residual finite-flat implication. They do not test an instance of the representation, its local characters, or its coefficient behavior. This definition lacks three discriminating Checks as required by the roadmap checklist.

**Witness:** Compare README:1132, 1140–1143 with 1147–1149: each Check repeats one of those requirements. No group element, matrix, local character value, or nonflat residual example is evaluated.

**Exact repair text:** Replace the three bullets by the following, retaining the quantifier warnings in the API:

- “On T = 𝔽₅[e]/(e²), the matrices I and I+eE₁₂ both have trace 2, determinant 1 and reduction I, but their inertia actions differ: (I+eE₁₂)e₂=e₂+ee₁. Reduction and characteristic polynomials alone cannot check the asserted whole-image local representation.”
- “At an auxiliary place with norm 1 in 𝔽₅, let the geometric-reciprocity value defining φ be 2. Its arithmetic Frobenius value is 3; the ordered characters φε and φ⁻¹ therefore have values 3 and 2, trace 0 and determinant 1. Replacing geometric by arithmetic reciprocity without inversion swaps the selected character.”
- “At ℚ₃, the residual Kummer extension attached to 3 has the ordinary shape (ε̄, *; 0, 1), determinant ε̄, and Kummer valuation 1 in ℤ/3. It is not finite flat: finite-flat Kummer classes come from units, whose valuation is 0. This is an ordinary case in which the finite-flat implication must not be asserted.”

**Repair test:** The first two bullets compute distinct inertia/selected-character values despite identical trace and determinant. The third separates the uniformizer class (valuation 1) from unit classes (valuation 0). These are local tests of the contract, not claims that these matrices alone supply its global absolutely irreducible datum.

## Verified sound

Read all 1,382 README lines and all 215 Suggested.lean lines. The package has **53 numbered target sections**, **9 Lean declarations** (7 necessary definitions and 2 headline theorems), and **63 Checks blocks**. The tables below record explicit tests, including negative controls; they are not substitutes for proofs of the proposed theorems. The two admitted theorems are substantive headlines, not padding. No sorry'd data, `set_option`, admitted example, or duplicate fully qualified Lean name was found.

The supplied elaborated-signature record was compared with all nine declarations and their README descriptions. All needed declaration binders survive. No Lean process was run, as required by the read-only brief. No checkout files were changed. The requested git scope diff was empty: there are no changes outside `TauCetiRoadmap/GL2ModularityLiftingPartII/`.

The dependency check completed successfully with the following output:

```text
depcheck: 235 roadmaps, 2133 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. The supplied overlap results contain no conflicting revision or dropped cited identifier. The declaration/object searches included the indexed open heads and main, not just similarly named declarations. The existing owners of balanced patching, Hasse injection, local eigenvalue rings, ordinary lattices, and classical weight-one attachment remain suppliers. This package owns their arithmetic combinations and the indicated type-bundle and scalar-multiplicity applications.

All **20 gap slugs** have named suppliers and occur in both the plan and README. Nineteen needs sentences match verbatim. The twentieth uses the current supplier locator §3.5 in the README for the plan's BT.3/lemma-9-6; the mathematical contract is unchanged. No absence of a declared supplier deliverable was counted as a defect. R01 concerns the requested integral triangularity, not the absence of that gap's implementation.

### Declaration context and computed adversarial instances

In this table, G_Q is Aut_ℚ(ℚ̄), Q ranges over primes of the algebraic integers above a prime ℓ, and all matrix modules have rank exactly two. CNL means complete Noetherian local with the specified residue map. Arithmetic Frobenius is the residue power map, not its inverse. Definitions below have actual bodies. The zero ring, rank zero, and inseparable characteristic-zero extensions do not satisfy the headline hypotheses; they are not silently admitted test objects.

| Declaration (Suggested.lean line; section) | Actual variable/instance context | Instances and computed values on both sides | Result / change |
|---|---|---|---|
| IsUnramifiedAt (57; conventions) | H a group; ρ:G_Q→*H; ℓ:ℕ; Q prime, lying over (ℓ) | Trivial inertia: image={1}⊆ker. A nonidentity inertial matrix: image not⊆ker. ℓ=1: no prime above the unit ideal, hence predicate true; headlines separately require ℓ.Prime. | Correct; total-function junk is filtered. |
| twist (64; conventions) | A commutative ring; η:G_Q→*Aˣ; ρ:G_Q→*GL₂(A) | Over 𝔽₇, diag(2,3) twisted by 2 gives diag(4,6), trace 3=2·5, determinant 3=2²·6. Twisting back by 4 restores diag(2,3). | Correct square on determinant; inverse twist distinguished. |
| IsAdicallyContinuous (78; conventions) | A commutative local ring; entrywise continuity for the maximal-ideal adic topology | For a field, m=0, the topology is discrete. For O[e]/e², m²=(π²,πe), not (π²); coefficient topology retains the nilpotent direction. Trivial representation has constant entries and is continuous. | Correct; no arbitrary ambient topology. |
| IsReducibleOn (85; conventions) | k field; ρ:G_Q→*GL₂(k); H subgroup; scalar extension to AlgebraicClosure k | Identity subgroup fixes every line of dimension 1. A diagonal cyclic action fixes ke₁. The standard S₃ representation over 𝔽₅ has no invariant line even after algebraic closure. | Correct absolute reducibility, not merely a k-rational eigenline. |
| inertiaInvariants (93; conventions) | A commutative ring; ρ and Q; intersection of kernels of ρ(g)−I | Trivial inertia gives A²; −I over 𝔽₃ gives 0. Over ℤ/9, diag(4,1) fixes 3Ae₁+Ae₂, of size 27, whereas a free rank-one summand has size 9. | Correct actual fixed submodule; torsion cannot masquerade as a line. |
| IsWeightOneResidual (101; conventions) | p:ℕ, k field, ρ; its body includes p≥3 and continuity; finite/CharP instances are on headlines | At p=3, det diag(1,−1)=2≠1. A diagonal global representation has invariant dimension 1 and fails absolute irreducibility. Nontrivial scalar inertia has invariant dimension 0; p=2 fails 3≤p. | Correct; all three Frobenius shapes allowed. |
| IsMinimalLift (115; conventions) | A commutative local ring; k finite field; residue equivalence; specified ρ̄ and ρ | In ℤ/9 with k=𝔽₃, 4²=7≠1 rejects determinant 4, while 1²=1 accepts its Teichmüller value. New inertial kernel element has reduction I but is not I: injectivity fails. The size-27 fixed module above cannot be equivalent to A. | Correct; completion/Hensel uniqueness is invoked only in the stated complete coefficient context. |
| minimal_weight_one_modularity (140; Layer 4, general typed consequence §6.5) | Prime p; O characteristic-zero DVR, finite local ℤₚ-algebra, adically complete; finite k of char p; residue equivalence; continuous ρ̄,ρ; continuous finite-image η unramified at p; η̄ρ̄ weight-one residual and ηρ minimal | For the odd S₃ standard Artin datum at p=5: a 3-cycle has trace −1=4, determinant 1; a transposition trace 0, determinant −1=4. The newform equations prescribe exactly these two values. Twisting by a cubic character changes determinant by its square, not its first power; undoing it restores the original equations. ℓ=p is included when coprime to N. | Signature matches the untwisted conclusion after the permitted normalization twist. No good-prime shortcut. |
| minimal_lift_finite_image (182; Layer 4, §6.5) | Same O,k; additionally A a CNL local O-algebra with compatible residue equivalences and adic completeness; same ηρ hypotheses | If normalized image size is a and twist image size b, original image has at most ab elements. If the finite torsion kernel has s elements, reduction on 2×2 matrices has fibres of size at most s⁴. Conversely O[e]/e² admits infinitely many I+aeE₁₂ despite identical field specialization I; generic field points alone do not suffice. | Correct conclusion; proof explicitly requires generic reducedness and the finite integral kernel. |

### Headline inventory

The README's endpoints and deep intermediate results are: balanced coherent homology; arithmetic Hasse doubling; torsion weight-one local–global compatibility in all three Frobenius cases; minimal weight-one R=T and rank one including torsion; minimal weight-one modularity and CNL finite image; local freeness/base change and cusp duality for type bundles; typed R=T and generic rank; global scalar type three and integral twisting; scalar multiplicity two and diamond-quotient consequences; localized Bianchi amplitude and balancedness; conditional Bianchi R=T, dimension-zero complete intersection, exact generic rank, and minimal semistable modularity. The two classical weight-one conclusions are the two Lean theorems above. The module docstring explicitly lists the missing arithmetic carriers for the other headline families. The matrix identities, annihilator API, and Wiese rank-two criterion are intermediate inputs, not substitute acceptance theorems. No additional statable endpoint was identified.

### Target-by-target computation record

Each row covers the numbered statement, its conventions and its local API. A value outside the hypotheses is a negative control, not a claimed counterexample to the correctly restricted target. “Retain” means that these computations give no defect; R01/R03 identify the changes actually requested.

| Target | Instances tried and computed values | Result / change |
|---|---|---|
| 0.1 Level data | Q=∅ gives Δ=1. Residual identity Frobenius gives eigenvalue ratio 1; choosing r mod p different from 1 makes both forbidden ratios r,r⁻¹ different from 1. At repeated root the harmless old space has 2 copies, not 1. | Retain conductor/fine distinction and both copies. |
| 0.2 Arithmetic Hecke data | S₃ standard over 𝔽₅: 3-cycle (tr,det)=(4,1), transposition (0,4). A zero localized module has image ring 0 and no proper maximal ideal; a nonzero k-module permits a k-valued torsion image. | Retain properness via the supplied Katz witness. |
| 0.3 Dual coherent homology | For O-torsion O/π, Hom_O(O/π,K/O)≅O/π rather than 0. For a free rank-r lattice the double compact/discrete dual recovers Oʳ. Index reversal gives i=0↔1 and i=1↔0. | R02 repairs the supplier; retain torsion and index reversal. |
| 0.4 Hecke duality | n=2,x=2, section eigenvalue 2 gives homology eigenvalue 2⁻¹·2=1. n=1 gives factor x⁰=1. Zero module gives the zero identity on both sides, without implying nonzero generic rank. | Retain direction of Ψ. |
| 1.1 Degeneracy | U=[[T,xd],[-1/x,0]] has trace T and determinant d. At x=2,T=0,d=3, U²=−3I and U²−TU+dI=0. Pairing determinant is x⁻¹(α−xβ)(β−xα). | Retain unit-x requirement and weight-one normalization. |
| 1.2 Selected root | Over 𝔽₅, x=1,α=1,β=2 gives pairing [[2,3],[3,4]], determinant 8−9=4. Equal roots give determinant 0. Selecting one distinct root reduces the old multiplicity 2 to 1. | Retain distinct-root hypothesis. |
| 1.3 Harmless prime | Over 𝔽₅, x=2,α=β=1 gives determinant 2⁻¹(−1)²=3. U=[[2,2],[2,0]] has (U−I)²=0 but U−I≠0, so both old copies survive. α=2,β=1 instead gives determinant 0. | Retain repeated-root full double. |
| 1.4 Coherent descent | Δ=1 gives Tor₁=0. For Δ=C_p and trivial k coefficients, H₁(C_p,k)=k, so the Tor edge need not vanish. Degree-one edge has kernel the image of cover coinvariants, not necessarily 0. | Retain spectral-sequence edge, not an unconditional H₁ coinvariant isomorphism. |
| 1.5 Balancedness | Over S=O, M=Oʳ⊕kˢ has (β₀,β₁)=(r+s,s), defect r. M=k gives 1−1=0; M=0 gives 0−0=0. | Retain nonnegative defect; it does not mean O-flat. |
| 2.1 Hasse double | [[T,d],[-1,0]] sends e₂ to de₁. T=0,d=3 gives U²=−3I. The source's alternative off-diagonal convention sends e₂ to e₁ and fails the specified second column. | Retain corrected matrix. |
| 2.3 Image algebras | O²→O has kernel 0×O; quotient images, not an injective coefficient-extension rule, are needed. π is nonzero on O/π² and zero on O/π. Zero modules produce zero images. | Retain actual represented images and coefficient quotient maps. |
| 2.4 Quadratic doubling | Monic quadratic quotient has basis 1,X and rank 2. Over 𝔽₅, (X−1)² quotient has dimension 2; its reduced quotient has dimension 1. Distinct selected ordinary factors individually have rank 1. | Algebra correct; change scalar proof premise per R01. |
| 3.1 Wiese criterion | Diagonal inclusion and difference quotient give dimensions 2→4→2 and zero composite. Cyclic Jordan block has (J−I)²=0≠J−I; S₃ standard over 𝔽₅ is indecomposable with no invariant line. | Retain nonabelian and indecomposable cases. |
| 3.2 Doubling ideal | A=T̃ gives relative module 0 and annihilator 1. A⊂A[X]/(monic quadratic) gives quotient AX and annihilator 0. For A=k and dual numbers, A is not an ideal: X·1=X∉A. | Retain module quotient, both directions of factorization criterion. |
| 3.3 Scalar comparison | c=2,U_p=6 in 𝔽₇ gives c⁻¹U_p=3. A⊂A[e]/e² gives relative free line Ae with annihilator 0; deleting e instead makes annihilator 1. R01's F has trace 2, determinant 1 and no invariant free line. | R01. |
| 3.4 Three Frobenius cases | Over 𝔽₅, diag(1,2) has trace 3,det 2 and two eigenspaces; J and I both have trace 2,det 1, but eigenspace dimensions 1 and 2. | Retain separate nonscalar/scalar arguments; R01 repairs the scalar input. |
| 3.5 Hecke representation | In ℤ/9, the square root of 4 congruent to 1 is 7: 7²=4. Modulo 4 both 1 and 3 square to 1, explaining exclusion of p=2. Over 𝔽₇, inverse of a matrix with trace 5,det 6 has trace 5/6=2. | Retain odd-p normalization and arithmetic reciprocity. |
| 4.1 Rational TW system | q=1 gives q−1=0 variables and S_a=O[C_(pᵃ)]. Each group basis element maps to 1 under augmentation; coefficient-at-identity would send a nonidentity basis element to 0. | Retain q≥1 and actual augmentation. |
| 4.2 Minimal R=T | T=k,H=k is free rank 1 over T although πH=0. H=Rʳ with r>0 has annihilator 0; H=0 has annihilator R. | Retain nonzero H; do not infer O-flatness. |
| 4.3 Integral rank one | T=k[e]/e² has length 2 and socle dimension 1; its dual can be cyclic without killing e. A one-dimensional invariant space gives its Frobenius scalar; zero invariants give bad local factor 1 and U=0. | Retain torsion and zero-invariant case. |
| 4.4 Modularity | S₃ example gives traces −1 and 0, determinants 1 and −1. Good p has the same arithmetic polynomial X²−a_pX+χ(p). A root shift to geometric Frobenius gives inverse trace tr/det, not tr. | Retain native newform and all good primes, including p. |
| 4.5 CNL finite image | Torsion kernel size s yields matrix fibres ≤s⁴. O[e]/e² has infinitely many I+aeE₁₂ but one specialization I, so counting field points alone fails. The proof's reduced generic fibre removes this obstruction. | Retain quotient version of the supplied finite-point lemma. |
| 5.1 Vexing types | Norm twist with a(θ₀)=1,a(λ)=2 gives n=2, induced conductor 4, but a(θ/θ^σ)=1. Correct selector multiplicity 1; the untwisted depth-zero selector multiplicity 0 in the stated example. Empty vexing set gives rank-one trivial coefficient. | Retain norm-twist gap rather than impose twist-minimality. |
| 5.2 Type bundles | Trivial covering group gives L=O and L_sub=O(−C). At cusp ramification e=5, character index i=2 gives q²O[[q⁵]], not the unmodified pullback O[[q]]. | Retain invariant pushforward and separate cusp modification. |
| 5.3 Base change | q²O[[q⁵]] is rank 1 over O[[q⁵]], and remains rank 1 modulo π. A C_p torsor has descent even though averaging would divide by p=0 in k. Zero coefficient module gives rank 0 on both sides. | Retain arbitrary coefficient change via descent/local cusp computation. |
| 5.4 Cusp duality | e=5,i=2: full dual is q⁻²O[[q⁵]], cusp shift gives q³O[[q⁵]]. For i=0 the subbundle is q⁵O[[q⁵]], not O[[q⁵]]. | Retain sub/full distinction and dual direction. |
| 5.5 Vanishing | n=2 full-bundle H¹ dualizes to weight-zero cusp sections, hence 0; n=2 subbundle dualizes to weight-zero full sections, where constants survive. n>2 gives negative weight; zero W gives both sides 0. | Retain strict thresholds n>1 and n>2. |
| 5.6 Type Hecke | Diamond value 2 over 𝔽₇ dualizes to 4 and back to 2. For n=2,x=2, scalar is 1/2; n=1 scalar 1. A component swap does not commute with diag(0,1). | Retain all-component equivariance and inverse diamond. |
| 6.1 Typed degeneracy | The 𝔽₅ pairing [[2,3],[3,4]] has determinant 4; tensor with I₂ has determinant 4²=1. Full old dimension 4 reduces to selected dimension 2. At x=2,T=0,d=1, U²=−I, not −2I. | Retain weight-one formulas and selected type dimension. |
| 6.2 Typed balance | Trace 5,det 6 over 𝔽₇ dualizes to trace 2; diamond 2 to 4. Rank 2 minus a one-dimensional Tor quotient gives defect 1, not rank 2. | Retain σ*, adjoint ideal and Tor term. |
| 6.3 Typed Galois | An equivariant operator zero on one component is zero on its orbit; diag(0,1) is a countermodel without swap equivariance. Correct versus wrong minimal selector gives Hom dimensions 1 versus 0. | Retain all-component transport; use R01 for scalar branch. |
| 6.4 Typed R=T | Generic equality r·1=1 forces r=1. With zero generic fibre r·0=0 imposes no rank, even for r=2. | Retain nonzero generic-fibre qualification. |
| 6.5 Twisted consequences | If ψ has order 3, ρ=ρ₀ψ² and η=ψ, then ηρ=ρ₀ while detρ=detρ₀·ψ. Image size is bounded by the product of normalized and twisting image sizes. | Retain the twist in hypotheses and original ρ in conclusions. |
| 7.1 Scalar datum | Serre weight 2 gives N*=N; other weights give Np. Squaring on C₃ permutes 1,g,g² as 1,g²,g; on C₂ it collapses both elements. | Retain p odd and separate harmless/nonharmless cases. |
| 7.2 Global type | A=O·1+πO⁴ has generic algebra K⁴ and special-fibre socle dimension 3; O[t]/∏_(i=0)^3(t−iπ) has the same generic algebra and special-fibre socle dimension 1. | Retain global parameter/type input; generic agreement alone is insufficient. |
| 7.3 Integral twisting | A congruence order in O² and O² become K² after inverting π but have nonzero integral index. C₃ squaring is bijective with inverse squaring. | Retain integral generator argument, not generic comparison. |
| 7.4 Scalar multiplicity | Connected m-torsion dimension 3 and étale dimension ≤1 give 3≤dim≤4. Residual isotypy forces even dimension, hence 4=2·2. | Retain Cayley–Hamilton isotypy gap; no unjustified exactness on m-torsion. |
| 7.5 Quotient multiplicity | I and nontrivial J have equal characteristic polynomial (X−1)², but scalar multiplicity is 2 and nonscalar multiplicity 1 in the stated cases. p=3 fails the explicit Carayol hypothesis. | Retain scalar test and exclusions. |
| 8.1 Bianchi datum | μ_p⊕ℤ/p is finite flat and ordinary. Kummer uniformizer has valuation 1 mod p and is ordinary but not finite flat; Kummer units have valuation 0. | Retain finite-flat precedence and absolute conditions. |
| 8.2 Levels/types | ψ(a/d) for ψ²≠1 differs from ψ(det) on diag(a,a): the first is 1, the second ψ(a)²≠1. For quadratic ψ, the determinant twist is trivial on scalar squares. | Retain distinct selectors and matched coefficient gap. |
| 8.3 Bianchi Hecke | Changing a uniformizer by unit with diamond value c changes selected root α to cα. A degree-d correspondence interchanging two components has matrix [[0,d],[d,0]], eigenvalues d,−d. A nonzero π-torsion module admits a k-image algebra. | Retain component permutations and torsion image. |
| 8.4 Conjecture A | T=𝔽₅[e]/e²: I and I+eE₁₂ both have (tr,det)=(2,1), but different inertia. Geometric value 2 becomes arithmetic 3; ordered pair (3,2) has (tr,det)=(0,1). Kummer 3 has valuation 1 mod 3, units 0. | R03; use these computed controls. |
| 8.5 Generation | Over 𝔽₇ roots 2,4 have product 1, sum 6; derivatives at the two roots are 5 and 2, both units. Equal root 1 gives derivative 0. | Retain distinct-root Hensel recovery and local diamond compatibility. |
| 9.1 Diamond homology | Regular O[C₃] has O-rank 3 and coinvariants O of rank 1. Augmentation [g]=1, unlike its identity coefficient 0. At stabilizer C₃ in char 3, group homology does not equal coarse-point homology. | Retain groupoid coefficients and Shapiro. |
| 9.2 Selected root | p=7,N(x)=29, roots 2,4: Gram determinant 4−36=3, and α²−1=3. Repeated roots 1,1 give both quantities 0. | Retain distinct roots and residual-only supplier gap. |
| 9.3 Amplitude/boundary | H₃(C₃,𝔽₃) has dimension 1, while a coarse point has dimension 0. For a swap of two components with degree 2, H₀ eigenvalues are ±2. If H₃(μ/π)=0, the coefficient sequence gives ker(π:H₂(μ)→H₂(μ))=0. | Retain H₃(3) and non-neat boundary assumptions. |
| 9.4 Balance | Δ=1,M=Oʳ⊕kˢ gives β₀−β₁=(r+s)−s=r. A rank-2 module with one-dimensional Tor quotient has defect 1. Zero generic rank need not imply zero module. | Retain the Tor estimate and conditional p=3 input. |
| 10.1 Bianchi TW | q=1 gives a zero-variable A∞=O and one augmentation relation. Group bases map to 1; Q=∅ alone supplies none of the nonempty Q_a actions. | Retain all-level Conjecture A. |
| 10.2 Bianchi R=T | T=k,H=k² is nonzero and T-free of rank 2, but H⊗K=0. H=0 would not imply faithfulness. | Retain nonzero module, no unconditional rank-one or O-flat assertion. |
| 10.3 Zero-dimensional CI | q=1, O/(π²) has dimension 0 and length 2, with regular relation π². Relation 0 instead gives O of dimension 1 and falls outside the dimension-zero conclusion. | Retain q equations in ambient dimension q. |
| 10.4 Generic multiplicity | One automorphic occurrence with local dimensions 1,2,3 contributes 1·2·3=6, not 1. All conductor-newvector dimensions 1 give product 1. | Retain actual local invariant dimensions. |
| 10.5 Bianchi lifting | A π-torsion Hecke algebra cannot map as an O-algebra to O: π would map both to 0 and to π≠0. An O-point therefore detects a nonzero generic automorphic factor. | Retain point-to-classical step and p=3 conditions. |
| 10.6 GL/PGL | C_p central twists give rank-p O[C_p] versus fixed determinant rank 1. In 𝔽₁₉ with generator 2 and α=2³=8: α⁶=1 but α²=7≠1. Thus the p=3 test passes while the h=9 test fails. | Retain full h-th-power condition. |

### Remaining convention Checks

The 63 Checks blocks contain **204 bullets**, all read and assessed against their section's statement. R03 identifies the three restatement-only bullets. The preceding tables record the target instances; the following completes the convention and supplier-normalization controls outside numbered sections.

| Convention / interface | Computation | Result |
|---|---|---|
| Arithmetic Frobenius | In 𝔽₂₇=𝔽₃[t]/(t³−t−1), arithmetic Frobenius sends t to t+1, its inverse sends t to t+2, and the third iterate sends t to t. | Two conventions separated by unequal values. |
| Prime above ℓ; unramifiedness | ℓ=1 gives the unit ideal and no prime above it. For actual primes, containing ℓ is equivalent to contraction (ℓ), because a nonzero prime of ℤ containing (ℓ) equals (ℓ). | The headline's prime filter removes the empty-index junk case. |
| Scalar twist and rank | η=1 fixes every matrix; η=2 multiplies trace by 2 and determinant by 4. Submodules of dimensions 0 and 2 cannot witness the dimension-1 predicate. | No zero/rank-zero witness. |
| Logarithmic KS | On Tate(t²), d(t²)/(t²)=2dt/t; replacing KS by half KS changes the coefficient from 2 to 1. | Supplier and target normalization agree. |
| Boundary cusp types | At infinity and zero, with n=1 and χ(x)=−1, traces are 1−1=0 and −1+1=0. At n=2,x=2 they are −1 and 1, so the general cusp orbit cannot be replaced by the infinity orbit. Trivial characters give 1+2=3. | Two-character calculation retained. |
| Boundary degree | A finite cusp divisor has coherent Hⁱ=0 for i>0. A proper genus-one curve has H¹(O) of dimension 1. | Boundary dimension does not erase curve H¹. |
| Hasse second column | For a₁(g)=1, the column dV_pg has q-coefficient 0 and qᵖ-coefficient d; at p=3 this uses no 1/3. In ℤ/9, θ(V₃q)=3q³≠0; in 𝔽₃ it is 0. | Socle reduction is essential. |
| Reciprocity | Over 𝔽₇ the arithmetic/geometric values 2 and 4 multiply to 1; applying inversion twice returns 2. | Same direction in scalar twisting and Bianchi local characters. |
| Coefficient and ring boundaries | ℤ/9 has π=3, π²=0; a ramified coefficient DVR can have p=uπᵉ with e>1. A characteristic-p field cannot satisfy the characteristic-zero O hypotheses. | No substitution of p for a general uniformizer. |

### Source locator verification

**34 locator groups** were checked directly in the legal cached text: 33 in cg18 and one in cg20. A group below can include adjacent numbered results; repeat citations of the same location are counted once. “Checked” here means that the cited text was read and compared, not that every claim in that source was accepted. The source issues below distinguish erroneous source arguments from the corrected roadmap targets.

| Locator group | Text witness | Scope comparison |
|---|---|---|
| CG18 Theorems 1.2–1.4, Corollaries 1.5–1.6 | cg18 lines 200–335 | Rational and conditional Bianchi endpoints; residual and minimality restrictions retained. |
| Definition 3.1 | cg18 lines 569–595 | Prime-to-p residual conductor, fixed determinant, vexing inertia and invariant line. |
| Propositions 3.2–3.3 | cg18 lines 596–646 | Dual adjoint Tate twist, q≥1, q−1 variables; supplied arithmetic gaps explicit. |
| Remark 3.4 | cg18 lines 794–807 | Single cusp-orbit argument does not justify its transitivity claim. |
| Lemma 3.5 | cg18 lines 856–973 | Weight-one pairing and old/new comparison; cancellation issue below. |
| Lemma 3.6 | cg18 lines 974–1002 | Ratio exclusion, including repeated roots. |
| Lemma 3.7 | cg18 lines 1003–1028 | Torsion-free cohomology and localized boundary elimination. |
| §3.2.4 duality | cg18 lines 1029–1064 | Degree reversal and x^(1−n); R02 addresses the actual supplier. |
| Proposition 3.8 | cg18 lines 1065–1120 | Tor edge and balance, without coefficient flatness of H₀. |
| Remark 3.10 | cg18 lines 1153–1188 | Auxiliary fine level and small-level warning. |
| Theorem 3.11, Hasse part | cg18 lines 1189–1294 | Torsion Hasse construction; matrix convention corrected in package. |
| §3.4, Lemma 3.15 | cg18 lines 1295–1383 | Integral filtration expressly nonscalar; R01. |
| Lemma 3.16 | cg18 lines 1442–1479 | Faithful quadratic double and trace descent. |
| Lemma 3.17 | cg18 lines 1486–1529 | Rank-two doubled-module argument. |
| Lemma 3.24, Definition 3.25 | cg18 lines 1658–1705 | Relative module annihilator and unramified quotient. |
| Theorem 3.26 and rank paragraph | cg18 lines 1706–1775 | Minimal R=T and conductor rank. |
| §3.9.1, Lemma 3.27 | cg18 lines 1789–2076 | Type bundles and arbitrary coefficient change. |
| Lemma 3.28 | cg18 lines 2077–2161 | Cusp-corrected duality, not equality of full dual bundles. |
| Corollary 3.29 | cg18 lines 2163–2181 | Strict vanishing thresholds 1 and 2. |
| Theorem 3.30 and proof | cg18 lines 2191–2315 | Typed R=T, contragredient coefficient and Hecke comparisons. |
| Lemmas 4.1–4.4 | cg18 lines 2353–2455 | Canonical modules, type three and graded Hilbert-series argument; source caveats below. |
| Theorem 4.8, Lemma 4.11 | cg18 lines 2586–2805 | Global presentation, local factors, integral twisting and dimension count; extra contracts retained. |
| Remark 4.12 | cg18 lines 2807–2812 | Quotient Jacobian exclusions include p≠3 and the stated induction exclusion. |
| Lemma 4.14 | cg18 lines 2823–2879 | Finitely many finite-image points, tangent extensions and generic reducedness; quotient argument analyzed separately. |
| §5.1 | cg18 lines 2880–2959 | S/P/M/H and finite-flat precedence. |
| Propositions 5.1–5.2 | cg18 lines 2960–3019 | Complex-place −3, dual Selmer condition and q−1 variables. |
| §5.2, Definitions 5.4–5.5 | cg18 lines 3020–3138 | Orbifold convention, projective levels, Hecke ideal. |
| Conjecture A, Lemma 5.6 | cg18 lines 3139–3199 | Whole Hecke ring; local character and selected-root generation. |
| Lemma 5.8 | cg18 lines 3205–3218 | Selected auxiliary level comparison. |
| Lemma 5.9 | cg18 lines 3235–3267 | Localized amplitude and boundary; p=3 orbifold caveat retained. |
| Proposition 5.10 | cg18 lines 3268–3304 | Degree-two Tor edge and generic H₁/H₂ rank equality. |
| Theorem 5.11 and following paragraph | cg18 lines 3311–3376 | All-Q hypothesis, balanced patching and dimension-zero complete intersection. |
| §5.5 and Remark 5.12 | cg18 lines 3377–3443 | GL class-group twists; the full class-order exponent is needed. |
| CG20 Lemma 8.14 and proof | cg20 lines 2540–2603 | One ordinary projection, distinct roots, torsion/socle reduction; inverse-root correction retained by supplier. |

### Supplier resolution and pinned ownership

The **16 named roadmap supplier groups** in the README were checked against their main/current-head texts. The following records the decisive interfaces and their limits. R02 adds a seventeenth existing owner rather than inventing new generic duality. The mechanical resolver's absence of unresolved names was treated as a lead, not as mathematical verification.

| Supplier | Resolved interface and constraint |
|---|---|
| ClassicalSerreModularity | Arithmetic interfaces and R27.5/hypothesis-H-and-theorem-9-1; qualitative modularity alone supplies neither conductor nor weight-one Katz data. |
| DeformationAndDerivedPatchingAlgebra | §§5.1–5.5 balanced defect, finite cutoffs and patching; §§3.1,3.9 canonical modules/type, with O-Tor independence; §§3.4–3.5 complete intersections. |
| AlgebraicModularFormsAndSerreWeights | R15 layer mapping, §§2.1,2.5,2.12,2.16; §§3.1–3.4,3.8,3.12; §6.4. Generic duality is broader than §3.12: R02. |
| IntegralHeckeAndGaloisDeterminants | §§2.1–2.2 actual images/local factors; §1.3 reconstruction; §1.6 contains the named isotypic-module recognition target despite its broader heading “Compatible local compression”. |
| ModularCurvesPartII | §17.2: F²−TF+ℓ⟨ℓ⟩=0, arithmetic specialization on prime-to-ℓ torsion. |
| LocalGaloisDeformationRings | §§2.1–2.5,2.19,4.1 condition framework; §6.7 unflagged ordinary eigenvalue ring; §6.18 type three; §7.5 doubling ideal. Exact missing arithmetic specializations are declared gaps. |
| GlobalGaloisDeformations | §§3.3–3.7 global conditions/presentations; §§5.1–5.8 auxiliary sets; §§6.2–6.8 trace and specialization interfaces. Stronger image/liftability assumptions are not silently substituted for the declared defect-one gaps. |
| AutomorphicGaloisRepresentations | §2.10 normalization; §§3.7,4.1–4.6 local compatibility; §§5.1,6.8–6.9,6.12 integral representation. The flag-space qualification at §6.12 causes R01. |
| GL2AutomorphicRepresentationsAndTransfer | R16.2.7 newvectors; R16.2.11/R16.3.9 require a(θ/θ^σ)=a(θ); R16.4 multiplicity; R16.6.5–R16.6.6 retain local dimensions and weight-one holomorphy. Norm-twist and Bianchi dictionaries are gaps. |
| SerreWeightAndLevelOptimisation | §§3.4,3.10–3.14: residual unramifiedness, Gross sequence, known multiplicities, minimal Katz witness, and individual Hasse projection. The latter requires distinct nonzero roots and full localized nilpotence. |
| PotentialModularityAndCompatibleSystems | §8.8 finite scalar ordinary rings, including p=3; it does not supply the variable-determinant type calculation. |
| GL2ModularityLifting | §§3.7,4.1–4.2 generic comparison/presentation machinery; the conductor-specific scalar comparison is explicitly a gap. |
| ArithmeticLocallySymmetricSpaces | ALS.0.10 projective levels; ALS.4.10 Eisenstein convention; ALS.4.12(b) neat/♠ boundary input; ALS.5a.6 coefficient-qualified duality; ALS.5b.5–5b.8 classical comparison; ALS.6.1–6.3 descent. Non-neat boundary and p=3 amplitude are separately declared. |
| AutomorphyLiftingBeyondTaylorWiles | Current §3.5 is Lemma 9.6 and assumes B^gal, not merely its residual clause. The residual-only gap is necessary and correctly retained. |
| ModularityAndLanglandsExtensions | §1.5 states the universal-ring lemma. The package explicitly proves why its trace-generation/tangent argument also applies to the minimal quotient, instead of assuming the whole universal ring has finitely many points. |
| ClassFieldTheory | Layer 7 arithmetic/geometric inversion; Layers 11–12 global ray classes and finiteness. At places away from p the pro-p unit contribution is finite; a torsion-free quotient unramified at p is consequently trivial. |

Pinned declarations were read at the specified pin, including `Representation.invariants`/`mem_invariants` (`Mathlib/RepresentationTheory/Invariants.lean:73,80`), `IsArithFrobAt`/`mem_stabilizer`/`mul_inv_mem_inertia` (`Mathlib/RingTheory/Frobenius.lean:184,195,201`), matrix scalar/commutation and determinant/characteristic-polynomial APIs, and `groupHomology.indIso` (`Mathlib/RepresentationTheory/Homological/GroupHomology/Shapiro.lean:65`). Shapiro supplies neither boundary vanishing nor an amplitude theorem. The plain matrix-kernel definition in Suggested.lean is a permitted specialization of invariants, not a replacement invariants library.

On the Tau Ceti side, augmentation and its single-basis law are in `TauCeti/Algebra/MonoidAlgebra/Augmentation.lean:50,55`; the native newform is in `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104`. The eigenform predicate alone allows zero, whereas Newform includes normalization and newness. `Newform.eq_of_forall_prime_eigenvalue_eq` at `TauCeti/NumberTheory/ModularForms/Newforms/StrongMultiplicityOne.lean:163` has the same-level, same-nebentypus hypotheses claimed here. Chebotarev's density/infinity pair at `TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.lean:51,74` concerns a conjugacy class in a finite Galois extension of number fields, exactly the compositum used in §0.1. No arithmetic weight-one lifting theorem at these pins was found that renders either headline padding.

## Not verifiable

- cg22, published correction pp. 855–856, remains **uncertified** under the settled manifest entry. It was not fetched or requested again. No claim that its text proves the additional scalar, type or stabilizer contracts was accepted.
- Declared gaps are contracts, not verified proofs: the conditional scalar variable-determinant conclusion, non-neat boundary comparison, localized H₃(3), and the other listed arithmetic refinements remain conditional on their suppliers. The review does not treat their present absence as a defect.
- Full Lean elaboration was not rerun. This pass used the supplied elaborated signatures and pinned source inspection; the brief expressly prohibited Lean builds. No claim of a fresh build or machine-checked counterexample is made.
- The source audit checks the cited CG18/CG20 passages, not every reference those papers themselves use. It establishes neither unproved Conjecture A nor every declared supplier theorem. The concrete calculations above delimit what was tested.
- Ownership searches used the supplied current-head index and main and inspected the relevant suppliers/nearby objects. No unavailable private or unlisted open work was independently sought.

## Source issues

- **Error** in cg18 at Remark 3.4, printed p. 316 (cg18 lines 794–807): the source says diamonds act transitively on the cusps, extending the infinity-orbit eigenvalue formula everywhere; it should be an orbit-by-orbit two-character calculation; affects the proof.
- **Gap** in cg18 at proof of Lemma 3.5, printed p. 320 (cg18 line 966): the source says injectivity permits cancellation of a pullback on the right of an operator identity; it should be a direct correspondence calculation or a justified surjectivity argument; affects the proof.
- **Misprint** in cg18 at §3.2.3, printed p. 315 (cg18 lines 757–766): the source says the Hodge Fricke square has scalar x for weight n; it should be x^n, specializing to x at weight one; affects nothing.
- **Misprint** in cg18 at proof of Theorem 3.11 and Lemma 3.16, printed pp. 328, 332 (cg18 lines 1272–1275, 1451–1453): the source says the fixed Hasse columns carry matrix [[T,1],[-d,0]]; it should be [[T,d],[-1,0]] for those columns; affects the proof.
- **Misprint** in cg18 at Lemma 3.15(4), printed p. 330 (cg18 lines 1363–1364): the source says the high-weight ordinary subcharacter is unramified; it should be cyclotomic-to-the-weight times unramified, becoming unramified only on appropriate finite quotients; affects a stated result.
- **Error** in cg18 at proof of Lemma 4.2, printed p. 355 (cg18 lines 2374–2377): the source says a regular presentation sequence stays regular after arbitrary completed base change; it should require Tor independence, for example the relevant O-flatness; affects the proof.
- **Error** in cg18 at Lemma 4.4, printed p. 357 (cg18 lines 2429–2437): the source says any regular x∈m^d gives equality in its Hilbert-series bound; it should require the initial-form condition or the stated homogeneous graded specialization; affects a stated result.
- **Gap** in cg18 at proof of Theorem 4.8, printed p. 366 (cg18 lines 2796–2799): the source says a generic isomorphism and torsion-freeness identify the integral character orders; it should additionally prove integral containment and surjectivity by generators; affects the proof.
- **Gap** in cg18 at closing calculation of Theorem 4.8, printed p. 366 (cg18 lines 2801–2805): the source says the connected/étale sequence directly gives equality of m-torsion dimensions; it should justify surjectivity or use the bounds and residual-isotypy parity argument; affects the proof.
- **Misprint** in cg18 at proof of Lemma 4.14, printed p. 368 (cg18 line 2870): the source says the subgroup attached to the finite extension has finite image in the larger Galois group; it should have finite index; affects the proof.
- **Error** in cg18 at Conjecture A(4), printed p. 375 (cg18 line 3166): the source says the lift is finite flat without a residual finite-flat premise; it should condition finite flatness on residual finite flatness and retain the ordinary alternative; affects a stated result.
- **Gap** in cg18 at proof of Lemma 5.9(1), printed p. 377 (cg18 line 3246): the source says noncompact three-manifold vanishing gives orbifold H₃=0; it should control localized order-three stabilizer homology at p=3; affects the proof.
- **Error** in cg18 at proof of Lemma 5.9(1), printed p. 377 (cg18 line 3247): the source says Hecke operators preserve connected components; it should allow degree times permutation of determinant components and prove their eigensystems Eisenstein; affects the proof.
- **Error** in cg18 at §5.5, printed p. 381 (cg18 lines 3423–3429): the source says the p-th-power residue test suffices for a class of order h=p^b; it should use the full h-th-power test when b>1; affects the proof.
- **Misprint** in cg20 at proof of Lemma 8.14, printed p. 866 (cg20 line 2581): the source says the kernel element F lies in the β summand in the UV identity; it should lie in the α summand; affects the proof.
- **Misprint** in cg20 at proof of Lemma 8.14, printed p. 866 (cg20 lines 2597–2599): the source says VF=βF after UF=αF and diamond αβ; it should be VF=α⁻¹F; affects the proof.
- **Misprint** in cg18 at proof of Lemma 4.14, printed p. 368 (cg18 lines 2870–2872): the source says inflation injectivity descends splitting from the finite-index subgroup; it should use restriction injectivity, whose kernel is finite-quotient H¹ in characteristic zero; affects the proof.
