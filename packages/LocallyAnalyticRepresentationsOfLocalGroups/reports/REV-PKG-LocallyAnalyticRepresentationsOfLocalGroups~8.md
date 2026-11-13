<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13169#issuecomment-6857159099 -->
Review (codex) of 21aae7e

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) Import the existing dominant split-field descent

   **Location:** `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:13`, `:114`, `:805`, especially §4.1(ii): “each absolutely irreducible and defined over k”.

   **Claim:** This roadmap owns descent of dominant highest-weight modules from an algebraic closure to a split reductive Lie algebra over a characteristic-zero field.

   **Witness:** `TauCetiRoadmap/ReductiveGroups/README.md:4373`, on main, already constructs the contravariant-form descent for dominant weights over any characteristic-zero field, including reducible derived algebras and prescribed central characters. Its base-change isomorphism is at line 4379.

   The overlap is the actual module and its absolute irreducibility/finite-dimensionality, not merely vocabulary. For GL₂ over ℚ₃ and dominant weight (2,0), both constructions give the same highest-line-normalized three-dimensional Sym² module, with weights (2,0), (1,1), (0,2). For a torus they both give the prescribed one-dimensional character. The supplier exists on main; no open revision is needed. This is separate from the settled SpringerResolutionAndCharacteristicCycles finding.

   **Exact repair:** Add ReductiveGroups §9A, item 5, “The split-field producer used here”, to the scope and exact supplier contracts. Import its dominant split-field modules, their base-change isomorphisms and finite-dimensionality. Replace §4.1(ii)'s construction assignment with a use of that supplied classification; make clear that §4.1(i)'s new work is its extension to arbitrary k-rational highest weights, together with the remaining reductive/category-O comparisons. Add §9A to §4.1's Needs and Layer 4 Dependencies. Remove the claim that all the supplied highest-weight theory is only over an algebraically closed field. Do not create a second dominant highest-module construction. The GL₂ and torus instances above then refer to one supplied module and retain exactly the stated dimensions and weights.

2. **F02** (P2) Define the domain of the parabolic Weyl comparison

   **Location:** `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:1558`, §9.6(3): “on Hom_(P,g′)(T(L), E) ≅ Ext¹_(F_P,g′)”.

   **Claim:** The Weyl-transition equality is restricted to a particular subspace of additive torus characters. That subspace is never defined: this is the only occurrence of Hom_(P,g′) in the package. The global Hom_g′ of §5.3 and the extension-space definition in §9.3 do not define it.

   **Witness:** DING25 line 859, equation (2.21), p. 21, imposes factorisation of the nonsmooth part through the block determinants; line 861 gives dimension n + r[L:ℚ_p]. This restriction is indispensable.

   For GL₃ over ℚ_p with blocks (2,1), the intended differentials are (a,a,b). The dimension is 3 + 2 = 5, whereas global Hom_g′ has dimension 4 and all Hom(T(L),E) has dimension 6. The character log_p(t₃) belongs to the intended space but not the global determinant space; log_p(t₁) does not belong to the intended space. Thus neither existing plausible interpretation supplies the missing hypothesis.

   **Exact repair:** Before §9.6, define det_P(t) = (∏_{j in block i} t_j)_i and

       Hom_(P,g′)(T(L),E)
         = {ψ_sm + Σ_i ψ_i ∘ det_i :
              ψ_sm ∈ Hom_sm(T(L),E), ψ_i ∈ Hom(L×,E)}.

   State its identification with the product of the block Hom_g′ spaces, its dimension n + r d_L, and the identification with Ext¹_(F_P,g′) through ζ_(F_P). Cite DING25 (2.21), p. 21, and (3.30), p. 47. Also identify T_(w,i) in §9.6(2) as the refinement induced on grᶦF_P (DING25 line 1869). Give three discriminating Checks: P = B gives all Hom, dimension n(1+d_L); P = G gives the global determinant space, dimension n+d_L; blocks (2,1) give (a,a,b), including log_p(t₃) and excluding log_p(t₁). These computations distinguish the repaired domain from both wrong models without narrowing the theorem.

3. **F03** (P3) Restore the second author of BZ77

   **Location:** `packages/LocallyAnalyticRepresentationsOfLocalGroups/sources.toml:443`: `authors = "Bernstein"`.

   **Claim:** The manifest records the authors of the cited paper.

   **Witness:** BZ77 lines 6–7 and 25 name I. N. Bernstein and A. V. Zelevinsky. The package's own reference at `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:1755` already names both.

   **Exact repair:** Change only the authors field of the existing BZ77 entry to `"I. N. Bernstein, A. V. Zelevinsky"`; retain its key and provenance. Both title-page authors then agree with the README and manifest. The reviewer has not rewritten this recorded entry.

Three findings: two P2 and one P3. The previous finding is repaired. The seven changed locators are correct. The Lean file elaborates, and the dependency check reports no problems. No author file or source-manifest entry was changed during this review.

## Verified sound

### Previous finding and the changed passages

Round-7 F01 is **repaired**, not partly repaired. Each repaired passage below was checked against the actual cached text, including the proof rather than only the theorem's start. The additional changes made by the repair worker were checked in the same way.

| Passage in `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md` | Repaired wording | Source witness | Result |
|---|---|---|---|
| §4.5, line 874 | “pp. 37 and 44” | DING25 line 1501: Proposition 3.1 proof on p. 37; line 1761: Lemma 3.10 proof on p. 44 | Repaired |
| §10.3, line 1632 | “arXiv v2 pp. 48–49” | DING25 lines 1962–1973; p. 49 begins at line 1966 | Repaired |
| §10.6, line 1668 | “arXiv v2 pp. 50–51” | DING25 lines 2027–2052; p. 51 begins at line 2044 | Repaired |
| §8.1, line 1235 | “§3.1.1, arXiv v2 pp. 35–36, §3.1.2, p. 37, and §3.1.4, p. 48” | DING25 lines 1421–1438, 1479–1482, 1960 | Additional repair sound |
| §6.7 | “arXiv v2 pp. 29–30” | DING19 lines 1084–1106: Lemma 2.26, then the Proposition 2.27 argument across the p. 30 marker | Additional repair sound |
| §7.4 | “Theorem 0.13 and its sketch of proof, pp. 4–5” | EMJ2 lines 142–202; p. 5 begins at line 177 | Additional repair sound |
| §8.7 | “Proposition 5.9 and its proof, p. 27” | BH20 lines 1236–1260; the next page begins at line 1261 | Additional repair sound |

