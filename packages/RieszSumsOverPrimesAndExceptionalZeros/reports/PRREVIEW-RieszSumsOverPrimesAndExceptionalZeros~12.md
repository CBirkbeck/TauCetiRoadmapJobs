# Review of RieszSumsOverPrimesAndExceptionalZeros (pull request #3027 at f0da4ff)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RieszSumsOverPrimesAndExceptionalZeros/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 31 lines changed since `3f8c596`: accepted, with no finding. The added sentences say what the formal proof has in place of the polynomial gap of 2.9b (iv) (c′) (a gap for the series of an abstract family of class coefficients) and where it uses Siegel's bound; each was read against the formal proof's Lean source and holds. The previous small correction is repaired; one format note is carried over, not blocking. The standing of the formal proof as a source is left to the human reviewers as before.

## N01 — In the module docstring of `Suggested.lean` (lines 20–21), "also this roadmap's own except for that bound, which the family uses" reads as if the family used the bound for `G_1`; what it uses is 1.4i (c′). "…(1.4i (c′)), which the family uses, also this roadmap's own except for that bound" would say it.

## Previous findings

The previous report had no finding; its small correction and its format note are accounted for.

- C01 — repaired: the docstring of `card_primes_norm_one_mod_shortInterval_ge_of_discr_eq_neg_prime` now reads "`B = d M²` (the formal proof has `B = 4dM²`; the statements are equivalent, for other `A, c, c′`, as 2.9b (iv) (c′) says)".
- N01 — not repaired: `Suggested.lean` lines 20–21 are unchanged, "also this roadmap's own except for that bound, which the family uses"; written again above as a format note.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Docstring of the Lean count: `B = dM²` equivalent to the formal proof's `4dM²` | least case `d = 103`, `M = 3`; both directions | `dM² = 927`, `4dM² = 3708`, `log 4/log 927 = 0.203`, so `4dM² ≤ (dM²)^1.21`: `(A, c, c′)` becomes `(1.21A, c/1.21, c′)`; conversely same constants | holds; signature unchanged | none |
| 2.9b (iv) (c′), added paragraph: the count "has no clause on zeros" | `GlobalTheory.Hk.normPrimes_short_interval_lower`, line 98 of its file | hypotheses `d` prime, `d % 4 = 3`, `100 ≤ d`, `3 ≤ M`, `1 ≤ X`, `log(4dM²) ≤ c√(log X)`, `e^(−c√log X) ≤ h ≤ 1`; conclusion the count only | as the README says | none |
| Same paragraph: the gap is for the series of an abstract family, `(s − 1)^([χ = 1]) Σ aχ(n) n^(−s)` | `LFam.real_zero_far_from_one` (line 47); structure `LFam`; its `F`, `mel`, `res` | `Σ aχ(n)n^(−s) = s·mel + res·s/(s − 1)`; times `(s − 1)`: `res·s + (s − 1)s·mel = F` for `χ = 1`; `F = s·mel` otherwise; `χ·χ = 1`, `3/4 ≤ β`, `c/B^A ≤ 1 − β` | agrees; fields `count`, `theta`, `conv`, `sq`, `a_nonneg`, constants in `B`, as listed | none |
| Same paragraph: the family comes from an existential theorem that does not identify its series with `L(s, ψ*)` | `GlobalTheory.Hk.exists_lFam_ray`, lines 73–74 | conclusion: `∃ 𝓕, 𝓕.B = 4dM² ∧` (primes with `lam 0 p ≠ 0` are norms `≡ 1`); no clause on `F` or on a Hecke `L`-function; used at line 106 of the count's proof | as the README says | none |
| Scope: Siegel's bound `|L(1, χ)| ≥ c(ε)q^(−ε)` and the derived `β ≤ 1 − c(ε)q^(−ε)` | `SiegelLower` (`SiegelWalfiszAP.lean` line 29), `ExcBound` (`LogDerivRegionChiOf.lean` line 50), `ExcBoundOf` (line 78) | both for `χ² = 1`, `χ ≠ 1` modulo `q`; derivation: `|L(1)| ≤ C log²(3q)(1 − β)` gives `1 − β ≥ c q^(−ε)/(C log² 3q) ≥ c″q^(−2ε)` | statements as written | none |
| Scope and label of 1.7b: the second prime number theorem in progressions, its repulsion and the class count use that bound; the twist selection uses that theorem | `deuring_heilbronn_finish_turan` (line 19), `PNTEOf.lean` line 143, `count_a` (line 346), `twistK` lines 154–157 | each calls `excBound`; `twistK` takes `pnt_progressions_relative_weak_holds`, built from `deuring_heilbronn_lossy`, and `count_a` | as the README says | none |

