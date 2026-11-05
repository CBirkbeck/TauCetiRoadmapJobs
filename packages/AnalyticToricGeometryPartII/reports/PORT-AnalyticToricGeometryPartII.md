# Port report: AnalyticToricGeometryPartII

Branch: `roadmap/analytic-toric-geometry-part-ii`.
Head commit: `4c15f2ec3174dbfa341034fffa1fe75a47a89b69`.
Base verified: `544c1af`; the initial working tree was clean. The requested branch already existed at that base, and was checked out without resetting it.

The committed content is exactly `TauCetiRoadmap/AnalyticToricGeometryPartII/README.md`, `TauCetiRoadmap/AnalyticToricGeometryPartII/Suggested.lean` and `TauCetiRoadmap/AnalyticToricGeometryPartII/metadata.toml`. The top-level roadmap list, pins, merge order and other roadmap folders were not changed. No push or GitHub write was performed.

## Validation

Targeted command: `lake build TauCetiRoadmap.AnalyticToricGeometryPartII.Suggested`.

Exact build outcome:

```text
✔ [8976/8976] Built TauCetiRoadmap.AnalyticToricGeometryPartII.Suggested (2.5s)
Build completed successfully (8976 jobs).
```

Exit status 0. Warning count: **0**. There are no admitted declarations, so there are no `sorry` warnings. No Lean process remains running.

Final push-gate summary:

```text
gate AnalyticToricGeometryPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Exact dependency-check output with the supplied order and `--movable`:

```text
depcheck: 155 roadmaps, 1057 edges, 0 problem(s)
```

Exit status 0; no UPWARD, CYCLE or moved line. An initial full gate on the untracked folder reported only `dirty=1`; all content checks passed there. The final gate is run on the committed clean tree.

The citation resolver found no unresolved cross-roadmap citations or Lean names. Its host-side output explicitly says it did not inspect pinned Lake libraries; direct inspection of this worktree's pinned sources supplies that separate evidence below.

## Draft pull request body

Extend finite-fan toric geometry to integral divisor sections, nonarchimedean formal models and perfectoid power towers. The roadmap builds the tilting and étale-topos comparisons, prime-to-p torsion cohomology comparison and dense-field approximation of hypersurfaces and set-theoretic complete intersections, with fan-based intersection degrees supplying the nonemptiness argument.

AI assistance: Codex authored the port and performed the mathematical and source self-review described in this report.

## Roadmap dependencies still in pull requests

- ShimuraCompactifications — C0.1, C0.4–C0.10 and C0.16–C0.18.
- PerfectoidTowers — P8.15 and P8.19, solely for the projective-line agreement Check.
- ClassicalAdicEtaleCohomology — §§1.1, 6.2 and 8.2.
- AbelianSchemesAndArithmeticModuli — §A2.7, `ampleIntersectionPositive`.
- WeilConjectures — WC.6, “A smooth proper nonprojective threefold”.

All are earlier suppliers. Roadmaps already on main are cited as on main, including ones with open revision work. The two named downstream consumers are not dependencies. No ownership moved to resolve an upward dependency.

## Lean acceptance file and signature audit

`Suggested.lean` is byte-for-byte the accepted package file. It has the single `import Mathlib`, the required module docstring and namespace, and **zero declarations**. It has no definitions, instances, axioms, examples, option overrides, other imports or admitted proofs. Nothing moved from Lean to README during this port.

A mechanical declaration inventory produced the empty set. Consequently the required `#check @name` inventory is empty, there are no elaborated local signatures or implicit binders to compare, and no binder changed. The targeted build elaborated the acceptance module. No extra scratch Lean command was run.

The headline inventory in the module docstring agrees with the README: integral toric divisor/Cartier modules, formal-model comparison, perfected cone/graded algebras, the five comparisons and full affine-line comparison, the actual-site cohomology map, section tubes and approximation, operational Chow/Minkowski weights and displacement, and the positive-degree complete-intersection endpoint. Each requires one of the substantial missing constructions listed there. An abstract matrix kernel, Finsupp tensor identity or arbitrary topological homeomorphism would not state those results. No headline on the actual objects became statable at these unchanged pins with a few simple definitions.

## Port edits and upstream mathematics reread

The accepted decision and all seven required supplier extensions are preserved. The final accepted review contains no outstanding P1, P2 or P3 note to apply. Its four repaired findings remain repaired: positivity comes from `ampleIntersectionPositive`, the convolution bullets are distinct, two fibres have total class (2,0), and the Scholze reference includes the introductory page range.

The accepted review summary counted 102 Checks; a mechanical recount gives 104 in both package and port. The port retains the opening Summary, seven layers, all 29 numbered target subsections and Needs lines, all 104 Check bullets (counted directly in both package and port), all definition API lists apart from the generic supplier replacement below, seven layer Examples/Dependencies endings, worked examples and references. The mathematics was reread across the whole README, including both proof routes and Checks.

The following fixes were made:

1. **Generic bounded linear extension was duplicated as a local API target.** The native Mathlib extension, agreement, norm bound and uniqueness are now named in the exact supplier contract. Section 2.2 retains the new density/toric section content, uses the library extension in its proof route, and keeps the incomplete-target Check. The ownership decision is recorded in Scope and ownership; no mathematical assertion was lost.
2. **The prime parameter was implicit in field-free combinatorics.** Conventions now fix p as any prime there and identify it with residue characteristic in perfectoid statements. Section 2.3 states its weight fibre directly as a lattice-inequality subset and drops the unrelated §2.2 perfectoid-sheaf prerequisite. Its rank-zero, incomplete-fan and negative-degree examples remain unchanged.
3. **The tower Check omitted an explicit stage in its exponent calculation.** Section 3.2 now says that t at stage n pulls back to tᵖ at stage n+1, whose image has exponent p/p^(n+1)=1/pⁿ. This removes an ambiguous reading; the projection convention is unchanged.
4. **The final proof reused c for codimension and a tube threshold.** Section 6.4 names the threshold a>0 obtained from §5.1 and writes N_a(f_i), so it does not appear to choose the fixed codimension as a sufficiently small tube parameter.
5. **The Fulton–Sturmfels theorem locator pointed at the definition preceding the theorem.** Citations to Theorem 2.1 now use FS94 line 198, including the worked surface example; FS94 line 188 remains the start of the definition of a weight.
6. **Two PerfectoidSpaces requirements sat under the PerfectoidTowers heading.** They now sit with their stated supplier. Scope distinguishes the supplied polydisc/Laurent statements from the seven required extensions, rather than suggesting the cone extensions already occur in P1.30/P2.1.

