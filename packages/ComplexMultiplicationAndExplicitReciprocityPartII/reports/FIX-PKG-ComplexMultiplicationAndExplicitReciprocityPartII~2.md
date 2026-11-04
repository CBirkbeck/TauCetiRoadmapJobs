# Repair report

## F01 (P1) — applied differently

32 mixed records → seven actual supplier gaps. Deleted the 21 legacy proof/edition notes and four contracts supplied by existing targets. Every survivor has slug, needs, supplier and section, with identical README contract text. The brief permits editing the top-level gaps list; its text imposes no add-only restriction. No other part of the plan changed.

## F02 (P2) — applied differently

Local §8.2 → GrossZagierAndArithmeticHeights §7.78; duplicated point construction → its §0a.4. Updated Scope, contracts, §§7.2, 8.1, 8.3 and Layer 7/8 Dependencies. Also deleted the kernel gap: §§6.56, 7.15, 7.65–7.66 and 7.77 already supply its derivative, nonvanishing, full height decomposition and compensated local comparison. Y Theorem 9.3 agrees (Y line 4500).

## F03 (P2) — applied

Bounded-descent gap → PELModuli §§M6.1, M6.8, M6.10 throughout Scope, contracts, §§11.1, 11.3, 12.2, 12.4 and Layer 11/12 Dependencies. Section M6.8 explicitly descends the marked pair over F_m, so the full marked 3-torsion needs no residual gap. Its extension bound is 2·3^(4g²); g=1 gives 162. Removed the plan gap too.

## F04 (P2) — applied

ClassFieldTheory norm gap → IntegralIwasawaTheory §3.4, classNorm_cokernel at n=0. Updated Scope, contracts, §§12.2, 12.4, 12.5 and Layer 12 Dependencies; removed the plan gap. That supplier fixes arbitrary base number fields and full wide class groups. Its n=0 norm cokernel is Gal((L∩H(K))/K), of size at most [L:K].

## F05 (P3) — applied

Orbit tags on torus/model/point/index targets → only §12.4 and its layer dependency. Removed the reduction tag from §13.2. Added the narrow-norm tag to §4.4, bridge tag to §7.3, and étale-order tag to §12.1. Synchronized Layer 4/7/12 Dependencies and added the ramified-component contract to Layer 6 Dependencies, whose §6.4 uses it.

## F06 (P3) — applied

Field/type before constants → g and ε, then a positive constant, then every field/type, in §§10.2–10.3. Distant isogenies retain primitive maximal-order types and every starting A; individual heights retain imprimitive types. T Proposition 2.2 (T line 149) and the averaging proof (T line 206) support these uniform quantifiers. Neither headline has a statable CM carrier at the pins.

## F07 (P3) — applied

Corrected all listed fragments and symbol clashes in §§3.2, 4.2, 6.3–6.5, 7.4 and 13.5. The kernel is Q, the quadratic form is Q, and splitting refers to the quaternion algebra at a finite place. The length assertion now explains that invertible modules over this product of local rings are free, so their partition quotients have the same length.

## F08 (P3) — applied

Vacuous zero-function Check → the C₆ function (0,1,1,0,−1,−1). Its six complementary sums are zero, but its inverse-pair values are 1 and −1. Thus it lies in CM⁰ and outside H_CM; the predicate imposes no value there. Kept this as a README Check, with no Lean padding. The existing §0.1 and worked example agree.

## F09 (P3) — applied

One bundled §4.2 → §§4.2, 4.2a–4.2d: geometric data, Borcherds support, big-CM degree, Hodge height and averaged comparison. Each now has its own exact hypotheses, locator and Needs. Distributed the API and Checks and recomputed the new checks. Updated §4.5, Scope, supplier contracts, Layer 4 Dependencies and source A's locators. Other subsection numbers are unchanged.

## Verification outcomes

- Acceptance elaboration: `packages/ComplexMultiplicationAndExplicitReciprocityPartII/Suggested.lean`, run with `lake env lean` from the pinned content checkout, exited 0. Its only diagnostic was line 45:8, “declaration uses sorry”. No TauCeti import is present, so no module build was needed. Suggested.lean is unchanged: the repaired CM statements still lack their native carriers, as its module docstring explains.
- Signature audit: a scratch copy containing `#check @TauCetiRoadmap.ComplexMultiplicationAndExplicitReciprocityPartII.relative_class_number_growth` elaborated from that same checkout, exit 0. The printed type retains g>0, ε>0, the universe-polymorphic field, NumberField and IsCMField instances, the degree equation, and the positive constant before the field. It equals README §10.1. No binder or Lean name changed. An initial invocation from the board directory failed before elaboration because that directory has no default Lean toolchain; it was rerun from the required content checkout without changing any toolchain.
- Dependency check: exit 0, exact output:

