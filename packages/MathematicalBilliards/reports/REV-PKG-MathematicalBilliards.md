<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13476#issuecomment-6789576159 -->
Review (codex) of d2ef99a

Verdict: needs_changes

1. **F01** (P2) The summary promises a differentiable twist map at C¹ regularity

   **Location:** `packages/MathematicalBilliards/README.md:3`: “For a strictly convex table of class `C^k` (`k ≥ 1`, curvature allowed to vanish)” and “an exact area-preserving monotone twist map”.

   **Claim:** The summary includes C¹ tables in the monotone-twist conclusion. Section 4.1, line 290, defines that conclusion to require a C¹ diffeomorphism.

   **Witness:** The circle–ellipse table at line 114 has curvature limits 1 and 4. At its diameter state, L = 2 and sin δ = sin δ₁ = 1; line 191 gives derivative limits 1 and 7.

   **Repair:** Separate the regularity conclusions in the summary: every C¹ table has the homeomorphic closed-cylinder extension and positive **topological** twist; assert the differentiable monotone twist, exactness and the stated measure-preservation target for k ≥ 2, matching §§2.2, 3.3 and 4.3. This excludes the exhibited nondifferentiable map from the differentiable claim while retaining it in the topological claim. Keep its computed derivative jump as a negative control.

2. **F02** (P2) Complement invariance needs a homeomorphism

   **Location:** `packages/MathematicalBilliards/README.md:372`: “when `f` preserves each end … both components are `f`-invariant”. Section 5.1 introduces f only as a self-map.

   **Claim:** Setwise invariance of the essential curve and preservation of the ends imply invariance of both complementary regions.

   **Witness:** On the annulus with y ∈ (−1,1), let f(x,y) = (x,h(y)), interpolating h through (−1,−1), (−1/2,1/2), (0,0), (1,1). Ends and C = {y=0} are preserved; a lower point maps above C.

   **Repair:** Require f to be an end-preserving homeomorphism in this API bullet, retaining the arbitrary-self-map definition of an invariant curve. Add the displayed continuous, noninjective map as the negative control. It has h(−1/2) = h(1/2) = 1/2, so the repaired hypothesis excludes it. The billiard and twist-map applications already have the required homeomorphisms.

3. **F03** (P2) Zero period admits nonperiodic configurations

   **Location:** `packages/MathematicalBilliards/Suggested.lean:221` and `packages/MathematicalBilliards/README.md:473`: the definition takes arbitrary natural p,q and imposes `s (j + q) = s j + p * ℓ`, without q > 0.

   **Claim:** These data are periodic billiard configurations of type (p,q). The convention at README line 28 explicitly requires q ≥ 1.

   **Witness:** For the unit circle, set sⱼ = jπ√2 and p=q=0. The period equation is sⱼ=sⱼ, gaps are π√2∈(0,2π), and both tangent components equal cos(π/√2). Rotation number 1/√2 is irrational.

   **Repair:** Include `0 < q` in `ConvexTable.IsPeriodicConfiguration`, and update its README definition and docstring. No extra p restrictions are needed in the predicate: with positive q the strict gaps already force 0<p<q. Add the zero-period irrational configuration as a negative control. The corrected predicate rejects it by 0<0; the triangle (1,3) and diameter (1,2) still satisfy it. A scratch Lean example independently elaborated the original defect: any sequence satisfying just the gap and reflection conditions satisfies `T.IsPeriodicConfiguration 0 0 s`.

4. **F04** (P2) The native Wiener headline is absent from the acceptance test

   **Location:** `packages/MathematicalBilliards/README.md:3`: “Wiener's lemma on `ℝ`”; its full target is at line 857. `packages/MathematicalBilliards/Suggested.lean:239` contains the other Layer 12 headline statements but no Wiener theorem; the unavailable-headlines list at lines 28–42 does not mention it.

   **Claim:** The acceptance test states the summary's statable deep results.

   **Witness:** The full §12.4 signature below elaborated at the pins with only its sorry warning, using `import Mathlib` and no new definition. It is absent from the acceptance test.

   **Repair:** Add the full theorem, with an appropriate name and docstring, in the roadmap namespace and README order:

   ```lean
   open MeasureTheory Filter Topology
   theorem wiener_line (σ : Measure ℝ) [IsFiniteMeasure σ] :
       Tendsto (fun T : ℝ => T⁻¹ * ∫ t in (0 : ℝ)..T, ‖charFun σ t‖ ^ 2)
         atTop (𝓝 (∑' ξ : ℝ, (σ.real {ξ}) ^ 2)) := by
     sorry
   ```

   Mention its name in the README and the module's stated-headlines list. The sum over all real numbers expresses the sum over atoms, since the other terms vanish. Test measures 0, δ₀ and (δ₀+δ₁)/2 give limits and sums 0, 1 and 1/2 respectively. Do not replace the theorem with one of those checks.

5. **F05** (P3) Three definitions lack the required API bullet lists

   **Location:** `packages/MathematicalBilliards/README.md:140`, `:244`, `:564`: “Represent an oriented line”, “Define `L(s, s₁)`”, and “Define the trajectory”.

   **Claim:** Each definition has its API as bullets. These three sections have prose claims and Checks, but no API bullet list, unlike the other definition sections.

   **Witness:** Between headings 1.4/1.5, 3.1/3.2, and 7.3/Examples, the only lists are Checks; the defining/API assertions are single paragraphs.

   **Repair:** Retain the mathematical content and reorganize its API into explicit bullets: oriented-line representation/reversal and entry-state equivalence; chord regularity/equivariance and first/mixed derivatives; trajectory domain, reflection continuation and finite-reflection/corner bounds. Keep hypotheses and locators attached to the assertions. The existing discriminating computations remain valid: (−1,0) for the horizontal inward line, L₁₂=sin δ/(2R)>0 for the circle, and corner bounds 2,2,1 at π/2,2π/3,3π/2.

