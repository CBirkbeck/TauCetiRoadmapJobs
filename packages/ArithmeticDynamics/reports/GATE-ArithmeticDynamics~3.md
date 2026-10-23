## H01 (CBirkbeck) — applied

`TauCetiRoadmap/ArithmeticDynamics/README.md:4539` replaces the maximal-ray compactification by the closed outer tail R_out(c) at potential G_c(c) and its full inverse image S_out(c); §§3.18, 3.43 and 3.54 use these same cuts. At c=2 the sets are [2,∞] and ℝ∪{∞}, while i belongs only to the erroneous untruncated preimage; gao-ou line 930 and line 1024 identify the source arguments whose abbreviated notation requires this distinction.

## H02 (CBirkbeck) — answered

The prerequisite list must include HeightsRationalPointsAndObstructions (§§0.9–0.19, 0.30, 4.8, 5.17a–f), EffectiveDiophantineMethods (§0.11; Layers 3–4), InverseGaloisAndArithmeticFundamentalGroups (IG.2), and MordellLawrenceVenkatesh (§6.4), all before ArithmeticDynamics. All four folders are absent on main at `72d2b66` and present at the open heads listed below; the PR description still contradicts these contracts and remains unedited because PR-text changes are outside this job's permitted files, so this finding remains outstanding there.

## H03 (CBirkbeck) — applied

`TauCetiRoadmap/ArithmeticDynamics/README.md:1188` restricts both noncommutativity checks to ℚ and adds the characteristic-two equality, retaining the arbitrary-characteristic composition API. At (1,1) the first coordinates are 4 and 2 over ℚ, but both are 0 in characteristic two.

## H04 (CBirkbeck) — applied

`TauCetiRoadmap/ArithmeticDynamics/README.md:9212` replaces setwise surjectivity on m by Φ*(m)A=m using `Ideal.map`, with the identity residue map giving the cotangent isomorphism; the pinned input is `Algebra.FormallyUnramified.map_maximalIdeal` in `Mathlib/RingTheory/Unramified/LocalRing.lean:86`. The new square-map checks give cotangent multiplier 2 and fourth-iterate identity over 𝔽₅, versus multiplier 0 over 𝔽₂, correcting the wording in bell-ghioca-tucker-2010 line 253 without changing its Proposition 2.4 conclusion.

## H05 (CBirkbeck) — applied

`TauCetiRoadmap/ArithmeticDynamics/README.md:9920` replaces §2.94 by §2.80 for the complex atomless balanced-measure characterization. Section 2.94 concerns Berkovich Julia support, while §2.80 supplies precisely the uniqueness needed to identify the density measure in §6.106a; the parameter-recovery source is demarco-krieger-ye-2020 line 381.

## H06 (CBirkbeck) — applied

`TauCetiRoadmap/ArithmeticDynamics/README.md:2020` replaces the direct `limUnder_eq` identification by the normalized-iterate/error-series comparison of §1.1 and lists that input explicitly. The native convergence theorem is at `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean:161`; the new infinity, order-three and P=(3,5) checks distinguish the full Tate series from the series missing its initial height, with the 2(O) normalization and Northcott hypothesis retained.

## H07 (CBirkbeck) — applied

`TauCetiRoadmap/ArithmeticDynamics/README.md:9448` replaces the assertion that Benedetto's criterion is absent by an explicit §6.52 citation and dependency, retaining positive generic height for general rational maps. The checks give generic height 1/2 for z²+t at 0, but height 0 for the wandering constant 2 under z²; benedetto-2005 line 71 and ghioca-tucker-zieve-2008 line 725 support exactly the nonisotrivial polynomial implication.

## H08 (CBirkbeck) — applied

`TauCetiRoadmap/ArithmeticDynamics/README.md:85` replaces the dominant-height gap by HeightsRationalPointsAndObstructions §0.30 `weilHeight_dominant_lower_bound`, and §6.10 consumes it for the extension to the whole finite-fibre locus. Related height-machine, abelian-height and Siegel pointers now name §§0.16, 0.19 and 4.8, respectively, and the critical-height proof cites its actual whole-locus input §6.10 rather than attributing that extension to the supplier.

