# Review of ConformalMapping (pull request #998 at ea0f729)

**Verdict:** needs changes

## R01 (P1) — The proposed square prevertices give a 2:1 rectangle

**Location.** `TauCetiRoadmap/ConformalMapping/README.md:1123`, repeated at line 1274: “the prevertices `±1, ±√2` give the square”.

**Claim.** Equality of the Jacobi quarter periods makes this four-prevertex Schwarz–Christoffel image a square.

**Witness.** For prevertices `−1/k, −1, 1, 1/k`, adjacent side lengths are proportional to `2K(k)` and `K(√(1−k²))`. At `k=1/√2` these are `3.70814935460274` and `1.85407467730137`, respectively: ratio `2`, not `1`.

**Repair.** Replace this tuple by `±1, ±(3+2√2)` and explain the condition `2K(k)=K(√(1−k²))`, or keep the old tuple explicitly as a nonsquare rectangle Check. Correct the Layer 6 example too. At `k=3−2√2`, both lengths are `3.16510345444743`; their ratio is `1`. These values were independently recomputed using `K(k)=π/(2 AGM(1,√(1−k²)))`. An output similarity cannot change the ratio. The separate square example with prevertices `−1,0,1,∞` is consistent.

## R02 (P1) — The supplier for unbounded uniqueness requires boundedness

**Location.** `TauCetiRoadmap/ConformalMapping/README.md:1258`: “the bounded three-prevertex theorem is not a supplier here”, followed by `TauCeti.exists_prevertex_cayley_automorphism` in the Needs line.

**Claim.** The cited declaration supplies the comparison of two sector-end or half-strip-end maps.

**Witness.** `TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/PrevertexUniqueness.lean:74` begins with `(hUb : IsBounded U) (hUJ : IsJordanCurve (frontier U))`. The quadrant and half-strip satisfy neither the boundedness hypothesis nor the planar-Jordan-frontier hypothesis.

**Repair.** Remove this supplier from §6.7. Own the comparison for arbitrary holomorphic bijections onto the same domain: compose one inverse with the other, use the native disc automorphism classification through Cayley, and prove its boundary action fixes infinity from the prescribed escape. Cite the inverse and classification providers, and derive the positive-affine stabilizer here. Test on the quadrant (`z ↦ αz`, then fixing `i` gives `α=1`) and the half-strip (fixing `−1,1` gives `α=1, β=0`). Do not add a boundedness hypothesis to the unbounded target. This is a supplier-generality defect, not a missing declaration name or a merge-order cycle.

## R03 (P2) — The Jordan-contour statement omits the domain and interval guards

**Location.** `TauCetiRoadmap/ConformalMapping/README.md:979`: “For a closed piecewise-`C¹` contour `γ` on `[a, b]`, injective on `[a, b)`, with trace `C`, and `f` as in §0.1”.

**Claim.** These hypotheses suffice for the unweighted interior zero-minus-pole count with sign `σ`.

**Witness.** Take `U={1/2<|z|<2}`, `γ(t)=exp(2πit)`, `f(z)=1/z`, `S=∅`. The stated conditions on `f` hold. The integral of `f′/f=−1/z` is `−2πi`; the displayed finite sum is `0`.

**Repair.** State `a<b`, `U` open, and `filledHull C ⊆ U` explicitly, alongside the analytic/meromorphic assumptions and avoidance. Alternatively explicitly retain the contour's null-homology hypothesis in `U`, rather than referring only to the assumptions on `f`. The route mentions the inclusion but the theorem does not assume it. The annulus witness is then excluded because `0∈filledHull C` but `0∉U`. With `U=ℂ`, `S={0}` and `f=1/z`, both sides become `−2πi`. The guard `a<b` also excludes a constant contour on `[a,a]`, whose injectivity on the empty half-open interval gives no Jordan curve or sign theorem.

## R04 (P2) — The disc formula quantifies over unsolved prevertices

**Location.** `TauCetiRoadmap/ConformalMapping/README.md:1192`: “for distinct `wᵢ ∈ ∂𝔻`”, followed by “it gives the conformal map of the disc onto `U`”.

**Claim.** Distinct circle prevertices, with the polygon's exponents, suffice to give the prescribed polygon after output affine normalization.

**Witness.** Cayley-transform the tuple `−√2,−1,1,√2` from R01. All four prevertices are distinct and on the unit circle, with exponents `−1/2`. Its image has side ratio `2`; no output similarity makes it the unit square.

**Repair.** Quantify existentially over prevertices supplied by §6.2 and transported through Cayley, or assume that they are the boundary preimages of the marked vertices under a specified conformal map. Retain the derivative formula for arbitrary distinct circle data, but separate it from prescribed-image existence. Tested: the transformed corrected tuple of R01, and `wᵢ=iᵏ`, give ratio `1`; the old tuple remains a negative control. The distinction is explicit in ahlfors-complex lines 8878–8893 and driscoll-trefethen lines 108–125.

## R05 (P2) — The continuous-index headlines are statable, but absent

**Location.** `TauCetiRoadmap/ConformalMapping/Suggested.lean:25`: “Two headline theorems are not statable at the pins and are therefore not stated”. Also `README.md:426`, whose compactness criterion is absent from the acceptance test.

**Claim.** The continuous Jordan index theorem and continuous-boundary argument principle lack a carrier at the pins.

**Witness.** A six-line real-body definition chooses the integer `n` for which a continuous argument lift satisfies `θ(b)−θ(a)=2πn`, returning `0` off its domain. This definition and both full headline signatures elaborate at the pins.

**Repair.** Add that simple definition on native functions and intervals, and the full continuous Jordan-index and continuous-boundary argument-principle signatures, each with `sorry`; update the docstring. This is the README's actual argument-lift definition, not integral winding on nonrectifiable loops. Also state §1.1's compactness iff closedness-and-local-boundedness criterion, which elaborates directly on `Set C(Ω,E)` for proper complex normed `E`. Keep the API proofs in the README.

The scratch probe used the genuine condition `∃ θ, ContinuousOn θ (Icc a b) ∧ (∀ t∈Icc a b, γ t−w=‖γ t−w‖·exp(iθ t)) ∧ θ b−θ a=2πn`, with classical choice and a real fallback body. The boundary theorem uses a positive Jordan parametrization and the finite-support sum of `analyticOrderNatAt (f−w)` over `Ω`. All three theorem signatures elaborate with only `sorry` warnings. The circle and its reversal give `n=1,−1`, a constant loop gives `0`, and `f(z)=z²` gives boundary index and multiplicity sum both `2`. The construction is available without formalizing its well-definedness proof first, just as other simple acceptance-test definitions are.

## R06 (P2) — Existing native results are still presented as new targets

**Location.** `TauCetiRoadmap/ConformalMapping/README.md:552` (“Prove the packaging”), line 1220 (“Prove the normalized power asymptotic”), and line 1240 (“prove the finite limit”).

**Claim.** The stated conformal/bundled packaging and the two end asymptotics remain work this roadmap owns.

**Witness.** `Biholomorph.lean:122,134,142,150,158,175` already supply the bundle, both coercions, inverse holomorphy and conformality. `Infinity/Power.lean:224` and `Infinity/Logarithmic.lean:152` state exactly the proposed limits, at greater generality.

