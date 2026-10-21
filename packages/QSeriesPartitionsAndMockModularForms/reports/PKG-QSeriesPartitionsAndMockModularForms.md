# Package report: QSeriesPartitionsAndMockModularForms

The deliverables are `packages/QSeriesPartitionsAndMockModularForms/README.md`, `packages/QSeriesPartitionsAndMockModularForms/Suggested.lean`, `packages/QSeriesPartitionsAndMockModularForms/metadata.toml` and `packages/QSeriesPartitionsAndMockModularForms/sources.toml`. The accepted 11-layer structure, all 69 targets, all 208 original Checks, all layer examples and the detailed dissection, module, Fourier, correction-vector and transformation formulas are retained. The resulting 214 Checks distinguish the repaired bilateral index and the light definitions in the Lean file. The README skeleton was generated from every plan target's statement, hypotheses, API, tests, locator and prerequisites, then expanded using the accepted prose. The plan itself is unchanged, including its three supplier gaps.

## Corrections and representation choices

- **Negative-tail indices (§2.3).** Write t_j for the bilateral summand and h=s−r. Direct division gives
  `t_(-(n+1))/t_(-n) = (-1)^h q^(h(n+1))/z * prod_B(1-b*q^(-(n+1))) / prod_A(1-a*q^(-(n+1)))`.
  Thus the small-base negative-tail magnitude is asymptotic to `|prod_B_nonzero/(z*prod_A_nonzero)|*|q|^(d(n+1))`; the large-base magnitude is asymptotic to `|z|^(-1)*|q|^(h(n+1))`. The accepted text used n in these two exponents. Their strict convergence domains are unchanged: when the exponent degree is zero there is no extra factor, and otherwise its sign decides the limit. The new A=[], B=[0] Check gives t₀=1, t₋₁=−q/z and t₋₂/t₋₁=−q²/z. This is derived from Gasper1995 line 820, not inferred from a numerical radius.
- **Finite Bailey domain (§2.7).** The new denominator factors in Pₙ(aq/ρᵢ;q) must be units over a commutative ring, in addition to the original Bailey denominator domain. This was implicit in the accepted cancellation warning but absent from its finite theorem sentence. It is now an explicit hypothesis. The complex product hypotheses remain explicit. See Andrews1986 line 93 and the transform following it.
- **Gaussian product range (§3.1).** The denominator-cleared product law explicitly requires 0≤k≤n. The polynomial remains zero outside its range; applying that particular product identity outside the range would be false already at n=0,k=1.
- **Ownership (§1.6).** The analytic-product zero criterion is consumed from GeometryOfNumbersAndQuadraticArithmetic §4.3. Its duplicate proposed API entry is absent from this package; the finite-prefix convergence and prefix/tail adapter stay. The general zero divisor is stated only in the supplier contract and scope discussion.
- **Degenerate coefficient rings (§§1.2,1.3,2.7,4.7,4.8).** Numerical forbidden-factor Checks now explicitly use ℚ or ℂ; the nonmultiplicativity Check uses ℤ. These are negative controls over nontrivial rings, and must not exclude the zero ring from the general definitions. In the eta recurrence only the Euler-tail factors are called constant-one units; φℓ itself has leading term X^m.
- **Review note.** The References paragraph no longer points at the board's package manifest. It names the editions and versions in the roadmap's sources manifest without a checkout-dependent path.
- **Identifiers.** APIs whose objects are not declared in the compact Lean file are descriptive prose, without Lean namespaces or backticked undeclared identifiers. Their mathematical statements and Checks remain. Represented APIs retain their declared names. The complex finite character filter, the two binomial domains, the xi factorization, and the single-function f signatures are distinguished explicitly from their broader prose interfaces; no general statement is replaced by its representative specialization.

The accepted A₉ correction in the eleven-dissection, its all-coefficient theta-addition derivation, and the nonterminating large-base witness a=−1/2 are preserved. The opposite-shadow fifth-order vectors, the order-three removable rank specialization, the arbitrary-representation parabolic expansion, and the full exponential-growth Weil exact sequence are preserved.

