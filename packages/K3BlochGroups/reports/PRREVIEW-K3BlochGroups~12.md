# Review of K3BlochGroups (pull request #1430 at b5d451c)

**Verdict:** needs changes

## R01 (P2) — Reuse the pinned multiplication-matrix construction
**Location**: `TauCetiRoadmap/K3BlochGroups/README.md:1841`: “These multiplication matrices are constructed before the group-homology calculation and use only Mathlib’s norm, basis and matrix APIs”.
**Claim**: Section 5.1 replans the multiplication-matrix embedding, injectivity and determinant formula already in Tau Ceti. Only its norm-one restriction to SL₂ and basis-change comparison remain additional targets.
**Witness**: `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/LeftMulMatrix.lean:72`, `:89`, `:120` define `unitsLeftMulMatrix` and prove injectivity and determinant=norm for arbitrary bases. At 𝔽₄/𝔽₂, both give ((0,1),(1,1)) on ω.
**Repair**: Add these declarations to Scope and the Tau Ceti contract. Replace the repeated construction with: “Restrict TauCeti.unitsLeftMulMatrix e to the norm-one subgroup and corestrict to SL₂ using TauCeti.val_det_unitsLeftMulMatrix; inherit injectivity from TauCeti.unitsLeftMulMatrix_injective. Prove the basis-change comparison.” This retains the displayed 𝔽₄ matrix.

## R02 (P3) — Correct the acceptance-file import claim
**Location**: `TauCetiRoadmap/K3BlochGroups/README.md:49`: “The acceptance file uses Mathlib and Tau Ceti's `TauCeti.stabilizeGL`”.
**Claim**: The signature that used stabilization was deleted; the acceptance file neither imports Tau Ceti nor mentions that map.
**Witness**: `TauCetiRoadmap/K3BlochGroups/Suggested.lean:3` imports only Mathlib; its thirteen declarations contain zero occurrences of `TauCeti.stabilizeGL`.
**Repair**: Replace the sentence with: “The acceptance file uses Mathlib; the Tau Ceti interfaces below are consumed by the mathematical development.”

## R03 (P3) — Map both deleted stability identifiers for their consumer
**Location**: `TauCetiRoadmap/K3BlochGroups/README.md:27`: “Section 4.8 consumes their field specialization”.
**Claim**: Ownership has moved, but the deleted identifiers generalLinear_homology_stable and generalLinearStabilization have no old-to-new mapping. An open roadmap still cites both as declarations here.
**Witness**: HomologicalStabilityOfGeneralLinearGroups #2036, `TauCetiRoadmap/HomologicalStabilityOfGeneralLinearGroups/README.md:520` and `:694`, cites the deleted theorem and inclusion. Neither is declared at this head; the numbering sentence maps only §4.9.
**Repair**: Add: “The former generalLinear_homology_stable target of §4.8 is now supplied by HomologicalStabilityOfGeneralLinearGroups §2.3; the former generalLinearStabilization is TauCeti.stabilizeGL.” Both replacements retain (2)↦diag(2,1) and the identity on H₁≅ℚˣ.

## Verified sound