6. **F06** (P3) The constant-eigenfunction Check includes zero

   **Location:** `packages/MathematicalBilliards/README.md:884`: “A constant function is an eigenfunction with eigenvalue `0`”.

   **Claim:** Every constant function is an eigenfunction. The definition at line 819 requires it not to be almost everywhere zero; line 879 explicitly excludes the zero function.

   **Witness:** On the one-point probability space f=0 satisfies 0=exp(2πiat)·0 for every a,t, but its nonzero-a.e. requirement is false. The constant f=1 is an eigenfunction at a=0.

   **Repair:** Say “A nonzero constant function is an eigenfunction with eigenvalue 0 and is permitted by the criterion; the zero function satisfies every eigenfunction equation but is not an eigenfunction.” This tests both cases and agrees with the Lean theorem, which deliberately quantifies over zero as well as nonzero functions.

7. **F07** (P3) The infinite-measure Koopman Check has no discriminating value

   **Location:** `packages/MathematicalBilliards/README.md:853`: “For `ℝ` acting on itself by translation with an infinite measure the statement is not claimed”.

   **Claim:** This is the third discriminating Check for the Koopman group. It specifies no measure, computes no outcome, and only repeats a scope boundary.

   **Witness:** Lebesgue measure is infinite and translations are strongly continuous on L². Counting measure on the same Borel ℝ gives ‖Uₜ1_{0}−1_{0}‖₂=√2 for every t≠0, and 0 at t=0.

   **Repair:** Replace the bullet with the counting-measure counterexample, specifying the Borel σ-algebra and Uₜf(x)=f(x+t). Then Uₜ1_{0}=1_{−t}; the computed jump proves failure of strong continuity outside the finite-measure hypotheses. Keep the identity and character checks as the two positive cases. This is also compatible with the counting-measure witness in `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md:6371` at open pull request #1421 (the opposite pullback convention changes t to −t, not the norm).

8. **F08** (P3) A failed web response is marked as a certified source

   **Location:** `packages/MathematicalBilliards/sources.toml:30`, in the Birkhoff1927 entry: `status = "certified"`.

   **Claim:** The recorded fetched object certifies Birkhoff's article, §§1–3.

   **Witness:** Birkhoff1927 line 5 is an unsuccessful-request/Incapsula response. The entire extraction has five lines and contains no article. A sources-service retry by the recorded DOI returned “uncertified”.

   **Repair:** Have the source/fix worker mark this same key uncertified, recording that the cached object is a failed response, unless it obtains an actual legal copy and certifies its locators. Do not create a replacement key or retain the failed object as evidence of certification. Checking for the article's title and §§1–3 in the five-line response still yields no article text. It is background-only here, so this does not invalidate the periodic-orbit theorem. No new text request is needed for the service's paywalled/uncertified result. The author's manifest entry was preserved for the fix worker.

Eight findings: four P2 and four P3. The original acceptance test elaborates; this does not establish the mathematical claims. No previous review was supplied. The roadmap, Lean file, metadata and author-recorded manifest entries are unchanged.

## Verified sound

Read all four package files: 927 README lines, 283 Lean lines, metadata and 12 manifest entries. Reviewed all 12 layers, 52 numbered target sections, 52 Checks blocks and 54 Needs lines. Read two main-branch shape references: `TauCetiRoadmap/RiemannianGeometry/Surfaces/README.md` and `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/README.md`, as well as the relevant CotangentLagrangian and GeometricTopology sections. The following records give computations, not just an elaboration verdict. The source limitations below are not treated as verified theorem texts.

The package develops finite-regularity billiards, general twist maps, polygonal billiards with holes, translation surfaces and continuous-time spectral theory. It is not a re-plan of a roadmap named MathematicalBilliards found on main or in the supplied board index. Its finite-regularity map and winding-specific two-orbit theorem are identified variants of C3.1, with an explicit comparison. No route-specific arithmetic restriction, computational algorithm, copied source passage, sorry'd data, free-Prop stand-in, `set_option`, forbidden supplier, machine path, dated process narrative or pull-request number occurs in the roadmap text. Layer titles describe mathematical objects; the dependency order is mathematically motivated, rather than a claimed source chapter sequence. The 19 explicit API blocks are supplemented by the three missing ones in R05.

**Elaboration and padding.** Ran the prescribed `lake env lean` command from the content checkout on the original package file: exit 0, exactly six “declaration uses sorry” warnings, no other warning or error. The imported unitary-group object was available; no build was necessary. Independently elaborated a scratch copy with `#check @name` for all 15 named declarations. All explicit hypotheses remain in the types: positive perimeter, k≥2 where used, positive annulus width, the lift comparison and nonwandering assumption, positive/coprime rotation data, Hilbert completeness, unitarity, joint measurability, probability and invariant measure. No lost section binder was found. The zero-period issue is in the predicate, not a lost binder.

