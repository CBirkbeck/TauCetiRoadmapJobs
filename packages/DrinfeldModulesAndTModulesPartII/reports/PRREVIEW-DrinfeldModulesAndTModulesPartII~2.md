# Review of DrinfeldModulesAndTModulesPartII (pull request #1697 at 9b9bd2d)

**Verdict:** needs changes

## R01 (P2) — Restore the fourteen declared supplier contracts

**Location:** `TauCetiRoadmap/DrinfeldModulesAndTModulesPartII/README.md:7`, supplier contracts at lines 38–77, and local targets §§0.0, 0.2, 0.8, 1.3, 3.2 and 5.14. The scope says: “The power-sum degree theorem belongs to §0.2, the generating-series identity to §3.2, and finite-place specialisation to §5.14.”

**Claim:** The README still assigns this work locally although all fourteen declared gaps assign it to named suppliers. None of their required matching README contracts is present. The three-line repair changes only the matrix Checks and leaves the ownership inconsistency identified by previous R01 intact.

**Witness:** `packages/DrinfeldModulesAndTModulesPartII/design/plan.json:4742` assigns `general-power-sum-degree` to DrinfeldModulesAndTModules DM.6; README:287 still plans that theorem locally. Counting gives fourteen plan gap entries and zero README `gap:` occurrences.

**Exact repair:** Restore the fourteen `What <Supplier> must provide (gap:<slug>): <needs>` entries under the named suppliers in `Exact supplier contracts`. Import those results by supplier and section in the scope and affected dependency lines, and remove the competing local proof targets. Retain native definitions needed for statable headline tests. The agreed supplier declarations remain contracts even if their implementations are not yet available; their absence from a supplier today is not the defect.

| Gap slug |Declared supplier and section | Competing local ownership |
|---|---|---|
| `general-power-sum-degree` | DrinfeldModulesAndTModules DM.6 | §0.2 |
| `anderson-thakur-generating-series` | DrinfeldModulesAndTModules DM.6 | §3.2 |
| `v-adic-mzv-specialisation` | DrinfeldModulesAndTModules DM.6/v-adic-special-values | §5.14 |
| `parent-carlitz-products` | DrinfeldModulesAndTModules DM.0/carlitz-products | §0.0, products |
| `parent-period-analytic-field` | DrinfeldModulesAndTModules DM.2 | §0.0, field and exponential/logarithm |
| `parent-carlitz-omega` | DrinfeldModulesAndTModules DM.2/omega | §0.0, Omega |
| `parent-effective-dual-motives` | DrinfeldModulesAndTModules DM.4/inverse-twist-dual-motive | §0.0, effective motives |
| `parent-twisted-analytic-rings` | DrinfeldModulesAndTModules DM.8 | §0.0, arithmetic series and twist |
| `parent-abp-interface` | DrinfeldModulesAndTModules DM.8/abp-lifting | §0.0, lifting |
| `abp-entire-from-equation` | DrinfeldModulesAndTModules DM.8/entire-from-equation | §0.0, entireness |
| `frobenius-constant-denominator` | DrinfeldModulesAndTModules DM.8/constant-denominator | §0.0, rational comparisons |
| `frobenius-fundamental-matrix` | DrinfeldModulesAndTModules DM.8/fundamental-matrix | §0.0, rational comparisons |
| `parent-small-power-sums` | DrinfeldModulesAndTModules DM.6/small-power-sum | §0.8 and its depth-one input |
| `integral-positive-index-stuffle` | PeriodsAndSpecialValues PS.9.2 | §1.3 |

**Repair test:** The slug reconciliation currently gives 14 declared / 0 represented; after repair it must give 14 / 14, with the same named suppliers and no competing local ownership. For the concrete degree-theory instance q=3, k=1, d=0,1,2, the values remain 1, −1/(θ³−θ), 1/ℓ₂ and their degrees remain 0, −3, −12. Restoring DM.6 as supplier changes ownership, not this input or its general prime-power scope. For the changed empty-matrix case, the restored ABP and entireness contracts still allow determinant 1, the empty solution and the unique empty lift.

## Previous findings

- R01 — not repaired: README:7 and §§0.0, 0.2, 0.8, 1.3, 3.2, 5.14 retain local ownership; the fourteen plan gaps still have no matching README contracts.
- R02 — repaired: README:208 restricts the zero-matrix negative Check to positive size; README:209 gives determinant 1, the empty solution and the unique empty lift in size zero.

## Verified sound

This is an AI-assisted incremental re-review of 3 changed lines since 58a2def. I reviewed the two changed Checks, their entireness/lifting statements and dependent matrix conventions, and both previous findings. The Lean file, library pins and remaining mathematical statements are unchanged. There is one P2 finding, no new mathematical defect, and no change outside this roadmap folder. The worktree was left unchanged.

The inherited review is [PRREVIEW-DrinfeldModulesAndTModulesPartII~1][previous]. Its unchanged mathematical, library, headline-coverage and padding evidence is carried forward explicitly, not presented as a new full review. None of this round's fifteen seeded targets intersects the three-line diff. Their existing adversarial rows are retained below, including §§0.1, 0.5, 0.9, 0.12, 1.6, 1.8, 2.13, 3.8, 3.10, 3.12, 4.6, 4.7, 5.3, 5.6 and 5.11. No new or changed source locator requires certification.

