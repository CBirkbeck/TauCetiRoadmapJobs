<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/14773#issuecomment-6868044779 -->
Review (codex) of fadd6c4

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) Specify canonical compatibility in the induced-filtration contract

   **Location.** `packages/SpectralSequencesAndConvergencePartII/design/README.md:414`: “weak convergence at `(p, n − p)` holding exactly when this presentation is an isomorphism”; also `packages/SpectralSequencesAndConvergencePartII/design/plan.json:1583`, the `needs` of `base-induced-filtration`.

   **Claim.** Existence of weak convergence, in the sense requested at README lines 355–362, is equivalent to invertibility of the canonical subquotient presentation. That convergence structure only requires isomorphisms β; it does not require compatibility with this presentation. The new contract therefore conflates an abstract convergence structure with convergence through the canonical comparison. This is a precision/compatibility defect in the requested gap, not an objection to its supplier being pending.

   **Witness.** Over a field k, let V = ⊕ₙ≥₀ k. Put K = (k → k⊕V), degrees −1,0, with d(a)=(a,0). Set FᵖK=(0→k⊕V) for p≤0, and FᵖK=0 otherwise.

   **Computation.** Every graded complex except gr⁰ is zero; gr⁰ has k⊕V in degree zero and zero differential. Thus E₁=E∞ has its sole nonzero object E∞⁰⁰=k⊕V. On the other side H⁰(K)=V, with F⁰H⁰=V and F¹H⁰=0. The canonical comparison is the projection π:k⊕V→V, whose kernel is k≠0. Nevertheless β(a,Σvₙeₙ)=ae₀+Σvₙeₙ₊₁ is an isomorphism k⊕V→V. Together with zero isomorphisms elsewhere it supplies the weak-convergence structure requested at lines 355–362, even a strong one because the abutment filtration is finite. Thus weak convergence exists while the canonical comparison is not invertible.

   The source distinguishes the two: stacks-012K line 3135, Definition 24.9, printed p.65, specifies convergence *through* the comparison of Lemma 24.6. Its criterion at line 3146 has that meaning. Part II's contract for general convergence structures does not impose it. The base design has the same ambiguity at `packages/SpectralSequencesAndConvergence/design/README.md:998`; citing or declaring the base does not resolve the distinction.

   **Exact repair.** In both the README and the plan's `needs`, replace the final clause by: “when both maps in this canonical subquotient presentation are isomorphisms, their composite supplies the weak-convergence isomorphism; convergence through this presentation means that both maps are isomorphisms.” Do not assert the converse for the mere existence of an arbitrary β. Keep this same explicit qualification in consumers. Sections 5.2 and 6.2 already specify the canonical comparison and need no change. Add the example above as a negative-control Check for the contract or its use in §1.2; no change to the base's files is requested here.

   **Repair test.** In this example the repaired sufficient condition fails because ker π=k, while the unrelated β remains permissible. With K=V[0] and the same step filtration, π=id_V and the repaired contract supplies β=id_V. Both sides of the intended distinction are tested. No finite-dimensionality restriction or narrowing of the library is needed.

   One finding, one blocking finding. The original supply-status finding is repaired; R01 concerns a newly written contract's mathematical precision.

## Verified sound

### Previous finding checked first

| Previous finding | Repaired passage | Independent verification | Status |
| --- | --- | --- | --- |
| Round 6 F01: base treated as available without declared gaps | README:303–305: “Each base section that a statement or a route here uses is a supplier gap below”; README:311–472 contains the nineteen “What SpectralSequencesAndConvergence must provide” contracts. | Parsed plan: nineteen distinct owned gaps; the README slug set and target-prerequisite slug set equal the plan's gap set. All are used. Base remains `parent`, and is absent from ordinary `suppliers`. The registry still has no admitted base roadmap; the declared contracts are consequently the correct mechanism. | repaired |

The repair report marks no finding “not actionable in this package”. No maintainer notes were supplied. I also rechecked the patterns retained from the earlier round: the finite horseshoe is imported, the graded consumers use §§2.6/3.4, and proof inputs for CE assembly, low-degree sequences and multiplicativity are listed. No additional occurrence was found.

### Coverage, principles and plan consistency

