<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13067#issuecomment-6789268220 -->
Review (codex) of d782870

Verdict: needs_changes

1. **F01** (P2) Import the existing complete-reducibility and semisimplification owners

   **Location:** `packages/MordellLawrenceVenkateshPartII/README.md:1143`, also ownership at lines 40–45 and 84–85 and Needs at 1181: “Call Γ G-completely reducible … projecting Γ from a minimal Richardson parabolic … unique up to G(k̄)-conjugacy.”

   **Claim:** This package owns the generic complete-reducibility predicate and minimal-Richardson-parabolic/Levi semisimplification for groups with reductive identity component.

   **Witness:** Earlier open PR #856, `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:1496`, owns the connected construction; PR #1202, `TauCetiRoadmap/LanglandsParameterStacks/README.md:601` and `:619`, explicitly extends it to nonconnected groups, all R-parabolics and R-Levis, including uniqueness of Levi semisimplification.

   **Exact repair:** Import the connected theory from ArithmeticGaloisRepresentations §1.11, “Complete reducibility and closed tuples”, and the nonconnected extension from LanglandsParameterStacks §§2.3–2.4. Remove the duplicate generic construction/proof targets from §2.3; update Scope, Exact supplier contracts, §2.3 Needs and Layer 2 Dependencies. Retain explicitly distinguished rational-descent, local rational-orbit finiteness and continuity applications, using §2.11 where needed. Do not replace the nonconnected theorem by a connected-only shortcut.

   **Test of repair:** In SL₂, conjugation of U=((1,1),(0,1)) by diag(t,t⁻¹) gives ((1,t²),(0,1)), with limit I: the existing supplier and this target produce the same trivial semisimplification, trace 2 and determinant 1. The nonconnected supplier also covers J=SL₂²⋊C₂ with generators (U,D),(1,W), D=diag(2,1/2), W=((0,−1),(1,0)): the second projection is irreducible, while the first limits to 1. Its all-R-parabolic statement covers this case even though the component projection is trivial. Its stronger uniqueness up to J°-conjugacy implies the geometric J-conjugacy needed here. The suppliers are at merge-order positions 59 and 81, before this package at 320; neither consumes this package. This is duplicate ownership, not a counterexample to the semisimplification theorem.

2. **F02** (P3) Finish the empty-permutation support repair in the contract

   **Location:** `packages/MordellLawrenceVenkateshPartII/README.md:316`: “log-concavity of every row … on its contiguous support 0 ≤ q < n”. The same wording remains in the top-level gaps entry in `packages/MordellLawrenceVenkateshPartII/design/plan.json:4606`.

   **Claim:** Every Eulerian row has that support, including n=0. The n≥2 qualification later in the sentence belongs to the variance assertion.

   **Witness:** `packages/MordellLawrenceVenkateshPartII/Suggested.lean:59` counts the unique empty permutation: A(0,0)=1. `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:3010` and `:3012` explicitly preserve it. Its support is {0}, whereas {q:0≤q<0}=∅.

   **Exact repair:** In both the README contract and its matching top-level gaps entry, qualify the support description by n≥1, retaining A(0,0)=1 and singleton support at n=0. Keep the slug and the convolution, reflection and n≥2 variance requirements. No Lean declaration is needed.

   **Test of repair:** The repaired convention gives support {0} and total mass 1 at n=0, support {0} and mass 1 at n=1, and support {0,1} with row (1,1) and mass 2 at n=2. The sum over q<0 is still 0, as the new Layer 8 Check correctly says. The n≥2 headline is unchanged. This is the remaining instance of preceding F05, not a re-raised finding marked non-actionable.

3. **F03** (P3) The finite-order Check overstates necessity

   **Location:** `packages/MordellLawrenceVenkateshPartII/README.md:1952`: “The finite-order condition on ψ is essential (see §5.7).”

   **Claim:** The cocycle equation's conclusion needs ψ to have finite order on the whole unipotent group.

   **Witness:** On U=𝔾_a² over ℚ, take ψ(x,y)=(−x,2y), r=2, u=(2,0), v=(−1,0). Then u+ψ(u)=0 and ψ(v)−v=u, although ψ has infinite order.

   The issue is not just that one infinite-order example works. Put N=uψ(u)⋯ψ^(r−1)(u). From N=1 one obtains ψ(N)=u⁻¹Nψʳ(u)=1, hence ψʳ(u)=u. Thus u lies in the closed unipotent subgroup U^(ψʳ), preserved by ψ, on which ψʳ=1. The finite-cyclic theorem applies there and proves the same conclusion for arbitrary algebraic automorphisms ψ. In the displayed example this subgroup is {(x,0)} because 4y=y forces y=0.

   **Exact repair:** Replace the necessity claim with a Check distinguishing direct applicability of the stated finite-cyclic theorem from necessity for its conclusion: on all of U the infinite-order ψ is outside that theorem's hypotheses, but restricting to U^(ψʳ) recovers the conclusion. Keep the source-supported finite-cyclic statement and §5.7's explicit centralizer restriction. The example above tests the replacement with nonzero u; in characteristic p the existing ψ=id, r=p example still fails, since the norm is 0 while every coboundary is 0. No Suggested.lean change is needed.

Three findings: one P2 and two P3. The package is repairable within its intended scope. Both Lean headlines elaborate; neither is padding. Four preceding findings are repaired, and the empty-permutation repair is incomplete in the supplier contract.

## Verified sound

### Previous findings checked first

All locations in this table refer to `packages/MordellLawrenceVenkateshPartII/README.md`. The preceding repair report marks none of F01–F05 non-actionable.

