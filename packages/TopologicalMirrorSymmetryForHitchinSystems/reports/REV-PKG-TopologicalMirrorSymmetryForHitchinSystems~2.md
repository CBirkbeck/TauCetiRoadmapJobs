<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1562#issuecomment-6400395729 -->
Review (codex) of 21fdf6f

Verdict: needs_changes

1. **F01** (P2) The cyclic-inertia cardinalities need a specified residue-field base

   **Location:** `packages/TopologicalMirrorSymmetryForHitchinSystems/README.md:135`: “For a cyclic tame inertia group I of order e in the constant split setting, the Kummer calculation has |H²(BI,μe)|=e² and |Pic(BI)/e|=e, hence |Br(BI)[e]|=e.”

   **Claim:** Constancy, splitting and tameness suffice for these three cardinalities. The sentence names no base for BI. The preceding local-field sentence does not supply a finite-residue-field hypothesis, and the roadmap also uses complex and geometric bases.

   **Witness:** For I=C₂ over ℂ, H²(BC₂,μ₂) has order 2, Pic(BC₂)/2 has order 2, and Br(BC₂)[2] has order 1. The displayed predictions are respectively 4, 2 and 2.

   The cyclic resolution has differentials g−1=0 and norm=2=0 on μ₂, so H²=μ₂. Line bundles are the two characters. On ℂ× the norm is squaring, which is surjective; H²(C₂,ℂ×)=0. The even-degree resolution is also present at the pin as `Rep.FiniteCyclicGroup.groupCohomologyIsoEven`, `Mathlib/RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean:80`. These computations do not depend on reading GWZ20. Interpreting BI over the local field itself does not fix the sentence either: for Q₅ and e=2, the degree-two μ₂ cohomology of G_Q₅×C₂ has dimensions 1+2+1=4 over F₂, hence order 16, and its Brauer 2-torsion has order 8.

   **Exact repair:** Specify BI over a finite residue field k=F_q, with e≥1 prime to char(k), I constant cyclic of order e, and μe⊂k, when asserting the cardinalities e²,e,e. For wider bases retain the Kummer exact sequence and the arithmetic Hochschild–Serre terms rather than assigning these cardinalities. Add the complex C₂ computation above as a negative-control Check and an explicit finite-field positive control. Do not restrict the roadmap's complex or local-field scope.

   **Repair test:** Over F₅ with e=2, the two degree-two contributions H²(C₂,μ₂) and H¹(F₅,Hom(C₂,μ₂)) each have order 2; the arithmetic H²(F₅,μ₂) term vanishes. Thus the corrected orders are 4,2,2. Over ℂ the arithmetic H¹ term vanishes too, giving 2,2,1; the repaired cardinality assertion excludes this instance while the general exact sequence handles it. At e=1 all three orders are 1. This is a missing-hypothesis finding, not a counterexample to the final SL/PGL comparison.

## Verified sound

### Previous findings, checked before the new pass

All seven findings in the preceding review are repaired. None was marked not actionable in the repair report; no settled finding is re-raised. Quotes below are from the repaired package. Its repaired statements and their downstream uses were read again, not accepted on the repair report's authority.

| Previous finding | Repaired passage and location | Independent repair check | Status |
|---|---|---|---|
| F01, overlapping unowned gap registry | README:55: “What HodgeStructures must provide (gap:geometric-compact-mhs)”; analogous named contracts at lines 57–111. | Parsed the plan: 13 unique operative slugs, all with supplier, section and needs; all 13 needs sentences match the README exactly. No historical G-* entry remains operative. Local obligations remain at §§2.2,3.9,4.4–4.5,5.4. | Repaired |
| F02, duplicate generic integration | README:69: “Consume §§2.5, 2.7–2.9 and 2.12”; “§2.11 supplies dual-abelian prime-to-p isogeny volume invariance.” | Read Logic at supplied board head 888e10d. Dual volume is §2.11 and Fubini §2.12 there. Over Q₃ and F₃((t)), vol(O)=1, vol(πO)=1/3 and the square-gauge density is 1/3. The removed integration gap has no surviving reference. | Repaired, including justified numbering difference |
| F03, duplicate inertia/transgression | README:93: “§4.5, `quotientGerbeTransgression` and `quotientInertiaComponents`, for coherent centralizer descent”; README:63 begins “Extend AlgebraicModuliForArithmeticGeometry §4.5”. | Read the existing two supplier targets. Trivial S₃ action gives 3 conjugacy sectors, not 6; identity transgression gives the trivial local system even on a nonneutral root gerbe. The residual gap imports these constructions and asks for their age/integration/arithmetic extensions. | Repaired |
| F04, omitted genus-zero trivial twist | README:788: “prove emptiness for both D=ω and deg D=0”; “let B be the full block of summands of maximal degree”. | P¹,D=O,n=2,d=1: H⁰(O(1−2a))=0 for a≥1, and a>1/2. The rank-three repeated-maximum example gives a rank-two invariant block of slope 1>2/3. Rank one remains SL=PGL=point and GL=A¹. Downstream §§4.1–4.3,5.1,5.3,5.6 and worked examples include the branch. | Repaired |
| F05, compact-support locator | README:109: “§§F.2.1, F.2.4–F.2.7”; “§§F.4.2–F.4.6 for bounded finite-dimensional rational realization and continuous Galois actions.” | Read construction, finiteness and rational realization separately. F.2.5 explicitly has no finiteness assertion. For A¹/F₃ compact cohomology has dimensions (0,0,1) and trace 3, unlike ordinary H⁰ trace 1. F.5–F.7 retain their actual duality/purity/blow-up roles. | Repaired |
| F06, compound splitting/Hartogs request | README:97: “Extend an invertible-sheaf trivialization uniquely across a complement of codimension at least two”; README:99: “Provide algebraic relative stacks of Gₘ- and μr-neutralizations”. | Separate matching slugs, and §1.2 uses splitting while §2.3 uses Hartogs. Neutral μ₂ over a point has automorphism orders 2 before and 1 after rigidification. On A² minus 0, 1 extends as 1; on G_m⊂A¹, t has value 0 at the omitted point and is not an invertible extension. | Repaired |
| F07, unspecified stronger cohomology | README:1011: “isomorphism of finite-dimensional continuous ungraded ℚ̄ℓ-representations”; README:1017: “There are no cohomological shifts in this ungraded target.” | The displayed formula specifies coefficients, centralizer invariants, age in the smooth total space, base points and nonsplit Frobenius descent. Q[0] and Q[−2] both become dimension 1, whereas Q[0]⊕Q[−1] has dimension 2, not 0. The docstring agrees. Actual comparison remains a separate geometric theorem, not an inference from virtual traces. | Repaired |

