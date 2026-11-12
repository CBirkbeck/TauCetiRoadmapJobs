<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13003#issuecomment-6781810904 -->
Review (codex) of 4919625

Verdict: needs_changes

1. **F01** (P2) The holonomy sketch excludes apparent singularities

   **Location:** packages/ModularFormsPartII/README.md:392: “its remaining finite singularities lie in `16^(−1/N)μ_N`, outside `U_N`”.

   **Claim:** The minimal scalar differential operator used in the holonomy embedding has no finite singularities inside U_N after the cusp pullback.

   **Witness:** N=1, H=Γ(2), f=λ−1/2. After λ=16u its minimal monic operator is ∂−1/(u−1/32). It has a pole at 1/32∈U₁, although f is holomorphic there.

   This is an allowed generator: f has rational coefficients, denominator 2 suffices, and L(H)=2 divides 2N. Its one-dimensional solution space is spanned by 16u−1/2. The operator annihilates it because 16−(16u−1/2)/(u−1/32)=0. At u=1/32 the solution vanishes but the coefficient has residue −1. Multiplying f by 2 to clear denominators does not remove that coefficient pole. CDT25 line 1435 asserts trivial local monodromy, not absence of scalar-operator singularities. The distinction is already correctly made in this package's §§7.1 and 7.8.

   **Exact repair:** Say that the remaining **genuine** finite singularities lie in the excluded set, while any singularities inside U_N have a full meromorphic local basis; apparent singularities introduced by a scalar presentation are permitted. Keep the holonomy membership conclusion and add the example above as a negative-control Check. Tested on the witness: the full basis {16u−1/2} is holomorphic, so the repaired meromorphic-basis condition holds and the exclusion of all singularities does not. No change to the definition of H or restriction of the modular functions is needed.

2. **F02** (P2) Generalized Fourier expansions have an earlier owner

   **Location:** packages/ModularFormsPartII/README.md:673–679, §7.4: “In a basis diagonalizing `ρ(T)`, each component has a convergent expansion”.

   **Claim:** This roadmap independently proves the generalized Fourier expansion and absence of logarithms for semisimple parabolic monodromy.

   **Witness:** Pull request #1391, TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/README.md:1260–1262, §8.4a, already owns Fourier expansions for arbitrary parabolic monodromy, including holomorphic slashes and the semisimple case. Its proof is at line 1276.

   The overlap is by object: the supplier takes a matrix logarithm A with exp(2πiA)=M and gives modes exp(2πi(nI+A)τ/w). Holomorphy sets its complementary coefficients b_n to zero; semisimplicity removes the nilpotent part of A. With w=1 this is exactly Q^μ times a Laurent series with finite lower support, as in §7.4. The supplier permits nonunit eigenvalues, so it also covers the package's complex μ. This package imports the same carrier from QSeries §8.1 but omits its expansion theorem. QSeries is earlier in merge-order/ORDER.txt: line 248, before ModularFormsPartII at line 280.

   **Exact repair:** Remove §7.4 as an independently owned theorem and proof. Import QSeriesPartitionsAndMockModularForms §8.4a in Scope and ownership and Exact supplier contracts, and point the consumers, especially §7.8 and the Layer 7 dependencies, to that theorem's holomorphic semisimple specialization. Keep useful specialization examples as Checks. Preserve a former-numbering resolution if the section label is removed or subsequent labels move. Tested: M=i gives μ=1/4, multiplier i and no logarithm; M=2 gives μ=−i log(2)/(2π), multiplier 2 and no logarithm. Both are supplied without adding a unitary or finite-order hypothesis. No new Lean declaration is needed.

Two P2 findings, both repairable. All six findings from round 2 are repaired. The package's README, Suggested.lean, metadata and sources manifest were left unchanged.

## Verified sound

### Previous findings, checked individually

The quoted passages below are from packages/ModularFormsPartII/README.md. None of the present findings re-raises a finding marked not actionable.

