# Review of CanonicalModelsAndGonality (pull request #1726 at 9c138c9)
**Verdict:** needs changes

## R01 (P1) — Composite hyperelliptic pencils are incorrectly excluded

Location: `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:804`: “no pencil of degree `3, …, g` exists”.

Claim: the factorization of every low-degree function through the hyperelliptic field excludes all those degrees.

Witness: over characteristic zero, `F = k(x,y)`, `y² = x⁹ − 1`, has genus 4. The function `x²` gives `[F:k(x²)] = 2·2 = 4 ≤ g`.

Repair: say every such pencil factors through the degree-two pencil, hence its degree is even; exclude **odd** degrees from 3 to g. Retain the Castelnuovo argument excluding degree three. Add this degree-four example: the corrected statement predicts factorization and degree four, exactly as computed.

## R02 (P1) — Uniqueness of a cyclic subgroup does not descend its generators

Location: `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:919`: “the trigonal automorphism of a cyclic trigonal field of genus `≥ 5`”.

Claim: that automorphism is unique and therefore defined over the ground field.

Witness: `y³ = x⁷ − 1` over ℚ has genus 6. Over ℚ(ζ₃), `σ(y)=ζ₃y`; conjugation sends σ to σ⁻¹, which is different from σ.

Repair: distinguish the unique degree-three pencil and its Galois-stable order-three subgroup from either generator. Descend an individual automorphism only when it is fixed by the semilinear action. In the witness the quotient ℚ(x) descends, but neither generator does. Keep the hyperelliptic and high-genus bielliptic involution conclusions: order two has only one nonidentity generator. This also reconciles §6.5 with §6.6's “up to inversion”.

## R03 (P1) — The graded-normalization proof assumes away every singularity

Location: `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:534`: “one-dimensional graded domain”; line 537: “conductor … contains a power of the irrelevant ideal”.

Claim: these properties justify the eventual Hilbert polynomial and bounded normalization defect.

Witness: for the cuspidal cubic, `R=k[s³,s²t,t³]` has dimension 2. Its normalization is the third Veronese ring; their degree-m dimensions are `3m` and `3m+1` for every m≥1.

Repair: use a dimension-two homogeneous coordinate ring, finite graded normalization, and the quotient supported at finitely many points of Proj. Its Hilbert polynomial is constant, not eventually zero. State the finite-normalization and Hilbert-polynomial inputs explicitly. The corrected argument gives deficiency one for the cusp; an irrelevant-ideal power in the conductor would incorrectly force deficiency zero in high degree.

## R04 (P1) — The hyperelliptic canonical-ring equation loses characteristic two

Location: `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:654`, especially lines 657–659: the general hyperelliptic companion uses `y² = f`.

Claim: this is the relation over the algebraic closure under the section's perfect-field hypotheses, which include characteristic two.

Witness: in characteristic two, `y²+y=x⁵` is a smooth genus-two function field. Its canonical ring has weights (1,1,3) and relation `w²+v³w=u⁵v`, whose w-derivative is v³, not zero.

Repair: retain the general relation `w²+h₃(u,v)w=f₆(u,v)` in genus two and the corresponding linear term in the higher-genus presentation. Restrict the square-only presentation to characteristic different from two. The example then has h₃=v³ and f₆=u⁵v. `voight2022` lines 760–780, equation (2.3.2), explicitly keeps both terms.

## R05 (P1) — Algebraic equivalence is being used as rational equivalence in Chow

Location: `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:841`, especially line 844: `c(π_* (𝒫(E) ⊗ 𝒪_E)) = 1` because its summands are algebraically equivalent to the trivial bundle.

Claim: the displayed Mattuck/Porteous calculation holds in the Chow ring used in §5.3.

Witness: on a complex elliptic curve, the normalized Poincaré bundle restricted at a non-torsion point Q is `L_Q∈Pic⁰`; `c₁(L_Q)=[Q−O]≠0` in `CH¹`, also with rational coefficients.

Repair: perform the stated Chern-character computation in an explicitly defined numerical/algebraic-equivalence quotient with rational coefficients, supply the comparison and degree maps, and use its nonzero class to prove nonemptiness. Alternatively keep Chow and supply the missing correction terms. In the witness c₁ remains nonzero in Chow but becomes zero numerically; the theta degree remains one. The supplier already distinguishes these notions: `TauCetiRoadmap/SchemeAndStackFoundations/README.md:6718` gives this elliptic negative control.

## R06 (P1) — Layers 4 and 9 are explicitly mutually dependent

Location: `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:1325`: “4.4 needs 9.4, so the pair 4.4/9.4 is built together”; line 1333 makes Layer 9 depend on Layers 2–4.

Claim: the numbered layers form a usable build order.

Witness: §4.4 imports the Hilbert/cohomological genus identification from §9.4; the stated Layer 9 contract imports Layer 4. The declared layer graph contains `4 → 9 → 4`.

Repair: split out the image construction and Hilbert/cohomological genus comparison, place them before §4.4, and place the later smoothness/normalization comparisons after local delta theory. Give each target its own dependencies. Then the cusp calculation follows `p_a=1`, `g=0`, `δ=1` without importing a later layer back into itself. The cross-roadmap checker does not detect this internal cycle.

## R07 (P1) — The worker's build gate fails on the module-system warning

Location: `TauCetiRoadmap/CanonicalModelsAndGonality/Suggested.lean:1`.

Claim: the submitted acceptance file passes the required gate.

Witness: the supplied gate has `build=1 FAIL`: importing module-system Mathlib from this legacy file emits a module warning. A repeated targeted build reproduces it, although the compiler exits successfully.

Repair: add the `module` header before the imports, then rerun the targeted build and gate. A scratch copy with that header elaborates successfully with only the 50 expected `sorry` warnings. No change to the reviewed file was made. This finding records the required failing gate, not a nonexistent type error.

## R08 (P2) — Residue-field coordinates require a separability hypothesis

Location: `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:744`: local coordinates over κ(p), followed by `r_p = 1 ↔ δ_p = 0` and the residue-weighted multiplicity inequality.

Claim: the geometric multiplicity so obtained computes intrinsic regularity and delta over arbitrary fields.

Witness: over `k=𝔽₂(a)`, take `y²=x³+a` at `p=(x,y²−a)`. Its local ring is a DVR with parameter x and δ_p=0. After adjoining √a, the equation is the multiplicity-two cusp `v²=x³`.

Repair: distinguish intrinsic local multiplicity from multiplicity after inseparable base change. State the residue-coordinate and ordinary-point formulas with κ(p)/k separable, or with an appropriate smooth ambient-coordinate hypothesis; give the imperfect-field comparison separately. Do not restrict the entire roadmap to perfect fields. In this example the original proposed lower bound is `0≥2`; the corrected intrinsic calculation is r=1 and δ=0, while the geometric cusp has r=2 and δ=1.

## R09 (P2) — Frey's proof needs the repeated-class case and an actual degree

Location: `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:992`, especially lines 993–996.

Claim: infinitely many points of degree at most d provide infinitely many degree-d divisors whose classes force a positive-dimensional translate.

Witness: on ℙ¹ over ℚ, infinitely many degree-one points all map to the single point of Pic¹. The closure has dimension zero, not at least one.

