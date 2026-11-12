<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13150#issuecomment-6785266553 -->
Review (codex) of 8c6e51a

Verdict: needs_changes

1. **F01** (P3) Two targets lack their own dependency lines

   **Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:428, “The normalized coefficient datum”, and line 543, “Holonomic coefficients on the level stacks”.

   **Claim:** Each target must list its statement and proof-route prerequisites in a `*Needs:*` line. These two targets list prerequisites in prose or at layer level instead.

   **Witness:** Of 65 numbered subsection blocks, 63 contain `*Needs:*`. Blocks beginning at lines 428 and 543 do not; their next subsections begin at lines 461 and 575.

   **Exact repair:** Add a target-level dependency line to §0.1 naming Mathlib `AddChar`, `Algebra.trace`, `FiniteField.algebraMap_trace_eq_sum_pow`, `IsDiscreteValuationRing`, and PadicDifferentialEquationsAndRigidCohomology §§RD.6.46–RD.6.48. Add one to §1.1 naming §0.3, GlobalShtukasAndFunctionFieldLanglands §§0.1 and 1.4, SpringerResolutionAndCharacteristicCycles Layer 9, gap:relative-level-geometry and gap:arithmetic-d-module-operations. These are the prerequisites already described there; no new supplier is needed. Repeating the subsection test after these two insertions gives 65 of 65. The mathematical checks below do not require changing either statement.

One P3 documentation finding; no P1 or P2 findings. All four findings of round 3 are repaired. The package inputs were reviewed without modification. The seven settled uncertified references remain uncertified; this report does not reopen them.

## Verified sound

### Previous findings, checked before the new review

| Previous finding | Status | Repaired passage and independent verification |
| --- | --- | --- |
| F01, lower ramification under central lifting | Repaired | README §6.5, lines 1444–1495, distinguishes the adjoint parameter and states “`D₁ = D_c` and `D_{c+1} = 1`”. GR line 1173 restricts its theorem's setting to adjoint type; GR line 1302 starts Proposition 5.6. The central-lift calculation below verifies the new stronger description, not merely deletion of the old assertion. The Swan lower bound now includes `p ∤ |W_H|`. |
| F02, missing convolution shift | Repaired | README §9.4, lines 1880–1910, uses “`(Be†_{SO₃} ⋆ Be†_{2n−2})[1](1/2)`”, with unshifted compact-support convolution. §11.5 repeats the shift. The new concentration argument gives only degree 1 and rank `2n+1`. Computations at characteristics 3 and 2 below give the corrected signs. |
| F03, unowned general toric inputs | Repaired | README lines 325–347 names “`gap:toric-exponential-sum-hodge-bound`” and “`gap:toric-exponential-sum-ordinarity`”, with PadicDifferentialEquationsAndRigidCohomology as supplier. Both occur in `design/plan.json`, §11.2 and Layer 11 dependencies. Their degree, nondegeneracy, normalization, facial criterion and diagonal hypotheses are explicit. Scalar Kloosterman rationality is no longer substituted for these general results. |
| F04, index assertion on all faces | Repaired | README §11.2 distinguishes “codimension-one faces” in the determinant assertion from all faces in the nondegeneracy condition. For `n=1,d=2`, the displayed facet has determinant 2; its primitive vertex has saturated index 1. The new negative control separates them. |

No previous finding was marked not actionable. The repaired patterns were also searched outside their edited paragraphs: adjoint versus central lower numbering in §§6.6 and 11.5; convolution shifts in §§9.4, 11.1 and 11.5; toric ownership in scope, contracts, §11.2 and dependencies; all-face versus facet hypotheses throughout Layer 11. No recurrence of the four defects was found.

### Principles, structure and coverage

Read the complete 65-target README, its 12 layers, all Checks and dependencies, the Lean file, metadata, all 24 manifest entries, the previous review and repair report, the package index, overlap leads, library-match leads and signature leads. The previous round's numerical rows were reused only for unchanged passages; the rows marked inherited below identify that evidence. Changed statements and all 15 seeded source targets were inspected again.

The roadmap retains arbitrary split reductive groups and all residue characteristics. The prime-to-Weyl-order condition belongs to the stated Gross–Reeder classification, not to the construction or final monodromy and ordinarity headlines. Small-characteristic branches are targets, including characteristic two. The definitions use mathematical constructions; no computational algorithm or executable certification is proposed. The organization is driven by eigenobjects, comparison, Frobenius, monodromy, explicit realizations and ordinarity. It does not claim to follow a source's chapter order. The deferred exceptional branch in §6.4 explicitly continues in §§10.6 and 11.4; the earlier nonexceptional orthogonal result used in §10.6 does not depend on that branch.

All layers have Examples and Dependencies. Definitions have API statements and at least three Checks, including separate controls for the supporting definitions grouped in §11.1. Exact hypotheses are supplied by the target and the conventions; in particular, finite-field cardinalities cannot be 1, primes cannot be 0 or 1, coefficient fields exclude the zero ring, divisions in tuple sums are by units, and ordinary statements exclude the unintended `n=0` total-function value. Genericity includes the empty torus case. No `set_option`, sorry'd data, admitted example, `lemma`, forbidden import, invented library declaration or implementation quota was found. R01 is the remaining target-level shape omission.

Every actual Lean declaration is mentioned by the README. The backticked declaration names attributed to this file resolve to its six definitions and five theorems; symbolic formulas and category notation are not claimed Lean declarations. No process narrative, pull-request number or machine path was found in the roadmap text. Source passages are paraphrased with mathematical formulas and locators, rather than copied exposition. Metadata and source records parse.