| Round-2 finding | Repaired passage | Assessment and recomputed witness |
|---|---|---|
| R01: odd-weight monodromy | :787: “The local monodromy there is conjugate to `ε^k Sym^k(T^w)`”. | Repaired. At the H′ cusp 1, B=[[-3,−2],[2,1]], trace −2, determinant 1; B²=[[5,4],[−4,−3]] is nonidentity unipotent. For even k, ε^k=1. The new Check at :796 uses column coordinates consistently. |
| R02: Wronskian sign | :733: “`L_j(y) = Wr(w₁, …, w_m, y)/Wr(w₁, …, w_m)`”. | Repaired, including the derivative-row convention and empty determinant 1. W=span{1} gives y′; span{1,x} gives y″; W=0 gives the identity. |
| R03: full-level curve index | :489: “identify `ℂM₂m` with the function field of `X(2m)`”. | Repaired. The same paragraph treats m=1 via X(2); m=1,2,3 give degrees 1,4,12. The twist contract is applied only at 2m≥4. |
| R04: minimal arithmetic model | :908: “let `𝒳(N)` be the minimal regular model”; “there `𝒳(N)` is any smooth proper model”. | Repaired in the target, gap and plan. Genus at N=3,4,5,6,7 is 0,0,0,1,3. The nonminimal cusp blowup has two intersecting −1 curves and retained fibre A¹; it is excluded. |
| R05: missing level-two intersection | :392: “replace it by `H₂ = H ∩ Γ(2)`”. | Repaired, with §1.5 in Needs. H=SL₂(Z), f=j, N=1 gives H₂=Γ(2), level 2; λ(i)=1/2 but λ(Ti)=−1. The cover is now defined. R01 above concerns a different assertion later in this paragraph. |
| R06: Kummer substitution at zero | :299: “The substitution alone does not remove `u = 0`”. | Repaired. The preimage now includes 0. For U=I+B, B²=0≠B, Uᴺ=I+NB remains nonidentity for N=1,2,3. The logarithmic negative control is present. |

Searched the rest of the package for each pattern. The only additional apparent-singularity overclaim found is R01; §7.1 already explicitly permits apparent singularities. The corrected Wronskian, curve index, cusp sign, minimal model and level-two cover hypotheses agree with the other uses. The repaired §7.6 cover API now explicitly requires H≤Γ(2) and −I∈H.

### Coverage, principles and shape

Read all 64 numbered targets, 64 Needs lines, nine layer dependency paragraphs, definitions and APIs, worked examples, conventions, metadata and manifest. The 12 definition/API Check blocks contain respectively 5,5,4,4,4,4,5,4,4,4,4,5 Checks, 52 in total. All nine layers end with Examples and Dependencies. Definitions distinguish valid objects from wrong signs, wrong coefficients, growth-only substitutes, ambient dimensions and nonminimal models. The scratch ledger records an instance with values for every numbered target; the compact public table below covers the seeded sample, headlines and findings.

Untouched targets were inherited only where round 2 had a row with actual values; targets merely described as sound were read and tested anew. All repaired passages, all 15 newly sampled targets and both finding witnesses were independently reviewed. Exact rational series arithmetic recomputed the inverse, Jacobi identity, second-kind integral, Catalan identity, cube root of j and root-denominator examples.

The roadmap extends ModularForms into arbitrary finite-index subgroups rather than replanning its congruence theory. No good-prime-only workaround, computational algorithm, copied source passage, forbidden supplier, sorry'd data, set_option, process residue or machine path was found in the package text. R02 is the ownership exception. No upward dependency or cycle was found. Three declared supplier gaps remain contracts; they are not findings.

Read ModularForms, FuchsianOrbifolds and ConformalMapping on main for shape and supplied mathematics. The package's layer order follows its proof dependencies: the modular holonomy embedding and arithmetic group arguments feed leveraging, which feeds UDC and then its applications. Its layers are named for mathematics, not source chapters. The ordering of independent application layers alone is not evidence that a source's chapter plan was copied.

### Seeded sources

All 15 sample targets were checked against the legal cached CDT author's offprint or KSV arXiv v4. CDT PDF page n has printed page n+626. No additional locator is flagged unverified in the README. Ihara1994 is settled uncertified and was not requested again. Every directly cited work is in the manifest under its existing key; no source was fetched and no manifest entry was changed.

