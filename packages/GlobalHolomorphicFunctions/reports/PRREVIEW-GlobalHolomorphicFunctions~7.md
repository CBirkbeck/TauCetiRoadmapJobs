# Review of GlobalHolomorphicFunctions (pull request #992 at df49770)

**Verdict:** needs changes

Five findings, one blocking. This head repairs four of the previous review's five findings (R02–R05). The blocking finding, the ownership conflict with ComplexKahlerGeometry's open revision, is unchanged.

The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with exactly 22 `sorry` warnings. Every sampled locator opens on the cited statement. The four new findings are P3:

- Layers 0.3 and 2.4 plan results that Tau Ceti already states.
- Layers 6.2 and 2.4 plan second proofs of pinned theorems.
- One Mathlib name in the supplier contract is wrong.
- The pull-request description still makes DifferentialGeometry a merge prerequisite.

## Repairs of the previous review's findings

- **R01 (P2, ownership of the finite-rank Runge operator, scalar Runge, the scalar ∂̄ solver and planar two-form exactness): not repaired.** `README.md:58`–59, `:1105`, `:2004`–2005, `:2130` and `:2134`–2137 still say that ComplexKahlerGeometry consumes these objects. ComplexKahlerGeometry's revision still claims them (R01 below).
- **R02 (Layer 7.2 planned native coordinate facts): repaired.**
  - `README.md:1936`–1938 now reads "a smooth form by `isSmoothForm_ofFunction_iff`, and `d v` is then smooth by `isSmoothForm_mextDeriv`".
  - `:1958`–1969 assembles `du` from `mpullback_mextDeriv_ofFunction_apply` and `mpullback_complexDz`, and keeps as a target only "the comparison of coefficients".
  - `:2013`–2014 says the decomposition is native. The contract (`:181`–199) and *Needs:* (`:2037`–2047) list all four declarations.
- **R03 (Layer 2.3 rebuilt the germ algebra): repaired.**
  - `:978`–985 consumes `holomorphicGerms K` and "Define O(K) as its range", with the value map `x ↦ holomorphicGerms.eval x x.2 g`.
  - Restriction is `holomorphicGerms.eval_restrict` (`:989`).
  - The contract `:223`–230 cites the germ API.
- **R04 (the exhaustion theorem does not name its stages): repaired.**
  - 2.1 (`:839`–853) defines `K_n=closedBall 0 (n+1) \ thickening (n+1)⁻¹ Ωᶜ`, cites `IsOpen.isFilledIn_closedBall_sdiff_thickening`, and proves the nesting, the union and the cofinality.
  - `:916`–917 reads "Its compactness is native; the nesting … and the cofinality … are proved in 2.1".
  - The contract (`:175`–176) cites the existential theorem "only where an unspecified exhaustion suffices".
- **R05 (isolated singularities cited Theorem 12.1): repaired.**
  - `:1413`–1416 cites "Rainer, Theorem 15.7, pp. 39–40 (rainer line 2126), which in addition prescribes a vanishing order".
  - `Suggested.lean:218`–220 cites the same theorem.
  - rainer lines 2126–2129 confirm both.

## R01 (P2) — This roadmap and ComplexKahlerGeometry's open revision both own the finite-rank Runge operator, scalar Runge, the scalar ∂̄ solver and planar complex two-form exactness

**Location.** `TauCetiRoadmap/GlobalHolomorphicFunctions/README.md:58`–59 reads: "ComplexKahlerGeometry K2 owns parameter-dependent solvers … they consume this roadmap's scalar results and complex two-form exactness." The same claim is at `:1105`, `:2004`–2005, `:2130` and `:2134`–2137. Lean: `Suggested.lean:125`, `:150`, `:263`, `:300`.

**Claim.** ComplexKahlerGeometry consumes these four objects from this roadmap.

**Witness.** ComplexKahlerGeometry #1398 (`1038b167`), `README.md:29`–32 and `:56`–59: Layer 2 owns finite-rank Runge and the parameter solver (scalar case `:617`), Layer 5 planar exactness (`:1621`–1628); nothing is imported from this roadmap. `Suggested.lean:74` states the operator.

ComplexKahlerGeometry on main consumes them instead (`README.md:35`, `:199`–200, `:1637`). Once #1398 merges, each object has two owners.

