# Review of EndoscopicTransferAndUnitaryTraceComparisonPartII (pull request #2256 at b6cbd63)

**Verdict:** accepted

## Verified sound

| Statement | Instances tried | Computed left side | Computed right side / negative control | Result |
|---|---|---|---|---|
| Conventions: signed blocks | n=1; X=1 | δ²=−I; r₁=r₂=−1 | Unsigned block: δ²=I; r₁=1 | Distinguished |
| Conventions: absolute values, measures | q=2; torus volume doubled | q_E=4; |π|_E=1/4; orbital value=1/2 | q²=4; q⁻²=1/4; 1/2 | Equal |
| Hermitian classification contract | Rank 0; rank 1; split E | 1 class; 2 norm classes; 1 class | Empty determinant=1; norm quotient sizes 2 and 1 | Equal |
| Classification excludes archimedean fields | diag(1,1), diag(−1,−1) over ℂ/ℝ | Both discriminants=1; signatures (2,0),(0,2) | Same dimension/discriminant; not isometric | Excluded |
| Integral orbit and vector contracts | Rank 1; q=2; h(w,w)=1 | Gram π: dual quotient length 1; w⁻¹w=1 | Not self-dual; unitary transport to 1 | Equal |
| Unit-vector projection | q=2; h(w,w)=1 | h(w,v−wh(w,v))=0 | h(w,v)−1·h(w,v)=0 | No division by 2 |
| 0.1 Adjoint between unequal forms | h₁=1,h₂=π; X=1 | X^τ=π⁻¹; (X^τ)^τ=1 | h₁(1,1)=1=h₂(1,π⁻¹) | Equal |
| 0.1 Split action and equivariance | (A,B)=(1,1); (g,h)=(2,1) | (A′,B′)=(2,1/2); A′B′=1 | AB=1; wrong action gives 4 | Distinguished |
| 0.2 Contractions and characteristic polynomials | X=diag(1,π) | r₁=r₂=diag(−1,−π²) | Both charpolys=(T+1)(T+π²) | Equal |
| 0.2 Zero and split singular maps | X=0; split X=(1,0) | r₁=r₂=0 in both cases | −XX^τ=−X^τX=0 | Equal |
| 0.3 Quotient versus rational orbits | Split rank 1: (0,1),(1,0) | Both quotient values=0; distinct orbits | Section (−Z,1) has quotient Z | Both directions tested |
| 0.3 Full characteristic quotient | Z=diag(1,π) | Trace=1+π; determinant=π | charpoly=T²−(1+π)T+π | Both invariants retained |
| 0.4 Regularity; Leslie25 line 621 | Split A=diag(1,0), B=I | charpoly δ=T²(T²+1); not regular semisimple | r₁=diag(−1,0); determinant=0 | Equivalent failure |
| 0.4 Positive regularity control | X=diag(1,π), standard forms | charpoly δ=(T²+1)(T²+π²) | charpoly r₁ at T² gives identical polynomial | Equal |
| 0.5 Torsor image | Unramified rank 1: y=−1,−π | Norm valuations: 0 allowed, 1 forbidden | Fibre nonempty, empty respectively | Rational non-surjectivity retained |
| 0.5 Stabilizer and empty cohomology product | Rank 1; S₁ empty | t↦(t,t)↦t; kernel cardinality=1 | Identity; empty product cardinality=1 | Equal |
| 0.6 Local lift and cutoff | vol(J)=2; h=1; rank-one unit orbit | ∫(1_J/2)=1; cutoff=1_(O_E×) | Desired h=1; fibre integral=1_(O_F×) | Equal |
| 0.7 Orbital integral scaling and linearity | Rank 1 unit; c₁=3,c₂=1,c_T=2 | Rescaled value=3/2; RO(2f)=2RO(f) | c₁c₂/c_T=3/2; original RO(f)=1 | Equal |
| 0.8 Pushforward and support | Rank 1 lattice unit; valuation −2,0,1,2 | Values (0,1,0,1) | Integral norm valuations: nonnegative even only | Equal |
| 0.8 Extension on all invertible matrices | n=2; −I and nearby regular integral Gram matrices | Fibre values (1,1) | Regular-locus zero extension gives (0,1) | Wrong extension excluded |
| 0.9 Orbital equality; Leslie25 line 657 | Rank 1; X=π⁻¹,1,π | Relative values (0,1,1) | Contracted values (0,1,1) | Equal |
| 0.9 Stable and weighted compatibility | Two orbital values 2,5; weights 1,−1 | Relative stable=7; weighted=−3 | Contracted stable=7; weighted=−3 | Equal |
| 1.1 Relative data | a=b=1; field versus split algebra | Field: 2·2=4 form labels | Split centre dimensions: 2>1; no proper elliptic datum | Correct domains |
| 1.2 Pullback factor; Leslie25 line 777 | a=b=1; D=π; q=2 | η(D)|D|=−1/2 | Pulled-back relative factor=−1/2 | Equal |
| 1.2 Matching and source regularity | Block eigenvalues (1,1) | Product charpoly=(T−1)² | Discriminant=0; no regular source match | Excluded |
| 1.3 Stable sum, character sum, basepoint | Orbital values (2,5); weights (1,−1) | Stable=7; weighted=−3; swapped=3 | κ(basepoint)⁻¹·(−3)=(−1)·(−3)=3 | Equal |
| 1.4 Transfer relation | Reference target (1,1), lattice tests | Target stable value=1; no regular source | Unrestricted unmatched-zero would demand 0 | Source-regular restriction excludes it |
| 1.5 Invertible-support transfer | Rank 1; unit indicator; fibre volume 2 | Support O_E× compact; lift coefficient=1/2 | Integral of lift=1; full O_E contains 0 | Domain distinguished |
| 2.1 Full spherical module | n=1; j=−1,0,1; n=0 | All three e_j nonzero; rank-zero module dimension=1 | Cyclic indices=2ℤ; module rank=2¹; 2⁰=1 | Full module retained |
| 2.1 Hecke action | Rank 1; d=−1,1; j=1 | Images e_−1,e_3 | j+2d=−1,3 | Equal |
| 2.2 Base-change/Levi square | a=b=1; q=2; variable Z₁ | ξ_F(T₁²)=(2⁻¹/²X)²=X²/2 | BC(ξ_E(Z₁))=BC(X_E/2)=X²/2 | Equal |
| 2.2 Base-change support | n=2; q=2,3 | BC(T₁₀)=T₂₀−T₁₁; T₂₀−2T₁₁ | Satake: q(T₁²+T₂²) in each case | Odd-entry support necessary |
| 2.3 Headline Fourier isomorphism | Rank 1; j=−1,0,1 | ê_j=(−1)^jU^j; dictionary U↦−T gives T^j | Satake(H₁(e_j))=T^j; inverse returns e_j | Equal |
| 2.3 Rank-two normalization | e₁₀,e₁₁; q=2 | ê₁₀=√2(U₁+U₂); ê₁₁=−U₁U₂ | H₂(e₁₀)=−T₁₀; H₂(e₁₁)=−T₁₁ | Sign fixed |
| 2.3 Cyclic normalization | e₂₀+(q+1)e₁₁ | Fourier=q(U₁²+U₂²) | Satake(BC(T₁₀,E))=q(T₁²+T₂²) | Equal |
| 3.1 Orbit torsor and characters | r=0,1,2; ζ=(ε,1) | Cardinalities 1,2,4; κ_{1}(ζ)=1 | 2^r=1,2,4; κ_{2}(ζ)=−1 | Complement convention distinguished |
| 3.2 Regularization | Unramified rank 1; tests 1_units,1_πunits,1_O | Raw values 1,−1,1/2 | 1,η(π),(1+q⁰)⁻¹ | Equal |
| 3.2 Covariance | Rank 1; surviving vector scaled by π | G(πv)=−G(v); unit-ball value −1/2 | η(π)G(v)=−1·1/2 | Equal |
| 3.2 Split-factor representative independence | Mixed split/nonsplit torus; diag(3,3,1) | Retaining split vector gives values 1 and 0 | Zero split components give identical values on both representatives | Wrong model excluded |
| 3.3 Germ inversion | Rank 1; orbital vector (1,0) | ωG=1/2; scaled vector: (−1)(−1/2)=1/2 | 2⁻¹(1+0)=1/2 | Equal |
| 3.3 Character orthogonality | r=0,1,2 | HHᵗ=I,2I,4I | Inverse coefficients=1,1/2,1/4 | Equal |
| 3.4 Additive descent | a=b=1; m₁=π; q=2 | Jacobian of u=πu′ is 1/2 | |det m₁|^b=1/2 | Equal |
| 3.4 Test and vector factors | Integral matrix unit; integral/nonintegral vector | Descended values 1,0 | Block lattice indicator values 1,0 | Equal |
| 3.5 Ordered cyclic determinant | x_a=0,x_b=1; v=(1,1) | det[v,xv]=1; D_ab=−1 | (−1)^(ab)D_ab=1 | Equal |
| 3.5 Ramified character control | E=ℚ₃(√3); same cyclic data | η(det)=1; η(D_ab)=−1 | η((−1)D_ab)=1 | Missing sign refuted |
| 3.5 Descent Jacobian | D=π; q=2 | Inverse Sylvester Jacobian=2 | |D|⁻¹=2; transfer factor=−1/2 | Reciprocal directions fixed |
| 3.6 All-rank augmented reduction | a=b=1; r_a=r_b=1 | Germ coefficient 2⁻²=1/4 | Block coefficients (1/2)(1/2)=1/4 | Equal |
| 3.6 Four-form spherical specialization | Reference/reference unit; other form components | Orbital components (1,0,0,0) | Signed sum=1 regardless of zero-component signs | Equal |
| 3.7 Sum-space Weil action | Two decompositions differ by h in intersection | ρ(h)−ρ(h)=0 | Result independent of decomposition: difference 0 | Equal |
| 3.7 Fourier pairing | u=w=1; test additivity in u | Tr(2)=4=Tr(1)+Tr(1) | N(2)=4≠N(1)+N(1)=2 | Trace distinguished |
| 3.8 Weil reduction | q=2; norm-one vector; ψ conductor O_F | Unit projection has norm 1; ψ(π⁻¹·πa)=1 | No division by 2; required upper-unipotent action=1 | Equal |
| 3.8 Unipotent generation | diag(π⁻¹,π) conjugating upper unipotents | Parameter π becomes π⁻¹ | π⁻²·π=π⁻¹ | Equal |
| 4.1 Signed versus unsigned lattice map | N(c)=−1; unramified q=2 | r₋(c)=1 | r₊(1)=1 | Equal |
| 4.1 Ramified negative control | E=ℚ₃(√3) | η(−1)=−1; no norm c | Unramified norm-unit hypothesis fails | Excluded |
| 4.2 Cyclic embedding; Leslie25 line 1258 | Rank 1; φ=1_π^dO_E×; d=−1,1 | Pushforward=e_−2,e_2 | φ∗e₀=e_−2,e_2; odd strata 0 | Equal |
| 4.3 Product-group contraction | m=0; φ=1_πO_E× | Product contraction=φ; Hermitian contraction=e₂ | BC(φ)=1_π²O_F×; Ω=1 | Matching values 1 |
| 4.4 Headline adjacent-rank comparison | n=1; φ=1_πO_E× | Linear values: 1 at π², 0 at π | Unitary values: 1 at π², 0 at π; other form 0 | Equal |
| 4.5 Augmented comparison | Rank 1 unit; reference/nonreference forms | Normalized regular orbital values (1,0) | Linear matching values (1,0); raw germ=1/2 | Normalizations separated |
| 4.6 Headline cyclic fundamental lemma | n=2; φ=c₂,₁ | Levi cyclic image=e₂⊗e₀+e₀⊗e₂ | Graded target Φ₁,₂⊗Φ₁,₀+Φ₁,₀⊗Φ₁,₂ equals same | Equal |
| 4.6 Unit and domain controls | φ=1_K; rank-one odd basis vector | Unit images e₀ and e₀⊗e₀ | e₁ has odd degree, outside cyclic image | Unwarranted extension excluded |
| 4.7 Determinant grades | n=1; grades −2,0,1,2; n=0 | Values 0,1,0,1; rank-zero count=1 | Norm integrality and parity give 0,1,0,1; empty density=1 | Equal |
| 4.7 Overlattice coefficient | n=2; q=2,3; grade 2 | Isotropic vectors 9,32; lines 3,4 | q+1=3,4; Φ₂,₂=e₂₀+(q+1)e₁₁ | Equal |
| 4.7 Density denominator | n=2; q=2,3 | Self-densities 9/8,32/27 | (1+q⁻¹)(1−q⁻²)=9/8,32/27≠0 | No zero division |
| 4.8 Degree identities | n=2,a=b=1; d=1,2 | ξ_E(qh₁)=X+Y; ξ_E(q²h₂)=X²+XY+Y² | h₁(X,Y),h₂(X,Y) give identical polynomials | Equal |
| 4.9 Compact graded equivalence | n=2; determinant degree 6 | Exactly Φ₂,₆ contributes | Only i+j=3 in target degree sum | Finite evaluation |
| 4.9 Form-label controls | Rank-one labels (π,1) and (π,π) | First determinant parity odd; second even | Target unit value 0 in both nonreference cases | All labels necessary |
| 4.10 Headline Friedberg–Jacquet unit theorem | a=b=1; q=2; D=π; reference forms | Target unit value 1 | Lattice counts 1,3 give κ=1−3=−2; Δκ=1 | Equal |
| 4.10 Unmatched and colliding controls | Four form labels; colliding eigenvalues | Unit targets (1,0,0,0); collision gives 1 | Zero on nonreference labels; collision outside source-regular locus | Correct restrictions |
| 5.1 Headline full Fourier Levi operator | n=2,a=b=1; q=2; e₁₀,e₁₁,e₂₂ | Images −(e₁⊗e₀+e₀⊗e₁), −e₁⊗e₁/2, e₂⊗e₂/4 | Transported Satake images −(X+Y), −XY/2, X²Y²/4 | Equal |
| 5.1 Unit, multiplicativity, sign convention | Unit; central square; simultaneous dictionary change | ξ_X(e₀)=e₀⊗e₀; central square coefficient=1/4 | (1/2)²=1/4; simultaneous signs cancel; mixed signs reverse e₁₀ | Distinguished |

