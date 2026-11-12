<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13003#issuecomment-6790075314 -->
Review (codex) of d0236cc

Verdict: needs_changes

1. **F01** (P2) Conjugation moves apparent singularities

   **Location:** `packages/ModularFormsPartII/README.md:756`, §7.11 API: “the conjugate operator `L_j^σ` kills the conjugate series and has the same singular points”.

   **Claim:** Coefficient conjugation fixes the entire singular set of the minimal component operator.

   **Witness:** Take `f=λ−√2`, induced from `Γ(2)`, and `σ(√2)=−√2`. Its minimal operator is `∂−16/(16x−√2)`; conjugation moves its apparent pole from `√2/16` to `−√2/16`.

   **Exact repair:** Replace preservation of the singular set by preservation of the three possible genuine singularities `{0,1/16,∞}`. State that an apparent singularity at α moves to σ(α), retaining a full meromorphic local basis. In the number-field argument, descend the minimal operator to the coefficient field, transport the regular-singular Puiseux/no-log conditions under conjugation, and apply §7.1 to the traces allowing the union of the conjugate apparent points. Add this example as a negative-control Check; retain the algebraic-integer component conclusion.

   **Repair test:** The induced form has weight zero, finite permutation monodromy and selected component with coefficients `−√2,16,0,…` in `𝓞_{ℚ(√2)}[[x]]`. The two full bases are `{16x−√2}` and `{16x+√2}`, holomorphic even at their respective apparent singularities. The operator residual is `16−16=0` in both cases. For the integral basis `1,√2`, the traces are `32x` and `−4`, which satisfy §7.1. This is the same apparent-versus-genuine distinction repaired in §3.4, not a reopening of that repaired passage.

2. **F02** (P2) A non-root-of-unity eigenvalue can have a real exponent

   **Location:** `packages/ModularFormsPartII/README.md:793`, new Layer 7 example: “An eigenvalue that is not a root of unity gives a nonreal exponent.”

   **Claim:** Infinite multiplicative order forces the exponent μ in `e=exp(2πiμ)` to be nonreal.

   **Witness:** Put `μ=√2−1` and `e=exp(2πiμ)`. Then μ is real and `|e|=1`, but `e^m≠1` for every positive integer m, since `m(√2−1)` is never integral.

   **Exact repair:** Replace the sentence by “An eigenvalue whose modulus differs from 1 gives a nonreal exponent.” Keep the existing example with `σ(T)`, and add the irrational unit-circle case to distinguish infinite order from nonunit modulus. The general supplier permits both cases; do not impose unitarity or finite-order restrictions on §7.3.

   **Repair test:** The exact law is `|exp(2πiμ)|=exp(−2π Im μ)`. For the existing eigenvalue `5.1925824`, it gives `Im μ=−0.26216498`; for the new control it gives `Im μ=0`. The control occurs in an allowed semisimple representation of `PSL₂(ℤ)`: set `s=sin(2πμ)`, `S=diag(1,−1)` and

       R = [[−1/2+is, 1], [s²−3/4, −1/2−is]].

   Here `tr R=−1`, `det R=1`, hence `R³=I`, while `S²=I`. The eigenvalues of `T=SR` are `e` and `−conj(e)`, distinct and both of modulus 1; their real exponents in `[0,1)` are `0.4142135624` and `0.0857864376`. Thus this is not an eigenvalue outside the roadmap's representation class.

3. **F03** (P3) The Ihara docstrings conflate signed and unsigned level conditions

   **Location:** `packages/ModularFormsPartII/Suggested.lean:81`: “of `T^N`, that is, of geometric level dividing `N`”; also the module summary at line 14.

   **Claim:** The actual unsigned binder `hlevel` is equivalent to geometric level dividing N, without assuming `−I∈G`.

   **Witness:** For the weight-one character of `η²`, `χ(T)=exp(πi/6)` and `χ(−I)=−1`. Its kernel G is normal of index 12, has signed level 6, but `χ(T⁶)=−1`, so `T⁶∉G`.

   **Exact repair:** At line 81 replace “that is” by “hence”; describe the unsigned conjugate-containment hypothesis explicitly in the module summary. Explain that the equivalence with geometric level uses `−I∈G`. Retain the theorem signature and the correct implication already written in README §4.1. Add the character-kernel example to the level Checks, not to `Suggested.lean`.

   **Repair test:** `χ(S)=−i` gives `χ(S)^4=1` and `χ(S)^2=(χ(S)χ(T))³=−1`, so the character respects the `SL₂(ℤ)` presentation. Conjugation does not change a character value. Therefore the least positive m with every conjugate of `T^m` in `±G` is 6, whereas the least with every conjugate in G is 12. At `N=6,p=5`, the signed level condition holds but the actual Lean binder fails. The corrected implication accepts no additional inputs and preserves the theorem.

