<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13044#issuecomment-6782854474 -->
Review (codex) of 5f52739

Verdict: needs_changes

1. **F01** (P2) The supplied adic-point carrier takes the radical of the ideal

   **Location:** packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:425–430, §0.2: “equivalently `FormalLieGroup.Points`”.

   **Claim:** points with coordinate in an arbitrary ideal I of topologically nilpotent elements equal the supplier's dimension-one adic points.

   **Witness:** Pull request #879, TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:1192–1195, uses J.radical. For G_a over Z₃ with I=9Z₃, the proposed carrier is 9Z₃; the supplied carrier is 3Z₃. Coordinate 3 separates them.

   **Exact repair:** Keep F(I) on the native evaluated-point carrier at its stated generality. Under the supplier's complete separated J-adic hypotheses, identify it with the subgroup of the supplier's points whose coordinates lie in I, taking J=I where applicable. Identify the whole carriers only when I is radical and the supplier's base hypotheses hold. State those conditions in the supplier contract too. Add the displayed nonradical-ideal Check: 3 is rejected by F(9Z₃) and accepted by the radical-based carrier; for I=3Z₃ both carriers contain 3 and coincide. This preserves the general point-module construction rather than narrowing it to maximal ideals.

2. **F02** (P2) Honda's infinite operator needs q greater than one

   **Location:** packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:1137–1145, §4.1: “let `q` be a power of `p`” and “Only finitely many terms contribute to each coefficient.”

   **Claim:** the displayed operator is defined coefficientwise under the stated hypotheses, without excluding the zeroth power of p. This section explicitly says q need not be the residue cardinality.

   **Witness:** Take O=Z₂, K=Q₂, π=2, q=2⁰=1, σ=id, ℓ=X, and u=2+Σᵢ≥₁Tⁱ. The coefficient of X would be 2+Σᵢ≥₁1: infinitely many contributions, with no convergent sum in Q₂.

   **Exact repair:** Specify q=pʳ for an integer r≥1 (equivalently, require q≥2 in addition to being a power of p). Carry this hypothesis through the operator API and its uses; it does not restrict the intended Honda theory. Add the q=1 negative control. Retesting the same example with q=2 gives 2X+X²+X⁴+⋯: the coefficients at degrees 1,2,4 are 2,1,1, and each coefficient receives finitely many contributions. H70 §2, pp.220–221, lines 309–329 uses precisely this growth in its well-definedness argument.

3. **F03** (P2) Comparison assertions introduce reverse dependencies

   **Location:** packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:1387–1389, §5.4: “using the coherent Frobenius-twist identifications of §6.2”. Related occurrences are at lines 482–483, 665 and 1903–1905.

   **Claim:** these are results in their early sections, but their objects or comparison maps are constructed later and omitted from the early Needs lines. The build paragraph at lines 352–354 asserts the opposite direction.

   **Witness:** §5.4 uses §6.2, which uses §5.2. Likewise §0.3 uses §9.1, whose Needs includes §0.3; §1.4 compares §2.3–2.4 objects, whose Needs includes §1.4. Adding these edges produces coarse layer cycles.

   **Exact repair:** Separate the early constructions from their later consequences. Keep actual-lattice descent and the action L↦u⁻¹L in §5.4; put the class-level action and class-level parts of its Checks in §6.6, where lines 1594–1596 already supply the argument using §6.2. Keep analytic logarithms in §0.3 and their formal-trace compatibility in §9.1. Keep the strict coordinate isomorphism in §1.4 and its torsion, Tate, division-field and character identifications in the respective Layer 2 targets. Keep the generator conversion in §8.5 and place the assertions involving finite formal traces in §9.1 or §9.3, updating their Needs accordingly. An early forward pointer may describe a later consequence, but must not require its proof there. Do not repair this by adding cyclic Needs edges.

   The mathematical tests remain unchanged after this placement: a=π_F sends T to T and its class to [π_F⁻¹T]=[T]; an additive base point 3 has degree-two trace 6 and logarithm 6; the identity coordinate change preserves all qᵐ torsion points; adjacent sign labels contribute −1. The external roadmap dependency check does not inspect these internal target edges.

4. **F04** (P3) The unit interpolation Check includes the strict identity

   **Location:** packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:675–676, §1.4: “`a = u` a unit gives the non-strict isomorphism”.

   **Claim:** every unit gives a non-strict comparison.

   **Witness:** Put u=1 and f=g=2X+X² over Z₂. The unique intertwiner is X, with linear coefficient 1, hence strict. The preceding Check at line 671 already gives this identity.

   **Exact repair:** Say the unit comparison has linear coefficient u, is strict exactly when u=1, and is non-strict when u≠1. Retest u=1 and u=3: the cyclotomic endomorphisms are X and (1+X)³−1, with derivatives 1 and 3 respectively. Keep both as README Checks; no Lean declaration is needed.

5. **F05** (P3) The sign Check uses a torsion point outside the trace's source

   **Location:** packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:2001–2002, §9.3: “the wrong sign on the image of `w_(n+1)`”.

   **Claim:** the generator from §8.5 tests the formal trace in this square.

   **Witness:** At p=5 and s=n=0, w₁ is primitive 25-torsion and generates Φ₁ of degree 600 over Φ. The square's source is Ψ′₂, of degree 30. Thus w₁ is not a point over that source.

   **Exact repair:** Use a nonzero point in the actual source and ensure its trace is nonzero. For example take a sufficiently deep base-field point x with ℓ_H(x)=5ʳ, supplied by §0.3, and include it in H(𝔪_(Ψ′₂)). Both routes give [30]x, with logarithm 30·5ʳ. With adjacent source/target sign labels, inserting the correction gives matching logarithms −30·5ʳ; omitting it gives opposite nonzero values. One may take r=2 here: 750 and −750 distinguish the two maps. This also avoids a torsion example on which a trace might vanish. Keep the ordinary square, whose two total degrees are 30.