- Sources: 15/15 seeded targets and all 5 headline locators checked against 5 readable texts, including Hironaka99 printed pp. 566 and 571; 0 unresolved source requests.
- Library: 16 consumed declarations opened at the pins, including Mathlib/LinearAlgebra/Matrix/Hermitian.lean:45,286,290; Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:140,279; Mathlib/Analysis/Calculus/Implicit.lean:321,465; TauCeti/Analysis/Analytic/Inverse.lean:131; TauCeti/NumberTheory/LocalField/Norm/Unramified/Basic.lean:126,158.
- Ownership: all 8 roadmap-supplier subsections and all 36 Needs lines resolved; 7/7 gap slugs agree with packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/design/plan.json. Acceptance retains those declared supplier contracts, including the dyadic product-group comparison.
- Dependencies: `depcheck: 211 roadmaps, 1914 edges, 0 problem(s)`; 0 UPWARD or CYCLE lines.
- Gate: every worker check passed at b6cbd63, including the targeted build; 0 outside-folder paths, 0 forbidden imports, 0 sorry'd data, 0 statement-hygiene hits.
- Lean: direct `lake env lean` elaboration succeeded without warnings; 0 declarations require signature or one-tactic probes; all 5 unstatable headlines and their missing carriers are named in the module docstring.
- Shape and change: 36 target subsections and 6 layer dependency summaries read; the PR adds 3 files and 970 lines, removes 0 headings/declarations, and describes a new Part II.

