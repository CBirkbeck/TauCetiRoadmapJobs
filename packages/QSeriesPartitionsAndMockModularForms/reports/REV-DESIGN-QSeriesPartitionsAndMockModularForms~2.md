<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/540#issuecomment-6315055078 -->
Review (codex) of 37fddbe

Verdict: needs_changes

1. **F01** (P1) Eleven-dissection carries a source misprint into its residue-five component

   **Location:** `packages/QSeriesPartitionsAndMockModularForms/design/README.md:488` and `packages/QSeriesPartitionsAndMockModularForms/design/plan.json:1280`, target 4.4a. The offending component is “−(c₂+c₄)(A₃B₂−XA₈B₇)”.

   **Claim:** Dividing the displayed tuple by E(X) gives every residue component of V(ζ₁₁;q).

   **Witness:** At n=49 all eleven crank residue counts are 15775, so [q⁴⁹]V(ζ₁₁;q)=0. The displayed residue-five component instead gives −(c₂+c₄)≠0.

   The witness is reproducible by multiplying the finite product through degree 49 in ℤ[Z]/(Z¹¹−1): each factor is (1−qᵈ)/((1−Zqᵈ)(1−Z⁻¹qᵈ)), 1≤d≤49. All eleven coefficients are 15775. The size-one correction has no effect here. On the claimed side, A₃B₂−XA₈B₇=1−X−X³+O(X⁵), and E(X)⁻¹=1+X+2X²+3X³+5X⁴+O(X⁵); their X⁴ coefficient is 1. For ζ₁₁=exp(2πi/11), −(c₂+c₄) is approximately 0.47889144.

   This is not an extraction mistake: Garvan1988 line 695, equation (6.8), printed p. 64, also prints A₈. I inspected the cached page image. Thus merely matching the source does not repair the mathematical statement.

   **Exact repair:** Replace A₈ by A₉ in this residue-five term only, in both README and plan. The corrected expression is −(c₂+c₄)(A₃B₂−XA₉B₇). Derive it from the product identities preceding (6.8), and identify the correction to the printed formula in the target's source note. Add the q⁴⁹ coefficient as a discriminating Check, with a proved Lean mirror when the eventual package has the required carriers. The corrected numerator has an additional −X⁴, giving coefficient zero after division by E. The corrected full tuple passes the independent coefficient comparison through q¹⁰⁰; this finite control supports the correction but is not its general proof.

2. **F02** (P3) The large-base convergence Check terminates

   **Location:** `packages/QSeriesPartitionsAndMockModularForms/design/README.md:254`, repeated at line 323, and `packages/QSeriesPartitionsAndMockModularForms/design/plan.json:510` and its Layer 2 examples. Quote: “q=2,a=1/2,r=1,s=0 gives radius 4”.

   **Claim:** This is a nonterminating example testing the large-base radius.

   **Witness:** (1/2;2)₂=(1−1/2)(1−1)=0. The entire series is 1−z/2, so its convergence radius is infinite.

   **Exact repair:** Use a=−1/2 with q=2 in both occurrences and in the plan's Check and examples. No numerator factor then vanishes, the coefficient-ratio modulus tends to 1/4, and z=3 is inside the radius 4. Keep a=1/2 as a separate termination control if desired. The general theorem already excludes terminating tails from its divergence claims; its hypotheses need no change.

Two findings: one P1 and one P3. The design can be repaired without changing its scope or supply direction. No design or source-manifest entry was edited.

### Previous findings, checked first

The specified previous review, `packages/QSeriesPartitionsAndMockModularForms/reports/REV-DESIGN-QSeriesPartitionsAndMockModularForms.md`, is absent. The following recheck uses the twelve findings as described in `packages/QSeriesPartitionsAndMockModularForms/reports/FIX-DESIGN-QSeriesPartitionsAndMockModularForms~2.md`; it cannot certify correspondence with the unavailable original review. None of these twelve was marked “not actionable in this package.” Quotations below are from the repaired design README.

