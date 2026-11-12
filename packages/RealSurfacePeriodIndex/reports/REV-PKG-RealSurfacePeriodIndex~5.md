<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13094#issuecomment-6787184608 -->
Review (codex) of e4e7ef2

Verdict: needs_changes

1. **F01** (P3) The order's special fibre is four-dimensional

   **Location:** `packages/RealSurfacePeriodIndex/README.md:686`, §1.6, fourth Check: “its fibre at t = 0 is the algebra of upper triangular 2 × 2 matrices”.

   **Claim:** For R = ℂ[t]_(t), the order O consisting of matrices whose lower-left entry belongs to tR has upper-triangular special fibre.

   **Witness:** O has R-basis e₁₁, e₁₂, te₂₁, e₂₂. Consequently dim_ℂ(O/tO) = 4, whereas upper-triangular matrices have dimension 3. The class of te₂₁ survives modulo tO.

   The Check confuses tensoring the order with ℂ and taking its image under entrywise reduction in M₂(ℂ). Those operations differ because the latter map is not injective on O/tO. The intended conclusion, that this order is not Azumaya, is correct.

   **Exact repair:** Replace the special-fibre description by the four-dimensional algebra with radical J spanned by the classes x = e₁₂ and y = te₂₁, with x² = y² = xy = yx = 0, and quotient ℂ × ℂ. Keep the non-Azumaya conclusion and distinguish the three-dimensional entrywise-reduction image if it is mentioned.

   **Repair test:** In O, xy = te₁₁ and yx = te₂₂ belong to tO, but x and y do not. Thus dim J = 2, J² = 0, and the fibre is not simple. For the proposed Azumaya replacement M₂(R), the fibre is M₂(ℂ), dimension 4 with radical 0. This tests the actual fibre and preserves the intended negative control.

2. **F02** (P3) The displayed ternary forms are negative pure norms

   **Location:** `packages/RealSurfacePeriodIndex/README.md:483`, §0.13, proof step 3: “pure-quaternion norm forms ⟨a, b, −ab⟩ and ⟨c, d, −cd⟩”.

   **Claim:** The displayed ternary forms are the pure reduced norms, and a common represented value e gives the common quadratic subfield F(√e).

   **Witness:** In Hamilton's algebra, Nrd(i) = 1 and i² = −1. The displayed ternary form takes −1 at (1,0,0). The pinned pure norm instead takes 1 there.

   The printed forms and the radicand √e are mutually consistent: these are the scalar-valued square forms on trace-zero quaternions. They are the negatives of the pure reduced norm forms. This is a terminology/convention repair, not a failure of the Albert criterion or of the displayed six-dimensional form. Leaving the label unchanged would misidentify the object imported from QuadraticFormInvariants Layer 2.

   The supplier explicitly uses ⟨−a,−b,ab⟩ at `TauCetiRoadmap/QuadraticFormInvariants/README.md:710`. At the pin, `TauCeti/Algebra/Quaternion/NormForm.lean:175` defines `pureNormForm` by restricting the norm, and `pureNormForm_apply_coordinates` at line 183 gives precisely these coefficients. EKM §98, printed p.390, EKM line 20431, likewise relates the pure norm to the negative square.

   **Exact repair:** Call the two displayed forms “the negatives of the pure reduced norm forms, equivalently the square forms on trace-zero quaternions”. Keep the coefficients, Albert form and F(√e). Add the Hamilton computation as a discriminating Check. If genuine norm values are used instead, both ternary forms and the radicand must change sign consistently.

   **Repair test:** With a = b = c = d = −1, the common square value e = −1 gives ℂ = ℝ(√−1), of degree 2. The genuine norm value 1 would require ℝ(√−1), not ℝ(√1) = ℝ. The repaired terminology agrees with the pinned norm and the existing Hamilton-tensor-Hamilton Check.

3. **F03** (P3) The norm-bound docstring cites the wrong subsection

   **Location:** `packages/RealSurfacePeriodIndex/Suggested.lean:88`: “B19 §0.1, p. 63”.

   **Claim:** This is the exact locator for the real-surface norm bound.

   **Witness:** B19 line 15 starts §0.1; B19 line 36 starts §0.2, and B19 lines 37–39 give the real-surface norm dichotomy. Both subsections are on printed p.63.

   **Exact repair:** Change the docstring locator to “B19 §0.2, p.63”, consistent with README §2.10. The README already supplies the argument over an arbitrary real closed field; retain that generality and its existing supplementary locators.

   **Repair test:** Opening §0.2 reaches the claimed norm argument. For a split class the bound is 1 ∣ 2; for Albert's period-two, index-four example it is 4 ∣ 4. No Lean signature or mathematical hypothesis changes.

Three P3 findings; no P1 or P2 finding. The previous blocking findings are repaired. The headline statements elaborate, their hypotheses survive elaboration, and no padding was found. The remaining repairs concern a false Check, the name of a sign-normalized form, and a source locator. No authored package file was changed.

## Verified sound

### Previous findings, checked before the new pass

| Previous finding | Repaired passage | Disposition and recomputation |
|---|---|---|
| F01: wrong specialization fibre | §1.8: “Over t = 1 the cover is z^l = s₁^l”; step 5 chooses “M a k-point of C above 1”. | **Repaired.** For l = 2 and s₀ = s₁ = x, t = 0 gives irreducible z² − x, degree 2; t = 1 gives (z − x)(z + x), two degree-one components. The selected DVR residue field is k(X), so specialization gives ind(α) ∣ d. CT05 lines 934–955 confirm the parameter. |
| F02: missing local Brauer inputs | §1.6: “there is an Azumaya O_X-algebra 𝒜 of degree d and class β”; §1.7 has the empty, one-branch and two-branch cases; §1.8 Needs names “§1.6; §1.7”. | **Repaired.** CT05 Theorem 2.5, lines 256–265, and Proposition 2.6, lines 276–290, support these general targets. Hamilton degree 2 and M₂(Hamilton) degree 4 retain their prescribed degrees. The ramified (−1,t) has nonzero residue and is excluded. For (s,t)₂ the crossing coefficient is 1. The new fourth Check has the separate regression R01. |
| F03: Puiseux theorem attributed to L4 | Supplier contract: “L4 … the common level … and … L5 … the root theorem and `puiseuxField_isAlgClosed`”. | **Repaired at all occurrences.** Main FormalLaurentPuiseux L4 begins at README:195; L5 at 233, with algebraic closedness at 269–273 and Suggested.lean:250. The element t^(1/2) is level-two data; the general root theorem is L5. |