Every sorried theorem was probed with `simp`, `rfl`, and `infer_instance` on a copy, using failure backtracking that requires a tactic to close the whole goal. All six remained unproved. The near-match report was read and candidates compared at the pin; none supplies a single-lemma proof. The discrete mean-ergodic theorems project to the fixed space of one time map, not the common real-time eigenspace. No padding deletion is requested. The fully proved circle example checks the nontrivial carrier orientation and is within the permitted handful of examples.

| Sorried theorem | One-tactic result | Native comparison and discriminant |
|---|---|---|
| `ConvexTable.measurePreserving_billiardMap` | 0 of the three probes closed it | Native `MeasurePreserving` requires measurability AND pushforward equality; ellipse determinant √73/5 differs from 1. |
| `isGraph_of_isRotationalInvariantCurve` | 0 of three | Native circle rotation lemmas do not turn an annular embedded curve into a graph; the wavy rotation-invariant curve has derivative 1−0.8π<0 somewhere. |
| `ConvexTable.exists_lipschitzWith_of_isRotationalInvariantCurve` | 0 of three | Circle graph has Lipschitz constant 0, while the derivative-cone bound is 1/(2R); no supplied Lipschitz theorem has these geometric hypotheses. |
| `ConvexTable.exists_two_periodic_orbits` | 0 of three | C3.1 supplies one unspecified-winding orbit; the ellipse has distinct lengths 8 and 4 at type (1,2). |
| `exists_tendsto_twistedAverage` | 0 of three | For e₁ on AddCircle 1, time-one discrete averages equal e₁, but untwisted real-time integer-length averages equal 0. |
| `isWeaklyMixing_iff` | 0 of three | Ergodicity alone admits e₁ under the real circle flow; absolute half-circle residual averages 1/8, not 0. |

**Headline coverage.** The summary's six expressly named end theorems are invariant measure (§3.3), graph theorem (§5.3), two Birkhoff orbits (§6.4), polygonal measure preservation/reversibility (§8.3), rational unfolding (§11.4), and the eigenfunction criterion (§12.5). The first, second, third and sixth are stated; the second also has its Lipschitz billiard specialization. The polygonal-flow and unfolding carriers are genuinely new glued constructions and are named, with reasons, in the module's unavailable-headlines list. That list also explains rational nonergodicity and KZ genus. The additional deep continuous-time mean-ergodic result is stated. The additional summary-named Wiener theorem is statable and missing (R04). The C¹ summary overclaim is R01. All nine named definitions and six named theorems in README line 92 exist in the file, including the six names that the resolver listed as library misses; they are local declarations, not missing suppliers.

**Computed adversarial table.** Values are exact unless an approximation is marked. “Retain” means that the listed instance supports the stated formulation, not a claim that numerical examples prove a general theorem. Domain/regularity assumptions were checked alongside each computation. Source verification is separately recorded below.

