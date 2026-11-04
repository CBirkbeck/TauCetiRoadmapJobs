# Review of TangentialBordism (pull request #942 at ea908ef)

**Verdict:** needs changes

## R01 (P2) — Relative transversality must already hold on the fixed faces

**Location:** `TauCetiRoadmap/TangentialBordism/README.md:262–269`: “already smooth and transverse to Z near C” and “homotopic rel C … transverse to Z on every face”.

**Claim:** Ambient transversality near the fixed set suffices for an approximation transverse on every face.

**Witness:** Take M=[0,1], C={0}, N=ℝ, Z={0}, f(t)=t. The ambient derivative is 1, but the derivative on the face {0} has rank 0. Every map fixed on C still hits Z there.

**Repair:** Require each face restriction to be transverse near C, as well as smoothness there. State explicitly that the relative homotopy fixes the prescribed face data. Add this interval as a negative-control Check. With the repaired hypothesis it is excluded; f(t)=1+t near the fixed endpoint satisfies the face condition because its fixed face misses Z. Keep the general relative theorem, including corners. The preceding parametric theorem correctly includes the boundary restriction; carry that condition into this deduction.

## R02 (P2) — State the smooth three-manifold parallelization headline

**Location:** `TauCetiRoadmap/TangentialBordism/README.md:1849–1855`: “every oriented smooth Hausdorff second-countable three-manifold, with boundary allowed … has a smooth orientation-preserving vector-bundle isomorphism”; `TauCetiRoadmap/TangentialBordism/Suggested.lean:6–26`.

**Claim:** The acceptance file states the available headlines and accounts for the unavailable ones. It does neither for this substantial end theorem of §8.4.

**Witness:** A scratch signature using native `TangentSpace`, `TangentBundle`, `Module.Basis`, `ContMDiff` and pinned `TauCeti.Orientable` elaborated successfully, retaining Hausdorffness, second countability, smoothness and orientability, with boundary allowed and no compactness assumption.

**Repair:** Add the genuine smooth parallelization theorem to `Suggested.lean`, using the native tangent bundle and the chosen orientation, with only the simple definitions needed to express an oriented frame. Include the positive-orientation condition, for example through the determinant in an oriented atlas, and the corresponding smooth bundle comparison. Do not replace it by a theorem assuming a trivialization. The following tested core of the conclusion already requires no new carrier:

```lean
import Mathlib
import TauCeti.Geometry.Manifold.Orientation
open scoped Manifold ContDiff

theorem threeManifold_frame
    (M : Type*) [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanHalfSpace 3) M]
    [IsManifold (modelWithCornersEuclideanHalfSpace 3) ∞ M]
    [TauCeti.Orientable (modelWithCornersEuclideanHalfSpace 3) ∞ M] :
    ∃ b : (x : M) → Module.Basis (Fin 3) ℝ
        (TangentSpace (modelWithCornersEuclideanHalfSpace 3) x),
      ∀ i : Fin 3,
        ContMDiff (modelWithCornersEuclideanHalfSpace 3)
          (modelWithCornersEuclideanHalfSpace 3).tangent ∞
          (fun x ↦ (⟨x, b x i⟩ :
            TangentBundle (modelWithCornersEuclideanHalfSpace 3) M)) := by
  sorry
```

This is evidence of statability, not a proposed weakening of the oriented theorem. Constant coordinate frames on ℝ³ and the half-space have determinant 1 and smooth inverse; disconnected unions require no additional finiteness binder. The pinned orientation file also provides `TauCeti.IsOrientedAtlas` for expressing the chosen orientation.

## R03 (P3) — Finish claim-level locators and the source manifest

**Location:** `TauCetiRoadmap/TangentialBordism/README.md:426–448`, `590–617`, `928–973`, `1242–1267`, `1784–1802`, `1894–1925`, and `1850`: “physical87 of Kirby's notes”.

**Claim:** The sampled collared-witness, product, collapse, framed-comparison, Spin-surface filling and projective-boundary targets have no claim-level legal-source locator. The Kirby reference does not identify a work or edition. The folder has no `sources.toml`.

**Witness:** These six sampled subsections end at their Needs lines without a source locator. The bibliography does not identify Kirby's notes. Reading their entire subsection and the folder's file list reproduces the omission.

**Repair:** Attach precise theorem/section and printed-page locators to those mathematical claims; identify the Kirby work and edition. Distinguish extensions proved here from the narrower source statements, as §5.2 already does. Supply the required source manifest with one stable key per work and the legal-source metadata, using uncertified status where appropriate. For example, Thom IV.8, p.75 supports the classical stable coefficient theorem, not an unrestricted finite embedded ξ comparison; preserve that distinction. Source access limitations are listed below, rather than guessed away. This is the remaining part of previous R07.

## R04 (P3) — Add a Check that fixes the Clifford volume sign

**Location:** `TauCetiRoadmap/TangentialBordism/README.md:2032–2035`: “the ordered positive Clifford volume acts as −id”; Checks at `2055–2059`.

**Claim:** The specified ordered real Clifford representation has volume −1, a convention subsequently used to identify the stabilizer. None of the three Checks tests that convention.

**Witness:** In the stated Cayley–Dickson basis, C₀C₁⋯C₈ has all sixteen diagonal entries −1 and off-diagonal entries 0. Replacing C₈ by −C₈ makes the volume +1 while preserving all three existing Checks.

**Repair:** Add an explicit ordered-volume Check, for example its value (−1,0) on (1,0)∈𝕆², and the opposite-last-generator negative control. I computed both signs using the supplier's multiplication and the README's matrix action. No change to the mathematical formula is needed.

## Verified sound

This was a full read of both files: 2,594 README lines and 118 Lean lines, including all 44 numbered subsections, their APIs, Checks, Needs lines and layer dependencies. The computed rows below test the stated examples and plausible wrong models; they do not claim that finite tests prove the general theorems. Source-dependent assertions not established by the available texts are distinguished below.

### Disposition of the previous eight findings

