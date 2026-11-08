# Review of AutomorphicSpectralTheory (pull request #925 at e73fe1f)

**Verdict:** needs changes

Full re-review. This head hands the level-one nonholomorphic Eisenstein series, its completion, Fourier expansion, continuation and critical-line estimates (§§1.14, 1.15, 2.17, 2.18, 4.18, 4.20), the real-quadratic Nielsen surfaces (§4.17a) and the `J`-Bessel API (§0.25) to AnalyticNumberTheoryPartI §§2.1b, 2.1c and 3.23b. It identifies the `GL₂` cases of §§1.2, 1.4 and 2.4 with AnalyticNumberTheoryPartII §§5.3n and 5.21w, and deletes `Modular.nonholomorphic_eisenstein` and `Modular.completed_eisenstein_continuation` from `Suggested.lean`. The hand-over is the right shape: AnalyticNumberTheoryPartI states the deleted theorem word for word (its `Suggested.lean`, `completed_eisenstein_continuation`), and both suppliers come earlier in the merge order (49, 50) than this roadmap (95). The gate passes and every mathematical identification I recomputed is correct. Seven P3 defects remain, none blocking: four citations name declarations or owners that do not exist where they are cited, one locator does not contain its claim, the ownership section omits the new deferral, and the Lean file has two form slips.

## R01 (P3) — Three Lean names attributed to AnalyticNumberTheoryPartI that it does not define

**Location.** `TauCetiRoadmap/AutomorphicSpectralTheory/README.md` line 100: "on `Re s=1/2` the cusp estimates `cusp_decay` and `eisenstein_core_integrable`… Its §2.1c supplies `quadratic_weyl_domains`". The same names appear at lines 2599 (§4.17a), 2604 (§4.18) and 2622 (§4.20).

**Claim.** AnalyticNumberTheoryPartI §2.1b names its critical-line results `cusp_decay` and `eisenstein_core_integrable`, and its §2.1c is `quadratic_weyl_domains`.

**Witness.** At AnalyticNumberTheoryPartI's head, none of the three strings occurs in its README or `Suggested.lean`; §2.1b names only `nonholomorphic_eisenstein`, `completed_eisenstein_fourier`, `completed_eisenstein_continuation`. MultiquadraticPartII (README line 52) cites `quadratic_weyl_domains` through §4.17a.

**Repair.** Drop the three backticked names and cite the content: "AnalyticNumberTheoryPartI §2.1b, its last two bullets (critical-line cusp decay with the vanishing horizontal integral, and absolute integrability on regions compact apart from finitely many finite-width cusp ends)" at lines 100, 2604 and 2622, and "AnalyticNumberTheoryPartI §2.1c" at lines 100 and 2599. Tested: those two bullets of §2.1b and the five bullets of §2.1c state exactly what §§4.18, 4.20 and 4.17a hand over. The vanishing horizontal integral and finite-width integrability are the fourth and fifth bullets; area `πℓ_A` and length `2 log ε_D` are the fourth bullet of §2.1c.

## R02 (P3) — `K_ν` is credited to AutomorphicLFunctionsAndLocalFactors AL.0, which now takes it from AnalyticNumberTheoryPartI §2.1a

**Location.** README line 110: "its Bessel transforms section specifies `K_ν(c)=(1/2)∫₀^∞u^(ν−1)exp(−c(u+u⁻¹)/2)du` for `c>0`, with `K_{−ν}=K_ν`, entire dependence on `ν` and `K_{1/2}(c)=√(π/(2c))e^(−c)`". The same attribution is in the *Needs:* lines of §0.27 (line 582) and §0.45 (line 782).

**Claim.** AL.0's Bessel-transforms section defines `K_ν` and proves its evenness, entire order dependence and half-order value.

**Witness.** At the head of AutomorphicLFunctionsAndLocalFactors, §AL.0.5 opens: "Throughout, `K_ν(c)` is AnalyticNumberTheoryPartI §2.1a's K-Bessel kernel". The definition, `K_{−ν}=K_ν`, entire order dependence and `K_{1/2}` are AnalyticNumberTheoryPartI §2.1a (`besselK`).