| Prior finding | Repaired passage and test | Status |
|---|---|---|
| F01: flat tensors versus Hodge tensors | Lines 1475–1477: “The torsor respects the tensor structure of the connection, not the Hodge filtrations”. Lines 1481–1486 give F¹=ℂ(1,i), A=diag(1,0), determinant −i≠0. The actual period orbit has one point. | Repaired. The added polarized-integral hypotheses, fixed-part route and torsor transfer were reviewed afresh. |
| F02: mixed strictness ownership | Lines 616–622 name the three native strictness declarations and say “a rational fibre is presented on that carrier by any ℤ-lattice spanning it”. For ℚ(0)⊕ℚ(−1)→ℚ(−1), both F¹ sides have dimension 1 and both W₀ sides dimension 0. | Repaired in Scope, contracts, target and dependencies. No global flat lattice is inferred. |
| F03: character-map direction | Lines 1790–1794: “inclusion of connected centres … gives the canonical inclusion”; character restriction gives the projection. At GL₂, 1↦(1,1)↦1, and (1,0)↦1/2. | Repaired. Scalar versus determinant-dual normalization agrees. |
| F04: O₀ cohomology | Lines 1414–1418 distinguish “for n ≥ 1 … not a single point” and “At n = 0 … a single point”. | Repaired: cardinalities 1 at rank zero, 4 for O₁ over ℚ₃, 8 over ℚ₂. |
| F05: empty permutation | Lines 2377–2379: “For n ≥ 1 it vanishes outside … while for n = 0 … A(0,0)=1”; lines 2467–2470 distinguish the full mass and empty restricted sum. | Partly repaired: Layer 8 is correct, but contract line 316 retains the old pattern; R02. |

The newly added fixed-part gap is present under the identical slug in the plan and README. AbelianSchemesAndArithmeticModuliPartII §B2.4 currently treats geometric origin; the requested general polarized integral variation is a genuine extension. On varying elliptic H¹ plus constant elliptic H¹, the monodromy factor has dimension 3, its complementary derived centralizer has dimension 3, and the latter's variation is constant. The new proof uses that fixed part, not preservation of every flat endomorphism. The nonpolarized ℙ¹ example has trivial monodromy and a one-dimensional period image, so it tests the added polarization hypothesis.

### Coverage, principles and shape

Read the four package inputs, preceding review and repair, board index, overlap and citation leads, all 79 numbered targets and all 79 Needs lines. All 11 layers have Examples and Dependencies. Each numbered target has at least three Checks; definitions retain their prose APIs. Compared the organization with main's JacobianChallenge, ComplexKahlerGeometry and ReductiveGroups. The order realizations → coefficient groups/period geometry → incidence estimates → arithmetic applications is supported by the stated dependencies; the numerical branch is separate. No source-chapter plan, copied passage, algorithmic deliverable, prohibited supplier, process residue, sorry'd data or set_option was found. The ownership exception is R01.

The base MordellLawrenceVenkatesh remains the owner of the one-dimensional method; the package is an extension rather than a replacement. General comparisons are imported with their actual hypotheses and the missing relative interface declared. The projective application treats the small monodromy cases separately instead of replacing the theory with a good-primes-only route. Untouched assertions were re-read; preceding computed rows were retained only as evidence for the unchanged statements they actually tested. The table below records fresh checks of the seeded sample, headlines, findings and repaired passages, together with representative checks of their adjoining interfaces.

### Seeded source sample

All 15 requested locators were read in the supplied legal cached texts. LS uses arXiv:2004.09046v5 numbering and preprint pages; LV uses printed Inventiones pagination. No additional author-flagged unverified locator was found beyond settled Serre. Four readable works and the settled book account for all five manifest keys; no new source was needed or added.

| Target | Exact text examined | Comparison with package |
|---|---|---|
| 0.1 Hodge–Deligne systems | LS line 1832 through line 1893, Definition 5.2, pp.40–42 | Four realizations, comparisons, finite filtrations, regular singularity, transversality and purity match. Integral eigenvalues and polarization are additional conditions. |
| 0.2 Integral/polarized/integral Frobenius | LS line 1903 through line 1915, Definitions 5.3–5.5, p.42 | The lattice, polarization and eigenvalue integrality are distinct; dual closure is not asserted for integral Frobenius. |
| 1.1 Étale H⁰-algebras | LS line 2054 through line 2069, Definitions 5.14, 5.16, p.45 | Weight zero, trivial filtration and finite étale Betti algebra match; arithmetic constancy is explicit. |
| 1.4 Equidimensional modules | LS line 2164 through line 2186, Definitions 5.24–5.25 and Lemma 5.26, pp.47–48 | Geometric-factor rank and freeness match; the package explicitly handles the empty algebra. |
| 1.8 Inversion pairing | LS line 2366 through line 2405, Lemma 5.30, pp.51–52 | Inversion changes χ to χ⁻¹; the twisted form is coefficient-balanced, line-valued and has sign (−1)^(n−1). Translation descent is retained. |
| 2.5 Tensor filtrations | LS line 2600 through line 2674, Definitions 5.40–5.41 and Lemma 5.42, pp.56–58 | Exact tensor filtration and the parabolic-plus-conjugacy criterion match. The source's stronger parabolic-only remark is correctly rejected. |
| 2.8 Uniformity | LS line 2776 through line 2806, Definition 5.46 and Lemma 5.48, pp.60–61 | Uniformity concerns the adjoint factor profile; restriction of scalars multiplies multiplicities. |
| 4.4 Orbit codimension | LS line 3205 through line 3258, Lemma 7.2, pp.70–71 | One Frobenius cycle, strong balance, uniformity and cA−dim H≥e agree. |
| 4.5 Semisimple fibre non-density | LS line 3259 through line 3298, Theorem 7.3, pp.71–72 | Positive-dimensional arithmetic base, integral polarized systems and semisimple fibres retained. The package explicitly supplies rational Frobenius polynomials needed for global finiteness. |
| 5.10 Fixed-graded bound | LS line 3605 through line 3657, Lemma 8.12, pp.79–80; LV line 3703 through line 3724, Proposition 11.3, pp.990–991, proof through p.993 | Strict numerical inequality versus non-strict codimension is correct; (h⁰−t)/2 and h⁰/2 are distinguished. The stated connected-reductive extension uses the root-pair proof, not an unsupported classical matrix identification. |
| 7.5 Classical semisimplification fibres | LV line 3123 through line 3128, Lemma 10.5, p.975; proof at LV line 3255 through line 3339, pp.979–981 | Fixed disk and global semisimplification, small crystalline centralizer and paired graded objects agree. No semisimplicity of the original fibre is added. |
| 7.7 Finiteness | LV line 2901 through line 2903, Theorem 10.1 final assertion, p.970 | Monodromy on every positive-dimensional subvariety is needed. Resolution, proper lifting and decreasing dimension supply the reduction described here. |
| 7.8 Point-count bound | LV line 3865 through line 3941, Lemma 12.1, pp.995–996 | The corrected cutoff through 2M is necessary; b>0 and M≥1 avoid empty maxima and division by zero. Constant 3 survives. |
| 8.5 Enough factors | LS line 3981 through line 4000, proof of Theorem 9.2, p.87; LS line 4076 through line 4228, Lemma A.1, pp.89–90 | Positive flag dimension and strict limiting top-weight inequality yield a sufficiently large c. Geometric parity excludes the spurious GO₂ case. |
| 10.7 Primitive quotients | LS line 4013 through line 4030, Corollary 9.3 and proof, pp.87–88 | Full stabilizer, quotient over K, degree multiplication and finite kernels match. The locator includes the proof's continuation. |

