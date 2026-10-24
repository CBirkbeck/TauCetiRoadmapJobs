# TropicalAndBerkovichArithmetic repair report

The first four finding sections refer to review r2a; the last refers to review r2b. Their findings do not overlap. All five are applied. Reviews and source texts were treated as evidence, not instructions.

## F01 (P1) — applied

r2a: §0.28’s construction of normalization, uniqueness and the Hausdorff quotient → import DiamondsAndVStacks §D5.13 and construct only the homeomorphism for the specified uniform-unit norm. Updated scope, native coarsening inventory, supplier contracts and Layer 0 dependencies. Added reciprocal-exponent, inverse-unit and rank-two Checks. Evidence: supplier §D5.13; kedlaya-liu line 1563.

## F02 (P1) — applied

r2a: constructing strict analytic gluing and the taut-adic equivalence → import ClassicalAdicEtaleCohomology §3.1 and identify its category with §0.21’s strict Hausdorff specialization. Updated scope, supplier inventory, §§0.21–0.22, §0.30 and Layer 0 dependencies. Retained general analytic extensions and boundary-sensitive comparisons. Evidence: supplier §3.1; zavyalov line 4022, line 4033 and line 4087.

## F03 (P3) — applied

r2a: generic skeleton/retraction laws repeated as Checks → concrete P¹ singleton, twice-punctured line and Tate-circle Checks in §2.2, and residue-ball, annular-radius and refinement Checks in §2.7. Replaced the additional generic edge-interior Check with the radius √r. No Lean declarations added. Evidence: bpr-structure line 383, line 402 and line 412.

## F04 (P3) — applied

r2a: document identifiers and generic destinations → exact Sturmfels–Tevelev and DKY locators and consuming sections. The same generic destination pattern was repaired in seven other manifest entries; the corrigendum now has an actual theorem/equation locator. Existing keys, versions, hashes and access statuses remain. Evidence: sturmfels-tevelev line 49, line 312; dky line 468, line 881.

## F01 (P2) — applied

r2b: analytic extended tropicalization inside an earlier algebraic supplier gap → retain only algebraic supply, and construct the analytic map in §4.1. Added monoid charts, topology, face gluing, properness, surjectivity, orbit-stratum functoriality and three Checks; updated §§5.2, 5.6, scope, manifest and Lean’s missing-carrier explanation. Evidence: bpr-metrics line 664–679; AnalyticToricGeometry scope and Layer 0.

## Mathematical evidence and extent of repairs

The r2b formula is made precise as homomorphisms of additive monoids preserving zero, with the order topology on ℝ∪{+∞}. Without the zero law, the constant-∞ function would be an invalid extra point. The nonempty-fan hypothesis on the dense torus statement is explicit. The statement retains trivially valued and nonclosed fields: BPR states its result in the algebraically closed nontrivially valued setting (bpr-metrics line 657); the README gives a weighted Gauss lift and an arbitrary-radius affinoid compactness argument for the generalization. It does not claim that BPR itself states this greater generality.

For w on a chart monoid S, the elements with finite w form a face. Quotienting K[S] by the other monomials gives the orbit closure containing the lift. On this face, w extends to its group completion and the weighted Gauss norm is multiplicative. Thus max |a_u|exp(−w(u)) is a unital multiplicative seminorm extending K, including when K has trivial valuation. Coordinatewise compact bounds give bounded-radius affinoids containing inverse images of compact sets. Monoid relation loci are closed in finite products of ℝ∪{+∞}; the fan intersection law gives Hausdorff gluing. Compact neighborhood refinements inside charts justify global properness. No finite-presentation assertion about tilted valuation-ring algebras is used.

The §0.28 comparison uses c=ρ(z), s=log(1/2)/log(c) and t=1/s. Since 0<c<1, both logarithmic denominators are nonzero and both exponents are positive. The uniform-unit identity fixes every spectral value of z at c. The formula in kedlaya-liu line 1565–1569 selects the dominated representative of a continuous rank-one valuation; the new proof uses it only for the specified norm, then transports the earlier quotient. Raising a nonarchimedean seminorm to an exponent greater than one is legitimate because the ultrametric inequality is preserved.

The source-manifest pattern repair additionally changes `cited_for` for favre-corrigendum (§3.3), kedlaya-liu-ii (§0.27), baker-norine (§3.5), berkovich-integration (§7.6), fresnel-matignon (§§5.3–5.6), bosch-lutkebohmert (§§2.10, 2.19, 5.3) and de-shalit (§7.7). The bpr-metrics entry also gains §4.2, p. 14 and consumer §4.1. Favre’s quantitative correction is located at favre-corrigendum line 9–23; the roadmap’s Laplacian sign is unchanged. No source key was duplicated and no new source was needed.

## Computed adversarial pass

Each numbered target has a row; additional constructions and conventions have separate rows. Definition/API bundles use the same instances to exercise their laws. The table records calculations, not deductions from a successful `sorry` elaboration. “Retain” means no counterexample in these tests, not a proof or independent acceptance. All altered statements, their proof inputs and their downstream examples were recomputed.

