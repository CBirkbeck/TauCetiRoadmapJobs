<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1129#issuecomment-6482463005 -->
Red team round 2 pass a (codex) of d5859f5

Verdict: needs_changes

1. **F01** (P1) The specialness-field proof omits the minimal torsion ambient variety

   **Location:** packages/HeightsRationalPointsAndObstructionsPartII/README.md:1563: “only the implication "special for k′ ⇒ k_A ⊆ k′" holds”.

   **Claim:** Quotienting by the stabilizer suffices to make specialness force descent of the ambient abelian variety up to isogeny.

   **Witness:** Over K=acl(k(t)) in characteristic zero, take the nonconstant Legendre elliptic curve A and X={0}. The stabilizer is trivial and X is special over k, but k_A=K⊋k. xy-2022 lines 606–610 impose an additional reduction.

   **Exact repair text:** “After quotienting by the reduced connected stabilizer, let T_X be the smallest torsion coset containing X. Choose a torsion point a in T_X and replace (A,X) by (T_X−a,X−a). Specialness over every intermediate constant field is preserved. Only for this reduced pair, whose minimal containing torsion coset is its entire ambient variety, use specialness to infer k_A⊆k′. Then continue with the constant-subvariety field and conjugate-saturation arguments.” Add the Check: “For X={0} in a nonconstant elliptic A, T_X={0}; the reduced ambient variety is zero, and k_{A,X}=k although the original k_A is larger.”

   **Repair test:** The witness reduces to the zero abelian variety, with minimal isogeny field k, so the false implication concerning the original A is never used. This missing step is present in the source, not a new source error.

2. **F02** (P2) The total-space height uses two incompatible normalizations

   **Location:** packages/HeightsRationalPointsAndObstructionsPartII/README.md:1409: “h_{𝒜,L′}(P) = n⁻¹h(ι(P)) + h_{S̄,M}(π(P)) up to O(1)”.

   **Claim:** For the immersion arising from (L′)^n, the Weil height of L′ equals its projective height divided by n plus another base height.

   **Witness:** On E×P¹ take L=pr_E*O_E(3·0), M=O(1), and the Segre embedding for L′=L⊗π*M. At (0,[T:1]), h_L′=log T+O(1), but the displayed right side is 2log T+O(1).

   **Exact repair text:** “Write ι(P)=(P′,π(P)). Since the projective coordinate map is defined by (L′)^n, h_{𝒜,L′}(P)=n⁻¹h(P′)+O(1). Silverman–Tate bounds this by ĥ_L(P)+C max{1,h_{S̄,M}(π(P))}; the first inequality therefore gives the asserted bound on X*. Alternatively, GH's separately defined naive total height H_ι(P):=n⁻¹h(P′)+h_{S̄,M}(π(P)) satisfies the same bound, but it is not the Weil height of L′.”

   **Repair test:** The Weil-height identity now gives log T=log T+O(1). The alternative H_ι has value 2log T+O(1), explicitly a different function. gh-2019 lines 180–189 define that latter function; its convention was not imported into the package's height-machine notation. The final inequality survives.

3. **F03** (P3) Further definitions lack three discriminating Checks

   **Location:** packages/HeightsRationalPointsAndObstructionsPartII/README.md:1488,1550,1964: the Checks of §§9.1,9.5,11.1.

   **Claim:** The Checks validate descent up to isogeny, the two minimal-field constructions, and isotrivial curve–bundle pairs.

   **Witness:** §9.1 gives two direct restatements and one example. §9.5 has two examples, both for k_A, none for its subvariety-field construction. §11.1 has two examples; its third bullet merely restricts the scope to function fields.

   **Exact repair text:** Add these explicit Checks, retaining the existing useful ones:

   - §9.1: “The zero abelian variety has trace dimension 0 and descends over every subfield. For a nontrivial quadratic twist of a constant elliptic curve with generic j over k(t), char k=0 and k algebraically closed, the geometric trace has dimension 1 but the k(t)/k-trace has dimension 0: it is geometrically isotrivial but does not descend up to k(t)-isogeny. The nonconstant Legendre example has geometric trace dimension 0.” These distinguish zero, geometric descent and descent over the displayed field; the current explicit constant example supplies trace dimension 1 in both senses.
   - §9.5: “In Y=A²_k and K=acl(k(t,u)), the line y=tx has minimal algebraically closed field acl_K(k(t)), whereas y=ux has acl_K(k(u)); their intersection is k, and neither line is defined over that intersection. The coordinate line y=0 has minimal field k.”
   - §11.1: “In characteristic two, on a constant genus-two curve C₀, every degree-one class α satisfying 2α=ω_C is constant after algebraic closure: the fibre of [2] is finite over the algebraically closed constants even when nonreduced. Thus this pair is isotrivial; inseparability cannot supply a varying class in that fibre.”

   **Repair test:** Trace dimensions are respectively 0, (ordinary 0/geometric 1), and 0; the line coefficients are respectively t,u,0; the last finite fibre has dimension 0. These test the intended objects rather than repeat the defining predicates.

4. **F04** (P3) The translate-family Check forgets the stabilizer dimension

   **Location:** packages/HeightsRationalPointsAndObstructionsPartII/README.md:346: “For S the family of all translates of a fixed X (dim S = g)”.

   **Claim:** The parameter space of translates always has the ambient abelian variety's dimension.

   **Witness:** Take A=E×E and X=E×{0}. Its translates are E×{b}, parametrized by E: dim S=1, whereas g=2. The same family already appears in §1.4 at line 331.

   **Exact repair text:** “For the family of distinct translates of X, S=A/Stab(X) and dim S=g−dim Stab(X). For X=E×{0} in E² this dimension is one, and one point (0,b) determines the translate E×{b}, so m₀=1. For a finite stabilizer the translate family has dimension g.”

   **Repair test:** The example gives 2−1=1; X=A gives 2−2=0 and one parameter point. Neither case satisfies the original unqualified dimension equality.

## Earlier findings: verification at this head

The prior reports use F01–F10 (pass a) and F01–F03 (pass b). No finding in the repair receipt is marked not actionable. All thirteen earlier findings are repaired as findings; S01–S04 identify additional defects. Locations below are in packages/HeightsRationalPointsAndObstructionsPartII/README.md unless specified.

