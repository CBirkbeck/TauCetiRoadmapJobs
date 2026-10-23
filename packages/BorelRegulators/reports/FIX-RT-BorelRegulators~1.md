# BorelRegulators repair report

The two F01 headings distinguish the findings with that identifier in reviews a and b. All verdicts below follow independent source and carrier checks. They do not constitute the independent review that follows this repair.

## F01 (P2) — applied

Review a: a new AdelicAlgebraicGroups Tamagawa theorem → EndoscopicTransferAndUnitaryTraceComparison §6.2, which explicitly includes every simply connected semisimple number-field group and its inner forms. Deleted only gap:classical-tamagawa-proof; updated Scope, Exact supplier contracts, §3.4, Layer 3 Dependencies and the consumer mapping. The measure and inner-type-A structure gaps remain. This package-local redundancy repair makes no merge-order decision.

## F01 (P2) — applied

Review b: ambiguous chₙ with Tate-valued evaluation → rational chₙ evaluating to 1 and explicitly defined chₙᵗʷ=(2πi)^n chₙ. Updated Conventions, gap:integral-chern-calibration, §§2.1, 4.3, 5.2 and 6.2, the gap detail and source manifest. Evidence: CharacteristicClasses C6 items 2–3; burgos2002 line 1426–1431 and line 3670–3688. Recomputed both normalizations at n=2,3.

## F02 (P2) — applied

An unquantified finite-stage needs sentence → number field F, degree N, a≥2, G, K, arithmetic Γ, degrees q∈ℕ, the actual invariant-form maps, naturality and bijectivity when a−1>4Nq. README and plan agree. Added range and degree-zero Checks in §2.3. ArithmeticKTheory §3.4 provides the stable setting; borel1977 line 459–461 supports the conservative finite range.

## F03 (P2) — applied

An unqualified full-local-degree needs sentence → degree a≥1, finite set S of finite places, and selected real places R, empty for odd a. The detailed contract already allowed varying local extensions; that restriction now appears in its needs sentence. Added degree-one, split-prime and two degree-eight cyclotomic Checks. Evidence: poonen2017 line 1435–1444; ArithmeticGaloisDuality §§R02.4.5b–R02.4.6.

## F04 (P3) — applied

Implicit standing higher-weight bound → explicit n≥2 in §5.2. Added the n=1 negative control: π₁(SU)=π₁(SU/SO)=0, whereas V₁(ℚ) has dimension 1. All four existing homotopy covolume Checks remain unchanged. Evidence: the SO→SU→SU/SO exact sequence and burgos2002 line 3546–3576; degree one cannot be included in its positive free-generator computation.

## F05 (P3) — applied

Incomplete Needs lists → the pinned total-reality, discriminant and convergent-zeta inputs in §5.1, and NumberField.prod_abs_eq_one in §3.3 and Exact supplier contracts. Inspected their bodies at the manifest pins, including the nonzero scalar hypothesis and the complex-place multiplicity. The existing gauge Check gives 2·1/2=1; the quadratic complex-place multiplier is 4.

## F06 (P3) — applied

One Borel locator after both existence and arbitrary invariant realization → Borel Lemma 2.2 on existence, and Poonen Theorem 1.5.36(i),(iv), p.26, on arbitrary admissible families, using §3.1. Evidence: borel1977 line 177–195 constructs one family; poonen2017 line 1402–1446 supplies exactness and period=index. References now includes item (i); the existing manifest key already includes it.

## F07 (P3) — not actionable in this package: correcting Polylogarithms citations requires editing that roadmap

Corrected this README's consumer mapping to §§2.3, 5.1, 5.3–5.4 and 3.4, retaining §§5.2 and 6.2 for normalization. Polylogarithms still cites nonexistent §7.1 and misplaced Layers 3–5; its supplied head confirms those witnesses. Its files are read-only here. The exact external replacements are recorded below; no supplier gap can repair a consumer's citations.

## Checks and permitted scope

