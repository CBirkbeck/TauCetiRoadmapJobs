<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1232#issuecomment-6483744985 -->
Red team round 2 pass a (codex) of d06bd72

Verdict: needs_changes

1. **F01** (P2) The repaired build still uses a later bialgebra

   **Location:** packages/FunctionFieldArithmeticPartII/README.md:7856, §3.180: “Install only the bialgebra of §3.227 A locally”.

   **Claim:** Every prerequisite precedes its consumer (README:109); the represented action at §3.180 uses the convolution monoid.

   **Witness:** The convolution identity is the counit and multiplication uses comultiplication. §3.180 explicitly installs §3.227, which occurs later. Its Needs line omits this prerequisite.

   **Repair text:** “Define the action first for an ordinary A-algebra homomorphism g:H_A→B and a chart point x. State its convolution identity and multiplication laws only after §3.227 installs the bialgebra, and list §3.227 in their Needs.” Move the associated convolution-group targets after their structure inputs and update references.

   **Repair test:** On the all-one chart point over ℂ, a coherent point with g(h₂)=ζ₆ sends u₂ to ζ₆; the counit sends it to 1. The action formula is defined before the bialgebra, while interpreting 1 and g*h requires that structure. This is a remaining instance of r1a F01, whose listed moves were applied.


2. **F02** (P1) The infinite band has no subgroup μp

   **Location:** `packages/FunctionFieldArithmeticPartII/README.md:11732`, “its band contains the infinitesimal μ_(p^r)”; line 11745, “the band G_k has the nonreduced subgroup μ_p”.

   **Claim:** The characteristic-p infinite band contains these finite infinitesimal group schemes as subgroups.

   **Witness:** Any map μ_p→lim_n μ_n projects at degree n through μ_(np)→μ_n. On character groups the compatible map to Z/p is divisible by p, hence zero. Thus Hom(μ_p,G_k)=0.

   **Exact repair:** “In characteristic p, each projection G_k→μ_(p^r) is an fpqc quotient; these are not subgroup inclusions. The coordinate algebra k[Q/Z] has the nonzero nilpotent e_[1/p]−1, whose pth power is zero, so replacing G_k by its geometric points loses its scheme structure.” Replace both occurrences, including the Check, and use this algebra computation as the negative control.

   **Repair test:** In characteristic 2, (e_[1/2]−1)^2=0 but e_[1/2]−1≠0 by the group-algebra basis. Every μ_2→G_k is trivial; the projection G_k→μ_2 remains faithfully flat. This error was introduced by the repair of r1a F05.

3. **F03** (P1) The empty-ramification proof confuses a stack fibre with its scalar quotient

   **Location:** `packages/FunctionFieldArithmeticPartII/README.md:13476`, “the smooth surjective Abel–Jacobi map, whose geometric fibres P^(d−g) are connected and simply connected”.

   **Claim:** Abel–Jacobi to the Picard stack has these projective geometric fibres.

   **Witness:** Take an elliptic curve, R empty, d=1, and a degree-one line L. The two-fibre is H⁰(L)\{0}=G_m, whereas P^(d−g)=P⁰. Section 8.5 itself gives the former fibre.

   **Exact repair:** Move §8.2 after §8.12 and replace its proof by: “Apply §8.12 with R empty. The fixed-object fibre is V(π_*L) minus its zero section. Sections 8.10–8.11 use its ordinary scalar quotient P(π_*L), whose geometric fibres are P^(d−g), to construct the local descent line; §8.12 glues these lines with their normalized comparisons.” Adjust internal references after moving the subsection. Retain its theorem without narrowing the conclusion.

   **Repair test:** At g=d=1 the fibre is G_m and its scalar quotient is P⁰. Only the latter is used for simple connectivity. The replacement does not infer simple connectivity of G_m or properness of Abel–Jacobi to the stack.

4. **F04** (P3) The zero-section Check does not specify which sections vanish

   **Location:** `packages/FunctionFieldArithmeticPartII/README.md:11148`, “For every zero section, all evaluated z_n are zero”.

   **Claim:** The Check does not distinguish f=0 from t_n=0 for every n. Its target-section reading is false; its root-section reading needs to be stated explicitly.

   **Witness:** Over T=Spec C_k(0), the tautological coherent root system has β_n(t_n)=z_n. Its target section is zero, but z₂≠0 and z₂²=0; §3.403 proves these finite roots survive.

   **Exact repair:** “For the zero-section root system (every t_n=0), every evaluated z_n is zero. For the tautological coherent system over Spec C_k(0), the target section is zero but the evaluated coordinate z₂ is nonzero and satisfies z₂²=0.”

   **Repair test:** The distinguished gerbe gives coordinate 0, while the full universal chart gives the nonzero basis element z₂. Both have target section 0, so the two objects are distinguished.

5. **F05** (P3) Antipode Checks do not distinguish inversion from the identity

   **Location:** `packages/FunctionFieldArithmeticPartII/README.md:7784`, “the antipode image of the degree-two unity root multiplied by that root is 1”; lines 7785–7786 give involutivity and the zero-ring value.

   **Claim:** These are three discriminating Checks for the inversion map defined in §3.176.

   **Witness:** The identity endomorphism passes all three: h₁²=1, id²=id, and id(0)=0. Over Z it sends h₂ to h₂, whereas inversion sends h₂ to h₂⁵≠h₂ in the embedded sixth-root stage.

   **Exact repair:** Replace the three bullets with: “Over Z, S(h₂)=h₂⁵, which differs from h₂ by the sixth-root basis. Over F₂, S(h₂)=h₂⁵ still differs from h₂ despite −1=1. Over Z, S(3+2h₂)=3+2h₂⁵; its nonconstant term survives and its constant coefficient remains 3.” Keep the involution and zero-ring statements in the API or examples.

   **Repair test:** The identity fails the first two, and coefficient augmentation fails the third. Injectivity of finite-stage inclusions preserves all displayed inequalities in the infinite algebra.

6. **F06** (P3) The diagonalizable-group locator points to a different statement

   **Location:** `packages/FunctionFieldArithmeticPartII/README.md:4577`, “AOV08 … line 906 — Proposition 2.7, p.1067”.

   **Claim:** The cited line locates the linear reductivity input for diagonalizable group schemes.

   **Witness:** AOV08 line 906 is Definition 3.1 (tameness), printed p.1077. Proposition 2.7 is at line 454; its proof invokes diagonalizable groups at line 459. Theorem 3.2 and Corollary 3.3 start at 910 and 924.

   **Exact repair:** “AOV08 line 454, Proposition 2.7 and its proof, p.1067; line 910, Theorem 3.2, p.1077; line 924, Corollary 3.3 and its proof, pp.1078–1079.” Retain the statement and its declared finite-diagonalizable coarse-quotient gap.

   **Repair test:** For μ_p over F_p, character grading gives an exact degree-zero functor although the group scheme is nonreduced. Proposition 2.7 supports that premise; Definition 3.1 alone does not prove it.

