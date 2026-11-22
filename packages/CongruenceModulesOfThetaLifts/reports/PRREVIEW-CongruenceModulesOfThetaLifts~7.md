# Review of CongruenceModulesOfThetaLifts (pull request #2921 at 509a46b)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/CongruenceModulesOfThetaLifts/`
**Verdict:** accepted

**Summary.** Accepted: this was an incremental re-review of the 3 lines changed since `72ec95e`. The one changed sentence, in the route of 7.5a, now says that the archimedean component `π_v` of `y` is the contragredient of `𝒲_{j,v}`; that is what RowTowerAndRallisIdentities §5.7 gives for forms with values in `𝒲_j`, and it is what the Schur-orthogonality value in the next sentence needs. There are two format notes, neither blocking (one carried from the previous review); the scope and licence questions about [FormalProof] remain for the human reviewers.

## N01 — The route of 7.11 quotes the base-level bound of [FormalProof] without a locator

The route of 7.11 (lines 1393–1397) gives the bound `D_0·C·x^ε·(B₀ + N_c)` as the one [FormalProof] states, with no file or declaration. The statement is the definition `DIVinN_at` in `Formalism/SharpRestriction/GlobalTheoremInputs.lean` (namespace `Formalism.MainNotions`). Naming it would let a reader check the form, as 7.10c does for its own. (Unchanged since the previous review.)

## N02 — The entry [FormalProof] of the References names the repository without the commit the family index now gives

The family index now says that the files the roadmaps name are files of the source as published, to be looked up at the first commit `40e56bab` of the repository, which has changed since. The entry [FormalProof] of this README (line 1958) still gives only the repository address. Adding "at its first commit `40e56bab`", or a pointer to the family index, would keep the 95 locators unambiguous.

## Previous findings

- N01 (format note; the previous report had no finding) — not repaired: the route of 7.11 still reads "its bound reads `Σ_𝔭 ϱ(𝔭)e_𝔭η^{P_0}_j(𝔭) ≤ D_0·C·x^ε·(B₀ + N_c)`" with no file or declaration; written again as N01.

## Verified sound

| Statement | Instances tried | Values computed (README side / my side) | Result |
|---|---|---|---|
| 7.5a route (a) (ii): `π_v` is the contragredient of `𝒲_{j,v}` | RowTowerAndRallisIdentities §5.7: `y` with values in `𝒲_j`, `ỹ(h) = h_∞^{−1}y(h_f)`; scalar function `φ_{w*}(h) = ⟨ỹ(h), w*⟩` | right translation by `u`: `⟨u^{−1}ỹ(h), w*⟩ = φ_{u·w*}(h)`, so the span is `𝒲^∨`; README says contragredient | holds |
| 7.5a route (a) (ii): the Schur value | `U(1)`, `𝒲 = z^n`, `n ≠ 0`; general `𝒲` with `f` the vector `⟨·, Δ_j⟩` of `𝒲^∨` | `π = 𝒲`: `∫ z^{2n} = 0`; `π = 𝒲^∨`: `∫ z^n·z^{−n} = vol`. General: `∫ ⟨gΔ,Δ⟩·conj⟨gΔ,Δ⟩ = vol·‖Δ‖⁴/dim 𝒲`; README the same | holds; nonzero only for the contragredient |
| The same, against the pinned lemma | `ContRepresentation.schur_orthogonality_self` with `v₁ = v₂ = w₁ = w₂ = Δ` | lemma: `⟪c, c⟫ = (finrank)⁻¹·conj⟨Δ,Δ⟩·⟨Δ,Δ⟩ = ‖Δ‖⁴/dim` (normalised Haar measure); README `vol·‖Δ‖⁴/dim 𝒲_{j,v}` | holds |
| 7.4, the coefficient representation (line 345), which states the same convention | "its contragredient is the archimedean component of `Π` at `σ`" | agrees with the changed sentence of 7.5a | consistent |

The rows for the untouched statements stand as in the previous review, of `72ec95e`.

- Supplier statements read at their open heads: 1 (RowTowerAndRallisIdentities §5.7, the source of the model lift and the vector `Δ_j`).
- Library declarations opened at the pin: 1 (`ContRepresentation.schur_orthogonality_self`, `TauCeti/RepresentationTheory/Compact/SchurOrthogonality.lean` line 104).
- Seeded sample: none of its fifteen targets falls in the changed passage (7.5a is not among them); they stand as previously read.
- Dependency check: `depcheck: 136 roadmaps, 1529 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed at this head. Elaboration of `Suggested.lean`: exit 0, no output (it declares nothing and did not change, so there is no signature to compare and nothing for the one-tactic probe).
- Changes outside the folder since the previous head: the family index `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md` (the pull request's own): the name GRH, the link to the first commit of the repository of [FormalProof] with its statement on ownership and licence, and a section "When a roadmap is wrong". It is identical to the index at the heads of RowTowerAndRallisIdentities and ThetaChainsOnDefiniteUnitaryGroups; its statements about the repository agree with the repository's own README, read today (the commit page of `40e56bab` shows that single commit, "Mirror the submission exactly as published", 20 November 2026). The folder outside the family holds no other change.
- Pull request text: the 3 lines change nothing the title and description describe (no section, headline, declaration or supplier added or removed); the description's sentence on the family index still holds.
- Duplication and layers: the diff adds, removes or reorders no layer, section, target or supplier citation.

Overlap check: read GluedTargetAndDivisionInequality, SelmerLengthBoundsAndLocalLifting, ThetaChainsOnDefiniteUnitaryGroups, ThetaChainsAndFrobeniusPrimeSums, RowTowerAndRallisIdentities, LengthBoundsInPadicFamilies, AutomorphicGaloisRepresentationsPartII, AutomorphicGaloisRepresentations, EndoscopicTransferAndUnitaryTraceComparison (scopes as read in the earlier reviews; RowTowerAndRallisIdentities §5.7 read again; the change touches no ownership); nothing shared.

Source independence: changed passages only: 2 passages compared with 2 texts (the sentence of 7.5a with RowTowerAndRallisIdentities §5.7, the new paragraph of the family index with the README of the repository of [FormalProof]), none shared beyond one attributed clause of ten words; largest share [FormalProof], 95 of 96 locators; the diff adds, removes or reorders no layer, so the arrangement was not compared again (previous result: independent).

Research link: The targets are the congruence-module, Ribet-type and weight-elimination inputs of the formal proof of the Riemann hypothesis for Dirichlet L-functions (Alpöge, 2026), in the tradition of Ribet 1976, Hida 1981 and Bellaïche–Chenevier 2009, with Gan–Qiu–Takeda 2014 for 7.5a; README References and the sources read.

## Not verifiable

- The proofs inside [FormalProof] were not traced, in this review or the previous one; the sentence of 7.11 that the term `(log x)²·N_c` "is added only in its last step" was not checked.
- Whether `40e56bab` is the root commit of the repository of [FormalProof] was read from the repository's own README and from its commit page, not from the history itself.
- The items the earlier reviews could not verify (the published works cited without locators, Check (ii) of 7.6, the size inequalities quoted from ThetaChainsOnDefiniteUnitaryGroups) are untouched and stand as there.

## Source issues

- none

## For the human reviewers

- **Scope.** 95 of the README's 96 source locators point to [FormalProof], a Lean repository announced on 20 November 2026 (README References); it is not a refereed publication, and the consumers of the headline bounds are roadmaps of the same family.
- **Licence.** The family index now states, and the repository's README confirms, that [FormalProof] belongs to its author and was published without a licence. The roadmap cites file paths and declaration names only and reproduces no text of it.