**Repair.** Agree one owner per object before either pull request merges.

- **(a) This roadmap consumes them.** ComplexKahlerGeometry is on main, so this is the direction the merge order allows.
  - Add `### From TauCetiRoadmap.ComplexKahlerGeometry`, citing Layer 2's scalar Runge, `finite_rank_runge_approximation`, the scalar case of `mixed_parameter_solver`, and Layer 5's complex two-form exactness.
  - Delete `exists_finite_rank_runge_operator`, `exists_smooth_conjWirtingerDeriv_eq` and `exists_mextDeriv_eq_complex_two_form`.
  - Reduce `isRungeCompactPair_iff_approximation` to what that layer does not state.
  - Make 2.5 (`:1105`–1117), 7.1 (`:1856`–1883) and the complex case of 7.2 (`:1989`–1992) consume them.
  - Delete `:58`–59, `:2004`–2005 and `:2134`–2137.
  - Name the revision in this pull request's merge-order paragraph.
- **(b) The revision gives the objects back.** The ComplexKahlerGeometry revision drops these claims and consumes GH0 and GH5 again. That is #1398's change, and this pull request's description must then state that order.

Tested on the instance: with (a), `finite_rank_runge_approximation` at `g′ⱼ = wⱼ gⱼ` yields the bound `‖f z − Σ wⱼ f(ζⱼ) gⱼ z‖ ≤ εB` of `:150` symbol for symbol.

## R02 (P3) — Layers 0.3 and 2.4 plan results that Tau Ceti already states

**Location.**

- `README.md:539`–543: "Prove here what the native transform does not state. … prove that `Tφ` itself is smooth with every derivative transferred to the datum".
- The API at `:562`–563.
- 2.4 at `:1026`–1031: "the integral estimate … and the finite-cycle version by summing with the cycle coefficients".
- `:2134`: "K2 consumes Layer 0.3's derivative transfer".

**Witness.** All in Tau Ceti at the pin:

- `Analysis/Complex/Pompeiu/Basic.lean:219` `HasCompactSupport.hasFDerivAt_integral_sub_inv_smul`: the transform's derivative is the transform of `fderiv φ`.
- `Pompeiu/Parameter.lean:75`: the transform is jointly `Cⁿ`.
- `Analysis/Contour/Cycle/Basic.lean:400` `norm_integral_le_of_norm_le_const`: the cycle-integral norm bound.

**Repair.**

- Cite `HasCompactSupport.hasFDerivAt_integral_sub_inv_smul`, `contDiffOn_integral_sub_inv_smul_with_param`, `Contour.Cycle.norm_integral_le_of_norm_le_const`, and `Contour.Cycle.integral_add` (`:377`) with `integral_smul` (`:387`) under `From Tau Ceti` and in the *Needs:* of 0.3 and 2.4.
- Replace the sentence at `:541`–543 by these citations. `∂^α(Tφ)=T(∂^αφ)` is `:219` iterated. Smoothness is `:75`, or Mathlib `HasCompactSupport.contDiff_convolution_right` with `Complex.locallyIntegrable_inv`, as used at `Wirtinger/Potential.lean:47`.
- Keep as 0.3 targets the bounded-measurable integrability, linearity and translation laws, and the uniform Riemann-sum lemma.
- In 2.4, derive the cycle bound from `:400` applied to `f − g`.
- At `:2134`, say that K2 consumes Tau Ceti's derivative transfer and this roadmap's Riemann-sum estimate.

Tested on the instance: for a smooth bump `φ`, `:219` evaluated at `v = 1` gives `∂ₓ(Tφ) = T(φₓ)`.

## R03 (P3) — Layers 6.2 and 2.4 plan second proofs of theorems already at the pins

**Location.**

- 6.2 `README.md:1515`–1517: "Use the following strip argument as a worked comparison route for the supplied paired cotangent identity".
- `:1562`–1566: "compare this independently constructed proof with the existing native theorem afterwards … This alternative does not remove the existing … examples".
- 2.4 `:1032`–1037: "Also give a disk-Morera proof of compact-open holomorphic closure".

**Claim.** These subsections are targets ("Prove … Prove uniform bounds … Determine the constant"). Yet `:1580` concedes that 6.2 "does not define an additional theorem of the library".