## What the README does not claim to supply

The three exact missing interfaces remain `classical-metaplectic-model` from MetaplecticAutomorphicForms §§2.4b–2.6, `analytic-elliptic-regularity` from PDE Lane E, and `vector-bundle-dolbeault` from ModularForms Layer 10B. Each exact “What Supplier must provide (gap:slug): …” sentence is in that supplier's subsection. No gap is silently treated as a theorem, and no new supplier gap was needed.

No notion was moved down from a later roadmap. The named later applications remain consumers. No Nahm modularity criterion or unit-circle evaluation is inferred from a disc identity. General indefinite theta functions and general meromorphic Jacobi coefficients are not asserted to be harmonic.

The heavy cover, automorphic spaces, cusp-coordinate Fourier bundles, indefinite theta data and completed Lerch/Jacobi/mock objects remain README construction targets. Their end theorems are not forced through predicates with empty fields or through arbitrary functions assumed to satisfy the conclusion. Suggested.lean includes the easy finite/formal products, Bailey predicate, native statistics/fibers, coefficient extraction, real differential expressions, actual f-series, and native-theta adapters. It states the small- and large-base binomial and Euler identities, both analytic Rogers–Ramanujan identities, equidistribution and all three prime-power families on genuine existing carriers.

The complete rank-difference evaluations of §4.4a and the original Hickerson reference in §10.3a have settled, locator-only uncertified citations. Their unread proof text is not reconstructed or quoted. The seventh-order formulas themselves can also be read in Zwegers2002 line 3697. The Watson/Atkin module inclusions are substantial theorem targets; source definitions, exceptional base steps and consequences were checked, but this package does not claim an independent reconstruction of every valuation array or a proof of those inclusions. The harmonic extension in §8.4a is explicitly the displayed matrix ODE argument; KnoppMason2009 line 220 supplies holomorphic logarithmic expansions, not an unstated harmonic theorem.

## Duplication sweep

