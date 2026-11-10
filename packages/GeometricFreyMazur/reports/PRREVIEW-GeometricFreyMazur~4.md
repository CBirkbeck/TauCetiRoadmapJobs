# Review of GeometricFreyMazur (pull request #2130 at 0e81d72)

**Verdict:** needs changes

## R01 (P3) — The generated merge-order block still denies an actual dependency

**Location.** Pull-request description, generated block `merge-order` (recorded in `scratch/pull-request.md:46`): “It depends on no other author's open pull request.”

**Claim.** This sentence is false at this head. The handwritten dependency paragraph and generated `depends-on` block name #1726, CanonicalModelsAndGonality; the merge-order chain still omits it and its suppliers #1313 and #1017. This is previous R01, still unrepaired.

**Witness.** #1726's `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:338–345` consumes CongruenceSpectralGap, HeightsRationalPointsAndObstructions and MotivesAndAlgebraicCycles. Their positions in `merge-order/ORDER.txt` are 157, 142 and 92; GeometricFreyMazur is at 311.

**Repair.** Correct the generated `merge-order` block: add #1313 (MotivesAndAlgebraicCycles) and #1017 (HeightsRationalPointsAndObstructions) at their ordered positions, put #1726 (CanonicalModelsAndGonality) after #1504 and before #2130, and delete the quoted denial. Regenerate from that dependency closure, or correct this block directly.

**Repair check.** The proposed sequence is 92 < 142 < 157 < [CanonicalModelsAndGonality] < 311. CanonicalModelsAndGonality's head contains no citation of GeometricFreyMazur. Thus the proposed placement respects the supplier direction; its absence from ORDER is not itself a finding.

## Previous findings

- R01 — not repaired: the generated `merge-order` block still says “It depends on no other author's open pull request” and omits CanonicalModelsAndGonality. Repeated above.
- R02 — repaired: README §§9.2 and 9.4 distinguish their descent argument from BT16 line 75; §9.2 cites Sil09 Corollary III.9.4, recorded as uncertified in the existing manifest.
- R03 — repaired: README §2.6 names Proposition 12(b), BT16 line 621, its single-ball claim and the replacement union. Printed page 723 is correct; the previous review's requested page 724 was mistaken.
- R04 — repaired: README line 55 cites the native triangle and geometric-CM carriers; §§1.1–1.2 use their generator conventions, and §9.2 uses `HasGeometricCM`, with corresponding Needs entries.
- R05 — repaired: README line 1408 now includes §9.5 among Layer 10's other-layer prerequisites, agreeing with §§10.1–10.2.

## Verified sound

🤖 Independent AI incremental re-review of 32 changed lines since 6017ad8. Only the changed passages, their cited inputs and affected consumers were reopened. The unchanged mathematical evidence below is explicitly attributed to review 3, not presented as newly recomputed.

**Gate and elaboration.** The worker's gate has every counter zero, including build. I reran the gate, the dependency check, the targeted build and direct elaboration of `TauCetiRoadmap/GeometricFreyMazur/Suggested.lean`. All passed. The two Lean warnings, at lines 58 and 78, are only `declaration uses sorry`. The targeted build reports successful completion of 18244 jobs.

The rerun gate output was:

```text
gate GeometricFreyMazur: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The dependency-check output was:

```text
depcheck: 235 roadmaps, 2133 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The diff outside the roadmap folder is empty, Suggested.lean is unchanged from 6017ad8, and the worktree remains clean. The nine gap slugs agree between `packages/GeometricFreyMazur/design/plan.json` and the README; this repair changes no supplier gap.

**Sources and the seeded sample.** The changed sample targets are §1.1 and §9.2. I read BT16 lines 358–380 (printed pp. 717–718), 427–446 (p. 719), 58–82 (p. 710), and 584–645 (pp. 723–724). These support the triangle quotient, normalization and attribution repairs. §1.2's additional matrix-to-presentation identification was checked directly against the pinned definitions and by computation. Sil09 is settled as uncertified; no claim is made to have read it.

For §2.6, BT16 line 584 begins PDF page 15, printed p. 723; Proposition 12(b) is at lines 621–623, before line 624 begins PDF page 16, printed p. 724. The repaired locator is accurate. BT16 line 75 announces the deduction of Theorems 1–2 from Theorem 3 without the rank-one-lattice and scalar descent steps; §§9.2 and 9.4 now correctly identify those as this roadmap's arguments.

