# Human review response: PeriodsAndSpecialValues

## H01 (CBirkbeck) — applied

The fundamental-line comparison, integral pullback, lattice-change cone, zeta target, shifted complex and boundary now use ordinary-real support, replacing the uncorrected Tate-modified determinant and retaining d(T⁺)⁻¹ in Ξ and d(T⁺) in Δ (`TauCetiRoadmap/PeriodsAndSpecialValues/README.md:888`, `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:1088`). The unit-motive Check computes degrees 1−1=0 and −1+1=0, and PS.4.4 retains the full dyadic correction cone, matching NoncommutativeAndEquivariantIwasawa §F.3/§7.9 and BV-final line 829, line 837 and line 855.

## H02 (CBirkbeck) — applied

The elliptic adapter now assumes ord_(s=1)L(E,s)=rank E(ℚ) before identifying L* with L^(r)(E,1)/r!, and also records the equivalent formulation pairing ETNC (ii) and (iv) with the BSD order-and-coefficient statement (`TauCetiRoadmap/PeriodsAndSpecialValues/README.md:1215`). The new germ Check gives leading coefficient 3 for both 3(s−1) and 3(s−1)² but first derivatives 3 and 0; BF line 1630 and line 1643 separate these two assertions, while PS.6.4's existing witness already includes rank equality.

## H03 (CBirkbeck) — applied differently

The RD.3 direct-image attribution is replaced by RD.5.115 with the projective smooth lift, compatible compactification and base-change hypotheses, and quinticLogComparison now constructs the rank-four relative logarithmic module, its Hyodo–Kato fibre and its punctured rigid comparison before applying extension uniqueness (`TauCetiRoadmap/PeriodsAndSpecialValues/README.md:1883`, `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:1886`). The general semistable blowup is also imported from the earlier PotentialAutomorphyDworkMotivesPartII DM.8/dwork-semistable-blowup, leaving its N=5, U=−5 transport here; the distinct fibre and relative roles agree with CR.6.3, RD.5.107–109, Qian line 183 and line 647, and K line 175.

## H04 (CBirkbeck) — applied

PS.1.1 now consumes SmallRamificationAndAbelianVarietyBaseCases §5.0d's raw data, AG2.P's Weak/all-place Strict and PotentialModularityAndCompatibleSystems §§1.6/1.15's away-coefficient strictness and finite functions, with P(T)=T^dQ(T⁻¹) and equality/transport adapters (`TauCetiRoadmap/PeriodsAndSpecialValues/README.md:408`). PS.1.2 compares the regular completion meromorphically while preserving arbitrary Hodge multiplicities, both Gamma normalizations and the zero-rank value 1; the Checks compute local values 4/3, 16/9 and 1 and completion ratios 2, 4 and 1, consistently with BCGP line 1752 and line 1774.

## H05 (CBirkbeck) — applied

The elliptic witness and integral section now consume EllipticIntegrals Milestones 1 and 3, with the parameter identity K_λ=K(√λ) on 0≤λ<1 and the canonical second-kind integral and Legendre relation in the weight-two determinant calculation (`TauCetiRoadmap/PeriodsAndSpecialValues/README.md:350`, `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:1356`). The retained local integral is explicitly a signature adapter because the canonical functions are absent at the pins (`TauCetiRoadmap/PeriodsAndSpecialValues/Suggested.lean:53`); the λ=1/4 Check distinguishes radicands 180/256 and 189/256, and the λ<0 Check excludes an unrestricted square-root adapter.

## H06 (CBirkbeck) — applied

PS.9.2 imports ColemanIntegration L1.12's generic word algebra and NC §2.0/§2.4's coordinate duality, adds basis-preserving algebra/coalgebra comparisons preserving multiplicities, unit, length and coefficient extension, and retains only the index-specific subalgebras and stuffle construction here (`TauCetiRoadmap/PeriodsAndSpecialValues/README.md:1991`). The Lean shuffle presentation is specialized from an arbitrary alphabet to Bool (`TauCetiRoadmap/PeriodsAndSpecialValues/Suggested.lean:170`), and PS.9.13 applies the supplied finite-alphabet duality degreewise; the Checks retain 01⧢01=4·0011+2·0101 and 0⧢0=2·00, agreeing with IKZ line 91 and line 108.

## H07 (CBirkbeck) — applied

