# GATE-StochasticCalculus~1: answers to human review

Comments covered: roed-math (2026-10-18, on 422808d), kim-em (2026-10-20, status reply, no new mathematical point), roed-math (2026-10-20, on 6781c74), mccorvie (2026-10-24). Repairs are in two commits on top of 6781c74: the answers below (README only), then a repair commit for the worker's checks, which touches `README.md` and `Suggested.lean` (section "Repairs of the worker's checks").

## H01 (roed-math) — applied
Commit 6781c74 already contains the S5.5 split, and I checked it against the counterexample (`Ω = C₀×{a,b,c}`, `P = W⊗δ_c`, `M = B + t·1_{j=a}`). The original-process theorem now assumes `StronglyAdapted F M` (README S5.5; `levy_characterization_adapted` and `filteredBrownian_of_brownianLaw_localMartingale` in `Suggested.lean`), so M is excluded because `M_t` is not `F_t`-measurable. Bare native locality gets the separate `exists_predictable_brownian_of_localMartingale`, whose conclusion is an indistinguishable predictable F-Brownian `B`. In the example the canonical coordinate `B_t(ω,j)=ω(t)` is such a version: it is `F`-adapted, and the statement says nothing about adaptation of M. The consumers (S7.2 DDS, S9.4a radial driver, S10 noise reconstruction) select adapted versions before applying S5.5.

## H02 (roed-math) — applied
Already in 6781c74, S6.2: the bound `exp(αa−θt) → 0` is used only for θ>0, and θ=0 goes through a.s.-finite hitting time / normalization or the θ↓0 limit. Check: at θ=0, α=0 and the bound is `exp(0)=1`, which does not tend to 0, so the case split is needed.

## H03 (roed-math) — applied
Already in 6781c74, S0.2 cites Ondreját–Seidler, ECP 18 (2013), no. 20, Theorem 0.1, DOI 10.1214/ECP.v18-2548, and separates fixed-time modification from indistinguishability. This commit only adds spacing to the citation (`ECP18(2013), no.20, Theorem0.1` → `ECP 18 (2013), no. 20, Theorem 0.1`).

## H04 (kim-em) — answered
This is a status reply about the repairs for H01–H03. It makes no new mathematical claim. Those repairs were checked under H01–H03.

