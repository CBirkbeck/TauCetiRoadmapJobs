# Review of GibbsMeasuresAndTheIsingModel (pull request #2976 at 888dbad)

**Verdict:** needs changes

**Summary.** Changes are needed, for one finding: the proof route of 3.2 says that the kernels of an interval for two boundary conditions are mutually absolutely continuous, whereas they are mutually singular as soon as the boundary conditions differ; the bound holds only for events of the spins inside the interval. All three findings of the previous review are repaired, and every stated theorem survived the recomputation. There are three small corrections and three format notes, none blocking; the printed page numbers and the four secondary books could not be read and are listed for the human reviewers.

## R01 (P2) — In the route of 3.2 the kernels `γ_{[−n,n]}(·|ω)` and `γ_{[−n,n]}(·|ω')` are called mutually absolutely continuous; they are mutually singular when `ω ≠ ω'` off the interval

An implementer who formalises the first sentence of the route of 3.2 (README line 314) sets out to prove a false lemma. The sentence reads "The bound `D` makes `γ_{[−n,n]}(·|ω)` and `γ_{[−n,n]}(·|ω')` mutually absolutely continuous with densities in `[e^{−2D}, e^{2D}]`". By the README's own 2.2 (line 246) the kernel at `ω` is carried by the configurations equal to `ω` off `Λ`. Take the zero potential (`D = 0`), `n = 0`, `ω` all plus and `ω'` all minus: the event `{x : x(1) = +1}` has probability `1` under the first kernel and `0` under the second. The source states less: Friedli–Velenik, Lemma 6.43, gives `e^{−2D} γ_{B(n)}(C|η) ≤ γ_{B(n)}(C|ω) ≤ e^{2D} γ_{B(n)}(C|η)` for a cylinder event `C` and all `n` large enough that the box contains the base of `C` (FriedliVelenik2017 lines 15618–15635).

Smallest change: "The bound `D` gives, for every cylinder event `C` and every `n` such that `[−n, n]` contains the base of `C`, `e^{−2D} γ_{[−n,n]}(C|ω') ≤ γ_{[−n,n]}(C|ω) ≤ e^{2D} γ_{[−n,n]}(C|ω')`". The rest of the route then goes through as written: by 1.3 the two sides converge to `μ(C)` and `ν(C)` for suitable `ω, ω'`, so `μ ≤ e^{2D} ν` on cylinder events, hence on all events, and two distinct extremal measures would not be singular.

## C01 — The almost-sure extremality of the kernel in 1.3 is Friedli–Velenik's Proposition 6.70, which is not cited; Corollary 6.71 is the non-emptiness of the extremal set

In the extremal-decomposition bullet of 1.3 (README lines 170–172) the kernel form is attributed to "Proposition 6.69, p. 315, and Corollary 6.71, p. 317". Proposition 6.69 gives the kernel, its tail measurability, the identity `μ(f | 𝓣) = Q·(f)` and that `Q·` is Gibbs almost surely. The conclusion "`Q ω` is extremal for `μ`-almost every `ω`" is Proposition 6.70 (FriedliVelenik2017 line 16619); Corollary 6.71 (line 16621) says only that the extremal set is non-empty when a Gibbs measure exists. Cite Proposition 6.70 for the extremality; Corollary 6.71 may stay for the fixed extremal measure used off the good set.

## C02 — The finite-range bullet of 3.2 bounds the right side of (6.55) by `2M` times the sets crossing one boundary point; an interval has two ends

In the second bullet of 3.2 (README lines 310–312), "at most `2M` times the number of sets of diameter at most `R` that cross a given boundary point" is half the true bound. For the nearest-neighbour chain (`R = 1`, `M = β`) the sets meeting `[−n, n]` and its complement are the two bonds `{−n−1, −n}` and `{n, n+1}`, the right side of (6.55) is `2(β + β) = 4β`, and one boundary point is crossed by one set, which gives `2β`. Write "`4M` times", or "`2M` times the number of such sets that cross one of the two boundary points". Any constant independent of `n` serves the theorem.

## C03 — The contracts consume DimerModelsAndLozengeTilings 4.4, 4.5 and 4.6(a), (c) for an arbitrary action, while that roadmap's Layer 4 stands under "`Γ` countable infinite, acting properly"