Repair: choose e≤d with infinitely many degree-e points. If two distinct effective divisors have the same class, obtain a pencil of degree at most e immediately. Otherwise apply the closure theorem to infinitely many distinct classes and obtain the bound 2e≤2d. On ℙ¹ the first branch yields gonality one. This split is visible in `belov` lines 525–533; do not infer dimension from infinitely many divisors alone.

## R10 (P2) — Separate maps from birational models, and compare fractions by cross-multiplication

Location: `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:521` and `:566`.

Claim: `(x,1)` is a `Model k F 1` for every transcendental x; expressions of the same function “agree modulo” the homogeneous ideal.

Witness: on `y²=x³−x`, the ratios of (x,1) generate k(x), of index two, not F. On ℙ¹, (X,Z) and (2X,2Z) represent the same function, but their components differ modulo I=0.

Repair: call `(x,1)` a pencil/map; it is a model of F only when F=k(x). For equal-degree expressions require `AB'−A'B∈I`, retaining nonzero evaluated denominators; homogenize before comparison when needed. The examples then give map degree two and cross-product zero, respectively. Keep the source/target fields explicit for maps of models.

## R11 (P2) — The independently quantified balancing lemma is too broad

Location: `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:1087`: “for every nonconstant `f : X → S²`”.

Claim: nonconstancy suffices for Möbius balancing.

Witness: a smooth nonconstant map can be constant on 90% of the surface's area. After every Möbius transformation, its pushforward retains that atom; the barycentre component toward the atom is at least 0.9−0.1=0.8.

Repair: explicitly carry “holomorphic nonconstant” from the surrounding Li–Yau statement into this sub-milestone, or formulate Hersch's lemma for the required atomless measure. Nonconstant holomorphic maps have finite fibres, so their area pushforwards have no atoms. The plateau map is excluded; the identity of the round sphere has barycentre zero. This does not dispute the correctly restricted Li–Yau conclusion.

## R12 (P2) — Statable headline parts are missing, and unstatable ones are unnamed

Location: `TauCetiRoadmap/CanonicalModelsAndGonality/Suggested.lean:18`, `:411`, `:450`; README §§1.7–1.8, 3.7–3.8, 7.5, 8.6, 9.3.

Claim: the file is an acceptance test for the advertised end theorems.

Witness: `petri` excludes trigonal curves and plane quintics; a genus-four (2,3) canonical complete intersection requires a cubic. Its existing native `Model`, ideal, and homogeneous-polynomial carriers can express the missing degree-two-and-three generation theorem.

Repair: state the exceptional half of Petri, the advertised geometric finite-field bound and algebraically-closed-extension invariance on the existing field/compositum carriers. Match Max Noether's perfect-field generality, or separately state its general descent form using the actual geometric predicate. Replace “other targets … README only” with a named list identifying each genuinely missing carrier, particularly isolated-point finiteness, analytic Li–Yau/Abramovich, and scheme comparison. The genus-four example must be covered by the completed Petri acceptance theorem; excluding it does not test the promised conclusion. No free predicates or weakened substitutes are needed.

## R13 (P2) — The generic no-retraction theorem already has an owner

Location: `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:1089`, which makes the closed-ball topological input a new milestone here.

Claim: this roadmap owns that foundational theorem and proves it using sphere degree.

Witness: `TauCetiRoadmap/AlgebraicTopology/README.md:393` assigns the single generic no-retraction/Brouwer theorem there; lines 406–415 give `noRetraction_diskBoundary`. `TauCetiRoadmap/DifferentialGeometry/README.md:890` supplies the degree comparison.

Repair: import the existing AlgebraicTopology Stage 0 item 7 contract and, only if the chosen route needs it, DifferentialGeometry §10.5. Keep the measure-balancing argument here. For the two-dimensional disk the forbidden retraction would force the identity of ℤ to factor through zero in boundary homology; the existing supplier already provides that obstruction. This is a local ownership repair, not grounds to reject the entire new roadmap.

## R14 (P3) — Supplier descriptions mix the pin with an unpinned library branch

Location: `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:296`, `:324`, `:335`.

Claim: Mathlib's `IsGalois.of_fixed_field` needs finite-dimensional F/k, and the listed Tau Ceti pin is a91d3aa; later module paths on “main” are treated as suppliers.

Witness: pinned `Mathlib/FieldTheory/Galois/Basic.lean:92` has no ambient finite-dimensional hypothesis for `of_fixed_field`. The manifest's Tau Ceti revision is 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a.

Repair: describe each declaration's actual hypothesis separately and use the manifest pin. Repoint beyond-pin results to their named AlgebraicCurves sections on main, rather than an unpinned library branch. The finite subgroup acting on k(t) is a valid test: its fixed-field extension is finite although k(t)/k is not. Keep the distinction from Mathlib's finite-ambient `finrank_fixedField_eq_card`.

## R15 (P3) — Library wrappers are padding in the acceptance file

Location: `TauCetiRoadmap/CanonicalModelsAndGonality/Suggested.lean:78`, `:346`, `:351`, `:521`, `:527`, `:536`.

Claim: these bridge checks belong among the roadmap's headline acceptance theorems.

Witness: `finrank_regularDifferentials` is exactly the imported `finrank_weilDifferentialFiltration_zero`; `isFunctionField_fixedField` is `hF.fixedField H`. The source bodies already display these one-step wrappers; `hurwitz_fixedField` only instantiates the imported genus formula.

Repair: delete them from `Suggested.lean`; cite the native results in supplier contracts and keep any useful Checks in the README. Delete the regular-differentials abbreviation when its sole wrapper is removed. The Nat.infimum bound is likewise an API fact, not a deep headline. Direct one-tactic probes of all 50 sorried declarations closed none with `simp`, `rfl`, or `infer_instance`; that does not justify retaining wrappers already proved by exact library applications.

## R16 (P3) — Several sampled targets have no exact locator; Petri's locator is wrong

Location: `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:562`, `:637`, `:671`, `:913`, `:1015`.

Claim: each target is supported at an exact source locator.

Witness: §§2.6, 3.6, 6.5 and 7.6 give no theorem/page locator at the claim. Saint-Donat's theorem on printed p.157 is unnumbered, not “Theorem 1”; the exceptions are analyzed in §§4.11–4.13, pp.174–175.

Repair: add exact locators for each assertion or identify it as a derived target with its individually located inputs. Cite Saint-Donat's unnumbered theorem with the genus-three correction and §§4.11–4.13. For the arbitrary-characteristic route in §4.6 include Fulton's Appendix A, p.113: §7.4's preliminary general-position lemma explicitly assumes characteristic zero. The genus-three quartic and characteristic-two tests in the table distinguish the repaired citations.

## R17 (P3) — Definition Checks and target dependencies are not in roadmap form

Location: `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:262`, `:511`, `:816`, `:1318`.

Claim: the global conventions table, prose APIs and worked examples provide the required per-definition specification.

Witness: there are no `*Needs:*` lines or per-definition `**Checks.**` lists, and no per-layer Examples/Dependencies subsections. For example the norm and coordinate-expression definitions lack three attached discriminating Checks.

Repair: use the requested Summary, Conventions, Exact supplier contracts and How to read the build headings; put prose API bullets and at least three discriminating Checks with each definition, and dependencies with each target. Split the cyclic layer schedule as in R06. Useful norm tests are an unramified residue-degree-two point (coefficient two), a ramified rational point (coefficient one), and the zero divisor (zero); these distinguish norm from conorm. Keep process narration and unavailable declaration names out of the mathematical specification.

