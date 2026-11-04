<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1467#issuecomment-6398631489 -->
Review (codex) of 788c4da

Verdict: accepted
Conditional on the announced gaps: `complex-logarithmic-equilibrium`

1. **F01** (P3) Import the existing C¹ variation identity

   **Location:** `packages/DiophantineApproximationAndTranscendencePartII/README.md:523`, and its proof route at line 525: “The real C¹ variation identity follows from the FTC upper bound on partition sums and approximation of the integral of |g′| by fine partitions”.

   **Claim:** The derivative-integral identity is presented as a calculus result to establish here. Its generic content is already supplied at the Tau Ceti pin; only its circular-coordinate use and the positive-log application belong here.

   **Witness:** `TauCeti/Analysis/Calculus/MetricVariation.lean:276`, `TauCeti.eVariationOn_eq_lintegral_enorm_derivWithin`, proves precisely the native variation identity for a C¹ curve on a closed interval in a complete real normed space; ℝ meets its hypotheses.

   **Exact repair:** Remove the generic C¹ identity as a new theorem and remove its FTC proof construction. Add the native declaration and file to Scope and ownership and From Tau Ceti, and cite it in §3.5's `Needs`. Retain the positive-log bounded-variation theorem and the angular normalization Checks. Explain the specialization to t↦g(exp(2πit)), [0,1], followed by conversion of the finite nonnegative integral to ℝ. The two endpoints have measure zero; the within derivative agrees with the ordinary derivative on the interior. No new acceptance-test declaration is needed.

   **Repair test:** For g(z)=Re z, the angular function is cos(2πt), its derivative is −2π sin(2πt), and both native variation and the derivative-norm integral equal 4. For g constant both are 0. For h=1−z, the retained positive-log statement has variation 2 log 2 and value 0 at z=1. Thus importing the generic identity preserves all three normalization and boundary tests.

One new P3 finding; no new P1 or P2 findings. Acceptance is conditional on `gap:complex-logarithmic-equilibrium`. The previous G1 and frozen-plan findings remain unresolved but are settled for this package review by the brief's explicit rule for justified “not actionable in this package” dispositions. This verdict does not certify a general compact-set theorem or record a maintainer scope decision.

## Verified sound

### Previous findings, checked first

The previous review file contains two reviews: ten Claude findings and three Codex findings, with common G1 and descent findings. I reconciled all eleven distinct issues. Current passages below are quotations from the authored package, not source passages. Deletions were checked against all six remaining declarations and all README declaration claims.

| Previous finding | Disposition | Current evidence and independent repair check |
|---|---|---|
| Both F01: unowned G1 | **Partly repaired; settled outside package fixes** | README line 71 now says “The arbitrary-compact replacement obligation DiophantineApproximationAndTranscendencePartII/G1 has no assigned supplier.” The obligation itself remains in `design/plan.json:2020`. The frozen design expressly requires a general replacement or a maintainer scope decision; no such decision is supplied. The repair worker correctly declined to invent that decision. The centred result and counterexample have no G1 prerequisite. |
| Claude F02: multiplier acceptance declarations | **Repaired** | The multiplier definition and theorem are absent from Suggested.lean. README line 311 retains “every holomorphic h near the closed unit disc with h(0)=1 satisfies m≤e A/logλ”. With g=2z, h=1−2z, A=log 6 while J=log 2; the retained headline gives 1≤e. |
| Claude F03: Layer 3 acceptance declarations | **Repaired** | The three discrepancy/Fekete declarations and their empty Lean layer comment are absent. README line 611 retains “The Vandermonde-damped coefficient bounds yield the same rank bound m≤eJ(g)/logλ as §2.1”. Their supporting mathematics remains in §§3.1,3.6,3.8. No retained Lean statement mentions the deleted names. |
| Claude F04: Eisenstein acceptance declaration | **Repaired** | The declaration is absent. README line 191 retains “There exist positive rational integers c,M such that c M^n a_n is an algebraic integer for every n≥0.” The scalar is still necessary for f=1/2; c=2,M=1 works. The proof and Puiseux statement remain. |
| Claude F05: André acceptance declaration | **Repaired** | The specialized declaration is absent. README line 369 retains “Then f is algebraic over ℚ(x).” The open-disc consequence follows from the retained arithmetic theorem using p=x, χ=t and 1/λ<r<1. At λ=2,r=3/4, the new derivative modulus is 3/2. |
| Claude F06 and Codex F02: descent attribution | **Repaired** | README line 47 now promises “sum and product closure and complex initial-value existence and uniqueness”; line 657 says “This coefficient descent is a target here.” Expanding an algebraic annihilator in a number-field basis makes each component annihilate rational f; a nonzero leading component preserves order and degree bound. For √2((1−x)∂−1) and f=(1−x)⁻¹, its rational component is (1−x)∂−1. |
| Claude F07: native formal inverse | **Repaired** | README lines 29,223,811 cite `PowerSeries.substInv`, `PowerSeries.subst_substInv_right` and `PowerSeries.subst_substInv_left`. Their pinned locations are 456,510,542. For p=x+x⁴/32, inverse coefficients −1/32 and 1/256 become −2 and 16 at tangent scale 4. Both compositions have zero coefficients in degrees 4 and 7. |
| Claude F08: missing carrier for centred theorem | **Repaired** | Suggested.lean lines 13–14: “The centred capacity rank theorem bounds the same span W and lacks the same carrier.” The radius-r numerator is expressible with native circle average; the missing carrier is the holonomic span, not the elementary capacity value r. |
| Claude F09: repeated prose | **Repaired** | The listed repetitions and the additional repetitions recorded by the repair report have been consolidated. README line 599 retains the single explanation “The derivative exponent is β, not β+M·binomial(d,2)”. With H=2(z₁−z₂)² the selected coefficient is 2, not 4. The modular benchmark now computes −32+36=4 in Worked examples. |
| Claude F10: frozen plan edges | **Not repaired; settled outside package fixes** | Eight old prerequisite strings remain at `design/plan.json:1273`,1909,1953 and their following lines, plus the supplier string at 2115. The README instead names “ClassicalArithmeticCompletion §§6.18–6.19,6.40” at line 9 and declares its energy extension at line 67. The brief freezes plan nodes; this repair disposition is correct. No new claim of worldwide absence is made. |
| Codex F03: substitution locator | **Repaired** | README line 29 now gives “lines 157 and 170”. At the pin these are the actual definitions of `PowerSeries.subst` and `PowerSeries.substAlgHom`. Inner-first substitution of χ=t/2 into f=x² gives t²/4; reversed arguments would give t²/2. |