Three findings: two P2 and one P3. The previous two findings are repaired in their original locations. The new findings concern a remaining apparent-singularity overclaim, an incorrect sentence added with the Fourier-expansion repair, and an inaccurate description of the Ihara hypothesis. None requires changing a headline theorem's mathematical conclusion.

## Verified sound

### Previous findings and changed text

| Previous finding | Repaired passage in `packages/ModularFormsPartII/README.md` | Assessment and values |
|---|---|---|
| F01, apparent singularities excluded | :392: “Such points can still be singular points of the scalar operator: zeros of the Wronskian of the conjugates are apparent singularities” | **Repaired.** At `N=1`, `f=λ−1/2`, the operator is `∂−1/(u−1/32)`, its coefficient has residue −1 at `1/32∈U₁`, and its full basis is holomorphic there. The added Check at :432 gives residual `16−16=0`. |
| F02, duplicate Fourier-expansion ownership | :11: “QSeries §8.4a owns the Fourier expansion at a cusp with general parabolic monodromy”; :728 imports that section | **Repaired.** The independently owned §7.4 is gone; §§7.8 and 8.5 and both layer dependencies import the supplier. Its holomorphic semisimple specialization gives multiplier `i` for `μ=1/4` and multiplier `2` for `μ=−i log(2)/(2π)`. R02 concerns a new explanatory sentence, not the ownership repair. |

The repaired holonomy paragraph, its new Check, the supplier contract at :71, the revised Wronskian proof at :726, the new examples at :791–793 and all changed dependency lines were read and tested. The three displayed Fourier examples themselves have the advertised coefficients/eigenvalues: the error is the general introductory sentence identified in R02. Searched the rest of the package for the repaired patterns. R01 is another apparent-singularity overclaim; §§2.5, 3.4, 7.1 and 7.8 otherwise preserve the meromorphic-basis distinction. There is no remaining independently owned generalized-expansion theorem in the README or Lean file. No finding re-raises an item marked not actionable in the last repair report.

### Coverage, principles and shape

Read all 63 numbered targets, their 63 Needs lines, nine layer dependency paragraphs, APIs, conventions, examples, metadata and source manifest. The 12 definition/API Check blocks have respectively `5,5,4,4,4,4,5,4,4,4,4,5` bullets, 52 total. All nine layers end with Examples and Dependencies. The complete working ledger contains computed instances for all 63 targets; the compact table below covers the seeded sample, headline theorems, repairs and findings. Unchanged text was inherited only where the previous review supplied a row with actual values. Unsampled targets without such a row were reviewed anew; all sampled and changed targets were reviewed anew.

The roadmap extends the congruence theory of ModularForms. It does not replan that roadmap, restrict to good primes, prescribe computational algorithms, introduce sorry'd data, or use a `set_option`. No copied source passage, forbidden supplier, process narrative, HTML anchor or machine path was found in the package text. The nine layer names are mathematical. The modular holonomy and arithmetic-group branches feed leveraging and UDC; applications then consume UDC. This dependency order is not the source's chapter order. ModularForms, FuchsianOrbifolds and Completed/ConformalMapping were read on main for scope and house shape.

The source table and mathematical tests support the unchanged conclusions, subject to the three declared supplier contracts and the unavailable Ihara proof specified below. Findings R01–R03 are the exceptions to the otherwise consistent proof and documentation checks.

### Seeded source verification

All 15 seeded targets were checked against the legal cached CDT author's offprint. Its extraction page n has printed journal page `n+626`. KSV arXiv v4 was also reopened for the signed-level proof. No additional locator is flagged unverified. The three directly cited works have exactly one manifest key each. No new source was needed, no manifest entry was changed, and Ihara1994 was not requested again.

