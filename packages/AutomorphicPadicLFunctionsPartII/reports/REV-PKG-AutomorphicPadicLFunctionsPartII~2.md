<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1015#issuecomment-6393373086 -->
Review (codex) of b56965a

Verdict: needs_changes

1. **F01** (P1) The unsigned interpolation contradicts the specified moment maps

   **Location.** `packages/AutomorphicPadicLFunctionsPartII/README.md:1145`, “its moments are δ_c(χ) times the right side of the final interpolation formula”; also lines 661, 992 and 1191.

   **Claim.** The measure obtained by the specified weighting, inversion and pushforward has the unsigned interpolation formula, although the same EK coordinates have the sign ε(d,β).

   **Witness.** At L=ℚ(i), p=5, f=(3), χ((λ))=λ⁻⁴ and c=(7), ε(1,0)=−1 and δ_c(χ)=−2352. The construction gives +2352U; the claim gives −2352U, with U≠0.

   Here U denotes the unsigned right side of §8.5 for this character. This is a valid conductor-one character evaluated at tame modulus (3), which §8.5 permits. It is well-defined because i⁻⁴=1. Its L-series at zero converges absolutely: |χ(a)|=Na⁻², and its Euler product is nonzero. The omitted factor at (3) is 80/81. At the selected prime (2+i), the first p-factor is (12−24i)/5; at its complement the second is (632−24i)/625. Thus U is nonzero. Also O_(3)×=1, so no torsion-normalization issue enters this witness.

   The discrepancy is internal. Section 4.3 multiplies every relevant EK coordinate by ε; §7.1 identifies moments with those coordinates; §7.4 forms linear combinations of them. Unit restriction, the weight t⁻¹, the map (t,s)↦(t⁻¹,s) and ray-coset summation in §8.3 introduce no additional constant −1. All the Fourier, Euler and auxiliary factors are already included in U. Naming a further sign-comparison theorem cannot make these fixed maps have opposite values. KS-v4 line 3507 displays the linear combination; the passage at KS-v4 line 3514 is precisely where the class-to-value sign must be retained.

   **Exact repair.** With the maps and corrected current convention retained, multiply the right side of the smoothed formula in §8.3 and the final formula in §8.5 by ε(d,β)=(-1)^(d(d−1)/2+|β|+1). Define M in §8.4 using that same signed expression. Remove the assertions that the specified maps reconcile it with an unsigned coefficient. If an unsigned normalization is additionally wanted, it needs an explicitly constructed change of the measure/local-factor convention, with its effect on finite twists stated; it cannot be asserted for the present pushforward. Add this character as a nonzero Check. The repaired smoothed identity gives ε·δ_c·U=+2352U on both sides, without changing any allowed field, prime or critical index.

2. **F02** (P1) The conductor-one construction omits an auxiliary Artin translation

   **Location.** `packages/AutomorphicPadicLFunctionsPartII/README.md:1145`, “yielding μ_(O_L,c,c′) with the extra factor δ′_(c′)(χ)”; the atom at line 1117 is δ_1−δ_(Art(c′)).

   **Claim.** The unchanged two-auxiliary residue function produces the extra multiplier 1−χ(c′).

   **Witness.** For χ((λ))=λ⁻⁴ on ℚ(i) and c′=(3), the residue distribution gives χ(c′)⁻¹−1=80. The stated atom gives 1−χ(c′)=80/81. KS-v4 lines 2491–2498 supply the four-term distribution.

   Indeed, put E=E^(0,4)(0,0;O_L,O_L×). Section 4.1's homothety gives E(0;c′⁻¹)=χ(c′)⁻¹E. The residue of §1.1 therefore gives

       Nc E(c′⁻¹) − Nc E(O_L) + E(c⁻¹) − E((cc′)⁻¹)
         = (χ(c′)⁻¹−1)(Nc−χ(c)⁻¹) E.

   The inverse factor persists through the prime-to-p isogeny transport and unit restriction. This is separate from R01: cancelling the common nonzero signed interpolation value still leaves 80 versus 80/81.

   **Exact repair.** In the conductor-one clause of §8.3, first construct the raw family from the stated residue function, then define μ_(O_L,c,c′) to be its convolution with δ_(Art(c′)). Keep δ′_(c′)=δ_1−δ_(Art(c′)) in §8.2. State this translation and its compatibility with the family relations and boundedness in the API and Needs. Its moment multiplies the raw value by χ(c′), and χ(c′)(χ(c′)⁻¹−1)=1−χ(c′). For c=(7), c′=(3), and the signed convention of R01, the raw multiplier is 188160; translation changes it to 62720/27, exactly 2352·80/81. No inversion of a vanishing smoothing factor is involved.

3. **F03** (P1) Divisibility of the entire theta function fails at an allowed ordinary dyadic prime

   **Location.** `packages/AutomorphicPadicLFunctionsPartII/README.md:760`, “for theta and measure coefficients the divisibility holds in their entire integral coefficient modules”; its use at lines 929 and 1147.

   **Claim.** For torsion-free Γ₀ of index m in the full unit group, the entire integral theta function and Eisenstein measure are divisible by m before restriction and descent.

   **Witness.** Take L=ℚ(√−7), p=2, Γ={±1}, Γ₀=1 and the two auxiliaries (3),(5). The residue values are 8 at 24 points and −1 at 192 points: trace 0, but a residue modulo 2 is 1.

   This is an allowed ordinary example: X²−X+2 reduces to X(X−1) modulo 2, so 2 splits and does not divide d_L. One can use the CM elliptic curve y²+xy=x³−x²−2x−1: Δ=−343, j=−3375, and #E(𝔽₂)=2, giving a₂=1. Pass to a finite arithmetic extension splitting its prime-to-2 torsion and choosing the permitted bases, without inverting 2.

   Use D=E[15] minus e, x=e, and extend h_(3) from (E[5] minus e)×E[3] by zero, exactly as in §1.1. Its trace is 24·8−192=0. It is invariant under ±1. Critical indices α=2, β=0 are compatible with Γ. The full unit index is 2.

   Augment the coherent EK section to P^(0)=O_E. In dimension one this is a meromorphic differential η on E, regular at e, with residue h at D, by §§1.2–1.3. The restriction θ(h,e)(T,0), multiplied by the canonical invariant differential, is its formal expansion at e (§6.3 and the rigidified augmentation). If θ belonged to 2O_(ℂ₂)[[T,S]], that expansion would vanish on the special fibre. On the smooth integral elliptic special fibre, the map from the local ring at e to its completion is injective; hence the reduced rational differential would vanish identically. Its residue at a point with h=−1 is instead 1. This contradicts divisibility. Finite étale residues commute with this reduction; no inverse-limit base-change assertion is needed.

   The distinction from selected moments is essential. Already the integral measure δ_1−δ_(−1) has Amice transform 2T−T²+T³−⋯. Half of it has integral power moments 0,1,0,1,…, but evaluates the indicator of 1+4ℤ₂ to 1/2. Thus integrality of critical moments cannot establish divisibility in the full measure module.

   **Exact repair.** Delete the whole-theta/whole-measure divisibility clause from §5.4 and the resulting torsion-normalized integral-theta alternative in §6.3. Keep §5.4's specific critical-coordinate statement and carry torsion-free theta/Eisenstein measures through §7. In §8.3 state the needed arithmetic theorem on the actual weighted, unit-restricted pushforward: for each chosen Γ₀, its pushforward to the ray quotient belongs to [O_f×:Γ₀] times the integral measure module there, compatibly with subgroup change. Define the normalized ray measure only after this theorem. This preserves p=2 and p=3 and asks for divisibility at the correct target, not on the formal neighbourhood before quotienting. Add the example above as a negative-control Check. On the model measure, weighting by t⁻¹ changes δ_1−δ_(−1) to δ_1+δ_(−1); pushforward to the ±1 quotient is 2δ_[1], and division gives the integral δ_[1]. The proposed correction passes exactly the obstruction that refutes the original clause.

