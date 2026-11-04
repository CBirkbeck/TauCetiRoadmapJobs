<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/971#issuecomment-6397988855 -->
Red team round 1 pass a (codex) of d2c2d15

Verdict: needs_changes

1. **F01** (P3) The identity-duality Check needs n = 1

   **Location:** `packages/ClassicalAdicEtaleCohomologyPartII/README.md:205`: “For f=id and A=B=O_Cᵃ/p, both sides are O_Cᵃ/p in degree zero”.

   **Claim:** This Check is made in §0.3 over R=O_C/pⁿ, n≥1, without restricting n.

   **Witness:** At n=2 put M=O_C/p. Its free R-resolution has differential p in every degree. Applying Hom_R(−,M) makes every differential zero: Ext¹_R(M,M)=M, whose almostification is nonzero.

   **Exact repair text:** “For n=1, f=id and A=B=O_Cᵃ/p, both sides are O_Cᵃ/p in degree zero and the comparison sends 1 to 1. For n=2 and the same A,B, both sides instead have H¹=O_Cᵃ/p.”

   **Retest:** Over R=O_C/p the unit is free and higher Ext vanishes. Over O_C/p² the revised Check retains the nonzero degree-one group.

2. **F02** (P3) Dimension zero does not normalize every trace to one

   **Location:** `packages/ClassicalAdicEtaleCohomologyPartII/README.md:515`: “For d=0 all comparison and trace maps send 1 to 1.”

   **Claim:** Dimension zero alone forces the finite étale trace of the unit to equal one.

   **Witness:** The split two-point cover of Spa C has d=0 and trace (x,y)↦x+y. Its unit (1,1) maps to 2≠1, including over C of residue characteristic 2.

   **Exact repair text:** “For d=0 on the identity point map, the comparison and trace maps send 1 to 1. On a split degree-r finite étale cover, the trace sends the unit to r and a single component unit to 1.”

   **Retest:** r=1 gives 1; r=2 gives 2 integrally and 0 modulo 2, agreeing with §§1.7 and 2.8.

3. **F03** (P3) The Hom proof points to the source's reversed boundedness order

   **Location:** `packages/ClassicalAdicEtaleCohomologyPartII/README.md:179`: “Use the boundedness order in AC Lemma 4.9.7(2).”

   **Claim:** The cited printed boundedness order supplies §0.2's Hom assertion.

   **Witness:** AC line 4852 puts the first argument in D⁺ and the second in D⁻. With F=O_C and G having O_C in every negative degree, RHom(F,G)=G is not bounded below.

   **Exact repair text:** “Use AC Corollary 4.9.6, pp.112–113, and the almostification comparison in the proof of Lemma 4.9.7; read the first argument as bounded above and the second as bounded below, correcting the reversed signs in Lemma 4.9.7(2).”

   **Retest:** F=O_C and G∈D≥0 give RHom(F,G)=G∈D≥0; the negative-tail G is excluded from the corrected hypothesis. The target at line 177 already has the correct order.

4. **F04** (P3) The regular-module Check needs a finite group

   **Location:** `packages/ClassicalAdicEtaleCohomologyPartII/README.md:888`: “For the regular induced module O[G]⊗_O M, homotopy invariants and orbits are each M”.

   **Claim:** §4.4 defines these functors without requiring G finite, and applies the induced-module identification without that restriction.

   **Witness:** On the point site take G=ℤ and M=O_C/p. A translation-invariant finitely supported sequence is zero, so H⁰(G,M[G])=0, whereas H₀(G,M[G])=M≠0, also after almostification.

   **Exact repair text:** “For finite G and the regular induced module O[G]⊗_O M, homotopy invariants and orbits are each M. For infinite G=ℤ and nonzero M, the regular induced module has zero ordinary invariants but coinvariants M; induction cannot be substituted for coinduction.” Apply the same finite-group qualification to the supplier-contract example at line 123.

   **Retest:** For S₃, invariant coefficient vectors are (m,m,m,m,m,m) and coinvariants identify the six basis positions, giving M on both sides. For ℤ only the coinvariant calculation persists.

5. **F05** (P3) Two proof inputs lack their exact parent citations

   **Location:** `packages/ClassicalAdicEtaleCohomologyPartII/README.md:897` and `:1144`: “its finite cohomological dimension”; “its restriction to every étale test scheme is the cohomology comparison”.

   **Claim:** The listed parent sections supply the geometric bound used to commute unbounded bar colimits and the absolute affinoid comparison used in the full-faithfulness proof.

   **Witness:** Z line 3297 requires ordinary étale cohomological dimension; Han line 956 separately uses absolute affinoid comparison. Their existing owners are `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:5133` (§11.2) and `:961` (§2.5), outside the cited sections.

   **Exact repair text:** Add to the parent supplier contract: “Section 2.5, sheaf-comparison-3-2-9 (`AdicSpace.henselianComparison_bijective_of_spec`), supplies absolute affinoid comparison for arbitrary torsion sheaves. Section 11.2, `ordinary_etale_cohomological_dimension`, supplies the bound for arbitrary p-primary torsion sheaves.” Add §11.2 to §4.5's Needs and §2.5 to §7.2's Needs. In §7.2's proof explicitly combine the §2.5 absolute comparison with the relative direct-image comparison before applying adjunction.

   **Retest:** For a d-dimensional affinoid over C the former bound is 2d for arbitrary p-torsion sheaves, including all bar terms; §0.4's bound d is only for its particular nearby-cycle object. For Z=Spec A, the relative identity comparison alone is tautological, while §2.5 supplies the required equality of scheme and analytic cohomology.