```text
depcheck: 48 roadmaps, 558 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line, and no moved line.

- Citation resolver: checked main 7bd35ba and the index of 352 open heads; no cross-roadmap citation or Lean name was reported missing. The resolver does not inspect this host's pinned Lake packages, so those declarations were checked directly below.
- Structural checks: all seven gaps have exactly slug/needs/supplier/section; supplier and needs equal the matching README contract. A byte comparison with HEAD after masking only the top-level gaps array confirms that every other byte of plan.json is unchanged. Both TOML files parse. Retired gap slugs and local §8.2 references are absent from the README. All 14 layers retain Examples and Dependencies.
- `git diff --check`: exit 0, no whitespace errors. The report has all nine finding headings and 78 rows of computed mathematical checks; all 68 numbered README targets have a corresponding row. No machine paths appear in the deliverables.
- No gate failures were supplied separately in the brief. The requested Lean, signature and dependency checks pass. No commit or external write was made.

## Ownership, sources and pin evidence

Read the main-branch ComplexTori and Rank24LatticeConstructions roadmaps for form. Re-resolved the named suppliers with `roadmaps show`, searched objects with `roadmaps grep` across main/open heads, and searched the board's README/design material. Searches covered Colmez heights and functionals, total reflex objects, class-norm cokernels, integral GSpin special divisors, Borcherds support and Siegel reduction. The suppliers in F02–F04 own those general inputs. The special-divisor arithmetic-intersection chain remains here: the available metaplectic input supplies modular/Weil theory, and the unitary special-cycle material does not supply this orthogonal theorem. No new generic construction was added beyond splitting the existing target.

The verified contracts include ComplexMultiplicationAndExplicitReciprocity §§0.1–0.2, 2.1–2.3 and Layers 4–5; AbelianSchemesAndArithmeticModuli §§A4.1, A4.3, A4.CR.7.2, A5.1–A5.7, A6.22, A6.25, A6.37–A6.38; ArakelovGeometryAndAbelianHeights §§1.3, 1.11, 1.13–1.14, 2.1, 2.7, 2.10, 3.4–3.5, 4.6–4.8, 6.5; AnalyticNumberTheoryPartI §§2.31d–2.31f, 2.32, 2.44–2.46, 3.27; AutomorphicLFunctionsAndLocalFactors AL.1's CM comparison; AutomorphicBundles B1.1–B1.3, B2 and B4.10; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.15–R07.2.16, R07.2.20 and R07.4; ShimuraVarieties §§4.1–4.6, 5.1–5.11, 6.1–6.2, 8.1–8.6; ShimuraData Layers 1 and 3; ReductiveGroups Layer 4; ReductiveGroupsPartII RG2.0a.2; NeronModelsAndSemistableAbelianVarieties §§1.5, 5.1–5.2; PELModuli M2.1–M2.3, M3.9, M5, M6.1–M6.2, M6.8–M6.10; ClassFieldTheory Layer 13; GlobalNumberFields Layer 11; GeometryOfNumbersAndQuadraticArithmetic §§0.1–0.3, 1.2, 1.5, 2.2, 2.7–2.9; HilbertModularVarietiesAndShimuraCurves R18.1, R18.2.12–R18.2.18 and R18.5; the GZ sections named in F02 and the supplier contract; MetaplecticAutomorphicForms Layers 4–7; HeightsRationalPointsAndObstructions §§0.11–0.13, 0.16; DiophantineApproximationAndTranscendence §§0.2–0.3; CyclotomicClassGroupsAndStickelberger §3.4; and AdelicAlgebraicGroups AA.2.4.

FaltingsFinitenessAndIsogenyTheoremsPartII QI.5 and LubinTateFormalModulesAndQuasiCanonicalLifts LT.2 were checked in their board design plans: their roadmap-show queries have no main/open README, but the explicitly named design targets exist with exactly the consumed geometric isogeny and inverse-unit Artin statements. Open-work ownership was checked through the supplied roadmap tools and available board files, not by seeking unprovided checkouts.

The actual library revisions are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, as in the content manifest. Directly read:

- Mathlib `Mathlib/NumberTheory/NumberField/CMField.lean`: IsCMField at line 69, complexConj at 141 with its integrality binder at 136, involution at 163, unit index at 372, regulator ratio at 438. IsCMField itself does not assert finite degree; the theorem separately carries NumberField.
- Mathlib `Mathlib/NumberTheory/NumberField/ClassNumber.lean`: classNumber at 64, positivity at 69, Minkowski representative at 77; `Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean`: discr at 36 and nonvanishing at 41. Thus the real denominator in the only Lean target is nonzero.
- Tau Ceti `TauCeti/NumberTheory/EffectiveBounds/IdealCount/Basic.lean` line 399 and `TauCeti/NumberTheory/EffectiveBounds/Discriminant/Basic.lean` line 61. Their statements give the coarse ideal bound and discriminant inequality, not the stronger supplier inputs. The object search found no native CM-height/total-reflex or uniform relative-class-number theorem replacing the acceptance target.

All nine cited works were already legally cached and certified under their existing source keys. No additional source or fetch was needed. The changed orthogonal statements were checked at A line 2487 (metric), A line 2574 (arithmetic divisor), A line 2585 (Borcherds theorem and its support clauses through line 2607), A line 3023 (completion), A line 3382 (shadow L-function), A line 3467 (big-CM degree), A line 4927 (proper-intersection hypothesis), A line 4989 (Hodge identity), and A line 5642 (averaged comparison). The manifest and bibliography now include the additional precise locators, under the same A key. The other changed mathematics uses T line 149, T line 206, Y line 4500, and the previously cited partition calculation at A line 5306.

## Adversarial mathematics pass

These are explicit specializations and negative controls, not claims to have proved the roadmap. Rows cover every numbered target, all changed formulas, and the supplier contracts affected by the repairs. Finite counts and numerical evaluations were recomputed independently; algebraic local lengths use the displayed quotient presentations. In the quadratic numerical rows, E=ℚ(i), ℓ(0)=−log 4+2log Γ(1/4)−2log Γ(3/4)=0.7831887854, and the compact auxiliary quaternion discriminant is 21.

| Statement | Instances tried | Computed values on the two sides or negative control | Result | Change |
| --- | --- | --- | --- | --- |
| Standing domain | g=0; zero ring; characteristic 3 | 0<0 fails; 0=1 cannot be a field; characteristic 3 contradicts characteristic zero | Outside hypotheses | None |
| Metric convention | Square elliptic torus | Squared norms 2, 1, 1/π; height differences −0.3465735903 and +0.9189385332 | Consistent | None |
| Artin convention | ℚ₅, unit 2, uniformizer 5 | Unit acts by 3 since 2·3=1 mod 5; uniformizer acts by 1 on LT torsion | Consistent with LT.2 | None |
| Normalized degrees | Numerator 6, denominator 2, extension degree 2 | 6/2=12/4=3; absolute denominator with [F:ℚ]=2 instead gives 3/2 | Wrong denominator excluded | None |
| Discriminants | ℚ(i); ℚ(√3,i) | 4=1²·4; 144=12²·1 | Correct | None |
| §0.1 CM functions and overlap span | C₂×S₃; C₆; constant 1 | Overlaps (6,2,2), (0,4,4) average to 10/3, 8/3, sum 6; C₆ complementary sums all 0 but inverse values 1,−1; 1(c)=1 versus overlaps 0 | Distinguishes averaging and domain | None |
| §0.2 Height linearity | Evaluation at c, a generator, constant 1 | ev_c(a⁰)=0 and ev_c(1)=1; adding t·ev_c changes the latter by t and the former by 0 | Uniqueness only on span | None |
| §0.3 Average character | d=1,2,3 at identity | Both character expressions give 1,2,4 respectively | Coefficient correct | None |
| §0.4 Individual predicate | C₆; maps x and y on ℚ² | f(r)=1, f(r⁵)=−1 outside H_CM; maps agree at (1,1) with values 1,1 and disagree at (1,0) with 1,0 | Average does not imply predicate | Replaced vacuous Check |
| §1.1 CM torus | d=1,2,3; diagonal −1 at d=2 | Dimensions 2,3,4; diagonal (−1)²=1, giving μ₂; one-embedding pair sums (1,0) fail equality | Torus distinguished from diagonal | Removed orbit-gap tag |
| §1.2 Integral level | Ramified quadratic uniformizer | Its quotient class squares to 1, valuation is odd 1, while O_E×F× has even valuation | Compact class is excluded | Removed orbit-gap tag |
| §1.3 Integral model | Gaussian maximal level; deeper 5-level | Maximal-level inertia quotient is trivial; 2 mod 5 has nontrivial image in (O_E/5)× at deep level | Étaleness not extended to deep level | Removed orbit-gap tag |
| §1.4 Total reflex pair | Biquadratic E; d=3 | Four types have two orbits of 2, giving product degree 4 and dimension 2; d=3 gives degree 8, dimension 4 | Product permitted | None |
| §1.5 CM families | Elliptic curve with λ and 2λ | Tate lattice rank 2 in both cases; polarization degrees 1 and 4 | Unimodularity unnecessary | None |
| §1.6 Reflex character/height | d=3 at identity | 4=(1/6)·8·3; replacing 1/6 by 1/8 gives 3 | Correct coefficient | None |
| §2.1 Crystalline realization | Gaussian prime 5, its two factors | Local CM weights 1 and 0, both crystalline; swapping variance negates weights | Variance retained | None |
| §2.2 BK specializations | Rank one, E(u)=u−p | S/(u)=W, S/(u−p)=O_y, each rank 1; φ-pullback is retained before both quotients | Two bases distinguished | None |
| §2.3 Bundles/crystals | Level field ℚ₃(ζ₃) | Ramification index 2, hence not étale over ℚ₃; filtered bundle remains global, global F-crystal not asserted there | Scope correct | None |
| §2.4 Integral tensors | Gaussian CM away from 2 | E-linear frames form (E⊗R)×; zero frame has determinant 0 and is excluded | Actual torsor, not all maps | None |
| §2.5 Rational action | Multipliers 2 and 1/2 | [2] has degree 4 and is integral; 1/2 does not preserve O_E | Rational/integral distinction | None |
| §2.6 Standard line | a=1,i; z=(1,i) | f₁²=f_i²=1, while multiplication by i squares to −1; B(z,z̄)=4 gives norm² 4 | Wrong map/sign excluded | None |
| §2.7 Tautological crystal | Two primes over Gaussian 5 | LT factor slope 1, other factor slope 0 with Fr⊗1 | Distinguished prime retained | None |
| §2.8 Nonsplit condition | Gaussian primes 3 and 5 | At 3 slopes (1/2,1/2), invariant span rank 2; at 5 slopes (0,1), invariant rank 0 | Both directions distinguished | None |
| §3.1 Determinant section | d=1,3; diagonal (π,1,1,1); square-zero ε | r=1,4; determinant π has length 1; ε²=0 prevents Cartier regularity | Rank and base hypotheses necessary | None |
| §3.2 Partition quotient | Empty part; split algebra; ramified quadratic; invertible twist | Quotients 0,0,C/(2π); length 1 at π²=3; M≅B transports both kernels and preserves 1 | Freeness explanation correct | Clarified twist assertion |
| §3.3 Partition length | π²=3 over ℤ₃ | Cross valuation 1; discriminant 12 has C-valuation 2, half 1; within-part sums 0 | 1=1−0−0, reverse gives −1 | None |
| §3.4 Conductor functional | Trivial and tame quadratic; digit map | Conductors 0,1; digit-tail/leading bound (p−1)/(2p−1)<1 yields infinitely many values | Continuous non-locally-constant input excluded | None |
| §3.5 Conductor length | ℚ₃(√3), singleton split | e_P=2, diagonal μ=1/2 each; +(2/2)(1/2+1/2)=1=length C/(2π) | Positive sign correct | None |
| §3.6 Metrized determinant | r=1; real unit 3+2√2 | Top period 2π; unit absolute values 5.828427 and 0.171573 have product 1; normalized determinant degree 2log(2π) | Trace normalization necessary | None |
| §3.7 Local reflex | d=2; local degrees 1 and 2 | Restriction fibers 2 and 1; at F=ℚ(√3), p=3, v(d_F)=1 gives length 2⁰·1=1 | Multiplicities retained | None |
| §3.8 Reflex height | d=1, mean h | Δ degree 0 and ω₀ degree 4h+2log(2π): determinant degree (4h+2log(2π))−4h=2log(2π) | Solving gives h on both sides | None |
| §4.1 Filtered-line adapter | Unramified E_v/ℚ₃, ξ=−9 | On 3⁻¹O_E, ξNm(3⁻¹)=−1; on ξO_E, ξNm(−9)=−729 | Full-lattice shortcut rejected | None |
| §4.2 GSpin/divisor data | Negative plane; f=0; stabilizer 2 | B((1,i),(1,−i))=−4, norm² 4; Z(0)=Φ(0)=0; degree contribution 1/2, cover degree 2 changes it to 1 | Correct geometry and weighting | Split target, retained APIs |
| §4.2a Borcherds/support | n=5, self-dual at 2; n=3; odd valuations 1,2; c=2 | First error 0; n=3 does not meet n≥5 clause; v=1 gives error 0, v=2 no such conclusion; weight 2 gives constant 2log(4π exp γ) | All hypotheses retained | Separate Needs and Checks |
| §4.2b Big-CM degree | f=0; zero shadow; degree-two pullback | Zero gives 0/Λ=0; ξ(f)=0 removes exactly L_shadow′; numerator 2a and degree 2d give a/d | Denominators and scaling correct | Explicit degree target |
| §4.2c Hodge identity | Norm-1 complement; scalar 2f; zero vertical error | c(−1,μ)=1 fails; error quotient 2E/(2c·d)=E/(c·d); −2Λ′/Λ−dlog(4π exp γ)=−2ℓ−log(D_E/D_F) | Proper intersection and constants correct | Separate statement and Checks |
| §4.2d Average comparison | Substitute §4.2c in §3.8 via §4.1 | ω₀=ω−log D_F, so mean=ω/4−dlog(2π)/2; vertical coefficient becomes E/(4c·deg) | Factor 1/4 preserved | Updated consumer §4.5 |
| §4.3 Auxiliary data | ξ=−1 for d=1; all positive ξ; scaling a by 2 | Signatures (0,2) versus (2d,0); ξ/4·Nm(2a)=ξNm(a) | Signature and norm law distinguish object | None |
| §4.4 Narrow norm/good choices | F=ℚ(√3), E=F(i) | 144/12²=1, narrow class order 2; different generator 2√3 has signs +,−, hence χ(d_F)=−1=(−1)^(2/2) | Unramified sign clause consistent | Added actual gap tag |
| §4.5 Prime elimination | Rational relation in log 2,log 3; p-good enlargement | Clearing denominators gives 2^m3^n=1, hence m=n=0; self-dual n≥5 enlargement has p-error 0 | Independent coefficients vanish | Consume §4.2d |
| §4.6 Quadratic branch | E=ℚ(i) | −0.7831887854/2−log 4/4−log(2π)/2=−1.6571065162 | Agrees with quadratic gamma expression | None |
| §5.1 Component invariance | Elliptic CM lattices O_E and 2O_E | Inclusion index 4; corresponding same-type component-height difference 0 | Isogeny degree does not rescale height | None |
| §5.2 Height decomposition | g=1; d_Φ=d_Φc=1 | Correction −log(1·1)/(4·2)=0; total height equals its one component | Degenerate correction correct | None |
| §5.3 Nearby types | g=1,2,3; opposite square vertices | (vertices,edges)=(2,1),(4,4),(8,12); opposite symmetric difference 4 versus required 2 | Adjacency distinguished | None |
| §5.4 Nearby average | g=2, each of eight endpoint heights 1 | Four edge heights 1; 2⁻²·8=2=2⁻¹·4 before shared correction | Endpoint factor correct | None |
| §6.1 Graph datum | Unit different; generic cyclic 3-torsion | Graph orders 1 and 3 versus product order 9 | Unrelated product kernel excluded | None |
| §6.2 Different-torsion comparison | ℚ₃(√3); ℚ₂(√2) | π−π̄=2π lies in δ; different valuations 1 and 3; semilinear factors agree modulo δ in both | Dyadic case retained | None |
| §6.3 Integral graph/self-duality | ℚ(i), quotient O_E/(2) | Generic torsion order 4; dual order 4; i=−i mod 2; units 1,i extend by scalars | Conjugation trivial on quotient | Kernel renamed Q |
| §6.4 Nearby height | Self-dual length cancellation; ramified opposite component | Contributions t−t=0 after the comparison; raw quotients have lengths 1 at √3 and 3 at √2 | Raw exactness cannot replace contract | Removed stray exclusion |
| §6.5 Quaternion graph | Split End(O_E); division place with unit different | Singleton graph projections have length v(2π); division δ=1 gives length 0 | Splitting is of quaternion algebra | Clarified place |
| §7.1 Auxiliary quaternion data | g=1,2,3 | Finite ramification counts 2,1,0 give totals 3,3,3; switching one real place gives 2,2,2 | Parity and compactness correct | None |
| §7.2 CM-point height | z=i,1+i; degree-two field extension | Norms 2,2; a/d=2a/(2d); denominator changed to absolute gives extra factor 1/[F:ℚ] | Height uses supplied point | Point/action imported |
| §7.3 Hodge bridge | z=i; O_E- versus O_B-linear deformation Hom | L norm 2 gives L² norm 4; Hom ranks 2 versus 1 | Quaternionic condition required | Added ramified bridge contract |
| §7.4 Quaternionic average | E=ℚ(i), d_B=21 | h_L=0.0459252529; h_L/2−log21/4=−0.7381679830 | Auxiliary discriminant cancels | Capitalized fragment |
| §8.1 Modified intersection | Same quadratic datum; S₂ place q=2 | i₀/e=−0.0459252529; n=−1/7,c/log2=−2/7 gives 2n−c/log2=0; theta integral 1/7>0 | Compensation/nonvanishing supplied | Removed redundant gap |
| Imported adjunction (former §8.2) | e=2, same datum | i₀=−0.0918505058; i₀/e=−0.0459252529=−h_L; horizontal pullback multiplicity 2 versus étale 1 | Exact supplier identity | Local duplicate deleted |
| §8.3 Quaternionic height | Same datum | −ℓ+(1/2)log(21/4)=0.0459252529, negative of §8.1 | Signs agree | Needs GZ §7.78 |
| §9.1 Averaged Colmez | Quadratic datum, both routes | Mean YZ=−0.7381679830; subtract log(2π)/2 gives −1.6571065162; orthogonal quadratic branch gives same number | Metrics used once | None |
| §10.1 Relative class growth / Lean headline | Discriminants 3,4, ε=1/8 | Ratios 1,1; lower bound compatible with one C≤4^(−1/8)=0.8408964153; sextic regulator ratios 4/2=2 and 4/1=4 | Uniform quantifiers and positive denominator retained | None |
| §10.2 Distant isogenies | Gaussian and Eisenstein elliptic fields, ε=1/8 | Minimum degree 1 for class number 1; shared c≤0.8408964153 gives c·4^(1/8)≤1 and c·3^(1/8)≤1 | Same constant precedes both fields | Quantifiers repaired |
| §10.3 Individual heights | Two heights −1,3, lower bound −1 | Mean 1; 2·1−(2−1)(−1)=3; negative height also ≤ every positive C D^ε | No positivity/primitivity needed | Quantifiers repaired |
| §11.1 Definition fields | g=1; unit 577+408√2; f=[2] | Bounds 162 and 26244; GL₂(𝔽₃) gives tighter 96; unit mod 3 is 1 but square 665857+470832√2≠1; g₀=id works for [2] | Polarized rigidity essential | Direct PEL contract |
| §11.2 Exponent budget | κ=2,δ=1/16,a=3/16,ε=1/32 | δκ=1/8<3/16<1/4 and εκ=1/16<3/16 | Both competing powers smaller | None |
| §11.3 Primitive orbit | g=1, Gaussian and Eisenstein points | Absolute coarse degrees 1,1; a fixed δ permits common c≤4^(−δ) | Bounded range does not force degree zero | Direct PEL citations |
| §12.1 Center order | Conductor 2 in Gaussian field; simple power | J=2, D=4·4=16; M_n(E) center E has degree 2, not 2n | Full order and one factor per block | Added order gap tag |
| §12.2 Normal-closure image | L=E*=E=ℚ(i); identity extension generally | Class norm index 1≤1, image size 1≥1; following-map index cannot exceed norm index | Norm bound applied at first use | Direct Iwasawa citation |
| §12.3 Compact index | Maximal center order J=1; dyadic exponential | 1≤I^cP^d for I,P≥1; valuations v₂(2)=1, v₂(4)=2 distinguish forbidden shallow from permitted deep argument | Field factor retained | Removed orbit-gap tag |
| §12.4 General reduction | I=P=1; B=1/2 and two bad primes | Base orbit ≥1; B²=1/4, not 1, so discarding the loss quadruples the asserted lower bound | Absorption remains necessary | Orbit gap only here |
| §12.5 General orbit theorem | Gaussian orders of conductors 1,2 | Center discriminants 4,16, coarse orbit sizes 1,1; one C≥16 covers both at any b>0 | Order invariant retained | Direct Iwasawa citation |
| §13.1 Coordinate degree | g=1,2; generic sextic type | Safe bounds 4,48; sextic type orbit 8>6 | Dimension bound, not 2g | None |
| §13.2 CM lattice basis | O_E=ℤ[i]; I=ℤ+2ℤi | Covolumes 1,2 equal (√4/2)·1,(√4/2)·2; multiplier order index 2 retained | No hermitian reduction used yet | Removed reduction gap tag |
| §13.3 Period reduction | Gaussian principal lattice and conductor 2 lattice | Periods i and 2i; analytic h₀ 1,2; algebraic heights 1,2, so maximal-field discriminant 4 alone misses conductor growth | Order index necessary | None |
| §13.4 Lift heights | Same periods i and 2i | Primitive polynomials X²+1,X²+4 have coefficient heights 1,4; Weil heights 1,2; square relation agrees with degree 2 | Height conventions consistent | None |
| §13.5 Bounded-degree finiteness | g=1, N=1; repeated parameter | Orders above give D=4,16 and degree 1; orbit bound supplies a finite D cap; repeating either point m times keeps distinct count 1, not m | Counts points, not parameters | Replaced process wording |
| Supplier norm-image inequality | Group G=C₆, subgroup N of order 3, following quotient G→C₃ | [G:N]=2, image sizes 3 and 3, so 3≥3/2; with identity following map, 3=6/2 | Following-map index can shrink | Direct supplier + elementary quotient argument |
| Supplier ramified determinants / bridge | Opposite embedding at √3 and √2 | O_L/(2√3) length 1; O_L/(2√2) length 3; torsion-free quotients rank 0 | General ramified contracts still needed | Retained exact gaps |
| Supplier product-order discriminant | R={(a,b)∈ℤ²:a≡b mod 2} | Basis (1,1),(0,2) trace Gram determinant 4, index² 4, maximal algebra discriminant 1 | Nonproduct order required | Retained exact gap |
| Supplier narrow norm, torus and reduction | Unramified quartic example; I=P=1; Z=i | Narrow different sign −1; base orbit/index 1; identity symplectic matrix entries 0,1 and h₀=1 | Boundary examples fit general contracts | Retained exact gaps |

## Source issues and maintainer consequences

Y line 4666, in the proof on p. 633, uses étaleness of a level projection to justify the lifted section. At elliptic index e=2 the horizontal pullback multiplicity is 2, whereas étaleness would give 1. This remains a proof issue for the supplier's finite adjunction argument (GrossZagierAndArithmeticHeights §§2.14, 7.67, 7.78); it does not make its stated adjunction contract absent. The repair neither asserts that proof is complete nor replans it locally.

The seven remaining supplier gaps are ramified-component-determinants, quantitative-cm-torus-orbit, narrow-cm-norm-different, etale-order-discriminant, quantitative-siegel-hermitian-reduction, ramified-quaternionic-bridge and embedded-quaternion-orders. Their general statements remain necessary; no good-prime or unramified substitute was introduced. No new supplier obligation was invented.

No Lean declaration was added, deleted or renamed. Textual consumers of the former local §8.2 should cite GrossZagierAndArithmeticHeights §7.78; consumers of the old §4.2 averaged-error statement should cite §4.2d. The orthogonal intermediate results remain §§4.2–4.2c. The four deleted gap slugs correspond to existing supplier statements, including all clauses of the former kernel gap. Only the permitted top-level gaps array was changed in the design plan; its target tree and historical design prose remain untouched. Metadata and Suggested.lean remain unchanged, and sources.toml only expands A's locators.