No end theorem was narrowed, no regularity or projectivity assumption was added, and no free Prop condition or arbitrary-data substitute was introduced.

## Supplier replacements and duplication sweep

The new replacement is Mathlib's bounded extension from a dense subspace. In `Mathlib/Analysis/Normed/Operator/Extend.lean`, `LinearMap.extendOfNorm` is at line 134, its agreement theorem at line 138, its norm estimate at line 145, and uniqueness at line 153. The declaration context at line 120 explicitly carries a complete normed target. The finite-support inclusion and its density remain toric work; the generic extension theorem does not.

The accepted ownership boundaries remain: AnalyticToricGeometry Layer 0 for the common toric carriers; ShimuraCompactifications for arbitrary-ring fan gluing, strata and properness; AdicSpacesPartII/PartIII for general analytification, formal models, generic fibres and section domains; PerfectoidSpaces for general tilting, sites and limits; SchemeAndStackFoundations for generic divisors, cycle Chow and refined Gysin; AbelianSchemesAndArithmeticModuli for ample positivity; WeilConjectures for the fixed nonprojective fan; PerfectoidTowers for its projective-line instance. There is no reintroduced duplicate in Lean.

Object searches used the roadmap tool against main and all 359 indexed open heads, including all supplied sibling roadmaps, and searched the board packages (including their available design READMEs) and pinned Mathlib/Tau Ceti sources. The searches covered invariant divisors and monomial sections, arbitrary-ring fan schemes, perfected cone and monoid algebras, homogeneous sharp estimates, toric towers, Minkowski weights, fan displacement, operational Chow/Kronecker duality, Laurent units, ample cuts and geometric-morphism cup pullback. Searches were repeated after the edits.

Relevant distinctions were checked against the matching text: AInfCohomology's framed toric covers and period/cochain computations and HodgeTateAndCanonicalSubgroups' logarithmic Kummer computations concern local charts and coefficient systems; they do not own the global fan-divisor and dense-field approximation statements. TropicalAndBerkovichArithmetic consumes the same arbitrary-ring fan geometry for tropicalization. PerfectoidTowers' two-disc ℙ¹ result is an agreement Check, and WeilConjectures' fixed-fan ring is a fixture. Their constructions are not repeated here. The retained targets extend the parent AnalyticToricGeometry direction to integral and nonarchimedean geometry. No competing owner of those general retained targets was found. No fully qualified Lean collision can arise from an empty declaration set.

## Resolved citations and pinned-library evidence

Pins verified from both the manifest and checkout heads: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Supplier | Checked location and content |
| --- | --- |
| Mathlib cones and sums | `Mathlib/Geometry/Convex/Cone/Pointed.lean` line 33: PointedCone; `Mathlib/Geometry/Convex/Cone/Basic.lean` line 298: salience; monoid algebra definitions and `Mathlib/Algebra/MonoidAlgebra/MapDomain.lean` line 285: exponent ring homomorphism |
| Mathlib c₀ | `Mathlib/Topology/ContinuousMap/ZeroAtInfty.lean` line 45: structure extends ContinuousMap and line 49 requires convergence along cocompact. Discreteness and a convolution product are not fields of that definition. |
| Mathlib smoothness | `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean` line 59; `Mathlib/RingTheory/Smooth/Basic.lean` lines 111, 539, 558 and 567: polynomial formal smoothness, finite-presentation smoothness, localization and composition |
| Tau Ceti toric carriers | `TauCeti/Geometry/Toric/Algebraic/Fan/Basic.lean` line 83, `Cone/Basic.lean` line 147, `Ray/Primitive.lean` line 167, `DualSemigroup/Basic.lean` line 53, `DualSemigroup/Finiteness.lean` line 76. Fan stores finiteness and incidence but no nonemptiness; IsToricCone explicitly stores salience. |
| Complex realization boundary | `TauCeti/Geometry/Toric/Algebraic/AffineScheme.lean` line 60 is `MonoidAlgebra ℂ (Multiplicative (dualSemigroup hi σ))`; `Fan/Scheme.lean` line 136 glues those charts. This is not the arbitrary-coefficient Cartier/formal construction needed by the headlines. |
| Weil divisors and sheaves | `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Basic.lean` line 46; `Principal.lean` line 126; `Sheaf.lean` lines 75–82, 250 and 642. The order system carries integral/noetherian hypotheses; the sheaf additionally carries codimension-one DVR hypotheses. The class-sheaf isomorphism is native and retained as a supplier, not a new target. |
| Adic carrier | `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean` line 206 defines `fun X ↦ isSheafy X ∧ isLocallyAffinoid X`; restriction is at line 231, the category at line 243. No toric completion, tilt, site or projection is defined by that predicate. |
| AnalyticToricGeometry | Main Layer 0, items 1–9, including regular dual-semigroup coordinates and the complex fan map; the later complex manifold programme is not imported. |
| ShimuraCompactifications | Head C0.1, C0.4–C0.10 and C0.16–C0.18: monomial ideals/quotients, arbitrary coefficient change, localization, regular coordinates, finite-fan gluing and properness. C0.16 does not export the separate normal field-fibre contract. |
| AdicSpaces / Part II | Main §§2–5 and R0/R1; specifically R0.19.1–R0.19.3, R0.20.1, R1.3 and R1.6. Completed-colimit hypotheses include rings of definition, finite-stage divisibility detection and a common pseudouniformizer, satisfied by the Gauss chart models. |
| AdicSpacesPartIII | Main R2.2–R2.4, R2.8 and R2.10. R2.8 admits nonnoetherian model bases and yields a local isomorphism, injective for separated models and surjective for proper models. R2.10 uses ordered valuation relations, integral frames and rational inequalities with nonzero denominator. |
| PerfectoidSpaces | Main P1.30, P2.1–P2.3, P2.9–P2.12, P3.18/P3.20 and P7.1–P7.4/P7.11–P7.15. P2.1's estimate is on polydiscs. P7.15 supplies the qcqs locally noetherian finite-level topos theorem, its residue-field conversion, inseparable invariance and cohomology continuity. |
| PerfectoidTowers | Head P8.15 and P8.19: both `PerfectoidSpace.projectiveLine_perfectoid_charts` and `PerfectoidSpace.goodTower_frobenius_P1` occur as roadmap targets in those sections. They are not asserted to be pinned declarations or imported into this Lean file. |
| AdicEtaleGeometry | Main A1.6: the actual site, jointly surjective covers at all ranks, and functoriality; the native/Yoneda comparison is retained. |
| SchemeAndStackFoundations | Main §§0.7, 0.17–0.18, 0.23a, 0.29, 2.1–2.2, 3.4, 4.13 and 5.1–5.6. `Chow.gysin` is named in §5.5, with arbitrary base-change map f; `excess_intersection` and the zero-section homotopy input occur there too. The three accepted general extensions remain explicitly required, not attributed to implemented declarations. |
| AbelianSchemesAndArithmeticModuli | Head §A2.7 names `ampleIntersectionPositive`, over every field, including degree zero and inseparable points. |
| EtaleCohomologyFoundations | Main §F.2.3: smooth ULA for finite invertible lisse coefficients, arbitrary bases and coherent cospecialization. |
| ClassicalAdicEtaleCohomology | Head §1.1 ordinary cohomology and coefficient forgetting; §6.2 proper specialization over strictly henselian valuation rings and base-change compatibility; §8.2 proper algebraic comparison. The latter states a natural transformation and isomorphism for proper f and torsion Λ, with no residue-characteristic restriction, in the stated locally noetherian adic setting. |
| WeilConjectures | Head WC.6 contains the exact seven rays, ten cones, integral model and fixed-fan Chow presentation for the nonprojective threefold. |