The splitting argument newly added at README:790 is valid: a quotient O(b) with b>a gives a rank-two preimage F with χ(F(−a−1))=b−a>0, hence a saturated line of degree at least a+1. This contradicts maximality. Once b≤a, H¹(O(a−b))=0 splits the extension. It works in arbitrary characteristic. The highest-degree *block*, rather than an arbitrary highest-degree line, is what the Higgs field preserves.

### Scope, principles and shape

Read the four package files, top-level gap registry, every one of the 44 numbered subsections, all Needs lines, conventions, supplier contracts, proof routes and worked examples. For unchanged mathematical text, the earlier review's computed rows were usable evidence; the seeded targets, changed passages and previously uncomputed background cardinality were checked afresh. R01 concerns that last background assertion, absent from the earlier computed table. No earlier prose-only assertion was treated as a completed mathematical check.

The package develops the relative general-D SL/PGL specialization, realizations and arithmetic mirror comparison on imported foundations. I found no wholesale re-planning, route-specific bypass, computational algorithm, copied source passage, upward supply or cycle requiring rejection. Its p>n, invertibility, root and degree conditions are explicit theorem hypotheses; they are not silently replaced by an unspecified sufficiently-large-prime range. Genus zero, genus one, rank one, equal characteristic and nonsplit Γ are retained in their stated domains.

The 14 construction/API blocks have respectively 6,6,7,6,7,6,5,5,6,10,5,7,5,5 Checks; all have at least three discriminating examples. The remaining 30 numbered subsections are theorem/comparison targets. Each of six layers ends with Examples and Dependencies. The main-branch JacobianChallenge, AlgebraicVectorBundles and completed HodgeStructures readers were opened for shape. The package has the requested summary, scope, conventions, contracts, layers, downstream uses and references. No policy or padding finding was found in Suggested.lean.

### Computed adversarial evidence

These rows are computations and negative controls, not proofs of every general target. They cover all 15 seeded targets, all 30 headlines, the repaired definitions and R01. Let E/F₃ be y²=x³−x. Its affine points are (0,0),(1,0),(2,0), and the point at infinity gives #E=4. Its Frobenius trace on H¹ is 0, so the trace of Fr² on H¹ is −6 and #E(F₉)=16. Write t=xy and let ζ be a primitive cube root.

