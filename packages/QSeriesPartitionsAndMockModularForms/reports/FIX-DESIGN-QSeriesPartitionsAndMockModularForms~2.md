# Design repair report

## F01 (P1) — applied differently

Unowned dissection gap → §4.4a `rankCrankDissections`, with complete vector-crank product tuples, rank-difference/Lambert targets, the theta addition input, coefficient and vanishing APIs, and four Checks. Rank residues require Lambert terms as well as products. Evidence: Garvan1988 line 419, line 609, line 687, line 709; the rank source retains its settled page-only citation.

## F02 (P1) — applied differently

Unowned filtration gap → §4.8a `etaDecimationModules`, with explicit weighted Watson modules, Atkin’s genus-one basis, Fourier embeddings, operator inclusions and three Checks. Eta-quotient bases alone do not describe Atkin’s construction. The seven-proof also needs Watson §5: Watson1938 line 1081, line 1322; Atkin1967 line 95, line 247, line 454.

## F03 (P1) — applied differently

Unowned general Fourier gap → §8.4a `parabolicFourierExpansion`, retaining arbitrary invertible monodromy, complex frequencies, Jordan blocks and weight one. KnoppMason2009 line 220 supplies holomorphic logarithmic expansions; the harmonic extension has an explicit matrix ODE and integral basis. Negative frequencies use a decaying primitive, ensuring globally convergent separated parts. Three Checks include unipotent and nonunit monodromy.

## F04 (P1) — applied

Unowned faithfulness gap → the supported law: shadow zero iff the specified correction is zero; this implies weak holomorphy of the completion. Weakly holomorphic forms equipped with zero correction have zero shadow. The unsupported converse from the underlying function alone is deleted. Evidence: BruinierFunke2003 line 423 and Proposition 3.2; normalized mode derivatives have trivial kernel.

## F05 (P1) — applied

Unowned identification gap → §10.3a `fifthSeventhOrder_unilateralToHecke`. The eleven explicit identities move there; §10.4 consumes them for cone models. The χ identities cover the other two functions. Bailey inputs, summability, ψ₁ indexing and three Checks are explicit. Evidence: Andrews1986 line 241, line 266, line 450, line 698; Zwegers2002 line 4123.

## F06 (P1) — applied differently

Unsupported universal numerical level → a common congruence subgroup Γ_t and multiplier for every root order, as in Zagier2009 line 929 and line 952. The cited Bringmann–Ono text concerns the order-two specialization, not the claimed general level. A lower-unipotent Check at t=2 computes the proposed level’s eta factors and phase without asserting that entire group law.

## F07 (P3) — applied

Unspecified limiting transforms → two explicit summation identities, `baileyLemma_limit` and `baileyLemma_limit_one`, with weighted absolute summability, nonzero Euler products and the fixed-ρ factor. Add the unit-pair/a=0 Check. Evidence: Andrews1986 line 93 and line 153; the one-parameter expression follows from the finite transform by the Pochhammer leading term.

## F08 (P3) — applied

Implicit extension of the source → an explicit distinction between Zwegers’s primitive hypothesis and this target’s integral negative-vector generality. Evidence: Zwegers2002 line 3624. The finite-index sublattice argument and the retained `correctionNonprimitive` Check justify the extension; primitivity is not added to the target.

## F09 (P3) — applied

Unspecified Weil sign → ρ_L is explicitly the conjugate of MetaplecticAutomorphicForms §4.7’s ω_L, via `finiteWeil_conjugate`. Add `fourierNonzeroSignature` for ⟨2⟩: support ℤ+1/4 and central scalar −i. Evidence: the supplier’s `finiteWeil_T`/`finiteWeil_conjugate` and BruinierFunke2003 line 392. This distinguishes the two conventions where signature-zero tests cannot.

## F10 (P3) — applied

