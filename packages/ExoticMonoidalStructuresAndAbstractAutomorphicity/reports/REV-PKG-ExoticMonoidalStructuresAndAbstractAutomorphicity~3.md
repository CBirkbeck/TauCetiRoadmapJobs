<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1277#issuecomment-6399379077 -->
Review (codex) of 3a403ad

Verdict: accepted
Conditional on the announced gaps: `smooth-balanced-tensor`, `smooth-tor-residual-action`, `firm-centre-enrichment`, `transpose-central-distributions`, `twisted-spherical-centre`, `equal-characteristic-fourier`, `normalization-module-freeness`, `compact-data-global-zeta`, `odd-equal-characteristic-gl2-classification`, `all-generic-kirillov`, `rational-theta-characteristic`, `ordinary-presentable-linear-tensor`, `determinant-pushforward`, `sl2-rational-unipotent-generation`, `eisenstein-constituent-automorphicity`, `function-field-cuspidal-multiplicity-one`

1. **F01** (P3) The global two-point example needs neighbourhood support

   **Location:** `packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/README.md:899`: “Take a test function supported on two rational pairs (E₀₁,1) and (E₁₀,1), with values a and b.”

   **Claim:** Such an ambient Schwartz–Bruhat test function supplies the two-term theta example for arbitrary a,b.

   **Witness:** Every neighbourhood of either pair contains infinitely many adelic points. A locally constant function supported on those two points is zero. Taking a=2,b=3 is therefore impossible, although the intended theta value is 5.

   **Exact repair:** Say that the compact support *meets the rational locus in precisely those two pairs*. Choose disjoint compact open neighbourhoods U₁,U₂ with those rational intersections and put Ψ=2·1U₁+3·1U₂. Rational discreteness supplies these neighbourhoods. Then Ψ has the prescribed values 2 and 3, Θ(Ψ)=5, and Θ(Ψ∘transpose)=3+2=5. This is the same ambient-support pattern as round 2 F04; its local occurrence at §0.5 is repaired, but this worked example remained. The source theorem is unaffected.

2. **F02** (P3) Three source-line anchors point to different material

   **Location:** `packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/README.md:279`, :439 and :792, respectively: “Dor23 line 768”, “Dor23 line 1144”, “Dor23 line 1980”.

   **Claim:** These line anchors locate the open integral, Whittaker trace/symmetry and adelic monoidal construction.

   **Witness:** Dor23 line 768 starts Lemma 2.19, line 1144 is inside the preceding unit calculation, and line 1980 is an introductory paragraph before §4.2. The named results are elsewhere.

   **Exact repair:** At :279 use Dor23 line 358 for equation (2.2) and line 854 for Remark 2.21. At :439 use line 1178 for Remark 3.17, line 1199 for Claim 3.18 and line 1258 for Corollaries 3.20–3.21. At :792 use line 1991 for §4.2, line 2025 for Claim 4.3 and line 2039 for Corollary 4.4. The existing theorem numbers and printed page ranges are correct. Opening each replacement gives the stated formula or assertion directly; the computed tests below are unchanged.

3. **F03** (P3) Remove repair history from the mathematical prose

   **Location:** `packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/README.md:1411`: “including its large-degree convolution repair”.

   **Claim:** This describes the mathematical input to the component proof in timeless house style.

   **Witness:** “repair” describes a correction to earlier work rather than the mathematical statement. Section 11.3 already supplies the four-term identity and its large-positive-degree argument.

   **Exact repair:** Replace the phrase with “including its large-degree convolution argument”. The negative-degree test is unchanged: degree −5 and auxiliary degree 10 give required positive degrees 10,5,15; the four-term identity still recovers the original class. This is a wording correction only.

Three P3 findings; no P1 or P2 finding. Acceptance is conditional on the sixteen named supplier gaps listed below. These are declared contracts, not claims that the supplier implementations already exist. The four findings from round 2 were checked first, individually. No finding marked not actionable by the repair report is re-raised. The mathematical package, metadata, plan and sources manifest were not edited.

## Verified sound

Read all four package files, all 58 numbered target subsections, every API and Check, every Needs line, all twelve layer dependency summaries, and the plan's gaps. Rechecked all fifteen targets in this round's seeded sample against the legal cached texts, including hypotheses, formulas, theorem numbers and printed pages. No author-flagged unverified locator remains; Arm67 is separately settled as uncertified. No new source fetch was needed.

The round 2 adversarial table has computed target rows covering all 58 subsections. Its unchanged rows are retained as evidence only where they contain explicit values. I did not treat its general statements that something was checked as evidence. This round freshly tests the repairs, their repeated patterns, the seeded targets and the headline groups below. In particular, the old theta row computed a+b correctly but did not validate the existence of its ambient test function; R01 supplies that missing check. The following probes check hypotheses and conventions; they do not purport to prove the future deep theorems.

### Previous findings, checked first

All locations in this table refer to `packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/README.md`.

| Round 2 finding | Repaired passage | Verification and status |
| --- | --- | --- |
| F01: equal-characteristic classification | :89: “Extend §R16.2.1 to every nonarchimedean local field F of positive odd characteristic” | **Repaired in this package.** The separate odd-equal-characteristic-gl2-classification gap occurs in both plan and README. It states both exceptional ratios, four classes and genericity, and names existing SR.3a.1/SR.5.2 inputs. The repair report correctly leaves supplier implementation outside this package. This is a declared condition of acceptance, not a new finding. |
| F02: mirabolic and Schur suppliers | :43: “Use §SR.5.1, mirabolic-derivatives and derivative-exactness”; :281: “countable Schur from SmoothRepresentationsOfLocalGroups §SR.3a.1” | **Repaired.** Read the actual supplier targets at :3647, :3685, :3696 and :2335. The exact unnormalized functors, complex specialization and countability hypothesis fit. Their consumers and layer summaries now cite them. |
| F03: nonexistent equivalence reference | :476: “The essential-image theorem §3.5 supplies closure under colimits.” | **Repaired.** Section 3.5 at :556 states the equivalence and colimit-closed image. The obsolete reference is absent. F(0)=0 and F(Z)=Iunit are consistent with the corrected target. |
| F04: impossible singular-support Check | :225: “Ψ(0,1) = Ψ(I₂,1) = 1 and Ψ(t⁻¹I₂,1) = 0.” | **Repaired locally.** The actual compact open indicator has these values; every extension from Y° is zero at (0,1). Searching the same pattern elsewhere found the separate global example in R01. |

