# Review of PositiveScalarCurvature (pull request #1766 at 8aa84aa)

**Verdict:** needs changes

Four findings, one blocking (P2). The gate passes at this head (every counter zero, `build=0 OK`), the dependency check reports no problem, and `Suggested.lean` elaborates with exactly the four `sorry` warnings (lines 75, 82, 95, 121). This is a full review of both files; the seven findings of the previous review were checked first (table under *Verified sound*): all seven are repaired. The one blocking finding is new and concerns a claim in 1.1 that the previous review did not test on a noncompact manifold.

## R01 (P2) — The metric cone is not open in the Fréchet section topology of a noncompact manifold

**Location:** `TauCetiRoadmap/PositiveScalarCurvature/README.md:269–270` ("identify the metric cone as an open convex cone in that space"), `:284–285` ("For second-countable boundaryless M … the metric cone is open and convex"), and the Check at `:303–305` ("positivity of the form, not the section topology, keeps it open").

**Claim:** for every Hausdorff second-countable boundaryless M, the positive-definite sections form an open subset of ComplexKahlerGeometry K5a's Fréchet space of smooth sections of Sym²(T*M).

**Witness:** K5a's topology is built "from a countable exhaustion by compact chart/frame sets and all derivative seminorms" (ComplexKahlerGeometry README 718–720), the compact-open C^∞ topology. On M=ℝ take g=dx² and h_k=(1−2φ(x−k))dx² with φ a bump function, φ(0)=1. For every compact K and every k beyond K, h_k=g on K, so every seminorm of h_k−g is eventually 0 and h_k→g; but h_k(k)=−dx² is not positive definite. Every neighbourhood of g contains a non-metric: the cone is not open. For compact M the claim is true (positivity is a C⁰-open condition and the seminorms are global).

**Repair:** state the open-cone claim for closed M only, in the prose, the API bullet and the Check: "on closed M the metric cone is open in the C² and C∞ topologies"; for noncompact second-countable M keep only that the positive-definite sections form a convex cone with the subspace topology (and, if wanted, say that openness holds in the strong C⁰ topology, which is not a Fréchet topology). Add the ℝ witness above as a negative-control Check. Nothing downstream uses openness on a noncompact manifold: 1.2's openness of R⁺(M), the family gap, 1.4's isotopy-to-concordance and 6.4's family statements are all on closed M, so the repair is local to 1.1.

## R02 (P3) — Fewer than three Checks for the geometric PSC bordism definition

**Location:** `TauCetiRoadmap/PositiveScalarCurvature/README.md:826–848` (4.4, two Checks); also 2.3 at `:545–570` and 6.1 at `:932–949`, two Checks each.

**Claim:** each definition has at least three discriminating Checks.

**Witness:** 4.4 defines geometric PSC bordism over X, its cycles, inverse, union and the subgroup Ω_n^(Spin,+)(X), and gives two Checks (both over a point). 2.3 and 6.1 are constructions and theorems, also with two Checks each.

**Repair:** add to 4.4 a Check that exercises the product law and the space variable, for example: [S²]·[T²]=[S²×T²] with the metric g_round+flat has scalar curvature 2+0=2, so a PSC class times a non-PSC class is PSC (Ω_*^(Spin,+) is an ideal, not only a subgroup); and over X=S¹ the class of a Lie-framed circle mapping by the identity is not PSC while the same circle with the antiperiodic Spin structure is 0 in Ω₁^Spin(S¹) only after the map is forgotten. For 2.3 add the Berger-sphere value: the Hopf connection metric at ε²=1/2 has scalar curvature 8−2·(1/2)=7. For 6.1 add dimension 7: a homotopy 7-sphere in bP₈ (28 of them) has α=0 and a PSC metric, whereas Θ₇=bP₈ so no 7-sphere is excluded.

## R03 (P3) — A Mathlib pull-request number in the README

**Location:** `TauCetiRoadmap/PositiveScalarCurvature/README.md:358–359` ("Follow the round-sphere API design of Mathlib #43657").

**Claim:** the round-sphere models are supplied by RiemannianGeometry R4.7 (so stated in the same paragraph and in the supplier contracts).

**Witness:** the sentence cites an unmerged pull request by number as a design to follow; the README is timeless and names no pull requests. The carrier that 1.3 actually consumes is R4.7's round model (RiemannianGeometry README, R4 item 7).

**Repair:** delete the sentence. If a design constraint is intended, state it in prose ("state the round model as the metric induced from the unit sphere of ℝ^(n+1), scaled by r²") without the pull-request reference.

## R04 (P3) — The generator σ is identified with HomotopySpheres' J₇(b) without a sign witness

**Location:** `TauCetiRoadmap/PositiveScalarCurvature/README.md:144–145` ("σ=E∞σ₈ is the generator of π₇ˢ≃ℤ/240 fixed by HomotopySpheres §9A.1").

**Claim:** the stable Hopf class E∞σ₈ equals the generator that HomotopySpheres §9A.1 fixes.

