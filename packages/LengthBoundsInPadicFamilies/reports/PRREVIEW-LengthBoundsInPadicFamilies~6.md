# Review of LengthBoundsInPadicFamilies (pull request #2898 at 842edcb)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/LengthBoundsInPadicFamilies/`
**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 91 lines changed since `70fd942` finds no finding, no small correction and no format note. The one earlier finding is repaired: the second Check of 1.8d now says that with no local conditions the bound of 1.8d(2) follows from 1.8c(1) and is weaker, with the two-point example (`m ≤ 2m` against an infinite term), which I recomputed. The three earlier small corrections and four format notes are repaired too, and the repairs introduce no new problem. The file and declaration locators into the formal proof that the repair adds could not be read, so they are unverified; the human reviewers still decide the scope and licence questions about that unrefereed source.

## Previous findings

- R01 — repaired: "With `𝒱 = ∅`, `H¹_𝒮` is all of `H¹(G, ρ_b ⊗ χ^{−1} ⊗ K/O)`, and the bound of (2) follows from 1.8c(1) … it is weaker in general", with the computed example (README lines 362–366).
- C01 — repaired: the description now reads "in four declarations" and names `length_quot_le_sum_length_blockSolutions_of_card_residueField`.
- C02 — repaired: each statement attributed to [FormalProof] names a file and a declaration, and the References fix the `src/` tree at commit `e50d098`. The locators themselves could not be opened (see Not verifiable).
- C03 — repaired: the Summary now has "When `Rel` is finitely generated and the residue field of `O` has more than `g·Σ_bd_b` elements", and 1.8b (1′) says "The route below does not use finite generation".
- N01 — repaired: no line of `Suggested.lean` exceeds 100 characters.
- N02 — repaired: "`η_Y(M)` is the length of the quotient of `M` by `(M ∩ V_Y) ⊕ (M ∩ V_{X∖Y})`".
- N03 — repaired: "the lifting-the-exponent identity of DiophantineApproximationAndTranscendence §3.7".
- N04 — repaired: "[Hida], §0, §3 ((3.9a), (3.11)) and §6"; both displays are there (Hida lines 859, 907).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.8d Check 2 (`𝒱 = ∅`), rewritten | case (a) of 1.8c, `O = ℤ_p`, `p` odd, `G` free profinite on four generators, `χ = 1` | 1.8c(1): `m ≤ m + m`; block `χ`: `H¹ = Hom_cont(G, ℚ_p/ℤ_p) = (ℚ_p/ℤ_p)⁴`, length `∞`; `Hom_𝒜(Y_s, ·)/C_b ↪ H¹` since the `y_γ` generate `Y` | holds as now written | none |
| Summary headline 2 and 1.8b (1′), `Rel` finitely generated; fourth Lean theorem (`hRel : Rel.FG`) | `𝒜 = O`, `g = d = 1`, `Rel = ϖⁿO`; `Rel = 0`; `𝒜 = O[t_1, t_2, …]`, `ψ(t_i) = 0`, `Rel = (t_i)` not finitely generated | `det = ϖⁿ`, `Sol = (K/O)[ϖⁿ]`, `n ≤ n`; `J = 0`, `∞ ≤ ∞`; `ψ(Rel) = 0`, `Sol = K/O`, `∞` on the right | holds; Summary, (1′) and Lean agree; finite generation not needed by the route, as (1′) says | none |
| 1.7a (3), "length of the quotient" | `A = M = {a ≡ b mod ϖⁿ}`, `Y = {1}` | `(M ∩ V_Y) ⊕ (M ∩ V_{X∖Y}) = ϖⁿO × ϖⁿO`, quotient `O/ϖⁿ`: length `n`, cardinal `#kⁿ` (infinite for infinite `k`) | holds; "length" is the right word | none |
| 1.7a, first and second Lean theorems (docstrings only changed) | elaborated types against README (4), (4′) | statements unchanged from `70fd942`; four `sorry` warnings, nothing else | hold | none |

The rows for the untouched statements stand as in the previous review, of `70fd942`.

- Source locators checked against the text: 2, in 1 source (Hida (3.9a) at line 859, (3.11) at line 907). The 21 declaration locators into [FormalProof] added by the change were not readable.
- Library declarations opened at the pins: none new; the change touches no Lean statement and names no new library declaration.
- Cross-roadmap citations resolved: 1 touched by the change (DiophantineApproximationAndTranscendence §3.7, the identity `v_p((1 + a)^b − 1) = v_p(a) + v_p(b)`, as the previous review read it); the others are unchanged.
- Dependency check: `depcheck: 171 roadmaps, 1994 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean` at this head: four `sorry` warnings and nothing else. The change to the file is docstring text and a rewrapped paragraph; the four elaborated types equal those compared with the README in the previous review, with `Rel.FG` and the residue-field bound present in the fourth.
- One-tactic probe: not rerun, the four statements being unchanged; the previous result (none closes) stands.
- Automatic checks: all passed at this head. Outside the folder the pull request changes only the family index, where since `70fd942` one entry (FrobeniusRestrictedRieszSums) moves earlier in the list of sub-roadmaps, its text unchanged.
- The pull request's title and description agree with this head: a new roadmap folder, two of three headlines in four declarations, the locators into the formal proof, the family index, the open supplier SelmerLengthBoundsAndLocalLifting.

Overlap check: read CongruenceModulesOfThetaLifts, SelmerLengthBoundsAndLocalLifting, WachLatticesOverTheCyclotomicTower (open) and PadicFamilies, IntegralHeckeAndGaloisDeterminants (main), as in the previous review; nothing shared. The change adds no object and no layer; no open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only; 3 passages compared with 1 source (the Hida locator sentence of 1.7a, the wording of 1.7a (3) and the first `Suggested.lean` docstring against Hida §3), none shared; largest share [FormalProof], whose text could not be read, so the added locators and the wording beside them were not compared with it; no layer added, removed or reordered, so the arrangement was not compared again.

Research link: 1.7a extends Hida's modules of congruences of Hecke algebras (Hida 1986, §§0, 3). 1.8c–1.8e give Ribet's construction of unramified extensions (Ribet 1976) a length form, with the generalized matrix algebras of Bellaïche–Chenevier (2009, Chapter 1). They feed CongruenceModulesOfThetaLifts in the family built on Alpöge's formal proof (2026). Rests on the README, Hida and BC09.

## Not verifiable

- [FormalProof]: the sources service has no licence class for the repository's host, so none of the files and declarations now named in the Conventions, 1.7a, 1.8b (1′), 1.8c, 1.8d (3′), 1.8e and two `Suggested.lean` docstrings was opened; that each exists at the stated commit and states what is recorded is unchecked.
- [Ribet76] §§2–4: no legal copy found, as before.

## Source issues

- none

## For the human reviewers

- Scope: the most-cited source, [FormalProof] (README References), is an unrefereed Lean formalization announced on 20 November 2026; the announcement says no written proof is presented. The other sources are refereed (Hida 1986, Ribet 1976, Bellaïche–Chenevier 2009).
- Not tested: [FormalProof], the source with the largest share of the citations, could not be read; the 21 file and declaration locators added at this head, the wording, the arrangement and the Lean statements were not compared with it.
- Licence: the licence of the formal-proof repository was not read; whether the four `Suggested.lean` statements resemble declarations of that repository was not checked.