6. **F06** (P2) The characteristic-p root duality is a missing statable headline

   **Location:** `packages/ClassicalAdicEtaleCohomologyPartII/Suggested.lean:14` and `:29`: “its characteristic-p calculation is not substituted for the full integral headline”. The independent characteristic-p theorem is explicitly targeted at `README.md:733`.

   **Claim:** The missing integral projection trace justifies stating no root-algebra duality theorem at the pins.

   **Witness:** Native carriers already include `MvPolynomial`, `Ideal.Quotient`, `iterateFrobenius` (`Mathlib/Algebra/CharP/Lemmas.lean:327`), `ModuleCat.restrictScalars` (`Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean:85`), and `CategoryTheory.Abelian.Ext` (`Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118`). Z line 2834 states the separate characteristic-p theorem.

   **Exact repair text:** “State the characteristic-p part of §3.7 as `monomial_root_duality`, retaining the full integral theorem in the unstatable list. For every prime p and n,m∈ℕ, define A=𝔽_p[t₀,…,tₙ]/(t₀⋯tₙ), q=pᵐ and A_m as A restricted along the m-fold Frobenius, on native polynomial-quotient and module carriers. State existence of an A-linear τ whose value on each monomial tᵉ is t^(e/q) when every exponent is divisible by q and zero otherwise; require that x↦(y↦τ(xy)) is bijective and Ext_A^k(A_m,A)=0 for every k>0.” The monomial equations specify the actual projection; they are conclusions, not an assumed perfectness predicate. Add its name to the README. No integral completion or sorry'd data is needed to state this theorem.

   **Retest:** For n=0 the quotient is 𝔽_p and τ is the identity. For p=2, n=1, m=1, A_m=A⊕A/(v)·x⊕A/(u)·y, x²=u, y²=v, xy=0. The adjoint sends x to the functional with value u on x and y to the functional with value v on y; Hom_A(A/(v),A)=(u) and Hom_A(A/(u),A)=(v). The periodic resolutions have zero positive Ext against A. This is the singular theorem, not a free-module substitute or a boundary Check.

7. **F07** (P2) Formal canonical duality is narrowed to mixed characteristic

   **Location:** `packages/ClassicalAdicEtaleCohomologyPartII/README.md:17` and `:269`: “The formal-duality assertions over O_K retain that generality”; “put 𝔛_n=𝔛×Spec(O_K/pⁿ)”.

   **Claim:** Layer 1 builds the formal canonical-sheaf and coherent-trace library only over mixed-characteristic valuation rings, although its sources and valuation-base supplier contracts are characteristic-independent.

   **Witness:** Z line 811 assumes any complete rank-one valuation ring and a pseudouniformizer ϖ; Z line 1121 adds algebraic closedness only. For K=𝔽₂((t)), the smooth formal line has canonical sheaf O_K⟨T⟩·dT and dualizing shift [1].

   **Exact repair text:** “Layer 1 uses an arbitrary complete nontrivially rank-one valued field K and a chosen nonzero pseudouniformizer ϖ∈O_K. Use O_K/ϖⁿ and derived ϖ-completion in §§1.1–1.5. Sections 1.6–1.7 additionally assume K algebraically closed. Their coherent generic-fibre inputs are the characteristic-independent AdicSpacesPartIII contracts. Specialize to K=C and ϖ=p when applying Layer 1 to the mixed-characteristic nearby cycles of Layers 0 and 2–5.” Add the equal-characteristic formal-line example as a Check.

   **Retest:** Over 𝔽₂[[t]], the thickenings are 𝔽₂[[t]]/tⁿ and the limit canonical generator is dT in degree −1. Over mixed-characteristic O_K, choosing ϖ=p recovers the current construction. Algebraically closed equal-characteristic K also supports the cited reduced-model and canonical generic-fibre comparisons.

## Verified sound

Read all 1,273 lines of README.md and all 37 lines of Suggested.lean, plus both repository rule documents. Inventory: **54 numbered targets**, **179 Check bullets** in 55 blocks (173 target Checks and six convention Checks), **80 distinct source-line anchors verified** in eight readable works, **zero Lean declarations**, and **19 roadmap supplier contracts examined** across 17 supplier subsections and the inline compactification contract. There are no additional bold theorem targets outside the numbered inventory. Every numbered target has at least three Checks. The computed table records the exceptions as well as the successful tests; the three false Checks are R01, R02 and R04.

The module has one `import Mathlib`, the required namespace and module docstring, and no definitions, instances, section variables, theorem declarations, padding, options or admitted data. Consequently there are no elaborated signatures to compare and no fully qualified declaration names to collide. No Lean command was run. The absence of declarations is acceptable for the geometric headlines; R06 identifies the separate algebraic exception.

| Suggested.lean declaration | Section | Variables / instances | Computed test | Outcome |
| --- | --- | --- | --- | --- |
| None | Empty namespace, lines 35–37 | None | Declaration count = 0; hidden-section-binder count = 0 | No type-context discrepancy to test; headline omission R06 |

### Computed target inventory

All pairs of values below use the actual coefficient rings and integer cohomological indices. The zero coefficient ring in Layer 7, empty spaces, rank-zero local systems, wild p=2 groups, singular nodal charts, ramified valuation rings and characteristic-p negative controls are included where they lie in, or test the boundary of, the target's domain. Real-valued q=1 conventions, polynomial-degree junk values and noncompact topological groups do not occur in these signatures.

