<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/14748#issuecomment-6860321030 -->
Review (codex) of f8d35e3

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) The canonical bundle has the opposite curvature to Ricci

   **Location.** `packages/BallQuotientsAndComplexHyperbolicLattices/design/README.md:276`, §2.3: “The Ricci form is the curvature −i∂∂̄ log det(h) of the canonical bundle”. The same identification occurs in `packages/BallQuotientsAndComplexHyperbolicLattices/design/plan.json:526`.

   **Claim.** The metric induced on K_B has curvature form Ric(ω) = −(n+1)ω, and this is the curvature used in Layer 9.

   **Witness.** On B¹, det h = (1−|w|²)⁻² and ‖dw‖² = (det h)⁻¹. Thus iΘ(K) = +2ω, whereas Ric(ω) = −2ω. Section 9.1 uses +2(ℓ−1)ω.

   The supplier fixes the convention, so changing the convention cannot resolve this: `TauCetiRoadmap/ComplexKahlerGeometry/README.md:171` gives the Chern connection matrix h⁻¹∂h and curvature dA+A∧A. On a line, iΘ = −i∂∂̄ log ‖e‖². The canonical frame has squared norm (det h)⁻¹, not det h. The existing §2.3 Check tests Ricci alone and therefore misses this dualization.

   **Exact repair.** Replace that identification in both files by: “The Ricci form is the curvature form of K_B⁻¹: Ric(ω) = −i∂∂̄ log det(h) = −(n+1)ω. The induced metric on K_B has iΘ(K_B) = i∂∂̄ log det(h) = (n+1)ω; hence iΘ(K_B^{ℓ−1}) = (ℓ−1)(n+1)ω, as used in §9.1.” Add the disc computation as a Check, distinguishing K_B from K_B⁻¹. At n=1, ℓ=2 the repaired input is +2ω, strictly positive, rather than −2ω.

2. **F02** (P1) Compactification uniqueness admits doubled cusp points

   **Location.** `packages/BallQuotientsAndComplexHyperbolicLattices/design/README.md:771`, §10.5: “every compact normal complex analytic space Y containing X_Γ as an open dense subspace with Y ∖ X_Γ finite”; `packages/BallQuotientsAndComplexHyperbolicLattices/design/plan.json:2215` and its hypotheses.

   **Claim.** Compactness and normality suffice to identify Y uniquely with the projective minimal compactification.

   **Witness.** Take X = ℙ¹∖{0,1,∞} for Γ(2)/{±1}. Glue two copies of ℙ¹ along X. Y is compact and locally smooth, with six boundary points; S*_Γ has three. Y is not Hausdorff.

   This is an allowed input, not an alternative convention for analytic spaces. ComplexComparisonPartII, open PR #848, `TauCetiRoadmap/ComplexComparisonPartII/README.md:1037`, explicitly imposes no global Hausdorff axiom on `ComplexAnalyticSpace`; §C−1.1 supplies open gluing. Its §C−1.2 also illustrates doubled origins. Each copy of ℙ¹ maps continuously into Y, so their two compact images cover Y. Every point has a smooth curve chart, hence normal local ring. The common X is open dense. Two copies of any cusp cannot be separated, and the end corresponding to that cusp has two limits. Connected punctured neighbourhoods do not exclude this.

   **Exact repair.** Require Y to be **compact Hausdorff and normal** in §10.5, its plan statement and hypotheses. Also make the finite-set compactification convention in the README explicitly Hausdorff and retain that qualification in the ℂ* Check. Add the doubled-three-cusp example as the negative control. In the proof explain that disjoint neighbourhoods of distinct boundary points force distinct ends; normality gives one local punctured end at each point. The example then fails exactly the new hypothesis. The actual compactifications in §§9.4–9.5 remain eligible, since separated projective varieties have Hausdorff analytifications by ComplexComparisonPartII §C−1.1.

3. **F03** (P3) The cyclic parabolic Check puts the infinite volume at the wrong end

   **Location.** `packages/BallQuotientsAndComplexHyperbolicLattices/design/README.md:445`, §5.1: “a fundamental domain in B contains a horoball strip of infinite volume”.

   **Claim.** A horoball strip witnesses the infinite covolume of ⟨T₁⟩ in every dimension, including n=1.

   **Witness.** At n=1, {0≤x<1, y>Y} has ω-area ∫₀¹∫_Y^∞ dx dy/(2y²) = 1/(2Y). The same finite-volume assertion appears correctly in §5.3, README line 463.

   **Exact repair.** Write: “For n=1 a fundamental domain is {0≤x<1, y>0}; its portion 0<y<1 has infinite area, since the area with ε<y<1 is (ε⁻¹−1)/2. The horoball portion y>Y instead has finite area 1/(2Y). Thus ⟨T₁⟩ is not a lattice.” Retain the existing infinite-index Check and, if desired, state separately that for n≥2 the unrestricted horizontal directions also make the cyclic quotient infinite-volume. The plan's test `cyclic_parabolic_not` does not contain the erroneous horoball assertion.