The unchanged portions were compared with the previous Codex review's 108-row computed table, not merely its prose assessment. Those rows have actual coefficient, dimension, discrepancy, norm or integral values for all 35 numbered sections and their 40 API assertions. The present pass independently revisited every seeded target, every mathematical repair, the deleted-but-retained README targets, the headline families and every supplier citation. The new native-variation finding came from an independent object search despite the previous clean duplication assessment.

### Principles, shape and source access

Read all four authored files and the relevant gap metadata. There are 35 numbered mathematical sections, 35 `Needs` lines and six layers, each with Examples and Dependencies. Six definition-bearing subsections retain APIs, totalling 40 bullets, and at least three discriminating Checks per subsection; the four Lean definitions have positive and negative examples. The package builds on Part I §5.1 and explicitly excludes modular geometry and modularity. Its proofs cover nonconstant rational coordinates with ramification, including p=x². No good-prime restriction, route-specific arithmetic shortcut, computational algorithm, copied source passage, sorry-valued data, forbidden import, `set_option`, admitted example or duplicate fully qualified acceptance name was found. The narrow library attribution R01 does not require re-planning the roadmap.

For house style I opened the main-branch DiophantineApproximationAndTranscendence and ClassicalArithmeticCompletion introductions, supplier boundaries and representative layers. The package has the requested prose shape, Unicode mathematics, one module docstring, documented declarations and layer comments. The remaining scope-decision language concerns the settled G1 issue; I have not repackaged it as a fresh style finding.

All three manifest works were legally readable in the supplied cache. CDT25 uses its published author offprint and journal pagination; BB11 uses arXiv v2; Saff10 uses arXiv v1 with printed journal pages. No author-marked unverified locator or unsettled source request occurs. No new source was fetched and no manifest entry was changed. The 15 seeded targets were checked as follows.

| Sampled target | Exact text opened | Result, hypotheses and qualification |
|---|---|---|
| §0.1 integral lattices | CDT25 line 574 and line 595, proof of Lemma 2.1.2, pp.637–638 | Supports the ordinary and stronger tangent denominator lattices. The package explicitly defines its native predicates and proves their elementary rescale API; it does not attribute that API verbatim to the paper. M>0 and unchanged constants are retained. |
| §0.3 radius >1 | CDT25 line 145, Lemma 1.1.2, p.629 | Integer coefficients, centred holomorphic realization and strict radius threshold match. |
| §1.3 lowest jet | CDT25 line 620 and line 632, (2.2.1)–(2.2.3), pp.638–639 | Tangency χ₁=1, exact initial order β, nonzero integer coefficient, φ′(0)^β and multiplier constant 1 match. |
| §2.1 integrated rank | CDT25 line 440, Theorem 2.0.1 and (2.0.3), p.635; line 711, Lemma 2.3.1, pp.639–641 | Nonconstant regular p, tangent arithmetic coordinate, integral pullbacks, ℚ(p)-independence, common closed-disc uniformizations and λ>1 are present. Empty m is a valid extension outside the auxiliary construction. |
| §2.2 algebraicity | CDT25 line 453 and line 706, p.635 and end of §2.2 p.639 | Fixed rank bound applied to all powers gives algebraicity, not rationality. Algebraicity over the smaller ℚ(p) follows by that same argument. |
| §2.3 André criterion | CDT25 line 169, §1.1.1, pp.630–631; line 242, (1.1.4)–(1.1.5), p.631 | Open-disc version and threshold benchmark agree. The package derives this case from Theorem 2.0.1 by shrinking; it does not depend on an unread André proof. |
| §2.4 lexicographic coefficient | CDT25 line 936, Lemma 2.4.2, (2.4.3)–(2.4.5), p.642 | Nonzero germ and neighbourhood of closed polydisc agree. Package supplies the null-set/negative-part justification needed for its explicit real-integrability formulation. Lexicographic order is not total degree. |
| §3.1 circular discrepancy | CDT25 line 1082, Definition 2.5.4, p.644 | All arcs, mass-one normalization and indexed multiplicities agree. Half-open arcs give the same supremum; the empty-tuple guard is an explicit extension, excluded from sampling estimates. |
| §3.4 Erdős–Turán | CDT25 line 1110, (2.5.8), p.645 | Constant 3, cutoff K≥1, Fourier weights 1/k and nonempty sample agree. The supplied star inequality gives the all-cut version without a factor 2. |
| §3.5 variation | CDT25 line 1096, Definition 2.5.5 and (2.5.6), p.645; line 1245, §2.5.14, p.647 | Angular normalization and positive cutoff agree. Complex h is justified by the norm/radial Lipschitz composition. Generic derivative-integral identity should be imported: R01. |
| §3.7 Haar equilibrium | CDT25 line 1190, proof of Lemma 2.5.9, p.646; Saff10 line 297,310,315,326,387, pp.171–173 | Unit-circle conclusion is supported. Package avoids the source's overbroad compact-set uniqueness assertion and retains diagonal +∞. General energy is a declared supplier contract. |
| §3.8 Vandermonde loss | CDT25 line 1134, Lemma 2.5.9, pp.645–646 | ε∈(0,1], uniform cε>0 and a dimension threshold before tuple quantification match. The package's capped-kernel proof handles atoms and collisions correctly. |
| §3.10 damping limit | CDT25 line 1327 and line 1356, §2.5.25, pp.648–649 | Limit order α,d,κ,ε and the unchanged pre-damping order β agree. Its cofinal-d coefficient-height restriction repairs the source uniformity problem. |
| §4.3 two spans | CDT25 line 467,473,498, Definition 2.0.4 and Corollary 2.0.5, pp.635–636 | V is the paper's ℚ(x)-span. W is explicitly the corrective ℚ(p)-span, not a claim that the printed bound is valid. |
| §4.4 pole clearing | CDT25 line 502, proof of Corollary 2.0.5, p.636; local-basis convention at line 479 | Algebraic singularities, full meromorphic local bases and polynomial-in-p clearing match. Taking a product for a finite family and clearing rational denominators gives q∈ℤ[t]. Nonconstancy makes q(p) nonzero. |

