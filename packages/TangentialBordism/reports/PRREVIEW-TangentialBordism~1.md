# Review of TangentialBordism (pull request #942 at a33b21c)
**Verdict:** needs changes

Eight findings, four blocking (one P1 and three P2). The supplied gate passes, and independent Lean elaboration succeeds with only the intended `sorry` warning. The blocking issues below concern ownership, hypotheses and missing acceptance statements; a successful build does not resolve them. No pull-request file was changed.

## R01 (P1) — Break the reciprocal roadmap dependencies

**Location:** `TauCetiRoadmap/TangentialBordism/README.md:40–42`, also 677–680 and 1599–1603. The supplier table consumes FourManifolds' early K3/filling constructions and StringOrientation S1.

**Claim:** Separating an early supplier lane from later consumers inside the same roadmap permits these imports.

**Witness:** `TauCetiRoadmap/StringOrientation/README.md:229` consumes TangentialBordism B5; `TauCetiRoadmap/FourManifolds/README.md:774` consumes its B4 and line 791 its B3.2. These give two directed two-roadmap cycles, even if the individual mathematical targets can be scheduled.

**Repair:** Move the early String obstruction/lift construction to an earlier owner (for example CharacteristicClasses), and move the early FourManifolds examples to an earlier owner or this roadmap, with the later roadmaps consuming them. Repoint these imports to the resulting owners. Test the repaired graph on both pairs: each must have only one direction of supply. Merely calling a section “early” leaves both cycles intact. This follows the brief's whole-roadmap supply rule, not an assertion that the displayed target-level proof routes are mathematically circular.

The requested mechanical check prints `depcheck: 200 roadmaps, 1322 edges, 0 problem(s)`. It does not expose these reciprocal edges in the supplied open heads; the concrete citations above are the witness. StringOrientation is explicitly before TangentialBordism in the supplied order. FourManifolds is absent from main and the order; absence itself is not a finding, but placing it after its TangentialBordism supplier cannot also make it an earlier supplier of TangentialBordism.

## R02 (P2) — Import the existing free proper quotient construction

**Location:** `TauCetiRoadmap/TangentialBordism/README.md:221–229`, including its ownership assignment at line 33.

**Claim:** B1.6 owns free proper smooth quotients and their principal-bundle/submersion comparison.

**Witness:** `TauCetiRoadmap/SmoothBundlesConnections/README.md:360–374` at the supplied open head assigns exactly this construction to B1.4, including G/H and reuse of native discrete quotients. SmoothBundlesConnections precedes TangentialBordism.

**Repair:** Delete this generic construction as a target here; cite SmoothBundlesConnections B1.4 in the ownership and supplier contracts, retaining only the additional bordism-specific adapters. Test the interface on ℤ acting on ℝ and on the Hopf circle action on S³: the imported quotient gives S¹ and CP¹ respectively, with the required principal projections. GeneralizedCohomology and CharacteristicClasses already consume this owner; constructing another quotient would split their common carrier.

## R03 (P2) — State the odd Borel hypothesis as a simple system, not a truncated algebra

**Location:** `TauCetiRoadmap/TangentialBordism/README.md:834–850`, especially the algebra hypothesis and its K(Z/p,1) Check.

**Claim:** The K(Z/p,1) path-loop example satisfies the displayed tensor product of truncated polynomial algebras, using y, y^p, y^(p²), … as generators.

**Witness:** At p=3, H*(K(Z/3,1);F₃)=Λ(x)⊗F₃[y] has y³≠0. In the stated truncated factor, the cube of its degree-two generator is zero. Both sides have different multiplication in degree six.

**Repair:** Define and use the appropriate p-simple system of transgressive elements: the ordered monomials with even-generator exponents less than p form a vector-space basis, with multiplication retaining the relations between successive powers. Do not assert an algebra isomorphism to independent truncated factors. Give the exact Borel theorem locator and its remaining hypotheses. Recheck p=3: y³ is the next simple-system element, not zero, while the new base class βι₂ is odd and has square zero. This repairs the applicability defect without changing the intended Cartan computation. The algebra counterexample is independent of access to McCleary.

## R04 (P2) — Include the statable finite Arf classification headlines

**Location:** `TauCetiRoadmap/TangentialBordism/README.md:469–479`; `TauCetiRoadmap/TangentialBordism/Suggested.lean:7–16,90–96`.

**Claim:** Basis independence is the only headline theorem statable at the pins.

**Witness:** The promised intrinsic Gauss-sum identity and Arf-zero/Lagrangian equivalence use the retained quadratic-form/Arf definitions and native finite sums, `Submodule` and `Module.finrank`. Both full signatures elaborated in a scratch copy, with only `sorry` warnings.

**Repair:** Add these substantive finite quadratic classification statements to `Suggested.lean`, rather than classifying them as unavailable. A native form of the latter is: for nondegenerate polarization and dim V=2m, Arf(q)=0 iff there exists U≤V with dim U=m and q restricted to U identically zero. The Gauss sum can be expressed over ℤ as ∑v (if q(v)=0 then 1 else −1)=(if Arf(q)=0 then 2^m else −2^m). A `Fintype V` choice is available for this finite-dimensional F₂ space. Tested values: dimension zero gives 1=1; the hyperbolic plane gives 2=2 and a one-dimensional zero subspace; the anisotropic plane gives −2=−2 and no such subspace. These are general classification targets, not extra small-value Checks.

## R05 (P3) — Remove unrelated carrier and API padding from the acceptance file

**Location:** `TauCetiRoadmap/TangentialBordism/Suggested.lean:100–185`.

**Claim:** The acceptance file may retain selected native carrier/interface shapes alongside its only stated headline.

**Witness:** None of `ClosedCycle`, `BundleClassifierIsoData`, either hypersurface, either Adams abbreviation or `moOddGeneratorDimension` occurs in the Arf theorem. `ClosedCycle.map_f` and `ClosedCycle.sum_f` already close by `rfl`.

**Repair:** Delete this block from `Suggested.lean`; keep its mathematical constructions and API in the README. Do not prove the padding in place. The Arf acceptance statement and both R04 signatures still elaborate after these unrelated declarations are removed. Keep only the few definitions and supporting construction needed to state the finite Arf headlines; the missing geometric and spectral carriers belong in the module docstring. The one admitted theorem was separately probed with `rfl`, `simp` and `infer_instance`; it did not close and is not being called padding.

## R06 (P3) — Replace the incorrect Milnor hypersurface citation

**Location:** `TauCetiRoadmap/TangentialBordism/README.md:1634–1636`.

**Claim:** Milnor's 1960 Part I supplies the real/complex (1,1) hypersurfaces and their geometric local generator criterion.

