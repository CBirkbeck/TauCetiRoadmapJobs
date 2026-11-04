# Port: FuchsianOrbifoldsPartII

Branch: `roadmap/fuchsian-orbifolds-part-ii`.
Head: `a68a6564fae53aa7bdeff078d86b74a613045885`.
Base: `f52d972`; the initial status was empty. Only `TauCetiRoadmap/FuchsianOrbifoldsPartII/{README.md,Suggested.lean,metadata.toml}` is committed. The top-level roadmap list, pins, tooling and merge order are unchanged. No push or GitHub write was made.

## Draft pull request body

Build finite-area Nielsen cores for finitely generated nonelementary Fuchsian groups, with genuine geodesic boundaries, bordered signatures and Gauss–Bonnet. Extend the Ford-polygon theory to every admissible digit cycle, recover real quadratic narrow classes from their bordered conformal orbifolds, and prove complementary covering identities for projected area with multiplicity. Cusp truncations supply an improper Stokes theorem and the regular completed Eisenstein value at the critical-line endpoint.

AI assistance: Codex (GPT-6) performed the port, source and supplier audit, signature checks and mathematical self-review.

## Validation

- `lake build TauCetiRoadmap.FuchsianOrbifoldsPartII.Suggested`: exit 0.
- Exact outcome: `Build completed successfully (8958 jobs).`
- Warning count: **5**, all `declaration uses sorry`, at Suggested.lean lines 60, 69, 85, 92 and 101. No other warnings or errors. The final invocation replayed the successfully built target.
- Gate: exit 0; exact summary:

```text
gate FuchsianOrbifoldsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```.
- `git diff --check`: exit 0.
- Final name resolver: no cross-roadmap citation or Lean name found nowhere. Its external-name check is unavailable on that host; the declarations were independently read in the local pinned packages, below.
- Dependency check, complete output:

```text
depcheck: 162 roadmaps, 1150 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The ordinary gate's dependency check also reports zero problems. The gate requires an entirely clean worktree: before commit its only failure was the three staged additions; it was rerun after commit.

All eight declarations were put in one scratch `#check @name` file and elaborated once, exit 0, with no warnings. Their elaborated types were compared individually to the README. No section variables occur and no hypothesis disappeared. The pretty printer elides the inferred isomorphism type in the presentation output; the source signature explicitly fixes the coproduct, its target and both generator markings.

| Declaration | Elaborated type compared with README | Change |
| --- | --- | --- |
| `AdmissibleCycle` | `List ℕ → Prop`; nonempty, all digits ≥2, some >2 | None |
| `cycleGroup` | Every `List ℕ` gives a subgroup of native integral PSL₂ | None |
| `cyclePolygon` | Every `List ℕ` gives a subset of `UpperHalfPlane`, with ℓ+1 discs and both strip boundaries | None |
| `cyclePolygon_fundamentalDomain` | Every admissible list; native a.e. fundamental domain for that subgroup and invariant volume | None |
| `cycleGroup_presentation` | Every admissible list; isomorphism from ℤ * indexed C₂ factors; positive translation and each factor are marked | None |
| `cycleGroup_cuspStabilizer` | Every admissible list; intersection with ambient powers of T equals powers of T to the full digit sum | None |
| `cycleGroup_infiniteIndex` | Every admissible list; native natural-valued index is zero | None |
| `cycleGroup_conj_iff_isRotated` | Two arbitrary admissible lists; real PSL conjugacy of embedded subgroups iff cyclic rotation | None |

## Port changes and final upstream reading

The final README was read in full after editing. It retains all 28 target subsections, every definition API and its discriminating Checks, all six layers' Examples and Dependencies, both arithmetic examples, the opening Summary and every mathematical supplier requirement.

1. Replaced the package's old stated pins by the actual manifest revisions: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`, Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. Both dependency checkouts have those exact HEADs. No declaration needed renaming.
2. Added Lean's `module`, public imports and `@[expose] public section`, following the supplied AlgebraicTopologyPartII model. This removes the module-system warning at these pins and keeps the target declarations exported. The imports remain exactly the Mathlib umbrella and the single actually used Tau Ceti PSL action module; no submodule import was added.
3. Reworded the four detailed supplier refinements as timeless mathematical contracts, retaining their full content and every Needs reference. They remain required contracts, rather than an assertion that the supplier text explicitly states all four refinements. The acceptance conditions are preserved below.
4. Re-extracted all three legal PDFs and repaired their numerical line locators to that extraction. Printed sections, pages, theorem and equation numbers are retained. The References paragraph specifies the extraction convention; the finite-area locator now separately identifies SERIES05's finite-sidedness theorem and its two-dimensional funnel paragraph.
5. In §5.3, replaced “regular holomorphic value” with an explicit statement that holomorphy is in the parameter s near 1/2. E₀ is a nonholomorphic eigenfunction of z, with eigenvalue 1/4; the old wording could suggest the wrong variable. No theorem or hypothesis was narrowed.

The accepted review has no outstanding non-blocking findings. The seven dispositions recorded in the last repair report are retained: supplied modular measure, locally derived endpoint C¹ bounds, separate raw/arithmetic dependencies, accurate cusp-form attribution, precise LU23 limit-set locator, SERIES05 confined to Layer 0, and wrapped Lean docstring. No theorem, definition or example moved from the accepted Lean file to the README: its three real-bodied definitions and five headlines already meet the acceptance-test rule. No new headline can be stated without the missing carriers identified in its module docstring. No sorry'd data, stand-in predicate or API padding was introduced. Metadata remains `topic = "math.CV"`, matching the base roadmap.

## Suppliers, ownership and duplication

Still-open new-roadmap dependencies, by name: **AutomorphicSpectralTheory, AnalyticNumberTheoryPartI, MultiquadraticPartII, CongruenceSpectralGap**. Open revisions of FuchsianOrbifolds, IntegralLattices and ConformalMapping are not dependencies; their main-branch content was used. Main-branch models read for shape were FuchsianOrbifolds, ConformalMapping and Completed/UniversalCovers; metadata was also compared with main folders.