Read the six layers, all 24 target blocks, their API bullets, Checks and Needs lines, all nineteen new contracts, the plan, manifest, previous review and repair report. The plan contains 89 Checks. Both recorded pins equal `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

The prior review has computed rows for all 24 unchanged targets; I used those only for unchanged material with explicit values. The sample, headlines and changed contracts were recomputed below. The R01 pattern was searched throughout: the canonical wording of §5.2, README:1448–1450, and §6.2, README:1571–1575, avoids its converse; the false/ambiguous converse occurs in the new gap and its plan copy.

The roadmap develops general abelian-category constructions. Its module applications retain the commutative-ring hypothesis where native tensor requires it, arbitrary rings for Ext, and appropriate exactness/boundedness for infinite totals. No good-prime restriction, computational algorithm, new owner for an existing base construction, second copy of this roadmap on main, or upward dependency was found. There is no submitted `Suggested.lean`, sorry'd data or `set_option` in this design.

### Source verification

All eleven cited works have distinct existing manifest entries: seven cached texts and four settled uncertified works. The manifest parses; it was not changed. No text needed fetching. “Uncertified” is retained as an access limitation, not silently treated as verification.

| Seeded target | Locator actually read | Support and hypothesis check |
| --- | --- | --- |
| 1.2 Column and row filtrations | stacks-012K line 3241–3265, §25/Lemma 25.1, pp.67–68; grothendieck1957 line 1226–1235, (2.4.1), p.146 | Column first and second pages agree. Stacks's row d₁ has the extra sign; Part II explicitly uses the flip and computes the conjugation. Grothendieck's finite-antidiagonal convergence is not attributed to arbitrary totals. |
| 1.5 Acyclic assembly | stacks-012K line 3293–3303, Lemma 25.4, p.68; line 3354–3358, Lemma 26.1, p.69; line 3433–3438, Lemma 26.4, p.71 | Right resolutions use sums; left resolutions use products. The latter two source results are for abelian groups. The roadmap explicitly derives its category-level extension from the declared convergence inputs. weibel1994 Lemma 2.7.3 remains uncertified. |
| 2.1 Horseshoe | stacks-05QI line 3402–3448, Lemma 18.9, pp.67–68; line 3269–3287, 3301–3315 and 3363–3390, Lemmas 18.4, 18.6, 18.7, pp.65–67 | Enough injectives, bounded below, prescribed left resolution and simultaneous lower bound agree. Relative horseshoe is justified by the explicitly stated two homotopy corrections, using injectivity and degreewise splitting. Source proof slips are recorded below. |
| 2.2 Right derived functors | stacks-05QI line 2872–3011, Definition 16.2 and Lemmas 16.1–16.7, pp.57–60 | Additivity, enough injectives, lower bounds and truncation agree. Left exactness occurs where R⁰F=F and the stated acyclic-object convention require it. The classical/native comparison is the roadmap's comparison of two pinned constructions. |
| 2.3 CE resolutions | stacks-05QI line 3621–3654, Definition 21.1/Lemma 21.2, pp.72–73; line 3667–3689, pp.73–74 | Resolutions of cycles, boundaries and cohomology are required, not just injective columns. The source's construction preserves the lower bound. Split rows support passage of additive functors through horizontal cohomology. Lifting locators in Weibel and Cartan–Eilenberg are uncertified. |
| 2.4 First hypercohomology | stacks-05QI line 3655–3681, Lemma 21.3, pp.73–74; grothendieck1957 line 1236–1252 and 1348–1354, pp.146,148 | E₁=R^qF(K^p), horizontal differential and finite-filtration abutment agree. Independence starts on page 1, not with uniqueness of CE double complexes up to homotopy. |
| 2.6 Variance | grothendieck1957 line 1304–1308, p.147; stacks-05QI line 3449–3478, §19, pp.68–69 | The first source announces the left-derived/contravariant variants; the second states dual projective resolution results. The displayed formulas are deductions through opposite categories, whose degree reversal was checked at the pin. weibel1994 §5.7 remains uncertified. |
| 3.1 Composition | stacks-05QI line 3696–3717, Lemma 22.1, p.74; grothendieck1957 line 1338–1342, Remarque 1, p.148 | Correct direction R(GF)→RG RF; enough injectives and acyclicity on injectives give the equivalence. Effacement criterion follows by splitting a monomorphism from an injective and additivity. |
| 3.2 Complex composite sequence | stacks-05QI line 3718–3730, Lemma 22.2, pp.74–75; grothendieck1957 line 1330–1347, p.148, and 1506–1529, Proposition 2.5.4, p.152 | The D⁺ theorem is explicitly in Stacks. Grothendieck's object/resolving-functor versions support the comparison route; the arbitrary F-acyclic representative claim also uses §2.2(v) and §2.5. |
| 3.3 Low degrees/naturality | grothendieck1957 line 1330–1337, Theorem 2.4.1, p.148; declared base §3.6 | Source supports the object sequence. Low-degree statements are correctly attributed to the first-quadrant contract, not falsely described as separately numbered source theorems. The extended sequence has m≥1. |
| 3.4 Right exact/mixed composites | weibel1994 §5.8; cartan-eilenberg1956 Ch.XVI | Settled uncertified; no text certification claimed. Checked the opposite-category derivation, acyclicity condition and displayed five-term orientation independently. |
| 4.2 Universal coefficients | stacks-more-algebra line 7121–7134, Example 63.1, pp.153–154; line 8115–8127, §69, p.176; line 7413–7422, Example 65.5, p.160 | Source Tor example is bounded above after cochain conversion; the unbounded extension is explicitly obtained using the row half-plane sum-total theorem. Ext has the correct respective cohomological bounds and variance. |
| 4.3 Künneth | stacks-more-algebra line 7399–7422, Lemma 65.4/Example 65.5, p.160 | The source is Dᵇ, which the README says. Bounded-above extension is separately justified by projective CE resolutions and finite diagonals. The Tor₁ quotient has i+j=n+1. Other locators remain uncertified. |
| 5.1 Exact-couple pairings | may-primer line 249–287, Proposition 4.1/Corollary 4.2, pp.6–7 | Quantifiers in μₙ and the induced pairing agree. The statement correctly restricts the shift to n=m+1≥1. massey1954 remains uncertified. |
| 6.2 Higher Bocksteins/limit | may-primer line 147–168, Example 2.3, p.4; hatcher-at line 13330–13337, Proposition 3E.3, p.305 | Higher UCT has the stated cohomological degree shift. Finite generation is retained for Hatcher's summand rules. General f and unbounded torsion are derived from the explicit exact-couple towers, not attributed to the mod-p finite-type source. |

Additional passages read include §§1.1, 1.3, 2.5, 4.4, 5.2 and 6.1, against stacks-012K line 3284–3291 and 3400–3409; stacks-05QI line 3655–3689; grothendieck1957 line 1291–1299; stacks-more-algebra line 7135–7140 and 12960–13014; may-primer line 295–324. For R01, read stacks-012K line 3072–3106 and 3131–3151: the filtered-complex definition explicitly uses the canonical comparison. All author-flagged unread works were accounted for without reopening their settled status.

### Computed adversarial pass

Here k is a field, and p is a prime where used. The last column records changes required by the tested instance, not a claim that examples prove the general theorem. Zero inputs, identity maps and the nontrivial negative controls were checked against the formulas as well as against their Checks.

| Statement | Instance | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions / 1.1 total differential | Commuting unit square over ℤ and 𝔽₂ | d(1)=(1,1); d²(1)=−1+1=0. Unsigned d²=2 over ℤ; modulo 2 both give 0. | Integral witness distinguishes the sign. | none |
| 1.1 sum/product comparison | Staircase Dₚ,Oₚ, p≥0 | yₚ=xₚ−(−1)^p xₚ₊₁. On sums ker=coker=0. On products ker=ℤ·(1,1,−1,−1,…), coker=0; H⁰(κ)=0→ℤ. | Totals cannot be interchanged. | none |
| 1.2 columns/rows/flip | ℤ→×2ℤ in column 1 | Total differential −2; flipped total +2. Flip components +1,−1 give −2·1=(−1)·2. Both H²=ℤ/2; flipped row d₁=+2. | Matches the source-convention adapter. | none |
| 1.2 native/classical indexing | Horizontal ℤ→×2ℤ | Classical (0,0),(1,0) map to native (1,−1),(3,−2), page 2. Native connecting map sends 1 to 2; E₂⁰⁰=0, E₂¹⁰=ℤ/2. | Replacement of base §5.1 by the pin is valid. | none |
| 1.3 finite and half-plane convergence | Horizontal ×2; staircase | Finite case H¹=F¹H¹=ℤ/2, F²=0. Staircase row sequence/sum gives 0; column sequence/product gives H⁰=ℤ. Opposite choices would give false predictions ℤ and 0. | Stated half-planes exclude the bad choices. | none |
| 1.3 weak Serre qualification | ℚ→ℚ/ℤ; ℚ-vector-space class | E₁⁰⁰=ℚ is in the class; H⁰=ℤ is not. E₁¹⁰=ℚ/ℤ is outside, and d₁≠0, so both stated alternatives exclude this page. | All-position/stable-page qualifications needed. | none |
| 1.3 stabilisation bound | A length-r zigzag, versus isolated columns 0,100 | A nonzero dᵣ traverses r+1 adjacent columns; these count ≥r+1, so the count+1 bound is later than r. Isolated columns have dᵣ=0 for all r, not a d₁₀₀. | Count is used for an actual bicomplex, not an arbitrary spectral sequence. | none |
| 1.4 comparison | Staircase→column 0 | Column E₁ map=id_ℤ. Product H⁰ map=id_ℤ; sum H⁰ map=0→ℤ, outside the sum column bound. | Comparison hypotheses discriminate. | none |
| 1.5 assembly / augmentation | Staircase; horizontal identity; object resolution | Exact rows yield sum H=0, product H⁰=ℤ where the product row bound fails. Identity complex has ker=coker=0. Resolution A[0]→I has H⁰=A and other H=0 on both sides. | Correct total and augmentation directions. | none |
| 2.1 horseshoe | 0→ℤ→×2ℤ→ℤ/2→0 | Twisted middle resolution has H⁰=ℤ; untwisted direct sum has ℤ⊕ℤ/2. Finite projective outer lengths 0,1 give middle length ≤1. | Non-split example excludes the plain direct sum differential. | none |
| 2.1 relative correction | Shear h⁰=id on (ℚ/ℤ→×2ℚ/ℤ)², h¹=0 | Transported d(u,v)=(2u−2v,2v); d(0,1/4)=(1/2,1/2) versus (0,1/2). The shear, not the identity, intertwines d. | Two endpoint corrections have real content. | none |
| 2.2 derived comparison | Hom(ℤ/2,−) at ℤ; additive −⊗ℤ/2 | Injective resolution gives R⁰=0,R¹=ℤ/2, agreeing with classical Ext. For tensor, R⁰(ℤ)=0 but F(ℤ)=ℤ/2. | Left exactness is needed for F≅R⁰. | none |
| 2.3 CE conditions | Two columns ℚ→ℚ/ℤ with horizontal ×2 | Horizontal cokernels are 0,0, whereas H¹(ℤ→×2ℤ)=ℤ/2. Identity horizontal maps instead resolve B¹=A and H=0. | Injective columns alone are not CE. | none |
| 2.4 first hypercohomology | K=(ℤ→×2ℤ), F=Hom(ℤ/2,−) | E₁⁰¹=E₁¹¹=ℤ/2, d₁=0. Totals 1,2 each give ℤ/2=Ext^{n−1}(ℤ/2,ℤ/2). | Page and abutment degrees agree. | none |
| 2.5 second hypercohomology | Same K,F; identity on the non-CE model | Correct E₂⁰¹=E₂¹¹=ℤ/2. Non-CE model with F=id puts ℤ/2 at (1,0), whereas H¹(K) requires (0,1). | Conditions needed for the second page. | none |
| 2.6 opposite and left-derived | K=ℤ→×2ℤ in degrees −1,0; tensor ℤ/2 | K° has H⁰=op(ℤ/2),H¹=0. Tensor differential is zero and L₀=L₁=ℤ/2; indexing K^p would wrongly put a term at −1 homological degree. | Degree reversal correct. | none |
| 3.1 criterion, both directions | F=G=Hom(ℤ/2,−), I=ℚ/ℤ; identity F | FI=ℤ/2, R¹G(FI)=ℤ/2 versus R¹(GF)(I)=0. Identity F gives both composites RG and t=id. | Acyclicity criterion has positive and negative controls. | none |
| 3.2 complex composition | ℤ/4→ℤ/2 coextension, G=id, X=ℤ/2[0] | E₂⁰q=ℤ/2 for q≥0 and other columns zero; Ext^q_{ℤ/4}(ℤ/2,ℤ/2)=ℤ/2. Shift X by [1] moves q and abutment degrees down by 1. | Object case and nonzero complex shift agree. | none |
| 3.3 low degrees/naturality | Same coextension; multiplication by zero or identity | Five-term sequence is 0→0→k→k→0→k with middle id: image=kernel at every required place. Zero/id transformations induce 0/id on page and abutment. | Exactness and naturality agree. | none |
| 3.4 mixed variance | ℤ→ℤ/2, extension then Hom_{ℤ/2}(−,ℤ/2) | E₂⁰⁰=E₂⁰¹=k, abutment Ext⁰=Ext¹=k. With Hom_ℤ(−,ℤ) instead, the composite is 0 but proposed E₂¹⁰=k: excluded by acyclicity. | Required acyclicity is sharp. | none |
| 4.1 Tor balance / degree zero | ℤ/4,ℤ/6; socle tensor on R=𝔽₂[x,y]/(x²,y²) | ker(6 on ℤ/4)={0,2}, ker(4 on ℤ/6)={0,3}, both ℤ/2. For X=R/(xy), Tor₀=Tor′₀=k, but X⋆k=soc X=k². | Balance does not assert Tor₀=⊗ without right exactness. | none |
| 4.2 UCT, including unbounded | K=M=ℤ/2[0]; K=⊕ₙ∈ℤℤ/2[n] | First case H⁰=H⁻¹=k from Tor₀=Tor₁=k. Unbounded case Hⁿ=k², fitting 0→k→k²→k→0. Contravariant ℤ target gives H¹Hom(ℤ→×2ℤ,ℤ)=k=Ext¹(k,ℤ). | Boundedness and Tor/Ext directions agree. | none |
| 4.3 Künneth | k[ε]/ε² with K=L=k; K=R[0] | Torᵢ(k,k)=k for every i≥0: E₂^{−i,0}=k and H⁻ⁱ=k. For K=R only E₂⁰q=H^q(L). | No false two-column bound or finite global amplitude. | none |
| 4.4 change of rings | ℤ→ℤ/4, M=N=ℤ/2 | E²_{a,b}=k for a≥0,b=0,1; Tor^ℤₙ(k,k)=0 for n≥2. Thus d²:E²_{a,0}→E²_{a−2,1} is id up to the nonzero scalar for a≥2. | Nonzero differential is forced; no collapse claimed. | none |
| 5.1 μ₀ / derived shift | Pair only degree-zero classes of ℤ→×2ℤ; then Bockstein of ×4 | First case d(1·1)=2, Leibniz RHS=0, so μ₀ fails. Mod 2 ×4 case has d₁=0, μ₀ true, but d₂(1·1)=1, RHS=0: μ₁ and derived μ₀ both false. | n≥1 shift is essential. | none |
| 5.2 filtered pairing | 𝔽₂[x,y]/x², dx=y, filtration (y) | d₁(xy^p)=y^{p+1}; d₁(xy)=y²=d₁(x)y+x d₁(y). E₂=k=H(A). | Leibniz and limit product agree through canonical comparison. | none |
| 5.3 double-complex pairing | Exterior odd generators; non-associative rank-two pairing | (ε⊗1)(1⊗ε)=ε⊗ε, reversed product=−ε⊗ε. With e²=f, fe=e, ef=f²=0: (ee)e=e but e(ee)=0, although both differential rules read 0=0. | Koszul/flip signs hold; no algebra laws inferred from a pairing. | none |
| 6.1 Bockstein and general f | ℤ→×pℤ; f unit; f=0; A=k[x,y]/xy, M=A/(y)[0], f=x | d₁(1)=1. For a unit M/fM=0; f=0 is injective only on M=0. In the zero-divisor ring example x is injective on M=k[x], so Eᵣ⁰=k. | Torsion-free terms, not a domain coefficient ring, are the actual condition. | none |
| 6.2 higher pages / stabilisation | ℤ→×p^sℤ, s=1,2, p=2,3 | Eᵣ⁰=Eᵣ¹=𝔽_p for r≤s, d_s(1)=p^s/p^s=1, E_{s+1}=0. Both higher-UCT end terms give these values. | Correct page and sign, including p=2. | none |
| 6.2 infinite torsion / convergence iff | ⊕_{s≥1}(ℤ→×p^sℤ); ℤ→ℤ[1/p]; ℤ[0] | Direct sum Eᵣ⁰=⊕_{s≥r}𝔽_p≠0 but E∞⁰=0. Inclusion complex has E∞⁰=𝔽_p while gr H⁰=0 and (∩p^rH¹)∩H¹[p]=𝔽_p. ℤ[0] has E∞⁰=gr⁰ℤ[1/p]=𝔽_p and intersection 0. | Both directions of the canonical criterion discriminate. | none |

The following rows audit the nineteen newly written contracts rather than treating declared supply as a proof of their content. Their supplier is uniformly SpectralSequencesAndConvergence; the gap mechanism itself is valid. Each contract is a coherent section-level input, with explicit hypotheses, and no new owner is introduced.

| Changed contract | Instance | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| base-stabilisation-regularity | E₂⁰¹=E₂²⁰=ℤ, d₂=×2 | At (2,0), outgoing maps are already zero but incoming d₂≠0; E₃²⁰=ℤ/2. Stabilisation starts at 3, not 2. | Both incoming and outgoing maps matter. | none |
| base-limit-page | Bockstein of ⊕ₛ(ℤ→×p^sℤ) | Zᵣ⁰=⊕_{s≥r}k inside ⊕ₛk, Bᵣ⁰=0; ∩Zᵣ⁰=0 and E∞⁰=0 although every Eᵣ⁰≠0. | Meet, not eventual equality of abstract page objects. | none |
| base-bidegree-assignments | Classical (0,0)→(1,0), native page 2 | (1,−1)→(3,−2) has fil 0→1, deg 0→1; 2−e=1 gives e=1. Homological (p,q)→(p−r,q+r−1) gives fil increment r and deg increment 1. | Correct shifts and variance. | none |
| base-bounded-below-regularity | Finite first page at adjacent total degrees | An outgoing target has fil(pq)+r−e, which is beyond the finite maximum for sufficiently large r; an incoming source has fil(pq)−r+e, below the minimum. Both objects=0 and both maps=0. | Finite adjacent supports imply eventual stabilisation. | none |
| base-decreasing-filtrations | ℤ/4 with F⁰=ℤ/4,F¹=2ℤ/4,F²=0 | gr⁰=gr¹=ℤ/2; join=ℤ/4, meet=0, lim quotients=ℤ/4. Constant filtration on ℤ instead has gr=0 and meet=ℤ. | Finiteness supplies the three predicates; constant filtration is excluded. | none |
| base-convergence-structures | E=0, H⁰=ℤ constant; I=∅ | gr H=0=E∞, giving weak convergence, but meet F=ℤ≠0. For empty I no β or filtration condition is required. | Abstract structures intentionally permit arbitrary β; see R01. | none to this contract |
| base-converging-morphisms | E∞=H⁰=ℤ, trivial filtration; (f,h)=(−1,id) | β′E∞(f)=−1 but gr(h)β=+1. For (id,id), both are +1. | Compatibility excludes a wrong marking. | none |
| base-finite-filtration-convergence | ℤ/4 versus (ℤ/2)² | Both have two graded factors ℤ/2, finite exhaustive separated complete filtrations; underlying groups have exponents 4 and 2. | No splitting or uniqueness of the abutment is asserted. | none |
| base-comparison-theorem | ℤ→ℤ_p with p-adic filtrations | Every graded map is id_𝔽p; underlying map is not onto. ℤ→lim ℤ/p^r=ℤ_p is not onto, so the source is not complete and the strong-comparison hypothesis fails. | Completeness excludes the bad comparison. | none |
| base-first-quadrant-sequences | Only E₂⁰⁰=k; m=0 versus m≥1 | For m=0 the proposed two consecutive identity edges k→k→k have composite 1≠0. The contract keeps m≥1; with m=1 its low-degree groups here are all 0. | Correct lower bound. | none |
| base-einfty-comparison | K=(k→id k), degrees −1,0; source filtration 0, target step | Zᵗ=Z∞=k, B∞=0, Bᵗ=k; inclusion=id_k, projection k→0. The latter is noninvertible exactly as B∞≠Bᵗ predicts. | Canonical subquotient criterion is correct. | none |
| base-induced-filtration | R01's k→k⊕V, V=⊕ₙk | E∞=k⊕V, gr H=V; canonical π has ker=k, but basis-shift β is invertible. Thus abstract weak convergence=true, invertibility of π=false. | Missing canonical compatibility in the converse. | R01 |
| base-finite-filtered-convergence | Stupid filtration of ℤ→×2ℤ | H¹=ℤ/2, F¹=ℤ/2,F²=0; E∞¹⁰=ℤ/2 and the canonical map is identity on the quotient. R01's input lacks exhaustivity/finite filtration on K⁻¹. | Finiteness on the terms gives the canonical statement. | none |
| base-exhaustive-bounded-below-convergence | Non-exhaustive acyclic complex above | E∞⁰⁰=k versus H⁰=0; join FᵖK⁻¹=0≠k, so the required exhaustivity fails in degree n−1. | The negative control is excluded. | none |
| base-exact-couple-spectral-sequence | a=(−1,1),b=0,c=(1,0) | c+b−(r−1)a=(r,1−r). For E=0, H(E,jk)=0 and every page is 0. | Native page shape and derived-couple iteration agree. | none |
| base-exact-couple-towers | ℤ→×p^sℤ, f=p | k(1)=p^{s−1} in ℤ/p^s, belonging to p^rH¹ exactly for r≤s−1. Zᵣ⁰=k for r≤s, Z_{s+1}⁰=0; d_s(1)=j(1)=1. | Indices match §6.2. | none |
| base-filtered-exact-couple | Stupid filtration of ℤ→×2ℤ | k(1)=2 in H¹(F¹K)=ℤ, j=id to H¹(gr¹K)=ℤ, hence jk=×2, equal to the pinned first differential. | Same sign as Conventions and §1.2. | none |
| base-tower-exact-categories | Module towers ℤ/p^{n+1}↠ℤ/p^n; ×p on ℤ | First limit=ℤ_p, lim¹=0, projections onto. Second has lim=0, lim¹=ℤ_p/ℤ≠0, but transitions are not epi. | No claim that arbitrary towers are acyclic. | none |
| base-complete-convergence | ℤ_p[0] with p-adic filtration; ℤ[0] | Both have E₁^{s,−s}=𝔽p for s≥0 and 0 for s<0, all d=0. Completion maps are ℤ_p≅lim ℤ/p^r and ℤ⊊lim ℤ/p^r respectively. | Complete input yields the stated strong case; incomplete input excluded. | none |

### Library and duplication audit

Object searches used the current registry's `roadmaps grep` and `roadmaps show`, and the pinned library files, rather than merely checking proposed theorem names. The broad searches for CE resolutions, product totals, Tor balance, exact-couple pairings and higher Bocksteins were checked for whether each hit actually owned the generic object. Mixed-complex product totalisations and topological applications do not own the general abelian-category construction. A name scan covered 86 explicit library references from the README and plan; ambiguous terminal-name hits were resolved in the named namespaces/files. No missing cited declaration was found. The scan's apparent miss for `quasiIso_id_tensorHom` is an `instance`, not a missing theorem.

The principal pinned declarations and hypotheses opened were:

| Pinned file and line | Declaration/content checked | Consequence |
| --- | --- | --- |
| `Mathlib/Algebra/Homology/HomologicalBicomplex.lean:38`; `Mathlib/Algebra/Homology/TotalComplex.lean:46`, :266, :273, :349, :412; `Mathlib/Algebra/Homology/TotalComplexSymmetry.lean:113` | `HomologicalComplex₂`, `HasTotal`, `total`, `ιTotal`, `totalDesc`, `total.map`, `totalFlipIso` | Sum total is native; product total is the new construction. |
| `Mathlib/Algebra/Homology/Bifunctor.lean:83`, :124; `Mathlib/Algebra/Homology/Embedding/StupidTrunc.lean:36` | `mapBifunctorHomologicalComplex`, `mapBifunctor`, `stupidTrunc` | Native tensor/total and truncation inputs. |
| `Mathlib/Algebra/Homology/SpectralSequence/Basic.lean:36`, :51, :54, :109 | `SpectralSequence`, `Hom`, `comm`, `CohomologicalSpectralSequence` | Pages and transition isomorphisms are supplied. The carrier contains no abutment, completeness or canonical convergence marking. |
| `Mathlib/Algebra/Homology/CochainComplexOpposite.lean:80`; `Mathlib/Algebra/Homology/Opposite.lean:300` | `opEquivalence`, `homologyOp` | Opposite-category degree conversion is native. |
| `Mathlib/Algebra/Homology/DerivedCategory/TStructure.lean:201`; `Mathlib/Algebra/Homology/DerivedCategory/Plus.lean:142`, :155, :218, :226; `Mathlib/Algebra/Homology/CochainComplexPlus.lean:167` | `Plus`, `singleFunctor`, `homologyFunctor`, `isIso_iff`, `Q`, `mapCochainComplexPlus` | Existing bounded-below categories/functors are used. |
| `Mathlib/Algebra/Homology/DerivedCategory/RightDerivedFunctorPlus.lean:47`, :96, :109, :156; `Mathlib/CategoryTheory/Functor/Derived/RightDerived.lean:54` | Right derived functor, unit, invertibility on injective complexes, natural transformations, `IsRightDerivedFunctor` | Additivity/enough injectives and `HasDerivedCategory` are in scope. Left Kan-extension direction is the one needed for t. |
| `Mathlib/CategoryTheory/Abelian/RightDerived.lean:106`, :110; `Mathlib/CategoryTheory/Abelian/LeftDerived.lean:105`, :109, :359 | Classical derived functors, resolution computations, `leftDerivedZeroIsoSelf` | Degree-zero comparison requires preservation of finite colimits. Comparison of the two right-derived constructions remains new. |
| `Mathlib/CategoryTheory/Preadditive/Injective/Basic.lean:196`, :280; `Mathlib/CategoryTheory/Abelian/Injective/Resolution.lean:95`, :170 | Adjoint preservation of injectives, `desc`, `descHomotopy` | The exact-left-adjoint criterion is available; resolution lifting is imported. |
| `Mathlib/Algebra/Homology/HomotopyCategory/KInjective.lean:42`, :134; `Mathlib/Algebra/Homology/DerivedCategory/KInjective.lean:42`; `Mathlib/Algebra/Homology/DerivedCategory/DerivabilityStructureInjectives.lean:61` | `IsKInjective`, bounded-injective theorem, `Qh_map_bijective`, `Plus.exists_quasiIso_injective` | K-injective lifting and same-bound replacements are native. |
| `Mathlib/CategoryTheory/Monoidal/Tor.lean:44`, :50, :61 | `Tor`, `Tor'`, projective vanishing | The two definitions exist; the file explicitly lacks their general balance isomorphism. |
| `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118`; `Mathlib/CategoryTheory/Abelian/Projective/Ext.lean:39`; `Mathlib/CategoryTheory/Abelian/Injective/Ext.lean:40` | `Abelian.Ext`, both `extEquivCohomologyClass` constructions | Ext balance is already supplied and remains a Check. |
| `Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean:85`, :399, :519, :658, :878 | Restriction, extension, coextension, both adjunctions | Coextension permits arbitrary rings; extension uses commutative rings. |
| `Mathlib/CategoryTheory/Filtration/Basic.lean:73`, :90 | `FilteredObject`, `FilteredObject.Hom` | Filtration steps are monomorphisms; exhaustivity, separation and completeness are not fields of this carrier. |
| `Mathlib/CategoryTheory/Limits/Shapes/Countable.lean:61`, :108; `Mathlib/CategoryTheory/Abelian/GrothendieckAxioms/Basic.lean:126`; `Mathlib/CategoryTheory/Limits/HasExactLimitsOfShape.lean:47`; `Mathlib/Algebra/Category/ModuleCat/AB.lean:30`, :38 | Countable limits/colimits and exactness classes; module AB5/AB4Star | Module instances use R:Type u and ModuleCat.{u} R, matching the repaired convention. |
| `TauCeti/Algebra/Homology/SpectralSequence/Filtered/SpectralObject.lean:191`, :304, :338, :409, :425; `Filtered/Naturality.lean:83`; `Filtered/FirstPage.lean:89` in the same directory | `spectralObjectMap`, `filtrationFunctor` and mono instance, `spectralSequence`, first-page cokernel isomorphism, `filtrationFunctorMap`, first differential | Direct import replacing base §5.1 has the stated indexing and signs. |
| `TauCeti/Algebra/Homology/SpectralObject/SpectralSequenceMap.lean:230`; `TauCeti/Algebra/Homology/SpectralObject/Stabilization.lean:45`; `TauCeti/Algebra/Homology/SpectralSequence/Filtered/Convergence.lean:51` | `spectralSequenceMap`, `EInfty`, `filtrationAbutmentIso` | Spectral-object EInfty and filtered abutment are native; they are not automatically the page-tower limit without the declared comparison. |
| `TauCeti/CategoryTheory/Preadditive/TowerDifference.lean:77` | `Functor.towerDifference` | Coordinates are xₙ−transition(xₙ₊₁); the declared class adds lim¹-acyclicity of epimorphic towers. |
| `TauCeti/Algebra/Homology/SpectralSequence/Comparison.lean:32`; `TauCeti/Algebra/Homology/SpectralSequence/Bicomplex.lean:410`, :442, :446; `TauCeti/Algebra/Homology/TotalComplex.lean:580`, :596 | Later-page isomorphism; first-quadrant bicomplex sequences; row/augmentation quasi-isomorphisms | Existing first-quadrant results are consumed, not rebuilt. |
| `TauCeti/CategoryTheory/Exact/Abelian.lean:124`, :166; `TauCeti/CategoryTheory/Exact/Injective.lean:165`, :426; `TauCeti/CategoryTheory/Exact/Projective.lean:218`; `TauCeti/CategoryTheory/Exact/Resolution/Horseshoe.lean:49`, :235 | Abelian exact structure, one-step injective horseshoe, finite projective horseshoe and its length bound | Finite projective ownership remains upstream; Part II adds the stated complex/relative/unbounded-length forms. |
| `TauCeti/Algebra/Homology/Monoidal/KFlat/Basic.lean:89`, :222, :361; `TauCeti/Algebra/Homology/Monoidal/Homology/Cross.lean:153`; `TauCeti/Algebra/Homology/Monoidal/Homology/Kunneth/Sequence.lean:729`; `TauCeti/Algebra/Homology/UniversalCoefficient/Basic.lean:180` | K-flat predicate and tensor instances, bounded-above flat criterion, cross product, hereditary Künneth and UCT | Existing specialisations remain comparisons. Module exactness supplies the categorical K-flat theorem's extra hypotheses. |