**Witness:** `milnor1960` lines 29–52, 62–66 and 560–591 describe the spectral/cohomological computation and odd-torsion theorem. The complete Part I contains no construction of these incidence hypersurfaces or their asserted Newton-number formulas.

**Repair:** Retain this paper for the results it supplies (notably §4, Theorems 4–5, printed p.519), and cite an actual construction/formula source at an exact locator for B4.6 and B6.1. Verify that locator on H_R(2,4), whose top Newton number is 15 mod 2=1, and H_C(2,3), whose Pontryagin Newton number is −10. A correct calculation does not repair an incorrect attribution; the new locator must support these constructions and hypotheses.

## R07 (P3) — Supply target-level locators and the source manifest

**Location:** `TauCetiRoadmap/TangentialBordism/README.md:281–332,462–499,913–1186,1623–1675`.

**Claim:** The reference list adequately locates the many theorem and construction targets.

**Witness:** B3.2(a)'s Gauss sum and Lagrangian criterion have no source locator; B5's arbitrary-structure finite inverse has none. The folder contains README.md, Suggested.lean and metadata.toml, but no sources.toml. Most references lack theorem/page locators.

**Repair:** Attach precise legal-source locators to individual targets, distinguish extensions proved here from the cited theorem's own generality, and supply the required sources manifest. For example, Thom IV.8, p.75 supports the classical stable coefficient comparison, not by itself the full arbitrary-ξ, arbitrary-pair statement. Preserve the finite/CW and stabilization hypotheses when connecting it to B5. Use the source audit below to avoid treating unread texts as certified. In particular, state a source for the finite Arf package rather than attributing it implicitly to the bordism bibliography.

## R08 (P3) — Restore the required layer, API and Check structure

**Location:** `TauCetiRoadmap/TangentialBordism/README.md:1–16,101–280,708–912,1560–1621`.

**Claim:** The numbered B1–B6 narrative and final acceptance paragraph suffice as the roadmap structure.

**Witness:** There are no `## Layer k`, `### Examples` or `### Dependencies` sections. Only B4.7 has an explicit Checks list, containing two bullets. The classifier, cycle, Arf and incidence definitions lack their required three discriminating Checks.

**Repair:** Preserve the mathematics while arranging the required opening Summary, Scope and ownership, Conventions, Exact supplier contracts and build-order explanation. Give each definition its own prose API and at least three discriminating Checks, each theorem its hypotheses/locator and specific Needs line, and each layer Examples and Dependencies. Order the layers by their actual supply (the present B3 uses B4–B6). Suitable existing and newly computed tests include the zero/hyperbolic/anisotropic Arf forms; incidence vanishing on (e₀,e₁) versus nonvanishing on (e₀,e₀); and signed points over different components. This is not a request to move those Checks into Lean.

## Verified sound

### Scope, gate and elaboration

Read the whole 1,675-line README and 187-line Lean companion, the repository writing/review rules, and main's AlgebraicTopology, GeneralizedCohomology and GeometricTopology for shape and ownership. Confirmed the requested head and an empty diff-stat outside this roadmap. TangentialBordism is not an existing roadmap on the supplied main, so the review does not reject its scope as a re-planning. No route-specific prime restriction, computational-algorithm target, sorry-valued data, `set_option` or admitted example was found in the reviewed files. The prime-local computations explicitly return to integral results.

The supplied gate reports every scanner, metadata, dependency and targeted-build check passing. Independently ran the permitted dependency command; its complete output is:

```text
depcheck: 200 roadmaps, 1322 edges, 0 problem(s)
```

Built only `TauCeti.LinearAlgebra.BilinearForm.SymplecticBasis`, then ran `lake env lean` on the requested Suggested.lean. The build succeeded; elaboration emitted one warning, for its admitted Arf theorem. Appended `#check @name` for all 19 explicitly written declarations to one scratch copy and elaborated it. Finite dimension, nondegeneracy, module, topology and bundle hypotheses remain in the appropriate signatures; no silently lost needed binder was identified. `ClosedCycle` lives in the larger universe predicted by its manifold carrier, consistently with B1.4's warning that a small quotient still needs construction. No statement was changed in the pull request.

The sole admitted theorem was tested in a separate copy with the one-tactic alternatives `rfl`, `simp`, `infer_instance`; none solved it. Its nontriviality is also visible in the basis changes below. The two R04 native signatures elaborated. Native spectra, Thom spectra, geometric bordism relations/groups and KO spectra were not found by object searches at these pins; the docstring's corresponding omissions are justified. This absence does not apply to the finite Arf classification.

Pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

### Headline acceptance coverage

The README's end-theorem families are geometric bordism as a homology theory and its finite/stable Pontryagin–Thom comparisons (B2/B5); the finite Arf classification and Spin-surface filling classification (B3.2); the low O/SO/Spin tables and ABS/Dirac comparison (B3.0–4); the compact Cayley-plane identification and characteristic numbers (B3.6–9); the ordinary Steenrod/Adams package, MO polynomial ring and characteristic-number detection (B4); the rational and integral SO ring and realization range (B6.1–3); the projective-transfer descriptions and integral Spin-to-KO point kernel (B6.4–6). The module docstring names the unavailable geometric, spectral, Steenrod, KO and Albert carriers for these families. Finite Arf basis independence is stated; its Gauss-sum and Lagrangian classification are also statable, as R04 demonstrates. The docstring should additionally name the realization-range and transfer-image headlines explicitly instead of relying on a generic list of missing spectral carriers.

### Pinned declarations opened

