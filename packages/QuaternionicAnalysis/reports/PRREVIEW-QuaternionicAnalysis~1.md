# Review of QuaternionicAnalysis (pull request #980 at e198e11)

**Verdict:** needs changes

## R01 (P2) — Headline theorems statable at the pins are absent from `Suggested.lean`

Location: `TauCetiRoadmap/QuaternionicAnalysis/Suggested.lean` lines 51–146 (eleven sorried theorems) and lines 143–144 ("The integral targets are specified in README.md").

Claim: the file states the roadmap's headline theorems. It states the two rigidity theorems, the two analyticity theorems and seven calculus lemmas. The README's remaining end theorems are all statable against the pinned Mathlib with no new carrier, and none is stated:

- the universal derivative estimate (README line 169–173): `‖iteratedFDeriv ℝ m f q₀‖ ≤ C_m * R⁻ᵐ * sup ‖f‖` for regular `f` with `closedBall q₀ R ⊆ Ω`;
- componentwise harmonicity (README line 159): Mathlib's `Laplacian` instance on `E → F` for a real inner product space `E` is at `Mathlib/Analysis/InnerProductSpace/Laplacian.lean` line 138, and `InnerProductSpace ℝ ℍ` is at `Mathlib/Analysis/Quaternion.lean` line 60, so `∀ q ∈ Ω, Δ f q = 0` elaborates;
- the connected-open uniqueness principle (README line 167);
- the simultaneous two-sided classification on a connected open set, `f q = a + r * q` with `r : ℝ` (README line 78); only the pointwise slope lemma is stated;
- the left Cauchy–Fueter formula on an axis-aligned box (README lines 137–141). It needs one short definition, the ordered front-minus-back face sum in exactly the form of `MeasureTheory.integral_divergence_of_hasFDerivAt_off_countable` (`Mathlib/MeasureTheory/Integral/DivergenceTheorem.lean` line 266), with the quaternion carrier identified with `Fin 4 → ℝ` by `QuaternionAlgebra.linearEquivTuple (-1) 0 (-1)` as the README itself prescribes.

Witness: a scratch copy of the file with these five statements added (the box sum as one `noncomputable def`, the kernel field `cauchyFueterKernel (χ.symm x) q₀ * χ.symm (Pi.single i 1) * f (χ.symm x)`, the estimate with `∃ C, 0 < C ∧ ∀ f Ω, LeftFueterOn f Ω → …`, harmonicity with `open Laplacian`) elaborates under `lake env lean` with `sorry` as the only warning.

Repair: state the five theorems (left and right versions where the README has both) with `sorry`, adding only the box boundary-sum definition; the affine-parallelepiped formula and the full raw face functional may stay README targets, but then the module docstring must name them as not statable and say what carrier is missing (the affine face adapter of Milestone 5).

## R02 (P3) — False claim that the pinned Mathlib lacks a constructor multiplication formula

Location: `README.md` line 12: "the pinned Mathlib has `QuaternionAlgebra.star_mk` … but no constructor multiplication formula; prove `mk_mul_mk` … locally".

Witness: `QuaternionAlgebra.mk_mul_mk` is at `Mathlib/Algebra/Quaternion.lean` line 306 (simp lemma, for every `ℍ[R,c₁,c₂,c₃]`); a scratch `example : (⟨0,1,0,0⟩ : ℍ) * ⟨0,0,1,0⟩ = ⟨0,0,0,1⟩ := by rw [QuaternionAlgebra.mk_mul_mk]; norm_num` closes at the pin.

Repair: cite `QuaternionAlgebra.mk_mul_mk` (file and line) in the supplier contract and delete the instruction to prove it locally. The `star_mk` description (`⟨a₁ + c₂ * a₂, -a₂, -a₃, -a₄⟩`, line 598, so negation of the three imaginary parts when `c₂ = 0`) is correct.

## R03 (P3) — README is not in TauCetiRoadmap form

Location: `README.md` throughout (headings at lines 5, 18, 20, 38, 67, 80, 107, 157, 185, 189).