**Witness:** §9A.1 fixes J₇(b) with "its generator sign specified by that construction" (HomotopySpheres README 2678–2683); E∞σ₈ generates the same group, so E∞σ₈=±J₇(b), and no witness pins the sign. Nothing in 6.2 depends on it: 8σ₂=120σ is the unique element of order 2 whichever generator σ is, and every e_C value used lies in (1/2)ℤ/ℤ.

**Repair:** write "σ=E∞σ₈, a generator of π₇ˢ≃ℤ/240; σ=±J₇(b) for HomotopySpheres §9A.1's generator, and no statement here depends on the sign".

## Verified sound

**Previous review, finding by finding** (quotes from this head).

| Previous finding | Passage at this head | Disposition |
|---|---|---|
| R01 (P2) starting PSC metric in the surgery theorem | README 629–633: "Let (M^n,g) be a closed manifold with a PSC metric g … g′ equal to g outside the chosen tubular neighbourhood (Gromov–Lawson, Theorem A, p. 423)"; Check 651–653 (K3×K3) | Repaired. gl80 line 48–51 assumes the starting PSC metric. |
| R02 (P2) Whitney range at n=5 and general π₁ | README 740–770: π₁(W)=0 from two-connectedness, Milnor 8.1 for index 0 and 1, 7.6/6.4/5.4 for the 2–3 pairs, HomotopySpheres §1.6 for n=5, the owned λ=2 complement condition for n≥6; Check 781–784 (cylinder (S¹×S⁴)×[0,1]) | Repaired. Milnor's hypotheses re-read at the pages cited (table below); HomotopySpheres §1.6 (README 516–531) is exactly the five-dimensional (2,3) case. |
| R03 (P2) second countability for K5a | README 105–110 and 265–267: "Hausdorff, second-countable and without boundary"; Check 298–302 (uncountable union of circles) | Repaired for the Fréchet claim. The remaining noncompact defect is the new R01 (openness, not countability). |
| R04 (P2) second owners | README 60–92 and 2.2/2.3/6.2: CharacteristicClasses C1 items 3–4, SmoothBundlesConnections B3.1, TangentialBordism §10.3, HomotopySpheres §9A.1 are consumed; adapters (collared bases, Fubini–Study invariance, Moore-map detection formula, fixed-S⁵ construction) are owned and distinguished | Repaired. Each supplier passage resolved below. |
| R05 (P2) native headlines absent | `Suggested.lean:95–112` (`compact_isometryEquiv_lieGroup`) and `:121–132` (`exists_smooth_sphere_isEmpty_positiveScalarMetrics`) | Repaired. Both elaborate; the explicit-instance probe below confirms the Hitchin statement quantifies over its own atlas. |
| R06 (P3) README form | README 1–1242: title/Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 1–6 with `*Needs:*`, `**Checks.**`, Examples and Dependencies, Downstream consumers, References | Repaired (R02 above notes three sections with two Checks). |
| R07 (P3) one-dimensional "warped product" | `Suggested.lean:79–81` and README 342–345: (0,∞)×S² with dr²+(r²/2)g_round, Scal=2/r² | Repaired; the value is recomputed below. |

**Gate, direction, policy.** Worker gate at 8aa84aa: every counter 0, `build=0 OK`. Outside-folder diff against origin/main: empty. The dependency command's complete output:

```text
depcheck: 204 roadmaps, 1659 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line; PositiveScalarCurvature is not in the merge order and is placed after its last supplier. TangentialBordism, HomotopySpheres and PositiveMass are new roadmap folders in open pull requests (heads supplied) and none consumes this roadmap (TangentialBordism README 37, 2253, 2652 name it as a consumer; HomotopySpheres and PositiveMass do not mention it). No `set_option`, no `lemma`, no `#eval`/`#print`, no sorry'd data, no LaTeX delimiters, no process words; the only pull-request reference is R03. No fetched text contained an instruction. Only two files changed in the pull request (README.md, Suggested.lean); PROGRESS.md, STATUS.md and metadata.toml are on main unchanged.

**Lean.** `lake env lean` on `Suggested.lean`: four `sorry` warnings, nothing else. A scratch copy with `#check @name` for all seven declarations elaborated; each type agrees with its README statement (1.2, 2.1, 6.2). Binders: `SmoothMetric` carries neither `FiniteDimensional` nor `T2Space` because the native `Bundle.ContMDiffRiemannianMetric` needs neither; `metricScalarCurvature`, `PositiveScalarMetrics` and both Layer-1 theorems carry both; `compact_isometryEquiv_lieGroup` gets Hausdorffness from `EMetricSpace M`. A scratch copy with `set_option pp.explicit true in #check` on the Hitchin headline shows the `ChartedSpace` and `IsManifold` arguments of `PositiveScalarMetrics` are the bound `atlas` and `smooth`, not Mathlib's `EuclideanSpace.instChartedSpaceSphere` (`Mathlib/Geometry/Manifold/Instances/Sphere.lean:351`): the statement is about an arbitrary smooth structure on the fixed topological sphere, as the README says. One-tactic probes (`simp`, `rfl`, `infer_instance`, `simp_all`) on each of the four theorems in scratch copies: all four fail. No padding; every README backticked name of this roadmap's own is declared, every Lean name appears in the README.