| Declaration/object | Repository-relative locator | What the inspection establishes |
| --- | --- | --- |
| `SingularManifold` | `Mathlib/Geometry/Manifold/Bordism.lean:110` | Compact, boundaryless charted source and continuous parameter map; no Hausdorff field. |
| `SingularManifold.map`, `.prod`, `.sum` | same file:147,238,247 | Source-preserving pushforward; product at a point; disjoint union on a fixed model. |
| `ChartedSpace.secondCountable_of_sigmaCompact` | `Mathlib/Geometry/Manifold/ChartedSpace.lean:236` | The Euclidean compact-source application used by the companion is valid. |
| `Orientation.map_of_isEmpty`, `Orientation.eq_or_eq_neg_of_isEmpty` | `Mathlib/LinearAlgebra/Orientation.lean:116,217` | Zero-dimensional linear maps preserve both rays; a negative point orientation is not another empty basis. |
| `exists_embedding_euclidean_of_compact` | `Mathlib/Geometry/Manifold/WhitneyEmbedding.lean:131` | Compact Hausdorff hypothesis, smooth closed embedding and injective derivative; no prescribed-boundary extension supplied. |
| `QuadraticMap.polar_self` | `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:311` | Self-polarization is 2q(x), hence zero in characteristic two. |
| `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J`, `.even_finrank` | `TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean:301,309` | Native finite-dimensional nondegenerate alternating basis and even dimension; Arf invariance is additional. |
| `Projectivization`, `.submodule` | `Mathlib/LinearAlgebra/Projectivization/Basic.lean:48,103` | Actual projective quotient and its line; the incidence subtype is not a free predicate. |
| `CategoryTheory.SpectralSequence` | `Mathlib/Algebra/Homology/SpectralSequence/Basic.lean:36` | Integer-indexed native pages; the proposed d_r shift (r,r−1) decreases the stem by one. It carries no convergence theorem by definition. |
| `Rep.FiniteCyclicGroup.groupHomologyIsoEven` | `Mathlib/RepresentationTheory/Homological/GroupHomology/FiniteCyclic.lean:85` | Positive even degree is ker(norm)/im(g−1); over trivial ℤ this is ker(m)/0=0 for m≥2. |
| `TauCeti.orientationPreservingGroupoid`, `TauCeti.orientable_closedBall` | `TauCeti/Geometry/Manifold/Orientation.lean:178`; `TauCeti/Geometry/Manifold/Instances/ClosedBall.lean:413` | Atlas convention and the explicit 2≤n restriction used in B1.1. |
| `TauCeti.Lie.nonempty_embeddedLieSubgroupData_lieSubalgebraOfSubgroup_of_isClosed` | `TauCeti/Geometry/Lie/Subgroup/Embedded.lean:137` | Native closed-subgroup smooth data exists, so a second Cartan construction is unnecessary. |

The citation resolver's sole missing-name lead, `TauCeti.DivisionOctonionReal`, is **not** a missing-supplier finding: it is a planned export in main's `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:1261`, not claimed here as an implemented pin declaration. Its positive pair multiplication is explicit at lines 1267–1273; the Clifford-volume test below uses that convention.

### Ownership and supplier resolution

Ran `roadmaps grep` by objects (free proper quotients, Pontryagin–Thom, Arf, cup-i/Steenrod and Milnor hypersurfaces), `roadmaps show` for the open quotient supplier, and inspected the provided sibling files and local board packages. Main suppliers were checked on the supplied main, not replaced by an unmerged revision. The board-package index contains no additional plausible bordism owner. Older design text for StableHomotopyKTheoryPartII mentions ownership of Steenrod operations, but its supplied open README now explicitly imports them from TangentialBordism; it is not a surviving duplicate. No duplicate fully qualified declaration name was identified in the readable roadmap companions.

| Supplier/citation resolved | Witness and scope |
| --- | --- |
| AlgebraicTopology Stages 2–4,6,8 | Main README's scope/ownership and corresponding stages provide ordinary chains, CW/cofibration, duality and EM/obstruction interfaces. Ordinary topology is not reconstructed here. |
| DifferentialGeometry 2.1/2.2,5.5,10.2 | Main README:345–355 (orientation quotient), 528 onward (abstract corners), 884–885 (Sard). These named sections exist. |
| GeometricTopology Layer 1, Layer 11, smoothing item 1 | Main README:177–231,868–880,939; collars/partial-boundary gluing/tubes, simplex CW cells, smooth triangulation. Relative face-compatible triangulation is an additional B1.5 target. |
| DGFloer Layer 1 items 2–4 | Main README:130–148,193–226 and Layer 1 provide ordinary Serre sequences, EM and Serre-class inputs, separately from their later Floer uses. |
| GeneralizedCohomology G1–G5 | Main README:542–562 mapping-path model; G3 comparison/covers/completion; G4 quaternionic models; G5.2 collapse, G5.3 diagrams, G5.4 spectra; G5.5 ABS/real index, including line 2084. These are planned interfaces, not pin implementations. |
| CharacteristicClasses C1–C4/C6/C7 | Main README:486–510 gives faithful compact-group representations and smooth principal-bundle comparison; C2 supplies ordinary Thom classes, C3 characteristic classes, C6 character correction, C7 projective/sphere tangent calculations. C1.3 already uses SmoothBundlesConnections B1.4. |
| TopologicalKTheory T1/T3–5/T7 | Main README:1148 onward; coefficient relations at 1245 and complexification at 1263–1266 match the K3 and HP calculations. |
| SpinGeometry G4,G5.0,G6.0,G6.7 | Main README:506,586,655,831 and the dependency explanation at 860 supply real spinors, realizations and the quaternionic-index normalization; these precede geometric ABS comparison. |
| RiemannianGeometry R1 | Main README:280–295 gives the Hopf quotient metric and sectional-curvature bounds 1,4. |
| ClassifyingSpaces Stage 4 | Main README:222–240 identifies BG homology with the native trivial-module group homology. |
| LieHighestWeight Layer 8; LieGroups Layers 2,4; SpinRepresentations Layer 7 | Main LieHighestWeight README:1255–1398 gives the compact division/Albert algebra and derivation comparisons; LieGroups README:275,326 gives closed subgroups/integration; SpinRepresentations L7 supplies Clifford/Spin comparisons. |
| DGAInfinity Layer 0 | Main README:263 onward provides signed graded tensor infrastructure; this is distinct from an ungraded Hopf category. |
| IntegralLattices | Its main README owns integral/real lattice algebra. The citation here lacks a section; the finite-F₂ quadratic refinement is explicitly a different object owned in B3.2. |
| FourManifolds F7.0/F7.0b | Supplied open README:1248–1273 contains K3 and E(1)-complement data; reciprocal imports at 774,791 give R01. |
| StringOrientation S1 | Supplied open README:61 onward contains λ, mapping-path fibre and lift torsor; its B5 import at 229 gives R01. |
| IndexTheory I2/I5/I7 | Supplied open README's analytic embedding and signature lanes; 863–876 supplies σ=−16α and explicitly avoids bordism classification as an input. |
| SmoothBundlesConnections B1.4 | Supplied open README:360–390, an earlier owner; R02. |
| HomotopySpheres; BordismFormalGroups; String/elliptic; PSC | Checked as ownership exclusions/consumers, not new supplier edges for their later applications. The readable HomotopySpheres and StableHomotopyKTheoryPartII heads import the finite Arf/framed PT and Steenrod packages respectively. |

### Source sample and exact text checks

No actual sampled target identifiers were supplied: the brief says “none found by heading.” To avoid inventing a worker sample, I independently selected 15 top-level numbered items with `random.Random(int(head,16)).sample`, from the ordered B1.1–6, B2.1–4, B3.0–9, B4.1–8, B5.1–7, B6.1–6 inventory. The selection is listed below. No README locator is explicitly marked unverified. Missing precise locators are recorded rather than silently certified.

