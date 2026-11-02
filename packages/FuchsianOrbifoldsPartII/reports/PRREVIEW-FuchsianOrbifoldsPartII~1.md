# Review of FuchsianOrbifoldsPartII (pull request #1696 at a68a656)

**Verdict:** accepted

## R01 (P3) — Restore the four supplier-gap identifiers

**Location:** `TauCetiRoadmap/FuchsianOrbifoldsPartII/README.md:79`, also lines 81, 83 and 85.

**Claim:** The four paragraphs describe the declared supplier obligations, but omit the required `What AutomorphicSpectralTheory must provide (gap:<slug>):` form. This loses the explicit association with the plan entries that intake reads.

**Witness:** `packages/FuchsianOrbifoldsPartII/design/plan.json:2093` contains four gap slugs; the reviewed README contains zero `gap:` occurrences. Its four corresponding prose contracts are at lines 79–85.

**Repair:** Prefix those four contracts, respectively, with the required form and these identifiers: `primitive-minus-cycle-invariant`, `primitive-pell-word`, `narrow-dictionary-compatibility`, `oriented-quadratic-cycle-reversal`. Retain their mathematical statements and named supplier. A scratch-copy replacement using the four plan entries produces exactly the same four-element slug set, with no unmatched or duplicate identifier.

This is a nonblocking formatting finding. The brief explicitly declares all four contracts, so their absence from the supplier today is not an unowned prerequisite or a reason to withhold acceptance. Acceptance remains conditional on those declared contracts, not a certification that they have already been implemented.

## Verified sound

Independent AI review of the complete two-file folder at the specified head. I read the repository's writing checklist and contribution rules, and the main-branch FuchsianOrbifolds and completed ConformalMapping roadmaps as shape/ownership comparisons. I examined all **28 numbered targets**, their API bullets and **60 Check bullets**, all **15 seeded source targets**, the **8 Lean declarations** (3 definitions and 5 admitted theorems), the supplier contracts and every Needs line. No mathematical counterexample, blocking supplier drift, duplicated headline, computational algorithm, sorry'd data or option override was found. No pull-request file was changed.

The worker's complete gate reports every counter zero and `OK`, including its targeted build. The outside-folder diff is empty. Independent direct elaboration of `TauCetiRoadmap/FuchsianOrbifoldsPartII/Suggested.lean` exited 0 with exactly five admitted-proof warnings. Its Tau Ceti import was already built. A scratch copy with `#check @name` for all eight declarations also elaborated; the actual types agree with the README and retain both admissibility hypotheses in the conjugacy theorem. No binder correction was needed.

The dependency command prescribed in the brief returned:

```text
depcheck: 204 roadmaps, 1500 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The local order also works: the general core precedes raw Ford geometry; arithmetic boundary comparison precedes conformal lifting and projected measures; complementarity precedes family covering; compact truncation precedes the improper integral and endpoint. The coarse Layer 0/1 relationship has no reverse dependency from general geometry to arithmetic periods.

### Adversarial computations

These are instance tests and proof-route checks, not substitutes for the future Lean proofs. “Retain” means no mathematical change is requested. Euclidean coordinates in the table are lifts in ℍ; area is always hyperbolic. Matrix equalities are checked before quotienting by ±I when useful. Empty inputs and all-2 lists are tested as negative controls, not silently admitted to geometric theorems. Each numbered target, each Lean theorem and the formatting finding has a row below; additional rows separate the main API identities and conventions.

| Statement | Instances tried | Values computed on the two sides / wrong model | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: effective S and left action | i, 2i | S(i)=i; S(2i)=i/2; S²(2i)=2i, while the matrix square is −I | Projective order 2; SL order 4 distinguished | Retain |
| Conventions: rotation direction | [3,6] → [6,3] | {0,3}−3 modulo 9={6,0}; +3 gives {3,6}, not the required centre set {0,6} | T⁻³ has the stated direction | Retain |
| Conventions: norm signs and least positive norm-one unit | D=12, D=8 | 2²−3=1; 1²−3=−2; (1+√2)²=3+2√2, of norm 1 | Positive-norm and negative-norm classes separated; negative-norm unit must be squared | Retain |
| Conventions: Δ and α | F=log y on [0,1]×[1,2]; F=y² | Δlog y=1; boundary α integral=1/2−1/4=1/4=(1/2)∫₁²y⁻²dy. Δy²=−2y², not −2y⁻² | Sign, coefficient and metric agree | Retain |
| §0.1 definition of Λ and elementary cases | trivial group; ⟨S⟩; ⟨T⁴⟩; z↦4z | Boundary accumulation sets ∅, ∅, {∞}, {0,∞}; cardinalities 0,0,1,2 | None is nonelementary; infinite group alone is insufficient | Retain |
| §0.1 basepoint independence, closedness and conjugacy | ⟨T⁴⟩ at i and 2i; conjugation by S | Both orbits limit only at ∞; S{∞}={0}=Λ(S⟨T⁴⟩S⁻¹); singleton is closed | Correct action and basepoint laws | Retain |
| §0.1 first/second kind and hyperbolic endpoints | PSL₂(ℤ); ⟨z↦4z⟩ | Λ_mod=entire circle; cyclic fixed endpoints 0,∞ both lie in its two-point Λ | Full-circle and elementary cases are not called nowhere dense perfect sets | Retain |
| §0.2 hull and actual boundary | modular group; an interval complement containing ∞ | Modular hull=ℍ and genuine boundary count=0. For finite endpoints −1,1 and the complementary outside interval, the kept side has x²+y²≤1; at i/2 it is true, exterior-side inequality false | Away-side convention handles ∞ | Retain |
| §0.2 exclusion of cone points on supporting boundary | supporting line through i; S | S exchanges the two sides of that line; it cannot stabilize the chosen half-plane. Boundary stabilizer at an interior boundary point has order 1 | Half-disc boundary charts, not cone charts | Retain |
| §0.3 finite-area core and finite generation | Γ([4]); modular group | Core areas π and π/3; full quotient areas ∞ and π/3; funnel counts 1 and 0. Removing width-4 tail above Y removes area 4/Y | Finite core area does not assert finite covolume | Retain |
| §0.4 signature and B | (0;2,3;1;0); (0;2;1;1); pair of pants; punctured sphere | B/π=1/3,1,2,−2 respectively; last case cannot be a positive-area nonelementary core | Boundary contributes +t, not an extra cusp | Retain |
| §0.4 cone permutation and doubling API | [2,3] versus [3,2]; pants g=0,t=3 | Defect sum=7/6 in both orders; double genus=2·0+3−1=2; B_double=4π=2·2π | Multiplicity and Euler count agree | Retain |
| §0.5 bordered Gauss–Bonnet | ℓ=1,2,5 arithmetic cores | 2π(−2+1+1+ℓ/2)=π,2π,5π, agreeing with supplied areas | Curvature −1 normalization | Retain |
| §0.6 primitive funnel geodesic | T⁴S versus its square; T⁴ | Eigenvalues of T⁴S are 2±√3; primitive length=2log(2+√3). Square length=4log(2+√3); T⁴ has one ideal fixed point and no axis | Proper powers and cusp classes excluded | Retain |
| §1.1 `AdmissibleCycle` | [], [2], [2,2], [3,2], [4,4] | Predicate values false,false,false,true,true; sums 0,2,4,5,8 | Raw repeated lists allowed, all-2 lists excluded | Retain |
| §1.1 `cycleGroup`, generators and alternate centre | [], [4], [3,6] | Empty generator set reduces to {1}, giving ⊥. Nonempty centre/width data: ({0},4), ({0,3},9); S_m=T^m S T⁻m | Total construction and alternate presentation agree | Retain |
| §1.1 half-turn API | centre 3 | S₃=[[3,−10],[1,−3]], S₃(3+i)=3+i, S₃²=−I, S₃≠±I | Nonidentity order-two factor, not a translation | Retain |
| §1.2 `cyclePolygon` membership and free intervals | [4], [3,2], []; z=2+i/2 | For [4], squared distances to 0,4 are both 17/4≥1, strip condition true. Free-interval lengths 2 and (1,0); for [] the raw polygon is x=0,y≥1 | Empty polygon input is not an admissible fundamental domain | Retain |
| §1.2 side pairing and high strip | [3,6], heights 1 and 2 | i,3+i,9+i are boundary points; T⁹(i)=9+i. At y=2 each disc inequality is ≥4, so the entire width-9 strip remains | Elliptic endpoints retained; no extra orbit at 9+i | Retain |
| §1.3 `cyclePolygon_fundamentalDomain` | [4], [3,2]; boundary ties | S(i/2)=2i moves a point inside the excluded disc outside it. At a height-one centre the tied orbit contributes area 0, whereas an open disc has positive area | a.e. formulation fits side ties; height-increasing reduction is valid | Retain |
| §1.3 `cycleGroup_presentation` | [4], [4,4] | Factors ℤ*C₂ and ℤ*C₂*C₂; in the second, SS₄=[[-1,4],[4,−17]] and S₄S=[[-17,−4],[−4,−1]], unequal modulo sign | Repeated digits do not identify factors or abelianize the group | Retain |
| §1.3 `cycleGroup_cuspStabilizer` | [4], [3,6], [4,4] | Translation exponents on both sides are 4ℤ,9ℤ,8ℤ. For [4,4], the height-one set has period 4 but the cusp subgroup has period 8 | Full stabilizer, not just one included translation | Retain |
| §1.3 topology and elliptic orbit count | [4], [3,2], [4,4] | (g,r,s,t)=(0,1,1,1),(0,2,1,1),(0,2,1,1). Circle tangency for digit 2 occurs at y=0; no extra interior vertex or parabolic side pairing arises | One cusp and one funnel are consistent with the polygon gluing | Retain |
| §1.4 cyclic invariance over M | [3,6] → [6,3] | m=9 in both; translated centres modulo 9 are {0,6}; π_mod(T⁻³z)=π_mod(z) | Both subgroup inclusions follow from the same translated generator set | Retain |
| §1.5 boundary word and primitivity | [3,6], [4,4], [2] | Products [[17,−3],[6,−1]], [[15,−4],[4,−1]], [[2,−1],[1,0]]; traces 16,14,2 and determinants 1,1,1. Middle word is (T⁴S)² | Primitive arithmetic hypothesis is necessary; repeated raw list still valid elsewhere | Retain |
| §1.5 fixed-point direction and endpoint inequalities | [3,6] | Roots (3±√7)/2≈0.1771,2.8229; 0<0.1771<1<2<2.8229<3. Next roots 6±√7≈3.3542,8.6458 satisfy 3<3.3542<4<8<8.6458<9. At w, derivative=(8+3√7)⁻²<1 | Ordering and attracting root correct | Retain |
| §1.6 `cycleGroup_infiniteIndex`, second kind and area | [4] | (1,3) is a free interval; on 3/2≤x≤5/2, 0<y≤1, ∫y⁻²dxdy=∞. Core area=π. Infinite coset cardinal gives native index=0 | Infinite full area and finite core area distinguished | Retain |
| §2.1 finite boundary partition | [4], [3,6] | One-digit cut ends at γz. For [3,6], z=1/2+i√3/2, next crossing=5/2+i√3/2, S₁γz=17/2+i√3/2; return map T⁻⁹S₂S₁γ sends z to z | Finite arcs, including endpoint equality, meet in the required order | Retain |
| §2.1 orientation and preserved integrals | first [3,6] arc | At its summit x=3/2,y=√7/2 the traversal points right; its left normal points up, into the core. All cutting matrices have determinant 1 | Core-on-left agrees with Stokes | Retain |
| §2.2 actual core comparison and cusp cutoff | [3,6], z=3/2+6i/5 | Norm squares to 0 and 3 are 369/100>1: z∈P. On the boundary circle the squared radius is 7/4>36/25, so z lies below it and z∉Q. Maximum arc heights √7/2,√7<3 | Height-one Ford cutoff is not used for the core | Retain |
| §2.2 proper projection and overlap | D=28 principal core | Total upstairs area=2π; target area=π/3, ratio 6. Above Y=3 the tail mass is 9/3=3; a compact target set has bounded cusp height | Projection cannot be an isometric embedding; proper finite-sheet description survives | Retain |
| §2.3 definition V and logarithmic identity | x=−2,0,2,4 | 2arsinh(x/2) and stated logarithm both give −1.762747,0,1.762747,2.887271 | Total signed scalar definition is consistent | Retain |
| §2.3 cosh, monotonicity and arcosh iff | x=−2,0,2 | cosh V=3,1,3=1+x²/2; arcosh values +1.762747,0,+1.762747. V values strictly increase; equality holds exactly at nonnegative samples | Even arcosh is not the signed definition | Retain |
| §2.3 lift distance versus quotient distance | Γ([4]), i and 4+i | Lift distance V(4)=2.887271; quotient distance=0 since T⁴ identifies the points | No intrinsic rigidity claim is smuggled into V | Retain |
| §3.1 reflected double | one-cone core; pair of pants; t=0 | (0;2;1;1) doubles to (0;2,2;2;0), area 2π; pants double has g=2, area 4π. At t=0 two copies have two components | Connectedness requires t≥1 | Retain |
| §3.1 reflection and gluing API | Fermi collar at r and −r | cosh²(−r)=cosh²r; at r=0 normal derivative of cosh²r is 0. Exchanging copies twice is identity; overlap is precisely the glued circle | Smooth geodesic reflection and involution | Retain |
| §3.2 conformal lift and cone order | order-two cone; cusp-fixing lift | Cone meridian is killed by its square, not its first power; local map u↦u² has degree 2. Cusp-fixing PSL map is az+b with a>0; identity gives a=1,b=0 | Ordinary covering used only after puncturing; cone marks retained | Retain |
| §3.3 maximal-height formula | P₁=3+i under S; i under S | Heights 1/(3²+1²)=1/10 and 1/(0²+1²)=1. S(3+i)=−3/10+i/10 | Integer denominator bound correct | Retain |
| §3.3 equality and nonidentity witness | [4,4]; identity at 2i | Maximal set ({0,4}+8ℤ)+i=4ℤ+i, while full cusp width=8. Identity would fix height 2>1 but is excluded | Height period alone is insufficient; no zero denominator | Retain |
| §3.4 `cycleGroup_conj_iff_isRotated`, positive direction | [3,6], [6,3] | Rotation=true; conjugacy=true by T⁻³; both widths 9 | Both sides true | Retain |
| §3.4 raw classification, repeated and reversed controls | [4] vs [4,4]; [3,4,5] vs [5,4,3] | Widths 4≠8 despite equal highest sets. Second pair has width 12 but gap rotations {345,453,534} omit 543; centre sets {0,3,7} and {0,5,9} | Both iff sides false for both pairs | Retain |
| §3.4 narrow-class recovery | D=12, I versus J; A versus itself | Period lengths 1 and 2, cone counts 1 and 2, classes unequal: no orbifold equivalence. Identity class comparison has rotation 0 and identity map | Coarse unmarked equivalence is not substituted | Retain |
| §4.1 half-open convention | i; ±1/2+2i; ±1/2+i√3/2 | F_DIT membership true; true,false; true,false respectively. i∉fdo. Norm/vertical boundary differences have area 0 | Representative ties agree with DIT | Retain |
| §4.1 quotient measure and regular locus | order-two cone; modular orbifold | Singleton mass=0; χ=2−1−1/2−2/3=−1/6; −2πχ=π/3. Removing two coarse cone points from the open modular surface leaves a connected punctured surface | No extra division by central order 2 | Retain |
| §4.2 projected mass and pushforward API | D=12 and D=28 classes | Mass pairs (π,2π),(2π,5π); pullback of 1 integrates to precisely those masses. Any image-area restriction has mass ≤π/3 | Multiplicity is indispensable | Retain |
| §4.2 density high in cusp and reciprocal case | D=28; D=5, period [3] | Individual high-cusp densities 9,12. D=5 has m=3,ℓ=1,J=1 and ν=3μ_mod, whose mass is π | Correct integer sheet counts | Retain |
| §4.3 family probability and empty control | D=28 S={I,J}; S=∅ | L=2+5=7, mass=7π/(7π)=1. Empty sum has mass 0; totalized reciprocal cannot change it to 1 | Nonempty hypothesis protects denominator | Retain |
| §4.3 weighted mixture, singleton and coset independence | D=28; a high-cusp set of area a=π/100 | Correct family probability=(9+12)a/(7π)=0.03. Equal average of class probabilities=9a/(4π)+12a/(10π)=0.0345. Singleton mass πℓ/(πℓ)=1 | Weights 2/7,5/7, not 1/2,1/2; equal coset sets give equal finite sums | Retain |
| §4.4 complementary covering | D=12; D=28 | Total densities 4+5=9=3(1+2), and 9+12=21=3(2+5); mass identities 3π=9π/3, 7π=21π/3 | Constant inferred from signed-boundary cancellation has correct value | Retain |
| §4.4 involution fixed point and retracing | D=5, A²=J | ι(A)=A; left side 2ν_A, right side 6ℓ_Aμ_mod. Division gives ν_A=3ℓ_Aμ_mod, not 6ℓ_Aμ_mod | Factor two retained for reciprocal cycles | Retain |
| §4.5 exact family/genus covering | D=12 whole group vs singletons; D=136 | Whole D=12 density=9 and normalized mass density=3/π. J is nonsquare since 3 divides 12; singleton cusp densities 4,5 differ from 3,6. 136=6²+10² and factors 8·17 have no prime 3 mod 4 | Whole-family result does not imply each singleton result | Retain |
| §4.5 J square is weaker than J=1 | D=136 | 35²−34·6²=1; for y=1,…,6, 34y²−1=33,135,305,543,849,1223, none square. Supplied unit bound excludes norm −1, while J is square | Narrow and ordinary criteria not conflated | Retain |
| §4.6 four arithmetic examples | D=12 periods [4],[3,2]; D=28 [3,6],[3,3,2,2,2] | Matrices [[4,−1],[1,0]], [[5,−3],[2,−1]], [[17,−3],[6,−1]], [[23,−18],[9,−7]]; traces 4,4,16,16; all determinants 1. Widths 4,5,9,12; areas π,2π,2π,5π | Same-field lengths and complementary counts agree | Retain |
| §4.6 ideal labels | (1+√3); (3+√7); (2+√7) | Norms −2,+2,−3. These match the ideals of norms 2,2,3 and labels J,I,J respectively | Leading-coefficient/sign dictionary agrees | Retain |
| §5.1 truncation and α | F=1; local F=y; width 9,Y=3 | α₁=0; α_y=dz/2; top integral −9/2. Constant omitted tail=9/3=3 | Top goes right-to-left; y is only a local sign test | Retain |
| §5.1 paired-edge cancellation and exhaustion | invariant F; Y and 2Y above arcs | Paired integrals u and −u sum to 0; tail areas m/Y and m/(2Y), difference m/(2Y)>0 | Increasing exhaustion, not compactification by a point | Retain |
| §5.2 finite Stokes identity | F=log y rectangle | dα=(1/2)y⁻²dxdy; integral=1/4; bottom 1/2 plus top −1/4=1/4 | Exact sign and λ/2 normalization | Retain |
| §5.2 λ=0 branch | F=1 on F_A; general width mean a(Y)=bY+c | I_A(1)=πℓ_A while both boundary and λI/2 are 0. Flux=−ib/2; limit 0 forces b=0; tail integral=c/Y₀ | Existence proved without dividing by zero; no absolute-convergence overclaim | Retain |
| §5.2 λ≠0 branch | fixed λ≠0 and boundary integral B | Finite identity gives I(Y)=2(B−i flux(Y))/λ; with flux→0, limit=2B/λ and λI/2=B | Hypothesis does not contain the conclusion | Retain |
| §5.3 completed endpoint constant term | s=1/2+ε | Pole coefficients +√y/(2ε),−√y/(2ε) cancel; finite term √y(log y+2c_Λ); eigenvalue 1/4 gives coefficient 1/8 | Regular continuation, not totalized Λ(1)E(1/2) | Retain |
| §5.3 endpoint derivative and integrability | width m, cutoff Y | Flux=−im(1+(log Y+c)/2)/(2√Y)→0; mean tail=m(2log Y+4+2c)/√Y→0 | Logarithmic bound is sufficient and has the right coefficient | Retain |
| §5.3 nonconstant C¹ Fourier terms | n=±1,±2 | Pair contributions 4√yK₀(2πy)cos(2πx), 8√yK₀(4πy)cos(4πx); period integrals 0; derivative frequency factors −2π,−4π. K₀′=−K₁ | Divisor counts 1,2 and first-derivative bounds agree | Retain |
| §5.3 supplied t≠0 and cusp-form applications | t=1; cusp mean 0 | λ/2=(1/4+1)/2=5/8; multiplying by Λ(1+2i) scales both sides equally. Cusp mean and integrated horizontal derivative both 0 | Only t=0 requires the new cancellation argument | Retain |
| R01: machine-readable gap association | four plan contracts | Plan identifiers=4; reviewed README identifiers=0; repaired scratch-copy identifiers=4, with equal sets | Formatting mismatch only | Restore identifiers |

### Seeded source verification

All three cited works are legally readable in the supplied cache; no README locator is flagged unverified. I checked the version-of-record page/theorem/equation locators. The README's line convention is explicitly raw `pdftotext -layout` output with form feeds split into lines. I reproduced that extraction convention: its cited line numbers agree. The cache adds page markers and therefore has different line numbers. The locators below are the **cache** line numbers requested for this report.

| Seeded target | Source text opened | Scope/hypotheses result |
| --- | --- | --- |
| 0.1 Limit set | DIT16 line 149; LU23 line 251 | Ideal circle, elementary cardinalities, and second-kind qualification agree. LU23's nowhere-dense assertion occurs inside its second-kind discussion, not for all nonelementary groups. |
| 0.4 Signature with geodesic boundary | DIT16 line 157, printed pp.952–953 | Finite generation, cone orders, cusp count and genuine boundary count are retained. Capped genus and permutation API make the convention explicit. |
| 0.5 Gauss–Bonnet | DIT16 line 174, equation (2.8), p.953 | The right side is 2g−2+s+t+Σ(1−1/m); multiplication by 2π matches the roadmap. |
| 1.1 Quadratic cycle group | DIT16 line 246, equations (3.1)–(3.2), p.954 | Source defines arithmetic cycles. The roadmap identifies its larger raw-list domain and proves the algebraic construction on that domain; it does not assert the source states this generalization verbatim. |
| 1.3 Cycle polygon presentation | DIT16 line 323, Theorem 1 and proof, p.957 | Source gives arithmetic signature and free product. Disjoint discs, integral height reduction and side gluing use only the raw digit hypotheses; repetition does not introduce a relation. The marked isomorphism is stronger bookkeeping supplied locally. |
| 1.4 Cyclic invariance | DIT16 line 255, p.954 | Translation conjugacy is stated; subtracting the selected prefix derives the roadmap's precise sign and projection compatibility. |
| 1.6 Infinite index | DIT16 line 253 and line 323, pp.954,957 | Source asserts thinness/second kind. Roadmap independently proves the free-interval assertion and uses infinite area ⇒ infinite index, avoiding an invalid inference from arbitrary infinite index to second kind. |
| 2.3 Elliptic lift spacing | DIT16 line 394, proof of Theorem 1, p.959 | The displayed V is the roadmap's logarithm. Distances are between specified lifts; signed extension to negative x is a local scalar consequence, not a claim of negative metric distance. |
| 3.1 Double | DIT16 line 164, pp.952–953; ComplexCurveModuli D0.4/D6.2 | DIT supplies boundary geodesics, not a doubling theorem. The roadmap explicitly says this and owns the cusped-orbifold reflection/gluing proof. The compact smooth floor is separately resolved below. |
| 3.4 Conformal recovery | DIT16 line 332 and line 387, Theorem 1, pp.957,959 | Source states recovery for arithmetic classes. The new lift/maximal-height argument justifies the raw-list strengthening, including repeated periods; primitive arithmetic classification remains a declared supplier contract. |
| 4.1 Modular boundary convention | DIT16 line 195, p.953 | Both inequalities and retained ties agree exactly, including i and the left circular arc. |
| 4.2 Projected measure | DIT16 line 416, (4.3), pp.959–960; line 439 | Counting Q_A∩ΓΩ retains sheets, as in the surface integrals. Extension to Borel pushforward and local finite densities is explicitly proved here. |
| 4.3 Family probability | DIT16 line 410, (4.1)–(4.3), p.959 | Genus is the square-subgroup coset; area-weighted normalization follows from the source's sums. Arbitrary nonempty finite families are the stated elementary extension. |
| 4.6 D=12,28 | DIT16 line 262 and line 293, pp.955–957 | D=28 roots, periods, units and areas agree. D=12 is explicitly a new arithmetic calculation, not falsely attributed to a printed example; both periods and norm signs were recomputed. |
| 5.1 Truncation | DIT16 line 1038, proof of Lemma 2, p.972 | Height truncation and top boundary term agree; ≤ versus < changes a null edge. The roadmap supplies the high-enough cutoff, finite corners, cone cancellation and orientation. |

Additional source checks: geometric finiteness uses LU23 Proposition 3.5 (LU23 line 275, p.195) and SERIES05 Theorem 3.33 (SERIES05 line 733, p.21); the funnel discussion is SERIES05 line 1143, p.33. The boundary word and arc partition are DIT16 line 348, equations (3.4)–(3.6), pp.957–958. Complementarity and the principal-genus criterion are DIT16 line 439, p.960. The eigenfunction identity and flux condition are DIT16 line 1025, Lemma 2, equations (7.10)–(7.11), p.972. The [publisher's open version of DIT16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf) agrees with the cached version-of-record numbering.

### Pinned declarations and ownership

Pins match the README: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`, Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. The following are declarations whose definitions or signatures I opened, not just names returned by a search. Paths are relative to the respective library repositories.

