# Review of SchattenClassesAndSchurMultipliers (pull request #2421 at 1bd5565)

**Verdict:** accepted

**Summary.** Accepted: no finding. The folder is unchanged since the previous review of this head, and this round read the pull request's title and description against it: every sentence of the description agrees with the head, and the one small correction of the previous review (BochnerSpaces described as open, its §7.5 as consumed) is repaired there. One format note is carried over, not blocking. Three points are left for the human reviewers, as before.

## N01 — The Check of §7.3 still states Conjecture 1.8 of the source more weakly than the source does

Lines 1380–1382 say the source "conjectures that one exists" (a multiplier whose norm and completely bounded norm differ) on `S_p(ℓ²)`; lafforgue-delasalle-2011 lines 281–282 conjecture multipliers that are bounded and not completely bounded. "conjectures that bounded, not completely bounded ones exist" would match.

## Previous findings

The previous report (of this same head) had no finding; its small correction and its format note are accounted for here.

- C01 — repaired: the description now reads "BochnerSpaces (§4.2, §7.4)" among the roadmaps consumed on main and "Sierpiński's theorem for atomless measures on an arbitrary measurable space is proved in §7.1"; no mention of §7.5 remains.
- N01 — not repaired: "conjectures that one exists on `S_p(ℓ²)`" stands at lines 1380–1382; written again as N01 above.

## Verified sound

The folder changed by 0 lines, so no statement changed; the rows below are for statements the description (the text checked this round) cites.

| Target | Instance | Left side | Right side | Result |
|---|---|---|---|---|
| Isometry on `S₂` and its failure on `S_∞` (description; README opening) | symbol `[[1,1],[0,1]]` on `2 × 2` matrices | `S₂`: `max|M_ij| = 1`. `S_∞`: search over 2·10⁶ real matrices gives ratio `1.15367`, never above | `2/√3 = 1.15470` | consistent with the stated values `1` and `2/√3` |
| Schur product theorem, norm `max_j M(j, j)` (description) | `M = [[2,1],[1,1]]`, positive semidefinite (`det = 1`, trace `3`) | `S_M(1) = diag(2,1)`, norm `2`, so `‖S_M‖_∞ ≥ 2`; `S₂`: `max|M_ij| = 2` | Gram factorisation `M_ij = ⟨ξ_i, ξ_j⟩`, `max ‖ξ_i‖² = 2`, so `‖S_M‖_∞ ≤ 2` | `2 = 2` at `p = 2, ∞`; negative control `[[1,1],[0,1]]` (not PSD) gives `2/√3 ≠ 1` |
| Grothendieck–Haagerup and transference (description), on the README's example | `cos(x − y)` on `ℝ`; `m = cos` | `ξ = η = (e^{ix}, e^{−ix})/√2`: `⟨ξ(x), η(y)⟩ = cos(x − y)`, `‖ξ‖_∞‖η‖_∞ = 1`; lower bound `‖M‖_∞ = 1` | `T_m` is convolution with `(δ₁ + δ₋₁)/2`, a probability measure: cb norm `≤ 1`, and `≥ ‖m‖_∞ = 1` | both sides `1`; the two theorems agree on the example |
| Description's supplier list against the README's supplier contracts | each roadmap and section named | description: OperatorIdeals Parts A–B; VonNeumannAlgebras V2, V2.RectangularL2, V4.Core, V13b; NoncommutativeIntegration §1.3–§1.5, §2.1, §2.3, §2.5, §2.6, §3.5, §4.4, §7.1–§7.3, §8.4; AutomorphicSpectralTheory §0.9; BochnerSpaces §4.2, §7.4; CStarAlgebras C1.6, C3.2; BanachSpaceTheory B4.0 | README contracts, lines 2605–2721: the same seven suppliers and the same sections, nothing more, nothing fewer | equal; all seven are on main |

The rows for every statement of the roadmap stand as in the previous review, of `1bd5565` (and, through it, of `5e643e9`); `Suggested.lean` is unchanged.

