<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/164#issuecomment-6861368355 -->
Red team round 2 pass a (codex) of 96394e9

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) The other open head would overwrite the round-1 repairs

   **Location:** packages/LogicAndDefinabilityInNumberTheory/README.md:1329 and :1918; corresponding TauCetiRoadmap/LogicAndDefinabilityInNumberTheory/README.md at the open roadmap head #2276, §§4.29 and 7.7.

   **Claim:** The package is ready to become the roadmap without a competing version of the same targets.

   **Witness:** The other head still says “unipotent radical W with centre U” (§7.7), omits both new supplier gaps, and has different normic-family and two-universal-formula text. Its §6.2 also changes ownership independently.

   **Exact repair:** Rebase the roadmap-repository pull request #2276 on the repaired package before either merges. Preserve the package's three declared gaps, separatedness in §2.9, special-fibre qualification in §2.10, rank-p étale family in §4.29 and weight −2 subgroup in §7.7. Reapply that head's distinct §6.2 supplier import and ComplexComparisonPartII ownership boundary on top, resolving those passages explicitly. This is a synchronization action, not text to add to the README.

   **Retest:** In the reconciled universal-elliptic-curve Check, U=0 and Z(W)=W=Gₐ²; the pre-repair equation U=Z(W) must not return. This is an overlap finding, not a second copy of a roadmap on main.

2. **F02** (P2) Dimension induction does not make all special points finite

   **Location:** packages/LogicAndDefinabilityInNumberTheory/README.md:1835 and :1870, “identifies them with the special points of V′ of smaller dimension, and induction gives finiteness”.

   **Claim:** The input (I-ws)(d), as written, supplies enough information to infer finiteness from the smaller dimension of V′.

   **Witness:** On a product of modular curves, vertical special fibres are indexed by infinitely many CM points of V′=A₁. André–Oort on A₁ says their closure is A₁, not that there are finitely many points.

   The source includes the missing restriction: ax_lindemann_for_a_g lines 811–819 distinguish a finite-to-one correspondence for special orbits from the correspondence between **maximal** orbits and **isolated** special points. The present input only states the former. Its later use needs the latter.

   **Exact repair text:** Add to (I-ws)(d): “The correspondence with special points of V′ is finite-to-one. Orbits maximal among positive-dimensional special subvarieties of V correspond only to isolated special points of V′, meaning points on no positive-dimensional special subvariety contained in V′ (Pila–Tsimerman, proof of Theorem 7.1, p.677).” Replace the quoted inference in §7.3 by: “Apply induction to V′ to obtain finitely many maximal special subvarieties. Its isolated special points are their zero-dimensional members, hence finite; the finite-to-one maximal-orbit correspondence gives the required finiteness.”

   **Retest:** For V′=A₁ the isolated-special-point set is empty, although the CM-point set is infinite. Vertical fibres of A₁×A₁ are not maximal special subvarieties of the product; the product itself is. The corrected argument makes precisely this distinction.

## Round-1 verification

The identifiers below are the identifiers in the repair report. All quotations are from the current package. “Not repaired; settled” records a justified decision not to implement an earlier request, rather than a new finding.

| Earlier finding | Status at this head | Repaired passage and witness |
|---|---|---|
| 1a/F01 | Repaired | README §2.9: “separated smooth O_F-scheme of finite type”. For the doubled origin, chart mass is (q+1)/q while generic-image mass is 1; it is now excluded. A¹ gives q/q=1 and G_m gives (q−1)/q. |
| 1a/F02 | Repaired | §2.10(a): “no finiteness is asserted for the morphism 𝒜°→ℬ° over O_F”. On Tate [2] over Q₃, generic/special kernel orders remain 4/2, and both connected special fibres have two F₃-points. |
| 1a/F03 | Repaired | §3.9: “Uniform integrability locus and integral”; its Needs line restricts §2.4 to “its fixed-field and cell integrals only”. §2.4 now gives a direct cell/Presburger proof of its uniform certified-domain clause. L^(−a−1) specializes to q^(−a−1) before the full interpolation corollary. There is no remaining edge from that local proof to §3.9. |
| 1a/F04 | Repaired | §7.7: “its weight −2 subgroup U (normal in P and central in W, with Lie U=W₋₂(Lie P))”. For the universal elliptic curve U=0, W=Gₐ², Z(W)=Gₐ²; towards_the_andr_oort_conjecture_for_mixed_shimura_varieties_the_ Definition 2.1(3) and Notation 2.8 support this. |
| 1a/F05 | Repaired | §4.29(c): “K_u=k[v]/(v^p−du), the étale k-algebra of rank p”. At p=2,u=d⁻¹ the equation is Ξ₁Ξ₂=P(x), dimension 2, not the dimension-1 field-norm equation. The source's family is le_compl_mentaire_des_puissances_n_i_mes_dans_un_corps_de_nombres lines 502–515. |
| 1a/F06 | Not repaired; settled | §4.27 retains quadratic nonnorms as an intermediate target; §4.32 retains non-model-completeness. The repair correctly distinguishes these from the selected headlines. The former feeds §4.28; the latter is the short semantic consequence of integer definability and MRDP in koenigsmann_defining_z lines 956–964. Neither must become another acceptance theorem merely because it is statable. |
| 1a/F07 | Repaired | §§4.12, 4.31, 4.33 now have computed Checks. Pairing: P(11,4)=95 with remainders 1,2; P(5,2)=17 has positive remainder 5 at i=2. Q⊂Q(√2) changes the square-root sentence from false to true. F(1,1,0,(1,0,0,0),0)=0; a=−1 kills its guard. |
| 1a/F08 | Repaired | §4.29(b): “the algebraic closure of the residue field k(M) is an abelian extension of k(M)”. L(t) for an S₃-extension L now fails; the intended cyclic degree-p constants pass. This matches source lines 274–277. |
| 1a/F09 | Repaired | sources.toml:77 names “toDiophPoly; toDiophPoly_apply; exists_mvPolynomial”; :93 names the two “dioph_iff_exists…” declarations. They occur at hilbert10_polynomial_bridge lines 555,593,619 and hilbert10_finite_diophantine_normal_form lines 623,693. |
| 1b/F01 | Repaired by declared gap | README supplier contract and plan.json both contain block-family-covering. B2.6 still states the arc theorem, not the required quantitative cover. The new precise contract matches on_the_algebraic_points_of_a_definable_set lines 265–273. An interval needs one block; n=0 needs zero or one. |
| 1b/F02 | Repaired by declared gap | README and plan.json both contain definable-remmert-stein. §6.8 says “The smooth ambient case is the closure theorem of gap:definable-remmert-stein”. ShimuraVarieties §3.5d still states Chow; the declared gap supplies the additional closure result. For the punctured branch of xy=0, closure is y=0. |
| 1b/F03 | Repaired | The five-clause smooth proof is deleted. §6.8 now says “Write Y as a closed subvariety of an open subset W of projective space” and gives only the singular-to-smooth reduction. Compared with peterzil_starchenko_agc lines 599–605: the criticized passage is absent. |
| 1b/F04 | Repaired | Both rationalDiophantine and rational_nonintegers_diophantine are absent from Suggested.lean. §4.24 says the equivalent complement statement “follows from it by negation and is not stated separately”. The resulting file has 16 declarations, not 18. |
| 1b/F05 | Repaired | §3.11 now tests G_m↦[Q(1)]−1, P¹↦1+[Q(1)], and the nonunit 1−[Q(−1)] under Euler characteristic (image 0). §4.33 has three Checks, including Δ_(3,3)={2,3}: 1/2 rejected, 1/5 accepted. |
| 1b/F06 | Repaired | Same rank-p family repair as 1a/F05, now using the family of CTV §4 rather than invoking the field extension at split parameters. |
| 1b/F07 | Repaired in part; remaining request correctly rejected | §2.5 now cites CL “pp.43–45”; Corollary 7.5.4 is at cluckers_loeser_2008 line 1867 after the p.45 marker. Pas “pp.144–155” was already correct: pas_1989 line 288 prints 144 and line 299 starts §3.6. The proposed p.145 correction would introduce an error. |