4. **F04** (P3) Two source line pointers address different results

   **Location.** `packages/AutomorphicPadicLFunctionsPartII/README.md:132`, “Theorem 1.1, p.7, KS-v4 line 324”; line 1223, “Theorem 5.22 … KS-v4 lines 2625, 3089”.

   **Claim.** Those line locators identify the named results.

   **Witness.** KS-v4 line 324 starts Definition 1.2; Theorem 1.1 starts at line 289. KS-v4 line 3089 is in the proof of Theorem 5.23; Theorem 5.22 starts at line 3009.

   **Exact repair.** At §0.1 distinguish Theorem 1.1, p.7, line 289 (weight decomposition), the classification discussion, p.7, lines 296–322, and Definition 1.2, pp.7–8, line 324. In the first worked example replace the Theorem 5.22 pointer 3089 by 3009. These replacements were checked against the named theorem headings and page markers.

Four findings: three P1 and one P3. The two analytic acceptance theorems elaborate and survive the mathematical and padding probes. The blocking findings concern the arithmetic construction: its sign, its second auxiliary factor, and an overstrong assertion of divisibility before descent. None requires dropping small primes or restricting the critical types.

## Verified sound

The four authored package files were read without modification; the top-level gap list of `design/plan.json` was inspected read-only. All 44 numbered targets, their API bullets and Checks, all nine layer dependency lists, the worked examples, and every exact supplier contract were read. There are 24 definition/construction blocks with API lists and at least three listed Checks; concrete calculations and negative controls are recorded below rather than treating repeated prose Checks as evidence. The report distinguishes checked local identities from the three false global assertions above.

### Previous findings, checked first

| Earlier finding | Status | Repaired passage and independent check |
| --- | --- | --- |
| F01: unavailable parent/Katz comparison | Repaired | README:3 now says “combines the Hecke and ray-class theory of GlobalNumberFields … the CM geometry … and the measure theory”. README:1205 keeps all admissible critical types. No unowned Katz-comparison theorem remains. For k=2,d(σ)=1, (α,β)=(3,1), and i⁻³(−i)=1. |
| F02: three ownerless records and conditional descent | Partly repaired | README:760 now says “for every finite-index torsion-free Γ₀ … lies in [O_f×:Γ₀] times the integral critical tensor line”. The three internal records are gone; §§5.4,8.3,8.4 own the obligations. The newly explicit entire-theta/measure version is false: R03. Calling the other two obligations targets also does not resolve R01–R02. |
| F03: lattice Poisson re-planning | Repaired | README:547 now says “applies ThetaSeries Layer 1, items 1A, 1E and 1F”. Its real-to-alternating dual conversion is correct: for 2ℤ+iℤ, Λ∨=½ℤ+iℤ and iΛ∨=ℤ+(i/2)ℤ. |
| F04: missing functional equation/residue headline | Repaired | README:512 defines “vol_HΛ=(∏h_i)·covol_Leb(Λ)”; Suggested.lean:85 states `kronecker_functional_equation`. At h=2, Λ=ℤ[i], metric volumes are 2 and 1/2 and Res₁K=π/2. The new theorem elaborates with every binder retained. |
| F05: two redundant supplier gaps | Repaired | README:327 uses “the equivariant spectral sequence … with affine quasi-coherent acyclicity”. README:354 uses AlgebraicTopology Stage 8's classifying comparison. The reduced gap text agrees in README and plan. On the sign circle, the differential is −2, H⁰=0 and H¹=ℤ/2 on both models. |
| F06: total-sum wrapper padding | Repaired | `kroneckerSeries` and its redundant equality conjunct are absent. Suggested.lean:70 uses `HasSum` directly. Divergent total sum 0 at s=0 is not equated with continued square-lattice value −1. |
| F07: four citation slips | Repaired | README:150 cites “ComplexMultiplicationAndExplicitReciprocity §1.3”; README:78 cites “DifferentialGeometry Layers 0–1 and 5”; README:213 cites “proof of Theorem 4.10, p.53, KS-v4 line 2490”; README:18 uses “NonordinaryCMSpecialValues”. Each replacement resolves. R04 concerns two other remaining pointers. |

No previous finding was marked not actionable in the supplied repair report. These are not re-raisals of a settled rejection of package responsibility.

### Seeded source verification

Both manifest texts are readable legal cached copies; their keys and entries were left intact. All locators use the 85-page KS-v4, not journal pagination. All 15 seeded targets were checked for the numbered result, printed page, hypotheses and support. No author-flagged unverified locator was found. The following qualifications are part of the verification, not endorsements of an erroneous source statement.

| Target | Source evidence opened | Result |
| --- | --- | --- |
| 0.3 | Proposition 1.5, p.8, KS-v4 lines 357–364; Corollary 1.14, p.11 | The weight calculation is valid with the added module torsion-freeness. The source's unrestricted-module assertion is false; μ₆ acting on R/(2) supplies the stated counterexample. |
| 1.4 | Definition 2.23, p.21, KS-v4 lines 901–903; preceding connection construction | Correct target TSym^aΩ¹⊗P♮⊗Ω^d and ordinary/divided factorial distinction. |
| 2.1 | Definition 2.24 and (2.3.3)–(2.3.4), p.21, KS-v4 lines 907–922 | Affineness, fixed torsion section and étale killing dual are retained; augmentation is the rigidified one. |
| 2.2 | Proposition 2.27 and Definition 2.28, pp.22–23, KS-v4 lines 961–1014 | Free cap and localized torsion cap are valid repairs to the source's integral-transfer error. This does not imply R03's full-module divisibility. |
| 3.2 | Definition 3.9/Corollary 3.10, p.34, KS-v4 lines 1486–1502; Corollary 3.22, p.41 | Complementary bidegrees and finite-level comparison match. Continuous tests and residue-trace identification are explicitly supplied contracts. The test-first Stokes sign recomputes to −1 in real dimension two and degree one. |
| 3.3 | Definition 3.11/Remark 3.12, p.35, KS-v4 lines 1506–1520 | Antiholomorphic summand, zero-vector omission and bound Re(s)>d+|ν|/2 match. The README correctly adds separation from singularities to the source's uniformity statement. |
| 4.3 | Theorem 3.27/Corollary 3.28, pp.44–45, KS-v4 lines 2094–2157; contraction at lines 1598–1655 | The roadmap deliberately changes the source's sign; computed contraction and inverse-power coefficients support retaining that change consistently. R01 detects its loss downstream. |
| 5.3 | Lemma 4.2, (4.1.2)–(4.1.3), p.47, KS-v4 lines 2206–2225 | χ(b)Nb⁻ˢ, the unit quotient and zero omission match. The unitary shift follows directly from the ideal convention. |
| 5.4 | Theorem 4.9/(4.3.1), pp.50–51, KS-v4 lines 2353–2406 | The displayed normalized-value integrality is the source statement. The source relies on the defective integral cap; it supplies no theorem of whole-theta divisibility. The stronger package clause is refuted by R03. |
| 5.5 | (4.4.1)/Proposition 4.12, p.52, KS-v4 lines 2437–2461 | Correct orbit decomposition and NcE(a)−E(c⁻¹a). |
| 5.7 | Theorem 4.10 and proof, pp.51–53, KS-v4 lines 2413–2427, 2482–2502 | Both conductor cases and rings match. The two-auxiliary four-term computation was opened, revealing R02 when it is transported to measures. Algebraicity allows zero. |
| 6.1 | Notation 5.1, Definitions 5.2–5.3, Propositions 5.4–5.6, pp.56–58, KS-v4 lines 2633–2721 | Unramified ordinary hypothesis, prime-to-p evaluation, paired levels and opposite connected/étale directions retained. No p>3 restriction is justified or inserted. |
| 6.4 | Definitions 5.18–5.19/(5.4.1), pp.64–65, KS-v4 lines 2963–2988; Proposition 5.20, lines 2991–2999 | Invariant derivatives and embedding monomials match. General integral multivariate Amice remains the named supplier gap. |
| 7.1 | Definition 5.21/Theorem 5.22, pp.65–66, KS-v4 lines 3004–3035 | Moment identity has Ω_p^(a+1), not Ω_p^a. It preserves, rather than cancels, the sign of the EK coordinate. |
| 8.5 | Theorem 5.27, p.74, KS-v4 lines 3392–3409; proof pp.74–79, lines 3417–3745 | The displayed unsigned interpolation is printed in the source. Its proof drops the explicit class sign, omits the conductor-one translation, and does not establish the uniform integral boundedness claimed here. The package owns the boundedness proof, but its specified maps must first satisfy R01–R03. |