The registry resolves every cross-roadmap citation. Its automatic name resolver does not inspect the pinned Lake packages on this host, so its empty diagnostic was not used as a substitute for the pin audit. The supplied board-package index was read before any absence conclusion. Neither this Part II nor its base has a roadmap folder on main or an open roadmap head; the base's board design is read as a declared contract, not admitted supply.

| Current roadmap/location read | Shared object and ownership resolution |
| --- | --- |
| `packages/SpectralSequencesAndConvergence/design/README.md`, §§1.3–1.4, 2.1–2.2, 3.1–3.6, 4.3, 5.2–5.4, 6.1–6.3, 7.2, 7.5 | All nineteen section references exist. Base owns the requested general convergence language. R01 concerns a contract's meaning; future implementation of these gaps is not a finding. |
| Main `TauCetiRoadmap/StableHomotopyKTheory/README.md:2618`, §7.22 | Owns general exact/derived couples and the page-r formula. Part II adds pairings and assembly into the base's carrier through a gap. |
| Main `TauCetiRoadmap/DerivedModuleAlgebra/README.md:794`, §0.2; :955, §S.1 | Owns derived tensor and the first-quadrant package. Part II extends double complexes beyond that quadrant and supplies the explicit sign dictionary. |
| #858 `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:4871`, §D7.1 | Owns object composite-functor sequence, its finite filtration and edge maps. Its stated CE proof route agrees with the contract. Part II adds D⁺ complexes and variance/composition refinements. |
| #1179 `TauCetiRoadmap/ArithmeticStatisticsPartVIII/README.md:889`, §5.16, Tor subsection | Owns graded, possibly noncommutative Tor and its sequences. Layer 4 here is on the native ungraded commutative tensor carrier. |
| #1229 `TauCetiRoadmap/SchemeKTheoryOperations/README.md:2510`, §6.7, sequence at :2548; #1430 `TauCetiRoadmap/K3BlochGroups/README.md:1191` | Group hyperhomology and its bounded-below reindexing adapter remain with those owners. |
| Main `TauCetiRoadmap/AlgebraicTopology/README.md:1888`, §5.1; open revisions #1807 and #1808, scope paragraphs | Singular-chain Künneth remains the topological application. Read both heads; no generic Tor balance is reassigned here. |
| Main `TauCetiRoadmap/DGFloer/README.md`, Layer 1 item 2; main `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4186`, :4189, :4440, :4926 | Serre product filtration, Leray, Čech, local-to-global and Galois-cover sequences retain their application owners. The named sheaf target identifiers resolve. |
| #871 `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md:2087`, ALS.1.7; #1040 `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:3797` | Geometric coefficient change and bounded sheaf hypercohomology are valid application citations. |
| #1087 `TauCetiRoadmap/TorsionCohomologyInfrastructure/README.md:816`, :844; #1745 `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurvesPartII/README.md:657` | Torsion UCT/Künneth and Ext change of rings are downstream applications. |
| #2263 `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroupsPartII/README.md:433` | Its graded Tor contracts remain its own supplier's. Part II's description correctly routes the abstract instances through §§2.6/3.4. |
| Main `TauCetiRoadmap/GrothendieckEulerForms/README.md:501`, §3.5 | Finite projective-resolution calculus and the pinned horseshoe remain upstream. |
| Main `TauCetiRoadmap/TopologicalSheafCohomology/README.md:164`, §1.4 | Fixed-cover double complexes, refinement independence and sheaf comparisons are its application, not a second generic CE construction. |
| #2270 `TauCetiRoadmap/DerivedInfinityCategories/README.md:36`; #1630 `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:6`, and main's scope | Higher-category/enhanced-sheaf ownership does not overlap the newly owned classical generic spectral constructions. |