4. **F04** (P3) Pin the inverse in the conjugated-representation Check

   **Location.** `packages/BallQuotientsAndComplexHyperbolicLattices/design/README.md:822`, §11.1: “with its conjugate by diag(2, 1), the integral groups are … diag(2,1)·SL₂(ℤ)·diag(2,1)⁻¹”; `packages/BallQuotientsAndComplexHyperbolicLattices/design/plan.json:2374`.

   **Claim.** Conjugating the representation by A=diag(2,1) produces the asserted subgroup of the original abstract SL₂(ℚ).

   **Witness.** For ρ′(g)=AgA⁻¹, integral points are A⁻¹SL₂(ℤ)A. The matrix [[1,1],[0,1]] maps to [[1,2],[0,1]], so is integral, but is excluded by the asserted Γ⁰(2) intersection.

   The theorem and the index 3 are correct; the direction of the representation used to compute the subgroup is not specified consistently. With the usual conjugated representation AgA⁻¹, the intersection is Γ₀(2), requiring the lower-left entry to be even. It is Γ⁰(2) for the inverse-conjugated representation.

   **Exact repair.** Preserve the desired example by explicitly defining the second representation as ρ′(g)=A⁻¹gA in both files. Then ρ′⁻¹(GL₂(ℤ))=ASL₂(ℤ)A⁻¹ and the intersection with SL₂(ℤ) is Γ⁰(2), exactly as claimed. Test upper and lower unipotents: upper entry 1 becomes 1/2 and fails integrality; lower entry 1 becomes 2 and passes. Both indices remain 3.

5. **F05** (P3) Deng's Theorem A is not an unconditional ball-quotient locator

   **Location.** `packages/BallQuotientsAndComplexHyperbolicLattices/design/README.md:751`, §10.3: “Deng2020 Theorem A, line 87 to line 90, general case”; `packages/BallQuotientsAndComplexHyperbolicLattices/design/plan.json:2145`.

   **Claim.** The cited theorem directly supports the asserted Borel algebraicity for every torsion-free ball quotient.

   **Witness.** Deng2020 line 87, Theorem A, printed p.3, assumes a quasi-compact Kähler manifold carrying a complex polarized variation of Hodge structures whose lifted period map has zero-dimensional fibres. Section 10.3 supplies no such variation.

   This is a citation defect, not a defect in §10.3's independent extension-and-algebraization route. Milne's theorem is explicitly arithmetic; Deng's theorem has additional Hodge-theoretic input. The roadmap excludes construction of the period-domain realization in its scope.

   **Exact repair.** Replace the citation clause with: “The argument is deduced here from §10.2 and proper-source algebraicity; MilneSVI Theorem 3.14, pp.39–40, gives the arithmetic case and its compactification argument. Deng2020 Theorem A, p.3, gives another criterion under its C-PVHS and period-map hypotheses.” Make the plan locator equally explicit. No new Hodge-theory dependency is needed. This retains the non-arithmetic case and the valid proof route instead of silently dropping the source's hypotheses.

Five findings: two P1 and three P3; two blocking. The previous round's three findings are repaired. The new blockers are a canonical-bundle curvature sign and a missing Hausdorff hypothesis in compactification uniqueness. No design or source-manifest file was changed.

## Verified sound

### Previous findings, checked first

No finding was marked “not actionable in this package” in the repair report. No maintainer notes were supplied. All locations in this table refer to `packages/BallQuotientsAndComplexHyperbolicLattices/design/README.md` unless specified.

| Previous finding | Repaired passage and verification | Status |
|---|---|---|
| F01, KAK and MAN ownership | §1.4: “The Cartan decomposition of G is LieGroups Layer 9's `kakDecomposition`”; §1.5: “Take from RealSemisimpleLieGroups §3.1 the minimal parabolic datum”. Main LieGroups README line 1362 and Suggested.lean lines 598, 605 supply KAN/KAK; PR #2229 §3.1 supplies MAN for connected semisimple groups with finite centre. Plan targets 1.4, 1.5 and supplier entries agree. | Repaired |
| F02, passage to the adjoint group | §11.1(c): “the group φ(𝐆(ℤ)) is commensurable with 𝐆′(ℤ)”; §11.3: “p = ι ∘ pr_H ∘ π_ℝ”. The new §5.1 finite-index fact completes the route. SL₂→PGL₂ gives index 2 before restricting real components, and equality afterward. WitteMorris2015 Proposition 9.4.5, p.202, supports the assertion. | Repaired; the new model-comparison Check has R04 |
| F03.1, Cartan locator | §2.1 now cites “Goldman1999 Ch. 3, uncertified”; the unrelated Baldi–Ullmo lines are absent from README and plan. §2.4 uses Mok2012 lines 319–321 only for automorphisms being isometries. | Repaired |
| F03.2, Baily–Borel boundary input | §11.4: “the rational boundary components of ShimuraVarieties §2.1 are points, and by ShimuraVarieties §2.2 they form finitely many … orbits”. Both sections occur in its Needs, Layer 11 dependencies and plan. PR #933 §§2.1–2.2 contain the claimed statements. | Repaired |
| F03.3, W notation | §12.3 writes “Z ⊂ S_Γ” and “X_H = 𝔹(W)”; §12.4 uses Q for the product subvariety. The plan agrees. | Repaired |
| F03.4, pin line | The contract now cites `Mathlib/Logic/Equiv/Fin/Basic.lean:224`; this is the declaration of `finSumFinEquiv`. | Repaired |
| F03.5, source key | §6.1(2) names `GarlandRaghunathan1970`; References and manifest contain it with waived status and §6.1 usage. | Repaired |

I re-examined the changed action, root-sign, isogeny, finite-index, compactification-boundary and notation passages and looked for their ownership and convention patterns elsewhere. In particular the exponential formula in §2.4 now cites §1.4 rather than giving it a second owner. The real-component restriction in §11.1(c) is essential and present. The new compact-kernel argument does not claim equality of integral groups.

### Coverage and shape

Read the full 960-line README, all 57 plan targets (42 theorem, 10 definition, 5 construction), and the 17-entry manifest. Every plan target has at least three tests; every definition target has an API; all `target:` prerequisite ids precede the consuming target. The README has twelve layers, twelve Examples blocks and twelve Dependencies blocks. Target statements, proof sketches, API bullets and Checks were considered together, including those previously summarized without computed evidence. A working calculation ledger covers all 57 target sections; the report table below retains the seeded sample, headlines, repaired passages and findings rather than reproducing the entire ledger.