The new §1.6 route uses an Azumaya representative of −β, its stable reflexive lattice and its commutant. Its local-freeness input is the actual finite-reflexive-module theorem in dimension at most two, not class-level Brauer purity. The coniveau/purity argument in §1.7 has the right twists: codimension-one support H³ becomes H¹(κ(𝔭), μ_l), while the potential next obstruction H³ at the closed point is zero in dimension two. The class is not assumed zero when unramified. These targets now have single owners here.

The formerly settled external Tsen–Lang overlap remains **not actionable in this package**. PR #1834, `TauCetiRoadmap/QuadraticFormInvariantsPartII/README.md:56,1589,2026`, still owns the same systems/extension interface and describes reverse supply. This package is earlier, explicitly owns §0.7, and identifies that roadmap as a consumer. The earlier scope reason remains valid: the fix belongs to the other branch. No finding is re-raised against this package on that basis.

### Coverage and computed adversarial evidence

All 108 numbered targets and all 108 Needs lines in the ten layers were read. Every changed passage was reviewed anew; inherited evidence was used only where the previous report supplied computed values. The working ledger records a computed instance for each numbered target. The bounded table here records all 15 seeded targets, every headline, the new findings, and the important repaired conventions. Boundary examples test a statement's scope and conventions; they are not offered as proofs of its general case.

