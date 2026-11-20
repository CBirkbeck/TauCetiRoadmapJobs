# Review of BochnerSpaces (pull request #2249 at 975b04d)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every Lean statement and every prose claim that could be tested was computed on degenerate and separating instances (infinite atoms, counting measure on an uncountable set, `c₀`-valued functions, the endpoints `p=1,∞`), and each carries the hypothesis its counterexample demands. There is one small correction (the mollifier limit in §5.2 does not say that `p<∞`) and two format notes, none blocking. For the humans: no source text could be read this round (the book that carries 34 of the 35 citation groups is paywalled), so every source locator is uncertified.

## C01 — The mollifier limit in §5.2 does not bind `f` or the exponent, and it fails at `p=∞`

In the second paragraph of §5.2 (`TauCetiRoadmap/BochnerSpaces/README.md`, lines 556–560) the limit `k_ε*f → (∫ k dμ)f in Lᵖ` is introduced with "For `E,μ` as in §5.1", and §5.1 allows `1≤p≤∞`. The restriction `1≤p<∞` stands only in the first sentence of the section, which is about a different result. At `p=∞` the limit is false: on `ℝ` with `k=𝟙_[0,1]` and `f=𝟙_[0,∞)` one gets `(k_ε*f)(x)=min(x/ε,1)` for `x≥0`, so `‖k_ε*f−f‖_∞=1` for every `ε`.

The proof sketch (dominated convergence for the `Lᵖ`-valued translates) shows that `p<∞` is meant. Writing "for `f∈Lᵖ(μ;X)` with `1≤p<∞`" in that sentence removes the doubt.

## N01 — Seven reference links point into the roadmap repository at a fixed commit and line

The link definitions for BanachSpaceTheory B4.0, B4.1 and B5, VonNeumannAlgebras V2 and the semigroup roadmap (lines 1240–1246) use `blob/e0fe5607…#L381` and the like. They resolve today (I opened each line at that commit), but they stay on that commit when the cited roadmaps are revised. A path on main, or the roadmap name and section that the prose already gives, would not go stale.

## N02 — Two Tau Ceti names in the supplier contracts are not marked as newer than the manifest pin

The contract paragraph says that links to `8794ab32` cite additional results, and most bullets say which form is at the pin. The scalar `Lp.dualEquiv` (in the duality bullet, line 1119) and `condExpLpCLM` (§7.4, line 845) are only at the later commit and are not marked in the sentence; a reader searching the pinned Tau Ceti finds neither. A word such as "(at `8794ab32`)" beside each would do.

## Verified sound

Previous review (of `9bfecd1`): no finding. Its earlier R01 stays repaired at this head: lines 969–970 and 996 cite `lp.dualPairing`, `lp.norm_dualPairing`; the contract bullet is at lines 1075–1079.