### Gate and elaboration

The supplied gate passes including its build check. I reran the gate, the movable dependency check, the targeted build `lake build TauCetiRoadmap.DrinfeldModulesAndTModulesPartII.Suggested`, and direct `lake env lean` elaboration of the original file. All exited zero. The original file and targeted build each reported exactly 23 `sorry` warnings and no other warning.


```text
gate DrinfeldModulesAndTModulesPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The dependency check's complete output was:

```text
depcheck: 204 roadmaps, 1544 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. This graph check does not repair the missing contractual ownership in R01.

I also elaborated a scratch copy containing `#check @name` for all **40 declarations**, plus **eight proved boundary probes**. Its body matched the unchanged Suggested.lean before the probes were appended; it exited zero with the same 23 `sorry` warnings. The probes establish empty determinant 1, positive-size zero determinant 0, the empty determinant's nonzero evaluation and allowed factorisation, existence and uniqueness of the empty lifted row, the empty pairing 0, the empty difference equation, and coordinatewise membership in E. The previous comparison of all 40 signatures with the README carries forward; the two new Checks add no Lean binders and change no signature.

The preceding review's one-tactic padding probes on all 23 admitted theorems also carry forward: none closed with `simp`, `rfl`, or `infer_instance`, and its pinned object search found no single-library-lemma replacement. No unchanged theorem was retested for padding in this incremental review.

### Changed passage, sources and dependencies

- Reopened ABP04 Theorem 3.1.1, preprint pp.7–8, ABP04 lines 346–368, and Proposition 3.1.3 with its proof, pp.9–10, ABP04 lines 409–490. The two determinant conditions, column equation, arithmetic-series conclusion, row specialisation and vanishing pairing match README:202. The size-zero extension is verified directly; no analytic argument is needed for an empty list of coordinates.
- Opened pinned `Matrix.det_zero` at `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:91`: it requires a nonempty index type. Opened `Matrix.det_isEmpty` at line 97 and `Matrix.det_fin_zero` at line 798: the empty determinant is 1. These are existing Mathlib facts, so the repair correctly remains a README Check, not a new acceptance-test theorem.
- The determinant implication is unchanged and valid: c and θ are nonzero, hence c(−θ)^m is nonzero, also at m=0. The rank-zero convention at README:170 now agrees with both new Checks.
- Inspected the consumers in §§3.4, 3.6, 3.7, 3.9–3.11. An index of depth r has a full system of size r+1; at r=0 its matrix is (1), while its upper-left zero-size submatrix has determinant 1. The MZ property separately requires size at least 2. The merged-prefix system retains the empty root. None acquires a false positive-size restriction from the repair.
- Re-resolved the affected supplier passages through the roadmap service: `TauCetiRoadmap/ReductiveGroupsPartII/README.md:5201`, §RG2.3.7, supplies Lang for smooth geometrically connected finite-type groups; `TauCetiRoadmap/RestrictedPowerSeries/README.md:247` and :723, §§1.1 and 7.2, supply restricted norms and entire series. Both roadmaps were also read as shape comparisons. At size zero GL₀ is the trivial group, so Lang adds no obstruction.
- Reopened `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:2014`, PS.9.2, at its supplied open head. It supplies the rational stuffle presentation and ordered merges. The all-coefficient integral extension remains the named gap; this does not justify assigning its proof to local §1.3 while that contract remains in the plan.
- The fresh citation resolver found no unresolved cross-roadmap citation. Its output explicitly did not check external Lean names against pins; the determinant declarations above were therefore inspected directly at the local pin. Fresh main/open-head object searches for ABP, entireness, arithmetic entire series and stuffle were read in context. Topological ABP hits concern a different object. The repair introduces no construction or declaration requiring a new owner. The prior broader ownership audit is carried forward; the fourteen competing assignments in R01 remain the exception.

### Headline coverage carried forward

The unchanged headline inventory is: power-sum degree descent; MZV and CMPL nonvanishing; weight-graded products; ordinary, alternating and strong Brown spanning; equality of value spaces; Chang grading/descent; ABP independence and Eulerian suffixes; Frobenius dimensions and character/two-row rigidity; small-entry and small-weight independence; CMPL, Thakur and alternating Hoffman bases; Todd and alternating dimensions; algebraic-closure bases; relation kernels; character splitting and normalized-period relations; direct small-weight bounds; finite-place dimension bounds; and the Carlitz/interpolation foundations.

The file still contains 17 real-bodied definitions and 23 headline theorems. Its docstring names the non-statable period, arithmetic entire-series, interpolation, MZ-property, ABP, rewriting and v-adic interfaces. The repair creates no newly statable headline and adds no padding. Detailed unchanged carrier and binder findings are in the previous report.

### Adversarial table

There are **136 rows**: 132 unchanged rows carried from the previous report, each with its own attribution, and four freshly computed rows replacing the old zero-matrix row and covering every assertion in the changed Checks. Values in inherited rows are earlier computations, not newly executed computations. Here D=θ^q−θ, ℓ=−D and x=t−θ. Counts are combinatorial cardinalities, not independent computations of analytic ranks. “Keep” concerns the mathematical test and does not discharge R01's ownership defect.