| Target | Locator and source evidence | Hypotheses and outcome |
|---|---|---|
| 1.1 weak forms | CDT Theorem 1.0.1, p.627, CDT25 line 25; Definition 7.4.3, p.692, CDT25 line 3898 | Finite index, integral weight, holomorphy and cusp meromorphy are present. The exponential-growth equivalence is proved through FuchsianOrbifolds Layer 3 item 5, rather than attributed to the UDC theorem itself. |
| 2.1 λ | CDT (1.0.2), p.628, CDT25 line 59; (1.1.5), p.631, CDT25 line 259 | The η quotient, factor16 and `q=exp(πiτ)` agree. Transformations and the theta description are derived from the named η/theta inputs. |
| 2.3 level-two ring | CDT §4.2, p.655, CDT25 line 1734 and line 1743 | Source states the rational ring; the complex version and rational descent follow from the supplied degree-one `X(2)` identification and inverse parameter. |
| 2.6 Jacobi identity | CDT (1.1.4)–(1.1.5), p.631, CDT25 line 246; (7.2.4), p.688, CDT25 line 3636 | Identity and nontrivial unipotent example agree. The roadmap correctly retains `χ₋₄(d)`; the source's unqualified odd-weight Γ(2) wording needs that character. |
| 3.2 R₂N | CDT Definition 4.2.1(2), p.655, CDT25 line 1738; Proposition 3.0.1, p.650, CDT25 line 1420 | Same rational bounded-denominator generators and all-cusp width divisibility. Laurent generators versus pole-cleared generators give the same scalar span. |
| 3.4 holonomy | CDT Proposition 3.0.1 proof, pp.650–651, CDT25 line 1428; local-basis convention, p.636, CDT25 line 479 | Full meromorphic bases, rather than absence of scalar singularities, are the source's condition. Revised text is correct; W instead of V agrees with the corrected supplier. |
| 4.1 nonabelian Ihara | CDT Lemma 4.4.1, pp.658–659, CDT25 line 1903 and line 1923 | Source has the signed group contained in ±Γ(N). The roadmap's more general unsigned formulation has a proof using its stronger conjugate-containment hypothesis, principal amalgam, CSP and signed Wohlfahrt. R03 corrects only its gloss. |
| 5.4 congruence degree | CDT (4.3.3), p.657, CDT25 line 1832 | Source explicitly requires N>1. Projective factor1/2 and the separate N=1 value agree. |
| 6.2 weight reduction | CDT reduction after (1.0.2), p.628, CDT25 line 61 | Same factor `λ/(16η(τ/2)²)`; exponent11/12 in q gives period24. Positive and negative weight shifts use integral inverse units. |
| 7.1 three-point algebraicity | CDT Theorem 7.2.1 and footnote4, pp.687–688, CDT25 line 3588 and line 3607; Definition 2.0.4, CDT25 line 479 | Apparent singularities are explicitly allowed. Full meromorphic bases after a finite ramified pullback exclude irregular essential singularities with trivial topological monodromy. |
| 7.5 scalar induction | CDT Remark 7.3.2, p.689, CDT25 line 3709 | Finite-index scalar forms become components of the coset representation. Even weight and −I in the subgroup match the projective representation used here. |
| 7.12 Mason on value span | CDT Corollary 7.3.4, p.691, CDT25 line 3820 | The source overstates the whole-kernel conclusion. The roadmap's effective-span conclusion and explicit invisible-summand counterexample correct it. |
| 8.1 weak quasimodular forms | CDT Definition 7.4.3 and Lemma 7.4.4, pp.692–693, CDT25 line 3891 | Localization at Δ and adjoining E₂ agree. Extending from projective subgroups to arbitrary finite-index SL₂ subgroups uses the supplied native graded ring and Serre derivative, with parity retained. |
| 8.5 deficient places | CDT §7.4.8, pp.694–695, CDT25 line 4055 | Source uses K=ℚ. The placewise number-field version retains the usual complex modulus. Source exponent `(k−1+ε)/2` and roadmap exponent `(k−1)/2+ε` give the same existential test. |
| 9.1 cuspidal model | CDT Theorem 7.4.10, p.696, CDT25 line 4118 | Minimal regular model, smooth cuspidal component and all-prime base agree. Genus-zero nonuniqueness is explicitly handled; the supplier gap retains the model and cusp-section hypotheses. |

### Computed adversarial table

An I marks an unchanged result whose computed evidence is inherited from the previous review. Other rows were recomputed or checked directly this round. These are discriminating instances alongside source and proof-route review, not claims that finite tests prove the theorems.

