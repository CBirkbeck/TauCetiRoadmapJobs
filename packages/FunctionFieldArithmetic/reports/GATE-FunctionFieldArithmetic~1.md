## H01 (CBirkbeck) — applied

The full dual of the unnormalized class is replaced by the continuous dual of the primitive class x₀, with n₀ subtracted from the valuation bound and the finite-layer shift, zero class and constant-only tower specified in `TauCetiRoadmap/FunctionFieldArithmetic/README.md:1163`. The new Check at line 1208 gives x=p[T⁻¹], n₀=1, G¹=G and conductor exponents 0,2 at lengths 1,2, consistent with kw line 1169 and kw line 1178.

## H02 (CBirkbeck) — disputed

The supplier exists as the earlier roadmap design `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/design/README.md:76` (formal-hom), line 110 (formal-module) and line 146 (adic-points), and precedes FunctionFieldArithmetic in the merge order; its absence from main and the open-roadmap index does not establish absence from the permitted portfolio. `TauCetiRoadmap/FunctionFieldArithmetic/README.md:280` and line 987 now identify these exact targets and their characteristic-independent ring/adic hypotheses; recreating them here would duplicate their owner.

## H03 (CBirkbeck) — applied

The rank-one tame Check is restricted to coefficient fields in `TauCetiRoadmap/FunctionFieldArithmetic/README.md:1913`, and the product-ring counterexample at line 1916 explicitly gives invariants 0×𝔽₃, P₀(T)=(1,1−T) and Euler factor (1,(1−T)⁻¹). The finite-ring determinant theorem and its flatness hypothesis remain intact, as supported by stacks line 1138.

## H04 (CBirkbeck) — applied

The ambiguous conductor is replaced by separately named quotient and selected-character conductors of θ and χ∘θ in `TauCetiRoadmap/FunctionFieldArithmetic/README.md:1231`, and §4.10 explicitly identifies its maximum-over-all-characters conductor with the quotient conductor at line 1561. The Check at line 1285 has quotient conductor 2[∞] for yᵖ−y=t and selected-character conductor zero for the trivial character; a faithful character recovers 2[∞], consistent with the unit-kernel definition in kw line 1158.

## H05 (CBirkbeck) — applied

The number-field global §6.2 citation is replaced by MetaplecticAutomorphicForms §§2.5, 3.2a, 3.3 and 3.3b in `TauCetiRoadmap/FunctionFieldArithmetic/README.md:404`; §7.5 names the local oscillator-evaluation adapter, its covariance/spherical normalization and the finite Fourier Gram-count limit at lines 2837, 2846 and 2863. The comparison uses ambient rank n+2j and the specified Fourier sign and measures, retaining nonunitary split characters by a group-character twist rather than a unitary splitting, with source boundaries verified at fyz line 615 and kudla_rapoport line 1733.

## H06 (CBirkbeck) — applied

`TauCetiRoadmap/FunctionFieldArithmetic/README.md:2756` adds the direct finite Hermitian linking-module reciprocity target, including the exact two finite sums, constant coefficient, degree and sign, with GeometryOfNumbersAndQuadraticArithmetic §3.1 supplying the residue-field counts. This supplies the missing characteristic-two proof obligation without claiming a transfer from same-ring invariance; the zero, cyclic length-one/two and 𝔽₄ Hermitian-plane Checks compute 1, 1−T, 1−T+T² and 1+T+T², while fyz line 453 and fyz line 596 confirm the characteristic restriction on the cited source theorem.

### Ownership and source verification

Ownership was searched by object in the roadmap index, main at 82e5289, the board packages and all 32 supplied sibling roadmap heads. The generic formal-module foundation remains with LubinTateFormalModulesAndQuasiCanonicalLifts LT.0; finite-field Hermitian counts remain with GeometryOfNumbersAndQuadraticArithmetic §3.1, and its §3.2 retains the inert characteristic-different-from-two density theory; MetaplecticAutomorphicForms retains the local oscillator construction. The local function-field section adapter and inert equal-characteristic-two reciprocity are owned here because the former supplier's global §6.2 is number-field-only and the latter supplier's transported reciprocity excludes equal characteristic two. No ownership or dependency was moved to a later roadmap, and no existing carrier was redeclared.

The cross-roadmap citation resolver found no unresolved citations or Lean names; the changed supplier sections were also read, including the LT.0 board design missed by the open-roadmap index. Pinned Mathlib `FormalGroup` and its separate commutativity condition are in `Mathlib/RingTheory/FormalGroup/Basic.lean:56` and line 76; `FormalGroup.Point` at line 126 is power-series-valued, not the general evaluated maximal-ideal point carrier required here. The seven definitions and eleven theorems in Suggested.lean were checked against the pinned packages through elaboration; no new library API or declaration names were introduced.