Also reopened BB11 line 26 and line 543 (§1 p.1, Theorem 6.1 pp.10–11), BB11 line 764 (§8 p.14), CDT25 line 546 (auxiliary construction), line 758 and line 820 (quotient corrections), line 1063 (Fekete equality), line 1235 (damping), and line 1364 (the refuted compact formula). These support the repaired passages and source-issue list below. No unavailable paper is needed to check the sampled claims.

### Computed adversarial pass

These are this round's calculations. Rows cover every sampled target, every headline family and the mathematical repairs; unchanged supporting APIs use the earlier computed rows described above. Characteristic zero is a standing assumption, so residue-characteristic, inseparable, DVR and nonabelian-group tests are not instances of these signatures. Numerical quadrature is a consistency test, not a proof of an integral identity. Rational inverse coefficients and the discrepancy examples were recomputed exactly.

| Statement | Instances tried | Computed values on both sides | Result | Change |
|---|---|---|---|---|
| Taylor/substitution convention | F=x², n=0,1,2; χ=t/2 | derivatives (0,0,2), coefficients (0,0,1); substituted quadratic coefficient 1/4, reversed substitution 1/2 | Normalization distinguishes wrong models | None |
| Circle/Vandermonde convention | g=2,1/2,0; z=(1,−1) | means log 2,0,0 versus arclength 2π log 2 at 2; product 2 versus determinant −2, norms both 2 | Correct cutoff, mass and sign | None |
| §0.1 ordinary and tangent lattices | Σ(x/2)^n, scales 1,2; χ=t+t²/4, scales 2,4 | first coefficients 1/2,1; ordinary quadratic at 2 is 1; tangent quadratics 1/2,1 | Membership differs as required | None |
| §0.1 ring/divisibility/constants | f=x/2,h=1+x/2; M=2,N=4; constant 1/2 | scaled sum 1+2x, product x+x²; geometric coefficients 1 versus 2^n; constant remains 1/2 | Closure and inclusion direction correct | None |
| §0.2 native definitions | φ=2z,f=x,g=2z or 3z; p=x,x²,2 | pullback 2z equals first g, differs from second by −z; fields ℚ(x),ℚ(x²),ℚ with extension degrees 1,2,∞ and native finrank 0 in last case | No unconstrained formal stand-in | None |
| §0.3 overconvergence | 1+x² at R=2,r=3/2; Σx^n at R=1 | coefficients n≥3 are 0≤C(2/3)^n; radius-one coefficients remain 1 | Strict threshold necessary | None |
| §0.4 retained Eisenstein target | f=1/2, √(1−4x), 0 | c=2,M=1 gives (1,0,…); square-root coefficients 1,−2,−2,−4; zero coefficients all 0 | Scalar and variable scales distinct | Acceptance deletion confirmed |
| §0.5 repaired inverse API | p=x+x⁴/32, χ=p⁻¹ | χ coefficients at 1,4,7,10 are 1,−1/32,1/256,−11/16384; tangent scale 4 gives 1,−2,16,−176; both compositions equal x through degree 10 | Both inverse directions checked | Native citations present |
| §0.5 ramified/unit controls | p=x²,χ=t; P=2x over ℤ and ℚ; zero ring | M=1 for ramified p; inverse linear term 1/2 exists over ℚ but not ℤ; in zero ring 0=X and both inverse identities read 0=0 | No hidden unramified assumption | None |
| §1.1 independence | p=x,D=2,d=1,2,f=1; family 1,p | coefficient matrices I₂,I₄ have determinants 1; p·1−1·p=0 | ℚ(p)-independence indispensable | Repetition removed |
| §1.2 auxiliary count/uniformity | d=2,α=3; d=1,κ=1/2; p=x+2 | 6=binomial(4,2), not 9; D/α→3 and rows/surplus→1/2; shifted polynomial forces height/α≥log 2 | Cofinal d restriction prevents false all-d uniformity | None |
| §1.3 lowest integral jet | χ=t,F=x₁−x₂,φ=2z+z²; F=1; χ=2t,F=x/2 | lowest coefficients ±1 become ±2=±2¹; constant 1=2⁰; non-tangent pullback is t but original coefficient 1/2 | β and tangent premise correct | None |
| §1.4 multiplier bound | (h,g)=(1,1),(1+z,0),(1−2z,2z) | boundary maxima 1,2,6; A=0,log 2,log 6; for a=log 2, exp a=2 | Logarithm and two-supremum formula correct | Supporting target retained |
| §1.5 multiplier rank | φ=g=2z,h=1−2z,m=1 | 1≤e log 6/log 2≈7.026657; mean bound is 1≤e≈2.718282 | Consistent consequence | Acceptance deletion confirmed |
| §2.1 integrated headline | p=x,χ=t,φ=2z,m=0,1 | J=log 2, denominator log 2; inequalities 0≤e and 1≤e | Empty family and rank one valid | None |
| §2.1 nonrational family | {1,√(1−4x)}, φ=(1−exp(8z))/4 | λ=2; numerical J=1.8898312518 and 1.8898312465 at 16384 and 65536 angles; bounds ≈7.411260≥2 | Nonrational independent family survives | None |
| §2.2 algebraicity headline | f=√(1−4x),0,1 | annihilators Y²−1+4x,Y,Y−1 evaluate to 0; square root has degree 2, not 1 | Algebraic, not rational, conclusion | None |
| §2.2 uniform powers | previous square-root data | fixed B≈7.41126; m=8 would exceed B if all powers independent; in fact f²=1−4x | Quantifier order rules out transcendence | None |
| §2.3 open-disc/strictness | λ=2,r=3/4 or 1/4; identity map | derivative moduli 3/2>1, 1/2<1, and 1 at boundary; square-root realization after first shrink is exp(3z) | Closed-disc reduction valid | Acceptance deletion confirmed |
| §2.3 arithmetic benchmark | m=2,3 in (1−m²x)^(1/m) | first coefficients (1,−2,−2,−4) and (1,−3,−9,−45); modular composition coefficient 2 is −32+36=4 | Integer and modular normalizations match | Duplicate benchmark removed |
| §2.4 logarithmic coefficient | G=3z₁²z₂,1−z,z₂^100+z₁ | log coefficient and mean: log 3=log 3; 0=0; last least exponent (0,100), coefficient 1, mean 0, total order 1 | Zeros and lex order separated | None |
| §2.5 Jensen route | φ=2z; least exponent (0,100) | selected coefficient factor 2^100; rank test gives log 2≤e log 2 | Lowest lex degree need not equal total order | Repetition removed |
| §3.1 discrepancy | empty,singleton,antipodal,triangle,(1,1,−1) | exact values 0,1,1/2,1/3,2/3; unguarded empty formula has supremum 1 | Multiplicity and zero guard necessary | None |
| §3.1 measure/rotation API | Haar,δ₁; antipodal pair repeated twice | arc errors 0 for Haar, supremum 1 for δ₁; repeated weights 2/4=1/2 and discrepancy 1/2 | Haar distinguished, rotation/repetition preserve value | None |
| §3.2 weak limits | equal masses at exp(±i/n) | D at n=1,2 is 0.681690,0.840845; limit 1 equals D(δ₁); regular polygons have 1/d→0 | Scalar continuity handles atoms | None |
| §3.3 Koksma | Re z sampled at 1; constant c | mean 0, variation 4, error 1≤4; constant error c−c=0=variation | Angular probability convention correct | None |
| §3.4 Erdős–Turán | regular d-gon,K=d−1≥1; singleton,K=1 | low Fourier means 0, so 1/d≤3/d; singleton gives 1≤9/2 | Constant 3 survives arbitrary cuts | None |
| §3.5 positive-log variation | h=0,z,2z,1−z; g=Re z | variations 0,0,0,2 log 2≈1.386294; value at zero of 1−z is 0; native C¹ identity gives 4=∫2π∣sin(2πt)∣dt | Mathematics correct, generic identity already native | R01 |
| §3.6 Fekete equality | d=1; (1,−1),(1,1),(1,i); regular triple | norms 1,2,0,√2,3√3; bounds 1,2,2,2,3√3 | Equality exactly at tested regular polygons | Supporting target retained |
| §3.7 energy | Haar,δ₁,uniform antipodal measure | I=0,+∞,+∞; omitted diagonals would give −log 2/2 | No totalized-zero self-energy | Conditional on named supplier |
| §3.8 cutoff and gap | antipodal pair cutoff A; collision; regular d-gon; singleton | truncated energy A/2−log 2/2, correction A/d=A/2; collision product 0; polygon D=1/d; singleton 1>exp(−c) | Dimension threshold and diagonal correction necessary | None |
| §3.9 damping repair patterns | F=x₁−x₂,φ=2z,M=1; S=1,D=3,c=1,d=2; S=0 | H coefficients (2,−4,2), selected lower modulus 2=2¹; ceil(3/2)=2 and bad exponent 6−8=−2; S=0 gives V⁰=1 | No extra derivative factor, ceiling correct | Repetition removed |
| §3.10 limit | d=1,2,10,100; κ=1/2 | d/(d!)^(1/d)=1,1.414214,2.208125,2.632085→e; log d/d at 2,10,100=.346574,.230259,.046052→0; 3^(1/d)→1 | Remainder vanishes only after d-limit | None |
| §4.1 new order-preserving descent | √2((1−x)∂−1), f=(1−x)⁻¹ | basis components 0 and (1−x)∂−1; latter order 1, degree 1, residual (1−x)/(1−x)²−1/(1−x)=0 | Leading component preserves exact order | Repair sound |
| §4.1 descent negative/zero controls | exp(√2x); f=0; exp x | p₀+√2p₁=0 over ℚ(x) forces both 0; zero has nonzero order-0 annihilator 1; exp x matrix [1,1] has rank 1 and kernel span(−1,1) over both fields | Rational-series hypothesis and order zero handled | Repair sound |
| §4.1 meromorphic ring | 1,exp x,exp(x/(1−x)), χ=L/(1+L) in last case | 1 has coefficients (1,0,…); exp coefficient 2 is 1/2; last pullback is exp L=(1−t)⁻¹ but has essential singularity at x=1 | Arithmetic and local-basis conditions independent | None |
| §4.2 closure | f=(1−x)⁻¹,χ=t; scalar 1/2 | f² coefficients n+1 and annihilator (1−x)∂−2; scalar multiple of 1 has nonintegral constant 1/2 | Ring closure holds, arbitrary rational action fails | Repetition removed |
| §4.3 W,V | p=x²,χ=t; degree-four inverse example | x² has scalar extension degree 2; x⁻¹∈V has valuation −1; degree-four V has ℚ(p)-dimension at least 4 | Fields and Laurent ambient distinct | None |
| §4.4 rational clearing | f=(1−x)⁻¹,q=1−t; f=(1−2x²)⁻¹,q=1−2t² | q(p)f=1 in both; q=i(1−t) instead gives i∉ℚ[[x]] | Both conjugate poles cleared without losing arithmetic | None |
| §4.5 W headline | U=ℂ,p=x,χ=t,φ=2z | 1≤dim W≤e, hence integral dimension ≤2; at λ=1 denominator is 0 and premise fails | Correct scalar field and strict size | Named unavailable carrier |
| §4.6 field/scalar headline | p=x²,χ=t; p=x+x⁴/32 | W=V with base-field degree 2 in first; degree-four test has dim V≥4, B≤3.593373, safe nB≤14.373492 | General V bound needs extension factor | Named unavailable carrier |
| §4.7 integral-coordinate headline | U=ℂ; U=unit disc; U=ℂ∖{1} | derivative moduli 2 from 2z; ≤1 by Schwarz; 2 from 1−exp(2z), which never equals 1 | Hyperbolic/parabolic domains separated | Named unavailable carrier |
| §4.8 repaired counterexample | p=x+x⁴/32,φ=2z | boundary norm ≤5/2; (5/2)³=125/8<16; B≤3.593373<4≤dim V. In fact J=log 2 because ∣p(2z)∣≥3/2 and its extra factor is zero-free | Published V inequality refuted; W survives | Both inverse identities checked |
| §5.1 centred headline | r=1/2,φ=4z; φ=2z | cap=1/2; first numerator log 2, denominator log 2, B=e; second denominator 0 | Positive denominator and centre required | Named unavailable carrier |
| §5.2 retained G1 obstruction | translated radius-1/4 disc,φ=8z exp(−20z) | norm≤6e^(−5)=.040427682<1; capacity 1/4; denominator log 2=.693147181; numerator 0; rank≥1 | Proposed general inequality 1≤0 is false | G1 disposition settled, no false target added |
| Named equilibrium gap | radius-2 circle; singleton; {0,1} | minimum −log 2, exp(−minimum)=2; atomic energies +∞ and finite-set capacities 0; both point masses minimize on {0,1} | Nonempty/positive-capacity hypotheses discriminating | Contract precise and minimal |

