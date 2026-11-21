# Review of GluedTargetAndDivisionInequality (pull request #2922 at 54c521b)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/GluedTargetAndDivisionInequality/`
**Verdict:** accepted

**Summary.** Accepted: no finding. The two findings of the earlier review are repaired (the denominators of the test values are now the target 8.24c (i), linear in `b`; the route of 8.23 now has `0 ≤ D⁻_j`), and every statement I recomputed holds, against the supplier sections it cites where those enter. There are two small corrections (the bound for the branching integer behind the top term of 8.7 (b) has neither a route nor a locator; one sentence of the description is behind the head), one format note and one question, none blocking. The human reviewers have the scope and the licence of the formal proof to decide: its text could not be read, only its announcement.

## C01 — The top term `t_u` of 8.7 (b) rests on a bound for the branching integer, linear in `N_m`, that has no route and no locator, and the suppliers give only the quadratic one.

The route (lines 698–705) counts at most `N_m²·D₀(τ)` factors of `c_{Br,τ}` and then uses `log|c_{Br,τ}| ≤ C·N_m·(D₀(τ) + Sc + ϑ)·La`, saying that "the passage to this bound is not given here". Every other clause of this kind in the roadmap names the file and declaration of [FormalProof] that states it; this one names none, so a reader cannot find what supports the coefficient `N_m` (rather than `N_m²`) of `|Φ_top|·b′` and `f·(mϑ + Sc)` in `t_u`, and through it in `h_u`. What the cited sections give is `|c_Br| ≤ spread^{(N−1)·D₁}` with `D₁ = Σ_i min(λ_i − λ_{i+1}, D₀)` (IntegralWeylModulesOfGeneralLinearGroups §1.1 (d); ThetaChainsOnDefiniteUnitaryGroups §3.9), and `D₁ ≤ (N − 1)·D₀` is the quadratic count.

Either name the declaration of [FormalProof], or write the passage: `D₁(τ) ≤ D₀(τ) + Λ_{m,1}(τ) − Λ_{m,N_m−1}(τ)` (the first gap is at most `D₀`, the others sum to the tail spread), so the linear form follows once the tail spread of `Λ_m(τ)` is bounded by `C·(Sc + ϑ)`-type terms. Nothing downstream depends on which form is used: under the hypotheses of 8.22, `(N_m² + m·k)·b′ ≤ a` and `N_m²·w″ ≤ b` with `k·Sc + m(t + 1)ϑ ≤ w″`, the quadratic form of the term is also at most `C·|Φ_top|·a·La + C·f·b·La`.

## C02 — The description says "the Bessel–Poincaré series of the word is nonzero on its new forms"; the head, and SeesawForThetaChains §6.14, ask it of every word.

The description's second paragraph was written for an earlier head. The README now reads "of every word `u`" in the Conventions, 7.13, 7.14 and 8.9, which is the hypothesis of SeesawForThetaChains §6.14 ("for every word `u` the series `P_u` is nonzero on the `T(u)`-new forms"). The text that would be right: "among them that the Bessel–Poincaré series of every word is nonzero on its new forms".

## N01 — The Conventions, 8.1 and 8.5c cite BernoulliBoundsForClassGroupEigenspaces §6.17, ArithmeticKTheory §6.9, ComplexMultiplicationAndExplicitReciprocityPartII §§0.2, 4.6, ArakelovGeometryAndAbelianHeights §§2.9, 4.6 and HeightsAndUnits §0.3 for comparison; none appears in the supplier contracts or in a Dependencies list. One line saying that they are comparisons and not inputs would let a reader tell them from suppliers.

## Questions for the author