## H09 (CBirkbeck) — applied

`TauCetiRoadmap/ArithmeticDynamics/README.md:87` and its exact §0.11 supplier contract replace the candidate-set gap by `ED0.boundedHeightPoints`, `ED0.boundedHeightProjectivePoints` and their completeness theorems; §§3.47 and 3.53 retain an integral-generator power basis, all degree-many archimedean embedding data with disjoint root boxes, rational D≥1 and 0<τ≤1. Both output lists and infinity are retained, with D≥exp(B) for a native logarithmic bound and D≥exp([L:ℚ]B_abs) for an absolute bound, consistent with doylekrumm line 61 and line 497.

**Supplier and ownership verification.**

| Supplier | Open head inspected | Consumed sections |
|---|---|---|
| HeightsRationalPointsAndObstructions | `82cf8af` | §§0.9–0.19 height fields, height machine, Tate series and abelian heights; §0.30 lower comparison; §4.8 Siegel; §§5.17a–f projective adelic foundations |
| EffectiveDiophantineMethods | `5499fdb` | §0.11 finite candidate sets; Layers 3–4 rank, saturation and rational-point certification |
| InverseGaloisAndArithmeticFundamentalGroups | `740b9cc` | IG.2 Hilbert irreducibility and specialization |
| MordellLawrenceVenkatesh | `73dc3e8` | §6.4 native Legendre model and discriminant/j-invariant |

Ownership searches covered the roadmaps on main, the board packages, the indexed open roadmap heads and all 26 supplied sibling README files. The ray cuts specialize the unicritical Böttcher construction already owned by ArithmeticDynamics; no other owner of that construction was found, and no generic carrier or duplicate Lean declaration was added. The Tate series, general height comparisons and bounded-height sets retain their existing owners. No ownership was moved, and no later supplier was introduced.

Final citation resolution against main `72d2b66` and the 331 indexed open roadmap heads found no missing roadmap citations or Lean names. The new local-ring declaration was independently read at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, and the elliptic convergence and zero-height inputs at Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. In particular, `Ideal.map` is defined as the span of the image in `Mathlib/RingTheory/Ideal/Maps.lean:43`; it does not assert setwise surjectivity, and the unramified maximal-ideal theorem carries local-map and essentially-finite-type hypotheses.

**Elaborated signatures.** All 15 declarations were checked together using `#check @name` in one scratch Lean file, elaborated successfully, and compared individually with their README statements. No section hypothesis disappeared: characteristic zero remains on both polynomial-orbit targets, all three Lech field/algebra instances remain, and both ellipticity instances remain on the three-branch theorem. All four definitions have real bodies. No signature change was needed, so `TauCetiRoadmap/ArithmeticDynamics/Suggested.lean` is unchanged.

**Adversarial computations.** The table records each repaired mathematical statement and each Lean acceptance declaration; pointer-only changes preserve the mathematical statements and are checked by their imported contract. Values are exact unless marked approximately.