BKO-2021 lines 70–95, printed p.944, support the inert/supersingular boundary. No theorem from that independent nonordinary direction is consumed.

### Computed adversarial table

Rows marked “retained” use the earlier review's computed instance where the text was unchanged, with the displayed arithmetic rechecked. Rows covering repaired text, the seeded sample, the new Lean theorem and the interactions in R01–R03 were evaluated afresh. Earlier rows that merely named a construction were not treated as computed evidence. These are discriminating instances and algebraic consequences, not purported proofs of the deep targets. All source and target modules in the construction rows are those specified in the numbered sections; arbitrary unrelated complexes or free scalar placeholders are not substituted for them.

| Statement or law | Instances tried | Computed values on both sides / correct and wrong models | Result | Change |
| --- | --- | --- | --- | --- |
| Scope, lifted generality | L=K=ℚ(i); L=ℚ(i,√(1+i)) | Selected embedding counts 1 and 2; period repetition powers 1 and 2 | Retains non-CM extension | None |
| Critical/derivative convention | α=1,2,3 | a=0,1,2; a+1=1,2,3 | Exact shift | None |
| Ideal/idelic unitary convention | χ=N^m | w=2m, χᵘ=1; both L-functions equal ζ_L(s−m) | Correct | None |
| Arithmetic Artin and inverse | ζ₅ and prime 2 | Art₂:ζ₅↦ζ₅²; inverse:ζ₅↦ζ₅³; 2·3=1 mod 5 | Directions differ | None |
| Arithmetic bases and excluded coefficients | Square-zero ε; characteristic p; zero ring | ε²=0 in a subring of ℂ forces ε=0; p·1≠0; 0≠1 | These are outside the embedded datum; no hidden extension to them | None |
| Ideal denominator convention | Unit and zero ideals | N(O_L)=1; zero ideal is excluded, not assigned an invertible norm | No 0/0 | None |
| Hermitian pairing definition | h=1,z=1/2,w=i/2; h=2,z=w=1 | H(z,w)=−i/4, H(w,z)=i/4; H₂(1,1)=2 | Antisymmetry and scaling | None |
| Positivity and dimension binders | h=0; d=0 | log(0)=0 would make exponential denominator 1; in dimension zero the sole term is omitted, sum 0 | hh and hd explicitly exclude these headline instances | None |
| §0.1 admissibility | Gaussian μ=(−2,1) | a=1,β=1; μ(i)=i≠1, so full μ₄ is not its kernel | Finite-unit condition necessary | None |
| §0.1 norm pullback | Quartic α=(1,2),β=(0,0) | Two exponents above one K-embedding are 1≠2; a pullback gives equal entries | Rejects positive but inadmissible indices | None |
| §0.1 uniqueness and restriction API | μ=(−3,1); Γ′⊂Γ | α=3,a=2,β=1 uniquely; μ(Γ)=1 implies μ(Γ′)=1 | Correct | None |
| §0.2 based datum and action | Lie coordinate 2; γ=i | Lie scalar 2, cotangent 1/2; at i, Lie i and cotangents −i,−i | Excludes pullback-action substitution | None |
| §0.2 Serre tensor/base change | Rank 0,1,2 projective modules | Dimensions 0,d,2d; transporting a basis by an injective scalar map still sends 1 to 1 | Zero module excluded from positive-dimensional datum | None |
| §0.3 coefficient weight | a=β=0; α=4,β=0 on ℚ(i) | Determinant weight −1, not 0; i⁻⁴=1 gives the full invariant line | Correct | None |
| §0.3 nontrivial torsion-free weight | Gaussian α=1,β=0, Γ=μ₄ | i⁻¹=−i≠1; invariants in a free line are 0 | Wrong all-invariant model rejected | None |
| §0.3 torsion-module countermodel | μ₆, weight 3σ, M=R/(2) | Weight on generator −1≠1 in R; −1=1 in M, so M^Γ=M≠0 | Added torsion-freeness is essential | None |
| §1.1 trace-zero definition | Split degree 3 | h=(2,−1,−1), trace 0; constant function trace 3 | Correct domain | None |
| §1.1 two-auxiliary extension | Degrees 3 and 5 | Extended trace 4·0=0; restriction off the first identity has trace −2 | Correct support prescription | None |
| §1.1 empty/identity and base-change API | Identity kernel minus e; c=O_L; scalar extension | Empty module 0; 1−1=0; image of sum 0 is 0 | Correct | None |
| §1.2 support and equivariant degrees | d=1,Γ=1 | H⁰(A,F)=0; H¹(A,F)=R; localization degree 0 maps to support degree 1; trace(2,−1,−1)=0 | Correct degree and trace square | None |
| §1.2 inverse-limit boundary | Zero compatible residue system | All transition values 0; limit class 0 and its boundary 0 | Does not infer general lim exactness from this case | Named gap retained |
| §1.3 EK uniqueness/residue | h=(2,−1,−1); h=0 | Residue of EK(h)=h≠0, so the zero map fails; EK(0)=0 | Object determined by residue and vanishing | None |
| §1.3 linearity/naturality | h+h′; scalar a; identity diagram | Residues h+h′ and ah on both sides; identity transport preserves each residue | Uniqueness identifies the maps | None |
| §1.4 derivative definition | z²; z₁z₂ | ∂²z²=2, ∂₁∂₂(z₁z₂)=1 | Ordinary versus divided factors distinguished | None |
| §1.4 zeroth derivative / commutation | a=0; two commuting coordinate directions | ∇⁰EK=EK; ∂₁∂₂(z₁z₂)=∂₂∂₁(z₁z₂)=1 | Correct | None |
| §2.1 affine group-cohomology comparison | Γ=1; S₃ permuting ℤ³ | For Γ=1, H⁰=M and higher affine rows 0; for S₃, H⁰={(a,a,a)}≅ℤ, not ℤ³ | Derived invariants retained | None |
| §2.1 specialization/augmentation | d=1,Γ=1,a=b=0 | Specialization gives augmented section value; mom₀(c)=c on both sides | Rigidified scalar 1 rules out rescaling | None |
| §2.1 linearity/identity pullback | h=0; identity isogeny | Specialized value 0; identity splitting followed by mom₀ sends 1 to 1 | Correct | None |
| §2.2 torus/group comparison | Circle, Γ=ℤ; monodromy ±1 | Trivial case H¹=M; sign case differential −2, H⁰=0,H¹=ℤ/2 on both models | Actual representation matters | None |
| §2.2 cap and embedding order | d=1; d=2 transposition | cap(1)=1; orientation factor −1 times determinant factor −1 gives +1 | Correct normalization | None |
| §2.2 divided-tensor shift | Ru,a=1 over ℤ₂ | Shift u⊗u↦u^[2]; shuffle gives 2u^[2] | Distinct maps, shift remains invertible | None |
| §2.2 normalized torsion cap | Γ=μ₂,Γ₀=1 | Input 1 maps to 1/2; not integral over ℤ₂ | Localized assertion correctly scoped | None |
| §2.2 complement independence | Γ=T×ℤ, two free complements | Both project isomorphically to ℤ; top generator maps to 1, and normalized cap is 1/#T | Holds after inverting #T | None |
| §2.3 subgroup index | Circle covers of degree 1,2,3 | Integral of pullback of unit top class is 1,2,3=m·1 | No index cancellation | None |
| §2.4 refined evaluation | [f]=id; conductor divisible by residue prime | Identity coefficient transport gives EK, no norm multiplier; splitting at e_B is 1 even when Nf is a nonunit | Correct construction boundary | None |
| §2.4 composition and zero API | Identity composed with [f]; h=0 | [f]∘id=[f]; all pushed residue values 0 | No division by Nf | None |
| §2.5 refined/unrefined equality | f=O_L | Both coefficient maps are identity; both sides EK | Variance consistent | None |
| §2.6 coherent/de Rham degrees | d=1,2 | Degrees 0→1 and 1→3 | Distinct degrees retained | None |
| §3.1 Borel dimensions | d=1,2 | EΓ dimensions 0,1; total real dimensions 2,5; maximum bidegrees (1,1),(2,3) | Correct | None |
| §3.1 invariant metric/action | Coordinate unit c | |c|²r·|c⁻¹z|²=r|z|²; direct action would give |c|⁴r|z|² | Inverse action essential | None |
| §3.2 current definition / range | d=1,(p,q)=(1,0); p=2 | Tests have type (0,1), total degree 2; out-of-range space is 0 | Native range explicitly bounded | None |
| §3.2 differential sign | N=2,k=1 | ∫η∧dω=−∫dη∧ω; (−1)^(N−k)=−1 | Matches test-first convention | None |
| §3.2 residue and wrong rescaling | Point Thom current; twice that current | Pairing with a test equal to 1 is 1 versus 2 | Rigidified unit excludes rescaling | None |
| Supplier current conversion | N=2,k=1,p=1 | Wedge-order factor −1; transported Dolbeault homotopy −1, regularization +1 | Both supplier signs checked | None |
| §3.3 summand numerator | z+λ=i,ν=1; vector (1,0) | −i, not i; multi-indices (0,0),(0,1) give 1,0 | Antiholomorphic and coordinatewise | None |
| §3.3 omission and junk logarithm | λ=−z; h=0,z+λ=1 | Omitted term 0; bad metric would produce denominator exp(s·0)=1 | Correct branch and positive hypothesis | None |
| §3.3 convergence threshold | d=1,|ν|=0; d=2,|ν|=2 | Decay exponents −2Re(s)<−2 and 2−2Re(s)<−4; thresholds 1 and 3 | Matches lattice rank 2d | None |
| §3.3 translation in z and w | z=1/2,w=i/2,a=1; b∈Λ* | First multiplier −1; dual translation multiplier exp(2πin)=1 termwise | Both translation laws | None |
| §3.3 completion versus total sum | Square lattice, s=0 | Continued K(0)=−1; divergent total tsum=0 | Distinct objects | Wrapper remains deleted |
| §3.3 metric covolume | h=2,Λ=ℤ[i] | Lebesgue covolumes 1,1/4; H-volumes 2,1/2; product 1 | Correct repaired definition | None |
| §3.3 alternating dual iff | h=1,Λ=2ℤ+iℤ | Real dual ½ℤ+iℤ; alternating dual ℤ+(i/2)ℤ; 1/2 pairs with i to −1/2 | Reverse containment not assumed | None |
| §3.4 continuation/pole | Square lattice ν=0; ν=1,z=w=0 | Res₁K=π, K(0)=−1; ν=1 cancels in ± pairs, giving 0 | Actual pole and regular case | None |
| §3.4 completed residues | Same ν=z=w=0 | Res₀M=−1, Res₁M=1; Res₁K=π | Source's two objects separated | None |
| §3.4 scaled residue | h=2 | K₂=2⁻ˢK₁; Res₁K₂=π/2=π/vol_HΛ | Correct | None |
| §3.4 functional-equation phase | z=1/2,w=i/2 | Forward phase i; reverse −i; product 1, volume product 1 | Applying equation twice gives identity | None |
| §3.4 nondual regularity | Λ=ℤ[i],w=1/2 | Pairing with i is −1/2; dual indicator 0, residue 0 | Analytic-at-d clause consistent | None |
| §3.4 Gamma exclusions | d=1,ν=0,s=0 | Pinned Gamma(0)=0; meromorphic completion has residue −1 | Exclusion needed for pointwise product | None |
| §3.4 polynomial theta, ν=0 | h=2,Λ=2ℤ+iℤ,t=.7,z=.2+.3i,w=.1+.4i | Both truncated Gaussian sides .5947103658−.0919655360i; difference <7·10⁻¹⁷ | Independent numerical diagnostic | None |
| §3.4 polynomial theta, ν=1 | Same | Both .1842634508−.1669290861i; difference <4·10⁻¹⁷ | No missing h or i factor | None |
| §3.4 polynomial theta, ν=2 | Same | Both −.0158613186−.0185935996i; difference <2·10⁻¹⁷ | Antiholomorphic moment convention | None |
| §3.5 contraction | d=1; d=2,j=1 | ι_v(dz∧dbarz)=−v dz; top contraction −2Cv₁v₂u₁∧dz₁∧dz₂ | Correct local sign | None |
| §3.5 normalization and truncation | Square lattice; j≥d | vol(A)=−2i,C=−π; contraction +π·barℓ/r·dz; excessive contraction 0 | Nonzero denominator and degree bound | None |
| §3.5 inverse-power expansion | j=0,b=0,1,2 | Coefficients A⁻¹,−A⁻²,+A⁻³ | Alternating sign indispensable | None |
| §3.5 finite levels | Truncate degree n+1 to n | All b≤n coefficients unchanged; degree n+1 maps to 0 | Compatible pro-object | None |
| §3.6 differential/current comparison | h=0; d=1,b=0,1 | Zero source gives zero Fourier coefficients/residue; adjacent coefficients have opposite signs | Local cancellation consistent | Global sign must obey R01 |
| §4.1 orbit definition | μ₄,α=4 or 1,β=0 | i⁻⁴=1; i⁻¹=−i | Second input rejected | None |
| §4.1 representative and subgroup law | μ₄⊃1,t=1/3 | Four distinct translates; each single coset sum E, their sum 4E | Fixed-point qualification correct | None |
| §4.1 homothety | c=2,α=4,β=0 | Every term scales by 2⁻⁴·4⁻ˢ=1/(16·4ˢ) | Correct | Used in R02 |
| §4.2 fibre integral | d=1,α=4,β=0,s=0 | K⁴(4)=Σλ⁻⁴=E; Γ(4)K=6E on both sides | Absolute-convergence control | None |
| §4.2 Jacobian/factorials | d=2; α=(3,2),s=0 | dlog(ur₁)∧dlog(ur₂)=−2dlogu∧dlogr₁; Γ(3)Γ(2)=2 | Absolute Jacobian 2 and product factorial | None |
| §4.3 explicit class coefficient | (d,|β|)=(1,0),(1,1),(2,0),(3,0) | ε=−1,+1,+1,+1 | Computed local sign retained | R01 downstream |
| §4.3 algebraic basis conversion | Ω=2,q=1,d=1 | Ω∨=πi; barΩ/q=2=(2πi)/Ω∨ | Period factor agrees | None |
| §5.1 ideal/dual period datum | ℚ(i) | Trace-dual basis 1/2,−i/2; diagonal traces 1,1 and cross traces 0 | Inverse different essential | None |
| §5.1 period scaling | Ω=2,q=1,u=i | New Ω=2i,new q=−i; Ω∨=πi both times | Conjugate first argument | None |
| §5.1 nonprincipal ideal | a=(2,1+√−5) | Integral ideal norm 2, no element of norm 2; a still rank-one projective | No generator demanded | Retained |
| §5.2 normalization definition | α=3,β=0; α=2,β=1 | 2v/Ω³; (2πi)v/(Ω²Ω∨) | Correct | None |
| §5.2 linearity/scaling | v=0; selected basis scaled by 2,α=2 | N(0)=0; multiplier 1/4 | Rejects algebraic-unit overclaim | None |
| §5.2 coordinate factorials | α=(3,2) | Product 2!·1!=2, total derivative factorial 3!=6 | Distinguishes conventions | None |
| §5.3 partial L coefficient | b=O_L; χ=N | Coefficient 1; shifted function ζ_L(s−1), not ζ_L(s+1) | Correct | None |
| §5.4 coordinate descent boundary | Index 1; zero residue at index 2 | EK∈C; 0=2·0 | Valid boundary only, not evidence of full-function divisibility | R03 separates targets |
| §5.4 entire theta divisibility | Dyadic CM example of R03 | Residue mod 2 equals 1; a twice-integral formal function would give residue 0 | False | R03 |
| §5.5 smoothing distribution | Nc=3 | (3−1)E(a)−Σ_(t≠0)E=3E(a)−E(c⁻¹a) | Correct | None |
| §5.6 localized character value | b^m=(λ) | χ(b)^m=λ^(β−α); only primes over Nb occur in denominators | Correct after localization | None |
| §5.6 smoothing factors | χ(c)=2,Nc=7 | χ(c)Nc−1=13; atomic counterpart Nc−χ(c)⁻¹=13/2 | Difference is χ(c) | None |
| §5.7 conductor cases | χ(c)=2,Nc=7,χ(c′)=3 | Nontrivial-conductor factor 13; conductor-one factor (1−3)13=−26 | Distinct cases retained | R02 concerns transported raw family |
| §5.7 algebraicity / zero | L-value 0, nonzero periods | Normalized value 0∈k, not k× | Correct scope | None |
| §5.8 repeated CM periods | L=K; quartic extension of ℚ(i) | Exponents [L:K]=1,2 | Correct | None |
| §5.9 period versus special-value units | c⁺≠0,L=0 | L/c⁺=0∈Qbar; 0∉Qbar× | Correct distinction | None |
| §6.1 ordinary predicate | ℚ(i),p=5 or 3 | Two distinct places at 5; one shared place at 3 | Split accepted, inert rejected | None |
| §6.1 connected/étale direction | Gaussian reduction with Lie(i)=3 mod 5 | d[2+i]=0; d[2−i]=4 | Complementary q_n is étale | None |
| §6.1 small-prime control | ℚ(√−7),p=2; ℚ(√−2),p=3 | X²−X+2 becomes X(X−1); X²+2 becomes (X−1)(X+1) | Both ordinary unramified primes remain | R03 uses first |
| §6.2 p-adic period / transport | Canonical basis; unit u; nonunit p | Ω_p=1; uΩ_p; pΩ_p is not a unit basis ratio | Correct domains | None |
| §6.3 theta linearity and restriction | h=0; torsion-free index 2 | θ(0)=0; θ_Γ′=2θ_Γ | Holds even at p=2 without division | None |
| §6.3 augmented theta | d=1,a=β=0,Γ=1 | θ(0,0)=Ω_p e_(0,0); with nonzero e, zero theta fails | Extra determinant period retained | None |
| §6.3 integral versus generic evaluation | Prime-to-p torsion; ker q_n | First killing dual is étale; second is connected of positive height | Only first has stated integral splitting | None |
| §6.4 invariant derivatives | (1+T)²; mixed exponents 2,3 | Invariant second derivative 4 versus ordinary 2; mixed derivative 6 | Correct | None |
| §6.4 monomial API | Exponent 0 at 0; product at (2,3) | 0⁰=1; (2²3)(2·3²)=12·18=216=2³3³ | Coordinate product correct | None |
| §7.1 Amice object / mass | (1+T)^m; constant c | δ_m has kth moment m^k; cδ₀ has mass c and higher moments 0 | Excludes Haar substitution | None |
| §7.1 period moments | a=β=0; scale selected basis by u | Mass Ω_p e; Ω_p^(a+1)e scales by u^(a+1)u^−(a+1)=1 | Consistent identity | R01 sign is preserved |
| §7.1 linearity/basis independence | h+h′; exchange two ℤ_p coordinates | Transforms add; exponents (2,3) become (3,2) under coordinate exchange, same intrinsic character | Correct | None |
| §7.2 translation sign | n=0; cyclic character and inverse kernel | Single kernel point, pairing 1 gives θ=θ; positive χ times χ⁻¹ gives 1 | Correct pairing order | None |
| §7.3 Fourier definition/inversion | C₃ | (1,ζ,ζ²)↦(0,1,0); δ₀↦(1/3,1/3,1/3); positive inverse gives original vectors | Correct normalization | None |
| §7.3 inflation | C₄→C₂ | (1,0,1,0)↦(1/2,0,1/2,0) | Annihilator support, not frequency inflation | None |
| §7.3 boundary level | n=0 | Group order 1, Fourier denominator 1, transform 1↦1 | No out-of-range frequency | None |
| §7.4 locally constant twists | ρ=1; inflated ρ | Fourier transform supported at zero in transformed direction, coefficient 1; no extra level factor | Recovers original distributed moment | None |
| §8.1 local factor | Trivial finite component; quadratic character of 𝔽₃× | Local=1 at conductor zero; inverse-kernel sum −i/√3 versus +i/√3 for opposite kernel | Correct sign/nonvanishing | None |
| §8.1 independence of decomposition | Replace c by cλ,b by b(λ)⁻¹ | χ((λ))=χ_fin(λ)λ^(β−α); monomial, finite and ideal multiplier product 1 | Correct cancellation | None |
| §8.2 smoothing atoms | Nc=7,χ(c)=2; unit ideal | 7−1/2=13/2; δ_(O_L)=0 | Unit ideal cannot be denominator | None |
| §8.2 mass and convolution | χ=1; atom acting on δ_g | Mass Nc−1; χ-moment (Nc−χ(c)⁻¹)χ(g) | Correct standalone atom | None |
| §8.2 second atom versus raw residue | χ(c′)=1/81 | Atom 80/81; raw residue factor 80 | Mismatch | R02 |
| §8.3 determinant weighting | α=2,β=1,t=2,s=3 | Inverted avatar t²s=12; weight t⁻¹ gives 6=ts | Correct derivative index | None |
| §8.3 tame-unit quotient | f=O_L; f=(3) in ℚ(i) | U_f=μ₄ in first case, U_f={1} in second; −1 mod 3≠1 | Full-unit quotient would change kernel | Named gap retained |
| §8.3 class-sign propagation | R01's actual character | Raw normalized moment +2352U; stated −2352U, U≠0 | False | R01 |
| §8.3 conductor-one translation | R02's character | Raw factor 80; multiply by χ(c′)=1/81 gives 80/81 | Exact repair tested | R02 |
| §8.3 correct locus for integral torsion descent | μ=δ_1−δ_(−1), p=2 | μ/2 on 1+4ℤ₂ is 1/2; weighted quotient pushforward is 2δ_[1], normalized value 1 | Full module and descended module differ | R03 |
| §8.3 complete complementary depletion | Two prime values 2,3 | (1−2)(1−3)=2; retaining one gives −1 or −2 | Whole product necessary | None |
| §8.4 uniform Kummer criterion | C₂ and C₃ averages | Character moments 1,0,…; identity-indicator values 1/2 and 1/3 | Characterwise integrality insufficient | Keep owned uniform theorem |
| §8.4 density/uniqueness | Bounded difference annihilating all finite twists | Integral 0 on their span; continuity gives 0 on its closure, including all continuous tests | No density argument before boundedness | None |
| §8.5 basis covariance | α=2,u=2,p=5 | Both normalized expressions scale by 1/4 | Correct | None |
| §8.5 nonzero interpolation witness | Gaussian χ of type −4σ, p=5 | U≠0; construction is ε times unsigned value | Formula incompatible with construction | R01–R03 |
| Worked non-CM field | Root x²=1+i | x⁴−2x²+2=0; Norm_(ℚ(i)/ℚ)(1−i)=2 is not a rational square | Conjugate root not in L; repeated indices required | Retained |

