# Review of LocalFactorsOfTwistsAndTypes (pull request #2889 at 28366cf)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/LocalFactorsOfTwistsAndTypes/`
**Verdict:** accepted

**Summary.** Accepted: the previous review had no finding, and the one changed sentence (the [FormalProof] entry of the References) now lists exactly what the README cites that proof for, at the generality the sections state. There is one small correction (the description still calls SmoothRepresentationsOfLocalGroupsPartII an open supplier; it is on main) and one format note carried over, neither blocking, and one question about where the two family suppliers are. The family's premise, one licence fact and the review rule in the family index are left to the human reviewers.

## C01 — The description counts SmoothRepresentationsOfLocalGroupsPartII among the suppliers still in open pull requests; it is on main

The description says: "Three of its suppliers are still in open pull requests and merge first: the family's RiemannHypothesisStatementsAndConsequences (5.1, 6.6) and HermitianFormsAndLattices (7.2), and SmoothRepresentationsOfLocalGroupsPartII (7.2)." A reader concludes that 7.2 waits on a third pull request. Main has `TauCetiRoadmap/SmoothRepresentationsOfLocalGroupsPartII/README.md`, with the two sections that 7.2 consumes: §0.3, functions of positive type (line 96), and §0.4, positive-type coefficients of unitary representations (line 135). The description's own task list already ticks that supplier.

The text that would be right: "Two of its suppliers are still in open pull requests and merge first: the family's RiemannHypothesisStatementsAndConsequences (5.1, 6.6) and HermitianFormsAndLattices (7.2); SmoothRepresentationsOfLocalGroupsPartII (7.2) is on main."

## N01 — The subquotient clause of 4.1 (i) still has no route, and a short one exists over every nonarchimedean field

The Route of 4.1 says "a route for its subquotient clause is not given here" (line 442), as at the previous head. The route offered in the previous review does not use the characteristic: with `λ(𝔪)` the standard module, `λ(𝔪) × λ(𝔫)` and `λ(𝔪 + 𝔫)` have the same semisimplification, `L(𝔪 + 𝔫)` occurs in it once, and it does not occur in `L(𝔪″) × L(𝔫″)` for smaller `𝔪″`, `𝔫″`. The clause could then be stated for every `F`. This is an offer, not a required change.

## Questions for the author

- Which pull requests carry RiemannHypothesisStatementsAndConsequences and HermitianFormsAndLattices? The README cites the first in 5.1 and 6.6 (§§9.2, 9.3, 9.5) and the second in 7.2, and the family index links both as sibling folders (index lines 87 and 132). Neither folder is on main or at this head, and the list of open roadmap pull requests available to this review shows no pull request with either folder, so the cited sections could not be resolved. If they are not yet opened, the description's "still in open pull requests" should say so.

## Previous findings

- C01 — repaired: the [FormalProof] entry now adds "the bijectivity in 2.1 (d) for `GL_n` and admissible `π`" and, for characteristic zero, 1.1, 4.1 (i) "in the form `L(𝔪′)` with its subquotient clause", 4.1 (v) and "generic ⇒ product" of 4.1 (vii).
- C02 — repaired: the description now says "The index also says where the formal proof's source is published and on what terms … and, under "When a roadmap is wrong", how a contribution may correct a roadmap of the family".
- N01 — not repaired: line 442 still reads "a route for its subquotient clause is not given here"; written again as N01 (a format note, an offer).

## Verified sound

The diff changes no statement; the rows are for statements the changed entry cites.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 2.1 (d), bijectivity for `GL_n`, admissible `π` (cited by the changed entry, over every `F`) | `GL₂`, `P = B`: unramified principal series; trivial representation | Principal series: `π^{K₁} = Ind_{B(k)}^{GL₂(k)} 1`, dimension `q + 1`, `U(k)`-invariants of dimension 2 (two `B(k)`–`U(k)` double cosets); `(π_N)^{T ∩ K₁}`: `π_N` has dimension 2, unramified. Trivial: 1 and 1 | both sides equal; entry places it outside the characteristic-zero group, as lines 82–84 do | none |
| 1.1, characterisation of tempered representations (entry: characteristic zero) | `n = 1`; `GL₂`: `χ₁ × χ₂` unitary; `χ∘det` | `n = 1`: tempered iff `|χ| = 1`, one unitary factor. `χ₁χ₂⁻¹` unitary, so never `ν^{±1}`: irreducible, tempered. `χ∘det`: coefficient of absolute value 1, not `L^{2+ε}` mod centre; not such a product | agrees; README lines 31–34 say characteristic zero for the formal form | none |
| 4.1 (vii), "generic ⇒ product" (entry: characteristic zero) | `GL₂`: `St`, `χ∘det`, `χ × χν` | `St = L([χ, χν])`, one segment, generic. `χ∘det = L([χ] + [χν])`, segments linked, not generic. `χ × χν` reducible, so not a counterexample | agrees with lines 436–438 | none |
| 4.1 (i), `L(𝔪′)` with the subquotient clause (entry: characteristic zero) | `𝔪 = [χ]`, `𝔫 = [χν]` | `χ × χν` has constituents `L([χ] + [χν])` (one-dimensional) and `L([χ, χν])` (a twist of `St`): `L(𝔪 + 𝔫)` occurs | agrees with lines 427–432 | none |