| Statement | Instances tried | Values on the two sides / excluded wrong model | Result / change |
|---|---|---|---|
| §1.1 carrier, orientation, strict convexity | Unit circle; clockwise circle; stadium; superellipse | Tangent cross product at antipode: 2 versus required >0; clockwise −2; same straight edge 0; superellipse κ=0 at axes yet strict tangent separation | Retain; zero curvature is allowed, flat segments are not |
| §1.2 curvature criterion | Ellipse semiaxes 2,1; exp(2iu)+exp(iu); superellipse | Ellipse κ(2,0)=2; second curve cross numerator 9+6cos u≥3 and turning 4π≠2π; superellipse κ=0 | Retain injectivity and one-way implication |
| §1.3 exit/chord theorem | Circle δ=π/2,π/3; ellipse major axis | Circle exit parameters π,2π/3; lengths 2,√3; ellipse exit (−2,0), length 4 | Retain; tangent endpoints excluded |
| §1.4 oriented lines | Unit-circle diameter and reversal | (e,c)=(−1,0), reversed (1,0); entry points 1,−1 respectively; tangent line x=1 has no interior point | Mathematical statement retained; API list R05 |
| §1.5 smooth comparison | Unit circle; superellipse; stadium | Repr(exp(is))=(cos s,sin s); tangent x=1 meets circle once; superellipse κ=0 does not violate tangent separation; stadium has multiple tangent-line points | Retain; C3.1 does not require κ>0 |
| §2.1 map/reflection/totalization | Circle; δ=0,π; wrong outgoing angle | F(0,π/3)=(2π/3,π/3); wrong map squared adds 2π; sInf at δ=0 is s, at δ=π is 0 | Retain explicit off-domain warning |
| §2.2 regularity and summary | Circle; C¹ circle–ellipse diameter | Circle derivatives 2R and 1; join derivative limits (2·1−1)=1 and (2·4−1)=7 | Local theorem retained; summary R01 |
| §2.3 closed-cylinder extension | Circle, superellipse flat point | Lift boundary values s and s+2πR; quotient both s; near superellipse flat point exit arclength ∼(4δ)^(1/3), derivative unbounded | Retain homeomorphism, not boundary C¹ |
| §2.4 reversal | Circle R=1 | IFI(s,δ)=(s+2π−2δ,δ)=τ₂πF⁻¹(s,δ); without τ₂π discrepancy 2π | Retain deck factor |
| §2.5 C3.1 comparison | Circle δ=π/3,π/2,2π/3 | v=1/2,0,−1/2; increments 2π/3,π,4π/3; types (1,3),(1,2),(2,3) agree with 2 arccos v | Retain |
| §3.1 chord and mixed derivative | Circle; collapsed diagonal | L=2R sin δ, L_s=−cos δ, L_t=cos δ, L_st=sin δ/(2R)=sin²δ/L; diagonal L=0 and one-sided derivative 1 | Retain open domain; API R05 |
| §3.2 exactness and Jacobian | Circle; ellipse at (2,0), δ=π/4 | Circle det=1; ellipse exit (6/5,4/5), L=4√2/5, cos δ₁=11/√146, sin δ₁=5/√146; det=√73/5, reciprocal=5/√73 | Retain sign and ratio |
| §3.3 measure headline | Circle/ellipse; half cylinder | Mass 2ℓ; half mass ℓ; ellipse transported density (5/√146)(√73/5)=1/√2=sin(π/4) | Retain k≥2 formulation |
| §4.1 twist lift and inverses | Shear, rigid rotation, half-line logarithmic shear; singleton strip | ∂_yF₁=1,0,1/y respectively; inverse signs −1 and −1/y; a=b has vacuous strict order but headline assumes a<b | Retain nondegenerate theorem domain |
| §4.2 area/exactness | Shear; shifted shear c=1 | At (x,X)=(1,2), (−h_x,h_X)=(1,1), h=1/2; flux around y=0 is 0 versus 1 for shifted shear | Retain periodic exactness distinction |
| §4.3 billiard twist | Circle R=1, δ=π/3 | ∂δs₁=2, ∂ys₁=4/√3, ∂vs₁=−4/√3; S_δ=−1=(−cos δ)·2 | Retain k≥2 differential conclusion |
| §4.4 nonwandering | Circle; y↦y²; x↦x+1 | Circle: every point; y²: fixed boundaries 0,1, interior 1/2→1/4→1/16; real translation displaces (−1/4,1/4) disjointly for every positive iterate | Retain |
| §5.1 invariant-curve carrier | Horizontal circle; contractible small circle; union; noninjective f | Degrees ±1,0; two components cannot be image of Circle; R02 map h(−1/2)=1/2 crosses C although f(C)=C | Add homeomorphism in component API |
| §5.2 invariant regions | Shear U={0≤y<1}; rotation-invariant wavy curve | Frontier y=1; whole half-open annulus has empty relative frontier and is not relatively compact; wavy dx/dt minimum 1−0.8π<0 | Retain hypotheses |
| §5.3 graph and Lipschitz headlines | Circular billiard; non-twist rotation | ψ≡c, Lip=0≤1/(2R); forward/inverse vertical slopes ±1/(2R); non-twist wavy curve has multiple heights above a horizontal coordinate | Retain |
| §5.4 rotation normalization/order | Circle δ=π/3; reversal; shifted lift | ρ=1/3, reversed 2/3=1−1/3, shifted ρ=−2/3; higher δ gives higher δ/π | Retain period and deck normalization |
| §5.5 rational curve | Diameter; irrational circle rotation | F² shifts 2π; irrational δ=π/√2 has qδ/π never an integer for q>0; two-fixed-point measure has zero mass off its two-point support | Retain full-support hypothesis |
| §5.6 all circular invariant curves | Constant and sine graph | Constant height unchanged; at s=ℓ/4 sine graph discrepancy ε(cos(2(c+ε))−1)≠0 since 0<c+ε<π | Retain |
| §6.1 configurations and quotient | (1,2),(2,3),p=q | σ²=d for (1,2); W=2L; backwards unit triangle W=3√3; p=q would require q gaps summing qℓ although each <ℓ | Retain coprime 0<p<q |
| §6.2 dictionary | Equilateral; nonequilateral; collapsed; q=0 | Tangent components 1/2=1/2; bad triangle 0≠1/√2; collapsed 0=0 rejected by gaps; irrational sequence at (0,0) satisfies all written conditions | Add q>0, R03 |
| §6.3 maximal orbit | Circle; ellipse; collapsed (1,3) | Circle maxima 3√3 and 4; ellipse major-axis W=8; (1,4) square 4√2 versus doubled diameter 8 of type (2,4); collapsed W=0 with W′(0+)=4ℓ/3 | Retain winding restriction and boundary variation |
| §6.4 two-orbit headline | Ellipse; circle; collapsed endpoints | Distinct ellipse W=8,4; circle equal-gap critical set a circle; cohomological cup length 1 gives ≥2; wholly collapsed derivative 2·1·(3−1)ℓ/3=4ℓ/3 | Retain general C¹ target and stated local construction route |
| §7.1 polygonal carrier | Square; square hole; touching squares | Angle sums 2π=(4−2)π and 8π=(8−2+2)π; touching squares have non-disjoint boundary components | Retain holes and exclusion |
| §7.2 phase/reflections | Horizontal, vertical, π/4 sides | σ(e^{iπ/4})=e^{−iπ/4}, e^{3iπ/4}; π/4-side σ(1)=i; square quarter-area position mass 1/4 | Retain d²conj(v), direction measure 2π |
| §7.3 corner bound | α=π/2,2π/3,3π/2; vertex hit | Ceilings 2,2,1; vertex-directed square state hits in √2ε with 0 reflections, not an escaping segment | Retain avoiding-vertex condition; API R05 |
| §8.1 singular set | Square starting (1/2,1/2) and (1/2,1/4), slope 1 | First reaches (1,1); second has y−x=−1/4 and misses all lattice vertices; slopes to (n,n) tend to 1 while each approximant hits a vertex | Retain null Borel, not closed |
| §8.2 polygon flow headline carrier | Square horizontal state; singular state | From center: t=1/2 right side; t=1 center with −1; t=2 original; singular state fixed at all three times | Retain action extension and quotient continuity only on regular states |
| §8.3 preservation/reversal | Square; fixed-direction measure | Free flight x↦x+tv has determinant 1; reflection angular Jacobian has absolute value 1; JF¹J(center,1)=(center,−1)=F⁻¹(center,1); fixed δ₁ is changed to δ₋₁ | Retain product measure, not fixed-direction measure |
| §9.1 reflection group | Square D₂; equilateral D₃ | Orders 4,6; in D₃, σr=r⁻¹σ≠rσ for r=e^{2πi/3} | Retain genuinely nonabelian case |
| §9.2 rationality | π/8 triangle; irrationally rotated square hole | lcm(2,8,8)=8, group order 16; hole gives rotation through 2θ of infinite order despite all corner angles rational | Retain stronger holes criterion |
| §9.3 nonergodicity | Square; wrong exponent | Re(v²) at v=1,i is 1,−1 and invariant under both reflections; Re(v) changes 1→−1 under vertical reflection | Retain nonconstant invariant |
| §10.1 groupoid | z+3i, 2z, conjugation, −z; disconnected translation | Complex derivatives 1,2,nonexistent,−1; two-component translation has derivative 1 on both components despite different translation constants | Retain componentwise, not globally constant displacement |
| §10.2 cone carrier | Torus; regular octagon; pillowcase | k=1 gives 2π; octagon 8·3π/4=6π gives k=3; pillowcase π would require k=1/2∉ℕ≥1 | Retain integral cone order |
| §10.3 area | Unit torus; side-one octagon; added atom | Areas 1 and 2(1+√2); adding atom c at a marked point preserves regular chart restrictions but changes singular mass 0→c | Retain zero singular mass |
| §10.4 directional flow | Square torus diagonal; marked torus | At t=√2, tθ=1+i≡0; marking 0 fixes its entire horizontal leaf, whereas unmarked flow at t=1/4 moves 0 to 1/4 | Retain identity extension; conull comparison in §12.6 is essential |
| §10.5 tori | Lattices ℤ+iℤ and 2ℤ+2iℤ | Covolumes 1,4; horizontal least periods 1,2; marking a regular point changes Σ from ∅ to one point, not the translation surface after forgetting marks | Retain |
| §11.1 gluing | Square; π/8 triangle | Copies 4,16; vertex class counts 1 each for square, 4,1,1 for triangle | Retain right multiplication in gluing |
| §11.2 cone structure | L-shaped and holed-square tables | 4 sectors of 3π/2 give 6π; in square hole four such classes, plus four regular 2π classes | Retain numerator m, not denominator n |
| §11.3 Euler/genus headline | Square; triangle; L; hole | χ=4+4−8=0; 16+6−24=−2; 4+6−12=−2; 0+8−16=−8; genera 1,2,2,5 | Retain hole term; missing glued CW carrier correctly documented |
| §11.4 unfolding headline | Trivial and nontrivial stabilizers; D₃ labels | Square generic direction gives 4 labels and mass 4→probability 1; θ=1 gives 2 directions and ambiguous labels; (σg)⁻¹=g⁻¹σ, chart velocity g⁻¹gθ=θ | Retain stabilizer and normalization conditions |
| §12.1 weak mixing | One point; two points; real circle flow | Residuals 0,1/4; circle half-set absolute mean 1/8 although signed mean 0; f=i,g=1 centered correlation i−i=0, wrong order −2i | Retain absolute value and inner-product order |
| §12.2 ergodicity | Invariant set mass r=0,1/2,1 | Residual r−r²=0,1/4,0; complementary-set residual r(1−r) gives same three values | Retain implication, not converse |
| §12.3 Koopman | Unit mode; identity; counting measure | U₁/₄e₁=i e₁; identity norm difference 0; counting δ₀ norm difference √2 at any t≠0 | Replace third Check, R07 |
| §12.4 Wiener headline | 0,δ₀,(δ₀+δ₁)/2,uniform[0,1] | Limits/squared atomic sums 0/0,1/1,1/2 over 1/2,0/0; uniform Fourier norm squared at π is 4/π² and at 0 is 1 (not totalized 0/0=0) | Add full signature, R04 |
| §12.4.1 mean ergodic headline | e₁; identity group; zero vector | Untwisted A_N e₁=0 at integers; twist a=1 gives e₁ and mass δ₂π({2π})=1; identity P₀v=v and mass ‖v‖²; v=0 gives 0=0 | Retain common eigenspace, sign and completeness |
| §12.5 eigenfunction headline/Check | One point f=1,0; real circle e₁ | f=1 has only frequency 0; f=0 solves every frequency equation but fails nonzero condition; e₁ nonconstant with frequency 1 and spectral atom 2π | Theorem retained; Check R06 |
| §12.6 consumers | Square and equilateral direction classes | Raw mass 4 gives whole-space residual 12, normalized mass 1 gives 0; torus character at nonzero dual pairing retains its eigenvalue off the null marked leaves | Retain probability and conull-set qualifications |