The dimension convention n≥1 is explicit; the point sub-ball case m=0 is handled separately. Torsion is retained in lattice/cusp/analytic-quotient/projectivity results, and torsion-freeness is explicit in the extension and Borel-algebraicity theorems. There is no good-primes restriction, computational algorithm, sorry'd data, `set_option`, process instruction or machine path in the design. No new own backticked Lean declaration is claimed in this design README. Its plan's prospective names are not presented as declarations already made in Lean.

The two declared gaps have matching slugs and the named supplier ComplexComparisonPartII in plan and README. Normalization/normality/regularity comparison is specified via the common completed local rings; normal Riemann extension states the continuous function, open domain and nowhere-dense analytic exceptional-set hypotheses in the README and plan detail. Their mathematical contracts remain precise. The supplier's analytic normalization and completed-stalk comparison do not themselves assert the missing conclusions. These are declared contracts, not unowned prerequisites, and were not raised as findings.

For house shape I read the main FuchsianOrbifolds, ComplexKahlerGeometry and RiemannianGeometry roadmaps. This design uses the required prose layers, local dependencies and discriminating Checks. Findings R03–R04 concern two individual Checks rather than a missing test quota.

### Computed adversarial table

“Pass” here refers to the stated computation and its relevant hypotheses, not a machine proof. Source limitations are listed separately. All quantities use the roadmap's curvature −2 metric.

