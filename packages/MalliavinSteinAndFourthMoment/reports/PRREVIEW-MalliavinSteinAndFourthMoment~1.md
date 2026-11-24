# Review of MalliavinSteinAndFourthMoment (pull request #3054 at 18c71fc)

**Verdict:** needs changes

**Summary.** Changes are needed on one point: the route of the quadratic-variation rate (§6.2) rests on Young's convolution inequality with exponents (4/3, 4/3; 2), which the README says is formalized in Tau Ceti, and the pinned Tau Ceti does not contain it (nor the three Gaussian results named in the same sentence). Every stated theorem, formula and numeric Check that I recomputed is correct, and `Suggested.lean` elaborates with `sorry` as its only warning. There are four small corrections (three proof routes that quote an input outside its stated hypotheses, one supplier section missing from the contracts) and three format notes, none blocking. The page locators into the four monographs could not be checked, because none of them can be read legally here; that is left to the human reviewers.

## R01 (P2) — The Scope section says that Young's convolution inequality and three Gaussian results are formalized in Tau Ceti; none of them is in the pinned Tau Ceti, and the route of §6.2 needs the first.

An implementer of §6.2 arrives at `‖ρₙ ∗ ρₙ‖_{ℓ²(ℤ)} ≤ ‖ρₙ‖²_{ℓ^{4/3}}`, follows the *Needs:* line ("Young's inequality for convolution (see Scope)") to the last bullet of "Not owned here" (lines 741–746), and is sent to `TauCeti/Analysis/Convolution/Young.lean`, which does not exist at the pin. The step then has no owner: it is neither a target here, nor a supplier section, nor a pinned declaration.

At the pinned Tau Ceti, `TauCeti/Analysis/Convolution/` holds `Basic.lean`, `Jensen.lean` and `Positivity.lean` only; `TauCeti/Probability/Distributions/Gaussian/` has no `Poincare.lean`; no file of the pinned Tau Ceti or Mathlib mentions Mehler, and none under `Probability/` states a Gaussian Poincaré inequality or Gaussian integration by parts. The only Young inequalities for convolution at the pin are the L¹-kernel forms `‖k ⋆ f‖_p ≤ ‖k‖₁ ‖f‖_p` (`TauCeti.norm_convolutionLp_le`, `TauCeti/MeasureTheory/Function/Lp/Convolution.lean` line 117, and `MeasureTheory.Lp.norm_convolutionL_apply_le`, `TauCeti/MeasureTheory/Function/Lp/GroupConvolution.lean` line 153), which do not give the exponents (4/3, 4/3; 2). The pull request's description itself says "Tau Ceti after the pin has …", so the README sentence describes a later library than the one the README declares it is written against.