Also checked BC line 1341 through line 1352, Theorem 10.13/Remark 10.14, PDF p.34, and Beauville line 84 through line 155, Theorems 2/4, printed pp.10–12. The Jacobian-ring Hodge bidegree, ambient-dimension shift, quadratic cases and cubic-surface exception agree. The source issues below are corrections already respected by the package, not additional package findings.

### Adversarial values

Counts of descents were independently enumerated through n=7 and compared with the recurrence through n=9. Primitive Hodge rows were computed by multiplying (1+t+⋯+t^(d−2))^(n+1). All quantities below use the package's conventions. These finite tests check normalization and scope; they are not proofs of the general theorems.

| Statement | Instances tried | Values on each side | Result / change |
|---|---|---|---|
| 0.1 system axioms | Unit; Tate object at p=3; rank mismatch | Unit ranks 1=1 and weight 0; Tate eigenvalue 1/3 is nonintegral but allowed; ranks 2≠1 cannot be compared isomorphically. | Correct. A connection with ∇(e₂+t e₀)=e₀dt and F¹=F²=span(e₂+t e₀) fails transversality. |
| 0.2 separate conditions | ℚ(−1), ℚ(1), monodromy 2 | Eigenvalues 3 and 1/3; only 3 integral. A lattice aℤ has 2aℤ≠aℤ. | Correct nonexamples. |
| 0.3 strictness | Mixed projection; filtered-only identity | F¹ dimensions 1=1; W₀ dimensions 0=0. Identity ℚ(0)→ℚ(−1) has strictness sides 1≠0 and sends W₀ of dimension 1 into 0. | Repaired F02. |
| 0.4–0.7 realization distinctions | Quadratic H⁰; double-cover projector; constant family | Arithmetic permutation order 2 versus geometric group order 1; (1−τ)/2 sends e₁ to (e₁−e₂)/2, while the intersected lattice is ℤ(e₁−e₂). Constant period image dimension 0. | Constancy, rational projector and disk transport distinguished. |
| 1.1 étale algebra | ℚ²; dual numbers; zero algebra | Two geometric points versus one nonreduced point with ε²=0≠ε; zero algebra has 0 points. | Correct. |
| 1.2–1.3 coefficient operations | C₃; E=ℚ²; swap involution | ℚ[C₃] has rational factor dimensions 1+2, unlike ℚ³'s 1+1+1. Component tensors (1,0)⊗E(0,1)=0. For B(v,w)=v·swap(w), e=(1,0), v=w=1: B(ev,w)=(1,0)≠(0,1)=B(v,ew). | Correct convolution and balancing distinctions. |
| 1.4 equal ranks | (2,2), (1,3); E=0 | Both total dimensions 4; only first has common rank 2. Over E=0, E^N=0 for every N. | Correct rank and nonuniqueness conditions. |
| 1.5 forms | Alternating ranks 1,2; zero algebra | Determinants 0 and 1 respectively; over E=0 the map 0→Hom(0,0) is invertible even with rank label 1. | E≠0 is substantive. |
| 1.6–1.7 characters/orbits | Order 3; two rank-6 factors | [ℚ(μ₃):ℚ]=2, not 1; total rank 2·6=12. In characteristic 3, [3] has derivative 0 and is not étale. | Correct coefficients and invertibility. |
| 1.8 inversion pairing | Two inverse-character factors | Symmetric case: raw matrix ((0,1),(1,0)) times swap becomes I₂. Alternating case with J=((0,1),(−1,0)): raw block matrix ((0,J),(J,0)) times block swap becomes diag(J,J), determinant 1. Raw cross value 1 violates balance against e=(1,0); twisted cross value 0 satisfies it. | Correct n=3 sign +1, n=4 sign −1; perfect coefficient-balanced form. |
| 1.9 arithmetic descent | C₃⋊C₂=S₃, FγF⁻¹=γ⁻¹ | e=(2−γ−γ²)/3 has e²=e and FeF⁻¹=e; (γF)²=F². Single eigenvalue ζ₃ has nonrational trace; paired polynomial t²+t+1 has integer coefficients. | Rational orbit essential. |
| 2.1 coefficient normalizer | E=ℚ², N=1 | Normalizer 𝔾_m²⋊C₂ has dimension 2 and 2 components; GL₂ has dimension 4. Conjugating diag(1,0) by ((1,1),(0,1)) produces a nonzero off-diagonal entry. | Normalization of the coefficient algebra excludes arbitrary linear maps. |
| 2.2 semilinear centralizer | E=ℚ², N=2, φ swapping factors | Commuting factor pairs satisfy (A,B)=(B,A), so dimension 4 versus dimension 8 before imposing commutation. For σ=id dimension can be 8, but E^σ≠ℚ. | One-cycle hypothesis matters. |
| 2.4 tensor structures | Unit and a rank-two candidate unit; GSp₄ | Monoidal unit dimensions must satisfy 1=1, not 2=1. diag(2,1,1,1) scales the two symplectic pairings by 2 and 1, so no single multiplier works. | Tensor compatibility is substantive. |
| 2.6 crystalline inner forms | Split PGL₂ and quaternion inner form | Both have dimension 3, but split ranks 1 and 0; algebraic closure makes both split rank 1. | Equal dimension does not identify the rational groups; only a chosen torsor trivialization does. |
| 2.9 global finiteness | GL₁, weight 0, K=ℚ, T={2}, p=2 | Quadratic characters of discriminants 1,−4,8,−8 give 4 classes; t−1 and t+1 are integral, whereas t−ζ₃ is not rational. | Integral-polynomial condition retained; general K allowed. |
| 2.3 duplicate construction | Upper unipotent U; disconnected product example in R01 | diag(t,t⁻¹)Udiag(t⁻¹,t)=((1,t²),(0,1))→I; trace 2=2, determinant 1=1. | Mathematical construction agrees with earlier owners; import it, R01. |
| 2.5 cocharacter convention | Torus weights ±1; SL₃ | Equal torus parabolics, but F¹=ℚe₊ versus ℚe₋. SL₃ positive weights (1,1,2) versus (1,4,5). | Parabolics do not determine even the unindexed chain. |
| 2.7–2.8 top sums/uniformity | Weights 2,0,−2 and doubled profile | T(1/2)=1, T(1)=T(2)=2, T(3)=0; doubled T(1)=2=2T(1/2). Rank-two types (1,0),(2,0) have adjoint positive weights 1 versus 2. | Scaling and distinction from equidimensionality correct. |
| 2.10–2.11 rational classes | H=1⊂GL₂; diagonal torus GL₃; O₀/O₁ | Pair classes 2; ordered partitions 1+6+6=13. H¹(O₀) size 1; H¹(O₁) sizes 4 over ℚ₃, 8 over ℚ₂. Normalizer versus centralizer for a split GL₂ torus: 4 versus 1 rational classes. | Correct; repaired F04. |
| 3.1 period orbit repair | Constant CM elliptic H¹; rank-four polarization | det((1,i),(1,0))=−i≠0 although orbit size 1. B(e₁,f₁)=1, B restricted to span(e₁,e₂)=0. | Flat versus Hodge tensors distinguished. |
| 3.1–3.3 added hypotheses/ambient | Nonpolarized ℙ¹; elliptic variation plus constant factor | Nonpolarized example: monodromy orbit dimension 0, period image dimension 1. Legendre orbit dimension 3−2=1. Correct Ax–Schanuel ambient gives 1≥0+1; enlarged compact dual would give 3≥2+3, false. | Polarization and orbit-form gap retained. |
| 3.4 all components and nilpotents | I=(xy); I=(z²) | x^m mod(y)=x^m≠0 for every m; xy∈I. z∉(z²), but z²∈(z²). | Product over components and radical exponent both necessary. |
| 4.1–4.3 balance | Diagonal/product SL₂; eight-index permutation | Diagonal dimension 3 and 1 class; product dimension 6 and 2 classes. Four size-2 classes, each σ-cycle meeting 2: 4-balanced, strongly 2, not strongly 4. | Correct independence counts. |
| 4.4 orbit codimension | GL₂ profile (1,2,1), e=1 | A=1, dim H=4. At c=5: cA−dim H=1≥1; at c=1: −3<1. | Correct numerical hypothesis. |
| 4.5 semisimple non-density | Same profile, d=1; d=0 | At c=5: 1≥(1+4)/5=1. For a point, closure dimension 0 equals base dimension 0, so it is dense. | d≥1 excludes the false boundary conclusion. |
| 5.1 central maps/sign | GL₂ and diagonal Levi | Inclusion 1→(1,1), projection (1,1)→1; (1,0)→1/2. γ(diag(t,1))=t⁻¹ has weight −1. | Repaired F03. |
| 5.2–5.5 induced weights | GL₂ flag; GL₆/GL₁₂ blocks; Tate line | Equal Hodge/auxiliary lines give graded jumps (1,0), unequal lines (0,1). GL₆ weak balance forces (1,1,1). GL₁₂ (1,4,1) has modular weight 0 but averages (1/4,1,1/4)≠(1/2,1/2,1/2). Tate ℚp(−1): de Rham 1=2/2, HT −1. | Full indexing of F retained; auxiliary indexing can be forgotten. |
| 5.6 infinite-order Check | ψ=diag(−1,2), r=2 | u=(2,0), v=(−1,0): u+ψu=(0,0), ψv−v=(2,0). ψ²(0,1)=(0,4)≠(0,1); fixed subgroup y=0. | Necessity claim corrected by R03; theorem itself valid. |
| 5.6–5.8 characteristic/order | Ga, ψ=−1; Ga/Fp, ψ=id; diag(2,1) | In characteristic zero v=−u/2 solves ψv−v=u. In characteristic p norm pu=0 while coboundary=0, failing for u=1. Conjugation on the upper root group multiplies by 2; its fixed subgroup is 0. | Characteristic-zero requirement and centralizer restriction correct. |
| 5.9 root signs | SL₂, w=s; identity | Both root sets {−α}; −s(−α)=−α, while s(−α)=α lies outside. At w=1 both cardinalities 0=length(1). | Correct forward/inverse minus signs. |
| 5.10 fixed graded | GL₂, e=1, c=1 and 3 | c=1: B=1≤T(1)+T(1)=2, excluded. c=3: 1≥1/3 and 1>2/3. In (ℙ¹)³ for B³, semibalance requires at least 2 Hodge lines aligned; codimension ≥2≥1. | Strict numerical inequality and codimension agree. |
| 5.11–6.1 varying pairs/full theorem | GL₂ regular semisimple; coefficient c=25,d=1 | Two Borels have dimension 0≤dim centralizer 2. For coefficient criterion x=(1+4)/25=1/5, A=1≥1/5 and B=1>2/5. A point remains dense in itself. | Centralizer cost and positive-dimensional hypothesis correct; no fibre semisimplicity required in 6.1. |
| 7.1–7.3 tensor comparison | Tate line; middle degree 2 at ℓ=3 | Tate cocharacter t and t⁻¹ have the same image 𝔾_m. Paired eigenvalue λ=1 has partner 9, not 3. Regular GSp₂ torus dimension 2. | Tensor/image conventions and corrected multiplier agree. |
| 7.4–7.6 classical fibres/headline | Elliptic profile, d=1; unipotent extension | A=1, h⁰=2: 1≥3 fails. Nonsplit matrix U≠I has semisimplification I and the same trace 2/determinant 1. | Low-dimensional counterapplication excluded; fixed semisimplification does not mean split fibre. |
| 7.7 finiteness reduction | Curve; lower-dimensional component | Proper closed subset of an irreducible curve has dimension 0. For symmetric weights ±1,…,±5 and two zeros, T(3)=12≤T(4)=14≤T(5)=15: decreasing dim Z decreases both discarded sums. | Monotonic direction correct; all-subvariety monodromy essential. |
| 7.8 point-count estimate | M=1,2,3; q=2,m=2 | Kernel norms 19,85,231; ratios 9/19≤3/4, 25/85≤3/8, 49/231≤1/4. At M=1 cutoff is 16<b/3: b=49 passes, b=48 fails equality. | Frequencies through 2M and strict cutoff correct. |
| 8.1–8.3 adjoint/Eulerian law | n=2,3,4; GO₂ wrong parity | Difference variances 1/2,2/3,5/6 equal (n+1)/6. At n=2, β=(1/4,1/2,1/4), total 1. GL₂ gives 2h⁰=4<6; nongeometric GO₂ gives 4<4 false. | Normalization and geometric parity correct. |
| 8.4 Lean headline and R02 | n=0,1,2,3,4,5,6 | Full row at n=0 has A00=1 but range-0 sum 0. n=1: 2>1. n=2…6: LHS 4,36,488,11420,377816 versus RHS 4,36,576,14400,518400. | n≥2 substantive; contract support needs R02. |
| 8.4 large/small bridge | n=7,8,9 | LHS 17405640,1049776080,80786169900 versus RHS 25401600,1625702400,131681894400. Variances 4/3,3/2,5/3. | Direct cases agree; n≥8 contradicts the hypothetical strict variance bound <3/2. |
| 8.5 enough factors | GL₂,e=1,c=10,11,25 | T terms sum 10/c: at c=10 equals B=1 and fails; c=11 gives 10/11<1; c=25 gives 2/5<1. | Finite c with strict margin exists. |
| 8.6–8.9 Hodge/asymptotic inputs | Plane cubic, quartic surface, quintic threefold; n=6400 | Primitive rows (1,1), (1,19,1), (1,101,101,1); quadric in ℙ⁴ gives zero row. Plane-curve genus leading term d²/2; adjoint h⁰/(d⁴/2)→1/2. Normal difference variance 1/12+1/12=1/6; 40/√6400=1/2. | Primitive/full distinction, limits and strict large-n cutoff correct. |
| 9.1 native definition | Zero form; x₀; Σxᵢ^p, p=2,3 | Zero gradient rejects zero and the p-th-power form at (1,−1,0,…); ∂₀x₀=1 accepts the hyperplane. | Nonreduced/characteristic-p controls pass. |
| 9.2 projective monodromy | Cubic surface; genus-one family; quadric | Cubic-surface W(E₆) has order 51840 and dimension 0, versus dim SO₆=15. Genus-one Sp₂ has dimension 3. Rank-one quadric primitive part has dim SO₁=0. | Exceptional finite and zero-dimensional cases retained. |
| 9.3 Lean headline | Plane quartics; homogeneous scaling | Coordinates binomial(6,4)=15, projective dimension 14; degree-e equation satisfies G(cF)=c^eG(F). | Correct carrier and projective conclusion; thresholds precede S. |
| 10.1–10.4 models | Point on E; A itself; quadratic Weil restriction | Stabilizers 0 and A respectively; only point is a divisor. Res quadratic dimension 2r versus r, splitting into two conjugate factors. Over dual numbers Res(E) has an affine-line tangent fibre and is not proper. | All-test-schemes stabilizer and étale base restriction retained. |
| 10.5–10.6 primitive headline | SL₆ central ζ₃; first exceptional pair | B=ζ₃²B forces B=0 since ζ₃²≠1. binomial(25,5)/6=8855; 17710≠8855. A zero-dimensional component contributes one class. | GL branch needs no form; primitive exception is equality. |
| 10.7 quotient | [2]×id; trivial kernel | Kernel order 4; d(H)=4d(H′); with d(H′)=1 gives 4=4. Identity gives 1=1. | Finite kernels and degree division correct. |
| 10.8–10.9 arithmetic headline | T=0; T=E[2]; d=17710 | Quotient 0 in first case; E(K)/2E(K) in second. 8855 divides 17710 although 8855≠17710. | Finite cokernel, not surjectivity; general exception is divisibility. |
| 10.10 surface headline | Principal class; multiplication by 2 | φ²=2 gives genus 1+2/2=2. q(2h)=4q(h), whereas reduced-image degree need not scale. Abel–Jacobi factor is id for a and 0 for constant map. | Correct curve route and positive quadratic form. |

