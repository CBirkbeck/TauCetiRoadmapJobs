# Review of GeometricTopology (pull request #271 at 238d5da)

**Verdict:** needs changes

Whole-folder review, including inherited content. No previous review was supplied. The defects are repairable; no pull-request file was edited.

## R01 (P1) — The foliation headline reverses the theorem it cites

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:788`, 810–824: “a witness foliation violating it”. **Claim:** a taut foliation violates Thurston's Euler-class bound. **Witness:** `gabai-yazdi` lines 111–114 give an integral class of dual norm one, satisfying parity, which no taut foliation realizes. They do not give a foliation violating the bound.

**Repair:** state the genuine bound using the Thurston norm, and state Yazdi's non-realizability theorem separately, with its integral-class, norm and parity hypotheses. Supply the norm and realization predicate as actual targets. The proposed bound on *every* embedded surface also fails independently: a small sphere bounding a ball has pairing 0 and −χ = −2. The norm formulation gives 0 ≤ 0 on that null-homologous sphere. For a leaf Σ₂ in Σ₂ × S¹ it gives |−2| ≤ 2. Credit the paper to Mehdi Yazdi; the joint Gabai–Yazdi fully marked surface theorem is a different input (`gabai-yazdi` lines 139–144).

## R02 (P1) — PL embeddings need not be locally flat

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:327`: “Smooth and PL embeddings are locally flat”. **Witness:** the cone on a polygonal trefoil is a PL embedded disc in a PL 4-ball. Its vertex link is the trefoil; the local complement group is nonabelian, whereas a flat disc has local complement group ℤ.

**Repair:** retain the smooth-embedding theorem with its immersion and appropriate boundary hypotheses. Replace the PL assertion by a theorem with the actual local-link condition, and separately state the dimensions/codimensions where that condition follows automatically. Do not narrow the whole library to affine graphs. Use the cone as a negative Check. `daverman2009` lines 1373–1406, §1.2, printed pp. 29–30, explicitly discuss the codimension-two exception. The pinned `TauCeti/Geometry/Manifold/LocallyFlat/PL.lean:27` proves an affine-graph result, not the claimed universal statement.

## R03 (P1) — The JSJ object admits noncanonical redundant tori

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:713–718`: “existence and canonicity (up to isotopy)”. **Witness:** T³ satisfies the proposed definition with no cutting tori and with one coordinate torus. The pieces are respectively T³ and T² × I, both Seifert fibred; family cardinalities are 0 and 1.

**Repair:** consume the pinned minimal JSJ predicate, or add the identical minimality requirement to any genuinely new cutting-data enhancement. An ambient isotopy cannot identify these two families. Minimality rejects the one-torus family and keeps the empty family. `hatcher3m` lines 531–539, Theorem 1.9, printed p. 14, includes minimality. `TauCeti/LowDimTopology/JSJDecomposition.lean:210` already has the required subfamily law.

## R04 (P1) — The proposed Smale signature asserts a homeomorphism

**Location:** `TauCetiRoadmap/GeometricTopology/Suggested.lean:43`: “Diff (sphere 3) ≃ₜ* orthogonalGroup 4”. **Claim:** an isomorphism of topological groups, stronger even than a homeomorphism. **Witness:** O(4) is compact. Diff(S³) in its smooth topology is not: a smooth flow fixing a point can have derivative eᵗ there, unbounded as t tends to infinity.

**Repair:** state that the canonical O(4) inclusion is a homotopy equivalence, as README lines 395–398 correctly request. The native `TauCeti.SmaleConjecture` states exactly this. Both groups have two components; that agreement is compatible with homotopy equivalence and does not supply a homeomorphism. Delete the incorrect illustrative signature even though it is currently a comment.

## R05 (P2) — Cerf's connectedness statement drops orientation preservation

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:1012–1013`: “π₀(Diff S³) = 0”. **Witness:** reflection and identity on S³ have degrees −1 and +1, so cannot lie in the same component of the full diffeomorphism group. `cerf1968` lines 300–304 specify orientation-preserving diffeomorphisms.

**Repair:** write π₀(Diff⁺ S³) = 0, with the orientation convention explicitly attached; for the full group write π₀(Diff S³) ≅ ℤ/2. Cerf's Théorème I is at line 349, printed p. 3. This restores the distinction witnessed by the two degree values and agrees with the O(4) headline.

## R06 (P1) — Concordance endpoints are changed to mirrors

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:588–589`, 609: “boundary Σ = K ⊔ K'.mirror”. **Witness:** the cylinder on a right-handed trefoil is a concordance from that trefoil to itself. The displayed endpoint condition instead asks for a concordance to its mirror; their signatures are opposite nonzero integers.

**Repair:** use the actual two endpoint embeddings in S³ × I, with the incoming boundary orientation reversed, not a reflected knot. Mirror reversal belongs to the inverse in the concordance group. Consume the native collared concordance carrier. Also remove the identification with `Isotopic`: a square knot is smoothly slice and hence concordant to the unknot, while its Alexander polynomial is (t − 1 + t⁻¹)² rather than 1. Concordance must be a specialization of surface cobordism, with isotopy only supplying a sufficient condition.

## R07 (P2) — Zeeman's conjecture loses its finiteness hypothesis

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:877–879`: “for a contractible `2`-complex `K`”. **Witness:** a locally finite infinite triangulation of ℝ² is contractible. After any finite sequence of elementary collapses, its product with I still has infinitely many simplices and cannot be a point.

**Repair:** state the finite-complex conjecture and require a finite collapse sequence after a suitable triangulation/subdivision of the product. `kirby1997` lines 7883–7899, Problem 5.2, printed pp. 260–261, explicitly says finite. The pinned `Contractible2Complex` in `TauCeti/AlgebraicTopology/SimplicialComplex/Zeeman.lean:62` includes finiteness. The infinite plane must fail the input predicate. Keep this open conjecture as a proposition and explanatory target, not an admitted theorem promising its proof.

