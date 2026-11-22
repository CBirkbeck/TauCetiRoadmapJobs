# Review of GenerativeAdversarialObjectives (pull request #3004 at 1eb0641)

**Verdict:** needs changes

**Summary.** Changes are needed: the bound `W₁ ≤ R · δ` of 3.1 is false as stated "with any σ-algebra" (a counterexample was elaborated at the pins), the gradient formula of 3.3 drops the separability its own route needs, and the 3.1 bound is also a target of the open roadmap KernelsAndSpectralMethods (9.2), so it has two owners. Layers 1 and 2, the rest of Layer 3 and every Check were recomputed and hold. There are two small corrections and one format note, none blocking. The Polyanskiy–Wu locators could not be read from a legal copy; that is left to the human reviewers.

## R01 (P1) — The bound `W₁(P, Q) ≤ R · δ(P, Q)` of 3.1 is false on a pseudometric space "with any σ-algebra"

An implementer cannot prove `wassersteinEDist_one_le_ofReal_mul_tvDist` as it stands in `TauCetiRoadmap/GenerativeAdversarialObjectives/Suggested.lean` (line 186): its negation holds at the pins.

Take `X = [0, 1]` with its usual metric (`R = 1`) and the trivial σ-algebra `{∅, X}`, and `P = Q` the one probability measure on it. Then `tvDist P Q = 0`, so the right side is `0`. The product σ-algebra on `X × X` is again trivial, so a function is almost everywhere strongly measurable for the single coupling only if it is constant; the distance is `0` at `(0, 0)` and `1` at `(0, 1)`. Mathlib's `MeasureTheory.eLpNorm` is `∞` for such a function (`Mathlib/MeasureTheory/Function/LpSeminorm/Defs.lean`, line 92: `if AEStronglyMeasurable f μ then … else ∞`), and `TauCeti.wassersteinEDist` is the infimum of that `eLpNorm` over couplings (`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Basic.lean`, line 189; its docstring, lines 183–188, says the same). So `W₁(P, P) = ∞ > 0`. I checked this in Lean: the statement `¬ ∀ X …, wassersteinEDist 1 P Q ≤ ENNReal.ofReal (R * (tvDist P Q / 2))`, with the binders of the roadmap's theorem, elaborates with a complete proof against the pinned Mathlib and Tau Ceti.

The false step is the sentence of the route (README line 380–382) "Only upper bounds on lower integrals enter … so the distance need not be measurable on `X × X`": `TauCeti.wassersteinEDist_le` (same file, line 203) bounds `W₁` by the `eLpNorm` of the coupling, not by its lower integral.

Smallest change: assume the distance is measurable on the product, either as `(hd : Measurable fun z : X × X ↦ edist z.1 z.2)`, the form the Tau Ceti lemmas take, or through `[SecondCountableTopology X] [OpensMeasurableSpace X]`. With it the route is correct as written (I rechecked the coupling: diagonal part of mass `1 − δ` and cost `0`, product part of mass `δ` and cost at most `R`). Replace "with any σ-algebra" in the Conventions (line 82) and in the first item of 3.1 (line 358), correct the route sentence, and add the instance above as a negative-control Check.

## R02 (P2) — The gradient formula of 3.3 assumes only a Borel σ-algebra on `X`, and its route uses `W₁(Pr, P_θ) ≤ R`, which that does not give

An implementer following the route of 3.3 is stuck at "`W₁(Pr, P_θ) ≤ R` is finite" (README line 477, and the *Needs* line: "`TauCeti.wassersteinEDist_le` (for `W₁ ≤ R`)"). As in R01, `wassersteinEDist_le` bounds `W₁` by an `eLpNorm`, which is `∞` unless the distance is almost everywhere strongly measurable for the product coupling. `hasFDerivAt_wassersteinEDist_one_map` (`Suggested.lean`, lines 243–261) has `[PseudoMetricSpace X] [MeasurableSpace X] [BorelSpace X]` and nothing else; on a non-separable `X` the Borel σ-algebra of `X × X` is larger than the product σ-algebra, so continuity of the distance does not give that measurability. The step matters: where `W₁(Pr, P_θ) = ∞` its `toReal` is `0`, and the function `φ` of the route is then not `≥ 0`, so the local-minimum argument fails.

Smallest change: add `[SecondCountableTopology X]` to 3.3 (prose "a bounded separable space" at line 449 and in the Conventions, line 83), which is what 3.2 already has through `PolishSpace`. If the statement is meant without separability, the route must say where the measurability of the distance for `Pr ⊗ P_θ` comes from.