| Pinned declaration(s) | File and line | What the pin supplies and what it does not assume |
| --- | --- | --- |
| `UpperHalfPlane.volume_def` | `Mathlib/Analysis/Complex/UpperHalfPlane/Measure.lean:44` | Density `(1/y)²` on the positive-height subtype; not a finite quotient measure. |
| `UpperHalfPlane.dist_eq`, `cosh_dist` | `Mathlib/Analysis/Complex/UpperHalfPlane/Metric.lean:42`, line 67 | Curvature −1 distance with positive height product; specializes to 2arsinh(n/2) at height 1. |
| `ModularGroup.S`, `T` | `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:825`, line 829 | Integral determinant-one matrices; S²=−I before taking PSL. |
| `ModularGroup.im_smul_eq_div_normSq` | `Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction.lean:471` | Integral SL action formula; determinant one rules out a zero denominator. |
| `ModularGroup.fdo` | `Mathlib/NumberTheory/Modular.lean:370` | Strict norm and strict vertical inequalities; not a half-open pointwise representative set. |
| `Subgroup.closure`, `closure_le` | `Mathlib/Algebra/Group/Subgroup/Lattice.lean:329`, line 355 | Algebraically generated subgroup and its universal property; not a topological closure. |
| `Monoid.Coprod`, `Monoid.CoprodI.lift_injective_of_ping_pong` | `Mathlib/GroupTheory/Coprod/Basic.lean:144`; `Mathlib/GroupTheory/CoprodI.lean:903` | Native free-product carrier; injection needs disjoint nonempty action sets and the factor-cardinality alternative. Infinite translation factor meets it. |
| `Subgroup.index_eq_zero_iff_infinite` | `Mathlib/GroupTheory/Index.lean:561` | Natural-valued index zero means infinite quotient, not an empty quotient. |
| `ProperlyDiscontinuousSMul.finite_stabilizer` | `Mathlib/Topology/Algebra/ConstMulAction.lean:599` | Properly discontinuous action gives finite point stabilizer; the roadmap obtains the action from discreteness. |
| `MeasureTheory.Measure.map_apply`, `map_apply_of_aemeasurable` | `Mathlib/MeasureTheory/Measure/Map.lean:170`, line 166 | Measurable target set and measurable/a.e. measurable map; pushforward is not unweighted image area. |
| `MeasureTheory.integral_map` | `Mathlib/MeasureTheory/Integral/Bochner/Basic.lean:1076` | A.e. measurability of map and a.e. strong measurability of integrand are explicit. |
| `MeasureTheory.IsFundamentalDomain.quotientMeasure_eq` | `Mathlib/MeasureTheory/Group/FundamentalDomain.lean:630` | Countable action, invariant measure, measurable constant actions and two a.e. fundamental domains; no total-area computation. |
| `completedRiemannZeta_eq`, `differentiable_completedZeta₀`, `completedRiemannZeta_residue_one` | `Mathlib/NumberTheory/LSeries/RiemannZeta.lean:84`, lines 89,110 | Entire modified completion and residue 1; expansion near 1 has constant Λ₀(1)−1. No evaluation of a pole is used. |
| `Complex.differentiableOn_update_limUnder_of_bddAbove` | `Mathlib/Analysis/Complex/RemovableSingularity.lean:100` | Punctured holomorphy, bounded norm and a neighborhood; Cayley-disc lifts meet these conditions. |
| `IsCoveringMap.existsUnique_continuousMap_lifts_of_range_le` | `Mathlib/Topology/Homotopy/Lifting.lean:499` | Path/local path connectedness, matching basepoint and fundamental-group range inclusion. The roadmap proves the inclusion from cone-meridian powers. |
| `UpperHalfPlane.pslMk_smul`, `psl2zToPSL2R_smul` | `TauCeti/Analysis/Complex/UpperHalfPlane/PSL/Action.lean:140`, line 184 | Canonical effective actions; measurable and invariant-measure instances occur between these declarations. |
| `psl2zToPSL2R_injective` | `TauCeti/LinearAlgebra/Matrix/ProjectiveSpecialLinearGroup.lean:138` | Faithful integral-to-real projective embedding. |
| `OnePoint.instMulActionPSL`, `OnePoint.pslMk_smul` | `TauCeti/Topology/Compactification/OnePoint/ProjectiveLine.lean:189`, line 194 | Boundary action includes ∞; Cayley orbit-closure compatibility is new local work. |
| `TauCeti.UpperHalfPlane.isProperMap_psl_smul_I`; discrete subgroup instance | `TauCeti/Analysis/Complex/UpperHalfPlane/ProperAction.lean:58`; `TauCeti/Analysis/Complex/Fuchsian/ProperAction.lean:33` | Proper action and proper discontinuity for the inherited discrete subgroup topology. |
| `Subgroup.instIsCyclicStabilizer` | `TauCeti/Analysis/Complex/Fuchsian/Stabilizer.lean:45` | Discrete subgroup and point of ℍ; no unsupported claim about arbitrary nondiscrete stabilizers. |
| `TauCeti.UpperHalfPlane.geodesicLine`, `dist_geodesicLine` | `TauCeti/Analysis/Complex/UpperHalfPlane/Geodesic.lean:87`, line 106 | PSL-translates of the exponential vertical line, with distance abs(s−t). |
| `TauCeti.UpperHalfPlane.ConvexPolygon.volume_carrier` | `TauCeti/Analysis/Complex/UpperHalfPlane/Polygon/Convex/GaussBonnet.lean:215` | Actual convex polygon, including ideal vertices; angle-defect area, not an assumed quotient signature. |
| `ModularGroup.fd_ae_eq_fdo`, `isFundamentalDomain_fdo` | `TauCeti/NumberTheory/Modular.lean:196`, line 234 | Null-boundary equality and PSL fundamental domain, not the ineffective SL action. |
| `UpperHalfPlane.volume_preimage_coe_null`, `volume_setOf_re_mem_Ico_and_lt_im` | `TauCeti/Analysis/Complex/UpperHalfPlane/Measure.lean:77`, line 91 | Planar null sets remain null; positive height A gives strip area max(b−a,0)/A. |
| `Subgroup.exists_isFundamentalDomain`, `IsCofinite`, `isCofinite_iff_isCofinite_and_finiteIndex` | `TauCeti/Analysis/Complex/Fuchsian/Covolume.lean:101`, lines 114,149 | Discreteness and finite covolume; finite generation is not in the definition. |
| `MeasureTheory.covolume_eq_card_mul_covolume` | `TauCeti/MeasureTheory/Group/FundamentalDomain.lean:322` | Nested subgroups, countability, invariant measure and fundamental domain; index multiplier is extended cardinality. |
| `TauCeti.ModularGroup.isCofinite_psl2zToPSL2RRange` | `TauCeti/Analysis/Complex/Fuchsian/LevelOne/Basic.lean:73` | Finite ambient modular covolume for the infinite-index argument. |
| `NumberField.NarrowClassGroup`, `mkPrincipal_sq`, `instFinite` | `TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.lean:83`, line 224; `Finite.lean:38` in that directory | Invertible fractional ideals modulo totally positive principal generators, principal-class squares trivial, finite for number fields. Real-quadratic norm-sign identification still needs the stated dictionary. |
| `TauCeti.Deck.conjMulEquiv` | `TauCeti/AlgebraicTopology/UniversalCover/Deck/Conjugation.lean:129` | Over-base homeomorphism conjugates deck groups; the roadmap explicitly rebases the target cover. |