| Statement | Instances tried | Values computed on both sides | Result / change |
|---|---|---|---|
| §0.2 Harrison compactness/inverse limits | Constant ℝ system; ℂ; finite sign constraints | Constant limit has 1 ordering; X_ℂ has 0. H(1) = X, H(−1) = ∅. Closed finite compatibility conditions in {0,1}^F give the ordering space. | Compact inverse-limit argument does not require surjective transition maps. BCR's exact locator remains uncertified. |
| §0.6 and `HasZeroTotalSignature` | Hyperbolic plane, positive plane, zero space, nonreal field | Isotropic-subspace dimensions 1,0,0 give 2·1 = 2, 2·0 ≠ 2, 0 = 0. For a nonreal field there are no real-closed extension maps. | The predicate is substantive on real fields; on nonreal fields it intentionally holds for every form. |
| §0.8 curve u-invariant | ℝ(t), ℂ(t) | ⟨1,−(1+t²)⟩ has signature 0 and is anisotropic: 1+t² is nonsquare. Over ℂ(t), ⟨1,−t⟩ is anisotropic by odd t-valuation. Both examples have rank 2 = u. | Upper bound ≤2 is sharp; theorem includes algebraic, not necessarily finite, extensions of a curve field. |
| §0.10 Springer | ⟨1,−t⟩ over ℝ((t)); H ⊥ t⟨1⟩ | Nonzero square valuations even versus odd; residual lines both anisotropic. Second form vanishes at (1,1,0), matching its hyperbolic residual part. | Residue characteristic 2 excluded; anisotropy requires both residual forms. |
| §0.11 Amer–Brumer | Zero pair in ranks 0 and 1; x² and 0 | Common-zero/pencil-isotropy values are false/false, true/true, false/false. | No accidental zero-vector witness or rank-zero assertion. |
| §0.13 pure norm convention | Hamilton i | Actual pure norm 1; displayed ternary value −1; i² = −1. Norm radicand +1 gives degree 1, square radicand −1 gives degree 2. | **R02:** correct the name of the displayed forms. |
| §1.6 prescribed-degree model | Hamilton and M₂(Hamilton) over ℝ[t]_(t); (−1,t) | Generic/model degrees 2/2 and 4/4; special-fibre indices 2 and 2. Ramified residue −1 is nonsquare. | General degree-preserving extension is now owned and excludes the ramified algebra. |
| §1.6 order Check | O = [[R,R],[tR,R]], R = ℂ[t]_(t) | Fibre dimension 4 versus claimed 3; radical dimension 2, radical square 0, semisimple quotient dimension 2. M₂(R) fibre radical 0. | **R01:** distinguish fibre from entrywise-reduction image. |
| §1.7 Saltman cases | (s,t)₂; (1+t,s)₂; (−1,1+s²+t²)₂ | First crossing coefficient 1, becomes 0 after √(st). Second residue is unit 1+t. Third has every local residue 0 and closed-fibre class 0, but generic class ≠0. | All three cases discriminate the claimed normal form. |
| §1.8 specialization | l=2, s₀=s₁=x | At 0: degree 2. At 1: two components each degree 1. Wrong specialization gives only ind(α) ∣ 2d; repaired one gives ind(α) ∣ d. | Previous F01 repaired. |
| §2.4 integral normalization | Sum pushforward ℤ²→ℤ, n=2 | β=(2,0) has pushforward 2; γ=(1,0) gives β−2γ=0. Unnormalized β′=(1,0) has pushforward 1, not divisible by 2. | Prescribed Kummer lift is essential and retained. |
| §2.9 de Jong headline | ℂ(x,y), split algebra and quaternion (x,y) | Period/index 1/1 and 2/2; nonsquare residue y detects the nontrivial quaternion. | Not the native theorem for an algebraically closed field itself. |
| §2.10 norm-bound headline | Albert class (x,x)+(y,xy) over ℝ(x,y); split class | At y, residue is −x; after √(−x), the unramified factor (x,−1) is Hamilton. Index 4 and period 2 give 4 ∣ 4. Split gives 1 ∣ 2. | General real-closed bound passes; **R03** corrects only its Lean docstring locator. |
| §3.2 incidence/resolution | r=x,s=y; r=xy,s=1 | At x=y=0 incidence equation is 0=0 on all ℙ¹; finite model still has length 2. Node equation xy=(w/v)² has w=0,v≠0; v=0 would force 1=0. | Corrected nonfiniteness and singular-point coordinate agree with the geometry. |
| §3.5 complex pushforward | ℙ¹×ℙ¹→ℙ², conic branch; split cover control | H²: (a,b)↦a+b is onto. H³: 0→0. H⁴: generator↦generator. Split disjoint cover has H⁴ kernel ℤ(1,−1). | Ampleness/integrality hypotheses exclude the split counterexample to high-degree isomorphism. |
| §4.2 cover containing curve | On C take r=1,g=2,a₁=4 | Chosen graph v=4w gives v²=16w²=a₁rg²w². At r=0 the incidence equation alone gives ℙ¹, not the chosen graph point. | Extra vertical fibres do not enlarge the lifted curve. |
| §§5.4–5.5 boundary/obstruction | Four-component Enriques example; a₀=(1,1,0,0), a₁=0 | Picard/integral image J is sum-even. With cl_R(M)=h₁+h₃, c_Ψ=h₁ has sum 1, outside J. With h₁+h₂ instead, c_Ψ=h₁+h₂ has sum 0, inside J. | Exact iff criterion survives the earlier counterexample; no constant-evaluation assumption is smuggled in. |
| §5.8 Picard adjustment | Same example; constant evaluation 0 or 1 | For c=h₁ no Picard correction; for c=h₁+h₂ take φ=M. Constant 0 removes the 2M term; constant 1 retains it. | The source's unconditional conclusion remains correctly replaced by the precise criterion. |
| §6.1 squared real line | Nonzero coefficients 2 and −2; zero | Squares 4 and 4, versus zero 0. Opposite unsquared coordinate would turn 4 into −4. | Positivity belongs to the specified square presentation, independently of the sign of its frame. |
| §6.4 topological branch construction | Torus loops a,b,a+b; three blowups | Total class a+b+(a+b)=0; b₁ after blowups is 2+3=5. Exceptional contribution is doubled, hence 0 mod 2. Two loops alone give a+b≠0. | Generation and parity conditions both tested. |
| §6.10 vanishing variation | Conic double cover | Kernel ℤ(1,−1) has complement (0,1), determinant 1; constant (1,1) gives determinant −2, index 2. p_*λ=2h but p_*λ_van=2h−2h=0. | Saturation and abstract splitting do not assert the false integral constant/vanishing splitting. |
| §6.12 lift transport | α=α̃=0, β=cl(O(1,0)) on ℙ¹×ℙ¹ | β mod 2=(1,0)≠0. Subtracting the same Picard class gives 0; pair transport preserves that normalized reduction. | Arbitrary Brauer lift and arbitrary ambient trivialization are insufficient and are excluded. |
| §7.1 half-period evaluation | n=2,4,6; original evaluation 1 or 0 | At evaluation 1 the half-class values are 1,0,1; at evaluation 0 they are 0,0,0. | Correct uniform value n/2 mod 2. Odd n handled separately. |
| §7.2 induction | n=2,4,6 | Restricted periods 1,2,3: m∣n/2 and n∣2m force m=n/2. | Corestriction prevents an unnoticed smaller period. |
| §7.4 / Theorem 0.3 headline | K=ℂ(x,y) considered over ℝ; (x,y) | −1=i², so nonsemireal; quaternion period/index 2/2. | Finite generation and trdeg 2 remain in Lean. |
| §7.6 / Theorem 0.4 headline | (−1,1+x²) over ℝ(x,y); (x,y) over ℂ(x,y) | First class 0 since 1+x² is a norm, period/index 1/1. Second has no real-closed extension maps, but genuine period/index 2/2. | Birational condition uses the actual Brauer restriction; it is not a free predicate. |
| §7.8 / Theorem 0.12 upper headline | H³, rank 6; quaternion norm rank 4 | H³(1,1,0,0,0,0)=0. Norm of (x²+1,y) has rank 4, signature 0 and is anisotropic by y-adic residue forms ⟨1,−(x²+1)⟩. | Strict threshold >4 correct; upper theorem deliberately has no finite-generation binder. |
| §7.10 / Theorem 0.12 sharpness headline | ℝ(x,y), same quaternion norm | Anisotropic zero-signature dimension 4 gives u≥4; preceding bound gives u≤4, hence 4=4. | Finite generation retained for the general lower-bound construction. |
| §7.11 / Theorem 0.10 headline | Rank-five degenerate form over ℂ(x,y); rank-four quaternion norm | q=sum of first four squares has q(e₅)=0 with e₅≠0; quaternion norm in rank 4 stays anisotropic. | No nondegeneracy hypothesis is needed; threshold is substantive. |
| §7.12 del Pezzo model | Degree 4, degree 3 control | Degree 4: h⁰(−K)=5, h⁰(−2K)=13, dim Sym²=15, kernel dimension 2; quadric intersection degree 2·2=4. Degree 3 has 4 coordinates and a cubic relation. | Anticanonical embedding and complete intersection agree with VA13. |
| §7.13 / Theorem 0.13 headline | K=ℂ(t), q₁=x₁²,q₂=x₂² in dimension 5; real control | e₃ is nonzero and both values are 0. Over ℝ(t), a positive definite form has no such nonzero zero. | Actual pair-of-quadrics theorem; nonreal hypothesis necessary. |
| §8.2 sign/branch parity | Transposition, 3-cycle in S₃; Q₈ regular action | Signs −1,+1; ramification exponents 1,2. Order-four element in Q₈ acts by two 4-cycles, total sign +1. | Alternating cover uses the sign character, including nonabelian monodromy. |
| §8.4 integral lift | n=4, η=0, ζ=[(1,0,0,0)] | ψζ=(−3,1,1,1); −ψζ mod 4=(3,3,3,3)=p*(−1), whereas +ψζ gives (1,1,1,1). Both traces 0. | Minus sign agrees with AlgebraicTopologyPartII §15.4; trace alone would miss it. |
| §8.5 circle extension | n=2,4,6, sign coefficients | H¹ reductions 1,1,1; H² reductions 1,0,1. Stalk E is ℤ/4 at n=2, 𝔽₂² at n=4. A constant ℤ/4 quotient unit lifts although the group extension does not split. | Normalization and sheaf-section obstruction distinguished from splitting as abelian groups. |
| §8.10 / Theorem 0.5 headline | Odd period 3; even period 2 with zero/nonzero obstruction | Odd index 3, since 6 has wrong prime divisors. Even index 2 when corrected component 0, index 4 when its obstruction is 1. | Necessity and sufficiency use existence of a Kummer lift, not every lift. |
| §9.5 empty-half detection | Four classes 0,1,h,1+h in H¹_G | One half: kernel of degree-zero evaluation {0,h}, two elements. Two halves: (1,1),(1,0) independent, kernel {0}. Empty real locus: all four classes restrict to 0. | Nonempty-real-locus hypothesis and “unique nonzero” qualifier both necessary and present. |
| §9.9 one nonempty half | Four ℝℙ² components, Θ first component | w₁²=1+1+1+1=0. a₀=e₁,a₁=h₁ gives pairing 1+1=0; adding h₂ outside Θ gives h₁+h₂ in w₁-perpendicular while preserving restriction h₁. | Corrects on the omitted odd-Euler component and kills the obstruction. |
| §9.10 / Theorem 0.6 headline | One half; two nonempty halves with nonorientability; orientable case | One-half obstruction canceled as above. Two-half full degree-one image has codimension-one Picard subspace, so pairing 1 survives. Orientable w₁=0 gives quotient 0. | Classification is consistent; impossible odd-total-parity branch is not used. |
| §9.11 Puiseux supplier repair | t,−t and X²−t | (t^(1/2))²=t; −t has no real square root; 0<t<r for every positive constant r. | L4 supplies levels, L5 supplies general algebraic closedness. |
| §9.12 sextic K3 | z²=u²v²(w²−u²−v²)−tw⁶ | K has degree −3+6/2=0; H¹(O⊕O(−3))=0. Affine critical value 1/27−t≠0. Two infinite singularities are A₅. Four real components give H¹ ranks 0+0+0+0. | K3 resolution and four spherical components checked; no ordinary order-topological substitute. |
| §9.13 prescribed class | Four quadrant components | Evaluation vector (0,1,1,1); nonzero class killed by 2 has period 2. | Exactly one zero component; general CTP90 source remains uncertified. |
| §9.15 / Proposition 0.7 headline | Real Puiseux K3 and preceding class | H¹=0, period 2, no quaternion representative; index bound ≤4 and exclusion of 2 give index 4. Extending the real criterion would assert 2=4. | Genuine failure over a non-Archimedean real closed field; real-number scope retained. |

