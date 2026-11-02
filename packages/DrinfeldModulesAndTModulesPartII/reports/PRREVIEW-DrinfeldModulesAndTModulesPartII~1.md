# Review of DrinfeldModulesAndTModulesPartII (pull request #1697 at 58a2def)

**Verdict:** needs changes

## R01 (P2) — Restore the declared ownership of the fourteen supplier gaps

**Location:** `TauCetiRoadmap/DrinfeldModulesAndTModulesPartII/README.md:7`, and its supplier contracts at lines 39–77. The opening assigns the foundations to §0.0, degree theory to §0.2, generating series to §3.2, and finite-place specialisation to §5.14.

**Claim:** These are local constructions. But the declared design assigns the same work to named suppliers. All fourteen declarations remain in `packages/DrinfeldModulesAndTModulesPartII/design/plan.json`; none has the required matching README contract. This creates two ownership descriptions and makes every corresponding gap redundant with a local target. A passing dependency scan does not resolve that inconsistency.

**Witness:** `packages/DrinfeldModulesAndTModulesPartII/design/plan.json:4742` assigns `general-power-sum-degree` to DrinfeldModulesAndTModules DM.6; README:286 plans that theorem locally. The plan has fourteen gap slugs; the README has zero `gap:` occurrences.

**Repair:** Restore each declared supplier and exact `What <Supplier> must provide (gap:<slug>): ...` contract under `Exact supplier contracts`. Import those results by supplier and section in the scope and affected `Needs` lines; remove their competing local proof targets. Keep the few native definitions needed to state the headline tests. Do not silently alter the accepted design's ownership. The existing declarations are contracts even where the supplier does not yet contain them; their absence there is not the defect being reported.

The complete reconciliation is:

| Gap slug | Declared supplier and section | Competing local ownership |
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

**Repair test:** For the degree-theory witness, the restored DM.6 contract still gives S₀(1)=1, S₁(1)=−1/(θ³−θ), S₂(1)=1/ℓ₂ at q=3, with degrees 0, −3, −12. It changes ownership, not the mathematical input. Apply the same slug-by-slug reconciliation to all fourteen rows: fourteen plan entries must have fourteen matching README contracts and one supplier each. This review does not modify either file.

## R02 (P3) — Exclude size zero from the zero-matrix negative Check

**Location:** `TauCetiRoadmap/DrinfeldModulesAndTModulesPartII/README.md:208`: “The zero square matrix has determinant zero and fails both hypotheses.”

**Claim:** This is offered as a negative control for the entireness and ABP determinant hypotheses, without a positive-size restriction.

**Witness:** Over F₃, det(0₀×₀)=1, whereas det(0₁×₁)=0. The empty matrix satisfies det Φ(0)≠0 and det Φ=1·(t−θ)⁰. Both values were independently elaborated in Lean.

**Repair:** Say “the zero square matrix of positive size” and add the empty-matrix positive control: determinant one, unique empty solution vector, unique empty lifted row. The repair gives determinant zero in size one and one in size zero, consistent with the rank-zero convention at README:170. The theorems themselves need no rank restriction.

## Verified sound

The review read all 1,585 README lines and all 449 Lean lines. The gate passes, the requested head matches, and the diff outside this roadmap folder is empty. There is one blocking finding (R01) and one Check correction (R02). No route restriction to prime q, good finite places, or nonempty weights was introduced by the native signatures. No sorry-defined data, `set_option`, copied source passage, or computational-algorithm deliverable was found in the reviewed files.

The worker's gate result is:

```text
gate DrinfeldModulesAndTModulesPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

I independently ran the required movable dependency check. Its complete output was:

```text
depcheck: 204 roadmaps, 1500 edges, 0 problem(s)
```

Every `Needs` line was read. There is no reported upward edge or cycle. The apparent numerical forward references in §0.0 are explicitly to RestrictedPowerSeries, not to later local targets. The named local subtargets within §0.0 are ordered. R01 concerns ownership omitted from that graph, not a falsely reported cycle.

### Source sample

All fifteen seeded targets were checked against the supplied legal texts. No README locator is marked unverified. The entries below specify the actual supporting location rather than treating an earlier page-start line as the theorem itself. The cached preprint numbering is used where the README cites that version; it is not silently identified with different journal pagination. The scan of AT90 pp.185–186 was inspected visually because its extracted text loses displayed equations.

| Seeded target | Text and locator inspected | Hypotheses and result checked |
|---|---|---|
| §0.0 foundations | PAP08 §§1.1.1, 2.1–2.2, 3.3 and 4.1.6: PAP08 lines 119, 281, 564, 1033; ABP04 §3.1, Theorem 3.1.1 and Proposition 3.1.3, pp.8–10: ABP04 lines 346, 409–484; CPY19 Proposition 2.2.1, p.6: CPY19 line 245; CM21 §§2.2–2.5, §6.3 and Theorem 1.3.2: CM21 lines 203, 372, 438, 543, 602, 1819 | Inverse twist, arithmetic finite-extension condition, nonzero determinants, right constant-matrix multiplication, and the extra finite-free σ-condition for the t-module quotient are retained. PAP08's period differs by a sign; the chosen generator and its (q−1)-st power are consistent. General regular t-modules are distinguished from the narrower uniformizable examples. |
| §0.2 power sums | ND21 §2.1, pp.5–7: ND21 lines 265–332; THAKUR09P proof of Theorem 1 and Theorem 4, pp.540–542: THAKUR09P lines 354–396, 445–465; SHEATS98 Theorem 1.2 and Lemma 1.3: SHEATS98 lines 115–155 | Positive exponents, arbitrary prime powers, the no-carry degree description, and strict descent in degree. Empty truncation is deliberately corrected relative to CCM23. |
| §0.5 nonvanishing | THAKUR09P Theorem 4, p.542: THAKUR09P lines 455–465 | All positive indices, including first entry one; the general-q argument is present. Degree characters have norm one and cannot cancel the unique leading degree tuple. |
| §0.7 CMPL nonvanishing | CHANG14 Definition 5.1.3, Remarks 5.1.4–5.1.5, p.13: CHANG14 lines 652–672 | Nonzero coordinates in the smaller polydisc D′; no nonvanishing assertion on the entire larger convergence domain. |
| §0.8 Carlitz identity | ND21 Proposition 2.1, pp.6–7: ND21 lines 265–332; IKLNDP24 Lemma 1.2, p.9: IKLNDP24 lines 570–595 | Every part at most q, arbitrary degree characters, and the stated degree conventions. |
| §0.12 counting | ND21 Lemma 6.1, p.22: ND21 lines 1345–1353; CCM23 Proposition 2.1.1, p.6: CCM23 line 280; IKLNDP24 §§1.3.2, 1.4.2, pp.23–25: IKLNDP24 lines 3208–3232, 3320–3332 | Block bijection, distinct weighted recurrences for AT and AS, and separate weight-zero extension. |
| §1.3 index space/products | CCM23 §2.3, pp.8–9: CCM23 lines 402–437; PeriodsAndSpecialValues PS.9.2 | Empty unit, ordered-merge multiplicities, positive-index recursion and q-shuffle correction. Integral extension is mathematically sound but has the ownership conflict R01. |
| §1.6 controlled products | THAKUR10 Theorem 3, pp.1978–1979, together with THAKUR-UPDATES entry 36, pp.7–8: THAKUR-UPDATES lines 305–345 and following induction; ND21 §2.1 | Coefficients in F_p, uniformity in degree, weight and depth support. The roadmap uses the corrected simultaneous induction, not the erroneous equality in the original proof. |
| §2.3 Todd operators | ND21 §2.2, pp.9–11: ND21 lines 457–565, 647–702; IKLNDP24 §§1.2.1–1.2.3 and §4.1.2 | Positive head for B*, empty C, fixed versus shifted parts, and the shifted coefficient b_j in BC. |
| §2.5 bad-index reduction | ND21 Propositions 2.12–2.13, pp.11–14: ND21 lines 702–852; IKLNDP24 Proposition 1.7, pp.17–21: IKLNDP24 lines 2323–2455 and continuation | The bad entry is greater than q, or a terminal q; three support types, split characters, and D₁-divisibility in the CMPL-array version. |
| §3.5 specialisations | CPY19 Proposition 2.3.3, p.7: CPY19 lines 275–334; CHANG14 Lemma 5.3.5, p.16: CHANG14 lines 792–815; IKLNDP24 §2.2.1, p.27: IKLNDP24 lines 3536–3549 | Frobenius specialisation on the whole-tuple convergence domain; zero-polynomial and empty-index cases; Γ/π and character-root factors. |
| §3.6 motives | IKLNDP24 Definition 2.1 and §2.2.1, pp.26–28: IKLNDP24 lines 3454–3569; ND21 Definition 4.1 and §4.2 | Tail-weight diagonal, lower subdiagonal, inverse twist and determinant exponent. The roadmap's stronger termwise hypothesis repairs the source's full-matrix convergence overclaim. |
| §4.4 key lemma | CCM23 Lemma 5.1.1, pp.22–24: CCM23 lines 1182–1196 and proof through line 1367 | Nonempty M, Eulerian combination, lower-prefix independence, additional suffix independence for the support conclusion, and substitution θ↦t in the leaf coefficients. |
| §5.5 CMPL basis | CCM23 Theorem 5.2.1, p.25: CCM23 lines 1373–1391 and continuation | All weights including zero; q-indivisible indices; the Eulerian line case is separated from the zero-dimensional solution case. |
| §5.8 character splitting | IKLNDP24 Lemmas 3.1–3.2, pp.33–34: IKLNDP24 lines 3942–3984 | Distinct characters; arbitrary choices of their (q−1)-st roots; independence over the constant field and then over K∞; splitting of normalized period relations by total character. |

### Computed adversarial pass

This table records finite tests and exact symbolic substitutions, not a claim that testing proves an infinite theorem. Full mathematical support comes from the statements and proof routes checked above. A cardinality computation is reported as a cardinality, not as an independently computed analytic rank. Here D=θ^q−θ, ℓ=−D, and x=t−θ. Norms are infinity norms. “Keep” means no change suggested by that instance; R01 still applies to the ownership of its indicated foundations.

The rational-function tests used exact arithmetic over F₂, F₃ and F₄=F₂[u]/(u²+u+1), enumerating the monic polynomials. Counts enumerate compositions, not numerical approximations to periods. The table has 133 adversarial rows. There were 36 nonzero power sums in the degree-descent tests, 27 small-exponent Carlitz comparisons, six fundamental-relation residuals, and 24 weight/cardinality rows for q=2,3,4 and w=0,…,7. The empty-matrix tests also ran in Lean.

| Statement | Instances tried | Values computed on the two sides / negative control | Result and change |
|---|---|---|---|
| Conventions: finite field, q versus p | F₄, part 2; q=1 | 4∤2, whereas 2 divides 2; a field of cardinality 1 would have 0=1 | Keep q, not the characteristic; q=1 and zero ring excluded |
| Conventions: sign of ℓ | q=3,d=1 | ℓ+D=0; ℓ−D=2ℓ≠0 | Keep sign |
| Conventions: twist versus power | t+θ, q=3 | Twist=t+θ³; cube=t³+θ³ | Keep coefficient twist |
| §0.0 products, recursion, norms | d=0,1,2; q=3 | ℓ₀=D₀=1; ℓ₂=(θ−θ³)(θ−θ⁹); deg ℓ₂=12; D₂=(θ³−θ)³(θ⁹−θ), degree18 | Keep; R01 ownership |
| §0.0 analytic field | θ and θ^(1/3) at q=3 | v(θ)=−1; v(θ^(1/3))=−1/3, impossible inside K∞ | Keep completed algebraic closure and embeddings; R01 |
| §0.0 exponential functional equation | coefficient z and z^q | e_C(θz): θ, θ^q/D; θe_C(z)+e_C(z)^q: θ, θ/D+1=θ^q/D | Keep; R01 |
| §0.0 logarithm inverse | coefficient z^q in e_C(log_C z) | ℓ⁻¹+D⁻¹=0; linear coefficient1 | Keep convergence restriction; R01 |
| §0.0 arithmetic entire ring | 1,t versus Σt^n | First two entire; coefficients of third have limsup nth root1, not0; its terms do not tend to0 at radius1 | Keep distinction E/T/formal series |
| §0.0 inverse twist domain | t+θ, q=3 | Inverse twist=t+θ^(1/3); coefficient valuation−1/3 versus integral K-valuations | Keep K̄ domain; R01 |
| §0.0 fixed rings/fields | t,1/t,t−θ | σ(t)=t; σ(1/t)=1/t; σ(t−θ)=t−θ^(1/q)≠t−θ | Polynomial fixed ring differs from rational fixed field; keep |
| §0.0 Omega and period | q=3, t=θ | Ω^(1)(θ)=−1/(Dπ̃); v(π̃)=−3/2; changing ρ to−ρ changes π̃ to−π̃, leaving π̃² | Keep; R01 |
| §0.0 effective motive | rank0; rank1 Φ=1 | det empty=1, cokernel0; σ-fixed rank-one basis gives an infinite K̄-dimension module but a one-dimensional K̄[σ]-span of that basis | Do not infer finite σ-generation; keep broad effective definition |
| §0.0 t-module action/differential | d=0; Carlitz n=1,2 | Point exp/log unique; n=1 action θz+z^q; n=2 nilpotent differential part squares to0 and is nonzero | Keep |
| §0.0 torsion/regularity | Carlitz a=t | derivative of θX+X^q is θ≠0; degree q gives q distinct roots, rank1 over F_q; zero object has one point, rank0 | Keep |
| §0.0 quotient coordinate | σν−ν | Coordinate sum 1−1=0; aσν maps to a^q, rather than a | Keep semilinear quotient convention |
| §0.0 coproduct | N amalgamated with N over N | (x,y)↦x+y has relation (n,−n)↦0; quotient N, not N⊕N | Keep |
| §0.0 Yu subspace | Z=0 | exp(0)=0; minimal invariant subspace0=Lie(0) | Keep regularity/algebraic-point hypotheses |
| §0.0 entireness determinant | Φ=((x,0),(x,1)) | det Φ=x; det Φ(0)=−θ≠0 | Keep; R01 ownership |
| §0.0 ABP lift | Φ=I₂, ψ=(1,1), ρ=(1,−1) | ρψ(θ)=0; P=ρ gives Pψ=0 and P(θ)=ρ | Keep; R01 |
| §0.0 zero-matrix Check | sizes0,1 over F₃ | det0₀×₀=1 versus claimed0; det0₁×₁=0 | R02: require positive size in negative control |
| §0.0 constant denominator | Φ₁=Φ₂=1; U=1/t | σ(U)=U=1/t, denominator t; U=1/(t−θ) gives unequal denominators t−θ^(1/q),t−θ | Keep; R01 |
| §0.0 fundamental matrix | Ψ=((Ω,0),(L,1)), C=((1,1),(0,1)) | (ΨC)₁₂=Ω; (CΨ)₁₂=1 | Keep right constant action; R01 |
| §0.1 weight/depth, empty index | (2,1,3),∅ | Sum6,length3; sum0,length0 | Native Composition excludes zero parts |
| §0.1 collapse | T₁(∅),T₃(1,2) | ∅,(3), respectively; no invented zero block | Keep |
| §0.1 prefix dominance | (1,2),(2,1); (1,3),(2,1,1) | Prefixes (1,3)≤(2,3), converse fails; (1,4,4) and (2,3,4) incomparable | Keep distinction from lexicographic order |
| §0.1 initial segment/admissibility | (q),(q,1),(q+1,1) | First is not 1-admissible; second is; Init of third=∅ | Keep terminal restriction |
| §0.2 exact and truncated empty sums | d=−1,0,1 | Exact empty values0,1,0; truncated empty values1,1,1 | Keep explicit convention; do not apply difference formula to empty index |
| §0.2 prefix product at d=0 | s=(1), tail=∅ | S₀(1)S_<0(∅)=1·1=1=S₀(1) | Empty truncation0 would give0≠1 |
| §0.2 positive-depth empty support | s=(1,1),d=0 | No tuple 0>d₂≥0; S₀(1,1)=0 | Keep |
| §0.2 powerSum_degree_descent | q=2,k=1,2,3; d=0,1,2 | Degrees (0,−2,−6), (0,−4,−12), (0,−4,−12), all strictly descending | Keep k>0; R01 ownership |
| §0.2 same theorem, odd field | q=3,k=1,2,3,4; d=0,1,2 | (0,−3,−12), (0,−6,−24), (0,−9,−36), (0,−6,−24) | Keep |
| §0.2 same theorem, nonprime q | q=4,k=1,…,5; d=0,1,2 | (0,−4,−20), (0,−8,−40), (0,−12,−60), (0,−16,−80), (0,−8,−40) | Keep full prime-power generality |
| §0.2 excluded exponent zero | d=0,1; k=0 | S₀(0)=1; S₁(0)=q=0 in F_q | Positivity prevents false nonvanishing and junk zero degree |
| §0.2 no-carry minimum | q=2,k=1,d=2 | Minimal (m₁,m₂)=(2,1), cost2+2=4; −dk−cost=−6 | Agrees with exact rational sum |
| §0.3 MZV convergence | q=3,index(1) | Degree0 term1; next term−1/D has degree−3; subsequent term degree−12 | Leading part1; first entry1 is allowed |
| §0.3 empty MZV / native tsum | weight0 | One empty tuple, product1, sum1 | No empty-sum0 convention |
| §0.4 degree characters | q=3,ε=−1,index1 | Degree1 contribution +1/D versus −1/D for ε=1; difference2/D has valuation3 | Keep ε^degree |
| §0.5 multipleZeta_ne_zero | q=3,index(1,1), any characters | Lowest degree tuple(1,0): −ε₁/D has valuation3; tuple(2,0) valuation12 | Unique leading term nonzero; keep |
| §0.6 ordinary CMPL vs degree-character series | depth1, γ^(q−1)=ε | γ^(q^d)=γ ε^d, so Li₁(γ)=γ Σ ε^d/ℓ_d | Keep root factor, not equality without γ |
| §0.6 domains | q=3,s=(2,2),u=(1,θ⁴) | Normalized exponents−3,+1; whole term exponent−3·3^i+3^j≤−8·3^j for i>j; tail exponent+3^j | Whole convergence does not license all tails |
| §0.7 multiplePolylog_ne_zero | unit coordinates; q=3,s=(1,1) | Lowest tuple norm3^−3; next tuple norm3^−12; a zero coordinate instead makes every term0 | Keep nonzero-coordinate, D′ hypotheses |
| §0.8 Carlitz identity | q=2,3,4; 1≤k≤q,d=0,1,2 | All 27 differences S_d(k)−ℓ_d^−k=0 | Keep range and R01 supplier |
| §0.8 range negative control | q=3,k=4,d=1 | S₁(4)=D^−4−D^−2; Si₁(4)=D^−4; difference−D^−2≠0 | No extension beyond q |
| §0.9 four weight spaces | weight0; zero combination | All spans K·1, dimension1; empty linear combination0 belongs to each | Keep native submodules, not sets of nonzero values |
| §0.10 Thakur versus IND | q=3,w=4 | T contains(3,1), not(4); IND contains(4), not(3,1); both cardinality6 | Keep bijection, not equality of index sets |
| §0.10 array block bijection | q=3,index4 with characterε | (4;ε) maps to (3,1;1,ε); total weight4 and total characterε on both sides | Keep character1 on inserted q-block |
| §0.11 Todd recurrence | q=3,w=5; q=2,w=4 | d₅=6+3+2=11; d₄=2+1=3 | Enumerated values11,3 |
| §0.11 weighted recurrences | q=3,w=5; q=4,w=5 | s₅=2(46+16)+6=130 versus t₅=2(48+16+6)=140; q=4 gives750 versus756 | Keep separate s and t |
| §0.11 small-entry counts | q=3,w=4; q=4,w=5 | c₄=5 versus d₄=6; c₅=13 versus d₅=14 | Keep c separate |
| §0.12 all counts | q=3,w=4 | (T,IND,small,AS,AT)=(6,6,5,46,48); all five defining counts reproduce these values | Keep |
| §0.12 zero counts | q=2,3,4,w=0 | Single empty composition, character count(q−1)^0=1; d=c=s=t=1 | Keep weight-zero extensions |
| §0.13 Carlitz evaluation | coefficient z^(q−1) | z/e_C(z) has coefficient−1/D; zeta generating expression has ζ_A(q−1)/π̃^(q−1)=−1/D | Sign agrees |
| §0.14 Eulerian obstruction | q=3,w=1,2 | v(π̃)=−3/2 not integral; v(π̃²)=−3 integral; nonzero K∞ constant-extension elements have integral valuations | Keep nonzero hypothesis and divisibility condition |
| §1.1 Δ coefficients | q=2,(a,b,j)=(1,2,1),(1,2,2); q=3,(2,2,2) | Coefficients1,0,1 respectively by the two binomial terms | Keep signs and support |
| §1.2 equal-degree product | q=3,d=1,a=b=2 | S₁(2)²=D^−4; S₁(4)+S₁(2,2)=(D^−4−D^−2)+D^−2=D^−4 | Extra q-shuffle term essential |
| §1.3 integral stuffle | [1]*[1] | Over Z:2[1,1]+[2]; over F₂:[2]; over F₃:2[1,1]+[2] | Coefficient extension correct; R01 ownership |
| §1.3 free carrier/unit | [∅]*[1], zero coefficient | [1] on both sides; Finsupp.single s 0=0 with empty support | Keep native carrier |
| §1.4 realisations | ∅; q=3,d=1,[2,2] | Infinite empty value1; finite degree value D^−2, equal to S₁(2)S₀(2) | Keep exact-degree convention |
| §1.5 truncated product | q=3,cutoff1,[1]*[1] | L_<1(1)²=1; L_<1(2)+2L_<1(1,1)=1+0=1 | Keep |
| §1.6 controlled product support | q=3,S₁(2)S₁(2) | Supports(4),(2,2), depths1,2≤2 and weight4; values sum D^−4 | Matches corrected induction |
| §1.7 zeta_space_mul_le | weights0 and0; nonempty indices(1),(1) | (K·1)(K·1)=K·1; stuffle terms have weights2,2 and total weight1+1=2 | Keep both ordinary and alternating algebra statements |
| §1.8 period powers | q=3,m=1,2 | π̃²=−Dζ_A(2); π̃⁴=D²ζ_A(2)², weights2,4 | Keep nonzero D and multiplication input |
| §2.1 binary relation vs total relation | ([∅],−[∅]), d=−1,0 | Degree residuals−1,+1 despite total realization1−1=0 | Excludes false converse |
| §2.2 fundamental relation | q=2,3,4; d=0,1 | S_d(q)+D S_(d+1)(1,q−1)=0 in all six exact rational computations | Keep; character version needs ε⁻¹ |
| §2.3 B* fixed part | q=2,d=1,R₁,head2 | B* fixed part0, C_(1,1) fixed partD^−3, desired S₁(2,2)=D^−2; 0−D·D^−3=D^−2 | Keep shifted coefficient b=D |
| §2.3 wrong BC coefficient | same test, coefficient1 | 0−D^−3=D^−3≠D^−2 | Negative control discriminates |
| §2.3 empty/head domains | C_∅, B*_∅, B*_0 | First two preserve R; head0 is not a positive index and has no operator | Keep |
| §2.4 C leading term | q=3,W=(1),d=0 | S₀(4)=1; shifted D S₁(1,3)=D·(−D^−1)=−1; other terms0 | Residual0 |
| §2.5 reduction | q=2,s=(3) | Two copies of ζ(2,1) and ζ(1,1,1) have coefficients2=0; remaining equation ζ(3)=Dζ(1,2) | Keep correction term before reducing coefficients |
| §2.6 admissible reduction | q=3,s=(3),k=1 | Output(1,2), first part1<3 and depth2≥1; collapsed sums3=3 | Keep depth and dominance bounds |
| §2.7 brown_spanning | q=2,w=2; w=0 | ζ(2)=Dζ(1,1); Thakur index count1; empty spanK·1 | Nonzero D gives the tested span equality |
| §2.7 alternating_brown_spanning | q=2,w=2 | F₂ units={1}; ordinary and alternating test both span Kζ(1,1) | Keep general theorem; no stronger inference from this special case |
| §2.8 value_space_bridges | q=3,w=2 | Both compositions(2),(1,1) have parts≤q, so each S/Si difference0; spans coincide term by term | Keep |
| §2.9 rewriting U | q=2 | U(3)=D[1,2]; U²(3)=D²([1,1,1]+[2,1]); both latter indices Thakur | Keep coefficients and direction |
| §2.9 fixed target family | q=3,(3,1) | U([3,1])=[3,1], whereas excluded singleton(3) maps to−D[1,2] | Nontrivial rewriting distinguished from identity |
| §2.10 termination | q=2,weight3 | Initial support{(3)}; after two steps support{(1,1,1),(2,1)}, both admissible | Keep finite homogeneous iteration |
| §2.11 IND generation | q=3,w=2 | IND₂={(2),(1,1)}, and both realizations agree termwise by §0.8 | Tested span equals Z₂ |
| §2.12 strong_brown_spanning | q=2,w=2 | IND₂={(1,1)}; Li(2)=D Li(1,1); dimension of this span1 | Keep nonzero coefficient |
| §2.13 special relation | q=2 | ζ(3)+Dζ(1,2)=0, same as §2.5 since −1=1 | Cross-layer signs agree |
| §3.1 factorial/generating definition | q=3,n=1,3,4,5 | Γ₁=Γ₃=1; Γ₄=Γ₅=D; H₁=H₃=1, H₄=2t³−t−θ³, H₅=θ³−t | Keep shifted n−1 indexing |
| §3.1 degree bound | q=3,n=5 | degθ H₅=3≤(5−1)3/2=6<15/2 | Keep bound, not equality |
| §3.2 generating series | d=0; q=3,d=1 | d=0 gives(1−x)^−1; d=1 gives(ℓ+x³−x)^−1; coefficient x³ is ℓ^−4−ℓ^−2=S₁(4) | Keep; R01 ownership |
| §3.2 interpolation | n=1,d=0,1 | Ω(θ)=π̃^−1; Ω^(1)(θ)=π̃^−1ℓ^−1=Γ₁S₁(1)/π̃ | Keep sign |
| §3.3 twist recursion | depth1,Q=1 | L(1)^(−1)−L(1)=xΩ; lower-row matrix product gives xΩ too | Keep inverse direction |
| §3.3 termwise bound | q=3,s=2,Q=1 versus Q=θ³ | Normalized norms3^−3<1 versus1; latter fails strict termwise bound | Keep strict inequality |
| §3.4 entire first column | q=3,s=(2,2),Q=(1,θ⁴) | Whole exponents≤−8·3^j→−∞, prefix exponent−3·3^i→−∞, tail exponent+3^j→+∞ | Keep prefix-only conclusion under weaker bound |
| §3.5 Frobenius specialisation | q=2,s=(1),Q=1,j=0,1 | L(θ)=−1/D; L(θ²)=1/D²=(−1/D)² | Keep |
| §3.5 zero/empty specialisation | Q has a zero coordinate; empty tuple | Series values0 and0^q=0; empty values1 and1^q=1 | No unsupported nonvanishing |
| §3.6 matrix, determinant | s=(2,1); depth0 | Diagonal x³,x,1 gives det x⁴, not x³; empty index Φ=(1),det1 | Keep tail weights and zero case |
| §3.6 full Ψ convergence | same Q=(1,θ⁴) example | Tail entry terms have norms3^(3^j), not tending to0 | Excluded by termwise hypothesis; source correction retained |
| §3.7 MZ property | Li(1), zero candidate | Φ=((x,0),(x,1)), ψ=(Ω,L); first valueπ̃^−1 and lastLi(1)/π̃; zero candidate violates Z≠0 | Keep nonzero definition |
| §3.7 scaling/products | aZ and Z₁Z₂ | Replacing c by c/a leaves cZ unchanged; tensor first coordinateπ̃^−w₁π̃^−w₂=π̃^−(w₁+w₂) | Keep K-unit coefficient restriction |
| §3.8 normalized general Q-values | Q=1; q=3,γ²=−1 | π̃ L(1;1)(θ)=Li(1); character version introduces γ, with γ²=−1 versus 1²=1 | Do not drop algebraic root factor for nontrivial character |
| §3.9 grading / zeta_algebra_graded | normalized Euler ratio, q=3 | ζ(2)/π̃²=−1/D∈K; its K̄-line equals the line of1, intersection dimension1 rather than0 | Excludes extending grading to normalized ratios; native statement uses MZVs |
| §3.9 scalar extension | w=0 in any compatible E | algebraMap(1)=1≠0; span over K̄ is K̄·1, dimension1 | Both K-scalar towers retained |
| §3.10 merged prefixes | no pairs; (1,2),(3) with Q=1 | I={∅}, size1 in empty case; I={∅,(1)}, size2 in second case; Φ-empty block diag(x^w,1),det x^w | Root retained |
| §3.10 polynomial-decorated prefixes | same index prefix with unequal Q | Distinct decorated prefixes remain distinct; example gives four nodes instead of wrongly merging to three | Keep pair-based prefix carrier |
| §3.11 ABP criterion/gauge | n=0 | Construction gives f=0, ψ̃=(1,Ω^w,0); LD would require both a=0 and a≠0 | No admissible relation in this case; keep nontriviality hypothesis |
| §3.12 Eulerian suffix | q=3,s=(1,2) isolated suffix2; q=2 arbitrary | Suffix weight2 divisible by2; q=2 modulus1 divides every weight | Keep positive/nonzero numerator qualification |
| §4.1 reducedPrefixes | q=3,w=2; w=0 | Reduced tree{∅,(2)}; weight0 tree{∅}; off-tree coordinate forced0 | Support condition excludes extra unconstrained coordinates |
| §4.1 residual / solution-space definition | q=3,w=2: f∅=t³−θ, f₂=t−t³ | Left substitution=t³−θ³; right=(t−θ)(t−θ)²=t³−θ³ | Residual0 in native θ-polynomial carrier |
| §4.2 monic descent | degree0 excluded; q=2,α²+α+1=0 | α²=α+1 permits α∉F₂; monic multiplier of positive degree is absent | Keeps positive degree needed for descent |
| §4.3 degree bound | previous q=3,w=2 solution | degθ f∅=1≤2/(3−1)=1; leaf degree0 | Sharp test |
| §4.4 key lemma / leaf substitution | q=3,M={(2)}, P=−D[2] | Li_P=π̃²; leaf a(θ)=θ−θ³ becomes t−t³; root t³−θ solves both rows | Keeps θ↦t, not original coefficient |
| §4.4 zero/empty-weight case | w=0,M={∅},P=a[∅] | Li_P=a∈K·1; solution coordinate a(t), fixed under θ-substitution | Keep weight-zero extension |
| §4.5 frobenius_solution_dimension | w=0; q=3,w=1,2 | Weight0 solutions constant in θ, dimension1; weight1 root degree≤1/2 forces0; weight2 displayed nonzero line | Predicted dimensions1,0,1 agree |
| §4.5 matrix size | q=3,ℓ=7,m=2 | 2ℓ−m=12; source's stray 2(ℓ−m)=10 | Keep corrected size |
| §4.6 twisted_system_rigidity | q=3,w=2,untwisted γ=1 | δ∅=t³−θ³,δ₂=t−t³ gives residual0; changing root factor yields (1−γ)(t−t³)(t−θ³)² | Nontrivial-character negative control is nonzero |
| §4.6 excluded weight0 | w=0,nontrivial ε | Constant root coordinate1 solves the equation because no child term occurs; asserted vanishing would give1=0 | Native hw>0 is essential |
| §4.7 two_row_rigidity | q=3,k=2,a=1 | δ₁=(t−θ)^6, a₁=t³−t, δ₂=a₂=0; forward equation both sides(t−θ³)^6 | Keep Eulerian line; not universal zero |
| §4.7 other endpoint | q=3,k=3 | Remaining equation(f+a₁)θ³−ft³−a₁t=0 gives a₁=−f and f(t³−t)=0, hence f=a₁=0 | Keep k=q in zero branch |
| §5.1 small_entry_independent | q=2,w=1 and0 | Index families{(1)} and{∅}; leading coefficients1 and1, so each singleton is independent | Correct boundary instantiations of deep theorem |
| §5.2 small-entry basis | q=3,w=2 and4 | At2 all2 compositions have entries<3; at4 small count5 versus Todd count6 | Keep basis range≤q |
| §5.3 q_indivisible_independent | q=3,w=4; q=4,part2 | Candidate count6 at upper bound4; q=4 keeps part2 since4∤2 | Correct family/range; counts alone not a proof of independence |
| §5.4 small-weight Thakur basis | q=3,w=4 | Six listed T-indices, versus six IND-indices; swap(4)↔(3,1) in the combinatorial bijection | Cardinality and range consistent |
| §5.5 cmpl_ind_basis | w=0; q=2,w=1 | Single values1 and Li(1) with leading coefficient1; span dimensions1,1 | Basis tests pass; general theorem matches CCM23 |
| §5.6 thakur_basis | w=0; q=2,w=2 | Single empty value1; ζ(2)=Dζ(1,1), with D≠0 and ζ(1,1)≠0 | Both tested spans dimension1 |
| §5.6 todd_dimension | q=2,w=0,1,2; q=3,w=5 count | Dimensions1,1,1 in singleton cases; defining d(5)=11 by enumeration and6+3+2 | Keeps natural cardinality definition |
| §5.6 thakur_basis_algebraicClosure | w=0, arbitrary compatible E | Empty value maps to1, independent over K̄; both spans K̄·1 | No lost scalar-tower binder |
| §5.7 relation kernel | q=2,w=1,2,3 | Ambient dimensions1,2,4; basis counts1,1,2; kernel dimensions0,1,2; weight3 displayed relations have pivots(1,2),(3) | Correct kernel, not entire free space |
| §5.8 character_roots_independent | q=3, roots1,i with i²=−1 | 1²=1,i²=2; X²+1 has values1,2,2 on F₃, so no root; rank{1,i}=2 over constant Laurent series | Keep distinct characters |
| §5.8 splitting by total character | q=3, coefficients a,b∈K∞ | a+bi=0 gives a=b=0 by the basis1,i; same-character roots differ by an F₃-unit | Group by total character, not individual chosen roots |
| §5.9 normalized period relations | q=3,w=2 | L(2)(θ)=−1/D, so 1+D L(2)(θ)=0; constant coefficient1 | Eulerian relation has nonzero constant and trivial character |
| §5.10 alternating_hoffman_basis | q=2,w=0,1 | F₂ units={1}; AS has one value1 or Li(1), each nonzero | Singleton tests pass |
| §5.11 alternating_dimension | q=2,w=0,1,2; q=3,w=4 count | Singleton dimensions1,1,1; q=3 weighted IND count46, versus Thakur-array spanning count48 | Does not identify spanning size with dimension |
| §5.12 ordinary lower bound | q=3,w=4 | IND count6 equals d(4)=6, while small-entry count5 | Keeps stronger IND family |
| §5.13 directIndices / spanning | q=3,w=4 | Six indices, 46 permitted arrays; unrestricted compositions give54 arrays | Correct restricted carrier |
| §5.13 adjacency control | q=3,w=5,6 | (2,3) admitted and(5) excluded; at6 (2,3,1),(1,2,3) admitted,(3,2,1) excluded; counts130,368 | Adjacency matters |
| §5.13 direct_small_weight_independent | q=3,w=7 | 37 indices,1040 arrays; s(7)=1042; (4,3),(2,5) admitted,(7),(2,2,3) excluded | Endpoint independence does not assert a basis |
| §5.13 q=2 endpoint | q=2,w=4 | Family{(2,1,1),(1,2,1),(1,3)} has3 values; naive preceding-rule family obeys the displayed nonzero relation | Keep special endpoint |
| §5.13 zero-weight signatures | w=0 | One empty array, value1, independent and spanning K | Both native signatures agree |
| §5.14 finite-place dimension bound | q=3,w=1,2,3,4; q=2,w=1,2,3 | d(w)−d(w−q+1)=(1,1,2,4); q=2 gives(0,0,1) | Arithmetic checks pass; negative weights interpreted as0 |
| §5.14 specialisation/kernel | any v, w=q−1 | ζ_A(q−1) maps to0; multiplication by its nonzero infinity-adic value embeds Z₀ of dimension1 | No good-v exclusion; R01 ownership |

### Pinned library and ownership audit

I opened the native definitions, not merely matching names. In particular `Composition` has positive blocks and a sum law, but no analytic admissibility condition; `Polynomial.Monic` means leading coefficient one, with nonzeroness here supplied by the field assumption; the native infinity valuation is multiplicative, not the real-valued normalization used in the prose. The completion's `Field` and `Algebra` instances are derived on the actual uniform completion. The carrier choices in Suggested.lean agree with these facts.

| Pinned declarations inspected | File and line at the pin | Audit result |
|---|---|---|
| `Composition`, `Composition.length`, `Composition.blocksFun`, `Composition.sizeUpTo`, `composition_card` | `Mathlib/Combinatorics/Enumerative/Composition.lean:101`, :147, :155, :217, :1033 | Positive lists, weight-zero composition, and cardinality 2^(n−1) with natural subtraction. No duplicate carrier is introduced. |
| `Polynomial.Monic`, `Polynomial.natDegree` | `Mathlib/Algebra/Polynomial/Degree/Defs.lean:49`, :59 | natDegree0=0 is not used to include a zero monic polynomial over a field. |
| `RatFunc.inftyValuation`, `.X`, `.X_inv`, `.polynomial`, `RatFunc.CompletionAtInfty` | `Mathlib/FieldTheory/RatFunc/Valuation.lean:81`, :97, :103, :109, :138 | Correct degree sign after translating multiplicative valuation to v∞; explicit equality binder retained. |
| `Finsupp`, `Finsupp.single`, `Submodule.span` | `Mathlib/Data/Finsupp/Defs.lean:88`; `Mathlib/Data/Finsupp/Single.lean:47`; `Mathlib/LinearAlgebra/Span/Defs.lean:46` | Native finite support and spans, including zero coefficients. |
| `Submodule.mul`, `Submodule.mul_le` | `Mathlib/Algebra/Algebra/Operations.lean:215`, :222 | Product is finite sums of pairwise products; not pointwise intersection. |
| `iSupIndep` | `Mathlib/Order/SupIndep.lean:328` | Disjointness from the supremum of the other spaces; correct grading carrier. |
| `FiniteField.card'`, `FiniteField.sum_pow_units`, `FiniteField.frobeniusAlgHom` | `Mathlib/FieldTheory/Finite/Basic.lean:266`, :290, :333 | Prime-power cardinality, exponent-zero sum−1, and q-power coefficient homomorphism on an F-algebra. |
| `spectralNorm_extends`, `spectralNorm_unique`, `spectralNorm.normedField`, `spectralNorm.normedAlgebra` | `Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean:573`, :699, :828, :882 | Algebraic extension and nonarchimedean hypotheses match the field-construction route. |
| `IsAlgClosed.of_denseRange` | `Mathlib/Analysis/Normed/Field/Dense.lean:45` | Has `[CharZero L]`; cannot supply this positive-characteristic completion theorem. |
| `TauCeti.PowerSeries.norm_eq_gaussNorm`, `.norm_coeff_mul_pow_le`, `.norm_C`, `.norm_X` | `TauCeti/RingTheory/PowerSeries/TateAlgebra.lean:76`, :80, :94, :105 | Positive radius and ultrametric normed ring; variable formula additionally needs NormOneClass. No arithmetic finite-extension condition is built in. |

