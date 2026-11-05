# Review of PDE (pull request #93 at fd8e87f)

**Verdict:** needs changes

🤖 Independent AI review. Eleven findings, eight blocking (two P1 and six P2). The recorded gate passes. The submitted Lean file elaborates without diagnostics; that does not certify the proposed PDE theorems, none of which it states. The review is complete as a review; source certifications that could not be completed are listed below, without treating inaccessible text as evidence.

## R01 (P1) — Break the PDE–GeometricMeasureTheory supply cycle

**Location:** `TauCetiRoadmap/PDE/README.md:466` and `:589`: “consume GMT G2's area formula”.

**Claim:** PDE A6 and C13 consume GeometricMeasureTheory, while that roadmap consumes PDE A1–A3 and A5–A6. Separating G2 from G6 within the supplier does not meet the required single direction of supply between roadmaps.

**Witness:** `TauCetiRoadmap/GeometricMeasureTheory/README.md:57–61` consumes PDE Sobolev theory; `:279–282` consumes PDE traces. PDE `README.md:466` consumes its G2. The two directed roadmap edges form a cycle of length two.

**Repair:** Move the general Lipschitz area/graph-measure input to an independent earlier owner, then have both roadmaps consume it, or explicitly transfer that general input to PDE and make GMT import it. Do not duplicate G2 or resolve this by ignoring the reverse edge. On the displayed two-node instance, the repaired graph must have only one direction between PDE and GMT. The mechanical check below misses this cycle; it is not evidence that these prose edges are absent.

## R02 (P1) — The interval-operator supplier exists only in an inadmissible revision

**Location:** `TauCetiRoadmap/PDE/README.md:384–387`: “existing interval-derivative partial operator in OperatorTheory/UnboundedOperators”.

**Claim:** A1 promises comparison with an existing separately owned operator, graph, adjoint and boundary realizations. On the authorized main copy, that sub-roadmap is absent. It appears in the supplied open revision of the already existing OperatorTheory roadmap, which this brief explicitly disallows as a dependency.

**Witness:** Main `TauCetiRoadmap/OperatorTheory/README.md:31–64` lists its sub-roadmaps but no UnboundedOperators. The open revision's `OperatorTheory/UnboundedOperators/README.md:59` supplies the claimed interval comparison; the corresponding main file does not exist.

**Repair:** Replace the asserted supplied contract with a precise declared gap naming the responsible owner and the H¹ interval derivative, graph/adjoint and boundary-domain comparison required, or cite an actual main/pinned producer. Keep A1's own AC-representative theorem independent. For u(x)=x on (0,1), specify that the maximal derivative has value 1, while u is outside the two-zero-trace minimal domain; the eventual comparison must distinguish those domains. A broken supplier cannot be repaired by citing the revising pull request.

## R03 (P2) — Rebase the construction inventory on the pinned PDE library

**Location:** `TauCetiRoadmap/PDE/README.md:318–326`, `:376–378`, `:414–417`, `:450–456`, `:623–627`, `:1422–1423`.

**Claim:** The README still asks contributors to construct weak Sobolev carriers/completeness, zero-boundary spaces, finite-p zero-boundary Poincaré/Rellich and basic coercive Dirichlet existence as missing work. These objects and substantial portions of those targets already exist at the actual Tau Ceti pin. The finite-p density citations alone do not resolve that duplication.

**Witness:** At the pin, `TauCeti/Analysis/Sobolev/Wkp/Basic.lean:145,165` defines Wkp and completeness; `W1p/Zero.lean:246` gives completeness; `RellichKondrachov.lean:141` gives compactness; `Analysis/PDE/DirichletProblem.lean:292` proves the stated L² coercive existence theorem.

**Repair:** Cite the implemented cases in scope/supplier contracts and retain only explicit extensions: arbitrary-open higher-order density, domain trace/extension, endpoint cases, dual forcing/liftings, variable-coefficient regularity and the genuinely new evolution results. Preserve the pinned pointwise operator-bound ellipticity predicate and state the new a.e. inverse-coercivity adapter separately. Do not identify their upper constants: for [[1,−1],[1,1]], the operator bound is √2 whereas inverse coercivity requires upper parameter 2. The resulting plan must reuse the existing carrier on this example and on k=0, where Wkp is native Lp.

The same inventory correction applies to B8's Lebesgue differentiation corollary: `VitaliFamily.ae_tendsto_average`, `Mathlib/MeasureTheory/Covering/Differentiation.lean:855`, already supplies the general theorem. Basic DGNM at n>2, finite-p Morrey, and portions of fundamental-solution theory also exist; their precise ranges are recorded below rather than claimed to cover all proposed extensions.

## R04 (P2) — State the statable headline theorems

**Location:** `TauCetiRoadmap/PDE/Suggested.lean:36–50`, `:78–80`, `:83–284`.

**Claim:** The docstring postpones PDE statements until their types exist, but native weak Sobolev spaces, energy forms and duals already exist. The file instead contains 32 parabolic-coordinate declarations and zero admitted headline theorems. In particular D18's full adjoint-kernel compatibility theorem is statable now.

**Witness:** A scratch D18 theorem using native `TauCeti.W1p0`, `energyFormH1L0`, `StrongDual`, bounded Ω and a quantified Gårding bound elaborated successfully at these pins, with only the intended `sorry` warning.

**Repair:** State the genuinely new statable headlines on native carriers, including full dual-forcing Fredholm compatibility, and audit the other headlines listed below. Cite already proved special cases instead of adding one-lemma restatements. Name each genuinely unstatable headline and its missing carrier in the module docstring. The tested D18 signature has conclusion `(∃ u, ∀ v, B u v = ℓ v) ↔ ∀ w, (∀ v, B v w = 0) → ℓ w = 0`; all hypotheses remained in its elaborated type. The nonsymmetric 2×2 witness in the table distinguishes the adjoint kernel from the original kernel.

## R05 (P2) — Resolve duplicate ownership of the dyadic Besov foundation

**Location:** `TauCetiRoadmap/PDE/README.md:968–979` (X0).

**Claim:** X0 declares ownership of the smooth dyadic partition, Besov carrier, cutoff independence and Fourier/Bessel comparisons without resolving the same generic constructions in the provided PseudodifferentialOperators proposal. That proposal first builds the Euclidean dyadic theory and only then transports it to bundles; the overlap is not just a different manifold application.

**Witness:** `TauCetiRoadmap/PseudodifferentialOperators/README.md:497–515` defines the dyadic Besov carrier, partition, reconstruction, cutoff equivalence and Bessel comparisons, then separately derives bundle versions. Its `:46–50` consumes PDE harmonic analysis.

**Repair:** Record one owner for the shared Euclidean dyadic/Besov construction and arrange the other roadmap to import it. A compatible direction is PDE owning this prerequisite, with PseudodifferentialOperators retaining interpolation/bundle adapters and consuming X0; explicitly record that ownership transfer. Do not add a reverse PDE dependency on its consumer. For a single annular Fourier block at frequency 2^j, both interfaces must give the same `2^(js)‖P_j f‖_p` contribution, not independently defined carriers with no comparison.

## R06 (P2) — State the operator hypothesis behind Calderón–Zygmund boundedness

**Location:** `TauCetiRoadmap/PDE/README.md:492–497`: “standard kernel bounds”.

**Claim:** Kernel size/smoothness bounds alone do not imply the promised weak-(1,1) and Lp operator bounds. If “CZ operator” is intended to include L² boundedness by definition, that definition and quantitative bound must be stated; the text currently supplies only the kernel condition.

**Witness:** On ℝ, T f(x)=x f(x) has off-support kernel K=0, satisfying every standard kernel estimate. For f=1_[R,R+1], ‖f‖₂²=1 but ‖Tf‖₂²=R²+R+1/3, unbounded as R increases.