The ownership search used `roadmaps list`, `roadmaps grep` and `roadmaps show`, supplemented by object searches through all board packages and pinned Mathlib/Tau Ceti. The search objects were limit sets and ideal hulls, Nielsen/convex cores, geodesic boundaries and doubles, raw minus cycles and conjugacy, core Stokes, complementary surfaces, completed Fourier expansions and modular quotient measures. The supplied sibling heads were included in the indexed sweep. Searches were repeated after editing. No new duplicate local target was found. Generic smooth doubling and the arithmetic specializations are already assigned in Scope and ownership, which remains the sole removal/deferral ledger in the roadmap. No additional duplication deletion or supplier replacement was required beyond refreshing the pins and retaining the accepted supplier substitutions.

The general carrier belongs here because FuchsianOrbifolds stops at cofinite quotients and cusp compactification. ComplexCurveModuli D0.4 and D6.2 treat smooth bordered metrics and doubles; §3.1 here adds cusped orbifolds with cone orders. AutomorphicSpectralTheory §4.17a constructs the arithmetic period-indexed surfaces; it does not state the arbitrary admissible-list classification or the general finitely generated core theorem. AnalyticNumberTheoryPartI §2.1 assumes absolute integrability; §5.2 here proves the flux-only height limit, including λ=0. The endpoint estimates here specialize supplied Bessel/Fourier theory rather than reconstructing it. No fully qualified declaration name belongs to another roadmap.

The index refreshed during the task: the initial resolver used content main `f52d972` and 384 open heads; the final resolver used indexed main `3ec8d5f` and 387 open heads. Main supplier sections were independently read in this worktree at the required `f52d972`, and the relevant open suppliers were read with `roadmaps show` or at the supplied sibling head. The refresh found no missing citation. Bounded public Mathlib/Zulip searches by the same objects located no applicable additional formalization; no API choice is based on those negative search results.

| Supplier text read | Contract verified |
| --- | --- |
| FuchsianOrbifolds Layers 0–3; Layer 4 item 5; Layer 5 item 1; Layer 6 | Effective action, cone charts, side/cycle theorem with no-overlap and local-finiteness premises, full cusp stabilizers, cofinite area/signature, topological genus, level-one quotient. The finite-covolume converse is not used for an infinite-area Ford domain. |
| CongruenceSpectralGap §0.1 | Effective-projective quotient pushforward measure, domain independence, positivity, finiteness and mass π/3. |
| AutomorphicSpectralTheory §§0.27–0.28, 1.14–1.15, 2.17–2.18, 4.17a, 4.18, 4.20 | K/Whittaker comparison, decay and derivative bounds, Eisenstein half-sum/completion, full Fourier expansion and continuation, arithmetic surfaces and compact/cusp decomposition, uncompleted critical-line estimates. The four precise §4.17a refinements remain acceptance contracts. |
| AnalyticNumberTheoryPartI §2.1 | `core_stokes`, `core_signature`, `core_boundary_period`; C² invariant eigenfunction, integrable core and vanishing top term; full oriented period. Eisenstein hypotheses are discharged there; cusp forms follow using supplied decay. |
| IntegralLattices B2–B3 on main | Oriented form/ideal dictionary with √D correction for a<0; Gauss composition and inverse class. |
| GlobalNumberFields Layer 11 on main | Orders, invertible proper ideal carrier, NarrowPic and maximal-order comparison. Properness alone is not invertibility for general orders. |
| MultiquadraticPartII §§2.3–2.4, 3.1–3.2 | Fundamental-discriminant two-square criterion, J-square criterion, form/ideal genus-character comparison with the sign clause. |
| ComplexCurveModuli D0.1, D0.4, D6.2 on main | Smooth normal forms/caps, bordered conformal double and metric uniqueness, even Fermi metric reflection. |
| ConformalMapping L2 and L4 on main | Disc automorphisms/Schwarz–Pick equality and analytic-arc reflection. Isolated-point removal comes directly from Mathlib. |
| AlgebraicTopology Stages 1 and 7 on main | Finite-cover presentation consequences, finite-CW invariance and excisive/cofibration additivity, with Hausdorff hypotheses where needed. |
| DifferentialGeometry §§5.3, 5.5, 5.6.3 on main | Compact-support C¹ Stokes, corners, planar integral and outward-first orientation comparison. Local cutoffs meet the support premise. |
| Completed/UniversalCovers Stage 2 on main | Ordinary covering criterion, based lifts and unbased conjugacy distinction. |

## Pinned-library audit

These locations were opened at the manifest pins, not inferred from name resolution. A path in this table is a repository-relative source identifier; “line” is its physical line. None of the native declarations below supplies a bordered Nielsen core or a class-indexed core integral.