- Source locators checked against the text this round: 1 (lafforgue-delasalle-2011 lines 281–285, for N01, as read before). No passage changed, so the seeded sample falls in no changed passage.
- Library declarations opened at the pin this round: none new; no passage changed. The four opened in the previous review stand.
- Cross-roadmap citations resolved against main this round: BochnerSpaces §4.2 and §7.4, AutomorphicSpectralTheory §0.9, NoncommutativeIntegration §1.3, §1.4, §1.5, §2.1, §2.3, §2.5, §2.6, §3.5, §4.4, §7.1–§7.3, §8.4, CStarAlgebras C1.6 and C3.2, BanachSpaceTheory B4.0, VonNeumannAlgebras V2.RectangularL2, V4.Core and V13b: each heading or label is present on main. No open pull request changes this roadmap, drops an id it cites, or defines one it cites.
- Dependency check: `depcheck: 105 roadmaps, 1216 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changes outside the folder; the folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- Automatic checks: all pass at this head. Lean: `lake env lean` on `Suggested.lean` gives 11 `sorry` warnings and nothing else. The elaborated types and the one-tactic probe stand as in the previous review, the file being unchanged.
- The pull request's text: title and description read sentence by sentence against the head (summary block and prose). Sections named (§2.1, §7.1, §10.4, §10.5, §11.5) exist with the subjects given; "declares no supplier gap" holds; the roadmaps named without consumption (UnboundedOperators, ToeplitzOperators, PDE) are treated so in the scope section; the Toeplitz case of §11.5 is the Hörmander–Mikhlin bound in completely bounded form (README lines 2197, 2212).
- Overlap check: read NoncommutativeIntegration, OperatorIdeals and BochnerSpaces on main (the sections cited) this round; VonNeumannAlgebras, SchrodingerOperatorsAndSpectralTypes, BanachSpaceTheory and PDE stand as read before (nothing changed here). Shared objects: the `L^∞` conditional expectation and the Fubini isometry (owner BochnerSpaces §7.4, §4.2, cited); the Schatten families for `p < ∞` (owner OperatorIdeals Part B, cited); tracial `Lᵖ`, interpolation and finite-tracial martingales (owner NoncommutativeIntegration, cited); nothing else shared.
- Source independence: changed passages only; 0 passages changed, so 0 compared; the arrangement stands as compared before: largest share lafforgue-delasalle-2011, 43 of the 120 source mentions counted at 4faf86f; contents compared with lafforgue-delasalle-2011: independent.
- Research link: Layers 6–8 are Theorems 1.7, 1.18 and 1.19 of Lafforgue–de la Salle (2011); Layer 9 the transference of Caspers–de la Salle (2015) and Neuwirth–Ricard (2011); Layers 10–11 Theorem A of Conde-Alonso, González-Pérez, Parcet and Tablate (2023), which leads to Arazy's conjecture and Potapov–Sukochev (2011). Rests on the README's sources, read.

## Not verifiable

- The description's sentence on how many review rounds preceded the port describes the history of the work, not the change; it was not checked.
- The locator-only texts (reed-simon-1-1980, jrwz-2020 and the others) and the uniformity of the constant in the Hardy-space interpolation of §10.4 stand as listed in the earlier reviews.

## Source issues

- **Gap** in cgpt-2023 at the proof of Lemma 1.4, p. 10 (lines 480–481): the source says the Hardy-space inclusions hold with absolute constants by Section 3 of the Randrianantoanina paper; it should give the argument, since Proposition 3.18 there states equivalent quasi-norms with no constant tracked; affects the proof.

## For the human reviewers

- The `gaps` list of the board package's `design/plan.json` is empty, but two of its prose entries still name the gaps `sigma-finite-hilbert-schmidt-kernels` and `semifinite-martingale-bmo-interpolation`; the README declares neither and builds both (§2.1, §10.4).
- §10.4 asks for two estimates with a constant independent of the exponent. For the first, randrianantoanina-2021 Proposition 3.18 (line 1440) tracks no constant; uniformity rests on cgpt-2023 line 481. jrwz-2020 was not read.
- §2.1 builds the kernel of a Hilbert–Schmidt operator on arbitrary σ-finite spaces, while AutomorphicSpectralTheory §0.8 on main owns it on standard Borel spaces with separable `L²` (`TauCetiRoadmap/AutomorphicSpectralTheory/README.md` lines 239–248). The scope section states the difference.
