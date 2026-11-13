# Review of ModpRepresentationsOfGL2OverLocalFields (pull request #2282 at 08debbe)

**Verdict:** needs changes

## R01 (P1) — The augmentation filtration can discard a whole component

**Location:** TauCetiRoadmap/ModpRepresentationsOfGL2OverLocalFields/README.md:1522: “Let `U` be compact analytic without `p`-torsion”.
**Claim:** The support-dimension equality is false on this domain. A good image filtration need not be separated when the augmentation ideal is not contained in the Jacobson radical.
**Witness:** Take k=𝔽₅, U=C₂×ℤ₅, S=k[[T]], R=S×S, 𝔪=(T)×S, M=k×S, r=0. The quotient filtration gives grR=k[t], grM=k; Hom_R(M,R)≠0. Thus dimU−j_R(M)=1, whereas dimSupp(grM)=0.
**Repair:** Replace the hypothesis by “Let U be a compact analytic pro-p group without p-torsion, with R=k[[U]] carrying its complete separated augmentation filtration and M a finite R-module with a good separated filtration.” Retain general compact analytic groups through restriction to an open uniform pro-p subgroup (§4.1). Add the displayed C₂×ℤ₅ negative control. BHHMS23 line 2392, Lemma 5.1.3, p.47, includes pro-p; the repaired hypothesis excludes this example.

## R02 (P3) — Register both additional supplier gaps