| Source and line | Declaration and exact relevant content |
| --- | --- |
| Mathlib/Analysis/Complex/UpperHalfPlane/Measure.lean line 44 | `UpperHalfPlane.volume_def`: comap of planar volume with density `(1 / NNReal.mk z.im z.im_pos.le)^2`; height positivity comes from the subtype, no quotient finiteness. |
| Mathlib/Analysis/Complex/UpperHalfPlane/Metric.lean line 43 | `UpperHalfPlane.dist_eq`: `2 * arsinh (dist (z : ℂ) w / (2 * √(z.im * w.im)))`; line 67 gives `cosh_dist`. |
| Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean line 825 | `ModularGroup.S` is `!![0, -1; 1, 0]`; line 829 defines T as `!![1, 1; 0, 1]`. These are SL matrices. |
| Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction.lean line 471 | `ModularGroup.im_smul_eq_div_normSq`: `(g • z).im = z.im / Complex.normSq (denom g z)` for determinant-one integral g. |
| Mathlib/NumberTheory/Modular.lean line 370 | `ModularGroup.fdo` is `{z | 1 < normSq (z : ℂ) ∧ |z.re| < 1 / 2}`: both boundaries strict. |
| Mathlib/Algebra/Group/Subgroup/Lattice.lean line 329 | `Subgroup.closure (k : Set G) := sInf {K | k ⊆ K}`; line 355 supplies `closure_le`. This is generated subgroup, not topological closure. |
| Mathlib/GroupTheory/Coprod/Basic.lean line 144; Mathlib/GroupTheory/CoprodI.lean line 98 | Native binary and indexed monoid coproducts, with group instances for group factors; no private free-product carrier. |
| Mathlib/GroupTheory/CoprodI.lean line 903 | `Monoid.CoprodI.lift_injective_of_ping_pong`; nonempty disjoint domains, nonidentity factor inclusions and cardinal disjunction. The infinite translation factor has ≥3 elements. |
| Mathlib/GroupTheory/Index.lean line 561 | `Subgroup.index_eq_zero_iff_infinite`; zero natural index means infinitely many cosets. |
| Mathlib/Topology/Algebra/ConstMulAction.lean line 599 | `ProperlyDiscontinuousSMul.finite_stabilizer`; finiteness of the stabilizer set under the action hypothesis. |
| Mathlib/MeasureTheory/Measure/Map.lean line 166 | `map_apply_of_aemeasurable`; line 170 `Measure.map_apply` uses measurable map and measurable target set. |
| Mathlib/MeasureTheory/Integral/Bochner/Basic.lean line 1076 | `MeasureTheory.integral_map`, AEMeasurable map and AEStronglyMeasurable integrand for the pushforward. |
| Mathlib/MeasureTheory/Group/FundamentalDomain.lean line 630 | `IsFundamentalDomain.quotientMeasure_eq`, countable group, measurable constant actions and invariant measure; equality of pushforwards for actual a.e. fundamental domains. |
| Mathlib/NumberTheory/LSeries/RiemannZeta.lean line 84 | `completedRiemannZeta_eq`: Λ=Λ₀−1/s−1/(1−s); line 89 `differentiable_completedZeta₀`; line 110 residue 1 at s=1. No evaluation of a meromorphic pole is used. |
| Mathlib/Analysis/Complex/RemovableSingularity.lean line 100 | `Complex.differentiableOn_update_limUnder_of_bddAbove`; neighborhood, punctured differentiability and bounded norm; extends by punctured limit. |
| Mathlib/Topology/Homotopy/Lifting.lean line 499 | `IsCoveringMap.existsUnique_continuousMap_lifts_of_range_le`; path/local-path connected source, matching basepoints and actual π₁-range inclusion. |
| TauCeti/Analysis/Complex/UpperHalfPlane/PSL/Action.lean line 140 | `UpperHalfPlane.pslMk_smul`; line 184 `psl2zToPSL2R_smul`; measurable and invariant-measure instances at lines 149 and 157. This is the sole Tau Ceti import needed by Suggested.lean. |
| TauCeti/LinearAlgebra/Matrix/ProjectiveSpecialLinearGroup.lean line 128 | `psl2zToPSL2R`; line 138 injectivity via the central kernel. |
| TauCeti/Topology/Compactification/OnePoint/ProjectiveLine.lean line 189 | `OnePoint.instMulActionPSL`; line 194 `OnePoint.pslMk_smul`. It gives the boundary action; the Cayley/hull compatibility remains local work. |
| TauCeti/Analysis/Complex/UpperHalfPlane/ProperAction.lean line 58; TauCeti/Analysis/Complex/Fuchsian/ProperAction.lean line 33 | Proper evaluation and discrete-subgroup proper discontinuity. |
| TauCeti/Analysis/Complex/Fuchsian/Stabilizer.lean line 45 | `Subgroup.instIsCyclicStabilizer`, discrete subgroup and an actual upper-half-plane point. |
| TauCeti/Analysis/Complex/UpperHalfPlane/Geodesic.lean line 87 | `geodesicLine g t = g • UpperHalfPlane.mk ⟨0, Real.exp t⟩ ...`; line 106 distance is `|s-t|`. |
| TauCeti/Analysis/Complex/UpperHalfPlane/Polygon/Basic.lean line 177; TauCeti/Analysis/Complex/UpperHalfPlane/Polygon/Convex/GaussBonnet.lean line 215 | Native compact polygon convexity; ideal-vertex `ConvexPolygon.volume_carrier`. Ideal angles are zero. |
| TauCeti/NumberTheory/Modular.lean line 196 | `fd_ae_eq_fdo`; line 234 `isFundamentalDomain_fdo` uses effective PSL₂(ℤ), not raw SL₂. |
| TauCeti/Analysis/Complex/UpperHalfPlane/Measure.lean line 77 | `volume_preimage_coe_null`; singleton-null instance at line 84; cusp strip mass `(b-a)/A` for A>0 at line 91. |
| TauCeti/Analysis/Complex/Fuchsian/Covolume.lean line 101 | `exists_isFundamentalDomain` for a discrete subgroup; line 114 `IsCofinite` has only discreteness and `covolume_ne_top`, no finite generation. Line 149 gives nested finite-index/cofiniteness equivalence. |
| TauCeti/MeasureTheory/Group/FundamentalDomain.lean line 322 | `covolume_eq_card_mul_covolume`; countable acting subgroup, invariant measure, fundamental domain and nested subgroup, with ENat coset cardinality. |
| TauCeti/Analysis/Complex/Fuchsian/LevelOne/Basic.lean line 73 | `TauCeti.ModularGroup.isCofinite_psl2zToPSL2RRange`. |
| TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.lean line 83 | Native quotient of invertible fractional ideals by the totally positive principal subgroup; line 224 `mkPrincipal_sq`. |
| TauCeti/NumberTheory/NumberField/NarrowClassGroup/Finite.lean line 38 | `NumberField.NarrowClassGroup.instFinite` for a number field. |
| TauCeti/AlgebraicTopology/UniversalCover/Deck/Conjugation.lean line 129 | `TauCeti.Deck.conjMulEquiv`, actual homeomorphism h with `∀ e, q (h e) = p e`; the based/rebased requirement is retained. |