The classification extension is propagated through §§1.2–1.4, 4.4, 5.4 and 11.6 and their dependencies. Its added normalized-induction Check has the right orientation: over 𝔽₃((t)), the upper-Borel covariance factor at diag(t,1) is 1/3 for I(ν¹ᐟ²,ν⁻¹ᐟ²), but 1 for the reversed induction. The constant subobject belongs to the latter. Neither the all-generic Kirillov gap nor a statement about the Bernstein centre is substituted for classification.

### Seeded source sample

Line numbers below refer to the numbered source extractions, not raw PDF search results. Dor23 is the published 2023 version; Dor21, GH11 and Dor20Z are the manifest's arXiv v1 texts. Their numbering was checked in the text.

| Target | Exact source text read | Result |
| --- | --- | --- |
| 0.3 Rigidified triality lift | Dor23 Proposition 2.12, pp. 12–14, line 546; proof line 629; partial Fourier formula line 729 | Unique scalar lift with the specified transpose operator; full characteristic-not-two field scope. The scalar extension is distinguished from a splitting of the double cover. |
| 1.3 Open spectral integral | Dor23 equation (2.2), p. 8, line 358; Remark 2.21, p. 17, line 854; generic irreducible scope line 333 | The inverse determinant in the argument and the irreducible coefficient contraction agree. R02 corrects the extra line anchor. |
| 2.3 Weak symmetric tensor data | Dor23 Definitions 3.7–3.8 and Remark 3.9, pp. 20–21, lines 1021, 1050, 1074 | Involutive symmetry and unit compatibility, with no associator; functor comparison direction is 1D→F(1C). The rescaling Check uses that direction. |
| 2.5 Whittaker trace and symmetry | Dor23 Remark 3.17, p. 23, line 1178; Claim 3.18 and orbit proof, p. 24, lines 1199–1254; Corollaries 3.20–3.21, p. 25, line 1258 | Transpose is +1 after both twisted quotients; the trace is IRL(M)⊗G N. No Hermitian dual or assumed associator is used. R02 corrects the anchor. |
| 5.4 Generic idempotent algebras | Dor23 Example 3.55, p. 35, line 1741; Remark 2.6, p. 10, line 474 | A chosen nonzero Whittaker quotient supplies the unit. The multiplication is invertible and scales inversely with that quotient; the multiplicity-line comparison is canonical. |
| 6.1 Adelic exotic tensor product | Dor23 §4.2, pp. 40–41, line 1991; Claim 4.3, line 2025; Corollary 4.4, line 2039 | The reference is 1M₂(Ov)·1Ov×. All three coherence comparisons preserve it almost everywhere. The roadmap corrects the source's noncompact unit-indicator misprint. R02 fixes its anchor. |
| 7.5 Automorphic ambient module | Dor23 Corollary 4.25, p. 47, line 2395; Corollary 4.26 and Remark 4.27, p. 48, lines 2400, 2402 | Theta multiplication restricts to I⊛S→S, and the trilinear form is balanced. Uniqueness follows from the epimorphic unit. The dual action uses the specified transpose dual. |
| 8.2 Fully faithful automorphic realization | Dor23 Claim 4.28, p. 48, line 2436; Proposition 4.32 and Remarks 4.33–4.34, p. 49, line 2451; Dor21 Theorem A.1.1 and Warning A.1.2, p. 5, line 157 | Full faithfulness, subquotients, smooth duals and all categorical limits/colimits are supported. Extension closure is expressly excluded. |
| 9.1 Unramified spin structure | Dor23 Definition A.1 and Remarks A.2–A.3, p. 50, lines 2507, 2512, 2528 | Actual L⊗L≅Ω and nonzero section; self-dual fractional lattice. The roadmap correctly specifies a decomposable fractional lattice. Arm67's existence proof remains uncertified. |
| 9.4 Spin convolution invariance | Dor23 Construction A.7 and Remark A.8, p. 51, lines 2550–2564 | Section independence and the factor |det g|⁻² are stated. The source omits the transport computations; the roadmap expressly owns them in §§9.2–9.4, rather than treating them as supplied proofs. |
| 10.2 Normalized induction and restriction | Dor21 Definition B.4.1 and Remarks B.4.2–B.4.3, p. 23, line 973 | î=i∘Hom(Lnorm,−); r̂=Lnorm⊗r is its left adjoint. The normalization is not δB¹ᐟ², and the comparison with ordinary induction requires a chosen trivialization. |
| 10.3 Rank-one induction multiplication | Dor21 Construction B.3.4, Claim B.3.5, p. 21, lines 858, 871; Proposition B.3.6, Corollary B.3.7 and proof, p. 22, lines 890–954; Claim B.4.4, p. 23, line 991 | Correct Uᵀ×U×Uᵀ quotient, two outer twists, diagonal identification of T actions and additive λ including zero. The natural multiplication retains Lnorm. |
| 11.1 Automorphic torus category | Dor21 Definition C.3.1 and Remark C.3.2, p. 44, line 2090 | Smooth quotient-torus representations and IT-modules agree; inflation is fully faithful. The unit is the quotient convolution module. |
| 11.4 Cuspidal and Eisenstein components | Dor21 Proposition C.4.1, pp. 47–48, line 2254; Remark C.4.5 and Proposition C.4.6, p. 49, lines 2297, 2328; Proposition C.4.8, pp. 50–51, line 2387 | Complementary ideals, norm-twist families and Eisenstein pullbacks agree. The roadmap distinguishes Hermitian projection from its bilinear trace and replaces the source's unjustified degree-one place with a degree-one idele. |
| 11.6 Irreducible automorphic equivalence | Dor21 Theorem C.5.1 and Lemma C.5.2, p. 53, lines 2486, 2501; continuation and Remark C.5.3, p. 54, lines 2528, 2538 | Both directions of irreducible comparison are present. The local W-module statement fixes its unit quotient and handles both Steinberg extensions; matching central characters alone is insufficient. |

