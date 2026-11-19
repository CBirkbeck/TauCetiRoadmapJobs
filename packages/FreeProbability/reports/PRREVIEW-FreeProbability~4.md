# Review of FreeProbability (pull request #2575 at 37bca01)

**Verdict:** accepted

**Summary.** Accepted: there are no findings. The six small corrections of the previous review are all repaired at this head, and the repairs are correct: the restated free Lévy–Khintchine equivalence, the change-of-base embedding theorem, the two new Speicher locators and the Tau Ceti cycle count were each recomputed or read at the source. The description of the pull request agrees with this head. There are no small corrections and seven format notes (two new, five carried over), none blocking. Two points remain for the human reviewers: Nica–Speicher, the source cited most, could not be read, and the licence of a linked external formalization was not checked.

## N01 — The geodesic characterization of §2.2 is inside Speicher's Remark 7.6, not after it

README line 259 and the References entry (line 1917) say "p. 85, after Remark 7.6". The remark begins on p. 84 and runs to the statement in question on p. 85 (Spe19 lines 3459–3482); the next item is Remark 7.7. "Remark 7.6, p. 85" finds it.

## N02 — In §4.5, "an inclusion of unital C*-algebras, not necessarily unital" can be read as contradicting itself

README line 709. It is the inclusion that need not be unital (Blanchard–Dykema, Theorem 1.3, BD99 line 207); "a not necessarily unital inclusion `B ⊆ B̃` of unital C*-algebras" would say so.

## N03 — Several targets cite a range of Nica–Speicher lectures, not a numbered result

Unchanged from the previous review: "Lectures 1–7" in §§1.1 and 1.2 (README lines 138, 153, 183), and "Lectures 16–18" in Layer 5 (line 809), including the headline `sSeries_momentSeries_mul`. A theorem number would let a reader find each statement.

## N04 — The first Example of Layer 1 cites one lemma for two identities

Unchanged (README lines 198–199): `TauCeti.IsFreelyIndependent.apply_mul_mul_mul_of_ne` gives `φ(abab) = 0`; the identity `φ(a²b²) = φ(a²)φ(b²)` is `TauCeti.IsFreelyIndependent.apply_mul_of_ne`.

## N05 — The second Check of §5.3 uses `F(w) = w/(1 − cw)` without defining `F`

Unchanged (README line 884). It is `G(1/w)`; in §6.2 the same letter is the distribution function.

## N06 — The hypothesis `hs` of `tendsto_integral_trace_gueMatrix_word` is not used by its conclusion

Unchanged (`Suggested.lean` line 201). It is harmless and matches the README's "selfadjoint standard semicircular elements"; a clause in the docstring would say why it is kept.

## N07 — §8.7 says "limiting laws" without saying in which sense

Unchanged (README line 1478). The route is by moments, so "whose normalized-trace moments converge to those of `μ`, `ν`" would match it.

## Previous findings

The previous review, of `87d99bf`, had no findings (no R01); its small corrections and format notes are accounted for here.

- C01 — repaired: §2.2 now lists `#cycles(p_π) = #blocks(π)` as Tau Ceti's `Finpartition.orbitCount_formPerm`, the target bullet is gone, and the name is in the *Needs:* line and the Tau Ceti contract.
- C02 — repaired: §8.6 and the docstring cite "Speicher, Theorem 7.5 for one matrix on each side, and its proof, pp. 83–84, applied to words in the families and their adjoints".
- C03 — repaired: §4.5 states the embedding theorem for `B ⊆ B̃` with `Ẽ_i(A_i) ⊆ B`, both expectations with faithful GNS representations, unique and injective; `B̃ = B` is the special case.
- C04 — repaired: the headline is `tfae_forall_exists_isFreelyIndependentElements_law_sum`, a three-way equivalence whose third clause is `κ_(k+2)(a) = ∫ tᵏ dρ` for a finite `ρ` vanishing off `[−R, R]`.
- C05 — repaired: §2.2 cites "Biane; Speicher, Lecture Notes on Free Probability Theory, p. 85, after Remark 7.6"; the passage is there (wording of the locator: N01).
- C06 — repaired: §7.5 reads "For an R-diagonal element `a` of a C*-probability space whose star-distribution is tracial, prove that this star-distribution is realized in a C*-probability space as `uh`".
- N01 — not repaired: lecture ranges remain; N03 above.
- N02 — not repaired: N04 above.
- N03 — not repaired: N05 above.
- N04 — not repaired: N06 above.
- N05 — not repaired: N07 above.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 2.2 cycle counts, now cited from Tau Ceti | π = {1,3}{2} on three points; σ = (1 3 2) | p_π = (1 3): 2 cycles = 2 blocks; p_π⁻¹γ = (1 2)(3): 2 = blocks of K(π) = {1,2}{3}; sum 4 = n+1. σ: 1 + 1 = 2 ≠ 4 | holds; `Finpartition.orbitCount_formPerm` at `Order/Partition/FormPerm.lean:343` |
| 2.2 geodesic characterization, new locator | Spe19 lines 3476–3482 | source: permutations with `|α| + |α⁻¹γ| = m − 1` correspond to noncrossing partitions, credited to Biane 1997 | supported; inside Remark 7.6 (N01) |
| 4.5 embedding with change of base | `B̃ = B`; `B = ℂ`, all `Ã_i = B̃ = D` with identity expectations; one index | same-base theorem; `Ẽ_i(A_i) ⊆ ℂ` forces `A_i = ℂ`, product ℂ ↪ D; one factor: `A ⊆ Ã` | holds; BD99 lines 207–229 give the same hypotheses, uniqueness and injectivity |
| 6.7 Lévy–Khintchine, three clauses, README and Lean | semicircle; free Poisson λ; `a = c·1`; β = (δ₋₁+δ₁)/2; r = 0; R < 0 | ρ = σ²δ₀ (0⁰ = 1 gives κ₂ = σ², higher 0); ρ = λδ₁ gives λ; ρ = 0, b_i = c/N; β: κ₄ = −1 fails clause 2 at c = (0,1) and clause 3 (∫t² dρ ≥ 0); empty sum 0; R < 0 forces ρ = 0 | holds; README κ_(i+j), i,j ≥ 1 equals Lean κ_(i+j+2), i,j ≥ 0 |
| 7.5 distribution model | Gaussian-moment `h` (previous counterexample); `a` in a C*-probability space | excluded now: `a*a` bounded, law of `|a|` compactly supported, `(uh)*(uh) = h²` has the law of `a*a` | holds |
| 8.6 Haar conjugation, locator | exponent in the proof | Spe19 line 3416: `m − 1 − |α⁻¹β| − |α| − |β⁻¹γ| ≤ 0`, traces of each family alone (line 3401); proof on pp. 83–84 | supported as cited |