The theta diagnostics sum over −18≤m,n≤18. They are numerical checks of phase/metric/moment conventions, not certified tail estimates. The analytic theorem is assessed through the Gaussian/Poisson/Mellin route and the exact residue and dual-lattice computations as well. Positive h and `ZLattice.covolume_pos` exclude every denominator zero in those signatures. All four declarations have explicit binders, so no ambient `variable` block silently drops a necessary hypothesis. Arithmetic unit subgroups are abelian; the nonabelian S₃ test is applied to the generic equivariant comparison, not incorrectly inserted as a unit group.

### Acceptance file and headline completeness

The README's headline results are the unique coherent residue class (§1.3), refined integral critical evaluation and polylogarithm comparison (§§2.4–2.6), analytic continuation and functional equation (§3.4), the current comparison and explicit class (§§3.6,4.3), regularized integrality in both conductor cases (§5.7), generalized Shimura algebraicity (§5.8), the weak Deligne period relation (§5.9), the integral Eisenstein measure/moments (§7.1), and bounded ray-class interpolation/uniqueness (§§8.4–8.5).

The two analytic headlines are stated on native full lattices and actual summands. The other eight groups are named in the module docstring, with their missing geometric or arithmetic carriers: completed Poincaré/support objects; universal-extension and Hodge comparison objects; relative currents/EK classes; compatible periods and Hecke L-values; Serre CM periods; Hecke motives/determinant periods; ordinary theta and multivariate integral Amice objects; and arithmetic avatars/compatible smoothed families. Object searches at the pins did not supply these missing packages of data. The existing abstract Hecke character does not determine a CM period datum. No statable headline was replaced with an arbitrary predicate or a free-scalar stand-in.