The object searches used both pins and the roadmap service's main/open-head index, plus the board packages. Search terms covered Nielsen/convex cores, bordered doubles, cycle subgroups, projections and the actual Lean namespace. The only same-namespace Lean declarations found belong to this roadmap. A nominal `cycleGroup` in an algebraic-cycle design and occurrences of Nielsen–Schreier/Nielsen classes are different objects. Relevant open folders including AutomorphicSpectralTheoryPartII, GeometryOfNumbersAndQuadraticArithmeticPartII, TeichmullerGeometry and GroupActionsOnRiemannSurfaces were checked against these results; none supplies the raw-cycle theorem or this cusped bordered-core extension.

The ownership split is therefore substantive: FuchsianOrbifolds supplies the already-planned projective, polygon, cone and cusp theory; AutomorphicSpectralTheory supplies arithmetic surfaces; this Part II supplies the general nonelementary core theory, arbitrary admissible-list strengthening, comparisons, cusped orbifold double, rigidity, complementary measures and improper endpoint. It does not re-plan the arithmetic surface, primitive length, generic narrow group, smooth compact double or absolute-integrability Stokes theorem. No target needs to move between roadmaps.

### Resolved cross-roadmap contracts

I resolved **12 named roadmap suppliers**, using main for existing/completed work and the supplied open heads for new folders. The service's `show` output has a one-line provenance header; the locators here refer to the actual README files, excluding that header.

