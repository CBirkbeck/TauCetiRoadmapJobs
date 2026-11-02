# Review of GeometricTopology (pull request #271 at 9bd6e07)

**Verdict:** needs changes

:robot: AI-assisted incremental review. Findings R01–R25 retain the previous identifiers; R26–R27 are new gate findings. No pull-request source was edited.

## R01 (P1) — The foliation headline reverses the cited theorem

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:810–824`: “a witness foliation violating it”. **Claim:** a taut foliation violates the Euler-class bound. **Witness:** a small bounding sphere gives pairing 0 and −χ=−2. The previous source audit (`gabai-yazdi` lines 111–114) instead gives a parity-compatible norm-one class not realized by any taut foliation.

**Repair:** target the Thurston-norm bound and Yazdi's nonrealizability theorem separately, defining norm and realization. On the bounding sphere the corrected bound is 0≤0; on a genus-two product leaf it is 2≤2.

## R02 (P1) — PL embeddings need not be locally flat

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:327`: “Smooth and PL embeddings are locally flat”. **Witness:** the cone on a polygonal trefoil is a PL embedded disc in a 4-ball. Its vertex complement has nonabelian trefoil group; a flat disc's local complement group is ℤ.

**Repair:** retain smooth embeddings with immersion/boundary hypotheses; require the correct local-link condition for the general PL assertion. Include the trefoil cone as a negative Check and the unknot cone as positive. The native affine-graph theorem is not the asserted universal result.

## R03 (P1) — The JSJ definition admits redundant tori

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:713–718`: “canonicity (up to isotopy)”. **Witness:** T³ admits both the empty family and one coordinate torus under the proposed definition: all resulting pieces are Seifert fibred, but cardinalities are 0 and 1.

**Repair:** consume `TauCeti.IsJSJDecomposition` and retain its minimality law (`TauCeti/LowDimTopology/JSJDecomposition.lean:210`). If enhancing it with cutting data, preserve that law. It rejects the one-torus family and keeps the empty family.

## R04 (P1) — Smale is stated as a homeomorphism

**Location:** `TauCetiRoadmap/GeometricTopology/Suggested.lean:43`: “Diff (sphere 3) ≃ₜ* orthogonalGroup 4”. **Witness:** O(4) is compact, while Diff(S³) is not: a flow fixing a point can have derivative norm eᵗ there. A topological-group isomorphism would in particular be a homeomorphism.

**Repair:** replace even this commented signature by the canonical inclusion being a homotopy equivalence, as `TauCeti.SmaleConjecture` states. Both sides have two components; this fits homotopy equivalence without the false compactness consequence.

## R05 (P2) — Cerf's connectedness omits orientation preservation

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:1040`: “π₀(Diff S³) = 0”. **Witness:** identity and reflection have degrees +1 and −1 and cannot be in one component. The previous source audit located the orientation restriction at `cerf1968` lines 300–304.

**Repair:** write π₀(Diff⁺ S³)=0, or π₀(Diff S³)≅ℤ/2 for the full group. The two degree values then distinguish exactly the intended components.

## R06 (P1) — Concordance endpoints are replaced by mirrors

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:609`: “boundary Σ = K ⊔ K'.mirror”; also 588–589. **Witness:** the trefoil cylinder has the same trefoil at both ends, with equal nonzero signatures. A mirror reverses the signature. A square knot is concordant to the unknot but not isotopic to it.

**Repair:** use actual endpoints with incoming boundary orientation reversed, and specialize surface cobordism, not isotopy. Use the native collared concordance carrier. Reserve reverse-mirror for the group inverse; the identity cylinder must satisfy reflexivity.

## R07 (P2) — Zeeman's conjecture omits finiteness

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:905–907`: “for a contractible `2`-complex”. **Witness:** an infinite locally finite triangulation of ℝ² is contractible; its product with I remains infinite after any finite collapse sequence and cannot become a point.

**Repair:** require a finite complex and a finite collapse sequence after suitable product triangulation/subdivision. The native `Contractible2Complex` includes finiteness (`TauCeti/AlgebraicTopology/SimplicialComplex/Zeeman.lean:63`). This excludes the infinite plane. Keep the open conjecture a proposition, not an admitted theorem promising its proof.