The overlap record reports no dropped cited IDs, IDs defined only by an unnamed open revision, or another open head changing this roadmap. These were checked against the named heads. The third, results/headings-based closest-roadmap list is empty. No second copy on main was found.

Overlap check: read SchemeKTheoryOperations, DerivedInfinityCategories, EnhancedDerivedSheaves, AlgebraicTopology (main and both listed open heads), DerivedModuleAlgebra, GrothendieckEulerForms and TopologicalSheafCohomology; shared objects remain owned by SchemeKTheoryOperations §6.7 (group hyperhomology), AlgebraicTopology §5.1 (singular Künneth), DerivedModuleAlgebra §§0.2/S.1 (derived tensor/first-quadrant sequences), GrothendieckEulerForms §3.5 and pinned Tau Ceti (finite projective resolutions), and TopologicalSheafCohomology §1.4 (Čech hypercohomology); no common newly owned construction with the two enhanced/higher-category roadmaps.

### Supplier order

All 24 Needs lists were checked against their statements/routes and the plan. Internal dependencies point to earlier targets; the aggregate layer dependencies have no cycle. Supplier gaps preserve the base's ownership, and the nineteen slug sets match. Gaps cover the unavailable base prerequisites; no absence from the supplier is counted as a finding. R01 is the single contract-precision exception.

