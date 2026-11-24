# Review of ConstructiveFieldTheoryPhi4 (pull request #2432 at 3a2e7f1)

**Verdict:** accepted

**Summary.** Accepted: the six changed lines are correct, and the three small corrections of the previous review are all repaired without a new problem. The pull request's title and description were read against this head and nothing in them is contradicted by it or left unstated. There are no small corrections and two format notes carried over from the previous review, neither blocking. The two questions for the human reviewers stand (the consumer roadmap that does not exist yet, and a public formalisation the Lean was not compared with).

## N01 — "The last part follows Aizenman and Duminil-Copin" (README line 11)

Unchanged since the previous review. The sentence reads as a statement about the plan, although what is meant is that the notion is theirs. Would "The notion of a reachable random field is Aizenman and Duminil-Copin's" serve?

## N02 — The Ising energy of QuantumOptimization §1.1 is the same function on ±1 configurations in another convention, and the README does not say so

Unchanged since the previous review. For a coupling J here and spins σ, `H_{V,J}(σ)` is `ising (−J⁰/2) 0` there (two sites: `−½(J + J)σ_xσ_y = −Jσ_xσ_y`); the carriers differ, so nothing is owned twice. One clause in the Conventions or in Scope and ownership giving the dictionary would save a reader the computation.

## Previous findings