Also reopened Dor23 lines 768–812 and 1425–1444 for the repaired mirabolic routes; GH11 line 481 and line 705 for the two defect-intertwining equations and pentagon cancellation; Dor20Z line 1060 for the noncanonical normalization generator. All five cited works have a single manifest key. No source passage was copied into a repository artifact.

### Computed adversarial table

All local representation rows use L, with complex coefficients and a nontrivial additive character; global rows use A. The finite Fourier and ordinary-module examples are explicitly comparison tests, not replacements for the smooth constructions. Zero representations are allowed; zero fields, q=1 local fields, y=0 in F× and zero rational spin sections are not. The ring-valued determinant statement separately admits characteristic two and nonreduced rings. No unrelated rank, fan or polynomial-degree parameter is silently added to these signatures.

| Statement | Instances tried | Computed values on both sides / competing model | Result | Change |
| --- | --- | --- | --- | --- |
| Local scope and denominators | q=2,3; y=0; c=2 | q⁻¹=1/2,1/3; 0∉F×; c·c⁻¹=2·1/2=1 | Dyadic characteristic-zero fields retained; no zero denominator | None |
| 0.1 polarization and perfectness | m=(1,2;3,4), n=(5,6;7,8); 𝔽₂; dual numbers | det(m+n)−det(m)−det(n)=−8+2+2=−4; tr(m)tr(n)−tr(mn)=65−69=−4. Gram determinant=1; B(εE₀₀,E₁₁)=ε; B(m,m)=0 in 𝔽₂ | No domain or division-by-two restriction | None |
| 0.3 lift and triality | Transpose and 3-cycle; finite 𝔽₃ partial-Fourier model on δE₀₁ | τ²δ=δ; σδ(0)=1/3 and σδ(E₀₀)=ζ/3; σ³δ(E₀₁)=1 and σ³δ=0 elsewhere; τστδ=σ²δ. These follow from Σζʲ=0 | Scalar and permutation normalization pass; a nontrivial sign twist fails prescribed transpose | None |
| 0.4 Fourier normalization | y=π, q=3; two four-dimensional transforms | Two prefactors give 3⁻⁴=1/81; scaled Fourier inversion gives 81, product 1. Omitting prefactors leaves 81 times reflection | w² acts by m↦−m | None |
| 0.5 repaired open carrier | Ψ=1M₂(O)·1O× over 𝔽₃((t)) | Values at (0,1),(I,1),(t⁻¹I,1),(0,t) are 1,1,0,0; every Y° extension has first value 0 | Nonzero ambient countermodel now exists | F04 repaired |
| 0.5/3.1/3.4 mirabolic input | Inflated ℂ, Φ⁺ℂ, zero; θ(u)=ζ₃ | (1−ζ)(1−ζ²)=3, so Φ⁻ℂtriv=0; Φ⁻Φ⁺ℂ=ℂ; Φ⁻0=0. Exact-sequence nonzero maps are idℂ and idΦ⁺ℂ in the two cases | Unnormalized adjunction and exactness match supplier | F02 repaired |
| 1.2 singular comparison | Zero, supercuspidal, determinant character | Zero gives 0=0; Jac(supercuspidal)=0. For determinant character VSL₂=ℂ, not 0. Residual SL₂ acts as id on Q and on functorial Tor; E²₀,₀=E²₁,₀=E²₀,₁=0 under hypotheses | Functional hypotheses exclude zero-stratum counterexample | None |
| 1.3 open integral | Ψ(g,z)=Φ(g)f(z det g), ∫βΦ=1 or 0; V⊕V | μΨ(y)=1·f(y) or 0·f(y); two copies give four coefficient channels versus one | Inverse determinant and irreducibility are necessary | R02 locator only |
| 1.3 countable Schur | ℂχ and ℂχ⊕ℂχ | End dimensions 1 and 4; the latter contains non-scalar diag(1,0) | Correct supplier's irreducibility hypothesis retained | F02 repaired |
| 1.4 classification and boundary | 𝔽₃((t)); ratios ν,ν⁻¹,1 | Ratios at t are 1/3,3,1; first two reducible, last irreducible. Covariance at diag(t,1) is 1/3 in descending order and 1 in ascending order. Jacquet boundary has 0,2,1 composition factors for supercuspidal, generic principal series, Steinberg | Equal-characteristic extension and segment orientation agree | F01 contracted |
| 1.5 local zeta | q=3, uniformizer and unit shells | 3⁻⁽ˢ⁻¹ᐟ²⁾·3⁻¹=3⁻⁽ˢ⁺¹ᐟ²⁾; unit weight 1; zero function gives 0=0 | Half shifts agree | None |
| 2.1 transpose convention | g=u(1), h=diag(2,1) | (gh)ᵀ=hᵀgᵀ=(2,0;1,1); gᵀhᵀ=(2,0;2,1). Diagonal π stays π, not π⁻¹ | Genuine nonabelian right-action test | None |
| 2.3 weak tensor data and functor | Vect, λ′=2λ; identity product comparison | Both unit-symmetry paths are 2xy. Unit comparison 2 gives 2xy=2xy; comparison 1 gives xy versus 2xy | Weak data do not fix scale or supply associativity | None |
| 2.4 Whittaker unit | θ(u)=ζ≠1; W(g)=1; zero input | W(ug)=ζ, not 1; quotient relation maps to ζ−ζ=0; Iunit⊛0=0 | Twisted quotient and unit scope agree | None |
| 2.5 trace and symmetry | M=Iunit, N=0; endomorphisms 2,3 | Trace is Φ⁻N on both sides; zero gives 0. Transpose scalar +1; scalar compositions 2·3=3·2=6; sign −1 fails unit compatibility | No associator or Hermitian conjugation inserted | R02 locator only |
| 3.1 degeneracy-free predicate | 0,1G,St,Eext with 0→1G→Eext→St→0 nonsplit | For 0 both orthogonality groups are 0; Φ⁻1G=0; dimΦ⁻St=1 but Ext¹(St,1G)≠0. Hom(Eext,1G)=0 since a retraction would split it | Genericity is not degeneracy-freeness | F03 reference repaired |
| 3.3 centre inverse | id,0 and two block projectors | λ(id⊛id)λ⁻¹=id; λ(0⊛id)λ⁻¹=0; e₁e₂=0 and eᵢ²=eᵢ. Infinite all-one family belongs to product, not sum | Both inverse directions and support distinction agree | None |
| 3.4 enhanced adjunction | 0,Z,e_cZ,⊕n Nn | Φ⁻enhF gives 0,Z,e_cZ,⊕n Nn; e_dF(e_cZ)=0 for c≠d. Each direct-sum vector has finite support | Correct unit and colimit carriers | F02 citation repaired |
| 3.5 essential image | 0,Z,Z⊕Z; St | F gives 0,Iunit,Iunit⊕Iunit; St fails orthogonality by nonzero Ext¹(St,1G) | Correct target supports §3.1's reference | F03 repaired |
| 4.3 spherical equivalence | Ramified χdet and local generator | SL₂(O)-fixed dimension 1; K-fixed dimension 0. Both counit composites have coefficient 1 on the generator | Ramified twists are included; ambient unit is not E | None |
| 4.4 joint generation | (Z,0),(0,Zsph), mixed tensor and ε | Images Iunit,E; mixed tensor maps to E. Hom from (0,Zsph) to (Z,0) is 0, but ε:E→Iunit is nonzero | Faithful does not mean full; mixed-map obligation retained | Classification citation repaired |
| 5.1 supporting coherence theorem | θ(x,y)=2xy; Cantor pairing; zero endomorphism | Triple products both 4xyz for the line. Cantor values at (0,0,1) are 2 and 5; intertwining values are 2 and 5. Scalar 0 satisfies 0²=0³ but is not invertible | Both intertwining and invertibility conditions matter | None |
| 5.2 exotic associator | Three E generators; mixed ε | Pentagon paths become a² and a³; cancellation gives a=id. Mixed counit paths both ε | Generator coherence is accompanied by mixed naturality | None |
| 5.3 Frobenius categorical trace | Ordinary Vect comparison; regular bimodule; zero | ℂ⊗ℂ=ℂ; each triangle sends 1↦1; pairing with zero returns 0 | Ordinary linear tensor distinguished from stable tensor | Conditional ordinary-tensor gap |
| 5.4 generic algebra | Unit u changed to 2u; St; determinant character | New multiplication m/2 gives (m/2)(2u,v)=v; old m gives 2v. Whittaker dimensions of St and character are 1 and 0 | Chosen quotient fixes scale; character excluded | None |
| 5.5 local convolution | Orthogonal blocks and infinite family | e₁e₂=0; finite block unit acts as 1; (1,1,…) has infinite support and is outside ⊕ℂ | Local units and enriched Hom do not imply a global identity | None |
| 6.1 adelic product | Two-place tensor plus unramified reference | [x₁⊗x₂]=[x₁⊗x₂⊗yv]; reference counit coefficient 1. 1K has compact support; 1G has nonzero value at diag(πⁿ,1) for every n | Almost-everywhere reference comparison, all exceptional places retained | R02 locator only |
| 6.3 theta and worked example | Rational pairs with values 2,3; genuine neighbourhood test | Literal two-point ambient support forces both values 0. Neighbourhood test has values 2,3 and sums 5=5 after transpose. Rational norm and rational additive phase are both 1 | Sum correct after carrier repair | R01 |
| 6.4 theta multiplication | Same two-pair rational intersection; zero | Swapping factors gives 2+3=3+2=5; zero input gives 0; rational translation reindexes the same two values | Target remains unrestricted S̃ at this stage | R01 example only |
| 6.5 global zeta | q=3 shell; two signed patches | Local powers give 3⁻⁽ˢ⁺¹ᐟ²⁾ on both sides; signed integral 1−1=0 while absolute mass 1+1=2 | Absolute convergence not inferred from cancellation | Conditional ordinary-integral gap |
| 7.3 Poincaré image and determinant kernel | Poincaré input and normalized positive quotient patch | Pushforward values 0 and 1; ∫A/F θ=0, while trivial character integral=1 | Nontrivial image/kernel distinction; positive compact patch is excluded | Conditional pushforward/generation gaps |
| 7.4 compact automorphic algebra | Unit image, triple product, zero | mI(u,x)=x=mI(x,u); both triple products precomposed with the epi unit equal mI; zero input gives 0 | Epi cancellation fixes action and multiplication | None |
| 7.5 ambient module | Unit, scalar i, two candidate actions | Unit action is idS; zero action on nonzero S is 0≠id. Difference of two actions vanishes after epi precomposition, hence is 0. B(if,g)=iB(f,g), not −iB(f,g) | Uniqueness and bilinear balance pass | None |
| 8.2 fully faithful realization | Identity, zero; smooth infinite product; ordinary quotient-algebra comparison | Identity has one lift; Hom(0,N)=0 on both sides. Tuple with no common open stabilizer is excluded. For ℂ[t]/(t), t acts as 0; on extension ℂ[t]/(t²), t·1=t≠0 | No unsupported extension-closure inference; comparison example is not an exotic proof | None |
| 8.3 matrix Schwartz module | Rational matrix orbit; diag(a,1) versus aI | det diag(a,1)=a, whereas det(aI)=a²; [γξ]=[ξ] in rational coinvariants; determinant phase at 0 is e(0)=1 | Correct subgroup and specified action retained | None |
| 9.1 spin lattice | ℙ¹, dt; local orders 0,2,1 | O(−1)²=O(−2), while O²=O. Annihilator exponent is −n−r; self-duality gives r=0,−1 for n=0,2; n=1 gives nonintegral −1/2. At infinity n=−2 gives r=1 | Spin and inverse exponent are necessary | None |
| 9.2 spin coalgebra | Conductor-zero place; finite versus infinite changes | Local distribution coefficient 1 and mass δ₁; both counit composites coefficient 1. One changed reference is allowed; an infinite mismatch has no finite exceptional set | Counit transports remain explicit targets | None |
| 9.4 spin transport | s↦as, ordv(a)=1; q=3; inverse transpose twice | ω-order changes by +2; lattice exponent by −1. At diag(π,1), inverse-transpose factors are 9 and 1/9, product 1. For rational a, global norm is 1 | Square passes; multiplicativity remains a separate specified calculation | None |
| 10.2 normalized adjunction | One-dimensional ordinary tensor–Hom comparison; normalization factor c=2 | Both Hom sides have dimension 1; adjoint evaluations send 1⊗1↦1. Rescaling a trivialization multiplies the comparison by 2 or its inverse according to direction; q=3 requires no √3 choice | Correct adjunction direction; comparison not canonical | None |
| 10.3 rank-one quotient | diag(0,λ), λ=0,1; rank two; torus (π,1),q=3 | Singular determinant=0 and U-phase=1; rank-two phase can be ζ≠1 and ordinary quotient is 0. Each identified twisted T action gives 1/3·f(λ,πy) | Correct surviving cell, additive zero and two twists | None |
| 10.4–10.5 lax induction and intertwiner | λ=0 boundary; η inverted; partial Fourier square | η-image at λ=0 is 0, while Lnorm permits value 1. Before localization M² is η⊗η(w), after inversion its normalized scalar is 1; Fourier square δ₁↦δ₋₁ | No unlocalized inverse or missing Lnorm factor | None |
| 11.1 torus automorphic category | Rational t; trivial and nontrivial character | Quotient identifies t with 1. Trivial character gives 1=1; value ζ≠1 gives (ζ−1)v≠0 and forbids descent | Both directions of descent tested | None |
| 11.2 automorphic adjunction | Cuspidal input; infinite local reference mismatch | Cuspidal restriction 0; infinitely many ηv mismatches yield no finite exceptional set and no global reference-preserving map | Local unit localization does not create a global η | None |
| 11.3 Weyl lifting | deg(u/v)=−5, deg z=10, threshold 3; q=3 | Required degrees 10,5,15>3. Both sides expand to D(uz,vz)+D(uz²,v)+D(v,uz²)+D(vz,uz). Negative half-power gives 1/√3 at both swapped inputs; opposite sign gives √3 and 1/(3√3). Stabilizer mass 4 becomes 1 after division by 4 | Negative degree, sign and periodization normalization pass | None |
| 11.4 cusp/Eisenstein split | Fixed-level Hermitian projection comparison; degree 2 and 3 places | Projection of (1,0) onto span(1,−1) is (1/2,−1/2), complement (1/2,1/2), sum (1,0). Degree difference 3−2=1 without a degree-one place; anomalous Eisenstein example has restriction 0 and cusp projector 0 | Projection and degree choices do not narrow scope | None |
| 11.5 component decomposition | Two complementary projectors | e²=e; e(1−e)=0; reconstruction gives eV⊕(1−e)V=V. Arbitrary nonsmooth tuples are excluded | Locally unital/smooth reconstruction retained | R03 wording only |
| 11.6 local and global irreducibles | St, determinant character; two nonsplit extensions | Φ⁻ dimensions 1 and 0; St⊛St=St; the two extensions give St⊛E=0 and St respectively. Determinant character in the same block is not a unital St-module | Unit quotient adds information beyond the centre; both global directions have owners | None |
| 11.7 finite-length restriction | Length n=0,1,2; repeated torus character | Bounds 2n=0,2,4; cusp restriction 0; extension of χ by itself has dimension ≤1+1=2 | No distinct-character hypothesis | None |