### Seeded source verification

Locators below refer to the supplied line-numbered legal extractions. Printed page numbers were checked against their page markers. Where the roadmap corrects a source rather than repeating it, the correction was evaluated separately. The seven manifest entries marked uncertified were not fetched again.

| Target | Text and locator checked | Result and scope |
| --- | --- | --- |
| 1.1 Holonomic coefficients on the level stacks | XZ line 615 onward, §§2.3–2.5, pp. 13–19; AC line 817, Proposition 1.3.13(i); XZ line 908, §2.6, p. 19 | The source categories, operations and exactness directions agree. AC's complete c-affine/frame hypotheses are retained, with stack extension assigned to the declared operations contract. Weight bounds are in XZ §2.6.3 immediately before Theorem 2.6.4; the README cites §2.6 as well. Smooth and proper base change are not conflated. R01 concerns only the missing dependency line. |
| 2.1 Frenkel–Gross connection | FG line 346, §5, pp. 8–9; XZ line 2154, §4.3.1, pp. 46–47 | Principal nilpotent residue, highest-root term, Coxeter slope and the parameter convention agree. Products and the torus are treated separately. |
| 2.3 Bessel oper slice | Zhu line 978, Lemma 20, p. 22; XZ §4.3.5, pp. 48–49 | One affine parameter for an almost-simple adjoint dual, with the specified residue at zero and slope bound at infinity. The tame origin is included, not claimed generic. |
| 2.4 Critical localization | Zhu line 370, Theorem 8, pp. 8–9; Zhu line 426, Corollary 9, p. 10; BD line 6941, §5.5, pp. 224–225; BD line 8690, §7.8, pp. 275–276 | The oper eigenvalue and ramified commutative algebras are supported. Flatness is explicitly needed for ordinary tensor specialization; otherwise the construction is derived. Rational critical centres are a declared contract, not inferred from the complex theorem. |
| 2.6 Central descent | XZ line 2277, §4.3.6, p. 49 | Geometric triviality of the finite central torsor is supported. The README separately adds the rational marking that the source argument does not supply. The nonsquare determinant test below prevents an invalid rational conclusion. |
| 3.2 Minuscule comparison | XZ line 1986 through line 2044, §4.2.1 and Lemma 4.2.3, pp. 42–44 | Minuscule smooth geometry, concentration and relative comparison are in the source. The relative-level base change is supplied by the named gap; faithful-flat comparison and tensor propagation retain their hypotheses. |
| 4.1 Bessel F-isocrystal | XZ line 2290, §4.4.1, pp. 49–50 | Frobenius is transported through the de Rham–rigid comparison; central ambiguity acts trivially on this transport. Construction over enlarged normalized coefficient data avoids the square-root problem. |
| 5.2 Cuspidal Newton bound | XZ line 2932, Theorem 5.4.2, p. 62; VL-est line 262, Proposition 2.1, printed p. 461 | Nonzero cuspidal eigenform and finite-order central character are essential. Normalization is at the residue cardinality of the place, with the central component fixed. The general bound is assigned to the explicit supplier gap. |
| 6.1 Bessel monodromy groups | XZ line 2345, §4.5.1, p. 51 | Generated tensor subcategories, chosen fibre functor and the directions of the subgroup inclusions agree. No comparison arrow between different coefficient theories is inserted here. |
| 6.3 Excluding principal PGL₂ | XZ line 2425, Lemma 4.5.5, pp. 52–53 | The formal-slope bound and the two wild-inertia cases support the route. The README corrects the exponent indexing in the source and keeps the small exceptional cases outside this exclusion. Kostant and subgroup classification are separately owned contracts. |
| 6.5 Simple wild parameters | GR line 1170, §5.3, p. 31; GR line 1302, Proposition 5.6, pp. 34–35; GR line 1351, definition, p. 35 | Adjoint context and prime-to-Weyl-order hypothesis were checked. The extension to central lifts uses pinned Herbrand quotient theorems and is verified below. It does not attribute central lower-numbering invariance to GR. |
| 7.6 Companion monodromy | XZ line 2469, Corollary 4.5.6, p. 53; DAd line 65, Theorem 1.2.1, p. 2; DAd line 985, Theorem 4.1.1, p. 23; DAd line 1235, Theorem 4.3.2, p. 29 | The common split reductive group with faithful representation and component-group compatibility supply the comparison. The README replaces the insufficient subgroup-surjection argument in XZ. Semisimplicity, compatibility and coefficient extension are retained. |
| 8.1 Classical scalar realizations | XZ line 2647, §§5.3.1–5.3.2, pp. 57–58 | Standard and symplectic realizations agree after distinguishing the cyclic module from horizontal-coordinate scalar equations. Scalar supplier §2.6 has the same sign dictionary. |
| 10.3 Dwork unit-root lines | XZ line 3076, Appendix A.6 and Corollary A.7, p. 65 | The logarithmic derivative and Frobenius ratio have the stated orientation. The q-power ratio is the telescoping product of p-power ratios; an arbitrary unit-root line is not identified with a Bessel quotient without §10.5. |
| 11.2 Toric hypergeometric slopes | XZ line 2948, Lemma 5.4.3, pp. 62–63, especially line 2994; AS89 Corollary 3.11; Wan04 Theorem 3.1 and Corollary 2.6; Wan93 | XZ explicitly applies the diagonal argument to codimension-one faces. The corrected face list, degree, Hodge numbers and exclusion `p ∣ d` were checked independently. The primary AS/Wan texts remain settled uncertified, so their complete proofs and locators were not certified from text. |