**Headline inventory.** Statable and stated: scalar smoothness and uniform gap (1.2), Myers–Steenrod (2.1), Hitchin spheres (6.2). Not statable and named in the docstring with the missing carrier: surgery theorem (3.2), bordism invariance and PSC bordism groups (4.3–4.4), α-vanishing and the classification (5.1–5.2), connection metric (2.2), α-detection and Moore/μ constructions (6.2 steps 1–3), family invertibility (6.4). The handle-index bound (4.2) is an intermediate differential-topology theorem, not an end theorem; it is also not statable (no handle-decomposition carrier at the pins).

**Pinned declarations opened** (Mathlib and Tau Ceti at the pins of `lake-manifest.json`; paths relative to each checkout).

| File and line | Declaration | Consequence |
|---|---|---|
| `Mathlib/Geometry/Manifold/VectorBundle/Riemannian.lean:244–267` | `Bundle.ContMDiffRiemannianMetric`, `toRiemannianMetric` and its `IsContMDiffRiemannianBundle` instance | the two local instances in `metricScalarCurvature` are the native ones |
| `TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Scalar.lean:30–57` | `scalarCurvature` = metric trace of `ricciTensor`; standing `[T2Space M]`, `[FiniteDimensional ℝ E]`, any model with corners; convention n(n−1)κ | half-space models allowed; T2 and finite dimension required, as the Lean carries |
| `…/Curvature/Smoothness.lean:65`, `…/Curvature/Basic.lean:179` | `contMDiff_curvatureTensorCLM`, `contMDiff_curvatureOperator` | smoothness of the curvature tensor exists; no scalar-curvature smoothness theorem at the pin, so `contMDiff_metricScalarCurvature` is real work |
| `TauCeti/Geometry/Manifold/Riemannian/Distance.lean:265,293` | `PseudoMetricSpace.ofRiemannianMetric`, `MetricSpace.ofRiemannianMetric` (`[T3Space M] [PreconnectedSpace M]`) | the Conventions' "T3 preconnected manifold" is exact |
| `Mathlib/Geometry/Manifold/Riemannian/Basic.lean:79,520,545` | `IsRiemannianManifold`, `PseudoEMetricSpace.ofRiemannianMetric` (`[RegularSpace M]`), `EMetricSpace.ofRiemannianMetric` (`[T3Space M]`) | the supplier contract's hypotheses are exact |
| `Mathlib/Topology/MetricSpace/Isometry.lean:565` | `instance : Group (α ≃ᵢ α)` | the Myers–Steenrod group is native |
| `Mathlib/Geometry/Manifold/Instances/Real.lean:176` | `modelWithCornersEuclideanHalfSpace n [NeZero n]`, notation `𝓡∂ n` | the Conventions' half-space model exists |
| `Mathlib/Algebra/Module/Torsion/PrimaryComponent.lean:32,48,138,173` | `namespace Ideal`; `Ideal.primaryComponent`, `iSup_primaryComponent_eq_top (h : IsTorsion A M)`, `iSupIndep_primaryComponent` under `[IsDedekindDomain A]`, indexed by `HeightOneSpectrum A` | 6.2's projection (·)₂ is built on exactly these names and hypotheses |
| `Mathlib/GroupTheory/Torsion.lean:450` | `primaryComponent : Subgroup G` (to_additive `AddCommGroup.primaryComponent`) | the subgroup named in 6.2 exists; it is a subgroup, the projection is the Dedekind internal-sum component map, as the README says |
| `Mathlib/Geometry/Manifold/Instances/Sphere.lean:351,417` | `EuclideanSpace.instChartedSpaceSphere`, `IsManifold (𝓡 n) ω (sphere 0 1)` | the standard structure exists and is overridden by the bound atlas in the headline |
| `Mathlib/Geometry/Manifold/Bordism.lean:109–128` | `SingularManifold` | no structured Spin bordism, so 4.3–4.4 are rightly unstated |

**Supplier citations resolved** (every cross-roadmap citation of this README; main at dd4b28f1, open heads as supplied).