- none: the previous review, of `f40ac5a`, had no finding (no R-numbered remark). Its small corrections and format notes are accounted for below.
- C01 of the previous review (the description's list of roadmaps named only as owners of excluded material) — repaired: the description now reads "PDE, OperatorAlgebraDynamics (D9), DimerModelsAndLozengeTilings (Layer 4, §§4.1, 4.5 and 4.6 …) and GibbsMeasuresAndTheIsingModel (an open pull request adding that roadmap …) are named only as owners".
- C02 of the previous review (overview and build guide omit 3.2 for Layer 7) — repaired: line 15 reads "Layer 7 joins Layers 1 and 6, with the monotonicity in the volume from Layer 3 for its block second moment"; line 21 "with 3.2 for the monotonicity of the block second moment in the volume".
- C03 of the previous review (Corollary 1.9 is about the Potts model) — repaired: line 387 reads "Duminil-Copin, Corollary 1.9, p. 14, for the free and monochromatic measures of the q-state Potts model, whose case q = 2 is the Ising model".
- N01, N02 of the previous review — not changed; written again above as format notes.

## Verified sound

| Target | Instances tried | Values computed (README side against recomputation) | Result |
|---|---|---|---|
| 3.2 monotonicity in the volume, as cited by the new sentences of lines 15 and 21 | Ising, V = {0,1} inside the triangle V′ = {0,1,2}, all couplings J, t = tanh J | `⟨σ₀σ₁⟩_V = t`; `⟨σ₀σ₁⟩_{V′} = (t+t²)/(1+t³)`; at t = ½: `½ ≤ 2/3`; in general `t² ≥ t⁴` | holds |
| 7.1 block second moment non-decreasing in R (the fact the new sentences attribute to 3.2) | d = 1 Ising free chain, block {−1,0,1}; ρ = δ₀ | `3 + 4t + 2t²` for every R ≥ 1 (constant, so non-decreasing); 0 for δ₀; 7.1 states it for even admissible ρ, the hypothesis of 3.2 | holds |
| Layer 7 dependencies against lines 15 and 21 | the four `*Needs:*` lines of 7.1–7.4 and the layer's Dependencies | 7.1: 1.1, 1.2, 3.2; 7.2: 1.1, 1.2, 1.5, 6.1, 7.1; 7.3: 1.2, 6.1; 7.4: 1.5, 6.3; Dependencies "Layers 1, 3 (through 3.2) and 6" | agree |
| 4.2 locator, Duminil-Copin Corollary 1.9 (changed clause) | source at its locator; q = 2 | corollary on printed p. 14: free measure and the measures with boundary colour b ∈ T_q are limits of the finite-volume ones; Hamiltonian `−Σ σ_x·σ_y`, T₂ = {±1} gives Ising | supports the clause |
| `exists_infiniteVolume_limit` (statement the changed passage cites; unchanged) | d = 1 Ising, J = 0 | `tanh^{|x−y|}J` for every R ≥ |x|, |y|, so the limit exists trivially; J = 0 gives the product measure | holds |

The rows of the previous review for the untouched statements stand as in that review, of `f40ac5a`.

- Source locators checked against the text this round: 3 (duminilcopin-2017-lectures line 549, Corollary 1.9, printed p. 14, with "monochromatic" at line 350 and the free measure at lines 117–119; sokal-1982 line 403, printed p. 327, monotone increase of the correlation functions in the volume; peled-spinka-2017 line 515, Theorem 2.3 on p. 13, n ∈ {1, 2}).
- Library declarations: none touched by the change; `Suggested.lean` is unchanged since `f40ac5a`.
- Cross-roadmap citations resolved: StochasticCalculus, StandardDistributions, ZerosOfLFunctions, DimerModelsAndLozengeTilings, PDE, OperatorAlgebraDynamics on main; RelativisticQuantumFieldTheory §§7.1, 7.3, 7.6 and GibbsMeasuresAndTheIsingModel Layers 1–3, §§4.2, 4.3, 5.2 at their open heads (headings present). No ConstructiveFieldTheoryPhi4PartII on main or among the open pull requests, as the description says.
- Dependency check: `depcheck: 128 roadmaps, 1428 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changed outside the folder. The automatic checks all passed on this head.
- `lake env lean` on `Suggested.lean`: exit 0, 29 `sorry` warnings and nothing else.
- Pull-request text against the head: title (adds a roadmap; the folder is not on main); summary block; "29 headline theorems" (29 sorried theorems); folder contents (README, `Suggested.lean`, `metadata.toml`); three suppliers on main and one open, matching the supplier contracts; the four roadmaps named as owners of excluded material with the sections the README gives; §7.6 named for contrast; 0 paths outside the folder. No sentence contradicted, no change left unstated.

Overlap check: read GibbsMeasuresAndTheIsingModel, RelativisticQuantumFieldTheory, StandardDistributions (scope and the cited sections; the change adds no object); shared objects and owners as in the previous review: Wick–Isserlis moments, StandardDistributions §5.3 (cited); continuum Green kernels, RelativisticQuantumFieldTheory §§7.1, 7.3 (cited); DLR Gibbs measures, plus and minus states, Peierls, GibbsMeasuresAndTheIsingModel (cited as owner, and its scope assigns §§2.1, 3.1, 3.3 and Layers 4–5 here); nothing owned twice.

Source independence: changed passages only; 3 passages (the two new dependency clauses and the reworded locator of 4.2) compared with 3 sources (duminilcopin-2017-lectures, sokal-1982, peled-spinka-2017), none shared beyond standard names; largest share aizenman-duminilcopin-2021, 52 of about 119 locators, as before; the diff adds, removes or reorders no layer, so the arrangement was not compared again (previous result: independent).

Research link: Layers 2–7 are the lattice inputs of the marginal-triviality theorem of Aizenman and Duminil-Copin (2021) and of the d ≥ 5 results of Aizenman (1982) and Fröhlich (1982); Layer 5 is the infrared bound of Fröhlich–Simon–Spencer (1976). Rests on the README's downstream goals 8.1–8.2 and on aizenman-duminilcopin-2021, Sections 1, 5 and 7.

## Not verifiable

- sokal-1982: the displayed equations are images in the text, so (2.18) at the locator of 4.2 was matched by the surrounding sentence and the printed page only.
- The uncertified sources (griffiths-simon-1973, aizenman-1982, frohlich-simon-spencer-1976, glimm-jaffe-1987, fernandez-frohlich-sokal-1992, friedli-velenik-2017, simon-1974) are cited by locator and were not read; the change touches none of their locators.

## Source issues

- none

## For the human reviewers

- Scope: README lines 13, 687–713 and 729 hand the marginal-triviality goals 8.1–8.2 and several named estimates to ConstructiveFieldTheoryPhi4PartII; no roadmap of that name is on main, among the open pull requests or in the merge order.
- Licence: RelativisticQuantumFieldTheory's open head (its Provenance section) cites a public Lean formalisation of the Gaussian free field, `LeanPool/OSforGFF`; this README names no existing formalisation, and `Suggested.lean` was not compared with that repository.
