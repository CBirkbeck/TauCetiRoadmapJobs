# Review of GenerativeAdversarialObjectives (pull request #3004 at c32c5c8)

**Verdict:** accepted

**Summary.** Accepted: this head repairs the three findings of the previous review (the false bound of 3.1 is gone and cited from its owner, 3.3 now assumes a separable space, and the bound has one owner), and a full recomputation of every statement, Check and route of Layers 1–3 found nothing false. There is one small correction and two format notes, none blocking; the pull-request number in the scope section, noted last time, is still there. The Polyanskiy–Wu locators could again not be read from a legal copy, which is left to the human reviewers.

## C01 — The Conventions say that 2.2 assumes `f(0) = f(0+)`, but only its supremum statement does

In the f-divergence paragraph of the Conventions (line 75) the sentence "here `f(0)` is a real number, and 2.2 assumes `f(0) = f(0+)`" reads as a standing hypothesis of the whole section. The first item of 2.2 (the weak inequality and its equality case) is stated, and is true, without it: `integral_sub_integral_le_internalEnergy` has only `ConvexOn ℝ (Ici 0) f`, and its route uses Fenchel–Young pointwise and `y ≤ f'(∞)` on `dom f*`, neither of which needs continuity at `0`. Only `internalEnergy_eq_iSup` carries `ContinuousWithinAt f (Ici 0) 0`, and the third Check of 2.2 shows it is needed there. Would you write "and the supremum formula of 2.2 assumes `f(0) = f(0+)`".

## N01 — A pull-request number is still in the README

The scope section (lines 614–615) cites StatisticalLearningTheory as "pull request #2515" with a link. Cite the roadmap by name and section only, as the same paragraph already does for its 1.3 and as the KernelsAndSpectralMethods entry does; the number dates the text.

## N02 — Generators with `f(0+) = +∞` are outside Layer 2, and the Conventions could say what that excludes

Because `f : ℝ → ℝ` and `f(0)` is real, generators such as `−log x` (reverse relative entropy) are not instances of `internalEnergy_eq_iSup`; with Lean's `log 0 = 0` that `f` is not continuous at `0`. One clause in the Conventions would help a reader: for instance that `D_(−log)(P ‖ Q)` is reached as the relative-entropy row with the two laws exchanged, and that generators infinite at `0` are otherwise not covered.

## Verified sound

Earlier findings, against this head:

- R01 (false bound `W₁ ≤ R · δ` "with any σ-algebra"): repaired. The target and its Lean declaration are gone; 3.1 now reads "that bound is stated in KernelsAndSpectralMethods 9.2 (`dudleyDist_le`) and is not restated here", and the counterexample is the first Check of 3.1.
- R02 (3.3 without separability): repaired. 3.3 reads "let `X` be separable with every distance at most `R`"; the Lean section has `[SecondCountableTopology X]` and the elaborated type of `hasFDerivAt_wassersteinEDist_one_map` carries it.
- R03 (two owners of the bound): repaired by citation; KernelsAndSpectralMethods 9.2 at its open head states `W₁ ≤ D * tvDist / 2` under `[SecondCountableTopology X]` (its `Suggested.lean`, lines 629–634), which is `W₁ ≤ D · δ`.
- C01 (description repeats R01): repaired; the description no longer claims the bound. C02 (`parallelLine_divergences`): repaired; README 3.1 and the docstring say "a sanity check … not a headline". N01: not repaired (N01 above).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `jsDiv` | `P=(½,½,0)`, `Q=(0,½,½)`; `P=Q`; Diracs | `JSD=0.3465736=½ log 2`; `0`; `log 2`; definitions identical to MathematicalStatisticsNonparametric lines 392–397 | holds | none |
| 1.1 open-interval Check | `D=0`, `P=Q` | `ofReal(−log 0)+ofReal(−log 1)=0 < log 4` | holds | none |
| 1.2 (a) `ganLoss_add_two_mul_jsDiv` | 2000 random laws on 2–4 points with zero masses, random `D∈(0.01,0.99)`; three-point pair, `D=½` | both sides agree to `1e-9`; `2 log 2 + log 2 = log 4 + log 2` | holds; Lean junk at `a∈{0,1}` gives `−log(1−b)`, `−log b` | none |
| 1.2 (b) equality case | `binKL(1,½)=binKL(0,½)=0.6931472` | integral `0` iff `binKL=0` a.e.; `log 4` finite in `[0,∞]` | holds both ways | none |
| 1.2 (c) value | `P=Q`; `P⟂Q`; clamp `D_ε` | inf `log 4` at `D=½`; inf `0`; gap `≤ −2 log(1−ε)` over mass `2` | holds | none |
| 1.2 (d) attainment | three-point pair (`D*(a)=1`); mutually a.c. laws | no discriminator equals `D*` a.e.; `{D*∈{0,1}}` null, redefine as `½` | holds both ways | none |
| 1.3 `jsDiv_mem_bounds` | random laws as above; `Ber(⅔),Ber(⅓)`; `Ber(1),Ber(⅔)`; `Ber(1),Ber(½)` | lower/JSD/upper `0.05663/0.05663/0.23105`; `0.05663/0.13230/0.23105`; `0.13081/0.21576/0.34657` | holds | none |
| 1.3 Check constants | `Ber(1),Ber(⅔)` | `6·excess=0.4540267=log(19683/12500)`; `6·deficit=0.5924696=log(3125/1728)` | holds | none |
| 1.3 attainment of both bounds | `δ∈{0,0.3,1}` | upper `0.2079442=0.3 log 2`; lower `0.0457005=log 2−h(0.35)`; `0`, `log 2` at ends | holds | none |
| 1.3 `jsDiv_eq_log_two_iff`, convergence | `P⟂Q`; `δ<1`; bottom filter | lower bound `log 2−h(0)=log 2`; upper bound `<log 2`; both sides true | holds | none |
| 1.3 route | `ψ(t)=t log(2t/(1+t))`; Hahn set | `ψ''=1/(t(1+t)²)`; `tvDist = ν s − μ s + (μ sᶜ − ν sᶜ)`, each half `δ` | holds | none |
| 2.1 `nonnegConjugate` | KL, TV, GAN, `(x−1)²` generators | `e^y−1`; `max(y,−½)` for `y≤½`; `−log(1−e^t)`, `t<0`; `y+y²/4` for `y≥−2`, else `−1` | holds; `x<0` term is `⊥` | none |
| 2.1 GAN divergence | random laws incl. singular parts | `D_f = 2 JSD − log 4` to `1e-9` (`f(0)=0`, `f'(∞)=0`) | holds | none |
| 2.2 `integral_sub_integral_le_internalEnergy` | TV generator, Diracs, `g(b)=−½`, `g(a)=0` | `½ < 1 = D_f`; Fenchel–Young at `b`: `½−½=0` | holds; `P≪Q` needed for the iff | C01 |
| 2.2 `internalEnergy_eq_iSup` | `f(0)=1` variant; `f=−(x−1)²`; `f'(∞)=+∞` with `P_⊥≠0` | `3/2` against sup `1`; `0` against `⊥`; `max y_k→∞` | holds; both hypotheses needed | N02 |
| 3.1 `parallelLine_divergences` | `θ≠0`; `θ=0` | `W₁=|θ|` (shift; critic `−sign(θ)x₁`); `tvDist=1+1=2`; `JSD=log 2`; `KL=∞` | holds | none |
| 3.1 measurability Check | `[0,1]`, trivial σ-algebra | distance not a.e. constant, `eLpNorm=∞`, `W₁(P,P)=∞` | holds | none |
| 3.2 `continuous_wassersteinEDist_one_map` | `g z θ=θ/z`, `Pr=δ_0`, unbounded `X` | `W₁=|θ|·∫dz/z=∞` for `θ≠0`, `0` at `0` | bound needed; statement holds | none |
| 3.2 `lipschitzOnWith_wassersteinEDist_one_map` | parallel lines, `L=1`; `dim E=0`; `U=∅` | `|θ|` is `1`-Lipschitz, not differentiable at `0` only; trivial; vacuous | holds | none |
| 3.3 `hasFDerivAt_wassersteinEDist_one_map` | `[−1,1]`, `Pr=δ_0`, clamp, `θ₀=⅓`, `f=−x`; `f=x`; `θ₀=0` | `0+⅓=⅓`, formula `1`; `−⅓≠⅓`; `|θ|` not differentiable | holds; hypotheses needed | none |
| 3.3 existence remark | bound `R/2` in the truncated-distance lemma | cost `min(d, 2·R/2)=d`; `ofReal(x)=W₁>0` gives `x=W₁` | holds | none |
| 3.4 `gradient_eq_of_isOptimalCoupling` | `δ_1,δ_0`, `f=min(t,1)`; parallel lines | derivative `1` on `(0,1)`, `0` beyond; gradient `(−sign θ,0)` = unit vector `y→x` | holds | none |
| 3.4 `norm_gradient_eq_one` | `P=Q`, `f=0` | gradient `0`, coupling on the diagonal | diagonal hypothesis needed; holds | none |