| Statement | Instances tried | One side | Other side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| §1.1 `stronglyMeasurable_iff_scalar_tests` | `S=I` uncountable, discrete σ-algebra, `f(i)=e_i∈ℓ²(I)`; `X=0` | every `x'∘f` measurable; range has `‖e_i−e_j‖=√2`, nonseparable | not strongly measurable | separable-range clause needed and present | none |
| §1.1 `stronglyMeasurable_iff_separating_tests`, and its Check | `Y={0}` on `E=ℝ` | `Y` separates no point; hypothesis `hsep` fails | σ-algebra generated is trivial | Check true; separation hypothesis in the signature | none |
| §1.2 `aefinStronglyMeasurable_iff_scalar_tests` | one atom of mass ∞, `f≡1∈ℝ` | `f` a.e. strongly measurable, tests `x'∘f=c` | not finite-support unless `c=0` | both sides false together; iff holds | none |
| §1.3 approximation and transport | `f≡1`; then `f≡0` on an infinite atom, `D={0}`, `g(0)=1` | Mathlib bound `‖f‖+‖f‖=2`, target bound `1` | `g∘f≡1` is not finite-support | hypothesis "σ-finite or `g(0)=0`" is exactly what excludes it | none |
| §1.6 injective operators | `T=0` on `E=ℝ`, `f` non-measurable | `T∘f=0` strongly measurable | `f` not | iff fails without injectivity on `E`; hypothesis present | none |
| §2.1 `integral_mem_graph` | domain `{0}`; `T=id` | `f=0` a.e., `g=0` a.e. gives `(0,0)` | `(∫f,∫f)` in the diagonal | holds; proof elaborates without `sorry` | none |
| §2.3 `ae_mem_of_set_averages` | `μ=δ₀`, `f=1`, `C={1}`; one atom of mass ∞, `C={1}` | average `1∈C`; no set of finite positive mass, hypothesis vacuous | `f=1` a.e.; integrable `f` is `0∉C` | true on semifinite; false on the infinite atom, which `hμ` excludes | none |
| §3.1 `linftySigma`, Check | one atom of mass ∞, constant `1` | native `‖1‖_∞=1` | finite-support simple functions vanish, so `L∞_σ=0` | Check true; distinguishes the two carriers | none |
| §3.2 simple approximation | `n↦e_n∈ℓ²` on `ℕ`, counting measure | any finite-range `g` has `g(n)=g(m)`, so error `≥√2/2` | countably valued sum `∑𝟙_{n}e_n` is exact | "finite-range not dense, countably valued dense" both confirmed | none |
| §3.3 separability | counting measure on uncountable `I`, `X=ℝ`; one atom of mass ∞ | finite sets with `d=|A△B|≥1`: uncountable discrete | `ℓᵖ(I)` nonseparable; second case `Lᵖ=0` | agree; zero-space clause matches | none |
| §3.4 scalar evaluations at `∞` | `f=(1,0)∈ℝ²` on a point mass; `Y=X*`; `Y=span(e₂*)` | `‖f‖_∞=1` | `sup‖y∘f‖_∞=1`; then `0` | equality needs `Y` 1-norming on `E`, as stated | none |
| §4.1 `exists_minkowskiContraction` | two-point counting spaces, `p=1,q=2`, `F(s,t)=δ_{st}` | target norm `‖(1,1)‖₂=√2` | source norm `1+1=2` | `√2≤2`; reverse direction would need `2≤√2` | none |
| §4.4 `exists_lpOneTensorEquiv` | `μ=δ`; `μ=0` | `𝕜⊗̂X=X`, `‖φ⊗x‖=|φ|‖x‖` | `L¹(δ;X)=X`, `‖φx‖=|φ|‖x‖`; both `0` | isometry on pure tensors | none |
| §5.1 Young | `p=∞`, `k=𝟙_[0,1]`, `f≡1` | `k*f≡1` | `‖k‖₁‖f‖_∞=1` | bound attained | none |
| §5.2 mollification | `p=∞`, `k=𝟙_[0,1]`, `f=𝟙_[0,∞)` | `(k_ε*f)(x)=min(x/ε,1)` | `f(x)=1` on `x≥0`; sup distance `1` | fails at `∞`; holds for `p<∞` | C01 |
| §6.2–6.3 `PettisIntegrable`, `exists_pettisVectorMeasure` | `n↦e_n∈c₀`, counting; `n↦e_n/n∈ℓ²` | `∑|x'_n|<∞`, set integral `(1,1,…)∉c₀` | second: `m(A)=∑_{A}e_n/n`, variation `∑1/n=∞` | first not Pettis; second Pettis with infinite variation, as the text says | none |
| §6.4 three criteria | same `c₀` example; `p=1,q=∞` with `φ≡1` | weakly `L¹`, a.e. strongly measurable, not Pettis | `c₀` embeds in `c₀`; `1<p` fails | excluded by the no-`c₀` hypothesis and by `hp : 1<p` | none |
| §6.5 convexity | two points of mass ½, `f=±1`, `C=[−1,1]`, `φ=x²` | `∫f=0∈C`, `φ(0)=0` | `∫φ(f)=1` | `0≤1` | none |
| §7.2 `HasRNPWith`, universality | counting on Borel `[0,1]`, `m=`Lebesgue, `X=ℝ`; counting on `ℕ` | `m≪μ`, density must be `m{x}=0` | `m≠0`; on `ℕ`, `f(n)=m{n}`, `∑‖f(n)‖=|m|(ℕ)` | fails off σ-finite, as stated; holds for every `X` on `ℕ` | none |
| §7.3 `norm_representableOperatorMap`, surjectivity | `μ=δ`; one atom of mass ∞ | `T_x(c)=cx`, `‖T_x‖=‖x‖` | `L¹=0`, `T_φ=0` but native `‖1‖_∞=1` | isometry needs semifinite (`hμ`); every `T:𝕜→X` represented | none |
| §7.5 `hasRNP_strongDual_of_separable` | `X=c₀` (dual `ℓ¹` separable); control `c₀` itself with `m(A)=(∫_A r_n)_n` | `ℓ¹` has the property | Rademacher density `(r_n(t))` has `|r_n|=1`, not in `c₀` | `c₀` is no separable dual; no conflict | none |
| §8.1 norm identities and Check | one-point probability space over `ℂ`, `g(z)=iz`, `f=1`; infinite atom | `(Jg)(f)=g(1)=i` | conjugate-linear convention gives `−i`; `L¹=0` vs `‖g‖_∞` | Check separates conventions; unrestricted `p=1` isometry needs semifinite or `L∞_σ` | none |
| §8.2 `bochnerDualMap_surjective_iff` | `μ=δ`; counting on `ℕ` | `J=id` on `X*`, onto | densities `m{n}` exist for every target | both sides true together; consistent with §8.3 needing no RNP | none |
| §8.2 `bochnerDualMap_surjective_of_hasRNP` | counting on uncountable `I`, `1<p<∞` | functional has `‖Φ‖^q=∑‖Φ_i‖^q`, countable support | `L^q(I;X*)` elements countably supported | onto without σ-finiteness; `p=1` correctly excluded | none |
| §8.3 `exists_lpDualEquiv` | `I={1,2}`, `E_i=ℝ`, `Φ=(a,b)`, `p=1` and `p=2`; `I=∅` | `‖Φ‖=max(|a|,|b|)`; `√(a²+b²)` | `‖(a,b)‖_∞`; `‖(a,b)‖₂` | isometric with the stated coordinates | none |
| §7.4 Check | Lebesgue on `ℝ`, trivial σ-algebra, `𝟙_[0,1]` | `L²` of the trivial σ-algebra is `0`; projection `0` | `∫𝟙_[0,1]=1` | Check true; only `∅` has finite measure there | none |
| §6.3 support-restricted test | arbitrary `μ`, `A` not σ-finite | net `x_B`, `B⊆A` finite measure; non-Cauchy gives `‖x_{B_{n+1}∖B_n}‖≥ε/2` on a σ-finite union | contradicts norm additivity there | equivalence of the two `L∞` tests holds | none |