The Conventions say "outside 4.2 any `Γ` may be used" (README line 74), and the Lean statements of Layers 1–3 carry only `[Group Γ] [MulAction Γ I]`. The supplier's Layer 4 opens with "Throughout this layer `Γ` is a countable infinite group acting on a countable set `I`, and the action is proper", and its Lean statements of 4.6(b) carry these hypotheses explicitly. So the compactness of 4.4, the conditional-expectation form and convexity of 4.5, and 4.6(a), (c) are supplied, as written there, only for such actions, while 1.1–3.1 need them for every `Γ` (the trivial group included, and `d = 0` in Layer 4). None of the four uses the action, so nothing stated here is at risk; but the contract does not say what is assumed. Add one sentence to the contract of §§4.4–4.6: these items are consumed for an arbitrary action, which their proofs allow since `Γ` does not enter them, and only §4.2 and §4.6(b) are consumed under the supplier's standing hypotheses (met by `ℤ^d` acting on itself for `d ≥ 1`).

## N01 — One "(an open pull request, …)" is left, in the scope paragraph on ConstructiveFieldTheoryPhi4 (README line 569)

The other occurrences were removed; this one will date in the same way.

## N02 — In the route of 4.3 (README line 413) "`μ⁺(σ_A) ≥ μ⁻(σ_A)` for every nondecreasing `n_A`" names two different functions

The inequality meant is `μ⁺(n_A) ≥ μ⁻(n_A)`; `σ_A = ∏ σ_i` is not monotone.

## N03 — The last Check of Layer 1 needs `I` infinite