7. **F07** (P3) The DM coefficient supplier no longer declares the five cited names

   **Location:** `packages/FunctionFieldArithmeticPartII/README.md:101`, “Consume §8.24's `dmStack_etaleCohomology`, `dmStack_etaleCohomology_atlas`, `dmStack_etaleCohomology_refinement`, `dmStack_etaleCohomology_pullback` and `dmStack_etaleCohomology_frobenius`”.

   **Claim:** These are current names in the supplier.

   **Witness:** Current `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:2839–2858` states the coefficient construction and its API in prose. None of the five names occurs there or in its 191-line Suggested.lean. Other consumers still using the names are not their owner.

   **Exact repair:** “Consume DeligneWeightsAndPurity §8.24's rational constructible étale coefficient category for finite-type DM stacks over finite fields, with its atlas descent equivalence, coherent atlas refinement, pullback and Frobenius functoriality.” Make the same prose substitution in the Needs line at 12939. Retain the separate local ownership of §§7.4–7.7. No new supplier gap is needed: the mathematical contract still exists.

   **Repair test:** Over a finite field of odd characteristic, the supplier explicitly checks constant and sign lines on BC₂: geometric H⁰ has dimensions 1 and 0, with positive rational cohomology zero. This is the same coefficient theory consumed here.

8. **F08** (P3) Two trivial-line coordinate Checks repeat the recursive definition

   **Location:** `packages/FunctionFieldArithmeticPartII/README.md:320–322`, “c_0=id_O” and “c_1 equals the right-unit isomorphism O⊗O≅O”.

   **Claim:** §1.8 supplies three discriminating Checks for its new coordinate family.

   **Witness:** Line 304 defines c₀ as the identity and c_(n+1) by the right-unit recursion. The first two Checks merely repeat its zero and first recursive clauses; only the third tests a section calculation.

   **Exact repair:** Replace the three bullets by: “Over Z, the cube of the section 2 evaluates under c₃ to 8. Over Z[ε]/ε², the square of 1+ε evaluates under c₂ to 1+2ε, not 1. Over Z/4, the square of the nonzero section 2 evaluates under c₂ to 0.” Retain c₀ and c₁ in the definition/API.

   **Repair test:** Coefficient augmentation loses 2ε, identity-on-coefficients gives 2 instead of 0 in Z/4, and negating the cube coordinate gives −8 instead of 8. The three tests therefore distinguish concrete wrong coordinate maps.

## Verification of the previous findings

The identifiers below refer to the two round-one reports, not to new findings. The repair report's settled architecture observation is not re-raised. Locations in this table are in `packages/FunctionFieldArithmeticPartII/README.md` unless stated otherwise.

| Previous finding | Status at this head | Repaired passage and verification witness |
| --- | --- | --- |
| r1a F01, internal forward references | Partly repaired | Line 764 now introduces “Algebra-valued finite root points” in §1.35; lines 4431–4498 put affine stackification and universe transport after §2.4; §§7.3–7.7 precede their consumers. The specified old edges are removed. The more general ordering claim still fails at §3.180→§3.227: S01. |
| r1a F02, process narrative | Repaired | Line 109 now says “Each subsection states its exact hypotheses and proof inputs.” The former “promotes the consumed API” and “merged SchemeAndStackFoundations” phrases are absent. The ordinary supplier references remain. |
| r1a F03, fppf versus fpqc | Repaired | §3.52 distinguishes the “fppf classifying stack” from the coherent root limit and uses the “fpqc quotient”. Over Q, simultaneous roots of 2 cannot be trivialized on a nonempty finite-type cover: a closed point has finite residue degree, whereas a root of Xⁿ−2 has degree n. This does not prevent the coherent limit itself being an fppf stack. |
| r1a F04, residual gerbes unowned | Repaired, conditional on the declared gap | Line 53 says “What SchemeAndStackFoundations must provide (gap:zero-dimensional-dm-residual-gerbes)”. Its hypotheses include algebraically closed K, finite type, DM, and finite discrete underlying space. The identical slug and needs occur in design/plan.json. §5.23 uses this contract; it does not claim that the full nonreduced fibre is its reduction. |
| r1a F05, undefined reduction of the infinite fibre | Partly repaired; new error introduced | §3.421 now names “The infinite DVR zero-section gerbe” and uses D(Q/Z), while §3.403 retains nonzero nilpotent root coordinates. This repairs the undefined reduction and geometric-points identification. The new claim that the band contains μ_p is false: S02. |
| r1a F06, coefficient-extraction Checks | Repaired | §3.360 now tests the “rational-character tensor coefficient”. On 2e_[1/2]⊗3+5e_0⊗7 the [1/2] coefficient is 6 and the zero coefficient is 35, not the augmentation 41. The [−1/3] coefficient of e_[1/3] is 0; the positive coefficient is 1. In Z/4 the extracted coefficient 2 is nonzero although its square is zero. |
| r1a F07, collision fibre identified with its reduction | Repaired | §7.20 explicitly uses “reduced” residual gerbes for the double collision. The full local fibre has ring K[s,t]/(s²+t²,st), with basis 1,s,t,s² and s³=t³=0; the relative reduced gerbe is Bμ₂. Rational nilpotent invariance, rather than equality of stacks, connects the calculations. |
| r1a F08, source anchors | Repaired | The relevant replacements agree with r1b F05 below. In particular §2.5 cites “STACKS-AFFINE-DESCENT line 807” and “line 1011”, which contain effective module descent and finite locally free descent respectively. |
| r1a F09, coefficient supplier generality | Repaired | §7.7 begins “Let k be a finite field” and explicitly uses DeligneWeightsAndPurity §8.24, “which constructs it over finite fields only”. Its consumers are in the finite-field setting. Geometric stalks are pullbacks of that category, not an assertion that the supplier constructs a new category over every algebraically closed field. |
| r1b F01, absent finite invariant headline | Repaired | Suggested.lean:96 now states rootChartCoaction_eq_includeRight_iff, and README:4341 names it. In F₂[t]/t², t is not constant and δ(t)−1⊗t=(h−1)⊗t≠0. Both sides are false. For coefficient 2 over Z/4 both sides are true. |
| r1b F02, unresolved planning slugs | Repaired | The repaired references name numbered targets, e.g. §1.59 “Number of killed root columns”, §5.10 “Relative evaluation and its chosen two-pullback equivalence”, and §8.10 “The proper scalar quotient of a family chart”. The initial resolver reported no unresolved cross-roadmap citations or Lean names; a subsequent direct supplier read found the stale external names in S07. This checks reference resolution, not all dependency directions; S01 remains separate. |
| r1b F03, process/template residue | Repaired as a textual finding; associated proof repair introduced S03 | The former “merged”, “the stated coordinate construction” and “source-qualified” templates are removed. §8.2 now invokes “the smooth surjective Abel–Jacobi map”, but assigns it the projective fibre of a different map. At g=d=1 its actual fixed-object fibre is G_m, not P⁰; see S03. |
| r1b F04, nondiscriminating Checks | Repaired at the listed sites | §1.63 and §1.88 retain the F₃ arrow labelled 2 from 1 to 2: 2²=1. §1.77 retains the nonreduced F₂[T]/(T−1)². §1.135 has 2·2²=1 in F₇. §3.230 evaluates h₁+3 to 0 in Z/4 rather than 2. §3.269 sends h₂ to h₂⁵, also in characteristic 2. The newly audited antipode definition still has the different Check defect S05. |
| r1b F05, locators and wrong source file | Repaired | The torsor-gluing citation now names “SchemeAndStackFoundations §§1.15 and 2.3”, rather than assigning 04UJ to an extraction that lacks it. The corrected anchors were read: AV99 189/213; ETINGOF 1493; CONRAD-EXT 497/548; NOOHI 700; MILNE-CFT 3357/3368; ACV01 1594/1615; MILNE-LEC 2602/2631/2682/3058/3104; STACKS-NORMS 1513/1536/1553/1591; YZ19 6918/6968/7015/7142/7320/7570. |
| r1b F06, namespace cited as declaration | Repaired | README:43 now names “TauCeti.RootsOfUnityGroup.groupScheme”, “pointsMulEquiv” and “schemePointsMulEquiv”. They exist at the pin in TauCeti/Algebra/AlgebraicGroup/RootsOfUnity/Scheme.lean:82, Basic.lean:124, and Scheme.lean:101. The scheme carrier is an abbreviation, and the two point comparisons are equivalences, with their coefficient algebra instances retained. |