The new descent statement is not vacuous: its conclusion is a rational annihilator with the same order and polynomial-degree bound, while the input permits algebraic coefficients. Choosing a leading component is essential. It asserts no descent of a selected meromorphic fundamental basis. For the integral-lowest-jet test I used χ=t to satisfy full pullback integrality; the README's χ=t+t²/2 illustration computes the lowest homogeneous parts only.

For the limit proofs, C is independent of d and κ only on the cofinal dimension range specified in §1.2; the paper's stronger all-d assertion is not imported. For discrepancy continuity the mesh has endpoints avoiding atoms of the limit, and enlargement/inscription costs Haar length, not an unjustified bound on the masses of small arcs. For §4.4, at a singular initial point a meromorphic fundamental matrix sends the formal solution jet to constants; it therefore realizes that formal solution meromorphically, and its power-series character makes the selected germ holomorphic. These proof steps preserve the stated generality.

### Pinned libraries and duplication by object

The content manifest pins Mathlib to `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti to `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I opened the following declarations and their surrounding hypotheses at those pins. File names below are relative to the respective library repository.

| Native object and declarations opened | File and line | What the declaration actually supplies |
|---|---|---|
| `PowerSeries.coeff`, `PowerSeries.coeff_rescale` | `Mathlib/RingTheory/PowerSeries/Basic.lean:76`,583 | Native coefficient map; rescale multiplies coefficient n by a^n. No analytic convergence condition. |
| `PowerSeries.HasSubst`, `PowerSeries.subst`, `PowerSeries.substAlgHom` | `Mathlib/RingTheory/PowerSeries/Substitution.lean:39`,157,170 | Nilpotent constant term is the generic substitution condition; zero constant suffices over ℚ. The inner series is first. |
| `PowerSeries.substInv`, `PowerSeries.subst_substInv_right`, `PowerSeries.subst_substInv_left` | `Mathlib/RingTheory/PowerSeries/Substitution.lean:456`,510,542 | Commutative coefficient ring, invertible linear coefficient; zero constant is included for both composition identities. |
| `RatFunc.coeToLaurentSeries` | `Mathlib/RingTheory/LaurentSeries.lean:391` | Field-algebra embedding used as a coercion, allowing poles at zero. |
| `RatFunc.liftAlgebra` | `Mathlib/FieldTheory/RatFunc/Basic.lean:756` | Scoped algebra instance; polynomial algebra and faithful scalar action are retained. |
| `IntermediateField.adjoin` | `Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean:34` | Field closure of the scalar image together with the generators; not a vector span and not a finiteness assertion. |
| `RatFunc.finrank_eq_max_natDegree` | `Mathlib/FieldTheory/RatFunc/IntermediateField.lean:162` | Reduced numerator/denominator degree. The constant case has infinite extension and native finrank 0. |
| `IsAlgebraic.exists_integral_multiple` | `Mathlib/RingTheory/Algebraic/Integral.lean:146` | One nonzero scalar making one algebraic element integral; it is not an exponential denominator bound for a whole series. |
| `Int.Matrix.exists_ne_zero_int_vec_norm_le` | `Mathlib/NumberTheory/SiegelsLemma.lean:155` | Positive row count strictly smaller than column count, nonzero integral kernel vector and the stated sup-norm bound. |
| `fieldOfFiniteDimensional` | `Mathlib/LinearAlgebra/FiniteDimensional/Basic.lean:521` | Finite-dimensional commutative domain algebra over a field becomes a field with its original ring operations. |
| `Stirling.factorial_isEquivalent_stirling` | `Mathlib/Analysis/SpecialFunctions/Stirling.lean:246` | Factorial asymptotic; the d/(d!)^(1/d) limit is its elementary consequence. |
| `Complex.norm_iteratedDeriv_le_of_forall_mem_sphere_norm_le` | `Mathlib/Analysis/Complex/Liouville.lean:42` | Positive radius, DiffContOnCl, complete target, boundary bound; derivative estimate includes n!. |
| `AnalyticOnNhd.circleAverage_log_norm` | `Mathlib/Analysis/Complex/JensenFormula.lean:375` | Nonzero radius and nonzero central value; remove the exact zero order first. |
| `Real.circleAverage` | `Mathlib/MeasureTheory/Integral/CircleAverage.lean:55` | Factor (2π)⁻¹ in the angular integral. The definition alone does not assert integrability; line 64 totalizes a nonintegrable mean to 0. Analyticity supplies integrability here. |
| `Matrix.det_vandermonde` | `Mathlib/LinearAlgebra/Vandermonde.lean:219` | Product of z_j−z_i, the opposite difference from the README product. |
| `InnerProductSpace.gramSchmidtOrthonormalBasis_det` | `Mathlib/Analysis/InnerProductSpace/GramSchmidtOrtho.lean:374` | Finite-dimensional ambient space with index cardinal equal to its dimension; factorization into inner products against an orthonormal basis. |
| `eVariationOn`, `LipschitzWith.comp_boundedVariationOn` | `Mathlib/Topology/EMetricSpace/BoundedVariation.lean:60`,1256 | Supremum of monotone finite partition sums, without continuity built into the definition; Lipschitz composition preserves finite variation. |
| `isCompact_setOfPred_finiteMeasure_le_of_isCompact` | `Mathlib/MeasureTheory/Measure/Prokhorov.lean:183` | Hausdorff Borel space, compact support and bounded mass. |
| `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto` | `Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean:365` | Bounded continuous real test functions, with measurable opens; not arbitrary discontinuous indicators. |
| `MeasureTheory.ProbabilityMeasure.continuous_prod` | `Mathlib/MeasureTheory/Measure/FiniteMeasureProd.lean:144` | Second-countable pseudometrizable spaces with measurable opens. |
| `MeasureTheory.ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto` | `Mathlib/MeasureTheory/Measure/Portmanteau.lean:353` | Measurable opens, outer approximation by closed sets and a limit-null frontier. The mesh in §3.2 meets this condition. |
| `MeasureTheory.instMetrizableSpaceProbabilityMeasure` | `Mathlib/MeasureTheory/Measure/LevyProkhorovMetric.lean:695` | Separable pseudometrizable Borel space. Together with compactness this justifies the subsequence in §3.8 on the circle. |
| `TauCeti.Probability.empiricalMeasureOfFintype`, `TauCeti.Probability.integral_empiricalMeasureOfFintype` | `TauCeti/Probability/Process/EmpiricalMeasure.lean:54`,100 | Nonempty finite index type, multiplicities retained; strong measurability and a complete real normed target for the integral formula. |
| `DifferentiableOn.torusIntegral_prod_sub_inv_smul` | `TauCeti/Analysis/Complex/CauchyIntegralPolydisc.lean:116` | Finite coordinate polydisc, complete complex target, differentiability on the closed polydisc and an interior evaluation point; factor (2πi)^d. |
| `TauCeti.eVariationOn_eq_lintegral_enorm_derivWithin` | `TauCeti/Analysis/Calculus/MetricVariation.lean:276` | C¹ curve on Icc a b in a complete real normed space; equality of native extended variation and the derivative-norm lower integral. **R01**. |