The new convolution proof was additionally checked against Miy line 549, Definition 2.1.1, p. 14, Miy line 580, Proposition 2.1.3, p. 15, and XZ line 701, the constructible-heart convention. The signed Dwork theorem was checked at XZ line 3037, Theorem A.5(i′), pp. 64–65. All works cited in the README are represented among the 24 manifest keys; no new source key or missing-reference request was necessary.

### Adversarial computations

These rows cover the sample, all five statable headlines, the substantive unavailable headlines and every repaired target. “Inherited” means the unchanged statement is covered by computed values in the round-3 table, as permitted by the brief; it is not a fresh execution claim. The repair rows and finite-field, Dwork-coefficient and three-variable Hodge computations were recomputed in this review. Numerical checks are witnesses and negative controls, not claimed proofs of the general theorems.

| Statement | Instances | Values on each side / negative control | Result; change |
| --- | --- | --- | --- |
| 0.1 normalization and twists | `r=2,q=2,a=1`; `q=4,d=2` | Raw sum 1; normalized `−1/√2`, against wrong `1` or `−1/2`. Half twist `1/4`; square `1/16=q^(−2)`. | Distinguishes the conventions. Only R01. |
| 0.2 depth quotient | SL₂, torus, GL₂ over F₂; inherited | Dimensions 2 and 0. `det diag(1+t,1)=1+t` is not a square; `1+t²=(1+t)²`. | Root-depth definition survives bad isogeny characteristic. |
| 0.3 components and big cell | SL₂ and PGL₂; inherited | SL₂ big-cell dimension 2; component-group orders 1 and 2 respectively. | Does not identify all components with one neutral bundle. |
| 1.1 exactness/duality | Constant object on punctured A¹; point Tate object | Boundary cone of `j_!→j_+` is nonzero; `K(−1/2)` has weight 1, dual weight −1, not +1. | Three operations are not formal equalities. Only R01. |
| 1.2 ULA and hyperbolic localization | Zero-point inclusion; A² weights `(1,−1)` and `(1,1)`; inherited | Constant vanishing cycles 0; `j_!K` boundary cycles nonzero. Comparison terms both `K[−2](−1)`, respectively both `K[−4](−2)`. | Includes nonsmooth base-change maps between smooth bases. |
| 1.3–1.6 Satake and eigenobject | PGL₂ minuscule P¹, SL₂ standard, torus; inherited | Cohomology dimensions `1+1=2`; normalized eigenvalues `q^(−1/2),q^(1/2)`. Tensor rank `2·2=4`, unit rank 1; ordinary fibre `K[2]` becomes degree 0 after normalization. | Exact tensor and shift conventions agree. |
| 1.7–1.8 tame variant and traces | Order-four character over F₅; two rank-two spectra; inherited | Exponent `1/4` gives order 4, integral exponent gives order 1. Spectra `{1,3}` and `{2,2}` have trace 4 but square traces 10 and 8, determinants 3 and 4. | Rational exponents and traces of every power are needed. |
| 2.1–2.2 FG parameter | SL₂×SL₃, λ=2; torus; inherited | Factor scales 4 and 8; tensor rank 6. Torus connection matrix 0. | No single common Coxeter exponent imposed on a product. |
| 2.3 oper slice | PGL₂ tame/generic points | Parameter-space dimension 1. At parameter 0 slope 0; nonzero parameter slope 1/2. | Origin included; changed residue excluded by definition. |
| 2.4–2.5 flat localization | `A=K[t]`, module and specialization `A/(t)`; inherited | Derived specialization has `Tor₀=K` and `Tor₁=K`; underived one has only `K`. For the PGL₂ level slice, invariant polynomial generators = 1. | Flatness cannot be suppressed. |
| 2.6 central descent | `P=diag(a,1)` with nonsquare a, then `a=b²` | `det(cP)=c²a`: no rational solution to determinant 1 in first case; `c=b⁻¹` gives 1 in second. | Rational marking excludes constant nontrivial torsor. |
| 2.7 and 8.1 scalar sign | Rank 3, λ=1; inherited | For `f=1+x+x²/8+…`, coefficient of x in `(δ³−x)f` is 0; in `(δ³+x)f` it is 2. Horizontal solution begins `1−x+x²/8`. | Cyclic and horizontal conventions agree with scalar supplier §2.6. |
| 2.8 differential group and rigidity | B₃ and D₄; inherited | Exceptional G₂ dimension 14, ambient B₃ dimension 21; triality fixed dimension 14 versus D₄ dimension 28. Adjoint Euler expression `1−1−0=0`. | Fixed-group and rigidity conclusions distinguished. |
| 2.9 covariance | Rank-one parameter; inherited | Correct transformed invariant `a b₁b₀`, incorrect double rotation `a²b₁b₀`; successive scalings a,b multiply to ab. | Pullback direction consistent. |
| 3.1–3.2 relative minuscule comparison | PGL₂ minuscule representation; identity base change; inherited | Rank 2 on each side; cohomology in other relevant degrees 0; identity comparison matrix 1. | The relative contract, rather than a finite-field-only atlas, is used. |
| 3.3–3.5 faithful comparison | Punctured two-dimensional affine cone; E₈; inherited | Removing vertex preserves coordinate ring but removes a point, so its affinization is not itself. E₈ nontrivial minuscule representations = 0, adjoint dimension = 248. | Quasi-minuscule argument and adjoint convergence cannot be skipped. |
| 4.1 construction | Torus and SL₂ at F₃,a=1 | Torus matrix 0 and Frobenius 1; raw rank-two sum −1 gives normalized trace `1/√3`. | No missing square root or nontrivial torus connection. |
| 4.2–4.5 local Frobenius | Rank-two regular nilpotent; rank-one `A=−1/2,q=3,C=x⁻¹`; inherited | `N²=0`, rank N=1; `NC=qCN` has equal off-diagonal entries. `δC=−C=(3A−A)C`. | Inverse/transpose and arithmetic/geometric conventions not interchanged. |
| 5.1–5.3 Newton bounds | SL₂ polygon, torus finite central character; inherited | Central endpoints 0; ordinary slopes `−1/2,+1/2` versus basic `0,0`. Finite-order torus character slope 0; norm character slope 1 is excluded. | Dominance direction and finite-order central hypothesis matter. |
| 6.1 generated monodromy | SL₂ standard versus trivial rank-two object | Invariants in tensor square: dimension 1 versus 4. Torus Bessel object generates the trivial group, dimension 0. | Generated category does not mean all representations of the ambient group. |
| 6.2–6.3 principal exclusion | A₂ exponents 1,2; G₂ | Correct adjoint dimension `3+5=8`; shifted exponents would give `1+3=4`. G₂ slope bound `14/6=7/3<3`, hence integer irregularity ≤2. | Corrected exponent indexing supports the contradiction. |
| 6.4 and 11.4 exceptional groups | SL₃ and SL₇ at p=2; inherited | SO₃ dimension 3 versus SL₃ dimension 8; G₂ dimension 14 versus SL₇ dimension 48. | Exceptional characteristic-two branch retained. |
| 6.5 adjoint parameter | Image in PGL₂ of `u⁴=t,z⁵−z=u⁻²` over F₅((t)) | Adjoint inertia order 10; wild group order 5; lower break 1; upper break `1·5/10=1/2`; `D₂=1`. | Matches GR's adjoint conclusion. |
| 6.5 central lift | Same extension, image in SL₂ | `v(u)=5,v(z)=−2`; `w=uz²` has value 1; `v(σw−w)=3`. Thus `|D|=20`, `D₁=D₂=C₅,D₃=1`, while `c=2`. | New `D_c=D₁,D_(c+1)=1` is correct on the old counterexample. |
| 6.5 upper breaks and Swan | Same lift | Upper break `2·5/20=1/2`, unchanged in quotient; two root lines give Swan `2·1/2=1`; full adjoint invariants 0. | Hypotheses are satisfied; central lower break genuinely changes. |
| 6.5 all SL₂ parameters in this regime | Normalizer element `[[0,b],[−b⁻¹,0]]` | Square is `−I`, so centre intersection order 2; in PGL₂ its square is 1. | New SL₂ Check is discriminating, not restricted to one extension. |
| 6.6 adjoint rigidity | A₄ local image at p=2; inherited | Adjoint invariant dimension `(3−3+0)/12=0`; Euler expression `−1+1+0=0`. | Does not apply the prime-to-Weyl theorem at p=2. |
| 7.1–7.3 uniqueness and multipliers | Central ±1; scalar series at p=2; inherited | `C` and `−C` have opposite eigenvalues; PGL₂ centre order 1. `v₂(4^j/j!²)=2` for powers of 2, giving radius 1; scaling by 2 or 1/2 changes radius to 4 or 1/4. | Local normalization and unit scaling are substantive. |
| 7.4–7.6 functoriality and companions | G₂ representations; SL₂→PGL₂ | `dim Λ²(7)−dim 7=21−7=14`; central kernel order 2. | Spin representation alone does not generate the required comparison; a surjection alone is insufficient. |
| 8.2–8.3 orthogonal matrices | Ranks 3,5,6,8; inherited | Preserved-form residual matrices 0; invariant vector residual 0. Adding the erroneous middle entry gives residual 2 in the vector equation. | Correct matrix/constant-summand formulas retained. |
| 8.4–8.6 charts and traces | n=3,4 over F₂/F₃; inherited | F₂ chart counts 3,7, not 3,5. F₃ pairs 13,4 and 13,40, not 13,4 and 7,34. SO₈ trace `7/8` minus SO₇ trace `−1/8` equals 1. | Literal chart domains and constant summand agree. |
| 9.1–9.3 hypergeometric data | Upper `0,1/2`, lower `1/3`; q=7; inherited | Differences `−1/3,1/6` are nonintegral; rank 2. Equal positive lengths exclude x=1. Quadratic Gauss lifting at q=3 gives `g₉=3=−g₃²`. | No balanced/unbalanced or Gauss-lifting sign loss. |
| 9.4 shifted convolution | q=3,n=2,a=1 | `R₂(1)=−1,R₂(2)=2,U₂=7`. Untwisted convolution trace `−4/(3√3)`; half twist gives `−4/9`; shift changes it to `4/9=(7−3)/9`. | F02 repair verified at the refuting instance. |
| 9.4 concentration/rank | n=2,3 | `H_c⁰=H_c²=0`; local Swan totals `(2n−2)+3=5,7`, respectively. | Only `R¹` remains, of rank `2n+1`; `[1]` places it in degree zero. |
| 10.1 block truncation | p=2,m=1,s=2; s=0; inherited | First block indexes 4,5,6,7. With `B(j)=j+1,m=2,s=0`, block is `3x²`. At p=0,s=1 the interval is empty. | Native total definition is harmless; theorem uses p=2. |
| 10.2 signed Dwork headline | Odd ranks 3,5; m=s=1,N=4 | Coefficients `640/27`, `23296/243`; required factors `−16`, `−64`; quotients `−40/27`, `−364/243` integral at 2. | Exact rational checks agree. |
| 10.2 broader coefficient controls | Ranks 3,5, m=0..2,s=0..3,N=0..64 | 1,560 coefficient instances; minimum nonzero valuation margin 3 and 2 respectively, versus required ≥0. | No failing congruence or zero-denominator shortcut. |
| 10.3 unit-root line | `F=1/(1−x),p=2,q=4` | `f₂=1+x`, `f₄=(1+x)(1+x²)=1+x+x²+x³`. Logarithmic Frobenius equation at x=0: both sides 1; inverse multiplier gives −1. | Orientation and q-iteration agree. |
| 10.4–10.6 characteristic-two comparison | Two Bessel series; inherited | Ratio starts `1−16x+112x²`; unit-root slope 0, dual-twisted quotient slope n. Lifts x and −x reduce to the same coordinate modulo 2. | Maximal-quotient comparison uses the dual and Taylor isomorphism, not literal equality of lifts. |
| 11.1 raw sum definitions | F₂ rank 0; F₃ n=0,a=2; inherited | Rank-zero Kloosterman sum at a=1 is 1. Orthogonal total definition at n=0 is 4, not empty-tuple value 1. Quadratic character values at zero/square/nonsquare: 0,1,−1. | `n≥1` and unit hypotheses exclude junk values in headlines. |
| 11.1 trace and hypergeometric definitions | F₄; F₃,N=0; inherited | Prime-trace character on `0,1,ω,ω+1` is `1,1,−1,−1`. Hypergeometric value at b=0 is 0; at b=1 is ζ² and at b=2 is −ζ. | Composition through field trace and total zero convention match native definitions. |
| Characteristic-two headline | q=2,4,8,n=1,a=1 | `R₂²−q=−1,5,17`, respectively, equal to raw rank-three sums. For n=2 the corresponding `U₂−q` and rank-five values are `−1,21,−151`. | Equality verified exactly, with prescribed prime-trace character. |
| Odd-characteristic headline | q=3,a=1, ζ³=1 | `g=−1−2ζ`; n=1: `g(−2)=2+4ζ=H₃(1)`; n=2: `g·4=−4−8ζ=H₅(1)`; `4a=1`. | Gauss sign and parameter 4 verified. |
| Raw convolution headline | q=3,N=2,a=1 | LHS `U₂−3=4`; RHS summands 2 and 2, total 4. | Agrees independently of the corrected object shift. |
| Three finite-sum headlines, wider sample | F₂,F₄,F₈,F₃,F₅,F₇; n=1,2 and all nonzero parameters | 249 exact cyclotomic-ring equalities, each LHS−RHS=0. Odd-characteristic checks include every nontrivial character scaling; convolution N=2 uses all those characters. | No approximation tolerance used. |
| 11.2 facets versus all faces | n=1,d=2 | Facet exponent matrix `diag(1,1,2)` determinant 2; primitive vertex `(1,0,0)` saturated index 1. At p=2, `z∂_z(−z²)=0`. | Facet claim holds; lower-dimensional index claim and nondegeneracy at p∣d would fail. |
| 11.2 Hodge numbers | n=1,d=1,2,3 | Lattice counts start `1,4,10,19,31,46`; `1,1,4,4,10,10,…`; `1,1,1,4,4,4,…`. Alternating weight counts give respectively 3,6,9 ones and then zeros. | Degree `3d`, slopes `j/d`; cone membership included in enumeration. |
| 11.2 general facet volume | Dimension 2n+1 | There are `2n+1` facets of determinant absolute value d; total volume `d/(2n)!`; normalized volume `d(2n+1)`. | Matches number of Hodge slopes. |
| Orthogonal ordinarity headline | F₂,n=1,a=1, extensions of degrees 1,2,3 | Power sums `−1,5,17` give polynomial `T³+T²−2T−8`; coefficient valuations `0,0,1,3`, slopes `0,1,2`, root norms `1,1/2,1/4`. | β is chosen before extension L; extension-degree exponent and normalization agree. |
| 11.5 characteristic-two convolution | F₂,n=2,a=1 | SO₃ trace `−1/2`, scalar rank-two trace `−1/√2`; unshifted half-twisted value `1/4`; shifted `−1/4=(1−2)/4`. | Shift repair propagated to the final exceptional branch. |

