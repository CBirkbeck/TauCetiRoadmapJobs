# Review of QuaternionicAnalysis (pull request #980 at 04d98b7)

**Verdict:** accepted

No P1 or P2 finding. The gate passes, the dependency check reports no problem, the previous review's blocking finding is repaired, and the adversarial table below carries computed values for every sampled target, every headline and every passage a finding touches. Two P3 notes remain for the author to take or leave.

## R01 (P3) — `hL` is unused in the two affine Cauchy vanishing theorems

**Location:** `TauCetiRoadmap/QuaternionicAnalysis/Suggested.lean:186–206` (`left_cauchy_affine`, `right_cauchy_affine`, each with `(hL : 0 < LinearMap.det L.toLinearMap)`); `README.md:887–892`: "Extend to affine parallelepipeds … with `A(u) = p + Lu` and `det L > 0`: prove `left_cauchy_affine` …".

**Claim:** the vanishing of the affine flux needs a positively oriented parallelepiped.

**Witness:** `L = diag(−1,1,1,1)`, `p = 0`, `f(q) = t + i x`. The pulled field is `(f∘A, −i f∘A, −j f∘A, −k f∘A)` with `f∘A = −u₀ + i u₁`; its divergence is `−1 + (−i)(i) = 0`, and the computed flux is `0`. The same `L` with the non-regular `f(q) = q` gives flux `2 ≠ 0`, so the Fueter hypothesis, not the orientation, carries the theorem.

**Repair:** delete `hL` from `left_cauchy_affine` and `right_cauchy_affine` (every continuous linear equivalence already has nonzero determinant; the pulled divergence is `det L · div F ∘ A`, which vanishes for either sign), and in README §5.5 state the affine vanishing for every invertible `L`, keeping "`det L > 0`" for the two representation formulas, where it is necessary: on `L = diag(−1,1,1,1)`, `p = (2,0,0,0)`, `f ≡ 1`, pole `(3/2,1/2,1/2,1/2)`, the computed affine integral is `−2π²`, so the representation with `1/(2π²)` would return `−1`. The repaired vanishing statement was checked on the refuting instance above (flux `0`) and on the original positive-determinant Checks (unchanged values).

## R02 (P3) — The cited works are still not recorded in a source manifest

**Location:** `TauCetiRoadmap/QuaternionicAnalysis/` contains `README.md`, `Suggested.lean` and `metadata.toml` only; `README.md:1152–1162` lists FL08, D12 and Sudbery 1979.