| Statement | Instances tried | Values computed on the two sides | Result / change |
|---|---|---|---|
| Form and action conventions; §1.1 | z=(1,i/2), w=(1,1/2); scalar 2I | Here 1+i/4, supplier 1−i/4; diagonal 3/4 in both. (2I)ᴴJ(2I)=4J≠J. | Pass; conjugation, not equality, of forms |
| §1.2 representation | n=1, h_t; scalar iI | On M₂: e^{2t},1,1,e^{−2t}; on traceless matrices: e^{2t},1,e^{−2t}. Scalar iI acts as identity. | Pass |
| §1.3 Cayley and denominator | w=1/2, 2; general v∈𝔖 | C(1/2)=3i, ρ=3=(3/4)/(1/4); C(2)=−3i, ρ=−3. Im(v+i)>1, so inverse denominator nonzero. | Pass |
| §1.4 action, KAK (sample) | v=1, −i; t=log(3)/2; u=1,v=i | exp(tY_1)·0=tanh t; exp(tY_{−i})·0=−i tanh t; tanh(log(3)/2)=1/2. [Y_1,Y_i]=diag(2i,−2i)≠0. | Pass; real rank 1 and phase fixed |
| §1.5 MAN and Heisenberg (sample) | n=1,2; a=1,a′=i; s=1/2 | Products have vertical coordinates −2 and +2; commutator −4. Conjugating T₁ gives T_{1/4}. n=2: dim M+dim A+dim N=1+1+3=5. n=1: M=1, N=ℝ. | Pass |
| §1.5 positive roots | τ=log(3)/2 | C(tanh τ·e_n)=(0,3i)=(0,ie^{2τ}); opposite endpoint −e_n maps to (0,0), not ∞. | Pass |
| §2.1 full automorphism group | f(w)=w/2; unbounded z+z² | Df(0)=1/2≠1; second map has derivative 1 but f(1)=2≠1 and domain unbounded. | Pass; hypotheses discriminate |
| §2.2 metric adapter | w=(1/2,0), u=e₁ | h(u,u)=4/3+4/9=16/9; g=32/9 on both conventions; PSL₂(ℤ) area π/6 rather than π/3. | Pass |
| §2.3 canonical curvature | n=1; ℓ=2 | Ric=−2ω; ‖dw‖² proportional to (1−r²)² gives iΘ(K)=+2ω. Layer 9 needs +2ω. | Fail, R01 |
| §2.4 distance | 0 and tanh(t)v, ‖v‖=1 | d=√2 abs(t); cosh²(d/√2)=cosh²t. Killing distance=2√(n+1)abs(t), ratio √(2(n+1)). | Pass |
| §2.5 Schwarz–Pick | (ζ,ζ)/√2; (ζ/2,ζ/2); zero derivative | Derivative norms 1, 1/√2, 0; squared metric norms at 0 are 2, 1, 0 against source norm 2. | Pass |
| §3.1 sub-balls (sample) | m=0; W:z₁=z₀/2; null line | Point with trivial effective group; Gram diag(3/4,−1); null line has form 0 and no ball point. | Pass |
| §3.2 tangent classification (sample) | p=(1/2,0), T=ℂe₂; curve w₂=w₁² | Correct affine ball w₁=1/2, Gram diag(3/4,−1); parallel ball w₁=0 misses p. Curve's second derivative at 0 is 2≠0. | Pass |
| §3.3 analytic classification (sample) | n=1; two coordinate axes; proper open sub-ball piece | Closed full-dimensional irreducible analytic set is B; axes have two components; a proper half-disc has finite-distance missing interior points and is incomplete. | Pass |
| §4.1 trichotomy (sample) | a₂, T₁, finite rotation | Lengths √2 log2>0 attained, infimum 0 unattained, 0 attained. Boundary fixed-point counts 2,1; rotation has an interior fixed point. | Pass |
| §4.4 Margulis | C_m⊂K; S₃⊂U(2) | All displacements at 0 equal 0. C_m has nilpotent subgroup index 1; S₃ is not nilpotent, A₃ has index 2. Strict m-step coset growth would yield m+1>m cosets. | Pass |
| §5.1 repaired finite-index result | Γ(2)/±1⊂PSL₂(ℤ); cyclic T₁ | Index 6; π=6·π/6. Cyclic fundamental strip has infinite full area, but its high horoball strip has area 1/(2Y). | Theorem passes; Check R03 |
| §6.1 cusps with torsion | R(u,v)=(−u,v), T₁ at (0,1000i) | R displacement 0; T₁ displacement √2 asinh(1/2000)=0.000707106752; generated subgroup contains C₂×ℤ, hence infinite. | Pass; elliptic fixed point can be thin |
| §§6.2–6.4 finite generation, Selberg, neatness | F₂ commutator; {±1}⊂GL₁; screw of order-four rotation | F₂/[F₂,F₂]=ℤ², commutator free of infinite rank; subgroup {1} has index 2 in {±1}; screw cyclic group is torsion-free but has Ad eigenvalue i. | Pass |
| §§7.1–7.3 analytic quotient | ±1 on ℂ²; reflection; Γ(2) quotient | Invariants x²,xy,y² satisfy (xy)²=x²y² and are singular at 0; reflection coordinates x,y² are smooth; Γ/Γ(2)=S₃ has order 6. | Pass; smoothness does not imply torsion-free |
| §§8.1–8.2 toroidal charts | horizontal generators λ,iλ; n=1; no cusps | τ=4λ², χ(λ)=χ(iλ)=1, χ((1+i)λ)=−1; extra multiplier e^{πi}=−1 cancels. Boundary dimension n−1=0 for n=1; D=∅ in compact case. | Pass |
| §§8.3–8.4 asymptotics and L² | n=1, f=q^k, ℓ=0,1 | Metric=abs(dq)²/(2 abs(q)²log²abs(q)); at ℓ=1,k=0 radial ∫dr/r=∞, k=1 gives ∫r dr<∞; at ℓ=0 constant integral is finite. | Pass |
| §9.1 prescribed jets (sample) | weight n+1; monomial orders k=0,1,2; empty P | Radial exponent 2k−3 is −3,−1,+1: exactly orders ≥2 integrate. Empty jet assignment is satisfied by the zero section. | Pass after R01 |
| §§9.2–9.3 sections and projectivity | Γ(2)/±1, ℓ=1,2,3 | E=O(1), h⁰(E^ℓ)=ℓ+1; h⁰(E^ℓ(−D))=0,0,1. Veronese separates points; K=O(−2) has 0 sections. | Pass |
| §9.4 minimal neat compactification (sample) | Γ(2)/±1; compact Γ | Normalization is ℙ¹ with 3 cusp classes/3 boundary points; compact case has 0 boundary points. | Pass |
| §9.5 arbitrary lattice | PSL₂(ℤ) via Γ(2)/±1 | Finite S₃ quotient gives ℙ¹ and one cusp orbit; open quotient is ℂ, algebraic model 𝔸¹. | Pass |
| §§10.1–10.2 extension | punctured disc; r=0; torsion j-line | Circle length √2π/abs(log r)→0; r=0 gives original map. exp(1/z) has cluster values 0 and ∞ and no extension to ℙ¹. | Pass; torsion-free hypothesis necessary |
| §10.3 Borel algebraicity (sample) | torsion-free finite covering; exp into j-line | Finite covering algebraizes; exp:ℂ→ℂ is not polynomial. Deng's hypothesis list additionally contains a C-PVHS and zero-dimensional period fibres. | Mathematics passes; locator R05 |
| §10.4 unique algebraic model (sample) | cusp normalization; torsion-free model | t↦(t²,t³) has one-point fibres but ℂ[t²,t³]≠ℂ[t]; excluded as a smooth model. Prescribed analytic identity and inverse algebraize for torsion-free quotient. | Pass |
| §10.5 unique compactification | two ℙ¹ glued along three-punctured sphere | Y compact, normal, boundary cardinality 6; target ℙ¹ boundary cardinality 3. Doubled cusp points have intersecting every pair of neighbourhoods. | Fail, R02 |
| §10.6 lattice functoriality (sample) | Γ(2), projective Γ(3), identity | Degrees/indices 6/6, 12/12, 1/1; the linear SL₂ index 24 becomes 12 after dividing the ineffective ±1. Cusp widths 2+2+2=6. | Pass |
| §11.1 isogeny repair | SL₂→PGL₂; conjugated representation | Integral image index 2 by determinant sign; positive component index 1. AgA⁻¹ sends upper unipotent entry 1 to 2; A⁻¹gA sends it to 1/2. | Isogeny passes; Check R04 |
| §11.2 cocompactness (sample) | split SL₂; form definite at another real place | SL₂ has split rank 1 and noncompact quotient; an isotropic vector would stay isotropic at the definite embedding, where its norm is positive, contradiction. Compact kernel fibres preserve compactness. | Pass |
| §11.3 Shimura datum (sample) | n=1,2; K_f=PGL₂(Ẑ), a=1 | n=1 has 2 components; n=2 a negative similitude would require abs(det g)²=−1. h₀(i) acts by −1; Γ_a=PSL₂(ℤ)=effective Γ_a. | Pass |
| §11.4 new boundary comparison | ball and bidisc | norm f≤1 and ⟨e₁,f⟩=1 force f=e₁; bidisc admits f(ζ)=(1,ζ). Ball boundary strata have dimension 0. | Pass |
| §12.1 Γ-special definition (sample) | full ball; point; nonlinear curve | Full ball gives Γ_H=Γ and dimension n; point has dimension 0 and is excluded; graph w₂=w₁² has nonzero second derivative 2. | Pass |
| §§12.2–12.3 equivalence | m=n; m=1 in Picard example; trivial stabilizer | Full-dimensional map is identity, degree 1; trivial stabilizer quotient is Bᵐ of infinite volume, hence not Γ-special; n=1 only full S_Γ has positive dimension. | Pass |
| §12.4 intersection setting (sample) | Q=B×{s}, B×S, {x₀}×S | (dim Q,dim U)=(n,0),(2n,n),(n,0); bounds dim Q−n=0,n,0, all equalities. Finite neat pullback preserves component dimensions. | Pass; this is not an Ax–Schanuel proof |