| Statement | Instances and values computed on both sides | Result / change |
|---|---|---|
| Background at README:135 | C₂/ℂ: actual orders (H² μ₂, Pic/2, Br[2])=(2,2,1); written (4,2,2). C₂/F₅: (4,2,2). C₂/Q₅: (16,2,8). e=1: (1,1,1). | R01: state the finite residue base; keep the general exact sequence. |
| Conventions; 0.1 character realization | A¹/F₃ has H_c²=Qℓ(−1), trace 3 and E=t; positive Tate twist gives 1/3 and type (−1,−1). BC₂ has ordinary mass 1/2+1/2=1 and sign mass 1/2−1/2=0. Sign⊗sign has sign multiplicity 0, versus 1 in either factor. | Compact support, Tate sign, weighted torsors and additive-only character projection agree. |
| 0.2 fractional powers | At q=4, roots +2 and −2 evaluate ℒ^(1/2)−2 to 0 and −4. At q=64, s₆²=2²=4=s₃; ℒ⁻¹ evaluates to 1/64. | Root choice and nonzero localization retained. |
| 0.3 equivariant Katz | A¹ versus G_m⊔point: q=(q−1)+1 at every extension and t=(t−1)+1. Nontrivial χ on a trivial-action point gives 0=0. Blow up a point of P²: (1+2t+t²)−(1+t)=(1+t+t²)−1=t+t². | Counts, scissor relation and equivariant blow-up realization are consistent. |
| 0.4 finite Tate roots | ℓ=3,N=1 returns cyclotomic value 4. For N=2, principal-unit root −2 satisfies (−2)²=4. v₃(log 4)=1 but v₃(3 log u)≥2 for u∈1+3Z₃. | Finite denominator branch works; a Q₃-valued all-3-power-root system fails. |
| 0.5 fractional Katz | At q=9, ℒ^(1/2) gives eigenvalue 3 and type (1/2,1/2). ℒℒ⁻¹ gives 1 and type (0,0). Equal even/odd terms give V−V=0. | Fractional weights retain alternating signs. |
| 0.6 inertia | BC₂: 2 sectors of mass 1 gives 2. BS₃: class sizes 1,2,3 give 3 sectors, not 6. [A¹/C₂]/F₃: 3+√3 and E=t+t^(1/2). Two freely exchanged points give 1. | Conjugacy, centralizers and component-orbit conventions pass. |
| 0.7 transgression | Root O(1) on P¹/ℂ: μ₂ class 1 mod 2, Brauer image 0, identity transgression 1, E=1+t. Inverse-sector phases ζ and ζ⁻¹ differ. | Nonneutral band class does not make identity transgression nontrivial. |
| 0.8 stringy Katz | Free C₂-action on two points versus its point quotient gives counts 1=1 and E-polynomials 1=1. Age 1/2=3/6 gives the same √3. | Presentation and common-denominator checks pass. |
| 1.1 arithmetic gerbes | Constant real μ₂-gerbe: invariant 1/2 over R and 0 over C; arithmetic true, neutral false. Root O(1)/P¹_C: class 1 mod 2, arithmetic μ₂ false, Brauer image 0. Neutral pullback to k[ε]/ε² remains 0. | Arithmeticity and the two bands are distinguished. |
| 1.2 splitting stack | Neutral μ₂ at a point: automorphism order 2 becomes 1 after rigidification. On E_C the rigidified splitting sheaf E[2] has 4 points. Over R, t²=1 has 2 rational points and t²=−1 has 0, while both associated line classes are trivial. | Full groupoid and sheaf rigidification are retained. |
| 1.3 principal splitting | Neutral E: finite splittings have 4 points at r=2, principal torsor E∨ has dimension 1. For U=V=Spec R, Pic=0 and Split′ is a point even for constant invariant 1/2. | Contracted product is not the finite torsor or a neutrality certificate. |
| 1.4 constant Brauer theorem | Hamilton class 1/2 pulls back to 0 on a pointless real conic. On a variety with a real point, evaluating the pulled-back constant class returns 1/2. | Middle exactness suffices; injectivity needs the stated rational-point hypothesis. |
| 1.5 unitary comparison | Hom(Z²,U(1))=(S¹)² has real dimension 2, as does E∨; its μ₂ subgroup has 4 elements. | Principal analytic comparison differs from finite splittings. |
| 2.1 abstract systems | E×A¹ has relative dimension 1 and empty boundary; identity system has relative dimension 0. Blowup of a smooth surface point leaves an exceptional boundary of codimension 1<2. | Structural bound excludes the wrong torsor-locus certificate. |
| 2.2 dual systems | Identity elliptic pair: kernel degree 1, torsor classes 0, phases 1. In characteristic 3, [3] has degree 9 and zero differential. Root of a non-2-divisible degree-zero line can have nonzero Pic/2 but Brauer image 0. | Étaleness and stronger μr-neutrality are not silently inferred. |
| 2.3 gauge forms | E×A¹: dt∧θ; elliptic volume 4/3 over Q₃ and F₃((t)). Unit scaling keeps 4/3; π scaling gives 4/9. Density of π²(dx)⊗² is 1/3. For a=xy, da∧(−dx/x)=dx∧dy; the other sign gives −dx∧dy. | Repaired integration supplier and determinant convention agree. |
| 2.3 Hartogs | 1 on A² minus 0 extends as 1; −1 as −1, codimension 2. On G_m⊂A¹, t(0)=0, codimension 1. Blowup chart x=u,y=uv gives dx∧dy=u du∧dv, order 1 along the exceptional divisor. | Extension of generators requires the stated bound. |
| 2.4 local integral | A¹/O at q=3: #/q=3/3=1=vol(O). E: 4/3=4/3. A phase ζ enters the conjugate integrand as ζ⁻¹. | Total dimension and conjugation pass. |
| 2.5 dual volumes | id on E: kernel/cokernel orders 1/1. [2] over either q=3 field: orders 4/4, and volumes 4/3=4/3. [3] over Q₃ scales the pulled-back elliptic differential by absolute value 1/3. | Prime-to-p hypothesis excludes the last failure. |
| 2.6 gerbe-character integrals | Both nonempty neutral fibres: 4/3=4/3. Both empty: 0=0. One empty: c(1+ζ+ζ²)/3=0 on the other, for any phase c; reversed case also 0=0. | All rational-point cases accounted for. |
| 2.7 arithmetic mirror | Neutral elliptic product at every base point: m=1 gives 1−0+3=4 on both sides; m=2 gives 1−(−6)+9=16 on both sides. Empty fibre gives 0. | All-powers trace statement and equal-characteristic route agree. |
| 2.8 complex mirror | Neutral E pair: 1−x−y+xy on each side. Point pair gives 1=1; empty pair gives 0=0. | Consistent with the stated realization contracts. |
| 3.1 moduli | n=1: trace forces θ=0, determinant fixes the line, automorphism order 1. Stable n=2 in odd characteristic: determinant-preserving scalars have order 2. (O⊕O,0) has invariant slope 0=0. | μn-rigidification and stability pass. |
| 3.2 smoothness | n=2,g=2,deg D=2: rank End₀=3, Euler characteristics −3 and +3, total −6, tangent dimension 6. n=1 gives 0. In char 2 at n=2, tr(id)=0. | Dimension and invertibility hypotheses pass. |
| 3.3 finite quotient | n=2,g=2: geometric Γ order 16, not 2. A fixed point gives BΓ. For y²=x³+x+3/F₁₇, evaluating all 17 x gives no cubic root, so rational E[2] has order 1 versus geometric order 4; 8 divides 16. | Root availability does not imply split Γ; residual inertia retained. |
| 3.4 properness | Rank-one GL on E/F₃,D=O: E×A¹→A¹ has proper fibres with 4 points; the total space has 12 points and is nonproper over the field. SL is point→point. | Relative properness is the claimed one. |
| 3.5 determinant twists | n=2,deg L=1,deg N=1: tensor changes determinant degree to 3=1+2; inverse returns 1. For E/F₃, J(k)/2J(k) has order 4, matching H¹(k,J[2]). | Lang/Kummer direction and degree congruence agree. |
| 3.6 norm fibres | n=2,deg D=2,deg L=1: deg M=−2; norm target degree 3; determinant degree 3−2=1. Wrong LM target gives −1−2=−3. n=1 gives M=O and one point. | Inverse-M sign passes. |
| 3.7 Prym quotient | n=2,g=2: spectral genus 5, norm-kernel dimension 3, quotient dimension 5−2=3, kernel order 16. E(F₃)/E[2](F₃) has 1 element, while (E/E[2])(F₃) has 4. | Quotient sheaf cannot be replaced by a rational-point quotient. |
| 3.8 Prym duality | Same regular pair: dimensions 3=3 and isogeny degree 16. n=1: dimensions 0=0 and pairing 1. With e₃(P,Q)=ζ, e₃(Q,P)=ζ⁻¹≠ζ. | Opposite pairing orientation matters; dimensions alone do not certify duality. |
| 3.9 low genus | P¹,D=O,n=2,d=1: forbidden entry h⁰(O(1−2a))=0 and a≥1>1/2, stable invariants 0=0. n=3, E=O(1)²⊕O: block slope 1>2/3. Noncoprime O²: block slope 0=0. | Added branch and full-block proof pass. |
| 3.9 elliptic boundary | g=1,D=O,n=2, distinct eigenvalues: spectral cover has 2 components and stable generic fibre has 0 objects; an invariant eigenbundle has slope ≥d/2. | The separate boundary calculation remains necessary; no false regular certificate. |
| 3.10 torsor powers | n=2,deg L=1,deg M=−2: e=0 label −2 gives norm degree 0; e=2 label 4 gives norm degree 6; e=−1 label −5 gives norm degree −3. In Z/3, 2·1≠0 but 3·1=0. | Integer powers, identity label and coprimality pass. |
| 4.1 GL counts | Rank-one E×A¹/F₃ has 4·3=12 points in every degree. P¹,D=O,n=1 gives 3; n>1 coprime gives 0. On Z/3-torsor classes, d=1,e=3 gives 1 versus 0 despite gcd(d,e)=1. | Correct rank-one and low-genus branches; gcd(e,n) is the relevant condition. |
| 4.2 SL counts | n=2,deg D=2: deg M=−2, deg Q=−1, deg N=2−2=0. e=3 yields determinant degree 3d; e=1 gives d. deg D=1 would require deg Q=−1/2. | Uniform sign correction and even-degree hypothesis pass. |
| 4.3 graded degree independence | Rank-one E×A¹: E=t(1−x−y+t), compact Betti dimensions (1,2,1) in degrees (2,3,4), ordinary dimensions (1,2,1) in (0,1,2), independent of degree. Empty P¹ rank>1 branches give 0 in every degree. | Purity plus duality is required beyond alternating E equality. |
| 4.4 powered gerbes | n=1: band order 1, class 0. n=2,g=2: Γ order 16, admissibility roots 32. n=3,d=1,e=2: a=2, powers 2 on SL and 1 on PGL. | Band, degree powers and coherent descent are not interchanged. |
| 4.5 splitting duality | n=1: point≅point under the trivial group. n=2,g=2: opposite regular Pryms have dimension 3; finite μ₂ splittings have rank 2⁶=64. | Principal splitting cannot be replaced by the finite torsor. Arithmetic descent remains its stated theorem obligation. |
| 4.6 local Brauer splitting | Integral evaluation lies in Br(O)=0, invariant 0, phase 1. A constant invariant 1/3 would give ζ≠1. Root O(1)/P¹ has μ₂ class 1 mod 2 but Brauer class 0. | Evaluation kills the constant Brauer class, not every Kummer obstruction. |
| 4.7 assembly | Identity elliptic pair has square id=id and gerbe classes 0=0. Point with nontrivial Γ has empty free locus and complement codimension 0<2. | Nonfree boundary is not certified by abstract-system assembly. |
| 5.1 main theorem | n=1 over F₂ and F₃: 1=1. P¹,D=O or ω,n>1 coprime: 0=0. n=2,g=2,q=3⁸: q−1=6560=32·205 and p=3>2. | Full stated genus range preserved. |
| 5.2 canonical Hodge | Eigenpair ζ,ζ⁻¹ gives age 1/3+2/3=1. Degree 2 and type (1,1) become stringy degree 4 and type (2,2); signs +1=+1. Single −1 gives age 1/2 and odd shift 1. | Canonical symplectic parity is essential. |
| 5.3 virtual fibres | I₂ and J₂^m have trace 2 for every m≥1 and K₀ class 2[1], but fixed dimensions 2 versus 1. Equal even/odd terms cancel to 0. | Virtual conclusion does not assert actual actions or degrees. |
| 5.4 actual ungraded fibres | Q[0] versus Q[−2]: dimensions 1=1 after forgetting degree, H⁰ dimensions 1≠0 before. Q[0]⊕Q[−1] versus 0: virtual traces 0=0 but underlying dimensions 2≠0. | Repaired target specifies the first identification and excludes inference from the second. |
| 5.4 descent | Two exchanged age-zero sector lines: Fr matrix ((0,1),(1,0)), trace 0 on odd and 2 on even powers; two fixed lines give 2 on all powers. Rank-one fibre gives 1=1, empty fibres 0=0. | Nonsplit descent is explicitly retained. |
| 5.5 sector variation | Pairing ζ and initial trace 1 give multiplier ζ⁻¹, not ζ. Over Q₃, (−3,−3)=(−3,−1)=−1 in the quadratic Hilbert symbol, invariant 1/2. | Only the mixed block is used; complementary-block isotropy is not assumed. |
| 5.6 isotypic mirror | C₃ Fourier sum gives (1+1+1)/3=1 on the selected character and (1+ζ+ζ²)/3=0 otherwise. Γ=(Z/2)⁴ gives normalization 1/16. On S₃, its two linear characters sum to 2 at a 3-cycle. | Inverse exponent and abelian hypothesis discriminate the wrong projection. |

