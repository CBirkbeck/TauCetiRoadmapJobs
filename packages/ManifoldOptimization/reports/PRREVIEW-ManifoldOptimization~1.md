# Review of ManifoldOptimization (pull request #1506 at 344c8fe)
**Verdict:** needs changes

Independent AI review of `TauCetiRoadmap/ManifoldOptimization/README.md` and `Suggested.lean`, at the requested head. The findings below are repairable; this is not a rejection of the mathematical subject. No pull-request file was changed.

## R01 (P1) — Remove the admitted manifold structure

**Location:** `TauCetiRoadmap/ManifoldOptimization/Suggested.lean:338–350`, `levelSetChartedSpace` and `isManifold_levelSet`.

**Claim:** The acceptance file may introduce its level-set atlas as admitted data and then state results about that atlas.

**Witness:** Line 342 supplies `sorry` as a `ChartedSpace` value. Line 348 installs precisely that value. The worker's `sorry-data=1` failure identifies this declaration; elaboration does not construct an atlas.

**Repair:** Delete both declarations from the acceptance file. Keep the mathematical atlas construction in the README, consuming the existing regular-fibre owner identified in R02. State only headlines on native carriers or a few simple definitions with real bodies. This removes the admitted structure even for the regular fibre of `(x,y) ↦ y`, whose intended carrier and tangent are the horizontal line.

## R02 (P1) — Repoint regular fibres to their actual owner

**Location:** `TauCetiRoadmap/ManifoldOptimization/README.md:268–269`, repeated at 307–310, 762–763 and 770–771.

**Claim:** LieGroupoidsPoisson G0.1 supplies the regular-fibre manifold construction, while O0.1 constructs the vector-valued level-set version anew.

**Witness:** `TauCetiRoadmap/LieGroupoidsPoisson/README.md:302–303` at its supplied open head explicitly consumes regular fibres from SmoothBundlesConnections B1.0. `TauCetiRoadmap/SmoothBundlesConnections/README.md:226–243` already includes the model-space-target specialization and atlas comparison.

**Repair:** Cite SmoothBundlesConnections B1.0 for regular fibres, their smooth embedding, tangent kernel and atlas independence. Retain only genuinely additional local-submanifold gluing and metric comparisons in O0.1. Replace all four stale ownership assertions. On `(x,y) ↦ y`, the supplier gives dimension 1 and tangent `ℝ × {0}`, exactly the object needed here. SmoothBundlesConnections is already an allowed earlier supplier; no new upward edge is needed.

## R03 (P2) — Carry the retraction domain into the fixed-step theorem

**Location:** `TauCetiRoadmap/ManifoldOptimization/README.md:539–544`; compare `Suggested.lean:199–211`.

**Claim:** A pullback bound on the retraction's domain implies the stated fixed-step decrease and summed-gradient bound without an admissibility assumption on the steps.

**Witness:** On ℝ set `R_x(v)=x+v` for `|v|<1`, and `100` otherwise. For `f(x)=x²/2`, the domain pullback bound holds with `L=1`. Starting at 2 gives `x₁=100`: `10004 ≤ 4` is false.

**Repair:** State `R.IsGlobal`, as the Lean theorems already do, or explicitly require every used step to lie in the domain. Include `K>0` for the minimum bound. Carry the corresponding domain obligations into the Armijo claims. With the global additive retraction the same start gives `2,0,0,…`, and the squared-gradient sum is `4 ≤ 4`. The local version can instead shorten admissible steps. B23 Proposition 4.8 explicitly requires the generated pairs to lie in the bound's set (B23 line 3081).

## R04 (P2) — Require a positive trust-region model bound

**Location:** `TauCetiRoadmap/ManifoldOptimization/README.md:566–573`; compare `Suggested.lean:311`.

**Claim:** The complexity assertion uses `‖g‖/β` but requires only `‖H_x‖≤β`, allowing `β=0`.

**Witness:** Take `f(x)=x²/2`, additive retraction, `H=0`, and every trial step zero. With `β=0,L=1,c₁=1/2,ρ'=1/8,Δ₀=1`, Cauchy decrease reads `0≤0`. The stated constant is 100, but from `x₀=1` every gradient norm remains 1.

**Repair:** Add `β>0`, matching Lean, even when `H=0`; any positive upper bound is available. For `β=1` the zero trial step at `x=1,Δ=1` fails the required Cauchy inequality `1/2≤0`, excluding the witness. Record this negative control. The tolerance `ε=1/2` makes the original claimed bound fail at every index up to 400, and beyond.

## R05 (P2) — State self-adjointness in the Grassmann example

**Location:** `TauCetiRoadmap/ManifoldOptimization/README.md:659–662`.

**Claim:** The critical subspaces of `−tr(XᵀAX)` are exactly the A-invariant subspaces, without a hypothesis on A in this example.

**Witness:** For `A=[[0,1],[-1,0]]` the cost is identically zero on `Gr(2,1)`, so every line is critical. Yet `A e₁=−e₂`, and `span(e₁)` is not invariant.

**Repair:** Introduce a real symmetric A explicitly in this bullet; also state `0≤p≤n` and `1≤p<n` for the gap-indexed clause. Alternatively formulate criticality for the symmetric part of A. The skew witness then has symmetric part zero, so all lines are invariant as required. For the repaired symmetric control `diag(2,1)`, `span(e₁)` has cost −2 and transverse Hessian 2; `span(e₂)` has cost −1 and Hessian −2.

## R06 (P2) — Remove the computational solver specification

**Location:** `TauCetiRoadmap/ManifoldOptimization/README.md:556–565`, also the executable iteration scope at 144–155 and 545–552.

**Claim:** This library roadmap includes implementing truncated conjugate gradients, its branching loop, and its iteration/termination procedure.

**Witness:** O4.3 specifies initialization, curvature and boundary branches, residual updates, a stopping test, and termination within the tangent dimension. This is a computational algorithm, expressly excluded by the review contract.

**Repair:** Remove the solver procedure and implementation/termination target. Retain mathematical theory of quadratic models, Cauchy-decrease inequalities, residual bounds, retraction calculus and convergence for sequences satisfying precisely stated mathematical hypotheses. Reconcile the headline list with that scope; a solver implementation cannot remain a hidden prerequisite. The scalar model `m(s)=1/2+s+s²/2` at radius 1 has minimizer −1 and decrease 1/2, so the useful mathematical comparison survives without a solver loop.

## R07 (P3) — Remove the import of another roadmap

**Location:** `TauCetiRoadmap/ManifoldOptimization/Suggested.lean:12,26,82–89`.

**Claim:** Headline signatures may depend on `TauCetiRoadmap.DifferentialGeometry.Suggested`.

**Witness:** Line 12 is a roadmap import, and line 26 takes `mgradient` and `hessian` from its namespace. The worker reports `imports=1`; a successful build through admitted supplier targets does not meet the acceptance-file import contract.

**Repair:** Remove the import and namespace opening. Express the small gradient/Hessian definitions needed by the headlines through the pinned `Riemannian.Tensor.rieszDual`, `mfderiv` and Levi-Civita connection, with real bodies and an explicit README identification with DifferentialGeometry's owned objects. Do not reproduce its API. The supplier's bodies at `TauCetiRoadmap/DifferentialGeometry/Suggested.lean:3148` and 3188 show these are short native expressions. For the Euclidean cost `x²/2`, the expressions give gradient x and Hessian 1. Rebuild with only `Mathlib` and the individual used `TauCeti.*` imports.

