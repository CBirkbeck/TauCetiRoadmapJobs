# Review of PDE (pull request #93 at 3e7b835)

**Verdict:** needs changes

Full re-review of the repaired head (4688 changed lines since b13f80f). The gate passes at this head (every scanner 0, build 0), the dependency check reports no UPWARD or CYCLE line, `Suggested.lean` elaborates with exactly the 15 intended `sorry` warnings, and ten of the previous review's twelve findings are repaired or repaired on this roadmap's side (table under `## Previous findings`). What blocks: the paraproduct decomposition of §7.3 is displayed with an index convention under which its own `f = 1` Check refutes it (R01); the supplier contracts cite Tau Ceti declarations that do not exist at the pull request's own pin, because the inventory was written against the newer Tau Ceti that main's manifest pins (R02); the strong-type maximal inequality stated as a headline is already a theorem at the pin and closes in one term (R03); the inventory still omits a dozen pinned results that sections plan again (R04); the Harnack inequality for weak solutions, named a pillar, is statable and absent (R05); and the global `W^{2,p}` theorem drops its source's `n ≥ 3` (R06).

## R01 (P1) — The displayed Bony decomposition double-counts adjacent blocks

**Location:** `TauCetiRoadmap/PDE/README.md:2184–2187`: "`fg = T_f g + T_g f + R(f, g)` … `T_f g = Σ_j S_{j−1}f · P_j g` with `S_j = Σ_{k≤j} P_k` … `R(f,g) = Σ_{|j−k|≤1} P_j f · P_k g`".

**Claim:** With `S_{j−1} = Σ_{k ≤ j−1} P_k`, the three terms sum to `fg + Σ_{|j−k|=1} P_j f P_k g`, not to `fg`: the pairs `(k, j) = (j−1, j)` lie both in `T_f g` and in `R`. The identity as displayed is false, and the §7.3 Check at `:2205` ("`T_1 g = Σ_{j≥2} P_j g`") silently uses `S_{j−2}`, the convention of the cited source (Bahouri–Chemin–Danchin, whose low-frequency cut-off `S_{j−1}` sums the blocks of index at most `j−2`).

**Witness:** `f = 1`, `g` arbitrary, with the displayed definition: `S_{j−1}1 = 1` for `j ≥ 1`, so `T_1 g = Σ_{j≥1} P_j g`; `T_g 1 = 0`; `R(1,g) = P_0 g + P_1 g`; the sum is `g + P_1 g`. With `S_{j−2}`: `Σ_{j≥2} P_j g + 0 + P_0 g + P_1 g = g`.

**Repair:** Define `T_f g = Σ_j S_{j−2} f · P_j g` (equivalently keep `S_{j−1}` and set `S_j = Σ_{k ≤ j−1} P_k`), leaving `R` as displayed. Tested: on `f = 1` the three terms sum to `g` as above; on `f = g = exp(2πi ξ₀·x)`, `|ξ₀| = 2^j`, both blocks sit in `P_{j−1}` (`ψ(2^{−j}ξ₀) = χ(e/2) − χ(e) = 0`, `ψ(2^{−(j−1)}ξ₀) = 1`), `S_{j−3}f = 0`, so the product is carried by the `(j−1, j−1)` resonant term, as the first Check says.

## R02 (P2) — The supplier contracts cite declarations that are not at the pull request's pin

**Location:** `TauCetiRoadmap/PDE/README.md:253` ("line numbers are those of the pinned revision"), `:267` (`Wkp0.denseRange_ofTestFunctionₗ`), `:272` (`TauCeti.Wkp0.extendByZeroₗᵢ`, `Analysis/Sobolev/Wkp/Extension.lean:112`), `:294–297` (`TauCeti.W1p.hyperplaneTrace` and three companions, `Analysis/Sobolev/Trace/Hyperplane.lean`), `:385–388` (the two parabolic maximum principles, `Analysis/PDE/MaximumPrinciple/Parabolic.lean`), `:389–392` (`TauCeti.heatKernel` and six companions, `Analysis/PDE/HeatKernel/Basic.lean`); consumed at `:510`, `:723`, `:728`, `:1746`, `:1773`, `:1781`, `:1820`.

**Claim:** The pull request's `lake-manifest.json` pins Tau Ceti `a91d3aa` (5 October 2026) and Mathlib `6b7abb3c`. At that pin the files `Analysis/Sobolev/Trace/Hyperplane.lean`, `Analysis/PDE/HeatKernel/Basic.lean`, `Analysis/PDE/MaximumPrinciple/Parabolic.lean` and `Analysis/Sobolev/Wkp/Extension.lean` do not exist, `Analysis/Sobolev/Wkp/Zero.lean` has 373 lines and no `denseRange` theorem, and the cited lines of `Analysis/Sobolev/W1p/Basic.lean` (355, 359, 363, 367, 374, 378) and `Wkp/Zero.lean` (334, 366) land inside other declarations (`W1p` is at `:375`, `W1p.valueL` at `:383`, `Wkp0` at `:364`). Every one of these names, with exactly the cited line numbers, exists at Tau Ceti `358314d` (7 October 2026), which is the pin of the content repository's main branch, not of this branch. So §1.2, §1.6, §6.2, §6.3 and §6.5 consume as "pinned" a heat kernel, a hyperplane trace, a parabolic maximum principle and a higher-order zero extension that the roadmap's own build cannot see: at this pin they are unowned prerequisites.

**Witness:** `TauCeti/Analysis/PDE/HeatKernel/Basic.lean` absent at `a91d3aa`; present at `358314d` with `def heatKernel` at `:68` and `fourier_heatKernel` at `:213`. Likewise `Trace/Hyperplane.lean:182` (`W1p.hyperplaneTrace`) and `MaximumPrinciple/Parabolic.lean:252`.

**Repair:** Make the branch's pins the ones the inventory was written against (main's `lake-manifest.json`: Tau Ceti `358314d`, Mathlib `f6090c70`), rebuilding `Suggested.lean` against them; or, if the branch must keep `a91d3aa`, move the heat kernel, the hyperplane trace, the parabolic maximum principle and the order-`k` zero extension into the targets of §6.3, §1.6, §6.2 and §1.2 with their intended signatures. Either way recompute the `W1p/Basic.lean` and `Wkp/Zero.lean` line numbers for the pin actually used.

## R03 (P2) — The strong-type maximal inequality is a theorem at the pin and is stated as a headline

**Location:** `TauCetiRoadmap/PDE/README.md:400` ("Tau Ceti has no … strong-type maximal inequality"), `:801–803` ("Prove the strong-type `(p,p)` bound … `lintegral_maximalFunction_rpow_le` in `Suggested.lean`"), `TauCetiRoadmap/PDE/Suggested.lean:185–189`.