| Previous finding | Status | Repaired passage and independent check |
| --- | --- | --- |
| F01, dissection ownership | Partly repaired | Line 486: “Identify every D with its theta-product and, for rank, Lambert-series expression”. §4.4a now owns the complete identities. Five and seven pass coefficient controls; the new eleven formula has the error in R01. |
| F02, eta-module ownership | Repaired | Line 569: “Construct the following integral modules with finite supports, independently of partition divisibility.” The Watson spans, exceptional seven-base steps and Atkin basis are actual targets. Atkin1967 lines 95, 247, 454 and 481 support the basis and operator structure; Watson1938 line 108 verifies the sharp seven-power control. |
| F03, arbitrary-monodromy Fourier ownership | Repaired | Line 949: “No unitary or semisimplicity hypothesis is imposed.” The matrix ODE, logarithm and complementary integrals are explicit. Substitution gives u″+(k/y−4πB)u′=0; the negative-frequency normalization decays. KnoppMason2009 line 220 is correctly limited to holomorphic expansions. |
| F04, faithful projection | Repaired | Line 1000: “For the specified normalized correction, shadow=0 iff F⁻=0”. The statement concerns the supplied correction, not injectivity of the projection to a holomorphic function. The normalized complementary modes have nonzero derivative. |
| F05, unilateral-to-Hecke ownership | Repaired | Line 1163: “prove the eight fifth-order and three seventh-order identities for the actual unilateral functions”. §10.3a owns these equalities before the cone models. All eleven identities agree through degree 30 with independently expanded unilateral definitions. The seventh-order proof source remains settled uncertified. |
| F06, universal numerical level | Repaired | Line 1283: “there exist a congruence subgroup Γ_t of finite index and a common weight-1/2 multiplier χ_t”. The unsupported universal number is gone; the numerical Check concerns one element only. Zagier2009 lines 929 and 952 support the all-order endpoints. |
| F07, Bailey limits | Repaired | Line 307: “The two-parameter limit is Σ aⁿq^(n²)βₙ=P(aq;q)⁻¹Σ aⁿq^(n²)αₙ”. Both limits, nonzero products and weighted summability are explicit. The finite transform matches Andrews1986 equations (2.5)–(2.6), inspected on printed p. 115. |
| F08, nonprimitive cone vector | Repaired | Line 857: “Zwegers states the proposition for primitive c”. The finite-index extension is identified as a derivation, with c=2 and two cosets checked separately. |
| F09, Weil sign | Repaired | Line 24: “The representation ρ_L is the complex conjugate of MetaplecticAutomorphicForms §4.7’s ω_L”. The supplier's `finiteWeil_T` and `finiteWeil_conjugate` agree. The ⟨2⟩ Check gives T=i, Z=−i and exponents ℤ+1/4. |
| F10, reference/process prose | Repaired | Line 1323: “QWittVectors remains an independent algebraic producer.” References are bibliographic; access statuses remain in the manifest. No job IDs, pull-request references or machine paths occur in the design README. |
| F11, stabilizer and holomorphic comparison | Repaired | Line 735: “finite-index stabilizer”; line 1042: “for jointly holomorphic modular data”. Empty poles now imply only pointwise holomorphy; the supplier comparison separately retains weight, multiplier and cusp hypotheses. |
| F12, theta-kernel owner | Repaired | Line 11: “Automorphic theta kernels, theta lifting and Siegel–Weil theory belong to MetaplecticAutomorphicForms Layers 5–6”. Those layers exist and have this scope. |

## Verified sound

### Scope, shape and coverage

Read the complete design README and plan, including all 69 targets, 249 public API entries, 206 Checks, conventions, supplier contracts and 69 `*Needs:*` lines. The plan contains 33 definitions, six constructions and 30 theorem targets. Every definition/construction has an API and at least three Checks. All target, API and Check names in the plan occur in the README; all 69 targets have source locators. The 11 layers each end with Examples and Dependencies. Every internal prerequisite resolves to an earlier target; the plan has no internal dependency cycle.

Compared the house shape with main-branch `TauCetiRoadmap/ComplexTori/README.md`, `TauCetiRoadmap/ThetaSeries/README.md` and `Completed/ContourIntegration/README.md`. The design has the required summary, ownership, conventions, supplier contracts, build paragraph, layers, consumers and references. It retains arbitrary coefficient rings for finite/formal products, actual bilateral pole domains, nonsemisimple monodromy, isotropic cone boundaries, arbitrary pole order and all rational cusps. The special partition congruence primes are the theorem's arithmetic content, not a discarded general coefficient case. No computational procedure is proposed as a library endpoint. No copied source prose was found in the passages compared; mathematical formulas and locators are used as such. No `set_option`, admitted data, LaTeX delimiters or process references were found in the design README. There is no Lean file in this design package.

The supplied gap slugs agree between plan and README: `classical-metaplectic-model`, `analytic-elliptic-regularity`, and `vector-bundle-dolbeault`. Each has a named earlier owner and a detailed mathematical contract. The details specify the cover equivalence and lifts, analytic coefficients and interior ellipticity, or a finite-rank bundle on a compact Riemann surface with a nonzero effective cusp divisor and growth-controlled primitive. These are extensions of the named suppliers, not unowned prerequisites. They were not counted as findings. Acceptance after repair would remain conditional on these three contracts.

