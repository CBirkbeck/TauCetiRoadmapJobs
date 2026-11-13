# Review of K3BlochGroups (pull request #1430 at 2cb125d)

**Verdict:** needs changes

## R01 (P1) — The fourth-stem inputs are no longer supplied
**Location**: `TauCetiRoadmap/K3BlochGroups/README.md:119`, also §4.9 Check 4: “It also proves π₄S=0 and that d₃ maps onto E₃^(4,8)=ℤ/2·α₁⁴.”
**Claim**: ArithmeticKTheory §7.5 supplies neither assertion at its supplied head; this is an undeclared missing prerequisite.
**Witness**: ArithmeticKTheory #1418, `TauCetiRoadmap/ArithmeticKTheory/README.md:5003`, explicitly excludes both inputs. Its conclusion is π₄(S)⊗ℤ[1/2]=0, which also holds for a nonzero C₂ fourth stem.
**Repair**: Delete the quoted sentence and §4.9's fourth Check. Neither is needed for the η³ argument. Keep the valid computation 12ν=2·6ν; it uses no fourth-stem assertion.

## R02 (P2) — Import the stable Hopf relation from its owner on main
**Location**: `TauCetiRoadmap/K3BlochGroups/README.md:1400`: “this section proves only that η³ is nonzero and the resulting relation.”
**Claim**: The η³=12ν target and its supporting proof plan duplicate a result already owned on main.
**Witness**: `TauCetiRoadmap/TangentialBordism/README.md:2514`, §8.3/B3.3, states η³=12ν≠0 with StringOrientation S2.3's generator; its ownership paragraph at line 87 assigns this relation there.
**Repair**: Import TangentialBordism B3.3 in Scope and the supplier contracts; remove the separate §4.9 proof targets. In §4.16 use the supplied relation to obtain C₂₄/⟨12⟩≅C₁₂. Update the internal references and dependencies accordingly.

## R03 (P2) — The field stability block has two existing owners
**Location**: `TauCetiRoadmap/K3BlochGroups/README.md:1380`; `TauCetiRoadmap/K3BlochGroups/Suggested.lean:97` and `:115`: “These assertions are proved simultaneously”.
**Claim**: Coupling the proof to the Milnor quotient does not authorize another stabilization map, frame spectral sequence, or field homological-stability theorem.
**Witness**: HomologicalStabilityOfGeneralLinearGroups #2036, `TauCetiRoadmap/HomologicalStabilityOfGeneralLinearGroups/README.md:309` and `:439`, owns the spectral sequence and stronger semilocal theorem. `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Stable.lean:79` already defines the same inclusion; both send (2) to diag(2,1).
**Repair**: Consume that roadmap's §§1.3 and 2.3 and `TauCeti.stabilizeGL`. Delete `generalLinearStabilization` and `generalLinear_homology_stable` from `Suggested.lean`. Keep the Milnor retraction, quotient identification, and additional degeneration/product statements here, with the imported results as inputs.

## R04 (P2) — Generic group hyperhomology is planned twice
**Location**: `TauCetiRoadmap/K3BlochGroups/README.md:1191`: “For a group G and a bounded-below complex C of integral G-modules, construct Hₙ(G,C)”.
**Claim**: This reconstructs the generic carrier, invariance, spectral sequence and Shapiro interface already supplied by SchemeKTheoryOperations.
**Witness**: SchemeKTheoryOperations #1229, `TauCetiRoadmap/SchemeKTheoryOperations/README.md:2546`, supplies these for nonnegative complexes, with functoriality at line 2552. For C=ℤ[0], G=C₂, both constructions give H₁=C₂; ordinary coinvariants instead give zero.
**Repair**: Import SchemeKTheoryOperations §6.7. Retain only the bounded-below shift adapter, the explicit total-differential sign comparison, and the configuration/coinvariant specialization. Remove the second generic construction and its duplicate API.

## R05 (P2) — Prove the missing stability input instead of assuming it
**Location**: `TauCetiRoadmap/K3BlochGroups/README.md:1818`; `TauCetiRoadmap/K3BlochGroups/Suggested.lean:175`: “the theorems below carry `IsGLStableThroughThree` as a hypothesis.”
**Claim**: The ring Bloch–Wigner theorems, finite-residue DVR comparison and local-domain comparison have been narrowed to avoid developing a prerequisite. The cited theorems do not impose this additional hypothesis.
**Witness**: Mirzaii, arXiv:1603.03649v1 line 2522, Corollary 6.3, p.30, gives B(ℤ_(11))≅B(ℚ) unconditionally: residue cardinality 11>9, finite, characteristics 0 and 11. The Lean signature additionally demands `hstab`.
**Repair**: Add explicit low-degree stability targets at the source generality, using Mirzaii Propositions 3.6(i), 4.7 and Mirzaii–Mokari §1, p.4; retain their residue exceptions. Remove the extra stability hypotheses from the endpoint statements and `bloch_dvr_equiv`. The ℤ_(11) instance must then require only `hk` and `hc`.