**Repair.** At line 110 replace the clause by "AnalyticNumberTheoryPartI §2.1a (`besselK`) supplies `K_ν(c)=…` for `c>0`, with `K_{−ν}=K_ν`, entire dependence on `ν` and `K_{1/2}(c)=√(π/(2c))e^(−c)`". In the *Needs:* lines of §§0.27 and 0.45, replace "AutomorphicLFunctionsAndLocalFactors AL.0, Bessel transforms" by "AnalyticNumberTheoryPartI §2.1a". Add §2.1a to the AnalyticNumberTheoryPartI row of the supplier table. Tested: the `besselK` body in AnalyticNumberTheoryPartI's `Suggested.lean` is `(1/2)∫_{u>0}exp(−c(u+u⁻¹)/2)·exp(ν log u)/u du`, the same function as line 110's formula. §2.1a's bullets state the evenness, entire dependence and the half-order value. Line 11 ("`K`-Bessel transforms" owned by AL) can stay: AL.0.5.2–AL.0.5.3 are transforms of `K`.

## R03 (P3) — Tau Ceti names on line 82 that do not exist at the pin

**Location.** README line 82: "`TauCeti.Multiquadratic.IsFundamentalDiscriminant` supplies the arithmetic discriminant criterion. The module `TauCeti.Analysis.Normed.Operator.Resolvent.Unbounded` supplies the resolvent of a partial operator: `TauCeti.LinearPMap.IsResolventAt` …, `TauCeti.LinearPMap.resolventSet` and `TauCeti.LinearPMap.resolvent`".

**Claim.** These four declarations exist in Tau Ceti at `a91d3aa`, in that module.

**Witness.** `IsFundamentalDiscriminant` occurs nowhere at either pin. `IsResolventAt`, `resolventSet`, `resolvent` are root `LinearPMap` declarations in `TauCeti/Topology/Algebra/Module/LinearPMap/Resolvent/Basic.lean` (lines 65, 129, 169); `…/Resolvent/Unbounded.lean` holds only Neumann perturbations.

**Repair.** Replace the first sentence by a Mathlib bullet: "`Int.IsFundamentalDiscr` (`Mathlib/NumberTheory/FundamentalDiscriminant.lean`, line 41) with `Int.isFundamentalDiscr_iff_squarefree` (line 60) supplies the fundamental-discriminant criterion". Replace the module and the three names by "The module `TauCeti.Topology.Algebra.Module.LinearPMap.Resolvent.Basic` supplies `LinearPMap.IsResolventAt` (a continuous two-sided inverse of `λ−A` on the domain), `LinearPMap.resolventSet` and `LinearPMap.resolvent`". Keep `TauCeti.LinearPMap.analyticAt_resolvent`: it exists (`…/Resolvent/Analytic.lean`, line 58). Tested: `#check @Int.IsFundamentalDiscr` and `#check @Int.isFundamentalDiscr_iff_squarefree` elaborate under `import Mathlib` at the pin. The `IsResolventAt` docstring says it inverts `lambda • I − A : D(A) → X` with values in the domain, which matches line 82's mathematics.

## R04 (P3) — §4.5's locator does not state finite multiplicity of the discrete spectrum

**Location.** README line 2331 (§4.5): "([Art05], §7 discrete inducing spaces, pp.32–33; §12 discrete decomposition (12.5)–(12.6), p.66.)" for "Every irreducible unitary automorphic representation occurs in `L²_disc([G]¹)` with finite multiplicity."

**Claim.** The cited passages state the finite-multiplicity and finite-dimensionality assertions of §4.5.

**Witness.** Art05 lines 1684–1820 (pp.31–33) define `L²_disc` as the discretely decomposing part, `H_P` and (7.1). Lines 3693–3716 (p.66) give only the χ-decompositions (12.5)–(12.6). Art05 states finite multiplicities only for `L²_cusp` (Theorem 12.1, lines 3586–3589, p.64).