| Earlier finding | Status and repaired passage | Witness recomputed at this head |
|---|---|---|
| a-F01 | Repaired, :1517: “Existence and uniqueness of reduced row echelon forms over an arbitrary field are ClassicalArithmeticCompletion §3.19”. | Main TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:5886–5912 has that theorem. Row (2,2a) reduces to (1,a); zero/full rows to 0/I. |
| a-F02 | Repaired, :1568: “translation by (η, 0) lies in the stabilizer”; “translation by (0, η) gives E×{η}”. | First translate equals E×{0} with field k; the second has quotient coordinate η, hence minimal relatively closed field K=k(E). The repair's distinction between fields in K and in K̄ is correct. |
| a-F03 | Repaired, :2053: “ε_α = 1/d_α for function fields”; :2057: “converting to reference field K multiplies every height by [F : k(y)]/[F : K]”. | On the previous constant genus-two example, LHS=2/N² and corrected RHS≤10c₁/N²<2/N² for c₁<1/5. The old RHS c₁(1+8/N²) includes infinitely many constants. The extension degree bound is ≤M d_α, including inseparable α. |
| a-F04 | Repaired, :159: “For an integral Z”; “total degree of its reduced support”. | The doubled point has total degree 1 and fundamental-cycle degree 2; the definition now consistently chooses 1. |
| a-F05 | Repaired, :272: “isomorphism classes of triples ((A, λ, η), X)”. | Generic E: 48 symplectic bases / 2 automorphisms =24 marked classes over one unmarked pair; :291 records this. |
| a-F06, first locator | Repaired, :135: “§§3.1–3.2, (3.0.13)–(3.0.14), pp. 12–15”. | yamaki-strict-support lines 581–603 put the maps in §3.2; identity map sends u to u. |
| a-F06, second locator | Repaired, :171: “ggk-2026 lines 377–380”. | The projection inequality is used there; the incorrect DGH attribution is gone. For Z={P}×C, projection degrees 1 and d are bounded by product degree d. |
| a-F06, third locator | Repaired, :603: “§5.4, part (2)”. | packages/ArakelovGeometryAndAbelianHeightsPartII/design/README.md:1411–1426 states generic small-point equidistribution. Fixed abelian variety: mass 1. |
| a-F07 | Repaired, :1341: “smooth curve C₀ … of genus at least two”. | Such a constant curve is special but cannot be a one-dimensional torsion coset (genus 1); E×{0} satisfies both predicates. |
| a-F08 | Repaired, headings :1511 and :1527: “9.3 Fields of definition” precedes “9.4 Isogeny classes”. | :1540 now consumes §9.3. Coefficient a lies in both fields exactly when it lies in their intersection, before the defect induction uses descent. |
| a-F09 | Repaired, :315–316,878–879,1709: dimensions “3”/“4”, “four components”, coefficient scaling by “7”, and “X_m = mt + B”. | Fibre-square dimensions 3/4; multisection square has 4 components; two-point fibres give 4 points. h₁ is invariant under common scaling; c_NT≥log T. X₂=X₁ iff t∈B. S03 concerns other defining nodes. |
| a-F10 | Repaired, :1386: “InverseGaloisAndArithmeticFundamentalGroups §IG.3.1”. | Current new-roadmap supplier, TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:2583, supplies bounded-degree étale covers. On G_m, D classes and compositum degree lcm(1,…,D); D=3 gives 3 classes and degree 6. |
| b-F01 | Repaired, :171: the coordinate projection has its own intersection proof and “ggk-2026 lines 377–380”. | For C², d≤2d²; for {P}×C, 1≤d and d≤d. The generic fibre's integral ample degree is ≥1; rescaling by L^n multiplies total/base/fibre degrees by n^d,n^e,n^(d−e). |
| b-F02 | Repaired, :662,811,968,1172,2034: Yuan “110–118”, “110–116”, “121–135”, “129–135” and “2740–2830”. | The first four ranges lie on manuscript p.4; §4.4.3 starts p.81 and ends p.84. The wider last range includes the theorem used, not only its final deduction. |
| b-F03 | Repaired, :135–141: four individually named abelian valuation/measure/support/equidistribution gaps. | All four slugs and identical needs occur in design/plan.json; §9.12 and Layer 9 cite all four. Together with the other four gaps there are eight, all with named earlier suppliers. |

## Verified sound

The following tables record computations, not proofs of the general theorems. “Retain” means that the displayed test does not refute the target, subject to the supplier contracts and the limitations below. All 2,169 README lines and all 111 Suggested.lean lines were read. There are 108 numbered target subsections, three Lean declarations, no Lean definitions or instances, 111 Checks blocks and 291 Check bullets. The per-target ledger is condensed below to 46 sampled rows spanning all thirteen layers, retaining the finding witnesses and boundary/normalization tests. Convention and supplier rows supplement these samples. The Checks were read throughout; these computations do not claim 291 independent proofs.

### Acceptance statements and binder audit

All three declarations are in namespace TauCetiRoadmap.HeightsRationalPointsAndObstructionsPartII. They have explicit binders, universe u, and no ambient section variables to be lost by `sorry`. All three use the native point group, written multiplicatively. The native IsAlbanese property requires a(x₀)=1 and unique pointed factorization through abelian homomorphisms; it does not itself impose curve hypotheses. Those hypotheses occur explicitly below.

