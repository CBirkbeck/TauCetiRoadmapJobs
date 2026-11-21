# Review of TensorInductionAndFiniteGroupInputs (pull request #2908 at 5e8e41b)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/TensorInductionAndFiniteGroupInputs/`
**Verdict:** accepted

**Summary.** Accepted: no finding. The folder is unchanged since the last review, and this round read the pull request's title and description against the head: every sentence of the description agrees with it, and the earlier correction (four suppliers named where the README has five) is repaired. There are no small corrections and four format notes, three of them carried over unchanged, none blocking. The human reviewers still have to decide on the formal proof that Layers 6 and 9 are attributed to: it could not be read, and it is not a refereed source.

## N01 — Layers 7 and 9 have no statement in `Suggested.lean`, although the docstring says 9.1 is statable

The module docstring calls 7.1 and 9.1 "not headlines" and states neither; it also says the identities of 9.1 "are statable there". These are the sign-and-shift identities where a formal statement would catch most (a wrong shift in (d) or (e) is invisible in prose). Would the author state one or two of them, for example the centrality of `qdet(u)` (9.1 (c)) and the Jacobi identity (9.1 (e)), in an arbitrary `ℂ`-algebra? The same question for the explicit expression of 6.1 (b), which the Summary gives as part of headline (1) and the docstring lists as statable and not stated.

## N02 — The last Check of 9.1 uses a model that is not faithful for `n ≥ 3`; a third set of variables makes it so

With `E_{ab} = x_a∂_{x_b} + z_a∂_{z_b}` the polynomials in `x, z` contain only the `GL_n`-types `V_λ` with `ℓ(λ) ≤ 2`. For `n = 3`, `qdet(2)` has eigenvalue `(2 + λ₁)(1 + λ₂)·λ₃`, so it acts by `0` on all of them while it is nonzero in `U(𝔤𝔩₃)`: an identity checked in this model for `n = 3` is checked modulo a nonzero kernel. The Check could say "three sets of variables for `n = 3`" (`E_{ab} = x_a∂_{x_b} + z_a∂_{z_b} + t_a∂_{t_b}`).

## N03 — 9.1 (j) does not say over which `u, v` the exchange relation is assumed

"with `(u − v)·[t_{ab}(u), t_{cd}(v)] = …` for all indices" quantifies the indices only (README line 290). The route uses the relation at `(Y + 1, Y)`, `(Y, Y + 1)`, `(Y + 1, Y′)`, `(Y′, Y)` and their negatives; "for all `u, v ∈ ℂ` and all indices" would say it.

## N04 — The description labels the third Lean theorem "6.2 (b), (c)"; the file and the README say (b), (b′), (c)

The description gives `exists_rootOfUnity_mul_extension_eq_on_coset` as "(6.2 (b), (c))". The module docstring of `Suggested.lean` (line 26) and the README (line 116, "(b′) is part of that declaration") include (b′), that `b` is a root of unity of `ℚ(ζ)`. "(6.2 (b), (b′), (c))" would match.

## Previous findings

- The previous report had no finding (R01, …): nothing to account for.
- C01 (earlier small correction) — repaired: the description now reads "five roadmaps on main: InductionRestriction, SchurWeyl, ClassicalGroups, ArithmeticGaloisRepresentations (§7.1 …) and CharacterTheory (§0.2 …)", and its validation sentence matches this head.
- N01, N02, N03 (earlier format notes) — not repaired (the folder did not change); written again above as format notes.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 6.1 (a), which the description's first Lean item cites | `S₃ ⊃ A₃`, `ψ = ω`, `x` a transposition; `ℤ/4 ⊃ 2ℤ/4`, `ψ` the sign | `S₃`: on `H` `ω(h)ω(h⁻¹) = 1`, off `H` `ψ(g²) = ψ(1) = 1`; transfer gives `1`. `ℤ/4`: values `(1, −1, 1, −1)`, the character `χ(1) = −1`; `ψ∘`transfer `= ψ(2g)` agrees | holds | none |
| Description against the head | each sentence: layers, index entry, Lean names, suppliers, validation | layers 6, 7, 9 and no Layer 8 (22 headings); 3 theorems at lines 60, 76, 96; 5 `From TauCetiRoadmap.*` contracts, all five folders on main; index entry lines 40–43 lists the four subjects | agrees | N04 only |

