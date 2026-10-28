<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1338#issuecomment-6400261129 -->
Review (codex) of 9665b07

Verdict: accepted
Conditional on the announced gaps: `ILLUSIE-2003`, `equicharacteristic-cohen-coefficients`, `generic-constructibility-noetherian`

No findings. All four findings of round 2 are repaired. Acceptance is conditional on the three declared supplier contracts: `ILLUSIE-2003`, `equicharacteristic-cohen-coefficients`, and `generic-constructibility-noetherian`. These are precise, owned contracts recorded in both the README and the design; their outstanding delivery is not a package defect.

## Verified sound

Read the four package files, the previous review and repair report, the board package index, the three design gaps, all 55 numbered target subsections and all 56 Needs clauses. Rechecked the 15 seeded source targets, the repaired passages and their uses elsewhere. For unchanged mathematics, retained only round 2's explicitly computed adversarial rows; supplied new computations below for its incompletely tabulated sections. Checked supplier citations anew against main, the available open heads and the board designs. No author file or source-manifest entry was changed.

### Previous findings, checked first

All locations in this table refer to `packages/EtaleDualityAndPerverseSheavesPartII/README.md`.

| Previous finding | Status | Repaired passage and retest |
|---|---|---|
| F01: wrong coefficient DVR in invariant algebraization | Repaired | Line 462: “Thus take S = Spec V^H⟦t_1, …, t_(d−2)⟧”. The preceding route algebraizes B and its action before taking invariants. For V=W[π]/(π²−3), H=C₂ and B=V⟦x⟧, the fixed rings are W and W⟦x⟧; W[x] completed at (3,x) gives the required model. A V-structure would still require the impossible equation 2v₃(b₀)=1. |
| F02: duplicate split-cover theorem | Repaired | Line 1378: “Apply the split-cover theorem of ArcTopologyAndDescent §11.2”. Lines 21 and 114 assign ownership to that supplier; line 1374 now targets only cohomology and its comparison. One and two algebraically closed field factors give H⁰=G and G², with higher groups zero. The new comparison preserves both primitive idempotents. |
| F03: deleted contracts in Layer 6 summary | Repaired | Line 1236: “with exceptional pullback on the finite-cohomological-dimension domain of §F.2”. The same paragraph identifies §6.8's exchange and its tensor–Hom suppliers. The two obsolete qualifiers have no remaining occurrence. For j=id, empty U and a trait's generic open, the exchange gives K, 0 and Rj_*Λ respectively. |
| F04: higher-graded API and third Check | Repaired | Line 248: “For a ≥ 1”; the definition specifies base-graded and degree-zero compatibility. Lines 252–256 give identity, inverse and composition. Line 268 distinguishes gr¹₁(k⟦t⟧)=k from gr¹₁(k)=0 despite equal closed fibres. The laws were retested with z↦2z, z↦z/2 and z↦3z. |

The pattern search covered the rest of the package. The coefficient action in §1.4 and the three native bundles retain their actual structural maps; §§2.2–2.3 and 6.9 consume the smaller regular base, without imposing a V-algebra structure on B^H. Section 8.5 consumes §8.4's cohomological comparison, not a second split-cover construction. Sections 0.7 and 5.6 retain approximation of the pair and graded data. The summary in Layer 6 agrees with the individual exchange and exceptional-pullback contracts. No settled external finding is re-raised.

### Seeded source verification

All 15 sampled targets were checked against legal cached text. ILO14 locators mean the recorded arXiv v1 numbering and printed pagination, as the bibliography explicitly specifies; CS24 means the recorded v3. The source-line numbers below are the extraction's own numbered lines. The final-version comparison files do not silently replace these versions.