| Statement | Instances tried | Computed left side | Computed right side | Result / change |
| --- | --- | --- | --- | --- |
| §1.1 Steinberg plus and connectivity | Zero ring | St=1; π₁=π₂=π₃=0 | K₃=0 | Agree |
| §1.2 canonical Hurewicz composite | Zero ring; 𝔽₅ | H₃(St)=0; C₂₄ | K₃=0; C₂₄ | Agree |
| §1.3 finite bar witnesses | Identity triple | d₃(1,1,1)=0 | d₄(1,1,1,1)=(1,1,1) | Cycle is a boundary |
| §1.4 finite-stage maps | diag(2,1), identity embedding | det=2; identity cycle unchanged | Unit class 2; same cycle | Agree |
| §1.5 finite-wedge normalization | Two 2-spheres | Two Hopf generators, one mixed generator | π₃=ℤ³ | Unordered pair retained |
| §1.5 H-space Hopf argument | CP∞; point | π₂=ℤ, π₃=0; all groups zero | Hopf image=0; H₃=0 | Agree |
| §1.5 K₃/Hopf kernel | ℚ | K₂·[−1]=⟨24⟩⊂C₄₈ | H₃(SL)=C₂₄ | Agree |
| §2.1 indecomposable quotient | ℚ; zero ring | C₄₈/⟨24⟩; 0/0 | C₂₄; 0 | Torsion-free quotient would give 0 over ℚ |
| §2.2 Milnor injection | ℚ, {−1,−1,−1}; 𝔽₄ | 1↦24 in C₄₈; 0↦0 | Kernel 0 in both cases | Agree |
| §2.2 diagonal Chern coefficient | Degrees 1,2,3 | (−1)ⁿ⁻¹(n−1)!=1,−1,2 | Supplier coefficients 1,−1,2 | Cannot divide by 2 over arbitrary fields |
| §2.2 weight-two mod-two step | Algebraically closed Ω | K₄(Ω)/2=0 | H⁰(Ω,ℤ(2))/2=0 | Divisibility input retained |
| §2.2 characteristic-p comparison | Ω=𝔽̄₂, coefficient 2 | Positive coefficient K-groups 0 | K₀(Ω;ℤ/2)=C₂ | Degree-zero exception retained |
| §2.2 normalized closure torsion | Ω=𝔽̄₂, coefficient 5 | Bockstein C₅→K₃(Ω)[5] | C₅→C₅, isomorphism | Weight-two normalization retained |
| §2.3 real signatures | ℚ; ℚ(i) | All-negative triple: 1; no real coordinates | Milnor image C₂; 0 | Agree |
| §2.4 imaginary quotient | ℚ(i) | K₃ᴹ=0 | K₃^ind=ℤ⊕C₂₄ | Agree |
| §2.5 rational information | ℚ; ℚ(i) | C₂₄⊗ℚ=0; (ℤ⊕C₂₄)⊗ℚ=ℚ | Ranks 0; 1 | Agree |
| §3.1 antisymmetric cokernel; Lean diagonal theorem | A=ℤ | Qₛ=C₂; Λ²A=0 | Kernel C₂=A/2A | Exterior replacement fails |
| §3.1 diagonal relations | A=ℤ²; A=0 | Qₛ=C₂²⊕ℤ; 0 | Exterior projection (a,b,c)↦c; 0 | Diagonal kernel C₂²; 0 |
| §3.1 comparison with pinned eigenspace | A=ℤ, R=ℤ | Cokernel C₂ | Negative flip eigenspace 0 | Distinct objects |
| §3.2 cross-ratio adapter | (0,∞,1,3), swapped first pair | 3; 1/3 | Reciprocal supplier normalization | Agree |
| §3.2 boundary sign | ℚ, x=3 and 1/3 | β(∂[3])=−1; β(∂[1/3])=1 | Ordered (v₂,v₃) pairing −1; 1 | Sign distinguished |
| §3.3 five-term boundary | ℚ, (x,y)=(2,3) | Arguments 2,3,3/2,3/4,1/2 | β-sum 0−(−1)+1−2+0=0 | Agree |
| §3.3 admissibility | Diagonal pair over field; zero ring | x−x=0 nonunit; 0 unit | Excluded; permitted | Zero-ring relation is [0] |
| Raw symbol definition | ℤ, x=0,1,−1 | 0, basis(1), basis(−1) | Nonunit→0; units→basis | Real body matches prose |
| §3.4 pre-Bloch presentation | ℤ; zero ring | All generators killed; [0] killed | P=0; P=0 | Agree |
| §3.4 functoriality | ℤ→ℚ, u=−1 | Raw unit map sends killed symbol to [−1]≠0 | Reduced W-map has domain 0 | Raw unit map correctly excluded |
| §3.5 boundary and kernel | 𝔽₃ | P=ℤ; ∂ is reduction modulo 2 | B=2ℤ≅ℤ; K₂=0 | Agree |
| §3.5 Matsumoto exactness | 𝔽₅ | P=C₆→Qₛ=C₂ onto | Kernel C₃; cokernel K₂=0 | Agree |
| §3.6 universal torsion | 𝔽₄,𝔽₅,𝔽₇,𝔽₁₁,𝔽₁₃ | Orders of c: 1,3,2,6,1 | Every order divides 6 | Computed from relation lattices |
| §3.6 inversion symbol | ℚ, x=2 | β_sign,₂(∂([2]+[1/2]))=1 modulo 2 | P-valued h; not B-valued | Source error avoided |
| §3.7 small fields | 𝔽₂; 𝔽₃ | No generators; one generator, no relations | P=0; P=ℤ | Size restriction essential |
| §3.7 finite presentations | q=4,5,7,11,13 | Smith invariants 5,6,8,12,14 | P orders 5,6,8,12,14 | Agree |
| §3.8 exterior convention | 𝔽₅ | Λ²𝔽₅ˣ=0; exterior kernel C₆ | Suslin kernel C₃ | Integral distinction detected |
| §3.9 lecture kernel | 𝔽₅, R(2,3) | R(2,3)=[4]; λ([4]) has order 2 | Relation not in ker λ | Intersection quotient necessary |
| §3.9 quotient kernel | 𝔽₅, 2[4] | Nonzero free element; λ=0 | Image in P=0 | Raw kernel has infinite-order elements |
| §3.10 obstruction and sixfold lift | 𝔽₃; 𝔽₅ | E/L=0; 4[3] maps to generator C₃ | μ onto in both examples | Bound compatible; raw kernel not killed |
| §3.11 generic configuration presentation | 𝔽₂; 𝔽₃ | Zero generators; one generator, no five-point relation | P=0; ℤ | No degenerate relations added |
| §3.11 generic boundary sign | ℚ, x=3 | β(δ_gen[3])=1 | −β(∂[3])=1 | Agree |
| §3.12 smooth-curve specialization | ℚ[t] at t=0, x=2+t | Unit residues x↦2, 1−x↦−1 | [2+t]↦[2] | No properness used |
| §3.12 all-curve quotient | Zero relation; identity specialization | ξ−ξ=0 | Class 0; unresolved K_curv retained | No unconditional all-curve identification |
| §3.13 older exterior presentation | 𝔽₁₁ | B=C₆; B_old=C₆ | κ_old image C₃, kernel C₂, cokernel C₂ | Equal orders do not imply isomorphism |
| §3.13 intersection repair | ℚ, specialized (2,1) | Exterior boundary of h(2) pairs to 1 mod 2 | Relation excluded by intersection | Preprint containment claim fails |
| §3.14 negative-unit quotient | ℚ, u=2 | 2⊗(−2) killed in Q₋ | Exterior image 2∧(−1)≠0 | Targets distinguished |
| §3.15 published projective presentation | 𝔽₁₁ | P=C₁₂; inversion relation kills order 2 | B_new=C₃ | Published convention retained |
| §3.16 convention maps | 𝔽₁₁; odd coefficient 3 | C₆→C₃↪C₆ | Modulo 3 all groups C₃ | Integral failures disappear at odd coefficients |
| §3.17 refined coinvariants | 𝔽₄ | Square-class group 1; augmentation ideal 0 | RP=P; RB=B=C₅ | Agree |
| §3.17 coefficient restriction | Square-class group C₂ | Averaging denominator 2 unavailable over ℤ | Available over ℤ[1/2] | Integral exactness not inferred |
| §4.0 ordered words | Cardinalities 0,1,2,3 | Top augmented homology ℤ,0,ℤ,ℤ² | Lower degrees vanish | Finite complex not contracted indiscriminately |
| §4.1 bounded-below shift | G=1, C=ℤ[−1] | H₋₁=ℤ | Shifted H₀=ℤ | Unshifted value 0 excluded |
| §4.1 differential signs | p=q=1 | Swap sign −1; D² cross-coefficients −1+1 | −1; 0 | Agree |
| §4.1 augmentation | Two-point set, trivial group | H₁(C)=ℤ | H₁(1,ℤ)=0 | Infinite hypothesis necessary |
| §4.2 independent frames | n=0; n=1 over 𝔽₃ | C₀=ℤ only; ℤ²→ℤ sums entries | Top homology ℤ; ℤ | Ranks and augmentation agree |
| §4.3 scalar acyclicity | ℚ affine group; finite control 𝔽₃ | ℚ/(2−1)ℚ=0; H₃(S₃)=C₆ | H₁ affine=ℚˣ; H₃(C₂)=C₂ | Infinite hypothesis retained |
| §4.4 frame products | S₀; e∈S₂ | Unit 1; e↦(0,1) | Identity product; K₂-coordinate 0 | Not Milnor algebra alone |
| §4.5 ordered Milnor retraction | ℝ, (−1,−1,−1) | Ordered symbol 1∈C₂ | Quotient class of order 2 | Multiplication by 2 would fail |
| §4.5 rank-two Steinberg relation | {2,−1} | {2,1−2}=0 | Torus class zero modulo H₂(GL₁) | Agree |
| §4.6 splitting | n=2 | e:ℤ→K₂ᴹ⊕ℤ sends 1↦(0,1) | Retraction sends e↦0 | Complement detected |
| §4.8 imported stability and quotient | n=0,1 over ℚ | H₀:1↦1; H₁:2↦2 | Identity ℤ; identity ℚˣ | Supplier statements resolved; Suslin source waived |
| §4.8 unstable boundary | H₁(GL₀)→H₁(GL₁) | 0→ℚˣ | 2 not in image | Outside stability range |
| §4.10 coinvariant configurations | 𝔽₂; 𝔽₃ | H₃=0; ℤ | P=0; ℤ | Coinvariants retain small-field values |
| §4.11 stabilizers and d¹ | diag(2,3); scalar 2 | (2,1)↦(2,1/2); Δ(2)=(2,2) | 1−swap; swap-fixed centre | Determinant-one subgroup is not centre |
| §4.11 eight-term lift | a=2,3 over ℚ | Expanded bar boundary minus six faces=0 | Zero coefficient at every diagonal orbit | Both calculations cancel exactly |
| §4.11 determinants | a=2; a=0,1 | det(A,B,C)=−1,−2,2; singular matrix | 1−a,a(1−a),a | Excluded denominators detected |
| §4.11 d³ splitting | a=3, valuation pairing | Raw coordinates (1,−1) | Sheared coordinates (0,−1) | Required shear retained |
| §4.11 SL₂ torus coefficient | Ordered wedge pairing 1 | Raw (2,−2) | Sheared (0,−2) | Coefficient −2 retained |
| §4.12 image in Bloch kernel | ℚ | ∂c=0; ∂[2]≠0 of order 2 | c in image; [2] outside B | Not surjective onto P |
| §4.13 general position | Fano plane | Four-point frame; every five-point set has collinear triple | GP₃ nonzero; GP₄=0 | Finite acyclicity not asserted |
| §4.13 precyclic norm | Ordered triple (0,1,2) | dᵃN=(12)−(02)+(01)−(21)+(20)−(10) | Nd has the same six coefficients | Degree-dependent sign necessary |
| §4.13 cone | Degree-one pair (x,y) | d_D(x,y)=dᵃx−Ny | D₀=Cᵃ₁ | Truncation and minus sign retained |
| §4.14 projection | [3;2] over ℚ | Projected cross-ratio 3 | ψ′=[3], boundary pairing −1 | Reciprocal gives +1 |
| §4.14 cyclic sum and P-sign | All 72 admissible pairs over 𝔽₁₁ | Sum of five rotated symbols=2c, order 3 | ψ′(P)=−2c cancels it | Zero residual in all 72 cases |
| §4.14 coefficient naturality | 𝔽₄→𝔽₄(t), symbol ω | [ω]↦[ω], order 5 | Same normalized quadruple | Reciprocal would give 4[ω] |
| §4.15 permutation identities | 𝔽₁₁, x=2,3 | Corrected identity residual 0 | Printed exercise residual has order 3 | Roadmap correction verified |
| §4.15 permutation image | ℚ | Order(2c)=3 | Image subgroup C₃ | Two-primary image 0 |
| §4.15 cyclic power-map headline | C₅, a=2, j=1,2,3 | Multipliers 2,4,3 | 2ʲ modulo 5 | Identity coefficients retained |
| §4.15 cyclic inclusion | C₂↪C₄, H₃ | Generator maps to 2∈C₄ | Multiplier 4/2=2 | Not the same-order power formula |
| §4.15 symmetric stability headline | i=0,n=0; i=1,n=2 | ℤ→ℤ identity; C₂→C₂ identity | Bijective at n≥2i | n=1,i=1 gives 0→C₂, outside range |
| §4.16 Hopf quotient | π₃S=C₂₄ | η³=12; quotient C₂₄/⟨12⟩ | C₁₂ | Uses main's owner |
| §4.17 Chern and doubling | C₇; C₂ | c₂(λ⊕λ⁻¹)=−u²; doubling 1↦0 mod2 | Weight-two class; ordinary Tor doubling | Detection is not doubling |
| §4.18 closure detector | C₇, power 2 | H₃ multiplier 4 | Tate-twist multiplier 4 | Untwisted multiplier 2 excluded |
| §4.18 two-primary normalization | m=8 | c₂(β²)=−1 mod8; e=1 mod8 | e=−c₂ | Cofinal modulus covers order 2 |
| §4.18 tensor versus Tor | μ=ℚ/ℤ | μ⊗μ=0 | Tor₁(μ,μ)=ℚ/ℤ | Wrong target excluded |
| §4.19 enhanced Tor | ℚ; 𝔽₄ | C₄→C₂ has kernel C₂; C₃→C₃ | Nonsplit extension; identity-order isomorphism | Ordinary Tor insufficient over ℚ |
| §4.19 root-model naturality | Complex conjugation on μ₆ | Cyclotomic multiplier −1 | Tor multiplier (−1)²=1 | No natural root-model identification |
| §4.20 natural Suslin sequence | ℚ | Kernel of C₂₄→C₆ is {0,6,12,18} | T̃=C₄; 4·6=24 | Exact; ordinary Tor gives 2·6≠24 |
| §4.20 rational headline | ℚ(i) | (ℤ⊕C₂₄)⊗ℚ=ℚ | B⊗ℚ=ℚ | Torsion kernel vanishes |
| §4.21 K₃ rigidity | 𝔽₄→𝔽₄(t) | C₁₅→C₁₅ | Milnor-residue cokernels equal | K₂ residue comparison has sign +1 |
| §4.21 Bloch rigidity headline | 𝔽₄→𝔽₄(t) | Generator [ω] of C₅ preserved | C₅→C₅ | Source/target definitions match Lean |
| §4.21 rational-curve relations | x(t)=2+t, at t=0 | [x(t)] specializes to [2] | Constant [2] specializes to [2] | Rational specialization difference 0 |
| §4.22 many-units condition | ℚ; 𝔽_q | Finitely many forbidden scalars leave a choice; q exclusions exhaust 𝔽_q | True; false | Finite fields use separate route |
| §4.22 finite-residue stability | q=11; q=16 domain/general ring | H₂,H₃ allowed; H₃ allowed/excluded | Proposition ranges match | No extra stability hypothesis |
| §4.22 ring Bloch–Wigner | Infinite field ℚ | T=C₄, K₃^ind=C₂₄, B=C₆ | Kernel order 4 | Agrees with field endpoint |
| §4.22 DVR headline | ℤ_(11)→ℚ | Residue size 11>9; finite | hk and hc true; B→B bijective | Mixed characteristic included |
| §4.22 DVR unit-symbol argument | m=11, π=11, a=1 | (1+11)(1+11)=1+13·11 | c=13 is a unit in ℤ_(11) | No division by nonunit required |
| §4.22 refined local sequence | q=11; q=16 | (p−1)f=10; 4 | >6 true; false | Stronger refined threshold retained |
| §4.22 local coinvariant comparison | 𝔽₁₁, invert 2 | H₃=C₁₂₀→C₁₅ after localization | K₃^ind[1/2]=C₁₅ | Agree |
| §5.1 finite Milnor quotient | 𝔽₂; 𝔽₅ | K₃ᴹ=0; 0 | K₃^ind=C₃; C₂₄ | Small fields included |
| §5.1 norm-one embedding, R01 | 𝔽₄/𝔽₂, basis (1,ω) | Multiplication matrix ((0,1),(1,1)), det=1 | Pinned unitsLeftMulMatrix gives same matrix | Reuse pinned construction |
| §5.2 localized SL₂ headline | q=2,3,4,5 | Characteristic-free orders 3,8,15,24 | q²−1=3,8,15,24 | Agree |
| §5.2 integral SL₂ headline | q=2,3,4,5,7,9,27 | Orders 6,24,30,120,48,240,2184 | Exceptional p-factor only at listed q | Nonabelian S₃ and quaternion case retained |
| §5.2 period and subgroup maps | C₃⊂S₃; Q₈⊂SL₂(𝔽₃) | H₃ subgroup orders 3; 8 | Images in C₆; C₂₄ have same orders | Actual injections distinguished |
| §5.3 stabilization | 𝔽₂⊂𝔽₄; 𝔽₃⊂𝔽₉ | Image orders 3 in C₁₅; 8 in C₈₀ | Quadratic torus image orders 3; 8 | Factorization sizes agree |
| §5.4 finite configuration range | q=4 | P¹ has 5 points; exact through degree 3 | Bar comparison needs degrees ≤3 | No infinite-set contraction |
| §5.4 refined finite boundary | q=4 | Square-class group trivial, diagonal exterior 0 | Extra filtration terms 0 | Characteristic-two case retained |
| §5.5 finite Bloch headline | q=4,5,7,11,13 | Orders 5,3,4,6,7 | q+1 or (q+1)/2 | Matches independently reduced presentations |
| §5.5 finite Suslin sequence | q=4,5,11 | K₃ orders 15,24,120; kernel orders 3,8,20 | Quotient orders 5,3,6 | Products 15,24,120 |
| §5.6 odd coefficients | q=4,n=5; q=7,n=3 | Five groups C₅; K₃/3=C₃, B/3=0 | First allowed; second fails gcd condition | Root condition necessary |
| §5.7 arithmetic quotient | ℚ; ℚ(i) | C₄₈/C₂=C₂₄; (ℤ⊕C₂₄)/0 | C₂₄; ℤ⊕C₂₄ | Nonsplit rational-field quotient retained |
| §5.8 Rogers values | x=1/2,2,−1 | −π²/12, π²/12, −π²/4 | Piecewise formulas give same values | Correct period π² |
| §5.8 order-six headline | c=[2]+[−1] | ρ(c)=−π²/6; ρ(2c)=−π²/3; ρ(3c)=−π²/2 | Orders 6,3,2 modulo π² | Lower and upper bounds agree |
| §5.8 real-closed transfer | ℝ_alg, ℝ; ℚ negative control | ∃x,x²=2 true,true; false | RCF hypotheses distinguish ℚ | No Archimedean hypothesis |
| §5.8 finite certificate transfer | No relations, ξ=[2]−[3] | Augmentation 0; two nonzero coefficients | Free-group expression nonzero | Equality-pattern condition necessary |
| §6.1 five-term witnesses | (2,3); empty certificate | R(2,3) maps to 0; empty sum 0 | Same quotient value 0 | Does not supply a search algorithm |
| §6.2 boundary certificate | ℚ, [2]+[−1]; [2] | Mixed coordinates −1+1=0; −1 mod2=1 | Valid; invalid | Antisymmetric target essential |
| §6.2 diagonal certificate | Primitive sixth root ω | 1·5=1 mod2; 2·1·5=0 mod2 | [ω] rejected; 2[ω] accepted | Exterior-only test would fail |
| §6.3 integral root multiple | δ:ℤ→C₂, x=1,m=2 | δ(2)=0; underlying kernel element 2 | Not raw element 1 | Construction determined |
| §6.3 sixth-root criterion | ℚ(√−3); ℚ(ζ₁₂) | −1 nonsquare; square | ∂[ω] nonzero; zero | Both directions tested |
| §6.4 invertible denominator | δ:ℤ→C₂, coefficients C₅ | Annihilators 2 and 4 give 3 and 2·4=3 mod5 | Same kernel-tensor coordinate | Choice independence holds |
| §6.4 nonflat control | 2ℤ↪ℤ, tensor C₂ | Nonzero kernel tensor maps to 0 | Multiplication by 2 on C₂ is 0 | Inclusion need not remain injective |
| §6.5 Suslin fibre | C₂₄→C₆ over 1 | {1,7,13,19} | Free transitive C₄ action | No additive section: 6·1≠0 mod24 |
| §6.6 mixed-field compatibility | 𝔽₄→𝔽₄(t)→𝔽₄(t)(s) | [ω]↦[ω] along both paths | Order 5 retained; [ω²]=4[ω] | Zero or reciprocal map excluded |
| §6.6 ordinary coefficients | ℚ, n=3; n=2 | K₃^ind/3=C₃; T̃/2=C₂ | B/3=C₃; enhanced term retained at 2 | Odd-prime shortcut not applied at 2 |
| §6.7 genuine finite coefficients | ℚ,n=5, {2,−31} | 5-symbol=0; tame powers 2,4,8,16,1 | K₃/5=0; K₂[5]≠0 | Finite coefficient group nonzero |
| §6.7 Chern endpoint | n=1; number field odd n | Both groups 0; Milnor image modulo n=0 | 0; full finite-coefficient comparison | No root-of-unity containment required |
| §6.7 degree-two correction | ℝ,m=2, Bott β∈C₄ | c₂(2β)=1∈C₂ | 2c₂(β)=0 | Not incorrectly applied to degree three |
| Acceptance imports, R02 | Entire Suggested.lean | One Mathlib import; zero stabilization uses | README claims Tau Ceti use | Replace sentence |
| Deleted identifiers, R03 | Open #2036 references | Two missing identifiers; three surviving citations | No identifier migration mapping | Add both mappings |