For the new empty-ramification Check in §1.7, the nonzero assertion was also recomputed. If 1+s²+t² were a norm from adjoining i to ℝ(s)(t), EKM Corollary 17.6 gives a sum (a+bt)²+(c+dt)² with coefficients in ℝ(s). Comparing coefficients gives b²+d²=1 and ab+cd=0. Thus (a,c)=λ(−d,b), and a²+c²=λ²=1+s², impossible by the odd valuations at s=±i after complexification. This is a nonzero unramified class specializing to zero, not a disguised zero-class Check.

For the sextic example the four affine superlevel regions are discs, one in each quadrant; doubling each along its boundary gives S². Near either infinite singularity the real equation is z²+V²+tw⁶=0. With t>0 infinitesimal there are no new real exceptional components. The adjunction and rational-double-point calculations justify the K3 assertion independently of the source's label.

### Seeded source verification

The cached legal texts were read at their printed locators. The 15 targets below are the current round's seeded sample; source corrections were checked against the actual formulas, not accepted merely because they were listed. All 23 cited works have manifest keys: 10 cached certified works and 13 settled uncertified works. The manifest parses, its numbering/version notes are retained, and no source entry was changed or duplicated.

| Target | Text and exact locator | Outcome |
|---|---|---|
| 0.2 | BCR Example 7.1.4(a), p.135, Proposition 7.1.7, p.136; EKM §33, pp.133–134, EKM lines 7222–7272; B19 §6.4, pp.95–96, B19 lines 1308–1318 | BCR is settled uncertified. EKM supports the compact Boolean space; B19 supports its inverse-limit use. Positive Harrison convention differs from EKM's negative one by a↦−a, without changing topology. |
| 0.8 | EKM Corollary 37.8, p.169, EKM lines 9272–9273; BEC05 §1, p.1, BEC05 lines 18–28 | Supports u≤2 for every transcendence-degree-one extension of a real closed field. No finite-generation narrowing. |
| 2.10 | B19 §0.2, p.63, B19 lines 36–39; §0.4, p.65, B19 lines 83–87 | Norm dichotomy and sharp example supported. README's argument extends the bound to arbitrary real closed constants. R03 is the inconsistent Lean locator. |
| 3.2 | B19 §3.1, pp.76–77, B19 lines 537–558 | Source's finiteness and v-coordinate assertions fail the local equations. README uses the corrected incidence model, finite model and w-coordinate. |
| 3.5 | B19 Assumption 3.1 and Proposition 3.2, p.78, B19 lines 608–636 | Hypotheses and degree ranges match: surjective in degree 2, isomorphism in degrees ≥3. |
| 4.2 | B19 §5.1, pp.86–87, B19 lines 934–960 | The graph uses the positive square root and extends over r=0; vertical incidence fibres are not the curve. |
| 6.1 | B19 §6.1, p.90, B19 lines 1102–1106 | Positive cone in a specified square line is supported; zero excluded. |
| 7.1 | B19 Proposition 6.7 and proof, p.95, B19 lines 1286–1304 | Reduction n/2 mod 2 gives the claimed values; source's odd-period half-class notation is corrected. |
| 7.12 | VA13 Definition 1.5, p.4, VA13 lines 180–199; anticanonical dimensions p.9, VA13 lines 383–389; Remark 1.11, p.10, VA13 lines 419–425 | Arbitrary-field del Pezzo definition, anticanonical model and intersection of two quadrics supported; hypotheses include smooth projective geometrically integral surface. |
| 8.5 | B19 Lemma 7.5, pp.99–100, B19 lines 1474–1534 | Quotient sheaf and normalized circle boundary supported; package makes the cyclic reduction at n divisible by 4 explicit. |
| 8.10 | B19 Theorem 0.5, p.64, B19 lines 65–69; proof p.104, B19 lines 1674–1685 | Exact dichotomy and existential Kummer-lift criterion supported. |
| 9.5 | B19 §8.1, pp.106–107, B19 lines 1767–1784 | Empty-half detection supported with nonzero uniqueness; zero class supplies the immediate negative control. |
| 9.9 | B19 Theorem 0.6 proof, p.107, B19 lines 1791–1799; MVH98 Theorem 4.4, preprint p.12, MVH98 lines 538–540, and Proposition 4.2 at lines 500–533 | Real Picard image equals w₁-perpendicular; correction on an omitted odd-Euler component is valid. The odd-total-parity branch cannot occur. |
| 9.12 | B19 §8.2, p.107, B19 lines 1800–1813; BCR Example 2.4.5(b), p.26 | B19 equation and four-component claim read. BCR remains uncertified; explicit singularity, adjunction and component calculations are recorded above. |
| 9.13 | B19 §8.2, p.107, B19 lines 1814–1816; CTP90 Proposition 3.1.2 | B19 states the required particular class and cites CTP90. CTP90's full theorem is not directly certified; its settled locator is retained. |

