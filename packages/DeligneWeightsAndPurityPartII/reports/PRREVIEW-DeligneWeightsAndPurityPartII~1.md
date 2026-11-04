# Review of DeligneWeightsAndPurityPartII (pull request #1760 at 954152b)

**Verdict:** needs changes

## R01 (P1) — Supply the projective-space fan identification used by the corollary

**Location:** `TauCetiRoadmap/DeligneWeightsAndPurityPartII/README.md:87`, also :937 and :945. The contract says “AnalyticToricGeometry Layer 0 supplies the complete regular projective fans for projective spaces and their finite products.”

**Claim and defect:** §4.7 applies §4.6 to actual projective spaces over an arbitrary p-adic field. This needs the identification of the standard fan scheme with projective space over that field, and its projectivity. The cited Layer 0 provides general fan operations and the complex fan scheme; it does not state this identification or projectivity theorem. Completeness and regularity alone do not supply projectivity. AnalyticToricGeometryPartII §1.2 is an analytification comparison conditional on a fan, not the missing algebraic identification.

**Witness:** `Completed/AnalyticToricGeometry/README.md:222` gives general fans; :250 gives realization over ℂ; :521 identifies complex projective space. Pinned `Fan.IsComplete.prod` and `Fan.IsRegular.prod` establish completeness/regularity, not the arbitrary-field identification.

**Exact repair:** Retain the existing standard-fan ownership and cite its actual example, but declare the missing arbitrary-field realization contract with the earlier supplier AnalyticToricGeometryPartII: for every field k and n ≥ 0, identify the standard simplex fan scheme with ℙⁿ_k, compatibly with base change, and identify finite products with products of projective spaces, including the empty product. This supplies projectivity without assuming complete regular fans are projective. Put the same new gap slug and precise contract in the plan and README, and make §4.7 consume it. Do not reconstruct the existing generic fan/product APIs here.

**Repair check:** For n = 1, the two charts k[T] and k[T⁻¹] glue to ℙ¹_k with overlap k[T,T⁻¹]; O(1) has degree 1. For two such factors, O(1,1) gives the Segre embedding in ℙ³_k. For the empty product, both realizations are Spec k. These give the missing bridge for k = ℚ₂ as well as k = ℂ. The complete regular nonprojective example explicitly distinguished in `TauCetiRoadmap/AnalyticToricGeometryPartII/README.md:292` remains excluded from §4.6's projectivity hypothesis.

## R02 (P2) — Preserve the four declared supplier contracts and their owner

**Location:** `TauCetiRoadmap/DeligneWeightsAndPurityPartII/README.md:17`, :83, :625, :639, :722 and :834. The contract section says “This roadmap's §3.4 constructs the nonproper adic relative duality over annuli”.

**Claim and defect:** The PR changes the owner of four already-declared contracts to this roadmap. Their absence from the supplier today is permitted by the review contract; it is not a reason to plan them again here. The unchanged design still assigns all four to ClassicalAdicEtaleCohomology, while the README contains none of their gap slugs. This creates conflicting ownership and prevents the README from expressing the supplier contracts the intake recognizes.

**Witness:** `packages/DeligneWeightsAndPurityPartII/design/plan.json:2333`–:2354 assigns four gaps to ClassicalAdicEtaleCohomology. The PR README has zero matching slugs and instead makes the four results local targets in §§3.4 and 4.2.

**Exact repair:** Restore the following four `What ClassicalAdicEtaleCohomology must provide (gap:…): …` contracts, retaining the precise hypotheses already in the plan, in that supplier's subsection. Import these results at their applications instead of assigning their constructions to this continuation; adjust Scope, Needs and the acceptance-module explanation consistently.

| Gap slug | Supplier sections | Local construction to replace by the contract |
|---|---|---|
| `huber-compact-support-nearby-cycles` | 4.5, 5.2, 8.3–8.4 | §3.4 compact-support stalk comparison |
| `analytic-comparison-automorphisms` | 8.2, 11.1 | §4.2 continuous-field-automorphism naturality |
| `adapted-plurinodal-alteration` | 5.4 | §3.4 adapted opens and markings |
| `huber-smooth-relative-duality` | 9.6–9.7 | §3.4 smooth nonproper annular duality |

Keep the mathematical applications and discriminating Checks. The contracts are precise and request distinct extensions of the inspected supplier: no request for an ownerless theorem, no demand that the supplier already have implemented them. The port report's stated reason—these statements are absent at the supplier head—does not invalidate a declared gap. This is not a re-raised finding marked “not actionable in this package” by a repair report.

**Repair check:** Plan/README slug agreement changes from 4/0 to 4/4. The identity-family stalk comparison has Λ on each side; the ℙ¹ comparison sends geometric Frobenius to q on each side; an adapted marked section remains étale of degree 1; the ℙ¹-family duality has ordinary twisted groups Λ(1), Λ, matching the dual compact-support groups. Restoring the contracts preserves these mathematical requirements and gives each exactly one owner.

## Verified sound

The review covered all 30 numbered targets, their API bullets, the additional proof targets inside §3.4, the conventions, Checks and worked examples. The 135 computed adversarial rows below test assertions and their negative controls; they are not claims to have formally proved the proposed theorems. There are two blocking findings, neither a counterexample to Scholze's final mathematical theorem.

The seeded sample comprised 15 targets. All five available source texts were opened at the cited passages; the three settled unavailable originals are listed separately below. Sources were read from the supplied legal cache. No source text was copied into the repository or report. The abstract profinite-datum extensions are verified by their stated arguments, not misrepresented as verbatim theorems of Scholze.