## R18 (P3) — The conventions overstate the zero case and disagree on delta's type

Location: `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:266`, `:272`; `Suggested.lean:71`, `:301`.

Claim: the gonality definition's zero value occurs only for algebraic extensions, and model delta is natural-valued.

Witness: for F=k(s,t), every transcendental x leaves infinite-dimensional F/k(x), so every `Module.finrank` is zero and gonality is zero. The Lean definition of delta returns ℤ, not ℕ.

Repair: describe zero only under the actual one-variable function-field hypotheses, or explicitly acknowledge the total definition's junk values outside them. Describe delta as an integer with a nonnegativity theorem (or change the body/type consistently). For a cusp delta is the integer 1; for k(s,t) the raw definition remains zero without being advertised as geometric gonality.

## R19 (P2) — Abel-map surjectivity must be kept at the scheme level

Location: `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:955`: the Abel map is introduced “on k-points”, then asserted surjective for d≥g.

Claim: the unqualified surjectivity can be applied to the just-introduced map on rational points.

Witness: the real conic `x²+y²+z²=0` has g=0 and no real points, whereas `Pic¹(ℝ)` has one point. Thus `X(ℝ)→Pic¹(ℝ)` is empty-to-singleton at d=1≥g.

Repair: state explicitly that `a_d:X^(d)→Pic^d` is surjective as a scheme morphism only. Keep represented line-bundle classes separate from rational Picard-scheme points and retain the Brauer obstruction. `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4960` explicitly makes this distinction, and its §3.6 conic Check computes the counterexample. The corrected scheme statement remains true for this conic.

## Verified sound

Both files were read in full; instance tests are not proofs. The 15 seeded targets were examined below; unavailable texts are distinguished from verified locators. No README locator was explicitly marked “unverified”. The condensed adversarial table retains the sampled targets, headline tests and finding witnesses. Passing rows certify only the displayed tests.

The head and folder scope match the brief. The diff outside this roadmap folder is empty. No `set_option`, sorry-valued data, admitted examples, foreign roadmap imports or copied source passages were found. There is no basis here to reject the scope as a wholesale replacement of an existing roadmap. R13 is a specific ownership overlap. Quadratic transformations are being used for mathematical existence, not executable computational infrastructure.

Direct `lake env lean` elaboration of the original file exits successfully with 50 `sorry` warnings. The targeted module build also succeeds, but emits the extra module-system warning rejected by the worker gate (R07). A scratch `module` header copy elaborates. A separate scratch copy tested all 50 admissions with single-tactic `simp`, `rfl`, and `infer_instance`, then printed every actual named declaration using `#check @…`: 75 named declarations, rather than the scanner's 76 (its extra `list` is prose). No tested admission closed. Comparison of the types confirms that the reported dropped `[Finite H]` on `isIntegrallyClosedIn_fixedField` is intentional and harmless: exact constants descend to every intermediate field. The material generality mismatch is the algebraically-closed-only acceptance signature versus the perfect-field canonical claims, R12. No test file or report changes the PR.

The dependency check returned exactly:

```text
depcheck: 204 roadmaps, 1617 edges, 0 problem(s)
```

There is no cross-roadmap UPWARD or CYCLE line. Its clean result does not resolve the expressly declared internal layer cycle in R06. The supplied gate has every scanner at zero except `build=1 FAIL`; this review therefore cannot accept the folder.

### Computed adversarial tests

The rows give actual values, including failed cases. In the table, k(t) means a rational function field; numerical genus examples use characteristic zero unless another characteristic is specified. Nonexamples outside a carrier (zero rings, empty curves, q=1) are excluded by the field/function-field/connected-curve hypotheses, not silently assigned geometric meanings.

