# Review of TensorInductionAndFiniteGroupInputs (pull request #3027 at 7b5fe43)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/TensorInductionAndFiniteGroupInputs/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 119 changed lines since `b8f3652`. The change adds the `*Origin:*`, `*Method of the formal proof:*` and `*Corollary of:*` labels to 6.1, 6.2, 7.1 and 9.1 and hands three groups of statements to general roadmaps; each was checked against the section it names (SchurWeyl §8.4, ClassicalGroups §6.6b, InductionRestriction §5.3), against the Molev and MNO texts, and against the formal proof's source for the method labels of 6.1, 6.2, 7.1 and 9.1 (e). There are no findings. Two small corrections and one format note remain from the previous review, none blocking. The human reviewers are asked only about sources that could not be read and the licence of the formal proof.

## C01 — Three of the new *Origin* attributions give no locator a reader can open

A reader who wants to check where 6.2 (a) and parts of 9.1 come from cannot find the cited results.

- The 9.1 *Origin* (line 304) attributes the value of `qdet(u)` on a highest weight vector in (c) to the three Yangian references, but none of the reference entries (lines 514–516) gives a locator for it. It is in Molev (2003), §4.1, formula (4.1): the Harish-Chandra image of the Capelli determinant is `(u + l_1)⋯(u + l_n)` with `l_i = λ_i − i + 1`, which is `∏_k (u − k + 1 + ν_k)` here. Adding `§4.1, formula (4.1)` to the Molev (2003) entry, for 9.1 (c), settles it; ClassicalGroups §6.6b already cites it so.
- The 6.2 *Origin* (line 127) and the reference entry (line 519) cite Isaacs (1976) for the extensions of an invariant irreducible character over a cyclic quotient, with no chapter or result number.
- The 9.1 *Origin* and the reference entry (line 516) cite Molev (2007) for (a), (b), (d) and (e) by "chapter 1" only.

For the last two, give the result or section numbers.

## C02 — The description's list of corrected attributions leaves out the one this change makes in 7.1

On `main`, 7.1 said that the joint highest weight line `Δ_λ` "is this roadmap's". The head says instead (lines 269–277) that it is in [FormalProof] as lemmas of the proof of its duality theorems, and names `Formalism.GradedWeylDivisibility.highest_weight_line` and `GlobalTheory.GLDuality.HighestLine.wide` and `.highest_line`; all three are in the formal proof's source and among the declarations its main theorems reach.

The description's section "Wrong statements on `main`" lists corrections of this kind for other roadmaps (its last bullet, on IntegralWeylModulesOfGeneralLinearGroups §2.2 and ChowFormsAndHeightsOfSubvarieties §5.1, is one sentence each on how the formal proof argues), but not this one, so a reader who uses that list to see what changed on `main` misses it.

Add a bullet such as: "**TensorInductionAndFiniteGroupInputs §7.1.** The joint highest weight line `Δ_λ`, which the text called this roadmap's own, is in the formal proof as lemmas of the proof of its `(GL_n, GL_m)`-duality theorems."

## N01 — The *Corollary of:* line of 6.2 (line 142) names InductionRestriction "Layer 5", not §5.3

The Clifford correspondence is §5.3 of that layer. The convention paragraph (line 30) says the line names "the roadmap section that states it", and the lines of 7.1 and 9.1 name sections; `§5.3` would match them (also in the Summary, line 7, and in Scope and ownership, line 478).

## Previous findings