**Seeded source sample (all 15 targets).** No additional locator was explicitly marked “unverified” in the README. All 12 referenced works have exactly one manifest key. Four substantive cached texts were readable; the fifth supposedly certified item is R08. The table distinguishes source support for a setting from verification of a theorem in that generality.

| Seeded target | Text/locator inspected | Outcome |
|---|---|---|
| 1.2 curvature criterion | BialyMironov2022 lines 96–98, 149–153, printed pp.2–4; Surfaces §3.1 | Source assumes positive curvature; it does not state this converse criterion. The roadmap supplies its own turning/height argument, with a correctly resolved turning supplier. Tabachnikov Chapter 3 is waived. |
| 1.3 exit points | Tabachnikov2005 Chapter 3 | Text waived/unreadable here. The stated circle/ellipse/strict-convexity computations and compactness argument were checked independently. |
| 1.4 oriented lines | BialyMironov2022 lines 154–164, printed p.4 | Oriented-line cylinder and (cos δ,s) coordinates present for positive-curvature curves; no separate C¹ theorem there. The general homeomorphism uses this package's exit-point construction. |
| 1.5 smooth C3.1 comparison | BialyMironov2022 lines 159–164, printed p.4; C3.1 | Coordinate meaning present. The native isometry and supplier hypotheses establish the claimed comparison; source not misrepresented as giving the Lean comparison. |
| 2.3 closed cylinder | KatokHasselblatt1995 §9.2 | Waived text. Both endpoint values and the flat-point loss of boundary differentiability checked independently. |
| 2.5 C3.1 comparison | BialyMironov2022 lines 159–164, printed p.4; C3.1 | Momentum is cos δ; the circle formula and invariant product measure resolve in the supplier. |
| 4.1 twist lifts | Herman1983 I.1.2 lines 149–155; appendix lines 1128–1149, printed pp.5,40–41 | Differential vertical deviation and broader topological transverse-crossing notion are present; inverse direction is explicitly addressed. The package labels its topological construction correctly. |
| 4.2 exactness | Herman1983 I.4.3 remark lines 762–769, printed p.27 | Globally canonical primitive identity present. Package explicitly constructs Q and endpoint generator itself; source does not supply its general variable-density theorem. |
| 4.3 billiard twist | KatokHasselblatt1995 §9.2 | Waived; verified as an internal consequence of the computed exit derivative and primitive identity. |
| 5.3 graph theorem | Herman1983 appendix lines 1150–1154, printed p.41, proof lines 1159–1287, pp.42–46; I.2.2 lines 188–251, I.5.2 lines 803–807; BialyMironov2022 lines 261–264, p.6 | Fathi's nonwandering invariant-region theorem, topological deviation hypotheses and Lipschitz refinement are present. Read the proof steps used by §5.2, not just the theorem. Bialy–Mironov uses the Lipschitz result in its stronger table setting. |
| 6.1 configurations | KatokHasselblatt1995 §9.3 | Waived; quotient relation σ^q=d^p, positive-gap domain and perimeter tests independently checked. |
| 7.1 polygonal carrier | ChernovMarkarian2006 Ch.2; BoldrighiniKeaneMarchetti1978 §2 | Both waived; holes, touching-boundary exclusion and angle-sum examples independently checked. |
| 7.3 corner bound | Tabachnikov2005 Ch.7 | Waived; count of fan rays in an open angular interval of length π gives the displayed ceilings, including the integer endpoint case. |
| 10.1 translation groupoid | ChaikaForni2026 §2 lines 168–176, printed p.5 | Integration of an Abelian differential gives charts off its zeros. No groupoid theorem is asserted there; the README explicitly owns that construction. |
| 12.2 weak mixing ⇒ ergodic | Hochman2012 §6.1 line 2439, printed p.56 | Discrete implication present. The real-action invariant-set argument is separately stated here and has the same computed residual r(1−r). |