Other domain checks: ranks and root denominators are positive, q≥2, and the characteristic-zero projectors have nonzero group-order denominators. Rank zero, zero rings and q=1 are not admitted geometric inputs. Empty sums/cohomology give zero. Nonreduced bases retain pulled-back neutralizations; tangent-age/gauge smoothness is not assigned to a singular spectral fibre. Multiplication by p in characteristic p is not treated as étale. The local abelian groups integrated in §§2.5–2.6 are compact. No natural subtraction is used for signed determinant degrees or negative torsor powers.

### Sources and seeded sample

All cited works have exactly one of the four manifest keys. The three legal cached extractions were read directly; no new source was necessary and sources.toml was not edited. GWZ20 remains settled as uncertified and was not requested again. All 15 seeded targets cite it; those published theorem/page/hypothesis checks cannot honestly be marked text-certified. The following is the exact sample inventory.

| Seeded target | Recorded locator | Verification outcome |
|---|---|---|
| 0.3 Equivariant Katz comparison | GWZ20 Theorem 2.15 and proof, pp.523–524 | Uncertified; equivariant reduction ingredients checked against Bittner and suppliers. |
| 0.5 Katz comparison with fractional twists | GWZ20 Theorem 2.18, pp.526–527 | Uncertified; Ito's additive rational-period framework read directly. |
| 1.1 Arithmetic gerbes | GWZ20 Definition 6.1, p.565 | Uncertified; arithmetic/band distinctions computed above. |
| 2.1 Abstract Hitchin systems | GWZ20 Definition 6.8, p.568; Remark 6.14, p.571; Definition 4.10 and Corollary 5.29, p.564 | Uncertified; codimension and free-locus controls computed. |
| 2.2 Dual Hitchin systems | GWZ20 Definition 6.9, Remark 6.10, pp.568–569; Theorem 6.17 proof, p.573 | Uncertified, including the proof-internal sufficiency claim. |
| 2.3 Compatible gauge forms | GWZ20 Lemma 6.13, Remark 6.14, pp.570–571 | Uncertified; normalization and repaired suppliers checked directly. |
| 2.7 Fibrewise arithmetic mirror symmetry | GWZ20 Theorem 6.12, pp.569–570; proof pp.574–575 | Uncertified; all-powers and equal-characteristic controls computed. |
| 3.2 Smoothness | GWZ20 Lemma 7.3 and proof, pp.576–577 | Uncertified; deformation Euler characteristic and excluded characteristic computed. |
| 3.3 PGL quotient | GWZ20 Definition 7.4, Remark 7.5, p.577 | Uncertified; actual quotient supplier and nonsplit example checked. |
| 3.8 Prym duality | GWZ20 Proposition 7.10 and proof, pp.580–582 | Uncertified; norm/pullback duality and pairing supplier read. |
| 4.3 Betti/Hodge independence | GWZ20 Corollary 7.17, p.586; HT03 §6, numbered pp.17–18 | GWZ20 uncertified. HT03 locators verified, with the narrower content explained below. |
| 4.6 Local Brauer splitting | GWZ20 Lemma 7.19 and proof, p.587 | Uncertified; constant-class evaluation and Kummer distinction computed. |
| 5.3 Virtual comparison | GWZ20 Theorem 6.12, p.569; Theorem 7.23 proof, p.589 | Uncertified; virtual character recognition checked separately. |
| 5.4 Actual isomorphism | GWZ20 Theorem 7.23, p.589 | Uncertified; the package now precisely identifies its own ungraded target. |
| 5.6 Isotypic comparison | GWZ20 Theorem 7.24, pp.590–593, equations (30)–(32) | Uncertified; Fourier convention checked at the pin. |