| Previous finding | Passage at this head | Disposition |
| --- | --- | --- |
| r11 R01 | README:123: “Section 4.16 uses the group and its generator” | Repaired: no fourth-stem or former d₃ prerequisite remains. |
| r11 R02 | README:127: “Section 8.3 (B3.3) supplies η³=12ν≠0” | Repaired: relation imported from TangentialBordism on main. |
| r11 R03 | README:27: “Section 4.8 consumes their field specialization” | Repaired: duplicate signatures deleted; migration omission is R03 above. |
| r11 R04 | README:107: “Section 6.7 supplies integral group hyperhomology of nonnegative complexes” | Repaired: only shift, sign and configuration adapters remain here. |
| r11 R05 | README:1790: “either char K = char k or k is finite” | Repaired: source stability ranges are targets; Lean has no hstab binder. |
| r11 R06 | Suggested.lean:119: “theorem bloch_rationalFunctionField” | Repaired: actual symbol map and bijectivity on kernels are stated. |
| r11 R07 | README:17: “Section 5.8 uses the interval Rogers dilogarithm” | Repaired here and in the description's roadmap-summary block. |
| r11 R08 | PR prose: “The README develops pre-Bloch and Bloch presentations over commutative rings.” | Repaired: ring endpoints, new headline and #2036 supplier are named. |

