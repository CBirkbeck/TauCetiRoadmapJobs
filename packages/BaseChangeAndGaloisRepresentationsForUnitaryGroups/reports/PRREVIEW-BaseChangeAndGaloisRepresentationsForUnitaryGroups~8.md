# Review of BaseChangeAndGaloisRepresentationsForUnitaryGroups (pull request #2890 at 02705f8)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BaseChangeAndGaloisRepresentationsForUnitaryGroups/`
**Verdict:** accepted

**Summary.** Accepted: this was an incremental re-review of the 30 lines changed since `99329a9`, and no finding remains. Theorem 13.8a is again stated for every CM extension unramified at every finite place, with the formal proof's case over the cyclic hosts named by file and declaration; the three locators it gives resolve and the formal statement has the hypotheses the README states. There are no small corrections and no format notes. The two questions for the human reviewers (scope, licence) stand.

## Previous findings

- R01 — repaired: 13.8a begins "Let `E/F` be a CM extension unramified at every finite place"; the Layer 13 introduction and the ownership sentence no longer mention hosts; the formal case is described as a case, "For the other CM extensions the statement is this roadmap's".
- C01 — repaired: the supplier contract "From FrobeniusRestrictedRieszSums" and its entries in the *Needs* and Dependencies of Layer 13 are gone, so the description's list of suppliers is complete again; §0.4 is now named only to say where the formal case lives.
- C02 — repaired: 13.8a names `Development/AbelianVarietyTheory/Proofs/DivisorProofs/TraceEqXOfGeomExpansionX.lean` (`GlobalTheory.PsCo.Pc.TRCusp'`) and the gap `GlobalTheory.PsCo.Pc.GapG` of `Definitions/Divisors/RangeShape.lean`.
- N01 — repaired: the last sentence on the weight in 16.1 reads "`a_σ = −w₀λ_σ = (−λ_{σ,n}, …, −λ_{σ,1})`, equivalently `a_σ = λ_{σ∘c}`", with `σ` complex and `τ` kept for `E → ℚ̄_ℓ`.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| 13.8a, general field | route steps (1)–(8) read for any use of the host (`ψ`, `q`, `d`, abelian Galois group) | none used; inputs are CM, self-dual lattices, isometries `a_v`, split `S` and `u`, Hasse norm theorem, Hasse principle | general statement is what the route proves |
| 13.8a against formal `TRCusp'` | hypotheses of the declaration at line 353 of its file | `Odd V.rank`; `GapG` at every real place; `NoFixed T`; lattice-conjugating `j v`; `Φ` with components `j v`; `HasTypeVec T σ`; conclusion `mCuspDS` equal | matches the README's hypotheses, over the host record `D7` |
| 13.8a gap | `GapG r lam` | `100·r⁴ ≤ lam i − lam j` for `j = i + 1` | README: `λ_{τ,i} − λ_{τ,i+1} ≥ 100r⁴`; equal |
| 13.8a type vector | formal `HasTypeVec` | nonzero `x`, fixed by `K_v` off `S`, in the span of images of `K_v`-maps from `τ_v∘red_v` for `v ∈ S` | the `τ_v∘red_v`-isotypic condition of the README |
| 13.8a, `r = 1` | `G = G′` the norm-one torus, `g` scalar | `a_v g a_v^{−1} = g`, so `Φ = id`; gap condition empty; joint cuspidality is `S ≠ ∅` | both sides the multiplicity of one character; agrees with the Check |
| 13.8a, `F = ℚ` | `E` imaginary quadratic | discriminant `≠ ±1`, so some finite place ramifies: no such `E` | statement empty there, not false |
| 16.1, `a_σ = −w₀λ_σ` and `a_σ = λ_{σ∘c}` | infinitesimal character at `σ∘c` is minus that at `σ`; `ρ_{n+1−i} = −ρ_i` | `λ_{σ∘c,i} + ρ_i = −(λ_{σ,n+1−i} + ρ_{n+1−i})` gives `λ_{σ∘c,i} = −λ_{σ,n+1−i} = a_{σ,i}` | the two expressions agree |
| 16.1, `a ∈ (ℤⁿ)_0` | `a_{σ∘c,i} = λ_{σ,i}`, `a_{σ,n+1−i} = −λ_{σ,i}` | `a_{σ∘c,i} + a_{σ,n+1−i} = 0` | holds |

The rows for untouched statements stand as in the previous review, of `99329a9`.

