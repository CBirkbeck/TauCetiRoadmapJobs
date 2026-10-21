# Repair report: QSeriesPartitionsAndMockModularForms

## F01 (P2) — applied

Three-prime offset/extraction domain → every positive modulus coprime to 24, with arbitrary divisibility reduction and all coprime-base power specializations. Added `IsPartitionCongruenceOffset`, existence/uniqueness and reduction signatures, and two proved-example blocks covering valid and invalid moduli. Added modulus-one, thirteen and composite-reduction Checks. Section 4.9 retains exactly its three-prime divisibilities.

Evidence: BevilacquaChandranChoi2019 line 39 introduces the bounded inverse; BevilacquaChandranChoi2019 line 42 through line 44 restrict the divisibility conclusions. The general extension follows directly: 24 is a unit modulo M when gcd(24,M)=1; its inverse has one representative in [0,M). Reduction modulo a positive divisor N preserves the inverse equation. Uniqueness follows by cancellation of that unit, then equality of bounded representatives. At M=1 the representative is 0. At M=13 it is 6 because 24·6=11·13+1. At M=65 it is 19, reducing to 6 modulo 13. Moduli 2 and 3 cannot divide 24d−1.

Pinned evidence: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, `Mathlib/Data/ZMod/Basic.lean`, `ZMod.coe_mul_inv_eq_one`, `ZMod.val_lt` and `ZMod.natCast_zmod_val`. The README consumes this generic inverse machinery; its kept target is the inverse-of-24 bounded adapter and partition extraction, rather than another generic modular-inverse theory. The predicate reduction signature needs only N>0, N∣M and the actual bounded-inverse predicate; coprimality need not be repeated there.

## F02 (P2) — applied

Unqualified power correction for constant shadows → named `mockModularForm_zeroFrequency` with separate Weil, height-one and weight-one formulas. Specified the holomorphic constant adjustment between the first two. Preserved weight-one mock objects and k≠1 surjectivity. Combined ξ₁(log y)=1 and ξ₁(1)=0 into an existing `maassXi` example block.

Evidence: BruinierFunke2003 line 366 excludes k=1 from its theorems; BruinierFunke2003 line 396 and line 421 through line 438 give the power zero mode and its splitting for k≠1. Directly on y>0, ξ_kF=i y^k conjugate(F′(y)i)=y^k conjugate(F′(y)). Thus the two corrections with coefficient conjugate(g₀)/(1−k) have ξ-image g₀, and conjugate(g₀)log y has ξ₁-image g₀. The difference of the two k≠1 corrections is conjugate(g₀)/(1−k); passing to height-one normalization therefore adds this constant to h. At k=1 the power y⁰ is constant and has zero ξ-image. The scalar law is explicitly confined to translation-fixed components; Jordan blocks keep §8.4a’s matrix primitive.

Pinned evidence: `HasFDerivAt.log` and `Real.hasDerivAt_log` in `Mathlib/Analysis/SpecialFunctions/Log/Deriv.lean`, and `Complex.imCLM`/`Complex.ofRealCLM` in `Mathlib/Analysis/Complex/Basic.lean`, read at the Mathlib pin. The logarithmic example uses the actual Fréchet derivative and the explicit positive-height hypothesis. It contains no admission. Compiler execution remains unavailable.

## F03 (P3) — applied

Andrews Theorems 3–4, pp. 117–118 → pp. 118–119 in README §10.3a, the references, and the existing source-manifest entry. Retained the theorem numbers and line locators 241 and 266.

Evidence: Andrews1986 line 212 identifies printed p. 118, and Andrews1986 line 241 starts Theorem 3. Andrews1986 line 246 identifies printed p. 119, and Andrews1986 line 266 starts Theorem 4. Both README punctuation variants of the erroneous range are corrected.

## F04 (P3) — applied

Descriptive public-law labels → stable backticked identifiers in all 69 public-law paragraphs. Named the six supporting bilateral-term and partition-predicate laws and the existing objects at their defining paragraphs. Mathematical sentences, domains and source locators are preserved. Updated internal references to `rankCrankDissections_thetaAddition` and `etaDecimationModules_basis`; no non-headline Lean catalogue was added.

Evidence: the quotient laws now use `qPochhammerRatio_zero`, `qPochhammerRatio_neg_one`, `qPochhammerRatio_agrees`, and `qPochhammerRatio_step`. The partition predicates use `isGapTwo_iff_adjacent`, `isGapTwo_nodup`, and `isPlusMinusOneMod5_iff_restricted`. The operator, harmonic and mock laws have the same explicit mathematical statements with identifiers. Existing Lean names, including the bilateral and counting headlines, were preserved. This is naming of the existing API, not additional mathematical targets or supplier claims.

