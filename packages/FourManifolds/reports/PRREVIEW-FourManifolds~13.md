# Review of FourManifolds (pull request #936 at 4cc477c)
**Verdict:** needs changes

## R01 (P1) — The ASD Hessian is smaller by a factor of two

**Location:** `TauCetiRoadmap/FourManifolds/README.md:2288`, also 2300: “second variation … a↦2‖d_A⁺a‖²”.
**Claim:** This contradicts the energy normalization at lines 2340–2342. The second derivative is 4‖d_A⁺a‖².
**Witness:** On the unit flat four-torus, take A=0 and a=T sin(2πx₁)dx₂, −tr(T²)=1. Then d*a=0, ‖d⁺a‖²=π² and E(ta)=2π²t²: E″(0)=4π², not 2π².
**Repair:** Replace both coefficients 2 by 4. Add this nonzero Coulomb-slice variation as a Check; it gives 4‖d⁺a‖²=4π².

## R02 (P1) — The Seifert antisymmetrization reverses the supplier’s sign

**Location:** `TauCetiRoadmap/FourManifolds/README.md:345`: “V(a,b)=lk(a,b⁺) … with V−Vᵀ the intersection form of F”.
**Claim:** With the imported positive push-off and ordered intersection convention, the intersection matrix is Vᵀ−V.
**Witness:** Main `TauCetiRoadmap/GeometricTopology/README.md:2396` fixes this identity. Its trefoil V=[[-1,1],[0,-1]] gives J=[[0,-1],[1,0]]; the proposed V−Vᵀ gives −J.
**Repair:** Write “with Vᵀ−V the ordered intersection form of F”; import GeometricTopology §4.3’s convention and retain the displayed trefoil matrix as a sign Check.

## R03 (P1) — The missing TOP prerequisites are not declared supplier contracts

**Location:** `TauCetiRoadmap/FourManifolds/README.md:211`: “What GeometricTopology must provide (gap:tangent-microbundle-stable-classifier)”.
**Claim:** The route consumes genuinely missing inputs as gaps, but there is no readable plan registering them. The named base roadmap explicitly excludes this microbundle/classifier development; a slug in this README alone supplies nothing.
**Witness:** `packages/FourManifolds/design/plan.json` is unavailable; the review input declares zero gaps. Main `TauCetiRoadmap/GeometricTopology/README.md:197` assigns topological microbundles and TOP/PL to Part II.
**Repair:** After removing already supplied gaps, assign every remaining prerequisite to a target here or an eligible earlier supplier. Register each actual gap, with matching slug, supplier, section and precise needs in the plan and README; split compound contracts.

## R04 (P2) — The knot and proper-link Arf theory already has an owner

**Location:** `TauCetiRoadmap/FourManifolds/README.md:31`: “the Arf invariant of a knot or proper link and its vanishing on smoothly slice knots are targets of §1.4”.
**Claim:** §1.4 and §3.6 repeat GeometricTopology’s Arf construction, independence, proper-link dictionary and smooth/TOP slice vanishing.
**Witness:** Main `TauCetiRoadmap/GeometricTopology/README.md:2466` owns the proper-link refinement; line 6441 proves Arf(K)=0 for smooth and TOP slice knots. The trefoil gives Arf=1 in both plans.
**Repair:** Import GeometricTopology §4.3.1 and §6.2.1 for these results, delete the repeated targets, and retain only the four-manifold characteristic-surface and normal-filling comparisons here.

## R05 (P2) — Replace obsolete gap requests by existing supplier sections

**Location:** `TauCetiRoadmap/FourManifolds/README.md:28`: “are stated by no GeometricTopology layer; each is declared as a gap”.
**Claim:** This inventory is stale: Brown Schoenflies, linking, Seifert S-equivalence, the Alexander/Crowell comparison, finite Arf algebra and three-dimensional smoothing are already owned on main.
**Witness:** Main `TauCetiRoadmap/GeometricTopology/README.md:2755` constructs the deck-equivariant Crowell comparison; line 2769 states Δ=1 iff the module vanishes iff the commutator is perfect. Thus gap:alexander-module-presentation requests existing work.
**Repair:** Replace these six gaps by GeometricTopology §§2.2, 4.3, 4.4, 4.3.1 and 11.2 as appropriate, updating every use and the scope paragraph. Replace the line 383 claim about TangentialBordism’s gap by its actual §1.1/§4.3.1 import.

## R06 (P2) — Import the torus mapping-class theorem

**Location:** `TauCetiRoadmap/FourManifolds/README.md:2879`: “Own the torus mapping-class comparison with SL₂(ℤ)”.
**Claim:** The general comparison and the disk/curve isotopy inputs are already GeometricTopology targets.
**Witness:** Main `TauCetiRoadmap/GeometricTopology/README.md:1244` states Mod⁺(T²)≅SL₂(ℤ); line 1270 gives the same column-action twist matrices A and B.
**Repair:** Replace the ownership sentence by “Consume GeometricTopology §1.7.2’s torus mapping-class comparison and twist conventions.” Keep the elliptic monodromy, factorization and total-space comparisons here.

## R07 (P2) — Import the projective cup-ring calculation

**Location:** `TauCetiRoadmap/FourManifolds/README.md:418`: “construct … H₀/H₂/H₄ generators, cup ring ℤ[h]/(h³)”.
**Claim:** The projective cup ring and transported cellular generators are already supplied in arbitrary dimension.
**Witness:** Main `TauCetiRoadmap/ComplexKahlerGeometry/README.md:2899` owns H*(CPⁿ;ℤ)=ℤ[u]/(uⁿ⁺¹), normalized on CP¹. At n=2 both targets give u²[CP²]=1 and u³=0.
**Repair:** Consume ComplexKahlerGeometry K7.2 (§7.3) and its pinned cellular comparisons. Keep the geometric line/point, intersection-form and Hopf-attachment comparisons as this section’s targets.