The object searches covered power-series denominators and inverse coordinates, D-finite operators and coefficient descent, meromorphic bases, circle discrepancy and its inequalities, Vandermonde extrema, variation/integration, logarithmic energy, finite capacity and arithmetic rank. Searches used `roadmaps grep` on main and the open-head index, and direct searches of the pinned libraries and board checkout. Broad searches were followed by narrower searches to avoid a capped result list concealing relevant hits. The only newly identified native duplicate is the generic identity in R01. In particular, the subadditive-sequence theorem also called Fekete's lemma is a different object from regular-polygon Vandermonde equality.

The ordinary series ring, substitution, generated field, empirical probability, variation carrier and finite-domain field structure are imported, not rebuilt. Local lattice predicates, the arithmetic germ relation, tensor auxiliary construction, the integrated arithmetic theorem and corrected W/V comparison are the new objects. ConformalMappingPartII owns meromorphic continuation and quotient representation; ProbabilisticAndMetricNumberTheory owns interval discrepancy inequalities; ClassicalArithmeticCompletion owns finite diameters and their limiting normalization. Those ownership distinctions are maintained. The remaining six acceptance declarations are in this package's namespace, and no same fully qualified name was found in the searched main/open-head Lean files or readable board packages.

### Supplier resolution and direction

Main was verified as `1ce5c4f0`. I used the main versions for existing roadmaps even where an open pull request revises them. New suppliers were read at their supplied open heads, not inferred from the citation resolver. The service prepends one header line to `roadmaps show`; the locators below subtract that header and refer to actual repository files.