| Statement | Instances | Values computed on the two sides | Result / change |
|---|---|---|---|
| §1.1, IsWeakForm | 1, Δ⁻¹, exp(j), −I | Growth exponents0 and2π suffice for1 andΔ⁻¹; exp(j) grows doubly exponentially; odd slash is−f | Poles allowed, essential growth excluded |
| §§1.3,1.8; R03 | `G=ker χ`, χ the η² character | χ(T⁶)=−1 versus required1; signed width6 versus strict12; χ(S)²=(χ(S)χ(T))³=−1 | Correct README signs; repair docstring |
| §§2.1–2.2, λ headline | i,Ti,−I; q through q⁶ | λ(i)=1/2, λ(Ti)=−1; −I fixes every τ; x coefficients1,−8,44,−192,718,−2400 | Cover orbit and factor16 conventions agree |
| §2.3 | λ⁻¹, (λ−1/2)⁻¹, √2 | Leading coefficient1/16; second has pole at i; constant√2 is irrational | Ring versus field and rational subring distinguished |
| §§2.4–2.6 | Inverse series, N3, hypergeometric series | Inverse1,8,84,992,12514,164688; composition x; x₃³=t³−8t⁶+44t⁹; K₀(x(q))=θ₃² has coefficients1,4,4,0,4,8; recurrence at n1 gives144=144 | Integral inverse, Kummer denominator and Jacobi identity hold |
| §2.6 character | −I, logarithmic solution | χ₋₄(−1)=−1; `(I+B)^N=I+NB≠I` for B²=0≠B | Odd character and infinite monodromy essential |
| §3.2 | 1/2; scalar-span inverse | D2 clears1/2; (λ−1/2)⁻¹ has an interior pole but belongs to Q(λ) | Span not confused with holomorphic generators |
| §3.4, previous F01 | N1,f=λ−1/2; N2,f=λ | `L=∂−1/(u−1/32)`, residual16−16=0; for second `L=∂−2/u`, basis16u² | Apparent poles now allowed, full bases retained |
| §§3.5,3.8, rank headline | N2,r=.95,A1; N1 | rγ₂/4=1.0395088>1; log((1+1/8)(1−1/16))=.0532445≥1/24=.0416667; log2=.693147 while log1=0 | Strict radius and uniform small-level bound |
| §4.1, Ihara headline | N3,p2; S trivial | Conjugation sends lower entry6 to3; SL₂(F₂) size6,B size2,index3; pair(1,1) lifted byI | Correct target and small-prime case |
| §4.2 | Nonabelian B(F₅) | Size20; diag(2,3)U(1)diag(3,2)=U(4)≠U(1) | Only B/U, not B, is treated as abelian |
| §§5.1,5.4 | N1,2,3,4 | Degrees1,4,12,32; respective lower bounds.40528,3.24228,10.94269,25.93822; generic formula at N1 gives1/2 | Correct X(2N), signs and N1 exception |
| §5.3, degree-doubling headline (I) | Old relative degree2 | Tower product at least2·2=4 at new prime | Conditional doubling consistent |
| §§5.5,6.1, equality headline (I) | N1; k new primes | Both fields Q(λ), degree1; log(2^k)=klog2, k≫X/logX, versus log O(X)=O(logX) | Fixed-C growth contradiction |
| §6.2 | h₀ and inverse | h₀=q^(11/12)(1−6q+33q²−134q³+…); inverse unit1+6q+3q²−46q³+…; product1+0q+0q²+0q³ | Both integral after period24 |
| §6.3, UDC headline (I) | f1,0; h→2h | Coefficients(1,0,…) or0; Γ(1) works; index n becomes2n | Periodicity and boundedness remain explicit |
| §6.6, algebraic-integer headline (I) | K=Q(√2) | Trace matrixdiag(2,4), determinant8; traces of m+n√2 are2m,4n | Reconstruction coefficients1/2,√2/4 |
| §6.9 | n8,16,3 | 2-valuations for n8:1,1,2,1,2,2,3,1,2; n16:0,−1,−1,−3,−3,−4,−4,−7,−7; 3-valuations for n3:−1,−2,−4 | Fermat exponent controls agree |
| §§7.3,7.5 | Index1; Γ₀(4); zero rank | Index1 gives F=f,ρ(T)=1; Γ₀(4) widths1,4,1 give a4-cycle and eigenvaluei; n0 gives empty vector | Induction and semisimplicity agree |
| QSeries import and R02 | η⁴; e of modulus≠1; irrational unit e | η⁴ unit1,−4,2,8,−5; μ1/6 gives exp(πi/3); μ=−.26216498i gives5.1925824; μ=√2−1 real gives modulus1 and infinite order | Import sound; repair new introductory sentence |
| §7.1, three-point headline | f=(1−16x)⁻¹; K₀ | L=(1−16x)∂−16 gives Lf0, monodromyI; K₀ has I+B with `(I+B)^N≠I` | Finite local-basis premise discriminates |
| §7.2 | f=(1−32x)⁻¹ | Pullback(1−2λ)⁻¹ has pole at i; multiplying by1−2λ gives1 | Meromorphic conclusion needed for apparent poles |
| §§7.7–7.9 | W0,span1,span{1,x}; f1 | Wronskian operators1,∂,∂²; on1,x,x² values1,1,2; companion0 has divided iteratesB₀1,B_m0 | Monicity, zero order and arithmetic descent consistent |
| §7.11, component headline; R01 | Induced f=λ−√2 | Minimal coefficients−16/(16x−√2) and−16/(16x+√2); poles±√2/16; residual0; traces32x,−4 | The conclusion survives; singular-set claim does not |
| §§7.12–7.13, Mason headline | F=(1,0,0),ρ1⊕σ | R³=I; T trace5,det−1,eigenvalues5.1925824,−.1925824; value rank1 fixed | Effective conclusion correct, whole-kernel conclusion false |
| §7.14 (I) | θ₃² at cusp1; Δ | B=[[-3,−2],[2,1]], trace−2,det1; B²=[[5,4],[−4,−3]]≠I; Δ order13 | Repaired odd sign and monodromy retained |
| §§8.1–8.2 | Δ⁻¹,E₂,1 | Weights/depths(−12,0),(2,1),(0,0); θ_qΔ=2q²−96q⁴ versus E₂Δ=q²−48q⁴ | Weak localization and derivative factor2 |
| §§8.3–8.4 | Second-kind and Catalan series | E₀ coefficients1,−4,20,−64,164,−392 after x(q); Catalan quotient1,1,−4,5,12,−42; corrected integral residual0 through x¹³ | Sign and inhomogeneous weights consistent |
| §8.5 | a_m=2^−m; zero insertion | abs₂(a_m)=2^m; index m→2m multiplies archimedean ratio by2^−((k−1)/2+ε) | Deficiency unchanged by period refinement |
| §§8.6–8.7 (I) | Δ at p2,3; invisible σ | Coefficients−24,252 satisfy bounds90.5097,841.7767; σ eigenvalues have moduli5.19258,.19258 so σ(T)^(2N)−I invertible | Congruence bounds and witness requirement retained |
| §9.1 | N3–7; cusp blowup | Genera0,0,0,1,3; C²=E²=−1,C·E=1; kept fibreA¹ insteadP¹ | Minimality is substantive |
| §§9.2–9.3, arithmetic headline (I) | N1; split covers; section | Geometricπ₁(P¹)=1; split degree-d cover is base pullback of d copies; π_*ε_*=id | Consistent small-level/category tests; Ihara route uncertified |