| Statement | Instances tried | Values on the two sides or negative control | Result | Change |
|---|---|---|---|---|
| §0.17 composition, units and degree | Identity, square map, constant (0,1), degrees 2 and 3 | id∘square=square∘id=(X₀²,X₁²); square∘(0,1)=(0,1), degree 2·0=0; degree 2·3=6 | Arbitrary characteristic retained | None to API |
| §0.17 noncommutativity | (1,1) over ℚ, 𝔽₂ and 𝔽₃ | First coordinates 4 versus 2; 0 versus 0 modulo 2; 1 versus 2 modulo 3 | The universal inequality fails in characteristic two | Scope inequality; add equality |
| §1.18 doubling/series identity | O; order-three P=(0,0) on y²+y=x³; P=(3,5) on y²=x³−2 | O gives 0=0; 2P=(0,−1), 4P=P, all heights 0; x(2P)=129/100 and log3+(log129−4log3)/4=(log129)/4≈1.214953101 | Series and normalized iterates agree; omitting the initial term changes the answer by log3 | Use §1.1 |
| §1.18 integer multiplication and normalization | O with m=2,3; an exact scaling height H; 2(O) versus (O) | 0=m²·0; errors for H are 0 and the limit is H; the (O) value is H/2 | Scaling and factor two retained; torsion converse keeps Northcott | No narrowing |
| §3.18 escape-potential normalization | z² at z=2; z²+2 at 0 and 2 | G_0(4)=log4=2log2; normalized iterates at levels 7,8,9 give G_2(0)≈0.454784805061, G_2(2)≈0.909569610122 | Positive critical potential distinguishes maximal ray from tail | Specify G_c and its existing escape-rate input |
| §3.35 R_out definition and compactness | d=2,c=2,θ=0; z=0 and z=2 | R_out=[2,∞], so 2 belongs and 0 does not; the maximal (0,∞] omits its limit 0 | Closed endpoint c is essential | Truncate at G_c(c) |
| §3.35 inverse-tail identity | d=2,c=2; z=i and z=0; d=3,c=2 | f_2(i)=1<2 and f_2(0)=2; corrected preimage is ℝ∪{∞}, while the old preimage includes i; for d=3 the preimage is three spokes z³≥0 | Exactly d closed tails ending at 0 | Use S_out=f_c⁻¹(R_out) |
| §3.35 Hausdorff limit | c_j=1/4+1/j, j=1,2,∞ | Initial endpoints 5/4,3/4,1/4; each S_out=ℝ∪{∞}; f_(1/4)⁻¹([1/4,∞])=ℝ∪{∞}; Julia intersection is {1/2} | Compact limits and full inverse image agree | Use outer tails at every stage |
| §3.35 angle/point periods and co-roots | d=2,n=2,c=−3/4; d=3 | f(−1/2)=−1/2 and multiplier −1; point period 1 versus angle period 2; co-root counts 0 and 1 | n>1 restriction is confined to root/co-root claim | Retain original generality |
| §3.43 sector convention and slit map | d=2,c=−3,θ=1/2; c=2,θ=0 | Preimage of (−∞,−3] is iℝ; right/left half-planes give U₀/U₁; f((1±√13)/2)=(1±√13)/2 with constant codes 0/1; at c=2 ray zero lies in the cut | Label domain and orientation are necessary | Name S_out and add witnesses |
| §3.43 period-preserving coding | d=2,c=−3; points 1 and −2 | f(1)=−2 and f(−2)=1; codes 01 and 10 have period 2; constant codes have period 1 | Point and code periods agree | Add explicit checks |
| §3.54 local monodromy route | c−c₀=δ²; satellite exponent n=2 | One positive turn takes δ=ε to −ε and the next to ε; the two branches are exchanged and the second turn fixes each | Tail limits select labels without altering the local covering degree | Add direct §3.35 input |
| Height-machine supplier §§0.16,0.19 | ℙ¹, O(1), O(2), [1:2]; elliptic O | h_O(1)=log2, h_O(2)=2log2; [m]O=O and height 0=m²·0 | Linearity and elliptic normalization unchanged | Replace legacy locators |
| §0.30 supplier / §6.10 extension | [x:y]↦[x²:y²] at [1:2]; a constant map on ℙ¹ | Image height log4=2log2, c=2,C=0; constant target height 0 cannot bound unbounded source heights with c>0 | Generic finiteness matters; whole finite-fibre locus remains a separate target | Import §0.30, retain §6.10 |
| Siegel supplier §4.8 | ℙ¹ with one, two or three punctures; S={2} | One puncture admits integers 0,1,2,…; two admit 2^n; three give unit-equation pairs (2,−1),(−1,2),(1/2,1/2) | Boundary hypothesis is retained | Replace legacy locator by §4.8 |
| Candidate-set supplier §0.11 | L=ℚ,D=2,τ=1/2; D=1 | At radius 2 the union is {0,±1,±2,±1/2}, with infinity giving 8 points; at radius 1 it is {0,±1}, with infinity giving 4 | Boundary list and infinity are indispensable | Import both lists and projective completeness |
| §§3.47,3.53 normalization adapter | [2:1] over ℚ and over a quadratic field; 1/2 over ℚ | Absolute height log2 in both fields; native multiplicative heights 2 and 4, so exp(2log2)=4 is required in degree 2; 1/2 has denominator 2 and is missed by integral-only candidates | Full supplier hypotheses and native/absolute distinction retained | Specify integral power basis and complete embedding data |
| §§3.47,3.53 orbit-filter adapter | z²−2; candidates {−3,−2,−1,0,1,2,3} | −2↦2↦2; −1↦−1; 0↦−2; 1↦−1; ±3↦7 leave the candidates; retained set {−2,−1,0,1,2} | Inclusion plus orbit repetition gives both directions | Replace gap by actual completeness input |
| §6.61 extended ideal and cotangent | u↦u² at 1 over 𝔽₅ and 𝔽₂ | u²−1=(u−1)(u+1), u+1 has residue 2 over 𝔽₅; cotangent multiplier 2 versus 0 over 𝔽₂; u−1 is not fixed by u↦−u, whereas every element of 𝔽₅(u²) is | Ideal extension, not setwise image, gives the needed isomorphism | Replace intermediate assertion |
| §6.61 affine return | F=2U+5U² over ℤ₅; F=U+1; dimension 0; square map over ℤ₂ | Modulo 5, 2U permutes residues as [0,2,4,1,3] and its fourth power is [0,1,2,3,4]; translation has pth power U; the empty-coordinate space has one point; modulo 2 the square-map reduction is [0,0] | Invertibility yields a finite permutation, including rank 0; ramified control fails | Add positive and negative checks |
| §6.76 positive generic height | f=z²+t,P=0; f=z²,P=2 | Iterates 0,t,t²+t have normalized geometric heights 0,1/2,1/2, with limit 1/2; the constant orbit 2,4,16,256 has geometric height 0 | Wandering alone cannot replace positivity | Cite §6.52 only for nonisotrivial polynomials |
| §6.76 specialization | t=3; generic height 1/2 | Orbit 0,3,12,147 escapes; the specialization limit is 1/2, so its eventual lower bound is (1/4)h(t)>0 | The general positive-height implication is unchanged | Add computed control |
| §6.106a density, duplication and branch exclusion | t=2,z=3; branch z=2; t=0 | f=49/24, f′=−35/144, and (f′)²p=4p(f)=1225/3456; density·abs(z−2) tends to C_2/2 at t=2 and to 0 at t=3; at t=0 the radial integral contains ∫dr/r and diverges | Complex balance has factor 4 and smooth parameters are necessary | Replace §2.94 by §2.80 |
| Lean `forwardOrbit` | id at 0; successor at 0 | {0} versus {0,1,2,…}; index zero contributes 0 in both cases | Real definition matches README | None |
| Lean `noRationalFourCycle` | z² at 0; z²−1 at 0 | Minimal periods 1 and 2, both unequal to 4 | Degenerate cycles do not falsify target | None |
| Lean `noRationalFiveCycle` | z² at 0; z²−1 at 0 | Minimal periods 1 and 2, both unequal to 5 | Degenerate cycles do not falsify target | None |
| Lean `atMostOneRationalThreeCycle` | c=−29/16,x=−1/4,y=5/4 | Orbit −1/4,−7/4,5/4,−1/4; y=f²(x); all three points are distinct | Period-three hypotheses and disjunction agree | None |
| Lean `stoll_integer_family_card_gal` | a=1,n=0,1; excluded a=0,−4 at n=1 | For a=1, X has group order 1=2^(1−1), and X²+1 has order 2=2^(2−1); X² and X²−4 instead have group order 1≠2 | Level zero and family guards are correct | None |
| Lean `IsFiniteUnionAP` | Empty index set; (0,3); (2,1) | ∅; {3}; {1,3,5,…}; powers {1,2,4,8,…} have unbounded gaps and are not a finite union of progressions | Empty sets and singletons are supported | None |
| Lean `rittCommonIterate` | F=−X³,G=X³,n=2 and n=1 | At n=2 both are X⁹ (value 512 at 2); γ=−1,H=X³,r=3,s=0 gives γ^s=1 and γ^(1+3)=1; at n=1 values −8 and 8 differ and γ^1=−1 fails | Both directions have the monomial control; s=0 retained | None |
| Lean `ellipticStandardProjection` | Identity matrix and coordinate swap; O and x=0 | Identity sends [1:0] to ∞ and [0:1] to 0; swap sends them to 0 and ∞; zero matrix has determinant 0 and is excluded by GL₂ | Denominator-zero branch and matrix convention agree | None |
| Lean `legendreTorsionImages` | t=2,3; t=0,1 | Smooth discriminants 64 and 576; projected two-torsion sets {0,1,2,∞} and {0,1,3,∞}; singular parameters have discriminant 0 | Carrier and smoothness guards agree | None |
| Lean `polynomialOrbits_meetingLine` | F=X²,G=(X−1)²/2+1,x=2,y=5,a=2,b=1 | Orbit pairs (2,5),(4,9),(16,33) lie on y=2x+1; G(2z+1)=2z²+1=2F(z)+1 with n=1 | Objects, equal degrees and nonzero slope are present | None |
| Lean `lechIntegralAssembly` | L=ℚ,s={0,1/6},N=3; empty s | p=5>3 gives norms 0 and 1; p=2 gives norm(1/6)=2 and fails; empty s imposes zero integrality constraints | Marked zero and prime exclusions behave as stated | None |
| Lean `legendreTorsionSpecializations_infinite` | a=2,t=2 and t=4 | At t=2, (2,0) has order 2; at t=4, (2,2i) lies on the curve and duplicates to x=0, giving order 4; both parameters avoid 0,1 | Algebraic nonbranch mark admits distinct torsion specializations | None |
| Lean `polynomialLine_returnTimes` | Constant maps at 0; F=X+1 at 0; F=−X at 1 | The line x=0 gives all ℕ for the constant orbit, x=1 gives ∅; translation meets x=2 at {2}; sign change meets x=1 at {0,2,4,…} | All, empty, singleton and periodic return sets are representable | None |
| Lean `uniformLegendreCommonTorsion` | t₁=2,t₂=3; diagonal t₁=t₂=2 | Common branch torsion contains {0,1,∞}, cardinal 3, so B≥3; the diagonal has infinitely many torsion images and violates finiteness | Distinctness and explicit finiteness are necessary | None |
| Lean `uniformThreeBranchCommonTorsion` | Legendre models t=2,3 with identity matrices; identical models | Branch overlap {0,1,∞} has cardinal 3; identical models give cardinal 4 and fail the hypothesis | Branch-count guard and ellipticity binders agree | None |

**Validation.**

Build command: `lake build TauCetiRoadmap.ArithmeticDynamics.Suggested`.

Build outcome: exit 0; `Build completed successfully (8976 jobs).` The eleven intended theorem admissions produce `declaration uses sorry` warnings; there are no build errors. The separate scratch elaboration of all 15 signatures also exited 0.

Dependency-check output, with no UPWARD or CYCLE line:

```text
depcheck: 27 roadmaps, 235 edges, 0 problem(s)
```

The first gate run rejected only the uncommitted README (`dirty=1`); its other counters were zero. The final committed-tree gate outcome is recorded below.

Commit: `6db9f1f0` — `ArithmeticDynamics: review repairs (compact ray tails, characteristic checks, precise supplier contracts)`. No push was made.

Final gate outcome: exit 0.

```text
gate ArithmeticDynamics: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