Also checked the accessible locators used by the spectral headlines: Hochman2012 Theorem 6.1.7 lines 2483–2487, Proposition 6.2.1 lines 2627–2628, Theorem 6.4.7 lines 2854–2855 (requires ergodicity), Lemma 6.6.2 lines 3076–3096 (cyclic vector), Proposition 6.6.3 lines 3099–3140 (atomless discrete spectral measure), and Corollary 6.6.4 lines 3141–3143. The package calls these discrete antecedents and supplies real-time arguments; it does not silently identify time-one and real-time fixed spaces. ChaikaForni2026 lines 83–100 and 168–176 support the cited area, eigenvalue and chart context. Its Theorem 1.3 is not a general eigenfunction-criterion theorem, and the README correctly gives its own proof route.

**Pinned declarations opened.** Pins read from the content manifest: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Paths below are relative to the corresponding pinned library repository. Where several declarations share a file, the listed line numbers identify each named interface. Native carrier limitations were checked, not inferred from names.

| Pinned file and lines | Declarations / actual contract |
|---|---|
| `Mathlib/Dynamics/Circle/RotationNumber/TranslationNumber.lean:129`, 550,638,685,695,704,707,820 | `CircleDeg1Lift`, `translationNumber`, inverse, limit, monotonicity, two bounds, rational criterion. The carrier requires monotonicity and degree-one equivariance, not continuity; the rational iff explicitly requires continuity and n>0. |
| `Mathlib/Topology/Instances/AddCircle/Defs.lean:190`,306; `Mathlib/MeasureTheory/Integral/IntervalIntegral/Periodic.lean:69`,91 | `AddCircle`, `equivIco`, `measure_univ`, `measurePreserving_mk`. Positive period; Haar mass ℓ, quotient measure comparison uses Ioc (Ico differs by null endpoints). |
| `Mathlib/Analysis/SpecialFunctions/Complex/Circle.lean:421`; `Mathlib/Analysis/InnerProductSpace/PiL2.lean:853`,860 | `AddCircle.homeomorphCircle'`; `Complex.orthonormalBasisOneI`, repr=(Re,Im). |
| `Mathlib/Dynamics/Ergodic/MeasurePreserving.lean:44`; `Mathlib/MeasureTheory/Measure/Prod.lean:172`; `WithDensity.lean:39`; `MeasureSpaceDef.lean:102` | `MeasurePreserving` includes measurability; product has zero junk value when the second measure is not s-finite; `Measure.withDensity`; `Measure.real` is ENNReal.toReal. Probability/finite hypotheses prevent infinity junk in Layer 12. |
| `Mathlib/MeasureTheory/Function/Jacobian.lean:1184`; `Mathlib/Analysis/Calculus/ImplicitContDiff.lean:83`,91 | Change of variables requires measurable set, derivatives within it and injectivity; implicit derivative/regularity require nonzero differentiability order and invertible partial derivative. |
| `Mathlib/Dynamics/Ergodic/Conservative.lean:63`,196 | `MeasurePreserving.conservative`; neighborhood recurrence with second countability and measurable opens. |
| `Mathlib/Dynamics/Ergodic/Action/Basic.lean:31`; `Mathlib/MeasureTheory/Group/Defs.lean:51`; `Arithmetic.lean:456`; `Action.lean:177` | `ErgodicVAdd`, `VAddInvariantMeasure`, `MeasurableVAdd₂`; `measurePreserving_vadd` is the generated additive version of `measurePreserving_smul`. Invariance alone does not assert joint measurability. |
| `Mathlib/Dynamics/Flow.lean:85` | `Flow` includes joint continuity, so it is unsuitable for the singular identity-extended polygonal flow. |
| `Mathlib/Analysis/Convex/Strict.lean:37`; `Hull.lean:48` | `StrictConvex`, `convexHull`; strict convexity alone permits empty sets/singletons and does not supply a nonempty interior or parametrized boundary. `ConvexTable` adds substantive geometry. |
| `Mathlib/Geometry/Manifold/StructureGroupoid.lean:90`,275,293; `ChartedSpace.lean:141`; `HasGroupoid.lean:34`,93; `IsManifold/Basic.lean:673` | `Pregroupoid`, its groupoid, charted spaces, compatibility, maximal atlas, differentiable groupoid. ChartedSpace alone supplies neither Hausdorffness nor compactness; §10.2 explicitly requires them. |
| `Mathlib/Topology/Homotopy/Contractible.lean:29`; `Mathlib/Topology/Homeomorph/Defs.lean:44`; `Mathlib/Geometry/Polygon/Basic.lean:29`,62,72; `Mathlib/GroupTheory/SpecificGroups/Dihedral.lean:31` | Nullhomotopy, homeomorphisms, polygon vertices/edges/boundary, dihedral carrier. Polygon by itself does not assert simplicity or nondegeneracy. |
| `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:595`,606,611,615,631 | Pullback, a.e. formula, norm, isometry and composition. These are imported, not replanned; continuity under jointly measurable ℝ-actions is the new target. |
| `Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean:120`; `Basic.lean:107`; `Mathlib/MeasureTheory/Measure/CharacteristicFunction/Basic.lean:130`,134; `Mathlib/MeasureTheory/Integral/IntervalIntegral/Basic.lean:655` | Projection, conjugation in the first inner-product argument, charFun with positive itξ sign, interval integral. |
| `Mathlib/Analysis/InnerProductSpace/MeanErgodic.lean:89`; `TauCeti/Probability/Ergodic/MeanErgodic.lean:43`,91 | Discrete one-operator projection and Koopman iterate averages; the time-one e₁ witness separates both from §12.4.1. |
| `TauCeti/Geometry/Polygon/Simple.lean:109`,483,614,767 | `Polygon.IsSimple`, boundary parametrization, Jordan boundary and `TauCeti.SimplePolygon`. Simple polygons permit consecutive collinear edges, as the README says. |
| `TauCeti/Topology/JordanCurve/Basic.lean:107`,282; `TauCeti/Analysis/Complex/PlaneSeparation/Inside.lean:190`; `JordanCurve.lean:175` | Jordan carrier, convex frontier, exactly two complementary components, frontier of either component. |
| `TauCeti/Analysis/Complex/Conformal/Jordan/Schoenflies.lean:122`; `PrimeEnd/Crosscut/TwoSides.lean:137` | Plane Schoenflies and crosscut separation; the latter requires an open simply connected domain. |
| `TauCeti/Analysis/Bochner/CharFun/Bochner.lean:101` | `bochner_charFun_real`: continuity and positive definiteness iff unique finite positive Borel measure with the positive-exponent Fourier transform. |
| `TauCeti/Analysis/Semigroups/Group/Basic.lean:74`; `Unitary.lean:107`,154 | Real-linear strongly continuous group; complex inner-product preservation implies complex scalar linearity. Completeness is not in the carrier, but is explicit in the proposed theorem. |
| `TauCeti/AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean:123`; `MayerVietoris.lean:93` | `eulerChar` needs FiniteCWType; additivity requires open sets and finite CW type for union, intersection and both pieces. Hence the glued-surface headline is correctly not forced through arbitrary scalar χ. |

