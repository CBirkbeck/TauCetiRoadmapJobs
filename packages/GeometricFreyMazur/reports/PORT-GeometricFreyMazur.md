# GeometricFreyMazur port report

Branch: `roadmap/geometric-frey-mazur`.
Head: `15ecde13d5c80311a126bf00937052770f7e2814`.
Base verified clean at `b54415b` before creating the branch.

## Draft pull request body

Build the geometry of diagonal projective-level modular surfaces and their Heegner and cusp strata, together with hyperbolic estimates, signed repulsion, weighted multiplicity bounds and normalized gonality-pencil pullbacks. These give uniform geometric Frey–Mazur over characteristic-zero function fields and the original open base, full determinant-one torsion monodromy, and the rational-curve classification used for smooth minimal-model contractions.

AI assistance: Codex (GPT-6) performed the port, source and supplier comparisons, numerical checks and interface elaboration. The weighted global cusp-ball estimate in §5.4 remains an explicit mathematical target whose proof is not certified by the source's single-lens argument; see the unresolved analysis below.

## Validation

- Targeted build exit 0. Exact outcome: `Build completed successfully (18244 jobs).`
- Warning count: **2**, both `declaration uses sorry`, at the two headline theorems. There are no other warnings in the final build.
- Exact gate summary:

  ```text
  gate GeometricFreyMazur: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```
- Citation resolver: no cross-roadmap citations found nowhere; no Lean names found nowhere. Its external-library scan was unavailable, so all 28 pinned supplier names were checked directly with `#check @name` in addition to the three own declarations.
- Dependency check exit 0, with no UPWARD, CYCLE or moved line:

  ```text
  depcheck: 223 roadmaps, 2036 edges, 0 problem(s)
  ```

- `git diff --check` and the staged equivalent passed. Only `TauCetiRoadmap/GeometricFreyMazur/README.md`, `TauCetiRoadmap/GeometricFreyMazur/Suggested.lean` and `TauCetiRoadmap/GeometricFreyMazur/metadata.toml` enter the commit. The topic is `math.NT`. The top-level list, pins and merge-order file are unchanged. Nothing was pushed or posted.

## Open-roadmap suppliers

The following dependencies are new roadmaps still in pull requests, identified by name:

- ModularCurvesPartII — §§1.2–1.3, 2.3, 3.9, 3.14, 4.1, 4.6–4.10, 5.7, 5.13, 5.16, 6.1, 8.4–8.5, 9.10 and 9.13.
- ComplexComparisonPartII — C−1.1–C−1.3, C1.9, C2.2, C4.1–C4.5, C5.4 and C6.2.
- InverseGaloisAndArithmeticFundamentalGroups — IG.0.3, IG.1.3 and IG.3.1.
- AbelianSchemesAndArithmeticModuli — A1.6, A1.8, A3.1–A3.5, A3.7–A3.8, A6.1, A6.6–A6.7, A6.20, A6.25 and A6.34.
- NeronModelsAndSemistableAbelianVarieties — §§1.3 and 1.8.
- CongruenceSpectralGap — §5.3, also consumed by the gonality supplier.
- CanonicalModelsAndGonality — §§1.1–1.7, 8.1–8.7 and 9.1. This additional supplier is another author's new roadmap, permitted by the brief; dependency checking reports no direction defect.

No citation depends on numbering that only an open revision defines. The overlap scan found no competing revision of GeometricFreyMazur and no dropped cited identifier.

## Lean and elaborated signatures

No statement moved from the package's Lean file into the README: it already had only one real definition, gonality, and the two headline theorems, full_monodromy and geometric_frey_mazur. The elementary subgroup-index and self-twist arguments remain README targets. Every remaining headline that lacks a pinned carrier is identified in the module docstring; the supplier-owned Abramovich result is no longer listed as this roadmap's headline.

The module uses the modern `module`, `public import Mathlib`, individual public Tau Ceti import and exposed public-section form already used on main. Import paths are exactly Mathlib and TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Basic. The initial plain imports emitted module-system warnings; the final form eliminates them, exports all three declarations and passes the import gate. The full-monodromy signature's `letI` was replaced by local registration of the native AddSubgroup.torsionBy.zmodModule instance, without defining data or changing the mathematical statement.

A scratch file imported the built module and elaborated `#check @name` for **all three declarations** and **all 28 pinned supplier declarations**, once, successfully with no diagnostics. I compared all three expanded own types to Conventions and §§9.6, 9.8. Both field instances and the algebra remain on gonality. Full monodromy retains algebraic closedness, characteristic zero, the compatible rational-function tower, FunctionField, gonality bound, ellipticity, nonconstant j, primality and both prime bounds. Frey–Mazur retains both ellipticity and nonconstant-j hypotheses and actual equivariance, with ∃M before either field. No binder was lost and no mathematical hypothesis changed.

Pins read directly: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Native definitions were inspected, including `FunctionField := FiniteDimensional (RatFunc k) K` at `Mathlib/NumberTheory/FunctionField.lean:59`, torsionBy and its module at `Mathlib/Algebra/Module/Torsion/Basic.lean:972`, `:1009`, and the determinant's fallback 1 at `Mathlib/LinearAlgebra/Determinant.lean:164`. That fallback is excluded mathematically by rank-two characteristic-zero elliptic torsion. The bundled finite holomorphic map at `TauCeti/Analysis/Complex/RiemannSurface/Degree.lean:134` records holomorphy, two distinct values and finite fibres; it does not by itself assert properness, compactness or connectedness. Those hypotheses remain explicit in its uses. The isogeny carrier at `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean:139` records a coordinate pullback and MapsInfinity; the latter's integrality condition at line 72 excludes a constant evaluation pullback on an elliptic function field. Injectivity and finiteness are consequences, rather than extra structure fields. The descent theorem at `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Descent.lean:117` retains IsGalois without a finite-extension hypothesis.

## Supplier replacements and duplication sweep