| Declaration / README | Actual context | Instances and computed values | Result / change |
|---|---|---|---|
| uniform_maninMumford_curves, Suggested.lean:57 / §3.6 | g:ℕ, 2≤g; existential natural B≥1 before every F:Type u with Field, IsAlgClosed, CharZero; X over Spec F with Smooth, IsProper, GeometricallyIntegral, Krull dimension 1; point x₀; native abelian J with dim=g; a:X→J with IsAlbanese x₀ a; arbitrary translation c. | Genus-two Weierstrass Abel image contains six 2-torsion classes, so B≥6. At x=Q and c=a(Q)⁻¹ the tested group element is 1; choosing the opposite translate gives a(Q)², generally nontorsion. Genus-one X=J would give infinite torsion, but 2≤g excludes it. | Retain. The encard bound counts points of X, as the Abel map is an embedding in this context. No arbitrary substitute predicate. |
| uniform_mordellLang_curves, Suggested.lean:75 / §6.8 | Same field/curve/Albanese binders; ∀c,ρ,s:Finset J(F),Γ:Subgroup J(F); s.card≤ρ; every p∈Γ has pⁿ in the subgroup generated by s for some n>0. | s=∅,ρ=0 gives pⁿ=1 and permits the entire torsion group; bound B^(1+0)=B. For a rank-one division group, s={P} gives rank≤1 and bound B² despite infinite generation. n=0 would make every p admissible, but is excluded. | Retain. The division-hull condition captures finite rank, with a rank bound rather than equality; B≥1 makes the bound monotone. |
| uniform_rationalPoints_curves, Suggested.lean:96 / §6.12 and §6.8 | Field F:Type u with NumberField; same smooth proper geometrically integral pointed curve and Albanese J; finite set s of size≤ρ whose division hull contains all J(F). B chosen before F. | For rank 0, all J(F) points are torsion and the bound is B. For a curve without an F-point, the unpointed count is 0≤B^(1+ρ); the displayed pointed implication has no input x₀. Given x₀, a(x₀)=1 belongs to J(F), so the nonempty count is ≥1. | Retain. This states the stronger degree-independent curve corollary used in §6.8; §6.12 explicitly acknowledges it. |

No one-tactic/pinned-lemma probe reduces any of these three declarations to an existing theorem. There is no API catalogue, admitted example, data `sorry`, `set_option`, `True` placeholder or extra Mathlib submodule import. The sole Tau Ceti import is the native Albanese module actually used. Static signatures agree with the README; mechanical elaboration was unavailable, as recorded below.

The headline inventory is: DGH's height inequality (§§2.7–2.8), family equidistribution (§3.2), uniform Bogomolov and curve Manin–Mumford (§§3.5–3.6), the new gap principle (§§4.8–4.9), Vojta/Mumford/counting (§§5.4–5.5,5.10,5.12), uniform Mordell–Lang and rational points (§§6.5,6.7–6.8,6.12), geometric Bogomolov and Yamaki reduction (§§8.4,8.6,9.12,9.19), potential-bigness and relative bounds (§§10.1,10.3,10.5,10.7–10.8), the global-field curve bound (§11.7), and the bielliptic bounds/unbounded orders (§§12.2–12.4). The module docstring names the unavailable height, polarized-family, cycle, trace, nonarchimedean-measure, moduli, and elliptic-quotient carriers for the remaining groups. It supplies no weakened stand-ins for them.

### Sampled adversarial computations, Layers 0–6

Here H=max{1,h_Fal}; D denotes the degree in the target's specified embedding. A finite bound with unspecified existence constants is tested by its required inequalities, not by inventing a numerical value for the constants.