**Location:** TauCetiRoadmap/ModpRepresentationsOfGL2OverLocalFields/README.md:345 and :351: `gap:barthel-livne-ordinary-classification` and `gap:ordinary-irreducible-hecke-presentation`.
**Claim:** These two contracts are used as declared gaps throughout §2.4, but neither is registered where intake reads the declarations.
**Witness:** packages/ModpRepresentationsOfGL2OverLocalFields/design/plan.json:3767 contains only the Ext-finiteness and finite-codimension slugs; neither of the two README slugs occurs in its top-level gaps array.
**Repair:** Add both exact slugs to that array, each with supplier `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, section `R07.5.15`, and the corresponding mathematical needs sentence from README:345 or :351, retaining its hypotheses. Change no other design fields.

## R03 (P3) — Cite the block classification used by the Ext argument

**Location:** TauCetiRoadmap/ModpRepresentationsOfGL2OverLocalFields/README.md:837: “use the finite Ext computation inside a block. *Needs:* §0.6; PadicLocalLanglandsForGL2Qp §§2.7 and 5.1.”
**Claim:** Finite support among blocks is not finite support among irreducibles inside one block; the cited section supplies the former, while this argument uses the latter and the Ext computations.
**Witness:** PR #1312, TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:1688 defines block decomposition; :1728 gives the finite block lists and :1734 names the Ext computations, including exceptional primes.
**Repair:** Cite “PadicLocalLanglandsForGL2Qp §§2.7, 5.1–5.2” here and add §5.2 to the exact supplier contract at README:326. Its p=2 block has two irreducibles and its p=3 exceptional block four, providing the missing finite-support input.

## R04 (P3) — Correct the depth-definition locator

**Location:** TauCetiRoadmap/ModpRepresentationsOfGL2OverLocalFields/README.md:1299: “(BHHMS23, §2.4, pp. 15–17)”.
**Claim:** This locator does not locate the definitions of regularity and N-depth immediately preceding it.
**Witness:** BHHMS23 lines 544–557, §2.1, printed p.12, define regular weights and N-depth; §2.4 concerns Serre weights attached to Galois representations.
**Repair:** Replace this citation by “(BHHMS23, §2.1, p. 12)”. The cited inequalities give 3<4<14 for p=17, r=3 and exclude r=2, exactly as the Checks require.

## R05 (P3) — Register the nonadmissible-representation source

**Location:** TauCetiRoadmap/ModpRepresentationsOfGL2OverLocalFields/README.md:1165 and :2486: `LE19`.
**Claim:** The source used for the nonadmissible irreducible negative control has no entry in the source manifest.
**Witness:** packages/ModpRepresentationsOfGL2OverLocalFields/sources.toml has no LE19, arXiv:1809.10247, or matching Le title. The legal arXiv v3 text is readable: LE19 lines 30, 231 and 269 locate the cited theorems.
**Repair:** Add one LE19 entry for Daniel Le, “On some nonadmissible smooth irreducible representations for GL₂”, 2019, arXiv:1809.10247v3, recording §2.1 and Theorems 1.1, 3.2, 3.4 for §2.4 and the sources service's provenance. Retain the README's version-specific locators.

## Verified sound

| Statement | Instances tried | Computed left side | Computed right side / control | Result; change |
|---|---|---|---|---|
| Conventions: reciprocity | p=5, u=2 | Cyclotomic value on geometric Artin: 2 | Arithmetic Artin: 2⁻¹=3 | Convention distinguished; none |
| Conventions: norm | Niveau two over ℚ₅ | ω₂ has order 24 | ω₂⁶ has order 4 | Matches niveau one; none |
| Conventions: dual action | Scalar g=2 over 𝔽₅ | Dual sends f to 3f | Pairing (3f)(2v)=f(v) | Inverse required; none |
| GL2ModScalar | ϖ a uniformiser; ϖ=0 | Scalar powers become 1 in quotient | At 0, generating set empty; quotient G | Headline excludes 0; none |
| IsSmoothRep | Trivial module; ℤ₅ unipotent action on ℚ₅² | Stabiliser of trivial vector: whole group | Stabiliser of e₂: {0}, not open | Distinguishes smoothness; none |
| §0.1, IsTorsionAdmissible | Trivial L/𝒪, ramification e; infinite sum of k | Length of pʲ-torsion: ej; at j=0: 0 | Infinite sum: infinite length at j=1 | No bounded-torsion substitution; none |
| §0.1 duality | k with trivial action; zero | Dual dimensions 1; 0 | Bidual dimensions 1; 0 | Matches; none |
| §0.2 multiplication | g=(12), h=(23) in S₃ | [g][h]=[(123)] | [h][g]=[(132)] | Noncommutativity retained; none |
| §0.2 inversion | γ=1+T in k[[ℤ₅]] | γ⁻¹−1=−T+T² mod T³ | Using T instead gives wrong linear term | Antipode distinguished; none |
| §0.2 level action | Trivial quotient; regular C₂ quotient, p=5 | Augmentation acts by coefficient sum | Nontrivial generator permutes two basis vectors | Trivial-action model excluded; none |
| §0.3, IsFinitelyPresented | H=1, finite-length coefficients; zero | Presentation of finite W: 0→W→W | Infinite direct sum has no finite generators | Correct finiteness carrier; none |
| §0.4 exact sequences | Split sequence k→k²→k | Generator dimensions 1,2,1 | Kernel dimension 1; quotient dimension 1 | Matches extension and kernel clauses; none |
| §0.4 finite index | U=pℤ_p inside ℤ_p | Index p; induced trivial module dimension p | Restriction has the same p-dimensional carrier | Finite-index comparison; none |
| §0.5 coherence | Multiplication T on I(σ) | Freeness gives ker(T)=0 | Zero admits the zero presentation | Coherence boundary; none |
| §0.6 Hom base change | Trivial k-module; k′/k quadratic | k′⊗Hom(k,k)=k′ | Hom(k′,k′)=k′ | Dimensions 1 over k′; none |
| §0.6 residue field | 𝔽₂₅-character viewed over 𝔽₅ | Endomorphism field dimension 2 | Two conjugate characters after splitting | Absolute irreducibility distinguished; none |
| §0.7 five-term criterion | 0→0→k→k→0, identity middle map | Kernel 0; cokernel 0 | Two remaining modules have length 1 | Matches; none |
| §0.8 obstruction | Identity compact induction | Positive and negative supports disjoint: Δ=0 | Its weight has a nonzero I₁-fixed line | Unconditional containment excluded; none |
| §0.8 admissible obstruction | Augmentation I(1)→k | Both cell images k; intersection k | dim Δ=1; fixed-vector dimension 1 | Matches admissible clause; none |
| §1.1 proper quotients | Qp, I(1)/(T−1) | Two ordinary constituents | Length 2 versus infinite length of I(1) | Properness distinguished; none |
| §1.2 filtration | 𝔽₅-matrix [[0,2],[1,0]] | Characteristic polynomial X²−2 irreducible | Over 𝔽₂₅: two distinct eigencharacters | Finite splitting extension needed; none |
| §1.3 finite type → presentation | I(σ) over ℚ_p | Generated by finite-dimensional σ | Identity presentation has zero relations | Finite presentation ≠ finite length; none |
| §1.4 central character | p=5, δ(2)=2; quadratic δ | Ratio at scalar 2 is δ(4)=4 | Quadratic ratio δ(2²)=1 | Central-character Check matches; none |
| §1.4 Ext support | Exceptional blocks, p=2 and p=3 | Block lists contain 2 and 4 simples | §5.1 alone gives no internal cardinal bound | Locator repair R03 |
| §1.5 finite cosocle | Nonsplit length-two extension | Cosocle length 1; total length 2 | Bound on semisimple quotients: 1 | Length need not equal bound; none |
| §1.6 smooth dual criterion | Trivial k; Steinberg over ℚ_p | Representation lengths 1;1 | Smooth-dual dimensions 1;0 | Both finite; none |
| §1.6 finite-type hypothesis | Infinite direct sum of Steinberg | Infinite representation length | Smooth dual zero | Excluded by finite type; none |
| smoothDualSpan | Trivial one-dimensional module; zero | Every functional smooth; span dimension 1 | Zero module gives dimension 0 | Real definition matches; none |
| §2.1 ordinary parts | Character χ∘det over k | Positive Hecke trace multiplies by q=0 | Localised ordinary part 0 | Transfer cannot be omitted; none |
| §2.1 opposite Borel | Lower-Borel character χ₁⊗χ₂ | Ord of its induction: χ₁⊗χ₂ | Upper-Borel notation swaps χ₁,χ₂ | Direction retained; none |
| §2.2 degree-one Hecke | ℚ_p; unramified quadratic F | q/ϖ: 1; p | Residual values: 1;0 | Vanishing restricted away from ℚ_p; none |
| §2.2 ramification | ϖ²=p, q=p | q/ϖ=ϖ | Square is p=0 modulo p | Nilpotence suffices; none |
| §2.2 trace normalisation | ℚ₅, t=diag(2p,1) | Degree-one transfer factor 2⁻¹=3 | Omitting unit gives 1 | Normalisation distinguished; none |
| §2.3 finite obstruction | Trivial k; identity I(σ) | Δ dimensions 1;0 | Lengths 1;∞ | Admissibility excludes second; none |
| §2.4 ordinary-constituent headline | Character; Steinberg; principal series | Lengths 1;1; at most 2 | Principal-series K₂ invariants: (q+1)q; q=5 gives 30 | Finiteness matches; none |
| §2.4 nonadmissible control | LE19, p>2, λ₀=1, λᵢ=2 | Infinitely many nonzero K₁-trivial summands | dim πᴷ¹=∞ despite absolute irreducibility | Source verified; register R05 |
| §2.4 ordinary contracts | Two extra README gap slugs | Both used by the proof | Matching entries in plan.gaps: 0 | Register both; R02 |
| §2.5 finite-error counit headline | Steinberg; trivial character | Counit kernel dimensions 1;0 | Cokernel dimensions 0;1 | Finite error, not isomorphism; none |
| §2.6 Banach approximation | Trivial lattice Θ=𝒪 | Choose M=0; kernel 0 | Cokernel 𝒪 has module rank 1 | Finite means finite generation; none |
| §2.6 field exclusion | ℚ_p; unramified quadratic; ramified quadratic | (p uniformiser, residue size p): (true,true); (true,false); (false,true) | hF: false;true;true | Exactly intended cases; none |
| §3.1 regularity and depth | p=17, N=3, r=3 and r=2 | 3<4<14 true; 3<3 false | Integer bounds 3≤r≤12 | Matches; locator R04 |
| §3.1 central twist | (5,0) and (8,3) | Differences both 5 | Second weight twists first by det³ | Labels distinguished; none |
| §3.2 coordinates | f=1, p=17, λ=(5,0) | t(−1)=(0,−11) | t(1)=(−1,−10) | Opposite signs give different weights; none |
| §3.3 small primes | GL₂(𝔽₂)=S₃, trivial weight | dim Ext¹(1,1)=1 | Regular extension graph gives no distinct neighbour | Exceptional clause required; retained |
| §3.3 change of origin | Coordinate translation by a, then −a | Net coordinate shift 0 | Original weight label recovered | Inverse comparison; none |
| §3.4 tame weights | f=1, p=17, s=1, μ=(6,0) | Weights Sym⁵, Sym⁹ det⁶ | Inertia ω⁶⊕1 | η-shift matches; none |
| §3.4 coefficient field | Niveau two over ℚ₅ | Required character order 24 | 𝔽₅ˣ order 4; 𝔽₂₅ˣ order 24 | Extra coefficient hypothesis required; retained |
| §3.5 Diamond module | Empty set; all weights | D₀ dimensions 0; sum of simple dimensions | Extra constituent would repeat a listed simple | Maximality distinguished; none |
| §3.5 invariants | f=1, p=17, irreducible parameter r=5 | dim D₀=6+10+12+4=32; dim D₁=2 | Semisimplified invariants dimension 4 | Nonsplit structure retained; none |
| §3.5 torus values | diag(3,1), same example | Socle values 3⁵=5, 3¹⁶=1 | Cosocle values 3¹⁵=6, 3⁴=13 modulo 17 | Nontrivial H-action; none |
| §4.1 canonical dimension | U=ℤ_pᵈ, dual regular module | Grade 0; canonical dimension d | Invariants under pʳU: pʳᵈ | Growth exponent matches; none |
| §4.1 zero and trivial modules | M=0; M=k | Grade ∞;d | Dimensions −∞;0 | Zero convention retained; none |
| §4.2 quotient comparison | ℤ₅² acting through ℤ₅ | Growth exponent 1 in ambient dimension 2 | Quotient canonical dimension 1 | Matches quotient clause; none |
| §4.2 support formula | U=ℤ₅, M=k, r=0 | 1−j(k)=1−1=0 | dim Supp(gr k)=0 | Pro-p control passes |
| §4.2 support formula | U=C₂×ℤ₅, M=k×k[[T]] | Grade 0; dimU−grade=1 | grM=k; support dimension 0 | False; R01 |
| §4.3 valuation | Upper unit, lower p-unit, their commutator | Values 1/2,1/2,1 | Commutator lower bound 1/2+1/2=1 | Matches; none |
| §4.3 identity and p-power | 1; upper unipotent raised to p | ∞;3/2 | ∞;1/2+1 | No finite value at identity; none |
| §4.4 graded algebra | One embedding | Degree-one dimension 2; degree-two dimension 4 | Basis e,f; e²,ef,f²,h; ef−fe=h | Polynomial-only model excluded; none |
| §4.4 two embeddings | f=2 | Degree-one 4; degree-two 4+4+4=12 | Hilbert coefficient of (1−t)⁻⁴(1−t²)⁻²:12 | Matches; none |
| §4.5 crossing algebra | f=0; f=1 | Dimensions 0;1 | k; k[X,Y]/(XY), with X,Y nonzero | Complete-intersection dimensions; none |
| §4.5 independent crossings | f=2 | X₀Y₀=0 | X₀Y₁≠0; dimension 2 | Cross-embedding products retained; none |
| §4.6 Iwahori truncations | f=1, n=1,2,3 | Dimensions 1,3,7 | Partial Hilbert sums 1,1+2,1+2+4 | Correct radical powers; none |
| §4.7 multiplicity criterion | Regular functions on I/Z₁, f=1 | Hom(χ,V) dimension 1 | Hom(Wχ,3,V) dimension 7 | Hypothesis fails; dimension 3 not ≤1 |
| §4.7 multiplicity criterion | Trivial representation | Both Hom dimensions 1 | Canonical dimension 0≤f | Positive control; none |
| §5.1 small-prime collision | p=5, f=1 | α²=α⁻²; multiplicity 2 | Claimed ≤1 restricted to p>5 | Correct exclusion; none |
| §5.1 extension direction | Upper and lower root extensions | Upper factors through B(k_F) | Lower p-entry acts nontrivially | Orientation distinguished; none |
| §5.2 Borel injective | p=7, f=2, j=15=(1,2)₇ | Submodule length (1+1)(2+1)=6 | Ordinary interval length 16 | Digitwise order required; none |
| §5.2 endpoints and conjugation | Iχ, q=49 | Dimension 49; χ occurs twice | Jχ has endpoints χˢ and reversed root exponents | Matches; none |
| §5.3 finite hulls | Zero, one, two nonzero coordinates | Lengths 1,2,4 | Two-coordinate middle layer has two constituents | Not a length-three chain; none |
| §5.4 projective lifts | Steinberg at f=1 | Modular dimension p; projective | Rational Steinberg dimension p, multiplicity 1 | Matches lifting comparison; none |
| §5.5 adjoint tensor | p=17, r=5 | 3·dim Sym⁵=18 | dim Sym³+dim Sym⁵+dim Sym⁷=4+6+8=18 | Three summands; none |
| §5.5 generic projectives | f=1, p=17 | dim Pσ=34; adjoint tensor dimension 102 | Three neighbouring projectives: 34+34+34 | Matches; none |
| §5.6 first-order hull | f=1, regular 2-deep σ | dim H¹(K₁/Z₁,k)=3 | Hull bound (1+3)dim InjΓσ | Correct tangent dimension; none |
| §5.6 self-extensions | f=1, r=p−2 | r≤p−3 is false | Self-Ext vanishing clause does not apply | Boundary excluded; none |
| §6.1 rectangular modules | Two coordinates, bounds (1,2) | Number of lattice points 2·3=6 | Uniserial diagonal has only 4 | Rectangular shape distinguished; none |
| §6.2 torsion filtration | One coordinate 0,1,2,3 | Floor-halves 0,0,1,1 | Two layers, each with two labels | Matches; none |
| §6.3 induction | f=1, Ind of a length-two root extension | Composition length 2·2=4 | Two induced-character pieces, each length 2 | Matches; none |
| §6.4 Diamond boxes | Zero, one, two active signs | Lengths 1,2,4 | Formula 2⁰,2¹,2² | Matches; none |
| §6.5 adjoint boxes | f=1, ε=−1 | Labels −3,−2,−1,0,1,2 | Three disjoint two-element translates | Six distinct constituents; none |
| §6.6 enlargement | One active coordinate | D has length 2; enlargement length 4 | Quotient length 2 | Protected multiplicities unchanged; none |
| §6.7 multiplicities | Two disjoint length-four enlargements, multiplicities 2,1 | Total length 12 | Invariant boxes length 2·2+1·2=6 | Direct-sum multiplicities; none |
| §7.1 connectedness | p=17, {1,α²}; {1,α,α²} | First lacks required middle character | Second contains α | False;true, unlike graph connectedness |
| §7.2 Loewy hypothesis | W=χ; p=7 depth bounds | socW=radW fails (χ≠0) | Adjoint map for Indχ is nonzero | Excluded boundary; none |
| §7.3 tame connectedness | f=1, p=19, irreducible r=8 | Two invariant characters differ by α⁸ | α⁸≠α±²; no qualifying length-two pair | Connectedness vacuous on this pair; none |
| §7.4 Weyl conjugation | w=(0 1;p 0), g=(a b;pc d) | wgw⁻¹=(d c;pb a) | Upper b becomes lower pb | Root directions exchanged; none |
| §7.4 weight boundaries | One-dimensional weight; Steinberg | χ=χˢ in both cases | Dimensions 1;q excluded by 1<dim<q | Hypotheses discriminate; none |
| §7.5 third-layer multiplicity | p=5; p=7 | Integers 2<r<p−3: none; {3} | p>5 requirement automatically satisfied | Small-prime collision excluded; none |
| §7.6 local GK headline | f=1 generic supersingular | Canonical dimension 1 | Upper bound f=1 | Matches known test instance; none |
| §7.6 generality | f=2; depth 8 | Bound 2; minimal prime permitting depth is 19 | Ambient group dimension 8; r=8 works at p=19 | No equality claim; none |
| §8.1 infinitesimal action | Adjoint e,f,h | β(e⊗f)=h; β(h⊗e)=2e | Reversed bracket gives −h,−2e | Sign fixed; none |
| §8.1 coinvariant sequence | Trivial rank-one lattice | β=0; successive lengths 1,2,1 | Maps multiplication p and reduction | Exact; none |
| §8.2 preimage lattice | W=0, V°=𝒪 | V₁°=p𝒪; p𝒪/p²𝒪 has length 1 | Wrong denominator p²V₁° gives length 2 | Denominator distinguished; none |
| §8.3 contraction | p=11,r=3 | Eigenvalues 5,4,10 | All nonzero modulo 11 | Invertible; none |
| §8.3 boundaries | r=0; r=p−2 | Plus eigenvalue 0; minus eigenvalue 0 | Deep hypotheses fail | Boundaries excluded; none |
| §8.4 gluing lattice | f=1; f=2, projective dimension d | Ranks 4d;7d | (3f+1)d | Rank agrees; none |
| §8.4 fibre-product marking | Equal versus unequal residue images u,v | u=v satisfies gluing | u≠v fails gluing | Arbitrary unmarked sum excluded; none |
| §8.5 reduction | f=1, projective dimension d | Kernel dimension 3d; quotient dimension d | Reduction dimension 4d | Exact-sequence dimensions agree; none |
| §8.6 projective truncation headline | f=1,p=11,dimPσ=22 | dim R/pR=88 | dim Tσ=(1+3)·22=88 | Correct K/Z₁ cover; none |
| §9.1 endomorphism headline | f=1 | 2+(2+0+0)=4 | 2ᶠ(f+1)=4 | Reduction dimensions agree; none |
| §9.1 prime range | p=7; p=11 | 2<r<p−4: no integers; {3,4,5,6} | First admissible prime 11 | Bound retained; none |
| §9.2 cyclic Hom | τ=σ | Hom(Tσ,Tσ)=End(Tσ) | Identity generates by precomposition | Correct right-module convention; none |
| §9.2 stronger prime range | p=13;p=17 | 5<r<p−7: ∅; {6,7,8,9} | First admissible prime 17 | Bound retained; none |
| §9.3 relative-projectivity headline | Q=σ, Q′=σ or 0 | Hom dimensions 1;0 | Hom(Tσ,Q′) dimensions 1;0 | Relative category retained; none |
| Lean coherence headline | Identity map; zero map k→k | Kernel dimensions 0;1 | Both kernels finitely presented | Native kernel carrier; none |
| Lean finite-type headline | Trivial k; compact induction | Finite generator modules k;σ | Finite presentations for both | No admissibility added; none |
| Lean bounded-quotient headline | Nonsplit principal series Ind_B^G 1 | Semisimple quotient bound 1 | Total length 2, still finite | Bound not confused with length; none |
| Lean smooth-dual headline | k; Steinberg | Lengths 1;1 | Smooth-dual dimensions 1;0 | Both implications tested; none |
| Lean admissible-fp length headline | Trivial 𝒪/ϖⁿ, any F | Compact-open torsion invariants finite | Group-module length n | All local fields retained; none |
| Lean subobject headline | ϖ𝒪/ϖⁿ⊂𝒪/ϖⁿ, n≥1 | Subobject length n−1 | Finite presentation, including zero at n=1 | Native subrepresentation; none |
| Lean Banach-approximation headline | F unramified quadratic, Θ=𝒪 trivial | Zero induced source gives kernel 0 | Cokernel Θ finite of rank 1 | Correct finite-error conclusion; none |

- Sources: all 15 seeded target sets checked against their legal texts, plus 7 further passages; the depth locator and pro-p hypothesis differ as R04 and R01 record.
- Pins: 12 elaborated declaration types compared with the README; 0 missing binders, 5 real supporting definitions, 7 admitted headline theorems; the ordinary-constituent, counit, dimension, lattice and projectivity headlines absent from Lean are named with missing carriers in its docstring; an independent scratch `#check @name` pass reproduced all 12 types.
- Native carriers opened: Mathlib/RepresentationTheory/Induced.lean:77, Mathlib/RepresentationTheory/Continuous/Basic.lean:55 and :541, Mathlib/NumberTheory/LocalField/Basic.lean:46; TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Module.lean:99 and :322; 6 carrier locations, including the missing group-variable continuity in ContRepresentation.
- Native results opened: TauCeti/Algebra/Module/ProjectiveCover/Existence.lean:195, TauCeti/Algebra/Module/Projective/Lift.lean:89, TauCeti/Algebra/Module/Projective/Reduction.lean:73; TauCeti/RepresentationTheory/Homological/ContCohomology/Coinduced/Acyclic.lean:328; TauCeti/NumberTheory/ClassFieldTheory/Local/GeometricArtinMap.lean:145, TauCeti/NumberTheory/ClassFieldTheory/Local/Unramified.lean:475, TauCeti/NumberTheory/ClassFieldTheory/Local/ExplicitCyclotomicSymbol/ArtinMap.lean:311; 7 result locations with hypotheses retained.
- Ownership: 11 exact supplier subsections resolved against main or supplied open heads; 5 closest-roadmap scopes read; 0 second copies, dropped-id conflicts or competing declarations found; R03 identifies the additional needed section.
- Gate: every worker scanner and targeted build passed at 08debbe; independent elaboration passed with exactly 7 sorry warnings; 21 simple tactic attempts (simp, rfl, infer_instance across 7 theorems) closed 0 targets; library near-matches supplied no one-lemma proofs.
- Dependency check output: `depcheck: 238 roadmaps, 2162 edges, 0 problem(s)`; 0 UPWARD or CYCLE lines.
- PR text: addition of 2,751 lines, 93 headings and 12 Lean declarations matches the description; 0 changes outside this folder; no removals or renumberings from main.