- Required elaboration of packages/BorelRegulators/Suggested.lean from the content checkout: **exit 0**, with exactly the expected three warnings at lines 46, 55 and 72 that the declarations use `sorry`. Both required Tau Ceti object files existed; no build was needed.
- A separate scratch copy containing `#check @name` for **all three declarations** elaborated once: **exit 0**, with the same three warnings. Every elaborated type was compared with README §§3.1, 3.2 and 5.1. No binder was lost and no signature change was needed.
- Dependency check after the README repairs: **exit 0**. Its exact final output is recorded below. No UPWARD, CYCLE or moved line occurred.
- Citation resolution: no cross-roadmap citation or roadmap Lean name was reported as found nowhere. The resolver could not inspect pinned packages on its own host; the pinned inputs were inspected directly in the provided content checkout instead.
- All **11** upstream gap slugs, suppliers, sections and needs match the README contracts; the obsolete Tamagawa gap is absent. The additional downstream borel-period-contract entry records BorelRegulators as supplier to Polylogarithms at §2.3, §§5.3–5.4, §5.1 and §3.4, matching the README consumer mapping. It introduces no self-dependency. A structural comparison with the original plan confirms that every top-level value other than `gaps` is identical.
- `git diff --check`: **exit 0**, with no whitespace errors.
- Gate repair: README named gap:borel-period-contract without a corresponding plan entry → added that entry with `needs`, `supplier` and `section` to the top-level `gaps` list in packages/BorelRegulators/design/plan.json. All 11 previous entries and every other top-level value are unchanged. Only this plan entry and the required report update changed during the gate repair; all previous deliverables were preserved. Repeated acceptance elaboration and dependency checking both exited 0 with the same warnings and output recorded above; repeated scratch signature elaboration confirmed all three contexts below.
- No Lean declarations were added, deleted or renamed. Suggested.lean and metadata.toml remain unchanged. The changed deliverables are README.md, sources.toml, the allowed gaps list, and this report, all under packages/BorelRegulators. No commit, order edit or external-roadmap edit was made.

```text
depcheck: 28 roadmaps, 245 edges, 0 problem(s)
```

The signature comparison preserved the following full contexts.

| Declaration | Elaborated hypotheses and conclusion | Comparison |
|---|---|---|
| period_eq_index | F : Type u, Field F, NumberField F, A : CSA.{u,u} F; order of its native Brauer class equals its native index | CSA supplies centrality, simplicity and finite dimension; same universe as required by the group law; README agrees |
| exists_divisionAlgebra_split_at_infinity | Same field context, a : ℕ, 1≤a; a division ring D in Type u with Algebra F D, centrality and finite dimension, dimension a², splitting for every real and complex embedding | Both splitting predicates retain the algebra structure supplied by their respective embedding; README agrees |
| exists_pos_rat_dedekindZeta_of_isTotallyReal | Same field context, IsTotallyReal F, n : ℕ, 2≤n, Even n; positive q : ℚ and √Δ_F·ζ_F(n)=q·π^(nN) in ℂ | Total reality, parity, higher weight, positivity and both coercions survive; README agrees |

The unchanged module docstring identifies the nonstatable headlines and the missing actual carriers: higher Quillen groups and their regulator, continuous Borel classes, arithmetic and compact-dual cohomology/comparisons, adelic quotient gauges, stable SU/SO homotopy and geometric Deligne realization. None of the findings makes these carriers available at the pins. No surrogate or boundary-case Lean theorem was introduced.

## Evidence, ownership and source boundaries

The content checkout is main at dfdf9a3671420779ef892df5948d52764a1c66ce. Its manifest and the actual package checkouts agree on Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.