Reference status and process prose → bibliographic entries and timeless consumer statements. Delete the intermediate-contract certification sentence. Access and waiver statuses remain in `sources.toml`. The downstream ownership and supply direction do not change.

## F11 (P3) — applied differently

“Finite stabilizer” → “finite-index stabilizer.” Direct identification of empty-pole data with the supplier’s Jacobi space → a classical-coordinate comparison requiring joint holomorphy, integral weight, positive index, trivial finite multiplier and cusp growth. Empty poles alone impose no τ-regularity. Evidence: Zwegers2002 line 2660; MetaplecticAutomorphicForms §§6.18, 6.20.

## F12 (P3) — applied

Nonexistent owner → MetaplecticAutomorphicForms Layers 5–6 for automorphic theta kernels, lifting and Siegel–Weil theory. The Siegel–Narain kernel is stated to be outside this package. Evidence: that supplier’s scope and Layers 5–6; no new prerequisite is introduced.

## Mathematical verification

The following audit covers each subsection’s definitions, identities and public laws, including the retained statements. Instances are mathematical controls, not substitutes for the general proof targets. Source-only targets with settled unread references are identified below rather than presented as text-certified results.

| Statement or convention | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Finite product/index convention | n=0,1,2; q=0,1; zero ring | P₂=1−a−aq+a²q; empty product remains 1 | None |
| Formal positive-tail convention | a=1; coefficients through degree 2; 𝔽₂ | Full product is zero at a=1; tail is a unit | None |
| Analytic/fractional-power convention | τ=i; q=0; q=1 | Disc and upper-half-plane domains remain distinct; fractional powers use τ | None |
| Square-root/eta convention | S at i; T; −I | Transformation factor at i is 1; ν(S)=exp(−πi/4), ν(−I)=−i | None |
| Odd-theta convention | ν=±1/2 | i exp(πiτ/4)(exp(πiz)−exp(−πiz)) | None |
| Partition statistic convention | Empty partition; (1); (3,2,1,1) | Rank/crank 0/0, 0/−1, −1/−1 | None |
| Cone orientation convention | Hyperbolic boundary pair; reverse ordered pair | Kernel 2 on the positive sample; reversal negates it | None |
| Xi/weight convention | y^(1−k); log y at k=1; multiplication by i | Xi values 1−k and 1; antilinearity retained | General Fourier target includes k=1 |
| Weil representation convention | ⟨2⟩, σ=1, h=1/2 | T=i, Z=−i, exponent shift +1/4 | Explicit convention and Check |
| Mock-object convention | Zero correction; nonzero unary correction | Shadow belongs to the supplied completion, not an unproved faithful projection | Remove faithfulness claim |
| 1.1 qPochhammerFin | n=0,1,2; q=0,1; zero ring | Product, recursion and scalar transport agree | None |
| 1.2 qPochhammerInt | a=3,q=2,n=−1; a=q=2 | −2 in the first case; second outside reciprocal domain | None |
| 1.3 qPochhammerRatio | Q₋₁([3];[1];2); denominator parameter 2 | Values −1 and 0; no individual pole is divided | None |
| 1.4 formalQPochhammer | First three coefficients; a=1; 𝔽₂ | (1−a), −a(1−a), −a(1−a); tail 1+X+X² mod 2 | None |
| 1.5 qPochhammer_calculus | n=2 inversion; n=0 concatenation; a=0 | Inversion has a²q; a=0 excluded only from inversion | None |
| 1.6 qPochhammer_limit | q=0; a=q⁻¹ | 1−a at zero; zero tail prevents division | None |
| 2.1 basicHypergeometricPhi | Empty parameter lists; numerator 1; denominator 1 | First normalized sign negative; termination at zero valid; bad denominator excluded | None |
| 2.2 basicHypergeometricPsi | j=−1; B=[q]; z=0 | (q−b)/((q−a)z); negative tail vanishes for B=[q]; z=0 excluded | None |
| 2.3 basicHypergeometric_convergence | q=2,a=1/2; balanced bilateral lists; q=0 | Radius 4; the two tails give the annulus; zero-base formulas agree | None |
| 2.4 qBinomial_and_euler | q=0; q=1/2; coefficient n=2 | Binomial value (1−az)/(1−z); coefficients 1,2,8/3 in the Euler specialization | None |
| 2.5 ramanujan_onePsiOne | b=q; a=b; positive q-power b | Shifted binomial specialization; annulus empty when a=b | None |
| 2.6 baileyPair | Unit pair; zero pair; n=1 | β₀=α₀; denominator indices n−r and n+r are necessary | None |
| 2.7 baileyLemma | n=0; unit pair; a=0; forbidden ρ=aq | Both limits have value 1 at a=0; forbidden denominator is excluded | State the two limits and domains |
| 3.1 gaussianPolynomial | G(2,1); signed index −1; Q=1,−1 | 1+Q; out-of-range zero; polynomial survives quotient 0/0 | None |
| 3.2 schur_finiteIdentities | n=0,1,2 | Initial values 1; n=2 gives 1+Q and 1+Q² | None |
| 3.3 rogersRamanujan | Degrees 0–4; q=0 | First coefficients 1,1,1,1,2; second 1,0,1,1,1 | None |
| 3.4 quintupleProduct | z=1; excluded z=0 | Leading terms 2−2q−2q²; z=0 outside domain | None |
| 3.5 partitionSeries | p(0),p(1),p(2),p(4); Euler multiplication | 1,1,2,5; product coefficients 1,0,0,0,0 | None |
| 4.1 partitionRankCrank | Empty; (1); (3,3); conjugate (2,2,2) | Empty 0; singleton crank −1; ranks ±1; strict crank inequality retained | None |
| 4.2 weightedVectorPartition | Size 0,1; swap last two partitions | V₀=1; V₁=z+z⁻¹−1; swap reverses statistic | None |
| 4.3 rankCrank_generatingFunctions | Size 1; z=−1 | C₁=z⁻¹=V₁+1−z; rank specialization is f | None |
| 4.4 partitionResidueCounts | t=1; size 1 mod 2; reduction in characteristic dividing t | Sole count p(n); rank/crank classes differ; multiplied filter remains valid | None |
| 4.4a rankCrankDissections | q=0 in theta addition; V₁; V₄ at ζ₅; rank at size 6 mod 11 | Addition factor a/b fixed; non-target coefficient nonzero; target coefficient zero; rank-eleven fails | Own complete dissections and addition input |
| 4.5 partitionEquidistribution | Sizes 4,5,6 | Equal crank class sizes 1; rank-one class at size 6 mod 11 has size 2 | Replace gap by §4.4a |
| 4.6 partitionCongruenceOffset | (5,1),(5,2),(7,3),(11,1); primes 2,3 | 4,24,243,6; no inverse of 24 at 2 or 3 | None |
| 4.7 qSeriesDecimation | t=1; U₂(X), U₂(X²) | Identity; 0 and X, so not multiplicative | None |
| 4.8 partition_etaDecimation | First eleven-step; first two five-offsets | L₁ starts 11X; offsets 4 and 24 with alternating Euler units | None |
| 4.8a etaDecimationModules | 24 five-basis and 48 seven-basis generator images; seven first step; p(243) | Finite checks satisfy all stated valuation bounds; first seven-step exceptional; p(243)=245 mod 343 | Explicit modules and separate seven-base steps |
| 4.9 partition_primePowerCongruences | r=1,2,3 at 7 | Exponents 1,2,2; 343 does not divide p(243) | Replace gap by §4.8a |
| 5.1 zwegersOddTheta | ±1/2 pair; z=0 and 1/2 at τ=i | Odd zero at 0, simple derivative; half-period nonzero | None |
| 5.2 etaMultiplier | Identity, S, T, −I; opposite lift | Principal-root cocycle retained; lifted character changes sign with the lift | None |
| 5.3 errorFunctionKernel | x=0; derivative at 0; x>0 | E(0)=0, β(0)=1, E′(0)=2; Gaussian tail bound positive | None |
| 5.4 mordellIntegral | z=±1/2,τ=i; z=0 | h=1 at the half points; positive at zero | None |
| 5.5 zwegersR | u=0, ±1/2 terms; u↦u+1; y=0 | Even pair and negative unit shift; boundary excluded; direct Gaussian differentiation gives conjugated odd theta | None |
| 5.6 zwegersMu | u→0; u↦u+1; common shift u,v | Residue −1/(2πiϑ(v)); negative unit shift; R correction cancels from common differences | None |
| 5.7 zwegersMuHat | S-defect constants; τ-shift; negation | h/(2i)+(i/2)h=0; joint elliptic sign agrees | None |
| 6.1 unaryThetaCharacteristic | a=b=0; a=1/6; scale d | Zero pair; leading coefficient 1/6; xi scaling −√(2d) | Correct stabilizer index |
| 6.2 zwegers_periodFormulas | a=b=0; a=1/2 boundary | Characteristic shifts by 1/2; boundary crossing term cannot be dropped | None |
| 6.3 torsionLerchCompletion | Unit shift; order 2; zero characteristic | Sign −1; pole-free even-order example; zero characteristic excluded | None |
| 7.1 zwegersConeDatum | Hyperbolic same/opposite component; rank 1 | Allowed and excluded boundary vectors separated; no isotropic rank-one boundary | None |
| 7.2 zwegersIndefiniteTheta | Equal cones; hyperbolic ± samples; unweighted negative axis | Zero equal-cone sum; kernels 2 and 0; unweighted series diverges | None |
| 7.3 zwegersIndefiniteTheta_convergence | Dependent negatives; two isotropic boundaries | No Q⁺ denominator on equal rays; boundary Q⁺ need not be positive definite | None |
| 7.4 zwegersIndefiniteTheta_transform | Hyperbolic determinant; odd diagonal diag(1,−1); inadmissible b | Prefactor τ; diagonal shift (1,1)/2 retained; S-domain guarded | None |
| 7.5 indefiniteCorrection_unaryFactorization | A=[−2], c=1,2; a=1/4 | −C(1/4,0;2τ); for c=2 the two terms have characteristics 1/8,5/8 and scale 8τ | Explain nonprimitive extension |
| 8.1 realAnalyticModularSpace | Zero; constant at k=0; odd scalar weight; Γ₀(2) cusp S | Central obstruction retained; representation never evaluated on S outside its domain | Local logarithmic Laurent cusp definitions |
| 8.2 holomorphicWeightOperators | y^s; y and iy at k=0; log y at k=1 | Δy^s=−s(s+k−1)y^s; xi₀(y)=1, xi₀(iy)=−i; xi₁(log y)=1 | None |
| 8.3 harmonicWeakMaassSpace | Zero; constant k=0; y² at k=0 | Zero and constant harmonic; y² not harmonic | None |
| 8.4 maassFourierKernel | k=0; w<0; zero frequency at k=1 | H₀=e^w; negative integral nonzero; log y independent of constant | None |
| 8.4a parabolicFourierExpansion | Unipotent block; scalar M=2; M=i; β=0,k=1 | (τ,1) mode; complex frequency; shift 1/4; log y; ODE reduction has invertible Wronskian | General matrix kernel and convergent normalization |
| 8.5 harmonicMaass_fourierAndXi | Constant y^(1−k); conj(q⁻¹) at k=0; rank zero and ⟨2⟩ | Xi constant coefficient 1−k; polar shadow 4πq⁻¹; nonzero-signature central phase −i | Pin conjugate Weil representation |
| 8.6 harmonicMaass_xi_exact | Kernel M!; compatible/incompatible central eigenspaces | Kernel includes cusp poles; incompatible spaces vanish; antilinearity requires conjugated last term | None; external Dolbeault gap retained |
| 8.7 mockModularForm | Zero correction; C(1/6,0); scalar i; conj(j−744) in full H | Nonzero unary shadow; conjugated scalars; full H does not have faithful holomorphic projection | Weaken zero-shadow law |
| 9.1 jacobiThetaComponent | m=1,l=0,1; m=0 | Leading terms 1 and q^(1/4)(e(z)+e(−z)); m=0 excluded | State coordinate-comparison hypotheses |
| 9.2 meromorphicJacobiDatum | Theta; zero; nonzero constant; arbitrary τ-dependence | Theta and zero are elliptic data; constant fails at m>0; no-poles condition alone does not constrain τ | Correct holomorphic comparison |
| 9.3 realAnalyticMeromorphicResidue | (1+v+conj v)/v²; conj v/v; 1/v | Residues 1,0,1; antiholomorphic coefficients do not contribute | None |
| 9.4 completedJacobiPolarKernel | λ=0 pole; residue classes 0,m; cone data | Residue −1/(2πi); R_(m,0)(0)=1 and R_(m,m)(0)=0; mixed boundary required | None |
| 9.5 meromorphicJacobi_decomposition | Single theta component; double pole; k=1 | Delta theta coefficients; first derivative needed; coefficient weight 1/2 | None |
| 10.1 thirdOrderMockTheta | q=0; first f and ω coefficients | Constants 1,1,1,0; f=1+q−2q²+3q³; ω=1+2q+3q²+4q³ | None |
| 10.2 thirdOrder_completedVector | First correction; T exchange; phi/psi constants | −2C correction; nonzero 2√6 unary shadow; T exchanges last entries | None |
| 10.3 fifthSeventhOrderSeries | All constants; A₁ starting index; χ₁ quotient | Constants match; A₁ starts q; φ₁(−q)/q→−1 | Separate Hecke proof in §10.3a |
| 10.3a fifthSeventhOrder_unilateralToHecke | Constants; f₀ coefficient q; corrected ψ₀ and φ₁ formulas | f₀=1+q−q²+…; Euler-weighted q coefficient zero; 1+2ψ₀ and q-factor required | Own unilateral identifications |
| 10.4 mockTheta_heckeThetaIdentities | Fifth cone norms; seventh cone vectors and characteristics | Signatures (1,1); seventh norms −21/2 and pairing −28; no harmonicity claim for arbitrary cone theta | Consume §10.3a |
| 10.5 fifthOrderVectors | Opposite G vectors; first unary derivative; shifted constants | Corrections cancel in sum; shadow scales by −√60 with conjugated coefficients | None |
| 10.6 fifthOrder_transform | S²; T exchange; sum of two vectors | S²=I; unequal √2 entries essential; sum has zero correction | None |
| 10.7 seventhOrderVector | Leading exponents; cone norms; A₂/A₁ order | −1/168,47/168,143/168; second/third order necessary | None |
| 10.8 seventhOrder_transform | S²; third T phase | S²=I; 143≡−25 mod 168 | None |
| 11.1 rankSeries_bilateral | z=−1; q=0; z→1 | f specialization; constant 1; removable partition-series value | None |
| 11.2 rankRootCompletion | t=2,3; trivial root; lower-unipotent at N=10368 | H₃ first component; order-three cancellation; trivial root has weight −1/2; eta factors 1, phase 7776 | Existence-level law plus explicit single-element Check |
| 11.3 rankResidue_mockModularity | t=1,2; nonreal residue phase | Zero for t=1; opposite half-f shadows for t=2; coefficients conjugate under xi | Common Γ_t law |