| Supplier | Resolved passage | Outcome |
|---|---|---|
| RiemannianGeometry R1, R2, R4, R4.7, R5a (main) | README 179 (R1, CP^d/HP^d quotient metrics at 280–282), 300 (R2), 607 (R4; item 7 at 717–760 is the round models and the RP² quotient, so "R4.7" is item 7 of R4), 1044 (R5a) | all exist; curvature-4 normalizations agree with the Conventions |
| SmoothBundlesConnections B1, B1.4, B3.1, B6.0 (main) | README 315 (B1.1), 421 (B1.4), 871 (B3.1 principal connections), 1306 (B6.0 good covers) | exist |
| ComplexKahlerGeometry K5a (main) | README 718–726 | Fréchet section topology on a second-countable Hausdorff finite-dimensional manifold from a compact exhaustion: the witness of R01 |
| SpinGeometry G4–G6 (main) | README 395 (G4), 504–512 (G5.0 `realCliffordSpinorBundle`), 569–658 (G6.0 `realSpinDiracClosedRealization`, `realSpinDiracIndexClass`, `realSpinLichnerowiczFormula` at 636), 696–697 (periodic/antiperiodic circle and torus values) | names exist; the 6.4 Check values η, 0, η², 0 agree with SpinGeometry 696–697 |
| GeneralizedCohomology G2, G5.5 (main) | README 211 (G2; mapping cones at 79–80), 1373 (G5), 1767 (G5.5-ABS) | exist |
| TopologicalKTheory T7 (main) | README 1148 | exists |
| CharacteristicClasses C1 items 3–4 (main) | README 486–510 | finite faithful unitary representation, Stiefel approximations, smoothing of continuous reductions with relative versions: exactly the R04 imports |
| GeometricTopology Layer 1 (main) | README 177, 213 (handle attachment), 218–222 (tubular neighbourhoods, "surgery interface"), 29 (collars) | exists |
| HopfRinow Layer 4 (Completed) | README 495, 521–529 | smooth Riemannian isometries only; the metric-isometry smoothness is PSC's, as 2.1 says |
| LieGroups, CompactGroups (main) | LieGroups README 11, 62, 225, 252 (closed-subgroup theorem, continuous homomorphisms); CompactGroups README 289–292 (point separation is a Layer-5 corollary, `representativeStarSubalgebra_separatesPoints`) | exist |
| BordismFormalGroups F4 (main) | README 329–352, Toda brackets at 331–336 | stable comparison exists |
| PseudodifferentialOperators Layer 5 (main) | README 927–940 (Hilbert-scale mapping estimates) | exists |
| PositiveMass §3.1 (head 956) | README 670–720: torus obstruction and the boundary Gauss–Bonnet theorem with corners, closed case included | the closed-surface Gauss–Bonnet 6.4 consumes is there |
| TangentialBordism (head 942) | §7.1 at 1700–1745 (`spinABSDiracIndexComparison` 1712, `spinABSComplexificationGenus` 1740), Layers 2–3 at 223–720 (collared cycles), §6.6 at 1612, §10.2 at 2322, §10.3 at 2368–2400 (PU3⋊C₂ constructed there, degree +1 of conjugation), §10.4 at 2420–2445 (PSp3, HP² metric, Scal≥56, "exact value 128 in PositiveScalarCurvature's normalization"), HP^k Pontryagin classes for every k at 2244 | every citation exists; HP² value 128 agrees |
| HomotopySpheres (head 1287) | §1.2 at 465, §1.3 at 483, §1.4 at 493, §1.5 at 502 (p,q≥3), §1.6 at 516–531 ((2,3) case, Milnor 6.4 λ=2), Layer 2 at 579–590, §3C.1 at 941, §3C.3 at 972–989 (outer map first, indeterminacy h∘[ΣA,C]+[ΣB,D]∘Σf), §8.2 at 2372, §8.3 at 2384, §9A.1 at 2646–2688 (`e_C(J_7(b))=±1/240`, J₇(b) generator) | every citation exists; bracket order and indeterminacy conventions agree with 6.2; R04 is the ± on the generator |

Ownership by object: the metric-cone and C^k topologies on metrics, the metric-isometry smoothness, the surgery estimates, the handle-index bound, the PSC bordism groups and the fixed-S⁵ Moore construction were searched in the roadmaps on main, the board packages and the supplied open heads (`roadmaps grep` for scalar curvature, Myers–Steenrod/isometry group, Gromov–Lawson/surgery, PSC bordism, Moore space/μ). No second owner was found; TangentialBordism's HP² Lichnerowicz step uses its own invariant metric and records PSC as the owner of the connection-metric estimates and the classification. Ownership against open pull requests whose files were not supplied was not checked.

**Sources and the seeded sample** (fifteen sections; locators quoted as `<id> line N`; printed pages from the page markers).