Five findings: three P2 and two P3. The acceptance file elaborates, the five padding probes fail to close their targets, and the external dependency check passes. The findings concern the README. No authored package file or source-manifest entry was changed. Review date: 2026-11-11.

## Verified sound

### Previous review: all sixteen requested repairs checked first

The prior report is packages/LubinTateFormalModulesAndQuasiCanonicalLifts/reports/REV-PKG-LubinTateFormalModulesAndQuasiCanonicalLifts~2.md; the repair report is the adjacent FIX-PKG-LubinTateFormalModulesAndQuasiCanonicalLifts~3.md. None of its dispositions was “not actionable in this package.” Each original finding is repaired; R01 and R03 above identify remaining interface/order defects, not a demand to undo those repairs.

| Prior finding | Repaired passage in the current package | Status and retest |
|---|---|---|
| R01 actual lattice action | README:1387–1389: “carries the actual embedded lattice `L` to `u⁻¹L`” | Repaired. At a=π_F, actual image T; class [π_F⁻¹T]=[T]. Its new class-level placement needs R03 above. |
| R02 division-tower ownership | README:57–60,236–242,765–779: “primitive-coordinate presentation” of the supplied tower | Repaired. RelativeFarguesFontaine §2.5 is imported; the polynomial-root presentation is the retained variant. |
| R03 quadratic lift ownership | README:61–64,246–254,1447–1454: “quadratic canonical and quasi-canonical lifts over the completed strict base” | Repaired. GrossZagierAndArithmeticHeights §7.2 supplies those objects; finite-residue comparison and higher-degree classification remain here. Counts at q₀=2,s=1 are 3 and 2. |
| R04 deformation ownership | README:65–68,258–263,1065–1075: “extends the supplied finite-residue and algebraically closed specializations” | Repaired. EndoscopicTransferAndUnitaryTraceComparison §§10.2,12.3 imported. Heights 1 and 2 give B and B[[t]]. |
| R05 native convergence and rigidity | README:197–209,477–488,1020–1027: “Using the supplied coefficient bounds and convergence” | Repaired. Native convergence, exponential estimates and finite-height uniqueness are inputs. At p=2 the logarithm coefficient bound gives norm 2 at degree 2. |
| R06 available carriers | Suggested.lean:26–40: “native evaluated points … and evaluated formal-group homomorphisms exist” | Repaired. Missing O-action, torsion/Tate data and marked deformation functor are now distinguished from available points/Hom/Iso. The new equivalence with the supplier's radical carrier needs R01 above. |
| R07 p=2 interpolation | README:608–611: “at `p = 2` the two series are equal” | Repaired. Coefficient of X² is 0 at p=2 and 1/2 for odd p. |
| R08 strictness over the residue field | README:941–943: “its integral lift … has derivative `1+p ≠ 1`” | Repaired. At p=2 the integral derivative is 3; residual X+X²+X³ has derivative 1 and is not X. |
| R09 coefficient base change | README:946–950: “restricting a `B`-based deformation functor to `O_F`-algebras is represented by base change” | Repaired. Over Z₃[√3]/(√3)² the one-parameter problem has 3 choices; imposing the extra height-one action gives 1 class. |
| R10 Honda nonintegrality | README:1188–1191: “coefficient of `X²Y²` is `−5/2`” | Repaired. At p=2 the XY coefficient is integral −1, but −5/2 is not integral. At p=3, −2/3 already fails. |
| R11 logarithm versus model | README:1229–1234,1275–1278: “strictly isomorphic to the Honda model” | Repaired. For 2X+X⁴ the logarithm coefficient is −1/14, whereas the sparse model has 1/2; the coordinate correction is nonzero. |
| R12 canonical modulus | README:1672–1679: “in `𝔪_(O_F)`” | Repaired. For π²=3, the X³ coefficient of [π]∘[π] is 4π of valuation 1; nonzero elements of 𝔪_B have valuation at least 2. |
| R13 equal uniformizers | README:872,879–887: “coincide for `u = 1`” | Repaired. Twist η=1 gives equal towers. At u=2 over Q₅ the Artin test distinguishes them. |
| R14 depth zero | README:824–825,849–853; Suggested.lean:125–128: “`U(K, 0) = O_K^×`” | Repaired. At m=0 the roots are {0} and the norm subgroup is π^Z O_K^×=K^×, not 1+O_K. |
| R15 Tate API | README:739–749: API now includes transitions, quotient, Galois action and underlying Z_p-module | Repaired. Rank-one cyclotomic T reduces to Z/pᵐ and V/T is Q_p/Z_p. At least three discriminating Checks remain. |
| R16 substitution | README:158–160,182–184: “substitution agrees with polynomial evaluation” | Repaired. Substituting 1 into polynomial X over Z gives 1 even though the constant is not nilpotent. |