For a finite `I` the tail σ-algebra is trivial and the midpoint of two product measures is tail-trivial; "for infinite `I`" in the sentence settles it.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 densities and the tail (two theorems) | `I` finite; `I = ∅`; Bern(½) on ℤ, `f = 2·1_{ω(0)=1}` | tail trivial for finite `I`, unique Gibbs measure, `f` constant; `f·μ` has `ω(0) = 1` a.s., not Gibbs | true; `[Countable I]` in scope | none |
| 1.2 extremal ⇔ tail-trivial; decorrelation and converse; singularity | `(μ⁺+μ⁻)/2`, `d = 2`; `A = B = T` tail | covariance `→ m²/4 > 0`; `|μ(T) − μ(T)²| ≤ ε` for all `ε` forces `μ(T) ∈ {0,1}` | true; source items 1–4 of Theorem 6.58 match | none |
| 1.3 a.s. limits; decomposition | no Gibbs measure; empty configuration space; any exhaustion | zero kernel serves vacuously; `⋂ 𝓕_{Λ_nᶜ}` is the tail for every exhaustion | true; source has one kernel for all `μ` | C01 (locator) |
| 2.1 existence; boundary insensitivity | `S = ∅`; `I` finite; `I = ∅` | `S = ∅`, `I ≠ ∅`: no probability measure, so `[Nonempty S]` needed and present; finite `I`: `γ_I` constant | true | none |
| 2.2 potential, Hamiltonian, kernel, specification | zero potential; `Λ = ∅`; field `h = 1`; `Λ = {0}`, `d = 1`, plus | uniform; `H = 0`, `Z = 1`, Dirac at `ω`; `0.8808` (sign error `0.1192`); `H(±) = ∓2β` | true; tsum is a finite sum under summability | none |
| 3.1 Dobrushin coefficient (definition) | zero potential; `i = j`; Ising `d = 2`, `β = 0.2`, `h ∈ {0, 0.3}` | `0`; `0` (kernel is exterior-measurable); `0.189974`, `0.195490`, bound `tanh 0.2 = 0.197375` | determines the spin marginal; whole-configuration variant gives `1` | none |
| 3.1 Dobrushin theorem; oscillation bound; high temperature | Ising `b = 2d`; `I = ∅`; midpoint in the dusting lemma | `∑_j c_{ij} ≤ βb < ½`; sup over `∅` is `0 < 1`, one-point space; `max|f − m| ≤ δ_j(f)/2` | true at `sup_A` normalisation; tilt bound `tanh(r/4)`, `r ≤ 2∑δ` | none |
| 3.1 thresholds | `d = 2` | `0.125`, `artanh ¼ = 0.25541`, `½ artanh ½ = 0.27465` | match | none |
| 3.2 bounded boundary; finite range | chain `J_i`, `∑ e^{−2J_i} < ∞`; zero potential, `n = 0`, `ω = +`, `ω' = −`; nearest-neighbour chain | `⟨σ_0⟩^± = ±(a+b)/(1+ab) ≠ 0`; kernels give `{x(1)=+}` mass `1` and `0`; (6.55) is `4β`, text gives `2β` | theorems true, `M` needed; route sentence false | R01, C02 |
| 4.1 FKG, boundary and volume monotonicity | `Λ = ∅`; `β = −1` on `2×2`, plus boundary | `f(ω)g(ω) ≤ f(ω)g(ω)`; covariance `−0.080273` | true for `β ≥ 0`; `Antitone` is the right direction for `true = −1` | none |
| 4.2 plus state: existence, flip, bracketing, extremality, ergodicity | `d = 0`; `β = 0`, `h = 1` | `d = 0`: law `0.8808`, every event invariant, so `[NeZero d]` needed and present; flip needs `h ↦ −h` (`0.8808` / `0.1192`) | true | none |
| 4.3 uniqueness criterion; field monotonicity | `d = 0`; `d = 1` finite volume | `μ⁺ = μ⁻`, unique; `0.644531` (`n=1`, `β=0.7`), `0.195469` (`n=2`, `β=0.5`) from `2t^{n+1}/(1+t^{2n+2})` | true | N02 (wording) |
| 5.1 `d = 1` for all real `β`; `2d tanh|β| < 1` | `β < 0`; `d = 0` | `M = |β| + |h|`, range 1; largest increment of `tanh(x)/2` over length `2|β|` is `tanh|β|`; `0 < 1` | true | none |
| 5.2 Peierls bound, estimate, magnetization | `n = 0`, `β = 0.9`; `β = 0.5`; junk value of the series | `0.000746 ≤ δ(0.9) = 0.3986`; `3e^{−1} = 1.1036`, divergent, tsum `0`, so `3e^{−2β} < 1` needed and present | true; cycle of length `k` gives a path of length `k−1`, count `≤ (k/2)·4·3^{k−1}` | none |
| 5.3 `β_c`: lower bound, `0 < β_c(2) ≤ 0.88`, `β_c(1) = ⊤` | `δ` at 0.80, 0.85, 0.88, 1.0; `d = 0` | `1.2597`, `0.6937`, `0.4954`, `0.1428`; `β_c(0) = ⊤`, consistent with the lower bound | true; definition agrees with the source's by its Theorem 3.28 | none |
| Conventions: translation, order on `Bool` | `g = ofAdd(−a)` | `(g • ω)(i) = ω(g⁻¹ • i) = ω(i + a)`; all-minus is the top | match | none |
| Layer 1 Checks | finite `I` | tail trivial, midpoint tail-trivial | last Check needs infinite `I` | N03 |

- Source locators checked against the text: 41 in Friedli–Velenik (statement, hypotheses, theorem and equation numbers), read in the authors' revised version of 22 August 2017; one locator misses its proposition (C01).
- Library declarations opened at the pin: `fkg`, `holley`, `four_functions_theorem` (`Mathlib/Combinatorics/SetFamily/FourFunctions.lean` lines 370, 352, 303); `MeasureTheory.tendsto_ae_condExp_iInf` (`TauCeti/Probability/Martingale/Convergence.lean` line 174, finite measure, antitone family, no integrability hypothesis); no specification, Gibbs measure or Ising model in either library.
- Cross-roadmap citations resolved: DimerModelsAndLozengeTilings 4.1–4.6 on main (the five local copies agree with its `Suggested.lean`, lines 265–316); BernoulliPercolation 5.1, 6.1, 6.2 at its open head; ConstructiveFieldTheoryPhi4 2.1, 3.1, 3.3, Layers 4–5; MarkovChainMixing 6.1; SimulatedAnnealing 1.2, 3.1; QuantumOptimization 1.1 (`true` is spin `−1`); HopfieldNetworks.
- Earlier findings: R01 (coefficient over events of the spin at `i`), R02 (`d ≥ 1` in the ergodicity), R03 (surrounding cycle imported from BernoulliPercolation) repaired; C01–C04 and N01–N03 applied.
- Dependency check: `depcheck: 136 roadmaps, 1515 edges, 0 problem(s)`; no UPWARD or CYCLE line. BernoulliPercolation is an open pull request that adds a new roadmap, named in the description.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (33); the elaborated signatures of 14 declarations with section hypotheses were printed and compared with the README, no difference. One-tactic probe (`rfl`, `simp`, `infer_instance`) on a scratch copy: none of the 33 theorems closes.
- The description's counts hold at the head (42 named headlines, 33 theorems, a single `Mathlib` import); nothing changes outside the folder.
- Overlap check: read CurieWeissModel, ConstructiveFieldTheoryPhi4, BernoulliPercolation, GlauberDynamicsOfTheIsingModel, RestrictedBoltzmannMachines, DimerModelsAndLozengeTilings; shared: the surrounding dual cycle and the path count, owner BernoulliPercolation 6.1–6.2 and 5.1, cited here; specifications and the tail σ-algebra, owner DimerModelsAndLozengeTilings Layer 4, cited here. The Ising law of a finite graph without boundary condition (GlauberDynamicsOfTheIsingModel 1.1) and FKG for real spins (ConstructiveFieldTheoryPhi4 3.3) are other objects than the kernels with boundary conditions of 4.1.