- Sources: all 15 seeded targets audited; readable locators matched theorem/page/hypotheses, with Suslin exceptions below; no additional unverified locator flags.
- Pinned declarations opened: cyclic homology (`Mathlib/RepresentationTheory/Homological/GroupHomology/FiniteCyclic.lean:85`, `:122`), HSpace (`Mathlib/Topology/Homotopy/HSpaces.lean:65`), tensor eigenspace (`TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean:127`), stabilization (`TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Stable.lean:79`), and the three multiplication-matrix declarations in R01 (eight displayed declaration locators).
- Pinned contracts also checked: Shapiro, transfer/connecting maps, Sylow/Mackey, real closures/order extension, smooth regular stalks and the one-dimensional DVR criterion; no second Bloch or K₃ carrier found at the pins.
- Supplier citations: 16 named roadmap contract subsections resolved against main/open heads; supplier-object searches and all seven closest scopes read; two deleted identifier references require R03.
- Gate: all checks passed, including the targeted build; independent direct Lean elaboration passed with exactly nine `sorry` warnings; repository changes outside this folder: 0.
- Signatures/padding: all 13 `#check @name` declarations elaborated; 0 lost hypotheses; all nine `simp`/`rfl`/`infer_instance` probes failed, and opened library candidates do not close the headlines by one `exact`.
- Headlines: nine statable results are present; homological K₃/Hopf, Milnor/motivic, closure torsion, Suslin/naturality, K₃ rigidity, arithmetic quotients, ring/refined comparisons, finite Chern and Rogers descent are named with missing carriers in the docstring.
- PR text: new folder, 97 headings, 13 declarations, ring scope, removed stability signatures, moved Hopf target and suppliers compared with head; prose and roadmap-summary agree with the changes.