`lake env lean` on the specified absolute package file, run from the supplied content checkout, exited 0 with exactly two warnings, both “declaration uses sorry”, at Suggested.lean lines 62 and 85. There is one `import Mathlib`, two real-body definitions and two sorried theorems, and no TauCeti import requiring an object build. A separate scratch copy followed by `#check @name` for each of the four declarations also exited 0 with the same warnings. Compared all four displayed types with §§3.3–3.4: d>0, positive h, lattice discreteness/full rank, the full dual iff, Gamma exclusions and punctured residue limit are retained. `ZLattice.covolume` elaborates with `MeasureTheory.volume`. No signature lost a binder; no change was needed.

For each theorem a scratch proof attempted, in turn, a single `simp`, `rfl` or `infer_instance`, requiring the tactic to close every goal. Both proof attempts failed. The object/name searches found no pinned theorem that could close either by a single `exact`; the earlier numerical and analytic checks distinguish their conclusions from the definitions. Neither theorem is padding. The two definitions are necessary formulas in those statements. All four local names appear in the README, and no duplicate fully qualified declaration was found on main or the indexed open heads. No `set_option`, admitted datum, admitted example, prohibited import, API catalogue or computational algorithm appears in the package.

### Pinned-library ownership audit

The content checkout is b41e47bc34e30def0db01d84cc92062ed72c6e68. Its manifest pins Mathlib to 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti to a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The following declarations were opened at those pins. No inference of a stronger carrier was made from a declaration's name alone.