The local Mathlib and Tau Ceti source trees were verified by their Git HEADs to be exactly `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. GitHub code search was followed by reading the pinned local files. Searches used mathematical objects and alternative terms: finite products and unit inverses; partition multisets, weighted coefficients, restricted multiplicities and conjugation; Gaussian/q-binomial polynomials versus ordinary Pochhammer polynomials; theta exponents, zeros and derivatives; eta products; Bailey and bilateral series; error kernels, incomplete gamma, Maass differential expressions and Fourier monodromy; residues and Jacobi decomposition. Ordinary rising-factorial and ordinary hypergeometric files are different objects, not q-series suppliers.

Upstream shape comparisons were ThetaSeries, ClassicalArithmeticCompletion and Completed/IntegralLattices; Completed/ContourIntegration and the active supplier sections were read for ownership. The open GeometryOfNumbersAndQuadraticArithmetic and MetaplecticAutomorphicForms sources were read at `01c64f0cc5f154a3d190697951ead2fffc2af693` and `297a40c9a53d52c164a6e568d51015a6332dc8f4`.

The five required open heads were inspected: CohomologyComparisonsPartII `dd8d7e6fda7516b9ab6806d5d75f5202332851c7`, ColemanIntegrationPartII `bd972d91ed7d5d8bd3dd2e7ee84b35853db32ba4`, QWittVectors `4605fbb0a2d9279b561f9467ab5cce09d7f2469e`, ErdosProgressionPowers `72b615703f7fc5d175e519ddbb6e589d3d744c6c`, ArithmeticDynamics `85e78c07dcc361ead6505c970a1181deee483819`. ArithmeticDynamics required its README blob `3e4384e92a463308a56d1d38dd9c0ba4e5b94339` because the ordinary file content was empty. None supplies a duplicate q-product, partition-statistic, completion or Maass target.

| Object excluded from local ownership | Exact supplier and disposition |
| --- | --- |
| Analytic q-product zero divisor | **Additional removal in this package:** the proposed qPochhammer_eq_zero_iff entry of §1.6 is deleted; GeometryOfNumbersAndQuadraticArithmetic §4.3 owns qPochhammer, its shifts and the product zero divisor. The finite-prefix adapter differs by its native finite input. |
| Native partitions, their weighted series and coefficient/product theorem | Mathlib `Nat.Partition`, `Nat.Partition.genFun`, `Nat.Partition.coeff_genFun`, `Nat.Partition.hasProd_genFun`, in `Mathlib/Combinatorics/Enumerative/Partition/Basic.lean` and `GenFun.lean`; retain only the ordinary-series specialization and new statistics. No second carrier or general product theorem. |
| Restricted, Glaisher and odd/distinct counts | `Nat.Partition.hasProd_powerSeriesMk_card_restricted`, `card_restricted_eq_card_countRestricted`, `card_odds_eq_card_distincts`, in `Mathlib/Combinatorics/Enumerative/Partition/Glaisher.lean`; these remain imported checks, not theorem targets. |
| General power-series inversion and pentagonal identity | `PowerSeries.isUnit_iff_constantCoeff`, `invOfUnit`, `mul_invOfUnit` in `Mathlib/RingTheory/PowerSeries/Inverse.lean`; `PowerSeries.pentagonalSeries`, `PowerSeries.WithPiTopology.hasProd_one_sub_X_pow` in `Mathlib/Combinatorics/Enumerative/Pentagonal/PowerSeries.lean`. Only the new parameterized stabilized products are defined here. |
| Two-variable theta and eta | `jacobiTheta₂`, `hasSum_jacobiTheta₂_term`, `jacobiTheta₂_functional_equation`, `hasDerivAt_jacobiTheta₂_fst` in `Mathlib/NumberTheory/ModularForms/JacobiTheta/TwoVariable.lean`; `ModularForm.eta`, `eta_ne_zero`, `multipliableLocallyUniformlyOn_one_sub_pow` in `Mathlib/NumberTheory/ModularForms/DedekindEta.lean`. Only the odd-shift/component comparisons and general eta multiplier are targets here. |
| Partition conjugation | `TauCeti.conjugate`, `conjugate_parts`, `conjugate_conjugate`, `conjugate_parts_sort`, in `TauCeti/Combinatorics/Enumerative/Partition/Conjugate.lean`; rank-negation is the new comparison. |
| Holomorphic Eichler transformation | `TauCeti.CuspFormClass.eichlerIntegral_slash_apply`, in `TauCeti/NumberTheory/ModularForms/EichlerIntegral/Transformation.lean`; its integral-weight strict-period theorem is imported, not restated as nonholomorphic shadow theory. |
| Formal scalar change and triple/cubic products | ClassicalArithmeticCompletion §§2.31,4.20,4.40,4.60–4.61. Only the new q-series specializations and identities remain. |
| Analytic triple product, Kronecker and Appell–Lerch difference law | GeometryOfNumbersAndQuadraticArithmetic §4.3, including qPochhammer, jacobiProduct, kronecker_single_identity and appell_lerch_difference_identity. No second analytic product or difference-law construction. |
| General Poisson and positive-definite theta | ThetaSeries Layers 1–3; the negative-cone/error-kernel construction is the distinct extension here. |
| Generic cover, finite Weil operators, holomorphic Jacobi carrier and decomposition, unitary comparison | MetaplecticAutomorphicForms §§2.4b–2.6,4.7,6.18,6.20,7.1,7.49, including finiteWeil_conjugate and jacobi_thetaDecomposition. Only the classical-coordinate adapters and nonholomorphic corrections remain here. |
| Integral lattices and discriminant forms | IntegralLattices §§0G,1G–1H; no second lattice or finite quadratic-module carrier. |
| Ordinary residues and contour Cauchy theory | Completed/ContourIntegration Layers 2–3; pinned `TauCeti.Contour.residue`, `classicalResidueTheorem_circle`, `homologyCauchyTheorem` in `TauCeti/Analysis/Contour/Residue/Basic.lean`, `Residue/Theorem.lean`, `HomologyCauchy.lean`. The mixed real-analytic residue is a new comparison, not a replacement. |

Only the first row is an additional deletion relative to the accepted design. The other rows record exclusions already made there and verified again. All are reflected in Scope and ownership and the exact supplier contracts.

## Adversarial mathematics pass

Each target row covers its defining formula, public laws and attached Checks. This is a mathematical consistency pass, not a claim of formal proofs. All new Lean theorem binders were checked directly: ring/semiring instances, positive imaginary part, norm domains, differentiability/C², positive modulus, inverse-of-24 congruence and exponent bounds occur in their own signatures; there are no section variables to be silently dropped.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Coefficients and indices | Zero ring; characteristic 2; n=0,1,2; q=0,1 | Finite products and formal unit inverses retain their stated domains. | None. |
| Roots and phases | τ=i; S,T,−I; ν=±1/2 | Odd-theta pair, eta S-factor 1 and lifted sign agree. | None. |
| Weight and Weil conventions | k=0,1,1/2; rank-zero lattice; L=⟨2⟩ | Zero/log modes, 3/16 shift and positive T-exponent are compatible. | None. |
| 1.1 finite products | Empty product; P₂; q=0,1; zero ring | Initial factor and list multiplicities are retained; no domain hypothesis. | Two examples; named degenerate targets. |
| 1.2 integer indices | a=3,q=2,index −1; a=q=2; index 0 | Values −2 and 1; the pole is outside the domain over ℚ. | Make the negative control’s coefficient field explicit. |
| 1.3 quotient continuation | Q₋₁([3];[1];2), Q₋₁([3];[2];2), A=[2] | Values −1,0 and forbidden denominator; no 0/0 cancellation. | Make the negative control’s coefficient field explicit. |
| 1.4 formal products | a=0,1; first three coefficients; reduction mod 2 | Full product at 1 is zero; tail constant is 1; tail at 0 is 1. | Real stabilized definitions; extra zero-parameter Check. |
| 1.5 product calculus | n=0,1,2; a or q nonunit | Inverse-base triangular exponent and unit guards agree. | None. |
| 1.6 analytic adapter | q=0; a=q⁻¹; finite prefix length 0 | Limit agrees at 0; tail division needs nonvanishing. | Zero divisor moved to supplier; local-uniform and pointwise signatures distinguished. |
| 2.1 unilateral normalization | Empty lists; A=[1]; B=[1] | c₁ has the required sign; stopping precedes any invalid denominator. | None. |
| 2.2 bilateral normalization | j=−1; B=[q]; z=0 | (q−b)/((q−a)z), vanishing negative tail, and z-exclusion agree. | None. |
| 2.3 convergence | q=2,a=±1/2; A=[],B=[0]; zero parameters | Radius 4 versus polynomial; negative-tail exponent is n+1. | Correct both negative-tail indices; add two-term Check. |
| 2.4 binomial/Euler | q=0; a=0,1; reciprocal base 1/2 | Geometric and entire limits agree; inverse-series coefficients 1,2,8/3. | Full two-domain and two-Euler signatures. |
| 2.5 1ψ1 | b=q; a=b; z=0 | Unilateral specialization valid; empty annulus and zero argument excluded. | None. |
| 2.6 Bailey pairs | Zero pair; unit delta pair; n=0,1 | β₀=α₀; n+r denominator is necessary; relation is linear. | Real unit-domain predicate; zero and unit examples. |
| 2.7 Bailey transform/limits | q=a=0; ρ₁=aq; unit delta input | Zero-base transform and limits agree; singular new denominator is excluded. | State all new finite denominator units explicitly. |
| 3.1 Gaussian polynomials | n=0,k=−1,0,1; Q=1,−1; mod 2 | Integral polynomial survives quotient 0/0; product law needs 0≤k≤n. | Add product-law range. |
| 3.2 Schur identities | n=0,1,2; signed floor indices | Initial values 1; next values 1+Q and 1+Q²; no truncation of negative indices. | None; finite statements remain the author’s Pascal derivation. |
| 3.3 Rogers–Ramanujan | q=0; partition sizes 0–4 | Two series start 1,1,1,1,2 and 1,0,1,1,1. | Easy analytic headline retained on actual products. |
| 3.4 quintuple product | z=1; n=0,±1; z=0 | Initial terms 2−2q−2q²; z=0 excluded. | None. |
| 3.5 partition adapter | n=0,1,2,4; odd/distinct comparison | Counts 1,1,2,5; coefficient specialization uses the native carrier. | No duplicate weighted-series construction. |
| 4.1 rank/crank | Empty; (1); (3,2,1,1); (3,3) and conjugate | Strict-filter value −1; size-one asymmetry and no-ones branch agree. | Native real definitions and discriminating examples. |
| 4.2 vector partitions | Empty triple; size 1; swap μ,ν | V₁=z+z⁻¹−1 and signed swap law agree. | None. |
| 4.3 generating functions | Sizes 0–2; z=−1 | C=V+(1−z)X; rank specialization gives f. | None. |
| 4.4 residue counts | t=1,2; constant statistic; reduction mod divisor of t | Fibers sum correctly; divided filter is not used in bad characteristic. | General finite-fiber definition; complex signature separated. |
| 4.4a full dissections | Constant theta-addition term; sizes 4,6,49 | All crank classes at 49 have 15775 elements; rank fails mod 11 at size 6. | Preserve A₉ and its all-coefficient derivation. |
| 4.5 equidistribution | Sizes 4,5,6; rank residue 1 mod 11 | Crank class sizes are 1; rank count is 2. | Keep both general theorem families on native counts. |
| 4.6 offsets | (5,1),(7,1),(11,1),(5,2),(7,3); 2,3 | Offsets 4,5,6,24,243; no inverse of 24 at excluded primes. | None. |
| 4.7 decimation | U₁; U₂X; U₂X²; coefficient-one quadratic | Identity versus 0 and X; linear, not multiplicative. | Real coefficient function; projection formula requires t≠0. |
| 4.8 eta recurrence | ℓ=5,r=1,2; ℓ=11,r=1 | Euler parity and first term 11X agree. | Restrict the unit assertion to Euler tails; φ has positive order. |
| 4.8a integral modules | First two seven-steps; eleven basis orders; p(243) | Exceptional seven-step is retained; distinct orders support uniqueness. | None; no claim to have reconstructed every valuation bound. |
| 4.9 prime powers | r=1,2,3; δ(7,3)=243 | p(243)≡245 mod 343; exponent 49 is sharp here. | General bounded-offset signature and named negative control. |
| 5.1 odd theta | ν=±1/2; z=0,1/2; τ=i | Pair has factor i; derivative is −2πη³; half-period is not a zero. | Native-shift derivative and two-term signatures. |
| 5.2 eta multiplier | T,S,−I; opposite lift | Eta factor at i is 1; multiplier retains the root cocycle. | None. |
| 5.3 error kernel | x=0; derivative at 0; x>0 and −x | E′(0)=2, β(0)=1; smoothing and sign differ. | None. |
| 5.4 Mordell integral | z=0,±1/2; τ=i | h(±1/2;i)=1 and h(0;i)>0; both shifts are needed. | None. |
| 5.5 R correction | ν=±1/2; u=0,u+1; y=0 | Evenness and sign change agree; boundary is excluded. | None. |
| 5.6 μ | u→0; u+1; v off lattice | Negative residue and half-exponential unit-shift sign agree. | None. |
| 5.7 μHat | S-defect; one τ-shift; diagonal shift | h/(2i)+(i/2)h=0; normalization factors match. | None. |
| 6.1 unary theta/correction | a=b=0; a=1/6; scale d>0 | Odd cancellation and −√(2d) shadow agree by differentiating β. | None. |
| 6.2 periods | a=b=0; a=±1/2 | Shifted unary characteristic and boundary crossing term are necessary. | None. |
| 6.3 torsion completion | β→β+1; order 2; zero characteristic | Sign and pole exclusion agree; phase constancy uses determinant one. | None. |
| 7.1 cone datum | Hyperbolic plane; opposite ray; rank-one [−2] | Correct component, primitive boundary and pairing domain are essential. | None. |
| 7.2 indefinite theta | Equal cones; hyperbolic half-characteristic; unweighted negative axis | Values 0, kernel 2, and divergence of the unweighted substitute. | None. |
| 7.3 convergence | Dependent rays; two isotropic boundary vectors | No Q⁺ division for equal rays; boundary decay need not be Gaussian. | None. |
| 7.4 transformations | Hyperbolic determinant −1; odd diagonal matrix; inadmissible b | S-prefactor τ; half-diagonal T-shift and S-domain retained. | None. |
| 7.5 factorization | A=[−2], c=1,2, a=1/4 | Leading minus; nonprimitive c needs two cosets. | None. |
| 8.1 automorphic spaces | Zero; k=0 constant; odd central weight; Γ₀(2) cusp S | Central and all-cusp conditions work without evaluating ρ outside Γ. | None. |
| 8.2 differential operators | 1,y,iy,y²; log y at k=1 | ∂bar y=i/2; ξ₀y=1; ξ₀(iy)=−i; Δ₀y²=−2y². | Real-derivative definitions; explicit C² and Im>0 binders. |
| 8.3 harmonic space | Zero; constant weight 0; local y² | Growth alone does not imply harmonicity; analytic regularity is a supplier gap. | None. |
| 8.4 scalar kernel | k=0,1; w<0; upper-bank w>0 | H₀=eʷ; logarithm replaces coincident powers at weight one. | None. |
| 8.4a general monodromy | Unipotent 2×2; M=2; M=i; M=1 | τ-polynomial, complex frequency, fractional frequency and log mode all needed. | None; check K′(1)=exp(2πB) and Wronskian y⁻ᵏI directly. |
| 8.5 Fourier/xi | Constant mode; conjugate(q⁻¹); rank-zero and ⟨2⟩ lattices | Constant/polar shadows permitted; positive T and central parity agree. | Explicit local polar-shadow signature; no arbitrary-ρ surjectivity. |
| 8.6 exactness | Trivial discriminant; incompatible central eigenspace | Kernel includes all weakly holomorphic forms; descent needs the vector-bundle contract. | None. |
| 8.7 mock object | Zero correction; nonzero C correction; scalar i | Specified normalization and antilinearity retained; no choice-free shadow. | None. |
| 9.1 theta components | m=1,l=0,1; m=0 | First exponents 0 and 1/4; positive-index hypothesis required. | Native-theta HasSum adapter only. |
| 9.2 meromorphic datum | Zero; theta component; nonzero constant at m>0 | Elliptic law excludes the constant; empty poles do not impose τ-holomorphy. | None. |
| 9.3 mixed residues | Double pole with 1+v+conj(v); conjugate term; simple pole | Values 1,0,1; derivatives and affine Jacobian cannot be dropped. | None. |
| 9.4 polar kernel | λ=0; residue class 0 versus m; mixed cone | Residue −1/(2πi); Rₘ,₀(0)=1 versus Rₘ,ₘ(0)=0. | None. |
| 9.5 decomposition | One theta component; double pole; k=1 | Delta coefficients; first Wirtinger derivative; coefficient weight 1/2. | None. |
| 10.1 third-order functions | q=0; signed rank coefficients to degree 4 | f starts 1+q−2q²+3q³−3q⁴; ω's squared denominator retained. | Actual f and its HasSum/Taylor/rank signatures. |
| 10.2 third vector | S₃²; T exchange; first correction; φ/ψ constants | −2C gives +2√6g; exchange and projections agree. | None. |
| 10.3 fifth/seventh definitions | q=0; A₁ initial index; χ₁ removable quotient | Constants agree; starting A₁ at zero would evaluate 0/0. | None. |
| 10.3a Hecke identities | Constants; f₀ first coefficient; ψ₀ and φ₁ | Initial 1+2ψ₀ and factor q are necessary. | None. |
| 10.4 cone models | Cone signatures; leading constants; A₁ leading q | Rank-two models and characteristic assignments agree. | None. |
| 10.5 fifth corrections | First leading exponent; half-argument shift; G₁+G₂ | Opposite corrections and T exchange agree; xi conjugates coefficients. | None. |
| 10.6 fifth transform | S-square; a²+b²=5/4; sum of vectors | Unequal √2 entries are necessary; sum has zero shadow. | None. |
| 10.7 seventh vector | Cone norms; leading powers; component ordering | Q(cᵢ)=−21/2, B=−28; exponents −1/168,47/168,143/168. | None. |
| 10.8 seventh transform | S-square; third T-phase; unary derivative | Normalization 2/√7 and residue −25 modulo 168 agree. | None. |
| 11.1 bilateral rank | q=0; z=−1; removable z=1 | Constant 1 and the f identity agree; no unrestricted formal Laurent sum. | None. |
| 11.2 root completion | α=1/2,1/3; ξ=1; lower unipotent | Nonzero shadow, removable cubic terms and weight change at 1 retained. | None. |
| 11.3 residue mock forms | t=1,2; nonreal residue phase | Empty sum is zero; t=2 gives opposite half-f shadows; filter is antilinear. | None. |

Exact arithmetic controls were rerun for the negative tail, both large-base witnesses, the crank distributions at sizes 4,5,6,49, the rank-eleven counterexample, p(243) modulo 343, the three prime-power families on arguments at most 300, and signed rank coefficients through degree four. They passed. The finite ranges are consistency controls, not proofs of the general identities. The all-coefficient A₉ derivation remains in the README; its correctness is not inferred from the size-49 computation.

## Sources and validation

The manifest contains 18 works: 13 certified, 3 uncertified and 2 waived. The certified line-numbered caches were read at the target anchors and the surrounding normalization/domain passages; difficult passages included Gasper1995 lines 808–854, Zwegers2002 lines 734–849, 1275–1347, 2308–2317, 2691–2696 and 3082–3099, BruinierFunke2003 lines 395–442, 450–484 and 626–651, Garvan1988 lines 687–729, Watson1938 line 108 and Atkin1967 lines 95–121 and 375–410. No source text was copied into the deliverables. Source-service provenance and settled waived/uncertified statuses are preserved. Only the Gasper and Andrews version notes are extended for the corrections. No additional work required fetching, and there is no missing-text request.

**Elaboration outcome:** not available. The brief supplies no executable Lean command; it explicitly says “not available (say so in the report).” Suggested.lean was **not compiled**. There are **49 theorem bodies using sorry**, **0 admitted data definitions**, **20 proved example bodies** and **no set_option**. The exact observed compiler warning count is **0 because no compiler was run**; 49 sorry warnings are expected from the source, but that expectation is not an elaboration result. There are **no other compiler messages** to reproduce. Default-option elaboration, example proofs and `#check @name` outputs remain unverified. This report makes no claim that static inspection substitutes for compilation.

Static validation found 69 target subsections, 214 Checks, 11 Examples sections, 11 Dependencies sections, 12 real definitions, 49 admitted theorem bodies and 20 example bodies in a 532-line Lean file. It checks target/Check retention, all represented README identifiers, all Lean declaration names appearing in the README, the absence of admitted data or option overrides, source/metadata TOML parsing, the untouched plan, explicit theorem binders and whitespace. Each definition/construction retains at least three Checks; each layer retains Examples and Dependencies. Both imports are intentional: a single Mathlib import and the pinned partition-conjugation module used by the rank theorem. No open-roadmap module is imported.

The prescribed dependency command completed with exit status 0. Exact output:

```text
depcheck: 6 roadmaps, 40 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. No merge-order or content-repository file was edited. No GitHub write, issue/comment operation, push, or helper delegation was performed. No suspicious credential or workflow-changing instruction was encountered in the inspected data.
