# Review of GaussianIsoperimetryAndClusters (design, round 2)

**Verdict:** needs changes

Eight findings, seven blocking (three P1, four P2). This is a repairable design, not a rejected scope. The seven earlier findings are repaired. The additional failures below arise from endpoint/representative conventions, the actual library pins, and the local build order. No design, plan, source-manifest or library file was changed by this review.

## Verification of the earlier repairs

Locations in this table are in `packages/GaussianIsoperimetryAndClusters/design/README.md`; the corresponding plan entries were also read.

| Earlier finding | Disposition and repaired passage | Independent verification |
|---|---|---|
| F01 | Repaired, lines 493, 498: “`0.517483`” | Simpson integration after `z = sin θ` gives `0.5174833242304743`; bounds `0.384633 < 0.517483 < 0.606531` remain correct. |
| F02 | Repaired, line 585: “the right side is `0.647406`” | `2∫₀¹ √(I(x²)²+4x²)φ(x) dx = 0.6474055420901177`; mean `0.5160585509617134`, profile `0.3986190357812805`. |
| F03 | Repaired, line 274: “Half-planes `{x < t}` alone would not prove finiteness of the profile.” | Integrating out `x` gives total mass `cπ^(3/2)`; the line `x=0` has infinite weighted length, whereas each line `x=±a`, `a>0`, has finite length. The mass-half symmetric slab exists by continuity. |
| F04 | Repaired, line 229: “For `q ≥ 3`, replacing two cells” | Three successive intervals merge to two cells; perimeter drops from `φ(a)+φ(b)` to `φ(b)`. A two-cell tuple would merge to one cell, outside §3.1. The different one-cell problem in Layer 4 is R03. |
| F05 | Repaired, line 590: “for `L ≥ 0`”; line 597: “`L = 0`: `f` is a constant `c`” | The one-sided hypothesis forces `c≤m`, giving tail probability `0`; both median hypotheses force `c=m`, again giving `0`. This covers §8.5 with `S=0`. |
| F06 | Repaired, line 104: “sharpens by the factor `½`”; line 590: “without the factor `½`, supplied by §1.2” | CianchiFuscoMaggiPratelli2011 line 295 gives the strict Mills bound. Ledoux1999 line 226 gives the weaker exponential constant. The displayed derivative proves the sharper constant here. |
| F07 | Repaired: the commit sentences are absent from lines 40–59; line 55 starts “Tau Ceti at the pin” | No baseline commit hash remains in the README. Its new claim about absence of BV/perimeter is false at the supplied pin, addressed in R04. The earlier repair's correction about external-repository hashes does not affect this disposition. |

No finding was marked “not actionable in this package”. None below reopens a settled non-actionable finding. Pattern searches covered the old numerical values, merging, zero Lipschitz constants, endpoint quantiles, null representatives and the tail constant throughout both design files.

## R01 (P1) — Null symmetrals need equality almost everywhere

**Location:** `packages/GaussianIsoperimetryAndClusters/design/README.md:440`: “null sets go to `∅` and conull sets to `E`”; also `packages/GaussianIsoperimetryAndClusters/design/plan.json:1134`.

**Claim:** These are literal equalities for the sectionwise definition in §6.1.

**Witness:** In `ℝ²`, take `F=ℝe₂`, `u=e₂`, `U=F`. Then `γ₂(U)=0`, but `v_U(0)=1`, `v_U(z)=0` for `z≠0`, and `S_e₂(U)=U≠∅`. Its complement is conull and fixed, not all of `ℝ²`.

**Repair:** State `S(U)=∅` almost everywhere for ambient-null `U`, and `S(U)=E` almost everywhere for ambient-conull `U`. Keep literal identities for `U=∅` and `U=E`, or require every fibre to have measure zero/one. Add the vertical-line and its complement as discriminating Checks. Apply the qualification in the plan API too. On this witness both repaired assertions give ambient measure `0` for the symmetric difference, exactly as required; no representative selection is necessary.

## R02 (P1) — Constant subgraphs use an invalid endpoint quantile formula

**Location:** `packages/GaussianIsoperimetryAndClusters/design/README.md:579`: “For `f` constant `c`, `A_f = E × (−∞, Φ⁻¹(c))`”; also `packages/GaussianIsoperimetryAndClusters/design/plan.json:1582`. The quantile contract at README line 59 also overstates its endpoint behaviour for general laws.

**Claim:** The constant-subgraph identity applies to all `c∈[0,1]`.

**Witness:** At `c=0`, `A_f=∅`, of Gaussian measure `0`. The standard Gaussian's native quantile at zero is `0`, so the asserted right side has measure `Φ(0)=1/2`. At `c=1`, the analogous values are `1` and `1/2`.

**Repair:** Require `0<c<1` for the half-space formula; retain `A_0=∅`, `A_1=E×ℝ` separately, as already stated at line 578. Add both endpoint Checks and synchronize the plan. In the supplier contract say that the general quantile is junk at `t≤0` and `t>1`; at `t=1` it can be the finite right endpoint. For the standard Gaussian it is indeed `0` there. `TauCeti/Probability/Quantile.lean:164` defines the infimum; lines 209 and 216 prove the outside-range rules. For a Dirac law at `2`, the level-one set is `[2,∞)` and its quantile is `2`, not `0`. The repaired interior formula gives measure `c` and the two endpoint clauses give `0,1`, resolving both contradictions.

## R03 (P1) — One-cell conventions contradict positivity and the cluster carrier