- The References give "L. Kronecker; M. Lerch, *Sur quelques formules relatives au nombre des classes*, Bull. Sci. Math. 21 (1897)". Is that title not Lerch's paper alone, with Kronecker's limit formula a separate work? I did not open either text.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 7.12 and `pairing_integral_of_localDivision` (headline 1) | `ℚ`, `N = 6ℤ`; `ℚ(i)`, `𝔭 = (2+i)`; Lean hypotheses | `τ₂ = 2`: `N′ = ½ℤ` fails. `(2+i)/(2−i)`: `v_𝔭 = 1`, `v_{c𝔭} = −1`. `v(aB) ≥ −τ + ⌈σ⌉ ≥ 0` | holds; Lean equals README (`v_𝔭(c d) = 1 ⇔ d ∉ c^{−1}𝔭`) |
| 7.13 | no twisted place; `c_𝕃` an involution | `R = Λ_1`; `c^{−1}(𝔭) = c_𝕃(𝔭)`; exponent of `𝔭` in `I_u^{−1}` is `⌊e_𝔭𝔊_u(𝔭)⌋`; `ξ_{c_𝕃(𝔭)} = ξ_𝔭` is ThetaChains §2.5 (iii) | holds |
| 7.14 (headline 1 for the chain) | hypotheses of the suppliers | LocalGain §4.16 (ii): `P̃ = 0` or `v_𝔭 ≥ ⌊e_𝔭𝔊_u(𝔭)⌋`, under 4.10, 4.10a; Seesaw §6.15 (b): `ζ(u, ξ_𝔭)` a unit at `𝔭` | holds as cited |
| 8.1 | `m = 1`, `λ_1 = (1, 4)` | `‖B‖² = 1`, bound `1`; with `max_π`: `1/4` | holds |
| 8.2 | `N = 1`, `Th = e^{u²/2}` | `sup s^y e^{−s²/2} = e^{ph(y)/2}` at `s = √y`; `((n+1)/n)^{n/2} ≤ e^{1/2}`; `π^{−N}∫e^{−θ\|u\|²/2} = (2n+2)^N` | holds |
| 8.3 | `ρ = √g` | `vol B_ρ = (πg)^g/g!`; disjoint balls give `(1 + 4ρ/√(πh))^{2g}`; `e^g g!/(πg)^g ≤ (e/π)^g` | holds; Tau Ceti lemma exists as named |
| 8.4 | `N = 1`, `ν = (n)`; Schur test | `\|c_n n!\|² = n!·C(n, n/2)/2^n`; row and column sums give `h_{j−1}h_j·max` | holds |
| 8.6 | `SizeT_u` | `La = log(x·b·rd_E) ≥ log b = x^ε`; `log T(u) ≤ C_T m x^ε ≤ C_T m La`: error `C f m³N_m²La` | holds |
| 8.7 | top and other places; factor count | `−n_τ ≤ −a_τ + N_m + Sc + mϑ + a⁻_τ` (top), `≤ 2Sc + mϑ + N_m` (off); `(N−1)·D₁ ≤ (N−1)²D₀` | first bound holds; `t_u` as stated, see C01 |
| 8.8 | rows of `a⁺_{j,τ}`; use in 8.24 | formula equals LocalGain §4.9f (d); `H⁺ ≥ 1` and `r + t ≤ N_m` give `−log λ_j ≤ C f N_m² log b` | holds as cited |
| 8.9 (headline 2) | metric divided by `\|P_1\|` | `ι_1^*ι_1 = (𝔫/\|P_1\|)∏λ_j` gives `−log 𝔫 + log\|P_1\|`; Seesaw §6.14 (`m ≥ 4` even, every word) carried by reference | holds |
| 8.10 | (a), (c) | hooks of row `i` are `≥ μ_i, …, 1`; `log 5! = 4.79 ≥ ph(5) = 3.05`; `ph(0) = 0 > ph(1) = −1` | holds |
| 8.19e | Check on the `2m` conditions | `2m·ε′/(2m) = ℓ^{−2}`; one condition each with `ℓ^{−2}`: `2m/ℓ²`; levels add under products | Check holds; (b), (c) not readable in [FormalProof] |
| 8.20 | (vi); (iv) | `Σ_ℓ 2 log ℓ/ℓ² = 0.98618 < 1`; `Σ_{𝔭\|ℓ}ϱ(𝔭)e_𝔭 = log ℓ` | holds |
| 8.20a | `g = 13`, `T = 3`, `e_𝔩 = 12`, `e₁ = 2` | `E = 2⌈36·13/12⌉ = 78`, `78/24 = 3.25 ≤ 3.542`; type sum `4T − D^H_j = 4T + 2F_j` | holds |
| 8.20b | (N5) count | excluded vectors `≤ N_c(N_c+1)^{N_c−1} < (N_c+1)^{N_c}` | holds |
| 8.21 | (c); Check in `ℚ(i)` | `e^{2fr/g} ≤ 1 + 4fr/g` for `24fr ≤ g`; `δ = 4sn/g = 8fr/g ≤ 1/3`; Gram `1/5`: valuations `−1, −1`, indices `0, −1` | holds; equals FiniteReductiveGroups §2.8 (c) |
| 8.22 (headline 3) | (D4), `m = 4`; top term in either form | `2j−1−m = −3, −1, 1, 3`, sum `0`; `f m b La ≤ 2B₀` as `La ≤ 2x^ε`; `N_m²b′ ≤ a`, `N_m²w″ ≤ b` | holds |
| 8.23 | (a) (ii), (iv); (b) | `Σ log p/p³` over `p ≡ ±1 (16)`: `7.6·10⁻⁴ ≤ log 4/64 = 0.0217`; `9/2 + 10.01ε ≤ 5` iff `ε ≤ 0.0499`; `D⁻_m = 0` | holds |
| 8.24a | (d) | tower: `1` or `ρ_ξ(e+1)^{−1}`; numerators `≤ 2h_sq`; coefficients needed `3` and `1`, stated `4` and `5` | holds |
| 8.24b | (ii) from (i); product formula | two coordinates and one mass: `−3d`; `Σϱ\|v_𝔭(x)\| ≤ mean log⁺ + 6Σϱ d_l` | (ii) holds; (i), (iii) not readable |
| 8.24c | (i) | `v_𝔭(y) ≤ d(𝔭)` real gives `≤ ⌊d(𝔭)⌋`; bound linear in `b`, so `≤ x^C·b` | consistent; proofs not readable |
| 8.24 | slope test; terms (1), (2) | `μ = 2μ̂` doubles `Σϱ a`; `rank X⁺ = r+1+m(s−1)` (RowTower §5.8a); `(r+is)(r+(i+1)s) ≤ N²`; `N(𝔪_□) ≤ e^{2σ_G}` | holds |