| Target | Instances and values on both sides | Result / change |
|---|---|---|
| 0.1 Degree | Empty degree 0; rational point 1; quadratic closed point 2; doubled rational point reduced degree 1 versus cycle degree 2; line plus off-line point 2 versus top cycle 1; contained point contributes no new component: 1<1+1. | Retain repaired convention. |
| 0.2 Product grid | X=P¹, M=2, Z=diagonal: Σ={a} gives Σ²={(a,a)}⊆Z; Σ={a,b}, a≠b, gives (a,b)∉Z. Proper exceptional set has degree 1 in the first case. X a point forces Z=∅ and Σ=∅. | Retain; M≥1 excludes the empty-power obstruction. |
| 0.4 Packing | Dimension 0, nonempty S: 1≤(1+2R/r)^0=1. Empty S:0≤1. Interval [−r,r]: internal cover 1≤3; r=0 would give infinitely many singleton balls. | Retain; r>0 essential. |
| 1.2 Level Hilbert | Principal E: 8·1=8. Genus-two Abel curve:8·2=16. Fixed-pairing E[4] bases:48/2=24 marked isomorphism classes over one unmarked pair. | Retain repaired marking. |
| 1.3 Fibred powers | E×S, dim S=1: fibred square dimension 2+1=3, absolute square 2+2=4. [2]-multisection over E has four points per fibre and square has 16 points, grouped into four components indexed by E[2]. | Retain geometric-integrality restriction. |
| 1.5 Generic finiteness | Single parameter: X^m→X^m has degree 1 for m≥1. Translate family E×{b} in E² has dim S=1 rather than g=2, and one point pins b. | S04 corrects the Check. |
| 1.6 Nondegenerate powers | X=A over a positive-dimensional base of dimension s: source real dimension 2mg+2s, Betti target 2mg, deficiency≥2s for every m. For a fixed abelian variety the vertical Betti map has rank 2dim X. | Retain finite-stabilizer hypothesis and base distinction. |
| 2.1 Level hypothesis | On E[2], −1=1, giving a nontrivial polarized automorphism preserving level; on E[3], −1≠1, so this automorphism is removed. Over the characteristic-zero Legendre base adjoining E[3] has finite étale degree≤48. | Retain. |
| 2.2 Cut-off form | Product local coordinates: θ=θ(s), ω=dx∧dy, so d(θω)=θ′(s)ds∧dx∧dy, nonzero for θ′≠0. [2]*ω=4ω and [2]*θ=θ. | Retain; no closedness claim. |
| 2.4 Top intersection | Fixed E with embedding degree 4 and d=1: F degree=4N², so κ=4 works. Constant section over a curve: F degree independent of N, so no positive κ can bound κN² for every N. | Retain nondegeneracy hypothesis. |
| 2.8 General height | Replace L by L²: left height doubles; replace base M by M³: right base height triples, so coefficient changes by factor 2/3. Vertical X has constant base height and admits a larger c₂. | Retain; constants depend on bundles. |
| 3.1 Betti measure | Fixed A: normalized measure mass1, whereas raw top curvature integral=deg_L A. Torsion section: restricted form0 and top mass0, so cannot be normalized by a positive degree limit. | Retain nondegeneracy. |
| 3.5 Uniform Bogomolov | X={P}: count0 or1, so strict c₄ can be chosen>1. Torsion coset B+a: X°=∅, count0; replacing X° by X gives infinite height-zero set. Translation estimate with both heights≤δ/4 gives ĥ(P−P₀)≤δ. | Retain extended non-generating proof. |
| 4.6 Arbitrary polarization | n=l/g!=1 gives factors1. For n=2, height rescaling4; a one-dimensional exceptional component has degree rescaling4, while a zero-dimensional component has factor1. | Retain. |
| 4.7 Combined gap | Example c′₁=2,c′₃=3,c″₃=1: B=3, choose c₁=1/3. H≤3 gives c₁H≤1; H>3 gives 2H−3>H≥H/3. Exceptional bound max(c′₂,c″₂), not their sum. | Retain. |
| 4.8 New gap | Genus-two Abel curve generates J and degTheta C=2; exceptional closed proper subset is dimension0, cardinality=degree. For elliptic subgroup inside E×E′, ambient Faltings height can vary with E′ while subgroup data stay fixed, so generation cannot be discarded. | Retain. |
| 5.1 Euclidean space | Rank0 torsion: tensor dimension0, norm0. Division hull of a non-torsion P: dimension1; normalize ĥ(P)=1, then pairing(P,P)=1, norm(2P)²=4. Parent's unhalved form has diagonal2. | Retain half-pairing conversion. |
| 5.2 Embedding constants | Coefficient vector multiplied by7 has same projective height h₁; affine log norm would increase by log7. Sending origin to [T:1:…] gives h(origin)≥log T but canonical height0, hence c_NT≥log T. | Retain repaired Checks. |
| 5.6 Isolation alternative | Theta²=2 gives generic intersection2≤6²=36 with L=3Theta. For X=[3]⁻¹Theta: stabilizer81, D=54, so81>54 but81≤D²=2916. r=0 needs0 chosen points; empty Ξ gives exceptional degree0. | Retain corrected endpoint. |
| 5.10 Conditional count | ρ=1,c₀=2, three covering balls: total≤3·2²=12, not6. ρ=0 gives one Euclidean ball but can have c₀ torsion points; norm-zero classes are not individual points. | Retain simultaneous dimension induction. |
| 6.1 Ueno count over Qbar | g>0,X=A: X°=∅, count0. g=0,A=X=point: no positive-dimensional cosets, count1, requiring c(0,1)≥1. | Retain zero-dimensional convention. |
| 6.2 Specialization | Legendre section (2,μ), μ²=2(2−λ): atλ=2,μ=0 exact order2, so2P specializes to0; genericallyμ≠0 gives non-two-torsion. Constant sections specialize identically. | Retain dense-good-set quantifier, not every fibre. |
| 6.7 Uniform Mordell–Lang | X=A uses one coset; X=point uses zero or one point of Γ. Rank0 still allows infinite torsion in A but one torsion coset; no false finite-point assertion. | Retain. |
| 6.11 Small-height finiteness | Roots of unity: h=0, degrees unbounded, so height alone gives infinite points; adding degree≤d cuts to a finite set. Infinitely many twists of one curve give one geometric isomorphism class. | Retain geometric-class wording. |

### Sampled adversarial computations, Layers 7–12