**Location:** `packages/GaussianIsoperimetryAndClusters/design/README.md:296`: “the canonical model lives … for every `q ≥ 1`”; line 346: “`I_m^{(q−1)}(v) > 0` on `int Δ^{(q−1)}`”. `packages/GaussianIsoperimetryAndClusters/design/plan.json:840` explicitly allows `q≥1`, and line 865 asserts positivity.

**Claim:** The positive model-profile API includes the one-cell model; §4.1 also calls its one-cell tuple a cluster although §3.1 requires `q≥2`.

**Witness:** For `q=1`, `int Δ⁽⁰⁾={(1)}` in its relative topology, and §4.4 defines `I_m⁽⁰⁾(1)=0`. Positivity becomes `0>0`. The tuple `({0})` has one cell, so fails §3.1's carrier restriction.

**Repair:** Restrict the cluster/interface API and positive-profile theorem to `q≥2`. Retain `I_m⁽⁰⁾(1)=0` as an explicit boundary convention, without asserting it is a §3.1 cluster. Alternatively extend the cluster definition consistently to `q≥1`, but positivity must still require `q≥2`. State the general-weight convention `I_μ⁽⁰⁾(1)=0` needed by the singleton-support padding API at line 266 (line 262 currently defines only the Gaussian notation). Restrict the standardized-coordinate Check at line 118 to `q≥2`: at `q=1`, its variance is `0`, not `1`, and `q/(q−1)` divides by zero. Keep the zero-dimensional product law separate from codimension-one Hausdorff measures. Add the one-cell value and law as negative controls. This preserves the face identity `I_m⁽²⁾(1,0,0)=0` and the positive two-cell value `I_m⁽¹⁾(1/2,1/2)=0.398942`.

## R04 (P2) — Reuse the Gaussian and BV APIs actually present at the pins

**Location:** `packages/GaussianIsoperimetryAndClusters/design/README.md:113`: “Prove … the orthogonal projection onto `F` carries `γ_E` to `γ_F` … and … `γ_E = e^{−W} · volume`”; line 55: “contains no weighted or Euclidean perimeter, no BV theory”. Also §1.1's inverse laws at line 89 and the supplier contracts at lines 57–75.

**Claim:** Intrinsic Gaussian density and projection need construction here, the inverse laws need a roadmap supplier, and Tau Ceti lacks Euclidean perimeter/BV.

**Witness:** `TauCeti/Probability/Distributions/Gaussian/Density.lean:178` proves intrinsic density; `Gaussian/Projection.lean:47` proves the projection law; `TauCeti/Probability/Quantile.lean:340,359` proves both inverses. `TauCeti/Analysis/BoundedVariation/Perimeter.lean:64` defines Euclidean perimeter.

**Repair:** Delete the already-proved density and projection assertions as owned targets, and cite `TauCeti.Probability.stdGaussian_eq_withDensity_norm` and `Submodule.map_orthogonalProjectionOnto_stdGaussian` in Scope and the Tau Ceti contract. Consume `TauCeti.Probability.map_orthogonalProjectionOnto_stdGaussian_pi` (`Gaussian/Projection.lean:94`) for the product law; keep only any genuinely missing addition-map comparison, with its distinction stated. Import `MeasureTheory.Measure.cdf_quantile` and `MeasureTheory.Measure.quantile_cdf`, with continuity/strict-monotonicity and interior-level hypotheses, rather than planning their Gaussian specializations again. The `I` definition and its new calculus remain targets.

Refresh the Euclidean supplier floor using `TauCeti.totalVariationOn` (`Analysis/BoundedVariation/TotalVariation.lean:100`), `TauCeti.perimeter`, and `TauCeti.reducedBoundary`/`outerNormal` (`Analysis/BoundedVariation/ReducedBoundary.lean:95,106`); retain named GeometricMeasureTheory contracts for the missing parts. In particular, do **not** replace weighted perimeter by `TauCeti.perimeter γ`: its duality at `Perimeter.lean:73` uses ordinary divergence, not `div_γ`. On `E=ℝ` that substitution gives `√(2/π)=0.797885` for the whole space instead of zero, exactly the roadmap's negative control.