| Statement | Instances tried | Values computed on the two sides / negative control | Result and change | Evidence |
|---|---|---|---|---|
| Conventions: finite field, q versus p | F₄, part 2; q=1 | 4∤2, whereas 2 divides 2; a field of cardinality 1 would have 0=1 | Keep q, not the characteristic; q=1 and zero ring excluded | [Previous review][previous] |
| Conventions: sign of ℓ | q=3,d=1 | ℓ+D=0; ℓ−D=2ℓ≠0 | Keep sign | [Previous review][previous] |
| Conventions: twist versus power | t+θ, q=3 | Twist=t+θ³; cube=t³+θ³ | Keep coefficient twist | [Previous review][previous] |
| §0.0 products, recursion, norms | d=0,1,2; q=3 | ℓ₀=D₀=1; ℓ₂=(θ−θ³)(θ−θ⁹); deg ℓ₂=12; D₂=(θ³−θ)³(θ⁹−θ), degree18 | Keep; R01 ownership | [Previous review][previous] |
| §0.0 analytic field | θ and θ^(1/3) at q=3 | v(θ)=−1; v(θ^(1/3))=−1/3, impossible inside K∞ | Keep completed algebraic closure and embeddings; R01 | [Previous review][previous] |
| §0.0 exponential functional equation | coefficient z and z^q | e_C(θz): θ, θ^q/D; θe_C(z)+e_C(z)^q: θ, θ/D+1=θ^q/D | Keep; R01 | [Previous review][previous] |
| §0.0 logarithm inverse | coefficient z^q in e_C(log_C z) | ℓ⁻¹+D⁻¹=0; linear coefficient1 | Keep convergence restriction; R01 | [Previous review][previous] |
| §0.0 arithmetic entire ring | 1,t versus Σt^n | First two entire; coefficients of third have limsup nth root1, not0; its terms do not tend to0 at radius1 | Keep distinction E/T/formal series | [Previous review][previous] |
| §0.0 inverse twist domain | t+θ, q=3 | Inverse twist=t+θ^(1/3); coefficient valuation−1/3 versus integral K-valuations | Keep K̄ domain; R01 | [Previous review][previous] |
| §0.0 fixed rings/fields | t,1/t,t−θ | σ(t)=t; σ(1/t)=1/t; σ(t−θ)=t−θ^(1/q)≠t−θ | Polynomial fixed ring differs from rational fixed field; keep | [Previous review][previous] |
| §0.0 Omega and period | q=3, t=θ | Ω^(1)(θ)=−1/(Dπ̃); v(π̃)=−3/2; changing ρ to−ρ changes π̃ to−π̃, leaving π̃² | Keep; R01 | [Previous review][previous] |
| §0.0 effective motive | rank0; rank1 Φ=1 | det empty=1, cokernel0; σ-fixed rank-one basis gives an infinite K̄-dimension module but a one-dimensional K̄[σ]-span of that basis | Do not infer finite σ-generation; keep broad effective definition | [Previous review][previous] |
| §0.0 t-module action/differential | d=0; Carlitz n=1,2 | Point exp/log unique; n=1 action θz+z^q; n=2 nilpotent differential part squares to0 and is nonzero | Keep | [Previous review][previous] |
| §0.0 torsion/regularity | Carlitz a=t | derivative of θX+X^q is θ≠0; degree q gives q distinct roots, rank1 over F_q; zero object has one point, rank0 | Keep | [Previous review][previous] |
| §0.0 quotient coordinate | σν−ν | Coordinate sum 1−1=0; aσν maps to a^q, rather than a | Keep semilinear quotient convention | [Previous review][previous] |
| §0.0 coproduct | N amalgamated with N over N | (x,y)↦x+y has relation (n,−n)↦0; quotient N, not N⊕N | Keep | [Previous review][previous] |
| §0.0 Yu subspace | Z=0 | exp(0)=0; minimal invariant subspace0=Lie(0) | Keep regularity/algebraic-point hypotheses | [Previous review][previous] |
| §0.0 entireness determinant | Φ=((x,0),(x,1)) | det Φ=x; det Φ(0)=−θ≠0 | Keep; R01 ownership | [Previous review][previous] |
| §0.0 ABP lift | Φ=I₂, ψ=(1,1), ρ=(1,−1) | ρψ(θ)=0; P=ρ gives Pψ=0 and P(θ)=ρ | Keep; R01 | [Previous review][previous] |
| §0.0 constant denominator | Φ₁=Φ₂=1; U=1/t | σ(U)=U=1/t, denominator t; U=1/(t−θ) gives unequal denominators t−θ^(1/q),t−θ | Keep; R01 | [Previous review][previous] |
| §0.0 fundamental matrix | Ψ=((Ω,0),(L,1)), C=((1,1),(0,1)) | (ΨC)₁₂=Ω; (CΨ)₁₂=1 | Keep right constant action; R01 | [Previous review][previous] |
| §0.1 weight/depth, empty index | (2,1,3),∅ | Sum6,length3; sum0,length0 | Native Composition excludes zero parts | [Previous review][previous] |
| §0.1 collapse | T₁(∅),T₃(1,2) | ∅,(3), respectively; no invented zero block | Keep | [Previous review][previous] |
| §0.1 prefix dominance | (1,2),(2,1); (1,3),(2,1,1) | Prefixes (1,3)≤(2,3), converse fails; (1,4,4) and (2,3,4) incomparable | Keep distinction from lexicographic order | [Previous review][previous] |
| §0.1 initial segment/admissibility | (q),(q,1),(q+1,1) | First is not 1-admissible; second is; Init of third=∅ | Keep terminal restriction | [Previous review][previous] |
| §0.2 exact and truncated empty sums | d=−1,0,1 | Exact empty values0,1,0; truncated empty values1,1,1 | Keep explicit convention; do not apply difference formula to empty index | [Previous review][previous] |
| §0.2 prefix product at d=0 | s=(1), tail=∅ | S₀(1)S_<0(∅)=1·1=1=S₀(1) | Empty truncation0 would give0≠1 | [Previous review][previous] |
| §0.2 positive-depth empty support | s=(1,1),d=0 | No tuple 0>d₂≥0; S₀(1,1)=0 | Keep | [Previous review][previous] |
| §0.2 powerSum_degree_descent | q=2,k=1,2,3; d=0,1,2 | Degrees (0,−2,−6), (0,−4,−12), (0,−4,−12), all strictly descending | Keep k>0; R01 ownership | [Previous review][previous] |
| §0.2 same theorem, odd field | q=3,k=1,2,3,4; d=0,1,2 | (0,−3,−12), (0,−6,−24), (0,−9,−36), (0,−6,−24) | Keep | [Previous review][previous] |
| §0.2 same theorem, nonprime q | q=4,k=1,…,5; d=0,1,2 | (0,−4,−20), (0,−8,−40), (0,−12,−60), (0,−16,−80), (0,−8,−40) | Keep full prime-power generality | [Previous review][previous] |
| §0.2 excluded exponent zero | d=0,1; k=0 | S₀(0)=1; S₁(0)=q=0 in F_q | Positivity prevents false nonvanishing and junk zero degree | [Previous review][previous] |
| §0.2 no-carry minimum | q=2,k=1,d=2 | Minimal (m₁,m₂)=(2,1), cost2+2=4; −dk−cost=−6 | Agrees with exact rational sum | [Previous review][previous] |
| §0.3 MZV convergence | q=3,index(1) | Degree0 term1; next term−1/D has degree−3; subsequent term degree−12 | Leading part1; first entry1 is allowed | [Previous review][previous] |
| §0.3 empty MZV / native tsum | weight0 | One empty tuple, product1, sum1 | No empty-sum0 convention | [Previous review][previous] |
| §0.4 degree characters | q=3,ε=−1,index1 | Degree1 contribution +1/D versus −1/D for ε=1; difference2/D has valuation3 | Keep ε^degree | [Previous review][previous] |
| §0.5 multipleZeta_ne_zero | q=3,index(1,1), any characters | Lowest degree tuple(1,0): −ε₁/D has valuation3; tuple(2,0) valuation12 | Unique leading term nonzero; keep | [Previous review][previous] |
| §0.6 ordinary CMPL vs degree-character series | depth1, γ^(q−1)=ε | γ^(q^d)=γ ε^d, so Li₁(γ)=γ Σ ε^d/ℓ_d | Keep root factor, not equality without γ | [Previous review][previous] |
| §0.6 domains | q=3,s=(2,2),u=(1,θ⁴) | Normalized exponents−3,+1; whole term exponent−3·3^i+3^j≤−8·3^j for i>j; tail exponent+3^j | Whole convergence does not license all tails | [Previous review][previous] |
| §0.7 multiplePolylog_ne_zero | unit coordinates; q=3,s=(1,1) | Lowest tuple norm3^−3; next tuple norm3^−12; a zero coordinate instead makes every term0 | Keep nonzero-coordinate, D′ hypotheses | [Previous review][previous] |
| §0.8 Carlitz identity | q=2,3,4; 1≤k≤q,d=0,1,2 | All 27 differences S_d(k)−ℓ_d^−k=0 | Keep range and R01 supplier | [Previous review][previous] |
| §0.8 range negative control | q=3,k=4,d=1 | S₁(4)=D^−4−D^−2; Si₁(4)=D^−4; difference−D^−2≠0 | No extension beyond q | [Previous review][previous] |
| §0.9 four weight spaces | weight0; zero combination | All spans K·1, dimension1; empty linear combination0 belongs to each | Keep native submodules, not sets of nonzero values | [Previous review][previous] |
| §0.10 Thakur versus IND | q=3,w=4 | T contains(3,1), not(4); IND contains(4), not(3,1); both cardinality6 | Keep bijection, not equality of index sets | [Previous review][previous] |
| §0.10 array block bijection | q=3,index4 with characterε | (4;ε) maps to (3,1;1,ε); total weight4 and total characterε on both sides | Keep character1 on inserted q-block | [Previous review][previous] |
| §0.11 Todd recurrence | q=3,w=5; q=2,w=4 | d₅=6+3+2=11; d₄=2+1=3 | Enumerated values11,3 | [Previous review][previous] |
| §0.11 weighted recurrences | q=3,w=5; q=4,w=5 | s₅=2(46+16)+6=130 versus t₅=2(48+16+6)=140; q=4 gives750 versus756 | Keep separate s and t | [Previous review][previous] |
| §0.11 small-entry counts | q=3,w=4; q=4,w=5 | c₄=5 versus d₄=6; c₅=13 versus d₅=14 | Keep c separate | [Previous review][previous] |
| §0.12 all counts | q=3,w=4 | (T,IND,small,AS,AT)=(6,6,5,46,48); all five defining counts reproduce these values | Keep | [Previous review][previous] |
| §0.12 zero counts | q=2,3,4,w=0 | Single empty composition, character count(q−1)^0=1; d=c=s=t=1 | Keep weight-zero extensions | [Previous review][previous] |
| §0.13 Carlitz evaluation | coefficient z^(q−1) | z/e_C(z) has coefficient−1/D; zeta generating expression has ζ_A(q−1)/π̃^(q−1)=−1/D | Sign agrees | [Previous review][previous] |
| §0.14 Eulerian obstruction | q=3,w=1,2 | v(π̃)=−3/2 not integral; v(π̃²)=−3 integral; nonzero K∞ constant-extension elements have integral valuations | Keep nonzero hypothesis and divisibility condition | [Previous review][previous] |
| §1.1 Δ coefficients | q=2,(a,b,j)=(1,2,1),(1,2,2); q=3,(2,2,2) | Coefficients1,0,1 respectively by the two binomial terms | Keep signs and support | [Previous review][previous] |
| §1.2 equal-degree product | q=3,d=1,a=b=2 | S₁(2)²=D^−4; S₁(4)+S₁(2,2)=(D^−4−D^−2)+D^−2=D^−4 | Extra q-shuffle term essential | [Previous review][previous] |
| §1.3 integral stuffle | [1]*[1] | Over Z:2[1,1]+[2]; over F₂:[2]; over F₃:2[1,1]+[2] | Coefficient extension correct; R01 ownership | [Previous review][previous] |
| §1.3 free carrier/unit | [∅]*[1], zero coefficient | [1] on both sides; Finsupp.single s 0=0 with empty support | Keep native carrier | [Previous review][previous] |
| §1.4 realisations | ∅; q=3,d=1,[2,2] | Infinite empty value1; finite degree value D^−2, equal to S₁(2)S₀(2) | Keep exact-degree convention | [Previous review][previous] |
| §1.5 truncated product | q=3,cutoff1,[1]*[1] | L_<1(1)²=1; L_<1(2)+2L_<1(1,1)=1+0=1 | Keep | [Previous review][previous] |
| §1.6 controlled product support | q=3,S₁(2)S₁(2) | Supports(4),(2,2), depths1,2≤2 and weight4; values sum D^−4 | Matches corrected induction | [Previous review][previous] |
| §1.7 zeta_space_mul_le | weights0 and0; nonempty indices(1),(1) | (K·1)(K·1)=K·1; stuffle terms have weights2,2 and total weight1+1=2 | Keep both ordinary and alternating algebra statements | [Previous review][previous] |
| §1.8 period powers | q=3,m=1,2 | π̃²=−Dζ_A(2); π̃⁴=D²ζ_A(2)², weights2,4 | Keep nonzero D and multiplication input | [Previous review][previous] |
| §2.1 binary relation vs total relation | ([∅],−[∅]), d=−1,0 | Degree residuals−1,+1 despite total realization1−1=0 | Excludes false converse | [Previous review][previous] |
| §2.2 fundamental relation | q=2,3,4; d=0,1 | S_d(q)+D S_(d+1)(1,q−1)=0 in all six exact rational computations | Keep; character version needs ε⁻¹ | [Previous review][previous] |
| §2.3 B* fixed part | q=2,d=1,R₁,head2 | B* fixed part0, C_(1,1) fixed partD^−3, desired S₁(2,2)=D^−2; 0−D·D^−3=D^−2 | Keep shifted coefficient b=D | [Previous review][previous] |
| §2.3 wrong BC coefficient | same test, coefficient1 | 0−D^−3=D^−3≠D^−2 | Negative control discriminates | [Previous review][previous] |
| §2.3 empty/head domains | C_∅, B*_∅, B*_0 | First two preserve R; head0 is not a positive index and has no operator | Keep | [Previous review][previous] |
| §2.4 C leading term | q=3,W=(1),d=0 | S₀(4)=1; shifted D S₁(1,3)=D·(−D^−1)=−1; other terms0 | Residual0 | [Previous review][previous] |
| §2.5 reduction | q=2,s=(3) | Two copies of ζ(2,1) and ζ(1,1,1) have coefficients2=0; remaining equation ζ(3)=Dζ(1,2) | Keep correction term before reducing coefficients | [Previous review][previous] |
| §2.6 admissible reduction | q=3,s=(3),k=1 | Output(1,2), first part1<3 and depth2≥1; collapsed sums3=3 | Keep depth and dominance bounds | [Previous review][previous] |
| §2.7 brown_spanning | q=2,w=2; w=0 | ζ(2)=Dζ(1,1); Thakur index count1; empty spanK·1 | Nonzero D gives the tested span equality | [Previous review][previous] |
| §2.7 alternating_brown_spanning | q=2,w=2 | F₂ units={1}; ordinary and alternating test both span Kζ(1,1) | Keep general theorem; no stronger inference from this special case | [Previous review][previous] |
| §2.8 value_space_bridges | q=3,w=2 | Both compositions(2),(1,1) have parts≤q, so each S/Si difference0; spans coincide term by term | Keep | [Previous review][previous] |
| §2.9 rewriting U | q=2 | U(3)=D[1,2]; U²(3)=D²([1,1,1]+[2,1]); both latter indices Thakur | Keep coefficients and direction | [Previous review][previous] |
| §2.9 fixed target family | q=3,(3,1) | U([3,1])=[3,1], whereas excluded singleton(3) maps to−D[1,2] | Nontrivial rewriting distinguished from identity | [Previous review][previous] |
| §2.10 termination | q=2,weight3 | Initial support{(3)}; after two steps support{(1,1,1),(2,1)}, both admissible | Keep finite homogeneous iteration | [Previous review][previous] |
| §2.11 IND generation | q=3,w=2 | IND₂={(2),(1,1)}, and both realizations agree termwise by §0.8 | Tested span equals Z₂ | [Previous review][previous] |
| §2.12 strong_brown_spanning | q=2,w=2 | IND₂={(1,1)}; Li(2)=D Li(1,1); dimension of this span1 | Keep nonzero coefficient | [Previous review][previous] |
| §2.13 special relation | q=2 | ζ(3)+Dζ(1,2)=0, same as §2.5 since −1=1 | Cross-layer signs agree | [Previous review][previous] |
| §3.1 factorial/generating definition | q=3,n=1,3,4,5 | Γ₁=Γ₃=1; Γ₄=Γ₅=D; H₁=H₃=1, H₄=2t³−t−θ³, H₅=θ³−t | Keep shifted n−1 indexing | [Previous review][previous] |
| §3.1 degree bound | q=3,n=5 | degθ H₅=3≤(5−1)3/2=6<15/2 | Keep bound, not equality | [Previous review][previous] |
| §3.2 generating series | d=0; q=3,d=1 | d=0 gives(1−x)^−1; d=1 gives(ℓ+x³−x)^−1; coefficient x³ is ℓ^−4−ℓ^−2=S₁(4) | Keep; R01 ownership | [Previous review][previous] |
| §3.2 interpolation | n=1,d=0,1 | Ω(θ)=π̃^−1; Ω^(1)(θ)=π̃^−1ℓ^−1=Γ₁S₁(1)/π̃ | Keep sign | [Previous review][previous] |
| §3.3 twist recursion | depth1,Q=1 | L(1)^(−1)−L(1)=xΩ; lower-row matrix product gives xΩ too | Keep inverse direction | [Previous review][previous] |
| §3.3 termwise bound | q=3,s=2,Q=1 versus Q=θ³ | Normalized norms3^−3<1 versus1; latter fails strict termwise bound | Keep strict inequality | [Previous review][previous] |
| §3.4 entire first column | q=3,s=(2,2),Q=(1,θ⁴) | Whole exponents≤−8·3^j→−∞, prefix exponent−3·3^i→−∞, tail exponent+3^j→+∞ | Keep prefix-only conclusion under weaker bound | [Previous review][previous] |
| §3.5 Frobenius specialisation | q=2,s=(1),Q=1,j=0,1 | L(θ)=−1/D; L(θ²)=1/D²=(−1/D)² | Keep | [Previous review][previous] |
| §3.5 zero/empty specialisation | Q has a zero coordinate; empty tuple | Series values0 and0^q=0; empty values1 and1^q=1 | No unsupported nonvanishing | [Previous review][previous] |
| §3.6 matrix, determinant | s=(2,1); depth0 | Diagonal x³,x,1 gives det x⁴, not x³; empty index Φ=(1),det1 | Keep tail weights and zero case | [Previous review][previous] |
| §3.6 full Ψ convergence | same Q=(1,θ⁴) example | Tail entry terms have norms3^(3^j), not tending to0 | Excluded by termwise hypothesis; source correction retained | [Previous review][previous] |
| §3.7 MZ property | Li(1), zero candidate | Φ=((x,0),(x,1)), ψ=(Ω,L); first valueπ̃^−1 and lastLi(1)/π̃; zero candidate violates Z≠0 | Keep nonzero definition | [Previous review][previous] |
| §3.7 scaling/products | aZ and Z₁Z₂ | Replacing c by c/a leaves cZ unchanged; tensor first coordinateπ̃^−w₁π̃^−w₂=π̃^−(w₁+w₂) | Keep K-unit coefficient restriction | [Previous review][previous] |
| §3.8 normalized general Q-values | Q=1; q=3,γ²=−1 | π̃ L(1;1)(θ)=Li(1); character version introduces γ, with γ²=−1 versus 1²=1 | Do not drop algebraic root factor for nontrivial character | [Previous review][previous] |
| §3.9 grading / zeta_algebra_graded | normalized Euler ratio, q=3 | ζ(2)/π̃²=−1/D∈K; its K̄-line equals the line of1, intersection dimension1 rather than0 | Excludes extending grading to normalized ratios; native statement uses MZVs | [Previous review][previous] |
| §3.9 scalar extension | w=0 in any compatible E | algebraMap(1)=1≠0; span over K̄ is K̄·1, dimension1 | Both K-scalar towers retained | [Previous review][previous] |
| §3.10 merged prefixes | no pairs; (1,2),(3) with Q=1 | I={∅}, size1 in empty case; I={∅,(1)}, size2 in second case; Φ-empty block diag(x^w,1),det x^w | Root retained | [Previous review][previous] |
| §3.10 polynomial-decorated prefixes | same index prefix with unequal Q | Distinct decorated prefixes remain distinct; example gives four nodes instead of wrongly merging to three | Keep pair-based prefix carrier | [Previous review][previous] |
| §3.11 ABP criterion/gauge | n=0 | Construction gives f=0, ψ̃=(1,Ω^w,0); LD would require both a=0 and a≠0 | No admissible relation in this case; keep nontriviality hypothesis | [Previous review][previous] |
| §3.12 Eulerian suffix | q=3,s=(1,2) isolated suffix2; q=2 arbitrary | Suffix weight2 divisible by2; q=2 modulus1 divides every weight | Keep positive/nonzero numerator qualification | [Previous review][previous] |
| §4.1 reducedPrefixes | q=3,w=2; w=0 | Reduced tree{∅,(2)}; weight0 tree{∅}; off-tree coordinate forced0 | Support condition excludes extra unconstrained coordinates | [Previous review][previous] |
| §4.1 residual / solution-space definition | q=3,w=2: f∅=t³−θ, f₂=t−t³ | Left substitution=t³−θ³; right=(t−θ)(t−θ)²=t³−θ³ | Residual0 in native θ-polynomial carrier | [Previous review][previous] |
| §4.2 monic descent | degree0 excluded; q=2,α²+α+1=0 | α²=α+1 permits α∉F₂; monic multiplier of positive degree is absent | Keeps positive degree needed for descent | [Previous review][previous] |
| §4.3 degree bound | previous q=3,w=2 solution | degθ f∅=1≤2/(3−1)=1; leaf degree0 | Sharp test | [Previous review][previous] |
| §4.4 key lemma / leaf substitution | q=3,M={(2)}, P=−D[2] | Li_P=π̃²; leaf a(θ)=θ−θ³ becomes t−t³; root t³−θ solves both rows | Keeps θ↦t, not original coefficient | [Previous review][previous] |
| §4.4 zero/empty-weight case | w=0,M={∅},P=a[∅] | Li_P=a∈K·1; solution coordinate a(t), fixed under θ-substitution | Keep weight-zero extension | [Previous review][previous] |
| §4.5 frobenius_solution_dimension | w=0; q=3,w=1,2 | Weight0 solutions constant in θ, dimension1; weight1 root degree≤1/2 forces0; weight2 displayed nonzero line | Predicted dimensions1,0,1 agree | [Previous review][previous] |
| §4.5 matrix size | q=3,ℓ=7,m=2 | 2ℓ−m=12; source's stray 2(ℓ−m)=10 | Keep corrected size | [Previous review][previous] |
| §4.6 twisted_system_rigidity | q=3,w=2,untwisted γ=1 | δ∅=t³−θ³,δ₂=t−t³ gives residual0; changing root factor yields (1−γ)(t−t³)(t−θ³)² | Nontrivial-character negative control is nonzero | [Previous review][previous] |
| §4.6 excluded weight0 | w=0,nontrivial ε | Constant root coordinate1 solves the equation because no child term occurs; asserted vanishing would give1=0 | Native hw>0 is essential | [Previous review][previous] |
| §4.7 two_row_rigidity | q=3,k=2,a=1 | δ₁=(t−θ)^6, a₁=t³−t, δ₂=a₂=0; forward equation both sides(t−θ³)^6 | Keep Eulerian line; not universal zero | [Previous review][previous] |
| §4.7 other endpoint | q=3,k=3 | Remaining equation(f+a₁)θ³−ft³−a₁t=0 gives a₁=−f and f(t³−t)=0, hence f=a₁=0 | Keep k=q in zero branch | [Previous review][previous] |
| §5.1 small_entry_independent | q=2,w=1 and0 | Index families{(1)} and{∅}; leading coefficients1 and1, so each singleton is independent | Correct boundary instantiations of deep theorem | [Previous review][previous] |
| §5.2 small-entry basis | q=3,w=2 and4 | At2 all2 compositions have entries<3; at4 small count5 versus Todd count6 | Keep basis range≤q | [Previous review][previous] |
| §5.3 q_indivisible_independent | q=3,w=4; q=4,part2 | Candidate count6 at upper bound4; q=4 keeps part2 since4∤2 | Correct family/range; counts alone not a proof of independence | [Previous review][previous] |
| §5.4 small-weight Thakur basis | q=3,w=4 | Six listed T-indices, versus six IND-indices; swap(4)↔(3,1) in the combinatorial bijection | Cardinality and range consistent | [Previous review][previous] |
| §5.5 cmpl_ind_basis | w=0; q=2,w=1 | Single values1 and Li(1) with leading coefficient1; span dimensions1,1 | Basis tests pass; general theorem matches CCM23 | [Previous review][previous] |
| §5.6 thakur_basis | w=0; q=2,w=2 | Single empty value1; ζ(2)=Dζ(1,1), with D≠0 and ζ(1,1)≠0 | Both tested spans dimension1 | [Previous review][previous] |
| §5.6 todd_dimension | q=2,w=0,1,2; q=3,w=5 count | Dimensions1,1,1 in singleton cases; defining d(5)=11 by enumeration and6+3+2 | Keeps natural cardinality definition | [Previous review][previous] |
| §5.6 thakur_basis_algebraicClosure | w=0, arbitrary compatible E | Empty value maps to1, independent over K̄; both spans K̄·1 | No lost scalar-tower binder | [Previous review][previous] |
| §5.7 relation kernel | q=2,w=1,2,3 | Ambient dimensions1,2,4; basis counts1,1,2; kernel dimensions0,1,2; weight3 displayed relations have pivots(1,2),(3) | Correct kernel, not entire free space | [Previous review][previous] |
| §5.8 character_roots_independent | q=3, roots1,i with i²=−1 | 1²=1,i²=2; X²+1 has values1,2,2 on F₃, so no root; rank{1,i}=2 over constant Laurent series | Keep distinct characters | [Previous review][previous] |
| §5.8 splitting by total character | q=3, coefficients a,b∈K∞ | a+bi=0 gives a=b=0 by the basis1,i; same-character roots differ by an F₃-unit | Group by total character, not individual chosen roots | [Previous review][previous] |
| §5.9 normalized period relations | q=3,w=2 | L(2)(θ)=−1/D, so 1+D L(2)(θ)=0; constant coefficient1 | Eulerian relation has nonzero constant and trivial character | [Previous review][previous] |
| §5.10 alternating_hoffman_basis | q=2,w=0,1 | F₂ units={1}; AS has one value1 or Li(1), each nonzero | Singleton tests pass | [Previous review][previous] |
| §5.11 alternating_dimension | q=2,w=0,1,2; q=3,w=4 count | Singleton dimensions1,1,1; q=3 weighted IND count46, versus Thakur-array spanning count48 | Does not identify spanning size with dimension | [Previous review][previous] |
| §5.12 ordinary lower bound | q=3,w=4 | IND count6 equals d(4)=6, while small-entry count5 | Keeps stronger IND family | [Previous review][previous] |
| §5.13 directIndices / spanning | q=3,w=4 | Six indices, 46 permitted arrays; unrestricted compositions give54 arrays | Correct restricted carrier | [Previous review][previous] |
| §5.13 adjacency control | q=3,w=5,6 | (2,3) admitted and(5) excluded; at6 (2,3,1),(1,2,3) admitted,(3,2,1) excluded; counts130,368 | Adjacency matters | [Previous review][previous] |
| §5.13 direct_small_weight_independent | q=3,w=7 | 37 indices,1040 arrays; s(7)=1042; (4,3),(2,5) admitted,(7),(2,2,3) excluded | Endpoint independence does not assert a basis | [Previous review][previous] |
| §5.13 q=2 endpoint | q=2,w=4 | Family{(2,1,1),(1,2,1),(1,3)} has3 values; naive preceding-rule family obeys the displayed nonzero relation | Keep special endpoint | [Previous review][previous] |
| §5.13 zero-weight signatures | w=0 | One empty array, value1, independent and spanning K | Both native signatures agree | [Previous review][previous] |
| §5.14 finite-place dimension bound | q=3,w=1,2,3,4; q=2,w=1,2,3 | d(w)−d(w−q+1)=(1,1,2,4); q=2 gives(0,0,1) | Arithmetic checks pass; negative weights interpreted as0 | [Previous review][previous] |
| §5.14 specialisation/kernel | any v, w=q−1 | ζ_A(q−1) maps to0; multiplication by its nonzero infinity-adic value embeds Z₀ of dimension1 | No good-v exclusion; R01 ownership | [Previous review][previous] |
| §0.0 positive-size zero Check, README:208 | ℓ=1,2 over F₃[t]; general ℓ=n+1 in Lean | det(0₁)=0 and det(0₂)=0; evaluation at 0 is 0. Allowed c(t−θ)^m is nonzero, so cannot equal 0 | Repaired negative control; positive-size restriction is essential | Fresh computation; Matrix.det_zero |
| §0.0 empty determinant and both hypotheses, README:209 | ℓ=0, c=1, m=0 over F₃[t] | det(0₀)=1=1·(t−θ)^0; evaluation at 0 is 1≠0 | Both determinant hypotheses hold | Fresh Lean probes |
| §0.0 empty solution, lift and pairing, README:209 | ℓ=0, unique empty ψ, ρ and P | σψ=()=Φψ; number of coordinates outside E is 0; P(θ)=()=ρ; Pψ=Σ over ∅=0; number of lifts is 1 | New positive control correct, including uniqueness | Fresh Lean probes |
| §0.0 determinant implication, README:208 | c=1, m=0,1,2 in F₃(θ)[t] | Evaluation of (t−θ)^m at 0 gives 1, −θ, θ², equal to (−θ)^m; all nonzero | Implication retains m=0 and needs no positive rank | Fresh symbolic computation |

## Not verifiable

- No source needed for the changed passages was inaccessible; ABP04 was read from the supplied legal cache. No missing-reference request is needed.
- The unchanged source sample and general mathematical audit are inherited from the previous report, rather than repeated. The Lean checks establish elaboration and the eight elementary probes, not proofs of the 23 admitted headline theorems.
- Future delivery of the fourteen supplier contracts is not certified here. Their absence today is not an extra finding; R01 concerns the conflicting ownership and missing required README declarations.

## Source issues

- none

No new source issue was found in this incremental check of ABP04. The eight source issues recorded by the previous review concern unchanged material and remain recorded there.

[previous]: packages/DrinfeldModulesAndTModulesPartII/reports/PRREVIEW-DrinfeldModulesAndTModulesPartII~1.md