| Sampled target | Source inspected and locator | Hypothesis/statement verification |
|---|---|---|
| 0.1 local data | SCH12 line 2508, §9, pp. 307–309 | The source supplies local-field inertia and tame monodromy. The abstract profinite carrier and marked isomorphisms are an explicit extension; nonzero tame image and profiniteness make uniqueness work. |
| 0.4 relative purity | SCH12 line 2518 and line 2532, Proposition 9.1 and Definition/Proposition 9.2, pp. 307–308 | Nilpotent operator, centered filtration, grade weights and geometric-Frobenius relation agree. The source's local-field existence is not asserted for every abstract datum. |
| 0.5 subgroup detection | SCH12 line 2592, proof of Theorem 9.6, p. 309 | The tower restriction preserves monodromy. The broader subgroup statement separately assumes nonzero tame restriction and open residue image and uses local-field existence for the converse. |
| 0.6 transport | SCH12 line 2527 and line 2597, §9, pp. 307, 309 | Rescaling and the tilt comparison support the application. The marked-data transport with inverse scalar on N follows explicitly from the exponential equation. |
| 0.7 direct summands | SCH12 line 2652, proof of Theorem 9.6, p. 311 | A Galois-stable complement is used. Arbitrary subrepresentations are expressly excluded. |
| 0.8 WMC | SCH12 line 2543 and line 2560, Conjecture 9.3, p. 308 | Weight equals cohomological degree; the L-factor inequality is a consequence, not a definition or equivalence. |
| 0.9 finite extension | SCH12 line 2547, after Conjecture 9.3, p. 308 | The finite-extension invariance is stated; ramification scales N and residue degree powers Frobenius. Purely inseparable invariance uses the separately cited étale supplier. |
| 0.10 good reduction | SCH12 line 2564, p. 308 | Smooth proper base change and finite-field purity give the claimed unramified result for ℓ ≠ p. |
| 1.1 equal characteristic | SCH12 line 2571, Theorem 9.4, p. 309; DEL80 line 1528, Theorem 1.8.4, pp. 175–176 | Scholze states the rational-point form. Deligne's closed-point local theorem uses residue cardinality q_x; the README's closed-point extension is supported by that supplier, with all complex embeddings. |
| 2.1 Kummer tower | SCH12 line 2592, proof of Theorem 9.6, p. 309; Theorem 1.1, pp. 245–246 | The finite-k tower/tilt is used in the proof. The README supplies the Eisenstein and quotient-coordinate arguments extending the ℚ_p example. |
| 2.5 tilt transfer | SCH12 line 2597 and line 2652, pp. 309–311 | The matched Galois data and stable summand carry the weights back. The README makes the tame-coordinate scalar explicit. |
| 3.1 tubes | ITO20 line 866 and line 918, Proposition 4.1/Lemma 4.3, pp. 19–20 | Finite-type models, finite-presentation closed immersion, integral equations, shrinking constructible neighbourhoods and proper-model comparison match. |
| 3.3 punctured disc | ITO20 line 103 and line 1030, discussion and Theorem 4.11, pp. 3, 22–23 | The characteristic-zero formulation includes covers of p-divisible degree. LUT93 original text remains uncertified; no characteristic-p Kummer conclusion is inferred. |
| 4.1 approximation | SCH12 line 2496 and line 2607, Corollary 8.8/proof of Theorem 9.6, pp. 307, 309; DJ96 line 597 and line 604, Theorem 4.1/Remark 4.2, p. 66 | Dimension and containment precede alteration. Smoothness is obtained over a perfect field and then descended; regularity over an imperfect field is not substituted for smoothness. |
| 4.6 endpoint | SCH12 line 2589 through line 2652, Theorem 9.6 and proof, pp. 309–311 | Proper smooth geometrically connected set-theoretic complete intersections in projective smooth toric varieties; all finite k/ℚ_p and ℓ ≠ p, including bad reduction. |

Other source passages inspected include ITO20 Definitions 2.1–2.2, Theorem 3.3, Corollary 3.17, Theorems 4.5(2), 4.9, 5.3, Definition 6.5, Theorems 6.2, 6.3, 6.10, Lemma 6.11 and the proof inputs of §7; RAM05 line 1020, Lemma 2.1.10(ii), p. 193. Their characteristic, invertibility, properness, support and uniformity conditions were compared with §3.4. In particular the README's algebraic-cover route avoids using the invalid unrestricted positive-characteristic discriminant bound discussed under Source issues.

The following notation is used only to shorten the computed tables: Λ = ℤ/n with n invertible in the valuation ring unless otherwise specified; E is a finite extension of ℚ_ℓ; the two-dimensional string has N(e₁)=e₀ and F=diag(1,q). “Retain” means no mathematical change was found necessary on these instances; ownership changes are identified separately.

