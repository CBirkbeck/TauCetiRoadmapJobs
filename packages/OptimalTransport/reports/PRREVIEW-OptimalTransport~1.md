# Review of OptimalTransport (pull request #950 at 10d59fd)

**Verdict:** needs changes

## R01 (P1) — The infinity-Wasserstein identity loses measurability

Location: `TauCetiRoadmap/OptimalTransport/Suggested.lean:160`, “theorem wassersteinEDist_top [MeasurableSpace X] [PseudoEMetricSpace X]”. The claim equates an infimum of `eLpNorm` with an infimum of essential suprema without relating the measurable and metric structures.

Witness: On the two-point discrete metric space with trivial sigma algebra, the unique probability coupling has nonmeasurable distance. The left side is ∞; the right side is 1.

At the Mathlib pin, `Mathlib/MeasureTheory/Function/LpSeminorm/Defs.lean:87` defines `eLpNorm` to be ∞ when its function is not AE strongly measurable, even for exponent ∞. In the witness the only null set is empty, so AE measurability cannot repair the distance function. Its essential supremum is nevertheless 1.

Repair: require measurable joint ground distance, or explicitly require AE strong measurability for every coupling. Then consume `TauCeti.wassersteinEDist_top`, `TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Basic.lean:165`, which already has that hypothesis, and delete this duplicate. On the same two points with the full sigma algebra and marginals δ₀, δ₁, both sides are 1. Keep the trivial-sigma example as the negative control.

## R02 (P1) — The barycenter uniqueness hypothesis admits a counterexample

Location: `TauCetiRoadmap/OptimalTransport/README.md:1383`, “whose Hausdorff dimension is less than `n-1`”. The claimed consequence is uniqueness when one input satisfies this predicate.

Witness: In ℝ² take uniform laws on the horizontal and vertical segments through ±1, with equal weights. Couplings t=s and t=−s yield different midpoint barycenters, both of objective 1/6.

Both laws annihilate every set of dimension strictly less than 1. Every coupling has squared cost E(s²+t²)=2/3. Its midpoint attains the barycenter lower bound (2/3)/4=1/6. The two midpoint laws lie on different diagonals. Agueh–Carlier Definition 3.2, printed p.11 (`agueh-carlier line 617`), instead requires nullity on sets of dimension **at most** n−1; Proposition 3.5, p.12 (`agueh-carlier line 650`), uses that stronger property.

Repair: change `< n−1` to `≤ n−1`, keep the exact definition and proposition locators, and add the two-segment negative control. The repaired predicate excludes both segment laws because each gives its dimension-one supporting segment mass 1.

## R03 (P1) — The unrestricted entropy change-of-reference identity splits ∞−∞

Location: `TauCetiRoadmap/OptimalTransport/README.md:1261`, “Prove the general form, and restrict to `μ ∈ P₂(X)` before the corresponding `W₂` lower-semicontinuity”. The displayed identity is therefore required before imposing a finite second moment.

Witness: On ℝ with Lebesgue reference and a=1, take density 1/[x(log x)²] on [e,∞). Its mass is 1, entropy −∞, second moment ∞, and KL to the Gaussian reference is ∞.

Here Z=√π. Substituting u=log x gives mass ∫₁∞u⁻²du=1 and entropy −∫₁∞(u+2log u)u⁻²du=−∞. The Gaussian log-density ratio has nonintegrable positive part. The proposed right side splits this into −∞+∞; with Mathlib's `EReal` addition this is −∞ (`Mathlib/Data/EReal/Operations.lean:46`, `:50`), not the left side ∞. Interpreting the moment as a nonintegrable real Bochner integral also does not save it.

Repair: impose finite second moment before this identity, also for finite measures of mass M, or state separate extended-integral tiers with explicit conditions excluding the indeterminate split. Keep the mass correction. For μ=2mₐ the corrected formula gives KL=2log 2−1 on both sides; for μ=mₐ both sides are 0. The heavy-tailed counterexample is excluded by its infinite moment.

## R04 (P1) — The BV speed formula uses a reversed interval for negative increments

Location: `TauCetiRoadmap/OptimalTransport/README.md:1042`, “lim_{h→0} ∫ |Dγ|([t,t+h])/|h| dπ̃(γ)”. This is a two-sided limit with an ordered interval.

Witness: Set γ(t)=t and μₜ=δₜ. The speed and distance quotient are 1. The variation quotient is 1 for h>0 and 0 for h<0.

Repair: use h↓0 for the variation quotient, or replace the interval by [min(t,t+h),max(t,t+h)]. Both repaired expressions equal 1 on this example. State the càdlàg representative convention before the all-time evaluation identity, as in Abedi–Li–Schultz Remark 2.20 (`abedi-li-schultz line 857`). The interval slip also appears in that source's equation (3.6), p.19 (`abedi-li-schultz line 963`); it should not be inherited into Lean's ordered-interval convention.

## R05 (P2) — Replace supplied constructions with exact supplier contracts

Location: `TauCetiRoadmap/OptimalTransport/README.md:247`, “genuine prerequisites that must be built in the layers below”; `Suggested.lean:45` and Layers 0–5, 12–13. This inventory treats substantial existing pinned theory as new work.

Witness: `TauCeti/MeasureTheory/OptimalTransport/Cost/Basic.lean:111` already defines `TauCeti.transportCost`; `Coupling.lean:110` already defines its coupling relation; `Wasserstein/Basic.lean:160` already defines the Wasserstein distance.