**Claim:** At the pin, `TauCeti/MeasureTheory/Integral/MaximalFunction.lean:447` proves `lintegral_rpow_maximalFunction_le` (`∫⁻ (Mf)^p ≤ ofReal(2p·2^(p−1)/(p−1)) · 4^n · ∫⁻ ‖f‖ₑ^p` for `1 < p`, any `F` with an `ENorm`, `AEMeasurable ‖f‖ₑ`) and `:484` its `eLpNorm` form, exactly by the Marcinkiewicz route §2.1 plans. The headline restates a pinned theorem with a weaker constant.

**Witness:** On a scratch copy the `sorry` at `Suggested.lean:189` was replaced by one term, `⟨_, ENNReal.mul_ne_top ENNReal.ofReal_ne_top (by finiteness), fun f hf => lintegral_rpow_maximalFunction_le mu hf.enorm hp⟩`; the file elaborated with that declaration no longer warning.

**Repair:** Delete `lintegral_maximalFunction_rpow_le` from `Suggested.lean`; in `:400` and §2.1 cite `TauCeti.lintegral_rpow_maximalFunction_le` and `TauCeti.eLpNorm_maximalFunction_le` (`MaximalFunction.lean:447,484`) with their explicit constant; keep the uncentred and dyadic comparisons and the Fefferman–Stein vector-valued inequality as §2.1's targets.

## R04 (P2) — The inventory still plans results that are at the pin

**Location:** `TauCetiRoadmap/PDE/README.md:401–402` ("no Hölder space of positive order"), `:734–742` (§1.7 defines `C^{k,α}` and `C_b^{k,α}(ℝⁿ)`), `:990–992` ("Prove the converse: a continuous function … with the mean-value property … is smooth and harmonic"), `:1021–1025` ("Prove the classical weak maximum principle … the comparison principle … the strong maximum principle"), `:1030–1046` (the classical Hopf lemma), `:1123` ("derive the Harnack convergence theorems"), `:1159` ("Construct the half-space Green function … by reflection"), `:1443` (§5.1 *Needs:* "§1.2 difference-quotient characterization of `W^{1,2}`").

**Claim:** Each of these exists at the pin and is not cited anywhere in the contracts: `TauCeti.C1HolderSpace` (`Analysis/Holder/One.lean:94`) and `TauCeti.C2HolderSpace` (`Analysis/Holder/Two.lean`), the bounded global `C^{1,α}` and `C^{2,α}` Banach spaces on a normed space; `TauCeti.harmonicOnNhd_of_setAverage_ball_eq` and `harmonicOnNhd_iff_continuousOn_setAverage_ball_eq` (`Analysis/InnerProductSpace/Harmonic/MeanValue/Converse.lean:68,116`), the mean-value converse; `TauCeti.le_of_mul_le_laplacian_add_fderiv_le_frontier` (`Analysis/InnerProductSpace/Laplacian/LowerOrderMaximumPrinciple.lean:54`), `eqOn_const_of_mul_le_laplacian_add_fderiv_of_isMaxOn` (`StrongMaximumPrinciple.lean:212`), `le_of_laplacian_le_of_le_frontier` (`Comparison.lean:62`) and `fderiv_pos_of_mul_le_laplacian_add_fderiv_of_lt_ball_of_le_sphere` (`HopfLemma.lean:253`), the weak, strong, comparison and Hopf statements for `−Δ − b·∇ + c` with bounded `b`, `0 ≤ c ≤ γ`; `Analysis/InnerProductSpace/Harmonic/Convergence.lean`, locally uniform limits of harmonic functions are harmonic; `TauCeti.halfSpaceGreenKernel` (`Analysis/PDE/GreenFunction/HalfSpace.lean`); `TauCeti.W1p.isCompactOperator_valueL_restrictL` (`Analysis/Sobolev/W1p/LocalCompactness.lean:111`), local Rellich on `W^{1,p}(Ω)` without boundary regularity; `exists_norm_le_hasWeakLineDerivOn_of_frequently_eLpNorm_inv_mul_sub_le` (`Analysis/Sobolev/DifferenceQuotient.lean:172`), the `L²` difference-quotient criterion; and the Fredholm index theory under `Analysis/Fredholm/` (`Index.lean`, `CompactPerturbation.lean`) that §4.3 consumes as "the Riesz theory of `Analysis/Normed/Operator/Compact`". The headline `hopf_boundary_point` generalises the pinned Hopf lemma from `a = I` to variable symmetric `a` and is a genuine target, but the README must say so.

**Witness:** `Analysis/InnerProductSpace/Laplacian/HopfLemma.lean:253` at `a91d3aa`; `Analysis/Holder/Two.lean` module docstring: "bounded `C²` maps with bounded first derivative and bounded globally `α`-Hölder second derivative … complete".