| Target | Locator and text read | Hypotheses and support verified |
|---|---|---|
| 0.1, alt/S | ILO14 II 1.1.2, 1.1.8, 1.2.2–1.2.7, pp. 23–26; ILO14 lines 1158–1265 | Noetherian base, reduced finite-type objects, maximal dominance and finite generic extensions. The md functor is right adjoint on the larger reduced maximally dominant category; md alone does not imply generic finiteness. Products and flat-base-change reduction agree. |
| 0.5, approximation | ILO14 III 4.2, 5.1, 5.2, 5.4, pp. 39, 41–43; ILO14 lines 1872–1898, 1958–1984, 2030–2050 | Excellent henselian local A, completion and smooth models; quantifiers α₁,n₀,c precede all finer approximations. The order is n+1−c, and regularity requires a≥2. The new full graded definition and base compatibility agree with III 4.2. |
| 0.7, complete-local reduction | ILO14 III 6.1–6.2, p. 43; ILO14 lines 2064–2079 | Reduction from complete local rings to quasi-excellent schemes, with nowhere-dense boundary and the correct alteration topology. The README's line-2056 pointer is nearby; the theorem and page correctly identify the result. |
| 1.5, partial algebraizability | ILO14 V 2.1.1, p. 64; ILO14 lines 2884–2889; intersection argument at lines 2896–2899 | Complete noetherian local base of strictly smaller dimension, finite-type model, maximal ideal above the base maximal ideal, completion identification and exact extension of every ideal. Arbitrary families in the definition, finite families in existence theorems. |
| 1.7, mixed partial algebraization | ILO14 V 3.1.1–3.1.4, p. 66, and 3.2.1–3.2.4, pp. 67–68; ILO14 lines 2957–3035 | Normal complete local mixed-characteristic input, d≥2 and ℓ≠p. The extension is chosen before the ideal family. Equivariant descent precedes invariants; the smaller base has coefficient DVR V^H. Vertical primary ideals use symbolic powers. |
| 2.3, prime-to-ℓ uniformization | ILO14 IX 1.1 and 2.3–2.4, pp. 131–134; ILO14 lines 5893–5898, 6040–6061 | Noetherian quasi-excellent X, nowhere-dense Z and invertible prime ℓ. Finite alt_ℓ′-covering family, regular connected sources and snc supports. The modification input requires the tame, generically free action on the separated log-regular model produced in the route. |
| 5.1, dimension functions | ILO14 XIV 2.1.1–2.1.2, 2.1.8, 2.2.2–2.2.3, 2.4.5, pp. 209–216; ILO14 lines 9869–9877, 9979–9994, 10002–10012, 10178–10188 | Étale immediate specialization and the sign δ(y)=δ(x)−1; étale sheaf and locally constant differences. Closure dimension and −dim O are restricted to their stated domains. The strictly local quasi-excellent application uses XIV 1.3.2 at line 9860. |
| 5.2, existence | ILO14 XIV 2.2.1, 2.2.4–2.2.6, 2.3.1, 2.3.3, pp. 212–214; ILO14 lines 9997–10058, 10085–10100 | Both directions of the universally-catenary/Zariski-local equivalence; étale-local existence for quasi-excellent schemes; the normal quasi-excellent −dim O formula. No global existence on every quasi-excellent scheme is asserted. |
| 5.3, regular base change | ILO14 XIV 2.5.3, pp. 216–217; ILO14 lines 10216–10234 | f qcqs, g regular between noetherian schemes, n invertible and arbitrary ℤ/n-module sheaf. Exchange direction and Popescu/smooth-base-change route agree. Global comparison is deduced only with the separate strict-local hypothesis. |
| 5.6, affine Lefschetz | ILO14 XV 1.1.2 and 1.2.1–1.2.4, pp. 219–220; ILO14 lines 10323–10364 | Quasi-excellence, dimension function, affine finite-type f, constructible invertible coefficients; support dimension decreases by q. The strict-local formulation uses normalized closure dimension. |
| 5.7, local affine Lefschetz | ILO14 XV 1.2.2, 1.2.4, p. 220; Exposé 0 Corollary 8, p. 5; ILO14 lines 10350–10364, 396–402 | Strict-local d-bound, henselian d+cd_ℓ(k) bound, and fraction-field equality in the integral case. The residue-field term is retained. |
| 6.7, functoriality | ILO14 XVII 4.1.1–4.1.3, p. 280, and 4.2.1, pp. 281–282; ILO14 lines 13512–13539, 13555–13580 | Regular ordinary pullback and compactifiable finite-type exceptional pullback have different dimension transports. Both preserve putative/potential structures and composition. |
| 6.12, local duality | ILO14 XVII 6.1.1, p. 293; ILO14 lines 14233–14246; CS24 proof of 3.2.3, p. 33, lines 1367–1380 | This is the normalized local-duality consequence of biduality and the support/internal-Hom adjunction, not a verbatim formula attributed to 6.1.1. Strict locality, excellent noetherian geometry, bounded constructibility and closed-point pinning give degree −i and Hom into self-injective Λ. |
| 7.1, principal punctured vanishing | CS24 proof of 3.2.3, equation (3.2.3.2), p. 33; CS24 lines 1364–1366 | The proof has already reduced to complete strictly henselian regular R. The package uses excellent strictly henselian regular R, where its §5.7 applies directly. It does not extrapolate an unsupported punctured-open completion comparison. |
| 7.2, extension by zero | CS24 proof of 3.2.3, equation (3.2.3.1), p. 33; CS24 lines 1361–1380 | Arbitrary regular local R, f in its maximal ideal and invertible prime ℓ. Supported comparison, strict henselization and completion precede duality. The threshold is i<d, not i≤d. |

Also checked the repaired split-cover use against CS24 Lemma 2.2.4, pp. 19–20, lines 774–797, and the product-cohomology argument in Theorem 2.2.7, pp. 21–22, lines 864–871. Splitting makes sections exact; compactness makes a locally constant section's image finite; finite clopen partitions and their orthogonality are preserved by §8.3. No rank bound on ultraproduct components is used.

The only explicitly uncertified original works are Ill03 and Epp73. They remain settled, under their existing keys. ILO14 XV 1.1.3 and 3.3.2 identify the trait input; K10 lines 90–113 justify the cancellation correction used in §1.3. SGA4half lines 7774–7779 support the generic-noetherian constructibility contract, including eventual vanishing and arbitrary base change on the dense open. No new source fetch or access request was necessary.

### Computed adversarial evidence