| Supplier | Resolved repository-relative location | Contract checked |
| --- | --- | --- |
| FuchsianOrbifolds | `TauCetiRoadmap/FuchsianOrbifolds/README.md`, Layers 0–6; Layer 2 items 1–3,5; Layer 3; Layer 4 item 5; Layer 5 item 1 | Effective charts, local polygon/presentation theorem, full cusp subgroup, cofinite signature and genus. The cofinite Dirichlet converse is not used on the infinite-area Ford polygon. |
| UniversalCovers | `Completed/UniversalCovers/README.md:98`, Stage 2 | Ordinary lifting and deck interpretation; implemented APIs are cited at the pin rather than requested anew. |
| CongruenceSpectralGap | `TauCetiRoadmap/CongruenceSpectralGap/README.md:150`, §0.1 | Effective quotient pushforward, measurable fundamental-domain independence, level-one π/3. |
| AutomorphicSpectralTheory | `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:583`, §§0.27–0.28; lines 1159,1179,1810,1819,2641,2658,2676 | Bessel comparison/derivative asymptotics; half-sum completion and Fourier expansion; continuation; arithmetic surface and cusp decomposition; uncompleted critical-line inputs. No reverse dependency on this Part II was found in these inputs. |
| AnalyticNumberTheoryPartI | `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:917`, §2.1 | C² integrable eigenfunction Stokes with vanishing top term; signature; full primitive oriented boundary period. The λ=0 improper-existence proof and completed endpoint are not already supplied here. |
| IntegralLattices | `TauCetiRoadmap/IntegralLattices/README.md:1032`, B2; line 1093, B3 | Positive-discriminant oriented form/ideal dictionary with √D correction for negative a, plus composition. At D=12, x²−3y² and its negative have distinct narrow labels. |
| GlobalNumberFields | `Completed/GlobalNumberFields/README.md:571`, Layer 11 | Orders, invertible proper ideals, narrow Picard quotient and maximal-order comparison, including the named commuting square at line 603. |
| MultiquadraticPartII | `TauCetiRoadmap/MultiquadraticPartII/README.md:580`, §2.3; line 621, §2.4; lines 737,909, §§3.1–3.2 | Fundamental-discriminant two-square criterion, J square rather than J=1, and transport of genus characters through the supplied dictionary. |
| ConformalMapping | `Completed/ConformalMapping/README.md`, L2 and L4 | Disc automorphism/Schwarz–Pick and scalar analytic reflection. No unsupported general orbifold lifting assertion is attributed to these sections. |
| ComplexCurveModuli | `TauCetiRoadmap/ComplexCurveModuli/README.md:27`, D0.1; line 50, D0.4; line 152, D6.2 | Compact smooth normal forms/capping, holomorphic double and uniqueness, even Fermi metric reflection. Orbifold cone orders and cusped double are the explicit extension here. |
| AlgebraicTopology | `TauCetiRoadmap/AlgebraicTopology/README.md:289`, Stage 1; line 1573, Stage 7 | Groupoid van Kampen and finite-cover presentations; Hausdorff finite-CW invariance and excisive gluing. General finite-type orbifold exhaustion is owned in §0.3, not attributed to this supplier. |
| DifferentialGeometry | `TauCetiRoadmap/DifferentialGeometry/README.md:518`, §5.3; line 528, §5.5; line 708, §5.6.3 | Compact-support Stokes, corners and planar comparison. The local cutoff and real/imaginary splitting meet the support/coefficient requirements; the log-height witness gives 1/4 with the supplier's outward-first convention. |