| Supplier | Resolved section and repository locator | Contract and computed convention |
|---|---|---|
| DiophantineApproximationAndTranscendence, main | `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:2928`, §5.1; scope deferrals §§0.2–0.3,2.8,5.2–5.3 at 227,358,1804,2968,3034 | Annihilator/finite derivative-span equivalence, D-finite closure, scalar enlargement and analytic initial values. No descent is attributed here after the repair. Ordinary x² second jet is 2. |
| ConformalMappingPartII, head `552db86` | `TauCetiRoadmap/ConformalMappingPartII/README.md:137`, §§0.1–0.6; §1.3 at 289, §1.4 at 310; §§3.5–3.7 at 555 onward | Analytic germs, unscaled jets, continuation, full meromorphic local bases, rational simultaneous clearing, pointed conformal radius and corrected quotient representation are present. x⁻¹ has pole order 1; exp(1/x) fails; radius-2 disc has cover derivative 2 and inverse derivative 1/2; G=i needs phase i. |
| ProbabilisticAndMetricNumberTheory, head `58cbb88` | `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md:3086`, §2.7 | Strict-cut star discrepancy with guarded empty sample, native finite variation with actual jump values, Koksma and Erdős–Turán constant 3. Fixed-cut singleton at 1/2 has D*=1/2, circular supremum 1. |
| GeometryOfNumbersAndQuadraticArithmetic, head `465728d` | `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:238`, §0.1, numbered assertions 0.1.1–0.1.2 | Full-orthonormal-coordinate Hadamard and arbitrary-ambient Hermitian Gram bounds. Columns (2,0),(0,3) give 6=2·3; (1,0),(1,1) give 1<√2. Polygon equality remains local here. |
| ClassicalArithmeticCompletion, main | `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:12458`, §6.18; §6.19 at 12493; §6.40 at 13054 | Finite Fekete and Chebyshev quantities, common limit and affine/disc/segment values. Radius-2 disc gives δ₂=4 and capacity 2; [0,1] gives capacity 1/4. This does not supply the full energy-minimizer interface. |