| Statement | Instances and computed values on both sides | Result; change |
| --- | --- | --- |
| Unit/norm convention | Ordinary ℝ: norm(1)=1; doubled norm: norm(1)=2>1; zero ring: norm(1)=0. | Normalized adapter distinguishes these; retain. |
| Natural-log lengths | Over ℚ₃, v₃(3)=1 while −log|3|=log 3; uv=3² has length 2 log 3. | Same positive scale in Layers 1, 2, 6 and 7; retain. |
| Laplacian/curvature convention | On [0,2], f(s)=s gives divPL=δ₀−δ₂, Δ=δ₂−δ₀, curvature change δ₀−δ₂. | Opposite signs agree with each use; retain. |
| Arithmetic integration coordinate | For endpoints 1,3, Δv₃=1 and Δ(−log|·|)=log 3; branch change c·v₃ adds c. | Real length is not a Cp period; retain. |
| §0.1 spectrum | ℝ² projection at (2,3) gives 2 or 3; at 0,1 gives 0,1. Max norm on (1,0),(0,1) multiplies to 1 but their product has norm 0. | Correct points, excluded maximum; retain. |
| §0.2 bounded/dominated | For real abs, bound C=2 tends to 2^(1/n)=1 in the power trick. The power abs^(1/2) gives 1/2>1/4 at 1/4. | Boundedness cannot admit the wrong exponent; retain. |
| §0.3 topology | Integer path has coordinates (2^t,3^t); t=0 gives (1,1), t=1 gives (2,3). For t<1, sup_m(m−m^t)=∞. | Pointwise continuity differs from uniform continuity on all coordinates; retain. |
| §0.4 evaluation embedding | The two product projections give 2≠3 at (2,3); matching every coordinate gives matching underlying seminorm functions. | Injectivity, not a quotient of powers; retain. |
| §0.5 image equations | Zero function has value 0≠1 at 1; product max norm gives 0≠1 on the multiplication test above. | Both wrong models excluded; retain. |
| §0.6 closed image | On an idempotent, spectral coordinate z satisfies z²=z, hence z=0 or 1. A zero coordinate remains allowed. | Non-strict bounds retain kernel points; retain. |
| §0.7 compactness | ℝ² gives two points; zero ring gives ∅, also compact. | No nonemptiness hypothesis inserted; retain. |
| §0.7 completion comparison | ℚ→ℝ evaluates 3/2 as 3/2 on both sides. Zero ring gives ∅→∅. ℤ is already complete and p_t(2)=2^t is unchanged. | Evaluation condition and noncomplete range agree; retain. |
| §0.8 Hausdorffness | Product projection values 2 and 3 lie in disjoint intervals separated at 5/2. | Pinned topological theorem applies; retain in README only. |
| §0.9 pullback | First projection followed by identity evaluates (2,3) as 2 both directly and by two pullbacks; second projection gives 3. | Contravariant composition and identity agree; retain. |
| §0.10 norm point | At 0,3,1/3 in ℝ, values are 0,3,1/3; product of last two is 1. | Native multiplicative absolute value; retain. |
| §0.11 singleton field spectrum | Bounds p(3)≤3 and p(1/3)≤1/3 imply 1/p(3)≤1/3, hence p(3)≥3. | Both inequalities force equality; retain. |
| §0.12 Banach category | Initial ℤ maps 3 with bound norm(3)≤3; trivial norm on ℤ would demand 3≤1 in ℝ. Zero ring spectrum is ∅. | Specified seminorm matters; retain. |
| §0.13 nonemptiness | ℚ has abs; trivial 𝔽₂ has values 0,1. Zero ring has norm(1)=0≠1. | Noncomplete and trivial field cases included; retain. |
| §0.14 units/spectral radius | In ℝ², (2,3) is a unit with positive values 2,3; (1,0) is not and has a zero value. Nilpotent ε has radius 0. Zero ring has IsUnit(0) and vacuous positivity both true. | Both directions, nilpotents and empty spectrum agree; retain. |
| §0.15 residue fields | At T=a, kernel (T−a) gives H=K. At a Gauss point the residue field is κ(T), of transcendence degree 1 rather than 0. | Quotient before fractions is necessary; retain. |
| §0.16 colimits | ℂ⊗_ℝℂ≅ℂ×ℂ gives two points over one compatible pair. A contractive identity tensor has 1⊗1 of norm 1. | Surjectivity does not imply injectivity; retain gaps. |
| §0.17 affinoid quotients | Radius r gives norm(T)=r; quotient by T gives norm(a)=|a|. Zero variables give K. | Weighted norm and scalar normalization agree; retain. |
| §0.18 base change | K→K gives identity on each evaluation. Inseparable T^p=a has one geometric support point with length p. | Surjective point map does not assert geometric reducedness; retain. |
| §0.19 rational domains | (g,f)=(1,T) gives |T|≤r; (0,0) gives 0≤0 everywhere but its quotient leaves a free variable. | Unit-ideal hypothesis excludes invalid datum; retain. |
| §0.20 sheaf/descent | Cover U,U gives equalizer {(a,a)} and difference (a,b)↦b−a; empty overlap contributes 0. | Exactness and empty restrictions agree; retain. |
| §0.21 analytic atlases | A single chart gives M(A) and the same bounded maps in each strict presentation. Doubled-origin gluing has two origins, versus one in an affinoid chart. | Import strict Hausdorff specialization; retain wider carrier. |
| §0.22 analytification | Spec K gives one point; on A¹ the Gauss seminorm takes T to 1 and has kernel 0, unlike evaluation at 0. | Analytic points extend beyond rational points; retain. |
| §0.22 proper GAGA | Spec K has H⁰=K and Hⁱ=0 for i>0; P¹ has H⁰(O)=K, H¹(O)=0. On A¹/ℚ₃, coefficients 3^(n²) have nth-root norms 3^(−n)→0, giving nonpolynomial entire functions. | Strict route now imports the existing equivalence; properness still discriminates. |
| §0.23 hybrid | For t², |t²|^(log r/log|t|)=r², including the central value; t^(−1) gives r^(−1). | No inverse sign or extra scale; retain. |
| §0.24 uniform representation | Nilpotent ε evaluates 0 everywhere; bounded tuple (1,1,…) has sup 1 whereas (1,2,…) has infinite sup. | Spectral kernel and bounded-product restriction discriminate; retain. |
| §0.25 idempotents | ℝ² has (0,0),(1,0),(0,1),(1,1); their value-one loci are the four subsets of two points. Zero ring has one idempotent and one clopen. | Unique value-one classification matches Lean; retain. |
| §0.26 archimedean fields | Norm abs^(1/2) on ℝ gives norm(2)=√2 and α=1/2; α=2 would give 4>1+1. ℚ₂ has norm(2)=1/2 and is excluded. | Exponent interval and archimedean hypothesis agree; retain. |
| §0.27 hierarchy/gauge | Weighted norm of z^n is r^n(1+|n|); its nth root tends to r. Radius(z)radius(z⁻¹)=1 while norm(z)norm(z⁻¹)=4. | Uniform spectral unit need not be multiplicative for the original norm; retain. |
| §0.27 characteristic-p boundary | For small-scalar valuation k>0 the two power estimates would give (1+nk)²≤C² for every n; lhs→∞. | No bounded analytic scalar map for that norm; retain. |
| §0.28 comparison definition | On ℚ₃, s=log 2/log 3≈0.63093, t≈1.58496, st=1; (1/3)^s=1/2 and (1/2)^t=1/3. | Both inverse laws tested; replace duplicated ownership. |
| §0.28 zero/inverse evaluations | 0^s=0, 0^t=0; 3^s=2 and 2^t=3. | Positive exponents work on zeros and inverse units. |
| §0.28 transported quotient | Gauss rank-one point and its rank-two specialization both give normalized values T↦1, 3↦1/2; after transport, T↦1, 3↦1/3. | Distinct Spa points have equal image; import quotient. |
| §0.28 pseudouniformizer change | Replacing z=3 by z′=9 sends supplied value β(9)=1/4 to 1/2 by exponent 1/2; inverse rescaling returns specified |9|=1/9. | Same specified-norm point after either normalization. |
| §0.28 general rational comparison | In ℤ_p((T)), |T|=r<1. Datum (T,1) forces 1≤r^n for all n, so separated quotient is 0; (1,T) returns A. | Banach-ring extension survives imported quotient; retain. |
| §0.29 traces/localization | Closed-disc trace |T|≤r includes ζ(0,r); |T|>r excludes it. It is closed, with nearby values r+ε outside. | Rational traces are not asserted open; retain. |
| §0.30 strict carrier comparison | M(K) has one point in both categories; identity has no boundary. M(K⟨T⟩) has the same Gauss point, with |T|=1, in both. | Category identified by identical charts; import equivalence. |
| §0.30 morphisms | Closed disc structure map is quasi-smooth, boundary {Gauss}. Radius-|a| closed subdisc inclusion has boundary ζ(0,|a|) and is quasi-étale, not étale. | Partial-properness upgrade not applied to these boundary examples. |
| §0.31 real quotient | Doubled disc has two distinct origins with inseparable neighborhoods; separated disc has one. | Global Hausdorff conclusion retains tautness; retain. |
| §0.32 residue detection | Zero map to nonzero A leaves a one-dimensional H(x)-fiber; identity gives dimension 0 cokernel. Projection ℝ²→ℝ omits the other spectral point. | Finite cokernel and faithfulness hypotheses discriminate; retain. |
| §1.1 Gauss points | ζ(0,0)(T)=0, ζ(0,1)(T)=1; ζ(0,1)=ζ(1,1) because |1−0|=1. | Zero radius and nonunique centers agree; retain. |
| §1.2 point types | Type II has residue transcendence increment 1, value-rank increment 0; type III reverses these to 0,1. A nested empty-disc family cannot have radii→0 by completeness. | Types remain disjoint; retain. |
| §1.3 tree distance | For radii 1/9 and 1/3, distance is log 3; along 1/9→1/3→1, two distances add to 2 log 3. | Natural-log path metric; retain. |
| §1.4 connectedness | Proper genus-zero global functions K have only idempotents 0,1; deleting 0,∞ leaves the connected real-line skeleton of G_m. | Endpoint removal agrees with GAGA route; retain. |
| §1.5 annular skeleton | Annulus 1/9<|T|<1 has length 2 log 3. T↦a/T maps radii to |a| and 9|a|, ratio 9. | Reflection preserves length; retain. |
| §1.6 slopes | T² gives slope 2; T−a gives min(s,v(a)) with slopes 1,0 at the breakpoint. | Invertibility hypothesis excludes breakpoint; retain. |
| §1.7 virtual annuli | Quadratic nonsquare-unit example has two geometric components of length L and normalized length L/2. End swap s↦L−s has quotient (0,L/2]. | Component count and folded end retained. |
| §2.1 vertex sets | G_m with a Gauss vertex has two distinct puncture balls; placing two punctures in one residue ball violates the separation condition. | Finite decomposition is adapted to marks; retain. |
| §2.2 skeleton | P¹ gives {ζ(0,1)}; G_m gives ℝ with 0 at +∞ and ∞ at −∞ in its closure; Tate q=3 gives a circle of length log 3. | Three concrete Checks replace generic laws. |
| §2.3 component boundaries | One open ball has one attachment; an ordinary annulus between distinct vertices has two; punctured ball adds one classical limit endpoint. | Boundary counts distinguish cases; retain. |
| §2.4 complementary balls | Off-skeleton ball at annular radius 1/3 has boundary ζ(0,1/3) and no interval of skeleton in it. | Attachment is unique; retain. |
| §2.5 closure | Proper P¹ skeleton singleton is compact; removing one puncture gives a ray [0,∞) with one new endpoint in its closure. | Compactness iff properness and endpoint closure agree; retain. |
| §2.6 disc criterion | A ball-interior point has a small disc disjoint from V; a vertex belongs to V and cannot lie in such a disjoint neighborhood. | Both membership directions discriminate; retain. |
| §2.7 retraction | Classical 0,1 on P¹ both map to ζ(0,1). In A(1/9,1), a=3 maps to ζ(0,1/3), coordinate log 3. | Distinct balls and an interior radius instantiated. |
| §2.7 refinement | For w=ζ(0,1/9), fine τ(w)=w, coarse τ(w)=ζ(0,1). Between these vertices ζ(0,1/3) is fixed at log 3, not rounded to 0 or 2 log 3. | Generic and repeated Checks repaired. |
| §2.8 continuity | Skeleton points at coordinates 1/n have images 1/n→0; points in each attached ball map to its attachment coordinate. | Star neighborhoods retain vertex, not just edge, continuity; retain. |
| §2.9 connectedness | Good reduction gives one point; Tate reduction gives a connected circle of length log 3. | Both arise as connected retraction images; retain. |
| §2.10 reduction | Good reduction requires degree-1 base extension; node uv=3² has positive length 2 log 3. | No replacement by only unramified or DVR input; retain. |
| §2.11 dual graph | A self-node contributes one loop and two flags; two nodes between two components give E=2,V=2,b₁=1. | Simple graphs would lose the cycle; retain. |
| §2.12 genus/descent | Good-reduction genus 2: 0+2=2. Tate: 1+0=1. Resolving uv=π³ adds two vertices and two edges, so E−V+1 unchanged. | Genus and subdivision agree; retain. |
| §2.13 refinement/base change | Split edge length 2 log 3 into log 3+log 3; fine then coarse sends w to the same coarse attachment as direct coarse τ. | New retraction Check agrees with composition law; retain. |
| §2.14 existence | P¹ admits one Gauss vertex; adding ζ(0,1/9) gives two vertices joined by length 2 log 3. | Genus zero not excluded; retain. |
| §2.15 marked rays | P¹ minus two marks has two rays; a single mark gives one. Each classical endpoint is at infinite path distance, outside Xᵃⁿ. | Agrees with new §2.2 example; retain. |
| §2.16 triangulations/nodes | Annular interior valency 2, genus 0 gives no node; good-reduction elliptic vertex has genus 1 and is a node. Doubled origin has two origins and fails separatedness. | Stable genus and separation hypotheses discriminate; retain. |
| §2.17 formal automorphisms | Identity fixes every component point; u↔v on uv=a swaps two branches but preserves the component-point set. | Set preservation, not pointwise branch fixing; retain. |
| §2.18 strong deformation | At a skeleton point x, H(x,0)=H(x,1)=x; an attached ball point ends at its boundary of radius 1/3. | New radius Check agrees with endpoint τ; retain. |
| §2.19 contractions | Two distinct adjacent edges of lengths log 3 and log 3 become length 2 log 3. One loop has two flags but one edge. | Self-loop exception excludes accidental contraction; retain. |
| §2.20 minimal skeleton | Tate has χ=0 and circle skeleton; P¹ has χ=2 and lies outside the target. | Boundary χ=0 retained. |
| §2.21 stable vertices | Genus-2 vertex of valence 0 gives 2g_v−2+val=2; rational trivalent vertex gives 1. | Positive genus cannot be omitted; retain. |
| §2.22 minimal uniqueness | Two choices of vertex on a Tate loop differ as one-point sets but give the same circle of length L. | Unique skeleton is not unique vertex set; retain. |
| §2.23 stable uniqueness | Good-reduction genus 2 has χ=−2; Tate genus 1 has χ=0 and permits moving the chosen vertex. | Strict χ<0 is needed; retain. |
| §3.1 graphs | Loop: E=V=1,b₁=1,val=2. Two parallel edges: E=V=2,b₁=1. | New circle example respects graph carrier; retain. |
| §3.2 divisors/rank | On a tree r(2P)=2; on a circle r(P)=0. Interval coordinate has divPL=δ₀−δ_L of degree 0. | Rank is not degree; retain. |
| §3.3 Laplacian | On [0,2], Δ(s²/2)=−ds+2δ₂, total mass −2+2=0; ∫sΔs=2=∫1²ds. | Density, atoms and energy signs agree; retain. |
| §3.3 weak domain | Cantor primitive F has F(0)=0,F(1)=1/2, ΔF=δ₁−μ_C with mass 1−1=0. | Singular-continuous derivative is included only in weak domain; retain. |
| §3.4 Jacobian | Tree: H₁=0, Jac=0; length-L circle: period L and Jac=ℝ/Lℤ; bridge derivative 0. | Length pairing and contractions agree; retain. |
| §3.5 graph RR | Tree D=0: r(0)−r(K)=0−(−1)=1=0+1−0. Circle D=P: 0−(−1)=1=1+1−1. | Both low-genus cases agree; retain. |
| §3.6 specialization | P−Q in one ball maps to v−v=0; a closed point of degree 2 gives two geometric chips counting multiplicity. | Degree and coarsening preserved; retain. |
| §3.7 slope formula | For T, outgoing slope toward 0 is +1, toward ∞ is −1; compact specialization gives δ₀−δ_∞. | Matches τ_*div(T), not its negative; retain. |
| §3.8 metrized complex | One elliptic residue component has r(P)=0; forgetting it gives a point graph with r(P)=1. A loop needs two distinct marks. | Curve data are essential; retain. |
| §3.9 rank determination | Genus-zero component requires 1 selected point, genus-one requires 2. Subdividing a self-loop gives two distinct edges and a loopless model. | Cardinality and loopless assumptions retained. |
| §3.9 reduced representatives/continuity | Elliptic degree-2 classes have several effective representatives but one residue equivalence class; on a tree, moving a degree-1 chip to s gives reduced graph part s. | No choice of continuous residue representatives claimed; retain. |
| §3.10 complex RR | One elliptic component D=0: 0−0=0=1−1; rational component: 0−(−1)=1=1−0. | Total genus is used correctly; retain. |
| §3.11 rank inequality | Good-reduction elliptic curve with D=P has ranks 0 on X, 0 on the complex and 1 on the point graph. | 0≤0≤1 checks direction; retain. |
| §4.1 torus map | T² gives 2w; T=a gives w=v(a). Trivial-base G_m still has Gauss weights at every real w. | Existing map unchanged. |
| §4.1 extended chart/zero law | For S=ℕ, w(0)=0 and w(1)=∞ gives the origin; constant ∞ has w(0)=∞≠0 and is excluded. For S=ℤ, w(u)+w(−u)=0 forces finite values. | Precise monoid definition excludes wrong model. |
| §4.1 Gauss lift/general field | Trivial 𝔽₂ with w=√2 gives |T|=exp(−√2), |T²|=exp(−2√2); constant 1 has value 1. At w=∞, T has value 0. | Covers irrational, trivial-valuation, characteristic-2 and boundary cases. |
| §4.1 face inclusion/gluing | ℝ is the open finite locus in ℝ∪{∞}; in P¹ the overlap coordinates satisfy w′=−w. | Face inclusion has the stated direction; glue at finite values. |
| §4.1 properness/surjectivity | A¹ target [a,+∞] has inverse closed disc |T|≤exp(−a), compact; torus [a,b] gives exp(−b)≤|T|≤exp(−a), compact annulus. | Correct compact-preimage notion; no completeness-of-fan requirement. |
| §4.1 orbit strata/density | In A¹ the ray stratum is ℝ/ℝ=0, one endpoint; finite n→+∞ tends to it. For a ray in ℝ² the stratum is ℝ²/ℝe₁≅ℝ. | No endpoints in the missing second direction. |
| §4.1 toric functoriality | T↦T² sends w↦2w and ∞↦∞; T↦T⁻¹ sends finite w↦−w on the torus. At the A¹ origin, the former remains the origin. | No undefined 0·∞ operation is needed. |
| §4.1 fans | Rank-zero zero-cone fan gives Spec K and one tropical point. Empty fan gives ∅ on both sides. P¹ fan gives compact [−∞,+∞], with 0↦+∞, ∞↦−∞. | Dense torus statement restricted to nonempty fans. |
| §4.2 initial degenerations | T−a gives initial length 1; (T−a)² gives 2. Trivial-base G_m after realizing √2 still reduces to G_m, not ∅. | Nilpotents and non-value-group weights retained. |
| §4.2 Gröbner/local-star input | Tropical line vertex has three primitive rays whose sum is (0,0); an edge-interior star has directions u,−u summing 0. | Valued local-star route agrees; retain. |
| §4.3 fundamental theorem | Trivial-base G_m has analytic Trop=ℝ but rational-point valuations {0}. Empty closed subscheme has no initial points and Trop=∅. | General-valued analytic definition retained. |
| §4.4 weights/balancing | (1,0)+(0,1)+(−1,−1)=(0,0); doubling only the last weight gives (−1,−1)≠0. | Primitive directions and weights matter; retain. |
| §4.5 relative multiplicities | In characteristic p, T^p=a gives length p times reduction degree 1, total p; reduced map T↦T^p gives length 1 times degree p, total p. | No dropped or doubled inseparable factor; retain. |
| §4.6 multiplicity formula | Two annuli with factors 2,3 contribute 2+3=5; a contracted annulus contributes 0. | Sum, not number of preimages; retain. |
| §4.7 expansion | Slopes (−2,4) give gcd 2; (0,0) gives 0; (2,1) gives 1. | Signs and constant edges agree; retain. |
| §4.8 pushforward | T↦T² has δm=2·1=2 and index [ℤ:2ℤ]=2. In characteristic 2 the same inseparable degree is 2. | Target/image index direction and full degree agree; retain. |
| §5.1 canonical lift | y²=1+x at irrational (α,0), p≠2, gives two initial components, hence multiplicity 2. For G_m a singleton can also lift to ζ(1,r), but only its Gauss lift has positive relative multiplicity. | All-point hypothesis and distinguished lift remain; retain. |
| §5.2 faithful predicate | T² expands length L to 2L; two edges mapping to the same primitive interval each have factor 1 but fail injectivity. | Definition now uses the extended map; both conditions retained. |
| §5.3 separating functions | Adding T to T² gives vector (2,1) with gcd 1 instead of 2. Residue constants 0 and 1 on meeting components do not agree at their node. | Lifting must keep node compatibility; retain. |
| §5.3 annular approximation | On inner radius r, error <r≤|T| preserves the leading term. T+c with r<|c|<1 instead has a zero at −c. | Quantified closeness is needed; existing route retained. |
| §5.4 finite graph | s↦(s,2s) is injective with primitive vector (1,2), so length L remains L in lattice length. | Extended map restricts to the same torus map; retain. |
| §5.5 domination | Positive integral factors with e₁e₂=1 give e₁=e₂=1; graph (ι,f) projects to ι at every point. | Integral functoriality supplied locally by §4.1; retain. |
| §5.6 marked rays | Pole orders 5 and 6 have gcd 1; 4 and 6 have gcd 2. At a puncture the pole coordinates have v→−∞ and converge in the toric boundary charts. | Extended tropicalization now supplies the missing domain; retain ray theorem. |
| §6.1 model metric | L² frame value 1/9 gives L-norm 1/3; tensor square gives 1/9 again. | Tensor denominator and frame changes agree; retain. |
| §6.2 measures | Degree 6 on L² gives weight 6/2=3; component multiplicity 2 and degree 3 gives weight 6. Good-reduction degree d gives mass d. | Denominators and multiplicities retained; supplier gaps remain. |
| §6.3 positivity | Component degrees −1,2 total 1 but fail semipositivity; difference of masses 1 and 2 has mass −1. | Integrable curvature need not be positive; retain. |
| §6.4 local heights | Constant potential c on degree d changes local height by cd; zero potential changes it by 0. | Sign is positive for exp(−c) metric change; retain. |
| §6.4 density | On Spec K all continuous functions are constants; rational multiples of γ=v(π)>0 approximate √2γ. | Nontrivial valuation supplies dense rational constants; retain. |
| §6.4 arbitrary-base measure limits | Every model measure evaluates constant 1 as d, so the limiting functional also gives d. Potentials n⁻¹sin(n²s) tend uniformly to 0 but have second derivatives of size n³. | Mass fixed; arbitrary signed convergence excluded; retain. |
| §6.5 Hsia/self-energy | For ζ(0,1),ζ(0,1/9), E(ρ,ρ)=log 9; E(ρ,−ρ)=−log 9. Self-diameter at ζ(0,1/9) is 1/9, not 0. | Positivity only on diagonal; retain source-error qualifications. |
| §6.5 general-field extension | The same radial segment has length log 9 over every field realizing radii 1,1/9, and the slope-square integral is log 9. | Coefficients and diagonal convention do not change; retain. |
| §6.6 Green/admissible | Point graph genus g>0 gives μ_a=δ_v. Circle length L gives ds/L, mass 1. Three parallel unit edges have deleted-edge resistance 1/2, density 1/3 each, total 1. | Genus-zero division excluded; retain. |
| §6.6 Radon Poisson | Cantor primitive gives δ₁−μ_C with total 0; δ₁ alone has total 1 and cannot be a Laplacian. Point graph has only the zero mass-zero measure. | Weak domain required; retain. |
| §6.7 rank-one approximation | On length √2, slope 1/2 up to 2√2−2 and slope 1 thereafter give integral 1. Lengths 1,√2 cannot both be made rational by scaling. | Real edge lengths retained; no discrete replacement. |
| §6.7 curvature identity | Subdivided affine slopes 1,1 give interior flux 1−1=0; −Δs=δ₀−δ_L. Quadratic Δ has total variation 2L. | Endpoint flux and sign preserved; retain. |
| §6.8 admissible correction | Genus-1 vertex plus loop gives total g=2, K=2v, μ_a=(δ_v+ds/L)/2. At L=2, corrected midpoint/vertex norm ratio exp(L/8)=exp(1/4). | One natural-log scale, not an extra factor c; retain. |
| §7.1 Tate quotient | q=3 gives L=log 3>0. Multiplication by q adds L to −log|z| and fixes its class. q=0 has no inverse; |q|=1 gives L=0 and is excluded. | New skeleton Check agrees with quotient circle; retain. |
| §7.2 calibration | Integrating s²/(2L)−s/2+L/12 over [0,L] gives 0. Derivative jumps by −1, so Δg=δ₀−ds/L and corrected curvature ds/L. | Sign, mass and mean agree; retain. |
| §7.3 Schottky | diag(q,1) gives |det|=|q|<1=|1+q|². Unipotent translation has equal eigenvalue norms 1 and is not loxodromic. | No division by 2; characteristic-2 boundary included. |
| §7.4 Mumford | Rank 1 gives a circle with b₁=1; rank 0 has empty limit hull and is handled separately, with genus-zero quotient. | Skeleton formula keeps g≥1; retain. |
| §7.5 Jacobian periods | Tate period q has tropical period L and pairing L, giving ℝ/Lℤ. Good-reduction genus 2 has toric rank 0 but Jacobian dimension 2. | Tropical and analytic dimensions distinguished; retain gaps. |
| §7.6 path integral | Zero form and constant path give 0; ∫d(T²)=Q²−P². A Tate loop gives Log(q), not necessarily 0. | Exact-form identity does not erase path periods; retain. |
| §7.6 primitive continuation | Two primitives of dT differ by a constant; d(T²) has loop period 0 whereas dT/T on the Tate cover has period Log(q). | Closed-form continuation is a required input; retain. |
| §7.7 residues/branch | dt/t has residue 1, p·dt/t residue p even though reduction is 0. Reversal t↦a/t changes it to −1; end sum 1−1=0. | Analytic coefficients and oriented sum retained. |
| §7.8 BC−Ab correction | Changing lift z to qz adds Log(q) to BC and adds (Log(q)/v(q))v(q)=Log(q) to its correction. Stars with d=0,1,2 have bounds 0,0,1. | Descent, sign and zero-ended exception agree; retain. |

