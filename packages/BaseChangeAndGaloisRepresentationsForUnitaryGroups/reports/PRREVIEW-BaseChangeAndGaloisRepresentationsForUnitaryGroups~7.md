# Review of BaseChangeAndGaloisRepresentationsForUnitaryGroups (pull request #2890 at 99329a9)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BaseChangeAndGaloisRepresentationsForUnitaryGroups/`
**Verdict:** needs changes

**Summary.** Needs changes: this was an incremental re-review of the 85 lines changed since `284e520`, and one finding is new. Theorem 13.8a, which the previous head stated for every CM extension unramified at every finite place, is now stated only over the cyclic hosts of FrobeniusRestrictedRieszSums §0.4, a restriction its own route never uses. The other changes check out: all 19 locators into [FormalProof] resolve to the named file and declaration, the scope sentences of 10.33d, 14.2, 15.1 and 16.1 agree with the formal statements, and the new weight formula of 16.1 and the `rec` conventions are consistent. There are two small corrections and one format note; the two questions for the human reviewers stand, the licence one updated.

## R01 (P2) — Theorem 13.8a is restricted to the cyclic hosts of one Dirichlet character, although its route proves it for every CM extension unramified at every finite place

The statement of 13.8a (line 536) now begins "Let `E` be a host of the chain (FrobeniusRestrictedRieszSums §0.4), `F` its maximal totally real subfield"; the Layer 13 introduction (line 532), the ownership sentence (line 979) and a new supplier contract (line 1017) follow. At the previous head it began "Let `E/F` be a CM extension unramified at every finite place". A cyclic host is `ℚ_n·ℚ(ψ)·ℚ(√−q)·ℚ(√−d)` for a primitive Dirichlet character `ψ` and an auxiliary pair of primes `q ≡ 3 (mod 8)`, `d ≡ 7 (mod 16)`. An equality of cuspidal multiplicities of unitary inner forms that holds only over those fields is a statement for one application, not a library theorem, and an implementer who formalises it as written produces something nobody else can use.

