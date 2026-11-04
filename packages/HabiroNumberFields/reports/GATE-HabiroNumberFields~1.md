## H01 (CBirkbeck) — applied

`TauCetiRoadmap/HabiroNumberFields/README.md:934` replaces p-adic powers of whole Chern-valued factors by a normalized logarithmic sum and the separately retained root e_m(ξ); lines 940 and 949 require torsor transport and presentation independence, and line 991 consumes this construction in the original global degree. The cubic eta witness at line 956 has completed image zero and nontrivial cubic Chern torsor over ℚ₅(ζ₃), under either sign, so the empty presentation no longer identifies it with degree zero (H2024 line 271; GSWZ line 2168).

## H02 (CBirkbeck) — applied

The presumed local-regulator supplier is replaced by explicit targets in `TauCetiRoadmap/HabiroNumberFields/README.md:824` and line 841: the completed Suslin comparison, integral Coleman lattice isomorphism, finite root-class presentations, and full-product restriction/transfer diagrams. These are precisely the previously required inputs, with divided Bloch root classes imported from K3BlochGroups §§6.3–6.4, completed carriers and semilocal maps from KTheoryFiniteLocalFields §§6.7–6.10 and 7.6, and Coleman evaluation from ColemanIntegration L2.Fb; GSWZ line 1975, line 1995, line 1998 and line 2015 supply the lattice and generation argument, while the transfer comparison is explicitly owned here.

## H03 (CBirkbeck) — applied

`TauCetiRoadmap/HabiroNumberFields/README.md:79` changes the advertised general Chern corestriction law to the supplier's actual ring-map naturality and finite-field edge transfer law. Line 1198 now assigns the selected signed degree-three Chern/étale-edge comparison, positive Kummer norm square and coherent torsor norm isomorphism to §3.18, using ArithmeticKTheory §§5.2 and 5.4 and KTheoryFiniteLocalFields §6.5a, retaining dyadic real-place corrections and every positive order.

## H04 (CBirkbeck) — applied

`TauCetiRoadmap/HabiroNumberFields/README.md:353` changes the diagonal claim from z=1 and a universally vanishing denominator to zⁿ=1 with the theorem's explicit diagonal exclusion. At n=2, ζ=−1, x=y=2, z=−1, D(ζ/z)=2 and the denominator product is −3; vanishing at z=1 requires n>1, whereas D is identically one at n=1.

**Ownership, sources and signatures.**

Main was verified at fe5400174e8f9e8ce96423e5122b6dc4c5acf632; the indexed open heads and the supplied sibling checkouts, together with the board packages, were searched by object for completed local K₃, root generation and integral Coleman regulators. No PadicHodgeRegulators roadmap exists on that main or among the 338 indexed open roadmap heads; HabiroNahmSeries's local-regulator contract explicitly records the gap, KTheoryFiniteLocalFields excludes regulator construction, and ColemanIntegration supplies the functions and Bloch evaluation rather than the integral completed comparison. Thus §§3.0a–3.0b own the required bridge without reconstructing any supplier's generic carrier, Bloch root class or completion map; no notion was moved from a later supplier.

Cross-roadmap citations resolve against main and the open heads with no missing roadmap citations or Lean names. The changed contracts were read at their available heads: K3BlochGroups §§6.3–6.7, KTheoryFiniteLocalFields §§1.8, 6.5a–6.10 and 7.2/7.6, ColemanIntegration L2.Fb and L2.16–L2.18, and ArithmeticKTheory §§5.2 and 5.4; in particular §1.8's general API does not assert field corestriction. Existing cached legal texts suffice; no additional work or source key is cited. GSWZ Theorem 9 states the lattice and root generation, and its proof does not state the full functorial diagrams; the README labels those as additional comparison targets.

The Mathlib pin was verified as 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti as a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Searches at those pins found no Bloch, completed algebraic K₃ or Coleman carrier supporting the added headlines, so `TauCetiRoadmap/HabiroNumberFields/Suggested.lean:12` records the missing carriers instead of adding stand-ins. A scratch module containing all six declarations and `#check @name` for each was elaborated once; all six resulting types exactly match the supplied earlier signatures and their README statements, with zero missing hypotheses and no signature changes. Only the module docstring changed in Lean.

**Adversarial mathematics pass.**

The table records every distinct mathematical assertion added or changed and the affected retained acceptance signatures; algebraic model calculations test the stated laws and do not constitute proofs of the roadmap's targets. In finite-field rows, ζ is the displayed primitive root, and all admissible inputs were enumerated with exact field arithmetic.