The other 13 seeded targets are unchanged. Their existing rows are carried forward where review 3 supplied them; five supplemental computed rows below cover the unchanged sampled conventions that had no individual row there. This is not a fresh full source audit of those targets.

**Pinned declarations opened.** At Tau Ceti 2fd255d, I checked the seven declarations newly cited in the repair and the direction-defining helper:

| Declaration | File and line at the pin | What was verified |
|---|---|---|
| `TauCeti.TriangleGroup` | `TauCeti/GroupTheory/TriangleGroup/Basic.lean:80` | Presentation uses zyx; exponent zero imposes the identity relation. |
| `TauCeti.TriangleGroup.lift` | same file, line 174 | Four relations, with generator images at lines 180–191; x and y generate by line 146. |
| `TauCeti.ModularGroup.triangleGroupEquiv` | `TauCeti/Analysis/Complex/Fuchsian/LevelOne/TriangleGroup.lean:315` | x ↦ ST, y ↦ S, z ↦ T⁻¹; the three image theorems are at lines 320, 327 and 333. |
| `TauCeti.UpperHalfPlane.ConvexPolygon.triangleGroupEquiv` | `TauCeti/Analysis/Complex/Fuchsian/TriangleOrder/Group.lean:367` | The isomorphism for a specified triangle sends generators to its vertex transformations. |
| `TauCeti.TriangleOrder.IsHyperbolic.exists_isCofinite_triangleGroup` | same file, line 469 | Typed angles, cofinite realization and abstract-group isomorphism; not a compactified modular-curve identification. |
| `WeierstrassCurve.GeometricEnd` | `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/ComplexMultiplication.lean:94` | Endomorphisms after base change to the separable closure. |
| `WeierstrassCurve.HasGeometricCM` | same file, line 100 | Existence of an endomorphism outside the integer image. Nonconstant-j exclusion is not part of this definition. |
| `vertexReflectionComp` | `TauCeti/Analysis/Complex/UpperHalfPlane/Polygon/Convex/Triangle/Group.lean:60` | Reflect first in side i−1, then in side i; polygon vertices are counterclockwise by `Polygon/Convex.lean:87`. |

I also reopened `TauCeti.Isogeny` at `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean:139`, Mathlib's `FunctionField` at `Mathlib/NumberTheory/FunctionField.lean:59`, and `WeierstrassCurve.Affine.Point.map` at `Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean:822` (Mathlib 1b1ccf4). These retain the native carriers used by the unchanged headlines.

**Citations and ownership.** The citation resolver found no missing cross-roadmap identifier. Its output explicitly excludes checking pinned library names; those newly added names were checked locally as above. The following affected supplier contracts were reopened at main or the open head through `roadmaps show`:

| Supplier | Resolved sections and evidence |
|---|---|
| FuchsianOrbifolds, main | Layers 0, 1, 2 and 4; Layer 2 item 6, README lines 547–559, already cites exactly the triangle realization used here. |
| ModularCurves, main | §0E, README line 839, effective descent and spreading; §2C, line 1294, both factorization-dual identities. |
| ModularCurvesPartII, #913 | §§1.2, 4.7, 6.1, README lines 422, 1490, 2123: pointed uniformization, scalar-level components and compact comparison. At p=7 the supplied genus is (9·4·2)/24=3 and effective deck order is 168. |
| ComplexComparisonPartII, #848 | C2.2, C4.1–C4.5 and C6.2, README lines 2257, 2668, 2690, 2703, 2731, 2774, 4854: proper algebraization, maps, components and Riemann existence. |
| InverseGaloisAndArithmeticFundamentalGroups, #850 | IG.3.1, README line 2582: punctured-curve covers and branch-cycle ramification. |
| AbelianSchemesAndArithmeticModuli, #849 | A3.1, A3.5, A6.1, A6.6, A6.7, A6.25, README lines 1401, 1523, 2832, 2938, 2954, 3456: isogenies, duality, degree, finite free Hom and relative extension. |
| CanonicalModelsAndGonality, #1726 | Supplier closure at README lines 338–345, as used in R01. Its gonality ownership and distinct namespace are unchanged. |

