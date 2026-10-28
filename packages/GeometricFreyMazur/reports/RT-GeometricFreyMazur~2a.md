<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1184#issuecomment-6443219592 -->
Red team round 2 pass a (codex) of 444c965

Verdict: needs_changes

1. **F01** (P2) Conjugate Hecke branches need an unramified hypothesis for total reality

   **Location:** `packages/GeometricFreyMazur/README.md:609`: “whose smooth graph branches are totally real for the original product complex structure”; also the unqualified uses at lines 1508 and 1544.

   **Claim:** Every smooth graph branch of the compactified conjugate correspondence has no complex tangent line.

   **Witness:** The cyclic degree-two cusp branch has coordinates `(q,q²)`. Its conjugate is `(q,conj(q)²)`, a smooth graph with tangent `ℂ×{0}` at zero. At nonzero q its antiholomorphic derivative is nonzero.

   **Exact repair text:** “On the elliptic open, the smooth branches of T̄_m are graphs of antiholomorphic local biholomorphisms and are totally real. At ramified boundary branches a smooth real graph can have a complex tangent; no total-reality assertion is made there. No positive-dimensional complex analytic curve is contained in T̄_m: every branch meets the elliptic open, where total reality excludes it, and the boundary is finite.” Replace the two later global total-reality justifications by this no-complex-curve-containment statement. Add the Check: “For the degree-two cusp branch q₂=q₁², conjugation gives q₂=conj(q₁)². Its tangent at zero is the complex line ℂ×{0}; at q₁≠0 the graph is totally real.”

   **Retest:** At q=0 the corrected statement permits complex tangent dimension one; at q≠0, tangent vectors `(v,2conj(q)conj(v))` and their i-multiples can both belong to the tangent only when v=0. The finite boundary cannot contain a complex curve. The downstream noncontainment conclusion survives. The branch is supplied by the width-p q-chart in §1.8 and the degree-two branch z↦2z already tested there, so this is an instance of the actual correspondence, not an unrelated real surface.

2. **F02** (P3) Two surviving cached-source locators still point to page markers

   **Location:** `packages/GeometricFreyMazur/README.md:50`: “BT16 line 167”; `packages/GeometricFreyMazur/README.md:443`: “BT16 line 492”.

   **Claim:** These line anchors locate the normalization formulas and cusp-coordinate/Hecke enlargement assertions.

   **Witness:** BT16 line 167 and BT16 line 492 are page markers. The area/degree formulas are BT16 lines 169–193; the cusp-disc estimates and enlargement are BT16 lines 494–527.

   **Exact repair text:** At line 50 replace “BT16 line 167” by “BT16 lines 169–193”. At line 443 replace “BT16 line 492” by “BT16 lines 494–527”. Keep the printed-page locators.

   **Retest:** The first range gives a(r)=4πsinh²(r/2) and vol=2πDeg; the second contains q=exp(2πiz/p), the radius 2artanh(exp(−2πy/p)), and the +log m enlargement. At p=101,y=1/2 the stated upper radius is 4.163618.

3. **F03** (P3) Norm/divisor compatibility is attributed to the wrong supplier

   **Location:** `packages/GeometricFreyMazur/README.md:84`: “Layers 3–5 for divisors, norm/principal-divisor compatibility, Riemann–Roch and pencils”.

   **Claim:** AlgebraicCurves Layers 3–5 supply compatibility between field norms and pushforward of principal divisors, used in §6.2.

   **Witness:** `TauCetiRoadmap/AlgebraicCurves/README.md:475–652` has no norm/pushforward target; Layer 6 supplies conorm instead. `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4876–4888` supplies sectionNorm and lineBundleNorm_divisor for finite locally free maps.

   **Exact repair text:** “Use AlgebraicCurves Layers 3–5 for divisors, Riemann–Roch and pencils. Use SchemeAndStackFoundations §3.5, sectionNorm and lineBundleNorm_divisor, for norm/principal-divisor compatibility. The nonconstant finite map between smooth proper curves in §6.2 is finite locally free.” Add SchemeAndStackFoundations §3.5 to §6.2's Needs line. Keep the declared gonality comparison gap: it supplies the separate minimum-degree conclusion.

   **Retest:** For x=t² and a≠0, Norm(t−a)=a²−x. Both its divisor and the pushforward of [a]−[∞] equal [a²]−[∞]. This is pushforward, whereas conorm pulls [a²] back to [a]+[−a]. The corrected supplier is already earlier in the merge order.

## Earlier-finding verification

Each earlier finding was checked anew at this head. None was marked not actionable by the round-one repair report.

| Earlier finding | Status and repaired passage | Current witness |
|---|---|---|
| a F01, cusp-star tile count | **Repaired.** `packages/GeometricFreyMazur/README.md:405`: “2p incident triangles of Σ, each of angle π/p … fill 2p·π/p=2π”. | At p=7, fourteen angles total 2π; seven total π. BT16 lines 427–430 distinguish the triangle from the doubled fundamental domain. |
| a F02, surface gap hypotheses | **Repaired.** `packages/GeometricFreyMazur/README.md:78`: “for a smooth connected projective surface, extend §4.13 …”; the resolution and contraction clauses have their own hypotheses. | Smooth connected over an algebraically closed field is integral here. The nonreduced plane is not smooth; two disjoint planes are not connected. The identical scoped needs sentence occurs in the matching plan gap. |
| a F03, §3.4 and §6.3 Checks | **Repaired.** At line 633: “(1+i,−1+i) lies on it and (1+i,1+i) does not”; at line 973: “f the squaring map … φ(1)=φ(−1)”. | R(1+i)=−1+i, R²=id; two-factor R preserves the diagonal. Squaring has generic degree 2 and identifies 1,−1. The H₁ normalization is the j-line since Δ/G=X(1). S01 concerns another boundary branch, not these corrected Checks. |
| a F04, matrix-height locator | **Repaired.** `packages/GeometricFreyMazur/README.md:465`: “BT16 lines 533–534”. | BT16 lines 533–534 define the maximum entry absolute value; h(J)=1. |
| b F01, matrix-height Checks | **Repaired.** Lines 471–475 test J, an SL₂ inverse, diag(2,1), and the product bound. | h(J)=1, Frobenius/operator norms=2; h([[2,1],[1,1]])=h(inverse)=2; h(diag(2,1))=2 versus inverse height 1; h(J²)=2=2h(J)². |
| b F02, three locator slips | **Repaired.** Lines 465, 641, 865 and 1594 now use BT16 lines 533–534, 747, 1283 and 1330. | BT16 line 747 starts Remark 16; lines 1283–1292 give the Hecke metric comparison; lines 1330 onward start the shell estimate. These alternatives to the earlier suggested anchors locate the intended arguments. S02 records two different surviving marker anchors. |