- Source locators checked against the text: 3 of 3 in the changed passage (`TRCusp'` at line 353 of its file, `GapG` at line 19 of `RangeShape.lean`, `HasTypeVec` at line 27 of `HasTypeVec.lean`), statements read; the host record `D7` opened (it carries a `host` field).
- Library declarations opened at the pin: none needed; `Suggested.lean` is unchanged and declares nothing.
- Cross-roadmap citations resolved: 2. FrobeniusRestrictedRieszSums §0.4 at its open head (the term there is "cyclic host", as the README now writes); RowTowerAndRallisIdentities at its open head cites §13.8a for the equality and for joint cuspidality, both still under that id.
- Seeded sample: of its targets only 13.8a and 16.1 fall in changed passages; both checked above. The others are untouched.
- Dependency check: `depcheck: 171 roadmaps, 2002 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output; single `import Mathlib`, no declaration, no `sorry`, no `set_option`. No signature to compare and no one-tactic probe to run.
- The automatic checks all passed; nothing outside the folder changed since `99329a9`, and against main only the family index.
- Pull request text: read against this head; no sentence is contradicted (the description's "in the generality in which the statement holds" is now true of 13.8a, and its supplier list needs no FrobeniusRestrictedRieszSums entry). Headlines unchanged, none statable at the pins, each named in the module docstring.

Overlap check: read LocalFactorsOfTwistsAndTypes, CongruenceModulesOfThetaLifts, UniformWildKernelBounds, HeckeIdealsAndTaylorWilesRelations, FiniteReductiveGroups (open) and AutomorphicGaloisRepresentationsPartII, EndoscopicTransferAndUnitaryTraceComparison, GL2AutomorphicRepresentationsAndTransfer (main), as scoped in the earlier reviews; the change moves no ownership. Shared objects and owners as before: the properties of the trace-defined correspondence, EndoscopicTransferAndUnitaryTraceComparison §§10.20–10.30; the away-prime and coefficient-prime comparisons, AutomorphicGaloisRepresentationsPartII AG2.5–AG2.7; Galois representations on the group of PotentialAutomorphyInfrastructurePartII §3.1, its §3.6; the inertial type for `GL₂(ℚ_x)`, GL2AutomorphicRepresentationsAndTransfer §R16.3.9. The cyclic hosts stay with FrobeniusRestrictedRieszSums §0.4 and are no longer consumed here.

Source independence: changed passages only: 3 passages (the sentence of 13.8a on the formal case, the weight sentence of 16.1, the reference entry) compared with 1 source, [FormalProof], a Lean source tree: paths and declaration names with a prose description, no code reproduced, none shared; largest share [FormalProof] (19 of 27 locators at the previous head, two added by this change); the arrangement was not compared again (no layer added, removed or reordered). Kudla 1994, Harris–Kudla–Sweet 1996 and Labesse 2011 could not be read.

Research link: Layer 10 is the explicit depth-zero local Langlands correspondence (Henniart 1992; Bushnell–Henniart 2005) with Kottwitz's 1986 matching extended to functions from the residue field; Layers 14–16 apply Caraiani's and Labesse's (2011) results to definite unitary groups. Rests on the README; the family index says the family follows an unpublished formal proof.

## Not verifiable

- Kudla 1994 §1 (6.3a): paywalled; the citation resolves to the publisher only.
- Harris–Kudla–Sweet 1996 §1 (6.3a): the publisher's host is not one the sources service reads.
- Labesse 2011 (16.1, the hypothesis `[E⁺:ℚ] ≥ 2`): the only copy is on a third party's page and was not used; the hypothesis agrees with EndoscopicTransferAndUnitaryTraceComparison §6.29.
- Caraiani–Scholze, Corollary 5.5.5 in the published numbering: the published version is paywalled, and arXiv v1 numbers a different statement 5.5.5.
- The six steps of 13.8a listed as not given were not checked; the README says they are not supplied.
- That the host record of [FormalProof] admits exactly cyclic hosts of FrobeniusRestrictedRieszSums §0.4 was not checked field by field; the README claims only that the formal case lies among them.

## Source issues

- none

## For the human reviewers

- Scope: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`) says the family follows a formal Lean proof of the Riemann hypothesis announced on 20 November 2026; I found no refereed source for it. Targets 10.33c, 10.33d, 13.8a and 15.1 cite no literature besides it.
- Licence: the README cites file paths and declaration names of that proof's public repository, which carries no licence; it reproduces no code, only names and prose descriptions of statements.