The sweep used `roadmaps list`, object-based `roadmaps grep` on main and all indexed open heads, `roadmaps show` for the suppliers and closest roadmaps, local main and Completed roadmaps, pinned sources and the board's package READMEs. The two headline names and gonality have no matching pinned theorem or existing identical fully qualified declaration. The supplied library-near-match candidates are primitive-element, discriminant, map-functoriality and bounded-modular-function statements, not either headline.

CanonicalModelsAndGonality owns the minimum/pencil and finite-map/base-extension theory in Layer 1, proper-model maps in §9.1, and the exact 7/800 modular gonality theorem in §8.6. I deleted the duplicate §8.1 target, imported it by that section, and replaced the gonality and Li–Yau gap requests with these exact contracts. Its numerical and metric Checks survive in the supplier section. The Scope and ownership section maps the former §8.1 to CanonicalModelsAndGonality §8.6, preserving the route of the board's ModularCurvesPartIII import index, which cites the old interval §§8.1–8.4. No mathematical target is lost by this supplier replacement.

SchemeAndStackFoundations §3.5, specifically sectionNorm and lineBundleNorm_divisor, supplies norm/principal-divisor compatibility; AlgebraicCurves Layers 3–5 did not state that pushforward result. The target map in §6.2 is finite locally free, so the corrected supplier applies. The matrix entry estimate now cites Matrix.norm_apply_le_norm at `Mathlib/Analysis/Matrix/Normed.lean:105`, replacing its deprecated alias. Native line locators for FunctionField, the torsion module, point map, determinant and transvection generation were brought to the pins.

FuchsianOrbifoldsPartII develops Nielsen cores, marked boundaries and related period geometry, not the diagonal modular-surface repulsion estimates. ArithmeticDynamics uses dynamical modular curves; HeightsRationalPointsAndObstructions develops heights and rational-point obstructions. Their scope statements do not assign them the present quotient surface or its signed multiplicity estimates. ModularCurvesPartII supplies the level curve and cyclic correspondences, not Z(p), its graph strata or rigidity. SchemeAndStackFoundations remains owner of general finite scheme quotients and intersections; ComplexComparisonPartII remains owner of general currents and analytification. Tau Ceti's symmetric powers of modules and Riemann surfaces do not construct the symmetric power of this singular projective surface. The board's ModularCurvesPartIII is an import index, not a second owner.

Ownership against the provided open heads was checked. The final index had 429 open roadmap pull requests; the initial supplied index had 437. Local main was also read at the required base. No later roadmap was made a supplier, and no external file or roadmap was edited. The narrow web queries for gonality and Frey–Mazur did not identify a relevant active Mathlib design; that search is not a claim of exhaustive absence.

## Mathematical fixes after the upstream-reviewer read

1. The accepted height note is already applied in the source package: BT16 lines 533–534. I retained it and recomputed height(J)=1 versus Frobenius/operator norm 2.
2. The later reports' cusp counterexample was independently recomputed. At p=101 the two cusp labels are (29,3) and −(29,3); both lifts have distance 9.132087468 from the chosen cusp lift, and their relative transformation has absolute trace 164.813787>2. At p=211 and 1009 the same construction gives distances 10.610126032 and 13.741135603. Section 2.5 now counts O(p^(16δ)) close lifts. Its rotation-index argument includes the small-height step excluding a zero lower-left entry for a different cusp. Genuine uniqueness is retained only below injectivity radius.
3. The lens midpoints have separations 8.844443087, 10.322464168 and 13.453454283 at the same primes. Section 2.6 retains O(p^(32δ)) lenses, and §2.7 uses an absolute exponent A instead of an unjustified fixed 24. The midpoint-to-triangle-vertex estimate is O(δρ_X)+O(1), not an unsupported constant distance. The repulsion and fourfold routes retain every choice and absorb its polynomial loss before choosing δ.
4. Section 3.4 restricts total reality to the elliptic open. For the ramified boundary graph q₂=conj(q₁)² the derivative at zero is 0 and its tangent is ℂ×{0}; away from zero it is totally real. The correct downstream property is absence of a contained complex curve, including at the finite boundary.
5. Norm/divisor compatibility is repointed to SchemeAndStackFoundations §3.5. Under x=t², Norm(t−a)=a²−x and both the principal divisor and divisor pushforward are [a²]−[∞]. This differs from conorm, which gives [a]+[−a].
6. The normalization and cusp-coordinate source anchors are BT16 lines 169–193 and 494–527 in the package's source numbering, replacing the page markers 167 and 492; printed-page locators are retained.
7. The false single-lens deduction in the bicusp volume argument is cut. Section 5.4 explicitly targets the global weighted cusp-ball sum needed to complete that route; the worked argument proves only the subsequent exponent bookkeeping conditional on that target. This is **not** presented as a proof that the source gap has been closed.
8. The cyclic pull-push API explicitly records preservation of non-Hecke components, using the actual isogeny composition and scalar removal, with ModularCurvesPartII §9.10 as the composition input. This supplies the hypothesis needed when the global target is applied after pull-push.

## Sources and unresolved analysis

The publisher BT16 PDF, author BTE PDF and arXiv-v1 ABR96 PDF were read from legal hosts and their hashes exactly match packages/GeometricFreyMazur/sources.toml: BT16 `814976eeb93367cf0810bb0f9c514709a6474bfb7202ddb2834d33dd6a25f40a`; BTE `db8effa1d3ef6a96c843e8ffad085a0ad03cd86a486f5e6cc3956bd14352acc1`; ABR96 `5ff2134fbfb6bd702fa7051637027405c8e0d77a595830a63e8ad36f50791779`. The README keeps its published/preprint versions and exact printed locators. The supplementary source-line numbering in the README is the package's supplied extraction; the PDF text used in this pass has a different extraction layout. BLR90 remains the accepted locator-only, uncertified text-access exception; no paywall was bypassed.