## Computed statement register

“Retained” below means the listed instances did not refute the statement; it does not claim a proof of an asymptotic theorem. All numbered targets were read together with their API, proof route and Checks. Unless narrowed in the row, the context is p prime >5, algebraically closed characteristic-zero k, the specified connected component, and effective weighted cycles. Characteristic-p, zero-ring and empty-curve examples fail these explicit hypotheses. Zero cycles remain admitted and every linear estimate gives 0≤0. Distances between incompatible components are not assigned a finite value.

| Convention or definition | Instances and computed values | Result/change |
|---|---|---|
| Gonality, README:21 | k(t): degree of t=1, infimum=1; genus-one and hyperelliptic genus≥2: minimum=2; K=k: admissible set empty, natural infimum=0. | Empty-set junk excluded by FunctionField; retained. |
| Frame action, README:36 | g·(h·φ)=φh⁻¹g⁻¹=φ(gh)⁻¹; at p=7, det diag(1,3)=3 nonsquare, det(2I)=4 square. | Left action and component labels consistent with the supplier's right action via inversion. |
| Metric and current, README:38 | a(1)=4πsinh²(1/2)≈3.4122763; a(r)/r²→π; ddᶜlog|z²|² has mass 2, constant 1 gives 0; cycle 2[L] gives integral 2 when [L] gives 1. | Positive sign and 4π normalization retained. |
| Graph tube, README:38 | Matched-coordinate distance 3r/2 has midpoint distance 3r/4 in each factor; hence lies in the r-tube. | Threshold 2r, not r, retained. |
| Canonical degree, README:38 | For p=7, g_X=3, deg K_X=4; Δ⊂X² has Deg=8 and area=16π; a double parametrization gives 16 and 32π. | Sum metric and weighted degree agree. |
| Cyclic correspondence, README:40 | ψ(1)=1; ψ(4)=6 versus σ₁(4)=7; [p] on E[p] is 0, so it is not a torsion isomorphism. | m≥1 and p∤m retained. |
| Finite quotient comparison, README:122 | Sign quotient w=z² has local degree 2 and derivative 0; dual-number identity quotient retains nonzero ε with ε²=0; z↦z³ gives w↦w³ and both composites z⁶. | Three discriminating Checks; no étale or reduced replacement. |

