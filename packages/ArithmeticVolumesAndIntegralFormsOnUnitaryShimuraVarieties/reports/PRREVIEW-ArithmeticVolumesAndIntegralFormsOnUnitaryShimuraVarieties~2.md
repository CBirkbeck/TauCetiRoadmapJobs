# Review of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (pull request #2923 at 7e19665)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties/`
**Verdict:** needs changes

**Summary.** Changes are needed for two findings. First, the flag-bundle theorems 8.15–8.17, including headline (3), never assume `p ≥ 1`, although their non-compact wall and the non-compactness that 8.15 asserts both need it. Second, the nef-bundle inputs of 8.14, 8.17 and 8.18c (bigness from the top self-intersection, asymptotic Riemann–Roch) are cited to AlgebraicModuliForArithmeticGeometry §1.6, which states none of them. The Chowla–Selberg statement in `Suggested.lean` and the numerical Checks of 8.5 and 8.19b hold to machine precision. There are six small corrections and two format notes, none blocking; the human reviewers have to decide on the reliance on an unrefereed formal proof announced the day before this review.

## R01 (P2) — 8.15–8.17 need `p ≥ 1`, which they never assume, and the claim in 8.15 that `Sh` is not compact is false at `p = 0`

8.15 opens with "`q ≥ 1` and `N ≥ 3` (so `Sh` is not compact)" (line 465). 8.16 (b) and 8.17 add only `q ≥ 1` and `3·min(p, q) + 1 ≤ N`, and the setting of 8.11–8.19 asks only `p ≠ q`. For `(p, q) = (0, 3)` every one of these hypotheses holds. Yet `W` is then definite at every `τ`, so `Sh` is a finite set of points (8.13 with the two signs exchanged) and is compact. Also, the non-compact wall `x_{τ,p−1} = x_{τ,p}` (line 469) has index `−1`, and 8.15c (line 587), 8.15d and the gap condition of 8.17 are built on that wall. 8.14c, which 8.15d applies, asks `0 < p < N`, and 8.14 and 8.18c state `p, q ≥ 1` explicitly. As a result, headline (3) of the Summary (line 5) and the 8.17 bullet of the docstring of `Suggested.lean` (line 31) state the theorem under hypotheses that do not make it well-posed.

The smallest repair is to write "`p, q ≥ 1` and `N ≥ 3`" in 8.15 (line 465), and "`p, q ≥ 1`" in headline (3) and in that docstring bullet. The parenthetical is then true: a Hermitian space of dimension at least 3 that is indefinite at every real place is isotropic, by Landherr's Hasse principle, so `Sh` is not compact.

## R02 (P2) — AlgebraicModuliForArithmeticGeometry §1.6 is cited for three facts about nef line bundles that it does not state

These citations are the following:
- The existence clause of 8.14 (route, lines 335–336) takes "non-negative intersection numbers, bigness by the top self-intersection, asymptotic Riemann–Roch" from AlgebraicModuliForArithmeticGeometry §1.6.
- 8.17 (route, line 770) converts the volume into the growth of the ranks of the lattices of forms by asymptotic Riemann–Roch from the same section.
- The *Needs:* line of 8.18c and the supplier contract (line 1850) repeat the citation.

On main, §1.6 is "Chow parameters and numerical boundedness". Its targets are `chowParameters`, `boundedSupportParameters`, `boundedDegreeHilbertPolynomials`, `chowOpenAndEmbedding`, `bigLineBundle` (bigness by growth of sections, equivalently a birational power) and `bigFamilyBirationalBounds`. None of them gives an intersection inequality for nef bundles, the criterion that a nef bundle is big exactly when its top self-intersection is positive, or asymptotic Riemann–Roch. So the nefness and bigness step of 8.14 and the rank growth in 8.17 rest on inputs that no named supplier provides.