| Previous finding | Passage at this head | Disposition |
| --- | --- | --- |
| R01, reciprocal supply | README:43–47 assigns quartic/filling constructions here; :2082–2090 uses “For every continuous map λ:BSpin→K(ℤ,4)” and leaves its String specialization downstream. | Repaired in this folder. There is no incoming FourManifolds or StringOrientation construction edge. The ownership moves are recorded below. |
| R02, quotient duplication | README:390–391: “from SmoothBundlesConnections B1.4's free proper principal quotient”. | Repaired. B1.5 retains tangent, cycle and boundary adapters, not a second generic quotient theorem. |
| R03, odd-primary Borel truncation | README:851–868 specifies a “vector-space basis” with p-simple powers and multiplication carrying into the next powers. | Repaired. At p=3 the generator y³ survives; the statement no longer makes it zero. |
| R04, missing quadratic headlines | Suggested:99 and :108 declare `finiteQuadraticArf_gaussSum` and `finiteQuadraticArf_eq_zero_iff_lagrangian`. | Repaired. Both have native quadratic carriers, actual nondegeneracy and explicit dimension hypotheses. |
| R05, Lean catalogue/padding | Suggested:8–9: “Only the finite quadratic definitions and their symplectic-basis construction are needed.” | Repaired for the former catalogue. The three remaining admitted theorems survived the padding probes. R02 above concerns an additional omitted headline. |
| R06, hypersurface attribution | README:1498–1500 cites “Problems 16-C–E … pp.203–204” and requires m,n≥2. | Repaired. The source and the excluded m=n=1 calculation agree. |
| R07, sources | README:1045 distinguishes Thom IV.8 from its finite embedded extension; :1465 cites Milnor §4, Theorems 4–5, p.519. | Partly repaired: those specific corrections verify, but R03 above remains. |
| R08, shape and Checks | The file now has ten `Layer` headings, each with Examples and Dependencies, with prose APIs and Checks. | Structural repair verified. R04 identifies a remaining concrete convention Check, rather than re-raising the old formatting complaint wholesale. |

No repair-report finding marked “not actionable in this package” was used as an instruction or silently reopened.

### Gate, elaboration and acceptance signatures

The supplied gate at this exact head passed every scanner, dependency check and targeted build. Its final fields were `depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`; all preceding scanner fields were also zero. The outside-folder diff was empty, and the reviewed checkout was left unchanged.

The independently run dependency check returned:

```text
depcheck: 206 roadmaps, 1412 edges, 0 problem(s)
```

I built the missing individual `TauCeti.LinearAlgebra.BilinearForm.SymplecticBasis` object, then ran the requested direct Lean elaboration of `Suggested.lean`. It exited 0 with exactly the three expected `sorry` warnings. A scratch copy with `#check @name` for all eight declarations also elaborated. The nondegeneracy proof argument and finite-dimensionality remain in the Arf definition and all three headlines; the Gauss sum retains `[Fintype V]`, and the dimension equation is explicit. No dropped hypothesis, sorry-defined data, stand-in predicate, `set_option`, extra import or duplicate fully qualified name was found in this file.

Nine one-tactic probes replaced each of the three admissions with `rfl`, `simp` and `infer_instance`, respectively. All nine failed to close their goal. Object searches did not locate a pinned one-lemma proof of these Arf headlines. The proved alternation and symplectic-basis adapters support the actual invariant definition; they are not admitted acceptance padding. The parallelization probe in R02 was run separately after building its individual orientation module.

The README's headline families are: finite Arf classification; structured geometric bordism and its homology theory; finite and stable Pontryagin–Thom; MO splitting, characteristic-number detection and polynomial ring; the integral SO ring and odd-primary comparison; ABS/Dirac comparison and low Spin groups; low-dimensional fillings and smooth three-dimensional parallelization; Cayley-plane homogeneous/characteristic geometry; integral/mod2/rational homology realization; and the projective-transfer kernel theorems. The docstring accounts for the unavailable bordism, Thom-spectrum, Steenrod, KO and compact-Albert carriers. It does not account for, or state, the native-manifold headline in R02.

### Seeded source audit

All source text was obtained through the sources service from legal institutional/author repositories or arXiv. Source IDs below identify those extractions; no source text was copied into the repository. There were no explicitly marked unverified locators in the README. The following covers all fifteen seeded targets, including the missing locators rather than treating a bibliography entry as verification.