The provided manifest pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`; the plan's baseline records older revisions. Reconcile the baseline and declaration locators against those actual pins. For example the CDF formula is now at `Gaussian/Cdf.lean:148`, the quantile definition at `Probability/Quantile.lean:164`, and the error-function continuity/strict monotonicity at `Analysis/SpecialFunctions/Erf.lean:115,142`. All existing cited names were found; this is duplication and stale supplier description, not a nonexistent-name claim.

**Repair test:** On `F={0}`, the imported projection law gives `δ₀`; on the rotated line `ℝ(e₁+e₂)/√2`, it gives variance `1`. The density theorem gives `(2π)⁻¹` at the origin of `ℝ²`, and the inverse laws give `Φ(Q(1/2))=1/2`, `Q(Φ(1))=1`. These are exactly the intended objects and normalizations.

## R05 (P3) — The superlevel negative control computes the wrong measure

**Location:** `packages/GaussianIsoperimetryAndClusters/design/README.md:446`: “`{⟨x, e⟩ > −a}`, which has measure `1 − Φ(a)`”.

**Claim:** Reflecting the lower half-space to the upper half-space with threshold `−a` changes its Gaussian measure to `1−Φ(a)`.

**Witness:** At `a=1`, `γ{x₁>−1}=1−Φ(−1)=Φ(1)=0.841345`, not `0.158655`. README line 635 already gives the correct same-measure reflection.

**Repair:** Either keep the reflected threshold `−a` and test failure of literal fixedness, with unchanged measure `Φ(a)`, or change the wrong-model threshold to `a` to test the measure `1−Φ(a)`. Prefer recording both distinctly. At `a=1`, the reflected set differs but has measure `0.841345`; the incorrectly unreflected superlevel set has measure `0.158655`. Do not change the correct symmetral definition.

## R06 (P2) — Separate the merging API from its later interface proof

**Location:** `packages/GaussianIsoperimetryAndClusters/design/README.md:233`: “`§3.2 for the merging bullet`”; line 243 makes §3.2 depend on §3.1. `packages/GaussianIsoperimetryAndClusters/design/plan.json:482` already promises the exact decrement `A_ij` in target 3.1.

**Claim:** Whole target 3.1, including its interface-area formula, can precede target 3.2.

**Witness:** The README's target graph has edges `3.1→3.2` and `3.2→3.1`. The plan omits the first edge although its 3.1 API mentions `A_ij`, which is only defined in 3.2. This cycle is local, beyond the roadmap-level gate.

**Repair:** Keep the cluster definition in 3.1. Move the exact merging decrement to 3.2 after defining interfaces and proving their decomposition. Either move the whole merging theorem there or prove only the weak nonincrease in 3.1 directly from variation subadditivity. Remove the forward Needs edge and synchronize the plan. The repaired order is `cluster definition → interfaces/decomposition → exact decrement`; for the interval cluster with `a=0,b=1`, `0.640913−0.398942=0.241971`, as before.

## R07 (P2) — Centre scaling must have a positive factor

**Location:** `packages/GaussianIsoperimetryAndClusters/design/README.md:320`: “the cluster is unchanged by scaling the centres about the circumcentre”; the corresponding API is in plan target 4.2.

**Claim:** Scaling preserves the labelled Voronoi cluster without specifying the scale.

**Witness:** In `ℝ`, centres `p₁=−1,p₂=1` have first cell `(-∞,0)`. Scale `−1` about zero gives first cell `(0,∞)`; scale `0` gives two coincident centres and both strict Voronoi cells empty.

**Repair:** State scaling by a real factor `λ>0`, with centres `c+λ(p_i−c)`. Add `λ=0` and `λ=−1` as negative controls in README and plan. For these centres any `λ>0` leaves the first-cell inequality `4λy<0`, hence `y<0`, unchanged; the two excluded values give exactly the failures above.

## R08 (P2) — The plan drops the model-interface null-set qualification

**Location:** `packages/GaussianIsoperimetryAndClusters/design/plan.json:702`: “with interfaces `x + Σ^m_ij`”. The corresponding README claim at `packages/GaussianIsoperimetryAndClusters/design/README.md:302` correctly says “up to `μHE[q−2]`-null sets”.

**Claim:** The closed model interface of 4.1 is literally the reduced-boundary interface of 3.2.

**Witness:** For the centred `q=3` tripod, the origin belongs to every closed model ray `Σ^m_ij`. Each cell has density `1/3` there, and its normalized derivative-measure average has norm `√3/2<1`; thus the origin belongs to no reduced-boundary interface.

**Repair:** Copy the README's almost-everywhere qualification into the plan API, explicitly distinguishing the closed polyhedral faces from the reduced-boundary interfaces. Add the tripod origin as a negative-control Check. The two sets then differ only at the origin, whose `μHE[1]` measure is `0`, and their Gaussian interface areas remain `1/(2√(2π))=0.199471`. The existing area and differential formulas need no change.

## Verified sound

**Scope and review coverage.** Read all nine layers, 46 plan targets (10 definitions, 36 theorem targets), their APIs and 127 plan Checks. Read the complete earlier review and repair report. Freshly reviewed every repaired passage, all 15 sampled targets, the endpoint and convention patterns above, and the headlines. For untouched material, the earlier review's *computed* rows were used as permitted: in particular §§2.1–2.3, 3.2–3.3, 5.1–5.3, 6.3–6.5, 7.1–7.4 and 9.1–9.3. Its bare “holds” rows were not treated as evidence: the local-comparison, separation, enlargement and subgraph arguments were reread directly. Fresh counterexamples supersede earlier favourable rows for 4.4 and 6.1.

The weighted extension remains general for positive `C¹` densities, and the probability assumption is explicit for minimizing-cluster existence. Multiplying a `C¹` test field by `e^(−W)` is `C¹`; local upper/lower density bounds and finite-mass tails justify the extension of the source's smooth-weight compactness argument. The whole-space versus local perimeter distinction is maintained. Gaussian dimension zero is not used for hypersurface measures; the inconsistent one-cell extension is isolated in R03. Multi-bubble regularity and the reverse inequality for `q≥3` are explicitly outside this roadmap, with a Part II direction; they are not hidden prerequisites of the single-bubble proof. No copied source passage, computational algorithm, route-specific shortcut, re-planning of an existing roadmap, sorry'd data or `set_option` was found.

**Source sample.** Read the manifest's version notes before comparing numbering. Milman–Neeman locators below are arXiv v3's printed pages, not Annals pagination; Cianchi–Fusco–Maggi–Pratelli locators are the recorded cvgmt preprint. No new source was required or fetched. Every named work has its existing manifest key.

| Sampled target | Text opened, locator and printed page | Support and qualifications |
|---|---|---|
| 1.2 Gaussian tails | CianchiFuscoMaggiPratelli2011 line 295, Lemma 3.4 (3.2), p.7; Ledoux1999 line 226, (1.6), p.127 | Strict Mills inequality for `r>0`; exponential bound without `1/2`. The sharper factor is correctly proved here after F06. |
| 1.3 Splitting/density | MilmanNeeman2022 lines 481–497, §2 and (2.1), p.11; Ledoux1993 lines 251–252, p.350 | Product/rotation reduction and coordinate variances agree. Source §2 assumes `q≥2`. Native projection and intrinsic density supersede proposed targets (R04); one-cell coordinate Check needs R03. |
| 2.4 LSC/compactness | CianchiFuscoMaggiPratelli2011 lines 209–213, p.5; MilmanNeeman2022 lines 939–947, proof of 4.1(i), p.22 | Local indicator convergence and finite-mass global compactness. The roadmap's test-field proof also covers functions and `C¹` weights. |
| 2.5 Gauss–Green | MilmanNeeman2022 lines 705–708, (3.1), p.16; lines 758–761, (3.3), p.17; translation computation lines 518–527, pp.11–12 | Compactly supported `C¹` fields and locally finite perimeter. The stated integrability/cutoff conditions justify the noncompact extension; sign agrees with outward normal. Maggi theorem text unavailable. |
| 2.6 Weighted coarea | Maggi2012 lines 78–79, 98–101, TOC pp.ix–x: §13.1 p.145; §§18.1–18.3 pp.215,223,225 | Only section titles/pages readable. Mathematical reduction to the exact G2/G4 weighted/coarea supplier contracts checked; no claim to have certified the book's theorem text. |
| 3.4 Profiles | MilmanNeeman2022 lines 169–170, p.4; lines 909–910, p.21; lines 948–949, p.22 | Infimum/minimizer definitions. The roadmap supplies its own general-density finite competitor via annuli; repaired half-plane example agrees. |
| 3.5 Existence | MilmanNeeman2022 lines 918–956, Theorem 4.1(i), pp.21–22 | Probability density, prescribed simplex vector, attainment. Its proof needs compactness and LSC, not regularity parts (ii)–(v); extension to `C¹` is justified. |
| 4.3 Measure map | MilmanNeeman2022 lines 506–543, Lemma 2.1, pp.11–12 | Smooth bijection and derivative `−L_A/√2`. Read rendered p.11 as well. The roadmap's maximal-coordinate argument correctly repairs tied maxima in the source's proof. |
| 4.4 Model profile | MilmanNeeman2022 lines 548–556, Definition 2.2, p.12 | Sum at the inverse measure-map parameter and isometric/cylinder transport. Source separately defines `I_m⁽⁰⁾(1)=0`; it does not support positivity at `q=1`. |
| 4.5 Boundary behaviour | MilmanNeeman2022 lines 558–659, Lemma 2.3, pp.12–15 | Smooth interior profile, continuous extension, smaller-face identity. Read the proof and rendered p.14; the minimum/sign slips there are recorded below. |
| 4.6 Differential identities | MilmanNeeman2022 lines 669–695, Proposition 2.4, pp.15–16; lines 200–207, p.5 | Gradient, inverse interface Hessian and trace normalization agree. Tangential boundary terms cancel by the three conormals. For `q=2`, compute directly on the line rather than invoke Gauss–Green in a zero-dimensional hyperplane. |
| 4.7 Easy inequality | MilmanNeeman2022 lines 660–666, p.15 | All simplex vectors and `n≥q−1`, including trivial one-cell padding on faces. |
| 6.2 Slicing | CianchiFuscoMaggiPratelli2011 lines 527–542, Theorem 4.2 and (4.1), p.11 | Locally finite perimeter, `n≥2`, almost-everywhere reduced-boundary/normal comparison and projection Jacobian. Zero-normal projection is null by the same area formula. AFP and Maggi texts remain locator-only. |
| 8.5 Gaussian maxima | Ledoux1999 lines 252–271, derivation of (1.8), pp.128–129 | The numbered conclusion uses the weaker exponential tail; the preceding enlargement argument retains `1−Φ(r)`. The roadmap gives that argument via 8.4, with nonempty finite index set and row norm `√S_ii`. |
| 9.4 Convex closed symmetrals | Ehrhard1983 lines 367–369, Theorem 3.1, p.292; lines 350–355, Corollary 2.3, p.291; lines 440–457, pp.294–295 | Convexity for closed (also open) sets and composition into two-dimensional symmetrals. The stated shared-direction orthogonal-complement hypothesis matches the composition used. |

The flagged locator-only sources were assessed together: Maggi's extract does not contain the quoted chapters; the five manifest entries expressly settled as uncertified stay settled; Bobkov's cached PDF remains unreadable even on rendering. See Not verifiable. Read Ledoux1999 lines 296–313 as the available functional-inequality/converse source. This is not a new missing-reference request.

**Computed adversarial table.** Values are fresh analytic calculations, with numerical integrals independently recomputed using the standard normal CDF/inverse and composite Simpson quadrature. The table covers the sample, headlines, all repair targets and each new finding. The untouched targets with earlier computed evidence are accounted for above, rather than duplicating the entire earlier ledger.

| Statement | Instances tried | Values on the two sides / discriminating computation | Result; change |
|---|---|---|---|
| Conventions, divergence sign | `U=(-∞,0)`, compact test field `X(0)=1` | `∫_U (X′−tX)φ = φ(0)=0.398942`; boundary side `(+1)φ(0)=0.398942`; inward normal gives `−0.398942` | Correct |
| 1.1 profile and inverse | `v=1/2`; endpoints | `I(1/2)=φ(0)=0.398942`; `I(0)=I(1)=0`, whereas `φ(Q(0))=0.398942` | Correct profile; R02 prevents endpoint inverse misuse; R04 imports existing inverses |
| 1.2 tails | `r=0,0.5,1,2` | Tail `0.5,0.308538,0.158655,0.022750`; half-exponential `0.5,0.441248,0.303265,0.067668`; Mills at positive radii `0.704131,0.241971,0.026995` | Correct; equality only at zero in exponential bound |
| 1.3 Gaussian splitting | Rotated line in `ℝ²`; `F=0`; `q=1` | Rotated coordinate variance `(1+1)/2=1`, threshold probability `Φ(1)=0.841345`; zero projection law `δ₀`; one-cell coordinate variance `0≠1`; origin density `1/(2π)=0.159155` | Correct positive-dimensional splitting; R03, R04 |
| 2.1 native-versus-weighted perimeter | `U=ℝ`, Gaussian density | Ordinary-divergence supremum `∫|t|φ=2φ(0)=0.797885`; corrected weighted divergence gives `0` | Weighted object genuinely new; R04 must not identify it with native `perimeter γ` |
| 2.4 compactness/LSC | `(k,k+1)` under Lebesgue measure; collapsing-gap intervals under Gaussian | Distinct far intervals have `L¹` distance `2`, perimeter `2`; gap example limit perimeter `φ(1)+φ(2)=0.295962`, liminf `3φ(1)+φ(2)=0.779903` | Finite-mass requirement and inequality direction correct |
| 2.5 Gauss–Green/translation | `U={x₁<1}`, `w=e₁`; `U=E` | Translation derivative `Φ′(1)=0.241971`, boundary integral `0.241971`; whole-space sides `−E[X₁]=0` and `0` | Correct |
| 2.6 both coarea forms | `f=‖x‖` on `ℝ²`; `u(t)=t` on line | `∫‖∇f‖dγ=1=∫₀∞ r exp(−r²/2)dr`; `∫φ d|Du|=1=∫Pγ((s,∞))ds` | Correct normalization |
| 3.1 merging | Three intervals cut at `0,1`; two-cell attempted merge | Perimeter `φ(0)+φ(1)=0.640913`; merged `φ(1)=0.241971`; decrement `0.398942=A₁₂`; two cells merge to one | F04 correct; R06 orders the exact formula after interfaces |
| 3.4 finite competitors | `ρ=c(1+y²)exp(−x²(1+y²)⁴)` | Total mass `c√π∫(1+y²)⁻¹dy=cπ^(3/2)`; `P{x<0}=∞`; `P{|x|<a}=2c∫(1+y²)e^(−a²(1+y²)⁴)dy<∞` for `a>0` | Repaired F03 correct |
| 3.5 existence | Gaussian measure vectors `(1,0)` and `(1/2,1/2)` | Competitor/minimum values `0=0` and `φ(0)=0.398942=I(1/2)`; cell measures sum `1` | Correct, including empty cells |
| 4.1–4.4 one-cell model | `q=1`, `v=(1)` | Relative interior contains `(1)`; interface sum `Σ∅=0=I_m⁽⁰⁾(1)`; positivity asks `0>0`; tuple length `1<2` | R03 |
| 4.1 interfaces | Centred three-sector tripod | Closed ray contains origin; reduced-boundary interface does not: cell density `1/3`, polar-average norm `√3/2<1`; difference has `H¹` measure `0`; both areas `0.199471` | R08: restore a.e. qualification in plan |
| 4.2 scaling | Centres `−1,1`; factors `2,−1,0` | First-cell tests `8y<0`, `−4y<0`, `0<0`; sets `y<0`, `y>0`, `∅` respectively | R07: require positive factor |
| 4.3 derivative | `q=2`, `x=0.7u`; symmetric `q=3` | `dΨ₁/dt=−φ(0.7)=−0.312254`; matrix formula same. At `q=3`, `L_A=0.598413 Id`, `DΨ=−0.423142 Id` | Correct |
| 4.3 tied maxima | `x=0`, `y=(1,1,−2)` | No coordinate is uniquely maximal, so `y∉⋃Ω_i`; `z=(1,0,−1)` satisfies `z∈Ω₁`, while `z−y=(0,−1,1)∉Ω₁` | Strict inclusion argument works; source's open-cell step fails |
| 4.4 transport/inverse | `q=2`, `v=(Φ(1),1−Φ(1))`; `q=3` centre | Correct perimeter `φ(1)=0.241971`; replacing inverse parameter by centred volume gives `φ(0.482734)=0.355065`; tripod value `3/(2√(2π))=0.598413` | Correct for `q≥2`; R03 handles zero-bubble exception |
| 4.5 face limits | `q=2`, `t→∞`; `q=3`, `(1/2,1/2,0)` | `Ψ(tu)→(0,1)`, `φ(t)→0=I_m⁽⁰⁾(1)`; edge value `I_m⁽¹⁾(1/2,1/2)=0.398942` | Correct |
| 4.6 Hessian and trace | `q=2` at half mass; `q=3` centre | Line Hessian `−1/(2φ(0))=−1.253314`; inverse negative trace `2φ(0)=0.797885`. Tripod Hessian `−1.671086 Id`; negative inverse trace `1.196827=2×0.598413` | Correct signs and factors |
| 4.7 easy inequality | Two-cell half mass; tripod; excluded `n=1,q=3` | Competitor bounds `I⁽¹⁾≤0.398942`, `I⁽²⁾≤0.598413`; three intervals in line give `0.727200>0.598413` | Correct dimension restriction; last value alone is not a proof of the line's optimal value |
| 6.1 null representatives | Vertical line and complement in `ℝ²` | Section values of line `1` at `0`, `0` elsewhere; `S(line)=line`, not `∅`; both have ambient measure `0`; complement fixed of measure `1` | R01 |
| 6.1 reflection Check | `a=1` | `γ{x>−1}=0.841345`; printed `1−Φ(1)=0.158655`; literal fixed set is `x<1` | R05 |
| 6.2 projection area | Boundary `x₂=x₁`, over `0≤x₁≤1`; vertical boundary | Length `√2` times normal factor `1/√2` equals `1`, same as fibre count integral `1`; vertical normal component `0`, projected singleton measure `0` | Correct; reciprocal would give `2` |
| 6.6 symmetral perimeter | Unit disc, vertical symmetrisation | Original `e^(−1/2)=0.606531`; symmetral integral `0.5174833242`; optimal half-space `0.384633` | F01 repaired, strict decrease consistent |
| 7.1–7.3 minimizers/equality | Half-space; disc; empty set; null-modified half-space | Half-space `P=I=0.398942`; disc `0.606531>0.384633`; empty set `0=0`; adding rationals changes neither side | Correct equality modulo null sets and endpoint disjunct |
| 7.4 two-cell profile | `(1/2,1/2)`; `(1,0)` | `I⁽¹⁾=I_m⁽¹⁾=I(1/2)=0.398942`; at vertex all `0` and `(E,∅)` is not simplicial | Correct interior-only rigidity |
| 8.1 enlargement | Unit disc, radius `1`; half-space; zero covariance | Disc enlarged measure `1−e^(−2)=0.864665≥Φ(0.729711)=0.767217`; half-space both sides `Φ(a+r)`; Dirac case `1≥Φ(a+r)` | Correct; open radius-zero excluded |
| 8.2 Minkowski content | Half-space at `1`; `ℚ²` | Half-space derivative `φ(1)=I(Φ(1))=0.241971`; dense null set quotient `1/r→∞`, right side `I(0)=0` | Correct |
| 8.3 subgraphs/endpoints | Constants `0,1,1/2` | Actual measures `0,1,1/2`; totalized-quantile formula gives `1/2,1/2,1/2` | R02 |
| 8.3 Bobkov | `Φ(x)`, `Φ(2x)`; `min(x²,1)` | Affine-CDF cases both sides `1/√(2π)=0.398942`; clipped square `I(0.516058551)=0.398619036<0.647405542` | F02 repaired; profile term necessary for constant `1/2` |
| 8.3 converse | `A=(-∞,0]`, `f_r=max(0,1−d_A/r)` | Gradient integral `(Φ(r)−1/2)/r→φ(0)=0.398942`; profile term integral→`0`; limit left side `I(1/2)=0.398942` | Correct converse normalization; empty closed set handled separately |
| 8.4 median concentration | `f=x₁`; constants with `L=0`; radius zero | At `r=2`, `0.022750≤0.067668`; for constant tail `0`; replacing `>` by `≥` at zero gives `1>1/2` | F05/F06 repaired |
| 8.5 maxima | One standard normal; two independent; `S=0` | One coordinate tail equals `1−Φ(r)`; two-coordinate median `0.544952136`, radius-two tail `0.010899410≤0.022750132`; zero covariance tail `0` | Correct |
| 9.3 planar directions | Angles `90°,135°,157.5°` | Dot products with `u₀` are `0,−1/√2,−0.923880`; cone angle tends `180°`; `−u₀` is absent from every finite cone but in its closed Hausdorff limit | Closed-set limiting interpretation valid; not a literal union equality |
| 9.4 convex closed symmetral | Full-dimensional unit ball in `ℝ³`; two disjoint discs in `ℝ²`; empty set | Ball mass `0.198748043`, half-space threshold `−0.846101568`, same mass; two discs also map to a half-space; empty set maps to empty set | Convexity preserved; converse false |
| 9.5 Ehrhard | `[-1,1]`, `[-3,3]`, midpoint; parallel half-spaces | Quantiles `1.690143378≥1.628703908`; probabilities `0.954500≥0.948312≥0.825134`; parallel half-spaces give exact threshold `λa+(1−λ)b` | Correct; nonempty and convex hypotheses retained |

**Library audit at the actual pins.** Opened each cited declaration, including its signature. All named imports exist. The main resolutions, with current lines, are:

- `Mathlib/Probability/Distributions/Gaussian/Multivariate.lean:65,71,126,144,166,171`: `stdGaussian`, its probability instance, `stdGaussian_map`, orthonormal-basis law, `multivariateGaussian`, and its non-positive-semidefinite Dirac case. The definition alone permits a measurable space; the probability/invariance theorems require the Borel instances supplied by the roadmap's conventions.
- `Mathlib/Probability/Distributions/Gaussian/Real.lean:47,220,358`: `gaussianPDFReal`, `gaussianReal`, `gaussianReal_map_neg`; `Mathlib/Probability/CDF.lean:56`: `cdf`. Variance is nonnegative and `gaussianReal` has an explicit zero-variance branch.
- `Mathlib/Geometry/Euclidean/Volume/Measure.lean:68,212,226,287`: normalized `euclideanHausdorffMeasure`, `EuclideanGeometry.measurePreserving_vaddConst`, `AffineSubspace.euclideanHausdorffMeasure_coe_image`, and `Submodule.measurePreserving_measurableEquivProd`. `Mathlib/Analysis/InnerProductSpace/NormDet.lean:69`: `LinearMap.normDet`.
- `Mathlib/Topology/MetricSpace/Thickening.lean:53,181,226`: `Metric.thickening`, `Metric.cthickening`, `Metric.cthickening_zero`. The first uses strict inequality against `ENNReal.ofReal δ`, so zero radius gives the empty set; the second gives closure at zero.
- `Mathlib/Analysis/LocallyConvex/Separation.lean:135`: `geometric_hahn_banach_open_open`; `Mathlib/Analysis/Calculus/InverseFunctionTheorem/FDeriv.lean:205`: `isOpenMap_of_hasStrictFDerivAt_equiv`; finite dimension supplies the necessary completeness.
- `Mathlib/Analysis/Calculus/Rademacher.lean:386`: `LipschitzWith.ae_differentiableAt`; `Mathlib/Analysis/Calculus/FDeriv/Basic.lean:949`: `norm_fderiv_le_of_lipschitz`; `Mathlib/Analysis/Calculus/Monotone.lean:213`: `Monotone.ae_differentiableAt`; `Mathlib/MeasureTheory/Integral/IntervalIntegral/DerivIntegrable.lean:101`: `MonotoneOn.intervalIntegral_deriv_mem_uIcc`.
- `Mathlib/Analysis/Convex/Measure.lean:89`: `Convex.nullMeasurableSet` for additive Haar measure; Gaussian null-measurability follows by absolute continuity. `Mathlib/MeasureTheory/Covering/Besicovitch.lean:1104`: `Besicovitch.ae_tendsto_measure_inter_div`; `Mathlib/MeasureTheory/Constructions/Pi.lean:796`: `measurePreserving_sumPiEquivProdPi`; `Mathlib/MeasureTheory/Measure/Map.lean:217`: `Measure.le_map_apply`, with a.e.-measurable map.
- Tau Ceti's Gaussian density, CDF, error-function and quantile declarations resolve at the lines in R04. The additional intrinsic density, projection and inverse APIs were read in full at their signatures. The native BV definitions use ordinary divergence and cannot silently replace weighted divergence. Searches for weighted perimeter, Gaussian isoperimetry, Ehrhard and Bobkov did not locate an implementation of this roadmap's new weighted or sharp Gaussian theory.

**Cross-roadmap and overlap audit.** Supplier sections were resolved afresh on main, not merely accepted from the previous report:

| Supplier/context | File and section opened | Resolution |
|---|---|---|
| GeometricMeasureTheory | `TauCetiRoadmap/GeometricMeasureTheory/README.md:148,183,210,248,275`, G2–G6 | Area/coarea and graph/sphere constants; local vector BV and polar decomposition; compactness/mollification/coarea/Poincaré; reduced versus essential boundary; Gauss–Green. Outward-normal sign is `Dχ=−ν Hⁿ⁻¹`. These are real contracts on main, not gaps. Existing implemented portions must now be imported by native name (R04). |
| Isoperimetry | `TauCetiRoadmap/Isoperimetry/README.md:223`, I4, especially lines 237–251 | Line slicing, reduced-boundary and normal comparison, product-volume identification are explicitly owned there. I1 at line 104 and I2 at line 144 own Prékopa–Leindler/Brunn–Minkowski and Steiner symmetrisation. No Gaussian symmetral ownership. |
| StandardDistributions | `TauCetiRoadmap/StandardDistributions/README.md:995`, §7.2 | Exact continuous-CDF inversion and strict-increase uniqueness are stated; now implemented in the native quantile file, as R04 records. |
| RandomMatrices | `TauCetiRoadmap/RandomMatrices/README.md:388`, §2.2 | Gaussian LSI/Poincaré and Herbst mean-centred concentration; no sharp Gaussian median profile. Its citation is scope/context, not an upward prerequisite. |
| BanachSpaceTheory | `TauCetiRoadmap/BanachSpaceTheory/README.md:1319` onward | Dvoretzky, sphere concentration and net estimates; no ownership of the sharp median theorem here. Context only. |

Read the supplied board-package index before checking absence: it lists AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory. Searched the available main/open roadmap corpus by object using `roadmaps grep` for weighted perimeter, Gaussian isoperimetry, Ehrhard, Bobkov and simplicial clusters. The only unrelated hit was a weighted hexagon perimeter in TensorProductCombinatorics. Read the closest scopes at their specified heads: PR #1187 (`TauCetiRoadmap/GeometricMeasureTheory/README.md` and `TauCetiRoadmap/RiemannianGeometry/README.md`), #950 (`TauCetiRoadmap/OptimalTransport/README.md`), #2111 (`TauCetiRoadmap/MathematicalStatisticsFoundations/README.md`), and #1421 (`TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md`). Their ownership is respectively Euclidean GMT/Riemannian geometry, couplings/transport, inference/sampling, and arithmetic probability. None owns weighted Gaussian perimeter, simplicial-cluster profiles or Gaussian symmetrisation. Suppliers already on main remain cited on main; the open revisions are not dependencies. The overlap data reports no shared edit of this roadmap, dropped cited ids, or ids defined only by an open revision, and the inspected contracts support that result.

**Dependency check.** Read every Needs line and the supplier table. The roadmap-level tool returned:

```text
candidate: GaussianIsoperimetryAndClusters is not in the merge order yet; checked as if placed after SobolevMapsBetweenManifolds (the intake inserts it when its design is accepted)
depcheck: 224 roadmaps, 2036 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The plan's target prerequisites all point backwards and name existing target ids; R06 records the extra forward edge in the README that the plan omits. There are no declared gaps, no forbidden suppliers, and no new unowned prerequisite established by this audit.