| Statement | Instances and computed values on both sides | Result/change |
|---|---|---|
| Conventions: Frobenius sign | q=2,3: NF(e₁)=q e₀=qFN(e₁); FNF⁻¹(e₁)=q⁻¹e₀, not q e₀ | Retain geometric sign |
| Conventions: central weight/twist | String grades −1,+1 have eigenvalues 1,q and weights 0,2; after twist (1), eigenvalues q⁻¹,1 have weights −2,0 | Centers 1 and −1; retain |
| 0.1 datum and topology | H=ℤ_ℓ⋊ℤ̂, action q⁻n: conjugation sends (x,0) to (q⁻¹x,0); t on both sides is q⁻¹x. Discrete ℤ[1/q]⋊ℤ has open inertia subgroup {0}, with t-image 0 | Correct positive model and excluded nonprofinite model |
| 0.1 coset laws/generation | Fr=ℤ_ℓ×{1}: (x,1)⁻¹(y,1)=(q(y−x),0)∈I; multiplication by (z,0) stays in residue coordinate 1; identity has coordinate 0 | Both coset directions hold; 1∉Fr |
| 0.1 wrong Frobenius | Fr=I would require x=q⁻¹x; at x=1,q=2, 1≠1/2. Fr with residue −1 gives conjugation 2x rather than x/2 | Wrong identity/arithmetic markings excluded |
| 0.1 isomorphism identity/composition/inverse | Rescale by 2 then 3: tame coordinate 6t, composite constant 6; inverse constant 1/6; identity constant 1 | Retain all four laws |
| 0.2 standard datum | k=ℚ₂,ℓ=3: positive Kummer ratio of a tame generator is ζ_(3^m); geometric conjugation raises it to exponent 2⁻¹ mod 3^m | Matches q⁻¹, not q |
| 0.2 ramification/residue API | Totally ramified e=2,f=1: t_restricted=2t′, Q′=q; unramified e=1,f=2: t_restricted=t′, Q′=q², F′=F² | Retain both independent scalings |
| 0.3 admissible restriction | H′=ℓℤ_ℓ⋊fℤ̂: inertia image ℓℤ_ℓ≠0, quotient fℤ̂, conjugation q⁻f; relative Q=q^f | Restricted datum satisfies same law |
| 0.3 identity/nested restriction | First residue index 2 then 3: final Q=(q²)³=q⁶; identity gives q¹=q | Retain transitivity |
| 0.3 excluded subgroups | H′=I has residue image {0}, not open; subgroup fixing all ℓ-power uniformizer roots has tame image {0} | Neither qualifies; no false detection |
| 0.4 exponential/uniqueness | N²=0, exp(aN)=1+aN and log(1+aN)=aN; a≠0 recovers N=a⁻¹log. Replacing N by 2N changes off-diagonal a to 2a | Operator determined, zero/wrong rescaling rejected |
| 0.4 filtration preservation | String M_−2=0,M_−1=M₀=Ee₀,M₁=E²; F preserves each; N:gr₁→gr_−1 sends e₁ to e₀ with coefficient 1 | Center and index lowering agree |
| 0.4 purity vs semisimplification | String has grade weights 0=1−1 and 2=1+1; same F with N=0 has both 1,q in grade 0, demanding w=0 and w=2 simultaneously | Original pure of weight 1; semisimplification not pure |
| 0.4 lift independence | Finite inertia F=C₂, commuting lift A=3, τ=−1: (Aτ)²=9=A²; eigenvalues −3 and 3 both weight 2 for Q=3 | Both directions of power criterion needed and valid |
| 0.4 rescaling | t′=3t,N′=N/3: t′N′=tN, ker N′=ker N, im N′=im N | Same exponential and grades |
| 0.4 scalar extension | Q₃² string extended to Q₃(√2): grade dimensions 1,1 on both fields; eigenvalues 1,q unchanged | Purity reflected as well as preserved |
| 0.4 finite inertia/zero object | Finite-order inertia acts trivially on an open subgroup: log 1=0, hence N=0. Zero module has no eigenvalues and all grades dimension 0 | Zero pure for all w; finite inertia reduces to grade 0 |
| 0.4 dual | For q=2, contragredient exp is 1−aNᵗ, not 1+aNᵗ; graded eigenvalues 1/2,1 have weights −2,0 | Central weight −1; sign fixed by inertia |
| 0.4 tensor | Two weight-1 strings: N_total=N⊗1+1⊗N; grades −2,0,2 have eigenvalues 1; q,q; q², weights 0,2,4 | Central weight 2=1+1; retain |
| 0.4 Tate twist | Rank-one E(−1) has N=0,F=q, weight 2; twisting by (1) makes F=1,weight 0=2−2 | General datum needs the explicitly specified character |
| 0.4 excluded q=1 | For eigenvalue 1, absolute value 1=1^(w/2) for every w, unlike q=2 where weights 0 and 2 require 1 and 2 | Q≥2 prevents collapse of weights |
| 0.5 detection by restriction | String, residue index 2: eigenvalues 1,q² with base q², weights 0,2; tame subgroup ℓℤ_ℓ has nonzero values ℓa | Purity true in both directions with same center 1 |
| 0.5 tower hypothesis | p=2,ℓ=3: each tower degree 2^r is coprime to 3^m, so the finite tame quotient still has size 3^m; an ℓ-root tower instead leaves size 1 | p-root tower satisfies nonvanishing; ℓ-root control fails |
| 0.6 transport | Isomorphism constant c=3 replaces N by N/3; exp((3a)(N/3))=1+aN, F unchanged | Purity equivalent under marked transport, not arbitrary group isomorphism |
| 0.7 direct sums | Two strings: grade dimensions 2,2, eigenvalues (1,1),(q,q); each summand has dimensions 1,1 | Purity of sum iff purity of both |
| 0.7 nonsplit subrepresentation | ker N=Ee₀ has N=0,F=1,weight 0; ambient string has central weight 1 | Arbitrary subrepresentation version fails; README excludes it |
| 0.7 nonabelian group control | S₃ permutation action on Q₃³: diagonal line and sum-zero plane intersect in 0 since 3x=0⇒x=0; ranks 1+2=3, all finite-image eigenvalues roots of unity | Stable direct-summand statement includes nonabelian finite inertia |
| 0.8 WMC definition/range | ℙ²: H⁰,H²,H⁴ have eigenvalues 1,q,q² and weights 0,2,4; all other degrees including −1 and 5 are 0 | Degreewise/all-degree formulations agree |
| 0.8 empty/disconnected/point | Empty scheme has every H^i=0; Spec k has H⁰=E; two split points have H⁰=E²,F=1; unramified quadratic point has F swapping factors with eigenvalues 1,−1 | Degree-zero weights 0; disjoint-union equivalence holds |
| 0.8 pole consequence | Split Tate curve: H¹-invariants eigenvalue 1 gives poles Re(s)=0≤1/2; trivial-inertia semisimplification also gives eigenvalue q and poles Re(s)=1 | Monodromy retained; converse not claimed |
| 0.9 finite base change | e=2,f=2: N′=2N,F′=F², eigenvalues 1,q², base q², grade weights 0,2 before and after | Both directions hold; e is nonzero even when ℓ=2 |
| 0.9 purely inseparable extension | k=F₂((t)), k′=F₂((t^(1/2))): e=2,f=1, same étale category; tame parameter doubled, N′=2N over Q₃ | No separability-only restriction introduced |
| 0.10 good reduction | ℙ¹ over O_k: N=0; H⁰=E,F=1 and H²=E(−1),F=q. Tate curve has N≠0 and no good-reduction hypothesis | Positive and excluded cases agree with statement |
| 1.1 closed-point equal characteristic | Closed point degree a=2 over F₃ gives residue q_x=9. Split nodal string eigenvalues 1,9 give grade weights 0,2 relative to 9; nonsplit gives −1,−9 with same moduli | Closed-point normalization retained |
| 1.2 global function field | ℙ¹ over F₃(t), place degree a: H² eigenvalue 3^a, modulus (3^a)^(2/2), and H¹=0; nodal elliptic place has grades 0,2 | Good and bad places both included |
| 2.1 tower stages/completion | k=Q₂(√2),ϖ=√2: stage r has degree 2^r and v(ϖ_r)=2^−r; residue size stays 2; completed value group is Z[1/2] | Nondiscrete union, discrete finite stages |
| 2.1 coordinate quotient | Class u=ϖ₁ mod ϖ is nonzero and u²=0; T^(1/2) mod T is likewise nonzero and square-zero | Nonreduced quotient required |
| 2.1 Frobenius/tilt | Teichmüller coefficient a and ϖ_r have mod-p roots a^(1/p),ϖ_(r+1); t=(ϖ_r) has t♯=ϖ | Coordinate and perfectoid criterion agree |
| 2.1 norm sign | p=2: norm(ϖ₁)=−ϖ but t♯=+ϖ; norm(−ϖ_(r+1))=−ϖ_r for quadratic steps | Norm system not confused with sharp |
| 2.2 composite Galois equivalence | Split degree-d algebra goes to d split factors through completion, tilting, completed perfection; for d=0,1,2 the numbers of components remain 0,1,2 | Degree and direction agree; no assumption tower is Galois |
| 2.2 componentwise action laws | q=2: β(σ)(ζ₃♭)=(ζ₃♭)² has sharp ζ₃²≠ζ₃; β(1)t=t with sharp ϖ≠0. Products and inverses are computed coordinatewise, so β(σσ⁻¹)=1 | Excludes identity-only and zero-map models |
| 2.3 prime-to-p Tate coordinates | p=2,ℓ=3: μ₃ has 3 elements on either side and multiplication/sharp identify them; μ₂ has 1 element in char 2 but 2 in char 0 | Prime-to-p restriction necessary |
| 2.3 transition and residue compatibility | ζ₉↦ζ₉³=ζ₃ on each side; sharp((ζ₉♭)³)=(sharp ζ₉♭)³=ζ₃; at q=2 residue Frobenius squares the corresponding prime-to-2 roots on both sides | Tate inverse-limit maps and automorphisms agree |
| 2.3 false torsion model | ε=(1,ζ_p,ζ_(p²),…) has ε♯=1 but ε has infinite order; an element of μ_(ℓ^m) has order dividing ℓ^m on both sides | Sharp-fibre element not automatically torsion |
| 2.4 inertia/residue/Frobenius | Unramified degree 2: residue F_(q²) on both sides, Frobenius q²; k″=F_q((t^(1/p))) has e=p, so t_k=p(t_k″∘β) | Scaling and residue comparisons are independent |
| 2.4 marked isomorphism scalar | p=2,ℓ=3: N″=2N for t_k=2t_k″; datum isomorphism constant 1/2 changes it back to N | Wrong scalar 2 would leave 4N |
| 2.5 transfer | Two-term string after residue degree f and ramification e: grades eigenvalues 1,q^f with base q^f and operator eN; center remains 1 | Restriction/transport/finite-extension steps agree |

