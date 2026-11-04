## H01 (CBirkbeck) — applied

The complex twist η⁻¹χ_φ⁻¹ω⁻ᵐ is replaced by η⁻¹χ_φωᵐ in `TauCetiRoadmap/ModularIwasawaMainConjectures/README.md:299`, deriving the integrand, primitive conductor, Gauss sum, fixed period sign and signed supplier normalization from ModularSymbolsPadicLFunctions §2.5, and matching its §4.3 deletion operator and the elliptic comparison at line 1162. The nonquadratic, tame-cancellation, imprimitive-Gauss and Euler-factor checks at lines 348–351 distinguish the two twists; Skinner line 515 does print the former display, whereas Colmez line 192 supports the inverse-character evaluation used here.

## H02 (CBirkbeck) — applied differently

The signed dual X^i is changed from the scalar dual to its contragredient twist at `TauCetiRoadmap/ModularIwasawaMainConjectures/README.md:601`, making the natural Poitou–Tate sequence linear; lines 41, 622, 642 and 676 explicitly identify its scalar target and the inverse tame label, and transport the analytic ideal through Γ-inversion, as required by LLZ line 2522 and Corollary 6.6 at line 2537. The convention is propagated to §§4.3–4.5 and 6.3, including the coefficient twist η rather than η⁻¹ for descent at line 1604, with non-self-inverse tame and nontrivial Γ-action checks at lines 635–636, 671 and 1625.

## H03 (CBirkbeck) — answered

The dependency description must list both complete proposed prerequisites, conditional on publication of their specifications and implementation, in the order PadicFamilies and arithmetic foundations → KatoEulerSystems → AutomorphicCongruences → ModularIwasawaMainConjectures; `TauCetiRoadmap/ModularIwasawaMainConjectures/README.md:9` already states this, and the missing owner specifications still prevent verification of their full transitive contracts. The requested PR-description correction remains for the worker because PR text is outside the authorized edits; the claim that every other named roadmap is a consumer must be qualified accordingly.

## Mathematical verification