The changed text consists of locators, not altered mathematical hypotheses. The corresponding mathematical cases are included below. I also searched the other references to these results for the same shortened-page pattern; no further instance was found. No maintainer notes were supplied. The earlier decisions on round-3 F05 (small primes outside type A) and F06 (the Springer principal-block ownership edit) are not re-raised; neither is a reason to ignore the separate existing owner in R01.

### Seeded source sample

All 15 sampled targets were read in their recorded versions. Pages below are those of the version the README cites, not the page count of a later journal PDF. A source supporting a theorem does not by itself settle ownership; R01 was found by the separate ownership audit.

| Target | Text opened | Hypotheses and locator outcome |
|---|---|---|
| 0.4 | ST02 lines 330–337, Proposition 2.3, p. 9; lines 514–526, Lemma 3.1, p. 13; BR16 lines 377–392, p. 9 | Strong dual, convolution, coset direct sums and separate continuity agree. Compact-open freeness is an explicit supplier input; no joint continuity is asserted for noncompact G. |
| 0.7 | DLB17 lines 1153–1166, Lemma 5.9, pp. 28–29 | Compact-type W and continuous λ are retained. The product-over-cosets proof does not falsely make the noncompact function space compact type. |
| 0.8 | DLB17 lines 1167–1168, Lemma 5.10, p. 29 | The source states precisely the weak-null/null equivalence over a spherically complete field. It supplies no proof there; §0.8 gives a route using its named functional-analysis inputs. |
| 1.2 | EM17 lines 5886–5906, Definition 6.2.1 and Proposition 6.2.2, p. 117; ST03 lines 542–550, Lemma 3.9, p. 14, and 1416–1451, Theorem 6.6, pp. 35–36 | Strong admissibility uses an embedding in finitely many copies of C^an(H,E). The irreducibility argument distinguishes closed submodules from abstract submodules. The theorem starts on the cited p. 35. |
| 1.6 | ST01 lines 519–558, Proposition 3.4, pp. 13–14; EM17 lines 4370–4387, Proposition 4.2.10, p. 85; lines 6163–6172 and 6196–6203, Propositions 6.3.6 and 6.3.10, pp. 123–124 | Algebraic-isotypic decomposition and the smooth multiplicity spaces agree; admissibility is imposed where used. The broader split-reductive statement is distinguished from the supplied GL₂ case. |
| 1.8 | BR19 lines 395–447, Lemma 2.1.1 and proof, pp. 10–11 | Admissible endpoint modules, flat Banach stages and exact inverse limits are the needed inputs. The abstract D-module extension is shown coadmissible; its topology is not assumed in the Ext definition. |
| 3.7 | BCGP25 lines 1074–1088, Lemma 2.2.25, pp. 22–23; STACKS lines 730–731, Tag 079H | The generator uses the fixed cardinal bound; exact filtered colimits and a generating set give the Grothendieck category, then enough injectives. The Stacks tag is correct. |
| 4.2 | OS15 lines 280–365, §2.5, Definition 2.6 and Lemma 2.8, pp. 7–9 | The README deliberately requires membership in O before imposing the parabolic condition. This repairs the source's nonsplit-weight issue. Its algebraic weight lattice is attached to the group. |
| 4.6 | SCH11 lines 1787–1804, Theorem 4.10 and (4.40)–(4.42), printed p. 82 | The homology/cohomology conversion and nilradical twist agree. General split reductive Kostant theory is the explicit ALS.4.5 gap, not a claim that Schraen proves every generalization here. |
| 5.1 | BR16 lines 280–310, §2 equation (4), p. 8; lines 349–395, Lemma 2.2, pp. 9–10; EMJ2 lines 977–1004, Proposition 2.1.2, p. 21 | Right translation and f(pg)=p·f(g) agree; compact-type and admissibility hypotheses are retained. Tensor and dual comparisons use the named supplied function-space theory. |
| 8.6 | DING25 lines 1510–1524, Lemma 3.2, pp. 37–38 | The README corrects the torus, inverse-image label and inducing-weight sign. The corrected central weight and δ_B factor pass the explicit test below. |
| 8.9 | DING25 lines 1604–1636, Lemma 3.5 and (3.7)–(3.9), pp. 40–41 | Generic φ, dominant h and a length-one constituent are retained. The direction is extensions of π_alg by the constituent. The required Ext-vanishing input is §6.7. |
| 8.11 | DING25 lines 1637–1658, Proposition 3.6, p. 41, and Remark 3.9 | The map from additive torus characters is bijective onto the stated Ext group. Dimensions n(1+d_L), including n=1, agree. |
| 9.6 | DING25 lines 1858–1905, Proposition 3.12 and (3.28)–(3.30), pp. 46–47; lines 859–861, (2.21), p. 21 | Bijection, compatible-refinement square and surjectivity are supported. The omitted domain definition is R02. |
| 10.4 | DING25 lines 1974–1989, Proposition 3.16 and Remark 3.17, p. 49 | Locally σ-analytic characters, the fixed off-σ algebraic factor and the 2n-dimensional extension calculation agree. |

The manifest contains all 29 cited works: 26 certified entries and the three settled uncertified books listed below. No new key or fetch was needed. R03 concerns an existing entry, not a missing source.

### Adversarial mathematics