**Claim:** the three bibliographic sources have versioned, provenance-bearing records (the previous review's R02).

**Witness:** no `sources.toml` in the folder at this head. For calibration: none of the 125 roadmap folders on the content repository's main branch carries one either, so this is a repository convention question rather than a defect peculiar to this roadmap.

**Repair:** if the manifest is wanted, add one entry each for FL08 (arXiv 0711.2699v5, the version read), D12 (arXiv 1203.5619v1) and Sudbery 1979 (DOI `10.1017/S0305004100055638`, status `uncertified`, locator Theorem 1 and the Cauchy–Fueter sections). Not blocking.

## Verified sound

A full review of the two files at `04d98b7944e5b001550e4a1dd640862d8f059b29`. Nothing in the worktree was changed; `git diff --stat origin/main...HEAD` outside the folder is empty; the status is clean.

### Previous review's findings, checked first

| Previous finding | Passage at this head | Disposition and recomputed witness |
|---|---|---|
| R01 (P2), state the full affine Cauchy headlines | `Suggested.lean:176–181` defines `affineFluxBoundary L p F` as `boxBoundarySum 0 1 (fun j u => det L • Σ_i (L.symm (Pi.single i 1) j) • F i (p + L u))`; `Suggested.lean:186–242` states `left_cauchy_affine`, `right_cauchy_affine`, `left_cauchyFueter_affine`, `right_cauchyFueter_affine`; the docstring's nonstatability exemption for them is gone (`Suggested.lean:16–19` now lists only the top-form comparison). README §5.4 (lines 834–846) gives the definition and its API, §5.5 and §5.6 name the four theorems. | Repaired. `L.symm (Pi.single i 1) j` is `(L⁻¹)_{ji}`, the cofactor (Piola) pullback. Computed by midpoint quadrature on the definition itself: `L = diag(2,1,1,1)`, `f = (t+ix)j`: left flux `0`, right flux `4j`; `f ≡ j`, pole `1 + (i+j+k)/2`: both kernel-weighted integrals `19.743 j` at 40³ points per face against `2π² = 19.739`; `L = id`, `F_i = e_i x_i`: `1 + i + j + k`. |
| R02 (P3), source manifest | folder listing | Not repaired; carried as R02 above with the main-branch calibration. |

No repair report classified any finding as "not actionable in this package"; nothing is re-raised.

### Gate, dependency check, elaboration, probe and signatures

The worker's gate at this head: every scanner count is zero and the targeted build passes (`gate.md`). The dependency check, run as instructed with `--movable` against the supplied order and main content:

```text
depcheck: 208 roadmaps, 1461 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line; the roadmap is listed at line 199 of the merge order, after DifferentialGeometry and ConformalMapping (both on main). No supplier gaps are declared, and none is needed: every `*Needs:*` line (27 numbered subsections, each with one) names a local section, a pinned declaration, or DifferentialGeometry Layers 0–2 / 5.2 on main.

`lake env lean` on `TauCetiRoadmap/QuaternionicAnalysis/Suggested.lean`: 19 `declaration uses sorry` warnings, no other warning, no error. The file has a single `import Mathlib`, no `set_option`, no `lemma`, no `#eval`/`#print`/`#synth`, no sorry'd `def`/`instance`, no `True` placeholder.

One-tactic probe: a scratch copy with every `sorry` replaced by `first | rfl | simp | infer_instance | simp_all | norm_num` produced 19 "unsolved goals" errors, one per theorem, and closed none. Reading the definitions against the pin, no single library lemma has the shape of any of them (the quotient criteria need the commutator argument; the rigidity theorems need the complex-analytic transport; the Cauchy statements need the divergence theorem plus the Fueter identity; the Layer 6 statements need the representation formula). No padding: 14 definitions, all with real bodies and all used by a headline, and 19 theorems, each a headline.

Signature check: a scratch file with `#check @name` for all 34 declarations elaborated with 34 printed types and no error. Each was compared with its README statement: the affine theorems carry `L`, `p`, `0 < det`, continuity on `toTuple.symm '' ((fun u => p + L u) '' Icc 0 1)`, pointwise regularity on the open cube's image, and (for the formulas) the interior-pole condition `L.symm (toTuple q₀ − p) ∈ pi univ (Ioo 0 1)`, exactly as README §5.5–5.6 state; the rigidity theorems keep `IsOpen Ω` and `IsConnected Ω`; the estimates put `∃ C, 0 < C` before `f, Ω, q₀, R, M` with `0 < R`; the uniqueness theorems keep `IsOpen U`, `U.Nonempty`, `U ⊆ Ω`. No binder was lost and no correction was needed.

### Sources: the seeded sample

FL08 was read as arXiv 0711.2699v5 (`fl08`), D12 as arXiv 1203.5619v1 (`d12`), both through the sources service; pages 7 and 9 of FL08 were also rendered to check bars and subscripts. The README flags no locator as unverified; it marks Sudbery 1979 as cited by locator only.

| Target | Source opened, hypotheses, support |
|---|---|
| 1.1 matrices of `Lₐ`, `Rₐ` | `fl08` lines 303–310 (§2.1, p. 7) give the unit relations; the matrices are derived from `Quaternion.re_mul … imK_mul` at `Mathlib/Algebra/Quaternion.lean:823–835`. Recomputed all 32 entries for `a = 1+2i+3j+4k`: they match the README display; `Lᵢ j = k`, `Rᵢ j = −k`. |
| 1.2 composition, inverses, norms, determinants | `fl08` lines 314, 322–330 (p. 7): conjugation reverses products, inverse of nonzero `X` is `X⁺/N(X)`, `|XY| = |X||Y|`. Determinants are derived: `det Lₐ = det Rₐ = 900 = 30²` for the same `a`, `det L_{1+i} = 4`. |
| 1.3 component equations | Derived from the §1.1 matrices (Mathlib lines above); checked entrywise below. |
| 2.2 limit characterisations | `d12` lines 46–55 (§1, p. 2): right-hand limit `[f(z+h) − f(z)]h⁻¹`, left-hand `h⁻¹[f(z+h) − f(z)]`, as the README orders them. Remainder equivalence from `hasFDerivAt_iff_isLittleO_nhds_zero` (`FDeriv/Basic.lean:815`) and `|XY| = |X||Y|`. |
| 2.3 products, inverses, compositions | `HasFDerivAt.mul'` (`FDeriv/Mul.lean:198`), `hasFDerivAt_inv'` (line 735, `x ≠ 0`), `HasFDerivAt.comp` (`FDeriv/Comp.lean:107`) opened; the four criteria are this roadmap's commutator consequences. |
| 3.2 left classification | `d12` lines 57–61 (p. 2) states the classification (left-differentiable functions are `za + b`) without proof; Sudbery Theorem 1 uncertified. The route through `DifferentiableOn.analyticOnNhd_of_finiteDimensional` (`TauCeti/Analysis/Complex/CauchyIntegralPolydisc.lean:275`, hypotheses `[CompleteSpace E]`, `[FiniteDimensional ℂ V]`, `IsOpen s`) and `second_derivative_symmetric_of_eventually` (`FDeriv/Symmetric.lean:463`, derivative on a neighbourhood) was checked step by step below. |
| 3.3 reflection and right classification | `fl08` line 314 for `(XY)⁺ = Y⁺X⁺`; `HasFDerivAt.comp` for the chain rule; the derivative computation below. |
| 4.2 component systems | `fl08` lines 340–343 (Definition 1, p. 8) fix the ordered operators under `C¹`; the eight rows are derived here and recomputed below. |
| 4.4 closure and reflection | `fl08` lines 344–346 (no product closure) and 347–349 (Proposition 2, `C¹`); the pointwise derivative identity is recomputed below. |
| 5.3 raw affine face functional | `fl08` line 378 (equation (18), p. 9) and lines 387–391 (outward-first orientation convention); the native face sum at `DivergenceTheorem.lean:266`. The laws are owned derivations. |
| 5.4 axis-box match and comparisons | `DivergenceTheorem.lean:266` (face sum front minus back), `extDeriv_pullback` (`DifferentialForm/Basic.lean:259`, coefficient differentiable at the image point, map `C²`), `ContinuousOn.hasBoxIntegral` (`BoxIntegral/Integrability.lean:305`, `[CompleteSpace E]`), `Box.coe_ae_eq_Icc` (`Partition/Measure.lean:70`), `ModelWithCorners.ofConvexRange` (`IsManifold/Basic.lean:318`: `source = univ`, convex target, continuous map and inverse, nonempty interior). Cofactor identity recomputed below. |
| 6.2 real analyticity | `fl08` lines 448–450 (p. 10) assert real analyticity without the series; the README owns the geometric-square expansion, checked below. |
| 6.3 uniqueness | `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` (`Analytic/Uniqueness.lean:223`): needs `IsPreconnected U`, a point `z₀ ∈ U` and `f =ᶠ[𝓝 z₀] g`; the nonempty open `U ⊆ Ω` supplies both. |
| 6.4 derivative representation and estimate | `fl08` lines 428–447 (Theorem 9, p. 10) supply the formula only, as the README says; `hasFDerivAt_integral_of_dominated_of_fderiv_le` (`ParametricIntegral.lean:208`: neighbourhood `s`, measurable integrands, integrable `bound`, a.e. derivative on `s`) and `iteratedFDeriv_succ_eq_comp_left` (`FTaylorSeries.lean:843`). |
| 6.5 reflection of the consequences | `fl08` lines 347–349 (Proposition 2) through §4.4; computed below on `(t+ix)j`. |

Also read in full: §4.1 (`fl08` Definition 1), §5.1 (`fl08` line 369 for `dX`, line 378 for (18), lines 379–380 for Proposition 4), §5.5 (`fl08` lines 417–421, Corollary 8: open bounded `U`, piecewise `C¹` boundary, regularity on a neighbourhood of the closure; the README states the weaker pointwise hypotheses as its own extension), §5.6 (`fl08` lines 359–362, Proposition 3; lines 428–447, Theorem 9 with `1/(2π²)` and the exterior case), §6.1 (`fl08` lines 350–356, equation (17) and the factorisation). No copied passage, no algorithm, no route-specific restriction, no sorry'd data, no option override.

### Adversarial calculations

One row per statement; "keep" means the claim survives the instances listed. Here `P(q) = t + ix`, `Q = Pj = tj + xk`, `e = (1,i,j,k)`. Numerical values come from direct quaternion arithmetic, central-difference partials at `q = (0.3, 0.7, −0.2, 0.5)`, and midpoint quadrature on the stated definitions.

| Statement / target | Instances tried | Values computed on each side; negative control | Result; change |
|---|---|---|---|
| Conventions: coordinates, conjugation, norm | `q = 1+2i+3j+4k` | tuple `(1,2,3,4)`; `conj q = (1,−2,−3,−4)`; `q·conj q = 30 = ‖q‖²`; tuple sup norm `4 ≠ ‖q‖ = √30` | keep; the README's "never the sup norm" caveat is needed |
| 1.1 `Lₐ` matrix | `a = i, q = j`; `a = 1+2i+3j+4k` | `Lᵢ(0,0,1,0) = (0,0,0,1) = k`; full matrix `[[1,−2,−3,−4],[2,1,−4,3],[3,4,1,−2],[4,−3,2,1]]` equals the README display | keep |
| 1.1 `Rₐ` matrix | same | `Rᵢ j = (0,0,0,−1) = −k`; matrix `[[1,−2,−3,−4],[2,1,4,−3],[3,−4,1,2],[4,3,−2,1]]` equals the display; swapping the matrices flips the `(y,z)` block sign | keep |
| 1.1 agreement iff real | `a = 2`; `a = i+j, q = 1` | both `2I₄`; both send `(1,0,0,0) ↦ (0,1,1,0)` though the matrices differ on `j` | keep |
| 1.2 compositions | `a = i, b = j, q = 1` | `Lᵢ(L_j 1) = ij = k = L_{ij} 1`; `Rᵢ(R_j 1) = ji = −k = R_{ji} 1`; wrong order `R_{ij} 1 = k` | keep |
| 1.2 mixed commutation | `a = i, b = j, q = i` | `Lᵢ(Rⱼ i) = i(ij) = −j`; `Rⱼ(Lᵢ i) = (ii)j = −j` | keep |
| 1.2 inverses, zero | `a = i`; `a = 0` | `L_{−i}∘Lᵢ = id`; at `a = 0` the composite is `0`, not `id`; hypothesis `a ≠ 0` present | keep |
| 1.2 norms and determinants | `a = 0, 2, 1+i, 1+2i+3j+4k` | determinants `0, 16, 4, 900`; `‖a‖⁴` the same; `‖L_{1+i} j‖ = ‖j+k‖ = √2` | keep |
| 1.3 `Lₐ` system | entries of the `Lₐ` matrix | `K_t=L_x=M_y=N_z=α`; `K_x=−L_t=M_z=−N_y=−β`; `K_y=−L_z=−M_t=N_x=−γ`; `K_z=L_y=−M_x=−N_t=−δ` | keep |
| 1.3 `Rₐ` system | entries of the `Rₐ` matrix | `K_x=−L_t=−M_z=N_y=−β`; `K_y=L_z=−M_t=−N_x=−γ`; `K_z=−L_y=M_x=−N_t=−δ` | keep |
| 1.3 Checks | `iq`, `qi`, `conj q`, `rq` | `iq = −x + it − jz + ky`: `Lₐ` rows hold, `Rₐ` fails at `M_z = −1 ≠ 1`; `qi`: dual; `conj`: `K_t = 1 ≠ −1 = L_x`; `rq`: both | keep |
| 2.1 left predicate | `f = qj`, `f = jq`, direction `i` | `qj`: derivative `h ↦ hj`, at `i` gives `k = R_j(i)`; `jq`: `ji = −k ≠ k` although `h = 1` forces candidate `j` | keep |
| 2.1 right predicate | same maps | `jq`: `L_j(i) = −k` matches; `qj`: `k ≠ −k`; constant: both slopes `0`; `id`: both `1` | keep |
| 2.1 `q²` at `i` | `h = j` | derivative `ji + ij = 0`; forced `c = 2i`, `R_c(j) = 2ji = −2k ≠ 0`; at real `r`: `2r` both sides | keep |
| 2.2 remainder identity | `h = 2, Δ = 6, b = 1` | `‖h⁻¹Δ − b‖ = 2`; `‖Δ − hb‖/‖h‖ = 4/2 = 2`; at `h = 0` the identity would read `‖b‖ = 0`, so the puncture is essential | keep |
| 2.2 quotient non-limit | `f = q²` at `i`, `h = 10⁻³` real and `h = 10⁻³ j` | left quotients `(0.001, 2.000, 0, 0)` and `(0, 0, 0.001, 0)`: limits `2i` and `0` | keep non-example |
| 2.2 right quotient of `qb` | `b = j`, `h` real vs `h = εi` | `hjh⁻¹ = j` vs `iji⁻¹ = −j` | keep |
| Left product iff (headline) | `f = id, g = j`; `f = j, g = id`; `f = g = id` at `i` | product-rule derivative minus `R_{bf g + f bg}` is `h ↦ [f(q), h] bg`; first: `bg = 0`, true; second: `[j, i]·1 = 2k ≠ 0`, false, and `jq` indeed has no left slope; third: `[i,h]·1 ≠ 0`, false, `q²` fails at `i` | keep both directions |
| Right product iff (headline) | `f = j, g = id`; `f = id, g = j` | difference `h ↦ af [h, g(q)]`; first: `af = 0`, true; second: `[h, j] ≠ 0`, false | keep |
| Left inverse iff (headline) | `f = id` at `i`, at `2`; constant `i` | difference `h ↦ [f(q)⁻¹, h] bf f(q)⁻¹`; at `i`: `D(j) = −iji = −j`, `R_1(j) = j`, false; at `2`: slope `−1/4`, true; constant: `bf = 0`, true; `f q ≠ 0` present | keep |
| Right inverse iff (headline) | same | difference `h ↦ af [h, f(q)⁻¹]`; at `i` false, at `2` and for constants true | keep |
| 2.3 compositions | `f = qi, g = qj` | `f∘g = qji = −qk`, slope `ji = −k = b_g b_f`; other order `k` | keep |
| 2.4 projections, loops | `q ↦ x` at `0`; unit square | derivative rank 1, no `R_b`/`L_a` has rank 1; `∮ q dq`: edges `−1/2, k−1/2, k+1/2, 1/2`, sum `2k`; `∮ dq q = −2k` | keep; no 1-form Cauchy claim |
| 2.5 simultaneous slopes | `id`, `3q`, `iq` and `−iq` | common slopes `1, 3` real; `iq` has right slope `i`, no left slope (`ij = k ≠ −k = ji`); mutual inverses do not force reality | keep |
| 3.1 scalar actions | `λ = i, q = j` | `ij = k = 0 + j(−i)`, `Φₗ(k) = (0, conj(−i)) = (0,i) = i·Φₗ(j)`; `ji = −k = 0 + j·i`, `Φᵣ(−k) = (0,i) = i·Φᵣ(j)`; `(v,w)` without conjugation gives `(0,−i)`, conjugate-linear | keep |
| 3.1 conjugated function | `f = id` at `(0,i)`; `q = 1+i+j+k` | `(g(z₁, conj z₂), conj h(z₁, conj z₂)) = (0, conj(conj i)) = (0,i)`; `v + jw = 1+i + j(1−i) = 1+i+j+k` | keep |
| Left rigidity (headline) | `1 + qi`; `q²`; two balls with `qi`, `qj`; `∅` | affine with `a = 1, b = i`; `q²` fails at nonreal points; disconnected union has a slope everywhere but `b` jumps `i → j`; `∅` fails `IsConnected` (nonemptiness, `Topology/Connected/Basic.lean`) | keep openness, connectedness |
| 3.2 proof route | `Df = R_b`, `D²f(k,h) = h·Db(k)` | symmetry `h Db(k) = k Db(h)`; `k = 1`: `Db(h) = hc`; `h = i, k = j`: `(ij − ji)c = 2kc = 0 ⇒ c = 0`; `R_b` commutes with `λ•ₗ` since `(λq)b = λ(qb)` | keep |
| 3.3 reflection of slopes | `f = iq`; `f = b conj q` | `T(iq) = conj(i conj q) = −qi`, left slope `−i = conj i`; argument-only conjugation gives derivative `h ↦ b conj h`, at `b = 1`: `1 ↦ 1` but `i ↦ −i ≠ i` | keep |
| Right rigidity (headline) | ball about `i` | `star '' Ω` is the ball about `−i`, open and connected; `T` applied twice is the identity | keep |
| Two-sided rigidity (headline) | `2 + 3q`, `−q`, `iqi` | slopes `3`, `−1`; `iqi = −t − ix + jy + kz` sends `1 ↦ −1`, `j ↦ iji = j`, but `−1·j = −j`; neither slope | keep real `r` of either sign |
| 4.1 `FueterLeft` | `D = R_i`, `D = id`, `D = DP` | `i + iii + jij + kik`: `i − i − i − i = −2i`; `1 − 3 = −2`; `1 + i·i = 0` | keep |
| 4.1 `FueterRight` | `D = R_i`, `D = L_i`, `D = DP` | numerically `(0, 2, 0, 0) = 2i`, `−2i`, `0`; the README's `−2 conj b` at `b = i` is `2i` | keep |
| 4.1 `At` needs a derivative witness | `f(q) = ‖q‖` at `0` | real difference quotients `+1` and `−1`; no derivative, so `LeftFueterAt` false although the totalised `fderiv` is `0` | keep; no vacuity |
| 4.1 Checks | `P`, `conj`, `P²`, `Q`, `jP` | left/right Fueter values `0/0`, `4/4`, `0/0`, `0/2j`, `2j/0` | keep |
| 4.2 left rows | symbolic expansion of `Σ eᵢ ∂ᵢ(K+iL+jM+kN)` | real `K_t−L_x−M_y−N_z`; `i`: `L_t+K_x+N_y−M_z`; `j`: `M_t−N_x+K_y+L_z`; `k`: `N_t+M_x−L_y+K_z` | keep |
| 4.2 right rows | expansion of `Σ (∂ᵢf) eᵢ` | `i`: `L_t+K_x−N_y+M_z`; `j`: `M_t+N_x+K_y−L_z`; `k`: `N_t−M_x+L_y+K_z`; on `Q`: left third row `1−1 = 0`, right third row `1+1 = 2` | keep |
| 4.3 intersection | `qi`, `5`, `P` | `qi`: slope `i`, left Fueter `−2i`; `5`: slope `0`, Fueter `0`; `P`: Fueter `0`, `DP(j) = 0 ≠ j` | keep |
| 4.4 constant multiplication | `Pj`, `jP` | `∂̄ₗ(Pj) = j + ik = 0`; `∂̄ₗ(jP) = j − ik = 2j` | keep side |
| 4.4 dilation, composition with `qj` | `P(2q)`, `P(qj)` | `2t + 2ix` regular; `P(qj) = −y − iz`, `∂̄ₗ = −j − ki·… = −2j` (numerically `(0,0,−2,0)`) | keep real dilation only |
| 4.4 reflection identity | general `D`, `D' = h ↦ conj(D(conj h))` | `Σ eᵢ D'(eᵢ) = conj D(1) + Σ_{i≥1} conj(eᵢ) conj(D(eᵢ)) = conj(Σ D(eᵢ) eᵢ)`; on `Q`: right `2j`, on `TQ`: left `−2j` | keep |
| 5.1 `dq` | `e_t`, `e_x + e_y`, `q = j` | `1`; `i + j`; `(q·dq)(e_x) = ji = −k`, `(dq·q)(e_x) = k` | keep |
| 5.1 `Dq` basis values | delete `t, x, y, z` | `1, −i, +j, −k` (since `dt∧dz∧dx(e_t,e_x,e_z) = −1`), i.e. `(−1)^i eᵢ`; matches `fl08` (18) because `−j dt∧dz∧dx = +j dt∧dx∧dz` | keep |
| 5.1 `σ*Dq` | `σ = diag(1,−1,−1,−1)` | `σ*` flips `dx∧dy∧dz`, fixes the three `dt` terms: `−(dx∧dy∧dz + i dt∧dy∧dz + j dt∧dz∧dx + k dt∧dx∧dy) = −conj Dq` | keep |
| 5.1 divergence identities | `f = 1, q, Q` | `Σ ∂ᵢ(eᵢ f)`: `0`, `Σ eᵢeᵢ = −2`, `0`; `Σ ∂ᵢ(f eᵢ)` on `Q`: `2j`; equal to the Fueter values | keep |
| 5.2 change of variables | `n = 1, L = 2`; `L = −1`; `n = 2, diag(2,3), w ≡ 1`; `w = 1/x` | `∫₀¹ 2w(2u) = ∫₀² w`; `|−1| = 1` gives `∫_{−1}^0 w`, signed version gives the negative; `6 = 6`; nonintegrable: `0 = 0` | keep absolute determinant, no integrability hypothesis |
| 5.3 raw functional | `id`, `Dq·1`; `f = t`; `ρ`; collapsed chart | `Σ(eᵢ − eᵢ) = 0`; `t`-pair `1 − 0 = 1`; after `ρ`: `−1`; degenerate tangent triple gives `Dq = 0` | keep |
| 5.4 `boxBoundarySum` | `F i x = eᵢ`; `F i x = eᵢ xᵢ`; `b = (2,1,1,1)` | `0`; `1+i+j+k` (back minus front would give the negative); face volumes `1,2,2,2`, sum `0` | keep |
| 5.4 cofactor divergence | symbolic | coefficient of `∂_k Fᵢ` in `div H` is `det L Σ_j (L⁻¹)_{ji} L_{kj} = det L δ_{ki}`, so `div H = det L · div F ∘ A` | keep |
| 5.4 cofactor Checks | `diag(2,1,1,1)`, `F = eP`; `diag(−1,1,1,1)`, `F = (x₀,0,0,0)`; shear `(u₀+u₁,u₁,u₂,u₃)`, `F = (x₁,0,0,0)` | `H = (P∘A, 2iP∘A, 2jP∘A, 2kP∘A)`, `div H = 2 − 2 = 0`, naive precomposition `2 + i² = 1` (quadrature: flux `0` vs `1`); `H₀ = −u₀`, `div H = −1 = det L · 1`; `L⁻¹ = [[1,−1],[0,1]]⊕I`, `H = (u₁, 0,0,0)`, divergence `0`; transpose inverse gives `(u₁,−u₁,0,0)`, divergence `−1` | keep signed determinant, index order `ji` |
| 5.4 `affineFluxBoundary` definition | `L = id`, `F i x = eᵢ xᵢ`; diagonal `L = diag(b−a)`, `p = a` | quadrature `(1,1,1,1) = 1+i+j+k`; `H_j = (∏ℓ_k/ℓ_j) F_j(a + ℓu)`, face Jacobian `∏_{k≠j} ℓ_k` restores `boxBoundarySum a b` | keep |
| 5.4 `L.symm (Pi.single i 1) j` | matrix reading | `(L⁻¹ eᵢ)_j = (L⁻¹)_{ji}`, the index order the README's `H_j = det L Σ_i (L⁻¹)_{ji} Fᵢ` uses | keep |
| Left affine Cauchy (headline) | `diag(2,1,1,1)`, `f = Pj`; unit box `P`; `f = q` | quadrature flux `(0,0,0,0)`; by hand `t`-pair `(1 + i/2) − i/2 = 1`, `x`-pair `i(1/2 + i) − i/2 = −1`, total `0`; `f = q` gives `Σ eᵢeᵢ = −2` | keep Fueter hypothesis |
| Right affine Cauchy (headline) | `diag(2,1,1,1)`, `f = Pj` with right field; `f = jP` | right flux `(0,0,4,0) = 4j` (so the right theorem needs right regularity: `Q` is only left regular); `jP` right flux `0`, left flux `4j` | keep order-sensitive hypotheses |
| Affine Cauchy without `hL` | `diag(−1,1,1,1)`, `f = P`; same `L`, `f = q` | flux `0`; flux `2 ≠ 0` | holds without `hL`: R01 (P3) |
| 5.6 kernel values | `r = 1, 2, i, 2i, 0` | `1, 1/8, −i, −i/8 = 2⁻³G(i), 0` | keep |
| 5.6 kernel regularity | `G_s = conj r ‖r‖⁻ˢ` at `r = (1, .5, −.3, .2)` | `∂̄ₗ G_s = (4 − s)‖r‖⁻ˢ`: `s = 4` gives `0/0` numerically; `s = 2` (`r⁻¹`) gives `2/1.38 = 1.449`, matching `(4−2)‖r‖⁻²` | keep |
| 5.6 weighted identity | `Σ ∂ᵢ(G eᵢ f)` | `= (Σ ∂ᵢG eᵢ) f + G (Σ eᵢ ∂ᵢ f) = (∂̄ᵣG) f + G (∂̄ₗ f)`; right form `(∂̄ᵣ f) G + f (∂̄ₗ G)` | keep |
| 5.6 cutoff and radial mass | `ψ(s) = smoothTransition(2s−1)` at `1/2, 3/4, 1`; dimension 4 | `0, 1/2, 1` (`smoothTransition(1/2)` has equal numerator and complementary term); `Σ eᵢ ∂ᵢψ(‖r‖/ε) = ε⁻¹ψ' r/‖r‖`, `G(r) r = ‖r‖⁻²`; `∫ = 4 · (π²/2) · ∫₀^∞ ε⁻¹ψ'(s/ε) ds = 2π²` with `volume(ball) = π²/2!` | keep `1/(2π²)` |
| Left Cauchy–Fueter formula (headline) | `diag(2,1,1,1)`, `f ≡ j`, `q₀ = 1 + (i+j+k)/2`; `q₀ = 0` | quadrature `(0,0,19.755,0)` at 20³ and `(0,0,19.743,0)` at 40³ per face, against `2π² j = 19.739 j`; `L⁻¹(χ(q₀) − p) = (1/2,1/2,1/2,1/2) ∈ (0,1)⁴`; at `q₀ = 0` it is `(0,0,0,0)`, excluded | keep normalization and interior-pole condition |
| Right Cauchy–Fueter formula (headline) | same data with `f eᵢ G` | quadrature identical, `19.743 j` at 40³; a formula with `1/π²` or `1/(4π²)` returns `2j` or `j/2` | keep |
| Representation with `det L < 0` | `diag(−1,1,1,1)`, `p = (2,0,0,0)`, `f ≡ 1`, pole `(1.5,.5,.5,.5)` | quadrature `−19.748 ≈ −2π²` | `hL` necessary here; keep |
| 5.6 exterior case | `f ≡ 1`, pole outside the closure | kernel-weighted field divergence-free on the box, boundary sum `0` | keep |
| 6.1 harmonicity (headline) | `P`, `P²`, `‖q‖²`, `t² − x²`, `jP`, `G` | Laplacians `0, 0, 8, 0, 0, 0`; Fueter values `0, 0, 2q, 2t − 2ix, 0, 0`: harmonic does not imply regular | keep one-directional |
| 6.1 factorisation | mixed terms | `−ij ∂ₓ∂ᵧ − ji ∂ᵧ∂ₓ = (−k + k) = 0`; `−i·i = 1`; `∇(‖r‖⁻²) = −2 conj r/‖r‖⁴ = −2G`, at `r = i`: `2i`, `G(i) = −i` | keep |
| 6.2 series (headline) | `r = 1`, `h = 1/2`; `h = i/2`; `h = 0`; `‖h‖ = δ/4` | `u = 3/4`, `‖r−h‖² = 1/4 = 1 − u`; `u = −1/4`, `5/4`; `u = 0`; `|u| ≤ 1/2 + 1/16 < 1`; radius `δ(√2 − 1)` solves `x² + 2x < 1` | keep |
| Right analyticity (headline) | `TQ = −tj + xk`, `jP²` | real polynomials of degree 1 and 2; finite Taylor expansions | keep |
| 6.3 uniqueness (headline) | two balls; `P` vs `0` on the plane `t = x = 0`; identical functions | piecewise `0/1` vs `0`; `P` vanishes on the plane but `P(1) = 1`; trivial equality | keep connectedness and open `U` |
| 6.4 representation sign | `D_r G(1)[1]`, `D_q G(r − q)[1]` | `−3` and `+3`; imaginary direction `−i` vs `i` | keep `(−1)^m` |
| 6.4 estimate (headline) | `m = 0`, `f ≡ 1`; `m = 1`, `f = P`, `q₀ = 0`; `R = 0` | `1 ≤ C₀`; `‖DP‖ = 1`, `M = R`, so `C₁ ≥ 1`; at `R = 0` the bound would read `1 ≤ 0`; cube of side `R`: vertices at `R√4/2 = R`, faces at `R/2`, face volumes `R³`, kernel bound `c_m(R/2)^{−3−m}`, total `(2π²)⁻¹ · 8 · 2^{3+m} c_m R^{−m} M` | keep `∃ C` before `f, Ω, q₀, R, M`, `R > 0` |
| Right estimate (headline) | `jP` at `m = 1`, `jP²` at `m = 2` | norms `1`, `2`; bounds `R`, `R²` on the ball; reduce to `1 ≤ C₁`, `2 ≤ C₂` | keep |
| 6.5 reflection | `Q → TQ`; ball about `i` | `TQ = conj((t−ix)j) = −tj + xk`: `∂̄ᵣ = −j + ki = 0`, `∂̄ₗ = −j + ik = −2j` (numerically `(0,0,−2,0)`); reflected ball about `−i`, same radius | keep |

### Pinned library and ownership audit

Pins used throughout: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` (from `lake-manifest.json`). Every file and line the README's supplier contract names was opened at the pin and the declaration found on that line: `Analysis/Quaternion.lean:60,85,89,158,194`; `Algebra/Quaternion.lean:96,306,506,598,823,835`; `Analysis/Normed/Operator/Mul.lean:39`; `FDeriv/Basic.lean:174,815`; `FDeriv/Mul.lean:198,735`; `FDeriv/Comp.lean:107`; `FDeriv/Symmetric.lean:463`; `FDeriv/RestrictScalars.lean:89`; `ContDiff/FTaylorSeries.lean:843`; `ParametricIntegral.lean:208`; `Analytic/Uniqueness.lean:223`; `DifferentialForm/Basic.lean:259`; `InnerProductSpace/Laplacian.lean:138,171`; `DivergenceTheorem.lean:266`; `Lebesgue/Basic.lean:429`; `Bochner/Basic.lean:1100`; `Bochner/Set.lean:581`; `BoxIntegral/Integrability.lean:305`; `BoxIntegral/Partition/Measure.lean:70`; `HaarToSphere.lean:296`; `VolumeOfBalls.lean:359` (section variables `[FiniteDimensional ℝ E] [Nontrivial E]` at lines 336–341; the statement is total in `r` through `ENNReal.ofReal`, the README's `r ≥ 0` form is the real reading); `IsManifold/Basic.lean:318`; `Haar/InnerProductSpace.lean:139`; `SmoothTransition.lean:161,165,205,222` (one for `1 ≤ x`, zero iff `x ≤ 0`, `contDiff`, `monotone`); `TauCeti/Analysis/Complex/CauchyIntegralPolydisc.lean:275`. The hypotheses quoted in the README agree with the pinned statements in each case (the divergence theorem's countable exceptional set, the inverse rule's `x ≠ 0`, the second-derivative symmetry's neighbourhood derivative, the analyticity theorem's completeness and finite dimension, the parametric integral's dominator).

Duplication by object: the pinned Mathlib and Tau Ceti were searched for Fueter or Cauchy–Riemann–Fueter operators, quotient derivatives, quaternion-valued forms, cofactor pullbacks and any `Quaternion` analysis beyond the normed-algebra instances; the only Tau Ceti quaternion files are algebraic (`TauCeti/Algebra/Quaternion/*`, `TauCeti/Algebra/CentralSimple/*`), and `integralTopForm` is absent from the pinned Tau Ceti, so the docstring's single nonstatability exemption is correct. The roadmap consumes rather than restates the product, inverse and chain rules, the divergence theorem, the Lebesgue linear change of variables, polar integration, ball volumes and the identity principle.

Ownership: `roadmaps grep` over the 441 open heads and main for `fueter`, `quaternionic analysis` and `quotient derivative` returns only this roadmap; `divergence theorem` hits DifferentialGeometry (its own Layer 12.5 on manifolds, consumed by nothing here), IncompressibleFlows and CalibratedGeometry, none of which builds a quaternionic Cauchy theory. The open QuaternionArithmetic pull request (`TauCetiRoadmap/QuaternionArithmetic/README.md:1–5`) concerns quaternion algebras over number fields, orders and Shimura curves and states no real calculus. The board's five packages under review are unrelated. This roadmap is the owner of every object it defines.

Cross-roadmap citations, resolved on main `9c6e95d9`: `TauCetiRoadmap/DifferentialGeometry/README.md:63–90` ("Boundary and corners": Layers 0–2 hold over any model with corners; `integralTopForm` is defined over any model; 5.5 is Stokes with corners through the abstract boundary), lines 272–300 (Layer 0: wedge, pullback, paired products), line 320 (1.2 Naturality `mpullback_mextDeriv` for a `C²` map and `C¹` form), lines 511–517 (5.2 `integralTopForm`, `integralTopForm_of_tsupport_subset_chart`), lines 518–534 (5.3 Stokes, 5.5 corners, neither consumed). `TauCetiRoadmap/ConformalMapping/README.md:104–114` (L2 disc automorphisms, L3 the Riemann mapping theorem) supports the scope deferral. Both suppliers precede this roadmap in the order. No upward citation, no cycle, no two-owner object, no drift.

Shape: the README has Summary, Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, DifferentialGeometry), How to read the build, Layers 1–6 each ending with Examples and Dependencies, Downstream consumers, References. Every definition carries an API list and at least three discriminating Checks (counted: §1.1 three, §2.1 four, §4.1 five, §5.1 four plus five, §5.3 four, §5.4 eight, §5.6 seven); every theorem carries hypotheses and a locator; every subsection carries a `*Needs:*` line. No process words, round labels, pull-request numbers, LaTeX delimiters or machine paths. Every backticked name of the roadmap's own in the README is declared in `Suggested.lean` and every Lean name appears in the README (the gate's name check and a direct comparison of the 34 names).

## Not verifiable

- **Sudbery 1979 (Theorem 1; the Cauchy theorem and Cauchy–Fueter formula with `Dq`).** The sources service followed DOI `10.1017/S0305004100055638` to the Cambridge landing page and found no legal full text; the request is recorded in the job's `needs-references.toml`. The theorem number and printed page remain uncertified; the README marks the citation as locator-only, and every statement that cites it also has a verified FL08 or D12 locator or an owned proof route. This review is complete and not parked.
- **Completed formal proofs.** Elaboration and the computations above do not discharge the 19 admitted theorems; the cutoff limit, the series regrouping, the raw-face construction and the parametric differentiation remain implementation work. Their inputs and routes were checked, not their formal proofs.

## Source issues

- **Misprint** in fl08 at §2.1, printed p. 7 (fl08 line 307): the source says a product of two distinct imaginary units equals its own negative; it should be the negative of the product in the opposite order; affects nothing.
- **Misprint** in fl08 at the defining property before equation (18), printed p. 9 (fl08 line 376): the source says the 3-form in the defining identity is called Dz; it should be Dx; affects nothing.
- **Error** in fl08 at Lemma 6, printed p. 9 (fl08 lines 389–400): the source says the restriction of Dx equals an arbitrary nonzero outward normal times the Euclidean volume element; it should be the unit outward normal, as its own sphere formula uses; affects a stated result.