## R03 (P2) — The bound of 3.1 is also a target of the open roadmap KernelsAndSpectralMethods, so it has two owners

KernelsAndSpectralMethods (open pull request #2516, a new roadmap by another author) states in its 9.2, `dudleyDist_le`: "on a separable space … if the diameter is at most `D`, `W₁ ≤ D · tvDist / 2`", by the same coupling (common part on the diagonal), and its `Suggested.lean` declares it (lines 629–634, with `[SecondCountableTopology X]`); its scope section lists "the comparison of MMD with coupling costs, `W₁` and total variation". This README's scope section owns "the comparison of `W₁` with total variation on bounded spaces" (line 563), and the pull request's description says the bound "is proved here". After the repair of R01 the two statements coincide. That README also notes that without separability `W₁` can be `∞` even for `μ = ν`, which is R01.

Smallest change: one owner. Either cite KernelsAndSpectralMethods 9.2 for the first item of 3.1 (in its *Needs* line and in the scope section), drop `wassersteinEDist_one_le_ofReal_mul_tvDist` from `Suggested.lean`, and name that roadmap as a dependency in the description (which now says "no open pull request is a dependency"); or keep the bound here and say in the scope section, in one clause, how it differs from 9.2. The parallel lines, 3.2–3.4 and Layers 1–2 are not affected.

## C01 — The description repeats the claim of R01

The description says: "the bound `W₁ ≤ R δ` (on any measurable space)". After R01 this reads "the bound `W₁ ≤ R δ` (on a bounded space whose distance is measurable on the product)", or the clause goes if the bound is cited (R03).

## C02 — `parallelLine_divergences` computes five values of one explicit family, so it is a worked example and not a headline

`parallelLine_divergences` (`Suggested.lean`, line 200) evaluates `W₁`, `JSD`, both relative entropies and `tvDist` on the family `parallelLine θ`; the opening overview does not list it among the headline theorems, and the Examples of Layer 3 use it as an example. If it is kept as a sanity check that the definitions of `jsDiv` and `wassersteinEDist 1` take the expected values, would you mark it as one in its docstring; otherwise it can stand in the README alone, as the Example it already is.

## N01 — A pull-request number in the README

The scope section (lines 596–597) cites StatisticalLearningTheory as "pull request #2515" with a link. Cite the roadmap by name and section only ("StatisticalLearningTheory, 'Beyond this roadmap'" and its 1.3); the number dates the text.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `jsDiv`, three-point Check | `P=(½,½,0)`, `Q=(0,½,½)`; `P=Q`; Diracs | `M=(¼,½,¼)`, `KL(P‖M)=½log 2`, `JSD=0.34657=½log 2`; `0`; `log 2` | holds | none |
| 1.1 open-interval Check | `D=0`, `P=Q` | `ofReal(−log 0)=0`, `ofReal(−log 1)=0`, loss `0 < log 4` | holds | none |
| 1.2 (a) gap identity | three-point pair, `D=½` | loss `2 log 2`, `2 JSD = log 2`, left `3 log 2`; right `log 4 + (½+0+½) log 2 = 3 log 2` | holds | none |
| 1.2 (a) pointwise | `a∈{0,1}`, `b=½`; `a=0,b=0.1` | `binKL(1,½)=binKL(0,½)=0.6931=log 2`; `binKL(0,0.1)=0.10536=−log 0.9` | holds, Lean junk at `a∈{0,1}` harmless | none |
| 1.2 (b), (d) | `D*∈{0,1}` on a positive set; `P≪Q≪P` | no discriminator equals `D*` a.e.; `{D*=1}` is `Q`-null hence `(P+Q)`-null | holds both directions | none |
| 1.2 (c) | `P=Q`; `P⟂Q`; clamp `D_ε` | inf `log 4` attained at `½`; inf `0`, not attained; gap `≤ −2log(1−ε)` | holds | none |
| 1.3 bounds | `Ber(⅔),Ber(⅓)`; `Ber(1),Ber(⅔)`; `Ber(1),Ber(½)` | lower/JSD/upper: `0.05663/0.05663/0.23105`; `0.05663/0.13230/0.23105`; `0.13081/0.21576/0.34657` | holds; equality only first | none |
| 1.3 Check constants | `Ber(1),Ber(⅔)` | `6·excess=0.45403=log(19683/12500)`; `6·deficit=0.59247=log(3125/1728)` | holds | none |
| 1.3 upper bound attained | `δδ_a+(1−δ)δ_c`, `δδ_b+(1−δ)δ_c` | `M=(δ/2,δ/2,1−δ)`, `KL(P‖M)=δ log 2` | holds | none |
| 1.3 `ψ''` in route | `ψ(t)=t log(2t/(1+t))` | `ψ''=1/t−1/(1+t)−1/(1+t)²=1/(t(1+t)²)` | holds | none |
| 2.1 conjugates | KL, TV, GAN, `(x−1)²` | `e^y−1`; `max(y,−½)` on `y≤½`; `−log(1−e^t)`, `t<0`; `y+y²/4` for `y≥−2`, else `−1` | hold | none |
| 2.1 GAN divergence | `P=(½,⅓,⅙)`, `Q=(⅙,⅓,½)` | `D_f=−1.2118783`, `2JSD−log4=−1.2118783` | holds | none |
| 2.2 supremum | `f(x)=x`; `f(x)=−x`; `f=x²`, `P⟂Q` | `D_f=1`, sup `1`; `−1`, `−1`; `+∞`, sup `≥ n` | holds | none |
| 2.2 continuity Check | `f(0)=1`, `|x−1|/2` else; Diracs | `D_f=1+½=3/2`, sup `½−(−½)=1` | holds | none |
| 2.2 convexity Check | `f=−(x−1)²`, `P=Q` | `f*≡⊤`, sup `⊥`; `D_f=0` (`∞·0=0` in the singular term) | holds | none |
| 2.2 equality clause, `P≪Q` Check | `|x−1|/2`, Diracs, `g(b)=−½,g(a)=0` | Fenchel–Young at `b`: `½−½=0=0·g`; value `½ < 1` | holds | none |
| 3.1 bound | `[0,1]`, trivial σ-algebra, `P=Q` | left `∞`, right `0`; negation proved in Lean | false | R01 |
| 3.1 parallel lines | `θ≠0`; `θ=0` | `W₁=|θ|` (shift, critic `−sign(θ)x₁`); `tvDist=2`, `JSD=log 2`, `KL=∞` | holds | C02 |
| 3.1 unbounded Check | `δ_0` vs `(1−1/n)δ_0+(1/n)δ_(n²)` | `δ=1/n`, `W₁=n²/n=n` | holds | none |
| 3.2 continuity, Lipschitz | `g z θ=θ/z` on `(0,1]`; parallel lines | `W₁=|θ|·E[1/Z]=∞`, `0` at `0`; `|θ|`, `L=1` | holds (Polish in scope) | none |
| 3.3 gradient | `[−1,1]`, `Pr=δ_0`, clamp, `θ₀=⅓`; `θ₀=0` | `f=−x`: `0+⅓=⅓`, formula `1`; `f=x`: `−⅓≠⅓`; `|θ|` not differentiable at `0` | Checks hold; hypothesis gap | R02 |
| 3.4 unit gradient | `δ_1,δ_0`, `f=min(t,1)`; `P=Q`, `f=0`; parallel lines | derivative `1` on `(0,1)`, `0` beyond; gradient `0`; `(−sign θ,0)` = unit vector `y→x` | holds | none |

- Source locators checked against the text: 14 (Goodfellow2014 lines 208–251; ACB2017 lines 109, 137, 154–171, 190–198, 220–234, 265–273, 710–749, 909–910, 913–934; Gulrajani2017 lines 111–121, 156–161, 562–575; Nowozin2016 lines 106, 127–133, 148–158, 186, 540–543; NWJ2008 lines 153–158).
- Library declarations opened at the pin: 54 cited names resolved (26 Tau Ceti, 28 Mathlib); 19 elaborated with `#check`; definitions read: `eLpNorm` (Defs.lean:92), `wassersteinEDist` (Basic.lean:189), `internalEnergy` (InternalEnergy/Basic.lean:107), `recessionConstant` (RecessionConstant.lean:53), `fenchelConjugate` (Conjugate.lean:119), `tvDist` (TotalVariation/Defs.lean:62), `IsOptimalCoupling` (Cost/Basic.lean:300).
- Cross-roadmap citations resolved: MathematicalStatisticsNonparametric 2.4 (`uniformMixture`, `mutualInfoUniform`, identical bodies and `variable` line, Suggested.lean lines 348, 392–397) and 1.4 (`one_sub_tvDist_eq_integral_min`, line 319), on main; OptimalTransport 3.1, 3.4, 3.8, 5.1, 9.5 and Layer 1, on main; StatisticalLearningTheory 1.3 at its open head.
- Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: 16 `sorry` warnings, nothing else. Every elaborated type compared with its README statement: 0 lost binders, no change.
- One-tactic probe (`simp`, `rfl`, `exact?`) on all 16 theorems: none closes.
- The automatic checks all passed on this head.
- Overlap check: read KernelsAndSpectralMethods, OptimalTransport, MathematicalStatisticsNonparametric, StatisticalLearningTheory, ScoreMatchingAndContrastiveEstimation, PACBayesBounds, LogConcaveFunctionalInequalities, RenyiDivergenceAndPrivacy, DifferentialEntropyAndEntropyPower, HypothesisTestingExponents, CompactQuantumMetricSpaces; shared: `W₁ ≤ diam · tvDist / 2`, stated by KernelsAndSpectralMethods 9.2 and by 3.1 here (R03); the uniform mixture and its mutual information, owner MathematicalStatisticsNonparametric 2.4 (cited, copied); internal energy and conjugate, owner OptimalTransport 9.5 and 5.1 (cited).

Source independence: 14 passages compared with 5 sources, none shared (two quoted phrases of at most five words); largest share ACB2017, 7 of 20 source citations in the layers (PolyanskiyWu2025 has 6 and was not read); contents compared with ACB2017: independent (its order is Example 1, Theorem 1, Theorem 2, Theorem 3; here 3.1 takes Theorem 2 (4) and Example 1, 3.2 Theorem 1, 3.3 Theorem 3, and Layers 1–2 and 3.4 come from other sources).

Research link: Layer 1 is Proposition 1 and Theorem 1 of Goodfellow et al. (2014); Layer 2 the variational representation of Nguyen–Wainwright–Jordan (2008) used by Nowozin–Cseke–Tomioka (2016); Layer 3 Theorems 1–3 of Arjovsky–Chintala–Bottou (2017) and Proposition 1 of Gulrajani et al. (2017). Rests on the README's sources, read at their locators.

## Not verifiable

- Polyanskiy–Wu, Definition 7.1 and (7.2), pp. 115–116; (7.8), p. 117; (7.39), p. 133; Theorem 7.26 (a), p. 148; Examples 7.3–7.5, pp. 149–150; (7.104) and (7.106), pp. 155–156: no legal copy could be read (the draft's address does not name an author, and the publisher's page is not open). The statements of 1.3, 2.1 and 2.2 that cite them were verified by computation, not against the source.
- The misprint the README reports in Polyanskiy–Wu Example 7.5 (`log 2` for `log 4`): same reason.
- Ownership against open pull requests was checked with the search over open heads, not by reading every open roadmap.

## Source issues

- **Gap** in Gulrajani2017 at Corollary 1, §2.3, p. 3: the source says the optimal critic has gradient norm 1 almost everywhere under both laws, with no hypothesis; it should be assumed that the optimal coupling does not charge the diagonal, as in its Proposition 1 (for equal laws the critic `0` is optimal); affects a stated result.
- **Error** in ACB2017 at Example 1, p. 4: the source says the Jensen–Shannon divergence of the two parallel lines is `log 2` for `θ ≠ 0`; it should be `2 log 2` with the definition of its §2, p. 4, which has no factor ½; affects a stated result.
- **Gap** in ACB2017 at the proof of Theorem 1 (2), Appendix C, p. 20: the source takes the expectation over `z` of a Lipschitz bound valid on a neighbourhood of one pair `(θ, z)`; it should use a neighbourhood of `θ` that does not depend on `z`, with an integrable constant; affects the proof.
- **Error** in Nowozin2016 at the caption of Table 1, p. 3: the source says every generator in the table vanishes at 1; it should except the GAN row, whose generator takes the value `−log 4` there; affects nothing; corrected in print at Appendix B, p. 11.

## For the human reviewers

- **Not tested.** PolyanskiyWu2025 (6 of 20 source citations in the layers, the source of 1.3, 2.1 and 2.2) could not be read from a legal copy: wording and arrangement were not compared with it.
- **Scope.** The sources other than Polyanskiy–Wu are cited as arXiv versions (Goodfellow2014, Nowozin2016, ACB2017, Gulrajani2017, NWJ2008). The README states that 1.2 (a), (b), (d), the proofs of 1.3 and 2.2, and the generalisations of 3.2–3.4 are its own and in no source (README lines 130–133, 190–192, 288–293, 415–422, 511–516).
- **Scope.** The subject is the theory of machine-learning objectives (`topic = "math.ST"` in `TauCetiRoadmap/GenerativeAdversarialObjectives/metadata.toml`); whether it belongs to the project's research mathematics is yours to decide.