All 86 numbered targets and their 310 Check bullets were read. For unchanged text, the preceding review's actual computed rows remain evidence; its general claims of soundness were not treated as computations. Fresh calculations were made on the uncovered definitions, maps, conventions and interfaces. The table records the sampled targets, all headline families, the repaired targets and both mathematical findings; it is intentionally not a repeated 86-target catalogue. A boundary calculation is a falsification test, not a proof of the unrestricted theorem.

Standing-domain checks: p=2 and p=3 are allowed in the general analytic and GL_n layers; E is a nonzero finite extension of ℚ_p, so characteristic p, equal-characteristic DVRs and the zero ring do not satisfy the coefficient hypothesis. n=1 is included; n=0 is excluded from the GL_n application; endpoint parabolics explicitly require n≥2. Ramification changes d_L and embedding factors, not the normalization |ϖ_L|=p^(−f). Compactness, compact type, strictness, admissibility, splitting of the coefficient field and the cardinal bound were checked where invoked.

| Statement | Instances tried | Values on the two sides / wrong-model control | Result | Change |
|---|---|---|---|---|
| 0.1 restriction of scalars | L=ℚ_p(√p), p odd; trivial group | √p⊗1 maps to (√p,−√p); L-dimension 1 becomes ℚ_p-dimension 2. Trivial Lie algebra has dimension 0 and enveloping algebra E. | Agrees | None |
| 0.2 analytic action and boundedness | E=ℚ₂; scalar operators a∈ℤ₂; translation on C(ℤ_p,E) | sup_a\|ax\|=\|x\|, operator bound 1; operators 2^(−n) give 2^n at 1. The displayed continuous function has f(p^n)=p^n and zeros tending to 0, so cannot be analytic near 0. | Both positive and negative cases discriminate | None |
| 0.3 differentiation and dual convention | χ(x)=x^k; χ(x)=σ(x); GL₂ upper root | Derivative k versus 0 for a smooth character; σ-components (1,0), not (1,1); Ad(diag(p,1))e=pe. Dual line has χ⁻¹. | Signs agree | None |
| 0.4 convolution and freeness | Discrete S₃, H=C₂; G=ℚ_p, H=ℤ_p | δ_(12)δ_(23)=δ_(123), reversed product δ_(132); right-module rank 6/2=3. ℚ_p/ℤ_p gives infinitely many nonzero summands, not finite rank. | Noncommutative and noncompact tests agree | None |
| 0.5 integration | Trivial E; analytic line of ℤ_p | μ acts by μ(1); δ_a and δ_0 both act by 1. For χ(a)=(1+p)^a, derivative acts by log(1+p), δ_1 by 1+p. | No unjustified faithfulness | None |
| 0.6 and 1.3 duality headline | G=1; χ(x)=x | Finite-dimensional E^m goes to its m-dimensional dual and back; character becomes x⁻¹ then x. Zero goes to zero. | Variance correct | None |
| 0.7 matrix coefficient | A character line; λ=0; discrete infinite G | F_1(v)(g)=vχ(g); R_hF_1(v)=χ(h)F_1(v)=F_1(ρ(h)v). λ=0 gives the zero map. Functions on discrete G form a product, dual distributions a direct sum. | Equivariance and topology agree | None |
| 0.8 weak-null iff null | V=c₀(ℕ,E), e_n and p^n e_n | \|e_n\|=1 and the bounded functional Σx_i gives 1, so not weak-null. \|p^ne_n\|=p^(−n) and every bounded functional gives a_n p^n→0. | Both directions pass controls | None |
| 0.9 and 1.5 external tensor | E²,E³; zero factor; one-dimensional character factors | Dimensions 2·3=6 and 0·3=0; (g,h) acts by χ(g)ψ(h). Dual tensor has χ(g)⁻¹ψ(h)⁻¹. | External action and variance agree | None |
| 1.1 noncompact coadmissibility | Discrete G=ℤ, H=1 | D(H)=E; coadmissibility means finite dimension. E qualifies, E[ℤ] has infinite E-dimension and fails. | Compact-open test constrains the object | None |
| 1.2 strong admissibility / irreducibility | C^an(H,E); zero; Steinberg | Regular dual is D(H), free rank 1. Zero embeds in zero copies but is not irreducible. In Steinberg, the continuous functional f(0)−f(∞) has nonopen torus stabilizer, distinguishing the smooth dual from the full dual. | No abstract-simplicity overclaim | None |
| 1.6 locally algebraic | Sym²(E²); trivial smooth space; infinite trivial c₀ | Upper unipotent sends e₁e₂ to e₁e₂+t e₁², a nonconstant polynomial orbit. Trivial orbit is constant. Infinite trivial c₀ has infinite-dimensional H-invariants, so fails admissibility. | Algebraic/smooth/admissible distinctions agree | None |
| 1.8 Ext¹ headline | G=L×, a character self-extension | ρ(g)=χ(g)·[[1,ψ(g)],[0,1]] is multiplicative exactly when ψ(gh)=ψ(g)+ψ(h); ψ=0 splits, a nonzero additive ψ does not. | Extension direction and additive parameter correct | None |
| 1.9 dual numbers / universal extension | Extension of V by V; U=0 | ε=i∘q has ε²=0, ker ε=im ε=i(V). U=0 gives the extension V₂ itself, with zero quotient. | Neither arbitrary ε nor reversed kernel | None |
| 1.10 algebraic Ext | Unequal central infinitesimal weights; GL₂ fixed central character | Distinct central scalars force Ext=0. For trivial smooth coefficients the fixed-central degree-one group is 0, while unrestricted smooth torus/centre directions need not vanish. | Fixed-centre hypothesis matters | None |
| 2.3–2.5 Pan headline | G=1; G=ℤ_p, trivial B=E; tensor M=c₀(ℕ,ℚ_p) | G=1 gives R⁰LA(B)=B, Rⁱ=0 for i>0. At successive ℤ_p radii y=pz gives coefficient gain p^k, absorbing antidifference denominators bounded by p·p^(v_p(k+1)), also at p=2. E⊗̂M=c₀(ℕ,E). | Strong transition vanishing passes; inherited explicit antidifference calculation retained | None |
| 2.4 exactness | Diagonal map c₀→c₀, x_n↦p^n x_n | Image dense but proper: (p^n)_n has only preimage (1)_n∉c₀. Cokernel is not Hausdorff Banach. | Strictness cannot be dropped | None |
| 3.2–3.3 analytic solid action | Character T↦T^k; G=1 | Coaction v↦v⊗T^k has counit v and comultiplication v⊗T^k⊗T^k; zero coaction has counit 0 and fails. For G=1, Hom(E,V)=V=E⊗V. | Comodule laws fix the action | None |
| 3.5–3.6 smooth solid objects | Algebraic character x^k, k≠0; finite quotient ℤ/p^r | Derivative k≠0 excludes smoothness; after inverse twist derivative 0. A finite-quotient action has open kernel and zero Lie action. | Analytic and smooth notions separated | None |
| 3.7 Grothendieck headline | M=1, finite profinite set S with k points; M=C₂ | Hom(E[S],V)=V^k. Hom_M(E[M],V)=V, not V^M. The κ-bound makes the family of generators a set. | Generator and size controls agree | None |
| 3.8–3.9 analytic-vector comparison headline | Character line; regular C(ℤ_p,E) | Invariant function is f(g)=χ(g)v; right translation gives χ(h)v, not χ(h)²v. Regular coinduced coefficient has H⁰=E and positive cohomology 0; its analytic vectors are C^la. | Output action and derived comparison agree | None |
| 3.10 integrable Lie action | Finite-dimensional algebraic module; finest-topology sl₂ Verma module | Finite module has a constant Banach filtration. Verma lowering vectors f^nv are linearly independent for all n, so no nonzero finite-dimensional stable Banach stage exists. | Negative case excludes a false integration | None |
| 4.1 highest-weight descent | GL₂/ℚ₃, λ=(2,0); one-dimensional torus | L(2,0)=Sym², dimension 3 before and after scalar extension; weights (2,0),(1,1),(0,2). Torus L(μ)=k_μ has dimension 1. | Same objects as main's §9A producer | R01 |
| 4.1 central semisimplicity | Abelian Lie algebra acting by a 2×2 nilpotent Jordan block; action with polynomial X²−3 over ℚ₃ | Jordan kernel has dimension 1 and no invariant complement. The X²−3 module is simple but not triangularizable over ℚ₃. | Native triangularizable-centre theorem is narrower; do not delete the nonsplit-centre extension as a supposed exact duplicate | None beyond R01 |
| 4.2 parabolic O | Torus over ℚ₃ acting on ℚ₃[t]/(t²−3); SL₂ versus PGL₂ | Module dimension 2, ℚ₃-weight-space sum dimension 0: excluded from O. Standard sl₂ weights ±1 lie in SL₂'s lattice but not PGL₂'s 2ℤ lattice. | README repairs source and retains group lattice | None |
| 4.3–4.5 generalized Verma / duality / multiplicities | GL₃ weight (2,0,1); standard GL₂; sl₂ Verma weight 0 | Simple-coroot pairings (2,−1) give maximal parabolic {α₁}. BGG dual retains highest weight (1,0), ordinary dual gives (0,−1). M(0) has two simple factors, each multiplicity 1. | Parabolic, dual and length controls agree | None |
| 4.6 Kostant homology | GL₂, V=Sym^k, lower and upper root | Lower H₀ weight (k,0), H₁ weight (−1,k+1); upper H₀ weight (0,k), H₁ weight (k+1,−1). At k=0 the H₁ weight is the root itself. | Homology twist has correct sign | None |
| 5.1 induction | P=G; a GL₂ algebraic tensor factor | Evaluation at 1 identifies Ind_G^G U with U. For W standard, f(p)⊗p·e₁ has factor p at diag(p,1); using f(p)⊗e₁ would omit it. | Equivariance/tensor comparison agrees | None |
| 5.3 torus Ext | n=2,d_L=2; n=0 | Total additive-character dimension 2(1+2)=6; smooth dimension 2, determinant subspace dimension 2+2=4. Rank zero has dimension 0. | Smooth/determinant/full spaces distinct | None |
| 5.4–5.5 spectral-sequence headline | One-dimensional root, trivial coefficient; G=T | Root homology degrees 0 and 1 have weights 0 and the root. For N=1, H₀(V)=V, higher H_b=0, so the spectral sequence has only b=0 and recovers torus Ext. | No misplaced determinant twist or spurious row | None |
| 6.1–6.6 Orlik–Strauch headlines | GL₂ dominant input; zero smooth argument; P=G | Dominant GL₂ Verma has length 2, reflected simple has length 1; exact contravariance reverses the short exact sequence. Smooth argument 0 gives F(M,0)=0 for every M, so the recovery theorem needs nonzero arguments. P=G gives the stated algebraic-dual tensor. | Exactness, irreducibility and recovery scopes agree | None |
| 6.7 long-length Ext vanishing | GL₂ and GL₃ Weyl groups | S₂ has no length≥2 permutation, so the target is inapplicable there; S₃ has two length-2 elements, beyond the socle and adjacent layer. The cited Lemma 2.26 supplies their Ext¹ vanishing. | Boundary does not replace the general theorem | None |
| 7.1 and 7.4 adjunction headline | GL₂, m=diag(p,1), trivial representation | [N₀:mN₀m⁻¹]=p, δ_B(m)=p⁻¹, averaged operator p⁻¹·p=1. Thus induction parameter χ is paired with upper-Jacquet character χδ_B. | Same normalization in supplier and consumer | None |
| 7.5–7.6 adjunction consequences | Torus character over ℚ₃(√3) restricted to ℚ₃ | Multiplication by √3 has polynomial X²−3 and no ℚ₃ eigenline, but gives a two-dimensional coefficient representation. | Finite-dimensional U is needed before extending coefficients to a character | None |
| 8.1 and 8.5 labels | n=3,w=(123),i=1 | w⁻¹{1}={3}, whereas w{1}={2}; the former is constant on the relevant left coset. θ=(0,−1,−2). | Inverse permutation convention correct | None |
| 8.6 Jacquet / closed induction | n=2,h=(1,0),λ=(1,1) | s·λ=(0,2), central exponent 2; the erroneous negative exponent gives −2. Upper Jacquet adds δ_B=(\|·\|,\|·\|⁻¹), whose central exponent is 0. | Corrected source formula passes | None |
| 8.7 amalgam | n=2 and n=3, d_L=1 | π₁ lengths 1+(2²−2)=3 and 1+(2³−2)=7; each PS₁ has length n=2 or 3. | Constituent counts agree | None |
| 8.9 extension lines | Nonzero triangular character deformation versus split deformation | Hom to the character has dimension 1 in the nonsplit 2×2 extension, dimension 2 in the split case; a length-one constituent contributes Ext¹ dimension 1. For n=1 there is no such label. | Nonsplit and index hypotheses discriminate | None |
| 8.11 ζ_w headline | n=1,d_L=2; n=2,d_L=1,2 | Source and target dimensions are respectively 3,4,6: n(1+d_L). | Bijection compatible with boundary and ramification degree | None |
| 8.12 Ext dimension headline | (n,d_L)=(2,1),(3,1),(2,2) | n+(2^n−1)d_L=5,10,8; also (n+d_L)+(2^n−2)d_L=5,10,8. The erroneous n−1-element label set would give 4 rather than 5 for (2,1). | Full subset set required and present | None |
| 9.4–9.5 parabolic map | n=3, blocks (2,1); three extensions dim A_i=1,dim B_i=2 | Ext dimension (2+3d_L)+(1+d_L)=3+4d_L, hence 7 at d_L=1. First tensor-filtration kernel dimension 2+2+2=6, reversed expression gives 4+4+4=12. | Corrected kernel and linearity agree | None |
| 9.6 parabolic bijection headline | P=B; P=G; blocks (2,1),n=3,d_L=1 | B gives n(1+d_L) on both sides; G gives the identity; (2,1) gives 7=7. But the Weyl-compatible character domain has dimension 5, not global 4 or full 6. | Bijection supported; missing domain is material | R02 |
| 9.7 endpoint amalgamation | n=3,d_L=1 | Label sets {1},{2},{1,2} and {3},{1,3},{2,3} partition six labels; Ext dimensions 7+7−4=10. | Intersection and sign b↦(b,−b) agree | None |
| 10.1 σ-analytic category | Two embeddings σ,τ; χ=τ; off-σ nilpotent block | Differential vector (0,1) is not σ-analytic. A nonzero off-σ Jordan block cannot be an algebraic torus action, even with integral eigenvalue 0. | Semisimplicity/algebraicity is not replaced by eigenvalues | None |
| 10.3–10.4 σ-extension headline | n=3; n=2,d_L=2 | 2n=(n+1)+(n−1)=6=4+2. In rank 2 each σ-space has dimension 4, while the full character space has dimension 6. | Embedding restriction agrees | None |
| 10.5 embedding decomposition headline | n=2,d_L=2 | Full Ext dimension 8; quotient by dim Ext_g=2 has dimension 6. Two σ-summands each have dimension 5−2=3; 3+3=6. | Quotient is essential | None |
| 10.6–10.7 σ-parabolics | n=3, blocks (2,1); rank-two endpoints | σ-parabolic dimensions (2+3)+(1+1)=7; rank-two endpoint Ext sum 4+4−3=5. | Same restriction and amalgamation as earlier layers | None |