The repaired patterns were sought elsewhere, including boundary levels, unit versus strict comparisons, marked versus unmarked objects, actual lattices versus homothety classes, and native versus planned carriers. All 50 target sections, their API/Checks and all 50 Needs lines were read. Unchanged targets with numeric rows in the preceding report were allowed to retain those computations; sampled, changed and finding-bearing passages received the fresh checks below. No section was accepted merely because the preceding report called it sound.

### Source sample and manifest

All eight cited works have exactly one manifest entry: LT65, LT66, H68, H70, G86, Y95, VZ07 and BKO21. Seven cached legal texts were read. The relevant Gross and Yu pages were also rendered to inspect formulas lost in extraction. LT65 remains settled as uncertified and was not requested again. No additional author-flagged unverified locator was found. Printed page numbers, rather than PDF image indices, are used below.

| Seeded target | Locator inspected | Result and scope |
|---|---|---|
| 0.1 One-dimensional formal modules | VZ07 Definition 1.1, pp.57–58, lines 2694–2712; Lemma 2.1/Definition 2.2, p.60, lines 2797–2835 | The endomorphism action, tangent condition and height convention agree. The tangent condition excludes conjugate scalar action. |
| 1.4 Coordinate independence | LT65 Theorem 1, equations (8)–(11), pp.382–383 | Settled uncertified text; not source-certified here. Coefficient and identity tests below verify the direction and expose R04. |
| 3.2 Coefficient algebra | VZ07 Theorem 1.4, pp.58–59, lines 2736–2792; p.61, lines 2844–2845 | Polynomial coefficient algebra and weighted generators agree; this is not the marked deformation ring. |
| 3.4 Lifting and rigidity | VZ07 Lemma 2.6, p.61, lines 2856–2868; Proposition 3.2, pp.62–63, lines 2903–2938; Lemma 3.3, p.63, lines 2939–2950; LT66 Proposition 2.4, pp.52–54 | Lifting and the cocycle route are supported in their settings. Finite-height uniqueness is correctly taken from the pin. |
| 3.5 Finite-height tangent space | VZ07 Corollary 3.4, Lemma 3.5, Proposition 3.6, pp.63–65, lines 2951–3013; LT66 Proposition 2.6, pp.54–55, lines 214–222 | Dimension h−1 is supported. VZ07 uses normalized formal modules over its closed residue field; arbitrary-field action-sensitive descent is additional work here. |
| 3.6 Universal finite-height deformation | VZ07 Theorem 3.8, p.65, lines 3014–3035; LT66 Theorem 3.1/Proposition 3.3, pp.56–58, lines 284–349; Y95 §2, pp.294–295, lines 85–109 | Power-series representability is supported in the stated source settings. The package fixes B explicitly, avoiding Y95's unrestricted initial-coefficient-ring assertion. See limitations and source issues. |
| 4.4 Supersingular elliptic comparison | H70 Theorem 9, pp.240–241, lines 1100–1122; Lemma 4.2, p.231, lines 738–749; H68 Corollary 4, p.212, lines 497–502; BKO21 Lemma 5.1, p.956, lines 573–588 | H70/H68 concern curves over Q in their stated theorems. The roadmap's local scalar-Frobenius/degree argument explains the wider local-lift statement; it does not claim that wider statement is literally H70 Theorem 9. Sign corrected relative to BKO. |
| 5.2 Integral lattice quotients | Y95 §3, pp.295–296, lines 116–154; G86 §5, pp.324–325, lines 180–213 | Normalized product, integral quotient, Frobenius reduction and factorization agree. The integral coordinate and marking are additional to a generic p-divisible quotient. |
| 6.2 Frobenius-marked lifts | Y95 §4, pp.296–298, lines 155–175,200–211; G86 §5, pp.324–325 | Index q₀^N gives the corresponding Frobenius twist; π_F-rescaling requires the coherent twist component. |
| 6.3 Marked/unmarked classification | Y95 Propositions 1–2, p.297, lines 185–211; corollary p.298, lines 224–230; Proposition 4, p.300, lines 305–321 | F^×-homothety versus marked lattice classes and the order-plus-module invariant agree. The cubic non-Gorenstein control is valid; see computed row below. |
| 6.5 Quadratic level classification | Y95 Proposition 4, p.300, lines 305–321; G86 Proposition 5.3, p.325, lines 204–217 | Quadratic freeness and orbit counts agree. Completed strict-base results are now imported and compared, not re-owned. |
| 7.1 Ring-class degrees | G86 Proposition 5.3(2), p.325, lines 204–217; Y95 Theorem 1, p.297, lines 212–215 | Positive-level degrees (q₀+1)q₀^(s−1) and q₀^s agree, including q₀=2; level zero is separate. |
| 7.2 Uniformizer modulus | G86 Proposition 5.3(3) and proof, pp.325–326, lines 210–235; Y95 Theorem 2′, p.301, lines 350–356, example p.302, lines 361–376 | Positive-level valuations agree. The ramified canonical value is in O_F, not generally the smaller B. Y95's unqualified quadratic boundary needs the source correction below. |
| 8.4 Fields and generators | BKO21 §2, pp.947–948, lines 225–252; §5.0.2, pp.958–959, lines 712–744; Y95 Theorem 1, p.297 | The tame quotient, shift n+1, modulus field and torsion field distinction agree. |
| 9.3 Trace square | BKO21 §5.0.2, pp.958–959, lines 734–768 | The formal-sum application supports the construction. The general square follows by transitivity through the two intermediate fields, not by quoting a separate general theorem in BKO. Its extra Check needs R05. |