Here k is separably closed in strict-local cohomology examples, Λ is nonzero with invertible finite order unless specified, and cohomological shifts satisfy Hⁱ(K[a])=Hⁱ⁺ᵃ(K). Rows include the seeded targets, all headline families, repaired statements and the sections for which round 2 supplied no explicit numerical row. Other unchanged claims retain the computed witnesses in round 2, not its unsupported summary sentences. “Retain” means the tested statement needs no change, not that testing proves the general theorem.

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| Local/coefficient conventions | Zero ring; n=1,2; Λ[2] | Zero ring has 0=1 and fails IsLocalRing. For n=1 both Λ and Λ² are 0; for n=2 their sizes are 2 and 4. H⁻²(Λ[2])=Λ and H⁰=0. | Nontriviality and Layer 6's n≥2 are effective; retain. |
| 0.1, alt and md | Spec k; A¹ over k; origin in A¹ | Finite reduced k-algebras give dimension 0 and finite generic degree. k(t)/k has transcendence degree 1, so A¹ is md but not an alteration object. The origin maps to a nongeneric point. | Finite generic fibres and dominance independently tested; retain. |
| 0.1, product and reduction | Blow-up of A²; Spec k[ε]/ε² | Ordinary product has exceptional E×E of dimension 2; md retains the closure of the generic diagonal, whose exceptional fibre is diagonal E of dimension 1. Terminal reduction of the thickened point is Spec k. | Ordinary fibre product and unreduced terminal object are rejected; retain. |
| 0.2, alteration topology | ℤ[i]/ℤ; ℓ=2,3; empty cover | Degree 2 has gcd(2,3)=1 and gcd(2,2)=2. Empty degree-zero image has 0 points over the generic point, so cannot cover. | Prime-to-ℓ and hypercover augmentation conditions discriminate; retain. |
| 0.5, higher-graded object | X=Spec k⟦t⟧, Y=Spec k; a=1,2 | Both closed fibres are k; gr¹₁(X)=k, gr¹₁(Y)=0. For X,a=2, degrees −2,−1,0 are 0,k,k[t]/t². | Added Check rejects a closed-fibre-only definition; retain repair. |
| 0.5, identity/inverse/composition | Over ℚ⟦t⟧, z↦2z, z↦z/2, z↦3z, z↦5z | Inverse composites send z to z; first two scalings compose to 6z; both triple parenthesizations give 30z. Every map fixes base t. | Three API laws valid with the specified source/target; retain repair. |
| 0.5, base compatibility and approximation | Proposed gr map t↦2t; X=Ŝ; quadratic z²−u | Base map sends t to t, proposal to 2t, unequal over ℚ. A/𝔪ʳ=Â/𝔪ʳ for each r. If 2,u are units, z and 2z are units in the quadratic algebra. | Wrong rescaling excluded; étaleness does not assert regularity of a singular base; retain. |
| 0.6, henselian reduction | One regular connected snc pair; disjoint union of two | Identity family has 1 source and unchanged boundary; component family has 2 connected sources and the same union of boundary supports. | Connectedness is on each source, not the target; retain. |
| 0.7, complete-local reduction | Boundary xy(x−y), blow-up chart y=xu | Pullback is x³u(1−u); reduced support xu(1−u), with at most 2 branches meeting. Completion and the descended blow-up give the same equations. | Pair data survives, not just ambient regularity; retain. |
| 1.1, Cohen–Gabber headline | Cusp y²=x³ at p=2,3; d=0 | p=2: parameter y gives degree 3 and derivative x²≠0. p=3: parameter x gives degree 2 and derivative 2y≠0. d=0 gives k→k, degree 1 and residue identity. | No good-prime restriction; retain. |
| 1.2, equivariant headline | C₂ sign action; S₃ permutations; wild C₂ | x² is fixed and has degree 2; elementary symmetric parameters have generic degree 6. In characteristic 2, x↦x/(1+x) squares to id, but group order maps to 0. | Nonabelian and wild tests distinguish the tame hypothesis; retain. |
| 1.2, nonequidimensional domain | A=k⟦x,y,z⟧/(xz,yz), parameters a=x+z,b=y | Component dimensions are 2 and 1; after tensoring with Frac(k⟦a,b⟧), b becomes a unit, z=0, x=a, y=b, so generic algebra is that field, degree 1. | Lower component disappears; torsion-freeness is correctly absent here; retain. |
| 1.4, mixed headline and bundle | ℤ_p⟦x⟧ identity; t↦x^p; ramified C_ℓ action | Identity degree is 1. Derivative px^(p−1) is nonzero generically but nonunit above p. For B=V⟦x⟧, V=W[π]/(π^ℓ−p), degree B/A=ℓ but degree B^H/A=1. | Both p-fibre étaleness and invariant degree are substantive; retain. |
| 1.5, partial algebraization | k⟦x,y⟧, ideal (y−x²); field k; (x),(x²) | Base k⟦x⟧ has dimension 1<2; completion of its polynomial model gives the specified ring and ideal. No nonzero local base has dimension <0. Quotient lengths are 1 and 2. | Exact ideals and strict dimension drop exclude wrong models; retain. |
| 1.6, equal-characteristic headline | Node and both branch ideals; empty family | Completion of k[x,y]/(xy) at (x,y) is the node; dim k+1=1; ideals map to (x),(y). Empty family leaves the same nontrivial ring presentation. | Native statement agrees; retain. |
| 1.7, invariant DVR | p=3,ℓ=2, W=W(𝔽̄₃), V=W[π]/(π²−3) | Invariance of a+bπ gives 2bπ=0, hence b=0. Thus V^H=W and B^H=W⟦x⟧. A V-map would give b₀²=3 and 2v₃(b₀)=1, impossible. | Corrected V^H base passes the original refuting instance; retain repair. |
| 1.7, descent and headline | Same ramified model; d=2,3; ideal (x−3) | Averaging sends a+bπ to a, coefficientwise before and after completion. Base dimensions are 1+(2−2)=1 and 1+(3−2)=2. W[x] at (3,x) completes to W⟦x⟧ and (x−3) maps literally. | Invariant completion and d−1 agree; ∃extension precedes ∀families; retain. |
| PrimeToEllLocalExtension | Identity; degree 2; ℓ=0,1,2,3 | gcd(1,0)=1; gcd(2,0)=2; gcd(2,1)=1; gcd(2,2)=2; gcd(2,3)=1. Mod-p reduction kills nonzero p and fails injectivity. | Bundle's broader parameter domain is meaningful; headline uses prime ℓ≠p; retain. |
| 2.1, equivariant curve alteration | Smooth P¹ with sections; P¹_L over K, [L:K]=2 | Identity quotient degrees are 1. In the second case generic constants have degree 2, whereas birational base quotient requires degree 1. | Geometric irreducibility excludes the second case; retain. |
| 2.2, weak uniformization | Cone xy=z², p=2 included | Blow-up x-chart is k[x,z₁], with y=xz₁². Exceptional conic has gradient (y,x,0) in characteristic 2; x=y=0 forces z=0, absent in projective space. | Regular charts and snc boundary; retain. |
| 2.3, prime-to-ℓ uniformization | Degree-ℓ quotient; birational resolution; cubic over 𝔽₃[t]_(t) | gcd(ℓ,ℓ)=ℓ, gcd(1,ℓ)=1. At t=0, x³+x²+2x=x(x²+x+2), degrees 1+2. Deleting the rational point leaves only degree 2 above the closed point, although generic degree is 3. | Generic degree alone is not the covering condition; retain. |
| 2.4, controlled hypercover | Constant hypercover; q=0,1 | Constant normalized cochains are Λ in degree 0 and 0 later. General q=0 control uses levels 0,1; q=1 uses 0,1,2. | Augmentation and truncation bounds distinct; retain. |
| 3.1–3.2, oriented product and tube | Strict-trait self-product; punctual identity diagram | Allowed underlying pairs: (s,s),(η,η),(s,η), count 3; ordinary fibre product has 2. On a geometric point, each side of tube exchange has H⁰=Λ and higher groups 0. | Specialization direction and exchange agree; retain. |
| 3.4–3.6, oriented descent headlines | Proper identity; split two-point cover; constant hypercover | Identity unit is id_F. Čech C⁰=Λ², C¹=Λ⁴, with difference (0,b−a,a−b,0); kernel is diagonal Λ and higher cohomology is 0. Constant normalized higher simplicial terms are 0. | Abelian descent recovers Λ, not Λ²; retain. |
| 4.1–4.2, constructibility and finiteness | snc branches r=0,1,2; char-p A¹ with ℤ/p | Exterior ranks are (1), (1,1), (1,2,1), zero above r. Classes t^m for p∤m remain independent modulo h^p−h, giving infinite H¹. | Invertibility and boundary twist are necessary; retain. |
| 5.1, dimension functions | Trait; point; A¹ over a DVR; line meeting plane | Trait δ=(1,0); point δ=c. On A¹_R, generic closure dimension 2 and closure dimension at (πt−1) is 0, but the jump should be 1. On line/plane union, −dim O jumps 0→−2 along the line. | Both naive wrong global formulas excluded; retain. |
| 5.2, existence and torsor | Point; strict trait; square-zero thickening | Point functions are integers c; trait functions are (c+1,c), so their difference is constant c−c′ at both points. Adding ε²=0 changes neither underlying points nor these values. | Local existence, torsor and reduction invariance agree; no excellence inferred from a function; retain. |
| 5.3, regular base change | Identity; ℚ[t]_(t), z²=1+t | Identity exchange is id_F. A rational root would give even valuation at t+1 versus 1; completed root starts 1+t/2−t²/8 and squares to 1+t modulo t³. | Sheaf exchange is not unrestricted global invariance; retain. |
| 5.4 and 6.7, two transports | A¹_k→Spec k with δ_k=0 | Finite-type δ at generic/closed points is (1,0); regular δ is (0,−1). Exceptional pullback is Λ(1)[2], ordinary pullback Λ. | Constant difference 1 matches twist and shift; retain. |
| Trait contract and 5.5 | Strict-trait generic open; geometric point | δ(R¹j_*Λ)=0=1−1; H¹(η,Λ)=Λ(−1), H²=0. At d=0, H⁰=Λ and H^q=0 for q>0. | Sharp normalization; supplied trait theorem is independent of 5.6; retain contract. |
| 5.6, affine Lefschetz | Strict regular surface with regular divisor removed; zero sheaf | δ(U)=2 and δ(R¹j_*Λ)=1=2−1. For F=0, both support suprema are −∞ and every group is 0. | Inequality direction and zero convention agree; retain. |
| 5.7, local bound | Strict DVR; henselian DVR with finite residue field | Residue cd values 0,1 give fraction-field cd 1,2, respectively: 1+0 and 1+1. | Residue contribution cannot be dropped; retain. |
| 5.8, cd headline | d=0,1,2; empty open; square-zero thickening | 2d−1 is −1,1,3. Point has cd=0, explaining d>0. Strict trait H¹=Λ(−1); punctured strict surface H³=Λ(−2). Empty groups vanish; ε²=0 leaves dimension and étale cohomology unchanged. | Full nonexcellent noetherian domain retained; no natural-subtraction defect. |
| 5.8, torsion binder | Constant ⊕ᵣℤ/ℓʳ; infinite disjoint union | Affine-basis sections have finite image, killed by some ℓᴺ. On the disjoint union, ℓᵏe_(k+1)≠0 for every k. | Affine-basis condition admits unbounded torsion; retain. |
| 6.1–6.2, transitions/top class | Regular strict local dimensions 0,1,2; inseparable degrees 2,3 | Top twisted groups are Λ in degrees 0,2,4. Two codimension-one classes send 1 to 1 in H⁴_x(Λ(2)). Degree inverses satisfy 2·2=1 mod 3 and 3·1=1 mod 2. | Transition, trace normalization and top degree agree; retain. |
| 6.3–6.6, pinnings/perversity/existence | Strict trait; point with Λ=ℤ/5; empty scheme | K=Λ(1)[2] has generic degree −2 and closed support degree 0; Λ instead has generic degree 0>−2. Of units 1,2,3,4 only 1 preserves the identity pinning. Empty scheme has only 0. | Wrong shift and unmarked uniqueness excluded; retain. |
| 6.8, repaired exchange route | j=id,F=Λ; empty U; generic trait open | Both sides are K, then 0, then Rj_*Λ with closed-stalk H⁰=Λ,H¹=Λ(−1). j_!Λ would have closed stalk 0. | Summary uses the actual adjunction route; retain repair. |
| 6.8–6.10, duality/biduality | Point K=Λ²; Λ=ℤ/4,M=ℤ/2; Λ=ℤ/6 | D²Λ=Λ⁴ for wrong K. Hom_(ℤ/4)(ℤ/2,ℤ/4)=(2), size 2, and double dual returns ℤ/2. (𝔽₂⊕𝔽₃[1])⊗(𝔽₂⊕𝔽₃[−1])=ℤ/6, cross terms 0. | No finite-Tor restriction on all constructible inputs, or common-shift assumption; retain. |
| 6.10, dimension necessity | Factorwise shifted ℤ/6 complex on trait | Factor shift indices are (−2,0) and (−3,−1); each increases by 2; floors of negative halves give (1,0). | Stronger finite-quasi-injective convention explicitly retained. |
| 6.11–6.12, normalized local duality | d=0,1,2; trait F=Λ | K=Λ,Λ(1)[2],Λ(2)[4], each with closed support Λ[0]. On the trait H²_xΛ=Λ(−1)=Hom(Λ(1),Λ); H⁰_xΛ=0=Hom(0,Λ). | Degree reversal and twist agree; retain. |
| 7.1, principal punctured open | Strict DVR, f uniformizer; f=0 | H¹ of generic open is Λ(−1), and H^q=0 for q>1. For f=0 the open is empty, all groups 0. | Excellence domain and strict bound retained. |
| 7.2, support of extension by zero | Strict DVR, f uniformizer; f=0 | H⁰_x(j_!Λ)=0, H¹_x(j_!Λ)=Λ; d=1 permits that boundary group. For f=0 every support group is 0. | i<d is correct; i≤d would fail. |
| 7.3, local Lefschetz headline | DVR modulo uniformizer; f=0; d=0 | Boundary map in degree 0 is 0→Λ, injective but not surjective. f=0 gives identity. At d=0 boundary degree is integer −1 and both negative groups are 0. | No underflow or boundary overclaim; retain. |
| 8.1, matched opens | Rank-one valuation; algebraically closed char-p field with ϖ=0 | Each special-fibre spectrum has 1 point, hence 2 closed subsets and 2 matched pairs. In the field case generic open is empty. | Complements determine the correspondence; wrong generic-fibre omissions excluded. |
| 8.2, multiplicative generic tilt | Perfect char-p ring; algebraically closed mixed-characteristic field | In char p the sequence is (a,a^(1/p),…), recovered by first coordinate. In mixed characteristic (1,1,…) and (1,ζ_p,ζ_(p²),…) have the same first coordinate 1 but are distinct. | Inverse limit cannot be replaced by the untilt itself; retain. |
| 8.3–8.4, idempotents and repaired comparison | Connected ring; two nonzero factors; empty open; e_J | Idempotent counts are 2,4,1. For two factors e₁e₂=0 and e₁+e₂=1. H⁰ is G,G²,0 and higher groups 0. At ultrafilter U, e_J has value 1 iff J∈U, otherwise 0. | Splitting is imported; clopen comparison retains all components and orthogonality. |
| 8.5–8.6, tilting headlines | Complete perfect char-p A; 𝒪_C; empty/full support | Char-p comparison is identity, including ℤ/p coefficients. On 𝒪_C restriction is id:G→G, with higher groups 0, so support fibre is 0. Empty support gives 0; whole algebraically closed field gives G[0]. | Characteristic-primary torsion included; no spurious DVR class on nondiscrete valuations. |