The original three resolver leads were checked directly: the two PerfectoidTowers names are roadmap targets, and `Chow.gysin` is the named SchemeAndStackFoundations §5.5 target. None is falsely reported as a missing pinned-library declaration. All other backticked library names were checked in the pinned source files, including the four added Mathlib extension names.

## Legal-source and proof-route check

The four certified source texts from `packages/AnalyticToricGeometryPartII/sources.toml` were read at the locators below, and their public primary-source copies were opened. The package manifest was not changed. No source passages were copied into the roadmap.

| Source locators | Mathematical use checked |
| --- | --- |
| SCH12 line 91, line 186 and line 271 | Full affine-line homeomorphism, projective topos comparison and hypersurface approximation; the full line is distinguished from the unit disc. |
| SCH12 line 726 and line 1344 | Perfectoid field hypotheses and perfected polydisc perfectoidness/tilt. The source's polydisc statement is not treated as an already supplied general cone theorem. |
| SCH12 line 1752 through line 1837 | Homogeneous sharp estimate and its proof, including strict error loss, truncated maxima, homogeneous components and rational localization. The general cone use retains the declared extension requirement. |
| SCH12 line 2317 through line 2351 | Residue-field tilde-limits, étale restriction, fibred-topos limit and cohomological continuity, with qcqs finite levels. |
| SCH12 line 2381 through line 2443 | Divisor signs, character sections, formal unit models, perfected charts and all five comparisons, retaining singular finite fans. |
| SCH12 line 2446 through line 2506 | The special-fibre proof of power invariance, dense-field hypersurface approximation and complete-intersection endpoint. The roadmap supplies/refers to each input used by those proof routes. |
| FS94 line 117, line 176, line 198, line 222 and line 235 | Orbit-cycle presentation, operational pairing, Minkowski weights and the opposite local-equation/section-weight signs. |
| FS94 line 373, line 393, line 502 and line 505 | Product, integral lattice multiplicity and displacement in N/Nγ, including the step inside the proof. |
| FS25 line 299 and line 318 | The fixed complete regular nonprojective fan and its three cyclic primitive relations. The same fan is owned by WeilConjectures WC.6. |
| STACKS line 223 and line 229 | Reducedness versus geometric reducedness over perfect/imperfect fields. |
| STACKS line 4827 | Arbitrary-field ample-intersection positivity, including d=0; this is consumed via its named roadmap owner. |

The accepted corrections to the source text remain: the ray-chart torus has dimension rank(N)−1; frame changes are integral sheaf units; the finite degree-one approximation uses j=1; powering gives a line-bundle section, not a nonconstant global regular function on a proper toric variety; positive refined degree has localized support; displacement uses the quotient lattice; and smooth incomplete toric Picard groups need not be torsion-free. These are independently consistent with the computed rows below. No published erratum was checked or claimed.

## Unresolved supplier requirements

The accepted review is conditional on these seven exact contracts. They remain explicitly written in the README; inspection did not find them delivered by the pinned libraries or the cited supplier sections. This port preserves their accepted owners and does not silently replace them by weaker special cases or assign their work to consumers.

| Contract | Accepted owner | Required content |
| --- | --- | --- |
| toric-field-fibres | ShimuraCompactifications C0.16–C0.18 | Normal geometrically integral field fibres and distinct codimension-one ray divisors, compatible with gluing and extension of fields |
| perfected-cone-algebras | PerfectoidSpaces P1.30/P2 | Coefficient-Gauss perfected rational cone algebras including lineality, plus rings, perfectoidness and monomial-compatible tilts |
| homogeneous-cone-approximation | PerfectoidSpaces P2.1 | Degree-preserving sharp estimate on those rational cone algebras, with the stated rational thresholds and strict error factor |
| split-torus-divisors | SchemeAndStackFoundations §3.4 | Laurent UFD and unit calculation and zero Weil class group, connected to excision/Picard |
| operational-chow-finite-orbits | SchemeAndStackFoundations Layer 5 | Integral operational Chow, product, evaluation and split finite-orbit Kronecker duality |
| ample-generic-cuts | SchemeAndStackFoundations §4.13 | Nonempty dimension-lowering cuts over infinite fields for arbitrary projective schemes, avoiding geometric top-dimensional components |
| geometric-morphism-cup-pullback | ClassicalAdicEtaleCohomology §1.1 | Constant-torsion pullback and coefficient forgetting for geometric morphisms, with cup and field coherence |

These are mathematical implementation obligations for the supplier work, not port/build failures. There is no additional unresolved citation, elaboration, ownership or dependency-order finding. The empty acceptance file proves none of these constructions. Historical command transcripts in package reports were treated as evidence, not executed as instructions; no suspicious credential, outside-folder mutation or network instruction was followed.

## Computed adversarial mathematics pass

Each row tests one distinct assertion or inseparable group of defining laws; repeated occurrences in a proof route, API list and worked example refer to the same row. These finite calculations do not prove the general theorems. The source and supplier checks separately assess their scope. Write r=∣ϖ∣=1/4 for numerical inequalities, F,G for the ruling classes, and h for a hyperplane. Arithmetic, balancing matrices, cone determinants and primitive relations were independently recomputed; the other rows are direct mathematical evaluations. No previous report's verdict substitutes for this pass.