## R08 (P2) — Removing a supplier name did not transfer its existing constructions

**Location:** `TauCetiRoadmap/FourManifolds/README.md:67`: “This roadmap owns the four-dimensional E₈ plumbing”; line 71 also claims the Hopf invariant and Whitehead products.
**Claim:** The existing main roadmap still owns these objects. The dropped-name repair has created a second plan of them, without an ownership transfer.
**Witness:** Main `TauCetiRoadmap/HomotopySpheres/README.md:2329` constructs the same E₈ plumbing for every k≥1, including k=1; line 1368 defines the Hopf invariant for every d≥2. Open revision #284 retains these subjects.
**Repair:** Arrange an explicit transfer of the shared constructions to an allowed earlier owner and consume that owner here; keep only four-dimensional capping and attaching-coordinate comparisons. Do not restore a forbidden supplier citation or silently duplicate the main targets.

## R09 (P2) — The surgery theorem is restricted to the two applications

**Location:** `TauCetiRoadmap/FourManifolds/README.md:1689`: “surgery exact sequence in dimension 4 for targets with π₁=1 or ℤ”.
**Claim:** The source proves the general good-group theorem, and §3.2 already develops good groups. Limiting the surgery library to 1 and ℤ is a route-specific restriction.
**Witness:** freedmanquinn line 7469, Theorem 11.5, p. 213, allows every good π₁ and orientation character. For M=S¹×RP³, π₁=ℤ×C₂ is good; the identity has zero kernel and obstruction.
**Repair:** State the relative sequence for four-dimensional Poincaré pairs with good fundamental group and orientation character, with h decoration (and the finite-complex s variant), boundary marking and L₅ action. Retain π₁=1,ℤ as applications.

## R10 (P2) — State the presentation-realization headline at the pins

**Location:** `TauCetiRoadmap/FourManifolds/Suggested.lean:44`: “the oriented manifold structure … [is] not supplied”.
**Claim:** The headline in README §8.1 is statable. Its conclusion needs an orientation, not the boundary-orientation machinery used in its proof.
**Witness:** `TauCeti/Geometry/Manifold/Orientation/Basic.lean:32` defines `TauCeti.Manifold.Orientation`. The following unrestricted finite-presentation signature elaborated at the pins with only its sorry warning.
**Repair:** Add the used Orientation.Basic import, register the theorem name in §8.1, and replace the missing-carrier claim by this headline:

```lean
theorem presentation_realization (n : ℕ) (hn : 4 ≤ n) (g r : ℕ)
    (rels : Fin r → FreeGroup (Fin g)) :
    ∃ (M : Type) (_ : TopologicalSpace M)
      (_ : ChartedSpace (EuclideanSpace ℝ (Fin n)) M),
      IsManifold 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) ∞ M ∧
      CompactSpace M ∧ T2Space M ∧ SecondCountableTopology M ∧ ConnectedSpace M ∧
      Nonempty (TauCeti.Manifold.Orientation 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) M (Fin n)) ∧
      ∃ x : M, Nonempty (FundamentalGroup M x ≃* PresentedGroup (Set.range rels)) := by
  sorry
```

## R11 (P2) — Specify concordance in the smoothing classification

**Location:** `TauCetiRoadmap/FourManifolds/README.md:1396`: “classify their smoothings by the chosen stable tangent reductions”.
**Claim:** The equivalence relation is missing. Stable tangent reductions classify concordance classes here, not smooth structures up to diffeomorphism or isotopy.
**Witness:** freedmanquinn line 4647, Theorem 8.18, p. 134, explicitly classifies concordance classes. On ℝ⁴ the reduction class is unique, while §8.3’s exotic structure is not diffeomorphic to the standard one.
**Repair:** Write “For a connected noncompact four-manifold with fixed boundary smoothing, concordance classes of smoothings correspond to homotopy classes of stable tangent reductions, a torsor for H³(M,∂M;ℤ/2).” Add the standard/exotic ℝ⁴ distinction as a Check.

## R12 (P2) — Import the pinned finiteness of definite-lattice isometries

**Location:** `TauCetiRoadmap/FourManifolds/README.md:3140`: “Thus the set of integral isometries is finite”.
**Claim:** This finiteness theorem, including the negative-definite version, is already proved at the pin. The explicit trace bound is a distinct retained comparison.
**Witness:** `TauCeti/LinearAlgebra/IntegralLattice/PosDef/Finite.lean:147` proves `IsPosDef.finite_isometry`; line 152 proves `IsNegDef.finite_isometry`. Neither requires unimodularity. For Q=Q′=[2], both give the finite set {+1,−1}.
**Repair:** Cite these fully qualified declarations in the supplier contracts and consume finiteness in §8.2. Keep only the explicit matrix trace-bound and manifold-classification comparisons as new targets.

## R13 (P3) — The classification citations point to the cyclic-group theorem

**Location:** `TauCetiRoadmap/FourManifolds/README.md:1907`, also 1934: “Theorem 10.10 … printed p. 184”.
**Claim:** These paragraphs concern simply connected manifolds; the cited theorem concerns fundamental group ℤ and forms over ℤ[ℤ].
**Witness:** freedmanquinn line 6416 states Theorem 10.10 with π₁=ℤ. The simply connected existence and uniqueness theorem is at freedmanquinn line 5931, §10.1, p. 172.
**Repair:** Replace both locators by “Freedman–Quinn, §10.1, Classification Theorem, existence/uniqueness respectively, printed p. 172” and the corresponding source lines 5931/5935.