### Lean, signatures, headlines and padding

Ran `lake env lean` on `packages/ModularFormsPartII/Suggested.lean` from the pinned content checkout: exit 0, exactly six warnings, all `declaration uses sorry`, at lines 71,85,104,116,147,162. The only import is `import Mathlib`; no Tau Ceti module build was needed. An initial scratch invocation from the board directory found no toolchain; it was rerun from the required content checkout successfully.

A separate scratch file appended `#check @name` for all nine declarations and elaborated successfully. All nine signatures retain their intended explicit binders. In particular, the UDC theorems retain finite index, positive period, periodicity, boundedness and actual qExpansion coefficients; the vector theorems retain `IsVectorValuedForm`, nonzero rescaling and positive periods; Ihara retains normality, finite index, N≥3, p prime, p∤N, the unsigned containment and the exact rational-matrix formula for c. The README agrees with the actual types. R03 concerns the docstring's inaccurate equivalence, not a lost binder.

All six sorried theorems were independently probed with closing alternatives `simp`, `rfl` and `infer_instance` on a scratch copy. None closed: six expected errors, one per theorem. Read the library near-match leads and the relevant pinned declarations; none gives a one-lemma `exact` proof. In particular, `IsQuotientCoveringMap.apply_eq_iff_mem_orbit` assumes an established quotient covering and cannot establish this λ covering. No kept theorem is a definition restatement, a boundary case, a computed Check or a small API fact.

| README headline | Acceptance declaration or explicit missing carrier |
|---|---|
| λ covering, §2.2 | `modularLambda_covering` |
| Nonabelian Ihara, §4.1 | `nonabelian_ihara`; documentation correction R03 |
| Integral UDC, §6.3 | `unbounded_denominators` |
| Algebraic-integer UDC, §6.6 | `algebraicInteger_unbounded_denominators` |
| Integral component, §7.11 | `vectorValued_component_congruence` |
| Effective-span Mason, §7.12 | `vectorValued_effective_mason` |
| Holonomy rank, degree doubling, R₂N=M₂N, §§3.8,5.3,6.1 | Named in module docstring: missing weak-form Laurent cusp embedding and integral holonomic ring. Native qExpansion is a Taylor PowerSeries. |
| Three-point algebraicity/congruence, §§7.1–7.2 | Named in module docstring: missing solution continuation, local monodromy and full meromorphic-basis interfaces. |
| Arithmetic fundamental group, §9.3 (and finite-cover criterion §9.2) | Named in module docstring: missing minimal regular modular model and cusp section. |
| Differential closure and deficient-place applications, §§8.2,8.6–8.7 | Subsidiary consequences of supplied derivative, denominator and Ramanujan inputs, not additional deep acceptance declarations. Small derivative identities would be padding. |

All nine own Lean identifiers appear in the README; every backticked identifier attributed to this roadmap resolves to one of them. No statable deep headline was found replaced by a stand-in or absent. There are three real-bodied definitions and six theorem statements, no admitted examples, opaque data or free condition fields.

### Pinned declaration audit

Pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Opened the following declarations at those pins. Paths in this table are library-relative; abbreviated filenames in a row share its displayed directory.