- Source locators checked against the text: 4 (Bost1996 line 467–476, Prop. 4.3 on printed p. 131; Bost1996 line 771–780, App. A.2 on pp. 146–147; GaudronRemond2014 line 586–595, Lemme 3.9 and its proof; Announcement line 158–175, the chain of theta lifts, the slope inequality, division and gluing).
- Library declarations opened at the pins: `TauCeti.le_setAverage_ball_of_laplacian_nonneg` (`TauCeti/Analysis/InnerProductSpace/Harmonic/MeanValue/Basic.lean:464`, namespace opened at line 95), `Submodule.subspaceHeight` (`TauCeti/NumberTheory/Height/Arakelov/Subspace/Basic.lean`); no declaration of the pinned Tau Ceti states integrality after division.
- Cross-roadmap citations: all resolve on main or at an open head. Read in text: RowTower §5.8a; Seesaw §§6.14, 6.15; LocalGain §§4.9f (d), 4.16; ThetaChains §§2.1 (`SizeK`, `B₀`, `La`), 2.5, 3.9; FiniteReductiveGroups §2.8; Slopes §2.4; IntegralWeyl §§1.1, 3.3; FrobeniusRestrictedRieszSums §0.4 (g); ArithmeticVolumes §8.19; Congruence §7.11; MathematicalStatisticsHighDimensional §1.4.
- Dependency check: `depcheck: 170 roadmaps, 1989 edges, 0 problem(s)`; no UPWARD or CYCLE line. Automatic checks: all passed.
- Elaboration: `Suggested.lean` elaborates with the `sorry` warning only. `#check` of the one declaration: its type is the statement of 7.12; no section variables, so no binder can be lost.
- One-tactic probe: `simp` and `simp_all` leave the goal open; the theorem is not padding. Headlines 2 and 3 are named in the module docstring as not statable, with the carriers they lack.
- Earlier findings: both repaired (8.24c (i); `0 ≤ D⁻_j` in 8.23); the four earlier small corrections and two format notes are applied.
- No change outside the roadmap folder and the family index; the index lists this roadmap after its suppliers and before ThetaChainsAndFrobeniusPrimeSums.

Overlap check: read ThetaChainsAndFrobeniusPrimeSums, ThetaChainsOnDefiniteUnitaryGroups, SeesawForThetaChains, RowTowerAndRallisIdentities, LocalGainOfThetaChains, CongruenceModulesOfThetaLifts; nothing shared (the divided source, the glued target, `h_u` and the division inequality are owned here; ThetaChainsAndFrobeniusPrimeSums §§9.2, 9.6 cite 7.13–8.24, and the bulk `F_j` is LocalGainOfThetaChains §4.9f (d), cited here).

Source independence: 8 passages compared with 3 sources (Bost1996, GaudronRemond2014, Announcement), none shared; largest share [FormalProof], 112 of 115 locators; its contents could not be read; contents compared with the outline of Announcement (items 8–15, 18): independent, division and gluing come first here and the norms after.

Research link: Layers 7–8 give the integrality, heights and target slopes that the slope inequality for chains of theta lifts needs in Alpöge's formal proof (announced 2026) of the Riemann hypothesis for Dirichlet L-functions, by Bost's slope method (Bost 1996, Prop. 4.3). Rests on the README's Routes paragraph, Announcement and Bost1996.

## Not verifiable

- [FormalProof] (a GitHub repository): its host is in no licence class of the sources service, so none of the 112 file and declaration locators was opened; the targets were checked by computation and against the supplier sections.
- 8.19e (b), (c), 8.20 (vii) (a)–(h), step (3) of 8.20a at the orbits that do not alternate, 8.24b (i), (iii) and 8.24c: stated without routes, on [FormalProof] alone.
- Bost1996: the displayed formulas of Prop. 4.3 and App. A.2 are missing from the text layer; the surrounding prose matches the README's use.
- Bargmann 1961, Kronecker–Lerch 1897, Chowla–Selberg 1967, Frame–Robinson–Thrall 1954: cited without locators for classical facts, not fetched; the facts were recomputed (8.2 (a), `∏μ_i! ≤ H(μ)`).

## Source issues

- none

## For the human reviewers

- Scope: the README follows a formal proof announced on 20 November 2026 (Routes paragraph; References). Announcement (read) is a four-page unrefereed note; no refereed source states the targets 8.9 or 8.22.
- Licence: the host of [FormalProof] is unclassified; neither its text nor its licence was read. Announcement line 53 gives the Lean source as archive parts on the author's site, not the repository in the References.
- Not tested: [FormalProof] has 112 of the README's 115 locators; wording and arrangement were not compared with it.