**Shape and headline acceptance.** The README has Summary, Scope, Conventions, exact supplier subsections, build guide, nine ordered layers with Examples/Dependencies, downstream context and References. Each of the ten definition blocks has an API and at least three Checks; R01–R03/R05 identify non-discriminating or false cases rather than a missing quota. Source locators and Needs occur throughout. The prose uses mathematical code spans rather than LaTeX delimiters; no job ids, pull-request numbers, absolute paths, HTML anchors or commit hashes remain in the README. Supplier and native identifiers resolve; symbolic mathematical expressions in backticks are not claims of undeclared Lean names. No separate roadmap-owned Lean API catalogue is promised in the README.

The headline inventory from the Summary is: weighted variation/perimeter comparison and coarea (§§2.2–2.6), minimizing-cluster existence (§3.5), the model measure-map diffeomorphism (§4.3) and matrix profile identities (§4.6), perimeter-decreasing Ehrhard symmetrisation (§6.6), Gaussian isoperimetry with equality (§7.3), its two-cell form (§7.4), general-Gaussian enlargement (§8.1), Bobkov and its converse (§8.3), sharp median concentration (§8.4, with maxima in §8.5), and convex Ehrhard (§9.5). Multi-bubble rigidity for `q≥3` is motivation, not an acceptance headline of this part.

