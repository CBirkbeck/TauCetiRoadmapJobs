# Review of PositiveScalarCurvature (pull request #1766 at c9680e6)

**Verdict:** needs changes

Seven findings, five blocking (P2). The gate passes. This is a full review of the two files in `TauCetiRoadmap/PositiveScalarCurvature`, including unchanged passages. The previous findings were checked first; their dispositions are recorded below. No pull-request file was changed.

## R01 (P2) — State the starting PSC metric in the surgery theorem

**Location:** `TauCetiRoadmap/PositiveScalarCurvature/README.md:178–198`: “In a framed tubular neighbourhood of S^k⊂M^n, set q=n−k≥3” and “prove the resulting smooth closed manifold has a PSC metric.”

**Claim:** the stated framed-surgery and codimension hypotheses suffice. Neither this paragraph nor the standing conventions assume that the starting metric is PSC. Keeping the exterior metric makes that omission particularly consequential.

**Witness:** Take M=K3×K3 and a framed S⁰. Its 0-surgery is M#(S¹×S⁷), Spin-bordant to M, with α=a²=4b≠0. Thus the result cannot admit PSC. See TangentialBordism §7.1, README:1767.

**Repair:** quantify over a smooth closed n-manifold with a specified smooth PSC metric g and a framed embedded S^k with q=n−k≥3. State the metric-extension conclusion relative to g outside the chosen tubular neighbourhood. Carry these hypotheses into the choice, relative and family versions. Cite Gromov–Lawson Theorem A, printed p.423 (`gl80 line 48`), which explicitly assumes starting PSC. This excludes K3×K3; starting with round S⁸ still permits the neck construction and produces PSC on S¹×S⁷. This is a missing hypothesis, not a counterexample to the correctly stated surgery theorem.

## R02 (P2) — The cited Whitney range does not cover the handle argument

**Location:** `TauCetiRoadmap/PositiveScalarCurvature/README.md:235–249`: “dimension n+1≥6” and “§§1.4–1.5's Whitney discs in codimension at least three”.

**Claim:** the listed suppliers furnish the Whitney and handle-trading inputs for the stated general two-connected-inclusion theorem.

**Witness:** At n=5, cancelling index-two/index-three handles has a five-dimensional level and sphere dimensions (2,3). HomotopySpheres §1.5 requires both dimensions ≥3. Its §1.6, README:516–531, supplies the omitted complement-π₁ argument.

**Repair:** import HomotopySpheres §1.6 for the six-dimensional cobordism case and prove its complement-injectivity hypothesis in this handle instance. For higher-dimensional index-two/index-three cancellation a complementary sphere still has codimension two: use Milnor 6.6 with its verified complement condition, and make the needed relative complement comparison an owned target where the supplier stops. For n=5, the complement comparison reduces to removing an attaching circle from a simply connected five-manifold, of codimension four; it does not reduce to removing the three-sphere, of codimension two. Also distinguish the simply connected application in the preceding paragraph from the general theorem at lines 235–238: two-connected M→W does not imply π₁(W)=0 (take W=(S¹×S⁴)×[0,1]). The cited §1.5 and Milnor's Theorems 7.8/8.1 use simple connectivity. Retain the general relative handle theorem as an owned target, with its π₁-relative handle trading, Whitney-loop/complement and framing inputs explicitly supplied, rather than claiming the simply connected supplier proves it. For the cylinder witness π₁=ℤ and the empty handle decomposition works; for n=5 the repaired supplier has exactly (2,3), not the impossible requirement 2≥3. Merely saying “prove the required hypotheses” does not cure a dimension hypothesis that is false in the intended application.

## R03 (P2) — Carry second countability into the global section-topology contract

**Location:** `TauCetiRoadmap/PositiveScalarCurvature/README.md:30–32,70–75`: “ComplexKahlerGeometry K5a supplies the Fréchet topology” and “consume the generic completeness and atlas-independence theorems”.

**Claim:** this contract applies to the finite-dimensional smooth manifolds allowed by the opening and the Lean standing assumptions, before the paragraph specializes to closed M.

**Witness:** For an uncountable disjoint union of circles, componentwise constant sections form ℝ^I with its product topology. This is not first countable. K5a's stated manifold hypothesis is second countability (ComplexKahlerGeometry README:718–726).

**Repair:** explicitly require Hausdorff second-countable finite-dimensional manifolds for the global Fréchet-section and metric-space-topology constructions and their supplier applications. Keep the local scalar-curvature definition and smoothness theorem at their existing broader generality. The uncountable example is then excluded from the Fréchet claim; a countable union gives a countable product of Fréchet section spaces, and compact manifolds have the needed countable atlas. If a broader locally convex section topology is wanted, state that separately without calling it Fréchet.

## R04 (P2) — Import existing constructions instead of assigning them a second owner

**Location:** `TauCetiRoadmap/PositiveScalarCurvature/README.md:147–153,170–171,394–395`: “construct smoothing of continuous principal bundles”, “Construct a smooth connection”, “Construct the compact Lie semidirect product PU(3)⋊C₂”, and “Construct the Adams complex e-invariant”.

**Claim:** these generic constructions are work owned here.

**Witness:** CharacteristicClasses C1.3–4, SmoothBundlesConnections B3.1, TangentialBordism §10.3 and HomotopySpheres §9A.1 already assign these same objects and constructions. Their precise passages are resolved in the ownership table below.

**Repair:** replace the duplicated construction targets by named supplier contracts. Import finite faithful representations/finite Stiefel approximations and relative smoothing from CharacteristicClasses C1.3–4, connection existence from SmoothBundlesConnections B3.1 (not B5), the group and CP² action from TangentialBordism §10.3, and the generic complex e-invariant from HomotopySpheres §9A.1. Retain explicit adapters for collared bases, Fubini–Study metric preservation, the Moore-map detection formula and the fixed-S⁵ construction; state how each differs from the imported object. This consolidates ownership with the earlier suppliers already used by this roadmap; it does not replace the roadmap's geometric argument. Tests of the retained adapters: conjugation sends a scalar i to −i but has degree +1 on CP²; e_C(120σ)=120·(±1/240)=1/2 modulo ℤ; the generic e-invariant is precisely the one needed for detection, not a second invariant.

## R05 (P2) — State the native geometric headlines that are already expressible

**Location:** `TauCetiRoadmap/PositiveScalarCurvature/Suggested.lean:19–29`, especially “the Hitchin spheres (P6) lack homotopy spheres, Toda's unstable classes and the Adams e-invariant”; compare `README.md:115–141,428–435`.

**Claim:** the absence of those proof ingredients prevents stating the geometric Hitchin theorem. The compact Myers–Steenrod theorem is also absent, without an unstatability explanation.

**Witness:** Two scratch probes elaborate at these pins with only `sorry` warnings: a smooth atlas on the native topological sphere with no PSC metric; and a finite-dimensional compact Lie structure on native `IsometryEquiv`, with smooth evaluation.

**Repair:** add these actual geometric headline statements. Keep the α-detection refinement, unstable representatives and structured-bordism statements in the docstring where their carriers really are missing. An existential smooth atlas on the fixed topological sphere states the homeomorphism conclusion directly; no new homotopy-sphere carrier, Toda class or e-invariant appears in that conclusion. The following probe elaborated inside the existing namespace and uses the existing definitions:

```lean
theorem hitchinSphere_native_probe (j d : ℕ) (hj : 1 ≤ j)
    (hd : d = 8 * j + 1 ∨ d = 8 * j + 2) :
    ∃ atlas : ChartedSpace (EuclideanSpace ℝ (Fin d))
        (Metric.sphere (0 : EuclideanSpace ℝ (Fin (d + 1))) 1),
      letI := atlas
      ∃ smooth : IsManifold 𝓘(ℝ, EuclideanSpace ℝ (Fin d)) ∞
          (Metric.sphere (0 : EuclideanSpace ℝ (Fin (d + 1))) 1),
        letI := smooth
        IsEmpty (PositiveScalarMetrics
          (I := 𝓘(ℝ, EuclideanSpace ℝ (Fin d)))
          (M := Metric.sphere (0 : EuclideanSpace ℝ (Fin (d + 1))) 1)) := by
  sorry
```

For the closed fibres used in the transfer application, the Myers–Steenrod probe below also elaborated, with `import Mathlib`, `open Bundle` and the existing manifold scopes. Its induced topology is exactly the topology inherited from continuous maps, not an arbitrary topology chosen to make the conclusion hold. Extended distance retains disconnected compact manifolds.

```lean
theorem compact_isometryGroup_native_probe
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [TopologicalSpace H]
    {I : ModelWithCorners ℝ E H} [I.Boundaryless]
    [EMetricSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [CompactSpace M]
    [RiemannianBundle (TangentSpace I : M → Type _)]
    [IsContMDiffRiemannianBundle I ∞ E (TangentSpace I : M → Type _)]
    [IsRiemannianManifold I M] :
    letI : TopologicalSpace (M ≃ᵢ M) := TopologicalSpace.induced
      (fun f : M ≃ᵢ M => (⟨f, f.continuous⟩ : C(M, M))) inferInstance
    ∃ d : ℕ, ∃ atlas : ChartedSpace (EuclideanSpace ℝ (Fin d)) (M ≃ᵢ M),
      letI := atlas
      IsManifold 𝓘(ℝ, EuclideanSpace ℝ (Fin d)) ∞ (M ≃ᵢ M) ∧
      LieGroup 𝓘(ℝ, EuclideanSpace ℝ (Fin d)) ∞ (M ≃ᵢ M) ∧
      CompactSpace (M ≃ᵢ M) ∧
      ContMDiff ((𝓘(ℝ, EuclideanSpace ℝ (Fin d))).prod I) I ∞
        (fun p : (M ≃ᵢ M) × M => p.1 p.2) := by
  sorry
```

For j=1 the first statement asks for dimensions 9 and 10, exactly the README's first examples. For a round circle the second statement gives O(2), a one-dimensional compact Lie group with its actual action; for the empty manifold it permits the zero-dimensional trivial group. These are geometric conclusions, not weaker numerical surrogates.

## R06 (P3) — Finish the README form, local dependencies and discriminating Checks

**Location:** `TauCetiRoadmap/PositiveScalarCurvature/README.md:1–502`; for example lines 66–75 introduce the symmetric bundle and section topology without an API/Checks block, and lines 261–266 introduce PSC bordism without one.

**Claim:** the prose alone supplies the required build specification. There are no `*Needs:*` lines or `**Checks.**` lists, no per-layer Examples/Dependencies endings, and no Scope/Conventions/Exact supplier contracts separation. Most targets have only a bibliography-level source, not a locator at the statement.

**Witness:** There are six P-sections but zero local Needs lines and zero Checks lists. The coherent Moore-space extension, metric-cone topology and PSC-bordism definitions each lack three discriminating Checks and an explicit API list.

**Repair:** reorganize the existing content into the required roadmap title/Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, numbered layers, Downstream consumers and References. Preserve the mathematics. Give each definition its source/target, API and at least three computed Checks; give each theorem exact hypotheses, a source locator and its own dependencies. In particular state r>0 for round-radius formulas, the tangential structure parameter for geometric PSC bordism, and the sources for the Myers–Steenrod/section-topology steps. The table below supplies useful controls: symmetrization of a nonsymmetric matrix, empty versus zero-dimensional nonempty PSC, and order-two versus odd-primary Moore data. Do not move these controls into `Suggested.lean`. This is the still-unrepaired README portion of the previous R08; the improved Lean module docstring repairs its form portion, subject to R05.

## R07 (P3) — Replace the purported one-dimensional noncompact example

**Location:** `TauCetiRoadmap/PositiveScalarCurvature/Suggested.lean:69–71`: “a warped product on ℝ with scalar curvature `1/(1+t²)`”.

**Claim:** this specifies a noncompact smooth metric with positive scalar curvature and zero infimum.

**Witness:** Every one-dimensional Riemannian manifold has scalar curvature 0, whereas 1/(1+0²)=1. If ℝ was intended only as the base of a warped product, the fibre and warping function are missing.

**Repair:** use an actual example: on (0,∞)×S² take g=dr²+(r²/2)g_unit. The warped-product formula gives Scal=2/r²>0 and infimum 0; at r=1,2 the values are 2 and 1/2. The metric is smooth and noncompact; completeness is not a hypothesis of the theorem. Replace the docstring example, without adding a sorried example theorem. The compact uniform-gap theorem itself is sound.

## Verified sound

The checks here are evidence of the stated instances, source comparisons and interfaces, not proofs of all future targets. Cases requiring unavailable source text are explicitly distinguished below.

**Previous review, finding by finding.** Quotes are from the repaired head, not the old review's proposed wording.

| Previous finding | Passage at this head | Disposition |
|---|---|---|
| R01, unprojected σ relation | README:326–350: “projection of a torsion abelian group”; `(2Eσ₈)₂=E²σ′`; `σ₂=225σ` | Repaired. The projection, integral inclusion and sign are distinguished; values recomputed below. |
| R02, four nonexistent GeometricTopology declarations | README:235–249: “Prove the handle-index bound”; “HomotopySpheres §1.2” and “§§1.4–1.5” | Partly repaired. The nonexistent names are gone and ownership of the bound is explicit. The new supplier range still fails at n=5 and for general π₁: R02 above. |
| R03, failed module build | Suggested.lean:1: `module` | Repaired. Worker gate passes and direct elaboration succeeds. |
| R04, import rules | Suggested.lean:2: `import Mathlib`, followed by the two used Tau Ceti modules | Repaired. No Mathlib sub-imports. |
| R05, commit-pinned supplier links | README:25–52: named R1, R4.7, B1/B5, G4–G6, §7.1 and §§1.2–1.5 contracts | Repaired as a link-policy issue. Contracts were resolved again; R02/R04 describe substantive remaining issues. |
| R06, process labels | README:414–427: “HomotopySpheres Layers 6–8”, “§8.2”, “§8.3” | Repaired. The Mathlib API reference at README:98–100 is not a cross-roadmap PR-number dependency. |
| R07, mechanical upward edge | README:44–52 retains TangentialBordism/HomotopySpheres as suppliers | Repaired mechanically: zero problems in the required movable dependency run. |
| R08, README and acceptance-test shape | Suggested.lean:9: “The roadmap is README.md; this file is not the roadmap”; README still has “## P1” through “## P6” | Partly repaired. Lean form improved; README requirements remain R06. Missing expressible headlines are R05. |
| R09, unnecessary boundaryless restriction | Suggested.lean:65–66 has no boundaryless binder; README:81 explicitly includes half-spaces | Repaired. Elaborated signatures agree on this point. |

**Gate, scope and direction.** The worker's gate at this exact head reports every counter zero and `build=0 OK`, including `set_option`, `sorry-data`, `sorry-examples`, imports, stray-files, outside-folder, dirty and depcheck. The outside-folder diff is empty and the worktree remains clean. The required dependency command was run independently, with this complete output:

```text
depcheck: 205 roadmaps, 1645 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. All supplier uses in the prose were inspected despite the absence of Needs lines. No declared supplier gaps exist. TangentialBordism's own HP² positivity/index-zero proof at §10.4 is independent of this classification: its bound 56>0 is compatible with the exact scalar value 128, and its mentions of this roadmap describe consumers. HomotopySpheres does not consume PositiveScalarCurvature. StringOrientation's positive-Ricci question is a separate downstream topic, not an input. No route-specific arithmetic shortcut, sorry'd data, `set_option`, computational algorithm or suspicious fetched instruction was found. Geometry constructions and finite homotopy computations here are mathematical targets, not executable algorithms.

**Lean and signatures.** The original module elaborated under `lake env lean` with exactly the two `sorry` warnings at lines 65 and 72. A scratch copy with `#check @name` for all five declarations also elaborated. The advertised dropped-binder lead is harmless: `SmoothMetric` retains neither finite dimensionality nor T2 because the native bundled metric is defined without them. The scalar-curvature definition, PSC subtype and both theorems retain finite dimensionality and T2; the uniform-gap theorem also retains compactness and pointwise positivity. No declaration lost a mathematically required binder. The two imported Tau Ceti objects were present. No source file or pin was modified.

Both sorried theorems were tested in a copy with one-tactic alternatives `simp`, `rfl`, `infer_instance`; neither closed. Object search found no pinned scalar-smoothness theorem that directly closes the first. The second needs scalar continuity plus the compact minimum argument, not a direct instance or unfolding. No demonstrated padding finding is raised. The PSC subtype becomes genuinely used by the native Hitchin headline in R05.

**Headline inventory.** P1's scalar smoothness and compact gap are present. P2's compact Myers–Steenrod theorem is expressible and absent (R05). P2's associated-bundle PSC construction and P3's framed metric surgery need the actual smooth associated/framed-surgery constructions. P4's general handle theorem and structured PSC bordism invariance need the structured handle/bordism carriers. P5's obstruction and integral simply connected classification need manifold Spin structures and the real KO-valued index. P6's fixed-S⁵ Moore/μ construction and nonzero α refinement need their unstable homotopy/K-theoretic carriers; the family-index theorem needs the real Dirac family. P6's geometric no-PSC exotic spheres are already expressible (R05). The module docstring should name the additional P2/P4/family results and their missing interfaces as well as the four major results it currently lists. Missing proof machinery is not, by itself, a missing statement carrier.