## R14 (P3) — Supply locators for the unreferenced geometric targets

**Location:** `TauCetiRoadmap/FourManifolds/README.md:2952`: “Prove π₁=0, χ=12n, σ=−8n, b₂=12n−2 … Prove the genus-one positive-factorization classification”.
**Claim:** §7.2 and §7.3 have no theorem/section/page citations. The same omission affects the sampled §§1.1, 1.3, 1.5, 1.6 and 2.2, and §6.1’s discriminant theorem.
**Witness:** The complete §7.2 block, lines 2950–3029, contains the elliptic classification and quartic comparison but no source locator; its Needs line lists prerequisite roadmaps only.
**Repair:** Attach exact legal-source locators to each retained theorem in these sections, including the positive-factorization classification, E(2)–quartic comparison and Enriques quotient invariants; identify which explicit-polynomial arguments are proved directly. Do the same for the uncited Spinᶜ and Yang–Mills targets.

## R15 (P3) — The fundamental class is already pinned

**Location:** `TauCetiRoadmap/FourManifolds/Suggested.lean:22`: “the missing inputs are the manifold fundamental class and its intersection pairing”.
**Claim:** The fundamental-class part of this inventory is false at the specified Tau Ceti pin.
**Witness:** `TauCeti/AlgebraicTopology/Singular/LocalHomology/FundamentalClass.lean:204` defines `TauCeti.HomologicalOrientation.fundamentalClass`; line 210 proves its local-orientation restriction. It does not itself construct the intersection form or Kirby–Siebenmann invariant.
**Repair:** Cite that declaration in the supplier contracts and remove the fundamental class from the missing-carrier list. Describe the remaining manifold pairing and Kirby–Siebenmann construction separately.

## R16 (P3) — The framing footnote does not state the stable-stem relation

**Location:** `TauCetiRoadmap/FourManifolds/README.md:2936`: “η³=12ν in π₃ˢ≅ℤ/24 (Kirby–Melvin, §2(c), p. 99, footnote 3)”.
**Claim:** This locator supports the filling/framing-defect computation, not the displayed stable homotopy identity.
**Witness:** kirbymelvin line 525 computes p₁(N,φ₁)=−2χ(N) and h(φ₁)=0. Main `TauCetiRoadmap/TangentialBordism/README.md:86` assigns η³=12ν to B3.3.
**Repair:** Consume TangentialBordism B3.3 for η³=12ν and include it in this target’s Needs line. Move the Kirby–Melvin locator to the Lie Spin filling/signature comparison it actually supports.

## R17 (P3) — Correct the Tancer title

**Location:** `TauCetiRoadmap/FourManifolds/README.md:3281`: “Tancer, Recognition of the sphere and other 4-manifolds is undecidable”.
**Claim:** This is not the title of the linked paper and suggests a sphere-recognition result it explicitly leaves open.
**Witness:** tancer line 5 titles arXiv:2310.07421v2 “Simpler algorithmically unrecognizable 4-manifolds”; lines 73–78 establish the #9(S²×S²) result.
**Repair:** Use “Martin Tancer, Simpler algorithmically unrecognizable 4-manifolds, arXiv:2310.07421v2.” Keep the existing explicit exclusion of sphere recognition.

## R18 (P3) — Correct the Bastl paper’s authors and title

**Location:** `TauCetiRoadmap/FourManifolds/README.md:3282`: “Bastl, Kasprowski, Powell and Ray, Simply connected topological 4-manifolds and the isometries of their intersection forms”.
**Claim:** Neither the title nor this author list identifies arXiv:2411.08775v2.
**Witness:** bastl2024 lines 5–12 identify Algorithms in 4-manifold topology, by Stefan Bastl and thirty coauthors; Kasprowski and Ray are not on that author list.
**Repair:** Use “Stefan Bastl et al., Algorithms in 4-manifold topology, arXiv:2411.08775v2.” The §5/§6 locators remain attached to this work.

## R19 (P3) — Update the summary block’s plumbing ownership

**Location:** Pull-request description, `roadmap-summary` block: “Lattices, plumbing and surgery groups come from existing roadmaps”.
**Claim:** The head instead claims the geometric four-dimensional plumbing as its own target, and the description’s later ownership paragraph says so.
**Witness:** `TauCetiRoadmap/FourManifolds/README.md:67` claims ownership; line 660 explicitly constructs the eight disk bundles and their plumbing. Only the lattice is imported there.
**Repair:** Make the summary match the resolved ownership from R08. For the present head, the accurate sentence is “Lattices and simply connected surgery groups are imported; §1.6 constructs the four-dimensional E₈ plumbing and compares its lattice.”

## R20 (P3) — Remove the duplicated article

**Location:** `TauCetiRoadmap/FourManifolds/README.md:1392`: “Consume the earlier the unstable smoothing comparison”.
**Claim:** The sentence contains a duplicated article.
**Witness:** The adjacent lines read “Consume the earlier” followed by “the unstable smoothing comparison”.
**Repair:** Write “Consume the earlier unstable smoothing comparison for noncompact TOP four-manifolds”.

## Verified sound