The two added local results were separately checked against CT05 Theorem 2.5, printed p.385, CT05 lines 256–265, and Proposition 2.6, printed p.386, CT05 lines 276–290. Their hypotheses include regularity, dimension, the invertibility of l in the residue calculation, and the actual extending Brauer class in the degree-preserving model theorem. The Azumaya-order Check is the author's addition, not an error in CT05.

### Lean acceptance test, signatures and padding

The required `lake env lean` invocation on `packages/RealSurfacePeriodIndex/Suggested.lean`, from the pinned content checkout using the absolute tool argument, finished with exit 0. Its only diagnostics were the eight `declaration uses sorry` warnings at lines 80, 89, 101, 111, 122, 132, 140 and 152. All three imported Tau Ceti object files were present; no module build was necessary.

A scratch copy probed **every** sorried theorem separately with `simp`, `rfl` and `infer_instance`, using `fail_if_success (solve | …)` before retaining the admission. That copy elaborated successfully with only the eight admitted-target warnings: none of the 24 probes closed its goal. The one-library-lemma candidates were inspected at the pins. Index-one over an algebraically closed field assumes that the function field itself is algebraically closed; diagonalization and equivalence of quadratic forms do not imply isotropy over a surface field; preservation of isotropy under extension requires isotropy as an input. No exact one-lemma proof, restated definition, boundary-case theorem or README-Check padding was identified.

The same scratch file printed `#check @name` for all **nine actual declarations**, the definition and eight theorems. No needed binder disappeared. The definition retains finite dimension and invertibility of 2. Finite-generation headlines retain EssFiniteType; all transcendence-degree, nonsemireality, real-extension splitting and rank bounds survive. The upper u-bound intentionally permits fields that are not finitely generated; sharpness does not. The external signature inventory's extra count is not an extra declaration in the package.

The file uses one real-bodied predicate on native carriers, one namespace, mathematical docstrings, `theorem` declarations and the permitted Mathlib/Tau Ceti imports. It has no sorry'd data, free Prop stand-in, set_option, admitted example or other-roadmap import. All nine owned backticked names in the README occur in Suggested.lean, and all nine declarations are named in the README.

| Headline in the summary | Acceptance-test coverage |
|---|---|
| De Jong characteristic-zero theorem, §2.9 | `index_eq_orderOf_of_isAlgClosed`, line 80. |
| Norm bound over real closed fields, §2.10 | `index_dvd_two_mul_orderOf_of_isRealClosed`, line 89; R03 fixes its locator only. |
| Theorem 0.3, §7.4 | `index_eq_orderOf_of_not_isSemireal`, line 101. |
| Theorem 0.4, §7.6 | Equivalent birational form `index_eq_orderOf_of_forall_isRealClosed`, line 111. Scheme form explicitly named as lacking Br(U) and real evaluation. |
| Theorem 0.5, §§7.7,8.10 | Docstring names the absent scheme Brauer, equivariant-cohomology, Kummer and real-component carriers. |
| Theorem 0.6, §9.10 | Docstring names the absent real Enriques, halves, real-locus w₁ and Br(S) carriers. |
| Proposition 0.7, §9.15 | Docstring names the absent K3, semialgebraic-cohomology and Br(S) carriers. |
| Theorem 0.12, §§7.8,7.10 | `not_anisotropic_of_hasZeroTotalSignature` and `exists_anisotropic_hasZeroTotalSignature`, lines 122 and 132. |
| Theorem 0.10, §7.11 | `not_anisotropic_of_not_isSemireal`, line 140. |
| Theorem 0.13, §7.13 | General `exists_common_zero_of_not_isSemireal`, line 152; geometric del Pezzo form and missing carrier separately named. |

The pair-of-quadrics theorem is the mathematical input implying the del Pezzo result through §7.12, not a bounded or vacuous encoding of a missing surface. Searches by object at the pins support the absent-carrier statements. Ring-level Azumaya algebras and a field Brauer quotient do not supply Br of a scheme or evaluation at a real point. No statable headline was omitted.