## R08 (P3) — Supply exact source locators and a complete bibliography

**Location:** `TauCetiRoadmap/ManifoldOptimization/README.md:296,408,440,512,537,581,599,814`.

**Claim:** Chapter bundles and bare source keys identify the theorem supporting each target.

**Witness:** O0.3 includes ten different manifold constructions under several chapters; O5 cites whole chapters; O6.5 has no EVI locator. The last bibliography entry ends mid-title. There is no `sources.toml` in the folder.

**Repair:** Put theorem/definition/equation numbers and version-specific pages beside individual claims, including proof-derived extensions. Complete LWHWXW24's title and record each work under its existing bibliography key in a sources manifest. Use the legal-text results and exact locators below; mark the five inaccessible works uncertified rather than guessing. For example, the local nearest-point theorem is AM12 Lemma 4, pp. 140–141, and B23's fixed-step result is Proposition 4.8, pp. 59–60 in the author PDF. Adding those locators identifies the relevant domain assumptions immediately.

## R09 (P3) — Make the definitions' API, Checks and dependencies explicit

**Location:** `TauCetiRoadmap/ManifoldOptimization/README.md:298–329,442–447,496–508,768–784`; `Suggested.lean:14–18`.

**Claim:** The present list of O-numbered paragraphs and global examples is a complete roadmap specification.

**Witness:** There are no per-definition `**Checks.**` lists and no per-target `*Needs:*` lines. None of the seven O-layers ends in `Examples` and `Dependencies`. The module docstring neither identifies README.md as the roadmap nor accounts for missing headlines.

**Repair:** Use the requested Summary, Scope and ownership, Exact supplier contracts and Layer headings; retain the mathematical detail while giving each definition its API and at least three discriminating Checks, and each target its own dependencies. For Sinkhorn scaling, useful controls are `SK([2])=[1]`, `SK(J₂/2)=J₂/2`, and the totalized `SK(0₂)=0₂`, distinguishing scaling from identity and from an arbitrary constant map. Document the missing O5.3 truncated-CG convergence headline and its missing construction, or replace the scope as required by R06. Do not insert a weaker substitute. Also restore layer order in the acceptance file: it currently presents O2/O4 before O0/O1.

## R10 (P3) — Delete acceptance-file padding

**Location:** `TauCetiRoadmap/ManifoldOptimization/Suggested.lean:87–89,412–414,609–614`, with the example-only API at 585–597.

**Claim:** Definitional equalities and the sphere specialization belong among headline acceptance theorems.

**Witness:** `inner_hessianOp` and `toMatrix_apply` already close by `rfl`. The sphere constancy theorem closes by one `exact` application of the preceding general constancy theorem, installing its stated metric and the nonempty/connected instances from x.

**Repair:** Delete these declarations from `Suggested.lean`; retain their mathematical facts as README API or Checks without claimed Lean names. The Rayleigh gradient/eigenvector API also belongs in the README; retain the actual benign-landscape headline. The one-tactic sphere probe elaborated successfully: it adds no mathematical input beyond the general theorem, and still yields `3=3` for a constant cost on the round circle. Do not merely prove these declarations in place.

## R11 (P3) — Replace the two commit-pinned roadmap links

**Location:** `TauCetiRoadmap/ManifoldOptimization/README.md:255,273`.

**Claim:** SmoothBundlesConnections and VariationalMethods are supplied by the historical linked snapshots.

**Witness:** Both URLs have `blob/<commit>`; the worker's `blob=2` failure names these lines. The resolved live supplier sections are SmoothBundlesConnections B5/B6.0 and VariationalMethods Layer 4.

**Repair:** Link the roadmap paths on main where applicable, or cite the named roadmap and exact section for an allowed new open roadmap. The claims resolve to parallel transport/convex normal neighbourhoods and successive Rayleigh minima, respectively; no historical snapshot is needed.

## R12 (P3) — Remove the gate's forbidden wording

**Location:** `TauCetiRoadmap/ManifoldOptimization/README.md:50,77,80,280,294,307,329,690,734,778`.

**Claim:** The document passes the timeless/style scanner.

**Witness:** The worker reports `residue=11`, including two matches on line 77, for the repeated word “catalogue”. These are mathematical uses rather than suspicious instructions, but the supplied gate rejects them.

**Repair:** Replace these occurrences with “matrix manifolds”, “listed manifolds”, or the exact O0.3 reference as appropriate. Re-run the gate. Also replace the provisional/process descriptions in the Lean docstrings when fixing R01/R09. No mathematical statement changes in this repair.

## Verified sound

The checks here distinguish computations, elaboration, source support and unresolved verification. An instance calculation is evidence against a particular defect; it is not a proof of the general theorem.

**Build and mechanical evidence.** Confirmed head `344c8feb0f2c0ae0b5f85c6e62ea17322c5ab17c`. The diff outside `TauCetiRoadmap/ManifoldOptimization` is empty. The folder contains README.md, Suggested.lean and metadata.toml. The targeted `lake build TauCetiRoadmap.ManifoldOptimization.Suggested` and the requested direct `lake env lean` elaboration both passed, with only admitted-declaration warnings. The supplied gate remains FAIL: `blob=2`, `sorry-data=1`, `residue=11`, `imports=1`; all other supplied counters, including build, are zero. These four failing rules are covered by R01, R07, R11 and R12.

The requested dependency command returned exactly:

```text
depcheck: 205 roadmaps, 1497 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The automated citation resolver reported no unresolved cross-roadmap citations; its own output says it did not inspect pinned library names. R02 shows why the content of a resolved section still needs inspection. The README has zero `*Needs:*` lines; all supplier prose and its Ordering section were read. No declared gaps were supplied. No source passages appear to have been copied in the sampled statements.

**Elaborated signatures and padding.** A scratch copy printed `#check @name` for all **64** top-level declarations, including the structure and its named definitions; all signatures elaborated. The local convergence and convexity theorems retain `IsRiemannianManifold`, finite dimension and their required regularity; the constancy theorem's `include I` retains the geometric assumptions. Newton's defining step does not retain `IsRiemannianManifold`, which is appropriate: its body uses tangent data, while its rate theorem carries distance compatibility. `rayleighCost` does not retain finite dimension, also appropriately. No lost load-bearing section hypothesis was found. README-to-signature mismatches are R03 and R04, not dropped Lean binders. All **30** admitted theorems were probed with `simp`, `rfl`, and `infer_instance` on a copy; none closed by those three tactics alone. The sphere theorem additionally closed by a single `exact` term applying the general theorem with the required instances. The original file was not altered.

**Headline coverage.** README lines 34–40 name five theorem families: fixed-step/trust-region `O(ε⁻²)` bounds; local quadratic Newton convergence; local superlinear truncated-CG trust-region convergence; the benign Rayleigh landscape; and the strongly geodesically convex linear rate. The file represents four families (both global bounds are present). O5.3 is absent and is not identified as unstatable in the docstring. Gradient and Hessian are presently obtained through the prohibited roadmap import; R07 explains the native expressions that can make these headlines legal. No native truncated-CG construction was located at the pins; its procedural construction is subject to R06.

