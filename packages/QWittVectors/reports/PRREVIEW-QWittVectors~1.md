# Review of QWittVectors (pull request #1351 at 2a7475f)

**Verdict:** needs changes

## R01 (P2) — Give the coordinate/power-series comparison one owner

**Location:** `TauCetiRoadmap/QWittVectors/README.md:205`, §1.4a, and the ownership claim at line 9.

**Claim:** This roadmap constructs the finite and inverse-limit coordinate big Witt/power-series group isomorphisms, with coefficient naturality, restriction, Verschiebung substitution and Teichmüller compatibility.

**Witness:** `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:1172`, §5.16a, states the same comparison and all four compatibilities, including the inverse limit. Its Conventions at line 27 expressly claim that comparison. It precedes QWittVectors in the merge order (positions 67 and 186).

**Repair:** Reconcile the two construction targets as one forward supply contract. The natural owner of the general coordinate comparison is QWittVectors, alongside its coordinate ring: retain §1.4a here, record KTheoryFiniteLocalFields as its consumer, and have the latter replace §5.16a's independent construction with the named import and its K-theoretic quotient specialization. That consumer must follow the coordinate owner; reconcile the order and transitive dependencies rather than adding a reverse import here. This needs coordination with the other roadmap, not a second proof of the same theorem. The alternative is to move the coordinate prerequisites and comparison together to an earlier owner; merely importing §5.16a while it uses this roadmap's coordinate object does not fix the supply direction.

**Repair test:** Over ℤ at N=2, both texts send (2,−1) to 1+2t+3t²; over 𝔽₂ both send (0,1) to 1+t², despite zero ghosts. The overlap is the same torsion-sensitive theorem, not two different normalizations. The proposed single ownership retains both values and the quotient comparison required by K-theory.

## R02 (P2) — Declare the missing arbitrary-base skew-product extension

**Location:** `TauCetiRoadmap/QWittVectors/README.md:1145`, §8.3; supplier contract at line 94.

**Claim:** For arbitrary commutative A, C□ has the supplied `QDeRham.skewDGA` multiplication, and the proof only transports that multiplication to the Kähler basis.

**Witness:** `TauCetiRoadmap/PrismaticCohomologyPartII/README.md:2045` and line 2060 restrict that DGA to framed q-PD envelopes over D flat over ℤ_p[[h]], with (p,h)-completion. Its §5.0 supplies the general complex and points to §5.18 for multiplication.

**Repair:** Keep the arbitrary-base statement, including characteristic two. Add a precise supplier extension contract for the skew DGA on every finite `QFraming` of §5.0: multiplication (a e_I)(b e_J)=aγ_I(b)e_I∧e_J, unit, associative and DG Leibniz laws, and coordinate-injective naturality, with no p-regularity or q-PD hypothesis. Declare it under the same new slug in the plan's gaps and the README's supplier subsection, and consume that contract in §§8.3 and 9.4. The intrinsic q-crystalline E₁ comparison remains under §5.18's stronger hypotheses. Do not describe the general product as already supplied by its restricted statement.

**Repair test:** Take A=𝔽₂ and R=𝔽₂[T]. Then D=𝔽₂[[h]] is not flat over ℤ₂[[h]]: multiplication by 2 on D has kernel D. Nevertheless the required product has dT·T=(1+h)T dT and d_C(T²)=hT dT. Thus imposing the supplier's flatness would discard an explicitly promised example; the stated extension supplies exactly its missing multiplication.

## R03 (P2) — Restore the declared Part II ownership of generic support

**Location:** `TauCetiRoadmap/QWittVectors/README.md:283`, §1.9; §§1.10–1.11 at lines 301 and 320; ownership assertions at lines 9 and 15.

**Claim:** QWittVectors owns the general unbounded cochain-completion theorem, regular-parameter multiplicative Bockstein, and associative differential-ideal quotient construction.

**Witness:** `packages/QWittVectors/design/plan.json:3239`, line 3272 and line 3281 assign those same statements to `cohomology-completion`, `dga-bockstein` and `dga-quotient`: DerivedModuleAlgebra, Part II, and DGAInfinity, Part II. Those three slugs are absent from the README contracts.

**Repair:** Restore those three existing, precise contracts under their named supplier subsections, using the plan's slugs and hypotheses. Remove the duplicate generic construction targets and ownership claims from QWittVectors; consume the contracts in §§7.2, 9.3 and 9.5. Keep the framed Bockstein specialization and q-Witt applications here. The generic proofs and their checks belong to the corresponding Part II extensions. This repair needs no edit to the frozen plan entries and no requirement that the suppliers already implement the declared gaps.

**Repair test:** The general quotient test dx=u forces the differential ideal (x,u), the Bockstein test dx=4u gives Fβ₄V[x]=0=β₂[x], and Mⁱ=ℤ[h]/h^(i+1) requires degree-dependent bounds. All three tests still follow from the existing contracts after the import replaces local ownership; none mentions a q-Witt object that would justify a second owner.

This is not a re-raising of the settled request that external suppliers deliver their gaps, nor of the settled excluded-file radical/numbering edits. It concerns the present README's new local ownership and its missing contract declarations; those can be repaired in the README while respecting the declared supplier contracts.

## Verified sound

The entire 1,445-line README and the four declarations of Suggested.lean were read, including every Needs line, API list and Check. The 15 seeded targets were compared with their legal cached texts at the stated versions. No additional README locator was marked unverified. These are source and adversarial consistency checks, not formal proofs of the admitted mathematics. The findings above concern ownership and the scope of a supplied interface; no counterexample to the two Lean headline statements was found.

The worker's gate at the requested head passes every scanner, dependency and targeted-build check. The independent direct elaboration of `TauCetiRoadmap/QWittVectors/Suggested.lean` also succeeds, with only the two intended sorry warnings. A scratch copy containing `#check @name` for all four declarations elaborates: no hypothesis was lost, and no signature needed changing. Both the ghost-image congruence hypothesis and the framed theorem's algebra tower and étaleness are present. The only definitions are the real-bodied positive divisor-closed subset and divisor-sum polynomial.

The one-tactic probes `simp`, `rfl` and `infer_instance` fail to close each admitted theorem. Object searches in both pins found no library theorem supplying either statement in one `exact`. There is no padding, sorry'd data, stand-in theorem, extra import, set_option, or admitted example. The pinned étale predicate is finite presentation plus formal étaleness, not module-finiteness. Power-series algebra linearity fixes h, hence preserves every h-power ideal; an extra topological binder is not needed for the uniqueness statement.