All 18 cited works, including Kirby mentioned in the body, were attempted through the source service. Nine texts were obtained legally; two were returned uncertified; seven remain unread. The source manifest was not edited. Printed page numbers below are distinguished from extraction page markers, which sometimes split a printed page.

| Sample target | Source/locator audit |
| --- | --- |
| B1.1 | Native orientation witnesses above verified. No exact literary locator for the full chart/frame/corner comparison. |
| B1.6 | Lee Thms 21.10/21.13 and Ch.6 named, but service returned uncertified. Ownership independently refuted by R02. |
| B2.3 | No target-level locator for geometric LES/excision/arbitrary pairs. Not certified from a general bibliography. |
| B2.4 | Signed count computed below; no exact source locator for all relative/intersection comparisons. |
| B3.2 | Algebra exhaustively tested in dimensions 0,2,4; no locator for the Arf classification or geometric surgery theorem. |
| B3.5 | Boundary dimensions and quaternionic sign recomputed; no exact locator supplied, and Stong could not be read. |
| B3.8 | Borel–Hirzebruch §19.4, printed p.535: `borelhirzebruch` lines 2999–3026 gives p₂=6u,p₄=39u² and the u² orientation. Supports these values, not all proposed clutching/lift constructions. |
| B4.6 | Thom IV.12, printed p.79: `thom1954` lines 2605–2627 supports polynomial degrees and low examples. Milnor Part I does not supply the claimed hypersurface construction: R06. |
| B5.1 | Thom's classical collapse context is available; no exact arbitrary-ξ classifier/normal-homotopy locator supplied. |
| B5.2 | Finite nonabelian word example checked below. No exact source for the full arbitrary-CW structured inverse at fixed codimension. |
| B5.4 | Thom IV.8, printed p.75, `thom1954` lines 2462–2472 supports classical stabilized coefficients; it does not state all arbitrary-space/pair naturality in this item. |
| B5.5 | Framed signed-count check computed; the complete generic framed theorem has no local citation. |
| B5.6 | “State the actual … hypotheses” leaves some umkehr/support/base-change targets unspecified; no source theorem to compare at this generality. |
| B6.1 | Thom IV.17, printed p.84, `thom1954` line 2774 onward supports rational oriented coefficients. Milnor §4, Thm 5, p.519, `milnor1960` lines 575–591 supports no odd torsion and number detection. Geometric Newton representatives need the replacement citation in R06. |
| B6.4 | Führing §3, printed pp.359–361, `fuhring2022` lines 182 onward gives the fibre-bundle transfer construction; it does not by citation alone supply every arbitrary-pair/coherent-family extension requested here. |

Additional checks: Baez arXiv v4 §§3.4/4.2, printed pp.31–32,39–40 (`baez2002` lines 1380–1466,1779–1813) supports trace-one idempotent charts and the F₄/Spin(9) identification. Borel–Hirzebruch §19.5, p.535 (`borelhirzebruch` lines 3027–3031) gives signature one. Miller Ch.1 §12, Thms 12.3–12.4, pp.32–33 (`miller` lines 1239–1262) supports the A-free calculation and additive MO splitting. Führing Thms 1.1/1.3 and Remark 1.4, pp.355–356 (`fuhring2022` lines 18–20,54–78) supplies the CP² transfer and the effective semidirect structure group. Kreck–Stolz §4, Prop.4.2/Lemma4.3, pp.244–245 (`kreckstolz1993` lines 480–531) supports exactly the HP² Newton formula, orientation and gcd used below. Rosenberg–Stolz Thm3.3, manuscript pp.8–9 (`rosenbergstolz` lines 302–354) states the point kernel, specifies PSp(3), and distinguishes its 2-primary proof from the odd-prime input. This is corroboration, not certification of the unread Stolz/ABP primary calculations. Thom III.2–4, pp.59–60, Cor.III.7/TheoremIII.9, pp.61–63 (`thom1954` lines 1818–1828,1894–1962) supports the realization range and lens-space obstruction. Adams–Atiyah §1 was fetched, but its theorem is an ownership exclusion here rather than a B1–B6 acceptance target.

### Adversarial mathematics table

These are computed instance tests, not proofs of the universal targets. A row marked consistent records only the displayed calculation. Every top-level B1–B6 item, the sampled items, the headline families and the finding targets appear below; compound paragraphs are split where they introduce a separate formula or normalization. Statements with unspecified hypotheses or unavailable source proofs remain subject to the limitations below. Ring/DVR/inseparability tests have no role in these fixed real-manifold and F_p statements; relevant characteristic-two, odd-prime, rank-zero, empty, disconnected, boundary and nonabelian tests are included.