| Statement | Context and instances | Computed values | Result / change |
| --- | --- | --- | --- |
| Conventions | d=1; p=2,3; π²=p; two points | H²(Λ[−2])=Λ, H⁻²(Λ[2])=Λ; dlog(T⁻¹)=−dlog T; trace(e₁)=1, trace(1,1)=2; π mod p≠0, π² mod p=0 | Shift, twist, sign, almost ideal and ramified reduction distinctions hold. |
| 0.1 definition and API | Unit, residue field, completed infinite direct sum; p=2,3 | Unit has 1 generator; m·k=0; for fixed ε, independent εe_j survive modulo p when 0<v(ε)<1 | All three Checks distinguish almost coherence. Formal p-torsion sheaves equal their scheme reductions. |
| 0.2 affine calculus | Unit Hom; negative-tail complex; formal P¹ with O,O/p,O(−2) | Hom(O,O)=O[0]; Hom(O,G)=G; (H⁰,H¹)=(O,0),(O/p,0),(0,O); generic fibres C,0,C | Target sound; proof locator R03. min valuation δ>0 is exceeded downward by 1/n. |
| 0.3 almost proper duality | id; smooth curve; two points; n=1,2 | id Hom over O/p has H¹=0; over O/p² on O/p has H¹=O/p; f!O=Ω¹[1]; counit(e₁)=1 | Check corrected in R01; duality itself matches AC 5.5.6. |
| 0.4 nearby complexes | Point; d=2 torus; square-zero generic fibre | Point (A,K)=(Oᵃ,Oᵃ/p) in degree 0, versus analytic rational coefficient C; ranks (1,2,1); Cε/pCε=0 | General admissible-model gap precisely supplies amplitude; nilpotents do not supply extra completed coefficient. |
| 0.5 generic fibre | Unit, O/pⁿ, pO⊂O | O[1/p]=C; (O/pⁿ)[1/p]=0; pO[1/p]=C | Reduction and generic fibre differ; proper comparison has specified coefficients. |
| 1.1 dualizing complex | Point; affine d=2; Z_p[pT,T²,T³] | Degrees 0 and −2 respectively; x=pT survives mod p but x²=xT²=xT³=0 | Flatness and extra dualizing cohomology retained; equal-characteristic omission R07. |
| 1.2 étale/completion comparison | U=2T at p=3; id; reduction n=1 | dU=2dT, determinant 2; id generator=generator; completion mod p equals original mod p | No canonical full-complex identification asserted. |
| 1.3 gluing | U=X, U=empty, incompatible pair | ker(C⊕O→C)=diagonal O; ker(C⊕0→0)=C; (1,0) maps to 1 | Compatible-pair object distinguished; F must be an O-module as surrounding context requires. |
| 1.4 Hartogs/reflexivity | Smooth affine; empty open at point; nodal residue | s↦(s,s); empty-open result C≠O; uv=0 has two components and one-branch open is not dense | Density and reduced residue hypothesis retained. |
| 1.5 bottom traces | id; split r copies; r=p | id(1)=1; Tr(e₁)=1; Tr(1)=p, mod p=0 | Underived bottom trace composes; not normalized by degree. |
| 1.6 canonical generic differentials | Point; torus; inversion | 1↦1, dlog T↦generator, dlog(T⁻¹)=−dlog T | Algebraically closed generic field and reduced models retained. |
| 1.7 coherent trace | S=Tʳ; ramified quadratic point | pullback coefficient r; Tr(dlog T)=dlog S; O_L/p has π≠0,π²=0; after C extension L⊗C=C² | Nonclosed field cannot supply reduced model in the stated counterexample. |
| 2.1 torsion-free quotients | O⊕O/p, p=2, exterior square | (O⊕O/p)/(p∞-torsion)=O; O/(pO)≠O; e∧e=0 even mod 2 | Quotient by torsion, not reduction; alternating law retained. |
| 2.2 cotangent comparison | Point; one torus; ordered two-torus | Ω¹(point)=0; dlog T maps to its character; dlog T₁∧dlog T₂ changes sign under swap | Sources and targets, twist and flat functoriality agree. |
| 2.3 smooth integral inverse | n=0,1,2; p=2 | Φ⁰=1; image Φ¹=aR, image Φ²=a²R; aⁿΨ(x)=aⁿx after identifications; a=−2 at p=2 | Cancellation uses torsion-free target; n=0 is identity. |
| 2.4 nice models | Smooth model; uv=ϖ; t²=ϖ | Smooth locus full; nodal residue uv=0 reduced with origin removed dense; residue t²=0 nonreduced | Last model excluded, as required. |
| 2.5 rational normalization | Torus; degree-zero point; degree-two finite cover | Φ=Sch·j implies jΦ⁻¹Sch=1; point trace=1; split-cover unit trace=2 | Original dimension-zero Check fails: R02. |
| 2.6 Faltings trace | Point; curve; reduced nodal model | 1↦1; ω₀•=ω₀[1] gives ω₀•[−2]=ω₀[−1]; compatible generic/smooth sections differ by 0 | Correct −2d target and Hartogs uniqueness. |
| 2.7 pseudo-finite maps | Finite map; rig-isomorphism; point | Higher finite pushforwards=0; rig-isomorphism gives same nearby complex; d=0 gives degree interval [0,0] | Properness, nice models, and finite generic map remain. |
| 2.8 pro-étale trace | id; split two; split p | Tr(1)=1, Tr(1,1)=2, Tr(e₁)=1; mod p Tr(1,…,1)=0 | Honest integral summation commutes with reduction/localization. |
| 2.9 trace square | id; split r; etale restriction | Both composites id; both composites (x_i)↦Σx_i; restrictions preserve each x_i | Generic equality injects into flat bottom canonical sheaf. |
| 3.1 polystable models | Empty product; n₁=0; node times torus; two nodes; parameter zero | Empty algebra=O_C,d=0; t₀=ϖ gives O_C; uv=ϖ has d=1, adjoining a torus gives d=2; two nodes also d=2; uv=0 has a singular generic origin | Unit parameters yield tori; nonzero parameters essential. |
| 3.2 root stages | n₁=0; one torus; p=2 node | Constant stage=O_C; torus generic degree 2; node closed fibre k[x,y]/(x²,y²,xy) has basis 1,x,y, length 3 | R-flatness rightly not asserted; O_C-flatness retained. |
| 3.3 weights/multiplication | u,v with uv=ϖ; integral coset; unit ϖ | Min-normalized weights (1,0)+(0,1) subtract (1,1); coefficient=ϖ; zero coset=R; coefficient unit iff ϖ unit | Rejects universal multiplication isomorphism in Z. |
| 3.4 Koszul cohomology | d=0; one trivial character; order-p character | H⁰=R; for [R→⁰R], H⁰=H¹=R; for [R→ᵃR], H⁰=0,H¹=R/a≠0 | a-torsion is not almost zero; choose ε with 0<v(ε)<v(a). |
| 3.5 décalage/top trace | d=0,1,2; torsion summand | Torsion-free ranks 1; 1,1; 1,2,1; (R⊕R/a)/(a-torsion)=R while reduction is (R/a)² | Honest comparison is stronger than almost comparison; quotient distinction holds. |
| 3.6 projection trace | m=0; m=1 torus; characteristic p | tr₀=1; tr(T^(1/p))=0,tr(T)=T,tr(1)=1; ordinary algebra trace(1)=p=0 | Projection is specified; not the inseparable algebra trace. |
| 3.7 root duality | m=0; p=2 node; p=2 torus | m=0 adjoint(r)(1)=r; Hom(A/(v),A)=(u), Hom(A/(u),A)=(v), Ext>0=0; torus matrix diag(1,T), det=T unit | Mathematical target sound; missing native characteristic-p acceptance theorem R06. |
| 3.8 group orientation | d=0; d=1; d=2 swap; p=3 scale by 2 | trace₀=id; trace₁(e*)=1; swap determinant −1; new basis 2γ gives trace_new(e*)=2 | Scalar trace changes by determinant, not its inverse; Tate line restores intrinsic map. |
| 3.9 cochain duality | d=0,1; characters χ,ψ | Evaluation at 1 gives b; degree 0×1 multiplication reaches degree 1; projection χ+ψ≠0 is 0 | Tail valuation 1/(p^(m−1)(p−1))→0 gives eventual annihilation by each ε. |
| 3.10 polystable local duality | Point; curve; two-torus | Point adjoint=id; ω₀[1][−2]=ω₀[−1]; degrees 0↔2 and 1↔1, wedge swap=−1 | Shifts agree with §§2.6 and 3.8. |
| 4.1 local pairing object | Point; curve; finite-vector-space comparison | Point multiplication adjoint=id; curve target starts in degree 1; finite-field evaluation matrix I_r | Both adjoints, not projectivity of singular coefficients, define perfectness. |
| 4.2 rig-isomorphism descent | Identity; formal blowup with unchanged generic fibre; mod p | Generic pullback=id on cohomology; proper counit composite equals original trace; reduction target stays ω₀•[−2d] | Relative duality identifies the square; no degree inversion. |
| 4.3 good quotient | G=1; split C_p-torsor; trivial action of nontrivial G | Quotient=id; p components give one quotient and trace(e₁)=1; fixed-point action fibre size 1≠p | Wild split torsor allowed; fixed generic point excluded. |
| 4.4 invariants/orbits | C_p over O_C/p; S₃ regular; C₃ over F₂; G=ℤ regular | Trivial C_p H¹=M; S₃ invariant sum and coinvariant generator each M; 3=1 invertible in F₂; ℤ regular H⁰=0,H₀=M | Finite-group examples hold; unrestricted induced-module Check fails, R04. |
| 4.5 equivariant pushforward | G=1; C_p at geometric point; S₃ | Both comparisons id; H¹(C_p,M)=M survives; (gh)⁻¹=h⁻¹g⁻¹≠g⁻¹h⁻¹ for noncommuting g,h | Bound needed on all p-torsion sheaves; cite parent §11.2, R05. |
| 4.6 good-quotient descent | Split torsor; wild C_p; identity | Induced module hG and h-orbits=M; unit trace=p=0 but coinvariant basis trace=1; identity adjoint=id | No norm equivalence claimed on arbitrary trivial modules. |
| 4.7 general local duality | Polystable; identity zigzag; d=0 | Known polystable adjoint unchanged; every identity comparison=1; point pairing x·y | Declared uniformization gap carries reduced/quasiprojective models. |
| 5.1 global almost trace | Point; P¹; dominating formal model | Point unit→1; c₁(O(1))→1 in H² of Oᵃ/p(−1)[−2]; two counit composites equal | Corrects printed +2d; model refinement compares actual trace. |
| 5.2 global almost duality | Point; P¹; disconnected two points | Adjoints id; P¹ ranks (1,0,1), 0↔2 pairing1; two-point matrix I₂ | Primitive comparison gives almost finite-free groups without claiming integral freeness. |
| 5.3 almost detection/top trace | Zero map F_p→F_p; nonzero scalar; two components | Extended kernel and cokernel both O_C/p, neither almost zero; scalar λ≠0 invertible before/after extension; top trace (a,b)↦a+b has 1-dimensional kernel | Detection holds; connectedness is needed only for trace-isomorphism conclusion. |
| 5.4 mod-p PD | Point; P¹; i<0; equal-char p negative control | d=0 matrix I_r; P¹ degrees (1,0,1); i=−1 pairs 0 with H^(2d+1)=0; i=2d+1 has complementary degree −1, not natural-subtraction junk degree 0; in char p, H²(P¹,F_p)=0 but H⁰=F_p | Characteristic-zero scope and integer indices are necessary. |
| 5.5 finite local systems | rank0; rankr point; p=2 Jordan block | 0→0 adjoints bijective; matrix I_r; J−I has kernel span(e₁), quotient dimension1; degree2 trace=0 | Fixed-vector theorem and prime-to-p Sylow index supply filtration/splitting. |
| 5.6 finite p-power PD | n=1; P¹ at n=2; two scalar bases | Pairing reduces to mod p; P¹ top value1; Tor₁^Zp(Z/pⁿ,F_p)=F_p, Tor₁^Λn(Λn,F_p)=0 | Reduction must be over Λ_n, as stated. |
| 5.7 integral/rational traces | Point; P¹; Z_p/p | Each level sends1→1; c₁→1 integrally and rationally; (Z_p/p)[1/p]=0 | Inverse-limit normalization and torsion retained. |
| 5.8 integral derived PD | P¹; [Z_p --p→ Z_p] in degrees0,1; point | P¹ free degrees0,2 pair1; complex H¹=F_p, Hom(F_p,Z_p)=0, Ext¹(F_p,Z_p)=F_p; point mod pⁿ value1 | Ext contribution prevents false degreewise torsion duality. |
| 5.9 rational PD | P¹; torsion module; two points | P¹ matrix(1); torsion localization0; two-point matrix I₂ has determinant1, product-of-sums matrix has determinant0 | Rationalization and componentwise trace agree. |
| 7.1 constructibility | Point skyscraper; constant sheaf; infinite disjoint points | Stalks Λ at point and0 elsewhere; constant rankr everywhere; degree−j on component j is locally bounded but no global lower bound | Distinguishes Zariski from adic constructibility and local from global boundedness. |
| 7.2 algebraization | Z=Spec A; closed point; Spec K rankr | Proper identity gives equivalence; skyscraper stalks Λ/0 match; rankr coefficient module Λ^r unchanged | Absolute affinoid comparison needs parent §2.5, R05. |
| 7.3 generators/locality | Point; finite closed immersion; C₂ Jordan block | One constant module generator; f_*Λ has stalks Λ/0; exact sequence 0→F₂→F₂²→F₂→0 | No geometric duality used in unipotent generation. |
| 7.4 proper pushforward | id; point inclusion; node; two point inclusions; truncated cochains | idF=F; Ri point-push=0 for i>0; normalization dims1/0; smooth-open intersection Y\{a,b}; [Λ --1→Λ] H⁰=0 vs truncated Λ; N¹--1→N² H¹=0 vs truncated Λ | All five Checks hold; degree i+1 and finite intersection are essential. |
| 7.5 field extension | Point; P¹; n=p²; split nodal rational curve | Point Λ→Λ=id; P¹ ranks1,0,1; Λ/p=F_p on both nonzero P¹ groups; node difference(a,b)=a−b gives ranks1,1,1 | Smooth hypercover repairs singular toric-chart issue in BH proof. |
| 7.6 all-torsion base change | g=id; P¹ n=p²; n=1; empty X | Exchange=id; groups Λ,Λ(−1) preserved; zero ring yields0→0; empty source Rf_*=0 on both sides | Locally bounded Zariski-constructible scope retained. |
| 7.7 constant higher sheaf | Point; two points; Z=point and Y=P¹ | Point R⁰=Λ,R>0=0; two points R⁰=Λ²; for Z=point, R²g_*Λ=0 but H²(Z×P¹,Λ)=Λ(−1) | Statement is sheaf constancy; published H locator remains uncertified. |
| Worked elliptic example | p odd and p=2; swapped basis | Matrix [[0,1],[−1,0]] has determinant1; in F₂ it is [[0,1],[1,0]], with x·x=0 | Alternating sign survives via integral orientation and reduction. |