**Source sample.** The brief supplied no target IDs (it said none were found by heading). To make the check reproducible, I sampled 15 of the 30 distinct O-numbered target paragraphs using Python `random.Random` seeded with the full head string. The resulting IDs are O0.1, O0.2, O0.3, O1.1, O1.2, O2.1, O2.2, O2.3, O3.6, O4.1, O4.3, O5.1, O5.3, O6.4 and O6.5. No target is explicitly marked “unverified” in the README. Because the document supplies chapter-level rather than exact locators, the following records both actual supporting text and the limits of verification. B23 page numbers below are the printed numbers of the author-hosted pre-publication PDF; the author confirms theorem numbering agrees with the publication but pagination differs.

| Sample | Text inspected and locator | Support and limits |
|---|---|---|
| O0.1 | B23 line 1613, Definition 3.10, p. 26; line 1735, Theorem 3.15, p. 29 | Local defining functions and tangent kernel agree. The empty-manifold extension is formal convention, not the source's nonempty definition. Supplier ownership is R02. |
| O0.2 | B23 line 2496, Exercise 3.67, pp. 46–47; line 10966, Theorem 9.35, p. 233 | Product gradients and descent of the horizontal metric. A smooth quotient is assumed; the roadmap already assumes a surjective submersion, so freeness/properness is not additionally needed for metric descent. |
| O0.3 | B23 §§7.1–7.4 and 9.7; DH19 line 599, Theorem 1, p. 6 of the arXiv text | Sphere/Stiefel/fixed-rank and quotient geometry were compared. DS projection agrees with the compatible linear equations. The source pseudoinverse error below must not be imported. No single chapter citation certifies every carrier and distance formula. |
| O1.1 | B23 line 2482, Exercise 3.66, p. 45 | Smoothness of orthogonal projectors is stated. The displayed regular-level formula is a derivation using full row rank, tested below. |
| O1.2 | B23 line 2420, Proposition 3.61, p. 44; DH19 line 639, Lemma 1, p. 6 | Projected ambient gradient and Fisher-weighted gradient have the stated signs/scaling. The differentiable-at-point variant follows directly from the derivative/Riesz identity. |
| O2.1 | B23 line 2230, Definition 3.47, p. 39; line 3418, Corollary 4.17, p. 66 | Retraction velocity and inverse at zero. The discussion following Definition 3.47 admits local domains; no permission to use off-domain values follows. |
| O2.2 | AM12 line 300, Lemma 4, pp. 140–141; line 356, Proposition 5, p. 142; B23 line 5806, Proposition 5.55, p. 115; DH19 line 726, Lemma 2, p. 7 | Local nearest-point smoothness and second order agree; exponential-and-scaling DS retraction agrees. QR exceptions and Fisher acceleration were independently computed. |
| O2.3 | B23 line 5422, equation (5.25), p. 107; line 5458, equation (5.28), p. 108 | The acceleration correction has positive sign. Source gives a smooth one-parameter expansion; the C² little-o and compact-uniform version require the stated compact Taylor argument, not verbatim application of its O(t³) formula. |
| O3.6 | B23 line 6104, Theorem 6.7, p. 122; MorseTheory M1 | Source uses criticality and Hessian invertibility. The equivalence with Tau Ceti's chart predicate is a supplier/native-Riesz comparison, not a theorem named by the chapter citation. |
| O4.1 | B23 line 3079, Proposition 4.8, pp. 59–60; BAC19 line 305, Theorem 5, p. 8, and Corollary 6 | The decrease constant is `1/(2L)` and the gradient bound is of order `K⁻¹/²`. Source includes domain restrictions missing in the README (R03). |
| O4.3 | BAC19 line 634, Theorem 12, p. 14; lines 664 and 756, Lemmas 14 and 16, pp. 15–18 | Radius-floor and accepted/rejected-step counting support the route. The README's constant is a looser derived bound, not the displayed source constant. Positivity of β is essential (R04). Ste83 itself was inaccessible. |
| O5.1 | B23 line 3506, Theorem 4.20, pp. 68–69; MorseTheory M6 | The B23 theorem concerns fixed-step local convergence, not this Armijo theorem. M6 supplies the local gradient inequality. The cited AMS08 local Armijo result could not be text-verified. |
| O5.3 | ABG07 line 714, Theorem 4.12, p. 19; line 726, Theorem 4.13, p. 20 of the author preprint; B23 line 7238, Theorem 6.29, p. 147; line 7255, Theorem 6.30, p. 148 | The rate exponent is `min(1+θ,2)`. The source capture theorem carries global/model/retraction assumptions; the roadmap must give an explicit localized route if dispensing with those assumptions. Publication numbering for ABG07 was not certified. |
| O6.4 | B23 line 14681, Proposition 11.12, p. 314 | Convexity plus an attained interior maximum gives constancy. Compactness and local minimizing segments supply the roadmap's application. |
| O6.5 | Completed/HopfRinow Layer 2; OptimalTransport Layer 10 | The energy variation and EVI interfaces resolve. B23 Ch. 11 does not supply an identified EVI theorem here; this target has no exact source locator and remains uncertified as a source claim. Euclidean EVI signs were computed below. |