| Target | Instances and values on both sides | Result / change |
|---|---|---|
| 7.1 Canonical comparison | A point of height a has normalized cycle height a/1=a. A torsion coset has height0 by both definitions. For [1:1/(t²+1)], fixed constants R give degree2 over R(t), relative degree4 over C(t); coordinate-field normalization divides4 by2 to recover2. | Retain reference-field convention. |
| 7.2 Minima | Singleton of height a≥0: e₁=a=ĥ(X)=e₁/(0+1). Constant subvariety:0≥0≥0. For d=1, bounds read e₁≥h≥e₁/2, so h=0 iff e₁=0. | Retain normalized denominator. |
| 7.4 Special | Constant genus-two curve: special=true, torsion-coset=false by genus2≠1. Elliptic subgroup: both=true. Trace-free nontorsion singleton: both=false. Point criterion is trace(constants)+torsion, not torsion alone. | Retain repaired example. |
| 8.1 Bounded-degree torsion | Constant E over k(S) has [K(P):K]=1 for every constant torsion point and unbounded orders; excluded by geometric trace dimension1. Quadratic twist acquires the same points in degree≤2; ordinary trace0 does not fix the defect. | Retain geometric trace-zero hypothesis. |
| 8.3 Curve height | Torsion multisection: ĥ=0, unbounded base height, but X*=∅. Vertical X: base height b constant and choose c≥max(1,b). For total-height identity on E×P¹, actual Weil value log T versus claimed2log T. | S02 distinguishes GH's naive height from the Weil height. |
| 8.5 Moriwaki inequality | Zero nef polarization on Q(t): all intersection factors involving its trivial metrized H vanish, yielding heights0, so0≤c(1+0). Number-field dimension0 polarization gives ordinary Weil height comparison. | Retain declared nef comparison gap; no Northcott used. |
| 9.1 Isogeny descent predicate | Zero A descends over every field, trace dimension0. Constant E has trace dimension1. A nontrivial constant quadratic twist has ordinary trace0 and geometric trace1; nonconstant Legendre has geometric trace0. | S03 supplies missing discriminating Checks. |
| 9.3 Intersection fields | Row (2,2a) reduces to (1,a) in characteristic0; coefficients lie in both fields iff a lies in their intersection. Zero/full subspaces have RREF0/I. In characteristic2 use (1,a) directly, never divide by2. | Retain repaired earlier ownership. |
| 9.5 Minimal fields | Constant E gives k_A=k; Legendre over acl(k(t)) gives k_A=acl(k(t)). Lines y=tx and y=ux give coefficient fields acl(k(t)) and acl(k(u)); y=0 gives k. | S03 adds subvariety-field tests. |
| 9.6 Specialness field | Nonconstant A with X={0}: k_(A,X)=k but k_A=acl(k(t))>k. For E² and X=E×{0}, translation (η,0) leaves field k; translation (0,η) gives field k(E). | S01 adds minimal torsion ambient reduction. |
| 9.11 Torsion class | Constant E×S, rigidified degree-two bundle: L≡2[0]. Degree-one torsion section gives factor2/1=2; degree-d multisection gives factor2/d, whose fibre intersection is (2/d)d=2. | Retain rational numerical equivalence and nonzero degree. |
| 9.14 Iterated sums | X={x}: X₀={0}, X₁={x}, X₂={2x}, all dimension0. X=t+B: X_m=mt+B, dimension1, X₂=X₁ iff t∈B. Genus-two Abel curve through0: dimensions0,1,2,2. | Retain repaired set-versus-dimension distinction. |
| 9.17 Height-zero fibre | Subgroup identity case at0: fibre{(0,0)}, height0. On E²: H₁²=H₂²=0,H₁H₂=1; L²=2,M·L=1,M²=0,(M+L/2)²=3/2. | Retain nef-limit direction and prime-to-p smooth multisections. |
| 10.1 Potentially big bound | In C², union of3 vertical fibres has product degree3; grid of3 points has9 pairs contained there and codimension1 gives3≤3, not3≤sqrt3. Constant pullback family has no base intersection and potential volume0. | Retain supplied codimension exponent. |
| 10.5 Five maps | s=0,g=2: thresholds (1,1,2,1,2) after m≥1 convention. Difference C²→J for genus2 has image dimension2 and generic rank2, hence is geometrically nondegenerate even though its image is all J. | Retain m≥1 clause and geometric/arithmetic distinction. |
| 10.8 Relative Bogomolov | s=0,g=2 over a number field: thresholds(1,2,3,2,3). Difference at m=1 has image J and dense torsion of height0, so the m≥2 threshold is essential. Over constant genus2 function field the absolute moduli dimension is0 instead of1, violating variation over constants. | Retain strengthened function-field hypothesis. |
| 11.1 Isotrivial pairs | Constant C₀ and constant α₀: pair descends. Generic x on C₀ gives α=O(x) varying in a one-dimensional Abel image, so pair does not descend. char2 fibre of[2] above canonical class is finite, dimension0, hence its geometric classes remain constant. | S03 adds third discriminating test. |
| 11.2 Shift criterion | g=2,d=1 shift=2α−ω. With α=w,ω=2w shift0. With α=O(η), shift map is [2] after Abel, finite nonconstant even in char2; constant iff original class constant. | Retain inseparable finite-fibre argument. |
| 11.7 Global curve bound | Constant genus2, Q_N=Q/N: all constant x have height2/N², Faltings0, shift height8/N². d_α≥N²/2 gives corrected RHS≤10c₁/N²<2/N² for c₁<1/5. Original additive1 admits infinitely many points once N²≥2/c₁. | Retain round-one correction, including inseparable residue degree. |
| 12.1 Bielliptic lift | Two double covers with three shared branch values give union of5 branch values; degree4 cover has ramification contribution5·2=10, so2g−2=−8+10=2 and g=2. With only2 shared values union has6 and genus3. Kernel has4 elements. | Retain origins over shared branch value. |
| 12.3 Bielliptic small height | Elliptic projection heights2a,2b give h_LX=a+b=(2a+2b)/2. Each coordinate quotient has degree2, so degree of L_X on genus2 Abel curve is2+2=4, fixed for the uniform theorem. | Retain degree-one elliptic normalization. |
| 12.4 Unbounded orders | If projected torsion has order M and lift has order n, M divides n, hence n≥M. With degree4 kernel, the kernel is killed by a finite integer and a lift of torsion remains torsion. Increasing M does not force more than B points on one curve. | Retain. |

### Additional convention and dependency computations

| Convention/input | Values | Consequence |
|---|---|---|
| Absolute versus relative heights | h([2:1])=log2 over Q and Q(i) absolutely; relative Q(i) value2log2. | Divide by the field degree before invoking uniform number-field constants. |
| Fubini–Study versus coefficient height | [2:1]:½log5 versus log2; [1:0]:0 versus0. Scaling homogeneous coordinates by7 changes both projective heights by0. | Distinct cycle/point metrics, already explicitly distinguished. |
| Zero dimensions and denominators | g=0 gives0!=1; a point has deg1 and normalized denominator(0+1)·1=1; empty reduced subset degree0 never used as a normalized subvariety. | No 0/0 introduced in the listed formulas. |
| Nonreduced geometric objects | Double rational point: reduced support degree1, cycle degree2; char2 E[2] degree4 but possibly1 or2 geometric points. | Scheme degrees are not replaced by geometric cardinalities; full level chosen prime to characteristic. |
| Infinite rank versus finrank junk | Module.finrank is Cardinal.toNat, hence0 at infinite rank, but §5.1 assumes finite rational rank before usingρ. | Infinite rank is not mistaken for torsion rank0. |
| Nonabelian groups / zero ring | S₃,Q₈ are not points of the native abelian variety carrier; zero ring is not a Field. | These proposed adversarial instances fail the input hypotheses, rather than producing vacuous substitute theorems. |
| Curve cover finiteness | Connected covers of G_m in characteristic0 of degrees1,2,3: three classes, simultaneous dominating degree lcm(1,2,3)=6. | Bounded degree does not mean the common cover has that same degree. |
| Strong induction in Layer5 | Packing in dimensionr consumes counting only at dimensions<r; counting at dimensionr consumes packing in dimensionr. | The coarse apparent §5.10/§5.11 loop is a well-founded simultaneous induction, stated explicitly. |

### Pins, supplier resolution and ownership

The manifest pins read were Mathlib f6090c7095e1e56b3464c1daba5f24631f1290d2 and Tau Ceti 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a. Eighteen explicitly named native definitions/theorems in the supplier contracts were resolved at those pins: the fourteen Mathlib names and four abelian-variety names below. Elliptic canonical-height files were also inspected for their normalization.

