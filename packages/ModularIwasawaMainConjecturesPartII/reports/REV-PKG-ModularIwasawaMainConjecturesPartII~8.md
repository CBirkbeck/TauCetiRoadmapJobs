<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12963#issuecomment-6856876162 -->
Review (codex) of 9e77618

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P1) The functional equation does not preserve the stated anticyclotomic line

   **Location:** `packages/ModularIwasawaMainConjecturesPartII/README.md:664`, §5.5: “There `χ ↦ χ̌` exchanges the branches `θ` and `θ⁻¹ω` and inverts the anticyclotomic variable.” See also the exclusion of the μ theorem at :35.

   **Claim:** the exact functional equation restricts to those two finite-character anticyclotomic branches, so inversion and a unit alone give their λ equality.

   **Witness:** For p=5, choose a pure pro-5 cyclotomic element g with N(g)=6. Then θ(g)=η(g)=ω(g)=1, but `(θ·η)̌(g)=6`, whereas `(θ⁻¹ω·η⁻¹)(g)=1`. Kriz line 1045 retains N, not just ω.

   This can occur within the stated hypotheses: take K=Q(i), p=5 and θ the quadratic Dirichlet character modulo 13 restricted to K. The conductor primes split in K, h_K=1, and θ at either prime over 5 is the nontrivial unramified quadratic character, since (5/13)=−1. Both θ and θ⁻¹ω avoid the two excluded local characters. The pro-5 cyclotomic direction is disjoint from the anticyclotomic direction and from the finite branch field. The full norm character has a nontrivial pro-5 part on that direction. Choosing the inverse avatar changes 6 to 1/6, still not 1.

   Thus the dual line is cyclotomically shifted. Reduction modulo 5 removes that shift, but congruence alone does not preserve λ without control of μ. For example F(S,T)=S+5T has F(0,T)=5T with (μ,λ)=(1,1), while F(5,T)=5(1+T) has (μ,λ)=(1,0); both reduce to zero. This example refutes the proposed inference, not the actual Katz λ theorem. CGLS lines 812–836 use Hida's μ-vanishing in the surrounding argument; they do not justify dropping the full norm from the character identity. Kriz lines 1045–1064 give the full norm functional equation.

   **Exact repair:** retain `χ̌=χ⁻¹N` and the cyclotomic displacement. Replace the claimed exact branch restriction by a proved comparison of the reductions of the two integrally normalized branch measures, with the inversion and a nonzero unit factor specified. Supply μ=0 for both branches before deducing equality of their first nonzero reduced coefficients. Record this input in §5.5's Needs and update Scope to state its explicit supplier role. Hida10, Theorem I, printed p.45, lines 249–271, supplies the relevant split-conductor μ statement with its exceptional condition (V); for an imaginary quadratic field over Q, condition (M1) in (V) fails. Ownership search found this input assigned to PadicFamilies in AutomorphicCongruences's contract `gap:hecke-l-values-mod-p` (PR #1816, `TauCetiRoadmap/AutomorphicCongruences/README.md:118`). Use that owner through a precise declared supplier gap, including the branch normalization and hypotheses, rather than silently assuming the theorem or constructing a second owner. An independently proved stronger comparison would also suffice, but it must retain the full norm.

   **Repair test:** 6 and 1 become equal modulo 5, as required by the corrected comparison; the example 5T versus 5(1+T) is excluded by μ=0. For μ=0, a congruence `f̄=ū·ι(ḡ)` with ū a unit gives `ord_T(f̄)=ord_T(ḡ)`, hence λ equality. The full all-prime CM endpoint is not narrowed.

2. **F02** (P3) The normalization Check contradicts the integral normalization theorem

   **Location:** `packages/ModularIwasawaMainConjecturesPartII/README.md:182`: “The normalization statement holds only after inverting `p`.”

   **Claim:** normalization by the product of character rings exists only after p-inversion.

   **Witness:** `Z₂[C₂]→Z₂×Z₂`, `a+bg↦(a+b,a−b)`, has image the pairs congruent modulo 2 and cokernel F₂. Its integral normalization is already Z₂×Z₂; only surjectivity requires inverting 2.

   The theorem at :172 correctly distinguishes normalization from becoming an isomorphism. JLK lines 1419–1425 make the same distinction.

   **Exact repair:** replace the quoted sentence by “Its integral normalization is `ℤ_2 × ℤ_2`; the map from `ℤ_2[Δ]` to that normalization becomes an isomorphism after inverting 2.”

   **Repair test:** (1,0) is integral over Z₂[C₂] (it is an idempotent), is absent from its image, and becomes `(1+g)/2` after inversion. The corrected Check gives all three values correctly.

3. **F03** (P3) Downstream citations need an old-to-new target mapping

   **Location:** `packages/ModularIwasawaMainConjecturesPartII/README.md:692`, :795, :906 and :928, the new §§6.2, 7.6, 8.6 and 8.7. For example: “### 8.6 Kato's main conjecture for every CM newform and every prime”. No mapping from the CZ numbering occurs in the README.

   **Claim:** the renumbered package remains usable through its published downstream supplier contracts.

   **Witness:** PR #1744, `TauCetiRoadmap/CMRankZeroConverse/README.md:121`, still consumes CZ.4/rational-equivariant-main-conjecture, CZ.5/cm-contained-descent and cm-h2-torsion, and CZ.6/cm-kato-main-conjecture and cm-kato-normalization-dictionary. Its :386 repeats the dependency.

   These IDs also occur in this package's retained `design/plan.json`. The overlap service returned no dropped-ID lead, but direct reading of the closest consumer reveals this unresolved mapping.

   **Exact repair:** add a concise “Former numbering → present location” mapping in Scope and ownership:

   | Former numbering / target | Present location or owner |
   |---|---|
   | CZ.4 / rational-equivariant-main-conjecture | §6.2 |
   | CZ.5 / cm-contained-descent | §7.6 |
   | CZ.5 / cm-h2-torsion | KatoEulerSystems §4.4, consumed in Exact supplier contracts; §7.8 is the distinct identified-generator refinement |
   | CZ.6 / cm-kato-main-conjecture | §8.6 |
   | CZ.6 / cm-kato-normalization-dictionary | §8.7 |

   **Repair test:** each of the five IDs cited at the consumer's :121 then resolves to the actual statement or its explicit earlier owner; no duplicate module-structure theorem is introduced. This mapping requires no upward supplier edge.

4. **F04** (P3) The nonfactorial intersection counterexample cannot satisfy the hypotheses

   **Location:** `packages/ModularIwasawaMainConjecturesPartII/README.md:904`: “With `A` not factorial, `a⁻¹A ∩ A_{(a)}` can be larger than `A`.” At :889, a is a prime element.

   **Claim:** factoriality is necessary for the denominator intersection used in step 4.

   **Witness:** In any domain with prime element a, write b/a=c/s with s∉(a). Then sb=ac implies a divides b. Consequently `a⁻¹A∩A_(a)=A`, without factoriality.

   This does not invalidate the descent theorem: its regular local ring satisfies more than the intersection argument needs. It invalidates the proposed negative-control Check.

   **Exact repair:** replace that Check by: “Primality of `a` gives `a⁻¹A ∩ A_(a)=A`. The condition `H_(a)=A_(a)` is essential: for `H=a⁻¹A`, the nonzero class of `a⁻¹` in `H/A` is killed by `a`.”

   **Repair test:** for A=k[[x,y]], a=x and H=x⁻¹A, the element x⁻¹ has class nonzero in H/A, and x·[x⁻¹]=[1]=0. With H_(x)=A_(x), the preceding divisibility proof excludes it. More generally the intersection remains A in the nonfactorial domain k[[x,y,z,w]]/(xy−z²) with prime element a=w.

5. **F05** (P3) The period Check places the weight-two central value on the wrong boundary

   **Location:** `packages/ModularIwasawaMainConjecturesPartII/README.md:419`: “At `r = 1`, `r = 2` … at the edge of absolute convergence.”

   **Claim:** both values s=r lie on the absolute-convergence boundary for a type (−r,0) character.

   **Witness:** Writing ψ̄ as its unitary character times N^(r/2) replaces s by s−r/2. At s=r this is 1/2 for r=1 and 1 for r=2; only the latter is the edge.

   The unitary functional equation has centre 1/2. In the package's arithmetic variable the centre is (r+1)/2 and the absolute-convergence boundary is 1+r/2. Thus r=1 gives s=1 at the centre, below boundary 3/2; r=2 gives s=2 at the boundary. This distinction also explains the different centre/edge nonvanishing inputs imported from KatoEulerSystems §4.2.

   **Exact repair:** replace the Check by “For `r=1`, `s=1` is the central continued value; for `r=2`, `s=2` is the continued value at the absolute-convergence boundary. For `r≥3`, `s=r>1+r/2` lies in the absolute-convergence half-plane.”

   **Repair test:** r=1,2,3 give `(s, centre, boundary)=(1,1,3/2),(2,3/2,2),(3,2,5/2)`. The period identity itself is unchanged.

Five findings: one P1 and four P3. The four findings of round 7 are repaired. The package's Lean file elaborates without warnings, and the dependency check reports no problems. Neither check detects R01's false character identification. No mathematical package file was edited. Hida10 was added to the source manifest through the sources service, with bibliographic metadata added only to that new entry; the author's entries were preserved.

## Verified sound

### Prior findings and the repair pass

The round-7 review and round-8 repair report were read before the new pass. None of their findings was marked not actionable. All four repairs are present, including their propagation through later uses.

| Prior finding | Repaired passage in this README | Computation and status |
|---|---|---|
| F01, auxiliary denominator under twisting | :510, `s_a(χ)=N(a)−χ(σ_a)⁻¹·σ_a\|K∞`, and `J_χ=tw_χ(J)` | Repaired. At K=Q(i), p=3, quadratic ray character modulo 3, a=(2+i), b=(7), augmented factors are 6 and 48. For smoothed values 6u and 48u, quotients are u=u; old factors 4,48 gave 3u/2≠u. Checked §§4.5–4.6, 4.8, 6.1 and twisting conventions. |
| F02, ordinary versus squared regulator | :462, “`r_B = r_∞/2`” and “`z_B(η) = 2·z(η)`”; :477 includes the half factor for z_B | Repaired. R=log(2+√3), ordinary regulator 4R, squared regulator 8R, L′=R/3, auxiliary factor 24: `(24/2)(R/3)=4R` and `24(R/3)=8R`. Dyadic tensor scaling has valuation m for m factors. The revised proof uses the class-number formula with the explicitly chosen regulator, not an assertion that 2 is a unit. |
| F03, zero Euler factor | :464, “for which every removed factor is nonzero” | Repaired. K=Q(i), L=K(3), p=13: both factors 1−1=0, so the abbreviated vector formula is excluded. At p=3 the ramified factor is 1. The general compact-support/leading-term statement remains. |
| F04, induction weight normalization | :736, `α_(k−2)=ψ·\|·\|_K^(1/2)` and `α′_(k−2)=ψ` | Repaired. At weight 3 and prime 2+i, ψ=−3−4i, absolute value 5; α_AGR has absolute value √5 and α′_AGR has absolute value 5. w=k−2=1 has the required parity. Scope, contracts and §§7.1–7.2 agree. |

For unchanged material, round 7's adversarial table was used only where it contains computed values. Its nonnumerical summaries were not treated as verification. All 51 numbered targets, API/Check blocks, conventions and Needs lines were read. The changed passages and all 15 newly seeded targets were checked afresh. Searches for the repaired patterns included every auxiliary denominator, zeta/regulator comparison, Euler-factor removal and inducing-character normalization. R01 is a new full-norm versus finite-character error, not a recurrence of the repaired weight dictionary.

### Seeded source verification

All 15 requested source targets were opened in the legal cached texts. No author-flagged unverified locator was found. The original eleven manifest works were available; Hida10 was fetched from the publisher's open archive for the new §5.5 analysis. There is no outstanding missing-source request. Page numbers below follow the versions recorded in the manifest. OCR qualifications are listed separately.

| Target | Source text and locator checked | Hypotheses / result of comparison |
|---|---|---|
| 0.2 | JLK lines 1419–1425, Lemma 7.2, p.34; 1471–1486, Definition 7.5/Lemma 7.6, p.35; BT line 146 | Character values in O, regular means p∉q, componentwise characteristic ideal. The theorem matches; R02 corrects its Check. |
| 1.6 | Kato lines 5181–5195, §15.1, p.251; BT lines 138–145, p.3; JLK lines 1427–1457, §7.1, p.34 | Class norm limits and torsion; no assumption p∤#Δ is inserted. |
| 2.2 | Kato lines 5242–5258, (15.4.1)–(15.4.4), p.252 | The added coprimality of isogeny degree is needed. Unit ideal and noncoprime quotient controls distinguish the correct law. |
| 2.6 | Kato lines 5270–5351, §§15.5–15.6, pp.253–255 | Inverse theta unit, norm relations, auxiliary ideal, fraction-field element and height-one integrality agree after the stated corrections. |
| 3.2 | Kato lines 5528–5571, (15.9.1)–(15.9.2) and proof, pp.259–260 | Character inverse in the auxiliary factor and nonzero denominator conditions compared; R05 corrects the convergence Check. Some formula glyphs are damaged. |
| 4.3 | JLK lines 715–798, Definition 3.8, Theorem 3.9 and Corollary 3.10, pp.17–19; regulator lines 386–398 and zeta lines 476–522 | Ramification at all primes over p is present; the repaired ordinary/squared regulator conversion is explicit. |
| 4.4 | JLK lines 1257–1318, Theorem 6.4 and proof, pp.30–31 | Euler-system bound, O-torsion qualification and rank argument compared. The source's rank-difference sign slip is not propagated. |
| 5.5 | Kriz lines 1034–1064, Theorem 27, p.22; CGLS lines 803–836, proof of Theorem 2.2.2/(2.11), p.15 | Functional equation locator is correct; the claimed restriction to two finite-character lines is false, R01. |
| 6.3 | BT lines 150–157, Theorem 2.1, p.4; JLK lines 861–887, Lemma 4.3, p.21, and 1025–1044, Corollary 5.3, pp.24–25 | Empty tame set, surviving inertia-trivial components and Euler corrections distinguished. Printed unconditional formula cannot be used unchanged. |
| 7.1 | Kato lines 5572–5585, §15.10, p.260; Schutt09 lines 95–126, Theorem 1.4, p.3 | Type, weight and level N=abs(D_K)N(f_ψ) checked. Supplier normalization now uses w=k−2. |
| 7.2 | Kato lines 5586–5625, Lemma 15.11(1), pp.260–261; 5631–5666, continuation, p.262 | Induced representation distinguished from archimedean comparison; a fixed nonzero de Rham isomorphism fixes the scalar. |
| 7.9 | Kato lines 5704–5772, Lemma 15.14 and Proposition 15.17, pp.264–265 | Height-one prime and alternative regular-prime/Rubin condition retained; elliptic-unit lattice distinguished from the imported rational bound. |
| 8.3 | BT lines 213–218, proof of Theorem 2.6, p.5; Kato lines 5745–5772, p.265; JLK local terms above | Twisted equivariant equality and componentwise deletion of tame terms compared; no arbitrary deletion of nonunits. |
| 8.4 | Kato lines 5754–5761, Lemma 15.16, p.265; BT lines 213–218 | Rational elliptic/Beilinson–Kato bridge; no integral equality of chosen lattices asserted. |
| 8.5 | Kato lines 5768–5772, proof of 15.17, p.265; 4912–4931, Lemma 14.15, pp.243–244 | Equality requires the extra cancellation proved here; source gives the inequality. R04 concerns only the false negative control, not the cancellation. |

### Computed adversarial evidence

These are diagnostic computations, not claimed proofs of the deep main conjectures. Arithmetic examples test the actual normalizations; local algebra examples test the length and determinant steps with their stated hypotheses. This table covers every sampled target, every headline family, every new finding and each repaired pattern. Round 7's computed rows also cover the unchanged targets not repeated here.

| Statement | Instances and values on the two sides | Result / change |
|---|---|---|
| 0.1, ray algebra | K=Q(i): (p,f)=(2,1),(5,1),(2,3) give #Δ=1,4,8. For C₂ at p=2, `(g−1)(g+1)=0`; a domain model gives the wrong answer. | Full finite torsion retained. |
| 0.2, normalization | Z₂[C₂] maps to pairs of equal parity; cokernel F₂. Normalization is Z₂² before inversion, Q₂² after inversion. | R02. |
| 0.2, characteristic lengths | `length A/(t²)=2=length (A/t)²`; characteristic ideals both (t²). `(A/p)[1/p]=0` has characteristic ideal (1). | Rationalization and multiplicity pass. |
| 1.1–1.4, tower directions and Brauer terms | Under multiplication-by-p transitions, lim Z_p=0, whereas identity transitions give Z_p. K=Q(i), p=5 has p-unit rank 2 versus ordinary-unit rank 0. Kernel of Z_p²→Z_p by sum has rank 1; one-place kernel has rank 0. | Corestriction, p-units and local correction distinguished. |
| 1.5 and 6.3, tame terms | Q(i),p=5,f=3: #Δ=32, inertia order 8; four inertia-trivial characters have Frobenius 1,1,−1,−1. Augmented Euler factors 0,0,2,2; the other 28 invariant modules vanish. | The corrected rational formula keeps surviving terms. |
| 1.6–1.7, rank and torsion | Generic ranks H¹=1,H²=0 give Euler difference 1; both zero would give 0. For A=Z_p[[S,T]], A/(S,T) has dimension 1, codimension 2, and height-one length 0. | Torsion/pseudo-null statements distinguished from zero modules. |
| 2.1, differential sign | Leading terms for k=1,2,3 and c=5: `24/(2πiz)`, `−24/(2πi)²z²`, `48/(2πi)³z³`. | Signs +,−,+ retained. |
| 2.2, theta norm | Quotient by E[a] pushes `N(a)[0]−E[a]` to 0. For N(a)=5, a coprime degree-2 isogeny bijects all five torsion points. Unit ideal: divisor 0, θ=1, norm 1. | Coprimality excludes the wrong unrestricted law. |
| 2.3, Artin level | f=(1+i)³ and a=(1+i) reduce annihilator exponent 3→2, not 3. For a=(5), 5α=α. | Coprimality and level marked. |
| 2.4–2.5, inverse and complex norm | In the quadratic ray example, ordinary weighted log of inverse theta is 4R, squared-norm log is 8R, R=log(2+√3). Ordinary log of theta is −4R. | Both inverse and factor 2 detected. |
| 2.6, auxiliary-free element | a=O_K gives denominator 1−1=0 and theta 1 (additive class 0), so division would be 0/0. For two variables J quotient is Z_p, codimension 2, height-one length 0. | Nonunit auxiliary ideal excluded from division; J is not silently the whole ring. |
| 3.1, realization | For principal a=(5), r=1, J_a=[5] acts by 5 on H¹ and ψ(a)=5; composite is 5/5=1. Omitting ψ(a)⁻¹ gives 5. | Auxiliary independence passes. |
| 3.2, denominator | For ψ=ψ_E²ν, c=7: ψ((7))=−49, N=49. At χ=1 factor 98; at χ=ν with ν((7))=−1 factor 0. | Invertibility is genuinely required. |
| 3.2, continuation | r=1,2,3 at s=r give unitary variables 1/2,1,3/2; absolute-convergence edge is 1. | R05. |
| 3.3, relative height | Inert p: absolute height 2, O_𝔭-relative height 1. For r=1,2,3 the inverse factorial is 1,1,1/2. Rescaling ω by u contributes u^(−r)u^r=1. | Generic supplier gap has the required relative generality. |
| 4.2–4.3, corrected regulator | Ordinary side 4R equals (24/2)(R/3); squared side 8R equals 24(R/3). Scaling m dyadic determinant factors by 2 gives valuation m, not 0. | F02 repaired; normalization transported to lattice route. |
| 4.2–4.3, zero factor | At p=13 in K(3)/Q(i), 4²≡3, hence both Euler factors 0. Proposed vector rank would be 0 versus determinant rank 1. At p=3 ramification makes factor 1. | F03 repaired by explicit exclusion of abbreviated formula. |
| 4.4, Euler bound | Over a DVR, if H²=A/(t) and unit quotient A/(t²), characteristic divisibility (t) divides (t²) and lengths give 1≤2, not 2≤1. A finite O-module in a two-variable tower has height-one length 0. | Direction and discarded O-torsion checked. |
| 4.5–4.6, twisted equality | χ(a)=−1,N(a)=5 gives 6 rather than 4; χ(b)=1,N(b)=49 gives 48. Smoothed values 6u,48u divide to u,u. Untwisted denominators give 3u/2,u. | F01 repaired throughout. |
| 4.8, Rubin equality | In an exact sequence with successive characteristic lengths 2,5,4,1, the alternating sum is 2−5+4−1=0, and equal outer lengths would force equal middle lengths. Trivial one-variable correction Z_p has ideal (T), not (1). | Exact-sequence transport retains correction terms. |
| 5.1–5.3, Coleman image | For A=Ô[[S,T]], J=(S−a,T−b): A/J=Ô≠0, but all height-one lengths are 0. Thus Jν≠Aν while their height-one localizations agree. | Divisorial hull distinguished from literal image. |
| 5.2, ordinary place | E:y²=x³−x has #E(F₅)=8, a₅=−2; ψ(2+i)=−1+2i. Euler product is (32−24i)/25; changing ordinary place gives its conjugate (32+24i)/25. | Ordinary-place convention discriminates. |
| 5.4, character exclusions | Local θ=1 gives H⁰ dimension 1; a nontrivial unramified quadratic θ gives dimension 0. θ=ω makes the dual invariant nonzero. Multiplying T by p leaves λ=1 but changes μ from 0 to 1. | Local hypotheses and ideal-versus-λ distinction pass. |
| 5.5, exact line | p=5, N(g)=6, θ(g)=η(g)=ω(g)=1: exact dual value 6 versus asserted branch value 1; reductions both 1. | R01. |
| 5.5, λ inference | F=S+5T: S=0 gives (μ,λ)=(1,1); S=5 gives (1,0), reductions both 0. For μ=0, multiplication by a reduced unit preserves T-order. | μ control cannot be omitted in this route. |
| 5.5, inversion | ι(T)=−T/(1+T). For 1,T,T², reduced orders are 0,1,2 on both sides; T+ϖ has constant ϖ but reduced order 1 before and after ι. | The inversion argument itself is sound. |
| 6.2, rational equality | (p) and (1) become equal after p-inversion; an Euler factor T remains nonunit. | Rationalization does not erase tame factors. |
| 7.1–7.2, weight dictionary | k=3: ψ=−3−4i has norm 25/absolute value 5; α_AGR=ψ/√5 has absolute value √5; α′=ψ has value −3−4i. w=1≡3 mod2. | F04 repaired. |
| 7.2, Frobenius | Geometric eigenvalues −1±2i sum to −2; their inverses sum to −2/5. De Rham scalar normalization sends c to 1 only by multiplying by c⁻¹. | Direction and uniqueness pass. |
| 7.5–7.6, descent | At p=2,#Δ=8, 2#Δ=16 is not invertible in residue characteristic 2 but is invertible in characteristic 0. `(ζ₈+ζ₈³)²=−2`; Q(i),Q(√−2) are contained cyclotomic cases. | Exceptional case is included without dividing by 2 integrally. |
| 7.8, generation | A primitive generator w has valuation 0 and nonzero reduction; aw has valuation 1 and zero reduction. | Identified-generator theorem is stronger than imported rank 1. |
| 7.9, lattice inequality | A local Euler factor of order 1 adds 1 to unit-quotient length. For Q(i),p=2, 2 divides #μ(H)=4, so Rubin's integral alternative fails; regular rational primes remain allowed. | Integral/rational hypotheses retained. |
| 8.3, ψ-components | Finite inertia eigenvalue −1 gives −1−1=−2, a unit after p-inversion (also p=2); eigenvalue 1 gives 0 and a surviving local term. | No deletion on invariant components. |
| 8.4, zeta bridge | On a nonzero period line, multiplying a class by c multiplies its period by c; equality fixes c=1, opposite sign gives −1. Twist by −1 changes χ(−1) by −1. | Rational period-normalized bridge; no unjustified integral lattice identification. |
| 8.5, length cancellation | A=k[[x,y]],a=x,M=A/y: quotient length 1, a-torsion length 0, height-one contribution 1. For M=A/(x,y), quotient and a-torsion both have length 1, net 0. | Pseudo-null contribution cancels. |
| 8.5, intersection | b/a=c/s and a∤s imply a divides b. Thus intersection=A even in nonfactorial A. H=a⁻¹A instead has [a⁻¹]≠0 and a[a⁻¹]=0. | R04. |
| 8.6–8.7, endpoint and centre | At p=2, Q₂[C₂]=Q₂×Q₂, so both rational character components are tested. k=2 has central Tate twist −1; for k=3 an alleged half twist on −1 would require h(−1)²=−1 although order two forces square 1. | Rational all-prime endpoint and even-weight central dictionary remain distinct. |

The standing mixed-characteristic DVR, number-field, finite-generation, torsion, finite-conductor, rank and nonzero-period hypotheses exclude zero rings, equal-characteristic coefficients and arbitrary unrelated maps. No claim was extended to such inputs merely because a total function has a junk value. Particular care was taken with the unit auxiliary ideal, zero Euler factors, singular group-ring components, the two p=2 cyclotomic-field cases and ramified p=3. No declaration-level hidden-binder issue can arise in the declaration-free Lean file.

An additional source check of JLK Lemma 5.1 found that Z₃[C₃] has no integral trivial-character summand: its rational idempotent is `(1+g+g²)/3`. The package uses the regular characterwise auxiliary ideal, and does not consume the source's singular Ω-perfectness assertion.

### Pinned libraries, headline coverage and padding

Pins read: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The following files were opened at those pins. Paths are relative to the respective library repository.

| Object / declaration | File and line; what was actually present |
|---|---|
| ClassGroup | `Mathlib/RingTheory/ClassGroup/Basic.lean:89`; class group, not a norm-limit arithmetic module. |
| Module.length; Ideal.height | `Mathlib/RingTheory/Length.lean:31`; `Mathlib/RingTheory/Ideal/Height.lean:36`; extended length and prime height. |
| IsLocalization.AtPrime | `Mathlib/RingTheory/Localization/AtPrime/Basic.lean:50`; localization at prime complement. |
| PowerSeries; MvPowerSeries | `Mathlib/RingTheory/PowerSeries/Basic.lean:57`; `Mathlib/RingTheory/MvPowerSeries/Basic.lean:86`. |
| Unit torsion and logarithmic map | `Mathlib/NumberTheory/NumberField/Units/Basic.lean:145`; `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean:85`, :91, :113, :127. Complex multiplicity 2; kernel is torsion. |
| Regulator | `Mathlib/NumberTheory/NumberField/Units/Regulator.lean:267`, :290; covolume and nonvanishing. |
| Totally complex | `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:210`, :224; absence of real places, multiplicity 2. |
| Cyclotomic extension and character | `Mathlib/NumberTheory/Cyclotomic/Basic.lean:74`; `Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean:308`. |
| completedGroupAlgebra | `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:119`, :145, :161, :210; compatible tuples, carrier, projections, universal lift. `Map.lean:92` supplies the continuous-group-map functor. |
| Modulus, RayClassGroup, HeckeCharacter | `TauCeti/NumberTheory/NumberField/Global/RayClass/Modulus.lean:98`; `RayClass/Basic.lean:130`; `HeckeCharacter/Basic.lean:70`. Hecke character is a continuous homomorphism to C×; unitarity is not built in. |
| Ray class field / Artin equivalence | `TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RayClassField.lean:123`, :139, :143, :209; field, number-field/abelian instances and equivalence. |
| Newform | `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:84`, :104; eigenvalues and newness, no attached Galois representation. |

Object searches in both pins found no native Katz measure, elliptic-unit tower, Kato zeta morphism or arithmetic Iwasawa complex making these headlines statable with a few simple definitions. Native ray fields and completed group algebras do not supply their arithmetic constructions.

| Headline from README summary | Suggested.lean docstring | Missing carriers |
|---|---|---|
| §8.6, CM Kato equality at every prime | :10–14 | Attached representation, arithmetic Iwasawa cohomology, zeta morphism. |
| §6.2, rational equivariant equality with Euler factors | :15–22 | Norm limits, their actions, elliptic units and CM theta functions. |
| §7.8, height-zero generation | :23–25 | Ray-tower cohomology, elliptic-unit class, comparison map. |
| §4.5, all-prime finite-character equality | :26–29 | Arithmetic cohomology complexes/determinants and zeta element. |
| §4.8, Rubin main conjecture and classical form | :30–33 | Local/global/elliptic-unit limits and ramified Galois module. |
| §§5.3–5.4, Katz and anticyclotomic forms | :34–36 | Katz measure and two-variable Coleman map. |
| §5.5, functional equation and λ identity | :37–39 | Katz measure itself. R01 concerns the README proof interface. |

There are zero declarations, zero sorried theorems and zero admitted examples. Therefore the exhaustive one-tactic probe and `#check @name` binder audit each have zero candidates; no fictional test run is claimed. No padding, sorry'd data, free predicate stand-in, extra import or set_option occurs. No backticked identifier presented as a locally declared Lean name is left unresolved; mathematical code-span symbols are notation. The file uses the single `import Mathlib` and the required namespace/docstring.

The prescribed `lake env lean` invocation on this package's Suggested.lean, run from the pinned content checkout, exited 0 with empty output: no warnings, not even sorry warnings. No Tau Ceti module build was needed. The package has no omitted statable headline identified by this audit.

### Ownership and supplier order

The board package index, main, supplied open-head index and all three closest-roadmap lists were read. The roadmap service was used for ownership searches and to read supplier heads. No second copy of this Part II exists on main. No conflicting open head or revision-only supplier ID was found. The resolver's NonordinaryCMSpecialValues §2.1 lead is resolved by `packages/NonordinaryCMSpecialValues/README.md:277`; its §2.2 is at :293. Its incorrect unrestricted isogeny/Artin laws, inverse-unit convention and narrower p hypotheses are explicitly distinguished from the variants retained here. R03 records the additional consumer numbering problem the overlap service did not list.

The main-branch scopes and house shape were compared in GlobalNumberFields, ModularForms and PadicMeasuresIwasawaAlgebras. Each supplier below was resolved at main or its supplied open head, not from recollection. Unless indicated otherwise, the path is `TauCetiRoadmap/<name>/README.md`; numbers after a colon are file lines.

| Supplier | Resolved sections and representative lines |
|---|---|
| GlobalNumberFields, main | Layers 2,9,10: :279,:508,:531. |
| ClassFieldTheory, main | Layers 10,11,13: :1638,:1781,:1924. Former §2.6 maps to Conventions C.6 at :267; arithmetic Frobenius is specified at :537. The explicit mapping preserves that old citation. |
| ProfiniteProPGroups, main, `Completed/ProfiniteProPGroups/README.md` | Layer 9's completed-group-algebra subsection: :2192. |
| ModularForms, main | Layers 4,5,7,9: :670,:708,:785,:1016. |
| EllipticCurves; ModularCurves, main | Layers 1–2: :423,:647; Layers 0,2: :639,:1157. |
| PadicMeasuresIwasawaAlgebras, main | §§2.1–2.3,2.6,2.8,4.1,4.6,5.1: :1148,:1229,:1328,:1597,:1745,:2361,:2710,:3172. |
| SelmerIwasawaCohomology, #869 | §§0.9–0.10,2.8,3.0–3.3,3.7,3.15,3.17: :236,:250,:518,:1329,:1373,:1405,:1426,:1492,:1650 onward,:1770. The j_* comparison and universal-norm condition were read, not identified with unrestricted generic cohomology. |
| ArithmeticGaloisDuality, #858 | R02.4.3,R02.4.4,D7.5: :3436,:3505,:5576. |
| IntegralIwasawaTheory, #1306 | §§2.6,7.1,7.2,10.0: :383,:981,:1007,:1461. |
| ColemanPowerSeries, #1309 | §§2.37,2.39,2.44: :7078,:7124,:7209. Raw/normalized sign and cancellation of the derivative's scalar factor agree. |
| EulerSystemsAndKolyvaginSystems, #1272 | §§2.2,2.5,8.1,8.2,8.6,8.7,8.14,8.25,8.37: :1606,:1683,:4558,:4601,:4776,:4813,:5111,:5466,:5869. |
| ComplexMultiplicationAndExplicitReciprocity, #1254 | §§1.2,2.2,3.2,4.1,4.2,5.1: :354,:445,:583,:634,:666,:732. |
| ImaginaryQuadraticClassNumber, main | H3.1: :103; lattice/ideal dictionary. |
| NeronModelsAndSemistableAbelianVarieties, #852 | §5.1: :3109; inertia-triviality criterion, not unconditional good reduction. |
| AutomorphicGaloisRepresentations, #1007; PartII, #1006 | §§1.5,3.15,7.3: :1801,:2433,:3708; AG2.0: :640. Corrected k,w dictionary tested above. |
| AnalyticNumberTheoryPartI; LFunctions, main | §2.3a: :1356; Layer 7: :1440. Algebraic characters enter the functional equation through unitary twists. |
| PadicHodgeRegulators, #1498 | §§1.4,1.7: :526,:575, plus the declared relative-height-one contract. |
| AutomorphicPadicLFunctionsPartII, #1543 | §§3.3,3.4,8.5: :572,:607,:1304. Katz measure and Eisenstein–Kronecker variables compared. |
| NonordinaryCMSpecialValues, board | §§2.1–2.2: :277,:293. Theta/canonical pair existence imported; different norm, action and realization statements are identified variants. |
| PadicFamilies, #1019; KatoEulerSystems, #1804 | §§4.0.1,4.0.3: :2364,:2393; §§4.2,4.4,5.1,5.3: :1673,:1806,:1995,:2145. CM admissibility, module structure, zeta morphism and interpolation are explicit. |
| NoncommutativeAndEquivariantIwasawa, #1307 | §4.3: :2063 onward; class-number-one rational CM curve and p≥5 ordinary specialization, explicitly imported rather than reproved in that scope. |
| AnticyclotomicLocalUnits | §1.1: :273; height-two Lubin–Tate interpolation, a scope boundary rather than the all-prime cohomological endpoint. |
| PeriodsAndSpecialValues, #1496 | PS.3.2,PS.3.2a,PS.5.2: :804,:834,:1105; predicate and regulator datum, not an imported all-prime proof. |
| ModularIwasawaMainConjectures, #1499 | §§0.1,0.6,0.7: :215,:423,:467; datum and conjecture formulation. |

The existing `gap:height-one-explicit-reciprocity` agrees between design/plan.json and README:119. It names PadicHodgeRegulators §1.4 and specifies the finite p-adic field, O_𝔭 action, relative height one, torsion tower, norm-compatible units, cup product, dual exponential and Coleman derivatives. It is precise, minimal and owned; the narrower inert applied theorem does not supply it. Its present absence is not a finding. A future acceptance would remain conditional on that contract and any additional contract introduced to repair R01.

Every Needs line and supplier citation was read. The authorized dependency check returned:

```text
depcheck: 223 roadmaps, 1992 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line, and no forbidden supplier is consumed. This does not certify R01's undeclared proof input. The repair can use an earlier owner without a cycle.

Overlap check: read KatoEulerSystems, AutomorphicCongruences, ModularIwasawaMainConjectures, EulerSystemsAndKolyvaginSystems, CMRankZeroConverse and PadicMeasuresIwasawaAlgebras from all three closest-roadmap lists. Shared module structure/zeta/interpolation belong to KatoEulerSystems §§4.4,5.1,5.3; conjecture/datum to ModularIwasawaMainConjectures §§0.1,0.6–0.7; Euler-system structures/bounds to EulerSystemsAndKolyvaginSystems §§2.2,8.25,8.37; characteristic/determinant algebra to PadicMeasuresIwasawaAlgebras §§4.1,4.6,5.1. This Part II owns the general elliptic-unit construction and CM equality; CMRankZeroConverse consumes it (R03), and AutomorphicCongruences owns different congruence bounds. Its μ-input ownership points to PadicFamilies (R01). NonordinaryCMSpecialValues and NoncommutativeAndEquivariantIwasawa were also compared; their imports and retained variants are explicitly bounded.

### Shape and source independence

All nine layers have mathematical titles, Examples and Dependencies. Definition blocks retain API prose and at least three Checks: examples include §0.1 (4), §0.2 (3), §1.1 (3), §1.2 (3), §1.4 (3), §2.6 (3), §3.1 (4), §4.7 (3) and §5.1 (5). No theorem lacks a source locator in the sampled and repaired passages. No process residue, computational algorithm, source-chapter heading, sorry'd data or route-specific good-prime substitute for the all-prime endpoint was found. The split-prime Coleman branch is a separate theorem with genuine mathematical hypotheses. The inaccurate Checks are reported rather than counted as evidence of correctness.

Wording was compared for the 15 seeded passages and six further passages: §§0.1,2.1,2.4,3.1,4.2 and the Lean docstring, against BT, Kato, JLK, Kriz, CGLS, Schutt09 and HuberKings. A word-run check and manual comparison found mathematical formulas, standard names and short hypothesis phrases, not copied expository expression or clause-by-clause proof-plan paraphrase. The longest normalized match was a 13-word Hecke-character hypothesis after removal of mathematical glyphs; other matched runs were at most seven words. No table, figure, exercise list or external Lean formalization was reused.

Counting explicit source-name/comma mentions before References gives Kato 46, JLK 33, BT 21, Rubin 1991 10, Yager 6, Coleman 2, CGLS 2, Kriz 1, HuberKings 2 and Schütt 1: 124 total. Kato's contents at lines 35–68 group §§1–7,8–11,12–15,16–18 into four chapters. The roadmap's nine layers do not reproduce that run. Its tower, unit, realization, integral-equality, Coleman, rational-assembly and CM-descent scopes are distinct. Dependencies force the main order: §2.7 uses §§1.7 and 2.5; §4.3 uses §§2.5 and 4.2; §4.5 uses §§4.1–4.4; §6.1 uses §4.5; §§7.8–8.6 use the equivariant equality and descent. Layer 5 is the separate Katz consequence branch. JLK and Coleman/Yager supply independent mathematical inputs.

Source independence: 21 passages compared with 7 sources; no copied nonmathematical expression or reused material found; largest share Kato, 46 of 124 explicit source-name locators; contents compared with Kato: independent, with the main order forced by dependencies. Damaged individual Kato formula glyphs remain the qualification below.

## Not verifiable

- The Kato extraction damages individual formula glyphs, especially the Eisenstein–Kronecker exponents and portions of Proposition 15.9 and its proof. Surrounding statements, types, auxiliary factors and diagnostic computations were checked, but no visual verification of every damaged glyph was obtained; no PDF rasterizer was available. No source misprint is inferred merely from those glyphs.
- Hida10's extraction also has damaged symbols. Its Theorem I hypotheses and exceptional condition were readable; this review does not certify a complete proof of that theorem or the still-missing integral comparison required by R01.
- The acceptance file has no finished arithmetic proofs. The generic relative-height-one reciprocity theorem remains a declared supplier contract, not a pinned theorem. A successful empty-declaration elaboration does not prove any main conjecture.

## Source issues

- **Error** in JLK at equation (17), §5.2, printed p.24 (JLK lines 960–961, 999–1007): the source says untwisted auxiliary division is independent of the ideal after character twisting; it should be division by the character-twisted auxiliary factor in the stated group-ring action; affects a stated result.
- **Error** in JLK at Proposition 3.3(4), printed p.14, and Theorem 3.9(a), printed pp.17–18 (JLK lines 394–398, 759–775): the source says the ordinary-logarithm regulator equals the full auxiliary factor times the leading value; it should be half that expression, or use squared norms with the corresponding zeta normalization; affects a stated result.
- **Error** in JLK at Corollary 2.11, printed p.12 (JLK lines 485–491, 512–522): the source says Euler-modified zeta vectors generate determinant lattices without excluding zero factors; it should be restricted to nonzero factors or expressed with full local determinants and leading terms; affects a stated result.
- **Error** in JLK at Lemma 5.1 and proof, printed p.23 (JLK lines 976–986): the source says deleting the p-primary group factor gives a direct summand and a perfect augmentation ideal; it should be restricted or replaced by a valid perfectness argument; affects a stated result.
- **Misprint** in JLK at proof of Theorem 6.4, printed p.30 (JLK lines 1279–1282): the source says rank H² minus rank H¹ equals one; it should be rank H¹ minus rank H² equals one, with the preceding comparison's sign adjusted; affects the proof.
- **Error** in BT at Theorem 2.1, printed p.4 (BT lines 152–157): the source says the p-unit/class equality needs no tame-conductor correction; it should be corrected by surviving tame local Euler terms; affects a stated result.
- **Error** in Kato at Theorem 15.2(2), printed p.251 (Kato lines 5197–5207): the source says the rational ray-tower equality has no tame-prime correction; it should be restricted to components with trivial correction or include the tame Euler factors; affects a stated result.
- **Error** in Kato at (15.3.3), printed p.252 (Kato lines 5211–5239): the source says the canonical-pair Artin comparison applies without a coprimality condition; it should be restricted to ideals prime to the modulus; affects a stated result.
- **Error** in Kato at (15.4.2), printed p.252 (Kato lines 5254–5255): the source says the theta norm law holds for an unrestricted isogeny; it should require degree prime to the auxiliary norm; affects a stated result.
- **Gap** in Kato at proof of Proposition 15.9, printed p.258 (Kato lines 5492–5494): the source says the selected canonical CM curve has good reduction everywhere; it should justify an appropriate prime-to-residue level criterion or use auxiliary-level descent; affects the proof.
- **Misprint** in Kato at proof of Proposition 15.17, printed p.265 (Kato line 5769): the source says the length argument invokes Lemma 14.12; it should invoke Lemma 14.15, printed pp.243–244; affects nothing.

## For the human reviewers

- Kato is the most-cited source. Its contents and surrounding text were readable, but damaged formula glyphs prevented complete visual verification of parts of §§3.8 and 15.9; see Not verifiable. No licence or subject-scope concern was identified.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "9e776182c87b25b8c518ee40453034d2332e0baf", "job": "REV-PKG-ModularIwasawaMainConjecturesPartII~8", "model": "gpt-6-astra", "worker": "chris-9"} -->