The same limitation applies to all other GWZ20 locators, including the author's unverified proof corrections in §§4.1–4.2. Their corrected determinant and torsor formulas were computed independently; I do not certify that the inaccessible source prints the alleged errors.

Accessible source checks:

- HT03 line 385, Proposition 3.2, numbered pp.10–11, and HT03 line 498, Proposition 3.6, numbered p.13, concern smooth unitary torsor isomorphisms over the complex regular Hitchin locus. HT03 lines 368–426 and 472–525 supply the finite splitting torsors, contracted products and universal-line arguments. They do not establish arithmetic-family descent; §§4.4–4.5 expressly retain that work. Nor does the source's existence of a torsor isomorphism by translation alone certify a unique canonical arithmetic map.
- HT03 line 647 starts numbered p.17; §6's heading is at line 648. Lemma 6.1 is at line 651, Theorem 6.2 at line 680, Lemma 6.3 at line 693, and Theorem 6.4 at line 709. The theorems compare Dolbeault/de Rham E-invariants. They do not themselves supply all coprime-degree, general-D or fixed-sector purity claims. The package obtains those from its count comparisons and explicit purity contract instead.
- ITO04 line 524, Lemma 4.3, numbered p.12: additive Hodge–Tate multiplicities require the middle representation to have full Hodge–Tate dimension. ITO04 line 555, Proposition 5.1, p.13: finite ramification and continuous number-field representations yield equality of semisimplifications from traces. ITO04 lines 573–668, Definitions 5.2–5.3 and §5.3, pp.13–15, retain weight/period conditions and construct finite-denominator Tate roots after finite extension. This is not a theorem of lisse sheaves on arbitrary scheme models. The roadmap separately owns that extension.
- BITTNER04 lines 799–810 distinguish the good-action scissor ring from its further representation quotient. Lemma 7.1 at BITTNER04 line 812, numbered p.18, gives smooth complete/projective equivariant blow-up presentations. Its proof at lines 830–844 uses equivariant compactification, resolution and weak factorization. The equivariant gap retains those inputs rather than silently invoking an ordinary presentation.