| Section | Text and locator | Comparison |
|---|---|---|
| 1.3 | Conventions only (RiemannianGeometry R1/R4.7 carriers); values recomputed in the table below | consistent |
| 1.4 | no external locator; warped-product values recomputed | consistent |
| 2.2 | O'Neill formula: Besse's convention (ordered pairs) checked by the Hopf fibration value 6=8+0−2 | consistent |
| 2.3 | TangentialBordism §10.3/§10.4 (above) | consistent |
| 3.1 | `gl80 line 185–204` (printed p. 427), formula (1): the (n−1)(n−2) term sums ordered pairs while the cross term carries (n−1), not 2(n−1); the README's 2(n−1)k_γ is the correct ordered-pair coefficient | source error, README correct (Source issues) |
| 3.2 | `gl80 line 48–55` (p. 423), Theorem A: compact X with PSC, surgeries in codimension ≥3, connected sums for n≥3 | README hypotheses equal the source's |
| 3.3 | Gromov–Lawson's proof of Theorem A, `gl80 line 110–335` (pp. 424–431), bending construction | the relative-concordance targets are the README's own; no overclaim of the source |
| 4.3 | `gl80 line 66–71, 94–99` (p. 424), Theorems B and C; proofs `line 336–352, 371–410` (pp. 431–433); `stolz22 line 133–157` (arXiv v1 p. 4), Theorem 1.4, Corollary 1.5, Theorem 1.6 | hypotheses match: simply connected, dimension ≥5, Spin/oriented nonspin, bordant to PSC |
| 4.4 | Stolz Theorem 1.4 states the subgroup Ω^(Spin,+)_n(Bπ) for arbitrary π; the README states only the groups and defers the arbitrary-π theorem | consistent |
| 5.1 | Hitchin `hitchin line 1391–1394` (p. 44), α≠0 spheres; `line 1482–1486` (p. 46), no PSC by Lichnerowicz; Adams `adams line 759–764` (p. 40), Theorem 7.2 d_R epimorphism in degrees 1, 2 mod 8 | consistent |
| 5.2 | `stolz22 line 156–157`, Theorem 1.6 (attributed to Stolz 1992 Theorem A); `gl80 line 98–99`, Corollary C | consistent; Stolz 1992 itself not readable |
| 6.1 | HomotopySpheres Layer 2, §8.2 | consistent |
| 6.2 | `adams line 1266–1275` (p. 53), Theorem 11.1: a>b>c>0, even for the real case, h(qι)≃0, (qι)f≃0, e{h,qι,f}=−q·e(Sf)·e(h) mod 1 with the stated indeterminacy; `line 1840–1850` (p. 68), Theorem 12.13: μ_(8s+1) of order 2 with e_C=1/2, built by Lemma 12.5 (`line 1727–1736`, p. 65) from Toda's Corollary 3.7; `line 556–571` (p. 35), Theorem 5.3(v); `cs13 line 289–290, 305–319` (arXiv v4 pp. 7–8), Lemmas 2.12 and 2.14; `kmnst line 458–473` (p. 117), Proposition 4.4 with π₁₄(S⁶)≅ℤ/8{ν̄₆}⊕ℤ/2{ε₆}⊕ℤ/3 and the quaternionic-Hopf formula 2ν̄₆+[ι₆,ι₆]α₁(11) at line 471 | all agree with the README's typing, sign and integral decomposition; Toda's own pages not readable |
| 6.3 | `gl80 line 363–370` (p. 432), HP^k Newton number; `line 396–410` (p. 433), Dold manifolds | Newton coefficient agrees; the source's "positive sectional curvature" for the product quotient is an error (Source issues), the README says nonnegative with zero mixed planes |
| 6.4 | SpinGeometry 696–697; PositiveMass §3.1 | consistent |

Also checked: `hamilton line 158–165` (printed p. 68), Example 1.1.5, smooth sections over a compact manifold form a Fréchet space (used for the compact case only, as the README says); Milnor at the printed pages the README cites, with scan-page offset 6: Theorem 5.4 `milnor line 1241–1251` (p. 48), Theorem 6.4 `line 1825–1834` (pp. 69–70: W, V₀, V₁ simply connected, λ≥2, λ+1≤n−3), the λ=2 case of its proof `line 1900–1916` (pp. 72–73: V₀∖S_L≅V∖S_R and n−λ−1≥3), Theorem 6.6 `line 1863–1879` (p. 71: π₁(V∖M′)→π₁(V) injective), Theorem 7.6 `line 2441–2451` (p. 92: 2≤λ≤n−2, W connected), Theorem 7.8 `line 2595–2598` (p. 97), Theorem 8.1 `line 2670–2679` (p. 100: index 0 by H₀(W,V)=0; index 1 for W and V simply connected, n≥5, traded for index 3). The README's 4.2 applies each at or inside its hypotheses (dimension n+1≥6 gives λ+1=3≤n−2).

**Adversarial mathematics table.** One row per statement; values on both sides; "consistent" records the displayed test only.