### Pinned library audit and Lean acceptance file

The following declarations were opened at the pins, not inferred from a search hit. All paths in this table are library-relative. The README's backticked identifiers refer to these imported objects; it attributes no undeclared backticked Lean name to this roadmap.

| Declaration(s) | Pinned file and line | Comparison made |
|---|---|---|
| `BarrelledSpace`, `BaireSpace.instBarrelledSpace` | `Mathlib/Analysis/LocallyConvex/Barrelled.lean:90`, `:122` | Defined through lower semicontinuous seminorms over a nontrivially normed field; not restricted to ℝ or ℂ. |
| `WithSeminorms.banach_steinhaus`, `PolynormableSpace.banach_steinhaus` | Same file `:164`, `:192` | Pointwise boundedness and equicontinuity are native. The O_E-lattice comparison remains the declared gap. |
| `LocallyConvexSpace` | `Mathlib/Topology/Algebra/Module/LocallyConvex.lean:51` | Scalar `PartialOrder` is part of the definition; it is not the nonarchimedean lattice definition. |
| `DualNumber`, `DualNumber.eps` | `Mathlib/Algebra/DualNumber.lean:46`, `:50` | Actual trivial square-zero extension, not a placeholder parameter. |
| `UniversalEnvelopingAlgebra`, `.lift` | `Mathlib/Algebra/Lie/UniversalEnveloping.lean:65`, `:92` | Native enveloping algebra/universal map; no separate carrier is planned. |
| root `Ext`; `CategoryTheory.Abelian.Ext`; `HasExt` | `Mathlib/CategoryTheory/Abelian/Ext.lean:41`; `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118`, `:55` | Projective-resolution Ext and small shifted-derived-Hom Ext are distinct valid interfaces. `HasExt` is a size condition, not local analytic admissibility. |
| `ModuleCat`, `TopRep`, `continuousCohomology` | `Mathlib/Algebra/Category/ModuleCat/Basic.lean:59`; `Mathlib/RepresentationTheory/Continuous/TopRep.lean:31`; `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:131` | ModuleCat is algebraic. TopRep bundles continuous linear operators; it does not supply compact type, admissibility or analytic orbit maps. |
| `LieGroup`, `IsUltrametricDist` | `Mathlib/Geometry/Manifold/Algebra/LieGroup.lean:72`; `Mathlib/Topology/MetricSpace/Ultra/Basic.lean:47` | Neither adds a locally analytic representation category; ultrametricity alone does not add completeness or separation. |
| `TauCeti.completedGroupAlgebra` | `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145` | Integral completed group algebra is supplied; it is not D(G,E). |
| `TauCeti.AnalyticStage`, `TauCeti.LocallyAnalytic` | `TauCeti/NumberTheory/Padics/Distribution/AnalyticStage.lean:107`; `TauCeti/NumberTheory/Padics/Distribution/LocallyAnalytic.lean:45` | Banach coefficient stages on ℤ_p and an algebraic Module.DirectLimit; the latter has no topology. They do not state the noncompact distribution/duality headlines. |
| `TauCeti.VermaModule`, `TauCeti.irreducibleQuotient` | `TauCeti/Algebra/Lie/HighestWeight/Verma.lean:195`, `:525`; hypotheses at `:140` | Split Cartan/chosen base and Killing Lie algebra over a characteristic-zero field. These are not all reductive parabolic category O. |
| Central complete reducibility | `TauCeti/Algebra/Lie/Reductive/CompleteReducibility.lean:54`, `:107` | Scalar centre works over the base field; semisimple central operators require triangularizability. This does not erase the nonsplit-centre extension in §4.1(iii). |
| `CondensedMod.IsSolid` | `Mathlib/Condensed/Solid.lean:77`, `:84` | Underlying-integer solidity is not the analytic ring E_■ with p-adic topology. The file itself marks the general-ring issue. It does not make the Layer 3 headlines statable. |