| Target | Exact source and extraction | Outcome |
|---|---|---|
| 1.8 Wohlfahrt with signs | KSV10 §3, Lemma 7, Proposition 3, equation (1), Remark 8, pp.4–6; lines 183,198,239,262 | The −I hypothesis and signed conclusion agree. The elementary proof adapts 2N to N with −I present; the corrected factor order was multiplied out at a=2. |
| 2.3 level-two ring | CDT §4.2, p.655, CDT25 lines 1734–1744; λ normalization (1.0.2), p.628 | Supports the rational ring. The complex ring follows from X(2)=P¹ with only the three cusp poles; rational descent is justified by the rational invertible parameter. |
| 3.4 holonomy | CDT Proposition 3.0.1 proof, pp.650–651, CDT25 lines 1428–1447 | Supports the finite cover and full local meromorphic basis after width divisibility. Does not claim absence of apparent singularities: R01. The W-span correction agrees with the earlier supplier. |
| 3.7 exact stabilizer | CDT Lemma 4.2.3, pp.655–656, CDT25 lines 1766–1798 | Statement matches. The package repairs the source's basis/core argument by intersecting with ±Γ(2N). |
| 4.1 nonabelian Ihara | CDT Lemma 4.4.1, pp.658–659, CDT25 lines 1883–1943 | The source's signed case is recovered. The package's unsigned, more general G statement follows by the supplied principal-level amalgam, congruence property and signed Wohlfahrt argument. Its conjugation target is corrected. |
| 5.1 intersection and base change | CDT Theorem 4.3.2 proof, pp.656–657, CDT25 lines 1819–1830; Lemma 4.2.3, p.656 | Source uses intersection to compute degrees; package adds the necessary complex Galois/linear-disjointness argument. Corrected X(2m) indices agree with the degree calculation. |
| 6.7 cube root of j | CDT (1.0.3), pp.628–629, CDT25 lines 100–116 | Coefficients, level 3 and multiplication by Δ all agree. Q rather than q is the source's parameter in this example. |
| 7.9 arithmetic descent | CDT Theorem 7.3.3 proof, pp.690–691, CDT25 lines 3798–3819 | Galochkin, global nilpotence and quasi-unipotence chain agrees; the package supplies monic minimal-operator descent instead of assuming irreducibility. The derivatives are the independent coordinates of one companion-system solution. |
| 7.13 invisible summand | CDT Corollary 7.3.4, p.691, CDT25 lines 3820–3823 | The source lacks a spanning condition. The package's explicit counterexample has R³=I and a T eigenvalue greater than one; the effective-span correction is necessary. |
| 8.2 differential closure | CDT Lemma 7.4.4, pp.692–693, CDT25 lines 3891–3910 | Correct conclusion; package repairs θ_qΔ=2E₂Δ. Native Serre derivative works for every subgroup of SL₂(Z). |
| 8.3 second-kind integral | CDT §7.4.2, p.693, CDT25 lines 3934–3962 | Theta quotient supported; the printed integral formula's sign is wrong and is corrected in the package. Coefficient differences are zero through x¹³. |
| 8.4 Catalan integrals | CDT §7.4.2, pp.693–694, CDT25 lines 3963–4010 | Both integrality identities and the quotient agree. Both q-series give 1,1,−4,5,12,−42; weights are 1,1,0. |
| 8.5 deficient places | CDT §7.4.8, pp.694–695, CDT25 lines 4055–4074 | Source takes K=Q; number-field version applies the same test place by place. Its ε/2 exponent and this package's ε define the same existential deficiency. Complex modulus is not squared. |
| 8.6 congruence kernels | CDT §7.4.8, p.695, CDT25 lines 4075–4079 | Agrees with the supplied all-prime denominator and Ramanujan bounds. Vanishing of every vector component at infinity transports to every cusp. Odd weights vanish; nonzero cusp forms have even weight≥2. |
| 9.2 arithmetic covers | CDT Theorem 7.4.10 and proof sketch, p.696, CDT25 lines 4118–4133; Ihara1994 Theorem 1, pp.248–249, §4 p.252 | The minimal model and all-prime conclusion match CDT. Equivalence of finite étale cover categories follows from its pointed π₁ assertion. The independently stated Ihara proof route remains uncertified because that text is unavailable. |

### Adversarial table

An I marks a computed test inherited for unchanged text; other rows were recomputed this round. These are discriminating tests together with source and proof-route checks, not claims that finite examples prove the general theorems.

