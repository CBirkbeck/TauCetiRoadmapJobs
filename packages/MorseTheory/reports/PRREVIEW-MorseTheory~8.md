# Review of MorseTheory (pull request #1682 at a6876c4)

**Verdict:** needs changes

:robot: Independent AI incremental re-review of 18 changed lines since fc36307. Four findings remain, two blocking (P2). The new page locators are correct; they do not repair the two blocking findings. The gate, targeted build and direct elaboration pass. No pull-request file was changed.

## R01 (P2) — Move the nonproper extension to MorseTheoryPartII

**Location:** `TauCetiRoadmap/MorseTheory/README.md:1097`: “Palais–Smale compactness without properness”; also `TauCetiRoadmap/MorseTheory/PalaisSmaleTargets.lean`.

**Claim:** The unchanged §6.2 adds sequential compactness, noncompact-band deformation and nonproper global convergence to an existing roadmap. The contract requires this extension to be a Part II that imports the base development.

**Witness:** Main's `TauCetiRoadmap/MorseTheory/README.md:649–666` stops at compact trapping and proper sublevels. For f(x,y)=x, gradient norm is 1, PS holds vacuously, and f⁻¹[0,1]=[0,1]×ℝ is noncompact.

**Exact repair:** Move §6.2 and its acceptance statements into MorseTheoryPartII, whose introduction identifies the base's compact-band and compact-trapping boundary and consumes its sections. Keep corrections to base targets here. Preserve the nonproper test: (x,y)↦(x−t,y) has speed 1, and stopping at time max(x,0) retracts {x≤1} onto {x≤0}. Moving ownership repairs the scope boundary while preserving this nonproper example.

## R02 (P2) — State the Palais–Smale headline on the promised manifolds

**Location:** `TauCetiRoadmap/MorseTheory/README.md:1152–1155`: “native finite-dimensional real inner-product-space specialization”; `TauCetiRoadmap/MorseTheory/PalaisSmaleTargets.lean:47`.

**Claim:** The README still promises complete smooth Riemannian manifolds and exponential convergence. The theorem still quantifies over a fixed vector space E and concludes convergence without a rate. Suggested.lean does not state this headline or identify a missing carrier.

**Witness:** On round S¹, f(θ)=cos θ has θ(t)=2 arctan(eᵗ) from θ₀=π/2, with distance to π equal to 2 arctan(e⁻ᵗ)≤2e⁻ᵗ. S¹ is not the theorem's vector-space carrier E.

**Exact repair:** In Part II's Suggested.lean, define sequential PS using the native tangent-fiber Riesz gradient and state forward existence and convergence with intrinsic exponential decay. Retain finite dimension, boundarylessness, smooth Riemannian metric, compatible complete extended metric, Morse f, bounded-below range and PS. These native carriers remain available at the unchanged pins: `Bundle.RiemannianBundle`, `IsContMDiffRiemannianBundle`, `IsRiemannianManifold`, `CompleteSpace`, `IsMIntegralCurveOn` and `Manifold.riemannianEDist`. The previous review's elaborated manifold prototype remains applicable. The repaired scope includes the circle witness with C=2,c=1,T=0 and the zero-dimensional constant trajectory with distance 0.

## R03 (P3) — Normalize the extra Lean file and document its names

**Location:** `TauCetiRoadmap/MorseTheory/PalaisSmaleTargets.lean:2–9`: three Mathlib submodule imports and “These signatures specialize M6.1”.

**Claim:** The Lean form rules apply to this unchanged file as well. It lacks the single Mathlib import, required target-signatures module description, layer heading and README name correspondence.

**Witness:** Lines 2–4 import Mathlib submodules; the corresponding README section is §6.2. Its five declarations—Satisfies, of_isProperMap, finite_criticalValueBand, exists_gradient_lowerBound and exists_forwardTrajectory_converges—are absent by name from the README.

**Exact repair:** When moving the extension, use `import Mathlib` followed by the used Tau Ceti imports, the specified module and layer docstrings, and the final retained names in the README. Recheck those final signatures. The present combined scratch audit elaborated all five declarations; the x² tests still give critical band {0}, gradient lower bound 2 on [1,4], and trajectory x₀e^(−2t). No mathematical narrowing is needed.

## R04 (P3) — Record the references and their verification status

**Location:** `TauCetiRoadmap/MorseTheory/README.md:1195–1216`, especially “Bibliographic attribution only; the mathematical targets use the references above.”

**Claim:** The added printed-page locators and the clarification of Mark's role repair part of the previous finding. The six referenced works still have no sources.toml provenance/status records.

**Witness:** The folder contains README.md, Suggested.lean, PalaisSmaleTargets.lean, metadata.toml, STATUS.md and PROGRESS.md, but no sources.toml. Hirsch's exact pages remain uncertified; the new readable-source locators are verified below.

**Exact repair:** Add one source record per work, reusing `milnor-morse`, `cohen-iga-norbury`, `hirsch-differential-topology`, `weber-conley`, `morgan-condition-c` and `mark-math240`. Preserve Hirsch's settled uncertified status and honestly record Mark as bibliographic attribution without certified text. Keep the newly verified locators; do not invent inaccessible pages or rename settled keys. This metadata repair leaves the compact-band x² calculation and the infinite discrete CW exhaustion unchanged.

## Previous findings

- R01 — not repaired: README §6.2 remains at lines 1097–1175, with nonproper PS deformation and convergence; PalaisSmaleTargets.lean remains in the base folder.
- R02 — not repaired: README:1152–1155 and PalaisSmaleTargets.lean:47 still use a vector-space specialization and omit the promised intrinsic exponential conclusion.
- R03 — not repaired: PalaisSmaleTargets.lean:2–9 retains the three submodule imports and old M6.1 docstring; the five names still lack README counterparts.
- R04 — partly repaired: README:512,598,641,898–899,1197–1216 and Suggested.lean:107 add correct pages and qualify Mark's role. Source records are still absent.

No supplied repair report marks these findings not actionable in this package. The four dispositions refer to [r7], not to its earlier-history table.

## Verified sound

This is an incremental review, not a fresh review of every unchanged target. The diff changes citations and bibliographic attribution only: no mathematical formula, theorem type, definition body, supplier or dependency changes. The 173 previous adversarial rows are carried below with attribution; ten fresh rows cover the affected mathematical claims. Prior one-tactic probes for all sixteen admissions are carried from [r7], since all their types and bodies are unchanged. No new padding was introduced.

**Build and signatures.** Head a6876c44f1b512b3a103838bea5313f016b27171; Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a; Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039; main context fa41b3747f56d4e77bd69e7099c1be4f2e4959ba. The outside-folder diff is empty.

The supplied gate includes build=0. The independent gate rerun printed:

```text
gate MorseTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The separate targeted `lake build TauCetiRoadmap.MorseTheory.Suggested` completed successfully. Direct `lake env lean` elaboration of Suggested.lean exited 0 with twelve sorry warnings only. A single combined scratch copy printed `#check @name` for all 21 declarations (16 in Suggested.lean, 5 in PalaisSmaleTargets.lean), also exiting 0 with its sixteen expected sorry warnings.

I compared those elaborated signatures with the README. The three flagged raw definitions deliberately omit the standing geometric assumptions: README:32–35 explicitly permits this for criticalPoints, criticalCount and sublevelInclusion. All twelve base theorem signatures retain the standing geometric binders; the PS predicate retains completeness for the vector-space gradient and its four theorems retain finite dimension. Nothing changed in those types. The manifold-generality omission is R02, not a silently dropped binder.