### Seeded source checks

All fifteen selected locators were inspected against the supplied cached texts. Printed pagination was checked separately from PDF page numbering. Where the target generalizes a displayed formula by finite algebra or an explicit analytic argument, that distinction is recorded below. No additional target locator is flagged unverified in the README or plan. The manifest's five waived/uncertified works are accounted for under Not verifiable, without reopening their settled access status.

| Target | Text inspected | Result |
| --- | --- | --- |
| 1.1 q pochhammer fin | Gasper1995 line 81, (1.2.3), p. 2; line 477, (2.1.7), p. 9 | Index zero, finite length and parameter multiplicity agree. Extension from complex notation to commutative rings is finite-product algebra. |
| 1.6 q pochhammer limit | Gasper1995 line 127, (1.2.7), p. 3; line 328, Exercise 1.1(i), p. 7 | Product and finite-tail relation agree. Local uniformity and the exact zero locus use the stated geometric majorant and pinned nonvanishing theorem; division is guarded, including q=0. |
| 2.6 bailey pair | Andrews1986 line 93, (2.3), p. 114 | Denominator indices n−r and n+r agree. The general-ring version retains units and separates normalization from the linear relation. |
| 2.7 bailey lemma | Andrews1986 line 93, (2.3)–(2.6), pp. 114–115; line 153, (3.1), p. 116 | Finite α′ and β′ match the scanned equations. The extraction omits these formulas, so printed p. 115 was rendered and read. The general-a and fixed-ρ limits are explicit derivations with summability, not claimed verbatim source statements. |
| 3.3 rogers ramanujan | Gasper1995 line 1672, (4.2.11)–(4.2.12), p. 29; Pak2002 line 3703 and line 3745, §§7.1.1–7.1.3, pp. 38–39 | The two products, exponent shifts, disc condition and counting interpretations agree. Formal scalar change is separately owned/imported. |
| 3.4 quintuple product | Gasper1995 line 605, (2.2.10), p. 11 | Both products, signs, bilateral exponent and z≠0 agree. The target owns its theta-addition proof input rather than attributing a proof to this display. |
| 4.2 weighted vector partition | AndrewsGarvan1988 line 24, (1.4)–(1.11), pp. 167–168 | Distinct first partition, sign by its length, and difference of the other lengths agree. Size-one coefficient z+z⁻¹−1 verifies the convention. |
| 4.8 partition eta decimation | Atkin1967 line 375, (29)–(33), p. 23, and line 410, Lemma 10; Watson1938 §§1–4 | The eleven recurrence and alternating Euler factors agree. The five/seven versions follow directly by coefficient extraction; first shifts are 4,5,6 and the second five-shift is 24. |
| 5.1 zwegers odd theta | Zwegers2002 line 336, Proposition 1.3, p. 8 | The half-integer shift, oddness, simple zero lattice, S/T factors and derivative −2πη³ agree. The pinned native theta has exactly the exponent needed by the adapter. |
| 5.3 error function kernel | Zwegers2002 line 485, Definition 1.6 and Lemma 1.7, p. 11 | Primitive normalization, β integral, real-domain sign identity and β(0)=1 agree. The displayed tail bound follows by bounding t⁻¹/² at its lower endpoint. |
| 8.3 harmonic weak maass space | BruinierFunke2003 line 366, §3, pp. 8–9; line 487, H⁺, p. 11 | C², exponential growth at every cusp, the Laplacian and inverse-image cusp-shadow definition agree. Arbitrary representation and k=1 are defined extensions; the source's k≠1 results remain separately restricted. |
| 8.4 maass fourier kernel | BruinierFunke2003 line 395, §3, pp. 9–10 | ODE, incomplete-gamma kernel, asymptotics and two modes agree. The upper-bank convention and k=1 logarithmic zero mode are explicitly supplied by the design. H₀(w)=exp(w) verifies the normalization. |
| 9.2 meromorphic jacobi datum | Zwegers2002 line 2660, (E),(M), p. 49; line 3101, Theorem 3.9, p. 57 | Positive integral index, integral weight and pointwise meromorphy agree. No unjustified τ-holomorphy is inferred from empty poles. |
| 9.3 real analytic meromorphic residue | Zwegers2002 line 3082, Definition 3.8, pp. 56–57 | Mixed coefficient (−1,0), factorial and Wirtinger derivative agree. Increasing the pole bound and affine Jacobian covariance follow from the coefficient definition. |
| 10.5 fifth order vectors | Zwegers2002 line 4329 and line 4402, pp. 74–75; line 4770 and line 4844, pp. 79–80 | Both six-component vectors, half-argument signs, all correction characteristics/phases, factor 1/2 and opposite corrections agree. The shadow rule follows from the independently checked scale √60 and conjugation. |