The `complex-logarithmic-equilibrium` slug occurs at `design/plan.json:2031` and README line 67, with the same supplier, sections and needs. Its energy carrier, minimization/uniqueness laws and geometric normalizations form one coherent interface. Nonempty compact support, diagonal +∞, positive capacity for uniqueness, positive radius and nonzero affine slope are explicit. The request does not duplicate the already supplied finite-diameter construction. It is a precise, minimal declared contract, not an unowned prerequisite.

All 35 `Needs` lines were read. The auxiliary construction precedes all three independent analytic routes; no mean-rank conclusion is used to construct its auxiliary functions. The damping branch runs from §§3.1–3.8 to §§3.9–3.10. Pole clearing precedes the holonomic bound, which precedes the scalar-field comparison and centred theorem. §4.3's later field consequence is explicitly qualified “after the finite-rank theorem”, so it is not required to define W and V. G1 supplies none of these edges.

The requested dependency command exited 0 with exactly:

```text
depcheck: 52 roadmaps, 586 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The open suppliers occupy ORDER positions 78,105,113,265; this roadmap occupies 266. Part I is on main. The citation resolver also reported no unresolved cross-roadmap citation or own Lean name against main and the 363-open-pull-request index. Its warning that it did not check pinned libraries was addressed by the direct library audit above; it was not treated as a clean native-API audit.

The board packages index was read before any absence assessment. The four readable indexed board READMEs—AnalyticNumberTheory, AutomorphicCongruences, KatoEulerSystems and LogicAndDefinabilityInNumberTheory—were searched at their listed heads for the mathematical objects above, and their Suggested.lean files were checked for namespace collisions. No competing arithmetic-rank owner or same fully qualified declaration was found there. The other fifteen supplied README locations were requested and returned 404, as recorded below; no claim of nonexistence follows from that.

### Headline coverage, elaboration and padding

The README's end-theorem families are integrated arithmetic rank (§2.1, also reached by §§2.5,3.10), arithmetic algebraicity (§2.2, with the open-disc consequence §2.3), corrected holonomic W rank (§4.5), field structure and scalar comparison (§4.6), integral-coordinate holonomic finiteness (§4.7), and centred capacity rank (§5.1). The 85-line acceptance file states the first two with `sorry`. Its four real-bodied definitions—`IntegralSeries`, `Uniformizes`, `positiveLogMean`, `rationalFunctionField`—are needed for those signatures. The other four families are expressly named in its module docstring with the missing differential-equation/full-meromorphic-basis/arithmetic-ring carrier. The source counterexamples remain README computations. The removed multiplier, denominator and circle estimates remain supporting targets for these endpoints, without replacement stand-ins.

Ran `lake env lean` on the absolute pathname of `packages/DiophantineApproximationAndTranscendencePartII/Suggested.lean` from the pinned content checkout, as required. Exit status was 0. The only output was two “declaration uses `sorry`” warnings, at lines 50:8 and 70:8. There is a single `import Mathlib` and no TauCeti import, so no module-object build was needed.

Generated one scratch copy with `#check @name` for all six declarations and elaborated it once. Exit 0; all six types printed, with only the same two `sorry` warnings. Compared every type with README §§0.1–0.2,2.1–2.2. Both theorems retain nonconstant p, the Laurent equality fixing pSeries, χ₀=0 and χ₁=1, actual integral pullbacks, neighbourhood holomorphy, φ(0)=0, λ>1 and the actual germ equalities. The rank theorem retains ℚ(p)-linear independence. No section binder disappeared; no author file was changed.