| Input or issue | Resolved evidence and consequence |
|---|---|
| Tamagawa ownership | TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md §6.2 explicitly supplies τ(S)=1, including inner forms, in AdelicAlgebraicGroups §2.4's normalization. ORDER places it at 166 and BorelRegulators at 224. The retained structure gap identifies SL₁(D) as an admissible input. |
| Rational Chern character | CharacteristicClasses C6 item 2 divides the integral Newton polynomial by n!; item 3 fixes ordered suspension and ch(u)=−v. Thus (-1)^n ch(u^n)=v^n. TopologicalKTheory T4 fixes u=O(-1)−1 and the x,y orientation. |
| Twisted character | burgos2002 line 1426–1431 gives the suspended formula and Tate-valued pairing; line 3670–3688 and line 3733–3744 explicitly use the twisted character. The unsuspended factorial in line 1425 conflicts with Newton's identity and the following suspended formula; it is not used to calibrate the repair. |
| Finite range | ArithmeticKTheory §3.4 supplies stable arithmetic/relative-Lie comparison independently of regulator values. borel1977 line 459–461 gives comparison below (a−1)/4; N≥1 implies the requested a−1>4Nq is sufficient. The additional explicit finite-stage map remains a declared supplier gap. |
| Variable local extensions | poonen2017 line 1435–1444 uses cyclic degree-a extensions with full degree at a finite support, with real places complex. ArithmeticGaloisDuality §§R02.4.5b–R02.4.6 retains Wang's exceptional obstruction for fixed prescriptions. The repaired contract does not identify those two deliverables. |
| Arbitrary invariant realization | poonen2017 line 1402–1409 realizes exactly the admissible zero-sum families; line 1427–1446 gives period=index. Combined with the native division representative, denominator lcm a gives dimension a². This is stronger than Borel's particular family at borel1977 line 177–195. |
| Homotopy conversion | burgos2002 line 3546–3576 gives indices 1 and 2 in the two relevant positive free degrees; line 3607–3614 gives the precise covolume factors. TopologicalKTheory T7 item 1 supplies c(a)=2u² and c(b)=u⁴; StableHomotopyKTheory §§2.3–2.5 supplies the fibre sequence tools. |
| Product formula | Mathlib/NumberTheory/NumberField/ProductFormula.lean:98 requires x≠0 and multiplies each infinite absolute value to its multiplicity before the finite product. Complex multiplicity is 2. |
| Totally real headline inputs | Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:47,52 defines total reality and identifies it with r₂=0; Discriminant/Defs.lean:36,41 defines the ring-of-integers discriminant and proves nonvanishing; DedekindZeta.lean:49 defines the ideal-count L-series. The last definition alone supplies no continued germ at 1−n. |
| Native algebra inputs | Mathlib/Algebra/BrauerGroup/Defs.lean:40 bundles centrality, simplicity and finite dimension. TauCeti/Algebra/CentralSimple/Index.lean:99,255 supplies index and an index-degree splitting extension; Splitting.lean:120 means scalar extension is a matrix algebra. Its arbitrary-input definition permits matrix size zero, which the central simple and division inputs exclude. |
| Native lattice inputs | Mathlib/Algebra/Module/ZLattice/Basic.lean:433 takes discrete subtype topology separately and requires full real span. Covolume.lean:98,125,148 gives positivity, coordinate determinant and relative index under those hypotheses. In particular, abstract finite generation alone is insufficient. |

Source texts used are the five legally cached works under their existing manifest keys. The new Burgos locator was added to that existing key and the README reference. No new source key or missing-text request was needed. weil1961 remains waived, and beilinson1985 remains uncertified; neither was reopened or represented as newly read.

Two main-branch roadmap introductions, ClassFieldTheory and GlobalNumberFields, were read for shape. Supplier citations were resolved by object and section, using the roadmap service and the provided main/head files: GeneralAlgebraicKTheory §§2.5,3.2,3.12,7.7–7.8; StableHomotopyKTheory §§2.3–2.5,3.37,4.14; ArithmeticKTheory §§3.2–3.4; ArithmeticLocallySymmetricSpaces ALS.F.5, ALS.0.4–0.9, ALS.5b.1; AutomorphicFormsOnReductiveGroups §§1.1–1.3; AdelicAlgebraicGroups §§1.2,1.4,2.2–2.5,3.4,4.2; ClassFieldTheory Layers 5,10; SemisimpleAlgebras Layer 6; ArithmeticGaloisDuality §§R02.4.5b–R02.4.6; LFunctions Layer 3; IntegralIwasawaTheory §6.0; CharacteristicClasses C5a/C6; TopologicalKTheory T4/T7; DifferentialGeometry Layers 5,6,8; AlgebraicTopology Stage 5 item 5; and SchemeKTheoryOperations §6.8. MotivicEtaleKTheory's available design target, Final targets 2,3,5,6, supplies its ownership boundary; the two explicitly declared realization gaps remain requests.

Ownership searches covered main, Completed, board packages and every one of the 27 supplied sibling checkouts. The roadmap service was also searched for regulator lattices, period/index, division algebras, Tamagawa numbers, Chern calibration, indecomposables and cyclic local degrees. The construction being changed here is the normalization and specialization of the existing Borel targets; generic characters, finite-stage arithmetic comparison and variable local-extension theory remain with their named suppliers. No new foundational carrier or competing fully qualified Lean name was introduced.