**Headline inventory.** Normalized Morse charts; compact critical-set finiteness; regular scalar levels and tangent kernels; compact-band deformation; relative handles and coherent chart comparisons; proper Morse CW exhaustion; strong/relative Morse approximation; proper bounded-below Morse existence; strong polynomial inequalities; arbitrary-function LS cover/bound and its ambient deformation bridges; two-critical-point sphere recognition; Morse–Bott normal form, negative-bundle attachment and filtered inequalities; compact-trapped intrinsic convergence and exponential decay; PS critical-band deformation and global convergence. Suggested.lean states the statable base headlines and names the missing strong-topology, family-attachment and Bott filtered-complex carriers. R02 remains the omitted statable extension headline.

**Sources checked in the changed passages.** Three works were fetched through the sources service from the same legal copies used by [r7]. Milnor's two-page spreads were also inspected visually where the extraction interleaves columns. No source text was copied into the repository or this report.

| Affected passage / sampled target | Exact evidence read | Result |
| --- | --- | --- |
| §2.3, README:512,598; Milnor reference | milnor-morse line 3623, Lemma 3.6, printed pp.20–21; proof on p.21 inspected visually | Homotopic disk attachments have the stated comparison; after reversing endpoints and reparametrizing by h, inner 2x and outer time 2−2r match the README. |
| §2.4, README:638–641; Suggested:107 | milnor-morse line 3565, Theorem 3.5 p.20; cohen-iga-norbury line 1519, Theorem 5.7 pp.40–41 | Milnor assumes compact sublevels; proper plus bounded below supplies these. Cohen's theorem assumes closed M. The README distinguishes the proper extension and supplies its tower route. |
| §2.2 and references:1198,1201 | milnor-morse line 2225, Theorem 3.1 p.12; cohen-iga-norbury line 1202, Theorem 5.1 pp.33–35 | Critical-free compact band versus compact manifold with boundary and endpoint boundary levels; hypotheses retained. |
| §1.3 and references:1201–1202 | cohen-iga-norbury line 1322, Theorem 5.3 pp.36–37 | Nondegenerate critical point, index λ and normalized signed squares; no attribution of parameter persistence to this theorem. |
| §2.3 and references:1202 | cohen-iga-norbury line 1438, Theorem 5.6 pp.38–40 | Admissible compact band with one critical point gives the λ-cell attachment. Known sign/domain slips below are not adopted by the roadmap. |
| §3.2 and references:1199 | milnor-morse line 6228, Corollary 6.7 p.36, including its closed-embedding/squared-distance proof | Morse exhaustion with compact sublevels; the claimed nonnegative proper witness follows from that proof. |
| §4.2, README:898–899 | weber-conley line 65, Theorem 1.1 p.2; lines 73–106, proof pp.2–3 | C² function on closed M; finite critical sets supply a cover by that many nullhomotopic opens. No nondegeneracy premise. Author-version numbering agrees. |
| Mark attribution, README:1214–1216 | Only the bibliographic claim was changed | It expressly stops using the unavailable homework to certify mathematical targets. No new source request is needed for that attribution. |

For the seeded sample, §§1.3,2.2,2.3,2.4,3.2,4.2 were rechecked where their citations changed. The checks of §§1.1,1.2,2.1,3.1,4.1,4.3,5.1,6.1,6.2 and unchanged portions of the other sections are inherited from [r7]; their computed rows remain below. Hirsch's inaccessible locator remains uncertified.

**Pinned APIs reopened for the affected claims and findings.** Paths below are relative to the respective pinned library root.

| Pinned file and line | What was checked |
| --- | --- |
| `Mathlib/Topology/CWComplex/Classical/Basic.lean:99,135` | RelCWComplex and CWComplex have actual cell types and characteristic maps; no T2Space assumption is built in. Suggested:112 explicitly requests it. |
| `Mathlib/Topology/Homotopy/Equiv.lean:43` | HomotopyEquiv carries continuous forward/inverse maps and both inverse homotopies, not a free proposition. |
| `TauCeti/Geometry/Manifold/Morse/Basic.lean:99,178` | IsMorse includes smoothness and native nondegenerate critical points. |
| `TauCeti/Geometry/Manifold/Morse/Index.lean:74,140,154` | Preferred-chart index and complementary-index theorem with its nondegeneracy premise; the repair does not change these. |
| `TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Riesz.lean:74,85` | Tangent-fiber Riesz dual and inner-product law; a native gradient is statable on general finite-dimensional manifolds. |
| `Mathlib/Geometry/Manifold/IntegralCurve/Basic.lean:65` | IsMIntegralCurveOn specifies the vector-field equation on the selected time set. |
| `Mathlib/Geometry/Manifold/Riemannian/Basic.lean:79`; `PathELength.lean:207` | Compatible extended distance and riemannianEDist as the infimum of smooth path lengths. Completeness is an additional hypothesis. |

**Ownership and supplier resolution.** The indexed `roadmaps grep` searched the attachment/CW-tower, categorical-cover and Palais–Smale objects on main and open heads; the same objects were searched in readable board package README/Lean files and relevant pinned topology/Morse files. Generic pushout, tower and LS-cover ownership remains AlgebraicTopology; the chart-specific comparison, Morse cell labels and gradient application belong here. No ownership change or new declaration was introduced by the repair. Existing-roadmap revision heads were not used as suppliers.

The citation resolver reports no unresolved roadmap citations or Lean names. It explicitly could not inspect pinned Lake packages, so its result is not evidence for library declarations; the manual pin checks above supply that evidence. The following 13 cross-roadmap groups were reopened/resolved against main, except the two specified open heads.

| Repository-relative location | Contract verified |
| --- | --- |
| `TauCetiRoadmap/DifferentialGeometry/README.md:371–400,507–510,884,910–923` | Flows, boundary orientation, Sard, smooth metrics and Riesz gradient. |
| `TauCetiRoadmap/AlgebraicTopology/README.md:624–740,1080–1155` | Disk pairs, relativeCWPushout, homotopyPushoutGluingComparison, relativeCWPushoutCWModel, cofibrationTowerHomotopyEquivalence, cwSubcomplexTowerUnion, independent categorical covers and cup bound. |
| `TauCetiRoadmap/GeometricTopology/README.md:195–222` | Collars, boundary gluing, tubular and disk-bundle interfaces. |
| `TauCetiRoadmap/CharacteristicClasses/README.md:550–562,600–646` | Disk/sphere-bundle cells and orientation-twisted Thom comparison. |
| `TauCetiRoadmap/ComplexManifolds/README.md:172–193` | Milestone 1 scalar restriction and model/atlas transport. |
| `TauCetiRoadmap/ComplexKahlerGeometry/README.md:1407–1465` | K7.1 projective realification and K7.2 independent cellular homology. |
| `TauCetiRoadmap/DGFloer/README.md:612–647` | Filtered-complex spectral objects, convergence and classical E¹ convention. |
| `TauCetiRoadmap/HeegaardFloer/README.md:203–214` | Morse-trajectory homology consumer; distinct from attachment CW models. |
| `TauCetiRoadmap/RiemannianGeometry/README.md:160–175` | R3 finite broken-geodesic applications consume this core. |
| `TauCetiRoadmap/AffineMorseLefschetz/README.md:189–203` | Approximation, CW dimension and top-homology consumer. |
| `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:73–103` | T2 consumes Morse–Bott attachment. |
| `TauCetiRoadmap/HomotopySpheres/README.md:1466–1480`, supplied open head | §4B consumes RiemannianGeometry and MorseTheory M5. |
| `TauCetiRoadmap/MorseNovikov/README.md:130–145`, supplied open head | Consumes M1–M4/M6; closed-one-form periods are its additional construction. |

All Needs lines and layer dependency paragraphs were compared with these contracts; no new edge was added. No supplier gaps are declared. Required dependency-check output:

```text
depcheck: 204 roadmaps, 1596 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The increased global edge count from [r7] is not a new dependency of this folder.

**Adversarial table: 183 rows.** Rows 1–173 carry the previous report's calculations, each citing [r7]; any old line references inside those rows refer to fc36307. Rows 174–183 are fresh calculations for the affected claims. These are mathematical tests, not proofs of the general results. No theorem signature changed.

| # | Statement | Instances tried | Computed values on both sides | Result / change |
| --- | --- | --- | --- | --- |
| 1 | §1.1 boundaryless model homeomorphism | self-model ℝ²; half-line | range=id(ℝ²)=ℝ²; half-line range=[0,∞)≠ℝ | Boundarylessness excludes the second; retain.  Carried from [r7]. |
| 2 | §1.1 preferred/extended charts and inverse | c=id, I=id; y=2x | I∘c=x; inverse(y)=y/2 and forward(inverse(y))=y | Retain domains and actual inverse.  Carried from [r7]. |
| 3 | §1.1 source/target derivative transport | f(x)=x, y=2x | derivative in x is 1, in y is 1/2; chain product (1/2)·2=1 | Transport rather than naked equality; retain.  Carried from [r7]. |
| 4 | §1.1 maximal-atlas correspondence | charts x and 2x | transitions 2x and x/2 have inverse derivatives 2 and 1/2 | Both smooth directions; retain.  Carried from [r7]. |
| 5 | §1.1 immersion complement transport | ℝ→ℝ², v↦(0,v) | image=span(e₂), complementary span(e₁); rechart target by diag(2,3) gives image span(e₂) | Same complement transported; retain.  Carried from [r7]. |
| 6 | §1.1 critical/index transport | f=−x², y=2x | Hessians −2 and −1/2; critical sets {0}, indices 1=1 | Derivatives change, index does not.  Carried from [r7]. |
| 7 | §1.1 scalar zero/level homeomorphism | f=x, c=3 | f−3=0 iff x=3; both subtypes have one point | Retain exact subtype map.  Carried from [r7]. |
| 8 | criticalPoints real body | x²; x; constant | derivative zero sets {0}; ∅; all of M | Wrong universal/empty locus excluded.  Carried from [r7]. |
| 9 | critical-set closedness | x² on ℝ; constant on S¹ | zero sets {0} and S¹, both closed | Smoothness makes derivative continuous; retain.  Carried from [r7]. |
| 10 | criticalCount real body | −x²+y²; point; ∅ | counts c₁=1, other c_j=0; point c₀=1; empty all 0 | Extended-count convention consistent.  Carried from [r7]. |
| 11 | infinite critical counts | constant on S¹ | Hessian 0, index 0, c₀=∞; Nat.card of the infinite carrier would be 0 | ENat is essential; retain.  Carried from [r7]. |
| 12 | index bound/out-of-range j | −x²+y², j=3 | index 1≤2; c₃=0 | No natural subtraction used to invent cells.  Carried from [r7]. |
| 13 | critical Hessian normalization | −x²+y² | d²f=diag(−2,2); quadratic evaluation −2u²+2v² | No factor 1/2 in Hessian.  Carried from [r7]. |
| 14 | symmetry and congruence | x²; x=y/2 | Hessian 2; (1/2)·2·(1/2)=1/2 | Congruence, not componentwise equality.  Carried from [r7]. |
| 15 | connection independence only at criticality | f=x, connection Γ=c; f=x² at 0 | Hess f=−c for the first; Hess f(0)=2−c·0=2 for the second | Criticality necessary.  Carried from [r7]. |
| 16 | complementary index | f=0 on ℝ; x² | 0+0≠1; 0+1=1 | Constant-function counterexample excluded by nondegeneracy; x² satisfies 0+1=1. Repaired.  Carried from [r7]. |
| 17 | direct sum index | −x² plus y² | 1+0=1, equal to index diag(−2,2) | Native product law applies.  Carried from [r7]. |
| 18 | restrictions and positivity | diag(−2,2) on e₁/e₂ | restricted values −2u² and 2v²; indices 1 and 0 | Neither restriction inherits the full form's inertia.  Carried from [r7]. |
| 19 | normalized Morse chart headline | f=2x², ψ=√2x | 2x²=(√2x)²; Hess f=4, normalized Hessian 2 | Division by √2 after Hessian isometry is consistent.  Carried from [r7]. |
| 20 | chart critical zero set and local extrema | ±x²; −u²+v² | gradient zero only at 0; values ±r²; saddle values −r²,+r² | Minimum/maximum depend on index; retain.  Carried from [r7]. |
| 21 | finite_criticalPoints_inter | x² on [−1,1]; constant on S¹ | 1 critical point; ∞ for constant but Morse premise false | Compactness plus closedness and isolation, not isolation alone.  Carried from [r7]. |
| 22 | compactness versus isolated subsets | {1/n:n≥1}⊂[0,1] | infinitely many isolated members; closure adds 0 | README's use of a closed critical locus avoids this error.  Carried from [r7]. |
| 23 | C² critical-branch persistence | f_t=x²+tx | x_t=−t/2, Hessian 2, critical value −t²/4 | Smooth branch and constant index 0.  Carried from [r7]. |
| 24 | failure across birth-death | f_t=x³−tx | t<0:0 zeros; t=0:Hess=0; t>0:±√(t/3), Hess=±6√(t/3) | Persistence cannot cross degeneracy.  Carried from [r7]. |
| 25 | compact Cᵏ seminorms | h=δx² on [−1,1], k=2 | sup values δ, derivative 2δ, second derivative 2δ | Order-0-only control is insufficient; retain all orders.  Carried from [r7]. |
| 26 | seminorm restriction/intersection | h=δx²; smaller core [−1/2,1/2] | zeroth norm δ→δ/4; intersection ε₁,ε₂ gives min(ε₁,ε₂) | Retain compact-core laws.  Carried from [r7]. |
| 27 | fixed-chart seminorm equivalence | x=y/2, h=x² | first derivative norm scales by 1/2, second by 1/4 before core adjustments | Finite constants compare compact charts.  Carried from [r7]. |
| 28 | §2.1 regular-level headline | f(x,y)=x, c=0 | level={(0,y)}, Df=(1,0), range Di=span(e₂)=ker Df | Embedded atlas and tangent kernel agree.  Carried from [r7]. |
| 29 | zero/nonzero level in dimension 0 | point with f=0 | c=0: zero map 0→ℝ not onto; c=1: level empty, model dimension 0−1=0 | Empty regular levels are allowed; attained ones excluded.  Carried from [r7]. |
| 30 | regularity negative control | f=x²,c=0 in dimension 1 | level tangent dimension 0 but ker Df=ℝ | Kernel conclusion fails without regularity.  Carried from [r7]. |
| 31 | Fredholm index supplied to section-zero | D:ℝ²→ℝ, D(x,y)=x | ker dimension 1, cokernel dimension 0, index 1=2−1 | Integer/natural index agree at regular zeros.  Carried from [r7]. |
| 32 | preferred kernel chart | projection π(x,y)=(0,y), K(0,y)=y | chart at (0,y₀) sends (0,y)↦y−y₀; inverse sends v↦(0,y₀+v) | Same π and K required.  Carried from [r7]. |
| 33 | implicit coordinate and zero slice | f=x+x² near 0 on ℝ² | Φ(x,y)=(x+x²,y), derivative=id at 0; Φ⁻¹(0,y)=(0,y) locally | Local restriction excludes the second zero x=−1.  Carried from [r7]. |
| 34 | changed complements | π_a(x,y)=(0,y−ax) for D(x,y)=x | on ker D both π_a(0,y)=(0,y); L_a⁻¹(0,y)=(0,y) | Common kernel slice; retain.  Carried from [r7]. |
| 35 | sublevel/band inward coordinate | f=x, band [a,b] | lower t=x−a≥0, upper t=b−x≥0; sublevel t=a−x≥0 | Signs correct.  Carried from [r7]. |
| 36 | interior chart at critical points | x² at 0 in {x²<1} | df(0)=0, translated coordinate b+y>b−r>0 | Interior charts need no regularity of df.  Carried from [r7]. |
| 37 | boundary tail reindexing | dimension 2=n+1, n=1 | Fin(2−1)=Fin1; β₁ maps one Euclidean coordinate to same one-entry function | Explicit β and Fin.cast remove type mismatch.  Carried from [r7]. |
| 38 | boundary/level identification | x on [a,b] | boundary two points maps to level a⊔level b; zero normal coordinate at each | Correct carrier/dimension.  Carried from [r7]. |
| 39 | boundary orientation | [a,b] oriented by dx | outward vectors −∂x,+∂x give signs −1,+1; integral of d x is b−a | Outward-first convention agrees.  Carried from [r7]. |
| 40 | dimension-0 band | discrete f with no values in [a,b] | band ∅; lower and upper sublevels equal | No fictitious negative-dimensional boundary.  Carried from [r7]. |
| 41 | sublevelInclusion identity | f=x², a=b=1 | x=1 maps to 1, as does id | Explicit identity Check now at README:493; correct.  Carried from [r7]. |
| 42 | sublevelInclusion composition | levels 1≤4≤9, x=1 | direct 1↦1; composite 1↦1↦1 | Explicit composition Check now at README:494; correct.  Carried from [r7]. |
| 43 | closed endpoint in inclusion | f=x²,a=1,x=1 | 1≤1 true; 1<1 false | Explicit endpoint Check now at README:495; correct.  Carried from [r7]. |
| 44 | compact-band strong deformation | x², 0<a<b | x≥√a goes to √a, x≤−√a to −√a; inside remains x | Retraction/inclusion composite fixed on M_a.  Carried from [r7]. |
| 45 | normalized field and hitting time | x² on band [a,b], a>0 | X=−1/(2x); d(x²)/dt=−1; hit time x²−a | Denominator ≥4a>0; retain.  Carried from [r7]. |
| 46 | regular-band product | x², 0<a<b | two level points ×[a,b] gives two closed intervals, f value=t | Product assertion has both components.  Carried from [r7]. |
| 47 | sublevel homeomorphism | x², 0<a<b | x↦√(a/b)x maps [−√b,√b] onto [−√a,√a] | Distinct from the noninjective retraction.  Carried from [r7]. |
| 48 | local/global minimum disc | x²; (x²−1)² | one interval near 0; double well small sublevel has two intervals | Unique-global-minimum premise matters.  Carried from [r7]. |
| 49 | adapted pseudo-gradient definition | −u²+v² | X=(2u,−2v), df(X)=−4(u²+v²)<0 off 0 | Wrong field (−2u,−2v) gives +4u² on v=0.  Carried from [r7]. |
| 50 | adapted flow/composition/inverse | same quadratic | Φ_t=(e²ᵗu,e⁻²ᵗv); Φ_sΦ_t=Φ_(s+t), Φ_−tΦ_t=id | Retain while inside chart.  Carried from [r7]. |
| 51 | adapted energy identity | same quadratic | d f(Φ_t)/dt=−4(e⁴ᵗu²+e⁻⁴ᵗv²) | Integrates to f(Φ_T)−f(Φ_0); retain.  Carried from [r7]. |
| 52 | compact completeness versus escaping field | S¹ smooth field; X=x² on ℝ | compact field has bounded coordinate continuation; x'=x² gives x=x₀/(1−x₀t), finite blowup | Completeness not inferred from smoothness alone.  Carried from [r7]. |
| 53 | pseudo-gradient rescaling | f=x, X=−2 | df(X)=−2; rescale by 1/2 gives −1 | Positive rescaling preserves descent, changes hitting time.  Carried from [r7]. |
| 54 | index-0/full-index handle | x² and −x² in ℝ | λ=0 adds point up to homotopy; λ=1 has D¹ boundary S⁰ of two points | Empty-sphere/whole-dimension cases retained.  Carried from [r7]. |
| 55 | simultaneous critical points | two disjoint copies of x² | two minima at value 0 give two 0-cells, H₀ rank 2 | One cell per point, not per value.  Carried from [r7]. |
| 56 | handle-to-cell comparison relative base | interval attached to point at both ends | adjunction S¹, H₁=ℤ; base point maps identically | Relative condition rules out an unrelated equivalence.  Carried from [r7]. |
| 57 | §2.3 admissible shrinking | negative disk radius √ε, 0<ε'≤ε | √ε'≤√ε; levels c−ε'≥c−ε | Smaller chart fits, retraction direction goes to lower value.  Carried from [r7]. |
| 58 | double-well attaching maps | ε=1/2, s=1 | α₊=√(1−1/√2)≈0.541196; α₋≈−0.541196; f=1/2 at both | Different lower components; reflection needed.  Carried from [r7]. |
| 59 | reflected RP² attachment | normalized top chart | boundary winds +2 around the stated core; first-coordinate reflection gives −2 | Unequal π₁ classes, same reflected adjunction pair.  Carried from [r7]. |
| 60 | Milnor comparison seam | radius r=1/2 | inner h(2rθ)=hθ identified with α₀(hθ); outer H(θ,1)=α₀(hθ) | Seam agrees.  Carried from [r7]. |
| 61 | Milnor comparison outer boundary | r=1 | outer H(θ,0)=α₁θ, same as source attaching identification | Descends to the pushout.  Carried from [r7]. |
| 62 | strict attachment equality | h=−id on D¹, α₁=α₀h | id on base and h on disk glue; h²=id | Homeomorphism rel base, not labelled-map homotopy.  Carried from [r7]. |
| 63 | quadratic transition deformation | Lorentz boost A=[[cosh s,sinh s],[sinh s,cosh s]] | Q(A(x,0))=−x²; A_uu²=cosh²s≥1 | Negative block invertible; P≥I.  Carried from [r7]. |
| 64 | positive-component contraction | same boost, factor (1−t) | Q=−cosh²s x²+(1−t)²sinh²s x²≤−x² | Boundary never rises above small lower level.  Carried from [r7]. |
| 65 | polar contraction | A_uu=hP, one-dimensional P=cosh s | Q(hP^(1−t)x,0)=−P^(2−2t)x²≤−x², endpoint −x² | Retain positive powers with P≥1.  Carried from [r7]. |
| 66 | nonlinear scaling at s=0 | T preserving Q, DT(0)=A | T(sx)/s→Ax; Q(T(sx)/s)=Q(x) for s>0 and at limit | Compact local domain control required as stated.  Carried from [r7]. |
| 67 | annulus two-stage seams | β(δ)=0, β(√ε)=1 | inner: R₀=id; outer first stage fixes M_(c−ε), second uses R₁ into M_(c−ε) | Both stages are maps of pairs.  Carried from [r7]. |
| 68 | comparison independence with pair homotopy | Φ₀E_H≃Φ₁, Ψ₀Φ₀≃id | E_H≃Ψ₀Φ₁ for every admissible K | Independence comes from the pair comparison, not arbitrary boundary H.  Carried from [r7]. |
| 69 | triple charts and orthogonal path | λ=1, chart signs +,−,+ | h₀₁=−1,h₁₂=−1,h₀₂=1; product 1 | Correct component; no claim polar factors multiply strictly in general.  Carried from [r7]. |
| 70 | orientation law | λ=0,1,2; reflection | λ0 determinant1/empty boundary; λ1 swaps ±1; λ2 degree −1 | Correct exceptional low indices.  Carried from [r7]. |
| 71 | metric-only chart comparison | same φ and ε, metrics g,4g | χ and α unchanged, h=id; speeds differ by factor 1/4 | Attaching maps are metric-independent here.  Carried from [r7]. |
| 72 | unequal ε comparison | ε₀=1/4≤ε₁=1/2 | b:M_(c−1/4)→M_(c−1/2); radius 1/2 expands by flow to 1/√2 | Direction and common smaller chart match.  Carried from [r7]. |
| 73 | parameter uniformity/restriction | fixed Q=−x²+y², boost charts A_s, s∈[0,1] | ‖A_s‖,‖A_s⁻¹‖≤e; choose δ<√ε/e for every s | Restriction to endpoints preserves these charts and bounds.  Carried from [r7]. |
| 74 | §2.4 finite CW headline | S² height | c₀=c₂=1,c₁=0; CW cells 1,0,1 | Now stated in Suggested:108; cell counts agree.  Carried from [r7]. |
| 75 | proper noncompact CW headline | ℝ,x² | one critical 0-cell, CW point, H₀=ℤ and higher homology 0 | Suggested:108 includes this noncompact proper case.  Carried from [r7]. |
| 76 | infinite CW exhaustion | discrete ℕ,f(n)=n | stage below k+1/2 has k+1 points/cells; union has ℵ₀ 0-cells | Infinite case must not use finite Nat.card.  Carried from [r7]. |
| 77 | empty initial sublevel | x² lower bound0, a₀=−1 | M_(−1)=∅; start CW has 0 cells | Retain.  Carried from [r7]. |
| 78 | strict tower compatibility | discrete example | inclusion i↦i; φ_(k+1)\|{0,…,k}=φ_k=id | Correct use of actual commuting maps.  Carried from [r7]. |
| 79 | compact finite-stage factorization | compact subset of discrete ℕ | compact⇒finite; N=max points gives containment in stage N | Properness supplies this on sublevels.  Carried from [r7]. |
| 80 | relative band/opposite function | circle between regular heights | each boundary circle-point set has two points; λ(−f)=1−λ(f) at Morse extrema | Relative attachments require regular endpoints; complementary index has the Morse premise.  Carried from [r7]. |
| 81 | §3.1 strong topology at point | M=point | all derivatives of order≥1 vanish; condition reduces to \|g−f\|<ε | Ordinary topology on ℝ.  Carried from [r7]. |
| 82 | compact-chart strong topology | S¹, finite cover | finitely many tolerances have minimum ε>0; each derivative through k bounded by ε | Compact Cᵏ comparison; retain.  Carried from [r7]. |
| 83 | noncompact fine versus compact-open | ℝ, tolerance e^(−x²), constant δ≠0 | at large x, e^(−x²)<\|δ\|; on [−1,1], \|δ\|<e⁻¹ can pass | Strong distinction correct.  Carried from [r7]. |
| 84 | restriction continuity | ℝ→(0,1), δψ=δ near0 | source seminorms O(δ)→0; at x=δ/2, target error δ>x | Now a negative Check at README:700; only compact-core or proper/clopen strong restriction asserted.  Carried from [r7]. |
| 85 | local linear Morse perturbation | x³−tx | t>0 roots ±√(t/3), second derivatives nonzero; t<0 no roots | Morse nearby; t=0 degenerate.  Carried from [r7]. |
| 86 | summable perturbation control | bounds ε·2^(−r−1) | total ≤ε; tail after N ≤ε·2^(−N) | Provides convergence and persistence margins, not a Baire assertion.  Carried from [r7]. |
| 87 | §3.2 bounded perturbation preserves exhaustion | f=x², \|g−f\|<1 | g≥−1; g≤b⇒x²<b+1 | Sublevel stays in compact interval; retain continuity.  Carried from [r7]. |
| 88 | Morse exhaustion headline | ℝ; point; ∅ | x² proper/lower0; point constant0 proper; empty range bounded below by0 | Includes all degenerate dimensions.  Carried from [r7]. |
| 89 | discrete exhaustion/negative control | ℕ with f(n)=n; constant0 | finite sublevels vs f⁻¹{0}=ℕ noncompact | Properness distinguished.  Carried from [r7]. |
| 90 | relative approximation | f=x² near closed set {0}; perturbation supported outside [−1,1] | f and all derivatives unchanged near0; Hessian stays2 | Neighborhood fixing, not merely pointwise fixing.  Carried from [r7]. |
| 91 | lack of uniform perturbation control | x² plus −x² | resulting0 has entire ℝ as sublevel at0 | Uniform bound cannot be omitted.  Carried from [r7]. |
| 92 | bettiNumber actual carrier | point,∅,S¹ over k | b=(1,0,…),(0,0,…),(1,1,0,…) | Native homology finrank, not arbitrary supplied numbers.  Carried from [r7]. |
| 93 | homotopy invariance/finite dimensionality | ℝ≃ₕpoint; finite r points | b₀=1=1; b₀=r, higher0 | Finrank natural values justified in compact theorem.  Carried from [r7]. |
| 94 | strong polynomial headline | S² | C=1+t², B=1+t², Q=0; both sides1+t² | Retain.  Carried from [r7]. |
| 95 | coefficient dependence | RP², k=ℚ then 𝔽₂ | ℚ:1+(1+t)t=1+t+t²; 𝔽₂:B=C,Q=0 | Both equal C; no orientability premise needed.  Carried from [r7]. |
| 96 | zero-dimensional/empty polynomial | r points and ∅ | C=B=r,Q=0; r=0 gives0=0 | No junk-cardinality issue.  Carried from [r7]. |
| 97 | coefficient of Q | RP² cellular ∂₂=2 over ℚ | rank ∂₂=1, Q₁=1; ∂₁=0,Q₀=0 | Correct adjacent-boundary indexing.  Carried from [r7]. |
| 98 | weak/Euler do not imply strong | c=(2,0,0,2),b=(1,0,0,1) | weak holds, Euler0=0; first alternating sums −2<−1 | Negative Check is correct.  Carried from [r7]. |
| 99 | strong implies weak and Euler | c_j=b_j+q_j+q_(j−1) | c_j−b_j≥0; evaluating t=−1 gives C(−1)=B(−1) | Add adjacent alternating inequalities, not subtract.  Carried from [r7]. |
| 100 | relative strong identity | (D²,S¹) | relative C=B=t²,Q=0 | Relative coefficients and degree shift agree.  Carried from [r7]. |
| 101 | subgroups/top homology freeness | 2ℤ⊂ℤ; ⊕ₙ2ℤ⊂⊕ₙℤ | bases {2} and {2e_n}; both free, including infinite rank | Finite-rank pinned PID result alone is insufficient.  Carried from [r7]. |
| 102 | top cohomology warning | RP² cellular chains | H₂(−;ℤ)=0 free, H²(−;ℤ)=ℤ/2 | Correct refusal to infer top cohomology torsion-freeness.  Carried from [r7]. |
| 103 | cohomology above CW dimension | wedge of countably many circles,d=1 | H₁=⊕ℕℤ free, Ext(H₁,ℤ)=0, H²=0 | Infinite-rank freeness is relevant.  Carried from [r7]. |
| 104 | LS headline empty/point | ∅; point | categorical opens0/count0; opens1/count1 | Empty cover does not need a nullhomotopy into ∅.  Carried from [r7]. |
| 105 | LS arbitrary-function bound | S¹ height; constant | category2≤critical count2; category2≤∞ | Counts points; no Morse assumption on bound.  Carried from [r7]. |
| 106 | LS torus and cup length | T², cosθ+cosφ | critical count4, unnormalized category3, cup length2 | 4≥3=2+1.  Carried from [r7]. |
| 107 | disconnected LS sum | two disjoint circles | category2+2=4; two heights have2+2=4 critical points | A categorical open cannot bridge clopen components.  Carried from [r7]. |
| 108 | compact Fermat scope | compact boundaryless S¹; [0,1] with f=t | circle has min/max zeros; interval df=1, count0 | Boundary example violates missing boundaryless premise.  Carried from [r7]. |
| 109 | degenerate-level deformation headline | f=x⁴ locally at minimum, U=(−r,r) | for 0<ε<r⁴, {x⁴≤ε}⊂U; {x⁴<−ε}=∅ | Must use U disjunct; Hessian0 rules out Morse lemma.  Carried from [r7]. |
| 110 | no critical points at selected c | S¹ height, c=0, U=∅ | middle band avoids ±1; endpoint must have f<−ε | First disjunct, no artificial critical neighborhood.  Carried from [r7]. |
| 111 | annulus energy-drop estimate | x⁴, r≤x≤2r | gradient≥4r³, crossing length≥r; drop from2r to r is15r⁴≥4r⁴ | Positive crossing cost justifies trapping.  Carried from [r7]. |
| 112 | open-sublevel ambient deformation headline | S¹ height, a=−1/4,b=1/4,δ=1/4 | no critical values in [−1/2,1/2]; cutoff flow takes middle band below−1/4 | Strict target achievable with buffer.  Carried from [r7]. |
| 113 | categorical pullback | g≃id, categorical U | inclusion of g⁻¹U homotopic to g then to constant in M | Endpoint pullback uses reverse homotopy if needed.  Carried from [r7]. |
| 114 | several critical points at one value | torus cosθ+cosφ | values −2,0,2 with multiplicities1,2,1 | Cover may grow by2 at0, not1.  Carried from [r7]. |
| 115 | minimum c(M)/witness independence | ∅; point; S¹ with 2- and4-critical witnesses | minima0,1,2; both circle witnesses yield2 | All three minimum Checks now explicit at README:901–903.  Carried from [r7]. |
| 116 | extended minimum versus finite minimum | S¹ finite and infinite counts | inf{2,4,…,∞}=2 | Infinite locus contributes∞, not0.  Carried from [r7]. |
| 117 | sphere recognition headline | S² height; h−h³/3 | first Hessians nonzero and count2; second count2 but Hessians0 | Morse two-handle theorem excludes second, not its true topological conclusion.  Carried from [r7]. |
| 118 | zero-dimensional sphere exclusion | one point | count1≠2 and dim0 fails positive-dimension premise | No mistaken S⁰ conclusion.  Carried from [r7]. |
| 119 | torus critical polynomial | T^m sum of cosines | each factor counts1+t; product (1+t)^m, T² gives1+2t+t² | Binomial count matches indices.  Carried from [r7]. |
| 120 | CP^n function representative independence | z↦az,a≠0 | numerator and denominator scale by \|a\|²>0; quotient unchanged | z=0 excluded; no 0/0.  Carried from [r7]. |
| 121 | CP^n critical indices/real dimension | CP¹, then coordinate point e_j | values0,1 and indices0,2; generally j negative complex directions give2j, real dim2n | Supplier realification factor2 consistent.  Carried from [r7]. |
| 122 | critical-count parity/Euler | S²; T² | totals2≡Euler2 mod2; 4≡Euler0 mod2 | Sphere counts even.  Carried from [r7]. |
| 123 | odd-dimensional Euler via −f | S¹ height | c=(1,1), reversed counts=(1,1); χ=1−1=0 | Complementary index uses Morse premise.  Carried from [r7]. |
| 124 | RP² perfection obstruction | three coordinate weights | counts(1,1,1); rational b=(1,0,0), mod2 b=(1,1,1) | Rational perfection impossible, mod2 possible.  Carried from [r7]. |
| 125 | nontrivial π₁ with b₁(ℚ)=0 | RP² | π₁=ℤ/2, at least one1-cell; b₁(ℚ)=0 | A perfect rational Morse complex would have no1-cells, contradiction.  Carried from [r7]. |
| 126 | Morse–Bott definition | y² versus y⁴ on ℝ² | kernels span(e₁) versus ℝ²; tangent critical line span(e₁) | First qualifies, second fails.  Carried from [r7]. |
| 127 | zero normal bundle | constant on compact M | C=M, normal rank0, negative rank0; contribution B(M) | Morse–Bott does not imply isolated critical points.  Carried from [r7]. |
| 128 | spectral splitting/rank constancy | matrices diag(−1,2), diag(−t,2) | ranks(1,1); at t=0 kernel appears and negative rank may change | Constancy only within nondegenerate family.  Carried from [r7]. |
| 129 | metric independence of negative-bundle class | Q=diag(−1,1), metric diag(4,1) | associated operators diag(−1,1),diag(−1/4,1); negative dimension1 both | Inertia unchanged; actual subspaces may change for nondiagonal metrics.  Carried from [r7]. |
| 130 | smooth square roots/inverses | positive scalar a=4, then a→0 | √a=2, a⁻¹ᐟ²=1/2, product1; inverse undefined at0 | Positive/invertible hypothesis needed.  Carried from [r7]. |
| 131 | parametric normal form | f(b,y)=(1+b²)y² | coordinate v=√(1+b²)y gives f=v²; y=0 fixed | Varying reference forms need the owned extension.  Carried from [r7]. |
| 132 | negative disc Thom shift | point base,rankλ | H_j(D^λ,S^(λ−1))=ℤ at j=λ and0 otherwise | Shift H_(j−λ)(point); recovers ordinary Morse.  Carried from [r7]. |
| 133 | orientation local system | negative Möbius line over S¹ | sign coinvariants ℤ/(a=−a)=ℤ/2; constant-system H₀=ℤ | README's wrong-coefficient control is correct.  Carried from [r7]. |
| 134 | Bott filtered sequence and inequalities | ordinary RP² viewed as Bott | E¹ chains(ℤ,ℤ,ℤ), d₁ on2-cell is2; rational B=1,Q=t | Critical-component page is E¹ in supplier convention; see source issue.  Carried from [r7]. |
| 135 | Bott constant specialization | f=0 on compact connected M | one filtration contribution B(M); no nonzero differential, Q=0 | Correct degenerate normal-rank case.  Carried from [r7]. |
| 136 | compact-trapped gradient convergence | f=x²,γ=x₀e⁻²ᵗ | limit0, gradient at0=0, K=[−\|x₀\|,\|x₀\|] | Native manifold headline now in Suggested:200.  Carried from [r7]. |
| 137 | omega-limit argument | same trajectory | omega={0}, connected and critical; #omega=1 | Finite critical set plus connectedness excludes two limits.  Carried from [r7]. |
| 138 | compact trapping versus mere completeness | f=x on complete ℝ | γ=x₀−t, no compact trap and no critical point | Completeness alone does not give convergence.  Carried from [r7]. |
| 139 | variable metric | f=x²,g=4dx² | grad=x/2, γ=x₀e⁻ᵗ⁄², norm_g grad=\|x\| | Native metric dependence now retained in Suggested:200.  Carried from [r7]. |
| 140 | dissipation and tail | Euclidean x² | E=x₀²e⁻⁴ᵗ, E'=−4E=−‖grad‖²; tail=\|x₀\|e⁻²ᵗ=√E | Constants and half-rate consistent.  Carried from [r7]. |
| 141 | local gradient inequality/distance | f=x² at0 | \|f\|=x²=(1/4)‖grad‖²; ‖grad‖=2dist(x,0) | Positive λ=4 works in native λ\|E\|≤‖grad‖² convention.  Carried from [r7]. |
| 142 | saddle convergence | f=−u²+v², u=0 | E=v²≥0, v=v₀e⁻²ᵗ; elsewhere E may be negative | No local-minimum hypothesis used.  Carried from [r7]. |
| 143 | equilibrium/division by energy | γ=0 for x² | E=0, length0, distance0 | Treat separately; do not divide by√E.  Carried from [r7]. |
| 144 | non-Morse rate | f=x⁴,γ=(x₀⁻²+8t)^−1/2 | decay t^−1/2, Hess0=0 | Exponential conclusion needs nondegeneracy.  Carried from [r7]. |
| 145 | PS Satisfies positive example | x² on ℝ | ‖grad x_n‖=2\|x_n\|→0⇒x_n→0 | Definition identifies desired compactness.  Carried from [r7]. |
| 146 | PS nonproper example | f(x,y)=x | gradient norm1 cannot tend0; band [0,1]×ℝ noncompact | PS holds vacuously, properness fails; Part II boundary R01.  Carried from [r7]. |
| 147 | PS negative example | e^−x,x_n=n | values=e^−n→0, gradient norms=e^−n→0; no convergent subsequence | Fails PS.  Carried from [r7]. |
| 148 | PS band/global equivalence | bounded \|f(x_n)\|≤C | sequence lies in [−C,C]; conversely each fixed[a,b] gives bound max(\|a\|,\|b\|) | Quantifiers correct.  Carried from [r7]. |
| 149 | metric comparison in PS | g→4g | grad_4g=(1/4)grad_g, norm_4g=(1/2)norm_g | Uniform equivalence preserves limit0.  Carried from [r7]. |
| 150 | nonuniform metric negative control | f=e^−x, g=dx² then g'=e^−2x dx² | x_n=n has bounded values e^−n; gradient norms e^−n versus1 | Euclidean PS fails; g'-PS holds vacuously. Completeness is not needed to define PS.  Carried from [r7]. |
| 151 | of_isProperMap | x² | bounded values≤C⇒\|x\|≤√C; compact interval gives convergent subsequence | Properness sufficient independently of gradient regularity.  Carried from [r7]. |
| 152 | compact critical value band | x²,[0,1]; constant on ℝ | critical set{0} compact; constant gives entireℝ and fails PS | Continuity and PS used.  Carried from [r7]. |
| 153 | finite_criticalValueBand | x²,[0,1]; x⁴ | first critical count1; second also1 but nondegeneracy premise false | The theorem gives sufficient hypotheses, not an iff.  Carried from [r7]. |
| 154 | exists_gradient_lowerBound | x²,[1,4]; projection | gradients between2 and4, chooseη=2; projection chooseη=1 | η independent of point.  Carried from [r7]. |
| 155 | reversed/empty band | a>b | band∅, critical count0, η=1 satisfies universal bound | Honest vacuity, not a missing a≤b hypothesis.  Carried from [r7]. |
| 156 | PS endpoint buffers | x², regular value1 | critical values{0}; chooseδ=1/2, enlarged band avoids0 | Accumulating critical values at a regular endpoint would violate PS.  Carried from [r7]. |
| 157 | noncompact normalized deformation | f=x on ℝ², a=0,b=1 | X=(−1,0), speed1; time x takes(x,y) to(0,y) for0≤x≤1 | Noncompact band allowed under completeness+PS.  Carried from [r7]. |
| 158 | finite-time length/lifetime | gradient dissipation on[s,t] | length²≤(t−s)(f(γ(s))−f(γ(t)))≤(t−s)(f(γ(0))−L) | Tails Cauchy as s,t→finite T; completeness supplies endpoint.  Carried from [r7]. |
| 159 | forward existence without PS | f=e^−x | γ=log(e^x₀+t), γ'=1/(e^x₀+t)=e^−γ, lifetime∞ | Global existence true, convergence false.  Carried from [r7]. |
| 160 | normalized exponential escape | same f | X=eˣ, e^−γ=e^−x₀−t; blowup time e^−x₀ | Constant energy-drop rate does not ensure lifetime.  Carried from [r7]. |
| 161 | exists_forwardTrajectory_converges | x² | γ=x₀e⁻²ᵗ, p=0, grad p=0 | All PS/Morse/lower-bound hypotheses hold.  Carried from [r7]. |
| 162 | PS critical subsequence to trapping | local λE≤‖grad‖² | remaining length≤2√E/√λ; for x², λ=4 gives√E=\|x\| | Entry distance plus this bound smaller than chart radius prevents exit.  Carried from [r7]. |
| 163 | PS minimum attainment | nonempty ℝ,x²; projection | min0 attained at0; projection unbounded below | Lower-bound hypothesis cannot be dropped.  Carried from [r7]. |
| 164 | zero-dimensional PS theorem | E=0,f constantc | unique sequence converges; γ constant; critical band size1 if a≤c≤b, otherwise0 | CompleteSpace/finite dimension and all conclusions consistent.  Carried from [r7]. |
| 165 | repaired compact-core restriction | δψ=δ near 0, core [a,b]⊂(0,1) | δ<a passes error<x on core; at x=δ/2 error δ>x fails on full open interval | Repaired distinction, no loss of general approximation.  Carried from [r7]. |
| 166 | proper/clopen strong restriction | ℝ⊔ℝ→first component, perturbations (δψ,0) | on restricted support derivatives ≤C_kδ; discarded component contributes 0 | Local finiteness survives the closed inclusion.  Carried from [r7]. |
| 167 | native CW statement, empty/zero dimension | ∅; r discrete points | all cell counts 0; respectively r cells in degree 0 and 0 above | Native cell equivalences match extended critical counts.  Carried from [r7]. |
| 168 | intrinsic exponential conclusion | f=x², metric 4dx² | distance to 0=2\|x₀\|e^(−t/2)≤(2\|x₀\|+1)e^(−t/2) | Choose C=2\|x₀\|+1,c=1/2,T=0; includes equilibrium x₀=0.  Carried from [r7]. |
| 169 | extended intrinsic distance | two disjoint copies of ℝ with f=x² | cross-component distance ∞; trajectory and its limit in one component have distance \|x₀\|e^(−2t) | No connectedness assumption needed in compact-trapped theorem.  Carried from [r7]. |
| 170 | full PS manifold headline | round S¹, f=cosθ, θ₀=π/2 | θ(t)=2 arctan(eᵗ), f decreases 0→−1, distance to π=2 arctan(e⁻ᵗ)≤2e⁻ᵗ | R02: genuine manifold case absent from vector-space specialization.  Carried from [r7]. |
| 171 | variable-metric PS gradient | ℝ,g=(1+x²)dx²,f=x²,x=1 | negative gradient −2x/(1+x²)=−1; norm √2; flat values −2 and 2 | Proper f gives PS; native metric statement includes this model.  Carried from [r7]. |
| 172 | sequential versus source's set Condition C | f=0 on ℝ, sequence x_n=n | every nonempty S contains a critical point; values and gradient norms all 0, but no convergent subsequence | Source equivalence false; roadmap uses the correct sequential condition.  Carried from [r7]. |
| 173 | completeness in PS forward existence | (0,1),f=x, Euclidean metric | gradient norm 1 gives PS vacuously; f≥0; γ=x₀−t exits at t=x₀ | R02 repair must retain compatible metric completeness.  Carried from [r7]. |
| 174 | §2.3 Milnor comparison seam and boundary, README:512 | λ=1, h=−id, x=rθ | r=1/2: h(2x)=−θ is identified with α₀(−θ)=H(θ,1); r=1: H(θ,0)=α₁(θ) | New pp.20–21 locator supports the same formula; both gluings agree. |
| 175 | §2.3 relative comparison at λ=0 | Isolated minimum of x² | Source adds one point with empty boundary; E maps that point to itself; H₀ increases by 1 on both models | No division by radius is used in dimension 0; locator-only change. |
| 176 | §2.4 / Suggested:107 CW headline and Milnor 3.5 | ℝ,f=x²; empty M; discrete ℕ,f(n)=n | x²: sublevel [−√a,√a] for a≥0, one 0-cell; empty: 0 cells; ℕ at k+1/2: k+1 critical points and k+1 0-cells | Compact-sublevel hypothesis matches all three; proper noncompact scope preserved. |
| 177 | §2.4 Cohen–Iga–Norbury 5.7 | Height on S² | Critical counts (1,0,1)=CW cell counts (1,0,1); Euler 1+1=2 | Printed pp.40–41 and compact/closed scope agree. |
| 178 | References / §2.2 Milnor 3.1 | f=x², a=1,b=4 | Band [−2,−1]∪[1,2] is compact; r(x)=max(−1,min(x,1)); r∘inclusion=id on [−1,1] | Printed p.12; fixed lower-sublevel retraction retained. |
| 179 | References / §2.2 Cohen–Iga–Norbury 5.1 | Same band, f=x² | F(σ,t)=σ√t for σ=±1,t∈[1,4]; f(F(σ,t))=t; inverse (sign x,x²) | Printed pp.33–35; boundary values {1,4} and product formula agree. |
| 180 | References / §1.3 Cohen–Iga–Norbury 5.3 | f=2x²; f=−u²+v² | ψ=√2x gives 2x²=ψ², Hessians 4 and 2; saddle index 1, signed squares −u²+v² unchanged | Printed pp.36–37; no half-Hessian normalization drift. |
| 181 | References / §2.3 Cohen–Iga–Norbury 5.6 | Single minimum of x² across [−ε,ε] | Lower sublevel ∅; upper [−√ε,√ε] retracts to one 0-cell; relative H₀=ℤ, other H_j=0 | Printed pp.38–40; cell count and index agree. |
| 182 | References / §3.2 Milnor 6.7 | ℝ,f=x²; point; empty M | Lower bound 0; inverse [0,a]=[−√a,√a] for a≥0; point has one critical point; empty has 0 | Printed p.36; proper bounded-below Morse witness includes noncompact and zero-dimensional cases. |
| 183 | §4.2 Weber 1.1, README:898–899 | S¹ height; constant on S¹; r discrete points; empty | cat=2≤2; 2≤∞; r≤r; 0≤0. Finite circle case uses two punctured-circle opens, each contracting in S¹ | pp.2–3 support the arbitrary-function bound; infinite critical sets and empty convention retained. |


## Not verifiable

- `hirsch-differential-topology`: Chapter 2 §1 and Chapter 6 Theorem 1.2 remain uncertified. [r7]'s sources-service lookup reached only the paywalled publisher DOI 10.1007/978-1-4684-9449-5, and legal-source searches found no readable text. That settled status was not reopened; no exact printed pages are invented.
- `mark-math240`: [r7]'s sources-service and author/course/homework searches found no matching legal text. README:1216 now makes this attribution bibliographic only. No mathematical target is certified from it and no repeated missing-text request was made.
- The general coherent-family comparison, continuous C² persistence and varying-form normal-bundle extensions retain [r7]'s limits: the ordinary cited theorems are not full proofs of those extensions. This incremental review does not claim otherwise.

## Source issues

The previous report's errata are carried forward below; the changed citation checks reconfirmed the Cohen–Iga–Norbury pp.34,38–40 slips. One additional notation slip was found in Weber's reopened proof.

- **Gap** in cohen-iga-norbury at Corollary 4.4, printed p.23: the source says genericity of vector fields gives density of Morse functions; it should justify perturbations within gradients, for example using local linear function perturbations; affects the proof.
- **Gap** in cohen-iga-norbury at Theorem 4.6 proof, printed p.28: the source says bounded energy and negative derivative imply derivative tends to zero; it should also use uniform continuity supplied by the smooth compact flow; affects the proof.
- **Misprint** in cohen-iga-norbury at Definition 4.7, printed p.29: the source says the height-parametrized trajectory takes values in ℝ; it should take values in M; affects nothing.
- **Error** in cohen-iga-norbury at Exercise 5.3, printed p.38: the source says every critical level of a compact Morse function is not a manifold; it should exclude this assertion, since a sphere-height minimum level is a point; affects a stated result.
- **Misprint** in cohen-iga-norbury at Theorem 5.6, printed p.38: the source says the attached closed disk lies in the interior while its boundary lies on the lower face; it should place the disk interior inside M and its boundary on the face; affects a stated result.
- **Misprint** in cohen-iga-norbury at Theorem 5.6 proof, printed p.38: the source says the radius-δ coordinate ball satisfies sum of squares at most δ; it should use δ² and sum over the coordinate dimension; affects the proof.
- **Misprint** in cohen-iga-norbury at Theorem 5.6 proof, printed p.39: the source says the first retraction targets the positive-ε level together with the descending disk; it should target the negative-ε level together with that disk; affects the proof.
- **Misprint** in cohen-iga-norbury at Theorem 5.6 proof, printed p.39: the source says the local deformation is on the interval [ε,ε]; it should use [−ε,ε]; affects the proof.
- **Misprint** in cohen-iga-norbury at Theorem 5.6 proof, printed p.40: the source says the final exterior motion follows positive gradient to the lower level; it should follow negative gradient; affects the proof.
- **Misprint** in cohen-iga-norbury at Corollary 5.11 proof, printed p.42: the source says the alternating summands are c_i and b_i; it should use c_k and b_k under summation over k; affects the proof.
- **Misprint** in cohen-iga-norbury at Corollary 5.11 discussion, printed p.42: the source says to subtract neighboring strong inequalities to obtain weak inequalities; it should add them, cancelling their opposite alternating terms; affects the proof.
- **Misprint** in cohen-iga-norbury at Application 5.13 proof, printed p.43: the source says the lower disk is the inverse image of [t₁,a]; it should use [t₀,a], where t₀ is the minimum; affects the proof.
- **Error** in cohen-iga-norbury at Theorem 15.1, printed p.143: the source says the quadratic normal-form domain contains whole normal Euclidean fibers; it should be a neighborhood of the zero section, since a bounded height cannot have unbounded quadratic values; affects a stated result.
- **Misprint** in cohen-iga-norbury at Theorems 15.6–15.7, printed pp.147–148: the source says relative filtration homology is E² and the Morse specialization collapses there; it should identify classical E¹, take its differential, then collapse at E² in the skeletal case; affects a stated result.
- **Misprint** in morgan-condition-c at regular-point coordinate argument, printed p.6: the source says the last coordinate of ψ(v) is the fixed value f(x); it should be f(v), giving the stated invertible derivative; affects the proof.
- **Misprint** in morgan-condition-c at Definition 1.6, printed p.6: the source says a critical value lies in the closure of a subset of M; it should say a critical point; affects a stated result.
- **Misprint** in morgan-condition-c at Proposition 1.8, printed p.6: the source says f composed with the band-to-product diffeomorphism is projection; it should say f equals second projection composed with that diffeomorphism; affects a stated result.
- **Misprint** in morgan-condition-c at Proposition 1.8 proof, printed p.7: the source says the enlarged upper endpoint b′ is less than b; it should be greater than b; affects the proof.
- **Misprint** in morgan-condition-c at Proposition 1.9, printed p.8: the source says the finite upper endpoint b is less than negative infinity; it should be less than positive infinity; affects a stated result.

- **Misprint** in cohen-iga-norbury at Theorem 5.1 proof, printed p.34: the source says the backward displacement equals the forward integral of velocity; it should negate the two displayed integrals before the absolute-value estimate; affects the proof.
- **Error** in morgan-condition-c at Remark 1.7, printed p.6: the source says its set condition is equivalent to sequential Palais–Smale compactness; it should use the sequential condition, since f=0 on ℝ satisfies the set condition but the sequence n escapes; affects a stated result.

- **Misprint** in weber-conley at Theorem 1.1 proof, footnote 3, printed p.3: the source says the stable half-line for f(u)=u³ is labelled Wᵘ(0); it should be labelled Wˢ(0), since descending trajectories from u>0 converge to zero; affects nothing.

[r7]: packages/MorseTheory/reports/PRREVIEW-MorseTheory~7.md