| Statement | Instances | Values on both sides | Result / change |
|---|---|---|---|
| §1.1, IsWeakForm (I) | 1, Δ⁻¹, exp(j), −I | Growth exponents 0 and 2π suffice for the first two; exp(j) grows doubly exponentially; odd slash gives −f | Weak, pole-free and excessive-growth cases separated |
| §1.8 | H′; KSV a=2 | Signed level2 versus strict4; ±H′=Γ(2), but −I∉H′. Correct factorization gives [[2,1],[−1,0]], printed one [[0,1],[−1,2]] | Signed conclusion and corrected factor order hold |
| §§2.1–2.2, λ headline | i, Ti, −I; q through q⁵ | λ(i)=1/2, λ(Ti)=−1; −I fixes i. x coefficients 1,−8,44,−192,718 | Correct covering orbit convention and factor16 |
| §2.3 | λ⁻¹, (λ−1/2)⁻¹, √2 | First has rational leading coefficient1/16; second has an interior pole at i; √2 constant is not rational | Ring and rational subring distinguish the cases |
| §§2.4–2.5 | N=1,3; U=I+B | Inverse coefficients1,8,84,992,12514,164688; composition x. x₃³=t³−8t⁶+44t⁹; Uᴺ=I+NB≠I | Repairs retain zero in the preimage |
| §3.4 | H=SL₂(Z), f=j; f=λ−1/2,N=1 | Intersected H₂ has level2 and admits λ; for the second example Lf=16−16=0, coefficient pole at1/32∈U₁ | First repair works; R01 removes the apparent-singularity overclaim |
| §3.7 | Basis{1}, N=1; N=2 | Stabilizer of1 is SL₂, level1; intersectΓ(2) gives level2 and fixesλ; ±Γ(4) has level4 | Exact-level construction works |
| §3.8 rank headline | A=1,N=2; N=1 | log((1+1/8)(1−1/16))≈.0532445≥1/24≈.0416667; log2≈.693147 versus log1=0 | Uniform logarithm and strict derivative condition hold |
| §4.1 Ihara headline | N=3,p=2; trivial S | Conjugation sends lower entry6 to3; SL₂(F₂) has6 elements, B has2, index3; (1,1) lifted byI | Correct domain, target and small-prime case |
| §4.2, nonabelian control | B⊂SL₂(F₅) | diag(2,3) U(1) diag(3,2)=U(4)≠U(1) | Reduction argument does not assume B abelian |
| §5.1 | m=1,2,3 | Degrees of X(2),X(4),X(6) over X(2) are1,4,12; old X(2) at m=2 gave1 instead of4 | Repaired curve index |
| §5.3 doubling headline (I) | Relative degree2 | Tower gives at least2·2=4 at next prime | Correct conditional growth |
| §6.1 equality headline (I) | N=1; k prime steps | At N1 both fields Q(λ), degree1; 2ᵏ growth exceeds O(log N) where k≫X/log X and log N=O(X) | Assembly consistent |
| §6.3 UDC headline (I) | f=1,0; h→2h | Coefficients(1,0,…) or all0; Γ(1) works; a_n moves to index2n | Positive period and boundedness retained |
| §6.6 algebraic-integer headline (I) | K=Q(√2) | Trace pairing diag(2,4), determinant8; Tr(m+n√2)=2m, Tr(√2(m+n√2))=4n | Reconstructs f with coefficients1/2,√2/4 |
| §6.7 | E₄/η⁸ | Unit coefficients1,248,4124,34752; leading Q^−1/3=q^−2/3; after Δ leading Q^2/3 | Integral period-three germ |
| §7.3, IsVectorValuedForm (I) | n=0; Jordan J; odd weight | Empty vector for n0; (J−I)²=0≠J−I; F=−F impliesF0 | Degenerate and nonsemisimple cases separated |
| §7.4 | Supplier w=1, M=i or2 | μ=1/4 or −i log2/(2π); exp(2πiμ)=i or2; nilpotent part0 gives logarithmic degree0 | R02 imports the earlier theorem |
| §§7.8–7.9 | W=0,span{1},span{1,x}; f=1 | Operators1,∂,∂²; values on1,x,x² are1,1,2. For f1 companion matrix0, divided iterates B₀1 and B_m0, multiplier1, p-curvature0 | Monicity repaired; arithmetic descent tests hold |
| §7.9 finite local monodromy | diag(1,−1), Jordan J | First squares toI; Jᴺ=I+N(J−I)≠I | Semisimplicity cannot be dropped |
| §7.11 component headline (I) | F1,c1,h1; odd period3 | Γ(1) works; exp(2πi·3τ/3)=q² | Scaling inserts zeros, retaining integrality |
| §§7.12–7.13 Mason headline | F=(1,0,0),ρ=1⊕σ | R²=[[-3,−1],[7,2]], R³=I; T trace5,det−1, eigenvalues≈5.19258,−.19258. Value span rank1 is fixed | Effective conclusion holds, whole-kernel conclusion fails |
| §7.14 | θ₃² at cusp1; Δ | B trace−2,det1; B²=[[5,4],[−4,−3]] nonidentity unipotent; Δ operator order13 | Odd-sign repair correct |
| §8.2 | Δ through q⁴ | θ_qΔ=2q²−96q⁴; E₂Δ=q²−48q⁴ | Correct factor2 |
| §8.3 | Hypergeometric and theta expressions | Both q-series1,−4,20,−64,164,−392; integral-formula residual0 through x¹³ | Corrected sign and Γ(4) character |
| §8.4 | Two integral series and quotient | I₁ coefficient x²=2; I₂ coefficient x²=1, so xI₂′ coefficient2; both quotient series1,1,−4,5,12,−42 | Identity holds with weights1,1,0 |
| §8.5 | a_m=2^−m; zero insertion | abs₂(a_m)=2ᵐ; replacing index m by2m multiplies archimedean ratio by2^−((k−1)/2+ε) | Deficiency invariant under reindexing |
| §8.6 | Δ, p=2,3 | Integral coefficients1,−24,252; 24≤2·2^(11/2)≈90.5097; 252≤2·3^(11/2)≈841.7767 | Congruence bound consistent; all-prime input resolved |
| §8.7 | Invisible σ | Eigenvalue moduli5.19258,.19258, so σ(T)^(2N)−I invertible; periodic σ-component0 | No deficient place follows from that unused summand |
| §9.1 | N=3–7; cusp blowup | Genera0,0,0,1,3; E²=C²=−1,E·C=1; retained fibre A¹ rather than P¹ | Minimality repair substantive |
| §§9.2–9.3 arithmetic headline | N1 smooth P¹; identity and split covers | Geometric π₁(P¹)=1; degree-d split cover is base pullback of d copies; π_*ε_*=id | Small-level and categorical tests hold; general Ihara route uncertified |