### Pinned declarations opened

The following are paths inside the pinned libraries, not newer online documentation. These readings also check what the native carriers do **not** assume.

| Pinned file and line | Interface read and consequence |
|---|---|
| `Mathlib/Algebra/BrauerGroup/Defs.lean:41,100` | CSA bundles centrality, simplicity and finite dimension; BrauerGroup is its quotient. The group structure is supplied separately by Tau Ceti. |
| `Mathlib/Algebra/Order/Ring/Ordering/Defs.lean:40,61` | Ordering has spanning and proper prime support; preordering contains squares and excludes −1. Neither definition includes a Harrison topology. |
| `Mathlib/Algebra/Ring/Semireal/Defs.lean:38`; `Mathlib/FieldTheory/IsRealClosed/Basic.lean:52,80` | Semireality and real closedness; no chosen order is bundled in IsRealClosed. |
| `Mathlib/LinearAlgebra/QuadraticForm/Signature.lean:65,98,121,133,243` | Inertia dimensions, isometry invariance and diagonal count; varying-ordering topology remains new. |
| `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1054,1057`; `Mathlib/LinearAlgebra/QuadraticForm/TensorProduct.lean:128,132` | Anisotropic means Qx=0 implies x=0, including the zero-space convention; actual scalar extension is on A⊗M, with Q_A(a⊗m)=Q(m)a². |
| `Mathlib/LinearAlgebra/QuadraticForm/IsometryEquiv.lean:172,177`; `Mathlib/LinearAlgebra/QuadraticForm/Real.lean:78`; `Mathlib/LinearAlgebra/QuadraticForm/AlgClosed.lean:52,62` | Diagonalization and algebraically closed/real classification. None has the surface-field hypotheses and isotropy conclusion of the headlines. |
| `Mathlib/LinearAlgebra/Dimension/Finrank.lean:61`; `Mathlib/RingTheory/EssentialFiniteness.lean:40`; `Mathlib/RingTheory/AlgebraicIndependent/Basic.lean:45` | Cardinal.toNat finrank, localization-based finite generation, cardinal trdeg. Field and finite-dimensional hypotheses remove relevant junk-value hazards. |
| `Mathlib/Algebra/QuadraticAlgebra/Defs.lean:44,387,405`; `Mathlib/Algebra/QuadraticAlgebra/Discriminant.lean:54` | Relation i²=a+bi, basis (1,i), rank 2 and discriminant b²+4a. Not automatically a field, reduced algebra or étale cover. |
| `Mathlib/RingTheory/Morita/Matrix.lean:187` | Matrix-module equivalence with a chosen index in the finite index type. Used for the commutant, not claimed to be the global prescribed-degree theorem. |
| `Mathlib/RingTheory/Ideal/KrullsHeightTheorem.lean:282`; `Mathlib/Topology/Compactness/Compact.lean:1172` | Proper-ideal height bound and product compactness used in the algebraically closed and Harrison arguments. |
| `TauCeti/Algebra/CentralSimple/Index.lean:99,112,255` | Division-algebra degree index, matrix invariance and a splitting field of degree exactly index. No de Jong theorem is hidden in that interface. |
| `TauCeti/Algebra/BrauerGroup/Group.lean:139,174`; `TauCeti/Algebra/BrauerGroup/BaseChange.lean:136`; `TauCeti/Algebra/BrauerGroup/Division.lean:69`; `TauCeti/Algebra/BrauerGroup/Real.lean:102` | Class projection, multiplicative commutative group, same-universe restriction, division representative, Br(ℝ)≃Multiplicative(ℤ/2). |
| `TauCeti/RingTheory/RegularLocalRing/DimensionTwo.lean:202` | A finite reflexive module over a regular local ring of dimension ≤2 is free. The local dimension restriction is preserved in §1.6. |
| `TauCeti/Algebra/CrossedProduct/Comparison.lean:274,317` | Brauer/continuous-Galois-cohomology equivalence and normalization; not scheme evaluation. |
| `TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Signature.lean:52,66,111,140`; `TauCeti/LinearAlgebra/QuadraticForm/Witt/Signature.lean:133` | Ordered-field signature homomorphism and rank/signature classification over ordered real closed fields. |
| `TauCeti/LinearAlgebra/QuadraticForm/Hyperbolic.lean:76`; `TauCeti/LinearAlgebra/QuadraticForm/BaseChange.lean:389` | Hyperbolic plane diag(1,−1), and preservation of established isotropy under faithful flat scalar extension. |
| `TauCeti/FieldTheory/RealClosure/Basic.lean:120`; `TauCeti/Algebra/Order/Ring/Ordering/Extension.lean:62`; `TauCeti/Algebra/Order/Ring/Ordering/Map.lean:64` | Algebraic ordered real closure in the base universe, extension of preorderings and restriction of orderings. |
| `TauCeti/Algebra/Quaternion/NormForm.lean:175,183` | Pure reduced norm coefficients −a,−b,ab. This exposes R02. |

The inherited near-match list was treated as leads. Its suggested `QuadraticForm.complex_equivalent` file is not at this pin; no absence finding is raised against a declaration the package does not cite. The available algebraically closed-form statements above were inspected instead. The native orderOf cardinal bounds and positive-definite/root-system anisotropy candidates do not establish any headline.

### Supplier direction, ownership and overlap

The prescribed dependency command completed with this entire output:

    depcheck: 236 roadmaps, 2147 edges, 0 problem(s)

There was no UPWARD, CYCLE or moved line. The citation resolver reported no unresolved roadmap citation or owned name; its native-name facility was unavailable, so native declarations were checked directly at the actual pins. The board package index and overlap evidence were read before ownership searches. Object searches used the roadmap service at the supplied heads and main, as well as the board packages and pinned sources. No new duplicate fully qualified Lean declaration was found.

