# Review of StringOrientation (pull request #948 at 1eb7cbc)

**Verdict:** needs changes

Two P2 findings and one P3 finding remain. The supplied gate passes; independent Lean elaboration and the dependency check also pass. No PR file was changed.

**Previous findings, checked first, individually.** These dispositions concern the actual witnesses in the preceding review, not an assumption that the rest of each section is sound.

- Previous R01 — repaired. S3.4 now says “there is no H with `dH=½p₁(A)` and no geometric String structure” (README:831). On the Hopf bundle the two integrals are 0 and −1; on the added flat trivial bundle they are both 0.
- Previous R02 — repaired. S1.5 now says “Take `J₃(𝕆)` from RepresentationTheory/LieHighestWeight Layer 8’s compact real algebra suppliers and formally real Albert supplier” (README:408). Main's two named suppliers exist at lines 1255 and 1332. The positive trace norm excludes the unbounded split-idempotent family.
- Previous R03 — repaired. S2.3 now uses “the change of the total framed bordism class is `Σ_j J(β_j)`” (README:578). For S³⊔S³ and α=(1,−1), the terms are −J(g), J(g), with sum 0; the empty sum is 0.
- Previous R04 — repaired for its separation/partition-of-unity witness. The conventions now require “Hausdorff and second-countable” (README:118–119), and S3.0 says “If M is Hausdorff, its diagonal is closed” (README:643). The doubled-origin example is correctly retained as a failure of closedness. A separate missing boundary hypothesis is R01 below.
- Previous R05 — repaired. S3.5 uses “`Diffeology.IsContDiffCompatible` only on real normed coordinate/model spaces” (README:855). Its C∞(pt,S¹)=S¹ example has π₁=ℤ, whereas a real normed space has π₁=0.
- Previous R06 — repaired. S5.3 now states the splitting “for every odd prime p” (README:1048), with the exact factors and transition maps. At p=3 there is one factor; at p=5 there are two. Hovey–Ravenel Corollary 1.5(2), p. 8, agrees.
- Previous R07 — repaired. S2.3 says “Take `π₃S≅ℤ/24` and its generator ν from EllipticCohomology E4.S” (README:555). The supplied E5 passage at lines 1675–1676 explicitly supplies π₁₂(S⁹) and identifies E4.S as its stem calculation. Here the additional target transports it to every n≥5 and compares framings.
- Previous R08 — repaired. The contracts now name “Layer 11 item 3” of DGFloer (README:209), and S1.2 consumes its compact connected criterion. Main's paragraph at line 1614 includes the finite cover and nonzero π₃ argument. S¹ has (π₁,π₃)=(ℤ,0); SU(2) has (0,ℤ).
- Previous R09 — repaired. S6.1 now says “For n≥2 and r>0” (README:1157). At radius 1 the unit-vector Ricci values are 1 on S² and 0 on S¹.
- Previous R10 — repaired for the cited blocks. S1.4 and S5.1 now identify their constructions and inputs as derived constructions. S3.1 supplies Cheeger–Simons Theorems 1.1, 1.11, 2.2 and the Bunke locators, explicitly distinguishing real forms from Bunke's complex forms. These locators were opened, not inferred from the bibliography. R03 below concerns the remaining undetermined relative sign, not the repaired absence of a derivation.

No repair report marking any of these findings “not actionable in this package” was supplied. None of the findings below re-raises such a settled finding.

## R01 (P2) — Separate boundaryless good covers from boundary and corner models

**Location:** `TauCetiRoadmap/StringOrientation/README.md:632`: “Define a good cover as an open cover all of whose nonempty finite intersections are diffeomorphic to `ℝⁿ`; every Hausdorff second-countable manifold has a good cover”.

**Claim:** Hausdorffness, second countability and finite-dimensional native manifold structure suffice for this good-cover theorem. No standing convention excludes boundary or corners; S3.5 makes a boundaryless hypothesis explicitly when it needs one.

**Witness:** At 0 in [0,∞), local H₁ is 0; at an interior point of ℝ it is ℤ. Thus no neighborhood of 0 is diffeomorphic to ℝ, although the half-line satisfies the stated global hypotheses.

**Repair:** State the ℝⁿ-intersection theorem for boundaryless manifolds, explicitly. If the differential constructions also take boundary/corner bases, supply their separate cover/Poincaré comparison with smoothly contractible model neighborhoods, rather than asserting those neighborhoods are ℝⁿ. Keep the interval prisms in the homotopy formula under their actual boundary convention. The native half-space carrier is `EuclideanHalfSpace` in `Mathlib/Geometry/Manifold/Instances/Real.lean:59`, with its model at line 176; `IsManifold` alone does not exclude it. On the repaired boundaryless branch ℝ has interval good covers. On the boundary branch [0,ε) contracts smoothly but has local H₁=0, exactly as required by the separate model. Add these as opposite controls. This is a hypothesis defect independent of access to Bott–Tu.

## R02 (P2) — Specify the classifying map and degree equation for the geometric families

**Location:** `TauCetiRoadmap/StringOrientation/README.md:1096`: “the vertical contribution `4n_f²(x₁²+x₂²)`, and λ=0 from the integral class on the torsion-free degree-4 cohomology. Choose degrees by `n=3a+8b`”.

**Claim:** S5.4 determines the bundles and cancellation that produce the generators. But `n_f`, the two hyperplane classes, and their F₄ classifying map are never defined in the README. The auxiliary integer in Lemma 8 is also conflated with the n in dimension 4n; the examples consequently describe families only for n≥14.

**Witness:** V²(2,3,3)⊂CP⁵ has c₁=−2h, p₁=−16h², ∫h²=18. The constant F₄ classifier gives λ(OP²×V)=−8h², pairing −144; the intended level-2 classifier contributes +16h², cancelling p₁.

**Repair:** State the map from the product of complete intersections through CP∞×CP∞ and the maximal torus to BF₄, with root pullbacks `(e₁,e₂,e₃,e₄)=n_f(x₁,x₁,x₂,−x₂)`, including the integral-lattice check. Define the base dimensions m,m′ by m+m′=2n−8. For each factor impose `3a+8b=4n_f²+m+1` (respectively m′), where a counts quadrics and b counts cubics; use a different letter for this auxiliary integer. Require the needed prime-coprimality of n_f when proving the generator valuations. Cite mctague-cayley-plane lines 972–1027, printed p. 16, for this construction, retaining the corrected square on n_f. Increasing n_f makes the auxiliary integers at least 14 for **every** required n≥4; it is not a restriction n≥14 on the bordism degree. Explain the separate low-degree generators in dimensions 8 and 12.

The witness tests the repair: n=5, m=2, m′=0, n_f=2 gives auxiliary integers 19 and 17, with (a,b)=(1,2) and (3,1). The first factor has p₁ coefficient `6−(4+9+9)=−16`, which cancels +16. The zero-dimensional second factor contributes no H⁴. A constant classifier remains a negative control. This repairs a missing specification of the family, not a false claim about McTague's theorem.

## R03 (P3) — Fix the relative obstruction sign in the check

**Location:** `TauCetiRoadmap/StringOrientation/README.md:400`: “a lift on `S³` with difference α … has relative obstruction ±α”.

**Claim:** The relative-lift interface and its conventions are fixed, but this Check still accepts either sign. Both opposite obstruction maps pass its extension-if-and-only-if-zero test.