The object search used `roadmaps grep`, the pinned elliptic-curve directories and the supplied overlap data. The repair now consumes the general triangle-group and geometric-CM carriers; it owns their compact modular-curve identification and nonisotrivial function-field application. The nearby #1696 FuchsianOrbifoldsPartII, #1728 GroupActionsOnRiemannSurfaces and #1335 ArithmeticDynamics scopes concern, respectively, Nielsen cores, finite actions/generating vectors, and dynamical systems. They do not take ownership of this new normalized modular triangle comparison. #913 supplies X(p), and #1726 supplies gonality. No overlap record reports a dropped identifier or a conflicting change to this folder. No new general carrier is declared in Suggested.lean.

**Headline signatures and padding.** The README's headlines remain compact/cusped systoles; signed reconstruction and repulsion; diagonal overlap and multiplicity; Heegner/bicusp multiplicity; wreath-pullback decay and bounded-gonality rigidity; characteristic-zero rigidity and full monodromy; Frey–Mazur over the original base and function field; bounded-genus classification and known-curve minimal models. Suggested.lean states `full_monodromy` and `geometric_frey_mazur`; its module docstring names the missing carriers for the others. The repairs introduce no new statable headline.

A scratch copy with `#check @name` for all three declarations elaborated. All signatures agree with the supplied signature report and README §§9.6 and 9.8: algebraically closed characteristic-zero constants, a compatible function-field tower, nonconstant j, the numerical prime threshold, actual torsion equivariance, and the order ∀N ∃M ∀k K are retained. No binder changed or disappeared. A separate scratch probe tried `simp`, `rfl` and `infer_instance` as closing tactics for each headline; neither closed. The near-match list's point-map identities and elementary polynomial/field facts do not supply either existential conclusion. The unchanged one-line gonality definition is required by both headlines.