| Statement | Instances tried | Values on the two sides / discriminating result | Result; change |
| --- | --- | --- | --- |
| B1.1 ordered model transport | p=q=1; p=0,q=1 | Block swap determinant −1 versus (−1)^(1·1)=−1; identity block has determinant 1 | Consistent |
| B1.1 orientation rays at a point | Positive and negative 0-point | Empty-basis orientation +; other ray −; automorphism sends (+,−) to (+,−) | Consistent; SO(0) alone would retain only one choice |
| B1.1 chart orientation | [0,1], its two endpoints | Coordinate derivatives have signs + and −; signed boundary is −[0]+[1] | Consistent with n=1 exception |
| B1.1 point reversal/products | +pt,−pt | Reversal +1↦−1; (−1)(−1)=+1 | Consistent |
| B1.2 cylinders/gluing | Positive interval; concatenate two intervals | Boundaries [1]−[0] and [2]−[1] sum to [2]−[0] | Consistent; common face cancels |
| B1.2 empty witnesses | Empty source | ∂∅=∅ and count 0=0 | Consistent |
| B1.3 relative free face | ([0,1],{0,1}) mapped identically | Relative boundary (−1,+1); inclusion to connected interval sums to 0 | Consistent; omitting free-face data fails |
| B1.3 forgetting structures | Signed pair +pt,+pt | SO count 2; O count 0=2 mod 2 | Consistent |
| B1.4 small representatives | One point versus arbitrary source universe u | Embedded point code is a subset of ℝ⁰; bundled type has universe max(u+1,v), not u | Consistent with stated small-quotient obligation |
| B1.5 finite quotient | Antipodal S¹ action | Two preimages per quotient point; quotient S¹, not a point | Consistent |
| B1.5 mapping torus | Identity on a point; reflection of an oriented circle | First gives S¹; second gives Klein bottle with nonzero orientation monodromy | Consistent; orientation data cannot be dropped |
| B1.5 disk/sphere bundles | Trivial rank 1 over a point | Disk interval; sphere boundary has two points of opposite signs | Consistent |
| B1.5 relative triangulation | Triangulated interval | Two 0-cells and one 1-cell; boundary subcomplex has two 0-cells | Consistent example; extension theorem not source-certified |
| B1.6 free proper quotients | ℤ↷ℝ; irrational ℝ↷T² | Quotient S¹ Hausdorff in first case; dense orbits/non-Hausdorff quotient in second | Correct hypotheses; duplicate owner R02 |
| B1.6 neat embedding | [0,1] as a semicircle in ℝ×[0,∞) | Interior height >0, endpoint heights 0; boundary intersection exactly two points | Consistent; prescribed extension requires its stated stabilization |
| B1.6 transversality | F(x,s)=x−s; zero map to ℝ, Z={0} | First derivative in x is 1 and fibres are points; zero map derivative 0 is not transverse | Consistent hypotheses |
| B1.6 relative approximation | Constant map; already smooth map on C=M | Constant stays constant; rel-M homotopy has identical endpoint map | Consistent boundary case, not a general proof |
| B1.6 corner rounding/double | Square; double an interval | Rounded square has one boundary circle; doubled interval is S¹ with Euler characteristic 0=2·1−2 | Consistent |
| B1.6 compact neighbourhood | K=[−1,1]⊂ℝ, exhaustion x² | Sublevel at 4 is [−2,2], containing K in its interior; boundary derivative ±4≠0 | Consistent |
| B2.1 quotient/inverse | Two unoriented points; signed pair | O:1+1=0 via interval; SO:+1−1=0 | Consistent |
| B2.1 homotopy invariance | Point maps joined by a path; points in different discrete components | Path gives interval witness; in {x,y}, coordinates (1,0) and (0,1) differ | Consistent; arbitrary equality of point maps fails |
| B2.2 product/Koszul sign | Two oriented circles | Swapping tangent directions has determinant −1=(−1)^(1·1) | Consistent |
| B2.2 connected sum over X | Two cycles over x,y in discrete X | No path x→y; disconnected source classes retain two distinct component supports | Stated path restriction excludes wrong operation |
| B2.3 LES/excision | (I,∂I) | H₁(I,∂I)=ℤ; boundary sends 1 to (−1,1); next map sends it to 0 | Consistent normalization |
| B2.3 disjoint union/continuity | Countably many isolated points | Compact 0-cycle has finitely many points, yielding ⊕ℤ rather than ∏ℤ | Consistent finite-support test |
| B2.4 orientation maps at a point | Counts 0,1,−1,2 | Integral images 0,1,−1,2; mod-2 images 0,1,1,0 | Consistent with unit and forgetting |
| B2.4 intersection | Two distinct projective lines in RP² | One transverse intersection; mod-2 evaluation 1=⟨a²,[RP²]⟩ | Consistent without target orientability in O case |
| B3.0 real ABS/complexification | ±pt; complex K3 | Index ±1; K3: −p₁/24=2, c(a)=2u² | Consistent; zero genus would fail point/K3 tests |
| B3.0 Thom correction | Trivial normal bundle | Â(ε)=1, hence correction 1 and Thom unit unchanged | Consistent normalization; not a proof for nontrivial bundles |
| B3.1 coefficient table n=0,1 | Point; bounding/nonbounding circles | ΩSO₀=ℤ, ΩO₀=F₂; O/SO circles bound, Spin circles distinguished by 0,1 | Consistent low cases |
| B3.1 coefficient table n=2,3 | RP²; odd Spin torus; S³ | RP² SW number 1; torus Arf 1; S³ bounds D⁴ giving class 0 | Consistent examples; spanning/Spin₃ vanishing require listed deep inputs |
| B3.1 degree four O table | RP⁴; RP²×RP²; CP² | (w₁⁴,w₂²,w₄)=(1,0,1),(0,1,1),(0,1,1) respectively | Distinguishes two generators and checks CP² comparison |
| B3.1 SO/Spin degree four signs | CP²; complex K3; reversed K3 | Signatures 1,−16,+16; σ/16 on K3 and its reversal is −1,+1 | Consistent |
| B3.1 oriented 3-parallelization | ℝ³, T³, S³ | First two have constant coordinate frames; S³ has three left-invariant independent fields | Consistent existence examples; noncompact/boundary extension not independently proved |
| B3.2(a) zero space | m=0, q=0 | Arf=0, sum=1, zero count=1, zero Lagrangian dimension=0 | Consistent; avoids negative-exponent zero-count formula |
| B3.2(a) hyperbolic plane | q(x,y)=xy | q-values 0,0,0,1; Arf=0; sum=2; zeros=3=2+1 | Consistent; all six symplectic bases give 0 |
| B3.2(a) anisotropic plane | q=x²+xy+y² | q-values 0,1,1,1; Arf=1; sum=−2; zeros=1=2−1 | Consistent; all six symplectic bases give 1; zero map excluded |
| B3.2(a) basis independence/additivity | H⊥H,H⊥A,A⊥A in dimension 4 | Respectively Arf 0,1,0; Gauss 4,−4,4; zero counts 10,6,10; all 720 symplectic bases in each case agree | Consistent exhaustive finite tests; R04 |
| B3.2(a) nondegeneracy hypothesis | q=0 on F₂² | Polarization matrix 0; cross pairing 0≠1 required by symplectic basis | Wrong degenerate model excluded |
| B3.2(b) geometric refinement | Disk-bounding curve; Lie torus basis a,b | q(disk)=0; q(a)=q(b)=1, intersection a·b=1, hence q(a+b)=1 | Consistent polarization |
| B3.2(c) filling | Arf-zero versus odd torus | Hyperbolic form has three zero vectors and a zero line; anisotropic form has only zero, so no zero line | Discriminates surgery input; geometric realization still a target |
| B3.3 Lie-spin T³ | Product of three nonbounding framed circles | Framed class η³=12ν, order 2 in ℤ/24; Spin image in degree 3 is 0 | Consistent framed/Spin distinction; actual filling from named supplier |
| B3.4 low ABS comparison | K3, K3×K3 | α(K3)=a; α(K3²)=4b; at odd p,4 is a unit; at p=2 it is not | Consistent need for separate 2-primary proof |
| B3.4 quaternionic-index sign | Complex K3 | σ=−16, α_H=1; −16α_H=−16; 2α_H=Â=2 | Consistent with Index/Spin suppliers |
| B3.5 real projective filling | n=1,2 | D² bounds RP¹; disk line bundle over CP¹ has dimension 4 and boundary RP³ dimension 3 | Consistent dimensions |
| B3.5 complex projective filling sign | n=1,2 | Fibre derivative in (j,k) coordinates [[0,−2],[−2,0]] has determinant −4; total signs −1,+1=(−1)^n | Consistent; reversed D³ orientation gives complex CP¹ boundary |
| B3.6 compact idempotent carrier | E₀; first chart x=1,y=0 | tr E₀=tr E₀²=1; P has 2×2 block all entries 1/2, and P²=P | Consistent; compact norm bounds entries |
| B3.6 wrong split carrier | Null a with N(a)=0 versus positive division norm | Split family has tr A²=1 for all t; positive norm gives 1+2t²N(a)>1 for ta≠0 | Explicitly excluded wrong model |
| B3.6 chart transition | x=2,y=3 real | P pivot ratios (A₀₁/A₁₁,A₂₁/A₁₁)=(1/2,3/2)=(x⁻¹,yx⁻¹) | Consistent ordered coordinates |
| B3.6 CW carrier | Cells 0,8,16 | Euler count 1+1+1=3; no 1/2 cells, so cell model has π₁=0 | Consistent low-cell consequences |
| B3.7 infinitesimal orbit formula | E=diag(1,0,0), x in Peirce 1/2 space | [L_x,L_E](E)=x/4; 4 times gives x | Consistent factor 4 |
| B3.7 Clifford representation | (t,a)=(1,0),(0,1) | Actions (x,y)↦(x,−y),(y,x); squares +Id and anticommutator 0 | Consistent positive Clifford convention |
| B3.7 Clifford volume | All 16 coordinate vectors, supplier's ordered O basis | Product of nine prescribed matrices sends every e_i to −e_i; diagonal sixteen copies of −1 | Computed exactly; agrees with specified volume sign |
| B3.7 quotient/type dimensions | F₄,Spin9,OP² | 52−36=16 | Consistent with Baez; not proof of full stabilizer |
| B3.8 Cayley characteristic numbers | p₂=6u,p₄=39u² | p₂²=36u²; (381·39−19·36)/14175=1 | Consistent BH19.4 and signature normalization |
| B3.8 lift uniqueness | OP² cell cohomology | H²=H³=H⁴=0; w₂=0, λ=0, H¹/H³ torsors each have one element | Consistent Spin/String existence tests; R01 ownership remains |
| B3.9 structure table | RP²,CP²,HP²,OP² | Obstructions respectively w₁=a≠0, w₂=h mod2≠0, λ=u≠0, λ=0 | Distinguishes the four carriers |
| B3.9 HP formula | k=1,2 | k=1: coefficient of u is 4−4=0; k=2: p₁=2u,p₂=7u²; (49−4)/45=1 | Consistent |
| B4.1 higher-diagonal sign | i=1,2 | Right factors 1−T,1+T; left factors dD₁+D₁d,dD₂−D₂d | Consistent periodic-resolution signs |
| B4.1 cup₁ identity | |c|=2, |δc|=3; δc=0 control | Tensor-flip sign (−1)^6=+1; evaluation of dD₁+D₁d gives δ(c∪₁δc)+(δc∪₁δc)=c∪δc−δc∪c; closed control 0=0 | Consistent displayed sign |
| B4.1 Sq normalization | a∈H¹(RP∞;F₂) | Sq⁰a=a, Sq¹a=a², Sq²a=0; Sq¹(a²)=2a³=0 | Consistent identity/top/instability/Cartan |
| B4.2 Steenrod dual | ξ₁,ξ₂ | Degrees 1,3; Δξ₂=ξ₂⊗1+ξ₁²⊗ξ₁+1⊗ξ₂, all terms degree 3 | Consistent normalization |
| B4.2 mod-2 Borel simple system | H*(RP∞)=F₂[a] | Powers a,a²,a⁴ form a binary simple system; a²≠0, so it is not an algebra of square-zero generators | Consistent use of “simple system”; contrast R03 |
| B4.2 Adams differential | (s,t)=(0,3), r=2 | Target (2,4), stems 3→2 | Consistent with Lean integer shape |
| B4.2 completion warning | ℤ/2^∞ Moore spectrum | Quotients by 2^r are 0, but Tate module lim ℤ/2^r=ℤ₂ in derived degree 1 | Correct distinction; no universal convergence proof certified |
| B4.3 Thom/Wu | RP²; T² | RP²:v₁=a,v₂=0 gives w₂=Sq¹a=a²; T² gives all positive w=0 | Consistent |
| B4.4 MO additive splitting | Degrees 0–4 | Non-dyadic partition counts 1,0,1,0,2 match ΩO dimensions | Consistent additive test, does not establish ring structure |
| B4.5 number detection over X | One point in each component of {x,y} | Degree-zero dual classes evaluate (1,0) and (0,1); point-forgetting gives 1 in either case | Correct need for f* a, not just point numbers |
| B4.6 even/odd generators | RP²; H(2,4),H(2,8),H(4,8),H(8,16) | Newton values 3 mod2=1; binomial parities 1,1,1,1; odd dimensions 5,9,11,23 | Consistent computed family; R06 citation |
| B4.6 regular incidence | (e₀,e₁); (e₀,e₀), m,n≥2 | Equation values 0,1; derivative of first in w₀ is 1 | Consistent regular/nonexample test |
| B4.6 orientation | Real H(2,4) | w₁=(3x+5y)−(x+y)=2x+4y=0 mod2 | Consistent orientable odd generator |
| B4.7 odd Bockstein/power | p=3, K(Z/3,2) | |βι₂|=3, (βι₂)²=0; |P¹βι₂|=7; |βP¹βι₂|=8 | Consistent base degrees |
| B4.7 Kudo differential | p=3,k=1 | Source bidegree (3,4), d₅ target (8,0); βP¹z has degree 8 | Consistent bidegree; source theorem unavailable |
| B4.7 truncated-algebra hypothesis | p=3, fibre K(Z/3,1) | Actual y³≠0 in degree 6; asserted truncated factor has y³=0 | Fails application; R03 |
| B4.7 odd Milnor conventions | p=3, i=0,1 | |τ₀|=1, |ξ₁|=4, |τ₁|=5; |P¹β−βP¹|=5 | Consistent degrees/sign convention recorded |
| B4.8 odd Thom formula | p=3, oriented plane | Euler x, P¹x=x³; restriction of (1+x²)U gives x+x³ | Consistent factor exponent p−1 |
| B4.8 odd Adams algebra | p=3 | v₀ stem 0 detects 3; v₁ stem 4; polynomial C excludes degree 4 since 2·1+1=3 | Consistent degree count; no hidden-extension proof certified |
| B4.8 Spin→SO at odd p | Fibre BC₂, p=3 | Positive group homology vanishes because 2 is invertible; H₀=F₃ | Consistent odd equivalence input |
| B5.1 classifier record | Trivial line, identity; zero fibre map | Identity gives fibre equivalence and total homeomorphism; zero map on ℝ has kernel ℝ and cannot be an equivalence | Carrier excludes wrong zero bundle identification; R05 placement |
| B5.1 empty collapse | Empty embedding | Tube absent; all sphere points go to basepoint | Consistent, no nonempty tube assumption |
| B5.2 finite nonabelian PT | Labels a+,b+,a−,b− versus a+,a−,b+,b− | Reduced free words have lengths 4 and 0; commutator versus identity | Consistent; abstract signed counts (0,0) do not detect this |
| B5.2 finite rank zero | n=k=0 | ℝ⁰ has one point; embedded source cardinal ≤1, versus arbitrary abstract finite 0-manifold | Correct exclusion of stable additive model |
| B5.2 finite framed rank one | Signed points in ℝ | Degree +1−1=0; three positive points have degree 3 in π₁(S¹)=ℤ | Consistent group/reflection normalization |
| B5.3 inverse by transversality | Degree-one map S^k→S^k; constant map | Regular preimage one positive point; empty preimage off constant value | Consistent inverse tests; arbitrary-ξ proof not source-certified |
| B5.4 relative block isotopy | θ=0,π/2 and e₀=e₁ | Rotated endpoints (e₀,0),(e₁,0); on common collar first block (cos²θ+sin²θ)e=e, second 0 | Correct fixed-collar formula |
| B5.4a parameter retention | +pt over x,y | PT coordinates (1,0),(0,1); forgetting X gives 1,1 | Consistent; dropping parameter would fail |
| B5.4b boundary square | Oriented interval | Both geometric and suspension boundary give [1]−[0] | Consistent two-term witness |
| B5.4c connective/CW comparison | Point, empty pair, discrete two-point X | Negative coefficients 0; empty relative theory 0; degree-zero SO gives ℤ,0,ℤ² respectively | Consistent required normalization; full transformation not proved by tests |
| B5.4c complex cofinal diagram | r=0 and one stabilization pair | Real ranks 0,1,2; complex trivial line realifies to two ordered real lines | Consistent shift; not a fixed-rank MT substitution |
| B5.5 framed stable comparison | +pt and −pt | Stable degrees +1,−1; interval difference 0 | Consistent unit/sign |
| B5.6 umkehr/duality | Identity of an oriented point | Dimension shift 0, identity sends 1→1; projection formula 1·1=1 | Normalization only; general hypotheses insufficiently specified |
| B5.7 AHSS | X=pt; total degree 0 | E₂ has only p=0 column; Ω₀ survives with one filtration step | Consistent; does not infer general collapse |
| B6.1 rational SO ring | Degrees 4 and 8 | Partition ranks 1 and 2; CP² signature1, CP⁴ and CP²×CP² each signature1 but distinct number vectors | Consistent rank/genus separation |
| B6.1 Newton/gcd | CP⁴,H_C(2,3); N=5,9,15 | s₂ values 5,−10; gcd binomial rows 5,3,1 respectively | Consistent local criterion; R06 |
| B6.1 signature boundary | ∂D⁵=S⁴ | H²=0 so signature0, as boundary theorem requires | Consistent |
| B6.2 Wall exact sequence | Degree zero; reflection on MSO₀=ℤ | 1−ρ=1−(−1)=2; coker(2)=F₂ | Consistent monodromy factor |
| B6.2 dual derivation | σ₂,σ₄ | ∂₂σ₂=1, ∂₂σ₄=σ₂, hence ∂₂²σ₄=1≠0 | Correctly not called a differential |
| B6.2 Wall homology algebra | F₂[e,o], δe=o, δo=0 | δ(e²)=0, δ(e)=o; homology generated by e² | Consistent elementary factor |
| B6.2 CP versus squared RP | n=1,2 | CP¹ and torus all SW numbers0; CP² and RP²×RP² have (w₂²,w₄)=(1,1) | Consistent low comparison |
| B6.3 realization n≤6 | Cyclic m=2,3; degree 6 | ker(m:ℤ→ℤ)=0, so H₆(BC_m;ℤ)=0; H₀ target of d₆ detected by components | Consistent proof input at both small primes |
| B6.3 degree-seven obstruction | L⁷(3)×L⁷(3) | Product of the two displayed classes is −v₁v₂u₁³u₂³; coefficient −1=2 mod3≠0 | Consistent sign and nonzero obstruction |
| B6.4 transfer | Trivial G and bundle over a point | Total space F, transfer [pt]↦[F], degree increases by dim F; empty base gives 0 | Consistent normalization; full construction/source extensions not certified |
| B6.5 projective transfers | n=1,2,4,5 | Negative-domain n=1 gives image0; RP² fibre gives O generator in degree2; CP² gives SO generator in degree4; conjugation contributes the degree5 branch | Consistent need for full structure group; no primary 2-local proof certified |
| B6.5 semidirect convention | Conjugation and scalar i | conjugation·i·conjugation⁻¹=−i≠i; CP² conjugation degree (−1)²=1 | Correct normal/noncentral distinction |
| B6.6 Spin lift of HP² action | Central isotropy path | Two 2π rotations give 1+1=0 in π₁SO8=ℤ/2 | Consistent descent test |
| B6.6 positive scalar estimate | HP², dim8 | 8·7·1=56≤Scal=128, hence positive | Consistent; index-zero follows conditionally on analytic comparison |
| B6.6 fibre Gysin | Restrict BH→BG to point | H*(HP²;F₂)=F₂[u₄]/u₄³; integrals of 1,u₄,u₄² are 0,0,1 | Consistent degrees and normalization |
| B6.6 elementary-subgroup coordinates | Set x₁=x₂=0 | t₂=t₃=0; s₁=y₂⁴,s₂=y₁⁴; t₈=y₂⁸+y₁⁴y₂⁴+y₁⁸, t₁₂=y₁⁴y₂⁴(y₁⁴+y₂⁴) | Nonzero polynomial controls; consistent |
| B6.6 Sq table on t₂ | Exact polynomial over F₂[x₁,x₂,y₁,y₂] | Sq¹t₂=x₁²x₂+x₁x₂²=t₃; Sq²t₂=t₂²; both residual polynomials 0 | Consistent restriction calculation |
| B6.6 Sq table on t₃ | Same polynomial ring | Sq¹t₃=0; Sq²t₃=t₂t₃; both residual polynomials 0 | Consistent restriction calculation |
| B6.6 Sq table on t₈ | Its 32-monomial restricted polynomial | Sq¹t₈=0 and Sq²t₈=0, each with 0 surviving monomials | Consistent; global equality still needs injectivity |
| B6.6 Sq table on t₁₂ | Its 46-monomial restricted polynomial | Sq¹t₁₂=0; Sq²t₁₂+t₂t₁₂=0 | Consistent; global equality still needs injectivity |
| B6.6 adjoint SW generators | Product (1+t₂+t₃)³ ∏ₛ(1+t₂+t₃+s), s=s₁,s₂,s₁+s₂ | Degree-8 and degree-12 components have 35 and 53 monomials; subtracting t₈+t₂⁴ and t₁₂+t₂⁶+t₃⁴ respectively leaves 0 | Consistent exact polynomial comparison |
| B6.6 BH cubic relation | Substitute t₈=u₄²+u₈, t₁₂=u₄u₈ | u₄³+(u₄²+u₈)u₄+u₄u₈=0 in characteristic 2 | Consistent relation; does not prove freeness |
| B6.6 A(1) polynomial decomposition | f=1,t₂; coefficient t₁₂² | Sq²(t₁₂)=t₂t₁₂; Sq²(t₂t₁₂)=(t₂²+t₂²)t₁₂=0; Sq¹ and Sq² of t₁₂² both 0 | Consistent twisted summand and coefficient ring |
| B6.6 vertical w | Base point u₂=u₃=0 | Relation u₈=u₄² gives w=1+u₄+u₄², matching HP² reductions of p₁/2 and Euler parity | Consistent restriction; full BG ring/Sq table not certified |
| B6.6 KO-Pontryagin class | Oriented real plane E | λ_t(E−2)=1+([E]−2)t/(1+t)²; π₁=[E]−2, π_i=0 for i>1 | Consistent generating-series normalization |
| B6.6 connected-cover shifts | Partitions empty,(2),(3) | k=0,8,10 respectively; not 0,8,12 | Consistent explicit odd n(I) correction |
| B6.6 Ext/KO extensions | a² versus h₀²b | Bidegrees (6,14)=(2,2)+(4,12); coefficient extension a_KO²=4b_KO, not b_KO | Consistent degrees/normalization; full module resolutions unread |
| B6.6 odd-prime Newton bundles | n=2,3,4 | Values [−10], [−28,−28], [−54,−138,−54]; absolute gcds10,28,6 | Match 2·5,4·7,2·3 |
| B6.6 gcd edge cases | n=5,6,7,8 | Absolute gcds22,26,4,34; n=7 has 2n+1=15 not a prime power and a=2 | Consistent non-prime-power/2-adic branch |
| B6.6 point kernel | n<0,0,4,8 | Negative groups0; degree0 α(1)=1; degree4 α(K3)=a≠0; HP² has Â=0 and nonzero signature1 | Consistent low degrees and nontrivial first kernel element |
| Lean incidence definitions | m=n=0; m=n=1 | First projective pair gives equation1≠0, hence empty subtype; (e₀,e₁) gives0 and (e₀,e₀) gives1 | Nonvacuous, but unrelated to kept headline; R05 |
| Lean complex bilinear convention | v=w=(1,i) | Bilinear value1+i²=0; Hermitian value1+1=2 | Correctly distinguishes the intended incidence variety |
| Lean arbitrary-p page abbreviation | p=0,1,2,3; r=2 | ZMod0=ℤ, ZMod1 zero ring, ZMod2/3 fields; same (2,1) page shift | General carrier alone asserts no primality/convergence; R05 |
| Lean odd-dimension helper | r=s=0; r=1,s=1 | Natural subtraction gives0; admissible pair gives5 | Positivity restrictions remain essential; helper is padding, R05 |

