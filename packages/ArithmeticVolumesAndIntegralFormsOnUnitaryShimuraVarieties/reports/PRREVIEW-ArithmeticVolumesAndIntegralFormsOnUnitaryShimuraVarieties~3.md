# Review of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (pull request #2923 at 10640e9)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties/`
**Verdict:** needs changes

**Summary.** Changes are needed for one finding. This head narrows every target of 8.11–8.19 to CM fields containing `ℚ(√−d)` with `d` a prime `≡ 7 (mod 16)` and `E` unramified over `E⁺`. These are the hosts of one proof. The routes of 8.11–8.17 do not use this restriction, and their supplier for the global model does not need it. Both findings of the previous review are repaired: `p, q ≥ 1` in 8.15–8.17, and the nef-bundle inputs, now with owners that state them. The Chowla–Selberg statement of `Suggested.lean` and the CM-value Checks of 8.19b hold numerically, and the two new source locators (Chowla–Selberg 1967, Damerell 1970) say what they are cited for. There are three small corrections and one format note, none blocking. The human reviewers have to decide on the reliance on an unrefereed formal proof announced on 20 November 2026.

## R01 (P2) — The setting restricts 8.11–8.17, which are general statements about unitary Shimura varieties, to the host fields of one proof, although their routes and suppliers do not need it

The setting of 8.11–8.19 (lines 69–72) now takes "`K = ℚ(√−d)` for a prime `d ≡ 7 (mod 16)` and `E` unramified over `F` at every finite place" and adds "no statement is made here for other CM fields". The Summary (line 3) repeats this. At the previous head the same targets were stated for every host `E ⊃ K` of FrobeniusRestrictedRieszSums §0.1. As a result the flat line (8.11), the twists (8.12), the change of weight (8.14), the models of the flag bundles and arithmetic proportionality (8.15–8.16) and the average arithmetic volume theorem (8.17, headline (3)) are planned only for the chain's hosts. A library that needs them for any other CM field gets nothing.

The restriction is not needed for any of the following reasons:
- **The routes of 8.11–8.17 do not use it.** Of `K` they use an element `w_0` with `w_0 + w̄_0 = 1`, which the setting already asks for, and in 8.11 (c) `disc K = −d`. I found no use of `d` being prime, of `d ≡ 7 (mod 16)`, or of `E/E⁺` being unramified. The paragraph "Statements of the formal proof" (lines 98–101) says itself that these are restrictions "that the route written here does not visibly use".
- **The global model does not need it.** The model `Y` with its cubical line bundle is ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §7.31a (b). At its head, (b) holds for every integral PEL datum with a self-dual lattice and such a `w_0`. Only the marked form at similitude level one, §7.31a (b′), assumes `√−d ∈ E` with `d` a prime `≡ 7 (mod 16)` and `𝒪_E` unramified over `𝒪_F`.

The convention paragraph already allows a wider form "stated beside" the formal proof's. One repair would be to state 8.11–8.17 for the datum of §7.31a (b): a self-dual lattice, `w_0`, a principal congruence level good at every prime, and `|disc K|` in place of `d` in 8.11 (c). The hosts' fields would then be recorded as the case that [FormalProof] treats. The restriction would be kept only where the chain or the marked form (b′) enters: 8.13 (c), 8.18–8.19, and 8.19b–8.19d, which have their own hypotheses. No consumer is affected, since GluedTargetAndDivisionInequality and ThetaChainsAndFrobeniusPrimeSums apply these targets only on the hosts.

## C01 — 8.17 asserts its mean form below the cut-off `B₁` without naming the source for that range