The finite 𝔽₃ partial-Fourier calculation was also enumerated independently: its numerical errors from the exact root-of-unity identities were below 5×10⁻¹⁶. This is a check of the signs and normalization, not a substitution of a finite group for the local field. The unchanged checks on firm enrichment, conductor lattices, compact/unrestricted duals and positive versus signed integrals were compared with the earlier computed rows. No contrary value was found beyond R01.

### Supplier resolution and direction

Used `roadmaps list`, `roadmaps grep` and `roadmaps show`, together with the board package index and readable local package files. The service resolved against main 794d0fc and its 363 open-head index dated 2026-10-25T14:39:16Z. The local content checkout used for pins, main examples and elaboration was 16fe7a8d63b08f8e6ee6673392d7cf87def367b9. The six open suppliers below are all marked new roadmaps by the index; revised-existing-roadmap pull requests were not substituted for main.

The table paths are repository-relative. For named roadmaps, the file is `TauCetiRoadmap/<name>/README.md`; line numbers exclude the service's header.

| Supplier | Sections and declarations resolved at the supplied version | Scope check |
| --- | --- | --- |
| SmoothRepresentationsOfLocalGroups, head 1383569 | SR.0.1–SR.0.4 at :558,:617,:696,:800; SR.1.1–SR.1.3 at :981,:1151,:1230; SR.0d.1–SR.0d.2 at :1593,:1655; SR.2.1–SR.2.3 at :1833,:1962,:2122; SR.3.2 at :2603; SR.4.1 at :3083 | Smoothness and compact support are actual conditions; nondegenerate Hecke modules and projective generators are present. The normalizing factors and unnormalized first adjointness (:2063) agree. Extra balanced, derived and enriched interfaces are declared gaps. |
| Same supplier, repaired specific inputs | jacquet-subrepresentation :2326; admissibility-of-irreducibles :2335; mirabolic-derivatives :3647 and generic-character extension :3685; derivative-exactness :3696; segment-representations :4324 | Countable Schur applies without extra admissibility. Complex coefficients satisfy invertible-character-difference hypotheses. Segment Checks at :4346–4351 give precisely the two orientations used here. |
| GL2AutomorphicRepresentationsAndTransfer, head 69bcab7 | R16.2.1 :617, characteristic-zero scope :619; R16.2.8 :712, scope :716 | The classification and supercuspidal Kirillov restrictions remain explicit. The two separate extension contracts cover the missing generality. |
| AutomorphicLFunctionsAndLocalFactors, head 5d22a23 | Representation prerequisites, Restricted tensor realizations :261; AL.0 Local Schwartz–Bruhat spaces and finite Fourier levels :642; AL.1 Local eigendistributions and Hecke L-functions :915; AL.2 Godement–Jacquet standard functions :1581; AL.3 Curve additive analysis :2414 and Function-field local factors, multiplicity one and converse theorem :2426 | Number-field AL.0 is not applied to equal characteristic without its extension. The function-field tensor/central-character paragraph is explicit. Strong multiplicity one is not mistaken for multiplicity one in the cusp space. Matrix zeta exponent at :1599 is s+(n−1)/2. |
| MetaplecticAutomorphicForms, head 22bee85 | §§0.15–0.18 :267–328; §§1.1–1.4 :346–384; §§2.4b–2.7 :476–550; §§4.1,4.1a,4.2–4.4 :1150,:1162,:1174,:1192,:1200 | Local char F≠2 includes dyadic fields; only good compact splittings require odd residue characteristic. The function-field adapter explicitly has finite-dimensional and partial Fourier comparisons; rational splitting preserves theta. |
| FunctionFieldArithmetic, head f7a17ee | §§0.1–0.3 :440,:478,:509; §§2.1–2.3 :676,:713,:749; §§4.8–4.10 :1500,:1536,:1575; §5.8 :1995; §§6.1–6.4 :2082,:2133,:2178,:2226 | Degree-one divisors need not be points. Self-dual local volume is qv⁻ⁿᵛᐟ². Chebotarev retains constant-field congruences. Central-lattice automorphic functions are not substituted for S(Γ\G). Uniform fixed-level cusp support supplies the finite-degree projection argument. |
| ArithmeticGaloisDuality, head 09ad340 | R02.3.2 :1989, especially :1995–2008 | Canonical idele degrees, rational product formula, degree surjectivity and compact degree-zero quotient, consumed through the arithmetic suppliers. |
| AlgebraicVectorBundles, main | L0B :228 and L0C :254 | Rank-one sheaves, tensor, dual and polynomial operations; not a proof of rational theta-characteristic existence. |
| EnhancedDerivedSheaves, main | E5:presentability.2 :1624; Tensor products of presentable categories and module base change :1674 | Native target is presentable ∞-categorical tensor. The ordinary complex-linear tensor needed here is explicitly an extension. |
| Completed/RestrictedProducts, local main | `Completed/RestrictedProducts/README.md:19` Scope and ownership; :268 Layer 1; :411 Change of family and double cosets | Eventual reference preservation, coordinate continuity and transported subgroups are kept. These ambient topological maps do not identify distinct integral subgroups or construct the exotic representation kernel. |