### Pinned APIs, duplication and signatures

The pins inspected were Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Searches were by objects as well as names. The library-match leads contain no existing proof of any of the five headlines. The elementary native definitions below are imported or specialized, not replanned as new foundational API.

| Pinned location opened | What it supplies and what it does not |
| --- | --- |
| `Mathlib/Algebra/Group/AddChar.lean`:72, 242, 354, 463 | `AddChar`, composition, sum orthogonality and `mulShift`. An additive character is not automatically nontrivial; the headlines carry that hypothesis. |
| `Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean`:240 | `AddChar.sum_eq_zero_of_ne_one`; character orthogonality, not an orthogonal/Kloosterman identity. |
| `Mathlib/FieldTheory/Finite/Trace.lean`:37, 49 | Nondegenerate finite-field trace and `FiniteField.algebraMap_trace_eq_sum_pow`; supports the trace-character carrier and nontriviality. |
| `Mathlib/Algebra/Algebra/ZMod.lean`:47 | `ZMod.algebra`; the explicit algebra structures in the signatures are legal. |
| `Mathlib/NumberTheory/GaussSum.lean`:72, 200 | Native Gauss sum and inverse-character product with character hypotheses. Neither states the orthogonal hypergeometric identity. |
| `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean`:120; `Mathlib/NumberTheory/MulChar/Basic.lean`:455 | Quadratic character and `MulChar.ringHomComp`; the local definition only changes coefficient ring. |
| `Mathlib/RingTheory/PowerSeries/Basic.lean`:77, 112; `Mathlib/RingTheory/PowerSeries/Expand.lean`:33, 87, 97; `Mathlib/RingTheory/PowerSeries/Trunc.lean`:51, 63 | Coefficients, `mk`, substitution x↦xᵖ and initial truncation. No signed Dwork block congruence is supplied. |
| `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean`:56; `Mathlib/RingTheory/AdicCompletion/Basic.lean`:57; `Mathlib/RingTheory/Localization/FractionRing.lean`:52 | Nonfield local PID/domain condition, adic completeness including separation, and fraction-ring localization. The theorem explicitly retains all three. |
| `Mathlib/NumberTheory/Padics/Complex.lean`:137; `Mathlib/LinearAlgebra/Dimension/Finrank.lean`:61 | Completed algebraic closure and finite rank. The latter's infinite-dimensional junk value is excluded by finite fields. |
| `Mathlib/LinearAlgebra/Matrix/Trace.lean`:43; `Mathlib/Algebra/Lie/Basic.lean`:73 | Native matrix trace and Lie carriers, not algebraic-connection or isocrystal monodromy constructions. |
| `TauCeti/Algebra/Coalgebra/Comodule/Finite/Basic.lean`:95; `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean`:138 | Finite generated comodule category and Tannaka group reconstruction. Neither gives coefficient categories on curves or their fibre functors. |
| `TauCeti/NumberTheory/LocalField/Herbrand/Quotient.lean`:176; `TauCeti/NumberTheory/LocalField/Herbrand/UpperQuotient.lean`:98 | `TauCeti.LocalFieldsRamification.map_restrictNormalHom_lowerRamificationGroupReal` and `TauCeti.LocalFieldsRamification.map_restrictNormalHom_upperRamificationGroup`. Finite Galois local-field hypotheses apply to the characteristic-five witness; lower numbering is transformed, not preserved. |