The source comparison also revisited H70 §2, pp.220–223 for the repaired Honda operators and H68 Theorem 2, pp.204–205 for the sparse logarithm. No fetched text was treated as an instruction, and no source passage was copied into the package or this report.

### Computed adversarial table

“Pass” means the displayed test is consistent, not that testing proves an unformalized theorem. Residue cardinalities in Layers 1–3 are at least two; R02 concerns the different q of §4.1. Fields and the zero ring fail the DVR/uniformizer hypotheses. Characteristic-zero finite extensions are separable. The additive-characteristic-p and square-zero examples test the places where characteristic zero or finite height matters. Scalar characters factor through abelianization; the ambient absolute Galois group is not assumed abelian.

| Statement | Instances | Computed values on the two sides or competing models | Result; change |
|---|---|---|---|
| 0.1 formal action and height | Additive F_p; quadratic restriction; conjugate Q(i)-action | [p]=0 gives infinite height; restricted height 1 becomes 2, first degree q₀²; conjugate action at i has tangent −i versus required i. | Pass; tangent and scalar-ring data discriminate. |
| 0.2 points | G_m over Z₃, x=y=3; G_a with I=9Z₃ | Group sum 3+3+9=15 versus ordinary 6; ideal coordinates 9Z₃ versus supplier radical 3Z₃, with 3 only in the latter. | R01. F(0) has one point. |
| 0.3 logarithm and naturality | G_a/Z₃, φ=2X, x=3; G_m torsion | ℓ(φ(3))=6=2ℓ(3), not 3; log(ζ_p)=0 for ζ_p−1≠0. | Pass with differential on the additive target, already specified at README:401–403 and by native subst_log. No independent normalization finding. Trace consequence placement is R03. |
| 1.1 coefficient predicates | πX+X^q; πX; πX+X^q+X^(q+1) | Residual series X^q, 0, X^q+X^(q+1); degrees q,1,q+1. Zero polynomial has derivative 0≠π. | Pass; neither zero-degree nor field junk qualifies. |
| 1.2 interpolation headline | f=g, a=0,1; cyclotomic comparison p=2,3 | Unique series 0,X; coefficient c₂=0 at p=2, while 3c+3=9c gives c=1/2 at p=3. | Pass; previous R07 repaired. |
| 1.3 existence headline | F₂[[t]], f=tX+X²; cyclotomic Z₃ | f(X+Y)=tX+tY+X²+Y²=f(X)+f(Y); 1+f(X+Y+XY)=(1+X)³(1+Y)³. | Pass in equal and mixed characteristic; no good-prime shortcut. |
| 1.4 coordinate comparison | π=2, f=2X+X², g=f+2X²; u=1,3 | 2c+1=4c+3 gives c=−1, so both sides −1; f=g gives derivatives 1 and 3 for u=1 and 3. | Main comparison passes; R04 corrects “non-strict.” |
| 2.1–2.2 torsion/Tate API | h=1,q=3,m=0,1,2; quadratic O-action | Torsion ranks 1,3,9; O-rank 1 versus Z_p-rank 2 in quadratic case. T/πᵐT has qᵐ elements; V/T is divisible, not free. | Pass; API repair preserved the correct inverse limit. |
| 2.3 degree/splitting headline | Cyclotomic Q₂ and Q₃, m=1,2 | Degrees 1,2 and 2,6 equal (q−1)q^(m−1). At m=0 the primitive hypothesis is unavailable; t=0 fails the nonroot condition. | Pass; natural subtraction is guarded. |
| 2.4–2.5 Artin/norm headline | Q₅, unit 2; uniformizer; m=0 | Arithmetic Artin scalar is 2⁻¹=3 mod 5, not 2; uniformizer scalar 1. Roots at m=0 are {0}; both sides of the iff hold for every x because π^Z U(K,0)=K^×. | Pass in both directions and at depth zero. |
| 2.6 uniformizer change | u=1 and u=2 over Q₅ | u=1 gives η=1 and identical towers; u=2 gives old scalar 1/2 times twist 2 =1, whereas inverse twist gives 1/4. | Pass; distinctness is restricted to u≠1. |
| 3.1 marking and base change | [3] on G_m over Z₂/F₂; R=Z₃[√3]/(√3)² | Derivatives 3 and 1; residual map X+X²+X³≠X. Both one-parameter Hom sets have {0,π,2π}, size 3; extra height-one action gives 1 class. | Pass; strict, marked and action-preserving are distinct. |
| 3.2 coefficient algebra | XY law coefficient; X^q action coefficient | Weighted degrees 1 and q−1, respectively; q=2,3 gives 1,2 for the latter. Independently prescribed generator images lift across a surjection. | Pass; this is not the dimension h−1 deformation algebra. |
| 3.4 lifting/rigidity | h=1,2 over k[ε]/ε²; infinite-height G_a/F_q | Lift-torsor dimensions 0,1. εX^q is nonzero and reduces to zero; ε(aX)^q=aεX^q for a∈F_q. | Pass; finite-height hypothesis excludes the countermodel. |
| 3.5 tangent space | h=1,2,3; quadratic O-action versus restricted Z_p-action | Dimensions 0,1,2; the quadratic height-one action has 0 parameters, its height-two restriction has 1. | Pass; action cannot be discarded. |
| 3.6 representability | h=1,2, B with residue F₃; imperfect k with B fixed | Rings B and B[[t]]; on F₃[ε]/ε², parameter counts 1 and 3. With imperfect k, t↦aε is still indexed by a∈k, without a canonical coefficient lift. | Consistent with stated fixed-B extension; source limitation below. |
| 4.1 Honda operator | q=1 versus 2; σ nontrivial | For u=2+ΣTⁱ and ℓ=X, q=1 gives infinite coefficient 2+Σ1; q=2 gives coefficients 2,1,1 at 1,2,4. T(aX)=σ(a)X^q, not aX^q. | R02; retain semilinear coefficient action. |
| 4.2 integrality | ℓ=X+X²/p, p=2,3 | XY coefficient −1 at 2 versus −2/3 at 3; at 2 the X²Y² coefficient is −5/2. | Pass; repaired nonintegrality witness covers 2. |
| 4.3 Honda comparison | s=±1; f=2X+X⁴ | (p−sT²)ℓ_s=pX; wrong sign at p=2,j=2 gives coefficient 1 outside 2O. coeff₄(log_f)=−1/14 versus 1/2; strict correction −4/7. | Pass; model isomorphism is not equality. |
| 4.4 elliptic headline | y²+y=x³ at p=2 | Δ=−27 is a unit, #E(F₂)=3, #E(F₄)=9, a₄=−4; LT parameter −2. The two extreme counts are (p−1)² and (p+1)². | Pass; includes the small prime. |
| 5.1–5.2 integral quotients | L=T; G_m/Z₂ kernel {0,−2} | Trivial product X; normalized product −X²−2X, reduction X², target coordinate −X converts it to [2]=2X+X². Kernel cardinality 2. | Pass; normalization and integral marking retained. |
| 5.4 actual/class action | a=π_F,L=T; order-three unit class | Actual lattice T, not π_F⁻¹T whose quotient has q_F elements; homothety classes equal. Unit exponents 1 and −1=2 mod 3 give different marked classes. | Mathematical repair passes; placement R03. |
| 6.1–6.2 canonical/marked lifts | L=T; index q₀; residue degree 2 | Twist exponents 0,1; multiplication by π_F shifts exponent by 2. Height-one O_F deformation dimension 0, restricted quadratic height 2. | Pass; finite-residue and completed-base objects distinguished. |
| 6.3 classification | Cubic O=O₀+ϖ₀O_F; quadratic control | Cubic lengths length(O_F/O)=2, length(O/ϖ₀O_F)=1, total 3; 3≠2·1. Quadratic lengths 1,1,total 2 give 2=2·1. | Pass: the displayed cubic test is valid. Order alone does not classify proper lattices there. |
| 6.5 quadratic classes | q₀=2,s=1 and q₀=3,s=2 | Marked counts 3/2 and 12/9 in unramified/ramified cases; one unmarked homothety class per order. | Pass; supplied strict-base orbit compared with finite-residue orbit. |
| 6.6 field of moduli | Canonical L=T; a=π_F | Norm group π_F^Z O_F^×=F^× gives M=F; uniformizer fixes modulus although it changes lattice representative. | Pass; correct destination for R03's class action. |
| 7.1 degrees | q₀=2,3; s=0,1,2 | At s=0 degree 1. For q₀=2 positive degrees 3,6 versus 2,4; for q₀=3, 4,12 versus 3,9. | Pass; positive-level formula is not extended to zero. |
| 7.2 modulus | q₀=3,s=1,2; π²=3 canonical case | Unramified base valuations 1/4,1/12; ramified 1/3,1/9. Canonical v_F(4π)=1, while nonzero elements of 𝔪_B have v_F≥2. | Pass; canonical coefficient-ring repair correct. |
| 7.6 neighbours | p=5, basis e₁=5^(−s)t,e₂=αt | P¹(F₅) has six lines: five e₁+ae₂ and one e₂. Outward generators are 5^(−s−1)t+(a/5)αt; printed scalar multiples of t give only one lattice. | Pass; roadmap avoids source misprint. |
| 8.1–8.3 characters and directions | p=5,n=0,1,2; z=5(a+bα), cα=−α | Full degrees 24,600; Θ degrees 1,25,625; Ψ degrees 1,5,25. Projectors give 5a and 5bα; intersection 0. Dihedral group over Q₅ has order 10, not a pro-5 group. | Pass; division by 2 is confined to BKO's p≥5 setting. |
| 8.4 fields/generators | p=5,s=1,2 | Primed positive-level degrees 6,30,150; tame-fixed degrees 1,5,25. Intersection at s=1 has degree 1; compositum degree 6·5=30. Modulus t₁ degree 6 versus primitive torsion degree 24. | Pass; level shift n+1 and distinct generators retained. |
| 8.5 signs | n=0,1 | [p]w₁=[−p]v₁=v₀=w₀; [−p]w₁=−w₀. Adjacent index factor (−1)^(n+m)=−1. | Pass; formal inverse used, not naive coordinate negation. Trace assertion placement R03. |
| 9.1–9.2 traces | Q_p(√p)/Q_p; base point in p=5 tame extension | Additive trace of √p is 0; multiplicative formal trace is −p because (1+√p)(1−√p)=1−p. D_s(x)=[6]x; D_s([1/6]x)=x. | Pass; ordinary addition cannot replace formal addition. |
| 9.3 headline square and Check | p=5,s=0; deep base point with log 25; proposed w₁ | Both routes total 6·5=5·6=30 and log 750. Adjacent signs give −750 versus 750 without correction. Proposed torsion point has field degree 600, source degree 30. | Square passes; R05 replaces its invalid Check. |
| Native substitution | Polynomial X over Z, substitute 1 | HasSubst fails for nonnilpotent constant 1, but polynomial substitution returns 1. | Pass; corrected contract no longer claims value 0. |