Read every package Needs line and supplier citation against these statements and the declared contracts. No upward citation, cycle, nonexistent supplier section, or new unowned prerequisite was found. No object ownership was moved in this review.

The prescribed dependency command with this README, package name, merge order and `--movable` exited 0 with complete output:

```text
depcheck: 52 roadmaps, 589 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. `roadmaps resolve` also exited 0 with no missing cross-roadmap or Lean-name leads. Its host does not inspect pinned Lake packages; the pinned declarations were read separately below.

### Declared gaps

Parsed `packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/design/plan.json` and compared every gap with Exact supplier contracts: 16 slugs, 16 named suppliers, and all sixteen needs sentences match exactly. Each request concerns one missing construction with its necessary API. None asks this package to outsource its own coevaluation or spin transport targets. The tests below distinguish the additional contract from the existing inputs.

| Slug | Owner and section | Minimality and test |
| --- | --- | --- |
| smooth-balanced-tensor | SmoothRepresentationsOfLocalGroups SR.2.1–SR.2.3 | Algebraic coinvariants alone have no residual smooth action; desired regular⊗M=M and 0⊗M=0 include the specified actions. |
| smooth-tor-residual-action | Same, SR.0d.1 | Derived-category existence does not give the two-group spectral sequence with residual actions; idQ must induce idTor. |
| firm-centre-enrichment | Same, SR.1.3 and SR.3.2 | Locally unital modules exist; the closed/enriched comparison is extra. Infinite (1,1,…) lies in full Hom, not its direct-sum enrichment. |
| transpose-central-distributions | Same, SR.3.2 | Categorical centres do not by themselves provide the transpose-invariant distribution realization; E₀₁ and E₁₀ are exchanged. |
| twisted-spherical-centre | Same, SR.2.1, SR.3.2, SR.4.1 | K-Satake does not give the SL₂(O) generator: ramified χdet has invariant dimensions 0 and 1 respectively. |
| equal-characteristic-fourier | AutomorphicLFunctionsAndLocalFactors AL.0 and AL.3 Curve additive analysis | Extends scalar residue-character Fourier to arbitrary-character perfect pairings and partial transforms; C₃ negative Fourier squared sends δ₁ to δ₂. |
| normalization-module-freeness | Same, AL.1 | Freeness with a generator taking 1O× to 1O is not ordinary Fourier inversion; its value at additive zero is 1. Dor20Z line 1060 gives the precise local statement. |
| compact-data-global-zeta | Same, AL.3 | Ordinary double-integral convergence for compact data is separate from the package's theta unfolding; signed 0 versus absolute mass 2 distinguishes the input. |
| odd-equal-characteristic-gl2-classification | GL2AutomorphicRepresentationsAndTransfer R16.2.1 | Actual supplier has characteristic zero; 3·1=0 in 𝔽₃((t)) and ≠0 in ℚ₃. Existing SR subrepresentation/segment pieces are cited, not requested again. |
| all-generic-kirillov | Same, R16.2.1 and R16.2.8 | Existing comparison is characteristic-zero supercuspidal; boundary length 0 versus 2 or 1 distinguishes the full generic extension. |
| rational-theta-characteristic | FunctionFieldArithmetic 0.3 | Picard points and tensor carriers do not supply L²≅Ω existence; O(−1) works on ℙ¹ and O fails. |
| ordinary-presentable-linear-tensor | EnhancedDerivedSheaves E5:presentability.2 | Ordinary linear categories are not the supplier's stable ∞-categories; regular Vect triangle has value 1 on 1. |
| determinant-pushforward | FunctionFieldArithmetic 6.2 | Requires compact Γ\G fibre integration and disintegration beyond the central-lattice carrier; positive patch maps to 1, Poincaré image to 0. |
| sl2-rational-unipotent-generation | Same, 6.1 | Adelic point construction is not the generated-subgroup assertion; rational Weyl conjugation sends upper u(b) to lower l(−b), both determinant 1. |
| eisenstein-constituent-automorphicity | Same, 6.3 | Constant terms alone do not give automorphicity of every induced constituent; determinant constituent remains required despite Whittaker dimension 0. |
| function-field-cuspidal-multiplicity-one | AutomorphicLFunctionsAndLocalFactors AL.3 | Strong multiplicity one compares classes; this asks multiplicity 1 rather than 2 for a fixed-central-character cusp occurrence. Existing restricted factorization is retained. |

### Ownership and pinned library audit

The object search covered exotic products, degeneracy-free categories, smooth balanced tensor, Eilenberg–Watts, generic Whittaker projectives, Kirillov realizations, normalization modules and theta characteristics. The service search returned 171 matching lines across main and the indexed open heads. Read relevant supplier matches and searched readable board package READMEs and Lean files. The unary theta characteristic in QSeriesPartitionsAndMockModularForms is a different analytic object. Integral Whittaker projectives remain owned by SmoothRepresentationsOfLocalGroups SR.5.2 (:4198–4228), whose stated field scope is characteristic zero; §3.3 here identifies the *exotic unit* and its compatible centre action over the larger scope. No duplicate ownership of Dor's exotic product, theta automorphic algebra or component theorem was found in the checked material. This is a new construction direction, not a replacement plan for an existing roadmap.

The board's package index was read before reaching that conclusion. The search of the open content-roadmap heads was available, including the named sibling roadmaps. Other board branches whose files were not available locally were not treated as absent; that limitation is recorded below. There are no fully qualified package declarations capable of colliding with another Suggested.lean.

The manifest and actual checkouts agree on Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. These declarations were opened at those pins:

| Native declaration | File and line | Relevant meaning and boundary |
| --- | --- | --- |
| Matrix.det_fin_two | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:809` | Native 2×2 determinant formula over the section's commutative ring. Particular polarization remains package-specific. |
| Matrix.trace; Matrix.trace_transpose; Matrix.trace_mul_comm | `Mathlib/LinearAlgebra/Matrix/Trace.lean:43`, :71, :156 | Definition is the finite sum of diagonal entries; transpose and cyclic trace identities exist. No new general trace API is planned. |
| Rep.coinvariantsTensor | `Mathlib/RepresentationTheory/Coinvariants.lean:410` | Type is Rep k G ⥤ Rep k G ⥤ ModuleCat k; body applies coinvariants to the ordinary tensor. It has no topology or residual smooth multi-action field. |
| CategoryTheory.SymmetricCategory | `Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean:366` | Its parameters include MonoidalCategory; it extends BraidedCategory. It assumes the associator that this roadmap must construct. |
| CategoryTheory.CommMon | `Mathlib/CategoryTheory/Monoidal/CommMon_.lean:26` | Fields include X, MonObj X and IsCommMonObj X; genuine algebra carrier once the ambient structure exists. |
| CategoryTheory.Mod | `Mathlib/CategoryTheory/Monoidal/Mod.lean:227` | A monoid object A and genuine ModObj A X, not an arbitrary predicate called an action. |
| CategoryTheory.Functor; CategoryTheory.Iso | `Mathlib/CategoryTheory/Functor/Basic.lean:40`; `Mathlib/CategoryTheory/Iso.lean:54` | Actual map-id/map-comp and two inverse laws. These make abstract coherence statable, but do not supply the exotic bifunctor. |
| TauCeti.IsSmoothDiscrete | `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:272` | The fields are discreteTopology and stabilizer_isOpen on a TopRep. Smooth representations are not universally absent at the pins. |
| TauCeti.SmoothDiscreteTopRep; TauCeti.DiscreteRep | Same file, :618 and :631 | Native smooth discrete carriers and their coefficient/action requirements exist; they do not supply Y, Kirillov boundary, Whittaker enrichment or I. |
| TauCeti.discreteRepEquivSmoothTopRep | Same file, :833 | Dictionary is identity on underlying modules; no exotic monoidal or automorphic comparison is included. |
| TauCeti.D4Tripled.trialityAutomorphism | `TauCeti/Algebra/Lie/D4/Tripled/Triality.lean:142` | An Aut groupScheme for the D₄ carrier, not the smooth triple-GL₂ oscillator kernel. |