| Statement | Instances and computed values on both sides | Result/change |
|---|---|---|
| 3.1 tube definition/generator API | I=(T), generators T or T,2T over O: max(norm T,norm 2T)=norm T; at ε=1/4 both domains satisfy norm T≤1/4 | Integral generator independence |
| 3.1 openness/quasicompactness | On the closed unit disc, ε=norm ϖ: inequality norm T≤norm ϖ is the rational domain with denominator ϖ; denominator is nonzero | Genuine rational open; not a Euclidean closed-set argument |
| 3.1 monotonicity/zero locus | ε′=1/16≤ε=1/4: smaller disc included; intersection of all positive radii contains precisely T=0, with value 0 | Direction correct, including higher-rank continuous valuations |
| 3.1 zero/unit ideal | I=0 gives every point; I=(1),ε<1 gives no points since 1≤ε is false; ε≥1 gives whole disc | Empty and unit cases retained |
| 3.1 constructible cofinality | Constructible neighbourhood norm T≤1/4 contains every tube with ε≤1/4; a constructible set omitting T=0 cannot be a neighbourhood of V(T) | Required containment tested; no fixed universal radius |
| 3.1 pullback/base change | Map T=S²: inverse image of norm T≤ε is norm S≤√ε, equal to tube of pulled-back ideal (S²); scalar extension keeps same inequality | Source/target and radius correct |
| 3.1 model dependence | I=(T),J=(ϖT),ε=norm ϖ²: radii norm ϖ² and norm ϖ; T=ϖ belongs only to second | Generic fibre alone does not determine fixed-radius tube |
| 3.1 toric sections/integral frame | Section s=T e and new frame e′=u e with u,u⁻¹ integral have norm u=1, so norm(T/u)=norm T; T² at ε=1/16 gives radius 1/4 | Gluing agrees with section domains, powers change radius |
| 3.1 proper-model comparison | X=ℙ¹_O gives the whole analytic ℙ¹; X=𝔸¹_O gives only unit disc, excluding T=ϖ⁻¹ with norm>1 | Properness cannot be omitted |
| 3.2 degreewise local constancy | Identity disc: R⁰=Λ, R^j=0 for j>0; two disjoint copies give Λ² and 0; on puncture ranks 1 and 2 are constant | Does not alone give one radius for infinitely many j |
| 3.3 punctured-disc cover | Char 0, T=S^m, m=p: finite étale on puncture, derivative pS^(p−1)≠0; self-pullback has m constant sheets | p-divisible degree included |
| 3.3 characteristic-p control | y^p−y=T⁻¹ has wild group C_p; Kummer T=S^p has derivative 0 | Characteristic-zero theorem not extended to this cover |
| 3.4 fixed locally constant endpoint | Constant rank-two sheaf on disc and origin: H⁰=Λ² on both; H^i=0 for i>0; restriction (a,b)↦(a,b) | Fixed F,n quantifiers correct |
| 3.4 blow-up descent | Z=X: Bl_Z X=∅, but Bl_Z X⊔Z=X; augmented identity nerve has H⁰=Λ, higher 0 for affine disc. Blow-up alone has H⁰=0 | Cover includes the missing components |
| 3.4 finite-open gluing | Cover a disc by two copies of itself: differential Λ²→Λ is (a,b)↦b−a; kernel diagonal Λ, cokernel 0 | Same restriction complexes glue |
| 3.4 bounded amplitude | Identity or two disjoint identity discs: b=0, R^j=0 for j>0; ranks 1 or 2 in degree 0 | Finite range yields simultaneous use of degreewise input |
| 3.4 disc stabilization | Restriction from radius 1/4 to 1/16 sends 1↦1 on Λ and all higher zero groups to zero | Quasi-isomorphism on this test |
| 3.4 closed-support continuity | Filtered system of smaller-disc H⁰ is Λ with identity transitions; colimit Λ→H⁰(point)=Λ is identity; higher colimits 0→0 | Tests cohomology, not merely point-set intersection |
| 3.4 sliced nearby-cycle definition/base change | Identity map with constant Λ: nearby H⁰=Λ, H^j=0 for j>0; identity base-change map is id; unit/counit restrictions preserve 1 | Supplied functor specialized consistently |
| 3.4 unipotence vs finite action | Ramified quadratic cover: on Λ² inertia swaps coordinates; (σ−1)^r=(−2)^(r−1)(σ−1). For n=3 no power is zero; for n=2^a a sufficiently large power is zero | Finite action alone is insufficient |
| 3.4 ramified base-change Check | After adjoining √ϖ: generic nearby stalk rank 2 with trivial inertia; special fibre κ[t]/(t²) has one underlying point, not two | Nonreduced fibre not confused with split reduced fibre |
| 3.4 local unipotence API | Trivial rank-two Λ has filtration ranks 0,1,2. Extension A=[[1,1],[0,1]] satisfies (A−1)²=0; direct sum of trivial lines has A−1=0 | Subquotient/exact/tensor reasoning uses locally constant strata |
| 3.4 unipotence pullback | Identity pullback of preceding filtration leaves two rank-one trivial grades; zero sheaf has filtration length 0 | Both degeneracies allowed |
| 3.4 adapted nodal-curve definition | Smooth affine-line family with marked section x=0: D→S degree 1 étale, complement x≠0. Boundary x²=s ramifies at s=0 with derivative 2x=0 there | Correct and incorrect markings distinguished |
| 3.4 adapted plurinodal refinement | One smooth nodal stage with étale section: lower/top opens and inverse-image complement agree; zero stages give S′ itself, no boundary equations | Mathematical target retained through declared contract R02 |
| 3.4 compact-support nearby comparison | Identity trait, F=Λ: stalk Λ equals compact cohomology of special point Λ in degree 0, higher 0 | R02 restores supplier owner |
| 3.4 coefficient-uniform alteration | Identity family admits S′=S for all n; the quadratic-cover swap has non-unipotent action mod 3 before suitable ramified base change and identity action afterwards | One alteration must work independently of n |
| 3.4 adapted coefficients/existence | f:S↦S³ in char 0: rank 3 over puncture and rank 1 at branch point; with π=f, generic pullback splits into 3 sheets; constant coefficients then have trivial graded inertia | Proper generically finite modification, not assertion of original global lissity |
| 3.4 adaptedness consequences | Identity family: stalks Λ, specialization id and inertia 1; cubic cover after splitting: stalk Λ³ and inertia 1 | Overconvergence/tameness applied after the specified cover |
| 3.4 Kummer-cover definition/API | T=S³ in residue char 2: degree 3, deck multipliers 1,ζ₃,ζ₃²; preimage radii a^(1/3),b^(1/3). Degrees 2 then 3 in char 0 give degree 6; degree 1 is identity | Degree, composition and radius laws agree |
| 3.4 tame-at-point definition/API | Residue char 2: C₃ monodromy has order 3 invertible in O; C₂ has order 2 noninvertible. Quotient of C₃-image has order 1 or 3; pullback by its cover has order 1 | Tame/wild distinguished |
| 3.4 tame direct sum/tensor | Two C₃-actions have joint image contained in C₃×C₃, order dividing 9, still odd; constant sheaf image order 1 | Closure laws preserve tameness |
| 3.4 analytic annular decomposition | Char 0, T=S^m: annular inverse image has radii a^(1/m),b^(1/m), all m allowed. Char p requires the stated invertible Galois dominating degree for the analytic argument | Hypothesis is on dominating degree, not total degree |
| 3.4 algebraic annular decomposition | Locally T=S^e u(S), norm u=c≠0 constant on a small disc: norm S lies between (a/c)^(1/e) and (b/c)^(1/e) | Works for wild e too; Kummer refinement only when e invertible in K |
| 3.4 wild algebraic test | Char 2, T=w²/(1−w), norm w<1: norm T=norm w², derivative w²/(1−w)²≠0 away from 0, degree 2 | Annulus cover exists but is not Kummer |
| 3.4 discriminant negative control | Previous cover at radius r: discriminant norm r; plus identity sheet gives total degree 3 with norm 3³=1. For r=1/4,1/16: r<1 | README avoids the false total-degree bound; source issue below |
| 3.4 tame annular trivialization | Order-3 Kummer local system in residue char 2 pulls back to 3 constant coordinates; wild Artin–Schreier y²−y=T⁻¹ remains nontrivial after odd-degree Kummer pullback | Tameness and interior shrinking retained |
| 3.4 AS nontriviality computation | After T=S^m with m odd, a putative Laurent solution has coefficients a_−(2^j m)=1 for all j≥0; on norm S=b<1 their terms have norms b^(−2^j m)→∞ | No convergent analytic solution; wild control discriminates |
| 3.4 uniform annular direct images | Identity/cubic Kummer/AS finite covers have R⁰ ranks 1,3,2 and R^j=0 for j>0; covers of degrees 1,3,2 trivialize respectively | δ independent of n; wild Galois factor retained |
| 3.4 annular compact-support comparisons | Constant Λ on prescribed half-open pseudo-adic supports: H_c^i=0 in every i, on both supports | Does not replace support by ordinary rank-one annulus |
| 3.4 annular ordinary restriction | Constant rank-two sheaf: H⁰=Λ² and H¹=Λ(−1)² on each side, H^i=0 for i≥2; restriction sends two Kummer generators to themselves | Isomorphism in all degrees |
| 3.4 punctured strict support | Constant Λ, strict radial pseudo-adic support: each compactly supported group is 0, filtered comparison 0→0 | Support convention essential |
| 3.4 finite-cover descent | Degree-3 Kummer cover with n=3: pullback has 3 constant generators; descent recovers rank-3 sheaf, but 1/3 does not exist in Λ | No averaging argument used |
| 3.4 excluded equal radii | a=b=1: circle has H⁰=Λ, while intersection with interior norm T<1 is empty with H⁰=0 | Strict a<b cannot be dropped |
| 3.4 nonproper smooth duality | ℙ¹×B→B,N=1: R⁰g_*Λ(1)=Λ(1), R²g_*Λ(1)=Λ; duals of R²g_!Λ=Λ(−1), R⁰g_!Λ=Λ give the same groups | Twist belongs on ordinary side; R02 owner repair |
| 3.4 duality finite coefficients | Two identity components, n=2: trace pairing matrix diag(1,1), determinant 1 in F₂ | Perfect without dividing by number of components |
| 3.4 uniform amplitude | Disc/point: H⁰=Λ,H^i=0 for i≥1, so N=1 works for every invertible n; empty support all groups 0 | Quantifier order preserved |
| 3.4 restriction-cone descent | Identity Čech nerve has identical restrictions and zero cone at each level; for r=−1 the requested H^j for j≤−1 are all 0 | Boundary truncation meaningful, no natural-subtraction artefact |
| 3.4 smooth principal comparison | f=T: disc→origin restriction is id on Λ and 0→0 in higher degrees, radius 1 for all n | Positive test for endpoint route |
| 3.4 inseparable parameter change | Char 2,f=T²,f′=T,ε=1/16: tube(f′,ε) and tube(f,ε²) both have radius 1/16; tube(f,ε) has radius 1/4 | Exponent direction correct |
| 3.4 uniform endpoint | Completed algebraic closure of F₂((t)), every odd n: all positive discs have H⁰=Λ,H^i=0 for i>0, same as origin; ε₀=1 | One radius for all n and i |
| 3.4 coefficient/nonreduced controls | n=1: all groups 0. Mixed char n=p: disc H¹ infinite-dimensional, point H¹=0. V(T²),ε=1/16 gives radius 1/4 versus V(T) radius 1/16, both closed supports a point | Invertibility and chosen scheme structure retained |
| 3.5 cup pullback | Λ=Z/3, degree-zero a=b=2: pullback of product is 1, product of pullbacks 2·2=1; unit goes 1↦1 | Uses existing Ext composition, no duplicated abstract theorem |
| 3.5 inverse/unit/coefficient API | Inverse of restriction iso sends 1 to 1; Z/9→Z/3 sends 2·2=4 to 1, equal to reduced product. Zero endomorphism sends 1 to 0 | Zero or unmarked linear map cannot replace geometric pullback |
| 3.6 stable neighbourhood | Zero section of ℙ¹_O: every small disc has H⁰=Λ,H¹=0, unchanged by continuous K-automorphisms since norm T preserved | Radius chosen over K makes Galois action meaningful |
| 3.6 wrong-neighbourhood control | Plane cubic Y⊂ℙ²: dim H¹(Y,E)=2, dim H¹(ℙ²,E)=0 | Entire ambient variety not automatically a cohomological neighbourhood |
| 3.6 all-power comparison | Same radius for Z/ℓ^m, transition sends 1 mod ℓ^(m+1) to 1 mod ℓ^m; limit Z_ℓ→Z_ℓ identity, then E→E identity | Finiteness/realization hypotheses explicitly consumed |