| Previous finding | Head passage or computation | Status |
|---|---|---|
| r12 R01 | §4.3 now says “rank 3”, “rank 4”, “by 2” and “with 2-torsion”. | Repaired. |
| r12 R02 | References now include “Dold–Whitney, Classification of oriented sphere bundles over a 4-complex”. | Repaired; the legal text was also read this round. |
| r12 R03 | §4.3 Needs names “TopologicalKTheory T1.5” and “CharacteristicClasses C1.1b, C1.6 and C3.6”. | Repaired. |
| r12 R04 | “action translates by 2σ_w(x)=0”; the RP⁴ and RP²×RP² Checks distinguish the unstable action. | Repaired. |
| r12 R05 | §3.5 now says “using this section’s normal-bundle theorem”. | Repaired; R20 is a different sentence. |
| r12 R06 | The exotic-space signature binds “(_ : TopologicalSpace M)” and “(_ : ChartedSpace … M)”. | Repaired; elaborated. |
| r12 R07 | Zero dropped-name hits; the head now says “This roadmap owns the four-dimensional E₈ plumbing”. | Gate repaired; substantive ownership remains unresolved, R08. |
| r12 R08 | Description: “This pull request adds the roadmap FourManifolds”; eight layers, six theorems and six definitions. | Repaired; 3 files, 3480 insertions, no outside-folder diff. |
| r12 R09 | Description: “F5 owns the four-dimensional Yang–Mills variational calculus”; “consumes … B1–B5”. | Repaired. |
| r12 R10 | Description: “fifteen gaps, one slug each”; README has 15 distinct slugs. | Description repaired; supplier inventory has independently drifted, R03/R05. |
| r12 R11 | Description: “as HeegaardFloer states it on main”. | Repaired; F0 is present on main. |