### Seeded source verification

Read the cited cached versions, not an assumed published numbering. Page numbers below are printed pages of those versions. There are no additional locators marked “unverified”; settled uncertified/waived works were not requested again.

| Sampled target | Locator, hypotheses and support |
|---|---|
| 1.4 | BaldiUllmo2023 lines 486–496, p.12, defines the form and matrix quotient, not the entire KAK package. The extra formulas are deductions here; KAK and homogeneous-space statements resolve to the named suppliers. Goldman1999 Ch.3 is uncertified. |
| 1.5 | BaldiUllmo2023 lines 517–519, p.13, and 559–571, p.14; Mok2012 lines 138–154, p.4. These give the unipotent/central and Siegel objects. The explicit MAN identification is the new supplier comparison. The n=1 abelian case is separately retained. |
| 3.1 | BaldiUllmo2023 lines 496–506, p.12. This supports subspaces and stabilizers, but its product wording is corrected to a compact-kernel extension. The m=0 extension is explicit and computed. |
| 3.2 | Goldman1999 Ch.3 is settled uncertified; no claim to have read it. RealSemisimpleLieGroups §5.7 at PR #2229 explicitly states the local complex classification. The affine tangent-space identification is checked above. |
| 3.3 | BaldiUllmo2023 lines 496–506 concerns subspaces, not the singular analytic classification by itself. The roadmap supplies the completeness/regular-locus argument using §3.2 and ComplexKahlerGeometry K3; irreducibility and closedness are present. Goldman remains uncertified. |
| 4.1 | Mok2012 lines 324–335, p.8, supplies the pinched-negative-curvature trichotomy. The roadmap states no interior fixed point in its parabolic/loxodromic definitions and supplies the matrix argument; finite order is asserted only inside a discrete subgroup. |
| 9.1 | Mok2012 Theorem 2, lines 495–514, p.12, requires completeness and positive twisted curvature. Its proof passages lines 681–772 and 817–901, pp.16–20, give regularized weights, value/tangent separation and uniformity on a compact set. Finite prescribed jets follow by finitely many disjoint cutoffs. The canonical twist is correct in this target; §2.3 is R01. |
| 9.4 | Mok2012 Main Theorem, lines 546–562, p.13, and Theorem 1, lines 476–484, p.11, support normalization and contraction. The design assumes neatness, which ensures the abelian-boundary model used in the argument. Normality under analytification is declared as a gap, not silently assumed supplied. |
| 10.3 | MilneSVI Theorem 3.14 and proof, lines 1742–1744 and 1764–1780, pp.39–40, are arithmetic; Deng2020 Theorem A, lines 87–90, p.3, has the additional Hodge hypotheses of R05. The independent non-arithmetic route uses §10.2. |
| 10.4 | MilneSVI Corollary 3.16, lines 1770–1774, p.40; BaldiUllmo2023 Theorem 3.1.12, lines 455–465, p.11, read together with its torsion-free reduction at lines 102–104, p.3. The roadmap keeps unrestricted uniqueness for torsion-free groups and the finite-cover condition for general groups. |
| 10.6 | BaldiUllmo2023 lines 102–104 only uses finite-index reduction; the roadmap accurately identifies the full functoriality theorem as its own deduction from finite quotients. Its normal-core route and generic degree argument are valid. |
| 11.2 | WitteMorris2015 Theorem 5.1.11, line 3676, p.88; Proposition 5.3.1, lines 3909–3911, p.94. The latter is the no-unipotents criterion; AdelicAlgebraicGroups §3.4 supplies its anisotropy formulation. The compact-kernel transfer is written here. |
| 11.3 | BaldiUllmo2023 lines 442–454, p.11, distinguishes full conjugacy class and component; MilneSVI Theorem 3.12, pp.38–39, is background for arithmetic algebraization. The explicit datum, component count and isogeny passage are deductions with named supplier inputs, not quotations of these source lines. |
| 12.1 | BaldiUllmo2023 lines 49–50, p.2; Definition 3.1.6, lines 421–423, p.10; Definition 3.1.13, lines 468–474, p.12. Positive dimension and irreducibility are retained. The torsion-compatible lift-component definition is the roadmap's explicit extension of the torsion-free setting. |
| 12.4 | BaldiUllmo2023 Theorem 1.2.2, lines 91–97, p.3, gives the atypical codimension condition. This target only sets up the graph and ordinary lower dimension bound; it does not claim the source's Ax–Schanuel conclusion. Its separate neat-cover reduction handles quotient singularities. |

The added arithmetic locator was also checked: WitteMorris2015 Proposition 9.4.5, lines 8668–8680, p.202, gives arithmetic-image commensurability; Exercise 4.1#10, lines 2000–2004, p.48, gives lattice containment implies finite index. The latter source states semisimple standing assumptions; the roadmap's fundamental-domain proof works for its stated unimodular second-countable locally compact group.

### Pinned library audit