Nefness and the bigness criterion are in AlgebraicModuliForArithmeticGeometryPartII §§1.5–1.6 on main; §1.6 there states that a nef `L` on an integral proper `V` is big iff `(L^n·V) > 0`. Cite them there. I found no section on main that states asymptotic Riemann–Roch for a nef line bundle, `h⁰(V, L^m) = (L^n·V)·m^n/n! + O(m^{n−1})`. MultiplierIdealsOfPairsAndPointSeparation assigns it to SchemeAndStackFoundations Layer 5, but sections 5.1–5.12 of that roadmap do not state it either. State it here as a target with its hypotheses, or name the section that owns it.

## C01 — 8.19a‴ takes Hadamard's inequality from Mathlib, which does not have it at the pin

The *Needs:* line of 8.19a‴ (line 1585) names "Mathlib (`Matrix.det`; Hadamard's inequality; …)". The pinned Mathlib has no column-norm bound for determinants: its `Matrix.det_le` (Mathlib/LinearAlgebra/Matrix/AbsoluteValue.lean:43) is the entrywise `n!·x^n` bound. Tau Ceti has only the ℓ¹ form `Matrix.abv_det_le_prod_sum_abv`, which would give `ρ·log ρ` in place of the `(ρ/2)·log ρ` of the statement. The ℓ² form is SuccessiveMinima §0.1 on main (0.1.1, `orthonormal_coordinate_hadamard`). Cite it there and add it to the supplier contracts.

## C02 — The supplier contract misdescribes MetaplecticAutomorphicForms §6.4

The contract calls §6.4 "the Siegel–Weil formula in Weil's convergent range" (line 1902). On main, §6.4 is the anisotropic Siegel–Weil formula (`siegelWeil_anisotropic`). The convergent range is ThetaKernelsForUnitaryDualPairs §6.4a, which assumes `r > 0`. The definite lattices of 8.17a have anisotropic unitary groups, so §6.4 is the input they need; only its description should change.

## C03 — In the route of 8.18c (c), `F` must be the field of definition of the component, not `E⁺`

Step (3) (line 1075) bounds the number and norms of generators by `2[F:ℚ]·rk` and `[F:ℚ]⁴·rk·rd(F)·B`. HermitianFormsAndLattices §4.13 gives these bounds for the field over which the lattice is a module, here `𝕃_Z`, while `F` is `E⁺` throughout this roadmap (Conventions). Write `𝕃_Z` there. The bounds of (c) are consistent with `𝕃_Z`: `log[𝕃_Y:ℚ] + log rd(𝕃_Y) ≤ 391(f·r·ℒ)²` fits inside `C·(f·r·ℒ)³` and `C·(f·r·ℒ)⁵`.

## C04 — The Check of 8.17 gives a value of `B₁` that the statement excludes

The Check (line 779) calls `B₁ = 128` "the value of one construction". The statement asks that `B₁ ≥ max(128, 4|Φ|N²)`, depending on `E` and the datum, and for `|Φ| = 4`, `N = 4` that maximum is 256. One could say instead that 128 is the absolute part of the bound for `B₁`.

## C05 — No target carries a locator into a source

The KNOWN targets name authors only: 8.5 names Lerch, Chowla–Selberg, Kronecker and Deuring; 8.19c names Shimura and Damerell; 8.19d names Hecke. The NEW ones credit [FormalProof] (8.14a, 8.14b (L5)), or are said to "specify its mathematics" (line 2041), without a file or declaration. So no statement can be checked against its source. Give a theorem and page for the classical statements (for instance Chowla–Selberg 1967 for 8.5 (a)), and declaration names of the formal proof for the NEW targets.

## C06 — Two sentences of the description no longer match the state of the family