| File and line at the pin | Declaration/body or limitation checked |
| --- | --- |
| `Mathlib/NumberTheory/NumberField/CMField.lean:69` | `NumberField.IsCMField` has total-complexity and quadratic-over-maximal-real-subfield fields; it does not mean any totally imaginary field. |
| `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean:373` and line 415 | `NumberField.Units.instZLattice_unitLattice` and `logEmbeddingEquiv`; the latter identifies units modulo torsion, not units themselves. |
| `Mathlib/Algebra/Module/ZLattice/Basic.lean:433` | `IsZLattice` has an explicit `DiscreteTopology L` argument and the field `span_top`. |
| `Mathlib/Algebra/Module/ZLattice/Summable.lean:236` | `ZLattice.summable_norm_sub_rpow` assumes r<−finrank_ℤ L and permits a translated norm. |
| `Mathlib/Algebra/Module/ZLattice/Covolume.lean:72` and line 98 | `ZLattice.covolume` is `(addCovolume L E μ).toReal`; `covolume_pos` uses a full discrete lattice and additive Haar measure. |
| `Mathlib/NumberTheory/Padics/Measure/Basic.lean:40` | `AbstractMeasure := C(X,R) →L[R] E`; no mass-one or operator-bound-one condition is part of this definition. |
| `Mathlib/NumberTheory/Padics/Measure/Basic.lean:97` and line 105 | `AbstractMeasure.dirac` is evaluation; `map` precomposes tests by a continuous map. |
| `Mathlib/NumberTheory/Padics/Measure/Monoid.lean:115` | `AbstractMeasure.diracHom` uses convolution and sends multiplication of points to convolution of atoms. |
| `Mathlib/NumberTheory/Padics/Measure/AmiceTransform.lean:157` | `AbstractMeasure.amiceTransformEquiv` is D(ℤ_p,ℤ_p)≃ₗ[ℤ_p]ℤ_p⟦X⟧; it is not the integral multivariate O_(ℂ_p) result. |
| `Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:352` | `fourier_gaussian_innerProductSpace` requires Re(b)>0 in the finite-dimensional real inner-product-space section. |
| `Mathlib/Analysis/MellinTransform.lean:90` | `mellin` integrates t^(s−1)f(t) over positive real t. |
| `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean:319` and line 344 | `Complex.Gamma_eq_integral` assumes Re(s)>0; `Gamma_neg_nat_eq_zero` gives the total value 0 at nonpositive integers. |
| `TauCeti/Algebra/Coalgebra/Comodule/MonoidAlgebra/Basic.lean:416` and line 568 | `isInternal_weightSpace` and `endOfPoint_tmul_of_mem_weightSpace`; decomposition and scalar action do not imply disappearance of nontrivial weights on torsion modules. |
| `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Algebraic.lean:60` | `HeckeCharacter.IsAlgebraic` is agreement on the identity component; no period line is included. |
| `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Shift.lean:273` | `HeckeCharacter.unitaryPart` is χ times the inverse real norm shift; the ideal exponent sign is separately fixed in this README. |