| Statement | Instances and computed values on both sides | Result/change |
|---|---|---|
| 4.1 approximation definition/existence | c=0,Y=X=ℙ¹: take k₁=F_q(t),L=K,Z′=ℙ¹,g=id; dimensions 1=1, degree 1, image whole π⁻¹(X) | Includes zero equations |
| 4.1 dimension-zero model | One rational point: Z′=Spec k₁, dimension 0, degree 1, H⁰=E, no higher cohomology | Empty top intersection has value 1 |
| 4.1 dimension/proper/generically finite API | Over F₃(t), y²=x³−x maps by x to ℙ¹ with degree 2; both dimensions 1, map proper, image all ℙ¹ | Nontrivial approximation with all required properties |
| 4.1 smooth/geometric-connectedness API | On that elliptic affine chart derivative with respect to x is 1 in F₃; smooth projective curve has top cohomology dimension 1; F₃-points number 4, so Frobenius trace 0 | Regular perfect-field alteration and smooth descent are consistent |
| 4.1 containment API | Y=X=ℙ¹ and whole ambient tube: image of elliptic x-map is ℙ¹, which equals π⁻¹(X) | Containment does not force cohomology isomorphism |
| 4.1 local closure API | Closure of F₃(t) in completed perfection is F₃((t)), with v(t)=1 and residue size 3 | Actual local field, not completed perfection itself |
| 4.1 imperfect-field negative control | Char 2 conic X²+sY²+tZ² becomes (X+√sY+√tZ)² over extension: geometric multiplicity 2, gradient identically 0 | Regularity over imperfect field insufficient; route avoids it |
| 4.1 top intersection | Degree-2 elliptic cover: deg g*O(1)=2·1=2; in dimension 0, inseparable point degree p gives p·1=p>0 | Total degree includes inseparable part |
| 4.1 different cohomology Check | ℙ¹ has dim H¹=0; elliptic approximation has dim H¹=2 | Only injection/summand is promised |
| 4.2 continuous-automorphism naturality | ℙ¹, q=2,n=9: untwisted top generator multiplied by 2 on both comparisons; inverse-only convention gives 5 mod 9, not 2 | R02 supplier ownership; normalization correct |
| 4.2 actual comparison/degree zero | Connected Y,Z′: each actual map sends 1↦1, including inverse of tube restriction; composite E→E is identity | Not arbitrary linear data |
| 4.2 equivariance | On top Tate lines for ℙ¹ and elliptic approximation, F=q on each; degree-2 map satisfies 2q=q·2 | Galois characters match |
| 4.2 cup compatibility | Elliptic degree-2 approximation: f*(1·h)=2h′ and f*(1)·f*(h)=1·2h′ | Multiplicative with unit |
| 4.2 coefficient reductions/limit | Scalar 2 mod 9 reduces to 2 mod 3; compatible scalars 2 mod 2^m give 2 in Z₂ and nonzero 2 in Q₂ | Limits/rationalization not replaced by a mod-ℓ isomorphism |
| 4.2 ambient square | Y=X,g=id: restriction id, both routes equal π*; on H⁰ sends 1↦1, on normalized top generator sends 1↦1 | Square and direction agree |
| 4.3 top-degree isomorphism | Elliptic degree-2 approximation,ℓ=2: scalar 2 has inverse 1/2 in Q₂ but becomes 0 in F₂ | Rational conclusion valid, integral/mod-ℓ strengthening false |
| 4.3 connectedness control | Two disjoint target curves have top dimension 2 versus source dimension 1; diagonal top map cannot be onto | Geometric connectedness retained |
| 4.4 pairing splitting | S₃ on Q³, a=b diagonal Q→Q³: q(a(x),b(y))=3xy; annihilator is x₁+x₂+x₃=0; dimensions 1+2=3 and intersection 0 | Both injections and stable complement computed |
| 4.4 both-leg injectivity | Same example: a(x)=0 iff x=0, b(y)=0 iff y=0; if either leg were 0, scalar c would be 0 | c≠0 is essential |
| 4.4 character-equivariance | C₂ acts by −1 on V=E and +1 on V′=E; χ=sign: q(gx,gy)=−xy=χ(g)q(x,y) | Pairing may be character-valued, not invariant scalar pairing |
| 4.4 zero/finite-characteristic controls | U=0 gives V=0⊕V; F₂ identity gives V=V⊕0; diagonal in F₃³ lies in its sum-zero plane since 3=0 | Correct general field theorem; characteristic-3 example violates c≠0 |
| 4.4 false multiplicative substitute | Map with degree-zero identity and zero positive-degree maps sends nonzero top h to 0 | Multiplicativity alone insufficient; top isomorphism retained |
| 4.5 geometric stable summand | ℙ¹ versus elliptic approximation: in degree 1 source 0, target E², complement E²; in degrees 0,2 image is full one-dimensional group | Actual geometric comparison gives claimed splitting |
| 4.5 outside cohomological range | For curves, i=−1 or 3: source and target 0, decomposition 0=0⊕0 | All integer degrees allowed without junk indices |
| 4.6 final toric theorem | ℙ²: even-degree eigenvalues 1,q,q²; semistable elliptic curve: grade weights 0,2 centered at 1; smooth cubic threefold: H^i=0 outside 0≤i≤6 | Both unramified and nonzero-monodromy tests fit full theorem |
| 4.6 set-theoretic scope | A hyperplane and a positive thickening of its equation have same reduced support; codimension 1, dimension n−1; tube thresholds differ but the smooth reduced Y is unchanged | No accidental scheme-theoretic-intersection restriction |
| 4.7 projective-space/product fan input | ℙ¹ fan has rays ±1, support ℝ; two-chart gluing gives ℙ¹ over k; product gives four maximal cones and ℙ¹×ℙ¹; rank-zero fan gives point | Mathematics correct; missing supplier contract R01 |
| 4.7 Fermat and arbitrary reduction | p∤e: partials e x_j^(e−1) have no simultaneous projective zero (for e=1 they are nonzero constants); for e>1 all zero would force all x_j=0 | Good-reduction Check does not narrow cubic-threefold corollary |
| R01 repair instance | k=Q₂: chart rings k[T],k[T⁻¹] intersect in k[T,T⁻¹], as for k=C; O(1) degree 1, Segre O(1,1) gives degree 2 on the surface | Contract must identify algebraic models over both fields |
| R02 contract agreement | Four plan slugs; zero README slugs; restoring all four gives four equal pairs with owner ClassicalAdicEtaleCohomology | Ownership mismatch requires repair |

