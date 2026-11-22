# Review of BernoulliBoundsForClassGroupEigenspaces (pull request #2896 at 37ae632)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BernoulliBoundsForClassGroupEigenspaces/`
**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired, and the 16 changed lines agree with the formal proof's declarations. In 14.1 the quotient character of the twist is now `χ_p^{−2e}` on inertia at `p`, which is what the last clause of `GlobalTheory.Ord2.SrcUr` gives and is compatible with the other hypotheses; the added normalisation of "attached to a newform" is that of `Newform.Att`. There are no findings, no small corrections and no format notes. The scope and licence questions below remain for the human reviewers.

## Previous findings

- R01 — repaired: 14.1 now reads "and has quotient character `χ_p^{−2e}` on inertia at `p`", with the Frobenius normalisation "the inverse of an arithmetic Frobenius at `q` has characteristic polynomial `X² − a_q X + ε(q)q^{2e}`".
- C01 — repaired: "from statements of published theorems of Galois cohomology (Poitou–Tate and local Tate duality, […]), which that deduction takes as a hypothesis"; the list matches the twelve fields of `LitCoh`.
- C02 — repaired: the family index line now reads "twisted Tate–Shafarevich groups and their bounds by generalized Bernoulli numbers and by explicit torsion bounds […], and the vanishing of Bloch–Kato groups"; no Stickelberger clause.
- N01 — repaired: 9.8 (a) says of ArithmeticKTheoryPartII §8.3 "(a comparison, not an input)".
- N02 — repaired: the References cite the formal proof "at its first commit `40e56bab…`, the source as published, which the family index names"; one commit throughout.

No repair introduced a new problem.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 14.1, Euler system, last hypothesis | `e = 1`, general `e ≥ 1`; `W₀₀ = χ_p^eφ` on inertia | README: quotient of twist `= χ_p^{−2e}`. Formal: `W₁₁χ_p^{e}det⁻¹χ = 1`, so `W₁₁χ_p^{−e}det⁻¹χ = χ_p^{−2e}`. Equal. | agrees | none |
| 14.1, consistency of the hypotheses | `W₁₁ = det·χ_p^{−e}φ⁻¹` on inertia | Condition becomes `φ⁻¹χ = 1` on inertia: satisfiable (`χ = φ`), of finite order as required; no longer empty | non-vacuous | none |
| 14.1, "attached" normalisation | `k = 2e + 1`; determinant at `p` | `heckePoly q = X² − a_qX + ε(q)q^{k−1}`, `k − 1 = 2e`; `Att` uses `V(σ⁻¹)`, `σ x ≡ x^q` (arithmetic). `det V = χ_p^{−2e}`·finite; diagonal: finite, `χ_p^{−2e}`: consistent | agrees | none |
| 14.1, Galois-cohomology hypothesis | fields of `LitCoh` | `pt, lf, lt, le, gf, ge, uo, gw, lfK, ltK, leK, bk`; `uo`: unramified classes mutual annihilators at `ℓ ∉ v`; `bk`: `DimFormula ∧ RationalDuality ∧ IntegralDuality` | list in README matches | none |
| 14.1, deduction | `vanishOrdL_of_zetaUr` | `LitCoh → ZetaUr → VanishOrdL`, at the first commit as well | hypothesis, as the README says | none |
| 9.8 (a), comparison clause | Dependencies of Layer 9, supplier contracts | ArithmeticKTheoryPartII absent from both; clause says nothing is consumed | consistent | none |
| Lean theorem of 9.4 (untouched) | elaboration at this head | `declaration uses sorry` at line 78, the only message; file unchanged since `72a1913` | elaborates | none |

The rows of the previous reviews for the untouched statements stand as in the previous review, of `72a1913`.