## F05 (P3) — applied

Section 8.5’s local dependencies §§8.3–8.4 → §§8.3–8.4a, explicitly adding the general-parabolic Fourier construction. The full-group source attribution and the finite-index proof distinction are unchanged.

Evidence: §8.4a constructs the width-dependent Fourier decomposition and its finite-order semisimple specialization; §8.5 explicitly uses that argument at every cusp. BruinierFunke2003 line 383 fixes the source’s full-group abbreviation. The added local edge points to an earlier subsection and introduces no external supplier or cycle.

## Adversarial mathematics pass

The rows cover each subsection’s definitions, identities, public laws and conventions. These are direct algebraic, differential and boundary checks; they do not claim completed proofs of the roadmap’s analytic or valuation theorems. The source passages needed for the five findings were read directly. Numerical offset checks were also executed independently of Lean.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| §1.1 finite products and transport | n=0,1,2; q=0,1; zero ring; identity ring map | P₂=(1−a)(1−aq); empty product is 1, including 1=0 | API identifiers |
| §1.2 integer products | a=3,q=2,index −1; a=q=2 | First gives −2; second has a forbidden reciprocal factor | API/object identifiers |
| §1.3 regular quotient | A=[3], B=[1] or [2], q=2,index −1 | −1 or 0; the latter does not require an individual denominator Pochhammer | API/object identifiers |
| §1.4 formal products | a=0,1; degrees 0–2; characteristic 2 and zero ring | Positive tail at a=0 is 1; full product at a=1 is 0; unit criterion uses constant coefficient | API identifiers |
| §1.5 concatenation/inversion | n=0,2; units a,q; a=0 in ℤ | Triangular exponent is 1 at n=2; a=0 cannot enter inverse-base law | None |
| §1.6 finite-prefix limits | q=0; a=q⁻¹ with 0<abs(q)<1 | Value 1−a; zero tail cannot be divided out | None |
| §2.1 unilateral coefficients | Empty lists; A=[1]; B=[1] | Empty-list c₁=−1/(1−q); termination precedes subsequent undefined quotients | API/object identifiers |
| §2.2 bilateral coefficients | j=−1; B=[q]; z=0 | Negative term has reciprocal z; B=[q] stops negative tail; z=0 excluded | API/object identifiers |
| §2.3 convergence/inversion | q=2,a=−1/2 or 1/2; A=[],B=[0] | Radius 4 versus finite polynomial; negative-tail exponent is n(n+1)/2 | API identifiers |
| §2.4 binomial/Euler | q=0; a=0; q=1/2, degrees ≤2 | Binomial (1−az)/(1−z); entire Euler 1+z at q=0; inverse series begins 1+2z+8z²/3 | API identifier |
| §2.5 1ψ1 coefficient/sum | j=0,−1; a=2,q=z=1/2,b=0 or q; a=b | Terms 1, then −2/3 or 0; a=b gives empty annulus | Supporting API identifiers |
| §2.6 Bailey pairs | Zero pair; delta pair at a=q=0; n=0,1 | β₀=α₀; β₁ uses n+r in the second denominator | API identifiers |
| §2.7 transforms/limits | Zero pair; a=q=0; ρ₁=aq≠0 | Linearity retained; forbidden ρ₁ causes denominator zero at n=1 | API identifiers |
| §3.1 Gaussian polynomial | n=0,2; k=−1,n+1; Q=−1,1 | Out-of-range terms zero; G(2,1)=1+Q even where a quotient would be 0/0 | API/object identifiers |
| §3.2 finite Schur | n=0,1,2 | Initial values 1; n=2 gives 1+Q and 1+Q² with signed floor indices | API identifiers |
| §3.3 gap/residue predicates and Rogers–Ramanujan | Empty partition; (4),(3,1),(2,2); minimum part 2; q=0 | Gap accepts first two, residue ±1 accepts only (4); both counts include empty partition; analytic values 1 | API identifiers |
| §3.4 quintuple product | z=1,−1; n=0,±1; q,z=0 guards | At z=1 begins 2−2q−2q²; z=−1 cancels; bilateral zero guards retained | API identifier |
| §3.5 ordinary adapter | n=0,1,2,4; reduction mod 2 | Counts 1,1,2,5; constant coefficient survives scalar change | API/object identifiers |
| §4.1 rank/crank | Empty; (1); (3,2,1,1); (3,3) and conjugate | Empty 0; singleton rank 0/crank −1; strict-filter crank −1; conjugate ranks ±1 | API identifiers |
| §4.2 vector partitions | n=0,1; exchange last two factors | V₀=1; V₁=z+z⁻¹−1; weight unchanged, statistic negated | API/object identifiers |
| §4.3 rank/crank series | n=0,1; z=−1 | Ordinary crank correction (1−z)X gives singleton z⁻¹; rank specialization is f | API identifiers |
| §4.4 residue filters | t=1,2; constant-zero statistic; characteristic dividing t | One residue counts all; zero statistic has empty class 1 modulo 2; multiplied filter avoids division | API identifiers |
| §4.4a dissections | Constant term of theta addition; size 1; size 6 rank modulo 11 | Theta constant identity has factor a/b and minus sign; V at size 1 is nonzero; rank-1 size-6 fiber has two members | API identifiers/reference |
| §4.5 equidistributions | Sizes 4,5,6; rank modulo 11 at size 6 | Crank class sizes 1 in base progressions; rank eleven analogue fails | API identifier |
| §4.6 bounded offsets/extractions | M=0,1,2,3,5,7,11,13,25,65,169,343; all positive divisors of valid listed moduli | Unique offsets 0,4,5,6,6,24,19,162,243 for valid moduli; reductions agree; invalid bounded fibers empty | F01: general domain, signatures and Checks |
| §4.7 decimation | t=1,2; X,X²; zero semiring | U₂X=0, U₂X²=X; linearity holds, multiplicativity fails; pullout requires t≠0 | API identifiers |
| §4.8 alternating eta extractions | First two five-steps; first eleven-step | Offsets 4,24; odd/even Euler factors differ; U₁₁φ starts 11X | API identifiers |
| §4.8a integral eta modules | First seven-step; nonprimitive spans; level-eleven leading term | Dividing first seven-step by 7 leaves b₇ coefficient 7, below O₇’s required 49; no every-step gain asserted | API identifiers/reference; valuation inductions remain targets |
| §4.9 prime powers | r=1,3; ℓ=5,7,11 | Seven exponent at r=3 is 2, not 3; no divisibility inferred for ℓ=13 | API identifiers only; arithmetic scope retained |
| §5.1 odd theta | ν=±1/2; z=0,1/2; τ=i | Central pair fixes i and derivative sign −2π; zero divisor excludes the half period | API/object identifiers |
| §5.2 eta multiplier | Identity,S,T,−I; changed root lift | Factor at S,i is 1; multiplier relative to sqrt(τ) is exp(−πi/4); −I multiplier −i | API/object identifiers |
| §5.3 smoothing | x=0; positive/negative real x | β(0)=1, E′(0)=2; sign alone misses smoothing | API/object identifiers |
| §5.4 Mordell integral | z=±1/2,τ=i; z=0 | Shift and evenness give h=1 at the half points; h(0;i)>0 | API/object identifiers |
| §5.5 R correction | u=0; ν=±1/2; u↦u+1; y=0 | Pair is even and changes sign under unit shift; y=0 excluded | API/object identifiers |
| §5.6 μ | u→0; u↦u+1; v outside lattice | Residue −1/(2πiϑ(v)); unit shift negates; pole is not a value | API/object identifiers |
| §5.7 completed μ | S-defect; unit/τ and simultaneous τ shifts | h/(2i)+(i/2)h=0; simultaneous shift fixes completion | API/object identifiers |
| §6.1 unary theta/correction | a=b=0; a=1/6; scale d=1,3 | Zero characteristic sum cancels; nonzero leading coefficient 1/6; scaled ξ factor −sqrt(2d) | API/object identifiers |
| §6.2 periods | a=b=0; endpoint a=1/2 | Central integrand uses g(1/2,1/2); endpoint requires crossing term | API identifiers |
| §6.3 torsion completions | Unit characteristic shift; order 2; zero characteristic | Unit shift negates; order-two points pole-free; zero characteristic excluded without cancellation | API/object identifiers |
| §7.1 cone data | Hyperbolic plane; rank-one [−2]; opposite boundary ray | Two boundary representatives allowed; rank one has no nonzero isotropic vector; opposite component rejected | API/object identifiers |
| §7.2 ordered theta | Equal cones; hyperbolic ν=(1/2,±1/2) | Equal kernel zero; boundary kernels 2 and 0; order reversal negates | API/object identifiers |
| §7.3 boundary convergence | Equal negative rays; hyperbolic boundary pair | Dependent-ray Q⁺ denominator unavailable; boundary Q⁺=0 is outside positive-definiteness assertion | API identifiers |
| §7.4 transformations | Hyperbolic plane; odd diag(1,−1); inadmissible b | S-prefactor τ in hyperbolic rank 2; odd half-diagonal shift retained; boundary b guard necessary | API identifiers |
| §7.5 correction factorization | A=[−2],c=1 or 2,a=1/4,b=0 | Negative sign fixed by Q(c)<0; c=2 requires two cosets, not one | API identifiers |
| §8.1 automorphic spaces | Constant 1 at weights 0 and odd integral weight; Γ₀(2), cusp S | Weight-zero constant allowed; odd full-group constant fails −I; arbitrary subgroup representation cannot evaluate S | API/object identifiers |
| §8.2 differential operators | 1,y,iy,y²,log y; k=0,1,1/2 | ξ₀y=1, ξ₀iy=−i, ξ₁log y=1, ξ₁1=0; Δ₀y²=−2y²; unitary shift 3/16 | F02 example and Check; API identifiers |
| §8.3 harmonic spaces | Zero; constant 1 at k=0; y² | Zero harmonic; constant has zero shadow but is not cuspidal; y² fails harmonicity | API/object identifiers |
| §8.4 scalar Fourier kernel | k=0; k=1 zero frequency; w<0 | H₀(w)=exp(w); k=1 powers coincide, logarithm independent; real negative-frequency integral has positive integrand | API/object identifiers |
| §8.4a parabolic modes | M=1,i,2; unipotent 2×2 block | Frequencies 0,1/4 and a complex frequency; Jordan holomorphic vector (τ,1); zero mode height-one primitive/logarithm | API identifiers |
| §8.5 Weil Fourier/ξ kernel | Rank zero; lattice ⟨2⟩; polar local mode conjugate(q⁻¹) | Central parity conditional on subgroup; Q(1/2)=1/4; polar shadow 4πq⁻¹ allowed | API identifiers; §8.4a dependency |
| §8.6 exact sequences | Zero target; trivial discriminant; scalar multiplication by i | Zero has zero preimage; compatible scalar theory retained; ξ requires conjugate complex target | API identifiers; k≠1 retained |
| §8.7 specified mock completion | g₀=0,1,i; k=0,1,2; height y=1 | Corrections y versus y−1 at k=0; log y at k=1; k=2 difference −conjugate(g₀); all height-one corrections vanish at y=1 | F02 zero-frequency law and normalization |
| §9.1 theta coordinates | m=1,l=0,1; m=0 | Leading terms 1 and q^(1/4)(e(z)+e(−z)); zero index excluded | API/object identifiers |
| §9.2 meromorphic Jacobi data | Zero datum; positive-index theta; nonzero constant | Zero empty divisor; theta elliptic; nonzero constant fails τ-translation | API/object identifiers |
| §9.3 mixed residues | (1+v+conjugate(v))/v²; conjugate(v)/v; 1/v | Residues 1,0,1; antiholomorphic degree is zero in residue coefficient | API/object identifiers |
| §9.4 polar kernel | λ=0 pole; l=0,m at u=0; mixed cone | Residue −1/(2πi); R_m,0(0)=1, R_m,m(0)=0; cone has one isotropic datum | API/object identifiers |
| §9.5 decomposition | Theta datum; double pole; k=1 | Kronecker-delta coefficients; double pole requires first derivative; coefficient weight 1/2 | API identifiers |
| §10.1 third-order series | q=0; coefficients through q³ | f=1+q−2q²+3q³; ψ has constant 0; ω denominator square retained | API/object identifiers |
| §10.2 third-order vector | S₃²; leading ω terms; first correction | S₃²=I; T exchanges ω arguments; correction −2C gives positive 2sqrt(6)g shadow | API identifiers |
| §10.3 fifth/seventh series | q=0; φ₁(−q)/q; A₁ initial index | χ₁ constant 2−1=1; A₀,A₂ constant 1; A₁ starts q | API/object identifiers |
| §10.3a Hecke equalities | Constant coefficients; φ₁ factor q; 1+2ψ₀ | Corrected normalizations agree with unilateral constants; pair input is on printed pp.118–119 | API identifiers and F03 locator |
| §10.4 cone comparisons | diag(5,−2),c=(2,5); diag(5,−3),c=(3,5) | Q(c)=−15 in both; seventh cone determinant −7 | API identifiers |
| §10.5 fifth-order vectors | F₀−1; opposite corrections; half arguments | Subtraction kills unwanted constant; G₅,₁+G₅,₂=0; unit τ shift exchanges half arguments | API/object identifiers |
| §10.6 fifth-order laws | Sum of the two corrections; first T phase | Sum shadow zero; q^(−1/60) gives phase ζ₆₀⁻¹ | API identifiers; full S identity remains target |
| §10.7 seventh-order vector | Components A₀,A₂,A₁; cone norms | Leading powers −1/168,47/168,143/168; Q(c)=−21/2, B(c₁,c₂)=−28 | API/object identifiers |
| §10.8 seventh-order laws | Third T phase; first S row norm | 143≡−25 modulo 168; sum of the three squared sines is 7/4, fixing row norm | API identifiers |
| §11.1 bilateral rank | q=0; z=1,−1 | Constant 1; removable value ordinary partition series; minus-one denominator 1+qⁿ | API identifiers |
| §11.2 root completions | α=1/2,1/3,0; lower unipotent witness | Third-order correction recovered; order-three separate poles must cancel; trivial root has different weight | API/object identifiers |
| §11.3 residue deviations | t=1,2; nonreal filter coefficients | Empty sum zero; t=2 gives opposite halves; shadow conjugates root-filter coefficients | API identifiers |