For the unchanged §§0.3–0.4, 1.3, 3.3–3.6 and the further APIs of §§6.1–6.10, the retained round-2 rows give explicit degrees, matrices, groups or dimensions. The additional full checks above cover §§0.1–0.2, 0.6, 2.1, 2.3–2.4, 3.2, 4.1, 5.2, 7.1–7.2 and 8.2–8.3, rather than relying on the previous report's final paragraph about “other unchanged statements.” Definition APIs and negative models were also read throughout: none is an unconstrained operation field, a free predicate replacing a construction, or a hypothesis containing its conclusion.

### Pinned library and signature audit

The content checkout is main `7922565e8b5d3420ff251821a1b3b042fabe96c8`. Its manifest pins Mathlib to `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti to `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Object searches and the following readings used those pins.

| Declaration/object opened | File and line at the pin; meaning and limitation |
|---|---|
| IsLocalRing | `Mathlib/RingTheory/LocalRing/Defs.lean:30`, extends Nontrivial; does not supply noetherianity or completeness. |
| IsAdicComplete | `Mathlib/RingTheory/AdicCompletion/Basic.lean:56`, includes both Hausdorffness and precompleteness. |
| HenselianLocalRing; IsSepClosed | `Mathlib/RingTheory/Henselian.lean:108`, local simple-root lifting; `Mathlib/FieldTheory/IsSepClosed.lean:65`, splitting of separable polynomials. No perfection or noetherianity is implicit. |
| Algebra.Etale; Algebra.IsEtaleAt | `Mathlib/RingTheory/Etale/Basic.lean:205`, formal étaleness and finite presentation; `Mathlib/RingTheory/Etale/Locus.lean:35`, formal étaleness of the source-prime localization. The finite noetherian parametrization supplies the finiteness context for the latter. |
| FixedPoints.subring; IsPGroup | `Mathlib/Algebra/Algebra/Subalgebra/Operations.lean:98`, actual fixed elements; `Mathlib/GroupTheory/PGroup.lean:41`, each element killed by a p-power. Neither imposes faithfulness; finiteness is separately present in the bundle. Invariants have no automatic V-algebra structure. |
| IsRegularLocalRing; ringKrullDim | `Mathlib/RingTheory/RegularLocalRing/Defs.lean:51`, local noetherian ring with dimension equal to maximal-ideal generator rank; `Mathlib/RingTheory/KrullDimension/Basic.lean:26`, dimension in WithBot ℕ∞. Finite dimensions and positivity are explicitly imposed where needed. |
| IsProper | `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean:41`, separated, universally closed and locally finite type; no noetherian base built in. |
| smallEtaleTopology; Sheaf.H | `Mathlib/AlgebraicGeometry/Sites/Etale.lean:50`, native small étale over-category, not restricted to quasi-compact objects; `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:56`, Ext from the constant integral sheaf. Affine-basis torsion is therefore a meaningful explicit hypothesis. |
| PreTilt | `Mathlib/RingTheory/Perfection.lean:633`, perfection of reduction modulo p. This does not furnish the henselian-perfectoid, sharp-quotient, matched-open and derived-comparison interfaces. |
| Module.Baer.zmod_self | `TauCeti/Algebra/Module/ZMod/Injective.lean:50`, self-injectivity in Baer's form with `[NeZero n]`. Cited, not restated here. |