The prescribed dependency check produced:

```text
candidate: SpectralSequencesAndConvergencePartII is not in the merge order yet; checked as if placed after ArithmeticGaloisDuality (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2170 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The reported provisional placement is allowed at design stage.

### Shape, headline theorems and package checks

Read DerivedModuleAlgebra, GrothendieckEulerForms and TopologicalSheafCohomology on main for the house form. The design has the summary, ownership, conventions, exact contracts, build paragraph, six mathematical layers, Examples/Dependencies endings, downstream consumers and references. Every target has a locator and a Needs list. Definition/construction blocks retain API facts and at least three Checks: totals 4, filtrations 5, derived functors 4, CE resolutions 4, each hypercohomology construction 3, dual functors 3, composition transformation 3, composite sequence 3, exact-couple pairing 4, double-complex pairing 4, Bockstein couple 4. R01 requests a discriminating comparison Check for the new contract. No process dates, PR numbers, machine paths, HTML anchors, LaTeX delimiters or executable algorithm occur in the design text. Names in mathematical code spans are notation or imported APIs, not missing claimed declarations of this roadmap; prospective plan names are not submitted Lean declarations.

The headline list is: double-complex convergence and comparison; acyclic assembly; horseshoe and CE existence/lifting; the derived/classical right-derived comparison; both hypercohomology sequences and variance forms; the composition criterion and composite-functor sequence with low degrees/naturality; Tor balance; UCT, Künneth and change of rings; page pairings with Leibniz and compatible limits; Bockstein pages, higher differentials, stabilisation and convergence.

This is a design submission, with no `Suggested.lean`. Therefore there are zero sorried theorem statements to test for padding, zero declaration binders to compare using `#check @name`, and no import/docstring/signature defect to assess. In particular there is no claim of a passing package build. At package stage the native Tor-balance and classical/right-derived comparison headlines must be considered individually: missing convergence carriers do not excuse omitting these statable theorems. The other headlines require their own native-carrier assessment or explicit module-docstring exclusions when the file is written.