The four plan gaps were read individually. They ask for a primitive cyclic complete invariant, its primitive Pell automorph, native label compatibility and parametrized orientation reversal. Each has one named supplier, stated arithmetic hypotheses and a distinct interface consumer. None asks to reconstruct the already-owned narrow group, general oriented dictionary or Eisenstein endpoint estimates. Their semantic content matches the four README contracts; R01 concerns only the omitted identifiers. The main/source arithmetic examples test these contracts, but do not pretend to discharge them.

### Headline coverage and padding

The headline results are: finite-area general Nielsen core and bordered Gauss–Bonnet (§§0.3,0.5); raw Ford fundamental domain, marked free-product presentation and full cusp subgroup (§1.3); infinite index (§1.6); primitive boundary partition and arithmetic comparison (§§2.1–2.2); reflected double and conformal recovery, including raw-list conjugacy (§§3.1–3.4); complementary and exact family/genus coverings (§§4.4–4.5); improper cusp-flux Stokes and the completed endpoint (§§5.2–5.3).

The five statable acceptance theorems are present on native carriers: fundamental domain, marked presentation, cusp stabilizer, infinite index and raw-list conjugacy. Only their three elementary real-bodied definitions are kept. The module docstring names the remaining geometric/analytic headlines and the missing ideal-hull, bordered-core/signature, period/axis-cycle, orbifold-double, class-indexed projection/measure and oriented-boundary-integration carriers. I found no statable missing headline forced through free predicates or arbitrary assumed geometry. The scalar spacing and small arithmetic values remain README material.