| Pinned interface | Verified definition and limit of what it supplies |
|---|---|
| Mathlib/Topology/MetricSpace/CoveringNumbers.lean:74,288,351; MetricSeparated.lean:43 | coveringNumber is an infimum over centres contained in the set; maximalSeparatedSet is empty if packingNumber is infinite; separation uses strict ε<edist. No finite-dimensional volume estimate is bundled. |
| Mathlib/Analysis/InnerProductSpace/PiL2.lean:111; Mathlib/Topology/MetricSpace/Pseudo/Defs.lean:418; Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean:500 | EuclideanSpace is PiLp 2; closedBall is dist≤r; Haar ball scaling has radius≥0 and real finite-dimensional normed-space hypotheses. Radius0 requires the dimension-zero case to be separated in the packing proof. |
| Mathlib/LinearAlgebra/Dimension/Finrank.lean:61; Mathlib/FieldTheory/IntermediateField/Basic.lean:52; Mathlib/RingTheory/AlgebraicIndependent/Basic.lean:45; Mathlib/LinearAlgebra/Span/Defs.lean:46 | finrank is rank.toNat; an intermediate field is an inverse-closed subalgebra; trdeg is cardinal-valued; span is the intersection of containing submodules. These supply carriers, not field-of-definition theorems. |
| Mathlib/LinearAlgebra/Matrix/Echelon/Basic.lean:87 | IsReducedRowEchelon records echelon order, unit pivots and zero entries above pivots. Existence/uniqueness is correctly attributed to ClassicalArithmeticCompletion §3.19. |
| Mathlib/NumberTheory/Height/Projectivization.lean:51 | logHeight is induced from tuple logHeight using its chosen admissible absolute values. It does not itself fix the absolute number-field normalization. |
| Mathlib/CategoryTheory/Monoidal/Cartesian/Grp.lean:58 | Hom.group derives point-group inversion by composition with the group-object inverse; the MonObj scope activates the instance. |
| TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95,281; Isogeny.lean:61; Albanese.lean:84 | Native proper geometrically integral group scheme, same-universe field base change, finite-surjective isogeny, and pointed Albanese universal property. No polarization/height is silently supplied by these structures. |
| TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean:119 and Limit.lean:71 | The limit uses the full naive x-height and divides by n², not 2n². ArithmeticDynamics §6.64 supplies its conversion to degree-one O(0) heights. |

The cross-roadmap check resolved eighteen supplier families, with repeated Needs ranges referring to the same contracts. Main was used where present; an open revision of an existing roadmap was not substituted for main. Current new-roadmap heads were read through `roadmaps show`; StableReductionPartII and ArakelovGeometryAndAbelianHeightsPartII were read in their board designs. This is a check of the contracted targets, not certification of every proof in those suppliers.

| Supplier citation checked | Current supplying target and boundary |
|---|---|
| SchemeAndStackFoundations §§0.3,4.11,4.13–4.14,5.1–5.6,5.12 | Main README supplies relative Proj, modifications, Bertini, Noetherian Hilbert schemes, cycles, proper/flat operations, Chern classes and refined intersections/Bézout. The additional flat nonproper component inequality is separately declared, not falsely attributed to the current text. |
| HeightsRationalPointsAndObstructions §§0.16–0.35,1.7–1.11,5.1–5.19 | Current parent supplies the height machine, geometric trace, small-point and qualitative counting inputs. Specific high-risk interfaces checked: §0.29 requires degree-one base height; §5.2 includes scheme stabilizers; §5.3 generated differences; §5.4a–c bounded coset directions; §5.5 division-hull characterization; §5.13c relative finite étale bounded-direction parameterization. |
| AlgebraicModuliForArithmeticGeometry §§1.5–1.6,2.1 | boundedDegreeHilbertPolynomials includes reduced equidimensional geometric fibres over Noetherian bases; Hilbert families require flat proper subschemes. Nonreduced embedded structures are not counted by bounded-support parameters. |
| PELModuli M5.1–M5.3,M6.9–M6.10 | Fine prime-to-characteristic level, universal polarized family, universal Hodge descent and classifying maps. Fixed-pairing cyclotomic base and marking are retained. |
| AbelianSchemesAndArithmeticModuli A1–A3,A6 | Cube/rigidification, principal quotient, finite-flat multiplication and quotient, Poincaré reducibility, relative Hom/normal-base extension. A2.7 and A2.9 supply positivity and normalized nef bundles used in the intersection proof. |
| AbelianSchemesAndArithmeticModuliPartII B0–B4 | B1.1's form is twice the principal Chern form; B2.13,B2.21–B2.23 use dominant GH specialness over a curve; B4.4 gives M≥3g−2; B4.5 includes generating fibres and finite generic stabilizer; B4.6 supplies the difference product. |
| ComplexComparisonPartII C5.4 | Integration over analytic cycles and Chern comparison; its manifold setting is finite-dimensional Hausdorff and second countable, consistent with the complex varieties used here. |
| ArakelovGeometryAndAbelianHeights §§2.7,3.4,4.2–4.4,5.5–5.8,6.3 | Metric conversions, stable Faltings height, isogeny change, controlled principal theta comparisons, Northcott and level-degree bounds. The arbitrary-polarization coordinate control remains a declared gap. |
| ArakelovGeometryAndAbelianHeightsPartII §§0.5,3.1–3.3,4.7–4.9,5.1–5.5,6.1–6.4,8.4,9.1–9.2,12.1–12.6,13.1,13.7 | Board design has the two-nef inequality, normalized adelic heights/minima, §5.4(2) equidistribution, canonical twice-theta, grid codimension exponent, absolute potential bigness, restriction and Faltings lower bound. §6.4 still requires big polarization; the requested nef comparison is explicitly a gap. |
| StableReductionPartII MC.4,MC.6–MC.7 | Board design contains all seven named full-level/fine-scheme/Torelli/Hodge/Picard export targets. Smooth full-level Torelli has finite fibres, not asserted proper finite; the package uses the former. |
| JacobianChallengePartII §§0.2–0.4,1.1–1.4,2.1–2.7,3.2–3.13,5.1–5.6,7.1–7.2 | Picard torsors, section-free Abel/difference maps and twice-theta; §5.4 fixes shifted first coordinate and unscaled remaining differences. For g=2,m=2, τ₂=(2x₁−ω+y,x₂−x₁), matching this package. |
| NeronModelsAndSemistableAbelianVarieties §§1.1–1.10,3.10,3.13–3.14,5.1–5.2 | Abelian scheme/Néron comparison, semistable finite extension, Raynaud uniformization and good-reduction isogeny invariance; potential good reduction is not treated as good reduction before extension. |
| TropicalAndBerkovichArithmetic §§6.2–6.4,7.0 | Model measures, metric limits/local heights and rank-one uniformization exist. The four stronger abelian-geometry measure results are not claimed as already proved there; their named gaps retain arbitrary geometric divisorial places. |
| ClassicalArithmeticCompletion §3.19 | Main gives existence/uniqueness of RREF; this package owns only the intersection-field descent application. |
| InverseGaloisAndArithmeticFundamentalGroups IG.2,IG.3.1 | Hilbert irreducibility and the explicit bounded-degree cover-finiteness target; the latter has characteristic-zero smooth quasiprojective hypotheses matching §8.1. |
| AlgebraicCurves Layers10–11 | Main supplies hyperelliptic/Weierstrass models and the tame Hurwitz bound; package invokes 84(g−1) only in characteristic zero. |
| JacobianChallenge LayerF | Main owns the pointed Abel–Jacobi universal property, consistent with native IsAlbanese used in the acceptance statements. |
| ArithmeticDynamics §§6.57–6.64,6.93,6.110–6.112 | Current new-roadmap head owns standard projections, O(0)/native-height conversion, joint small points, common torsion bounds and unbounded common torsion orders. Layer12 constructs the genus-two lift and transports those results. |