Ran the requested `lake env lean` on `packages/EtaleDualityAndPerverseSheavesPartII/Suggested.lean` from the pinned content checkout: exit 0, exactly six warnings that declarations use `sorry`, no errors. There are no TauCeti imports needing a build. A fresh scratch copy with `#check @name` for all nine declarations also exited 0 with the same six warnings. All printed types were compared with the README:

| Declaration | Expanded signature verified |
|---|---|
| cohenGabber_equalCharacteristic | Complete noetherian reduced local A, prime characteristic p, finite dimension and every-minimal-prime equidimensionality; actual residue identity, injective finite torsion-free map and étale generic fibre. |
| cohenGabber_equivariant | Field algebra, complete reduced local A, finite G, actual action, invertible order, residue action and equivariance on all series. No unintended equivariance with the auxiliary field algebra is demanded. |
| MixedCohenGabberPresentation | Native rings and actual maps, finite/local/injective conditions, p-fibre étaleness, residue comparison, actions and invariant degree; no sorry'd data. |
| cohenGabber_mixedCharacteristic | Complete normal noetherian local domain, characteristic zero, prime residue characteristic p, prime ℓ≠p and d≥2. |
| PartialAlgebraization | Complete noetherian local A, independent ideal-index universe; smaller complete local base, finite-type algebra, maximal ideal over the base maximal ideal, actual completion equivalence and exact ideal images. |
| partialAlgebraization_equalCharacteristic | Reducedness, field algebra, positive dimension and finite family survive; regular base with dim B+1=dim A. |
| PrimeToEllLocalExtension | Actual finite injective local extension with complete normal target; degree is the dimension of the tensor generic fibre. |
| partialAlgebraization_mixedCharacteristic | All mixed-characteristic hypotheses remain, and quantifiers are ∃E ∀r ∀I ∃P. The base retains characteristic zero, residue characteristic p and the dimension equation. |
| cohomologicalDimension_le_of_strictlyLocal | Noetherianity, henselianity, separably closed residue field, d>0, dimension equality and invertible prime survive; every affine-basis section is ℓ-primary and q≥2d. |