### Lean, headlines and padding

Ran the requested `lake env lean` on packages/ModularFormsPartII/Suggested.lean from the pinned content checkout. Exit 0; exactly six warnings, all `declaration uses sorry`, at lines 71,85,104,116,147,162. There is one import, `import Mathlib`; no TauCeti module needs building.

On a scratch copy, every sorried theorem was tested with closing alternatives `simp`, `rfl` and `infer_instance`. All six failed to close: the probe has six expected errors, one at each theorem's final alternative. There was no successful padding probe. Read the library near-matches: none supplies a single-lemma proof of these conclusions. The quotient-cover orbit equality, for example, is a field of an already established quotient covering, not a theorem establishing λ's quotient covering. No kept theorem is a definition restatement, Check, small computation or boundary case.

A separate scratch file ran `#check @name` for all nine declarations and elaborated successfully. All nine types agree with the README and the supplied signature record. Finite index, normality, p∤N, N≥3, c≠0, positive periods, actual periodicity, boundedness and coefficient conditions remain in the appropriate signatures. The conjugation map is tied to rational matrices by hc; it is not arbitrary. The three definitions have real bodies. All nine own Lean names occur in the README, and no extra own Lean identifier is promised in backticks. The all-endpoint strip formulation in Lean is equivalent to the a<b formulation by enlarging degenerate strips.

| Headline from the summary and end targets | Acceptance declaration or explicit limitation |
|---|---|
| λ covering, §2.2 | modularLambda_covering |
| Nonabelian Ihara, §4.1 | nonabelian_ihara |
| Integral UDC, §6.3 | unbounded_denominators |
| Algebraic-integer UDC, §6.6 | algebraicInteger_unbounded_denominators |
| Integral vector component, §7.11 | vectorValued_component_congruence |
| Effective-span Mason, §7.12 | vectorValued_effective_mason |
| Holonomy rank, degree doubling, R₂N=M₂N | Module docstring names §§3.8,5.3,6.1 and the missing weak Laurent-expansion embedding and integral holonomic ring. Native qExpansion is a Taylor PowerSeries, not this Laurent interface. |
| Three-point algebraicity and congruence | Module docstring names §§7.1–7.2 and missing linear-ODE continuation, local-monodromy and full meromorphic-basis interfaces. |
| Arithmetic fundamental group | Module docstring names §9.3 and missing modular minimal regular model and cusp section. |
| Differential closure and deficient-place applications | §§8.2,8.6–8.7 are application corollaries of the supplied derivative, denominator and Ramanujan theorems, not additional deep acceptance declarations. No small derivative identity or coefficient-bound Check belongs in Suggested.lean. |

No statable deep headline was found absent or replaced by a stand-in. The finite-cover criterion §9.2 shares §9.3's missing model carrier.

### Pinned declarations opened

Pins are unchanged from round 2: Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5. The following declarations were reopened at those pins; table paths are library-relative. Lines refer to declarations, not search-result names.