The outside-folder diff is empty and the worktree remained unchanged. The dependency command prescribed in the brief, with `--movable`, returned exactly:

```text
depcheck: 210 roadmaps, 1445 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. This mechanical result does not detect the duplicate construction contract in R01 or the changed ownership in R03.

**Seeded source checks (15/15 readable).** Page numbers below are printed pages of the README's linked versions; source lines disambiguate them from extraction page markers.

| Target | Locator read | Hypotheses and outcome |
| --- | --- | --- |
| 1.2 Ghost image | hesselholt line 223, Lemma 1.1, v3 pp.6–7; injectivity at line 277 | Independent prime Frobenius lifts suffice; existence needs neither torsion-freeness nor commuting lifts. Injectivity retains n-regularity. |
| 1.6 Étale base change | hesselholt line 811, Theorem 1.25, p.19; borger line 1323, Corollary 5.4, p.26; line 1995, Theorem 9.2, p.39; line 2095, Corollary 9.4, p.40 | Finite truncations, étale pushout and coprime comparison agree. The latter Borger results are on pp.39–40, as the References correctly specify. |
| 1.11 Differential quotients | wagner line 1956, Proposition 3.12 and Definition 3.13, pp.40–41 | Source constructs the q-Witt differential quotient. General associative/unbounded extension is justified by the README's intersection-and-quotient argument, not literally the source theorem. Ownership is R03. |
| 2.4 Perfect coverage | wagner line 1621, Remark 2.47, p.32; wagner-habiro line 493, §1.22(e), p.12; bhatt-scholze line 778, Lemma 2.28, p.20 | Faithful flatness criteria and torsion consequences retain their Λ assumptions. Frobenius congruences alone on torsion rings are not substituted for a Λ-coalgebra. |
| 3.6 Absolute completion | wagner line 1083, §§2.24–2.26 and adjoining proof, pp.21–23 | Derived completion, discreteness and bounded primary torsion are distinguished. The relative flat-twist warning is retained in §5.3. |
| 4.4 Relative ghosts | wagner line 1565, §2.44, p.31 | Target is R tensor over ψ_d with right A-action, then cyclotomic quotient. The direction of the twist agrees. |
| 6.2 Completed Frobenius | wagner-habiro line 647, §2.7, pp.15–16; line 709, Theorem 2.9 proof, p.17 | Standing étale R/A assumption retained. Coefficient Frobenius fixes q; equal radicals are not asserted to be equal ideals. |
| 7.1 Differential q-V systems | wagner line 1822, Definition 3.1 and Lemma 3.2, p.37 | Graded commutativity, strict odd alternation and Vd=n dV agree. No square-zero condition is imposed on every even-degree form. |
| 7.3 Differential q-FV systems | wagner line 1893, Definition 3.6 and Lemma 3.7, p.39 | FdV=d and the corrected dF=nFd have the right domains and direction; see source misprint below. |
| 7.4 Prime V identities | wagner line 1856, Lemma 3.4, p.38; langer-zink line 601, Lemma 1.5, July 2003 pp.19–20 | Prime induction, addition and the V-Teichmüller substitution support the V-only result. No inverse of p is used. |
| 7.6 Differential ghosts | wagner line 2011, §3.15, pp.41–42 | Degree i Verschiebung factor n^(i+1), differential factor and Frobenius factor agree. |
| 8.4 Scaled Frobenius | wagner line 2882, §4.9, p.58; line 3292, §4.28, p.67; line 3452, §4.31, p.70 | H sends dT to T^(p−1)dT; C has the additional [p]_q. Both use q↦q^p. |
| 9.2 Two-term cohomology | wagner line 2950, §§4.12–4.15, pp.59–60 | Tensor blocks use the common quotient coefficient ring; ordinary tensor is intentional. e=0 is allowed, e=α gives differential zero. |
| 9.6a PD adapter | wagner line 3492, §4.34, pp.71–72; bhatt-scholze line 968, Corollary 2.39, p.25 | The source's finite regular-sequence δ-envelope is not silently applied to arbitrary presentations: the README explicitly targets the regular-model/colimit/completion extension and coherent multiplicative comparison. |
| 9.7 Smooth comparison | wagner line 2692, Proposition 4.2, p.54; lines 3491 and 3644, §§4.34–4.36 and proof, pp.71–75 | Smoothness, perfect coverage, every prime, positive m, ψ_(p^α d), right scalars and functorial completed algebra comparison agree. No global frame is imposed. |

**Adversarial calculations.** In the following table q=1+h, Q_m denotes the roadmap's q-Witt ring, C its unscaled framed complex and H its h-scaled complex. Zero-dimensional and zero-ring cases are included where their carriers exist. Each row records an evaluated statement or an explicit excluded model; matching values are finite tests, not a claim that examples prove a universal theorem. Formula tests involving q=0 below concern polynomial identities only, not completed frames with q a unit.

| Statement | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| Conventions: polynomial q-integers | n=0,1,2; q=1 | Geometric sums 0,1,1+q specialize to 0,1,2; no quotient 0/0 is formed | Retain |
| 1.1 truncation carrier | Div(6), ∅, {2} | Div(6)={1,2,3,6}; ∅ has one empty tuple; {2} fails because 1 divides 2 | Retain |
| 1.1 ghostPolynomial, including total-function boundary | All coordinates 1; n=0,1,2,3,6 | w₀=0; (w₁,w₂,w₃,w₆)=(1,3,4,12); w₆=1+2+3+6 | n=0 excluded from theorem |
| 1.1 restriction/index division | S=Div(6), n=2,k=3 | (S/2)/3={1}=S/6; w₂ uses x₁,x₂ only | Retain |
| 1.2 image equivalence | ℤ, φ₂=id, S=Div(2) | x=(1,1) gives b=(1,3), difference 2∈2ℤ; b=(0,1) requires 2x₂=1 and fails congruence | Both directions distinguished |
| 1.2 mixed-prime conditions | ℤ, all coordinates 1, n=6 | 12−4=8∈2ℤ; 12−3=9∈3ℤ | Retain |
| 1.2 injectivity and empty case | 𝔽₂; ∅; zero ring | (0,1) and (0,0) both ghost to (0,0); on ∅ and zero ring restricted carrier has one element | Keep regularity for injectivity |
| 1.2 all indices units | ℚ, b=(0,1) | x=(0,1/2) has ghosts (0,1); 2x₂=1 determines x₂ | Retain |
| 1.3 integral ring law | ℤ, Div(2), τ(1)+τ(1) | (2,−1) has ghosts (2,2); componentwise (2,0) has (2,4) | Retain |
| 1.3 nonunital construction | ℤ with zero multiplication | Sum (a+c,b+d), product (0,0), equal to unitization-kernel operations | Retain |
| 1.3 restrictions and zero objects | S={1},∅; R=0 | W_{1}(R)=R; restriction keeps x₁; W_∅ and W_S(0) have one element | Retain |
| 1.4 Frobenius and V | S=Div(2), y=c | V₂(c)=(0,c); F₂V₂(c)=2c | Retain |
| 1.4 projection formula | x=(a,b), y=c | xV₂(c)=(0,(a²+2b)c)=V₂(F₂(x)c) | Retain |
| 1.4 gcd and composition | a=b=2; a=2,b=3; n=1 | F₂V₂=2; F₂V₃=V₃F₂; F₁=V₁=id | Retain shifted domains |
| 1.4 Teichmüller sign and expansion | ℤ, Div(2) | τ(−1) has ghosts (−1,1), as does −τ(1)+V₂τ(1); τ(a)+V₂τ(b)=(a,b) | τ is not additive |
| 1.4a finite series comparison | ℤ, N=2 | γ₂(2,−1)=1+2t+3t²=(1−t)⁻² mod t³; γ₂(2,0)=1+2t+4t² | R01: same values in both owners |
| 1.4a torsion detection | 𝔽₂, N=2, (0,1) | Ghosts (0,0), but γ₂=1+t²≠1 | R01; keep general torsion scope |
| 1.4a V, restriction and infinite limit | N=4,n=2,x=(1,1); τ(1) | Both substitution and V give 1+t²+2t⁴; restriction drops t⁴; γ∞(τ1)=1+t+t²+⋯ | R01 |
| 1.4a zero and coefficient map | N=0; ℤ→𝔽₂, γ₂(2,−1) | Empty product 1; coefficient reduction gives 1+t² on either route | R01; boundary is not a new owner |
| 1.5 p-typical length | a=0; (p,a)=(2,1),(3,2) | Lengths 1,2,3; last ghosts x₀, x₀²+2x₁, x₀⁹+3x₁³+9x₂ | Retain a+1 |
| 1.6 finite étale pushout | ℤ→ℤ×ℤ, S=Div(2), n=2 | Both pushout routes give ℤ×ℤ; at S=∅ both are zero rings | Retain finiteness |
| 1.6 coprime comparison | a=2,b=3 over ℚ | Div(6) has four ghost factors; iterating the two two-factor functors gives 2·2=4 | Retain coprimality |
| 1.8 finite-prime fracture | M=ℤ,N=p | Intersection of ℤ[1/p] and ℤ_p inside ℚ_p is ℤ; maps send 1 to 1 | Retain |
| 1.8 detection and boundary | N=1; M=ℤ[1/p]; M=0 | Empty completion product is zero; localized M remains M although p-completion is zero; zero stays zero | Keep localization vertex |
| 1.9 cohomology/completion | [ℤ[h] --h→ ℤ[h]] | H⁰=0,H¹=ℤ; h-completion gives 0,ℤ; (p,h)-completion gives 0,ℤ_p | R03 ownership only |
| 1.9 nonuniform bounds | Mⁱ=ℤ[h]/h^(i+1), d=0 | h-completion=Mⁱ; (p,h)-completion=ℤ_p[h]/h^(i+1); bounds 1,2,3,… | R03; no uniform bound added |
| 1.9 two ideals | ℤ[1/p] in degree 0, h=0 | h-completion=ℤ[1/p], (p,h)-completion=0 | R03 |
| 1.10 Bockstein sign and Leibniz | dx=2u, u²=0, f=2 | β[x]=u; β[x²]=2xu=0=ux+xu mod 2 | R03; plus sign |
| 1.10 change of parameter | dx=4u, f=4,g=2,a=2 | Fβ₄V[x]=2u=0=β₂[x]; omitting V gives u≠0 | R03 |
| 1.10 noncommutative product | Matrix DGA, dx=3u | β[(xE₁₂)(xE₂₁)]=2xuE₁₁=uE₁₂xE₂₁+xE₁₂uE₂₁ | R03; associative scope valid |
| 1.10 unit parameter | f=1 | P/f=0, all Bocksteins zero | R03 |
| 1.11 differential ideal | ℤ[x]⊗Λ(u), dx=u | u∉(x); differential closure=(x,u); quotient=ℤ | R03 |
| 1.11 alternation and extreme ideals | Same P; J=(2),0,P | Mod 2 still u²=0; other quotients P and 0 | R03 |
| 1.11 two-sided condition | ℤ⟨x,y,z⟩, d=0 | Quotient by two-sided (x) kills xy and yx, retains yz≠zy; left ideal alone retains xy | R03 |
| 2.1 Adams normalization | ℤ and toric ℤ[T] | ψ₂(2)=2≠4; ψ₂(T)=T²; ψ₂ψ₃(T)=T⁶=ψ₆(T) | Retain |
| 2.1 torsion exclusion | Proposed arithmetic Λ-ring 𝔽₂ | δ₂(2)=1−2=−1, but δ₂(0)=0; 2=0 gives contradiction | Adams congruences alone insufficient |
| 2.1a λ/Witt equivalence | Integer 2 and −1 | λ_t(2)=(1+t)², λ²(2)=1; σ_t(2)=1+2t+3t²+⋯; λ²(−1)=1 | Inversion and −t convention fixed |
| 2.1a ghosts do not determine torsion series | ℤ[ε]/(2ε,ε²), V₂τ(ε) | All ghosts zero, series 1+εt²≠1 | Keep integral coalgebra condition |
| 2.2 prime-set functors | P=∅,{2}; empty generators | Empty-prime comonad is identity; singleton is infinite 2-typical; free empty ring ℤ | Retain |
| 2.3 perfection | ℤ; toric ℤ[T] | ℤ unchanged; in toric perfection ψ₂(T^(1/2))=T; original ψ₂ misses T | Retain |
| 2.4 faithful-flat criterion | Toric ℤ[T]; ℤ[ε]/ε² with ψ₂ε=2ε | Toric ψ₂ has basis 1,T (rank 2); mod 2 dual-number ψ₂ kills ε and is not flat | Hypothesis separates wrong model |
| 2.4 zero/perfect cases | Perfect Λ-base; zero ring | Perfection map=id, tensor descent=id; zero tensors and all modules zero | Retain zero ring |
| 2.5 right-action twist | R=A, arbitrary ψ_n | r⊗a↦ψ_n(r)a and a↦1⊗a compose to identity; no inverse ψ_n needed | Retain |
| 2.5 relative perfectness | Toric ℤ[T]/ℤ | ψ₂-image is ℤ[T²], missing T; relative linearization not surjective | Retain nonexample |
| 3.1 q-FV normalization | E₂=ℤ[q]/(q²−1), E₁=ℤ | V₂(1)=1+q; FV(1)=2; VF(1)=1+q | Keep two distinct constants |
| 3.2 quotient and initiality boundary | R=ℤ,0; m=1,2 | Q₁(R)=R; Q₂(ℤ)=ℤ[q]/(q²−1); Q_m(0)=0 | Retain |
| 3.2a prime-generated cyclotomic ideal | m=6 | (1+q²+q⁴)−q(1+q³)=q²−q+1=Φ₆ | Retain |
| 3.2a excluded m=1 | No prime divisors | Generated ideal=(0), whereas (Φ₁)=(q−1)≠0 | Keep m>1 |
| 3.3 ghost quotient | Q₂(ℤ), V₂1 | At q=−1, 1+q=0; at q=1, 1+q=2 | First ghost and restriction distinguished |
| 3.4 V-resolution sign | m=6, x arbitrary; m=1 | x↦(−V₃x,V₂x)↦−V₂V₃x+V₃V₂x=0; m=1 augmentation=id | Retain |
| 3.5 torsion and ghost detection | R=𝔽₂,m=2; R=ℤ | Q₂(𝔽₂)=ℤ/4 with q=1; V₂1=2≠0 but all ghosts zero; Q₂(ℤ) is ℤ-free of rank 2 | Keep coefficient torsion condition |
| 3.6 absolute completions | Q₂(ℤ) | p-completion=ℤ_p[q]/(q²−1); (q²−1)-completion leaves Q₂ unchanged | Retain |
| 3.6 zero-index boundary | m=1 | Q₁(R)=R, q−1 acts by zero; its completion is R | Retain |
| 3.7 Witt injection | R=𝔽₂,m=2 | W_Div(2)(𝔽₂)=ℤ/4→Q₂(𝔽₂)=ℤ/4 is identity, retaining 2 | Retain |
| 3.7 local decomposition | p=2,m=6 | Factors q²−1 and q⁴+q²+1; modulo 2 they are coprime, so the localized product is the six-degree quotient | Retain |
| 4.1 Λ comparison | Toric ℤ[T], m=2 | Image is ℤ[T²,q]+(1+q)ℤ[T,q]; q=−1 image is ℤ[T²], which misses T | Retain injective, not surjective |
| 4.1 section composite | Same toric base | c₂s₂(T)=T², not T | Retain Adams composite |
| 4.2 relative scalar convention | Right scalar T | Relative F sends 1⊗T to 1⊗T; coefficient Frobenius convention would send T to T² | Retain |
| 4.3 relative initial ring | R=A; m=1 | Q_m(A/A)=A[q]/(q^m−1); Q₁(R/A)=R | Retain |
| 4.3 proper-V linearity | A=ℤ[T],R=A[X],m=2 | Relation V₂(TX)⊗1=V₂(X)⊗T is required; an unrestricted tensor model can separate them by ε and 0 over 𝔽₂[ε]/ε² | Retain relation |
| 4.4 twisted ghosts | Toric A=ℤ[T], d=2 | T⊗1=1⊗T²; correctly directed map sends both to T²; reversing twist demands T⁴=T | Retain |
| 4.4 index-one ghost | m=d=1 | R tensor over id A=R, Φ₁ imposes q=1, ghost=id | Retain |
| 4.5 Λ-base change | Evaluation ℤ[T]→ℤ, T↦2 | fψ₂(T)=4 while ψ₂f(T)=2; map is not Λ-compatible | Keep Λ-map condition |
| 4.5 colimits and maps | Identity and zero algebra; m=1 | Identity acts coefficientwise; Q₁ commutes with coefficient colimits because Q₁(R)=R; Q₁(0)=0 | Retain |
| 4.6 perfect-cover comparison | R=A; toric ℤ[T]/ℤ | Base linearization=id; polynomial comparison misses T before perfection, acquires T^(1/2) afterwards | Retain |
| 5.1 étale preservation | Identity; ℤ→𝔽₂ at m=1 | Identity has Tor₁=0; 𝔽₂ tensorL_ℤ 𝔽₂ has Tor₁=𝔽₂, so quotient map is excluded | Retain étale assumption |
| 5.2 derived ghost pushout | Q₂(𝔽₂)=ℤ/4,q=1 | First-ghost resolution has alternating maps 2,0; Tor₁=𝔽₂, not zero | Étale hypothesis cannot be dropped |
| 5.3 relative torsion | A=ℤ,R=ℤ/4,m=1 | Q₁=ℤ/4, element 2 is nonzero and killed by 2 | Base perfect coverage alone insufficient |
| 5.3 completion on both sides | Infinite toric A, B=Â₂ | Twisted quotient is ⊕_e B e; compatible sums Σ_(i<n)2^i e_(T_i) have no finite-support lift | Keep final p-completion |
| 5.3 square-zero negative control | r₀=0,r₁=1/3,r₂=4/9 | Coordinate orders 2,4,8; transitions multiply by 2; colimit ℤ[1/2]/ℤ has T₂=ℤ₂, whereas the original direct sum has T₂=0 | Bounded torsion and mere discreteness separated |
| 5.4 finite type | ℤ[T],m=2; infinitely many T_i | 1,T generate over subring containing T²; ideals (T₁,…,T_n) grow strictly in the infinite-variable example | Retain finite-type premise |
| 6.1 étale completed Frobenius | R=A; ℤ→ℤ×ℤ; p invertible | Right-linearized base map=id; split étale factors each id; when p invertible both completions zero | Retain |
| 6.1 excluded smooth replacement | R=𝔽_p[T] | Frobenius sends T to T^p and misses T | No smooth-equivalence overclaim |
| 6.1 mixed-base naturality | Toric T evaluated at 0; p=2 | ψ₂(T+2) evaluates to 2; applying ψ₂ after evaluation also gives 2; literal square gives 4 | Retain coefficient lift |
| 6.2 radical, not ideal, equality | d=1,p=2,3 | Mod 2: Φ₂=h; mod 3: Φ₃=h²; radicals of (h),(h²) agree, h∉(h²) | Retain |
| 6.2 zero d and unit p | d=0; p a unit | Φ₀=1, both ideals unit, both completions zero; same for invertible p | Retain total-index boundary |
| 6.2 q convention | ℤ₂[[h]] | Coefficient map fixes 1+h; coordinate Frobenius gives 1+2h+h² | Retain distinction |
| 6.3 ghost Frobenius | p=2,m=4, τ(T+2) | Lifted coefficient Frobenius gives (T²+2)², evaluating at 0 gives 4; literal fourth power gives 16; mod 2 both vanish | Ghost congruence does not define lift |
| 7.1 strict odd alternation | Characteristic 2, degree-one u | Exterior u²=0; graded-commutative polynomial algebra permits u²≠0 | Retain separate axiom |
| 7.1 Vd=n dV | q=1 ghost model, n=2 | Degree-0 V factor 2, degree-1 factor 4; VdT=4dT=2d(2T) | Retain |
| 7.2 initial differential system | m=1,R=A[T]; R=A | d(T²)=2T dT; relative forms of A/A have positive degrees zero | Retain |
| 7.3 Fd and dF | T, n=2,3 | F₂dτ(T)=T dT while dF₂τ(T)=2T dT; at 3 values T²dT and 3T²dT | Correct source misprint |
| 7.3 FdV | n=1; ghost model n=2 | F₁dV₁=d; with V degree factors, F₂dV₂(T)=dT | Retain |
| 7.4 prime differential identity | p=2,q=1,x=T | dV₂(T²)=4T dT=V₂(T)dV₂(T) | Retain |
| 7.4 divided power normalization | V₂(x), p=2 | γ₂(V₂x)=V₂(x²); 2γ₂(V₂x)=(V₂x)² | No division by 2 |
| 7.5 positive-degree Frobenius construction | θ₂ on τ(T),V₂(T),τ(T)² | Values T dT, dT, 2T³dT; an ordinary derivation would give 2T²dT in the last case | Retain twisted rule |
| 7.6 differential ghosts | n=2, degrees 0,1 | gh(V₂T)=2T, gh(V₂dT)=4dT; differential compatibility compares 4dT with 2·d(2T) | Retain n^(i+1) |
| 7.6 Frobenius factor | dτ(T),n=2 | n·gh(F₂dτT)=2T dT=d(T²) | Retain |
| 7.7 étale differential extension | Laurent localization, m=1 | d(T⁻¹)=−T⁻²dT on both universal-derivation routes | Retain |
| 7.7 noncentral excluded DGA | B=k[x], u·b=b(0)u | After inverting x, u=(ux)x⁻¹=0 although scalar-extended Bu is nonzero | Keep graded-commutative extension hypothesis |
| 8.1 framed automorphism headline | A[T], including A=ℤ/4 and 𝔽₂ | γ(T²)=(1+2h+h²)T², reducing over 𝔽₂ to (1+h²)T²; γ⁻¹T=(1−h+h²−⋯)T | Retain |
| 8.1 quotient completeness | P/(hT) | hT=0 but constant T survives; P/(T) would instead kill T | Retain actual quotient |
| 8.1 étale versus inseparable | 𝔽₂[T]→𝔽₂[Z], T↦Z² | Any square has h-coefficient 0, but γ(Z²)=(1+h)Z² has h-coefficient Z² | Keep étaleness |
| 8.1 rank zero/zero ring | r=0; A=0 | Fin 0 has no i; no automorphism assertion indexed there; zero power-series algebra has unique map | No hidden nonemptiness |
| 8.2 divided differences | 1,T,T²,T³,T⁻¹ | Values 0,1,(1+q)T,(1+q+q²)T²,−q⁻¹T⁻²; at q=1 these are the ordinary derivatives | Retain |
| 8.2 relative coefficients | A=ℤ[U], R=A[T] | D(U)=0; D(UT²)=U(1+q)T | Retain relative base |
| 8.3 C versus H | T², q=1 | d_C=(1+q)T dT→2T dT; d_H=(q²−1)T dT→0 | Retain scaled differential |
| 8.3 Koszul sign | Rank 2, XY | d⁰(XY)=(Y,X); d¹(Y,X)=1−1=0; H gives h²(1−1)=0 | Retain minus sign |
| 8.3 skew multiplication | A=𝔽₂, T | dT·T=(1+h)T dT; T·dT=T dT; d(T²)=hT dT; kernel(2:D→D)=D | R02 supplier extension needed |
| 8.3 map restriction | Merge X,Y↦T | Image d(XY)=2T dT, versus d(T²)=(1+q)T dT | Keep coordinate injections |
| 8.4 Frobenius normalizations | p=2, coordinate T | φ_H(dT)=T dT; φ_C(dT)=(1+q)T dT; φ(h)=h(1+q) | Retain |
| 8.4 chain and commutation | p=2,T | Both H chain routes give h(1+q)T dT; γφ(T)=q²T²=φγ(T) | Retain |
| 9.1 Frobenius decomposition | One variable,p=2,α=1; α=0 | Function basis 1,T over squares; form basis T dT,dT; at α=0 basis 1 and dT | Retain exponent-zero convention |
| 9.1 empty frame | r=0 | Single scalar summand, no positive exterior degrees | Retain |
| 9.2 two-term cohomology | S=ℤ₂[[h]]/(h(h+2)), map h | ann(h)=(h+2); H⁰≅ℤ₂ and H¹=S/(h)=ℤ₂ | Retain |
| 9.2 e=α and unit normalization | e=α; multiply differential by unit −1 | Differential 0 gives H⁰=H¹=S; replacing h by −h keeps ann and quotient | Retain |
| 9.2 tensor convention | K(a)⊗_S K(a) | Basis subtraction changes (a,a) to (a,0); over ambient ring S tensorL S also has Tor₁=S | Keep ordinary tensor over S |
| 9.3 Bockstein normalization | m=1,T; m=2,T² | β₁(T)=dT; d_H(T²)=(q²−1)T dT gives β₂[T²]=[T dT] | Retain |
| 9.3 rank zero | No coordinates | All differentials and β are zero | Retain |
| 9.4 rank-one homotopy | a dT,b; a dT,b dT | Commutator a(γb−b)dT=Ta(hDb)dT; H(a dT,b dT)=−Tab dT | Retain sign |
| 9.4 closed two-variable witness | α=dX, β=YdX+XdY | Commutator=hX dX∧dY=d_H(−XYdX), nonzero as a cochain modulo h(h+2) | Corrects source proof |
| 9.4 mixed degrees | α=dX∧dY, β=ZdX+XdZ | H=XZ dX∧dY; both commutator and d_H H equal hX dX∧dY∧dZ | Retain |
| 9.4 coefficient identity probe | All 64 pairs of subsets of {1,2,3}; three monomial pairs; q=−1,0,1,2,3 | 960 cases: every coefficient of αβ−(−1)^(kl)βα−dH−H(d⊗1+1⊗d) is 0 | Finite polynomial verification; no formal-proof claim |
| 9.5 cohomology versus cochains | m=2,T,T² | d_H(T)=h dT≠0; d_H(T²)=0 mod q²−1; dT·T²=q²T²dT=T²dT | Retain cohomology claim |
| 9.5 odd squares | Odd cohomology class x, torsion-free E | Graded commutativity gives 2x²=0; integer torsion-freeness gives x²=0 | Torsion argument retained at 2 |
| 9.5 zero-variable system | R=A, no coordinates | E_m=R[[h]]/(q^m−1), β=0; FV=m/d, VF=[m/d]_(q^d) | Retain |
| 9.5a q-PD versus prism ideals | p=2,3 | δ₂(h)=h, γ₂(h)=0; δ₃(h)=h+h², γ₃(h)=−h²; δ₂([2])=−q≡1 mod [2] | Retain |
| 9.5a iterated ideal/Frobenius | α=0,1,2,p=2 | J₀=1; J₁=h+2; J₂=(q+1)(q²+1)=[4]_q; φ_C²(dT)=[4]_qT³dT | Retain every twist |
| 9.5a twisted input | A=ℤ[U], R=A[T,(T²−U)⁻¹],p=2 | Over 𝔽₂(U), twist gives k[Y,(Y−U)⁻¹]; untwisted gives k[T,(T²−U)⁻¹], whose units generate only its even-power subring | Corrects missing source twist |
| 9.5a zero/unit-prime boundary | Rank 0; p invertible | No one-forms; in invertible-p case D=P=0 and both comparisons zero | No good-prime shortcut |
| 9.6 simultaneous induction | α=0; p=2, R=ℤ[T] | Q₁Ω=Ω; Cartier class T dT lifts as F₂dτ₂(T)=T dT | Retain |
| 9.6 differential V quotient | p=2, dV₂(T) | F₂dV₂(T)=dT, but F₂V₂(ω)=2ω; dT is not 2-divisible | im V alone is not differential |
| 9.6a identity presentation | R=A,P=B | Kernel 0; PD envelope B; both complexes B[0]; map=id | Retain |
| 9.6a PD contraction and δ | p=2, P=ℤ₂[x]^∧→ℤ₂ | d(x^[n+1])=x^[n]dx; contraction returns x^[n+1]; δ(x^[2])=x⁴/8=3x^[4] | Retain |
| 9.6a common presentations | Two variables x,y mapping to 0 | Both augmentations send 1↦1 and x,y,dx,dy↦0; positive PD directions contract; ordinary 𝔽₂[x] retains x dx | PD relations essential |
| 9.7 mixed-prime smooth comparison | p=2,m=6, toric ℤ[U] | Factors q²−1 and q⁴+q²+1; twists ψ₂,ψ₆; U⊗1=1⊗U⁶ in second factor, not 1⊗U² | Retain |
| 9.7 local factorization | p=3,m=2 versus p=2,m=2 | At 3, (q−1),(q+1) comaximal and CRT applies; at 2 their sum contains 2, not 1, so one prime-power factor remains | Retain |
| 9.7 derived tensor base | n=1,A=R=ℤ | Tensor over C_α with itself yields C_α; over ℤ[q] yields extra Tor₁=C_α | Retain correct base |
| 9.7 unit/zero and naturality | m=1; R=0; identity map | Ω̂_p=Q₁Ω̂_p with q=1; zero gives zero; identity fixes every form and coefficient | Retain |
| 10.1 smooth torsion theorem | Smooth ℤ[T]; singular ℤ[x]/x² | Ω_{ℤ[T]/ℤ}=ℤ[T]dT is torsion-free; singular ring has 2x dx=0 but x dx≠0 | Keep smoothness |
| 10.2 bounded h-torsion | ℤ[h]/h(h+2) and reduction mod 2 | Integral torsion generated by h+2 has h-bound 1; mod 2, h≠0 but h²=0 has bound 2 | Retain separate bounds |
| 10.2 m=1 completion | q=1 | h=0, torsion bound 1 and completion unchanged | Retain |

There are **132 adversarial rows**, covering all 60 numbered target sections, both Lean headline theorems, the sampled targets, the findings, and the convention-sensitive API clauses. The independent polynomial homotopy calculation checked 960 finite cases, not an implementation of the roadmap's proposed library. Nonabelian group examples are inapplicable to these commutative-ring constructions; the associative matrix and free-algebra examples test the places where noncommutativity is admitted. No field/DVR restriction has replaced the promised coefficient-ring generality.

**Pinned declaration audit.** Opened the following 48 named interfaces across 18 files at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Line numbers refer to those pins.

| File | Declarations and lines | Boundary checked |
| --- | --- | --- |
| `Mathlib/RingTheory/WittVector/Defs.lean` | `WittVector` 52; `WittVector.ext` 77 | Carrier is a sequence indexed by ℕ, with p-typical operations elsewhere; not arbitrary divisor truncations. |
| `Mathlib/RingTheory/WittVector/Basic.lean` | `map` 253; `map_coeff` 267; `ghostMap` 287; `ghostComponent` 296; `ghostComponent_apply` 299, in `WittVector` | Coefficientwise functor; ring structure uses prime p and CommRing. |
| `Mathlib/RingTheory/WittVector/Truncated.lean` | `TruncatedWittVector` 62; `TruncatedWittVector.instCommRing` 270; `WittVector.truncate` 288; `WittVector.coeff_truncate` 303; `TruncatedWittVector.truncate` 334 | Native carrier is `Fin n → R`, so Div(p^a) corresponds to n=a+1; length zero exists. |
| `Mathlib/RingTheory/WittVector/Frobenius.lean` | `WittVector.frobenius` 218; `ghostComponent_frobenius` 240; `frobenius_eq_map_frobenius` 270; `frobeniusEquiv` 283 | Coefficient pth-power formula assumes CharP; equivalence additionally assumes PerfectRing. |
| `Mathlib/RingTheory/WittVector/Verschiebung.lean` | `WittVector.verschiebung` 109; `verschiebung_coeff_succ` 150; `verschiebung_injective` 154 | Additive coordinate shift, not ring multiplication by p. |
| `Mathlib/RingTheory/WittVector/Teichmuller.lean` | `WittVector.teichmuller` 93; `ghostComponent_teichmuller` 124 | Multiplicative map; nth ghost r^(p^n). |
| `Mathlib/RingTheory/TensorProduct/Basic.lean` | `Algebra.TensorProduct.includeRight` 277 | Actual map b↦1⊗b, fixing the right scalar convention. |
| `Mathlib/RingTheory/Etale/Basic.lean` | `Algebra.FormallyEtale` 46; `Algebra.Etale` 205 | Formal étaleness kills Ω and H¹ cotangent; étale adds finite presentation, not finiteness as a module. |
| `Mathlib/RingTheory/Kaehler/Basic.lean` | `KaehlerDifferential` 148; `KaehlerDifferential.D` 226; `KaehlerDifferential.linearMapEquivDerivation` 355 | Cotangent module, universal derivation and linear universal property; no full de Rham DGA is encoded by this module alone. |
| `Mathlib/RingTheory/PowerSeries/Basic.lean` | `PowerSeries` 56; `PowerSeries.coeff` 76; `PowerSeries.constantCoeff` 139; `PowerSeries.algebraPowerSeries` 942 | Series carrier and coefficientwise algebra map are genuine bodies; arbitrary commutative coefficients allowed. |
| `Mathlib/RingTheory/PowerSeries/Inverse.lean` | `PowerSeries.isUnit_iff_constantCoeff` 109 | Constant coefficient must be a unit; a nonzero constant alone is insufficient over a general ring. |
| `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean` | `Polynomial.cyclotomic` 229; `cyclotomic_zero` 278; `cyclotomic_one` 283; `prod_cyclotomic_eq_X_pow_sub_one` 337; `prod_cyclotomic_eq_geom_sum` 357 | Φ₀=1; divisor products assume positive n and work over arbitrary commutative rings. |
| `Mathlib/RingTheory/Polynomial/Cyclotomic/Expand.lean` | `Polynomial.cyclotomic_expand_eq_cyclotomic_mul` 38; `cyclotomic_expand_eq_cyclotomic` 87; `cyclotomic_mul_prime_eq_pow_of_not_dvd` 131; `cyclotomic_mul_prime_dvd_eq_pow` 145 | Expansion is integral; power identities require characteristic p, with separate p-divisibility cases. |
| `TauCeti/RingTheory/WittVector/Complete.lean` | `WittVector.isAdicComplete_span_p_teichmuller` 197 | Perfect characteristic-p coefficients and (ϖ)-adic completeness required. |
| `TauCeti/RingTheory/WittVector/Frobenius.lean` | `TauCeti.WittVector.continuous_frobenius` 65; `continuous_frobeniusEquiv_symm` 79 | Actual adic-topology hypothesis; perfectness for inverse. Not the q-fixed relative coefficient map. |
| `TauCeti/RingTheory/Kaehler/FormallyEtale.lean` | `TauCeti.kaehlerBasisOfFormallyEtale` 67; `kaehlerBasisOfFormallyEtale_apply` 71 | All three algebra structures and scalar tower are present; transported basis values are the differential map. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/Bockstein/Basic.lean` | `TauCeti.explicitBockstein1` 92 | Continuous group cohomology H¹→H² with mod-two coefficients, not the regular-parameter DGA construction. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/Bockstein/Integral.lean` | `TauCeti.integralBockstein` 136 | Target has integral coefficients, in group cohomology; not β_f on H*(P/f). |

**Cross-roadmap and ownership audit.** The prescribed object searches used `roadmaps grep` and `roadmaps show`, main, the board package READMEs, the available sibling checkouts, and the pinned sources. Namespace searches found the four fully qualified QWittVectors declarations only in this roadmap's copies. No pinned general big Witt, arithmetic Λ-coalgebra, q-Witt system or framed-DGA carrier was found. These absence conclusions are scoped to the pins, not future Mathlib. GeneralAlgebraicKTheoryPartII, supplier subsection at line 232, consumes §1.4a, HabiroRings consumes Layers 1–6, and HabiroCohomologyFoundations consumes the general framed calculus; these are consumers, not alternative foundations. KTheoryFiniteLocalFields §5.16a is the distinct ownership defect in R01.

The following 12 supplier families were resolved against main or their indexed open heads and read at the cited sections; an absent local checkout was not treated as an absent declaration. DGAInfinity, DerivedModuleAlgebra and EnhancedDerivedSheaves also supplied the three main-branch shape comparisons.

| Supplier and resolved locators | Consumed interface / result of audit |
| --- | --- |
| `TauCetiRoadmap/DerivedModuleAlgebra/README.md`, §§0.K.1, 0.2, 1.1–1.9; §1.2 at 1693, §1.5 at 1808, §1.8 near 2001 | Scalar Koszul, derived tensor/limits, completion reflector, radical invariance, module bounded-torsion comparison and complete flatness. The additional arbitrary-cochain contract is distinct; R03 restores its Part II ownership. |
| `TauCetiRoadmap/DGAInfinity/README.md:263`, Layers 0–1 through line 316 | Signed graded and associative DG carriers. Its categorical quotients are not differential-ideal quotients; generic extensions remain the declared Part II contracts in R03. |
| `TauCetiRoadmap/AInfCohomology/README.md:1223`, §§AI.1.1–AI.1.7; §AI.1.6 at 1407, §AI.1.7 at 1439 | Principal décalage, plus-sign Bockstein, reduction and base-change conditions, commuting-endomorphism Koszul and cochain-dual comparison. Nonflat base-change conditions are retained. |
| `TauCetiRoadmap/SchemeKTheoryOperations/README.md:1695`, §§6.2.1–6.2.2 | Integral special λ-rings, morphisms, universal product/composition polynomials and Adams operations. QWittVectors supplies the coalgebra equivalence, not another λ-ring carrier. |
| `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:455`, §0.3; E5:abstract at 1436; E5:spectra-comparison at 1842 | Point-site tensor/limits, multiplicative enhancement, `moduleSpectra_equiv_derived` and `symmetricSpectra_towerComparison`. The finite-prime specialization is distinct from the all-prime spectral square. |
| `TauCetiRoadmap/BordismFormalGroups/README.md:2560`, §F6.5 | All-prime arithmetic square with rationalization outside the infinite product. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md:1508`, §§0.23a, 0.29 at 1825, 4.1 at 5066 | Universal-homeomorphism étale invariance, relative Frobenius for étale maps, and unique infinitesimal étale lifting. Neither finite étale nor a perfect base is substituted for étale. |
| `TauCetiRoadmap/HabiroCyclotomicCompletions/README.md:1165`, §4.1; §5.2 at 2083 | Distinct cyclotomic ideal quotients and comaximal completion splitting. §3.2a here derives the prime-generator consequence; §6.2 derives radical equality from the pinned power identities. |
| `TauCetiRoadmap/DerivedDeRhamCohomology/README.md:3071`, §§2.1–2.21; §3.4 at 3842; §§3.5–3.6; PD.5 at 1895 and PD.6 at 2225 | Ordinary exterior de Rham universal differential, arbitrary-characteristic-p relative polynomial Cartier, and PD foundations. Strict odd alternation and right Frobenius twist are preserved. |
| `TauCetiRoadmap/CrystallineCohomology/README.md:1716`, §CR.2.2; §CR.4.6's differential-extension clause at 6006 | PD Poincaré/presentation comparison and general étale degree-zero differential extension. B-linearity and odd alternation specialize correctly. |
| `TauCetiRoadmap/PrismaticCohomology/README.md`, §§0.6, 0.68–0.69 at 1497, 0.77 at 1655, 1.20 at 2477 | Frobenius reconstruction, regular δ/PD envelopes, q-de Rham prism and smooth Hodge–Tate comparison. §§9.5a and 9.6a explicitly target the extra general-base/iterated/presentation arguments. |
| `TauCetiRoadmap/PrismaticCohomologyPartII/README.md:549`, §3.16; §5.0 at 1581, §§5.2, 5.13–5.15, 5.18–5.20 | One-step Frobenius/décalage, complete framing, twisted q-PD comparison and coherent refinements. The general complex is supplied, but the unrestricted product needs R02's extension. |

