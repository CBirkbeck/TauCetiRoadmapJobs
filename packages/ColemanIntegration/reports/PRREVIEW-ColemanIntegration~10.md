# Review of ColemanIntegration (pull request #2864 at cc29686)

**Verdict:** accepted

**Summary.** Accepted: no finding. The one finding of the previous review (the Artin `L`-function inputs cited to a section that does not state them) is repaired, and so are its three small corrections; the statements sampled afresh in every layer were recomputed and agree with their sources, including the published pagination of Besser–de Jeu, which earlier rounds had not opened. There are two format notes, neither blocking. One fact about two unopened author copies is left for the human reviewers.

## N01 — A few words are still fused into code spans or split from them

A reader meets code spans that hold English, or a variable left outside its formula. Examples: "by `a ℂ_p` constant" (L2.3, line 1488), "locally analytic `primitive F`" (L0.9, line 216), "A `primitive G` gives" (L1.19, line 1008), "`padicValNat` p" (L0.1), "primitive (`mk` fun `n => (-1)^n`)" (L0.2, lines 110 and 122), "`annulusResidue` A `0 = 0`" (L0.11, line 351), "a a branch" (L1.11, line 831), and the *Needs* line of L3.11 (line 2914), where "Layer `0, gaussSum, gaussSum_mulShift_eq`" runs a layer number and two Mathlib names into one span.

## N02 — The *Needs* line of L3.13 ends with "2.Fa"

Line 2934 lists "2.Fa"; the target is L2.Fa, as the proof sketch of the same item writes it.

## Verified sound

Previous review, item by item.

- R01 (Artin `L`-functions cited to AdelicAlgebraicGroups §2.4): repaired. The four places now read "AnalyticNumberTheoryPartI §2.18a" (*Needs* of L3.Fd.1 and L3.Fd.2(a), Scope and ownership, supplier contracts), and no mention of AdelicAlgebraicGroups remains. On main, AnalyticNumberTheoryPartI §2.18a (README line 1565) states the four inputs: `P_v` on inertia invariants, induction at every finite place, the one-dimensional comparison with the primitive Hecke character, Brauer continuation.
- C01 (Conventions said no pinned library has a formal primitive): repaired. The bullet now ends "for the one-variable case of Tau Ceti's multivariate primitive (L0.2)", and L0.1–L0.5 carry *In Tau Ceti:* lines. Each named declaration was opened at the pin and says what the line says it covers.
- C02 (description written before the RestrictedPowerSeries revision): repaired; the description now says "RestrictedPowerSeries, as revised on main, states §§2.1 and 7.1 on Tau Ceti's declarations".
- C03 (two pages off by one): repaired. L2.2 cites BHYY §3.1, p. 13 (BHYY line 495, on p. 13); L2.25 cites GSWZ (175), printed p. 38 (GSWZ line 1977; the printed number 38 is at GSWZ line 1967).
- N01 (fused spans): the five quoted instances are repaired; others remain (N01 above).