## Suggested.lean declaration and context table

All six declarations were read in full, including the real bodies of the three definitions. There is one universe u and no section-variable block. The supplied elaborated-signature receipt was compared with each declaration and with the README. No Lean command was run in this read-only review. All required binders are explicit; no hypothesis was lost. The zero ring is admitted throughout.

| Declaration; README section | Explicit context | Instances and computed values on both sides | Result/change |
| --- | --- | --- | --- |
| rootChart; §§1.7, 1.26 | A : Type u, [CommRing A], f : A, n : N; no positivity | n=0: A[T]/(1−f), so f=1 gives A[T], while A=Z/4,f=2 gives the zero ring. n=1 gives A with t=f. n=2,F₂,f=0 gives basis 1,t and t²=0≠t. | Total algebra definition matches prose; no μ₀ claim. |
| rootChartCoaction; §1.7 | Same explicit context; source B_f, target B_1⊗_A B_f | δ(t)=h⊗t. At n=3,F₇ and h=2 it evaluates to 2t, not 4t; at n=2,F₂,f=0 its difference from the right inclusion is (h−1)⊗t≠0. At n=0 its root relation is 1=f on both sides. | Real quotient lift respects its relation. |
| rootChartComparison; §1.26 | Same context; source B_f⊗_A B_f, target B_1⊗_A B_f | n=2: (1⊗1,1⊗t,t⊗1,t⊗t) maps to (1,t,ht,fh). Matrix determinant −f. n=3 determinant f³; n=1 identity. | Real tensor lift has the specified order and sign. |
| rootChartComparison_injective_iff; §1.190 | Same context plus hn : 0<n | Z,f=2,n=2: ker Θ=0 and ker(·2)=0. Z/4,f=2: 2(t⊗t)≠0 maps to 0, and 2·2=0. Field f=0,n=2: kernel dimension 1, both sides false. n=1: both true. Zero ring: both true. Without hn, Z/4,f=2,n=0 gives singleton source/target, so injectivity true but RHS false. | Both directions survive; positivity matters. |
| rootChartComparison_surjective_iff; §1.191 | Same context plus hn : 0<n | Z,f=2,n=2: h⊗1 has no preimage and 2 is not a unit; cokernel Z/2. F₂,f=1,n=2: Θ bijective despite (t−1)²=0, and 1 is a unit. n=1: identity even f=0. Zero ring: 0 is a unit and the singleton map is onto. Without hn, Z/4,f=2,n=0 has an onto singleton map but RHS false. | Both directions survive. |
| rootChartCoaction_eq_includeRight_iff; §2.3 | A,[CommRing A],f,n,hn : 0<n,b : rootChart A f n | n=1: every b is a coefficient, both sides true. F₂,f=0,n=2,b=t: tensor difference (h−1)⊗t≠0 and t not in coefficient image, both false. Z/4,b=2: both true; b=2t: coefficient comparison gives 2≠0 in the nonzero character row, both false. Zero ring: both true. | Repairs r1b F01; finite nonreduced inputs retained. |

The three theorem statements require the nontrivial coefficient/permutation argument, not one unfolding or a single pinned theorem. No Suggested.lean padding was found. The remaining headline families named in its module docstring require root-stack, coherent colimit-coaction, root-Picard, stack-coefficient, or torsor-groupoid constructions; no weakened surrogate is inserted. The elementary tensor/exterior compatibility in §7.13 uses native carriers and the imported factorial identities, but is an intermediate algebraic input, not the stack cohomology headline it supplies.

## Sampled README adversarial computations

The original review read 816 numbered targets and one unnumbered projective-space target. This shortened report retains representative computed instances from all ten layers, including the disputed constructions; the repetitive per-target ledger is omitted. These instances test statements, not general proofs. Layers 1–3 admit arbitrary commutative rings, including the zero ring, with positive geometric exponents. Layers 4–10 retain the stated finite-field, odd-characteristic and smooth projective geometrically connected curve hypotheses, except where a target explicitly has wider scope.

