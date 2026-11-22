# Review of WienerChaosAndMalliavinCalculus (pull request #2972 at 653e845)

**Verdict:** needs changes

**Summary.** Changes are needed for one finding: four theorems of Layers 4 and 6 in `Suggested.lean` are stated for an inner product space `H` that need not be complete, and they are false there; adding `[CompleteSpace H]` repairs them. The finding of the previous review is repaired, as are its five small corrections. Every other statement was recomputed on degenerate cases and worked examples and none was found false. There are two small corrections and one format note, none blocking. None of the five cited books could be read legally, so no locator was checked against its text; that is left to the human reviewers.

## R01 (P2) — Four theorems of Layers 4 and 6 are false when `H` is not complete, and their Lean signatures do not assume completeness

An implementer who takes the signatures as written is asked to prove false statements. The module docstring says "`H` is a real Hilbert space" and the Conventions say `H` is "complete where a statement needs it", but the sections `Derivative`, `Divergence` and `OrnsteinUhlenbeck` of `Suggested.lean` declare only `[NormedAddCommGroup H] [InnerProductSpace ℝ H]`, and no elaborated signature in the file carries `CompleteSpace H`.

Take `H` the finitely supported sequences inside ℓ², `W` isonormal on `H`, `h̄ = (1, 1/2, 1/3, …)` in ℓ² and outside `H`, `hₖ` its truncations, and `F` the `L²` limit of `W(hₖ)`. Then `F` is in `gaussianL2 W P` and in the chaos of order 1, so `∑ₙ n ‖JₙF‖² = ∑ₙ n² ‖JₙF‖² = ‖h̄‖²`. But `F` is not in `sobolev12 W P`: if `(F, G)` lay in the closed graph with `G` in `Lp H 2 P`, the product integration by parts of §4.1, passed to the limit along the graph and compared with the same identity along `(W(hₖ), hₖ)`, gives `E[G'(⟪G, h⟫ − ⟪h̄, h⟫)] = 0` for every smooth cylinder `G'` and every `h` in `H`; hence `G = h̄` almost surely, which is not `H`-valued. Consequences:

- `IsIsonormal.mem_sobolev12_iff` (line 359): the right side of the equivalence holds for `F`, the left side fails.
- `IsIsonormal.mem_ouGeneratorDom_iff` (line 523): `F` is in `ouGeneratorDom W P` and not in `sobolev12 W P`.
- `IsIsonormal.integral_mul_comp` (line 562): with this `F`, `G = W(e₁)` and `g(x) = x`, the left side is `⟪h̄, e₁⟫ = 1`; on the right `ouPseudoInverse W P F = −F` is outside `sobolev12`, so `malliavinDeriv` returns its junk value 0 and the right side is 0.
- `IsIsonormal.malliavinDeriv_ouSemigroup` (line 553): for `F = ∑ₖ cₖ φₖ(W(e₀)) W(eₖ)` with bumps `φₖ` of disjoint supports and `cₖ` decaying fast, `DF` is `H`-valued and `F ∈ sobolev12`, while `D P_t F` has the nonzero component `cₖ e⁻ᵗ (P_t φₖ)(W(e₀))` on every `eₖ`, so `P_t F ∉ sobolev12` for `t > 0`.

The smallest change: add `[CompleteSpace H]` to the `variable` lines of those three sections (it is then carried by every theorem there), and say in the Conventions that Layers 4–6 take `H` complete. Layers 1–3 need nothing (`HilbertBasis` and `Lp ℝ 2 μ` already force completeness where it matters). The example above would serve as a negative-control Check in §4.4.

## C01 — The scope section says six things "are formalized in Tau Ceti" that the pinned Tau Ceti does not all contain

In "Not owned here" (lines 732–735): "Mehler averaging in one dimension, the finite-dimensional Poincaré inequality, Gaussian concentration in Banach spaces, the Wick–Isserlis formula, the Wiener integral and the dyadic Hermite basis of Brownian motion are formalized in Tau Ceti". At the pin, a search by object finds Isserlis' fourth-moment identity (`TauCeti/Probability/Distributions/Gaussian/MixedMoments.lean:160`) and nothing for the others: no Mehler formula or Ornstein–Uhlenbeck operator, no Gaussian Poincaré inequality, no Fernique-type concentration, no Wiener or stochastic integral (`TauCeti/Probability/BrownianMotion/` has six files, none on integrals), no Hermite basis of Brownian motion. A reader who goes looking finds nothing, and no route here uses these facts (the one-dimensional Hermite identity is proved inside §6.1). Either name the declaration and file for each item that is at the pin and drop the rest, or drop the sentence and keep its last clause ("this roadmap consumes from Tau Ceti only the Gaussian Hermite bases").