All seven plan gap entries were read. They have named owners and explicit hypotheses; no `supplier: none` occurs. Four labels occur in the README and three are displaced by local targets (R03). The old plan's redundant radical request and old Layer 8 numbering were already marked outside the repair allowance and are not reopened. The README correctly uses the ψ_p-twisted prismatic input rather than the old plan's untwisted shorthand. No finding demands that a declared supplier gap already be implemented. The gap review is conditional on the actual mathematical contracts, with the scope correction in R02 and the ownership correction in R03.

**Headline completeness.** The README and module docstring identify these headline families:

- Big Witt ghost-image criterion, ring construction, series comparison and étale Frobenius base change; finite-prime arithmetic fracture (§§1.2–1.8).
- Integral special λ-ring/Witt-coalgebra equivalence, arithmetic perfection and perfect coverage (§§2.1a–2.4).
- Absolute q-Witt initiality, V-resolution and Witt injectivity (§§3.2, 3.4, 3.7); relative initiality and perfect-cover comparisons (§§4.3, 4.6).
- Relative étale base change/completion and q-fixed completed coefficient Frobenius (§§5.1–6.3).
- Initial differential systems, positive-degree Frobenius and differential base change (§§7.2, 7.5, 7.7).
- Unique framed coordinate automorphisms and complete difference calculus (§§8.1–8.4).
- Framed Frobenius decomposition/cohomology, iterated prismatic décalage, simultaneous prime-power induction, completed δ-PD presentation and functorial smooth E∞ de Rham comparison (§§9.1–9.7).
- Smooth integer torsion-freeness and degreewise completion (§§10.1–10.2).

