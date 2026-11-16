# Review of ConstructiveFieldTheoryPhi4 (pull request #2432 at f2bf69c)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: README line 716 now puts "(Aizenman–Duminil-Copin, the paragraph after Definition 1.1 and footnote 2, p. 4; …)" at the existence sentence. The symmetry and variance claims end "(stated in this form by this roadmap: …; compare Sokal, Lemma 2.2, p. 337, …)". `Suggested.lean` lines 651–659 split the same way.
- R02 — repaired: the description's Dependencies paragraph now reads "Suppliers on main: StochasticCalculus §1.1 …, StandardDistributions §5.3 … and ZerosOfLFunctions §5.5 …. Supplier still open: RelativisticQuantumFieldTheory §7.1 and §7.3 …". It also names PDE, OperatorAlgebraDynamics D9 and §7.6 as non-suppliers.

## Verified sound

| Target | Instances tried | Values computed (README/Lean side vs computed) | Result |
|---|---|---|---|
| 1.3 derivative identity (changed locator) | two Ising sites, J = (ln 3)/2; J = 0, ρ_I | ⟨σσ⟩ = ½; ∂ = 1 − ¼ = ¾ = ⟨(σσ)²⟩ − ⟨σσ⟩²; at J = 0: 1 = (∫φ²dρ_I)² | holds |
| 1.3 pair convention vs source | ordered-pair weight e^{(J_xy+J_yx)σσ}, same J | ⟨σσ⟩ = tanh(ln 3) = 0.8, derivative 0.36, not ½, ¾. Source (9) sums over i < j, like `Sym2 V` | README convention matches source |
| 1.3 new clause | peled-spinka-2017 lines 515–526 (p. 13) | identity stated for ∂E⟨σx,σy⟩/∂J{z,w}, spin O(n), under Theorem 2.3's setting n ∈ {1,2}, J ≥ 0 | locator and scope correct |
| 7.3 existence locator | aizenman-duminilcopin-2021 lines 167–187 (p. 4) | paragraph: the limit can be presented as a random field Φ; footnote 2: Kolmogorov extension; fdd uniqueness is the definition | supports existence |
| 7.3 flip route | 𝒞 = {(δ₀+δ₁)/2}, J = 0; 𝒞 = {ρ_I}, J = 0 | first limit 2^{−d}∫f, which is not symmetric; second, white noise of variance 2^{−d}∫f², law of Φ = law of −Φ | holds, evenness needed |
| 7.3 W_d route | d = 2, J = 0, ρ_I, L = 1, quarter-turn g, f = 1_{e₁} | g maps V_R onto itself and ‖gx−gy‖₁ = ‖x−y‖₁. T_{f∘g} = φ_{−e₂} and T_f = φ_{e₁}, both fair ±1 | holds |
| 7.3 second-moment route | ν_k = (1−1/k)δ₀ + (1/k)δ_{√k} → δ₀; README Check line 724 | ∫v²dν_k = 1 vs ∫v²dδ₀ = 0, so semicontinuity gives only ≤. Scheme: 2^{−d−1}∫f² ≤ 2^{−d}∫f² | holds; ≤ is right |

Statements the diff does not touch stand as in the previous review, of 7e9970f.

- Gate rerun at f2bf69c: every check 0, `OK`. Depcheck: `depcheck: 250 roadmaps, 2381 edges, 0 problem(s)`. The diff outside the folder is empty.
- `lake env lean` on `Suggested.lean`: exit 0, 29 `sorry` warnings (one per theorem) and nothing else. The only Lean change is the docstring of `exists_reachableField` (line 660). Its elaborated type is unchanged and matches README 7.3.
- Source locators checked against the text: 3, namely peled-spinka-2017 lines 318–321 and 515–526, and aizenman-duminilcopin-2021 lines 167–187.
- Cross-roadmap citations resolved: 3, all at the open head of RelativisticQuantumFieldTheory (§7.1, §7.3 and §7.6). The citation tool's leads `ReachabilityScheme.fieldLaw` and `.HasLimitLaw` are declared at `Suggested.lean` lines 627 and 636.
- Pull-request text: the Dependencies paragraph matches README lines 24–25 and 86–100. "29 headline theorems" matches the file. The summary block still describes the head.
- Overlap check: read RelativisticQuantumFieldTheory, DimerModelsAndLozengeTilings, MathematicalStatisticsAsymptotic, MathematicalStatisticsNonparametric, PointProcesses, StandardDistributions, RandomMatrices and MathematicalStatisticsFoundations. The results-and-headings list is empty. Owners of shared objects:
  - Wick–Isserlis: StandardDistributions §5.3 (cited).
  - Continuum Green kernels: RelativisticQuantumFieldTheory §7.1 and §7.3 (cited).
  - Kolmogorov extension: StochasticCalculus §1.1 (cited).
  - PointProcesses shares nothing.
- Source independence: changed passages only. 3 passages (README 1.3, README 7.3 and the docstring of `exists_reachableField`) were compared with 3 sources (peled-spinka-2017, aizenman-duminilcopin-2021, sokal-1982). The only shared words are the standard name "spin O(n) model". The largest share is still aizenman-duminilcopin-2021, 52 of about 120 locators: the change moves one locator and adds none. No layer was added, removed or reordered, so the contents comparison of 7e9970f stands.

## Not verifiable

- Nothing in the changed passages. The items listed for 7e9970f are untouched and stand: the image-only equations of sokal-1982 and frohlich-1982, and the uncertified texts griffiths-simon-1973, aizenman-1982, frohlich-simon-spencer-1976, glimm-jaffe-1987, fernandez-frohlich-sokal-1992, friedli-velenik-2017 and simon-1974.

## Source issues

- none

## For the human reviewers

- Scope: README lines 3, 23 and 752–780 assign the marginal-triviality goals 8.1–8.2 and several deferred topics to ConstructiveFieldTheoryPhi4PartII. No roadmap of that name exists on main, among the open pull requests, in the board's packages or in the merge order.