Source independence: 30 passages compared with 1 source (Friedli–Velenik), none shared beyond forced statements; largest share Friedli–Velenik, 54 of 66 locators; contents compared with Friedli–Velenik (Layer 1 ↔ §§6.8.1, 6.8.2, 6.8.4; Layer 2 ↔ §§6.3.2, 6.4.3, 6.5.1; Layer 3 ↔ §§6.5.2, 6.5.3, 6.5.5; Layer 4 ↔ §§3.6.2–3.6.3, 6.8.3, 3.7.1; Layer 5 ↔ §§3.7.2–3.7.3): order and grouping differ, independent. Ruelle, Koralov–Sinai, Ellis and Grimmett could not be read.

Research link: Layers 1–3 are the Dobrushin–Lanford–Ruelle theory of Gibbs measures as in Friedli–Velenik (2017), Chapter 6, and Ruelle (2004), Chapter 1; Layer 5 is Peierls' argument (Friedli–Velenik §3.7). ConstructiveFieldTheoryPhi4 names Peierls-type phase transitions as building on its layers. Rests on the README and the text read.

## Not verifiable

- The printed page numbers of Friedli–Velenik: the copy read is the authors' revised version, whose pagination differs from the printed book; theorem, exercise and equation numbers agree.
- Ruelle, *Thermodynamic Formalism*, Theorems 1.9, 1.11 and Exercise 3 of Chapter 1: the publisher's page is closed and no open copy was found; second locators only.
- Koralov–Sinai, Theorems 22.3, 22.4 and Lemma 22.5, and Ellis, Theorem V.5.1 and Lemma V.5.2: paywalled; second locators only.
- Grimmett, *Probability on Graphs*, Theorem 4.4: the publisher's page is closed and the author's page could not be confirmed as such; the Holley inequality used is Mathlib's `holley`, opened at the pin.

Automatic checks set aside as false positives: the scanner for TeX subscripts flagged the Hamiltonian formula of 2.2, which lies inside an inline code span that wraps over a line break; the scanner for names that may not be cited as suppliers flagged PointProcesses in a sentence of the scope section that says that roadmap's notion is a different one and is not used.

## Source issues

- **Error** in Friedli–Velenik, *Statistical Mechanics of Lattice Systems* (2017) at Corollary 6.41, Section 6.5.5: the source says every finite-range potential on ℤ has a unique Gibbs measure; it should be assumed uniformly bounded (or translation invariant), since nearest-neighbour couplings `J_i` with `∑ e^{−2J_i} < ∞` give two; affects a stated result.

## For the human reviewers

- Not tested: the page numbers of the 54 Friedli–Velenik locators refer to the printed book; only the authors' revised version (other pagination) was read, so numbers of theorems and equations are checked and pages are not.
- Licence: the README's *Prior formalization* names the GibbsMeasure project (Apache 2.0) as having the same shape of `Specification`; the copies here are those of DimerModelsAndLozengeTilings on main. That repository was not opened in this review.