Object searches used `roadmaps grep` over main/open work and `rg` over board packages and the pinned libraries: uniform Bogomolov/Mordell–Lang/Manin–Mumford, restricted Hilbert families, minimal specialness/isogeny fields, iterated sums, Betti measure normalization, canonical heights, Ueno loci and the three Lean declaration names. Existing qualitative/fixed-family results belong to the parent and B2.3; the general uniform results here have strictly stronger quantifiers. Hilbert representation, RREF, Jacobian maps, adelic constructions and elliptic quotient dynamics remain imported. No second declaration of the three fully qualified acceptance names was found. No notion was moved from a later roadmap by this review.

The eight gap slugs in README and design/plan.json agree, with named suppliers and the same hypotheses. Their boundaries were checked against the current contracts: nonproper flat intersection, arithmetic interpolation, controlled polarization coordinates, the four abelian valuation/measure/strict-support/equidistribution results, and nef Moriwaki Silverman–Tate. None has supplier `none`; none requests an already available identical theorem. The measure contracts retain semistable alteration, normalized mass, products/functoriality, strict-support positivity and generic small points; the Moriwaki gap keeps the big hypothesis for the specialization limit. Acceptance remains conditional on these eight supplier contracts.

The requested mechanical dependency command returned exactly:

```text
depcheck: 182 roadmaps, 1199 edges, 0 problem(s)
```

Exit status was 0, with no UPWARD or CYCLE line. The read-only git diff statistic lists eleven changed files, all under packages/HeightsRationalPointsAndObstructionsPartII. Package input files were not edited during this pass. No Lean process or build was run, and no remote write was made.

### Source locator audit

All seventeen manifest entries were read. Fifteen legal cached texts were available; two entries remain settled uncertified. The following 128 distinct explicitly keyed line anchors in the README were located in their current extractions; nearby statement/proof passages were inspected, including the repaired and new-finding passages. This count is of resolved anchors, not 128 independent sources or full proof certifications. Additional unkeyed continuations and section locators were checked where needed, notably Yuan–Zhang §6.2.2 and Theorem5.3.3.

| Source | Distinct keyed anchors | Examples of the statement/normalization verified |
|---|---:|---|
| ggk-2026 | 35 | lines69,121,150,165: end theorems; 821: product grid; 1382: combining thresholds; 1790: isolation; 1823: interpolation. The package corrects the degree and packing bookkeeping discussed below. |
| yuan-2026 | 18 | lines110–135: introductory comparisons; 141: global-field theorem; 2175: potential bigness; 2745: integral bound; 3335/3417: geometric/arithmetic five-map thresholds. |
| dgh-2021 | 24 | lines38,95: end theorems; 767/917: intersection bounds; 1347/1397: escape/distance; 1517: large points; 1618: Northcott step. |
| gh-2019 | 7 | lines68/151: Bogomolov/height; 512: product structure; 2596/2603/2625: Moriwaki extension; 2688: bounded-degree torsion. Degree-one specialization normalization additionally checked at2447–2483. |
| xy-2022 | 23 | lines25/101: heights/specialness/end theorem; 268: flat intersection; 478/526/559/588: field descent; 626: pencils; 787: torsion class; 908/972/1023: final induction. |
| kuhne-2021 | 5 | lines119,242,269,322,330: equidistribution and curve uniformity; source hypotheses distinguish characteristic-zero curve counting from all-characteristic geometric results. |
| dky-2020 | 5 | lines41/53: torsion count/example;192: Bogomolov;2009: diagonal lift;2079: unbounded orders. Branch-count genus computation and degree-four kernel checked. |
| remond-2000-vojta | 1 | line187: Vojta theorem, with continuation to the second theorem and fixed embedding setting. |
| yamaki-2018 | 1 | line236: Theorem1.5, geometric trace and maximal nowhere-degenerate quotient. |
| masser-1996 | 2 | lines124/127: endomorphism specialization, read with the separate subgroup-specialization input. |
| dmy-2026 | 1 | line879: supporting product-grid discussion, not used to replace the primary GGK theorem. |
| david-philippon-2002 | 2 | lines115/183 and following theorem formulas: small-point counts and explicit principal-theta counting constant. |
| masser-1989 | 1 | line31: subgroup-specialization source entry; its Main Theorem/Scholium are the subgroup input, distinct from the 1996 endomorphism assertion. |
| yamaki-strict-support | 3 | lines104/1236/1327: reduction, strict-support dimension and equidistribution proof step; §§3.1–3.2 and §5.3 supply the additional contracts. |
| yuan-zhang-adelic | 0 explicitly keyed | §6.2.2, lines7503–7536: nondegeneracy/Betti curvature comparison; Theorem5.3.3, line6219: two-sided normalized minima inequality. |