All source passages needed for these findings were read in the supplied legal extractions: kw line 1158, kw line 1169, kw line 1178, kw line 1184; yoshida line 222, yoshida line 264, yoshida line 293; stacks line 1138; fyz line 453, fyz line 509, fyz line 582, fyz line 596, fyz line 615; kudla_rapoport line 1719 and kudla_rapoport line 1733. No new source was needed, and the settled uncertified or waived citations were not reopened.

### Adversarial mathematics pass

The table records every changed mathematical assertion and the interfaces used to repair it; grouped rows test several instances of one assertion. The checks compare actual values, not only elaboration.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Primitive normalization x=pⁿ⁰x₀ | p=2,3; x=p[T⁻¹] | n₀=1; x₀=[T⁻¹]; p·x₀=x; primitive coefficient valuation 0 | Agrees | Normalize before duality |
| Full evaluation dual | x=p[T⁻¹] | evaluation on x has image pℤ_p; on x₀ it has image ℤ_p | Old identification fails | Use the primitive generator |
| Upper ramification bound | p=2; x=2[T⁻¹]; r=1,2,3 | normalized bounds 0,1,2; groups ℤ₂,2ℤ₂,4ℤ₂ | Agrees with pole-one tower | Subtract n₀ |
| Upper ramification bound at p=3 | x=3[T⁻¹]; r=1,3,4 | normalized bounds 0,1,2; groups ℤ₃,3ℤ₃,9ℤ₃ | Agrees | Same formula at odd p |
| Finite-layer shift | x=p[T⁻¹]; n=1,2,3 | degrees 1,p,p²; conductor exponents 0,2,p+1; at p=2: 0,2,3, at p=3: 0,2,4 | Agrees | Use length n−n₀ only for n>n₀ |
| Zero class | x=0, n=1,2 | extension degrees 1,1; conductors 0,0; all positive groups 0 | No ∞−∞ expression | Separate zero before normalization |
| Constant-only class | x=p²β; n=2,3 | unramified degrees 1,p; positive bound ∞; positive groups 0 | Agrees | State empty-pole minimum explicitly |
| Clamp independent of primitivity | p=2, x=β+2[T⁻³], r=1 | n₀=0; clamped bound 1 and inertia 2ℤ₂; unclamped bound 0 would give ℤ₂ | Old unclamped model excluded | Retain clamp |
| Formal homomorphism supplier | additive identity and multiplicative doubling | identity gives X+Y on both sides; doubling on multiplicative law is 2X+X²; at X=Y=1, h(F)=15=F(h,h), whereas h=2X gives 6≠8 | Identifies actual law-preserving maps | Cite formal-hom |
| Tangent-compatible action supplier | additive group over 𝔽_p[[π]] | a↦aX has derivative π at a=π; a↦aᵖX has derivative πᵖ≠π; zero action sends 1 to 0≠X | Wrong actions excluded | Cite formal-module with tangent condition |
| Evaluated adic-point supplier | multiplicative group at x=y=3 over ℤ₃; square-zero ε²=0 | formal sum 3+3+9=15; (1+3)²=16=1+15; square-zero sum εa+εb=ε(a+b) | Point law and complete-ring domain agree | Cite adic-points, use union over finite extensions |
| Coefficient-field tame Check | Λ=𝔽₃, inertia scalar −1 | ker(−1−1)={0}; determinant on zero module 1 | True over field | Add coefficient-field hypothesis |
| Finite-ring tame counterexample | Λ=𝔽₃×𝔽₃, scalar (−1,1) | kernel {(0,0),(0,1),(0,2)}; determinant (1,1−T); inverse (1,(1−T)⁻¹) | Refutes unrestricted Check; invariant summand is projective | Add negative control |
| Ray quotient and selected maps | A=𝔽₃,+; θ onto; χ=0,1,2 | character kernels A,{0},{0}; quotient conductor 2[∞]; selected conductors 0,2[∞],2[∞] | Conductors differ precisely as expected | Name both maps and conductors |
| Conductor comparison/maximum | Same three characters | max(0,2,2)=2; faithful character exponent 2 equals quotient exponent; zero character exponent 0≤2 | Both implications agree | Retain quotient maximum theorem |
| Least local unit depth | yᵖ−y=t at ∞ | χ nontrivial on U¹, zero on U²: exponent 2; trivial χ kills U⁰: exponent 0 | Minimality distinguished | State which map kills the units |
| Degree-direction values | ℙ¹, m=0, degree mod r with r=1,2 | quotient sizes 1,2; conductor 0 in both cases; zero selected character has value 1 even if θ(a)≠0 | Local restrictions cannot recover degree value | Separate θ(a) and χ(θ(a)) |
| Oscillator adapter rank and parity | n=1, j=0,1 | m=1,3; m/2=1/2,3/2=j+n/2; ηᵐ=η in both; η²ⁿ=1 | Fits supplied splitting and induction | Name local adapter |
| Adapter Levi covariance | split/inert, n=1, j=0,1 | split at m(π,1): q^(−1/2),q^(−3/2); inert at m(π): χ(π)q⁻¹,χ(π)q⁻³ | Both use normalized F′-absolute value | State exact factor |
| Left unipotent invariance | evaluation at x=0; any b | phase ψ(tr(b·0))=1; Φ(n(b)g)=Φ(g) | Agrees | State adapter law |
| Adapter linearity and identity | Schwartz inputs 0, indicator, twice indicator | identity values 0,1,2; evaluation of a sum gives 1+1=2 | Zero section excluded by normalization | State identity value and linearity |
| Hyperspecial/Fourier normalization | self-dual O-lattice, conductor-zero ψ | Fourier at 0 equals vol(O)=1; annihilator is O; indicator fixed; Φ(k)=1 | No unrecorded Weil scalar | State sign and self-dual lattice convention |
| Nonunitary split extension | χ₀=absolute value; n=1 at m(π,1) | unitary part 1; group twist absolute determinant gives q⁻¹; total q^(−m/2−1)=χ(det a)abs(det a)^(m/2) | Valid without nonunitary unitary splitting | Retain split generality by twisting |
| Finite Fourier Gram-count normalization | split q=3, n=m=1, N=1,2,3 | counts 2,6,18; divide by 3,9,27: 2/3 each; volume factors 3ᴺ·count/3²ᴺ give the same values | Agrees with 1−q⁻¹ | Name Gram-count limit |
| Inert finite Gram counts | q=3, n=m=1, N=1,2 | norm-one counts 4,12; quotients 4/3,12/9=4/3 | Agrees with 1+q⁻¹ | Add inert witness |
| Whittaker/density comparison | self-dual unit lines at s=0 | split: L₁(0)⁻¹·1=2/3; inert: L₁(0)⁻¹·1=4/3; equal to Gram limits | Agrees | Make intermediate route explicit |
| Rank-zero adapter/count normalization | n=0, any j | unique empty matrix; count 1, exponent n(2m−n)=0, normalized count 1 | No empty-product defect | General adapter includes rank zero |
| Inert residue-count supplier | 𝔽₄/𝔽₂, q-power involution | norms of 0,1,u,u+1: 0,1,1,1; norm-one fibre size 3=q+1 | Correct at characteristic two | Cite Geometry §3.1 |
| Linking orthogonal-length identity | Q cyclic length 2; N=0 and unique length-one submodule | lengths 0+2=2 and 1+1=2 | Agrees | State duality input to reciprocity |
| Finite-sum reciprocity | Q=0 and cyclic length 1 | S=1 and 1−T; reciprocal sides 1 and (−T)(1−T⁻¹)=1−T | Both sides match | Name independent reciprocity target |
| Finite-sum reciprocity | Cyclic length 2 | S=(1−T)+T²=1−T+T²; T²S(T⁻¹)=1−T+T² | Both sides match | Add length-two Check |
| Reciprocity beyond cyclic length 2 | Cyclic lengths 3,4 | S=1−T+T²−T³ and 1−T+T²−T³+T⁴; (−T)ᵈS(T⁻¹) has identical coefficients | Parity and exact degree agree | Test odd/even degrees |
| Hermitian-plane isotropic counts | 𝔽₄/𝔽₂, diagonal unit plane | isotropic lines (1,1),(1,u),(1,u+1): 3; S=(1−T)(1+2T)+3T²=1+T+T² | Reciprocal T²S(T⁻¹)=1+T+T² | Add noncyclic q=2 Check |
| Constant/leading coefficients and degree | Q lengths 0,1,2 and plane | coefficient pairs (1,1),(1,−1),(1,1),(1,1); degrees 0,1,2,2 | Sign (−1)ᵈ and degree d agree | Derive only after reciprocity |