**Unresolved mathematical work:** the global weighted cusp-ball summation target in §5.4 has not been established by the surviving local estimates. BT16 line 586 (this pass’s PDF extraction; Proposition 12(a)–(b), pp.723–724) contains the false uniqueness/single-lens statements; BTE line 136 (this pass’s PDF extraction; Proposition 4.2, p.4) uses the latter in its proof. Merely adding a polynomial number of off-diagonal lens balls does not justify summing their enlarged volumes with a uniform constant. The roadmap now states the needed global estimate with its actual carriers and non-Hecke hypotheses, and retains the claimed multiplicity and rigidity endpoints, but this port does not certify a proof of that estimate or the analytic route depending on it. This is additional to the accepted external supplier obligations and needs mathematical review before treating that route as validated. The two native Lean headlines themselves are unchanged and remain the known source statements.

Nine accepted supplier obligations remain explicit: finite-group-quotient-analytification; analytic-cycle-current-transport; hyperbolic-cycle-volume-comparisons; relative-point-ball-volume; hyperbolic-trigonometry; free-locus-and-relative-cycle; curve-extension-and-normalization; cyclic-surface-resolution-and-contraction; surface-contraction-intersections. The two former gonality/Li–Yau requests have exact new-roadmap suppliers. Implementation of the remaining obligations is not certified by the acceptance review or this port.

Untrusted command suggestions were not followed. The supplied package index says “Read one with:” before a command suggestion; fetched Mathlib documentation also suggests `lake build` and `lake update`. These were treated as data, not authority. Only the authorized targeted build and scratch signature elaboration were run; no fetched code, credential command, repository-wide build, dependency update, remote write or external edit was performed.

## Adversarial mathematics pass

These are finite computations and hypothesis checks, not proofs of the admitted theorems or uniform analytic estimates. The hypotheses are those of each cited subsection. Positive-characteristic fields, the zero ring, empty curves, non-Hausdorff analytic carriers and incompatible connected components are excluded where the statement excludes them. Zero cycles are allowed. The global summation target in §5.4 is expressly marked unresolved below.