## Ownership, locators and signatures

The supplier comparisons were read through the roadmap service at their heads: DiamondsAndVStacks §D5.13 and ClassicalAdicEtaleCohomology §3.1 explicitly own the constructions identified by r2a. AnalyticToricGeometry was read on main: its scope is finite regular complex toric geometry and excludes general analytification. Its Layer 0 algebraic supply is retained, with the existing arbitrary-field gap. No supplier is asked to consume this roadmap’s analytification. This package owns the missing extended tropicalization because it is the analytic extension of its existing §4.1, used by its existing Layer 5.

Object searches used `roadmaps grep` and `roadmaps show`, main roadmaps, board README/Lean files and all 34 explicitly supplied sibling folders (68 README/Lean files). Searches covered extended tropicalization, orbit tropicalization, normalized spectra, rank-one Hausdorff quotients and strict analytic atlases. They found the two earlier owners and no additional owner of the new analytic map in the supplied sibling folders or board packages. No other open checkout was independently sought. The existing absolute-valued, tensor, intersection and Raynaud prerequisites remain eight explicit supplier gaps; this round does not claim to settle their implementation.

Every cross-roadmap citation was resolved again. The relevant main sections are AdicSpaces §0.4 and Layers 2–3; AdicSpacesPartII §§R0.7, R0.18 and R1.3; AdicSpacesPartIII §§R2.2–R2.3, R3.7 and R3.9; PerfectoidSpaces §P1.12; RestrictedPowerSeries §§0.1, 1.1, 2.1; PadicFunctionalAnalysis §0.4; RigidAnalyticGeometry Layer 5; SchemeAndStackFoundations §§3.3, 4.12, 5.2–5.3 and 5.9; AlgebraicCurves Layer 4; EllipticCurves Layer 4; StableReduction Layers 1, 2 and 7. The service heads resolve ColemanIntegration §§L0.11, L0.22, L0.23 and L1.20, AnabelianGeometryAndNonabelianChabauty §5.8, EffectiveDiophantineMethods §4.3 and NeronModelsAndSemistableAbelianVarieties §§3.13–3.14 and 4.3–4.4. ColemanIntegrationPartII §§3.1 and 4.0 were checked in the supplied head. Main rather than an open revision was used where a roadmap exists on main.