The path torsor is now a represented pro-unipotent affine torsor, its coordinates an ind-algebra with finite word-coordinate subcoalgebras, and the inverse system of their duals the completed pro-object with truncated concatenation (`TauCetiRoadmap/PeriodsAndSpecialValues/README.md:2163`, `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:2188`). The new Check computes dimensions 1,3,7 and 0⧢0=2·00 outside the length-one coordinate piece, while its dual length-one augmentation quotient has generator square 0; these are the coordinate/series distinction in B line 125–145 and the NC §2.0/§2.4 contract.

## Ownership, citations and pinned signatures

The ownership search covered main bfaaff1, the indexed open roadmap heads, the 46 named sibling roadmap checkouts and accessible board packages, by mathematical object. The added generic suppliers are the owners named in H04–H06; NoncommutativeAndEquivariantIwasawa §F.3 owns ordinary-real support, RD.5.115 and RD.5.107–109 own the relative machinery, and this roadmap owns the quintic-specific parameter, residue and relative-log comparison adapters rather than a new general cohomology construction.

PotentialAutomorphyDworkMotivesPartII is an explicitly permitted earlier supplier (merge-order position 139, before PeriodsAndSpecialValues at 199); its accessible `packages/PotentialAutomorphyDworkMotivesPartII/design/README.md:2534` states DM.8/dwork-semistable-blowup and its flat-base-change interface. It has no main/open-roadmap entry in the index, so that citation was verified against the board design rather than asserted to be a public head; no later supplier or merge-order edit was introduced.

All cross-roadmap citations were resolved again; the added or changed contracts were compared with the cited sections. The two pinned-name leads, TauCeti.Real.legendreK and TauCeti.Real.legendreEc, are intended future declarations of EllipticIntegrals Milestone 1, not installed APIs: the exact search at Mathlib 6b7abb3c and Tau Ceti a91d3aaf confirms their absence, so neither is imported or mentioned in a Lean theorem type. The numerical parameter integral remains a real definition; no arbitrary-function substitute or sorry'd data was added.

At the Tau Ceti pin, `TauCeti/LinearAlgebra/TensorCoalgebra/Coaugmented/Basic.lean:79` defines TensorWords as the direct sum of tensor powers and line 228 defines all-cut deconcatenation; it supplies no shuffle multiplication. At the Mathlib pin, `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean:53` defines Γ_ℂ with the factor 2, and line 124 proves its Γ_ℝ duplication identity; `Mathlib/MeasureTheory/Integral/IntervalIntegral/Basic.lean:73` defines IntervalIntegrable using integrability on the two oriented intervals and supplies no endpoint convergence automatically.

A single scratch signature file containing #check @name for each of the 38 declarations was elaborated once through the authorized target build, then the production file was restored and built. All 25 definition types and 13 headline theorem types were compared with their README statements: no required hypothesis disappeared; the sole intentional type change is shuffles from a universe-polymorphic alphabet to List Bool, and both Legendre range hypotheses, N>0, admissibility/positivity and the two Fact p.Prime instances remain in the theorem signatures. Every Lean declaration still occurs in the README, no own #check remains in Suggested.lean, and no supplier declaration was assigned this roadmap's namespace.

## Adversarial mathematics pass