**Repair.** Keep the [Art05] locators for the definition of `L²_disc` and its χ-decomposition. Add [Art05], Theorem 12.1, p.64, for the cuspidal part, which is ALS.F.6's contract. For the residual and combined statement, cite Harish-Chandra's finiteness theorem at its theorem number. That theorem says the automorphic forms of fixed `K`-type annihilated by an ideal of finite codimension in the centre form a finite-dimensional space. A text that states it is Borel–Jacquet's Corvallis article, in the same volume as [Wal79] and [Fla79]. If that text cannot be opened, record the citation as uncertified. Tested on the refuting instance: §4.5's claim was searched for in all of [Art05]. The phrase "finite multiplicities" occurs only at p.8 (compact quotients) and at Theorem 12.1, p.64 (cusp forms).

## R05 (P3) — Scope and ownership does not record the hand-over to AnalyticNumberTheoryPartI and Part II

**Location.** README lines 5–13 (`## Scope and ownership`). AnalyticNumberTheoryPartI and AnalyticNumberTheoryPartII appear only in the supplier table (lines 47–48) and the supplier subsection (line 100). Six layer sections are now one-sentence pointers: §§1.14, 1.15, 2.17, 2.18, 4.17a and 4.20 (lines 1152–1160, 1774–1783, 2597–2601, 2620–2624).

**Claim.** The README follows the house shape: what lives in another roadmap is listed as a deferral in Scope and ownership.

**Witness.** Lines 5–13 never name either supplier. Keeping the six ids is right: GrossZagierAndArithmeticHeights, FuchsianOrbifoldsPartII, MultiquadraticPartII and MetaplecticAutomorphicForms cite §§1.14–1.15, 2.17–2.18, 4.17a, 4.18 and 4.20.

**Repair.** Add to Scope and ownership: "AnalyticNumberTheoryPartI §2.1b owns the level-one Eisenstein series `E(z,s)`, its completion, Fourier expansion, continuation and critical-line estimates; §2.1c owns the real-quadratic reduced cycles, genus characters and Nielsen surfaces; §3.23b owns the `J`-Bessel API and §2.1a the `K`-Bessel kernel. AnalyticNumberTheoryPartII §§5.3n and 5.21w own the `GL₂` Eisenstein series over a number field, of which §§1.2–1.5 and 2.4 are the general-group forms. Sections 1.14, 1.15, 2.17, 2.18, 4.17a and 4.20 record these identifications." Tested: each clause matches the section text at the supplier heads (table below).

## R06 (P3) — `Suggested.lean`: a catalogue comment of another roadmap's names, and no layer section comments

**Location.** `TauCetiRoadmap/AutomorphicSpectralTheory/Suggested.lean` lines 56–58: "-- Supplied by AnalyticNumberTheoryPartI: -- §2.1b `TauCetiRoadmap.AnalyticNumberTheoryPartI.nonholomorphic_eisenstein` and -- `TauCetiRoadmap.AnalyticNumberTheoryPartI.completed_eisenstein_continuation`." The file states targets of Layer 0 (§§0.16, 0.35, 0.37) and Layer 2 (§§2.24, 2.25) with no `/-! ## Layer k: … -/` comment.

**Claim.** The file follows the Lean form: no catalogues of names, and a layer section comment wherever several layers are stated.

**Witness.** The module docstring (lines 10–12) already says the completed series is AnalyticNumberTheoryPartI §2.1b. Lines 56–58 only list that roadmap's declaration names. Neither `/-! ## Layer 0` nor `/-! ## Layer 2` occurs in the file.

**Repair.** Delete lines 56–58. Insert `/-! ## Layer 0: Hilbert fields, vector analysis and rank-one kernels -/` before line 38, and `/-! ## Layer 2: Meromorphic continuation, local normalization and residues -/` before `namespace Modular` (line 73). Tested: `analytic_fredholm`, `legendre_q` and `point_pair_invariant` are §§0.16, 0.35 and 0.37; `automorphic_green` and `green_kernel_continuation` are §§2.25 and 2.24, already in README order. The edit touches comments only, so the elaborated types are unchanged.

## R07 (P3) — §1.15a's Check gives AnalyticNumberTheoryPartI §2.1b a "parameter `z`" it does not have

**Location.** README line 1178: "For spherical `SL₂/ℚ`, the classical parameter `z` of AnalyticNumberTheoryPartI §2.1b corresponds to the induction difference `s=2z−1`".