**Fresh adversarial computations.** The new triangle identification has an exact check as well as the numerical witness. Put h=c/(1−b), y²=b/(1−b). Reflections in the three sides of the counterclockwise triangle are
r₀(w)=1/conjugate(w), r₁(w)=−conjugate(w), and
r₂(w)=(h·conjugate(w)+y²)/(conjugate(w)−h).
Then r₂r₁=U_p⁻¹, r₁r₀=S and r₀r₂=SU_p as projective transformations. This matches the pin's product order.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| Added TriangleGroup/lift contract | (3,2,0), x=ST, y=S, z=T⁻¹ | In PSL, zyx=T⁻¹S²T=1; z⁰=1. At exponent p, zᵖ=1 is the added relation. | agrees with pin | repair verified |
| Added hyperbolic realization contract and §1.1 | p=2,3,5,7 | Reciprocal sums 4/3, 7/6, 31/30, 41/42; only p=7 is <1. | small primes excluded | repair verified |
| Added triangleGroupEquiv contract and §1.1 quotient map | p=7 | γ(T)=z⁻¹; order 7, γ(T⁷)=1 and γ(T)≠1; order of PSL₂(F₇)=168. Orbifold Euler characteristic −1/42 times 168 is −4=2−2·3. | marking and genus agree | repair verified |
| §1.2 normalized triangle | p=7,11,101 | det U=1 each time; y=1.725082425, 3.240910243, 32.123353236; reflected vertex angle/π=0.588942012, 0.641665769, 0.666399656. | counterclockwise normalization matches fixed points | repair verified |
| §1.2 reflection Check | p=7; w=0.3+2i, −1+i/2, 2+3i | Max errors r₂r₁ versus U⁻¹: 7.02·10⁻¹⁶; r₀r₂ versus SU: 4.44·10⁻¹⁶. Wrong inverses give 4.056378917 and 2.143705397. | matches claimed 4.06, 2.14 and tolerance | repair verified |
| §1.2 direction, negative control | p=7, w=i | U(i)=0.511717181+1.142851149i; U⁻¹(i)=−0.511717181+1.142851149i. | inverse convention distinguished | repair verified |
| §2.6 corrected source attribution and count | δ=1/64; empty intersection | Applying §2.5 at 2δ gives 16·2δ=32δ=1/2; p=101 gives p^(1/2)=10.0498756; empty intersection uses 0 balls. | statement retained; locator now points to corrected claim | repair verified |
| Added GeometricEnd/HasGeometricCM contract; §9.2 | E:y²=x³+x over k(t), char 0 | Δ=−64≠0, j=1728; f(x,y)=(−x,iy), f²(x,y)=(x,−y)=[−1]. No integer n has n²=−1. | CM negative control is excluded by nonisotriviality | repair verified |
| §9.2 rank-one Hom and worked descent | non-CM E, geometric isogeny h of degree d=3 | h∨h=[3]≠0 in End(E)=ℤ; image of Hom→ℤ is a nonzero subgroup, hence rank 1. For a=0,1,−2, a²d=0,3,12. | rank and prime-to-p argument preserved | repair verified |
| §9.4 and worked scalar descent | p=7; f=id, Ψ=−id; sign χ=−1 | (−1)Ψ=I=f[p]; χf[p]=6I≠I. At p=2 the two signs are both I, excluded by oddness. | actual-equivariant descent distinguishes twists | attribution repair verified |
| Layer 10 dependency summary | g=0,1; N=2 | gonality=1,2, both <3; genus 1 does not give gonality <2. The field-uniform threshold is M₃ from §9.5. | added §9.5 is the needed supplier | repair verified |
| §0.1, unchanged sampled convention | p=5,7; scalar 2 and determinant 3 | Nonzero squares: {1,4} and {1,2,4}; −1 is 4 and 6 respectively. Scalar 2 has determinant 4, while 3 is nonsquare at 7. | two components and conjugation agree | supplemental numeric check only |
| §2.4, unchanged sampled convention | g∈H, M=I; nonabelian matrix test | Displacement=0, height(I)=1. For U=[[1,1],[0,1]], S=[[0,−1],[1,0]], USU=[[1,0],[1,1]] lies in HSH but neither SH nor HS. | both stabilizer factors needed | supplemental algebra check only |
| §4.3, unchanged sampled Check | p=101, ξ=(a,a), a singular bicusp | 101 stabilizer graphs pass through ξ; distance to SBC×SBC=0; log 101=4.615120517. The trigger requires 101>C·4.615120517. | cusp alternative realized when triggered | supplemental numeric check only |
| §6.4, unchanged sampled convention | n=1,2, p=7; local cyclic normalization t↦t⁷ | W orders 336 and 2·336²=225792; permutation factor orders 1 and 2. In the local cyclic model, invariant field k(t⁷), degree 7, ramification index at 0 equals 7. | permutation and residual inertia distinguished | supplemental model check only |
| §9.5, unchanged sampled descent | faithfully flat field extension; I=0 or (1) | I⊗k′=0 or (1), respectively; a nonzero vector in I stays nonzero. Only the finitely generated model field is embedded in ℂ. | field-uniform argument unchanged | supplemental algebra check only |

**Carried adversarial evidence.** The following 30 rows retain review 3's values for unchanged mathematical statements. Their source is linked on each row. The earlier requests attached to §§2.6 and 9.4 are resolved above; the carried numbers are not new findings.