| File | Declarations / evidence |
|---|---|
| Mathlib/NumberTheory/ModularForms/Basic.lean | ModularForm :78; CuspForm :86; instGCommRing :561. ModularForm requires holomorphy and boundedness at its group cusps; it has no weak finite-principal-part field. |
| Mathlib/NumberTheory/ModularForms/SlashInvariantForms.lean | SlashInvariantForm :36, invariance field :42; it does not supply holomorphy or growth. |
| Mathlib/NumberTheory/ModularForms/SlashActions.lean | SL_slash :171 and SL_slash_def :174; inverse weight factor and left matrix action agree. |
| Mathlib/NumberTheory/ModularForms/BoundedAtCusp.lean | OnePoint.IsBoundedAt :53 quantifies over scaling matrices. |
| Mathlib/Analysis/Complex/UpperHalfPlane/FunctionsBoundedAtInfty.lean | atImInfty :30; IsBoundedAtImInfty :45. The filter is induced by Im→∞. |
| Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean | Gamma :42, Gamma_normal :55, Gamma0 :80, Gamma1 :132, IsCongruenceSubgroup :164. Positive level is required; −I is not. |
| Mathlib/NumberTheory/ModularForms/ArithmeticSubgroups.lean | SL-image HasDetOne :58, HasDetPlusMinusOne consequence :66; IsArithmetic :126, isArithmetic_iff_finiteIndex :132. |
| Mathlib/NumberTheory/ModularForms/QExpansion.lean | cuspFunction :89, differentiableAt_cuspFunction :96, qExpansion :172. Actual Taylor/Fourier comparison needs the positive period, holomorphy and boundedness used here. |
| Mathlib/NumberTheory/ModularForms/DedekindEta.lean | eta :57, eta_ne_zero :114, logDeriv_eta_eq_E2 :166. Nonvanishing is on ℍ; the logarithmic derivative has factor πi/12. |
| Mathlib/NumberTheory/ModularForms/Discriminant.lean | discriminant :50, discriminant_ne_zero :123, discriminant_qExpansion_coeff_one :212, CuspForm.discriminant :237. |
| Mathlib/NumberTheory/ModularForms/JacobiTheta/OneVariable.lean | jacobiTheta :29, jacobiTheta_T_sq_smul :37, jacobiTheta_S_smul :43; q=exp(πiτ). |
| Mathlib/NumberTheory/ModularForms/JacobiTheta/TwoVariable.lean | jacobiTheta₂ :252 and jacobiTheta₂_functional_equation :466; this two-variable function is not a mistaken identification with the classical θ₂ constant. |
| Mathlib/NumberTheory/ModularForms/EisensteinSeries/E2/Defs.lean | EisensteinSeries.E2 :61. |
| Mathlib/NumberTheory/ModularForms/Derivative.lean | normalizedDerivOfComplex :39, serreDerivative :127, serreDerivativeMF :304. The last requires Γ≤SL₂(Z), satisfied here. |
| Mathlib/NumberTheory/ModularForms/RamanujanFormula.lean | normalizedDerivOfComplex_E₂ :122 gives D E₂=(E₂²−E₄)/12. |
| Mathlib/Algebra/Group/Subgroup/Basic.lean; Mathlib/GroupTheory/Goursat.lean | normalCore :724; goursat_surjective :107, with its two surjective projection hypotheses. |
| Mathlib/NumberTheory/Chebyshev.lean | theta_le_log4_mul_x :191, theta_ge :531, pi_ge :842. Required nonnegative/large arguments are respected in the asymptotic application. |
| Mathlib/Topology/Covering/Basic.lean; Mathlib/Topology/Covering/Quotient.lean | IsCoveringMapOn :197; IsQuotientCoveringMap :38 and its orbit-equality field :40. No λ covering theorem is provided by that field. |
| Mathlib/Analysis/Meromorphic/Basic.lean; Mathlib/LinearAlgebra/Semisimple.lean | MeromorphicAt :36; Module.End.IsSemisimple :56. The former asks that some power cancel the pole; it is stronger than single-valuedness. |
| Mathlib/NumberTheory/NumberField/Basic.lean; Mathlib/RingTheory/IntegralClosure/IsIntegral/Defs.lean | RingOfIntegers :102, IsIntegral :53. A common coefficient field still needs §6.5. |
| Mathlib/RingTheory/PowerSeries/Substitution.lean | substInvOfIsUnit :567, right/left inverse :589/:594, uniqueness :600. Generic formal inversion exists; the λ-specific expansion and analytic comparison are the package's specialization. |
| TauCeti/NumberTheory/ModularForms/Cusps/Basic.lean | integerCuspWidth :170, integerCuspWidth_pos :176, with finite relative index for positivity. This width is strict. |
| TauCeti/NumberTheory/ModularForms/CongruenceSubgroups/Basic.lean | Gamma_le_Gamma_of_dvd :177, M∣N implies Γ(N)≤Γ(M). |
| TauCeti/NumberTheory/ModularForms/Parity.lean | char_neg_one_of_modFormCharSpace_ne_bot :136, χ(−1)=(−1)^k. |

Object searches in the pinned modular-form directories found no existing λ covering, UDC, nonabelian Ihara or arbitrary integral-component theorem. Native scalar forms, slash invariance, theta functions and graded rings are imported. No fully qualified declaration duplicates a readable sibling's declaration. R02 is a prose-theorem ownership collision, not a Lean name collision.

### Supplier order and cross-roadmap resolution

Required dependency check output:

```
depcheck: 236 roadmaps, 2142 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The count comes from this round's command, not the previous report. Every Needs line and supplier contract was read. The supplier text was obtained anew from main or the furnished open head. Table line numbers exclude the tool's identifying header. Paths denote README.md in the displayed roadmap directory.

| Supplier file | Resolved sections and mathematical input |
|---|---|
| TauCetiRoadmap/ModularForms/README.md | Main, former-label map :330–349 explicitly resolves Layer0, Layer4 and the eta worked example; §0.2 supplies eta transformation. Layer10 retains the analytic curve. It does not own noncongruence UDC. |
| TauCetiRoadmap/FuchsianOrbifolds/README.md | Main, Layer2 item3 :512 and item5 :526; Layer3 :563, including Laurent criterion item5 :593; Layer4 :604; Layer5 :659; Layer6 item1 :907. Presentation, normalized cusp widths, compactification and degree theory resolve. |
| Completed/UniversalCovers/README.md | Main, Stage2 :98: pointed lifting, subgroup classification and deck groups, with local path connectedness and basepoint conventions. |
| Completed/ConformalMapping/README.md | Main, continuation/reflection contracts :238–259 and Layer4 :618; λ ownership boundary :89. |
| TauCetiRoadmap/BelyiMaps/README.md | Main, Layer6 :2268, classification :2473, deck maps :2630; Layer9 :3294, meromorphic field :3495, degree :3581, algebraization :3694; λ excluded at :5606. |
| TauCetiRoadmap/ConformalMappingPartII/README.md | Main, §§0.3 :191,0.5 :203,1.4 :319,1.8 :367,5.1 :698,5.5 :734,5.8 :752,9.19 :1168. The covering and Gamma radius require N≥2; full meromorphic local bases allow apparent singularities. |
| TauCetiRoadmap/ModularCurvesPartII/README.md | #913, §§5.13 :1904,5.14 :1936,6.3 :2168,6.4 :2190,6.5 :2212,8.1 :2434,11.4 :3036; §§15.2 :3892,15.3 :3914,15.5 :3954,15.6 :3986,15.9 :4048,15.10 :4070. Unsigned principal amalgam uses N≥3,p∤N; the enhanced character result retains small coefficient primes. |
| TauCetiRoadmap/DiophantineApproximationAndTranscendencePartII/README.md | #1693, §§4.1 :641,4.2 :687,4.3 :709,4.4 :745,4.5 :761,4.6 :777,4.7 :793,4.8 :809. H allows full meromorphic bases inside U; the rank estimate applies to W, with scalar-extension correction for V. |
| TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/README.md | #928, §1.5 :226 and §2.9 :412. All integer weights, positive congruence levels, level-prime denominators and Laurent functions on Y(2N) are included. |
| TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/README.md | #1391, §5.2 :824 supplies eta multiplier, §8.1 :1169 supplies the general carrier. Additional owner §8.4a :1260 is consumed incorrectly as local new work: R02. |
| TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md | #851, §4.3, triple-product specialization :1605 and analytic product definitions :1607. The general triple product is explicitly an intermediate target. |
| TauCetiRoadmap/AutomorphicGaloisRepresentations/README.md | #1007, §4.2 :2503: temperedness at every finite place and bounds at every complex embedding. Classical weight k uses w=k−2. |
| TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md | Main, §5.2 :3012, IsGFunction :3028, §5.3 :3078, independent G-function companion-system input :3110. Global nilpotence and Katz are the separate declared gap. |
| TauCetiRoadmap/EtaleCohomologyFoundations/README.md | Main, §F.0.2 :200: actual finite étale category and pointed fundamental-group comparison for connected nonempty schemes. |

Read the board package index and searched the available packages by object. Also fetched packages/AnalyticNumberTheory/README.md at board head 310e834 and packages/LogicAndDefinabilityInNumberTheory/README.md at head 8d875d1: their scope paragraphs and object searches reveal no competing modular target. The former is a navigation index; the latter owns logic, valued fields, integration and counting. The LawrenceVenkateshMethod file at the listed head returned HTTP 404, as recorded below. The supplied main/open-head tools were used for object searches and all listed suppliers. The overlap facts contain no conflicting edit, dropped cited identifier or identifier defined only in an open revision. The additional object overlap R02 was found by reading the closest roadmap beyond the two sections cited in the package.

Closest-scope comparisons: #1721, TauCetiRoadmap/HalfIntegralWeightModularForms/README.md:38–70 owns half-integral holomorphic forms, multipliers and Shimura theory; #1714, TauCetiRoadmap/SiegelModularForms/README.md:31–64 owns higher-genus forms and Fourier theory. Neither owns the modular holonomy embedding or integral-component UDC here. QSeries owns the general carrier and expansion theorem, DAT-PartII the general holonomic ring/rank estimate, and ModularCurvesPartII the cohomological Ihara and model inputs. This package owns the modular specialization and nonabelian quotient argument, subject to R02. NoncongruenceModularForms on main explicitly imports this package's signed geometric-level and UDC targets at TauCetiRoadmap/NoncongruenceModularForms/README.md:300–308; its §3.3 is the permutation transport plus a distinct strict-level extension, not a second signed theorem.

The three gap slugs and needs agree in README :81,:83,:105 and design/plan.json :3442,:3448,:3454. Each has a named supplier and concrete hypotheses. The twisted rational cusp differs from the fixed-pairing cyclotomic cusp. The all-prime full-level minimal model is not the Γ₀(pⁿM),p>3 regular-resolution theorem at ModularCurvesPartII §11.4. The Bombieri–André/Katz chain is not supplied by Chudnovsky's theorem alone. No redundant or unowned gap was found. The repaired model contract no longer requests unconditional compatibility of minimal models with ramified field extension.

## Not verifiable

- Ihara1994, Theorem 1, pp.248–249 and §4, p.252: settled uncertified in sources.toml; the text was not available. No repeated request or new manifest key was made. CDT25 supplies a short sketch, not the full formal-rationality argument used in §9.2.
- The three declared supplier gaps are future contracts. Their ownership, exact statements and matching declarations were checked; their proofs are not claimed to exist at the pins.
- packages/LawrenceVenkateshMethod/README.md at the board index's head 9ee7ac3 could not be read: the repository contents endpoint returned HTTP 404. No claim is made about that unread file. The other two indexed board heads were opened and searched.

## Source issues

These are source issues encountered while checking the present sample and repairs. They are already corrected or distinguished by the package, except that R01 is a package overclaim rather than an error in its source.

- **Misprint** in KSV10 at §3 after equation (1), arXiv v4 page 6: the source orders the conjugating factors as T′ then T′⁻¹; it should use T′⁻¹ then T′, giving [[2,1],[−1,0]] at a=2; affects nothing.
- **Misprint** in CDT25 at Proposition 3.0.1, printed page 650: the source states CN³ log N uniformly; it should use log(2N) or require N≥2, since the level-two rank is at least one; affects nothing.
- **Misprint** in CDT25 at Lemma 4.1.7, printed page 654: the source uses the correcting diagonal diag(p,1/p); it should use diag(1/p,p), yielding rows (a/p,b) and (c,pd); affects nothing.
- **Gap** in CDT25 at Lemma 4.2.3, proof, printed page 656: the source takes a core of basis stabilizers and asserts exact level; it should also intersect with the signed principal group to fix λ and force that level; affects the proof.
- **Misprint** in CDT25 at Theorem 4.3.2, proof, printed page 656: the source chooses the function at the enlarged level; it should choose a noncongruence generator at the old level before applying p-scaling; affects nothing.
- **Gap** in CDT25 at Theorem 4.3.2, proof, printed page 657: the source deduces the compositum degree from the intersection; it should justify linear disjointness using the complex Galois extension; affects the proof.
- **Error** in CDT25 at §4.4 before Lemma 4.4.1, printed page 658: the source treats A-conjugation as an automorphism of the Γ₀(p) intersection; it should map into the ambient principal group with upper-right divisibility; affects the proof.
- **Error** in CDT25 at §4.4 before Lemma 4.4.4, printed page 659: the source gives Γ(Np) as the signed-domain reduction kernel; it should use the unsigned domain or include the extra signed classes; affects the proof.
- **Gap** in CDT25 at Remark 6.3.2, printed page 686: the source uses coefficientwise conjugate expansions as modular forms without establishing that step there; it should supply the algebraic-cover descent before taking traces; affects the proof.
- **Misprint** in CDT25 at (7.2.4), printed page 688: the source describes θ₃² as a weight-one form on Γ(2) without a character; it should include χ₋₄(d), whose value on −I is −1; affects nothing.
- **Gap** in CDT25 at Theorem 7.3.3, proof, printed pages 690–691: the source assigns rank 6n to component translates and assumes irreducibility; it should use the actual component continuation space and justify arithmetic descent without irreducibility; affects the proof.
- **Error** in CDT25 at Corollary 7.3.4, printed page 691: the source concludes congruence of the whole representation kernel from integral components; it should require spanning values or conclude on their span; affects a stated result.
- **Misprint** in CDT25 at Lemma 7.4.4, proof, printed page 692: the source combines θ=(1/πi)d/dτ with θΔ=E₂Δ; it should read θΔ=2E₂Δ; affects nothing.
- **Misprint** in CDT25 at §7.4.2, printed page 693: the source's second-kind integral expression has constant term −1; it should be (1−16x)K₀+8∫₀ˣK₀, with constant term 1; affects nothing.
- **Error** in CDT25 at the theta-monomial paragraph, printed page 693: the source permits Γ(12) for every even-total-degree theta monomial; it should choose a level killing each multiplier, since θ₂θ₃ changes sign under T¹²; affects the proof.
- **Error** in CDT25 at §7.4.8, printed page 695: the source infers a finite deficient place from noncongruence of the representation kernel alone; it should require a noncongruence arithmetic component, excluding invisible infinite-image summands; affects a stated result.
- **Misprint** in CDT25 at (1.0.4), printed page 629: the source assigns λ(1−λ) to Γ₀(2); it should use the theta group, since T changes the leading q coefficient's sign; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "491962527f1220991a35fe844f6b2e98a74ba2f9", "job": "REV-PKG-ModularFormsPartII~3", "model": "gpt-6-astra", "worker": "chris-8"} -->
