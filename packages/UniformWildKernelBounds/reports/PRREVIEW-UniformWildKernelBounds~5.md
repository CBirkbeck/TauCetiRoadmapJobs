# Review of UniformWildKernelBounds (pull request #2892 at 4cb111c)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/UniformWildKernelBounds/`
**Verdict:** needs changes

**Summary.** Changes are needed, for three findings. The statements that the roadmap gives without a route, as theorems of [FormalProof], still have no locator into it, and every headline route passes through them; three further steps of the routes are "not given here" without being attributed to anything; and 5.1 states, and claims to own, a class-number bound that ExplicitNumberFields already states and that this README itself cites in 6.5. Everything I could compute held: the fifteen sampled targets, the headline theorems and about forty Checks were recomputed, with one mislabelled example. There are four small corrections and one format note, none blocking. The scope and licence questions about the unpublished formal proof are for the human reviewers.

## R01 (P2) — The statements given without a route, as theorems of [FormalProof], have no locator into it, so as written they are unsupported

All three headline theorems route their plus part in Cases I, II, III and V large through statements for which the README gives neither a route nor a place where the statement can be read:

- (K1′) and (K2′) of 3.15(c) (line 984);
- the two seed existence statements of 3.20(d) (line 1553);
- the maps and the clauses (P1₄), (pur), (aut) of 3.20(e) (line 1565);
- the clauses (w1), (w2) in 3.22(c) (line 1808), 4.2(b) (line 2086) and 4.5(b) (line 2442);
- 4.5 (model), and (i), (ii) of 4.3 for `𝒟_G` (lines 2420 and 2426).

Each says only that it is "a theorem of [FormalProof] whose route is not given here", and the References entry (line 3292) names the whole development. A referee or an implementer cannot check that the development states these results with the hypotheses written here (the host data of 4.5, the level and the Taylor–Wiles set of (K1′), the range of layers in 3.20(e)).

The locators exist and the family already uses them. At their open heads, BernoulliBoundsForClassGroupEigenspaces §6.17 names `Formalism.GaloisCohomology.Sha` with its file, its §9.7 names `UpperTheory.V.LemmaK` (`AV/GeneratorCountTuples/LemmaK.lean`), and ReducibilityIdealsAndUltrafilterPatching §4.8 names `UpperTheory.V.Alg.M.sign_holds` with its path. This README does not: the pull-request description says that it "cites [FormalProof] as a whole, without naming its declarations".

The smallest repair is one line after each statement listed above, in the form the two sibling roadmaps use: the declaration of [FormalProof] that states it, its file, and one clause where its hypotheses differ from the README's. The same line at 7.6, the form the family consumes, would let the consumers check their input.

## R02 (P2) — Three steps of the routes are "not given here" and are not attributed to any theorem, so 3.20(e)(seed), 4.2 and 4.7(i) use an input that nothing provides

The Conventions (line 132) promise that a clause whose route is not given "is stated precisely and says that its route is not given here, with what the statement is: a theorem of [FormalProof], or a named theorem of the literature". Three steps do not follow this. They are neither targets, nor supplier sections, nor attributed:

- in the route of 3.20(e)(seed), "the verification of (w1), (w2) for `ρ` is not given here" (lines 1565 and 1709–1710), for `ρ = (seed)|_{G_L} ⊗ κβ^n`;
- in 4.2, the verification of (w1), (w2) "at the rank-three seeds of step (6) is not given here" (lines 2086 and 2110–2111);
- in 4.7(i), the passage of (w1), (w2) from `ρ|_{G_K}` to `ρ|_{G_L} ⊗ κ` "is not given here" (lines 2514 and 2529–2530).

Each is a hypothesis of the supplier the route then applies. HeckeIdealsAndTaylorWilesRelations §3.13a(f) makes (w1), (w2) part of "automorphic", and its §9.9(d), (d′) ask for automorphy in that sense. So the seeds are points of the Hecke quotient, and the adjoint Selmer group vanishes in 4.7(i), only once these clauses hold. An implementer reaches each step with nothing to prove it from and nothing to cite.

The repair is to make each of the three a stated clause of its target (of 3.20(e), of 4.2 and of 4.7), and either give its route or attribute it as the Conventions require, with the locator of R01.