The exhaustive Arf tests enumerated 2,173 symplectic bases in total (1+6+6+720+720+720); the three dimension-four tests gave uniform Arf values 0,1,0. The Clifford-volume check used exact integer coordinate arithmetic with the supplier's Cayley–Dickson multiplication. The Newton/gcd tests used exact binomial integers for every r at n=2 through 8. The elementary-subgroup Sq and adjoint SW tests used exact multivariable polynomials over F₂ and the binomial formula for Sq on degree-one generators; all eight Sq residuals and both adjoint-class residuals were zero. Other displayed computations are direct hand calculations recorded in the table. None is represented as a Lean proof of a geometric or spectral theorem.

## Not verifiable

- **Missing exact statements/locators:** The source sample table identifies which general construction claims have no precise source locator. B5.6 additionally asks an implementer to supply the hypotheses rather than fixing them. Existence of the proposed global family comparisons, all coherent choices, higher-diagonal comparisons and the complete ABP/A(1)/transfer calculations was not established by the finite tests. These are material limits, not an acceptance of unspecified claims.
- **`wall1960`:** The cited Edinburgh institutional PDF was attempted twice through the source service and timed out. Its Lemmas 7–13, Theorem 1 and the full integral pullback presentation are not source-certified here.
- **`abp1967`:** The service reached the JSTOR record; the publisher record and institutional archive search did not yield readable primary text. The cover-lift, A-module splitting and right-inverse claims remain uncertified.
- **`mccleary2001`:** Citation lookup found no readable legal text; the public catalogue/contents and author-page search did not provide Chapter 6. Kudo/Borel transpotence signs and the exact theorem hypotheses have not been checked against this book. R03 rests on explicit algebra, not guessed source contents.
- **`stong1968`:** Publisher record was not readable; a Rochester institutional copy was found but its service fetch timed out. The precise Wall/Spin/Arf locators still need readable text.
- **`milnorstasheff1974`:** Citation lookup failed. Rochester's archive links a DJVU edition that the web reader could not open; no inspected extraction was obtained in this review. No theorem from that book is marked text-verified.
- **`stolz1992`:** Service reached the DOI/JSTOR record; the author's institutional publication list did not provide readable primary text. Rosenberg–Stolz's overview verifies the intended point-kernel statement and proof division, not the primary A(1) calculations.
- **`kirby`:** The body specifies “physical87” without a complete edition locator. Citation lookup did not find readable text; that exercise attribution remains unverified. The three-manifold examples in the table are only consistency tests.
- **`lee2013`, `abs1964`:** The source service returned **uncertified** because the citations resolve to paywalled publishers. They are recorded here without requesting a bypass or claiming that their contents were read.
- **Arbitrary-cardinality Adams convergence:** The completed/tensor distinction has the correct explicit Prüfer-group negative control. A proof of the full “every bounded-below spectrum” strong-convergence assertion was not verified from a readable exact source; no counterexample is claimed here.
- Open-work ownership was checked against the supplied readable sibling heads and the local board packages. Some broad search results mention other open revisions without an authorized checkout; those were not substituted for main and are not evidence for a missing declaration.

No review was parked and no external comment was posted. The consolidated missing-reference file contains only unresolved requests from this review; successfully obtained texts and service-returned uncertified works are not requested again.

## Source issues

- none