**Claim.** §2.1b's spectral parameter is called `z`.

**Witness.** §2.1b writes `E(z,s)` with `z=x+iy` a point of ℍ and `s` the parameter, so "`s=2z−1`" mixes a point with a parameter. The formula holds for §2.1b's parameter `σ`: `ξ(2σ−1)/ξ(2σ)=ξ(s)/ξ(s+1)`, `s=2σ−1`.

**Repair.** "For spherical `SL₂/ℚ`, the parameter `σ` of AnalyticNumberTheoryPartI §2.1b's `E(z,σ)` corresponds to the induction difference `s=λ(α∨)=2σ−1`; the constant coefficient is `Γ_ℝ(s)ζ(s)/(Γ_ℝ(s+1)ζ(s+1))`." Tested: with `σ=2`, `s=3`, and both sides give `ξ(3)/ξ(4)`. This agrees with §1.4's `λ=σ−1/2`, since `λ(α∨)=2σ−1`.

## Previous findings

- R01 of the review at 9751428 (stale "two arithmetic comparison contracts below"): **repaired.** Line 1229 now reads "Identify the finite-order and algebraic specializations with LFunctions Layers 5–6 through AutomorphicLFunctionsAndLocalFactors' Canonical rank-one comparison (AL.1.5.3), as the finite-order and algebraic Checks below record." This is the requested text. The phrase "two arithmetic comparison contracts" no longer occurs (0 matches).

## Verified sound

**Gate.** I ran it myself on e73fe1f: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run also reports `build=0`. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`. `git diff --stat origin/main...HEAD` outside the folder is empty. Dependency check:

```
depcheck: 235 roadmaps, 2439 edges, 0 problem(s)
```

**Lean.** `lake env lean` on `Suggested.lean`: exit 0, two `declaration uses 'sorry'` warnings (lines 40 and 84) and nothing else. `#check @name` for all five declarations, in one scratch file, gives the types in the worker's signature file. No section `variable` is used, so no binder can be lost. One-tactic probe on a scratch copy with `simp` in place of each `sorry`: `analytic_fredholm` fails with "simp made no progress", and `green_kernel_continuation` leaves the existential unsolved. Neither is padding. The three definitions are exactly what the Green-kernel statement needs. The module docstring names as not statable §§1.15a–1.15c, Layers 3–7, §4.8 (it needs §1.16a's quotient Laplacian) and §§3.6a–3.6d, each with its missing carrier. No statable headline is absent: the one moved out (the completed Eisenstein continuation) is stated, identically, in AnalyticNumberTheoryPartI's `Suggested.lean`.

**Seeded sample, against the text at the locator.**