There is no `Suggested.lean` in this design package. Therefore no padding declaration, import violation, sorry'd data or omitted package signature can be attributed to an existing Lean file. Zero sorried declarations were available for a one-tactic probe, and no `#check @...` file was elaborated. Elaboration: **not available (this lane does not elaborate; say so in the report)**. At package stage, §§8.1, 8.4, 8.5 and 9.5 already have native measure/set/function carriers; §8.2 and Bobkov need only a simple real-bodied profile. Weighted perimeter allows a short test-field supremum definition for §7.3. The now-present native BV APIs mean the previous review's broad carrier-absence assessment must not be reused without checking each headline. The eventual module docstring must identify any still-unstated headline and the specific missing construction. This report does not claim a passing Lean elaboration.

**Correction to the earlier source-error evidence.** Rendered MilmanNeeman2022 p.18 and inspected equation (3.6). It has closure bars on both sides: closure of the reduced boundary equals the union of the closures of the interfaces. The text extraction at lines 779–784 loses these bars. The earlier review's reported source error at (3.6) is therefore withdrawn. The roadmap's closure statement is sound, and its counterexample to the *unclosed* equality remains useful. This needs no design repair.

## Not verifiable

- Maggi2012 Proposition 12.15, Theorem 12.26, Theorem 15.9, Sections 13.1 and 18.1–18.3, Exercise 29.7: the cached legal extract has front matter, contents and a Part IV synopsis, not those theorem texts. Their relevant table-of-contents pages were read; exact theorem hypotheses are not certified from this book. The corresponding supplied mathematics and available Milman–Neeman/Cianchi sources were checked separately.
- SudakovTsirelson1974 Theorem 1; Ledoux1996 Chapter 1; CarlenKerce2001 Theorem 1; AmbrosioFuscoPallara2000 Theorem 3.108; Bogachev1998 Chapter 4: the existing manifest settles these as uncertified. They were not requested again and are not new missing-reference items.
- Bobkov1997 Theorem 1.1: the cached text contains corrupted glyphs; rendering the cached PDF also loses most letters. The author-specific theorem number cannot be certified from this artifact. Ledoux1999 (1.11) and its converse discussion support the functional theorem used here.
- Some Ehrhard1983 proof lines have mirrored or garbled OCR, especially lines 227, 230 and 250. The sampled Theorem 3.1 and Corollary 2.3 statements are readable. The precise planar uniform-convergence theorem is supported by its surrounding statement and the earlier round's computed review; not every OCR symbol in its proof is certified.
- Lean elaboration, actual theorem proofs, tactic probes and mechanically elaborated binder checks were not available in this lane. This is a design review, not a build certificate.