## R08 (P1) — The link recursion rejects dimension zero

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:885–892`, 911, 973: “`(n-1)`-sphere ... or `(n-1)`-ball”. **Witness:** a point has an empty vertex link. At n=0 natural subtraction gives 0, whose sphere has two vertices and ball one, neither empty.

**Repair:** use the native zero/successor split (`TauCeti/AlgebraicTopology/SimplicialComplex/CombinatorialManifold/Basic.lean:214`). The point then qualifies. Restrict the boundary-of-Δⁿ example to n≥1, or explicitly introduce augmented dimension −1; ∂Δ⁰ is empty.

## R09 (P2) — The smooth-link carrier omits immersion and multiple components

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:483`: “{ f : C^∞(circle, M) // IsEmbedding f }”. **Witness:** t↦t−sin t modulo 2π is a smooth circle homeomorphism with derivative zero at 0. The proposed carrier admits it; its single circle cannot represent an empty or two-component link.

**Repair:** use `Manifold.IsSmoothEmbedding` (`Mathlib/Geometry/Manifold/SmoothEmbedding.lean:72`) on finite disjoint unions of circles. It rejects the zero-derivative example; domains with 0,1,2 circles give the required empty link, knot and unlink.

## R10 (P2) — Quotient geometries need free actions and interiors

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:711–731`: “for a discrete `Γ ≤ Isom X`”. **Witness:** {±I} acts discretely on E³ but fixes 0, with quotient vertex link ℝP² rather than S². A compact torus-cut piece has boundary, unlike a free quotient of a boundaryless model.

**Repair:** require free properly discontinuous actions, and state complete geometry on appropriate interiors, with the theorem's finite-volume qualifications. The lattice quotient E³/ℤ³=T³ survives; E³/{±I} is excluded; T²×I is distinguished from its interior.

## R11 (P2) — Local flatness lacks a boundary model

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:303–304`: “manifolds (allowing boundary)” with full linear slices. **Witness:** [0,∞)↪ℝ has a one-component punctured image germ at 0; a full line slice has two components.

**Repair:** separate boundaryless, boundary-disjoint and neat/relative half-space variants, including incidence conditions. The ray gets a half-slice; the identity line a full slice. Native `TauCeti/Geometry/Manifold/LocallyFlat/Neat.lean:341` explicitly carries boundary incidence.

## R12 (P2) — Heegaard existence exceeds the chosen handlebody scope

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:746`, 751–762: “Every closed 3-manifold”. **Witness:** ℝP²×S¹ is closed nonorientable; gluing two connected orientable handlebodies along their connected boundaries yields an orientable manifold.

**Repair:** state the ordinary theorem for connected closed orientable 3-manifolds, and provide nonorientable handlebodies separately if retaining that broader theorem. S³ and S¹×S² retain genera 0 and 1; ℝP²×S¹ is excluded from the ordinary variant.

## R13 (P1) — The Conway route imports the wrong obstruction

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:515–516`, 601–603: “jointly with ... `τ`”. **Witness:** the previous source audit at `piccirillo2020` lines 93–104 gives τ(K′)=0 for the trace-equivalent auxiliary knot and uses Rasmussen s. Main CombinatorialHeegaardFloer supplies τ, not s.

**Repair:** distinguish nonsliceness from the claimed 0-shake-genus application, state the exact trace argument, and name an actual supplier/declared gap for s. The τ bound is only 0≤g₄(K′); the repaired obstruction must yield a positive bound from nonzero s.

## R14 (P1) — The supplier relationship remains cyclic

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:35–39`, 577–603. **Witness:** `TauCetiRoadmap/CombinatorialHeegaardFloer/README.md:224–239` on main consumes GT Layer 4; GT in turn consumes its grid adequacy and invariants. The mechanical dependency output does not detect this reverse supply.

**Repair:** keep geometric foundations here and move Floer-dependent applications to downstream Part II work. Separate sliceness definitions from Freedman's existence theorem. The added cellular comparison at README:879 also needs a direct native contract: AlgebraicTopology main:63–68 consumes GT triangulations. Native cellular chains/boundary already exist. The corrected dependency has GT supplying its consumers without importing their outputs.

## R15 (P1) — Internal supplier citations name nonexistent supplies

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:720`, 735, 751, 759. **Witness:** Layer 1 constructs connected sums, not prime decomposition, and does not define the claimed handlebody supply. Layer 3 does not develop surface mapping classes.

**Repair:** target prime decomposition explicitly with hypotheses and uniqueness, place handlebodies before splitting existence, and cite SurfaceTopology Layers 8–9 for classification/mapping classes. S³#M≅M only tests the operation; π₁(L(2,1)#L(3,1))=C₂*C₃ tests the two-prime decomposition the missing theorem must control.

## R16 (P2) — Native objects are planned again

**Location:** `TauCetiRoadmap/GeometricTopology/Suggested.lean:22–35`; README Layers 1–3, 5, 7–8, 11, now including 853–865. **Witness:** current native sources provide PLGroupoid, JSJ minimality, concordance, volume and triangulability. Added realization maps, identity/composition, Hausdorffness and closed-simplex quotient are also implemented; exact locations appear below.

**Repair:** delete reconstructed targets and import exact native APIs in supplier contracts. Keep genuinely missing extensions, including the ordered CW comparison. Identity on (1/3,2/3) and collapsed weight 1 are already native map behavior; rewriting them supplies no new object. Preserve existing minimality and zero-dimensional laws.

## R17 (P2) — Statable headlines remain absent

**Location:** `TauCetiRoadmap/GeometricTopology/Suggested.lean:29–35`, 59: “no compiled targets to state against the pin yet”. **Witness:** the current-pin scratch theorem `smale_review_probe : TauCeti.SmaleConjecture` elaborates with only a sorry warning. Its explicit `#check` returns precisely that proposition.

**Repair:** state all statable deep headlines against native carriers, starting with Smale, and audit annulus, Freedman, Mostow, virtual fibering, JSJ, geometrization and Poincaré individually. Name each genuinely missing carrier in the docstring. The successful Smale probe refutes the blanket absence claim; do not replace headlines with boundary-case Checks.

## R18 (P2) — Two end theorems are unnecessarily narrowed

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:773`, 914. **Witness:** the previous source audit gives arbitrary rank/genus gaps (`li-rank-genus` lines 48–68), and nontriangulable manifolds in every n≥5 (`manolescu` lines 72–83). The targets retain only a strict gap and dimension five.

**Repair:** preserve the general quantified results and orientation qualifications; make gap one and dimension five Checks. Gap two and dimension six must also instantiate the headlines. Do not assert an orientable dimension-five example when the cited construction is nonorientable there.

## R19 (P2) — Executable algorithms remain deliverables

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:471–479`: “multiple algorithms for the same invariant”. **Witness:** this explicitly requires several executable procedures, beyond mathematical constructions and presentation-independence theorems.

**Repair:** retain Seifert-matrix, skein, Burau and bracket constructions with comparison theorems; remove algorithm-implementation requirements. Test each Alexander construction on the unknot (1) and trefoil (t−1+t⁻¹). Those are mathematical agreement Checks without prescribing executable procedures.

## R20 (P2) — Named milestones still lack mathematical contracts

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:286`, 400–404, 562–570, 613, 687. **Witness:** fake manifolds are not constructed, Watanabe's nonzero class has no degree, cosmetic surgery has no slope/orientation quantifiers, and cross-ambient concordance supplies no ambient homology cobordism.

**Repair:** specify objects, hypotheses, quantifiers and exact locators for each retained target, including Property R versus generalized Property R and a marked Weeks construction. Identity concordance in Y×I must qualify; unknot 0-surgery must give S¹×S², while ordinary Property R excludes nontrivial knots. Preserve Watanabe's boundary-fixing convention and precise degree.

## R21 (P3) — Incorrect or absent source locators remain

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:406`, 568, 853–880, 1043, 1133. **Witness:** previous `kirby1997` lines 5950–5953 identify 4.34 as the S⁴ question, not Hatcher's S³ theorem; ordinary Property R is 1.16, not 1.82. The added realization/CW block has no exact locator.

**Repair:** correct the numbers and Yazdi attribution; give theorem/section/page locators for each new assertion and cite the source version read. Hatcher Appendix A.1, p. 520, supports the new compactness assertion. Retain the previous primary-source and Freedman–Quinn version corrections; do not certify unread numbering by analogy.

## R22 (P3) — Invariant and cellular sign conventions are incomplete

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:505–506`, 601–611; new 869–879. **Witness:** Δ and −Δ retain symmetry; trefoil one-sided signatures at an Alexander root are 0 and 2, average 1. Reflecting the interval characteristic map changes the cellular boundary from b−a to a−b.

**Repair:** impose Δ(1)=1, specify the bracket/writhe/Jones trefoil value and averaged signature including ω=1. Choose orientation-compatible ball-to-simplex maps, state ∂ab=b−a and ∂abc=bc−ac+ab, and restrict the displayed formula to positive degrees with unaugmented ∂₀=0. These controls exclude the reversed choices.

## R23 (P3) — The required structure, APIs and Checks remain missing

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:1`, 177–953. **Witness:** JSJ and Euler-class definitions lack three discriminating Checks; layers have no per-target Needs or concluding Examples/Dependencies. New restriction, cone and CW definitions also lack the required Checks.

**Repair:** use the requested Summary, Scope, Conventions, exact suppliers and layer structure; retain an API, precise hypotheses/locator, and three discriminating Checks for each definition. Include the sphere with pairing 0, trefoil cone, redundant T³ torus and reflected interval as negative controls. Remove process prose and undeclared local Lean-name claims.

## R24 (P3) — The residue gate still fails

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:534`: “handoff”. **Witness:** both supplied and rerun gates report residue=1 and FAIL.

**Repair:** replace workflow wording with the mathematical knot-exterior/boundary-torus supplier relationship. Remove the related waiting/process instructions from the Lean docstring. Rerun the gate and require residue=0; acceptance is unavailable while this mandatory check fails.

## R25 (P3) — Source extracts remain stray files

**Location:** `TauCetiRoadmap/GeometricTopology/references/`. **Witness:** both supplied and rerun gates report stray-files=1; the README links to extracts in that directory.

**Repair:** delete it; sources are the README's references. Replace extract links with legal bibliographic locators, keeping source texts only in the external cache. A collar reference should identify the source theorem, not a shipped extract. Rerun the gate and require stray-files=0.

## R26 (P1) — The build gate rejects a module-system warning

**Location:** `TauCetiRoadmap/GeometricTopology/Suggested.lean:1`, `import Mathlib`. **Claim:** the acceptance file passes the required build check. **Witness:** the targeted build exits successfully but warns that Mathlib uses the module system and recommends `module`; the worker records `build=1 FAIL`. Direct `lake env lean` alone emits no warning.

**Repair:** add `module` before the import, retaining the required Mathlib import and making any eventual headline declarations visible with the appropriate module visibility. A scratch copy with that one-line addition elaborates without warnings. Rerun the targeted build and worker gate; do not suppress the warning with an option. This is the brief's P1 classification for a failed build gate, not a claim that Lean elaboration failed.

## R27 (P3) — An unapproved fifth folder is changed

**Location:** `Completed/ConformalMapping/README.md:163–169`, the added elementary-proof-comparison bullet. **Claim:** this PR is confined to its four named roadmap folders. **Witness:** the prescribed filtered three-dot diff reports exactly this file, with seven insertions. It is neither GeometricTopology, BelyiMaps, PlanarTopology nor SurfaceTopology.

**Repair:** remove this edit from this PR and submit it separately if wanted. The same filtered diff must then be empty. The CLI gate also flags the three named sibling folders; those nine entries are explicitly authorized by this brief and are not findings.

## Previous findings

- R01 — not repaired: README:788–824 still asks for a taut foliation violating the Euler-class bound; the small bounding sphere still gives 0 ≤ −2.
- R02 — not repaired: README:327 still says smooth and PL embeddings are locally flat, without the link condition excluding the cone on a trefoil.
- R03 — not repaired: README:713–718 still omits minimality, admitting both the empty and one-torus decompositions of T³.
- R04 — not repaired: Suggested.lean:43 still writes a topological-group isomorphism for Smale instead of homotopy equivalence of the canonical inclusion.
- R05 — not repaired: README:1040 still gives connectedness of the full Diff(S³), omitting orientation preservation.
- R06 — not repaired: README:588–589 and 609 still identify concordance with isotopy and put a mirror at the outgoing endpoint.
- R07 — not repaired: README:905–907 still omits finiteness for the contractible 2-complex.
- R08 — not repaired: README:885–892 and 911 still use natural subtraction at dimension zero; the point has an empty vertex link.
- R09 — not repaired: README:483 still uses smooth maps plus topological embedding, with one circle for every link.
- R10 — not repaired: README:711–731 still allows nonfree discrete actions and puts complete quotient geometry on compact cut pieces.
- R11 — not repaired: README:303–304 still allows boundaries with only the full linear-slice local model.
- R12 — not repaired: README:746 and 761–762 still claim every closed 3-manifold splits into ordinary orientable handlebodies.
- R13 — not repaired: README:515–516 and 601–603 still use τ for the Conway route and claim s from CombinatorialHeegaardFloer.
- R14 — not repaired: README:35–39 and 577–603 still exchange supplies with CombinatorialHeegaardFloer. Added README:879 needs a direct native cellular supplier to avoid another reverse roadmap edge.
- R15 — not repaired: README:720, 735, 751 and 759 still cite nonexistent local prime-decomposition and mapping-class supplies.
- R16 — not repaired: README and Suggested.lean retain missing-API assertions. Added README:853–865 repeats realization-map, Hausdorff and quotient APIs present at the new pin.
- R17 — not repaired: Suggested.lean still has zero declarations; the current Smale headline compiles in a scratch probe.
- R18 — not repaired: README:773 and 914 still request only a strict rank/genus gap and a dimension-five nontriangulable example.
- R19 — not repaired: README:471–479 still makes multiple executable algorithms deliverables.
- R20 — not repaired: README:286, 400–404, 562–570, 613 and 687 still omit the precise objects or quantifiers identified previously.
- R21 — not repaired: README:406, 568, 1043 and 1133 retain incorrect locators/attribution. Added README:853–880 supplies no theorem or page locators.
- R22 — not repaired: README:505–506 and 601–611 leave normalization unresolved. Added README:869–879 also needs an oriented characteristic-map and degree-zero convention.
- R23 — not repaired: The README retains its former shape and lacks per-target Needs and discriminating Checks; the added definitions also lack those Checks.
- R24 — not repaired: README:534 still says “handoff”; both supplied and rerun gates report residue=1.
- R25 — not repaired: The references directory remains; both supplied and rerun gates report stray-files=1.

## Verified sound

This is an **incremental re-review of 118 changed lines since 238d5da**, not a repeat of the previous whole-folder audit. The substantive delta is 28 added realization/CW lines and the Hopf–Rinow link correction; the remaining changes are generated PROGRESS/STATUS data. All 25 old findings were compared with the current passages. They remain; no repair report marking any of them settled was supplied. Earlier source witnesses below are retained from the previous report, not represented as newly fetched or newly certified.

The reviewed head is `9bd6e07e4d2041feb8e6e464ac104d592777d68e`. The four authorized folders were excluded from the outside-folder diff; only `Completed/ConformalMapping/README.md` remains. No PR source file changed. Main examples read for shape were Completed/HopfRinow, AlgebraicTopology and ClassifyingSpaces. The new targets are general topology, not algorithms; no new sorry-data, options, local declarations or name collisions were introduced.

### Gate and elaboration

The worker gate has four failing classes: residue, stray-files, outside-folder and build. The independent CLI rerun reports residue=1, stray-files=1, outside-folder=10, depcheck=0 and FAIL. Nine outside-folder entries belong to the three explicitly authorized siblings; only the ConformalMapping entry is actionable. That CLI invocation stops at text/scope failures, so the targeted build was run separately. It succeeds but repeats the non-sorry module warning recorded as build=1 by the worker. Direct absolute-file elaboration exits 0 without diagnostics. R26 distinguishes these outcomes.

The exact requested dependency command returned:

```text
depcheck: 204 roadmaps, 1496 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This does not detect the manually witnessed supplier cycle in R14. The README has no per-target `*Needs:*` lines; supplier paragraphs and prose were resolved as detailed below.

`Suggested.lean` is byte-for-byte unchanged since 238d5da: one Mathlib import and **zero declarations**. Hence there are zero submitted signatures to `#check`, zero sorried theorems for a one-tactic probe, and zero padding declarations. The fresh scratch Smale declaration and its `#check @smale_review_probe` elaborate to `TauCeti.SmaleConjecture`, with only the expected sorry warning. `#check @Manifold.IsSmoothEmbedding` also succeeds. An initial module-mode probe needed import visibility corrected; the successful non-module probe is the evidence for statability. A separate copy with `module` prepended to the unchanged acceptance file elaborates without warnings. All Lean sessions finished.

### Adversarial calculations

Rows 1–90 carry forward, individually attributed, the unchanged statements' calculations from [the previous report at 238d5da](PRREVIEW-GeometricTopology~1.md). They are countermodels and computed controls, not general proofs. No unchanged source audit is claimed afresh. Rows Δ1–Δ19 cover each added or changed mathematical assertion and its downstream use; Δ18 explicitly checks the new sign convention and the zero-degree boundary.

| # | Statement or object | Instances tried | Computed values on the two sides | Result / required change |
|---|---|---|---|---|
| 1 | Native manifold hypotheses | Line with doubled origin; ordinary ℝ | Local dimension 1 in both; Hausdorff false versus true | `IsManifold` alone supplies neither T2 nor second countability; add these where a theorem uses them.  Prior review, row 1. |
| 2 | Dimension-zero / empty manifolds | Point; empty charted space | Local dimension 0; cardinalities 1 and 0 | State connectedness/nonemptiness for closed-manifold end theorems; empty manifolds are not excluded by charts alone.  Prior review, row 2. |
| 3 | Half-space boundary | [0,∞), points 0 and 1 | Boundary membership true and false; interior membership false and true | Retain native boundary notions.  Prior review, row 3. |
| 4 | Corners and faces | Quadrant at (0,0), (1,0), (1,1) | Boundary-face counts 2, 1, 0 | Face-sensitive smooth claims need corner data; a single boundary flag loses the distinction.  Prior review, row 4. |
| 5 | Boundary dimension | Interval; disc | Dimensions (1,0) and (2,1); boundary of interval has 2 points | Retain with positive ambient dimension; consume native boundary theorem.  Prior review, row 5. |
| 6 | Collar | [0,1]; S¹ | Boundary size 2 and 0; endpoint collar (b,t) has t=0 exactly on boundary | Product model is appropriate; empty boundary gives empty collar.  Prior review, row 6. |
| 7 | Boundary gluing | Two intervals glued at one endpoint | Components 1; outer boundary points 2, glued endpoint contributes 0 | Require compatible boundary identification/collars; not arbitrary quotient gluing.  Prior review, row 7. |
| 8 | Tubular normal bundle | Standard S¹ in ℝ²; identity ℝ² embedding | Normal ranks 1 and 0; zero section maps to original image in both | Retain normal-neighborhood target; rank-zero case is identity.  Prior review, row 8. |
| 9 | Connected sum | S² # T²; S² # S² | χ = 2+0−2 = 0; χ = 2+2−2 = 2 | Retain dimension-qualified sphere/torus checks and oriented disc choices.  Prior review, row 9. |
| 10 | PL pregroupoid and inverse | f(x)=x for x≤0, 2x for x≥0 | f(−1,0,1)=(-1,0,2); inverse at (-1,0,2)=(-1,0,1) | Continuous PL homeomorphism, not globally affine; native object already handles it.  Prior review, row 10. |
| 11 | PL is not smooth-groupoid inclusion | Same kink; smooth x+x³ | Kink one-sided derivatives 1,2; cubic derivatives 1+3x² vary on every open interval | Neither blanket inclusion between PL and smooth groupoids is justified. README correctly rejects one.  Prior review, row 11. |
| 12 | Pregroupoid composition locality | f(x)=2x, g(x)=x+1 | (g∘f)(3)=7; f∘g(3)=8 | Use actual composition order and both inverse-direction membership tests.  Prior review, row 12. |
| 13 | Boundaryless local flatness | Linear ℝ→ℝ² | Coordinates (x,0); transverse coordinate 0 exactly on image | Positive control for slice-chart predicate.  Prior review, row 13. |
| 14 | Boundary local flatness | Ray endpoint versus line interior | Punctured image-germ component counts 1 versus 2 | R11: require relative half-space model.  Prior review, row 14. |
| 15 | Local-flat restriction/invariance | Axis restricted to (−1,1); rotate by 90° | Images (x,0) and (0,x); transverse zero in suitable charts in both | Retain open restriction and homeomorphism invariance.  Prior review, row 15. |
| 16 | Product / composition of flat models | ℝ⊂ℝ²⊂ℝ³; product of axes | Dimensions 1→2→3; composite x↦(x,0,0); product (x,y)↦(x,0,y,0) | Positive controls; state exact hypotheses for general API.  Prior review, row 16. |
| 17 | PL local-flatness overclaim | Cone on trefoil; cone on unknot | Local complement groups trefoil group (nonabelian) and ℤ | R02; the wrong PL model is excluded only by a link condition.  Prior review, row 17. |
| 18 | Bicollar | Standard S¹ in ℝ² | Radii 1±ε give two distinct sides; at ε=0 both maps agree with inclusion | Retain two-sided/appropriate ambient hypotheses; source support below.  Prior review, row 18. |
| 19 | Annulus theorem | Concentric circles of radii 1,2 | Region 1≤r≤2 parametrized by (u,t)↦(1+t)u; boundary radii 1 and 2 | Positive control for nested, disjoint, locally flat sphere statement.  Prior review, row 19. |
| 20 | Diffeomorphism group order | Permutations (12),(23) on a 0-manifold | Products (123) versus (132) with rightmost-first composition | Nonabelian control; consume native composition law.  Prior review, row 20. |
| 21 | Diffeomorphism topology/families | Rotations by t and by \|t\| | Both families continuous; angular derivatives at 0 are 1 versus left −1/right 1 | Smooth families imply continuity; a converse needs a genuinely stronger condition.  Prior review, row 21. |
| 22 | Smale S³ headline | Identity and reflection; derivative flow | Degrees +1,−1; component counts O(4)=2 and Diff(S³)=2; derivative norms eᵗ unbounded in Diff | R04/R05: homotopy equivalence, orientation-sensitive π₀.  Prior review, row 22. |
| 23 | Four-dimensional Smale disproof | Watanabe's first nonzero graph-space degree | A₂ has rational dimension 1; source's surjection forces π₂ BDiff(D⁴,∂)⊗ℚ nonzero, hence π₁ Diff nonzero | State that degree, boundary convention and the comparison needed for S⁴; not a vague nontrivial class.  Prior review, row 23. |
| 24 | Smooth knot carrier | Identity circle; t−sin t reparametrization | Derivatives at 0 are 1 and 0; both are topological embeddings | R09: immersion distinguishes them.  Prior review, row 24. |
| 25 | Link carrier | Empty link, unknot, two-component unlink | Domain component counts 0,1,2; proposed circle domain always 1 | R09: finite family of circles.  Prior review, row 25. |
| 26 | Geometric versus planar presentations | Core S¹×{pt} in S¹×S²; knot in a ball | H₁ classes 1 and 0 in ℤ | Planar S³ adequacy cannot describe arbitrary ambient knots without additional ambient presentation data.  Prior review, row 26. |
| 27 | Reidemeister / framing | Unknot diagram before and after one positive curl | Ambient knot unchanged; writhe 0→1; blackboard framing 0→1 | Distinguish framed and unframed moves.  Prior review, row 27. |
| 28 | Braid closure / Markov | Identity one-strand braid; its stabilization | Closure unknot in both; braid indices 1 and 2 | Markov equivalence must include stabilization, not merely conjugacy.  Prior review, row 28. |
| 29 | Grid representation | Grid moves supplied by Lane K | Component count of represented unknot remains 1; grid size changes under stabilization | Adequacy is a downstream contract, not a second local construction.  Prior review, row 29. |
| 30 | Mirror/reverse/sign convention | One positive crossing | Mirror crossing −1; orientation reversal of the whole knot leaves crossing sign +1 | Retain specified mirror/reverse distinction.  Prior review, row 30. |
| 31 | Alexander constructions | Unknot, right trefoil, figure-eight | Polynomials 1, t−1+t⁻¹, −t+3−t⁻¹; values at 1 all 1, at −1 are 1,−3,5 | Positive normalized examples; R22 fixes global sign.  Prior review, row 31. |
| 32 | Jones normalization | Candidate right-trefoil convention and mirror | t+t³−t⁴ versus t⁻¹+t⁻³−t⁻⁴; both evaluate to 1 at t=1 | Unknot normalization alone cannot distinguish mirror convention; pin actual bracket/writhe choice.  Prior review, row 32. |
| 33 | Sliceness and genus | Unknot; trefoil | Smooth slice genera 0 and 1; signatures 0 and ±2 give lower bounds 0 and 1 | Retain positive/negative sliceness controls.  Prior review, row 33. |
| 34 | Freedman / smooth distinction | Conway and Kinoshita–Terasaka knots | Alexander polynomials both 1; topological sliceness true for both; smooth sliceness false and true | Correctly discriminates smooth versus locally flat discs.  Prior review, row 34. |
| 35 | Piccirillo obstruction | Trace-equivalent auxiliary K′ | τ(K′)=0, so \|τ\|≤g₄ yields 0≤g₄, not 1≤g₄ | R13: cited proof uses s, not τ.  Prior review, row 35. |
| 36 | Primitive slope | (0,0), (2,2), (1,0), (0,1) | gcd values 0,2,1,1 | Exclude zero and nonprimitive vectors; preserve infinity and zero slopes.  Prior review, row 36. |
| 37 | Slope quotient / direction | (p,q) and (−p,−q) | Same unoriented curve; (1,0)=∞ and (0,1)=0 in chosen μ,λ basis | Correct modulo-sign convention; meridian-to-slope gluing direction must remain explicit.  Prior review, row 37. |
| 38 | Rational slope junk value | 1/0 in field ℚ versus meridian | Field totalized division yields 0; meridional slope is ∞≠0 | Use native one-point compactification / slope carrier, not plain rational division.  Prior review, row 38. |
| 39 | Unknot surgery | Slopes 0,∞,2/1 | H₁ respectively ℤ,0,ℤ/2; outputs S¹×S²,S³,L(2,1) | Retain; impose coprimality in general p/q lens-space formula.  Prior review, row 39. |
| 40 | General framed surgery | n=3,k=1; k=n | Remove S¹×D², glue D²×S¹; at k=n the displayed complementary sphere has dimension −1 | Require 0≤k<n or an explicit augmented convention.  Prior review, row 40. |
| 41 | Property P/R | Trefoil +1 filling; unknot 0 filling | Property P predicts nontrivial π₁ for the former; latter has π₁=ℤ and is S¹×S² | +1 theorem supported by Kronheimer–Mrowka; separate generalized link Property R.  Prior review, row 41. |
| 42 | Concordance endpoints | Cylinder on trefoil versus its mirror | Cylinder endpoints same knot; signatures σ and σ, unlike σ and −σ with \|σ\|=2 | R06: mirror is not endpoint convention.  Prior review, row 42. |
| 43 | Concordance versus isotopy | Square knot and unknot | Concordance classes both 0; Alexander polynomials (t−1+t⁻¹)² and 1 | R06: not isotopic, though concordant.  Prior review, row 43. |
| 44 | Concordance group inverse | Trefoil # reverse-mirror trefoil | Signature 2+(−2)=0; ribbon concordance class 0 | Reverse mirror is correct for group inverse.  Prior review, row 44. |
| 45 | Cobordism identity/composition | Cylinder I and two concatenated cylinders | Endpoints 0→1→2; rescaling [0,2]→[0,1] gives the same identity class | Need collared cobordisms and equivalence by appropriate diffeomorphism.  Prior review, row 45. |
| 46 | Levine–Tristram signature | V=[[1,0],[-1,1]], θ=π/3±.001 | Eigenvalues approximately (−.000432700,.99870115) and (.000433325,1.001299225); signatures 0 and 2 | At the root averaged value (0+2)/2=1; R22 and source erratum.  Prior review, row 46. |
| 47 | Signature degenerate parameter | Same V, ω=1 | Hermitian matrix 0; raw signature 0 and limiting average 0 | Specify ω=1 separately; no nonzero lower bound here.  Prior review, row 47. |
| 48 | Mutation | Conway / Kinoshita–Terasaka mutant pair | Same Δ=1; smooth concordance classes nonzero and zero | Retain noninvariance theorem, but define mutation by the marked four-punctured-sphere involution, not an unspecified ±1 tangle replacement.  Prior review, row 48. |
| 49 | Homology-sphere concordance | Identity knot in Y×I | Relative homology H*(Y×I,Y)=0 at both ends; annulus genus 0 | Specify homology cobordism; an annulus in a fixed S³×I cannot even contain a knot in another Y.  Prior review, row 49. |
| 50 | Riemannian density | Gram matrices diag(4,9), identity | sqrt(det)=6 and 1; coordinate area scales by 6 and 1 | Retain density construction; consume native measure bridge.  Prior review, row 50. |
| 51 | Real total volume | Closed unit S²; complete Euclidean ℝ³ | Measure 4π versus ∞; ENNReal.toReal values 4π versus 0 | Compact/finite-volume assumptions are essential before converting to ℝ.  Prior review, row 51. |
| 52 | Curvature conventions | Unit S², Euclidean plane, unit S³ | Sectional curvatures 1,0,1; scalar curvatures 2,0,6 | Pin curvature signs against these values and native tensor convention.  Prior review, row 52. |
| 53 | Sectional curvature degeneracy | Independent orthonormal v,w; w=v | Gram determinant 1 versus 0 | Dependent pairs do not define a plane; totalized division is not a curvature theorem.  Prior review, row 53. |
| 54 | Hyperbolic normalization | g of curvature −1 and 4g | Curvatures −1 and −1/4; lengths multiply by 2 | Normalization excludes a rescaled false model.  Prior review, row 54. |
| 55 | Mostow / volume independence | Identity on closed hyperbolic n≥3; hyperbolic surfaces | Volume V=V; genus-2 surface areas 4π=4π despite nonisometric moduli | Retain n≥3 rigidity and closed/finite-volume hypotheses; area equality does not imply rigidity in dimension 2.  Prior review, row 55. |
| 56 | Haken condition | Coordinate torus in T³; small S² in S³ | π₁ map ℤ²→ℤ³ injective; 0→0 also injective | Define essential two-sided positive-genus surfaces; mere π₁ injectivity admits the wrong sphere.  Prior review, row 56. |
| 57 | Weeks minimal volume | Weeks itself; identity cover | V≈0.9427; cover degree 1 and volume 1V≈0.9427; V≤V | Positive checks; empty/disconnected inputs must not silently enter the theorem.  Prior review, row 57. |
| 58 | Virtual fibering | Σ₂×S¹, identity cover | Cover degree 1; projection fiber Σ₂, χ=−2 | Correct elementary model of virtually fibred; Agol's hyperbolic theorem requires the stronger source hypotheses.  Prior review, row 58. |
| 59 | Eight models | Listed geometry enumeration | Cardinality 8; each model dimension 3 | Retain list and native carrier; list membership does not itself prove quotient geometry.  Prior review, row 59. |
| 60 | Discrete quotient | E³/ℤ³; E³/{±I} | First stabilizers trivial; second origin stabilizer order 2, link H₁=ℤ/2 versus sphere-link H₁=0 | R10: require free action.  Prior review, row 60. |
| 61 | JSJ uniqueness | T³, empty versus one coordinate torus | Cutting counts 0 versus 1; both piece families Seifert | R03: minimality rejects latter.  Prior review, row 61. |
| 62 | Geometry on cut pieces | T²×I versus its interior | Boundary points have half-space charts; interior has ℝ³ charts | R10: complete quotient geometry belongs on interior, not compact boundary carrier.  Prior review, row 62. |
| 63 | Prime decomposition | S³#M; L(2,1)#L(3,1) | First is M; latter π₁=C₂*C₃, with two nontrivial factors | A gluing operation does not imply unique prime factorization; R15 supplies missing theorem.  Prior review, row 63. |
| 64 | Poincaré headline | S³; L(2,1) | π₁=0 versus C₂; simply connected true versus false | Ordinary conclusion fits native carriers; second input excluded by hypothesis.  Prior review, row 64. |
| 65 | Handlebody / splitting | 3-ball; solid torus | Boundary genera 0,1; free-group ranks 0,1 | Retain ordinary orientable handlebody construction.  Prior review, row 65. |
| 66 | Heegaard genus minimum | Sphere splitting and stabilization | Available genera 0,1,...; minimum 0 | Existence matters: infimum of an empty set must not masquerade as genus 0.  Prior review, row 66. |
| 67 | Rank≤genus | S³, S¹×S², L(2,1), T³ | (rank,genus)=(0,0),(1,1),(1,1),(3,3) | Correct elementary checks; do not replace Li's strict examples by these equalities.  Prior review, row 67. |
| 68 | Generality of splitting | ℝP²×S¹ | Orientability false; union of two ordinary handlebodies is orientable | R12: broader prose and narrow carrier disagree.  Prior review, row 68. |
| 69 | Li headline | Gap parameter 1,2 | Source supplies g−rank≥1 and ≥2 examples; displayed existential requires only >0 | R18: retain arbitrary gap parameter.  Prior review, row 69. |
| 70 | Foliation distribution | Product Σ₂×S¹ | Tangent rank 2, ambient rank 3, corank 1; transverse S¹ meets each product leaf | Positive cooriented taut example.  Prior review, row 70. |
| 71 | Plane orientation | Oriented product plane; unorientable plane bundle | Integral Euler class needs orientation; orientation local system nontrivial in second case | Corank 1 alone does not supply an oriented plane bundle; state ambient orientation/coorientation.  Prior review, row 71. |
| 72 | Euler pairing / leaf | Σ₂ leaf; torus leaf | (pairing,χ)=(−2,−2),(0,0); absolute values 2 and 0 | Correct bound on these leaves; distinguish χ from −χ.  Prior review, row 72. |
| 73 | Bound on arbitrary embedded surfaces | Small bounding S² | Pairing 0; −χ=−2; norm of homology class 0 | R01: proposed 0≤−2 false; norm bound 0≤0 true.  Prior review, row 73. |
| 74 | Euler sign witness | Tangency counts I₊=1,I₋=3 | e-pairing I₋−I₊=2; −χ=I₊+I₋=4; \|2\|≤4 | Source's inequality direction agrees with norm bound, not its alleged disproof.  Prior review, row 74. |
| 75 | Yazdi nonrealizability | Source's norm-one parity-compatible class a | x*(a)=1; number of taut foliations with e=a is 0 | Correct existential object is a class, not a violating foliation.  Prior review, row 75. |
| 76 | Abstract realization | One vertex; one edge | Realizations point and [0,1]; vertices 1 and 2, dimension 0 and 1 | Native realization already exists; unused ambient vertices must not add points.  Prior review, row 76. |
| 77 | Star/link API | Endpoint of an interval; interior vertex of subdivided interval | Link vertex counts 1 and 2 | Distinguishes boundary 0-ball from interior 0-sphere.  Prior review, row 77. |
| 78 | Subdivision | Single edge subdivided once | (V,E)=(2,1)→(3,2); χ=1 in both | Preserve realization; combinatorics need not remain equal.  Prior review, row 78. |
| 79 | Combinatorial dimension 0 | Point | Link vertex count 0 versus proposed sphere 2/ball 1 | R08: special base case required.  Prior review, row 79. |
| 80 | Combinatorial circle | Boundary of a triangle | Every vertex link has 2 vertices; χ=3−3=0 | Positive closed 1-manifold check.  Prior review, row 80. |
| 81 | Boundary of simplex | Δ⁰, Δ¹, Δ² | Boundaries empty, two points, circle; target S^(n−1) is wrong for n=0 under Nat subtraction | R08 restricts or augments dimension.  Prior review, row 81. |
| 82 | PL versus triangulable | Smooth sphere; nontriangulable source example | Sphere has both structures; source example has triangulability false and therefore PL false | Implication PL⇒triangulable is sound; converse not generally available.  Prior review, row 82. |
| 83 | Low-dimensional triangulation suppliers | Compact disc, sphere | Triangulation χ=1,2; supplier's compactness hypotheses true | PlanarTopology Layer 5 covers the compact case; do not silently export all noncompact surfaces.  Prior review, row 83. |
| 84 | Manolescu headline | n=5 and n=6 | Source existential true in both; proposed target covers only n=5 | R18 restores every n≥5 and orientation qualifications.  Prior review, row 84. |
| 85 | Elementary collapse | One edge to vertex; circle to point | χ:1→1 allowed; χ:0→1 impossible under collapse | Free-face condition discriminates collapse from arbitrary deletion.  Prior review, row 85. |
| 86 | Zeeman finite control | Point and interval, product with I | Products interval and square, each contractible/collapsible; χ=1 | Positive finite controls do not prove the open general conjecture.  Prior review, row 86. |
| 87 | Zeeman missing finiteness | Infinite triangulated plane × I | Infinitely many simplices before and after any finite sequence | R07: excluded by finite-complex hypothesis.  Prior review, row 87. |
| 88 | Smoothing / obstruction | Standard S⁵ | KS obstruction 0; standard PL and smooth structures exist | Positive check only; specify dimensions before claiming obstruction sufficiency.  Prior review, row 88. |
| 89 | No automatic smoothing from charts | PL kink coordinate transition | Derivatives at corner 1 and 2 disagree | A PL atlas is not itself a smooth atlas; smoothing is additional structure.  Prior review, row 89. |
| 90 | Acceptance examples / degeneracy | S³ decomposed into two solid tori with different gluing | Meridional-to-longitudinal gluing gives H₁=0; meridian-to-meridian gives H₁=ℤ | Name the gluing map; “two solid tori” alone does not specify S³.  Prior review, row 90. |

| Δ1 | Hopf–Rinow connection link, README:631 | Flat line g=1; g=e^(2x) dx² | Γ=0 and Γ=1 from (g′)/(2g); torsion 0 in both | Completed/HopfRinow Layer 1 supplies the shared connection; corrected link resolves. |
| Δ2 | Induced realization map, README:853–854 | Collapse edge vertices a,b to c, coordinates (1/3,2/3) | c-weight=1/3+2/3=1 | Correct fiber-sum formula; already native, R16. |
| Δ3 | Identity law, README:854 | Identity of edge at (1/3,2/3) | Input and output both (1/3,2/3) | Already native, R16. |
| Δ4 | Composition law, README:854 | Reverse edge, then collapse it | Intermediate (2/3,1/3); both composites have sole weight 1 | Already native, R16. |
| Δ5 | Restriction and vertex carrier, README:855–858 | Edge on {a,b}, restrict to {a}; also empty restriction | Vertex counts 2→1 and 2→0; realizations point and empty | Singleton law forces changed vertex type; correct. |
| Δ6 | Restriction embedding, README:855–856 | a-vertex included in edge | Coordinate map 1↦(1,0), injective; image singleton, closed | Positive control; distinguish a vertex-subtype restriction from deleting required singletons. |
| Δ7 | Hausdorffness, README:859 | Two endpoints of edge | a-coordinate values 1 and 0, disjoint neighborhoods >2/3 and <1/3 | Correct; already native, R16. |
| Δ8 | Quotient by closed simplices, README:859 | Two consecutive edges ab,bc | Two disjoint intervals have 4 endpoint occurrences; quotient has 3 vertices, identifying only b | Correct quotient; already native, R16. |
| Δ9 | Compact containment, README:859–861 | One closed triangle; infinite weak wedge with one chosen interior point on each edge | Triangle uses 3 vertices; infinite chosen-point set is closed discrete of cardinality ℵ₀ and not compact | Weak topology is essential; no finite-dimensional or local-finiteness restriction needed. |
| Δ10 | Continuous finite factorization, README:861–862 | Constant map from compact interval into vertex a | Image size 1; factor uses 1 vertex and composite remains constant a | True by containment and restriction embedding, not a new surjectivity condition. |
| Δ11 | Affine contiguity homotopy, README:865–866 | Point mapped to endpoints of an edge; two isolated vertices as negative control | At t=0,1/2,1 weights (1,0),(1/2,1/2),(0,1); midpoint absent for two isolated vertices | Union-of-image-faces condition excludes the wrong model; joint continuity uses the interval's local compactness. |
| Δ12 | Cone contraction and apex fixing, README:866–867 | Cone on two isolated points; cone on empty complex | H(x,t)=(1−t)x+t·apex; apex coefficient at t=0,1 is 0,1; H(apex,t)=apex; empty-base cone has 1 point | Correct; use real affine homotopy, not mere separate continuity. |
| Δ13 | Order injective on simplices, README:868–869 | Edge with o(a)=0,o(b)=1; constant o | Distinct order values count 2 versus 1 | Constant o is excluded on the edge; repeated values on vertices sharing no face remain allowed. |
| Δ14 | CW cells and characteristic maps, README:869–874 | Point, edge, filled triangle | Cell counts (1), (2,1), (3,3,1); χ=1,1,1; 0-ball is one point with empty sphere | Expected CW structure; pin ball orientation as in R22. |
| Δ15 | Simplicial maps cellular, README:874 | Collapse an edge to a vertex | 1-skeleton image dimension 0≤1; 0-skeleton image dimension 0≤0 | Cellular does not mean dimension preserving; assertion is correct. |
| Δ16 | Ordered simplex-injective maps preserve characteristic maps, README:875–876 | a<b mapped to c<d with coordinates (1/3,2/3) | Image has c,d weights (1/3,2/3); either parametrized composite agrees | Both injectivity and order matter; reversal yields (2/3,1/3). |
| Δ17 | Automorphism permutes cells, README:876 | Reverse a single edge | Vertices swapped, sole edge fixed; induced oriented edge coefficient −1 | Cell permutation does not assert orientation preservation. |
| Δ18 | Cellular/simplicial boundary, README:877–879 | Ordered edge ab and triangle abc | ∂ab=b−a; ∂abc=bc−ac+ab; ∂²abc=(c−b)−(c−a)+(b−a)=0 | Correct with compatible generators. Reflection flips the edge sign; state n>0 and ∂₀=0, R22. |
| Δ19 | Classifying-space consumer, README:862,880 | First two join stages for C₂; next unused apex | Stage graph has V=4,E=4, χ=0; its cone has V=5,E=8,F=4, χ=1 | A finite image lies in a cone in a later stage; ClassifyingSpaces owns the subsequent contractibility argument. |

### Headline inventory

The unchanged README headlines remain: collars/tubes/gluing and smoothability; bicollars and annulus; Smale and Watanabe; Reidemeister/Markov and invariant comparisons, Freedman/Piccirillo; Property P/R and surgery; concordance/mutation/Levine; Mostow/Weeks/virtual Haken/fibering; prime decomposition/JSJ/geometrization/Poincaré; Heegaard existence/rank/Li; Euler bound/Yazdi; triangulation/Manolescu/smoothing. Zeeman is an open conjecture, not a theorem to promise. The added deep comparison is the simplicial-realization CW structure and its ordered cellular chains. R17 remains independently witnessed by the compiled Smale headline; the empty file does not explain missing carriers theorem by theorem.

### Current-pin declarations opened

Mathlib pin: `f6090c7095e1e56b3464c1daba5f24631f1290d2`. Tau Ceti pin: `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. These differ from the previous report's pins. These **15 declaration groups** were inspected at the current pins; library-relative paths below identify the actual source, not online documentation from another revision.

| Declaration / file and line | Supply and limitation |
|---|---|
| `AbstractSimplicialComplex.singleton_mem`, `Mathlib/AlgebraicTopology/SimplicialComplex/Basic.lean:156` | Every vertex has its singleton; restriction to fewer vertices changes type. No local finiteness is implied. |
| `Manifold.IsSmoothEmbedding`, `Mathlib/Geometry/Manifold/SmoothEmbedding.lean:72` | Both immersion and embedding, unlike the proposed link carrier. |
| `SimplicialMap.realizationMap`, `TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Map.lean:105`; coordinate law 125, identity 153, composition 162 | The added map/functoriality targets already exist on native weak realizations. |
| Weak topology, `TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Basic.lean:159`; continuity 177; `instT2SpaceRealization` 198 | Final face topology and Hausdorffness for arbitrary vertex types. |
| `isQuotientMap_sigma_faceInclusion`, `TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Homotopy.lean:46`; product criterion 58 | Closed-simplex quotient and joint continuity for a locally compact parameter. Does not require the complex locally finite. |
| `isClosedEmbedding_realizationMap`, `TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Subcomplex.lean:174` | Closed embedding for a same-vertex-type subcomplex inclusion; not automatically the new vertex-subtype restriction carrier. |
| `compactSpace_realization_of_finite_faces`, `TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Finite.lean:61` | Finite faces imply compactness; the converse compact-subset support theorem is a distinct target. |
| `TauCeti.SmaleConjecture`, `TauCeti/Geometry/Diffeomorphism/Smale.lean:46` | Actual canonical inclusion is the forward map of a homotopy equivalence. It is a proposition, not a proof. |
| `TauCeti.IsJSJDecomposition`, `TauCeti/LowDimTopology/JSJDecomposition.lean:210` | Minimality under subfamilies, exactly the law missing from R03. |
| `IsCombinatorialManifold`, `TauCeti/AlgebraicTopology/SimplicialComplex/CombinatorialManifold/Basic.lean:214` | Separate zero/successor clauses; this file moved since the prior pin. |
| `Contractible2Complex`, `TauCeti/AlgebraicTopology/SimplicialComplex/Zeeman.lean:63`; `IsTriangulable`, `TauCeti/Topology/Triangulable.lean:40` | Finiteness for Zeeman; realization-homeomorphism predicate for triangulability. |
| `PLGroupoid`, `TauCeti/Geometry/Manifold/PLGroupoid.lean:106`; affine graph theorem, `LocallyFlat/PL.lean:27` | Native PL charts; affine graph local flatness does not imply all PL embeddings are flat. |
| `Concordance`, `TauCeti/Geometry/Manifold/SmoothEmbedding/Concordance.lean:93`; `Concordant` 101; reflexive cylinder 228 | Collared actual endpoints, not a mirror endpoint or isotopy. |
| `TauCeti.riemannianVolume`, `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:76` | Existing volume construction, reinforcing R16. |
| `cellularDifferential`, `TauCeti/AlgebraicTopology/Cellular/Chains.lean:333`; `cellularChainComplex` 364; boundary interface, `Cellular/Boundary.lean:103` | Native nonnegative-degree chain complex and attaching-map boundary, with categorical exact-coproduct hypotheses. The ordered-simplex comparison is additional work. |

The realization/CW directory and object searches did not find the full added CW/ordered-chain comparison at this pin. Those extensions remain legitimate GeometricTopology work. Searches included `roadmaps grep` and `roadmaps show`, main, board packages and the supplied open-head corpus; an open PR merely revising GeometricTopology was not treated as an upstream owner. Existing native objects are imported, not replanned. Zero declarations in Suggested.lean means no fully qualified name duplicates.

### Cross-roadmap citations resolved this round

These **11 relationships** were read at main or the supplied heads. The named new source and both consumer relationships agree on the mathematical objects; native duplication and dependency direction still need the repairs above.

| Authoritative location | Resolution |
|---|---|
| `Completed/HopfRinow/README.md:264–315`, main | Layer 1 includes general Levi-Civita/family theory and consumes the native positive-definite connection and regularity; the changed relative link is correct. |
| `TauCetiRoadmap/ClassifyingSpaces/README.md:65–79`, main; Stage 1 at 115–124; Stage 4 at 234–250 | Explicitly imports GT Layer 11 weak realization, finite restriction, cone contraction and ordered CW chains. It does not own another generic realization. |
| `TauCetiRoadmap/AlgebraicTopology/README.md:499–526`, main, Stage 4; ownership at 63–68 | Owns general cellular comparison; its smooth-manifold specialization consumes GT triangulation. Use the native cellular definitions for the new GT interface and make the remaining direction explicit. |
| `TauCetiRoadmap/DifferentialGeometry/README.md:402–430`, main | Layer 4 finite-dimensional smooth distributions/Frobenius/foliations uses native carriers; no automatic plane orientation. |
| `TauCetiRoadmap/DifferentialGeometry/README.md:528–533`, main | §5.5 supplies corners/abstract boundary. |
| `TauCetiRoadmap/DifferentialGeometry/README.md:923–930`, main | §12.4 supplies the density/form/measure bridge over native Riemannian volume. |
| `TauCetiRoadmap/CombinatorialHeegaardFloer/README.md:224–239`, main | Lane K consumes GT Layer 4 and owns grid adequacy; τ does not supply Rasmussen s. The reverse use remains R14. |
| `TauCetiRoadmap/SurfaceTopology/README.md:1172`, 1256, this PR head | Layers 8 and 9 supply compact-surface classification and mapping classes. These are not GT Layer 3. |
| `TauCetiRoadmap/PlanarTopology/README.md:803–891`, this PR head; ownership at 682 | Layer 5 supplies compact Radó/Hauptvermutung, not general noncompact Radó. Generic PL/chart reconciliation remains GT's. |
| `TauCetiRoadmap/RiemannianGeometry/README.md:73–84`, supplied head | Consumes GT normal/tubular, curvature, volume and models; is a consumer for those objects. |
| `TauCetiRoadmap/HomotopySpheres/README.md:86–92`, supplied head | Consumes GT gluing, surgery, cobordism and smooth triangulation. |

### Seeded sources within the delta

The 15 repeated seeded labels fall in the unchanged audit or Layer 11's changed “What to build” block. The smoothing-and-triangulation comparison itself is unchanged. Its original verification limitations are carried below, not silently certified. The new block has no exact source locator (R21); I verified the compactness input against the legally fetched author copy of [Hatcher, Algebraic Topology](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf): Appendix Proposition A.1, printed p. 520 (`hatcher-at` lines 22524–22550). Its subcomplex discussion supports the subspace topology needed for factorization. Section 2.2's cellular boundary discussion, printed pp. 140–141 (`hatcher-at` lines 6081–6110), identifies generators using characteristic maps, explaining why the new sign needs an orientation convention. The finite-vertex assertion follows by taking the union of vertices of finitely many simplices. The calculations in Δ1–Δ19 are independent explicit controls.

## Not verifiable

No new unreadable source blocks this incremental review. The added block provides no locators for contiguity, the ball-to-simplex choices or the ordered cellular comparison, so those exact claimed locators cannot be certified; R21 requires them. Hatcher was obtained through the sources service, not copied into this repository. No manifest was edited.

The unchanged previous-source limitations remain carried from [the previous report](PRREVIEW-GeometricTopology~1.md), rather than triggering a repeat full source search: palais1960 (AMS access), whitehead1940 (no legal text located), munkres1966 (book not obtained), kirbysiebenmann1977, kirby1969, hatcher1983 and thurston-norm (previous image-only/OCR limitation), brown1962 (institutional timeout), quinn1982/freedman1982/gabai1987 (unusable Euclid retrieval), burde2003/birman1974/rolfsen1976/lee-riemannian/thurston-geometry/ratcliffe/candel-conlon-1/candel-conlon-2 (no readable legal book located), freyd1985/gompf1999 (metadata only), scott (publisher denial/institutional shell). OCR is available now, but these unchanged locators were not reopened in this limited re-review. The previous uncertified paywalled entries hirsch, lee2013, rourke1972, lickorish1997, kauffman1987, moise and zeeman remain settled. Freedman–Quinn's original versus reformatted numbering remains unmatched. None of these carried limitations is being claimed as a new retrieval failure or as evidence that a theorem is false.

No second full adversarial or open-roadmap audit was performed on unchanged targets; the explicitly attributed prior rows and findings carry that evidence. The verdict already follows from unrepaired mathematical defects and the failed gate.

## Source issues

- **Error** in livingston2005 at §3.1, printed page 7: the source says averaged signatures have image exactly the even integers for every nonidentity unit parameter; it should be allow odd averages at Alexander roots; evenness applies at nonsingular parameters; affects a stated result.

This source issue is carried from the previous report, not newly rediscovered. No new source error was found in the inspected Hatcher passages.