| Statement | Instances | Computed values on the two sides | Result / required change |
|---|---|---|---|
| 1.1 gonality definition; positivity | k(t), k, and k(s,t) | sInf positive function degrees=1; empty inf=0 for k; finrank=0 for every x in transcendence degree two, so inf=0 | First two behave as intended; correct unrestricted zero claim, R18 |
| 1.1 attainment and gonality_le_finrank | t and t² in k(t) | gon=1; degrees 1 and 2; minimum attained at t, 1≤2 | Pass; simple infimum API belongs in README |
| 1.2 divisor-pencil equality | ℙ¹, D=0, ∞, 2∞ | ℓ(D)=1,2,3; smallest pencil degree=1=gon | Pass both directions; D=0 excluded |
| 1.3 rationality iff gonality one | ℙ¹ and smooth elliptic curve | gon=1 with rational field; elliptic gon=2 and g=1≠0 | Pass both directions on these cases |
| 1.3 degree-one-divisor bound | g=0,1,2 with rational point | gon=1,2,2 ≤ g+1=1,2,3 | Pass; rational divisor hypothesis matters |
| 1.3 canonical bound and genus two | g=2 hyperelliptic; g=3 quartic; g=1 excluded | 2≤2g−2=2; 3≤4; at g=1 proposed RHS would be 0<2 | Pass with g≥2 |
| 1.4 index definition and divisibility | ℙ¹, real anisotropic conic | degree images ℤ and 2ℤ; index=1 and 2; anticanonical degree2 divisible by both | Pass |
| 1.4 genus-zero value | split and nonsplit real conic | (index,gon)=(1,1),(2,2); complex base change gives (1,1) | Pass |
| 1.4 genus-one value | pointed elliptic; index-three genus-one field | gon=2=max(2,1); gon=3=max(2,3) | Pass formula; Selmer identification not independently certified |
| 1.5 hyperelliptic iff gonality two | genus-two Artin–Schreier y²+y=x⁵; rational field | g=2, degree(x)=2 separable; rational field has gon=1 and predicate false | Pass in characteristic two with genus hypothesis |
| 1.6 norm definition; degree_norm | unramified point with residue degree2; ramified rational point | norm coefficients 2 and 1; degrees 2=2·1 and 1=1·1; norm(0)=0 | Pass; distinguishes residue degree from ramification |
| 1.6 gonality inequalities | elliptic double cover of ℙ¹; identity | 1≤2≤2·1; identity gives gon≤gon≤gon | Pass directions |
| 1.7 algebraic base extension | real anisotropic conic to ℂ | gon drops 2→1, so 1≤2; equality over ground field fails | Pass direction |
| 1.7 choice and algebraically closed extension | rational field; smooth genus-three plane quartic over Qbar then ℂ | gon=1 on both rational fields; gon=3 over each algebraically closed field | Pass instances; acceptance statement missing, R12 |
| 1.8 rational point bound | ℙ¹/F₂; Klein/F₈; Picard/F₇ | 3=1·3; 24≤3·9=27; 12≤3·8=24 | Pass; last bound only forces gon≥2 |
| 1.8 geometric Frobenius argument | ℙ¹/F₂ with z=t, before removing pole | σ(z)−z²=t−t² has degree2 and zeros 0,1; infinity is the pole; degree comparison 1≠2 | Pass; pole-avoidance step is necessary to count all three points |
| 1.10 enlarged constant field | F=ℂ(t) as ℝ-field | gon_ℝ=2=[ℂ:ℝ]·gon_ℂ=2·1 | Pass; exact-constant assumption intentionally absent |
| 2.1 Model, generation and nonzero coordinates | (t,1) in k(t); (x,1) in elliptic F | first generated field index1; second index2; zero tuple violates nonzero field | First accepted, second must be rejected as Model, R10 |
| 2.1 model divisor, scaling sign and degree | (t,1); multiply by 1/t | D=∞; scaled D=0-place; D−div(1/t)=∞−(∞−0)=0-place; both degree1 | Pass; not invariant as a divisor under scalar multiplication |
| 2.2 homogeneous ideal and primality | conic parametrization (s²,st,t²) | I=(XZ−Y²); quotient domain; I₁=0; zero polynomial lies in I; 1 does not | Pass; fixed degree homogeneity retained |
| 2.3 Hilbert polynomial, arithmeticGenus, genus_le, delta | line, smooth cubic, cuspidal cubic | H(m)=m+1,3m,3m (large m); (p_a,g,δ)=(0,0,0),(1,1,0),(1,0,1) | Conclusions pass; proof defect R03 |
| 2.3 normalization/conductor argument | cuspidal cubic, m≥1 | dim R=2; H_normal−H_R=(3m+1)−3m=1, not eventually0 | Fail, R03 |
| 2.4 IsBasePointFree | ℙ¹: D=0, ∞, −∞ | ℓ(D)=1,2,0; removing rational point gives0,1,0; first two BPF, last not | Pass; zero divisor can be BPF |
| 2.4 IsVeryAmple; very ample implies BPF | ℙ¹: D=∞ and D=0; E=2P | ℓ(∞−2P)+2=0+2=2=ℓ(∞); ℓ(−2P)+2=2≠1=ℓ(0) | Pass; BPF alone insufficient |
| 2.5 degree ≥2g and ≥2g+1 | elliptic curve D=2O,3O | dimensions2,3; degree2 map is two-to-one, degree3 gives plane cubic embedding | Pass; thresholds discriminate |
| 2.6 existence of coordinate expressions | ℙ¹ coordinates (t,1), f=(t+1)/(t−1) | A=X+Z,B=X−Z; aeval ratio=(t+1)/(t−1); B≠0 in k(t) | Pass |
| 2.6 equality of expressions | (X,Z),(2X,2Z), char0 | fractions equal; component differences X,Z nonzero in I=0; cross-product 2XZ−2XZ=0 | Require cross-product equality, R10 |
| 2.6 maps and map degree | ℙ¹→ℙ¹, t↦t²; identity | field indices2 and1; forms (X²,Z²) and (X,Z) respectively | Pass after separating maps from Models |
| 3.1 differential dimension and effective canonical divisors | ℙ¹, elliptic, genus-two curve | dim Ω(0)=0,1,2; canonical degrees −2,0,2; effective canonical divisor impossible only in first case | Pass; native wrapper R15 |
| 3.1 differential/RR isomorphism | elliptic nonzero regular ω | div(ω)=0; dim L(0)=1=dim Ω(0); 1 maps to ω≠0 | Pass; zero ω excluded |
| 3.2 base-point-free canonical system | g=1, W=0; g=2 rational P | ℓ(W),ℓ(W−P)=(1,0),(2,1) | Pass; genus-one map is constant |
| 3.3 canonicalField independence and basis ratios | hyperelliptic g=3, basis ω,xω,x²ω | ratios generate k(x); multiply ω by a≠0, ratios unchanged; [F:k(x)]=2 | Pass; no birational Model on F in this case |
| 3.3 canonicalModel; divisor and faithful projective action | smooth plane quartic, g=3 | basis size3, projective dimension2, degree2g−2=4; coordinate ratios generate F | Pass; no canonical Model when field index2 |
| 3.4 Noether equivalences | g=2 hyperelliptic versus smooth quartic | (very ample,nonhyp,gon≥3,canonicalField=F)=(0,0,0,0) versus (1,1,1,1) | Pass both directions on tests; R12 on generality |
| 3.5 canonical field degree and genus | g=3 hyperelliptic | [F:K₀]=2, g(K₀)=0, image conic degree2; W degree4=2·2 | Pass; degree of image differs from degree of pencil divisor |
| 3.6 even-genus descent | g=2,4 versus odd g=3 | g−1=1,3 have gcd(2,g−1)=1; at g=3 gcd(2,2)=2 permits nonsplit conic | Pass parity argument; explicit locator missing |
| 3.7 Max Noether and Hilbert values | smooth quartic g=3, m=1,2,3 | H=3,6,10; (2m−1)(g−1)=6,10 for m≥2 | Pass |
| 3.7 hyperelliptic failure of degree-one generation | g=3 hyperelliptic, m=2 | products from k(x) have dimension5; ℓ(2W)=6; one new degree-two generator | Pass degree bound |
| 3.7 characteristic-two relation | y²+y=x⁵ | w²+v³w−u⁵v=0; derivative in w=v³; derivative of pure square relation=0 | Fail, R04 |
| 3.8 quadrics and Petri exceptions | g=3 quartic; g=4 (2,3); g=5 nontrigonal; g=6 plane quintic | dim I₂=0,1,3,6; generator degrees4;2,3;2;2,3 respectively | README g≥4 correct; acceptance misses exceptions, R12 |
| 3.9 low-genus Hilbert polynomials | canonical g=3,4,5 | degrees4,6,8; H(m)=4m−2,6m−3,8m−4; complete intersections(4),(2,3),(2,2,2) | Pass over algebraic closure with nonhyperelliptic/nontrigonal conditions |
| 4.2 genus-degree equation | line, conic, cubic, quartic, quintic | p_a=0,0,1,3,6; cuspidal cubic gives g=1−1=0 | Pass |
| 4.3 IsSmoothPlaneEquation and irrelevant-ideal criterion | line G=Z; cusp G=Y²Z−X³ in char0 | line derivative1 makes ideal whole; cusp Jacobian vanishes at(0:0:1), no irrelevant power | Pass both directions |
| 4.3 characteristic dividing degree | Fermat quartic in char2 | G=(X+Y+Z)⁴; every derivative0; nonempty zero locus, so smooth predicate false | Pass; Euler elimination must retain d≠0 |
| 4.3 smooth genus formula and delta | smooth quartic versus nodal quartic | 2g=6=(4−1)(4−2), δ=0; nodal g=2, δ=1 | Pass |
| 4.4 local delta, regularity and total sum | smooth point, node, cusp, tacnode | δ=0,1,1,2; nodal quartic p_a−g=3−2=1=Σδ | Pass in these examples |
| 4.4 conductor length | cusp k[[t²,t³]] ⊂ k[[t]] | conductor t²k[[t]]; normalization/conductor dimension2=2δ; normalization/local-ring dimension1 | Pass factor2 |
| 4.5 multiplicity, ordinary and equality | node, cusp, tacnode over algclosed char0 | r=2 for all; δ=1,1,2; r(r−1)/2=1; tangents distinct only for node | Pass; equality does not imply ordinary |
| 4.5 residue weights | nonsplit real node with residue degree1; conjugate pair of complex nodes over ℝ | first δ_ℝ=1, two geometric branches; second closed point degree2, δ_ℝ=2 | Pass; count nodes, not branches |
| 4.5 imperfect-field comparison | y²=x³+a over F₂(a) | intrinsic δ=0, r=1; after √a, δ=1,r=2; erroneous weighted bound 0≥2 | Fail without separability, R08 |
| 4.6 quadratic transformation degree | smooth cubic through three simple fundamental points | d′=2·3−1−1−1=3; both p_a=1 and genus1 | Pass degree formula; characteristic-p route requires Appendix A |
| 4.7 hyperelliptic plane models | g=2, deg f=6 and5 | (d,p_a,r∞,δ)=(6,10,4,8),(5,6,3,4); p_a−δ=2 in both | Pass; degree/genus distinction retained |
| 5.1 Clifford equality | g=3 hyperelliptic, D degree-two fibre; quartic D trigonal fibre | first ℓ=2, 2(ℓ−1)=2=deg D; second ℓ=2, 2<3 | Pass equality discrimination |
| 5.2 prime compositum and degree parity | genus4 y²=x⁹−1, z=x² | [F:k(x)]=2; z∈k(x); [F:k(z)]=4≤4 | Factorization true; exclusion false, R01 |
| 5.2 Castelnuovo corollaries | (n₁,g₁,n₂,g₂)=(2,0,2,1),(2,1,2,1),(3,0,2,1),(2,0,3,0) | RHS=3,5,4,2 respectively | Pass computed bounds; separable first extension retained |
| 5.3 Thom–Porteous rank-one specialization | O→O(2) on ℙ¹ with a nonzero section | e=e′=1,r=0; expected codim1; c₁=2[pt]; zero length2 | Pass determinant sign and dual convention |
| 5.4 Brill–Noether existence | (g,r,d)=(3,1,3),(4,1,3),(5,1,4) | ρ=1,0,1; expected codim2,4,4≤g | Existence tests pass; proof ring R05 |
| 5.4 Chern-class inference | elliptic non-torsion Q | degree c₁(O(Q−O))=0 but Chow class [Q−O]≠0 | Fail in Chow, R05 |
| 5.4 gonality bound | g=0 through9 | floor((g+3)/2)=1,2,2,3,3,4,4,5,5,6; at g=4, ρ(4,1,3)=0 | Pass; not a ground-field bound |
| 6.1 fixedField, Artin, inclusions | trivial H; involution t↦−t, char0 | fixed fields F and k(t²); degrees1=card H and2=card H; larger H gives smaller field | Pass |
| 6.1 nonabelian quotient | S₃ action generated by t↦1−t and t↦1/t | generic orbit6,e=f=1:6·1·1=6; degree of fixed-field extension6 | Pass; no commutativity assumption |
| 6.2 Hurwitz and tame formula | ℙ¹, t↦t², char≠2 | −2=2(−2)+2; two ramification points, each e−1=1 | Pass |
| 6.2 wild different | char2 y²+y=x⁵, g=2 | 2g−2=2=2(−2)+6; one ramified point, different exponent6, not e−1=1 | Pass general different; tame substitution invalid and excluded |
| 6.3 involution fixed-point formula | g=2 hyperelliptic and bielliptic involutions | fixed counts6=2·2+2−0 and2=2·2+2−4; both ≡2 mod4 | Pass |
| 6.4 bielliptic gonality and high-genus corollaries | g=2 y²=x⁶+1, x↦−x; g≥5 hypothesis | quotient y²=u³+1 has g=1; map degree2, bound gon≤4; actual gon2 at g2 | Pass; low genus must not receive gon=4 conclusion |
| 6.4 predicate boundary | elliptic E with nonzero rational two-torsion T, translation by T | card⟨T⟩=2, quotient genus1, fixed count0=2g−2; raw IsBielliptic true at g1 | Broader than usual genus≥2 definition; document boundary explicitly |
| 6.5 automorphism descent | y³=x⁷−1 over ℚ(ζ₃)/ℚ | branch count8; 2g−2=−6+16=10, g6; conjugation σ↦σ²≠σ | Fail generator descent, R02 |
| 6.6 cyclic trigonal and Kummer genus | y³=x⁴−1 with ζ₃; y³=x⁷−1 | branch counts5 and8; g=r−2=3 and6; x-degree3 | Pass subgroup/Kummer form with char≠3 and ζ₃ |
| 7.1 symmetric powers, Abel map and surjectivity | real anisotropic conic,d1,g0 | Sym¹(k)=∅; Pic¹(k) singleton; scheme map surjective but point map not | Clarify R19 |
| 7.2 IsP1Parametrized and equivalent moving divisor | ℙ¹ rational point; elliptic rational point | ℓ(P)=2 and1; first has another equivalent effective divisor, second does not | Pass both directions |
| 7.2 exact pole degree, base points and infinitely many bounded-degree places | ℙ¹ rational P; elliptic closed degree-two P | ℓ(P)=2 in both; map degrees1 and2; removing P gives dimension1 | Pass; use infinite k for infinitely many fibres |
| 7.2 degree ≥g+1 and degree=g criterion | elliptic deg P=2 and deg P=1 | ℓ=2 and1; at d=g=1, ℓ(W−P)=0, so parametrized=false | Pass; boundary discriminates |
| 7.3 AV-parametrized, isolated, sporadic | elliptic rank>0 at rational P versus rank0 | ℓ(P)=1 both; W₁=Pic¹, AV=true versus false; rank0 rational points finite | Pass distinction between P¹-isolation and isolation |
| 7.3 finite-index represented classes | real conic Pic-scheme vs line bundles | Pic-scheme degree group ℤ, represented degrees2ℤ, cokernelℤ/2 | Pass need for finite-index argument; no automatic representative |
| 7.4 Frey bound | ℙ¹/Q,d1 | infinitely many degree1 points; gon1≤2; closure of classes has dimension0 | Conclusion passes; proof branch R09 |
| 7.5 finiteness of isolated points | ℙ¹/Q and rank-zero elliptic curve | ℙ¹: every point degree≥1=g+1, so isolated count0; elliptic: only degree1 can be isolated, finite E(Q) | Pass; matches source theorem |
| 7.6 degree criterion | gon3,d1 and gon2,d1 | 2d=2<3 gives isolation; 2<2 false, no conclusion | Pass strict inequality |
| 7.6 rank-zero and simple-J criteria | rank0 elliptic,d1; simple Jacobian,g3,d2,ℓ(P)=1 | elliptic: AV=false, P¹=false, isolated=true; simple case dim W₂=2<dim J=3 so J-translate cannot fit | Pass; retain rank and simplicity hypotheses |
| 8.1 analytic gonality | sphere and complex torus | gonAn=1 and2; g+1=1 and2; degree1 map exists only for sphere | Pass; connected compact surface convention required |
| 8.2 meromorphic-field comparison | sphere f=zⁿ, n=1,2; constant excluded | field degree n=analytic degree n; n=0 constant gives no finite branched covering | Pass instances; Forster text unavailable |
| 8.3 effective PSL area | PSL₂(ℤ), X(7) subgroup index168 | areaπ/3 and56π; −I does not double the effective index | Pass factor |
| 8.3 positive spectral bottom | spectrum model {0,21/100,1/4} | remove constants: inf=21/100; retain constants: inf=0 | Pass supplier normalization |
| 8.4 energy and Li–Yau | round unit sphere, identity | λ₁=2,A=4π,d1; λ₁A=8π=energy=8πd; Σ∫xᵢ²=4π | Pass factor2 |
| 8.4 Hersch balancing | smooth plateau map with atom mass9/10 | barycentre projection≥9/10−1/10=4/5>0 versus claimed0 | Fail unrestricted subclaim, R11 |
| 8.4 topological input | disk boundary retraction in dimension2 | H₁(S¹)=ℤ; H₁(D²)=0; identity would equal0 | Supplier owns obstruction, R13 |
| 8.5 finite-area cutoff | cusp y≥Y, measure dxdy/y², width1 | tail area=1/Y→0; bounded coordinate tail L² norm≤1/Y | Pass required vanishing; full analytic proof not replaced by this test |
| 8.6 Abramovich constants | λ=3/16,21/100,975/4096,1/4 | λ/24=1/128,7/800,325/32768,1/96 | Pass; last two remain conditional here |
| 8.6 index example | index168, gonAn3 | (7/800)·168=147/100≤3; (325/32768)·168=6825/4096≤3 | Pass |
| 8.7 transfer to geometric gonality | Klein quartic over ℚ, Qbar, ℂ | gon_Qbar=3=gonAn; lower bound147/100≤3; gon_Q=3≥3 | Pass directions; consumes extension-invariance headline |
| 9.1 regular model/place dictionary | ℙ¹, infinity | residue degree1, local uniformizer1/t, ord∞(t)=−1; H⁰ dimension1, H¹ dimension0 | Pass signs and genus0 |
| 9.2 map to Proj from sections | ℙ¹, basis1,t,t² of L(2∞) | target ℙ², pullback O(1) degree2, image conic degree2; source F recovered by t=(t)/1 | Pass |
| 9.3 very ample iff closed immersion | elliptic divisors2O and3O | degrees2 and3, section dimensions2 and3; first map degree2, second is smooth cubic closed immersion | Pass both sides; Hartshorne locator uncertified |
| 9.3 canonical scheme form | genus2 hyperelliptic versus genus3 quartic | first map degree2, not immersion; second canonical degree4, immersion | Pass |
| 9.4 cohomological arithmetic genus and normalization | cuspidal plane cubic; smooth cubic | h¹=1=p_a both; normalization genus0 and1; normalization map nonisomorphism and isomorphism | Pass values; reorder proof dependencies R06 |
| 9.5 good reduction and semicontinuity | smooth integral ℙ¹ model; elliptic curve with good reduction | gon_generic=gon_special=1 and2; for pole degree2, ℓ_special≥ℓ_generic=2 | Pass equality instances; smooth proper assumptions retained |
| 9.5 point bound after specialization | Klein good reduction at2, quadratic extension F₈ | 24≤gon_Qbar·(8+1)=3·9=27 | Pass |
| 9.6 model dictionary | quartic canonical, genus2 sextic, genus3 nonsplit-conic double cover | codes0,5,7 give (degree,g,δ)=(4,3,0),(6,2,8), and gon_k4 versus gon_geom2 | Mathematical dictionary consistent after R04; database claims checked separately |
| Worked Klein/elliptic trace contrast | direct enumeration over F₁₁ | counted #X=12 and #E=8, so a₁₁(E)=12−8=4; 12−3·4=0≠12 | Trace contrast verified; rank/isogeny/L-value certification not supplied |