On a scratch copy I tried `simp`, `rfl` and `infer_instance` separately as complete one-tactic solutions for **each of the five admitted theorems**. All 15 attempts failed to close their goals. The definitions and pinned declarations above also show why no single cited library lemma states these cycle-specific conclusions: a.e. modular fundamental domains concern the full group, generic ping-pong needs the cycle action sets, and index zero still requires proving infinitude. None of the five declarations is a boundary-case calculation, a definition expansion or a mirrored Check. The marking conditions and repeated-list conjugacy test make the acceptance file substantially stronger than a catalogue of API consequences.

## Not verifiable

- No cited text was inaccessible or left uncertified in this review. All three references and the 15 seeded locators were readable; no new source request was necessary.
- The four explicitly declared supplier contracts are future obligations. Their precision, minimality, ownership and agreement with the mathematical sources were checked; completion of their future implementations is not certified by this acceptance.
- Source computations and successful `sorry` elaboration do not constitute completed formal proofs. The verdict is readiness for a human's final approval, not AI approval or merge authorization.

## Source issues

- **Misprint** in DIT16 at §2, printed p.952 (DIT16 line 153): the source says the Nielsen half-planes are the sides above the complementary-interval geodesics; it should be the sides away from the complementary ideal intervals, including the interval through infinity; affects a stated result.
- **Misprint** in SERIES05 at the Fuchsian paragraph following Proposition 4.60, printed p.33 (SERIES05 line 1143): the source says geometric finiteness is equivalent to finite area of the Nielsen region; it should be finite area of its quotient, or its intersection with a fundamental domain; affects a stated result.
- **Gap** in DIT16 at Lemma 2 proof, printed p.972 (DIT16 line 1051): the source says the flux limit directly yields the limiting surface integral for every eigenvalue; it should be supplemented at eigenvalue zero by the affine cusp-mean argument proving improper convergence; affects the proof.
