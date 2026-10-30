# Review of EllipticCohomology (pull request #945 at acf2980)

**Verdict:** accepted

No findings. The three previous findings are repaired; the changed passages introduce no blocking defect.

## Previous findings

- R01 — repaired: README:1306–1311 gives h₂g order four and computes 2·1≠0, 4·1=0 and 5·1=1 in ℤ/4. This preserves the initial differential under the allowed choice change.
- R02 — repaired: Suggested.lean:2,39–67 uses Tau Ceti's coefficient type, universal curve and specialization. The duplicate definitions are deleted; README:103–110 supplies the native contract. Both original headline theorems remain.
- R03 — repaired: README:93–98,154–162,1581–1594,1634–1638 imports native measures and PadicMeasuresIwasawaAlgebras §§1.6,2.1. E5 now states its orientation-specific congruences and integrality criterion, with explicit all-prime hypotheses and discriminating examples.

## Verified sound

:robot: Independent AI incremental re-review of 128 changed lines since ad9b70f. I checked every changed passage, the three repairs and their dependent statements, the E4.U sample, suppliers, pinned APIs and the complete Lean companion. Untouched mathematical tests are explicitly attributed to the previous report below. This is readiness for human final approval, not AI approval or merger.

**Scope and gate.** HEAD is acf29805b83f33d8cdbe78d8c93886e8883043cd. Both the incremental comparison and origin/main comparison have no edits outside TauCetiRoadmap/EllipticCohomology. The worktree remains clean. No PR file, source manifest, library or merge-order file was changed. There are no declared supplier gaps.

The worker's head-specific gate passes every check, including build=0. The rerun gate passes every scanner and dependency check; its output has no build field, so I also ran the targeted build separately. It exits 0, reporting 8979 jobs and only the two expected sorry warnings. Direct elaboration of TauCetiRoadmap/EllipticCohomology/Suggested.lean also exits 0 with those two warnings. The movable dependency check returns exactly:

```text
depcheck: 208 roadmaps, 1461 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. I reread all 41 Needs lines and resolved the supplier contracts against main or the supplied new-roadmap heads. No repair introduces a reverse supply edge, an algorithm, a good-prime restriction, copied source prose, sorry'd data or set_option.

**Lean signatures and headlines.** A scratch copy with #check @name for all four declarations elaborates. No binder is lost: IsIntegralModularForm quantifies internally over every commutative ring in the fixed Type universe and every native variable change; the weights and both theorems use MvPolynomial WeierstrassCurve.Coeff ℤ. The predicate still includes singular cubics and all characteristics. This agrees with README:355–411. Two real definitions support two sorried headlines; only Mathlib and the used Tau Ceti module are imported.

On separate scratch copies, simp, rfl and infer_instance each fail to close either headline. Object searches find the native invariant identity, but no lemma giving the full invariant-ring characterization or kernel equality. The kernel theorem is stronger than c_relation: it determines every relation. Neither theorem is padding.

The headline inventory remains E1's integral modular-form ring and presentation; E2–E3's realization, O^top and tmf/Tmf/TMF; E4's descent, Gap, integral coefficients, away-from-6 ring and localization; E5's E∞ orientation, Witten comparison and surjectivity; E6's DA(1) equivalence and level coefficients. The new orientation criterion belongs to E5's missing spectral-map carrier. The module docstring identifies those missing stack, spectrum, Thom and level carriers; neither library supplies them in the searched algebraic-topology APIs. The two statable algebraic headlines remain in Suggested.lean.

**Sources.** Three works were fetched through the sources service and read at the following locators. No locator in the README is flagged unverified. The source material was not copied into the repository or report.

| Source and locator | Extraction inspected | Verification |
|---|---|---|
| Bauer, arXiv:math/0311328v3, §3, printed pp.15–16 | bauer-tmf line 165; line 178; line 185 | Universal strict-change Hopf algebroid and integral invariant-ring presentation. The printed pagination agrees; this is PDF page 6, not printed page 6. Native scaling supplies the weight refinement. |
| CDvN, arXiv:2412.01640v2, Proposition 5.4, p.50; Lemmas 5.6–5.8, pp.50–51 | cdvn-dss-tmf line 1792; line 1810; line 1825 | Detection uses a nonzero bracket and vanishing indeterminacy; the sphere choice, relation and finite τ-torsion are separate inputs. |
| CDvN Proposition 5.9, pp.51–52; Notation 5.10 and Corollary 5.11, p.52 | cdvn-dss-tmf line 1836; line 1844; line 1860 | Four vanishings give the τ² isomorphism. Sphere class, divided elliptic class and its mod-τ generator have the stated distinct degrees. |
| CDvN Proposition 6.19, p.59; Lemma 6.28, p.62 | cdvn-dss-tmf line 2109; line 2206 | Initial 2-primary differential and mod-τ target ℤ/4 agree with the repair. |
| CDvN Proposition 7.2, p.84 | cdvn-dss-tmf line 2959 | Sphere obstruction, permanent β and product comparison give the separate 3-primary differential. |
| AHR, May 2010, Definition 9.6, p.27; Proposition 10.10, p.35 | ahr-ko-tmf line 1324; line 1845 | Integer-valued test polynomials and even moments on units modulo ±1 match E5, including p=2. |
| AHR Theorems 12.1 and 12.3, p.38; proof pp.43–44 | ahr-ko-tmf line 2019; line 2034; line 2361 | All three conditions and the Eisenstein existence assertion agree. The proof uses the standard Hecke action, despite the introductory formula misprint recorded below. |

The AHR version is the legal [author-hosted preprint](https://rezk.web.illinois.edu/koandtmf.pdf). E5 uses the standard arithmetic normalization supplied by ModularForms, so the source's swapped operators do not become a roadmap defect. The new arithmetic examples, including mixed-weight congruences, are computed below.

**Pinned declarations.** Mathlib is pinned at 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. I opened these eight API groups for the repairs and their dependent formulas:

| API | File and line at the pin | Boundary checked |
|---|---|---|
| Coeff | TauCeti/AlgebraicGeometry/EllipticCurve/Universal.lean:151 | Exactly five constructors A₁,A₂,A₃,A₄,A₆, in the recursor order used by coefficientWeight. |
| Universal.curve | TauCeti/AlgebraicGeometry/EllipticCurve/Universal.lean:163 | The actual universal five-coefficient curve; not a fresh carrier. |
| specialize, specialize_X, map_specialize | TauCeti/AlgebraicGeometry/EllipticCurve/Universal.lean:353,361,367 | Ring homomorphism and recovery for arbitrary CommRing, with no smoothness or nontriviality assumption. |
| VariableChange, variableChange_def | Mathlib/AlgebraicGeometry/EllipticCurve/VariableChange.lean:57,137 | u is a unit; r,s,t arbitrary; coefficient formulas use inverse powers. |
| variableChange_c₄, variableChange_c₆, variableChange_Δ | Mathlib/AlgebraicGeometry/EllipticCurve/VariableChange.lean:210,214,218 | Exponents −4,−6,−12, over CommRing. |
| c₄,c₆,Δ,c_relation | Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:120,124,131,134 | Integral polynomial definitions and 1728Δ=c₄³−c₆², also in characteristics 2 and 3. |
| IsWeightedHomogeneous | Mathlib/RingTheory/MvPolynomial/WeightedHomogeneous.lean:122 | Tests every nonzero coefficient; zero has every weight. |
| AbstractMeasure, dirac, dirac_apply | Mathlib/NumberTheory/Padics/Measure/Basic.lean:40,97,100 | Continuous linear-functional carrier, with evaluation Dirac; no positivity or mass-one condition. |

**Suppliers and ownership.** Main is 9c6e95d911c8ef4a94a1d22116bd70e3fbcb4858. GeneralizedCohomology and BordismFormalGroups were read as the two nearby main-branch shape examples. Cross-roadmap resolution reports no unresolved citations. Its library-name pass was unavailable, so the relevant native declarations were checked directly at the pins above. The following nine relationships were resolved afresh:

| Roadmap | Repository-relative locator | Contract checked |
|---|---|---|
| GeneralizedCohomology | TauCetiRoadmap/GeneralizedCohomology/README.md:211,326,432,785,1536,1559,1652,1767,1806 | G2 models/comparisons, G3.8 limits/covers, G5.3 Thom diagrams, G5.4 ko/KO/MSpin, G5.5-ABS coherent orientation. |
| BordismFormalGroups | TauCetiRoadmap/BordismFormalGroups/README.md:46,145,284,329,433,466,553 | F1–F6 supply formal-group, MU/BP, generic Toda/cobar, deformation and localization theory. Specific elliptic and sphere calculations remain here. |
| ModularCurves | TauCetiRoadmap/ModularCurves/README.md:1313,1490,1500,1535,1560,2103 | Ordered full level, formal completion, marked deformation and coarse compactification contracts. E6 retains its own general boundary stack. |
| SchemeAndStackFoundations | TauCetiRoadmap/SchemeAndStackFoundations/README.md:2745,2843,2951,2991,5723 | §§1.18–1.22 stacks/presentations/QCoh and §4.15 stable pointed curves; (1,1) satisfies 2g−2+n=1. |
| EllipticCurves | TauCetiRoadmap/EllipticCurves/README.md:637 | Layer 1(i) formal group law over the coefficient ring, without imposing the separate logarithm's characteristic-zero condition. |
| ModularForms | TauCetiRoadmap/ModularForms/README.md:93,106,434 | Analytic comparison and Layer 2(b) arithmetic Hecke action. At level one every prime satisfies the coprimality hypothesis; q coefficient is a_p, not p^(k−1)a_p. |
| PadicMeasuresIwasawaAlgebras | TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:888,1148,1210,1216 | Character integration, weighted measures, ordinary moments and coefficient-algebra comparison. Bounded scalar-action hypotheses are retained; no second measure construction remains. |
| StringOrientation, supplied open head | TauCetiRoadmap/StringOrientation/README.md:57,60,475 | Consumes this roadmap's MString and orientation; the geometric comparison is downstream. |
| ChromaticHomotopyTheory, supplied open head | TauCetiRoadmap/ChromaticHomotopyTheory/README.md:18,19,118 | Consumes elliptic realization and E5's units/orientation interfaces; higher-height extension is downstream. |

Object searches used roadmaps grep, the pinned libraries, main, board packages and the supplied neighboring open checkouts. The new ownership split imports generic measures and leaves the modular-form-valued orientation criterion here. The automorphic bounded-fraction contracts concern different ray-class measures, not this characteristic-sequence theorem. No second owner or duplicate fully qualified Lean name was found. Open revisions of existing suppliers were not substituted for main; open results without a supplied checkout were not used as dependencies.

**Adversarial calculations.** Fresh rows cover each changed mathematical statement, both touched Lean headlines, all four declarations, the repaired order claim, the sampled E4.U chain and the new orientation criterion. Computations test conventions and reject specific wrong models; they do not constitute proofs of the deep theorems.

| Statement / location | Instances tried | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| Native universal curve, README:103–110 | Five coefficient constructors; zero ring | Entries X_A₁,X_A₂,X_A₃,X_A₄,X_A₆ specialize to a₁,a₂,a₃,a₄,a₆; all five become 0 in the zero ring | Pass | Duplicate definitions deleted |
| Native specialization, README:405–409 | W=(0,0,0,−1,0); a₁=2,a₃=3 | A₄↦−1; 1+A₁A₃↦1+2·3=7; zero↦0. In the zero ring 7=0 as well | Pass | Native map used |
| coefficientWeight, Lean:45 | A₁A₃,A₄,A₆ | 1+3=4,4,6; unweighted degrees 2,1,1 differ | Pass | Reindexed by Coeff |
| IsIntegralModularForm, Lean:39 | Zero polynomial, any k and any ring | Both evaluations 0; u⁻ᵏ·0=0, including the zero ring | Pass | Native specialization |
| isIntegralModularForm_iff, Lean:52 | f=1, k=0 and 4, u=2 over ℚ | k=0: 1=1 and homogeneous degree 0; k=4: 1≠1/16 and degree 0≠4 | Both directions pass | Headline retained |
| Same iff, native scaling | W=(0,0,0,−1,0), f=c₄, u=2 | c₄=48; transformed value 3=48/16 at k=4; 3≠48/32 at k=5 | Both directions pass | No generality lost |
| Same iff, non-invariants | Zero coefficients, s=1 for a₁; r=1 for b₂ | a₁ changes 0→2; b₂ changes 0→12; prescribed scalar times original is 0 in both | Negative controls pass | Homogeneity alone excluded |
| Same iff, mixed weights | f=c₄+Δ, universal scaling u | Actual coefficients u⁻⁴ and u⁻¹²; a single weight demands both equal u⁻ᵏ, impossible since 4≠12 | Both sides reject | Subring alone insufficient |
| All-ring quantifier | f=1,k=4 on ℤ versus ℚ | ±1 gives u⁻⁴=1 on ℤ; u=2 gives 1/16≠1 on ℚ | Pass | All coefficient rings retained |
| Kernel headline, Lean:63 | W=(0,0,0,−1,0); zero coefficients | (c₄,c₆,Δ)=(48,0,64); 48³−0−1728·64=110592−110592=0. At cusp, 0−0−0=0 | Pass | Native universal curve |
| Kernel converse controls | Formal constant 1; relation monic in C₆² up to sign | 1 maps to 1≠0; generator maps to 0. Quotient basis over ℤ[C₄,D] is 1,C₆, hence no integer torsion | Pass | Full kernel, not one relation |
| Predicate API, README:398–402 | 2c₄ and c₄² at preceding W,u | Values 96→6=96/16; 2304→9=2304/256; product weight 4+4=8 | Pass | Addition/scalars/product preserved |
| E4.U vanishings and division, README:1248–1277 | Four specified bidegrees; τ² | Mod-τ groups at (21,1),(21,2),(20,2),(20,3) are 0; outer τ²-quotient groups 0,0 give kernel=cokernel=0 | Pass against sampled proof | Dependency reread |
| E4.U reduction and choice | g=1,5 in ℤ/8 | 4·1=4=4·5; 4y=4 has four solutions 1,3,5,7; τ²-isomorphism supplies the unique divided lift | Pass | Choice retained |
| E4.U d₅ at 2 | Δ=(24,0), h₂=(3,1), g=(20,4) | Differential target (23,5)=(3+20,1+4); undivided filtration would be 3 | Pass | Sample reread |
| E4.U h₂g, README:1306–1311 | Generator in ℤ/4 | 2·1=2≠0; 4·1=0; 5·1=1 | Pass | R01 repaired |
| E4.U d₅ at 3 | α₁=(3,1),β₁=(10,2) | α₁β₁²=(23,5); multiplying by β₁ gives (33,7), the sphere obstruction target | Pass | Sample reread |
| Measure/character contract, README:93–98,154–162 | δ₁, δ₁−δ₋₁; k=0,1,2,3 | δ₁ moments 1,1,1,1; difference moments 0,2,0,2; mass 0 does not force zero measure | Pass | R03 repaired |
| Kummer definition, README:1581–1585 | Zero sequence; Dirac at a | Every test gives 0 or h(a)∈ℤ_p; h=(x⁶−x⁴)/8 at p=2,a=3 gives (729−81)/8=81 | Pass | Precise finite-test quantifier |
| Kummer negative control | p=2, integer sequence z₄=0,z₆=1 | h=(x⁶−x⁴)/8 is integral on odd units, but assigned value (1−0)/8=1/8∉ℤ₂ | Pass | Individual moment integrality rejected |
| Orientation integrality, README:1587 | G₄; G₆; zero sequence | B₄/8=−1/240 cancels G₄(0)=1/240; B₆/12=1/504 cancels G₆(0)=−1/504. Zero sequence leaves −1/240∉ℤ | Pass | Criterion excludes zero genus |
| Odd weights, README:1592 | k=5 and −I | Weight action −1 gives g₅=−g₅, so g₅=0 over ℚ; B₅=0 and prescribed G₅=0 agree | Pass | No odd Eisenstein substitute |
| Smoothed moments, README:1589,1646–1651 | k=4,(p,c)=(2,3),(3,2) | Constants (1−81)(1−8)/240=7/3 and (1−16)(1−27)/240=13/8; q coefficients −80,−15 | Pass | Both small primes included |
| Smoothing negative controls | Same p,c; omit smoothing; c=1 | Constants −7/240,−13/120 have valuations −4 at 2 and −1 at 3; c=1 gives 0 in every coefficient and the zero measure | Pass | Essential factor tested |
| Mixed Kummer congruence at 2 | c=3,h=(x⁶−x⁴)/8 | z₄(0)=7/3,z₆(0)=−403/9; difference/8=−53/9∈ℤ₂. q coefficient (−728+80)/8=−81 | Pass | New independent cross-weight test |
| Mixed Kummer congruence at 3 | c=2,h=(x⁶−x⁴)/3 | z₄(0)=13/8,z₆(0)=−121/4; difference/3=−85/8∈ℤ₃. q coefficient (−63+15)/3=−16 | Pass | New independent cross-weight test |
| Even-character quotient, README:1593 | x⁴,x⁵ at 1 and −1 | x⁴ gives 1,1 and descends; x⁵ gives 1,−1 and does not. δ_[1] even moments are 1 | Pass | Quotient restricted to even moments |
| Hecke condition, README:1590,1652–1655 | G₄,p=2,3 | q coefficients 1+2³=9 and 1+3³=28; constants 9/240 and 28/240 agree with eigenvalues | Pass | Supplied arithmetic normalization |
| Hecke further control | p=2, coefficient q²; swapped formula at q | Correct: σ₃(4)+8σ₃(1)=73+8=81=9σ₃(2). Swapped formula gives q coefficient 8·9=72≠9 | Pass | Source misprint not copied |
| Orientation existence criterion, README:1585–1594 | Eisenstein sequence; g=0; c=1 only | G has integral corrected coefficients and eigenvalues 9,28; g=0 fails constant test −1/240. c=1 alone gives all smoothed values 0 and cannot replace all units | Pass against theorem and controls | Full three-condition iff |


**Inherited adversarial rows (129).** Each row below carries forward the indicated values from [r4], rather than claiming a fresh calculation. Colon-only line locators in this table refer to README at ad9b70f. The 19 superseded rows are replaced by the 30 fresh rows above. Total: 159 value-bearing rows.

| Statement / previous location | Instances tried | Computed values on the two sides | Result | Provenance |
|---|---|---|---|---|
| Moduli groupoid comparison, :157 | y²=x³−x over ℚ | Identity and negation give 2 distinct arrows; j gives 1 point and loses both-arrow distinction | Pass | Inherited [r4] |
| Pullback laws, :173 | Identity and R→S→T | aᵢ↦aᵢ; successive images g(f(aᵢ))=(g∘f)(aᵢ) | Pass | Inherited [r4] |
| Stable locus, :176 | Nodal cubic; cusp | (c₄,Δ)=(16,0) generates 1 over ℚ; (0,0) does not | Pass | Inherited [r4] |
| Étale site and cover convention, :180 | Empty test; identity cover | Module sections 0 on empty; equalizer M⇉M is M | Pass | Inherited [r4] |
| Derived sections / atlas normalization, :182 | Affine Spec A, module M | H⁰=M, H¹=0; inserting identity leaves M,0 | Pass | Inherited [r4] |
| Local cohomology triangle, :187 | Empty and full support | 0→C→C and C→C→0; complementary terms C and 0 | Pass | Inherited [r4] |
| Duality away from 6, :192 | k=0 and wrong dual O | H⁰(O)=R, H¹(ω⁻¹⁰)=R, pairing 1; H¹(O)=0, wrong pairing 0 | Pass | Inherited [r4] |
| Integral stabilizers, :195 | Trivial C₂ on ℤ | H²=ℤ/2, whereas a dimension-one truncation gives 0 | Pass | Inherited [r4] |
| Weierstrass invariants, :230 | Γ₁(3), (a₁,a₃)=(0,1) | (c₄,c₆,Δ)=(0,−216,−27); c₄³−c₆²=−46656=1728Δ | Pass | Inherited [r4] |
| Same invariant relation | (a₁,a₃)=(1,0) | (1,−1,0); 1−1=0=1728·0 | Pass | Inherited [r4] |
| c₆ normalization, :236 | Tate q=0, first q coefficient | c₆=−1+504q; opposite convention 1−504q | Pass | Inherited [r4] |
| Native weights, :240 | u=2 over ℚ | c₄ factor 1/16, c₆ factor 1/64, Δ factor 1/4096 | Pass | Inherited [r4] |
| Smooth/nodal/cusp distinction, :245 | a₂=1; all zero; a₆=1 | (16,−64,0); (0,0,0); (0,−864,−432) | Pass | Inherited [r4] |
| Coordinate group multiplication, :267 | C=(1,1,0,0), C′=(1,0,1,0) | CC′=(1,1,1,1), C′C=(1,1,1,0) | Pass; nonabelian control | Inherited [r4] |
| Coordinate maps / coproduct, :270–278 | First r₁=1, second s₂=1, units 1 | Composite parameter t=t₁+t₂+s₁r₂=0; reversed order gives 1, matching native reversed product | Pass | Inherited [r4] |
| Invariant differential, :280 | Scaling u=2 | dx scales 4, denominator scales 8; pullback factor 4/8=1/2 | Pass | Inherited [r4] |
| Infinitesimal coordinate change, :316 | r=ε, ε²=0, initial a₂=0 | New a₂=3ε; inverse returns 0, not 3ε | Pass | Inherited [r4] |
| Riemann–Roch presentation, :319 | Smooth genus one; pointed rational node | h⁰(2e)=2, h⁰(3e)=3, h¹=0 in both | Pass | Inherited [r4] |
| Hartogs locus, :298 | Universal atlas; nodal point | Cusp support codimension 2 versus Δ divisor codimension 1; nodal Δ=0 but c₄=16 | Pass | Inherited [r4] |
| Analytic comparison, :386 | Weight 0,4,6 | 1↦1; c₄=1+240q; c₆=−1+504q | Pass | Inherited [r4] |
| Holomorphy at cusp, :399 | Δ and Δ⁻¹ | q−24q² versus q⁻¹+24; valuations 1 and −1 | Pass | Inherited [r4] |
| Weight-12 relation | First q coefficient | 3·240−2(−1)·504=1728=1728·1 | Pass | Inherited [r4] |
| Tate formal group, :404 | q=0, p=2,3 | [2](X)=X² in char 2, [3](X)=X³ in char 3; additive law gives 0 | Pass | Inherited [r4] |
| Deformation dimension, :421–426 | Heights 1,2 | Rings W(k), W(k)[[u₁]]; ordinary elliptic extension adds one parameter | Pass | Inherited [r4] |
| Marked infinitesimal deformation | k[ε]/ε² | Extension parameters 1 and 1+ε differ; connected formal group unchanged | Pass | Inherited [r4] |
| Landweber condition, :465 | Nonzero characteristic-p field | p·1=0 with 1≠0; injectivity false | Correct exclusion | Inherited [r4] |
| Height cutoff, :490 | Multiplicative law; height 2 deformation | R/(p,v₁)=0 in first; k after (p,u₁) in second, then v₂ invertible | Pass | Inherited [r4] |
| Periodic coefficient ring, :464 | Degrees −2,0,2 | Ru⁻¹,R,Ru; u⁻¹u=1; R[u] has negative group 0 | Pass | Inherited [r4] |
| Continuous fixed points, :500 | Trivial group | X^h1=X; H_c^s(1,M)=0 for s>0 | Pass | Inherited [r4] |
| Translation difference, :509 | 1,x,binomial(x,2) | Differences 0,1,x respectively | Pass | Inherited [r4] |
| Continuous cooperations, :511 | Disjoint clopen indicators e,f | ef=0, e²=e; nonconstant polynomial idempotents over ℤ_p absent | Pass | Inherited [r4] |
| Morava realization, :530 | h=1,2, k=𝔽_p | π₀=ℤ_p, ℤ_p[[u₁]]; reduction mod maximal ideal 𝔽_p | Pass | Inherited [r4] |
| Semilinear action | a∈𝔽_(p²) outside 𝔽_p | Frobenius a↦a^p≠a; identity action would give a | Pass | Inherited [r4] |
| Adams projectivity, :557 | A⊕A vs A/p, A=ℤ_p | Hom=M⊕M, positive Tor=0; Tor₁(A/p,A/p)=𝔽_p | Pass | Inherited [r4] |
| Cotangent/obstruction inputs, :562 | Identity, étale, polynomial extension | L=0,0,A[x]dx; corresponding Hom groups 0,0,M | Pass | Inherited [r4] |
| Igusa tower, :585 | p=2 levels 1,2; p=3 level 1 | Inversion 1 mod 2; 3 mod 4≠1; 2 mod 3≠1 | Pass | Inherited [r4] |
| Infinite Igusa −1 action, :608 | (C,φ) and (C,φ∘[−1]) | Isomorphism [−1] identifies the pairs; degree-zero invariant functions equal | Pass | Inherited [r4] |
| Canonical subgroup / θ | Tate(q), f=1+q, p=2,3 | q↦q²,q³; θ(f)=−q,−q−q²; identity at 2 gives nonintegral (−q−q²)/2 | Pass | Inherited [r4] |
| Odd-prime averaging, :627 | p=3 versus C₂ at p=2 | 1/2∈ℤ₃, 1/2∉ℤ₂ | Pass | Inherited [r4] |
| Reduced KO algebra, :632 | Degrees 0,1,2,3 | ℤ₂,ℤ/2,ℤ/2,0; KU would have degree 1 zero | Pass | Inherited [r4] |
| Étale ordinary lift, :650 | Identity chart | Relative cotangent 0, obstruction groups 0, induced map identity | Pass | Inherited [r4] |
| Supersingular full level, :670 | N=3, p≠3 | GL₂ order (9−1)(9−3)=48; fixed determinant subgroup order 24 | Pass | Inherited [r4] |
| Completion square regularity, :691 | A=ℤ_p[[v]] | A/(p,v)=𝔽_p; v injective mod p; v=0 instead gives zero multiplication | Pass | Inherited [r4] |
| Completion exactness, :697 | Split sequence; multiplication by p | Split reductions stay exact; p:𝔽_p→𝔽_p is zero in nonsplit control | Pass | Inherited [r4] |
| Arithmetic rationalization, :712 | Tuple (1/p)_p | Each component lies in ℚ_p; no integer denominator works for all primes | Pass | Inherited [r4] |
| Sheaf homotopy, :763 | Chart with ω trivial | π₀=R, π₁=0, π₂=Ru, π₋₂=Ru⁻¹ | Pass | Inherited [r4] |
| Sheaf tensor / transitions | u=2,k=1; inverse twist | Factor 1/2; u⁻¹u=1 identifies ω⁻¹⊗ω with O | Pass | Inherited [r4] |
| Global DSS, :787 | (s,k)=(0,4),(1,4) | Stems 8,7 from 2k−s | Pass | Inherited [r4] |
| Connective cover, :796 | Degrees 0 and −1 | π₀tmf=π₀Tmf; π₋₁tmf=0 | Pass | Inherited [r4] |
| Compact versus periodic | Away from 6, Δ⁻¹ | π₋₂₄tmf=0; π₋₂₄TMF contains Δ⁻¹≠0 | Pass | Inherited [r4] |
| KO[[q]] limit, :815 | Truncations m=1,2 | a₀; a₀+a₁q; split transition maps give lim¹=0 | Pass | Inherited [r4] |
| Boundary evaluation, :833 | 1,q,a₀+a₁q | 1,0,a₀; q⁻¹q prevents extension to Laurent ring | Pass | Inherited [r4] |
| Completed multiplication | (1−q)Σqⁿ | Coefficients 1,0,0,…; polynomial inverse absent | Pass | Inherited [r4] |
| Laurent localization | q⁻¹q and Σq⁻ⁿ | First 1; second unbounded below, hence outside ring | Pass | Inherited [r4] |
| Cubic vs compactified cohomology, :867 | Negative weights and k=−10,−9 | Cubic has no negative monomials; away from 6 compactified H¹ values R,0 | Pass | Inherited [r4] |
| Sphere bracket, :906 | κ,2,η,ν | Stem 14+0+1+3+2=20; choices 1,5 in ℤ/8; indeterminacy 0,4 | Pass | Inherited [r4] |
| Sphere relation / nullhomotopy | 4κ̄, ν³κ̄ | 4 in ℤ/8 has order 2; latter stem 29 has 2-local group 0 | Pass as sourced inputs | Inherited [r4] |
| κ detection, :916 | ηκ and ⟨2ν,ν,ε⟩ | Both stem 15; Massey indeterminacy groups at (12,2),(7,1) are 0 | Pass | Inherited [r4] |
| Sphere 3-primary d₅, :932 | β₃/₃, α₁β₁³ | (s,t)=(2,36)→(7,40); stems 34→33 | Pass | Inherited [r4] |
| Synthetic site / zero object, :976 | Zero, P⊕Q, identity cover | Sections 0, product of sections, original sections | Pass | Inherited [r4] |
| Synthetic spheres / τ, :993 | τ² and τ-inversion | (20,4)→(20,2); S^(n,s)↦S^n; Cτ^k↦0 | Pass | Inherited [r4] |
| Connecting map, :1000 | k=j=1 | Target Σ^(1,−2)R/τ | Pass | Inherited [r4] |
| Iterated quotient splitting, :1002 | s=k=1 | R/τ⊕Σ^(1,−3)R/τ; second shift differs from connecting-map shift | Pass | Inherited [r4] |
| Local Cτ/comodule comparison | Zero, unit, internal shift 2 | 0↦0, unit↦MU_*; degree 2 shift distinct from cochain shift 1 | Pass | Inherited [r4] |
| Signature direction, :1016 | Transition n=1 | τ:shift (0,−1)→(0,0), not its reverse | Pass | Inherited [r4] |
| Even/full comparison, :1067 | Unit, T₁, T₋₁ | Generators in 0,−2,+2 correspond to O,ω,ω⁻¹ | Pass | Inherited [r4] |
| Parity projections | Degree-1 object; zero; unit | (even,odd)=(0,M),(0,0),(unit,0) | Pass | Inherited [r4] |
| Ext/Hodge dictionary, :1072 | s=0, internal degrees 0,2 | Weights 0,1; rational Hodge character exponent 1 has no integral half-character | Pass | Inherited [r4] |
| Parity tensor, :1097 | (0,O) squared/cubed | Square (ω⁻¹,0); cube (0,ω⁻¹) in either association | Pass | Inherited [r4] |
| Internal and cochain braiding | (a,i)=(0,1),(b,j)=(1,0) | Original +1; tensor sign −1; total stem braiding −1 | Pass | Inherited [r4] |
| Totalized differential | Internal degrees 1 and 0 | Identity becomes −identity and +identity respectively; square still 0 | Pass | Inherited [r4] |
| Derived pushforward unit, :1143 | Identity and zero maps | Identity sends 1→1, product 1→1; zero sends 1→0 | Pass | Inherited [r4] |
| Pushforward parity | Structure sheaf versus arbitrary (0,Q) | Q=0 gives odd groups 0; arbitrary Q gives H^s(Q⊗ω^k) | Pass | Inherited [r4] |
| Synthetic sphere relation, :1174 | κ=(14,2), ν=(3,1) | ν²κ=(20,4), τ²ν²κ=(20,2)=degree of 4κ̄_S | Pass | Inherited [r4] |
| Finite τ-torsion, :1177 | ν³κ̄_S and exponent N | Degree (29,5−N); N=0 not inferred from vanishing after inversion | Pass | Inherited [r4] |
| Smf mod-τ comparison, :1196 | (0,0),(1,0),(8,0),(−21,1) | ℤ,0,H⁰(ω⁴),H¹(ω⁻¹⁰); last R after inverting 6 | Pass | Inherited [r4] |
| Cubic map Φ range, :1293 | (8,0),(−21,1) | 0≤20 true; 5≤−9 false, so negative duality class not in asserted isomorphism range | Pass | Inherited [r4] |
| Finite transfer / projection formula | Identity; double identity, (a,b,c)=(1,2,3) | Trace 1; trace (1,1)=2; Tr((a,b)c)=9=(a+b)c | Pass | Inherited [r4] |
| Γ₁(3) trace basis, :1313 | (a₁,a₃)=(1,1) | (8,−4,2,−1,−11/3,−2,26/3,−101/3) | Pass against source | Inherited [r4] |
| Transfer normalization, :1318 | (1,1) | Tr(η_R(a₃²))=−362/27; multiplying by 27 gives −362=2c₆ | Pass | Inherited [r4] |
| Odd traces / c₄ trace | (1,1) | Tr η_R(a₁)=Tr η_R(a₃)=0; Tr(3η_R(a₁a₃))=−46=2c₄ | Pass | Inherited [r4] |
| Higher trace tests | (1,1) | Tr η_R(a₁⁴)=−552=24c₄; Tr η_R(a₁³a₃)=−362=2c₆ | Pass | Inherited [r4] |
| Trace at degenerate cusp | (a₁,a₃)=(0,0) | Tr1=8, other seven basis traces 0; c₄=c₆=0 | Pass | Inherited [r4] |
| Level DSS collapse | Filtrations s=0,1 only | For r≥2 targets have s+r≥2; all such targets 0 | Pass | Inherited [r4] |
| ν₆ fourfold system, :1358 | Entries of stems 99,3,3,40 | Sum+2=147, not 51 | Pass | Inherited [r4] |
| Higher shuffle / d₂₃, :1363–1368 | κ̄⁶ and h₁Δ⁵ | τ²²κ̄⁶ has degree (120,2); d₂₃:(121,1)→(120,24) | Pass | Inherited [r4] |
| Gap theorem, :1370 | n=−21,−20,−1,0 away from 6 | Groups R,0,0,R; open interval excludes both nonzero endpoints | Pass | Inherited [r4] |
| Sixfold detection, :1421 | ν,2ν,ν,4ν,ν,η | Stem 3+3+3+3+3+1+4=20 | Pass | Inherited [r4] |
| Sixfold stem 110 / locality | κ,4ν,3ν,2ν,ν,κ̄⁴ | 14+3+3+3+3+80+4=110; 12=4 mod 8, not mod 24 | Pass | Inherited [r4] |
| Coefficients away from 6 | Degrees 0,8,12,24 | R, Rc₄, Rc₆, rank-2 span c₄³,c₆²; Δ=(c₄³−c₆²)/1728 | Pass | Inherited [r4] |
| Bernoulli normalization, :1443 | B₄=−1/30,B₆=1/42 | G₄(0)=1/240,G₆(0)=−1/504; scaled constants 1,−1 | Pass | Inherited [r4] |
| Permanent periods, :1449 | p=2,3; integral | 24·8=192,24·3=72,24·24=576 | Pass | Inherited [r4] |
| Hopkins edge image, :1459 | i=j=0,k=0,…,6 | Coefficients 1,24,12,8,6,24,4; gcd(24,0)=24 | Pass | Inherited [r4] |
| Edge j=1 branch | c₆, c₆Δ | Required coefficient 2 in both; coefficient 1 excluded | Pass | Inherited [r4] |
| Periodic edge, :1464 | Δ⁻¹ | Weight −12, stem −24; connective group zero, periodic section nonzero | Pass | Inherited [r4] |
| bstring/BString, :1501 | Degrees 8,9,10,11,12 | ℤ,ℤ/2,ℤ/2,0,ℤ; complex cover instead ℤ,0,ℤ,0,ℤ | Pass | Inherited [r4] |
| Connected cover / Thom unit | i=3,4 and relative first cell 8 | π₃MString=ℤ/24, π₄MString=0; π₄MSpin=ℤ | Pass | Inherited [r4] |
| gl₁ and bgl₁ | Hℤ,H𝔽₂,zero ring | π₀gl₁: C₂,0,0; π₁bgl₁(Hℤ)=C₂,π₀=0 | Pass | Inherited [r4] |
| Thom construction | Point and trivial fibration over S¹ | S; Σ∞_+S¹ with cells 0,1; omitting '+' loses degree 0 | Pass | Inherited [r4] |
| J and orientation unit | Zero bundle / point | J=0, Thom unit 1→1; zero spectrum/map cannot satisfy this | Pass | Inherited [r4] |
| Orientation and ABS comparison | q=0 | x/(2sinh(x/2))=1−x²/24+7x⁴/5760+… on both sides | Pass | Inherited [r4] |
| Logarithm / characteristic sequence | x⁴ term | log coefficient 1/2880; divided-power coefficient 1/120=2G₄(0) | Pass | Inherited [r4] |
| Degree cutoff in bstring | k=2 versus k=4 | π₄bstring=0; π₈bstring=ℤ; first retained sequence index 4 | Pass | Inherited [r4] |
| Moment congruences | p=2,a=3; p=3,a=2 | a^p−a=6 in each; divisible by corresponding p | Pass | Inherited [r4] |
| Orthogonal fibre / stable range | O(10)/O(9), π₁₂S⁹ | Quotient dimension 9; 12≤2·9−2=16, stable stem 3 | Pass | Inherited [r4] |
| Clutching boundary | 2ν in ℤ/24 | Order 24/gcd(24,2)=12; image even residues, excludes ν | Pass as sourced input | Inherited [r4] |
| B²String, :1629 | Single vs double suspension | Single (π₉,π₁₂,π₁₃)=(ℤ,0,ℤ); double=(0,ℤ/2,0) | Pass | Inherited [r4] |
| N and BP_*B | Degrees 0,8,12,16,20,24 | Monomial counts 1,1,1,1,1,2 from 8i+12j | Pass | Inherited [r4] |
| B→tmf low comparison | ζ₁⁸,ζ₂⁴,ζ₃² | Degrees 8,12,14; first absent class 14, consistent with comparison through 12 | Pass | Inherited [r4] |
| B-side higher lifts | Sixfold and two threefold targets | 110; 3+99+20+1=123; 8+99+20+1=128 | Pass | Inherited [r4] |
| Independent sevenfold systems | Six ν entries or ε plus five ν entries | 18+100+5=123; 8+15+100+5=128 | Pass on degrees; systems need proofs | Inherited [r4] |
| E₁ Thom quotient, :1681 | Bottom σ, relative attachment | σ stem 7 killed in S//σ; attachment stem 11; π₇BP=π₁₁BP=0 | Pass | Inherited [r4] |
| James filtration, :1698 | S⁸ stages 0,1,2 | Cell degrees 0,8,16; second loop generator adds degree 12 | Pass | Inherited [r4] |
| B∧DA(1) / T(2) | Rational series | Product gives 1/((1−t²)(1−t⁶)); first degrees 0,2,4,6 with rank 2 at 6 | Pass | Inherited [r4] |
| Orientation surjectivity lifts | k=0,1 | c₄,2c₆,c₄Δ,2c₆Δ in degrees 8,12,32,36, with allowed edge coefficients 1,2,1,2 | Pass | Inherited [r4] |
| Divisorial log structure | q=0 and q invertible | Characteristic monoids ℕ and 0 | Pass | Inherited [r4] |
| Kato chart test | q=t^N,N=1,2,3 | Group cokernel 0,ℤ/2,ℤ/3; N=3 not invertible in char 3 | Pass | Inherited [r4] |
| Ordinary/log comparison | q=t² at boundary, char≠2 | Scheme derivative 2t=0 at t=0; log index 2 invertible | Pass | Inherited [r4] |
| Level-one / full-level descent | N=1 and full N=3 | Identity map; 48 bases versus 24 at fixed pairing | Pass | Inherited [r4] |
| Néron contraction | n=1,2 | Component maps ℤ/1→0 and both elements of ℤ/2→0 | Pass on components | Inherited [r4] |
| Level cusp width | q=t² | Δ=q+… pulls back to t²+…; order 2, not 1 | Pass | Inherited [r4] |
| DA(1) construction | Q cells 0,2,6 | Q∧DQ degrees −6,−4,−2,0,0,0,2,4,6; χQ=3 | Pass | Inherited [r4] |
| DA(1) splitting | Remove one zero cell, suspend 6 | 0,2,4,6,6,8,10,12; 3 invertible at 2, noninvertible at 3 | Pass | Inherited [r4] |
| DA(1) homology | 0≤a≤3,0≤b≤1 | Degrees 2a+6b give same eight cells and polynomial 1+t²+t⁴+2t⁶+t⁸+t¹⁰+t¹² | Pass | Inherited [r4] |
| Attaching maps vs wedge | Bottom Sq²,Sq⁴ | Both nonzero; wedge has both zero and surviving η above each cell | Pass | Inherited [r4] |
| tmf₁(3) headline | (a₁,a₃) weights 1,3 | Spectral degrees 2,6; no odd polynomial groups; degree-6 rank 2 | Pass | Inherited [r4] |
| Level invariant comparison | (a₁,a₃)=(0,1),(1,0) | (0,−216,−27),(1,−1,0), agreeing with E1 native signs | Pass | Inherited [r4] |
| Localization kernel, :1856 | x=0,1; j=0,1 | 1·0=0; D^j·1≠0 rationally; degree shifts 0 and 576 | Pass | Inherited [r4] |
| Torsion versus q-expansion | η∈π₁tmf | η≠0; modular-form edge has no odd component, hence 0 | Pass | Inherited [r4] |

## Not verifiable

- This incremental review does not reconstruct all finite BP-cobar reductions, higher defining systems, graphical descent charts or integral tmf extensions. The unchanged proof-verification limits in [r4] remain; inherited rows are not presented as fresh proofs.
- Ownership against open pull requests without supplied files was not checked. Search-index hits without a supplied checkout were not used to assign ownership or impose dependencies.
- No source-access issue remains for the changed passages or E4.U sample. The three texts needed for this incremental review were legally readable; no missing-reference request was added.

## Source issues

- **Misprint** in ahr-ko-tmf at §11, printed page 36: the source says U substitutes qᵖ and V extracts coefficients indexed by multiples of p; it should interchange U and V in that display; affects the proof.
- **Misprint** in ahr-ko-tmf at §12 introductory Hecke formula, printed page 38: the source says T(p)f equals f(qᵖ) plus p^(k−1) times coefficient extraction; it should weight f(qᵖ), leaving coefficient extraction unweighted; affects a stated result.
- **Misprint** in cdvn-dss-tmf at Proposition 5.4 proof, printed page 50: the source places ηκ in stem 14; it should be stem 15; affects nothing.

The AHR witnesses are ahr-ko-tmf line 1912 and line 2005; its proof at line 2367 uses the corrected convention. At weight four and p=2, the erroneous q coefficient is 72, whereas the claimed eigenvalue gives 9. The roadmap's supplier and Check give 9. The CDvN witness is cdvn-dss-tmf line 1795; 1+14=15. Other errata already recorded in [r4] were outside the changed source sample and were not re-audited.

[r4]: packages/EllipticCohomology/reports/PRREVIEW-EllipticCohomology~4.md