**Repair:** Specify a linear L²-bounded operator associated off the diagonal with a standard kernel, including the L² bound in the constants, or state and own an explicit cancellation/testing theorem yielding that bound. The multiplication witness then fails the required global L² hypothesis; the Hilbert transform passes. Define the endpoint BMO conclusion on its proper quotient/normalization. This is a hypothesis repair, not a request to weaken the general CZ theorem.

## R07 (P2) — Exclude the empty domain when asserting a first eigenvalue

**Location:** `TauCetiRoadmap/PDE/README.md:642–645`, `:1361–1362`.

**Claim:** The standing bounded-open domain assumption allows Ω=∅, but the acceptance criterion asserts a positive first Dirichlet eigenvalue. There is no first eigenvalue on the zero Hilbert space.

**Witness:** Ω=∅ gives L²(Ω)=H¹₀(Ω)={0}. Every alleged eigenvector is 0, so the point spectrum is empty, whereas Ω=(0,π) has first eigenpair (1,sin x).

**Repair:** Require Ω.Nonempty for the enumerated spectrum and first-eigenvalue conclusions (with the standing positive dimension). Keep the zero-space spectral decomposition as the empty-basis case. The repaired positive theorem applies to (0,π) and excludes ∅; add both as Checks.

## R08 (P2) — Account for the dimension restriction in the weak Hopf source

**Location:** `TauCetiRoadmap/PDE/README.md:550–562`, under the standing n≥1 convention at `:114`.

**Claim:** C13 says its weak divergence-form Hopf milestone carries Rosales's theorem contract, but omits the source's standing n≥2 assumption. Unlike E23, C13 names no separate one-dimensional producer. The source citation therefore does not support the full stated range.

**Witness:** `rosales` line 94 assumes n≥2 for the paper. At n=1 the roadmap permits q=3/2, hence q/2=3/4; Rosales's n≥2, q>n setup instead forces q>2.

**Repair:** Retain n≥2 on the source-derived theorem and separately state/prove the n=1 flux/ODE version with the integrability assumptions needed for its weak lower-order products. This keeps the general programme rather than silently discarding the interval case. For a=1 and b=c=d=0 on (−1,1), u=x+1 has boundary value 0 at −1 and inward quotient h/h=1: the interval producer must include it, while the cited n≥2 theorem must not pretend to apply. Add this as a dimension-control Check.

## R09 (P3) — Give the sampled targets exact source locators and records

**Location:** `TauCetiRoadmap/PDE/README.md:968–1339`, `:1375–1418`.

**Claim:** X0–X3 have no theorem/page locators at their claims; X2 has no mathematical source locator at all. Keel–Tao is named in the construction-order paragraph but has no bibliography entry. The quantization source is not identified separately from stochastic Navier–Stokes. No `sources.toml` exists.

**Witness:** X1's exponent ranges match Keel–Tao Theorem 1.2, printed p.956 (`keel-tao` line 98), and Tao Theorem 2.3, printed p.74 (`tao` line 3856); neither locator appears in X1.

**Repair:** Attach exact version, theorem/section and printed-page locators to each target, with the generality adjustments spelled out; record each work once in `sources.toml`. In particular separate X0, X2, Krylov, quantization and Navier–Stokes references. Distinguish a new extension to prove from what its cited theorem already supplies. Preserve unavailable works as uncertified rather than guessing. For the d=3 Schrödinger endpoint (2,6), the cited admissibility equation reads 1+1/2=3/2; for the excluded d=2 pair it reads 1=1 but is expressly excluded, so the locator must retain that exception.

Correct `TemperedDistribution.memSobolev` to the actual predicate `TemperedDistribution.MemSobolev` in the inventory/docstring; the lowercase root predicate is not the pinned declaration. Likewise the Lax–Milgram equivalence is `IsCoercive.continuousLinearEquivOfBilin`, not the docstring’s `InnerProductSpace.continuousLinearEquivOfBilin`. The source audit below gives verified alternatives and retrieval limits.

## R10 (P3) — Supply the required per-definition API, Checks and dependency structure

**Location:** `TauCetiRoadmap/PDE/README.md:1–16`, `:372–501`, `:746–987`; `Suggested.lean:3–9`, `:85–284`.

**Claim:** The document lacks the required Summary, Scope and ownership, Exact supplier contracts and numbered layer structure; no `*Needs:*` lines occur. Most definitions have no list of three discriminating Checks. The global seven-item acceptance list cannot test Wkp, trace, Hölder spaces, Besov spaces, Wick fields and the stochastic integral individually. The Lean docstring describes suggested forms rather than headline acceptance tests, and most own Lean names never appear in the README.

**Witness:** A7 introduces three space variants at `README.md:470–479` without any Checks; X0 introduces homogeneous/inhomogeneous/little Besov spaces at `:972–983` without Checks. `ParabolicSpaceTime.ofCoords` is declared in Lean but never named in the README.

**Repair:** Reorganize the retained mathematics into the required sections, retaining stable lane IDs as aliases if consumers need them. Give each definition its API and at least three discriminating computed examples, each target its own dependencies and locator, and each layer Examples/Dependencies. Align the retained Lean names and layer comments. For the metric, use d((0,0),(3,4))=5, d((0,0),(0,4))=2, and reversal T=10 sending times 0,4 to 10,6 while preserving distance 5. These exclude the ordinary product metric and an un-snowflaked time factor.

## R11 (P3) — Delete the coordinate API padding from Suggested.lean

**Location:** `TauCetiRoadmap/PDE/Suggested.lean:124–173`, `:179–206`, `:220–282`.

**Claim:** The file is an implementation/API catalogue rather than an acceptance test. Its coordinate projections, metric identities, slab/subtype equivalences and time-reversal facts are supporting API or Checks, not PDE headlines. Proving them already does not make them appropriate headline targets.

**Witness:** Nine declarations already end in `rfl`, including `coordsHomeomorph_apply` and `timeReverse_time_val`. `dist_eq_parabolicDist` is one `simpa` from `WithLp.prod_dist_eq_add` (`Mathlib/Analysis/Normed/Lp/ProdLp.lean:256`). There are no sorried theorems to probe.

**Repair:** Delete these API declarations from `Suggested.lean`; keep their mathematical requirements/Checks in the README and retain only simple definitions actually needed by a kept headline. Do not replace them with admitted versions or “prove them in place”. On coordinates (3,4), the projection equations compute 3=3 and 4=4; retaining those facts cannot test existence or regularity for a PDE. At most a handful of genuinely nontrivial proved examples may accompany retained definitions.

## Verified sound

The following are positive checks and their limits, not a claim that numerical examples prove all analytic theorems.

**Scope and gate.** HEAD is the requested `fd8e87f487e4d618bbb3d2aade79412119eadd0a`. The diff outside PDE is empty. Only README.md and Suggested.lean change in this pull request's PDE diff (960/118 and 45/5 added/deleted lines). No source passages, computational algorithm, sorry'd data, `set_option`, custom axiom, extra import or admitted example was found in the two reviewed files. Main already contains PDE, including F27; this is a repairable revision rather than a replacement of the entire existing roadmap, so the verdict is needs changes rather than rejected. Main CompactOperators, OperatorTheory and the completed OrthogonalL2Bases were consulted for surrounding form/ownership.

The worker's complete gate result was:

```text
gate PDE: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

I independently ran the specified movable dependency command. Its complete output was:

```text
depcheck: 162 roadmaps, 1176 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line was printed. R01 is the manually resolved prose cycle that this output misses. No finding is based merely on a roadmap being absent from the order. `roadmaps resolve` reported no unresolved names, but explicitly did not inspect pinned Lake libraries; its success does not settle the library inventory or the admissibility of a revising supplier.

**Lean checks.** The prescribed absolute-path elaboration of the unchanged Suggested.lean exited 0, with no warnings. I generated and elaborated `#check @name` for all **32 actual declarations**: 2 abbreviations, 9 definitions and 21 proved theorems. No declaration lost a required binder; the file has no standing completeness or ellipticity hypothesis to lose. The supplied 34-declaration transcript includes two erroneous comma-named matches inside prose comments; the regenerated transcript eliminates these parser artifacts. A targeted build of `TauCeti.Analysis.PDE.DirichletProblem` succeeded before the additional scratch headline probe; that probe then elaborated with only `sorry`. No full Lake build or dependency update was run. No tracked worktree file was changed.