**Repair:** Cite each as the implemented case in the contracts and the sections (`C_b^{k,α}` for `k ≤ 2` pinned, `k ≥ 3` and the domain versions the target; the mean-value converse pinned, derivative estimates and Liouville the target; §3.2's classical principles and Hopf pinned for `a = I`, variable `a` the target; the half-space kernel pinned, its Poisson representation the target; the difference-quotient criterion pinned; Harnack convergence pinned for locally uniform limits, the monotone-limit alternative the target), and delete the "no Hölder space of positive order" clause.

## R05 (P2) — The Harnack inequality for weak solutions is statable and absent

**Location:** `TauCetiRoadmap/PDE/README.md:20–21` ("the maximum, Hopf and Harnack principles with their exact hypotheses" as the third pillar), `:1547–1549` ("Prove the weak Harnack inequality and the Harnack inequality for nonnegative weak solutions (Gilbarg–Trudinger, Theorems 8.18 and 8.20)"), `TauCetiRoadmap/PDE/Suggested.lean:32–52` (the not-statable list, which does not mention it).

**Claim:** The Harnack inequality `essSup_{B(x₀,r)} u ≤ C(n, Λ/λ) essInf_{B(x₀,r)} u` for a nonnegative weak solution `u ∈ W1p mu B(x₀,4r) 2` of `energyFormH1 a 0 0 u v = 0` under `IsUniformlyEllipticAE` uses only the carriers `exists_holderOnWith_of_isWeakSolution_ball` already uses, plus `essSup`/`essInf` on `mu.restrict`; it is a headline by the roadmap's own Summary and is neither stated nor named as unstatable. The same holds for the Krylov–Safonov Harnack inequality of §5.5 on the `Wkp … n 2` carrier.

**Witness:** `Suggested.lean:355–369` states the Hölder estimate on exactly these carriers; `Mathlib` has `MeasureTheory.essSup` on `mu.restrict (ball x₀ r)`.

**Repair:** State both Harnack inequalities in `Suggested.lean` (weak solutions on `B(x₀,4r)` with the Gilbarg–Trudinger 8.20 constant depending on `n` and `Λ/λ`; strong solutions with the `r‖f‖_{Lⁿ}/λ` forcing term as in `exists_holderOnWith_of_isStrongSolution_ball`), or name them in the module docstring with the carrier they lack.

## R06 (P2) — The global `W^{2,p}` theorem drops its source's dimension hypothesis

**Location:** `TauCetiRoadmap/PDE/README.md:1661–1662`: "the global Dirichlet estimate on `C^{1,1}` domains separately (Chiarenza–Frasca–Longo, *Trans. Amer. Math. Soc.* 336 (1993), Theorem 4.4)". No dimension restriction appears in §5.7 and the Conventions allow `n ≥ 1`.

**Claim:** Theorem 4.4 of that paper is proved under its assumption (A), which fixes `Ω` bounded with `∂Ω ∈ C^{1,1}` in `ℝⁿ` with `n ≥ 3`, `a` symmetric, `a ∈ VMO ∩ L^∞`. The roadmap states the solvability and estimate for every `n ≥ 1` on the strength of this theorem alone, with no producer for `n = 1, 2`.

**Witness:** `chiarenza-frasca-longo-dirichlet` lines 374–390: assumption (A) opens with the domain in `ℝⁿ`, `n ≥ 3`, boundary of class `C^{1,1}`; Theorem 4.4 at line 440 is stated "Assume (A)".

**Repair:** Carry `n ≥ 3` on the Chiarenza–Frasca–Longo-sourced statement, and state the planar and one-dimensional global `W^{2,p}` theorems as separate targets with their own sources (for `n = 1`, `u'' = −f/a` with `1/a ∈ VMO` is an explicit computation; for `n = 2` name a source or leave the global case to `n ≥ 3`). The interior estimate of `:1660` (Ricerche Mat. 1991) could not be read; check its dimension hypothesis the same way.

## R07 (P3) — A resonance Check has the wrong sign

**Location:** `TauCetiRoadmap/PDE/README.md:1329–1331`: "`−u'' − u = f` … `f = sin 2x` is [solvable], with solution `−sin(2x)/3` plus any multiple of `sin x`".

**Witness:** For `u = A sin 2x`, `−u'' − u = 4A sin 2x − A sin 2x = 3A sin 2x`, so `A = 1/3`: the solution is `+sin(2x)/3`.

**Repair:** Write `sin(2x)/3`.

## R08 (P3) — Two constants in §4.1 disagree with the formula and the pinned theorem

**Location:** `TauCetiRoadmap/PDE/README.md:1241–1242` ("Gårding with `C₀ = 1/2`, `β = 2` reads `π/2 ≤ −π/2 + π`, an equality: … this is its size") and `:1235–1236` ("coercive on `H¹₀(Ω)` … with constant `λ/(1 + C_P²)` … (pinned `energyFormH1_poincare_constant_pos`)").

**Witness:** The displayed formula `β = ‖b‖²_∞/(2λ) + ‖c‖_∞ + λ/2` gives `β = 5/2` for `a = I`, `b = 0`, `c = −2`, so the theorem's bound reads `−π/2 ≥ π/2 − 5π/4 = −3π/4`, with slack; `β = 2` is the smallest shift that works for `C₀ = 1/2`, not the theorem's. The pinned `energyFormH1_poincare_constant_pos` (`Analysis/PDE/EnergyForm/Sobolev.lean:459`) is `0 < (λ² − β²P²)/(2λ(P² + 1))`, which at `β = 0` is `λ/(2(P² + 1))`, half the README's value.

**Repair:** Say the Check computes the optimal shift and that the formula's `5/2` holds with slack; cite the pinned constant as `λ/(2(1 + C_P²))` or derive `λ/(1 + C_P²)` as this roadmap's own sharper bound.

## R09 (P3) — The prose asserts what two consumers do, and they do not yet do it

**Location:** `TauCetiRoadmap/PDE/README.md:104–106` ("PseudodifferentialOperators, Layer 5, consumes … Layer 7's Euclidean dyadic partition and Besov spaces, and owns their transport to bundles") and `:671–673` ("the chart-integration formula that the trace below and GeometricMeasureTheory's BV trace both use; it is owned here").

**Witness:** PseudodifferentialOperators at its open head, `TauCetiRoadmap/PseudodifferentialOperators/README.md:1102–1105`, defines its own Euclidean Besov carrier by "the dyadic Lp coefficient sequence norm" and chooses "a smooth inhomogeneous Fourier partition"; GeometricMeasureTheory on main, `TauCetiRoadmap/GeometricMeasureTheory/README.md:177`, derives "graph surface measure" from its area formula, and `:282` builds surface-measure comparisons "using G2".

**Repair:** The single direction PDE → consumer is now correct on this side (no cycle; depcheck clean), so keep the ownership statements but phrase them as this roadmap's: "§7.1–§7.2 own the Euclidean dyadic partition and Besov carrier; PseudodifferentialOperators §5.3's bundle transport and interpolation are to consume them" and "GeometricMeasureTheory G6's BV trace is to consume this graph measure in place of its G2 derivation". The consumers' repointing is their own repair.

## R10 (P3) — Locators, shape and bookkeeping

**Location and claims:**

- `TauCetiRoadmap/PDE/README.md:499` and `Suggested.lean:85`: Evans §5.3.2, Theorem 2 is stated for bounded `U`; the target and the Lean statement are for an arbitrary open set. Cite Meyers–Serrin (Proc. Nat. Acad. Sci. 51 (1964)) or Adams–Fournier, Theorem 3.17, for the general case; Evans covers the bounded one.
- `:988–989`: "Consume Mathlib's `HarmonicOnNhd` and its mean-value characterization on inner-product spaces". At the pin the mean-value property in every dimension is Tau Ceti's `InnerProductSpace.HarmonicOnNhd.setAverage_ball_eq` (`Analysis/InnerProductSpace/Harmonic/MeanValue/Basic.lean:328`); Mathlib's `Mathlib/Analysis/InnerProductSpace/Harmonic/` has no averaging theorem.
- `:1860–1861`: "the parabolic balls are the cylinders `B(x,r) × (t − r², t + r²)`". With `d_par = ‖x − y‖ + √|t − s|` the ball of radius `r` is `{‖x−y‖ + √|t−s| < r}`, which contains `B(x, r/2) × (t − r²/4, t + r²/4)` and lies in the cylinder: comparable, not equal.
- `:2263–2265` (§8.1, the `σ = 0` Check): with `σ = 0` the admissibility equation `1/q = 0` admits every `(∞, r)`; the energy identity singles out `r = 2` because the family is `L²`-valued, not because `(∞, 2)` is the only admissible pair.
- Checks per definition: §1.7 (four definitions, four Checks, Campanato one), §6.4 (the metric, the seminorms, the spaces of every order, the traces: four Checks) and §7.2 (`B^s_{p,q}`, `Ḃ^s_{p,q}`, `𝒞^s`, `c^s`: four Checks) give fewer than three discriminating Checks to each definition; and each section carries one `*Needs:*` line for several theorems with different needs (for instance §1.6's trace needs the graph measure, the extension does not).
- No `sources.toml` records the cited works; the previous review's request stands.

## Previous findings

| Previous | State at this head |
| --- | --- |
| R01 (P1) VariationalMethods cycle | Repaired: `:84–89` makes VariationalMethods a non-supplier ("Nothing here consumes it"); the dependency check now reports 0 problems. |
| R02 (P1) GeometricMeasureTheory cycle | Repaired on this side: `:63–70` "It is a consumer of this roadmap, not a supplier: nothing here cites it"; §3.2 takes the gradient-image bound from Mathlib's `addHaar_image_le_lintegral_abs_det_fderiv`. The duplicate G2 graph measure is noted in R09. |
| R03 (P1) UnboundedOperators supplier | Repaired: `:74–79` cites OperatorTheory's family README, whose `:135–136` on main carry the `LinearPMap` and `zI − A` vocabulary; no operator realization is consumed. |
| R04 (P2) inventory on the pin | Partly: the inventory now cites the implemented carriers and theorems, but against Tau Ceti `358314d` rather than this branch's `a91d3aa` (R02), and still misses the pinned maximal, Hölder, harmonic and classical-principle results (R03, R04). |
| R05 (P2) headline theorems | Repaired in form: 15 sorried headlines on pinned carriers, including D18's compatibility condition as prescribed. One is a pinned theorem (R03); the Harnack inequalities are missing (R05). |
| R06 (P2) Besov ownership | Repaired on this side: Layer 7 owns the Euclidean construction, PseudodifferentialOperators the bundle transport (`:104–106`, `:2087–2089`); the consumer's text still builds it (R09). |
| R07 (P2) Calderón–Zygmund hypothesis | Repaired: `:876–877` and `Suggested.lean:205–224` make the `L²` operator the primitive datum; the multiplication-by-`x` Check at `:906–910` is the negative control. |
| R08 (P2) empty domain | Repaired: `:1354–1359` carries nonemptiness on the first-eigenvalue statements, with the `Ω = ∅` Check at `:1376–1379`. |
| R09 (P2) Rosales `n ≥ 2` | Repaired: `:1047–1062` keeps `n ≥ 2` with the `q = 3/2` witness and states the one-dimensional flux version separately; the Check at `:1095–1099` carries `u = x + 1`. |
| R10 (P3) locators | Mostly repaired: Keel–Tao has its entry (`:2575–2576`), X0–X2 carry Bahouri–Chemin–Danchin and Tao locators, `MemSobolev` and `continuousLinearEquivOfBilin` are spelt as at the pin, the X3 bullets with their spacing slips are gone with X3. `sources.toml` is still absent (R10 here). |
| R11 (P3) README shape | Repaired: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, nine `## Layer k` sections with `### k.n`, Examples and Dependencies, Downstream consumers, References. |
| R12 (P3) coordinate padding | Repaired: the 32 parabolic-coordinate declarations are gone; the file has 15 sorried theorems, three definitions and no proved declaration. |

## Verified sound

**Scope.** HEAD `3e7b83519c142f42e5e0b931e025de0ec96a2dbe`; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/PDE'` is empty. The folder holds `README.md` (2592 lines), `Suggested.lean` (423 lines), `PROGRESS.md`, `STATUS.md` (generated status files, as on main) and `metadata.toml`; the gate's `stray-files` is 0. Main's PDE carries the stochastic programme only as a stretch-goal bullet (`:534–535` on main), so moving it to a Part II re-plans nothing on main; no roadmap named "PDE, Part II" exists on main or in any open pull request (checked with the roadmap grep), which is consistent with its description as a later roadmap.

**Gate.** The worker's gate at this head: every scanner 0, `depcheck=0`, `build=0`, OK. My own run of the prescribed movable dependency command printed exactly

```text
depcheck: 204 roadmaps, 1400 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line. PDE is not in the merge order (nor are OneParameterSemigroups and VariationalMethods); its suppliers OneParameterSemigroups, OperatorTheory, BanachAlgebras and AlgebraicTopology are on main, so it is placed after them.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/PDE/Suggested.lean` from the worktree: exit 0 in 4 s, exactly 15 "declaration uses `sorry`" warnings at lines 87, 122, 136, 155, 165, 185, 230, 239, 260, 292, 305, 331, 355, 377, 404, nothing else. The file has a single `public import Mathlib` plus six `TauCeti.*` modules that exist at the pin, no `set_option`, no `lemma`, no sorried data: `IsUniformlyEllipticAE` and `IsLipschitzDomain` are `Prop`s with real bodies and `CalderonZygmundOperator` bundles pinned data.

**Binder check.** A scratch file with `#check @` for all 18 declarations elaborated; each type agrees with its README statement: no section binder was lost (`[mu.IsAddHaarMeasure]`, `[Fact (1 ≤ p)]`, `[DecidableEq ι]`, `Bornology.IsBounded`, `IsConnected`, `IsLipschitzDomain` all appear where the README needs them), `ContDiffOn ℝ (↑⊤)` in `dense_contDiffOn_representatives_wkp` is the smooth class `∞` (the cast of `⊤ : ℕ∞`), not analytic, matching the pinned order-one theorem, and `exists_holderOnWith_of_isStrongSolution_ball` carries `[Fact (1 ≤ card ι)]`, excluding `n = 0`. Nothing changed.

**One-tactic probe.** Of the 15 sorried theorems only `lintegral_maximalFunction_rpow_le` closes from the library (one term, R03). The other 14 need the roadmap's constructions; no `rfl`, `simp` or `infer_instance` candidate exists for them.

**Cross-roadmap citations resolved this round.** OneParameterSemigroups on main, "Part A — Strongly continuous semigroups" at `:91`; OperatorTheory on main `:127–138` (`LinearPMap`, `TauCeti.LinearPMap` resolvent core, `zI − A`); BanachAlgebras on main `:1116` (A8) and `:1148–1159` (Schauder on a nonempty closed bounded convex subset of a real Banach space, consuming AlgebraicTopology Stage 2 item 7's `brouwerFixedPoint_compactConvex_finiteSpan`); AlgebraicTopology on main `:393–399` (item 7: Brouwer for nonempty compact convex subsets of a finite-dimensional real normed space); Isoperimetry on main `:182` (I3, sharp periodic Wirtinger) and `:301` (I5, sharp BV Sobolev), which calls PDE a non-sharp supplier at `:71–74`; GeometricMeasureTheory on main `:57–61`, `:279–282` (consumer of A.1–A.6); PseudodifferentialOperators at its head `:98–100`, `:1018`, `:1268` (consumer of Lane A, B.8–B.10, B.9); StochasticCalculus at its head `:23`, `:2273`, `:2417` (consumer of C12, C15, B8); NoncommutativeIntegration at its head `:178–180` (consumer of item 9, Riesz–Thorin); VariationalMethods at its head `:84`, `:1069–1070` (uses Tau Ceti's spectrum as an example, consumes no PDE section). The label forms A1–A7, B8–B11, C12–C15, D16–D19 kept in the headings make every consumer's "Lane" citation resolve.

**Library declarations opened at the pins** (Mathlib `6b7abb3c`, Tau Ceti `a91d3aa`). Mathlib, all 18 cited locators resolve to the named declaration: `TemperedDistribution.lean:160`, `Sobolev.lean:73,153`, `SobolevInequality.lean:601`, `LaxMilgram.lean:105`, `FredholmAlternative.lean:164`, `Spectrum.lean:137`, `Differentiation.lean:855`, `Volume/Measure.lean:68,72`, `NormDet.lean:433`, `Hausdorff.lean:733`, `Rademacher.lean:385`, `Jacobian.lean:897`, `Holder.lean:51,57`, `ProdLp.lean:256`, `Hadamard.lean:593` (in namespace `Complex.HadamardThreeLines`); `besselPotential` is the multiplier `(1 + ‖ξ‖²)^(s/2)`, so the Conventions' `(1 − (2π)⁻²Δ)^{s/2}` and the §1.3 `2π` witness are right. Tau Ceti, 97 of the cited locators resolve to the named declaration at `a91d3aa` (the full list was checked line by line: weak derivatives, `Wkp`, `W1p0`, restriction, Meyers–Serrin, smooth density, `wkp0Submodule_top_eq_top`, embedding, Morrey, both Poincaré files, Rellich, Bessel comparison, `HolderSpace`, maximal function, both Marcinkiewicz engines, `UniformlyEllipticOn`, energy forms, Lax–Milgram, Dirichlet problem, Fredholm alternative, spectrum, weak maximum principle, interior regularity, Hölder continuity, Caccioppoli, Newtonian and ball kernels, Perron, Harnack, strong principle, semigroups, Hille–Yosida, `Generation/LumerPhillips.lean`); the 17 that do not are R02's. The statements read agree with the README's descriptions: Poincaré–Wirtinger on a ball with constant `2^(n+1) R` (`Wirtinger/W1p.lean:303`), slab Poincaré with constant `b − a` and no boundedness (`Poincare/W1p0.lean:92`), De Giorgi with `1/2* + 1/n = 1/2`, precise representative and constant `C R^(−α) R^(−n/2) ‖u‖_{L²(Ω)}` (`HolderContinuity.lean:76`), interior `H²` for a constant matrix with only the coercivity bound (`Interior.lean:585`), the Fredholm alternative requiring a coercive base form (`FredholmAlternative.lean:193`), the first eigenvalue with `hOmega_nonempty` (`Spectrum.lean:362`), `UniformlyEllipticOn` as `λ‖ξ‖² ≤ ξ·aξ` and `|η·aξ| ≤ Λ‖η‖‖ξ‖` (`Ellipticity/Basic.lean:474`), the weak-type bound with `4^n` (`MaximalFunction.lean:363`), the local Harnack constant `3^n` from `ball c (4r)` to `ball c r` (`Harnack/Basic.lean:92`).

**Sources read** (the seeded sample and the finding targets). `rosales` line 94 (Section 2, p. 2: `n ≥ 2` standing), lines 521–538 (Theorem 4.1, p. 9: `q > n`, `a, b ∈ C^{0,α}`, `c ∈ L^q`, `d ∈ L^{q/2} ∩ L^{1,α}`, weakly non-positive `b, d`, `a` symmetric at `−eₙ`, `u ∈ C ∩ W^{1,2}` supersolution, `u > u(−eₙ) = 0`, conclusion `liminf u((h−1)eₙ)/h > 0`), lines 854–858 (Remark 4.2, p. 13: general `α ∈ (0,1)`, `u(−eₙ) ≤ 0`): §3.2's contract is the source's. `tao-dispersive` lines 3856–3878 (Theorem 2.3, printed pp. 74–75: `2 ≤ q, r ≤ ∞`, `2/q + d/r = d/2`, `(q,r,d) ≠ (2,∞,2)`, failure at that endpoint noted after the theorem), lines 4023–4056 (Theorem 2.6, printed pp. 77–79: `2 ≤ r < ∞`, `s ≥ 0`, scaling `1/q + d/r = d/2 − s`, wave admissibility `1/q + (d−1)/(2r) ≤ (d−1)/4`), line 4196 (failure at `(2, ∞)` in `d = 3`); Tao's `Δ/2` convention converts to the roadmap's kernel `(4πit)^{−d/2} exp(i|x|²/(4t))` by `t ↦ 2t`. `meyers-1963` lines 255–273 (Theorem 1, printed p. 198), 287–309 (Theorem 2, p. 200), 397–425 (§5 example, p. 204, eigenvalues `μ²` and `1`, extended to all dimensions by descent). `sarason-1975` lines 73–79 (Theorem 1: VMO = BMO-closure of `UC ∩ BMO`). `chiarenza-frasca-longo-dirichlet` lines 374–390, 440–446 (assumption (A) and Theorem 4.4, printed p. 851: R06). `armstrong-kempe` lines 18–30 (the inverse-coercivity condition (2) and the `B_{1/2}` Hölder estimate) and, on GitHub, `DeGiorgi/Holder/PublicEstimate.lean` (`holder_Moser`: `d > 2`, unit ball, `p₀ > 1`, representative, exponent lower bound in `Λ^{1/2}`) and `DeGiorgi/EllipticCoefficients.lean` (`EllipticCoeff` with `coercive_inv` in `Λ⁻¹`, `quadratic_upper` and `mixed_bound` with the same `Λ`): the References entry is accurate.

**Adversarial table** (statement, instances, values on each side, result).

| Statement / location | Instances tried | Computed values | Result |
| --- | --- | --- | --- |
| Conventions, inverse-coercive ⇒ operator bound, `:131–140` | `a = [[1,−k],[k,1]]`, `k = 1` | `ξ·aξ = ‖ξ‖²` so `λ = 1`; `aᵀa = (1+k²)I` so `M = √2`; `a⁻¹ = (I − kJ)/(1+k²)`, `ξ·a⁻¹ξ = ‖ξ‖²/2` so `Λ = 2`; `‖aξ‖² = 2‖ξ‖² ≤ Λ ξ·aξ = 2‖ξ‖²` | Pass; both conversions exact as stated |
| `IsUniformlyEllipticAE`, `Suggested.lean:69–74` | `a` with `ξ·aξ ≥ λ‖ξ‖²`, `λ > 0` | `a` injective hence invertible, so Mathlib's total inverse is the inverse a.e.; `‖a(x)‖ ≤ Λ` a.e. makes `energyFormH1 a 0 0` an honest integral (no junk `0`) | Pass |
| §1.1 Checks `:473–488` | `x`, `|x|`, Cantor, `x²` on intervals | weak derivatives `1`, `sign`, none, `2x`; endpoint pair `(0,1)` for `x` | Pass |
| §1.2 `x^{3/2}` Check `:527–530` | `k = 2`, `p = 2` | `u'' = (3/4)x^{−1/2}`, `(u'')² = (9/16)/x`, divergent at `0` | Pass |
| §1.3 `2π` witness `:559–565` | `u = e^{−πx²}` | `∫(1+ξ²)e^{−2πξ²} = (1/√2)(1 + 1/(4π))`; `‖u‖² + ‖u'‖² = 1/√2 + π/√2` | Pass |
| §1.4 `|x|^{−a}` sharpness `:592–595` | general `n, p` | `(a+1)p < n ⟺ a·np/(n−p) < n` | Pass |
| §1.4 `n = 1`, `p = 1` `:597` | `u = x(1−x)` | `‖u‖_∞ = 1/4`, `‖u'‖₁ = 1/2` | Pass |
| §1.5 interval constant `:633–635` | `u = x(1−x)` | `‖u‖₂² = B(3,3) = 1/30`, `‖u'‖₂² = 1/3`, ratio `0.3162 < 1/π = 0.3183` | Pass |
| `exists_poincare_wirtinger`, `Suggested.lean:122` | `Ω = ∅`; two disjoint balls | zero space, any `C`; disconnected: `u = ±1` has `∇u = 0`, `u − u_Ω ≠ 0`, excluded by `IsConnected` | Pass |
| `IsLipschitzDomain`, `Suggested.lean:103` | square corner; slit disk; cusp; frontier point `x` | `γ(s) = |s|`, `K = 1`; no cylinder about a slit point is an epigraph; `√|s|` not Lipschitz; `x ∉ Ω` forces `γ(0) ≥ 0` and `x ∈ closure Ω` forces `γ(0) = 0` | Pass; the vertical window needs no extra `|γ| ≤ h/2` |
| `exists_trace`, `Suggested.lean:136` | `n = 0`, `Ω = (a,b)`; `Ω = ∅` | `μHE[0]` is counting measure on `{a, b}`, `Lᵖ` is `ℝ²`, trace is the §1.1 endpoint pair; empty: `T = 0`, kernel = whole zero space | Pass |
| `isCompactOperator_valueL_of_isLipschitzDomain` at `p = ∞`, `Suggested.lean:165` | bounded Lipschitz `Ω` | finitely many charts ⇒ finitely many components ⇒ `W^{1,∞}` bounded sets are equi-Lipschitz on the compact closure; Arzelà–Ascoli gives uniform limits | Pass |
| §1.6 graph measure `:710–713` | `γ(s) = s` on `(0,1)`; `γ = 0` | length `√2`; `|U|` | Pass |
| §1.6 Rellich Check `:718–721` | `sin(jx)/j` | `‖u_j‖₂² = π/(2j²)`, `‖u_j'‖₂² = π/2` | Pass |
| §1.7 Campanato Check `:764–768` | `n = 1`, `p = 2`, `|x|^α` | `∫_{−r}^{r}|u − u_r|² ≍ r^{1+2α}`, bounded iff `λ = 1 + 2α` | Pass |
| §2.1 `M 1_{[0,1]}` `:820–822` | `x > 1`; `t ≤ 1/2` | `sup_r` attained at `r = x`, value `1/(2x)`; `{Mf > t} = (1 − 1/(2t), 1/(2t))`, `t·length = 1 − t` | Pass |
| `lintegral_maximalFunction_rpow_le`, `Suggested.lean:185` | pinned theorem | closes with `C = ofReal(2p·2^(p−1)/(p−1))·4^n` | Duplicate (R03) |
| `CalderonZygmundOperator`, `Suggested.lean:205` | `Tf = xf`; `Tf = mf`, `m ∈ L^∞`; `n = 0` | kernel `0` satisfies size and smoothness; `‖1_{[R,R+1]}‖₂ = 1`, `‖x1_{[R,R+1]}‖₂² = R² + R + 1/3 → ∞` so not an instance; `m` bounded is an instance and is `Lᵖ`-bounded, as the class claims; `n = 0` is scalars, bounds trivial | Pass |
| §2.3 Hilbert transform `:911–914` | `H 1_{[0,1]}` | `(1/π) log|x/(x−1)| ∼ 1/(π|x|)`, not `L¹` | Pass |
| §2.4 commutator `:959–961` | `b = x` | kernel `(x−y)/(π(x−y)) = 1/π`, rank one, unbounded | Pass |
| §2.4 John–Nirenberg `:952–955` | `f = log|x|` on `(−1,1)` | `∫ exp(c|f+1|) ≍ ∫|x|^{−c}`, finite iff `c < 1` ⇒ `C₂ ≤ ‖f‖_{BMO}` | Pass |
| §3.1 mean value `:1003–1005` | `x² − y²`; `x²` | circle averages `a² − b²`; `a² + r²/2` | Pass |
| §3.2 classical Hopf, `Suggested.lean:260` | `n = 1`, `v = −(x+1)` on `(−1,1)`; `ι` empty | `v'' = 0 ≥ 0`, strict max `0` at `−1`, quotient `1`; `n = 0`: frontier empty, vacuous | Pass |
| §3.2 half-disk `:1100–1105` | `a = diag(1, s²)` polar, `u = r^s sin θ` | `div(a∇u) = s² r^{s−1} sin θ − s² r^{s−1} sin θ = 0`; `∂a ∼ 1/r` unbounded, so the non-divergence drift hypothesis fails and no Hopf contradiction arises | Pass; Check correctly refutes only the divergence-form claim |
| §3.2 ABP `:1106–1112` | `u = (|x|²−1)/(2n)` | `Δu = 1`, `∇u(B) = B(0,1/n)`, `|∇u(B)| = |B|n^{−n} = ∫ det D²u`; `1/(2n) ≤ 2/n` | Pass |
| §3.3 Harnack ratio `:1129–1132`, `:1137–1140` | `R = 3r`; `r = R/3` | `((R+r)/(R−r))^n = 2^n ≤ 3^n`; pinned theorem uses `4r → r` | Pass |
| §3.4 ball `:1175–1179` | `n = 3`, `f = 1` | `Φ*1_B = (3−|x|²)/6`, trace `1/3`, Green potential `(1−|x|²)/6` | Pass |
| §4.1 Gårding Check `:1240–1242` | `a = I`, `c = −2`, `u = sin x` | `B(u,u) = −π/2`; `C₀ = 1/2`: `π/2 − βπ/2 ≤ −π/2` iff `β ≥ 2`; formula gives `β = 5/2` | Slack (R08) |
| §4.1 continuity bullet `:1232` | general | `|B(u,v)| ≤ (Λ + ‖b‖ + ‖c‖)‖u‖_{H¹}‖v‖_{H¹}` | Pass |
| §4.1 `a = I + x₁J` `:1243–1250` | `u = e^{x₂}` | `div(a∇u) = Δu − ∂₂u = 0` | Pass |
| `existsUnique_weakSolution_lifting`, `Suggested.lean:292` | `Ω = ∅`; `g = 1`, `ℓ = 0` | zero space; `w = u − g` solves `B(w,·) = −B(g,·)` by Lax–Milgram, so `u = 1`, and the wrong formulation returns `0` | Pass |
| `fredholm_compatibility`, `Suggested.lean:305` | `L = [[1,1],[0,0]]`; `−u'' − u = f` on `(0,π)`; `β < 0`; `ι` empty | `ker Lᵀ = span(0,1)`, `(1,0)` solvable, `(0,1)` not; adjoint kernel `sin x`, `∫ sin = 2 ≠ 0` so `f = 1` unsolvable; coercive case vacuous condition; `n = 0` finite-dimensional | Pass |
| §4.3 Check `:1331` | `f = sin 2x` | `−u'' − u = 3A sin 2x` for `u = A sin 2x` ⇒ `A = 1/3` | Sign error (R07) |
| §4.3 Check `:1332–1336` | `c = −2` on `(0,π)` | kernel `sin(√2 x)`, `sin(√2 π) ≠ 0` ⇒ kernel `0` | Pass |
| §4.4 Checks `:1373–1384` | `(0,π)`; `∅`; `(0,π)²` | `λ_k = k²`, `C_P = 1`; empty basis, `dirichletSolutionOperator = 0`; `5 = 1+4 = 4+1` | Pass |
| `exists_wkp_two_of_lipschitz_coefficients`, `Suggested.lean:331` | `a = 1 + 1_{x>0}` on `(−1,1)` | `u' = C/a` jumps, `u ∉ H²`: excluded by `LipschitzOnWith` | Pass |
| `exists_holderOnWith_of_isWeakSolution_ball`, `Suggested.lean:355` | `u = x₁` on `B_r`; `ratio < 1`; `ι` empty | `[u]_{α;B_{r/2}} ≍ r^{1−α}`, `r^{−α−n/2}‖u‖_{L²(B_r)} ≍ r^{1−α}`; `Λ ≤ ratio·λ < λ` contradicts `λ ≤ Λ`, vacuous; point domain trivial | Pass |
| §5.4 half-disk `:1571–1575` | `0 < s < 1` | `∫ r^{2s−1} dr < ∞`, `s`-Hölder, `λ = s²`, `Λ = 1` | Pass |
| `exists_holderOnWith_of_isStrongSolution_ball`, `Suggested.lean:377` | `n = 1`; scaling `x ↦ x₀ + r x` | `u'' = −f/a`, `osc u' ≤ ‖f‖₁/λ`, Lipschitz with `C r^{−1}(M + r‖f‖₁/λ)`; `‖f_r‖_{Lⁿ(B_2)} = r‖f‖_{Lⁿ(B_{2r})}` | Pass |
| `holderOnWith_iteratedFDeriv_two_of_schauder`, `Suggested.lean:404` | `u = x₁²`, `a = I`; dilation by `r` | `f = −2`, `[D²u]_α = 0 ≤ C(4r^{−α} + 2r^{−α})`; `[D²u]_α ↦ r^{2+α}`, `M_f ↦ r²`, `K_f ↦ r^{2+α}` | Pass |
| §5.3 Checks `:1513–1521` | `f = |x|^{−γ}`; `q = n` | `Δ|x|^{2−γ} = (2−γ)(n−γ)|x|^{−γ}`, gradient exponent `1−γ`; `Δ|x| = (n−1)/|x|`, gradient `−x/((n−1)|x|)` | Pass |
| §5.7 Riesz identity `:1675–1679` | multipliers | `(2πiξ_i)(2πiξ_j)/(4π²|ξ|²) = −ξ_iξ_j/|ξ|² = (−iξ_i/|ξ|)(−iξ_j/|ξ|)`; on `ℝ`, `H² = −I`, `Φ = −|x|/2` | Pass |
| §5.7 global theorem `:1661–1662` | `n = 2` | source assumption (A): `n ≥ 3` | Hypothesis dropped (R06) |
| §6.1 sharp target `:1727–1733` | `u = Σ e^{−k²t} sin(kx)/k` | `Σ (1/k²)·k²·1/(2k²) < ∞`; `‖u(t)‖²_{H¹} = (π/2)Σ e^{−2k²t} → ∞` | Pass |
| §6.2 energy identity `:1758–1760` | `u = e^{−t} sin x` | `(π/2)e^{−2t} + (π/2)(1 − e^{−2t}) = π/2` | Pass |
| §6.3 domain Check `:1816–1819` | `n = 3`, `u = χ/|x|` | `∫|x|^{−2} < ∞` near `0`; `Δ(1/|x|) = −4πδ₀ ∉ L²` | Pass |
| §6.4 Checks `:1868–1882` | `(0,0),(0,4)`; `u = t`; `cos(ωx)` | `d_par = 2`; `[u]_{α,par} = sup|t−s|^{1−α/2}`; `a^α + b^α ≤ 2(a+b)^α`; `ω ≤ (1/2)(εω² + 1/ε)` at `ε = 1/ω` | Pass |
| §6.4 bullet `:1860` | `d_par < r` | ball `{‖x−y‖ + √|t−s| < r}` ≠ cylinder; comparable with factor `2` | Overclaim (R10) |
| §6.5 Checks `:1914–1924` | `e^t cos x`; `c = 1`, `e^t`; `|∇Γ|` | `Pu = 2e^t cos x`, `e^T ≤ 1 + 2Te^T`; `Pu = 0`, `e^T = e^T`; `(|x|/2t)Γ ≤ C t^{−(n+1)/2}e^{−|x|²/(8t)}` | Pass |
| §6.6 time reversal `:1954–1956` | `u = s`, `a = 1` | `P_back u = 1`, `P̃v = −1 = −g∘R` | Pass |
| §6.9 weight formula `:2056–2064` | `w = e^{φ}`; `w = e^x` | `(Pu)/w = v_t − a v_{ij} − (b + 2a∇φ)·∇v − (c + a(φ_{ij} + φ_iφ_j) + b·∇φ)v`; `b_w = b + 2a`, `c_w = c + a + b` | Pass |
| §7.1 Checks `:2121–2135` | `e^{2πiξ₀x}`, `|ξ₀| = 2^j`; `f = 1`; `L²` | `|∇f| = 2π2^j|f|`; `P_0 1 = 1`, `P_j 1 = 0`; `1/2 ≤ Σψ_j² ≤ 1` (two adjacent `ψ` summing to `1`) | Pass; note `ψ(2^{−j}ξ₀) = χ(e/2) − χ(e) = 0`, the frequency `2^j` sits in block `j−1` |
| §7.2 Dirac `:2175–2178` | `δ₀` | `‖𝓕⁻¹ψ_j‖_p = 2^{jd/p'}‖𝓕⁻¹ψ‖_p`, so `δ₀ ∈ B^s_{p,∞}` iff `s ≤ −d/p'`; `𝒞^{−d}` | Pass |
| §7.2 single block `:2165–2170` | `s: 0 → 1`, `j = 2` | factor `2^{2} = 4` | Pass |
| §7.3 decomposition `:2184–2187` | `f = 1` | `T_1 g = Σ_{j≥1}P_jg` under the displayed `S_{j−1}`; sum `g + P_1 g` | False (R01) |
| §7.3 products `:2207–2213` | `|x|^{−1/2}·|x|^{−1/2}`; `|x|^{−1/4}·|x|^{1/2}` | `|x|^{−1}` not locally integrable; `|x|^{1/4} ∈ 𝒞^{1/4} ⊆ 𝒞^{−1/4}` | Pass |
| §8.1 kernel and Gaussian `:2254–2260` | `d = 1`, `f = e^{−πx²}` | `S(t)f = (1+4πit)^{−1/2}e^{−πx²/(1+4πit)}`, sup `(1+16π²t²)^{−1/4} ≤ (4π|t|)^{−1/2}`; Tao's `(2πi·2t)^{−d/2}` | Pass |
| §8.2 admissibility and scaling `:2290–2301` | `(4,∞,1)`, `(2,6,3)`, `(2,∞,2)`; `u_λ` | `1/2`, `3/2`, excluded; `λ^{−d/r−2/q} = λ^{−d/2}` iff on the line | Pass |
| §8.3 wave pairs `:2333–2345` | `(2,∞,3)`; `(2,6,4)` | `1/2 = (d−1)/4` excluded; `3/4 = (d−1)/4`, `r = 2·3/1 = 6`, `s = 5/6`; `s ≥ 0` automatic from admissibility and `r ≥ 2` | Pass |
| §9.1 Check `:2382–2387` | `d = 3`, `f = |x|^{−γ}` | `u` is `(2−γ)`-Hölder, `γ ↑ 3/q` gives `2 − 3/q → 0` as `q ↓ 3/2` | Pass |
| §9.2 Check `:2422–2426` | `A = 1 + u²/(1+u²)`, `f = 1` | `u = ∫_0^x (c−s)/a`, `c = ∫ s/a / ∫ 1/a ∈ [0,1]`, `|u| ≤ (c² + (1−c)²)/2 ≤ 1/2` | Pass |

**Principles.** No route-specific shortcut, no re-planned roadmap (main's stochastic stretch goal is deferred, not re-planned), no upward or cyclic supply (depcheck clean, every supplier on main), no copied passage, no algorithm, no sorried data, no `set_option`; the X3 removal and the Part II deferral are scope decisions this roadmap may make.

## Not verifiable

- Evans (AMS GSM 19), Gilbarg–Trudinger, Leoni (AMS GSM 105), Grisvard, Stein 1970 and 1993, Grafakos (both volumes), Giaquinta–Martinazzi, Lieberman, Bahouri–Chemin–Danchin: the service found no legal text (AMS and World Scientific landing pages, Springer DOI prefixes recorded as `uncertified`). The locators of §1.1 (Leoni 7.13), §1.6 (Grisvard 1.2.1.1, Evans 5.4–5.7, Stein VI.3.5), §2.2 (Grafakos 1.3.2, 1.3.4), §3.2 (Gilbarg–Trudinger 3.1–3.5, 9.1–9.3, 8.19), §4.1 and §4.3 (Evans 6.2.2–6.2.3, Gilbarg–Trudinger 8.6), §5.5 (9.20, 9.22, 9.24), §6.1 (Evans 5.9.2), §7.1–§7.2 (Bahouri–Chemin–Danchin 2.1, 2.15, 2.68, 2.71, 2.76) are recorded in the job's `needs-references.toml` and were checked only for internal consistency with the standard statements.
- Keel–Tao (JHU Press landing page), Lunardi's Cortona notes (`people.dmi.unipr.it` returned HTTP 503 twice), Chiarenza–Frasca–Longo 1991 (`arpi.unipi.it` 403), Di Fazio (`iris.unict.it` 403), Auscher–Qafsaoui (`bdim.eu` certificate failure), Coifman–Rochberg–Weiss (JSTOR), Gehring (Project Euclid returned a five-line HTML shell): not read; Tao's chapter attributes the endpoint Strichartz theorem to Keel–Tao at line 3875.
- §6.4 and §6.8 (sampled) cite no source: the parabolic Hölder calculus and the every-order isomorphism are checked against their own Checks and Lieberman's chapter headings only.
- Ownership against open pull requests whose files the brief does not supply was not checked.

## Source issues

- none