## R08 (P1) — The link recursion rejects zero-dimensional manifolds

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:857–864`, 883, 945: “`(n-1)`-sphere ... or `(n-1)`-ball”. **Witness:** the link of the sole vertex of a point has no vertices. At n = 0, natural subtraction gives n − 1 = 0, whose proposed sphere has two vertices and ball has one.

**Repair:** consume the native piecewise-dimensional definition, or explicitly handle n = 0 with the void link and use predecessor links only for successors. The corrected point is a 0-manifold. Restrict the boundary-of-n-simplex example to n ≥ 1, or use augmented dimension −1: the boundary of Δ⁰ is empty, not S⁰. The native dimension split is in `TauCeti/AlgebraicTopology/SimplicialComplex/CombinatorialManifold.lean:193–213`.

## R09 (P2) — The proposed smooth-link carrier omits immersion and components

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:483`: “{ f : C^∞(circle, M) // IsEmbedding f }”. **Witness:** t ↦ t − sin t modulo 2π is a smooth homeomorphism of the circle whose derivative at 0 is zero. It satisfies the proposed carrier but is not a smooth embedding.

**Repair:** use `Manifold.IsSmoothEmbedding` or the native bundled smooth embedding, and use a finite disjoint union of circles for links, including the empty link. Preserve a circle specialization for knots. The reparametrization above must be excluded by immersion; the identity knot, a two-component unlink and the empty link must all have their intended carriers. `Mathlib/Geometry/Manifold/SmoothEmbedding.lean:79` requires both immersion and topological embedding.

## R10 (P2) — Geometric quotients need free actions and geometrization uses interiors

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:711–712`, 719–731: “equivalently `M = X / Γ` for a discrete `Γ ≤ Isom X`”. **Witness:** the finite group generated by −I acts discretely on E³ but fixes 0; the quotient has link ℝP² there, not S². A compact torus-cut piece also has boundary, unlike X/Γ for a free action.

**Repair:** require a free properly discontinuous action for manifold quotients, and formulate the geometric metric on the appropriate interiors of cut pieces. State the finite-volume clause where the theorem needs it and distinguish the geometric decomposition from a bare compact cutting object. The trivial group gives E³; the translation lattice gives T³; the ±I example is excluded. `thurston-notes` lines 4930–4951 requires free actions. `perelman-surgery` lines 895–914 describes complete noncompact finite-volume hyperbolic pieces.

## R11 (P2) — The local-flatness definition has no boundary model

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:293–305`: local charts “`ℝ^n`” carrying the image to “`ℝ^m × {0}`”. **Witness:** [0,∞) → ℝ is a smooth embedded manifold with boundary. At 0 its punctured image germ has one component; the proposed one-dimensional linear slice has two.

**Repair:** state the boundaryless local-flatness predicate first, then give the half-space/neat and boundary-disjoint variants with their incidence conditions. Do not silently apply the interior predicate to slice-disc boundary points. The identity line has the full slice model; a ray endpoint has the half-slice model; a boundary-preserving neat embedding has the relative model. The native locally flat and neat embedding modules distinguish these cases.

## R12 (P2) — Heegaard existence is broader than the chosen handlebodies

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:746`, 751–761: “Every closed 3-manifold” with handlebodies built as boundary sums of solid tori. **Witness:** ℝP² × S¹ is closed and nonorientable. Gluing two connected orientable handlebodies along their connected boundaries produces an orientable manifold after choosing the compatible orientations.

**Repair:** make the ordinary theorem explicitly about connected closed orientable 3-manifolds, and supply the nonorientable handlebody variant if retaining the claimed general scope. The commented Lean carrier already says `ClosedOrientable3`; the prose must agree. `scharlemann` lines 43–72 discusses the broader handlebody convention. Under the ordinary convention S³ has genus 0 and S¹ × S² has genus 1; ℝP² × S¹ is not an instance.

## R13 (P1) — The Conway proof route imports an invariant that cannot obstruct it

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:515–516`, 577, 601–603: “jointly with ... `τ`”, and “`s` as consumers”. **Witness:** `piccirillo2020` lines 93–104 uses Rasmussen's s on the auxiliary knot K′ and explicitly says τ(K′) = 0 whenever its trace agrees with the Conway knot's trace.

**Repair:** distinguish the Conway nonsliceness theorem from the claimed 0-shake-genus application and give an exact theorem/argument for the latter. Supply the actual s-invariant prerequisite through a named owner and precise section or declared gap. Main-branch CombinatorialHeegaardFloer supplies τ, not Rasmussen s. The τ bound on this K′ is merely 0 ≤ g₄(K′), so it cannot give the required positive obstruction. A repaired route must use the nonzero s obstruction together with the trace comparison, not replace s by τ because their formal properties resemble one another.

## R14 (P1) — The declared suppliers form a two-way dependency

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:441–465`, 577–581; `Suggested.lean:17–20`: “which in turn consumes the knot types defined here”. **Witness:** main `TauCetiRoadmap/CombinatorialHeegaardFloer/README.md:224–235` explicitly makes Lane K consume GeometricTopology Layer 4; this roadmap consumes Lane K and its downstream concordance invariants.

**Repair:** keep geometric knot foundations here and make Lane K and the Floer-dependent applications downstream consumers. Put any extension that needs those consumers in a Part II roadmap with a one-way supplier contract. Separate the Layer 4 definition of sliceness from Layer 6's existence theorem as well: the predicate needs an embedding carrier, not Freedman's theorem. After moving the dependent applications, the edge GT → CombinatorialHeegaardFloer remains and the reverse edge disappears. The mechanical checker misses this semantic cycle; its clean output is recorded below, not treated as proof of acyclicity.

## R15 (P1) — Several claimed internal suppliers do not supply their inputs

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:720`, 735, 751, 759: “prime/connected-sum decomposition, which is layer 1” and “consume layer 3's surface mapping classes”. **Witness:** Layer 1 constructs connected sums but never states prime decomposition; Layer 3 concerns diffeomorphism groups of manifolds and spheres, not surface mapping classes. Layer 9 also calls handlebodies a Layer 1 supply before defining them itself.

**Repair:** give prime decomposition a real target with hypotheses, uniqueness convention and proof inputs, or cite an actual earlier owner. Place handlebodies before splitting existence. Cite SurfaceTopology Layer 9 for mapping classes and Layer 8 for closed-surface classification instead of the nonexistent local supply. A connected-sum operation alone permits S³ # M ≅ M and does not specify prime factors or uniqueness; the new contract must do so. No declared gap currently covers these missing supplies.

## R16 (P2) — The ownership inventory replans objects present at the pins

**Location:** `TauCetiRoadmap/GeometricTopology/Suggested.lean:22–35`; README Layers 1–3, 5, 7–8 and 11. **Claim:** the needed geometric-topology primitives are unavailable and must be built here. **Witness:** the pin already defines PL groupoids, locally flat embeddings, smooth diffeomorphism-group topology, slopes, Riemannian volume, curvature, JSJ predicates, simplicial realization and triangulability; exact declarations are listed below.

**Repair:** move the native objects into exact supplier contracts and delete their reconstruction targets. Keep genuinely missing constructions and deeper theorems, explaining the difference in one clause. In particular distinguish a native *proposition naming a conjecture* from a proof of it. The pinned JSJ minimality law excludes R03's redundant torus, and the pinned combinatorial dimension split accepts R08's point; rebuilding weaker versions would lose existing guarantees. No new fully qualified name collision exists because Suggested.lean currently declares nothing.

## R17 (P2) — Statable headline theorems are missing from the acceptance test

**Location:** `TauCetiRoadmap/GeometricTopology/Suggested.lean:29–35`, 59: “there are no compiled targets to state against the pin yet”. **Witness:** a scratch file importing the pinned Smale module and declaring `theorem smale : TauCeti.SmaleConjecture := by sorry` elaborated successfully with only the expected sorry warning.

**Repair:** state all statable deep headlines against native carriers, starting with Smale; audit the native annulus, Freedman, Mostow, virtual-fibering, JSJ and geometrization predicates rather than assuming their carriers absent. Poincaré also has native topological-manifold, simply-connected-space and homeomorphism carriers. Describe each genuinely unavailable headline and its particular missing object in the docstring. Delete the “state, not prove” substitute for an acceptance test of completed theorems. Do not add boundary-case padding such as the zero-surgery or sphere-neutral-element Checks. There are zero declarations to signature-check or one-tactic-probe in the submitted file; that is not evidence that no headline is statable.

## R18 (P2) — Two end theorems are narrowed below the cited general results

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:773`, 886: “∃ M ... rank ... < ... genus” and “∃ M : ClosedTopological5Manifold”. **Witness:** `li-rank-genus` lines 48–68 gives closed orientable hyperbolic examples with arbitrarily large rank/genus discrepancy; `manolescu` lines 72–83 gives nontriangulable manifolds in every dimension n ≥ 5.

**Repair:** retain the general quantified statements as headline targets. Use a single strict-gap example and dimension 5 as Checks. Li's strengthening asks for each prescribed gap, not just gap 1; Manolescu's theorem must include dimension 6 as well as 5. Preserve the source's orientation qualifications: the standard dimension-5 example is nonorientable, while orientable examples occur in higher dimensions. These general statements require no conjectural strengthening.

## R19 (P2) — Executable knot algorithms are part of the proposed scope

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:471–479`: “multiple algorithms for the same invariant, starting from different presentations”. **Witness:** the paragraph makes several algorithms per invariant a deliverable, beyond defining the invariant and proving presentation independence.

**Repair:** retain the mathematical Seifert-matrix, skein, Burau, bracket and representation constructions and their comparison theorems, and remove executable procedures as roadmap requirements. Keep finite knot computations as Checks. On the unknot each Alexander construction must yield 1; on the right trefoil it must yield t − 1 + t⁻¹. These equations express the required mathematics without requiring an algorithm implementation. This is a scope violation of the review's binding no-algorithms rule.

## R20 (P2) — Several named milestones do not state a mathematical contract

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:286`, 400–404, 562–570, 613, 687. **Claim:** fake-manifold smoothability, the four-dimensional Smale disproof, Property P/R, cosmetic surgery, homology-sphere concordance and the Weeks example are specified targets. **Witness:** the fake manifolds are not constructed; the nonzero homotopy class has no degree; cosmetic surgery has no slope/orientation quantifiers; the cross-ambient concordance relation has no ambient cobordism.

**Repair:** give each retained milestone its actual objects, quantifiers, category and locator, plus owned proof prerequisites. For Watanabe use the graph-space target and nonzero degree from Theorem 1.1, including boundary-neighborhood fixing or its comparison to pointwise fixing. For Levine use an annulus in an integral homology cobordism between the ambient homology spheres (`levine2016` lines 135–143). Pin the Weeks construction, for example the source's Whitehead-link fillings (5,1) and (5,2). Distinguish Property R from its generalized multi-component version. Identity concordance in a product cobordism and the unknot's 0-filling S¹ × S² must satisfy the repaired contracts; a nontrivial knot cannot be allowed by the ordinary Property R conclusion.

## R21 (P3) — Source locators identify different problems or lack theorem precision

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:406`, 568, 1015, 1105, and references throughout. **Witness:** `kirby1997` lines 5950–5953 identifies Problem 4.34 as the S⁴/O(5) question, not Hatcher's S³/O(4) theorem. Lines 425 onward give ordinary Property R as 1.16; 1.82 concerns framed links and connected sums.

**Repair:** replace the mismatched Kirby numbers, use exact original theorem/section/page locators for Hatcher and Gabai, and credit Yazdi's paper correctly. Do not substitute a chapter-wide textbook citation for a precise assertion. Record the version actually read: the accessible Freedman–Quinn reformat calls the relevant result Theorem 11.11, whereas the roadmap cites original 11.7B; the equivalence of those numberings remains uncertified here. The Weeks citation is an expository account (`gabai-meyerhoff-milley-mom` lines 10–18); cite its primary minimum-volume source, identified at line 1225, for the proof. The Morgan–Tian Poincaré book explicitly excludes the further geometrization analysis (lines 421–427); cite the appropriate proof for that input.

## R22 (P3) — Invariant conventions are not completely pinned

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:505–506`, 601–611: “fix the trefoil value” and “signature ... (ω : Circle)”. **Witness:** symmetry and the unknot normalization alone leave Δ and −Δ indistinguishable on an unrelated knot. At a trefoil Alexander root the two one-sided signatures are 0 and 2, whose average is 1.

**Repair:** explicitly impose Δ(1) = 1 for knots, give the chosen bracket/writhe normalization and trefoil Jones value, and specify the averaged Levine–Tristram signature at roots if claiming a concordance invariant on all of Circle. State the ω = 1 convention. The trefoil then has Δ(1) = 1; the figure-eight has −t + 3 − t⁻¹, also 1 at t = 1. At the root the repaired averaged signature is 1, not an unspecified choice of limiting value 0 or 2. Do not copy the even-image error in Livingston noted under Source issues.

## R23 (P3) — Definitions lack the required APIs, Checks and dependency structure

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:1`, 177–925. **Witness:** the foliation/Euler-class block at 797–812 and the JSJ block at 713–718 have no three discriminating Checks per definition; the layers have no per-target `*Needs:*` contracts and no concluding Examples/Dependencies subsections.

**Repair:** use the required Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layer and Downstream consumers structure. Give each kept definition its mathematical API and at least three distinct Checks, and each theorem exact hypotheses and a locator. Split needs by target. In particular include the small sphere, trefoil cone and redundant T³ torus as negative controls; definition restatements are not substitutes for these tests. Remove obsolete waiting/process prose from the Lean docstring and make every surviving local Lean name correspond to an actual declaration.

## R24 (P3) — The residue gate fails on process language

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:534`: “handoff”. **Witness:** the supplied push gate reports `residue=1` and overall `FAIL`.

**Repair:** replace process wording with the mathematical supplier relationship, and remove similar transient instructions such as waiting for types to land. The replacement must state the complement's boundary-torus interface without referring to a workflow. Re-run the gate; acceptance is not available while this mandatory check fails.

## R25 (P3) — Source extracts are stored as stray roadmap files

**Location:** `TauCetiRoadmap/GeometricTopology/references/`. **Witness:** the supplied push gate reports `stray-files=1`; README reference links point into this directory.

**Repair:** delete it; sources are the README's references. Replace extract-file links by legal bibliographic locators and use the external source cache for verification. A collar citation should resolve to Hirsch/Lee at its theorem locator, not to a source-material file shipped inside this roadmap. Re-run the gate to obtain `stray-files=0`. This review did not alter or reproduce those extracts.

## Verified sound

### What was checked and what the evidence establishes

Read both files, README/CONTRIBUTING and main-branch UniversalCovers/HopfRinow examples. Head matched; outside-folder diff was empty; worktree stayed clean.

`lake env lean TauCetiRoadmap/GeometricTopology/Suggested.lean` passed without warnings: one Mathlib import, one namespace, **zero declarations**, hence zero submitted signature or padding probes. The missing native Smale object file was built; a scratch headline and `#check` probe passed with only its expected sorry warning. The probe also confirmed `Manifold.IsSmoothEmbedding` and `Group.rank`'s finite-generation argument.

Gate: **FAIL**, with `residue=1`, `stray-files=1`, `build=0`, `depcheck=0`; other failure counters were zero. R24–R25 cover both failing classes. The requested dependency command with `--movable` returned:

```text
depcheck: 162 roadmaps, 1161 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. R14 is a manually resolved cycle absent from the tool's recognized edges.

### Adversarial calculations

These are calculations and countermodels, not general proofs. They cover the sampled blocks, headlines, definitions and conventions. Unavailable sources are listed separately; arithmetic coefficient degeneracies are inapplicable here.

| # | Statement or object | Instances tried | Computed values on the two sides | Result / required change |
|---|---|---|---|---|
| 1 | Native manifold hypotheses | Line with doubled origin; ordinary ℝ | Local dimension 1 in both; Hausdorff false versus true | `IsManifold` alone supplies neither T2 nor second countability; add these where a theorem uses them. |
| 2 | Dimension-zero / empty manifolds | Point; empty charted space | Local dimension 0; cardinalities 1 and 0 | State connectedness/nonemptiness for closed-manifold end theorems; empty manifolds are not excluded by charts alone. |
| 3 | Half-space boundary | [0,∞), points 0 and 1 | Boundary membership true and false; interior membership false and true | Retain native boundary notions. |
| 4 | Corners and faces | Quadrant at (0,0), (1,0), (1,1) | Boundary-face counts 2, 1, 0 | Face-sensitive smooth claims need corner data; a single boundary flag loses the distinction. |
| 5 | Boundary dimension | Interval; disc | Dimensions (1,0) and (2,1); boundary of interval has 2 points | Retain with positive ambient dimension; consume native boundary theorem. |
| 6 | Collar | [0,1]; S¹ | Boundary size 2 and 0; endpoint collar (b,t) has t=0 exactly on boundary | Product model is appropriate; empty boundary gives empty collar. |
| 7 | Boundary gluing | Two intervals glued at one endpoint | Components 1; outer boundary points 2, glued endpoint contributes 0 | Require compatible boundary identification/collars; not arbitrary quotient gluing. |
| 8 | Tubular normal bundle | Standard S¹ in ℝ²; identity ℝ² embedding | Normal ranks 1 and 0; zero section maps to original image in both | Retain normal-neighborhood target; rank-zero case is identity. |
| 9 | Connected sum | S² # T²; S² # S² | χ = 2+0−2 = 0; χ = 2+2−2 = 2 | Retain dimension-qualified sphere/torus checks and oriented disc choices. |
| 10 | PL pregroupoid and inverse | f(x)=x for x≤0, 2x for x≥0 | f(−1,0,1)=(-1,0,2); inverse at (-1,0,2)=(-1,0,1) | Continuous PL homeomorphism, not globally affine; native object already handles it. |
| 11 | PL is not smooth-groupoid inclusion | Same kink; smooth x+x³ | Kink one-sided derivatives 1,2; cubic derivatives 1+3x² vary on every open interval | Neither blanket inclusion between PL and smooth groupoids is justified. README correctly rejects one. |
| 12 | Pregroupoid composition locality | f(x)=2x, g(x)=x+1 | (g∘f)(3)=7; f∘g(3)=8 | Use actual composition order and both inverse-direction membership tests. |
| 13 | Boundaryless local flatness | Linear ℝ→ℝ² | Coordinates (x,0); transverse coordinate 0 exactly on image | Positive control for slice-chart predicate. |
| 14 | Boundary local flatness | Ray endpoint versus line interior | Punctured image-germ component counts 1 versus 2 | R11: require relative half-space model. |
| 15 | Local-flat restriction/invariance | Axis restricted to (−1,1); rotate by 90° | Images (x,0) and (0,x); transverse zero in suitable charts in both | Retain open restriction and homeomorphism invariance. |
| 16 | Product / composition of flat models | ℝ⊂ℝ²⊂ℝ³; product of axes | Dimensions 1→2→3; composite x↦(x,0,0); product (x,y)↦(x,0,y,0) | Positive controls; state exact hypotheses for general API. |
| 17 | PL local-flatness overclaim | Cone on trefoil; cone on unknot | Local complement groups trefoil group (nonabelian) and ℤ | R02; the wrong PL model is excluded only by a link condition. |
| 18 | Bicollar | Standard S¹ in ℝ² | Radii 1±ε give two distinct sides; at ε=0 both maps agree with inclusion | Retain two-sided/appropriate ambient hypotheses; source support below. |
| 19 | Annulus theorem | Concentric circles of radii 1,2 | Region 1≤r≤2 parametrized by (u,t)↦(1+t)u; boundary radii 1 and 2 | Positive control for nested, disjoint, locally flat sphere statement. |
| 20 | Diffeomorphism group order | Permutations (12),(23) on a 0-manifold | Products (123) versus (132) with rightmost-first composition | Nonabelian control; consume native composition law. |
| 21 | Diffeomorphism topology/families | Rotations by t and by \|t\| | Both families continuous; angular derivatives at 0 are 1 versus left −1/right 1 | Smooth families imply continuity; a converse needs a genuinely stronger condition. |
| 22 | Smale S³ headline | Identity and reflection; derivative flow | Degrees +1,−1; component counts O(4)=2 and Diff(S³)=2; derivative norms eᵗ unbounded in Diff | R04/R05: homotopy equivalence, orientation-sensitive π₀. |
| 23 | Four-dimensional Smale disproof | Watanabe's first nonzero graph-space degree | A₂ has rational dimension 1; source's surjection forces π₂ BDiff(D⁴,∂)⊗ℚ nonzero, hence π₁ Diff nonzero | State that degree, boundary convention and the comparison needed for S⁴; not a vague nontrivial class. |
| 24 | Smooth knot carrier | Identity circle; t−sin t reparametrization | Derivatives at 0 are 1 and 0; both are topological embeddings | R09: immersion distinguishes them. |
| 25 | Link carrier | Empty link, unknot, two-component unlink | Domain component counts 0,1,2; proposed circle domain always 1 | R09: finite family of circles. |
| 26 | Geometric versus planar presentations | Core S¹×{pt} in S¹×S²; knot in a ball | H₁ classes 1 and 0 in ℤ | Planar S³ adequacy cannot describe arbitrary ambient knots without additional ambient presentation data. |
| 27 | Reidemeister / framing | Unknot diagram before and after one positive curl | Ambient knot unchanged; writhe 0→1; blackboard framing 0→1 | Distinguish framed and unframed moves. |
| 28 | Braid closure / Markov | Identity one-strand braid; its stabilization | Closure unknot in both; braid indices 1 and 2 | Markov equivalence must include stabilization, not merely conjugacy. |
| 29 | Grid representation | Grid moves supplied by Lane K | Component count of represented unknot remains 1; grid size changes under stabilization | Adequacy is a downstream contract, not a second local construction. |
| 30 | Mirror/reverse/sign convention | One positive crossing | Mirror crossing −1; orientation reversal of the whole knot leaves crossing sign +1 | Retain specified mirror/reverse distinction. |
| 31 | Alexander constructions | Unknot, right trefoil, figure-eight | Polynomials 1, t−1+t⁻¹, −t+3−t⁻¹; values at 1 all 1, at −1 are 1,−3,5 | Positive normalized examples; R22 fixes global sign. |
| 32 | Jones normalization | Candidate right-trefoil convention and mirror | t+t³−t⁴ versus t⁻¹+t⁻³−t⁻⁴; both evaluate to 1 at t=1 | Unknot normalization alone cannot distinguish mirror convention; pin actual bracket/writhe choice. |
| 33 | Sliceness and genus | Unknot; trefoil | Smooth slice genera 0 and 1; signatures 0 and ±2 give lower bounds 0 and 1 | Retain positive/negative sliceness controls. |
| 34 | Freedman / smooth distinction | Conway and Kinoshita–Terasaka knots | Alexander polynomials both 1; topological sliceness true for both; smooth sliceness false and true | Correctly discriminates smooth versus locally flat discs. |
| 35 | Piccirillo obstruction | Trace-equivalent auxiliary K′ | τ(K′)=0, so \|τ\|≤g₄ yields 0≤g₄, not 1≤g₄ | R13: cited proof uses s, not τ. |
| 36 | Primitive slope | (0,0), (2,2), (1,0), (0,1) | gcd values 0,2,1,1 | Exclude zero and nonprimitive vectors; preserve infinity and zero slopes. |
| 37 | Slope quotient / direction | (p,q) and (−p,−q) | Same unoriented curve; (1,0)=∞ and (0,1)=0 in chosen μ,λ basis | Correct modulo-sign convention; meridian-to-slope gluing direction must remain explicit. |
| 38 | Rational slope junk value | 1/0 in field ℚ versus meridian | Field totalized division yields 0; meridional slope is ∞≠0 | Use native one-point compactification / slope carrier, not plain rational division. |
| 39 | Unknot surgery | Slopes 0,∞,2/1 | H₁ respectively ℤ,0,ℤ/2; outputs S¹×S²,S³,L(2,1) | Retain; impose coprimality in general p/q lens-space formula. |
| 40 | General framed surgery | n=3,k=1; k=n | Remove S¹×D², glue D²×S¹; at k=n the displayed complementary sphere has dimension −1 | Require 0≤k<n or an explicit augmented convention. |
| 41 | Property P/R | Trefoil +1 filling; unknot 0 filling | Property P predicts nontrivial π₁ for the former; latter has π₁=ℤ and is S¹×S² | +1 theorem supported by Kronheimer–Mrowka; separate generalized link Property R. |
| 42 | Concordance endpoints | Cylinder on trefoil versus its mirror | Cylinder endpoints same knot; signatures σ and σ, unlike σ and −σ with \|σ\|=2 | R06: mirror is not endpoint convention. |
| 43 | Concordance versus isotopy | Square knot and unknot | Concordance classes both 0; Alexander polynomials (t−1+t⁻¹)² and 1 | R06: not isotopic, though concordant. |
| 44 | Concordance group inverse | Trefoil # reverse-mirror trefoil | Signature 2+(−2)=0; ribbon concordance class 0 | Reverse mirror is correct for group inverse. |
| 45 | Cobordism identity/composition | Cylinder I and two concatenated cylinders | Endpoints 0→1→2; rescaling [0,2]→[0,1] gives the same identity class | Need collared cobordisms and equivalence by appropriate diffeomorphism. |
| 46 | Levine–Tristram signature | V=[[1,0],[-1,1]], θ=π/3±.001 | Eigenvalues approximately (−.000432700,.99870115) and (.000433325,1.001299225); signatures 0 and 2 | At the root averaged value (0+2)/2=1; R22 and source erratum. |
| 47 | Signature degenerate parameter | Same V, ω=1 | Hermitian matrix 0; raw signature 0 and limiting average 0 | Specify ω=1 separately; no nonzero lower bound here. |
| 48 | Mutation | Conway / Kinoshita–Terasaka mutant pair | Same Δ=1; smooth concordance classes nonzero and zero | Retain noninvariance theorem, but define mutation by the marked four-punctured-sphere involution, not an unspecified ±1 tangle replacement. |
| 49 | Homology-sphere concordance | Identity knot in Y×I | Relative homology H*(Y×I,Y)=0 at both ends; annulus genus 0 | Specify homology cobordism; an annulus in a fixed S³×I cannot even contain a knot in another Y. |
| 50 | Riemannian density | Gram matrices diag(4,9), identity | sqrt(det)=6 and 1; coordinate area scales by 6 and 1 | Retain density construction; consume native measure bridge. |
| 51 | Real total volume | Closed unit S²; complete Euclidean ℝ³ | Measure 4π versus ∞; ENNReal.toReal values 4π versus 0 | Compact/finite-volume assumptions are essential before converting to ℝ. |
| 52 | Curvature conventions | Unit S², Euclidean plane, unit S³ | Sectional curvatures 1,0,1; scalar curvatures 2,0,6 | Pin curvature signs against these values and native tensor convention. |
| 53 | Sectional curvature degeneracy | Independent orthonormal v,w; w=v | Gram determinant 1 versus 0 | Dependent pairs do not define a plane; totalized division is not a curvature theorem. |
| 54 | Hyperbolic normalization | g of curvature −1 and 4g | Curvatures −1 and −1/4; lengths multiply by 2 | Normalization excludes a rescaled false model. |
| 55 | Mostow / volume independence | Identity on closed hyperbolic n≥3; hyperbolic surfaces | Volume V=V; genus-2 surface areas 4π=4π despite nonisometric moduli | Retain n≥3 rigidity and closed/finite-volume hypotheses; area equality does not imply rigidity in dimension 2. |
| 56 | Haken condition | Coordinate torus in T³; small S² in S³ | π₁ map ℤ²→ℤ³ injective; 0→0 also injective | Define essential two-sided positive-genus surfaces; mere π₁ injectivity admits the wrong sphere. |
| 57 | Weeks minimal volume | Weeks itself; identity cover | V≈0.9427; cover degree 1 and volume 1V≈0.9427; V≤V | Positive checks; empty/disconnected inputs must not silently enter the theorem. |
| 58 | Virtual fibering | Σ₂×S¹, identity cover | Cover degree 1; projection fiber Σ₂, χ=−2 | Correct elementary model of virtually fibred; Agol's hyperbolic theorem requires the stronger source hypotheses. |
| 59 | Eight models | Listed geometry enumeration | Cardinality 8; each model dimension 3 | Retain list and native carrier; list membership does not itself prove quotient geometry. |
| 60 | Discrete quotient | E³/ℤ³; E³/{±I} | First stabilizers trivial; second origin stabilizer order 2, link H₁=ℤ/2 versus sphere-link H₁=0 | R10: require free action. |
| 61 | JSJ uniqueness | T³, empty versus one coordinate torus | Cutting counts 0 versus 1; both piece families Seifert | R03: minimality rejects latter. |
| 62 | Geometry on cut pieces | T²×I versus its interior | Boundary points have half-space charts; interior has ℝ³ charts | R10: complete quotient geometry belongs on interior, not compact boundary carrier. |
| 63 | Prime decomposition | S³#M; L(2,1)#L(3,1) | First is M; latter π₁=C₂*C₃, with two nontrivial factors | A gluing operation does not imply unique prime factorization; R15 supplies missing theorem. |
| 64 | Poincaré headline | S³; L(2,1) | π₁=0 versus C₂; simply connected true versus false | Ordinary conclusion fits native carriers; second input excluded by hypothesis. |
| 65 | Handlebody / splitting | 3-ball; solid torus | Boundary genera 0,1; free-group ranks 0,1 | Retain ordinary orientable handlebody construction. |
| 66 | Heegaard genus minimum | Sphere splitting and stabilization | Available genera 0,1,...; minimum 0 | Existence matters: infimum of an empty set must not masquerade as genus 0. |
| 67 | Rank≤genus | S³, S¹×S², L(2,1), T³ | (rank,genus)=(0,0),(1,1),(1,1),(3,3) | Correct elementary checks; do not replace Li's strict examples by these equalities. |
| 68 | Generality of splitting | ℝP²×S¹ | Orientability false; union of two ordinary handlebodies is orientable | R12: broader prose and narrow carrier disagree. |
| 69 | Li headline | Gap parameter 1,2 | Source supplies g−rank≥1 and ≥2 examples; displayed existential requires only >0 | R18: retain arbitrary gap parameter. |
| 70 | Foliation distribution | Product Σ₂×S¹ | Tangent rank 2, ambient rank 3, corank 1; transverse S¹ meets each product leaf | Positive cooriented taut example. |
| 71 | Plane orientation | Oriented product plane; unorientable plane bundle | Integral Euler class needs orientation; orientation local system nontrivial in second case | Corank 1 alone does not supply an oriented plane bundle; state ambient orientation/coorientation. |
| 72 | Euler pairing / leaf | Σ₂ leaf; torus leaf | (pairing,χ)=(−2,−2),(0,0); absolute values 2 and 0 | Correct bound on these leaves; distinguish χ from −χ. |
| 73 | Bound on arbitrary embedded surfaces | Small bounding S² | Pairing 0; −χ=−2; norm of homology class 0 | R01: proposed 0≤−2 false; norm bound 0≤0 true. |
| 74 | Euler sign witness | Tangency counts I₊=1,I₋=3 | e-pairing I₋−I₊=2; −χ=I₊+I₋=4; \|2\|≤4 | Source's inequality direction agrees with norm bound, not its alleged disproof. |
| 75 | Yazdi nonrealizability | Source's norm-one parity-compatible class a | x*(a)=1; number of taut foliations with e=a is 0 | Correct existential object is a class, not a violating foliation. |
| 76 | Abstract realization | One vertex; one edge | Realizations point and [0,1]; vertices 1 and 2, dimension 0 and 1 | Native realization already exists; unused ambient vertices must not add points. |
| 77 | Star/link API | Endpoint of an interval; interior vertex of subdivided interval | Link vertex counts 1 and 2 | Distinguishes boundary 0-ball from interior 0-sphere. |
| 78 | Subdivision | Single edge subdivided once | (V,E)=(2,1)→(3,2); χ=1 in both | Preserve realization; combinatorics need not remain equal. |
| 79 | Combinatorial dimension 0 | Point | Link vertex count 0 versus proposed sphere 2/ball 1 | R08: special base case required. |
| 80 | Combinatorial circle | Boundary of a triangle | Every vertex link has 2 vertices; χ=3−3=0 | Positive closed 1-manifold check. |
| 81 | Boundary of simplex | Δ⁰, Δ¹, Δ² | Boundaries empty, two points, circle; target S^(n−1) is wrong for n=0 under Nat subtraction | R08 restricts or augments dimension. |
| 82 | PL versus triangulable | Smooth sphere; nontriangulable source example | Sphere has both structures; source example has triangulability false and therefore PL false | Implication PL⇒triangulable is sound; converse not generally available. |
| 83 | Low-dimensional triangulation suppliers | Compact disc, sphere | Triangulation χ=1,2; supplier's compactness hypotheses true | PlanarTopology Layer 5 covers the compact case; do not silently export all noncompact surfaces. |
| 84 | Manolescu headline | n=5 and n=6 | Source existential true in both; proposed target covers only n=5 | R18 restores every n≥5 and orientation qualifications. |
| 85 | Elementary collapse | One edge to vertex; circle to point | χ:1→1 allowed; χ:0→1 impossible under collapse | Free-face condition discriminates collapse from arbitrary deletion. |
| 86 | Zeeman finite control | Point and interval, product with I | Products interval and square, each contractible/collapsible; χ=1 | Positive finite controls do not prove the open general conjecture. |
| 87 | Zeeman missing finiteness | Infinite triangulated plane × I | Infinitely many simplices before and after any finite sequence | R07: excluded by finite-complex hypothesis. |
| 88 | Smoothing / obstruction | Standard S⁵ | KS obstruction 0; standard PL and smooth structures exist | Positive check only; specify dimensions before claiming obstruction sufficiency. |
| 89 | No automatic smoothing from charts | PL kink coordinate transition | Derivatives at corner 1 and 2 disagree | A PL atlas is not itself a smooth atlas; smoothing is additional structure. |
| 90 | Acceptance examples / degeneracy | S³ decomposed into two solid tori with different gluing | Meridional-to-longitudinal gluing gives H₁=0; meridian-to-meridian gives H₁=ℤ | Name the gluing map; “two solid tori” alone does not specify S³. |

Rows 1, 26, 40, 56 and 71 also identify hypotheses that the repair must make explicit under R20/R23; they are not certified general theorems. No claim of solving the open Zeeman conjecture, smoothing fake manifolds, or proving geometrization is made by this table.


### Headline inventory and statability

Headlines by layer: (1) collars, tubular neighborhoods, gluing, fake-manifold smoothability; (2) bicollars/annulus; (3) Smale/Watanabe; (4) Reidemeister, Markov, presentation/polynomial comparisons, Piccirillo/Freedman; (5) Property P/R, surgery/cosmetic surgery; (6) concordance, mutation, Levine; (7) Mostow, Weeks, virtual Haken/fibering; (8) prime decomposition, JSJ, geometrization, Poincaré; (9) splittings, rank bound, Li; (10) Euler-class bound/Yazdi; (11) triangulation, Manolescu, smoothing. Zeeman remains open.

Smale's signature was compiled. Native carriers also exist for annulus, Freedman, Mostow, virtual Haken/fibering, JSJ, geometrization, Poincaré and triangulability. R17 requires individual missing-carrier explanations for the remaining headlines. The submitted file has zero declarations/signatures/padding probes.

### Library declarations opened at the pins

Mathlib pin: `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti pin: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. All 29 cited Mathlib files exist. These 24 object groups were opened; paths are library-relative. Native conjecture predicates below are statements, not proofs.

| # | Pin declaration and location | What the opened declaration supplies / does not supply |
|---|---|---|
| 1 | `Pregroupoid`, `Pregroupoid.groupoid`, `continuousGroupoid`, `Mathlib/Geometry/Manifold/StructureGroupoid.lean:274`, 295, 355 | Composition/locality laws; groupoid tests map and inverse. |
| 2 | `IsManifold`, `Mathlib/Geometry/Manifold/IsManifold/Basic.lean:777` | Chart compatibility; no Hausdorffness, countability or nonemptiness. |
| 3 | `ModelWithCorners.boundary`, `BoundarylessManifold`, `Mathlib/Geometry/Manifold/IsManifold/InteriorBoundary.lean:112`, 165 | Model-relative boundary and boundaryless class. |
| 4 | `Diffeomorph`, `Mathlib/Geometry/Manifold/Diffeomorph.lean:82`; `ContMDiffMap`, `Mathlib/Geometry/Manifold/ContMDiffMap.lean:38` | Native smooth equivalences and maps. |
| 5 | `Manifold.IsSmoothEmbedding`, `Mathlib/Geometry/Manifold/SmoothEmbedding.lean:79` | Immersion plus topological embedding. |
| 6 | `Group.rank`, `Mathlib/GroupTheory/Rank.lean:33`; `rank_eq_zero_iff`, line 51 | Finite generating-set rank; rank zero iff trivial with `[Group.FG G]`. |
| 7 | `AbstractSimplicialComplex`, `Mathlib/AlgebraicTopology/SimplicialComplex/Basic.lean:154`; `SSet.toTopHomeo`, `Mathlib/AlgebraicTopology/SimplicialSet/TopAdj.lean:42` | Complex and realization comparison; not a triangulation theorem. |
| 8 | `IsRiemannianManifold`, `Mathlib/Geometry/Manifold/Riemannian/Basic.lean:79` | Metric/Riemannian edistance compatibility. |
| 9 | `TauCeti.isManifold_boundary`, `TauCeti/Geometry/Manifold/Boundary/Charts.lean:321` | Boundary manifold for positive regularity. |
| 10 | `PLPregroupoid`, `PLGroupoid`, `PLGroupoid_le_continuousGroupoid`, `TauCeti/Geometry/Manifold/PLGroupoid.lean:73`, 106, 117 | PL charts and continuous inclusion; kink example at 165–196. |
| 11 | `IsSliceChart`, `IsSliceEmbedding`, `IsLocallyFlat`, `TauCeti/Geometry/Manifold/LocallyFlat/Basic.lean:169`, 361, 376 | Slice-image equality, embedding and local-flatness API. |
| 12 | `IsLocallyFlat.of_isSmoothEmbedding_of_preimage_boundary`, `TauCeti/Geometry/Manifold/LocallyFlat/Neat.lean:341`; affine graph result, `LocallyFlat/PL.lean:27` | Boundary incidence matters; affine graphs do not cover all PL embeddings. |
| 13 | `CoboundAnnulus`, `AnnulusConjecture`, `TauCeti/Geometry/Manifold/LocallyFlat/Annulus.lean:91`, 105 | Nested-sphere/product predicate; round example proved at line 147. |
| 14 | Group instance and `Diff`, `TauCeti/Geometry/Diffeomorphism/Group.lean:82`, 178; topology/family declarations, `Topology.lean:83`, 125 | Native diffeomorphism group and smooth topology. |
| 15 | `TauCeti.SmaleConjecture`, `TauCeti/Geometry/Diffeomorphism/Smale.lean:46` | Homotopy equivalence with the canonical inclusion as forward map. |
| 16 | `TauCeti.FreedmanSliceTheorem`, `TauCeti/KnotTheory/Slice/Freedman.lean:64` | Perfect commutator subgroup implies topological sliceness: a native proposition. |
| 17 | `Slope`, `FramedBoundaryTorus`, `TauCeti/LowDimTopology/DehnSurgery/Slope.lean:122`, 353; meridian/longitude formulas 432, 439 | Primitive slopes modulo sign; meridian ∞, longitude 0. |
| 18 | Concordance structures/relation, `TauCeti/Geometry/Manifold/SmoothEmbedding/Concordance.lean:93`, 101, 139, 144, 228 | Collared endpoints and reflexive cylinder; not isotopy or mirror inversion. |
| 19 | `riemannianVolume`, `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:76`; total volume, `Total.lean:43` | Chart-density measure and total volume. |
| 20 | `curvatureTensor`, `TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Tensor.lean:148`; sectional curvature predicates, `Sectional.lean:70`, 140, 164 | Curvature tensor and constant-sectional-curvature predicates. |
| 21 | `IsMostowRigid`, `MostowRigidity`, `TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/Mostow.lean:40`, 72; `hypVolumeOfMetric_eq_of_mostow`, `Volume.lean:104` | Rigidity predicate; volume independence conditional on rigidity. |
| 22 | `VirtualFiberingConjecture`, `VirtualHakenConjecture`, `TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/VirtualFibering.lean:62`, `VirtualHaken.lean:65` | Quantified compact connected hyperbolic-manifold propositions. |
| 23 | `IsJSJDecomposition`, `JSJTheorem`, `TauCeti/LowDimTopology/JSJDecomposition.lean:210`, 248; `GeometrizationConjecture`, `Geometrization.lean:144` | Minimal JSJ predicate; geometrization on complement components. |
| 24 | `IsCombinatorialManifold`, `TauCeti/AlgebraicTopology/SimplicialComplex/CombinatorialManifold.lean:193`; `IsTriangulable`, `TauCeti/Topology/Triangulable.lean:40`; `Contractible2Complex`, `TauCeti/AlgebraicTopology/SimplicialComplex/Zeeman.lean:62` | Zero-dimensional split, realization homeomorphism and finite contractible complexes. |


### Cross-roadmap resolution and ownership

Object searches used `roadmaps grep`/`roadmaps show`, main, supplied open heads and board packages. Existing-roadmap revisions were not substituted for main as suppliers. No unlisted open PR was sought. Nine relationships were resolved:

| Authoritative roadmap / section | Resolution |
|---|---|
| DifferentialGeometry main Layer 4 | Distributions, Frobenius and leaves; not automatic plane orientation. |
| DifferentialGeometry main §5.5, 528–533 | Corner/face refinements. |
| DifferentialGeometry main §12.4, 923–930 | Density/measure bridge. |
| HopfRinow main Layer 1 | Levi-Civita/Riemannian foundations. |
| CombinatorialHeegaardFloer main Lane K, 224–235 | Consumes GT Layer 4; owns grid adequacy; supplies τ, not Rasmussen s. R13/R14. |
| SurfaceTopology supplied head Layers 8 (850–938), 9 (942–1075) | Surface classification and mapping classes; generalized maps are a distinct surface representation. |
| PlanarTopology supplied head Layer 5 (616–700), Layer 8 (918–920) | Compact Radó theorem; its PL bridge consumes GT, so that bridge is not GT's upstream supplier. |
| RiemannianGeometry supplied head, 68–80 | Defers curvature/volume/model foundations to GT, then extends their identities. |
| HomotopySpheres supplied head, 74–79 | Consumes GT gluing, handles, surgery, cobordism and triangulation. |

GT owns genuinely missing extensions, not second copies of native objects. No plan declares supplier gaps, and there are no local declarations whose fully qualified names could collide.

### Seeded-source audit

The **15 sampled labels** have repeated headings without unique anchors; all occurrences across eleven layers were read, including the structure-group track. All **90 adversarial rows** are retained. All cited works went through the sources service; these are the passages read:

| Source / locator actually read | Target and outcome |
|---|---|
| `daverman2009` lines 397–431; 1373–1406 (§1.2, pp. 29–30); 2542–2575 (Theorem 2.4.10 and corollaries, p. 64) | Boundary, local-flatness exceptions and collar hypotheses; R02/R11. |
| `hudson1969` lines 498–506 (p. 20), 608–620 (Corollary 1.16) | PL balls/spheres and positive-dimensional links. OCR ambiguity is not reported as a source error. |
| `kirby1997` lines 425 onward (1.16), 754–775 (1.41, pp. 28–29), 1638 onward (1.82), 5950–5953 (4.34, p. 199), 7491–7513 (4.126, p. 247), 7883–7899 (5.2, pp. 260–261) | Problem numbers and finite Zeeman formulation; R07/R13/R21. Problem entries are not modern proofs. |
| `cerf1968` lines 300–304 (p. 1), 349–351 (Théorème I, p. 3) | Orientation-preserving connectedness; R05. |
| `watanabe2018` lines 22–35, 59–101 (arXiv:1812.02448v3, Theorem 1.1 and consequences, pp. 1–3) | Boundary-neighborhood convention, graph-space surjection and S⁴ consequence; R20. |
| `hatcher3m` lines 531–539 (Theorem 1.9, p. 14) | Minimality and isotopy uniqueness; R03. |
| `freedmanquinn1990` lines 201–205 and 7875–7926 (2013 reformat, §11.11, p. 224 onward) | Alexander-one/Z-slice result present; original numbering not matched. |
| `livingston2005` lines 223–236 (§3.1, p. 7; arXiv:math/0307077v4) | Averaged signatures; even-image error, R22. |
| `piccirillo2020` lines 22–26, 58, 71, 93–104 (arXiv:1808.02923v1, Theorem 1.1, trace lemma, Proposition 1.4 and Theorem 1.5, pp. 1–3) | Mutation, Conway nonsliceness, trace comparison and s rather than τ. |
| `levine2016` lines 135–143 (arXiv:1405.1125v2, introduction) | Concordance in an ambient integral homology cobordism. |
| `kronheimer2004` lines 54–55 (arXiv:math/0311489v5, Theorem 2, printed p. 296) | +1 surgery has nontrivial SO(3) representation; broader slopes need another input. |
| `thurston-notes` lines 4930–4951 (geometric quotient discussion) | Free quotient action required; R10. |
| `agol` lines 27–30 (arXiv:1204.2810v1, Theorems 9.1–9.2) | Closed aspherical virtual Haken and closed hyperbolic virtual fibering. |
| `gabai-meyerhoff-milley-mom` lines 52–59 (arXiv:0910.5043v1, Theorem 1.1) | Orientable closed Weeks statement and fillings in an expository account; primary proof not verified here. |
| `perelman-surgery` lines 895–914 (arXiv:math/0303109v1, concluding decomposition discussion) | Complete noncompact finite-volume hyperbolic pieces; R10. |
| `morgan-tian` lines 388–427 (arXiv:math/0607607v2, introduction, pp. 10–11) | Poincaré book explicitly excludes further geometrization analysis. |
| `scharlemann` lines 43–72 (arXiv:math/0007144v1, opening handlebody definitions) | Nonorientable handlebody convention differs from README; R12. |
| `li-rank-genus` lines 48–68 (arXiv:1106.6302v2, Theorem 1.1 and following remark) | Closed orientable hyperbolic examples with arbitrary rank/genus gap. |
| `calegari` lines 7760–7828 (§5.3, pp. 190–191, Corollary 5.13) | Taut/cooriented bound and signed tangencies; R01. |
| `gabai-yazdi` lines 49–90, 111–114, 139–144 (arXiv:1603.03822v4, Main Theorem, pp. 1–3) | Norm bound, parity, nonrealizability and separate fully marked theorem. |
| `manolescu` lines 60–90 (arXiv:1303.2354v4, Corollary 1.3) | Every dimension ≥5 with orientation qualifications; R18. |

**21 source entries** had mathematical passages inspected; retrieval alone was not counted as verification.


## Not verifiable

These are limitations, not assertions that the cited mathematics is false. All retrieval used the sources service and legal locations. The consolidated scratch `needs-references.toml` retains 22 missing/unreadable works; settled paywalled results are not reopened. No manifest was edited or source text copied into the repository.

| Source id | Unverified locator / legal search and limitation |
|---|---|
| `palais1960` | pp. 274–277; Crossref rate limit, AMS anti-bot HTML. |
| `whitehead1940` | pp. 809–824; bibliographic search found no legal text. |
| `munkres1966` | Theorems 10.5–10.6; JSTOR result was a Linton review, not the book; wrong DOI discarded. |
| `kirbysiebenmann1977` | TOP/PL obstruction; legal author PDF image-only, OCR unavailable. |
| `brown1962` | pp. 331–341; JSTOR metadata, Glasgow institutional PDF timed out. |
| `kirby1969` | pp. 575–582; legal author PDF image-only, no OCR. |
| `quinn1982` | Four-dimensional annulus; Euclid landing lacked PDF; explicit PDF returned error HTML. |
| `hatcher1983` | Smale proof; legal Cornell PDF image-only, no OCR. |
| `burde2003` | Knot/Seifert foundations; no legal text found by bibliographic search. |
| `freyd1985` | pp. 239–246; AMS metadata did not yield readable article. |
| `birman1974` | Markov/Burau; no legal text found by bibliographic search. |
| `freedman1982` | Original theorem; Euclid landing gave no readable PDF. |
| `rolfsen1976` | Chapter 9; no legal text found by bibliographic search. |
| `gompf1999` | Chapters 4–5; AMS metadata only. |
| `gabai1987` | Property R, pp. 479–536; Euclid landing gave no usable PDF. |
| `lee-riemannian` | Curvature/volume; no legal text found by bibliographic search. |
| `thurston-geometry` | Book Vol. 1; no legal text found; separate notes do not certify book numbering. |
| `ratcliffe` | Theorem 11.8.5; no readable book found. |
| `scott` | Eight geometries; Wiley 403, Michigan HTML shell instead of article. |
| `candel-conlon-1` | Foliations I; no readable copy found. |
| `candel-conlon-2` | Foliations II; Crossref rate limit, no text. |
| `thurston-norm` | Euler-class bound; legal Harvard PDF image-only, no OCR. |
| `hirsch` | Collar/tubular/isotopy locators; service paywall result, **uncertified**. |
| `lee2013` | Collar/tubular locators; service paywall result, **uncertified**. |
| `rourke1972` | PL textbook; service paywall result, **uncertified**. |
| `lickorish1997` | Knot/Jones locators; service paywall result, **uncertified**. |
| `kauffman1987` | Bracket/Jones; service paywall result, **uncertified**. |
| `moise` | Triangulation textbook; service paywall result, **uncertified**. |
| `zeeman` | Original dunce-hat paper; service paywall result, **uncertified**. |
| `freedmanquinn1990` | Readable reformat changes numbering; original 11.7B not matched. |

Targets without a precise locator or mathematical contract are covered by R20/R21. Accessible alternative texts support particular findings but do not certify unread original locators. Missing texts do not prevent this needs-changes verdict.

## Source issues

- **Error** in livingston2005 at §3.1, printed page 7: the source says averaged signatures have image exactly the even integers for every nonidentity unit parameter; it should be allow odd averages at Alexander roots; evenness applies at nonsingular parameters; affects a stated result.