The following computations cover the changed statements and conventions, their dependent signed formulations, and the four retained Lean declarations. They are checks of the statements and normalization adapters; the arithmetic theorems retain their cited source hypotheses.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
|---|---|---|---|---|
| §0.4 character dictionary χ_φ | p=7, φ(γ)=ζ₇, x=8 | φ(⟨8⟩)=ζ₇=χ_φ⁻¹(8); χ_φ(8)=ζ₇⁻¹≠ζ₇ | Direct pullback fixes inversion | Corrected complex character |
| §0.4 weighted integrand θ and complex twist ψ | η=1,m=0; η=ω,m=1 | θ=χ_φ⁻¹ and ψ=χ_φ in both cases; θψ=1 | Same inverse-twist rule on both branches | Replaced η⁻¹χ_φ⁻¹ω⁻ᵐ |
| §0.4 primitive conductor | φ of order 7; φ=1 with η=ω,m=1 | First conductor 49 on each inverse character; second conductor 1 on both θ and ψ | Tame cancellation changes n from 2 to 0 | Defined n from θ and ψ |
| §0.4 fixed period sign | η=1,m=0,1; η=ω,m=1 | Parity products 1·1=1, (−1)(−1)=1, 1·(−1)=−1, respectively | Sign equals η(−1) | Derived sign from integrand |
| §0.4 good ordinary ramified prefactor | Primitive wild characters modulo 49, m=0,1,2 | After removing the common α⁻², factorial and period, the two prefactors are 49ᵐsG(θ)/(2πi)ᵐ and 49ᵐ⁺¹/((−2πi)ᵐG(θ⁻¹)); their differences have absolute value below 10⁻⁹ | Gauss conversion agrees | Derived Gauss and conductor factors |
| §0.4 good ordinary unramified prefactor | n=0,k=2,m=0; k=6,m=1 | Euler factors (1−α⁻¹)² and (1−7/α)(1−343/α); sign conversion differences 0 at m=0,1,2 | Two good-prime factors retained | Kept unramified branch separate |
| §0.4 multiplicative prefactors | α=1 and α=−1, n=0; n=2 | Values 0 and 2 at n=0; ramified coefficient 49α⁻²=49 for both signs | One unramified factor, with split trivial zero | Retained weight-two multiplicative range |
| §0.4 Gauss reciprocity | All nontrivial characters modulo 7; primitive wild and mixed characters modulo 49 | Products G(θ)G(θ⁻¹)=7 or −7 at modulus 7; 49 or −49 at modulus 49, according to θ(−1) | Computed products agree with θ(−1)pⁿ | Added explicit Gauss conversion |
| §0.4 denominator nonvanishing | Quadratic character modulo 7, inflated to 49 | Primitive product −7≠0; inflated modulus-49 Gauss sum has absolute value below 10⁻¹² | Inflated conductor would produce division by zero | Added negative-control Check |
| §0.4 supplier sign adapter | Supplier period −P/2, s=±1 | Raw coefficient −2G(θ); multiplication by −s/2 gives sG(θ), for s=1 and s=−1 separately | Same scalar works throughout each sign component | Specified sign-dependent adapter |
| §0.4 integral normalization | p=3,7; s=±1 | Adapter scalars ±1/2 have p-adic valuation 0 in both cases | Adapter preserves integral lattices for odd p | No dyadic unit assertion added |
| §0.4 P versus Ω denominator | m=0,1 | (−2πi)Ω=P and (−2πi)²Ω=(−2πi)P | Differential and cohomological displays agree | Made both versions explicit |
| §0.4 trivial-branch Euler deletion | E=11a1,p=7,ℓ=2 | At r=1 both factors are 5/2; algebraic test r=2 gives A=13/8 and opposite-twist B=5 | Trivial evaluation misses the error | Added nonquadratic witness |
| §0.4 nontrivial-character Euler identity | Nontrivial odd 7-power root r; also rational identity test r=2 | 2r²(A−B)=−(r−1)(r+1)³; at r=2 both sides are −27 | Nonzero since r≠±1 | Matched group-ring and complex twists |
| §0.4 γ₂ generator witness | p=7 | 2⁶=64≡15 modulo 49, and (64−1)/7=9≡2 modulo 7 | Principal-unit logarithm has valuation 1 | Included generator test |
| §0.4 tame Euler deletion | η=ω,m=1,φ=1 | η(ω(ℓ))⁻¹κ(γ_ℓ)⁻¹=ω(ℓ)⁻¹⟨ℓ⟩⁻¹=ℓ⁻¹; including the outer ℓ⁻¹ gives ℓ⁻² | Equals ψ(ℓ)ℓ⁻² with ψ=1 | Stated weighted deletion factor |
| §0.4 independent period scaling | Plus-period scale 2, minus-period scale 3 | η even gives L/2; η odd gives L/3; the unused sign contributes factor 1 | Branch signs remain independent | Retained existing scalar contract |
| §3.2 elliptic comparison | Weight two, φ of order 7 and conductor 49 | Both functions use 49α⁻²L(E,φ⁻¹,1)/G(φ⁻¹); denominators P_f⁺ and Ω_E⁺ give ratio P_f⁺/Ω_E⁺ | Scalar independent of φ | Added nonquadratic comparison Check |
| Conventions and §0.11 signed dual | Discrete F₇-line with δ acting by 2 | Scalar action 2, contragredient action 4, product 2·4=1 | Distinguishes the two duals | Signed X^i now contragredient |
| §0.11 local Tate equivariance | Compact action 4, discrete action 2, c=s=1 | ⟨δc,s⟩=4=⟨c,δ⁻¹s⟩; scalar δΦ(c) instead gives 2 | Natural map is linear into the contragredient dual | Explicit action adapter |
| §0.11 tame indexing | η(δ)=4, η⁻¹(δ)=2 | Contragredient η-projector gives 1 on the action-4 line and 0 on action 2; scalar η⁻¹-projector gives 1 on action 2 | Inverse labels required | Stated component equivalence |
| §0.11 Γ-inversion with η=1 | S=Z/49, γ=8, paired γ=43 | 8·43≡1 and 8⁷≡1 modulo 49; both invariant-pairing values are 43, scalar γ-value is 8 | Γ-inversion survives trivial tame projection | Added separate Γ-action witness |
| §0.11 Poitou–Tate zero case | All four modules zero | Every map has image 0 and kernel 0; scalar and contragredient zero modules both remain 0 | Exactness unaffected by convention | Native compact actions retained |
| §0.12 ideal transport | R=Z₇[[X]], scalar R/(X−7) | ι(X−7)=−(8X+7)/(1+X), associated to X+7/8; at X=7 the old and new generators are 0 and 63/8 | Untwisted scalar ideal is different | Added scalar SMC formula |
| §0.12 involution in both directions | X-coordinates 0,7,−7/8 | 0→0→0; 7→−7/8→7; −7/8→7→−7/8 | Applying transport twice restores the original ideal | Equality is an equivalence |
| §0.12 degenerate ideal witness | Scalar R/(X) | ι(X)=−X/(1+X), hence both ideals are (X) | This example alone cannot detect omitted inversion | Added nonzero-root negative control |
| §0.12 actual-image quotient | I=XR,L=X²; I=7R,L=7X | Quotients are R/(X), with length 1 at (X); replacing I by R gives length 2 in the first case and μ=1 in the second instead of μ=0 | Image correction survives either dual convention | Retained actual image in transported equality |
| §0.13 KMC/SMC exact-sequence equivalence | Height-one lengths a=2,b=3,c=2,d=1 in 0→A→B→C→D→0 | a+c=4=b+d; a=d is false and b=c is false; a=d=2,b=c=3 gives 5=5 and both equalities true | Both directions agree with length additivity | Contragredient component used in sequence |
| §0.13 rational passage | I=7R,L=7X | Over R the corrected quotient is R/(X); after inverting 7 it is R[1/7]/(X), and ι preserves 7 | Involution commutes with rationalization | No change to hypothesis (E) or rational range |
| §§2.3 and 4.3 signed consequences | η=1, scalar root 7 | Contragredient root is −7/8; inverse ideal transport returns root 7 | No same-ideal scalar assertion survives without transport | Propagated signed convention |
| §4.4 principal simplification | I=R,L=X−7 | Natural principal ideal is (X−7), scalar principal ideal is (X+7/8) | Surjectivity does not remove inversion | Inherits explicit §0.12 adapter |
| §4.5 Kobayashi quotient comparison | Multiplier a=7, I=R,L=X | Multiplication identifies R/XR with 7R/7XR; ambient principal generators X and 7X have μ=0 and 1 | Quotient comparison needs no ambient integral unit | Retained image-lattice comparison and dual convention |
| §4.5 tame descent | Discrete δ=2, η(δ)=4 | Twist by η gives 2·4=1 and a one-dimensional invariant line; twist by η⁻¹ gives 2·2=4 and zero invariants | Contragredient η-label needs coefficient twist η | Corrected descent direction |
| §4.5 trivial-tame descent | δ=1, η=1, p=5 | Averaging scalar (1+1+1+1)/4=1; on a nontrivial fourth-root character the sum is 0 | Descent selects precisely the trivial discrete component | Γ-action still transported |
| §6.3 downstream scalar formulation | η=1,L=X−7; L=X | Scalar ideals become (X+7/8) and (X), respectively | First example detects omitted inversion; second does not | Explicit scalar Pollack form |
| HasRankOneCoinvariants | u=[[1,1],[0,1]], u=id, and zero module | Quotients O, O² and 0 respectively; over the zero ring the last equivalence is 0≃0 | Definition distinguishes the intended free line | Lean unchanged |
| hasRankOneCoinvariants_of_unipotent | Upper-right 1 and ϖ; O=F₂[[t]] | Quotients O and O/(ϖ)⊕O; in equal characteristic two these are O and F₂⊕O | Primitive-image hypothesis excludes torsion | Lean unchanged |
| sl2Zp_closedSubgroup_eq_top | Determinant-one lifts of [[1,1],[0,1]] at p=5 and p=3 | All 125 lifts modulo 25 have fifth power [[1,5],[0,1]]; at p=3 the 27 lifts split into 9 each with upper-right entries 0,3,6 after cubing | p≥5 restriction retained | Lean unchanged |
| tateParameter_transcendental_of_isAlgebraic_j | q=0, q=1, q=2 at p=2 | q=0 has norm 0 but is not a unit; q=1 has norm 1; q=2 has norm 1/2 and j-leading-term valuation −1 | Zero and boundary excluded; dyadic interior allowed | Lean unchanged |