Overlap check: read HilbertModularVarietiesAndShimuraCurvesPartII, PadicLocalLanglandsForGL2Qp, ScholzeFunctorAndModpCohomologyOfTheLubinTateTower, LocalGaloisDeformationRingsPartII and SmoothRepresentationsOfLocalGroups. Smooth categories/induction belong to SmoothRepresentationsOfLocalGroups; Qp classification, blocks and coefficient-linear duality to PadicLocalLanglandsForGL2Qp; tame-weight coordinates, Diamond modules, the local dimension bound and first projective truncations to this roadmap. HilbertModularVarietiesAndShimuraCurvesPartII consumes these for global cohomology; LocalGaloisDeformationRingsPartII consumes the local weight data; ScholzeFunctorAndModpCohomologyOfTheLubinTateTower consumes the finiteness theory. Generic Iwasawa grade and growth comparisons belong to NoncommutativeAndEquivariantIwasawa and CompletedCohomologyPartII.

Source independence: 22 passages compared with 12 sources; no copied expression or reused tables found. Largest share BHHMS23, 43 of 150 source-labelled citation groups before References. Its contents were compared: dependencies force weights before extensions and extensions before multiplicity/lattices; the two concluding chains split its material and combine BP12 and HW22, while Layers 0–2 have independent sources and scope. No matching chapter-by-chapter plan found.