The table retains **98 computed rows**, including all 15 seeded targets; supplementary per-target rows are omitted.

### Seeded source sample

The identifiers below name source-service texts, not files copied into the repository. Printed page numbers are distinguished from PDF page numbers. The fetched versions are Poonen's author copy; Bourdon–Ejder–Liu–Odumodu–Viray arXiv:1808.04520v2; Voight–Zureick-Brown arXiv:1501.04657v4; Viray–Vogt arXiv:2406.14353v3; Abramovich arXiv:alg-geom/9609012v1; Fulton's 2008 text; and the published Saint-Donat article in the GDZ volume scan. Numbering claims below refer to those versions.

| Seeded target | Locator actually examined | Outcome |
|---|---|---|
| 2.6 Coordinate expressions and maps | No theorem/page locator supplied. The LMFDB model knowls describe conventions, not a proof of homogeneous-fraction uniqueness. | Native algebra permits the construction, but the two false identifications need R10 and an exact reference, R16. |
| 3.1 Regular differentials | Pinned `TauCeti/FieldTheory/FunctionField/Differential/Dimension.lean:87` and `Differential/CanonicalDivisor.lean:327`. | The dimension and multiplication-isomorphism inputs exist with hF, exact constants and nonzero differential as required. Textbook locator remains uncertified; no source text was inferred from its name. |
| 3.6 Rationality/even genus | The section derives from §§1.4–1.5; no external locator. Supplier SchemeAndStackFoundations §3.2 includes odd-degree splitting for a genus-zero curve. | The parity proof computes gcd(2,g−1)=1 for even g. Needs the located inputs attached to the claim, R16. |
| 3.8 Enriques–Babbage/Petri | `saint-donat`, unnumbered theorem p.157, §3 opening p.165, §§4.11–4.13 pp.174–175, inspected as rendered pages. | The exceptions and low genera agree with the corrected README. “Theorem 1” is not its label. The source's opening theorem itself omits the genus-three exception in part (2), corrected later in §4.13. |
| 4.4 Delta sum and conductor | `fulton-curves` lines 3937–3987, §8.3 Proposition 5 and Corollary 1, pp.102–103; cited Serre IV §11 unavailable. | Fulton supports the ordinary-singularity genus calculation over its algebraically closed field. It does not certify the full residue-field formulation or replace the unavailable conductor reference. Cusp lengths were computed independently. |
| 4.6 Ordinary plane models | `fulton-curves` lines 3506–3530, §7.4 Lemma 1 and Theorem 2, pp.90–91; lines 4325–4356, Appendix A p.113. | The existence theorem holds in arbitrary characteristic. Its characteristic-p proof repairs the characteristic-zero preliminary lemma using the exceptional tangent-point argument. Include that locator/input. |
| 5.4 Brill–Noether existence | `poonen2007` lines 334–368, Proposition A.1(v), pp.8–9, confirms the gonality consequence and points to the characteristic-p existence sources. ACGH/Kempf/Kleiman–Laksov/Mattuck full texts unavailable. | Primary existence proof not certified. R05 is independently witnessed in the supplier's own Chow convention. Poonen is corroboration, not a substitute primary proof of the full existence theorem. |
| 6.5 Automorphism descent | No external locator; SchemeAndStackFoundations §0.11 supplies Galois descent for morphisms. | Fixed-element descent is compatible with that contract; uniqueness of the order-three generator is false, R02. |
| 7.2 P¹-parametrized points | `belov` lines 478–485, Definition 4.1, p.11; `viray-vogt2024` lines 467–503, Lemma 4.1.1 and Corollary 4.1.2, pp.11–12. | The linear-system and degree criteria agree. The distinction between a single closed point and an arbitrary effective divisor is necessary for the exact fibre degree. The README's elementary argument extends the point criterion to arbitrary exact constant fields. |
| 7.5 Finiteness of isolated points | `belov` lines 488–491, Theorem 4.2(2), p.11; its §4.1 proof, especially lines 525–553, pp.12–13. | The source states finiteness of all isolated points, so bounded-degree finiteness is valid. The proof distinguishes represented classes and treats the repeated-class case. |
| 7.6 Degree/rank criteria | No exact source locator at the subsection; `belov` Definition 4.1/§4.1 and `viray-vogt2024` lines 625–636 corroborate the finite-class argument. | The displayed implications follow from the preceding RR/Frey and dimension inputs on the tested cases. Add individual locators and contracts; do not cite the survey as a proof of unstated foundational inputs. |
| 8.1 Analytic gonality | ModularForms 10B and FuchsianOrbifolds Layer 4 contracts examined; Forster full text unavailable. | Sphere/torus values and RR dependence tested; no claim to have verified the unavailable textbook locator. |
| 8.2 Analytic/function-field equality | Forster Theorem 8.12 unavailable; ModularForms 10B's meromorphic functions and RR contract examined. | The z↦zⁿ example verifies both degree conventions. The precise “≤” assertion at the cited Forster locator is not certified. |
| 8.7 Transfer to algebraic-closure gonality | `poonen2007` lines 327–341, Proposition A.1(i)–(ii), p.8; `abramovich1996` lines 13–35 and 70–129, Theorem 0.1 and proof, pp.1–3 of preprint. | Algebraically closed extension invariance and the 7/800 constant agree. The modular-function-field comparison is supplied by ModularForms/ModularCurves contracts, not proved by Abramovich's numeric theorem. |
| 9.3 Closed immersions | Hartshorne IV.3.1 and IV.5.2 full text unavailable; SchemeAndStackFoundations §§0.11, 3.2 examined. | Closed-immersion/degree criteria tested on elliptic 2O/3O and canonical genus 2/3. Exact Hartshorne wording remains uncertified. The §0.11 list does not explicitly name closed-immersion descent; give its precise consequence from the descent-of-morphisms/closed-subscheme contract when specifying the route. |