For §8.4a, substituting v(y)=exp(−2πBy)u(y) into the displayed ODE gives u″+(k/y−4πB)u′=0, hence u′=y^(−k)exp(4πBy)b. This proves the complementary-mode formula for complex frequencies and Jordan blocks without attributing it to the holomorphic-only Knopp–Mason theorem. Negative-frequency decay is essential: a primitive based at a finite height on the entire negative tail can add infinitely many growing holomorphic modes. The scalar comparison to H_k includes both its nonzero scale and the possible holomorphic summand.

For §4.8a, finite Newton-sum controls tested both operator directions on 24 weighted five-basis generators and 48 weighted seven-basis generators. All valuation inequalities passed. These finite controls test the stated formulas; the all-index proof targets use Watson’s modular equations and valuation recurrences. Independently, partition-number controls gave p(6)=11, p(243) mod 343=245, and p(243) mod 49=0, agreeing with Watson1938 line 108.

## Checks and source/supplier audit

- Requested dependency gate: exit 0, with exact output below. There is no UPWARD or CYCLE line.
- JSON/TOML parsing, unique target IDs, matching README/plan public names and Check names, resolved internal target references, internal dependency acyclicity, named external supplier gaps and repository-relative paths: passed. There are 69 targets, three external supplier gaps and 18 manifest sources.
- Mathematical finite controls: 24 five-module generator images and 48 seven-module generator images passed; the three partition boundary values passed. They are controls, not general proofs.
- `git diff --check`: passed.
- Lean elaboration: not run. This design package has no `Suggested.lean`, and the permitted edits do not include creating one. No Lean declaration or import changed.
- Source access: the existing certified extracts were used; KnoppMason2009 arXiv v1 was fetched through the sources service and recorded with its provenance. Its locator is limited to the holomorphic theorem. AtkinSwinnertonDyer1954 and Hickerson1988 retain their existing `uncertified` page-only citations; the inherited waived references remain waived. No missing-reference request is needed.
- Supplier review: read the main-branch ComplexTori and ThetaSeries roadmaps for form, the relevant MetaplecticAutomorphicForms §§4.7, 6.18, 6.20 and scope, and the ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers and ArithmeticDynamics scope/interfaces. None supplies the four new internal targets or requires changing their ownership.
- Pinned-library audit: searched objects using GitHub code search and read `Mathlib/Combinatorics/Enumerative/Partition/GenFun.lean` at the Mathlib pin and `TauCeti/Combinatorics/Enumerative/Partition/Conjugate.lean` at the Tau Ceti pin. The changes extend the roadmap’s statements on its imported carriers; they add no duplicate partition or weighted-generating-function carrier. No changed Lean signatures require elaboration against new library declarations.