| Target and README line | Instances tried; computed sides or invariants | Result/change |
|---|---|---|
| 0.1:146, projective frames | At p=7 there are 2 determinant-square components; PGL₂ has order 336, PSL₂ order 168; −I fixes a projective frame and is nonidentity on E. | Retained coarse/stack distinction; imported owner. |
| 0.2:164, quotient surface | Four product components modulo simultaneous exchange give 2 components; a generic selected-component fibre has 168 points at p=7, rather than 336. Trivial G gives X/G=X, including nilpotents. | Retained. |
| 0.3:198, CM signs | Gaussian automorphism i has square −1 on E, projective order 2; Lie eigenvalues i and −i distinguish the two signs, whereas projective classes alone identify scalar multiples. | Retained actual lifts and Lie character. |
| 0.4:232, singular bicusps | A width-p cusp has local rotation q↦ζ_pq, order p; two cusps with different order-p stabilizers have common stabilizer 1. | Retained equality-of-stabilizers condition. |
| 0.5:266, branch locus | Orders among 1,2,3,p: gcd(2,3)=gcd(2,p)=gcd(3,p)=1; equal types can intersect in 1 or that prime. The 4×4 cases exhaust the product types. | Retained CM+/CM−/SBC union. |
| 0.6:287, cyclic Hecke loci | m=1 gives diagonal and multiplier 1; m=4 gives 6, not 7; weight 2 doubles both cycle degree and pushforward degree. | Retained cyclic filter and generic degrees. |
| 1.1:327, compact triangle quotient | 1/2+1/3+1/7=41/42<1; triangle area π/42. At p=5 the sum is 31/30>1. U^p maps to identity in the compact triangle quotient. | p>5 prevents the spherical case. |
| 1.2:339, marked matrices | b(1−b)=sin²(π/p), so det U=cos²+sin²=1; eigenvalues exp(±iπ/p) give U^p=−I and projective order p. As p→∞, y_p/p→1/π. | Retained lift/projective distinction. |
| 1.3:373, upper-systole witness | p=7: [[8,21],[35,92]], det=736−735=1, trace=100=2p²+2. p=11: [[23,33],[154,221]], det=5083−5082=1, trace=244. | Both residue classes mod 3 covered; retained. |
| 1.4:389, filled cusped radius | det(I+pA)=1 implies tr A=−p det A; trace=2−p²det A. At p=7 the hyperbolic absolute-trace lower bound is 47, giving length ≥2 arcosh(47/2)≈7.69939; attaining it alone would not prove survival after filling. | Radius is half length; retained. |
| 1.5:403, cusp separation | At p=7 the cusp star has 14 triangles, angle π/7 each, sum 2π; 7 triangles give only π. | Prior repair verified. |
| 1.6:417, metric comparison | r=2: tanh²(1)≈0.580026, coth(1)≈1.313035; increasing r to infinity sends both comparison factors to 1. | h_Y dominates h_X; retained. |
| 1.7:429, compact injectivity radius | An outer radius (1/2)log p to inner radius (1/4)log p excursion and return costs ≥(1/2)log p. Length about 4log p allows only boundedly many such visits, not only one. | Retained repeated-visit proof route. |
| 1.8:443, q chart | p=101,y=1/2 gives q-radius exp(−π/101) and compact upper radius 4.163618; z↦2z gives q↦q², enlargement log 2. | Formula retained; S02 locator. |
| 2.1:465, entry height | h(J)=1 versus operator/Frobenius norm 2; h(J²)=2=2h(J)²; h(diag(2,1)⁻¹)=1≠2. | SL₂ inverse equality correctly scoped; prior repair verified. |
| 2.2:481, elliptic lift | Identity has displacement 0 and height 1; ±I are the same projective lift. δ=0 predicts bounded height, not height 0. | Retained O(p^(4δ)) and projective scalar ambiguity. |
| 2.3:495, nearby cusp lift | A cusp lift can be changed by its stabilizer without changing the cusp; identity representative has height 1. Bound is existence, not uniqueness of all representatives. | Retained. |
| 2.4:507, double coset | Left and right multiplication by cusp stabilizers leave the ordered cusp pair unchanged; a single representative versus its stabilizer translates gives the same double coset. For trivial stabilizers the coset has one element. | Both stabilizers retained. |
| 2.5:521, uniqueness at small scale | δ=1/16 gives p^(8δ)=p^(1/2)<p; δ=1/5 would give p^1.6>p. Coincident cusps have the full p-element stabilizer. | “Sufficiently small” and distinct-cusp hypotheses exclude both failures. |
| 2.6:535, cusp-ball lens | Centres distance 2D: midpoint has distance D to both; along their common geodesic the intersection of radius D+R balls has half-length R. | Radius R+C and positive R retained. |
| 2.7:547, cusp count | A cusp centre contributes exactly 1 at sufficiently small δ; a point outside all these balls contributes 0. Both satisfy count≤Cδ p^(24δ) for Cδ≥1. | Retained finite-box count, no algorithm. |
| 3.1:569, small intertwiner | A projective solution line over F_p has p+1 points; a nonzero quadratic determinant removes at most 2, leaving ≥p−1 invertible points. Uniqueness therefore forces projective dimension 0. | Retained rank-three kernel argument, signed determinant. |
| 3.2:581, CM rank lemma | Identical stabilizers have two-dimensional centralizer and are excluded by the distinct-point premise; Gaussian norm at (1,1) is 2, Eisenstein norm is 1. | Distinctness and CM type retained. |
| 3.3:595, CM+ repulsion | Multiplication by a+bi has degree a²+b²; 1+i gives 2. The Eisenstein unit 1+ζ₃ gives degree 1. | Type-specific norms retained; no CM− substitution. |
| 3.4:609, conjugate loci | R(1+i)=−1+i and R²=id; the diagonal's conjugate contains (1+i,−1+i). At the degree-two cusp, (q,bar(q)²) has complex tangent ℂ×0 at q=0. | S01; repaired earlier identity-branch Checks remain correct. |
| 3.5:641, Hecke excludes CM− | Opposite Gaussian characters differ by 2i, degree 4; on E[p] this is invertible for p>3. p=2 would kill the distinction. | Retained p>3 and p∤m. |
| 3.6:653, SBC repulsion | PGL₂(F₇) fixing 0,∞ has 6 elements; also fixing 1 leaves 1. If a²=−1 mod p, negative signed degree 1 describes the reflected cusp pair while ordinary degree is at least p−1. | Three points and both determinant signs retained. |
| 4.1:677, double diagonals | In S² (complex dimension 4), a graph of S has dimension 2/codimension 2; imposing T_m gives dimension 1. A doubled curve branch has doubled point multiplicity. | Point multiplicity, not divisor intersection, retained. |
| 4.2:715, quadratic centralizers | Q(i) contributes 4 norm-one integral units; Q(ζ₃) contributes 6; split rational norm-one integral units give ±1. A unipotent Jordan algebra is nonreduced and excluded. | Retained reduced algebra and O_A(log p). |
| 4.3:727, overlap alternatives | One tube gives overlap 1; a fixed curve in a small signed correspondence can meet all its associated tubes, so that exception cannot be removed. Ordinary and conjugate alternatives have equal signed index magnitude. | Retained both exceptional loci. |
| 4.4:739, rotation count | At d=0 all p rotations fix the centre. Away from it, sinh(D/2)=sinh d·abs(sin(θ/2)); θ=0 contributes 1 even for arbitrarily small R. | min(p,1+p sinh R/sinh d), with centre handled separately, retained. |
| 5.1:765, weighted canonical degree | p=7: one diagonal has Deg=8, two copies 16; a constant coordinate contributes 0. Areas are 16π and 32π. | Retained. |
| 5.2:781, CM+ decay | Choose δ₁=.001, δ₂=.01: exponents −.02 and −.997 are both negative; zero cycle gives 0≤0. | Retained independent scales. |
| 5.3:795, CM− decay | Tube ratio is sinh ε/sinh R; at ε=1,R=2 it is ≈.324027<1, whereas the reciprocal is >3. | Correct direction retained. |
| 5.4:807, SBC decay | δ₁=.001,δ₃=.01 gives −1−2δ₃+3δ₁=−1.017; 3δ₁=.003<.02. After the inertia p factor exponent remains −.017. | Retained three independent scales. |
| 5.5:821, cusped projection measure | Constant cusp coordinate contributes 0; for q=t^e, cusp density pulls back with the actual derivative and is integrable, with atom mass at t=0 equal to 0. Doubling cycle weight doubles the measure. | No infinity-times-zero convention; retained. |
| 5.6:853, area comparison | p=7: K-degree 4, cusps 24, area ratio (4+24)/4=7=1+6/(7−6); p=11: ratio 11/5=2.2. | Exact ratio retained; uniform C₀ can cover p≥7. |
| 5.7:865, Hecke metric transport | z↦2z preserves upper-half-plane metric: abs(2dz)/(2Im z)=abs(dz)/Im z. At q=0 its compact-chart derivative is 0. | Local isometry restricted to cusped open; S01 clarifies the conjugate boundary use. |
| 5.8:879, big-diagonal decay | T₁×T₁ gives normalized ratio 3p/(p−6), equal to 21 at p=7 and tending to 3. It violates a p^−η conclusion but fails the stated non-Hecke projection hypotheses. | Retained negative control; no new counterexample. |
| 6.1:903, symmetric power | n=1 gives Z; n=2 identifies (x,y),(y,x), retains 2[x]; along a smooth surface diagonal the normal quotient is ℂ²/{±1}, singular at 0. n=0 is excluded. | Scheme quotient, weights and singularity retained. |
| 6.2:937, image gonality | A degree-two B→D does not imply gon(D)=gon(B)/2: genus-one B→P¹ gives 1≤2. Identity gives equality; nonconstant image prevents degree 0. | Inequality and arbitrary generic degree retained. |
| 6.3:949, pencil cycle | For h=id on P¹ and f=t², φ(1)=φ(−1), generic degree 2; this f is not birational onto its image. For birational f, disjoint generic fibres remain disjoint cycles. | Prior repaired negative control retained. |
| 6.4:979, wreath cover | n=1 gives G; n=2 gives order 2|G|², not |G|². A disconnected pullback component has its own stabilizer H; its quotient is P¹. | Component normalization and stabilizer retained. |
| 6.5:1013, projected cycles | n=1,2,3: pair-degree sum is respectively 0,D,2D=(n−1)D. For T₁×{a} at p=7, projected degrees are 8,0. | Constants and non-Hecke hypothesis retained. |
| 7.1:1039, wreath branching | For n=2, (g,g⁻¹;(12)) fixes the graph y=gx; identity permutation reduces to slot stabilizers. For trivial G only the permutation diagonal remains. | Both branch mechanisms retained. |
| 7.2:1051, inertia | n=1 permits inertia 2,3,p, each divides 6p; without SBC orders divide 6. With n=2 the bound is 12p; faithful local inertia is cyclic, not all of a nonabelian point stabilizer. | Effective action and p>n retained. |
| 7.3:1063, ramification upper bound | e=1 gives e−1=0; e=p gives p−1≤p. Multiplicity 2 doubles each contribution. SBC exponent −1−η becomes −η after multiplication by p. | Retained. |
| 7.4:1075, Hurwitz contradiction | Degree-d cover of P¹ has 2g−2=−2d+Ram≤Ram; for t↦t², −2=−4+2. A largest projection yields ≥D/(2n), positive when D>0. | Upper bound, not false equality, retained. |
| 7.5:1089, bounded-gonality rigidity | N=1 permits no nonconstant curve because gon≥1; N=2 concerns gonality 1. Multiplying a parametrization degree multiplies both sides of the earlier inequalities. | Uniformity survives parametrization; retained. |
| 8.1:1113, spectral gonality | (21/100)(πD/3)/(8π)=7D/800. For D=1, lower bound .00875≤gon(P¹)=1. No discrete small eigenvalue means clipped gap 1/4≥21/100. | Retained constant and Friedrichs convention. |
| 8.2:1127, subgroup index | p=2: SL₂(F₂)=S₃ and A₃ index 2; p=3: Q₈ in SL₂(F₃) has index 3; p=5 Borel index 6≥5. Trivial subgroup index is p(p²−1). | All primes retained, no exceptional-prime shortcut. |
| 8.3:1141, full monodromy | N=2: p=227 fails 1600<1589; p=229 satisfies 1600<1603. A proper subgroup projecting onto PSL has index at most 2, contradicted by p>5. | Strict threshold and actual SL image retained. |
| 8.4:1155, scalar self-twist | Over F₅, ρ=diag(2,3), A=swap and χ=−1 give Aρ=χρA=[[0,3],[2,0]]; image is cyclic, not full SL. For full SL, transvections force scalar A and χ=1. | Surjectivity and invertibility retained. |
| 9.1:1179, classifying map | Legendre j(2)=1728, j(3)=21952/9 and j has a pole at 0; a determinant-3 torsion map at p=7 changes pairing class. | Nonconstant and nonsymplectic cases retained. |
| 9.2:1211, Hom lattice | For generator f of degree m, deg(2f)=4m, deg(−f)=m; automorphisms of a rank-one ℤ-lattice are ±1. Constant CM curves have larger endomorphism ring and are excluded. | Retained nonisotrivial condition. |
| 9.3:1225, Hecke factor | m=1 gives an isomorphism up to nonzero scalar on p-torsion; if p divides m, induced torsion map can have nonzero kernel. | p∤m and cyclic generator retained. |
| 9.4:1239, original-field descent | If σf=−f but f[p]=λΨ with λ≠0 and Ψ equivariant, then f[p]=−f[p], so 2f[p]=0; impossible for odd p and an isomorphism. At p=2 no contradiction. | Odd-prime hypothesis retained. |
| 9.5:1253, arbitrary k | Finite lists of coefficients generate a finite-type characteristic-zero model. If I⊗_k k′=0 under a field extension, faithful flatness gives I=0; extension degree/cardinality never enters. | No embedding of all k into ℂ assumed. |
| 9.6:1267, monodromy over k | Identity automorphism of E[p] is realized by identity Galois automorphism; a constant E has image 1 and cannot realize a nonidentity transvection of order p. | Constant j excluded; native Lean headline matches. |
| 9.7:1283, isogeny on original curve | Isogeny of degree m and dual compose to [m] in both orders; char 0 makes m invertible and kernel a subgroup of finite étale E[m]. Restriction to a smaller open agrees by uniqueness. | No base-cover substitution; retained. |
| 9.8:1297, function-field endpoint | E=E′, e=id gives identity isogeny of degree 1. For σ,P, Q=σP exists in p-torsion because pσP=σ(pP)=0, so the implication encoding equivariance is nonvacuous. | ∀N∃M before fields/curves retained. |
| 10.1:1325, genus consequence | For g<N, gon≤g+1≤N<N+1; g=0 and 1 have gonality 1 and 2. | Uses threshold at N+1; retained. |
| 10.2:1337, low-genus curves | Normalizations of rational and elliptic integral curves have gonality 1 and 2, both <3; a nodal rational image still has normalization genus 0. | Normalization, not arithmetic genus, retained. |
| 10.3:1351, cyclic resolution | 1/2(1,1) has exceptional self-intersection −2; 1/3(1,1) gives −3; 1/3(1,2) gives chain (−2,−2). | Coprime isolated charts and weighted intersections retained. |
| 10.4:1383, rational curves upstairs | Exceptional image has dimension 0; a nonexceptional curve maps birationally to its image off finitely many points, preserving normalization genus 0. | Exhausts the two cases; retained. |
| 10.5:1395, contractions | A curve with C²=−2 and C·E=1 becomes −1 after contracting E; −2+1²=−1. Each contraction lowers Picard number by 1; a nonnegative integer cannot decrease indefinitely. | Re-test transformed curves, not only initial −1 curves; retained. |