No added arithmetic assertion is quantified over unrelated free data. The zero-cohomology cases, primitive conductor 1, both multiplicative signs, the equal-characteristic-two DVR and the p=2 boundary of the Tate-parameter statement were kept distinct from the odd-prime signed range. The Gauss computations used the actual finite sums; the polynomial and congruence identities used exact rational or modular arithmetic.

## Ownership, citations and Lean signatures

Ownership was searched by object in main, the board packages and open-roadmap contents, including the supplied PadicHodgeRegulators, OverconvergentAutomorphicForms, AdmissiblePairsAndPadicHodgeStructures and GrossZagierAndArithmeticHeights heads. The generic measure/interpolation/depletion constructions remain in ModularSymbolsPadicLFunctions §§1.1–1.3, 2.5 and 4.3, generic duality remains in SelmerIwasawaCohomology §§2.10 and 3.12, and linear Coleman maps and their kernels remain in PadicHodgeRegulators §§9.12 and 9.30; that roadmap expressly excludes global signed Selmer constructions. Only modular normalization and global signed formulation adapters are repaired here, with no new generic owner or Lean declaration.

The citation inventory was resolved again; its only absent owners remain the expressly proposed KatoEulerSystems §2.2 and AutomorphicCongruences §4.5 contracts. Their specifications could not be inspected and their transitive ownership is not certified. The inspected supplier sections agree with their open heads; main advanced from 1ce5c4f0 to e98875db only by HeegaardFloer status/progress changes, so that advance changes none of these mathematical supplier specifications. No supplier is moved to a later roadmap and no new source is required. The settled uncertified and waived citations remain settled.