The module has exactly 11 actual declarations, six definitions and five theorems. The supplied automated signature count was treated as a lead, not copied as the declaration count. A scratch copy containing `#check @name` for all 11 elaborated successfully. Compared every elaborated type with the README: no missing section binder. In particular, completeness, fraction-field structure, characteristic zero, nonunit 2, every denominator's nonzero hypothesis and all Dwork congruence hypotheses survive; the finite-sum theorems retain character nontriviality and rank restrictions; the ordinary theorem has a single β before its universal finite-extension quantifier. The prime-field algebra structures agree automatically, so no additional scalar-tower hypothesis is needed here. Nothing in the signatures was changed.

Ran `lake env lean` on the package's `Suggested.lean` from the content checkout: exit 0, exactly five `declaration uses 'sorry'` warnings, at lines 66, 133, 145, 156 and 169. The sole import is `Mathlib`; no Tau Ceti module build was required.

On a scratch copy, replaced each of the five `sorry`s with a probe trying `rfl`, `infer_instance` and `simp`. All five failed. The Dwork goal retained the actual coefficient-divisibility assertion; the four other probes reported no simplifying proof. Also compared the exact-library-lemma candidates in the supplied near-match list with the pinned declarations above: orthogonality, Gauss products and power-series coefficient lemmas do not prove these headlines with one `exact`. None restates a definition, mirrors a Check or treats only a boundary case. No padding finding.