The pin search for exotic/Whittaker/Kirillov/metaplectic/Eilenberg–Watts objects produced no competing construction; occurrences of Kirillov as a Lie-theory bibliographic author do not supply a Kirillov representation model. The positive native objects above, rather than a blanket absence claim about smooth representations, are the basis for the acceptance-file decision.

### Headline coverage, elaboration and form

The README's headline groups and their status in `packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/Suggested.lean` are:

| Headline targets | What the module docstring says is missing |
| --- | --- |
| 0.3 rigidified lift | Smooth scalar metaplectic extension |
| 1.2–1.4 singular/open/Kirillov spectral comparisons | Smooth balanced tensor, smooth Tor, triality and Kirillov carriers |
| 1.5 local zeta comparison | The same constructed spectral objects and their integral comparison |
| 2.4–2.5 Whittaker unit and trace | Exotic product and actual Whittaker unit |
| 3.3–3.5 unit centre and degeneracy-free equivalence | Firm Bernstein enrichment and the constructed functors |
| 4.3–4.4 spherical equivalence and joint generation | Exotic category and spherical coalgebra |
| 5.2 unique associator | The constructed exotic bifunctor and its comparisons |
| 5.3 categorical Frobenius self-duality | Ordinary presentable complex-linear tensor and smooth Eilenberg–Watts |
| 5.4–5.5 generic idempotent algebras and local convolution | Exotic category and coalgebra |
| 6.1–6.5 adelic structure, theta invariance/multiplication and global zeta | Restricted tensor kernels and smooth automorphic function carriers |
| 7.3–7.5 Poincaré image, compact algebra and ambient actions | Actual exotic automorphic algebra and its construction |
| 8.2–8.3 fully faithful realization and matrix Schwartz automorphicity | Actual I and module objects over it |
| 9.2–9.4 spin coalgebra, convolution and transports | Theta characteristic, adelic coalgebra and constructed multiplication |
| 10.3–10.5 universal induction quotient, lax induction/localized unit and intertwiner | Normalization module, internal Hom and compatible localization |
| 11.2–11.7 automorphic adjunction, Weyl lifting, components, irreducibles and finite-length restriction | Actual automorphic categories, adelic torus functions and normalized functors |