| Statement | Instances tried | Computed left side | Computed right side | Result; change |
|---|---|---|---|---|
| Integral intersection form, torsion quotient | S⁴; −CP²; Enriques torsion t | ranks 0,1,10; t pairs to 0 in ℤ | determinants 1,−1,−1; signatures 0,−1,−8 | Torsion cannot be discarded before w₂. |
| §1.1 Projective/product generators (sample) | CP²; S²×S²; S⁴ | h²[CP²]=1; a²=b²=0, ab=1; H₂(S⁴)=0 | ℤ[h]/h³; H=[[0,1],[1,0]]; empty matrix | Mathematical tests agree; R07/R14. |
| §1.2 Nontrivial sphere bundle | S²=−1, F²=0, S·F=1 | (S+F)²=1; (S+F)·S=0 | diag(1,−1), determinant −1 | Zero clutching instead gives even H. |
| §1.3 Connected sums (sample) | CP²#(−CP²); CP²#CP²; empty sum | χ=3+3−2=4; signatures 0,2; χ(empty model)=2 | diag(1,−1); diag(1,1); S⁴ | Signatures distinguish the two sums; R14 locator. |
| §1.4 Handle matrix and slide | Q=diag(0,1), P=[[1,0],[1,1]] | PᵀQP=[[1,1],[1,1]], determinant 0 | New squared norms 1,1; mutual pairing 1 | Column convention agrees. |
| Seifert pairing (R02) | Trefoil V=[[-1,1],[0,-1]] | V−Vᵀ=[[0,1],[−1,0]] | Supplier J=Vᵀ−V=[[0,−1],[1,0]] | Opposite signs; reverse antisymmetrization. |
| Finite Arf algebra (R04/R05) | Zero space; xy; x²+xy+y² over F₂ | Gauss sums 1,2,−2; Arf 0,0,1 | (−1)^Arf·2^m=1,2,−2 | Already GeometricTopology §4.3.1. |
| Knot and proper-link refinements | Trefoil; positive Hopf annulus | Trefoil q(1,0)=q(0,1)=q(1,1)=1; Hopf q(core)=1 | Arf(trefoil)=1; Hopf radical not q-zero | Improper Hopf link has no proper-link Arf. |
| Slice vanishing and Alexander criterion | Unknot; trefoil | Δ=1, t−1+t⁻¹; commutator abelianization 0, nonzero | Arf=0,1; slice obstruction vanishes only for first | Import existing knot results, R04/R05. |
| §1.5 Boundary kernel/cokernel (sample) | Q=[0],[2],[1] | kernels ℤ,0,0; cokernels ℤ,ℤ/2,0 | boundary H₂=ℤ,0,0; H₁=ℤ,ℤ/2,0 | Determinant rule only in nonsingular cases; R14 locator. |
| §1.6 Matrix realization (sample) | Empty matrix; [[1,1],[1,2]] | determinants 1,1 | Empty link; framings 1,2 and linking 1 | Boundary homology does not recognize S³. |
| §1.6 E₈ plumbing (R08) | Negative pinned tree; reversed orientation | rank 8; determinants 1,1; signatures −8,+8 | entries (2,7)=+1,−1; diagonal −2,+2 | Same k=1 construction already on main. |
| §2.1 Punctured spine/mapping cone | S⁴; CP² | punctured spines point, S² | cone attachments 0, η; H₂ ranks 0,1 | No triangulation of an arbitrary TOP manifold used. |
| §2.2 Wedge π₃ (sample, R08) | r=0,1,2 | numbers of generators 0,1,3 | r+r(r−1)/2=0,1,3 | Hopf input ownership and locators need repair. |
| §2.2 Attaching matrix | Q=[[1,1],[1,2]] | C=[[2,−1],[−1,1]]; QC=I | 2η₁+η₂−[ι₁,ι₂] | Using Q itself gives the wrong coordinates. |
| §2.3 Framed-link collapse | +1-framed unknot; positively linked two components | Hopf coordinate 1; mixed coefficient 1 | H(η)=1; product attachment [ι₁,ι₂] | Framing and mutual linking remain distinct coordinates. |
| §2.4 Isotropic splitting (sample) | H; diag(1,−1); diag(1,−2) | norms of (1,0),(1,1): 0,0; x²−2y²=0 only at 0 | first two split; third determinant −2 violates unimodularity | Hypothesis discriminates; book locator unreadable. |
| Homotopy classification headline | CP² and −CP² | oriented forms +1,−1; no integral isometry | unoriented comparison allows −Q and has identity underlying map | Both directions retain orientation distinction. |
| §3.1 Disk/local TOP headlines (sample) | Empty disk family; standard framed disk with dual | μ=0; λ(f,g)=1; dual self-intersection 0 | Disjoint embedded disk and one geometric dual intersection | PRT Theorem A retains duals; no empty-family obstruction. |
| §3.2 Immersion convention | One positive double point, e=0; cyclic label t | μ=1; sym(μ)=2; sym(t)=t+t⁻¹ | λ(f,f)=2; same after t↔t⁻¹ | Removing identity coefficient fails the first test. |
| §3.2 Good groups | 1; C₂; ℤ; S₃ | growth bounded by 1,2,2n+1,6 | subexponential in all four cases | Nonabelian finite example included. |
| §3.2 Decomposition carrier | Singleton decomposition; collapse compact interval in ℝ | diameters 0; nontrivial fiber [−1,1] compact | Quotients ℝ,ℝ; quotient maps proper | Collapsing all ℝ has noncompact fiber and fails properness. |
| §3.2 Tower/grope controls | Trivial labels; inverse labels g,g⁻¹ | contraction labels 1; gg⁻¹=1 | π₁-null contraction; geometric dual count 1 retained | Group contraction does not supply framing by itself. |
| §3.3 Controlled disks (sample) | Track diameter 1/4; ε=1/2 or 1/8 | 1/4<1/2 true; 1/4<1/8 false | First controlled, second not controlled | Control predicate distinguishes the two tolerances. |
| §3.3 Relative extension condition | S¹→point; identity boundary loop for D²→S¹ | winding number 1 | No disk extension, despite trivial target fundamental group | Relative extension condition cannot be replaced by target goodness. |
| §3.4 Radial control | Identity radial coordinate; step ratio 1/64 | 3/64=0.046875 | (63/64)²/20≈0.04845 | Strict inequality has positive margin. |
| §3.4 Controlled obstruction coefficients | Local groups 1,ℤ | Wh=0; K̃₀=0; K₋ᵢ=0 | q₁ with these coefficient groups is 0 | Vanishing uses K-theory inputs, not goodness alone. |
| §3.4 Product/cobordism headline | Product M×I, identity marking | Whitehead torsion 0; tracks constant | Product comparison fixes both marked ends | No arbitrary unmarked identification substituted. |
| §3.5 Stable smoothing | E₈ TOP model; two copies | KS=1; KS=1+1=0 | First obstructed; second admits stable smoothing | KS=0 does not assert unstabilized smoothability. |
| §3.5 Smoothing classification (R11) | Standard and exotic ℝ⁴ | H³(ℝ⁴;F₂)=0; one stable reduction class | One concordance class; at least two diffeomorphism classes | Specify concordance. |
| §3.5 Normal bundles | Exceptional sphere; product sphere | normal Euler numbers −1,0 | self-intersections −1,0 | Trivializing the exceptional normal bundle fails. |
| §3.5 Stable pseudo-isotopy | Identity pseudo-isotopy; zero stabilization | induced tangent homotopy constant | Identity isotopy, k=0 | General theorem retains possible positive stabilization. |
| §3.6 Normal-map data (sample) | id(S⁴); degree-two S⁴ map; trivial candidate over CP² | degrees 1,2,1; w₂(ν_CP²)=h | invariant 0; degree condition fails; normal comparison fails | Degree alone does not determine a normal map. |
| §3.6 Low normal invariants | S²; S⁴ | H²(S²;F₂)=F₂; H⁴(S⁴;ℤ)=ℤ | degree-two coordinate F₂; E₈ signature defect 8 gives coordinate 1 | Normalization agrees with σ/8. |
| §3.6 Pinch action | CP² generator; isotropic generator of S²×S² | 1+⟨w₂,α⟩=0,1 in F₂ | normal-invariant changes 0,PD(α) | Coefficient cannot be dropped. |
| §3.6 Surgery exact sequence headline (R09) | Identity on S¹×RP³ | π₁=ℤ×C₂; kernel 0 | L₄ obstruction 0; good-group theorem applies | Present restricted target omits this case. |
| §3.6 Surgery-group normalization | Positive E₈; circle splitting | σ/8=8/8=1; L₅(ℤ)=0 | L₄(ℤ)=ℤ; L₅(ℤ[ℤ])=ℤ | Cyclic L₅ action is not zero. |
| Annulus headline, Lean | Concentric radii 2 and 1 in ℝ⁴ | radial interpolation 2−t, 0≤t≤1 | shell 1≤‖x‖≤2, correct two ends | Pinned statement does not prescribe parametrizations. |
| Freedman slice headline, Lean | Unknot | group ℤ; commutator 1 is perfect; Δ=1 | Standard disk, locally flat; complement group ℤ | Hypothesis and conclusion inhabited. |
| §3.7 Realization headline | Zero form; +E₈; odd rank-one form | rank 0,8,1; σ/8 for E₈=1 | KS=0; KS=1; KS can be 0 or 1 | Correct invariants; wrong source locator R13. |
| §3.8 Homeomorphism classification headline | Odd-form pair with different KS | Same [1], KS 0 versus 1 | No homeomorphism despite same form | KS is necessary; R13 locator. |
| §3.9 Definite/rank-zero consequences | S⁴; 2(−E₈) | rank 0,16; KS=0,0; signatures 0,−16 | S⁴ allowed; definite even rank 16 excluded smoothly by Donaldson | Rokhlin alone does not exclude second form. |
| §4.1 Spinᶜ group/lifts headline | CP²; S²×S² | determinant 3h→5h under twist h; 0→2a | changes 2h,2a; β(w₂)=0 | Multiplication by two is retained. |
| §4.1 Torsion determinant | Enriques class t of order two | t≠0, 2t=0, w₂=t mod 2≠0 | Twisting changes lift but not determinant | Determinants do not injectively classify lifts. |
| §4.2 Wu and Spin | CP²; S²×S²; Enriques | free forms odd,even,even | w₂ nonzero,0,nonzero | Even free form alone does not imply Spin. |
| §4.2 Characteristic-surface headline | CP² line; empty surface in E₈ | (1−1)/8+0=0; 8/8+0=1 | KS 0,1 | Divisibility and signs agree. |
| Rokhlin/boundary headline | K3; E(1) fiber complement | σ=−16,−8 | 16 divides −16; boundary residue −8≡8 mod 16 | Smooth closed and boundary statements differ. |
| §4.3 Pontryagin square headline | CP² h; S²×S² a+b | h²=1; (a+b)²=2ab | P(h)=1; P(a+b)=2 mod 4 | Detects coefficient inclusion 1↦2. |
| §4.3 Rank-four bundle classification | TS⁴, half-spin coordinates −u,u | p₁=−2(−u+u)=0 | e=u−(−u)=2u | Sum and difference distinguished. |
| §4.3 Rank-three fiber action | RP⁴, w₂=0 | σ₀(a)=β(a)² generates H⁴=ℤ/2 | Two lift coordinates become one rank-three class | Previous missing Check repaired. |
| §4.3 Stable fiber action | RP⁴, trivial bundle versus 4L | 2σ₀(a)=0; w₄=0,a⁴ | Two stable classes remain distinct | Applying rank-three action would wrongly identify them. |
| §4.3 Torsion separation | RP²×RP², a,b integral degree two | a²=b²=0, ab≠0; σ₀=0 | Lift classes 0,ab distinct; −4ab=0 gives equal p₁ | p₁,w₂ alone do not classify. |
| §5 Yang–Mills Hessian (R01) | Unit flat torus, a=T sin(2πx₁)dx₂ | E(ta)=2π²t²; E″=4π² | Stated 2‖d⁺a‖²=2π² | False; coefficient must be 4. |
| §5 Charge and energy | ASD charge 1; charge −1 | E=8π²; hypothetical E=−8π² | First positive; second violates E≥0 | Negative ASD charges excluded, not silently assigned spaces. |
| §5.1 Deformation/flat strata (sample) | Trivial flat S⁴; trivial flat S²×S² | (h⁰,h¹,h²)=(3,0,0),(3,0,3) | h¹−h⁰−h²=−3,−6 | Stabilizer and obstruction terms both needed. |
| §5.1 Nonabelian irreducible flat stratum | Q₈ holonomy on Σ₂×Σ₂ | b₁=8, b⁺=9; (h⁰,h¹,h²)=(0,6,12) | index 6−12=−6=−3(1−8+9) | Flat irreducible does not imply unobstructed. |
| §5.2 Metric transversality | Flat connection; charge-one definite case | metric derivative of F⁺ is 0; index=8−3=5 | Flat obstruction persists; positive-charge moduli dimension 5 | Positive-charge hypothesis retained. |
| §5.3 Compactification/gluing headline | One charge-one bubble; flat obstructed base | charge balance k=(k−1)+1; energy loss 8π² | Obstruction space at flat Σ₂×Σ₂ has dimension 12 | Gluing must retain obstruction section. |
| Donaldson headline | −I₁₆; 2(−E₈) | both rank 16, σ=−16, determinant 1 | first odd, second even; only first diagonal | Statement discriminates topological and smooth definite forms. |
| §6.1 Blowups (sample) | CP² once and nine times | χ=4,12; σ=0,−8 | exceptional square −1; (3H−ΣEᵢ)²=0 | Mathematical signs agree; GS locator unreadable. |
| §6 Real projective blowup | Real blowup of a disk at its center | Möbius band χ=0, boundary count 1 | Annular replacement would have boundary count 2 | Correct real local model retained. |
| §6.1 Discriminant (sample) | x²+y²; x²; zero equation | gradients (2x,2y),(2x,0),(0,0) | no projective critical point; [0:1]; invalid coefficient point | Affine vertex and zero polynomial excluded; R14 locator. |
| §6.2 Node/monodromy (sample) | Nodal sphere, e=−2; positive and negative double point | squares −2+2=0 and −2−2=−4 | Positive monodromy sends b→b+a; reverse sends b→b−a | Signs discriminate; GS locator unreadable. |
| §6.3 Torus comparisons (R06) | A=[[1,1],[0,1]], B=[[1,0],[−1,1]] | AB=[[0,1],[−1,1]]; (AB)³=−I | (AB)⁶=I; B=SAS⁻¹ | Same conventions as main owner. |
| §6.3 Positive factorization | (AB)⁶ versus A¹² | lengths both 12 | first I; second [[1,12],[0,1]]≠I | Divisibility is necessary, not sufficient. |
| §7.1 Quartic index/filling headline | K3 and its reverse | −σ/8=2,−2; −σ/16=1,−1 | complex index twice quaternionic index | Correct multiplicity. |
| §7.1 Lie framing (R16) | Lie-framed T³; imported E(1) complement | η³=12ν, order 2; σ=−8 | KO₃ image 0; boundary Spin residue 8 | Separate stable-stem and filling locators. |
| §7.2 E(n) invariants (sample) | n=1,2,3 | (χ,σ,b₂)=(12,−8,10),(24,−16,22),(36,−24,34) | c₁=F,0,−F; parity odd,even,odd | Formula excludes n=0; R14 locators. |
| §7.2 Quartic polynomial and evaluation | Two coordinate lines; all coordinates 1 | F(a,b,0,0)=F(0,0,c,d)=0; F(1,1,1,1)=4 | Scalar law F(λv)=λ⁴F(v) | Real definitions agree with README. |
| Quartic smoothness headline, Lean | e₀; e₂; 0; all coordinates nonzero | gradients dz₂,dz₁,0; critical equations force 81=1 | ranks 1,1,0; impossible nonzero critical point | Nonzero hypothesis essential; not restricted to zero locus. |
| E(2)≅quartic K3 headline | n=2; residual pencil with section L₁ | χ=24, σ=−16, form 2(−E₈)⊕3H | (H−L₀)·L₁=1; 24 nodal fibers | Invariants agree; not a substitute for diffeomorphism proof. |
| §7.3 Quadrics/zero set (sample) | v=(i,√3,i√3,1,0,0) | squares (−1,3,−3,1,0,0); sums 0,0,0 | All equations vanish on every λv | Homogeneity makes line membership well-defined. |
| Enriques Jacobian headline, Lean | Same v; 0; e₀ | first three-column determinant −48; ranks 0,1 at latter points | rank 3 at v; latter inputs fail hypotheses | Both nonzero and equation hypotheses matter. |
| Enriques involutions, definitions | v with both sign blocks nonzero | L²v=v; quadric values unchanged | Projective action squares to identity | Involutivity alone does not imply freeness. |
| Enriques freeness headline, Lean | Fixed planes; [e₀]; displayed zero-set v | Vandermonde determinants 2,2; quadrics(e₀)=(1,1,1) | Fixed-plane zero solution only 0; v and Lv not proportional | Freeness holds only on the zero set. |
| Enriques quotient headline | Free involution of K3 | χ=24/2=12; σ=−16/2=−8 | b₂=10; H⊕(−E₈); π₁=C₂ | Even free form and nonzero w₂ coexist. |
| §8.1 Presentation realization headline (R10) | Empty presentation; one generator, no relations | groups 1,ℤ | π₁(Sⁿ)=1; π₁(S¹×Sⁿ⁻¹)=ℤ, n≥4 | Full signature elaborates on native carriers. |
| §8.1 Nonrecognition headline | Tancer’s k=9, trivial-group branch | b₂=18, σ=0, even, KS=0 | 9H, hence #9(S²×S²) | Nontrivial π₁ branch excluded; no S⁴ claim. |
| §8.2 Definite trace bound (sample, R12) | Q=Q′=[2]; rank zero | isometries ±1; ‖v‖²=1≤2·(1/2)=1 | two isometries; one empty isometry in rank zero | Bound agrees; finiteness already pinned. |
| §8.2 Characteristic sublink formula | Q=[1], x=1; positive E₈, x=0 | (1−1)/8+0=0; (8−0)/8+0=1 | KS=0,1 | Signed square and Arf contributions agree. |
| Exotic-four-space headline, Lean | Standard ℝ⁴; empty manifold; hypothetical diagonal cap | identity diffeomorphism exists; no empty homeomorphism; even 2(−E₈)≠odd −I₁₆ | First two cannot witness existential; Donaldson obstructs proposed smooth cap | Signature retains smooth structure and homeomorphism separately. |
| Pinned fundamental class (R15) | Compact connected oriented S⁴ | H₄≅ℤ; positive local restriction +1 | Fundamental class generator +1, reversed orientation −1 | Existing native construction; docstring inventory stale. |
| Remaining gap contracts (R03) | 15 README slugs versus registered plan | 15 named slugs; 0 registered contracts in review input | Six requests already on main; missing prerequisites still need owners | Registration is not supplied by mathematical citations. |
| Source and PR metadata (R17–R20) | Two arXiv title pages; summary; sentence tokens | Titles “Simpler…” and “Algorithms…”; construction owned here; articles “the … the” | Bibliography gives different titles; summary says imported; one article needed | Correct bibliographic/prose records. |