### Lean acceptance, signatures, padding and headline completeness

Ran the required `lake env lean` on the actual Suggested.lean from the pinned content checkout: exit 0, only the two “declaration uses sorry” warnings, at 69:8 and 106:8. Its only import is `import Mathlib`; no Tau Ceti module build was necessary.

Independently elaborated a scratch copy with `#check @name` for all six actual declarations: eulerian, eulerian_central_mass_le_half, HypersurfaceMonomial, IsSmoothHypersurface, HasGoodReductionOutside and integralHypersurfaces_not_zariskiDense. The supplied seven-declaration count contains a parser artefact. All needed binders survived: n≥2; the field instance; the prime hypothesis and its Fact instance; homogeneous degree; and `∃n₀ ∀n≥n₀ ∃D₀ ∀d≥D₀ ∀S ∃G`. No signature was changed.

On a separate copy tried simp, rfl and infer_instance on each of the two sorried theorems. All six attempts failed to close. The supplied exact-lemma leads concern derangements, generic convolution bounds, monomial bases, formal smoothness, elliptic reduction, real lattice counting and valuation order, not either headline. No one-library-lemma proof was identified. There are no admitted examples, boundary theorems or Check mirrors. Every one of the six own Lean identifiers attributed by the README is declared; definitions have real bodies and exist to state the two headlines.