### Headline inventory and native carriers

| Headline family | README | Acceptance-file disposition |
| --- | --- | --- |
| Formal canonical sheaves, Hartogs and traces | 1.1–1.7 | Named as unstatable: formal models, canonical objects and generic-fibre functors absent |
| Integral Faltings trace and trace compatibility | 2.3–2.9 | Named: completed coefficients and formal specialization absent |
| Characteristic-p monomial root duality | 3.7 | Statable on native polynomial quotients and module Ext; missing, R06 |
| Integral product-polystable root duality | 3.1–3.7 | Named: integral character decomposition and its projection trace absent |
| Polystable local duality | 3.8–3.10 | Named: ringed formal/pro-étale sites and almost coefficients absent |
| Wild-quotient descent and general local duality | 4.2–4.7 | Named: formal quotients and equivariant nearby cycles absent |
| Global almost duality | 5.2 | Named: almost pro-étale global sections and trace absent |
| Mod-p geometric duality | 5.4 | Named: rigid étale cohomology and Galois-equivariant twists absent |
| Finite-local-system mod-p duality | 5.5 | Named: rigid local systems and their evaluation absent |
| Finite p-power derived duality | 5.6 | Named: rigid derived global sections and trace absent |
| Integral derived duality | 5.8 | Named: completed integral global sections and trace absent |
| Rational p-adic duality | 5.9 | Named: rational pro-étale global sections and twisted trace absent |
| Affinoid algebraization and generators | 7.2–7.3 | Named: relative analytification and constructible subcategories absent |
| Constructible proper pushforward | 7.4 | Named: rigid direct image and constructible complexes absent |
| Algebraically closed field-extension comparison | 7.5 | Named: rigid scalar extension and its cohomology map absent |
| All-torsion proper base change | 7.6 | Named: rigid exchange transformation absent |
| Constant higher cohomology sheaf | 7.7 | Named: big smooth rigid étale site absent |