| File | Declarations and relevant contract |
|---|---|
| `Mathlib/NumberTheory/ModularForms/Basic.lean` | `ModularForm` :78, `CuspForm` :86, `instGCommRing` :561. Holomorphy plus boundedness/vanishing at cusps; no weak finite-principal-part field. Graded ring requires `HasDetPlusMinusOne`. |
| `Mathlib/NumberTheory/ModularForms/SlashInvariantForms.lean` | `SlashInvariantForm` :36, invariance field :42; does not include holomorphy or growth. |
| `Mathlib/NumberTheory/ModularForms/SlashActions.lean` | `SL_slash` :171, formula :174; inverse weight factor and left matrix action. |
| `Mathlib/NumberTheory/ModularForms/BoundedAtCusp.lean` | `OnePoint.IsBoundedAt` :53 quantifies over scaling matrices. |
| `Mathlib/Analysis/Complex/UpperHalfPlane/FunctionsBoundedAtInfty.lean` | `atImInfty` :30, `IsBoundedAtImInfty` :45; the imaginary-part filter, not a chosen ray. |
| `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean` | `Gamma` :42, `Gamma_normal` :55, `Gamma0` :80, `Gamma1` :132, `IsCongruenceSubgroup` :164; positive level, no automatic −I. |
| `Mathlib/NumberTheory/ModularForms/ArithmeticSubgroups.lean` | SL-image `HasDetOne` :58, `HasDetPlusMinusOne` :66, `IsArithmetic` :126, `isArithmetic_iff_finiteIndex` :132. |
| `Mathlib/NumberTheory/ModularForms/QExpansion.lean` | `cuspFunction` :89, comparison :93, `qExpansion` :172. The latter is the sequence of Taylor derivatives; the theorem hypotheses are needed to identify the Fourier germ. |
| `Mathlib/NumberTheory/ModularForms/DedekindEta.lean` | `eta` :57, `eta_ne_zero` :114, `logDeriv_eta_eq_E2` :166; nonzero on ℍ and factorπi/12. |
| `Mathlib/NumberTheory/ModularForms/Discriminant.lean` | `discriminant` :50, `discriminant_ne_zero` :123, coefficient-one :212, `CuspForm.discriminant` :237. |
| `Mathlib/NumberTheory/ModularForms/JacobiTheta/OneVariable.lean` | `jacobiTheta` :29, T² law :37, S law :43; q=exp(πiτ). |
| `Mathlib/NumberTheory/ModularForms/JacobiTheta/TwoVariable.lean` | `jacobiTheta₂` :252, functional equation :466; the two-variable function is not identified with the classical theta₂ constant. |
| `Mathlib/NumberTheory/ModularForms/EisensteinSeries/E2/Defs.lean` | `EisensteinSeries.E2` :61. |
| `Mathlib/NumberTheory/ModularForms/Derivative.lean` | `normalizedDerivOfComplex` :39, `serreDerivative` :127, `serreDerivativeMF` :304; its subgroup-containment hypothesis is satisfied here. |
| `Mathlib/NumberTheory/ModularForms/RamanujanFormula.lean` | `normalizedDerivOfComplex_E₂` :122 gives `(E₂²−E₄)/12`. |
| `Mathlib/Algebra/Group/Subgroup/Basic.lean`; `Mathlib/GroupTheory/Goursat.lean` | `normalCore` :724; `goursat_surjective` :107 with surjective projections. |
| `Mathlib/NumberTheory/Chebyshev.lean` | `theta_le_log4_mul_x` :191, `theta_ge` :531, `pi_ge` :842; nonnegative/large arguments used in the asymptotic application. |
| `Mathlib/Topology/Covering/Basic.lean`; `Mathlib/Topology/Covering/Quotient.lean` | `IsCoveringMapOn` :197; `IsQuotientCoveringMap` :38 and orbit field :40. Range equality is separately retained in the λ theorem. |
| `Mathlib/Analysis/Meromorphic/Basic.lean`; `Mathlib/LinearAlgebra/Semisimple.lean` | `MeromorphicAt` :36 cancels a pole by a power; `Module.End.IsSemisimple` :56 is semisimplicity of the induced polynomial-module action. |
| `Mathlib/NumberTheory/NumberField/Basic.lean`; `Mathlib/RingTheory/IntegralClosure/IsIntegral/Defs.lean` | `RingOfIntegers` :102, `IsIntegral` :53. Neither assumes all coefficients belong to one number field; §6.5 supplies that conclusion. |
| `TauCeti/NumberTheory/ModularForms/Cusps/Basic.lean` | `integerCuspWidth` :170, positivity :176; strict width, with finite relative index needed for positivity. |
| `TauCeti/NumberTheory/ModularForms/CongruenceSubgroups/Basic.lean` | `Gamma_le_Gamma_of_dvd` :177, direction `M∣N ⇒ Γ(N)≤Γ(M)`. |
| `TauCeti/NumberTheory/ModularForms/Parity.lean` | `char_neg_one_of_modFormCharSpace_ne_bot` :136, `χ(−1)=(−1)^k`. |

Object searches in both pinned modular-form trees found no existing UDC, λ covering or nonabelian Ihara theorem. Scalar modular forms, slash invariance, theta functions and the graded ring are consumed, not rebuilt.

### Cross-roadmap resolution, duplication and supplier order

The citation resolver reported no cross-roadmap citation or Lean name found nowhere. It explicitly did not inspect local pinned libraries; the separate audit above did. Its refreshed main index differed from the prepared overlap snapshot, so main suppliers were also checked in the supplied content checkout. The following are the resolved contracts, with repository-relative file locations. Line numbers for open roadmaps refer to their displayed head files, excluding the tool's added provenance header.