| Target in packages/FunctionFieldArithmeticPartII/README.md | Instance and computed values on the two constructions / sides | Result and change |
| --- | --- | --- |
| 1.1 Diagonalizable action on the affine root chart (line 113) | F₂[ε]/ε²,n=2: (1+ε)²=1; t maps to t+εt, not t. At n=1 only the identity acts. | No counterexample in this instance |
| 1.8 Canonical coordinates for powers of the trivial line (line 302) | Trivial-line section 2: powers at n=0,1,2 evaluate to 1,2,4. Zero section gives 1,0,0. Pullback Z→F₂ gives 1,0,0 on both routes. | Mathematics survives; S08 replaces tautological Checks |
| 1.26 Affine action comparison (line 603) | Z/4→F₂,n=2,u=3: T remains T while 3 maps to 1; D becomes F₂[T]/(T−1)². Arrow w=−1 sends T_q↦−T_p and y_q=−y_p, hence T_q y_q↦T_p y_p. Direct and iterated pullback projections have these same two coordinates. | No counterexample in this instance |
| 1.28 Root coefficient permutation sign (line 665) | n=2: one transposition gives −1; n=3: two 3-cycles give +1; n=4: signs 1,−1,+1,−1 multiply to +1. | No counterexample in this instance |
| 1.63 Full faithfulness of the normalized chart embedding (line 1245) | F₇ arrow w=2 from (1,1) to (2,2): inverse label 4, product 1; contravariant normalization sends T_q to 4T_p, with (4T_p)²=2. Zero-section labels ±1 stay distinct in F₃. | No counterexample in this instance |
| 1.77 Normalization along an arbitrary test-algebra map (line 1439) | Z/4→F₂,n=2,u=3: T remains T while 3 maps to 1; D becomes F₂[T]/(T−1)². Arrow w=−1 sends T_q↦−T_p and y_q=−y_p, hence T_q y_q↦T_p y_p. Direct and iterated pullback projections have these same two coordinates. | No counterexample in this instance |
| 1.135 An isomorphism to the normalized chart (line 2487) | F₇,n=2,f=1: p=(1,1),q=(2,2),w=2 obey y_q=2y_p and u_q·w²=2·4=1. In Z/4, (3,1) roots f=3 but cannot normalize over the base: all unit squares are 1. | No counterexample in this instance |
| 1.190 Sharp injectivity criterion (line 3348) | n=2,Z/4,f=2: kernel coordinate c_(1,1)=2 gives nonzero 2(t⊗t), image 4h=0; annihilator {0,2}. At f=0 over a field the kernel dimension is 1; at n=1 it is 0. | No counterexample in this instance |
| 1.191 Sharp surjectivity criterion (line 3366) | n=2,Z,f=2: h⊗1 not in image, cokernel Z/2; n=2,F₂,f=1: inverse exists despite nilpotents. n=1,f=0: identity; zero ring: singleton map onto and 0 a unit. | No counterexample in this instance |
| 2.3 Invariants of an affine root chart (line 4327) | F₂,t²=0: b=t has δb−1⊗b=(h−1)⊗t≠0 and is not constant; b=1 is constant and fixed. Zero ring: both true. | No counterexample in this instance |
| 2.17 Regular roots of regular Cartier divisors (line 4581) | F_p[x],D=(x),n=p: atlas F_p[z,q,q⁻¹] regular. For D=(x²),n=2,char≠2, tangent relation z²−qx² has no linear part at x=z=0, so atlas singular. | No counterexample in this instance |
| 2.18 The exact Deligne–Mumford locus (line 4598) | Z,s=2,n=3: 3 invertible on V(2), so DM everywhere although 3 not a unit of Z. Z,s=p,n=p: wild point excluded. Unit s: entire base included. | No counterexample in this instance |
| 3.52 Effective fpqc descent for root systems (line 5630) | n=1 component is the original pair; the coherent zero-section object has automorphisms lim μ_n. Under F₂[ε]/ε²→F₂ the parameter ε becomes 0 but z₂ survives with z₂²=0. Roots of 2 over Q still yield an fpqc object without fppf trivialization. | No counterexample in this instance |
| 3.138 A Kummer limit torsor without fppf trivialization (line 7124) | Q: X²−2 has degree 2, X³−2 degree 3, X^(m!)−2 degree m!. A closed finite-type point of residue degree d cannot contain a root of degree n>d. The affine tower is nonempty fpqc but has no nonempty fppf trivialization. | No counterexample in this instance |
| 3.176 Inversion of the unity-root algebra (line 7767) | Degree-two generator h₁ satisfies h₁²=1; identity passes cancellation, involution, and zero-ring tests. At degree six inversion is h₂⁵≠h₂ over Z and F₂, whereas identity gives h₂. S05. | S05: replace Checks |
| 3.180 The represented action on root-chart points (line 7852) | C,f=1,root point x_i=1: ζ_i acts by x₂↦ζ₂. Acting twice gives ζ₂², inverse action returns 1; convolution evaluates h₂ to ζ₂ξ₂. Identity family gives 1. Coefficients 3 remain 3. | S01: order repair |
| 3.227 Bialgebra on the factorial unity-root algebra (line 8635) | Δ(h₂)=h₂⊗h₂; both triple composites give h₂⊗h₂⊗h₂, flip fixes the tensor, ε(h₂)=1, S(h₂)h₂=1. Zero ring gives the unique maps. Structure use before §3.227 is separately flagged in S01. | No counterexample in this instance |
| 3.230 Counit compatibility with coefficient change (line 8689) | ε(h₂)=1, ε(3+h₁)=4; over Z/4 this is 0, whereas evaluation h₁↦−1 gives 2. ε∘η fixes a coefficient a, and (ε⊗id)δ(u₂)=u₂. | No counterexample in this instance |
| 3.269 Antipode compatibility with coefficient change (line 9276) | Unity root h₂⁶=1: inverse h₂⁵, product h₂⁶=1, double inverse h₂²⁵=h₂. In F₂, h₂⁵≠h₂ by the six-term basis. The same formulas hold after coefficient change. | No counterexample in this instance |
| 3.360 Rational-character tensor coefficient (line 10748) | P_[1/2](2e_[1/2]⊗3+5e_0⊗7)=6, P_0=35, augmentation=41. P_[−1/3](e_[1/3]⊗1)=0, P_[1/3]=1. Over Z/4 coefficient 2≠0 although 2²=0. | No counterexample in this instance |
| 3.377 The infinite affine fpqc root quotient (line 11026) | n=1 component is the original pair; the coherent zero-section object has automorphisms lim μ_n. Under F₂[ε]/ε²→F₂ the parameter ε becomes 0 but z₂ survives with z₂²=0. Roots of 2 over Q still yield an fpqc object without fppf trivialization. | No counterexample in this instance |
| 3.385 Infinite affine coinvariants (line 11158) | C_Z(0): b=2 is coinvariant with unique coefficient 2. b=u₁ has nonzero [1/2] coefficient u₁, so δb≠1⊗b. After Z→F₂, coefficient 2 becomes 0 while u₁ remains nonzero; no geometric-point test detects its weight. | No counterexample in this instance |
| 3.392 The genuine infinite affine quotient equivalence (line 11272) | n=1 component is the original pair; the coherent zero-section object has automorphisms lim μ_n. Under F₂[ε]/ε²→F₂ the parameter ε becomes 0 but z₂ survives with z₂²=0. Roots of 2 over Q still yield an fpqc object without fppf trivialization. | No counterexample in this instance |
| 3.403 The DVR zero-section gerbe and the full fibre (line 11463) | DVR parameter π: finite chart z²=π reduces to z²=0 with z≠0. π′=uπ gives normal frame π′⁻¹=u⁻¹π⁻¹. Full coherent fibre retains z₂≠0; all-zero-section locus discards it. | No counterexample in this instance |
| 3.418 Base change for infinite root stacks (line 11686) | n=1 component is the original pair; the coherent zero-section object has automorphisms lim μ_n. Under F₂[ε]/ε²→F₂ the parameter ε becomes 0 but z₂ survives with z₂²=0. Roots of 2 over Q still yield an fpqc object without fppf trivialization. | No counterexample in this instance |
| 3.421 The infinite DVR zero-section gerbe (line 11730) | Characteristic p: Hom(μ_p,D(Q/Z))=0, whereas projection D(Q/Z)→μ_p is fpqc onto. In k[Q/Z], (e_[1/p]−1)^p=0 and e_[1/p]−1≠0. S02. | S02: quotient, not subgroup |
| 3.422 Kummer classes of infinite-gerbe points (line 11752) | K₁(k)=1; in Q, [2]₂≠1 and [4]₂=1. Transition [2]₄↦[2]₂≠1, not [4]₂. In F_p(t), [t]_p≠1 despite μ_p(k)={1}; over R compatible families number 2. | No counterexample in this instance |
| 4.2 Square-action presentation of the root Picard stack (line 11814) | F₅,one branch,u=2: square action changes γ=1 to 4 and α=1 to 2; γ⁻¹α² changes 1 to 4⁻¹·4=1. | No counterexample in this instance |
| 4.7 Root degree components in every integer degree (line 11936) | P¹ with L=O(−1) admits roots on a finite branch fibre although H⁰(L)=0; component degree −1 is retained. Tensor with O(1) lands in degree 0. | No counterexample in this instance |
| 4.12 Full and relative inertia, including root sections (line 12037) | Two split branches,α=(1,0): full scalars force c=1 and first sign 1, leaving second sign ±1; relative inertia has order 2. R empty retains all Picard scalars. | No counterexample in this instance |
| 5.2 The evaluation smoothness criterion (line 12093) | Z=A¹,sections z,z: differential at 0 has rank 1<2 and intersection codimension 1<2. Section z² has derivative 0; unit section has invertible frame derivative. | No counterexample in this instance |
| 5.8 The ordered root-divisor morphism (line 12200) | d=0,1 ordered map is identity. d=2 away from collisions it has two orderings; double branch point has relative kernel diag μ₂, so it is not a finite representable map. | No counterexample in this instance |
| 5.13 The relative effective open and nilpotent sections (line 12338) | On k[ε]/ε²,a=ε: every geometric fibre has a=0, so effective-open membership false. a=1 remains effective under any base change. | No counterexample in this instance |
| 5.18 Fixed-root-section fibres of Abel–Jacobi (line 12438) | P¹,L=O,two branches: α=(0,1) gives no solution a; α=(1,1) gives a=1. R empty gives H⁰(L) minus zero, rather than its projectivization. | No counterexample in this instance |
| 5.23 Geometric two-fibres of ordered divisors (line 12538) | Double branch point: full ring k[s,t]/(s²+t²,st) has basis 1,s,t,s², dimension 4; reduction is k and relative reduced fibre Bμ₂. Distinct unramified points give two discrete orderings. | No counterexample in this instance |
| 6.1 Modified local units at ramified places (line 12566) | Local residue F₅: pairs (u,v) obey ubar=v². v=2 gives residue 4; v=−1 over u=1 is nontrivial kernel label. Empty modified family gives unit 1. | No counterexample in this instance |
| 6.7 Idele gluing with the sign fixed by local lattices (line 12727) | π⁻¹ gives valuation −1 and line O(x) of degree +1; degree-two place gives −2 and +2. Supplier positive convention uses b=a⁻¹=π and gives the same O(x). | No counterexample in this instance |
| 6.11 The stabilizer extension in the double quotient (line 12800) | F₅,one branch: (c,v)=(4,2) has order 4, since square=(1,4)≠1. Stabilizer is C₄, not C₂×C₂. R empty gives F₅×. | No counterexample in this instance |
| 6.12 The valuation divisor and Picard degree have opposite signs (line 12817) | a=π_x⁻¹: deg E(a)=−deg x, deg O(−E(a))=+deg x. Product with inverse gives degrees 0 and the unit line. | No counterexample in this instance |
| 7.2 Rational averaging: invariants are exact and commute with linear functors (line 12881) | S₂ swapping Q²: e(x,y)=((x+y)/2,(x+y)/2), e²=e. F₂[C₂] augmentation kills invariant 1+g, so invariant surjectivity fails. For S₃ over Q, regular invariants have dimension 1 and average denominator 6. | No counterexample in this instance |
| 7.7 Rational DM perverse descent and proper quasi-finite comparison (line 12973) | Bμ₂ constant/sign perverse ranks 1/0 after coarse pushforward. For t↦t², pushforward constant line has stalk ranks 2 off 0 and 1 at 0; shift by 1 gives perversity on both sides. | No counterexample in this instance |
| 7.13 Koszul-signed invariants are the exterior power (line 13130) | Q,rank V=2,d=2: signed invariant line spanned by e₁⊗e₂−e₂⊗e₁, inverse π/2. Rank 1,d=2 gives 0. F₂ rank 1 gives invariant dimension 1 but wedge dimension 0, excluded by 2! hypothesis. | No counterexample in this instance |
| 7.20 Comparison with the symmetric pushforward description (line 13264) | Double collision: full fibre length 4, reduced relative gerbe Bμ₂; its diagonal kernel acts by +1, so rational invariant stalk rank 1. Equality of full fibre with Bμ₂ is not used. | No counterexample in this instance |
| 7.24 Vanishing outside degree one for a nontrivial input (line 13331) | Geometrically nontrivial line: H⁰=0 and duality gives H²=0. An arithmetic-only nontrivial ζ₃ twist is geometrically trivial and retains one-dimensional H⁰,H². | No counterexample in this instance |
| 7.27 Exterior-power cohomology (line 13384) | dim H¹=2: exterior dimensions for d=0,1,2,3 are 1,2,1,0, all concentrated in degree d. Rank 0 gives degree-zero E and zero positive exterior powers. | No counterexample in this instance |
| 8.2 High-degree descent with empty ramification (line 13468) | g=d=1,R empty: fixed-object fibre H⁰(L) minus 0=G_m; scalar quotient P⁰. These are not equal. S03. | S03: replace proof |
| 8.5 The family Abel–Jacobi fibre chart (line 13532) | g=1,R empty,d=1: vector rank 1 and fibre G_m, quotient P⁰. With ρ=1,d=2: ranks (a,n,ρ)=(1,2,1), effective open excludes only simultaneous geometric zeros. | No counterexample in this instance |
| 8.7 Nontrivial intermediate weighted covers ramify (line 13585) | Weights (2,1): chart coordinate x↦x² has derivative 2x and ramifies at x=0. Nontrivial square subextension cannot be an everywhere étale cover. | No counterexample in this instance |
| 8.10 The proper scalar quotient of a family chart (line 13633) | ρ=0,rank E=1: proper quotient P(E)=point; frame fibre G_m. ρ=1,a=1: weights (2,1); α=0 has μ₂ stabilizer, whereas α≠0 has trivial scalar stabilizer. | No counterexample in this instance |
| 8.12 Effective high-degree Abel–Jacobi descent (line 13706) | Two splittings differing by t: u↦u−tα² fixes the actual section and identifies the descended line. Three changes t₁,t₂ give t₁+t₂ on both routes. | No counterexample in this instance |
| 9.1 Effective auxiliary divisors away from R (line 13750) | Auxiliary closed point of degree 2,d=−5,B=3: 4P has degree 8 and d+8=3 passes; 3P gives 1<3 and fails. No rational degree-one point is needed. | No counterexample in this instance |
| 9.5 The character local system in every Picard degree (line 13826) | d=−5,D of degree 8 reaches degree 3; continuation cancels tensor line L_D. Choosing further E multiplies then cancels its trace c, giving a on both routes. | No counterexample in this instance |
| 9.7 Signed divisor tensor line (line 13890) | Signed divisor −x: line dual and trace a⁻¹. With a=ζ₃, value ζ₃² differs from a. D=x−x has tensor line E and trace 1. | No counterexample in this instance |
| 9.8 Canonical independence of the auxiliary divisor (line 13923) | Auxiliary D,E compared through D+E: (a b)c divided by bc=a, in either order; zero auxiliary divisor gives identity comparison. | No counterexample in this instance |
| 9.12 Universal property of normalized character presentations (line 13987) | A normalized multiplicative comparison at the unit must send 1 to 1; rescaling all fibre comparisons by c violates multiplication c=c² unless c=1. Rank-one zero map is excluded by isomorphism. | No counterexample in this instance |
| 9.16 Commutativity and the normalized unit laws (line 14064) | Rank-one ordinary tensor symmetry sends a⊗b to b⊗a with scalar +1; unit maps multiply by 1. No sign depending on Picard degree occurs. | No counterexample in this instance |
| 10.9 Ramified determinant and residue square (line 14278) | Multiplication matrix for c+dt is [[c,ad],[d,c]], determinant c²−ad². At a=0,c=2 in F₅ norm 4, not 2; t has norm −a. | No counterexample in this instance |
| 10.15 Étale-local surjectivity of the root norm on units (line 14388) | Étale locally a square root of a nonzero unit exists in odd characteristic; global surjectivity fails: on P¹/F₅ with two rational branch points, target root-unit group has 8 elements, image has 4. | No counterexample in this instance |
| 10.19 Local Hilbert 90 with root normalization (line 14476) | Ramified unit u=−1 has norm 1 but branch value −1, so it is not in the root-normalized kernel. For normalized u with residue 1, w=1+u has residue 2, a unit, and w/σw=u. | No counterexample in this instance |
| 10.20 Quadratic geometric class field comparison (line 14492) | At a split unramified point both trace and Artin sign are +1; at an inert point both are −1. Product and inverse divisors give multiplication and reciprocal signs. | No counterexample in this instance |
| 10.24 The quadratic trace character on the root quotient (line 14557) | Idele π_x⁻¹ corresponds to O(x); split/inert values +1/−1 equal trace. Modified root-unit residues are squares and contribute +1. | No counterexample in this instance |
| 10.27 Connecting maps for the two norm sequences (line 14620) | P¹/F₅, two branches: C(k) has 8 elements; image of upstream units has 4. Element (1,1,−1) has no lift, so δ is nonzero of order 2; quotient by image has order 2. | No counterexample in this instance |
| 10.29 Invariant lines and descent data (line 14668) | Double P¹ cover: O(1) is σ-invariant but cannot be pulled back because all pullback degrees are even. Invariance alone is weaker than coherent descent data. | No counterexample in this instance |
| Layer 8, unnumbered scheme projective-space input (line 13440) | P⁰: connected finite étale algebra is K, degree 1; K×K has degree 2 and two components. P¹: 2g−2=−2m gives g=1−m, ruling out m=2 by g=−1. Map P¹→P¹,t↦t² pulls back hyperplane point 1 to two points, so image-dimension≥2 in the general hyperplane contract matters. | No counterexample with stated hypotheses |