### Headline acceptance coverage

| README headline | Suggested.lean disposition |
| --- | --- |
| Signed 2-adic Dwork congruences, §10.2 | `signed_dwork_congruence`, line 66, on a general complete mixed-characteristic DVR. |
| Characteristic-two orthogonal identity, §11.1 | `orthogonalSum_sub_card_eq_kloostermanSum`, line 133. |
| Odd-characteristic quadratic hypergeometric identity, §11.1 | `gaussSum_mul_orthogonalSum_sub_card`, line 145. |
| Orthogonal convolution identity, §11.1 | `orthogonalSum_sub_card_eq_convolution`, line 156. |
| Everywhere orthogonal ordinarity, §11.3 | `orthogonalSum_ordinary`, line 169, as the actual trace function over all finite extensions with prescribed eigenvalue norms. The even orthogonal constant summand is covered by §8.6. |
| Hecke eigenobject and Bessel F-isocrystal, §§1.6, 4.1 | Named in module docstring: missing curve coefficient categories, stacks and eigensheaves. |
| Arithmetic Satake, §1.3 | Named: missing arithmetic D-modules on the Grassmannian. |
| Zhu and relative de Rham–rigid comparisons, §§2.7, 3.5 | Named: missing stack D-modules, opers and family rigid cohomology. |
| Differential and arithmetic monodromy, §§2.8, 6.4, 11.4 | Named: missing differential and coefficient-object monodromy carriers. |
| Generic ordinarity and A/C/G₂ Newton-point ordinarity, §§5.3, 11.3 | Named: missing H-valued Newton classes. Scalar numerical A/C ordinarity belongs to the scalar supplier; it is not replanned. |
| Functoriality and companion monodromy, §§7.5–7.6 | Named: missing lisse local systems. |
| Characteristic-two isocrystal comparison, §10.6 | Named: missing overconvergent coefficient category; its genuine trace consequence is stated above. |
| General arithmetic hypergeometric construction, §9.1 | Named with unequal/equal-length domains and rank: missing arithmetic D-module/isocrystal carrier. |
| Adjoint rigidity and simple-wild local parameter, §§6.6, 11.5 | Named: missing coefficient cohomology and H-valued local Weil parameters. |