The earlier MERGE-ORDER question is not re-decided. ColemanIntegration §L3.Fc.1 still states the regulator lattice theorem, HeightsRationalPointsAndObstructions §3.6 derives period=index, and PeriodsAndSpecialValues PS.3.2a states regulator/comparison targets. Their locations were checked, including the recorded PeriodsAndSpecialValues board head 9f14c68 through its repository object. Their broader ownership/placement consequences remain for the maintainer under the prior report. Removing the separate, redundant Tamagawa gap requires none of those external decisions.

## Computed adversarial mathematics pass

N=[F:ℚ], d=dₙ and Δ=|disc F|. Rows record computations of definitions, identities and theorem instances, including the statements changed here and every section's Checks and worked examples. Values of future constructed maps are evaluated through the specified construction or the stated supplier contract; these tests are not proofs of the universal targets or implementations of the gaps. “Retained” means the instance respects the statement and its required hypotheses.

| Statement | Instances tried | Values computed on the two sides or for the distinguishing model | Result | Change |
|---|---|---|---|---|
| Number-field conventions | ℚ, ℚ(i), real quadratic | (r₁,r₂,N)=(1,0,1),(0,1,2),(2,0,2); r₁+2r₂=N gives 1,2,2 | Retained | none |
| Tate lines and divided coordinates | k=1,2,3 | generators 2πi,−4π²,−8π³i; each generator divided by itself is 1 in each rational/real/integral coordinate | Nonzero generators; rational twist explicit | b/F01 |
| Conjugation and representative change | n=2,3; t=1 | pairs (1,−1),(1,1); representative multipliers −1,+1 | Retained | none |
| Signed determinants and covolumes | t=−3; doubled lattice; dimension zero | determinant −3, covolume 3; doubled covolume 6; empty determinant and covolume 1 | Retained | none |
| Integer exponents and proportionality | ℚ,n=3; scalar zero | d−Nn=−2, π^(−2)>0; zero cannot equal a nonzero rational times π^(−2)ζ(3) | No natural-subtraction or zero-quotient interpretation | none |
| Comparison phase convention | q=0,1,2,3,5 | i^q=1,i,−1,−i,i; i·(−1)=−i=i³ | Graded multiplicativity retained | none |
| Ordered compact generator | n=2,3 | ch(u²)=v²; ch(−u³)=v³; rational coordinates 1,1 | Correct rational calibration | b/F01 |
| Rational versus twisted calibration | n=2,3; zero and double | rational pairings 1,1; twisted −4π²,−8π³i; wrong twisted values 0 and twice these | Wrong models excluded | b/F01 |
| Gauge and complex absolute-value conventions | c=2 over ℚ; ℚ(i),h=3 | infinite/finite multipliers 2,1/2, product 1; complex scalar multiplier 4; 4^(−3/2)·2³=1 | Retained | b/F05 citation |
| Left/right quotient and Cartan convention | identity; g=diag(i,−i), h=[[0,1],[−1,0]] | inversion twice gives g; C(I)=I; C(gh)=C(g)=−I | Representatives and basepoint respected | none |
| §1.1 Vₙ and dimension | ℚ, ℚ(i), real quadratic at n=2,3 | dimensions (0,1),(1,1),(0,2); t=−t forces real even coordinate 0 | Retained | none |
| §1.1 coordinate equivalence and Cₙ | imaginary pair at n=2; real generator at n=3 | coordinate 1 has ambient norm 2π or 4π², coordinate norm 1; inverse division recovers 1 | Continuous linear equivalence; no unscaled isometry | none |
| §1.1 extensionality and coordinate changes | two pairs, swap; conjugate first pair | permutation determinant −1, representative determinant −1 in even weight; both absolute determinants 1 | Same coordinate Haar measure | none |
| §1.1 discrete spanning lattice and rank zero | ℤ⊂ℝ; totally real even weight | integer generator spans dimension 1; in dimension 0 the fundamental point has mass 1 | Retained | none |
| §1.2 restriction R | ℚ(i)/ℚ, n=3; identity | R(1)=(1,1); R_id(1)=1; integral coordinates stay integral | Retained | none |
| §1.2 trace T and TR | ℚ(i)/ℚ, n=2,3; real quadratic | T(1,−1)=0; TR(1)=2; T(2,3)=5; averaged trace would give 1 instead of 2 | Full sum required | none |
| §1.2 towers and identity | two quadratic extensions; identity | fibre count 2·2=4=[L:F]; both composite traces give 4t; identity gives t | Retained | none |
| §1.3 germ order | ℚ,n=1,2,3,4 | orders 0,0,1,0; d-values 1,0,1,0 | n=1 excluded; analytic value 0 at −2 is not its leading coefficient | none |
| §1.3 leading-coefficient rational class | ℚ,n=2,3,4 | ratios (−1/12)/(1/6)=−1/2; ζ′(−2)/(ζ(3)/π²)=−1/4; (1/120)/(1/90)=3/4 | Nonzero rational factors, signed | none |
| §2.1 Boₙ construction and calibration | n=2,3 | specified suspended twisted class gives −4π²,−8π³i; rational class instead gives 1,1 | Ambiguity removed without changing Boₙ normalization | b/F01 |
| §2.1 factorial control | n=3 | suspended c₃=2 suspended ch₃; twisted c₃ evaluates to −16π³i versus −8π³i | Wrong characteristic class excluded | b/F01 |
| §2.1 stabilization and conjugation | identity block; n=2,3 | added positive-degree character 0; compact coefficients conjugate to themselves at n=2 and to their negatives at n=3 with the matching class action | Retained | b/F01 notation |
| §2.2 integral regulator and torsion | zero; order-m class, m>0 | r(0)=0; m r(x)=r(mx)=0 implies r(x)=0 in a real vector space | Retained | none |
| §2.2 rational localization and uniqueness | nonzero rational K₅ coordinate t=1 | actual inclusion followed by specified inverse returns 1; doubled inverse returns 2 | The actual inverse is required | none |
| §2.2 embedding assembly | imaginary quadratic at n=2,3 | divided pairs (1,−1),(1,1), satisfying simultaneous conjugation | Retained | none |
| §2.3 real isomorphism and rational injectivity | ℚ,n=2,3; ℚ(i); real quadratic,n=3 | source/target ranks 0=0,1=1; 1=1 in both quadratic imaginary weights; 2=2 in real weight 3 | Nonzero ranks use actual comparison; empty case retained | none |
| §2.3 torsion kernel | free generator with t=1; torsion | free generator maps to 1≠0; torsion maps to 0 | Both kernel directions consistent | none |
| §2.3 restriction/transfer squares | ℚ(i)/ℚ | odd TR sends 1 to 2; even trace sends (1,−1) to 0, matching transfers | Retained | none |
| Finite-stage range contract | F=ℚ,q=5,a=22 and 21 | 21>20; boundary 20=20; q=5<21/4 but not 20/4 | Strict sufficient range | b/F02 |
| Finite-stage range with N>1 | F=ℚ(i),q=3,a=26 and 25 | 25>24; boundary 24=24; 3<25/4 | Conservative relative to Borel's range | b/F02 |
| Finite-stage map, degree zero and naturality | q=0,a=2; identity/finite-index restriction | 1>0; invariant constant 1 maps to 1 and restricts to 1; zero map sends it to 0 | Actual map distinguished | b/F02 |
| §3.1 period=index and native headline | split class; two halves; ±1/3; denominator 8 | (period,index,dimension)=(1,1,1),(2,2,4),(3,3,9),(8,8,64) | Noncommutative and degenerate inputs retained | none |
| §3.1 zero-sum and matrix representatives | singleton 1/3; split M₂(F); degree 6, index 3 | singleton total 1/3≠0; M₂ dimension 4 but index 1; M₂(D) dimension 36=6² | Admissibility and degree/index distinction retained | none |
| Splitting-degree divisibility contract | d=2,[L:K]=4; d=1 | d²k=d[L:K] gives 4k=8,k=2; index divisibility 2∣4; d=1 gives k=[L:K] | No separability used in dimension argument | none |
| Cyclic local-degree contract, empty case | a=1,S=R=∅ | L=F, degree 1; no local conditions; odd cyclic group has no order-two conjugation | Boundary retained | b/F03 |
| Cyclic local-degree contract, real field | ℚ(ζ₃₂)⁺, a=8,S={2} | unit group size 16; quotient by {1,31} size 8, generator 3 order 8; local degree at 2 is 8 | Variable ramified prescription works | b/F03 |
| Finite support versus every prime | same degree-eight real field, prime 31 | Frobenius −1 lies in {1,31}; local degree at 31 is 1≠8 | Unrestricted full-degree reading excluded | b/F03 |
| Cyclic local-degree contract, real place made complex | fixed field of {1,15} in ℚ(ζ₃₂) | subgroup size 2; quotient size 8; 3 has order 8; 31∉{1,15}; local degree at 2 is 8 | Cyclic and imaginary; Wang's fixed unramified prescription unused | b/F03 |
| §3.2 existence headline, positive degrees | a=0,1,2,3 | 0-dimensional division ring impossible; a=1 gives F, dimension 1; two halves give 4; ±1/3 give 9 | Exactly a≥1 | none |
| §3.2 arbitrary realization and infinite splitting | ±1/3; Hamilton quaternion | total invariant 0, lcm 3, dimension 9, all infinite invariants 0; Hamilton infinity invariant 1/2≠0 | General realization has its own exact-sequence locator | b/F06 |
| §3.3 infinite and finite gauge definitions | ℚ(i),h=3; h=0; ω=0 | m∞ coordinate factor (1/8)·8=1; point with ω=1 has mass 1; zero form has mass 0 | Nonzero form is essential | none |
| §3.3 scaling and Jacobian laws | c=2; complex coordinate doubled | total scalar 2·1/2=1 over ℚ; complex coordinate multiplier 2²=4 | Product formula and local Jacobian agree | b/F05 |
| §3.4 Tamagawa specialization | D=(−1,3)/ℚ; degree-three division algebra | Hilbert symbols at 2,3,∞ are −1,−1,+1; h=3,8 respectively; τ=1,1 | Earlier supplied theorem applies | a/F01 |
| §3.4 gauge independence and excluded torus | ω→2ω; norm-one torus of ℚ(i)/ℚ | total multiplier 1, so mass 1→1; torus dimension 1, geometric character rank 1 versus 3,0 for degree-two SL₁(D) | No torus generalization | a/F01 supplier |
| §3.5 standard masses | q=2,a=2,3 | 6/8=3/4=1−1/4; 168/256=21/32=(3/4)(7/8) | Retained | none |
| §3.5 correction c_S and enlargement | exceptional mass b; standard added place; scaled gauge | correction 4b/3; added ratio 1; at 2, (3/8)/(3/4)=1/2 | All finite factors retained | none |
| §3.5 denominators and finite index | q=1 versus 2; index 3 | factors 0 versus 3/4; finite mass m→m/3 | q=1 excluded; finite-index law retained | none |
| §3.6 exact adelic identity | level index 3 | (3v)(m/3)=vm=1 | Counting-measure normalization retained | none |
| §3.6 compactness hypotheses and discriminant | split M₂(ℚ); Hamilton; ℚ(√5),a=2 | split quotient noncompact; Hamilton real factor compact; unscaled/Borel volume ratio 5^(3/2) | Separate division and infinite-splitting hypotheses retained | none |
| §4.1 cohomological indecomposable quotient | Λ(x₃,x₅), Λ(x₃), k[u₂], k | dim H⁸=1 but Q⁸=0; Q³ dimension 1,Q⁶=0; Q² dimension 1,Q⁴=0; Q(k)=0 | Product-span denominator, not a complement | none |
| Generic indecomposable contract, maps and quotient property | x₃→2x₃ in Λ(x₃); decomposable x₃x₅ | Q-map sends [x₃]→2[x₃], products map to 0; identity/composition give 1 and 2·3=6 | Quotient descends precisely when denominator is killed | none |
| §4.1 determinant functor and scalar extension | dimensions 0,1; basis scale 2 | ∧⁰0=k with generator 1; top degree in dimension 1 is k; scaling induces determinant 2 over ℚ,ℝ,ℂ | Native determinant and empty generator preserved | none |
| §4.2 actual maps and real correction | q=0,1,2,3,5 | constant 1→1; factors i,−1,−i,i; i·(−1)=−i | Zero or constant odd-phase models excluded | none |
| §4.2 arithmetic descent boundary | point with C₂ stabilizer over 𝔽₂ | dim H^q(C₂,𝔽₂)=1 for q>0, versus 0 for point cohomology | Torsion-free/characteristic-zero scope retained | none |
| §4.3 compact determinant | ℚ,n=2,3; ℚ(i),n=2 | classes π²,π³,π⁴/8 modulo positive rationals; abs(−4π²)/π²=4 | Correct twisted witness, all nonzero | b/F01 |
| §4.3 rational basis and stabilization | one basis vector doubled; identity block | determinant multiplies by 2; added positive-degree character 0 gives multiplier 1 | Retained | none |
| §4.4 regular representation | (N,j,a)=(1,1,17),(1,2,37),(2,1,33) | b=4,9,4; identity blocks 13,28,29; det L_g=Nrd(g)^(j+1)=1 | Group padding, not a false unital algebra embedding | none |
| §4.4 cycle dimensions and primitive restrictions | same three cases | dimensions 3,8,6; restriction factors 2,9,4=(j+1)^(jN) | Degree N and all primitive factors retained | none |
| §4.4 compact periods and lower ideal | j=1,2; Λ(x₃,x₅) | period classes ζ(2),ζ(2)ζ(3); x₃²=0 kills the earlier ideal, while x₃x₅≠0 in H⁸ | Induction uses repeated earlier generators | none |
| §4.5 full arithmetic periods | j=0,1,2 | cumulative products 1,ζ_F(2),ζ_F(2)ζ_F(3); successive quotients ζ_F(2),ζ_F(3), with positive denominators | Retained | none |
| §4.5 full versus base rank | ℚ,n=2 | full primitive rank N=1; base rank d=0 | ζ(2) period survives before fibre cancellation | none |
| §4.6 exact sequences and common fibre | ℚ,n=2,3; ℚ(i),both parities | ranks (d,N,N−d)=(0,1,1),(1,1,0),(1,2,1) | Dimensions and common fibre agree | none |
| §4.6 determinant decomposition and lift independence | splitting change [[1,2],[0,1]]; fibre scale 2 | unipotent determinant 1; rescaled fibre determinant 2 | Identity fibre comparison distinguishes the construction | none |
| Multiplicative Serre comparison contract | trivial bundle/identity; two primitive factors | fibre restriction 1→1; product of primitive restriction factors 2·2=4 | Preserves edges, products and actual identity on fibre | none |
| §5.1 phase formula | ℚ,n=2,3,4,5; imaginary quadratic | E=−2,2,−4,4; imaginary quadratic E=0; i^E=−1,−1,1,1,1 | Always rational phase under parity hypotheses | none |
| §5.1 primitive determinant and empty comparison | ℚ,n=2,4 | empty map 1→1; zeta scalars 1/6,1/90; ratios 6,90 | Rank zero retained as a deep numerical headline | b/F05 inputs |
| §5.1 quadratic numerical Checks | ℚ(√5), ℚ(√2),n=2 | B₂,χ=4/5,2; √Δζ_F(2)/π⁴=2/75,1/24; reciprocals 75/2,24 | Matches headline and consumer empty determinant | b/F05,F07 |
| §5.2 Cartan map and indices | ℚ,n=3,5 | quotient indices 1,2; Cartan indices 2,1; both composite indices 2 | Covolumes 4π,2π respectively | b/F01 notation |
| §5.2 lattice conversion in all signatures | ℚ,n=2; imaginary quadratic,n=2,3 | (2π)^0·1=1; (2π)^1·1=2π in both imaginary weights | All previous Checks retained | none |
| §5.2 degree-one boundary | ℚ,n=1 | π₁SU=π₁(SU/SO)=0; d₁=1; {0} spans dimension 0≠1 | No full-lattice covolume 2π | b/F04 |
| §5.3 image lattice and torsion quotient | free rank one, t=3; d=0 | A/A_tors→3ℤ is bijective; covolume 3; empty image in zero space has covolume 1 | Both image-membership directions agree | none |
| §5.3 integral versus rational image | generator doubled; rational multiples | 3ℤ→6ℤ has index 2 and covolume 6; 3/m→0 gives nondiscrete 3ℚ | Integral image is essential | none |
| §5.3 finite generation versus discreteness | ℤ+√2ℤ⊂ℝ | 3−2√2≈0.1716,17−12√2≈0.0294,99−70√2≈0.00505 tend to 0; real source rank 2 versus target rank 1 | Arbitrary finite generation is insufficient | none |
| §5.4 exact homotopy reference conversion | ℚ,n=3; d=0 | R_Bo=4πR′_Bo; empty conversion multiplier 1 | Tate twist adds one π at rank one | b/F01 notation |
| §5.4 leading and positive zeta classes | ℚ,n=2,3; ℚ(i),n=2,3 | at n=2, 1=(−12)(−1/12)=6·(1/6); other exponents −2,−3,−5, respectively | Signed leading scalar and positive covolume scalar separated | none |
| §5.4 basis changes and rational span | swap columns; double one column; 3ℤ | signed multipliers −1,2; absolute multipliers 1,2; rational span 3ℚ | Retained | none |
| §5.5 S-integer image equality | S=∅ or containing a prime above 2; n=2,3 | odd localization surjects because K_(2n−2)(𝔽_q)=0; image ratio 1, including q=2 | No prime omitted | none |
| §5.5 order commensurability and transfer scope | common sublattice indices 2,3; identity transfer | larger lattices have covolumes c/2,c/3, ratio 3/2; identity trace scalar 1 | Order finite generation remains a supplier gap | none |
| §5.5 degree-one negative control | ℤ→ℤ[1/2] | unit ranks 0 and 1 | Higher-weight transport cannot be extended to K₁ | none |
| §6.1 point quotient and projection | n=1,2,3; z=1+i | P₀(z)=1,P₁(z)=i,P₂(z)=1; complementary components i,1,i lie in ℝ(n) | Quotient and inclusion are inverse | none |
| §6.1 projection kernel and junk value | n=2,3; n=0 under natural subtraction | P₁(1)=0,P₁(i)=i; P₂(1)=1,P₂(i)=0; junk P₀(1)=1 on ℝ(0) | Exactly the stated kernel for n>0 | none |
| §6.1 descent, integral structure, restriction and trace | ℚ,n=2,3; quadratic extension | invariant dimensions 0,1; ℤ(n) quotient image 0; surviving ℤ(n−1) generator has coordinate 1; odd TR=2 | Simultaneous conjugation and full trace retained | none |
| Universal Deligne contract and independently fixed normalization | point, n=1, unit e; n=2,3 target axes | log(abs(e))=1; point quotient axes iℝ,ℝ in weights 2,3 | Universal map has a normalization independent of Borel | b/F01 notation |
| §6.2 regulator comparison | d=0,1,2; rank-one r_Bo coordinate t=2 | determinant factors 1,2,4; r_Be coordinate 1, whereas zero gives 0≠2 after doubling | Independent maps; exact factor two unchanged | b/F01 notation |
| §6.2 lattice comparison | d=1,t=2 | Borel image 2ℤ has covolume 2; Beilinson image ℤ has covolume 1; ratio 2 | Matches ColemanIntegration normalization | none |
| Infinitesimal comparison contract | identity/point in positive degree; degree-zero constants | constant cosimplicial ℝ has H⁰=ℝ and H^q=0 for q>0; factor 1/2 arises only after the normalized cone comparison | Contract retains actual CE/Weil maps, not an assumed factor-two conclusion | none |
| §6.3 Adams scalar and determinant | a=2,n=3,d=1,2; d=0; a=1 | scalars 8,8; determinants 8,64; empty determinant 1; identity scalar and determinant 1 | Positive a, higher weight and injective regulator retained | none |