## Legal-source and locator pass

All three linked PDFs were read as mathematical data. Downloaded bytes match the three SHA-256 digests in `packages/FuchsianOrbifoldsPartII/sources.toml` exactly. No source passage was copied into the roadmap. Line references below use the final README's extraction convention. Printed page/theorem locators also remain in each target. The nearest-boundary rigidity argument in DIT16 is not adopted as a mandatory route; the actual covering/height argument is specified in §§3.2–3.4. LU23's torsion-free surgery is not used without cone-chart justification, and its nowhere-dense statement is used only in its second-kind context.

| Target | Source passage read | Nature of support |
| --- | --- | --- |
| 0.1 | DIT16 line 142; LU23 line 242 and line 251 | Orbit limits; elementary cutoff; second-kind qualification. |
| 0.2 | DIT16 line 142; SERIES05 line 1091 | Ideal hull and closed quotient; half-disc chart construction is local. |
| 0.3 | LU23 line 264; SERIES05 line 709 and line 1107 | Finite area, finite-sidedness, supporting axes/funnels; finite-type/cone argument explicit. |
| 0.4 | DIT16 line 153 | Signature conventions; capping API via named topology suppliers. |
| 0.5 | DIT16 line 168 | Equation (2.8), positive boundary and cusp contributions. |
| 0.6 | DIT16 line 156 | Funnel-peripheral representative; orbifold qualification retained. |
| 1.1 | DIT16 line 241 | Arithmetic generators; all-list extension owned here. |
| 1.2 | DIT16 line 321 | Ford-polygon proof and Figures 1,4,7; raw-list hypotheses explicit. |
| 1.3 | DIT16 line 321 | Arithmetic presentation; raw tiling, cusp and marking arguments local. |
| 1.4 | DIT16 line 246 | Translation under reduced-representative change; explicit sign computed. |
| 1.5 | DIT16 line 337 | Equations (3.4)–(3.6), primitive word and weak central inequality. |
| 1.6 | DIT16 line 311 | Second-kind arithmetic case; raw infinite-index proof via free intervals. |
| 2.1 | DIT16 line 350 | Finite arc partition; endpoint and intermediate crossing justifications added explicitly. |
| 2.2 | DIT16 line 370 | Hull intersection description; over-M comparison, properness and exact cutoff local. |
| 2.3 | DIT16 line 380 | Lift-spacing display V; signed all-real extension checked independently. |
| 3.1 | DIT16 line 156 | Boundary background only; orbifold double is a local construction from named smooth suppliers. |
| 3.2 | DIT16 line 373 | Conformal-class conclusion; actual lift proved through double and cone meridians. |
| 3.3 | DIT16 line 380 | Rigidity background; integer-height proof uses pinned Möbius formula, not an attributed source theorem. |
| 3.4 | DIT16 line 320 | Arithmetic class-recovery theorem; raw repeated-list classification is the local extension. |
| 4.1 | DIT16 line 189 | Half-open representative set; quotient measure imported. |
| 4.2 | DIT16 line 406 | Orbit intersections in (4.3); Borel pushforward formulation and sheet density proved locally. |
| 4.3 | DIT16 line 398 | Genus quotient and averaging; finite-family normalization is elementary measure theory. |
| 4.4 | DIT16 line 426 | Complementarity; complete oriented reversal also read at DIT16 line 230. |
| 4.5 | DIT16 line 426 | Whole group/principal-genus covering; arbitrary stable families by finite summation. |
| 4.6 | DIT16 line 252 | D=28 examples/Figures 1–6; D=12 is explicitly a direct arithmetic Check. |
| 5.1 | DIT16 line 1011 | Truncated polygon and boundary terms; cut above both retained arcs. |
| 5.2 | DIT16 line 998 | Lemma 2; C², arbitrary complex λ and λ=0 improper-limit branch are justified extensions. |
| 5.3 | DIT16 line 499 and line 998 | Completion/Fourier expansion and Stokes; differentiated endpoint majorant from supplied Bessel estimates. |

## Adversarial mathematics pass

Each row records an independently recomputed instance of the named statement, not a proof by numerical testing. Exact matrix and rational computations, finite cyclic-gap comparisons and elementary quadratures were performed in scratch. Bessel values use the positive-argument integral with Simpson quadrature; they test coefficients and derivative signs, while the summable majorant in the README supplies the analytic argument. Repeated appearances of the same formula across a layer, its Checks, examples and suppliers were compared using the same witness. Irrelevant ring-characteristic/DVR/fan tests are inapplicable: the geometric carriers are integral and real PSL₂, real quadratic number fields and complex functions. Empty/all-2 cycles, identity actions, nonprimitive periods, λ=0, zero measures, zero denominators and noncompact cusps are explicitly tested instead.