Additional primary-source checks: `yang-yau1980` was fetched legally from Numdam after the initial bibliographic resolver gave an unhelpful publisher result. Its §2 Proposition, printed p.58 (rendered), assumes a **nonconstant holomorphic** map of degree d; lines 148–155, p.59, apply balancing to an integrable density. This supports R11's correction. `abramovich-harris1991` lines 181–196, Lemma 1, printed p.231, give the dimension increase in degree 2d. `voight2022` equation (2.3.2), printed p.14, supplies the characteristic-two canonical relation in R04. Thirteen cited LMFDB knowl pages were fetched through the service; their terminology is data, not ownership or proof authority.

### Headline coverage and native APIs

The README's headline groups are: gonality/pencils and extension laws (§1); Hilbert polynomial, arithmetic genus and very ampleness (§2); canonical embedding, canonical image, Max Noether and Petri (§3); plane genus and local singularities (§4); Clifford equality, Castelnuovo corollaries and Brill–Noether (§5); quotient genera and involution/trigonal criteria (§6); Frey and isolated-point finiteness (§7); analytic comparison, Li–Yau and Abramovich (§8); and scheme embedding/specialization (§9).

The acceptance file does state native versions of the main elementary gonality laws, Hilbert polynomial, very ampleness bounds, algebraically closed Noether/Max Noether, nonexceptional Petri, plane genus, Clifford equality, Brill–Noether existence/bound, quotient genus, bielliptic bounds and Frey. It does **not** state the exceptional Petri generation assertion or the geometric finite-field bound despite having the relevant carriers. It does not list each unavailable analytic/scheme/Picard headline and its missing carrier. R12 specifies the repair; a general sentence saying the file is not exhaustive is insufficient. There is no sorry-valued invented carrier standing in for these objects.