| Statement | Instances tried | Values computed (README side / library or source side) | Result | Change |
|---|---|---|---|---|
| L0.2 (Definition) and its *In Tau Ceti* line | `MvPowerSeries.primitive` at the pin; `ZMod p`, `X^(p−1)` | `Semiring R`, `Algebra ℚ R`, linear map; coefficient of `X^(p−1)` in `g′` is `p·coeff_p g = 0` | line true; `ℚ`-algebra needed | none |
| L0.5 *In Tau Ceti* line | `IsRestricted.primitive`, `exists_gaussNorm_primitive_le` | hypotheses `0 ≤ c′ ≤ c`, `c′_i < c_i`, `NormedField`, `CharZero`; constant `C ≥ 0` existential | line true, radius equality rightly excluded | none |
| L0.6 (Lemma) | `f = Σ p^k X^(p^k−1)` | coefficient of `X^(p^k)` in the primitive is `p^k/p^k = 1`; partial sums at 1 are `k+1` | true | none |
| L0.7 Check over `ℚ₂` | `1/(1−t²/2)`, radii `2/3`, `3/4` | `‖2⁻ⁿ‖ρ^(2n) = (2ρ²)ⁿ`; radius `2^(−1/2) ≈ 0.707`; at `3/4`: `(9/8)ⁿ` | true | none |
| L0.A1 Check | `f = T+p`, `g = T⁻¹+p`, `ρ = p⁻²` | `fg = 1+p²+pT+pT⁻¹`; norms `p⁻¹·p² = p = max(1, p⁻³, p)` | multiplicative | none |
| L0.8 / `existsUnique_primitive_disc` | `G′ = 0` at centre `b`; `r = ∞` | `(n+1)g_(n+1) = 0` gives `g_(n+1) = 0`; `HasFPowerSeriesOnBall` supplies `r > 0` | true; README = Lean | none |
| L0.12 / `exists_laurent_primitive_iff` | `n = −1`; disconnected open `I` | `0·g(0) = a(−1)`; decay at two radii gives decay between, so `I` and its hull agree | true both directions | none |
| L0.15 (Definition) Check | `p = 3`, `log 4` to `3^12` | series summed to 59 terms: digits `0,1,2,1,0,2,2,0,1,0,2,1`, equal to the printed expansion | true | none |
| L0.21 / `logBranch_laurent_transcendental` | zero map; `L(0)` free | zero map fails the series law; `0` not in any annulus, so the junk value is unused | determined on `ℂ_p^×` | none |
| L0.22 / `existsUnique_logLaurent_primitive` | `F = T⁻¹`; kernel; top degree | `G = ℓ`: `0 + 1·1 = 1`; kernel constants killed by `G₀(0) = 0`; `G_(d+1)(0) = F_d(−1)/(d+1)` | true | none |
| L1.6 (Lemma) | `G(y) = y^(q^m) + πH(y)` on `D(0, ρ)` | Lipschitz factor `max(ρ^(q^m−1), ‖π‖) < 1`; fixed point has `ρ ≤ ‖π‖` | true; BBK Def. 14 on p. 8 | none |
| L1.7 (Definition) Check | `φ(z) = z^p`, `u = (z^p−1)/(z−1)^p` | `d log u = p z^(p−1)dz/(z^p−1) − p dz/(z−1)`, so `M = pI`, `g = (0, log u)` | true | none |
| L1.8 (Lemma) | `q = 2`, `λ = 2`; `n = 0` | `2^m > 1`; empty product is 1 | true; BBK after (7), p. 8 | none |
| L1.9 (Theorem) Checks | `ℚ₃`, `x² = 2`; `ℤ₂`, `x² = 3` | 2 is a non-residue mod 3, degree 2, dimension `0+2−1 = 1`; discriminant 12 not a 2-adic unit | true | none |
| L1.10 (Lemma) | orbit of length `m`; semilinear form | `c(F^m s) = T^m c(s) + Σ T^(m−1−j)e(F^j s)`; `x = Px + b_r`, `dim_(L^σ) L^n = nr` | true | none |
| L1.11 (Theorem) | constant `e = C`; `P` of degree 0 | `(1−T)⁻¹C` solves, unique by L1.10; companion matrix has the roots of `P` as eigenvalues | true; BT p. 18 states the polynomial form | none |
| L1.18, L1.19 Checks | `log_a` on `𝔾_m`; `p ≥ 5`, discs of 2 and 3; `∫_2^(2+p)` | `log_a(1) = 0`, `d log_a ≠ 0`; indicator primitive gives `log_a(2/3)+1`; `log(1+p/2)` | true; F Prop. 2.4 p. 8, BBK Thm. 5 p. 4 | none |
| L2.3 (Theorem), L2.4 (Lemma) | `dλ_k`; `k = 2`; `k = 1` | `dλ_k = λ_(k−1)dz/z + log^(k−1)z dz/((k−1)!(z−1))`; `dλ_2 = −d Li_2^ser(1−z)`; `λ_1 = 0` | true; F Prop. 2.11 p. 10 | none |
| L2.5 (Definition) Checks | `p` odd: `z = −1, 2, 1/2, 1/p` | `(2⁻¹−1)ζ_p(2) = 0`; inversion and reflection give `0`, `−log²2/2`; `−Li^ser(p) − a²/2` | all four true | none |
| L2.7, L2.8 (Lemma, Theorem) | `z = 0`; `k = 0`; composition `m₁m₂` | derivative 1, `0 = Li_(k−1)(0)`; `Σ ζz/(1−ζz) = m z^m/(1−z^m)` | true; BDJ (2.4) p. 876 | none |
| L2.9 (Theorem) | `k = 0`; constant `C_k`, `m = 2`; disc of 1 | `F_0 = 0`; `2C = 2^(1−k)C`; residual `−log^k z/(k−1)! + log^k z/k!` | true; BDJ (1.2) p. 869 | none |
| L2.10 (Theorem) | disc of 1; `‖z‖ > 1`; `ζ` of order `p^r`, `k = 1` | `−β v(1−z)log^(k−1)z/(k−1)!`; `v(z) = v(1−z)`; `−β/(p^(r−1)(p−1))` | true; BDJ (2.5), Prop. 2.6 p. 876 | none |
| L2.18 (Lemma) | branch change; Frobenius | `−½wL + ½uM` with `u = v(z)β`, `w = v(1−z)β`; `Li_2^(p) − ½log z·Li_1^(p)` | both recomputed, agree | none |
| L2.Fb | `normalizedFive 2 3`; cyclic sum for `f` with `f(1−z) = f(1/z) = −f(z)` | ratios `−1, −1/3, −1, −1/2, −1/2`; sum `= −[f(x)−f(y)+f(y/x)−f(q)+f(r)]` | true | none |
| L2.69–L2.70 (headline) | `(4, 2)`; branch defect on `[3]`, `ℂ₃` | arguments `4, 2, 1/2, 3/2, 3`; `(a−b)log(−2)/2 ≠ 0` | consistent; not statable, named in docstring | none |
| L2.71 (Lemma) | `χ₋₄`, `k = 1` | `S = −θ(−1)(−1)^k S = −S`; `(1−i)/(1+i) = −i` is a root of unity | true | none |
| L3.9–L3.11 (Lemmas) | `N = p`, `M = 1`; `p ∤ N` | `Σ θ(c) = 0`; `θ⁻¹(p⁻¹c′) = θ(p)θ⁻¹(c′)`; both sums scale by `θ(a)` | true; RJW Rem. 5.3 p. 30 | none |
| L3.13 / `LFunction_nat_eq_gaussSum_inv_mul_sum_complexPolylog` (headline) | `χ₋₄`, `k = 1`; `c = 0` | `θ(n) = G(θ⁻¹)⁻¹Σθ⁻¹(c)e(cn/N)`; value `π/4`; `θ⁻¹(0) = 0` | true; README = Lean | none |
| L3.14 (Definition) | inversion; `z = p+p²` | `Σ_(j<n) C(n,j)B_j = 0`; difference `½log(1+p)log(1−p−p²) ≠ 0` | true; BBdJR (4.12) p. 20 | none |
| L3.15 (Theorem) Checks | `p = 3`, cube root, `r = 4`; order 6 | `‖1−ζ‖ = 3^(−1/2)`; `(1−4^(n−1))[ζ] = 4^(n−1)Σ_(α≠1)[ζα]`; reductions `−1`, 2 | true; BDJ proof of Thm. 1.12 p. 910 | none |
| L3.28 (headline) and the Summary's unit claim | `p = 5`, `χ₋₃`, `k = 2` | Euler factor `26/25`; `Li_2^(5)(ε) = (26/25)Li_2(ε)`; `L_5 ≡ −B_(1,χ₋₁₅) = 2 mod 5` | unit, twist required | source issue |
| L3.29, L3.30, L3.37 | `k = 3`, `m = 2`; substitution of L3.15 | `Li_3(−1) = −¾Li_3(1)`; `Li_n = (−1)^n reg/(n−1)!` | true | none |
| L3.36 (headline) and Conventions sign | `N = 4`, `n = 3`; `N = 2` | `[−1]_3 = 4([i]_3+[−i]_3) = 8[i]_3`; `−2P_3(−1) = (3/2)ζ(3)` | matches BBdJR Prop. 4.17 p. 22; not statable, named | none |
| L3.Fd.1, L3.Fd.2(a) supplier | AnalyticNumberTheoryPartI §2.18a on main | four bullets: `P_v`, induction, one-dimensional comparison, Brauer continuation | cited section states them | none |