**Pinned declarations opened.** Mathlib pin `f6090c7095e1e56b3464c1daba5f24631f1290d2`; Tau Ceti pin `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. Paths in this table are relative to the respective library checkout.

| File and line | Declaration/content inspected | Consequence |
|---|---|---|
| `Mathlib/Geometry/Manifold/VectorBundle/Riemannian.lean:244–251` | `Bundle.ContMDiffRiemannianMetric`: continuous bilinear inner form, symmetry, strict positivity for nonzero vectors, bounded unit ball, smooth total-space section | Real native carrier; no global second-countability, nonemptiness or compactness field. The Fréchet claim cannot be inferred from this structure. |
| Same file:259–267 | `toRiemannianMetric` and the associated `IsContMDiffRiemannianBundle` instance | The two local instances in `metricScalarCurvature` use the chosen g correctly. |
| `TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Scalar.lean:53,62,71,80,85,112` | Scalar is the metric trace of Ricci; orthonormal single/double sums; zero-curvature consequences; constant-curvature formula | Ordered contraction gives n(n−1)κ and the factor 2 in the bending cross term. |
| `TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Regularity.lean:163,294` | `contMDiffOn_leviCivitaConnection` and smooth Levi-Civita instance | No boundaryless restriction in these inputs. |
| `Mathlib/Algebra/Module/Torsion/PrimaryComponent.lean:48,138,173` | `Submodule.primaryComponent`, `iSup_primaryComponent_eq_top`, `iSupIndep_primaryComponent` | Dedekind-domain torsion-module decomposition applies to ℤ and arbitrary torsion abelian groups, not just finite groups. Projection still needs the internal-sum adapter. |
| `Mathlib/GroupTheory/Torsion.lean:450–467` | Additive `primaryComponent`, membership and order-power characterization generated by `to_additive` | Membership is killed by a power of p; this is a subgroup, not by itself an element-projection operation. |
| `TauCeti/Geometry/Manifold/Riemannian/Distance.lean:293` | `TauCeti.MetricSpace.ofRiemannianMetric`, with T3 and preconnectedness | The README's componentwise metric/extended-distance distinction is appropriate; global application must supply the separation hypotheses. |
| `Mathlib/Geometry/Manifold/Bordism.lean:109–128` | `SingularManifold`: topological/charted/smooth compact boundaryless carrier and continuous map | Does not supply geometric Spin structures, α, or structured Spin-bordism groups; does not itself require nonemptiness or T2. |
| `Mathlib/Topology/MetricSpace/Isometry.lean:359,564–568` | `IsometryEquiv` and its automorphism group | Actual group for the Myers–Steenrod probe; not an arbitrary group placeholder. |
| `Mathlib/Geometry/Manifold/Riemannian/Basic.lean:79` | `IsRiemannianManifold`: given extended distance equals the infimum-of-path-length distance | The probe relates its isometries to the actual Riemannian metric. |
| `Mathlib/Geometry/Manifold/Algebra/LieGroup.lean:72` | `LieGroup` requires smooth multiplication/inversion on the charted group | Probe separately includes `IsManifold`, compactness and smooth evaluation; no vacuous free predicate. |

Object searches covered curvature/Ricci/Levi-Civita, positive scalar metrics, spinor/Dirac/Spin structures, bordism, Moore cones, e-invariants, primary torsion and isometry groups. Algebraic Clifford/Spin objects and `SingularManifold` were not mistaken for geometric Spin/Dirac carriers. The only current namespace declarations are the five inspected ones; no collision with a declaration in another supplied roadmap folder was found.

**Adversarial mathematics table (88 rows).** Rows cover the definitions, formulas, construction interfaces, headline results, sampled claims and all finding witnesses. “Consistent” records the displayed test, not an assertion that testing proves the theorem. The source-dependent unstable calculations remain subject to the access qualifications below. Nonapplicable arithmetic tests (DVRs, residue characteristic, inseparability) were not substituted for the actual real-geometric and integral-homotopy boundary cases.

| Statement / README location | Instances tried | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| Sym² projection, 66–68 | b=[[0,2],[0,0]]; skew b; b=I | (b+bᵗ)/2=[[0,1],[1,0]] and a second projection is identical; skew maps to 0; I maps to I | Symmetric image and idempotence; antisymmetrization fails I | Add explicit Checks, R06 |
| Native metric ↔ positive-definite section, 68–69 | diag(1,2), diag(1,0), zero vector space | Values on e₂ are 2>0 and 0; rank-zero positivity on nonzero vectors is vacuous on both carriers | Both directions have the right tests; degenerate positive-semidefinite form excluded | None |
| SmoothMetric/metric-specific scalar, 76–79 | Round S² metric g and 4g | s(g)=2; s(4g)=1/2, not 2 from a fixed background metric | Local instances select the metric in the argument | None |
| Section topology/completeness, 70–75 | Countably versus uncountably many disjoint circles | Constant sections give ℝ^ℕ, metrizable; ℝ^I for uncountable I has no countable neighbourhood base | General Fréchet contract needs countability | R03 |
| C² versus C∞ finite-atlas seminorm descriptions, 73–75 | On S¹, f_k=k⁻³sin(kt) | C² norm is O(k⁻¹)→0; third derivative has sup norm 1 | These are different topologies; each can have its own atlas description, not equality with each other | Make distinction explicit in Checks |
| Scalar smoothness, 80–82 / Lean:65 | Flat Euclidean/half-space chart; unit round S² | Scalar functions are 0 and 2; all their positive-order derivatives are 0 | Smoothness test covers boundary charts; no boundaryless binder | None |
| Second-order dependence, 82 | g=e^(2u)(dx²+dy²), u=0 versus u=a(x²+y²) | At origin, g and first jets agree; scalar is 0 versus −8a | First-order control would be insufficient; second-order expression discriminated | Add Check |
| C²/C∞ openness of PSC, 82–83 | Compact metric with minimum scalar 2 | A uniform scalar perturbation <1 leaves scalar >1; perturbation −2 reaches 0 | Strict positive margin, not merely nonnegativity | None |
| Compact uniform gap, 84–86 / Lean:72 | Empty manifold; round S²; point | Empty: ε=1 and all inequalities vacuous; S²: ε=2; point: scalar 0, so positivity premise false | Nonemptiness need not be added; point is not PSC | None |
| Claimed noncompact example, Lean:70–71 | One-dimensional ℝ; actual cone (0,∞)×S² | Scalar on ℝ is 0≠1 at t=0; cone scalar 2/r² has values 2,1/2 and infimum 0 | Original example fails/underspecifies carrier | R07 |
| Uniformity in compact parameters, 86–87,463–465 | g_t=(1+t)g_S², t∈[0,1]; g_c=cg_S², c>0 unbounded | Scalar 2/(1+t)≥1; 2/c has infimum 0 | Quantifier ∃δ>0 ∀p,x needs compact parameter set | None |
| Diffeomorphism pullback, 89–90 | Reflection of S²; identity map | s(φ*g)=s(g)∘φ=2; identity returns g and scalar 2 | Orientation-reversing pullback also allowed for the metric | None |
| Positive scaling, 90–91 | c=4,1,0 | 2/4=1/2; 2/1=2; c=0 gives a degenerate bilinear form, not a metric | c>0 is essential and stated | None |
| Products / domination, 91–92 | S²×hyperbolic surface with scalar −2 | Product scalar 2−2=0; scaling sphere metric by 1/4 gives 8−2=6 | Product of a PSC and a negative factor need not be PSC until scaled | None |
| Disjoint union / restriction, 89–90 | S²⊔S²; S²⊔flat T²; open hemisphere | Scalars (2,2) give PSC; (2,0) do not; hemisphere retains 2 | All components, not one, must be positive | Add Checks |
| Round formula, 93 | n=2,r=1,2; n=0,1 controls | n(n−1)/r²=2,1/2; low-dimensional scalars 0 | Consistent for r>0; r=0 is not this n-sphere model | Explicit r>0, R06 |
| CP normalization, 94–96 | d=0,1,2 | 4d(d+1)=0,8,24; CP¹=S²(radius 1/2) gives 2/(1/2)²=8 | Matches supplier curvature-4 convention | None |
| HP normalization, 94–97 | d=0,1,2 | 16d(d+2)=0,48,128; HP¹=S⁴(radius 1/2) gives 12/(1/2)²=48 | Real quaternionic trace normalization agrees | None |
| Product collars, 102–104 | S²×[0,1] with g_S²+dt² | Scalar 2+0=2 at both collars and interior | Flat normal factor does not remove positivity | None |
| Concordance definition/conversion, 105–107 | Constant g_S² and prescribed ψ | Scalar 2; near ends ψ′=1, so normal metric coefficient remains 1 rather than 9 from linear rescaling t↦3t−1 | Buffer interval and unit endpoint derivative are necessary | None |
| Reversal and concatenation, 107 | Two constant S² concordances | Reversal gives dt² again; glued collars have metric g_S²+dt² and scalar 2 | Endpoint collar data match; no arbitrary metric average | None |
| Isotopy ⇒ concordance, 108–111,475–477 | Scale path g_t=(1+3t)g_S² | Minimum slice scalar 1/2; a slowed-path curvature error <1/4 leaves scalar >1/4 | Compact positive margin supports the route; converse not inferred | None |
| Full isometry group / compactness, 115–129 | Round circle; three isolated zero-dimensional components | O(2) has Lie dimension 1; three components with off-diagonal distance ∞ give S₃ of order 6 | Includes nonabelian and disconnected cases, not just identity component | R05 states headline |
| Frame-evaluation faithfulness, 123–129 | Reflection of S¹ fixing a point; interchange of two round components | Same point, derivatives +1 versus −1 distinguish identity/reflection; component permutation distinguishes swap from identity | One point is insufficient; one frame per component plus permutation works | None |
| No-small-subgroups route, 129–138 | Rotation subgroup C_m on unit circle, m≥2 | m=2 has max displacement 2; m≥3 has an element with displacement ≥√3 | No such nontrivial subgroup fits a displacement neighbourhood <1 | Uniform proof remains owned here |
| Associated quotient/action, 143–146 | G trivial; trivial principal bundle B×G; nontrivial C₂ action | Quotients are B×F in the first two cases; identification (pg,f)∼(p,gf) uses the actual action | Trivial product is a control, not a replacement for all bundles | None |
| Smoothing and connection, 147–153 | Trivial U(1)-bundle; two local potentials | A=0 gives flat connection; changing gauge e^(iθ) adds i dθ | Supplied connection/reduction object, not a second construction | R04 |
| O'Neill contraction, 159–162 | Product A=0; one nonzero skew pair A₁₂=v, A₂₁=−v | Ordered norm sum is 0 or 2‖v‖²; negative scalar contribution is 0 or −2ε²‖v‖² | Unordered convention would miss factor 2 | Add this normalization Check |
| Fibre scaling/PSC, 154–166 | s_B=−10, s_F=2, ordered ‖A‖²=1 | ε=1/4 gives −10+32−1/16=351/16>0; ε=1 gives −9 | Fibre positivity dominates bounded base/error terms only for small ε | None |
| Transfer fibres, 168–174 | RP², CP², HP² at normalized metrics | Scalars 2,24,128 respectively; same values on locally isometric quotients | Actual transfer spaces get positive fibre metrics | None |
| Semidirect structure/action, 170–172 | Conjugation and scalar i; CP² orientation | Conjugation sends i↦−i; degree on CP² is (−1)²=+1 | Direct product/central-circle model is wrong | Import group/action; retain metric invariance, R04 |
| Tube principal curvatures, 182–185 | Euclidean tube around a k-plane, q=3 | Two normal-sphere principal curvatures −1/r; k tangential ones 0 | Correct leading multiplicity; tangential directions are not additional −1/r terms | None |
| Point bending scalar term, 186–190 | n=3,r=1,sinθ=1,kγ=0 or 1 | Ordered Gauss sum is 2−4kγ, hence 2 or −2; printed gl80 coefficient would give 2 or 0 | Roadmap formula is correct; source factor is not | Source issue only |
| Codimension bound, 178–193 | q=3 versus q=2 | Positive quadratic coefficient (q−1)(q−2)=2 versus 0 | q≥3 has actual curvature content; q=2 cannot use this estimate | None |
| Surgery PSC conclusion, 194–198 | S⁸ with a PSC input; K3×K3 without one | First 0-surgery admits neck PSC; second has α=4b before and after surgery | Counterexample to hypotheses as written | R01 |
| Relative choice/family surgery, 200–208 | Identical choices; two disjoint S⁰ tubes | Identical data give constant concordance; modifications have disjoint supports, so each exterior restriction equals the original g | Coherent positive interpolation is a target, not a consequence of convex averaging | Carry starting g, R01 |
| Handle/belt arithmetic, 209–212 | n=5,k=2; n=3,k=0 | q=3,λ=3,belt dimension 2; q=3,λ=1,belt dimension 2 | q≥3 iff belt dimension ≥2 | None |
| Connected sums / components, 211–212 | Two round S³; empty incoming boundary | S³#S³≅S³, scalar can be 6; adjoined round Sⁿ has α=0 | Valid positive seed; removal is handled by the bordism direction, not arbitrary reverse surgery | None |
| Killing π₁ with normal structure, 216–226 | Oriented normal rank n bundle on S¹; framing twist | Oriented bundle class on S¹ is 0; for n≥3 framings differ by π₁SO(n)=ℤ/2 | One of the two parity choices preserves the specified Spin extension | None |
| π₂ framing obstruction, 228–233 | Spin sphere normal bundle; oriented bundle with w₂=1 | Obstruction in π₁SO(n−1)=ℤ/2 is 0 versus 1 | Nonspin detector must be retained, not framed away | None |
| Nonspin outgoing surjectivity, 230–231 | Quotient π₂(W)/ker(w₂) | Image is ℤ/2 when w₂ is nonzero; an outgoing sphere with value 1 surjects onto it | Correct normal 1-type distinction | None |
| Interior surgery dimensions, 233 | n=5 | Circle tube S¹×D⁵ has dimension 6=n+1 | No off-by-one tube dimension | None |
| Handle-index reversal, 235–246 | n=5,N=6, surviving outgoing indices 3,4,5,6 | Dual indices 6−λ=3,2,1,0, all ≤3=n−2 | Arithmetic correct | None |
| Whitney supplier range, 239–244 | N=6, index 2/3 cancellation | Level dimensions 2+3=5; p≥3 is false; complement of attaching circle has codimension 4 | Cited §1.5 cannot apply | R02 |
| General π₁ of handle theorem, 235–238 | W=(S¹×S⁴)×[0,1] | Inclusion is a homotopy equivalence, π₁(W)=ℤ, no relative handles | Statement need not be narrowed; cited simply connected route needs extension | R02 |
| Joining incoming components, 250–256 | Two PSC spheres joined by one 1-handle | Incoming components 2→1; boundary connected sum remains PSC; handle index 1≤n−2 for n≥3 | Correct direction of component joining | None |
| Geometric PSC bordism, 261–266 | Product cylinder; empty cycle; map X→pt | Boundary is M⊔(−M), hence [M]−[M]=0; empty class 0 maps to 0 | Cylinder/inverse and forgetful tests; tangential structure must be explicit | R06 |
| Spin index obstruction, 270–272 | Round S⁸; K3×K3 | Sphere α=0; K3 product α=4b≠0 and Â=4 | Zero/nonzero obstruction discriminates the false surgery instance | None |
| KO coefficient table, 273–274 | Degrees 0 through 7 | ℤ,ℤ/2,ℤ/2,0,ℤ,0,0,0 | Agrees with TopologicalKTheory T7 | None |
| Real/complex index normalization, 274–278 | K3 and K3×K3 | α(K3)=a, c(a)=2u², Â=2; a²=4b and Â(product)=4 | A naive α=Â in degree 4 would be wrong | None |
| HP² transfer kernel, 280–283 | Base point; degrees below 8 | [HP²] maps to α=0 with scalar 128; transfer domains in negative degrees are 0 | Uses integral point kernel, not arbitrary-X assertion | None |
| Oriented/nonspin classification, 284–290 | CP³ (Spin), CP²×S³ (nonspin), K3×K3 | CP³ has scalar 48 and KO₆=0; CP²×S³ has scalar 30 and w₂≠0; K3 product fails α=0 and PSC | Tests both branches and obstruction converse | None |
| Low-dimensional consequence, 296–298 | n=5,6,7 | KO₅=KO₆=KO₇=0; S⁵,S⁶,S⁷ round scalars 20,30,42 | Classification gives existence in the claimed simply connected range | None |
| Unique Spin structure on homotopy spheres, 298–299 | S⁹ versus S¹ | H¹(S⁹;ℤ/2)=0 gives one Spin structure; H¹(S¹;ℤ/2)=ℤ/2 gives two | High-dimensional sphere hypothesis discriminates uniqueness | None |
| Moore carrier and maps, 304–307 | M₆=cofib(2:S⁶→S⁶) | Reduced integral H₆=ℤ/2, other reduced homology 0; cells in degrees 6,7; j targets S⁷ | Zero attaching map would instead give S⁶∨S⁷ and wrong homology | None |
| Coherent zero-bracket extension, 308–318 | Zero a with zero tracks; a₁ case | Zero data allow a_tilde=0,A=0,j a_tilde=0=Ea; detected a₁ gives nonzero K-unit map | Chosen zero tracks/coextension retained; arbitrary choices not identified | None |
| Unstable degree-two caution, 319–320,354–355 | Suspension a₁; ν̄₆ | Postcomposition on a₁ is 2a₁=0; on ν̄₆ it is 2ν̄₆±2ν̄₆, possibly 0 or 4ν̄₆ rather than 2ν̄₆ | Suspension hypothesis matters | None |
| Low σ classes, 322–325 | σ''' order 2, σ'' order 4, σ′ order 8 | Eσ'''=2σ'' has order 2; Eσ''=2σ′ has order 4 | Numerically coherent; direct Toda locator remains unchecked | None |
| Integral Hopf normalization, 325–326 | Octonionic Hopf map σ₈ | H:π₁₅(S⁸)→π₁₅(S¹⁵)=ℤ, H(σ₈)=1 | Correct integral Hopf-invariant-one input, not its torsion projection | None |
| Primary projection, 326–335 | ℤ/240, ℤ/3, ℤ/16; torsion ℚ/ℤ | Projection of 1 is 225,0,1 respectively; each element of ℚ/ℤ has finite primary support | Projection is natural on all torsion groups; subgroup alone would not choose 225 | Previous R01 repaired |
| σ₂ order and stable relations, 336–350 | Generator σ of ℤ/240 | σ₂=225σ order16; 2σ₂=210σ order8; 4σ₂=180σ order4; 8σ₂=120σ order2 | Matches all specified unstable orders | None |
| Unprojected negative control, 342–350 | 2σ and 15σ | ord(2σ)=120≠8; 15σ=−225σ, not +225σ | Original false identity and sign ambiguity excluded | None |
| Chosen zero Toda representative, 354–377 | a₁=2σ'', η₁₃ of order 2 and a suspension | a₁η₁₃=2(σ''η₁₃)=σ''(2η₁₃)=0 | Coherent zero representative, not arbitrary Toda member | Toda Cor.3.7 direct text unavailable |
| Integral π₁₄(S⁶), 360–361 | ℤ/8⊕ℤ/2⊕ℤ/3 | Total order 8·2·3=48; 2-primary order16, odd-primary order3 | Matches kmnst integral decomposition | None |
| EHP/Whitehead conventions, 362–367 | ν̄₆ and ε₆ | H-values ν₁₁^(2),0; Whitehead composite ±2ν̄₆ has order4 | Sphere EHP map distinguished from quaternionic-Hopf precomposition | None; direct Toda values qualified below |
| Full indeterminacy, 368–374 | x=ν̄₆, ε₆ and a 3-primary generator | 2G≅ℤ/4⊕0⊕ℤ/3 has order12; post-2 of ν̄₆ is 0 or 4ν̄₆, of ε₆ is 0; odd component remains inside ℤ/3=2ℤ/3 | Image containment plus additive doubles yields the stated full subgroup | None |
| Moore Adams map, 378–381 | A:M₁₄→M₆; zero map control | Σ⁸M₆ has cells14,15=M₁₄; KU multiplier 1 mod2 versus 0 for zero map | Detection excludes zero or wrong degree map | None |
| η extension / μ degrees, 383–391 | j=1,2 | μ domains S¹⁴,S²², targets S⁵, stable stems9,17; extension over M₁₄,M₂₂ kills multiplication by2 | Order divides2 before detection; not yet exact2 | None |
| Generic complex e-invariant, 394–395 | Zero class and 120σ | e(0)=0; e(120σ)=1/2 modℤ | Same two-cell KU invariant as supplier | R04 |
| Adams typed bracket/sign, 399–405 | q=2,e(Ef)=e(h)=1/2; q=3, both 1/3 | −2·1/4=1/2 modℤ; −3·1/9=2/3, whereas wrong positive sign gives 1/3 | Half-valued case alone cannot test sign; order-three case does | Add sign-discriminating Check |
| Bracket degrees/parity, 401–403 | a=7,b=5,c=3; real example a=8,b=6,c=4 | Complex f:S¹²→S⁹,h:S⁹→S⁶, bracket S¹³→S⁶; real f:S¹⁴→S¹¹,h:S¹¹→S⁸, bracket S¹⁵→S⁸ | Strict inequalities and real evenness agree with Adams 11.1 | None |
| Exact μ order / detection, 406–410 | a₁=120σ; μ_(8j+1), j=1 | e(a₁)=±120/240=1/2; μ has e=1/2≠0 and 2μ=0, so order2; α(μ₉)=ηb≠0 | Zero and order-dividing-two ambiguities removed | None |
| η product in KO, 409–411 | ημ₉; η²μ₉ control | α(ημ₉)=η²b≠0; η³b=0 | First η product detected, not all repeated products | None |
| Odd sphere realization, 414–418 | j=1, dimension9 | Odd obstruction group P₉=0, so obstruction value0 | Uses kernel in the full exact sequence | None |
| Even sphere realization, 418–425 | Σ⁹×Lie-framed S¹ | H₅=0, middle quadratic space dimension0, Arf=0; index ηb·η=η²b | Zero middle homology supplies actual zero obstruction | None |
| J/Spin comparison and §8.3 exclusion, 423–427 | n=9,10 | Standard sphere has bounding Spin α=0; π₈SO=ℤ/2 and π₉SO=ℤ/2, both nonzero | Must use §8.2, not §8.3's vanishing criterion | None |
| Geometric Hitchin headline, 428–435 | j=1,2 | Dimensions (9,10),(17,18); α values ηb^j,η²b^j are nonzero; standard round sphere has scalar d(d−1)>0 | Exotic smooth atlas is essential; statement uses actual metrics on fixed sphere topology | R05 |
| Alexander-trick extension, 430–432 | Boundary identity on unit sphere | Radial extension sends rx↦rx and centre0↦0; inverse is itself | Correct topological recognition adapter; no smooth extension asserted | None |
| HP Pontryagin/Newton formula, 437–442 | k=1,2 | k=1: p₁=0,s₁=0=4−4; k=2: p₁=2u,p₂=7u²,s₂=4−14=−10=6−16 | Correct Euler sign and truncation; k=1 excluded from nonzero Newton claim | None |
| Dold quotient/scalar, 443–446 | P(1,2); a=b=0; mixed tangent plane | P(1,2) scalar 0+24=24; P(0,0) scalar0; mixed sectional curvature0 | Scalar positivity does not imply sectional positivity | Source issue only |
| Dold characteristic number, 446–451 | P(1,2), with c²=0,d³=0 | w₁=0,w₂=d,w₃=cd, pairing of cd²=1; Ω₅SO=ℤ/2 while Ω₅Spin=0 | Oriented nonbounding example is correctly nonspin | None |
| Reflection mapping tori / flat torus base, 451–455 | Isometric monodromy, product-collar connection A=0 | Scalar of quotient/product equals s_F+0=s_F; no scalar contribution from flat base | Actual locally isometric bundle, not rational-class replacement | None |
| Spin circle/torus counterexample, 457–462 | One antiperiodic circle; fully periodic spin T² | Antiperiodic frequencies k+1/2 never0, α=0; fully periodic torus α=η²≠0; χ(T²)=0 in both cases | Index-zero does not imply PSC outside n≥5 simply connected range | None |
| Gauss–Bonnet obstruction, 460–462 | Any metric on T² | ∫Scal=4πχ=0, whereas positive scalar on compact nonempty T² would give integral>0 | Topological obstruction independent of Spin choice | None |
| Metric identification of L²/spinors, 466–470 | Constant rescaling g↦cg in dimension n | Volume multiplies by c^(n/2); corresponding L² normalization uses factor c^(−n/4) in the forward unitary map | Density and positive square root are needed; bare identity is not unitary | None |
| Lichnerowicz uniform gap, 471 | δ=4 or8 | D²≥1 or2; no zero eigenvalue | Uses real Clifford-linear realization, not merely a complex integer index | None |
| Bounded-transform gap, 472 | D² lower bound1 or2 | F²=D²/(1+D²)≥1/2 or2/3, equal to δ/(4+δ) | Correct denominator, monotonicity and strict positivity | None |
| Family index and PSC-bordism comparison, 473–477 | Constant invertible family; pullback to a point; product concordance | Kernel0, real index0; pullback of0=0; equal endpoint indices0=0 | Consistent; invertible-family trivialization still needs the named analytic input | None |

The e-invariant order-three sign test can be realized in the stable range by order-three multiples of ν: with a=7,b=5,c=3, take degree-three annihilated classes in the displayed 3-stem maps, normalized to e=1/3. Both adjacent composites with 3ι are null, and Adams's bracket has value 2/3. This detects a sign that the half-valued μ example cannot detect.

**Sources and the 15-target sample.** The brief specifies a sample size but supplies no target identifiers (“none found by heading”). For the supplemental sample I used the seed `PRREVIEW-PositiveScalarCurvature~2:c9680e6` on 26 explicit mathematical locators. The resulting 15 targets are listed below. Fourteen texts were readable; Toda Lemma 5.14 was not. All other cited works were also sought, and the extra accessible locators were read. This is not represented as recovery of an undisclosed worker sample.

| Sample target | Text, exact locator and pages | Comparison with this roadmap |
|---|---|---|
| Adams 12.13 | `adams line 1840–1873`, printed p.68; PDF image checked because fraction OCR is poor | Order-two μ in every stem 8s+1, with e_C=1/2. Stable construction, not by itself a fixed-S⁵ construction. |
| Gromov–Lawson B | `gl80 line 66–71`, p.424; proof `line 336–352`, pp.431–432 | Compact simply connected Spin manifold, n≥5, Spin-bordant to a PSC manifold. Starting positivity is explicit. Proof first makes W simply connected. |
| Milnor 5.4 | `milnor line 1182–1191`, p.48 | Cancellation requires one transverse intersection of the relevant spheres, not merely algebraic intersection ±1. |
| Adams 7.2 | `adams line 759–764`, p.40; proof `line 1889–1893`, p.69 | Real d_R detects the order-two direct summand in positive degrees 1,2 modulo8. The real comparison, not a complex integer index, is used. |
| Crowley–Schick 2.12 | `cs13 line 289–290`, arXiv v4 p.7 | Framed-to-Spin α agrees with real d_R. No arbitrary choice-independent unstable class is promised. |
| Adams 11.1 | `adams line 1266–1275`, p.53; formula and dimensions checked in PDF image | a>b>c>0, adjacent null composites, negative sign, and even a,b,c for the real version all agree with README:399–404. |
| Milnor 7.8 | `milnor line 2565–2569`, p.97 | Simply connected W and both ends, vanishing full relative homology, no end-index critical points. Not the general two-connected-inclusion theorem: R02. |
| Gromov–Lawson HP Newton calculation | `gl80 line 363–370`, p.432 | Pontryagin series and coefficient 2k+2−4^k agree; k>1 makes this nonzero. The roadmap correctly keeps the integral classification separate from this rational argument. |
| Milnor 7.6 | `milnor line 2418–2434`, p.92 | Connected W, a single critical index λ with 2≤λ≤N−2; basis changes realized geometrically. This does not supply arbitrary-π₁ low-handle elimination by itself. |
| Gromov–Lawson formula (1) | `gl80 line 185–204`, p.427; PDF image checked | The roadmap's factor 2 agrees with the ordered Gauss contraction; the source omits it. Source issue below, not a defect in README:187. |
| Adams 5.3(v) | `adams line 566–567`, p.35 | Toda-to-Massey comparison supplies the sign input; README's typed numerical application is then Theorem 11.1, not an unspecified sign convention. |
| Kachi–Mukai–Nozaki–Sumita–Tamaki 4.4 | `kmnst line 458–473`, p.117 | Integral π₁₄(S⁶)=ℤ/8⊕ℤ/2⊕ℤ/3; the quaternionic-Hopf formula at line471 includes the odd-primary term. The README retains that distinction. |
| Stolz survey 1.6 | `stolz22 line 151–157`, arXiv v1 p.4 | Closed simply connected Spin, dimension≥5, PSC iff α=0. It explicitly attributes the primary result to Stolz 1992 Theorem A. |
| Gromov–Lawson C | `gl80 line 94–99`, p.424; proof `line 371–410`, pp.432–433 | Oriented nonspin simply connected branch and PSC representatives of positive-dimensional oriented classes; retain the nonzero w₂ detector. |
| Toda 5.14 | *Composition Methods*, requested pp.48–50 | Direct text and exact printed locator not verifiable. Open corroboration is not certification of this book's page/number. |

Additional locators checked: Gromov–Lawson Theorem A (`gl80 line 48–55`, p.423), formula (1′) (`line 250–267`, p.429), and Dold passage (`line 399–410`, p.433); Adams Lemma 12.5 (`adams line 1727–1751`, p.65), whose “sufficiently large” sphere dimension is why the separate unstable construction matters; Adams real comparison (`line 1874–1893`, pp.68–69); Hitchin §§4.1–4.2 (`hitchin line 1186–1290`, pp.37–40) and exotic spheres (`line 1390–1401`, p.44); Crowley–Schick Lemma 2.14 and Remark 2.15 (`cs13 line 305–371`, arXiv v4 pp.8–9); Milnor 6.6 (`milnor line 1841–1857`, p.71) and 8.1 (`line 2613–2626`, p.100); Stolz Corollary 1.5 (`stolz22 line 149–150`, p.4); Wang's survey Theorem 3.2.60 (`wang-survey line 1148–1152`, p.33), 2-primary suspension relations (`line 4774–4776`, appendix p.103) and Hopf invariant (`line 4863`). Wang corroborates the localized identities; it does not replace Toda's integral-page verification.

Eleven works were considered: the ten cited works (including Milnor's inline citation) and the supplementary Wang survey. Eight were read in legal copies. Fetches used the sources service; no manifest was edited. Gromov–Lawson came from the [author's IHES copy](https://www.ihes.fr/~gromov/wp-content/uploads/2018/08/827.pdf); Adams from the [Rochester institutional copy](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Adams-JX4.pdf); Kachi et al. from the [Okayama journal archive](https://www.math.okayama-u.ac.jp/mjou/mjou43/_Kachi.pdf); Crowley–Schick from [arXiv:1204.6474v4](https://arxiv.org/abs/1204.6474v4); Stolz's survey from [arXiv:2202.05904v1](https://arxiv.org/abs/2202.05904v1). Hitchin, Milnor and Wang were read from institutional copies located by the service. Milnor line references here consistently use the Edinburgh extraction, not the second Auckland OCR. Adams and Hitchin are readable this round despite the previous report's access classification. Crowley–Schick locators here are explicitly to the arXiv version read; journal page/number agreement was not assumed.

**Ownership and cross-roadmap resolution.** Main was checked at `929496d4221b974c60787257a3cdc28b600fc49c` (HEAD equals origin/main). Existing-roadmap revisions were not used as suppliers. New suppliers were read at the provided open heads. `roadmaps grep`/`roadmaps show`, searches of the provided sibling folders and the board packages were used to locate the objects, then the passages below were read. The table has 18 supplier groups and resolves every distinct named supplier in this README; broad section citations are expanded to the consumed passages. Ownership against open work whose files were not supplied was not checked.

| Supplier and version | Resolved repository-relative passage | Contract / ownership outcome |
|---|---|---|
| RiemannianGeometry, main | `TauCetiRoadmap/RiemannianGeometry/README.md:181–218,226–298,300,717–735,1044–1065` (R1, R2, R4.7, R5a) | Scalar/tensor regularity, metric transformations, normal jets, submersion A/T formulas, round/projective normalization and Gauss equation. Keep metric-specific/corners adapters distinct from rebuilding these generic laws. HP trace normalization agrees. |
| SmoothBundlesConnections, main | `TauCetiRoadmap/SmoothBundlesConnections/README.md:315–333,498–537,871–884,1072–1086,1317–1343` (B1.1/B1.5, B3.1, B5, B6.0) | Manifold-fibre bundle charts/distributions, principal connection existence, horizontal transport and convex normal balls. B3.1 is the exact connection owner; B5 is transport. R04. Convex-ball contract uses boundaryless, Hausdorff second-countable manifolds. |
| ComplexKahlerGeometry, main | `TauCetiRoadmap/ComplexKahlerGeometry/README.md:718–726` (K5a) | Generic Fréchet section topology/completeness/atlas independence. The missing countability in the consumer is R03. The new C² metric-cone adapter can remain here. |
| SpinGeometry, main | `TauCetiRoadmap/SpinGeometry/README.md:506–534,571–593,634–689,775–790` (G5.0, G6.0, Fourier models) | `realCliffordSpinorBundle`, `realSpinDiracClosedRealization`, `realSpinDiracIndexClass`, Lichnerowicz, real grading/signs, common H¹-domain metric variation and explicit periodic/antiperiodic circles. Its point-norm bounded-transform comparison does not alone assert the consumer's stronger norm-continuity result. |
| TangentialBordism, supplied new head | `TauCetiRoadmap/TangentialBordism/README.md:223–720,1612–1688,1700–1769,2322–2461,2607–2611` (Layers2–3, §6.6, §7.1, §§10.2–10.4) | Structured cycles; `spinABSDiracIndexComparison` at1712 and `spinABSComplexificationGenus` at1740; actual transfer families, Dold models, integral point orientation/KO kernels. K3 calibration at1767. PU3⋊C2/action constructed at2381–2398: R04. Arbitrary-X KO-kernel surjectivity is explicitly not supplied and is not inferred here. |
| GeneralizedCohomology, main | `TauCetiRoadmap/GeneralizedCohomology/README.md:37,213–239,1767–1788,1824–1846` (G2.1, G5.5) | Pointed/spectral mapping-cone adapters, graded Fredholm/ABS construction and classifier comparison. Its ownership table assigns the underlying topological mapping cone to HomotopySpheres §3A; resolve the shorthand “G2's mapping-cone carrier” through that adapter rather than inventing a second cone. |
| TopologicalKTheory, main | `TauCetiRoadmap/TopologicalKTheory/README.md:1220–1268` (T7) | Clifford restriction cokernels, real coefficient ring, η²≠0, η³=ηa=2η=0, a²=4b, c(a)=2u², c(b)=u⁴ and degree table. No coefficient-normalization mismatch. |
| GeometricTopology, main | `TauCetiRoadmap/GeometricTopology/README.md:177–222,546–548` (Layer1 and framed surgery) | Boundary/gluing, tubular normal bundles and handle attachment. The previously nonexistent four declaration names are no longer cited. The handle-index bound is now owned by PSC, with the route defect R02. |
| HomotopySpheres, supplied new head | `TauCetiRoadmap/HomotopySpheres/README.md:465–545,972–1020,2372–2392,2671–2687` (§§1.2–1.7, §3C, §§8.2–8.3, §9A.1) | Handles/cancellation/slides, separately scoped Whitney moves, Toda indeterminacy/EHP, almost-framed obstruction sequence and π₇ˢ. §1.6 supplies the omitted low-dimensional Whitney contract. §9A.1 already constructs generic complex e-invariant: R04. The fixed-S⁵ Moore/μ construction remains a distinct PSC target. |
| BordismFormalGroups, main | `TauCetiRoadmap/BordismFormalGroups/README.md:329–352` (F4) | Unstable-to-stable Toda comparison with actual nullhomotopies and indeterminacy. It does not license arbitrary-member unstable recursion. |
| CharacteristicClasses, main | `TauCetiRoadmap/CharacteristicClasses/README.md:486–510,842–861` (C1.3–4, C3) | Finite faithful compact-group representations/Stiefel approximations, relative smoothing and characteristic classes. Smoothing duplication is R04; collared-base adapters may be kept explicitly. |
| Completed HopfRinow, main | `Completed/HopfRinow/README.md:521–529` | Smooth Riemannian-isometry carrier and transport, explicitly not smoothness of bare metric isometries. Thus PSC can own Myers–Steenrod; this is not a duplicated theorem. |
| LieGroups, main | `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:275–298` | Finite-dimensional real closed-subgroup theorem and automatic smoothness of continuous homomorphisms. Provides the final Lie-structure step after PSC proves no-small-subgroups/faithfulness. |
| CompactGroups, main | `TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md:338–344` | Peter–Weyl point separation for compact groups. Finite selection plus no-small-subgroups is a real additional step for Isom(F), not an assumed faithful representation. |
| IndexTheory, supplied new head | `TauCetiRoadmap/IndexTheory/README.md:725–739` (I7.1) | Euler index/Pfaffian/Gauss–Bonnet comparison. For T², the scalar integral normalization is 4πχ, as used in the table. |
| PseudodifferentialOperators, supplied new head | `TauCetiRoadmap/PseudodifferentialOperators/README.md:929,1514–1517,1617–1656` (P6 and parameter calculus) | Elliptic estimates and parameter-dependent powers/coefficient norm continuity support the bounded-transform route. The fixed-Hilbert metric/density adapters and uniform spectral gap remain explicit tasks here. |
| StringOrientation, supplied new head | `TauCetiRoadmap/StringOrientation/README.md:1255–1282` (S6.1) | Positive-Ricci Witten-genus question on closed positive-dimensional String manifolds. A separate owner/consumer, not a supplier of scalar classification. |
| Mathlib round-model API reference | README:98–100 is explicitly a design reference; actual carrier input is RiemannianGeometry R4.7 | No future Mathlib implementation is assumed. Pinned declarations, not this external proposal, determine statability. |

The tables locate actual overlap rather than relying on names. The generic bundle smoothing, connection, CP² structure group and e-invariant have existing owners (R04). The metric positivity estimates, surgery metric extension, explicitly owned handle-bound target, coherent unstable Moore extension and fixed-S⁵ μ construction are distinct work here. Board/package and provided-head searches found no additional owner for that combined unstable construction. Two or three strings containing “Moore” elsewhere referred to Moore loops, not these degree-two mapping cones. The folder is an existing roadmap being repaired; no rejection for creating a second PositiveScalarCurvature roadmap is warranted.

## Not verifiable

- **Toda, *Composition Methods in Homotopy Groups of Spheres* (1962):** the sources service and operator cache yielded no legal full text. Lemmas5.13–5.14, Proposition5.15, the requested pp.48–50, Corollary3.7 and the finite EHP tables were not checked directly. `cs13 line 360–365`, `adams line 1846–1850` and `wang-survey line 4774–4776` corroborate particular relations; they do not certify all the book locators or every integral generator normalization. The existing key `toda` is retained in the single missing-reference request with where it was sought.
- **Lawson–Michelsohn, *Spin Geometry* (1989):** no legal text was located by the sources service/cache. The README gives neither chapter nor page for its Clifford/Dirac convention citation. Key `lawson-michelsohn` remains in that same request. The pinned definitions and SpinGeometry supplier conventions were checked independently; the book comparison is unverified.
- **Stolz, *Simply connected manifolds of positive scalar curvature* (1992), Theorem A:** DOI [10.2307/2946598](https://doi.org/10.2307/2946598) resolves to the publisher/JSTOR landing rather than readable full text. Retained as uncertified, not requested again. The author's 2022 survey verifies the theorem statement but does not certify the 1992 proof.
- **Version and scope limits:** Crowley–Schick was checked as arXiv:1204.6474v4, not by silently assigning its preprint pages to the journal version. Open-roadmap ownership beyond the supplied sibling files was not checked. The future constructions are plans, not completed proofs; source access and instance calculations do not establish their unformalized general theorems.

The review is complete despite these access limits. No acceptance is claimed conditional on inaccessible text; the explicit P2 findings independently require changes. No source file or extraction was put into the roadmap, package or report, and no manifest was changed.

## Source issues

- **Error** in gl80 at formulas (1) and (1′), printed pp.427 and429: the source says the mixed principal-curvature contribution has coefficient −(n−1)k or −(q−1)k; it should be −2(n−1)k or −2(q−1)k because scalar curvature sums ordered pairs; affects the proof.
- **Error** in gl80 at the Dold-manifold paragraph in the proof of Corollary C, printed p.433: the source says the descended product metric has positive sectional curvature; it should be nonnegative sectional curvature with zero mixed planes, and positive scalar curvature for the generators used; affects a stated result.
- **Misprint** in cs13 at §2.3, proof of Lemma2.14, arXiv v4 p.8: the source says the Toda bracket lands in S^c and writes reversed composition terms; it should be a subset of [S^(a+1),S^d], with indeterminacy w_*[S^(a+1),S^c]+(Eu)^*[S^(b+1),S^d]; affects the proof.