## R03 (P2) — 5.1 states, and the Scope claims to own, a class-number bound that ExplicitNumberFields states and that 6.5 of this README already cites

Two roadmaps would own the same statement, and an implementer would prove it twice.

Target 5.1 (line 2629) asks for `h(F) ≤ M(1 + log M)`, `M = √|D|`, for a quadratic field. Its route is: an ideal of norm at most `√|D|` in each class, at most `d(m)` ideals of norm `m`, and `Σ_{m≤M} d(m) ≤ M(1 + log M)`. This is ExplicitNumberFields (open, earlier in the merge order) at `n = 2`, `b = √|D|`. Its §0.3 proves `h_K ≤ Σ_{m≤b} τ_n(m)` for every admissible `b`, and its §5.3, first form, gives `h_K ≤ b(log b + γ + 1/b)^{n−1}`. For `|D| ≥ 6`, `γ + 1/√|D| ≤ 1`, so this is `h ≤ M(1 + log M)`; for `|D| ≤ 5` the class number is one. Step (4) of 6.5 makes exactly this deduction (lines 2905–2907) and its contract cites §§0.3, 5.3 (line 3279). But 5.1 compares itself only with the bound of EffectiveBounds, and the Scope lists "the class-number bound for quadratic fields used in Case Z (5.1)" among what the roadmap owns (line 3087).

The repair: let 5.1 cite ExplicitNumberFields §§0.3 and 5.3 for the bound and keep only its consequence, `h(ℚ(√ℓ)) < ℓ` for a prime `ℓ ≡ 1 mod 4`, with the value at `ℓ = 5` as its Check; move the bound from "owns" to "does not own" in the Scope; and adjust the last paragraph of the docstring of `Suggested.lean` (line 57), which calls 5.1 a step of the routes.

## C01 — The Check of 3.20 on the exponent of `ξ′` uses the pair `Q = {43, 47}`, which is not a host pair: `47 ≡ 15 mod 16`

A reader who recomputes the example finds that it lies outside the class of fields the roadmap treats. The Conventions ask for `q′ ≡ 7 mod 16`, and `47 = 2·16 + 15`. The point of the Check (with `ξ′ = η₄` no ratio has order `> 4`) does not depend on the pair, but the numbers do.

With `Q = {43, 71}` (`71 ≡ 7 mod 16`, and `43 > 2t + 1` for `t = 19, 20`): `N = 80·43·71 = 244240`, `ℓN·4^{n₀} = 19·244240·64 = 296995840`, and `m(19, ψ) = 29`, since `2²⁸ = 268435456` is smaller. Replace the pair and the three numbers in lines 1742–1745.

## C02 — The docstring of `Suggested.lean` says the pins do not provide the unramified condition away from `ℓ`; they provide its pieces, and what is missing lies elsewhere

The conclusion that no headline is statable stands, but the reason given would mislead someone who later tries to state `Ш¹(F, ℓ, e)`.

Lines 24–27 say that the condition on inertia is something "which the pins do not provide" and that `ContinuousCohomology.tateShafarevich` "asks for vanishing on the whole decomposition group". Mathlib's definition (`Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean`, line 72) takes an arbitrary family `f : V → Type u` of extension fields of `K` and intersects the kernels of the restrictions; it asks for vanishing on the decomposition group only when the family is the completions. The pinned Tau Ceti has the maximal unramified extension of a nonarchimedean local field, `TauCeti.maximalUnramifiedExtension` (`TauCeti/NumberTheory/LocalField/Unramified/Maximal.lean`, line 97). With the completions above `ℓ` and the maximal unramified extensions of the completions elsewhere, the family would give exactly the classes unramified outside `ℓ` and trivial above `ℓ`.

What the pins lack is: the module `ℚ_ℓ/ℤ_ℓ(−e)` as a `TopRep ℤ (Field.absoluteGaloisGroup F)`, as the docstring says; an `IsNonarchimedeanLocalField` structure on the completion of a number field at a finite place (the only such instances at the pins are `ℚ_[p]` and worked examples), without which `maximalUnramifiedExtension` does not apply to those completions; and the host fields. Rewording the two sentences along these lines would make the docstring exact.