Elaboration: **not available (this lane does not elaborate)**. No Lean command, tactic probe, or signature elaboration was run. Reading definitions at the pin was used where applicable; “sorry only” warnings cannot be certified without an elaboration.

### Copyright, arrangement and reuse

Compared the readable sampled passages and six additional sections (§§1.1, 1.3, 2.5, 4.4, 5.2, 6.1), plus the filtered-complex criterion behind R01, with the cached texts. The CE short exact sequences, spectral-page formulas and μₙ quantifiers are mathematical content; the roadmap does not reproduce accompanying expository sentences, tables, figures or exercise lists. No public-formalisation reuse is present in a submitted Lean file, since there is none.

Counts of source-key locator occurrences before References: stacks-05QI 15, grothendieck1957 14, stacks-012K 11, weibel1994 11, may-primer 10, stacks-more-algebra 7, cartan-eilenberg1956 5, mccleary2001 2, hatcher-at 1, massey1954 1; total 77. Douady is recorded for excluded scope in References rather than a target locator.

Opened the largest source's contents, stacks-05QI line 7–45. The mapping is §2.1↔source §18, §2.2↔§16, §§2.3–2.5↔§21, §2.6↔§19, §§3.1–3.2↔§22: this is not a same-order run reproducing its contents. The other layers draw on the homology and algebra chapters, May and Hatcher. The mathematical dependencies require the principal direction: §2.4 needs §§1.2–1.3; §3.2 needs §2.5; §4.4 needs Layer 3; §5.3 needs Layer 1; §6.2's multiplicativity needs §5.2. No layer is named for a source chapter, and no prose promises to follow a source's order.