The pins remain Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The existing algebraic dual instance in `TauCeti/NumberTheory/Padics/GroupAlgebra/Transpose.lean:70` is an opposite-group-ring module by precomposition, not a replacement for the continuous global Selmer adapter; Mathlib's invariant submodule in `Mathlib/RepresentationTheory/Invariants.lean:73` imposes pointwise fixedness, without continuity hypotheses. Neither is redeclared.

All four declarations in `TauCetiRoadmap/ModularIwasawaMainConjectures/Suggested.lean` were elaborated together with `#check @name` and compared to §§0.8, 3.6 and 3.7. The predicate retains its ring, additive-group and module binders; the unipotent theorem retains the domain/DVR, square-zero and primitive-image hypotheses; the lifting theorem retains primality, p≥5, closedness and residual surjectivity; and the Tate-parameter theorem retains primality, the unit carrier, strict norm bound and algebraic-j hypothesis. No binder or declaration changed, and the missing signed/analytic carriers remain identified in the module docstring rather than encoded by stand-ins.

## Validation

Commit: ce652acb — ModularIwasawaMainConjectures: review repairs (interpolation characters and signed duality). Only `TauCetiRoadmap/ModularIwasawaMainConjectures/README.md` changed; the worktree is clean and nothing was pushed.

Build command: `lake build TauCetiRoadmap.ModularIwasawaMainConjectures.Suggested`.

Exact build outcome: `Build completed successfully (8983 jobs).` Exit status 0; the three expected `sorry` warnings are at `TauCetiRoadmap/ModularIwasawaMainConjectures/Suggested.lean:50`, line 62 and line 72. The separate four-signature elaboration also exited 0.

Dependency-direction output:

```text
depcheck: 51 roadmaps, 582 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line was emitted. The first pre-commit gate found unquoted grouped mathematical indices and the dirty worktree; the indices were formatted as inline code and the authorized repairs committed before the successful final run.

Exact final gate summary, exit status 0:

```text
gate ModularIwasawaMainConjectures: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