## C03 — The description's list of statements without a route omits the clauses (w1), (w2), which the head now lists

The description says: "Some statements are stated precisely without a route, as theorems of [FormalProof]: 3.15(c), 3.20(d), (e), and 4.5 (model) with (i), (ii) of 4.3 for `𝒟_G`". At this head the Summary (line 55) adds "the clauses (w1), (w2) of the automorphy statements 3.22(c), 4.2(b) and 4.5(b)", and the headline targets 7.1–7.6 name them too. Adding that clause to the description's sentence brings it up to date.

## C04 — 1.3 carries the unipotence hypothesis of 1.2 and a *Needs:* edge to 1.2, and uses neither

Target 1.3 begins "Let `X`, `R`, `g` be as in 1.2" (line 286), which includes `(g − 1)^M X ⊂ ℓX`, and lists "*Needs:* 1.2" (line 299). Its route lifts `g` to any matrix, bounds a determinant and applies the ultrametric Helly lemma; it uses neither the hypothesis nor 1.2. It works for every endomorphism: the route itself treats eigenvalues with `|z_i| ≠ 1`, and the second Check lifts the identity to `diag(1, 0)`. Stating 1.3 for an endomorphism `g` of a module generated by `R` elements, and dropping 1.2 from its *Needs:*, would leave an implementer of 1.3 and 1.4 unblocked by 1.2. The hypothesis first matters in 1.5.

## N01 — "Vs" in the title of Layer 6 (line 2826) and in the guide to the layers (line 76) is not defined; 0.4 names the case "Case V, small". Writing "V small", as 6.2 does, would match.

## Questions for the author