**Ownership, citation and supplier order.** Read the supplied board-package index before absence claims. Searched objects (billiard maps, translation surfaces/groupoids, twist maps, nonwandering sets, spectral/Wiener and Koopman averages) through `roadmaps grep` over indexed main/open heads and the pinned source trees, and compared the library near-matches. No identical fully qualified declaration from another readable roadmap is introduced here. The supplied overlap report has no dropped ids, revision-only ids or conflicting MathematicalBilliards head.

Resolved all actual roadmap suppliers on main:

- `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md:527`: C3.1 next-collision map and strict tangent-line hypothesis; lines 541–554: negative chord generator and measure; lines 568–581: `exists_billiard_periodic_reflection`, circle formula and periodicity; lines 583–596: finite-volume recurrence. Opened its `Suggested.lean:246` as well. The finite-Cᵏ and specified-winding variants here differ as claimed.
- `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/README.md:426`: I5.0 signs; lines 644–659: I5.4 compact-pair continuity; lines 678–686: compact-flow cup-length bound. The cited objects exist on main, so this package does not depend on an open revision's numbering.
- `TauCetiRoadmap/RiemannianGeometry/Surfaces/README.md:471`: §3.1 is expressly piecewise C², includes no-corner curves and orientation reversal, and names the turning theorem at line 489.
- `TauCetiRoadmap/GeometricTopology/README.md:1049` and `:1386`: §1.7 smooth compact-surface genus and §2.3 annulus theorem, including dimension two. Section 10.2's cone charts supply the smooth surface needed for the genus application.

