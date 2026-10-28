# GATE-TangentialBordism~2: answers to the human review

The review (rwst, 2026-10-27) was written against `00ccbcd`. This answer is against `2a39277`, which
adds one README section on the parallelization of oriented three-manifolds. That shifts README lines
after line 289 by about +35 relative to the review. The repairs are in commits `2c82879d` and `67b1819e` (the second removes the three upward citations the gate's depcheck found; see H03 and Build and gate). Only
`TauCetiRoadmap/TangentialBordism/README.md` changed; `Suggested.lean` is unchanged. The line
numbers below refer to the new README.

The review text available to this job breaks off inside R15, at "B6.1 gets ℤ[h_4k] from item 2's Wall
lattice, and". Its summary lists items up to R16. The rest of R15 and all of R16 were not readable,
so they are not answered here; H26 covers only the visible part of R15.

Merge order: TangentialBordism (ORDER line 215) comes before HomotopySpheres, FourManifolds,
GeometricTopology (219), SmoothBundlesConnections (221) and DifferentialGeometry (222). The plain
depcheck treats every roadmap listed in the merge order as order-constrained, even where it is also on
main, so none of these three is cited as a supplier: what this roadmap needs from them is owned in
B1.6. Every ownership choice below follows from these facts.

## H01 (rwst) — applied

The atlas claim was false for model dimension 1 with boundary. It is now restricted (README lines
122–141).
- **Old:** for every n>0, the atlas description via `TauCeti.orientationPreservingGroupoid` agrees with the others.
- **New:** the equivalence with the atlas description holds only for the boundaryless model with n≥1, and for half-space and corner models of dimension ≥2. In those cases a tangential reflection (in corner charts, a coordinate swap) makes a boundary chart positive.
- **Model dimension 1 with boundary:** this covers witnesses of zero-dimensional cycles and one-dimensional relative sources. Comparison there goes only through B1.6's chart-sign carrier and the frame and determinant data.

Evidence: pinned Tau Ceti `Geometry/Manifold/Instances/ClosedBall.lean:399–413`. `orientable_closedBall` assumes `2 ≤ n` and states the [0,1] obstruction; the README now cites this.

## H02 (rwst) — applied differently

Relative links to roadmaps that are not on main are removed. FourManifolds, StringOrientation (supplier table and two prose lines), IndexTheory and PseudodifferentialOperators are now cited by roadmap name and section, without a link (supplier table lines 30–45, prose lines 76 and 650).

Immutable blob links and pull-request links with captured heads were not restored. The house rules forbid pull-request references in a roadmap, and the gate's `blob`/`prnum` checks enforce this. Merge order is kept in the merge-order file, not in a README block. The worker places this roadmap after its last supplier (depcheck output below).

## H03 (rwst) — applied differently

R02's point holds: GeometricTopology on main has collars, boundary gluing and tubular neighbourhoods (its Layer 1), the CW structure on `|K|` (Layer 11) and Whitehead triangulation (far-horizon item 1). It has no transversality, corner rounding or doubles. Since the pull-request edition cannot be a supplier (it revises a main roadmap), those statements now have an owner here: new B1.6 (README lines 202–251).
- **Neat embeddings.** These use Mathlib's `exists_embedding_euclidean_of_compact`. It is checked at the pin (`Geometry/Manifold/WhitneyEmbedding.lean:131`) and holds for any model with corners.
- **Transversality.** Parametric and relative transversality are proved from B1.6's manifold Sard theorem. That theorem is derived from Tau Ceti's Euclidean `ContDiff.dense_compl_image_criticalPoints`, checked at the pin (`Analysis/Calculus/Sard/OutermostStratum.lean:397`, for maps of class at least m²+1).
- **Corner rounding.**
- **Compact neighbourhoods and collared doubles.**

GeometricTopology, DifferentialGeometry and SmoothBundlesConnections all come later than this roadmap in the merge order, so citing them would be an upward dependency. The GeometricTopology and DifferentialGeometry supplier rows are gone, and so is the SmoothBundlesConnections B1.4 entry in the LieHighestWeight row. B1.6 now owns the inputs they supplied (README lines 199–315):
- the orientation carrier with chart signs, on Mathlib `Orientation`, compared with `TauCeti.orientationPreservingGroupoid` (`Geometry/Manifold/Orientation.lean:178`);
- face-indexed corners on `modelWithCornersEuclideanQuadrant`;
- collars, boundary gluing, handle attachment and tubular neighbourhoods;
- manifold Sard;
- free proper smooth quotients as principal bundles;
- the native finite `Topology.CWComplex` structure on a finite `Geometry.SimplicialComplex`, and Whitehead's smooth triangulation for manifolds without boundary.

Every use now points to B1.6: lines 106, 114, 134, 183, 186, 190–193, 472, 488, 693, 926 and 1587. B1.5's relative boundary triangulation remains owned here.

This also removes a supplier cycle: the GT pull-request edition consumes TB B3.2 and B4.1–2.

## H04 (rwst) — applied

Hopf invariant one and parallelizable spheres now have one owner, HomotopySpheres §3C item 5. B4.9 (`hopfInvariant_odd_dimension`) and B3.10 (division frames, join Hopf map, `sphere_parallelizable_iff`) are deleted.

The other direction is impossible: HomotopySpheres comes later in the merge order, so this roadmap cannot consume it. HomotopySpheres item 5 at its head builds on CharacteristicClasses C7.3 and uses no TB item. Nothing else in this roadmap used B4.9 or B3.10. The deferral is recorded in the new "Not owned here" paragraph (lines 83–96), and the implementation-order sentence about B3.10/B4.9 is gone. TopologicalKTheory T2.5 (Adams operations), used only by B4.9, is dropped from the supplier row.

## H05 (rwst) — applied

The sentence "B4's Sq/Adem test first forces m+1 a power of2" is gone with B3.10, so no claim is left resting on an unstated indecomposability corollary.

## H06 (rwst) — applied

B3.2 is split into three parts, each the single owner of its statements (lines 421–468):
- **(a)** the finite Arf algebra;
- **(b)** the geometric refinement q on Spin surfaces, with its framing rule, polarization, nonsingularity and naturality;
- **(c)** the ΩSpin₂ filling theorem: realize a q-zero Lagrangian by curves and attach two-handles; conversely the boundary kernel is a q-zero Lagrangian. Its Lie-torus generator has q(a)=q(b)=1, so Arf 1.

The implementation-order paragraph (lines 1510–1516) declares (b) early. It needs only (a), SpinGeometry G4 and AlgebraicTopology's H₁ with mod-2 duality, and precedes the HomotopySpheres, GeometricTopology and FourManifolds consumers. TangentialBordism is earlier than HomotopySpheres in the merge order, so the HomotopySpheres copy at its head (lines 778–792) should cite B3.2(c). That edit lies outside this job.

## H07 (rwst) — applied

B3.11 is deleted: T RP^m, `w=(1+a)^(m+1)`, the immersion normal bundle and the non-immersion of RP^(2^k). B3.10's `sphereTangentStableTrivialization` is deleted too. Both are cited to CharacteristicClasses C7.3/C7.3a on main (CC lines 1554–1618), which are added to the CC row (line 35) and to the "Not owned here" paragraph. B4.6, the one remaining user of `w(T RP^m)`, now cites C7.3a (line 783).

## H08 (rwst) — applied

B3.4 now consumes IndexTheory I7.5 (lines 509–522). The chain is:
1. B3.0's `spinABSDiracIndexComparison`: α(M) = `realSpinDiracIndexClass`.
2. SpinGeometry G6.7 on main (line 831): `realSpinDiracIndexClass = α_ℍ·a`.
3. I7.5's `spinFour_signature_eq_neg_sixteen_mul_quaternionicIndex`: σ = −16α_ℍ.
4. Hence α(M) = −(σ/16)a.

Divisibility by 16 is I7.5's `rokhlin_signature_dvd_sixteen` and is no longer proved here. The Â computation is kept only as a sign check, now using I7.2 instead of B6.1–2. That also removes B3.4's forward reference to B6.1–2 for this step. GeneralizedCohomology G5.5 on main says the same thing ("Index retains its analytical numerical index and Rokhlin theorems"). G6.7 and I7.2/I7.5 are added to the supplier rows.

## H09 (rwst) — applied

B6.5 now constructs PU3⋊C2 (lines 1295–1311):
- **The group:** real-linear maps v↦Av and v↦Av̄ of C³ modulo the scalar circle, with product (A,ε)(B,δ)=(A·ε(B),εδ).
- **Embedding:** a closed subgroup of GL(su3), through Ad and conjugation.
- **Faithfulness:** conjugation acts by −1 on the diagonal Cartan subalgebra, and −1 is not in the Weyl group S₃.
- **Smooth structure:** the native closed-subgroup charts.
- **Action:** an orientation-preserving action on CP2, since conjugation on CP2 has degree (−1)²=+1.
- **Classifier:** from CharacteristicClasses C2.3.

PositiveScalarCurvature then only needs the Fubini–Study invariance.

## H10 (rwst) — applied

A RiemannianGeometry R1 row is added (line 37). R1 on main (lines 278–296) supplies the HP^d quotient metric, its submersion from Sp(d+1)/(Sp(d)×Sp(1)) and the curvature bounds 1 and 4.

B6.6 (lines 1329–1339) proves the metric is PSp3-invariant: left Sp3 multiplication commutes with right Sp1, and −1 acts trivially. It also proves Scal ≥ 8·7 = 56 > 0 from K ≥ 1, which is all the Lichnerowicz step needs. The exact value is 16·2·4 = 128 in PositiveScalarCurvature's normalization.

## H11 (rwst) — applied

B5.4c gets a complex instance (lines 1091–1102).
- **Normal diagram:** B_(2r)=B_(2r+1)=BU(r), with realification, the trivial-line odd step and the ε_ℂ=ε_ℝ⊕ε_ℝ even step.
- **MU comparison:** G5.3's cofinal reindexing identifies its Thom spectrum with G5.4's MU^(2). The PT isomorphism Ω^U_n(X,A) ≃ MU_n(X,A) and the tangent–normal comparison follow.

This is the "geometric MU comparison" that BordismFormalGroups (main, line 188) cites. MU's coefficient calculation stays with BordismFormalGroups.

## H12 (rwst) — applied

The cell-by-cell induction in B5.4c is removed (lines 1077–1087). The new text proves two things: geometric ξ-bordism is a GeneralizedCohomology G1.1 unreduced homology theory, and PT is a G1.1 morphism, with boundary and suspension included. With the coefficient isomorphism, GC G3.3 (main, line 710) then gives the all-CW isomorphism.

## H13 (rwst) — applied

B5.1 (lines 869–876) now defines the coefficient collapse as GC G5.2's unframed collapse S^(n+k)→Th ν followed by the Thom map of ν→γ_k. B5.4 (lines 958–962) consumes G5.2's stabilized-embedding comparison for closed M. Owned here are only the ξ-factor, the half-space/relative version (which G5.2 does not state) and the transport of the ξ-lift. The block-rotation argument is kept only for that relative case.

## H14 (rwst) — applied

B5.5 (lines 1107–1111) now defines the stable framed PT map as item 4 with B a point and ξ trivial (Thom spectrum S), owned by this item, and states Ω^fr_n ≃ π_n S with the signed count in degree 0. The finite framed construction stays here (B5.2), which agrees with the merge order. The HomotopySpheres Stage 5.0 copy at its head should consume B5.2; that edit lies outside this job.

## H15 (rwst) — applied differently

The convergence statement is widened as asked, but with a corrected hypothesis (lines 729–739). For every bounded-below X the tower converges strongly to π_* of the HF2-nilpotent completion, identified with GC's derived 2-completion (`spectrumDerivedPrimeCompletion`). This equals π_*(X)⊗Z_2 when each π_n X is finitely generated, which covers S, S/2, MO, MSO, MSpin, MU, ko and smash products with finite complexes.

"Finite type" in the sense of finite mod-2 homology does not give the tensor form. The Moore spectrum of Z/2^∞ has π₀=Z/2^∞, whose classical completion is 0, while its derived completion has π₁=Z_2. This is now written as a negative check. The odd-prime statement is in B4.7 (see H16).

## H16 (rwst) — applied differently

The generic HF_p tower now sits at the end of B4.7 (lines 814–822), not under a new label:
- **Contents:** the exact couple, bar Ext, multiplicative comparisons and convergence as in H15.
- **Independence:** it uses no PT and no bordism coefficient.
- **Why B4.7:** HomotopySpheres at its head (line 1311) already cites "TB B4.1–2/7" for this tower. A new label would have broken that citation, and renumbering would break the external citations of B4.8.

B4.8 now begins "Using item7's HF_p Adams tower". Its dependency sentence drops B5 (lines 852–856): MSO and MSpin are G5.4's Thom spectra. BordismFormalGroups on main says "B4.8's tower"; that remains literally true, since B4.8 uses it, but B4.7 is the owner.

## H17 (rwst) — applied

B4.2 (lines 709–721) now owns:
- **Transgression:** constructed on DGFloer Layer 1's multiplicative Serre spectral sequence and identified with d_q from E^(0,q−1) to E^(q,0).
- **Kudo's theorem:** Sq^i preserves transgressive classes and commutes with transgression.
- **Borel's transgression theorem.**
- **Serre's computation:** H*(K(F2,n)) by induction along the path-loop fibration.

A DGFloer Layer 1 items 2–3 row is added (line 33), and B4.7 records the odd-prime forms. B3.4's H*(BSpin) computation cites "B4.2's Steenrod-compatible transgressions" (line 484).

## H18 (rwst) — applied

B6.4 (lines 1262–1278) now owns the smoothing theorem for compact Lie G. A continuous principal G-bundle over a compact manifold with corners, already smooth near a closed union of faces C, gets a smooth structure rel C, unique up to a smooth isomorphism isotopic to the identity rel C.

Route:
1. CharacteristicClasses C2.3 gives a finite faithful G⊂U(N) and smooth approximations V_N(C^m)/G.
2. The classifying map factors rel C through such an approximation, and B1.6's relative Whitney approximation makes it smooth.
3. Uniqueness repeats the construction on M×I.

It is applied to SO3, PU3⋊C2 and PSp3.

## H19 (rwst) — applied

The degree-zero coefficient sentences are moved from B1.1 (old lines 127–130, now a pointer at lines 158–159) to B2.4 (lines 282–298), after the quotient exists.
- **Witness invariance** comes from AlgebraicTopology's relative fundamental class: ∂[W,∂W]=[∂W], which maps to 0 in H_(n−1)(W). So the signed boundary count of every compact oriented 1-manifold is 0, and the unoriented count is even, without classifying 1-manifolds.
- **Inverse:** k·(+pt) is a right inverse.
- **Injectivity:** a signed-count-zero zero-manifold bounds pairing arcs.

## H20 (rwst) — applied

The false sentence about what GeometricTopology consumes (old: "GT's TOP-bundle Thom/w comparison consumes only these foundational operation items") is replaced (lines 699–705). Sq(U_ξ)=w(ξ)U_ξ for real vector bundles is owned here (B4.3) and uses no TOP input. A comparison of Thom-identity Stiefel–Whitney classes of TOP bundles with CC's linear classes along BO→BTOP restricts to this formula, so it consumes B4.3 as well as B4.1–2. GeometricTopology's pull request section 3f (line 5718 at its head) has to cite B4.3; that edit lies outside this job.

## H21 (rwst) — answered

A(1), its Q0 Margolis split-injection criterion and the A(1) resolutions stay here, and the "Not owned here" paragraph (lines 90–93) now says so. The reverse assignment would create a cycle. BordismFormalGroups (main, lines 1003–1005) consumes TB's Steenrod and Adams carriers, so it cannot also supply A(1) to TB. BordismFormalGroups keeps the finite sub-Hopf algebras beyond A(1) and general Margolis theory. Its sentence claiming all finite sub-Hopf algebras has to carve out A(1); that edit lies outside this job.

## H22 (rwst) — applied

The connective ABS map D: MSpin→ko is now constructed once, in B3.0 (lines 309–314). MSpin is connective, so G3.8's coreflection lifts G5.5's ABS orientation through ko→KO, uniquely up to homotopy. B3.4 now reads "Prove that B3.0's D … is an isomorphism on π_n for n<8 and onto for n=8". B6.6's "Factor the actual ABS orientation through connective ko" now reads "Use B3.0's connective ABS map D" (line 1327).

## H23 (rwst) — applied

B3.9 now proves the general formula `p(T HP^k)=(1+u)^(2k+2)(1+4u)^(−1)` for every k≥1 (lines 664–670), with u=−c₂(Cγ_H), the same convention as PositiveScalarCurvature. PositiveScalarCurvature is recorded as its consumer. Values checked: k=1 gives p=1 (S4); k=2 gives 1+2u+7u², with signature (49−4)/45=1; k=3 gives 1+4u+12u²+8u³, with L₃=(62·8−13·12·4+2·64)/945=0.

## H24 (rwst) — applied

B6.1 (lines 1160–1166) now proves only bordism invariance of the signature, by Thom's argument: the image of H^(2k)(W;ℝ) is Lagrangian. It consumes IndexTheory I7.2's `sign(M)=⟨L(TM),[M]⟩` instead of proving it again. I7.2 is added to the IndexTheory row.

## H25 (rwst) — applied

B6.3 (lines 1234–1239) now obtains H₆(B(ℤ/m);ℤ)=0 from ClassifyingSpaces Stage 4 (`H_*(BG;ℤ)` = `groupHomology`) and Mathlib's `Rep.FiniteCyclicGroup.groupHomologyIsoEven` (pinned `RepresentationTheory/Homological/GroupHomology/FiniteCyclic.lean:85`). For trivial ℤ coefficients the complex is ℤ --0--> ℤ --m--> ℤ, and its middle homology is ker(m)=0. A ClassifyingSpaces row is added.

## H26 (rwst) — applied differently

Only part of the visible R15 is fixed in the text.

**Repaired:**
- **B2.4:** "equality with G5's spectral … maps after B5" is deleted; it is B5.5's.
- **B2.5:** the AHSS moves to B5.7 (lines 1124–1129), and its two citations are updated.
- **B3.10/B4.9:** both are deleted (H04).
- **B3.4 and B6.1–2:** for the four-dimensional step, B3.4 now uses I7.5 (H08).
- **B3.4 and B6.6:** H*(BSpin), H*(MSpin), H*ko=A//A(1) and D* move into B3.4 (lines 481–490), and B6.6 consumes them.
- **B4.3:** "hence unoriented bordism" now defers to item 5 (line 749).
- **B4.8:** B5 is dropped from its dependencies (H16).
- **B5.2:** it now constructs the collapse map and states that item 3 proves the bijection (lines 887–892).
- **B6.1:** the step combining the Wall lattice moves into B6.2 (lines 1155–1157 and 1214–1215).

**Still forward references:**
- B3.0 uses B5.
- B3.1's coefficient table uses B4, B5 and B6.1–2/h4.
- B3.3 uses B3.4.
- B3.4 uses B4.2/B4.8 and B6.1–2 at odd primes.
- B4.5 uses B5.

Removing these means reordering the layers. Other roadmaps cite these labels at their heads: B3.0, B3.2, B3.3, B3.4, B3.8–9, B4.1–2, B4.7, B5, B6 and B2.4, in FourManifolds, HomotopySpheres, GeometricTopology, StringOrientation, StableHomotopyKTheory and PositiveScalarCurvature. That reordering is a decision for the author, not something to do inside a review repair.

**Unlisted suppliers:** the parts of R15 visible here are covered by the new rows: DGFloer, RiemannianGeometry, ClassifyingSpaces and SpinRepresentations, all already cited in prose. DifferentialGeometry and SmoothBundlesConnections come later in the merge order, so their inputs are owned in B1.6 (H03) and they are not listed. The "stale pins and merge order" parts of R15 were not in the readable text.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Atlas ⇔ orientation (B1.1) | [0,1] in `𝓡∂ 1`; the square [0,1]² in the quadrant model; D² in `𝓡∂ 2` | [0,1]: a chart at 0 has derivative >0 and a chart at 1 has derivative <0, so some transition has negative derivative. At corner (1,0) of the square: (1−x,y) has det −1 and the swap (y,1−x) has det +1. D²: reflecting the tangential coordinate makes det >0 | false only in model dimension 1 with boundary | restricted (H01) |
| Degree-0 count (B2.4) | W=[0,1]; W=S¹; W=∅; ∂W with O coefficients | ∂[0,1]=[1]−[0] gives signed count 0; ∂S¹=∅ gives 0; mod 2: 2 points give 0 | invariant | moved (H19) |
| B3.2(b),(c) torus | Lie-framed T² | q(a)=q(b)=1, q(a+b)=1+1+1=1, Arf=1; q-zero count 1=2^(2·1−1)−2^0 | agrees with (a)'s count formula | split (H06) |
| α(M)=−(σ/16)a (B3.4) | K3 (σ=−16), −K3, S⁴ | K3: α_ℍ=1, α=a; −K3: α=−a; S⁴: σ=0, α=0. Â check: 2k=−σ/8 gives k=1 on K3 | agrees with the K3 computation already in B3.4 | consume I7.5 (H08) |
| PU3⋊C2 faithful (B6.5) | the elements (A,id) and (A,conj) in the kernel of Ad | (A,id): Ad(A)=1 forces A central, so trivial in PU3. (A,conj): this would make conjugation inner, preserving the diagonal Cartan and acting there by −1 ∉ S₃ | faithful | added (H09) |
| Conjugation preserves orientation on CP2 | CP¹ and CP² | degree (−1)^n: −1 on CP¹, +1 on CP² | preserving on CP2 | added |
| Scal(HP2) > 0 (B6.6) | K∈[1,4], dim 8 | Scal ≥ 8·7·1 = 56; exact value 16·2·4 = 128 = 8·(4·2+8) | positive | added (H10) |
| U normal diagram (B5.4c) | ranks 2r→2r+1→2r+2 | real(γ_r)⊕ε = ξ_(2r)⊕ε; real(γ_r⊕ε_ℂ) = real(γ_r)⊕ε² = ξ_(2r+1)⊕ε | stabilization isomorphisms exist | added (H11) |
| Adams convergence (B4.2, B4.7) | HZ; S; M(Z/2^∞) | HZ: E∞ gives Z_2 = Z⊗Z_2. S: π_n finite. M(Z/2^∞): H_0(;F2)=0, H_1=F2; classical completion of π₀ is 0, derived completion has π₁=Z_2 | the tensor form needs finitely generated π_n | corrected (H15) |
| p(T HP^k) (B3.9) | k=1,2,3 | 1; 1+2u+7u² with signature 1; 1+4u+12u²+8u³ with L₃=0 (H¹²(HP³)=0 in middle degree 6) | consistent | generalized (H23) |
| H₆(B(ℤ/m)) (B6.3) | m=2, m=3 | ℤ --0--> ℤ --m--> ℤ: ker(m)=0 | 0 | citation (H25) |
| Signature bordism invariance (B6.1) | ∂(D⁵)=S⁴; ∂(CP²×I) = CP² ⊔ −CP² | σ(S⁴)=0; σ(CP²)+σ(−CP²)=1−1=0 | consistent | consume I7.2 (H24) |
| Stable framed PT (B5.5) | n=0, n=1 | Ω^fr_0=ℤ ↔ π₀S=ℤ by signed count; Lie-framed S¹ ↦ η, with 2η=0 in π₁S=ℤ/2 | agrees with item 4 at B=pt | owner named (H14) |
| Parametric transversality (B1.6) | F:M×ℝ^N→ℝ^N, F(x,s)=e(x)+s, Z={0} | F is a submersion, so it is transverse to Z; Sard gives regular values s, so e+s is transverse to 0 for almost every s | holds | added (H03) |
| Chart signs vs `orientationPreservingGroupoid` (B1.6) | n=0, negative point; [0,1] in `𝓡∂ 1`; S¹ with two charts | n=0: every transition preserves orientation, but the negative point has chart sign −1, so the claim is stated only for n≥1 and σ is kept separately. [0,1]: chart signs +1 at 0 and −1 at 1 for half-line charts, so no all-positive atlas exists. S¹: the angle charts have transition derivative +1, all signs +1 | holds for n≥1 | restricted to n≥1 |
| Face-indexed corners (B1.6) | square [0,1]²; teardrop | square: corner (0,0) has depth 2 and lies on 2 global faces {x=0} and {y=0}, so it is a manifold with faces. Teardrop: the depth-1 set is one connected arc whose closure contains the depth-2 point, which therefore lies on 1 face, not 2 | depth is chart-independent; the teardrop is not a manifold with faces | Check added in the text |
| Manifold Sard (B1.6) | f:[0,1]→ℝ, f(t)=t²; f:S¹→ℝ, height | t²: the only critical point is t=0, value 0. The boundary values 0 and 1 are images of the compact pieces, not critical values in the interior sense; the regular values ℝ∖{0} are dense. Height: critical values ±1; the complement is open and dense. A countable union of non-closed null sets would not do, hence the compact pieces | dense | compact-piece argument |
| Free proper quotient (B1.6) | ℤ/2 acting antipodally on S² (free); ℤ/2 acting on S² by rotation (not free) | antipodal: RP² is a manifold and S²→RP² is a 2-sheeted covering. Rotation: the two fixed poles are where freeness fails; the quotient is a sphere but the orbit map is not a covering (branch points) | the freeness hypothesis is needed | hypothesis kept |
| Simplicial CW structure (B1.6) | one 2-simplex; the boundary of a 2-simplex | 2-simplex: 3+3+1=7 cells, χ=3−3+1=1. Boundary: 6 cells, χ=0=χ(S¹) | the cell count matches the simplices | added |
| Neat embeddings (B1.6) | M=[0,1] into the half-plane R×[0,∞) | t↦(cos πt, sin πt): the endpoints go to (1,0) and (−1,0) on the boundary line, interior points have second coordinate sin πt>0, and the derivative at the ends is (0,±π), orthogonal to the boundary | meets the boundary exactly in ∂M, orthogonally | added (H03) |

## Build and gate

- `lake build TauCetiRoadmap.TangentialBordism.Suggested`: **Build completed successfully (8980 jobs)**, with one warning, `declaration uses sorry` at Suggested.lean:72. `Suggested.lean` is unchanged in this round; the build was run on the edited worktree. The later README-only edits do not affect it.
- **Gate summary line:** `gate TangentialBordism: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (at `67b1819e`).
  - The earlier `depcheck=3` items were `UPWARD: TangentialBordism (#214) -> DifferentialGeometry (#221)`, `-> GeometricTopology (#218)` and `-> SmoothBundlesConnections (#220)`, at README lines 30, 31 and 42.
  - They are fixed by owning the cited inputs in B1.6 (H03), not by moving the roadmap.
  - In the README, "GT" now appears only as a consumer, at lines 1574 and 1577.
  - `residue=1` (the HTML anchor `<a id="b3-oriented-three-parallelization">` added in `2a39277`) is fixed: no roadmap links to that anchor.
- **Depcheck (`--order … --movable`) after the edits:**

```
depcheck: 162 roadmaps, 1171 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line, with or without `--movable`.

- **Citations:** `roadmaps resolve` on the new README reports no cross-roadmap citation and no Lean name found nowhere.

## Notes

- **Moved down.** Notions moved into this roadmap: neat embeddings, relative/parametric transversality, corner rounding, compact neighbourhoods and doubles (B1.6, from the GeometricTopology pull-request edition); collars, gluing, handles, tubular neighbourhoods, the simplicial CW structure and Whitehead triangulation (B1.6, from GeometricTopology Layers 1 and 11 and smoothing item 1); the orientation chart-sign carrier, face-indexed corners and manifold Sard (B1.6, from DifferentialGeometry 2.1, 5.5 and 10.2; the 8.3 simplex smoothing is subsumed by B1.6's relative Whitney approximation); free proper quotients as principal bundles (B1.6, from SmoothBundlesConnections B1.4). These three roadmaps come later in the merge order. Ownership against open work for the new B1.6 bullets was checked by `roadmaps grep` for free proper quotients; no earlier owner was found; the PU3⋊C2 group and action (B6.5, from PositiveScalarCurvature); the principal-bundle smoothing theorem (B6.4, unowned before); transgression, Kudo and Borel (B4.2, unowned before).
- **Ceded.** Hopf invariant one and sphere parallelizability go to HomotopySpheres §3C.5. The sphere stable trivialization, RP tangent classes and the immersion obstruction go to CharacteristicClasses C7.3/C7.3a.
- **Ownership against open work.** This was checked by object for every point above. The roadmaps checked were HomotopySpheres, IndexTheory, GeometricTopology and FourManifolds (open pull requests, at their checked-out heads), SmoothBundlesConnections (searched, not cited for smoothing), and PositiveScalarCurvature, BordismFormalGroups, CharacteristicClasses, GeneralizedCohomology, DifferentialGeometry, RiemannianGeometry, ClassifyingSpaces and DGFloer on main.
- **Not repaired: FourManifolds mutual dependency.** FourManifolds supplies the early K3 and E(1)-complement examples (supplier row, line 39) and in turn consumes TB B3/B4. That is a roadmap-level mutual dependency, ordered item by item inside each README, which the review did not raise. It was not changed.
- **Signatures.** `Suggested.lean` declarations are unchanged. The separate `#check` comparison was not run, because this brief allows only the two commands it names. The successful build elaborates every declaration with the same binders as in the previous round.
- **Sources.** No source was fetched. The new locators are chapter-level textbook citations for standard facts, given from the books' known contents and not opened in this job, so they should be treated as uncertified:
  - Lee, *Introduction to Smooth Manifolds*, 2nd ed., Chapters 6, 9 and 21;
  - Hirsch, *Differential Topology*, Chapter 4;
  - Munkres, *Elementary Differential Topology*, §10.

  The other new locators are pinned Mathlib and Tau Ceti declarations, checked at their files and lines above.
- **Untrusted text.** The review contains no instruction to run commands or act outside the job.