- Does [FormalProof] state the budget form 7.6 with the hypotheses written there (`0 < ε ≤ 2`, both residue classes, `q, q′ > 2X^κ + 1 + P(χ)`), as "the joint window statement" of line 3011? I could not read the development: the README names no declaration and its text is not available through a legal source.
- In 5.4 the route takes "`q^e s_i` is integral" for the traces of the automorphic points (line 2697). Is the intended supplier the integral Frobenius polynomial of AutomorphicGaloisRepresentationsPartII AG2.0? The *Needs:* line cites AG2.0 only for rationality, and I did not check that its integrality statement covers the normalization used here.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 1.1 Twisted control (sampled) | regular `ℓ`, `L = ℚ(μ_ℓ)`; `X′ = ℤ_ℓ` with trivial action | `X′ = 0`: both sides `0`; trivial action: `coker(u^{eℓ^m} − 1)` has length `c + m + v_ℓ(e)`; `H¹(Γ_m, W) = 0` as `u^{−eℓ^m} ≠ 1` | holds |
| 1.2 Growth (sampled) | `X = ℤ_ℓ`, `g = 1 + ℓ`; `g = 1`; `ℓ = 2`, `h ≡ 1 mod 4` | `m + 1 = (j₀ + 1) + (m − j₀)`; `∞ ≤ ∞`; `N_h = 2·`unit, `coker N_h = X/2X`; `ℓ^k ≥ R` gives `k + 1 ≤ j₀` | holds |
| 1.3–1.5 | `g = α`, `u = 1 + ℓ`; eigenvalue `0`; `m < j₀` | `j + 1 + v_ℓ(e − s)`, equality; `r(e) = ℓ^{j+c} ≥ 1 ≥ |a − b|`; image of `h^{ℓ^{j₀}} − 1` inside that of `h^{ℓ^m} − 1` | holds; C04 |
| 1.6 Torsion bound (sampled) | BernoulliBoundsForClassGroupEigenspaces §9.7 at its head | `log #H² ≤ exp((2E[L:ℚ])^{C_K} log(2|d_L|))`; length `≤ log #/log 2 ≤ 2 log #`; off `Exc(Z)`, `v_ℓ(e − s_i) ≤ log_ℓ Z` | matches |
| 2.1, 2.2 Window selection (sampled) | `R = 0`; `R = 1`, `B = 1`; `a ≤ 0` | range ratio `2^{R+1}B^R >` forbidden `(2B)^R`; `y ∈ [log X/J, log X/2]`; `a > 2y ⇒ e > x^κ`, `Ba ≤ y ⇒ e ≤ x^{δ/(2C_K)}` | holds |
| 2.3, 2.4 | `q ≡ 3 mod 8`, `q′ ≡ 7 mod 16`; §11.1 iterated, `p = 2` | indices `2`, `4` in `ℤ₂^×`; `4g + 4·2[M:ℚ] + 2·8[M:ℚ] = 4(g + 6[M:ℚ])`; exponent `x^{δ/2}·x^{δ/4}` | holds |
| 3.2 Congruence integers | `q = 4, 5, 7`; `q = 2`, `z = e^{2πi/3}`; Salem example; `q = 5`, `e = 2` | `3.25 < 3.5`; `4.2 > 3.68`, `4.2 < 4.24`; `7/4 < 9/4`; `3s = 5.166 > 3.683`; `60 < 94 < 100` | holds |
| 3.3 Graded cotangent bound (sampled) | ReducibilityIdealsAndUltrafilterPatching §§4.8, 4.9 at its head; `r₀ = diag(χ, 1)` | (M5): `x(a_σ) = 0` from `x(I) = 0`; rank two: generators of weights `±1` only, weight-2 elements lie in `(ker x)²` | matches |
| 3.5 Bernoulli units (sampled) | `ℓ = 17`, `f = 1`, `m = 6`, all eight `ξ(5)`; `m = 7` over `𝔽₂₈₉`; `ℓ = 5`, `f = 455` | `Σ_{a<32 odd} ξ(a) ≡ 0` only for `ξ(5) ≡ 11`; 16 characters, none vanish; `29120 ≤ 2¹⁵ < 58240` | holds |
| 3.15 Patching (sampled) | Check field `ℚ(√−39, √−11)`, `ℓ = 3` | `429 = 3·11·13`; `−143 ≡ 1 mod 3`, so `ℚ₃(√429) = ℚ₃(√−3)`; `L/L⁺` unramified at `2, 3, 11, 13`; (K1′), (K2′): no route, no locator | Check holds; R01 |
| 3.16 Nice primes (sampled) | `n = 3` minors; 3-cycle `y`; (g) discriminant | `2×2` principal minors `= det·(M⁻¹)_{ii}`; charpoly `X³ − det`; `a²α₀^{2m} + d²α₁^{2m} + (4bc − 2ad)(α₀α₁)^m` | holds |
| 3.18, 3.19 counts | `ω ⊕ 1` over `G_{ℚ,{ℓ}}`; `GSp₄`; `GL₂`; `ν(c) = 1`; `X³ − X + 3` | `o − a = 1 = 0 + 1`; `4d − 10d + 4d = −2d`, excess `2d + 2`; `−d`, excess `d + 1`; disc `−239`; `30(C+1)² ≤ d` gives both inequalities | holds |
| 3.20 Check on `m(ℓ, ψ)` | `Q = {43, 47}`; `Q = {43, 71}` | `47 ≡ 15 mod 16`; `m = 28` for `N = 161680`; with `71`: `N = 244240`, `296995840 > 2²⁸`, `m = 29` | C01 |
| 3.22 Eisenstein congruences (sampled) | `L₄`, `L₃²`, `L₃L₅` in `t`; `w = 13`, `7` | `t + 6t²`, `t² + 4t³`, `t² + 16t³ + 48t⁴`; `s = −1/6`, `p = −1/72` give `1/18`; `13^k − 1 ≡ 0`, `7^k + 1 ≡ 2 mod 3`; (w1), (w2) of (c) | route holds; R01 |
| 4.3 Rigidity (sampled) | `ℓ = 29`, `e = 28`, `ψ` cubic mod `7`; Kato Theorem 14.2 | `29 ≡ 1 mod 7`, `ω²⁸ = 1`: `Ψ̄ = 1` at `29`, and `28 | 56`; `r = e`, `k = 2e + 1`, `r ≠ k/2` | holds; (iii), (iv) rest on R01, R02 |
| 4.5 Gaussian component (sampled) | host data from `R₁(ℓ, χ) ≤ 2^{c₂(ψ)}` | `f₀ | d_ℓ`, so `4^{n₀} ≤ 4^{v₂(ℓ^{d_ℓ}−1)}`; `2ℓf_χ4^{n₀} ≤ R₁`; `8o_χv² < R₁`; conductor of `(comp₂ψ)²` is `2^{c₂−1}` | holds; (model), (i), (ii), (w1), (w2): R01 |
| 5.1, 5.2 Case Z | `ℓ = 5`; `(ℓ−1) | e`; `(ℓ−1) | 2e`, `∤ e` | `4.04 < 5`; `Hom(G_{ℚ,ℓ}, ℤ/ℓ)` one-dimensional, the image of `H⁰/ℓ`; `ℓ ≡ 1 mod 4`, `h(ℚ(√ℓ)) < ℓ` | holds; R03 |
| 5.4 One integer (sampled) | `t_ψ` at `σ = Frob_w`; `q = 5, 7` | `q^e z⁻¹ + 1 + q^{−e}z`, `z = ψ(q)⁻¹`; `6.14 > 4.65` at `7`; `4.2 < 4.24` at `5`, so (b′) needs `q ≥ 7` | holds |
| 5.5, 5.6 | two primes `p, p′`; `χ` cubic mod `7`, `ℓ = 5`, `e = 2` | `2(log|NN_p| + log|NN_{p′}|)`, both primes `≤ 7N|d_K|`; `B(χ) = {3, 7, 11, 13}`, `f₀ = 2`, `n₀ = 3`, `m = 15` | holds |
| 5.7 Cases II, III (sampled) | window at `p₀`; `q = 5`, `e = 2`; `p₀ ∤ M` | shift `c = p₀^{(e+1)/2}`, window `(p₀^{e/2}, p₀^{e/2+1})`; `60 < 94`; `π_w` unramified; `#J ≤ φ(k)` | holds; inputs via R01, R02 |
| 6.3, 6.5 | `ℓ ∈ B(χ)` against `Q`; `M′ = 5`, `a = 3`; `E = ℚ(μ₇)`, `ℓ = 3` | `ℓ ≤ P(χ) < q`; `ε₃ = 0, −1, 1, 0`; `1 − 43² = −2³·3·7·11`, `B_{2,χ} = (8 − 4ζ₃)/7` a 3-unit, `v₃(Δ) = 3`; `C = 30·8` | holds |
| 7.1–7.3 Polynomial bound (headline) | `ℓ` with `(ℓ−1) | 2e`; §10.1(b) summed | `ℓe ≤ (2t−1)(t−1) < 2t²`; `t·N·log(16N^{t+1}t!)`; odd `ℓ | [E:ℚ]` divide `o_χ` | holds |
| 7.4 Window theorem (sampled, headline) | `J = 2J_{2.4}`; `t ≤ x^κ` | `X^{δ/J} = X^{(δ/2)/J_{2.4}}`; `exp(x^{δ/2}) log 2 + (Nt)^C + C exp(x^{δ/2}) + (Nt)^C`; `q > 2X^κ + 1 + P ≥ max(2t+1, P)` | holds |
| 7.5 Tower form (headline) | `X = 2^{Jk₀}`, `k = ⌈log₂ Y⌉` | `k ∈ [k₀, Jk₀/2 + 1]`; `2^{2k−2} ≤ Y²`; loss `≤ 2` per twist at `ℓ = 2`; `N ≤ 2^{O(n)}` | holds |
| 7.6 Budget form (sampled, headline) | `δ = ε/2`; `J = 0`; consumers §7.11, §10.7 | `X^{ε/(4J)} ≤ X^{δ/J}`; `log N ≤ x^{ε/4} + (α+1) log x + c`; size condition `≤ 1`; consumers cite §7.6 with `κ = C_t`, `α = A_n + 1` | holds, matches |
| `Suggested.lean` docstring | `tateShafarevich`; unramified closure | Mathlib `Sha.lean` line 72: arbitrary family; Tau Ceti `Maximal.lean` line 97; no local-field instance on completions | C02 |