The two native-carrier headline theorems are present at `TauCetiRoadmap/QWittVectors/Suggested.lean:82` and line 102. The remaining families are explicitly named in its module docstring with the missing big Witt/comonad, q-FV, differential, prismatic or enhanced-derived carriers. The four kept signatures agree with README §§1.1–1.2 and 8.1. No deep theorem was replaced by a boundary value or a free predicate. Definitions have prose APIs and at least three discriminating Checks; all ten layers have Examples and Dependencies. The read-only review found no computational algorithm, route-specific prime restriction, copied source passage, or unrelated file change.

## Not verifiable

- No cited text was inaccessible: all eight source keys had legal cached extractions, and all 15 seeded targets were read. No new source request or manifest edit was needed.
- The source arguments do not themselves constitute finished formal proofs of the arbitrary-presentation adapter or iterated completed base-change construction. These are explicitly formulated roadmap targets; the report verifies their hypotheses, source inputs and displayed test cases, not an absent implementation.
- Ownership searches cover the supplied sibling files, readable board packages, main and relevant supplier heads exposed by the roadmap index. Unprovided or unreadable external work is not certified. No finding relies on inferring a missing theorem from an unavailable checkout.

## Source issues

- **Misprint** in wagner at Lemma 3.7, printed p.39 (wagner line 1921): the source says dF_n equals n dV_n; it should be dF_n=nF_nd, as its proof and the maps' domains require; affects a stated result.
- **Misprint** in wagner at Lemma 3.4 proof, printed p.38 (wagner line 1870): the source says V_ℓ(y)^p=ℓ^(p−1)V_ℓ(y); it should be V_ℓ(y)^p=ℓ^(p−1)V_ℓ(y^p), as the next displayed calculation uses; affects the proof.
- **Misprint** in wagner at Corollary 4.15 proof, printed p.60 (wagner line 3011): the source says the two-term indices satisfy e≥1; it should be 0≤e≤α, including the block with differential q−1; affects the proof.
- **Error** in wagner at Lemma 4.17 proof, printed p.61 (wagner lines 3035–3052): the source says closedness forces each coordinate commutator to vanish as a cochain; it should be that signed commutators are boundaries, witnessed by the product homotopy; affects the proof.
- **Error** in wagner at Lemma 4.32 proof, printed p.70 (wagner lines 3460–3461): the source says the framed complex computes prismatic cohomology of the untwisted coefficient extension; it should be the ψ_p-twisted completed extension along the Frobenius-induced map to D/([p]_q); affects the proof.
- **Gap** in wagner at Lemma 4.32 proof, printed p.70 (wagner lines 3462–3466): the source says the all-α décalage formula follows directly from the one-step prismatic theorem for any prism; it should be justified by iteration with the necessary completed base-change/décalage compatibility; affects the proof.
- **Misprint** in wagner-habiro at Theorem 2.9, printed p.16 (wagner line 674): the source says R is an A-algebra without repeating étaleness; it should be an étale A-algebra as required by the standing §2.2 convention and the proof; affects a stated result.
- **Misprint** in bhatt-scholze at Theorem 16.18 proof, printed p.113 (bhatt-scholze lines 4295–4296): the source says R≅E/J for a general q-crystalline object; it should use the structure map R→E/J from Definition 16.12 before Frobenius; affects the proof.