**Witness:** With D⁴ standard-oriented and S³ boundary-oriented, `⟨δα,[D⁴,S³]⟩=⟨α,[S³]⟩=1` for the positive generator. Its negative evaluates to −1. Both vanish on α=0.

**Repair:** Define the relative obstruction convention, for example as the connecting class δα relative to an extending reference lift, and identify the mapping-path obstruction with it. Replace ±α by the resulting signed formula and test α=1 and α=2, giving 1 and 2 in this convention. If the chosen path model instead returns −δα, state and compare that convention explicitly. AlgebraicTopology Stage 8.11b already distinguishes the interval-last suspension and the pair boundary (`TauCetiRoadmap/AlgebraicTopology/README.md:1993`, especially 2030–2036); use that comparison. The α=0 extension criterion is unchanged.

## Verified sound

**Mechanical checks and scope.** Both review files were read in full at the requested head. The root README's Writing a roadmap checklist and CONTRIBUTING were read; the parent-relative copies named by AGENTS.md do not exist in this checkout. The supplied gate reports every check zero, including build, imports, outside-folder, stray-files, sorry-data, set_option and depcheck. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/StringOrientation'` has no output. The final worktree status is clean.

Independent `lake env lean` on `TauCetiRoadmap/StringOrientation/Suggested.lean` succeeds, with just the one expected sorry warning. A separate scratch copy with `#check @TauCetiRoadmap.StringOrientation.homotopyGroup_sphere_three_stem` retains both n and `5 ≤ n`; its elaborated type agrees with S2.3. A scratch one-tactic probe tried `simp`, `rfl` and `infer_instance`, and failed to close the theorem. Object searches found no pinned lemma from which this sphere computation follows by one `exact`. There are no other declarations to probe, no definitions, no lost section binders and no padding finding.

The requested dependency command, with this README, the supplied order, `--movable` and main content, returned exactly:

```text
depcheck: 208 roadmaps, 1461 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line appeared. EllipticCohomology and StringOrientation occur on lines 5 and 6 of the order file. Every Needs line was read; the mathematical source/target checks below are additional to the scanner. No supplier gap is declared. No copied source passage, computational algorithm, sorry'd data, option override or edit outside the folder was found in the PR's changes.

**Headlines.** The README names (1) λ obstruction, H³ torsor and 8-equivalence; (2) degree-three String/framed bordism and framing change; (3) affine string connections and the differential torsor; (4) integral modular Witten genus; (5) the Cayley-plane kernel theorem away from 6; (6) low-weight Ricci vanishing and the two refined counterexamples. Deeper intermediate targets include the non-Lie-group result, rational String bordism and the third stable stem. The docstring names the missing BSpin/K(ℤ,4), characteristic classes, spectra, Thom/bordism, gerbe/differential-cohomology and genus carriers. The native stable-range sphere theorem is present with its sharp n≥5 bound. The conjectures and proposed integral inclusions are explicitly distinguished from proved targets. No other headline was found statable at the pins using only a few simple native definitions.

**Computed adversarial pass.** The table below records individual definition, API, theorem and convention tests, including all 15 sampled sections, every headline and each finding. A passing row means the displayed calculation agrees; it is not a claim that finite testing proves a general theorem. Integral cohomology is denoted H. The quaternionic generator g has Ωλ(g)=−1. Source checks and access limits follow the table.

There are 136 rows. Numerical polynomial, gcd, dimension and complete-intersection calculations were also recomputed with exact integer/rational arithmetic.

| # | Statement | Instances | Computed values on both sides / wrong model | Result | Change |
|---|---|---|---|---|---|
| 1 | S1.1 normalized λ | universal generator | λ=1, p₁=2, 2λ=2; wrong λ=p₁ gives 4≠2 | Pass | None |
| 2 | S1.1 Hopf normalization | quaternionic line on oriented/reversed S⁴ | (c₂,p₁,λ) pairings (1,−2,−1), reversed (−1,2,1) | Pass | None |
| 3 | S1.1 mod-two law | quaternionic real rank 4 | λ mod2=1=w₄; sign reversal still gives 1 | Pass | None |
| 4 | S1.1 adjoint formula | SU(2) weights 0,2x,−2x | c₂(ad⊗ℂ)=−4x²; p₁=4x²=−4c₂; λ=−2c₂ | Pass | None |
| 5 | S1.1 sum and inverse | Hopf and negative virtual Hopf | λ values −1,+1; sum 0=λ(0) | Pass | None |
| 6 | S1.1 integral obstruction | S³∪₂e⁴ | H³=ker(2)=0, H⁴=coker(2)=ℤ/2; λ=1 mod2, 2λ=p₁=0 | Pass | None |
| 7 | S1.1 wrong Moore control | S⁴∪₂e⁵ | H⁴=ker(2)=0, H⁵=ℤ/2; stable Spin class set is a singleton | Pass | None |
| 8 | S1.2 path fibre | λ versus p₁ | π₄ fibre=ker(±1)=0; π₃=coker(±1)=0; p₁ fibre has coker(±2)=ℤ/2 | Pass | None |
| 9 | S1.2 connectivity and BO map | degrees 4,7,8 | fibre groups 0,0,ℤ; π₈BSpin=π₈BO=ℤ; π₈K(ℤ,4)=0 | Pass | None |
| 10 | S1.2 finite-rank pullbacks | ranks 0 and 3 | rank 0 fibre K(ℤ,3) has π₃=ℤ; rank 3 map is ×(−2), giving π₃ fibre=ℤ/2 | Pass | None |
| 11 | S1.2 rank 4 versus rank≥5 | Spin(4), stable generator | π₄BSpin(4)=ℤ² maps by a signed sum onto ℤ; kernel ℤ; stable π₄ map is ±1 with kernel 0 | Pass; pullback retained | None |
| 12 | S1.2 group fibre sequence | n=5 | π₃String=0→ℤ→ℤ→π₂String=0, middle map ±1; π_i unchanged for i≥4 | Pass | None |
| 13 | S1.2 compact Lie criterion | trivial group, S¹, SU(2) | (π₁,π₃)=(0,0),(ℤ,0),(0,ℤ); only the first has both zero | Pass | Previous R08 fixed |
| 14 | S1.2 no finite-dimensional Lie model | Spin(5) versus K(ℤ,3) | top rational H¹⁰=ℚ versus 0; contractible String would force the wrong equality | Pass on obstruction | None |
| 15 | S1.3 existence iff | trivial bundle on pt; Hopf S⁴ | λ=0 and 1 lift class; λ=−1 and 0 lift classes | Pass both directions | None |
| 16 | S1.3 torsor freeness/transitivity | trivial bundle on S³, coordinates 0,1,3 | differences 1,2,3 satisfy 1+2=3; stabilizer of 0 contains only 0 | Pass | None |
| 17 | S1.3 naturality and difference cocycle | degree 2 self-map of S³ | shifts1,2,3 pull back to 2,4,6; 2+4=6 | Pass | None |
| 18 | S1.3 dimension≤7 classification | S⁴; outside bound S⁸ | [S⁴,BSpin]=ℤ→H⁴=ℤ is ±1; [S⁸,BSpin]=ℤ→H⁴=0 is not injective | Pass with bound | None |
| 19 | S1.3 skeleton criterion | Hopf S⁴ and torsion Moore space | 3-skeleton restrictions trivial while λ=−1,1 mod2; 4-skeleton retains both obstructions | Pass | None |
| 20 | S1.3 arbitrary lift choices | S¹×S²; empty space | H³=ℤ and ℤ-torsor; empty H³=0 and one empty lift | Pass | None |
| 21 | S1.4 transport sign | identity gauge, g,2g | Ωλ values 0,−1,−2; transport shifts 0,+1,+2 | Pass | None |
| 22 | S1.4 composition | gauge g followed by2g | total shift1+2=3=−Ωλ(3g) | Pass | None |
| 23 | S1.4 direct sum differences | α=1,β=2 on S³ | sum difference 3; zero summand adds 0 | Pass | None |
| 24 | S1.4 inverse/normal comparison | α=1 | normal coordinate −1, tangent plus normal 0 | Pass | None |
| 25 | S1.4 relative existence | (D⁴,S³), α=0,1 | obstruction 0 extends; either ±1 is nonzero and does not extend | Pass for existence | R03 fixes signed interface |
| 26 | S1.4 relative convention | α=1,2, boundary orientation | δ pairings 1,2; negative convention −1,−2; both agree at 0 | Sign unresolved | R03 |
| 27 | S1.5 compact Albert model | trace-one idempotents; split null octonion | compact trace(A²)=1; split N(0,0,e₁,0)=0 permits unbounded off-diagonal tx | Pass | Previous R02 fixed |
| 28 | S1.5 isotropy and dimension | F₄/Spin(9), wrong Spin(8) | 52−36=16; wrong 52−28=24 | Pass | None |
| 29 | S1.5 cells and cohomology | cells 0,8,16 | H⁰,H⁸,H¹⁶=ℤ, χ=3; H³,H⁴=0 | Pass | None |
| 30 | S1.5 Spin and String uniqueness | OP² | H¹,H² mod2=0; H⁴ integral0 and H³ integral0: one Spin and one String class | Pass | None |
| 31 | S1.5 characteristic/signature formula | p₂=6u,p₄=39u² | (381·39−19·36)/14175=1; replacing 39 by 36 gives 1448/1575 | Pass consistency | Primary source uncertified |
| 32 | S1.5 Â formula | same OP² data | (−192·39+208·36)/464486400=0 | Pass | None |
| 33 | S1.5 Euler and Stiefel–Whitney | OP² | ∫e=3, ∫w₁₆=1 mod2; w=1 would give 0 | Pass | None |
| 34 | S1.5 HP² control | p₁=2u,p₂=7u² | λ=u≠0; signature(49−4)/45=1 | Pass | None |
| 35 | S2.1 Postnikov comparison | π₄,π₈ | τ≥4ko→Σ⁴Hℤ sends g to−1; fibre π₄=0,π₈=ℤ, as for BString | Pass | None |
| 36 | S2.1 inverse Thom diagram | virtual class θ and−θ | θ+(−θ)=0; point Thom unit goes1↦1 | Pass | None |
| 37 | S2.1 rational comparison | degrees 4,8 | ℚ[p₂,p₃,…] has ranks0,1, matching H⁴,H⁸ of BString | Pass | None |
| 38 | S2.2 structured PT | point for BO versus BSO | Ω₀^O=π₀MO=ℤ/2; Ω₀^SO=π₀MSO=ℤ; forgetting sends1↦1 mod2 | Pass | General source limit below |
| 39 | S2.2 multiplicative PT | signed zero-manifolds of counts2,3 | Cartesian product count 6=2·3; disjoint union count 5=2+3 | Pass | None |
| 40 | S2.2 rational Hurewicz | sphere spectrum | degree 0 givesℚ→ℚ; positive stable rational groups and homology both 0 | Pass | Uses G5.6 |
| 41 | S2.2 characteristic-number detection | OP² | ∫p₂²=36, ∫p₄=39, hence nonzero rational class | Pass | None |
| 42 | S2.2 rational ring ranks | dimensions4,8,12,16 | String ranks0,1,1,2; Spin partition ranks1,2,3,5 | Pass | None |
| 43 | S2.2 integral versus rational test | Lie-framed S¹ | integral class order 2, rationalization0, rational numbers0 | Pass | None |
| 44 | S2.2 non-String Spin class | K3 | σ=−16, p₁=−48, λ=−24≠0 | Pass | None |
| 45 | S2.3 unit range | degrees 3,4,5,6 | sphere and String groups ℤ/24,0,0,ℤ/2; Spin degree 3=0 | Pass | None |
| 46 | S2.3 stable sphere theorem/Lean | n=5,6,9 | indices 8,9,12; groups cyclic24,24,24; 8≤8,9≤10,12≤16 | Pass | None |
| 47 | S2.3 excluded unstable boundary | n=4 | π₇S⁴=ℤ⊕ℤ/12, not finite24; 7≤6 is false | Pass | None |
| 48 | S2.3 J and kernel | β=g,24g | imagesν,0 mod24; kernel elements multiples of24 | Pass | None |
| 49 | S2.3 relative e and closed Spin filling | K3 minus disc | ½p₁=−24≡0 mod24; adding a closed K3 changes value by 0 | Pass | None |
| 50 | S2.3 classifier comparison | S¹×S²,S³ | [M,Spin]=H³(M)=ℤ in both cases | Pass | None |
| 51 | S2.3 framing change | S³,α=1 | β=−g, tangent change+g, normal change−g, bordism−J(g) | Pass | None |
| 52 | S2.3 disconnected change | S³⊔S³,α=(1,−1) | β=(−g,g), total −J(g)+J(g)=0, torsor difference≠0 | Pass | Previous R03 fixed |
| 53 | S2.3 empty change | M=∅ | H³=0, no components, total sum 0 | Pass | None |
| 54 | S3.0 principal bundle and connection | trivial U(1) bundle | unit-section forms A=0 and x dy yield F=0 and dx∧dy; closed-only model loses latter | Pass | None |
| 55 | S3.0 nonabelian curvature | SU(2), A=τ₁dx+τ₂dy | dA=0, ½[A∧A]=2τ₃dx∧dy; missing½ gives 4τ₃ | Pass | None |
| 56 | S3.0 connection affine action | abelian A=x dy, a=dy | F(A+a)=dx∧dy=F(A)+da; a≠0 although da=0 | Pass | None |
| 57 | S3.0 Bianchi and gauge | U(1) example; constant SU(2) conjugation | d(dx∧dy)=0, bracket 0; SU(2) curvature transforms 2τ₃↦2Ad(g⁻¹)τ₃ | Pass | None |
| 58 | S3.0 good-cover test | two long arcs versus three short arcs on S¹ | two-arc intersection H⁰=ℤ²; nonempty three-arc intersections H⁰=ℤ | Pass | None |
| 59 | S3.0 good-cover generality | boundary 0 of half-line versus ℝ | local H₁=0 versus ℤ; global T2 and second countability hold in both | Fails stated hypotheses | R01 |
| 60 | S3.0 local fibre products | ℝ²→ℝ,k=2 | coordinates(x,u,v), dimension 3=4−1; projection has section(x,u)↦(x,u,0) | Pass | None |
| 61 | S3.0 closed fibre products | doubled-origin chart cover | cross piece {(t,t):t≠0} omits limit (0,0); Hausdorff ℝ projection includes all diagonal limits | Pass after repair | Previous R04 fixed |
| 62 | S3.0 non-submersion control | x↦x² at 0 | derivative 0; x²=y² gives two crossing lines, four punctured branches rather than two | Pass | None |
| 63 | S3.0 curvature carrier comparison | same SU(2) local form | both native/comparison constructions must give 2τ₃dx∧dy, not 4τ₃ | Pass | None |
| 64 | S3.1 character degree convention | pt,k=0,1,2 | Ĥ⁰=ℤ, Ĥ¹=ℝ/ℤ, Ĥ²=0; shifted convention would move ℝ/ℤ to0 | Pass | None |
| 65 | S3.1 curvature exact sequence | pt,k=1; S³,k=3 | 0→ℝ/ℤ→ℝ/ℤ→0; on S³ flat kernel H²(ℝ/ℤ)=0 | Pass | None |
| 66 | S3.1 class exact sequence | pt,k=1,2 | ℝ/ℤ maps isomorphically to Ĥ¹ with H¹=0; for k=2 all groups 0 | Pass | None |
| 67 | S3.1 product and naturality | unit 1∈Ĥ⁰, a=1/3∈Ĥ¹(pt) | 1·a=a=1/3; a·a lies in Ĥ²(pt)=0; curvature/class products both 0 | Pass | None |
| 68 | S3.1 homotopy formula | F(t)=t/3 in ℝ,h(x)=x modℤ | endpoint difference 1/3=a(∫₀¹dt/3); reversed −1/3≠1/3 | Pass | None |
| 69 | S3.1 real Deligne comparison | pt,k=1 | complex ℤ→ℝ has H¹=ℝ/ℤ; complex ℤ→ℂ would give ℂ/ℤ | Pass with stated coefficients | Previous R10 fixed |
| 70 | S3.1 integral curvature | Hopf circle bundle on S² | curvature period±1; boundary holonomy on area-period1/3 disc is exp(2πi/3) | Pass | None |
| 71 | S3.1 differential λ | Hopf Spin bundle | characteristic pairing−1, curvature integral−1; twice each gives p₁ pairing−2 | Pass | None |
| 72 | S3.2 gerbe degrees | S³ generator; S⁴ generator | gerbe DD∈H³(S³)=ℤ; 2-gerbe class∈H⁴(S⁴)=ℤ; swapping degrees yields0 | Pass | None |
| 73 | S3.2 identity presentation | Y=M | multiplication L⊗L≅L forces c₁(L)=0; trivial line admits unit multiplication | Pass | None |
| 74 | S3.2 dimension formula | dimY=2,dimM=1,k=1,2,3 | dimensions 2,3,4 = 2k−(k−1) | Pass | None |
| 75 | S3.2 descent and sign | two-sheet constant functions 1,3 | δf=3−1=2; reversed edge−2; three-sheet values 1,3,6 give3−5+2=0 | Pass | None |
| 76 | S3.2 noninjective pullback | Hopf S³→S² | generator in H²(S²)=ℤ pulls to0 in H²(S³) | Pass | None |
| 77 | S3.3 normalized transgression | Spin(n),n≥5 | H³=ℤ→H⁴=ℤ sendsηλ toλ; pairings tied to g are−1 and−1 | Pass | None |
| 78 | S3.3 rank 3 warning | stable restriction to SU(2) adjoint | level−2 versus level−1 for a generator; periods have magnitudes2 versus1 | Pass | None |
| 79 | S3.3 characteristic/curvature | quaternionic Hopf over S⁴ | ∫curvCS=−1=∫λ; no trivialization follows from this curvature formula | Pass | None |
| 80 | S3.4 connections on fixed T | M=Y=W=pt | Ω²=Ω¹=0, quotientV_T=0, affine space singleton | Pass | None |
| 81 | S3.4 differential torsor | flat trivial Spin bundle over S³ | shiftκ with class n adds ∫curvκ=n; n=1 changes period by 1 | Pass | None |
| 82 | S3.4 existence versus flatness | trivial bundle over ℝ⁴ with exact nonzero 4-curvature | λ=0; choose H with dH=curvature≠0, so λ̂ need not vanish | Pass | None |
| 83 | S3.4 Stokes obstruction | Hopf S⁴; flat trivial S⁴ | Hopf(∫dH,∫½p₁)=(0,−1); trivial(0,0) with H=0 | Pass | Previous R01 fixed |
| 84 | S3.5 plots | absolute value, cube, inverse cube | derivatives at 0: abs has−1/+1, cube has 0, inverse cube unbounded; only cube is smooth | Pass | None |
| 85 | S3.5 functional plots/evaluation | rotations p(u)(θ)=θ+u | adjoint derivatives(1,1); evaluation at θ=0 gives u, smooth | Pass | None |
| 86 | S3.5 general manifold compatibility | C∞(pt,S¹) | evaluation gives S¹ with π₁=ℤ; vector-space contraction would give 0 | Pass | Previous R05 fixed |
| 87 | S3.5 curry/uncurry and product topology | X=pt,Y=ℝ | both mapping carriers ℝ, evaluation identity; D-topology/product topology both ordinary ℝ | Pass | None |
| 88 | S3.5 integration convention | circle θ∈[0,2π] | ∫du∧dθ=2πdu; ∫dθ∧du=−2πdu | Pass | None |
| 89 | S3.6 holonomy normalization | ∫H=1,1/3 | exp(2πi)=1; exp(2πi/3)=−1/2+i√3/2; exp(1)=e fails U(1) | Pass | None |
| 90 | S3.6 degree 0 and injectivity | evaluation on pt | C∞(pt,M)=M and ev=id; pulled trivialization is T itself | Pass | None |
| 91 | S3.6 conditional surjectivity | point-determined family S | reconstructed T=S(pt); transgression at pt=T=S(pt), hence family equality under hypothesis | Pass conditional statement | No unconditional claim |
| 92 | S3.6 integral shift invariance | periods 1/3 and 4/3 | holonomies both exp(2πi/3); differential torsor shift remains nonzero | Pass | None |
| 93 | S4.1 symmetric-power construction | line L and trivial reduced line | inverse(1−tL)=1+tL+t²L²; inverse(1−t)·(1−t)=1 | Pass | None |
| 94 | S4.1 wrong sign | using λ_t rather than λ_(−t) | q¹ coefficient −L versus desired +L | Pass negative control | None |
| 95 | S4.1 completed product | reduced class W, coefficients q⁰,q¹,q² | factors n>2 contribute 0 through q²; coefficients 1,W,Sym²W+W | Pass | None |
| 96 | S4.1 Q constant/log | q=0,x²,x⁴ | coefficients −1/24,1/2880 = 2G₂(0)/2!,2G₄(0)/4! | Pass | None |
| 97 | S4.1 Q q-part | roots x,−x | q¹=eˣ+e⁻ˣ−2=x²+x⁴/12+…; log coefficients 1,1/12 | Pass on complex root pair | None |
| 98 | S4.1 formal versus numerical domain | x=0 formal; q=1 attempted | Q(0,q)=1 coefficientwise; at q=1 product formula has 0/0 factors, so no specialization asserted | Pass domain distinction | None |
| 99 | S4.2 index and integrality | point and OP² | genus point=1; Â(OP²)=0; weight 8 dimension 1 forces genus 0 | Pass | None |
| 100 | S4.2 rational p₁ hypothesis | dimension 4 String versus K3 | p₁=0 gives Â=0; K3 p₁=−48 gives Â=2, so cannot be a nonzero weight 2 modular form | Pass with hypothesis | None |
| 101 | S4.2 lift/connection independence | S³ torsor shifts 0,1 | ordinary genus 0 for both; refined classes differ by −J(g) | Pass; invariants distinguished | None |
| 102 | S5.1 associated tangent dimension | F₄/Spin(9) | vertical dim 52−36=16; total dim 16+dim B | Pass | None |
| 103 | S5.1 Euler quotient | Weyl orders | 1152/384=3=χ(OP²) | Pass | None |
| 104 | S5.1 Spin sum/obstruction | product OP²×HP² | vertical λ=0; total λ=π* u≠0 | Pass | None |
| 105 | S5.1 base-change hypothesis | pullback OP²→pt along HP²→pt | original λ=0, pullback total λ=u; arbitrary base change fails, Spin tangent identification absent | Pass | Previous derivation clarified |
| 106 | S5.1 products and boundary lifts | String lift plus its inverse | difference α+(−α)=0; boundary of cylinder gives [M]−[M]=0 | Pass | None |
| 107 | S5.2 root pushforward | F₄ and B₄ | positive roots 24−16=8, real dimension 2·8=16, Weyl cosets 3 | Pass | None |
| 108 | S5.2 family vanishing | trivial product OP²×B with String B | φ(OP²)φ(B)=0·φ(B)=0 | Pass instance | General theta proof limit below |
| 109 | S5.3 Hovey–Ravenel splitting | p=3,d=8 | one factor BP⟨1⟩₈; next space 12 maps by v₁ of degree 4 | Pass | Previous R06 fixed |
| 110 | S5.3 cover-transition factors | p=5,d=8 | factors 8,12; next 12,16; identity 12 and v₁:16→8 of degree 8 | Pass | None |
| 111 | S5.3 prime restriction for torsion-free coefficients | p≥5 versus 3 | ℤ/24⊗ℤ_(p)=0 for p≥5, ℤ/3 for p=3 | Pass with retained restriction | None |
| 112 | S5.3 odd-primary Spin/SO comparison | π₁, localization away 2 | before ℤ/2→0; tensor ℤ[1/2] gives 0→0 | Pass | None |
| 113 | S5.3 rational detection | OP² after inverting 6 | p₂²=36,p₄=39 remain nonzero in ℤ[1/6] | Pass | None |
| 114 | S5.4 first generator valuation | n=2,3 | 2n=4=5−1; 6=7−1=1+5; required prime exponents (5:1), (5:1,7:1) | Pass | None |
| 115 | S5.4 mixed characteristic number degree | p=5,i=1,j=2 | a=3,b=12; 4(a+b)=60=2(5+25); s₁₅ required 0, s₃,₁₂ nonzero mod 25 | Pass dimensional/condition check | No full family verification inferred |
| 116 | S5.4 gcd valuation formula | n=4,5,6,7 | Proposition 11 gcds 42,165,429,182; odd factorizations 3·7,3·5·11,3·11·13,7·13 | Pass, including p=3 | None |
| 117 | S5.4 even-binomial gcd | n=4,5,6,7 | gcds 14,15,33,91; odd factors 7,3·5,3·11,7·13 | Pass | None |
| 118 | S5.4 degree semigroup | N=13,14,15,16 | no solution 13; (a,b)=(2,1),(5,0),(0,2) give 14,15,16 | Pass for auxiliary integer | R02 separates N from dimension |
| 119 | S5.4 corrected root scaling | n_f=1,2 | 2Σeᵢ²=4(x₁²+x₂²),16(x₁²+x₂²); unsquared formula gives 4,8 | Pass correction | R02 defines map |
| 120 | S5.4 family specification | V²(2,3,3), intended versus constant map | c₁=−2h, p₁=−16h²; vertical 16h² versus 0; total λ=0 versus −8h² | Missing determining map | R02 |
| 121 | S5.4 low dimension and degree equation | n=5,m=2,m′=0,n_f=2 | N=19=3+16; N′=17=9+8; total dimension 20<56 and cancellation 16−16=0 | Pass repaired recipe | R02 |
| 122 | S5.5 kernel away 6 | dimensions 8,12,16 | kernel dim 0,0,1 rationally; OP² degree 16 has genus 0 and p₄=39 | Pass | None |
| 123 | S5.5 integral genus versus σ | degree-3 String generator | ordinary genus 0, class order 24; σ-image order 24, so it is not in ker σ | Pass distinction | None |
| 124 | S5.5 OP² ideal | degree 3 versus degree 16 | ideal degree 3=0, contains OP² degree 16; inverting 6 kills ℤ/24 | Pass | None |
| 125 | S6.1 positive Ricci definition | unit vectors on S²,S¹ at radius 1 | values 1,0; positive-definite test true, false | Pass | Previous R09 fixed |
| 126 | S6.1 dimension 0 exception | positively oriented point | no nonzero tangent vectors, Ric condition vacuous, genus 1≠0 | Pass exclusion | None |
| 127 | S6.1 bounding sphere | disc-induced lift on Sⁿ,n≥2 | genus boundary 0; arbitrary lift need not have refined class 0 | Pass | None |
| 128 | S6.2 low weights | weights 2,4,6,8,10,14 | dimensions 0,1,1,1,1,1; each one-dimensional space has basis constant 1; constant 0 forces the form to be 0 | Pass | None |
| 129 | S6.2 excluded weights | 12,16 | dimensions 2,2; Δ and E₄Δ have constant 0 but nonzero q¹=1 | Pass | None |
| 130 | S6.3 Lie curvature sign | SU(2),−B-orthonormal basis | bracket [e₁,e₂]=(1/√2)e₃; sectional ¼·½=1/8; Ric 2/8=1/4 | Pass | None |
| 131 | S6.3 Jacobi and connection | left-invariant X,Y,Z | ¼[X,[Y,Z]]−¼[Y,[X,Z]]−½[[X,Y],Z]=−¼[[X,Y],Z] | Pass | None |
| 132 | S6.3 zero-Killing negative control | abelian S¹ | B=0, so −B is not a metric; actual round metric Ric=0 | Pass stated metric condition | None |
| 133 | S6.3 refined counterexamples | left-framed S³,SU(3) | ordinary genera 0,0; tmf classes of orders 24,2; positive Ric=g/4 | Pass with supplier images | None |
| 134 | S6.3 periodicity arithmetic | d₂,d₃,D | degrees 192·3=576=72·8; local orders 8 and 3 give global 24 | Pass | None |
| 135 | S6.3 localization test | zero,unit,u₈ | D⁰0=0; all Dʲ1 nonzero rationally; injective periodicity keeps u₈ order 2 | Pass | None |
| 136 | S6.1 rejected converse in source | flat T⁴ | λ=0, genus=0, π₁=ℤ⁴ infinite; positive Ricci on a closed manifold would force finite π₁ | Source converse fails | Roadmap already omits converse |

**Seeded source audit — 15 targets.** Sources were obtained through the sources service from arXiv, institutional repositories or author pages. The checks use the retrieved versions: Redden v2, Waldorf v4, McTague's Cayley-plane paper v5, Bunke v6, CJMSW v2, Meinrenken v3, McTague's quotient paper v4, Hopkins v1, BMQ v4, Belmont–Shimomura v2, and the cited April 1994 Hovey–Ravenel preprint. These are version-specific locators; no agreement with an unread published version is assumed.

| Sampled target | Text and locator opened | What the text supports / limit |
|---|---|---|
| S1.2 BString and String(n) | redden-canonical-3forms lines 182–237, §2, pp. 4–5; GeneralizedCohomology G2/G5.0; DGFloer Layer 11 item 3 | The homotopy-fibre definition and obstruction argument agree. The finite-rank pullbacks and loop-group construction are explicit derived targets here. The non-Lie argument uses the named compact-group and rational-cohomology suppliers; it is not represented as Redden's Proposition 2.2. |
| S1.3 existence and torsor | redden-canonical-3forms line 214, Proposition 2.2, p. 5; line 237, Proposition 2.3, p. 5 | Vanishing of the pulled-back class is equivalent to existence; the lift classes form an H³ torsor. The fibre restriction description and equivariance agree. The stable classification through dimension 7 is derived using the 8-equivalence, not asserted without its dimension bound. |
| S1.4 transport and relative lifts | redden-canonical-3forms lines 237–270, Proposition 2.3; AlgebraicTopology Stage 8.11b | The source supports the fibre-class and torsor action. The sum, inverse and relative constructions are derived from the explicitly oriented path model. The relative Check leaves its sign unresolved: R03. |
| S1.5 Cayley plane | mctague-cayley-plane lines 739–778, Theorem 5, pp. 12–13; Borel–Hirzebruch I §19 remains uncertified | The homogeneous tangent/pushforward route is present in McTague. It does not substitute for opening the primary source's OP² class computation. The proposed p₂=6u, p₄=39u² pass the independent signature and Â calculations in rows 31–32. |
| S2.1 MString comparison | `TauCetiRoadmap/EllipticCohomology/README.md:1527`, E5, through line 1568 | The supplier actually builds bstring=τ≥8ko, its Thom spectrum, finite-rank comparison and map to MSpin. This roadmap adds the normalized λ-fibre comparison; it does not recreate the spectrum. The two low homotopy groups and Hopf sign agree. |
| S2.2 geometric bordism | milnor-stasheff lines 4854, 4876, 4894 and 5023, §18, Theorems 18.1–18.3 and 18.6, pp. 205–207, 211 | The Thom-space cells, classical cobordism construction, rational Hurewicz input and Thom transversality are present. The general structured bundle-diagram statement is broader than those classical cases; its Stong Chapter II locator remains uncertified. GeneralizedCohomology G5.6 supplies the rational stable comparison separately. |
| S3.1 differential characters | cheeger-simons lines 100–140, 254–290, 341–368, Theorems 1.1, 1.11, 2.2, pp. 52, 56–58; bunke-differential-cohomology lines 1264, 1442, 1585, 2619 | Degree k in Cheeger–Simons is degree k+1 here. Exact sequences, product and natural differential refinement agree. Bunke's Lemma 3.5, equation (23), Proposition 3.28 and Corollary 3.131 occur at pp. 33–34, 38, 41 and 68. His complex coefficients are explicitly replaced by the real-form construction here; the point test separates ℝ/ℤ from ℂ/ℤ. |
| S3.3 basic and Chern–Simons gerbes | meinrenken-basic-gerbe lines 524–540 and 627–650, §§5.2, 5.4; cjmsw-bundle-gerbes line 1109, Theorem 5.8, p. 24; waldorf-string-connections lines 726–730 and 759, Lemma 3.1.2, pp. 20–21 | The normalized Cartan curvature, multiplicative/transgressive comparison and half-Pontryagin curvature are present. Compactness, connectedness and n≥5 are retained where the basic Spin class must be primitive. The rank-3 test distinguishes level 2 from level 1. |
| S3.5 diffeological bridges | native `Mathlib/Geometry/Diffeology/Basic.lean`; lean-catdg at the cited commit, Manifolds lines 101–179 and Constructions lines 850–883, 912–919, 940–970 | The native normed-space compatibility class is not a class for arbitrary manifolds. The external development has the adjoint definition of functional plots and the locally compact binary-product argument. Some comparison steps are admitted, as identified below; the README treats them as comparisons and owns the proofs. |
| S3.6 transgression | waldorf-string-connections lines 1092–1097, equation (4.2.1), p. 30; lines 1210–1215, p. 33; lines 1258 and 1289, Lemmas 4.3.2–4.3.3, pp. 34–35 | Evaluation at the point gives injectivity. Surjectivity requires the point-determined hypothesis, which the roadmap keeps. The degree-3 exponential needs 2πi in the stated real-form normalization; the roadmap corrects it. The source does not provide an unconditional corners field theory. |
| S4.1 Θ and Q | `TauCetiRoadmap/TopologicalKTheory/README.md:665`–704, T2.1–T2.3; EllipticCohomology E4/E5, lines 1472 and 1605 | The λ-series, its unit and inverse identities support the symmetric-power definition. The Bernoulli normalization agrees. Direct coefficients of log Q at q⁰ are −1/24 and 1/2880; the q¹ root-pair contribution is x²+x⁴/12+⋯. No numerical substitution q=1 is asserted. |
| S5.1 Cayley-plane bundles | mctague-cayley-plane lines 739–747 and 972–1004, pp. 12, 16; S1.5 and SpinGeometry G4.1 | The associated homogeneous bundle and vertical tangent representation are supported. The total Spin/String construction is derived by Whitney sum. The roadmap explicitly requires the stable tangent identification for transporting total-space lifts under base change; OP²×HP² is the negative control. |
| S5.3 odd primes | hovey-ravenel lines 292–299, Corollary 1.5(2), p. 8; hovey-mstring line 508, Theorem 2.4, p. 2413; mctague-cayley-plane lines 350–385, pp. 6–7 | The space splitting applies at every odd prime, including 3; the torsion-free coefficient conclusions need p≥5. The identity and v₁ transition factors match the primary preprint. The p=3 and p=5 tests distinguish those two scopes. |
| S5.4 generators | mctague-cayley-plane line 324, Theorem 4, p. 6; lines 972–1037, construction and Lemma 8, pp. 16–17; lines 1114 and 1131, Proposition 11 and Lemma 12 | The valuation criterion retains both conditions, including the mixed characteristic number modulo p². The complete-intersection recipe is incomplete in the README: R02. Its corrected root scaling agrees with direct substitution, and four gcd instances agree with the printed criteria. This does not certify every step of the general prime-square proof. |
| S6.1 Ricci and Stolz | native Ricci and Levi-Civita definitions; mctague-cayley-plane lines 116–120, pp. 2–3; Stolz §1 remains uncertified | The curvature sign agrees with the native trace convention. The roadmap states only the conjectural forward implication, with positive dimension; it does not copy McTague's false converse. S¹ and the point are correctly excluded by the separate hypotheses. |

Additional source checks: cjmsw-bundle-gerbes line 913, Proposition 4.8, p. 20, gives the 2-gerbe classification with the requisite degree shift. Waldorf's Corollary 1.3.2 (line 382), Theorems 1.3.3–1.3.4 (lines 404, 428), and Proposition 3.3.4 (line 885) support the differential torsor, curvature and affine connection targets of S3.4. McTague's quotient Theorem 1 and Corollary 2 (mctague-tmf-quotient lines 124, 146, pp. 2–3) justify distinguishing ideal statements from a ring-spectrum quotient. Hopkins Proposition 4.6 and the following table (hopkins-icm2002 lines 382–405, pp. 292–293) identify the low-degree classes, including the nonzero left-framed SU(3) class. The periodicity inputs are the tensor description in bmq-hurewicz lines 128–129, p. 3, and Belmont–Shimomura Theorem 6.1 (belmont-shimomura lines 653–655, p. 18). These are consistent with the powers and orders in rows 133–135.

**Pins and duplication by object.** The inspected pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches covered homotopy groups of spheres, Spin/String classifiers, Thom spectra and bordism, differential characters and gerbes, diffeology constructions, submersions and smooth fibre products, λ-operations, Witten genera and Cayley-plane bundles. The following 12 source groups were opened at those pins; these are native inputs, not new targets to redeclare.

| Pinned source | Declaration or definition inspected | Scope that matters here |
|---|---|---|
| `Mathlib/Topology/Homotopy/Basic.lean:76` | `ContinuousMap.Homotopy` | The interval is the first product coordinate; comparison to the roadmap's interval-last loop convention needs the explicit swap. |
| `Mathlib/Topology/Homotopy/HomotopyGroup.lean:441` | quotient carrier; group structures at lines 547 and 603 | Native unstable pointed homotopy groups support the single Lean headline. They do not themselves compute the third stem. |
| `Mathlib/Geometry/Diffeology/Basic.lean:319` | `ofCorePlotsOn`; `IsDTopologyCompatible` at 351, `IsContDiffCompatible` at 370 | The latter requires a real normed vector space. General manifold and functional-map constructions are not supplied by this file. |
| `Mathlib/Geometry/Manifold/PartitionOfUnity.lean:548` | hypotheses and `SmoothPartitionOfUnity.exists_isSubordinate` at 551 | T2 and sigma compactness are required; the global manifold conventions supply them. Boundarylessness is not a consequence of these hypotheses. |
| `Mathlib/Geometry/Manifold/Submersion.lean:127` | `SubmersionAtProp`, local predicates at 153/171, global predicate at 553 | The definition uses a projection normal form, not merely surjectivity of a derivative. The advertised finite-dimensional comparison and fibre-product construction are additional work. |
| `Mathlib/Geometry/Manifold/Instances/Real.lean:59` | `EuclideanHalfSpace`; its model at 176 | Native manifold inputs can have boundary, witnessing R01. |
| `Mathlib/Geometry/Manifold/ContMDiffMap.lean:38` | `ContMDiffMap` and its smoothness/coercion API, lines 43–67 | Bundled smooth maps, not an existing functional diffeology. |
| `Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean:201` | `IsLeviCivitaConnection`; construction at 359 | Supplies the metric connection, not the genus or Ricci vanishing conjecture. |
| `Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean:250` | `ModularForm.dimension_level_one` | For the positive even weights used here, its rank formula gives 0,1,1,1,1,2,1,2 at weights 2,4,6,8,10,12,14,16. S6.2 uses this; it does not re-plan its proof. |
| `TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Ricci.lean:59` | `CovariantDerivative.ricciTensor`, application at 67 and constant-curvature result at 100 | The trace is w↦R(w,u)v. Symmetry is not part of the definition for arbitrary connections. |
| `TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean:125` | `IsEilenbergMacLaneSpaceOne` | A predicate on an existing space, not a construction of K(ℤ,4). |
| `TauCeti/Algebra/Octonion/Basic.lean:375` | split octonion construction | It cannot replace the positive division-octonion supplier: the split norm has nonzero null vectors. |

No native BSpin, K(ℤ,4) construction, String bordism, differential-character carrier or Witten genus was found in those object searches. This is a report of the pin search, not an assertion about future library versions. The module docstring's missing-carrier explanations agree with that search. There is no same fully qualified declaration as `TauCetiRoadmap.StringOrientation.homotopyGroup_sphere_three_stem` in the readable sibling roadmaps.

**Resolved ownership and supplier citations.** Searches used `roadmaps grep` as well as direct object searches in the supplied main, board packages and readable open heads; `roadmaps show` was also used for EllipticCohomology. The 19 supplier/consumer entries below were checked against their actual section text. Main's `Orbifolds` and `TopologicalKTheory` were also used as shape comparisons. Paths below are repository-relative; an “open head” means the supplied checkout, not an assumed version on main.

| Supplier | Resolved sections / witness | Ownership outcome |
|---|---|---|
| GeneralizedCohomology, main | G2, G2.10, G3.8, G5.0 (Hopf comparison at README:1504), G5.3, G5.6 (2212–2245) | Existing classifiers, spectra, Freudenthal, connective covers and rational comparison are consumed. S1 owns λ and its fibre; S2 owns the geometric comparison. |
| AlgebraicTopology, main | Stages 6 and 8.3/8.5/8.7/8.10; 8.11b at README:1993–2040 | Cohomology, Hurewicz/Whitehead and loop/suspension signs are supplied. R03 asks this consumer to finish its signed relative comparison. |
| CharacteristicClasses, main | C2 Thom at README:550; C3 p₁ near 842; C4 at 1037–1060, including universal connections | The universal stable λ normalization is additional; the underlying characteristic-class and Chern–Weil constructions are not rebuilt. |
| TopologicalKTheory, main | T2.1–T2.3, README:665–704 | Virtual bundles and λ-series are supplied; Sym from λ_(−t) is the explicitly distinguished variant here. |
| SpinGeometry, main | G4.1 at README:397/425; G6 Lichnerowicz at 636 | Spin covers and the square formula are inputs, not new String targets. |
| RepresentationTheory/LieHighestWeight, main | Layer 8 compact algebra supplier at README:1255 and formally real Albert supplier at 1332 | Owns the positive algebraic carrier; S1.5 owns its projective geometry and compact homogeneous realization. |
| DGFloer, main | Layer 1 item 2; Layer 11 item 3 at README:1614 | The homotopy-fibre sequence and compact Lie-group criterion exist as cited. |
| Orbifolds, main | O2 item 6, README:220–240 | Manifold diffeology, restrictions and finite products are imported; S3.5 owns the additional ContMDiff and functional-map comparisons. |
| DifferentialGeometry, main | Forms and integration layers; 8.4/8.5 at README:845/852 | Supplies smooth chains, Stokes and de Rham, with T2/sigma-compactness on the global comparison. |
| ModularForms, main | Scope and native suppliers, README:9–14 and 204–206 | Level-one dimensions and q-expansions reduce to the named native declarations; no second dimension-formula plan is introduced. |
| BordismFormalGroups, main | F3–F5, especially README:284–323 | Supplies BP/BP⟨1⟩ and the spectral-sequence machinery. The BO⟨4k⟩/String-specific computation is owned here. |
| SchemeAndStackFoundations, main | §4.13, `bertini_smoothness` at README:5680 | Smooth general hyperplane sections require the stated immersion/very ample and field hypotheses. S5.4 applies them over ℂ, not inseparable characteristic p. |
| AffineMorseLefschetz, main | A0, README:67–97 | Supplies the projective zero-locus carrier and the Jacobian test. S5.4 must still specify the actual complete intersections, as R02 explains. |
| EllipticCohomology, open head | E4.S at README:913–980; E4 normalization at 1472; E5 at 1527–1568 and 1675–1676; E6 at 1909–1930 | Supplies the independent third stem, MString, σ, tmf coefficients and localization. The computation does not run back through this roadmap. |
| GeometricTopology, main | Layer 1 collars/tubular neighborhoods at README:205/218 | These supply the geometric Pontryagin–Thom route. |
| IndexTheory, supplied new-roadmap open head | I7; README:856–871 | Twisted index, L/Â and the quaternionic parity input occur as cited. The String genus construction is additional. |
| RiemannianGeometry, main | Geodesic/exponential prerequisites | Read for the convex-ball route: S3.0 explicitly owns Whitehead convexity instead of pretending this source already supplies a good-cover theorem. |
| TangentialBordism, open head (consumer) | Scope README:20–30; supplier contracts near 141 | Its geometric adapters consume this roadmap's S1.5, S2.2, S2.3 and S5.3. No reverse dependency was introduced. |
| FourManifolds, open head (consumer) | String interface near README:1967 | Its adjoint/low-dimensional lift interface agrees with the named downstream contract. |

The last two rows are consumer checks, not permitted upward supplier edges. Three additional overlap checks resolve the README's explicit ownership moves: `SmoothBundlesConnections` B1.0 (README:221), B1.1 (315), B3.1 (871), B4.1 (979), B6.0 (1306); `LieGroupoidsPoisson` G0 (149 onward); and `HomotopySpheres` Stage 9 (1246–1265). Those later roadmaps do state the overlapping smooth foundations or stem. Here the smooth foundations move to the earlier StringOrientation S3.0, while the third-stem computation remains at the still earlier EllipticCohomology E4.S; S2.3 transports it. This records the direction of ownership rather than adding an upward import. No edit to those other folders is requested by this review. Ownership against unprovided open-PR files was not checked.

**Shape and completeness.** The file has the required summary, scope, conventions, contracts, build order, six layers with examples/dependencies, downstream contract and references. The definition blocks retain prose API and at least three Checks; the table above tests their discriminating examples. The identified deficiencies are the two specifications and one sign Check in R01–R03. The sole Lean theorem is documented, lies in the matching namespace/layer, uses one `import Mathlib`, contains one honest sorry, and has no data definitions or artificial substitute for an unavailable carrier. The ordinary genus and the refined σ/TMF classes are distinct: in particular the degree-three ordinary genus is zero while its σ-image has order 24. The S5.5 integral kernel Check must be read as the ordinary-genus kernel, not the adjacent conjectural σ-kernel.

## Not verifiable

- **stong-cobordism, Chapter II:** the sources service tried the Princeton/De Gruyter bibliographic/DOI route, including DOI 10.1515/9781400879977. No readable legal full text was obtained. The general structured Pontryagin–Thom locator is uncertified; Milnor–Stasheff only verifies the classical ingredients, not every general bundle-diagram assertion.
- **bott-tu, Theorem 5.1:** the Springer DOI/book route did not supply legal readable full text. The exact theorem number and its refinement statement remain uncertified. R01 is independently witnessed by the native half-line, so does not rely on guessing that text.
- **lee-smooth-manifolds, Theorems 4.26 and 6.30:** the Springer route did not expose readable full text. Exact numbering remains uncertified; the local projection tests were carried out independently.
- **toda-composition, Chapters V and XIII:** no legal full text was returned by the service's bibliographic search. The primary calculations were not re-proved here. EllipticCohomology's independent stem contract and the native stable-range signature were checked.
- **borel-hirzebruch, I §19, Theorems 10.7 and 20.3:** the JSTOR/publisher route did not expose the primary text. McTague reproduces the tangent and pushforward statements, but does not certify the unread primary OP² locator. Its numerical characteristic-class consequences were tested independently.
- **stolz-ricci, §1:** the Springer DOI route did not expose the original paper. The roadmap marks this conjecture locator uncertified. The forward-only statement, positive-dimension exclusion and round-sphere conventions were tested independently.
- **The unpublished Jung theta proof:** mctague-cayley-plane lines 107–109 explicitly say it had not appeared in print. The general family-vanishing statement and named theta route are visible, but this review cannot certify an unavailable proof. S5.2 owns that proof as a target; the trivial-family instance alone does not prove it.
- **External Lean comparison:** at the cited lean-catdg commit, `Manifolds.lean`'s open-domain comparison contains a sorry (lines 128–140), and `Constructions.lean`'s finite-product D-topology instance is admitted (lines 912–914). These are not certified existing proofs. Its LICENSE identifies Apache-2.0 (lean-catdg LICENSE lines 5–6). The README does not import these admitted proofs or claim they are complete; it assigns the missing comparisons to S3.5 and the manifold finite-product supplier.

The six book/paper access limits above are already marked uncertified in the README. They were not reopened as missing-reference requests or used to park this review. No source manifest or PR file was edited.

## Source issues

- **Misprint** in waldorf-string-connections at equation (4.2.1), printed p. 30 (lines 1092–1097): the source says the degree-three holonomy is the exponential of a real integral; it should be exp(2πi times that integral), consistent with its degree-one formula; affects a stated result.
- **Misprint** in mctague-cayley-plane at the ku/BU splitting displays, printed p. 7 (lines 401–414): the source says the product begins at i=1; it should be i=0 through p−2; affects a stated result.
- **Misprint** in mctague-cayley-plane at the BO cover-transition identity range, printed p. 7 (line 424): the source says 0<i<(p−3)/2; it should be 0<i<(p−1)/2, as in Hovey–Ravenel Corollary 1.5(2); affects a stated result.
- **Misprint** in mctague-cayley-plane at the complete-intersection tangent sequence, printed p. 16 (line 1001): the source says the normal line-bundle sum injects into ambient tangent with quotient TV; it should be TV injecting into ambient tangent with that normal quotient; affects the proof.
- **Misprint** in mctague-cayley-plane at the pulled-back p₁ formula, printed p. 16 (lines 1016–1024): the source says the root scaling contributes 4n_f; it should be 4n_f², since p₁ is quadratic in the roots; affects the proof.
- **Error** in mctague-cayley-plane at its account of Stolz's conjecture, printed p. 3 (lines 116–120): the source says vanishing Witten genus is equivalent to existence of positive Ricci curvature; it should be the forward implication from positive Ricci curvature only; affects a stated result.
- **Misprint** in bunke-differential-cohomology at Problem 3.4, printed p. 33 (lines 1257–1262): the source says sheafified degree-k cohomology is both F and zero at k=0; it should be zero only for k>0; affects a stated result.
- **Gap** in lean-catdg at Manifolds.lean, open-domain comparison, lines 128–140 (unpaginated): the source says the open-domain smoothness comparison is available; it should be supplied with a proof rather than sorry; affects the proof.
- **Gap** in lean-catdg at Constructions.lean, finite-product D-topology instance, lines 912–914 (unpaginated): the source says the finite locally compact product has compatible D-topology; it should be justified by a proof extending the binary-product argument; affects the proof.