The following worked-example computations were also checked: the small-matrix witnesses in both residue classes mod 3; the signed determinant example det diag(1,−1)=−1; the independent-scale inequalities 3δ₁<2δ₃; and the ample-curve construction D∈|L⊠L| with deg L=d. It gives D·Γ_g=2d, Deg C=4d(2g_X−2), and sum of graph multiplicities divided by Deg C equal to 3p/(p−6). The latter is the negative control for §5.8, not a counterexample to its stated hypotheses.

For the point-ball worked estimate, h(s_t)=2log cosh(t/2), h′(s_t)=sinh²(t/2), ds_t/dt=2/sinh t, and h″(s_t)ds_t=(sinh t/2)dt. Thus the outer unit shell contributes a positive multiple of e^R, while the inner Green bound is O_n(1+r). On the line (z,z/2), with q=tanh²(r/2), V(r)/a(r)=1+(1−q)/(4−q): at q=1/4 it is 6/5 and at q=3/4 it is 14/13. It decreases, so the stronger discarded point-ball monotonicity is indeed false. Projection-shell summation retains the two nonconstant-coordinate contributions separately; constant coordinates have mass 0. Choosing B before δ with 2B>A+1 makes the displayed p^((A−2B)δ) factor decaying, with logarithmic losses absorbed after that strict margin.

## Lean signature and headline register

The supplied elaborated signatures were compared declaration by declaration with the complete 93-line file and the README. No Lean command was run: the review's explicit read-only/no-build instruction takes precedence over the generic request to elaborate a scratch file. No signature was changed. There are no implicit section variables to recover, no sorry-valued data, and no replaced mathematical condition hidden in a free Prop field.