`depcheck: 222 roadmaps, 1973 edges, 0 problem(s)`

Overlap check: read Polylogarithms, HomologicalStabilityOfGeneralLinearGroups, K2SymbolsBrauer, ArithmeticKTheory, EllipticKTheory, PolylogarithmFunctions and AlgebraicKTheory; owners are respectively analytic regulator descent, frame spectral sequence/GL stability, Milnor symbols/residues, ambient arithmetic K-groups, curve K-theory, analytic functions/projective cross-ratios, and stable matrices/K₁/K₂. K3BlochGroups owns the Bloch presentations, convention adapters and K₃–Bloch comparisons; the pinned multiplication-matrix overlap is R01. No second copy, conflicting head or unmapped supplier section was found.

Source independence: 26 passages compared with 14 readable sources, including five additional sections; no copied prose or reused source table found. Largest share: weibel, 118 of 224 explicitly source-labelled citation occurrences before References. Contents compared at weibel line 10: independent layers; §§2.1, 3.5, 4.14–4.20 and 5.3–5.5 force the quotient→presentation→comparison order, while Suslin frames, ring sequences and coefficient interfaces cut across the book's chapters.

## Not verifiable

- suslin-1984, especially §§3.1–3.2/Theorem 3.4(a–d), pp.196–198, for seeded §4.8: manifest waived; no readable text in the supplied cache; locator retained without source certification.
- suslin-1991, including Lemma 2.2, Lemmas 4.1–4.4, Lemmas 5.7–5.8 and the order-six argument: manifest waived; no readable text in the supplied cache; readable alternative passages checked where cited.
- bloch, Lecture 6: manifest waived; no readable text supplied; used only to name the full-tensor convention.
- mirzaii-erratum, Math. Z. 275 (2013), pp.653–655: manifest uncertified; no readable text supplied; no theorem from it is used.