The citation resolver reported no missing roadmap citation or Lean name, but explicitly did not inspect library names outside TauCetiRoadmap because it had no pinned Lake packages configured. Those were checked directly in the specified pins. In particular, Mathlib/Analysis/Normed/Unbundled/RingSeminorm.lean:61 defines the native seminorm through additive seminorm and unital multiplicative zero-preserving data; it includes neither domination, completeness nor nonemptiness. Its extensionality is at line 305. TauCeti/AlgebraicGeometry/AdicSpace/Spa/Analytic.lean:165 supplies the support-preserving coarsening existence; uniqueness and normalization are supplier additions. The old resolver leads `Huber.GelfandSpectrum`, `GelfandSpectrum.compactSpace_nonempty`, `GelfandSpectrum.smoothingFun_eq_sSup` and `ValuationSpectrum.exists_amalgamation` are roadmap targets at AdicSpacesPartIII §R3.9 and AdicSpacesPartII §R0.7, not claims of pinned declarations. The two own-name leads are actually declared in this package’s Lean file.

Changed source passages were read in the legal cached copies: kedlaya-liu line 1484, line 1538 and line 1563; temkin line 995, line 1017, line 1065 and line 1566; zavyalov line 4022, line 4033, line 4038 and line 4087; bpr-structure line 383, line 402 and line 412; bpr-metrics line 657 and line 664; sturmfels-tevelev line 49, line 312, line 316, line 356 and line 376; dky line 468 and line 881. Published DKY §2.7 was also located in the legal publisher extraction. Berkovich-spectral remains waived; fresnel-matignon and both Huber works remain uncertified and are cited by their settled locators. None was requested again.