Claim: the shape the repository's README prescribes. Witness: there is no `**Summary.**` paragraph, no `## Scope and ownership`, no `## Exact supplier contracts` (library and roadmap citations are scattered through the milestones), no `## How to read the build`, no `## Layer k` / `### k.n` structure (the file uses `## Milestones` with six `###` blocks, each a single long paragraph), no `*Needs:*` line on any target, no `### Examples` or `### Dependencies` in any layer, no `## Downstream consumers`, and `## Provenance` in place of `## References`. Compare `TauCetiRoadmap/DifferentialGeometry/README.md` lines 264–535 on main for the layer shape.

Repair: rewrite in the prescribed shape, one target per prose statement with its hypotheses, locator and `*Needs:*` line; move every library and supplier citation (Mathlib names, `TauCeti.Analysis.Complex.CauchyIntegralPolydisc`, DifferentialGeometry Layers 0–2, 5.2 and 5.5, ConformalMapping) into `## Exact supplier contracts`.

## R04 (P3) — No definition has Checks

Location: `README.md` lines 40 (quotient-derivative predicates), 82–94 (Fueter operators and predicates), 109–115 (`dq`, `Dq`, raw face functional), 140 (kernel), 149 (cutoff `ψ`), 130–135 (change-of-variables lemma).

Claim: every definition carries at least three discriminating Checks. Witness: the string `Checks` does not occur in the README. The file does contain computed witnesses that would serve (the `2k` and `−2k` loop integrals at line 61–62, `Dq` on the `insertNth` triples `(−1)^i eᵢ` at line 126, the Fueter value `−2b` on `a + q*b` at line 105, the function `t + ix` at line 105, the radial mass `2π²` at line 149), but they are embedded in proof prose rather than attached to the definitions as Checks, and the quotient-derivative predicates, the raw face functional and the kernel have none at all (for instance: the left-quotient slope of `q ↦ q*b` is `b` and of `q ↦ b*q` is not defined at nonreal `q`; `Dq` on a degenerate triple is `0`; `Raw(A∘ρ) = −Raw(A)` on one explicit box; `G(λr) = λ⁻³G(r)` at `λ = 2`).

Repair: add a `**Checks.**` list under each definition with at least three bullets, each saying what is computed and what a plausible wrong definition (the other multiplication order, the inverse orientation, the unscaled kernel) would get wrong.

## R05 (P3) — No target has a locator, and the sources are not recorded or readable

Location: `README.md` lines 189–191 (the only citations) and the absence of `sources.toml`.