The three gaps have matching slugs, named suppliers and precise hypotheses in README and design/plan.json. None is treated as an error because its supplier has not yet implemented it. The finite-residue-field pairing gap still exceeds the semistable perfectness target in NeronModelsAndSemistableAbelianVarieties §4.6. The two new gaps introduce no cycle or false theorem.

## Verified sound

Read all 1,993 README lines and all 188 Suggested.lean lines: 93 numbered targets, 16 Lean declarations (11 theorems and five definitions). The following tables record the instantiated tests, rather than claiming that finitely many examples prove the general theorems. The symbol ∅ has cardinality zero; a trivial group has cardinality one. Cases outside a stated hypothesis are negative controls, not counterexamples. Arithmetic characteristic, nonabelian-group and nonreduced-space tests are applied where those objects occur; they are not artificial extra parameters of the real counting statements.

### Lean context and computed instances

Every name below has the namespace prefix TauCetiRoadmap.LogicAndDefinabilityInNumberTheory. There are no standing section variables. I compared all 16 supplied elaborated signatures with the source and README; I did not run Lean. Type universes are arbitrary for O and the number field k; the counting carriers are finite powers of ℝ. The five definitions have real bodies and introduce no missing mathematical construction.

| Declaration; README target | Actual context | Values on the instances; result/change |
|---|---|---|
| ax_kochen_ring; 1.5 | Ring sentence; N precedes p; Fact p.Prime; CompatibleRing on both fields | For ∃x,x²+1=0: p=2 gives false/true, p=3 false/false, p=5 true/true. Eventual statement permits N≥2. p=0,1 excluded. No change. |
| igusa_poincare_rationality; 2.6 | p prime; O CommRing, IsDomain, CharZero, DVR, Algebra ℤ_p O, Module.Finite; m and f arbitrary | Raw series: f=0 gives 1/(1−q^mT), f=1 gives 1, f=X in one variable gives 1/(1−T). At n=0 every case has coefficient 1. For m=0,f=0 the series is 1/(1−T). Each admits the required nonzero denominator. No lost finite-module hypothesis. |
| Diophantine.mrdp; 4.15 | n:ℕ, S:Set(Fin n→ℕ); native finite-tuple encoding | Empty and universal predicates give true↔true. X−2Y gives membership true,false,true at 0,1,2. n=0 has two possible sets, both decidable and Diophantine. No rational witnesses substituted. |
| hilbert_tenth_integers; 4.16 | ∃n,∃p before integer parameter a and integer witnesses | Test family a−x² accepts 0,1 and rejects −1. Zero witnesses and p=a accept precisely 0; this is not an undecidable witness. Four squares attain 0,1 but not −1. Existential assertion is not an assertion about every family. |
| rationalIntegers; 4.17 | Set ℚ, body ∃z:ℤ,(z:ℚ)=x | 0 and −7 have witnesses 0,−7; 1/2 has none. This is an actual set, not an assumed existential polynomial representation. |
| universal_integers; 4.24 | ∃n,p over ℤ; ∀t:ℚ; ∀y:Fin n→ℚ | At t=0,−7 the required polynomial has no rational zero in y; at t=1/2 it must have one. Negation switches the universal nonzero condition to the complement's existential zero condition. No fabricated explicit witness polynomial was tested. |
| forall_exists_rational_undecidable; 4.25 | ∃k,l,q before a:ℕ, ∀x:ℚ^k,∃y:ℚ^l | In the reduction (Pw−1)∏g, P=0 and all g≠0 gives nonzero product; P=2,w=1/2 gives 0; a noninteger coordinate has a g=0 witness and gives 0. Empty product is 1. Correct quantifier order. |
| one_universal_variable; 4.28 | ∃m,p; ∀t:ℚ, ∀x:ℚ,∃y:ℚ^m | Required truth at t=0,−7 is true and at 1/2 false. The latter requires a bad universal parameter, not failure for every parameter. Dyadic detection is retained. |
| twoUniversalIntegerPolynomial; 4.33 | a,b,t:ℚ; u:Fin 4→ℚ; v:Fin 3→ℚ | F(1,1,0,(1,0,0,0),0)=0. For a=−1 and that u the first guard is 0. F(1,1,1/2,0,0)=241/16. Existential-coordinate degree 8; total degree 12, with a²b²u₃⁸ coefficient 1. |
| two_universal_integer_formula; 4.33 | t:ℚ; ∀a,b:ℚ,∃u,v on the displayed finite carriers | At a=b=3, ramification {2,3}: 1/2 fails the semilocal condition; 1/5 passes that particular condition. For t=0 the full quantified formula is true; for 1/2 false. The polynomial is used, not replaced by a free predicate. |
| nonpowers_diophantine; 4.30 | k Field and NumberField; r>1; ∃finite witnesses and finite system | Over ℚ,r=2: −1 accepted, 4 and 0 rejected. r=3: 2 accepted, −8 rejected. A zero-equation system would accept 0 and hence cannot be a valid witness. No restriction to cyclotomic or split fields. |
| IsOMinimalExpansion; 6.1 | Language L, L.Structure ℝ; all real parameters | Frontier(ℤ)=ℤ, frontier(ℚ)=ℝ, frontier((0,1))={0,1}, frontier({0})={0}, frontier(∅)=∅. Empty language passes unary finiteness but fails order definability. Correct frontier convention. |
| algebraicPart; 6.11 | n:ℕ, X:Set(ℝ^n); native IsSemialgebraic and IsConnected | Interval gives X_alg=X; singleton and finite sets give ∅; n=0 gives ∅. A connected semialgebraic set with two points has positive dimension; no isolated point passes. Real exponential graph has no semialgebraic arc. |
| rationalTupleHeight; 6.12 | n:ℕ,x:Fin n→ℚ; max 1 of finite supremum | H(−3/4)=4; H(−3,2)=3; H(0)=1; H(())=max(1,0)=1. Agrees with Rat.mulHeight₁_eq_max, not a product height. |
| pila_wilkie; 6.14 | L and structure, hL, n,m,X,hX,ε>0; ∃C>0 before t,T≥1 | Interval remaining count 0; rational singleton count 1 for T≥its height; n=0 count 0 or 1 at T=1. C≥1 works for singleton families. Rational height bounds make the set finite before ncard is used. |
| bounded_degree_counting; 6.16 | Same definability context; k≥1; explicit IsAlgebraic in every coordinate; ∃C before t,T | √2: degree 2,H=√2, admitted at k=T=2, excluded at k=1. (√2,√3) has degrees (2,2), joint degree 4 and H=√3. A transcendental has total height 1 and minpoly degree 0 but fails algebraicity. Empty tuple count is 1. |