The mean of the volume slopes is stated with "No lower bound for `B(u, g)` is asked, and `C` depends neither on `E` nor on the datum" (line 804). Its route says that it "needs `B(u, g) ≥ B₁`", and that the case `B(u, g) < B₁` "is not given here" (lines 816–817). By the convention of lines 98–101, a target that records the formal proof's form names [FormalProof] at the target, as 8.14a does. 8.17 is marked only *NEW*, so a reader cannot tell what supports the range below `B₁`. That range is the one 8.18 (c) uses on covers of growing level. One fix would be to add [FormalProof] to the credit of the mean form. Another would be to state that form with `B(u, g) ≥ B₁`, which the route proves.

## C02 — Most targets still have no locator into a source (partly repaired since the last round)

8.5 now cites Chowla–Selberg 1967, §12, (1), p. 109, and §6, (39), p. 97, and 8.19b and 8.19c cite Damerell 1970, §2, Theorem 1, p. 290. All three say what they are cited for. Locators are still missing in two places. First, the *NEW* targets that credit [FormalProof] give no file or declaration: 8.14a, 8.14b (L5), and every *NEW* target through the References line "The targets marked *NEW* specify its mathematics". Second, 8.19d (i)–(ii) credit Hecke with no work or page. A declaration name of the formal proof at each target that names it, and a theorem and page for Hecke's formula, would let a reader check them.

## C03 — The description describes the setting more widely than the head does

The description gives the objects as "the unitary Shimura variety of a Hermitian space of signature `(p, q)` over `E` with a self-dual lattice, at a principal congruence level that is good at every prime". The head's Summary and setting add "for `K = ℚ(√−d)` with `d` a prime `≡ 7 (mod 16)` and `E` unramified over `E⁺` at every finite place". Once R01 is settled, the sentence should describe whichever setting the head keeps. If the restriction stays, insert that clause after "over `E`".

## N01 — The mean form of 8.17 (line 796) again says "all primes good for the level", while line 784 has the clearer "the level good at every prime"; one wording would do.

## Questions for the author

- Does [FormalProof] establish the mean form of 8.17 for `B(u, g) < B₁` too, with `C` independent of the level? 8.18 (c) applies it on the deep covers, whose level `g₀g₁·15^e` grows with `x`. The route stops at `B(u, g) ≥ B₁`, and the formal proof gives no declaration I could open.

## Verified sound

