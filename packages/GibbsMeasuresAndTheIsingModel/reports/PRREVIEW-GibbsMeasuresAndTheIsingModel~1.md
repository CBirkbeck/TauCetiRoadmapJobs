# Review of GibbsMeasuresAndTheIsingModel (pull request #2976 at 4e2bf57)

**Verdict:** needs changes

**Summary.** Changes are needed: three findings. Dobrushin's coefficient as defined in `Suggested.lean` compares the single-site kernels as measures on the whole configuration space, so it equals 1 for every pair `i ≠ j`; the oscillation bound is then false and Dobrushin's theorem vacuous. The ergodicity statement of 4.2 is false at `d = 0`, and the lattice Jordan-curve input of 5.2 is planned a second time beside BernoulliPercolation 6.1–6.2. There are four small corrections and three format notes, none blocking, and nothing is left for a human to decide.

## R01 (P1) — Dobrushin's coefficient is taken over events of the whole configuration, so it is 1 for all `i ≠ j`, which refutes the oscillation bound and empties Dobrushin's theorem

An implementer cannot prove `dobrushinCoeff_gibbsKernel_le`, and `existsUnique_isGibbs_of_dobrushin` asks for nothing. In `Suggested.lean` (lines 309–313) the supremum runs over all measurable `A ⊆ FullShift Γ I S`. The kernel `κ {i} ω` is carried by the configurations equal to `ω` off `i` (the README's own route in 2.2 says so), so for `ω, ω'` that differ at `j ≠ i` the event `A = {x : x(j) = ω(j)}` has `κ {i} ω A = 1` and `κ {i} ω' A = 0`. Hence `c_{ij} = 1` whenever `i ≠ j` and `S` has two elements. For the zero potential on `Bool` the right side of the oscillation bound is `ENNReal.ofReal (½ · 0) = 0`, while a scratch file proves `1 ≤ dobrushinCoeff (gibbsKernel Γ Φ₀) i j` against the built module (no `sorry`). With `c_{ij} = 1` the hypothesis `⨆ i, ∑' j, c_{ij} < 1` fails as soon as `I` has two sites. The README's Checks of Layer 3 (`tanh(2β)/2 = 0.18997` at `β = 0.2`) are computed for the law of the spin at `i`, which is also Friedli–Velenik's definition (text of the authors' revised version, lines 15143–15160: the kernel is read as a distribution of the spin at `i`); they contradict the Lean definition.

Smallest change: in `dobrushinCoeff` compare the laws of the spin at `i`, for instance `(κ {i} ω).map (fun x ↦ x.1 i)` on measurable subsets of `S` (or restrict `A` to events of the coordinate `i`), and in the first bullet of 3.1 (README line 268) say "the total variation distance of the laws of the spin at `i`". A Check that separates the two: for the zero potential the coefficient is 0.

## R02 (P2) — The ergodicity of the plus state is false at `d = 0`; it needs `d ≥ 1`

`IsPlusState.measure_eq_zero_or_one` (`Suggested.lean` lines 483–486) quantifies over every `d : ℕ`. At `d = 0` the lattice is one point, `translate a` is the identity (a scratch file proves `translate a ⁻¹' A = A` for every `A` at `d = 0`), no finite set is a nearest-neighbour pair, and the plus state is the Bernoulli law with `P(σ = +1) = e^h/(e^h + e^{−h})`, which is `0.8808` at `h = 1`. The event `plusAtOrigin 0` is measurable and invariant and has measure `0.8808`, neither 0 nor 1. The cited supplier excludes this case itself: DimerModelsAndLozengeTilings Layer 4 assumes an infinite group acting properly, and its Checks of 4.1 and 4.2 give the trivial group on one point as the counterexample.

Smallest change: add `0 < d` (or `[NeZero d]`) to the Lean statement and "for `d ≥ 1`" to the Ergodicity bullet of 4.2 (README line 374), with the one-point lattice as a negative-control Check. The other statements were tested at `d = 0` and hold there (uniqueness, `μ⁺ = μ⁻`, `β_c(0) = ⊤`).

## R03 (P2) — The lattice Jordan-curve input of 5.2 is planned again here, although BernoulliPercolation 6.1–6.2 states it for every graph on `ℤ²`

Two roadmaps would each formalise the enclosure of a finite cluster by a dual cycle. The route of 5.2 (README lines 459–470) takes as its geometric input "the Jordan curve theorem for closed simple curves in the dual lattice" with a combinatorial proof by the parity of crossings of a horizontal ray, and the scope section (lines 545–548) says the Ising contours share "only the path count" with BernoulliPercolation. At its head, BernoulliPercolation 6.1 defines the dual graph of `ℤ²` and "surrounds the origin" by exactly that ray parity, and 6.2 proves that a finite connected component of the origin in any graph `G` on `ℤ²` is surrounded by a cycle of dual edges crossing edges not in `G`. Applied to the graph of nearest-neighbour edges joining equal spins, with plus boundary condition and `σ_0 = −1`, the component of the origin is finite and 6.2 gives a dual cycle surrounding the origin all of whose crossed edges join unequal spins: the contour of 5.2. Its step 3 counts these cycles through the path count of its 5.1.

Smallest change: in the route and the *Needs:* line of 5.2 cite BernoulliPercolation 6.1–6.2 for the surrounding cycle and 5.1 for the path count, keep here what is specific to the Ising model (the interior of the cycle, the flip and the energy gain `e^{−2β|γ|}`), and replace "share only the path count" in the scope section by what is imported. If the author prefers to own the lattice Jordan input here, the scope section must say how it differs from BernoulliPercolation 6.2; as read, it does not.

## C01 — The Check of Layer 3 says the coefficient is attained where the other neighbours sum to "0 or ±1"; the sum is never 0, and at 0 the value would be different

In the first Check of Layer 3 (README lines 315–316) the other `2d − 1` neighbours of `i` have an odd sum `r`, and the coefficient is `max_r [tanh(β(r+1)) − tanh(β(r−1))]/2`, attained at `r = ±1` with value `tanh(2β)/2`. At `r = 0` the expression would be `tanh β`, which exceeds `tanh(2β)/2`. Write "sum to `±1`".

## C02 — The Summary states extremality as equivalent to short-range correlations, while the Lean file states one direction and does not say which prose targets it leaves out

The Summary (README lines 7–8) says an extremal Gibbs measure is "the same as" one with short-range correlations; `IsExtremalGibbs.decorrelation` is the forward direction only, and the converse is a prose target of 1.2. The converse is statable with the carriers already in the file. Either state it, or let the module docstring name the prose targets that are not stated (the converse of 1.2, the uniqueness of the decomposing measure in 1.3, the limit-point statement of 2.1, the contour estimate of 5.2) and say for each whether a carrier is missing.

## C03 — "the open HyperbolicDynamics roadmap" names no roadmap

In the scope section (README line 556) the roadmap meant is HyperbolicDynamicsAndThermodynamicFormalism (an open pull request, which takes its Gibbs measures from ClassicalErgodicTheory). Use its name.

## C04 — The Lean statements of 1.1 and 1.2 are wider than the README: they assume neither a countable `I` nor a finite `S`

The Conventions fix a countable `I` and a finite `S`, and the routes of 1.1–1.2 use an exhaustion, which exists only for countable `I`; the five Lean statements of 1.1–1.2 carry only `[Group Γ] [MulAction Γ I] [TopologicalSpace S] [MeasurableSpace S]` (the elaborated signatures were printed and compared). The first statement of 1.1 does survive an uncountable `I` (a density depends on countably many coordinates, and the argument runs on a countable set of coordinates closed under the versions `γ_Λ f`), but that is not the stated route and no cited source covers it. Add `[Countable I]` to match the README, or say in 1.1 that countability is not assumed and why.

## N01 — The last section header of `Suggested.lean`, "Names cited by the README", has only `#check` lines under it

A layer-style header with no declaration; a plain comment line above the `#check` block would do.

## N02 — "Its hard-core distribution on finite graphs (after the pin)" describes a library state later than the pin

In *From Tau Ceti* (README lines 586–587). The pinned Tau Ceti has no such declaration, so the sentence cannot be checked and will date; drop it or state the fact at the pin.

## N03 — "their midpoint is tail-trivial for neither" (last Check of Layer 1)

Tail triviality does not depend on a specification. The intended sentence is that the midpoint is Gibbs for neither specification and is not tail-trivial.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 densities and the tail | Bernoulli(1/2) on ℤ, `f = 2·1_{ω(0)=1}`; uncountable `I` | `f·μ` not Gibbs; countable-coordinate argument gives a tail version | true; Lean wider than README | C04 |
| 1.2 extremal ⇔ tail-trivial, decorrelation, singularity | `(μ⁺+μ⁻)/2` in `d = 2`; finite `I` | covariance → `½(p²+(1−p)²) − ¼ = m²/4`; tail trivial for finite `I` | true | C02 |
| 1.3 limits, decomposition | no Gibbs measure; `I = ∅` | zero kernel serves vacuously; one-point space | true; FV 6.63, 6.69, 6.72 state it without quasilocality | none |
| 2.1 existence, boundary insensitivity | finite `I`; `S` nonempty | `γ_I(·|ω)` constant, equals `μ` eventually | true | none |
| 2.2 potential, Hamiltonian, kernel | zero potential; `Λ = ∅`; one-site field `h = 1`; `Λ = {0}`, `d = 1` | uniform; `Z = 1`, Dirac; `0.8808`; `H(±) = ∓2β` | true | none |
| 3.1 Dobrushin coefficient | zero potential, `i ≠ j`, `S = Bool` | Lean: `c_{ij} ≥ 1`; bound claims `≤ 0` | false as defined | R01 |
| 3.1 Checks | `d = 2`, `β = 0.2`, `h ∈ {0, 0.3}` | `0.18997`, `0.19549`, `tanh 0.2 = 0.19738`; thresholds `0.125`, `0.2554`, `0.2747` | true for the spin marginal | C01 |
| 3.1 high temperature | Ising, `b = 2d` | `∑_j c_{ij} ≤ βb`, hypothesis `2βb < 1` | true (not sharp) | none |
| 3.2 one dimension | range `R`, bound `M`; unbounded `J_i` | boundary sets bounded uniformly in `n`; `∏ tanh J_i > 0` gives two measures | true; bound `M` needed | none |
| 4.1 FKG, Holley, volume | `2×2` box, `β = −1`, plus boundary | covariance `−0.08027` | true for `β ≥ 0`; control fails as stated | none |
| 4.2 plus state: existence, flip, bracketing, extremality | `d = 0`; `β = 0`, `h = 1` | Bernoulli `0.8808` at `d = 0`; flip needs `h ↦ −h` (`0.8808` vs `0.1192`) | true | none |
| 4.2 ergodicity | `d = 0` | all events invariant (Lean); `μ(σ = +1) = 0.8808` | false at `d = 0` | R02 |
| 4.3 uniqueness criterion, field monotonicity | `d = 0`; `d = 1` formula | `(1+tanh h)/2` monotone; `0.644531` (`n=1, β=0.7`), `0.195469` (`n=2, β=0.5`) | true | none |
| 5.1 uniqueness `d = 1`, `2d tanh|β| < 1` | `d = 0`; `β < 0` | `0 < 1`, unique; increment of `tanh(x)/2` over length `2|β|` is `≤ tanh|β|` | true | none |
| 5.2 Peierls bound and estimate | `n = 0`, `β = 0.9`; `β = 0.5` | `0.000746 ≤ δ(0.9) = 0.3986`; `3e^{−1} = 1.104`, series diverges | true | R03 (route) |
| 5.3 critical inverse temperature | `δ` at 0.80, 0.85, 0.88, 1.0; root | `1.2597`, `0.6937`, `0.4954`, `0.1428`; `δ = ½` at `0.87916` | true; `β_c(0) = ⊤` consistent | none |

- Source locators checked against the text: 34 in Friedli–Velenik (theorem, lemma, exercise and equation numbers, hypotheses), read in the authors' revised version of 22 August 2017.
- Library declarations opened at the pin: `fkg`, `holley`, `four_functions_theorem` (`Mathlib/Combinatorics/SetFamily/FourFunctions.lean` lines 370, 352, 303); `MeasureTheory.Filtration.cylinderEventsCompl` (`Mathlib/Probability/Process/Filtration.lean` line 534); `tendsto_ae_condExp_iInf` (`TauCeti/Probability/Martingale/Convergence.lean` line 174).
- Cross-roadmap citations resolved: DimerModelsAndLozengeTilings 4.1–4.6 on main (all six present, hypotheses read); the five local copies in `Suggested.lean` agree with that roadmap's declarations; ConstructiveFieldTheoryPhi4, BernoulliPercolation, MarkovChainMixing, SimulatedAnnealing, QuantumOptimization and HopfieldNetworks at their open heads.
- Dependency check: `depcheck: 150 roadmaps, 1717 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning; signatures of 12 declarations printed and compared with the README (C04).
- One-tactic probe (`rfl`, `simp`, `infer_instance`) on a scratch copy: none of the 32 theorems closes.
- The description's counts hold at the head: 41 named headlines, 32 theorems, a single `Mathlib` import.
- Overlap check: read ConstructiveFieldTheoryPhi4, BernoulliPercolation, HopfieldNetworks, SimulatedAnnealing, ClassicalErgodicTheory, DimerModelsAndLozengeTilings; shared: the surrounding dual cycle on `ℤ²` and its count, owner BernoulliPercolation 6.1–6.2 and 5.1 (R03); FKG for real spins stays with ConstructiveFieldTheoryPhi4 3.3, the kernel form with boundary conditions here.

Source independence: 18 passages compared with 1 source (Friedli–Velenik), none shared; largest share Friedli–Velenik, 52 of 64 locators; contents compared with Friedli–Velenik (Layer 1 ↔ §6.8, Layer 2 ↔ §§6.3.2, 6.4, Layer 3 ↔ §6.5, Layer 4 ↔ §§3.6, 6.8.3, Layer 5 ↔ §3.7): order and grouping differ, independent. Ruelle, Koralov–Sinai, Ellis and Grimmett were not read.

Research link: Layers 1–3 are the DLR theory of Dobrushin, Lanford and Ruelle as in Friedli–Velenik (2017), Chapter 6, and Ruelle (2004), Chapter 1; Layer 5 is Peierls' argument and `β_c(2) < 0.88` (Friedli–Velenik, §3.7). ConstructiveFieldTheoryPhi4 names Peierls-type phase transitions as a consumer of its layers. Rests on the README and the text read.

## Not verifiable

- The printed page numbers of Friedli–Velenik: the legal copy read is the authors' revised version, whose pagination differs from the printed book; theorem and equation numbers agree.
- Ruelle, *Thermodynamic Formalism*, Theorems 1.9, 1.11 and Exercise 3: no legal copy found; cited as second locators only.
- Koralov–Sinai, Theorems 22.3, 22.4 and Lemma 22.5, and Ellis, Theorem V.5.1 and Lemma V.5.2: no legal copy found; second locators only.
- Grimmett, *Probability on Graphs*, Theorem 4.4: the author's page could not be read (certificate failure); the Holley inequality used is Mathlib's `holley`, opened at the pin.
- The formula on p. 125 of Friedli–Velenik for the one-dimensional magnetization was not located; its two numerical values were recomputed.

Automatic checks set aside as false positives: the TeX-subscript scanner flagged the Hamiltonian formula of 2.2, which lies inside an inline code span that wraps over a line break; the dropped-name scanner flagged PointProcesses in a sentence of the scope section saying that roadmap is a different notion and is not used.

## Source issues

- **Error** in Friedli–Velenik, *Statistical Mechanics of Lattice Systems* (2017) at Corollary 6.41, p. 295: the source says every finite-range potential on ℤ has a unique Gibbs measure; it should be assumed uniformly bounded (or translation invariant), since nearest-neighbour couplings `J_i` with `∑ e^{−2J_i} < ∞` give two; affects a stated result.

## For the human reviewers

- none