The rows of the previous review for the other statements stand as in that review, of `5e8e41b`.

- Folder diff since the previous review: 0 lines; no file changed outside the folder since then.
- Pull request text: 7 paragraphs of the description and the title read against the head; one imprecise label (N04), no contradiction, no unstated change (the pull request adds the roadmap; nothing removed or renumbered).
- Changes outside the folder against the base: only the family index (`README.md`, `Suggested.lean`, `metadata.toml` of `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/`), as the description says.
- Cross-roadmap citations re-resolved: the five supplier roadmaps exist on main (InductionRestriction, SchurWeyl, ClassicalGroups under `RepresentationTheory/`, ArithmeticGaloisRepresentations, CharacterTheory). No open pull request changes this roadmap or drops an id it cites.
- Dependency check against the candidate merge order (which lists the roadmap): `depcheck: 170 roadmaps, 1988 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: `declaration uses sorry` at lines 60, 76, 96, no other message.
- Automatic checks: all passed at this head. Run against the configured merge order alone they report, as the description states, that the order does not list the roadmap yet and the three index files outside the folder.
- Overlap check: read BesselPoincareSeriesAndGramBounds, IntegralWeylModulesOfGeneralLinearGroups, FiniteReductiveGroups (open; no roadmap on main is listed as close); as in the previous review, they consume this roadmap and own none of its objects; the square case of 7.1 is owned by AutomorphicLFunctionsAndLocalFactorsPartII §4.4 and the Capelli determinant by ClassicalGroups §6.6, and the README says so.

Source independence: changed passages only: none changed, 0 passages compared; as in the previous review, largest share FormalProof, 32 of 40 locators, text and contents not readable; contents compared with MolevNazarovOlshanski1996 §2 only: independent.

Research link: 7.1 is the `(GL_n, GL_m)`-duality of Howe (1989, 1995); 9.1 (c), (j) are the quantum determinant of Molev–Nazarov–Olshanski (1996); Layers 6 and 9 are stated as inputs of Alpöge's formal proof (2026) of the Riemann hypothesis for Dirichlet L-functions. Rests on the README's references and on MolevNazarovOlshanski1996 §2.

## Not verifiable

- The description's clause that CongruenceModulesOfThetaLifts uses Jordan's theorem: that roadmap's folder is not in this pull request and it is not among the open heads given; the README says only "which the family uses".
- The 32 locators into [FormalProof] and the paragraph "The form of the formal proof": the repository could not be read (as in the previous review; not attempted again, the folder being unchanged).
- Howe 1989 and Howe 1995 §2.1 (7.1): no legal copy read; the statement of 7.1 was checked independently of them in the previous review.
- The seeded sample (6.1, 6.2, 7.1, 9.1) falls in no changed passage; its locators were not opened again.

## Source issues

- none

## For the human reviewers

- **Scope.** The source named for 6.1, 6.2 and 9.1 is [FormalProof], a Lean formalization announced 20 November 2026 (README References), not a refereed text; 7.1 and 9.1 (c), (j) also cite Howe 1989/1995 and Molev–Nazarov–Olshanski 1996.
- **Licence.** The licence of the [FormalProof] repository was not established, and `Suggested.lean` could not be compared with it for adapted declarations.
- **Not tested.** [FormalProof] has 32 of the README's 40 source locators; its text and layout could not be read, so wording and arrangement were checked against MolevNazarovOlshanski1996 only. 9.1 gives its source as "[FormalProof], clause by clause".