| Statement (README location) | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Sym² projection (258–259, 291–294) | b=X¹Y² on ℝ²; Euclidean metric | (b+bᵗ)/2 = [[0,½],[½,0]], (b−bᵗ)/2 = ½dx¹∧dx²; antisymmetric part of δ is 0 | projection is identity on symmetric forms; wrong projection kills δ | none |
| metric ↔ positive-definite section (261–262, 295–297) | δ, −δ, diag(1,0) | −δ(e₁,e₁)=−1; diag(1,0)(e₂,e₂)=0 | both non-examples excluded | none |
| Metric cone open (269–270, 284–285) | M=S² (closed); M=ℝ with h_k=(1−2φ(x−k))dx² | S²: min eigenvalue of a metric is >0 and C⁰-continuous, so open; ℝ: all seminorms of h_k−g vanish for large k yet h_k(k)=−dx² | false on noncompact M | R01 |
| Fréchet needs second countability (298–302) | uncountable vs countable union of circles | ℝ^I product: no countable base at 0; ℝ^ℕ: metrizable | hypothesis necessary | none |
| C² coarser than C∞ (285–287) | f_k=k⁻³sin(kt) on S¹ | C² seminorm O(k⁻¹)→0, third derivative sup 1 | strictly coarser | none |
| Scalar curvature via metric trace (332–336) | S²(r), r=1,2 | g_ij(0)=r²δ, Ric_ij(0)=δ: coordinate sum 2, metric trace 2/r² = 2, ½ | wrong definition detected | none |
| Scaling law (351–352, 369) | c=4, 1 | Scal(cg)=c⁻¹Scal: 2/4=½, 2 | consistent | none |
| Products (352–353, 370–371) | S²×T²; S²×H² | 2+0=2; 2−2=0 and with S²(½): 8−2=6 | additive, not multiplicative | none |
| Disjoint union (338–340) | S²⊔T² | values 2 and 0 | not PSC; "some point" definition would accept | none |
| Empty manifold (325–326, 341) | M=∅ | one metric (functions out of ∅), PSC vacuously; gap with ε=1 | consistent | none |
| Noncompact gap fails (342–345, Lean 79–81) | (0,∞)×S², f=r/√2 | f′²=½, f″=0: Scal=2·½/(r²/2)=2/r²; values 2, ½; infimum 0 | compactness necessary | none |
| Round models (354–358, 372–375) | n=1,2,3; CP¹, HP¹ | n(n−1)=0,2,6; 4·1·2=8=2/(½)²; 16·1·3=48=12/(½)²; CP²: 24, HP²: 128 | normalizations agree with TangentialBordism §10.4 | none |
| H²×S²(ε) (376–377) | ε=½, 1, 2 | −2+2/ε² = 6, 0, −3/2 | positive iff ε<1 | none |
| Product-factor domination (364–365) | compact B with min Scal −10, F=S² | −10+2/ε²>0 iff ε<1/√5 | ε₀ exists | none |
| Concordance tails (384–391, 407–410) | ψ=t−1 near 0 | pullback of g₀+dt² is g₀+dt² | endpoint data exact | none |
| Non-collared restriction (411–415) | dt²+(1+t)g_round, f²=1+t | f′²=1/(4(1+t)), f″=−1/(4(1+t)^{3/2}): Scal=2/(1+t)+1/(2(1+t)²); t=0: 5/2, t=1: 9/8 | PSC but not product near ends | none |
| Slowed parameter (416–418) | dt²+(1+t/L)g_round | Scal=2/(1+t/L)+1/(2L²(1+t/L)²); correction O(L⁻²) | margin absorbs | none |
| Isotopy ⇒ concordance (402–404) | g_t=(1+3t)g_round | slice scalar ≥ ½ at t=1; L⁻² correction <¼ for L≥2 | consistent | none |
| Isometry groups (484–496) | round S¹, S², three points, S²⊔S², ℝⁿ | O(2) d=1; O(3) d=3=2·3/2; S₃ order 6, d=0; O(3)≀C₂; E(n) noncompact | compactness used; disconnected case covered | none |
| No small subgroups in O(2) (493–496) | rotation 2π/k, k=2,3,4,5 | subgroup contains rotation by π, 2π/3, π/2, 4π/5 ≥ π/2 | consistent | none |
| Frame evaluation injective (476–477) | reflection of S¹ fixing a point; swap of two spheres | derivative ±1 at the fixed point; permutation (12) | one frame per component plus permutation suffices | none |
| Myers–Steenrod Lean (95–112) | M=∅; M=S¹ | trivial group, d=0; O(2), d=1 | both allowed by the existential d | none |
| O'Neill / Hopf (517–523, 536–539) | S³→S²(½), ε=1, ε²=½ | |A|²=2 (ordered pairs); 8−2=6; 8−1=7 | unordered sum would give 7 at ε=1 | none |
| Product bundle (540) | A=0 | Scal=Scal_B+ε⁻²Scal_F | consistent | none |
| T²×S² (541–543) | flat+ε²g_round | 2/ε² for every ε | base positivity not needed | none |
| Conjugation on CP² (564–567) | z↦z̄ on ℂ³ | degree (−1)²=+1; real-linear isometry of S⁵ normalizing the circle | descends to a Fubini–Study isometry | none |
| Tube curvatures (587–590, 616–620) | point (k=0): S^(n−1)(r); line in ℝ³ | n−1 curvatures −1/r; cylinder −1/r and 0 | counts q−1 and k agree | none |
| Bending term (597–600, 621–625) | θ=π/2, k_γ=0; n=3, r=1, k_γ=1 | (n−1)(n−2)/r²; ordered: 2−4=−2, source coefficient would give 0 | README coefficient correct | Source issues |
| Model tube (623–625) | q=2,3 | (q−1)(q−2)/r² = 0, 2/r² | q≥3 necessary | none |
| Surgery hypothesis (629–633, 651–656) | K3×K3 with S⁰; S⁸ with S⁰ | α(K3×K3)=a²=4b≠0 persists on M#(S¹×S⁷); S¹×S⁷ round: 42 | starting PSC necessary and stated | none |
| Belt sphere (636–638, 659) | λ=k+1 | n−λ=q−1≥2 iff q≥3 | consistent | none |
| Connected sums (638–640, 656–658) | T²#T² | χ=−2, no PSC; connected sum needs n≥3 | consistent | none |
| Disjoint surgeries (687–688) | two tubes | each result equals g off its tube | commute | none |
| Normal bundles over S¹ (729–731) | n≥3 | π₀SO(n)=0; π₁SO(n)=ℤ/2 | two framings, one Spin-compatible | none |
| Normal bundle of S² (732–734) | n≥5 | π₁SO(n−1)=ℤ/2 detected by w₂; w(TS²)=1 | w₂(W)[S²] | none |
| Nonspin detector (735–736) | M=CP²×S² | w₂(CP²)[CP¹]=3≡1 | sphere CP¹×pt detects | none |
| Hurewicz step (749) | M→W 2-connected, M simply connected | π₁(W)=0; H₂(W,M)=0 | consistent | none |
| Cylinder control (781–784) | (S¹×S⁴)×[0,1]; S⁵×[0,1] | π₁=ℤ excluded; empty decomposition | consistent | none |
| Whitney dimensions (753–762, 785–787) | n=5; n=6 | (2,3) in V⁵; (2,4) in V⁶, circle codim 5 | Milnor 6.4: λ+1=3≤n_W−3 for n_W≥6 | none |
| Dual indices (788–792) | λ≥3 | μ=n+1−λ≤n−2; codim n−μ+1≥3; a 2-handle would dualize to codim 2 | consistent | none |
| Empty incoming boundary (801–802, 818–820) | N=∅ | remove a ball: bordism from round S^n | consistent | none |
| PSC bordism groups (843–848) | degrees 1, 2, 4; Ω₅^SO | circle Scal 0; torus no PSC; Â(K3)=2 detects ℤ; P(1,2) generates ℤ/2 | consistent | R02 (third Check) |
| Product law (837) | [S²]·[T²] | 2+0=2 | ideal, not only subgroup | R02 |
| α and Â (862–867, 880–887) | K3; K3×K3; dimension 8k+4 | α=a, Â=2, r=1; a²=4b, Â=4; c(a)=2u², c(b)=u⁴ ⇒ Â=2r | consistent | none |
| Spin circle (885–886) | periodic S¹ | α=η, η²≠0, η³=0 | consistent | none |
| Classification dimensions (911–918) | 5, 6, 7; CP³; CP⁴; Spin 9-manifold | KO₅=KO₆=KO₇=0; c₁(CP³)=4 Spin, Scal 48; c₁(CP⁴)=5 nonspin, Scal 80; α=ηb with Â=0 | integral statement needed | none |
| bP spheres (941–943) | Σ∈bP_(n+1) | Spin nullbordant: α=0 | consistent | none |
| Moore carrier (969–972) | M₆=cofib(2) | H̃₆=ℤ/2, cells 6 and 7 | consistent | none |
| a₁=Eσ‴ (1017–1018) | 2ι₆∘a₁ | right-distributive on a suspension: 2a₁=E(2σ‴)=0 | consistent | none |
| Bracket representative (1019–1021, 1036–1038) | (2σ″)∘η₁₃ | =2(σ″∘η₁₃)=σ″∘(2η₁₃)=0 since 2η₁₃=0 | zero representative exists | none |
| σ₂ normalization (1181–1195, 1109–1110) | σ generator of ℤ/240 | 225≡1 mod 16, ≡0 mod 15; σ₂=225σ order 16; 2σ₂=210σ order 8; 4σ₂=180σ order 4; 8σ₂=120σ order 2 | matches orders of σ′, σ″, σ‴ | R04 (sign of σ only) |
| Unprojected relation (1008–1009, 1120–1121) | 2Eσ₈ in ℤ/240 | order 120 ≠ order of E²σ′ (divides 8) | false unprojected, true 2-primary | none |
| Integral π₁₄(S⁶) (1021–1024) | ℤ/8⊕ℤ/2⊕ℤ/3 | order 48; 2-part 16, 3-part 3 | agrees with kmnst line 469 | none |
| Indeterminacy (1030–1036) | 2π₁₄(S⁶) | ℤ/4{2ν̄₆}⊕0⊕ℤ/3, order 12; (2ι₆)∘x=2x+[ι₆,ι₆]H(x) with H(ν̄₆)=ν₁₁, H(ε₆)=0 | full subgroup identified, odd part retained | none |
| Adams bracket formula (1060–1066, 1113–1117) | q=2, e=½; q=3, e=⅓ | −2·¼=½; −3·(1/9)=−⅓≡⅔, wrong sign gives ⅓ | sign visible only off (½)ℤ/ℤ | none |
| e_C(ν) control (1113–1117) | ν, 8ν | 1/12 ⇒ e_C(8ν)=⅔; −⅔≡⅓≠⅔ | discriminating Check (value from Adams 7.14/7.17; OCR of that page unreadable, standard value) | none |
| μ order (1066–1067, 1111–1112) | e_C(120σ) | 120·(±1/240)=±½≡½ | order exactly 2 | none |
| Arf obstruction (1079–1081) | Σ_(8j+1)×S¹, j≥1 | H_(4j+1)(Σ×S¹;ℤ/2)=0 since 4j+1∉{0,1,8j+1,8j+2} | Arf=0 | none |
| Realization (1075–1078) | P_(8j+1) | odd Kervaire–Milnor group 0 | coker J→Θ surjective | none |
| J image (1083–1087) | n=9, 10 | π₈SO=π₉SO=ℤ/2 ≠ 0 | §8.3 inapplicable, §8.2 used | none |
| Hitchin headline (Lean 121–132) | j=1 | d=9, 10; round S⁹ Scal 72 | standard structure has PSC, found one is exotic | none |
| HP^k Pontryagin (1125–1128, 1153–1156) | k=1, 2 | (1+4u)(1−4u)≡1, p₁=0, Newton 0; (1+6u+15u²)(1−4u+16u²)=1+2u+7u², 4−14=−10=6−16 | consistent | none |
| Dold scalar (1145–1147, 1157–1160) | P(1,2), P(1,0), P(2,0) | 0+24=24; 0; 2 | positivity iff a≥2 or b≥1 | none |
| Dold w-classes (1135–1137, 1161–1162) | (1+c)(1+c+d)³ mod (c², d³) | =1+d+cd+d²: w₂=d, w₃=cd, w₂w₃=cd², degree 5 | generates Ω₅^SO=ℤ/2 | none |
| Torus α and Gauss–Bonnet (1166–1173, 1199–1201) | one antiperiodic direction; both periodic | η·0=0; η²≠0; ∫K=2πχ=0 excludes PSC | index-zero counterexample | none |
| Bounded transform (1181–1183, 1202–1203) | δ=4, 8 | D²≥1, 2; F²≥½, ⅔ | monotone x/(1+x) | none |
| Uniform family gap (1175–1176) | g_t=(1+t)g_round; g_c=c·g_round, c unbounded | 2/(1+t)≥1; 2/c→0 | compact parameter space needed and stated | none |
| Dropped binders (Lean 52–54, 95–102) | `SmoothMetric`; Myers–Steenrod | native carrier needs neither; `EMetricSpace` gives T2 | harmless | none |

