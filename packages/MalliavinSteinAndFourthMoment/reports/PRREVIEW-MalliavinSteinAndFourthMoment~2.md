# Review of MalliavinSteinAndFourthMoment (pull request #3054 at 8d6453a)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired (Young's inequality with exponents (4/3, 4/3; 2) is now a prose target of §6.2 with a correct Hölder route, and the Scope sentence says only what the pinned Tau Ceti has), and so are its four small corrections, three format notes and its question. Every statement, formula and numeric Check that I recomputed is correct, and `Suggested.lean` elaborates with `sorry` as its only warning. There are two small corrections and two format notes, none blocking, and one question. The page and theorem locators into the four monographs could not be checked, since none can be read legally here; that is left to the human reviewers.

## C01 — The Hermite expansion in L²(γ) that the route of §6.1 starts from has no owner in the README, and the pinned Tau Ceti proves it.

The Conventions say "so that f = ∑_q a_q He_q in L²(γ)" (line 115), and the route of §6.1 uses it at once ("so the sum has kernels f_(n,q) = a_q n⁻¹ᐟ² ∑_(k<n) εₖ^(⊗q)", line 573), but the *Needs:* line of §6.1 and the supplier contracts name nothing for it, so an implementer cannot tell whether it is to be proved here. It is in the pinned Tau Ceti: `TauCeti.hasSum_gaussianHermite_expansion` (`TauCeti/Probability/Distributions/Gaussian/Hermite/Parseval.lean`, line 77) expands every element of `Lp 𝕜 2 (gaussianReal 0 1)` in `gaussianHermiteHilbertBasis`, whose n-th coordinate is the integral against He_n/√(n!); so a_q is that coordinate divided by √(q!). Add the declaration to the *Needs:* line of §6.1 and to "From Tau Ceti", with the clause on the normalization.

## C02 — The route of §5.2 says that §5.1 and §4.1 bound the variance by contractions of orders 1, …, q − 1, and for components of different orders one factor has order 0.

In "which §5.1 and the contraction inequality of §4.1 bound by contractions f_(i,n) ⊗ᵣ f_(i,n) and f_(j,n) ⊗ᵣ f_(j,n) of orders 1 ≤ r ≤ q − 1. These tend to 0" (lines 511–513) the letter q is not defined, and the claim is not what the two sections give. For p = qᵢ < q = qⱼ the sum of §5.1 runs to r = p, and §4.1 bounds that term by `‖f_i ⊗₀ f_i‖ ‖f_j ⊗_(q−p) f_j‖`, where `‖f_i ⊗₀ f_i‖ = ‖f_i‖²` is bounded and does not tend to 0. The argument survives: in every term the factor of the higher-order component has order q − r in {1, …, q − 1} (q − r ≥ q − p ≥ 1 when p < q, and both orders lie in {1, …, q − 1} when p = q), and the other factor is at most ‖f_i‖². Say so: "bound by products ‖f_i ⊗_(p−r) f_i‖ ‖f_j ⊗_(q−r) f_j‖ with p = qᵢ ≤ q = qⱼ, in which the second factor has order between 1 and q − 1 and the first is at most ‖f_i‖²".

## N01 — The opening calls the prose targets "headlines".