All fifteen groups are named in the module docstring. The missing constructions cannot be replaced by a few simple definitions on the existing carriers. In particular, native algebra/module objects do not make the *actual* exotic algebra I available. The abstract supporting coherence statement §5.1 is statable in category theory, but is not a substitute acceptance headline; its removal in the earlier repair remains appropriate. No statable headline omission or stand-in was found.

Ran the required `lake env lean` with the absolute package file argument from the pinned content checkout. Exit 0; stdout and stderr empty, so there were no warnings, including no sorry warnings. The single import is Mathlib; no TauCeti object build was needed.

Mechanically stripped comments and enumerated every declaration: zero definitions, instances, structures, theorems or examples. Generated the resulting empty #check list in one scratch Lean file and elaborated it once, also exit 0 with empty output. Thus there are no binders to lose and no sorried theorems for a one-tactic padding probe; no signature changed. No Lean process was left running.

For shape, read `TauCetiRoadmap/ComplexTori/README.md`, `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md` and `Completed/RestrictedProducts/README.md` on local main. The reviewed package has all required top-level sections, twelve ordered layers, each layer's Examples and Dependencies, and all 58 targets have locators, Needs and at least three Check bullets. The definition interfaces are retained; R01 separates actual discriminating instances from bullet counts. No sorry'd data, set_option, admitted example, computational algorithm, route-specific good-place restriction, copied source passage, new generic replacement theory, or upward supply was found. R03 is the sole process-wording finding. Source gaps in Appendix A are explicit construction obligations here, not assumed premises containing the desired conclusion.