The 11 stated headlines are exactly the theorems in this table. The module docstring also names the unstated headlines: relative Denef–Pas elimination, general AKE and coefficient transfer; motivic integration/specialization/transfer; dual Néron volumes; normic zero-cycles; definable Chow; André–Oort, CM-pair, mixed and period-codimension reductions. It identifies the missing carriers for each. The intermediate polynomial-bridge, normal-form and preservation API is not padded into Suggested.lean. None of the 11 kept statements reduces to unfolding a kept definition or applying one pinned theorem. Rational and bounded-degree Northcott supply finiteness only, not their T^ε bounds.

### README target ledger

The numbered targets are headings rather than bold bullets in this package. All 93 are included below. The bold scope entries are supplier boundaries, checked separately in the supplier ledger. “Keep” means that these instances do not refute the statement; it is not a proof certification. All definitions' displayed Checks were read, including the additional tests in their explanatory paragraphs.

| Target | Instances and computed sides | Result/change |
|---|---|---|
| 0.1 | Equality quotient on two elements has two classes; assigning both 0 and 1 to one input gives two output classes, not one. For ℤ fractions, 1·4=2·2=4. | Keep; uniqueness excludes wrong graph. |
| 0.2 | Identity translation of 1+1=2 gives true/true; composing fraction and identity interpretations keeps [(1,2)] equal to 1/2. | Keep; representatives need no transversal. |
| 0.3 | (−1,2)+(1,2)=(0,4)↦0; (1,0) has denominator 0 and is rejected; over 𝔽₂, (1,1)↦1. | Keep; zero ring is not a domain. |
| 0.4 | Residue quotient ℤ/2 sends 1+1=0 to true, while its unquotiented integer equation is false; the kernel guard restores true/true. | Keep. |
| 1.1 | VG congruence at 3 gives 3≡1 mod2 true; at 2 false. Guard x≠0 makes ord(0)=γ irrelevant for any chosen γ. | Keep. |
| 1.2 | Over ℚ((t)), t³(2+t) has ord3,ac2; with π′=2t, ac′(t)=1/2. In characteristic2 the same expression is t⁴, so ord4,ac1. | Keep; the Check excludes 2=0. |
| 1.3 | ℂ((t^ℚ)) has divisible value group ℚ; ℂ((t)) has ℤ; both residue characteristic0. ℚ₂ has residue characteristic2 and is outside the theorem. | Keep general value groups. |
| 1.4 | Coefficient-free ring truth for x²+1=0 is true in both ℂ((t)) and ℂ((t^ℚ)); their value groups are not elementarily equivalent (divisibility false/true), so this example alone cannot imply AKE equivalence. | Keep both reduct hypotheses. |
| 1.5 | p=2 gives false/true for x²+1=0; p3 false/false;p5 true/true. In ℤ[i] at the two primes over5, residue 1+i is 3/4, nonsquare/square. | Keep coefficient-compatible residue isomorphisms. |
| 2.1 | A graph point has VF-dimension0 and ambient Haar mass0; fixed ord0,ac1 cell has mass1/q. Empty base yields no cells. | Keep graph/ball distinction. |
| 2.2 | F² graph y=x² has dimension1; its fibres over x have dimension0; constant zero polynomial requires a zero piece, not ord0. | Keep zero strata and three characteristic regimes. |
| 2.3 | At q=2, indicator(O) has values1/0 on 0/π⁻¹; q^ord on π gives2; ord at0 requires the stated piecewise convention. | Keep. |
| 2.4 | Cell ord a,ac ξ≠0 has mass q^(−a−1); summing q−1 components gives (1−q⁻¹)q⁻a. Constant ab−c on F integrates iff ab=c, with integral0 then. | Keep; full locus need not be definable. |
| 2.5 | x↦πx sends O volume1 to πO volumeq⁻¹; multiplying source density by abs(det)=q⁻¹ agrees. Frobenius x↦x^p has derivative0 in charp and is excluded from arbitrary-definable Jacobian assertions. | Keep analytic/general-definable regimes distinct. |
| 2.6 | f0: Z=0,A=(1−T)⁻¹, tail sides0; f1: Z=A=1, sidesT; fx,q2: A=(1−T/2)⁻¹,Z=A/2, sidesTA/2. | Keep even at zero polynomial and level0. |
| 2.7 | dx on O gives1; π²(dx)⊗² givesq⁻¹; zero form gives0 and is not gauge. d0 top form1 gives singleton mass1. | Keep r>0 and tensor root. |
| 2.8 | A point in A¹ has ambient measure0; in dimension0 it has intrinsic measure1 and is not positive codimension. A doubled point is nonreduced and outside the assertion. | Keep. |
| 2.9 | A¹ givesq/q=1; G_m gives(q−1)/q; doubled origin gives chart mass(q+1)/q versus image mass1. | Repaired separatedness excludes last case. |
| 2.10 | Tate n,q givesn(q−1); [2] on Tate overℚ₃ has generic/special kernel sizes4/2; both special connected groups have2 points. ℤ/3 with Frob−1 has invariant/coinvariant sizes1/1. | Keep special-fibre isogeny and declared pairing gap. |
| 2.11 | ω=0 gives0=0. For Tate [2] overℚ₃, multiplier2 has norm1 and both invariant-form volumes are n(3−1)/3. | Keep prime-to-residue-characteristic condition. |
| 2.12 | a=xy: da∧(−dx/x)=dx∧dy; using +dx/x gives its negative. Identity submersion has relative degree0 and density1. | Keep base-first sign. |
| 3.1 | h[0,0,0] gives1 point. ∀y,y²≠−1 gives1 overℝ,0 overℂ; hence no functorial inclusion. Elliptic affine curve genus1 cannot be affine-open A¹ of genus0. | Keep subassignment and closed embeddings. |
| 3.2 | RF splits into RF× plus point: q=(q−1)+1; direct image from two points gives2, with 2²=4≠2. Empty object0, base unit1. | Keep additive pushforward. |
| 3.3 | At q2, (1−q⁻¹)⁻¹=2; at q1 denominator0 excluded. L−2 at q3/2 is−1/2, so not positive. | Keep real q>1 positivity, not only integer q. |
| 3.4 | Empty sum0; ∑₂^(−n)=2; even-index sum=4/3; ∑1 overℕ diverges. | Keep integrability. |
| 3.5 | At q2, RF class2, RF× class1=L−1; two-point pushforward1↦2 while products give2 versus4; empty-base function module is0. | Keep tensor relations. |
| 3.6 | Point: dimension0 contribution1; its ambient degree1 class0. Graph over F has absolute dimension1, relative dimension0. Empty support0 in all grades. | Keep grading. |
| 3.7 | Ord0,ac1 axiom gives L⁻¹, specializing to1/2 at q2; two-point residue pushforward gives2. Empty map pushes0 to0. | Keep all normalization axioms. |
| 3.8 | x↦tx over K((t)) has ordjac1, factorL⁻¹. Product of two such maps has factorL⁻² in either order. | Keep negative Jacobian exponent. |
| 3.9 | Cell a0 givesL⁻¹↦1/q, not q. Constant ab−c has h=ab−c,G=0 on h0. O indicator shell sum(1−q⁻¹)/(1−q⁻¹)=1. | Keep interpolation separate from specialization. |
| 3.10 | Universal equality of identical O-volume functions is1=1 in both fields; empty parameter set gives a vacuous universal identity, not a pointwise correspondence of VF carriers. | Keep universal quantifier. |
| 3.11 | G_m↦[ℚ(1)]−1; P¹↦1+[ℚ(1)]; Euler sends1−[ℚ(−1)] to0, so it is not an unlocalized unit. | Keep localization, no injectivity claim. |
| 4.1 | Empty variables,C(−3) evaluates−3; X₀−2X₁ at(1,3) is−5. X₀,X₁ at(0,1) give0,1. | Keep integer codomain. |
| 4.2 | X₀X₁−2 at(2,3) gives4 by both evaluations; at(0,0) gives−2. | Keep. |
| 4.3 | Native constant−7 has preimageC(−7); projection i has preimageX_i, even for infinite input type. | Keep existential syntax recovery. |
| 4.4 | X(X−1) has values0,0,2 at0,1,2; only first two tests would confuse it with0. In zero variables equality is equality of constants. | Keep infinite coordinate sets. |
| 4.5 | E⁻¹(E(X₀X₁))=X₀X₁; renaming X₀−X₁ by collapse gives0 on both sides; swapping at(2,5) gives3. | Keep classical inverse, not computable reification. |
| 4.6 | Input-only X_a needs witness support∅; X_a+X_b for witness b needs{b}. Over the zero semiring p=0 and empty support work. | Keep arbitrary CommSemiring. |
| 4.7 | Empty witness type givesm0; support{b,c} can giveh0=b,h1=c andm2, preserving input indexa. | Keep injective enumeration. |
| 4.8 | u−v−1 has root(1,0); collapsed u=v gives−1 and no root. Empty witness extension has unique empty tuple and unused coordinates0. | Keep injectivity. |
| 4.9 | X−2Y accepts0,2 and rejects1; nonzero constant1 has no root even with zero inputs/witnesses; p0 gives all inputs. | Keep infinite α and ULift witness handling. |
| 4.10 | Code X−2 at0 gives−2; zero witness block has exactly1 tuple, not0. FreeX−witnessY at(2,5) gives−3. | Keep effective finite code separate from bare Poly. |
| 4.11 | Search for X−2Y on input2 halts atY1; on input1 no natural zero occurs. Zero-witness p1 immediately rejects. | Keep semidecision, not decision. |
| 4.12 | P(11,4)=95, mod5/mod9 remainders1/2; P(5,2)=17, positive mod5 remainder5; P(1,1)=1. | Repaired. |
| 4.13 | n0 bounded universal is true; P(i):i<2 gives true for n2,false for n3. Fixed witness arity must encode the varying list. | Keep. |
| 4.14 | Minimization with undefined value at0 and successful0 at1 is undefined, not1; with outputs1,0 it returns1. | Keep earlier-definedness certificates. |
| 4.15 | Even naturals have RE and Dioph representations; empty and universal sets both sidestrue; n0 gives only∅ and{()}. | Keep native MRDP, not exponentiation alone. |
| 4.16 | a−x² accepts0,1,rejects−1; four squares0/1 accepted,−1excluded; arity0 p=a has computable singletonzero. | Keep existential undecidable family. |
| 4.17 | Overℂ,(1,i) gives1+i²=0 with two nonzero entries. Inℤ/6,2·3=0. Inℚ,xz=1 has solution atx2 and none atx0. In zero ring1=0 defines the whole singleton. | Keep finite systems and conditional union laws. |
| 4.18 | For rational1/2 use coprime(1,2), Bezout1·1+0·2=1 and denominator2; integer2 has reduced denominator±1 and fails noninteger certificate. | Keep conditional integer Diophantine assumption. |
| 4.19 | Split quaternion(1,1) has trace rangeℚ; real Hamilton(−1,−1) norm-one traces lie[−2,2], sum lies[−4,4]. | Keep real-place condition in next theorem. |
| 4.20 | In split case trace0 and trace5 occur; at real division trace5 cannot occur in S+S since5>4. With a>0 or b>0 no real ramification persists. | Keep positive-parameter semilocal equality. |
| 4.21 | Atℓ3, p3 is odd-valued and class3; p9 has even valuation2 and is excluded from that support. The empty finite support givesℚ. | Keep exact parity and residue class. |
| 4.22 | Radical ofℤ_(3) has0,3 but not1 or1/3; empty ramification support yields the stipulated{0}, not the empty intersectionℚ. | Keep empty-support correction. |
| 4.23 | Prime3,5,7 are detected by their respective classes mod8; prime2 needs the separate dyadic term; primes1 mod8 need the two-parameter branch. | Keep all prime classes. |
| 4.24 | 0,−7 integral in everyℤ_(p); 1/2 fails atp2; 1/3 fails atp3. Universal intersection isℤ, complement existentially detected. | Keep universal, not existential, integers. |
| 4.25 | P=0 and all integer coordinates leave(Pw−1)∏g nonzero; P≠0 admitsw=P⁻¹ giving0; noninteger coordinate gives oneg0. | Keep complement reduction and fixed arities. |
| 4.26 | 4 is a square at every place; 2 fails already inℚ₃ (residue2 nonsquare); −1 fails atℝ andℚ₃. | Keep union/intersection directions and finite exclusions. |
| 4.27 | Overℚ,2 nonsquare,4 square; inℚ(i),−1 is not a norm (sum of rational squares),1 is a norm. | Keep as intermediate result. |
| 4.28 | Integer0 and−7 satisfy; 1/2 must fail for some universal parameter and the dyadic condition supplies detection. | Keep exactly one universal variable. |
| 4.29 | p2,u=d⁻¹ gives K_u≃k×k and normΞ₁Ξ₂, rank2. Degree2p+1=5 is odd. Constant field of L(t), Gal(L/k)=S₃, isL and not abelian. | Repaired family and multiplicity-one abelian-constant condition. |
| 4.30 | ℚ,nonzero nonsquares:−1yes,4no,0no. Cubes:2yes,−8no. r1 excluded; r0 not inferred. | Keep all number fields. |
| 4.31 | ℚ⊂ℚ(√2):∃x,x²=2 isfalse/true, so not existentially closed. Isomorphismℚ→ℚ givestrue preservation in both directions. | Keep existential rather than full elementarity. |
| 4.32 | If undecidable RE setA and its complementB were both RE, dovetailing decides every input (one of two searches halts); contradiction. | Keep non-model-completeness intermediate; no false embedding ofℚ intoℚ. |
| 4.33 | F(1,1,0,(1,0,0,0),0)=0; a=−1 with sameu givesguard0; Δ_(3,3)={2,3} rejects1/2,accepts1/5 locally. | Repaired three discriminating Checks. |
| 5.1 | WholeO^d atn hasN=q^(dn),a1; πO atn≥1 hasN=q^(n−1),a=q⁻¹. At n0 the quotient has1 element. | Keep reduction invariance. |
| 5.2 | Constant full-domain series1/(1−T) agrees in fields with sameq; a proposed limit of rawN=q^n diverges forq>1. | Keep explicit limit hypothesis. |
| 5.3 | fx, q2, s1 givesT1/2 and integral(1/2)/(1−1/4)=2/3; f1 integral1; f0 integral0 forRe(s)>0. | Keep convergence region. |
| 5.4 | q2 gives residuecount3; n1 fibre logarithmicmass1. Σ_(n≥1)(n+1)/2^n=3; q²(1−q⁻¹)²=1, total3. q3 yields5. | Keep singular fibre excluded. |
| 6.1 | Boundariesℤ,ℝ,{0,1},{0},∅ forℤ,ℚ,(0,1),{0},∅; empty language order graph not definable. | Keep actual frontier. |
| 6.2 | Restricted exp at boundary1 is e, outside at2 is0; unrestricted sine has infinitely many zeroskπ. Affine change sends[−1,1] to[0,1]. | Keep closed-cube convention. |
| 6.3 | R_alg unary zero setx²−1 has2points; restricted sine finitely many zeros on its cube; unrestricted sine has infinitely many and is excluded. | Keep supplied o-minimality and separate analytic-cell result. |
| 6.4 | xy1 has2components; [0,∞) partitioned into point/openray has1component, not2. Sine curve has infinitely many isolated axis intersections. | Keep definable path-connectedness. |
| 6.5 | (−1,1)\{t} has2components at t0,1 at t2. Sin(2πkx)>0 on(0,1) haskcomponents. Empty fibre0; m0 one fibre. | Keep uniform component bound. |
| 6.6 | ℝ needs1chart; quadrant vertex hasorthant depth2, not an ambient-open ball. Discrete infinite point-chart collection has infinitely many charts. | Keep finite atlas. |
| 6.7 | ℂ affine line hasreal dimension2; P¹ transitionz↦1/z excludes0; node hastwo branches and is not a manifold at0. | Keep singular definable spaces. |
| 6.8 | C\{0} closureC; punctured branch inxy0 closurey0; E=Y givesA∅,closure∅. {1/n} adds0 and is not analytic there. | Repaired reduction; uses declared gap. |
| 6.9 | In C×,point1 ideal(z−1); empty ideal(1),whole ideal(0); nodal branch ideal(y). | Keep relative closedness. |
| 6.10 | Countable rational points inA¹ are infinite but not definable. Repeating one algebraic line yields a union already equal to that line, one member. Empty union needs0members. | Keep analytic cells and Baire. |
| 6.11 | Intervalalg=interval; pointalg=∅; expgraphalg=∅; n0alg=∅. | Keep nondefinable-union possibility. |
| 6.12 | H(−3/4)=4,H(−3,2)=3,H0=1,H()=1. | Keep maximum, not product. |
| 6.13 | Point block dimension0,alg∅; interval dimension1,algself; constant image of interval hasdimension0; expgraph image fails semialgebraic-map hypothesis. | Keep basic/image blocks distinct. |
| 6.14 | Interval remainingcount0; singletoncount≤1; n0 count0or1 atT1. | Keep C uniform in parameters. |
| 6.15 | Integer tuple(−3,2) hasH3; constant interval map gives1point; identity givesinterval; expgraph map not semialgebraic. | Keep image hypotheses. |
| 6.16 | √2 degree2,H√2; tuple√2,√3 jointdegree4 but coordinatebound2; transcendentaldegree0,H1 still excluded; emptytuplecount1. | Keep explicit algebraicity. |
| 6.17 | c=C=A=δ=1,ε1/2,D16 gives16lifts versus4singleton blocks (unit comparison constant); D1 gives1versus1 and does not force a block. | Keep sufficiently-large complexity. |
| 7.1 | g1,D−4,a1,b0 givesτ=i,Reheight1,Imdegree1≤2,orbitclassnumber1. Generic non-CM point is weakly special dimension0 but not special. | S02 adds isolated-point correspondence. |
| 7.2 | V=CM singleton has1exceptional point; V=A₁ has0points outside positive-dimensional special subvarieties. A non-CM singleton has0specialpoints. | Keep conditional reduction. |
| 7.3 | V=A₁×A₁ hasinfinitely many special vertical fibres but1maximal special subvariety (itself); parameter A₁ hasinfinitely many CMpoints,0isolated specialpoints. | S02 fixes induction. |
| 7.4 | V=∅ closure∅; CM singleton closureitself; non-CM singleton closure∅; V=A₁ closureA₁. | Keep theorem; repair its proof input viaS02. |
| 7.5 | DiagonalΦ₁=0 and linej₁1728 haveinfinitely many CMpairs; linej₁1 has0. | Keep classification hypothesis and exceptional curves. |
| 7.6 | dimX1,dimĎ1,Zpoint: positive-dimensionalU hascodim1<2, while zero-dimensionalU hascodim2=2 and is handled separately. | Keep strict inequality and dimX>0. |
| 7.7 | Pure caseW0,N1; universal elliptic curveU0,W=G_a²,Z(W)=W; torsion(1/2,0) overτi givesN2,H2,D4. CM torsion singletondensitytrue; nontorsion singletondensityfalse. | Repaired U; S01 prevents its loss on reconciliation. |