## C02 — Two white-noise targets of Layers 4 and 5 use Layer 3, which the guide says Layers 4–6 do not need

"How to read the build" (line 65) says of Layer 3 that "Layers 4–6 do not need it". The prose target of §4.4, `D I_q(f) = q I_(q−1)(f(·, t))` (line 408), needs §3.1, and its *Needs:* line (§§2.1, 4.2, 4.3) does not list it; the chaos form of δ in §5.1 needs §3.2 and says so. Add "§3.1 for the white-noise form" to the *Needs:* line of §4.4, and let the guide say that only these two white-noise forms use Layer 3.

## N01 — Three lines of `Suggested.lean` exceed 100 characters

Lines 25, 275 and 416; line 416 holds the whole signature of `IsIsonormal.integral_divergence`.

## Verified sound

Previous review, finding by finding:

- R01 (four prose targets on undefined objects): repaired. Stroock's formula, the general Skorokhod isometry, `Dom L = 𝔻²,²` and the derivative of the Itô integral now stand only under "Beyond this roadmap" (lines 780–790); item 5 of "Completion means" reads "Skorokhod isometry on elementary processes".
- C01 (unused hypotheses): repaired. `IsIsonormal.integral_divergence` has no `hgen`; `chaosProj_zero` has no `hW`.
- C02 (route of 3.3 used §6.4): repaired. The route is now continuity into L¹ by Cauchy–Schwarz and the isometry of §3.1.
- C03 (unowned finite-dimensional inputs): repaired. The one-dimensional Hermite identity is proved inside the route of §6.1; the alternative route of §6.4 is gone.
- C04 (CKMA): repaired, no mention left. C05 (relation to StochasticCalculus §6.1): repaired, lines 727–731.
- N01, N02, N03: repaired, except that N02's repair produced the sentence of C01 above.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 `IsIsonormal`, existence, laws, linearity, independence | H = 0; h = 0; H incomplete | W(0) = 0 a.s., law N(0, 0); independence with a constant ↔ ⟪0, g⟫ = 0; existence by restriction from the completion | sound |
| 1.2 `wickPower`, covariance | h = 0, n = 0 and n ≥ 1; n = m = 2, 3, 4; unnormalised | 1 and 0 (0/0 = 0 killed by ‖h‖ⁿ); 2ρ², 6ρ³, 24ρ⁴; 2c² | sound |
| 1.2 `closure_span_exp` | H = 0 | span = constants = classes measurable for σ(W(0)) | sound |
| 2.1 chaos, orthogonality, density, expansion | n = 0; H = 0; F = 1{W(h) > 0} | chaos₀ = span{1} for every W; chaosₙ = 0 for n ≥ 1; ∑‖JₙF‖² → 1/2 | sound |
| 2.2 `hermiteProduct_spec` | ι empty; a = (2) | Φ₀ = 1 alone, span = constants; norm √2 without 1/√2 | sound |
| 3.1 `IsMultipleWienerIntegral`, isometry, range | q = 0; T = {a, b}, f = 1{(a, b)} | I₀(c) = c; ‖f̃‖² = 1/2, E I₂(f)² = 1 ≠ 2‖f‖² = 2 | sound |
| 3.2 expansion with unique kernels | q! ≠ 0; F constant | I_q injective on symmetric kernels; f₀ = F, f_q = 0 | sound |
| 3.3 contraction and product formula | p = q = 1; (2, 2); (2, 3); p = 0; r = 0 | W(f)W(g) = I₂ + ⟪f, g⟫; 1, 4, 2; 1, 6, 6; c·I_q(g); index maps total, f gets x₀…x_(p−r−1), u | sound |
| 4.1 integration by parts on cylinders | n = 0; f = x², h = k unit | 0 = c·E W(h); E[2W·1] = 0 = E[W³] | sound |
| 4.2 closability, derivative, graph | F = 1; H incomplete | D1 = 0; closure taken in `Lp H 2 P`, statements still true by embedding in the completion | sound |
| 4.3 chain rule | m = 0; φ = x² on [0, 1] | constant, derivative 0; D1_A = 2·1_A·D1_A gives D1_A = 0 | sound |
| 4.4 `mem_sobolev12_iff` | F = W(h)²; H = c₀₀ ⊂ ℓ², F = lim W(hₖ) | 4 = 2·2; right side ‖h̄‖² < ∞, left side false | R01 |
| 4.4 Poincaré | F = W(h)², F = W(h) | 2 ≤ 4; ‖h‖² = ‖h‖² | sound |
| 4.5 constants, indicators | P(A) ∈ {0, 1}; A outside σ(W) | class 0 or 1 is in 𝔻¹,²; indicator outside `gaussianL2`, both sides false | sound |
| 5.1 divergence, domain, mean zero | F = 1; independent Z; c < 0 | E δ(u) = ⟪D1, u⟫ = 0 without generation; G + Z also a divergence; F = 0 only | sound |
| 5.2 product rules | u = W(h)h; F ∈ 𝔻¹,², h fixed | W² − 1; ‖δ(Fh)‖² ≤ ‖h‖²(‖F‖² + ‖DF‖²), so F W(h) − ⟪DF, h⟫ ∈ L² | sound |
| 5.3 elementary processes | u = W(h)h; u = W(h)g, h ⟂ g | 2 = 1 + 1; 1 = 1 + 0; trace term ∑ᵢⱼ⟪DFᵢ, gⱼ⟫⟪DFⱼ, gᵢ⟫ rederived | sound |
| 6.1 semigroup, Mehler, positivity, Lᵖ | t = 0; f = x²; F outside `gaussianL2`; t < 0 on a chaos; n = 0 | f(W); e⁻²ᵗ(x² − 1) + 1; P_t F = P_t E[F ∣ σ(W)] ≥ 0; one term e⁻ⁿᵗF; constant | sound |
| 6.2 generator, pseudo-inverse, L on cylinders | F = W(h)²; n = 0 term; limit direction | 2 − 2W² = −2He₂; 0⁻¹ = 0; ∑n²‖JₙF‖² = ‖G‖² | sound |
| 6.2 `mem_ouGeneratorDom_iff` | H incomplete, F = lim W(hₖ) | F ∈ Dom L, F ∉ 𝔻¹,² | R01 |
| 6.3 commutation | H incomplete, disjoint bumps | D P_t F has infinitely many nonzero components | R01 |
| 6.3 integration by parts | F = G = W(h), g = sin; H incomplete, G = W(e₁), g = id | e^(−1/2) both sides; 1 against 0 | sound for complete H; R01 |
| 6.4 log-Sobolev | F = exp(λW); F = 0 | 4λ²e^(2λ²) − 2λ²e^(2λ²) = 2λ²e^(2λ²) = right side; 0 | sound |
| 6.4 Nelson | q ≤ 0; 0 < q < 1; p = 1; F = e^W, p = 2, e²ᵗ = 3 | exponent 0 gives 0; ‖·‖_q ≤ ‖·‖₁; q ≤ 1; e^(1/3 + 2/3) = e = ‖F‖₂; q = 10 gives e² | sound |
| 6.4 moment equivalence | He₂, q = 2, r = 4; n = 0 | E He₂⁴ = 105 − 60 + 18 − 4 + 1 = 60; 2.783 ≤ 4.243; constant | sound |
| 7.1–7.3 Brownian realization (prose) | F = B₁³ | 3(B_t² + 1 − t); 9∫₀¹(2t² + 1)dt = 15 = Var B₁³ | sound |
| Scope sentence on Tau Ceti (lines 732–735) | six objects searched at the pin | one found (Isserlis, fourth moment), five not | C01 |