| README headline | Acceptance coverage |
|---|---|
| 6.1 coefficient non-density | Module docstring lines 23–27: compatible family realizations, comparisons and monodromy unavailable. |
| 7.6 general higher-dimensional non-density; 7.7 finiteness | Lines 28–30: primitive family cohomology, Hodge data and geometric monodromy unavailable. |
| 7.8 centralizer bound | Lines 44–45: primitive étale cohomology with Frobenius unavailable. |
| 8.4 central Eulerian mass | Actual theorem at line 69 with n≥2. |
| 9.3 projective parameter non-density | Actual theorem at line 106 on native polynomial carriers, with nonzero homogeneous coefficient equation. |
| 10.6, 10.9, 10.10 Shafarevich finiteness | Lines 31–43 identify missing arithmetic abelian-scheme models, numerical equivalence and top self-intersection, while crediting existing ample/effective divisor carriers. |

The smoothness predicate is used on homogeneous forms in the headline. For positive degree, smoothness modulo primes outside S forces S-unit content; integral projective parameters admit representatives with that content. Homogeneity of G makes vanishing independent of S-unit rescaling. The existential thresholds can be enlarged to positive degree and the dimension range needed by the geometric theorem. No omitted statable headline or substitute encoding was established.

### Native declarations and duplication audit