**Pinned-library audit.** Mathlib was inspected at `f6090c7095e1e56b3464c1daba5f24631f1290d2`, Tau Ceti at `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. These match the worktree manifest. Object searches included inertia, tame Kummer ratios, Frobenius conjugation, nilpotent exponential, monodromy filtration/purity, perfect pairings, Ext composition, perfectoid fields/tilting, tubes and fan products. The following are source declarations opened at those pins, not newer documentation:

| Pinned declaration(s) | File and line | What was checked |
|---|---|---|
| `Field.absoluteGaloisGroup`, `mapOfAlgebra` | `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42`, :59 | Automorphism group of algebraic closure with Krull topology; scalar-tower restriction is continuous. Restriction alone is not an equivalence. |
| `Representation` | `Mathlib/RepresentationTheory/Basic.lean:48` | Monoid homomorphism into linear endomorphisms; continuity is not a field of this definition. |
| `Padic`, `PadicInt` | `Mathlib/NumberTheory/Padics/PadicNumbers.lean:531`; `Mathlib/NumberTheory/Padics/PadicIntegers.lean:71` | Prime-indexed completion and norm-at-most-one subring; no replacement by rational coefficients. |
| `IsNilpotent.exp` | `Mathlib/RingTheory/Nilpotent/Exp.lean:50` | Finite exponential uses rational scalars; its total definition alone does not assert nilpotence of every input. |
| `LinearMap.IsPerfPair` | `Mathlib/LinearAlgebra/PerfectPairing/Basic.lean:39` | Both adjoints bijective, not a Galois-equivariance predicate. |
| `Module.End.HasEigenvalue` | `Mathlib/LinearAlgebra/Eigenspace/Basic.lean:442` | Nonzero eigenspace condition, not just existence of the zero eigenvector. |
| `CategoryTheory.Abelian.Ext.comp` | `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:128` | Composition has the explicit degree-sum equality. |
| `Ext.mapExactFunctor`, `Ext.mapExactFunctor_comp` | `Mathlib/Algebra/Homology/DerivedCategory/Ext/Map.lean:223` (composition law) | Exact-functor map preserves Yoneda composition with appropriate Ext universes; §3.5 consumes rather than restates it. |
| `CategoryTheory.Sheaf.H` | `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:56` | Abelian-sheaf cohomology via constant ℤ; not automatically module-sheaf cup-product comparison. |
| `TauCeti.inertiaSubgroup`, `isClosed_inertiaSubgroup`, `IsArithFrobeniusLift` | `TauCeti/NumberTheory/LocalField/Unramified/Inertia/Basic.lean:106`, :153, :327 | Fixing subgroup, closedness, restriction to arithmetic Frobenius; geometric lift obtained by inversion. |
| `inertiaKummerCharacter`, `inertiaTameCharacter` | `TauCeti/NumberTheory/LocalField/Tame/Character.lean:173`, :401, :412 | Positive root ratio; conjugation formula at :552. |
| `IsArithFrobeniusLift.smul_eq_pow` | `TauCeti/NumberTheory/LocalField/Tame/Quotient.lean:387` | Arithmetic q-power, agreeing with the inverse geometric normalization. |
| `teichmullerLift` | `TauCeti/NumberTheory/LocalField/Teichmuller.lean:63`, :75 | Zero-preserving multiplicative lift and residue recovery. |
| `Fan.prod`, `Fan.isComplete_prod_iff`, `Fan.IsComplete.prod`, `Fan.IsRegular.prod` | `TauCeti/Geometry/Toric/Algebraic/Fan/Product/Basic.lean:56`, :139, :161, :165 | Existing products and their completeness/regularity; no projective-space realization theorem among these declarations. |

**Ownership and supplier-order audit.** The main snapshot inspected was `929496d`, matching the worker citation index. Supplier files were read on main or through the roadmap service at their indexed heads. Searches used `roadmaps grep` by object, direct pinned-source searches, the board packages and the supplied sibling checkouts. There is no fully qualified Lean-name collision: this file declares zero names. Ownership against supplied open work was checked; no additional unprovided checkout was sought.

The three resolver leads are not missing-library defects: `WeilDeligneRep.IsWeilNumber` and `WeilDeligneRep.IsPureEnd` are planned by ArithmeticGaloisRepresentations §2.6, and `VanishingCycles.adicFunctoriality` is planned by EtaleCohomologyFoundations §F.4.6. Their README citations explicitly treat them as supplier interfaces.

| Supplier resolved | File/locator inspected | Consumed result and boundary |
|---|---|---|
| LocalFieldsRamification | `Completed/LocalFieldsRamification/README.md:343`, :726, :1239 | Teichmüller representatives, Eisenstein extensions, residue/inertia/tame structure. No Galois assertion about the p-root tower. |
| ArithmeticGaloisRepresentations | `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:1012`, :1806, :2008, :2051 | Finite coefficient models, monodromy, canonical scalar Weil/pair purity. Geometric inversion and rescaling match Layer 0. |
| LefschetzPencilsAndVanishingCycles | `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:328`, :1017, :1060, :1113 | Tame-character identification, sheaf monodromy, centered filtration and dual/convolution laws. |
| DeligneWeightsAndPurity | `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:845`, :1735, :2308 | Scalar/pair comparison, local curve theorem, proper-smooth finite-field purity. These are imports, not a new Weil-II proof. |
| EtaleCohomologyFoundations | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:105`, :504, :522, :540, :999, :1089, :1200 | Nagata compactification, proper/smooth/field base change, adic realization and actual Galois actions, traces. |
| PerfectoidSpaces | `TauCetiRoadmap/PerfectoidSpaces/README.md:4040`, :4453, :5713, :8478 | Sharp functoriality, residue comparison, ℚ_p example and componentwise Fontaine–Wintenberger; finite-k coordinate calculation is an extension here. |
| AdicEtaleGeometry | `TauCetiRoadmap/AdicEtaleGeometry/README.md:2142` | Henselian Tate-ring completion equivalence; restriction homomorphism alone is not used to infer it. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:5482`, :5612 | Kummer frame/field of norms; p=2 norm sign distinguished from sharp. |
| AdicSpacesPartII/III | `TauCetiRoadmap/AdicSpacesPartII/README.md:7466`, :7522, §§R1.3–R1.6; `TauCetiRoadmap/AdicSpacesPartIII/README.md:4746`, :7480, :8232 | Constructible topology, analytification, generic fibre and proper comparison; equation/section valuation domains precede the finite-ideal gluing here. |
| ClassicalAdicEtaleCohomology | `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md`, §§1.1–1.5, 3.2, 4.5, 5.2, 5.4, 8.2–8.5, 9.4–9.7, 10.1–10.5, 11.1; especially :3051, :5056, :5152, :5605 | Sites/supports, oriented nearby cycles, plurinodal factorization, trace inputs, disc/annulus cohomology, constructibility and proper comparison. The four missing extensions are declared contracts, as R02 explains. |
| AnalyticToricGeometry | `Completed/AnalyticToricGeometry/README.md:186`, :222, :250, :521 | General native fan ownership and complex realization; arbitrary-field projective-space contract is R01. |
| AnalyticToricGeometryPartII | `TauCetiRoadmap/AnalyticToricGeometryPartII/README.md:166`, :192, :208, :258, :282, :486, :510, :524, :580, :606, :622, :639, :725 | Divisor sections/models, unit spaces, field-natural projection/topoi, cohomology, dense-field and complete-intersection approximation. §6.4 promises dimension/containment, not smooth irreducible output. |
| SchemeAndStackFoundations | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:772`, :848, :1508, :5643, :6372, :6653, :6701 | Components, finite-stage descent, inseparable étale invariance, perfect-field regular⇒smooth, alteration, proper degree and projection formula. |
| AbelianSchemesAndArithmeticModuli | `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:1286` | Ample intersection positivity, applied to nonempty integral W; dimension-zero residue degrees retained. |
| EtaleDualityAndPerverseSheaves | `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:825`, :1158, :3541 | Perfect pairings, cycle/degree comparison and rational extensions with normalization. |
| Related open construction | `TauCetiRoadmap/CstConjectureForDaggerVarieties/README.md:746` | §3.7 uses projective complete-intersection tubes for de Rham/Hyodo–Kato purposes. Its conclusion is not the uniform étale neighbourhood theorem here; generic formal domains remain supplied. |