Overlap check: read GanGrossPrasadUnitaryGroups, EndoscopicTransferAndUnitaryTraceComparison, AutomorphicLFunctionsAndLocalFactorsPartII, MetaplecticAutomorphicForms and FunctionFieldArithmetic. Ordinary unitary endoscopy and the shared Jacquet–Rallis contracts belong to EndoscopicTransferAndUnitaryTraceComparison; Weil operators and the split carrier belong to MetaplecticAutomorphicForms; Hermitian carriers and densities belong to GeometryOfNumbersAndQuadraticArithmetic; Satake and parabolic descent belong to SmoothRepresentationsOfLocalGroups. This roadmap owns symmetric-space contraction, relative transfer and the Hermitian spherical adapters. Its normalized GL_n base-change construction specifies the map used, but not constructed, in EndoscopicTransferAndUnitaryTraceComparison §4.9(b). No duplicate owner or conflicting revision found.

Source independence: 23 passages compared with 5 sources, no copied expression found; largest share Leslie25, 65 of 91 source-labelled citation occurrences before References. Contents compared with Leslie25: independent. Layers 0–1 split its symmetric-space section; Layer 3 combines germs and Weil reduction; Layer 4 places its initial reduction after spherical comparison. The dependencies §0.9→§1.4, §§2.2/3.6/4.4→§4.6→§§4.8–4.10 and §2.3→§5.1 determine the order.