- Seeded sample: 15 targets tested; source text available for 5, Gompf–Stipsicz unavailable for 3, exact locators absent for 7; 0 explicitly marked “unverified” locators.
- Readable source evidence: 20 passages in 9 works, including powellrayteichner line 87, krushkalquinn line 60, freedmanquinn lines 3201/4647/5931/7469, feehanleness §3.1, doldwhitney lines 225–256, and bastl2024 lines 598–650.
- Pinned declarations: opened Annulus.lean:105, Slice/Freedman.lean:66, Projectivization/Basic.lean:105/209, FDeriv/Basic.lean:397, Orientation/Basic.lean:32, FundamentalClass.lean:204, PosDef/Finite.lean:147/152, and Fredholm/SardSmale.lean:409; no kept headline is an existing proof.
- Lean: 12 actual declarations inspected with `#check @name`, 0 lost binders; target elaboration passed with 6 sorry warnings; 6/6 one-tactic probes (`simp`, `rfl`, `infer_instance`) failed; presentation-realization probe passed with one sorry.
- Suppliers: all 12 table rows inspected; 2 new open suppliers (#851, #1212) resolved at their heads; main-supplier and overlap checks expose R03–R08 rather than missing textual IDs.
- Dependency output: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; 0 UPWARD or CYCLE lines.
- Gate: all supplied scanners and the targeted build pass; independent elaboration passes; 0 changes outside this folder, 0 worktree edits.
- Prior review: 11 findings reconciled above; the old gate failures are gone; 20 current findings, including 12 P1/P2 findings.

Overlap check: read GeometricTopology (main, #1797, #1791), HomotopySpheres (main, #284), TangentialBordism (main), InstantonFloerTheory (#1083), CharacteristicClasses (#1807); shared linking/Arf/Alexander/torus theory belongs to GeometricTopology; geometric E₈/Hopf inputs still belong to main HomotopySpheres; K3/E(1)/framed-stem inputs belong to TangentialBordism; generic characteristic classes belong to CharacteristicClasses; FourManifolds owns the four-dimensional ASD core, with InstantonFloerTheory consuming it. The result/heading closest list is empty; no second copy, conflicting folder head or dropped citation ID was reported or found.

Source independence: 20 passages compared with 9 readable sources; no nonstandard wording or borrowed tables/figures found. Largest share: freedmanquinn, 40 named source invocations before References. Its contents were read: F3 combines Chapters 1–5, then 7–9, then 11 before 10; §3.4 Needs requires §3.3 and §3.6 precedes realization. The eight layers do not reproduce that contents sequence. Gompf–Stipsicz and the other unavailable texts were not compared.

## Not verifiable

- Seeded §§1.1, 1.3, 1.5, 1.6, 2.2, 7.2 and 7.3: the head supplies no exact source locator for the retained geometric theorems (R14).
- gompfstipsicz: AMS book/DOI landing page yielded no legal full text; §§2.2, 3.1, 5.1, 8.2 and Theorems 1.2.25/1.2.33 remain uncertified.
- bass1968: The sources service’s title/author and DOI lookup returned no readable legal copy.
- brown1960: AMS landing page was found, but the service returned no readable legal text.
- cerf1968: The sources service’s title/author and DOI lookup returned no readable legal copy.
- donaldson1983: Project Euclid PDF endpoint returned a request-rejected HTML page, not the paper.
- edwardskirby: The sources service found JSTOR/publisher access only; no legal full text was returned.
- farrellTaylorWagoner: The sources service’s title/author and DOI lookup returned no readable legal copy.
- freedman1982: Project Euclid PDF endpoint returned a request-rejected HTML page, not the paper.
- freedmankirby: The sources service’s title/author and DOI lookup returned no readable legal copy.
- gompf1983: Project Euclid PDF endpoint returned a request-rejected HTML page, not the paper.
- hirschmazur: The sources service’s title/author and DOI lookup returned no readable legal copy.
- kirby1969: The sources service found JSTOR/publisher access only; no legal full text was returned.
- kirbysiebenmann: The sources service’s title/author and DOI lookup returned no readable legal copy.
- kister1964: The sources service found JSTOR/publisher access only; no legal full text was returned.
- lashof1971: AMS landing page was found, but the service returned no readable legal text.
- lees1969: AMS landing page was found, but the service returned no readable legal text.
- madsenmilgram: The sources service’s title/author and DOI lookup returned no readable legal copy.
- marin1977: The sources service found JSTOR/publisher access only; no legal full text was returned.
- milnor1959: The sources service found JSTOR/publisher access only; no legal full text was returned.
- munkres1960: The sources service found JSTOR/publisher access only; no legal full text was returned.
- quinn1979: The sources service found JSTOR/publisher access only; no legal full text was returned.
- quinn1982: Project Euclid PDF endpoint returned a request-rejected HTML page, not the paper.
- quinn1988: AMS landing page was found, but the service returned no readable legal text.
- rabin1958: The sources service found JSTOR/publisher access only; no legal full text was returned.
- ranicki1992: The sources service’s title/author and DOI lookup returned no readable legal copy.
- robertello: Publisher endpoint returned HTTP 403; no legal full text was returned.
- rolfsen: The sources service’s title/author and DOI lookup returned no readable legal copy.
- serreTrees: The sources service’s title/author and DOI lookup returned no readable legal copy.
- shaneson1969: The sources service’s title/author and DOI lookup returned no readable legal copy.
- whitehead1961: The sources service found JSTOR/publisher access only; no legal full text was returned.
- hanner1951: the sources service classified the citation as paywalled/uncertified; its text and locator were not verified.
- normalbundles: the sources service classified the citation as paywalled/uncertified; its text and locator were not verified.
- bassHellerSwan: the sources service classified the citation as paywalled/uncertified; its text and locator were not verified.
- lickorish: the sources service classified the citation as paywalled/uncertified; its text and locator were not verified.
- moise: the sources service classified the citation as paywalled/uncertified; its text and locator were not verified.
- browder1972: the sources service classified the citation as paywalled/uncertified; its text and locator were not verified.
- kirby1989: the sources service classified the citation as paywalled/uncertified; its text and locator were not verified.

## Source issues

- **Gap** in freedmanquinn at Theorem 5.2 (original Theorem 5.1A), proof pp. 86–87, documented at powellrayteichner line 124: the proof claims geometric dual spheres without controlling their intersections with the added tower caps; it should construct the duals throughout the tower upgrade; affects the proof.
- **Misprint** in bastl2024 at proof of Lemma 6.5, p. 13: the proof heading calls the result Proposition 6.5; it should call it Lemma 6.5; affects nothing.
- **Misprint** in tancer at §1, group presentations, p. 2: the alphabet for relators ends at generator index m, the number of relations; it should end at n, the number of generators; affects nothing.

## For the human reviewers

- **Ownership restriction:** main HomotopySpheres still owns the inputs at `TauCetiRoadmap/HomotopySpheres/README.md:2329` and 1368, while this review’s supplier ban forbids citing it. The earlier dropped-name repair therefore needs an ownership resolution, not another name deletion.
- **Not tested:** gompfstipsicz was unavailable; its sampled homotopy-classification, blowup and node locators, and its wording, could not be certified. The most-cited source, freedmanquinn, including its contents, was readable.
- **Not tested:** the other 36 unavailable or uncertified works are individually listed above; comparisons of their wording and licences were not possible. No source material was placed in the repository.