### Lean acceptance, signatures and padding

The inspected pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

The required `lake env lean` invocation on packages/LubinTateFormalModulesAndQuasiCanonicalLifts/Suggested.lean, from the pinned content checkout, exited 0. Its only warnings were five uses of sorry, at lines 77,91,113,129,151. All three imported Tau Ceti object files were present; no build was required. There is one Mathlib import followed by three used individual TauCeti modules, no set_option, no sorry-valued data, no admitted example, no lemma declaration and no placeholder proposition.

A scratch copy with `#check @name` for every declaration also elaborated successfully. There are seven actual declarations: two predicates and five theorems. The supplied eight-entry inventory accidentally counted the word “it” in a docstring as a declaration. Both predicates retain CommRing and IsLocalRing. Both construction theorems retain IsDomain, IsDiscreteValuationRing, finite residue field and irreducible π. The field theorems retain the nonarchimedean local-field and CharZero hypotheses; the degree theorem also retains m≥1 and the root/nonroot pair. The elliptic theorem retains primality, s=±1, unit discriminant and the signed point count. No binder was lost, and nothing was changed.

All five sorried theorems were tested on a scratch copy with the one-tactic alternatives `simp`, `rfl`, `infer_instance` and `exact?`, inside `solve` so partial progress could not pass. All five goals remained unsolved; the run returned exactly five final `exact?` failures and no unrelated error. No duplicate probe statements were introduced that could let one test close another. Reading the definitions and the pinned near-matches likewise found no definition restatement, Check, small-value theorem or single-library-lemma substitute. No padding finding is raised.