The headline inventory remains six statable acceptance theorems: completion comparison, noncomplete compactness, noncomplete nonemptiness, the general Banach unit criterion, clopen/idempotent classification and complete archimedean-field classification. All have honest `sorry` bodies. The missing-carrier docstring now also explicitly names extended tropicalization and the missing toric analytification/extended tropical-space carriers. It gains no stand-in definition or extra theorem.

The scratch signature probe appended `#check @name` for all nine declarations to the actual acceptance file and elaborated it once. Each elaborated type was compared with the README:

| Declaration | Elaborated context and comparison | Computed truth test |
| --- | --- | --- |
| Spectrum | A, NormedCommRing; native dominated subtype only. | Zero ring would force 0=1 in ℝ; field norm gives a point. |
| Spectrum.eval | A, NormedCommRing, spectrum point and element. | Projection values at (2,3) are 2,3. |
| Spectrum.topology | A, NormedCommRing; induced evaluation topology. | Integer path has coordinates 2^t,3^t as above. |
| Spectrum.completion_comparison | A, NormedCommRing; homeomorphism with evaluation condition; no completeness assumption. | 3/2 evaluates as 3/2 before and after completion. |
| Spectrum.compactSpace | A, NormedCommRing; no nontriviality or completeness. | Two-point product spectrum and empty spectrum are compact. |
| Spectrum.nonempty | A, NormedCommRing, NormOneClass. | Trivial 𝔽₂ has one point; zero ring violates norm(1)=1. |
| Spectrum.isUnit_iff | A, NormedCommRing, CompleteSpace, norm(1)≤1, a. | In ℝ², (2,3) passes both sides and (1,0) fails both. |
| Spectrum.existsUnique_idempotent_of_isClopen | Same ring/completeness/unit binders, U and IsClopen U. | Singleton first-projection locus selects (1,0); empty locus selects (0,0). |
| archimedean_field_classification | K, NormedField, CompleteSpace, 1<norm(2). | Snowflake real norm gives unique α=1/2. |