Searches by Carlitz, Anderson–Thakur, MZV/MZ-property, multiple polylogarithms, and harmonic/stuffle products covered the pinned libraries, the roadmap service's main/open-head files, and the board packages. Generic “Carlitz” hits in Kloosterman identities are different objects. No same-namespace duplicate of the forty native declarations was found. The specialty multiple-depth objects have no competing implementation at the pins. The ownership exception is the fourteen explicit contracts in R01, not a newly discovered existing implementation.

The following cross-roadmap references were resolved to their actual sections. RestrictedPowerSeries and ReductiveGroupsPartII on main were also used as roadmap-shape comparisons.

| Supplier or scope boundary | Resolved location | What is actually supplied |
|---|---|---|
| RestrictedPowerSeries §§0.1–0.3, 1.1–1.2, 2.1, 7.2 | `TauCetiRoadmap/RestrictedPowerSeries/README.md:193`, :207, :224, :247, :264, :306, :723, on main | Coefficients, modules, Gauss norms, radius change, evaluation and entire series. Evaluation at θ needs entire series, not just radius one. |
| PeriodsAndSpecialValues PS.9.1–PS.9.4, specifically PS.9.2 | `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:1990`, :2014, supplied open head | Classical real MZVs and rational word products; ordered-merge multiplicities. Its characteristic-p extension remains the declared gap, rather than an already proved rational-to-positive-characteristic scalar extension. |
| PadicDifferentialEquationsAndRigidCohomology RD.0.33 | `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:1536`, open-head roadmap service | Completed algebraic closure and algebraic closedness in every characteristic; the positive-characteristic case is explicit. |
| ReductiveGroupsPartII RG2.3.7 | `TauCetiRoadmap/ReductiveGroupsPartII/README.md:5201`, on main | Lang for smooth geometrically connected finite-type groups over finite fields. The target explains the algebraically closed field extension for GL_n; the disconnected constant group is correctly excluded. |
| GlobalShtukasAndFunctionFieldLanglands §2.7 | `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:1054`, supplied open head | Elliptic-sheaf chains and the marked one-leg shtuka comparison, not the present special-value series. |
| FunctionFieldArithmetic Layers0–5 | `TauCetiRoadmap/FunctionFieldArithmetic/README.md:438`, :553, :672, :803, :1004, :1717, supplied open head | Constant fields, Riemann–Roch, divisors/adeles, Artin–Schreier–Witt, class field theory and divisor zeta functions; no duplicate ownership of these MZV series. |