- Source locators checked against the text: 68, in BBK (6), BT (1), F (14), BF (2), RJW (9), BBdJR (13), BDJ-preprint (5), BDJ version of record (15, printed page = PDF page + 866), BHYY (1), GSWZ (2). All correct.
- Library declarations opened at the pins: 55. Tau Ceti: the eleven of the L0.1–L0.5 lines, `PowerSeries.OnOpenDisc`, `evalAt`, `OnOpenDisc.evalAtHom`, the Brauer, nilpotent, monomial and transitivity declarations, `teichmuller`, `teichmullerLift`, `laurentEval`, `hasSum_log_of_mem_unitFiltration_one`, `valuation_log`, the two Riemann–Roch and Serre-duality declarations, the two logarithm lemmas. Mathlib: 28 names of the *Needs* lines of L0.10, L2.Fa, L2.Fb, L2.71, L3.9–L3.13.
- Cross-roadmap citations: every supplier roadmap named is on main (GlobalNumberFields under Completed); AnalyticNumberTheoryPartI §2.18a read in full; the consumers PadicHodgeRegulators, PeriodsAndSpecialValues, HabiroNahmSeries and ColemanIntegrationPartII cite ids of this roadmap that all exist at this head (L0.18, L0.A1–L0.A2, L0.11–L0.12, L0.20–L0.23, L1.12, L2.18, L2.Fb, L3.Fb.2).
- Record of the roadmap on main: the README at the merge base has 4 layers; none is removed or retitled; the only headings that change are the two pin headings; `Suggested.lean` is unchanged; nothing outside the folder changes.
- Automatic checks: every check passed. Dependency check output: `depcheck: 172 roadmaps, 2010 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ColemanIntegration/Suggested.lean` gives five `declaration uses sorry` warnings (lines 52, 68, 76, 97, 118) and nothing else. The nine elaborated types were compared with the README; `IsLaurentOn` and `laurentSeriesEval` keep only the instance binders their bodies use. One-tactic probe on a copy (`simp`, `rfl`, `infer_instance`, `aesop`, `exact?`, each required to close the goal): none of the five theorems closes. No `set_option`, no `lemma`, no sorried data.
- Headline theorems: Frobenius characterisation of integration (L1.20), uniqueness principle (L1.18), five-term relation (L2.69–L2.70), Coleman's formula (L3.28–L3.30), complex formula (L3.13), cyclotomic regulator (L3.15), Dirichlet-motive Beilinson statement (L3.36). Only L3.13 is statable at the pins and it is stated; the module docstring names each of the others with the missing carrier.
- Description against the head: its claims on the pins, RestrictedPowerSeries, the Artin supplier, the formal primitive, the logarithm, induction, namespaces, the two locators and "Only `TauCetiRoadmap/ColemanIntegration/README.md` changes" were each checked and hold.