The six supporting definitions have real bodies on native types. There is no freely supplied predicate standing for an unavailable construction. No further statable headline was identified as missing.

### Supplier resolution and ownership

Read the board package index before resolving missing-package leads, then searched main, indexed open heads and the board packages by object. Used `roadmaps show` for cited suppliers and `roadmaps grep` for Kloosterman, Bessel, arithmetic coefficients, toric Newton/Hodge bounds and facial decomposition. Compared main-roadmap shape with the existing BunGAndNewtonStrata, MotivesAndAlgebraicCycles and ReductiveGroups roadmaps.

The following table records current citation resolution, not remembered numbering. Paths in the table are repository-relative; numbers are the cited README's line numbers, not the wrapper lines printed by the source service.

| Supplier | Resolved sections and ownership evidence |
| --- | --- |
| KloostermanMomentsAndPotentialAutomorphy | `packages/KloostermanMomentsAndPotentialAutomorphy/README.md`:471, 534, 625, 725, 747: §§1.1, 1.3, 2.1, 2.5, 2.6. Normalized scalar sheaves, monodromy, formal slopes, rigidity and cyclic/horizontal sign dictionary remain owned there. The resolver's only missing lead, §2.6, is false: it is present at line 747. |
| CongruenceSpectralGap, open #1504 | `TauCetiRoadmap/CongruenceSpectralGap/README.md`:647, 677, §§4.2a–4.2b, supplies raw sums and scalar Artin–Schreier/Kloosterman interfaces. The package specializes native formulas for its acceptance signatures, not a second general scalar theory. |
| CharacterSumsOverFiniteFields, open #1712 | `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md`:1123, §3.3, supplies Davenport–Hasse lifting with the nontriviality qualification and sign. |
| GlobalShtukasAndFunctionFieldLanglands, open #1490 | `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md`:174, 494, 537, 564, 614, 648, 662, 713, 727, 804: §§0.1, 0.14, 1.1–1.2, 1.4–1.6, 1.8–1.9, 1.12. Owns finite-field level geometry, étale Satake, Hecke action and excursion infrastructure. Relative mixed-characteristic geometry and the cuspidal Newton estimate are explicit gaps, not falsely attributed to present sections. |
| ReductiveGroups and ReductiveGroupsPartII, main | `TauCetiRoadmap/ReductiveGroups/README.md`:1030, 2253, 3029, 4087, Layers 1, 7, 9, 10; `TauCetiRoadmap/ReductiveGroupsPartII/README.md`:4151, 4794, 5533, RG2.3.3, RG2.3.6, RG2.4.1. Root data, structure and depth/Iwahori geometry are imported. Principal-SL₂ classification is the separately declared gap. |
| OrthogonalSpinGroups, main | `TauCetiRoadmap/OrthogonalSpinGroups/README.md`:331, 408, Layers 0–1. Orthogonal and spin carriers and forms are imported, not reconstructed. |
| FormalConnectionsOpers | `TauCetiRoadmap/FormalConnectionsOpers/README.md`:667, 1568, 2109, F2, F4, F6. Connection and oper machinery is imported; Bessel specialization stays here. |
| AffineLieAlgebras, main | `TauCetiRoadmap/AffineLieAlgebras/README.md`:1013, 1049, A7–A8. Existing complex critical centres are not claimed as rational forms; the latter have a separate named gap. |
| SpringerResolutionAndCharacteristicCycles, open #1828 | `TauCetiRoadmap/SpringerResolutionAndCharacteristicCycles/README.md`:832–929, Layer 8; 964, 1016, 1051, 1075, Layer 9. Smooth characteristic-zero D-modules and their operations are the generic owner; the two-point descent is the present application. |
| BunGAndNewtonStrata, main | `TauCetiRoadmap/BunGAndNewtonStrata/README.md`:331, 679, §§1.5 and 1.22. Newton points, dominance and central projection are imported. |
| MotivesAndAlgebraicCycles, main | `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md`:1116, 1130, 1149, 1179, §§6.1–6.3 and 6.5. Tannakian constructions and isomorphism torsors do not supply a rational point automatically; the marking in §2.6 remains necessary. |
| DeligneWeightsAndPurity, main | `TauCetiRoadmap/DeligneWeightsAndPurity/README.md`:2434, 2525, 2562, 2718, §§8.5, 8.12, 8.14, 8.19. Pure-weight and tensor/semisimplicity inputs are imported. |
| EtaleCohomologyFoundations, main | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md`:850, F4.0 and its adic coefficient interface. Used for foundations, not as ownership of Bessel objects. |
| PadicDifferentialEquationsAndRigidCohomology, open #1002 | `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md`:1670, 1847 (RD.0); 2472–2685, 3094, 3324–3361 (RD.1); 4442–4517, 5032, 5523 (RD.2); 5787, 6219, 6436–6604, 6767–6939 (RD.3); 8507, 8543 (RD.4); 8780, 8869, 10266, 10638, 10926–10995, 11227 (RD.5); 11479–13731 (RD.6). The individually cited RD.6.3–6.4, .23, .25, .28, .41–.44, .46–.48, .51–.52, .55, .64–.65, .82, .94–.95, .97 all resolve. Dense restriction, Frobenius extension and exponential sign hypotheses were distinguished. Missing general operations/comparisons/toric results remain declared gaps. |
| PadicDifferentialEquationsAndRigidCohomologyPartII | `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md`:1461, 1483, MS.4.6–MS.4.7. The lifting of maps from slope quotients has the irreducibility/nonzero-map or PBQ/saturation hypotheses used in §10.6. |

No generic toric Newton-bound or facial-decomposition owner was found in the searched main/open/package material. PadicDifferentialEquationsAndRigidCohomology RD.6.94–RD.6.97 treats scalar Kloosterman deformation, not these general statements. MixedHodgeModulesAndIrregularHodgeTheory concerns complex twisted cohomology, without the finite-field Frobenius/Newton theorem. The two new general contracts therefore belong to the earlier p-adic supplier; this roadmap owns only their displayed orthogonal specialization.

The overlap report has no conflicting head, dropped citation, unmapped old identifier or revision-only dependency. Compared the closest open roadmaps: GlobalShtukasAndFunctionFieldLanglandsPartII #1845, PadicDifferentialEquationsAndRigidCohomology #1002, GeometricSatakeAndFusion #1235, GlobalShtukasAndFunctionFieldLanglands #1490 and CharacterSumsOverFiniteFields #1712. GeometricSatakeAndFusion's scope concerns its étale/fusion theory, not a second arithmetic Bessel construction. GlobalShtukasAndFunctionFieldLanglandsPartII §4.0 (`TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md`:606–638) imports this package's Bessel/companion anchor; it does not become an upstream supplier. The package's former-numbering correspondence is retained. No duplicate fully qualified Lean declaration was found.

All 11 declared gaps have matching slugs in `design/plan.json` and the README supplier contracts:

- GlobalShtukasAndFunctionFieldLanglands: relative-level-geometry; cuspidal-newton-bound.
- PadicDifferentialEquationsAndRigidCohomology: arithmetic-d-module-operations; formal-slope-comparison; companion-monodromy; dense-convergence-detection; toric-exponential-sum-hodge-bound; toric-exponential-sum-ordinarity.
- ReductiveGroups: principal-sl2-subgroups.
- KloostermanMomentsAndPotentialAutomorphy: scalar-kloosterman-ordinarity.
- AffineLieAlgebras: critical-center-rational-forms.

Each has a named earlier supplier and definite hypotheses. The categorical operations contract is one coefficient-theory interface with its required operations, rather than an unowned request to establish this roadmap's conclusions. The toric contracts state the exact general theorem inputs; their application and lattice calculation stay here. No contract requests an object already provided at the checked pin or cited sections. Their pending implementation is a condition of eventual acceptance, not an additional finding.

The prescribed dependency check was run from this review, with the given content and order inputs. Its complete output was:

```
depcheck: 236 roadmaps, 2146 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Every `*Needs:*` line and supplier contract was read; no forbidden supplier, upward edge or ownership cycle was identified. The two absent target lines are R01, not an unowned prerequisite.