| Target | Source and locator | Text checked | Verdict |
|---|---|---|---|
| 0.1 | Yetter04 §2 Definition 1, pp.2–3; Example 4, p.4 | Yetter04 lines 79–90 (three conditions incl. countable dense sections), line 138 (Example 4 on p.4) | correct |
| 0.9 | Tes09 (first edition, version 12 Feb 2009) Theorems 6.6–6.7, Lemma 6.13, Cor. 6.14, Lemmas 6.15–6.16, pp.136–144 | Tes09 lines 5757 (Thm 6.6, p.136), 5777 (Thm 6.7, p.137), 6128–6133 (Lemma 6.13 and (6.24), pp.142–143), 6152, 6158–6164 (p.143), 6195–6199 (Lemma 6.16(iv), p.144) | correct |
| 0.39 | GZ86 IV (3.2), p.277 | paywalled | not verifiable; computed below |
| 0.45 | GZ86 IV §3, proof of (3.3), p.280 | paywalled | not verifiable; computed below |
| 1.27 | GZ86 IV §3, proof of (3.2), p.278 | paywalled | not verifiable; computed below |
| 2.4a | Art05 Lemma 7.1, Thm 7.2(a), pp.34–35; BK14 Thms 11.6–11.7, Remark 11.8, pp.49–50 | Art05 lines 1864–1870 (p.34), 1878–1889 (p.35); BK14 lines 1890–1908 (p.49), 1915–1921 (p.50, growth index needed) | correct |
| 2.20 | DIT16 §8 (8.4), p.974 | DIT16 lines 1087–1092 ((8.2), p.973), 1105–1111 ((8.4), p.974) | correct |
| 3.2 | Art05 §13 (13.1), p.68 | Art05 lines 3824–3839 (finite inner sum; cusp forms fixed) | correct |
| 3.11 | Yu22 §§3.1.3–3.1.6, pp.14–15 | Yu22 lines 644–649 (strict cones), 650–654, 655–665, 666–675 (`H_P(nmk)=(deg det m_i)`) | correct |
| 4.5 | Art05 pp.32–33; (12.5)–(12.6), p.66 | lines 1684–1820, 3693–3716 | locator fails: R04 |
| 4.15b | Yu22 (6.1.5), p.44 | Yu22 lines 2323–2331 (double product, p.43), 2335 ((6.1.5), p.44) | correct |
| 4.15e | Yu22 (6.2.5)–(6.2.6), p.46 | Yu22 lines 2447, 2449–2475 | correct |
| 4.19 | DIT16 §5, p.963, after (5.12) | DIT16 lines 582–600: first case zero for `d′,d>0`, second for `d′,d<0` | correct |
| 5.7 | Fra98 §6 Theorem 14, (14), p.236 | Fra98 lines 2067–2073 (p.236; independent of `MW`) | correct |
| 6.8 | Art05 §17 Lemmas 17.4–17.6, (17.8), (17.12)–(17.14), pp.97–101; Lemma 17.1, p.94 | Art05 lines 5412 (p.94), 5598–5607 (p.97), 5678 (p.98), 5711–5735 (pp.99–100), 5785–5795 (p.101) | correct (source misprint, below) |