Number fields have characteristic zero, N≥1 and separable finite extensions. Zero rings, nonreduced bases and inseparable number-field extensions therefore do not instantiate these targets. The generic splitting-degree contract is broader and its dimension argument uses no separability. The quaternion instances test noncommutative algebras; arbitrary S₃ or Q₈ groups do not replace the specified algebraic groups. The stabilizer example tests the characteristic-two failure of naive quotient cohomology. Empty support, empty determinant, degree zero, degree one, the primes 2 and 3, the identity map, the zero class, the zero form and the inadmissible q=1 are explicitly represented above.

## Consequences for the maintainer

Polylogarithms' supplied README still needs these citation repairs: its references to BorelRegulators Layers 3–5 for injectivity/lattice/covolume should point to §§2.3 and 5.3–5.4; its three references to §7.1 should point to §5.1 and exists_pos_rat_dedekindZeta_of_isTotallyReal; its Tamagawa input is §3.4. The construction is §§2.1–2.2, Tate conversion §5.2, and the Beilinson factor §6.2. The additional broad Layers 3–5 references in its §2.3 proof route and §4.4 can use the same more precise locators. No consumer theorem name changed here.

The only deleted interface identifier is gap:classical-tamagawa-proof. The mathematical theorem is consumed from EndoscopicTransferAndUnitaryTraceComparison §6.2. The other three repaired gap needs sentences require their named suppliers' future extensions; they are not claims that the suppliers already contain those extensions. No merge-order placement, competing ownership decision or external edit is asserted to have been completed.