- Source locators checked against the text: 0 (no cited text could be read legally; the five books were asked for again and none is available).
- Library declarations opened at the pin: `TauCeti.gaussianHermiteHilbertBasis` (TauCeti/Probability/Distributions/Gaussian/Hermite/Basis.lean:138), `TauCeti.gaussianHermitePiBasis` (…/Hermite/Pi/Basis.lean:54), `TauCeti.hasSum_gaussianHermitePi_expansion` (…/Hermite/Pi/Parseval.lean:132), Isserlis' identity (…/Gaussian/MixedMoments.lean:160); the seventeen `#check` lines of the file all resolve.
- No isonormal process, Wiener chaos, Malliavin derivative, Mehler formula, Ornstein–Uhlenbeck semigroup, logarithmic Sobolev inequality or stochastic integral in the pinned Mathlib or Tau Ceti (searched by object).
- Cross-roadmap citations resolved on main: StochasticCalculus §1.3 (line 846), Layer 3, §6.1 (line 1923), Layer 8, Layer 9, the scope sentence on infinite-dimensional noise (line 3679); RandomMatrices §2.2 (line 318). OrnsteinUhlenbeckSemigroup read at its open head: its scope excludes Wiener chaos moment bounds and Malliavin calculus.
- Dependency check: `depcheck: 136 roadmaps, 1515 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration of `Suggested.lean`: no error, `sorry` the only warning. `#check @name` for all 74 declarations in a probe copy, compared with the README: no signature carries `CompleteSpace H` (R01); the Layer 3 definitions drop `[SigmaFinite μ]` (their types do not mention it, every theorem carries it).
- One-tactic probe (`rfl`, `simp` with the definitions unfolded) on the two statements changed since the previous head and on the sanity check of 6.4: none closes; the other statements are unchanged since the previous probe, where none closed.
- Pull request text against the head: 45 theorems, 45 `sorry`, 56 named headlines, 17 prose targets, imports and suppliers as described.