The previous review (at `3bddf73`) had no findings. Its two small corrections and its format note are in text this head leaves unchanged, and are written again above as C01, C02 and N01: not repaired.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| 6.1 (a) character formula (sampled) | `ℤ/2 ⊃ 1`, `ψ = 1`; rank one, `g ∉ H` | Tensor square of trivial: `(1, 1)`; formula `ψ(1)² = 1`, `ψ(x²) = 1`. Rank one: `ψ(g^l)`, the transfer. | holds |
| 6.1 (b) against the expansion in the new *Method* label | `ℤ/2, H = 1, ψ = −1` (`ψ₁ = 0, ψ₂ = 1`) | README: `0 + s·1 = (1, −1)`. Method: `ψ̂₁ − ψ̂₂ − Ind = (0,0) − (1,1) − (−2,0) = (1, −1)`. | agree |
| 6.1 *Method* against the formal proof | `ExistsTensorInductionChar.lean`, `ExistsTensorInductionVirtualCharacterPrime.lean` | Matrices indexed by `Γ → Fin d`, path and cycle sums; virtual case is `A − B − Z` with cross terms of `(a − b, b)` | as described |
| 6.2 (a), clause under *Corollary of:* (sampled) | `S₃ ⊃ A₃`, `χ′ = ω`, inertia group `H` | §5.3 with `T = H`: `Irr(S₃ ∣ ω) = {Ind ω}`, degree 2, zero on transpositions | holds |
| 6.2 (b), (b′), (c) (sampled) | `S₃`, `X = 1 + ρ`; `Y = ω + ω²`, `Y = 1_H` | Coset norm `(1/3)·3 = 1`, `b = 1`. `⟨X∣_H, ω+ω²⟩ = 2` even, `1_H ∉ Y`; `⟨X∣_H, 1⟩ = 1` odd, `1_H ∈ Y`. | consistent |
| 6.2 *Method*, the step for (c) | general `l`; Galois action `g ↦ g^k` | Coset pairings `c_k = σ_k(c_1)`; `c_1 = 0` gives `⟨X, Ỹε^j⟩ = c_0/l ∈ ℤ`, so `l ∣ ⟨X∣_H, Y⟩` | correct |
| 6.2 *Method* against the formal proof | `TwistedVirtualCharacterNormOneSupport.lean`, `ExistsSemidirectCharacterExtOfStable.lean` | `Y` extended whole (`exists_semidirect_character_ext_of_stable`), matrix corrected by `aeval` of a polynomial; pairing nonzero from `¬ l ∣ z` | as described |
| 7.1 on `GL_n × GL_m` ↔ SchurWeyl §8.4 (sampled) | action, range of `λ`, `n=2, m=3, d=2`; minors | Both `P(ᵗgXh)`, `ℓ(λ) ≤ min(n,m)`; `21 = 3·6 + 1·3` both. `Δ_i(ᵗgXh) = det g_[i]·det h_[i]·Δ_i(X)` for upper triangular `g, h`. | same statement |
| 7.1 *Method* and the `Δ_λ` lemmas against the formal proof | `IrreducibleDistinctUnitary.lean`, `HWLine.lean`, `WeightMapDomain.lean` | `irreducibleDistinct_unitary` precedes and feeds `irreducibleDistinct_gl`; `highest_weight_line`, `wide` (`r ≤ n`), `highest_line` exist and are reached | as described |
| 9.1 (a), (c), (d) ↔ ClassicalGroups §6.6b (sampled) | relations, `M^a_b`, `n = 2` | Same relations and minors. (d), `i = l = 1`: `(E11 − E22) − [E12, E21] = 0`. Eigenvalue `(u+ν1)(u−1+ν2)` both. | same statements |
| 9.1 (d) ↔ Molev 2003, Definition 2.26, Proposition 2.27 | entry `(i, l)` of `T̂(u)T(u−n+1)` | `Σ_j (−1)^{i+j} M_{ĵ,î}(u)·T(u−n+1)_{jl} = δ_il·qdet(u)` on both sides | agrees |
| 9.1 (e) ↔ Molev 2003, Theorem 2.36, `m = 2` | `(i,q,j,p) = (2,1,2,1)`, `u ↦ u − 1` | Both: `M_{2̂2̂}(u)M_{1̂1̂}(u−1) − M_{1̂2̂}(u)M_{2̂1̂}(u−1) = qdet(u)·M_{1̂2̂,1̂2̂}(u−1)`; evaluation factors equal on both sides | agrees |
| 9.1 *Method*, row form by permuting shifts | `t = 2` | `S(u1,u2) − S(u2,u1) = (u1−u2)·Σ sgn·(δE − Eδ) = 0` under the double transposition | correct |
| 9.1 *Method* for (e) against the formal proof | `QuantumMinorExpansion.lean` | `EX = C(E) + X·δ` over `A[X]`, a cancellation lemma, then `constantCoeff` | as described |
| 9.1 (c), (j) ↔ MNO | Theorem 2.10, Remark 2.11, Propositions 2.4, 2.5, 2.7 | Column determinant with diagonal `E_ii + u − i + 1`, central: `qdet(u)` here | agrees |
| Downstream consumers ↔ FiniteReductiveGroups §5.11 | routes of (d), (e) | (d): 6.1 on `GL_a(k′)`, `a ≤ m`, and 6.2 (b), (b′), (c). (e): coset orthogonality, 6.2 (a). | matches |
| Headlines (1), (2) in `Suggested.lean` | three elaborated types | 6.1 (a); 6.1 (b) first sentence; 6.2 (b), (b′), (c); hypotheses as in the README; file unchanged by this pull request | holds |