**Headline inventory and coverage.** README end/deep results are A1 completeness and A2 density; A3 Bessel comparison; A4 embeddings and A5–A6 Poincaré/trace/extension/Rellich; B8–B11 maximal/interpolation/CZ/multiplier/Gehring/BMO–VMO results; C12–C15 harmonic characterization, maximum/Hopf/ABP, Harnack and potentials/Perron; D17 coercive solvability, D18 full Fredholm compatibility and D19 Dirichlet spectral decomposition; E20–E26 elliptic H²/Higher Sobolev, Meyers/VMO, divergence Schauder, DGNM, Krylov–Safonov and non-divergence Schauder/CZ; F24–F26 the Gelfand energy identity, parabolic existence and heat realization; F27.2–F27.6 classical parabolic isomorphisms, BUC traces, higher orders and weighted/backward versions; X1 Schrödinger/wave Strichartz; X2 nonlinear fixed-point existence and regularity; X3 analytic Lp SPDE solvability, Φ⁴₂ and the two stated stochastic Navier–Stokes regimes. **Zero** is stated as a headline theorem in Suggested.lean. D18 is demonstrated statable. Many A/D/E signatures are expressible using pinned carriers, with already implemented cases to cite rather than restate. The full Lipschitz trace/extension, bundled parabolic Hölder, dyadic Besov/enhanced-noise and cylindrical stochastic solution packages are missing ingredients for several later bundled statements; the docstring must identify them individually rather than defer all targets together.

**Pinned declarations opened.** Pins were checked against the manifest and checkout HEADs: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following 19 entries give concrete positive evidence, including limits:

| Object / declaration | File and line at its pin | What the declaration actually supplies |
| --- | --- | --- |
| `IsCompactOperator.hasEigenvalue_or_mem_resolventSet` | `Mathlib/Analysis/Normed/Operator/Compact/FredholmAlternative.lean:164` | Complete normed space, compact T, μ≠0; eigenvalue-or-resolvent. It does not alone state the inhomogeneous adjoint-kernel formula. |
| `IsCoercive.continuousLinearEquivOfBilin` | `Mathlib/Analysis/InnerProductSpace/LaxMilgram.lean:105` (application law :109) | Coercive continuous bilinear form on a complete real Hilbert space; no symmetry requirement. |
| `TemperedDistribution.besselPotential`, `MemSobolev` | `Mathlib/Analysis/Distribution/Sobolev.lean:73,153` | Fourier multiplier convention and native Sobolev predicate, not a domain trace theory. |
| `TestFunction` support/smoothness API | `Mathlib/Analysis/Distribution/TestFunction.lean:125–129` | Smoothness, compact support and support inside Ω. |
| `VitaliFamily.ae_tendsto_average` | `Mathlib/MeasureTheory/Covering/Differentiation.lean:855` | Locally integrable Banach-valued functions and a Vitali family. |
| `ContinuousLinearMap.orthogonalComplement_iSup_eigenspaces_eq_bot` and `finite_dimensional_eigenspace` | `Mathlib/Analysis/InnerProductSpace/Spectrum.lean:441,461` | Compact symmetric spectral ingredients; the zero space has an empty eigenbasis. |
| `WithLp.prod_dist_eq_add` | `Mathlib/Analysis/Normed/Lp/ProdLp.lean:256` | p-dependent product formula, specializing to addition at p=1. |
| `HolderWith.restrict_iff` | `Mathlib/Topology/MetricSpace/Holder.lean:248` | Exactly the restriction/subtype equivalence used by the file. |
| `eHolderNorm`, `MemHolder` | `Mathlib/Topology/MetricSpace/HolderNorm.lean:51,60` | Extended seminorm and existence of a finite Hölder constant; boundedness of the function is separate. |
| `TauCeti.Wkp`, `Wkp.instCompleteSpace` | `TauCeti/Analysis/Sobolev/Wkp/Basic.lean:145,165` | All natural orders, p≥1, real finite-dimensional domain and additive Haar measure; k=0 is Lp. |
| `TauCeti.W1p.valueL`, `W1p.gradientL`, `W1p0.valueL` | `TauCeti/Analysis/Sobolev/W1p/Basic.lean:383,394`; `W1p/Zero.lean:161` | Native continuous value/gradient maps, not classical pointwise representatives. |
| `TauCeti.W1p.dense_contDiffOn_representatives` | `TauCeti/Analysis/Sobolev/W1p/MeyersSerrin.lean:216` | Arbitrary open domain, finite p; agrees with A2's restriction. |
| `TauCeti.Wkp.dense_contDiff_representatives`, `wkp0Submodule_top_eq_top` | `TauCeti/Analysis/Sobolev/Wkp/SmoothDensity.lean:93`; `Wkp/Density.lean:130` | Whole-space density/closure equality, finite p. |
| `TauCeti.W1p.norm_value_le_mul_norm_gradient_of_subset_slab` | `TauCeti/Analysis/Sobolev/Poincare/W1p0.lean:92` | Finite-p zero-boundary estimate with explicit enclosing geometry. |
| `TauCeti.W1p0.isCompactOperator_valueL` | `TauCeti/Analysis/Sobolev/RellichKondrachov.lean:141` | Bounded open Ω and finite p for the zero-boundary space; not general domain W¹,p. |
| `TauCeti.PDE.UniformlyEllipticOn` | `TauCeti/Analysis/PDE/Ellipticity/Basic.lean:474` | Pointwise lower quadratic and upper mixed bounds; not the new a.e. inverse-bound convention. |
| `TauCeti.PDE.IsWeakSolutionDirichlet`, `existsUnique_isWeakSolutionDirichlet` | `TauCeti/Analysis/PDE/DirichletProblem.lean:175,292` | L² forcing, H¹₀ carrier, bounded coercive weak form; no boundary regularity needed for this formulation. |
| `IsCompactOperator.finiteDimensional_ker_one_sub`, `isClosed_range_one_sub`, `finiteDimensional_quotient_range_one_sub` | `TauCeti/Analysis/Normed/Operator/Compact/RieszTheory.lean:161,173,194` | Existing generic compact-perturbation inputs for D18. |
| `TauCeti.PDE.exists_holderOnWith_preciseRepresentative` | `TauCeti/Analysis/PDE/Regularity/HolderContinuity.lean:76` | Quantitative homogeneous scalar Hölder representative with a finite Sobolev exponent satisfying pstar⁻¹+n⁻¹=1/2, hence n>2; L² norm, thickening radius and operator-bound ellipticity. |

Object searches also found finite-p Morrey at `TauCeti/Analysis/Sobolev/W1p/Morrey.lean:156`, its Hölder map at `HolderEmbedding.lean:157`, and constant-coefficient interior regularity in `TauCeti/Analysis/PDE/Regularity/Interior.lean:585`; these do not prove the entire variable-coefficient E20 target. No Riesz–Thorin or Marcinkiewicz theorem was found in the pinned Mathlib analysis/measure-theory object search. This supports that particular inventory claim, not a claim that no external implementation exists.

**Resolved roadmap contracts and ownership.** Nine supplier/consumer groups were inspected directly, using main for existing roadmaps and the supplied heads for new proposals:

| Citation | Resolved content and direction |
| --- | --- |
| GeometricMeasureTheory G2–G6 | Main `README.md:148–181` contains area/coarea and graph-measure formulas; `:183–298` contains BV and trace comparison. The consumed results exist, but the two directions are R01. |
| Isoperimetry I3/I5 | Main `README.md:182–209,301–351` owns sharp periodic Wirtinger and sharp BV Sobolev/equality. PDE's nonsharp scope distinction is correct; these are ownership deferrals, not prerequisites. |
| BanachAlgebras A8 | Main `README.md:1148–1158` is precisely real Schauder on nonempty closed bounded convex C with relatively compact image. X2's sup-norm ball fits it. |
| AlgebraicTopology Stage 2.7 | Main `README.md:393–445` owns finite-dimensional Brouwer and explicitly leaves Schauder to BanachAlgebras. No duplicate fixed-point engine is needed in X2. |
| OneParameterSemigroups Part A | New proposal `README.md:93–183` supplies generators/resolvents, Hille–Yosida and Lumer–Phillips, real Banach spaces included. F26's heat realization is distinct. |
| OperatorTheory | Main `README.md:107–143` supplies the shared LinearPMap/resolvent boundary and zI−A convention. The separate UnboundedOperators citation fails the eligible-version test (R02). |
| VariationalMethods V1.4/V2.3/V2.4/V4.1/V5.1/V5.2 | New proposal `README.md:178–199,236–323,378–432,435–490` supplies the named abstract direct-method, complex/shifted-form, ordered-minimum and represented-operator contracts. Its PDE paragraph describes PDE as a consumer; that paragraph alone is not a reverse dependency. |
| StochasticCalculus | New proposal `README.md:165–166` excludes general SPDEs/infinite-dimensional noise; S1 and S2 onward build Brownian/integral/localization inputs. PDE may own X3's cylindrical extension, but must cite the exact consumed sections rather than undefined “SC”. |
| PseudodifferentialOperators P5 | Supplied head `README.md:497–515` overlaps X0's dyadic/Besov foundations (R05); later bundle retractions are distinct. |

The required `roadmaps grep` object search covered weak Sobolev carriers, interpolation, dyadic/Besov/paraproduct theory, compact-map fixed points and cylindrical integration across indexed open work and main; board package README/signature searches were also run. Relevant supplied sibling files were opened rather than trusting matches. The search surfaced IncompressibleFlows, but its files are not authorized in the brief, so ownership against that proposal was **not checked** and no finding depends on it. No duplicate fully qualified PDE Lean name was found in the supplied sibling scope; structural duplication remains R05. No ownership is claimed for all unprovided open files.

**Seeded source sample.** No target is explicitly marked “unverified” in the README. The seven requested samples were handled as follows; source keys below refer to the sources-service extractions, not web snippets.

| Sample | Text inspected, locator, and result |
| --- | --- |
| Fredholm alternative for compact operators | Pinned Mathlib file :156–166; true with completeness and μ≠0. Full PDE adjoint compatibility is an additional target, with generic Tau Ceti inputs listed above. |
| Carleson project | `carleson` line 35 defines the uncentered maximal function; lines 210–231 prove weak (1,1); lines 297–325 prove strong bounds. Weak type requires the doubling/Borel/separable setting; strong type has proper/open-positive/local-finiteness hypotheses. Euclidean Lebesgue measure fits. No external code was run or compiled. The repository was not pinned by the README, so this verifies the retrieved text, not a frozen migration revision. |
| X0 shared analytic spaces | No exact locator is supplied. Definitions/products were tested below; the generic ownership conflict was resolved to PseudodifferentialOperators P5. The full space-theory source claim remains uncertified. |
| X1 Schrödinger and wave | `keel-tao` lines 80–144, Definition 1.1 and Theorem 1.2, printed p.956, explicitly distinguish sharp/nonsharp admissibility and untruncated/truncated decay. `tao` lines 3856–3892, Theorem 2.3, printed pp.74–75, supports Schrödinger including the excluded pair; the text uses Δ/2, requiring time rescaling. `tao` lines 4023–4064, Theorem 2.6, printed pp.77–79, is a finite-r wave theorem, not the universal spatial-infinity Besov statement by itself. The localized TT* plus ℓ¹ reconstruction route in X1 is therefore substantive additional work. |
| X2 actual compact map | No primary mathematical locator supplied. BanachAlgebras A8 is a valid theorem contract; the uniform-coefficient, energy and Hölder-compactness deductions and the radial truncation were checked below. The global boundary DGNM/Schauder source remains uncertified. |
| X3 analytic Lp and both DPD models | No theorem/page locators supplied. Krylov could not be retrieved; stochastic Navier–Stokes resolved to a paywall. Quantization's apparent PDF retrieval was actually an error page, and the institutional alternative returned 403. Covariance, Wick and invariant-density computations below are independent checks, not certification of those existence theorems. |
| “Lane A comes first” | This is a dependency assertion rather than a literature theorem. A2/A6→D17 is a valid analytic route, but its missing-carrier premise is stale at the pin (R03/R04), and the A6↔GMT ownership requires R01. No theorem/page is invented for this slogan. |

Additional source checks: `degiorgi-code` lines 25–41 verify the named `holder_Moser` unit-ball, n>2, p₀>1, representative and quantitative-norm contract; the README correctly makes rescaling and n=1,2 additional work. `rosales` lines 521–538 (Theorem 4.1, preprint p.9) and 854–858 (Remark 4.2, preprint p.13) verify the n≥2, Hölder a,b, Lq c, L^(q/2)∩L^(1,α) d, weak nonpositivity, boundary symmetry and liminf distinctions. The omitted dimensional restriction is R08. The exact Morrey exponent should be written in C13, not just “a Morrey-space bound”. The Armstrong–Kempe and Meyers papers were also fetched legally; a complete dependency/axiom audit of the external DeGiorgi repository was not performed, so its global “sorry-free, no custom axioms” advertisement is not certified here.

**Adversarial mathematics table.** There are 108 mathematical/programme rows below and 32 declaration rows afterward (140 total). Each row records actual values or an explicit quantified obstruction. “Pass” means the displayed test agrees; source/general-proof limitations above still apply. Unrelated arithmetic/group degeneracies do not apply to these real Euclidean analytic carriers. Values at empty domains, dimension zero, p=∞, disconnected domains, zero modes, total division at zero and resonance were included where meaningful.