Opened the following at the pins, not at newer library revisions. Searches were by objects as well as declaration names.

| Library-relative path and line | Actual content checked |
|---|---|
| `Mathlib/Data/Finsupp/Weight.lean:216` | Degree is the sum of exponents. |
| `Mathlib/RingTheory/MvPolynomial/Homogeneous.lean:46` | Weighted-homogeneous predicate at weight 1; the zero polynomial is homogeneous in every degree. |
| `Mathlib/Algebra/MvPolynomial/PDeriv.lean:61`; `Mathlib/Algebra/MvPolynomial/Eval.lean:572` | Native derivative and algebra evaluation. |
| `Mathlib/FieldTheory/IsAlgClosed/AlgebraicClosure.lean:127` | Algebraic closure carrier, at the same universe. |
| `Mathlib/RingTheory/Regular/RegularSequence.lean:147` | Regularity includes nonzero final quotient. |
| `Mathlib/RingTheory/Filtration.lean:432` | Krull intersection requires Noetherian local ring and a proper ideal. |
| `TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean:154` | Cocharacter limit subgroup on Hopf-algebra points, not a newly defined parabolic carrier. |
| `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.lean:188` | Points of a known Hopf algebra identify with tensor automorphisms; not the general two-fibre-functor torsor. |
| `TauCeti/Geometry/Hodge/Mixed/Basic.lean:72`; `Mixed/Morphism.lean:77` | Rational/complex base-change models, finite filtrations, preserving W/F; no polarization or finite-dimensionality automatically included. |
| `TauCeti/Geometry/Hodge/Mixed/Strictness.lean:110`, `:118`, `:131`; `Mixed/Abelian.lean:33` | F, complex W and rational W strictness; abelian category. The repaired fibrewise import matches. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` | Proper geometrically integral group over a field; not an abelian scheme over S-integers. |
| `TauCeti/AlgebraicGeometry/LineBundle/Ample.lean:71` | Quasi-compactness and affine nonvanishing neighborhoods of positive powers. |
| `TauCeti/AlgebraicGeometry/CartierDivisor/Basic.lean:127`; `CartierDivisor/Effective/Basic.lean:45` | Cartier divisor on integral scheme; local regular-equation effectivity. |
| `TauCeti/AlgebraicGeometry/IntersectionNumber/Basic.lean:111`; `LineBundle/Degree.lean:130` | Pullback followed by truncated Euler degree; defined on arbitrary test schemes over a field, not only proper curves. Trivial class on Spec k gives 0. |
| `Mathlib/Combinatorics/Derangements/Finite.lean:66`; `Mathlib/Combinatorics/Additive/Convolution.lean:87` | At n=1 derangements count 0 versus A(1,0)=1; generic set-convolution cardinality bound does not give the Eulerian factor 1/2. |

Main and indexed open-head object searches covered finite-group/projector cohomology, variation/connection comparisons, generic complete reducibility, R-parabolics, tensor reconstruction, stabilizers, divisor models and Eulerian counts. R01 is the previously missed generic semisimplification overlap. Generic translation stabilizers correctly remain with HeightsRationalPointsAndObstructions; convolution monodromy remains with SheafConvolutionOnAbelianVarieties; the Eulerian definition is a permitted minimal acceptance carrier for an already named supplier object.

Read the five closest open scopes: SheafConvolutionOnAbelianVarieties #1809 (convolution and character orbits), MordellLawrenceVenkatesh #1231 (one-dimensional method), GaloisSectionsPadicPeriodMaps #1739 (section-compatible local periods), WeightsInEtaleCohomology #1001 (arithmetic weight comparisons), HeightsRationalPointsAndObstructions #1017 (stabilizers and arithmetic). Their distinct scopes and conventions agree with the claimed imports. In particular GaloisSections uses the opposite named Hodge–Tate sign, explicitly; no declaration is imported here under that sign. The overlap facts report no conflicting head changing this package, dropped cited id or revision-only cited id. The board index was checked before making any absence claim; the inaccessible separate package is recorded below.

### Supplier resolution and gaps

Resolved current main copies when present and the indexed heads for new roadmaps. The following register records section locators and representative inspected file lines. CLI-added snapshot headers are excluded from the cited repository line numbers.

| Supplier | Resolved sections and witness |
|---|---|
| MordellLawrenceVenkatesh | §§0.3–0.4, 0.24, 1.2, 1.10, 1.12–1.13, 2.5–2.6, 2.8, 2.11, 3.8; `TauCetiRoadmap/MordellLawrenceVenkatesh/README.md:482`, `:847`, `:1283`, `:1420`. Abelian-family transport does not erase the relative comparison gap. |
| SheafConvolutionOnAbelianVarieties | §§0.2, 2.4, 3.1, 3.3, 4.8, 5.2–5.3, 6.7, 8.2–8.3; `TauCetiRoadmap/SheafConvolutionOnAbelianVarieties/README.md:214`, `:669`, `:841`, `:935`, `:1170`, `:1326`. HT weights −q, sign parity and first exceptional degree 8855 agree. |
| ClassicalArithmeticCompletion | §§2.18, 2.39, 2.56; `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:3008`, `:3604`, `:4071`. R02 is a support-description mismatch, not missing ownership. |
| ReductiveGroups; ReductiveGroupsPartII | Layers 3–7b, especially 6A and 7b; `TauCetiRoadmap/ReductiveGroups/README.md:2043`, `:2608`. PartII §RG2.0.2, analytic charts at `TauCetiRoadmap/ReductiveGroupsPartII/README.md:640`. Generic semisimplification also needs the more specific earlier owners in R01. |
| RestrictedPowerSeries; ComplexKahlerGeometry | §§2.1, 5.2 at `TauCetiRoadmap/RestrictedPowerSeries/README.md:306`, `:541`; ComplexKahlerGeometry K3 §3.4 provides Rückert and locally finite analytic components. |
| ComplexComparisonPartII | §§C5.2, C5.3, C5.6, C6.6 at `TauCetiRoadmap/ComplexComparisonPartII/README.md:3256`, `:3583`, `:4437`, `:5142`. |
| ShimuraData | §§1.2–1.4 and 3.1–3.7; `TauCetiRoadmap/ShimuraData/README.md:184`, `:354`, `:385`, `:442`, `:504`. Its pure morphisms are distinguished from the native mixed input; normality is a declared gap. |
| AbelianSchemesAndArithmeticModuliPartII | §B2.4 geometric fixed part, §B2.6, Layer B3; `TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md:1514`, `:1946` for the latter interfaces. General fixed part and pure monodromy-orbit Ax–Schanuel are explicitly requested. |
| MotivesAndAlgebraicCycles | §§6.1–6.3, 6.8; `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:1115`, `:1129`, `:1148`, `:1228`: general reconstruction and tensor-isomorphism torsors. |
| PadicHodgeTheory | §§3.3–3.6, 4.4, 5.5, 6.1, 7.3, 8.1–8.2; `TauCetiRoadmap/PadicHodgeTheory/README.md:681`, `:893`, `:1070`, `:1277`, `:1377`. §5.5 includes local reductive H¹, §7.3 requires lisse higher direct images. |
| CrystallineCohomology; étale suppliers | §CR.7.3 at `TauCetiRoadmap/CrystallineCohomology/README.md:11343`; §F.3 at `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:707`; §8.2 at `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:4015`. The resolver's VanishingCycles.lisseDirectImageTransport lead is explicitly planned in §F.3, not a claimed pinned declaration. |
| Weights and traces | DeligneWeightsAndPurity §§0.1–0.2, 0.7, 0.9–0.10, 0.16, 2.2, 4.3–4.4, 9.12, e.g. `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:560`, `:808`, `:1364`, `:3165`; WeilConjectures WC.3/WC.5 and §5.21 at `TauCetiRoadmap/WeilConjectures/README.md:1178`; RD.7.7 at `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:13967`; IG.0.T4 at `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:587`; §4.3 at `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:4217`. |
| LefschetzPencilsAndVanishingCycles | §§2.8, 3.4, 4.4–4.5, 5.8, 5.10; `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:2195`, `:2409`, `:2687`, `:2734`, `:3041`, `:3105`. Pencil, radical quotient and open-or-finite hypotheses retained. |
| SchemeAndStackFoundations; AlgebraicModuliForArithmeticGeometry | §§0.8–0.9, 1.16, 4.14 at `TauCetiRoadmap/SchemeAndStackFoundations/README.md:967`, `:1026`, `:2693`, `:6008`; §§2.1, 9.4 at `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:1079`, `:10140`. |
| AbelianSchemesAndArithmeticModuli | §§A0.1, A1.2, A1.8, A2.4, A2.10, A3.2–A3.3, A3.6, A6.7, A6.14, A6.30–A6.32; `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:599`, `:1158`, `:1480`, `:1545`, `:3713`. |
| Arithmetic and curves | Chebotarev Layer 10, `Completed/Chebotarev/README.md:410`; ArithmeticGaloisDuality §R02.3.1, `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:1837`; JacobianChallenge Layer F, `TauCetiRoadmap/JacobianChallenge/README.md:448`; FaltingsFinitenessAndIsogenyTheorems §R28.5.15, `TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheorems/README.md:2571`. |
| HeightsRationalPointsAndObstructions | §§1.6–1.7 and 5.2 at `TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md:603`, `:613`, `:2185`. Stabilizer on nilpotent test schemes and weak Mordell–Weil for every m≥1 are supplied. |

All seven gap slugs match the plan and Exact supplier contracts: eulerian-log-concavity-and-variance; eulerian-central-limit; andre-monodromy-normality; period-map-ax-schanuel; relative-crystalline-comparison; hodge-tate-image-cocharacter; polarized-fixed-part. Each has a named earlier supplier and concrete missing interface. Aside from R02's support convention, none was found vague, unowned or already supplied at the cited generality. Row unimodality alone does not supply log-concavity/convolution/variance; Sen's operator alone does not supply the tensor-preserving image-torus comparison; fibrewise crystalline comparison does not supply relative Frobenius compatibility; the geometric fixed-part theorem does not cover arbitrary polarized integral variations. These are accepted contracts, not findings merely because their conclusions are not implemented today. No conditional acceptance is issued while the three repairs remain.

The prescribed dependency command returned:

```text
depcheck: 236 roadmaps, 2158 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The generic ownership imports proposed in R01 also point strictly earlier. No source input, plan, manifest, merge-order file or tooling was edited during this review.