The roadmap service found no main/open roadmap named DrinfeldModulesAndTModules. That does **not** invalidate an explicitly declared gap, and I have not reported the absent parent as a missing undeclared supplier. It does make it important not to pretend the fourteen announced contracts and the local ownership text agree. No rejection for replanning an existing parent is justified by this search.

### Headline coverage and Lean checks

The README's headline results are: general power-sum degree descent; MZV and CMPL nonvanishing; weight-graded products; ordinary and alternating Brown spanning; equality of MZV/CMPL spaces; strong alternating Brown spanning; Chang grading and descent; ABP lifting/independence and Eulerian suffixes; Frobenius solution dimensions and character rigidity; the two-row rigidity theorem; small-entry and small-weight IND independence; the CMPL and Thakur bases; Todd dimensions and algebraic-closure bases; all-relation kernels; character splitting and normalized-period relations; the alternating Hoffman basis and dimensions; direct small-weight bounds; and the finite-place dimension bound. The foundation/interpolation headlines are the Carlitz exponential and period, arithmetic Omega/twist theory and Anderson–Thakur specialisations.

Suggested.lean contains **23 headline theorems and 17 definitions**. Each statable headline above has its native signature; the constructions involving analytic period carriers, MZ-property data, the rewriting operator, or v-adic specialisation are individually named as unavailable with a few simple definitions in the module docstring. The native Frobenius residual uses a real polynomial body, enforces off-tree zero coordinates, and is not a free predicate assuming the desired dimension. No missing statable headline or substitute arbitrary-data theorem was established by this review.