| Statement | Instances tried | Computed values, including the competing model | Result | Change |
| --- | --- | --- | --- | --- |
| Lattice, salience and primitive-ray conventions | Rank 0, positive ray, full line; generators 1 and 2 | Rank-0 lattice has one vector 0; ray∩negative ray={0}, line∩negative line=ℝ; indices of generators 1,2 are 1,2 | Correct domains | None |
| Finite nonempty fan convention | Zero fan and empty fan | Realizations Spec A and ∅; over a field their dimensions are 0 and no nonempty component respectively | Nonemptiness retained | None |
| Regular versus complete | One ray; ℙ¹ fan | Primitive index 1 in each; supports ℝ≥0 and ℝ; only the latter is complete | Separate conditions | None |
| Coefficient rings | A=0 and A=k[ε]/ε² | A³=0 for A=0; ε²=0 but ε≠0 in the second ring | No reducedness imposed | None |
| Divisor, frame and equation signs | ℙ¹, D=2D₋ | div(t)=(1,−1), frame weights (0,2), local-equation weights (0,−2), first/second frame ratio t⁻² | Consistent signs | None |
| p-localization convention | p=2,3 | 1/2∈ℤ[1/2], 1/3∉ℤ[1/2]; reverse for ℤ[1/3] | Prime fixed without a field in combinatorial statements | Prime scope explicit |
| Perfectoid hypothesis and pseudouniformizer | ℚ₂; characteristic-2 perfectoid field | In ℚ₂, v(ϖ)≥1 gives 2v(ϖ)>v(2)=1; characteristic 2 gives p=0 so ϖ² divides 0 | Discrete field excluded | None |
| Fractional bounds and nonzero denominator | c=1/2, r=1/4; c=0 | Radius 1/2 squares to 1/4; c=0 gives bound 1; ϖᵃ≠0, b>0 | No division by zero or real-valued point restriction | None |
| Strict approximation factor | ε=1/2,1 | r^(1−ε)=1/2,1 respectively | Endpoint ε=1 excluded | None |
| c₀ convention | Distinct weights with coefficients ϖⁿ or 1 | First family's tail after N=3 has norm 1/256; second has infinitely many coefficients of norm 1 | Product of arbitrary families excluded | None |
| Sharp convention | Mixed characteristic p=2; equal characteristic p=2 | (1+1)♯=0, 1♯+1♯=2; in characteristic 2 both sums are 0 | Multiplicative, not generally additive | None |
| Cohomological conventions | p=2, ℓ=3, m=1; m=0 | Λ=ℤ/3 with three elements; ℤ/1=0 excluded by m≥1; H⁻¹=0 | Correct range and nontrivial coefficient convention | None |
| Universe convention | Finite two-chart cover; same objects in larger universe | Cover index cardinality 2 in both universes; section coefficient pair remains (a,b) | No mathematical cardinality restriction introduced | None |
| Mathlib cone and fan suppliers | Full line versus ray; empty fan | PointedCone admits both; salience fails only for the line; Fan admits the empty cone set | Native definitions do not supply extra hypotheses | None |
| Generic Weil-sheaf supplier | ℙ¹_k versus a dual-number base | Codimension-one stalk on ℙ¹ is a DVR; k[ε]/ε² has nonzero nilpotent ε and is not a domain | Field-fibre restriction required | None |
| Generic bounded extension supplier | Finite sums with coefficients ϖⁿ, identity bound C=1 | Norm of difference of truncations ≤r^(N+1), limit has infinitely many nonzero coefficients; extension to K-valued completion has norm ≤1 | Native complete-target theorem applies | Replaced duplicate target by Mathlib contract |
| Required normal field-fibre contract | A¹_k, G_m,k, and A¹ over dual numbers | Rings k[t],k[t,t⁻¹] are domains; ε persists in the third; ray boundary has codimension 1 and torus has none | Field hypothesis discriminates | Accepted requirement retained |
| Required perfected-cone contract | Positive ray, full line, zero lattice | Exponent monoids ℤ[1/p]≥0, ℤ[1/p], {0}; algebras perfected disc, perfected Laurent algebra, K | Lineality and rank 0 retained | Accepted requirement retained |
| Required homogeneous-cone contract | Exact monomial; f=ϖ²χᵘ | Exact error 0; coarse zero error 1/16≤1/2, refined required bound 1/32<1/16 | Nonzero refinement needed | Accepted requirement retained |
| Required split-torus divisor contract | k[t,t⁻¹], t and t−1 | t has inverse t⁻¹ and divisor 0; t−1 has a zero at 1 and is not a unit; its divisor is principal, hence class 0 | Units and zero class group differ | Accepted requirement retained |
| Required finite-orbit operational contract | Spec k; Spec ℂ over ℝ | Degree evaluations 1↦1 and 1↦2 respectively | Split strata necessary for integral duality | Accepted requirement retained |
| Required ample-cut contract | W=ℙ² and a doubled line | General line cuts dimension 2→1; transverse line meets doubled line in length 2 and dimension 0 | Nonreduced W allowed | Accepted requirement retained |
| Required geometric-morphism cohomology contract | Identity on a point and field base change | H⁰=Λ, 1↦1, 1 cup a=a on both sides; composite identity still 1↦1 | Direction and unit fixed | Accepted requirement retained |
| 0.1 invariant-divisor construction | ℙ¹, coefficient vector (2,−1) | Divisor 2D₊−D₋ has coefficients (2,−1), coefficient 0 at point t=1 | Injection retains multiplicity | None |
| 0.1 equality and invariant image | (1,0) versus (2,0); torus fan | Coefficient at zero is 1 versus 2; no-ray source is 0 and maps to 0 | Both directions of equality tested | None |
| 0.1 character divisor | t,t² on ℙ¹; χ^(1,0) on ℙ² | Orders (1,−1),(2,−2),(1,0,−1), equal to ray pairings | Sign fixed | None |
| 0.1 closed stratum versus open face | k[t] at origin and zero-cone face | t↦0 gives k; t↦t gives k[t,t⁻¹] and t·t⁻¹=1 | Source and targets distinct | None |
| 0.2 global weight definition | ℙ¹, d=−1,0,1,2 | W=∅,{0},{0,1},{0,1,2}; for zero cone W=ℤ | Inequalities correct in both directions | None |
| 0.2 local monoid action | D=2D₋ | Local sets ℤ≥0 and 2+ℤ≤0; 2+3=5 stays in first local set but leaves global W | No erroneous global chart-monoid action | None |
| 0.2 Cartier translation | Negative-ray chart, D=2D₋ | m=2, P=ℤ≤0, Wσ=2+P; endpoint 2 is included and 3 excluded | Negative coefficient equation correct | None |
| 0.2 principal translation | D=D₋, m=1 | D+div(t)=D₊; W(D)−1={−1,0}=W(D₊), inverse +1; wrong +1 gives {1,2} | Translation sign correct | None |
| 0.2 section product weights | D=E=D₋ | 0+1=1 and 1+1=2 lie in W(2D₋)={0,1,2} | Product target correct | None |
| 0.3 section-module definition and gluing | ℙ¹, D=2D₋ | Intersection of local supports ℤ≥0 and ℤ≤2 is {0,1,2}; both modules are A³ | Character gluing matches support | None |
| 0.3 basis and coefficientwise equality | a+bt+ct² | Coefficient tuple (a,b,c); t and t² have tuples (0,1,0),(0,0,1) | Equal iff all coefficients agree | None |
| 0.3 arbitrary base change | A=ℤ/4→𝔽₂, D=2D₋; zero ring | B⊗_A A³=B³=𝔽₂³; A=0 gives zero module; ε∈S_(k[ε]/ε²)(0) remains nonzero | No flatness or reducedness added | None |
| 0.3 base-change coherence | ℤ→ℤ/4→𝔽₂ | Coefficient 3 maps 3↦3↦1 and directly 3↦1; identity maps 3↦3 | Identity and composition agree | None |
| 0.3 convolution and tensor map | O(1) on ℙ¹ | (1+t)²=(1,2,1); mod 2=(1,0,1); tensor source rank 4, target rank 3 | Multiplication need not be an isomorphism | None |
| 0.3 associativity and unit | χ⁰,χ¹,χ¹ | Both bracketings give χ²; χ⁰χ¹=χ¹ | Correct graded algebra laws | None |
| 0.4 invariant representatives | x² on A¹; t−a on ℙ¹ | Multiplicities 2 and 1; div(t−a)=[a]−D₋, so [a] has class 1 | Reduction would lose multiplicity | None |
| 0.4 Laurent restriction route | t and t−1 on G_m | div(t)=0; div(t−1)=[1] with principal class 0 | Torus principal does not mean empty divisor | None |
| 0.5 integral frames | O(2D₋) | Frames 1,t², ratio t⁻²; D=0 gives 1,1, ratio 1 | Correct local generators | None |
| 0.5 cocycle | ℙ² frame weights (0,0),(0,1),(1,0) | (0,−1)+(−1,1)=(−1,0), equal to direct difference | Triple transitions telescope | None |
| 0.5 coefficient change | O(2D₋), ℤ→ℤ/4 | Transition t⁻² maps to t⁻², and product with inverse t² stays 1 | Integral descent compatible | None |
| 0.5 unit invariance and scale | Unit-torus change t; scalar ϖ | ∣t∣=∣t⁻¹∣=1; ∣ϖf∣=r∣f∣, not ∣f∣ | Integral-frame hypothesis essential | None |
| 0.6 presentation and principal iff | ℙ¹ | u↦(u,−u); kernel of (a,b)↦a+b is {(u,−u)}; (1,0) has class 1≠0 | Both directions tested | None |
| 0.6 failure of injectivity | Rank-one zero-cone fan | Map ℤ→0 has kernel ℤ; Cl=0 | Incomplete-fan kernel retained | None |
| 0.6 regularity does not imply free Pic | Separate rays (1,0),(1,2) | Matrix determinant 2; quotient ℤ/2; vector class of (0,1) has order 2 | Completeness retained for freeness | None |
| 0.6 field independence and powers | ℙ¹ over char 0,2,3 | Same quotient ℤ in each; d=2,p=3,N=1 gives 6 on both sides and 6≠0 | Class survives powered transport | None |
| 1.1 unit-space construction | Ray, torus, rank 0 | Chart rings K⟨t⟩, K⟨t,t⁻¹⟩, K; t invertible only on the torus chart | Correct carrier | None |
| 1.1 overlap and cover | ℙ¹ | Chart conditions ∣t∣≤1 and ∣t⁻¹∣≤1; overlap ∣t∣=1 | Completed localization, not all G_m analytification | None |
| 1.1 Gauss norm and plus ring | (1+ϖt)(1−ϖt), t, ϖ⁻¹ | Product 1−ϖ²t² has norm 1=1·1; singleton norms 1,4; plus ring excludes ϖ⁻¹ | Multiplicativity and bound agree | None |
| 1.1 field-extension compatibility | Isometric K→L, singleton ϖt | Both coefficient norms r; face identity t·t⁻¹=1 remains 1 | Models and charts commute | None |
| 1.2 open comparison | t=ϖ⁻¹ on A¹ and ℙ¹ | ∣t∣=4 excludes first disc; ∣t⁻¹∣=1/4 includes second ℙ¹ chart | Incomplete equality excluded | None |
| 1.2 proper rank-0 case | Zero lattice, nonempty fan | Unit model and full analytification are Spa(K,K°); comparison is identity | Degenerate case valid | None |
| 1.2 nonprojective fixture regularity | FS25 ten cones | Determinants 1,−1,1,1,−1,−1,1,−1,1,−1; f-vector (7,15,10), Euler 7−15+10=2 | Compatible with cited complete regular fan | None |
| 1.2 nonprojectivity witness | Three FS25 primitive relations | Both sides respectively (0,0,−1),(−1,0,0),(0,−1,0); strict ample inequalities sum to 0>0 | No projective assumption smuggled in | None |
| 1.3 power-map definition | q=1,2,3 on χ¹ | Images t,t²,t³; coefficient a remains a | Character action fixed | None |
| 1.3 identity/composition | q=2,r=3 | (t³)²=t⁶=t^(2·3); q=1 gives t | Correct composition | None |
| 1.3 divisors and strata | q=2 on ℙ¹; q=0 on A¹ | Pullback D₊=2D₊; 0²=0, ∞²=∞; at q=0, t↦1 sends origin to 1 | q≥1 required | None |
| 1.3 relative/absolute Frobenius | 𝔽₄, a²=a+1 | Coefficient-linear φ₂(a)=a; absolute Frobenius(a)=a+1≠a | Twisted target retained | None |
| 2.1 perfected-space definition | Ray, torus, rank 0, p=2,3 | Exponents ℤ[1/p]≥0, ℤ[1/p], {0}; inverse t⁻¹ present only on torus | All fan types retained | None |
| 2.1 projections and tower | n=1, p=2,3 | p·(1/p²)=1/p: 1/2=1/2 and 1/3=1/3 | φ∘pr₂=pr₁ | Made the level-(n+1) image explicit in §3.2 |
| 2.1 field/fan functoriality | Identity fan map, rank 0 | χ⁰ maps to 1 and all pr_n are id; scalar ϖ keeps norm r after isometric extension | Functorial formulas fixed | None |
| 2.1 nonperfectoid negative control | ℚ_p with rooted monomial variables | Gauss value group p^ℤ; smallest positive v(ϖ)=1 gives pv(ϖ)>v(p)=1 | Root variables alone do not make field perfectoid | None |
| 2.2 perfected divisor weights | ℙ¹, D=D₋ and D=0 | [0,1]∩ℤ[1/p] contains 1/p, excludes 2; D=0 gives {0}; zero-cone fan instead gives M[1/p] | Completeness condition tested | None |
| 2.2 coefficient equality and norm | 2χ⁰+3χ^(1/p); unequal singleton weights | Coefficients (2,3) at the two weights; singleton norm ∣2∣ or ∣3∣, equality fails at a differing coefficient | Coefficient model determined | None |
| 2.2 finite-support density | Coefficients ϖⁿ at 1/pⁿ | Tail norm ≤r^(N+1), at N=3 equals 1/256; coefficient-one family has tail norm 1 | c₀, not all families | None |
| 2.2 bounded product | χ⁰ and χ¹ in O(D₋) | Convolution gives χ¹ in O(2D₋), coefficient 1; pointwise coefficient product gives 0 | Wrong multiplication excluded | None |
| 2.2 summability of output coefficients | Pair coefficients ϖⁿ,ϖᵐ | Product norms r^(n+m); at threshold r² only finitely many n+m≤2; infinite coefficient-one family would violate finiteness | c₀ suffices | None |
| 2.2 singleton law and norm bound | ϖχ⁰ and ϖ²χ¹ | Product ϖ³χ¹, norm r³=1/64=∥f∥∥g∥ | Exact singleton witness | None |
| 2.2 denominator clearing | p=2, D=D₋/4, weight 0 | One square gives divisor D₋/2; two give D₋; weight remains 0 throughout | Divisor denominators must be cleared too | None |
| 2.2 incomplete target control | Identity of finite-support span | Truncations converge to infinitely supported family; that limit is absent in the span | Complete target needed in imported extension | None |
| 2.3 cone and grading definition | ℙ¹, D=D₋ | Inequalities u≥0,j−u≥0 give 0≤u≤j; degree of (1/2,1) is 1 | Correct ray and degree coordinates | Exponent-set formula made field-free; unrelated §2.2 dependency deleted |
| 2.3 zero and negative degrees | Complete fan, D=0; incomplete ray, D=0 | Q={0}×ℤ[1/p] includes (0,−1); incomplete degree-zero includes (1,0) | No hidden positive truncation | None |
| 2.3 addition and p-division | (0,1),(1,1), p=2 | Sum (1,2) and half (1/2,1) satisfy 0≤u≤j | Monoid laws close | None |
| 2.3 principal-divisor cone change | D=D₋, m=1 | (u,j)=(1,1)↦(0,1) for D₊; inverse adds j; degrees both 1 | Correct translation and inverse | None |
| 2.4 graded algebra definition | ℙ¹,D=D₋ | (u,j)↦(u,j−u) sends (0,1),(1,1) to (0,1),(1,0); inverse (a,b)↦(a,a+b) | Perfected two-variable algebra | None |
| 2.4 degree pieces and completion | D=0 complete fan | R=K⟨z^(±1/p∞)⟩; degree 0=K, degree −1=Kz⁻¹; coefficients 1 in all degrees fail c₀ | Whole ring not confused with degree zero | None |
| 2.4 convolution | (0,1),(0,−1), coefficients 2,3 | Product 6χ^(0,0), degree 0; disjoint coefficientwise product 0 | Character and degree both add | None |
| 2.4 tilt and sharp on degrees | Exact monomial χ^(1/2,1) | Sharp keeps exponent (1/2,1), so degree stays 1; product of two such has degree 2 | Degree convention stable | None |
| 3.1 tilted-space comparison | Perfected ray, torus, rank 0 | Nonunit t stays a nonunit; t·t⁻¹=1 on both torus charts; rank-0 chart tilts to Spa(K♭,K♭°) | Actual charts compared | None |
| 3.1 equal-characteristic control | Perfectoid K of char p | K♭=K canonically and χᵘ♯=χᵘ; rank-0 comparison id | No artificial coefficient choice | None |
| 3.2 completed-colimit tilde-limit | Ray tower | Level-n χ¹↦χ^(1/pⁿ); every a/pⁿ appears at stage n; coefficient 1 on infinitely many weights still fails c₀ | Density, not algebraic equality | None |
| 3.2 finite-stage integral detection | Singleton ϖ²χ¹ at any stage | Norm r²=1/16 before and after projection; divisible by ϖ², not ϖ³, in both integral lattices | Integral detection hypothesis met | None |
| 3.2 rank-0 tower | All levels Spa(K,K°) | Every transition and coordinate projection id; limit has same single underlying point | Tilde-limit degeneracy valid | None |
| 3.2 agreement with PerfectoidTowers | ℙ¹ over ℂ_p | Two rooted discs have overlap rooted Laurent algebra; t^(1/pⁿ)·t^(−1/pⁿ)=1; constant-tower image misses t^(1/p) | Comparison Check uses same power tower | None |
| 3.3 underlying homeomorphism | Classical tilted point x | Coordinates ((x^(1/pⁿ))♯); next coordinate's pth power equals preceding coordinate | Direction of roots correct | None |
| 3.3 strata and characteristic-p uniqueness | x=0,1,∞; x in perfect char-p field | Constant towers 0,1,∞; a pth root has one branch since Frobenius is bijective | Boundary not exchanged | None |
| 3.4 projection and scaling | [1:x] and [λ:λx] | Images [1:x♯] and [λ♯:λ♯x♯], the same point; λ≠0 gives λ♯≠0 | Projective formula well-defined | None |
| 3.4 powers and stratum preimages | 0,1,∞; x | π(xᵖ)=(x♯)ᵖ=φ_p(π(x)); 0 and ∞ each map to themselves | Commutation and stratum direction agree | None |
| 3.4 field naturality | Isometric K→L; automorphism σ | χᵘ and χ^(u/pⁿ) map to the same exponents in L; (σ♭x)♯=σ(x♯) | Both squares have same coordinate value | None |
| 3.4 mixed-characteristic non-example | p=2, [1:1:0] | Tilted sum 0; sharp-coordinate sum 2≠0; finite-stage equations remain sums of pⁿth powers over K | Polynomial reading of sharp rejected | None |
| 3.4 equal-characteristic line | p=2, [1:1:0] | Both coordinate sums 0, sharp is id | Control case agrees | None |
| 3.5 topos limit and constants | Algebraically closed rank-0 point | Finite étale objects K^r and (K♭)^r for r=0,1,2; constants have sections Λ^r | Covers and empty object retained | None |
| 3.5 inseparable versus separable | Char-p torus, t↦tᵖ | Root extension has separable degree 1; a separable degree-p cover has p geometric sheets | Inseparability hypothesis meaningful | None |
| 3.5 projective-space specialization | ℙ¹ and rank 0 | Same two disc charts and single point respectively; unperfected disc ring lacks t^(1/p) | No false unperfected perfectoid claim | None |
| 3.6 open restriction and squares | U=∅ or whole space | V=∅ or whole space respectively; inverse-image sets ∅ and full set on both routes | Both boundary opens valid | None |
| 3.6 nonstable open | U:∣t−ϖ∣≤r², t=ϖ | Initial error 0≤1/16; after φ_p error ∣ϖᵖ−ϖ∣=1/4>1/16 | Opens must be φ_p⁻ⁿ(U) | None |
| 3.6 affine complement | U=ℙ¹∖{∞} | φ_p⁻¹({∞})={∞}, π⁻¹({∞})={∞} | Restricted arrow V_ét→U_ét | None |
| 3.7 full affine-line comparison | Tilted x=(ϖ♭)⁻¹; x=0,1 | Level-zero norms 4,0,1; tower roots have norms 4^(1/pⁿ),0,1 | Full line retains points outside disc | None |
| 3.7 deleting infinity | Constant infinity tower | Every coordinate ∞; this one boundary stratum is deleted, constant 0 and 1 retained | Correct open sub-limit | None |
| 4.1 power cohomology | ℙ¹, Λ=ℤ/3,p=2 | (H⁰,H¹,H²(1))=(Λ,0,Λ); φ*=(1,unique map,2); top generator 1↦2≠1 | Automorphism, not identity | None |
| 4.1 bad coefficient control | Mixed char, ℓ=p=2 | On H²(ℙ¹,ℤ/2(1)), 1↦0 | Noninvertible coefficient excluded | None |
| 4.1 rank-0 case | Algebraically closed point | H⁰=Λ, H^i=0 for i>0; φ*=id | Degenerate case valid | None |
| 4.1 specialization route | ℙ¹ over nondiscrete O_C | Generic/special groups Λ,0,Λ(−1); relative character Frobenius multiplies top twisted class by p on both sides | Smooth/proper/invertible coefficients retained | None |
| 4.2 cohomology comparison | ℙ¹,p=2,Λ=ℤ/3 | Top transition sequence 1,2,1,2,1,2; level 0 maps isomorphically to colimit Λ, not quotient Λ/(2−1)=0 | Correct colimit map | None |
| 4.2 cup and field equivariance | Unit and hyperplane class | 1 cup h=h, π*(h)=tilted h; σ* fixes toric h in twisted H² | Unit and twist coherent | None |
| 4.2 coefficient/degree boundary | Negative degree; ℓ-adic temptation | H⁻¹=0; each mod-ℓᵐ group has ℓᵐ elements, which alone is not the derived ℓ-adic inverse limit | No unjustified ℤℓ extension | None |
| 5.1 tube and cofinality | f=t, c=1 on unit disc | Radius 1/4; t=0 included, t=1 excluded; at c=2 radius 1/16 | Direction decreases with c | None |
| 5.1 power rule | f=t², threshold 2c, c=1 | ∣t∣²≤1/16 iff ∣t∣≤1/4; unchanged threshold gives radius 1/2 | Multiplicity affects tube scale | None |
| 5.1 integral frames versus section scale | f and ϖf, c=1 | First radius 1/4; second allows ∣f∣≤1; integral-unit multiplier keeps radius 1/4 | Correct dependence | None |
| 5.1 finite/empty equation family | f₁=x,f₂=y; no equations | Domain ∣x∣,∣y∣≤1/4; empty intersection whole space, Y=whole space | Quantifiers correct | None |
| 5.1 all-rank point interpretation | c=1/2 | Inequality v(f²)≤v(ϖ); no root of ϖ is required, denominator v(ϖ)≠0 | No rank-one-only gap | None |
| 5.2 homogeneous estimate | Exact monomial f=χᵘ | Choose g=χᵘ; error 0, both truncated maxima max(∣χᵘ∣,r^c) | Exact degree preserved | None |
| 5.2 nonzero approximation | f=ϖ²χᵘ,c=0,ε=1/2 | g=0 gives 1/16≤1/2; refined c′>2 gives required 1/32<1/16, so g cannot be 0 | Gauss-point refinement works | None |
| 5.2 chart map and grading | ℙ¹, negative-ray frame m=1 | (u,j)=(1/2,1)↦u−jm=−1/2 in P₋[1/p]; singleton norm unchanged | Map has correct chart target | None |
| 5.2 dense coefficient perturbation | Coefficient b≠0 with ∣b∣=1/4 | Error <1/4 gives ∣b′∣=1/4, not 0; error also <r^c keeps truncated locus | Nonzero coefficient retained | None |
| 5.2 imperfect-field powering | g₀=a+b t^(1/p), b≠0 | g₀ᵖ=aᵖ+bᵖt, bᵖ≠0; weights integral, divisor pD₋, coefficients still in k₀ | No extraction of roots in k₀ | None |
| 5.2 zero containment | h=g₀^(pᴺ) | h(x)=0 iff g₀(x)=0 over a valued field; 0≤r^c puts zeros in approximated tube | Correct direction of containment | None |
| 5.3 nonempty hypersurface endpoint | Line in ℙ²; doubled line | Classes h and 2h become pᴺh and 2pᴺh, both nonzero; nonzero sections have proper nonempty zero loci | Not empty or whole-space substitute | None |
| 5.3 nonprojective endpoint | FS25 complete regular fan, effective nonempty D | Pic rank 7−3=4; choose D₇, whose coordinates after eliminating the first three ray coefficients are (0,0,0,1), powered coordinates (0,0,0,pᴺ)≠0 | Projectivity unnecessary | None |
| 5.3 rank-0 exclusion | Spec K, nonzero scalar section | Scalar is a unit, zero locus ∅ | No nonempty hypersurface input exists | None |
| 6.1 Minkowski definition | ℙ¹ degree 0 | Matrix [1,−1]; (a,a)↦0, (1,0)↦1 | Balancing iff tested both ways | None |
| 6.1 ray weights | ℙ¹×ℙ¹ | (1,2,1,2)↦(0,0); (1,0,0,0)↦(1,0) | Nonexample rejects arbitrary functions | None |
| 6.1 module and extensionality | Balanced vectors c=(1,0,1,0),d=(0,1,0,1) | c+d=(1,1,1,1) balances; −c balances; c≠d at first ray | Native kernel module correct | None |
| 6.1 basis independence | Swap the two annihilator basis vectors | Balance (x,y) becomes (y,x); kernel (0,0) unchanged | No basis-dependent Chow object | None |
| 6.1 operational evaluation | ℙ¹, rank-0 toric point | A⁰ on ℙ¹ gives constant weight (1,1); A¹ has degree 1 at zero cone; Spec k has degree 1 | Correct codimension indexing | None |
| 6.1 wall sign | O(D₋) on ℙ¹ | m₋−m₊=1−0=1=1·b₊; opposite sign gives −1 | Positive degree fixed | None |
| 6.1 nonsplit control | Spec ℂ/ℝ | A⁰=A₀=ℤ, degree map ×2 not ×1 | Split-stratum contract retained | None |
| 6.2 displacement product | ℙ¹×ℙ¹, F,G | F²=G²=0, F·G=1; (2F)·(F+G)=2 | Coordinatewise product would be wrong | None |
| 6.2 lattice multiplicity | Rays (1,0),(1,2) | Determinant/index 2; ignoring index gives 1 | Integral multiplicities retained | None |
| 6.2 displacement quotient | Rank-two fan, ray γ | N/Nγ has rank 1; every vector in Nγ has quotient 0 | Ambient-versus-quotient direction fixed | None |
| 6.2 field independence and rank 0 | Same Cartier data over char 0,2,3 | Intersection integer ad+bc=2 in example in every field; rank-0 empty product 1 | No coefficient characteristic reduction of degree | None |
| 6.3 positive complete-intersection degree | Two disjoint fibres, H=F+G or F+2G | Cycle 2F, degrees 2 and 4; support has two connected components | H retained in degree data; no connectedness claim | None |
| 6.3 regular intersection multiplicity | Two distinct lines on ℙ² | Class h²=[point], generic length 1, δ=1 | Positive initial cycle | None |
| 6.3 powered degree | Two line classes, p=2,N₁=1,N₂=2 | Degree (2h)(4h)=8=2^(1+2)·1 | Scaling correct | None |
| 6.3 localized support with excess | Two identical line sections in O(1)⊕O(1) | Zero locus L, excess bundle O(1) on L; c₁(O(1))∩[L] has degree 1 | Nonempty despite dimension 1 excess | None |
| 6.3 zero-section homotopy | s and ts at t=0,1 | Endpoint sections 0,s; pushed localized class at either endpoint c₂(O(1)²)=h², degree 1 | Domain X×A¹→E explicit | None |
| 6.3 zero-codimension case | c=0 on ℙ²; rank 0 | δ=deg(h²)=1; rank-0 empty product degree 1 | Empty product handled | None |
| 6.3 inseparable points and cycle sum | xᵖ−t over 𝔽ₚ(t); multiplicity m | Residue degree p, cycle degree mp>0; zero cycle degree 0 | No geometric-integrality shortcut | None |
| 6.4 dimension endpoint | Two disjoint ruling fibres | n=2,c=1, target dimension n−c=1; two components remain allowed | Dimension not confused with point intersection | None |
| 6.4 number of equations | ℙ², repeated versus distinct lines | Repeated pair: codim 1≠2; distinct pair: codim 2 and dimension 0 | Repeated pair excluded as c=2 input | None |
| 6.4 c=0 endpoint | Whole X, rank n | Z₀=X over k₀, dim Z=n, analytic support whole X | No equation introduced | None |
| 6.4 excess dimension cuts | W=ℙ², desired dimension 0 | Successive general lines give dimensions 2→1→0 and final degree 1 | Infinite-field cut contract supplies needed maps | Tube threshold named a, separately from codimension c |
| 6.4 imperfect descent and reduction | xᵖ−t, then adjoining t^(1/p) | Before extension reduced field length p over k₀; after extension (x−t^(1/p))ᵖ has length p, reduction length 1; dimension stays 0 | Closed model descends; geometric reduction need not | None |
| 6.4 perfect-field control | Reduced point over a perfect field | Base extension remains reduced, geometric nilpotent length 0 | Perfect-field clause correct | None |
| Worked ℙ¹ example across layers | D=D₋, two degree-one monomials | W={0,1}, frames 1,t, ratio t⁻¹; (0,1)+(1,1)=(1,2); (a+bt^(1/p))ᵖ=aᵖ+bᵖt of divisor degree p | All layers use same signs | None |
| Worked surface example across layers | F,G,2F | Balance vectors (1,0,1,0),(0,1,0,1); F·G=1,F²=0; deg_(F+G)(2F)=2; dim=1 | Examples agree with intersection and endpoint statements | None |

All constructed maps have the stated source and target. The actual carriers are toric schemes, character modules, adic spaces, their sites and Chow groups; no conclusion is hidden in an arbitrary-data hypothesis. No total-function junk value is used: q=0 is excluded from power morphisms, p is prime, b>0 in fractional bounds, ϖ≠0, ℓ≠p, m≥1, and j may be negative where specified. Nonabelian groups, noncompact group actions, zero-polynomial degree and out-of-range array indices do not occur in these statements; they do not supply additional inputs to test. No unused-hypothesis claim was made. Finite computations support, but do not establish, the seven unimplemented supplier contracts.


Pull request: #1647 (roadmap/analytic-toric-geometry-part-ii at 4c15f2e)