**Adversarial table** (sampled targets, headlines, changed passages, and every target a finding touches).

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| `analytic_fredholm` (§0.16) | `V=ℂ, K(z)=z, z₀=0`; `V=0`; `K(z)=zS`, `S` the unilateral shift on `ℓ²`; `K≡1` on `ℂ` | `R=(1−z)⁻¹`, singular set `{1}`, principal part `−1/(w−1)`, `A₀=−1` of rank 1; `V=0`: `R=0`; shift: `1−zS` invertible iff `|z|<1`, singular set `{|z|≥1}` not discrete, excluded by `hcompact`; `1−K=0` never a unit, excluded by `hinv` | true; each hypothesis needed | none |
| `green_kernel_continuation` (§2.24) | `N=1`, `N=2`, `N=0`, `z=z′` | `N=1`: index 1, `−12=−4π/(π/3)`; `N=2`: index 3, vol `π`, `−4π/π=−4=−12/3`; `R≈vol⁻¹/(s(s−1))` gives `G=−4πR` residue `−4π/vol`; `N=0` excluded by `hN`; `z=z′` excluded by `γ=1` | true | none |
| `legendre_q` (§0.35) | `s=1,t=3`; `s=2,t=3`; `t<1`; `t=1` | `∫du/(3+2√2 cosh u)=½log2=Q₀(3)`; `Q₁(3)=(3/2)log2−1`; `t<1`: `√(t²−1)=0`, constant integrand not integrable, junk `0`; `t=1` only on the excluded diagonal | definition matches README | none |
| `point_pair_invariant` (§0.37) | `z=i, z′=2i` | `1+1/(2·1·2)=5/4=cosh(log 2)=cosh d(i,2i)` | coordinate correct | none |
| `automorphic_green` (§2.25) | `±γ` | same `γz′`, so the factor `1/2` counts `Γ₀(N)/{±I}` once; `#{γ: cosh d≤T}≍T`, `Q_{s−1}(t)≍t^(−s)`: summable for `Re s>1` | matches README | none |
| §1.2 `GL₂` identification (changed) | `diag(t₁,t₂)`, `λ=(λ(α∨)/2)α` | `exp((λ+ρ)H)=|t₁/t₂|^((λ(α∨)+1)/2)` vs `|t₁/t₂|^(z/2)`: `z=λ(α∨)+1`; `Re λ(α∨)>1 ⟺ Re z>2`; central part trivial on `G(𝔸)¹` (§1.1) | correct | none |
| §1.4 Checks (changed) | `λ=s−1/2`; `w` | `z=2s`, `c(2s)=Z_ℚ(2s−1)/Z_ℚ(2s)=ξ(2s−1)/ξ(2s)`; `wλ=−λ ↔ 2−z` | correct | none |
| §2.4 functional equation (changed) | spherical `GL₂`; over `ℚ` | `c(z)E(2−z)=E(z)`, times `Z(z)`: `Z(z−1)E(2−z)=Z(2−z)E(2−z)=E*(2−z)`; `z=2s`: `Res_{z=2}=2·½=1=Res_{v=1}Λ` | correct | none |
| §1.15a Check (changed) | `σ=2` | `s=2σ−1=3`; `ξ(2σ−1)/ξ(2σ)=ξ(3)/ξ(4)=Γ_ℝ(3)ζ(3)/(Γ_ℝ(4)ζ(4))` | formula right, variable misnamed | R07 |
| §0.25 `I_ν` Checks | `ν=1/2, −1, 0`; `y=0` | `I_{1/2}=√(2/(πy))sinh y`; `I_{−1}=I_1`, `J_{−1}=−J_1`; `k=0` term `0^0/Γ(1)=1` | correct | none |
| §§1.15, 2.17, 2.18 pointers vs AnalyticNumberTheoryPartI §2.1b | residues at `0, ½, 1`; `3/π` | `Λ(2s)∼−1/(2s)`: `−½`; `Λ(2−2s)∼1/(2(s−1))`: `+½`; at `½` the poles `±1/(2(s−½))` cancel; `(½)/Λ(2)=(½)/(π/6)=3/π` | supplier states all four | none |
| §§4.18, 4.20 pointers | `d/dy y^(1/2+it)` | `(½+it)y^(−1/2+it)=O(y^(−1/2))`; content is §2.1b's last two bullets | content right, names wrong | R01 |
| §4.17a pointer | `D=28` | `ε=8+3√7`, `N(ε)=64−63=1`; area `πℓ_A` is §2.1c's fourth bullet | content right, name wrong | R01 |
| §0.1 Checks | constant `ℂ` field; zero fibres | `η∈M ⟺ ⟨η,1⟩=η` measurable (cond. 2); the unique section | correct | none |
| §0.9 Checks | rank one; `diag(1/(n+1))`; rank-`r` projection | `Σ⟨φ_n,u⟩... =⟪u,w⟫`; `Σ1/(n+1)²=π²/6<∞`, `Σ1/(n+1)=∞`; trace `=‖·‖₁=r` | correct | none |
| §0.39 integrability | `σ=Re s`; `k=1`; `σ=1−k` | `(x²+1)^(−(k−1/2+σ))` integrable iff `σ>1−k`; `k=1`: `σ>0`; `σ=1−k`: `(x²+1)^(−1/2)∼|x|⁻¹` | correct | none |
| §0.45 `k=1` and reflection | `(a,b,c)∈{(0,1,0),(0,0,1)}`; `s↦2−2k−s` | `V*=(−2i/√t)(K_{s+½}+K_{s−½})=(−2i/√t)(K_{½+s}+K_{½−s})`; order `ν↦−ν` after `b↔c` | correct | none |
| §1.27 Poisson | `f(u)=(u+iy)^(−(2k−1))(u²+y²)^(−s)`, `u=yt` | `f̂(r)=y^(−(2k−1)−2s+1)V_s(ry)=y^(−2s−2k+2)V_s(ry)`; the `l`-sum converges iff `Re s>1−k` | correct | none |
| §2.4a Checks | `P=G`; `E=z⁻¹A+O(1)` | identity, denominator 1; `zE→A` holomorphic, `E` not | correct | none |
| §2.20 residue | `s₀=½+ir`, `r>0`; `r=0` | `¼+r²−s(1−s)=(s−s₀)(2s₀−1)+(s−s₀)²`; `Res(2s−1)/(…)=1`; `r=0`: double root, excluded | correct | none |
| §3.2 Checks | one-cusp strip; anisotropic `G`; cusp form | `Λᵀ1=1−1_{y>Y}=1_{y≤Y}`; only `P=G`: identity; proper constant terms zero: `Λᵀf=f` | correct | none |
| §3.11 Checks | `GL₁`; wall point | `Δ_P=∅`, both cones `1`; `α(H)=0` fails strictness | correct | none |
| §4.5 | `GL₁`; `SL₂` | characters of a compact group, each multiplicity 1; residual = constants, multiplicity 1 | statement true; locator fails | R04 |
| §4.15a Checks | `(ν₁,ν₂)=(1,1),(2,1),(2,2)` | exponents `(ν₁+ν₂)/2+1−i−j`: `0`; `±½`; `1,0,0,−1` | correct | none |
| §4.15b Checks | same three pairs; Yu's double product | `0/−1`; `½/−3/2`; `{1,0}/{−2,−1}`; for fixed `j`: `L(q^(a−j)z)/L(q^(a−j−ν₁)z)`, and `i=ν₂+1−j` gives the stated denominator | correct | none |
| §4.15e degree and index | `deg F`; `ν=1`; zeros in the disc | `ν((2g−2)r²+2f)+(2ν−1)f=E`; `E=(2g−2)r²+3f`; zeros minus poles `νd_P−(2ν−1)f=ν(2g−2)r²+f`, equal to §4.15c's index with `d=f` | correct, consistent with §4.15c | none |
| §4.19 | `A↦JA⁻¹`, `χ(J)=±1` | oriented flux `∮i∂u dz` changes sign, so it vanishes when `χ(J)=+1` (`d,d′>0`); arclength integral vanishes when `χ(J)=−1` | correct, as DIT16 p.963 | none |
| §5.7 | `P=G` (rank 0) | the `k=0` summand is the discrete part; isomorphism independent of `MW` | correct | none |
| §6.8 Checks | `c±=b+a±z`; `3z,z`; wall values `2,5`, slopes `(3,1),(7,4)` | `c_M=a₊−a₋`; `2`, while omitting `θ` gives `4z→0`; `2·5+2·3=16` | correct | none |
| Line 82 Tau Ceti names | pin `a91d3aa` | `IsFundamentalDiscriminant`: 0 matches; `IsResolventAt` etc. in root `LinearPMap`, `…/Resolvent/Basic.lean` 65/129/169 | wrong names | R03 |
| Lines 110, 582, 782 `K_ν` owner | AL head | AL.0.5 imports `K_ν` from AnalyticNumberTheoryPartI §2.1a | wrong owner | R02 |