All Needs lines, including inline lines inside §3.4, were read. The layer order is local datum → curve theorem/marked tilt → neighbourhoods → comparison/top isomorphism/summand → weights. The standalone algebraic splitting has no later geometric dependency. No upward citation or cycle was found. No new later-roadmap prerequisite needs to move down; R02 concerns a conflicting reassignment of earlier supplier ownership.

Dependency check, rerun for this review, returned exactly:

```text
depcheck: 204 roadmaps, 1639 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Its successful graph check does not verify that a section supplies every claimed theorem, which is why R01 and R02 are separate findings.

**Acceptance module and shape.** The headline inventory is §§0.5–0.10 (detection, transport, summands, finite-extension invariance, good reduction), §§1.1–1.2 (equal characteristic), §§2.1–2.5 (coordinate tilt, marked equivalence and transfer), §§3.2–3.6 (local constancy, punctured-disc covers, both neighbourhood theorems, geometric cup compatibility and stable neighbourhoods), §§4.1–4.3 and 4.5–4.7 (approximation, actual multiplicative equivariant comparison, top isomorphism, geometric summand and the final toric/projective-space theorems). §4.4 is elementary algebra on native perfect-pairing carriers, not a geometric headline in isolation; keeping it only in the README is consistent with the no-padding rule.

The module docstring names these unavailable headlines and the missing carriers. The pins do not supply the canonical monodromy-grade purity and actual geometric comparison interfaces needed to state them without substantial new constructions. Native absolute Galois groups, bare representations, generic scheme cohomology and partial toric carriers do not suffice. No weakened stand-in was introduced. The file has one Mathlib import, one module docstring, the correct namespace, zero declarations, zero admitted examples and no options. Consequently the declaration-signature inventory and one-tactic padding-probe inventory both have cardinality zero: there are no section binders to disappear, no `#check @name` comparisons to perform, and no sorried theorem to replace by a tactic. No signature changed.