| Declaration; section | Complete variable/instance context and comparison | Computed instances; disposition |
|---|---|---|
| gonality, Suggested.lean:42; conventions | k:Type u₁, K:Type u₂; Field k, Field K, Algebra k K. Body is the natural sInf over transcendental f with finite-dimensional extension and finrank=n. It deliberately does not require FunctionField, algebraic closure or characteristic zero. | k(t): 1; k/k: 0 from the empty set; genus-one/hyperelliptic models: 2. All four README Checks agree. Needed by both headlines, so keep. |
| full_monodromy, Suggested.lean:54; Layer 9 §9.6 | N:ℕ; k,K:Type u; Field k, IsAlgClosed k, CharZero k, Field K, Algebra k K, Algebra (RatFunc k) K, IsScalarTower k (RatFunc k) K, FunctionField k K; gonality<N; W with W.IsElliptic and j outside k; p prime, 5<p, 800N<7p. The local ZMod module is the actual torsion subgroup, and g is an additive automorphism with determinant 1. | N=0,1 admits no function field of the required gonality; N=2,p=229 passes 1600<1603. Identity g is realized by identity σ. Constant curves would fail for a nonidentity transvection, but fail the j premise. No missing binder, rank-zero escape or padding. |
| geometric_frey_mazur, Suggested.lean:75; Layer 9 §9.8 | ∀N∃M before k,K,W,W′,p,e. Same field/tower/function-field hypotheses; both curves elliptic and nonconstant-j; p prime>M. e is an actual additive equivalence of geometric p-torsion and the displayed graph condition enforces every Galois action. Conclusion is Nonempty of native TauCeti.Isogeny over K. | e=id,W=W′ produces degree-one identity. Q=σP is always in torsion, so the graph premise cannot be false for all Q. Additive maps are F_p-linear. M may absorb 5, avoiding p=2,3; no conclusion is assumed. Keep. |

The finite-dimensional determinant issue was checked against its real definition: the fallback is 1 when no finite basis exists, but E[p] over the algebraic closure in characteristic zero has dimension 2 under the supplied torsion interface. It is not a free module parameter. `Point.map` is the actual additive coordinate action. The native `Isogeny` pullback goes from the target coordinate ring to the source function field; its MapsInfinity condition requires source coordinates integral over that image, excluding constant pullbacks for elliptic curves. It is not a zero morphism masquerading as an isogeny.

| Headline family from the README | Acceptance-file coverage |
|---|---|
| Surviving compact witness and compact/filling-sensitive systole asymptotics (§§1.3–1.7) | Docstring lines 14–15 names the missing scalar-level modular curve, triangle quotient and compact metric. |
| Signed reconstruction and CM/bicusp repulsion (§§3.1–3.6) | Lines 16–17 name the missing framed points, strata and Hecke carriers. |
| Overlap dichotomy and big-diagonal decay (§4.3, §5.8) | Lines 18–19 name the fourfold, graph strata, tubes and weighted projections. |
| CM+, CM− and p-weighted SBC multiplicity decay (§§5.2–5.4) | Lines 20–21 name the missing analytic cycles, multiplicities and degrees. |
| Wreath ramification and complex bounded-gonality rigidity (§§7.3–7.5) | Lines 22–23 name the quotient surface, scheme symmetric powers and normalized pullback. Native Sym is only a multiset carrier. |
| Spectral modular gonality (§8.1) | Line 24 names the missing compact congruence-curve carrier. |
| Arbitrary-field geometric rigidity (§9.5) | Line 25 names the algebraic modular surface and Hecke loci. |
| Full actual torsion monodromy (§9.6, including the complex case §8.3) | Stated at line 54 with the correct strict bound. |
| Frey–Mazur over the original open curve (§9.7) | Lines 26–27 identify relative elliptic schemes and finite étale torsion-isomorphism carriers; no artificial family predicate is used. |
| Function-field Frey–Mazur (§9.8) | Stated at line 75, on the native isogeny carrier. |
| Bounded genus, low-genus images and minimal-model contractions (§§10.1–10.5) | Lines 28–30 name the surface, resolution, strict-transform and contraction carriers. |

Neither kept theorem follows by one library lemma or an elementary tactic. The subgroup-index and scalar-intertwiner auxiliary results remain in the README. No new native headline was found that should replace one of the explicitly deferred geometric families.

## Supplier and ownership register

Existing roadmaps were checked on content main. New supplier roadmaps were read at their current provided/service heads. Open revisions of existing roadmaps were not substituted for main. The following 12 supplier-roadmap groups cover 83 cited sections/layers (range endpoints expanded; AlgebraicCurves Layer 12 counted once); SchemeAndStackFoundations §3.5 was additionally checked for S03.