## R06 (P2) — Bloch rigidity is statable with the definitions already kept
**Location**: `TauCetiRoadmap/K3BlochGroups/Suggested.lean:20`: “transcendental rigidity … lack[s] … the Bloch boundary”; README §4.21 at line 1792.
**Claim**: The Bloch assertion B(F)→B(F(t)) is a missing statable headline. Missing proof machinery is not a missing statement carrier.
**Witness**: A scratch signature using the existing `preBloch`, `antisymSquare` and `preBlochSymbol`, with `RatFunc F`, elaborated successfully. It uses exactly the generator-determined existential boundaries and kernel-bijection clauses already used by `bloch_dvr_equiv`.
**Repair**: State Bloch rigidity for infinite F or finite cardinality ≥4 using those boundaries and the symbol map induced by `algebraMap F (RatFunc F)`. Require preservation, injectivity and surjectivity on the kernels. Remove this Bloch assertion from the docstring's unavailable list; the K₃ version may remain there.

## R07 (P3) — Correct the claim that no dilogarithm enters a proof
**Location**: PR description, `roadmap-summary` block: “No dilogarithm or regulator enters a proof.” The same overstatement occurs in `TauCetiRoadmap/K3BlochGroups/README.md:17`.
**Claim**: The order-six headline explicitly uses a dilogarithm detector.
**Witness**: `TauCetiRoadmap/K3BlochGroups/README.md:2097` proves the lower bound using the interval Rogers function: ρ([2])+ρ([−1])=π²/12−π²/4=−π²/6, of order six modulo π².
**Repair**: Replace both assertions with: “The Suslin sequence is constructed algebraically. Section 5.8 uses the interval Rogers dilogarithm to detect the exact order of the universal torsion class. Regulator comparisons belong to the downstream roadmaps.”