Compared the closest open roadmaps at their indexed heads: PlanarTopology #271 (`TauCetiRoadmap/PlanarTopology/README.md:1`, scope/separation and PL theory); TeichmullerGeometry #1169 (`TauCetiRoadmap/TeichmullerGeometry/README.md:5`, scope and marked genus≥2/moduli theory); ProbabilisticAndMetricNumberTheory #1421 (§4.9a scalar Koopman packaging/continuity); Equidistribution #2112 (`TauCetiRoadmap/Equidistribution/README.md:38`, circle orbit/distribution theory); PointProcesses #417 (`TauCetiRoadmap/PointProcesses/README.md:62`, random measures and point processes). These own no competing polygonal flow or general translation-atlas construction in the inspected scope. Plane separation is imported from its pinned realization, not re-owned. The noncompact punctured translation surface in UnboundedOperators #1027 (`TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:415`) is a specific Nelson example, not the compact translation-surface carrier of Layer 10.

The board-tree object search also found `packages/HardSphereDynamicsAndKineticLimits/design/README.md:7`: it owns hard-core particle trajectories and a flat-position-space interface. Its hard-sphere flow differs from polygonal billiards; the translation-atlas and cone structure of Layer 10 is not a restatement of its metric quotient. This is a design in the readable board tree, not an asserted open-head supplier.

The variant comparisons also resolve: FactorRigidity §8.2 (`TauCetiRoadmap/FactorRigidity/README.md:746`, action mixing for tracial algebras) differs from real-time probability flows; ProbabilisticAndMetricNumberTheory §4.9a (`TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md:6361`) assumes a continuous action on an R₁ Borel space with regular/local-finiteness conditions for strong continuity, unlike the measurable-space-only theorem here. Its pullback uses inverse group elements; the present Uₜ uses positive t, consistently with the e₁ frequency and with ℝ being abelian. Neither is used as a new upward supplier. Names without a supplied/indexed readable head were not independently sought.

The prescribed mechanical dependency check output was:

```text
depcheck: 236 roadmaps, 2134 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No supplier gap is declared. Every explicit supplier citation resolves to the stated owner/section at the relevant main/head; no missing supplier declaration was found. The findings above are local repairs, not a scope rejection or ownership transfer.

## Not verifiable

- `Tabachnikov2005`, Chapters 3 and 7; `KatokHasselblatt1995`, §§9.2–9.3 and Chapter 13; `ChernovMarkarian2006`, Chapter 2; `BoldrighiniKeaneMarchetti1978`, §2; `ZemlyakovKatok1975`, pp.291–300; `KerckhoffMasurSmillie1986`, Theorem 1: each is settled as waived. No text was supplied; exact source wording, page-specific hypotheses and numbering could not be checked. They were not requested again.
- `MasurTabachnikov2002`, Chapter 13 §1: settled as uncertified/paywalled. The unfolding, cone and genus formulas were independently tested, but not certified against that text. It was not requested again.
- `Birkhoff1927`, §§1–3: the provided cache is an unsuccessful web response, not the paper (R08). The permitted sources-service DOI retry returned uncertified/paywalled. Thus this background citation cannot be text-verified; no mathematical target relies solely on it.
- The general C¹ and variable-density extensions are not separate theorems in the accessible Bialy–Mironov/Herman excerpts. Their claimed internal constructions and examples were reviewed; the report does not relabel those source passages as proofs of the extended generality.

All other work independent of the inaccessible texts was completed. No waived key was reopened, no duplicate source key was created, and no new supplier-gap condition is attached to this needs-changes verdict.

## Source issues

- **Misprint** in Hochman2012 at §6.6, proof of Theorem 6.6.1, printed p.68 (Hochman2012 line 3029): the source says the Fourier transform of the spectral measure is real-valued; it should be complex-valued (a point mass at i has first coefficient i); affects the proof.
- **Error** in Hochman2012 at proof of Theorem 6.6.1, printed p.69 (Hochman2012 lines 3065–3074): the source says polynomials using nonnegative powers are dense in the spectral L² space; it should use Laurent polynomials (for Haar measure, z⁻¹ is orthogonal to every nonnegative power); affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "d2ef99ae864464b35f167f8e116feb2d3349dcbc", "job": "REV-PKG-MathematicalBilliards", "model": "gpt-6-astra", "worker": "chris-8"} -->