| Statement | Instances tried | Values computed on the compared sides | Result | Change |
| --- | --- | --- | --- | --- |
| Curvature/metric normalization | i,2i | native distance=2arsinh(1/(2√2))=log2; ds vertical integral=log2 | Pass | None |
| Effective S action/order | i,2i | S(i)=i; S(2i)=i/2; S²(2i)=2i; matrix square=−I | Pass | None |
| Left-action product direction | i under ST,TS | ST(i)=−1/2+i/2; TS(i)=1+i | Pass | None |
| Whole ideal circle | ⟨T⁴⟩ | orbit n·4+i tends to ∞; limit-set cardinality=1, not 0 | Pass | None |
| Cusp versus genuine boundary count | modular signature; one-cone core | (s,t)=(1,0),(1,1); area/π=1/3,1 | Pass | None |
| Laplacian sign and y² | F=y² | ΔF=−2y²; wrong inverse-square value=−2y⁻² | Pass | None |
| Stokes sign and coefficient | F=log y, rectangle [0,1]×[1,2] | boundary=1/2−1/4=1/4; half area integral=1/4 | Pass | None |
| Narrow sign convention | D=12, generators 2+√3 and 1+√3 | norms=1,−2; positive versus mixed real signs | Pass | None |
| J² and different convention | generator √12 | norm=−12; square=12 totally positive; J²=1 | Pass | None |
| Positive norm-one generator | D=8 | norm(1+√2)=−1; square=3+2√2, norm=1; −1 also norm1 | Pass | None |
| Small-type convention | Fin0, Fin1, Fin2 | cardinalities=0,1,2; only nonempty admissible geometric inputs survive | Pass | None |
| 0.1 Limit-set definition | trivial group, finite C₂, ⟨T⟩, diagonal hyperbolic | Λ=∅,∅,{∞},{0,∞}; cardinalities=0,0,1,2 | Pass | None |
| 0.1 Basepoint independence | ⟨T⟩ orbits of i and 2i | ideal limits={∞}={∞}; constant hyperbolic orbit separation=log2 | Pass | None |
| 0.1 Closedness | ∅,{∞},{0,∞},full circle | closures equal those same four sets | Pass | None |
| 0.1 Conjugacy equivariance | hyperbolic cyclic group conjugated by T | T{0,∞}={1,∞}=new fixed endpoints | Pass | None |
| 0.1 Hyperbolic fixed points | diag(2,1/2) | action z↦4z; forward/backward limits ∞,0 | Pass | None |
| 0.1 Perfection/second kind | modular group versus cyclic hyperbolic | full circle has zero isolated points but is not nowhere dense; two-point set has two isolated points | Pass | None |
| 0.2 Away-side hull definition | ideal interval complement of [−1,1]; i/2,2i | x²+y²=1/4≤1 versus 4>1 | Pass | None |
| 0.2 Hull invariance | modular Γ, any g∈Γ | gℍ=ℍ=CΓ; boundary=∅ | Pass | None |
| 0.2 Conjugation/core isometry | translation by 1 of the semicircle test | x²+y²≤1 becomes (x−1)²+y²≤1; i↦1+i, distances preserved | Pass | None |
| 0.2 Supporting boundary charts | S at i on unit semicircle | S(i/2)=2i exchanges the two sides; nontrivial order2 cannot stabilize the chosen half-plane | Pass | None |
| 0.2 Whole-plane iff first kind | modular Λ; proper interval hull | full circle gives C=ℍ and t=0; interval hull excludes 2i | Pass | None |
| 0.3 Finite core versus full area | Γ([4]); modular Γ | core areas π,π/3; full areas ∞,π/3; funnel counts1,0 | Pass | None |
| 0.3 Finite end decomposition | [3,6] at cutoff3 | one cusp width9, one funnel; above cutoff tail=9/3=3 | Pass | None |
| 0.3 Primitive interval stabilizer | T⁴S versus T | trace4, eigenvalue2+√3, length2.633915794; trace2 and no axis for T | Pass | None |
| 0.4 Signature/B definition | modular, one-cone, pants, punctured sphere | B/π=1/3,1,2,−2; last cannot be a nonelementary positive-area core | Pass | None |
| 0.4 Conjugate signature invariance | [3,6] and [6,3] | both (0;2,2;1;1), B=2π | Pass | None |
| 0.4 Boundaryless agreement | modular signature t=0 | B=2π(−2+1+1/2+2/3)=π/3 | Pass | None |
| 0.4 Permuting cone orders | [2,3] versus [3,2] | defect sum=7/6 on both sides | Pass | None |
| 0.4 Double signature/area | (0;2;1;1) | double=(0;2,2;2;0); B doubles π→2π | Pass | None |
| 0.5 Gauss–Bonnet | ℓ=1,2,5 in arithmetic signature | 2π(−2+1+1+ℓ/2)=π,2π,5π | Pass | None |
| 0.5 Polygon independence | same core with a cut subdivided into2 arcs | oriented boundary coefficients1+1 along two subarcs; no extra t; total area π remainsπ | Pass | None |
| 0.6 Primitive peripheral representative | T⁴S and its square | same endpoints2±√3; lengths2log(2+√3) and4log(2+√3); primitive traversal1 versus2 | Pass | None |
| 0.6 Cusp exclusion | T⁴ | one fixed endpoint∞; closed-geodesic length0, no positive-length axis quotient | Pass | None |
| 1.1 AdmissibleCycle | [],[0],[1],[2],[2,2],[4],[4,4] | F,F,F,F,F,T,T; sums0,0,1,2,4,4,8 | Pass | None |
| 1.1 cycleGroup total definition | [],[0],[4] | Γ={1},⟨S⟩,⟨S,T⁴⟩ respectively; empty case has no involution factor | Pass | None |
| 1.1 Nonempty and sum≥3 | [3],[2,3] | lengths1,2 and sums3,5; [] sum0 fails premise | Pass | None |
| 1.1 Rotation preserves admissibility both ways | [3,6]↔[6,3]; [2,2] | T↔T; F↔F; sum9,9,4 | Pass | None |
| 1.1 Repeated admissible periods | [4] versus [4,4] | word traces4 versus14; second word equals first squared; raw lengths1,2 | Pass | None |
| 1.1 Explicit half-turn formula | centre3, z=3+i | matrix[[3,−10],[1,−3]] sends3+i to3+i | Pass | None |
| 1.1 Exact order two | same matrix | square=−I, class=1; matrix is neither I nor−I | Pass | None |
| 1.1 Generator membership/universal property | target subgroup⟨S,T⁴⟩ | generator images S,T⁴ lie inside; target {1} fails because T⁴(i)=4+i≠i | Pass | None |
| 1.1 Alternative final/initial centre | [3,6], endpoint9 | S₂=T⁹ST⁻⁹; T⁻⁹S₂T⁹=S | Pass | None |
| 1.1 Integral/real action compatibility | embedded S at2i | integral and real projective actions both give i/2 | Pass | None |
| 1.2 cyclePolygon inequalities | [3,6], i,3+i,9+i | active norm squares=1,1,1; at each other centre ≥10 | Pass | None |
| 1.2 Closed/measurable/convex region | [4], x=0,y→1 from above | norm²→1 and endpoint i stays in P; strict-interior version would drop it | Pass | None |
| 1.2 Split half-side pairings | [3,6], i,9+i,3+i | T⁹(i)=9+i; S₁ fixes3+i; vertex order2 | Pass | None |
| 1.2 Free interval length | digit4 versus2 | (1,3) length2 versus (1,1) empty length0 | Pass | None |
| 1.2 High Ford strip | y=2 at any centre | norm²≥4>1; only 0≤x≤m remains | Pass | None |
| 1.3 Fundamental-domain headline | [3,6], z=3+i/2 | S₁z=3+2i; height increases1/2→2, excluding nonmaximal representative | Pass | None |
| 1.3 Fundamental-domain degenerate control | [] | P lies on x=0, area0; Γ trivial, whole ℍ area∞ | Pass | None |
| 1.3 Marked presentation | [4], positive/negative ℤ generators | images i↦4+i and i↦−4+i differ; only first meets marking | Pass | None |
| 1.3 Nonabelian factor independence | [4,4] | SS₁=[[-1,4],[4,−17]], S₁S=[[-17,−4],[−4,−1]] unequal even up to sign | Pass | None |
| 1.3 Full cusp-stabilizer headline | [4],[4,4],[3,6] | full positive widths4,8,9; T⁴ belongs to first but not second | Pass | None |
| 1.3 Cone orbit and end counts | [4],[3,6],[4,4] | cone counts1,2,2; each s=t=1,g=0; arithmetic area/π=1,2,2 | Pass | None |
| 1.4 Rotation conjugacy | [3,6]→[6,3] | centres{0,3}−3 mod9={0,6}; plus3 gives{3,6}, wrong | Pass | None |
| 1.4 Projection compatibility | z↦T⁻³z | π_mod(T⁻³z)=π_mod(z); displacement−3 is integral | Pass | None |
| 1.5 Telescoped boundary word | [3,6] | product=[[17,−3],[6,−1]], determinant1, trace16 | Pass | None |
| 1.5 Endpoint ordering | [3,6] | 0<0.177124<1<2<2.822876<3; 3<3.354249<4<8<8.645751<9 | Pass | None |
| 1.5 Digit-two central equality | [3,2], k=2 | N₁+1=4=N₂−1; transformed conjugate3.422649731∈(3,4), root4.577350269∈(4,5) | Pass | None |
| 1.5 Primitive hyperbolic control | [4],[4,4],[2] | traces4,14,2; primitive unit2+√3, its square7+4√3, parabolic eigenvalue1 | Pass | None |
| 1.6 Infinite-index headline | [4] versus excluded[2] | free interval length2 gives ∞ full area; [2] has areaπ and index3; admissibility T/F | Pass | None |
| 1.6 Nonelementarity/second kind | Γ([4]) | parabolic limit∞ and S∞=0 plus T⁴0=4 give≥3 limits; free interval(1,3) misses Λ | Pass | None |
| 2.1 Finite arc crossing | [4], z=1/2+i√3/2 | γz=7/2+i√3/2 lies on circle centre4: norm²1; final cut is endpoint | Pass | None |
| 2.1 Intermediate finite crossing | [3,6] | first crossing5/2+i√3/2; S₁γz=17/2+i√3/2; both circle norms²1 | Pass | None |
| 2.1 Closing word/tangent law | [4] and [3,6] | T⁻ᵐSℓ⋯S₁γ has SL representatives−I and I, hence same projective identity and tangent | Pass | None |
| 2.1 Invariant arc integrals | constant F=1 | α=0 before/after every cut; integral0=0 | Pass | None |
| 2.1 Primitive traversal | [4] versus double word | primitive boundary length2.633915794 versus repeated traversal5.267831588 | Pass | None |
| 2.2 Core comparison over M | identity on Q_A | orbit map sends[z]_Γ to[z]_mod on both descriptions | Pass | None |
| 2.2 Cone marks | D12 periods[4],[3,2] | equal length2.633915794; cone counts1≠2 | Pass | None |
| 2.2 Map not embedding | principal D28 | source mass2π; target massπ/3; ratio6>1 | Pass | None |
| 2.2 Core versus Ford cusp cutoff | z=3/2+6i/5 for[3,6] | disc norm squares3.69,3.69,57.69 all≥1; y²=1.44<7/4, so z∈P but z∉Q | Pass | None |
| 2.2 Properness/high cusp | [3,6] | retained arc max heights√7/2≈1.322876 and√7≈2.645751; cutoff3 exceeds both; high cusp has9 sheets | Pass | None |
| 2.2 Rotation transports comparison | [3,6],[6,3] | both masses2π,width9; π_mod(T⁻³z)=π_mod(z) | Pass | None |
| 2.3 V definition/log identity | x=−2,0,2,4 | arsinh and log values−1.762747174,0,1.762747174,2.887270950 | Pass | None |
| 2.3 Strict monotonicity | −2<0<2<4 | displayed V values strictly ordered | Pass | None |
| 2.3 Cosh/arcosh identities | x=−2,0,2,4 | cosh values3,1,3,9=1+x²/2; arcosh at−2 gives+1.762747174 rather than V(−2) | Pass | None |
| 2.3 Native lift distance | a=0, n=0,2,4 | distances0,1.762747174,2.887270950=V(n) | Pass | None |
| 2.3 Quotient-distance control | [4], i,4+i | lift distance2.887270950; quotient distance0 | Pass | None |
| 3.1 Glued double/connectedness | one-boundary core; boundaryless core | component counts1 versus2; latter excluded by t≥1 | Pass | None |
| 3.1 Copy embeddings/intersection | seam r=0 and r=±1 | copies meet at0; ±1 are distinct; folding preserves path length | Pass | None |
| 3.1 Reflection involution/isometry | Fermi coordinates r=±1 | r↦−r↦r; cosh²1=cosh²(−1)≈2.381097846 | Pass | None |
| 3.1 Double signature | (0;2;1;1), pants | (0;2,2;2;0) and (2; ;0;0) | Pass | None |
| 3.1 Area doubling | same two examples | π→2π and2π→4π | Pass | None |
| 3.1 Unique double of an equivalence | identity on one half | identity on conjugate half; seam values0↦0 in both charts | Pass | None |
| 3.2 Cone-preserving lifting | local u↦u²; identity map | one meridian lifts open, its square lifts closed; order3 instead requires cube | Pass | None |
| 3.2 Removable lifted cone | Cayley coordinate identity at puncture0 | norm<1 off0; punctured limit0 has norm0<1; inverse composition remains identity | Pass | None |
| 3.2 Over-base deck conjugation | h=id and a deck translation | hγh⁻¹=γ; pγ=p; rebased equation qh=p has equal values | Pass | None |
| 3.2 Cusp affine normalization | z↦2z+b versus z↦z+b | ∞ fixed in both; max elliptic heights2 and1; only second matches target1 | Pass | None |
| 3.3 Height formula/bound | S at3+i | denominator3²+1=10; height1/10; S(3+i)=−3/10+i/10 | Pass | None |
| 3.3 Equality classification | c=0,d=1; c=1,d=−N | denominators1,1; heights1,1; both are translation/translation-times-half-turn cases | Pass | None |
| 3.3 Denominator nonzero | c=0,d=0 | candidate denominator0 but determinant0≠1, excluded | Pass | None |
| 3.3 Identity exclusion | identity at2i | height2>1; identity is not a valid nonidentity fixed-point witness | Pass | None |
| 3.3 Highest-point set versus full period | [4] and[4,4] | both sets4ℤ+i; full widths4 and8 | Pass | None |
| 3.4 Raw conjugacy iff rotation, both ways | [3,6]/[6,3]; [4]/[4,4]; [3,4,5]/[5,4,3] | T/T,F/F,F/F; widths9/9,4/8,12/12; last cyclic centres{0,3,7} versus{0,5,9} | Pass | None |
| 3.4 Finite cyclic-gap step | all admissible lists of sum≤12 | 226 lists,51,076 ordered pairs; equal-width translated centres iff rotated lists:0 mismatches | Pass | None |
| 3.4 Narrow class recovery | D12 principal versus J | periods[4] versus[3,2], cone counts1≠2; equality/conformal equivalence both false | Pass | None |
| 4.1 F_DIT definition | i,±1/2+2i,±1/2+i√3/2 | membership T,T/F,T/F; i∉fdo | Pass | None |
| 4.1 Measurability/null difference | finite line/circle boundary decomposition | planar boundary area0; transferred hyperbolic area0 | Pass | None |
| 4.1 Domain integral comparison | invariant F=1 | both domain integrals=π/3; boundary difference0 | Pass | None |
| 4.1 Pushforward agreement | fdo⊆F_DIT⊆fd | restricted-measure difference0; quotient full massesπ/3=π/3 | Pass | None |
| 4.1 Null quotient points | ∅ and cone point[i] | masses0 and0; full modular massπ/3>0 | Pass | None |
| 4.1 Regular-locus connectedness | path2i→2+2i | height2 lies above all elliptic lifts of height≤1; zero deleted points met | Pass | None |
| 4.2 Pushforward evaluation | E=∅,M | both formulas give0,πℓ_A | Pass | None |
| 4.2 Total mass | D12 andD28 | π,2π and2π,5π; all exceedπ/3 | Pass | None |
| 4.2 Integral-map identity | f=0,1 | both sides0,πℓ_A | Pass | None |
| 4.2 Rotation invariance | [3,6] and[6,3] | full mass2π on both; same over-M orbit map | Pass | None |
| 4.2 Finite sheet density | high principal D28 cusp | width9 gives sheet count9; image restriction has count1, differing by8 | Pass | None |
| 4.3 L_S positivity/probability | singletonℓ=2; familyℓ=2,5; empty | masses2π/(2π)=1,7π/(7π)=1,0≠1 | Pass | None |
| 4.3 Borel evaluation formula | E=∅ andM | normalized values0 and1 | Pass | None |
| 4.3 Singleton law | ℓ=2 | ρ=ν/(2π), mass1 | Pass | None |
| 4.3 Disjoint-family mixture | lengths2,5 | (2/7)/(2π)=(5/7)/(5π)=1/(7π); equal weights give1/(4π),1/(10π) | Pass | None |
| 4.3 Coset-representative independence | C=ℤ/4, square subgroup{0,2} | 0+C²=2+C²={0,2}; same length sum and same measure sum | Pass | None |
| 4.3 Modular probability normalization | test area a=π/6 | (3/π)a=1/2; total(3/π)(π/3)=1 | Pass | None |
| 4.4 Complementary involution | C=ℤ/4,J=2 | 0↔2;1↦1;3↦3; applying twice gives original element | Pass | None |
| 4.4 Complementary density/mass | D12,D28 | 3π=9·π/3 and7π=21·π/3 | Pass | None |
| 4.4 Width identity | D12,D28 | 4+5=9=3(1+2);9+12=21=3(2+5) | Pass | None |
| 4.4 Oriented boundary cancellation | an arc and its reversed copy | signed multiplicities+1−1=0, including twice-retraced image arcs | Pass | None |
| 4.4 Fixed complementary class | D5, period[3], J=1 | 2ν=6μ_mod; masses2π=6·π/3; ν=3μ_mod | Pass | None |
| 4.5 Stable-family covering | D28,{I,J} | Σν mass7π=21·π/3; normalized density21/(7π)=3/π | Pass | None |
| 4.5 Genus preservation iff J square | ℤ/4,J=2 versusℤ/2,J=1 | first preserves square cosets{0,2},{1,3}; second swaps singleton cosets | Pass | None |
| 4.5 Two-square criterion | D12,28,136; nonfundamental9 | 3∣12,7∣28;136=6²+10²;9=0²+3² despite3∣9 | Pass | None |
| 4.5 J square differs from J=1 | D136 |35²−34·6²=1;34y²−1=33,135,305,543,849,1223 for y1…6, none square | Pass | None |
| 4.6 D12 principal ideal/class | (2,3+√3),1+√3 | generator norm−2, ideal norm2; negative norm gives J | Pass | None |
| 4.6 D12 periods/unit/areas | [4],[3,2] | words[[4,−1],[1,0]],[[5,−3],[2,−1]], traces4,4; ε=2+√3; areasπ,2π | Pass | None |
| 4.6 D28 ideal signs | 3+√7,2+√7 | norms2,−3; labels I,J | Pass | None |
| 4.6 D28 periods/unit/areas | [3,6],[3,3,2,2,2] | words[[17,−3],[6,−1]],[[23,−18],[9,−7]], traces16,16; ε=8+3√7; areas2π,5π | Pass | None |
| 4.6 Primitive lengths | D12,D28 |2logε=2.633915794,5.537318767, same within each pair | Pass | None |
| 5.1 Compact truncation/exhaustion | m9,Y3,6 | omitted areas3,1.5; nested truncations increase, missing tail tends0 | Pass | None |
| 5.1 Top orientation/width | F=y, m9 | α=dz/2; integral from9+iY to iY=−9/2 | Pass | None |
| 5.1 Paired-side cancellation | F=log y on translated vertical sides | integrals+i logY/2 and−i logY/2 sum0 | Pass | None |
| 5.1 Translation-height transport | T⁻³ and y=6 | new height6, old height6; tail remains9/6=1.5 | Pass | None |
| 5.1 Invariant one-form definition | F=1; local F=y | α=0 versus dz/2; F dz would wrongly give dz at F=1 | Pass | None |
| 5.2 Exterior derivative identity | F=log y | dα=dx∧dy/(2y²); ΔF=1; (ΔF/2)dμ same coefficient | Pass | None |
| 5.2 Exact finite Stokes identity | F=1,λ0 | left0, genuine boundary0, top flux0; area itselfπℓ_A | Pass | None |
| 5.2 Nonzero-eigenvalue limit | λ=1/4, flux→0 | λ/2=1/8 nonzero; limiting integral=8·boundary period | Pass | None |
| 5.2 Harmonic limit branch | mean A+BY | a″=0; flux=−iB/2; vanishing forces B0; scalar tail=A/Y | Pass | None |
| 5.2 Absolute convergence not inferred | local cusp harmonic mode exp(2πy/m)cos(2πx/m) | full mean0 and flux0, absolute mean grows exponentially; tests cusp calculation only | Pass | None |
| 5.2 Ordinary/improper integral agreement | F=1, core areaπℓ_A | truncated integralsπℓ_A−m/Y tendπℓ_A | Pass | None |
| 5.2 Full modular descent requirement | local F=y versus F=1 | y(S(2i))=1/2≠2; constant values1=1; only constant passes full invariance | Pass | None |
| 5.3 Holomorphy variable | zero-frequency endpoint term at y100,c.6 | value52.051701860, y derivative.3602585093≠0; nonconstant eigenfunction with λ1/4 is not holomorphic in z | Pass | Specify s |
| 5.3 Laurent cancellation | y7,c.6,ε10⁻⁵ | opposite pole coefficients±√7/2 sum0; model6.73584511533, limit6.73584511472 | Pass | None |
| 5.3 Endpoint constant/derivative | y100,c.6 | mean52.051701860; derivative(1+(log100+.6)/2)/10=.3602585093 | Pass | None |
| 5.3 Endpoint flux | m9,c.6,Y50,100 | −2.072113032i,−1.621163292i; asymptotic logY/√Y→0 | Pass | None |
| 5.3 Endpoint integrability/tail | same Y | tails16.576904255,12.969306335; exact form9(2logY+5.2)/√Y→0 | Pass | None |
| 5.3 Fourier pair coefficient | n±1,n±2,y1,x0 | 4K₀(2π)=.003666337444;8K₀(4π)=.000009769644 | Pass | None |
| 5.3 K derivative sign | t2π,4π | numerical K₀′=−.00098699605767,−.00000126889772625; −K₁ agrees | Pass | None |
| 5.3 First Fourier derivatives | n1,2,y1 | x amplitudes.02303627756,.000122768967; y derivatives−.02297274779,−.000122678691 | Pass | None |
| 5.3 Summable differentiated majorant | r1,2 and sum through50 | σ₀=1,2≤r; r^(3/2)=1,2.828427125; numerical majorant sum1.005300098674 | Pass | None |
| 5.3 Uniform exponential separation | r2,y1,2 | exp(−4πy)≤exp(−2πy)exp(−2π); equality at y1, strict at y2 | Pass | None |
| 5.3 Fourier full-period cancellation | n1,2,m4,9 | (exp(2πinm)−1)/(2πin)=0; x/y derivative means also0 | Pass | None |
| 5.3 Completed endpoint Stokes coefficient | s1/2 | s(1−s)=1/4 and half=1/8 | Pass | None |
| 5.3 Nonendpoint scalar multiplication | t1 versus0 | λ=5/4,half=5/8; Λ(1+2i) finite, Λ(1) has pole | Pass | None |
| 5.3 Cusp-form deduction | zero Fourier constant term | full-period means of F and ∂zF both0; exponential tail finite | Pass | None |

## Unresolved supplier conditions

The accepted conditions `primitive-minus-cycle-interface` and `oriented-quadratic-cycle-reversal` remain required of AutomorphicSpectralTheory §4.17a. Its supplied surface construction exists in the open roadmap text; the precise primitive-cycle complete invariant, primitive Pell-word identification, native narrow-label compatibility and full parametrized reversal are refinements of that contract, not independently restated constructions here. They are written explicitly in Exact supplier contracts and attached to each consumer. No new supplier condition was introduced, and nothing here supplies a reverse dependency.

No unresolved local content, build, import, ownership or gate issue remains. No suspicious instruction to change scope, expose credentials or perform an external write was encountered in the source data. No Lean process remains running.


Pull request: #1696 (roadmap/fuchsian-orbifolds-part-ii at a68a656)