The native-carrier audit used the manifest pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. In particular:

- `Mathlib/LinearAlgebra/PerfectPairing/Basic.lean:39`, `LinearMap.IsPerfPair`, imposes bijectivity of both adjoints, without a finite-generation or projectivity field. The singular-node computation in §3.7 respects this distinction.
- `Mathlib/RepresentationTheory/Invariants.lean:73`, `Representation.invariants`, quantifies over every group element, without group finiteness. This is why the ℤ counterexample in R04 is admitted.
- `TauCeti/RepresentationTheory/Unipotent/PowerOrder.lean:151` and `:158` provide the two named common-fixed-vector results with finite-dimensional nonzero representation and exponential-characteristic assumptions. The zero-rank local system is treated separately, as required.
- `Mathlib/AlgebraicGeometry/Sites/Etale.lean:50` is a scheme topology. `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean:243` gives the sheafy locally affinoid adic carrier, without supplying the rigid coefficient categories. Neither substitutes for the missing geometric headlines.
- Polynomial quotients, Frobenius, restriction of scalars and module Ext are present at the pinned files cited in R06. Their presence is sufficient to state the independent monomial theorem; no construction of an integral perfectoid tower is part of its signature.

### Supplier resolution and ownership

The citation resolver found no unresolved roadmap or Lean-name citations. Its library scan was unavailable, so the library claims above were checked directly at the pins. The following table records the roadmap checks; ranges refer to the named roadmap's README. Existing main roadmaps were read on main, and new-roadmap texts were read at their available heads. The two missing exact parent edges are R05.