**Witness.** Mathlib `cot_series_rep` (`Trigonometric/Cotangent.lean:233`): `π cot(πx) = 1/x + Σ' n:ℕ+, (1/(x−n)+1/(x+n))` on `ℂ_ℤ`, which is 6.2's conclusion `c = q`. The closedness is Tau Ceti `isClosed_holomorphicFunctions` (`HolomorphicFunctions/Basic.lean:173`).

**Repair.**

- Delete 6.2. If wanted, move its computed values into 6.1's Checks as values of the consumed series: `S₁ = (π coth π − 1)/2` and `q(iy) → −πi`.
- Delete the disk-Morera sentence of 2.4. Keep 2.4's integral-continuity statement.
- The narrative at `:1562`–1566 goes with 6.2.

Tested on the instance: at `x = i`, `cot_series_rep` and the 6.2 series both give `−3.153348i = −iπ coth π`.

## R04 (P3) — `AnalyticOnNhd.divisor_apply` is not the declaration's name

**Location.** `README.md:97` ("Use `AnalyticOnNhd.divisor_apply`") and `:652`.

**Witness.** `Mathlib/Analysis/Meromorphic/Divisor.lean:79` declares it inside `namespace MeromorphicOn` (`:30`). At the pin, `#check @AnalyticOnNhd.divisor_apply` fails with "Unknown constant". `#check @MeromorphicOn.AnalyticOnNhd.divisor_apply` elaborates.

**Repair.** Write `MeromorphicOn.AnalyticOnNhd.divisor_apply` at both places. That name elaborates at the pin; its conclusion is `divisor f U z = ((analyticOrderAt f z).map (↑)).untop₀`.

## R05 (P3) — The pull-request description makes DifferentialGeometry a merge prerequisite that the README rules out

**Location.** The description of #992:

- "- [ ] depends on: #886".
- "Dependencies: DifferentialGeometry #886 supplies generic forms and finite-cycle Green".
- The resulting merge-order paragraph: "#886 (DifferentialGeometry) → #1126 … → this pull request".

**Witness.**

- `README.md:22`–26 assigns the forms, the wedge and cycle Green to Tau Ceti and says "DifferentialGeometry is not a supplier". That is the folder's only mention of DifferentialGeometry.
- The description also describes a `ProductCotangentTargets.lean` that the folder does not contain.

**Repair.**

- Delete the `depends on: #886` line, the DifferentialGeometry sentence and the `ProductCotangentTargets.lean` sentence.
- The chain becomes #1126 → this pull request, plus the ComplexKahlerGeometry revision if R01 takes route (a).

Tested on the instance: the README's only DifferentialGeometry line is `:26`, so no target is left without a supplier.

## Verified sound

**Gate and build.**