The baseline revisions match `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Opened the file-and-line citations and declarations below at those pins. No missing cited pinned name was found.

| Pin file | Declarations inspected |
|---|---|
| `Mathlib/Algebra/Lie/Classical.lean:175` | `LieAlgebra.Orthogonal.indefiniteDiagonal`; namespace and ±1 diagonal |
| `Mathlib/LinearAlgebra/UnitaryGroup.lean:105` | `Matrix.unitaryGroup`, the positive-definite matrix unitary submonoid; no replacement indefinite group here |
| `Mathlib/Logic/Equiv/Fin/Basic.lean:224` | `finSumFinEquiv`, with inl 0 sent to 0 |
| `Mathlib/LinearAlgebra/Projectivization/Basic.lean:48`; `Mathlib/Topology/Algebra/Projectivization.lean:44` | `Projectivization`, `instTopologicalSpace`; quotient topology alone does not assert separation |
| `Mathlib/Analysis/Complex/UnitDisc/Basic.lean:30`; `Mathlib/Analysis/Complex/Schwarz.lean:189` | `Complex.UnitDisc`, `Complex.dist_le_div_mul_dist_of_mapsTo_ball`, with differentiability and MapsTo hypotheses |
| `Mathlib/Topology/Algebra/ConstMulAction.lean:534` | `ProperlyDiscontinuousSMul`; `finite_stabilizer'` at 566 and `finite_stabilizer` at 601. The primed statement needs no separation axiom. |
| `Mathlib/Topology/Algebra/Group/DiscontinuousSubgroup.lean:28`; `Mathlib/Topology/Algebra/Group/Subgroup.lean:155`; `Mathlib/Topology/Algebra/ProperAction/CompactlyGenerated.lean:95` | The cited subgroup/proper-action characterizations; the last retains discrete group and continuity hypotheses |
| `Mathlib/MeasureTheory/Group/FundamentalDomain.lean:69` | `IsFundamentalDomain`, with almost-everywhere coverage/disjointness; `covolume` at 679 is 0 if there is no fundamental domain, so existence must precede the finite-volume interpretation; `covolume_eq_volume` at 695 requires countability and invariant measure |
| `Mathlib/GroupTheory/Commensurable.lean:58` | `Subgroup.Commensurable`, and `Subgroup.commensurator` at 141 |
| `Mathlib/GroupTheory/GroupAction/Defs.lean:349` | `MulAction.orbitRel.Quotient`; `MulAction.stabilizer` at 515 |
| `Mathlib/AlgebraicGeometry/Normalization.lean:122` | `AlgebraicGeometry.Scheme.Hom.normalization`, relative to the given morphism, not normalization of the identity |
| `Mathlib/RingTheory/Jacobson/Ring.lean:60` | `IsJacobsonRing`; `isJacobsonRing_of_finiteType` at 681; `finite_of_finite_type_of_isJacobsonRing` at 691 gives module-finiteness over R, not finite cardinality without a finite base |
| `Mathlib/RingTheory/Ideal/KrullsHeightTheorem.lean:282` | `Ideal.height_le_spanFinrank`, with Noetherian hypotheses and I≠⊤ |
| `Mathlib/Analysis/InnerProductSpace/PiL2.lean:296`; `Mathlib/LinearAlgebra/Matrix/ProjectiveSpecialLinearGroup.lean:36` | `EuclideanSpace.equiv`; `Matrix.ProjectiveSpecialLinearGroup` is the quotient by the centre |
| `TauCeti/Topology/Algebra/UnitaryGroup.lean:104` | `TauCeti.Matrix.isCompact_unitaryGroup` and compact-space instance at 110 |
| `TauCeti/Topology/Algebra/Projectivization.lean:188` | `instT2Space`, `instCompactSpace` at 215, `affineOpenPartialHomeomorph` at 311; separation and finite-dimensional compactness hypotheses specialize correctly |
| `TauCeti/Geometry/Manifold/Instances/Projectivization.lean:54` | `instChartedSpace`, `instIsManifold` at 82, `contMDiff_affineChart_symm` at 96 |
| `TauCeti/Analysis/Complex/CauchyIntegralPolydisc.lean:351` | `DifferentiableOn.analyticOnNhd_of_finiteDimensional`, on open finite-dimensional complex domains |
| `TauCeti/Geometry/Manifold/Instances/Quotient.lean:253` | `TauCeti.isLocalDiffeomorph_quotientMk`, applied through the free-action contract |
| `TauCeti/MeasureTheory/Group/ProperlyDiscontinuous.lean:100`; `TauCeti/Topology/Algebra/GroupAction/FreeLocus.lean:36` | `exists_isFundamentalDomain_of_properlyDiscontinuousSMul`, `TauCeti.freeLocus`; disjoint translates with a null non-free locus, not coverage of fixed points by disjoint translates |
| `TauCeti/GroupTheory/SpecificGroups/Heisenberg.lean:58` | `TauCeti.HeisenbergGroup`; its central product term is pq′, matched by z=−t/4+pq/2 |
| `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:82` | `TauCeti.riemannianVolume` on the supplied Riemannian structure |

### Supplier, ownership and overlap audit

Resolved current citations by reading main and the available open heads; the resolver's sixteen apparent missing Lean names are prospective supplier declarations, not missing library declarations. `Reduction.IsSArithmetic`, `Reduction.arithmetic_finite_volume_iff`, `Reduction.levelArithmetic` occur in AdelicAlgebraicGroups §3.4; the thirteen `TauCeti.Shimura.*` names occur in the specified ShimuraVarieties sections. They are not incorrectly claimed to exist at the library pins.