| Supplier | Sections and contract checked | Scope retained |
| --- | --- | --- |
| PerfectoidSpaces | P0.1–P0.13, P0.29; P3.11–P3.22; P5.9–P5.13.4; P6.5–P6.7, P6.15–P6.16 | Almost ideal and adjoints, almost purity, finite-stage descent, pro-étale towers |
| AdicSpacesPartII | R0–R1, including R0.19–R0.20 | Classical affinoids, charts and tilde limits |
| AdicSpacesPartIII | F0.6–F0.8; R2.2–R2.8; R3.1–R3.8 | Non-Noetherian extensions are separate declared gaps; finite trace sends 1 to degree |
| AdicSpacesPartIIPartII | RZ.0–RZ.5 in the available design | Closed loci, normalization, resolution; branched covers and proper generic smoothness are gaps |
| RigidAnalyticGeometry | 1.1–1.2 | Classical affinoid noetherianity and excellence |
| ResolutionOfSingularitiesCharacteristicZero | 7.5, 7.8 | Characteristic-zero resolution preserving regular loci |
| SchemeAndStackFoundations | 0.6, 0.8–0.9, 0.21, 2.18–2.21 | Valuation-base duality and reflexivity extensions remain declared gaps |
| AdicCoefficientsAndComparisons | L2/fp-compactification-limit; L2/fp-strict-cofiltered | Both named targets exist, with qcqs base and separated finitely presented morphism |
| DerivedModuleAlgebra | 0.2, 0.4, 0.8, 0.10–0.14; 1.T.1, 1.1–1.8, 1.E.1; S.1 | Native derived algebra, completion hypotheses and first-quadrant spectral sequences |
| DerivedDeRhamCohomology | 1.22 | Completion exchanges retain their boundedness conditions |
| EnhancedDerivedSheaves | 0.1–0.4; E1.1–E1.5; E2:towers.1 | Ringed-site enhancement; finite totalization bound is separately declared |
| AInfCohomology | AI.0:integral.1; AI.1.1–AI.1.7; AI.3.1–AI.3.2; AI.4.1; AI.6.1–AI.6.2 | Cotangent twist, décalage and single-block cyclotomic chart do not already provide general product-block duality |
| PadicHodgeTheory | 2.1, 2.4, 2.7, 7.2 | Proper singular primitive comparison/perfectness are imported; general nearby coherence and toric scalar extension are gaps |
| ArithmeticGaloisDuality | D7.1–D7.3; R02.1.2–R02.2.3 | Ordinary derived group cochains; ringed-site almost extension belongs here; finite/coinduced distinction R04 |
| DiamondsAndVStacks | D1.1–D1.6, D1.9–D1.11 | Totally disconnected bases and field-component geometry, with its base hypotheses |
| DiamondEtaleCohomology | C0.1, C0.23, C2.10; C1.7–C1.12 | All-coefficient v-descent and quasi-pro-étale base maps, not general p-primary proper base change |
| ClassicalAdicEtaleCohomology | 1.1–1.4, 7.1, 8.2, 8.4, 9.5, 9.7, 10.5, 11.1; additionally 2.5 and 11.2 | Earlier sites, traces and stated comparison domains retained; add the two exact edges in R05 |
| HodgeTateAndCanonicalSubgroups | 7.5–7.6 | Proper smooth finite and integral local systems, including torsion integral stalks |
| EtaleCohomologyFoundations | G.1–G.3, F.0, 0.5–0.11, F.3 | Scheme compactification and constructibility; quasi-excellent nonproper direct images are a declared extension |

Ownership searches used `roadmaps grep` by mathematical object, then direct searches of **100 README/Lean files in all 50 supplied sibling folders** and **312 main/completed/board-package README/Lean files**. Relevant matches were read: AInfCohomology owns the single-block semistable chart; PerfectoidSpaces and PerfectoidQuotients own abstract almost and perfectoid constructions; the parent owns its analytic trace and comparison results. The general product-block projection, singular root duality, integral Faltings comparison and ensuing classical p-primary duality are extensions owned here. No competing declaration with the same fully qualified name exists, since this acceptance file declares none. These searches were not proof audits of unrelated siblings.

### Declared gaps and dependency direction

All **14 slugs** occur both in `design/plan.json` and under the README's named supplier. None has supplier `none`. Each specifies the required geometric domain and a single theorem-level interface; related conclusions such as reduction and base change are compatibility clauses of that interface. The searches did not find an existing earlier result covering these exact extensions. Their absence from a supplier is not counted as a defect.