- Source locators checked against the text: 0 (see Not verifiable).
- Pinned Mathlib declarations opened: at least 31, among them `ContinuousLinearMap.lpPairing` (`Mathlib/MeasureTheory/Function/Holder.lean:149`), `Measure.measure_prod_null_of_ae_null` (`Measure/Prod.lean:391`, no s-finiteness), `VectorMeasure.semivariation` (`Variation/Semivariation.lean:53`), `MeasuredSets` (`Measure/MeasuredSets.lean:42`), `Measure.MeasureDense` (`Measure/SeparableMeasure.lean:90`), `Integrable.withDensityᵥ_eq_iff` (`VectorMeasure/WithDensity.lean:169`), `lp.dualPairing` (`Analysis/Normed/Lp/lpHolder.lean:264`).
- Tau Ceti: at least 14 declarations opened at the manifest pin `2fd255d9` (for example `lintegral_Lp_lintegral_le`, `MinkowskiIntegral.lean:199`, σ-finite outer and s-finite inner as the README says); at least 12 opened at `8794ab32`, the later commit the README names (`Integrable.coeFn_integral_Lp`, `Bochner/Lp.lean:58`; `condExpLpCLM`, `CondexpLp.lean:63`; `eLpNorm_convolution_le`, `Convolution/Young.lean:167`; `Lp.dualEquiv`, `Lp/Dual.lean:64`). Each exists with the hypotheses the README states.
- Cross-roadmap citations resolved on main: 7 (BanachSpaceTheory B4.0 at README 381, B4.1 at 768, B5.LocalHaarDual at 1087; VonNeumannAlgebras V2 at 1027, 1047, 1177; OneParameterSemigroups Part C at 204). The open BanachSpaceTheory revision keeps the labels B4.0, B4.1 and B5.LocalHaarDual in its headings.
- Dependency check: `depcheck: 182 roadmaps, 2070 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file changed outside the folder.
- Elaboration of `TauCetiRoadmap/BochnerSpaces/Suggested.lean`: exit 0, 27 `sorry` warnings and nothing else; no `set_option`, no sorry'd data; imports are `Mathlib` and one Tau Ceti module. Elaborated types of all 35 declarations compared with the README: no binder lost (`CompleteSpace X`, `SigmaFinite μ`, the Hölder instances are in each signature that needs them).
- One-tactic probe on a copy of the file (`simp`, `rfl`, `infer_instance`, `exact?`) over the 27 sorried theorems: none closed (21 fell through, 6 ran out of heartbeats in `exact?`). No library near-match states any target.
- Headline theorems (Pettis measurability, Hille, mixed-norm interchange, `L¹` as a projective tensor product, duality against the Radon–Nikodým property, unit-interval universality): all stated; none is unstatable at the pins.
- Pull request text: title and description agree with the head (a new roadmap; suppliers BanachSpaceTheory B1–B5 and VonNeumannAlgebras V2).

Overlap check: read SchattenClassesAndSchurMultipliers, BanachSpaceTheory (main and its open revision), VonNeumannAlgebras, and PDE §6.1 and NoncommutativeIntegration §4.4 for the word "Bochner spaces"; nothing shared. The reflexive finite-measure density theorem, the no-`c₀` series criterion and the dependent `ℓ¹`-sum dual are BanachSpaceTheory's and are cited, not restated; the finite measure algebra and its interval classification are VonNeumannAlgebras V2's; this roadmap owns the Pettis integral, the Radon–Nikodým property and Bochner-space duality, which no other roadmap states.

Source independence: 7 passages compared with the docstrings of the 2 pinned libraries, none shared beyond phrases the formula forces; 0 compared with the literary sources, none of which could be read; largest share HvNVW, 34 of 35 citation groups; contents of HvNVW not readable this round. By the README's own page locators the mapping is not one to one: Layers 1, 2, 3 and 6 keep the book's page order, which the `*Needs:*` lines force (§2 and §3 need §1, §6 needs §3.4); the book's pp. 21–30 are split over Layers 3, 4 and 5 with a second source for §4.4; Layers 7 and 8 regroup pp. 37–59 with the Radon–Nikodým property before duality.

Research link: Vector-valued harmonic analysis. The README's downstream consumers name Fourier-type estimates, the `ℓ^q`-valued Doob maximal inequality and duality of Bessel potential spaces in Hytönen–van Neerven–Veraar–Weis (2016), §§2.4, 3.2.a, 5.6.a; Diestel–Uhl (1977) for vector measures. Rests on the README; the sources were not read.

## Not verifiable

- HvNVW, every locator, including all fifteen sampled targets (§§1.3, 1.6, 2.1, 2.3, 3.1–3.4, 5.1, 6.3, 6.5, 7.2, 7.3, 7.5; §4.4 cites Ryan): the DOI resolves only to a paywalled page; no legal copy found.
- hvn-errata, entries for pp. 7, 28 and 39: the author-hosted PDF timed out on two attempts.
- Diestel–Uhl, Chapter I §4 Corollary 4, p. 22, and Chapters II–III: the publisher's page is not an open copy.
- Ryan, Example 2.19, pp. 29–30 (§4.4): paywalled.
- The table of contents of HvNVW: the publisher's book page redirected to a sign-in and was not followed.

Automatic checks set aside as false positives: none (the one flagged rule, links into the roadmap repository at a fixed commit, is real and is N01).

## Source issues

- none

## For the human reviewers

- **Not tested.** HvNVW carries 34 of 35 citation groups; neither its text nor its contents page could be read, so wording and arrangement were compared only through the README's own page locators.
- **Scope.** The pull request description says the authors plan to formalise all three volumes of the same book and that this roadmap is its Chapter 1; whether later roadmaps may follow the book chapter by chapter is yours to decide.
- **Licence.** The errata PDF on an author's page was unreachable; its date (the README says June 18, 2026) and the three entries cited were not confirmed.
- **Licence.** Diestel–Uhl and Ryan are cited by locator only; no open copy was found.