- Source locators checked against the text: 19 (Goodfellow2014 lines 208–251; ACB2017 lines 109–116, 136–139, 154–171, 190–198, 220–234, 265–273, 710–749, 909–910, 913–934; Gulrajani2017 lines 111–121, 156–161, 561–577; Nowozin2016 lines 104–106, 126–133, 148–158, 186, 540–543; NWJ2008 lines 153–158).
- Library declarations at the pins: all 59 cited names resolve with `#check` (33 Mathlib, 26 Tau Ceti); definitions read: `tvDist` (`TotalVariation/Defs.lean:62`), `wassersteinEDist` (`Wasserstein/Basic.lean:189`), `internalEnergy` (`InternalEnergy/Basic.lean:107`), `recessionConstant` (`RecessionConstant.lean:53`), `fenchelConjugate` (`Conjugate.lean:119`), `IsOptimalCoupling`, `HasFiniteMoment` (`Basic.lean:445`); all 29 cited file paths exist.
- Cross-roadmap citations resolved: MathematicalStatisticsNonparametric 2.4 and 1.4 and OptimalTransport 3.1, 3.4, 3.8, 5.1, 9.5, Layer 1 on main; KernelsAndSpectralMethods 9.2 and StatisticalLearningTheory 1.3 at their open heads.
- Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; no change outside the folder.
- Elaboration of `Suggested.lean`: 15 `sorry` warnings, nothing else; the elaborated types of the four Layer 3 theorems compared with the README, no lost binder (`PolishSpace` in 3.2, `SecondCountableTopology` in 3.3 present).
- One-tactic probe (`rfl`, `simp`, `simp` with the definitions unfolded) on all 15 theorems: none closes.
- Duplication: no Jensen–Shannon divergence, no f-divergence variational formula and no parameter-regularity statement for `W₁` in the pinned Mathlib or Tau Ceti; the automatic checks all passed on this head.
- Overlap check: read DifferentialEntropyAndEntropyPower, LogConcaveFunctionalInequalities, SteinsMethodForNormalApproximation, PACBayesBounds, RenyiDivergenceAndPrivacy, OptimalTransport, MathematicalStatisticsNonparametric, CompactQuantumMetricSpaces, and also KernelsAndSpectralMethods, StatisticalLearningTheory, ScoreMatchingAndContrastiveEstimation; nothing shared: `W₁ ≤ D · tvDist / 2` is owned by KernelsAndSpectralMethods 9.2 (cited), the uniform mixture by MathematicalStatisticsNonparametric 2.4 (cited, copied), internal energy and conjugate by OptimalTransport 9.5 and 5.1 (cited); ScoreMatchingAndContrastiveEstimation leaves the optimal discriminator to this roadmap.