| Supplier and resolved sections | Witness and hypothesis comparison |
|---|---|
| ModularCurves 0D,0E,2C,5B,5C | README:375,386,735,1313,1357. Finite étale Galois objects and descent are supplied; both dual composites are [n]; determinant acts on pairing by its exponent. Strict full bases have N≥3; all uses have p>5. |
| ModularCurvesPartII 1.2–1.3,2.3,3.9,3.14,4.1,4.7–4.10,5.7,5.13,5.16,6.1,8.4–8.5,9.13 | Pointed lattice maps, μ_p×Z/2 polygon automorphisms, level torsors, both determinant components and cusp charts are explicit. complexConjugationComparison and genericBaseChangeAndLevelCompatibility exist. §9.13 uses C_(pd), cyclic filter gcd(a,b,d)=1 and multiplier ψ(m). The inverse-precomposition action converts its right-frame convention correctly; −1 inverts the pairing exponent but does not erase the residual stack inertia. |
| SchemeAndStackFoundations 0.8–0.9,0.11,1.17,3.2,4.11–4.13,5.1–5.3,5.9–5.10 | README:798,848,938,2624,4671,5528,5613,5643,6567,6653,6701,7129,7175. Projective quotient has Noetherian base and flat base change, preserving invariants; normalization is finite for these field-finite-type curves. Pushforward multiplies by generic degree and kills dimension drops. Hurwitz needs generic étaleness and is tame here. Bertini alone does not yet give the strengthened surface contract. S03 uses §3.5:4876. |
| AlgebraicCurves Layers 3–5,7,12 | README:475,527,571,719,1085. Divisors, RR, different, proper models and genus comparison have the requisite constant-field, smoothness and separability hypotheses. In characteristic zero the inseparability exceptions do not arise. Norm compatibility is the exception recorded in S03. |
| FuchsianOrbifolds Layers 0–5 | Effective projective action, cyclic chart u↦u^m, polygon/triangle areas, width-sensitive q charts, compactification and covering degree. Area π/3 for the modular orbifold agrees with §8.1; faithful local tangent characters give cyclic inertia on curves. |
| ComplexKahlerGeometry K3,K6.1 | README:296,1274. Finite-dimensional manifold/analytic-set theory and compact weighted analytic integration exist; K6.1:1290–1309 retains L¹ integrability and cutoff Stokes. Proper normalization, noncompact sublevels and singular cusp density transport are separately declared gaps. |
| RiemannianGeometry R7.0,R8 | README:1295,1404. Nonnegative Laplacian is −div grad; on S² the degree-one eigenvalue is 1(1+1)=2, area 4π. Singular Friedrichs cutoff/Li–Yau extension remains the declared gap. |
| ComplexComparisonPartII C−1.1–C−1.3,C1.9,C2.2,C4.1–C4.5,C5.4,C6.2 | Analytification retains nilpotents; étale-presentation quotients do not supply ramified finite-group quotients. CurrentCalculus, AnalyticCycleIntegration and lelongPoincareSection occur in C5.4. For f=z² the supplier current has mass 2, equal to the local convention. C6.2:4137 covers finite-type, including nonproper, schemes. |
| InverseGaloisAndArithmeticFundamentalGroups IG.0.3,IG.1.3,IG.3.1 | README:652,1265,2519. Finite lisse objects use the based Galois category; characteristic-zero algebraically closed extension invariance explicitly includes nonproper schemes. The punctured-curve theorem includes normalization and cycle-length ramification. |
| AbelianSchemesAndArithmeticModuli A1.6,A1.8,A3.1–A3.5,A3.7–A3.8,A6.1,A6.6–A6.7,A6.20,A6.25,A6.34 | Relative elliptic equivalence, generic extension over connected Dedekind bases, finite flat isogenies, full torsion schemes, actual pairings/frame torsors, degree and Hom lattices, Hom descent/extension and twists are present. For dimension one, [2] has degree 4; dimension-zero degree 1 is not used as an elliptic case. |
| NeronModelsAndSemistableAbelianVarieties 1.3,1.8 | README:728,871. Marked generic-fibre extension and abelian schemes as Néron models apply to the smooth original open curve. Uniqueness compares extensions and their restrictions. |
| CongruenceSpectralGap 5.3 | Provided head README:819. Every congruence subgroup has clipped Friedrichs gap ≥21/100 with curvature −1. There is no restriction to newforms, selected primes or a nonempty small discrete spectrum. |

Pinned declarations were read at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, matching the manifest and checkout heads. The 28 explicitly named library interfaces in the two supplier blocks resolve. Material definition checks include:

| Pinned file and declaration | Native meaning and computed control |
|---|---|
| Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Projective.lean:41,64,113,120; ProjectiveSpecialLinearGroup.lean:33 | GL/centre, equality iff an invertible scalar, and injective PSL→PGL. For F₇, orders 168 versus 336 show why injectivity is not an identification. |
| Mathlib/Analysis/Matrix/Normed.lean:87,106 | Scoped entrywise supremum norm, not a globally selected operator norm. The all-one 2×2 matrix has height 1 and operator norm 2. |
| Mathlib/GroupTheory/Index.lean:55 | Nat.card of cosets; infinite index would give 0. All index uses are finite; S₃/A₃ gives 2. |
| Mathlib/Data/Sym/Basic.lean:43,342,361 | Multisets of cardinality n and functorial map. [x,x] has cardinality 2; replacing it by a set gives 1 and is invalid. No scheme quotient is supplied. |
| Mathlib/NumberTheory/FunctionField.lean:58 | Finite dimensionality over RatFunc k; it does not itself insert the compatible k-tower. Both headline signatures explicitly retain that tower. |
| Mathlib/Algebra/Module/Torsion/Basic.lean:972,1010; Algebra/Module/ZMod.lean:81 | Actual subgroup annihilated by p and its ZMod module; an additive map sends pP=0 to p·eP=0 and is ZMod-linear. |
| Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean:823; LinearAlgebra/Determinant.lean:173 | Point.map is coordinatewise additive action; determinant defaults to 1 without a finite basis. The characteristic-zero elliptic p-torsion here has dimension 2. |
| Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:804; TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Transvection.lean:595 | Perfectness needs a≠0,a²≠1; at p=5 use a=2 with square 4. Transvection generation works over every field, including F₂ and F₃. |
| TauCeti/Analysis/Complex/RiemannSurface/Degree.lean:120,133,434; Ramification.lean:112 | FiniteHolomorphicMap includes two distinct values and finite fibres; degree multiplicativity also retains compact/connected/manifold hypotheses. z² followed by z³ has degree 6; local ramification of z² is 2−1=1. |
| TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean:72,139; Descent.lean:117; MulByInt/Hom.lean:63 | Genuine pointed coordinate pullback, fixed-conjugation descent under IsGalois (including infinite extensions), and deg(nf)=abs(n)²deg(f). n=0 gives 0=0; n=−2 gives 4deg(f). |

The metric proof also has native Schwarz–Pick inputs: TauCeti.PoincareDisc.dist_map_le in TauCeti/Analysis/Complex/Conformal/Poincare/SchwarzPick.lean:132 and TauCeti.norm_deriv_div_one_sub_norm_sq_le in TauCeti/Analysis/Complex/Conformal/SchwarzPick/Derivative.lean:106. The latter explicitly assumes a holomorphic self-map of the unit disc and an interior point; its denominators are positive. Multiplying both metric sides by 2 gives the curvature −1 normalization used here.

Object searches used the roadmap service and local main, Completed, board-package and provided-head files. Generic quotient ownership remains SchemeAndStackFoundations; modular carriers and cyclic boundary correspondences remain ModularCurvesPartII; currents remain ComplexComparisonPartII. The board's ModularCurvesPartIII design explicitly imports GeometricFreyMazur as an alias and adds no second owner. ArithmeticDynamics' dynatomic-gonality references do not own this modular quotient theorem. No other Suggested.lean found declares any of the three fully qualified GeometricFreyMazur names. Existing manifold symmetric powers in Tau Ceti are curve/manifold constructions, not the missing scheme symmetric power of this singular surface. K3SurfacesAndSymplecticBoundedness also requests surface-quotient resolution from SchemeAndStackFoundations; it does not provide the general Hirzebruch–Jung and contraction interface claimed here as a declared gap.

The specialized diagonal modular surface, signed strata, repulsion, multiplicity and rigidity constructions belong here: searches found their prerequisites under the named owners but no other owner of those specialized results. No target was moved upward and no later roadmap was introduced as a supplier.

## Declared-gap audit

All 11 slugs occur identically in the README and the top-level plan gaps; the needs sentences also agree exactly. Every gap names a supplier. These are accepted conditional contracts, not claims that the supplier has already proved them. Their outputs retain their individual hypotheses; no missing item below is raised merely because its implementation is absent.