| README headline/deep target | Disposition in Suggested.lean |
|---|---|
| Lubin–Tate existence and uniqueness | `exists_formalGroup_of_isLubinTateSeries`, line 77, on native FormalGroup and the real coefficient predicate. |
| Interpolation | `existsUnique_lubinTate_intertwiner`, line 91; same general DVR scope. |
| Primitive division-field degree and splitting | `finrank_adjoin_primitive_lubinTate_root`, line 113; polynomial-root presentation explicitly delimited in README §2.3. |
| Norm group under local reciprocity | `artinMap_fixes_lubinTate_roots_iff`, line 129; uses the pinned arithmetic Artin map and unit filtration. |
| Supersingular elliptic scalar-Frobenius comparison | `exists_lubinTate_endomorphism_formalGroup`, line 151; actual curve/discriminant/finite-field point carriers, including p=2. |
| Tate freeness, character formula and Galois isomorphism | Named in docstring lines 26–30; formal O-action, torsion and scalar Tate-character construction are missing, not the general point carrier. |
| Finite-height universal marked deformation | Named in lines 31–32; the action-sensitive marked deformation functor is missing. |
| Honda integrality and type comparison | Named in lines 33–34; skew operator construction is missing. |
| Quasi-canonical classification, moduli fields/degrees and uniformizer property | Named in lines 35–37; lattice quotients, markings and moduli carriers are missing. |
| BKO field comparisons and trace square | Named in lines 38–40; the specified towers and formal traces are missing. |

No demonstrably statable omitted headline or stand-in was found. All seven backticked names attributed to this roadmap resolve to its acceptance file and occur in the README. Planned supplier names were resolved to their roadmap contracts rather than falsely demanded from the pins.

### Pinned declarations actually opened

Paths below are library-relative. Name hits were followed by reading the declarations and their hypotheses.