Nothing in the route (steps (1)–(8), lines 568–607) uses the host. It uses that `E/F` is CM, the self-dual lattices and the isometries `a_v`, the split places of `S` and `u`, Hasse's norm theorem, the Hasse principle for Hermitian forms and the pseudo-coefficients: `ψ`, `q`, `d`, the abelian Galois group and the conductor do not occur. The restriction comes from the formal proof, whose statement (`GlobalTheory.PsCo.Pc.TRCusp'`) quantifies over its host record; that is a fact about that proof's packaging. The Conventions paragraph added in this change already provides for the case: "A wider or sharper form stated beside it is this roadmap's own, proved by the route written here", and 10.33d, 14.2, 15.1 and 16.1 are written that way. The description also says the family states its targets "in the generality in which the statement holds".

The smallest change: restore "Let `E/F` be a CM extension unramified at every finite place" in 13.8a, and drop "Over the hosts of the chain" from line 532 and "over the hosts of the chain" from line 979. Replace "This is the statement of [FormalProof]" by a sentence in the form used at 16.1, for instance: "[FormalProof] has the case in which `E` is a cyclic host (FrobeniusRestrictedRieszSums §0.4) and `F` its maximal totally real subfield; for the other CM extensions the statement is this roadmap's, by the same route." The citation of §0.4 then only names where the formal case lives, and the contract and the two dependency lines can say so or go. ("Host of the chain" is not a term of §0.4, which says "cyclic host"; the sentence above uses its term.)

## C01 — The description does not name the new supplier FrobeniusRestrictedRieszSums

This head adds a supplier contract "From FrobeniusRestrictedRieszSums, a sub-roadmap of this family" and cites its §0.4 in the *Needs* and Dependencies of Layer 13. The description's Dependencies paragraph names only PotentialAutomorphyInfrastructurePartII and ModularityAndLanglandsExtensions, and its list of open suppliers has no entry for FrobeniusRestrictedRieszSums. If the citation stays after R01, add the roadmap and its section to that paragraph ("FrobeniusRestrictedRieszSums (§0.4, the hosts named at 13.8a)"). If R01 is repaired by removing the contract, nothing is needed.

## C02 — 13.8a says "This is the statement of [FormalProof]" without saying which statement

Every other target that names [FormalProof] gives the file and the declaration; 13.8a (line 564) gives them only for the type vectors. The source has two statements of this shape, and they differ in the gap: `GlobalTheory.TrMult.TRCusp` in `Development/AbelianVarietyTheory/Definitions/Divisors/HasTypeVec.lean` asks for gaps at least `r`, and `GlobalTheory.PsCo.Pc.TRCusp'` in `Development/AbelianVarietyTheory/Proofs/DivisorProofs/TraceEqXOfGeomExpansionX.lean` for gaps at least `100r⁴` (its `GapG`, in `Definitions/Divisors/RangeShape.lean`), which is the constant of 13.8a. A reader who opens the file the README names finds the first. Name `TRCusp'` and its file.

## N01 — In 16.1 the letter `τ` changes meaning twice within one sentence

In lines 911–916 `τ` is first an embedding `E → ℂ` (the weight `λ_τ`), then "`τ : E → ℚ̄_ℓ`" with `λ_{ι∘τ}`, then again complex in "`a_τ = −w₀λ_τ`". Each use is declared, and the formulas agree (table below); writing the last one with `σ`, as the middle clause already does for complex embeddings, would remove the switch.

## Previous findings

- R01 — repaired (stands): 16.1 keeps "`a_τ = −w₀λ_τ = (−λ_{τ,n}, …, −λ_{τ,1})`" and now gives the weights as "`{i − 1 − λ_{ι∘τ,i} : 1 ≤ i ≤ n}` at `τ : E → ℚ̄_ℓ`"; the two agree.
- C01 — repaired (stands): step (6) of 13.8a still cites Harish-Chandra's formula of EndoscopicTransferAndUnitaryTraceComparison §2.3(c); untouched by this change.
- C02 — repaired (stands): the Summary still says headline (1) "restates, clause by clause and with the same hypotheses" the supplier's result; untouched.
- C03 — repaired (stands): the description still names ModularityAndLanglandsExtensions §2.43; a new omission of the same kind is C01 above.
- N01 — repaired (stands): no TeX macro in either file.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| 16.1 new weight formula | `a_{σ,i} = −λ_{σ,n+1−i}`, `j = n + 1 − i` | `a_{σ,i} + n − i = −λ_{σ,j} + j − 1`; multiset `{j − 1 − λ_{σ,j}}` | equals the new `{i − 1 − λ_{ι∘τ,i}}` |
| 16.1 against the formal `jumpsOf` | `k ∈ Fin n`, 0-based | `k − λ_k` with `i = k + 1` gives `i − 1 − λ_i`, at `ι∘τ` | same multiset |
| 16.1 against the formal weight law | infinitesimal character `λ + ρ`, `ρ_i = (n + 1 − 2i)/2` | `(n − 1)/2 − (λ_i + ρ_i) = i − 1 − λ_i` | "`λ_σ + ρ`" clause consistent |
| 16.1 Check, `n = 1` | `Π_v = τ(z)^m`, `λ = m` | formula: `{1 − 1 − m} = {−m}`; rank-one Check: `HT_τ = {−m}` | agree |
| 16.1 Check, `n = 2`, `λ = 0` | `i = 1, 2` | `{0, 1}`; `r = 1 ⊕ ε_ℓ^{−1}` has `{0, 1}` | agree |
| 16.1 scope sentence | formal `galoisRep_definiteUnitary_tyz` | `E/E⁺` unramified at finite places; `Π` unramified above `ℓ` ⇒ crystalline with `jumpsOf`; `FrobSat` at split `w ∤ ℓ`, roots `α·q^{(n−1)/2}`, at `Frob⁻¹` of arithmetic Frobenius | as the README says; such `E` has `E⁺ ≠ ℚ` |
| `rec^T` and `algNorm` | formal `algNorm σ` | twist `ν^{(1−a)/2}` of the class of `σ` | equals `π_w ⊗ |det|^{(1−n)/2}` |
| `rec` conventions, rank one | `χ` of `F^×`; `Art_geo(x) = Art_arith(x)⁻¹` | `(rec⁻¹(χ))^∨ = (χ∘Art_arith⁻¹)⁻¹ = χ∘Art_geo⁻¹` | agrees with property 1 of 10.29a and line 160 |
| 13.8a | route steps (1)–(8) read for uses of `ψ`, `q`, `d`, abelian `Gal(E/ℚ)` | none; formal `TRCusp'`: `Odd rank`, `GapG` = `100r⁴`, `NoFixed`, lattice isometries, `HasTypeVec` | hypotheses match; field restriction unused (R01) |
| 13.8a type vectors | formal `HasTypeVec` | nonzero `x`, `K_v`-fixed off `S`, in the span of images of `K_v`-maps from `τ_v∘red_v` at `v ∈ S` | the README's type vector |
| 10.33c scope sentence | formal `InflMatching` | clause 1: twisted orbital integral of the inflated norm lift = orbital integral; clause 2: nonzero integral ⇒ characteristic polynomial of a norm | (a) and the contrapositive of (b) |
| 10.33d scope sentence | formal `stepInert` / `StepAt … Not` | `K`, `M` totally complex, `M/K` Galois of prime degree, `v` not split and unramified, weak base change; label lifts | "global form (b), for totally complex fields" |
| 10.35 scope sentence | formal `dz_of_cusp` | `E_w ≅ ℚ_p`, supercuspidal, tame parameter ⇒ depth zero | as stated |
| 14.2 scope sentence | formal statement of the cited name | depth zero; unlinked characters, or `E_w ≅ ℚ_p` and rank-`≥ 2` members pairwise not unramified twists; `N = 0` and charpoly on inertia | as stated (the formal `N = 0` hypothesis on the parameter follows from 14.2's unlinked support) |
| 15.1 scope sentence | formal `AboveB.nice`, and the 14.2 statement at `w ∣ ℓ` | sum of characters, `N = 0` ⇒ equality of Weil–Deligne representations; `E_w ≅ ℚ_ℓ`, tame ⇒ `N = 0`, equality on degree-0 elements | two cases as stated |
| 10.29a scope sentence | formal `LawsT` | fields: rank one, segments, cuspidal ⇒ irreducible, twists, central character, duals, injectivity on a subclass, depth, type; no `ε` of pairs, no uniqueness | "does not use property 5 … or uniqueness" consistent with the record it cites |

The rows for untouched statements stand as in the previous review, of `284e520`.

- Source locators checked against the text: 19 of 19 into [FormalProof] (file exists, declaration exists in it under the stated namespace), in a clone whose source tree is that of the commit the family cites; statements read for 16 of them.
- Library declarations opened at the pin: none needed; `Suggested.lean` declares nothing and is unchanged.
- Cross-roadmap citations resolved: 5. FrobeniusRestrictedRieszSums §0.4 at its open head (cyclic hosts; clause (i): `E/F` unramified at every finite place; it does not cite this roadmap); LocalFactorsOfTwistsAndTypes §6.5 at its open head (the sentence listing what the family uses); AutomorphicGaloisRepresentationsPartII Conventions on main (geometric normalisation, `rec^T`); UniformWildKernelBounds at its open head (cites §16.1 only, so dropping "15.2" from the consumer sentence is right); 10.30 of this README.
- Seeded sample: 6.3a, 10.29a, 10.33c, 10.33d, 10.34, 10.35, 14.1, 14.2, 15.1 and 16.1 fall in changed passages and were checked as above (for 6.3a, 10.34 and 14.1 the added locator only); 10.27, 10.30, 10.33a, 10.33b and 15.2 are untouched.
- Dependency check: `depcheck: 171 roadmaps, 2002 edges, 0 problem(s)`; no UPWARD or CYCLE line. The family index now lists FrobeniusRestrictedRieszSums before this roadmap.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output; no declaration, no `sorry`, no `set_option`, single `import Mathlib`. No signature to compare and no one-tactic probe to run.
- The automatic checks all passed; outside the folder only the family index changes.
- Headlines: unchanged; none statable at the pins, each named in the module docstring.

Overlap check: read LocalFactorsOfTwistsAndTypes, CongruenceModulesOfThetaLifts, UniformWildKernelBounds, HeckeIdealsAndTaylorWilesRelations, FiniteReductiveGroups (open) and AutomorphicGaloisRepresentationsPartII, EndoscopicTransferAndUnitaryTraceComparison, GL2AutomorphicRepresentationsAndTransfer (main), as scoped in the earlier reviews, and FrobeniusRestrictedRieszSums §0.4 for this change; the change moves no ownership. Shared objects and owners as before: the properties of the trace-defined correspondence, EndoscopicTransferAndUnitaryTraceComparison §§10.20–10.30; the away-prime and coefficient-prime comparisons, AutomorphicGaloisRepresentationsPartII AG2.5–AG2.7; Galois representations on the group of PotentialAutomorphyInfrastructurePartII §3.1, its §3.6; the inertial type for `GL₂(ℚ_x)`, GL2AutomorphicRepresentationsAndTransfer §R16.3.9; the cyclic hosts, FrobeniusRestrictedRieszSums §0.4.

Source independence: changed passages only: 9 passages (the Conventions paragraph on the formal proof, the `rec` sentences, the scope sentences of 10.29a, 10.33d, 14.2, 15.1 and 16.1, the weight sentence of 16.1, the reference entry) compared with 1 source, [FormalProof], a Lean source tree: the README gives paths and declaration names and describes the statements in prose, no code is reproduced; largest share now [FormalProof], 19 of 27 locators; the arrangement was not compared again (no layer added, removed or reordered). Kudla 1994, Harris–Kudla–Sweet 1996 and Labesse 2011 could not be read.

Research link: Layer 10 is the explicit depth-zero local Langlands correspondence (Henniart 1992; Bushnell–Henniart 2005) with Kottwitz's 1986 matching extended to functions from the residue field; Layers 14–16 apply Caraiani's and Labesse's (2011) results to definite unitary groups. Rests on the README; the family index says the family follows an unpublished formal proof.

## Not verifiable

- Kudla 1994 §1 (6.3a): paywalled; the citation resolves to the publisher only.
- Harris–Kudla–Sweet 1996 §1 (6.3a): the publisher's host is not one the sources service reads.
- Labesse 2011 (16.1, the hypothesis `[E⁺:ℚ] ≥ 2`): the only copy is on a third party's page and was not used; the hypothesis agrees with EndoscopicTransferAndUnitaryTraceComparison §6.29.
- Caraiani–Scholze, Corollary 5.5.5 in the published numbering: the published version is paywalled, and arXiv v1 numbers a different statement 5.5.5.
- The six steps of 13.8a listed as not given were not checked; the README says they are not supplied.
- That [FormalProof] nowhere uses property 5, the factors of pairs, bijectivity or uniqueness (10.29a) is a claim about the whole source; I checked it against the record of laws it cites, not against every use.
- Which of the cited `Prop`-valued declarations the source proves outright and which under named published inputs was read for five of them only (`ChrEx`, `InflMatching`, `stepInert`, `dz_of_cusp`, `TRCusp'`).

## Source issues

- none

## For the human reviewers

- Scope: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`) says the family follows a formal Lean proof of the Riemann hypothesis announced on 20 November 2026; I found no refereed source for it. Targets 10.33c, 10.33d, 13.8a and 15.1 cite no literature besides it.
- Licence: the README now cites 19 file paths and declaration names of that proof's public repository, which carries no licence; it reproduces no code, only names and prose descriptions of statements.