The original file independently elaborated with `lake env lean`, exit zero and exactly 23 `sorry` warnings, no other warnings. A scratch copy with `#check @...` for **every one of the forty declarations** also elaborated. I compared those types with the README and the supplied signature report: no dropped field, positivity, support, root equation, or scalar-tower binder was found; nothing was changed. In particular q is `Fintype.card F`, the character-twisted theorem retains `0<w`, and both common-overfield scalar towers survive elaboration.

For all 23 sorried theorems a second scratch copy tried `simp`, `rfl` and `infer_instance` separately before retaining `sorry`. All 23 still required `sorry`. Object searches and inspection of the pinned APIs found no single existing library lemma proving a remaining specialty headline. These are not boundary-case declarations or API padding; their weight-zero cases belong inside the general statements. No padding deletion is requested.

## Not verifiable

- No cited source was inaccessible: all twenty manifest texts were available in the legal cache. The fifteen seeded targets and their necessary proof passages were read; AT90's missing extracted displays were checked in the cached PDF. No missing-reference request is needed.
- The future supplier implementations in the fourteen gap contracts cannot be certified as delivered. Acceptance may be conditional on those contracts once R01 restores their declared ownership and README entries. Their present absence is not an additional finding.
- The `sorry` build does not verify the analytic or algebraic proofs. The computed table tests conventions and boundary instances; it does not assert that a finite sample proves the basis and transcendence theorems.