| Statement | Instances | Values computed | Result | Evidence |
|---|---|---|---|---|
| `gonality` (README 21; Lean 47) | headline binders; k(t); ℂ(t)/ℝ | 0<gonality, Lean-proved; k(t): f=t gives 1; ℂ(t)/ℝ: 2 (i∉ℝ(f)) | holds | Carried from [review 3](packages/GeometricFreyMazur/reports/PRREVIEW-GeometricFreyMazur~3.md) |
| `full_monodromy` / §9.6 | N=0,1; N=2, p=227/229; constant E over ℂ(t) | vacuous (gon≥1); 7·227=1589<1600<1603=7·229; constant E gives image {I}, missing [[1,1],[0,1]], excluded by j∉k | holds | Carried from [review 3](packages/GeometricFreyMazur/reports/PRREVIEW-GeometricFreyMazur~3.md) |
| `geometric_frey_mazur` / §9.8 | `#check`; Legendre, e=id; quadratic twist | ∀N ∃M ∀k K; Q=σP gives eQ=σ(eP) trivially, identity isogeny; a twist's geometric iso has σf=−f, not equivariant | holds | Carried from [review 3](packages/GeometricFreyMazur/reports/PRREVIEW-GeometricFreyMazur~3.md) |
| §0.4 | p=7 | 3=(p−1)/2 same-line cusps; inertia 7; gcd(7,2)=gcd(7,3)=1 | holds | Carried from [review 3](packages/GeometricFreyMazur/reports/PRREVIEW-GeometricFreyMazur~3.md) |
| §0.6 | m=1,4,6,9; swap | ψ=1,6,12,12; σ₁(4)=7; f∨[p]φ₂=mφ₁ with m a unit mod p | holds | Carried from [review 3](packages/GeometricFreyMazur/reports/PRREVIEW-GeometricFreyMazur~3.md) |
| §1.3 | p=7, 11, 13, 101, 103; deformed | words equal M_p, det 1, trace 2p²+2, ≡I mod p; tr/p² = 0.683877, 0.6839176, 0.68391798 at p=1009, 10007, 100003 → 27/(4π²)=0.683918 | holds | Carried from [review 3](packages/GeometricFreyMazur/reports/PRREVIEW-GeometricFreyMazur~3.md) |
| §1.4 | p=7 | A=[[0,−1],[1,−7]] gives M=[[1,−7],[7,−48]], trace −47; 2arcosh(23.5)=7.699389<4log7=7.783641 | holds | Carried from [review 3](packages/GeometricFreyMazur/reports/PRREVIEW-GeometricFreyMazur~3.md) |
| §1.8 | p=101, y=1/2, 1, 1/4 | 0.969374, 4.163618, 0.939686, 0.984568 | holds | Carried from [review 3](packages/GeometricFreyMazur/reports/PRREVIEW-GeometricFreyMazur~3.md) |
| §2.5 | p=101…100003 | d(z₀,zᵢ)=9.132087 at p=101, then 2log p−0.0922; labels (29,3) and (72,−3)=−(29,3) | holds | Carried from [review 3](packages/GeometricFreyMazur/reports/PRREVIEW-GeometricFreyMazur~3.md) |
| §2.6 | as in R03; lens radius | separations as in R03; 2artanh√tanh(1/2)=1.657454; excess → 0.693147=log 2 | holds | Carried from [review 3](packages/GeometricFreyMazur/reports/PRREVIEW-GeometricFreyMazur~3.md) |
| §3.5 | ℂ/ℤ[i]; ℂ/ℤ[ω] | [i]−[−i]=[2i], degree 4; [ω]−[ω²], degree 3; both invertible on E[p] for p>3 | holds | Carried from [review 3](packages/GeometricFreyMazur/reports/PRREVIEW-GeometricFreyMazur~3.md) |
| §4.2 | split, imaginary, real quadratic | ±I; ≤6 units; log((3+√5)/2)=0.962424, so ≤2(A log p+log 2)/0.962+1 values | holds | Carried from [review 3](packages/GeometricFreyMazur/reports/PRREVIEW-GeometricFreyMazur~3.md) |
| §4.4 | p=7, d=1, R=1/2 | 0, 0.980099, 1.645565, 1.961531 (symmetric); k=0,1,6 below 1; sinh 10=11013.232875 | holds | Carried from [review 3](packages/GeometricFreyMazur/reports/PRREVIEW-GeometricFreyMazur~3.md) |
| §5.2 | d=4 | Σ_(m<4)ψ=8≤14<64; BT16 has d³ | holds | Carried from [review 3](packages/GeometricFreyMazur/reports/PRREVIEW-GeometricFreyMazur~3.md) |
| §5.3 | BTE p. 3 render | printed sinh(ρ/2)/sinh ε; Prop 3.1 forces sinh ε/sinh R | holds | Carried from [review 3](packages/GeometricFreyMazur/reports/PRREVIEW-GeometricFreyMazur~3.md) |
| §5.5 | q=t², ε=0.01; diagonal at p=7 | 2π/(−log ε)=1.364376; ratio 1+24/4=7 | holds | Carried from [review 3](packages/GeometricFreyMazur/reports/PRREVIEW-GeometricFreyMazur~3.md) |
| §5.8 counterexample | p=7, general p | ratio ∣G₀∣/(2K)=3p/(p−6), 21 at p=7, → 3 | holds | Carried from [review 3](packages/GeometricFreyMazur/reports/PRREVIEW-GeometricFreyMazur~3.md) |
| §6.2 | degree-q map to a rational image | gon(D)=1≤n | holds | Carried from [review 3](packages/GeometricFreyMazur/reports/PRREVIEW-GeometricFreyMazur~3.md) |
| §6.5 | n=2, C=T₁×{a}, p=7 | Deg=8; Σ pair=(n−1)·8=8; K_(Sⁿ)=Σπᵢ*K_S | holds | Carried from [review 3](packages/GeometricFreyMazur/reports/PRREVIEW-GeometricFreyMazur~3.md) |
| §8.2 | p=2, 3, 5 | A₃ index 2; Q₈ index 3 in SL₂(𝔽₃); SL₂(𝔽₅) perfect, so no index <5 | holds | Carried from [review 3](packages/GeometricFreyMazur/reports/PRREVIEW-GeometricFreyMazur~3.md) |
| §8.3 | N=2; Borel | 7·229/800=2.00375>1; index 230 gives 2.0125 | holds | Carried from [review 3](packages/GeometricFreyMazur/reports/PRREVIEW-GeometricFreyMazur~3.md) |
| §8.4 | 𝔽₅, diag(2,3) | both sides [[0,3],[2,0]] | holds | Carried from [review 3](packages/GeometricFreyMazur/reports/PRREVIEW-GeometricFreyMazur~3.md) |
| §9.1 | Legendre t=2, 3; Ψ=diag(1,3), p=7 | j=1728, 21952/9; 3∉{1,2,4} | holds | Carried from [review 3](packages/GeometricFreyMazur/reports/PRREVIEW-GeometricFreyMazur~3.md) |
| §9.4 | Ψ=[−1], f=id | f[p]=−Ψ; χ=−1 forces 2f[p]=0, impossible for odd p | holds | Carried from [review 3](packages/GeometricFreyMazur/reports/PRREVIEW-GeometricFreyMazur~3.md) |
| §9.7 | sign step | needs p odd and p>3; M_N≥max(M_N^geom,5) | holds | Carried from [review 3](packages/GeometricFreyMazur/reports/PRREVIEW-GeometricFreyMazur~3.md) |
| §10.1 | N=2 | g≤1 gives gon≤2<3, so M₃ is needed; BT16's M₂ misses genus 1 | holds | Carried from [review 3](packages/GeometricFreyMazur/reports/PRREVIEW-GeometricFreyMazur~3.md) |
| §10.2 | g=0, 1 | gonality 1 and 2, both <3 | holds | Carried from [review 3](packages/GeometricFreyMazur/reports/PRREVIEW-GeometricFreyMazur~3.md) |
| §10.3 / §10.5 | 1/3(1,1), 1/3(1,2), 1/p(1,p−1); C²=−2 | [−3]; [−2,−2]; p−1 (−2)-curves; −2+1=−1, −2+4=2 | holds | Carried from [review 3](packages/GeometricFreyMazur/reports/PRREVIEW-GeometricFreyMazur~3.md) |
| dᶜ convention | f=z²; disc metric | ddᶜ=(i/2π)∂∂̄; 4πddᶜ(−log(1−∣z∣²))=4dxdy/(1−∣z∣²)²; mass 2 | holds | Carried from [review 3](packages/GeometricFreyMazur/reports/PRREVIEW-GeometricFreyMazur~3.md) |
| Point-ball line | (z,z/2), t=1, 2, 4 | V/a=1.207701, 1.122800, 1.023008 (decreasing) | holds | Carried from [review 3](packages/GeometricFreyMazur/reports/PRREVIEW-GeometricFreyMazur~3.md) |

## Not verifiable

- Sil09 Corollary III.9.4: the manifest records the Springer DOI as uncertified, and the new README reference explicitly cites by locator alone. I did not read this paywalled text or request it again.
- BLR90 §1.2 Proposition 8, p. 15, and §1.4 Proposition 2, p. 19: unchanged, settled as uncertified in the manifest. The prior review's access limitation carries forward.

## Source issues

- **Error** in BT16 at Proposition 12(b), printed p. 723: the source says the two enlarged cusp balls intersect inside one smaller ball; it should allow a union of lens balls, retaining the distinct lifted midpoints exhibited in §2.6; affects a stated result.
- **Gap** in BT16 at Theorems 1–2, printed p. 710: the source says the two Frey–Mazur results follow from Theorem 3; it should justify the Hecke lift, scalar-compatible Galois descent and extension over the original base; affects the proof.