- Formal proof: 8 declarations opened for the changed passage (`GlobalTheory.Ord2.SrcUr`, `Newform.heckePoly`, `Newform.Att`, `IsFrob`, `LitCoh`, `UnramifiedOrthogonalityAt`, `BlochKatoLocal`, `vanishOrdL_of_zetaUr`) in a local copy of the repository's `src`; three files (`Statements/CuspidalUnitaryTwists/ZetaUr.lean`, `Proofs/FoundationProofs/VanishOrdLOfZetaUr.lean`, `AutomorphicForms/Newform.lean`) read again on the public repository at commit `40e56bab`, identical statements.
- Commit `40e56bab`: the public history ending at it has exactly one commit ("Mirror the submission exactly as published", 2026-11-20), so it is the first commit.
- Source locators into published texts: the diff changes none; the seeded sample meets the changed passages only at 14.1 and 9.8, checked above.
- Cross-roadmap citations in the changed passages: ArithmeticKTheoryPartII §8.3 (comparison only), unchanged; none added.
- Dependency check: `depcheck: 133 roadmaps, 1489 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed at this head.
- Changes outside the folder: the family index only (the line describing this roadmap), the pull request's own.
- Pull request text: the description states the first commit, the family index and its section "When a roadmap is wrong", and the single Lean headline; no sentence contradicts the head.

Overlap check: read UniformWildKernelBounds, HeckeIdealsAndTaylorWilesRelations, SelmerLengthBoundsAndLocalLifting, LengthBoundsInPadicFamilies and CongruenceModulesOfThetaLifts (open), KatoEulerSystems, ArithmeticKTheory and BorelRegulators (main); the change adds no object and moves none. `Ш¹(F, ℓ, e)` and its total: this roadmap (CongruenceModulesOfThetaLifts and UniformWildKernelBounds cite §6.17); Sha kernels with lattice coefficients: HeckeIdealsAndTaylorWilesRelations §10.1, cited; `Sha²_{i,ℓ}` and wild kernels: ArithmeticKTheory §6.9, cited; Kato's finiteness: KatoEulerSystems §7.9, cited.

Source independence: changed passages only; 3 passages compared with 1 source (the newform clause, the quotient-character clause and the list of Galois-cohomology statements against the formal proof's Lean declarations), none shared (the source has no prose there); largest share the formal proof, about 95 of 110 locators; the diff adds, removes and reorders no layer, so the arrangement stands as compared before: independent.

Research link: Layer 9 extends the torsion bounds of Soulé (1999, 2003) and Bayer-Fluckiger–Emery–Houriet (2014) to all primes; Layers 13–14 rest on Kato's finiteness theorem and the Ribet–Momose open image theorem; the roadmap supplies UniformWildKernelBounds in a family following Alpöge's formal proof (2026). Rests on the README, Soule1999, BFEH2014.

## Not verifiable

- Arlettaz 1991, Theorem 1.5 (9.8 (a)): recorded as uncertified; the text was not read.
- Soulé 2003: described in the README only through BFEH 2014; its own text was not read.
- The formal proof: statements were read, proofs were not checked or compiled.
- That every file path and declaration the README cites is present at the first commit `40e56bab`: three files were compared there; the others were read in a local copy taken at a later commit.

## Source issues

- none

## For the human reviewers

- Scope: Layers 6, 10 and 9.5–9.7 cite no refereed source; their only source is the formal Lean proof by L. Alpöge announced 2026-11-20 (README References, line 878; family index lines 10–19).
- Licence: the repository `leanprover-community/riemann-hypothesis` says the proof belongs to its author and was published without a licence; the family index says so. The README cites file paths and declaration names and copies no code; 14.1 paraphrases two of its structures in prose.
- Licence: `Suggested.lean` uses the same carrier expression as the formal proof's `UpperTheory.V.K.HGL` and `torsHGL` (`GeneratorCountTuples/TorsBoundPow.lean`); the theorem's name, quantifiers and bound differ from `TorsBound` there.
- Not tested: the wording comparison with the formal proof covered its Lean statements only; it has no prose to compare.
- Policy: the family index has a section "When a roadmap is wrong", telling reviewers of library contributions not to block one that departs from a roadmap where the formal proof shows the roadmap wrong; the description now states it.