No binder was lost; no signature change is needed. A fresh scratch probe tried each of the six sorried theorems with `simp`, `rfl` and `infer_instance`, each required to close the entire goal. All six failed to close, as expected. Object searches at the pins found no single existing lemma furnishing any headline for an `exact` probe. None restates its definition, mirrors a Check or proves only a boundary case. The three real structures are precisely the native data bundles those headlines require.

### Headline completeness and package shape

| README headline family | Suggested.lean disposition |
|---|---|
| Cohen–Gabber, §§1.1, 1.2, 1.4 | Three substantive theorem signatures. |
| Partial algebraization, §§1.6–1.7 | Two theorem signatures, with regular smaller bases and actual ideal descent. |
| General strict-local cohomological dimension, §5.8 | Full torsion-sheaf bound stated, without quasi-excellence or bounded-exponent stand-ins. |
| Weak/prime-to-ℓ uniformization and regular hypercovers, §§2.2–2.4 | Docstring names missing quasi-excellent, alteration-site and snc-pair interfaces. |
| Oriented descent, §§3.4–3.6 | Docstring names general oriented-product topoi and derived simplicial direct image. |
| Gabber finiteness, §4.2 | Docstring names constructible étale derived categories and general-base direct image. |
| Dimension functions and affine Lefschetz, §§5.1–5.7 | Docstring names immediate specializations, strict henselizations, dimension functions, regular/excellent geometry and constructible sheaves. |
| Top class/transitions, perversity, potential existence/uniqueness, biduality and local duality, §§6.2–6.12 | Docstring names support complexes, Tate twists, pinnings, stalk/costalk operations, internal Hom and exceptional inverse image. Abstract t-structures alone do not state the pointwise theorem. |
| Local Lefschetz, §7.3 | Docstring names local étale supports and the hypersurface restriction map. Absolute purity remains supplied. |
| Matched-open idempotents, étale tilting and supports, §§8.3–8.6 | Docstring names henselian-perfectoid pairs, sharp quotients, matched opens and derived sections. |