| Sampled target | Locator/text inspected | Outcome at the stated generality |
| --- | --- | --- |
| 2.1 Relative differential topology | `lee2013` line 6351, Thm 6.26, p.141; line 6576, Thm 6.35, p.145; line 6632, Thm 6.36, p.147 | Whitney and parametric ingredients are present. The general relative corner extension is a local target, not Lee's theorem verbatim. Its fixed-face deduction needs R01. |
| 2.3 Quotient and bundle adapters | `lee2013` lines 25266 and 25488, Thms 21.10 and 21.13; SmoothBundlesConnections B1.4 | Free proper quotient/principal projection is supplied. Relative triangulation and bundle-boundary adapters are additional constructions; no exact source locator for the relative extension is provided. |
| 2.4 Collared witnesses | README:426–448; GeometricTopology Layer 1 | The supplier provides collared gluing. The full structured witness statement has no source locator: R03, not certified by an unrelated quotient theorem. |
| 3.1 Bordism quotient | `milnorstasheff1974` lines 5447–5481, §17.2 and Lemma 17.2, pp.207–208 | The ordinary coefficient equivalence relation and operations are supported. Parameter pairs and ξ-lifts are the explicitly broader construction here. |
| 3.2 Products and coefficient action | Same Chapter 17 context; README:590–617 | Ordinary multiplication agrees; graded ξ/pair transport is a target here. Missing claim-level locator: R03. |
| 4.3 Thom and Wu classes | `milnorstasheff1974` lines 3601–3672, Thm 11.14, printed p.141 | Smooth closed-manifold Wu formula and Sq(U)=wU agree. The README's relative and bundle naturality assertions require its additional cochain/Thom constructions. |
| 5.1 Normal classifier and collapse | `thom1954` line 2410, IV.6; GeneralizedCohomology G5.2–G5.3 | Finite tubular collapse is supported in the classical ambient setting. Arbitrary CW classifier lifts and coherent normal diagrams are not claimed to follow just from this source. Missing local locator remains R03. |
| 5.2 Finite embedded comparison | `thom1954` line 2462, IV.8, printed p.75 | The source is the classical stable coefficient theorem. The README correctly labels its finite embedded ξ theorem an extension and keeps embedding order and rank-zero exceptions. |
| 5.3 Inverse for CW classifiers | Thom IV.8 plus GeneralizedCohomology G2.10 and CharacteristicClasses C1 | Source alone does not prove the arbitrary-CW mapping-path construction. The README owns it and describes the two inverse witnesses; it does not silently assume the classifier smooth. |
| 5.5 Framed and ordinary comparisons | README:1242–1267; GeneralizedCohomology G5 sphere/Thom orientation interfaces | GeneralizedCohomology supplies the spectral objects. There is no precise source locator for this local geometric comparison: R03. |
| 6.4 Odd-primary SO and Spin | `milnor1960` lines 575–589, §4, Thms 4–5, printed p.519 | The module calculation and absence of odd torsion are present. Multiplicative Adams/comodule-algebra refinements are correctly identified as additional targets, not attributed to the module theorem. |
| 6.5 Rational and odd-local generators | `thom1954` line 2774, IV.17, p.84; `milnorstasheff1974` lines 5351–5388, Problems 16-C–F, pp.203–204 | Rational polynomial coefficients and the corrected complex-incidence formula agree. m,n≥2 is necessary. The local lattice/gcd argument is spelled out separately. |
| 8.2 Spin-surface filling | README:1784–1802; `pyronneau2024` lines 196–231 supports only the algebraic Arf ingredient | The handle-filling route is mathematically distinct from finite-form classification. No locator for the geometric iff: R03. |
| 8.5 Projective boundaries | README:1894–1925 | The quaternionic conjugation derivative and boundary sign were recomputed below. No exact source locator identifies the full filling comparison: R03. |
| 10.1 Homology realization | `thom1954` line 2774, IV.17, p.84; pinned cyclic-homology declaration | IV.17 is a rational coefficient calculation, not the integral pair theorem. The README says so. Its explicit AHSS range argument and mod3 obstruction have the computed values below. |

Additional checks: `guillouweibel2013` lines 748–760 and 784–814 (v1 Definition 6.1, Theorems 6.2 and 6.5, pp.18–19) support the p-simple-system correction and the Bockstein/transgression sign; the ordinary topological application is an additional construction. `wall1960` lines 352, 467–545 and 567–585 (Lemmas 7–13 and Theorem 1) distinguish the degree−2 derivation from the square-zero geometric cut. `kreckstolz1993` lines 494–531 (§4, Proposition 4.2 and Lemma 4.3, pp.244–245) give the HP²-bundle numbers and gcd. `rosenbergstolz` lines 302–316 (Theorem 3.3, p.8) state the integral point kernel and distinguish the 2-primary and odd-primary arguments; they do not prove an arbitrary-X version. `fuhring2022` lines 18–78 (Theorems 1.1 and 1.3 and Remark 1.4, pp.355–356) support the positive-degree oriented projective-bundle image and the central quotient comparison. `borelhirzebruch1958` lines 3021 onward (§19, Theorem 19.4) give the OP² characteristic numbers. `baez2002` lines 1297–1455 (§3.4, pp.30–32) describe the Albert/Spin9 representations and trace-one idempotents; the roadmap supplies its explicit Clifford convention instead of importing Baez's different Cayley–Dickson convention. Miller's Chapter 1, Theorem 11.2 (`miller` line 1142, p.30) supports the dual Steenrod algebra input. The unavailable primary ABP/Stolz calculations are listed separately.

### Pinned library and ownership audit