On another scratch copy, each `sorry` was replaced by alternatives attempting closure with one `simp`, one `rfl`, or one `infer_instance`. All six tactic attempts failed to close their targets; Lean exited 1 at the final `infer_instance` alternative for each theorem. Inspection of the relevant pinned algebraicity and analytic carriers found no single existing lemma providing either arithmetic conclusion. Neither statement restates a definition, computes a small case, mirrors a Check or handles only a boundary. No remaining acceptance-test padding was found.

The two required deliverables are the only files created in the package. README.md, Suggested.lean, metadata.toml, sources.toml and design files were left unchanged. All Lean invocations have finished. No repository, issue, pull request or comment was written to remotely.

## Not verifiable

- G1 has no specified valid general replacement theorem and no supplied maintainer scope decision. Its unresolved mathematics was not certified. The earlier finding remains settled for this package under the brief's disposition rule; this is not a missing bibliographic source and is not the named conditional supplier gap.
- The frozen plan's stale ownership strings remain outside the repair worker's permitted node edits. The README contracts and mechanically checked dependency graph were verified separately; no claim is made that the plan has been reconciled.
- Ownership against open pull requests whose contents were not provided by the brief was not certified. In particular, the search index returned RandomMatrices Milestone 9 as a logarithmic-energy lead. Its contents were not inspected or treated as a supplier; that lead alone cannot identify the owner of general compact-plane energy.
- The following board-indexed README paths returned GitHub 404 at the supplied heads. The first failure was also retried through the Contents API with the same result. This limits ownership checking for these files; it is not evidence that the roadmap exists nowhere. No needed source text was inaccessible, so no `needs-references.toml` entry was required.

| Requested repository-relative file | Supplied head | Result |
|---|---|---|
| `packages/ArithmeticLocallySymmetricSpacesPartII/README.md` | `c1b8f80` | 404 |
| `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md` | `777a863` | 404 |
| `packages/CrystallineCohomologyPartII/README.md` | `84ea77e` | 404 |
| `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/README.md` | `80a66cc` | 404 |
| `packages/HigherHidaAndColemanTheory/README.md` | `da88512` | 404 |
| `packages/LawrenceVenkateshMethod/README.md` | `9ee7ac3` | 404 |
| `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md` | `7e88c38` | 404 |
| `packages/PELModuliPartII/README.md` | `d4bb48d` | 404 |
| `packages/PadicHodgeTheoryPartII/README.md` | `6502997` | 404 |
| `packages/PadicLocalLanglandsForGL2QpPartII/README.md` | `3e0777d` | 404 |
| `packages/RealSurfacePeriodIndex/README.md` | `875bca4` | 404 |
| `packages/SchemeAndStackFoundationsPartII/README.md` | `accb0a0` | 404 |
| `packages/ShimuraVarietiesPartII/README.md` | `57dc0a4` | 404 |
| `packages/VStackSheavesAndLisseCategoriesPartII/README.md` | `0987ba7` | 404 |
| `packages/VectorBundlesAndIsocrystalsPartII/README.md` | `b58d862` | 404 |

## Source issues

- **Error** in CDT25 at Corollary 2.0.5, equation (2.0.7), printed p.636 (CDT25 line 492): the source says the ℚ(x)-span satisfies the arithmetic generator span's ℚ(p)-rank bound; it should be the W bound, with an extension-degree factor for V unless the coordinate is integral; affects a stated result.
- **Error** in CDT25 at §2.5.27, equation (2.5.28), printed p.649 (CDT25 line 1364): the source says arbitrary compact sampling sets satisfy the displayed capacity rank estimate; it should be restricted to justified base-point geometry, including the centred cases; affects a stated result.
- **Misprint** in CDT25 at equation (2.5.2), printed p.644 (CDT25 line 1048): the source says the reversed-difference product equals the displayed Vandermonde determinant; it should be multiplied by (−1)^(d(d−1)/2); affects nothing.
- **Misprint** in CDT25 at equation (2.3.2), printed p.640 (CDT25 line 758): the source says boundary log-moduli reconstruct the complex function without a constant phase; it should be multiplied by G(0)/∣G(0)∣, as G=i demonstrates; affects the proof.
- **Misprint** in CDT25 at the proof of Lemma 2.3.1, printed p.641 (CDT25 line 820): the source says the supremum of ∣h∣ is bounded by the positive-log mean; it should be the supremum of log∣h∣, since g=h=1 otherwise gives 1≤0; affects the proof.
- **Error** in CDT25 at the proof of Lemma 2.5.9, printed p.646 (CDT25 line 1190): the source says every compact set admits a unique energy-minimizing probability; it should require nonempty compact support for existence and positive capacity for uniqueness; affects nothing.
- **Error** in CDT25 at Lemma 2.1.2, printed pp.637–638 (CDT25 line 546): the source says its coefficient-height constant is uniform in κ for every positive dimension; it should allow a cofinal dimension range depending on κ, sufficient for the subsequent limit; affects a stated result.
- **Misprint** in BB11 at §1, printed p.1 (BB11 line 40): the source says the tail uses exponent N−k for k≥N; it should use k−N, giving nonnegative powers; affects nothing.

For the height-uniformity error, take d=m=1,p=x+2,f₁=1,χ=t,φ=2z. Order ≥α forces P(T)=(T−2)^αQ(T). The lowest nonzero coefficient b of integral Q contributes (−2)^αb to P, so height/α≥log 2, contradicting arbitrarily small κC with fixed C. The package's cofinal-d restriction avoids this error. For compact uniqueness, K={0,1} has capacity 0 and both distinct point masses have energy +∞ and minimize. The package uses the positive-capacity circle. No published correction is claimed for these issues.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "788c4da1f0b19adc0a95bb97ec7ef1e8d76f5eb9", "job": "REV-PKG-DiophantineApproximationAndTranscendencePartII~2", "model": "gpt-6-astra", "worker": "chris-8"} -->