The following **15 pinned declaration groups** were opened, rather than inferred from declaration names. Paths are relative to the relevant pinned library; Mathlib revision is f6090c7095e1e56b3464c1daba5f24631f1290d2 and Tau Ceti revision is 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a.

| Pinned file and line | What its actual statement supplies |
|---|---|
| `TauCeti/FieldTheory/FunctionField/Basic.lean:52` | `IsFunctionField`, existence of a transcendental element and finite dimension over a simple transcendental subfield (lines 60,65). It does not include exact constants or perfectness. |
| `TauCeti/FieldTheory/FunctionField/Hyperelliptic/Basic.lean:73` | `IsHyperellipticFunctionField` carries genus at least two and a separable degree-two rational subfield. |
| `TauCeti/FieldTheory/FunctionField/Differential/Dimension.lean:87` | `finrank_weilDifferentialFiltration_zero` with function-field and exact-constant hypotheses. |
| `TauCeti/FieldTheory/FunctionField/Differential/CanonicalDivisor.lean:327` | `riemannRochSpaceEquivWeilDifferentialFiltration`; the nonzero differential is required, and the divisor direction is W−D. |
| `TauCeti/FieldTheory/Galois/FixedField.lean:287` | Finite-dimensional fixed-field extension for a finite subgroup; Galois at line 294 and degree=cardinality at line 304. No finite-dimensional ambient F/k. |
| `TauCeti/FieldTheory/FunctionField/Automorphism/FixedField.lean:35` | `IsFunctionField.fixedField`; this is the native theorem wrapped in Suggested.lean. |
| `TauCeti/FieldTheory/FunctionField/Different/Hurwitz.lean:72` | `hurwitz_genus_formula` with finite separable function-field extension and exact-constant hypotheses. |
| `TauCeti/FieldTheory/FunctionField/Place/Extension/Degree.lean:62` | Residue degree multiplication, the coefficient needed by divisor norm. |
| `TauCeti/FieldTheory/FunctionField/Divisor/ProductFormula.lean:234` | `Divisor.degree_poles`: transcendental nonzero function; does not require exact constants. |
| `Mathlib/FieldTheory/RatFunc/IntermediateField.lean:162` | `RatFunc.finrank_eq_max_natDegree`; native rational-function degree formula. |
| `Mathlib/FieldTheory/RatFunc/Luroth.lean:496` | `RatFunc.Luroth.algEquiv` for an intermediate field other than the bottom field. |
| `Mathlib/FieldTheory/Galois/Basic.lean:92` | `IsGalois.of_fixed_field` without the ambient finiteness claimed by the README. |
| `Mathlib/FieldTheory/Galois/Basic.lean:220` | `IntermediateField.finrank_fixedField_eq_card` in its finite-ambient setup; distinct from the preceding theorem. |
| `Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Proper.lean:372` | Properness of `Proj.toSpecZero` includes finite type over the degree-zero ring. It is not unconditional properness of arbitrary Proj. |
| `TauCeti/FieldTheory/FunctionField/ConstantExtension/RiemannRoch.lean:160` | `Divisor.dim_conorm` requires finite separable constant extension, exact constants, compositum equality and the top function-field hypothesis. No arbitrary imperfect-extension invariance was inferred. |

Library searches were by objects as well as names (fixed fields, different, homogeneous ideals, projective schemes, divisors, gonality and degeneracy loci). The worker's 19 unresolved-name leads mostly consist of LMFDB knowl identifiers; those are not Lean declarations. Three beyond-pin function-field names and `Curve.finite_rationalPoints` are supplier claims, not evidence of a native declaration at this pin. The independently rerun resolver reports that it did not inspect pinned packages, so it was not used to clear those claims.

### Ownership and resolved supplier contracts

Two main-branch roadmap shapes, AlgebraicCurves and JacobianChallenge, were read before producing the review. The ownership search used the roadmap service across main/open heads, plus the supplied local heads and board packages. A namespace search found no second owner of `TauCetiRoadmap.CanonicalModelsAndGonality` outside the same roadmap's review checkout. Search hits for open work without a supplied readable head were treated as leads only, not as findings.