## H05 (roed-math) — applied differently
The duplication is real. StandardDistributions on main §8.1 owns `Real.besselI` (positive series for ν>−1, x>0, convergence, positivity, joint continuity/measurability, `I_ν'=I_(ν+1)+(ν/x)I_ν`, adjacent recurrence). Its §12.1 owns the sphere mass `2π^(d/2)/Γ(d/2)`, and its §12.2 owns `Z_d(κ)=(2π)^(d/2)κ^(1−d/2)I_(d/2−1)(κ)`. The S9.4a ownership paragraph is replaced by consumption of exactly these sections. S9.4a keeps only the modified Bessel equation for ν≥0, z>0 (derived from the supplier's derivative identity and its recurrence at orders ν, ν+1, ν+2, all >−1), the kernels, the `I_(1/2)` closed form and the d=3 inverse-radius value. The complex-order list (slit-plane holomorphy, `I_(-n)=I_n`, `I_n(z)=(-i)^n J_n(iz)`, complex comparison) is removed rather than kept as an SC target, unlike the review's split. Every SC use has ν=d/2−1≥0 and argument `ry/t>0`, and no roadmap on main or in an open PR consumes SC's complex Bessel API (`roadmaps grep 'besselI|modified Bessel'`). The supplier bullet (README "Foundations and supplier ownership") and the S9 dependency paragraph are updated to match, and the stale `Complex.besselI` backtick lead is gone.

## H06 (roed-math) — applied
S6.2: `the displayed residual bound alone is1` → `... is 1`. I fixed the same glued-digit pattern elsewhere: `less than1` (S5.4), `Layer11`/`Layer10` (S0.6, S3), `Theorem4.8.1`, `Theorem6.2.3`, and `mass0`/`mass1`/`constant1`/`are1 and0` (S0.0).

## H07 (mccorvie) — applied differently
The README never assigns marked-batch compensator existence to PointProcesses. The only such assignment is step 4 of the construction order in `TauCetiRoadmap/StochasticCalculus/SupplierDependencies.md`, and this job could not edit that file. **The worker must delete step 4 there** (the sentence "PointProcesses' finite-horizon-integrable marked-batch existence consumes that scalar theorem …"), and should also delete the trailing "or marked-batch existence" clause in step 2. Nothing in SC consumes a general-mark existence theorem (grep: no other occurrence). In README S0.6.3 the sentence "It does not claim general-filtration compensator existence" now says explicitly that no general-mark compensator existence theorem is consumed from PointProcesses. It lists what is consumed: carriers, `IsCompensator`, uniqueness, the finite-horizon-integrable compensated-integral martingale theorem, and the forward adapted-Poisson compensator. It also limits S2.5's dictionary to Unit marks. No new owner is needed because no SC target uses the marked theorem.

## Adversarial pass on changed statements

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Sphere identity `∫_(S^(d−1)) e^(zθ₁)dS=(2π)^(d/2)z^(1−d/2)I_(d/2−1)(z)` (now consumed from SD §12.2) | d=2; d=3 | d=2: LHS `∫₀^(2π)e^(z cos θ)dθ=2πI₀(z)`, RHS `2π·I₀(z)`. d=3: LHS `2π∫₋₁¹e^(zu)du=4π sinh z/z`, RHS `(2π)^(3/2)z^(−1/2)·√(2/(πz)) sinh z = 4π sinh z/z` | agrees | cite SD §12.2 |
| Surface mass `2π^(d/2)/Γ(d/2)` (SD §12.1) | d=2, 3 | 2π/Γ(1)=2π; 2π^(3/2)/(√π/2)=4π | agrees | cite |
| Bessel equation `z²I''+zI'−(z²+ν²)I=0` for ν≥0, z>0 | symbolic from the two supplier identities | `z²I''=z²I_ν−zI_ν'+ν²I_ν` after eliminating `I_(ν+1)`, `I_(ν+2)` | holds; orders used ν, ν+1, ν+2 ≥ 0 > −1, inside SD's range | SC-owned target kept |
| `I_(1/2)(z)=√(2/(πz)) sinh z` | series with `k!Γ(k+3/2)=(2k+1)!√π/2^(2k+1)` | sum `=(z/2)^(1/2)(2/√π)sinh z/z` | agrees | kept as check |
| d=3 kernel | `p_t(r,y)` with ν=1/2 | `=(y/r)(2πt)^(−1/2)(e^(−(y−r)²/2t)−e^(−(y+r)²/2t))` | standard 3-d Bessel density | none |
| `E_r[1/R_t]=(2Φ(r/√t)−1)/r` | d=3 | `E[1/‖x+B_t‖]=P(|N|≤r/√t)/r` | agrees, `<1/r` for t>0 | none |
| S6.2 θ=0 bound | θ=0, α=0 | `exp(αa−θt)=1` | does not tend to 0; case split needed | typo only |
| S5.5 adapted theorem vs counterexample | reviewer's Ω, M | `M_t(ω,a)−M_t(ω,b)=t≠0` while `F_t` does not separate a, b | M fails `hAdapt`, so the theorem is not refuted | none (6781c74) |

| `IsItoIntegral` at t=0 | `timeMeasure 0 = 0`; elementary integral `Σ ξᵢ(B₀−B₀)` | energy `∫⁻` over the zero measure is 0, so `P{ε ≤ 0} = 0` for ε>0; integral 0 | forces `I₀ = 0` a.s. | README Check |
| `IsItoIntegral`, H=1 (wrong models 0 and cI) | one-step K with grid `0 ≤ t`, ξ=1 | energy 0; integral `B_t − B_0 = B_t` | with uniqueness `I_t = B_t` a.s.; `I=0` and `cI`, c≠1, excluded since `E[B_t²]=t>0` | README Check |
| `IsItoIntegral`, energy junk | H with `∫₀ᵗH² = ∞` on an event of positive probability | `∫⁻|K−H|² = ∞` there for every bounded elementary K; a Bochner energy would give 0 for K=0 | lower integral used, no false approximation | README non-example Check |
| `itoIntegral_isometry` | H=1, t arbitrary; t=0 | `E[B_t²]=t`, RHS `((timeMeasure t).prod P)(univ)=t·1`; t=0: both 0 | agrees | none; strong progressivity is a hypothesis because an arbitrary version on a raw filtration need not be adapted, and `Martingale` contains `StronglyAdapted` |
| `isItoIntegral_unique` | two approximating sequences Kₙ, K'ₙ for the same H | `∫|Kₙ−K'ₙ|² ≤ 2∫|Kₙ−H|²+2∫|K'ₙ−H|² → 0` in probability; elementary bound `P(|∫L dB|_t≥ε) ≤ δ/ε² + P(∫L²≥δ)` gives `I_t=J_t` a.s.; a.s. continuity on rational t gives indistinguishability | holds with only `hB` | none |
| `itoIntegral_local_congr` | H=K dt×P-a.e. | for P-a.e. ω, H(·,ω)=K(·,ω) dt-a.e. (product null sets), so the energies of Kₙ against H and K agree a.s.; then uniqueness | holds | restated on given integrals I, J |
| `IsQuadraticVariation`, M=B | A=t; A=2t; A=0 | `B_t²−t` martingale; `B_t²−2t` has `E = −t` decreasing, not local martingale; `E[B_t²]=t≠0` | only A=t | README Checks |
| `IsQuadraticVariation`, scope | compensated Poisson `N_t−t`, A=t | `E[(N_t−t)²]=Var N_t=t`, so `(N_t−t)²−t` is a martingale while `[N−t]=N` | predicate identifies `[M]` only for continuous M; docstring corrected from "not the predictable bracket" to "for a jump martingale a continuous such A is the predictable bracket" | README Check, docstring |
| `isQuadraticVariation_unique` | A, A' | `A−A'` = difference of two local martingales, continuous, finite variation, 0 at 0, hence 0 | holds without continuity of M | none |
| Lévy (`levy_characterization_adapted`) | `hQV` now `IsQuadraticVariation F P M (fun t _ => t)` | for M=B: `B²−t` martingale, matches previous `[M]_t=t` | same hypothesis content | hypothesis restated |
| `stochasticExponential I θ` | θ=0, I=0 | `exp(0−0)=1`, Novikov integrand `exp 0 = 1` integrable, expectation 1 | agrees | takes the Itô integral as an argument |

Signatures: the brief permits only the two Lean commands it lists, so no separate `#check` scratch file was elaborated; every restated declaration carries all binders explicitly (the only section variables are `Ω`, `mΩ`, and the Polish `E` block, which is untouched), and the full build elaborated each statement.

## Repairs of the worker's checks

- imports / mathlib-subimports / no-import-mathlib: the 23 `Mathlib.*` lines and `import TauCetiRoadmap.StochasticCalculus.RawLocalization` → the single line `import Mathlib`. Nothing in `Suggested.lean` used a `RawLocalization` declaration (only a docstring named `exists_raw_bounded_localizer`; that docstring went with the restated QV block). The build no longer compiles `RawLocalization.lean`, so its three unused-variable warnings no longer appear; that file is outside the editable scope.
- sorry-data: `itoIntegralCLM`, `itoIntegral`, `quadraticVariation` (sorry'd defs) → the structure `ElementaryIntegrand` (with `toProcess`, `integral`) and the predicates `IsItoIntegral F P B H I` (a.s. continuous paths; for every t, elementary Kₙ with `∫⁻_(0,t]|Kₙ−H|² → 0` in probability and elementary integrals at t → `I_t` in probability) and `IsQuadraticVariation F P M A`, all with real bodies. Restated headlines: `exists_isItoIntegral`, `isItoIntegral_unique`, `itoIntegral_isometry` (replaces `itoIntegralCLM_isometry`, `itoIntegral_martingale`), `itoIntegral_localMartingale`, `itoIntegral_local_congr` (on given I, J), `exists_isQuadraticVariation`, `isQuadraticVariation_unique`, `brownian_quadraticVariation`; `levy_characterization_adapted`, `exists_predictable_brownian_of_localMartingale`, `brownian_ito_C2` (now `∃ I, IsItoIntegral … ∧ identity`), `stochasticExponential` (takes I), `novikov_expectation`, `girsanov_on_horizon`, `cameronMartin_pushforward` (take I with `IsItoIntegral`), `IsStrongSolution` (`∃ H I`). Dropped as API/normalisation lemmas now carried by the definition and the README Checks: `itoIntegral_eq_CLM`, `itoIntegral_const`, `itoIntegral_rectangle`, `itoIntegral_local_spec`, `itoIntegral_congr` (subsumed by `itoIntegral_local_congr`). README S3.2, S4.1 and S5.5 now state these predicates and theorems with locators (Karatzas–Shreve §3.2.D; Revuz–Yor Ch. IV Thm 1.8) and Checks.
- residue: `lemma continuous_tent`, `tent_reflection`, `tent_outside` → `theorem`.
- latex: README line "constant on ℝ\[0,1]" → "constant on ℝ∖[0,1]".
- tex: 31 brace sub/superscripts outside code spans (`Dⁿ_{τₙ}`, `F_{τ+}`, `2^{−n}`, `C^{1,2}`, …) → parenthesised form (`Dⁿ_(τₙ)`, `C^(1,2)`), the house style already used elsewhere (`I_(d/2−1)`).
- prnum: "Mathlib PR26291"/"PR37259" links and "following PR26291's design" → "the Mathlib Gaussian Cameron–Martin proposal" / "the Mathlib Brownian germ proposal", keeping the reviewed mathlib4 commit hashes; the PointProcesses link to its pull request → `../PointProcesses/README.md` (cited by name).
- readme-ids-missing: `ext_of_generate_finite` → `MeasureTheory.ext_of_generate_finite` (Mathlib `MeasureTheory/Measure/Typeclasses/Finite.lean:458`); the gate then reported `integral_ballPoissonKernel`, qualified to `TauCeti.integral_ballPoissonKernel` (Tau Ceti `Analysis/PDE/PoissonIntegral/Ball.lean:84`).
- Ownership: the Itô-integral and QV predicates are this roadmap's own (S3/S4); `roadmaps grep` finds no Itô-integral or quadratic-variation carrier on main or at the open heads other than this roadmap. Not changed in this round, still open: the namespace is `StochasticCalculusSuggested`, not `TauCetiRoadmap.StochasticCalculus`; the module docstring is not in the "target signatures" form; and the folder carries the extra files `RawLocalization.lean`, `IndependentLaws.lean`, `AutonomousODE.lean`, `PointProcessesAdapter.lean`, `SupplierDependencies.md`, which this job may not edit.

## Ownership and citations
- Ownership of the Bessel function is cited to StandardDistributions §8.1/§12.1/§12.2, which is on main and therefore a valid supplier. The remaining SC Bessel material is the stochastic kernel theory and the Bessel ODE, which SD does not plan; nothing else in the open roadmap PRs plans these (`roadmaps grep`).
- PointProcesses is cited as before; this round's change only narrows what SC consumes.

## Build
`lake build TauCetiRoadmap.StochasticCalculus.Suggested`: **Build completed successfully (8976 jobs)**, with `declaration uses sorry` warnings only.

## Gate
`gate StochasticCalculus: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`

The only remaining item is `depcheck: NOT IN ORDER: StochasticCalculus (insert it after its last supplier)`. The brief says this is expected for a roadmap that has not yet been inserted into the merge order.

## Depcheck (`--movable`)
```
depcheck: 148 roadmaps, 1006 edges, 0 problem(s)
```
There are no UPWARD or CYCLE lines.

## Notes
- No sources were fetched. All checks were computations or comparisons against roadmaps on main, and DLMF 10.25.1/10.29.1/10.29.2 are cited by equation number only.
- No suspicious instructions were found in the review text.