## Source issues

- **Misprint** in CCM23 at §2.2, printed p.7 (CCM23 line 329): the source says the depth-one summand has exponent d; it should be exponent s; affects a stated result.
- **Misprint** in CCM23 at §2.3, printed p.9 (CCM23 line 421): the source says the correction's support is divisibility of k; it should be divisibility of j, the correction index; affects a stated result.
- **Error** in CCM23 at the identities after Definition 2.2.2, printed p.8 (CCM23 line 378): the source says the prepend identity holds for every integer cutoff and arbitrary P; it should be restricted at cutoff zero or use the corrected empty-tail convention; affects a stated result.
- **Misprint** in CCM23 at the proof of Theorem 4.3.5, printed p.18 (CCM23 line 934): the source says the square matrix has size 2(ℓ−m); it should be 2ℓ−m, giving twelve rather than ten in its q=3 example; affects the proof.
- **Misprint** in ND21 at §2.2, printed p.9 (ND21 line 477): the source says the summation over j uses R(d); it should be R(j), as its next display expands; affects the proof.
- **Misprint** in CPY19 at Proposition 2.2.1, printed p.6 (CPY19 line 248): the source says the localized morphism matrix is polynomial; it should be rational in t, allowing the example 1/t; affects a stated result.
- **Error** in THAKUR10 at the proof of Theorem 3, fourth displayed equality, printed p.1979: the source says the indicated vector induction step follows from the depth-one shuffle; it should be replaced by the simultaneous mixed-cutoff and equal-cutoff induction; affects the proof; corrected in print at THAKUR-UPDATES entry 36, pp.7–8 (THAKUR-UPDATES line 305).
- **Error** in IKLNDP24 at §2.2.1, printed pp.27–28 (IKLNDP24 lines 3505, 3550–3567): the source says whole-tuple decay puts the full displayed triangular matrix in GL(T); it should require convergence of every consecutive subtuple, for example the termwise bound; affects a stated result.