| Supplier and copy | Resolved README locations and supplied objects |
|---|---|
| SchemeAndStackFoundations, main | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:616,846,1026,1310`: §§0.1,0.6,0.9,0.17 (algebras, reflexive hulls, approximation, depth); lines 3420,3554,3795,4029,4452,4604: §§2.2,2.6,2.11,2.16,2.20,2.22 (cohomology, Kummer/Tsen, duality, Brauer); lines 5015,5734,5820,5945,6389,7065,7565: §3.4, §§4.9,4.11,4.13,4.17, §§5.4,5.10. Fixed-degree extension is a new target here, not attributed to class-level Brauer theory. |
| PurityForFlatCohomology, head #1840 | `TauCetiRoadmap/PurityForFlatCohomology/README.md:3167`, §8.4: finite-dimensional Noetherian coniveau spectral sequence. |
| LefschetzPencilsAndVanishingCycles, head #873 | `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:725,879`, §0.10: regular-pair absolute purity, invertible coefficients, codimension shift/twist. |
| ResolutionOfSingularitiesCharacteristicZero, main | `TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md:791,893,1150`, §§5.1,6.2,7.8: principalization, SNC compactification, characteristic-zero field resolution. |
| AlgebraicModuliForArithmeticGeometry, head #853 | `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:313,706`, §§1.1,1.4: quotient convention Proj Sym E and relative very ampleness/fixed twists. Its projective bundle is compared to the dual convention in SchemeAndStackFoundations §5.4. |
| HeightsRationalPointsAndObstructions, head #1017 | `TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md:1146,1202`, §§2.16b,2.19a: residues, pullback multiplicity, finite-flat corestriction. The local crossing theorem is owned by this package's §1.7. |
| MotivesAndAlgebraicCycles, head #1313 | `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:160,1401,1412,1441,1477`, §§0.5b,7.6a,7.6b,7.8,7.10: Gersten, equivariant/semialgebraic cohomology, real coordinates, Picard and Enriques image. |
| AlgebraicTopologyPartII, head #1694 | `TauCetiRoadmap/AlgebraicTopologyPartII/README.md:908,980,1003,1080,1116,1237,1252`: §7.4, §§9.2–9.3, §§10.3,10.5, §§12.1–12.2. Lines 1331,1354,1367,1403,1426,1447,1461,1474,1487 resolve §§14.1–14.3 and §§15.1–15.6. Lines 1523,1673,1688,1701 resolve §§16.1–16.4. Trace signs, cyclic reductions, normalized lifts and chase indeterminacy match. |
| AlgebraicTopology, main | `TauCetiRoadmap/AlgebraicTopology/README.md:879,2136`: retained Stage-6 numbering map and cohomology/duality layer. |
| ComplexComparisonPartII, head #848 | `TauCetiRoadmap/ComplexComparisonPartII/README.md:3257,3584,4853,4896`, C5.2,C5.3,C6.2,C6.3: smooth-proper transport, Hodge bundles and complex comparison. The real comparison is an explicit gap. |
| ShimuraData, head #1038 | `TauCetiRoadmap/ShimuraData/README.md:355`, §3.1: actual local system, connection and Hodge filtration in Variation. |
| AffineMorseLefschetz, main | `TauCetiRoadmap/AffineMorseLefschetz/README.md:534,1323`, A3,A5: affine cohomology bound and integral weak Lefschetz. Smoothness of the hyperplane complement is retained. |
| QuadraticFormInvariants, main | `TauCetiRoadmap/QuadraticFormInvariants/README.md:407,585,703,970,1114`, Layers 0,1,2,4,5: diagonal, Witt, quaternion and Clifford interfaces. Main, not an open revision, is the supplier. |
| SemisimpleAlgebras, main | `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/README.md:293`, Layer 6: Brauer and splitting-field interfaces. |
| RealAlgebraicGeometry, completed main | `Completed/RealAlgebraicGeometry/README.md:128`, Layer 1, with its native real-closure interfaces consumed directly. |
| EnriquesSurfaces, head #1286; WeilConjectures, head #1208 | `TauCetiRoadmap/EnriquesSurfaces/README.md:123,181,205`, §§1.1,1.3,1.4; `TauCetiRoadmap/WeilConjectures/README.md:1848`, WC.7: canonical cover, Picard/cohomology, finite Brauer term and characteristic-sensitive Enriques definition. |
| FormalLaurentPuiseux, main | `TauCetiRoadmap/FormalLaurentPuiseux/README.md:195,233,269`, L4/L5 allocation repaired. |
| StableReduction; ModularCurves; PurityOfBranchLocus, main | `TauCetiRoadmap/StableReduction/README.md:529`, Layer 4; `TauCetiRoadmap/ModularCurves/README.md:1882,1919`, 4D and miracle flatness; `TauCetiRoadmap/PurityOfBranchLocus/README.md:371`, §2.3. |

There is no reported conflicting head, dropped cited id, revision-only numbering dependency, or broken external citation to a section this repair moved. The closest open owners #1694 and #1313 supply topology and cycle operations; this package consumes those interfaces rather than defining them again. The already settled #1834 ownership conflict is recorded explicitly above and is not described as a clean sibling audit. The new local Brauer targets were searched by prescribed degree, reflexive lattice/commutant, Saltman crossing symbols and residue hypotheses; no earlier owner of those full statements was located. They are mathematical prerequisites with general statements, not a route-specific weakening.

The three exact supplier gaps have identical slugs and hypotheses in the README and `design/plan.json`:

- `real-artin-comparison`, ComplexComparisonPartII §C6.3: finite-type real X, finite G-module coefficients, natural comparison preserving cups and coefficient boundaries. The supplier presently gives the complex comparison.
- `picard-cokernel-torsion-free`, MotivesAndAlgebraicCycles §7.8: the named result for every smooth real X. The supplier uses the fact inside its divisor theorem; the requested general interface is not already separately supplied.
- `at2-stratified-pair-transport`, AlgebraicTopologyPartII §16.2: existence of invariant compatible control data for the specified proper stratified submersion. §16.1c supplies nonequivariant data; §16.2 assumes invariant data. Neither discharges this exact gap.

These are precise, minimal, owned contracts, not findings. They would remain acceptance conditions after the three local repairs.

### Shape and binding principles

The comparison with main AlgebraicTopology, SemisimpleAlgebras and completed RealAlgebraicGeometry confirms the intended upstream shape. The package has Summary, Scope and ownership, Conventions, exact supplier contracts, ten mathematical layers with Examples and Dependencies, downstream consumers and references. Definitions retain APIs and at least three discriminating Checks; R01 is the identified false Check. Every numbered target has an individual Needs line and locator. The independent geometry and fixed-cover cohomology branches are organized by their mathematical role; the dependency structure, not the paper's chapter order, controls assembly.

No re-planning of an existing RealSurfacePeriodIndex roadmap, prohibited supplier, upward supply, computational algorithm, copied source passage, process path, pull-request number in the roadmap, or unexplained stand-in carrier was found. Characteristic, completeness, finiteness, regularity, nonemptiness and coefficient-invertibility assumptions were checked at their use sites. In particular the arbitrary-real-closed norm bound is not extended to the false arbitrary-real-closed version of the real-point criterion. The changed targets did not create a new source or a duplicate manifest key.

## Not verifiable

The following sources are settled **uncertified** in the supplied manifest: BCR, ARA75, SPR55, EL73, BRO80, DK96, CTP90, SER06, SCH94, GG73, BRE97, DIM85 and DIK00. Their full texts were not legally available in the supplied cache. Their author-recorded locators were retained, and none was requested again or added to a missing-reference request.

In the seeded sample this limits direct verification of BCR's precise compactness/inverse-limit locators (§0.2), BCR's semialgebraic component example (§9.12), and the full CTP90 Proposition 3.1.2 behind §9.13. Accessible EKM/B19 text and the computations above support the stated applications, but do not certify unread source pages. The declared real-Artin comparison also retains its settled SCH94 locator. No claim of reading those texts is made.

No further verification was prevented by the local Lean toolchain or by unavailable supplier heads. A passing sorry elaboration establishes signatures, not proofs of the planned theorems.

## Source issues

These are errors or gaps encountered in the source checking, including earlier corrections whose computed witnesses were retained and rechecked here. They are already handled in the roadmap unless a finding above says otherwise. The report does not treat the author's new special-fibre Check or norm terminology as a source error.

- **Misprint** in CT05 at proof of Theorem 3.14 and Lemma 3.15, printed pp.400–402 (CT05 lines 916–919,934–955): the source says the distinguished split fibre is over zero; it should be over one for the displayed family, or the parameter should be reversed; affects the proof.
- **Error** in B19 at §3.1, printed p.76 (B19 lines 541–547): the source says the incidence surface is a finite double cover; it should distinguish its projective-line fibres over branch crossings from the finite quadratic-algebra model; affects a stated result.
- **Misprint** in B19 at §3.1, printed p.77 (B19 lines 553–557): the source says the singular point above a crossing has v zero; it should have w zero and v nonzero; affects nothing.
- **Gap** in B19 at Lemma 1.4, printed p.70 (B19 lines 281–285): the source says an integral Brauer lift has the prescribed Kummer reduction; it should first normalize that lift by a Picard class; affects the proof.
- **Error** in B19 at Proposition 4.4, printed pp.81–84, after (4.8) (B19 lines 858–861): the source says the fixed-cover obstruction vanishes under all the stated hypotheses; it should vanish exactly when the evaluation-weighted covering class lies in the restricted integral degree-one image; affects a stated result.
- **Gap** in B19 at Proposition 4.5, printed pp.84–85 (B19 lines 880–903): the source says an integral lift admits the adjustment without an extra realization condition; it should require an algebraic realization of the evaluation-weighted class and compare normalized integral lifts; affects a stated result.
- **Gap** in B19 at Proposition 4.5, printed p.85 (B19 lines 898–903): the source says vanishing on the avoided set suffices for the pushforward-image criterion; it should first subtract curve classes allowed by Assumption 4.1(ii); affects the proof.
- **Misprint** in B19 at (5.7), printed p.88 (B19 line 1026): the source says the normal-sequence boundary lands in degree zero; it should land in degree one; affects nothing.
- **Error** in B19 at Lemma 6.4, printed p.92: the source says the auxiliary rational function has a simple zero along R before multiplication by r; it should have a simple pole, so the resulting section has order zero along R; affects the proof.
- **Gap** in B19 at Proposition 6.6, printed pp.94–95: the source says replacement by the nearby fibre finishes the splitting argument; it should transport the pair and a normalized Kummer lift so that the reduction on the open complement stays prescribed; affects the proof.
- **Misprint** in B19 at Proposition 6.7, printed p.95 (B19 line 1286): the source says the half-period lift condition applies to every period; it should apply only to even period, with the odd case separate; affects nothing.
- **Misprint** in B19 at Lemma 7.3 and (7.13), printed pp.98,103 (B19 line 1444): the source says the pullback lift uses plus the trace-zero operator; it should use minus to agree with the quotient sequence and coefficient reduction; affects nothing.
- **Misprint** in B19 at proof of Lemma 7.3, printed p.99: the source says source restriction injectivity identifies two maps out of that source; it should use injectivity of the target restriction; affects nothing.
- **Misprint** in B19 at Theorem 0.6 proof, printed p.107 (B19 line 1783): the source says the class with zero degree-zero component is unique; it should be the unique nonzero class; affects nothing.
- **Error** in B19 at Theorem 0.6 proof, printed p.107 (B19 lines 1786–1790): the source says the one-half argument has an odd-total-Euler-parity branch with nonalgebraic w₁; it should exclude that branch because w₁ is algebraic and self-orthogonal; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "e4e7ef28cd71874f619bca2d6ed75e2fdef87c3a", "job": "REV-PKG-RealSurfacePeriodIndex~5", "model": "gpt-6-astra", "worker": "chris-9"} -->