No binder was lost; no declaration type, name or README generality needed changing. The Lean edit is confined to the module docstring. Checks and local comparison APIs remain prose.

## Mechanical checks and maintainer notes

- Required elaboration, from the pinned content checkout, of `packages/TropicalAndBerkovichArithmetic/Suggested.lean`: **exit 0**, no errors; exactly six `declaration uses 'sorry'` warnings at lines 51, 58, 63, 68, 74 and 83, column 8. The file imports only Mathlib, so no TauCeti object build was required.
- The one scratch `#check @name` run: **exit 0**, the same six warnings and all nine types displayed; context comparison is above.
- Required dependency command, with the supplied order, package name and `--movable`: **exit 0**, exact output below. No UPWARD, CYCLE or moved line.

```text
depcheck: 36 roadmaps, 338 edges, 0 problem(s)
```

- `git diff --check`: **exit 0**, empty output.
- TOML/JSON parsing and manifest/gap checks: **pass**; 34 unique work keys; all eight gap needs/supplier/section tuples match their README lines verbatim. Only the first gap’s `needs` changed in the plan; the plan has no other top-level data and no other gap changed.
- Gate repair, `readme-ids-missing=1`: the unqualified supplier name `nonempty_t2Quotient_spa_homeomorph` → `TauCetiRoadmap.DiamondsAndVStacks.nonempty_t2Quotient_spa_homeomorph` in the exact supplier contract. The namespace and theorem were verified in `TauCetiRoadmap/DiamondsAndVStacks/Suggested.lean`, lines 32 and 394–398. The scanner had matched the unqualified name to this package’s `Spectrum.nonempty`; the qualified reference identifies the actual owner. No mathematical statement or Lean declaration changed.
- After that qualification, the installed worker’s identifier check returned **exit 0**, with exact output `readme-ids-missing=0` and `missing identifiers: []`. Required Lean elaboration and dependency checking were rerun: both **exit 0**, with the same six warnings and exact dependency output shown above; no UPWARD or CYCLE line. `git diff --check` again returned **exit 0**, empty output. The six supplied citation leads were resolved as described above; none warrants deleting a valid target or pretending a roadmap target is a pinned API.

The only edited files are `packages/TropicalAndBerkovichArithmetic/README.md`, `packages/TropicalAndBerkovichArithmetic/Suggested.lean`, `packages/TropicalAndBerkovichArithmetic/sources.toml`, the top-level gaps list in `packages/TropicalAndBerkovichArithmetic/design/plan.json`, and this report. Metadata, tooling, merge order and other roadmaps were not edited. No commit or external write was made.

No Lean name or section locator cited by another roadmap changed. Earlier suppliers retain their constructions; consumers retain the same §0.28, §0.30 and §4.1 entry points. The general-field toric-scheme gap now requests algebra only. The new mathematical targets remain unproved roadmap obligations; these edits and successful elaboration do not constitute independent acceptance.