### Suppliers, ownership, pins and direction

Resolved 49 named section/layer contracts across the following 18 supplier roadmaps, including the scope-only exclusions. Repeated links to the same section count once. A source cited to prove a target here was not mistaken for an external supplier. No declared gap is counted as supplier drift.

| Supplier and sections | Witness at current main/open head; boundary verified |
|---|---|
| SchemeAndStackFoundations 0.7,2.20 | TauCetiRoadmap/SchemeAndStackFoundations/README.md:1049 and :5443. Finite-type dimension and smooth relative dualizing/top-differential comparison; the actual applications are varieties over fields or finite-type models over a DVR. |
| NeronModelsAndSemistableAbelianVarieties 2.5,4.6 | TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:1357 and :2630. The section's semistable perfectness does not supply the declared general finite-residue pairing gap. |
| ReductiveGroupsPartII RG2.3.7 | TauCetiRoadmap/ReductiveGroupsPartII/README.md:5202. Lang covers smooth geometrically connected finite-type groups, including nonaffine connected Néron special fibres. |
| MotivesAndAlgebraicCycles 4.20 | TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:930. Scissor measure and Lefschetz image, without claiming that 1−[ℚ(−1)] is already invertible. |
| HeightsRationalPointsAndObstructions 2.16b,2.17,2.20,2.21,5.1,5.6,5.8 | TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md:1146, :1173, :1216, :1268, :2173, :2276, :2396. Residues, proper unramified Brauer groups, arbitrary-degree zero-cycles, formal lemma, and torsion-coset finiteness. The degree 2p+1 normic theorem is not already supplied. |
| QuadraticFormInvariants Layer2,6C | TauCetiRoadmap/QuadraticFormInvariants/README.md:703 and :1603. Quaternion reduced trace/norm; odd-characteristic symbol and separate dyadic formula/table. At ℚ₂, (−1,−1)=−1 and (2,5)=−1, consistent with this package's conventions. |
| GlobalQuadraticForms 4.2,4.3,4.4,5.5,6.1 | TauCetiRoadmap/GlobalQuadraticForms/README.md:584, :649, :74, :773, :839. The old 4.4 is explicitly mapped to pinned symbol prescription and reciprocity; it is not a deleted citation. |
| DiophantineApproximationAndTranscendence 0.2,0.3,5.6 | TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:177, :296, :3555. Mahler/absolute height and Northcott; differential-exponential Ax is not the Shimura Ax input. |
| ShimuraVarieties 3.4b–e,3.5a,3.5d,3.6 | TauCetiRoadmap/ShimuraVarieties/README.md:820, :848, :878, :900, :938, :996, :1006. Native-definability bridge, cells, dimension, choice/curve selection, R_an,exp, smooth Chow and Hermitian quotient comparison. Remmert–Stein is an additional declared contract. |
| AdelicAlgebraicGroups 2.4 | TauCetiRoadmap/AdelicAlgebraicGroups/README.md:2053 and :2103. Characteristic-zero smooth affine groups; the package's analytic-manifold, tensor and arbitrary-model extensions are larger. |
| AbelianSchemesAndArithmeticModuliPartII B2.6,B2.7,B2.14,B2.15,B2.18 | TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md:1515, :1541, :1726, :1755, :1796. The semirational arc theorem does not imply the no-unrestricted-coordinate covering by itself: second projection cardinality is at most1. The covering gap is correctly declared. |
| RealAlgebraicGeometry Layers3,6 | Completed/RealAlgebraicGeometry/README.md:298 and :437. Real semialgebraic syntax/projection/QE, not arbitrary o-minimal geometry. |
| DifferentialGeometry, Boundary and corners | TauCetiRoadmap/DifferentialGeometry/README.md:203. The charted-space substrate is imported; finite definability certificates are additional. |
| ResolutionOfSingularitiesCharacteristicZero 6.2 | TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md:893. Characteristic-zero smooth quasiprojective compactification with SNC boundary. |
| WeilConjectures 5.29 | TauCetiRoadmap/WeilConjectures/README.md:1335. Curve reciprocal-root bounds at all conjugates. |
| Chebotarev Layer14 | TauCetiRoadmap/Chebotarev/README.md:612. Density #C/#G and finite-exception invariance; positive density gives auxiliary primes. |
| ClassFieldTheory Layers5,10–13 | TauCetiRoadmap/ClassFieldTheory/README.md:1054, :1638, :1781, :1834, :1924. Local invariant, global sum, reciprocity, existence and cyclic norm conditions. |
| StratifiedSpacesAndTameTopology 4.1,7.1 | TauCetiRoadmap/StratifiedSpacesAndTameTopology/README.md:539 and :920. Triangulation and C^p decomposition are explicitly excluded from new ownership; real analytic cells require the selected structure. |