### Elaborated-signature audit

A single scratch module containing the finished Suggested.lean and `#check @name` for each of its 18 declarations was elaborated successfully. Every type was compared with its README statement, and a whitespace-normalized comparison with the supplied signature extraction found all 18 types identical: no hypothesis was lost and no signature needed repair. The only Lean edit is the module docstring's explicit missing-carrier explanation for Lubin–Tate torsion.

| Declaration | README/signature hypotheses and computed instance | Result |
| --- | --- | --- |
| exists_divisor_degree_eq_one | Finite k, intrinsic function field and exact constants all retained; on ℙ¹ the infinity divisor has degree 1 | Agrees |
| riemannRoch_reducedBasis | Rational-field algebra, scalar tower, finite dimension and chosen generator retained; rank-one rational example has d=0 and shifted dimensions 0,1,3 at r=−1,0,2 | Agrees; no extra separability or exactness imposed |
| artinSchreierWitt | Prime p and CharP retained; over 𝔽_p, Frobenius−id=0; over 𝔽_p(t), [t] maps to [tᵖ]−[t] | Agrees |
| aswQuotient | Prime and CharP retained; n=0 quotient is 0; over 𝔽_p, lengths 1,2 have p,p² classes | Agrees |
| witt_additiveHilbert90 | Finite-dimensional cyclic Galois extension and generator retained; 𝔽₄/𝔽₂ at n=1 has trace values 0,0,1,1 and both trace kernel and difference image {0,1}; n=0 gives zero groups | Agrees |
| artinSchreierWitt_galois | Prime, characteristic and n retained; over 𝔽_p the quotient and Frobenius-character choices each have pⁿ elements, including 1 at n=0 | Agrees |
| localAbelianExistence_laurentSeries | Finite field, openness and finite index retained; H=Kˣ gives degree/index 1, H=ord⁻¹(2ℤ) gives the unramified degree/index 2 | Agrees |
| effectiveDivisorCount | Total native Nat.card definition; finite/exact function-field hypotheses imposed on theorems; for ℙ¹/𝔽₂, A₀,A₁,A₂=1,3,7 | Agrees |
| zeta | Same fields/algebra as definition; on ℙ¹/𝔽₂ first coefficients 1,3,7 | Agrees |
| placeCount | Same fields/algebra as definition; on ℙ¹/𝔽₂ degrees 0,1,2 have 0,3,1 places | Agrees |
| pointCount | Same fields/algebra as definition; N₀=0 from empty divisors of 0; N₁=3, N₂=3+2·1=5 | Agrees |
| zeta_eulerProduct | Finiteness, intrinsic function field and exact constants retained; coefficient T² on ℙ¹/𝔽₂ is 6 degree-one multisets +1 degree-two place=7=A₂ | Agrees |
| zeta_logDeriv | Same hypotheses plus r>0 retained; r=1 gives 3=3; r=2 gives 2·7=3·3+5·1=14 | Agrees |
| effectiveDivisorCount_of_large | Explicit 2g≤n+1 retained; g=0,q=2,n=0 gives 1=2−1; n=2 gives 7=8−1 | Agrees; no natural-subtraction underflow |
| zeta_rationality | Finite/exact function field retained; ℙ¹/𝔽₂ has P=1 and coefficient 0=3−3; elliptic example over 𝔽₅ has P=1+3T+5T², P(1)=9, leading coefficient 5 | Agrees |
| IsLPolynomialData | Pure integer-polynomial data, without phantom field hypotheses; q=5,g=1,N₁=9 gives a₁=3,a₂=5; g=0 forces P=1 | Agrees |
| IsLPolynomialData.unique | Both explicit data hypotheses retained; in preceding genus-one example both candidates have coefficients (1,3,5); at q=0,g=1,N₁=1 both are P=1 | Agrees even at total-parameter junk values |
| lPolynomial_isLPolynomialData | Finite/exact function field and actual numerator identity retained; elliptic polynomial has a₁=9−5−1=3 and a₂=5·1 | Agrees |

### Build and gate

Commit: `723c0b781c72832635a721181e86f7d3b8d62a6f` — `FunctionFieldArithmetic: review repairs (ramification, conductors, local density interfaces)`. Only the two authorized roadmap files were committed; the worktree is clean and nothing was pushed.

`lake build TauCetiRoadmap.FunctionFieldArithmetic.Suggested` exited 0 with 11 expected admitted-theorem warnings and the exact completion line:

```text
Build completed successfully (9028 jobs).
```

The dependency-direction command exited 0, with no UPWARD, CYCLE or moved line:

```text
depcheck: 33 roadmaps, 311 edges, 0 problem(s)
```

The final gate exited 0 after the commit; exact summary:

```text
gate FunctionFieldArithmetic: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