Claim: every theorem carries a locator into a legal source. Witness: no milestone cites a theorem number, section or page; Sudbery 1979 is cited once, globally, by DOI. The DOI resolves only to the paywalled Cambridge Core page (the sources service found no legal copy; a web search found no author-page or repository copy), so it must be recorded `uncertified` with per-theorem locators (Sudbery's Theorem 1 for the rigidity classification, his Cauchy theorem and Cauchy–Fueter formula, his definition of `Dq` and the kernel). The "MATH3680 Complex Analysis notes, pages 74–75" are unpublished course notes with no author, institution or year; they cannot be read legally by anyone outside the course and are not a legal source.

Repair: add `sources.toml` with Sudbery 1979 (`uncertified`, DOI) and attach a theorem or page locator to each target; replace the course-notes citation by a published source for the one-form loop-integral remark or drop that remark (see R06).

## R06 (P3) — Non-timeless and process content

Location: `README.md` line 14 ("For mathematical statements transcribed from the notes, use the normalized coordinate dictionary `w ↦ t`, …"); lines 58 and 65 ("The course-note question (transcribed 'Cauchy–Gaussat')", "without interpreting or correcting the handwritten surname in the note"); `Suggested.lean` line 1 ("Suggested forms only; … this file is not exhaustive") and lines 143–144.

Claim: a README is timeless mathematics. Witness: the quoted lines are about transcribing a handwritten note and about what this file does not contain, not about quaternions; the loop-integral counterexample itself (lines 60–63, verified below) is good content and belongs as a Check on the one-form integral.

Repair: delete the transcription dictionary and the remarks about the note; keep the `2k`/`−2k` computation as a Check; replace the two Lean comments by the module docstring of R07.

## R07 (P3) — `Suggested.lean` form

Location: `Suggested.lean` lines 1, 6, 10–12, 25–49, 143–144.

Witness: the namespace is `QuaternionicAnalysisPrototype` instead of `TauCetiRoadmap.QuaternionicAnalysis`; there is no module docstring "<title>: target signatures" naming the headline theorems that are not statable and what each lacks; the predicates `HasLeftQuotientFDerivAt`, `HasRightQuotientFDerivAt`, `LeftFueterAt`, `RightFueterAt`, `LeftFueterOn`, `RightFueterOn` and the constants `qi`, `qj`, `qk` carry no docstring; there are no `/-! ## Layer k -/` section comments.

Repair: rename the namespace, add the module docstring and per-declaration docstrings, order the declarations by layer with section comments.

## R08 (P3) — Padding and unused definitions in `Suggested.lean`

Location: `Suggested.lean` lines 22–23 (`rightMulCLM_apply`, `leftMulCLM_apply`, proved by `rfl`), lines 66–71 (`leftCauchyKernelOrder`, `rightCauchyKernelOrder`), lines 121–133 (composition rules).

Witness: the two `rfl` lemmas restate definitions; the two kernel-order definitions are one-line products that no theorem in the file uses (a definition is kept only to make a headline statable); the composition rules are `HasFDerivAt.comp` followed by a `ContinuousLinearMap.ext` with `mul_assoc`, an API lemma rather than a headline. The one-tactic probe (`rfl`, `simp`, `infer_instance`) closes none of the eleven sorried theorems, so none is trivially closable.

Repair: delete `rightMulCLM_apply`, `leftMulCLM_apply`, `leftCauchyKernelOrder` and `rightCauchyKernelOrder` from `Suggested.lean` (the README keeps the factor-order statements); keep `cauchyFueterKernel` only once R01 states the formula that uses it; consider deleting the composition rules.

## R09 (P3) — README generality differs from the Lean statements

Location: `README.md` lines 51–53 ("exactly when") and 71–74 (`↔`); `Suggested.lean` lines 89–119 and 74–86.

Witness: the README states the product and inverse closure criteria as equivalences and the rigidity classifications as `↔`; the Lean states only the sufficiency direction of each. For rigidity the converse is immediate (`q ↦ a + q*b` has derivative `h ↦ h*b`), so stating one direction is acceptable if the README says so; for the closure criteria the "only if" direction (the product is *not* a left-quotient derivative when `bg ≠ 0` and `f q ∉ ℝ`) is the content the README emphasises and is not in the Lean.

Repair: either state the `iff` forms in Lean (`HasLeftQuotientFDerivAt (f*g) q c ↔ …` for some `c`), or word the README so that the Lean headline is the implication and the converse is a README target.

## Verified sound

**Gate and build.** The worker's gate at e198e11 passes every check. `lake env lean` on `Suggested.lean` at the pins: eleven `declaration uses sorry` warnings and nothing else. Dependency check rerun:

```
depcheck: 208 roadmaps, 1452 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The pull request changes nothing outside the roadmap folder (`git diff --stat origin/main...HEAD`: README.md, Suggested.lean, metadata.toml only).

**Signatures.** `#check @name` for every sorried theorem in a scratch file; each elaborated type agrees with its README statement (connected open `Ω` as `IsOpen Ω`, `IsConnected Ω`; slopes `a + q*b` versus `a + b*q`; conditions `bg = 0 ∨ ∃ r : ℝ, f q = r`). No section variable is lost (the file uses none).

**Ownership.** `roadmaps grep -i 'fueter|quaternionic analysis|quaternion-differentiab|quotient derivative'` across the 439 open pull requests and main: no other roadmap states Fueter regularity, quaternion quotient derivatives or the Cauchy–Fueter formula (hits are unrelated: Hamiltonian reduction, Kolyvagin derivatives). Lean-only grep for `Quaternion ℝ`: only algebraic uses (SemisimpleAlgebras, LieGroups, GeneralizedCohomology), no analysis. This roadmap is the owner. Board packages index: no quaternion package.

**Supplier citations resolved.** DifferentialGeometry on main (`TauCetiRoadmap/DifferentialGeometry/README.md`): Layers 0–2 at lines 268–370, 5.2 `integralTopForm` and `integralTopForm_of_tsupport_subset_chart` at lines 511–517, 5.5 corners Stokes at lines 529–534, the "Boundary and corners" policy at lines 63–91 (which the README's "do not invoke corner Stokes" respects). ConformalMapping is on main. Both precede this roadmap (main). Tau Ceti: `DifferentiableOn.analyticOnNhd_of_finiteDimensional` at `TauCeti/Analysis/Complex/CauchyIntegralPolydisc.lean` line 275 with `[CompleteSpace E]`, `[NormedSpace ℂ V]`, `[FiniteDimensional ℂ V]` (variables at line 255), type `DifferentiableOn ℂ f s → IsOpen s → AnalyticOnNhd ℂ f s`: exactly as the README states.

**Mathlib declarations opened at the pin** (file:line): `QuaternionAlgebra.equivTuple` Algebra/Quaternion.lean:96, `linearEquivTuple` :506, `reₗ`/`imIₗ`/`imJₗ`/`imKₗ` :479–500, `star_mk` :598, `mk_mul_mk` :306 (see R02), `Quaternion.re_mul`/`imI_mul` :823/827; `InnerProductSpace ℝ ℍ` Analysis/Quaternion.lean:60, `Quaternion.linearIsometryEquivTuple` :158; `ContinuousLinearMap.mul` Analysis/Normed/Operator/Mul.lean:39; `hasFDerivAt_of_restrictScalars` Analysis/Calculus/FDeriv/RestrictScalars.lean:89 (hypothesis `f'.restrictScalars 𝕜 = g'`, as the README says); `integral_divergence_of_hasFDerivAt_off_countable` MeasureTheory/Integral/DivergenceTheorem.lean:266 with `face`, `frontFace`, `backFace` exactly as README line 126; `Real.map_linearMap_volume_pi_eq_smul_volume_pi` MeasureTheory/Measure/Lebesgue/Basic.lean:429; `ContinuousOn.hasBoxIntegral` Analysis/BoxIntegral/Integrability.lean:305; `Box.coe_ae_eq_Icc` Analysis/BoxIntegral/Partition/Measure.lean:70; `PiLp.volume_preserving_toLp` MeasureTheory/Measure/Haar/InnerProductSpace.lean:139; `Real.smoothTransition` Analysis/SpecialFunctions/SmoothTransition.lean:146 (zero iff `x ≤ 0`, one for `1 ≤ x`, `contDiff`, `monotone`); `MeasureTheory.integral_fun_norm_addHaar` MeasureTheory/Constructions/HaarToSphere.lean:296 (`dim E • μ.real (ball 0 1) • ∫ y in Ioi 0, y^(dim E − 1) • f y`); `InnerProductSpace.volume_ball_of_dim_even` MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean:359 (`π^k / k!`, so `π²/2` for `k = 2`); `hasFDerivAt_integral_of_dominated_of_fderiv_le` Analysis/Calculus/ParametricIntegral.lean:208; `iteratedFDeriv_succ_eq_comp_left` Analysis/Calculus/ContDiff/FTaylorSeries.lean:843; `ModelWithCorners.ofConvexRange` Geometry/Manifold/IsManifold/Basic.lean:318; `hasFDerivAt_inv'` Analysis/Calculus/FDeriv/Mul.lean:735; `second_derivative_symmetric` Analysis/Calculus/FDeriv/Symmetric.lean:482; `Laplacian` instance Analysis/InnerProductSpace/Laplacian.lean:138.

**Adversarial table.** Values computed by hand with `q = t + ix + jy + kz`, `a = α + iβ + jγ + kδ`.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `Lₐ` matrix (line 25) | `a·q`, rows re, i, j, k | re: `αt−βx−γy−δz`; i: `βt+αx−δy+γz`; j: `γt+δx+αy−βz`; k: `δt−γx+βy+αz` | matches all 16 entries | none |
| `Rₐ` matrix (line 30) | `q·a` | i: `βt+αx+δy−γz`; j: `γt−δx+αy+βz`; k: `δt+γx−βy+αz` | matches | none |
| `Lₐ` component equations (line 36) | partials of the four rows | `K_x=−β=−L_t=M_z=−N_y`; `K_y=−γ=−L_z=−M_t=N_x`; `K_z=−δ=L_y=−M_x=−N_t` | all 12 hold | none |
| `Rₐ` component equations (line 36) | same | `K_x=−β=−L_t=−M_z=N_y`; `K_y=−γ=L_z=−M_t=−N_x`; `K_z=−δ=−L_y=M_x=−N_t` | all 12 hold | none |
| `Rₐ∘R_b = R_{ba}`, `det = ‖a‖⁴` | `R_a R_b q = q b a`; `a = 2`: det `L_2 = 16 = 2⁴` | as stated | holds | none |
| Quotient limit ↔ remainder (line 43) | `h ≠ 0` | `‖h⁻¹(Δ) − b‖ = ‖h⁻¹(Δ − hb)‖ = ‖Δ − hb‖/‖h‖` by norm multiplicativity | iff holds | none |
| Left product criterion (line 51) | `D(fg)(h) = h b_f g(q) + f(q) h b_g`; `h=1` | slope `b_f g(q) + f(q) b_g`; condition `(f(q)h − h f(q)) b_g = 0 ∀h` ⟺ `b_g = 0 ∨ f(q) ∈ ℝ` | exact | none |
| Right product criterion (line 52) | `a_f h g(q) + f(q) a_g h` | condition `a_f(h g(q) − g(q) h) = 0 ∀h` ⟺ `a_f = 0 ∨ g(q) ∈ ℝ` | exact | none |
| Left inverse criterion (line 53) | `D(f⁻¹)(h) = −f(q)⁻¹ h b_f f(q)⁻¹` | slope `−f(q)⁻¹ b_f f(q)⁻¹`; condition `b_f = 0 ∨ f(q)⁻¹` central | exact; Lean slope agrees | none |
| Composition orders (line 54) | left: `(h b_g) b_f = h (b_g b_f)`; right: `a_f (a_g h)` | `b_g*b_f`, `a_f*a_g` | match Lean lines 125, 132 | none |
| `q ↦ q²` (line 56) | derivative `h ↦ hq + qh`, `h = 1` gives `b = 2q`; need `qh = hq` | fails at `q = i` (`ij = k ≠ ji`) ; holds at real `q` | statement "on every nonempty open set" correct | none |
| Loop integrals (lines 61–62) | edges `0→i→i+j→j→0` | `∮ q dq = −½ + (k−½) + (k+½) + ½ = 2k`; `∮ dq q = −½ + (−k−½) + (½−k) + ½ = −2k` | both match | none |
| Rigidity direction (line 72) | `f = a + q b`: `Df(h) = h b = R_b` | matches `HasLeftQuotientFDerivAt` | ← direction trivial; → is Sudbery's Thm 1 | none |
| Complex structure (line 12) | `λ(v + jw) = λv + j λ̄ w` | coordinates `(v, w̄) ↦ (λv, λ w̄)`: ℂ-linear; `R_b(λq) = λ R_b(q)` | `Φₗ(q) = (v, conj w)` correct | none |
| Second-derivative step (line 76) | `h Db(k) = k Db(h)`, `k = 1`, then `h = i, k = j` | `Db(h) = h c`; `(ij − ji)c = 2kc = 0 ⟹ c = 0` | holds | none |
| Simultaneous slopes (line 78) | `a h = h b ∀h`; `h = 1` | `a = b`; then `ah = ha ∀h` ⟹ `a ∈ ℝ` | matches Lean line 140 | none |
| `T(f)` side change (line 76) | `D(Tf)(q̄)(h) = conj(a conj h) = h ā` | right slope `a` ↦ left slope `ā` at `q̄` | holds | none |
| Left Fueter system (line 99) | `i∂ₓf`, `j∂ᵧf`, `k∂_zf` expanded | k-part: `N_t + M_x − L_y + K_z` | all four rows match | none |
| Right Fueter system (line 101) | `(∂ₓf)i` etc. | k-part: `N_t − M_x + L_y + K_z` | all four rows match | none |
| Fueter of affine maps (line 105) | `D = R_b`: `b + i·ib + j·jb + k·kb` | `b − 3b = −2b`; right: `b + bi² + bj² + bk² = −2b` | both `−2b` | none |
| `t + ix` (line 105) | `∂ₜf = 1`, `∂ₓf = i` | left `1 + i·i = 0`, right `1 + i·i = 0`; `D(j) = 0 ≠ j = R_1(j)` | nonconstant, regular, not a multiplication map | none |
| `T` interchanges regularity (line 105) | `D' = D(Tf)`: `D'(1) + iD'(i) + …` | `= conj(D(1) + D(i)i + D(j)j + D(k)k)` | left-Fueter of `Tf` ⟺ right-Fueter of `f` | none |
| `Dq` on `insertNth` triples (line 126) | `i = 0..3` | `(e_x,e_y,e_z) ↦ 1`; `(e_t,e_y,e_z) ↦ −i`; `(e_t,e_x,e_z) ↦ +j` (since `dt∧dz∧dx` gives `−1`); `(e_t,e_x,e_y) ↦ −k` | `(−1)^i eᵢ` | none |
| `σ*Dq = −conj(Dq)` (line 115) | `σ = diag(1,−1,−1,−1)` | `σ*(dx∧dy∧dz) = −dx∧dy∧dz`, the three `dt∧…` terms fixed | equals `−conj(Dq)` | none |
| Divergence of `eᵢ f` and of the cutoff field (lines 137, 149) | `Σ∂ᵢ(eᵢ f) = ∂̄ₗf`; `Σ∂ᵢ(G eᵢ f ψ)` | `= G (Σ eᵢ ∂ᵢψ) f = ε⁻¹ψ'(|r|/ε) (r̄/|r|⁴)(r/|r|) f = ε⁻¹ψ' |r|⁻³ f` | matches line 149 | none |
| Radial mass (line 149) | `integral_fun_norm_addHaar`, `dim 4`, `vol(ball) = π²/2` | `4 · (π²/2) · ∫₀^∞ ε⁻¹ψ'(r/ε) dr = 2π² · 1` | normalisation `1/(2π²)` correct | none |
| Kernel identity (line 146) | `∂ᵢ(G eᵢ f) = (∂ᵢG) eᵢ f + G eᵢ ∂ᵢf` | sum `= (∂̄ᵣG) f + G (∂̄ₗf)` | holds | none |
| Homogeneity (line 183) | `G(λr) = λ r̄ / (λ⁴|r|⁴)` | `λ⁻³ G(r)` | holds | none |
| Power-series variable (lines 162–165) | `|r−h|² = |r|²(1−u)` | `u = (2⟨r,h⟩ − |h|²)/|r|²`, `|u| ≤ 2‖h‖/δ + (‖h‖/δ)²` | holds | none |
| Totalized change of variables (line 133) | nonintegrable `w` | `MeasurableEmbedding.integral_map`, `integral_smul_measure`, `Measure.restrict_map` are unconditional | identity true without integrability | none |
| Laplacian factorisation (line 159) | cross terms `−ij∂ₓ∂ᵧ − ji∂ᵧ∂ₓ` | `−(ij + ji)∂ₓ∂ᵧ = 0`; `−i·i∂ₓ² = ∂ₓ²` | `Δf` both sides | none |

**Vacuity and context.** Every sorried theorem names the roadmap's own predicates on `Quaternion ℝ`; the rigidity theorems carry `IsOpen Ω` and `IsConnected Ω` (so `Ω` nonempty), the analyticity theorems `IsOpen Ω`; no hypothesis contains its conclusion.

**Sampled targets.** The README has no numbered locators to sample (R05); the fifteen statements the worker's sample would have covered were instead recomputed in the table above.

## Not verifiable

- A. Sudbery, *Quaternionic analysis*, Math. Proc. Cambridge Philos. Soc. 85 (1979): the DOI resolves only to the paywalled Cambridge Core abstract page; the sources service found no legal copy; a web search found no author-page or institutional copy (only an unofficial Scribd upload, not used). Recorded in `needs-references.toml` as `sudbery1979`. The theorem statements attributed to it (rigidity, Cauchy theorem, Cauchy–Fueter formula with `1/(2π²)`, the kernel `(q−q₀)⁻¹/|q−q₀|²`, the form `Dq`) were verified by direct computation, not against the text.
- "MATH3680 Complex Analysis notes, pages 74–75": unpublished course notes without author or institution; not locatable, not a legal source.
- Ownership against open pull requests was checked through `roadmaps grep` over all 439 open pull requests and main.

## Source issues

- none