| Statement | Instances tried | Computed values on both sides | Result | Change |
| --- | --- | --- | --- | --- |
| Completed Suslin comparison, §3.0a | Root order 3, p=5, levels 5 and 25 | Inverse multipliers 2 and 17; 3·2≡1 mod 5, 3·17≡1 mod 25; 17 mod 5=2 | Coherent finite reductions | Own comparison; import divided root classes |
| Raw-symbol domain of completed root class | Primitive sixth root in ℚ₇ | Nonzero boundary has order 2; squares mod 7 are {1,2,4}, so −1 is nonsquare; modulo 7ᵃ that boundary is 0 | Integral raw symbol fails, divided coefficient class exists | Explicit negative Check |
| Choice of annihilating root multiple | Order 3 at p=5, use multiples 3 and 6 | 3⁻¹·3=1 and 6⁻¹·6=1 in ℤ₅; mod 25, 17·3=1 and 21·6=1 | Same divided class | Import K3BlochGroups §6.4 independence |
| Product support of ρ_(i,ζ) | L=ℚ₅×ℚ_(5²), class supported on second factor | Projections (0,ρ); first coordinate 0 before/after coefficient reduction | No selected-factor loss | Factor-supported construction |
| Root-class field and permutation naturality | Two equal factors, swap twice | (0,ρ)→(ρ,0)→(0,ρ); identity gives (0,ρ) | Identity and composition agree | Explicit comparison law |
| Completed rank in §3.0a | Empty algebra, ℚ₅, ℚ₅×ℚ_(5²) | Ranks 0, 1, 1+2=3 on K₃ and lattice sides | Both directions retain all factors | General product comparison |
| Unramified p>3 domain | ℚ₃ and a primitive fifth root over ℚ₅ | K₃(ℚ₃;ℤ₃)=ℤ₃⊕ℤ/3 versus torsion-free 9ℤ₃; ℚ₅(ζ₅) has ramification degree 4>1 | Both outside asserted domain | Keep source hypotheses; add torsion Check |
| Coleman root-value normalization | p=5, ζ³=1, ζ≠1 | li₂,₅(ζ)=3ζ; (3ζ)/(ζ−1)⁵=4+3ζ | Matches GSWZ reduction formula | Positive normalization witness |
| Second independent root value | p=5, fourth root i reducing to 2 | li₂,₅(2)=1 and (2−1)⁵=1, giving scaled value 1 | Nonzero scalar direction | Explicit scalar Check |
| Root-value spanning in degree two | Values for i and ζ⁵ on basis (1,ζ) | Columns (1,0),(4,3) have determinant 3 mod 5≠0 | Span dimension 2 | Rules out zero map and a p-rescaling |
| Integral lattice coefficient convention | p=5, quotient at a=1 | 25ℤ₅/125ℤ₅ has 5 elements; image of 25ℤ₅ in ℤ₅/5ℤ₅ is 0 | Ambient reduction would be wrong | Specify p²O/pᵃ(p²O) |
| Lattice injectivity boundary | p=3, order-three completed torsion t | t≠0 but 3D(t)=D(3t)=0 forces D(t)=0 in ℚ₃ | No p=3 isomorphism | Explicit negative Check |
| Finite presentation and zero | Empty presentation of zero | Σ∅=0 and D(0)=0; empty product algebra gives 0→0 | Valid zero and empty cases | Finite sums tied to completed equality |
| Equality of presentations iff zero difference regulator | Model x and x, then x and x+ρ with scaled D(ρ)=1 mod 5 | First difference 0→0; second difference ρ→1≠0 | Both directions distinguished | Use injectivity after lattice theorem |
| Regulator restriction on full products | Diagonal ℚ₅→ℚ₅×ℚ₅, D(η)=25 | D(res η)=(25,25)=res(25) | Source and target agree | Own naturality diagram |
| Regulator transfer to trace | Same split quadratic algebra | Tr(25,25)=50=2·25; selected-factor value 25≠50 | Full trace required | Own transfer comparison |
| Regulator tower law | Degrees 2 and 3, base value 25 | 3·(2·25)=150=6·25; identity trace is 25 | Correct direction | Identity/tower laws required |
| Global regulator versus finite torsors | Cubic eta over ℚ, p=5 | λ(η)=0, D₅(η)=0; ε₃ has root exponent 1 or 2, never 0 | Finite data do not factor through D | Retain original ξ |
| Normalized regularization | Li₂ value 25, p=5, m=1 | Unregularized residue −125 plus regularizing residue +125=0 | Pole cancels with stated sign | Keep normalized factor only |
| Half-shift branch convention | m=2, q=−1 | Formal exp(mh/2) has constant 1; monomial q^(m/2) has constant −1 | Different objects | Keep constant-one branch |
| ℤ_p powers of normalized factors | First jet U=1+x/48+O(x²), a=2 | exp(2log U)=1+x/24+O(x²)=U² to first order | Defined without finite root powers | Powers only on logarithms |
| Product first jet and presentation relations | Factors with first jets 1/48 and −1/48 | Product and logarithmic sum both have first coefficient 0 | Compatible with additive coefficients | Retain §3.5's integral jet |
| Integral jet versus rational coefficients | p=5, coefficient 1/48 then divide by 5 | v₅(1/48)=0, v₅(1/240)=−1 | Arbitrary rational coefficients fail | Require ℤ_p presentation coefficients |
| Root-line type of Ψ | m=3, e³=u, U(0)=1 | Ψ(0)=e, Ψ(0)³=u; normalized constant is 1 | Actual torsor retained | Use e_m(ξ)U_(P,m) |
| Integral local splitting | m=3, unit u at p=5 | Derivative of y³−u at a unit root is 3e², a unit; for m=5 derivative is 0 mod 5 | Étale exactly on stated local domain | Use p∤m and unit representatives |
| Representative change | p=5,m=3,u=1,v=2 | New representative 8; new root 2; 2³=8 | Correct source/target torsor map | Explicit transport |
| Composition of representative changes | v=2,w=3,m=3 | New root 6e; new representative 216u; (6e)³=216u | Identity/tower coherence possible | Require composition |
| Root change | m=3, e→ζ₃e | (ζ₃e)³=e³ and log ζ₃=0 | Same torsor, transformed section | Explicit μ_m action |
| Constant logarithm and Frobenius defect | p=5,m=3,u=6 | log 6≡5 mod 25; (log 6)/3≡10; (1−5)·10≡10 mod 25 | Both in 5ℤ₅ | Separate constant-term estimate |
| Nontrivial torsor with zero log | u=ζ₃² in ℚ₅(ζ₃) | log u=0, while its cube class has order 3 | Log does not recover torsor | Preserve finite class independently |
| Empty presentation of completed zero | ξ=0 then cubic eta | Both give U=1; constants are respectively 1 and a root of ζ₃ or ζ₃² | Different global degrees remain different | Fix empty-presentation Check |
| Nontrivial eta class over residue field | 𝔽₂₅ˣ, cubic roots | Group order 24; cube subgroup size 8; nontrivial cube roots have order 3 and are absent | Neither Chern sign becomes trivial | Add negative control |
| Additive-map obstruction | ℤ₅-module to exponent-three group | a=3b gives f(a)=3f(b)=0; eta target is not 0 | Whole Chern class cannot factor | Remove invalid exponentiation pattern |
| Local shape after torsor rescaling | Ψ=e(1+cx+…), v=2 at p=5 | New constant 2e and jet 2ec; normalized constant 1 and coefficient c are unchanged | Unit and integral jet preserved | Require integral unit changes |
| Local module independence of presentation | Same ξ, P=P, then generator scaled by 2 | Ratios 1 and 2; inverses 1 and 1/2∈ℤ₅ | Same scalar span | Compare within a fixed degree |
| Local generator versus nongenerator | Scalar multiples 2s and 5s over ℤ₅ | 2 has inverse mod 5 equal to 3; 5 has residue 0 and no inverse | Only first is a generator | Keep local freeness separate |
| Local zero-degree identification | ξ=0 with zero torsors | Ψ=1, completed pole 0, defect 0; scalar multiples give local ring | Matches ring case | §3.6 consumes repaired construction |
| Field pullback and retained factors | ℚ→ℚ(i), p=5 | Scalar 25 maps to (25,25); identity then pullback has same pair | Both factors survive | Route through §3.0b |
| General Chern-transfer sign | Cubic raw Chern exponent 2 versus positive exponent 1 | Squared exponents 4≡1 and 2 mod 3; both nonzero | Squaring does not remove sign | Compare selected normalization before torsors |
| Finite Chern norm in restricted degrees | Degree 2, ε=[ζ₃²] | Norm(res ε)=ε²=[ζ₃]; ε(2ξ)=[ζ₃] | Projection formula agrees | Check, not substitute for general square |
| All-order Chern norm boundaries | m=1 and m=2 | ε₁=1; a square class squared is 1, so ε₂=1; Norm(1)=1 | Even orders retained | Explicit all-order target |
| Dyadic real-place comparison domain | F=ℚ, integral degree-three torsion edge | Source order 48, Tate-invariant target order 24, kernel order 2 | No unrestricted edge isomorphism | Import ArithmeticKTheory §5.4 |
| Norm of whole normalized series | Split quadratic, a=1,b=2 | Norm=(1+x)(1+2x)=1+3x+2x²; coefficientwise product gives 1+2x | Whole-series norm necessary | Retain determinant construction |
| Logarithm of norm and first coefficient | Same two factors | log Norm has x coefficient 3 and x² coefficient −5/2; log(1+x)+log(1+2x) gives 3 and −5/2 | Trace identity agrees | Connect to corrected local shape |
| Norm/trace tower and torsor coherence | Base root e, degrees 2 then 3 | (e²)³=e⁶; norms of a base unit 2 give 4 then 64=2⁶ | Tensor and tower degrees agree | Require coherent torsor norm map |
| Identity transfer with invisible torsion | Cubic eta, p=5,m=3 | Trace regulator 0=0; torsor class [ζ₃²] maps to itself, not 1 | Both independent diagrams needed | Explicit norm negative Check |
| KMS diagonal correction | n=2,ζ=−1,x=y=2,z=−1 | X=Y=4,Z=1; D(ζ/z)=2; denominator product (3/2)(−1)2=−3 | Diagonal need not be singular | Replace incorrect Check |
| KMS z=1 sublocus | n=2,ζ=−1,x=y=2,z=1 | D(ζ)=1−1=0, versus D(ζ/z)=2 at z=−1 | Additional z condition essential | Qualify vanishing |
| KMS order-one boundary | n=1, any argument | D=∏∅=1, f=Σ single term=1; cleared sides 1=1 | No order-one vanishing | Explicit boundary correction |
| cyclicDilog real-body definition | n=0,1,2; x=0; zero ring | D₀=D₁=1, D₂(−1,x)=1+x, D(x=0)=1; zero ring gives 0=1 | README and signature agree | No signature edit |
| cyclicDilog_quasiPeriodicity | n=2,ζ=−1,x=2,s=1 over ℚ | (1−4)(1−2)=3; (1+2)(1−2)²=3 | Cleared identity agrees | Retained |
| cyclicDilog_one_pow_twentyFour | n=2,ζ=−1 over ℚ | D(1)²⁴=2²⁴=16,777,216; 2^(12·2)=16,777,216 | Integral-product exponent agrees | Retained |
| cyclicHypergeom real-body definition | n=0,1; n=2,ζ=−1,(x,y,z)=(2,3,5) | Empty sum 0, order-one sum 1; 1+(4/3)5=23/3 | Total finite definition agrees | Retained |
| cyclicHypergeom singular boundary | n=2,ζ=−1,x=y=−1,z=1 | Total sum 1+0/0=1; geometric sum 2 | Nonsingularity necessary | Retain explicit hypotheses |
| cyclicHypergeom_shift | n=2,p=11,ζ=10,(x,y,z)=(2,4,3) | f(z)=6,f(ζz)=7; (1−3)6=10=(2−10·4·3)7 mod 11 | Shift sign and ζ agree | Retained |
| kms signature | Same admissible triple | Cleared LHS=2=RHS mod 11 | README hypotheses and orientation agree | Retained |