The rows for untouched statements stand as in the previous review, of `87d99bf`.

- **Source locators checked against the text:** 4 in 2 sources: Spe19 (Theorem 7.5 p. 81, its proof pp. 83–84, Remark 7.6 pp. 84–85), BD99 (Theorem 1.3, pp. 4–5). None of the sections of the seeded sample changed; their locators stand as checked at `87d99bf`.
- **Library declarations opened at the pins:** `Finpartition.orbitCount_formPerm` (Tau Ceti `Order/Partition/FormPerm.lean:343`, for every `Finpartition`, fixed points counted) and its use in `orbitCount_formPerm_add_orbitCount_inv_mul_finRotate` (`Combinatorics/NoncrossingPartition/FormPerm.lean:188–193`).
- **Cross-roadmap citations:** the diff adds none; a search of main and the open heads for the change-of-base embedding theorem, the geodesic characterization and a free Lévy–Khintchine theorem found no other owner.
- **Automatic checks:** every check passed. Dependency check: `depcheck: 200 roadmaps, 2200 edges, 0 problem(s)`, no UPWARD or CYCLE line. Nothing changed outside the folder.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives eight `sorry` warnings and nothing else. The file has no section variables; the restated theorem's type was compared with §6.7. One-tactic probe on `tfae_forall_exists_isFreelyIndependentElements_law_sum`: `simp`, `rfl`, `tfae_finish`, `intros; simp_all` and `infer_instance` all fail.
- **Headlines:** still eight theorems; the renamed one is named consistently in §6.7 and the module docstring, and the old name occurs nowhere.
- **Pull request text:** read against this head: 49 sections, 48 with Checks, nine supplier roadmaps, nine Tau Ceti imports, eight theorems and three added definitions agree; the description states the rewrite of the roadmap on main, the Fk → Layer k renumbering, the removed declarations, the suppliers changed, and each statement changed since `87d99bf` (§§2.2, 4.5, 6.7, 7.5, 8.6). Nothing to correct.

Overlap check: read RandomMatrices, AmenableTracesOnCStarAlgebras, OperatorAlgebraDynamics, OperatorKTheory and Subfactors (scopes as read at `87d99bf`; the change adds no object and moves no ownership). RandomMatrices §§6.2–6.5 owns the bounded scalar core and is cited; this roadmap owns the F₂ norm obstruction and the full Fock space; nothing else shared.

Source independence: changed passages only: 4 passages compared with 2 sources (Spe19, BD99), none shared beyond the hypotheses of Theorem 1.3 and standard names; largest share Nica–Speicher, 35 of about 94 citations, text not readable; no layer added, removed or reordered, so the arrangement stands as compared at `87d99bf`: independent.

Research link: Layers 3–4 build the reduced and amalgamated free products of Voiculescu and of Blanchard–Dykema (1999), with Dykema's faithfulness theorem (1997), which FactorRigidity and Subfactors consume; Layer 8 states asymptotic freeness without norm bounds (Collins 2002) and the Weingarten asymptotics (Collins–Śniady 2004). Rests on the sources read and the README's References.

## Not verifiable

- Nica–Speicher, *Lectures on the Combinatorics of Free Probability* (Cambridge University Press, 2006): no legal copy. Of the changed passages, Theorem 13.16 (§6.7) and Theorem 23.14 (§8.6) were not read.
- Biane, *Some properties of crossings and partitions* (Discrete Math. 175, 1997): paywalled; §2.2 now also gives a Speicher locator, which was read.

Automatic checks set aside as false positives: the overlap listing reports the former sections F3 and F4, which FactorRigidity cites, as dropped; the sentence that opens "How to read the build" maps every former section Fk to Layer k with a variable k, which the listing does not read.

## Source issues

- none

## For the human reviewers

- Not tested: Nica–Speicher, the source cited most (35 of about 94 citations in `TauCetiRoadmap/FreeProbability/README.md`), has no legal copy. Wording was not compared with it; arrangement was compared with its public table of contents only.
- Licence: Scope and ownership (README lines 1651–1656) links an external Lean project (SemicircleLaw on GitHub) and a Zulip thread as related formalizations. `Suggested.lean` was not compared with that repository and its licence was not read.