## Verified sound

Read counts: **6 Lean declarations, 816 numbered README targets plus the unnumbered Layer 8 projective-space target, all 14,777 README lines and all 102 Lean lines, all 15 prior findings and their repair report**. This shortened report retains 64 sampled README rows and the separate six-row Lean context table. **205 labelled Checks blocks** were examined in the original review; representative ring, nilpotent, frame, group, degree and fibre computations remain above. S04, S05 and S08 identify Check failures; “no counterexample in this instance” does not certify a proof or every possible example.

The headline inventory is: sharp affine injectivity/surjectivity (§§1.190–1.201), finite invariants (§2.3), relative regular root geometry and its DM locus (§§2.17–2.18), coherent infinite roots and the fpqc quotient (§§3.14, 3.377, 3.392), infinite invariants and base change (§§3.385–3.418), the infinite DVR zero-section gerbe and Kummer classification (§§3.421–3.422), the non-fppf Kummer torsor (§3.138), root Picard and signed adelic equivalences (§§4.2, 6.3, 6.7–6.10), rational DM perverse comparison (§7.7), symmetric lisse descent and exterior cohomology (§§7.11, 7.26–7.27), high-degree descent (§8.13), all-degree normalized character sheaves (§§9.5, 9.11–9.18), ramified norms and their based obstruction sequences (§§10.12, 10.23–10.29), and quadratic trace/reciprocity (§§10.20, 10.24). The three finite affine headlines are stated in Lean. Its module docstring names the remaining families and the missing carriers. No sorry'd data, arbitrary Prop stand-in, conclusion-as-hypothesis, set_option, computational algorithm or admitted example occurs in Suggested.lean.