Opened native declarations, at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`:

| File and line at the pin | What was checked |
| --- | --- |
| `Mathlib/Geometry/Manifold/Bordism.lean:110`, :147, :238, :247 | `SingularManifold`, map, product and sum: compact, boundaryless cycle with continuous parameter map; Hausdorffness is not a field and must be added. This is not an existing bordism quotient. |
| `Mathlib/Geometry/Manifold/WhitneyEmbedding.lean:131` | `exists_embedding_euclidean_of_compact`: compact Hausdorff smooth model-with-corners source, closed embedding and injective derivative. It does not already provide prescribed neat-boundary stabilization. |
| `Mathlib/LinearAlgebra/Orientation.lean:51`, :116 | Orientation is a ray of top alternating forms and transport uses the native map. Empty bases do not identify the two dimension-zero orientation rays. |
| `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:311` | Polarization on the diagonal is 2q(x); characteristic two gives alternating polarization without dividing by 2. |
| `TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean:301`, :309 | Native symplectic basis and even finrank, with finite-dimensionality and nondegeneracy. The Lean file adapts the actual matrix J. |
| `Mathlib/RepresentationTheory/Homological/GroupHomology/FiniteCyclic.lean:85` | `Rep.FiniteCyclicGroup.groupHomologyIsoEven`: positive even degree, with the nonzero-degree hypothesis. For trivial ℤ coefficients, norm is multiplication by m and its kernel is zero. |
| `Mathlib/Algebra/Homology/SpectralSequence/Basic.lean:36` | Native spectral-sequence pages and homology-to-next-page isomorphisms. No convergence or multiplicative Adams theorem is bundled into this carrier. |
| `Mathlib/Geometry/Manifold/ChartedSpace.lean:236` | `ChartedSpace.secondCountable_of_sigmaCompact` requires a second-countable model and sigma-compact source; compactness supplies the latter. |
| `TauCeti/Geometry/Manifold/Instances/ClosedBall.lean:413` | `orientable_closedBall` requires dimension at least two; the README correctly excludes the half-line atlas criterion in dimension one. |
| `TauCeti/Geometry/Lie/Subgroup/Embedded.lean:137` | Closed subgroup of a finite-dimensional real Lie group has embedded data on its actual Lie-algebra model; this supports the compact automorphism-group construction. |
| `Mathlib/Geometry/Manifold/VectorBundle/Tangent.lean:87` | Native tangent bundle construction used by the parallelization probe. |
| `TauCeti/Geometry/Manifold/Orientation.lean:178`, :332, :345 | Orientation-preserving groupoid, oriented atlases, and orientability, including model-with-corners data. Orientability is existence of an atlas, not a supplied choice of positive frame. |

Object searches covered the pinned libraries, main roadmaps, the board's package index, and the supplied open heads using the roadmap tools. The finite F₂ quadratic problem is distinct from IntegralLattices' integral/discriminant-form algebra; native symplectic linear algebra is imported. Generic cochains, bundles, spectra, Clifford algebra and free proper quotients are deferred to their existing owners. There is no re-planning of an existing TangentialBordism roadmap on main.

Resolved supplier contracts against main for existing roadmaps, and the supplied open head for new roadmaps. Concrete anchors read were:

| Supplier | Resolved section and file line |
| --- | --- |
| AlgebraicTopology | README Stages 2–4, 6 and 8, including 8.10–8.11b; chains, CW pairs, duality and EM obstruction/representation constructions. |
| DifferentialGeometry | README:345 (§2.1), :352 (§2.2), :528 (§5.5), :884 (§10.2); chosen orientations, faces and Sard. |
| GeometricTopology | README:177 (Layer 1), :831 (Layer 11), smoothing-and-triangulation item 1; collars/tubes, simplicial CW structures and Whitehead triangulation. |
| SmoothBundlesConnections | supplied head README:360–389, B1.4; free proper principal quotients, including homogeneous spaces. |
| GeneralizedCohomology | README:533 (G2.10), :710 (G3.3), :785 (G3.8), :878 (G3.9), :1512 (G5.1), :1523 (G5.2), :1536 (G5.3), :1559 (G5.4), :1687 (G5.5). Continuous classifier pullbacks and stabilization diagrams are retained. |
| DGFloer | README:442 onward, Layer 1 items 2–4; homology/cohomology Serre sequence and Serre-class input, not a pre-existing Steenrod/Adams computation. |
| CharacteristicClasses | README:486 (C1.3), :504 (C1.4), :550 (C2), :842 (C3.3), :945 (C3.6), :1447 (C6), :1554 onward (C7.3/3a); faithful representations, relative smoothing, Thom classes and characteristic formulas. |
| TopologicalKTheory | README:886 (T5), :1148 (T7), :1263 (real/complex Bott normalization); c(a)=2u² and c(b)=u⁴. |
| SpinGeometry | README:395 (G4), :506 (G5.0), :586 onward (real Dirac realization), G6.7; lifts and real mixed-Clifford indices are independent of the later bordism comparison. |
| RiemannianGeometry | README:179 (R1), :280–298 (quaternionic quotient metric); sectional curvature [1,4] in the stated range. |
| ClassifyingSpaces | README:222–238, Stage 4; ordinary BG homology compared with group homology. |
| LieHighestWeight | `RepresentationTheory/LieHighestWeight/README.md:1261–1267`, :1333, :1391–1398; division octonions, compact Albert algebra and derivations. The resolver's `DivisionOctonionReal` lead is a planned supplier object, not a missing native declaration. |
| LieGroups and SpinRepresentations | `RepresentationTheory/LieGroups/README.md`, Layers 2 and 4; `RepresentationTheory/SpinRepresentations/README.md:881` onward, L7; generic subgroup charts, real Clifford tables and Spin(3)/quaternion comparison. |
| DGAInfinity | README:263, Layer 0; signed tensor convention. |
| AffineMorseLefschetz and ComplexKahlerGeometry | README:67 (A0), :494 (A5), :535 (A6); ComplexKahlerGeometry README:1407 (K7.1), actual projective charts and orientation. |
| IndexTheory | supplied head README:272 (I2.5), :651 (I5.4), :740 (I7.2), :852–875 (I7.5); local index comparison and signature/quaternionic index. |
| PseudodifferentialOperators | supplied head README:843 onward (P5), :1198 onward (P6); compact bundle mapping estimates, parametrices and regularity. |

The generic quotient is owned by SmoothBundlesConnections; ordinary Thom collapse is owned by GeneralizedCohomology, while the finite embedded ξ dictionary and geometric inverse are here. The quartic/elliptic filling geometry and the arbitrary-λ Cayley-plane nullhomotopy were moved here to avoid dependence on the later FourManifolds and StringOrientation work. FourManifolds' supplied head still has related F7.0/F7.0b material at README:1459–1492; its downstream use should refer to the new owner. This is the ownership move required by the earlier cycle repair, not a demand to reinstate an upward edge. StringOrientation consumes PT and ordinary operations; its String specialization need not be an input here.

The mechanical result above has no UPWARD or CYCLE line. IndexTheory is a named supplied new-roadmap head; absence from the order is handled by the brief's placement rule, not reported as a missing-order defect. No undeclared supplier gap was substituted for a missing section. The broader search also returned open work whose files were not among the supplied heads; ownership against those unprovided heads was not checked, and no finding relies on their search snippets.

### Adversarial computations

Here H denotes the hyperbolic F₂ plane, A the anisotropic F₂ plane. “Pass” means the displayed instance agrees, not a claim of a completed formal proof. Source and missing-locator qualifications above still apply. Computations used integer/F₂/F₃ arithmetic and the actual supplier Cayley–Dickson formula, not the assumed headline conclusions.

| Statement / target | Instances tried | Computed values on the two sides | Result / change |
| --- | --- | --- | --- |
| 1.1 native polarization | q on F₂⁰ and H; x=e+f | b(x,x)=q(0)−2q(x)=0; 2q(x)=0 | Pass; no division by 2. |
| 1.1 symplectic basis predicate | H with e,f; repeated vectors | b(e,e)=b(f,f)=0, b(e,f)=1; repeated pair gives 0≠1 | Pass; wrong basis excluded. |
| 1.1 Arf basis sum | H and A | q(e)q(f)=0 and 1; invariant 0 and 1 | Pass. |
| 1.1 basis independence | All standard-polar forms in dimensions 0,2,4 | 1,4,16 forms; 1,6,720 symplectic bases each; all 11,545 form/basis values equal the reference Arf | Pass; enumerated, not inferred from admission. |
| 1.1 Gauss sum, zero dimension | One zero vector | 1−0=1=2⁰ | Pass. |
| 1.1 Gauss sum, dimension two | H; A | 3−1=2; 1−3=−2; RHS +2,−2 | Pass. |
| 1.1 Gauss sum, dimension four | H⊕H; A⊕H; A⊕A | 10−6=4; 6−10=−4; 10−6=4; RHS 4,−4,4 | Pass. |
| 1.1 quadratic Lagrangian iff | 0,H,A,H⊕H,A⊕H,A⊕A | Numbers of half-dimensional q-zero subspaces 1,2,0,6,0,6; Arf-zero truth values T,T,F,T,F,T | Pass in both directions. |
| 1.1 nondegeneracy | Zero form on F₂ | polar rank 0<1; no symplectic basis; theorem hypothesis false | Pass; excludes odd-dimensional junk. |
| 2.1 stabilized embedding rotation | e₀=e₁=e on collar; θ=0,π/2 | inverse block rotation gives (e,0) throughout collar; endpoints (e₀,0),(e₁,0) | Pass for relative formula. |
| 2.1 neat embedding | Interval into a half-space | collar coordinate 0 exactly at boundary; derivative rank 1 | Pass; ordinary embedding alone has no marked boundary equation. |
| 2.1 parametric transversality | F(x,s)=x−s; boundary restrictions | ambient rank 1; face parameter derivative −1; bad fixed parameters 0,1 only | Pass for dense simultaneous conclusion. |
| 2.1 relative face approximation | f(t)=t, C={0}, Z={0} | ambient rank 1 versus face rank 0, required face codimension 1 | Fails; R01. |
| 2.1 repaired fixed-face condition | f(t)=1+t near C={0} | fixed face image 1, intersection with Z empty | Pass for proposed hypothesis. |
| 2.1 rounding | Positive quadrant near its corner | two incident faces become one rounded boundary; oriented boundary still has incoming/outgoing signs −,+ | Pass on local model. |
| 2.1 compact neighborhoods and doubles | Compact interval inside ℝ; double of [0,1] | support lies in interior of a larger interval; double is S¹ with boundary ∅ | Pass; noncompact ambient causes no compactness assertion. |
| 2.2 orientation in rank zero | Positive and negative point | rays + and − are distinct; both have the same empty basis | Pass; frame-only convention would lose sign. |
| 2.2 boundary orientation | Positive [0,1] | endpoint coefficients −1,+1; sum 0 | Pass. |
| 2.2 factor swap | Dimensions (1,1), (0,1) | determinants −1,+1; (−1)^(pq)=−1,+1 | Pass. |
| 2.2 structures and normal transport | Trivial rank-r bundle, one stabilization | tangent plus normal rank n+r; adding line gives n+r+1 on both sides | Pass; retain specified bundle isomorphism. |
| 2.3 quotient | ℤ on ℝ; irrational ℝ-flow on T² | first quotient S¹ has discrete fibre ℤ; second orbit space not Hausdorff | Pass for properness restriction. |
| 2.3 principal versus covering | S¹ acting on S³ | quotient CP¹; fibre dimension 1, not 0 | Pass; no discrete-fibre overclaim. |
| 2.3 mapping torus | Identity and reflection of S¹ | w₁=0 for T²; w₁≠0 for Klein bottle | Pass; monodromy retained. |
| 2.3 disk/sphere bundles | Trivial line and rank-zero bundle over point | line disk has 2 boundary points; zero disk is point, sphere is ∅ | Pass. |
| 2.3 relative triangulation | Interval | cells (vertices,edges)=(2,1); boundary cells (2,0) | Pass; numerical CW-pair test only. |
| 2.4 collared witness | Cylinder on a positive point | incoming/outgoing signs (−1,+1); signed total 0 | Pass; arbitrary two-positive-end identification fails. |
| 2.5 relative cycles and free face | Pair (X,X); cylinder with free side | relative class maps to 0; free side maps into A | Pass; absolute boundary restriction not substituted. |
| 2.6 small representatives | Empty cycle and point | embeddings into ℝ⁰ have cardinalities 0 and 1; no two-point injection into ℝ⁰ | Pass; stabilization needed. |
| 2.7 quartic | Smooth complex quartic K3 | c₁=0,c₂=24; p₁=c₁²−2c₂=−48; signature −48/3=−16 | Pass. |
| 2.7 elliptic example | E(1), and double fiber-sum K3 | c₁²=0,c₂=12, signature −8; double gives c₂=24, signature −16 | Numerical pass; marked boundary Spin diffeomorphism needs geometric proof/source. |
| 3.1 quotient identity/inverse | Empty cycle; oriented point plus negative point | 0+x=x; 1+(−1)=0 via interval | Pass. |
| 3.1 O versus SO | Two positive points | O:1+1=0 in F₂; SO:1+1=2 in ℤ | Pass; structures not collapsed. |
| 3.2 products | Unit point, empty factor; oriented 1×1 | 1·x=x,0·x=0; swap coefficient −1=(−1)¹ | Pass. |
| 3.2 graded boundary formula | Product of two intervals | ∂(I×I)=∂I×I−I×∂I; four corner coefficients cancel pairwise | Pass for outward-first sign. |
| 3.3 boundary and exactness | (I,∂I) | relative generator maps to [1]−[0]; augmentation is 1−1=0 | Pass. |
| 3.3 reduced pair | (X,X), including X=∅ | quotient theory group 0; relative chains 0 | Pass. |
| 3.4 orientation map | Point, empty cycle, two points in distinct components | images 1,0,(1,1); component labels are not summed to one component | Pass. |
| 3.4 unoriented image | RP² fundamental class | mod2 evaluation 1; an integral orientation is absent | Pass; coefficients matter. |
| 4.1 higher diagonal sign | Positive edge e=[0,1] | ∂(−e⊗e)=v₀⊗e−v₁⊗e+e⊗v₁−e⊗v₀=AW(e)−TAW(e) | Pass. |
| 4.1 Sq instability/top square | Degree-one a; unit | Sq¹a=a², Sq²a=0; Sq⁰1=1, Sq¹1=0 | Pass. |
| 4.1 Cartan | a² in H*(RP∞;F₂) | Sq¹a²=2a³=0; Sq²a²=a⁴ | Pass. |
| 4.1 integral cup₁ sign | Degree-two c | expansion of δ(c cup₁δc) has coefficients (+1,−1,−1) on c cup δc, δc cup c, δc cup₁δc | Pass against the chain equation. |
| 4.2 Steenrod/Adams normalization | Sq¹Sq¹; mod2 degree-zero tower | Sq¹Sq¹=0; h₀ tower corresponds to 1,2,4,…, not exponent-two π₀ | Pass; extensions not discarded. |
| 4.2 Adams differential | (s,t)=(1,2), r=2 | target (3,3); stems 1 and 0, difference −1 | Pass. |
| 4.2 derived completion | Prüfer group | classical completion 0; first derived-completion group ℤ₂ | Pass; excludes the unqualified tensor formula. |
| 4.2 completion restriction | Degree-zero sphere | completed target ℤ₂, uncompleted group ℤ; these are unequal | Pass for explicit completion hypotheses. |
| 4.3 Thom/Wu | RP²; oriented surface | RP² v₁=a, w=1+a+a²=Sq(1+a); oriented surface w₁=0 | Pass. |
| 4.3 rank-zero Thom class | Zero bundle over point | U=1; Sq(U)=1=wU | Pass. |
| 4.4 p-simple system | F₃[y], degrees y,y³,y⁹ | exponent 3 has digits (0,1,0); y³ survives, whereas a truncated algebra would give 0 | Pass; prior R03 repaired. |
| 4.4 odd exterior generator | Odd z at p=3 | z²=−z² implies 2z²=0, hence z²=0 | Pass; p=2 excluded here. |
| 4.4 transgression sign | p=3, transgressing Bockstein | τβ=−βτ; scalar −1 is 2 in F₃ | Pass against v1 Theorem 6.5. |
| 4.4 transpotence degree | |z|=3,p=3 | p(|z|−1)+2=8; proposed class degree 8 | Pass on degree; full source proof qualification above. |
| 5.1 collapse | Single positive normal-framed point; empty cycle | sphere-map degree 1; constant map degree 0 | Pass. |
| 5.1 normal/tangent stabilization | TM⊕ν≅ε^(n+k) | virtual rank (n+k)−k=n; opposite convention would give −n | Pass. |
| 5.2 embedded order | Labels a+,b+,a−,b− versus a+,a−,b+,b− | reduced words aba⁻¹b⁻¹≠1 and 1; both abelianize to (0,0) | Pass; abstract labels alone do not determine finite class. |
| 5.2 finite rank zero | n=k=0 | at most one point in ℝ⁰; two-point union cannot embed | Pass; no invented group law. |
| 5.2 finite framed comparison | One positive/negative point in rank 1 | π₁(S¹) degrees +1,−1; addition gives 0 | Pass. |
| 5.3 regular inverse | Identity sphere map and constant map missing regular value | inverse images one positive point and ∅; collapses degree 1 and 0 | Pass; inverse construction required. |
| 5.3 CW classifier | Point of a nonsmooth CW base | pullback fibre rank k, continuous classifier; no derivative of classifier exists or is needed | Pass on object type; smoothing is in a finite bundle model. |
| 5.4 stabilization | Positive framed point under suspension | degree 1 suspends to degree 1; empty class stays 0 | Pass. |
| 5.4 pairs/weak comparison | (X,X); filtered union containing one compact cycle | relative group 0; the compact cycle uses finite support, not all cells | Pass for degeneracies; general colimit theorem remains target. |
| 5.5 framed/ordinary comparison | Framed point, its negative | stable π₀ values +1,−1; H₀ orientation images +1,−1 | Pass. |
| 5.6 Umkehr | Identity embedding; point in oriented circle | identity has normal rank 0 and degree shift 0; point dual is degree-one class evaluating 1 | Pass; directions and shifts agree. |
| 5.7 AHSS | X=point; relative zero pair | only p=0 column is Ω_q; zero pair has all entries 0 | Pass; no spurious base contribution. |
| 6.1 additive MO | Degrees 0 through 4 | monomial counts 1,0,1,0,2; coefficient dimensions same | Pass; additive splitting not used as ring proof. |
| 6.2 characteristic detection | RP⁴ and RP²×RP² | (w₄,w₂²)=(1,0),(1,1); determinant 1 over F₂ | Pass; independent classes. |
| 6.3 real Milnor hypersurface | H_R(2,4), total degree 5 | binom(6,2)=15≡1; Newton detector 1 | Pass. |
| 6.3 excluded small index | H_R(1,2) | top Newton number 0 rather than binom(3,1)=1 mod2 | Pass for m,n≥2 restriction. |
| 6.4 odd-primary Ext | p=3 and p=5 | v₁ stems 4 and 8; degree-four C absent at 3, present at 5 | Pass. |
| 6.4 Spin/SO comparison | B(C₂), p=3 versus p=2 | positive F₃ cohomology 0; F₂ degree-one class 1-dimensional | Pass; no claim at 2. |
| 6.5 incidence carrier | (e₀,e₁),(e₀,e₀), v=w=(1,i,0) | bilinear values 0,1,0; Hermitian value in last case 2 | Pass; wrong equation excluded. |
| 6.5 complex Newton number | H_C(2,3), CP⁴ | −binom(5,2)=−10 and 5; gcd 5 | Pass. |
| 6.5 excluded complex index | H_C(1,1)=CP¹ | c₁-number +2, not −2 | Pass for restriction. |
| 6.5 rational generators | Degrees 4 and 8 | polynomial ranks 1 and 2; CP², then CP⁴ and CP²×CP² | Pass. |
| 6.5 finite versus stable BSO | BSO(2) | rational Euler generator in degree 2; stable BSO has no degree-2 generator | Pass; Euler not silently removed at finite rank. |
| 6.6 Wall structure | RP² | H¹(−;ℤ)=0, w₁≠0; no integral lift | Pass. |
| 6.6 cofiber sign | Oriented point | ρ=−1; 1−ρ=2, while 1+ρ=0 | Pass. |
| 6.6 dual derivation | σ₄ | ∂₂σ₄=σ₂, ∂₂²σ₄=1≠0; geometric ∂₁²=0 | Pass; no false chain complex. |
| 6.6 torsion multiplication | Y₆Y₅ | δ(Y₆Y₅)=Y₅²≠0; δY₅=0 | Pass; torsion ideal not square-zero. |
| 6.6 forgetful comparison | CP² and RP²×RP² | full degree-four SW vectors both (1,1) | Pass. |
| 7.1 ABS normalization | Complex K3 | Â=−p₁/24=2; real α=Â/2=1; c(a)=2u² | Pass. |
| 7.1 orientation reversal | −K3 | signature +16, Â=−2, α=−1 | Pass. |
| 7.2 low ko comparison | Degrees 0,…,7 | ℤ,F₂,F₂,0,ℤ,0,0,0 on both coefficient lists | Pass; not asserted to extend through degree 8. |
| 7.2 degree-eight boundary | Spin degree 8 versus ko₈ | Spin rank 2, ko rank 1; HP² has α=0 and signature 1 | Pass; kernel already nonzero. |
| 8.1 surface quadratic law | a,b intersect once, q(a)=q(b)=0 | q(a+b)=0+0+1=1 | Pass; linear refinement would fail. |
| 8.2 Spin filling iff | Bounding sphere; odd Spin torus | Arf 0 and 1; filling obstruction 0 and 1 | Pass on examples; locator R03. |
| 8.3 Spin versus framing | Framed T³ | Spin bordism class 0; framed class 12ν≠0 in ℤ/24 | Pass; forgetful map is not injective. |
| 8.4 low O/SO tables | Degrees 0 and 4 | O: F₂ and F₂²; SO: ℤ and ℤ; CP² signature 1 | Pass. |
| 8.4 smooth parallelization | ℝ³, half-space, disjoint union | coordinate-frame determinant 1, inverse identity, derivative of frame coefficients 0 | Pass on native carriers; missing Lean theorem R02. |
| 8.5 projective boundary sign | Quaternionic conjugation near i | two transverse derivative columns −2k,−2j have determinant −4; horizontal sign (−1)^(n−1), total (−1)^n | Pass. |
| 8.5 first projective case | n=1 | horizontal sign +1, total sign −1 | Pass; fixes orientation of boundary comparison. |
| 9.1 literal Albert carrier | diag(1,0,0); zero; identity | E²=E,tr E=1; zero trace 0; identity trace 3 | Pass; wrong idempotents excluded. |
| 9.1 chart origin | x=y=0 in affine octonion chart | denominator 1; chart gives diag(1,0,0) | Pass; denominator positive. |
| 9.1 cell structure | OP² | cells in degrees 0,8,16; Euler characteristic 3; cup-square top evaluation 1 | Pass. |
| 9.2 Peirce orbit derivative | x in J_(1/2)(E) | E∘x=x/2; 4[L_x,L_E](E)=4(x/2−x/4)=x | Pass. |
| 9.2 positive Clifford action | C₀ and C₁ | C₀=diag(1,−1), C₁ swaps; squares I, anticommutator 0 | Pass. |
| 9.2 ordered volume | All sixteen basis columns | C₀⋯C₈=−I₁₆; flipping C₈ gives +I₁₆ | Formula passes; add R04 Check. |
| 9.3 OP² characteristic values | p₂=6u,p₄=39u² | signature=(381·39−19·36)/14175=1; Euler number 3 | Pass. |
| 9.3 λ-nullhomotopy | OP² and contrast S³ | H⁴(OP²;ℤ)=H³(OP²;ℤ)=0; on S³ nullhomotopy choices form ℤ | Pass; uniqueness needs both groups. |
| 9.4 HP² comparison | p₁=2u,p₂=7u² | signature=(7·7−4)/45=1; Â=(7·4−4·7)/5760=0; s₂=4−14=−10 | Pass. |
| 10.1 cyclic homology parity | C₃, trivial ℤ coefficients | positive even ker(3)=0; positive odd coker(3)=ℤ/3 | Pass; degree zero remains ℤ. |
| 10.1 low integral range | d₅ into H₀; test degree 6 via Cₘ | torsion image in torsion-free H₀ is 0; H₆(BCₘ;ℤ)=0 | Pass on the proposed obstruction tests. |
| 10.1 d₆ component test | X=S⁰ | H₆(S⁰;ℤ)=0; target H₀ detects each component | Pass. |
| 10.1 degree-seven obstruction | L⁷(3)×L⁷(3) | product of displayed classes =−v₁v₂u₁³u₂³; top pairing −1=2 in F₃ | Pass; nonzero obstruction. |
| 10.1 ordinary realizations | Positive point, empty cycle; mod2 RP² | images 1,0, and mod2 fundamental class 1 | Pass. |
| 10.2 associated transfer | Trivial G-bundle over point and empty base | total space F and ∅; degree shift dim F and zero class | Pass; actual family retained. |
| 10.3 complex conjugation | CP² | h↦−h, h²↦h²; orientation degree +1 | Pass; scalar U(1) is normalized, not pointwise centralized. |
| 10.3 unoriented generator | Dold P(1,2) | top w₂w₃ evaluation 1 | Pass; image is not identically zero. |
| 10.4 isotropy descent | Two quaternionic blocks | π₁(SO₈) class 1+1=0; one block would give 1 | Pass. |
| 10.4 curvature/index contraction | HP² quotient metric | scalar ≥8·7=56>0; exact value 128 in stated normalization | Pass; positivity supplies spectral gap, not merely pointwise zero genus. |
| 10.4 elementary restrictions | t₂,t₃,t₈,t₁₂ polynomials | term counts 3,2,32,46; eight Sq¹/Sq² formula residuals all 0 | Pass by exact F₂ polynomial computation. |
| 10.4 adjoint correction | Full character product; x₁=1, others 0 | w₈,w₁₂ residuals 0; at that substitution both 1 versus uncorrected t₈=t₁₂=0 | Pass. |
| 10.4 BH relation | t₈=u₄²+u₈, t₁₂=u₄u₈ | u₄³+(u₄²+u₈)u₄+u₄u₈=0 | Pass. |
| 10.4 Gysin | HP² fibre | π!1=0, π!u₄=0, π!u₄²=1 | Pass; degrees −8,−4,0. |
| 10.4 KO-Pontryagin definition | Oriented plane E and zero virtual bundle | λ_t(E−2)=1+(E−2)t/(1+t)²; π₁=E−2, π_i=0 for i>1; zero gives π₀=1 | Pass. |
| 10.4 cover indexing | Empty partition,(2),(3) | (n,k)=(0,0),(2,8),(3,10); uniform 4n gives wrong 12 in last case | Pass. |
| 10.4 Ext/KO extension | a and h₀²b | a² and h₀²b both (s,t)=(6,14); a_KO²=4b_KO | Degree/normalization pass; full I,J,K resolutions not certified without primary texts. |
| 10.4 Newton bundles | n=2; n=3 | numbers −10; −28,−28; gcds 10=2·5 and 28=4·7 | Pass against primary source. |
| 10.4 Newton gcd | n=4,5,6,7,8, every allowed r | absolute gcds 6,22,26,4,34; predicted 2·3,2·11,2·13,4,2·17 | Pass. |
| 10.4 integral point kernel | n=0,4,8 | negative transfer domains 0 in first two; α injective there; at 8 HP² maps to 0 and has s₂=−10 | Pass on boundary cases; no arbitrary-X equality inferred. |

The table contains 120 computed rows covering all 44 numbered subsections and the headline families. The Arf enumeration included both iff directions, the zero space and nondegenerate versus degenerate forms. The finite PT word test checks a nonabelian free group rather than only its abelianization. Characteristic-two/odd-prime tests were kept separate, ranks zero and one were not silently stabilized, and all displayed rational characteristic-number denominators are nonzero integers in ℚ.

## Not verifiable

These limitations do not park this review. They identify exactly which source certification is incomplete; the two blocking findings above are independently witnessed.

- `abp1967`, Anderson–Brown–Peterson, *The structure of the Spin cobordism ring*, Annals 86 (1967), 271–298: the correct DOI is 10.2307/1970690. The sources service reached the JSTOR landing page but no readable legal full text; arXiv lookup returned HTTP 429. Thus the complete ABP cover lifts, cohomology splitting and multiplicities in §10.4 were not checked against its proof.
- `stolz1992`, *Simply connected manifolds of positive scalar curvature*, Annals 136 (1992), 511–540, DOI 10.2307/2946598: publisher metadata was accessible, but the sources service did not obtain the full text. Rosenberg–Stolz certifies the point-kernel statement, not all the detailed A(1), Joker/K and transfer-resolution assertions in §10.4.
- `mccleary2001`, *A User's Guide to Spectral Sequences*, second edition, Chapter 6: the Cambridge landing page yielded no readable full text and arXiv lookup was rate-limited. Guillou–Weibel v1 checks the cited algebraic simple-system and Kudo sign formulas, not every ordinary-topological convergence/coherence assertion of §§4.2 and 4.4.
- `gompfstipsicz1999`, *4-Manifolds and Kirby Calculus*, §§3.1 and 8.3: AMS metadata only; the sources service obtained no text. The quartic characteristic arithmetic was checked, but the marked elliptic-filling boundary identification was not certified from this book.
- `stong1968`, *Notes on Cobordism Theory*: the publisher lookup did not yield readable text. The sources-service retry at Rochester’s institutional `stongcob.pdf` continued extracting for roughly twenty minutes without returning text; I stopped that fetch before ending the review. Its connected-cover notation and detailed Spin calculations were therefore not source-certified.
- `kirby`: “physical87 of Kirby's notes” does not identify a unique text. The service search using Kirby's *The Topology of 4-Manifolds* did not provide a legal readable match. No theorem-number/page equivalence is assumed. R03 asks for the actual bibliographic identification.
- The arbitrary-cardinality strong Adams convergence assertion in §4.2 was not source-certified from an exact readable theorem. Miller’s notes and the finite calculations do not establish that full generality. The README correctly distinguishes derived completion from tensor completion, but the coherent global comparisons and complete ABP/A(1) resolutions remain proof targets rather than consequences of these checks.
- `abs1964`, *Clifford modules*: retained as the previously reported uncertified source. No repeated request for this settled item was added. The real/complex normalization was checked against the pinned supplier contracts, not against an unavailable copy of this paper.

A consolidated missing-reference file records the unresolved requests under their existing keys; successful retries are not left on that list. The source manifest itself was not edited during review.

## Source issues

- **Misprint** in pyronneau2024 at Lemma 2.12 proof, printed p.5: the source leaves the anisotropic normal form's Arf value unfinished; it should be 1; affects the proof.
- **Misprint** in pyronneau2024 at Lemma 2.13 proof, printed p.5: the counting recurrences add a quadratic value at an unspecified vector; they should add the opposite count, p′=3p+n and n′=3n+p; affects the proof.
- **Misprint** in lee2013 at the smooth-family definition preceding Proposition 6.34, printed p.145: a family of maps N→M is assigned a joint map M×S→N; it should be N×S→M; affects nothing.