**Library declarations opened at the pins.** 38 Mathlib names elaborated with `#check` in one scratch file under `import Mathlib`. They are the From Mathlib list (`MeasureTheory.L2.inner_def` through `Ideal.primaryComponent.map_ker_eq`), plus `Int.IsFundamentalDiscr`, `Int.isFundamentalDiscr_iff_squarefree` and `Real.tsum_eq_tsum_fourier_of_rpow_decay`. Tau Ceti was read in source because its object files are not built (the roadmap's Lean file imports none):

- `TauCeti.stdPeterWeylBasis` (`RepresentationTheory/Compact/PeterWeyl.lean`, line 713)
- `IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul` (`Analysis/Semigroups/Group/Stone/Unbounded.lean`, line 106)
- `IsCompactOperator.finiteDimensional_eigenspace` (`Analysis/Normed/Operator/Compact/Eigenspace.lean`, line 56)
- `TauCeti.isFredholm_one_sub` (`Analysis/Fredholm/CompactPerturbation.lean`, line 64)
- `ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector` (`Analysis/InnerProductSpace/Spectrum.lean`, line 152)
- `TauCeti.vitali` (`Analysis/Complex/Conformal/Vitali.lean`, line 95)
- `TauCeti.LinearPMap.analyticAt_resolvent` (`Analysis/Normed/Operator/Resolvent/Analytic.lean`, line 58)
- `TauCeti.exists_isFiniteMeasure_eq_nevanlinnaKernel_add` (`Analysis/Complex/Pick/Nevanlinna.lean`, line 436; its statement is exactly line 84's formula)

The exceptions are R03's names.

**Cross-roadmap citations resolved this round** (at the indexed heads):

- AnalyticNumberTheoryPartI: §2.1b at its README line 1205, with `nonholomorphic_eisenstein`, `completed_eisenstein_fourier` and `completed_eisenstein_continuation` declared in its `Suggested.lean` lines 595, 604 and 617. The last is identical to the statement this head deletes. Also §2.1c (line 1229), §3.23b (line 2637) and §2.1a (line 1183).
- AnalyticNumberTheoryPartII: §5.3n (spherical-section bullet: `c(z)=Z_F(z−1)/Z_F(z)`, `I(χ₁,χ₂,z)→I(χ₂,χ₁,2−z)`) and §5.21w (`E*(z,g)=E*(2−z,g)`, residues `±Res_{v=1}Z_F`).
- AutomorphicLFunctionsAndLocalFactors: §AL.0.5 (R02).
- OperatorTheory/UnboundedOperators: UO-A01 and UO-A02, where UO-A02 includes recovery of a self-adjoint operator from its spectral measure.
- VonNeumannAlgebras on main: V4.0.Fields and V4.Core.
- ArithmeticLocallySymmetricSpaces: `LocallySymmetric.FrankeInput` (ALS.5b.4) and `LocallySymmetric.realPoints_lieGroup` (ALS.F.1), both README targets there.
- The worker's resolver lists no cross-roadmap citation found nowhere. Its seven "Lean names found nowhere" are the five names of this file (all declared), the two ALS targets, and `TauCeti.Multiquadratic.IsFundamentalDiscriminant` (R03).

**Duplication and ownership.**

- The hand-over removes a real duplicate: AnalyticNumberTheoryPartI owns the level-one series in its own scope paragraph.
- Neither AnalyticNumberTheoryPartI nor Part II states anything this roadmap still owns (searched for Kloosterman sums, Poincaré series, the Legendre function, Green and resolvent kernels, Weyl integrals, the Weyl law and `Γ₀(N)`: no hits in either).
- The analytic Fredholm theorem has no other owner: CompactOperators on main is nonarchimedean, and no open pull request states it.
- MaassForms, GrossZagierAndArithmeticHeights and AutomorphicSpectralTheoryPartII (merge order 301) cite this roadmap rather than restating it.
- No other roadmap cites the two deleted Lean declarations (roadmaps grep: no match).
- Overlaps: no other open pull request changes this roadmap, and no cited id is dropped elsewhere. Both new suppliers are new-roadmap pull requests named in the description's depends-on and merge-order paragraphs.
- FuchsianOrbifoldsPartII (merge order 300) declares four gaps on §4.17a and describes this roadmap as its owner. Since ownership now sits with AnalyticNumberTheoryPartI §2.1c, which claims it in its scope paragraph, that consumer should re-point; this is not a defect here.

**Declared gaps.** None in this roadmap (no readable `design/plan.json`). No `*Needs:*` line cites a roadmap later in the merge order.

## Not verifiable

- [GZ86] (§§0.39, 0.45 and 1.27 of the sample): DOI 10.1007/BF01388809 resolves only to a paywalled page; uncertified, as in earlier reviews. All three statements were recomputed in the table instead.
- Borel–Jacquet's Corvallis article, proposed in R04's repair: the AMS volume page returned HTTP 403 and the sources service found no open copy, so its theorem number is not given here.
- Fra98 Theorem 14 (§5.7): the Numdam OCR garbles the chamber symbol in the hypothesis "`r` in …". "Closed positive chamber" agrees with the surrounding text, where Theorem 15's proof notes it is the only place the open chamber is used. It is not readable letter by letter.

## Source issues

- **Misprint** in Art05 at Lemma 17.6 and (17.14), p.101: the second factor is printed as `c_M^{Q₂}(λ)` in the lemma and as `d_M^{Q₁}` in (17.14). It should be `d_M^{Q₂}(λ)` and `d_M^{Q₂}`, since `(cd)_M` is bilinear in the two families. This affects nothing: §6.8 states the splitting in its own form.