| Statement | Instances tried | README side (computed) | Other side (computed) | Result | Change |
|---|---|---|---|---|---|
| 8.5 (a), `chowlaSelberg_classMean` | `D` = 7, 8, 11, 15, 20, 23, 24, 31, 47 (`h ≤ 5`) | class mean of `Per`: 1.42650197, …, 1.26946657 (`D = 23`), …, 1.13117805 | `γ + log(2π/√D) − L′/L(1,χ)`: same to ≤ 3.4e−9 | holds | none |
| 8.5 source | Chowla–Selberg 1967 §12 (1), p. 109; §6 (39), p. 97 | class mean = `γ + log(2π/√D) − L′/L(1,χ)` | constant terms of (1) with (39): mean `log(y|η|⁴) = γ − log(2√D) − L′/L(1)`, add `log 4π` | holds; `w` cancels, so `D = 3, 4` too | none |
| 8.5 Check, `logPeriod` | `ℤ[i]`; `Λ = ℤ + ℤτ` | `Per(ℤ[i])` = 1.4763359660 | `log(Γ(1/4)⁴/4π²)` = 1.4763359660; `log(Im τ/π) + (1/6)log|(2π)¹²η²⁴| = log(4π Im τ|η|⁴)` | holds | none |
| 8.11 (b) Check | `(p,q) = (1,0)`, `E = K = ℚ(√−7)` | `deg Lie ℰ₀ = ½ log Ω_K` = 0.713251 | `−h(ℰ₀)`, `h = −½·1.426502` | holds | none |
| 8.12 | `p = 2, q = 1, w = 1`, `E = K = ℚ(√−7)` | slope shift `−(p−q)·log Ω·Σw` = −1.426502 | `s^w` has degree `−w·(p−q)/2·log Ω`, doubled by `μ = 2μ̂` | holds | none |
| 8.14 Checks | `S` simply transitive, `|S| = 2`; `S = {1, γ}` | `μ(A) = log 2` = 0.693147, `μ(B) = 0`, `2P = log 2` | equality `μ(B) = μ(A) − 2P`; determinant `ς² − (γ^*ς)² = 0` for `ς ≡ 1` | holds | none |
| 8.14a | `|Φ|=1, p=q=1, μ=(M,−M), g=2M` | LHS `M·e`; hypothesis gives `ℓ ≥ 2|Φ|+2` = 4 | route `g·e/2 − 2|Φ|M·m₀ ≥ 0` iff `(ℓ−2)g ≥ 4|Φ|M` | holds | none |
| 8.14c | `|Φ|=1, N=2` | `(x₀−x₁)(αx₀+βx₁)` | `(x₀−x₁)(αx₀+βx₁+c)` breaks homogeneity | holds | none |
| 8.15 | `(p,q) = (1,2)`; `(0,3)` | `p, q ≥ 1`, `N ≥ 3` ⇒ not compact | (1,2): isotropic by Landherr; (0,3) now excluded | holds (previous R01 repaired) | none |
| 8.15c | `θ = 5|Φ|/B`, `‖λ‖ ≤ ½` | nefness via (a2): `4|Φ|(½+2θ) ≤ (B−2)·2θ` | holds for `B ≥ 5|Φ| + 2.5` | holds | none |
| 8.15d | `ℓ_u^{D+1}` | `S^p_τ = −(D+1)δ_Fl(u)Σ_{i<p}u_{τ,i}` | differentiation of `(−Σu x)^{D+1}` | holds | none |
| 8.15e Check | `ℓ = 3`; `k = 1, 2` | `ϰ₂(τ,τ) = 1/8 − 1/2` = −0.375; `ϰ₁ = 0` | `Σ_σϰ₁ = ½ − ½ = 0` | holds | none |
| 8.16 (b) | `a/k ≤ 1/3`, `k ≥ 6` | mean `≤ (1 + log⁺m)/k` | `≤ 1.61/k + 0.55 ≤ 0.82 ≤ 3` | holds | none |
| 8.17 | `u = (3,1,0)`, `p = 1`; `|Φ| = 2, N = 4` | `0 ≤ s − pt/N = 5/3 ≤ 4`; `B(u,g) ≥ 4·2·16` = 128 | `3q+1 ≤ N` gives `p ≥ 2q+1 ≥ 3` | holds; range `B < B₁` unsourced | C01 |
| 8.17 inputs | AAHPartII §0.3 (1′) at its head; AMAGPartII §§1.5–1.7 on main | `vol(L) = (L^n)` nef; nef big iff `(L^n) > 0`; Kleiman | stated there verbatim in content | holds (previous R02 repaired) | none |
| 8.18 (o) | `e = ⌊3x^ε/log 3⌋`, `Z = frx^ε ≥ 32x^ε` | `log(g₀g₁15^e) ≤ 27x^ε + 2`; field `≤ 391Z²` | `18x^ε + 2 + 7.39x^ε`; `217Z² + 580x^ε + 60 ≤ 391Z²`; `391Z² ≤ Z¹²` | holds | none |
| 8.18 `c_j` | `f = 4, r = 8, p = 7, q = 1` | `c = 416` | `≤ 22f²r⁴` = 1441792 | holds | none |
| 8.18b | mirabolic pair over `𝔽_q` | Mackey condition | `ψ(a⁻¹b) ≠ ψ(b)` for some `b` when `a ≠ 1`; index `v(aσ⁻¹|U|)·dim Z_g` | holds | none |
| 8.18e | `D = 2, T = 11, ρ = 0` | `q_z` = 28/11; `T₀(2)` = 11 | `c(D,N−1)/(D+1) = ½H_{N−1}` (ChowForms §6.2 (b)); `q_z ≤ ½ ⇒ D² ≤ T/14` | holds | none |
| 8.18f (b) | Slopes §4.2 at its head | `μ_max ≤ 2ℓ + 2log β + 2log rd(𝕂) + 4` | `κ ≤ ½log(n+2) + log 2 + ½log rd`, `rk ≤ β`: `2ℓ + 2log β + log rd + 2.48` | holds | none |
| 8.19 (b) | `j = m`; loss in (iv) | `−(p_m − q_m)Σw·log Ω` = `−rΣw_m log Ω` | 8.13 (c) same; `ε_rk|t| ≤ 4b + C`, `2ε_rkΛ ≤ 6b` | holds | none |
| 8.19a (I7) | `n = 2, T = 44` | ratio `binom(43,2)/binom(54,2)` = 0.631 | `≥ 1 − n(2n+7)/T` = 0.5; `#{|α| < T−n} = binom(T−1,n)` | holds | none |
| 8.19a‴ | `ρ × ρ` determinant | `(ρ/2)·log ρ` | columns `≤ √ρ·e^{C}S(θ_j)`; Tau Ceti `norm_det_le_prod_norm` | holds (previous C01 repaired) | none |
| 8.19b Check | `D = 7, 11` | `E₂^{*6}/Δ = −3⁶/7³`, `−2¹⁸/11³`; `E₂^*E₄/E₆ = 5/21` | −2.1253644315, −196.9526671675, 0.2380952381 | holds | none |
| 8.19b units | `F = ℚ(√7)`, `E = F(i)`, `𝔣 | 2` | `i ∈ 𝒪_𝔣^×` | `(1−i)𝒪_E = 𝔭𝒪_E` so `i ∈ 1 + 𝔣𝒪_E` | holds | none |
| 8.19b (ii) | `f = 2, k = 8` | `Σc_E(l)log l` ≤ 11.1 | `fk·log(fk+1)` = 45.3 | holds | none |
| 8.19b–c source | Damerell 1970 §2, Thm 1, p. 290 | algebraicity of normalised Hecke values of an order | Theorem 1 at that page states it | holds | none |
| 8.19c Check | `ψ = 1`, `Y = 1`, `N𝔮 = 2`, `s = 1` | Euler correction | `(½)(½) + ¼ = ½` | holds | none |
| setting of 8.11–8.19 | routes of 8.11–8.17; ProjectiveModels §7.31a (b), (b′) | `d` prime `≡ 7 (16)`, `E/E⁺` unramified | used: `w_0`, `disc K = −d`; (b) general, only (b′) restricted | narrower than needed | R01 |
| headlines (2)–(4) | Lean docstring | 8.11, 8.17, 8.19 (b) not statable | docstring names each and the missing carriers | holds | none |

