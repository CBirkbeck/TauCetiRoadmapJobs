# Review of HopfieldNetworks (pull request #2955 at 163f10d)

**Verdict:** needs changes

**Summary.** Needs changes, for two false sentences in Checks; every stated theorem, definition and route survived the computed pass, and all source locators agree with the texts. The Check of 2.1 says the bound `2ⁿ − 1` is not attained in small cases, but it is attained for `n = 1` (by the Check's own numbers) and for `n = 2`; the brute-force Check of 1.3 gives the energy drop with the wrong sign. There are no small corrections and two format notes; the scope question (a machine-learning subject whose binary-layer theorems carry no refereed locator) is left to the human reviewers.

## R01 (P2) — The Check of 2.1 says the bound `2ⁿ − 1` is not attained in small cases, but it is attained for `n = 1` and for `n = 2`

A reader takes from "The bound is not attained in small cases" (first Check of 2.1, line 174) that `2ⁿ − 1` is not sharp, and an implementer may look for a better bound that does not exist for `n ≤ 2`. The Check's own numbers contradict its opening: for `n = 1` it reports `1` change against the bound `1`. For `n = 2` the bound is attained just outside the range searched: off-diagonal weights `−1`, zero diagonal, `θ = (0, −2)`, initial spins `(1, 1)`, schedule `1, 2, 1`. The fields met are `h_1 = −1`, `h_2 = −1`, `h_1 = 1`, each against the spin, so all three updates flip, through `(−1, 1)`, `(−1, −1)`, `(1, −1)`, with energies `s_1 s_2 + 2 s_2 = 3, 1, −1, −3`: three changes, which is `2² − 1`. I reproduced the stated values `1, 2, 4` in the stated range; with zero diagonal, entries in `{−2, …, 2}` and thresholds in `{−4, …, 4}` the maximum is `3` for `n = 2` and `6` for `n = 3`.

The smallest repair is to change the opening to what the search shows, for instance: "The bound is attained for `n = 1` and `n = 2` (two units, off-diagonal `−1`, `θ = (0, −2)`, spins `(1, 1)`, schedule `1, 2, 1`: energies `3, 1, −1, −3`); in the range searched below the largest number of changes is `1, 2, 4` against `1, 3, 7`."

## R02 (P2) — The brute-force Check of 1.3 states the energy drop with the wrong sign

The third Check of 1.3 (lines 146–147) says every changing update "lowers the energy by exactly `2 s_i h_i − 2 W i i > 0`". That quantity is the change of the energy and is negative: the design note (line 76) and the route of 1.3 (line 131) both say so, since a changing update has `s_i h_i < 0` and `W i i ≥ 0`. On the two-unit example of Layer 1 (spins `(1, −1)`, unit 1 updated): `s_1 h_1 = −1`, the expression is `−2`, and the energy goes from `1` to `−1`. Over all symmetric matrices with entries in `{−2, …, 2}`, nonnegative diagonal, `θ ∈ {−1, 0, 1}ⁿ`, `n ≤ 3`, the energy difference after a changing update equals `2 s_i h_i − 2 W i i` and is negative in every case.

Write "changes the energy by exactly `2 s_i h_i − 2 W i i < 0`", or "lowers the energy by exactly `2 W i i − 2 s_i h_i > 0`".

## N01 — The period-two theorem of 3.1 and the descent of 1.3 are attributed without a locator

3.1 says the theorem "is due to Goles and coauthors" and the References list Hopfield and Goles "without a locator", so a reader cannot compare the statement (symmetric weights, any diagonal, any thresholds, the keep-on-tie rule) with a published one. The route given is complete and checks out, so nothing depends on it; a bibliographic entry with the theorem number for 3.1, once the paper has been opened, would close the gap.

## N02 — `IsStable` is also the name of a root declaration of Mathlib

Mathlib's `IsStable` (`Mathlib/Order/Monotone/Defs.lean`, line 116) is a different notion, on functions of a preorder. Inside the roadmap's namespace the name resolves to the roadmap's definition (the file elaborates), but a file that opens the namespace sees both. A more specific name would avoid it; this is offered, not required.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 flip formula, energy | one unit `W=(w)`, `θ=t`; two units off-diagonal 1 | `E = −w/2 − ts`; flip gives `2ts` both ways; `E = −s₁s₂ = ∓1` | holds | none |
| 1.2 update, stability | `W=0, θ=1`; `W=0, θ=0`, spin −1; `(false,true)` two units | spin 1 stable, −1 not; keep rule does nothing; sync gives `(true,false)` from fields `(−1,1)` | holds | none |
| 1.3 energy descent | all symmetric `{−2..2}`, diag ≥ 0, `θ∈{−1,0,1}ⁿ`, `n ≤ 3`; `W12=1, W21=−1`; `W=(−1)` | change `= 2s_ih_i − 2W_ii < 0` always; asymmetric: `E ≡ 0`, 4-cycle; `W=(−1)`: `E ≡ ½`, flips forever | theorem holds; Check has wrong sign | R02 |
| 2.1 at most `2ⁿ − 1` changes | exact longest chains, entries `{−1,0,1,2}`; wider thresholds; `n = 0` | `1, 2, 4` for `n = 1, 2, 3`; `n = 2`, `θ=(0,−2)`: 3 changes; `n=0` no schedule, vacuous | theorem holds; Check's opening false | R01 |
| 2.2 convergence under fairness | `W=0, θ=(1,1)`, only unit 1 updated; the two examples of 1.3 | stops at `(1,−1)`, unit 2 field 1 unstable; fair schedules never settle without hypotheses | holds | none |
| 3.1 period one or two | all symmetric `{−2..2}`, `n ≤ 3`; zero-diagonal `{−1,0,1}`, `n = 4`; 3-cycle weights; `W=(−1)` | every orbit period ≤ 2 after `2ⁿ` steps; rotation has period 3; `W=(−1)` period 2; `L(t+1)−L(t) = −Σ(0 or 2\|h'\|)` | holds | none |
| 4.1 alignment margin | all subsets of Hadamard rows, orders 2, 4, 8; `p = 1`; `p = n`; non-orthogonal triple | 2099232 cases, 0 violations, 21548 equalities; `p=1`: `n−2d−1`; `p=n`: `W=0`, `−2nd ≤ 0`; triple: fields `(3,3,3,1)`, `−1 < 1` | holds | none |
| 4.2 retrieval | same exhaustive set with `p(2d+1) < n`; `p = n = 4`, `d = 1`; `p = 0` | synchronous retrieval in every case; `W = 0` leaves `x` fixed; `Fin 0` has no `ν`, vacuous | holds | none |
| 5.1 energy, update, lower bound | patterns `1, −1`; `N = 0`; `N = 1` | `f = tanh(βξ)`, `E = −β⁻¹ log cosh βξ + ξ²/2 + ½`; `N=0`: `E = ‖ξ‖²/2`, `f = 0`; `N=1`: `E = ½‖ξ−x‖²` | holds | none |
| 5.2 derivative | `β = 0`, patterns `1, 0`; `N = 0`; patterns `1, −1` | junk energy `ξ²/2 + ½`, derivative `ξ` against stated `ξ − ½`; `N=0`: `⟪ξ,·⟫` both sides; `ξ − tanh βξ` | holds, `β ≠ 0` needed | none |
| 5.3 descent with quadratic gain | `N = 1`; `N = 0`; `β = −1`, `ξ = 1`; `β = 0`, `ξ = 0`, patterns `1, 0` | equality `½‖x−ξ‖²`; `0 + ‖ξ‖²/2 = ‖ξ‖²/2`; left `> 3/2 >` right; `¾ > ½` | holds, `β > 0` needed | none |
| 5.4 global convergence (both) | `β = 0`; `N = 0`; `β = −3`, patterns `±1`; `β = 3` | `f` constant, cluster set one fixed point; iterates `0` from `t = 1`; orbit `a ↔ −a`, `e^5.94 ≈ 380 > 199`; `E''(0) = −2` | holds | none |
| 5.5 one-step retrieval | patterns `±1`, `ξ = 1`, `β = 3`; `N = 1`; `β = −1`, patterns `1, 0`, `ξ = −3` | `0.0049452 ≤ 0.0049575`; `0 ≤ 0`; `1/(1+e³) ≈ 0.047 > 2e⁻⁷ ≈ 0.0018` | holds, `β ≥ 0` needed | none |
| 5.6 stored patterns | `±1`, `β=3`, `r=0.2`; ten orthonormal, `β=10`, `r=0.1`; `r=0`; `β=0`; `N=1`; `β=−1` | `ε=e^−4.8`, `L=12ε≈0.099`; `18e⁻⁸≈0.006`, `L≈0.12`; `tanh 3 ≠ 1`; `β=0`: `L=0`, mean within `r`; `L=0`, `z=X i`; `L<0` | holds; Jacobian bound `β Σ p_j‖X j − X i‖² ≤ L` rederived | none |
| Conventions: spin, tie rule, `W + εI` | field 0; `h ≠ 0` with `ε < \|h\|` | `h' = εs`, sign of the spin; `h'` keeps the sign of `h` | holds | none |
| Scope: 5.3 not an instance of sufficient decrease | patterns `±1`, `β = 3` | `E''(0) = 1 − β = −2`, so the gradient is not 1-Lipschitz | holds | none |

- Source locators checked against the text: 15 in RAMSAUER20 (lines 117–161, 170–173, 197–217, 677–678, 809–836, 892, 932–937, 2733–3302, 3332–3337, 3404–3406) and 5 in MACKAY03 (lines 36455–36460, 36502–36508, 36532–36600, 37365–37368, 37373–37376); all agree, with the printed pages as cited.
- Library declarations opened at the pins: 13 in Mathlib (`Matrix.IsSymm.apply` Symmetric.lean:50, `hammingDist` Hamming.lean:41, `hammingDist_le_card_fintype` :113, `ConvexOn.map_sum_le` Jensen.lean:66, `convexOn_exp` SpecificFunctions/Basic.lean:62, `HasFDerivAt.log` Log/Deriv.lean:150, `Set.Finite.isCompact_convexHull` Convex/Topology.lean:367, `IsCompact.exists_mapClusterPt` Compact.lean:42, `IsCompact.tendsto_nhds_of_unique_mapClusterPt` :180, `Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le` MeanValue.lean:423, `ContractingWith.exists_fixedPoint'` Contracting.lean:154, `IsCompact.isComplete` Cauchy.lean:734, `IsStable` Order/Monotone/Defs.lean:116) and 2 in Tau Ceti (`Finset.log_sum_exp_eq_add_log_sum_exp_sub` SumExp.lean:32, `Finset.sum_exp_sub_sup'_le_card` :45). No Hopfield, Hebbian or softmax-update declaration at either pin.
- Cross-roadmap citations resolved at the open heads: QuantumOptimization 1.1 (`spin`, `ising`: bodies identical to the copies), MarkovChainMixing 6.1, SimulatedAnnealing 3.1, PotentialGamesAndPriceOfAnarchy 1.2 (`hasFiniteImprovementProperty_iff`), FirstOrderOptimization 1.1, PolicyGradientMethods 3.1, OnlineLearningAndLittlestoneDimension Layer 3, UniversalApproximation: 8 of 8 found.
- Dependency check: `depcheck: 170 roadmaps, 1983 edges, 0 problem(s)`; no UPWARD or CYCLE line. The only supplier roadmap is QuantumOptimization, an open pull request that adds a new folder, named in the description.
- Elaboration: `Suggested.lean` elaborates with twelve `sorry` warnings and nothing else. One-tactic probe (`rfl`, `simp`, `infer_instance`, `decide`, `simp` with the definitions unfolded) on a separate copy of the file: all twelve theorems stay open; no padding.
- Elaborated types compared with the README statements for all 24 declarations: `spin` and `hebb` do not carry `[Fintype ι]`, `patternRadius` does not carry `[InnerProductSpace ℝ E]`; none of the three uses the dropped instance, and every theorem carries its hypotheses in its own signature. Nothing changed.
- Headline theorems (1.3, 2.1, 2.2, 3.1, 4.1, 4.2, 5.2, 5.3, 5.4 twice, 5.5, 5.6): all twelve are stated in `Suggested.lean` at the README's generality.
- Pull request text read against the head: title, the counts (12 theorems, 12 definitions), suppliers and locators agree with the head; no change outside the folder.

Overlap check: read QuantumOptimization, ConstructiveFieldTheoryPhi4; spins of a Boolean configuration and the Ising energy are shared with QuantumOptimization, owner QuantumOptimization 1.1 (cited and copied by declaration here); nothing shared with ConstructiveFieldTheoryPhi4 (random lattice fields and their Gibbs measures, no deterministic dynamics). No roadmap on main or open plans Hopfield dynamics, Hebbian weights or the modern update.

Source independence: 25 passages compared with 2 sources (20 locators and 5 further passages: the tie rule, the lower bound of 5.1, the routes of 5.3 and 5.4, the statement of 5.6), none shared beyond formulas; largest share RAMSAUER20, 15 of 20 locators; contents compared with RAMSAUER20: independent (Layers 1–4 are not in it; 5.2 has no counterpart; 5.5 and 5.6 reverse its Theorems 4 and 5; its Theorem 3 is excluded; the order 5.3 → 5.4 and 5.5 → 5.6 is forced by the Needs lines).

Research link: Layer 5 states and sharpens Theorems 1, 2, 4 and 5 of Ramsauer et al. (arXiv 2020, ICLR 2021) on the modern Hopfield network, the model behind attention layers; Layers 1–4 are the classical convergence results the README attributes to Hopfield and to Goles and coauthors. Rests on the README and on RAMSAUER20 pp. 3–4.

## Not verifiable

- The attributions to Hopfield and to Goles and coauthors: the README gives no locator and neither text was opened; nothing in the roadmap depends on them.
- The Check of 2.2 on round-robin schedules of length `n · 2ⁿ + n` was not rerun; it follows from 2.1 (at most `2ⁿ − 1` of the `2ⁿ + 1` sweeps contain a change).

## Source issues

- **Misprint** in RAMSAUER20 at the proof of Theorem A9, eq. (405), printed page 57: the source bounds ε by a quantity carrying a factor `M`; it should be `ε ≤ e (N − 1) exp(−β Δ_i)`, without `M`, as eqs. (402)–(404) require; affects nothing.

## For the human reviewers

- **Scope.** The subject is the theory of neural associative memories. The sources are an ICLR 2021 paper (RAMSAUER20) and a textbook chapter (MACKAY03); the six binary-layer theorems (1.3 to 4.2) carry proof routes and no refereed locator (README References, last entry).
- **Licence.** MACKAY03 was read on the author's page; each page is marked on-screen viewing only (MACKAY03 line 5). The README takes from it locators and two two-neuron counterexamples (Checks of 1.3 and 3.1), restated with a citation.
- **Not tested.** `Suggested.lean` was not compared with public Lean formalisations of Hopfield networks; none was opened. The description says no outside formalisation was used.