The description says that the family index "is carried, with identical content, by every pull request of the family". At their current heads, 26 of the other 40 pull requests of the family carry a different `RiemannHypothesisForDirichletLFunctions/README.md`; the HermitianFormsAndLattices one, for example, still has the earlier wording of the opening paragraph. Those files conflict until they are aligned or one pull request is rebased on the others. Its validation paragraph also says that one automatic check fails: the rule that a pull request changes no file outside its roadmap folder, said to be broken by the three files of the family index. Those files belong to this pull request, and at this head every automatic check passes. Possible wording: "carried by every pull request of the family, and made identical before merge", and for the validation sentence, "every automatic check passes".

## N01 — 8.19b–8.19d use LaTeX macros (`\overline`, `\hat`, `\bar`, `\tilde`) inside code spans (lines 1595–1783); the house style is Unicode (`τ̄(x)`, `𝒪̂_𝔠`, `ϑ̄₀`, `α̃`).

## N02 — In 8.17 (line 745), "all primes good for the level" reads as if no prime divides the level, which conflicts with the "bad primes … dividing … the level" of the same sentence; "the level good at every prime (setting)" would say what is meant.

## Questions for the author

- 8.18 (c) applies 8.17 on the deep covers `Y_j`, whose level `g₀g₁·15^e` grows with `x`. 8.17 needs `B(u′, g) ≥ B₁`, where `B₁` depends on the datum including the level (8.15c, 8.15d), and at most `B(u′, g)` bad primes. 8.18 (c) does not list these hypotheses, and 8.18c (f) checks only `log B(u′, g) ≤ x^ε + 22`. Is `B₁` independent of the level, through the numbers per unit degree pulled back from the base level? I could not tell from 8.15c, whose constant is "that of one log resolution of the component".

## Verified sound