These are finite controls and exact specializations, not proofs of the admitted theorems. Approximate real values are labelled ≈; other displayed values are exact. The table covers the repaired interfaces, their new Checks, and every retained Lean declaration.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Ordinary-real comparison triangle and determinant convention | Unit motive over ℚ, odd p, S={p,∞} | χ(global)=0, χ(p-local)=−1; χ(C_Tate)=1, rank V⁺=1; χ(C_ord)=1−1=0=deg Ξ | Corrected degrees agree | Use C_ord throughout |
| Ξ/Δ real-plus exponents | Rank-one plus factor; basis multiplied by 2 | Ξ factor scales by 2⁻¹; Δ factor by 2; product 1 | Opposite exponents required | Add both determinant formulas |
| Real-plus projector and coefficient extension | c=+1, c=−1, p=3; zero module | (1+c)/2=1,0; invariant ranks 1,0; zero rank 0 | Projective summands at odd p | State projector/perfectness input |
| Nonabelian projector control | S₃ permutation representation, c=(12), p=3 | (1+c)/2 has image span(e₁+e₂,e₃), rank 2; its square equals itself; C₂ sign has rank 0 | Involution calculation does not assume ambient group abelian | Retain general real-invariant construction |
| No-real-place specialization | Empty real-place set | V⁺=0, d(V⁺)=1; C_ord=C_Tate | Equality retained | Record empty-sum control |
| Integral pullback I_λ and Δ_λ | Identity θ on corrected determinant; zero complex | I=O, Δ=O; both degree 0 | Source/target and inverse agree | Pull back d C_ord |
| Finite lattice correction in corrected support | [O --π³→ O] in degrees 0,1, then shifted | H¹ length 3; exponent −(−3)=3; lattices π³O and π⁻³O | Shift inverts | Change lattice-change cone to C_ord |
| Dyadic real cochains | Trivial and sign ℤ₂ lattices | Tate trivial even=ℤ/2, odd=0; sign even=0, odd=ℤ/2; ordinary trivial H⁰=ℤ₂ | Rational acyclicity does not erase plus line | Distinguish ordinary and Tate models |
| Full dyadic correction cone | Fibre of ordinary→complete Tate, trivial ℤ₂ | H⁰=ker(ℤ₂→ℤ/2)=2ℤ₂; H⁻¹=H⁻³=ℤ/2; index of 2ℤ₂ is 2, length 1 | Cone is not T⁺[0] integrally | Require full correction comparison |
| Dyadic rationalization | Same complexes tensored with ℚ₂ | Tate groups=0; ordinary H⁰=ℚ₂; correction H⁰=ℚ₂ | Plus line survives | Add rational control |
| Zeta target and shifted pair | Unit motive, odd p | deg d C_Tate⁻¹=−1, deg d(T⁺)=1; deg d C_ord⁻¹=0=deg 1 | Zeta target has correct grading | Correct target, shift and boundary |
| Zeta boundary and leading term orientation | C=[ℤ₃ --3→ ℤ₃]; a generator with value 3 | dC=3ℤ₃, d(C[1])=3⁻¹ℤ₃; ∂ pair=−[C[1]]=[C]; valuations δ(3)+RΩ=1−1=0 | Existing sign preserved | Propagate C_ord through supplier/BV formulas |
| BSD analytic order premise | Germs 3(s−1), 3(s−1)², proposed r=1 | Both L*=3; first derivatives 3 and 0; orders 1 and 2 | Only first satisfies premise | Add order equality |
| BSD rank-zero specialization | Actual order 0, algebraic rank 0 | L*=L(E,1)≠0; empty regulator=1 | Both sides use the same coefficient | Add rank-zero control |
| BSD order plus leading coefficient | Order 2 germ 3(s−1)² | L*=3=L″(1)/2!, whereas L″(1)=6 | Factorial and rank premise retained | State ETNC (ii)+(iv) alternative |
| Existing rank-zero/one transport | Witness of rank 1 and leading coefficient c | Analytic order=algebraic order=1; L′(1)=c=L* | Witness supplies added premise | No extra arithmetic conjecture added |
| Quintic smooth lift and discriminant | All X_i=1 | φ=5λ+1; every partial=5λ+1; λ=−1/5 gives 0; 1+5⁵λ⁵=0 | Singular parameter removed | Verify lift on S_W |
| Quintic smooth-locus boundary exclusion | λ=0, X=(0,0,1,1,1) | φ=0 and all five partial derivatives=0 | RD.5.115 cannot cover boundary | Separate relative log construction |
| Projective compactification and formal frames | [a:b]=[0:1],[1:0] | Closure equation becomes ∏X_i and ΣX_i⁵; at X_i=1 gives 1 and 5 | Correct parameter charts and degree 5 | Name compatible compactification and lifting obligations |
| Semistable parameter and log-integrality | r=1,2; U=−5 | Z₁=−5λ; Z₁Z₂=−5λ; at λ=0 second chart is Z₁Z₂=0 | Smooth chart and transverse crossing retained | Verify integral diagonal monoid chart |
| Direct image coefficient projector | p=3, p=5 | 125≡2 mod 3 and is invertible; 125≡0 mod 5 | Allowed small prime 3 retained | Keep p odd, p≠5 |
| Relative rank-four log module and residue | e₀ in PS.8.13 basis | N e₀=e₁, N²e₀=e₂, N³e₀=e₃≠0, N⁴e₀=0 | Rank four, nilpotence index four | Make module, fibre and restriction explicit |
| Log/rigid Frobenius compatibility | p=3, C=0 | NF(e₀)=27e₁=3FN(e₀); wrong reversed diagonal gives e₁ versus 9e₁ | Direction and p factor agree | Pin residue through comparison |
| Uniqueness of nilpotent extension in one module | Rank one, residues 0; change basis by λ | Original residue 0, new residue 1; equation for coefficient a₁ is a₁=0 | Shifted lattice excluded | Require punctured identification before uniqueness |
| Nilpotent gauge coefficient equation | N₁=N₂=0, n=0,1,−1 | 0·a₀=0; a₁=0; −a₋₁=0 | Only constant invertible gauge survives | Retain characteristic-zero hypothesis |
| Relative/fibre log comparison | Identity base change and λ=0 | Identity induces e_i↦e_i; fibre residue sends e₀↦e₁, N⁴=0 on both | Model specializes to stated HK fibre | Use RD.5.107–109 and CR.6.3 in separate roles |
| Shared compatible-system conventions | Trivial and cyclotomic lines at q=2 | Q=X−1 and X−1/2; P=1−T and 1−T/2; HT=0,−1 | Geometric conventions agree with owner | Reuse raw carrier, Weak, Strict |
| Away-coefficient versus all-place strictness | Fixed v of residue characteristic 3; λ over 2 or 3 | Away predicate compares the λ=2 pair; coefficient-prime pair count 0; all-place predicate adds the λ=3 pair | Predicates are distinct | Cite §1.6 and AG2.P precisely |
| Reciprocal-polynomial local-factor adapter | Q=X−1, q=2,s=2 | P(1/4)⁻¹=(3/4)⁻¹=4/3=4/(4−1) | Equality exact | Reuse shared finite function |
| Nonregular finite product extension | Q=(X−1)² at same q,s | (1−1/4)⁻²=16/9=4²/(4−1)² | Repeated Hodge weights allowed | Preserve nonregular scope |
| Rank-zero finite product and conductor | Zero realization over ℚ and ℚ(i) | Q=P=1, local and global functions=1; disc⁰ Norm(1)=1 | Empty products correct | Add zero-rank extension |
| All-place conductor | Unit line over ℚ and ℚ(i) | f=(1); N=1 and 4 | Discriminant retained | Keep conductor assembly here |
| Regular completion equality at removable pole | Elliptic H¹ at s=1/2 | Total-Gamma uncancelled quotient=0; cancelled Γ_ℂ(1/2)=√2 | Equality must be meromorphic | Add shared-completion adapter |
| General Hodge multiplicities and Gamma bridge | Zero, one elliptic copy, two copies | Complex block count b=0,1,2; Λ_D/Λ_B=1,2,4 | Multiplicities preserved | Keep nonregular normalization extension |
| Canonical Legendre parameter transport | λ=0,1/4,1/2 | k²=λ for k=0,1/2,1/√2; K values ≈1.570796326795,1.685750354813,1.854074677301 | Supplier convention agrees | Parameter-only signature adapter |
| Wrong-modulus negative control | λ=1/4,t=1/2 | Correct radicand 45/64=180/256; modulus λ gives 189/256 | Passing λ as modulus fails | Add explicit Check |
| Parameter-domain negative control | λ=−1 and λ=1 | K_(−1)≈1.311028777146 ≠ K₀≈1.570796326795, despite Real.sqrt(−1)=0; at λ=1 endpoint diverges | No unrestricted total-function equality | Restrict comparison to 0≤λ<1 |
| Weight-two Legendre relation and period determinant | k=k′=1/√2 | 2EK−K²=π/2; H−J=4E−2K; K(H−J)=π; det B=4πi | Normalization factors match | Import canonical K,E and relation |
| Coleman two-letter algebra adapter | false↦0,true↦1; words 0,01 | 0⧢0=2·00; 01⧢01=4·0011+2·0101 on both sides | Multiplicities fixed | Reuse generic owner |
| Coordinate coalgebra/TensorWords adapter | Word 01; empty word | Three cuts: ∅⊗01+0⊗1+01⊗∅; Δ∅=∅⊗∅ | Both outer cuts present | Add NC coalgebra comparison |
| Word-length and coefficient extension | 0⧢0 over ℚ→ℚ₃ | Length 1+1=2; coefficient 2 maps to 2, not 1 | Grading and base change agree | Specify preserving laws |
| H¹,H⁰ specializations and separate stuffle | Words ∅,1,01,0; index [2] | Membership H¹: yes,yes,yes,no; H⁰: yes,no,yes,no; [2]*[2]=2[2,2]+[4] | Distinct carriers/products | Keep only index-specific theory here |
| Odd-weight shuffle specialization | Weights 3,5,6 | Odd words: f₃, f₅, f₃f₃ respectively; after adjoining f₂, weight 5 has f₅,f₂f₃ and dimension 2=d₅ | Finite weight pieces use finite alphabets | Reuse supplied duality degreewise in PS.9.13 |
| Coordinate ind-algebra and finite pieces | Length bounds n=0,1,2 | Dimensions 1,3,7; 0⧢0=2·00∉C_≤1 but ∈C_≤2 | Pieces are not subalgebras | Correct categorical type |
| Completed pro-dual and augmentation quotients | n=1,2 | In dual C_≤1, generator square=0; in dual C_≤2, generator square=00≠0 | Truncated concatenation, not shuffle | Reserve pro-object for dual system |
| Torsor composition pullback | Word 01, unit paths on left/right | Three-cut expression; counit leaves 01 in either direction | Endpoint coordinate maps typed | State Π_(a,b)×Π_(b,c)→Π_(a,c) |
| Brown coordinate realization and evaluation | ∅ and reversed word for [2,1] | dch(∅)=1; I(0;110;1)=ζ(2,1)=ζ(3) | Direct coordinate union has right values | Clarify S is de Rham realization |
| legendreRadicand | (λ,u)=(1/2,0),(1/2,1),(1,1) | D=1,2,0 from both polynomial forms | Exact | Definition retained |
| legendreIntegrand | Same first two points; λ=1,u=1 | f=2,√2; total value at radicand 0 is 0 | Singular analytic endpoint excluded | Definition retained |
| legendreK | λ=0,1/2 | Integral π/2 and ≈1.854074677301; canonical modulus values agree | Exact identity/approximate control | Label signature adapter |
| legendreMidpoint | λ=1/2,N=0,1; λ=0,N=1 | 0,8/√17≈1.940285000291; 8/5 | Positive-panel premise essential | Definition retained |
| legendre_substitution | λ=1/4,1/2 | Original and transformed integrals ≈1.685750354813 and ≈1.854074677301 respectively | Agreement to 12 decimal places | Statement unchanged |
| legendre_midpoint_error | λ=1/2,N=1; λ=1/4,N=1 | Errors ≈0.086210322989≤4√2≈5.656854; ≈0.059992767075≤16/(3√3)≈3.079201 | Bounds hold | Statement unchanged |
| quarticA | n=0,1,2 | 1,24,2520 from factorial quotient | Exact | Retained |
| quarticG | n=0,1,2 | 0,104,12276 using H₀=0,H₄=25/12 | Exact | Retained |
| quarticW0 | z=0, first coefficients | w₀(0)=1; coefficients 1,24,2520 | Empty/positive powers agree | Retained |
| quartic_symmetric_square | z=0 and coefficients z,z² | Both constant 1; square coefficients 24 and 2·1188+12²=2520 | First two nonconstant coefficients agree | Retained |
| quarticMirrorCoordinate | Coefficients through z³ | q=z+104z²+15188z³; 15188=12276−24·104+104²/2 | Exact | Retained |
| quarticMirror_integral | Inverse through z³ | g=z−104z²+6444z³; q(g) and g(q) have coefficients 1,0,0 | Both compositional directions tested | Retained |
| dworkSeries | p=0,1,2; terms through z² | Total p=0 gives exp z; p=1 gives exp(2z); p=2 gives 1+z+z²+… | Prime theorems do not admit junk p=0,1 | Retained |
| dworkCoeff | p=2,3; n=1,2,3 | p=2:1,1,2/3; p=3:1,1/2,1/2 | Different small primes preserved | Retained |
| dworkPairWeight | n=0,1,2,3,4,5 | 0,0,0,1/2,1,35/24 | Strict pair count correct | Retained |
| dworkSigma0_summable | p=2,3; first terms and valuation bound | n=1,2 terms: (1,1),(1,1/2); lower-bound slopes (p−1)/p²=1/4,2/9>0 | Includes 2 and 3 | Retained Fact p.Prime |
| dworkSigma2_summable | p=2,3; n=1,2,3 | First two terms 0,0; third 2/3 and 1/2; harmonic valuation loss ≤2log_p n leaves slopes 1/4,2/9 | Vanishing initial weights and convergence slope agree | Retained Fact p.Prime |
| PositiveIndex | [],[1],[0] | Predicate values true,true,false | Zero entry excluded | Retained |
| Admissible | [],[1],[2,1],[0] | true,false,true,false | First-entry and positivity conditions independent | Retained |
| DescendingTuple | Empty, [2,1] | Empty has one tuple; (3,2) allowed, (2,3),(2,0) excluded | Positive descending convention fixed | Retained |
| mzvTerm | Empty tuple; [2,1] at (3,2),(3,1) | 1;1/18,1/9 | Denominator and ordering agree | Retained |
| multipleZeta | [],[2],[1] | 1,π²/6; [1] divergent analytically, total nonsummable tsum=0 | Total-value convention separated | Retained |
| mzv_summable_iff | [],[1],[2],[2,1] | (summable,admissible)=(1,1),(0,0),(1,1),(1,1) | Both directions tested | Retained positivity premise |
| mzv_allTwo | m=0,1,2 | 1=π⁰/1!; ζ(2)=π²/6; ζ(2,2)=π⁴/120 | Empty case and factorial agree | Retained |
| mzvEncode | [],[1],[2,1],[0] | ∅,1,011,1; [0] collides with [1] | Bijection needs positive indices | Retained |
| mzvDecodeAux | (c,w)=(1,1),(0,00),(0,001101) | [2],[],[3,1,2] | Pending zeros/trailing zeros distinguished | Retained |
| mzvDecode | ∅,0,01,011 | [],[],[2],[2,1] | Carrier restriction necessary | Retained |
| shuffles | ∅ with 01; 0 with 0; 01 with 01 | [01]; two copies 00; four 0011 and two 0101 | Empty unit and multiplicities agree with supplier | Specialize α to Bool |
| stuffles | [] with [2]; [2] with [2] | [[2]]; [[2,2],[2,2],[4]] | Merge term retained | Retained |
| mzv_stuffle | k=l=[2]; k=[] | π⁴/36=2π⁴/120+π⁴/90; 1·ζ(l)=ζ(l) | Product and unit agree | Retained |
| mzv_shuffle | k=l=[2]; k=[] | π⁴/36=4π⁴/360+2π⁴/120; 1·ζ(l)=ζ(l) | Multiplicities essential | Retained |
| zagierCoeff | (a,b)=(0,0),(0,1),(1,0) | Coefficients [1],[3,−11/2],[−2,9/2] | Descending-word reversal correct | Retained |
| oneThree | (a,b)=(0,0),(1,0),(0,1) | [3],[2,3],[3,2] | Leading/trailing two blocks distinguished | Retained |
| zagier_evaluation | a=b=0; total two-count 1 | ζ(3)=1·ζ(3)·1; ζ(3,2)=3ζ(3)ζ(2)−11ζ(5)/2, ζ(2,3)=−2ζ(3)ζ(2)+9ζ(5)/2 | No off-by-one subtraction | Retained |
| IsHoffman | [],[2,3],[1],[0] | true,true,false,false | Positive alphabet forced | Retained |
| hoffmanDim | N=0,…,8 | 1,0,1,1,1,2,2,3,4 | Recurrence and empty word agree | Retained |
| numerical_spanning | k=[],[2,1] | 1 spans empty weight; ζ(2,1)=ζ(3) with Hoffman coefficient 1 | Weight preserved | Retained |
| mzv_span_finrank_le | N=0,1,2 | Finite spans: ℚ·1,0,ℚ·ζ(2); dimensions 1,0,1 equal d₀,d₁,d₂ | Finite-dimensional conjunct necessary | Retained |

## Build and gate

`lake build TauCetiRoadmap.PeriodsAndSpecialValues.Suggested` exited 0, with 13 expected warnings for admitted headline proofs and no errors:

```text
Build completed successfully (8976 jobs).
```

The post-commit gate exited 0 on commit a8421e8c; the working tree is clean and no push was made.

```text
gate PeriodsAndSpecialValues: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The required dependency-direction check exited 0 with no UPWARD or CYCLE line:

```text
depcheck: 47 roadmaps, 541 edges, 0 problem(s)
```