| Supplier | Resolved location and consumed object |
|---|---|
| RealSemisimpleLieGroups, PR #2229 | `TauCetiRoadmap/RealSemisimpleLieGroups/README.md:804` (§3.1 MAN datum), 1104–1285 (§§5.2–5.7: proper action, Hadamard geometry, fixed point, Haar-volume comparison, explicit ball); its local complex classification is at 1317–1322. |
| LieGroups, main | `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:1362`, KAK; `Suggested.lean:509`, `IwasawaData`; 598, 605, KAN/KAK. The middle-factor uniqueness is in the README, not silently inferred from the existential Lean signature. |
| AdelicAlgebraicGroups, PR #792 | `TauCetiRoadmap/AdelicAlgebraicGroups/README.md`, §§1.1, 3.4, including integral closure models, model independence, anisotropy criterion, real arithmetic-lattice predicate and compact-kernel image theorem. No isogeny integral-point comparison was supplied there in place of §11.1(c). |
| ShimuraVarieties, PR #933 | `TauCetiRoadmap/ShimuraVarieties/README.md`, §§P.1–P.2, P.6, 0.1, 0.4–0.5, 1.2, 2.1–2.2, 2.7, 3.3, 3.4a, 3.5. In particular rational boundary and Satake compactness are at lines 540 and 554. |
| ComplexComparisonPartII, PR #848 | `TauCetiRoadmap/ComplexComparisonPartII/README.md`, §§C−1.1–C−1.2, C0.6, C1.4, C1.6, C1.9, C4.1, C4.2, C4.4. Analytic-space carrier has no global Hausdorff axiom (R02); the weighted estimate uses E⊗K⁻¹ and complete Kähler metrics; proper-source algebraicity retains proper source. |
| PELModuli, PR #966; ShimuraData, PR #1038 | `TauCetiRoadmap/PELModuli/README.md` §M5.5: the three named unitary datum declarations, with signature and polarization choices; `TauCetiRoadmap/ShimuraData/README.md` §3.8: compact dual and Borel embedding. |
| AlgebraicModuliForArithmeticGeometry, PR #853 | `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md` §§5.4, 9.5: finite normalization over a finite-type complex base and consumption of ResolutionOfSingularitiesCharacteristicZero §6.2's smooth projective strict-SNC compactification. |
| Main analytic/geometric suppliers | `TauCetiRoadmap/ComplexKahlerGeometry/README.md` K1–K4, K6.0; `TauCetiRoadmap/ComplexManifolds/README.md` Milestones 4–7; `TauCetiRoadmap/RiemannianGeometry/README.md` R4.7, R5a and HopfRinow contract; `Completed/ConformalMapping/README.md` Layer 2; `TauCetiRoadmap/FuchsianOrbifolds/README.md` Layers 0–4 and L2.1. |
| Main lattice and quotient suppliers | `TauCetiRoadmap/VonNeumannAlgebras/README.md:2861`, Layer 9 generic lattices and Weil formula; `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3450`, `finiteGroupQuotient_projective`. |

Searched main, open heads with `roadmaps grep`, and the pins by objects: indefinite unitary groups, ball automorphisms/Cartan uniqueness, Zassenhaus neighbourhoods, Selberg's lemma, arithmetic images/isogenies, and discrete overgroups of lattices. The generic KAK/MAN/ball geometry is imported from its owners. The new integral-point isogeny comparison and discrete-overgroup finite-index argument were not found owned elsewhere in this search. General non-arithmetic ball quotient compactification and extension remain this roadmap's contribution. ArithmeticFuchsianGroups' quaternionic classification/covolume and KleinianGroups' real hyperbolic three-space results are different objects; their scope does not justify importing the n-dimensional ball results from them.

Read the board package index before the absence checks: the indexed AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory packages are not an absent-package assumption. No same-name roadmap folder is present on main, no second-copy condition is reported, and the overlap input reports no competing head, dropped cited id or revision-only cited id. No inherited id was removed by this repair.

Overlap check: read RealSemisimpleLieGroups, ArithmeticFuchsianGroups, KleinianGroups, ShimuraVarieties, AdelicAlgebraicGroups, FuchsianOrbifolds, ConformalMappingPartII and ComplexKahlerGeometry; form/group/ball/metric/local submanifold classification → RealSemisimpleLieGroups §5.7; MAN → its §3.1; KAK → LieGroups Layer 9; arithmetic predicate/reduction → AdelicAlgebraicGroups §3.4; arithmetic quotient and Baily–Borel → ShimuraVarieties; n=1 coarse quotient/cusps → FuchsianOrbifolds; disc Schwarz–Pick → Completed/ConformalMapping; analytic-germ/Kähler/bundle foundations → ComplexKahlerGeometry. The results/headings closest-roadmap list is empty. No additional common owner was found.

Dependency gate output:

```text
candidate: BallQuotientsAndComplexHyperbolicLattices is not in the merge order yet; checked as if placed after ShimuraData (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2183 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. RealSemisimpleLieGroups is an open new-roadmap supplier not yet listed in ORDER, so this output alone does not certify the final placement after that supplier. This is recorded for the human reviewers, not as a finding against an uninserted design.

### Headlines and Lean acceptance checks

The Summary's headlines are: Aut(B)=PU(1,n); complex totally geodesic classification; the cusp structure theorem; finite generation/presentation and the eigenvalue Selberg theorem; the normal analytic quotient; toroidal compactification; L² jets and projectivity of the minimal compactification; big Picard extension and Borel algebraicity; algebraic-model and finite-point compactification uniqueness; the arithmetic Shimura datum and Baily–Borel comparison; Γ-special/totally-geodesic equivalence; and the graph/intersection setting in B×S_Γ. The last is expressly not Ax–Schanuel itself.

This is a **design**, not a package. There is no `Suggested.lean` anywhere in this package. Therefore the package-only headline coverage/docstring check, one-tactic probe on every sorried theorem, import check and elaborated-binder comparison have no declarations to examine. Elaboration: **not available (this lane does not elaborate)**. No Lean command was run, no successful build is claimed, and absence of a Lean file at this design stage is not a finding.

### Copyright, wording, arrangement and reuse

Compared the fourteen sampled passages with readable cited text (all except the Goldman-only §3.2) and five further passages from §§1.3, 2.2, 6.2, 8.1 and 9.2. Also checked §10.3 against Deng rather than only Milne. This is nineteen distinct roadmap passages against five sources. A supplementary normalized-word comparison found maximum runs of 2–10 alphabetic words; the longest is the short mathematical assertion that X is a finite disjoint union of Hermitian symmetric domains, not a copied expository paragraph. No source sentence sequence, exercise list, table, figure or distinctive proof-plan wording was reproduced.

Before References, exact manifest-key citation occurrences are: BaldiUllmo2023 38, Mok2012 27, WitteMorris2015 17, MilneSVI 9, Goldman1999 8, Raghunathan1972 6, Kiernan1972 4, Deng2020 3, DeligneMostow1986 3, Mostow1980 2, and seven other keys once each: 124 in total. This counts citation occurrences, not distinct theorems or pages.

Opened BaldiUllmo2023's contents at lines 14–23. Its §§3.2–3.4 distribute across this roadmap's Layers 1–3, 8, 6, 10–12 rather than forming a sequence of corresponding layers. Its Hodge, comparison and finiteness sections 4–7 are excluded consumers' work. The roadmap orders cusps before toroidal charts (§8.1 needs §6.1), toroidal asymptotics before L²/projectivity (§9.2 needs §§8.2–8.4), and the minimal compactification before extension (§10.1 needs §§9.4–9.5). Those orders are forced by the stated dependencies, not the source contents. Mok's sections on cusp geometry and L² supply portions of several layers; the arithmetic comparison, automorphism classification and special-subvariety setting have other sources and independent scope.

Source independence: 19 passages compared with 5 sources, no copied expression found; largest share BaldiUllmo2023, 38 of 124 citation occurrences; contents compared with BaldiUllmo2023: independent. Goldman1999 and other settled unread sources were not included in the wording comparison.

## Not verifiable

- Goldman1999 Ch.3, including the direct source for sampled §3.2, is settled uncertified; its theorem/page detail and wording could not be read. The corresponding supplier statement was read.
- Raghunathan1972 Chs.VIII/XIII, Borel1969 §17 Corollary 17.7, Alperin1987 pp.269–273, Borel1972 Theorem A, BailyBorel1966 Theorem 10.11, SiuYau1982 pp.363–380 and Cartan1957 pp.90–102 remain settled uncertified. They were neither refetched nor guessed.
- GarlandRaghunathan1970 Theorems 0.7 and 4.10 remain waived; the full original reduction proof was not certified.
- No package Lean file, elaboration, binder output or tactic probe is available in this lane.
- Open-head ownership was checked against the supplied index and the tool's accessible heads, not future changes. The unlisted RealSemisimpleLieGroups supplier is outside the gate's ordering coverage.

## Source issues

These are source-text issues observed while checking the cited passages; they are separate from the five roadmap findings.

- **Error** in Mok2012 at §1.1, equations (5)–(6), printed p.5, lines 173–175: the source says lattice elements have vertical coordinate in τℤ; it should allow a coset t_a+τℤ and its unitary multiplier; affects a stated result.
- **Error** in BaldiUllmo2023 at §3.2, printed p.12, lines 500–502: the source says the subspace stabilizer is a product of PU(1,m) and a compact group; it should state a compact-kernel extension; affects a stated result.
- **Misprint** in BaldiUllmo2023 at §3.2, printed p.12, line 501: the source says m is the rank of W_C in PU(1,m); it should use dim_C(W_C)−1; affects a stated result.
- **Misprint** in Mok2012 at §2.2, printed p.14, line 604: the source says E=K⊗[D]⁻¹; it should use E=K⊗[D], consistent with the simple-pole frame and Main Theorem; affects the proof.
- **Error** in Mok2012 at §2.2, equation (4), printed p.15, line 641: the source says Θ(K^q)+Ric=(q−1)ω; it should be (q−1)(n+1)ω for the form fixed in §1.2; affects the proof.
- **Misprint** in Mok2012 at §2.2, printed pp.15–19, lines 642, 718, 824 and 879: the source says Theorem 1 supplies the L² solution; it should refer to Theorem 2; affects the proof.
- **Misprint** in Mok2012 at §2.2, printed p.18, line 819: the source says the new section has exponent ℓ₁; it should have exponent ℓ₂, as the construction immediately afterward uses; affects the proof.
- **Misprint** in Mok2012 at §2.2, printed p.20, lines 895–896: the source says s=u−χ₁e^k has value +e^k at x₁; it should have value −e^k, or define s=χ₁e^k−u; affects the proof.
- **Misprint** in WitteMorris2015 at Proposition 4.7.4 proof, printed p.64, line 2709: the source says the subgroup generated by S equals the fundamental set F; it should equal the acting group Λ; affects the proof.

## For the human reviewers

- **Ordering:** RealSemisimpleLieGroups PR #2229 supplies §§3.1 and 5.2–5.7 but is absent from `merge-order/ORDER.txt`. The gate's insertion after ShimuraData does not by itself establish placement after this supplier.
- **Not tested:** Goldman1999 and the eight other settled uncertified/waived works listed above were not compared for wording. The largest-share source, BaldiUllmo2023, was readable and its contents were compared.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "f8d35e3edbb0f5d9ec06966ba171038ab3d0e24d", "job": "REV-DESIGN-BallQuotientsAndComplexHyperbolicLattices~5", "model": "gpt-6-astra", "worker": "chris-6"} -->