| Object | Pinned file and line; relevant distinction |
|---|---|
| FormalGroup, IsComm, Point, map | Mathlib/RingTheory/FormalGroup/Basic.lean:57,75,127,185. The law bundles unit coefficients and associativity; commutativity is separate. Point consists of power-series coordinates satisfying substitution conditions, not evaluated local-field points. |
| Substitution and its inverses | Mathlib/RingTheory/PowerSeries/Substitution.lean:40,158,457,511,543,567 (`HasSubst`, `subst`, `substInv`, inverse identities, `substInvOfIsUnit`); Mathlib/RingTheory/MvPowerSeries/Substitution.lean:217,228 (`subst`, `subst_coe`). Nilpotent constants and the polynomial exception were checked. |
| Evaluation and coefficient map | Mathlib/RingTheory/PowerSeries/Evaluation.lean:60,157,197 (`HasEval`, `eval₂Hom`, `comp_eval₂`); PowerSeries/Basic.lean:467 (`map`). Complete Hausdorff linear topology and continuity hypotheses were retained. |
| Weierstrass preparation | Mathlib/RingTheory/PowerSeries/WeierstrassPreparation.lean:689,814, quotient algebra equivalence and existence of factorization. Adic completeness and nonzero reduction are not dropped. |
| Local field, DVR and residue carriers | Mathlib/NumberTheory/LocalField/Basic.lean:46; RingTheory/DiscreteValuationRing/Basic.lean:56; RingTheory/Valuation/Integers.lean:32; RingTheory/LocalRing/ResidueField/Defs.lean:28,36. The local-field class includes nontrivial valuation/local compactness; the DVR condition excludes fields. |
| Polynomial/Galois/extension carriers | Mathlib/Algebra/Polynomial/Degree/Defs.lean:59 (`Monic`); FieldTheory/IsAlgClosed/AlgebraicClosure.lean:127; FieldTheory/IntermediateField/Adjoin/Defs.lean:34; FieldTheory/AbsoluteGaloisGroup.lean:42,101. The abelianization used is topological. |
| Krasner and local models | Mathlib/Analysis/Normed/Field/Krasner.lean:56,63; Analysis/Normed/Unbundled/SpectralNorm.lean:381; RingTheory/DedekindDomain/AdicValuation/Completion.lean:51,294. The Krasner input requires the specified separability/splitting and strict-distance hypotheses. |
| Witt/finite fields and curves | Mathlib/RingTheory/WittVector/Defs.lean:52; FieldTheory/Finite/GaloisField.lean:68; AlgebraicGeometry/EllipticCurve/Weierstrass.lean:131,230; Affine/Point.lean:477. These are actual discriminant, base-change and point carriers. |
| Native formal Hom/Iso and points | TauCeti/RingTheory/FormalGroup/Hom.lean:137,351; TopNilpotentPoint/Basic.lean:85; TopNilpotentPoint/Hom.lean:42. Points have a coordinate and HasEval proof; their group structure uses complete Hausdorff linear topology. They do not bundle an O-action. |
| Native logarithm/exponential/rigidity | TauCeti/RingTheory/FormalGroup/Logarithm/Convergence.lean:44,57,62,68; Exponential/Padic.lean:76; Rigidity.lean:186,229. These already supply coefficient bounds, convergence and finite-height uniqueness. Logarithm/Naturality.lean:62,138,149 retains the derivative factor for Hom and strictness for the strict comparison. |
| Elliptic formal point maps | TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Basic.lean:58,75,83; AdicPoint.lean:69; Point/Hom.lean:149; Point/AdicCompletion.lean:273,292; Point/Range.lean:158. The injectivity/range claims are used only in the stated Dedekind adic-completion presentation. |
| Reciprocity and filtration | TauCeti/NumberTheory/ClassFieldTheory/Local/ArtinMap.lean:114,132,205,345,397; NumberTheory/LocalField/UnitFiltration/Basic.lean:104,145; TauCeti/RingTheory/Henselian/Teichmuller.lean:94; TauCeti/NumberTheory/NumberField/Global/Approximation/Weak.lean:208. Arithmetic normalization and the separate depth-zero unit group agree with the package. |

### Ownership, supplier resolution and order

The board-package index was read before any absence conclusion. The main checkout and the supplied open-head index were searched by object using `roadmaps grep`, including formal modules, finite-height rigidity, lattice/quasi-canonical lifts, division towers and formal traces. Relevant heads were read with `roadmaps show`; main roadmaps were read directly where main is the permitted supplier. Main BordismFormalGroups, EllipticCurves and ModularCurves also supplied the house-style comparison.

| Citation/ownership boundary | Current evidence and resolution |
|---|---|
| RelativeFarguesFontaine §2.5 | New-roadmap pull request #1209, TauCetiRoadmap/RelativeFarguesFontaine/README.md:1296–1310, constructs the finite tower and character. Imported at README:236–242; this package retains primitive-polynomial coordinates and their comparison. |
| GrossZagierAndArithmeticHeights §7.2 | Pull request #1487, TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md:2944–2985, owns completed strict-base quadratic lifts, orders, fields and orbit facts. Imported at README:246–254. This package owns finite-residue descent/comparison and higher-degree lattices. |
| EndoscopicTransferAndUnitaryTraceComparison §§10.2,12.3 | Pull request #999, TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:3623–3635,4593–4605, supplies finite-residue and algebraically closed deformation specializations. Imported at README:258–263; the fixed-B extension and comparison are distinct. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | Pull request #879, TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md, §§R07.1.1,1.8,1.12,1.13,1.20,1.20a,2.6–2.8 (sections beginning near lines 591,988,1160,1220,1737,1780,3236,3289,3326). Frobenius, Tate, formal Lie, quotient and comparison contracts exist. The carrier mismatch at its line 1192 is R01. |
| RamificationOfCompleteDiscretelyValuedFields §4a.3 | TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields/README.md:1185–1195 supplies the completed maximal-unramified base. It is earlier in the merge order. |
| BordismFormalGroups §§F1,F5 | Main TauCetiRoadmap/BordismFormalGroups/README.md:46 and 543 supply formal-group/logarithm/Lazard and ordinary deformation foundations. The open revision #1808 was inspected for overlap, but was not substituted for main as a supplier. |
| EllipticCurves | Main TauCetiRoadmap/EllipticCurves/README.md, Layers 1,3 and the formal-group milestones near line 637. Elliptic curves, isogenies and the formal completion are imported, not reconstructed here. |
| ModularCurves | Main TauCetiRoadmap/ModularCurves/README.md, §§0B,0C,2B,7C–7F (near lines 688,779,1243,2417,2427,2442,2528) supply finite flat quotients, algebraization and deformation comparisons. |
| ClassFieldTheory | Main TauCetiRoadmap/ClassFieldTheory/README.md, Layers 6–8 (near lines 1150,1204,1466), including naturality. Its former-numbering map at lines 260–268 preserves legacy references. It excludes building Lubin–Tate reciprocity, so this is not a supply cycle. |
| LocalFieldsRamification | Completed/LocalFieldsRamification/README.md, Layers 0–2, including Layer 2 near line 576. Supplies local fields, units/logarithms and unramified extension facts; completion of the maximal unramified extension is separately assigned above. |
| Closest open roadmaps | #1692 AnticyclotomicLocalUnits owns local units and its application point systems; #1474 FunctionFieldArithmetic imports the formal-module input and owns its equal-characteristic arithmetic application; #1484 EllipticCurveModularityWild3Adic owns a modularity application. Their scope/contracts were inspected, with no second ownership of this package's general construction found. |