| Statement / location | Instances tried | Computed values on the two sides | Result / change |
| --- | --- | --- | --- |
| Standing n convention, :114–116 | n=0, singleton Euclidean space, u=1 | Gradient norm 0; function norm 1. A positive-domain Poincaré assertion would read 1≤0. | Pass: excluded from elliptic inequalities; retain function-space case. |
| Inverse ellipticity and conversions, :128–147 | A=I; A=[[1,−1],[1,1]]; A=0 | I gives quadratic/inverse bounds 1,1. Skew example gives ξ·Aξ=‖ξ‖², ξ·A⁻¹ξ=‖ξ‖²/2, ‖A‖=√2. Zero gives 0<λ contradiction. | Pass; R03 requires separate native adapter. |
| Symmetric/non-divergence reduction, :258–264 | A above, Hessian diag(2,0) | A:Hess=2; sym(A):Hess=2. Antisymmetric contribution 0. | Pass. |
| Divergence antisymmetric part, :258–264 | A(x,y)=[[1,−x],[x,1]], u=y | A∇u=(−x,1); div=−1. sym(A)∇u=(0,1); div=0. | Pass: cannot discard skew part. |
| Fourier/Laplacian/Bessel convention, :251–256 | mode exp(2πix) | Δ multiplier −4π²; 1−(2π)⁻²Δ multiplier 2; order-s Bessel multiplier 2^(s/2). | Pass. |
| Weak derivative A1 | u=x², φ compactly supported | ∫x²φ′=−∫2xφ; derivative is 2x, whereas candidate 0 leaves nonzero right side for φ supported in x>0. | Pass; existing carrier R03. |
| AC interval identification A1 | u=x; u=√x on (0,1) | x has derivative 1 and H¹ norm² 4/3. √x is AC but derivative squared integral (1/4)∫dx/x=∞. | Pass; R02 affects operator comparison only. |
| Wkp completeness A1 | k=0, p=2; zero function | Wkp₀ norm equals L² norm; zero jet has every component 0. | Existing theorem; R03. |
| Closure Wkp0 A2 | Ω=∅; ℝ, p=∞, u=1 | Empty-domain space {0}; distance from 1 to every compactly supported function in L∞ is at least 1. | Pass: no infinity whole-space density. |
| Smooth density A2 | p<∞ versus ∣x∣ on (−1,1), p=∞ | Mollification derivative errors vanish in finite Lp; continuous derivative cannot uniformly approximate the jump −1/+1 with error <1. | Pass: finite-p restriction essential. |
| Higher-order A2 on arbitrary Ω | k=2, u=x² on (0,1) | Jet (x²,2x,2) has finite norms; mollification on an interior patch preserves the polynomial derivatives. | Pass local test; arbitrary-domain global density remains a target. |
| A3 Sobolev/Bessel agreement | k=0; Gaussian Fourier data | At k=0 both conditions are Lp. At p=2, integer k weights are (1+‖ξ‖²)^k versus equivalent polynomial derivative weights, not necessarily equal norms. | Pass as space agreement, not isometry. |
| A4 subcritical embedding | n=3,p=2, u_ε=ε^(−1/2)φ(x/ε) | p*=6; L⁶ norm and gradient L² norm both scale ε⁰. | Pass. |
| A4 Morrey, p=∞ and critical endpoint | n=1,p=2; u=log log(e/r) near 0 in n=2 | Morrey α=1/2. Critical example has gradient squared radial integral comparable to ∫dr/(r log²(e/r))<∞ but sup u=∞. | Pass: no critical L∞ assertion. |
| A5 zero-boundary Poincaré | u=sin x on (0,π); φ_R(x)=φ(x/R) on ℝ | On interval both L² norms squared π/2. On ℝ norm/gradient-norm ratio grows as R. | Pass. |
| A5 mean-zero/componentwise | two equal disjoint balls, u=+1 and −1 | Global mean 0; gradient 0; Lp norm positive. Componentwise subtraction gives 0 on both balls. | Pass: connectedness/uniform components explicit. |
| A5 Sobolev–Poincaré scaling | u=x₁ on B_R, 1≤p<n | Both norms scale R^(n/p): left R^(1+n/p*)=R^(n/p), right R^(n/p). | Pass. |
| A6 trace and kernel | u=1; u=x(1−x) on (0,1) | Traces (1,1) and (0,0). Second function's derivative tends to ±1, so its W¹,∞ distance from compact-support smooth functions is ≥1. | Pass: infinity kernel equality excluded. |
| A6 extension and Rellich | u_j=sin(jx)/j on (0,π) | ‖u_j‖₂²=π/(2j²)→0; ‖u_j′‖₂²=π/2. | Pass compactness test; existing W0 case R03. |
| A6 Lipschitz-domain charts | half-space; slit plane locally near slit | Half-space graph function 0 has Lipschitz constant 0; interior lies on one side. A two-sided slit neighborhood cannot equal a single one-sided graph region. | Pass definition test; R01 supply cycle. |
| A7 finite-norm Hölder versus local | u=1; u=x on ℝ | Constant has sup norm 1, seminorm 0. x is locally Lipschitz but has sup norm ∞. | Pass distinction; missing Checks R10. |
| A7 Campanato characterization | u=x on B_R⊂ℝ | Mean 0; ∫(u−mean)²=2R³/3. Normalized mean-square oscillation=R²/3, Hölder exponent 1. | Pass scaling test; exact normalization/ranges still need specification. |
| B8 maximal function | f=1_[0,1] on ℝ | Uncentered Mf=1 on (0,1), Mf(x)=1/x for x>1. Tail level-set size grows as 1/t; ∫_1^∞Mf=∞. | Pass weak-(1,1), not strong-(1,1). |
| B8 Lebesgue differentiation | f=1_[0,1], x=1/2; boundary x=0 | Small symmetric averages equal 1 at 1/2 and 1/2 at 0. Exceptional boundary is null. | Pass a.e.; already native, R03. |
| B9 interpolation | identity on finite probability space | Endpoint operator norms 1; interpolated bound 1^(1−θ)1^θ=1. | Pass basic test; full theorem locator missing. |
| B10 CZ decomposition | f=2·1_[0,1], height 1 | A bad interval [0,2] has average 1; remainder integral 2−2=0, preserving total integral 2. | Pass cancellation test; exact construction still needed. |
| B10 CZ operator bound | Tf=xf, f=1_[R,R+1], K=0 | Input L²²=1; output L²²=R²+R+1/3. | Fails kernel-only interpretation; R06. |
| B10 Mihlin multiplier | m=1; m=sign ξ in d=1 | Identity norm 1; away from 0 all derivatives of sign vanish, giving bounded multiplier data and the Hilbert-transform example. | Pass: derivatives must be specified away from 0. |
| B11 Gehring | f=1; f=x^(−a) on (0,1) | Constant reverse-Hölder ratio 1. ∫f^q=1/(1−aq) if aq<1, ∞ otherwise. | Pass: gain cannot be arbitrary. |
| B11 BMO/VMO | constants; step 1_(0,∞) on symmetric interval | Constant oscillation 0; step mean 1/2, mean absolute oscillation 1/2 at every radius. | Pass: step BMO but not VMO; constants require quotient/normalization. |
| B11 commutator | b constant, arbitrary linear T | bTf−T(bf)=0, BMO seminorm(b)=0. | Pass necessary normalization test. |
| C12 mean value and smoothness | u=x₁; u=‖x‖² | Ball average of x₁ at 0 equals 0=u(0). Ball average of ‖x‖² is nR²/(n+2)>0=u(0); Δ=2n. | Pass. |
| C13 classical weak/strong maximum | u=x²−1 on (−1,1); u=1−x² | First has −u″=−2≤0 and maximum 0 on boundary; second has −u″=2 and interior maximum 1. | Pass sign test. |
| C13 classical Hopf | u=−x on (0,1), boundary 0 | Outward ν=−1; (u(0)−u(t))/t=1 for t>0. | Pass liminf/derivative orientation. |
| C13 rough-coefficient Hopf control | s=2, a=e_r⊗e_r+4e_θ⊗e_θ, u=r²sinθ | div(a∇u)=(s²−4)r^(s−2)sinθ=0; along inward normal u(t)=t², quotient t→0. | Pass counterexample: no rough-coefficient Hopf. |
| C13 weak Hopf dimension | n=1,q=3/2 versus n=2,q>2 | Roadmap permits n=1 and q/2=3/4; source condition n≥2 evaluates false. For u=x+1 on (−1,1), inward quotient is 1. | R08: explicit interval producer needed. |
| C13 weak Hopf Rosales | a=I,b=c=d=0, u=x_n+1 on unit ball | Boundary value at −e_n=0; inward quotient h/h=1; all lower-order norms 0. | Pass source contract; exact Morrey notation needed. |
| C13 ABP contact construction | u=‖x‖²−1 on B₁ | Negative depth 1; gradient image B₂; Hessian determinant 2^n; its integral equals 2^n volume(B₁)=volume(B₂). | Pass area/sign test; R01. |
| C14 Harnack | u=1; u=2+x on (−1,1) | First sup/inf=1. On (−1/2,1/2), second ratio=(5/2)/(3/2)=5/3. | Pass nonnegative homogeneous test. |
| C15 fundamental solution signs | n=1, Φ=−∣x∣/2; n=3, Φ=1/(4πr) | Distributional −Φ″=δ in n=1. In n=3 outward flux of −∇Φ over radius r is 1. | Pass normalization. |
| C15 Green correction / worked example | f=1 in B₁⊂ℝ³ | Newtonian potential inside (3−r²)/6; boundary 1/3; corrected u=(1−r²)/6; −Δu=1, trace 0. | Pass exact supplied example. |
| C15 Perron boundary qualification | punctured ball in n≥2, data 1 at puncture and 0 outer boundary | Harmonic Perron solution 0; value approached at puncture 0≠1. | Pass: boundary attainment needs regularity/barrier. |
| D16 energy/Gårding | A=I, b=0, c=−2, u=sin x on (0,π) | B(u,u)=π/2−π=−π/2; H¹ norm²=π, L²²=π/2. δ=1/2, β=2 gives RHS −π/2. | Pass shifted coercivity. |
| D17 coercive existence / lifting | −u″=1 on (0,1), trace 0; add lifting x | u=x(1−x)/2; −u″=1, endpoint values 0. u+x has endpoints 0,1 and same forcing. | Pass; L² special case native, general headline R04. |
| D18 adjoint compatibility, both directions | L=[[1,1],[0,0]], f=(1,0) or (0,1) | ker L=span(−1,1), ker Lᵀ=span(0,1). f=(1,0) annihilates adjoint kernel and is solvable; f=(0,1) does not and is not solvable. | Pass correct adjoint direction; statable R04. |
| D18 resonance | L=−d²/dx²−1 on (0,π), f=sin x or 0 | Pairing with sin x is π/2 or 0. First unsolvable; second has solutions c sin x, not unique. | Pass. |
| D19 spectrum | (0,π); ∅ | First λ=1 with sin x; empty-domain point spectrum ∅ and no first λ. | R07 adds nonemptiness. |
| E20 H²/bootstrap | u=x², A=1; divergence datum F=1_(0,1/2) | Smooth case −u″=−2. For −u″=F′, u′=−F+constant has a jump, so u need not be H² despite F∈L². | Pass scalar-versus-divergence datum distinction. |
| E21 Meyers and VMO | A=I, F=−∇u smooth; oscillatory step coefficients | −div∇u=div F exactly; ‖∇u‖_p=‖F‖_p. A fixed jump has nonvanishing small-ball mean oscillation. | Pass: VMO stronger than bounded measurable, full-p claim separated. |
| E22 divergence Schauder | 1D a=1+∣x∣^α, a u′=1, 0<α<1 | u′=(1+∣x∣^α)⁻¹ is C^α; u″ behaves as −α sign(x)∣x∣^(α−1), unbounded. | Pass C¹,α rather than C²,α. |
| E23 homogeneous Hölder scaling | u_M=Mx₁ on B_(2r) | Hölder seminorm scales ∣M∣r^(1−α); Lp norm scales ∣M∣r^(1+n/p); multiplied by r^(−α−n/p) gives same scale. | Pass solution/radius factors. |
| E23 representative requirement | zero a.e. function changed to 1 at one point | Lp norm 0; pointwise Hölder quotient near that point diverges. Representative v=0 has seminorm 0. | Pass existential representative. |
| E23 arbitrary L² forcing control | n=5, u=r^(−1/4) near 0 | Gradient square radial exponent 5−3−1/2=3/2>−1; forcing square exponent 5−5−1/2=−1/2>−1; u unbounded. | Pass: arbitrary L² forcing does not imply Hölder. |
| E23 dimensions 1 and 2 | homogeneous flux a u′=1; affine u=x₁ | In 1D u′=1/a bounded by 1/λ. In 2D affine Laplace solution has oscillation 2r. | Pass; n>2 imported proof alone does not cover these cases. |
| E24 strong-solution ABP/Krylov–Safonov | a=I, u=‖x‖² | −a:D²u=−2n; finite local Ln forcing; u smooth. | Pass sign/solution-concept test; full theorem unverified source. |
| E25 non-divergence Schauder | a=1+∣x∣^α, solve −a u″=1 | u″=−1/(1+∣x∣^α), a C^α function, unlike E22's derivative singularity. | Pass distinction. |
| E26 VMO W²,p | a=I, u=x² on bounded interval | u″=2; forcing −2, both Lp norms 2·length^(1/p). | Pass constant case; quantitative VMO modulus remains required. |
| F24 energy identity | V=H=ℝ, u(t)=t on [0,T] | ‖u(T)‖²−‖u(0)‖²=T²; 2∫₀ᵀu′u=T². | Pass factor 2. |
| F25 Galerkin evolution | u_t+u=0, u₀=1 | u=e^(−t); derivative −e^(−t), Lu=e^(−t), residual 0. | Pass; autonomous special case only. |
| F26 heat generator and resolvent | Fourier mode ξ | Heat multiplier e^(−4π²∣ξ∣²t); derivative at 0 −4π²∣ξ∣²; resolvent multiplier (λ+4π²∣ξ∣²)⁻¹. | Pass A=Δ versus elliptic −Δ. |
| F26 strong continuity / graph cores | u=1; u=1_(0,∞) | Heat fixes 1; distance from 1 to every compact-support function in sup norm ≥1. Step heat error has essential supremum 1/2 for every t>0. | Pass BUC versus L∞ and core distinction. |
| F27.1 parabolic distance and α ranges | points (0,0),(3,4); α=1/2 | d=3+2=5, time-only d=2. Time Hölder exponent α/2=1/4; derivative-time exponent (1+α)/2=3/4. | Pass metric convention; R10/R11. |
| F27.1 Hölder seminorms/finite norms | constant 1; v=t on [0,1] | Constant full sup norm 1, Hölder seminorm 0. For v=t, parabolic-α quotient ∣t−s∣^(1−α/2) has sup 1. | Pass finite seminorm is not boundedness. |
| F27.1 mixed derivative weights | u(x,t)=sin x·t | D_tD_xu=D_xD_tu=cos x; weighted order 2+1=3 in both orderings. | Pass order/sign test. |
| F27.1 spatial interpolation | u=sin(kx), ε=1/k≤1 | ‖D_xu‖∞=k; ε‖D²u‖∞+ε⁻¹‖u‖∞=2k. Second-order terms each scale k². | Pass scale. |
| F27.1 time interpolation | u=t on [0,1], ε≤1/√2 | ‖u_t‖∞=1; seminorm[u_t]=0; ε⁻²‖u‖∞≥2. | Pass endpoint/slab restriction. |
| F27.1 controlled temporal gradient | u=sin(kx)sin(k²t) | Gradient temporal (1+α)/2 seminorm scales k^(2+α); D²u and u_t parabolic-α seminorms scale k^(2+α). | Pass parabolic homogeneity. |
| F27.2 comparison | u=e^(ct), f=0, c≥0 | u_t−cu=0; sup u=e^(cT)=e^(C₊T)u₀. | Pass sign and exponential. |
| F27.2 heat mass/cancellation | Gaussian Γ_t, t>0 | ∫Γ_t=1; ∫∂_iΓ_t=0; ∫∂_ijΓ_t=0. At t=0 pointwise kernel formula undefined. | Pass explicit t>0. |
| F27.2 kernel derivative bound scaling | x=√t z | D_x^m∂_t^jΓ scales t^(−(n+m+2j)/2); stated Gaussian envelope has same power. | Pass dimensions; finite constants still a theorem. |
| F27.2 Duhamel and constant-matrix reduction | f=1,u₀=0; a₀=4I | u=t gives u_t−Δu=1; x=2y turns 4Δ_x into Δ_y. | Pass. |
| F27.3 forward/backward equation | u=t,g=1; R time T−s | P_back u=1; v=T−s, forward P̃v=−1=−g∘R. Terminal u(T)=T equals v(0). | Pass minus sign. |
| F27.3 continuity/isomorphism | constant data u₀=1, f=0, c parameter | u_c=e^(ct); parameter derivative t e^(ct), bounded on fixed [0,T] and bounded c-range. | Pass local parameter-bound test. |
| F27.4 BUC trace and common modulus | g=sin(kx), constant coefficients | Heat error at t is 1−e^(−k²t)→0 for fixed k; sup_k error=1 for each t>0. | Pass common modulus essential. |
| F27.4 weighted positive-time bound | same g, δ=k⁻² | Highest norm scales k^(2+α); δ^(1+α/2)=k^(−2−α); product stays order 1. | Pass weight. |
| F27.5 all orders | u=e^(−k²t)sin(kx) | D_t^rD_x^β amplitude k^(2r+∣β∣)e^(−k²t); equation replaces each time derivative by two spatial ones. | Pass weighted-order convention. |
| F27.6 conjugation and weight | a=1,b=c=0,w=1+e^x at x=0, v=1 | w=2,w′=w″=1; (Pw)/w=−1/2; b_w=1,c_w=1/2, P_w1=−1/2. | Pass both transformed signs. |
| F27.6 unbounded log weight | w=e^x | log w=x unbounded; positive-order derivatives 1,0,… bounded. b_w=2,c_w=1. | Pass no unnecessary log-w bound. |
| X0 dyadic partition/norm | one annular block j; zero function | Besov contribution 2^(js)‖P_j f‖_p; zero has every block 0. Two overlapping cutoffs reconstruct the same f when their sum is 1. | Pass test; ownership R05. |
| X0 homogeneous quotient | nonzero constant distribution 1 | Every annular block 0, hence homogeneous seminorm 0; inhomogeneous low block retains 1. | Pass: must quotient polynomials; exact reconstruction/ranges still need specification. |
| X0 little versus large space | coefficients 2^(κj) at dyadic j in C^(−κ) | Weighted block sizes all 1; finite truncation tail norm 1, so not in little closure. For sizes 1/j tails tend to 0. | Pass density distinction. |
| X0 paraproduct product | α=−κ, β=2κ | α+β=κ>0; resonant block decay 2^(−κj) is summable. Two −κ inputs instead grow as 2^(2κj). | Pass: enhancement genuinely needed. |
| X1.1 Schrödinger kernel | t=1,d=1 | Kernel magnitude (4π)^(−1/2); multiplier at ξ=1 is e^(−4π²i). At t=0 dispersive RHS is not a finite bound. | Pass t≠0 and 2π. |
| X1.1 wave block / TT* | d=3,j=0; σ=1; d=4 endpoint | Decay factor (1+∣t∣)⁻¹. (q,r,σ)=(2,∞,1) gives 1/2=1/2 but is excluded. d=4 pair (2,6) gives 1/2+3/12=3/4. | Pass exclusions. |
| X1.2 Schrödinger admissibility | d=3,(2,6); d=1,(4,∞); d=2,(2,∞) | 2/q+d/r equals 3/2,1/2,1 respectively; last satisfies scaling but is explicitly excluded. | Pass. |
| X1.2 Duhamel sign | zero initial data, spatially constant forcing 1, formal mode 0 | u=−it; i u_t=1, Δu=0. Opposite sign gives −1. | Pass convention witness (not an L² whole-space datum). |
| X1.3 wave regularity/excluded pair | d=3,(∞,2); d=4,(2,6); d=3,(2,∞) | s=0; s=2−4/6−1/2=5/6; excluded pair otherwise gives s=1. | Pass. |
| X1.3 spatial infinity and retarded sum | d=3,(∞,∞); energy/energy pair; frequency 2^j | Infinity pair needs s=3/2 and ℓ¹. Energy pair s=s̃=0 gives forcing weight 2^(−j), the D⁻¹ gain. | Pass; no critical Sobolev→L∞ substitution. |
| X1.3 1D translations | initial wave f(x), g=0 | u=(f(x+t)+f(x−t))/2; for a single traveling profile its sup norm is unchanged, decay exponent 0. | Pass separate 1D case. |
| X2.1 global boundary estimate | Ω=(0,1), a=1, f=1,F=g=0 | u=x(1−x)/2, sup 1/8; all data norms finite; boundary trace 0. | Pass instance; source unverified. |
| X2.2 nonlinear compact map | A independent of v and equal to 1, same data | T(v)=u for every v; image singleton, sup 1/8. Ball R=1/4 maps into itself. | Pass actual-map/nonempty convex-domain test. |
| X2.2 coefficient continuity | A(v), Lipschitz constant L, ‖v−w‖∞=ε | Coefficient difference ≤Lε; coercive energy gives gradient error ≤(Lε/λ)‖∇T(w)‖₂. | Pass quantified control. |
| X2.2 homotopy/radial truncation | above map; R=1/4; T(v)=0 case | Homotopy solutions θu have norm θ/8≤1/8<R. Zero branch is 0; no use of R/0. | Pass branch needed exactly as written. |
| X2.3 regularity and parameter family | linear a_η=1+η, η≥0 | u_η=x(1−x)/(2(1+η)); sup=1/(8(1+η)), continuously varying; smooth second derivative −1/(1+η). | Pass linear control; no nonlinear uniqueness inferred. |
| X3.0 cylindrical integral | H=ℓ², G=P_N; G e_k=2^(−k)e_k, k≥1 | E‖∫G dW‖²=NT for P_N, diverging as N→∞; summable example gives T∑4^(−k)=T/3. | Pass: identity noise is not H-valued Radon Brownian motion. |
| X3.1 stochastic parabolicity | scalar Fourier mode dX=−a k²Xdt+iσkX dβ | dE∣X∣²/dt=−(2a−σ²)k²E∣X∣². For a=1,σ=√2, dissipation 0; σ=2 gives growth 2k². | Pass strict margin necessary. |
| X3.1 trace exponent | p=2,γ=0; p=4,γ=0 | Trace orders γ+2−2/p are 1 and 3/2; solution space orders are 2. | Pass scaling check only; full estimate not source-certified. |
| X3.2 torus normalization and OU | frequency k=(1,0); scalar dZ=−aZdt+σdβ | Laplace eigenvalue 4π²; stationary variance σ²/(2a). | Pass. |
| X3.2 weighted remainder | initial regularity −κ, positive target 2κ | Heat gain 3κ gives norm scale t^(−3κ/2); multiplying by t^(3κ/2) gives t⁰. | Pass. |
| X3.3 Φ⁴ covariance/Wick coefficients | m=1, zero Fourier mode, noise √2 | Stationary variance 2/(2·1)=1; H₂(Z)=Z²−1, H₃(Z)=Z³−3Z. | Pass mass and √2 normalization. |
| X3.3 remainder/counterterm sign | u=Z+v, variance C | u³−3Cu=v³+3v²Z+3v(Z²−C)+(Z³−3CZ); equation therefore has +3Cu cutoff drift. | Pass coefficient 3 and sign. |
| X3.3 dissipative globalization | deterministic noise 0, spatial constant v | (1/2)d(v²)/dt=−m²v²−v⁴; at v=1,m=1 this is −2. | Pass coercive mechanism; enhanced-noise estimates still unverified. |
| X3.4 stochastic NS covariance/counterterm | single solenoidal mode k=(1,0), viscosity ν | A eigenvalue 4π²; covariance 1/(8νπ²); div of constant covariance matrix 0. | Pass absence of scalar counterterm. |
| X3.4 Gaussian Galerkin invariance | one real mode x with eigenvalue a | Density exp(−ν a x²); variance 1/(2νa), matching OU drift −νax and noise 1. | Pass factor in density. |
| X3.4 enstrophy/energy cancellations | shear u=(sin(2πy),0) | div u=0; (u·∇)u=0; both convection energy and enstrophy pairings 0. | Pass test; general triad proof remains a target. |
| X3.4 smooth-noise versus identity regime | Q=0; identity covariance on torus | Smooth-noise trace sum 0; identity-mode H² trace sum behaves as ∑∣k∣⁴=∞. | Pass: energy class is not claimed for cylindrical identity noise. |
| X3.4 global-law qualification | initial law μ versus a Dirac mass at exceptional x | μ-null exceptional set has probability 0 under μ or laws ≪μ; Dirac mass at such x assigns probability 1. | Pass: invariance cannot imply every deterministic rough-state theorem. |
| “Lane A comes first” | A1/A6→D17, and A6←GMT G2 | Abstract route length 2 is valid; roadmap cycle PDE→GMT→PDE has length 2 and no topological ordering. | R01/R03; slogan is not a source theorem. |