## Not verifiable

- Serre, I §5.4, Corollary 1 to Proposition 36 and III §4.3, Theorem 4: settled uncertified book. Its exact text was not guessed or requested again. Local cases and the supplier proof route were checked independently.
- LawrenceVenkateshMethod, board PR #345, indexed head 9ee7ac3: a fresh read of `packages/LawrenceVenkateshMethod/README.md` returned HTTP 404. Ownership against that separate package could not be checked; it is not asserted absent. Readable main and indexed open-head ownership was checked as above.

## Source issues

- **Error** in LS at Example 5.17, preprint p.46: the source says crystalline Frobenius is residue Frobenius tensored with scalar Frobenius; it should be Frobenius on the crystalline descent module, with φ^f matching residue Frobenius; affects a stated result.
- **Error** in LS at §5.8.2 after Definition 5.40, preprint p.57: the source says a parabolic determines each filtration up to reindexing; it should be determined by its cocharacter-filtration class, since opposite torus weights give different intermediate lines; affects a stated result.
- **Misprint** in LS at Definition 5.44, preprint p.60: the source says the decreasing graded quotient has denominator Fᵃ⁻¹; it should be Fᵃ⁺¹; affects nothing.
- **Error** in LS at the proof of Lemma 5.49, preprint p.61: the source says the coefficient-linear group is connected reductive; it should allow disconnected even orthogonal similitude groups and handle their component groups separately; affects the proof.
- **Gap** in LS at Lemma 5.49, preprint pp.61–62: the source says integral Weil eigenvalues permit the cited Faltings lemma; it should supply rational characteristic polynomials, or justify a stronger finiteness input; affects the proof.
- **Misprint** in LS at the central-weight discussion before Definition 8.4, preprint p.74: the source says a character composed with a cocharacter is an automorphism; it should say endomorphism, allowing the trivial map and t↦t²; affects nothing.
- **Gap** in LS at the proof of Lemma 8.14, preprint p.80: the source says the finite-cyclic lemma applies to conjugation by φ; it should first restrict to Z_U(φʳ), where that action has order dividing r; affects the proof.
- **Misprint** in LS at Definition 9.1, preprint p.85: the source says no translation may stabilize a primitive hypersurface; it should exclude only nonzero stabilizing translations; affects a stated result.
- **Error** in LV at §10.2 before (10.8), printed p.971: the source says parameter dimension is binomial(n+d,d−1)−1; it should be binomial(n+d,d)−1, giving 14 for plane quartics; affects nothing.
- **Misprint** in LV at the proof of Lemma 10.4, printed p.978: the source says Frobenius scales the middle-degree pairing by ℓ; it should be ℓʳ in middle degree r, pairing λ with ℓʳ/λ; affects the proof.
- **Gap** in LV at Lemma 12.1 and proof, printed pp.995–996: the source says power-sum control through N bounds its kernel; it should require control through 2N, the kernel's actual largest frequency; affects a stated result.
- **Error** in LS at Lemma A.1, preprint pp.89–90: the source says the strict bound holds for all three classical choices; it should retain geometric parity, since n=2,d=1,GO₂ gives equality; affects a stated result.
- **Misprint** in LS at the paragraph after the GO calculation in Lemma A.1, preprint p.90: the source says descent variance has square-root growth; it should be variance (n+1)/12, with square-root growth for standard deviation; affects nothing.
- **Misprint** in LS at the proof of Lemma A.4, preprint p.91: the source says the propagated bound at index i has denominator 3^j; it should be 3^i; affects the proof.
- **Misprint** in LS at the proof of Lemma A.5, preprint p.91: the source says the tail comparison is greater-than; it should be less-than, giving the upper second-moment bound 3/2; affects nothing.
- **Misprint** in LS at the final sum in the proof of Lemma A.5, preprint p.91: the source says the k-sum still has denominator 3^i; it should be 3^k; affects nothing.
- **Misprint** in LV at Example 4 after Lemma 11.2, printed p.988: the source says the induced increasing-flag quotient has denominator f_(k+1); it should be f_(k−1); affects nothing.
- **Misprint** in LV at the end of the proof of Lemma 11.4, printed p.993: the source says w and w⁻¹ give the inverse root bijections; it should be −w and −w⁻¹ on the stated negative-root sets; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "d782870d5d8ebf82ba3f93713a43545dd453db7a", "job": "REV-PKG-MordellLawrenceVenkateshPartII~5", "model": "gpt-6-astra", "worker": "chris-6"} -->