## Source issues

- **Misprint** in weibel at proof of VI.5.3, printed p.488, weibel line 29644: the source says K₃^ind(F) is C_w after computing its torsion; it should retain the free summand ℤ^r₂; affects the proof.
- **Error** in weibel at IV.1.19.1, printed p.273, weibel line 15850: the source says mixed factors run over ordered distinct pairs and the remainder is three-connected; it should use unordered pairs and a two-connected remainder; affects the proof.
- **Misprint** in weibel at VI.4.3, printed p.481, weibel line 29180: the source says the degree-three Chern composite is multiplication by −2; it should be +2, consistent with V.11.13 and its product formula; affects the proof.
- **Error** in weibel at VI.5.4(c), printed p.488, weibel line 29666: the source says inversion symbols define a homomorphism into the Bloch kernel; it should be a homomorphism into the pre-Bloch group, with boundary x∧(−x); affects a stated result.
- **Error** in weibel at proof of VI.5.6, printed p.490, weibel line 29747: the source says the configuration modules are free over GL₂; it should be permutation modules induced from the scalar stabilizer; affects the proof.
- **Error** in weibel at VI.5.6.1, printed p.490, weibel line 29764: the source says the projective line over 𝔽₂ has seven points and deduces low-degree acyclicity uniformly; it should be three points, with nonzero top homology; affects the proof.
- **Error** in weibel at VI.5.7, printed p.490, weibel line 29768: the source says its GL₂ homology formula holds for all fields; it should require an appropriate infinite-field hypothesis here, since H₂(GL₂(𝔽₄))=C₂ while the displayed right side is zero; affects a stated result.
- **Misprint** in weibel at (5.8) discussion, printed p.490, weibel line 29783: the source says P(F) occurs as E¹₃,₀; it should be E²₃,₀; affects the proof.
- **Misprint** in weibel at (5.8) stabilizers, printed p.490, weibel line 29790: the source says the triple stabilizer is diag(a,a⁻¹); it should be the scalar subgroup diag(a,a); affects the proof.
- **Error** in weibel at proof of VI.5.7, printed p.491, weibel line 29823: the source says arbitrary-degree product homology is a sum of tensor terms alone; it should retain the Künneth Tor terms, which can be nonzero in degree three; affects the proof.
- **Misprint** in weibel at proof of VI.5.7, printed p.491, weibel line 29829: the source says the kernel and cokernel after d³ are E³ terms; it should label them E⁴, subsequently stable in these positions; affects the proof.
- **Misprint** in weibel at VI.5.9, printed p.492, weibel line 29879: the source says the norm uses coefficients (−1)ⁱ; it should use (−1)ⁿⁱ in degree n; affects the proof.
- **Error** in weibel at the map preceding VI.5.10, printed p.493, weibel line 29988: the source says ψ′(P)=2c for its cone differential; it should be −2c, with ψ′([a;x])=[a]; affects the proof.
- **Gap** in weibel at proof of VI.5.19, printed p.499, weibel line 30403: the source says excluding moduli congruent to two modulo four permits its product calculation; it should use odd moduli or multiples of eight, as V.11.3.2 states; affects the proof.
- **Error** in weibel at Exercise VI.5.5, printed p.500, weibel line 30490: the source says the second identity uses 2[−x²] and −[x⁻²]; it should use 2[−x⁻¹] and −[(1−x)⁻²], with x≠0,±1; affects a stated result.
- **Error** in cgz2021 at arXiv v3 Definition 1.1, p.2, cgz2021 line 82: the source says the specialized relations lie in its exterior-boundary kernel; it should intersect with that kernel or change the tensor target, since the (2,1) specialization has nonzero boundary over ℚ; affects a stated result; corrected in print at Definition 2.1, p.391.
- **Gap** in marker at proof of Theorem 3.5, printed p.25, marker line 428: the source says a midpoint supplies a point in every interval; it should separately choose points in intervals with an infinite endpoint; affects the proof.

## For the human reviewers

- none