**Repair.** Move these facts into the exact supplier contracts and delete their restatements as targets. Keep only an explicitly different adapter, with its extra conclusion stated. Cite `DifferentiableOn.toHomeomorphOfBijOn`, its apply/symm-apply theorems, `DifferentiableOn.conformalAt_of_isOpen_of_injOn`, and the two limit declarations. The power provider needs only `S>−1`, not polygonality; the logarithmic provider needs only `S=−1`. On empty finite data `F(z)=z−z₀`, `F(z)/z→1`; for the half-strip data `F(z)−log z` tends to its native named constant. No new theorem is needed for those assertions.

If the automorphism sentence in §3.1 remains, change **precomposing** to **postcomposing** for `f:Ω→𝔻` (and precompose the inverse). On `Ω=ℍ`, a disc automorphism has source `𝔻`, so `f∘a` is not the claimed map `ℍ→𝔻`; `a∘f` is. The native Riemann-map uniqueness theorem already has the latter direction.

## R07 (P3) — The auxiliary Lean files retain padding and forbidden imports

**Location.** `TauCetiRoadmap/ConformalMapping/CourseExamples.lean:1–2,16–38` and `TauCetiRoadmap/ConformalMapping/UnivalentLimitsSuggested.lean:1,15–35`.

**Claim.** These are headline acceptance-test files satisfying the Lean form rules.

**Witness.** `univalent_limit_dichotomy` is exactly `TauCeti.hurwitz_injOn`. Its companion excludes a constant using two unequal values. The other file computes `7/12` and excludes `2/3`. It imports `Mathlib.Tactic`; neither file has `import Mathlib`.

**Repair.** Delete both auxiliary files; equivalently, delete these declarations from the acceptance-test material, not prove them in place. Their mathematics stays in the README Checks. The four theorem names also have no corresponding README declarations. The witness calculations are `(1−9/16)/(1−1/4)=7/12<2/3`, and a constant cannot take values `0` and `1/8` at two points. This is the unrepaired auxiliary-file portion of previous R05. The supplied gate checks `Suggested.lean` and reports success; it does not discharge the brief's form requirement for these two additional files.

## R08 (P3) — Source locators remain incorrect or missing

**Location.** `TauCetiRoadmap/ConformalMapping/README.md:601,659,1000,1212,1235,1253,1307`. In particular: “Ch. 4 §6.5, the reflection across analytic arcs” and “32 (1931), 115–128”.

**Claim.** The cited locations support the specified analytic-arc construction and removability statement, and every target has an exact locator.

**Witness.** ahlfors-complex lines 6558–6595 treat real-axis reflection; analytic-arc complexification/inversion is at lines 8755–8785, Ch. 6 §1.4, pp. 234–235. Besicovitch's publisher record gives pp. 1–9, not 115–128.

**Repair.** Cite Ahlfors Ch. 6 §1.4, Theorem 4, pp. 234–235 for the analytic-arc adapter, retaining Ch. 4 §6.5, Theorem 24, pp. 172–173 for real-axis reflection. Correct Besicovitch's title and pagination and supply the actual theorem/page once its text is readable. Add claim-level locators to §§5.5–5.7, 5.9–5.10, 6.1 and 6.4–6.7 rather than relying on the bibliography or a module glob. For §5.3 use Thomassen Theorem 2.12, p. 122; for §6.3 use Driscoll–Trefethen Theorem 2.1, p. 10, equation (2.2), distinguishing the additional asymptotics and uniqueness arguments.