The lattice, Fourier, measure, tensor-weight and Hecke objects remain with these owners. The specialized CM residue/current/moment construction and the twisted lattice continuation are not duplicate pinned objects. Generic full-lattice Poisson is consumed from ThetaSeries rather than re-planned.

### Cross-roadmap citations and ownership

Citation resolution was rerun against main b41e47b and the index of 352 open heads. It reported no unresolved roadmap citation or local Lean name. Its explicit limitation was that it did not check Lake declarations; the table above supplies that check. Existing roadmap revisions were not used as suppliers: those citations were checked in the content checkout on main. New roadmap citations were opened with the roadmap service at their indexed heads.

| Supplier and authoritative location | Sections actually resolved and boundary checked |
| --- | --- |
| `TauCetiRoadmap/GlobalNumberFields/README.md:273`, main | Layers 2,7,9,10 (also lines 453,502,525): ray carriers, ideal/idelic character dictionary, infinity types, units, purity and norm change. Converse unit-type classification and the arithmetic p-adic avatar remain named contracts. |
| `TauCetiRoadmap/ClassFieldTheory/README.md:1312`, main | Layers 7,11,12,13 (lines 1683,1724,1799) and arithmetic convention at line 460. Finite ray reciprocity is supplied; the completed tame-unit kernel remains the declared extension. |
| `TauCetiRoadmap/ThetaSeries/README.md:432`, main | Layer 1 items 1A,1E,1F and Layer 2 items 2A,2C: positive Fourier phase, separate summability, Gaussian functions, duality and covolume. Transport Λ* = iΛ∨ was recomputed. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3437`, main | §§2.6,2.7,2.19,2.20,2.23 (lines 3482,4094,4275,4558): affine acyclicity, supports, duality and derived equivariance. Affine collapse is not a missing theorem; completed equivariant limits and the Borel comparison are separate gaps. |
| `TauCetiRoadmap/AlgebraicTopology/README.md:849`, main | Stage 5 items 3–4, Stage 6 at line 946, Stage 8 items 5,7,8 at line 1602 onward. The classifying comparison uses actual local systems, the identity on π₁ and explicit bar-label inversion. The torus cap/projection compatibility remains its own gap. |
| `TauCetiRoadmap/DifferentialGeometry/README.md`, main | Layers 0–1 and 5, especially 5.2 integration and 5.3 Stokes. The repaired citation no longer substitutes the duality layer for integration. |
| `TauCetiRoadmap/Hyperfunctions/README.md:251`, main | HF2.AnalyticPreparation.CurrentResolution: compact bundle currents, properly supported regularization, (−1)^p homotopy transport, unsigned regularization. Compact and unrestricted current carriers are not identified. |
| `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:424`, main | §§0.1,1.2,1.7,2.1,2.2,3.1 (lines 657,909,1148,1229,1978). Weighting, clopen restriction, convolution and admissible pseudomeasure evaluation are supplied. Generic one-variable coefficient weighting does not already provide integral multivariate Amice or uniform bounded division. |
| `TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md`, indexed new-roadmap head | P0.1–P0.6, P1.1, P2.1–P2.8, P3.2–P3.4, P4.1–P4.3. In particular P2.2 has elliptic ranks 3 and 6, P2.5 requires the stated étale dual, P3.3 has a field base, and P4.2 distinguishes integral injections from generic-fibre moment isomorphisms. |
| `TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocity/README.md:417`, indexed new-roadmap head | §1.3, `cmHodgeEigenspaces`, CM ideal-kernel degrees and period pairings: inverse cotangent action, lifted types, conjugate first pairing factor and inseparable rank retained. |
| `TauCetiRoadmap/ComplexComparisonPartII/README.md`, indexed new-roadmap head | C1.1, C5.1, C5.4: finite-rank Dolbeault comparison, ordinary de Rham comparison, continuous bundle tests/current calculus. Its form-first pairing converts by the stated wedge sign; mixed real/complex Borel degrees and the algebraic residue trace are declared extensions. |
| `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md`, indexed new-roadmap head | R07.1.7, R07.1.9, R07.1.13: Cartier duality, henselian connected–étale sequence, complete-noetherian-base formal group comparison. Their CM-idempotent/all-level pairing extension is explicitly contracted. |
| `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md`, indexed new-roadmap head | AL.0 finite Schwartz/Fourier levels; AL.1 local constants/Gauss sums, global Euler products and rank-one Hecke comparison. The supplier's positive Tate Fourier convention is not silently substituted for this package's inverse finite kernel; the 𝔽₃ calculation fixes the conversion. The unitary hypothesis is respected by the norm shift. |
| `TauCetiRoadmap/PeriodsAndSpecialValues/README.md`, indexed new-roadmap head | PS.0 comparison/period lines, PS.1 criticality and normalized-value predicates. Generic criticality and nonzero determinant periods are supplied; Hecke realizations and their explicit CM period comparison are declared extensions. Zero special values remain allowed. |

Object searches used `roadmaps grep` on main and the indexed open heads, including the named open work, for completed Poincaré sheaves, CM periods, Eisenstein–Kronecker classes, theta/Eisenstein measures, lattice Poisson, Amice theory and unit-index descent. The hits locate the generic geometry in AbelianSchemesAndArithmeticModuliPartII and ComplexMultiplicationAndExplicitReciprocity, currents in ComplexComparisonPartII/Hyperfunctions, and Poisson in ThetaSeries. The ideal-lattice Epstein specialization in LFunctions is not this package's general shifted, twisted, multi-index lattice series. No duplicate fully qualified Lean name or competing construction of the general EK residue/theta measure was found.

The supplied board index was read before making ownership judgments. Five indexed package READMEs were readable at their supplied heads: AnalyticNumberTheory, ArithmeticStatistics, AutomorphicCongruences, KatoEulerSystems and LogicAndDefinabilityInNumberTheory. Object searches found no competing general EK construction. AutomorphicCongruences has a narrower declared Katz/anticyclotomic supplier request to PadicFamilies (`packages/AutomorphicCongruences/README.md:111`), not an independent construction of the general totally imaginary-field measure. The other fifteen supplied README paths returned 404; the limitation is recorded below rather than turning it into an absence claim.

### Supplier gaps and direction

All twelve gap slugs in the brief are present in the plan and in Exact supplier contracts with identical needs sentences and named suppliers. None has supplier `none`. The three internal G1/G2/G3 records and `group-torus-comparison` are absent, as required by the prior review. The remaining extensions have specific objects and relevant hypotheses in their surrounding contracts; no additional generic construction is silently assigned to this roadmap.

| Gap slug | Scope remaining after comparison with the actual owner |
| --- | --- |
| unit-type-classification | Converse classification of integer types trivial on finite-index units, including the no-CM case. |
| hecke-padic-avatar | The arithmetic fp∞ avatar and its ideal/idelic inverse convention. |
| equivariant-poincare-limit | Completed equivariant inverse-limit obstruction and Borel comparison; ordinary Poincaré cohomology and affine collapse are not requested again. |
| borel-bundle-currents | Mixed relative bidegrees and flat finite-level Poincaré coefficients on the real unit cover. |
| current-residue-trace | Top unit-torus integration and identification with rigidified algebraic trace. |
| torus-cap-projection | Compatibility of the supplied cohomology comparison with the specific oriented cap and finite-cover projection. |
| ordinary-cm-pairings | CM idempotents and paired-isogeny compatibility after the stated arithmetic base changes. |
| integral-multivariate-amice | Arbitrary finite ℤ_p rank and completed O_(ℂ_p) coefficients, with integral naturality. |
| bounded-fraction-criterion | Uniform integral divisibility across torsion components and common zeros, beyond admissible single evaluation. |
| hecke-motive-periods | Rank-one Hecke realizations and the specified tensor/norm/Tate comparisons. |
| critical-cm-deligne-period | CM expression for the restricted Hecke motive's critical period, separate from nonvanishing of L. |
| ray-tower-tame-unit-kernel | The completed ray tower with closure of the actual tame-congruence unit group. |

These declared gaps are contracts, not new findings. R01–R03 are incompatible claims within the consumer's own construction, not missing work assigned to these suppliers.

The required dependency check was run without editing the order. Its exact output was:

```text
moved: AutomorphicPadicLFunctionsPartII moved in the merge order from #201 to #212, right after its last supplier NonordinaryCMSpecialValues; checked as moved (the worker moves it there when it submits)
depcheck: 48 roadmaps, 543 edges, 0 problem(s)
```

No UPWARD or CYCLE line was reported. The NonordinaryCMSpecialValues entry is a scope/downstream boundary, not a Needs or supplier-contract edge; the mechanical discovery overreads that boundary. A moved line is not a defect. Every actual external Needs citation was checked against the permitted main/head and the declared contracts. No missing supplier section was inferred from a search of the wrong checkout.

## Not verifiable

- Fifteen board-package README paths returned HTTP 404 at the heads in the supplied index: ArithmeticLocallySymmetricSpacesPartII, CompletedCohomologyAndLocalGlobalCompatibilityPartII, CrystallineCohomologyPartII, EndoscopicTransferAndUnitaryTraceComparisonPartII, HigherHidaAndColemanTheory, LawrenceVenkateshMethod, OrdinaryAutomorphicFormsAndModularityLiftingPartII, PELModuliPartII, PadicHodgeTheoryPartII, PadicLocalLanglandsForGL2QpPartII, RealSurfacePeriodIndex, SchemeAndStackFoundationsPartII, ShimuraVarietiesPartII, VStackSheavesAndLisseCategoriesPartII and VectorBundlesAndIsocrystalsPartII. Ownership against their unavailable package prose is not certified. This does not mean the roadmaps do not exist. The main/open-roadmap ownership search was performed separately through the provided service.
- The KS extraction drops some overlines. The cached PDF is present, but the available environment has no PDF renderer; original overline glyphs were not visually certified. The bar placements used in the review were checked against the surrounding types, paired-isogeny directions and the computed examples. No newly guessed glyph is used to justify a finding.
- The de Shalit proof mentioned inside KS-v4 was not opened. The package does not claim a theorem from that text; it explicitly owns uniform bounded division. No assertion that the source's omitted boundedness argument is impossible is made. R03 concerns a stronger, separately false full-module divisibility statement.
- No proof of the twelve declared supplier extensions is available from this package; they are accepted contracts for purposes of this review. Neither a sorried Lean elaboration nor the finite tests certify those future theorems.

No cited work requires a missing-reference request: both works in the package manifest are readable, and no additional work was cited or fetched. No authored source-manifest entry was removed or rewritten.

## Source issues

- **Error** in KS-v4 at Proposition 1.5, p.8: the source says all algebraic torus modules have only trivial-weight unit invariants; it should be restricted to torsion-free modules, since nontrivial weights can become trivial modulo 2; affects a stated result.
- **Error** in KS-v4 at the convergence assertion preceding Proposition 3.13, p.35: the source says convergence is uniform for arbitrary compact z,w sets; it should be restricted away from moving lattice singularities; affects a stated result.
- **Error** in KS-v4 at Proposition 3.13, p.35: the source says its displayed residues belong to K; it should be the Gamma completion, with K regular at zero and residue π^d/(Γ(d)vol_HΛ) at d; affects a stated result.
- **Misprint** in KS-v4 at Proposition 3.13, p.35: the source says the phase uses ⟨z,w⟩; it should be ⟨w,z⟩, as in its theta identity; affects a stated result.
- **Error** in KS-v4 at Proposition 2.27 and diagram (2.4.2), p.23: the source says top homological transfer to a free subgroup is surjective; it should account for the torsion index, which gives multiplication by 2 for μ₂→1 in degree zero; affects the proof.
- **Error** in KS-v4 at Lemma 3.16(2), p.37: the source says the epsilon-expansion coefficient is (−1)^j j! C; it should be (−1)^(j+1) j! C with its displayed contraction convention; affects a stated result.
- **Error** in KS-v4 at the inverse-power expansion in Theorem 3.20's proof, p.41: the source says the degree-b coefficient has positive binomial sign; it should include (−1)^b, already visible in (A+v)⁻¹=A⁻¹−vA⁻²+⋯; affects the proof.
- **Error** in KS-v4 at Lemma 3.25, p.43: the source says every single torsion-orbit series scales by subgroup index; it should require the larger group to fix the torsion class, or sum all smaller-group orbits; affects a stated result.
- **Misprint** in KS-v4 at Corollary 4.15, p.54: the source says the normalized special value belongs to Qbar×; it should say Qbar unless nonvanishing is assumed; affects a stated result.
- **Misprint** in KS-v4 at equation (5.6.1), p.72: the source says the embedding exponent is μ(λ); it should be μ(σ); affects nothing.
- **Error** in KS-v4 at Theorem 5.27, Step 1, p.74: the source says the kernel over the tame ray group quotients by all global units; it should quotient by the closure of units congruent to one modulo f; affects the proof.
- **Gap** in KS-v4 at Theorem 5.27, Step 1, p.76: the source says inserting Theorem 3.27 gives an unsigned expression; it should retain the class-to-value sign or specify a compensating change of the constructed measure; affects the proof.
- **Gap** in KS-v4 at Theorem 5.27, Step 3, p.78: the source says the raw two-auxiliary construction gives 1−χ(c′); it should include the Art(c′) translation converting χ(c′)⁻¹−1 to that factor; affects the proof.
- **Gap** in KS-v4 at Theorem 5.27, Steps 2 and 4, pp.77 and 79: the source says density and integral character values give an integral measure; it should establish a uniform integral bound or congruence criterion before extending the functional; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "b56965afd6f9cb56dfc13a54e068a965b036201e", "job": "REV-PKG-AutomorphicPadicLFunctionsPartII~2", "model": "gpt-6-astra", "worker": "chris-8"} -->