Source independence: 21 passages compared with 6 sources, no copied expression identified; largest share stacks-05QI, 15 of 77 locators; contents compared with stacks-05QI: independent. Wording and contents of weibel1994, mccleary2001, cartan-eilenberg1956 and massey1954 remain untested because their texts are settled uncertified.

## Not verifiable

- weibel1994 §§1.2, 2.2, 2.7, 5.6–5.8; mccleary2001 Chs.2,10; cartan-eilenberg1956 Chs.XV–XVII; massey1954: settled uncertified. Their wording, full hypotheses, theorem/page numbering and contents were not checked against unavailable texts. They were not fetched or requested again.
- A future admitted implementation of the nineteen base contracts is not available. Their current section identifiers, ownership and required content were reviewed; supplier absence is not a defect. R01 must be fixed in the requested contract before conditional acceptance.
- No `Suggested.lean` is submitted, and this lane does not elaborate. A package build, one-tactic probe and binder audit remain unperformed and are not certified by this design review.

## Source issues

- **Misprint** in may-primer at Proposition 4.1, printed p.7: the source says the condition indexed n shifts to the condition indexed n−1 without restricting n; it should require n≥1; affects a stated result.
- **Misprint** in may-primer at Example 2.3, printed p.4: the source says a free integral summand contributes ℤ to each mod-p page; it should contribute 𝔽_p; affects a stated result.
- **Misprint** in stacks-05QI at Lemma 18.4, proof, printed p.65: the source says the residual map uses hⁿ⁻¹ and a reversed chain-map composition; it should use hⁿ and αⁿ∘dⁿ⁻¹; affects the proof.
- **Misprint** in stacks-05QI at Lemma 18.7, proof, printed p.67: the source says β₁−β₂ is the boundary of h₁−h₂ after defining γ−βᵢ as the boundary of hᵢ; it should use h₂−h₁ and the correctly parenthesised homotopy boundary; affects the proof.
- **Misprint** in stacks-05QI at Lemma 21.3, proof, printed p.74: the source says the relevant horizontal cohomology complex has degree p; it should have degree q in the calculation of the second page at (p,q); affects the proof.
- **Misprint** in stacks-05QI at Lemma 22.1, proof, printed p.74: the source says to evaluate t at RF(I); it should evaluate t at I placed in degree zero; affects the proof.

## For the human reviewers

- Not tested: weibel1994, mccleary2001, cartan-eilenberg1956 and massey1954 have settled uncertified status in `packages/SpectralSequencesAndConvergencePartII/sources.toml`. Their wording and arrangement remain unread. The largest-share source, stacks-05QI, and its contents were available and checked.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "fadd6c4f0a3b062884a1d21c677af9ba8f7f0dae", "job": "REV-DESIGN-SpectralSequencesAndConvergencePartII~7", "model": "gpt-6-astra", "worker": "chris-6"} -->