## Not verifiable

- SERRE-LRFG, Part III, Chapters 14–15: settled as uncertified; no readable text supplied, cited by locator without reopening the request.
- BARTHEL-LIVNE94, Proposition 18, Theorem 30, Theorems 33–34 and Corollary 36: settled as waived; primary text not checked, secondary uses in HU12, BP12 and CDN23 read.

## Source issues

- **Error** in VIGNERAS11 at Propositions 9–10, p.22 (lines 827–842): the source says the cell intersection contains the generating weight's fixed vectors and is nonzero without admissibility; it should be restricted to the admissible Serre-weight quotient setting of HU12 Corollaire 3.9; affects a stated result.
- **Misprint** in HU12 at proof of Proposition 4.4, p.36 (line 1980): the source says the positive cell intersects itself in a finite-dimensional space; it should be the intersection of the positive and negative cells; affects the proof.
- **Gap** in CDN23 at proof of Proposition 1.30(b), p.21 (line 891): the source says its Steinberg ordinary-parts calculation follows from EMERTON2 Theorem 4.2.12; it should be justified over F≠ℚ_p by the derived ordinary-parts calculation and the Bruhat sequence, since that cited theorem treats GL₂(ℚ_p); affects the proof.
- **Misprint** in BHHMS23 at proof of Lemma 5.3.1, p.51 (lines 2640–2644): the source says G is the conjugated auxiliary group intersected with M₂(L), with unrestricted matrix logarithms; it should be intersected with SL₂(L), with logarithms in sl₂(L); affects the proof.
- **Error** in BHHMS23 at Lemma 6.1.1(i), p.56 (line 2901): the source says every noncentral character has multiplicity at most one for p>3; it should require p>5, since p=5,f=1 gives multiplicity two at χα²; affects a stated result.
- **Error** in LMS22 at Proposition 3.3(2), p.8 (line 326): the source says all translated tensor summands are the projective covers of their labelled weights; it should use R_(λ+ν), identified with that cover only when the labelled weight is not a character, as LMS22-CORR item (2), p.1, specifies; affects a stated result.
- **Misprint** in BHHMS23 at proof of Corollary 7.3.4, p.84 (lines 4206–4208): the source says three projective-cover terms have group K₁/Z₁; it should use K/Z₁ for those covers, retaining K₁ on the augmentation ideal; affects the proof.
- **Misprint** in HW22 at Theorem 2.23, p.17 (line 829): the source says the old-weight clause is item (i), repeating the new-weight clause's label; it should be item (ii); affects nothing.

## For the human reviewers

- SERRE-LRFG remains uncertified and BARTHEL-LIVNE94 waived; their wording could not be compared. BHHMS23, the source with the largest citation share, was readable together with its contents.
