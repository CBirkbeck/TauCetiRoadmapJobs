# Review of PositiveMass (pull request #956 at 68063cc)

**Verdict:** needs changes

🤖 Independent AI review. Eight findings: two P1, two P2, four P3. The push gate and independent Lean elaboration pass. No pull-request file was changed. The findings concern this folder; supplier files are witnesses, not proposed edits in this pull request.

## R01 (P1) — Exclude the empty collection of AE ends from the analytic theorems

**Location:** `TauCetiRoadmap/PositiveMass/README.md:66`, “A finite-ended AE structure means a finite collection of these specified ends with compact remaining region”; also P1a at line 103 and P6 at line 548.

**Claim:** This class supports the weighted Poincaré estimate used to prove invertibility and spin positivity.

**Witness:** On the unit flat three-torus, choose the empty end collection, compact remainder M, radius ρ=1, and a unit parallel spinor. Its weighted L² norm is 1; its gradient norm is 0.

The written definition admits this complete connected boundaryless spin manifold. Thus no finite C can give the intended estimate `‖u‖_(L²_(-q)) ≤ C‖∇u‖₂`. The scalar uniqueness problem also has all constants in its kernel: “tending to 1 at every end” imposes no condition when there are no ends. This is not a counterexample to positive mass; it is a counterexample to the intermediate analytic claim on the defined class. Cecchini–Zeidler Definition 2.3 explicitly requires a **nonempty** union of ends (`cecchini-zeidler` line 252, p. 6).

**Repair:** Require a finite **nonempty** family of ends in the global finite-ended AE definition, and carry it into P1 and P6. Keep compact manifolds on their separate compact spectral domains. Add the flat-torus constant section as a negative-control Check. Retest: the torus is excluded; on ℝ³ a constant section is excluded by the weight, since its squared L²_(-1/2) tail is `4π∫₁^∞1 dr=∞`.

## R02 (P1) — Break the two-way supply with Yamabe

**Location:** `TauCetiRoadmap/PositiveMass/README.md:41`, “Yamabe Y0–Y3.1”; lines 45–59 describe the interleaving and say “Yamabe Y6–Y8 uses P8 afterward.”

**Claim:** The stated ordering supplies a valid roadmap dependency structure.

**Witness:** `TauCetiRoadmap/Yamabe/README.md:48` on main consumes PositiveMass P0–P8. Its lines 259 and 293 apply the nonspin and arbitrary-end spin theorems. PositiveMass consumes Yamabe's early conformal and spectral results.

This gives the roadmap-level cycle `PositiveMass → Yamabe → PositiveMass` (arrows mean “requires”). The target-level chain can be acyclic, but that does not satisfy the required single direction of supply between roadmap folders. The mechanical depcheck prints zero problems; it did not expose these two reciprocal contracts, which were checked directly on main.

**Repair:** Make a coordinated ownership transfer of the common conformal/linear inputs to an earlier shared supplier, and have both roadmaps cite that owner. Preserve Yamabe's existing work and its use of PositiveMass; do not copy Y0–Y3 into this README. Record exact transferred sections and replace the PositiveMass supplier row accordingly. Retest the graph: `PositiveMass → SharedInputs` and `Yamabe → {SharedInputs, PositiveMass}` has no return path from PositiveMass to Yamabe. Merely reordering P3 and Y3 does not repair the folder-level cycle.

## R03 (P2) — Specify the disjoint supports needed by the P7 correction equation

**Location:** `TauCetiRoadmap/PositiveMass/README.md:571`, “cutoff f and asymptotically constant ξ₀”; line 594, “Solve `B_(ψ_λ)ξ_λ=−𝓓ξ₀`”.

**Claim:** This correction produces the harmonic Callias spinor to which the mass estimate and limiting rigidity argument apply.

**Witness:** With u=ξ₀+ξ_λ, the displayed equation gives `B_ψ u=ψσξ₀`. At a point where ψ=λ>0 and ξ₀=(v,0), ‖v‖=1, the residual is `(0,iλv)`, of norm λ, not 0.

No condition in P7 makes this product vanish. P4's global cutoff extension does not relate its support to P7's subsequently chosen f. In the actual source construction, f is supported in the collar K, equals 1 near its inner boundary, and ξ₀ is supported outside K (`cecchini-zeidler` line 725, p. 16). Equation (4.4) uses their disjointness, and (4.5) also uses u_λ=ξ_λ on K (`cecchini-zeidler` line 764, p. 17; the PDF prints an intersection, despite a faulty text extraction).

**Repair:** State these support and collar conditions before defining ψ_λ, extend ξ₀ by zero across the collar, and require 0≤f≤1. Choose connected admissible truncations and λ>0. Explicitly conclude ψ_λξ₀=0, B_ψλ(ξ₀+ξ_λ)=0, and equality with ξ_λ on K. Retest the same point: it cannot simultaneously have ψ≠0 and ξ₀≠0, so the residual becomes 0. The support law also makes the source's negative-part estimate applicable to the correction rather than the nondecaying seed.

## R04 (P2) — Import the existing volume-equality theorem instead of planning it again

**Location:** `TauCetiRoadmap/PositiveMass/README.md:340`, “Construct that limit here”; lines 342–345 ask for the radial equality, cut-locus, covering, and no-identification proof of Euclidean rigidity.

**Claim:** These generic comparison and equality constructions belong to P2.3.

**Witness:** `TauCetiRoadmap/RiemannianGeometry/README.md:635` on main supplies the small-ball limit. Line 639 already specifies radial equality, elimination of cut points, the complete covering, and exclusion of nontrivial identifications, explicitly for consumption by PositiveMass P2.3.

P2.3's new content is the **AE large-ball lower limit** and its application. Rebuilding the supplier's equality case creates two owners for the same general theorem. On Euclidean space both proposed engines take the identical data `Vol(B_r)/(ω_n r^n)=1` and produce the identical global isometry conclusion.

**Repair:** Keep the AE distance/radius argument proving liminf≥1. Cite RiemannianGeometry R4.1 for the small-ball limit, monotonicity, and complete equality theorem, and apply it once to obtain rigidity. Delete the repeated generic proof obligations from P2.3. Retest on ℝⁿ: lower limit=1 and the supplier gives the isometry; on a flat cylinder the large-ball ratio tends to 0, so the AE input is correctly unavailable. This is a repairable overlap, not a rejection of the PositiveMass scope.