| Gap slug | Supplier | Boundary test / values |
| --- | --- | --- |
| valuation-formal-proper-mapping | AdicSpacesPartIII | Formal point: H⁰(O)=O, Hⁱ(O)=0 for i>0; usual Noetherian formal theorem alone does not cover O_C |
| reduced-model-cofinality | AdicSpacesPartIII | Smooth model has reduced residue; O_K/p for π²=p retains π≠0, π²=0, so residue reduction and p-reduction are distinct |
| refined-formal-algebraization | AdicSpacesPartIII | O_K⟨T⟩ is the completion of O_K[T], pure relative dimension 1 |
| finite-formal-quotients | AdicSpacesPartIII | Split r-point permutation action: quotient one point, finite map of degree r |
| polystable-uniformization-zigzag | AdicSpacesPartIII | Already-polystable model: identity zigzag and G=1; source and target pairing coincide |
| finite-branched-covers | AdicSpacesPartIIPartII | Punctured characteristic-zero disc: t=s² extends to a finite branched map with branch only t=0 |
| proper-generic-smoothness | AdicSpacesPartIIPartII | Inclusion of a point in a smooth curve: smooth open is its complement, with empty fibres; it is dense |
| valuation-upper-shriek | SchemeAndStackFoundations | Identity f!O=O; smooth line f!O=Ω¹[1], in degree −1 |
| valuation-duality-amplitude | SchemeAndStackFoundations | Smooth d-space has sole cohomology degree −d, within [−d,0] |
| valuation-canonical-reflexivity | SchemeAndStackFoundations | Smooth line canonical module free rank 1, bidual map 1↦1; nodal reduced residue requires reflexivity beyond generic freeness |
| connective-totalization-truncation | EnhancedDerivedSheaves | Normalized differential N¹=Λ→N²=Λ is identity: H¹=0; truncating at level 1 instead gives Λ |
| general-nearby-coherence | PadicHodgeTheory | Point degree 0; two-torus ranks 1,2,1 in degrees 0,1,2; single-chart hypotheses do not cover general models |
| integral-toric-field-extension | PadicHodgeTheory | Point comparison O_C completed-tensor O_C′→O_C′ is identity; the contract extends this to toric towers |
| quasi-excellent-direct-images | EtaleCohomologyFoundations | Identity direct image F→F; nonproper finite-type affinoid-algebra schemes go beyond the existing field/trait domain |

The prescribed read-only dependency check exited successfully with exactly:

```text
depcheck: 51 roadmaps, 598 edges, 0 problem(s)
```

No UPWARD or CYCLE line occurred. The diff against origin/main is confined to this package folder. No target file or merge-order file was changed by this pass. The earlier repair report's settlement of the declared generic-smoothness gap is respected; none of R01–R07 re-raises that settlement.

### Source-locator ledger

The counts below are distinct line anchors in README.md, not a count of all theorems in the cited works. Each anchor and its associated theorem/definition passage was read in the supplied version. Version-specific numbering in the README agrees with those extractions. Errata encountered in those passages are listed separately below.

| Source | Count | Verified line anchors |
| --- | ---: | --- |
| Z | 53 | 475, 507, 635, 755, 831, 901, 956, 987, 1060, 1125, 1142, 1200, 1266, 1326, 1373, 1657, 1957, 2088, 2093, 2143, 2168, 2195, 2301, 2353, 2420, 2560, 2629, 2774, 2818, 2834, 3008, 3066, 3106, 3188, 3219, 3227, 3288, 3328, 3392, 3587, 3640, 3677, 3805, 3831, 3877, 3920, 3964, 3968, 3979, 4217, 4253, 4369, 4538 |
| AC | 6 | 4286, 4725, 4990, 5058, 5504, 7390 |
| SW | 1 | 3295 |
| BH | 10 | 475, 567, 594, 647, 672, 684, 764, 780, 864, 1102 |
| U | 1 | 169 |
| PS | 1 | 766 |
| Han | 6 | 134, 196, 226, 801, 817, 946 |
| FQ | 2 | 756, 1349 |


## Not verifiable

- **H, Proposition 2.18, printed p.279:** settled as uncertified in the source manifest. The constant-sheaf statement and its point/product Checks were tested, but the published source wording and proof were not certified. No renewed source request was made.
- **Lean elaboration:** prohibited by this read-only pass. The file contains zero named declarations, so there is no hidden-binder inventory requiring `#check`. R06's proposed new signature has been checked mathematically against the native carriers, not elaborated.
- **Declared gaps:** all 14 are accepted as supplier contracts. Their eventual implementations and proofs are not supplied by this package and were not certified as completed results.
- **Open-work coverage:** all explicitly provided sibling folders were searched, and the supplied roadmap index was used for supplier resolution. No claim is made about unavailable revisions or unlisted external work.

## Source issues