```text
candidate: QSeriesPartitionsAndMockModularForms is not in the merge order yet; checked as if placed after MetaplecticAutomorphicForms (the intake inserts it when its design is accepted)
depcheck: 5 roadmaps, 30 edges, 0 problem(s)
```

## Maintainer notes

The six internally owned gap slugs are gone. Four named targets replace the necessary proof inputs: `rankCrankDissections`, `etaDecimationModules`, `parabolicFourierExpansion`, and `fifthSeventhOrder_unilateralToHecke`. The other two gaps disappear by correcting the promises in existing targets. `fifthOrder_heckeIdentities` and `seventhOrder_heckeIdentities` keep their names and move from §10.4 to §10.3a. `baileyLemma_limit_one` is new. No previously public mathematical name is deleted.

`mockModularForm_zeroShadow` now speaks about the supplied correction and completion. `rankRootCompletion_level` and `rankResidue_mockModularity` export a common congruence subgroup without the unsupported universal numerical bound. These are material contract corrections for consumers. The explicit numerical level remains only in a computed single-element Check.

The three genuine external gaps remain with MetaplecticAutomorphicForms (classical square-root model), PDE (analytic elliptic regularity), and ModularForms (vector-bundle Dolbeault extension), including their supplier sections and one-sentence needs. This package cannot supply those extensions in their owners’ place. No supplier target, merge-order edit, commit, push, pull-request edit or external message was made.
