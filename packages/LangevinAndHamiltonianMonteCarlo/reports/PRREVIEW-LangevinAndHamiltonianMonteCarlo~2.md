# Review of LangevinAndHamiltonianMonteCarlo (pull request #2503 at fec023a)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review, the impossible flow value in the third Check of 4.1, is repaired, and the value now printed (`0.5043097`) was recomputed independently for both flows. The new scope paragraph and supplier entry on Tau Ceti's Hamiltonian flows were compared with the declarations at the pin and say what those declarations say. There are no findings, no small corrections and no format notes; one fact about scope and one about the linked repository are left for the human reviewers.

## Previous findings

- R01 — repaired: the Check of 4.1 (README line 486) now reads "agree to seven digits (`0.5043097`), with mean acceptance `0.751`"; recomputed `0.50430973` and `0.50430974`, acceptance `0.75098`.
- C01 (small correction) — repaired: Scope and ownership (lines 741 to 747) and "From Tau Ceti" (lines 865 to 876) name the four declarations and say how 3.1 and 3.4 differ; each claim checked at the pin.
- N01 (format note) — repaired: the Layer 2 and Layer 3 section comments of `Suggested.lean` now carry the README's titles, and the docstring of `wassersteinEDist_ulaKernel_pow_le` cites "Dalalyan 2017b".
- N02 (format note) — repaired: the `## Provenance` section is gone from the README; no other passage refers to it.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 4.1, third Check (`hmcKernel_isReversible` with a non-gradient drift) | `U q = (q² − 1)²`, `g q = sin 3q + 1/2`, `h = 1/10`, `n = 3`; Simpson quadrature on 800² and 1600² points | flows `0.50430973` and `0.50430974` (1600²), `0.50430976` and `0.50430979` (800²); acceptance `0.750982`; target mass `1.973732`; bound `∫ φ dπ = 1.0177` respected | printed value `0.5043097` and `0.751` agree | none |
| Scope paragraph: 3.1 against `TauCeti.SymplecticForm.hamiltonianFlow_conserves` | `H = hamiltonian U` with partial gradients `a = g q`, `b = p` | Tau Ceti field `(b, −a) = (p, −g q)`, equal to `hamiltonianField g (q, p)`; library hypotheses: `FiniteDimensional`, `LipschitzWith K`, `Differentiable ℝ H`; 3.1 has none of the three and no `CompleteSpace` | the stated differences are exact | none |
| Scope paragraph: 2.2 against `TauCeti.stdSymplecticForm_apply` | `u = (1, 0)`, `w = (0, 1)`; swapped | library `⟪u.1, w.2⟫ − ⟪u.2, w.1⟫ = 1`, swapped `−1`; README 2.2 form gives `1` and `−1` | same form, same sign | none |
| Scope paragraph: "no statement that such a flow preserves Lebesgue measure" | search of the pinned Tau Ceti for `MeasurePreserving` in the symplectic, flow and ODE files | hits: none in `Geometry/Symplectic/Hamiltonian`, `Dynamics/Flow`, `Analysis/ODE/GlobalSolution.lean`; one unrelated local hypothesis in `Geometry/Symplectic/Floer/Neck.lean` | claim holds at the pin | none |

The rows for all untouched statements stand as in the previous review, of `8c1ebcd`; the diff changes no Lean statement (two section comments and one docstring only).

- Source locators checked against the text: none new; the changed passages add no source locator. The sampled target that falls in the diff (4.1) was recomputed; the other sampled targets are untouched.
- Library declarations opened at the pin: `TauCeti.stdSymplecticForm` and `stdSymplecticForm_apply` (`TauCeti/Geometry/Symplectic/StandardCompatible.lean`, lines 72 and 79); `stdSymplecticForm_hamiltonianVectorField` (`TauCeti/Geometry/Symplectic/Hamiltonian/Standard.lean`, line 42); `hamiltonianFlow_conserves` and `apply_fderiv_hamiltonianFlow` in namespace `TauCeti.SymplecticForm` (`TauCeti/Geometry/Symplectic/Hamiltonian/Flow.lean`, lines 52 and 76). Names, files and hypotheses agree with the README.
- Cross-roadmap citations: the diff adds none; the citation resolver reports nothing unresolved.
- Dependency check: `depcheck: 200 roadmaps, 2183 edges, 0 problem(s)`; no upward or cyclic edge. No file changed outside the roadmap folder.
- Automatic checks: all passed. `Suggested.lean` elaborated: 23 `sorry` warnings and nothing else; no `set_option`; imports `Mathlib` and two `TauCeti` modules.
- Pull request text: the title and description were read against this head; no sentence is contradicted, and the new Tau Ceti entries are cited for comparison only, so the list of suppliers in the description still holds.

Overlap check: read MarkovChainMixing, OneStepMethodsForODEs, ScoreBasedDiffusion, FlowMatching, HamiltonianSystems (open), MathematicalStatisticsFoundations, OptimalTransport, StochasticCalculus (main); ownership is as in the previous review (the leapfrog step, the flip and the finite Metropolis–Hastings kernel are owned by MathematicalStatisticsFoundations 9.4 and cited); the change adds no owned object, and nothing else is shared.

Source independence: changed passages only: 3 passages compared (the Check of 4.1, the scope paragraph, the supplier entry), none of which cites a source or shares wording with one; the supplier entry was put beside the docstrings of the Tau Ceti declarations and is in its own words; no layer added, removed or reordered, so the arrangement stands as previously compared (largest share Bou-Rabee–Sanz-Serna 2018, 23 of 48 locators: independent).

Research link: the README's sources: Layer 5 states the discrete parts of the Wasserstein guarantees of Dalalyan (2017) and Durmus–Moulines (2019) for the unadjusted Langevin algorithm; Layers 1 to 4 give the reversibility of Hamiltonian Monte Carlo as in Neal (2011) and Bou-Rabee–Sanz-Serna (2018), with Tierney's (1998) criterion.

## Not verifiable

- The published versions (Acta Numerica, Bernoulli, COLT proceedings, Annals of Applied Probability) were not compared with the preprints; the README cites the preprint numbering explicitly.

## Source issues

- none

## For the human reviewers

- **Scope.** Liouville's theorem is stated here (3.4, Lipschitz force on `E × E`) and in the open roadmap HamiltonianSystems, Layer 2 (smooth Hamiltonian on a symplectic vector space). Neither contains the other, and HamiltonianSystems may not be cited as a supplier.
- **Licence.** The README no longer links the author's repository `brettkoonce/lean4-mlir`; the pull request's description still does and says it has no proofs. The repository was not opened; nothing in `Suggested.lean` suggests adaptation from it.