Additional source checks covered the four newly owned targets and repair-sensitive endpoints: Garvan1988 lines 419, 609, 687 and 709; Atkin1967 lines 95, 247, 454 and 481; Watson1938 lines 108, 409, 1081 and 1322; KnoppMason2009 lines 188–241; BruinierFunke2003 lines 423, 480 and 626; Zwegers2002 lines 3101–3136; BringmannOno2006 lines 270–337; BevilacquaChandranChoi2019 lines 39–44; Zagier2009 lines 929–965. The new finding R01 arose from checking the source formula mathematically, beyond its locator.

### Adversarial mathematics table

Each row covers the named target's definition or theorem, its associated public laws and Checks. “No defect found” records a mathematical review and the listed controls, not a completed formal proof. Nonapplicable defect classes (for example DVR ramification in a complex analytic statement) were not turned into artificial hypotheses. The relevant domain, unit, finiteness, parity, normalization, vacuity and ownership questions were checked throughout.

| Statement | Instances tried | Result | Change required |
| --- | --- | --- | --- |
| Conventions: finite/formal products | n=0,1,2; q=0,1; zero ring and 𝔽₂ | Empty product, index-zero factor and unit positive tail differ as stated. | None |
| Conventions: analytic variables and roots | τ=i; T,S,−I; q=0 and q=1 | Fractional powers require τ; eta phases give 1 at S(i) and −i at −I. | None |
| Conventions: odd theta and statistics | ν=±1/2; empty partition; (1); (3,2,1,1) | Theta pair and derivative sign agree; singleton crank is −1, strict crank filter matters. | None |
| Conventions: cones and Weil module | Hyperbolic plane; ⟨2⟩; reversed cone pair | Kernel 2 changes sign on reversal; T=i and Z=−i in the selected Weil convention. | None |
| Conventions: xi and completion | y^(1−k), log y, scalar i; zero correction | Xi is antilinear; k=1 needs log y; completion remains part of the object. | None |
| 1.1 qPochhammerFin | n=0,1,2; q=0,1; zero ring | P₂=1−a−aq+a²q; ring maps and list append preserve factors. | None |
| 1.2 qPochhammerInt | a=3,q=2,index −1; a=q=2 | Values −2 and an excluded reciprocal pole. Mixed concatenation has the common unit domain. | None |
| 1.3 qPochhammerRatio | Lists [3]/[1] and [3]/[2], q=2,index −1 | Values −1 and 0; continuation does not divide two undefined negative products. | None |
| 1.4 formalQPochhammer | Degrees 0–2; a=1; characteristic 2 | Full product vanishes at a=1; positive tail remains a unit. | None |
| 1.5 qPochhammer_calculus | n=2 inversion; n=0 concatenation; a=0 | Correct a²q factor; a=0 excluded from inversion only. | None |
| 1.6 qPochhammer_limit | q=0; a=q⁻¹; a=0 | Values 1−a and zero tail; a=0 gives 1. Zero factors are exactly the obstruction. | None |
| 2.1 basicHypergeometricPhi | Empty lists; numerator 1; denominator 1 | First coefficient −1/(1−q); legitimate termination and forbidden denominators remain distinct. | None |
| 2.2 basicHypergeometricPsi | Index −1; B=[q]; z=0 | Negative term (q−b)/((q−a)z), vanishing tail and excluded zero argument agree. Shift exponent checked by replacing j with j+k. | None |
| 2.3 basicHypergeometric_convergence | Zero parameters; two bilateral tails; q=0; q=2,a=1/2 | General degree/ratio domains are guarded; the selected radius Check terminates. | R02 |
| 2.4 qBinomial_and_euler | q=0; q=1/2; degree 2 | (1−az)/(1−z), 1+z, and Euler coefficients 1,2,8/3 agree. Formal denominators are units. | None |
| 2.5 ramanujan_onePsiOne | b=q; b=q²; a=b | Shifted unilateral cases are retained; a=b makes the required annulus empty. | None |
| 2.6 baileyPair | Zero and unit pairs; n=0,1 | β₀=α₀ and both denominator indices correct; linearity does not impose normalization. | None |
| 2.7 baileyLemma | n=0,1; a=0; ρ=aq | Transform agrees with the scanned formulas; forbidden denominator excluded; weighted limits keep nonzero products. | None |
| 3.1 gaussianPolynomial | G(2,1); k=−1; Q=1,−1; 𝔽₂ | 1+Q; outside range zero; polynomial survives quotient 0/0. | None |
| 3.2 schur_finiteIdentities | Both identities, n=0,…,12 | Independently generated q-Pascal polynomials agree through degree 30; initial values and signed floor indices correct. | None |
| 3.3 rogersRamanujan | q=0; degrees 0–4; scalar reduction | Coefficients 1,1,1,1,2 and 1,0,1,1,1; empty partition retained. | None |
| 3.4 quintupleProduct | z=1; z=0 excluded; two triple-product sums | Initial terms 2−2q−2q²; theta addition produces the two cubic-index sums with the displayed sign. | None |
| 3.5 partitionSeries | p(0),p(1),p(2),p(4); Euler multiplication | 1,1,2,5 and inverse-product coefficients agree on the native carrier. | None |
| 4.1 partitionRankCrank | Empty; (1); (3,2,1,1); (3,3) and conjugate | Crank correction and strict inequality confirmed; conjugate rank reverses. | None |
| 4.2 weightedVectorPartition | Sizes 0,1; swap last two partitions | V₀=1 and V₁=z+z⁻¹−1; weight fixed and statistic negated by swap. | None |
| 4.3 rankCrank_generatingFunctions | n=1; z=−1; unit-circle denominators | Ordinary crank coefficient is z⁻¹; rank specialization is f; positive product factors do not vanish. | None |
| 4.4 partitionResidueCounts | t=1,2; n=1; characteristic dividing t | Counts sum to p(n); multiplied filter survives reduction without division by t. | None |
| 4.4a rankCrankDissections | Five/seven/eleven product expansions; n=49; q=0 theta addition | Five/seven agree through q¹⁰⁰. Eleven fails at q⁴⁹; replacing the indicated A₈ by A₉ passes the same control. | R01 |
| 4.5 partitionEquidistribution | Sizes 4,5,6; rank mod 11 | Crank class sizes all 1; rank mod 11 fails. Endpoint does not assert eleven-rank equidistribution. | None beyond upstream R01 |
| 4.6 partitionCongruenceOffset | (5,1),(5,2),(7,3),(11,1); primes 2,3 | 4,24,243,6; inversion of 24 is properly excluded at 2 and 3. | None |
| 4.7 qSeriesDecimation | t=1; U₂(X),U₂(X²); pullout monomials | Identity, 0 and X; operator is linear and is not multiplicative. | None |
| 4.8 partition_etaDecimation | First eleven-step; first two five-steps | L₁ begins 11X; offsets 4 and 24 with the correct parity Euler factors. | None |
| 4.8a etaDecimationModules | First five/seven images; exceptional b₇ coefficient; eleven basis orders | Seven first image divided by 7 misses O₇; separate base step is necessary. Atkin order/valuation arrays agree with the cited basis and inclusions. | None |
| 4.9 partition_primePowerCongruences | r=1,2,3 at 7; p(243) | Gains 7,49,49; Watson's p(243)≡245 mod 343 rejects the stronger false gain. | None |
| 5.1 zwegersOddTheta | ν=±1/2; z=0,1/2 at τ=i | Odd pair, simple zero and nonzero half-period distinguish the shifted native theta. | None |
| 5.2 etaMultiplier | Identity,S,T,−I; opposite lift | S/T phases and lifted sign agree; no ordinary SL₂ character is asserted. | None |
| 5.3 errorFunctionKernel | x=0; derivative at 0; x>0 | E(0)=0, β(0)=1, E′(0)=2; the tail bound has the required positive lower endpoint. | None |
| 5.4 mordellIntegral | z=±1/2 at τ=i; z=0 | Half-values 1; positive value at zero; both inhomogeneous shifts distinguish the function. | None |
| 5.5 zwegersR | u=0 central pair; unit shift; y=0 | Even pair, sign reversal under unit shift, excluded boundary; Gaussian differentiation gives the displayed dbar normalization. | None |
| 5.6 zwegersMu | u→0; unit shift; common joint shift | Residue −1/(2πiϑ(v)); unit shift −1; m-normalization agrees with the supplier's denominator indexing. | None |
| 5.7 zwegersMuHat | S-defect; one τ shift; common τ shift | h/(2i)+(i/2)h=0; separate shift has the quadratic factor, common shift factor 1. | None |
| 6.1 unaryThetaCharacteristic | a=b=0; a=1/6; scaling d | Zero pairing; leading coefficient 1/6; derivative gives −√(2d), not a complex-linear shadow. | None |
| 6.2 zwegers_periodFormulas | a=b=0; a=1/2 boundary | Correct shifted characteristic; boundary sign term cannot be omitted. | None |
| 6.3 torsionLerchCompletion | Unit β shift; u=1/2,v=τ/2; zero characteristic | Sign −1; order-two pole-free case; zero characteristic excluded. Matrix phase differentiates to zero using determinant one. | None |
| 7.1 zwegersConeDatum | Hyperbolic same/opposite components; rank one | Boundary vectors separated correctly; rank one has no nonzero isotropic vector. | None |
| 7.2 zwegersIndefiniteTheta | Equal cones; hyperbolic ± pairs; negative axis | Zero equal-cone kernel; 2 and 0 boundary kernels; unweighted negative-axis sum diverges. | None |
| 7.3 zwegersIndefiniteTheta_convergence | Equal rays; two isotropic boundaries; negative c | Q_c positive; Q⁺ not invoked on dependent or boundary pair; boundary decay is exponential rather than a false uniform Gaussian. | None |
| 7.4 zwegersIndefiniteTheta_transform | Hyperbolic plane; diag(1,−1); inadmissible b | S-prefactor τ; odd half-diagonal shift retained; transformed boundary domain guarded. | None |
| 7.5 indefiniteCorrection_unaryFactorization | A=[−2],c=1 and 2,a=1/4 | −C(1/4,0;2τ); nonprimitive case has two terms at 8τ with characteristics 1/8 and 5/8. | None |
| 8.1 realAnalyticModularSpace | Zero; weight-zero constant; odd scalar weight; Γ₀(2) cusp S | Central obstruction and all-cusp conditions correct; ρ(S) is never required outside its domain. | None |
| 8.2 holomorphicWeightOperators | yˢ; y,iy at k=0; log y at k=1 | Δyˢ=−s(s+k−1)yˢ, xi₀(y)=1, xi₀(iy)=−i; factorization and 3/16 normalization agree. | None |
| 8.3 harmonicWeakMaassSpace | Zero; constant; y² at k=0 | First two harmonic, y² not; analytic regularity is an explicit contract. | None |
| 8.4 maassFourierKernel | k=0; w<0; k=1 zero frequency | H₀=exp(w), negative integral nonzero, log y supplies the missing independent mode. | None |
| 8.4a parabolicFourierExpansion | M unipotent; scalar M=2 or i; β=0 | Polynomial mode (τ,1), complex logarithmic frequency, shift 1/4 and log y all retained. Reduction of order and Wronskian checked directly. | None |
| 8.5 harmonicMaass_fourierAndXi | Rank zero; ⟨2⟩; constant mode; conj(q⁻¹),k=0 | Central parity and shifted support agree; xi₀(conj(q⁻¹))=4πq⁻¹ permits polar shadows. | None |
| 8.6 harmonicMaass_xi_exact | Zero/compatible and incompatible central eigenspaces; weakly holomorphic kernel | Kernel is M!, not bounded holomorphic forms. Surjectivity stays in the Weil setting; conjugation of the last complex term is required. | None |
| 8.7 mockModularForm | Zero correction; C(1/6,0); scalar i | Shadow attached to completion; zero-shadow assertion concerns the correction; Eichler lower-end derivative is (i/2)y^(−k)conj(g). | None |
| 9.1 jacobiThetaComponent | m=1,l=0,1; index zero | Leading terms 1 and q^(1/4)(e(z)+e(−z)); m=0 excluded. | None |
| 9.2 meromorphicJacobiDatum | Theta; zero; nonzero constant; arbitrary τ dependence | Theta/zero satisfy elliptic law; constant fails for m>0; empty poles do not force τ regularity. | None |
| 9.3 realAnalyticMeromorphicResidue | (1+v+conj(v))/v²; conj(v)/v; 1/v | Residues 1,0,1; antiholomorphic degree and pole-bound independence correct. | None |
| 9.4 completedJacobiPolarKernel | λ=0 pole; classes 0,m; mixed cone | Residue −1/(2πi); R_m,0(0)=1, R_m,m(0)=0; negative/isotropic cone norms agree. | None |
| 9.5 meromorphicJacobi_decomposition | One theta component; double pole; k=1 | Delta coefficients; first Wirtinger derivative; coefficient weight 1/2. Formula matches Theorem 3.9 without an added harmonicity promise. | None |
| 10.1 thirdOrderMockTheta | q=0; f and ω through degree 3 | Constants 1,1,1,0; f=1+q−2q²+3q³; ω=1+2q+3q²+4q³. | None |
| 10.2 thirdOrder_completedVector | First correction; T exchange; φ/ψ projections | −2C correction, nonzero 2√6 shadow, exchanged half-arguments and related constants agree. | None |
| 10.3 fifthSeventhOrderSeries | All constants; A₁ initial index; χ₁ quotient | A₁ begins q; φ₁(−q)/q tends to −1; ψ₁ retains constant 1. | None |
| 10.3a fifthSeventhOrder_unilateralToHecke | All eleven identities through degree 30 | Independent finite expansions agree, including corrected ψ₀ and φ₁ factors and all three seventh-order dictionaries. | None |
| 10.4 mockTheta_heckeThetaIdentities | Both diagonal fifth-order forms; seventh cone | Signatures (1,1); seventh negative norms −21/2 and pairing −28; identifications consume the earlier unilateral target. | None |
| 10.5 fifthOrderVectors | Six entries; opposite corrections; first leading shift | Exact agreement with both source vectors; shadow scale −√60 and conjugated coefficients. | None |
| 10.6 fifthOrder_transform | S²; half-argument T exchange; vector sum | Matrix squares to identity; unequal √2 factors retained; sum has zero correction. | None |
| 10.7 seventhOrderVector | A₀,A₂,A₁ order; leading exponents; cone norms | Exponents −1/168,47/168,143/168; correction and theta ordering agree. | None |
| 10.8 seventhOrder_transform | S²; third T phase | Sine matrix squares to identity; 143≡−25 mod 168. Unary correction supplies harmonicity. | None |
| 11.1 rankSeries_bilateral | z=−1; q→0; z→1 | f specialization, constant 1 and removable partition-series limit agree; negative-index expressions at q=0 are taken by the stated limiting convention. | None |
| 11.2 rankRootCompletion | α=1/2,1/3; trivial root; lower unipotent | Third-order correction recovered; order-three poles require cancellation; trivial root has weight −1/2. Common level is existential. | None |
| 11.3 rankResidue_mockModularity | t=1,2; nonreal residue phases | Zero at t=1; opposite half-f completions at t=2; xi conjugates filter coefficients. | None |