The complete declaration-by-declaration check of Suggested.lean follows. Here p=(3,4), q=(0,0) in one spatial dimension, T=10, and slab [a,b]=[2,5], unless a row says otherwise. Every row's equality/inequality is sound as a supporting identity; R11 concerns its suitability for this file.

| Declaration (inside `TauCetiRoadmap.PDE`) | Instances tried | Values computed on each side | Result / change |
| --- | --- | --- | --- |
| `ParabolicTime` | times 0,4 and 0,0 | Distances √4=2, √0=0; ordinary time gives 4 in the first case. | Pass metric definition. |
| `ParabolicSpaceTime` | p,q; n=0 with times 0,4 | d(p,q)=3+2=5; n=0 distance=0+2=2. | Pass carrier; no positive-dimensional assumption needed. |
| `ParabolicSpaceTime.ofCoords` | x=3,t=4 | Constructed coordinates (3,4), spatial/time projections 3,4. | Pass real body. |
| `ParabolicSpaceTime.space` | p,q | Values 3,0; ignores time 4,0. | Pass. |
| `ParabolicSpaceTime.time` | p,q | Underlying real values 4,0; snowflake distance 2. | Pass. |
| `ParabolicSpaceTime.toProd` | p | Product coordinates (3,⟨4⟩), versus incorrectly reversed (4,⟨3⟩). | Pass. |
| `ParabolicSpaceTime.coordsHomeomorph` | p; inverse (3,4) | Forward p↦(3,4), inverse returns p; composite coordinates (3,4). | Pass. |
| `ParabolicSpaceTime.coordsHomeomorph_apply` | p | (3,4)=(3,4). | rfl padding; R11. |
| `ParabolicSpaceTime.coordsHomeomorph_ofCoords` | 3,4 | (3,4)=(3,4). | rfl padding; R11. |
| `ParabolicSpaceTime.coordsHomeomorph_symm_apply` | (3,4) | Both sides are the parabolic point with coordinates (3,4). | rfl padding; R11. |
| `ParabolicSpaceTime.ofCoords_space` | 3,4 | 3=3. | rfl padding; R11. |
| `ParabolicSpaceTime.ofCoords_time_val` | 3,4 | 4=4. | rfl padding; R11. |
| `ParabolicSpaceTime.toProd_fst` | p | 3=3. | rfl padding; R11. |
| `ParabolicSpaceTime.toProd_snd` | p | ⟨4⟩=⟨4⟩. | rfl padding; R11. |
| `ParabolicSpaceTime.dist_eq_parabolicDist` | p,q; p,p | 5=3+2; 0=0+0. | One library specialization; R11. |
| `ParabolicSpaceTime.spatial_dist_le` | p,q; same time | 3≤5; spatial distance 3≤3 when time coordinates agree. | Pass supporting API; R11. |
| `ParabolicSpaceTime.time_dist_le` | p,q; same space | 2≤5; time distance 2≤2 when spaces agree. | Pass supporting API; R11. |
| `ParabolicSpaceTime.dist_time_formula` | time gap 4; time gap 0 | 2=4^(1/2); 0=0^(1/2). | Pass supporting API; R11. |
| `ParabolicSpaceTime.dist_ofCoords` | p,q | 5=3+√4. | Pass Check; R11. |
| `ParabolicSpaceTime.timeReverse` | T=10,p; T=0,p | (3,6); (3,−4). Wrong t↦t−T would give (3,−6) in first case. | Pass real body. |
| `ParabolicSpaceTime.timeReverse_space` | T=10,p | 3=3. | rfl padding; R11. |
| `ParabolicSpaceTime.timeReverse_time_val` | T=10,p | 6=10−4. | rfl padding; R11. |
| `ParabolicSpaceTime.timeReverse_involutive` | T=10,p | time 10−(10−4)=4; space 3=3. | Pass Check; R11. |
| `ParabolicSpaceTime.timeReverse_dist` | p,q | Reversed times 6,10: 3+√4=5=d(p,q). | Pass supporting API; R11. |
| `ParabolicSpaceTime.timeReverse_isometry` | p,q; p,p | Preserved distances 5=5 and 0=0. | Pass consequence; R11. |
| `ParabolicSpaceTime.timeReverseIsometryEquiv` | p, inverse | Forward (3,6), backward (3,4); distance 5 preserved. | Pass real constructor. |
| `parabolicSlab` | time 4, time 6; a=5,b=2 | Membership true, false; reversed-endpoint interval empty. | Pass real body. |
| `coordsHomeomorph_preimage_prod_Icc` | times 4 and 6 | Left/right membership true/true and false/false. | Pass both directions; R11. |
| `restrictToParabolicSlab` | u(x,t)=t, p in slab | Restricted value 4=ambient value 4. | Pass real body. |
| `timeReverse_mem_parabolicSlab` | endpoints 2,5; T=10 | Reversed interval [5,8]; times 2↦8 and 5↦5, both included. | Pass endpoint direction; R11. |
| `boundedOnParabolicSlab_iff_subtype` | u=t on [2,5]; empty slab | Minimal nonnegative bound 5 on both presentations; empty slab admits B=0 on both. | Pass both directions; R11. |
| `holderOnParabolicSlab_iff_subtype` | u=t on [0,4], α=1,C=2; C=1 | Both presentations satisfy ∣t−s∣≤2√∣t−s∣. At times 0,4, C=1 gives 4≤2 false on both. | Pass both directions and negative control; R11. |