| Statement | Instances tried | README side (computed) | Check side (computed) | Result | Change |
|---|---|---|---|---|---|
| 8.5 (a), `chowlaSelberg_classMean` | `D` = 3, 4, 7, 8, 11, 15, 19, 20, 23, 24, 31, 47 (`h ≤ 5`) | class mean of `Per`: 1.497505, 1.476336, 1.426502, …, 1.131178 | `(L′/L)(0,χ) + ½log D` agrees to ≤ 2e−15; direct sum gives `L′/L(1,χ₋₄)` = 0.245612 against 0.245610 | holds | none |
| 8.5 Check | `K = ℚ(i)` | `Per(ℤ[i])` = 1.476336; heights −0.738168 and −1.310533 | `log(Γ(1/4)⁴/4π²)` = 1.4763360; `−½Per − ½log π` = −1.3105329 | holds | none |
| Lean `logPeriod`, `eta` | Mathlib `ModularForm.eta` (DedekindEta.lean:57) | `η = q^{1/24}∏(1 − qⁿ)` assumed | `qParam 24 z = exp(2πiz/24)` times the product; matches | holds | none |
| 8.11 (b), (c) | `(p,q) = (1,0), (0,1)`, `E = K = ℚ(i)` | degree `±½log Ω_K = ±0.738168`; (c) adds `½log d` | `−h_Del(ℰ₀)` = 0.738168; `rd_K = √d` gives `(q/2)log d` | holds | none |
| 8.12 | `w = 0`; `p=2, q=1, w=1`, `E = K = ℚ(i)` | slope shift `−(p−q)·log Ω·Σw` = −1.476336 | line of `par(w)` has degree −0.738168, doubled by `μ = 2μ̂` | holds | none |
| 8.14 Checks | `S` simply transitive; `S = {1, γ}` | `2P = log|S|`, `μ(B) = μ(A) − log|S|`; determinant `ς² − (γ^*ς)²` | `μ(A) = log|S|`, `μ(B) = 0`; determinant 0 for `ς ≡ 1` | holds | none |
| 8.14a | `|Φ|=1, p=q=1, μ=(M,−M), g=2M` | LHS = `M·deg ω`; condition `ℓ ≥ 4` | step (1) gives `deg ω ≥ 0`; `4M ≤ 2(ℓ−2)M` | holds | none |
| 8.14b (L1), (L5) | `Π = (𝔥; 𝔟)`, `J = [[0,−1],[1,0]]` | `Π^TJΠ = 𝔟^T𝔥 − 𝔥^T𝔟 = c·E_W`, `|c| = |ζ_ℓ − 1|` | HodgeTateLattices §0.5g (b), (c), §0.5h (2), (3) identical; `v(w) = 1/(ℓ−1)` | holds | none |
| 8.14c | `|Φ| = 1, N = 2` | `(x₀−x₁)(αx₀+βx₁)` | non-homogeneous counterexample with `c ≠ 0` confirmed | holds | none |
| 8.15 | `(p,q) = (0,3)`; `(1,2)` | "`q ≥ 1, N ≥ 3` ⇒ not compact" | (0,3): `Sh` finite, wall index −1; (1,2): `W` isotropic | fails at `p = 0` | R01 |
| 8.15b | root line on `ℙ(V_α)` | tangent line fibre degree +2, root −2 | HeightsForLog §14.1 (c) is stated for +2; its Check gives `Ô(1)² = ½` | holds | none |
| 8.15c | `t = exp(−1/s²)` | rate `C·s` | max of `8s·log³(1/s)` = 10.75, of `4s·log²(1/s)` = 2.17 (supplier: 10.8, 2.2) | holds | none |
| 8.15d | `ℓ_u^{D+1}` | `S^p_τ = −(D+1)δ_Fl(u)Σ_{i<p}u_{τ,i}` | same by differentiation; `(α−β)s + βt` equals the block form of 8.14c | holds | none |
| 8.15e Check | label fixed by `φ`; `k = 1` | `ϰ_k(τ,τ) = 1/(ℓ^k−1) − 1/(ℓ−1)`; `Σϰ₁ = 0` | geometric series: `(1/ℓ)/(1−1/ℓ) − 1/(ℓ−1) = 0` | holds | none |
| 8.16 (b) | `3j′+1 ≤ N` | mean bounded by 3 | `a/k ≤ 1/3` gives at most `1.61/k + 0.55` | holds | none |
| 8.17 | `u = (3,1,0)`, `p = 1`; `|Φ| = 4, N = 4` | `0 ≤ s − pt/N = 5/3 ≤ Σ|u| = 4`; `B₁ ≥ max(128, 4|Φ|N²)` | `4|Φ|N²` = 256 > 128, the Check's `B₁` | statement holds; Check inconsistent | R01, C04 |
| 8.17a | threshold for `n(w)`; self-dual lattices | `4[E:ℚ]N + 4 = 8fr + 4` at `N = r` | matches 8.18c (c)(1) and 8.19a″ (a); `𝒪_E^n` with the standard form is self-dual | holds | C02 |
| 8.18 | `f = r = 1`; `e = ⌊3x^ε/log 3⌋` | `c_j ≤ 22f²r⁴`; `log 15^e ≤ 27x^ε`; `391(frx^ε)² ≤ b` | `c₁ = 16 ≤ 22`; `7.39x^ε`; needs `(frx^ε)^{10} ≥ 391`, true for `fr ≥ 2` | holds | question |
| 8.18c (b) | `D = 3`; gaps of `κ_can` at most `2N−2` | `Σ_{e≤D}(e+1) = binom(D+2,2) − 1` = 9 | `D² + 6D + 11 ≥ binom(D+2,2)` | holds | C03 |
| 8.18e | `D=2, T=11, ρ=0` | `q_z` = 28/11; `c(D,N−1)/(D+1) = ½H_{N−1}`; (e2) display | ChowForms §6.2 (b) `c(d,N−1) = ((d+1)/2)H_{N−1}`; Slopes §6.7b (f′) same display, `c = cst` | holds | none |
| 8.19 (b) | `j = m` | main term `−(p_m − q_m)·Σw·log Ω` | 8.13 (c): `−p·Σw_m·log Ω` with `q_m = 0` | consistent | none |
| 8.19a″ (c) | products of rules | scalar weight before the last factor lies in `[r, r+t)` | `n(w_F) ≥ r`, `n(κ) = r + t` | holds | none |
| 8.19a‴ | `ρ × ρ` matrix, entries `≤ e^{C−a_i}S` | `(ρ/2)·log ρ` term | ℓ² Hadamard gives `ρ^{ρ/2}`; Tau Ceti's ℓ¹ form gives `ρ^ρ` | holds with ℓ² | C01 |
| 8.19b Check | `D = 7`, `D = 11` | `E₂^{*6}/Δ = −3⁶/7³, −2¹⁸/11³`; `ΣW_P⁶ = −1142/7³`; `E₂^*E₄/E₆ = 5/21` | −1.0000000000·3⁶/7³; −1.0000000000·2¹⁸/11³; −1141.9999999/7³; 0.2380952 | holds | none |
| 8.19b (6) | isogeny formula with `α = ϑ₀` (norm 2), `√−7`, `1+√−7`, `√−11` | `(α² − n)G₂^* = Σ℘(T)` | `D = 7`, `α = ϑ₀`: −3.270482+1.236126i on both sides; other cases agree to 1e−8 | holds | none |
| 8.19b (6)(ii) | `l = 2`, `D ≡ 3, 1 (mod 4)`; `l = D` | `w(2)` = 1, 2; `w(D)` = ½ | from the `(α² − n)·W` identity: `v₂ ≥ −1, −2`; `v_D ≥ −½` | holds | none |
| 8.19c | `ψ = 1`; units of `𝒪_𝔠` | ratio fixed; `𝒪_𝔠^× = 𝒪_F^×` | Euler factor ½ (`Y=1, N𝔮=2, s=1`); `ζ ≡ ζ̄ mod 𝔓` forces `ζ² = 1` | holds | none |
| 8.19d (i), Check | local orbits at a split `𝔮` of level 1 | factor `(1−Yw)(1−Y⁻¹w) + (N𝔮−1)w²`; `Dd·g` | orbits `1 + (N𝔮−1)Σ_{a,b≥1}` give the same factor; `−ℓ^{N₀−1}X⁴ + ℓ^{N₀+1}` | holds | none |
| inputs of 8.14, 8.17, 8.18c | AlgebraicModuliForArithmeticGeometry §1.6 at main | nef intersections, bigness from `L^n`, asymptotic Riemann–Roch | §1.6 targets `chowParameters` … `bigFamilyBirationalBounds`; none of the three | unsupported | R02 |