### Pinned libraries and acceptance-test coverage

The manifest pins and the actual checkout HEADs agree: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The designated local content snapshot read was `bbed953ce7f4abc20c898ee8cfdefff235ed9804`; the roadmap service identifies its indexed main snapshot separately as `7922565`. Cross-roadmap readers were resolved at the supplied indexed heads, and native declarations were checked locally at the pins, not by the resolver's host.

| Native declaration opened | Pinned file and line | Content and boundary checked |
|---|---|---|
| AddMonoidAlgebra | `Mathlib/Algebra/MonoidAlgebra/Defs.lean:64` | `coeff : M →₀ R`; finite-support exponent carrier, not geometric realization. |
| sum_hom_units_eq_zero | `Mathlib/RingTheory/IntegralDomain.lean:186` | Group, Fintype, commutative domain, nontrivial hom; C₂ sum 1−1=0. |
| Matrix.trace | `Mathlib/LinearAlgebra/Matrix/Trace.lean:43` | Sum of the diagonal; I₂ and J₂ give 2 without a semisimplicity claim. |
| Rep.FiniteCyclicGroup.groupCohomologyIsoEven | `Mathlib/RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean:80` | Positive even-degree cohomology computed from norm and g−1; used in R01's cyclic calculation. |
| TauCeti.Hodge.MixedHodgeStructure | `TauCeti/Geometry/Hodge/Mixed/Basic.lean:72` | Specified base-change models, bounded filtrations and pure graded pieces; no variety or compact-support realization field. |
| TauCeti.Hodge.tate_hodgeNumber | `TauCeti/Geometry/Hodge/Tate/Basic.lean:160` | Sole Tate index p=−m; m=1 gives −1. |
| TauCeti.AlgebraicGeometry.InvertibleSheaf | `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean:112` | Full subcategory of invertible modules; morphisms are module maps, not just isomorphisms. |
| TauCeti.AlgebraicGeometry.LineBundleClass; inv_mk | `TauCeti/AlgebraicGeometry/LineBundle/Class.lean:50`, :104, :142 | Skeleton classes, inverse induced by dual, and actual commutative group instance. |
| TauCeti.AlgebraicGeometry.AbelianVariety | `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` | Proper geometrically integral group object over a field; not relative spectral Prym duality. |
| TauCeti.AlgebraicGeometry.rigidifiedPicardFunctor | `TauCeti/AlgebraicGeometry/PicardFunctor/Rigidified.lean:66` | Explicit f,x₀ and x₀≫f=id; pointed relative classes, no representability in the definition. |
| TauCeti.AlgebraicGeometry.rigidifiedPicardPoint | `TauCeti/AlgebraicGeometry/PicardFunctor/Point.lean:40` | Trivial rigidified class, not a chosen point of every Picard torsor. |
| CommGroup.sum_inv_mul_monoidHom_apply_eq_ite | `TauCeti/GroupTheory/FiniteAbelian/CharacterOrthogonality.lean:182` | Finite commutative group, domain and enough roots; inverse on the tag and cardinality on the selected column. |

Object searches of both pinned trees covered Higgs/Hitchin/Prym geometry, gerbes, geometric compact cohomology, lisse Tate sheaves, étale fundamental groups and finite-character operations. No native geometric carrier was found that makes a missing headline statable by a few simple definitions. Generic schemes, sheaf cohomology, line classes and abstract Hodge filtrations do not themselves encode these statements.

The 30 headline theorems from the README, all explicitly named with missing carriers in Suggested.lean, are:

| Layer | Headline list |
|---|---|
| 0 | §0.3 equivariant Katz; §0.4 finite-denominator Tate roots; §0.5 fractional Katz; §0.8 stringy counts determine E-polynomials. |
| 1 | §1.4 principal splittings and constant Brauer classes; §1.5 unitary/arithmetic principal splittings. |
| 2 | §2.4 twisted counts as integrals; §2.5 equal regular-fibre volumes; §2.6 gerbe-character integrals; §2.7 arithmetic mirror; §2.8 complex mirror. |
| 3 | §3.2 smoothness; §3.4 Hitchin properness; §3.5 determinant twists; §3.6 norm-preimage fibres; §3.8 Prym duality; §3.9 regular/low-genus certificates; §3.10 torsor products, powers and periods. |
| 4 | §4.1 GL degree counts; §4.2 SL degree counts; §4.3 Betti/Hodge degree independence; §4.5 opposite splitting torsors; §4.6 local Brauer splitting; §4.7 dual-pair assembly. |
| 5 | §5.1 main SL/PGL comparison; §5.2 canonical Hodge numbers; §5.3 virtual fibre classes; §5.4 actual ungraded fibre representations; §5.5 determinant-sector variation; §5.6 isotypic mirror. |

The module docstring names the missing geometric compact Hodge/étale realizations, scheme-model lisse Tate sheaves, relative gerbe and Picard/Prym torsors, stable Higgs moduli, orbifold measures and inertia-fibre cohomology. No scalar stand-in is used. Suggested.lean has one `import Mathlib`, the required namespace, and zero theorem/definition/instance/opaque declarations. Consequently the declaration-wise elaborated-signature list and one-tactic probe have zero candidates; there is no dropped binder, sorry'd data or padding theorem to repair.