The supplied overlap audit, computed from main `5fc1aa8` and the 439-head index, reports no conflicting head, dropped cited id, or only-open-revision id for this package. Its five nearest roadmaps were inspected, including #879 and #1808. Re-running `roadmaps overlaps` could not identify this not-yet-ported package by name; that failed lookup was not treated as a new clean overlap result. The citation resolver's four leads are planned supplier API names, not nonexistent pinned declarations. No new unresolved supplier citation was found. No duplicate fully qualified Lean declaration was found in the readable roadmaps or pinned libraries.

The required dependency command returned:

```text
depcheck: 236 roadmaps, 2138 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. All external Needs/supplier citations were read and resolved. No forbidden supplier is used. There are no declared gaps in the plan or README and no conditional-gap acceptance is claimed. Internal comparison placement is separately reported in R03.

### Shape and policy checks

The README has the required opening summary, scope, conventions, exact contracts, build description, ten mathematical layers, per-layer Examples and Dependencies, downstream discussion and references. All definitions have an API list and at least three Checks; R04–R05 concern the validity of particular Checks, not their count. The repaired Tate API is present. Theorems retain hypotheses and locators; the sampled source-scope qualifications are recorded above. The organization combines formal-module construction, deformation, Honda theory, integral quotients and marked moduli toward its own endpoints; it does not announce following a source or name layers after source chapters. The ordering defect is the explicit reverse comparison use in R03, not resemblance to a source's necessary order.

No route-specific/general-prime restriction, computational algorithm, copied source passage, new re-planning of an existing roadmap, process residue, pull-request number, machine path, HTML anchor, target-number catalogue or forbidden Lean option was found in the authored README/Lean. The BKO restriction p≥5 is confined to that application; the general Lubin–Tate, deformation, quadratic and elliptic targets retain the stated generality. The metadata is valid. No change to the pinned libraries, merge order, content checkout or any authored package file was made.

## Not verifiable

- LT65, Formal complex multiplication in local fields (1965), remains **uncertified** under its existing manifest key. The sampled §1.4 locator (Theorem 1, equations (8)–(11), pp.382–383) and its other construction/reciprocity locators could not be checked against legal full text here. This settled status was respected; no fetch or renewed missing-reference request was made.
- VZ07's normalized/closed-residue-field results and LT66's ordinary formal-group results do not themselves constitute a written proof of every action-sensitive, arbitrary-imperfect-residue-field extension in §§3.5–3.6. The additional fixed-B finite-jet/descent route was reviewed as a roadmap proof route, with the computed controls above, not certified as a verbatim theorem of those sources.
- H70 Theorem 9 and H68 Corollary 4 are not literally the arbitrary local-lift theorem in §4.4. The roadmap provides the additional scalar-Frobenius argument. The source locator is checked in its actual scope; elaboration with sorry does not verify that mathematical argument.
- Ownership was checked against the main checkout, board index and the relevant open heads exposed by the supplied roadmap service/index. No claim is made about unavailable or subsequent heads, or about sources outside those supplied records. All source-dependent work possible without LT65 was completed; no new missing source was requested.

## Source issues

- **Misprint** in BKO21 at Lemma 5.1(ii), printed p.956 (lines 573–588): the source says trace 2sp corresponds to type p+sT²; it should be type p−sT² for parameter sp; affects a stated result.
- **Misprint** in BKO21 at the proof of Theorem 5.5(ii), printed p.959 (lines 754–758): the source says outward neighbours are represented by scalar multiples of the same Tate vector; it should be the distinct lines with generators p^(−s−1)t+(a/p)αt; affects the proof.
- **Misprint** in BKO21 at the proof of Theorem 5.5(ii), printed p.959 (lines 758–765): the source says the conjugates in the outward trace are indexed by x_s; it should be x_(s+1); affects the proof.
- **Misprint** in BKO21 at §2, printed p.948 (lines 247–249): the source says the anticyclotomic extension is pro-p over Q_p; it should be pro-p over Φ and dihedral over Q_p; affects a stated result.
- **Error** in Y95 at §2, printed p.294 (lines 85–88): the source says its coefficient-algebra category has an initial object for every residue extension k′; it should be restricted appropriately or use a specified coefficient algebra B; affects a stated result.
- **Error** in Y95 at the quadratic example of §6, printed p.302 (lines 372–376): the source says the quadratic formula and prime-modulus assertion cover every level; it should be restricted to positive level in the unramified case, treating the canonical lift separately; affects a stated result.

For the fifth source issue, k′=F_p(t) (or an analogous imperfect extension of the stipulated constant field) and k′[ε]/ε² give two residue-compatible maps from any proposed initial coefficient algebra: residue a↦a and a↦a+ε·d(a)/dt. They differ on a lift of t, contradicting uniqueness. For the sixth, the printed unramified formula at q=2,s=0 gives valuation 2/3 in a degree-one ring-class field, whereas valuations of nonzero elements there are integral; the normalized canonical modulus can be zero. The package already avoids both assertions by fixing B and separating level zero.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "5f52739211403c500989e7000c38531583d82a33", "job": "REV-PKG-LubinTateFormalModulesAndQuasiCanonicalLifts~3", "model": "gpt-6-astra", "worker": "chris-10"} -->