Source independence: 12 passages compared with 5 sources, none shared (two quoted phrases of four words each); largest share PolyanskiyWu2025, 6 of 16 source citations in the layers, whose text and contents could not be read; contents compared with ACB2017 (5 of 16): independent (its order is Example 1, Theorem 1, Theorem 2, Theorem 3; here 3.1 joins Example 1 with Theorem 2 (4), 1.3 takes Theorem 2 (1), and Layers 1–2 and 3.4 come from other sources).

Research link: Layer 1 is Proposition 1 and Theorem 1 of Goodfellow et al. (2014); Layer 2 the variational representation of Nguyen–Wainwright–Jordan (2008) used by Nowozin–Cseke–Tomioka (2016); Layer 3 Theorems 1–3 of Arjovsky–Chintala–Bottou (2017) and Proposition 1 of Gulrajani et al. (2017). Rests on the README's sources, read at their locators.

## Not verifiable

- Polyanskiy–Wu, Definition 7.1 and (7.2), pp. 115–116; (7.8), p. 117; (7.39), p. 133; Theorem 7.26 (a), p. 148; Examples 7.3–7.5, pp. 149–150; (7.104) and (7.106), pp. 155–156: no legal copy could be read (the draft's address names no author of the book, and the publisher's page is not open). The statements of 1.3, 2.1 and 2.2 that cite them were verified by computation and by rereading the routes, not against the source.
- The misprint the README reports in Polyanskiy–Wu Example 7.5 (`log 2` for `log 4`): same reason. The mathematics of the Check is right: at `P = Q` the supremum is `−log 4`.
- Ownership against open pull requests was checked with the search over the open heads and by reading the eleven roadmaps named above, not by reading every open roadmap.

## Source issues

- **Gap** in Gulrajani2017 at Corollary 1, §2.3, p. 3: the source says the optimal critic has gradient norm 1 almost everywhere under both laws, with no hypothesis; it should assume that the optimal coupling does not charge the diagonal, as in its Proposition 1; affects a stated result.
- **Error** in ACB2017 at Example 1, p. 4: the source says the Jensen–Shannon divergence of the two parallel lines is `log 2` for `θ ≠ 0`; it should be `2 log 2` with the definition of its §2, p. 4, which has no factor ½; affects a stated result.
- **Gap** in ACB2017 at the proof of Theorem 1 (2), Appendix C, p. 20: the source takes the expectation over `z` of a Lipschitz bound valid on a neighbourhood of one pair `(θ, z)`; it should use a neighbourhood of `θ` that does not depend on `z`, with an integrable constant; affects the proof.
- **Error** in Nowozin2016 at the caption of Table 1, p. 3: the source says every generator in the table vanishes at 1; it should except the GAN row, whose generator takes the value `−log 4` there; affects nothing; corrected in print at Appendix B, p. 11.

## For the human reviewers

- **Not tested.** PolyanskiyWu2025 has the largest share of the locators (6 of 16 in the layers; source of 1.3, 2.1, 2.2) and could not be read from a legal copy: wording and arrangement were not compared with it.
- **Licence.** The README cites Polyanskiy–Wu from "the authors' draft of August 16, 2024 from the first author's MIT page" (References); the sources service could not confirm that page as an author's own.
- **Scope.** The readable sources are arXiv versions of machine-learning papers (Goodfellow2014, Nowozin2016, ACB2017, Gulrajani2017, NWJ2008); the README states that 1.2 (a), (b), (d), the proofs of 1.3 and 2.2 and the generalisations of 3.2–3.4 are its own (README lines 134–137, 194–196, 292–297, 415–422, 520–525).
- **Scope.** The subject is the theory of machine-learning objectives (`topic = "math.ST"` in `TauCetiRoadmap/GenerativeAdversarialObjectives/metadata.toml`); whether it belongs to the project's research mathematics is yours to decide.