- Source locators checked against the text: 4 (Kato 2004, Theorem 14.2, printed p. 236; Deligne–Serre 1974, Lemme 6.11; Barnet-Lamb–Gee–Geraghty–Taylor, Theorem 5.5.2; the announcement, footnote 1 and "weakening of Vandiver"), with Newton–Thorne, Theorem A, for the §9.9 contract. No locator is flagged unverified in the README.
- Library declarations opened at the pins: `ContinuousCohomology.tateShafarevich` (`Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean`, 72), `TopRep` (`Mathlib/RepresentationTheory/Continuous/TopRep.lean`, 31), `TauCeti.maximalUnramifiedExtension` (`TauCeti/NumberTheory/LocalField/Unramified/Maximal.lean`, 97), `TauCeti.continuousLocalCyclotomicCharacter`, `TauCeti.ZModTwist`, `NumberField.classNumber_le_bound`, and ten further Mathlib names of the contracts.
- Cross-roadmap citations resolved: about 150 section ids over 46 roadmaps, on main or at the open heads; none dangles. Statements compared in full for BernoulliBoundsForClassGroupEigenspaces §§6.17, 6.18, 9.7, 10.1, 11.1, ReducibilityIdealsAndUltrafilterPatching §§4.8, 4.9, HeckeIdealsAndTaylorWilesRelations §§3.13a(f), 9.9, FrobeniusRestrictedRieszSums §0.4, ExplicitNumberFields §§0.3, 5.3.
- Dependency check: `depcheck: 171 roadmaps, 2017 edges, 0 problem(s)`; no UPWARD or CYCLE line. The pull request changes nothing outside the folder and the family index.
- Automatic checks: all passed. Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no messages; the file declares nothing, so there is no signature to compare and no one-tactic probe to run.
- Headlines: 7.3, 7.4 with 7.6, and 7.5. None is statable at the pins, and the docstring names each with what it lacks (C02 on one of the reasons). No padding.
- Overlap check: read HeckeIdealsAndTaylorWilesRelations, ReducibilityIdealsAndUltrafilterPatching, PotentialAutomorphyInfrastructurePartII, CongruenceModulesOfThetaLifts, ModularityAndLanglandsExtensionsPartII (open), ClassicalSerreModularity, AutomorphicGaloisRepresentationsPartII, GlobalGaloisDeformations (main); nothing shared with them. One shared object elsewhere: the class-number bound of 5.1, owner ExplicitNumberFields §§0.3, 5.3 (R03). A search of every roadmap for residual lattices, tower data, exceptional twists, the pigeonhole on scales, Eisenstein traces and the conjugate-norm twist finds no second owner.
- Source independence: 6 passages compared with 5 sources (Kato, Deligne–Serre, Barnet-Lamb–Gee–Geraghty–Taylor, Newton–Thorne, the announcement), and the whole README and docstring matched against their texts: the longest shared run is 15 words, a bibliographic title; none shared. Largest share [FormalProof], 20 of 23 source attributions in the text; its contents could not be read, so the arrangement was not compared.
- Research link: the bounds are an unconditional substitute for Vandiver-type vanishing of `K_{2e}(𝒪_F){ℓ}`, after Soulé (1979, 2003); the routes use Ferrero–Washington (1979), Kato (2004) and residually reducible automorphy lifting (Skinner–Wiles 1999, Thorne 2015, Allen–Newton–Thorne 2020, Newton–Thorne 2023). Rests on the README's Summary and References.

## Not verifiable

- [FormalProof], for every statement attributed to it (R01) and for "the form of the formal proof" in 3.1, 3.2(b′), 3.19(b), (c), 4.1 and 7.6: the README names no declaration, and no legal copy of its text was available to read.
- Schneider 1979, Soulé 1979 and 2003, Jacquet–Shalika 1981, Clozel 1990 and the other References without a locator: not opened. The targets they are attached to were checked against their routes and their supplier sections instead.
- AutomorphicGaloisRepresentationsPartII AG2.0, for the integrality used in 5.4 and 5.7: the section exists; its integrality statement was not compared (second question above).

## Source issues

- none

## For the human reviewers

- Scope: the main source is [FormalProof], an unpublished, unrefereed Lean development announced on 20 November 2026 (README line 3292). The four-page announcement states none of these bounds, and no refereed source states the headline bounds 7.3–7.6.
- Licence: no licence for [FormalProof] could be read. The README cites a repository and an archive on its author's page (lines 3292–3293); neither was readable through a legal source here.
- Not tested: [FormalProof] holds the largest share of the source attributions (20 of 23). Its text and table of contents could not be read, so wording and arrangement were not compared with it.