The closest-work comparison also read the scopes of ComputabilityTheory, ClassicalArithmeticCompletion and ArithmeticDynamics. Their computability, arithmetic-completion and dynamics targets do not supply the full native MRDP comparison, uniform integrals or Pila–Wilkie interface here. Object searches using the roadmap index covered quotient interpretations, Denef–Pas, model completeness, MRDP, blocks, Remmert–Stein, normic fibrations and zero-cycles, plus the named declarations. No second fully qualified acceptance declaration was found outside the competing copy in S01. Ownership of the actual overlap in o-minimal foundations stays with ShimuraVarieties; the normic effective-degree theorem and the interpretation/native-computation adapters remain here. No new move of ownership is needed.

Pinned declarations were inspected by object as well as name. In particular:

- Mathlib/NumberTheory/Dioph.lean:93, :197, :245 and :667 provide extensional native Poly, Prop-valued induction, Dioph and Diophantine exponentiation; they do not provide native MRDP or executable reification of a bare Poly.
- Mathlib/Algebra/MvPolynomial/Funext.lean:57 uses an integral domain and infinite coordinate subsets; Mathlib/Algebra/MvPolynomial/Rename.lean:282 provides finite support before fixed-input witness compression. Neither says that a finite Boolean evaluation grid is enough.
- Mathlib/ModelTheory/Ultraproducts.lean:146 and :154 give Łoś; Mathlib/ModelTheory/Complexity.lean:343 gives the existing existential fragment. Neither supplies the proposed quotient interpretation calculus.
- Mathlib/ModelTheory/Arithmetic/Presburger/Definability.lean:161 excludes multiplication on ℕ. The README restricts its integer negative control to nonnegative inputs before using it.
- Mathlib/NumberTheory/Height/NumberField.lean:136 actually returns 1 off the algebraic domain, despite its docstring; :532 supplies the rational height identity. TauCeti/NumberTheory/Height/Absolute.lean:187 requires algebraicity and bounds degree and height simultaneously. The counting signatures carry those conditions.
- TauCeti/Geometry/RealAlgebraic/Semialgebraic/Basic.lean:75 defines the Boolean algebra generated by polynomial zero/positive sets. Projection closure is separate. TauCeti/Geometry/RealAlgebraic/Semialgebraic/Dimension/Basic.lean:76 uses nonempty open-embedding pieces and gives bottom on the empty set. TauCeti/Geometry/RealAlgebraic/Semialgebraic/RingLanguage.lean:135 supplies the real definability dictionary.
- TauCeti/RingTheory/GrothendieckRing.lean:180, :205 and :232 supply the completion ring maps and commutative-ring structure; the definable scissor presentation remains new work.
- TauCeti/NumberTheory/NumberField/Global/Approximation/Vector.lean:127 requires a finite-dimensional vector space and finite sets of finite/real places, with their module topologies. The rational one-dimensional application meets them.