"the other headlines of this README are targets of the same standing, stated in prose" (line 63, and the module docstring of `Suggested.lean`): the theorems the summary names are all stated in Lean, and what stays in prose (the W₁ rate of §4.3, the varying-order form of §4.4, the identity of §4.1, Young's inequality on ℤ) are variants and auxiliary targets. "The other targets" would say this without suggesting that headline theorems are missing from the Lean file.

## N02 — The *Needs:* line of §6.2 does not list what its route quotes.

The route applies §2.2 and §4.2 directly; the line lists §§4.3 and 6.1. Either quote §4.3 in the route (at q = 2 its bound is 4√(κ₄/6) = 4√Var(‖DF‖²/2), the same number) or add §§2.2 and 4.2 to the line.

## Questions for the author

- §6.3 states positive semidefiniteness for 0 < H ≤ 1, and the route derives it from "the integral representation of |t|²ᴴ" in Nourdin–Peccati, proof of Proposition D.1.3. The usual representation, `|t|²ᴴ = c_H ∫ (1 − cos(tx)) |x|^(−1−2H) dx`, diverges logarithmically at x = 0 when H = 1 (the integrand is t²/(2|x|) there). Does the cited proof cover H = 1? I could not open the book. If it does not, one clause closes the case: at H = 1 the kernel is r₁(t, s) = ts.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 Stein solutions (integrated form, bounds) | h = 1_[0,1], (x,y) = (−1,2); sign flipped; z = 0, 0.7; non-measurable h | both sides 0.3676449; flipped 0.415713; f₀(0) = 0.626657; one-sided derivatives 0.65314, −0.34686; f_h(4) = 7471.9 | holds; controls fail as stated | none |
| 1.2 Stein classes, bounds without density | scaling f(x) = f_h̃(x/√v)/√v; averaging of half-line solutions at z, z − ε | v f′ − x f = h − E h(N(0,v)); sup f = √(π/2)/√v, sup f′ = 2/v; average is f of the piecewise-linear h | holds for every μ with first moment | none |
| 1.3 Two centred Gaussian laws | (1,2), (1,1.1), (1,100), (0,v), (0,0) | 0.33213 ≤ 2; 0.04612 ≤ 0.36364; 1.59643 ≤ 3.96; 2 ≤ 4; 0 ≤ 0/0 = 0 | holds | none |
| 2.1 Integration by parts, positivity, Mehler | chaos of order n; n = 0; uncentred F; G outside σ(W) | ∫₀^∞ e⁻ᵗ e^(−(n−1)t) dt = 1/n; Lean 0⁻¹ = 0 kills n = 0; hypothesis `G ∈ gaussianL2` present | holds | none |
| 2.2 Divergences and centred functionals | F = Z + 0.2 He₂(Z); clipped Gaussian at 1 and 0.3 | E\|v − T\| = 0.482931; tvDist 0.36172 ≤ 1.78863; Kolmogorov 0.08147 ≤ 0.44716; W₁ 0.19357 ≤ 0.38197; 0.64508 ≤ 2.5385; 1.52835 ≤ 6.1136 | holds | none |
| 2.3 Smart path | d = 1, C = 1, h = cos, a = 0.2; N = C^(1/2) Z | 0.009275 ≤ 0.239365; ∂ᵢ(ψ∘C^(1/2)) = ∑ⱼ C^(1/2)(j,i) ∂ⱼψ, giving ∑ⱼ C(i,j) E ∂ⱼψ | holds; previous C02 repaired | none |
| 3.1 Bouleau–Hirsch | F = max(W(h), 0); full event | atom of mass 1/2 at 0 lies on {DF = 0}; on {DF ≠ 0} = {W(h) > 0} the law is the half-Gaussian density | holds | none |
| 3.2 Densities on a chaos | q = 0, 1, 2 | q = 0 Dirac (excluded); q = 1 Gaussian; E‖DF‖² = q E F² > 0 gives ⟪DF, h⟫ ≠ 0 in chaos q − 1 | holds; route now credited to the source | none |
| 4.1 Contractions | r = 0; r = p = q | ‖f‖²‖g‖² on both sides (order-0 kernel on the one-point space); ⟪f,g⟫² ≤ ‖f‖²‖g‖² | holds | none |
| 4.2 Derivative norm, variance, fourth cumulant, comparison | He₂; He₃; W(e₁)W(e₂); q = 0, 1 | 2W² = 2 + 2 I₂(h⊗h); Var 8, κ₄ 48; He₃: κ₄ 3240 by both forms, 504 ≤ 720 ≤ 1008; 6 = 16(1/8 + 2/8); q ≤ 1: all 0 | holds; termwise r² ≤ (q−1) r ≤ (q−1) r² | none |
| 4.3 Bounds and non-Gaussianity | centred χ²_m, m = 10, 200; f = 0; q = 1 | bound 4√2/√m: 0.23713 ≤ 1.78885, 0.05046 ≤ 0.4; f = 0: 0 ≤ (4/0)·0 = 0; q = 1: κ₄ = 0 | holds | none |
| 4.4 Fourth moment theorem | q = 1; q = 0; σ² = 0 with fₙ = h/n | q = 1 all six hold by §1.3; q = 0: σ⁴ ≠ 3σ⁴; σ² = 0: E Fₙ⁴ = 3/n⁴ → 0 but tvDist(Fₙ, δ₀) = 2 | holds; hypothesis σ² > 0 needed, as the new Check says | none |
| 5.1 Variance of ⟪DF, DG⟫ | p = 2, q = 3; p = q = 1; p = 0 | ‖f ⊗̃₁ g‖² = 1/12, f ⊗₂ g = 0: 36·(6/12 + 4·0) = 18 = Var(3W₂He₂(W₁)); empty sum; 0 = 0 | holds | none |
| 5.2 Peccati–Tudor | alternating-sign pair; C(i,i) = 0; p < q, r = p | covariance ±1, no joint limit; ‖f ⊗ᵣ f‖ ≤ ‖f‖² → 0; factor f_i ⊗₀ f_i bounded, f_j ⊗_(q−p) f_j → 0 | holds; route wording | C02 |
| 5.3 Chaotic CLT | tails uniform in n against lim sup form; q = 0 kernel | Lean form is the sup-over-n form; `f n 0 = 0` forces centring; tsum is of a summable family | holds; stronger tail hypothesis than HuNualart2005 line 287 | none |
| 6.1 Hermite rank, Breuer–Major | \|x\| − √(2/π); x³; f = 0; q = 0 and q < d terms of σ² | a₂ = ½√(2/π) = 0.398942, rank 2; ∫x³He₁ = 3; rank 0 makes ∑\|ρ\|⁰ divergent; a₀ = 0 kills the junk tsum | holds; Nourdin2012Lectures line 89 | C01 |
| 6.2 Quadratic rate; Young (4/3, 4/3; 2) | derivation; Hölder (2, 4, 4); Toeplitz traces | 8√2 ‖f ⊗₁ f‖, ‖f ⊗₁ f‖ ≤ √n ‖ρₙ‖²/E S²; 1/2 + 1/4 + 1/4 = 1, sum over j: ‖u‖²‖v‖²; 748.05 ≤ 1953.35; 111852.63 ≤ 403159.62 | holds; previous R01 repaired | N02 |
| 6.3 Fractional Gaussian noise, Hermite variations | H = 1/2, 1; asymptotics; q = 1, H < 1/2; eigenvalues | δ₀; ρ₁ ≡ 1; ratios −0.125, 0.12, 0.375; partial sum 0.001118; 2.16426, 2.25039, 6.63054; eigenvalues 0.020799, 0.087672, −7.005346 | holds | question |
| 7.1 Stein factor, covariance representation | linear g; g = x + a(x² − 1); weight e⁻²ᵗ | ‖a‖²; ∫e⁻ᵗ(1 + 2a e⁻ᵗ x) dt = 1 + ax, so T = (1+2ax)(1+ax), E T = 1 + 2a²; 1/2 ≠ 1 | holds | none |
| 7.2 Second-order Poincaré | a = 0.2, 0.05; v = 0; constant | 0.482931 ≤ 0.716784; bounds 2.654756, 0.605818, 0.529547, 0.120843; ∫e⁻ᵗ + ∫e⁻²ᵗ = 3/2; √(2/π)·3/2 = 3/√(2π) | holds | none |
| Convention: `tvDist` in [0, 2] | Mathlib definition; Tau Ceti formula | `tvDist = (etvDist μ ν).toReal`; `etvDist = 2 * ⨆ A, μ A − ν A` for equal masses | constants 4/v, 6/v are the doubled ones | none |
| Convention: `multivariateGaussian 0 C` | C not positive semidefinite | Dirac mass (`multivariateGaussian_of_not_posSemidef`); in §5.2 C is a limit of covariance matrices, so positive semidefinite | no junk case reachable | none |

- Source locators checked against the text: none of the locators into the four monographs (unreadable here); 17 passages of open texts read instead (Nourdin2012Lectures lines 89, 293, 311, 393, 751, 1576, 1639–1650, 1715, 1739–1760, 1940, 1953–1965, 2240–2252, 2394–2410; NualartPeccati2005 line 95; HuNualart2005 line 280; NourdinPeccatiReinert2009 line 93; Chatterjee2009 line 314).
- Library declarations opened at the pin: `MeasureTheory.tvDist` (`Mathlib/MeasureTheory/Measure/TotalVariation/Defs.lean` line 62), `MeasureTheory.etvDist_eq_two_mul_iSup_sub` (`TauCeti/MeasureTheory/Measure/TotalVariation.lean` line 74), `TauCeti.wassersteinEDist` (`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Basic.lean` line 189), `TauCeti.Probability.multivariateGaussian_zero_eq_map_stdGaussian_sqrt` (`TauCeti/Probability/Distributions/Gaussian/Multivariate.lean` line 91), `ProbabilityTheory.multivariateGaussian` (`Mathlib/Probability/Distributions/Gaussian/Multivariate.lean` line 166), `TauCeti.norm_convolutionLp_le` and `MeasureTheory.Lp.norm_convolutionL_apply_le` (the L¹-kernel Young inequalities), `TauCeti.hasSum_gaussianHermite_expansion`; the 26 `#check` lines all resolve.
- Cross-roadmap citations resolved at the heads: WienerChaosAndMalliavinCalculus §§1.1, 3.1, 3.3, 4.1–4.4 (product rule and D I_q = q I_(q−1) as prose targets), 5.1, 6.1–6.4 and the Layer 1 check; SteinsMethodForNormalApproximation §§1.1, 3.1; MathematicalStatisticsFoundations §4.4 and RandomMatrices §2.2 on main; ArithmeticStatisticsPartVIII §5.14 and MathematicalStatisticsHigherOrderAndResampling §1.1 (not consumed). All exist with the cited content.
- The 25 copied definitions and the copied instance were compared with the two suppliers' `Suggested.lean` at their heads after normalizing whitespace: all identical; the namespaces differ, so no fully qualified name is shared.
- Elaboration: `lake env lean TauCetiRoadmap/MalliavinSteinAndFourthMoment/Suggested.lean` exits 0 with 38 `sorry` warnings and nothing else. `#check @name` for the 38 theorems was elaborated on a copy and each type compared with the README: `[CompleteSpace H]`, `[SigmaFinite μ]` and `[IsProbabilityMeasure P]` are present wherever needed; nothing changed.
- One-tactic probe (`rfl`, `simp`) on all 38 theorems on the same copy: none closes. The four statements that test a definition are marked as sanity checks in their docstrings.
- Dependency check: `depcheck: 129 roadmaps, 1436 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Previous review: R01 repaired (§6.2, "Target in prose: Young's inequality on ℤ with exponents (4/3, 4/3; 2)", and the last Scope bullet); C01 repaired (§4.2 route, product rule and §6.4); C02 repaired (§2.3, "write N = C^(1/2) Z"); C03 repaired (§5.2 route and the new Check for σ² > 0; the earlier suggestion that all six conditions hold at σ = 0 was wrong, as that Check shows); C04 repaired (§4.1 in Scope and contracts); N01 repaired in the README; N02, N03 repaired; the question on §3.2 answered in the text.

Overlap check: read WienerChaosAndMalliavinCalculus, SteinsMethodForNormalApproximation, OrnsteinUhlenbeckSemigroup, MathematicalStatisticsHigherOrderAndResampling, YoungIntegrationAndRoughPaths, MathematicalStatisticsAsymptotic, MathematicalStatisticsNonparametric, DysonBrownianMotion; nothing shared. The Malliavin objects are owned by WienerChaosAndMalliavinCalculus and the Stein solution by SteinsMethodForNormalApproximation, both copied only to state headlines; the Kolmogorov distance stays with ArithmeticStatisticsPartVIII §5.14 and is not defined here; a search of all open and merged roadmaps for the fourth moment theorem, Peccati–Tudor, Breuer–Major, Hermite rank, fractional Gaussian noise, second-order Poincaré inequalities and the symmetrized contraction finds them only here and in the consumer note of WienerChaosAndMalliavinCalculus.

Source independence: 17 passages compared with 5 open texts (Nourdin2012Lectures, NualartPeccati2005, HuNualart2005, NourdinPeccatiReinert2009, Chatterjee2009), none shared beyond formulas; largest share Nourdin–Peccati 2012, 59 of 91 locators; its text and contents page could not be read, so wording and arrangement were not compared with it. By the README's own locators its Chapter 5 is split over Layers 2, 4 and 7, its Chapter 6 over Layers 2 and 5, its Chapter 2 over Layers 2 and 3, and Layer 3 rests on another book; the order Layer 1 → 2 → 4 → 5 → 6 is forced by the *Needs:* lines of §§2.2, 4.3, 5.2 and 6.1.

Research link: The headline targets are the fourth moment theorem of Nualart–Peccati (2005), its total-variation rates by Nourdin–Peccati (2009), the Peccati–Tudor theorem (2005), the Breuer–Major theorem (1983) and the second-order Poincaré inequalities of Chatterjee (2009) and Nourdin–Peccati–Reinert (2009); rests on the README's references and on those open texts as read.

## Not verifiable

- Nourdin–Peccati 2012 (Cambridge University Press): no legal copy (the publisher's page is not an open source); every theorem number, equation number and page into it is unchecked, and all 15 sampled targets cite it.
- Nualart–Nualart 2018 (Cambridge University Press): no legal copy; Theorem 8.2.1, (8.12)–(8.16), Propositions 8.1.6–8.1.7 and 8.3.2, Theorems 8.3.4–8.4.2 and their pages are unchecked.
- Nualart2006 (Springer, paywalled): Theorems 2.1.2–2.1.3 and Corollary 2.1.2, pp. 97–99, are unchecked.
- ChenGoldsteinShao2011 (Springer, paywalled): Lemmas 2.3–2.5, pp. 16–17, are unchecked.
- BreuerMajor1983 and PeccatiTudor2005: paywalled; cited without locators, statements checked against Nourdin2012Lectures lines 89 and 2394 instead.
- The value 0.07586 of the Check of Layer 7 at a = 0.05 and the Kolmogorov values of the χ² Check were not recomputed in this round.

Automatic checks set aside as false positives: the report of a section comment in `Suggested.lean` with no declaration under it; the comment heads the `#check` lines that pin library declarations, which is what such lines are for.

## Source issues

- **Misprint** in Nourdin2012Lectures at Theorem 1.3, assertion (2), printed page 6: the source says the fourth moments converge "in law" to 3σ⁴; it should be plain convergence of real numbers; affects nothing.

## For the human reviewers

- **Not tested.** Nourdin–Peccati 2012 carries 59 of the README's 91 source locators and could not be read (no legal copy); wording and arrangement were compared only with open texts by the same authors. Nualart–Nualart 2018, Nualart2006 and ChenGoldsteinShao2011 were not read either.
- **Licence.** Twenty-five definitions of `TauCetiRoadmap/MalliavinSteinAndFourthMoment/Suggested.lean` are identical to those in the `Suggested.lean` of WienerChaosAndMalliavinCalculus and SteinsMethodForNormalApproximation, two open roadmaps of this project; the docstrings say so.
- **Order of merging.** The roadmap consumes two roadmaps that are still open pull requests (WienerChaosAndMalliavinCalculus, SteinsMethodForNormalApproximation); the description says they merge first.