## Not verifiable

- none

## Source issues

- **Misprint** in Leslie25 at Lemma 1.8, printed p. 12, line 479: the source says the centralizer is in U(W); it should use V, the space containing δ; affects nothing.
- **Misprint** in Leslie25 at §2.2.3 after Remark 2.8, printed p. 19, line 785: the source says η is the embedding symbol in this display; it should retain ξ and reserve η for the quadratic character; affects nothing.
- **Misprint** in Leslie25 at §3 introduction, printed p. 22, line 897: the source says the reduction follows from an unresolved proposition reference; it should reference Proposition 3.12, pp. 30–31; affects nothing.
- **Misprint** in Leslie25 at §4.1.2, printed p. 32, line 1423: the source says the Hermitian invariant uses powers of x; it should use y in h(w,yⁱw); affects nothing.
- **Misprint** in Leslie25 at §4.1.4, printed p. 33, line 1476: the source says the Hermitian embedding's upper-left block is x; it should be y; affects nothing.
- **Misprint** in Leslie25 at Remark 4.4, printed p. 35, line 1543: the source says the characteristic-zero appendix is by Gordan; it should identify Julia Gordon; affects nothing.
- **Misprint** in Leslie25 at proof of Proposition 4.8, printed p. 38, line 1722: the source says the upper augmented test is φ tensor the vector indicator; it should use its cyclic image φ∗e₀, also after evaluation at zero; affects the proof.
- **Error** in Leslie25 at §5.1, printed p. 40, line 1838: the source says the Hermitian Fourier kernel uses a norm; it should use the trace pairing with self-dual measure and retain the Hermitian matrix variable; affects a stated result.
- **Misprint** in Leslie25 at Lemma 3.1, printed p. 23, line 978: the source says the E-parabolic modulus uses F-absolute values; it should use normalized E-absolute values; affects a stated result.
- **Error** in Leslie25 at proof of Proposition 4.8, printed p. 39, line 1751: the source says base-change support has only even coweight entries; it should allow BC(T₁₀,E)=T₂₀,F−(q−1)T₁₁,F and justify commutation by Satake substitution; affects the proof.
- **Error** in Leslie25 at Theorem 4.7, printed p. 36, line 1626: the source says a raw germ equals an unaveraged character sum; it should multiply that sum by 2⁻ʳ under the stated volume-one normalization; affects a stated result.
- **Error** in Xiao18 at inversion before Theorem 4.7, printed pp. 20–21, line 977: the source says the inverse character sum needs no averaging factor; it should divide by 2ʳ, giving 1/2 for the rank-one unit germ; affects a stated result.
- **Gap** in Leslie25 at proof of Proposition 4.8, printed p. 38, line 1718: the source says its four-form signs follow from Xiao's construction; it should explain the conversion from Xiao's second-form signs to these two-form parity signs; affects the proof.
- **Gap** in Leslie25 at proof of Proposition 5.2, printed p. 43, line 1960: the source says the comparison defect lies in the intersection of orbital-image spaces; it should act on their sum, using agreement on the intersection for well-definedness; affects the proof.
- **Error** in Xiao18 at proof of Theorem 6.1, printed p. 24, line 1185: the source says the cyclic factor ratio is η(D_ab); it should use η((−1)^(ab)D_ab) with the stated block volume order; affects the proof.
- **Gap** in Leslie25 at Proposition 4.8, printed pp. 37–38, lines 1660 and 1730: the source says the rank-n comparison suffices while its proof invokes block-rank comparisons; it should assume it also at the block ranks used in the proof; affects a stated result.
- **Error** in Leslie25 at §2.3, printed p. 20, line 803: the source says every rank has two form representatives; it should assign one at rank zero; affects a stated result.
- **Gap** in Leslie25 at §2.2.3 and Definition 2.10, printed pp. 19 and 21, lines 793 and 848: the source says every unmatched regular target has zero stable orbital integral; it should restrict to source-regular targets, excluding the colliding unit pair with stable value 1; affects a stated result.
- **Gap** in Leslie25 at Lemma 10.6 and Theorem 11.1, printed pp. 76 and 78, lines 3618 and 3696: the source says the normalized spherical period equals one at the place under consideration; it should supply the dyadic evaluation or its cancellation, since Lemma 8.6 assumes odd residue characteristic; affects the proof.
- **Error** in Leslie19 at proof of Lemma 3.9, printed p. 13, line 633: the source says the kernel has size 2^(|S₁|−1), including empty S₁; it should give size 1 in that case; affects the proof.
- **Error** in Leslie19 at measure paragraph after Lemma 2.1, printed p. 6, line 284: the source says the maximal compact subgroup comprises the centre and nonsplit factors; it should include every O_(F_i)× factor; affects a stated result.
- **Error** in Leslie25 at §3.3, printed p. 28, line 1187: the source says zero extension of the regular-locus pushforward is locally constant; it should define fibre integration on the whole invertible locus, including −I₂ where the integral equals 1; affects a stated result.

## For the human reviewers

- none