The finite affine calculation was checked independently of the admitted proofs: Θ is a weighted coordinate permutation, with n(n−1)/2 weights f and all other weights 1. This proves the two sharp criteria and the character-basis argument proves the invariant theorem even for nonreduced coefficient rings and wild exponents. The calculations never divide by n. The zero-ring branch and the total n=0 definitions were checked separately. The rational averaging computations use invertibility of the group order; they do not assert exact integral invariants. The sign and degree checks use π_x⁻¹↦O(x), weighted residue degrees, geometric Frobenius, and the odd-cohomological-degree Koszul sign.

Pinned-library search: **368 identifier candidates**, with declaration-basename hits for 349; the additional root-qualified `RingEquiv.toCommRingCatIso` was found in Mathlib/Algebra/Category/Ring/Basic.lean:680. The remaining 18 are the six local declarations, seven supplier-owned names, and the five stale DWP names of S07. Basename hits were treated as search leads, not as proof of a full qualified type. Directly read checks include AdjoinRoot's quotient lift, finite-presentation instance, monic power basis and coefficient injectivity; RootsOfUnityGroup's scheme and point comparisons; the exterior projection, factorial composites, naturality and range theorems; tensor reindexing; finite-group corestriction; and the directed-limit and Jacobson residue-field inputs. In particular, TauCeti/LinearAlgebra/ExteriorPower/Basic.lean:141,159,169,197 supplies the imported algebraic identities, and its injectivity theorem retains the unit-factorial hypothesis.