### Duplication and supplier audit

The pinned commits used were Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. GitHub code searches located objects, then the relevant files were read at those commits, rather than treating default-branch search results as pinned evidence.

| Object | Existing owner read | Audit conclusion |
| --- | --- | --- |
| Native partitions, weights and generating products | `Mathlib/Combinatorics/Enumerative/Partition/GenFun.lean`, `Nat.Partition.genFun`, `coeff_genFun`, `hasProd_genFun`; `Partition/Glaisher.lean` | Imported; §3.5 is the ordinary specialization and analytic adapter. No second partition carrier. |
| Rising/falling versus q-Pochhammer | `Mathlib/RingTheory/Polynomial/Pochhammer.lean:14` | Pinned objects are ordinary rising/falling factorial polynomials, not the q-products here. Object searches found no competing finite q-product or Gaussian polynomial definition. |
| Power-series units and Euler pentagonal product | `Mathlib/RingTheory/PowerSeries/Inverse.lean`, `invOfUnit`, `mul_invOfUnit`, `isUnit_iff_constantCoeff`; `Mathlib/Combinatorics/Enumerative/Pentagonal/PowerSeries.lean`, `pentagonalSeries`, `WithPiTopology.hasProd_one_sub_X_pow` | Correctly imported. Formal positive-tail unit construction respects the native constant-coefficient criterion. |
| Analytic theta, eta, product convergence | `Mathlib/NumberTheory/ModularForms/JacobiTheta/TwoVariable.lean`, `jacobiTheta₂_term`, `jacobiTheta₂`, `hasDerivAt_jacobiTheta₂_fst`, `jacobiTheta₂_functional_equation`; `DedekindEta.lean`, `eta`, `eta_ne_zero`; `Mathlib/Analysis/SpecialFunctions/Log/Summable.lean:222` | Exact phases and nonvanishing hypotheses read; §5.1 is a shifted adapter, not a second generic theta theory. |
| Partition conjugation and Eichler integral | `TauCeti/Combinatorics/Enumerative/Partition/Conjugate.lean`, `conjugate`; `TauCeti/NumberTheory/ModularForms/EichlerIntegral/Transformation.lean:121`, `CuspFormClass.eichlerIntegral_slash_apply` | Native conjugation is consumed. The pinned Eichler theorem has k=n+2, arithmetic level and strict positive periods; it is distinct from the nonholomorphic correction here. |
| Formal specialization, triple/cubic products | `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:3619`, 8210, 8809, 9339, 9366 | §§2.31,4.20,4.40,4.60,4.61 exist with the claimed contracts and remain imported. |
| Analytic product, triple product, m(x,q,z) | Open-head `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:2195` and 2197 | §4.3 owns the analytic product and Appell–Lerch difference identity. The μ adapter uses the same shifted denominator. No reverse supply citation to this design. |
| Poisson, positive-definite theta, finite quadratic modules | `TauCetiRoadmap/ThetaSeries/README.md:423` and 587; `TauCetiRoadmap/IntegralLattices/README.md:568`, 642, 667 | Gaussian Fourier sign, arbitrary rank, hyperbolic plane and discriminant-module ownership agree. Odd indefinite lattice transforms do not assume an even discriminant form. |
| Cover, finite Weil, Jacobi spaces and half-weight spectral theory | Open-head `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:476`, 1244, 1768, 1804, 1834, 1850, 2378 | All named sections exist. The conjugate Weil convention and classical/unitary normalization match. Its L² spectral space is distinct from exponential-growth harmonic spaces. The rank-one classical pair comparison remains a declared gap. |
| Contours, scalar modular forms and elliptic regularity | `Completed/ContourIntegration/README.md`, Layers 2–3; `TauCetiRoadmap/ModularForms/README.md`, Layers 0 and 10B; `TauCetiRoadmap/PDE/README.md:322` | Imported contracts exist. Vector-bundle Dolbeault and analytic regularity are correctly identified as extensions, not falsely attributed to the existing scalar/smooth results. |
| Other open roadmap heads | CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers, ArithmeticDynamics | Read head scope and searched the target objects. They concern syntomic/relative coefficients, p-adic integration, q-Witt algebra, progression powers and dynamics respectively; none supplies these q-series/completion targets. ArithmeticDynamics was read via its head blob after the file endpoint returned empty content. |
| Board consumers | `packages/CountingBundlesAndHallAlgebrasOfCurves/design/README.md:427` and board-wide object searches | Its q-binomial mass input remains a consumer. No second owner or upward prerequisite was found. |