## Source issues

- **Misprint** in MilmanNeeman2022 at equation (1.1), printed page 5 (arXiv v3): the source says the reciprocal-profile second-derivative identity holds on the closed interval; it should restrict the differential identity to `(0,1)`, since the endpoint profile is zero; affects nothing.
- **Gap** in MilmanNeeman2022 at Lemma 2.1, printed page 11 (arXiv v3): the source says every nonzero displacement lies in an open model cell; it should select a maximal coordinate and prove strict translated-cell inclusion even with ties; affects the proof.
- **Misprint** in MilmanNeeman2022 at proof of Lemma 2.3, printed page 14 (arXiv v3): the source says the model-cell comparison uses a minimum and final threshold minus `C′`; it should use a maximum and final threshold plus `C′` throughout that inclusion; affects the proof.
- **Misprint** in CianchiFuscoMaggiPratelli2011 at equation (2.5), printed page 5 (cvgmt preprint): the source says its surface-normalized perimeter equals the probability-weighted divergence supremum; it should multiply that supremum by `√(2π)`; affects nothing.
- **Misprint** in CianchiFuscoMaggiPratelli2011 at Lemma 4.4, equation (4.8), printed page 12 (cvgmt preprint): the source says the derivative of probability-normalized section mass uses unnormalized one-dimensional boundary weights; it should include the factor `(2π)⁻¹ᐟ²`; affects the proof.