- Source locators: the README has two explicit locators, both to [FormalProof] without a file or declaration; no external text was read (see below).
- Cross-roadmap citations: every `§` id cited from 45 roadmaps exists at main or at the cited open head. I read about 40 supplier sections for content, among them HeightsForLogSingularMetrics §§0.4, 4.3a, 14.1, 14.2, 16.1; SlopesOfHermitianVectorBundles §§2.6, 6.6, 6.7a, 6.7b; ChowFormsAndHeightsOfSubvarieties §6.2; HodgeTateLatticesAndLubinTateLogarithms §§0.5a, 0.5c, 0.5g, 0.5h, 0.17b, 0.18a; HermitianFormsAndLattices §§4.0b, 4.13; MetaplecticAutomorphicForms §§5.7, 6.4; ThetaKernelsForUnitaryDualPairs §6.4a; ComplexMultiplicationAndExplicitReciprocityPartII §4.6; AlgebraicModuliForArithmeticGeometry §1.6; AlgebraicModuliForArithmeticGeometryPartII §§1.5–1.6; SuccessiveMinima §0.1; ThetaChainsOnDefiniteUnitaryGroups §§2.1–2.2. The citations of this roadmap by GluedTargetAndDivisionInequality and ThetaChainsAndFrobeniusPrimeSums all resolve.
- Library declarations opened at the pins: `ModularForm.eta` (Mathlib/NumberTheory/ModularForms/DedekindEta.lean:57), `Periodic.qParam` (Mathlib/Analysis/Complex/Periodic.lean:41), `NumberField.dedekindZeta` (Mathlib/NumberTheory/NumberField/DedekindZeta.lean:50), `DirichletCharacter.LFunction` (Mathlib/NumberTheory/LSeries/DirichletContinuation.lean:60), `NumberField.prod_abs_eq_one` (Mathlib/NumberTheory/NumberField/ProductFormula.lean:98), `Matrix.det_le` (Mathlib/LinearAlgebra/Matrix/AbsoluteValue.lean:43), `Matrix.abv_det_le_prod_sum_abv` (TauCeti/LinearAlgebra/Matrix/AbsoluteValue.lean:62). Neither pin has the ℓ² Hadamard inequality or Chowla–Selberg.
- Automatic checks: all passed. Dependency check: `depcheck: 171 roadmaps, 2013 edges, 0 problem(s)`; within the family, every supplier is listed above this roadmap in the index and both consumers are listed below it.
- Elaboration: `lake env lean` on `Suggested.lean` gives only the `sorry` warning (line 65). `#check @` of both declarations matches the README; no section binders. The one-tactic probe (`simp`, `rfl`, `norm_num`, `simp_all`, `aesop`) closes nothing.
- Family index: identical to the heads of 14 of the 40 other family pull requests and different from 26.
- Overlap check: read HeightsForLogSingularMetrics, GluedTargetAndDivisionInequality, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties, ArakelovGeometryAndAbelianHeights, ShimuraCompactifications, BallQuotientsAndComplexHyperbolicLattices and the family index. Nothing is owned twice. The first, third, fourth and fifth are suppliers cited by section; GluedTargetAndDivisionInequality consumes 8.5–8.19d and owns the disjoint ids 7.12–7.14, 8.1–8.10, 8.5c and 8.19e–8.24; BallQuotients shares no object. Ownership against open pull requests was checked with the roadmaps tool.
- Source independence: 0 passages compared with external sources. None was readable: [FormalProof] has no locator and was not read, the host of [Announcement] is in no licence class, and the published works carry no locators. The sampled sections were read against the supplier sections they cite. The largest share of explicit locators is [FormalProof], 2 of 2. Contents were not compared, since no table of contents was readable. The order 8.5 → 8.11–8.14 → 8.14a–8.17 → 8.17a–8.19 → 8.19a–8.19d follows the *Needs:* lines.
- Research link: 8.5 is the Chowla–Selberg formula (Chowla–Selberg 1967; Lerch 1897) in the Faltings-height form of Colmez (1993). 8.15–8.17 are arithmetic proportionality and arithmetic volumes for flag bundles, relatives of Köhler, Burgos Gil–Kramer–Kühn and Bruinier–Howard–Kudla–Rapoport–Yang. 8.19b–8.19d are Damerell's, Shimura's and Hecke's CM-value results. All of it serves Alpöge's announced formal proof (2026). This rests on the README References.

## Not verifiable

- [FormalProof] (the Lean repository cited at line 2041): no file or declaration is given for any target, so nothing could be checked against it at a locator; not read.
- [Announcement] (line 2042): the sources service found its host in no licence class, and I did not vouch for it as the author's own page.
- The published works in the References (Chowla–Selberg 1967, Colmez 1993, Damerell 1970 and others): no locators are given; not fetched.

## Source issues

- none

## For the human reviewers

- Scope: most sections are marked NEW and specify the mathematics of a formal Lean proof of the Riemann hypothesis for Dirichlet L-functions, announced on 2026-11-20 by one author (README lines 2041–2042). No refereed source states them. The classical inputs (Chowla–Selberg, Hecke, Damerell, Shimura reciprocity) are published.
- Not tested: [FormalProof], which has the largest share of the explicit locators, and [Announcement] were not read. Wording and arrangement were not compared with them.