The exact sampled source outcomes are below. No `sources.toml` exists in the folder, although ten works are listed; record the works under their existing source keys when repairing the package. This review did not create or alter a repository manifest. Besicovitch pagination is independently supported by the [publisher's issue record](https://academic.oup.com/plms/issue/s2-32/1); the article's mathematical text remains unverified.

## R09 (P3) — Three normal-family Checks compute the wrong predicate

**Location.** `TauCetiRoadmap/ConformalMapping/README.md:411,448,481`: “continuous nowhere on the frontier near `1`”, “unbounded at every point”, and the derivative-one normalization Check.

**Claim.** The stated examples have those properties and test membership in the normalized family.

**Witness.** `nz` is always `0` at `z=0`. `sin(1/(1−z))` is analytic near every boundary point other than `1`. At `n=2`, `((1−1/n)z)′(0)=1/2`, not `1`.

**Repair.** Say that `nz` is pointwise unbounded for `z≠0` and unbounded on every neighbourhood of `0`; say that the sine example fails to extend continuously **at `1`**. Replace the normalized-family witness by `Fₙ(z)=z+z²/(4(n+1))` on the unit disc: `Fₙ(0)=0`, `Fₙ′(0)=1`, and the difference quotient between distinct points has modulus at least `1−1/(2(n+1))≥1/2`, so every member is injective and the limit is `z`. Keep `z/(n+1)` as the collapsing non-example. These replacements compute the intended hypotheses on every index, including `n=0`.

## Previous findings, checked against this head

- **Previous R01: partly repaired.** `Suggested.lean:11` now says “It states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti”; the Cayley, removability, chosen-map, Darboux and source-infinity signatures are present. Lines 25–30 explicitly name the omitted continuous-index headlines, but the claimed nonstatability is false (R05 above).
- **Previous R02: repaired.** `README.md:69` says “None of these is a supplier of any layer here”; lines 72–74 put the holomorphic-family criterion on native continuous maps and say it “consumes nothing” from GlobalHolomorphicFunctions. §5.9 uses its own Jordan-index theorem. The old AC/GMT/GH return edges are gone.
- **Previous R03: repaired.** The commit-pinned GH0 link is gone. The scope names “GlobalHolomorphicFunctions, GH0” at line 72; the current supplier still labels Layer 2 as GH0 and has the function-space contract in §2.2.
- **Previous R04: partly repaired.** There are now 26 numbered targets, seven layer Examples/Dependencies pairs, explicit Needs lines, and discriminating lists for the principal definitions. The quote “Ch. 4 §6.5, the reflection across analytic arcs” illustrates the remaining locator defects (R08), and three Checks need correction (R09).
- **Previous R05: partly repaired.** The seven old wrappers have gone from `Suggested.lean`, replaced by seven admitted substantive signatures. `UnivalentLimitsSuggested.lean:22` still reads `TauCeti.hurwitz_injOn hΩ hconn hF hconv hinj`; both extra files remain (R07).
- **Previous R06: repaired.** `README.md:53` calls the Riemann-mapping helpers “two public lemmas”, and line 56 says “Mathlib has no winding number of a continuous loop at the pin”. The obsolete upstream-number discussion is replaced by the shape convention at lines 121–123. The named helpers are public at the pin.

No available repair report marks a finding “not actionable in this package”; none of these findings invokes that exception.

## Verified sound

This is a full review of the 1,322-line README, seven declarations in `Suggested.lean`, and four declarations in the two auxiliary Lean files. I read the repository's normative README and CONTRIBUTING, compared main's ConformalMapping scope, and read the completed ContourIntegration and UniversalCovers roadmaps for shape and ownership. The 26 numbered target sections, their API bullets, Checks and proof routes were considered; the computed records below separate valid instances from failed Checks. The existing L0–L6 programme is being extended and connected, not replaced by a different roadmap; the defects above are repairable. No algorithmic target, sorry-valued data, `set_option`, or copied source passage was found in the four reviewed files. Source-comparison coverage is stated explicitly below rather than inferred from a successful build.

**Gate and worktree.** HEAD is `ea0f729a7cc1dd86dc86dd7c57cfedc45d34d2c3`; `git status --short` was empty. The diff outside `TauCetiRoadmap/ConformalMapping` was empty. The worker's full gate at this head reports:

```text
gate ConformalMapping: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

I independently ran the prescribed dependency command with `--movable`:

```text
depcheck: 208 roadmaps, 1461 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. I read every Needs line and the supplier contracts. The boundedness mismatch in R02 is invisible to this graph check. No declared supplier gaps were supplied by the package.

**Elaboration and padding.** Direct `lake env lean` elaboration of the absolute `Suggested.lean` path from the worktree succeeded with precisely seven `declaration uses sorry` warnings, at lines 44, 56, 74, 87, 107, 124 and 145. No object-file build was necessary in this run. A scratch file containing the actual declarations and `#check @name` for all eleven declarations also elaborated. Every required interval, continuity, openness, injectivity, filter nontriviality, limit, nonimage and corner binder remains in the displayed signature; no dropped section variable was found and no repository signature was changed.

A scratch copy tried `simp`, `rfl`, and `infer_instance` on each of the seven current admitted theorems. None closed. Reading the nearest native signatures also found no single matching `exact` provider for those seven: the chosen-map extension genuinely keeps a specified map, while the native existential theorem chooses one; the general Jordan statement lacks the native locally-straight hypothesis; the source-infinity theorem omits a vertex factor whereas the native all-finite theorem does not. This test is evidence against those particular padding mechanisms, not a proof that every possible short proof is absent. The auxiliary dichotomy's exact provider and the other three Check-level specializations are R07. The three additional headline signatures in R05 elaborate with only `sorry` warnings.

**Pinned declarations and definitions opened.** Pins were checked against `lake-manifest.json` and the package git heads: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Paths below are relative to those repositories. A lexical audit resolved the 176 qualified names/module references in the README: 162 declaration-name hits, one declaration split across lines (the removability theorem below), and 13 module/namespace references. This is a presence audit; the mathematical contract checks use the declarations opened below.

| Pinned file and line | Declaration or definition checked; relevant scope |
|---|---|
| `Mathlib/Analysis/Complex/UpperHalfPlane/Metric.lean:42,58` | `UpperHalfPlane.dist_eq`, `tanh_half_dist`: native metric has the factor two. |
| `Mathlib/Analysis/Complex/RiemannMapping.lean:51,120` | `Complex.exists_injective_not_dense_image_deriv_ne_zero`, `exists_mapsTo_unitBall_injOn_deriv_ne_zero`: public preliminary results, not the full theorem. |
| `Mathlib/AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean:134` | `IsSimplyConnected s := SimplyConnectedSpace s`; path-connectedness supplies nonemptiness, so the empty domain is not a counterexample to Riemann mapping. |
| `Mathlib/Topology/Compactification/OnePoint/Sphere.lean:34` | `onePointEquivSphereOfFinrankEq`: the finite-dimensional one-point/sphere comparison needed by §5.3 exists. |
| `TauCeti/Topology/JordanCurve/Basic.lean:108` | `IsJordanCurve C := Nonempty (C ≃ₜ Circle)`; a generic topological-space predicate, no differentiability or length requirement. |
| `TauCeti/Analysis/Complex/Conformal/Jordan/Domain.lean:118` | `IsJordanDomain`: open, **connected (including nonempty)**, bounded, Jordan frontier. |
| `TauCeti/Topology/FilledHull.lean:83` | `filledHull K := {x \| IsBounded (connectedComponentIn Kᶜ x)}`; on `K` the component is empty, so the definition includes `K`. |
| `TauCeti/Analysis/Contour/PiecewiseC1On.lean:86` | `IsPiecewiseC1On`: continuity on `uIcc`, finite breakpoints, `C¹` on the closed pieces; no positivity of `b−a` is built in. |
| `TauCeti/Analysis/Contour/Argument/Cycle.lean:110` | `argumentPrinciple_nullHomologous`: closed piecewise-`C¹` curve, avoids finite `S`, lies in open `U`, and an explicit null-homology hypothesis. |
| `TauCeti/Analysis/Complex/Conformal/NormalFamilies.lean:101` | `IsLocallyBoundedOn`: one bound for every compact set, uniform in the family index; not a pointwise bound. |
| `TauCeti/Analysis/Complex/Conformal/Montel/Precompact.lean:196` | `isCompact_closure_range_iff_isLocallyBoundedOn`: proper target, open source, ambient holomorphic representatives and their `domRestrict` agreement. |
| `TauCeti/Analysis/Complex/Conformal/Hurwitz.lean:283` | `hurwitz_injOn`: `l.NeBot`, open preconnected source, eventual holomorphy/injectivity, locally uniform convergence. |
| `TauCeti/Analysis/Complex/Conformal/SchwarzPick/Derivative.lean:106` | `norm_deriv_div_one_sub_norm_sq_le`: both source and image in the open disc, positive denominators. |
| `TauCeti/Analysis/Complex/Conformal/RiemannMapping/Existence.lean:96` | `riemannMapping`: open, simply connected proper source; bijection, holomorphy and nonzero derivative. |
| `TauCeti/Analysis/Complex/Conformal/Biholomorph.lean:122,134,142,150,158,175` | Native bundle, forward/inverse coercions, inverse holomorphy and both conformality claims (R06). |
| `TauCeti/Analysis/Complex/Conformal/RiemannMapping/Conformal.lean:57,67` | `riemannMapping_homeomorph`, `riemannMapping_openPartialHomeomorph`: existing packaged Riemann maps. |
| `TauCeti/Analysis/Complex/Conformal/Reflection/Arc.lean:208` | `exists_differentiableOn_eqOn_chartedReflection_of_symmetric`: holomorphic charts, conjugation-invariant targets, image constraint and real-coordinate boundary constraint. |
| `TauCeti/Analysis/Complex/Conformal/Removability/Arc.lean:54` | `differentiableOn_of_continuousOn_of_differentiableOn_diff_of_subset_coord_im_eq_zero`: charted-real-locus removability; does not supply rectifiable-arc removability. |
| `TauCeti/Analysis/Complex/Conformal/Caratheodory.lean:215` | `exists_continuousOn_closedBall_eqOn_of_isJordanCurve_frontier`: positive radius, bounded image, Jordan frontier, chosen holomorphic injective map. |
| `TauCeti/Analysis/Complex/Conformal/Jordan/Approach.lean:198,213` | `injOn_closedBall_of_isJordanCurve_frontier`, `exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier`: extension injectivity versus existential choice of map. |
| `TauCeti/Analysis/Complex/Conformal/BoundaryCorrespondence.lean:237` | `closureHomeomorph`: bounded source, continuous extension, equality on the source, closure injectivity. |
| `TauCeti/AlgebraicTopology/Singular/JordanBrouwer.lean:212` | `natCard_zerothHomotopy_sphere_compl_range_eq_two`: continuous injection of spheres in adjacent finite dimensions; counts path components. Open-manifold local path connectivity identifies connected components. |
| `TauCeti/Analysis/Contour/Argument/Lift.lean:422` | `exists_continuousOn_arg_lift_with_partition`: `a≤b`, continuous curve avoiding the point, an explicit continuous argument formula; no rectifiability assumption. |
| `TauCeti/Analysis/Contour/Curve/Approximation.lean:69` | `exists_contDiff_eq_endpoints_dist_lt`: smooth approximation of a continuous interval map preserving endpoints. |
| `TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/PolygonalDomain.lean:496` | All-finite necessity: nonimage finite limit, local side/corner models; includes every marked vertex factor. |
| `TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/PrevertexUniqueness.lean:74` | `exists_prevertex_cayley_automorphism`: bounded domain and planar Jordan frontier (R02). |
| `TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/Infinity/Power.lean:224` | `tendsto_schwarzChristoffelPrimitive_div_cpow_atInfinity_of_neg_one_lt_sum`: all upper-half-plane approaches, `S>−1`, no polygon assumptions. |
| `TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/Infinity/Logarithmic.lean:152` | `tendsto_schwarzChristoffelPrimitive_sub_log_atInfinity`: `S=−1`, native base-point-dependent constant. |

The corresponding covering/lifting and `AddCircle` names resolve at this Mathlib pin. Searching the entire pinned Mathlib for `windingNumber` returned no hit. That absence concerns the named continuous-index API; it does not prevent defining the integer via the native argument lift as in R05.

**Ownership and supply.** Searches used `roadmaps grep` by object, local pinned sources, main, board package READMEs/signatures, and the supplied open checkouts. The index's hits in open work for which this brief supplied no checkout were not used to establish a new owner or a dependency. No second fully qualified owner of the seven retained signatures was established among the supplied files. The native duplication found by object is R06.

- Main `TauCetiRoadmap/ConformalMapping/README.md:124–147` already owns Jordan separation, filled hull, boundary correspondence and polygon mapping. Those remain this roadmap's responsibility; the open Part II explicitly leaves boundary correspondence and Schwarz–Christoffel here.
- Main `Completed/ContourIntegration/README.md:120,158,184` resolves Layers 0–3: curves/cycles and winding; residue/argument principle; homological Cauchy. §0.1 here adds finite linear combinations to the raw-curve pinned signature by linearity, rather than a competing contour carrier.
- Main `TauCetiRoadmap/DifferentialGeometry/README.md:585,762` resolves §5.6.1's AC curve/index/area contract and consumption of conformal boundary topology. Main `TauCetiRoadmap/GeometricMeasureTheory/README.md:63,106,148,275–298` resolves G1–G2 and G6. Main `TauCetiRoadmap/Isoperimetry/README.md:66,397` resolves I6. They are consumers only here.
- Supplied open `TauCetiRoadmap/GlobalHolomorphicFunctions/README.md:678,723,1304,1542,1610` resolves GH0 as Layer 2, its native holomorphic-map space in §2.2, and GH4 as Layer 6 with the Jordan-boundary application in §6.5. There is no reverse supplier edge in this head.
- Supplied open `TauCetiRoadmap/ConformalMappingPartII/README.md:7,93–95` explicitly imports the base L1–L4 programme. Its Cayley direction is `𝔻→ℍ`, the inverse of this roadmap's `c:ℍ→𝔻`; `C(0)=i`, `c(i)=0`, `C(1/2)=3i`, `c(3i)=1/2`. These conventions agree. Its curvature-minus-one disc convention has twice the distance used by the native `hyperbolicDist` here; §2.1 supplies exactly the factor needed.
- Main `Completed/UniversalCovers/README.md:66` onward owns the cover/deck-group foundations, not the continuous integer index being constructed here.
- The broad ModularForms scope sentence at lines 75–76 is not used as a prerequisite. Main's Layer 10 at line 1024 supplies modular quotient/dimension theory; I did not certify that it contains the separately named λ-function/Picard programme. This unsupported scope attribution is recorded below, not treated as an imaginary supplier for a proof here.

**Headline coverage.** The four stated end theorems are general Jordan separation, general Jordan index, Darboux boundary injectivity, and source-infinity Schwarz–Christoffel necessity. The seven signatures cover the Cayley comparison, rectifiable removability, a chosen map's closed-disc extension, general separation, **piecewise-`C¹`** Jordan index, Darboux, and source-infinity necessity. Thus only three of the four end theorems are fully represented. The continuous-boundary argument principle and compactness criterion are also explicit deep objectives in the summary and build table; they are missing (R05). The pinned Hurwitz, Montel relative-compactness, Schwarz–Pick, Riemann mapping, real/charted reflection, existential Carathéodory, and bounded polygon-existence results are named rather than duplicated in `Suggested.lean`. The chart construction and analytic-boundary inverse extension remain prose targets; their interface must stay tied to actual analytic charts, not a free predicate.

**Adversarial computations (133 rows).** The following table records actual values, not just that an example was inspected. `D` means the unit disc; `H` the upper half-plane; `C` a trace; `S` the sum of SC exponents. “Retain” means no repair indicated by that instance, not a claim that finite examples prove a universal theorem. Rows cover all 26 numbered target sections, their defining conventions and principal API assertions, all seven current headline signatures, all four auxiliary declarations, the 15 seeded targets and every finding's witness. Algebraic characteristic/rank/DVR tests do not apply to this scalar complex-analytic roadmap; the relevant degeneracies are empty domains, zero-length intervals, constants, boundary points, collapsed finite data, and totalized division.

| Statement | Instances tried | Computed values on the two sides / hypothesis and conclusion | Result | Change |
|---|---|---|---|---|
| Domain convention | `D`, `∅`, `ℂ` | `D`: nonempty/open/connected true; `∅`: connected-nonempty false; `ℂ≠univ`: false | Native guards discriminate | Retain |
| Jordan-curve definition | circle, segment, figure eight | Circle≃circle; segment complement has 1 component; figure-eight complement has 3, not 2 | Nonexamples excluded | Retain |
| Jordan-domain definition | `D`, `H`, punctured disc | `D`: four fields true; `H`: bounded=false; punctured disc: frontier circle∪{0}, not a circle | Guards discriminate | Retain |
| Filled-hull definition | unit circle and its centre/exterior | At boundary component in complement is ∅, hence bounded=true; at 0 component=D, bounded=true; at 2 component exterior, bounded=false | Hull=closed disc | Retain |
| Hyperbolic normalization | `i,2i` | `dist_H=log 2`; `d_D(0,1/3)=log 2/2` | Factor 2 required | Retain |
| Reflection convention | `f(z)=z`, `z=−i` | `conj(f(conj(−i)))=−i=f(−i)` | Correct sign | Retain |
| SC exponent/branch convention | right and reflex angles | `α=π/2→e=−1/2`; `α=3π/2→e=1/2`; at `z−a=i`, power phase=`eπ/2` | Correct | Retain |
| §0.1 integral argument principle | `z`, `z²`, `1/z` on CCW circle | Integrals `2πi,4πi,−2πi`; weighted orders `1,2,−1` times `2πi` | Equal | Retain |
| §0.1 cycle linearity | twice circle, zero cycle | `2(2πi)=4πi`; empty sum and integral both 0 | Equal | Retain |
| §0.1 image winding | `(z−1/2)(z+1/2)` | Two simple zeros; composed boundary index 2; integral `4πi` | Equal | Retain |
| §0.1 orientation/outside singularities | reversed circle; circle about 3 | Winding of 0 `−1,0`; integrals `−2πi,0` | Equal | Retain |
| §0.2 finite interior zeros | `z²−1/4` on D | Zero set `{−1/2,1/2}`, cardinal 2; both boundary values nonzero | Finite | Retain |
| §0.2 conformal multiplicity transport | `f=z²`, `φ=2z` at 0 | `ord(4z²)=2=ord(z²)`; `φ′=2≠0` | Equal | Retain |
| §0.2 critical-map control | `f=z`, `φ=z²` | `ord(f∘φ)=2≠1=ord(f)`; injectivity=false | Correct exclusion | Retain |
| §0.2 boundary-continuity Check | `sin(1/(1−z))` | At −1 value `sin(1/2)` and analytic extension; zeros `1−1/(nπ)` accumulate at 1 | “Nowhere” false | R09 |
| §0.2 identically zero exclusion | `f=0` on D | Boundary values 0; nonvanishing=false; zero set infinite | Excluded | Retain |
| §1.1 compactness iff closed and locally bounded | constants with values in `[0,1]`; in `(0,1)` | First: closed=true, bound 1, compact=true; second: bound 1, closed=false, compact=false | Both directions tested | R05 signature |
| §1.1 closure holomorphy | `zⁿ` on D | On radius r<1, sup=`rⁿ→0`; limit derivative=0; closure adds 0 | Correct | Retain |
| §1.1 empty family/domain | empty family; Ω=∅ | Empty set compact/closed, all bounds vacuous; `C(∅,E)` singleton | Both sides true | Retain |
| §1.1 local-bound Check | `Fₙ(z)=nz` | At 0 sup=0; at 1/2 sup=∞; on radius r>0 sup=∞ | Claimed pointwise universality false | R09 |
| §1.1 constants diverging | `Fₙ=n` | Every point has sup=∞; no finite compact bound and no convergent subsequence | Correct, weak discriminator alone | Retain with other Checks |
| §1.2 / auxiliary dichotomy | `z/(n+1)` | Each derivative `1/(n+1)≠0`; limit 0, injective=false on D, constant=true | Constant alternative needed | R07 delete wrapper |
| §1.2 / auxiliary two-value consequence | `z+z²/n`, n≥1, radius 1/4 | Difference quotient modulus≥`1−1/(2n)>0`; limit values at 0,1/8 are 0,1/8 | Noncollapse | R07 delete wrapper |
| §1.2 two-value closed family | maps fixing 0 and 1/8 | Limit evaluations remain 0 and 1/8; constant would require `0=1/8` | Closedness route valid | Retain |
| §1.2 derivative normalization Check | `(1−1/n)z`, n=2 and n=1 | Derivatives 1/2 and 0, versus prescribed 1 | Members fail hypotheses | R09 |
| §1.2 corrected normalized Check | `z+z²/(4(n+1))` | Value at 0=0, derivative=1; injectivity quotient modulus≥1/2 | Correct including n=0 | R09 repair tested |
| §1.2 disconnected control | two radius-1/4 discs around 0 and 3; maps `z/(n+1)` and `z` respectively | Images remain disjoint; limit constant 0 on first, identity on second | Neither globally constant nor injective | Retain preconnectedness |
| §2.1 Cayley map and inverse | `i,3i,0` in their valid domains | `c(i)=0,c(3i)=1/2,C(0)=i,C(1/2)=3i` | Inverses agree | Retain |
| §2.1 denominator guards | `z∈H`; `z=−i` | `Im(z+i)>1`; at excluded `−i`, denominator=0 and total quotient=0 | Guard essential | Retain |
| §2.1 headline metric identity | `i,2i`; equal points | `log 2=2·log 2/2`; `0=2·0` | Equal | Retain |
| §2.1 two-point norm identities | `z=i,w=1+i` | `\|c z−c w\|=1/√5`; denominator expression=1; ratio=`1/√5=\|z−w\|/\|z−conj w\|` | Equal | Retain |
| §2.1 infinitesimal metric | at `z=i` | `\|c′(i)\|=1/2`; pullback `2·(1/2)/(1−0)=1=1/Im i` | Equal | Retain |
| §2.1 geodesic transport | `z=iy`, y>0 | `c(iy)=(y−1)/(y+1)∈(−1,1)`; vertical geodesic goes to diameter | Correct | Retain |
| Schwarz–Pick interpolation / CourseExamples pair | `f(1/2)=3/4` | Bound `(7/16)/(3/4)=7/12`; `2/3−7/12=1/12>0` | Bound/exclusion correct | R07 keep as Checks |
| Interpolation sharpness | `f=φ_(3/4)⁻¹∘φ_(1/2)` | `f(1/2)=3/4`; derivative magnitude `(7/16)·(4/3)=7/12` | Equality attained | Retain |
| §3.1 normalized map | D, base 0 | `f=id`, `f(0)=0`, `f′(0)=1`; inverse=id | Correct; already native | R06 |
| §3.1 half-plane normalization | H, base i | `c′(i)=−i/2`; `(ic)′(i)=1/2>0` | Correct rotation | Retain |
| §3.1 inverse/conformal bundle | `f=2z` from D to radius-2 disc | Inverse=`w/2`; derivative product `2·1/2=1`; both nonzero | Existing native API | R06 |
| §3.1 automorphism direction | H→D map c, disc automorphism a | `a∘c:H→D`; `c∘a` has wrong source; `i∉D` | Precomposition wrong | R06 |
| §3.1 proper-domain control | Ω=ℂ | Bounded entire map constant; image a singleton≠D | Properness essential | Retain |
| §3.1 slit-plane example | `f=(√z−1)/(√z+1)` at 1 | `f(1)=0`, `f′(1)=1/4>0`; `Re√z>0` | Normalized correctly | Retain |
| §4.1 regular analytic arc | `t`, `t+it²`, cusp `t²+it³` | First two derivatives at 0=1; cusp derivative=0 | Cusp excluded | Retain; R08 locator |
| §4.1 exact straightening | Γ(z)=z+iz², chart Γ⁻¹ near 0 | `e(γ(t))=t`, `Im=0`; `e(Γ(iε))=iε` | Real locus and side distinguished | Retain |
| §4.1 circle chart and sign | `e=−i log z`, real r near 1 | `Im e(r)=−log r`; at r<1 positive, at r>1 negative | Both sides correct | Retain |
| §4.1 nonanalytic control | `t+i\|t\|³` | Third derivatives from left/right differ by `12i`; not real analytic | No analytic straightening | Retain |
| §4.2 reflection existence | id and z² near real 1 | Extensions id,z²; `(conj z)²=conj(z²)` | Equal | Retain |
| §4.2 reflection uniqueness | two extensions agreeing on half-disc | Difference 0 on an open subset, analytic germ difference=0 | Identity theorem route valid | Retain |
| §4.2 antiholomorphic control | `conj z` | `f(1)=1`; complex difference quotients along real/imaginary increments `1,−1` | Holomorphy false | Retain |
| §4.3 removability headline | segment [−1,1], F=z | Length 2; derivative on/off arc=1 | Correct | Retain |
| §4.3 finite-length grid route | L=2, F=z, modulus ω(t)=t | Error bound `O((2+δ)√2δ)→0`; square integral 0 | Correct limiting mechanism | Retain |
| §4.3 continuity/holomorphy controls | `1/(z−1/2)`; `\|z\|²` | Pole at 1/2 has no finite continuous extension; Wirtinger derivative of `\|z\|²` is z, nonzero off 0 | Hypotheses fail | Retain |
| §4.3 localization/circle example | F continuous and holomorphic off circle | Each short arc finite length; at F=z local derivative=1 on both charts | Local version covers circle | Retain |
| §4.3 nonrectifiable control | Koch arc | Variation=∞ versus required ≠∞ | Excluded, no theorem about its removability inferred | Retain |
| §5.1 chosen-map headline | id; `f=2z` on D | Extensions id,2z; boundary radii 1,2; inverses id,w/2 | Chosen map preserved | Retain |
| §5.1 radius-zero control | r=0 | Open ball empty; closed ball singleton; `0<r` false | Degeneracy excluded | Retain |
| §5.1 frontier/inverse API | `2z`, boundary z=1 | `F(1)=2`, inverse(2)=1; frontier image=sphere radius 2 | Equal | Retain |
| §5.1 slit-disc control | slit from 0 to 1 | Two boundary approaches to each interior slit point; injective boundary extension impossible | Jordan assumption essential | Retain |
| §5.2 converse | U=D, f=id; f=z² | id closure injection=true; z² sends 1,−1 to 1, so injection=false | Correct guard | Retain |
| §5.2 half-plane/compactification | c and −c | At infinity limits 1 and −1; c(i)=0; compactified boundary maps to circle | Correct | Retain |
| §5.3 separation headline | unit circle | Components D and {\|z\|>1}; count 2; bounded flags true,false; both frontiers circle | All conjuncts instantiated | Retain |
| §5.3 arbitrary-curve generality | square, Koch snowflake | Both have 2 components; no smoothness field; snowflake perimeter=∞ | Regularity not assumed | Retain |
| §5.3 compact/convex hull API | unit circle | filled hull=closed disc=closed convex hull; exterior=complement of closed disc | Equal | Retain |
| §5.3 nonexamples | segment, figure eight | Complement counts 1 and 3, not 2 | IsJordanCurve false | Retain |
| §5.4 index definition / lift independence | `exp(2πit)`; lifts `2πt` and `2πt+4π` | Both increments `2π`, integer 1 | Independence and normalization | R05 signature |
| §5.4 zero interval and constant loop | a=b; γ=2,w=0 | Argument increment 0; index 0 | Defined degeneracies correct | Retain |
| §5.4 sign and multiple winding | `exp(−2πit)`, `exp(4πit)` | Increments `−2π,4π`; indices `−1,2` | Correct | Retain |
| §5.4 off-trace guard | unit circle,w=1 | `γ(0)−w=0`; normalized quotient totalizes to 0, not Circle | Guard essential | Retain |
| §5.4 concatenation | two CCW circles | Increment `4π`; index `2=1+1` | Additive | Retain |
| §5.4 reparametrization | t=s/2 on [0,2]; reversal | Positive increment 2π gives 1; decreasing increment −2π gives −1 | Correct | Retain |
| §5.4 local constancy/exterior | circle about w=0,1/2,3 | Indices `1,1,0`; 0 and 1/2 in same component | Correct | Retain |
| §5.4 homotopy invariance | circles radius 1+s, s∈[0,1] | Distance from 0≥1; index at each endpoint 1 | Correct | Retain |
| §5.5 integral comparison | CCW circle; square ±1±i | Argument increment 2π; integral 2πi; `(2πi)⁻¹ integral=1` | Equal | Retain |
| §5.5 proximity | δ=γ+(1/2)exp(6πit), γ unit circle | Pointwise distance=1/2<1; avoiding homotopy distance≥1/2; both indices 1 | Correct | Retain |
| §5.5 sufficient-not-necessary control | δ=3γ | Distance=2>1 but indices both 1 | Converse not asserted | Retain |
| §5.5 approximation independence | approximants within ρ/3 of γ | Two approximants distance<2ρ/3; their point-distance>2ρ/3 | Proximity applies | Retain |
| §5.6 continuous headline | circle, reversed circle, square | Interior/exterior indices `(1,0),(−1,0),(1,0)` | Correct | R05 full signature |
| §5.6 interior-circle proof | F=id, w=1/2, r=3/4 | One zero of F−w of order 1; winding 1; boundary distance to w≥1/2 | Proof route avoids boundary integrals | Retain |
| §5.6 circle-homeomorphism degree | rotations; conjugation on Circle | Lift increment `2π`; `−2π`; degrees `1,−1` | Only signs possible | Retain |
| §5.6 piecewise-C¹ Lean signature | γ=exp(2πit), a=0,b=1 | Injective on [0,1), equal endpoints; winding(0)=1, winding(3)=0 | Correct | Retain |
| §5.6 figure-eight control | γ=sin t+i sin 2t | Right lobe signed area `−4/3`, left `4/3`; indices −1,+1 | No single interior sign | Retain |
| §5.7 boundary zero-count headline | D,f=z²,w=0 | Boundary index 2; one zero of order 2; sum 2 | Equal | R05 signature |
| §5.7 other zero counts | z²−1/4,w=0; same f,w=2 | Two simple zeros vs index2; no disc zeros vs index0 | Equal | Retain |
| §5.7 constant and boundary controls | f=2,w=0; f=z,w=1 | Constant: count0=index0; second point on image frontier, excluded | Correct guards | Retain |
| §5.7 conformal multiplicities | pull back z² by φ=2z | Both zero orders 2; zero counts identical | Correct | Retain |
| §5.8 Darboux headline | D,f=id; f=z+z²/4 | id image D; second difference quotient≥1/2 on closure, hence one preimage per interior value | Correct | Retain |
| §5.8 boundary-injectivity control | f=z² on D | f(1)=f(−1)=1; f(1/2)=f(−1/2)=1/4 | Hypothesis/conclusion fail together | Retain |
| §5.8 holomorphy/orientation control | f=conj on D | Boundary degree −1; antiholomorphic though bijective | Positive sign cannot be concluded | Retain |
| §5.8 open/closed-image distinction | f=id | Open image=D; closure image=closed D; 1 belongs only to latter | Correct | Retain |
| §5.8 square example | f=z² on [0,1]² | f(z)=f(w) implies z=±w; −w in quadrant only when both zero | Closure injective | Retain |
| §5.9 missing-domain witness | unit circle, U annulus, f=1/z,S=∅ | Integral `−2πi`; proposed RHS0 | Fails | R03 |
| §5.9 repaired domain witness | U=ℂ,f=1/z,S={0} | Pole order −1; both sides `−2πi` | Equal | R03 repair tested |
| §5.9 positive/reversed/off-centre | z on CCW/CW unit circle; circle about3 | Integrals `2πi,−2πi,0`; signed zero sums `1,−1,0` | Equal | Retain |
| §5.9 rational example | square ±1±i, `(z−1/2)/(z+3)` | Interior zero order1, pole outside; integral2πi | Equal | Retain |
| §5.9 zero interval | a=b=0,γ=1 | Ico empty, InjOn=true; trace singleton not Jordan | Missing a<b | R03 |
| §5.10 extension and inverse | D,f=id near circle1 | e=−i log, charted map=id; inverse derivative1; compositions=id | Correct | R08 locator |
| §5.10 side selection | upper half-disc, open diameter | Identity target chart: interior Im>0, reflected side Im<0 | Sign selection works | Retain |
| §5.10 corner exclusion | local power z^(3/2) at0 | Exponent3/2 noninteger; no holomorphic neighbourhood extension | Analytic-arc hypothesis essential | Retain |
| §6.1 edge/midpoint definition | square 0,1,1+i,i | d₀=1,m₀=1/2; midpoint+iε inside, midpoint−iε outside | Correct | Retain |
| §6.1 orientation sign | square and reversal | σ=1 and −1; local positive side changes with edge direction | Unique and propagates | Retain |
| §6.1 turns/exponents | square and reversal | τ=±π/2; `−στ/π=−1/2` both times; sum−2 | Correct sign factor | Retain |
| §6.1 reflex sector | L-shaped hexagon | Five e=−1/2, one e=1/2; sum−2; reflex opening3π/2 | Correct | Retain |
| §6.1 straight marked vertex | 0,1,2,1+i | At1, turn0, angleπ,e0; remaining exponents sum−2 | Correct | Retain |
| §6.1 total turning | square and reversed square | Στ=2π and −2π; `2πσ` same | Equal; derive after angle-sum theorem | Retain |
| §6.1 nonexamples | n=0,1,2; bow-tie | `three_le` excludes small n; bow-tie edge crossing breaks simplicity | Correct guards | Retain |
| §6.2 bounded existence/angle sum | square; equilateral triangle | S=`4·(−1/2)=−2`; `3·(−2/3)=−2`; angle sums2π,π | Correct | Retain |
| §6.2 false square Check | prevertices ±1,±√2 | Adjacent lengths3.7081493546 and1.8540746773; ratio2≠1 | False | R01 |
| §6.2 corrected square tuple | prevertices ±1,±(3+2√2) | Adjacent lengths both3.1651034544; ratio1 | Correct | R01 repair tested |
| §6.2 nonsquare control | prevertices ±1,±2 | Ratio1.5634019227≠1 | Correct | Retain |
| §6.2 PSL versus PGL | −1/z; −z | At i: i and −i; first preserves H, second does not | PSL direction correct | Retain |
| §6.2 three matched prevertices | real Möbius fixing −1,0,1 | Fix0 gives b=0; fix±1 gives c=0,a=d; map=id | Uniqueness correct | Retain |
| §6.2 affine/basepoint covariance | output `2F+3`; change basepoint | derivative2F′; value at old base3; primitive change `F_new=F_old−F_old(new base)` | Constants determined | Retain |
| §6.3 source-infinity headline | square: e_k=−1/2 | Finite S=−3/2=`−2−e_k`; `z f″/f′→−3/2` | Equal | Retain |
| §6.3 triangular tail | equilateral e_k=−2/3 | S=−4/3; derivative exponent−4/3; primitive tail exponent−1/3 | Correct | Retain |
| §6.3 omitted versus retained factor | square, all-finite vs infinity vertex | Log-derivative limits−2 vs−3/2 | Cases distinguished | Retain |
| §6.3 primitive endpoint constants | F(z₀)=0, f=AF+B | B=f(z₀); f(z₀)+A F∞=v_k | Equal | Retain |
| §6.3 Möbius pole repair | ψ(w)=b−c/(w−r), c>0 | For w=r+iy, ψ=b+ic/y; Im>0; limit∞ as y→0; scalar ψ(r)=b by total division | Update at r required | Retain |
| §6.3 compactified boundary | marked vertex at source∞ | Finite boundary misses v_k, compactified image adds exactly v_k | Nonimage condition excludes collision | Retain |
| §6.3 affine stabilizer | source∞ fixed; matched −1,1 | α(−1)+β=−1,α+β=1 imply α=1,β=0 | Correct | Retain |
| §6.4 disc derivative | square w=iᵏ | Product=`(1−ζ⁴)^(-1/2)` by logs normalized at0; value at0=1 | Correct identity | Retain |
| §6.4 branch domain | \|w\|=1,\|ζ\|<1 | `Re(1−ζ/w)≥1−\|ζ\|>0`; if w=1/2,ζ=w factor0 | Guard essential | Retain |
| §6.4 image claim | transformed ±1,±√2; U square | Distinct circle points=true; image side ratio2≠1 | Shape not determined by angles | R04 |
| §6.4 auxiliary infinity factor | all-finite S=−2 | Extra exponent `−S−2=0`; factor `(1−ζ)^0=1` | Correct | Retain |
| §6.5 sector sum/power | quadrant β=1/2, a=0,e=−1/2,z₀=i | `F=2(√z−√i)`; S=−1/2=β−1; F/√z→2=1/(S+1) | Equal | R06 consume provider |
| §6.5 empty finite data | H, β=1 | S=0; F=z−z₀; F/z→1=1/(0+1) | Equal | Retain |
| §6.5 disc infinity exponent | quadrant | Finite sum−1/2 plus extra−3/2=−2 | Correct | Retain |
| §6.5 excluded boundary β | β=0 or2 | 0∉(0,2),2∉(0,2); β=0 would make S+1=0 | Denominator guarded | Retain |
| §6.6 half-strip sum/log asymptotic | prevertices−1,1; e=−1/2 each | S=−1; F=arcosh z−arcosh i; F−log z→log2−arcosh i | Correct | R06 consume provider |
| §6.6 basepoint-dependent constant | same data,z₀=i | arcosh i=log(1+√2)+iπ/2; constant=log2−log(1+√2)−iπ/2 | Constant is not universally0 | Retain |
| §6.6 one-end control | full strip | Two ends, frontier two parallel lines; compactified trace not a Jordan circle | Excluded | Retain |
| §6.7 uniqueness normalization | quadrant, single vertex0 | Residual αz; fixing i gives α=1 | Correct conclusion | R02 change supplier |
| §6.7 two-vertex normalization | half-strip,prevertices−1,1 | α=1,β=0 as above | Correct conclusion | R02 change supplier |
| §6.7 wrong automorphism control | z↦−1/z | Sends source∞ to0, not∞ | Escape condition excludes it | Retain |
| §6.7 provider applicability | quadrant; half-strip | Both have points of arbitrarily large norm; IsBounded=false | Native provider inapplicable | R02 |

**Seeded source sample (15/15 assessed).** There is no locator explicitly flagged “unverified” in the README. I did not interpret that silence as certification. All ten bibliography works were attempted through the sources service, reusing the source keys from the existing scratch records; no source text was copied into the worktree. Source extracts below use their line numbers, and printed page numbers are distinguished from PDF page numbers.

| Seeded target | Source text and exact location inspected | Outcome |
|---|---|---|
| 2.1 Cayley comparison | ahlfors-invariants lines 270–326, Ch. 1 §1-1, pp. 1–3 | Supports the doubled disc line element, half-plane line element and orthogonal geodesics. The roadmap correctly compares that normalization with Tau Ceti's half-sized disc distance. The displayed two-point identity was independently computed above. |
| 3.1 Riemann-map packaging | Conway VII.4.2: source service returned uncertified; native `RiemannMapping/Existence.lean:96`, `Biholomorph.lean:122–175` inspected | Native theorem and packaging verified; Conway's exact numbering/page not certified. R06 records duplication and composition direction. |
| 4.1 straightening analytic arcs | ahlfors-complex lines 8755–8785, Ch. 6 §1.4, pp. 234–235 | Real power-series complexification and local inverse are there. The cited Ch. 4 §6.5 is the wrong place for this construction. The exact chart/side adapter is extra work, not a verbatim theorem from that section. |
| 4.2 analytic-arc reflection | ahlfors-complex lines 6558–6595, Ch. 4 §6.5, Theorem 24, pp. 172–173; lines 8755–8785 for analytic arcs | Real-axis reflection is supported. Composing source/target charts gives the proposed adapter; its hypotheses match the pinned charted theorem. Conway IX.1.1 remains uncertified. |
| 4.3 rectifiable-arc removability | Besicovitch: DOI and publisher issue attempts returned HTTP 403; public publisher metadata inspected | Article text unavailable. Bibliographic range is 1–9, not 115–128. The independent finite-length/Morera estimate is consistent, but the source's exact hypotheses and theorem locator are not certified. |
| 5.1 chosen-map closed-disc homeomorphism | Pommerenke, stated Thm 2.6: service returned uncertified; native extension and injectivity declarations inspected | Mathematical interface verified against the pin. I do not certify that Thm 2.6 is the Carathéodory theorem or that its numbering is correct without the text. |
| 5.3 Jordan curve theorem | thomassen lines 291–304, Theorem 2.12, printed p. 122 | Exactly two complementary regions and both frontiers are the curve; no regularity assumption. Boundedness/filled-hull identification are standard additional planar deductions, supported by the native hull API. |
| 5.4 continuous loop index | Burckel Ch. IV: service returned uncertified; native argument-lift statement at `Argument/Lift.lean:422` inspected | Source locator not certified. Native lift does cover merely continuous curves; integrality, choice independence and API are owned targets. The simple definition is statable (R05). |
| 5.8 Darboux | Burckel Ch. IX: service returned uncertified | No exact theorem/page verified. The stated route uses the continuous argument principle and sign theorem without demanding boundary differentiability; the calculations above are consistent. |
| 5.9 Jordan-contour argument principle | No claim-level book locator; native `Argument/Cycle.lean:110` inspected | Native null-homology requirement is explicit; missing statement guards are R03. The source pointer still needs supplying (R08). |
| 5.10 analytic-boundary extension | No claim-level locator; relevant alternative is ahlfors-complex lines 8769–8785, Theorem 4, p. 235 | Source assumes a free one-sided regular analytic boundary arc. The roadmap explicitly plans to establish the exact real locus and one-sidedness, and to reflect the inverse too; it must cite this location rather than treat one-sidedness as supplied by straightening alone. |
| 6.3 source infinity at finite vertex | driscoll-trefethen lines 350–363, Theorem 2.1, equation (2.2), p. 10; angle convention/equation (2.1), lines 308–329, p. 9 | The theorem omits the factor of the vertex receiving infinity. Combined with full sum −2, finite sum is `−2−e_k`. The excerpt stops during the proof, so it does not certify the proof's later details, tail estimates or stabilizer argument. Ahlfors Ch. 6 §2.2, p. 238, lines 8894–8906 independently confirms the finite-endpoint form. |
| 6.5 sector ends | No precise external locator. driscoll-trefethen lines 315–346, pp. 9–10 describe infinity angles; native `Infinity/Power.lean:224` inspected | Angle convention is consistent with infinity exponent `−β−1`, hence finite sum `β−1`. The complete geometry theorem is not verified from this excerpt. The power-limit target is already native (R06). |
| 6.6 half-strip ends | No precise external locator. driscoll-trefethen p. 10 includes angle zero at infinity; native `Infinity/Logarithmic.lean:152` inspected | Logarithmic limit verified at the pin, including approach filter and basepoint-dependent constant. The full book's half-strip existence/necessity proof was not available in the excerpt. |
| 6.7 source normalization | No precise external locator; `PrevertexUniqueness.lean:74` inspected | Conclusion passes the explicit stabilizer examples, but the proposed supplier is bounded-only (R02). No external source location for this extension was verified. |

The readable source copies were the institutional [Ahlfors Complex Analysis scan](https://mccuan.math.gatech.edu/courses/6321/lars-ahlfors-complex-analysis-third-edition-mcgraw-hill-science_engineering_math-1979.pdf), institutional [Ahlfors Conformal Invariants text](https://www.math.stonybrook.edu/~bishop/classes/math638.F20/Ahlfors-Conformal-Invariants.pdf), institutional [Thomassen scan](https://people.math.wisc.edu/~dymarz/751/thomass.pdf), and [Cambridge's authorized Driscoll–Trefethen excerpt](https://assets.cambridge.org/97805218/07265/excerpt/9780521807265_excerpt.pdf). The service recognized Thomassen's image-only scan by OCR. I used text locations, not guessed theorem numbering.

## Not verifiable

- **conway:** the service classified the Springer citation as uncertified/paywalled. VII.4.2 and IX.1.1 in the sample, and IV.7.6, V.3.4, VII.2.6 and VII.2.9 elsewhere, were not checked against the book. The native contracts and mathematical instances were checked independently.
- **pommerenke:** the service classified the Springer citation as uncertified/paywalled. The exact Thm 2.6 locator remains unverified; native Carathéodory results do not certify a book's numbering.
- **burckel:** the service classified the Springer/Birkhäuser citation as uncertified/paywalled. Chapters IV and IX alone do not identify the particular continuous-index and Darboux statements; their source hypotheses were not certified.
- **remmert:** the service classified the Springer citation as uncertified/paywalled. Ch. 7's claimed Montel/Vitali coverage was not verified from text.
- **besicovitch:** the DOI/publisher and Oxford issue-page fetches returned HTTP 403. Search-visible publisher metadata settles title/pagination, but not the finite-length theorem or proof. The existing missing-source key is retained with these attempts; no alternate key was invented.
- **driscoll-trefethen:** the publisher excerpt contains printed pp. 1–10, including the source-infinity theorem statement. The rest of Ch. 2, its complete proof, and detailed sector/half-strip/uniqueness locators were not available. This is a partial-text limit, not a reason to infer missing hypotheses from memory.
- **paulson:** the named AFP entry URL returned 404. The institutional Isabelle distribution's `HOL-Complex_Analysis/Riemann_Mapping` theory was legally read instead: paulson lines 1373–1378 state the Riemann mapping theorem with explicit empty and whole-plane alternatives. This supports formalizability only; it does not verify the README's precise AFP attribution or any code-port compatibility claim.
- **Open work outside the supplied checkouts:** ownership against such pull requests was not checked. Broad index hits from them were not treated as authoritative ownership findings.
- **ModularForms scope attribution:** main's Layer 10 specifies modular curves and dimension formulas. The claimed λ-function/Picard ownership was not located there. This roadmap uses neither assertion as a prerequisite; a precise scope citation should replace the broad attribution.

The inaccessible books are not asserted to support or contradict the roadmap. The review is complete with the above access limits; no human permission or source response is required to record this needs-changes verdict. No source manifest was edited, and no PR, issue or comment was posted.

## Source issues

- none