These **12 contract/ownership groups** were resolved against readable files:

| Owner and location | Resolution |
|---|---|
| `TauCetiRoadmap/AlgebraicCurves/README.md:109`, `:870`, `:1093`, `:1318`, `:1640` on main | The underlying function-field/divisor/RR library, constant extensions, Castelnuovo, hyperelliptic/smooth plane material, and scheme dictionary have existing owners. Cite those sections for beyond-pin results; do not use an unpinned library branch as the contract. |
| `TauCetiRoadmap/JacobianChallenge/README.md:165`, `:203`, `:218`, `:300`, `:332` on main | Proper flat base change/semicontinuity, symmetric powers (including nonreduced divisors), Picard components, Jacobian and duality. The theorem requiring positive rank is not supplied by a bare Picard carrier. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md:551`, `:938`, `:3437` on main | Proj, descent, and projective quasi-coherent cohomology/Serre vanishing. No unlimited or hypothesis-free scheme descent was assumed. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4671`, `:4713`, `:4937` on main | Genus-zero odd-degree splitting, line-bundle degree bounds, singular RR, and Abel maps. Scheme-level surjectivity explicitly does not assert rational-point surjectivity; universal bundles need the stated splitting/pointed condition. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md:6701`, `:6721`, `:6768`, `:6921`, `:7107` on main | Chow/Chern, Gysin/intersection and GRR prerequisites. Rational equivalence and coefficient hypotheses must survive into §5.4. |
| `TauCetiRoadmap/ModularCurves/README.md:238` on main | §0A relative Cartier-divisor fibre criteria and the proper, finite locally free degree inputs used for specialization. |
| `TauCetiRoadmap/ModularForms/README.md:1052`, `:1068` on main | Layers 10A–10B: effective PSL index, meromorphic-function/divisor setup, analytic RR. These are prerequisites, not new targets here. |
| `TauCetiRoadmap/FuchsianOrbifolds/README.md:235`, `:286`, `:320` on main | Hyperbolic area, compactified Riemann surfaces, finite holomorphic maps and degree composition. |
| `TauCetiRoadmap/CongruenceSpectralGap/README.md:172`, `:219`, `:315`, `:826` at supplied head | §§0.2,0.4,0.7,5.3 supply the Laplacian, positive Rayleigh bottom, clipping at 1/4 and 21/100 bound. Constants are removed in the quotient used here. |
| `TauCetiRoadmap/AlgebraicTopology/README.md:393` and `TauCetiRoadmap/DifferentialGeometry/README.md:890` on main | Generic no-retraction/Brouwer and sphere-degree comparison already owned; R13. |
| `TauCetiRoadmap/HyperellipticCurves/README.md:9`, `:208`, `:2261`; `TauCetiRoadmap/GroupActionsOnRiemannSurfaces/README.md:172`, `:195`, `:975` at supplied heads | Equation/isomorphism theory and generating-vector criteria remain separate. The latter explicitly consumes this roadmap's unique cyclic subgroup, not a unique generator, agreeing with R02. |
| `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:215`, `:1537`, `:1933` and `TauCetiRoadmap/CurvesOverFiniteFields/README.md:67` at supplied heads | Modular model/gonality and isolated-point theory are assigned here; point-count/zeta infrastructure stays outside. No second generic canonical-model owner was located in these heads. |

Additional boundary checks resolved StableReduction Layer 0 (`README.md:343`, proper/flat finite-presentation models), QuaternionArithmetic (`README.md:90`, models/gonality excluded), MaassForms §5.3 (`README.md:1243`, 3/16 from 21/100), FunctionFieldArithmetic Layer 5 (`README.md:1717`, zeta theory), and ComplexCurveModuli (stable-curve moduli). These are boundaries, not upward inputs.

The new ownership boundary is defensible, subject to R13–R17: imported Clifford, smooth-plane, fixed-field and no-retraction results remain with their owners.

## Not verifiable

- **Unavailable primary texts:** Stichtenoth (including the requested local theorem numbers), Hartshorne IV.3.1/IV.5.2, ACGH III/V, Forster Theorem 8.12, Serre IV §11, Fulton *Intersection Theory* Theorem 14.4/Example 14.4.1, Frey Proposition 2, Li–Yau Theorem 1, Selmer and Accola. The source service was tried by title/DOI; it returned publisher-only/uncertified results for these. They were not bypassed or treated as read. Relevant native statements and open sources were checked where available, but those are not certification of the unavailable printed locators.
- **Unresolved texts:** Hersch 1970 (title lookup found no legal text), Kempf 1971 (title lookup found no legal text), Mattuck 1961 (DOI 10.2307/2372727 led to JSTOR without a verified open copy), Kleiman–Laksov 1972 (DOI 10.2307/2374630 likewise). Their four entries remain in the scratch missing-reference request. Yang–Yau was subsequently obtained from Numdam; Abramovich–Harris and Kato were also obtained and are not outstanding requests. No source manifest was edited.
- **Unprovided supplier head:** HeightsRationalPointsAndObstructions §§4.3,4.6,5.9/Layer 1 was not present in the supplied main checkout and no readable head for it was supplied. The closure/Mordell–Weil contracts could not be independently resolved from that file. This is recorded as a limitation, not a speculative missing-owner finding. Ownership against other open heads without supplied files was not checked.
- **Numerical arithmetic claims:** the exact Selmer index attribution; the Klein-quartic Jacobian's stated isogeny over the cubic field; the numerical value `L(E/ℚ(ζ₇)⁺,1)≈0.516`; and the consequent rank-zero certification are not established by the displayed decimal. Kato's text was obtained, but the README gives no exact theorem plus certified nonvanishing input for this example. The F₁₁ trace contrast was independently counted; the isogeny and rank assertions remain unverified. Likewise the assertion about the three quadrics for X₁(17) was not independently reconstructed. `derickx2014` Table 1 verifies the rational gonality value 4, not by itself that additional geometric claim.
- **LMFDB scope:** fetched knowls support terminology, but individual record labels and numeric database fields in every worked example were not independently fetched. They are not used as witnesses for a blocking mathematical finding. No inference of a theorem from a database label was made.

## Source issues

- **Error** in saint-donat at the unnumbered theorem, part (2), printed p.157: the source says canonical ideals for all nonhyperelliptic genera at least three are generated in degrees two and three; it should be restricted to genus at least four, with a quartic generator in genus three; affects a stated result; corrected in print at §4.13, printed p.175.
- **Misprint** in fulton-curves at Appendix A, printed p.113, line 4333: the source says the constant field k equals k(x,y) after choosing a separating element; it should be the function field K equals k(x,y); affects nothing.
- **Misprint** in fulton-curves at Appendix A, printed p.113, line 4354: the source says choosing the preliminary centre ensures p does not divide n−r; it should be p does not divide n′−r, the transformed degree difference; affects nothing.
- **Misprint** in belov at Theorem 4.3 proof (1), printed p.12, line 503: the source places y′ in Symᵈ C although y is a point of D; it should place y′ in Symᵈ D; affects nothing.
- **Error** in lmfdb-ag-bielliptic_curve at the definition, unpaginated, lines 90–96: the source presents geometric biellipticity, a ground-field involution with pointed quotient, and a fixed-point count as equivalent; it should distinguish descent and quotient rational-point conditions, and require tameness for that fixed-point count; affects a stated result.