The rows for the untouched statements stand as in the previous review, of `3f8c596`; the diff changes no statement of the README and no Lean signature (four passages of commentary and one docstring).

- Source locators checked against the text: 9 declarations of the formal proof opened in its Lean source, at the files and names the README gives (namespaces `GlobalTheory.Hk` and `Formalism.ZeroFreeDirichlet` confirmed).
- Seeded sample: of its ten targets only 1.7b (its method label) and 2.9b fall in the changed passages; checked as above. The others are unchanged.
- Cross-roadmap citations resolved: 1 consumer read at this head, QuadraticTwistSelectionOverPrimes (lines 75–89 and its `*Needs:*` lines cite §1.7b (ii) and (iv) and this roadmap's Scope and ownership for Siegel's bound), in agreement with the changed sentence of the scope.
- Elaboration: `Suggested.lean` elaborates with seven `sorry` warnings and nothing else. The automatic checks all passed.
- Dependency check: `depcheck: 122 roadmaps, 1390 edges, 0 problem(s)`.
- Record: no layer, item or heading is removed or renumbered.
- Outside the folder: the pull request changes nothing outside `TauCetiRoadmap/`, and there only folders it owns and the two family indexes.
- Pull request's text: the description says the family's statements about the formal proof were checked against the Lean source; no sentence of it is contradicted by this head, and the change adds, removes or renumbers nothing it would have to state.

Overlap check: as in the previous review (read AnalyticNumberTheoryPartI, QuadraticTwistSelectionOverPrimes, RiemannHypothesisStatementsAndConsequences, ZerosOfLFunctions; LiCoefficientsArithmeticFormula and SpecialFunctionsGamma name none of these objects). Shared: the character prime number theorem with the exceptional term, the one-modulus repulsion and Linnik's theorem, owner AnalyticNumberTheoryPartI §§1.4e, 1.7a, 1.7b, restated here under `*Corollary of:*` lines; Riesz sums, owner RiemannHypothesisStatementsAndConsequences §8.4a. Nothing else is shared, and the change touches none of these.

Source independence: changed passages only; 4 passages compared with 1 source (the formal proof, which is Lean code with no prose at these places), none shared beyond declaration names and formulas; largest share Linnik1944a/b and Bombieri1987, 4 each of about 40 locators; the diff adds, removes and reorders no layer, so the contents were not compared.

Research link: 1.7b is Linnik's theorem with the Deuring–Heilbronn repulsion (Linnik 1944; Bombieri 1987) and Gallagher's theorem (Gallagher 1970; Thorner–Zaman 2019, Th. 1.4); 1.4g (b) is Iwaniec–Kowalski Th. 5.27, used by Bennett–Siksek (2020); 2.9b adapts Thorner–Zaman 2019. Rests on the README and the texts read.

## Not verifiable

- Koukoulopoulos 2019, Iwaniec–Kowalski 2004, Lagarias–Montgomery–Odlyzko 1979, Fogels 1964, Turán 1953, Thorner–Zaman 2019: not read in this round. The text citing them is unchanged.
- Davenport 1980 and Stark 1974: settled as uncertified, cited by locator.
- [Announcement]: not read.

## Source issues

- none

## For the human reviewers

- The decision on GeneralizedRiemannHypothesisFromWindowBounds was applied: this README does not name it as a consumer of 2.41a, and no section of this roadmap moved.
- The decision on published theorems was applied: no section is removed here; 1.4g (b), 1.7b (i) and (iii) keep their statements under `*Corollary of:*` lines, and AnalyticNumberTheoryPartI §§1.4e, 1.7a, 1.7b state them.
- Licence: the added sentences on [FormalProof] were checked in a copy of its public GitHub repository, which carries no licence; the README cites file and declaration names and states their content in its own words, no code.
- Scope: the README now records (2.9b (iv) (c′), line 908) that the formal proof's ray-class family is given by an existential theorem whose statement does not identify its series with the Hecke `L`-functions.