The read-only dependency check returned exactly:

```text
depcheck: 239 roadmaps, 2175 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. All three gap suppliers are earlier. The git comparison with origin/main changes 16 files, all under packages/LogicAndDefinabilityInNumberTheory, with 4,466 insertions. Suggested.lean has the permitted imports, one module docstring, its own namespace, layer comments, theorem declarations with sorry, and five non-sorry definitions. No set_option, admitted example, True stand-in or sorry'd data occurs. No Lean command was run and no package source was edited.

### Source verification and independence

The following is the locator ledger for 50 separately inspected source locations or contiguous locator groups; repeated uses of one source location by several targets are counted once. The reading includes the hypotheses and surrounding argument, not only a title search. Source errors are separated below. Waived and uncertified texts are excluded from this count.

| # | Source location | What was compared |
|---|---|---|
| 1 | cluckers_loeser_2008 line 353 | Theorem2.1.1, VF-only elimination and remaining RF/VG formulas. |
| 2 | cluckers_loeser_2008 line 370 | Corollary2.1.2, named coefficient diagram. |
| 3 | cluckers_loeser_2008 line 375 | Subassignments need not be subfunctors. |
| 4 | cluckers_loeser_2008 line 856 | Presburger rational-series theorem4.4.1 and its product convention. |
| 5 | cluckers_loeser_2008 line 1180 | Residue direct image and projection formula; nonmultiplicativity correction. |
| 6 | cluckers_loeser_2008 line 1551 | Theorem7.2.1, cell presentation and constructible-function preparation. |
| 7 | cluckers_loeser_2008 line 1800 | Jacobian preparation through Corollary7.5.4 on author p.45. |
| 8 | cluckers_loeser_2008 line 2477 | A7/A8 graph and annulus normalizations. |
| 9 | cluckers_loeser_2008 line 3039 | Theorem12.1.1 and Jacobian direction. |
| 10 | cluckers_loeser_2008 line 3188 | Signed projection formula. |
| 11 | cluckers_loeser_2008 line 3292 | Theorem14.4.1, relative rational series. |
| 12 | cluckers_loeser_2008 line 3416 | Global affine-chart argument and its invalid open-embedding claim. |
| 13 | cluckers_loeser_2008 line 3635 | Theory change and algebraically closed residue realization. |
| 14 | cluckers_loeser_exp line 1580 | Coefficient language, local fields and uniformizer conventions. |
| 15 | cluckers_loeser_exp line 1703 | Theorem9.1.5, all allowed sufficiently large residue characteristics. |
| 16 | cluckers_loeser_exp line 1742 | Theorem9.1.6, general pushforward in characteristic-zero local fields. |
| 17 | cluckers_loeser_exp line 1750 | Proposition9.2.1 and coefficient compatibility/ultraproduct proof. |
| 18 | cluckers_loeser_exp line 1853 | Theorem9.2.4, universally quantified transfer. |
| 19 | integrability_of_oscillatory_functions_on_local_fields_transfer_p line 1428 | Theorems4.3.1–3: integration, zero loci, interpolation. |
| 20 | cluckers_comte_loeser_2012 line 206 | Definition1.4.1 and Theorem1.4.2, analytic cell data. |
| 21 | cubides_darniere_leenknegt_2017 line 141 | Fibre convention, Definition2.2, HM1 and Lemma2.3; fibres retain the base coordinates. |
| 22 | pas_1989 line 288 | Printed p.144 starts the relevant preparation proof §3.6. |
| 23 | geometric_stabilisation_via_p_adic_integration line 268 | Generic-image identification and Proposition2.1's measure claims. |
| 24 | geometric_stabilisation_via_p_adic_integration line 296 | Dual-volume theorem and Néron-model argument. |
| 25 | mirror_symmetry_for_moduli_spaces_of_higgs_bundles_via_p_adic_int line 1045 | Relative tensor form, Claim4.2 and substitution Lemma4.3. |
| 26 | torsion_and_tamagawa_numbers line 1541 | General finite-residue perfectness, Proposition4.3, cyclic invariants/coinvariants and S₃ negative control. |
| 27 | hilbert10_polynomial_bridge line 555 | toDiophPoly, evaluation and exists_mvPolynomial at line619. |
| 28 | hilbert10_finite_diophantine_normal_form line 623 | Both finite normal-form declarations, including the second at line693. |
| 29 | koenigsmann_defining_z line 47 | Universal definition and the complement/universal-existential corollaries. |
| 30 | koenigsmann_defining_z line 161 | Proposition6 and the real-place trace restriction. |
| 31 | koenigsmann_defining_z line 280 | Prime-class definitions versus the misprinted proof at lines367/378. |
| 32 | koenigsmann_defining_z line 416 | Radical lemmas13–14 and empty-support handling. |
| 33 | koenigsmann_defining_z line 609 | Universal intersection Proposition18. |
| 34 | koenigsmann_defining_z line 653 | Square-detection union and Proposition21. |
| 35 | koenigsmann_defining_z line 875 | Corollary22, exactly one universal variable. |
| 36 | koenigsmann_defining_z line 916 | Proposition23 and Remark24, model preservation and non-model-completeness. |
| 37 | le_compl_mentaire_des_puissances_n_i_mes_dans_un_corps_de_nombres line 175 | Proposition2.2, roots excluded over K, cyclic algebra and smooth model. |
| 38 | le_compl_mentaire_des_puissances_n_i_mes_dans_un_corps_de_nombres line 269 | Theorem3.1, multiplicity-one abelian constant field; Corollary3.2's degree bound. |
| 39 | le_compl_mentaire_des_puissances_n_i_mes_dans_un_corps_de_nombres line 502 | Rank-p étale family, not field extension at split parameters. |
| 40 | bkt line 104 | R_an, R_exp, R_an,exp and cube convention; finite atlases at line908. |
| 41 | geometric_categories_and_o_minimal_structures line 509 | Analytic decomposition, components, uniform fibre bound and curve selection. |
| 42 | peterzil_starchenko_agc line 596 | Theorem4.4 and Corollary4.5; arbitrary analytic exceptional locus. |
| 43 | ax_schanuel_for_shimura_varieties line 180 | Definable closure, quasiprojective Chow and Boolean/constructible consequence. |
| 44 | on_the_algebraic_points_of_a_definable_set line 220 | Basic/image blocks, Proposition3.4 and covering Theorem3.5. |
| 45 | on_the_algebraic_points_of_a_definable_set line 322 | Coefficient encoding and Lemma5.2; corrected k+1 coefficients. |
| 46 | ax_lindemann_for_a_g line 811 | Maximal orbit/isolated-point induction and analytic-cell finite-union proof through line863. |
| 47 | the_andr_oort_conjecture_for_a_g line 274 | Orbit-discriminant inequality, Theorem5.3 and §6 height/counting reduction. |
| 48 | the_ax_schanuel_conjecture_for_variations_of_hodge_structures line 60 | Strict codimension inequality and proper weak Mumford–Tate conclusion. |
| 49 | the_shafarevich_conjecture_for_hypersurfaces_in_abelian_varieties line 2958 | Lemma6.3, including separate zero-dimensional case. |
| 50 | towards_the_andr_oort_conjecture_for_mixed_shimura_varieties_the_ line 2122 | Mixed orbit estimate and Theorem13.6 proof through line2205; the corrected weight subgroup was also checked against Definition2.1. |

All 215 displayed Check bullets in 56 Check blocks were inspected against their definitions, hypotheses and the computations in the target ledger. The finite-prime, zero-dimensional, empty-support, zero-polynomial, nonreduced and nondefinable negative controls were retained. In particular, the coefficient-space proof uses k+1 coefficients, the relative form has base-first sign, and the norm family has rank p at split parameters.

For wording, I compared 18 substantive passages in README §§1.3,2.2,2.7,2.12,3.1,3.2,3.9,4.1,4.21,6.2,6.6,6.8,6.10,6.13,6.16,7.3,7.6,7.7 with the sources at the ledger locations. These cover definitions, explanations, proof plans and the mathematics repeated in the acceptance docstrings. Formulae, conventional theorem language and necessary hypothesis lists coincide; I found no copied nonmathematical sentence, source table, exercise collection or figure. The longest substantive exact-language match located by the token comparison was the standard weakly-special/special-point characterization, 15 words; this is mathematical wording, not a copied exposition finding.

For the reproducible source-share count, a terminal parenthetical citation block counts once for each source it names, including short-form names; multiple theorem numbers in that block are one citation group. There are 92 such blocks, of which 21 name cluckers_loeser_2008, the largest share. Sections6.15 and7.1 have their locators inline instead. The CL table of contents is at cluckers_loeser_2008 lines292–311. The package's order is not a run of that contents: its local integration and geometric measures precede the motivic coefficient construction, cells precede the coefficient tensor products, and computability and real counting branches are independent. In particular §§3.2→3.5→3.6→3.7 are forced by the scissor-ring, tensor-product and dimension-grading Needs edges; the similarity of that subsequence is mathematical dependency. Layer4's native computation comparison and rational definability are not CL chapters, nor are Layers6–7. The other sources for the main routes include Koenigsmann Proposition18, CTV Theorem4.3, Pila Theorems3.5/5.3 and Tsimerman Theorem5.3.

Source independence: 18 passages compared with 12 sources; no nonmathematical copying or material reuse found; largest share cluckers_loeser_2008, 21 of 92 terminal citation blocks; contents compared with cluckers_loeser_2008: independent.

## Not verifiable

- No new Lean elaboration or proof build was run, as required by this read-only pass. The supplied 16 elaborated signatures were checked instead. Admitted theorems remain proof obligations; example computations do not certify their proofs.
- The settled waived texts vd_dr_tame, vd_dr_macintyre_marker and pila_wilkie and the settled uncertified texts hilbert_s_tenth_problem_is_unsolvable, bosch_lutkebohmert_raynaud, schneider, hodges and denef_1984 were not reopened. Their unavailable text is not counted in the 50 verified locator groups. No new source request is needed.
- Source-proof audits here concern the cited statements and the roadmap's use of them, not a proof certification of every page of every source. The 215-Check count records inspection; the target ledger gives the computed instances, not a claim of machine verification.
- General Néron pairing perfectness, block-family covering and definable Remmert–Stein remain explicit supplier contracts. Their eventual implementations cannot be checked at this head. The downstream package is conditional on those contracts in exactly the same way as on other unimplemented suppliers.

## Source issues

- **Error** in cluckers_loeser_2008 at §5.1.2, author p.28, line1180: the source says residue direct image is multiplicative; it should be additive with the projection formula (two points give 2, whereas 2²=4); affects a stated result.
- **Misprint** in cluckers_loeser_2008 at Theorem10.1.1 A8, author p.60, line2488: the source says the graph projection uses f!; it should use the displayed map p!; affects nothing.
- **Misprint** in cluckers_loeser_2008 at Proposition13.2.1(2), author p.77, line3193: the source says both factors enter pullback; it should pull back only the base factor before multiplication by the source factor; affects nothing.
- **Error** in cluckers_loeser_2008 at §15.1, author p.83, line3416: the source says an affine variety chart is an affine open of affine space; it should use a closed embedding, with embedding-independent integration; affects the proof.
- **Gap** in cluckers_loeser_exp at Proposition9.2.1, author p.44, line1751: the source says residue-field isomorphism suffices with named constants; it should require compatibility with the interpreted coefficient data; affects a stated result.
- **Misprint** in cluckers_loeser_exp at Proposition9.2.1 proof, author p.44, line1763: the source says characteristic zero of the ultraproduct fields suffices; it should require residue characteristic zero for this elimination argument; affects the proof.
- **Gap** in cluckers_loeser_exp at Proposition9.2.1 proof, author p.44, line1768: the source says pullback factorization determines a function on the entire target uniquely; it should restrict to the image and choose zero extension; affects the proof.
- **Gap** in geometric_stabilisation_via_p_adic_integration at §2.1, author p.6, line268: the source says integral points are a subset of generic points for the stated models; it should assume separatedness for that identification; affects the proof.
- **Misprint** in geometric_stabilisation_via_p_adic_integration at Proposition2.1(b) proof, author p.6, line289: the source says the induced covering goes from X° to Y° and omits its degree in the integral; it should reverse direction and retain the covering factor; affects the proof.
- **Error** in geometric_stabilisation_via_p_adic_integration at Proposition2.2 proof, author p.6, line308: the source says the extension is an isogeny of whole Néron models; it should assert étaleness and a connected-special-fibre isogeny; affects the proof.
- **Misprint** in mirror_symmetry_for_moduli_spaces_of_higgs_bundles_via_p_adic_int at Proposition4.1, author p.20, line1046: the source says the relative form is a section on Y; it should be a section on X; affects nothing.
- **Misprint** in mirror_symmetry_for_moduli_spaces_of_higgs_bundles_via_p_adic_int at Claim4.2 proof, author p.20, line1081: the source says η is an r-fold tensor; it should be the ordinary coordinate top form, whose r-fold tensor is compared; affects nothing.
- **Misprint** in koenigsmann_defining_z at Proposition6 proof, printed p.78, line230: the source says the (6,15) row uses (1,1,0); it should use (1,1,1), giving69≡5 rather than−21≡3 modulo8; affects the proof.
- **Misprint** in koenigsmann_defining_z at Proposition10 proof, printed p.81, line367: the source says the class-five trace terms use first entries −2p and 2p; it should use −2 and 2, as Definition7 does; affects nothing.
- **Misprint** in koenigsmann_defining_z at Proposition10 proof, printed p.81, line378: the source says the class-seven trace terms use the displayed p-dependent first entries; it should use −1 and −2, as Definition7 does; affects nothing.
- **Gap** in le_compl_mentaire_des_puissances_n_i_mes_dans_un_corps_de_nombres at Corollary3.2, author p.10: the source says irreducibility of Q,R suffices to invoke Proposition2.2(iii); it should also assume neither polynomial has a zero in K; affects the proof.
- **Misprint** in on_the_algebraic_points_of_a_definable_set at Definition5.1 and Lemma5.2, author pp.7–8, line324: the source says degree-at-most-k algebraic numbers use k coefficients with powers0,…,k−1; it should use k+1 coefficients with powers0,…,k; affects a stated result.
- **Misprint** in peterzil_starchenko_agc at Theorem4.4 proof, author p.12, line603: the source says to apply intersection bounds to M_i and A, and closes M_i∩E; it should use M_i and E, and cl(M_i)∩E; affects the proof.
- **Misprint** in geometric_categories_and_o_minimal_structures at §4.5, author p.13, line521: the source says a section of arbitrary g satisfies f(g(x))=x; it should satisfy g(f(y))=y on g(B); affects a stated result.
- **Misprint** in native_multiplicative_heights at absMulHeight₁ docstring, Mathlib/NumberTheory/Height/NumberField.lean:134: the source says its transcendental junk value is0; it should say1, as the definition's else branch does; affects nothing.

## For the human reviewers

- **Licence.** README §§4.1–4.9 cite cameronfreer/hilbert10, PolyBridge.lean and NormalForm.lean. The package records Apache-2.0, but this pass did not audit that repository's licence. Suggested.lean contains none of those copied declaration names/signatures.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "96394e97605cbec0be380fc78c6bbe13adadb3c0", "job": "RT-LogicAndDefinabilityInNumberTheory~2a", "model": "gpt-6-astra", "worker": "chris-32"} -->