| Supplier file | Resolved sections and ownership |
|---|---|
| `TauCetiRoadmap/ModularForms/README.md` | Main :330–349 maps former Layers0,4 and Worked examples; former η²⁴ target maps to §0.2 at :395. Layer4, character/newform inputs and Layer10 remain resolved through that mapping. Thus the changed Worked examples are not supplier drift. |
| `TauCetiRoadmap/FuchsianOrbifolds/README.md` | Main Layer2 item5 :526 refers to presentation item3; Layer3 :563 supplies cusp/growth criteria; Layers4–5 :604,:659 supply compactification and degrees; Layer6 :902 supplies X(1),j. |
| `Completed/UniversalCovers/README.md` | Main Stage2 :100–124, lifting, subgroups, covers and deck groups. All spaces used here are nonempty, connected and locally path-connected. |
| `Completed/ConformalMapping/README.md` | Main :238–259, continuation/reflection inputs; λ ownership boundary :89. |
| `TauCetiRoadmap/BelyiMaps/README.md` | Main Layer6 :2268, classification :2473; Layer9 meromorphic field :3495, degree :3581, algebraization :3694. λ explicitly excluded at :5606. |
| `TauCetiRoadmap/ConformalMappingPartII/README.md` | Main §§0.3 :191,0.5 :203,1.4 :319,1.8 :367,5.1 :698,5.5 :734,5.8 :752,9.19 :1168. N≥2 for roots covers and Gamma radii; full local meromorphic bases allow apparent singularities. |
| `TauCetiRoadmap/ModularCurvesPartII/README.md` | PR #913: §§5.13 :1904,5.14 :1936,6.3 :2168,6.4 :2190,6.5 :2212,8.1 :2434,11.4 :3036; §§15.2 :3892,15.3 :3914,15.5 :3954,15.6 :3986,15.9 :4048,15.10 :4070. The unsigned N≥3 amalgam and enhanced character theorem retain p=2 and coefficient primes2,3. |
| `TauCetiRoadmap/DiophantineApproximationAndTranscendencePartII/README.md` | PR #1693: §§4.1 :641,4.2 :687,4.3 :709,4.4 :745,4.5 :761,4.6 :777,4.7 :793,4.8 :809. W is the correct scalar span, and apparent poles are permitted by the full-basis condition. |
| `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/README.md` | PR #928: §1.5 :226 all-weight comparison; §2.9 :412 all-prime denominator bound, including Laurent modular functions. |
| `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/README.md` | PR #1391: §5.2 :824 multiplier; §8.1 :1169 carrier; §8.4a :1260 general parabolic expansion. New import agrees with the holomorphic semisimple specialization; no unitarity assumption. |
| `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md` | PR #851: §4.3, triple-product target :1605 and analytic products :1607. General triple product is explicitly included. |
| `TauCetiRoadmap/AutomorphicGaloisRepresentations/README.md` | PR #1007: §4.2 :2503, temperedness at every finite place and every complex embedding; classical normalization w=k−2. |
| `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md` | Main §5.2 :3012, G-function definition :3028; §5.3 :3078 and independent companion-system input :3110. Bombieri–André/Katz is a separate declared gap. |
| `TauCetiRoadmap/EtaleCohomologyFoundations/README.md` | Main §F.0.2 :200, pointed finite étale Galois category of a connected nonempty scheme. |

Ran the prescribed dependency check without changing the order:

```
depcheck: 236 roadmaps, 2145 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Read every Needs line and supplier citation. The three gap slugs and needs agree in `packages/ModularFormsPartII/README.md:81`, :83, :105 and `packages/ModularFormsPartII/design/plan.json:3442`, :3448, :3454. Each is precise and has a named owner: a rational split cusp on the symplectic twist, an all-prime minimal full-level model with smooth cusp section, and the global-nilpotence/local-monodromy chain. The fixed-pairing cyclotomic cusp does not already give the first; the Γ₀ model for p>3 does not give the second; Chudnovsky alone does not give the third. No new unowned prerequisite was found.

Read the board package index before making ownership claims. The available board heads for `packages/AnalyticNumberTheory/README.md` (PR #123, head310e834) and `packages/LogicAndDefinabilityInNumberTheory/README.md` (PR #164, head8d875d1) were read and searched by object; they supply a navigation index and logic/valued-field/integration/counting theory, respectively, not competing targets here. The unavailable third board head is recorded below.

Used `roadmaps grep` across main and open heads for λ, weak forms, geometric level, UDC, quasimodular forms and parabolic expansions. Main `TauCetiRoadmap/NoncongruenceModularForms/README.md:300–308` imports this package's signed-level and UDC results; it does not own them independently. Closest-roadmap scopes were compared: PR #1721, `TauCetiRoadmap/HalfIntegralWeightModularForms/README.md:38–70`, owns half-integral holomorphic forms and Shimura theory; PR #1714, `TauCetiRoadmap/SiegelModularForms/README.md:31–64`, owns higher-genus forms. Their general theta/multiplier inputs do not duplicate this λ holonomy/UDC extension. QSeries owns the general carrier and expansions, DAT-PartII the general holonomic ring/rank estimate, and ModularCurvesPartII the model and cohomological Ihara inputs. This package owns the modular specialization and nonabelian quotient argument.

The prepared overlap facts contain no conflicting head, dropped cited id, or id defined only by an unmentioned open revision. The live overlap query reports that this unported package is not a roadmap on main or in an open roadmap pull request; this is not a package defect. The closest heads were independently read as above. No fully qualified declaration duplicates another readable roadmap's declaration.

## Not verifiable

- Ihara1994, Theorem1, pp.248–249, and §4, p.252: settled `uncertified` in the manifest. Its text was unavailable; no repeated request was made. CDT25 supplies the theorem and a short sketch, but not the full formal-rationality proof used in §9.2.
- The three declared supplier gaps are future contracts. Their ownership, scope and matching declarations were checked; their completed proofs are not claimed to exist at the pins.
- `packages/LawrenceVenkateshMethod/README.md` at board PR #345, head9ee7ac3: the supplied contents endpoint returned HTTP404. Ownership against that unread file is not certified.

## Source issues

These issues were re-encountered in the source passages read this round. The package already corrects them; R01–R03 are package defects, not additional source errors.

- **Misprint** in KSV10 at §3 after equation (1), arXiv v4 p.6: the source orders the conjugating factors as T′ then T′⁻¹; it should use T′⁻¹ then T′, producing [[2,1],[−1,0]] at a=2; affects nothing.
- **Error** in CDT25 at Corollary 2.0.5, (2.0.7), printed p.636: the source bounds V over ℚ(p) without a scalar-extension factor; it should bound W, or include [ℚ(x):ℚ(p)] for V; affects a stated result.
- **Misprint** in CDT25 at Proposition 3.0.1, printed p.650: the source states CN³ log N uniformly; it should require N≥2 or use log(2N), since the rank at N=1 is positive; affects nothing.
- **Gap** in CDT25 at Lemma 4.2.3, proof, printed p.656: the source's core-of-stabilizers construction asserts exact level; it should intersect with the signed principal group to fix λ and force that level; affects the proof.
- **Misprint** in CDT25 at Theorem 4.3.2, proof, printed p.656: the source selects the separating function at the enlarged level; it should select a noncongruence generator at the old level before p-scaling; affects nothing.
- **Gap** in CDT25 at Theorem 4.3.2, proof, printed p.657: the source obtains the compositum degree from the intersection alone; it should justify linear disjointness using the complex Galois extension; affects the proof.
- **Error** in CDT25 at §4.4 before Lemma 4.4.1, printed p.658: the source says A-conjugation preserves the Γ₀(p) intersection; it should land in the ambient principal group with upper-right divisibility; affects the proof.
- **Error** in CDT25 at §4.4 before Lemma 4.4.4, printed p.659: the source gives Γ(Np) as the signed-domain reduction kernel; it should use the unsigned domain or retain the additional signed classes; affects the proof.
- **Misprint** in CDT25 at (7.2.4), printed p.688: the source describes θ₃² as weight one on Γ(2) without its character; it should retain χ₋₄(d), whose value on −I is −1; affects nothing.
- **Gap** in CDT25 at Theorem 7.3.3, proof, printed pp.690–691: the source assigns rank6n and reduces to an irreducible continuation system without justification; it should use the actual continuation span and justify arithmetic descent without irreducibility; affects the proof.
- **Error** in CDT25 at Corollary 7.3.4, printed p.691: the source concludes congruence of the whole representation kernel from integral components; it should require spanning values or conclude on their span; affects a stated result.
- **Misprint** in CDT25 at Lemma 7.4.4, proof, printed p.692: the source combines θ=(1/πi)d/dτ with θΔ=E₂Δ; it should read θΔ=2E₂Δ; affects nothing.
- **Misprint** in CDT25 at §7.4.2, printed p.693: the source's second-kind integral expression has constant term −1; it should be (1−16x)K₀+8∫₀ˣK₀, with constant term1; affects nothing.
- **Error** in CDT25 at the theta-monomial paragraph, printed p.693: the source permits Γ(12) for every even-total-degree theta monomial; it should kill each multiplier, since θ₂θ₃ changes sign under T¹²; affects the proof.
- **Error** in CDT25 at §7.4.8, printed p.695: the source infers a finite deficient place from noncongruence of the representation kernel alone; it should require an arithmetic component witness, excluding invisible infinite-image summands; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "d0236cc7cc9d900eb8c388fddcdab8d64b652bc8", "job": "REV-PKG-ModularFormsPartII~4", "model": "gpt-6-astra", "worker": "chris-4"} -->