## R05 (P3) — Attach exact locators to targets and identify the cited works

**Location:** `TauCetiRoadmap/PositiveMass/README.md:629`, “Sources”; line 631 refers only to Schoen–Yau's “positive-mass and scalar-curvature minimal-hypersurface papers”. P1c at lines 189–266 has no source locator.

**Claim:** The references make the individual targets independently verifiable.

**Witness:** P1c's full spin spectrum, P2.2's mass variation, P3a's boundary Gauss–Bonnet, and P3c's induced-end estimates have no theorem/page locator. No `sources.toml` is present. The worker's heading sampler found no target identifiers.

The closing bibliography does identify a few usable propositions, but it does not assign exact locators to most of the hundreds of requested facts. “Bartnik §§2–4” does not identify the particular Laplacian isomorphism, coordinate theorem, or mass theorem. A reference to a source proving something is also distinct from ownership of its formal prerequisite.

**Repair:** Give the complete bibliographic identity and exact version of each work; attach theorem/section and printed-page locators to each target and its API facts. Record them in the required sources manifest when repairing the package. Use the verified locators below where applicable; mark the inaccessible references uncertified rather than guessing their numbering. For P1c give a source covering the stated parity-dependent bundle comparison and full multiplicities, not only kernel vanishing. Retest, for example, the mass sign against Proposition 2.5, p. 9, and the ordinary-to-Schoen–Yau mass conversion against p. 41 of the cited v1.

## R06 (P3) — Supply discriminating Checks and per-layer dependency sections

**Location:** `TauCetiRoadmap/PositiveMass/README.md:1`, “Asymptotically Euclidean geometry and positive mass”; P1a begins at line 101 and P5 at line 507.

**Claim:** The prose supplies the required roadmap shape and complete validation API for each definition.

**Witness:** There are no `**Checks.**` lists or `*Needs:*` lines, and no layer-ending Examples/Dependencies sections. P5 asks for flat-half-space and sphere checks without recording their values. Weighted-space and AE definitions lack three explicit discriminating Checks each.

Several valuable safeguards are present in prose, including strict weight loss and the exterior-domain warning. They do not supply the systematic per-definition checks or target-specific dependency edges required here. The missing nonempty-end check in R01 and support check in R03 are concrete consequences.

**Repair:** Reshape the existing content under the required Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, numbered Layer, Downstream consumers, and References headings. Preserve the mathematics and API; add at least three explicit computed Checks for each definition and separate target-level Needs and layer dependencies. For weights, use r⁻¹ in n=3,p=2 at δ=−1/2,−1,−3/2, with radial integrals 1,∞,∞. For χ, record χ²=1, χ*=χ and the explicit +1/−1 vectors below. For boundary signs, record the ball/exterior-sphere values, not an instruction to compute them.

## R07 (P3) — Delete normalization examples from the acceptance file

**Location:** `TauCetiRoadmap/PositiveMass/Suggested.lean:41`, `euclideanCoordinateFlux_eq_zero`; lines 46 and 60, `conformalFluxNormalization` and `conformalEuclidean_mass`.

**Claim:** These three declarations are suitable acceptance theorems for the roadmap.

**Witness:** The first is already proved by one `simp` using the definitions. The second is scalar cancellation. The third is precisely P0.4's Schwarzschild/conformal normalization example; it states none of P8's complete-manifold positivity or rigidity conclusions.

The single-tactic `simp` probe did **not** close the third theorem; that fact does not turn a README Check into a headline. Its formula is mathematically meaningful and passed the calculations below, but it remains padding under this review's acceptance-file rule.

**Repair:** Delete all three from `Suggested.lean`; retain their mathematics as README Checks. Delete the six supporting abbreviations/definitions if no retained headline uses them. Do not replace these with proved examples or weaker mass inequalities. Retest the acceptance inventory: it should contain actual statable headline theorems, or only a precise module docstring explaining the missing carriers. A file with no declarations is acceptable here.

## R08 (P3) — Make the Lean form and non-statable headline inventory explicit

**Location:** `TauCetiRoadmap/PositiveMass/Suggested.lean:4`, “These are suggested forms”; line 16, `namespace PositiveMass`.

**Claim:** The file explains its relation to the README and accounts for its headline theorems.

**Witness:** It uses `PositiveMass`, not `TauCetiRoadmap.PositiveMass`; four data declarations lack docstrings. None of the nine declarations is documented in the README as a Lean declaration. The docstring groups the omitted geometry together without enumerating the three P8 theorems or their missing carriers.

**Repair:** Use the required namespace and “target signatures” module docstring. List the nonspin finite-ended theorem, spin finite-ended theorem, arbitrary-other-ends spin theorem, their zero-mass rigidity conclusions, and the Green-mass application, with the actual absent AE/mass/scalar-curvature/Spin analytic interfaces. Account likewise for the deep intermediate spectrum/weighted/boundary milestones if they are designated acceptance headlines. Document each retained definition and name it in the README. At the pins I found native metric and volume carriers, but no ready AE end/ADM/Dirac package; absence of a full PMT signature is therefore not itself reported as P2. Retest the file against those actual pins, rather than declaring a free predicate for missing geometry.

## Verified sound

The following records **computed controls, resolved ownership, and source checks**, not proofs of the future targets. A passing example does not certify an unrestricted theorem. The unavailable source checks are identified separately.

**Scope and mechanical checks.** HEAD is `68063cc5ba76e84b272609bfc300e9560a2ca9a5`. The outside-folder diff against `origin/main...HEAD` is empty. The folder contains README, Suggested.lean and metadata only. The supplied gate reports every check zero and `OK`, including targeted build, stray files, outside-folder edits, imports and dependency scanning. No gate failure is suppressed. There is no previous review to reconcile. No computational algorithm, sorry-valued data, `set_option`, admitted example, or copied source paragraph was found in the reviewed files. The two independent proof routes are mathematical developments; the remaining scope is not merely a shortcut to positivity.

The required independent dependency command returned exactly:

```text
depcheck: 163 roadmaps, 1163 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This output does not negate the manual reciprocal-supplier witness in R02. Existing main roadmaps were read at `3ec8d5f97285d3a04491f8d9662b5dad2bb4f6ff`; existing roadmap revisions were not substituted for main. New VariationalMethods and the new UnboundedOperators sub-roadmap were read at their supplied open heads. The roadmap index explicitly identifies UnboundedOperators as new, so its absence on main is **not** a missing-supplier finding. A supplier absent from ORDER was not treated as a defect merely for that absence.

**Lean verification.** `lake env lean` on the original file exits 0 with exactly one warning, the admitted theorem at line 60. A separate scratch copy with `#check @name` for each of the nine declarations also exits 0. All nine signatures agree with the worker's signature report; zero section hypotheses were dropped. In particular n≥3 remains explicit on both conformal theorems. No file was edited in the worktree. The one sorried declaration was tested with one `simp` invocation on a scratch copy; Lean reports “simp made no progress”. The proved Euclidean-flux declaration already supplies its successful one-tactic witness. No Lean job remains running.

**Pinned declarations opened.** Mathlib pin `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Paths in this inventory are relative to the named library repository.

| Library object | File and line at the pin | What was verified, including limits |
| --- | --- | --- |
| `EuclideanSpace.basisFun` | Mathlib `Mathlib/Analysis/InnerProductSpace/PiL2.lean:802` | Native orthonormal coordinate basis; line 806 evaluates it to a single coordinate equal to 1. |
| `fderiv` | Mathlib `Mathlib/Analysis/Calculus/FDeriv/Defs.lean:160` | Total derivative operation; using it alone does not assert differentiability of arbitrary metric coefficients. |
| `fderiv_const_apply`, `fderiv_fun_const` | Mathlib `Mathlib/Analysis/Calculus/FDeriv/Const.lean:217` | Constant derivative is zero; this is the Euclidean-flux simplification, not a new analytic theorem. |
| `Measure.euclideanHausdorffMeasure` | Mathlib `Mathlib/Geometry/Euclidean/Volume/Measure.lean:68` | Hausdorff measure normalized by the Haar scalar factor, in the specified dimension. It is not ambient n-dimensional Lebesgue measure when used with n−1. |
| `EuclideanSpace.euclideanHausdorffMeasure_eq_volume` | Mathlib `Mathlib/Geometry/Euclidean/Volume/Measure.lean:187` | Agreement with volume in the matching ambient dimension; does not by itself compute surface area in codimension one. |
| `Bundle.ContMDiffRiemannianMetric` | Mathlib `Mathlib/Geometry/Manifold/VectorBundle/Riemannian.lean:244` | Smooth symmetric positive fibre inner products, compatibility/boundedness. Does not include AE ends, completeness, or scalar curvature. |
| `IsRiemannianManifold` | Mathlib `Mathlib/Geometry/Manifold/Riemannian/Basic.lean:79` | The field is `edist x y = riemannianEDist I x y`. It does not bundle second countability, Hausdorffness, nonemptiness or completeness. |
| `TauCeti.riemannianVolume` | Tau Ceti `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:76` | Chart-glued metric volume. The following restriction/uniqueness API uses the chart Gram density; no second volume definition is needed. |

Object searches covered both pinned libraries for AE/ADM, scalar-curvature, Dirac/Callias, and monogenic-spin constructions, plus the actual derivative, basis, measure, metric and volume objects. No duplicate fully qualified name of the nine PositiveMass declarations was found in the supplied roadmap context. Searches of `roadmaps grep`, main, the board's packages, and supplied open heads found PositiveMass to be the owner of weighted AE analysis, round monogenic spectral construction, ADM mass, and the localized Callias application. This is a bounded search result, not a claim that every possible spelling of those objects is absent from all Lean code.

**Cross-roadmap contracts resolved.** All direct supplier families in the README were checked. The table distinguishes actual inputs from downstream references; merely mentioning a consumer is not a dependency.

| Supplier / precise locator read | Resolution and mathematical boundary |
| --- | --- |
| RiemannianGeometry R1–R5, R7.8, R8 on main | R4.1 lines 635–639 supplies volume equality (R04); R5a/R5b lines 1044/1145 supply submanifold variation; R7.8 lines 1374–1398 supplies smoothing/distance; R8.1–2 lines 1406–1422 supplies scalar harmonics and completeness. |
| DifferentialGeometry 2, 10, 12.2–12.5 on main | Orientation cover at line 362; Sard at line 884; gradient/divergence/volume/Green at lines 918–934. Native Δ is div grad, so PositiveMass Δ⁺ is its negative. |
| PDE Lanes A,C–E on main | Lines 223–340 supply weak spaces, maximum principles, elliptic existence and regularity. Euclidean scalar estimates do not supply the new weighted bundle/boundary inverses automatically. |
| VariationalMethods V2.3, V5.1 at the supplied new-roadmap head | Lines 236–262 distinguish complex-linear H-forcing from conjugate-linear dual forcing. Lines 435–456 specialize the UO operator and supply compactness. |
| OperatorTheory/UnboundedOperators UO-D06 at the supplied new-sub-roadmap head | Lines 172–215 contain the common form graph and real/complex self-adjoint representation; line 343 makes V2.3 → UO-D06 → V5.1 explicit. No new form engine is required in PositiveMass. |
| ComplexKahlerGeometry K5a on main | Line 570 begins real/complex bundle analysis; lines 1024–1038 give local/global regularity; lines 1047–1063 give the compact boundaryless domain/form specialization. This is not the noncompact weighted inverse or a chiral boundary-domain theorem. |
| SpinGeometry G3–G6 on main | G3 begins at line 353; geometric Spin lift at line 467, chosen-factor spinors at line 535; Dirac/domain comparison at lines 701–726. The sphere kernel example does not claim the full spectrum. P1's parity-dependent ranks are compatible with the chosen-factor distinction. |
| GeometricCurrents G1–G7 on main | G5 begins at line 583, G6 at 668, G7 at 859. Lines 948–958 explicitly assign torus obstruction, harmonic capping, AE hypersurface asymptotics and mass application to PositiveMass. Its references back to PositiveMass are consumer boundaries, not reverse supply. |
| Yamabe Y0–Y3.1 on main | Conformal covariance at lines 68–74, first eigenfunction at 128–135, sharp Euclidean inequality at 150–169, fixed-sign metric at 178–182. These exist as planned contracts; their simultaneous consumption with Yamabe's use of P8 is R02. Y4/Y6's actual Green expansion remains Yamabe's application, not a PositiveMass reconstruction. |
| GeometricTopology Layer 1 on main | Boundary manifold/collar material at lines 186–215 and the smoothing/triangulation comparison at line 270 supply the surface triangulation input. |
| AlgebraicTopology Stages 2–3,6–7 on main | Relative chains at line 326, subdivision/excision at 471, orientation/duality in Stage 6 at line 946 and Euler interfaces in Stage 7 at line 1573; its scope distinguishes finite CW Euler characteristic from arbitrary infinite spaces. The cup/cap and orientation identifications requested by P3 remain necessary. |

The new UnboundedOperators/VariationalMethods contracts resolve the closed-form names: a failed main-only path lookup was followed through the new-roadmap index and did not become a finding. The shared form convention passes the one-dimensional complex test a(u,v)=conj(u)v: forcing h=i gives u=i, since both sides are −iv. The downstream Green-mass application and the earlier scalar harmonic supply have distinct owners.

**Headlines.** The end theorems are P8.1 (finite-ended nonspin PMT and zero rigidity, 3≤n≤7), P8.2 (finite-ended spin PMT and rigidity, n≥3), P8.3 (one chosen AE end, arbitrary other complete ends, spin), and the Green coefficient conclusion A≥0 with zero rigidity. Deep intermediate milestones include P0 mass existence/chart invariance, P1 weighted Fredholm theory and the full round Dirac spectrum, P2 density/mass transport and rigidity variation, P3 torus obstruction and nonspin compactification, P5 boundary operator/domain theory, and P6–P7 solvability/limiting spinors. Suggested.lean contains none of those full statements. The geometric AE/scalar-curvature/spin-domain interfaces are not present as ready carriers at the pins; the correct response is the explicit omissions inventory in R08, not the three normalization tests in R07. No conclusively statable omitted PMT headline is alleged here.

**Source sample and locators.** The brief says the worker found no targets by heading and supplies no actual fifteen-target list. I therefore cannot claim to reproduce an unidentified worker sample. For a reproducible replacement, I enumerated 27 claim blocks in README order (P0 definition/normalization/invariance/conformal mass; P1 norms/Fredholm/spectrum; P2 approximation/variation/rigidity; P3 obstruction/Rayleigh/Gauss–Bonnet/capping/truncation/insertion/induced ends; P4 mass; P5 square/boundary/twistor; P6 Poincaré/Fredholm/small-negative; P7 support/rigidity; P8 headlines) and sampled 15 using Python `Random(int("68063cc5",16)).sample(range(27),15)`, then sorted. Selected indices, one-based: 2,4,6,7,9,11,13,14,15,16,17,18,19,23,25. The following is the complete sample record. No locator is explicitly labelled “unverified” in the README.

| Sample target | Source text inspected / precise locator | Result |
| --- | --- | --- |
| P0 ADM normalization | `cecchini-zeidler` line 210, Definition 2.1 and (2.1), pp. 5–6 | Same C² decay, scalar L¹ and denominator 2(n−1)ω_(n−1). The primary proof of invariance is Bartnik, unavailable below. |
| P0 conformal mass | `cecchini-zeidler` line 239, Example 2.2, p. 6 | The coefficient m/2 gives ordinary mass m, hence coefficient c gives 2c. |
| P1 scalar Fredholm | Bartnik §1/Theorem 1.7 claimed by README | Not certified: full text unavailable through the service. No guessed theorem-number correction. |
| P1 full spin spectrum | No exact source assigned in README | Explicit algebra/multiplicity checks below; general spectrum/completeness locator not certified. |
| P2 zero-mass variation | `schoen-yau-2017` line 1889, proof of Theorem 5.3, p. 41; `lohkamp-1999` lines 640–652 | The former delegates rigidity to earlier work; the latter discusses perturbation. Neither is a verified exact locator for every stated weighted C² hypothesis. |
| P3a nonzero-degree torus obstruction | `schoen-yau-2017` line 1854, Theorem 5.2, p. 40 | Nonzero iterated H¹ cap obstruction implies the degree-to-torus obstruction. The roadmap supplies its smooth ≤7 route instead of importing the all-dimensional slicing proof. |
| P3a boundary Gauss–Bonnet | No locator assigned | Disc/annulus/corner values checked below; theorem-to-text attribution unavailable. |
| P3b harmonic end capping | `schoen-yau-2017` line 1889, p. 41; `lohkamp-1999` line 475, p. 396 | Sources mention reduction/capping, not the full weighted end-value/Kelvin proof requested here. Those steps are genuinely targets here. |
| P3b concave truncation | `schoen-yau-2017` line 1894, Proposition 5.4, p. 41; `lohkamp-1999` line 480, Proposition 6.1, p. 396 | Exact Euclidean exterior and nonnegative scalar supported; Lohkamp also states strict positivity somewhere. Sign conversion verified below. |
| P3b torus insertion | `schoen-yau-2017` line 1847, Theorem 5.1, p. 40; Proposition 5.4, p. 41 | Connected-sum obstruction and compact insertion supported. Source mass is half this README's mass. |
| P3c induced-end asymptotics | Unspecified older Schoen–Yau paper | Not certified: requested geometric asymptotics require an exact source and hypotheses for this selected hypersurface family. |
| P4 inward Green sign | `cecchini-zeidler` lines 361–431, Proposition 2.5, pp. 9–10 | Raw inward flux has negative mass coefficient; moving it across the identity gives the positive term. |
| P5 doubled square | `cecchini-zeidler` lines 292–320, §2.3, pp. 7–8 | Off-diagonal Clifford action, σ, and positive ψ² with c(dψ)σ agree. |
| P6 Fredholm theorem | `cecchini-zeidler` line 556, Theorem 2.12, p. 12, with setup at 455 | Compactly supported smooth potential, connected complete AE manifold, compact boundary, actual χ-domain; nonnegative index as stated. AE includes nonempty ends (R01). |
| P7 cutoff/support construction | `cecchini-zeidler` lines 725–789, proof of Theorem A and (4.3)–(4.7), pp. 16–18 | Source support hypotheses are stronger than the written P7 seed choice (R03). |

All explicitly numbered **accessible** closing-reference locators were opened: Schoen–Yau Theorems 5.1–5.3/Proposition 5.4, Lohkamp Proposition 6.1, and Cecchini–Zeidler Proposition 2.5. Additionally, Theorem B, Definition 2.3, Theorem 2.12 and the §4 proof were read. Four works are readable through legal service fetches: the cited Schoen–Yau arXiv v1, Cecchini–Zeidler arXiv v2, Lohkamp's author-hosted paper, and Witten's IAS author copy. These are the versions certified here; no agreement with a differently numbered published version is assumed. Witten §III, printed pp. 387–392 (`witten-1981` lines 267–445), supplies the original spinorial route with its own spacetime/asymptotic hypotheses, not an automatic proof of the roadmap's all-dimensional weighted statements.

**Adversarial table (110 rows).** Each row records values rather than a generic “checked”. Unless marked as a failure, the result is a consistency test on the indicated instance only. `δ` is the README weight, Δ⁺=−div grad, and ω_(n−1)=area(S^(n−1)). Finite tails are computed from radius 1; smoothing near that radius does not alter convergence. Source-sampled blocks, all headline conclusions, all Lean declarations, and every finding's mathematical target appear below. Nonapplicable arithmetic tests (p-adic residue characteristic, zero rings, inseparability) are excluded by the fixed real Riemannian setting, rather than silently treated as valid manifold inputs.

| Statement / convention | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| Standing full scalar curvature | Round S³, flat ℝ³ | Scal=6=3·2·1; flat Scal=0 | Normalization consistent. |
| Δ⁺ sign and DG comparison | f=x₁² in ℝ³ | Δ_DG f=2; Δ⁺f=−2 | Explicit negative conversion required; no mismatch in chosen convention. |
| AE C² threshold | n=3, g−δ=O₂(r⁻¹); threshold t=1/2 | 1>1/2; quadratic error integral behaves ∫r⁻²dr<∞. At t=1/2 it behaves ∫r⁻¹dr=∞ | Strict threshold discriminates the borderline. |
| Finite-ended AE definition | Flat T³, empty index | Number of ends=0 finite; compact remainder=M; analytic constant test gives 1≤C·0 | Fails: R01. |
| Arbitrary-other-end definition | A specified Euclidean end; compact T³ | First has one qualifying chart; torus has none | Chosen-end hypothesis excludes compact negative control. |
| Radius/distance comparison | ℝⁿ exterior, p=0 | d(0,x)=r; radial gradient norm=1 | Exact model of the asymptotic comparison. |
| Inverse metric and densities | g=a²δ | g⁻¹=a⁻²δ; volume factor=aⁿ, hypersurface area=a^(n−1), g-unit normal=a⁻¹ν | Reciprocal and dimensional factors consistent. |
| Decay differentiation/product | r⁻¹, r⁻² | ∂r r⁻¹=−r⁻²; product=r⁻³; derivative=−3r⁻⁴ | Order shifts −1 and summed decay verified. |
| ADM existence/divergence model | g=δ | All derivatives=0, flux=0, Scal=0, limit=0 | Base case; not a proof of full convergence. |
| ADM Schwarzschild normalization | n=3, u=1+c/r, g=u⁴δ | Flux integrand=8c u³/r²; sphere integral=32πc u³; division by16π gives 2c u³→2c | c=1 gives2; c=0 gives0; c=−1 gives−2 on large spheres. |
| General-dimensional conformal flux | n≥3, u=1+c r^(2−n) | Normalized flux=2c u^((6−n)/(n−2)); limit=2c | n=4:2c(1+c/r²); n=6:2c exactly. |
| Negative mass model versus completeness | n=3,c=−1 on r>1 | m=−2; radial distance to r=1 is finite since ∫₁²(1−1/r)²dr<∞ | Does not refute PMT: incomplete end alone. |
| Chart rigid-motion invariance | Euclidean rotation of δ | g stays δ, both fluxes=0 | Zero model consistent. |
| Mass scaling covariance | g_c and λ²g_c, normalized y=λx | c becomes λ^(n−2)c; masses 2c and 2λ^(n−2)c | For n=3,λ=2,c=1:2→4. |
| End-cover local comparison | Identity covering of Schwarzschild end | Pulled-back coefficient c unchanged; both masses=2c | End isometry, not multiplication by global cover degree. |
| Conformal mass increment | n=3, g=(1+a/r)⁴δ, v=1+b/r | Leading product=(1+a/r)(1+b/r)=1+(a+b)/r+ab/r²; mass changes 2a→2a+2b | Increment=2b. |
| Green inversion normalization | G=r^(2−n)+A in a flat pole chart | After R=1/r, metric factor=1+A R^(2−n); m=2A | A=1 gives2, A=0 gives0. |
| Finite-p weight membership | n=3,p=2,v=r⁻¹ | δ=−1/2:∫r⁻²dr=1; δ=−1:∫r⁻¹dr=∞; δ=−3/2:∫1dr=∞ | Strict δ>−t correct. |
| Supremum endpoint | v=r⁻¹,δ=−1 | sup r·r⁻¹=1 despite finite-p logarithmic divergence | Endpoint norms are distinct. |
| Derivative-weight shift | v=r⁻¹,δ=−1/2 | v² weighted radial tail=r⁻²; (v′)² at δ−1 also r⁻² | Same convergence for both orders. |
| Radius equivalence | ρ′=2ρ | Lp_δ norm multiplier=2^(−δ−n/p) | n=3,p=2,δ=−1/2 gives1/2; equivalent, not equal norms. |
| Frame equivalence | Unitary spin-frame change U | ‖Uv‖²=‖v‖²; constant U gives ∇(Uv)=U∇v | Model preservation. |
| Compact-support density | Weighted endpoint v=r^δ on an end | Sup weighted error after any compact cutoff=1 | No W^(k,∞)_δ norm density; the README correctly excludes it. |
| Finite-p cutoff control | v=r⁻¹,δ=−1/2 | Squared tail after R is ∫R∞r⁻²dr=1/R→0 | Model of finite-p density. |
| Weighted dual exponent | n=3,p=p′=2,δ=−1/2 | Dual weight=−5/2; squared densities are r⁻² and r² relative to dV, product=1 | Cauchy–Schwarz gives unweighted volume pairing. |
| Hölder product | n=3,p=q=4,r=2,δ=ε=−1/2; f=g=r⁻¹ | Each fourth-power radial integral=1/2; product squared integral=1/2; norm product=(1/2)^(1/2) | Correct target weight δ+ε=−1. |
| Trace domains | Exterior harmonic scalar r⁻¹ at r=1 | Boundary trace=1≠0 | Excluded by zero Dirichlet trace; unrestricted domain would keep it. |
| Scalar order and regularity range | Smooth homogeneous r^a | Δ⁺r^a=−a(a+n−2)r^(a−2) | Order/weight shift −2; does not justify p=1,∞ estimates. |
| C² does not supply higher weighted bounds | Smooth annular high-frequency perturbation ε_j sin(N_j x₁), ε_j=N_j⁻² times fixed decay scale | Second derivative size=decay scale; third derivative size=N_j times that scale | P1 correctly requires separate higher-order bounds. |
| Scalar spherical eigenvalues | S², j=0,1,2 | λ=0,2,6; multiplicities=1,3,5 from binomial difference | R8 import agrees. |
| Positive polar Laplacian | n=3,f=r² | Cartesian Δ⁺=−6; radial −2−(2/r)(2r)=−6 | Sign consistent. |
| Scalar indicial polynomial | n=3,j=1,δ=1,−2,0 | Factor 2−δ(δ+1)=0,0,2 respectively | Both roots and nonroot tested. |
| Scalar repeated-root warning | n=3,j=0; compare n=2,j=0 | Roots 0,−1 versus repeated0; Δ log r=(n−2)/r² | log r harmonic only at n=2; n≥3 restriction matters. |
| Exterior domain non-Fredholm warning | n=3,δ=−1/2, j≥0 | u_j=r^(−1−j)Y_j has Δu_j=0; radial tail ∫r^(−2−2j)dr finite | Infinitely many independent unrestricted kernel modes; boundary warning correct. |
| Cylinder weighted radial norm | r=e^s, v=r^a | Weighted radial measure gives e^(p(a−δ)s)ds | Critical a=δ gives constant density and infinite length, not an Lp mode. |
| Critical cutoff obstruction | a=δ, cutoff varying over s-length L | Norm scales L^(1/p); first cutoff error L^(1/p−1); ratio=1/L→0 | Explains failure of critical coercive estimate. |
| Intrinsic spin ranks | n=3,m=2 and n=4,m=3 | Both ranks=2^1=2; faithful doubled odd ambient module would have rank4 | Chosen-factor convention prevents doubling. |
| Clifford X² | x=re₁, c(e₁)²=−1 | X²=r²c(e₁)²=−r² | Positive Clifford convention would fail. |
| Dirac square | f=x₁²v, v constant | D²f=2c(e₁)²v=−2v=Δ⁺f | Sign check. |
| DX+XD | Constant v in n=3; degree-one homogeneous spinor | On v:DXv=−3v. On x₁v:DX(x₁v)+XD(x₁v)=−3x₁v+(c₁X+Xc₁)v=−5x₁v, matching RHS | Constant and degree contribution distinguished. |
| Even-power monogenic identity | a=1,ℓ=0,v constant | D(X²v)=D(−r²v)=−2Xv; RHS=−2Xv | Correct coefficient. |
| Odd-power monogenic identity | a=0 and a=1, n=3,ℓ=0 | DXv=−3v; DX³v=−5X²v | Both coefficients match. |
| Fischer direct sum and dimensions | n=3,rankΣ=2,k=0,1,2 | dimP=2,6,12; dimM=2,4,6; subtraction dimP_k−dimP_(k−1)=2,4,6 | Base, first, second degrees consistent. |
| Chiral Fischer count | n=4,rankΣ⁺=2,k=1 | dimP₁⁺=8; dimP₀⁻=2; dimM₁⁺=6 | Uses opposite chirality in X term. |
| Fourier symbol | Unit ξ, negative Clifford action | (i c(ξ))²=1, whereas c(ξ)²=−1 | Correct positive symbol square. |
| Polar Dirac sign | Constant ambient spinor, n=3,m=2,k=0 | ∂r=0 and (m/2+λ)=1−1=0 | λ=−1 branch, not +1. |
| Opposite branch | n=3, λ=−1 spinor ψ | D_S(cνψ)=+cνψ; anticommutator gives (−1+1)cνψ=0 | Branch exchange consistent. |
| Round spin multiplicities | S²,k=0,1,2; S³,k=0,1 | S²:±1,±2,±3 with2,4,6; S³:±3/2,±5/2 with2,6 | Values match intrinsic rank formula. |
| Completeness model / polynomial density | k=0,1 restriction, n=3 | P₁ dimension6=negative M₁ dimension4 + positive X M₀ dimension2 | No extra duplicate positive branch; full density remains a target. |
| Dirac indicial roots | n=3,k=0,1 | λ=−1,−2 gives δ=0,1; λ=+1,+2 gives δ=−2,−3 | Exceptional sets agree. |
| Model radial inverse off roots | n=3,j=0,δ=−1/2 | Scalar indicial value=1/4; inverse coefficient=4 | Noncritical interval model. |
| Fredholm versus inverse | Euclidean exterior scalar domain without boundary condition | Kernel contains r⁻¹, r⁻²Y₁,…; injectivity fails although δ=−1/2 noncritical | README's domain warning retained. |
| Positive harmonic end data | One-ended ℝ³ with end constant a | Harmonic solution=a; a=1 gives1; a=0 gives0 | Strict positivity needs nonzero nonnegative data. |
| Conformal-potential kernel warning | Formal scalar Δ⁺+V versus Δ⁺ | V=0 admits constants locally; V=1 sends1→1 | Potential cannot be discarded; exact global kernel assumptions must remain. |
| Harmonic-flat approximation and strict weight loss | n=3,t=1,q=3/4 | 1/2<3/4<1; g tail r⁻¹ has weighted p-tail exponent −p/4−1<−1 | Chosen approximation interval nonempty. |
| Weak norm convergence is not mass convergence | n=3, change metric by a c/r tail beginning beyond R, q<1 | Weighted W²,p size=O(R^(q−1))→0; mass increment remains2c | Separate mass-limit target in P2 is necessary. |
| Zero-mass Ricci variation | Euclidean metric, compact h | Ric=0; scalar linearization divergence integrates to0 | No strict sign from h in the excluded Ric=0 case; nonzero-Ric assumption matters. |
| AE volume lower limit | Euclidean end with bounded core error | (ω_n rⁿ+O(r^(n−1)))/(ω_n rⁿ)→1 | New AE comparison belongs here. |
| Maximal-volume equality | ℝ³; flat ℝ²×S¹ | First ratio=1; second volume=O(r²), ratio→0 | Supplier equality applies only to first; R04 removes duplication. |
| Torus obstruction / cup pairing | Identity T³→T³; degree-zero constant map | Triple pairing=1 versus0 | Nonzero-degree hypothesis discriminates. |
| Stability inequality | Flat two-sided torus slice, φ=1 | Both integrals=0 | Correct zero-curvature equality; PSC would force positive RHS. |
| Compact PSC Rayleigh bound | k=3, test φ | a_k=8>2; energy difference from stability energy=6∫|dφ|²≥0 | Lower bound by minScal_M is algebraically valid. |
| Surface torus obstruction | T² and S² | b₁=2,χ=0 versus b₁=0,χ=2; degree-one map to T² possible only in first control | PSC stable descent would require χ>0, contradicting the torus-class case. |
| Degree-one class square | Rational exterior algebra H*(T²), a,b generators | a²=0; a∪b evaluates1 | Both independence and antisymmetry used. |
| Boundary Gauss–Bonnet | Euclidean unit disc | ∫K=0; ∫k_g=2π; χ=1 gives2π | Inward conormal sign correct. |
| Boundary orientations | Flat annulus with radii1,2 | Outer integral2π; inner integral−2π; total0=2πχ | Both boundary components tested. |
| Corners | Euclidean square | Edge curvature0; four exterior angles π/2 sum2π | Corner contribution required. |
| End-value capping | Schwarzschild g=(1+a/r)⁴δ on ℝ³\{0}, a>0, U=r/(r+a) | Δ_gU=0; chosen b=−a; m+2b=2a−2a=0; at other end Uw has positive harmonic coefficient | Capping mechanism and sign checked on an actual two-ended model. |
| Kelvin removability | v=c r^(2−n), c>0 | Kelvin transform |y|^(2−n)v(y/|y|²)=c | Positive constant extends smoothly; c=0 would not give positive cap metric. |
| Negative-mass truncation sign | Harmonic h; F′≥0,F″<0 where dh≠0 | ΔF(h)=F″(h)|dh|²<0; Δ⁺F(h)>0; conformal Scal>0 | Matches P3b, not sign-reversed Δ⁺ notation. |
| Exact Euclidean exterior | F(h)=a>0 constant | g′=a^(4/(n−2))δ; y=a^(2/(n−2))x gives δ | Scale removed by coordinate map. |
| Torus insertion degree | Regular value in unchanged torus portion | One positive preimage; degree=+1; H¹-product pairing=1 | Degree supplies compact obstruction. |
| Nonorientable lift mass | Chosen end lifts isometrically | Each lift mass=m, not2m; positive-mass hypothesis unchanged locally | Orientation double-cover needs global completeness as stated. |
| AE graph height | n=4, u=a+b/r on a 3-dimensional base | ∂u=O(r⁻²); graph metric error ∂u⊗∂u=O(r⁻⁴) | Consistent with claimed faster induced decay; does not prove one-sheet existence. |
| Induced zero mass | Ambient n=4 conformal error O(r⁻²), induced dimension3 | First metric derivative O(r⁻³), flux sphere area O(r²), result O(r⁻¹)→0 | Expected zero induced mass. |
| n=3 logarithmic alternative | Graph u=a+b log r | ∂u=b/r; at b≠0 height unbounded | Cannot replace by the n≥4 decaying-height formula. |
| Logarithmic stability cutoff | Annulus R<r<R², cutoff slope −1/(r logR) | ∫|dχ|²=2π/logR→0 | Constant-test extension plausible only after stated geometric estimates. |
| AE frame model | g=a²δ constant | Orthonormal frame=a⁻¹∂; spin connection0 | Metric/frame scaling consistent. |
| Inward mass flux | n=3,|v∞|=1,m=2c | G∞=−4πm=−8πc; −G∞=+8πc | c=0 gives0; c=1 fixes sign. |
| Doubled Clifford action | Single unit direction cΣ=i, doubled C=[[0,i],[i,0]] | C²=−I; C* =−C | Negative convention retained. |
| σ algebra | σ=[[0,−i],[i,0]] | σ²=I; σ*=σ; Cσ+σC=0 | Correct anticommutation. |
| Callias square | Flat line-direction test with ψ constant t | (C∂+tσ)²=−∂²+t² | Mixed terms vanish, t² positive. |
| Variable-potential square | ψ=x₁ | Cross term=Cσ=diag(−1,1), eigenvalues−1,+1 | Lower bound by −|dψ|=−1 is sharp. |
| Chiral boundary condition | Same C and σ | χ=Cσ=diag(−1,1); χ²=I; +1 vector(0,1), −1 vector(1,0) | Correct self-adjoint involution; R06 asks README to record these. |
| Boundary Green isotropy | u=v=(0,1) in +1 eigenspace | Cu=(i,0); inner(Cu,v)=0 | Required boundary pairing cancellation. |
| Mean-curvature convention | Radius-R ball, inward ν; exterior region, inward ν | A=+g/R,H=+1/R versus A=−g/R,H=−1/R | η=(n−1)/(2R)+ψ versus −(n−1)/(2R)+ψ. |
| Twistor identity | n=3,∇₁u=v, other derivatives0, ‖v‖=1 | ‖Du‖²=1; ‖Pu‖²=2/3; 1=2/3+1/3 | n coefficient correct. |
| Refined potentials | n=3,Scal=6,ψ=0 | θ=3/2, θ̄=9/4 | Factor n/(n−1)=3/2; barred and unbarred are not interchangeable. |
| Weighted solver codomain | q=(n−2)/2 | −q−1=−n/2; L²_(-n/2) density exponent0 | Target is ordinary L², as in P6. |
| Weighted Poincaré | Unit flat T³,ρ=1,parallel unit u | ‖u‖=1 and ‖∇u‖=0 | Failure R01; nonempty AE hypothesis repairs it. |
| Nonnegative index versus surjectivity | Fredholm finite-dimensional counts | dimker=0 and index≥0 imply 0−dimcoker≥0, so dimcoker=0 | README correctly requires index/cokernel control. |
| Small-negative-part absorption | Poincaré squared constant C=2, c₀=1/(2C)=1/4 | 1/C−c₀=1/4>0 | Source §4 bound uses weighted L∞_(-2), not arbitrary unweighted smallness. |
| Compact potential is needed for weighted map | n=3,u∼r⁻¹,ψ=1 | H¹_(-1/2) tail finite; ‖ψu‖²₂ has radial tail ∫1dr=∞ | Keep P6's compact-potential restriction explicit. |
| Finite-ended spin zero-rigidity | ℝ³, constant unit spinor | Du=0,∇u=0,m=0; curvature action=0 | Exact equality model. |
| Exhaustion distances | ℝ³, X₀={r≥R}, X_λ=ℝ³ | Empty boundary distance=∞>1/λ for all λ>0; infimum=0 | P7 completeness model. |
| Callias barrier potential | h(t)=λ/(1−λt), 0≤t<1/λ | h′=h²; h²−|h′|=0; λ=1,t=1/2 gives h=2 | Correct barrier sign and finite-threshold convention. |
| P7 interior error | Flat collar,ψ=λf | θ=λ²f²−λ|df|≥−λ|df| | Error is O(λ) on fixed K. |
| P7 correction equation | ψ=λ,ξ₀=(v,0),‖v‖=1 where supports overlap | B(ξ₀+ξ_λ)=λσξ₀=(0,iλv); norm λ≠0 | Missing support law, R03. |
| P7 energy limit | Bound E_λ≤Cλ at zero mass, λ=1/j | 0≤E_(1/j)≤C/j→0 | Vanishing energy mechanism, after corrected equation. |
| P8.1 nonspin PMT | ℝ³; positive Schwarzschild with c=1 | (Scal,m)=(0,0) with Euclidean isometry; (0,2) without equality | Both zero and positive controls; boundaryless complete Schwarzschild has two ends. |
| P8.2 spin PMT | Same models in n=8 | Mass0 and2, intrinsic spin rank16 | n≤7 restriction is absent only with Spin hypothesis. |
| P8.3 arbitrary-end theorem | Euclidean model; negative Schwarzschild exterior | First m=0,rigidity holds; second m=−2 but completeness fails | Chosen-end theorem consistent with source Theorem B. |
| Green coefficient corollary | m=2A with A=0,1,−1 | m=0,2,−2; PMT excludes last under all its hypotheses | No 0/0 or sign ambiguity. |
| Lean Euclidean / MetricCoefficients | n=0,1,3 | Dimensions0,1,3; arbitrary coefficient functions include g=0 | Real definitions do not assert geometric positive definiteness. |
| Lean coordinateFluxIntegrand | g=δ, r=0 or r>0 | Derivatives0, integrand0 even with totalized division | Euclidean identity true at junk radius too. |
| Lean normalizedCoordinateFlux | n=1; n=3 | n=1 denominator0, totalized flux0; n=3 denominator16π>0 | Headline n≥3 avoids denominator failure. |
| Lean euclideanMetricCoefficients / zero theorem | i=j or i≠j | Coefficients1 or0; every derivative0; both theorem sides0 | One-simp padding, R07. |
| Lean conformalFluxNormalization | n=3,c=1; n=1,c=1 outside hypothesis | 8/4=2; 0/0=0≠2 | n≥3 sufficient; scalar cancellation is padding. |
| Lean conformalEuclideanCoefficients | n=3,c=−1,r=2; at x=0 | u=1/2 and diagonal=1/16; totalized c/0=0 gives diagonal1 at origin | Only large spheres represent intended geometry; no global smooth metric claimed. |
| Lean conformalEuclidean_mass | n=3,c=1,0,−1; n=6,c=1 | Limits2,0,−2; n=6 flux2 | Numerically correct normalization target; README Check rather than headline. |

The smooth flux rows supply numerical normalization controls. They do not upgrade arbitrary weak H¹ sections to classical all-radius boundary traces; P4 correctly asks for a separate cutoff/trace argument. Existence, compactness, regularity and uniqueness targets were also checked for their stated domain restrictions: complete versus exterior domains, finite p versus endpoints, higher-order coefficient hypotheses, chosen spin factor, compact boundary trace, and compact potential. Where the README leaves a quantitative estimate to be specified (“explicit norms”, “required strictness”, “at their actual exponents”), the table does not certify an unstated inequality.

## Not verifiable

- **The worker's exact random target list:** none is supplied and the brief says none was found by heading. The fifteen replacement targets and seed are recorded above; they are not misrepresented as the worker's list.
- **Bartnik (1986), §1, Theorem 1.7, §§2–4:** sources-service requests to the DOI/Wiley and JHU institutional copies returned HTTP 403. A CiteSeer request redirected to an archive URL outside the service's recognized classes; no cached primary text was obtained. Its exact theorem numbering and hypotheses are therefore uncertified. Metadata/search snippets were not used as a substitute for the proof text.
- **Schoen–Yau, On the proof of the positive mass conjecture in general relativity (1979):** both JHU institutional URL variants failed with HTTP 403. The original density/rigidity/minimal-surface details were not certified from that paper.
- **The unnamed scalar-curvature minimal-hypersurface papers:** the README does not uniquely identify them. A service request for the plausible 1979 Annals work on incompressible minimal surfaces reached a JSTOR landing page, not readable primary text. Its identity as the intended citation remains unconfirmed.
- **Unassigned locators:** in particular the full monogenic sphere spectrum, boundary Gauss–Bonnet, and P3c one-graph/asymptotic estimates have no exact source in the README to certify. Computed controls do not replace those missing locators (R05).
- The three unavailable-reference entries and all attempted locations are retained together in the job's `needs-references.toml`. No source manifest was edited, no paywall bypass was attempted, and no work was left running. Ownership against the supplied open-roadmap heads was checked; arbitrary unlisted private or external formalizations were not searched.

## Source issues

- **Misprint** in cecchini-zeidler at proof of Lemma 3.4, printed p. 15 (arXiv v2; line 647): the source says the unbarred interior and boundary potentials are nonnegative in the refined estimate; it should use the barred potentials from the lemma's hypotheses and equation (2.10); affects the proof.
- **Misprint** in cecchini-zeidler at equation (4.5), printed p. 17 (arXiv v2; line 771): the source says the gradient contribution is an unsquared L² norm; it should be the squared L² norm throughout that display, consistently with (2.9) and (4.7); affects the proof.

Both were checked against rendered PDF pages. The apparent set-difference symbol in the extraction at line 764 is **not** a source error: the PDF correctly prints disjoint-support intersection. No erratum is inferred from that extraction artifact.