No additional source was requested, and no settled uncertified entry was reopened. There was no instruction from untrusted material acted upon.

## Not verifiable

- Mechanical elaboration and the requested `#check @name` printout: the provided worker signature artifact reports a missing compiled Tau Ceti Albanese object. The brief prohibits builds. No Lean command was run; the binder audit above is static and does not certify elaboration at the pins.
- remond-2000-decompte and david-philippon-2007: settled uncertified sources. Their primary proof details could not be inspected. Their quoted results were compared with accessible GGK/DGH formulations and explicit examples; no request for either text is made.
- Supplier theorems and eight declared gaps are planning contracts, not implemented prerequisites. Resolving their target names/hypotheses and the merge direction does not certify future proofs or transitive suppliers' implementations. StableReductionPartII and ArakelovGeometryAndAbelianHeightsPartII were checked at their available board designs.
- The ownership audit covers the supplied sibling material, board packages, main and the roadmap tool's searchable heads. It is not a semantic proof of absence from every differently named statement, and no unlisted checkout was sought independently.
- Text extraction occasionally drops bars, indices or formula layout. Claims depending on a garbled formula were cross-checked against adjacent definitions and the package's explicit examples; a fresh page-image certification of every formula was not performed. In particular, absence of a new finding is not certification of every deep source proof.

## Source issues

- **Error** in yuan-2026 at Theorem1.1, p.5, line141, and §4.4.2, p.81: the source says a reference-field cutoff with additive one is uniform over arbitrary algebraic degree-one classes; it should be adjusted by the class's defining-field degree in function fields; affects a stated result.
- **Error** in yuan-2026 at Theorem4.19, p.101, line3417: the source says variation over the function field suffices; it should be variation over the constants in that branch, excluding constant families with dense height-zero points; affects a stated result.
- **Gap** in yuan-2026 at §4.4.3, p.84, lines2825–2830: the source says finitely many remaining characteristics follow from an omitted modification; it should be supplied with uniform constant-extension and degree arguments for each remaining characteristic; affects the proof.
- **Misprint** in ggk-2026 at Theorem1.3, p.192, line166: the source says both constants have subscript three; it should be subscripts three and four, as in the following inequality; affects nothing.
- **Misprint** in ggk-2026 at Proposition5.2, p.212, line1021: the source says the height threshold has one prime on one side; it should be double-primed consistently; affects nothing.
- **Error** in ggk-2026 at Proposition4.1 proof, p.211, line972: the source says pushforward exceptional degree retains the principal-polarization bound; it should be multiplied by (l/g!)^(2 dim X′), bounded by (l/g!)^(2(r−1)); affects the proof.
- **Misprint** in ggk-2026 at §7.1, p.221, line1473: the source says translated and untranslated subgroup intersections are equal sets; it should be a translation bijection giving equal cardinalities; affects the proof.
- **Error** in ggk-2026 at §7.1, equations(7.4)–(7.5), p.221, lines1501–1508: the source says each packing ball contributes only c₀ points; it should be c₀^(rank Γ+1), as required by its packing hypothesis; affects the proof.
- **Gap** in ggk-2026 at AppendixA.1, equation(A.1), p.227, lines1740–1751: the source says coordinate height-comparison constants are uniformly controlled by Faltings height after choosing sections; it should be an explicitly controlled embedding and addition-law choice; affects the proof.
- **Error** in ggk-2026 at PropositionA.3 proof, p.229, lines1817–1820: the source says dimension bounds make the full translate intersection equal at most dim X translates; it should be containment in a suitable bounded-degree proper intersection, with the enlarged degree estimate; affects the proof.
- **Misprint** in dgh-2021 at Proposition4.2 proof, p.17, line770: the source says the base cutoff is evaluated on the total-space point with reversed composition; it should be the total cutoff at P₀ equal to the base cutoff at π(P₀); affects nothing.
- **Gap** in dgh-2021 at Proposition4.3 proof, equation(4.13), p.21, line1034: the source says the monomial bound uses D′^(d−1) without a positive lower choice; it should be max(1,D′)^(d−1), or D′ chosen at least one; affects the proof.
- **Misprint** in gh-2019 at TheoremA.3, p.56, line2606: the source says the base height is evaluated on P in the abelian scheme; it should be evaluated on π(P); affects nothing.
- **Error** in xy-2022 at Proposition3.6 proof, p.16, line594: the source says intersection with K gives the claimed bijection for all algebraically closed intermediate fields; it should be restricted to conjugation-stable fields, with conjugate saturation for the minimal field; affects the proof.
- **Error** in xy-2022 at Proposition3.6 proof, p.16, line614: the source says the minimal ambient isogeny field determines specialness of X; it should be supplemented by descent of the translated subvariety over that field; affects the proof.
- **Misprint** in xy-2022 at Proposition3.1 proof, p.19, line725: the source says X is special over the field missing its minimal specialness field; it should be not special over that field; affects the proof.
- **Error** in xy-2022 at Lemma5.3, p.23, line908: the source says every X has a positive stabilization index with a strict dimension jump; it should be restricted to positive-dimensional X, since a singleton has dimension zero at every index; affects a stated result.
- **Gap** in xy-2022 at Proposition5.4, pp.25–26, lines972,996: the source says its conclusion covers every torsion point outside the jump locus; it should be restricted to prime-to-characteristic torsion for this proof, or supplemented for non-étale multisections; affects the proof.
- **Misprint** in xy-2022 at Proposition5.4 proof, p.26, line1013: the source says the torsion-cycle intermediate intersection already includes the numerical-equivalence factor a; it should be unscaled there, with a inserted only upon substituting the numerical class; affects the proof.
- **Misprint** in yamaki-strict-support at §5.3, p.26, lines1101–1104: the source says any positive multiplication integer characterizes a canonical metric; it should be an integer at least two, since multiplication by one imposes no metric constraint; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "d5859f5ed5301dfa784acc7eace066b385585fa1", "job": "RT-HeightsRationalPointsAndObstructionsPartII~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