Overlap check: read PadicHodgeRegulators, PeriodsAndSpecialValues, ZagierConjecturePolylogarithms, HabiroNahmSeries (open), ColemanIntegrationPartII, PolylogarithmFunctions and PadicDifferentialEquationsAndRigidCohomology (main); the first, second, fourth and fifth consume ids owned here, the last two supply to it, the third does not mention it; nothing shared. The open DirichletPadicLFunctions revision was not read: its head is not among the checkouts given, and the roadmap is cited as it is on main.

Source independence: 68 locators and 6 further passages (L1.6, L1.10 and L1.11 against BBK §3.3; L1.20 against BT §5; L2.4 against F Prop. 2.11; L3.15 against the BDJ proof of Theorem 1.12) compared with 10 sources, none shared beyond formulas and hypothesis lists; largest share RJW, 107 of about 535 locators, level with BDJ in its two versions (95 and 12), then BBdJR 77 and F 66; contents compared with RJW §§1–13 and BDJ §§1–7: independent. BDJ §§3–6 run in the order of L3.Fa, L3.Fb.1–2, L3.Fb.3–4, L3.Fb.5, an order the *Needs* lines force (K-groups before regulators before the integration functional before its value on symbols); these are sub-blocks of one layer that also holds L3.Fc, L3.Fd and the measure-theoretic half, and L0–L2 have no counterpart in either text.

Research link: L3.28 is Coleman's 1982 formula for Kubota–Leopoldt values at positive integers (RJW Thm. 6.7; BHYY Thm. 1.1). L3.15 is Besser–de Jeu 2003, Thm. 1.12; L3.36 is Besser–Buckingham–de Jeu–Roblot 2009, Prop. 4.17. L1 underlies Chabauty–Coleman (Balakrishnan–Bradshaw–Kedlaya 2010). Rests on the README and these sources as read.

## Not verifiable

- BH and MP (author copies on their authors' pages), W, FPZ, DJ, Lazard, Kedlaya, Serre, Weibel, Quillen, Feliu, BC and the Stacks tag: not opened this round, so their locators were not checked here (the previous round checked DJ p. 6).
- RJW page numbers marked "published" (Essential Number Theory 4, 2025): the version of record was not opened; the arXiv numbering was checked.
- Statements not recomputed this round, read only where a sampled target depends on them: L1.21–L1.44, L2.12–L2.17, L2.19–L2.68, L3.Fa.1–L3.Fc.3, L3.Fd.2(b)–(d), L3.1–L3.8, L3.17–L3.27, L3.32–L3.35.

## Source issues

- **Error** in RJW at Theorem 6.7(ii), p. 39 (arXiv v2): the source gives the left side as the p-adic L-value of `θ` itself at `k`; it should be that of `θω^(1−k)`, since for `p = 5`, `θ = χ₋₃`, `k = 2` the right side is a 5-adic unit while the untwisted value vanishes by parity; affects a stated result.

## For the human reviewers

- **Licence.** BH (lecture notes, 35 locators) and MP (4 locators) are cited from copies on their authors' pages (README References); neither was fetched this round, so their host class was not confirmed here.