Smallest change: add to §6.2 one target in prose, for instance "for a, b on ℤ, `‖a ∗ b‖_{ℓ²} ≤ ‖a‖_{ℓ^{4/3}} ‖b‖_{ℓ^{4/3}}`" (or Young's inequality on ℤ in general), with a locator, and name it in the *Needs:* line; and reword the Scope bullet so that it says only what the pin has (the L¹-kernel form above), without the two file paths. The three Gaussian items are used by no route here (§7.2 takes its Poincaré inequality from WienerChaosAndMalliavinCalculus §4.4), so for them only the sentence needs correcting.

## C01 — The route of §4.2 quotes §2.1 for φ(x) = x³, whose derivative is unbounded.

"E F⁴ = E[F · F³] = (3/q) E[F² ‖DF‖²] by §2.1" (line 406): §2.1 is stated for φ of class C¹ with bounded derivative, and the chain rule it rests on (WienerChaosAndMalliavinCalculus §4.3) has the same hypothesis. The identity (5.2.5) is true (I checked it on He₂, He₃ and W(e₁)W(e₂): 48, 3240 and 6 on both sides), but the step needs F³ ∈ 𝔻^{1,2} with D(F³) = 3F² DF on a chaos, and then the form E[(F − E F)Φ] = E⟪DΦ, −DL⁻¹F⟫ for Φ ∈ 𝔻^{1,2} that the route of §2.1 already records. Say so: the product rule is a prose target of WienerChaosAndMalliavinCalculus §4.3, and its integrability hypotheses hold on a chaos by its §6.4 and by (5.2.2); add those two sections to the *Needs:* line. Alternatively derive (5.2.5) from (5.2.3) and the product formula alone.

## C02 — §2.3 cites MathematicalStatisticsFoundations §4.4 for Stein's identity under N(0, C), and that section states it for N(θ, vI) only.

The smart path differentiates along √t N with N ~ N(0, C) for an arbitrary positive semidefinite C, and needs E[Nᵢ ψ(N)] = ∑ⱼ C(i, j) E[∂ⱼψ(N)]. The supplier's statement on main, and this README's own contract for it (line 795), is the isotropic case with v > 0. The general case follows in one line by writing N = C^{1/2} Z and applying the supplier to z ↦ ψ(C^{1/2} z) (the pinned Tau Ceti has `multivariateGaussian_zero_eq_map_stdGaussian_sqrt`, `TauCeti/Probability/Distributions/Gaussian/Multivariate.lean` line 91). Add that sentence to the route of §2.3, so that the citation matches what the supplier provides.

## C03 — The routes of §5.2 and §5.3 invoke §4.4 for components whose limiting variance may be 0, which §4.4 excludes.

§4.4 assumes σ² > 0 (in Lean, `hσ : σ2 ≠ 0`), while §5.2 allows C(i, i) = 0 and §5.3 allows σ_q = 0; the sentence "which tend to 0 by §4.4" (line 499) does not cover those components. They are harmless: `‖f ⊗ᵣ f‖ ≤ ‖f‖²` and q! ‖f_{i,n}‖² → 0. Either add that clause to the route of §5.2, or drop the hypothesis σ² > 0 from §4.4: at σ = 0 all six conditions hold (Fₙ → 0 in L², all moments tend to 0 by equivalence of moments, contractions are bounded by ‖fₙ‖²), so the equivalence is true without it.

## C04 — §7.1 consumes WienerChaosAndMalliavinCalculus §4.1, which the supplier contracts and the Scope section do not list.

The *Needs:* line of §7.1 (line 649) and the Dependencies of Layer 7 (line 687) name §4.1 of that roadmap (smooth cylinder functionals), but "Not owned here" (line 722) and "From other roadmaps" (lines 777–789) list §§1.1, 3.1, 3.3, 4.2–4.4, 5.1 and 6.1–6.4 only, and so does the pull request's description. Add §4.1 to both lists and to the description.

## N01 — Subscripts and superscripts in TeX form outside code spans.

About 150 lines write `𝔻^{1,2}`, `e^{−t²/2}`, `∑_{r=1}^{q−1}`, `⊗_{p−r}` and the like in running text. Put them in code spans or in Unicode (the supplier roadmap writes 𝔻¹,²).

## N02 — A roadmap is cited by a shortened name.

"HigherOrderAndResampling" (lines 51 and 730) is MathematicalStatisticsHigherOrderAndResampling.

## N03 — A subscript slip in a docstring.

The docstring of `hermiteCoeff` in `Suggested.lean` reads `∫ f Heₛ dγ`; the index is q.

## Questions for the author

- §3.2 says its induction on q is "a route different from the source's" (Nourdin–Peccati, Theorem 2.10.1). The open lecture notes of one of the two authors prove the same statement by exactly this induction, through the law of ⟪DF, h⟫ on the chaos of order q − 1 (Nourdin2012Lectures line 1639, Corollary 4.18). Is the book's proof really different? I could not open the book; if it is the same induction, the clause should go.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 integrated Stein equation | h = 1_[0,1], (x,y) = (−1,2); h = 1_(−∞,0.7], (0.3,0.9); sign flipped | f_h(2) − f_h(−1) = 0.3676449; 0.1323381 both sides; flipped right side 0.4157 | holds; control fails as claimed | none |
| 1.1 bounds, [0,1]-valued and half-line h | z = 0, 0.7, −2, 3 on a grid; non-measurable h at w = 4 | sup f_z = 0.6266571 = √(2π)/4; sup of derivative version 0.914 ≤ 1; jump 0.65314 / −0.34686; f_h(4) = 7471.9 | holds; agrees with Nourdin2012Lectures line 773 | none |
| 1.2 Stein classes and bounds | scaling f(x) = f_h̃(x/√v)/√v; v ≠ 1; clipped Gaussian (atoms 0.31731) | v f′ − x f = h − E h(N(0,v)); sup f = √(π/2)/√v, sup f′ = 2/v; tvDist 0.645082 ≤ 2.538484 | holds without density | none |
| 1.3 Gaussian comparison | (1,2), (1,1.1), (1,100), (0,v), (0,0) | 0.332128 ≤ 2; 0.046116 ≤ 0.363636; 1.596432 ≤ 3.96; 2 ≤ 4; 0 ≤ 0/0 = 0 | holds | none |
| 2.1 integration by parts, positivity, Mehler | chaos of order n; n = 0 term of L⁻¹; uncentred F | ∫₀^∞ e^{−t} e^{−(n−1)t} dt = 1/n; Lean 0⁻¹ = 0; D and L⁻¹ kill constants | holds; Nourdin2012Lectures line 1576 for m = 1 | none |
| 2.2 bounds for divergences and centred F | F = Z + 0.2 He₂(Z); clipped at 0.3 | tvDist 0.36172 ≤ 1.78863; Kolmogorov 0.08147 ≤ 0.44716; W₁ 0.19357 ≤ 0.38197; 1.528354 ≤ 6.113417 | holds; Nourdin2012Lectures line 1715 | none |
| 2.3 smart path | d = 1, C = 1, h = cos, a = 0.2; general C | 0.009275 ≤ 0.239365; general C needs N = C^{1/2} Z | holds; Nourdin2012Lectures line 2240 | C02 |
| 3.1 Bouleau–Hirsch | F = max(W(h), 0); full event | atom 1/2 at 0 on {DF = 0}; route gives 1_B(F) DF = 0 in the closed graph | holds | none |
| 3.2 densities on a chaos | q = 0, 1, 2; H = 0 | q = 0 Dirac (excluded); q = 1 Gaussian; E‖DF‖² = q E F² > 0 forces some ⟪DF, h⟫ ≠ 0 | holds | question |
| 4.1 contraction inequality | r = 0; r = p; non-symmetric f | r = 0: ‖f‖²‖g‖² both sides; free variables are last r of f, first r of f ⊗_{p−r} f: symmetry needed | holds as stated | none |
| 4.2 derivative norm, variance, cumulant, comparison | He₂; He₃; W(e₁)W(e₂); q = 0, 1 | Var 8, κ₄ 48, 8 ≤ 8 ≤ 8; 504 ≤ 720 ≤ 1008 (E He₃⁴ = 3348); Var 1, κ₄ 6; q = 0, 1 all terms 0 | holds; Nourdin2012Lectures lines 1739–1790 | C01 |
| 4.3 fourth-moment bounds, non-Gaussianity | centred χ²_m, m = 10, 200; f = 0; q = 1 | 0.23713 ≤ 1.78885, 0.05963 ≤ 0.44721; 0.05046 ≤ 0.4, 0.01330 ≤ 0.1; f = 0: 0 ≤ 0 | holds; Nourdin2012Lectures line 1940 | none |
| 4.4 fourth moment theorem | q = 0, 1, 2; σ = 0 | q = 0: Var‖DF‖² = 0 but E F⁴ = σ⁴ ≠ 3σ⁴; q = 1 all six hold; σ = 0 all six hold | holds for q ≥ 1; Nourdin2012Lectures line 1953, NualartPeccati2005 line 95 | C03 |
| 5.1 variance of ⟪DF, DG⟫ | p = 2, q = 3 (W(e₁)W(e₂), He₃); p = q = 1; p = 0 | ‖f ⊗̃₁ g‖² = 1/12, f ⊗₂ g = 0: 36 · 6/12 = 18 = Var(3W₂He₂(W₁)); empty sum; 0 = 0 | holds; range min(p, q−1) right for p < q and p = q | none |
| 5.2 Peccati–Tudor | alternating sign pair; C(i,i) = 0; d = 0, 1 | covariance ±1, no joint limit; zero-variance component converges trivially | holds; Nourdin2012Lectures line 2394 | C03 |
| 5.3 chaotic CLT | uniform-in-n tail against lim sup form | equivalent, tails decrease in N; q = 0 kernel forced 0 | holds; HuNualart2005 line 280 | none |
| 6.1 Hermite rank, Breuer–Major | \|x\| − √(2/π); x³; f = 0; q = 0 term of σ² | a₂ = 0.398942, rank 2; ∫x³He₁ = 3, rank 1; rank 0 makes hypothesis false; a₀ = 0 kills junk sum | holds; Nourdin2012Lectures line 89 | none |
| 6.2 quadratic rate | derivation from §§2.2, 4.2; Toeplitz traces | 2 · 2√8 = 8√2 after v_n² = E S²/n; 748.05 ≤ 1953.35; 111852.63 ≤ 403159.62 | holds; Young (4/3, 4/3; 2) unowned at the pin | R01 |
| 6.3 fractional Gaussian noise | H = 1/2; H = 1; asymptotics; q = 1, H < 1/2 | ρ_{1/2} = δ₀; ρ₁ ≡ 1; ratios −0.125, 0.12, 0.375; partial sum 0.001118; 2.16426, 2.25039, 6.63054 | holds | none |
| 7.1–7.2 Stein factor, second-order Poincaré | g = x + a(x² − 1), a = 0.2, 0.05; linear g; v = 0; weight e^{−2t} | 0.48293 ≤ 0.71678; 0.36172 ≤ 2.65476; 0.07586 ≤ 0.60582; W₁ 0.18805 ≤ 0.52955, 0.04830 ≤ 0.12084; constant 1 + 1/2 rederived | holds | none |
| Convention: tvDist in [0, 2] | Mathlib definition; Tau Ceti supremum formula | `tvDist` = `(etvDist μ ν).toReal`; `etvDist = 2 * ⨆ A, μ A − ν A` | constants 4/v, 6/v are the doubled ones | none |

- Source locators checked against the text: 0 of the locators into the four monographs (unreadable here); 12 passages of open texts read instead (Nourdin2012Lectures lines 89, 773, 1576, 1639, 1715, 1739, 1940–1953, 2240, 2394; NualartPeccati2005 line 95; HuNualart2005 line 280; NourdinPeccatiReinert2009 line 93).
- Library declarations opened at the pin: `MeasureTheory.tvDist` (`Mathlib/MeasureTheory/Measure/TotalVariation/Defs.lean` line 62), `MeasureTheory.etvDist_eq_two_mul_iSup_sub` (`TauCeti/MeasureTheory/Measure/TotalVariation.lean` line 74), `TauCeti.wassersteinEDist` (`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Basic.lean` line 189), the two L¹ Young inequalities of R01, `multivariateGaussian_zero_eq_map_stdGaussian_sqrt`; the 25 `#check` lines of `Suggested.lean` all resolve.
- Cross-roadmap citations resolved: WienerChaosAndMalliavinCalculus §§1.1, 3.1, 3.3, 4.1–4.4, 5.1, 6.1–6.4 and its Layer 1 check; SteinsMethodForNormalApproximation §§1.1, 3.1; MathematicalStatisticsFoundations §4.4; RandomMatrices §2.2; all exist with the cited content, except the generality noted in C02.
- The 25 copied definitions were compared token by token with the two suppliers' `Suggested.lean` at their heads: all identical.
- Elaboration: `lake env lean` on `TauCetiRoadmap/MalliavinSteinAndFourthMoment/Suggested.lean` exits 0 with 38 `sorry` warnings and nothing else. `#check @name` for all 70 declarations was elaborated on a copy and each type compared with the README: `[CompleteSpace H]`, `[SigmaFinite μ]` and `[IsProbabilityMeasure P]` are present wherever needed; nothing changed.
- One-tactic probe (`rfl`, `simp`, `infer_instance`) on all 38 theorems: none closes. The four statements that test a definition (`hermiteRank_hermite`, `hermiteRank_abs_sub`, `fgnCov_half`, `gaussianSteinFactor_inner`) are marked as sanity checks in their docstrings.
- Dependency check: `depcheck: 132 roadmaps, 1464 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Numeric Checks recomputed: all of Layers 1, 2, 4 and 7 and of Layer 6 except the three eigenvalue Checks, which were not recomputed.

Overlap check: read WienerChaosAndMalliavinCalculus, SteinsMethodForNormalApproximation, OrnsteinUhlenbeckSemigroup, MathematicalStatisticsHigherOrderAndResampling, YoungIntegrationAndRoughPaths, MathematicalStatisticsAsymptotic, DysonBrownianMotion, MathematicalStatisticsNonparametric; nothing shared. The Malliavin objects are owned by WienerChaosAndMalliavinCalculus and the Stein solution by SteinsMethodForNormalApproximation, both copied only to state headlines; the Kolmogorov distance stays with ArithmeticStatisticsPartVIII §5.14 and is not defined here; no other roadmap, open or on main, states a Stein bound in total variation, a fourth moment theorem, a Hermite rank or the covariance of fractional Gaussian noise.

Source independence: 9 passages compared with 5 open texts (Nourdin2012Lectures, NualartPeccati2005, HuNualart2005, NourdinPeccatiReinert2009, NourdinPeccati2009PTRF), none shared beyond formulas; largest share NourdinPeccati2012, about 62 of about 95 source mentions; its text and contents page could not be read, so wording and arrangement were not compared with it. By the README's own locators its Chapter 5 is split over Layers 2, 4 and 7 and its Chapter 6 over Layers 2 and 5, and Layer 3 comes from another source; the order Layer 1 → 2 → 4 → 5 → 6 is forced by the *Needs:* lines.

Research link: The headline targets are the fourth moment theorem of Nualart–Peccati (2005), its total-variation rates by Nourdin–Peccati (2009), the Peccati–Tudor theorem (2005), the Breuer–Major theorem (1983) and the second-order Poincaré inequalities of Chatterjee (2009) and Nourdin–Peccati–Reinert (2009); rests on the README's references and on NualartPeccati2005, NourdinPeccatiReinert2009 and Nourdin2012Lectures as read.

## Not verifiable

- NourdinPeccati2012 (Cambridge University Press): no legal copy; every theorem number, equation number and page into it is unchecked (all 15 sampled targets cite it).
- NualartNualart2018 (Cambridge University Press): no legal copy; Theorem 8.2.1, (8.12)–(8.16), Propositions 8.1.6–8.1.7, 8.3.2, Theorems 8.3.4–8.4.2 and their pages are unchecked.
- Nualart2006 (Springer): paywalled; Theorems 2.1.2–2.1.3 and Corollary 2.1.2, pp. 97–99, are unchecked.
- ChenGoldsteinShao2011 (Springer): paywalled; Lemmas 2.3–2.5, pp. 16–17, are unchecked.
- BreuerMajor1983 and PeccatiTudor2005: paywalled; cited without locators, statements checked against Nourdin2012Lectures instead.
- Whether Tau Ceti after the pin contains the four results of R01: only the pinned library was available.

Automatic checks set aside as false positives: the report of a section comment in `Suggested.lean` with no declaration under it; the comment heads the `#check` lines that pin library declarations, which is what such lines are for.

## Source issues

- none

## For the human reviewers

- **Not tested.** NourdinPeccati2012 carries about 62 of about 95 source mentions and could not be read (no legal copy); wording and arrangement were compared only with open texts by the same authors. NualartNualart2018, Nualart2006 and ChenGoldsteinShao2011 were not read either.
- **Licence.** Twenty-five definitions of `TauCetiRoadmap/MalliavinSteinAndFourthMoment/Suggested.lean` are identical to those in the `Suggested.lean` of WienerChaosAndMalliavinCalculus and SteinsMethodForNormalApproximation, two open roadmaps of this project; the docstrings say so.
- **Order of merging.** The roadmap consumes two roadmaps that are still open pull requests (WienerChaosAndMalliavinCalculus, SteinsMethodForNormalApproximation); the description says they merge first.