- **Error** in AC at Lemma 4.1.9 proof, printed p.82, AC line 3523: the source says quasi-coherent modules form a Serre subcategory of all O_X-modules; it should be an exact abelian, extension-closed subcategory; j_!O_D(t)⊂O_A¹ is a non-quasi-coherent subobject; affects the proof.
- **Misprint** in AC at Definition 4.5.2, printed p.95, AC line 4059: the source says the open formal subscheme U is contained in the sheaf F; it should be contained in the formal scheme X; affects a stated result.
- **Misprint** in AC at Lemma 4.5.22 proof, printed p.100, AC line 4294: the source says its equivalence follows by repeating its own proof; it should be referred to the scheme analogue, Lemma 4.1.11; affects the proof.
- **Misprint** in AC at Corollary 4.9.6 proof, printed p.113, AC line 4839: the source says the reduction places F and F in the module category; it should be F and G; affects the proof.
- **Misprint** in AC at Lemma 4.9.7(2), printed p.113, AC line 4852: the source says bounded-below first and bounded-above second arguments give bounded-below internal Hom; it should be bounded-above first and bounded-below second arguments; affects a stated result.
- **Misprint** in AC at Theorem 5.5.5, printed p.129, AC line 5512: the source says proper pushforward goes from complexes on Y to complexes on X; it should be from X to Y, opposite to upper shriek; affects a stated result.
- **Misprint** in AC at the construction preceding Lemma 5.5.6, printed p.130, AC line 5528: the source says two pushed-forward complexes are tensored over O_X; it should be a tensor product over O_Y; affects the proof.
- **Misprint** in AC at Lemma 5.5.6, printed p.130, AC line 5540: the source says the Hom comparison is an isomorphism in the category on X; it should be in the category on Y; affects a stated result.
- **Misprint** in AC at Theorem 6.13.6(3), printed p.172, AC line 7414: the source says the nearby-cycle coefficient is an unspecified E; it should be the completed integral structure sheaf used throughout the theorem; affects a stated result.
- **Misprint** in AC at Lemma A.3(1) proof, printed p.173, AC line 7457: the source says connectivity means vanishing in degrees i≤0; it should be vanishing in degrees i<0, allowing the unit in degree zero; affects the proof.
- **Misprint** in Z at Theorem 2.2.3, printed p.11, Z line 507: the source says the pseudofunctor's domain is FPS_R, although only S was fixed; it should be FPS_S; affects a stated result.
- **Misprint** in Z at Lemma 2.2.7(2), printed p.13, Z line 558: the source says f! carries bounded coherent complexes on X to those on Y; it should be from Y to X; affects a stated result.
- **Misprint** in Z at Lemma 2.7.9 proof, printed p.29, Z line 1281: the source says the target open has algebra B′ and its preimage A′, then replaces X by the target open; it should be target Spf(A′°), source Spf(B′°), restricting Y to the target open and X to its preimage; affects the proof.
- **Error** in Z at equation (3.7) and Remark 3.4.15, printed pp.43–44, Z line 2038 and Z line 2084: the source says the source-rescaled rational inverse agrees with the unrescaled Scholze inverse; it should be defined without the extra source factor (1−ζ_p)^n to have that normalization; affects a stated result.
- **Misprint** in Z at Lemma 3.6.4 proof, printed p.46, Z line 2206: the source says scheme Lemma 2.3.5 directly supplies flatness of the formal canonical sheaf; it should be the formal conclusion of Corollary 2.4.5; affects the proof.
- **Misprint** in Z at Lemma 4.2.7 proof, printed p.50, Z line 2399: the source says the formal dualizing complex is the inverse limit of the reduction dualizing complexes shifted again by d; it should be their inverse limit without the additional shift; affects the proof.
- **Error** in Z at Remark 4.2.14 and Lemma 4.2.15, printed pp.53–54, Z line 2536 and Z line 2563: the source says multiplication of every pair of weight lines is an isomorphism; it should be multiplication by the retained normalization parameter, which need not be a unit; affects a stated result.
- **Misprint** in Z at Definition 4.3.1, printed p.59, Z line 2828: the source says polynomial monomials may have arbitrary exponents in p^(−m)ℤ; it should be nonnegative exponents in p^(−m)ℕ, since the variables are not units; affects a stated result.
- **Misprint** in Z at Theorem 4.3.16 proof, printed p.65, Z line 3150 and Z line 3162: the source says the integral trace lands in the mod-p canonical sheaf and tensors integral nearby cycles over O_X₀; it should be the integral canonical sheaf and tensor product over O_X; affects the proof.
- **Misprint** in Z at Theorem 4.4.1 proof, printed p.66, Z line 3209: the source says both cover and quotient are X′, then assigns their normalizations in the opposite order; it should be cover Spf R, quotient Spf R^G, with the respective integral closures assigned consistently; affects the proof.
- **Misprint** in Z at Definition 5.2.1, printed p.75, Z line 3640: the source says the global trace target has shift [2d]; it should be [−2d], as in the defining composite immediately following it; affects a stated result.
- **Misprint** in Z at Theorems 5.5.2, 5.5.4 and 5.5.6, printed pp.81–83, Z line 3922, Z line 3969 and Z line 3980: the source says the finite, integral and rational derived pairings land in the coefficient ring without a shift; it should be the coefficient ring shifted by −2d, including the corresponding Hom adjoints; affects a stated result.
- **Misprint** in Z at Theorem 5.5.2 proof, printed p.81, Z line 3928: the source says to reduce the finite-level duality morphism by tensoring over ℤ_p; it should be tensoring over ℤ/pⁿ, matching the subsequent comparison diagram and avoiding an extra Tor term; affects the proof.
- **Misprint** in Z at Definition D.1, printed p.95, Z line 4513: the source says the coefficient subscript is O⁺/pⁿ while the displayed source and target use O⁺/p; it should be O⁺/pⁿ in both source and target for the finite-level construction; affects a stated result.
- **Misprint** in Z at Remark D.10, printed p.97, Z line 4625 and Z line 4629: the source says a mod-p trace comparison uses mod-pⁿ coefficients in several intermediate terms; it should be mod-p coefficients throughout this comparison with the mod-p specialization map; affects a stated result.
- **Misprint** in Z at Lemma D.11, printed p.97, Z line 4642: the source says Rμ_X′ pushes forward the completed structure sheaf labelled X; it should be the completed structure sheaf of X′; affects a stated result.
- **Misprint** in Z at Lemma D.13 proof, printed p.99, Z line 4717: the source says the perfectoid cover is Spa(B⁺_∞,B_∞); it should be Spa(B_∞,B⁺_∞), with the Tate ring first; affects the proof.
- **Misprint** in BH at Remark 2.30, printed p.13, BH line 581: the source says the open complement Y∖T is contained in T; it should be contained in Y; affects the proof.
- **Misprint** in BH at Theorem 3.5 proof, printed p.17, BH line 744: the source says the closed complement Z_i of V_i is contained in V_i; it should be contained in U_i; affects the proof.
- **Misprint** in BH at Theorem 3.10 proof, printed p.18, BH line 784: the source says generic smoothness supplies an open U in the source X; it should be an open U in the target Y over which f is smooth; affects the proof.
- **Gap** in BH at Lemma 3.25 proof, printed p.25, BH line 1113: the source says to choose a perfectoid toric ℤ_p^d-torsor over an arbitrary affinoid, including singular affinoids; it should be preceded by descent through a smooth proper hypercover before using smooth toric charts; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "d2c2d158081827f13201843d5603e0a441f10cc4", "job": "RT-ClassicalAdicEtaleCohomologyPartII~1a", "model": "gpt-6-astra", "worker": "chris-6"} -->