Overlap check: read OrnsteinUhlenbeckSemigroup (open), YoungIntegrationAndRoughPaths (open), StochasticCalculus and RandomMatrices (main); LawOfTheIteratedLogarithm, DysonBrownianMotion, MathematicalStatisticsNonparametric and BooleanFunctionAnalysis searched by object. Finite-dimensional Mehler kernel, generator and Nelson: OrnsteinUhlenbeckSemigroup. Finite-dimensional Poincaré and logarithmic Sobolev: RandomMatrices §2.2. Brownian exponential density and grid Hermite basis: StochasticCalculus §6.1. Chaos, multiple integrals, D, δ and the Wiener-space semigroup: this roadmap, no other owner.

Source independence: 0 passages compared with 0 sources (none of the five cited texts could be read); largest share Nualart 2006, about half of the locators; contents not compared, its table of contents could not be opened. The order derivative → divergence → semigroup is forced by the *Needs:* lines of §4.4 (§2.1), §5.1 (§4.2) and §6.2 (§§4.4, 5.1, 5.3).

Research link: Layers 4–6 are the prerequisites of the Malliavin–Stein method of Nourdin–Peccati (2012): the total-variation bound through ⟪DF, −DL⁻¹F⟫ and the fourth moment theorem; also of the Bouleau–Hirsch criterion and Hörmander's theorem (Nualart 2006, §§2.1, 2.3). Rests on the README's "Downstream consumers" and "Beyond this roadmap".

## Not verifiable

- Nualart 2006 (sampled locators of §§1.1–7.3): paywalled publisher; cited by locator only.
- Nourdin–Peccati 2012 (sampled locators of §§1.1–6.4): the publisher's page is not an open copy; no legal source found.
- Nualart–Nualart 2018 (sampled locators of §§3.2, 4.2–4.5, 5.3, 6.1–6.4, 7.1–7.3): the publisher's page is not an open copy; no legal source found.
- Bogachev 1998 (locators of §§2.1, 4.4, 4.5, 6.1, 6.4): the publisher's page is not an open copy; no legal source found.
- Da Prato 2014 (locators of §§1.1, 4.1–4.3, 5.2, 7.3): paywalled publisher; cited by locator only.
- Wording and arrangement against the sources: not checked, for the same reason.

Automatic checks set aside as false positives: the section comment at the end of `Suggested.lean` with no declaration under it introduces the `#check` lines that pin library names, which is an allowed use.

## Source issues

- none

## For the human reviewers

- Not tested: Nualart 2006 carries about half of the README's locators; neither its text nor its table of contents could be read, so wording and arrangement were not compared with it.
- Not tested: none of the five cited books (README lines 804–814) was readable from a legal place; every locator is unverified.