Object searches included coadmissibility, Fréchet–Stein algebras, distributions, analytic vectors, category O, Verma quotients, semisimple central action, solid coefficients and group algebras. The exact existing common-domain highest-weight producer is R01; merely narrower library statements were not reported as duplicates.

The pins were Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The authorized `lake env lean` invocation on `packages/LocallyAnalyticRepresentationsOfLocalGroups/Suggested.lean`, run from the pinned content checkout, exited **0 with no output and no warnings**. It has one `import Mathlib`, one module docstring and the required namespace. There are zero definitions, instances, theorem declarations and sorried examples. Consequently the exhaustive one-tactic probe has zero inputs and the exhaustive `#check @name` comparison has zero inputs; no silently lost declaration binders or padding can occur. No Tau Ceti object-file build was necessary.

Headline inventory from the Summary, checked against the module docstring:

| Headline | Docstring coverage and why no signature is present |
|---|---|
| Noncompact distribution action and Schneider–Teitelbaum anti-equivalence; admissible Ext¹ classification | Layers 0–1 bullet: missing topologized general analytic functions, D(G,E), locally analytic representations and coadmissibility. |
| Strong LA-acyclicity of admissible Banach representations | Layer 2 bullet: missing analytic stages on uniform groups and the admissible Banach category. |
| Smooth solid Grothendieck category and derived analytic-vector comparison | Layer 3 bullet: missing p-adic analytic ring E_■, its module category and solid group rings. |
| Schraen spectral sequence | Layers 5–6 bullet: missing parabolic induction and topological unipotent homology. |
| Orlik–Strauch exactness, irreducibility and Jordan–Hölder series | Same bullet: missing parabolic category O and the functor's representation carriers. |
| Emerton and Breuil adjunctions | Layer 7 bullet: missing Jacquet functor, closed induction and very strong admissibility. |
| ζ_w bijections and dim Ext¹ = n+(2^n−1)d_L | Layers 8–10 bullet explicitly names these and the absent π_alg, π₁ and Ext carriers. |
| Parabolic ζ_(F_P) bijections and decomposition over embeddings | Same bullet explicitly names both families and their missing carriers. |