Coefficient characteristics, zero ring, empty partitions, identity maps, low rank, q=0 and q=1 were used where the carriers permit them. Field/DVR ramification and inseparable-extension cases do not occur in these statements. Every division in the edited zero-frequency law has either k≠1 or y>0; the offset construction uses an actual unit modulo its positive modulus. No global weight-one surjectivity is inferred from the local logarithmic primitive.

## Checks and maintainer notes

- **Elaborate `Suggested.lean`: not available.** No Lean command was run; no elaborated-type output or compiler-success claim is made. The new example proofs and explicit theorem binders require the worker’s permitted elaboration check.
- **Dependency direction: passed**, exit code 0. Exact output:

    depcheck: 6 roadmaps, 40 edges, 0 problem(s)

  No UPWARD or CYCLE line was produced.
- **Static agreement: passed.** `Suggested.lean` has 672 lines, 16 real-bodied definitions, 55 theorem targets and 28 proved-example blocks. All 71 named declarations occur in the README. No admitted example, sorry'd data, `set_option`, extra Mathlib import or forbidden inspection command occurs. The bounded-offset predicate has two example blocks and seven README Checks; `maassXi` still has two example blocks. Public-law labels in all 69 paragraphs are backticked identifiers; the six supporting API labels are named too.
- **Arithmetic verification: passed.** For M=1,5,7,11,13,25,65,169,343, direct bounded enumeration gave the offsets in the table, and reduction along every positive divisor passed. M=0,2,3 gave empty bounded fibers. These finite checks supplement the general unit/cancellation argument; they do not replace it.
- **Sources and manifests: passed.** Both TOML files parse. The 13 certified source entries have their cached texts; no new work was cited or needed. The two waived and three uncertified sources retain their settled statuses. No missing-reference request is required. The Andrews correction changes only locator metadata, not the cached source or its hash.
- **Formatting and edit boundary: passed.** `git diff --check` is clean. Changes are confined to `packages/QSeriesPartitionsAndMockModularForms/README.md`, `packages/QSeriesPartitionsAndMockModularForms/Suggested.lean`, `packages/QSeriesPartitionsAndMockModularForms/sources.toml`, and this report. Metadata and the complete design plan are unchanged. No commit, push, issue, pull-request or comment write was made.
- **Ownership:** read main-branch ComplexTori, ThetaSeries and ModularForms for shape and boundaries, and the named sibling roadmaps for scope. Their cohomological, p-adic integration, q-Witt, progression-power and dynamical objects do not own the bounded partition-extraction or classical mock zero-frequency adapters. Generic residue inversion and logarithm differentiation are imported from the pins. No new supplier edge or ownership move is needed.
- **External supplier gaps remain prerequisites:** `classical-metaplectic-model`, `analytic-elliptic-regularity` and `vector-bundle-dolbeault` still have matching README contracts and top-level design entries naming their respective suppliers and sections. None of these five findings asks this package to discharge them, and no supplier extension is asserted to exist.
- **Consumer consequences:** no existing Lean declaration was removed or renamed. New Lean declarations are `IsPartitionCongruenceOffset`, `partitionCongruenceOffset_existsUnique`, and `partitionCongruenceOffset_mod`. The README’s `partitionCongruenceOffset` construction now takes a general modulus M; δ(ℓ,r) is its power specialization. `partitionCongruenceSeries` likewise has a general modulus interface. The zero-frequency correction law is a named README target; normalization changes require the stated adjustment of the holomorphic constant. The many public-law identifiers name existing statements, without enlarging their mathematical scope.