**Exact finite-field enumeration.**

| n | ℓ | ζ | Quasi-periodicity cases | Shift cases | KMS cases | Sample (x,y,z) | Cleared KMS LHS = RHS |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 5 | 1 | 10 | 16 | 6 | (2, 3, 3) | 1 = 1 |
| 2 | 11 | 10 | 33 | 82 | 32 | (2, 4, 3) | 2 = 2 |
| 3 | 19 | 7 | 76 | 282 | 108 | (2, 10, 5) | 5 = 5 |
| 4 | 17 | 4 | 85 | 324 | 128 | (3, 6, 6) | 6 = 6 |
| 5 | 31 | 2 | 186 | 1230 | 500 | (3, 11, 7) | 30 = 30 |
| 6 | 37 | 11 | 259 | 2094 | 864 | (2, 5, 9) | 11 = 11 |
| 7 | 43 | 4 | 344 | 3290 | 1372 | (3, 7, 6) | 39 = 39 |
| 9 | 73 | 2 | 730 | 9486 | 4374 | (3, 25, 25) | 18 = 18 |

Totals: 1,723 cleared quasi-periodicity cases, 16,804 shift cases and 7,384 KMS cases, with zero failures; the phase-free value identity was checked at each of the eight orders.

**Commit and verification outcomes.**

Committed as 53af20a; only `TauCetiRoadmap/HabiroNumberFields/README.md` and `TauCetiRoadmap/HabiroNumberFields/Suggested.lean` changed. Nothing was pushed.

`lake build TauCetiRoadmap.HabiroNumberFields.Suggested` exited 0, with the four expected admitted-theorem warnings and this exact outcome:

```text
Build completed successfully (8976 jobs).
```

The dependency-direction check exited 0, with no UPWARD or CYCLE diagnostic and this complete output:

```text
depcheck: 33 roadmaps, 305 edges, 0 problem(s)
```

The final gate exited 0 on the clean committed tree. Its exact summary line is:

```text
gate HabiroNumberFields: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