Cross-roadmap checks covered **12 supplier families**: SchemeAndStackFoundations (main, §§0.9, 1.1, 1.15, 1.18–1.23, 2.3, 2.11, 3.3–3.7, 4.13); AlgebraicVectorBundles (main, L0A–L0C); ModularCurves (main, §0F); AlgebraicCurves (main, Layer 12); JacobianChallenge (main, A–D); FunctionFieldArithmetic (the supplied open head, §§0.1, 2.1, 4.1–4.2, 4.5–4.10); EtaleCohomologyFoundations (main, F.0.2, F.0.A1–A2, F.2.1, F.2.6–F.2.7, F.3a, F.4.1–F.4.6, 0.11, F.5–F.6, F.8); AlgebraicModuliForArithmeticGeometry (§§4.3–4.4, 4.23); InverseGaloisAndArithmeticFundamentalGroups (§IG.5.7); DeligneWeightsAndPurity (§8.24); ProfiniteCohomology (main, Layer 10); and RepresentationTheory/SchurWeyl (main, Layer 8). The last three open supplier contracts were resolved through the roadmap service; their mathematical domains were read rather than inferred from the old review. S07 records the declaration-name drift. FunctionFieldArithmetic's positive-divisor convention and inverse local rigidification were compared with its supplied head at README:1500–1534; the inversion a↦b=a⁻¹ gives the stated O(x) witness.

Ownership searches used the roadmap service and board-package grep by object (root stacks, root Picard, infinite roots, signed tensor invariants, coefficient categories), as well as by fully qualified local namespace. No second occurrence of `TauCetiRoadmap.FunctionFieldArithmeticPartII` was found in another readable Suggested.lean. SchemeAndStackFoundations:2951–2987 owns finite root stacks, quotient charts and full branch fibres; this package consumes them. AlgebraicVectorBundles owns the generic tensor/pullback structures. The package's additions are the root-specific coordinate and infinite-limit comparisons and the ramified root-Picard/character constructions. General Artin-stack operations in GlobalShtukasAndFunctionFieldLanglands are later work, not a supplier used to bypass the local rational DM construction. AlgebraicModuliForArithmeticGeometry's prose still describes section-root stacks as belonging here, but the present package correctly resolves the actual finite carrier to the earlier SchemeAndStackFoundations owner; it does not create a second one.

All **eight declared gaps** have identical slugs and needs in the plan and the supplier-specific README contracts. Each has a named supplier and a specific mathematical comparison or theorem. The main SchemeAndStackFoundations finite-group quotient theorem does not already cover nonreduced diagonalizable groups; its point/topology/DM targets do not already provide the finite-discrete residual-gerbe decomposition. The remaining gaps concern the stated coordinate, completed-lattice, local character, universe-lift and hyperplane interfaces. Their absence from a supplier today is not reported as a defect. Acceptance remains conditional on these contracts.

Dependency checker output, rerun after the direct supplier checks:

```text
moved: FunctionFieldArithmeticPartII moved in the merge order from #16 to #169, right after its last supplier FunctionFieldArithmetic (AlgebraicModuliForArithmeticGeometry, InverseGaloisAndArithmeticFundamentalGroups, DeligneWeightsAndPurity also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 186 roadmaps, 1220 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The permitted move is not a finding. The internal §3.180→§3.227 edge in S01 is a different check.

The read-only diff stat contains ten changed files, all inside packages/FunctionFieldArithmeticPartII. No package file was edited during this review; only this report and scratch notes were written. No build, git mutation or external posting was performed. The remaining process/template strings identified in round one are absent from the README and Lean file.

**Source locator count: 99 distinct anchors read**, in 35 source-key entries (some keys share one Stacks extraction). Locating a passage is distinct from accepting its correctness: the source issues below record the latter exceptions. The anchors are:

- AGV08 line 2404, line 2431.
- TV17 line 605, line 631, line 650, line 668, line 707, line 714, line 733, line 738, line 778.
- STACKS-KUMMER line 1442, line 1505.
- FramedRoot-codex-rtOQ9t line 7989, line 8013.
- NormalizationThree-codex-rtOQ9t line 1383, line 1387, line 1410.
- FramedFppfCover-codex-rtOQ9t line 837.
- STACKIFICATION line 825.
- AOV08 line 454, line 906, line 910, line 924.
- AffineRootPointGroupoid-rtOQ9t line 966.
- Stacks-finite-root-projections-codex-7e92bd line 46, line 51.
- YZ19 line 5656, line 5736, line 6918, line 6968, line 6995, line 7015, line 7095, line 7142, line 7184, line 7235, line 7248, line 7320, line 7340, line 7368, line 7410, line 7450, line 7507, line 7570, line 7644, line 7677, line 7758, line 7806, line 7850, line 7880, line 7896.
- StacksPic line 753.
- StacksRes line 729.
- STACKS-DIV line 207.
- STACKS-PROP line 3754.
- STACKS-QF line 2140.
- STACKS-RES line 1772.
- ETINGOF line 1493.
- AV99 line 189, line 213.
- NOOHI line 288, line 700.
- CONRAD-EXT line 497, line 548.
- MILNE-CFT line 3357, line 3368.
- StacksVanishing line 2454.
- StacksBaseChange line 2815.
- SGA1 line 8303, line 8308, line 8606.
- ACV01 line 1594, line 1615.
- StacksLisse line 4675.
- MILNE-LEC line 2602, line 2631, line 2682, line 3058, line 3104.
- STACKS-NORMS line 1513, line 1536, line 1553, line 1591.
- STACKS-FLAT-COLIMIT line 4437, line 11925, line 21359.
- STACKS-AFFINE-DESCENT line 807, line 1011, line 4181.
- STACKS-DESCENT-PROPERTIES line 2626.
- STACKS-STACK-REGULARITY line 625, line 651, line 664.
- LO-P line 169, line 287, line 327, line 354.
- STACKS-KAROUBIAN line 259.

## Not verifiable

- B24, pp.133 and 135–136, is settled **uncertified**. Its text was not re-requested; the Kummer and origin-change calculations were checked directly, but the published wording and page-specific argument are not certified here.
- No fresh Lean elaboration was run because the task is read-only and expressly prohibits Lean builds. The supplied six-declaration signature receipt was used; this report does not claim a newly executed #check or build.
- Pinned identifier search does not by itself certify every implicit instance of every prospective README API. The six actual Lean signatures and the directly consumed library statements listed above were checked; the 816 future theorem implementations do not exist to inspect.
- Open-work ownership was searched through the provided checkout/service corpus. It cannot certify unpublished work or revisions after that corpus snapshot. A stale reference elsewhere is not evidence that its named declaration exists in the owner; S07 is based on reading the owner itself.
- The source's notation n∈N in STACKS-KUMMER line 1442 was not used to infer an exponent-zero theorem. The roadmap correctly requires positive geometric exponents. No source erratum is asserted solely from an unverified convention for N.

## Source issues

- **Misprint** in AGV08 at Appendix B.2, printed p.53 (AGV08 line 2439): the source says the section compatibility uses an exponent m; it should be the fixed root exponent d; affects a stated result.
- **Error** in AGV08 at Appendix B.2, printed p.54 (AGV08 line 2473): the source says the finite root chart times G_m is the smooth frame chart; it should be the antidiagonal μ_d contracted product; affects a stated result.
- **Misprint** in YZ19 at Definition A.2, printed p.515 (YZ19 line 7006): the source says a_R is obtained by restricting a_R; it should be obtained by restricting the global section a; affects nothing.
- **Error** in YZ19 at §A.1.3, printed pp.515–516 (YZ19 line 7028): the source says each zero-section fibre factor is Bμ₂; it should be [Spec K[t]/t² /μ₂], with Bμ₂ only its reduction; affects a stated result.
- **Error** in YZ19 at §A.1.6, printed pp.517–518 (YZ19 line 7239): the source says the local root object is a fibre-product ring along squaring; it should be the fibre product of multiplicative unit groups, since squaring is not additive; affects a stated result.
- **Misprint** in YZ19 at Lemma A.5, printed p.518 (YZ19 line 7281): the source says the idele coordinate is the local coframe composed with the inverse generic coframe; it should be the reciprocal ratio for its stated π_x⁻¹↦O(x) convention; affects the proof.
- **Error** in YZ19 at §A.2.1, printed p.519 (YZ19 line 7347): the source says the unshifted symmetric pushforward is perverse; it should be shifted by d to be perverse; affects a stated result.
- **Error** in YZ19 at §A.2.1, printed p.519 (YZ19 line 7358): the source says the ordered root-divisor map is finite; it should be proper and quasi-finite with finite relative inertia, and can be nonrepresentable at collisions; affects the proof.
- **Error** in YZ19 at Lemma A.7, printed pp.519–520 (YZ19 line 7435): the source says the full collision preimage is the product of residual gerbes; it should identify the reductions and use nilpotent invariance for the cohomology calculation; affects the proof.
- **Error** in YZ19 at Lemma A.8, printed p.520 (YZ19 line 7491): the source says arbitrary rank-one monodromy takes values in {±1}; it should take values in the coefficient field's units; affects the proof.
- **Misprint** in YZ19 at Lemma A.9, printed p.521 (YZ19 line 7551): the source says a basis of the evaluation quotient extends directly to the section space; it should choose lifts through an evaluation splitting, then a basis of the kernel; affects the proof.
- **Gap** in YZ19 at Lemma A.10, printed p.522 (YZ19 line 7653): the source says choose a divisor of sufficiently large degree before using effective translation; it should choose an effective divisor supported away from R; affects the proof.
- **Misprint** in YZ19 at Proposition A.11, printed p.523 (YZ19 line 7732): the source says pull the multiplication comparison back along the degree-sum Abel–Jacobi map; it should use the product of the two Abel–Jacobi maps; affects the proof.
- **Misprint** in YZ19 at Proposition A.11, printed p.523 (YZ19 line 7744): the source says translation on Picard components pulls back L with no Picard superscript; it should pull back the Picard character line L^Pic; affects the proof.
- **Gap** in YZ19 at §A.3.3, displayed sequence (A.11), printed p.525 (YZ19 line 7870): the source says taking Picard stacks gives the displayed exact sequence; it should specify based torsor fibres, coherent nullhomotopies and the connecting obstructions; affects the proof.
- **Misprint** in LO-P at §3, printed p.5 (LO-P line 159): the source says D≤0 has vanishing perverse cohomology for j≤0 and D≥0 for j≥0; it should require j>0 and j<0 respectively; affects a stated result.
- **Error** in LO-P at Lemma 6.1, printed pp.9–10 (LO-P line 292): the source says restriction and vanishing degree-zero i* characterize intermediate extension; it should also require vanishing degree-zero i!, excluding boundary subobjects as well as quotients; affects a stated result.

For the last error, j!E[1] for j:G_m→A¹ is perverse and has i*=0 but differs from j!*E[1]=E_A¹[1]. The roadmap's §7.7 correctly requires both no-boundary conditions. For AGV08's product error, d=2 over C with section 1 gives two components on the product and one on the frame chart. For YZ19's norm-sequence gap, the invariant degree-one line on the double projective line is not a pullback because pullback degrees are even. These source issues do not imply that the corresponding corrected package statements are false.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "d06bd723cf011f1ba45bfd39b9844f3762b2041f", "job": "RT-FunctionFieldArithmeticPartII~2a", "model": "gpt-6-astra", "worker": "chris-4"} -->