No headline was replaced by a free predicate, a trivial scalar identity or an arbitrary extension-space stand-in. The native Ext notation alone cannot state these theorems without their missing representation objects.

### Ownership, current suppliers and order

The board index, the supplied open-head index and main were inspected. Main has no second copy of this roadmap. The overlap report has no competing change, dropped cited identifier or open-revision-only citation for this package. Its former LR numbering and the Layer 7 renumbering table preserve the older consumer references. Main's LieHighestWeight also has explicit old-layer-to-native-owner mappings; those mapped identifiers were not reported as nonexistent.

The current supplier resolutions are below. A line number in a CLI-fetched file is given as its original README line, excluding the CLI's added provenance header.

| Supplier and resolved file | Sections read and ownership conclusion |
|---|---|
| `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md`, #1312, lines 206, 749, 1587 | §0.1 owns compact distribution/coadmissibility and Banach duality; §§2.4,4.8 own the GL₂ locally algebraic and principal-series special cases. This package imports those and states broader variants. |
| `TauCetiRoadmap/LocallyAnalyticDistributions/README.md`, §0.0 line 892 and §0.2 line 1082 | Locally convex limits, strictness, compact-type duality and tensor comparison, Hahn–Banach and open mapping. The lattice comparison and strict tensor exactness are precisely named gaps. |
| `packages/LocallyAnalyticDistributionsPartII/README.md:141`, `:164`, `:248` | §§1.1,1.2,2.5 supply the enveloping-algebra embedding, crossed product and Arens–Michael envelope. The resolver's single missing-name lead is refuted by this board package. |
| `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md`, lines 151,178,210,304,334 | §§0.1–0.3,0.6–0.7 contain uniform groups, finite-index freeness, coordinates and saturated valuations, including the dyadic normalization. |
| `TauCetiRoadmap/CompletedCohomologyPartII/README.md`, #1035, lines 184,242 | F.1 supplies unitary Banach foundations and F.4 analytic vectors/derived analytic vectors. The latter's invariant-function action agrees with §3.8; Pan's stronger acyclicity is an additional theorem here. |
| `TauCetiRoadmap/OverconvergentAutomorphicForms/README.md`, #1422, line 315 | §0.6 supplies character spaces, finite-slope parts and the general Jacquet functor with averaged Hecke operators. The index-p normalization agrees with Convention 5. |
| `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md`, #1688 | SR.0.1,0.2,0.4,0d.1,0d.2,2.1,2.2,2.3,3.1,3.2,3.4 occur at lines 589,668,870,1676,1738,1917,2046,2206,2572,2711,2958. All the named smooth targets resolve. The generic/Jacquet/finite-length statements at issue are over ℂ; the finite-E extensions remain declared contracts. |
| `TauCetiRoadmap/ReductiveGroupsPartII/README.md`, main | RG2.0.2 line 590, RG2.4.2 line 5711, RG2.4.4 line 6213 contain the named analytic-chart, topology, Iwahori and Iwasawa targets. |
| `TauCetiRoadmap/ReductiveGroups/README.md`, main | Layers 1,2,4,7,8 and §§8.1,10B resolve at lines 1275,1499,2112,2821,3687,3689,5378. Additional §9A split-field descent, line 4373, is the ownership overlap R01. |
| `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md`, main | Scope lines 11–70 and old-layer mapping lines 74–86 resolve former Layers 4–5 to native declarations. Current Layers 3,7,9 and the native contracts distinguish supplied Verma, classification and Harish–Chandra theory from new comparisons. No missing-id finding is inferred from renumbering. |
| `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md:3594` | ALS.4.5 is restricted to a splitting field of a Weil restriction from a number field. The arbitrary split reductive extension is the declared Kostant gap. |
| `TauCetiRoadmap/VStackSheavesAndLisseCategories/README.md:733` | VS2.2, Solid nonarchimedean coefficients, constructs E_■ and its complete module category; it explicitly leaves classical locally convex comparison to its consumer. VS2.1 supplies derived solid tensor. |
| `TauCetiRoadmap/AdicSpacesPartIII/README.md:10053`, `:10126`, `:10139` | R3.4 defines quasi-Stein spaces and gives Theorems B and A, with dense restriction and coherent coefficients. |
| `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:909` | §1.7 compares integral measures with the already native completed group algebra; no second group-algebra carrier is commissioned. |

