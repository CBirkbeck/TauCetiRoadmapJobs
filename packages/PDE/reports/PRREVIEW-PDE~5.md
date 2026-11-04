# Review of PDE (pull request #93 at 4d05568)

**Verdict:** needs changes

Full re-review of the repaired head (905 changed lines since 3e7b835). The gate passes at this head (every scanner 0, `depcheck=0`, `build=0`), my own dependency check prints `0 problem(s)` with no UPWARD or CYCLE line, `Suggested.lean` elaborates with exactly the 16 intended `sorry` warnings, the binder probe of all 19 declarations shows no lost hypothesis, and nine of the previous review's ten findings are repaired (table under `## Previous findings`). What blocks: the supplier inventory, now correctly written against the Tau Ceti revision main pins, still omits a pinned file for each of three sections that plan its content again, namely Perron's boundary behaviour with the exterior-sphere barrier, De Giorgi's local boundedness and oscillation decay, and the heat kernel's approximate-identity theorem on bounded uniformly continuous data (R01); and the improved-regularity bullet of §6.2 claims interior `H²` for the section's bounded measurable coefficients, which the roadmap's own §5.1 Check refutes (R02). Three P3 notes follow.

## R01 (P2) — Pinned theorems are planned again in §3.4, §5.4 and §6.3

**Location:** `TauCetiRoadmap/PDE/README.md:1378–1381` ("Prove that Perron's solution attains continuous boundary data at every regular boundary point, with the barrier characterization … exterior-sphere and exterior-cone conditions"); `:1813–1815` ("Weak solutions of the homogeneous equation are locally bounded with `sup_{B_r} |u| ≤ C r^{−n/2}‖u‖_{L²(B_{2r})}`"); `:2081–2083` ("on `BUC(ℝⁿ)` … prove strong continuity and the semigroup law"); the Tau Ceti contracts `:268–505`, which name none of the files below.

**Claim:** At Tau Ceti `358314d`, the revision the inventory declares (`:270–272`), these are theorems:

- `Analysis/PDE/Perron/Barrier.lean`: `TauCeti.IsBarrier` (`:73`), `tendsto_perronSolution_of_isBarrier` (`:162`, the Perron solution tends to `g ξ` within `closure Ω` at a point with a barrier where `g` is continuous), `continuousOn_perronSolution` (`:190`), `exists_harmonicOnNhd_continuousOn_closure_eqOn_frontier` (`:212`, the Dirichlet problem when every frontier point has a barrier), `isBarrier_newtonianKernel_sub` (`:238`, the exterior-sphere barrier for `n ≠ 2`), `isBarrier_log_norm_sub` (`:260`, the logarithmic barrier in two dimensions) and `exists_harmonicOnNhd_continuousOn_closure_eqOn_frontier_of_exterior_sphere` (`:281`). This is the sentence of §3.4 quoted above, including the `n = 2` case §3.4 says the pinned kernels do not cover.
- `Analysis/PDE/Regularity/LocalBoundedness.lean:618`, `TauCeti.PDE.exists_ae_abs_value_le_mul_rpow_mul_sqrt_setIntegral`: for `UniformlyEllipticOn`, `n ≥ 3` (through `1/p* + 1/n = 1/2`), a weak solution on `B(x₀, R) ⊆ Ω` satisfies `|u| ≤ D R^{−n/2} ‖u‖_{L²(B(x₀,R))}` a.e. on `B(x₀, R/2)`, `D = D(λ, Λ, n, μ)`: the §5.4 bullet, at the pinned generality. `Regularity/Oscillation.lean:436`, `exists_ae_value_mem_Icc_add_mul_rpow_mul_rpow_mul_sqrt_setIntegral`: the interior oscillation estimate `osc_{B_r} u ≤ C (r/R)^α R^{−n/2}‖u‖_{L²(B_R)}`, `r ≤ R/2`, with `0 < α ≤ 1`, which is the De Giorgi step §5.4 describes as its route ("the level-set truncation of De Giorgi … Moser's iteration", `:1801–1804`); `Regularity/LevelSetDecay.lean` and `Sobolev/Poincare/Wirtinger/DeGiorgi.lean` are its ingredients.
- `Analysis/PDE/HeatKernel/ApproximateIdentity.lean`: `norm_heatKernel_convolution_le` (`:115`, the `L^∞` contraction) and `tendstoUniformly_heatKernel_convolution` (`:194`, `heatKernel t ⋆ g → g` uniformly as `t ↓ 0` for bounded uniformly continuous `g`): the strong continuity of §6.3's `BUC` realization at `t = 0`.
- Smaller omissions of the same kind: `Sobolev/W1p/Truncation.lean:124,189` (`(u − k)⁺` continuous in `W^{1,p}` and preserving `W^{1,p}_0`, used by §5.4 and §6.2's "truncation `(u − k)⁺`", `:2069`); `Holder/Algebra.lean:63` (the submultiplicative norm on `TauCeti.HolderSpace`, the `k = 0` case of §1.7's product estimate `:865`); `Sobolev/Morrey.lean:166,181,276` (Morrey's inequality for `C¹` functions on bounded convex sets, balls and the whole space, with the explicit constant, the convex case of §1.4's domain estimate); `Sobolev/Poincare/WholeSpace.lean` (the failure of Poincaré on `ℝⁿ`, §1.5's second Check as a theorem); `Sobolev/Trace/Estimate.lean` (the flat `H¹` trace inequality behind `hyperplaneTrace`).

**Witness:** `Perron/Barrier.lean:281–292` at `358314d`: hypotheses `IsOpen Ω`, `IsBounded Ω`, exterior sphere at every frontier point, `ContinuousOn g (frontier Ω)`; conclusion `∃ u, HarmonicOnNhd u Ω ∧ ContinuousOn u (closure Ω) ∧ EqOn u g (frontier Ω)`; its proof splits `n = 2` from `n ≠ 2` exactly as §3.4 plans to.

**Repair:** Add the three files to the Tau Ceti contracts with the names above, and reword the three sections so that what is pinned is consumed: §3.4 keeps as targets the exterior-cone condition, the necessity half of the characterization (attainment for all continuous data gives a barrier) and regular points of the planar half-plane; §5.4 keeps local boundedness for `n = 1, 2` and for the inverse-coercive predicate, citing the pinned `n ≥ 3` bound and the pinned oscillation decay as the model for its ball estimate; §6.3 keeps the `Lᵖ` strong continuity, the semigroup law as an operator identity and the generator, citing the pinned `BUC` limit. Cite the five smaller files where their statements are used.

## R02 (P2) — The improved-regularity bullet of §6.2 drops the coefficient hypotheses its source carries

**Location:** `TauCetiRoadmap/PDE/README.md:2046–2048`: "Improved regularity: `u₀ ∈ H¹₀` and `f ∈ L²(L²)` give `u ∈ L²(0,T;H²_loc) ∩ H¹(0,T;L²)` (Evans, §7.1.3, Theorem 5), consuming §5.1", under the section's standing "time-dependent bounded measurable coefficients with a uniform Gårding inequality" (`:2032–2034`).

**Claim:** With bounded measurable `a` the conclusion is false. Evans's Theorem 5 is proved under the standing assumptions of his §7.1.3 (coefficients smooth and independent of `t`); the interior `H²` step needs at least `a` Lipschitz in `x`, and the `u' ∈ L²(L²)` step needs time-independent (or time-Lipschitz) coefficients.

**Witness:** `Ω = (−1, 1)`, `a = 1 + 1_{x>0}`, `b = c = 0`, `f ≡ 1`, `u₀ = w` the `H¹₀` solution of `−(a w')' = 1`. The stationary `u(x, t) = w(x)` is the unique weak solution of §6.2's problem; `w' = (C − x)/a` jumps at `0`, so `w ∉ H²_loc` and `u ∉ L²(0,T;H²_loc)`. This is §5.1's own second Check (`:1672–1674`).

**Repair:** State the bullet with the hypotheses "`a` Lipschitz on `Ω` and independent of `t` (or with `∂ₜ a` bounded), `b, c ∈ L^∞`", and name `TauCeti.W1p.continuous_posPartAbove` and §5.1's interior estimate as its inputs; add the stationary jump example as the negative-control Check.

## R03 (P3) — Locators and one qualified name

**Location and claims:**

- `TauCetiRoadmap/PDE/README.md:2599–2600`: the frequency-localized wave decay `‖W±(t)P_j f‖_∞ ≤ C 2^{jd}(1 + 2^j|t|)^{−(d−1)/2}‖f‖₁` is cited as "Tao, §2.5". In the text it is estimate (2.19) of §2.2 "Fundamental solution", printed p. 71 (`tao-dispersive` line 3688, with (2.20) at line 3690); §2.5 is "The wave equation stress-energy tensor" (line 32). Cite "Tao, §2.2, (2.19)".
- `:1380`: "Gilbarg–Trudinger, Theorems 2.12 and 2.14" for boundary attainment at regular points. Theorem 2.12 is Perron's harmonicity theorem; the attainment at a point with a barrier is Lemma 2.13, and 2.14 the characterization. Witness: the pinned `Perron/Barrier.lean` docstring cites "Section 2.8, Lemma 2.13 and Theorem 2.14" for exactly these two statements. Write "Lemma 2.13 and Theorem 2.14".
- `:1741–1742`: "Gilbarg–Trudinger, Theorem 8.32 for the estimate" of the `C^{1,β}` bound with `f ∈ L^q` and `β = min(α, 1 − n/q)`. Theorem 8.32 takes the scalar datum bounded and concludes with exponent `α` and the term `|g|_{0;Ω}`; the `L^q` refinement with the Morrey gain `1 − n/q` is the Campanato-method theorem the section itself invokes (Giaquinta–Martinazzi, Theorem 5.19). Cite that for the `L^q` form and keep 8.32 for the bounded case. (Gilbarg–Trudinger could not be read here; the author can check the form of (8.32)'s right-hand side in a minute.)
- `:1181`: the Check names `TauCeti.PDE.harmonicOnNhd_newtonianKernel`; the declaration is `TauCeti.harmonicOnNhd_newtonianKernel` (`Analysis/PDE/FundamentalSolution/Euclidean/Basic.lean:44` opens `namespace TauCeti`, the theorem is at `:272`), as the contracts at `:410` have it.

## R04 (P3) — The §5.7 VMO witness is not a strong solution and refutes regularity, not the estimate

**Location:** `TauCetiRoadmap/PDE/README.md:1961–1968`: "`u = |x|^γ` … `D²u ≈ |x|^{γ−2}` lies in `Lᵖ_loc` exactly for `p < n/(2 − γ)`: a strong solution with `f = 0` whose `W^{2,p}` regularity stops below `p = n/(2 − γ)`, so no `W^{2,p}` estimate for large `p` survives without VMO".

**Claim:** The computation is right (`aⁱʲ∂ᵢⱼ|x|^γ = γ|x|^{γ−2}((n + γ − 2) + b(γ − 1)) = 0` for `b = (n + γ − 2)/(1 − γ)`), but since `n/(2 − γ) < n` for `γ < 1`, `u ∉ W^{2,n}_loc`: it is not a strong solution in the sense fixed in §3.2 and §5.5 (`W^{2,n}_loc`). And the example refutes the regularity statement "a `W^{2,p₀}_loc` solution with `f ∈ Lᵖ` lies in `W^{2,p}_loc`", not the a priori estimate `‖D²u‖_{Lᵖ(B_r)} ≤ C(‖f‖_{Lᵖ(B_{2r})} + r^{−2}‖u‖_{Lᵖ(B_{2r})})` for `u ∈ W^{2,p}`: on the approximants `u_ε = (|x|² + ε²)^{γ/2}` one has `f_ε = aⁱʲ∂ᵢⱼu_ε = γ(2 − γ)(1 + b) ε² (|x|² + ε²)^{γ/2 − 2}`, and both `‖D²u_ε‖_p` and `‖f_ε‖_p` scale as `ε^{γ − 2 + n/p}`, so the inequality is not contradicted.

**Repair:** Write "a `W^{2,p}_loc` solution for every `p < n/(2 − γ)`, not a `W^{2,n}_loc` strong solution" and "no `W^{2,p}` regularity theorem for `p ≥ n/(2 − γ)` survives without VMO".

## R05 (P3) — Bookkeeping

- `TauCetiRoadmap/PDE/README.md:544`: "Layer 7 needs Layer 2", while Layer 7's Dependencies (`:2586–2588`) and the Needs of §7.1–§7.2 also name §6.3 (the heat-block estimate `‖e^{tΔ}P_j f‖_p ≤ C exp(−c 4^j t)‖P_j f‖_p`) and §1.7 (the Hölder identification). Say "Layers 2 and 6 (§6.3) and §1.7".
- No `sources.toml` records the cited works; the two previous reviews' request stands. The three texts fetched this round (`krylov-2007-vmo`, `sarason-1975`, `chiarenza-frasca-longo-dirichlet`) and the earlier `rosales`, `meyers-1963`, `tao-dispersive`, `armstrong-kempe` are in the cache for it.

## Previous findings

| Previous | State at this head |
| --- | --- |
| R01 (P1) Bony double count | Repaired: `:2535–2542` sets `S_j = Σ_{k≤j−1} P_k`, states the partition of pairs into `k ≤ j − 2`, `j ≤ k − 2`, `|j − k| ≤ 1`, and the `f = 1` Check (`:2563–2567`) now gives `Σ_{j≥2} P_j g + 0 + P_0 g + P_1 g = g` and records the double count of the other convention. |
| R02 (P2) inventory against the wrong pin | Repaired by declaration: `:270–272` names Tau Ceti `358314d`, the pin of the content repository's `lake-manifest.json` (origin/main `fa41b37`), and every cited file and line resolves there (list under Verified sound). The branch's own manifest still pins `a91d3aa`; the pull request does not touch `lake-manifest.json`, so the merged roadmap is built against main's pin. `Suggested.lean`'s six imports and every name it uses exist at both revisions (built at `a91d3aa`, checked textually at `358314d`). |
| R03 (P2) maximal inequality headline | Repaired: `lintegral_maximalFunction_rpow_le` is gone; `:346–350` and `:958–963` cite `TauCeti.lintegral_rpow_maximalFunction_le` and `eLpNorm_maximalFunction_le` (`MaximalFunction.lean:447,484`) with the explicit constant. |
| R04 (P2) inventory omissions | Repaired for every item listed: `C1HolderSpace`/`C2HolderSpace` (`:332–340`), mean-value converse (`:434–440`), classical principles and Hopf for `a = I` (`:446–460`), half-space kernels (`:464–472`), difference quotients (`:322–326`), local Rellich (`:319–321`), Fredholm index (`:481–485`), Harnack convergence (`:428–431`); the "no Hölder space of positive order" clause is gone. New omissions of the same kind are R01 above. |
| R05 (P2) Harnack headlines | Repaired: `harnack_of_isWeakSolution_ball` (`Suggested.lean:364`) and `harnack_of_isStrongSolution_ball` (`:411`), pairwise a.e. form, constants from `ratio` and the dimension, `r‖f‖_{Lⁿ}/λ` forcing term in the strong case; named in §5.4 and §5.5. |
| R06 (P2) `n ≥ 3` dropped | Repaired: `:1929–1940` carries `n ≥ 3` on the Chiarenza–Frasca–Longo theorem (`chiarenza-frasca-longo-dirichlet` line 377, assumption (A), printed p. 850; Theorem 4.4 at line 440), `n = 1` by two integrations, `n = 2` by Gilbarg–Trudinger 9.15 and the planar kernel; the every-dimension whole-space input is Krylov, Theorem 2.6 (`krylov-2007-vmo` lines 193–198: `λ‖u‖_p + ‖u‖_{W²_p} ≤ N‖(M − λ)u‖_p`, `a` "perhaps, nonsymmetric", line 104, in `VMO_x`, lines 123–127), and §5.2's divergence-form input is his Theorem 2.8 (lines 203–208). |
| R07 (P3) sign | Repaired: `:1564–1566` has `sin(2x)/3` with the computation `3A sin 2x`. |
| R08 (P3) constants | Repaired: `:1467–1472` says the formula gives `β = 5/2` with slack `π/4` and that `β = 2` is the optimal shift on `sin x`; `:1457–1463` derives `λ/(1 + C_P²)` and explains the pinned `λ/(2(1 + C_P²))` as the drift-absorbing constant at `β = 0`. |
| R09 (P3) consumer phrasing | Repaired: `:71–77` and `:112–116` say GeometricMeasureTheory G6 and PseudodifferentialOperators §5.3 "are to consume" the graph measure and the Besov carrier. |
| R10 (P3) locators, shape | Repaired except the manifest: Meyers–Serrin and Adams–Fournier 3.17 cited with Evans for the bounded case (`:599–602`); "Mathlib has no mean-value theorem on balls in general dimension" (`:227–228`, true at both pins: `Mathlib/Analysis/InnerProductSpace/Harmonic/` holds `Basic`, `Constructions`, `HarmonicContOnCl` only); parabolic balls "comparable to, not equal to, cylinders" with the two inclusions (`:2160–2162`); the `σ = 0` Check (`:2626–2631`); §1.7, §6.4 and §7.2 carry nine, nine and nine Checks spread over their definitions; every `*Needs:*` line is itemized per target. `sources.toml` still absent (R05 here). |

## Verified sound

**Scope.** HEAD `4d05568df0b67a30b7c7c9f06f111cca1b9ce0d6`; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/PDE'` is empty. The folder holds `README.md` (2971 lines), `Suggested.lean` (455 lines), `PROGRESS.md`, `STATUS.md` and `metadata.toml`; `stray-files=0`. OneParameterSemigroups is on main under `Completed/`, so citing it is in order; its Part A is at `Completed/OneParameterSemigroups/README.md:90`.

**Gate.** My run of the text scanners and dependency check at this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's run adds `build=0`. The prescribed movable dependency command printed exactly

```text
depcheck: 204 roadmaps, 1399 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line. PDE is on main and not in the merge order; its suppliers (OneParameterSemigroups, OperatorTheory, BanachAlgebras, AlgebraicTopology) are on main; PseudodifferentialOperators (order line 8) and StochasticCalculus (line 195) cite PDE as a supplier, which is downward.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/PDE/Suggested.lean` from the worktree: exit 0 in 5 s, exactly 16 "declaration uses `sorry`" warnings at lines 88, 123, 137, 156, 166, 214, 223, 244, 276, 289, 315, 339, 364, 385, 411, 436, nothing else. `module` + `public import Mathlib` + six `TauCeti.*` modules that exist at both pins, no `set_option`, no `lemma`, no sorried data; `IsUniformlyEllipticAE` and `IsLipschitzDomain` are `Prop`s with real bodies, `CalderonZygmundOperator` bundles pinned data.

**Binder check.** A scratch `module` file with `#check @` for all 19 declarations, importing the built `TauCetiRoadmap.PDE.Suggested`, elaborated with no warning. Each type agrees with its README statement: `[mu.IsAddHaarMeasure]`, `[Fact (1 ≤ p)]`, `p ≠ ⊤`, `IsLipschitzDomain`, `Bornology.IsBounded`, `IsConnected`, `[DecidableEq ι]`, `[Fact (1 ≤ card ι)]` (the two Krylov–Safonov statements), `IsSymm`, `ContDiffOn ℝ 2`, the Gårding inequality and `0 < C₀` are all present where the README needs them; `ContDiffOn ℝ (↑⊤)` is the smooth class. Nothing changed.

**Ellipticity predicates.** `TauCeti.PDE.UniformlyEllipticOn` (`Analysis/PDE/Ellipticity/Basic.lean:474`, identical at `a91d3aa` and `358314d`) is `0 < lam ∧ lam ≤ Lam ∧ …`. This matters: without `0 < lam` the field `a = 0` would satisfy the predicate and refute `hopf_boundary_point` (`n = 1`, `u = −(x + 1)²` on `(−1, 1)`, quotient `t → 0`), `exists_holderOnWith_of_isStrongSolution_ball` (`u = M sin(kx₁)`, seminorm `≍ Mk^α` against a `k`-free bound) and `holderOnWith_iteratedFDeriv_two_of_schauder` (`u = |x₁|^{2+β}`, `β < α`, with `f = 0`); the pinned positivity excludes all three. `IsUniformlyEllipticAE` carries `0 < lam ∧ lam ≤ Lam` itself.

**One-tactic probe.** None of the 16 sorried theorems is a pinned declaration: at `358314d` the string `harnack` occurs only in the harmonic-function files (`Harnack/Basic`, `Convergence`, `Planar`, `StrongPrinciple`, `Perron/Basic`, `Laplacian/StrongMaximumPrinciple`); `LipschitzDomain`, `Gårding`, Schauder estimates, Krylov–Safonov, Calderón–Zygmund operators, Besov, Strichartz do not occur. No `rfl`, `simp`, `infer_instance` or single-lemma `exact` candidate exists for any of them.

**Cross-roadmap citations resolved this round.** OneParameterSemigroups on main (`Completed/…/README.md:90`, "Part A — Strongly continuous semigroups"); OperatorTheory on main (`:135–136`, Mathlib `LinearPMap` for both developments); BanachAlgebras on main (`:1116` A8, `:1148` Schauder on a nonempty closed bounded convex set); AlgebraicTopology on main (`:393–399` item 7, `:438` `brouwerFixedPoint_compactConvex_finiteSpan`); Isoperimetry on main (`:71–74` PDE as non-sharp supplier, `:182` I3, `:301` I5); GeometricMeasureTheory on main (`:57` consumer of Lane A.1–A.3, `:148–177` G2 with "derive graph surface measure", `:275` G6); PseudodifferentialOperators at its head (`:914` Layer 5, `:1021` "5.3 Interpolation and Bessel/Besov comparisons"); StochasticCalculus at its head (`:23`, `:2273` consumer of C12, C15, B8); NoncommutativeIntegration at its head (`:178` "From TauCetiRoadmap.PDE", Riesz–Thorin); VariationalMethods at its head (`:84` "PDE Lane D–E, which consume Mathlib and Tau Ceti directly"). The citation checker's two leads (`CalderonZygmundOperator.eLpNorm_le`, `.weakType_one`) are this roadmap's own declarations (`Suggested.lean:214,223`).

**Library declarations opened at the pins.** Mathlib (`6b7abb3c` and `f6090c70`, identical at these lines): all 20 cited locators resolve to the named declaration, `TemperedDistribution.lean:160`, `Sobolev.lean:73,153`, `SobolevInequality.lean:601`, `Complex/Harmonic/MeanValue.lean:67`, `Liouville.lean:48`, `Fredholm/Basic.lean:123` (`structure IsFredholm`), `LaxMilgram.lean:105`, `FredholmAlternative.lean:164`, `Spectrum.lean:137`, `Differentiation.lean:855`, `Volume/Measure.lean:68,72`, `NormDet.lean:433`, `Hausdorff.lean:733`, `Rademacher.lean:385`, `Jacobian.lean:897`, `Holder.lean:51,57`, `ProdLp.lean:256`; no `maximalFunction`, Riesz–Thorin or Mihlin in either Mathlib. Tau Ceti `358314d`: every one of the 150 cited `file:line` locators in the contracts resolves to the named declaration (checked mechanically, including the `W1p/*` files and the bare `:NN` continuations: `W1p/Basic.lean:355,359,363,367,374,378`, `Wkp/Basic.lean:145,165,181,195,221,236`, `Wkp/Zero.lean:334,366,382`, `Wkp/Extension.lean:112`, `Trace/Hyperplane.lean:182,187,199,219`, `MaximalFunction.lean:125,171,179,211,292,363,406,447,484`, `EnergyForm/Sobolev.lean:372,449,459,524,600`, `Spectrum.lean:146,218,296,343,362,447,544,581` and `:496` for `finiteDimensional_eigenspace_dirichletSolutionOperator`, `HeatKernel/Basic.lean:68,77,109,131,163,177,213`, `MaximumPrinciple/Parabolic.lean:252,301`, `Perron/Basic.lean:133,157,348`, `Harnack/Basic.lean:92,178`, `HopfLemma.lean:253`, `HalfSpace.lean:39,76,92,115`, `CompactPerturbation.lean:65,151`, `Index.lean:61`, `Generation.lean:205`). The `C1HolderSpace` norm is `max ‖f‖_∞ (‖Df‖_∞ + [Df]_α)` (`Holder/One.lean:90,323`) and the `C2HolderSpace` norm `max ‖f‖_∞ (max ‖Df‖_∞ (‖D²f‖_∞ + [D²f]_α))` (`Two.lean:64,465`), as §1.7 says.

**Sources read** (the seeded sample where a legal text exists, and the finding targets). `krylov-2007-vmo` lines 101–107 (bounded measurable coefficients, `a` "perhaps, nonsymmetric", `aⁱʲλᵢλⱼ ≥ δ|λ|²`), 123–129 (`VMO_x` through `a^#`), 193–198 (Theorem 2.6, exactly §5.7's whole-space estimate with `λ₀ = λ₀(d, K, δ, p, ω)`), 203–208 (Theorem 2.8, §5.2's `W¹_p` estimate with `N` depending also on `λ`). `sarason-1975` line 73 (Theorem 1, the equivalent conditions defining VMO as the BMO-closure of the uniformly continuous functions). `chiarenza-frasca-longo-dirichlet` lines 376–390 (assumption (A): bounded `Ω ⊆ ℝⁿ`, `n ≥ 3`, `∂Ω ∈ C^{1,1}`, printed p. 850), 440 (Theorem 4.4, existence, "Assume (A)"). `tao-dispersive` line 3607 (the kernel (2.18) `(2πiℏt/m)^{−d/2}`, which at `ℏ = m = 1` and `t ↦ 2t` is the roadmap's `(4πit)^{−d/2}exp(i|x|²/(4t))`), 3829 ((2.22), `‖e^{itΔ/2}u₀‖_∞ ≲ t^{−d/2}‖u₀‖₁`, printed p. 74), 3685–3690 ((2.19)–(2.20), `λ^d⟨λt⟩^{−(d−1)/2}`, printed p. 71), 3856 (Theorem 2.3), 4023 (Theorem 2.6), 4183 (the wave admissibility line cannot be improved). `rosales` lines 94, 521–538, 854–858 and `meyers-1963` lines 255–273, 287–309, 397–425 as in the previous review (texts unchanged).

**Adversarial table** (statement, instances, values on each side, result).

| Statement / location | Instances tried | Computed values | Result |
| --- | --- | --- | --- |
| Conventions, inverse-coercive ⇒ operator bound, `:153–160` | `a = [[1,−k],[k,1]]`, `k = 1` | `ξ·aξ = ‖ξ‖²`, `λ = 1`; `aᵀa = (1+k²)I`, `M = √2`; sym part of `a⁻¹` is `I/2`, `Λ = 2`; `‖aξ‖² = 2‖ξ‖² ≤ Λ ξ·aξ` | Pass |
| `IsUniformlyEllipticAE`, `Suggested.lean:70` | `lam = 0`, `a = 0` | excluded by `0 < lam` in the body | Pass |
| `UniformlyEllipticOn` headlines (Hopf, Krylov–Safonov, Schauder) | `lam = 0`, `a = 0` | would refute all three (see above); excluded by `Ellipticity/Basic.lean:474` | Pass |
| §1.1 Checks `:575–590` | `x`, `|x|`, Cantor, `x²` | weak derivatives `1`, `sign`, none, `2x`; endpoint pair `(0,1)` | Pass |
| §1.2 `x^{3/2}` `:630–633` | `k = 2`, `p = 2` | `u'' = (3/4)x^{−1/2}`, `(u'')² = (9/16)/x` divergent | Pass |
| §1.3 `2π` witness `:665–671` | `u = e^{−πx²}` | `∫(1+ξ²)e^{−2πξ²} = (1/√2)(1 + 1/(4π))`; `∫(1+4π²ξ²)e^{−2πξ²} = (1/√2)(1+π)` | Pass |
| §1.4 Morrey Check `:704–708` | `|x|^{3/4}`, `|x|^{1/4}` | `(u')² = (9/16)|x|^{−1/2}` integrable, `3/4`-Hölder; `(v')² = (1/16)|x|^{−3/2}` not integrable | Pass |
| §1.5 interval constant `:744–746` | `x(1−x)` | `‖u‖₂² = 1/30`, `‖u'‖₂² = 1/3`, ratio `1/√10 = 0.316 < 1/π = 0.318` | Pass |
| `exists_poincare_wirtinger`, `Suggested.lean:123` | `Ω = ∅`; two disjoint balls | zero space; `u = ±1`, `∇u = 0`, `u − u_Ω ≠ 0`, excluded by `IsConnected` | Pass |
| `IsLipschitzDomain`, `Suggested.lean:104` | square corner; slit disk; cusp; `n = 0` | `γ(s) = |s|`, `K = 1`; no epigraph chart at a slit point; `√|s|` not Lipschitz; in `ℝ¹` the predicate selects unions of intervals with disjoint closures | Pass |
| `exists_trace`, `Suggested.lean:137` | `n = 0`, `Ω = (a,b)`, `p = 1` | `μHE[0]` counting measure on `{a,b}`, trace = endpoint pair, kernel `W^{1,1}_0` | Pass |
| `isCompactOperator_valueL_of_isLipschitzDomain` at `p = ∞`, `:166` | bounded Lipschitz `Ω` | `W^{1,∞}` bounded sets are equi-Lipschitz on the compact closure; Arzelà–Ascoli | Pass |
| §1.6 graph measure `:828–831` | `γ(s) = s`; `γ = 0` | `√2`; `|U|` | Pass |
| §1.7 `C1HolderSpace` Check `:893–898` | `f = sin`, `α = 1/2` | `[cos]_{1/2} ∈ [2/√π, 2]` (`x = 0, y = π`; `|cos x − cos y| ≤ min(2, |x−y|)`); max norm `∈ [1 + 2/√π, 3]`, sum norm `∈ [2 + 2/√π, 4]`; constants `1`, `2` | Pass |
| §1.7 Campanato `:908–912` | `n = 1`, `p = 2`, `|x|^α` | `∫_{−r}^{r}|u − u_r|² ≍ r^{1+2α}`; bounded iff `λ = 1 + 2α` | Pass |
| §2.1 `M1_{[0,1]}` `:976–979` | `x > 1`; `t ≤ 1/2` | `1/(2x)` at `r = x`; `t·|{Mf > t}| = 1 − t` | Pass |
| §2.1 `n = 0` constant `:983–985` | `p = 2`, `n = 0` | `2p·2^{p−1}/(p−1)·4⁰ = 8`; true norm `1` | Pass |
| `CalderonZygmundOperator`, `Suggested.lean:189` | `Tf = xf`; `Tf = mf`; identity | kernel `0` satisfies size/smoothness; `‖x1_{[R,R+1]}‖₂² = R² + R + 1/3 → ∞` so not an instance; `m ∈ L^∞` and `I` are instances | Pass |
| §2.3 Hilbert transform `:1078–1081` | `H1_{[0,1]}` | `(1/π)log|x/(x−1)| ∼ 1/(π|x|)`, not `L¹` | Pass |
| §2.4 John–Nirenberg `:1121–1124` | `log|x|` on `(−1,1)` | `f_B = −1`; `∫exp(c|f+1|) ≍ ∫|x|^{−c}` finite iff `c < 1` ⇒ `C₂ ≤ ‖f‖_{BMO}` | Pass |
| §2.4 Gehring `:1124–1127` | `g = |x|^{−a}`, `q = 2` | `g ∈ L^{2+ε}` iff `(2+ε)a < n`; `ε → 0` as `a ↑ n/2` | Pass |
| §2.4 commutator `:1128–1130` | `b = x` | kernel `(x−y)/(π(x−y)) = 1/π`, rank one, unbounded | Pass |
| §3.1 mean value `:1177–1179` | `x² − y²`; `x²` | `a² − b²`; `a² + r²/2` | Pass |
| `hopf_boundary_point`, `Suggested.lean:244` | `n = 1`, `v = −(x+1)`; ball with `closure B ∖ {x₀} ⊄ Ω` | quotient `1`; shrink to the internally tangent half-ball, barrier `e^{−κ|x−y|²} − e^{−κR²}` on the annulus with `w ≤ 0` on `∂A` by `ContinuousWithinAt` at `x₀` and `u < u(x₀)` on `Ω` | Pass |
| §3.2 half-disk `:1286–1291` | `a = e_r⊗e_r + s²e_θ⊗e_θ`, `u = r^s sin θ` | `div(a∇u) = s²r^{s−1}sin θ − s²r^{s−1}sin θ = 0`; eigenvalues `1, s²` | Pass |
| §3.2 ABP `:1292–1298` | `u = (|x|²−1)/(2n)` | `Δu = 1`, `∇u(B) = B(0,1/n)`, `|∇u(B)| = |B|n^{−n} = ∫det D²u` | Pass |
| §3.3 sharp Harnack `:1317–1323`, Checks `:1337–1350` | Poisson kernel `P(·,ξ)` at `x = ±rξ`; `u = 1 + x₁`, `n = 1`, `r = 1/4` | `P(rξ,ξ)/P(−rξ,ξ) = ((1+r)/(1−r))ⁿ`, attained; `(5/4)/(3/4) = 5/3 = (1+1/4)/(1−1/4)`; `(5/3)ⁿ < 3ⁿ` | Pass |
| §3.4 ball `:1393–1397` | `n = 3`, `f = 1` | `Φ*1_B = (3−|x|²)/6`, trace `1/3`, Green potential `(1−|x|²)/6` | Pass |
| §3.4 half-space constant `:1406–1408` | general `n` | `∫_{ℝⁿ}(1+|z|²)^{−(n+1)/2}dz = π^{(n+1)/2}/Γ((n+1)/2)` ⇒ `c_n = Γ((n+1)/2)/π^{(n+1)/2}` | Pass |
| §3.4 Perron target `:1378–1381` | pinned `Perron/Barrier.lean:162,281` | the target is a pinned theorem (`n ≠ 2` and `n = 2` barriers) | Duplicate (R01) |
| §4.1 Gårding constants `:1445–1448` | Evans's proof | `|b||Du||u| ≤ (λ/2)|Du|² + (|b|²/(2λ))u²` gives `C₀ = λ/2`, `β = ‖b‖²_∞/(2λ) + ‖c‖_∞ + λ/2` | Pass |
| §4.1 Check `:1467–1472` | `a = I`, `c = −2`, `u = sin x` | `B(u,u) = −π/2`; formula `β = 5/2`: `π/2 ≤ −π/2 + 5π/4`, slack `π/4`; optimal `β = 2` | Pass |
| `existsUnique_weakSolution_lifting`, `Suggested.lean:276` | `g = 1`, `ℓ = 0` | `w = u − g` solves `B(w,·) = −B(g,·)` by Lax–Milgram; `u = 1` | Pass |
| `fredholm_compatibility`, `Suggested.lean:289` | `L = [[1,1],[0,0]]`; `−u'' − u = f` on `(0,π)` | `ker Lᵀ = span(0,1)`; `∫₀^π sin = 2 ≠ 0` so `f = 1` unsolvable; `f = sin 2x` solvable with `A = 1/3` | Pass |
| §4.4 Checks `:1610–1620` | `(0,π)`; `∅`; `(0,π)²` | `λ_k = k²`, `C_P = 1`; empty basis, operator `0`; `5 = 1+4 = 4+1` | Pass |
| `exists_wkp_two_of_lipschitz_coefficients`, `Suggested.lean:315` | `a = 1 + 1_{x>0}` | `u' = C/a` jumps, `u ∉ H²`: excluded by `LipschitzOnWith` | Pass |
| §5.2 Meyers example `:1719–1723` | `u = |x|^{μ−1}x₁` | `|∇u| ∈ Lᵖ` iff `p(1−μ) < 2` | Pass |
| §5.2 slit disk `:1729–1731` | `r^{1/2}sin(θ/2)` | `|∇u| ≍ r^{−1/2} ∈ Lᵖ` iff `p < 4` | Pass |
| §5.3 displayed estimate `:1744` | dilation `ũ(y) = u(x₀ + ry)` | `f̃ = r²f(x₀+r·)`, `F̃ = rF(x₀+r·)`; `‖f̃‖_{L^q(B_2)} = r^{2−n/q}‖f‖_q`, `[F̃]_α = r^{1+α}[F]_α`, `[ã]_α = r^α[a]_α` | Pass |
| §5.3 Checks `:1759–1769` | `f = |x|^{−γ}`; `q = n` | `Δ|x|^{2−γ} = (2−γ)(n−γ)|x|^{−γ}`, gradient exponent `1−γ`; `Δ|x| = (n−1)/|x|`, gradient `−x/((n−1)|x|)` discontinuous | Pass |
| `exists_holderOnWith_of_isWeakSolution_ball`, `Suggested.lean:339` | `u = x₁`; `ratio < 1`; `ι` empty | `[u]_α ≍ r^{1−α}` both sides; vacuous; point domain | Pass |
| `harnack_of_isWeakSolution_ball`, `Suggested.lean:364` | `ι` empty; `ratio < 1`; `u = 1 + x₁` on `B(0,1)`, `r = 1/4` | `C ≥ 1` suffices on a point; vacuous; ratio `5/3`, so `C(1, 1) ≥ 5/3` at `n = 1` | Pass |
| §5.4 local boundedness bullet `:1813–1815` | pinned `LocalBoundedness.lean:618` | `|u| ≤ D R^{−n/2}‖u‖_{L²(B_R)}` on `B_{R/2}`, `n ≥ 3` | Duplicate (R01) |
| §5.4 half-disk exponent `:1824–1828` | `0 < s < 1` | `∫r^{2s−1}dr < ∞`, `s`-Hölder, `λ = s²`, `Λ = 1` | Pass |
| `exists_holderOnWith_of_isStrongSolution_ball`, `Suggested.lean:385` | `n = 1`; GT 9.24 ⇒ ball form | `u'' = −f/a`, `osc u' ≤ ‖f‖₁/λ`; for `|x−y| < r`: `|u(x)−u(y)| ≤ C(|x−y|/r)^α(2M + r‖f‖_n/λ)`, for `|x−y| ≥ r`: `≤ 2M(|x−y|/r)^α` | Pass |
| `harnack_of_isStrongSolution_ball`, `Suggested.lean:411` | sign of `f` | GT 9.22 with `Lu = f` and `−aⁱʲ∂ᵢⱼu = f` differ by `f ↦ −f`, same `‖f‖_{Lⁿ}` | Pass |
| §5.6 Problem 4.9 `:1903–1907` | `u = (x₁²−x₂²)(−log r)^{1/2}` | with `g = L^{1/2}`, `L = −log r`: `Δg = −L^{−3/2}/(4r²)`, `2∇f·∇g = −2fL^{−1/2}/r²`, so `Δu = −2fL^{−1/2}/r² − fL^{−3/2}/(4r²) → 0`; `∂₁₁u ∋ 2L^{1/2} → ∞` | Pass |
| `holderOnWith_iteratedFDeriv_two_of_schauder`, `Suggested.lean:436` | `u = x₁²`, `a = I`; dilation | `f = −2`, `[D²u]_α = 0`; `[D²u]_α ↦ r^{2+α}`, `M_f ↦ r²`, `K_f ↦ r^{2+α}` | Pass |
| §5.7 Riesz identity `:1957–1960` | multipliers | `(2πiξ_i)(2πiξ_j)/(4π²|ξ|²) = −ξ_iξ_j/|ξ|² = (−iξ_i/|ξ|)(−iξ_j/|ξ|)`; on `ℝ`, `H² = −I` | Pass |
| §5.7 VMO witness `:1961–1968` | `a = I + b x̂⊗x̂`, `u = |x|^γ` | `∂ᵢⱼ|x|^γ = γ|x|^{γ−2}(δᵢⱼ + (γ−2)x̂ᵢx̂ⱼ)`; `aⁱʲ∂ᵢⱼu = γ|x|^{γ−2}((n+γ−2) + b(γ−1)) = 0`; `D²u ∈ Lᵖ` iff `p < n/(2−γ) < n`; `n = 1`: `b = −1` | Computation right, wording (R04) |
| §5.7 `n = 1` Check `:1970–1973` | `a = 1 + 1_{x>1/2}`, `f = 1` | `u'' = −1, −1/2`; `‖u''‖₂² = 1/2 + 1/8 = 5/8`; `√(5/8) ≤ 1 = 1/λ` | Pass |
| §6.1 sharp target `:2022–2026` | `u = Σe^{−k²t}sin(kx)/k` | `Σ(1/k²)·k²·1/(2k²) < ∞`; `‖u(t)‖²_{H¹} = (π/2)Σe^{−2k²t} → ∞` | Pass |
| §6.2 improved regularity `:2046–2048` | `a = 1 + 1_{x>0}`, `u = w(x)` stationary | `w' = (C−x)/a` jumps, `w ∉ H²_loc`, `u ∉ L²(0,T;H²_loc)` | False as stated (R02) |
| §6.2 energy identity `:2053–2055` | `e^{−t}sin x` | `(π/2)e^{−2t} + (π/2)(1−e^{−2t}) = π/2` | Pass |
| §6.3 `BUC` strong continuity `:2081–2083` | pinned `ApproximateIdentity.lean:194` | `heatKernel t ⋆ g → g` uniformly, `g` bounded uniformly continuous | Duplicate (R01) |
| §6.3 domain Check `:2114–2117` | `n = 3`, `u = χ/|x|` | `∫|x|^{−2} < ∞`; `Δ(1/|x|) = −4πδ₀ ∉ L²` | Pass |
| §6.4 metric and odd orders `:2169–2197` | `(0,0),(0,4)`; `u = t`; `t^{(1+α)/2}`; `√t` | `d_par = 2`; `[t]_{α,par} = sup|t−s|^{1−α/2}`; `|t^γ − s^γ| ≤ |t−s|^γ`, `u_t = γt^{γ−1}` unbounded; `|√t − 0|/t^{(1+α)/2} = t^{−α/2} → ∞` | Pass |
| §6.4 interpolation `:2179–2181` | `cos(ωx)` | `ω ≤ (1/2)(εω² + 1/ε)` at `ε = 1/ω` | Pass |
| §6.5 Checks `:2238–2243` | `e^t cos x`; `c = 1`, `e^t` | `Pu = 2e^t cos x`, `e^T ≤ 1 + 2Te^T`; `Pu = 0`, equality `e^T = e^T` | Pass |
| §6.6 time reversal, `K ≥ T` `:2278–2288` | `u = s`; `u = t` | `P_back u = 1`, `P̃v = −1 = −g∘R`; `‖u‖_{2+α} ≥ T`, data norm `1` | Pass |
| §6.9 weight `:2387–2390` | `w = e^x` | `b_w = b + 2a`, `c_w = c + a + b` | Pass |
| §7.1 Checks `:2445–2460` | `e^{2πiξ₀x}`, `|ξ₀| = 2^j`; `f = 1`; `L²` | `ψ(2^{j−k}e) = 1` iff `k = j−1`; `P_0 1 = 1`; `1/2 ≤ Σψ_j² ≤ 1` | Pass |
| §7.2 Dirac, Zygmund `:2513–2522` | `δ₀`; `x log|x|` | `‖𝓕⁻¹ψ_j‖_p = 2^{jd/p'}‖𝓕⁻¹ψ‖_p`; second difference `hφ(x/h)` with the `log h` terms cancelling since `(t+1)+(t−1)−2t = 0`, `φ` bounded; `|f(x)−f(−x)|/(2|x|) = |log|x|| → ∞` | Pass |
| §7.3 decomposition `:2535–2542` | pairs `(k,j)` | `k ≤ j−2`, `k ≥ j+2`, `|j−k| ≤ 1` partition `ℕ²` | Pass (R01 of r4 repaired) |
| §7.3 `f = 1` `:2563–2567` | `S_{j−1}1` | `= 1` for `j ≥ 2`, `0` for `j ≤ 1`; `T_1 g = Σ_{j≥2}P_j g`, `T_g 1 = 0`, `R = P_0g + P_1g`; sum `g` | Pass |
| §7.3 same frequency `:2558–2562` | `f = g = e^{2πiξ₀x}` | `S_{j−2}f = Σ_{k≤j−3}P_k f = 0`; `R = P_{j−1}f·P_{j−1}g = fg` | Pass |
| §8.1 kernel, Gaussian `:2617–2623` | Tao (2.18) at `ℏ = m = 1`, `t ↦ 2t`; `d = 1` | `(2πi·2t)^{−d/2}e^{i|x|²/(4t)}`; `‖S(t)f‖_∞ = (1+16π²t²)^{−1/4} ≤ (4π|t|)^{−1/2}` | Pass |
| §8.1 wave decay `:2598–2600` | Tao (2.19), `λ = 2^j` | `λ^d⟨λt⟩^{−(d−1)/2} = 2^{jd}(1+2^j|t|)^{−(d−1)/2}` up to constants | Pass; locator (R03) |
| §8.2 admissibility, scaling `:2658–2666` | `(4,∞,1)`, `(2,6,3)`, `(2,∞,2)`; `u_λ` | `1/2`, `3/2`, excluded; `λ^{−d/r−2/q} = λ^{−d/2}` iff on the line | Pass |
| §8.3 wave pairs `:2701–2707` | `(2,∞,3)`; `(2,6,4)` | `1/2 = (d−1)/4` excluded; `3/4 = 3/4`, `s = 2 − 2/3 − 1/2 = 5/6` | Pass |
| §9.1 Check `:2752–2757` | `d = 3`, `f = |x|^{−γ}` | `u` is `(2−γ)`-Hölder; `2 − 3/q → 0` as `q ↓ 3/2` | Pass |
| §9.2 Check `:2790–2795` | `A = 1 + u²/(1+u²)`, `f = 1` | `u = ∫₀ˣ(c−s)/a`, `c ∈ [0,1]`, `|u| ≤ 1/2` | Pass |

**Principles.** No route-specific shortcut; no re-planned roadmap (PDE is on main and this is its revision; the stochastic programme deferred to a Part II re-plans nothing); no upward or cyclic supply; no copied passage; no algorithm; no sorried data; no `set_option`. The ownership question of the Lipschitz-graph surface measure against GeometricMeasureTheory G2 on main was settled in the previous round (PDE owns it because GeometricMeasureTheory consumes PDE); the phrasing requested there is in place.

## Not verifiable

- Evans, Gilbarg–Trudinger, Leoni, Grisvard, Adams–Fournier, Stein 1970 and 1993, Grafakos (both volumes), Giaquinta–Martinazzi, Lieberman, Bahouri–Chemin–Danchin: no legal text (publisher landing pages only). The sampled locators of §1.1 (Leoni 7.13), §1.3 (Stein V §3.3 Theorem 3), §3.4 (Evans 2.2.1 Theorem 1, 2.2.4 Theorem 14; Gilbarg–Trudinger 2.12–2.14), §4.1 (Evans 6.2.2 Theorem 2), §4.4 (Evans 6.5.1 Theorem 1), §5.3 (Gilbarg–Trudinger 8.32, 8.34), §5.5 (9.20, 9.22, 9.24), §6.2 (Evans 7.1.2 Theorems 3–4, 7.1.3 Theorem 5), §6.6 (Lieberman Chapter 5), §7.1 (Bahouri–Chemin–Danchin 2.1; Grafakos 6.1.2), §9.1 (Gilbarg–Trudinger 8.29) were checked against the standard statements only; the Gårding constants of §4.1 were recomputed from the standard proof (table).
- Keel–Tao 1998 (the DOI resolves to Project MUSE), Coifman–Rochberg–Weiss 1976 (JSTOR), Gehring 1973 (the Project Euclid PDF URL returns a one-page HTML shell; the Springer DOI is paywalled), Chiarenza–Frasca–Longo 1991 (`arpi.unipi.it` HTTP 403), Lunardi's Cortona notes (`people.dmi.unipr.it` HTTP 503 again), Axler–Bourdon–Ramey (the author-page PDF was fetched but is AES-encrypted and no text could be extracted): recorded in the job's `needs-references.toml` where the service found nothing; Tao's chapter attributes the endpoint theorem to Keel–Tao at `tao-dispersive` line 3856. Di Fazio and Auscher–Qafsaoui (§5.2) were not attempted this round (outside the sample; both failed in the previous round).
- §6.4 and §6.8 cite no source and were checked against their own Checks only.
- Ownership against open pull requests whose files the brief does not supply was not checked.

## Source issues

- none