| Statement | Instances tried | Computed values on the sides | Result | Change |
|---|---|---|---|---|
| Conventions: gonality definition | k(t); genus-one field; hyperelliptic genus two; K=k | minima 1, 2, 2; empty defining set has infimum 0 | Empty-set junk excluded from headlines | Retained |
| Conventions: function-field tower | K=k(t), image of t; K=k | [K:k(t)]=1; t transcendental versus no transcendental element of k | Native FunctionField alone is relative to its chosen rational field; scalar tower retained | Retained |
| Conventions: left frame action | g=U(1), h=L(1) | h⁻¹g⁻¹=(gh)⁻¹=[[1,−1],[−1,2]] | Left action associative | Retained |
| Conventions: components and conjugation | p=5,7; diag(1,3), 2I at p=7 | −1=4 square mod5; 6 nonsquare mod7; determinants 3 nonsquare and 4 square | Two components retained | Retained |
| Conventions: hyperbolic area | disc radius 1 and r→0 | a(1)=3.4122762653; a(r)/r²→π | Curvature −1 | Retained |
| Conventions: currents and orientation | f=1,z,z²; weighted line 2[L] | masses 0,1,2; integral 2·1=2 | Positive point-current normalization | Retained |
| Conventions: max distance and graph tubes | matched distance 3r/2 | midpoint distances 3r/4<r; 3r/2<2r | Threshold 2r | Retained |
| Conventions: canonical degree | p=7 diagonal, double parametrization, constant projection | K_X degree 4; Deg=8,16,0; area=16π,32π,0 | Sum-area and weights | Retained |
| Conventions: cyclic indices | m=1,4,6,9,p | ψ=1,6,12,12; σ₁(4)=7; [p] on E[p]=0 | Cyclic and prime-to-p conditions | Retained |
| Conventions: subtraction and zero cycles | g=0,1,2; zero cycle | 2g−2=−2,0,2 in ℤ; every linear volume/multiplicity bound is 0≤0 | No natural-subtraction truncation | Retained |
| Conventions: denominators and universes | p=2,3,5; d=0; field versus zero ring | p>5 fails at 2,3,5; sinh0=0; char0 field has 1≠0 | No division by sinh d at d=0; fixed universe retained | Retained |
| 0.1 projective frames | p=7 and scalar −I | ∣PGL₂∣=336, ∣PSL₂∣=168; scalar frame action=identity; elliptic [−1]≠identity | Coarse space and stack inertia distinguished | Retained |
| 0.2 diagonal quotient | p=7; swapping factors; trivial group | selected fibre size 168; (ψ⁻¹)⁻¹=ψ; X/1=X | Orbit fibres and inverse map | Retained |
| 0.3 signed CM strata | j=1728; mixed j=1728,0 | Lie eigenvalues (i,i) versus (i,−i); gcd(2,3)=1 | Equal GL lifts needed | Retained |
| 0.4 singular bicusps | p=7; same/different inertia | same-line cusp labels=3; common inertia=7 or 1 | Arbitrary cusp pair excluded | Retained |
| 0.5 exhaustive branch locus | all ordered pairs of stabilizer orders 1,2,3,7 | mixed gcds=1; equal nontrivial subgroup intersection=2,3,7 or1 | Sixteen type pairs covered | Retained |
| 0.6 finite Hecke images and pull-push | m=1,4; cycle weight2 | ψ(1)=1, ψ(4)=6; Deg(weight2)=2Deg and pull-push degree=12Deg(weight1) | Imported cyclic correspondence preserved | Retained |
| 1.1 compact triangle quotient | p=5,7 | angle sums 31/30>1 and 41/42<1; triangle area at7=π/42 | p>5 excludes spherical signature | Retained |
| 1.2 triangle matrices | p=7,101 | det=1; S²=U_p^p=(SU_p)³=−I; y₇=1.7250824; (1−b)101²/π²≈1.000646 | Real branch and lift signs | Retained |
| 1.3 surviving witness | p=7,11,1009,1013 | integer traces 100,244; determinants1; compact trace/p²=0.6838770054,0.6838772818 versus limit0.6839179896 | Both residue classes survive filling | Retained |
| 1.4 filling-sensitive cusped systole | p=7; peripheral word | ∣trace∣=47 gives length7.6993892 versus4log7=7.7836406; U^p is killed on filling | Separate filling condition retained | Retained |
| 1.5 cusp stars | p=7 | 14·π/7=2π; 7·π/7=π; d(iy_p,i/y_p)=2log y_p | Full-disc tile count | Retained |
| 1.6 compact/cusped comparison | r=1; r→0; r→∞ | tanh²(1/2)=0.2135523; coth(1/2)=2.1639534; lower ratio→0 then1 | Metric square and length factors distinguished | Retained |
| 1.7 compact injectivity radius | p=101; repeated deep visits | ρ leading term9.2302410; shortest length18.4604821; each visit costs(log p)/2, so at most8+o(1) | Counts visits, including repeats | Retained |
| 1.8 q-coordinates and enlargement | p=101, heights1/2,1,1/4 | q-radii0.969373902,0.939685762,0.984567876; first compact radius4.163618433 | Smaller height gives larger disc | Corrected page-marker line anchor |
| 2.1 entrywise height | J; [[2,1],[1,1]]; diag(2,1) | h(J)=1, Frobenius=2; h(M)=h(M⁻¹)=2; diag inverse height1 versus2; h(J²)=2=2h(J)² | Inverse assertion restricted to SL₂ | Adopted Matrix.norm_apply_le_norm |
| 2.2 small elliptic lifts | M=[[2,1],[1,1]]; nonsquare determinant | cosh d(i,Mi)=7/2; height2≤√7; det nonsquare has no SL₂ lift | Component-preserving hypothesis retained | Retained |
| 2.3 nearby cusp descriptions | M=SU³S; right peripheral factor | M=[[-1,0],[3,−1]], height3; γ_p(MU^k)z₀=γ_p(M)z₀ | Existence rather than unique representative | Retained |
| 2.4 double cosets | M=S; nonzero left/right rotations | U(a)SU(b)=[ [a,ab−1],[1,b] ]; a,b vary independently | Two stabilizer factors retained | Retained |
| 2.5 close lifts | p=101,211,1009, b=3,a=10 | radii9.132087468,10.610126032,13.741135603; paired labels±(29,3); relative ∣trace∣164.813787,349.398978,1669.748560 | Uniqueness false at the larger radius | Replaced by O(p^(16δ)) count; uniqueness only below ρ_X |
| 2.6 multiple lenses | same three primes | midpoint separations8.844443087,10.322464168,13.453454283; R=1 lens radius1.657454454; excess→log2 | Single quotient ball false | Retain O(p^(32δ)) lifted lenses |
| 2.7 cusp overlap count | height H=p^(A₀δ); cusp centre; empty ball | matrix count≤(2⌊H⌋+1)⁴; centre count1; empty count0 | Polynomial-in-p^δ bound survives | Absolute exponent A includes all choices |
| 3.1 signed reconstruction | Q=diag(1,−1); Q=diag(1,2) | det=−1 versus2; Smith invariants(1,1) versus(1,2) | Reflection retained; −Q still has determinant−1 | Retained |
| 3.2 centralizer rank | Gaussian/Eisenstein units; M_x=M_y=I | det aI+bt=a²+b² or a²−ab+b²; 4/6 integral units; identical equations have kernel dimension2 | Distinctness excludes coincident-pair countermodel | Retained |
| 3.3 Heegner repulsion | two points on T₁; conjugation of second slot | m=1 in plus case; second-slot conjugation changes Lie pair(i,i) to(i,−i) | Signed conclusion retained | Retained |
| 3.4 conjugate loci | graph q₂=conj(q₁)² at0 and1 | derivative0 gives complex tangent ℂ×{0}; at1 derivative v↦2conj(v), common complex tangent dimension0 | Global total-reality claim false | Restrict to elliptic open; prove no complex curve contained |
| 3.5 anti-Heegner avoidance | Gaussian endomorphism at p=7 | [a+bi][i]=[i][a+bi]; opposite sign difference[2i] has degree4 prime to7 | T_m∩CM⁻ empty without a repulsion claim | Retained |
| 3.6 three-bicusp reconstruction | p=7, images0,∞,1; reflection at p≡1 mod4 | two prescribed images leave6 scalings; third leaves1; negative-reflection ordinary index≥p−1 | Both determinant signs necessary | Remove lift-uniqueness use; count lens choices |
| 4.1 graphs and small curves | g=1; matched distances3R/2; m=1 | two equalities give codimension2; midpoint distances3R/4; τ_(1,1) dimension1 | Graph tube factor2 retained | Retained |
| 4.2 reduced quadratic centralizers | unipotent, split, imaginary and real quadratic | unipotent parameters≈2p^A+1; split units±1; imaginary≤6; positive real unit trace≥3 gives log-gap≥arcosh(3/2) | Nonreduced case excluded | Retained |
| 4.3 overlap dichotomy | p=101 singular bicusp | 101 stabilizer graphs through point; distance to SBC×SBC=0; log101=4.6151205 | Cusp alternative required | Retained |
| 4.4 rotations | p=7,d=1,R=1/2; d=0 | displacements0,.980099,1.645565,1.961531,1.961531,1.645565,.980099; count3; centre count7 | Identity and large sinh factor retained | Retained |
| 5.1 canonical degree adapter | p=7 diagonal; weight2; constant projection | Deg8,16,0; areas16π,32π,0 | Generic pushforward degrees retained | Retained |
| 5.2 Heegner decay | d=4; δ₁=1/100,δ₂=1/10000 | Σ_(m<4)ψ(m)=8≤14<64; exponents−.0002 and−.97 | Both terms decay | Retained |
| 5.3 anti-Heegner decay | ε=1,R=log p | sinh1/sinh(log p)=2.3504024p/(p²−1)≈2.3504024/p; reciprocal≈.4254591p | Ratio direction fixed | Retained |
| 5.4 bicusp weighted decay | δ₃=.001,δ₁=.0001,δ₂=.00001; zero cycle | p-weighted exponents−.00002 and−.0017; zero gives0≤0 | Endpoint bookkeeping valid with the explicit global target | Single-lens proof removed |
| 5.4 global weighted cusp-ball target | zero cycle; weight2; off-diagonal lens pair at p=101 | both zero sides0; both weighted sides double; midpoint separation8.844443087 | Global summation not proved by these tests | Explicit local roadmap target; analytical proof unresolved |
| 5.5 cusped measure | q=t²; diagonal; constant cusp coordinate | punctured mass2π/(−log ε)→0; diagonal measure doubled; constant contribution0 | No point atom or infinite constant term | Retained |
| 5.6 cusped error | p=7,11,101 | area ratios7,11/5,101/95; excess6/(p−6)=6,6/5,6/95 | Uniform O(1/p), e.g. excess≤42/p for p≥7 | Retained |
| 5.7 signed Hecke tubes | z↦2z; conjugate q² boundary | cusped metric factor ∣2∣/(2y)=1/y; compact boundary branch ramifies with derivative0 | Cusped isometry only; complex noncontainment retained | Retained |
| 5.8 big-diagonal decay | C⊂T₁×T₁ ample test; two distinct pencil points | ratio3p/(p−6)=21 at7 and→3; distinct quotient points exclude Δ_g | Non-Hecke slot hypotheses essential | All lens-choice factors retained |
| 6.1 symmetric surface powers | n=1,2; repeated versus distinct points | Sym¹Z=Z; distinct ordered fibre2!=2; repeated fibre1; transverse local ring has relation ac=b² | Scheme quotient retains multiplicity | Retained |
| 6.2 normalization reduction | genus-one double cover of P¹; norm under t² | gon image1≤source2; Norm(t−a)=a²−x, divisor[a²]−[∞] | No division of gonality by map degree | Correct norm supplier §3.5 |
| 6.3 pencil cycle map | hyperelliptic fibre; h=id with f=t² | branch fibre2[b] has degree2; φ(1)=φ(−1)=1 with generic degree2 if f not birational | Birationality hypothesis essential | Retained |
| 6.4 normalized wreath pullback | n=1,2; free orbit; transposition | permutation sizes1,2; W order ∣G∣,2∣G∣²; free local inertia1; repeated tuple admits transposition order2 | Normalize and make action effective | Retained |
| 6.5 weighted projections | n=1,2,3, slot degrees D₁,D₂,D₃ | pair sums0, D₁+D₂, 2(D₁+D₂+D₃); each slot occurs n−1 times | Weighted degree sums | Retained |
| 7.1 ramification support | n=1; n=2 transposition | no pair strata at n1; transposition fixes tuple iff both coordinates match under g | One-coordinate equality insufficient | Retained |
| 7.2 cyclic local inertia | n=1,2; p=7; two cusp slots | bounds42,84; lcm(7,7)=7 versus product49; no-cusp bounds6,12 | Single p factor | Retained |
| 7.3 ramification decay | cusp error p^(−101/100) versus p^(−9/10) | after inertia p, exponents−1/100 versus+1/10 | Only stronger bicusp error tends to0 | Retained |
| 7.4 Hurwitz contradiction | n=2,D=8; square map on P¹ | lower bound D/(2n)=2; coefficient .1 gives upper .8; −2=2(−2)+2 | Positive D and negative base term retained | Retained |
| 7.5 complex rigidity | N=1; Hecke normalization; constant map | gonality≥1 makes premise empty; Hecke image unchanged; constant map degree0 excluded | All prime thresholds uniform per N | Retained |
| 8.2 subgroup index | SL₂(F₂),SL₂(F₃),Borel at p5; whole group | indices2,3,6; whole group index1<5 but not proper; 3! not divisible by5 | Properness and primality retained | Retained |
| 8.3 complex full monodromy | N=2,p=227,229; constant curve | 7p=1589<1600 and1603>1600; constant image{I} misses transvection determinant1 | Actual rather than projective image | Retained |
| 8.4 no self-twist | F₅,ρ generator diag(2,3), A swap, χ=−1 | Aρ=χρA=[[0,3],[2,0]]; zero A gives0=0 for every χ | Nonsurjective and noninvertible countermodels excluded | Retained |
| 9.1 actual torsion classifying map | Legendre at t=2,3; p7 diag(1,3) | j=1728,21952/9; multiplier3 outside squares{1,2,4} | Nonconstant and component checks | Retained |
| 9.2 rank-one Hom | h=2f; constant Gaussian CM | deg h=4deg f; Gaussian End rank2 instead of1 | Nonisotriviality excludes CM constant field | Retained |
| 9.3 Hecke lift | identity; cyclic quotient prime to p | m1, λ1 gives f[p]=id; degree m quotient restricts invertibly on p-torsion | Actual scalar-compatible lift | Retained |
| 9.4 twist removal | Ψ=−id, f=id; odd p and p2 | f[p]=−Ψ=id; −1≠1 at odd p, but −1=1 in F₂ | Odd p essential | Retained |
| 9.5 field-uniform rigidity | ideals0,(1) under field extension; model larger than ℂ | 0⊗k′=0; 1⊗1=1; only finite-presentation model embedded | Faithfully flat containment detection | Retained |
| 9.6 full_monodromy headline | N0,1; N2 at p229; constant curve | gonality≥1 makes N≤1 void; 1600<1603; id maps to id; constant curve misses U(1) | All characteristic-zero, tower, ellipticity, prime and bounds survive | Retained |
| 9.7 original-base Frey–Mazur | identity isogeny; restricting an open curve | degree1 and kernel size1; unique extension restricts to the same degree1 identity | Original-base conclusion retained | Retained |
| 9.8 geometric_frey_mazur headline | ℂ(t) Legendre, W′=W,e=id; zero point | gonality1<2; equivariance0=0 at zero; identity isogeny degree1 | ∃M remains before both fields and curves | Retained |
| 10.1 bounded genus | g=0,1; N=1,2 | gon1≤g+1=1<2=N+1; gon2≤2<3 | Enlarged strict threshold | Retained |
| 10.2 rational/elliptic classification | rational node normalization; elliptic constant map | normalization genus0, gon1 despite arithmetic genus1; constant image dimension0 | Normalization genus controls theorem | Retained |
| 10.3 resolution and known curves | 1/2(1,1),1/3(1,1),1/3(1,2) | chains[−2],[−3],[−2,−2]; latter determinant3 | Cyclic quotient and exceptional rational curves | Retained |
| 10.4 rational curves on resolution | exceptional curve; strict transform | image dimension0 versus1; birational strict transform preserves genus0 | Two alternatives distinguished | Retained |
| 10.5 contractions | C²=−2; C·E=0,1,2 | new squares−2,−1,2; Picard number decreases by1 per contraction | Later centre need not be initially−1 | Retained |
| gonality API 1 | Identity, non-example, or weighted/base-change instance | k(t): degree1 is attained; genus-one minimum2 excludes degree1 | Agrees on displayed instance | Retained |
| gonality API 2 | Identity, non-example, or weighted/base-change instance | choosing t or t+1 gives k(t)=k(t+1), degree1=1 | Agrees on displayed instance | Retained |
| gonality API 3 | Identity, non-example, or weighted/base-change instance | identity on P¹ has degree1=[k(t):k(t)] | Agrees on displayed instance | Retained |
| 0.2 API 1 | Identity, non-example, or weighted/base-change instance | φ₂φ₁⁻¹ with φ₁=φ₂ gives id | Agrees on displayed instance | Retained |
| 0.2 API 2 | Identity, non-example, or weighted/base-change instance | constant invariant map factors with the same one-point image | Agrees on displayed instance | Retained |
| 0.2 API 3 | Identity, non-example, or weighted/base-change instance | p7 orbit fibre168=∣PSL₂(F₇)∣ | Agrees on displayed instance | Retained |
| 0.2 API 4 | Identity, non-example, or weighted/base-change instance | four product component labels modulo simultaneous exchange give2 | Agrees on displayed instance | Retained |
| 0.2 API 5 | Identity, non-example, or weighted/base-change instance | ψ and ψ⁻¹ swap; applying swap twice givesψ | Agrees on displayed instance | Retained |
| 0.2 API 6 | Identity, non-example, or weighted/base-change instance | base change of a generic orbit retains168 reduced points in char0 | Agrees on displayed instance | Retained |
| 0.3 API 1 | Identity, non-example, or weighted/base-change instance | mixed stabilizer orders2,3 have common subgroup1 | Agrees on displayed instance | Retained |
| 0.3 API 2 | Identity, non-example, or weighted/base-change instance | at j1728 Lie pairs(i,i)/(i,−i), while curve derivatives both−1 | Agrees on displayed instance | Retained |
| 0.3 API 3 | Identity, non-example, or weighted/base-change instance | equality i=i true and i=−i false | Agrees on displayed instance | Retained |
| 0.3 API 4 | Identity, non-example, or weighted/base-change instance | common sign change sends(i,i) to(−i,−i), preserving equality | Agrees on displayed instance | Retained |
| 0.3 API 5 | Identity, non-example, or weighted/base-change instance | second conjugation sends(i,i) to(i,−i) | Agrees on displayed instance | Retained |
| 0.3 API 6 | Identity, non-example, or weighted/base-change instance | base extension preserves i−(−i)=2i≠0 in char0 | Agrees on displayed instance | Retained |
| 0.4 API 1 | Identity, non-example, or weighted/base-change instance | p7 equal inertia gives7, different inertia gives1 | Agrees on displayed instance | Retained |
| 0.4 API 2 | Identity, non-example, or weighted/base-change instance | diagonal cusp stabilizer cardinal7 | Agrees on displayed instance | Retained |
| 0.4 API 3 | Identity, non-example, or weighted/base-change instance | (c,c) shares all7 inertia elements | Agrees on displayed instance | Retained |
| 0.4 API 4 | Identity, non-example, or weighted/base-change instance | conjugating subgroup preserves cardinal7 | Agrees on displayed instance | Retained |
| 0.4 API 5 | Identity, non-example, or weighted/base-change instance | conjugation maps gHg⁻¹ to group of cardinal7 | Agrees on displayed instance | Retained |
| 0.4 API 6 | Identity, non-example, or weighted/base-change instance | field extension in char0 retains the7 distinct inertia elements | Agrees on displayed instance | Retained |
| 0.6 API 1 | Identity, non-example, or weighted/base-change instance | identity torsion datum comes from degree1 cyclic isogeny | Agrees on displayed instance | Retained |
| 0.6 API 2 | Identity, non-example, or weighted/base-change instance | T₁=Δ; quadratic twists share the coarse j-value | Agrees on displayed instance | Retained |
| 0.6 API 3 | Identity, non-example, or weighted/base-change instance | scalar rescaling by2 at p7 changes determinant by4, a square | Agrees on displayed instance | Retained |
| 0.6 API 4 | Identity, non-example, or weighted/base-change instance | base extension preserves cyclic order4; ψ(4)=6 | Agrees on displayed instance | Retained |
| 1.2 API 1 | Identity, non-example, or weighted/base-change instance | cos²θ+b(1−b)=cos²θ+sin²θ=1 | Agrees on displayed instance | Retained |
| 1.2 API 2 | Identity, non-example, or weighted/base-change instance | at p7 S²=U₇⁷=(SU₇)³=−I, projective order1 for these powers | Agrees on displayed instance | Retained |
| 1.2 API 3 | Identity, non-example, or weighted/base-change instance | U₇ fixes1.725082425i; S fixes i | Agrees on displayed instance | Retained |
| 1.2 API 4 | Identity, non-example, or weighted/base-change instance | a0 gives I, a1 gives U_p, a−1 gives its inverse | Agrees on displayed instance | Retained |
| 1.2 API 5 | Identity, non-example, or weighted/base-change instance | conjugating I leaves trace2 and displacement0 | Agrees on displayed instance | Retained |
| 1.2 API 6 | Identity, non-example, or weighted/base-change instance | reflection conjugates i to−i on Lie characters; component multiplier−1 | Agrees on displayed instance | Retained |
| 3.4 API 1 | Identity, non-example, or weighted/base-change instance | (1+i,−1+i) reflected back gives diagonal(1+i,1+i) | Agrees on displayed instance | Retained |
| 3.4 API 2 | Identity, non-example, or weighted/base-change instance | two reflections give(1+i,1+i), a single reflection gives(1+i,−1+i) | Agrees on displayed instance | Retained |
| 3.4 API 3 | Identity, non-example, or weighted/base-change instance | max distance of (x,y),(x,y) is0 before and after c₂ | Agrees on displayed instance | Retained |
| 3.4 API 4 | Identity, non-example, or weighted/base-change instance | plus eigenvalues(i,i) become minus(i,−i) | Agrees on displayed instance | Retained |
| 3.4 API 5 | Identity, non-example, or weighted/base-change instance | degree-four cyclic pull-push costsψ(4)=6, independently of reflection | Agrees on displayed instance | Retained |
| 3.4 API 6 | Identity, non-example, or weighted/base-change instance | base change of degree1 diagonal stays diagonal before reflection | Agrees on displayed instance | Retained |
| 3.4 API 7 | Identity, non-example, or weighted/base-change instance | diag(1,−1) determinant−1 becomes identity after fixed reflection, index1 | Agrees on displayed instance | Retained |
| 4.1 API 1 | Identity, non-example, or weighted/base-change instance | Δ₁ requires two equalities; one equality gives codimension1 instead of2 | Agrees on displayed instance | Retained |
| 4.1 API 2 | Identity, non-example, or weighted/base-change instance | 3R/2<2R and midpoint3R/4<R | Agrees on displayed instance | Retained |
| 4.1 API 3 | Identity, non-example, or weighted/base-change instance | g=U(1), inverse=U(−1), two swaps return U(1) | Agrees on displayed instance | Retained |
| 4.1 API 4 | Identity, non-example, or weighted/base-change instance | τ_(1,1) dimension1, Δ₁ dimension2 | Agrees on displayed instance | Retained |
| 4.1 API 5 | Identity, non-example, or weighted/base-change instance | a=U(1),b=1,g=1 gives relabel U(1) | Agrees on displayed instance | Retained |
| 4.1 API 6 | Identity, non-example, or weighted/base-change instance | identity graph keeps two defining equalities under field extension | Agrees on displayed instance | Retained |
| 4.1 API 7 | Identity, non-example, or weighted/base-change instance | conjugate index1 branch real dimension2, no divisor intersection assigned | Agrees on displayed instance | Retained |
| 5.5 API 1 | Identity, non-example, or weighted/base-change instance | q=t² yields density drdθ/(r log²r), mass2π/(−log ε) | Agrees on displayed instance | Retained |
| 5.5 API 2 | Identity, non-example, or weighted/base-change instance | constant coordinate contributes degree0 and mass0 | Agrees on displayed instance | Retained |
| 5.5 API 3 | Identity, non-example, or weighted/base-change instance | weight2 on two identical coordinate maps gives measure4ω | Agrees on displayed instance | Retained |
| 5.5 API 4 | Identity, non-example, or weighted/base-change instance | one degree-two map gives total2Area(Y) | Agrees on displayed instance | Retained |
| 5.5 API 5 | Identity, non-example, or weighted/base-change instance | p7 totals satisfy Area(Y)=7Area(X)≥Area(X) | Agrees on displayed instance | Retained |
| 5.5 API 6 | Identity, non-example, or weighted/base-change instance | a degree-two parametrization doubles both measure and total degree | Agrees on displayed instance | Retained |
| 6.1 API 1 | Identity, non-example, or weighted/base-change instance | n2 tuple(z,z) maps to cycle2[z] | Agrees on displayed instance | Retained |
| 6.1 API 2 | Identity, non-example, or weighted/base-change instance | distinct pair has2 orderings, repeated pair1 | Agrees on displayed instance | Retained |
| 6.1 API 3 | Identity, non-example, or weighted/base-change instance | constant invariant map retains its same single value after quotient | Agrees on displayed instance | Retained |
| 6.1 API 4 | Identity, non-example, or weighted/base-change instance | ramified degree-two fibre has length2 and cycle2[z] | Agrees on displayed instance | Retained |
| 6.1 API 5 | Identity, non-example, or weighted/base-change instance | Sym² multiset {z₁,z₂} equals {z₂,z₁}, cardinal2 | Agrees on displayed instance | Retained |
| 6.1 API 6 | Identity, non-example, or weighted/base-change instance | base extension preserves lengths1+1=2 and2 | Agrees on displayed instance | Retained |
| 6.3 API 1 | Identity, non-example, or weighted/base-change instance | branch fibre of a double cover contributes2[f(b)] | Agrees on displayed instance | Retained |
| 6.3 API 2 | Identity, non-example, or weighted/base-change instance | distinct generic degree-two fibres have two disjoint supports | Agrees on displayed instance | Retained |
| 6.3 API 3 | Identity, non-example, or weighted/base-change instance | for f birational,h=id the cycle map has degree1; f=t² gives degree2 | Agrees on displayed instance | Retained |
| 6.3 API 4 | Identity, non-example, or weighted/base-change instance | h′=2h gives φ′(t)=φ(t/2) | Agrees on displayed instance | Retained |
| 6.3 API 5 | Identity, non-example, or weighted/base-change instance | length-two ramified fibre remains length2 after extension | Agrees on displayed instance | Retained |
| 6.3 API 6 | Identity, non-example, or weighted/base-change instance | étale degree-two fibre gives unordered multiset cardinal2 | Agrees on displayed instance | Retained |
| 6.4 API 1 | Identity, non-example, or weighted/base-change instance | qψ=φα on a free orbit gives the same n quotient points | Agrees on displayed instance | Retained |
| 6.4 API 2 | Identity, non-example, or weighted/base-change instance | n1 stabilizer H⊂G; n2 adds permutation factor of order2 | Agrees on displayed instance | Retained |
| 6.4 API 3 | Identity, non-example, or weighted/base-change instance | invariants k(C)^H=k(P¹), quotient field degree1 over k(P¹) | Agrees on displayed instance | Retained |
| 6.4 API 4 | Identity, non-example, or weighted/base-change instance | W-translates have equal ∣H∣ and equal index[W:H] | Agrees on displayed instance | Retained |
| 6.4 API 5 | Identity, non-example, or weighted/base-change instance | normalization of a nodal rational curve has genus0 and is smooth P¹ | Agrees on displayed instance | Retained |
| 6.4 API 6 | Identity, non-example, or weighted/base-change instance | char0 extension keeps generic separability degree unchanged | Agrees on displayed instance | Retained |
| 9.1 API 1 | Identity, non-example, or weighted/base-change instance | Ψ=id gives coarse triple(E,E,[id]) | Agrees on displayed instance | Retained |
| 9.1 API 2 | Identity, non-example, or weighted/base-change instance | identity fibre is(E_u,E_u,[id]) | Agrees on displayed instance | Retained |
| 9.1 API 3 | Identity, non-example, or weighted/base-change instance | simultaneous inverse basis g⁻¹ cancels in φ₂φ₁⁻¹ | Agrees on displayed instance | Retained |
| 9.1 API 4 | Identity, non-example, or weighted/base-change instance | p7 diag(1,3) multiplier3; scalar2 multiplies by4, same square class | Agrees on displayed instance | Retained |
| 9.1 API 5 | Identity, non-example, or weighted/base-change instance | Legendre j(2)=1728 versus j(3)=21952/9 | Agrees on displayed instance | Retained |
| 9.1 API 6 | Identity, non-example, or weighted/base-change instance | restricting Legendre to remove t2 keeps pole at0 and the same rational j-function | Agrees on displayed instance | Retained |
| 10.3 API 1 | Identity, non-example, or weighted/base-change instance | resolution over smooth point has fibre1 point; over1/2 chart exceptional curve1 | Agrees on displayed instance | Retained |
| 10.3 API 2 | Identity, non-example, or weighted/base-change instance | orders2,3,7 give unit weights1 mod2, 1/2 mod3, 1..6 mod7 | Agrees on displayed instance | Retained |
| 10.3 API 3 | Identity, non-example, or weighted/base-change instance | 3/2=[2,2], exceptional matrix[[-2,1],[1,-2]], determinant3 | Agrees on displayed instance | Retained |
| 10.3 API 4 | Identity, non-example, or weighted/base-change instance | exceptional curve image dimension0; strict Hecke transform image dimension1 | Agrees on displayed instance | Retained |
| 10.3 API 5 | Identity, non-example, or weighted/base-change instance | birational function-field degree1 implies normalization genera equal | Agrees on displayed instance | Retained |
| 10.3 API 6 | Identity, non-example, or weighted/base-change instance | base extension retains intersection matrix[[-2,1],[1,-2]] | Agrees on displayed instance | Retained |
| Supplier: ramified analytic finite quotient | Boundary, identity, weighted and comparison instances | sign quotient local degree2, derivative0; dual-number quotient length2; z³ equivariance gives z⁶=z⁶ | Contract or route boundary respected | Retained |
| Supplier: weighted cycle transport | Boundary, identity, weighted and comparison instances | weight3 under degree2 finite map pushes to6; constant map contributes0 | Contract or route boundary respected | Retained |
| Supplier: hyperbolic cycle bounds | Boundary, identity, weighted and comparison instances | coordinate disc V(1)=3.4122762653=4πsinh²(1/2); double cycle doubles both sides | Contract or route boundary respected | Retained |
| Supplier: point-ball comparison | Boundary, identity, weighted and comparison instances | coordinate disc V(1)/V(3)=.05989202454; zero cycle0≤0; unequal-slope line ratio5/4→8/7→32/31 decreases | Contract or route boundary respected | Retained |
| Supplier: free locus and relative cycles | Boundary, identity, weighted and comparison instances | free orbit degree7; repeated fibre length2 maps to2[z]; inertia1 versus7 distinguishes loci | Contract or route boundary respected | Retained |
| Supplier: curve extension/normalization | Boundary, identity, weighted and comparison instances | nodal rational curve arithmetic genus1, normalization genus0; identity extension degree1 | Contract or route boundary respected | Retained |
| Supplier: cyclic resolution/contraction | Boundary, identity, weighted and comparison instances | 1/3(1,2) chain[−2,−2]; double plane nonreduced, two disjoint planes disconnected | Contract or route boundary respected | Retained |
| Supplier: contraction intersections | Boundary, identity, weighted and comparison instances | −2+1²=−1; −2+2²=2; −2+0²=−2 | Contract or route boundary respected | Retained |
| Supplier: gonality and Li–Yau ownership | Boundary, identity, weighted and comparison instances | k(t) value1; genus-one value2; sphere λArea=2·4π=8π; modular numerical coefficient7/800 | Contract or route boundary respected | Retained |
| Native Isogeny carrier | Boundary, identity, weighted and comparison instances | identity pullback maps infinity to infinity, degree1; constant finite-point evaluation fails MapsInfinity | Contract or route boundary respected | Retained |
| Worked Green/coarea bridge | Boundary, identity, weighted and comparison instances | h′(s_t)=sinh²(t/2); at t1=.2715403174; at3=4.533830998; monotone flux difference positive4.262290681 | Contract or route boundary respected | Retained |
| Worked norms and Hurwitz | Boundary, identity, weighted and comparison instances | under t²,−2=2(−2)+2; norm divisor[a²]−[∞] has degree0=1−1 | Contract or route boundary respected | Retained |
| 0.6 API: Hecke preservation | Compose degree-one and degree-m cyclic data; remove scalar [2] | degrees 1·m=m; scalar removal divides degree by 2²=4; prime-to-p remains prime-to-p | No Hecke component is created from a non-Hecke component | Add specialized composition input §9.10 |


Pull request: #2130 (roadmap/geometric-frey-mazur at 15ecde1)