The three main-roadmap forms inspected for house style were ReductiveGroups, LieHighestWeight and PadicMeasuresIwasawaAlgebras. Current-head ownership searches also separated the later RelativeFarguesFontainePartII §8.4 general complete-field Fréchet–Stein extension from the earlier discretely-valued supplier contract; it is not used as an upward supplier here.

All nine gap slugs occur both under the package's Exact supplier contracts and in `packages/LocallyAnalyticRepresentationsOfLocalGroups/design/plan.json`. Each names an earlier owner; none has supplier `none`.

| Gap(s) | Why this is a specified contract rather than an unowned prerequisite |
|---|---|
| barrelled-banach-steinhaus | LocallyAnalyticDistributions §0.0 supplies the lattice/seminorm comparison and additional barrelled spaces; Mathlib's Banach–Steinhaus itself is explicitly excluded from the requested work. |
| compact-type-tensor | Same supplier; requests functoriality and exactness on strict sequences, beyond its tensor comparison. |
| kostant-split-reductive | ArithmeticLocallySymmetricSpaces ALS.4.5; exact enlargement from its Weil-restriction domain. |
| generic-principal-series-finite-coefficients; principal-series-jacquet-finite-coefficients | SmoothRepresentationsOfLocalGroups SR.3.1 and SR.2.2; characteristic-zero E, explicit generic ratios, absolute irreducibility, rational intertwiners and the correct opposite-Borel twist. |
| finite-length-finite-coefficients | SmoothRepresentationsOfLocalGroups SR.3.1; finite E and scalar-extension compatibility, not another proof of its complex theorem. |
| ordered-character-map | SmoothRepresentationsOfLocalGroups SR.3.2; ordered twist tori, base points, the typed permutation square and injective Bernstein-centre tangent map, with a specified image for deformed inductions. |
| frechet-stein-general; radius-algebras | PadicLocalLanglandsForGL2Qp §0.1; general left Fréchet–Stein module theory over discretely valued fields and the specific saturated-coordinate Banach stages. These are two coherent interfaces, not unrelated unspecific prerequisites. |

I read every Needs line and the layer dependency summaries. Dependencies on later-numbered compatibility statements are distinguished from inputs to their definitions; in particular §0.3(v) is explicitly a later compatibility proved from §0.5. No new upward edge or cycle was found. The required mechanical command, without modifying the order or tooling, returned:

    depcheck: 223 roadmaps, 1983 edges, 0 problem(s)

There was no UPWARD, CYCLE or moved line. R01's repair cites a roadmap already on main and introduces no upward edge.