## Not verifiable

Seven usable source texts/modules were obtained through the sources service: `tao`, `keel-tao`, `carleson`, `degiorgi-code`, `armstrong-kempe`, `rosales`, and `meyers`. Four works resolved as **uncertified/paywalled**; these are not requests to bypass access restrictions: `gilbarg-trudinger` (Springer), `grafakos-classical` (Springer), `grafakos-modern` (Springer), and `da-prato-debussche-ns` (Elsevier, DOI 10.1006/jfan.2002.3919). Their theorem/page content was not read. Gilbarg–Trudinger's supplied chapter/theorem citations therefore remain uncertified; the other three need precise locators too.

The single missing-reference record contains ten unresolved works, with the same keys used throughout retrieval:

- `lunardi`: the cited author PDF for *Linear and nonlinear diffusion problems*, Corollary 4.2.10, returned HTTP 503 twice. F27's locator, including printed page, could not be checked.
- `krylov`: the bibliographic resolver and primary-source search did not locate readable text of *An Analytic Approach to SPDEs*. X3.1 has no theorem/page locator to check.
- `da-prato-debussche-quantization`: the Project Euclid landing page exposed no downloadable paper to the service; its direct PDF URL returned an Incapsula error document, not the paper. The SNS institutional repository returned 403. The service's “fetched” label for the error response is not source certification. X3.3's full every-initial-state globalization is not verified against this source.
- `evans`: the AMS DOI/landing resolution did not produce a readable text. The README supplies chapters but no edition-specific theorem/pages for most A–F claims.
- `chiarenza-frasca-longo-interior`: the cited Pisa institutional handle returned 403; no theorem/page is supplied for E26.
- `chiarenza-frasca-longo-dirichlet`: DOI 10.2307/2154379 resolved to JSTOR without readable source text; no E26 theorem/page is supplied.
- `di-fazio`: the cited Catania repository returned 403; E21's exact locator is absent.
- `auscher-qafsaoui`: BDIM HTTPS failed certificate validation; the HTTP landing route did not provide readable source text. No security setting was changed. E21's exact locator is absent.
- `stein`: bibliographic resolution did not find a readable legal copy of *Singular Integrals and Differentiability Properties of Functions*; B/X0 theorem/pages are absent.
- `stein-shakarchi`: the *Functional Analysis* DOI resolver did not provide readable text; the cited §3.3 was not certified.

X0 and X2's generic references do not identify exact results even apart from text access. The full endpoint Besov reconstruction, analytic stochastic maximal-regularity estimate and singular-model globalization are not established by the spot computations in this report. Likewise, I did not audit the entire external DeGiorgi repository's proof closure/licence history or reproduce the full Carleson build. Ownership against open proposals whose files were not supplied was not checked. These limits do not suspend the concrete findings or the completed verdict.

## Source issues

- none