## Not verifiable

Seven entries remain settled uncertified: AS89 (Corollary 3.11), Wan93 (boundary decomposition), Wan04 (Theorem 3.1 and Corollary 2.6), Bal82 (formal/p-adic slope comparison), DH35 (Gauss lifting), ESDE (scalar Kloosterman and hypergeometric results) and KatzCC (low-dimensional character identities). Their legal full texts are unavailable in the supplied cache and their status was explicitly settled by the operator. They were cited by the recorded locators, not guessed, refetched or entered into a new missing-reference request. In particular, §11.2's direct primary-source verification is conditional on those AS/Wan locators; XZ's application and the repaired polytope calculations were readable and checked.

Elaboration verifies types, not the five admitted proofs. The finite computations verify the stated instances, not the general mathematical targets. The other generic theories named as supplier gaps are contracts to be implemented; their absence today was not treated as a defect.

## Source issues

- **Gap** in XZ at §4.3.6, printed p. 49: the source says extension of a central torsor across zero makes the lifts isomorphic; it should be geometric triviality, with rational triviality requiring a compatible rational marking; affects the proof.
- **Misprint** in XZ at Lemma 4.5.5, printed p. 53: the source says the shifted indices in the displayed principal decomposition are the exponents; it should be the unshifted indices, giving summands of dimensions twice the exponents plus one; affects the proof.
- **Gap** in XZ at Corollary 4.5.6, printed p. 53: the source says a surjection between two closed subgroups of the ambient group forces isomorphism; it should be a comparison using the common faithful representation and compatible connected and component groups; affects the proof.
- **Error** in XZ at (5.3.9.1) and (5.3.11.1), printed p. 61: the source says the normalized odd-orthogonal object equals the unadjusted compact-support convolution; it should be shifted by one and half-twisted, with the corresponding negative normalized trace factor; affects a stated result.
- **Misprint** in XZ at (5.4.3.1), printed p. 63: the source says the raw toric sum equals the trace of the hypergeometric object; it should be the negative of that trace with the stated normalization; affects the proof.
- **Misprint** in XZ at Proposition 5.3.8(i), printed p. 61: the source says the normalized zero-place Frobenius spectrum contains zero; it should contain one in the middle; affects nothing.
- **Gap** in XZ at the proof of Lemma 4.2.6(i), printed pp. 44–45: the source says the punctured quasi-minuscule projection is affine; it should be replaced by an independent concentration argument because the punctured cone need not be affine; affects the proof.

GR Proposition 5.6 is not a source error: its adjoint convention is explicit. Applying it unchanged to a central lift was the package error repaired by F01. No additional source issue was inferred merely from the inaccessible settled references.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "8c6e51ab5c7bb7f2e3890707577ba7dc54532906", "job": "REV-PKG-KloostermanSheavesAndBesselIsocrystals~4", "model": "gpt-6-astra", "worker": "chris-8"} -->