**Declared gaps:** none declared; no undeclared gap found (every supplier citation resolves to an existing passage).

## Not verifiable

- **Toda, *Composition Methods in Homotopy Groups of Spheres* (1962), Lemmas 5.13–5.14, Proposition 5.15, Corollary 3.7, the EHP and π₁₄(S⁶) tables.** The sources service resolves the citation only to a paywalled page (recorded `uncertified` in a scratch copy of the manifest; the board manifest has no entry for it). The relations are corroborated by `adams line 1846–1848` (Corollary 3.7), `kmnst line 469–471` and `cs13 line 317–319`, not certified at Toda's pages.
- **Lawson–Michelsohn, *Spin Geometry* (1989).** No legal copy found by the service; listed in `needs-references.toml` (key `lawson-michelsohn`). The Clifford/Dirac conventions were checked against SpinGeometry G5–G6 instead.
- **Stolz, *Simply connected manifolds of positive scalar curvature* (1992), Theorem A.** JSTOR landing page only; its statement is read from `stolz22 line 155–157`.
- **Kobayashi, *Transformation Groups in Differential Geometry*, Ch. II §1.** Settled as uncertified in the manifest; cited by locator.
- **Adams, Proposition 7.14 and Example 7.17 (printed pp. 44–45).** The statement line and the page with the numerical values are OCR-illegible and no PDF renderer is available on this worker; the Check's e_C(ν)=1/12, e′_R(ν)=1/24 are the standard values and were not read off the page.
- **Crowley–Schick journal pagination.** Checked as arXiv:1204.6474v4 (the manifest's version); journal page numbers not assumed.
- Neither the board manifest nor any pull-request file was changed; no source text was copied anywhere.

## Source issues

- **Error** in gl80 at formulas (1) and (1′), printed pp. 427 and 429: the source gives the mixed principal-curvature term the coefficient (n−1)k (respectively (q−1)k) while its sphere term (n−1)(n−2) sums ordered pairs; it should be 2(n−1)k (respectively 2(q−1)k); affects the proof.
- **Error** in gl80 at the Dold-manifold paragraph of the proof of Corollary C, printed p. 433: the source says the quotient of the product metric has positive sectional curvature; it should be nonnegative, with zero mixed planes, and positive scalar curvature; affects a stated result.
- **Misprint** in cs13 at §2.3, Lemma 2.14's recollection of Toda brackets, arXiv v4 p. 8: the source says the bracket of u, v, w lands in maps S^(a+1)→S^c and writes the indeterminacy with the compositions reversed; it should land in [S^(a+1),S^d] with indeterminacy w∘π_(a+1)(S^c)+π_(b+1)(S^d)∘Eu; affects nothing.