Ran the required `lake env lean <absolute Suggested.lean path>` from the designated content checkout: exit 0, no diagnostics and no warnings. There is no TauCeti import requiring a module build. The process completed; no Lean command was left running.

### Ownership, suppliers and order

Used the required roadmap grep/show tools against indexed main and open heads, read the board-package index before absence claims, and read the located supplier passages personally. One helper only located readers and excerpts; it made no mathematical assessment or verdict. Separate sibling checkout paths were not supplied. Ownership against the indexed open heads was checked; ownership against additional unavailable copies was not checked.

The ownership searches found the existing generic quotient inertia/transgression in AlgebraicModuli §4.5 and integration in the indexed Logic package; the repairs now consume them. MotivesAndAlgebraicCycles §4.20, `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:914`, owns the nonequivariant scissor ring and explicitly does not assert the characteristic-zero blow-up presentation. MotivicEtaleKTheory §3.2, `TauCetiRoadmap/MotivicEtaleKTheory/README.md:375`, owns smooth ordinary geometric MHS through logarithmic SNC complexes. Neither is the full good-finite-group presentation or arbitrary separated compact-support finite-monodromy interface requested here. Their narrower objects must remain imported when the respective supplier extension is implemented. No competing package target was found for the full SL/PGL principal-splitting and mirror comparison. No Lean fully qualified name is duplicated because this file declares none.

All cited suppliers were re-resolved. Repository-relative file names below identify the roadmap readers; open-head line numbers exclude the service's metadata header.

| Supplier and located sections | Evidence read and hypothesis boundary |
|---|---|
| `Completed/HodgeStructures/README.md:104`, :326, :378, :423 | Core, L2–L3, weight-one relation; abstract filtrations/strictness, not geometric compact cohomology or a relative unitary torsor. |
| `TauCetiRoadmap/AlgebraicVectorBundles/README.md:228`, :254 | L0B–L0C tensor, dual, exterior and determinant operations on the curve. |
| `TauCetiRoadmap/JacobianChallenge/README.md:111`, :135, :143, :218, :332 | Layers A–E: degrees, coherent curve cohomology, relative base change, Picard sheaf/obstruction, abelian varieties. H² on curves is 0; Picard-sheaf points need not be actual line bundles. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md:678`, :2502, :2589 | §0.6 scheme Hartogs, §§1.15–1.16 torsors and contracted products; local nonemptiness is part of torsor, and stack Hartogs remains an extension. |
| Same, :2843, :2951, :2989, :3021 | §§1.20–1.23 inertia, quotient stacks, stack modules, coarse/tame moduli. |
| Same, :3656, :3867, :4428 | §§2.11,2.15,2.22 Kummer, étale/Galois and Hochschild–Serre, Brauer/Azumaya; no base-free finite cardinality theorem of the form in R01. |
| Same, :4789, :4876, :4905, :4937, :5291 | §§3.4–3.7 Picard/norm/obstruction and §4.6 deformation of curves/lines. Norm uses det pushforward divided by det pushforward O. Smooth curve/line infinitesimal lifting uses H²=0; the relative-Higgs contract still needs its full algebraic family interface. |
| `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:578`, :993, :1025 | §§1.3,2.1–2.2 parameters; no automatic stable-Higgs properness from a Quot/Hilbert chart. |
| Same, :1745, :1816, :1935, :2342, :2358, :4394, :7331, :8602 | §§4.1–4.3,4.5,4.9,4.20,5.1: gerbes, bandings, neutralizations, coherent transgression, quotient inertia, Isom torsors, classification, rigidification. Constant-group inertia has no tameness restriction. |
| Same, :9172, :9489, :9721 | §§7.3,7.6.1,8.2: Picard group stack, rigidified classes and algebraization; stack automorphisms are not discarded before rigidification. |
| Same, :10128, :10154, :10202 | §§9.4–9.5,9.7: resolution/SNC comparison inputs; good finite-group equivariant presentation still requires the separate declared contract. |
| `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:766`, :878, :1023, :1065 | A1.3 invariant forms, A1.5 cube, A2.2 dual/Poincaré, A2.3 symmetric Mumford map. The README's A¹.3/A¹.5 typography refers to these A1 sections. |
| Same, :1384, :1412, :1451, :1475, :1569 | A3.2–A3.7 multiplication, finite-flat quotient, dual kernels, theta descent and alternating Weil pairing. Quotients are sheaves; n=p need not be étale. |
| `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:1236`, :1289, :1343, :1416, :1443, :1460, :1521 | §§3.6,3.8,3.10,3.12–3.14,3.16: finite-field Higgs/spectral/Picard, anisotropic properness, degree-dependent codimension, weak abelian fibrations and weighted trace. General relative stable fixed-determinant geometry is expressly an extension. |
| `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:5967`, :6017 | D7.6: characteristic-zero local gerbe-evaluation square and prime-to-p self-dual index. Equal characteristic remains the declared extension. |
| `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:1037`, :1084, :3101, :3128, :3147 | §§1.7–1.8 semisimplification/Brauer–Nesbitt, §§5.1,5.3 density/recognition; §5.2 is quadratic-symbol specialization. No actual nonsemisimple comparison is imported. |
| `TauCetiRoadmap/CohomologyComparisons/README.md:460` | §2.15 proper-smooth Hodge–Tate degeneration with (−b) twist; the number-field equivariant/fractional adapter remains a contract. |
| `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:2552`, :2618, :2678 | §§7.8,7.12 bounds and §7.15 proper-smooth purity. No pure ordinary-degree stalks at every singular Hitchin fibre follow automatically. |
| `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:3534`, :6562, :6758 | §§3.7,6.3–6.4 coefficient trace comparison, scheme proper/local trace and additivity; tame finite quotient stacks remain an extension. |
| `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:504`, :592, :613, :645, :759, :979, :999, :1021, :1041, :1089, :1179, :1200, :1239 | F.2.1,F.2.4–F.2.7,F.4.2–F.4.6,F.5–F.7 resolve construction, Künneth, realization, boundedness, actions, duality, purity and blowups separately. |
| `TauCetiRoadmap/ReductiveGroupsPartII/README.md:5201` | RG2.3.7 Lang requires smooth connected finite-type groups; applies to the Jacobian, not constant C₂. |
| `TauCetiRoadmap/ClassFieldTheory/README.md:920`, :1220, :1312 | Layers 5–7 local invariant and arithmetic reciprocity; the geometric cohomological Frobenius convention uses the inverse. |
| `packages/LogicAndDefinabilityInNumberTheory/README.md:421`, :455, :481, :495, :537, :547, head 888e10d | §§2.5,2.7–2.9,2.11–2.12: arbitrary local-field analytic substitution, measure, nullity, volume, dual volume and base-first Fubini. |
| `packages/CountingBundlesAndHallAlgebrasOfCurves/design/README.md:2055`, :2151, :2738 | CB.7/canonical-higgs, CB.7/higgs-moduli, CB.9/higgs-purity. Canonical GL stability/properness/purity do not themselves assert the general-D fixed-determinant sector theorem. |

The citation resolver emitted one lead: `559: LogicAndDefinabilityInNumberTheory §2.11: no roadmap LogicAndDefinabilityInNumberTheory on main or in an open pull request`. Reading the supplied board head resolves it: §2.11 is present at line 535, its theorem at line 537. This is a resolver coverage limitation, not supplier drift. Its external-Lean-name audit was unavailable on its host; the local pin audit above replaces it.

The 13 declared gaps are real contracts rather than unowned prerequisites: geometric-compact-mhs; unitary-splitting-families; generic-orbifold-transgression; equivariant-grothendieck; fractional-equivariant-hodge-tate; equal-characteristic-abelian-duality; relative-picard-norm-duality; relative-higgs-git-properness; smooth-stack-hartogs; relative-hitchin-picard; higgs-sector-purity; tame-stack-trace; relative-gerbe-splitting-representability. Their domains and consumers distinguish compact geometric realization from abstract Hodge data, arithmetic from complex splitting, and stack representability from Hartogs. The two previously duplicated requests now import their existing owners. The grouped coherence requirements describe the respective single interfaces; the unrelated splitting and extension requirements have been separated. Every operative slug appears in the plan and the exact supplier subsection. Pending implementation alone is not a finding.

The prescribed dependency command completed with this exact output:

```text
depcheck: 53 roadmaps, 601 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. No supplier, merge order, tooling, library or authored package file was modified by this review.