All supplier sections and `*Needs:*` citations were read together with the merge order. No upward citation or cycle was found; no object move to another roadmap is required by this review. The design's last ordered supplier is MetaplecticAutomorphicForms. The declared gaps stay with their existing owners.

The exact prescribed dependency command failed because its candidate `packages/QSeriesPartitionsAndMockModularForms/README.md` does not exist at the design stage. Its terminal error was `FileNotFoundError` for that candidate; no dependency result was produced. Absolute paths in the traceback are intentionally not reproduced. Re-running the same gate with candidate `packages/QSeriesPartitionsAndMockModularForms/design/README.md` succeeded with exit 0 and this exact output:

```text
candidate: QSeriesPartitionsAndMockModularForms is not in the merge order yet; checked as if placed after MetaplecticAutomorphicForms (the intake inserts it when its design is accepted)
depcheck: 6 roadmaps, 40 edges, 0 problem(s)
```

No tooling, candidate file or merge-order file was changed to obtain that result.

## Not verifiable

- The original prior review is unavailable at the specified repository-relative path. The twelve repair-report entries were checked directly, but their original wording cannot be compared.
- Lean elaboration: **not available**. This is a design-stage package with no `Suggested.lean`, and the brief supplies no runnable elaboration command. No Lean command was run; there is no build result or warning set to certify. Package-stage signatures, retained binders and proved examples still require their own review.
- AtkinSwinnertonDyer1954, pp. 84–106: settled `uncertified` in `sources.toml`; the complete rank-dissection proof could not be text-certified. The named ownership target and low-degree consequences were reviewed. No new access request was made.
- Hickerson1988, pp. 665–666: settled `uncertified`; the seventh-order proof could not be read. Its identity statements are corroborated by Zwegers2002 and independent coefficient controls, which do not certify Hickerson's proof.
- Andrews1976, Chapters 1,7,10: settled `uncertified` bibliographic background. GasperRahman2004, §§1.2,5.1, and BFOR2017: settled `waived` background. Their locators were not guessed or reopened.
- Direct web access to the Andrews1986 PDF returned HTTP 403. This did not prevent the seeded check: the legally cached PDF was available, and its printed p. 115 was rendered and read. No source remains newly missing, so no `needs-references.toml` request was created.
- Numerical or finite coefficient controls do not prove infinite analytic identities, all-index valuation estimates or supplier-gap theorems. The report distinguishes those controls from source verification and mathematical derivations.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "37fddbecd5d5ecda42ce246027665a7850f61cf6", "job": "REV-DESIGN-QSeriesPartitionsAndMockModularForms~2", "model": "gpt-6-astra", "worker": "chris-1"} -->