No statable headline was omitted or replaced with an artificial substitute. The 278-line Lean file has one `import Mathlib`, the required namespace, one module docstring, declaration documentation, six theorems and three real structures. There is no `set_option`, sorry'd data, admitted example, `lemma`, algorithm or API padding. The README has all nine layers in order, each with Examples and Dependencies; definitions retain APIs and at least three Checks. Its owned Lean names agree with the file. Main's SchemeAndStackFoundations, EtaleCohomologyFoundations and EnhancedDerivedSheaves supplied the shape comparison. The scope states exactly where the base roadmap stops and why this extension is Part II.

### Ownership and supplier resolution

Used `roadmaps list`, object-based `roadmaps grep`, and `roadmaps show` for the six new-roadmap suppliers below, together with main and the board designs. The available index contains 363 open pull requests. Searches covered algebraization, Cohen–Gabber, uniformization, oriented products, dimension functions, dualizing complexes, cohomological dimension, valuation products and matched opens. A separate Lean-name search returned no match on main or an open roadmap head for this package's distinctive declarations. No fully qualified name collision was found. The board package index was read before resolving its four missing-name leads.

The general-topos construction extends the supplied scheme-oriented product; it does not rebuild that special case. Polynomial Artin approximation and the higher-graded comparison are different objects. The general quasi-excellent/excellent theorems extend the base roadmap's finite-type duality. Commutative-algebra dimension functions attached to coherent dualizing complexes are not a second owner of this étale-specialization construction. Absolute purity, ℤ/n self-injectivity, integral perfectoid operations and split covers remain with their earlier owners.

| Supplier/citation | Resolved repository-relative file and anchors | Contract checked |
|---|---|---|
| SchemeAndStackFoundations | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:755`, :969–1099, :1302–1462, :3656–3896, :6038–6411; main | §§0.7, 0.12–0.16, 0.20–0.22, 2.11–2.12, 2.15–2.16, 4.16–4.20: dimension, henselization, Elkik/Popescu, excellence, finite normalization, ramification sequences, continuity, descent and ordinary alterations. |
| AlgebraicModuliForArithmeticGeometry | `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:8908`, :8918, :8943; open new-roadmap head | §§6.0–6.1: polynomial approximation over henselian noetherian G-rings and pointed étale comparison; the higher-graded theorem remains here. |
| DeformationAndDerivedPatchingAlgebra | `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:242`; open new-roadmap head | §1.10: strict Cohen rings and compatible coefficient maps, including p-torsion targets. Prescribed equicharacteristic coefficient fields remain the declared gap. |
| AdicCoefficientsAndComparisonsPartII | `packages/AdicCoefficientsAndComparisonsPartII/design/README.md:83`, :209, :237, :313, :379, :878–1024, :1074–1134 | PA.0.2–PA.0.8, PA.0.11, PA.1.2–PA.1.4, PA.4.1–PA.4.8, PA.5.1–PA.5.4: alterations/degree conditions, flattening, snc, surfaces, valuation spaces, tame log quotients/modifications and stable curves. |
| AdicEtaleGeometry | `TauCetiRoadmap/AdicEtaleGeometry/README.md:5511`, :5673, :5763; main | A1.14–A1.15 include the general coherent-site enough-points theorem with its universe condition; no analytic comparison is substituted. |
| EnhancedDerivedSheaves | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:429`, :441, :455, :492, :2293; main | §§0.1–0.4 and E2.6 supply enhancements, replacements, tensor–Hom, adjunctions and bounded-below hypercover descent. |
| EtaleCohomologyFoundations | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:175`, :231, :439, :457, :504, :522, :592, :676, :1179, :1200, :1265; main | F.0–F.3, 0.7, F.5–F.6, F.8 on their stated domains. F.5 supplies the finite-cd adjoint independently of general dualizing existence; F.3 is not the undeclared arbitrary-noetherian generic theorem. |
| EtaleDualityAndPerverseSheaves | `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:106`, :146, :1001, :1344, :1464, :1784, :2690; open new-roadmap head | §§0.1–0.2, 1.1, 2.1–2.11: coefficient and finite-type duality, supported classes and field-base perversity/recollement. Their shift convention agrees. |
| LefschetzPencilsAndVanishingCycles | `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:349`, :401, :420, :454, :520, :697, :3295; open new-roadmap head | §§0.2–0.5, 0.10, 6.2: trait-oriented constructions and purity. Trait support-dimension inequality remains explicitly contracted, not presumed present. |
| ClassicalAdicEtaleCohomology | `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:2709`; open new-roadmap head | §5.4 supplies scheme-oriented product, Cartesian middle refinements, projections and generic-to-special arrow. |
| ArcTopologyAndDescent | `packages/ArcTopologyAndDescent/design/README.md:519`, :987, :1017–1060, :1343, :1368, :1411, :1483 | §§3.6, 8.3, 8.6–8.9, 11.1–11.2, 11.5, 12.6: components, henselian/support comparison, complete arc descent and tilting. Line 1370 supplies the precise split-cover theorem used by the repair. |
| PerfectoidQuotients | `TauCetiRoadmap/PerfectoidQuotients/README.md:768`, :817, :906; open new-roadmap head | §§0.4–0.6: torsion removal, p-integral closure, completed operations, products and tilts. |
| PerfectoidQuotientsPartII | `packages/PerfectoidQuotientsPartII/design/README.md:93`, :109, :125, :249–315 | Q5.1–Q5.3 and Q6.3–Q6.7: integral multiplicative tilt, powered sharp quotient and valuation tilting. The exponent p is retained before Frobenius gives the unpowered quotient. |
| PerfectoidSpaces | `TauCetiRoadmap/PerfectoidSpaces/README.md:5049`; main | P1.24 integral perfectoid convention, shared by the suppliers. |
| PurityForFlatCohomology, consumer | `packages/PurityForFlatCohomology/design/README.md:104`, :291, :411, :2073 | PF.1 consumes local Lefschetz for the hypersurface/virtual-dimension bound. No reverse supply edge is asserted. |

The four resolver leads are thus coverage limitations: AdicCoefficientsAndComparisonsPartII, ArcTopologyAndDescent, PerfectoidQuotientsPartII and PurityForFlatCohomology have the checked board design files. None was reported absent merely because it lacks a main/open-head entry.

The requested dependency check with `--movable` exited 0 and printed exactly:

```text
depcheck: 53 roadmaps, 603 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Layer 6's explicit build explanation distinguishes the regular pinned construction from general potential existence and the joint top-class induction; its later API consequences are not prerequisites of their own definition. The three outstanding contracts match `packages/EtaleDualityAndPerverseSheavesPartII/design/plan.json` and README lines 76, 94 and 108 verbatim in their needs sentences:

| Slug | Owner and minimality |
|---|---|
| ILLUSIE-2003 | LefschetzPencilsAndVanishingCycles §6.2. Supplies the independent trait support bound with normalized δ, affine finite-type map, constructible invertible coefficients and every q. The supplied perversity construction alone is insufficient. |
| equicharacteristic-cohen-coefficients | DeformationAndDerivedPatchingAlgebra §1.10. Supplies compatible coefficient fields for arbitrary residue fields and prescribed p-basis lifts; its strict Cohen-ring maps do not already give the requested theorem. |
| generic-constructibility-noetherian | EtaleCohomologyFoundations F.3. Supplies generic constructibility, eventual vanishing and base change for finite-type maps over an arbitrary noetherian base, without properness. Existing proper and field/trait statements do not duplicate it. |

## Not verifiable

- **Ill03, Théorème 2.4:** original text remains settled as uncertified/paywalled. The ILO recollection and use were checked; the original pagination and proof were not certified. No access request was reopened.
- **Epp73, §§0–1, Theorems 1.3 and 1.9:** original text remains settled as uncertified. The package's statement through ILO and its corrected equal-characteristic step through K10 were checked; that does not certify the entire original proof.
- **Unprovided final-version ILO chapters:** the explicitly recorded arXiv-v1 locators were checked, not silently claimed as published-volume pagination. Final II and XIV were separately opened where their corrections matter. No missing legal source blocks the seeded sample.

Elaboration certifies signatures, not the future proofs. The computed instances, source comparisons and supplier resolutions above are the independent evidence for acceptance.

## Source issues

- **Misprint** in ILO14 at II 2.2.1, printed p. 26 (ILO14 line 1306): the source says to measure the residue extension in the reversed direction; it should be [κ(y):κ(x)] for y above x; affects nothing.
- **Misprint** in ILO14 at II Theorem 4.2.1, printed p. 32 (ILO14 line 1571): the source says the valuation ring has algebraically closed residue field; it should be algebraically closed fraction field; affects nothing; corrected in print at ILO-final-II Theorem 4.2.1, pp. 33–34.
- **Misprint** in ILO14 at III Theorem 5.1, printed p. 41 (ILO14 line 1960): the source says X is finite type over S; it should be finite type over the completed base Ŝ; affects nothing.
- **Misprint** in ILO14 at V 3.2.3(i), printed p. 67 (ILO14 line 3000): the source says the dimension condition uses A′/I+p; it should use A′/(I′+pA′); affects nothing.
- **Misprint** in ILO14 at V 3.2.4, printed p. 68 (ILO14 line 3034): the source says the remaining henselian variable is t_(d−2); it should be t_(d−1), as in the preceding construction; affects nothing.
- **Misprint** in ILO14 at XIV Corollary 2.5.2, printed p. 216 (ILO14 line 10201): the source says the induced dimension uses trdeg(κ(f(y))/κ(y)); it should use trdeg(κ(y)/κ(f(y))); affects a stated result.
- **Misprint** in ILO-final-XIV at Corollary 2.5.2, printed p. 289 (ILO-final-XIV line 480): the source says the induced dimension uses the reversed residue-field extension; it should use trdeg(κ(y)/κ(f(y))); affects a stated result.

The README already uses the corrected statements. K10's explanation of Epp's cancellation gap is acknowledged above; no new independent finding about the unread original Epp text is asserted.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "9665b078287aa6f946f04a44a7f949d75c354f8a", "job": "REV-PKG-EtaleDualityAndPerverseSheavesPartII~3", "model": "gpt-6-astra", "worker": "chris-31"} -->