## Not verifiable

- **Arm67, pp. 238–246:** the manifest settles it as uncertified/paywalled. Dor23 line 2512 verifies its attribution; the original existence proof was not opened. It was not requested again and no missing-reference entry was added.
- **Other board branches:** the supplied board index lists nineteen packages whose exact-head files are not in this checkout. Ownership against those remote board-package files was not checked. Readable local packages, content main and the indexed open content-roadmap heads were searched; no claim of absence is made about unread board branches. The board index's instruction-like “Read one with:” remote-command suggestion was treated as untrusted data and not executed.
- **Source-omitted calculations:** Dor23 line 2544 and lines 2555–2564 state the spin counit/transport claims without the full computations. Their assertions and scope were readable, but a detailed source proof of those omitted steps cannot be certified. The roadmap owns those precise calculations in §§9.2–9.4, so this is not an unowned prerequisite.

## Source issues

- **Misprint** in Dor23 at Construction 2.7, p. 11, Dor23 line 503: the source says the triple action is an embedding; it should be a homomorphism, since (2I,(1/2)I,I) acts trivially; affects nothing.
- **Misprint** in Dor23 at the proof of Proposition 2.12, p. 14, Dor23 line 678: the source says a torus triple belongs to F×; it should belong to (F×)³; affects nothing.
- **Misprint** in Dor23 at Warning 3.25, p. 25, Dor23 line 1292: the source says St is the trivial representation in the extension description; it should identify St as Steinberg and 1G as the trivial subobject; affects nothing.
- **Misprint** in Dor23 at the proof of Claim 4.3, p. 41, Dor23 line 2035: the source says the unit reference is the indicator of GL₂(Fv); it should be the indicator of GL₂(Ov); affects nothing.
- **Gap** in Dor23 at Claim A.6, p. 51, Dor23 line 2544: the source says local adjustments give the adelic counit immediately; it should construct lattice-adapted counit transports, reference compatibility and both unit equations; affects the proof.
- **Gap** in Dor23 at Construction A.7 and Remark A.8, p. 51, Dor23 line 2555: the source says section independence and weighted inverse-transpose multiplicativity hold without displaying their calculation; it should establish the character-change, coalgebra and multiplication transport identities; affects the proof.
- **Gap** in Dor21 at Remark C.4.5, p. 49, Dor21 line 2297: the source says to choose a degree-one place; it should choose a degree-one idele, since a curve may lack rational points; affects the proof.
- **Misprint** in Dor21 at the proof of Lemma C.5.2, p. 53, Dor21 line 2513: the source says its condition characterizes an M-module; it should say an St-module with the specified unit-induced comparison; affects nothing.
- **Misprint** in Dor20Z at the proof of Claim A.4, p. 27, Dor20Z line 1104: the source says the constructed function is entire while assigning it simple poles; it should say meromorphic; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "3a403adbdd04d37d3f84a53bc3e7b296d461b00d", "job": "REV-PKG-ExoticMonoidalStructuresAndAbstractAutomorphicity~3", "model": "gpt-6-astra", "worker": "chris-7"} -->