- Source locators checked against the text: 4 (Chowla–Selberg 1967 §12 (1) p. 109, §6 (39) p. 97, (2) p. 110; Damerell 1970 §2 Theorem 1 p. 290).
- Library declarations opened at the pins: `ModularForm.eta` (Mathlib/NumberTheory/ModularForms/DedekindEta.lean:57), `NumberField.dedekindZeta` (Mathlib/NumberTheory/NumberField/DedekindZeta.lean:50), `Real.eulerMascheroniConstant` (Mathlib/NumberTheory/Harmonic/EulerMascheroni.lean:131), `NumberField.prod_abs_eq_one` (Mathlib/NumberTheory/NumberField/ProductFormula.lean:98), `OrthonormalBasis.norm_det_le_prod_norm` (TauCeti/Analysis/InnerProductSpace/Gram/Hadamard.lean:77). Neither pin has Chowla–Selberg or Kronecker's limit formula.
- Cross-roadmap citations: every cited section id of 24 suppliers exists at main or at the open head (scripted). I read the following for content: ArakelovGeometryAndAbelianHeightsPartII §0.3; AlgebraicModuliForArithmeticGeometry §§1.3, 1.6, 9.10; AlgebraicModuliForArithmeticGeometryPartII §§1.5–1.7; MetaplecticAutomorphicForms §6.4; ComplexMultiplicationAndExplicitReciprocityPartII §4.6; SlopesOfHermitianVectorBundles §4.2; DiscreteSeriesCoefficientsAndAutomorphicMetrics §6.8a; ThetaChainsOnDefiniteUnitaryGroups §2.6; FrobeniusRestrictedRieszSums §0.4; ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §7.31a. Every id that GluedTargetAndDivisionInequality and ThetaChainsAndFrobeniusPrimeSums cite here exists.
- Previous findings: R01, R02, C01, C02, C03, C04, C06 and N01 are repaired. C05 is partly repaired (C02 above). N02 is partly repaired (N01 above). The question on `B₁` was answered by restating 8.17 without a lower bound (C01).
- Automatic checks: all passed. Dependency check: `depcheck: 171 roadmaps, 2014 edges, 0 problem(s)`. Within the family index, every supplier is listed above this roadmap and both consumers below it. There are no changes outside the folder other than the family index.
- Elaboration: `lake env lean` on `Suggested.lean` gives only the `sorry` warning (line 66). `#check @` of both declarations matches README 8.5 (a), with no section binders. The one-tactic probe closes nothing (`simp` rewrites and leaves the goal).
- Overlap check: I read HeightsForLogSingularMetrics, GluedTargetAndDivisionInequality, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties, the family index, ArakelovGeometryAndAbelianHeights, ShimuraCompactifications and BallQuotientsAndComplexHyperbolicLattices. Nothing is shared. HeightsForLogSingularMetrics leaves arithmetic proportionality for flag bundles to this roadmap. GluedTargetAndDivisionInequality owns the disjoint ids 7.12–7.14, 8.1–8.10, 8.5c and 8.19e–8.24. The Chowla–Selberg Faltings height is ComplexMultiplicationAndExplicitReciprocityPartII §4.6, which 8.5 cites; the class-mean analytic form is this roadmap's own. Ownership against open pull requests was checked with the roadmaps tool.
- Source independence: 7 passages compared with 2 sources (8.5 (a), its credit line and route, the docstring of `chowlaSelberg_classMean`, the credit lines of 8.19b and 8.19c, the References), plus a 6-word scan of the whole README. Nothing is shared but Damerell's title. Largest share: ChowlaSelberg1967, 3 of 5 explicit locators. Contents compared with ChowlaSelberg1967 (§§1–12): independent; its sections map onto no run of this roadmap's thirty sections.
- Research link: 8.5 is the Chowla–Selberg formula (Chowla–Selberg 1967) in the Faltings-height form of Colmez (1993). 8.15–8.17 are arithmetic proportionality and arithmetic volumes for flag bundles, relatives of Köhler, Burgos Gil–Kramer–Kühn and Bruinier–Howard–Kudla–Rapoport–Yang. 8.19b–8.19d are Damerell's (1970), Shimura's and Hecke's CM-value results. All of it serves Alpöge's announced formal proof (2026). This rests on the README References and the two texts read.

## Not verifiable

- [FormalProof] (README References, line 2145): no target gives a file or declaration, so no *NEW* statement could be checked at a locator; not read.
- [Announcement] (line 2146): not read. As in the previous round, its host is in no licence class, and I did not vouch for it as the author's page.
- The other published works in the References (Colmez 1993, Hecke, Katz, Kollár and others): no locators are given; not fetched.

## Source issues

- none

## For the human reviewers

- Scope: most targets are *NEW* and specify the mathematics of a formal Lean proof of the Riemann hypothesis for Dirichlet L-functions, announced on 2026-11-20 by one author (README lines 2145–2146). No refereed source states them. The classical inputs (Chowla–Selberg 1967, Damerell 1970, Hecke, Shimura) are published.
- Not tested: [FormalProof] and [Announcement] were not read. The *NEW* targets' wording and arrangement were not compared with them.