- Source locators checked against the text: 11 (MNO Propositions 2.4, 2.5, 2.7, Theorem 2.10, Remark 2.11 at MolevNazarovOlshanski1996 lines 1321–1511; Molev2003 §2.6 at lines 349–409, Definition 2.26 at 634, Proposition 2.27 at 638, Proposition 2.35 at 721, Theorem 2.36 at 746, §4.1 (4.1) at 1393).
- Formal-proof files read at the cited commit: 7; the 7 declaration names of 6.2 and 7.1 checked are all among the declarations its main theorems reach.
- Cross-roadmap citations resolved at this head: SchurWeyl §8.4, ClassicalGroups §§6.6, 6.6b, InductionRestriction §5.3, FiniteReductiveGroups §5.11; ArithmeticGaloisRepresentations §7.1 on `main`.
- The record: 3 layers at the merge base; none removed, retitled or added; no heading removed; no statement removed; `Suggested.lean` unchanged.
- Automatic checks: all passed. Dependency check: `depcheck: 129 roadmaps, 1441 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean` at the pins: three `declaration uses sorry` warnings, nothing else; elaborated types compared with the README, no binder lost.
- No file outside `TauCetiRoadmap/` is changed by the pull request.

Overlap check: read BesselPoincareSeriesAndGramBounds, IntegralWeylModulesOfGeneralLinearGroups, FiniteReductiveGroups. BesselPoincareSeriesAndGramBounds consumes 9.1 (owner: this roadmap for (b), (e)–(j); ClassicalGroups §6.6b for (a), (c), (d)). FiniteReductiveGroups consumes 6.1 and 6.2, owned here. IntegralWeylModulesOfGeneralLinearGroups shares nothing. The duality on `GL_n(ℂ) × GL_m(ℂ)`: owner SchurWeyl §8.4; this roadmap owns the restriction to `U(n) × U(m)`.

Source independence: 9 passages compared with 3 sources (Molev2003, MolevNazarovOlshanski1996, the formal proof's files), changed passages only; none shared beyond standard names; largest share [FormalProof], 37 of about 65 locators; contents not compared, since the change adds, removes or reorders no layer. Shintani 1976, Gluck–Isaacs 1983, Isaacs 1976, Howe 1989 and 1995 and Molev 2007 could not be read.

Research link: Layer 6 is the character theory behind Shintani descent for `GL_n` (Shintani 1976); Layer 7 is Howe's `(GL_n, GL_m)`-duality (Howe 1989, 1995); Layer 9 is the quantum-minor calculus of the Yangian of `𝔤𝔩_n` (Molev–Nazarov–Olshanski 1996; Molev 2003). All feed the formal proof of GRH for Dirichlet L-functions (Alpöge 2026). Rests on the README, Molev 2003 and MNO.

## Not verifiable

- Shintani 1976, Lemmas 1-4 and 2-11 (*Origin* of 6.1 and 6.2): the publisher's landing page offers no open PDF; no legal copy found.
- Gluck and Isaacs 1983 (*Origin* of 6.1): the same.
- Isaacs 1976 (*Origin* of 6.2) and Molev 2007 (*Origin* of 9.1): books with no open copy; the README gives no result number.
- Howe 1989 and Howe 1995 (*Origin* of 7.1): no legal copy found.
- The *Method* label of 9.1 for (a), (c) and (j) (the four-term relation, the repeated-row argument for centrality, the linear combination for (j)): the formal proof's files for these clauses were not opened; the row-form step was checked as mathematics for `t = 2`.

## Source issues

- none

## For the human reviewers

- Not tested: the *Origin* attributions of 6.1, 6.2 and 7.1 to Shintani 1976, Gluck–Isaacs 1983, Isaacs 1976 and Howe 1989/1995 could not be read from a legal host; wording was compared with Molev 2003 and MNO only.
- Licence: [FormalProof], a public Lean repository, has the largest share of locators (37); its files were read to check the method labels, and its licence was not checked.
- Neither recorded decision applies to this folder: the head removes no section, statement or declaration from it.