The requested direct `lake env lean` elaboration of `TauCetiRoadmap/DeligneWeightsAndPurityPartII/Suggested.lean`, run from the PR worktree, exited 0 with no warnings. The worker's targeted-module build also passed. The supplied push gate for the exact reviewed head returned:

```text
gate DeligneWeightsAndPurityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

The diff outside the reviewed folder is empty. The folder's metadata is a permitted roadmap file, not stray source material. The README has the requested summary, scope, conventions, supplier contracts, five layers with Examples/Dependencies, downstream uses and references. Definitions have API bullets and discriminating positive/negative Checks; theorem statements and their source locators retain coefficient, topology, dimension, smoothness and connectedness conditions. No route-specific good-reduction restriction, algorithmic milestone, copied source passage, sorry-data or `set_option` was found. Repository content was not edited.

## Not verifiable

- **LUT93**, Theorem 2.2 and its punctured-disc use in §3.3: the original text is settled as uncertified. The available legal formulation checked is ITO20 line 103 and Theorem 4.11, line 1030. No claim of having read LUT93 itself is made, and no new request is opened.
- **HUB96**, especially Theorem 5.7.8 and Corollary 7.5.5: the original book is settled as uncertified. The compact-support/nearby-cycle statement was checked in ITO20 line 1198 and line 1299, and the annular duality use at ITO20 line 2009 and line 2038. Comparison use was also checked in SCH12 line 2604. These secondary checks do not certify every original-book locator.
- **HUB98**, Definition 1.4, Theorem 2.1 and Theorem 3.6: the original paper is settled as uncertified. The local-constancy and neighbourhood formulations were checked against ITO20's discussion and Theorem 4.5(2), line 974. The full original definition of oc-quasi-constructibility was not available to rederive from its text. No new request is opened.

No additional source was left awaiting retrieval. The verdict does not depend on guessing the contents of any of these originals.

## Source issues

- **Error** in ITO20 at proof of Theorem 6.2, printed p. 52 (line 2342): the source says the discriminant function of any finite étale punctured-disc cover is bounded using only its degree; it should be restricted to hypotheses making the relevant field-factor degrees invertible, with a separate argument for wild algebraic covers; affects the proof.

For that source issue the witness is the characteristic-2 cover T=w²/(1−w): at Gauss radius r its normalized discriminant norm is r, so its logarithmic discriminant is −log r, unbounded as r→0. Adding an identity sheet even makes the total degree 3 while the norm remains r<1=norm(3)³. This refutes the cited bound, not the annular-decomposition conclusion for that particular algebraic cover. The README already avoids this proof error.