The library audit below resolves further supplied objects, including gluing, primal attainment, Monge predicates, Wasserstein carriers, convex conjugacy, Brenier, Fréchet means and entropic minimization. These are real definitions and proved theorems, not placeholders. Mathlib already proves data processing at `Mathlib/InformationTheory/KullbackLeibler/DataProcessing.lean:159`, and Tau Ceti proves strict convexity at `TauCeti/InformationTheory/KullbackLeibler/Convex.lean:124`. They cannot remain a list of missing work. Likewise, the Lipschitz area-formula part of Layer 6.6 belongs to `GeometricMeasureTheory` G2 (`README.md:158` on main).

Repair: replace supplied targets and local synonyms with exact declarations in the ownership/supplier sections; retain only precisely distinguished extensions. For Layer 6.6 import G2's weighted Lipschitz area formula and state the genuinely stronger approximate-gradient bridge. For Layer 13.12 cite `StochasticCalculus` S1.2 for Wiener law/scaling, retaining the finite-interval reference and entropy specialization here. Transport the finite examples: the native and local transport costs for δ₀,δ₂ and squared distance are both 4; their Wasserstein distances are both 2; both finite Fréchet predicates select 1 for equal atoms at 0 and 2. This is an update of an existing roadmap, so repair in place rather than reject it as a new duplicate roadmap.

## R06 (P2) — Statable headline theorems are missing from the acceptance test

Location: `TauCetiRoadmap/OptimalTransport/Suggested.lean:21`, “As those prerequisites become expressible, add their representative signatures here.” The file substitutes a small API spine for the named completion targets at `README.md:1870`.

Witness: `TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Space.lean:91` supplies `WassersteinSpace`; `TauCeti/MeasureTheory/Measure/FrechetMean.lean:94` supplies `IsFrechetBarycenter`. The file nevertheless states no population-barycenter existence theorem.

Repair: import the individual native modules and state Layer 12.5's existence theorem on the available Wasserstein carrier, with 1≤p<∞ and complete, separable, locally compact, geodesic base space; use a real-body geodesic predicate only if needed. Also state Layer 15.10's finite entropic-GW existence and zero-temperature headline using finite matrices, a coupling polytope and its displayed objective. These need only simple definitions on existing carriers. Replace the generic postponement with a per-headline list of genuinely missing carriers. For the population law assigning equal mass to δ₀ and δ₂ at p=2, the required conclusion has barycenter δ₁ with objective 1. For identical two-point distance matrices, the finite GW infimum is attained at a diagonal plan with unregularized value 0; the regularized optimum lies between 0 and εlog 2 and tends to 0.

## R07 (P2) — Remove computational implementation deliverables

Location: `TauCetiRoadmap/OptimalTransport/README.md:1540`, “a real-arithmetic iteration with certified residual and objective-gap bounds; log-domain stabilization”; also `README.md:1866`, “A floating-point wrapper reports certified residuals/error bounds”. These require algorithm implementations beyond the mathematics-only contract.

Witness: Layer 16.5 explicitly requires an executable floating-point wrapper; Layer 13.9 requires its stabilized iteration. Neither is a theorem statement or a small worked mathematical example.

Repair: delete those implementation deliverables. Retain scaling existence, convergence inequalities, Hilbert-metric contraction and small exact Checks. For K=[[2,1],[1,2]], Δ=log 4 and the single-kernel contraction factor is 1/3; this gives the intended mathematical check without a floating-point wrapper.

## R08 (P2) — Specify the promised GW barycenter objective

Location: `TauCetiRoadmap/OptimalTransport/README.md:1826`, “Give GW barycenters their own written objective and normalization”; `README.md:1896` includes GW barycenters among completion targets. The instruction to write an objective is not that objective, nor an existence theorem with a carrier and hypotheses.

Witness: For one-point scalar kernels 0 and 2 with equal weights, minimizing average GW distance gives every z∈[0,2]; minimizing average squared GW distance gives only z=1.

Repair: write the finite-p objective, admissible kernel category, normalization, hypotheses and claimed existence/uniqueness conclusions explicitly; distinguish the essential-supremum problem if retained. The p=1 objective is (|z|+|z−2|)/2 with minimum 1 throughout [0,2]; the quadratic-power objective is (z²+(z−2)²)/2=(z−1)²+1 with unique minimum 1. Add these discriminating Checks. Do not silently choose one and advertise it as every GW barycenter notion.

## R09 (P3) — Delete the one-tactic Sinkhorn restatement

Location: `TauCetiRoadmap/OptimalTransport/Suggested.lean:226`, “theorem exists_sinkhorn_scaling”.

Witness: After importing `TauCeti.Data.Matrix.Scaling`, the entire proof closes with `exact Matrix.exists_sinkhorn_scaling hK ha hb hmass`; the scratch copy elaborated successfully.

Repair: delete it from `Suggested.lean`; cite `Matrix.exists_sinkhorn_scaling`, `TauCeti/Data/Matrix/Scaling.lean:922`, in the README supplier contract. Keep a genuinely new entropic headline instead. The 1×1 instance K=2, a=b=1 admits u=1/2,v=1 and row/column sum 1 in both formulations.

## R10 (P3) — Restore the required roadmap and acceptance-test shape

Location: `TauCetiRoadmap/OptimalTransport/README.md:346`, “### Layer 0: transport plans, maps, kernels, and gluing”; `Suggested.lean:6`, “suggest Lean forms for particular milestones”.

Witness: There are no `*Needs:*` lines. Definitions such as the c-transform at README:451 have no attached three-Check list; layers lack their required Examples/Dependencies subsections.