The rows of the earlier reviews for the statements this change does not touch stand as in the previous review, of `900d1b4`.

- The changed entry was compared item by item with the README's own citations of the formal proof: lines 31–34 (1.1), 81–84 (2.1 (a), (d)), 340–343 (3.4 (i)), 413–438 (4.1 (i), (iii)–(vii) and Bernstein's theorem), 596–600 (6.3), 640–645 (6.4). Every item of the entry has its citation, and the split between "every nonarchimedean field" and "characteristic zero" is the one the sections make. 12 passages.
- Source locators checked against the text this round: none new; the change adds no locator. The nine formal-proof locators behind the added items were read in the previous review.
- Library declarations opened at the pins: none new; `Suggested.lean` is unchanged. Its import `TauCeti.NumberTheory.HeckeRing.Associativity` exists at the pin.
- Cross-roadmap citations resolved: SmoothRepresentationsOfLocalGroupsPartII §§0.3–0.4 on main (README lines 96, 135). Two not resolvable (the question above).
- Automatic checks: all passed at this head. Dependency check rerun: `depcheck: 133 roadmaps, 1478 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives one warning, the `sorry` of `satake_bound_gl` (line 123); no `set_option`, no sorried data.
- Outside the folder the pull request changes only the family index (three files), which this change does not touch.
- Pull request text read against this head: title right; the description's statements on the folder, the four declarations, the unstatable headlines, the Henniart and Jacquet–Liu locators and the family index agree with the head; one sentence is behind main (C01).

Overlap check: read, in the earlier rounds, BaseChangeAndGaloisRepresentationsForUnitaryGroups, ThetaKernelsForUnitaryDualPairs, RowTowerAndRallisIdentities (open); SmoothRepresentationsOfLocalGroups, AutomorphicLFunctionsAndLocalFactorsPartII (main); this round SmoothRepresentationsOfLocalGroupsPartII (main, §§0.3–0.4, owner of positive-type functions and coefficients, cited). Segments and `rec` are owned by SmoothRepresentationsOfLocalGroups, the unitary classification by AutomorphicSpectralTheory §7.0b, both cited; nothing else shared. The change adds no object. No other open pull request changes this roadmap and none drops an id it cites.

Source independence: changed passages only; 1 passage (the reference entry) compared with 1 source (the formal proof): it is a list of section numbers in the README's own words, nothing shared. Largest share: the formal proof, with about 30 file locators, more than any published source; arrangement not compared again (no layer added, removed or reordered). Henniart 1993, Jacquet–Piatetski-Shapiro–Shalika 1983, Moy–Prasad 1996, Morris 1993, Bushnell–Kutzko 1998 and Harris–Kudla–Sweet 1996 could not be read.

Research link: 6.4 is the local converse theorem of Jacquet–Liu (2018) and Chai (2019); 6.5 is Henniart's uniqueness of the local Langlands correspondence (1993, 2002) behind Harris–Taylor (2001); 4.1 is Zelevinsky (1980). Layers 3 and 7 serve the formal proof of Alpöge (2026). Rests on the README's references and the four texts read.

## Not verifiable

- RiemannHypothesisStatementsAndConsequences §§9.2, 9.3, 9.5 and HermitianFormsAndLattices (7.2): neither folder is on main, at this head or in an open pull request that could be read.
- Morris 1993, Theorems 4.15 and 7.12, and Moy–Prasad 1996, Proposition 6.7 (2.1): paywalled, no legal copy found.
- Bushnell–Kutzko 1998, Definition 8.1 (2.1): no legal copy found.
- Henniart 1993, Théorème 1.1 and its corollary: paywalled; read only as recalled in Henniart 2002 §§1.4, 1.9.
- Jacquet–Piatetski-Shapiro–Shalika 1983 (6.1, 6.2, 6.3, 6.5) and Harris–Kudla–Sweet 1996, §6 (7.1): no legal copy found.
- Whether the declarations of the formal proof that the entry lists are proved there or assumed was not checked; they were read as statements, in the previous review.

## Source issues

- none

## For the human reviewers

- **Scope.** The family follows a formal proof announced on 20 November 2026; 3.3, 3.4 (ii), 7.1 (local formula) and 7.2 cite only that proof, which is not a refereed publication (README, References, the entry [FormalProof]).
- **Licence.** The formal proof's repository says it was published without a licence. `integralGL` has the same one-line body as its `GlobalTheory.SplitWeil.KO`, and `heckeT` the same diagonal as `Formalism.UG.diagJ`; names and binders differ (`Suggested.lean`, lines 85–103).
- **Not tested.** Six published sources could not be read (listed under Not verifiable); wording was not compared with them, and the theorem numbers given in 2.1 for three of them are unchecked.
- **Scope.** The family index has a section, "When a roadmap is wrong" (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 45–75), which says what a review of a library contribution checks and does not block on. It is a rule for reviews, placed in a roadmap index.
- **Scope.** Two suppliers the README cites, RiemannHypothesisStatementsAndConsequences and HermitianFormsAndLattices, are neither on main nor in an open pull request this review could read; the merge order of the family is the humans' to settle.