| Gap slug | Precision/minimality check and computed boundary control |
|---|---|
| finite-group-quotient-analytification | Adds ramified quotient comparison beyond the étale-atlas interface. z↦z² has derivative 0 at 0; trivial action retains ε²=0 with ε≠0. |
| analytic-cycle-current-transport | Extends existing cycle integration to normalization, weighted transport and sublevel/cusp operations. Under a finite map of generic degree 2, a weight-3 branch pushes to weight 6; a constant projection pushes to 0. |
| hyperbolic-cycle-volume-comparisons | Fixes curvature, max distance, sum area, no ordinary diagonal component and weights. A coordinate disc has V=a(r), multiplicity 1; diagonal disc in D² has V=2a(r). |
| relative-point-ball-volume | States ∀n≥1∃C_n uniformly before C,r,R, including off-centre cycles. On (z,z/2) the stronger ratio falls from 6/5 to 14/13, so it is not silently demanded. |
| hyperbolic-trigonometry | Marked curvature −1 formulas and R≥1 lens bound are explicit. tr=3 gives length 2arcosh(3/2); rotation θ=0 gives displacement 0; at θ=π, sinh(D/2)=sinh d. |
| gonality-norm-and-base-change | Owns the minimum, pencil and extension-comparison conclusions missing from the existing model dictionary. Rational/genus-one values are 1/2, and a double cover of P¹ gives target 1≤source 2. Use the existing norm interface rather than rebuilding it (S03). |
| singular-metric-li-yau | Adds the actual singular Friedrichs domain and cutoffs. Round S² has λ=2, area 4π, gonality 1, so λArea=8π exactly. |
| free-locus-and-relative-cycle | Adds free-locus étaleness and a relative length-preserving cycle map, not the existing quotient itself. A free orbit of size n has fibre degree n; a length-two diagonal fibre maps to 2[z]. |
| curve-extension-and-normalization | Extends to a general proper target beyond the existing curve-to-curve dictionary. Identity on P¹ minus a point extends with degree 1; a nodal rational image has normalization genus 0. |
| cyclic-surface-resolution-and-contraction | Resolution, strengthened Bertini and contraction have separate explicit hypotheses. A double plane fails smoothness; two disjoint planes fail connectedness. Existing Bertini gives smoothness but not all listed transversality/avoidance conclusions. |
| surface-contraction-intersections | Adds cyclic resolution matrix and contraction update beyond the pairing itself. Chain [2,2] gives matrix [[−2,1],[1,−2]]; intersecting a contracted −1 curve once changes −2 to −1. |

## Verified sound

Read counts: **3/3 Lean declarations**, **66/66 numbered README targets**, all **1,639 README lines**, all **93 Lean lines**, and all **69 Checks blocks (165 bullet Checks)**. The statement register records concrete values and excluded cases for every numbered target; the Lean register records every variable and instance context. **6/6 earlier findings are repaired.** The two theorem signatures preserve all required binders; the single real-body definition is necessary to state them. No padding, sorry-valued data, forbidden option, extra import, placeholder proposition, admitted example or theorem named lemma occurs.

Citation counts: **59 distinct cached line anchors checked, covering 82 occurrences**: 57 locate the intended material, and S02 records the other two. Printed theorem/page locators were compared with those cached texts; corrections to faulty source mathematics are distinguished in Source issues below. **12 supplier roadmaps and 83 cited section/layer entries checked**, plus the replacement §3.5 in S03. The 28 explicitly named library interfaces resolve at the pins. Three source texts are available legally; BLR90's two locators remain uncertified as previously settled.

Dependency check output, run against the unmodified package with the requested name/order/movable arguments:

```text
depcheck: 149 roadmaps, 1017 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The proof directions were also read manually: §§0–5 feed the pencil and wreath argument, §§6–7 give geometric rigidity, §8 is an independent monodromy branch, §9 descends actual isogenies, and §10 consumes rigidity and the surface contracts. The original-base descent does not assume full monodromy and hence does not create a reverse dependency.

The diff from origin/main contains 9 files, 2,933 insertions and 1 deletion, all under packages/GeometricFreyMazur. README and Lean contain no pull-request numbers or review-process narrative. The plan differences concerning gaps preserve named ownership. No package source, manifest, merge-order or git state was changed by this review; only this report and scratch notes were written.

## Not verifiable

- BLR90 §1.2 Proposition 8, p.15, and §1.4 Proposition 2, p.19: settled uncertified/paywalled locators. They were not requested again. The named roadmap interfaces for their uses were checked independently.
- Fresh Lean elaboration: prohibited for this review. The supplied three elaborated signatures were inspected; no claim of a new build or proof check is made.
- The 11 declared supplier contracts remain implementation obligations. This review accepts their ownership/hypotheses conditionally; reading their text and testing boundary instances does not certify their eventual proofs.
- The finite examples do not independently prove uniform asymptotic estimates or every analytic cutoff/normalization construction. Their stated proof routes and supplied/gap prerequisites were audited; no computed numerical threshold is claimed.
- Ownership was checked against main, Completed, board packages and the supplied open-head material, using object searches. Identified supplier heads and the supplied sibling material were read as needed; this is not an exhaustive review of every open change.

## Source issues

- **Error** in BT16 at §2.2, printed p.715 (BT16 line 265): the source says projective full frames give a fine moduli space; it should be a coarse space, since inversion survives as an automorphism of each scalar frame; affects a stated result.
- **Misprint** in BT16 at §2.5, printed p.716 (BT16 line 329): the source says the auxiliary polygon's component variable lies in ℤ/n; it should be in ℤ/(pn), with target component reduced modulo p; affects a stated result.
- **Misprint** in BT16 at §2.5, printed p.717 (BT16 line 338): the source says the power map's p-gon component variable lies in ℤ/n; it should be in ℤ/p; affects a stated result.
- **Error** in BT16 at §2.5, printed p.717 (BT16 lines 339–346): the source says the displayed unfiltered divisor branches define a cyclic correspondence of degree σ₁(n); it should be filtered by cyclicity, with degree ψ(n), equal to 6 rather than 7 for n=4; affects a stated result.
- **Misprint** in BT16 at §3.1, printed p.718 (BT16 line 387): the source says the filling-sensitive radius equals the minimum admissible loop length; it should be half that length, consistently with the compact radius and Lemma 5; affects a stated result.
- **Gap** in BT16 at Lemma 5 proof, printed p.718 (BT16 lines 411–415): the source says its chosen trace witness establishes the bound after filling; it should be a surviving witness, because U(p)L(−p) becomes identity when peripheral pth powers are killed; affects the proof.
- **Misprint** in BT16 at Proposition 7 proof, printed p.720 (BT16 lines 463–464): the source says the cusped metric bounds the embedded disc's Kobayashi metric from below; it should be bounded above by that disc metric, giving the proposition's stated comparison; affects the proof.
- **Error** in BT16 at Corollary 8 proof, printed p.720 (BT16 lines 472–473): the source says a shortest compact loop has length at most 2log p and encounters at most one deep cusp; it should use length 4log p+O(1) and a bounded-number-of-deep-visits argument; affects the proof.
- **Misprint** in BT16 at Proposition 12(a) proof, printed p.724 (BT16 lines 637–638): the source says δ<1/4 makes an O(p^(8δ)) entry divisible by p vanish; it should require δ<1/8 with a strict margin before taking p large; affects the proof.
- **Misprint** in BT16 at Proposition 14 proof, printed p.725 (BT16 lines 688–698): the source says the Gaussian projective stabilizer has order four; it should have order two projectively, with an order-four SL lift; affects the proof.
- **Misprint** in BT16 at Proposition 14 proof, printed p.726 (BT16 lines 702–706): the source says the subgroup commuting with the elliptic element is its commutator subgroup; it should be its centralizer; affects the proof.
- **Error** in BT16 at Lemma 15 proof, printed p.726 (BT16 line 727): the source says every displayed elliptic lift satisfies t²=−1; it should distinguish t²=−1 from the order-three lift's t²+t+1=0; affects the proof.
- **Misprint** in BT16 at Proposition 14 proof, printed p.727 (BT16 lines 745–746): the source says both elliptic cases have the Gaussian norm a²+b²; it should use the Eisenstein norm a²−ab+b² for the chosen order-three generator; affects the proof.
- **Error** in BT16 at Proposition 14 and Remark 16, printed pp.725–727 (BT16 lines 681–685, 747–749): the source says the negative CM sign also lies on ordinary small Hecke curves and gives the stated repulsion; it should use conjugate Hecke loci and their relative-volume estimate; affects a stated result; corrected in print at BTE Proposition 2.1, p.2.
- **Misprint** in BT16 at Proposition 17 proof, printed p.727 (BT16 lines 763–764): the source says upper triangular integral determinant-one matrices are strictly upper triangular; it should say they are ±[[1,t],[0,1]], whose projective images are cusp rotations; affects the proof.
- **Error** in BT16 at Proposition 17, printed pp.727–728 (BT16 lines 751–803): the source says three close singular bicusps lie on an ordinary small-degree Hecke locus; it should allow either determinant sign and index absolute determinant; reflected cusp triples need not lie on any ordinary locus of that size; affects a stated result.
- **Error** in BT16 at Proposition 18(a), printed pp.728–730 (BT16 lines 814–825, 850–870): the source says rotation counts are bounded by pR/sinh d without a constant term; it should use min(p,1+Cp sinh R/sinh d), treating d=0 with count p; affects a stated result.
- **Misprint** in BT16 at Proposition 18 proof, printed p.730 (BT16 lines 876–882): the source says a p^(6δ) height cut enlarges a p^(16δ) height cut; it should use an exponent at least 16δ and adjust later smallness conditions; affects the proof.
- **Gap** in BT16 at Proposition 18(b) proof, printed p.731 (BT16 lines 904–916): the source says the reconstructed determinant can be used as a positive Hecke index and square-root scale; it should separate positive and negative determinant, using the conjugate locus in the latter case; affects the proof.
- **Misprint** in BT16 at Proposition 18 proof, printed p.731 (BT16 lines 917–918): the source says the cusped metric is smaller than the compact metric; it should be h_X≤h_Y, as Proposition 7 and the subsequent estimate require; affects the proof.
- **Gap** in BT16 at Lemma 22 proof, printed p.734 (BT16 lines 1051–1111): the source says the two strict-maximum regions account for the multiplicity term; it should also handle branches where the two potentials agree identically, for which both regions are empty but multiplicity can be positive; affects the proof.
- **Gap** in BT16 at Proposition 26 proof, printed p.737 (BT16 lines 1219–1222): the source says exponent −1+3δ establishes the required p-weighted smallness; it should obtain −1−η for some η>0 using separately chosen scales; affects the proof; corrected in print at BTE Proposition 4.2, p.4.
- **Error** in BT16 at Proposition 27, printed pp.737–738 (BT16 lines 1224–1228): the source says every curve outside the big diagonals has decaying normalized multiplicity; it should exclude Hecke projected cycles, since an ample-curve construction in T₁×T₁ has ratio 3p/(p−6); affects a stated result.
- **Gap** in BT16 at Proposition 27 proof, printed p.739 (BT16 lines 1330–1339): the source says the diagonal-tube proposition yields its point-ball shell estimate; it should supply a separate point-ball relative-volume theorem with the weights and projected measures retained; affects the proof.
- **Gap** in BT16 at Proposition 27 proof, printed p.740 (BT16 lines 1343–1345): the source says three-bicusp repulsion makes distinct enlarged balls disjoint outside ordinary small Hecke loci; it should bound overlapping projected balls using signed reconstruction and split the two projection measures before integration; affects the proof.
- **Misprint** in BT16 at §7 before Theorem 29, printed p.740 (BT16 line 1386): the source says the gonality inequality is strict because a generic curve attains its bound; it should say sharp: attaining the bound means equality; affects nothing.
- **Error** in BT16 at Theorem 29 proof, printed p.742 (BT16 lines 1448–1449): the source says negligible ramification gives an equality 2g(C)−2=o(Deg C); it should retain −2deg α in Hurwitz and infer only the upper bound 2g(C)−2≤o(Deg C); affects the proof.
- **Misprint** in BTE at Proposition 4.1 proof, printed p.3 (BTE lines 129–134): the source says the small-tube ratio is sinh(R)/sinh(ε); it should be sinh(ε)/sinh(R), consistent with the preceding monotonicity theorem; affects the proof.
- **Gap** in BTE at Proposition 4.2 proof, printed p.4 (BTE lines 143–145): the source says an ordinary-Hecke partition covers the relevant bicusps via Proposition 17; it should include the conjugate-Hecke part supplied by signed reconstruction; affects the proof.
- **Gap** in BTE at Proposition 4.2 proof, printed p.4 (BTE lines 155–168): the source says containing tubes bound the sum of overlapping ball volumes without multiplicity cost; it should retain the p^(O(δ₃)) overlap bound and choose δ₃ small before p; affects the proof.
- **Error** in BTE at §5, printed p.4 (BTE line 172): the source says all other published assertions and proofs remain correct; it should also qualify Propositions 17 and 27 and repair the filling-witness and repeated-cusp arguments; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "444c965c8ffaa987f103998ce6162c3f3ba5b2db", "job": "RT-GeometricFreyMazur~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