## R08 (P3) — Describe the new ring scope and supplier
**Location**: PR description, dependency prose: “everything else named in the README is a consumer, not a prerequisite.” The `roadmap-summary` block describes only field Bloch groups.
**Claim**: The description omits the ring generalization, refined module, ring sequences, new DVR headline and additional supplier; its prerequisite assertion is false.
**Witness**: `TauCetiRoadmap/K3BlochGroups/README.md:15`, `:1108`, `:1812` and `:111` specify those additions and consume HomologicalStabilityOfGeneralLinearGroups §2.3, from #2036, absent from the prose dependency list.
**Repair**: Add: “This adds a new roadmap. Its Bloch presentations cover commutative rings; §§3.17 and 4.22 add refined modules, ring Bloch–Wigner sequences and the DVR comparison, with `bloch_dvr_equiv` in Lean. HomologicalStabilityOfGeneralLinearGroups (#2036), §2.3, is an additional prerequisite.” Amend the quoted dependency sentence and summary accordingly.

## Verified sound

Cₙ denotes ℤ/n; Qₛ denotes the antisymmetric tensor cokernel. Rows involving a finding record the computed test and the required change, not certification of that passage.

| Statement | Instance | Computed left side | Computed right side / control | Result / change |
| --- | --- | --- | --- | --- |
| §1.1 Steinberg plus connectivity | Zero ring | St=E=1; H₁=H₂=H₃=0 | π₁=π₂=π₃=0 | Degenerate case agrees |
| §1.2 canonical third-homology comparison | C₅ models; q=×2, other maps identity | c(1)=3; c⁻¹(3)=1 | 2·3=1 mod 5; wrong direction gives 2 | Inverse direction agrees |
| §1.3 finite bar boundaries | Trivial group | d₄[1,1,1,1]=[1,1,1] | 1−1+1−1+1=1 | Unnormalized degeneracies retained |
| §1.3 degenerate degree-three chain | Any g | d₃[g,1,1]=[1,1]−[g,1] | At g=1: 0 | Equality needs actual boundaries |
| §1.4 ring maps and finite stages | Identity; zero ring | id sends every bar generator to itself; zero-ring H₃=0 | Induced H₃ maps id and 0→0 | No finite-stage injectivity inferred |
| §1.5 finite wedge comparison | 0,1,2 spheres | π₃ ranks 0,1,3 | n+binomial(n,2)=0,1,3 | Ordered-pair doubling excluded |
| §1.5 Hopf pinch and fold | Two spheres | Pinch coordinates (1,1,1) | Fold 1+1+2=4 | Quadratic cross-term retained |
| §1.5 reindexing and H-space kernel | Swap summands; H-space | (1,2,3)↦(2,1,3); Whitehead image=0 | Hopf images remain; mixed image=0 | No associativity field assumed |
| §1.5 Hopf quotient | A=ℤ | K₃=C₄₈, product image C₂ | H₃(E)=C₂₄; 48/2=24 | Correct quotient size |
| §2.1 indecomposable quotient | ℚ; ℚ(i) | C₄₈/C₂=C₂₄; (ℤ⊕C₂₄)/0 | C₂₄; ℤ⊕C₂₄ | Maps distinguish decomposables |
| §2.2 Milnor injection | ℝ; finite fields | {−1,−1,−1} has order 2; finite K₃ᴹ=0 | Nonzero order-two image; 0↪C_(q²−1) | Multiplication-by-two substitute fails |
| §2.2 integral torsion and closure | Characteristic 2, roots of orders 3,5 | Frobenius weight-two multipliers 4≡1 mod 3, 4 mod 5 | Root action alone gives 2 mod 3, 2 mod 5 | Twist distinguished |
| §2.3 real signatures | ℚ with one real place | Decomposable subgroup C₂ | Sign symbol (−1,−1,−1)≠0 | Real place retained |
| §2.4 imaginary quotient | ℚ(i) | −1=i²; triple-sign class=0 | Decomposable subgroup=0 | Imaginary case agrees |
| §2.5 rational rank | ℚ; ℚ(i) | C₄₈⊗ℚ=0; (ℤ⊕C₂₄)⊗ℚ=ℚ | r₂=0; r₂=1 | Torsion disappears |
| §3.1 antisymSquare_diagonal_exact | A=0,ℤ,C₂,C₃ | Qₛ=0,C₂,C₂,0 | Λ²A=0; A/2A=0,C₂,C₂,0 | Kernel formula agrees |
| §3.1 exterior projection | A=ℤ² | Qₛ=ℤ⊕C₂² | Λ²A=ℤ; kernel=C₂² | Killing diagonals prematurely fails |
| §3.2 cross-ratio normalization | (0,∞,1,3) | Cross-ratio=3 | Reciprocal convention=1/3 | Normalization distinguished |
| §3.2 five faces | (0,∞,1,2,3) | Arguments 1/2,3/4,3/2,3,2 | Alternating expression R(2,3) | Signs agree |
| §3.3 ring admissibility | ℤ; zero ring | W_ℤ=∅; zero-ring W={0} | Zero-ring five-term element=[0] | Zero-ring quotient=0 |
| §3.3 admissible pairs | ℤ_(3) | Every W element reduces to 2; differences reduce to 0 | No admissible pair | No field-only inversion shortcut |
| §3.4 pre-Bloch presentation | q=2,3,4,5 | P=0,ℤ,C₅,C₆ | Relation-matrix invariant factors: ∅,∅,(1,5),(1,1,6) | q=3 free rank 1 |
| §3.4 finite presentations | q=7,8,9,11 | Nonunit Smith factors 8,9,10,12 | P orders 8,9,10,12 | Independently computed |
| §3.4 raw versus quotient symbols | F₅, x=0,1 | Raw [0]=0; raw [1] nonzero | Quotient [0]=[1]=0 | Real bodies distinguish carriers |
| §3.5 five-term boundary | Formal x,y,1−x,1−y | Raw residual x⊗c+c⊗x, c=(1−x)/(1−y) | Zero in Qₛ; at (2,3), −2(2⊗2) | Antisymmetric quotient required |
| §3.5 boundary and Matsumoto | F₅; generator [3] of C₆ | ∂[3]=1∈C₂; ∂[2]=0 | Kernel=C₃; cokernel=K₂(F₅)=0 | Exactness agrees |
| §3.5 nonlocal ring | ℤ[1/2] | P=ℤ³; boundary image C₂² | Qₛ=C₂³; kernel index 4 | No arbitrary-ring Matsumoto claim |
| §3.6 universal torsion | q=4,5,7,11 | Orders of c: 1,3,2,6 | Each divides 6 | Independent presentation calculations |
| §3.6 inversion class | F₅, x=2 | h(2)=3[3], order 2; ∂h(2)=1∈C₂ | Not an element of B | Source's B-valued wording rejected |
| §3.7 small fields | F₂; F₃ | P=0; P=ℤ and ∂=reduction mod 2 | B=0; B=2ℤ≅ℤ | Finite-order formula excluded |
| §3.8 exterior-kernel variant | F₅ | Λ²(F₅ˣ)=0; exterior kernel=C₆ | Suslin kernel=C₃ | Integral carriers differ |
| §3.9 raw tensor kernel | F₅, R(2,3) | Relation becomes [4]; raw boundary has order 2 | Its Qₛ boundary=0 | Raw relation cannot be killed first |
| §3.10 lift obstruction | F₅, relation [4] | [4] has order-two raw obstruction | 2[4] has zero raw obstruction | Integral obstruction retained |
| §3.11 generic configurations | F₃ | Four-point orbit gives ℤ; no five-point tuple | P(F₃)=ℤ | No extra small-field relation |
| §3.12 specialization | t,t⁻¹,1+t at t=0 | Valuations 1,−1,0 | Specializations 0,∞,1 | Sign and degenerate values agree |
| §3.12 closed-point residue | ℝ[t], point (t²+1) | Residue of t=i; residue field ℂ | i²+1=0; no root in ℝ | Rational-point restriction necessary |
| §3.12 smoothness controls | Cusp; square-zero thickening | Cotangent dimension 2>1; ε²=0 with ε≠0 | Neither local ring is a DVR | Both excluded |
| §3.12 all-curve kernel | F₃ | P⊗ℚ=ℚ; curve quotient=0 | Kernel=ℚ, not bounded torsion | Conditional comparison retained |
| §3.13 older projective convention | ℚ, ξ_(2,1) | Exterior boundary 2∧(−1); sign/valuation pairing=1 mod 2 | Required cycle boundary=0 | Intersection repair is necessary |
| §3.13 old comparison | F₁₁ | B=C₆→B_old=C₆ has image C₃ | Kernel=C₂; cokernel=C₂ | Equal orders do not identify maps |
| §3.14 negative-unit target | F₃; F₅ | Q_neg=C₂; 0 | Ordinary exterior=0; Qₛ(F₅)=C₂ | Three tensor targets distinguished |
| §3.15 published projective group | F₂,F₃,F₁₁ | B_new=C₃,0,C₃ | Suslin B=0,ℤ,C₆ | Small-field exceptions essential |
| §3.16 exact convention maps | F₇ | C₄→C₂→C₄: reduction, then doubling | Kernel C₂; final cokernel C₂ | Odd coefficients remove both defects |
| §3.16 odd reduction | F₁₁, modulus 3 | C₆/3=C₃; C₃/3=C₃ | Both comparison maps bijective | Modulus 2 would retain defects |
| §3.17 refined module | F₄; F₅ nonsquare ε | λ₁=0 over F₄; λ₁[2]=0, λ₁[3]=2(1−ε) over F₅ | 2(1−ε)≠0 in ℤ[C₂] | Square classes matter |
| §3.17 refined relation | F₅, (2,3) | (1−ε)[2]+ε[4] | Augmentation gives [4]=0 | Forgetful relation agrees |
| §3.17 refined cross-ratio | (0,∞,a,b) | ⟨a⟩[b/a]; at a=1 gives [b] | Nonsquare scaling changes coefficient | GL₂ and SL₂ distinguished |
| §4.0 ordered words | Five points | Chain ranks 1,5,20,60,120,120; differential ranks 1,4,16,44,76 | Top homology rank 120−76=44 | Finite complex not contractible |
| §4.0 smallest nontrivial cycle | Two points | d((x,y)+(y,x))=0 | No degree-two chains; H₁=ℤ | Ordering retained |
| §4.1 hyperhomology | G=C₂, C=ℤ[0] | H₁=C₂; H₂=0 | Coinvariant complex has H₁=0 | Import existing owner, R04 |
| §4.1 total differential | Bidegree p=1 | Cross terms have signs +1 and −1 | Sum=0; D²=0 | Sign comparison retained |
| §4.2 frame complex | Ranks 0 and 1 | Top U₀=ℤ; d([2]−[1])=1−1=0 | Rank-one augmentation kernel nonzero | Empty-frame term retained |
| §4.3 scalar/affine acyclicity | Scalar 2 acting on ℚ | Coinvariant ℚ/(2−1)ℚ=0 | Degree zero with trivial coefficients=ℤ | Positive and zero degrees separated |
| §4.4 frame coinvariants | n=0,1,2 | S₀=ℤ; S₁=Fˣ; e∈S₂ maps to (0,1) | S₂=K₂ᴹ⊕ℤ | Extra integer summand retained |
| §4.5 ordered Milnor retraction | δ₁([2]); ℝ triple sign | δ₁([2])=⟨2⟩; {−1,−1,−1}≠0 of order 2 | Coefficient +1 preserves it; coefficient 2 gives 0 | Normalization test agrees |
| §4.5 symplectic-symbol coinvariants | b=1 in last relation | s(a,1−a)=s(a,1)=0 | Steinberg relation {a,1−a}=0 | Coinvariant presentation agrees |
| §4.6 frame splitting | e and a Milnor generator m | e↦(0,1); m↦(m,0) | Projection sends e to 0 and m to m | Splitting distinguished |
| §4.7 monomial groups | F₂,F₃, rank 2 | Orders 2 and 8 | GL₂(F₃) order (9−1)(9−3)=48 | Monomial subgroup proper |
| §4.8 stability and its map | n=i=1 over ℚ | (2)↦diag(2,1); H₁ multiplier=1 | Native stabilization and supplier give same map | Duplicate targets, R03 |
| §4.8 stability range | n=0, i=0 or 1 | H₀: ℤ→ℤ identity; H₁: 0→ℚˣ | i≤n permits only first case | Boundary of range agrees |
| §4.9 Hopf cube | C₂₄ and its 2-local image C₈ | 12 has order 2; reduction=4 | C₂₄/⟨12⟩=C₁₂ | Import TangentialBordism, R02 |
| §4.9 divisibility sentence | ν,5ν,7ν,11ν | 2·6u≡12 mod 24 for u=1,5,7,11 | η³ lies in 2C₂₄ | Earlier repair retained |
| §4.9 fourth-stem Check | Possible π₄=C₂ | C₂⊗ℤ[1/2]=0 | Integral C₂≠0 | Supplier cannot supply this inference, R01 |
| §4.10 configuration coinvariants | F₂,F₃ | C₂→C₁ is ×1; C₃→C₂ is ×0 | H₃=0 for F₂, ℤ for F₃ | Correct pages and small fields |
| §4.11 first differential | H₁(T₂), (a,1) | (1−σ)(a,1)=(a,a⁻¹) | Centre element (a,a) is fixed | Scalar and determinant-one tori differ |
| §4.11 face matrices | a=2,3 | Determinants (−1,−2,2), (−2,−6,3) | Formula (1−a,a(1−a),a) | Nonzero; a=0,1 excluded |
| §4.11 eight-term lift | a=2,3,−1 | Residual coefficients after subtracting six-term boundary: all 0 | Required chain residual=0 | Direct rational-matrix computation |
| §4.11 differential splitting | a=3, valuations (v₂,v₃) | Raw coordinates (1,−1) | Shear gives (0,−1) | Omitting shear changes boundary |
| §4.11 SL₂ torus normalization | Ordered wedge test | Raw (2,−2) | Shear gives (0,−2) | Factor −2 retained |
| §4.12 Bloch edge | ℚ, symbol [2] | ∂[2]=2∧(−1)≠0, order 2 | [2]∉B; edge image lies in kernel | Edge cannot target arbitrary symbols |
| §4.13 rotations and omitted-face complex | Three and four points | Top kernels: 6−3=3; 24−16=8 | Top homology ℤ³; ℤ⁸ | Direct deletion-matrix calculation |
| §4.14 rank-three coefficient | Reflection pair [x]+[1−x] | ψ′ on pair=−2c | Opposite sign gives +2c | Total-complex sign retained |
| §4.15 cyclicHomology_power_map | C₇, a=2, j=1,2 | Multipliers 2,4 | aʲ=2,4; constant multiplier 2 fails in H₃ | Nontrivial naturality target |
| §4.15 cyclic inclusion | C₂↪C₄, degree 3 | 1↦2 | Image has order 2 | Inclusion differs from reduction |
| §4.15 symmetricGroup_homology_stable | Σ₁→Σ₂; Σ₂→Σ₃, i=1 | 0→C₂; C₂→C₂ identity | 2≤1 false; 2≤2 true | Range agrees with Kerz |
| §4.16 monomial indecomposables | F₂; F₄ | Unit quotient C₁₂; C₃⊕C₁₂ | Orders 12,36; exponents 12,12 | Quotient by η³ matters |
| §4.17 Chern normalization | Weights u,−u | (1+u)(1−u)=1−u² | c₂=−u²; Tor projection=×2 | Both sign and factor retained |
| §4.18 closure detector | μ₇, automorphism ×2 | H₃ multiplier 4 | Root multiplier 2 is different | Weight-two detector |
| §4.18 divisible torsion | μ=ℚ/ℤ | μ⊗μ=0 | Tor₁(μ,μ) contains C₇≠0 | Tensor cannot replace Tor |
| §4.19 enhanced torsion | ℚ,F₅,F₄ | Enhanced orders 4,8,3 | Ordinary Tor orders 2,4,3 | Enhancement necessary at 2 |
| §4.20 infinite Suslin sequence | ℚ | Kernel order 4; quotient order 6 | 4·6=24=order K₃^ind | Ordinary Tor would give 12 |
| §4.21 rational-function rigidity | F₅⊂F₅(t) | ∂[3]=1∈C₂ in both fields; ∂(2[3])=0 | Symbol-preserving map fixes that cycle | Signature elaborates; add it, R06 |
| §4.21 residue sign | {2,t,π} over ℚ(t)((π)) | Degree-three residue {2,t}; next boundary 1/2 | Reversed convention gives 2 | Degree-dependent sign retained |
| §4.21 specialization of relations | R(tx,ty), t=0 | Terms 0,0,y/x,y/x,1 | Remaining [1]=0 only in reduced quotient | Degenerate relation retained |
| §4.22 many units | ℤ; F₅ | No t makes t,1+t units in ℤ; five pairs (−c,1) exclude all five t | Neither ring has many units | Finite-field stability not conflated |
| §4.22 DVR headline | ℤ_(11)⊂ℚ | Residue size 11; 11>9; finite; 0≠11 | Source has no additional stability assumption | Restore generality, R05 |
| §4.22 DVR negative controls | ℤ_(2); ℤ_(3) | B=0; two independent reflected pairs | B(ℚ)=C₆ | Both outside residue bound |
| §4.22 refined local bound | F₁₁,F₉,F₁₆ | (p−1)f=10,4,4 | >6: true,false,false | Field-size criterion distinguished |
| §5.1 finite indecomposables | q=2,3,4 | K₃ᴹ=0; K₃ orders 3,8,15 | Quotient orders 3,8,15 | Small fields included here |
| §5.1 transfer | F₂⊂F₄ | Restriction image 5C₁₅; tr·res=2 | res·tr=1+4=5 | Maps agree with supplier |
| §5.1 norm-one embedding | F₄/F₂, ω²+ω+1=0 | Multiplication matrix ((0,1),(1,1)); determinant 1 | Norm ω=ω³=1 | Zero has determinant 0, excluded |
| §5.2 localized finite SL₂ headline | q=2,3,4,5,7,8,9 | Cyclic orders 3,8,15,24,48,63,80 | q²−1, always positive | No natural-number truncation |
| §5.2 integral finite SL₂ headline | q=2,3,4,5,8,9,27 | Orders 6,24,30,120,126,240,2184 | p(q²−1); at q=7: 48 | Exceptional characteristic parts retained |
| §5.2 quaternion branch | Q₈ | H₁=C₂²; H₃=C₈; H₂=0 | Cyclic C₈ would have H₁=C₈ | Nonabelian control |
| §5.2 stable elements | G=S₃, p=3 | Inversion acts −1 on H²(C₃), +1 on H⁴(C₃) | Stable groups 0,C₃ | Fusion action cannot be omitted |
| §5.3 finite stabilization | F₂⊂F₄; F₃⊂F₉ | Image orders 3 in C₁₅; 8 in C₈₀ | 15/5=3; 80/10=8 | Actual stable image sizes |
| §5.4 finite edge kernels | q=4,5,7 | Integral H₃ orders 30,120,48 | Bloch orders 5,3,4; kernels 6,40,12 | Characteristic part retained |
| §5.5 finiteBloch_order | q=4,5,7,8,9,11 | Kernel orders 5,3,4,9,5,6 | q+1 or (q+1)/2 | Matches presentation computations |
| §5.5 finite exact sequence | q=4,5,7 | Enhanced kernel orders 3,8,12 | 3·5=15; 8·3=24; 12·4=48 | Exact sequence sizes agree |
| §5.5 left-arrow ambiguity | C₈→C₂₄, ×3 versus ×15 | Images both 3C₂₄; 1↦3 versus 15 | Equal images; unequal maps | No unsupported equality of arrows |
| §5.6 odd coefficients | q=7,n=3 | K₃/3=C₃ | B/3=C₄/3=0 | Root coprimality necessary |
| §5.7 arithmetic quotient | ℚ | C₄₈/C₂=C₂₄; no section of quotient | Any lift of generator has order 48 | Integral extension not split |
| §5.8 Rogers detector and order six | [1/2],[2],[−1] | Values −π²/12,π²/12,−π²/4 | c↦−π²/6; 2c,3c nonzero; 6c=0 | Contradicts no-dilog prose, R07 |
| §5.8 real-closed transfer | Real algebraic numbers; ℝ; ℚ | ∃x:x²=2 true,true,false | ∃x:x²+1=0 false in both real-closed fields | Formally real ≠ embedding into ℝ |
| §5.8 finite coefficient-list transfer | No pairs, k[1]=0 | True exactly for k=0 | [2]−[3] has augmentation 0 but is nonzero | Equality-pattern test necessary |
| §6.1 equality certificates | R(2,3), coefficients mod 0,2,3 | Quotient class 0 in all three | Raw [2] remains nonzero | No executable synthesis asserted |
| §6.2 boundary certificate | ℚ, [2]+[−1] | Mixed entries −1+1=0 | For [2] alone: −1≠0 mod 2 | Accepts cycle, rejects noncycle |
| §6.3 integral root multiples | Sixth root ω in ℚ(√−3) | 1−ω=ω⁻¹; boundary=−ω⊗ω≠0 of order 2 | ∂(2[ω])=0 | Exterior boundary would wrongly vanish |
| §6.3 square-root condition | ℚ(ζ₁₂) | −1=i²; diagonal class=0 | ∂[ω]=0 | Both directions tested |
| §6.4 divided classes | δ:ℤ→C₂; coefficients C₅ | 2⁻¹=3; 4⁻¹=4; kernel coordinates 3 and 2·4=3 | Images 3·2=1 mod 5 | Choice of annihilator agrees |
| §6.4 nonflat control | 2ℤ↪ℤ tensored with C₂ | Inclusion becomes zero | (2ℤ)⊗C₂=C₂≠0 | No kernel identification asserted |
| §6.5 fibres and multiples | C₂₄→C₆ over 1 | Fibre {1,7,13,19}; sixfold values {6,18} | Torsor under {0,6,12,18} | No additive section or unique multiple |
| §6.6 quotient boundary | 0→C₄→C₂₄→C₆→0, n=2 | Lift of 3 doubles to 6, kernel generator | C₂=B[2]→C₄/2=C₂ nonzero | Tensor exactness not overstated |
| §6.6 finite Frobenius | F₄, ω↦ω² | Bloch multiplier 4 mod 5 | 2²=4, not 2 | Mixed-field convention retained |
| §6.7 genuine coefficient headline | ℚ, n=5 | K₃/5=0; 2⁵=1 mod 31, 2≠1 | {2,−31} has exact order 5 in K₂ | Coefficient K₃ is nonzero |
| §6.7 even Chern control | ℝ, modulus 2 | c₂(2β)=1∈C₂ | 2c₂(β)=0 | Degree-two exception retained |
| PR supplier description | Listed versus actual suppliers | Additional prerequisite count: 1 (#2036) | Description lists it as neither supplier nor dependency | Correct text, R08 |

- 15 seeded targets compared with readable source text; §4.5's ordered-torus/retraction locators remain waived. Core witnesses: weibel lines 15948, 15846, 29539, 29744, 29823; mirzaii line 365; hutchinson2013 lines 350, 690, 861, 1673; cgz2021 lines 78, 389, published-version 453; kerz line 22; Hutchinson arXiv:1309.5010v2 line 388; Mirzaii–Mokari arXiv:1108.5452v2 line 245. No README locator is labelled unverified.
- 7 additional passage comparisons cover §§3.6, 3.12, 4.9, 4.22, 5.8, 6.7 and the finite-SL₂ homology docstring; source witnesses include weibel line 29661, goncharov line 903, hatcher line 16749, marker line 398, zagier line 1023, levine line 2851 and weibel-chern line 437.
- 15 declarations were checked with `#check @name` in one scratch elaboration; 0 lost binders. All 9 original theorems remained admitted after `simp`, `rfl`, and `infer_instance` probes; inspected library near-matches supply no one-lemma proofs. The additional Bloch-rigidity signature elaborates.
- 8 pinned interfaces opened explicitly: `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Stable.lean:79`; `TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean:127`; `Mathlib/RepresentationTheory/Homological/GroupHomology/FiniteCyclic.lean:85` and `:122`; `Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean:157`; `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean:56`; `TauCeti/RepresentationTheory/Homological/GroupCohomology/Sylow.lean:58`; `TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction/Mackey/AllDegrees.lean:279`. Antisymmetric tensors are a submodule, not Qₛ; cyclic homology equivalences do not supply power-map naturality.
- 73 numeric cross-roadmap locators resolved in 23 roadmap texts; the solver's missing-name list is empty. The substantive supplier drift is R01. Overlap metadata has 0 second copies, conflicting heads, dropped cited IDs, or revision-only cited IDs.
- 9 Lean headlines match their explicit binders: diagonal exactness, GL stability, cyclic power maps, symmetric stability, DVR comparison, two finite-SL₂ homology statements, finite Bloch order, formally-real order six. K₃/Hopf, Milnor/motivic, closed-field torsion, Suslin sequences, ring/refined sequences, arithmetic quotients and finite Chern comparisons are named in the docstring; Bloch rigidity is the statable omission in R06.
- 0 gate failures, including the worker's targeted build; independent `lake env lean` returned 0 with exactly 9 `sorry` warnings. The worktree is clean at the requested head, with 0 changed paths outside this folder.
- 0 outstanding findings in review ~10. Its recorded earlier R01 repair remains: README:1411 says “Since 12ν=2·(6ν), the relation also places η³ in 2π₃S.” R01 above concerns the supplier's newly resolved scope, not that deleted remark.

Dependency-check output:

```text
depcheck: 222 roadmaps, 1972 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

Overlap check: read Polylogarithms, HomologicalStabilityOfGeneralLinearGroups, K2SymbolsBrauer, ArithmeticKTheory, EllipticKTheory, PolylogarithmFunctions, AlgebraicKTheory and TangentialBordism; owners are K3BlochGroups for Bloch carriers/indecomposables, Polylogarithms for regulator descent, PolylogarithmFunctions for analytic functions/cross-ratios, K2SymbolsBrauer for Milnor symbols/residues, ArithmeticKTheory for ambient arithmetic K-groups, EllipticKTheory for curve K-theory, AlgebraicKTheory for stable groups/Steinberg/K₂, HomologicalStabilityOfGeneralLinearGroups for ring GL stability, and TangentialBordism for η³=12ν. Also read SchemeKTheoryOperations §6.7, the owner of generic group hyperhomology, and RealAlgebraicGeometry Layer 6, whose quantifier elimination is explicitly over ℝ.

Source independence: 22 passages compared with 16 readable works, counting CGZ's two versions once; no copied prose or nonmathematical reused tables found. Largest share: weibel, 132 of 268 explicitly author-labelled locator occurrences, excluding References. Contents compared with weibel lines 10–73: independent. Layers 1–2 use IV.1 and VI.1–5; Layers 3–4 split presentations from homological maps; Layer 5 combines arithmetic with Hutchinson's finite-field argument; Layer 6 concerns kernels and coefficients. The §4.10→§4.11→§4.12 dependency forces coinvariants before the differential before the edge map. Waived texts were not compared for wording.

## Not verifiable

- `suslin-1984`, `suslin-1991` and `bloch`: settled human waivers; locators retained without reopening requests. In particular Suslin 1984 §§2.6–2.7 and Theorem 3.4 were not read directly.

## Source issues

- **Misprint** in weibel at IV.1.19.1, printed p.273, line 15850: the source indexes mixed wedge factors by ordered distinct pairs and calls the remainder 3-connected; it should use unordered pairs and a 2-connected loop-space remainder; affects the proof.
- **Error** in weibel at VI.5.4(c), printed p.488, line 29666: the source places every inversion class in B(F); it should place them in P(F), since h(2) over F₅ has nonzero boundary; affects a stated result.
- **Error** in weibel at VI.5.6 proof, printed p.490, line 29747: the source calls the configuration modules free over ℤ[GL₂(F)]; they should be permutation modules induced from the scalar stabilizer; affects the proof.
- **Error** in weibel at VI.5.6.1, printed p.490, line 29764: the source assigns seven points to P¹(F₂) and claims degree-three acyclicity for every finite field; it should use three points and retain small-field/top-degree exceptions; affects a stated result.
- **Error** in weibel at VI.5.7, printed p.490, line 29768: the source gives the GL₂ homology formula for every field; the theorem used here should assume an infinite field, since F₄ has nonzero H₂(SL₂); affects a stated result.
- **Misprint** in weibel at the paragraph after (VI.5.8), printed p.490, line 29783: the source identifies E¹_(3,0) with P(F); it should identify E²_(3,0) with P(F); affects the proof.
- **Misprint** in weibel at the stabilizer computation after (VI.5.8), printed p.490, line 29790: the source uses diag(a,a⁻¹) for the triple stabilizer; it should use diag(a,a); affects the proof.
- **Error** in weibel at VI.5.7 proof, printed p.491, line 29823: the source states an all-degree Künneth direct sum without Tor; it should retain the Tor terms, though degree two has none; affects the proof.
- **Misprint** in weibel at VI.5.7 proof, printed p.491, line 29829: the source labels the kernel and cokernel after d³ as E³; they should be E⁴; affects the proof.
- **Error** in cgz2021 at arXiv v3 Definition 1.1, p.2, line 82: the source puts every extended relation in the exterior-boundary kernel; ξ_(2,1) has boundary 2∧(−1), so an intersection or different tensor target is required; affects a stated result; corrected in print at §2.1, Definition 2.1, p.391.
- **Error** in cgz2021 at published Lemma 2.2, p.391, line 459: the source asserts the comparison without a field-size restriction; it should assume at least four elements, since F₂ gives 0→C₃ and F₃ an infinite kernel; affects a stated result.
- **Misprint** in hutchinson2013 at Corollary 3.13 proof, arXiv v2 p.17, line 856: the source says a nonzero fixed vector exists exactly when 1 is not an eigenvalue; it should say exactly when 1 is an eigenvalue; affects the proof.
- **Misprint** in marker at Theorem 3.5 proof, printed p.25, line 428: the source chooses the midpoint even for intervals with infinite endpoints; it should choose a finite interior point, using a finite endpoint plus or minus one when necessary; affects the proof.
- **Error** in Coronado–Hutchinson, arXiv:2201.04996v3 at §8, p.27, line 1455: the source calls the Borel subgroup of SL₂(F₃) nonabelian of order six; it should be C₆, since its diagonal ±I is central; affects nothing.

## For the human reviewers

- The three waived texts were unavailable for wording comparison. The most-cited source, weibel, and its contents were readable; its wording and arrangement were checked.