## Not verifiable

- GWZ20 is settled as uncertified. The 15 sampled published locators above, every other GWZ20 locator, and claims about its proof-internal corrections cannot be checked against the source text here. No renamed key, fetch or missing-reference request was made for it.
- The actual geometric theorem of §5.4, especially at singular fibres, is not proved by the matrix and grading controls. They certify that its new statement is precise and that the invalid virtual-to-actual inference is excluded; the geometric theorem remains a roadmap target. Its inaccessible primary proof is not certified.
- The general implementation of the 13 supplier contracts is pending. Located existing interfaces and small computations do not certify those extensions. In particular, the complex HT03 torsor arguments do not prove arithmetic-family descent, and its §6 does not prove the requested general-D or sector-purity adapter.
- The brief supplies an indexed open-head service and a board-package index, not separate filesystem paths for every named sibling. Those readable heads/main/board copies were searched; ownership against other unavailable sibling copies was not checked.

## Source issues

- **Error** in HT03 at Proposition 3.2 proof, numbered p.11, HT03 line 426: the source says exchanging Jacobian factors inverts the normalized Poincaré bundle; it should be symmetric after polarization pullback, whereas the torsion pairing inverts under exchange; affects the proof.
- **Misprint** in ITO04 at Definition 5.3 and §5.3, numbered pp.14–15, ITO04 lines 623, 663–668: the source says Tate realizations take values in nonnegative-exponent polynomial rings; it should allow Laurent exponents, since a positive Tate twist contributes negative bidegrees; affects a stated result.
- **Error** in ITO04 at Definition 5.2(2)(b), fractional variant and Example 5.5, numbered pp.13–15, ITO04 lines 583, 649, 666: the source says the integer-coefficient Frobenius-polynomial condition admits all stated fractional Tate twists; it should enlarge the coefficient condition, since Qℓ(1) already gives 1−q⁻¹T; affects a stated result.

These three inherited source issues were rechecked directly. For HT03, the polarization pullback is m*L⊗p₁*L⁻¹⊗p₂*L⁻¹ with base rigidification, unchanged by factor swap. On an elliptic curve with deg L=1 its diagonal degree is 4−1−1=2, whereas its inverse has degree −2. For Ito, Qℓ(1) has type (−1,−1) and geometric Frobenius q⁻¹. No correction in print was verified, and no new GWZ20 erratum is asserted without its text.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "21fdf6f09146695fd41ce210256984b579e22425", "job": "REV-PKG-TopologicalMirrorSymmetryForHitchinSystems~2", "model": "gpt-6-astra", "worker": "chris-31"} -->