Overlap check: read PadicHodgeParametersInLocallyAnalyticRepresentations (#2257), CompletedCohomologyAndLocalGlobalCompatibility (#1270), PadicLocalLanglandsForGL2Qp (#1312), SmoothRepresentationsOfLocalGroups (#1688), and TriangulineVarietyAndItsLocalModel (#1829), all entries of the three closest-roadmap lists (the latter two lists are empty). Owners: local analytic principal series, Orlik–Strauch constituents and Ding's representation-side Ext are this roadmap's, imported by #2257 and #1829; Galois comparison is #2257's, trianguline geometry #1829's; arithmetic completed cohomology is #1270's; compact distributions/Banach duality and GL₂ correspondence are #1312's; smooth induction/Jacquet/Bernstein theory is #1688's. The separate main-roadmap overlap is R01.

### Shape, expression and source independence

There are 11 mathematical layers, each ending in Examples and Dependencies; 86 numbered targets, each with Needs and at least three Check bullets (310 bullets total). Definition blocks retain their prose API. Source locators and hypotheses were retained in the sampled and repaired material. The material missing from the interface in §9.6 is R02. There are no algorithms, sorry-defined data, `set_option`, admitted examples, route-only Lean stand-ins, machine paths, pull-request numbers or job commentary in the author README/Lean. The former-numbering table is a citation-preserving map, not a target catalogue. Metadata's topic is `math.RT`.

For wording I compared all 15 sampled targets, the seven repaired passages and three further distinct passages: §0.3's differential/action route against ST02 lines 343–351 and BR16 lines 306–310; §1.9's construction against DING25 lines 1458–1465; §3.2's analytic-comodule description against BCGP25 lines 1020–1043. This gives 25 distinct roadmap passages against 15 sources. No copied nonformula sentence, clause-by-clause translation, table, figure or exercise list was found. Standard names, forced hypotheses and formulae were distinguished from source expression.

A reproducible locator census counts one source occurrence per balanced parenthetical citation containing a locator, omitting the References list and deduplicating a source within one such citation. There are 150 citation groups and 189 source occurrences: DING25 40, OS15 16, ST03 15, BR16 14, EM17 13, SCH11 12, EMJ2 and RJRC22 11 each, BCGP25 10, and 47 among the remaining sources. Thus DING25 is the largest share by this explicit convention; an author mention without a locator is not counted as another locator.

DING25's contents were opened at DING25 lines 20–31: §2 is Hodge deformation theory, §3.1 locally analytic representations, §3.2 Hodge-parameter comparison, and §4 local–global compatibility. Layers 0–7 here are independent multi-source prerequisites; Layers 8–10 divide only §3.1 by the representation-theoretic constructions the endpoints need. They do not reproduce a run of that source's chapters. The order is forced by the actual edges 9.1→8.7/8.1, 9.2→8.5, 10.2→8.7/9.3, 10.6→9.6 and 10.7→9.7. The Galois and global material remains with other named owners.

Source independence: 25 passages compared with 15 sources, no copied prose or reused source artefacts found; largest share DING25, 40 of 189 parenthetical source-locator occurrences; contents compared with DING25: independently organized by the stated dependencies.

## Not verifiable

- SCHN11, NFA02 and HUM08 remain settled uncertified books. Their text was not available for checking the cited pages (analytic charts, functional analysis and the category-O background). They were not requested again or entered as new missing references. Open articles and the explicit low-rank calculations give the stated partial checks, not certification of those books.
- Source checks certify the cached versions named in the README. No separate full comparison of the cached DING25 preprint against every page of the final published version was made; the locators reviewed here explicitly use arXiv v2 pages.
- The checks do not assert that the nine supplier contracts have already been implemented. They are precise declared obligations, and acceptance after repairs would remain conditional on them.

## Source issues

- **Misprint** in DING25 at the paragraph after Proposition 3.1 and Lemma 3.2, arXiv v2 p. 37 (DING25 lines 1505–1510): the source says the constituent label is the forward image under w; it should be the inverse image, constant on the relevant left coset; affects a stated result.
- **Misprint** in DING25 at (3.1) and Lemma 3.2, arXiv v2 pp. 37–38 (DING25 lines 1509–1522): the source says the inducing weight is the negative dot-reflected weight; it should be positive, while the category-O input keeps the negative sign; affects a stated result.
- **Misprint** in DING25 at Lemma 3.2(1), arXiv v2 p. 37 (DING25 line 1511): the source says the Hom is over T(ℚ_p); it should be over T(K), the local field used for the group; affects a stated result.
- **Misprint** in DING25 at (3.12) and (3.15), arXiv v2 pp. 41–42 (DING25 lines 1662,1686): the source says subsets are drawn from n−1 indices; it should be all n indices, giving the stated dimension and all constituents; affects a stated result.
- **Misprint** in DING25 at §3.1.4, arXiv v2 p. 48 (DING25 lines 1949,1955): the source says the locally algebraic subrepresentation is indexed by λ; it should be indexed by h, consistently with its definition; affects nothing.
- **Error** in DING25 at the construction between (3.25) and (3.26), arXiv v2 pp. 45–46 (DING25 lines 1832–1841): the source says the first tensor-filtration kernel has one algebraic factor and all other full factors; it should have one full factor and all other algebraic factors; affects the proof.
- **Error** in OS15 at §2.5 after Example 2.7, p. 8 (OS15 lines 315–325): the source says its three parabolic conditions imply membership in O over the finite coefficient field; it should additionally require split Cartan weights, or define the category inside O; affects a stated result.
- **Misprint** in DLB17 at the proof of Lemma 5.9, p. 29 (DLB17 lines 1161–1162): the source says W is Fréchet in the transposed continuity argument; it should say W′, the target of the transposed map; affects the proof.
- **Gap** in DLB17 at Lemma 5.10, p. 29 (DLB17 lines 1167–1168): the source says weak convergence of sequences equals convergence over a spherically complete field without proof; it should supply the functional-analytic justification; affects the proof.
- **Gap** in PAN22 at Corollary 2.2.4, p. 14 (PAN22 lines 590–598): the source says the tensor-cohomology identity for admissible B gives the analytic-vector claim; it should justify the application to B⊗̂C^an(G_n,ℚ_p), for example by bounded lifting of null families; affects the proof.
- **Misprint** in BCGP25 at Definition 3.4.2(1), p. 53 (BCGP25 line 2448): the source says transition equivariance uses a map from G_r to G_(r′) for r≤r′; it should use restriction along the inclusion G_(r′) into G_r; affects nothing.

## For the human reviewers

- **Scope.** The general-root-system irreducibility branch retains p>3 outside type A (`packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:1013`; OS15 lines 120–122). The earlier disposition of this restriction is unchanged; GL_n includes all primes.
- **Licence.** EMJ2, OR19 and BCGP25 are cited as preprints/author manuscripts rather than journal versions. Their legal source locations are recorded; no source prose, tables or figures were reused.
- **Not tested.** SCHN11, NFA02 and HUM08 remain unavailable settled uncertified texts. DING25, the largest source by locator share, and its contents were available and checked.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "21aae7e441a9abde07c87e1c97f0df6e15a4a07e", "job": "REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~8", "model": "gpt-6-astra", "worker": "chris-4"} -->