The legal source fetches also obtained EAS98, BMAS14 and LWHWXW24. These were used for the object/prior-work audit; no claim of published/preprint page-number identity is made. B23 is available from [the author's book page](https://www.nicolasboumal.net/book/); AM12 and ABG07 were fetched from Absil's author pages. The Project Euclid “successful” Sin64 fetch was inspected and contains an access-error page, not the article.

**Adversarial computations.** These rows cover the 15 sample blocks, all headline families, every Lean declaration, the additional README constructions and the worked/negative examples. Unless indicated otherwise, vector spaces have their Euclidean metrics, retractions are additive, and matrices have the stated Frobenius metric. “Survives” means the displayed instance agrees. Rows citing R-numbers prescribe changes; no changes were made to the pull request.

| Statement / object | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| Real, finite-dimensional, boundaryless conventions | Point; ℝ; half-line at 0 | Tangent dimensions 0,1,1; on half-line `f(x)=x` has minimum at 0 but derivative 1 | Boundaryless hypothesis excludes the last case. |
| Riemannian versus ambient distance | Antipodes on S¹; two components of O(1); point | Intrinsic distance π versus chordal distance 2; intercomponent intrinsic distance ∞; point distances 0=0 | Intrinsic compatibility is necessary; blanket failure of the ambient metric should be read only for genuinely curved/non-length cases. |
| Matrix/Frobenius and singular-value conventions | `diag(3,1)` | Frobenius norm √10; operator norm and `σ₀` 3; `σ₁=1,σ₂=0` | Survives; zero padding is needed in fixed-rank gap formulas. |
| `toMatrix` | 1×2 coordinates `(2,−3)`; 0×2 | Matrix entries `(2,−3)` equal coordinates; empty matrix has norm 0 | Real body has the right carrier. |
| `toMatrix_apply` | Entry `(0,1)` of that matrix | −3=−3, definitionally | R10: delete padding. |
| Functional calculus and entrywise distinction | `X=diag(4,1)` | `X^(1/2)=diag(2,1)`; inverse square root `diag(1/2,1)`; `logm X=diag(log4,0)` | Survives on positive-definite domain. |
| O0.1 local defining equations | `h(x,y)=y`; `h=x²−y²` at 0; empty fibre | First kernel `ℝ×{0}`, dimension 1; second derivative map 0 is not onto; empty fibre has 0 points | Regularity rejects crossing; R02 for ownership. |
| `levelSetChartedSpace` | Horizontal line | Intended chart coordinate x; supplied Lean value is an unconstrained admitted atlas | R01, no constructed atlas to evaluate. |
| `isManifold_levelSet` | Same line | Intended dimension 1; theorem is relative to admitted atlas, not that coordinate construction | R01. |
| O0.1 defining-function independence | `h=y` and `h'=2y` | Both kernels horizontal; coordinate identity has derivative 1 | Comparison survives; consume supplier independence. |
| O0.2 product metric and gradients | `f(x,y)=x²/2+2y²` at `(1,1)` | Gradient `(1,4)`; Hessian `diag(1,4)`; norm squared 17 | Equals componentwise formulas. |
| O0.2 finite powers | `k=0,1,2` of a line | Dimensions 0,1,2; squared norm of empty tuple 0, of `(3,4)` 25 | Empty power is a point, not an empty space. |
| O0.2 component restriction | Positive component of ℝ\{0}, points 1,2 | Component distance 1 equals ambient Riemannian distance; across signs distance ∞ | Survives. |
| O0.2 quotient metric | Projection `(x,y)↦x`, vertical translations | Horizontal vector `(3,0)` has squared norm 9; quotient vector 3 has squared norm 9 | Unique quotient metric is Euclidean. |
| O0.3 sphere | S¹ at e₁, `z=(2,3)`; S⁰ | Projection `(0,3)`; tangent pairing with e₁ is 0; S⁰ tangents 0 | Survives. |
| O0.3 oblique | `OB(2,2)` at `[e₁,e₂]`; zero columns | Tangent dimension 2; projection of identity is 0; zero-column carrier dimension 0 | Product/sphere formulas agree. |
| O0.3 Stiefel | `St(2,1)`, `St(2,2)`, `St(2,0)` | Dimensions 1,1,0; at identity `Proj([[1,2],[3,4]])=[[0,−1/2],[1/2,0]]` | Tangency equation gives zero symmetric part. |
| EAS98 metric normalization control | Y=I₂, Ω=[[0,−1],[1,0]]; horizontal Grassmann unit vector | Stiefel Frobenius squared norm 2 versus canonical 1; Grassmann horizontal norms 1=1 | Source prose has normalization errors listed below; roadmap uses the declared Frobenius metric. |
| O0.3 orthogonal groups | `O(1)`, `SO(1)`, `SO(0)` | Cardinalities 2,1,1; all tangent dimensions 0; determinants ±1,1,1 | Connected-component convention is necessary. |
| O0.3 Grassmann quotient | Lines e₁ and e₂ in ℝ²; `p=0,n` | `XᵀY=0`, angle π/2 and distance π/2; both endpoint-rank Grassmannians are points, distance 0 | Survives. |
| Grassmann projector embedding | `X=e₁`, `XQ=−e₁` | Both give `XXᵀ=diag(1,0)`; off-diagonal tangent `[0,1;1,0]` has Frobenius norm √2 | Smooth embedding, not an unclaimed isometry. |
| Principal-angle ordering | Two angles π/3,π/6 | Descending sines `(√3/2,1/2)` give cosines `(1/2,√3/2)`; overlap singular values reverse that order | Norm of angles is unchanged; specify permutation if using indexed equalities. |
| O0.3 fixed rank | Rank 1 at `diag(1,0)` | Tangents `[[a,b],[c,0]]`, dimension 3=(2+2−1)1; sequence `diag(1/k,0)` tends to rank 0 | Formula and nonclosedness survive. |
| O0.3 positive-definite geometry | `P(1)`, X=4,Y=9,U=4 | Metric `U²/X²=1`; exp `4e`; distance `log(9/4)`; midpoint 6 | Affine-invariant formulas agree. |
| `fisherEmbedding` | x=(1/4,3/4); negative scalar −1 | Image `(1,√3)` has squared norm 4; totalized square root at −1 is 0 | Positivity domain prevents junk derivative claims. |
| `contDiffOn_fisherEmbedding` | Positive scalar 1/4; excluded zero | Derivative 2; right derivative of `2√t` at zero diverges | Positive-orthant restriction is necessary. |
| `fderiv_fisherEmbedding_apply` | x=(1/4,3/4), u=(1,−1) | Derivative `(2,−2/√3)` equals `u/√x` | Survives. |
| `inner_fderiv_fisherEmbedding` | Same x,u=v | `4+4/3=16/3`; Fisher sum `1/(1/4)+1/(3/4)=16/3` | Factor 2 is correct. |
| O0.3 open simplex projection | x=(1/4,3/4), z=e₁; n=1 | Projection `(3/4,−3/4)`, sum 0; n=1 tangent/projection 0 | Fisher normal subtraction agrees. |
| Simplex square-root metric/distance | x=(1/4,3/4), y=(3/4,1/4) | Square-root dot √3/2; spherical angle π/6; Fisher distance π/3 | Quarter-metric and factor-2 distance agree. |
| O0.3 multinomial product | Two identical simplex columns; m=0 | Two tangent copies give squared norm `2·16/3=32/3`; m=0 gives 0 | Sum metric, dimension `m(n−1)` agree. |
| O0.3 DS tangent/projection | X=J₂/2, Z=E₁₁; n=1 | Projection `[[1,−1],[-1,1]]/4`, row/column sums zero; dimension 1; n=1 dimension 0 | Compatible normal equations determine correction uniquely. |
| DS normal ambiguity | X=J₂/2, shift `(α,β)↦(α+c1,β−c1)` | `(α_i+c)+(β_j−c)=α_i+β_j`; correction unchanged | Scalar ambiguity is correctly allowed. |
| Fisher incompleteness | Simplex `(p,1−p)` approaching vertex; DS(2) | Distance to boundary from p=1/2 tends to π/2; DS length scaled by √2 remains finite | Cauchy approach has no interior limit; n=1 excluded. |
| `IsInducedBy` | Identity inclusion of ℝ; scaling map `ι(x)=2x` with unchanged metric | Inner products 1=1 for identity; 1≠4 for scaling | Predicate excludes wrong metric scaling; it alone asserts no smoothness, correctly supplied in theorems. |
| `tangentSubspace` | `ι(t)=(t,0)`; constant map | Range horizontal; constant-map range `{0}` | Immersion/induced-metric hypotheses are needed downstream. |
| O1.1 projector formula | `Dh=[0,2]` | `I−Dh*(Dh Dh*)⁻¹Dh=diag(1,0)` with scalar denominator 4 | Surjectivity guarantees inverse; not true without it. |
| `hessianOp` | f=x²/2 at x=1 | Operator multiplication by 1; bilinear value on (2,3) is 6 | Same Hessian as supplier. |
| `inner_hessianOp` | Same f,v=2,w=3 | 6=6, by definition | R10. |
| `mvfderiv_mgradient_comp` | Circle at e₁, ambient linear cost `2x+3y` | Intrinsic ambient gradient `(0,3)` equals projection of `(2,3)` | Survives; Fisher inclusions need changed metric. |
| O1.2 quotient gradient | `(x,y)↦x`, cost x²/2 at `(1,2)` | Lift of base gradient 1 is `(1,0)`; lifted-cost gradient `(1,0)` | Survives. |
| Fisher gradient formula | x=(1/4,3/4), cost x₁ | Weighted projection `(3/16,−3/16)`; Euclidean projection `(1/2,−1/2)` | Correctly separates the metrics. |
| O1.3 shape form | Unit circle, cost x₁, x=e₁,u=e₂ | Ambient Hessian 0; outward shape operator −id; intrinsic Hessian(u)=−u | Plus shape term gives −u. |
| `mvfderiv_hessianOp_comp` | Same circle, constraint `h=‖x‖²−1` | λ=1/2; Hessian of ambient cost minus λh is −I; projected value −u | Lagrangian minus sign is correct. |
| O1.3 Stiefel Hessian | p=1, same circle cost | `sym(Xᵀ∇f)=1`; projected expression `Proj(0−u)=−u` | Agrees with sphere. |
| O1.3 quotient Hessian/kernel | Lift x²/2 from ℝ to ℝ² | Hessian `diag(1,0)`; vertical e₂ maps to 0 | Vertical degeneracy survives. |
| `deriv_deriv_comp_eq` | f(x)=x²/2, γ(t)=t², t=1 | `(t⁴/2)''=6`; Hessian term 4 plus gradient–acceleration term 2 | Both terms are necessary. |
| Embedded acceleration projection | Circle γ(t)=(cos t,sin t) | Ambient γ''(0)=−e₁; tangential projection 0; covariant acceleration 0 | Survives. |
| `Retraction` | Additive R; wrong R=x+2v; domain strip | Zero laws x=x; velocities v versus 2v; strip includes each zero | Velocity law excludes rescaling; domain may be proper. |
| `Retraction.retr` | x=2,v=−1/2 | 3/2=R(2,−1/2) | Real body agrees. |
| `Retraction.IsGlobal` | Full tangent domain; `|v|<1` strip | Equal-to-univ is true versus false | Distinguishes R03's witness. |
| `Retraction.isLocalDiffeomorphAt_retr_zero` | R=x+v+v² | Derivative at zero 1; inverse branch derivative 1 | Local result holds though global injectivity fails (`v=0,−1` coincide). |
| `Retraction.IsSecondOrder` | R=x+v versus x+v+v² | Acceleration at zero 0 versus 2v² | Excludes plausible first-order-only model. |
| `expRetraction` | Euclidean line | expₓ(v)=x+v; value at zero x; velocity v | Native construction has real body. |
| `expRetraction_isSecondOrder` | Euclidean line; unit sphere | Covariant acceleration 0 in both; sphere ambient acceleration −‖v‖²x | Correct distinction between ambient and intrinsic acceleration. |
| Metric-projection retraction | Circle e₁+te₂ | `(1,t)/√(1+t²)`; velocity e₂, acceleration −e₁ | Tangent acceleration 0. |
| Stiefel polar retraction | X=[e₁,e₂], U=[e₃,e₃] | Acceleration `[[-1,-1],[-1,-1],[0,0]]`; normal coefficient symmetric | Second order. |
| Stiefel QR retraction | Same X,U | Acceleration `[[-1,-2],[0,-1],[0,0]]`; tangent part `[[0,-1],[1,0],[0,0]]` | Not second order; worked example agrees. |
| QR exception O(2) | Ω=[[0,−1],[1,0]] | `(I+tΩ)ᵀ(I+tΩ)=(1+t²)I`; QR equals polar `(I+tΩ)/√(1+t²)` | Second order here. |
| QR on O(3) | U from README line 668 | `UᵀU=[[2,0,0],[0,1,1],[0,1,1]]`; QR acceleration `[[-2,0,0],[0,-1,-2],[0,0,-1]]` | Not symmetric; normality fails. |
| Grassmann retraction descent | X and −X, p=1; horizontal U and −U | `span(qf(X+U))=span(qf(−X−U))` | Same quotient point; frame signs do not matter. |
| Fixed-rank SVD retraction | Z=diag(2,1), r=1; tie Z=I₂ | Singular gap 2>1 gives unique diag(2,0), squared error 1; tie gives both diagonal rank-one projectors, error 1 | Gap excludes nonuniqueness. |
| Simplex exponential retraction | p=1/4, ξ=(1,−1) | First derivative 1; scalar second derivative p″=8/3; Christoffel −4/3; covariant acceleration 4/3, norm `16/(3√3)` | Matches README line 673; not second order. |
| DS exponential/scaling retraction | DS(2) with p=1/4 and tangent `[[1,−1],[-1,1]]` | Same scalar curve; full squared speed twice simplex; nonzero acceleration norm multiplied by √2 | Not second order. |
| `sinkhornScaling` | [2], J₂/2, zero 2×2; n=0 | Scaled values [1], J₂/2, zero; empty matrix maps to itself | Correct totalization and n=0 case. |
| `contDiffOn_sinkhornScaling` | Positive 1×1 input a | Output 1; derivative 0 for a>0, smooth | Positive domain is essential to the stated theorem. |
| `fderiv_sinkhornScaling` | X=J₂/2,Z=E₁₁ | Derivative `[[1,−1],[-1,1]]/4`; removed part `[[3,1],[1,−1]]/4` equals `(α_i+β_j)X_ij` for α=β=(3/4,−1/4) | Row/column constraints and normal correction agree. |
| Sinkhorn logarithmic linearization | P=J₂/2 | Kernel `(a,b)=(c1,−c1)`; rank 3 in dimension 4; image satisfies equal sums | Scalar quotient is necessary. |
| O2.3 acceleration quadratic and Taylor | R=x+v+v², f(x)=x, base 0 | Acceleration 2v²; Hessian 0, gradient 1; expansion `v+v²=v+½(2v²)` | Acceleration cannot be dropped away from a critical point. |
| `SatisfiesPullbackBound` | f=x²/2,L=1; f=x⁴ at x=0 | Quadratic remainder v²/2 equals bound; quartic requires v⁴≤Lv²/2 for all v, false at large v | Discriminates bounded from unbounded curvature. |
| `PullbackBoundAt` | f=x²/2,x=1,s=−1,L=1 | Absolute remainder 1/2 equals Ls²/2 | Two-sided bound agrees. |
| `exists_satisfiesPullbackBound` | Circle cost x₁, exponential R; point | Along unit-speed arcs `|f''|≤1`, so remainder≤v²/2; point remainder 0≤0 | Compact/global case survives. |
| Vector transport linearity | R=x+v on ℝ; wrong map u↦u² | Identity maps 2+3 to 5=2+3; square maps to 25≠4+9 | Linearity excludes wrong model. |
| Differentiated retraction transport | R=x+v+v² | `T_v u=(1+2v)u`, at v=0 equals u | Smooth and linear in u, not necessarily isometric. |
| Sphere projection transport | x=e₁,v=e₂,u=e₂ | New point `(e₁+e₂)/√2`; projection of u `(-e₁+e₂)/2`, norm 1/√2 instead of 1 | Nonisometry witness agrees. |
| Exponential parallel transport | Unit circle, v=e₂ | Transport sends e₂ to unit tangent at angle 1; both norms 1 | Correctly associated with exponential retraction. |
| `mgradient_eq_zero_of_isLocalMin` | f=x² at 0; boundary control f=x | Gradient 0 at interior minimum; gradient 1 at half-line minimum | Boundaryless hypothesis matters. |
| `hessian_nonneg_of_isLocalMin` | f=x²,x⁴ at 0 | Hessians 2 and 0, both ≥0 | Degenerate minimum correctly included. |
| `eventually_lt_of_hessian_pos` | f=x² at 0; zero-dimensional point | `f(y)−f(0)=y²>0` for y≠0; punctured point neighbourhood empty | Strict local minimum uses punctured filter correctly. |
| O3.3 quadratic growth | f=x² at 0 | `f(y)−f(0)=1·dist(y,0)²` | Positive growth coefficient exists. |
| O3.4 KKT equivalence | Circle at e₁, cost x₁, h=‖x‖²−1 | Gradient e₁ equals λ·2e₁ at unique λ=1/2; tangent Lagrangian Hessian −1 | Criticality does not imply minimality. |
| O3.5 second-order criticality | f=x³ at 0; quotient lift x²/2 | Gradient/Hessian 0/0 but f(−δ)<0; lift Hessian diag(1,0) is PSD | Definition and quotient equivalence survive; local-minimum converse fails. |
| `isManifoldNondegenerateCriticalPoint_iff_isUnit_hessianOp` | f=−x²,x⁴ at 0; zero space | Hessian −2 is a unit; 0 on ℝ is not; zero-space identity=zero is invertible | All indices and dimension zero handled. |
| `rgdStep` | f=x²/2,α=1,x=2 | 0=2−2 | Correct descent sign. |
| `rgdSeq` | Same data, k=0,1,2 | Sequence 2,0,0 | Initial value and iteration agree. |
| `rgd_sum_sq_norm_mgradient_le` | Same data,K=0,1,2 | Sums 0,4,4; RHS 4 | Survives with global R; R03 without it. |
| `rgd_exists_norm_mgradient_le` | Same data,K=1,2 | K=1: gradient 2=√4; K=2: minimum 0≤√2 | K>0 excludes empty-index conclusion. |
| `tendsto_norm_mgradient_rgdSeq` | Same sequence | Norms 2,0,0,… tend to 0 | Consistent. |
| `armijoExponent` | f=x²/2,αbar=4,τ=r=1/2,x=1; x=0 | α=4,2 fail decrease, α=1 passes, exponent 2; at 0 exponent 0 | Least-exponent and stationary cases agree. |
| `armijoStepSize` | Same data | `4·(1/2)²=1`; at stationary point returns 4 | Totalized size does not move a zero gradient. |
| `armijoStep` | Same x=1 | x⁺=0; actual decrease 1/2 | Correct. |
| `armijoSeq` | Start 1 | 1,0,0,… | Correct. |
| `armijo_decrease` | Same constants,L=1 | Bound `r·min(4,1/2)·1=1/4`; actual decrease 1/2 | Inequality holds. |
| `tendsto_norm_mgradient_armijoSeq` | Same sequence | 1,0,0,…→0 | Consistent. |
| `mgradient_eq_zero_of_mapClusterPt_armijoSeq` | Same sequence | Only cluster point 0; gradient 0 | Correct; C¹ connects function and cluster value. |
| `trModel` | f=x²/2,x=1,H=1 | `m(s)=1/2+s+s²/2`; m(0)=1/2,m(−1)=0 | Linear and half-quadratic factors correct. |
| Cauchy point bound | g=H=Δ=1; H=0 | Decrease 1/2 equals lower bound 1/2; H=0 radial step −1 gives decrease 1 | Zero-H special convention is necessary. |
| Truncated-CG recurrence | g=H=Δ=1; g=0 | First α=1, boundary output −1; stationary output 0 | Mathematics of example agrees; procedural scope R06. |
| `trRatio` | Exact quadratic step −1; stationary zero step | `(1/2)/(1/2)=1`; `0/0=0` in Lean | Junk ratio is correctly specified. |
| `trUpdate` | ρ=1,boundary Δ=1,cap2; ρ=0 | Accepted x⁺=0,radius2; rejected x unchanged,radius1/4 | Threshold directions correct. |
| `trSeq` | Quadratic start1, initial radius1,cap2 | States `(1,1),(0,2),(0,1/2)` | Stationary iterations shrink radius but retain point. |
| `trComplexityConst` | gap=1/2,L=β=1,c₁=1/2,ρ'=1/8,Δ₀=1 | `192+8=200`; all denominators positive | Correct arithmetic. |
| `trSeq_exists_norm_mgradient_le` | Same data,ε=1/2 | First qualifying k=1≤⌈200/(1/4)⌉=800 | Survives signature; R04 for zero β in prose. |
| O4.3 radius floor | Same constants,ε=1/2 | Floor `min(1,(1/2)(1/2)/8)=1/32`; initial1 and accepted radius2 exceed it | Constant consistent with model-error proof. |
| O4.3 zero-β negative control | H=0,step=0,L=1,β=0 at x=1 | Cauchy RHS 0; C=100; all gradients1>1/2 for every k≤400 | R04. |
| `newtonStep` | f=±x²/2 at x=2; f≡0 | Both nondegenerate cases step to0; singular Hessian inverse0 gives unchanged point | Sign and total inverse correct. |
| `newtonSeq` | f=−x²/2,start2 | 2,0,0,… | Attracted to maximum as promised. |
| `newton_local_quadratic` | Same sequence; f=x²/2+x³/3 near0 | First example errors 2,0,0; second Newton error `x²/(1+2x)`≤2x² for |x|≤1/4 | Genuine quadratic estimate, no minimum hypothesis needed. |
| `armijo_local_linear` | f=x²/2,αbar=1/2,τ=r=1/2 | α=1/2 always accepted; x_k=2⁻ᵏx₀ | C=1,q=1/2 satisfies the stated distance inequality. |
| O5.3 trust-region local order | Exact scalar quadratic, θ=1 and θ=1/2 | Error becomes0 in one step; residual0≤‖g‖min(‖g‖^θ,κ) | Consistent, including stationary rejection; full source hypothesis transfer not certified. |
| `isGeodesicCurveOn_of_isGeodesicSegment` | γ(t)=2t on ℝ; constant segment | Distances `2|s−t|=|s−t|·2`; acceleration0; constant case all0 | Parameterization and closed-interval derivative conventions agree. |
| `IsGeodesicallyConvexWith` | f=x²/2,κ=1,x=0,y=2,t=1/2 | LHS1/2; RHS `1−1/2=1/2`; κ=2 gives RHS0, fails | Predicate excludes overlarge modulus. |
| `isGeodesicallyConvexWith_iff` | Same f,v=3 | κ‖v‖²=9 equals Hess(v,v)=9; κ=2 gives18>9 | Both directions' discriminating test agrees. |
| O6.1 some/every segment and subsets | Open interval (−1,1), endpoints ±1/2 | Unique midpoint0; squared-cost convexity `0≤1/8` | Local short segments suffice; endpoints must lie in the stated set. |
| O6.2 minimizer/growth/PL | f=x²/2,κ=1 | Unique minimum0; gap x²/2 equals both κd²/2 and ‖grad‖²/(2κ) | All constants agree; complete/nonempty setting retained. |
| `rgd_linear_of_isGeodesicallyConvexWith` | Same f,L=κ=1; point with κ>L | k=0 gap equality; k≥1 both0; on point gap always0 even if rate base negative | Zero-dimensional boundary does not refute theorem. |
| `const_of_isGeodesicallyConvexWith` | Round circle f≡3; f=height | Constant gives3=3; height along small symmetric arc at maximum gives `1>cos t` | Nonconstant candidate fails convexity. |
| `const_of_isGeodesicallyConvexWith_sphere` | Same constant on S¹ | 3=3, direct specialization | R10. |
| O6.5 Dini derivative and EVI | f=x²/2, x_t=e⁻ᵗ,x₀=1,y=2,κ=1,t=0 | `½(d²)'=1`, `⟨grad,γ'(0)⟩=1`; EVI LHS1+1/2=3/2= f(2)−f(1) | Sign and half factors agree. |
| O6.5 forward completeness | f=−x²/2,κ=−1,x₀=1 | x_t=eᵗ, distance eᵗ−1 finite on each bounded interval | Semiconvex negative κ does not force finite-time blow-up. |
| O6.6 log determinant | P(1), geodesic X_t=4^(1−t)9^t | log X_t=(1−t)log4+t log9; second derivative0 | Affine claim correct. |
| O6.6 trace and minimizer | P(1), same path | `X_t''=(log(9/4))²X_t≥0`; x−log x has derivative0 only at1 and value1 | Convexity and unique identity minimum agree. |
| `rayleighCost` | A=diag(2,1),x=e₁,e₂ | Values−2,−1 | Minimization sign selects largest eigenvalue. |
| `mvfderiv_mgradient_rayleighCost` | Same A,x=(1,1)/√2 | Ax−(3/2)x=(1,−1)/(2√2); gradient `(−1,1)/√2` | Correct factor−2; API belongs in README. |
| `mgradient_rayleighCost_eq_zero_iff` | Eigenvector e₁; mixed unit vector | e₁ gradient0 and eigenvalue2; mixed gradient nonzero, not eigenvector | Both directions survive; API belongs in README. |
| `isMinOn_rayleighCost_of_hessian_nonneg` | A=diag(2,1); scalar A; dimension1 | At e₁ transverse Hessian2, global min−2; e₂ Hessian−2; scalar cost constant; S⁰ two equal values | Benign-landscape headline survives all cases. |
| Product-of-spheres singular pair | A=diag(3,1),x=e₁,y=−e₁ | σ=−3; Ay=−3e₁=σx; Aᵀx=3e₁=σy | Minimum −‖A‖op=−3; nonempty spheres needed for attainment. |
| Brockett critical points/minimum | A=diag(1,3),N=diag(2,1) | Identity cost5, swapped cost7; criticality forces diagonal compression | Sorted weighted minimum5 agrees. |
| Grassmann principal-subspace example | A=diag(2,1),p=1; skew A | Symmetric: costs−2,−1 with Hessians2,−2; skew: cost0 everywhere but e₁ not invariant | R05. |
| Entropic DS transport | n=2,C=0,ε=1 | X=J₂/2, `log X=−log2` constant; X/2=J₂/4 has uniform probability marginals | Critical scaling and probability normalization agree. |
| Multiplicative weights on simplex | x=(1/4,3/4), ambient gradient (1,0),t=log3 | Updated first coordinate `(1/12)/(1/12+3/4)=1/10` | Fisher projected-gradient retraction gives same value. |
| Hyperbola local-domain control | x=(2,1/2),v=(−10/3,5/6) | Normal dot v `−5/3+5/3=0`; x+v=(−4/3,4/3) fixed by branch-exchanging reflection | Unique nearest-point claim cannot be global. |
| Retraction curve versus geodesic | Sphere normalized x+tv,‖v‖=1 | Angular speed1 at t=0,1/2 at t=1 | Zero initial acceleration does not imply affine geodesic parameter. |
| DS versus Mult distance | README's 3×3 example with column angle θ>0 | Midpoint third-row sum `1/3+4/[3(1+cosθ)]>1` | Ambient product minimizing arc leaves DS; tensor isometry is not distance equality. |
| Strict minimum versus nondegeneracy | x⁴ at0 | Positive punctured values; Hessian0 | Correct negative control. |
| Chordal convexity vacuity | S¹ with inherited distance | No nonconstant metric segments; every cost passes the segment predicate | Riemannian compatibility in O6 excludes this model. |

**Library and ownership audit.** Mathlib pin `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches used mathematical objects as well as declaration names. Selected declaration bodies and their hypotheses were opened at these pins:

| Library file and line | Declaration or content inspected | Consequence for this review |
|---|---|---|
| `Mathlib/Geometry/Manifold/Riemannian/Basic.lean:545` | `EMetricSpace.ofRiemannianMetric` | Requires T3; finite distance and nonemptiness are not built in. |
| `TauCeti/Geometry/Manifold/Riemannian/Distance.lean:140,293` | `riemannianEDist_lt_top_iff_mem_connectedComponent`; `MetricSpace.ofRiemannianMetric` | Confirms componentwise finiteness and preconnected metric construction, not an inherited ambient metric. |
| `Mathlib/Geometry/Manifold/Instances/Sphere.lean:351,385,486` | Sphere chart/manifold instances; `range_mvfderiv_subtypeVal` | Dimension witness is `finrank=n+1`; tangent image is the orthogonal complement. |
| `Mathlib/Analysis/Normed/Module/Connected.lean:238` | `isPreconnected_sphere` | Rank greater than 1 is explicit. |
| `Mathlib/Analysis/InnerProductSpace/Rayleigh.lean:267,278,297` | Eigenvector results for local extrema/maxima/minima | Already covers extremum-to-eigenvector direction, not the proposed full second-order benign-landscape statement. |
| `Mathlib/Analysis/InnerProductSpace/SingularValues.lean:85–99` | `LinearMap.singularValues` | Zero-indexed, decreasing, zero past finite dimension; Frobenius norm is not its first value. |
| `Mathlib/Analysis/Calculus/LagrangeMultipliers.lean:109` | `IsLocalExtrOn.exists_multipliers_of_hasStrictFDerivAt` | Existing multiplier theorem is consumed; it does not itself construct the manifold Hessian comparison. |
| `TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Riesz.lean:74,82` | `rieszDual`, `inner_rieszDual` | Finite-dimensional tangent completeness is constructed internally; native gradient expression is available. |
| `TauCeti/Geometry/Manifold/MFDeriv/Curve.lean:122,128` | `curveVelocityWithin`, `curveVelocity` | Within/unrestricted derivatives are distinct; no smoothness is asserted merely by the definition. |
| `TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/AlongCurve/Acceleration.lean:77,82` | `accelerationWithin`, `acceleration` | Confirms O1.4's acceleration carrier and O6.1's within-interval convention. |
| `TauCeti/Geometry/Manifold/Riemannian/Geodesic/Basic.lean:103` | `IsGeodesicCurveOn` | Includes unique differentiation, C² regularity and vanishing covariant acceleration, not just a formal zero equation. |
| `TauCeti/Topology/MetricSpace/Length.lean:206` | `IsGeodesicSegment` | Requires endpoints and constant-speed distance equality on `[0,1]`; imposes nothing outside the interval. |
| `TauCeti/Geometry/Manifold/Riemannian/Geodesic/Exponential.lean:178,186,270` | Domain openness, bundle smoothness, derivative at zero | Supports the actual `expRetraction` construction without admitted data. |
| `TauCeti/Geometry/Manifold/Riemannian/Induced.lean:92,124` | `inducedRiemannianMetric`, inner-product formula | Uses a smooth immersion and the induced tangent metric; cannot apply directly to the raw Fisher inclusion. |
| `TauCeti/Geometry/Manifold/Riemannian/Homogeneous.lean:51,60` | Completeness from transitive isometries | Local compactness/finite dimension is an input, available for the intended positive-definite manifold. |
| `TauCeti/Geometry/Manifold/VectorBundle/Section/Manifold.lean:154,169,219` | Section-zero manifold, inclusion derivative and immersion | Existing generic foundation, not a reason to admit a second chart value. |

Resolved cross-roadmap contracts were checked on main for existing roadmaps; the supplied open head was used for the new LieGroupoidsPoisson and VariationalMethods roadmaps. The primary resolved sections are:

| Supplier and repository-relative locator | Contract checked |
|---|---|
| `TauCetiRoadmap/DifferentialGeometry/README.md:918–922` | Layer 12.2 gradient and 12.3 Hessian; the Lean bodies at 3148/3188 were also read. |
| `Completed/HopfRinow/README.md:229,264,427,451` | Riemannian distance, connection/geodesics/exponential, normal neighbourhoods/variation, completeness. Its old active-folder relative link should be updated when links are repaired. |
| `TauCetiRoadmap/RiemannianGeometry/README.md:46–47,254–271,1044–1065` | Shape sign `S_η=−(∇η)^⊤`, submersion horizontal geometry and immersion calculus. |
| `TauCetiRoadmap/MorseTheory/README.md:97–117,136–200,514,649–675` | Critical Hessian comparison, scalar regular levels, Fermat route and local gradient inequality. |
| `TauCetiRoadmap/OptimalTransport/README.md:1117,1153–1172,1420,1521–1527` | Metric convexity, EVI, entropic objective, positive-kernel Sinkhorn scaling. |
| `TauCetiRoadmap/SmoothBundlesConnections/README.md:221–265,1072,1115,1306–1337` | Regular fibres (R02), transport and given-metric strongly convex neighbourhoods. |
| `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:275–298` | Closed-subgroup theorem and orthogonal/special-orthogonal examples. |
| `TauCetiRoadmap/GeneralizedCohomology/README.md:1082–1152` | G4.0b graph-chart upgrades on the existing real/complex Grassmannian carriers; no new carrier is needed here. |
| `TauCetiRoadmap/DGFloer/README.md:824–831` | Layer 1 item 7 two-frame homogeneous comparisons, including the disconnected n=2 case. |
| `TauCetiRoadmap/LieGroupoidsPoisson/README.md:300–319` | G0.1 is submersion comparisons; it explicitly assigns regular fibres to SmoothBundlesConnections. |
| `TauCetiRoadmap/OperatorTheory/Majorization/README.md:168`; `PrincipalAngles/README.md:32–36`; `PolarDecomposition/README.md:325–335` | Ky Fan theory; independent decreasing sine/cosine orderings; canonical polar factor. The angle norm is permutation-independent. |
| `TauCetiRoadmap/VariationalMethods/README.md:691–808` | Layer 4 successive minima and min–max; this is the identifiable live section behind the older “V4” citation. |

The ownership searches used `roadmaps grep`, `roadmaps show`, the supplied sibling files, main, and the readable board package files/index. The searches found the regular-fibre conflict in R02, and the existing generic Rayleigh, Grassmannian, metric/connection, projection and Sinkhorn suppliers above. They did not reveal a second owner for the retraction-specific calculus, Fisher/Sinkhorn smoothness comparison or the abstract complexity bounds. No duplicate fully qualified declaration from another roadmap was found in this file's namespace. The existing Mathlib Rayleigh result does not already assert the second-order landscape theorem. No reassignment to a later supplier is proposed.

## Not verifiable

- **AMS08:** no full text was obtained. The sources service encountered arXiv rate limits and a DOI landing page; the author's book page links the Princeton full text, but that endpoint was inaccessible through the browser. Chapters 4, 6 and 7 remain uncertified, especially the precise Armijo local theorem and printed theorem/page numbers.
- **Ste83:** arXiv discovery timed out and the DOI endpoint returned HTTP 403. The numerical CG statements were tested in low dimension and compared with the other accessible texts; the original pp. 626–637 were not read.
- **Bro91:** arXiv discovery was rate-limited and the DOI route did not deliver the article. Search metadata identifies an open-archive publisher page, but no full text was read. The rectangular weighted Stiefel example was checked algebraically; its source locator remains uncertified.
- **EY36:** arXiv discovery was rate-limited and the DOI route did not deliver the article. AM12 supplies a readable local projection route, but the exact 1936 uniqueness locator on pp. 211–218 was not verified.
- **Sin64:** the landing page yielded no PDF link. A direct Project Euclid PDF fetch returned only an Incapsula error page (Sin64 line 5), despite the service reporting success. The source theorem on pp. 876–879 was not read.
- **Publication-version numbering:** DH19, BAC19, ABG07, EAS98 and BMAS14 were read as available preprints or author versions. The report identifies that version when giving numbers; it does not certify agreement with journal pagination. B23 explicitly preserves theorem numbering but changes pages.
- **O5.3 and O6.5 source transfer:** the accessible local trust-region theorems have more explicit assumptions than the paragraph here; the required localization argument is not supplied at an exact locator. No exact EVI source theorem is cited for O6.5. Computations and resolved suppliers are recorded above, without presenting these as completed general proofs.
- **Scope of the search:** ownership was checked against the supplied readable open heads and main. The board's five package-only remote heads were identified in its index; their live remote contents were not fetched. Searches of the readable board package files found no relevant competing optimization construction. No claim of exhaustive review of unread remote package contents is made.

All five inaccessible works are recorded together in `needs-references.toml` in the review scratch area under the same keys used by the README. No source manifest was edited, no source text was copied into the repository, and no missing source was treated as a reason to stop the rest of the review.

## Source issues

- **Error** in DH19 at Theorem 1, equation (23), printed p. 6 of the arXiv version (DH19 line 606): the source says the pseudoinverse of I−XXᵀ is a left inverse; it should be the Moore–Penrose inverse, whose product with I−XXᵀ is projection onto the all-ones orthogonal complement; affects the proof. For X=J₂/2, `(I−XXᵀ)1=0`, making a left inverse impossible. The roadmap's compatible equations and choice-independent correction avoid this error.

- **Error** in EAS98 at §§2.2 and 2.3.1, printed pp. 4 and 9 of the arXiv version (EAS98 lines 188 and 448): the source says canonical and Euclidean Stiefel metrics coincide when p=n; it should be canonical equals one half of Euclidean when p=n, as equation (2.39) implies; affects a stated result. At Y=I₂ and Ω=[[0,−1],[1,0]], the squared norms are 1 and 2. The roadmap's Frobenius convention avoids this normalization error.
- **Misprint** in EAS98 at §2.3.2 after equation (2.31), printed p. 10 of the arXiv version (EAS98 line 538): the source says the Grassmann horizontal metric differs by a factor one half from equation (2.2); it should be equal to that n-by-p Frobenius metric on horizontal vectors, as §2.5 computes; affects a stated result. For Y=e₁ and horizontal Δ=e₂, both squared norms are 1 (EAS98 lines 823–827).
- **Misprint** in EAS98 at §2.4.1 before equation (2.39), printed p. 11 of the arXiv version (EAS98 line 603): the source says a skew-symmetric p-by-p matrix has p(p+1)/2 independent coordinates; it should be p(p−1)/2; affects nothing. For p=2 there is one free entry, not three; the subsequent metric formula is unchanged.