- **Gate.** The brief's gate on `df49770` printed every check at 0, then `OK`.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.CV"`).
- **Build.** `lake env lean TauCetiRoadmap/GlobalHolomorphicFunctions/Suggested.lean` (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`) exits 0 with exactly 22 `declaration uses sorry` warnings, at lines 51, 71, 90, 106, 125, 137, 150, 168, 178, 187, 195, 209, 221, 234, 246, 263, 272, 283, 300, 308, 316 and 323.
- **Signatures.** `#check @name` for all 24 declarations elaborated with no errors. The file has no `variable` line, so no binder is lost. I compared each printed type with its README statement, including the `↑⊤` smoothness order in the form statements; nothing differs. The Lean statements are unchanged since `db419f3` apart from three docstrings.
- **One-tactic probe, on scratch copies.**
  - `first | rfl | infer_instance | simp | norm_num | aesop` closed 0 of 22.
  - `exact?` closed 0 of 22.
  - No padding was found.

**Dependency check.** The brief's command printed exactly:

```text
depcheck: 238 roadmaps, 2322 edges, 0 problem(s)
```

The merge order has ZerosOfLFunctions at 48, AnalyticNumberTheoryPartI at 50 and this roadmap at 97. ComplexKahlerGeometry, ZerosOfLFunctions and Hyperfunctions are on main, and ConformalMapping is under `Completed/`.

**Citations resolved, at the copy named.**

- **ZerosOfLFunctions (main).** 5.1 is at `:929`, 5.2 at `:938` (`E₁`, `deriv E₁ z = −z exp z`, `logDeriv`, the small-disk estimate), 5.3 at `:957` and 5.4 at `:979`.
- **AnalyticNumberTheoryPartI (#1126, via `roadmaps show`).**
  - §0.15 (`:531`) has `elementaryFactor`, `exists_entire_primary_product_exact`, the sharp disc estimate, compact-sup products and fibre grouping.
  - §0.15a (`:555`) has `exists_entire_exp_mul_of_divisor_eq`, both nontriviality hypotheses, and the factorization sentence the contract `:244`–258 restates.
- **ConformalMapping (`Completed/`).** §5.3, the Jordan curve theorem with components and filled hull, is at `:787`. Its line `:1374` still says this roadmap "restates §1.1"; that line is stale in ConformalMapping and has no counterpart here, since 2.2 (`:946`–948) consumes nothing from §1.1.
- **Downstream citations of this roadmap.**
  - ComplexKahlerGeometry on main cites GH0, GH2 (4.1's Laurent extraction), GH5 and GH5.1, all present.
  - Hyperfunctions on main cites GH0.
  - RelativisticQuantumFieldTheory #1772 cites GH2's local Laurent phase (4.1).
  - AutomorphicSpectralTheoryPartII #1761 cites a heading "Preparatory primary factors and locally uniform products" that this head does not carry. This roadmap is not on main, so that is #1761's citation to repoint to AnalyticNumberTheoryPartI §0.15; no id is dropped from main.

**Pinned declarations opened.** Tau Ceti `2fd255d9`, all under `TauCeti/`:

- **Forms (`Geometry/Manifold/DifferentialForm/`).** All of these elaborated in a scratch `#check` file:
  - `RoughForm.ofFunction`, `IsSmoothForm`, `SmoothForm`, `mextDeriv`, `mextDeriv_ofFunction`.
  - `Regularity.lean:387` `isSmoothForm_ofFunction_iff` (`[IsManifold I 1 M]`) and `:223` `isSmoothForm_mextDeriv` (`n + 1 ≤ p`).
  - `Squared.lean:72` and `:92`.
  - `Wedge/Basic.lean:238`, `:269` (the determinant `μ(φv)(ψw) − μ(φw)(ψv)`) and `:370`.
  - `Wedge/Leibniz.lean:97`.
  - `Pullback/Basic.lean:247`.
  - `Naturality.lean:50` and its global form.
  - `Opens.lean:63`, `:72`, `:354`.
  - `Plane/Complex.lean:51`, `:56`, `:103` (`f^*dz = ∂f dz + ∂̄f dz̄`, no regularity hypothesis) and `:117`.
- **de Rham.** `DeRham/Basic.lean:109`, `:121` (`[IsManifold I 2 M]`, `[FiniteDimensional ℝ E]`, `finrank ℝ E ≤ k`), `:159`, `:170`.
- **Holomorphic functions and germs.**
  - `HolomorphicFunctions/Basic.lean:71`, `:82`, `:91`, `:118`, `:125`, `:149`, `:155`, `:161`, `:173`.
  - `Jet.lean:39`, `:72`, `:95`; `RestrictionEstimate.lean:45`, `:79`; `HolomorphicFunctions/Germ.lean:45`.
  - `Germ/Algebra.lean:37`, `:63`, `:112`, `:132`, `:169`. At `s = ∅`, `Germ ⊥ ℂ` is trivial, as the contract says.
- **Exhaustion.** `Analysis/Normed/Module/Exhaustion.lean:57` (`0 ≤ r`, `0 < δ`) and `:86`. Its proof (`:89`–96) uses the same open set `ball 0 (n+2) \ cthickening (n+2)⁻¹ Ωᶜ` as 2.1's nesting proof.
- **Topology and contour.** `Topology/FilledIn.lean:61`; `Contour/Cycle/Basic.lean:261`, `:377`, `:387`, `:400`, `:447`.
- **Analysis.** `Green/Cycle.lean:36`; `Pompeiu/Basic.lean:163`, `:219`, `:261`, `:286`; `Pompeiu/Parameter.lean:75`, `:124`; `Wirtinger/Basic.lean:91`, `:96`, `:102`, `:170` (no product rule at the pin, so 0.1's product rule stands); `Wirtinger/Holomorphic.lean:53`; `Wirtinger/Potential.lean:41`; `CauchyKernel.lean:44`; `Conformal/Morera.lean:40`.

Mathlib `1b1ccf4b`: every name in the `From Mathlib` contract elaborated in a scratch `#check` file, except R04's. The files I checked by source are:

- `Topology/LocallyFinsupp.lean:50` (support inside `U`, locally finite within `U`) and `Analysis/Meromorphic/Divisor.lean:40`, `:79`.
- `Analysis/Complex/Exponential.lean:679` and `Log/Summable.lean:166`.
- `Geometry/Manifold/ContMDiff/NormedSpace.lean:63`.
- `Trigonometric/Cotangent.lean:233`.

**Sources: the seeded sample.** Rainer is the institutional copy; printed page = PDF page − 6.

- **0.2, Gray–Morris.** Theorem 3 is at gray-morris line 66 (p. 247): four partials everywhere, CR everywhere, `f` continuous. Lemma 1 is at lines 315–325 (pp. 252–253) and the proof at lines 337–394 (pp. 253–254). The README's balanced-rectangle and local-Baire versions repair the source issues below.
- **0.3.** Theorem 10.2 is at rainer line 1255 (p. 23, proof p. 24), with kernel `−π⁻¹∫f/(ζ−z) = π⁻¹∫f/(z−ζ)`. Theorem 10.3 is at line 1295 (p. 24).
- **1.1.** Remark 15.4 at rainer line 2030 (p. 38) defines `E_p = (1−z)exp(z+…+z^p/p)`.
- **2.2.** rainer lines 1313–1332 (p. 25) cover (11.2) and Exercises 19–20.
- **3.1.** Proposition 15.2 is at rainer line 1950 (p. 36; `K = K̂_U`, `f ∈ O(K)` nonvanishing). Theorem 15.3 is at line 1997 (pp. 37–38).
- **3.2 and 3.3.** Theorem 15.5 is at rainer line 2086 (p. 39), stated for a region. The README states the arbitrary-open strengthening as its own.
- **4.1.** Theorem 12.1 is at rainer line 1603 (p. 31; `p_a ∈ H(ℂ∖{a})`) and Theorem 15.7 at line 2126 (pp. 39–40). Line 1701 derives 12.1 with local `p_a ∈ H(U_a∖{a})` from Cousin I.
- **6.1, 6.2, 6.3.** These cite no locator and are derived. Every value is recomputed in the table.
- **6.4.** Theorem 11.7 is at rainer line 1550 (p. 29).
- **6.5.** Proposition 10.1 is at rainer line 1216 (p. 23), with sign `(2πi)⁻¹∬∂̄f/(ζ−z)dζ∧dζ̄` and `dζ∧dζ̄ = −2i dA` (line 1253).
- **7.1.** Theorem 12.2 is at rainer line 1630 (p. 31).
- **7.2.** This section has no source locator; its native declarations are listed above.
- **7.3.** §10 opens at rainer line 1190. (10.1) is at line 1211 and the polar estimate at line 1237 (p. 23).
- **7.4.** Proposition 12.3 is at rainer line 1658 and Theorem 12.4 at line 1689 (p. 32), with Rainer's convention `f_ik = f_ij + f_jk`.

Also checked:

- Theorem 14.3 is at rainer line 1868 (pp. 35–36). Its hypothesis is uniform convergence of `Σ|f_n|` on compacts, which is 1.5's uniform tail.
- The monomial remark in the proof of Proposition 14.2 is at line 1852 (p. 35).
- Lemma 11.3 is at line 1437 (pp. 27–28).
- Domain means "nonempty open" (line 81).

**Ownership by object.** I ran `roadmaps grep` over main and 469 open heads for Looman–Menchoff, Mittag-Leffler, Cousin, finite-rank Runge, holomorphic hull, Cauchy–Pompeiu, planar two-form exactness and Runge.

- Looman–Menchoff has no other hit.
- The Mittag-Leffler hits are the inverse-limit condition, a different object. The Cousin hits are Cousin complexes (SchemeAndStackFoundations, AutomorphicBundlesPartII), also different.
- The holomorphic hull in RealAnalyticGeometry is the several-variable Stein hull.
- PseudoholomorphicCurveAnalysis 3.1 (main, `:537`–575) owns Hölder and `Lᵖ` bounds for `T`, not the cycle Cauchy–Pompeiu formula.
- ComplexComparisonPartII #848 only cites ComplexKahlerGeometry K2.
- The only second owner is ComplexKahlerGeometry #1398 (R01).

**Adversarial pass.** S = `Suggested.lean`, R = `README.md`. The values were recomputed this round; numerical values come from a scratch script.

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| S Looman–Menchoff | f=z; f=z̄; Looman exp(−z⁻⁴), 0 at 0; Ω=∅ | fₓ=1, f_y=i=i·fₓ; f_y=−i≠i (excluded); CR everywhere but \|f\|→∞ along arg z=π/4, so excluded by `ContinuousOn`; vacuous | Pass |
| R 0.2 balanced estimate vs Gray–Morris Lemma 1 | R=[0,3]×[0,1], E={(0,0),(3,1)}, N=1; balanced R | sup of LHS 21 > 15 = 5N·m(R∖E); N(2w_J+h_J) ≤ N(4h_R+h_R) = 5N h_R | Pass (source issue) |
| R 0.2 grid and square-to-ball | 3×1 rectangle, N=1; r=1 | δ=1, cells 1×1 in [δ/2,δ]; area 4 vs 2π, factor π/2 | Pass |
| R 0.3 kernel sign | radial cutoff, φ(0)=1 | ∫(πζ)⁻¹∂̄φ dA = ∫₀¹φ′ = −1 = −φ(0); Rainer (10.4) gives the same kernel z−ζ | Pass |
| R 0.3 derivative transfer | smooth bump φ | `Pompeiu/Basic.lean:219` at v=1: ∂ₓ(Tφ)=T(φₓ) | Native (R02) |
| R 1.1 derivatives | E₂′(−1); E₁′(1); E₀′(0.3+0.2i); E₃′/E₃ at 0.4+0.1i | −0.606531 = −e^{−1/2}; −2.718282 = −e; −1.000000; −0.071622−0.090270i on both sides | Pass |
| R 1.1 log bound | 60 radii × 360 angles; w=1/2; w=1 | max(log\|E₁\|−\|w\|²) = −0.00014; −0.193147 ≤ 0.25; log 0 = 0 ≤ 1 | Pass |
| S `exists_entire_genusOne_product` | S=∅; S={1}, m=2; S={2}, m=0 | F=1; (1−z)²e^{2z} with order and divisor 2; factor 1, order 0, Σ-index `Fin 0` empty | Pass |
| S `…_of_divisor` | D=0; D=2[1] | F=1, divisor 0; Σ D/\|ρ\|² = 2, `toNat` 2 | Pass |
| S sharp bound | u=(1,1), (1,−1), (−1,0), ∅; 20 000 random families of size ≤ 5 | 3≤3 (Mathlib's bound 6.389); 1≤3; 1≤1; 0≤0; max(LHS−RHS) = 2.2·10⁻¹⁶ | Pass |
| R 1.3 genus | aₙ=n; aₙ=2ⁿ | Σ1/n=∞ and Σ1/n²<∞, so genus 1; Σ2⁻ⁿ=1, so genus 0, with tail 2^{1−N} | Pass |
| R 1.5 boundedness hypothesis | u₀(x)=x, uₙ=1/n² on X=ℕ; X=ℕ indicator family | tails → 0 uniformly, but P_M−P_N=(1+x)(…) is not uniformly small, so the hypothesis is needed; tail 1/(N+1), Σ sup = ∞ | Pass |
| S `IsRungeCompactPair` | (∅,∅); unit circle in ℂ; 2≤\|z\|≤3 in D₄; same K in 1<\|z\|<4 | true (a component of open Ω cannot be relatively compact in Ω); false; false; true | Pass |
| S `holomorphicHull` | K=∅; circle in ℂ; annulus in 1<\|z\|<4 | ∅ (f=0, B=−1); closed disk; K (1/z) | Pass |
| R 2.1 stages | Ω=D; Ω=ℂ; Ω=∅; radius n+1 instead of (n+1)⁻¹ | K₀={0}, K₁={\|z\|≤1/2}, K₂={\|z\|≤2/3}, 0∈int K₁; closedBall 0 (n+1); ∅; every stage empty | Pass |
| R 2.1 distance and convex hull | K={2≤\|z\|≤3}, Ω=D₄ | dist(K,Ωᶜ)=dist(K̂,Ωᶜ)=1; K̂ = closed 3-disk = conv K | Pass |
| R 2.2 metric | U=∅; constants differing by 1; 1/(n+1) on ℂ; t=1; zⁿ/n on D | 0; Σ2⁻ⁿ/2 = 1/2; 1/(n+2); min(1,t)/2 = t/(1+t) = 1/2; sup norms 1/n and 1 | Pass |
| R 2.3 O(K) | K=∅; {0,1}; {0}; εz̄; Σzⁿ/(n+1)² | one element; a+(b−a)z; O(K)=ℂ while the germ algebra is infinite-dimensional; ∂̄=ε≠0; Σn/(n+1)²=∞ | Pass |
| R 2.4 estimate | unit circle with f−g=1; reversed | 0≤2π; ∮dz/z = −2πi, length 2π | Native (R02) |
| S Runge equivalence | annulus in D₄ with f=1/z; closed unit disk in D₂; (∅,∅) | period 2πi on \|z\|=5/2 vs 0 for g∈H(D₄), so the RHS fails for ε<2/5 and both sides are false; both true; both true | Pass |
| S `holomorphicHull_eq_fill` | K=∅, Ω=D₁; unit circle in ℂ | ∅ on both sides; closed disk on both sides | Pass |
| S finite-rank operator | K={0}, U=Ω=ℂ, f=c; K=∅ | N=1, ζ=0, w=1, g=1, error 0 ≤ εB; L=∅, N=0, vacuous; the revision's form with g′=wg is identical | Pass (R01) |
| S zero-free approximation | annulus with u=z; Ω=∅ | g=z, nowhere zero, winding 1 (exponentials give 0); vacuous | Pass |
| S zero orders and divisor | m=0; m=2[2]; ν=2[0]−[1] | f=1; (z−2)²; z²/(z−1) with orders 2, −1 and order ≠ ⊤ | Pass |
| S boundary germ | Ω=∅, ℂ; ℂ∖{0} at ξ=0; ℂ∖ℝ at 0 | vacuous; zeros accumulating at 0 force F's order at 0 to be ⊤, so F vanishes near 0, contradicting f's isolated zeros; both half-disk components | Pass |
| S Mittag-Leffler | E=∅; E={0}, P=1/z²+z | f=0; f=1/z², g=−z analytic | Pass |
| S isolated singularities | P=exp(1/z); P=1/z+1/(z−1/2) on ball(0,1/2) | f=P, g=0; f=1/z, g=−1/(z−1/2), analytic at 0; Rainer 15.7 (line 2126) accepts it and 12.1 excludes it | Pass |
| S quotient | F=1/z; F≡0 on one component; Ω=∅ | f=1, g=z; f=0, g=1; vacuous | Pass |
| R 6.1 products | cos at 1/4; 1/Γ(1/2); shifted sine at α=0.3, z=0.2; α=1/2 | 0.707107 = cos(π/4); 0.564190 = 1/√π; 1.0000004 vs sin(π/2)=1 (truncation); pairing n ↔ −n−1 gives 1−4z²/(2n+1)² | Pass |
| R 6.2 strip | z=i; z=1/2+i, n=1; y=1 | \|q(i)\| = 3.153348 ≤ 4+3π/2 = 8.712389; 1.1094 ≤ 2.4; strip sum 1.564940 ≤ 1+π/2; S₁ = 1.076674, π/2−S₁ = 0.494123 | Pass (R03) |
| R 6.3 theta and lattice | r=1/2, z=0.3+0.1i; Manhattan shells N=1, 2 | ratio 1.474234−0.147917i = r⁻¹e^{−z}; 4 points, Σ\|λ\|⁻³ = 4 ≤ 11.314; 8 points, 1.914 ≤ 2.828 | Pass |
| R 6.4 crescent | z=−1/2; −t; −1+t; z=0 | \|2z−1\|=2; \|1/z\|=1/t; \|2z−1\| = 3−2t > 1; 0∉Ω because \|−1\|=1 | Pass |
| S `cauchyPompeiu` | unit disk with f=\|z\|², ξ=0.3; f=z̄, ξ=0.3; f=1, ξ=0 | boundary 1, area π⁻¹∫z/(z−ξ) = 1−\|ξ\|² = 0.91, so f(ξ)=0.09; residues −1/ξ+1/ξ = 0 and area −ξ̄, so ξ̄; 1−0 | Pass |
| R 6.5 Euler example | z=1 | z e^{z/2}∏ = 1.718282 = e−1 | Pass |
| S ∂̄ solver | f=z̄; f=z; f=z e^{−\|z\|²} | u=z̄²/2 (1 at z=1); \|z\|²; −e^{−\|z\|²} (e⁻¹ at 1) | Pass |
| S closed completion, scalar | f=z with g=z̄; f=z̄ with g=0 | gₓ+ig_y = 2 = fₓ−if_y; 0 = 1−i(−i) | Pass |
| S closed completion, form | f=z, g=z̄; g=0 | d(z̄dz+zdz̄) = dz̄∧dz+dz∧dz̄ = 0; dz∧dz̄ has value −2i on (1,i) | Pass |
| S complex exactness | η=dz∧dz̄ | h=1, u=z̄, d(−z̄dz) = dz∧dz̄; +u dz gives +2i | Pass |
| S real exactness | η=dx∧dy | u=z̄/2, β=(x dy−y dx)/2, dβ(1,i)=1; the swapped β gives 0 | Pass |
| S `H²` vanishing | U=∅, ℂ; the circle | only the zero form; [dx∧dy]=0; on S¹ every one-form is closed yet H¹=ℝ; no instance found by the probe | Pass |
| R 7.2 coefficients and evaluations | u=z̄; dz, dz̄, dx, dy on (1,i) | `mpullback_complexDz`: 0·dz+1·dz̄; rows (1,i), (1,−i), (1,0), (0,1); `wedgeWith_apply_one_one`: −2i and 1 | Pass |
| R 7.3 examples | z=1, i, 2; moments | d(iz²), d(i\|z\|²) give 2i, 2i at 1 and −2, 0 at i; 4 and 32; log 2 on both sides; π, 0, π/2 | Pass |
| S Cousin I | c₁₂=1; one set; empty cover; ℕ copies of Ω with c=0 | b=(1,0); 3c₁₁=0; vacuous; b=0; c_ji=−c_ij gives Rainer's f_ik=f_ij+f_jk, and b_i−b_j = Σρ_k(c_ik+c_kj) = c_ij | Pass |
| R consumed factorization | f=z; (z−1)²; e^z | m=1, P=1, g=0; P=(1−z)², g=0; P=1, g=z | Pass |
| R Conventions | annulus 1<\|z\|<2 | index 1−1=0 at 0; area 4π−π=3π | Pass |

The table has 45 rows, each with computed values. It covers the seeded sample (0.2, 0.3, 1.1, 2.2, 3.1, 3.2, 3.3, 6.1, 6.2, 6.4, 6.5, 7.1–7.4), all 22 headline theorems with both definitions, and every target a finding touches.

## Not verifiable

- Gray–Morris defer Lemma 1's proof to Saks, *Theory of the Integral* (their [34, 198]), which I did not read. The source issues below rest on the counterexample and the text at gray-morris lines 315–345.
- I read AnalyticNumberTheoryPartI #1126, AutomorphicSpectralTheoryPartII #1761 and RelativisticQuantumFieldTheory #1772 only through `roadmaps show` and `roadmaps grep`. I read ComplexKahlerGeometry #1398 from the checkout the brief gives.

## Source issues

- **Error** in gray-morris at Appendix, Lemma 1, pp. 252–253: the source says the 5N·m(R−E) bound holds for every closed rectangle; it should require side ratios in [1/2, 2], since R=[0,3]×[0,1] with two opposite corners and N=1 allows 21 > 15; affects the proof.
- **Gap** in gray-morris at Appendix, proof of Theorem 3, p. 253: the source applies Baire to E as a complete metric space; E is only relatively closed in the open domain D, so Baire must come from local compactness instead; affects the proof.
- **Gap** in gray-morris at Appendix, proof of Theorem 3, p. 253: the sets E_n compare f(z+h) and f(z+ih) for all 0<|h|≤1/n, but near ∂D these points leave D; the clauses should apply only when z+h, z+ih lie in D; affects the proof.