Repair: use the prescribed Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, and `## Layer k` structure. Give every retained definition its prose API and at least three discriminating Checks; attach itemized dependencies and exact hypotheses to each target. Reconcile the 23 declaration spellings absent from the README (including `wassersteinEDist_top`) and rewrite the module docstring as an acceptance test. For cyclic monotonicity, use the empty sum 0≤0, the diagonal two-cycle 0≤2, and the anti-diagonal failure 2≤0; a mere definition restatement would not distinguish the wrong inequality direction. Keep all checks in prose, not sorried Lean padding.

## R11 (P3) — Give targets exact source locators and source records

Location: `TauCetiRoadmap/OptimalTransport/README.md:471`, “Prove strong Kantorovich duality”; `README.md:1319`, “Extend the tangent/subdifferential/flow theory to smooth complete Riemannian manifolds”. These targets lack their own theorem/section/page locators. No `sources.toml` is present.

Witness: Layer 13.13 cites Léonard's survey, but its Brownian Γ-limit is labeled Informal Statement 5.1 at p.26 (`leonard line 1393`) and refers elsewhere for rigorous hypotheses.

Repair: provide a locator for each theorem and the exact primary result used for proof steps; add the source manifest without copying source text. Match the cited version's numbering. The reconstructed sample and access limits below identify what could be verified. For the Brownian normalization, γ(t)=2t has kinetic action 2 and endpoint rate 2, whereas omitting the half gives 4; preserve this check while supplying the rigorous recovery/equicoercivity source and hypotheses. Unreadable sources are not represented here as disproved results.

## R12 (P3) — Repair the gate's four TeX-syntax hits

Location: `TauCetiRoadmap/OptimalTransport/README.md:1800`, the lower-bound chain runs across a newline inside a backtick span.

Witness: The worker's gate reports `tex=4`, all at lines 1800–1801, for subscripts outside the scanner's recognized code spans.

Repair: put the whole chain in one properly closed single-line code span, or a code block, or use Unicode. The one-point kernels 0 and 2 with basepoint 0 give every term in the chain equal to 2; the repair changes formatting only. Rerun the gate.

## R13 (P3) — Remove the gate's process-residue hit

Location: `TauCetiRoadmap/OptimalTransport/README.md:50`, “not a catalogue of every constraint”.

Witness: The worker's `residue` rule rejects the word “catalogue”; this is its sole residue hit and the gate fails.

Repair: state the mathematical scope positively without that sentence. This has no mathematical effect; the same target list and computed examples remain. Rerun the gate. Both failing rule classes must be cleared before acceptance.

## Verified sound

Both complete target files were reviewed at the specified HEAD. There are no changes outside this folder. This is an existing roadmap; the diff updates Layer 7 suppliers. No sorry'd data, `set_option`, forbidden import, admitted example or stray file was found. The worktree is unchanged.

The worker gate fails only the two rule classes recorded in R12–R13: `tex=4`, `residue=1`; `build=0`, `depcheck=0`, `outside-folder=0`, and the other recorded checks are zero. Independently running `lake env lean` on the original file succeeded with nine `sorry` warnings and no other diagnostics. All 26 expanded declaration signatures were compared with the prose and independently printed with `#check @name` on a scratch copy: no section binder silently disappeared, but R01's hypothesis is absent from the declaration itself. One-tactic probes using `rfl`, `simp`, and `infer_instance` did not close the nine original targets; after building the specifically used native matrix module, the exact-library-lemma probe closed Sinkhorn. The other eight remained admitted in that successful probe. No claim of unprovability follows from a failed one-tactic probe.

The dependency check returned exactly:

```
depcheck: 162 roadmaps, 1163 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. There are no declared supplier gaps. The absence of target-level `*Needs:*` lines still limits what a graph scanner can establish (R10).

Supplier citations were resolved against main when the roadmap already exists, and against the supplied open head for new roadmaps. In particular:

| Supplier / location | Consumed object and check |
|---|---|
| `TauCetiRoadmap/RiemannianGeometry/README.md:687`, main, R4.6 | Injectivity radius, cut relation, nullity and smooth squared distance off the relation are explicitly owned there. Its line 713 assigns OT semiconcavity/selections to this roadmap. This resolves the PR's changed ownership without a reverse prerequisite. |
| `TauCetiRoadmap/HopfRinow/README.md:491`, main, Layer 4 | Metric length and constant-speed geodesic infrastructure; Layers 1–4 supply connection/exponential/minimizers. On ℝ, expₓ(v)=x+v and the 0→2 segment has length 2. |
| `TauCetiRoadmap/GeometricTopology/README.md:627`, main, Layer 7 | Curvature and the `TauCeti.riemannianVolume` bridge. On a Euclidean interval of length 2 its volume is 2. The text's downstream use of OT is not an input to these geometric objects. |
| `TauCetiRoadmap/PDE/README.md:223`, `:303`, `:322`, `:350`, main | Domain Sobolev theory, elliptic estimates and concrete heat semigroup in Lanes A/D/E/F. Abstract Hille–Yosida overlap mentioned in the target does not authorize rebuilding it here. |
| `TauCetiRoadmap/OneParameterSemigroups/README.md:93`, `:164`, supplied new-roadmap head | Part A supplies C₀ generators, resolvents and general Hille–Yosida. For generator −1, the semigroup is e⁻ᵗ and its resolvent is 1/(λ+1). |
| `TauCetiRoadmap/GeometricMeasureTheory/README.md:148`, main, G2 | Weighted area/coarea and tangential differentiation are the earlier owner of the Lipschitz portion of 6.6. For f(x)=2x on [0,1], both sides of the area formula are 2. |
| `TauCetiRoadmap/StochasticCalculus/README.md:161`, supplied new-roadmap head | Its ownership paragraph assigns Wiener/scaling to S1.2 and the finite-interval Schrödinger specialization to OT. Variance at time t under √ε scaling is εt, matching generator (ε/2)Δ. |

Object searches covered main/open work through `roadmaps grep`, pinned libraries and board packages. `VariationalMethods` was also opened; the board search found no additional OT owner. R05 distinguishes supplied objects from transport-specific extensions. The namespace search found only this same existing roadmap on main and in other revisions, not another folder claiming its local names. Old resolver leads at README:1850–1851 are proposed namespaces, not missing suppliers. The fresh resolver found no missing roadmap name but did not inspect Lake packages; those were checked directly below.

Pinned source evidence (paths below are library-relative): Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Object opened | Exact declaration / location / scope |
|---|---|
| Couplings | `TauCeti.IsCoupling`, `TauCeti/MeasureTheory/OptimalTransport/Coupling.lean:110`: two marginal equalities, no topology; `TauCeti.Coupling`, :502: probability subtype; equal finite mass existence, :400. |
| Gluing | `TauCeti.Measure.exists_glue_of_standardBorel_right`, `TauCeti/MeasureTheory/OptimalTransport/Gluing.lean:202`: standard-Borel right factor, finite right marginal. |
| Cost and optimizers | `TauCeti.transportCost`, `TauCeti/MeasureTheory/OptimalTransport/Cost/Basic.lean:111`; `TauCeti.IsOptimalCoupling`, :300. The latter includes coupling data, unlike the local equality on an already bundled coupling. |
| Primal existence | `TauCeti.exists_isOptimalCoupling`, `TauCeti/MeasureTheory/OptimalTransport/Existence.lean:227`; bundled form :235, Polish/Borel spaces and lsc nonnegative extended cost. |
| Cyclical monotonicity | `TauCeti.IsCyclicallyMonotone`, `TauCeti/MeasureTheory/OptimalTransport/Cost/CyclicalMonotonicity.lean:76`, finite permutations, general ordered additive codomain. |
| Wasserstein norm | `TauCeti.wassersteinEDist`, `TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Basic.lean:160`; top :165; finite moment :415; triangle :552 with measurable distance and standard-Borel hypotheses. |
| Wasserstein carriers | `TauCeti.WassersteinComponent`, `TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Space.lean:82`; `TauCeti.WassersteinSpace`, :91. Native carrier uses extended pseudometrics; it does not assume every raw presentation is a metric. |
| Monge | `TauCeti/MeasureTheory/OptimalTransport/Monge.lean:123`, :170, :228, :239: `transportMapCost`, `mongeCost`, `IsMongeMinimizer`, `IsKantorovichOptimalTransportMap`; HasLaw ties the map to its marginals. |
| Brenier | `TauCeti.exists_isKantorovichOptimalTransportMap_gradient`, `TauCeti/MeasureTheory/OptimalTransport/Brenier.lean:555`: finite-dimensional real inner-product setting, Haar reference, source AC and finite cost; produces a convex potential and unique optimal map/plan. |
| Convex duality | `TauCeti.fenchelConjugate`, `TauCeti/Analysis/Convex/Conjugate.lean:119`; `fenchelConjugate_flip_fenchelConjugate_eq`, `TauCeti/Analysis/Convex/FenchelMoreau.lean:199`: locally convex space, pairing represents every continuous linear functional, convex lsc real epigraph, no −∞ values. |
| Fréchet means | `TauCeti/MeasureTheory/Measure/FrechetMean.lean:56`, :94, :148: radius, finite barycenter, Chebyshev center. Native barycenter requires finite radius at the minimizer; local existence of a finite-radius comparison point is equivalent for a minimizer. Native definition does not itself restrict p to [1,∞). |
| Entropic OT | `TauCeti/MeasureTheory/OptimalTransport/Entropic.lean:113`, :231, :301, :312: Schrödinger value, existence, uniqueness, entropic cost. These are supplied static results, not the entire proposed dynamic theory. |
| Matrix scaling | `Matrix.exists_sinkhorn_scaling`, `TauCeti/Data/Matrix/Scaling.lean:922`; the successful exact probe described above. |
| KL | `InformationTheory.klDiv`, `Mathlib/InformationTheory/KullbackLeibler/Basic.lean:56`: AC and integrable log-ratio branch with finite-mass correction; chain-rule :203 and :181 in `ChainRule.lean`; data-processing :159 in `DataProcessing.lean`; strict-convexity :124 in Tau Ceti's `InformationTheory/KullbackLeibler/Convex.lean`. The conditional integral formula is not the same theorem as the composition-product chain rule. |
| Lp total-function convention | `Mathlib/MeasureTheory/Function/LpSeminorm/Defs.lean:87`, :138: non-AE-measurable functions get ∞ and the top formula needs AE strong measurability. In particular even the p=0 value is 0 only in the measurable branch. |

The headline groups in README:1870 are primal existence/stability; duality/contact optimality; Wasserstein topology/KR; transport maps/polar factorization; Monge–Ampère/regularity; dynamic plans/BV; flows/JKO/PDE; barycenters; entropy/Sinkhorn/bridges; CD/RCD; and GW. The nine Lean theorems cover a fragment, several already supplied. R06 identifies two statable omissions. The docstring gives no per-headline missing-carrier account.

### Source sample and locators

The brief's seeded-sample field says “none found by heading” and supplies no fifteen target identifiers. I did not invent an alleged worker sample. For reproducibility I sampled fifteen of the 136 numbered mathematical items in Layers 0–15, using the job identifier `PRREVIEW-OptimalTransport~1` as the random seed and sorting the result in document order. There are no README locators explicitly marked unverified. A fetched text is not automatically a certified theorem: the table records the actual reach of each check.

| Target | Text opened and conclusion |
|---|---|
| 2.4, :471 | General duality books were requested through the service; publisher-only copies are uncertified. No exact target locator is supplied. Finite primal/dual witness below is verified, not the full locator. |
| 4.4, :638 | AGS book access is uncertified and this paragraph supplies no theorem/page. Graph-plan/convergence-in-measure witness below passes; source verification remains open. |
| 5.9, :730 | Brenier Theorems 1.1–1.2, printed pp.377–378, `brenier line 84`, `line 100`, `line 106`, `line 111`: rearrangement, nondegeneracy and measure-isomorphism assumptions were read. The interval/nondegenerate polar formulation is supported. |
| 6.13, :867 | FKM Lemma 3.1, p.8, `fkm line 302`; B0/B1 and closure conventions at `line 192`. The inverse-contact pushforward argument is at `line 313`. Extraction drops overbars; open-versus-closed carrier/mass convention is not certified. |
| 9.2, :1116 | Lisini Theorem 4.2, p.22, `lisini line 1343`; construction immediately before it, `line 1340`. Supports the geodesic lift/action statement in its finite-p regime. It does not supply p=1 superposition on continuous curves. |
| 11.10, :1319 | No single theorem locator for the proposed manifold extension. The Euclidean/complete-manifold model checks below do not certify its full unspecified flow hypotheses. |
| 12.5, :1374 | Le Gouic–Loubes Theorem 2, p.6, `legouic-loubes line 214`; Theorem 3, p.7, `line 256`; Lemma 7/Theorem 8, p.11, `line 410`/`line 430`. Finite moment, separable locally compact geodesic regime and the finite-support-to-population route agree. |
| 13.13, :1568 | Léonard §5, pp.25–26, `leonard line 1393`–`line 1417`: half-action normalization and limiting bridges agree. Brownian Γ-convergence is an informal statement referring to a primary work, so exact recovery/equicoercivity hypotheses are not certified from this survey. |
| 14.4, :1626 | Sturm's transportation-distance source was resolved only to publisher access, marked uncertified. No claim of reading that theorem. Point-space and identical-space values below are 0. |
| 14.6, :1641 | The weighted Ricci formula was checked on V=x²/2; the README does not attach an exact comparison theorem/page. Full CD-equivalence source verification remains open. |
| 15.1, :1724 | BMNN Definition 28, p.25, `bmnn line 1137`, supplies weak isomorphism through common measure-preserving pullbacks. The unrestricted measurable root is a definitional extension; the theorem tier must retain the stated Polish/strong-measurability assumptions. |
| 15.3, :1734 | BMNN Theorem 26, p.24, `bmnn line 1076`, proof and Lemma 27 pp.24–25, `line 1116`: finite-p distortion continuity and top-exponent lsc under the source's separable target setting. Extension to a strongly measurable essential separable range is a proof obligation, not a verbatim source theorem. |
| 15.4, :1745 | BMNN Theorem 29, p.26, `bmnn line 1155`, zero iff weak isomorphism. The source's factor 1/2 is deliberately absent in this roadmap. The full-support metric-measure isometry specialization additionally cites Mémoli, whose text was not accessible. |
| 15.9, :1809 | BMNN's distortion definition and Lemma 35, p.29, `bmnn line 1321`, support expansion into the finite four-index sum. The exact two-point expansion below verifies the roadmap's unhalved normalization. No unique locator is attached to this target. |
| 15.10, :1812 | The displayed finite functional was checked directly: compact coupling polytope, continuous xlog x at 0, bounded KL on the feasible face, and 0≤min Fε−min F₀≤ε KL of a fixed F₀-minimizer prove the stated value/cluster-point limit. General-p and barycenter promises still need exact statements (R08). |

Additional source checks: Agueh–Carlier Definition 3.2/Proposition 3.5 gave R02; Abedi–Li–Schultz Theorems 3.1/3.3 and Remark 2.20 gave R04. BMNN Lemma 35 and Propositions 36/38 were checked against the finite-p restrictions: the roadmap correctly avoids claiming separability at p=∞ despite defects in the source. AGS-RCD's fetched arXiv v1 does not match the README's theorem numbers; this is recorded below instead of guessing a published locator.

### Computed adversarial pass

The full pass covered 136 numbered targets and all 26 Lean declarations. This compact record retains all fifteen replacement-sample rows, headline witnesses and the mathematical instances used by findings; the repetitive per-target and declaration ledgers are omitted. These are model tests, not proofs of full analytic claims. “Retain” means the tested instance passes, subject to the source and specification limits above. Values use the roadmap's unhalved W/GW normalization. In finite-plan examples μ=ν=(1/2,1/2), πₐ=[[a,1/2−a],[1/2−a,a]], 0≤a≤1/2, and C=[[0,1],[1,0]].

| Target | Instances and computed values on the two sides | Result / change |
|---|---|---|
| 0.1 | πₐ has both row/column sums (1/2,1/2); zero measures have zero coupling; masses 1 and 2 admit none. | Retain finite/zero cases; cite native API (R05). |
| 0.4 | Glue δ(0,1) and δ(1,2) by δ(0,(1,2)); both required pushforwards have mass 1 at their prescribed pair. | Retain; right-factor standard Borel is explicitly present. |
| 1.1 | ∫C dπₐ=1−2a; minimum 0 at a=1/2. Constant cost ∞ with probability mass gives optimum ∞; infeasible unequal masses also give ∞. | Attainment does not imply finite cost; native R05. |
| 1.5 | C above attains 0 on diagonal; c≡∞ attains ∞ on every feasible plan. | Correct extended attainment; import native result. |
| 1.6 | μₙ=δ(1/n), νₙ=δ₂, c=d²: values (2−1/n)²→4, with the unique plans a recovery sequence. | Retain explicit recovery condition. |
| 2.2 | For c=(x−y)²/2 on ℝ, 0's infimal c-transform is 0; φ(x)=2x² gives inf −∞, not a real-valued transform. | Keep separate real/extended domains. |
| 2.4 | For singleton marginals at 0 and 2 and cost d², primal=4; potentials φ=0,ψ=4 on those singletons give dual=4. | Sample; full locator unverified, R11. |
| 2.7 | For C, diagonal two-cycle original sum 0≤2 after swap; anti-diagonal gives 2≤0 false; n=0 gives 0≤0. | Correct direction; useful per-definition Checks. |
| 2.8 | For feasible zero potentials, diagonal plan has zero slack integral and cost 0; independent plan has slack integral=cost=1/2. | Contact criterion distinguishes nonoptimizer. |
| 3.1 | δ₀,δ₂ give Wp=2 for every 1≤p≤∞. A measurable p=0 norm is 0. For p=1/2, Bernoulli endpoints give 1>1/4+1/4 in the triangle test. | Retain hp≥1 and measurability; R01/R05. |
| 3.3 | δ(1/n) is Wp-Cauchy and tends to δ₀ with distance 1/n; over X=(0,1) it has no limit in Pp(X). | Completeness matters; missing quantization hypotheses still need specificity. |
| 3.4 | μₙ=(1−1/n²)δ₀+n⁻²δₙ converges weakly to δ₀ but W₂²=1 and second moment=1 for every n. | Moment condition discriminates weak from Wp convergence. |
| 3.6 | Half-mass at 0 and 2 versus δ₀ gives W₁=1, W₂=√2, W∞=2; trivial-sigma two-point witness gives ∞ versus 1 in the Lean formula. | R01. Finite-p limit here is 2. |
| 3.8 | For δ₀,δ₂, the 1-Lipschitz function f(x)=−x has ∫f dδ₀−∫f dδ₂=2=W₁. | KR sign can be reversed by f↦−f. |
| 4.1 | δ₀ to (δ₋₁+δ₁)/2 has Kantorovich d²-cost 1 but no deterministic map, so Monge infimum ∞. | Correct feasibility distinction; R05. |
| 4.4 | Tₙ≡1/n, T≡0 over U[0,1]: graph plans converge weakly and μ{distance>η}=0 for n>1/η; Tₙ≡1 fails both with mass 1. | Sample graph/convergence-in-measure equivalence test passes. |
| 5.1 | u(x)=x²/2 has conjugate y²/2; Fenchel gap=(x−y)²/2, zero exactly at y=x. | Conjugate/subgradient native ownership R05. |
| 5.5 | U[0,1]→δ₂: T=2, convex potential 2x, squared optimum ∫₀¹(2−x)²dx=7/3. In dimension 0 the unique map has cost 0. | Target AC is unnecessary; native Brenier R05. |
| 5.9 | On U[0,1], U(x)=1−x factors as monotone rearrangement id composed with measure-preserving s=1−x; both compositions equal 1−x and both laws are uniform. | Sample matches Brenier's nondegenerate interval instance. |
| 6.1 | u=abs on ℝ has subgradient image at {0}=[−1,1], MA mass 2; u=x²/2 gives MA([a,b])=b−a. | Singular versus Hessian model distinguished. |
| 6.4 | On Ω=(−1,1), f=1 and boundary g=0 give u=(x²−1)/2; u''=1, u(±1)=0, minimum −1/2. | Dirichlet sign and convexity pass. |
| 6.6 | Same T: image length 2=∫₀¹2dx. For constant T, both image Lebesgue measure and Jacobian integral are 0. | Import GMT G2; retain approximate-gradient extension. |
| 6.9 | Quadratic u has Hessian 1, every finite-q local Hessian norm finite; abs has MA atom 2 and fails the bounded-density premise. | Regularity hypotheses exclude singular example. |
| 6.10 | Smooth uniformly convex quadratic domains with identity map have DT=I and det DT=1; source/target densities coincide. | Model passes; complete boundary theorem locators unverified. |
| 6.12 | For half-squared Euclidean cost, mixed Hessian −I has determinant (−1)ⁿ and MTW tensor 0; c=0 has determinant 0 and fails nondegeneracy. | A2/sign and weak MTW distinguished. |
| 6.13 | For c=−xy and u=x²/2 on closed [0,1], contact y=x: inverse contact also id, total image mass 1=Leb([0,1]). Boundary contacts can leave an open carrier. | Sample; closure convention needs verification. |
| 6.14 | Euclidean half-square cost has MTW=0 and identity transport on a ball is smooth; it satisfies weak, not strictly positive, MTW. | Do not conflate A3w with strict A3. |
| 6.15 | For split target in 6.7, T is smooth off {0}; singular set has volume 0 and one point. A global smoothness claim would fail at jump 2. | Partial versus global regularity distinguished. |
| 7.3 | U[0,1]→U[a,a+1] has unique map x+a, cost a² and half-cost a²/2; compactness is not used in this complete line instance. | Noncompact finite-moment tier retained. |
| 8.3 | This curve has ∫path action=2ᵖ=∫ metric speedᵖ; endpoints have Wp=2. | Superposition normalization passes for p>1. |
| 8.5 | For μₜ=(1−t)δ₀+tδ₁, W₁(μₛ,μₜ)=abs(t−s), variation=dt. Uniform single-jump paths give the same variation; continuous lifts cannot switch between0 and1. | BV endpoint passes; two-sided interval formula fails in R04. |
| 8.8 | Translation by2 on unit interval has endpoint Wpᵖ=2ᵖ and Eulerian action ∫abs(2)ᵖdμdt=2ᵖ; at p2 both4. | Unhalved Benamou–Brenier normalization passes. |
| 9.2 | δ₀→δ₂ gives Wp(μₛ,μₜ)=2 abs(t−s); on discrete {0,2}, W₂(δ₀,(1−t)δ₀+tδ₂)=2√t, not2t. | Sample geodesic hypothesis discriminates. |
| 10.3 | Two quadratic flows from a,b have separation e⁻ᵗ abs(a−b), matching EVI₁ contraction; at t0 separation abs(a−b). | λ sign passes; not every convex flow is automatically EVI. |
| 10.5 | Implicit iterates x_k=2(1+τ)⁻ᵏ converge at kτ=t to2e⁻ᵗ; energies converge to2e⁻²ᵗ. | Movement-to-flow model passes. |
| 11.1 | KL(2δ₀,δ₀)=2log2−1; forgetting the singleton coordinate keeps same masses/value. For probability diagonal versus product Bernoulli, KL=log2. | Finite-mass correction is needed; import existing data processing R05. |
| 11.2 | Gaussian reference mₐ gives KL(mₐ,mₐ)=0; heavy tail in R03 gives ∞ on left and −∞ on split right. | R03 restrict identity before splitting. |
| 11.7 | Iterating those Gaussian steps as τ→0 gives variance1+2t; heat equation gives d(variance)/dt=2. | JKO/heat normalization agrees. |
| 11.10 | On the flat circle, uniform density has grad logρ=0, heat derivative0, mass1 at all times. | Sample model passes; general extension hypotheses/locator unspecified. |
| 12.1 | For equal atoms0,2, p2 radius at1 is1 and at0 is√2; p1 minimizers fill[0,2]; p∞ radius at1 is1 and at0 is2. | Finite/p∞ meanings differ; import native definitions. |
| 12.5 | Population P=(δ(δ₀)+δ(δ₂))/2 has barycenter δ₁, functional1; δ₀ has value2. | Sample existence passes; missing headline R06. |
| 12.7 | Perpendicular uniform segments give W₂²=2/3 and two midpoint barycenters of value1/6; both satisfy the written strict-dimension predicate. | False; R02 changes < to ≤. |
| 13.1 | c≡2, product reference: optimum2, Gibbs Z=e⁻²/ε, and εKL(product,product)−εlog Z=2. | Static normalization passes; Z0 excluded. |
| 13.2 | For R=product Bernoulli, unique entropy minimizer is product with KL0; diagonal has KLlog2>0. | Strict convexity/finite feasibility meaningful. |
| 13.5 | C diagonal0/offdiag1: optimum between0 and εlog2, hence limit0; unregularized diagonal has entropylog2. | Zero-temperature bound passes. |
| 13.8 | K1×1=2, a=b=1 gives u1/2,v1, scaled entry1. For K=0 with a=b=1 no scaling gives mass1. | Positivity/support hypotheses discriminate; R09. |
| 13.9 | K=[[2,1],[1,2]]: largest cross ratio4, Δlog4, tanh(Δ/4)=1/3; two maps' product factor1/9. | Retain theorem; remove implementation R07. |
| 13.12 | For heat kernel generator(ε/2)Δ, variance εt. With f=g=1, ρ=1, both displayed Fokker–Planck sides0 (σ-finite reference, not probability). | Generator/backward sign passes; cite Wiener supplier. |
| 13.13 | γ(t)=2t has action(1/2)∫4=2=endpoint rate. Exact endpoints δ₀,δ₂ have finite quadratic half-cost2 but KL∞ for every ε>0. | Sample exact/relaxed recovery distinction passes; R11 source limit. |
| 14.3 | On unit interval with Lebesgue probability, f(x)=x has weak gradient1 and Cheeger energy1/2; f+g=2x has energy2=2·(1/2+1/2). | Quadratic/parallelogram normalization passes in model. |
| 14.4 | Identical one-point spaces embed together with coupling distance0, hence Sturm D0; identical measured spaces similarly have diagonal ambient cost0. | Sample definition model only; source uncertified. |
| 14.5 | A constant sequence of the same normalized RCD space has Sturm D0 at every n and unchanged K; product Euclidean flat models have Ricci0+0=0. | Stability/tensor model passes; source numbering unresolved. |
| 14.6 | Weighted ℝ, V=x²/2: Ric∞=1. At N2, Ric_N=1−x², giving1 at0 and−3 at2; N=n requires constant V. | Finite/infinite-dimensional formulas differ correctly. |
| 14.7 | For flat heat, f=x remains x: gradient square1=heat of gradient square1 at K0. OU means contract by e⁻ᵗ, giving W₂ bound2e⁻ᵗ from separation2. | Gradient/heat contraction normalization passes. |
| 14.8 | Euclidean RCD model, AC uniform source→point2 has unique constant map and cost7/3; atomic source→two atoms cannot be map-induced. | Source AC needed; endpoint source access unresolved. |
| 15.1 | Pull back a one-point kernel0 to two equally weighted points with kernel0: raw cardinalities1 and2, distortion0 via every coupling. | Weak isomorphism differs from raw isomorphism. |
| 15.3 | Uniform two-point metrics with distances1 and3: diagonal matching gives distortion²=(1/2)·(3−1)²=2, attained GW₂=√2. | Sample attainment/symmetry model passes. |
| 15.4 | Adding a zero-mass isolated point gives GW0 but no bijection of raw spaces; supports are isometric. Kernels0 and2 instead have distance2. | Both directions discriminated in models. |
| 15.5 | One-point kernels zₙ=1/n converge with GW-distance1/n to kernel0; in target(0,1) they have no limit there. For p∞ binary outgoing kernels of unequal masses a,b have GW∞1. | Completeness reflects target; no p∞ separability claim retained. |
| 15.7 | One-point real kernels form an isometric copy of ℝ: midpoint between0,2 is1, distances1+1=2 and Euclidean comparison equality holds. | Scalar L² geodesic/CBB model passes. |
| 15.8 | One-point kernels0,2, basepoint0: section-law Wp2, eccentricity Wp2, size difference2, GW2; all lower-bound terms equal2. | Bound direction and missing half factor tested. |
| 15.9 | Identical two-point unit-distance kernels: πₐ distortion²=4a−8a²; diagonal a1/2 gives0, independent a1/4 gives1/2, anti-diagonal a0 gives0. | Finite quadratic formula nonconvex: midpoint exceeds average0. |
| 15.10 | For that example product KL0, diagonal KLlog2; 0≤minimum Fε≤εlog2→0. Norm versus squared one-point barycenters give [0,2] versus{1}. | Finite existence/limit sound; missing headline R06 and objective R08. |

R01's Lean statement fails on the trivial-sigma example in row 3.6; its Borel repair gives 1=1. The exact native Sinkhorn probe in R09 closes the local declaration, with scaled entry and both marginals equal to 1 in row 13.8. The expanded-signature and pinned-definition audit above records the other Lean checks without repeating their README examples. Layer 16's computational promises are addressed in R07.

## Not verifiable

- **Exact seeded selection:** the worker supplied no target identifiers (“none found by heading”). The reproducible replacement sample of fifteen is described above, rather than claiming to have checked an unavailable worker selection.
- **Access accounting:** 50 source-service records were produced: 32 fetched, 9 publisher-only/uncertified, 9 failed. Agueh–Carlier was separately fetched successfully, bringing the distinct mathematical works requested to 51 and fetched texts to 33. All retrieval used the sources service and legal author, institutional, publisher or open-repository routes. Source contents were kept in its cache, not copied into the worktree or report. The source manifest was not edited in this read-only review.
- **Uncertified publisher sources:** `villani-old-new`, `santambrogio`, `ags-book`, `memoli`, `mtw`, `mccann-riemannian`, `benamou-brenier`, `sturm-mm`, `mccann-convexity`. The service resolved their publisher/DOI routes without readable full text. Their theorem locators, where present, remain uncertified; they are not repeated in the missing-reference request.
- **Failed sources:** `villani-topics` (AMS book landing page); `gigli-rajala-sturm` (SISSA repository returned 403); `jko` (SIAM returned 403); `lott-villani` (Annals landing page did not yield a permitted readable text through this request); `beiglbock-leonard-schachermayer` (EuDML/IMPAN redirect failure); `caffarelli-boundary` (Wiley 403); `caffarelli-w2p` (cited Annals landing URL unresolved); `sandier-serfaty` (Wiley 403); `serfaty` (AIMS landing page unresolved). These nine are retained in the job's missing-reference list; successful retries were removed from it. This review is finished, not parked awaiting these texts.
- **FKM carrier typography:** the text extraction loses closure bars in Lemma 3.1. The inverse-contact argument was read, but its full mass on an open U versus its closure cannot be certified from that extraction. The roadmap needs an explicit domain for the measure and inverse map. No counterexample finding is asserted solely from missing typography.
- **AGS-RCD version numbering:** the fetched arXiv v1 has tensorization at Theorem 6.11 and local-to-global at 6.20; the roadmap associates those numbers differently and also cites 6.13 and 6.22. A matching published text or a version-specific locator is needed. The computations of curvature and contraction above do not settle this bibliographical issue.
- **Primary Brownian Γ-limit:** Léonard's survey explicitly defers the precise Brownian hypotheses to another work. Its half-action convention is checked; the roadmap's exact endpoint recovery, equicoercivity and weak-class assertions are not fully certified from that survey alone.
- **Remaining precision:** model tests do not certify unnamed estimates or unspecified regimes. Layer 11.10's manifold extension and 15.10's GW barycenters need exact formulations.
- **External port claims:** Vlasov/Econlib/LeanTriathlon repositories were not independently rebuilt. Their proposed ports remain unverified; the pinned native declarations above are the supported evidence.

## Source issues

- **Misprint** in abedi-li-schultz at equation (3.6), Theorem 3.3, printed p.19: the source says a two-sided variation quotient uses [t,t+h]; it should be a right-sided limit or an interval with ordered endpoints; affects a stated result.
- **Error** in bmnn at Proposition 8(2), printed p.11: the source says metric-valued Lp is separable for arbitrary measure spaces and every stated p; it should be restricted to finite p and an appropriate separable measure algebra; affects a stated result.
- **Error** in bmnn at Proposition 8(3), printed p.11: the source says grid-constant functions approximate every Lp function throughout the stated exponent range; it should be restricted to finite p, since an irrational-threshold indicator has uniform error at least one half; affects a stated result.
- **Error** in bmnn at Proposition 36, printed p.30: the source says the network quotient is separable throughout the stated exponent range; it should be restricted to finite p, since unequal-mass binary outgoing kernels have infinity-distance one half; affects a stated result.
- **Error** in bmnn at Proposition 38, printed p.30: the source says the union of all finite uniform Z-networks is countable; it should be replaced by a countable dense subfamily when Z is separable; affects a stated result.
- **Error** in bmnn at Proposition 38, printed p.30: the source says finite uniform networks are dense throughout the stated exponent range; it should be restricted to finite p, since irrational binary masses obstruct infinity-norm approximation; affects a stated result.
