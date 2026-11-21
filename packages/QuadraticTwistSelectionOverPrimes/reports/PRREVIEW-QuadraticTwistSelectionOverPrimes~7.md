# Review of QuadraticTwistSelectionOverPrimes (pull request #2878 at c876b1e)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/QuadraticTwistSelectionOverPrimes/`
**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 34 lines changed since `8e342bd` found no false or unsupported statement. The three small corrections of the previous review are repaired (the routes are now said to start from roadmap sections, 2.7d (ii′) is attributed to the formal proof at one pair of progressions only, and the description counts five headlines and five definitions and names all suppliers); the deduction of 2.7d (ii′) from 2.7c (a′)–(c′) that the new wording relies on was recomputed and holds. The title and description agree with this head. One format note is carried over, not blocking. What the formal proof itself contains could still not be read and is left to the human reviewers, with the scope and licence of that source.

## N01 — The convention "A target whose status or route names [FormalProof]" (Conventions, line 46) also matches the general targets, whose status lines name it to say they are not its statements

2.7a (iv) and 2.7b (iii) say "not a statement of [FormalProof]", and each general statement says "[FormalProof] proves (…′)", so read literally the convention applies to them too. "A target headed *The form of the formal proof* (the primed items)" would say what is meant.

## Previous findings

The previous report (of `8e342bd`) had no finding; its three small corrections and its format note are accounted for here.

- C01 — repaired: lines 7, 115, 245, 349 and 424 now read "proved by the route(s) below from the roadmap sections it cites" (line 245 adds "and the Mathlib bound"); no "published theorems" remains.
- C02 — repaired: Conventions lines 38–40, the module docstring and the docstring of `twistSelection_two_of_conductorBound_fixedWidth` say the formal proof proves (ii′) "at one pair of progressions", the stated form following from 2.7c (a′)–(c′).
- C03 — repaired: the description says "5 headline theorems … and 5 definitions", lists ClassicalArithmeticCompletion §§1.5–1.6, ExplicitPrimeCounting §0.3a, AnalyticNumberTheoryPartI §0.11a and the consumer FrobeniusRestrictedRieszSums, and describes the primed forms.
- N01 — not repaired: line 46 still reads "A target whose status or route names [FormalProof] is stated in the form that proof establishes"; written again above as a format note.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.7d (ii′) from 2.7c (a′)–(c′) (the claim the changed text makes), `twistSelection_two_of_conductorBound_fixedWidth` | step 1 with `Ξ₀`, `F = F₁`, exponent `ε₁`; step 2 with `2R` characters, `F = F₂(q)`, exponent `ε₂` | step 1: conductors `≤ N₀ ≤ F₁`, pair `(1,0)`, height `F₁U₁`; step 2: `q > √U₁ ≥ F₁ ≥ N₀` so conductor `cond(ξ)q ≤ N₀q ≤ F₂(q)`, pairs `(0,1), (1,1)`, height `F₂(q)U₂`; `Y₀ = max(Y₀(ε₁,…,R), Y₀(ε₂,…,2R))`; same absolute `C₂` | follows; nonemptiness of every `P(m₂(q), a₂(q); U₂)` from 2.7c under the hypotheses for every `q` | none |
| 2.7d (ii′), the one pair of progressions | `ε₂ = 6ε/5`, `z = Y^(ε/5)`, `(m₁, a₁, U₁, F₁) = (8, 3, e^z, N₀)`, `F₂(q) = N₀U₁` | `6ε/5 ≤ 1/4` iff `ε ≤ 5/24` (here `ε < 1/52`); `Y^(ε₂/6) = z`; `Y^(ε/6) ≤ z ≤ z(log Y)²`; `N₀U₁ ≥ N₀q` as `q ≤ U₁`; `(1/4)(log Y)² log 8 ≤ z` for large `Y` | an instance of the stated form, so "at one pair of progressions" is consistent with 2.7d | none |
| Line 245: inputs of the route of 2.7b (ii) | its *Needs:* line | 2.7b (i), 2.7a (iii), AnalyticNumberTheoryPartI §§0.11–0.11a, and one Mathlib bound, `Chebyshev.psi_le_const_mul_self` | "the roadmap sections and the Mathlib bound it cites" is accurate | none |
| Lines 115, 349, 424: inputs of the routes of 2.7a (iii), 2.7c, 2.7d | their *Needs:* lines | only roadmap sections (RieszSumsOverPrimesAndExceptionalZeros §§1.4e, 1.4f, 1.7b (ii); AnalyticNumberTheoryPartI; ExplicitPrimeCounting §0.3a; ClassicalArithmeticCompletion §§1.5–1.6; RiemannHypothesisStatementsAndConsequences §8.4a (b)) | accurate | none |
| Description against the head | counts, suppliers, attributions | 5 theorems, 5 definitions in `Suggested.lean`; supplier contracts name the same sections as the description; outside the folder only the three files of the family index | agrees | none |

The rows for the untouched statements stand as in the previous review, of `8e342bd`; the diff changes no Lean statement (two docstrings only).

- Source locators checked against a text: 0 new (the changed passages add none); the announcement was read in the previous review.
- Cross-roadmap citations resolved again at main or at the open head: 7 (RieszSumsOverPrimesAndExceptionalZeros §§1.4e, 1.4f, 1.7b; RiemannHypothesisStatementsAndConsequences §8.4a; AnalyticNumberTheoryPartI, ClassicalArithmeticCompletion and ExplicitPrimeCounting present on main). §1.4e and §1.4f still say their general forms are "this roadmap's", which the new wording matches.
- Library declarations opened at the pin: 1 (`Chebyshev.psi_le_const_mul_self`, Mathlib/NumberTheory/Chebyshev.lean:485).
- Elaboration: `Suggested.lean` elaborates with five `sorry` warnings (lines 105, 127, 151, 180, 220) and nothing else. The elaborated signatures of the 10 declarations are those of the previous review; no statement changed.
- Automatic checks: all passed. Dependency check output: `depcheck: 171 roadmaps, 1990 edges, 0 problem(s)`. No file outside the folder changed since `8e342bd`.
- Seeded sample (2.7a–2.7d): it falls in the changed passages only through their attribution sentences, checked above; the changed passages carry no source locator.
- Duplication: the diff adds no object; the audit of the previous review stands.
- Overlap check: read RieszSumsOverPrimesAndExceptionalZeros, FrobeniusRestrictedRieszSums, ThetaChainsAndFrobeniusPrimeSums, QuasiRiemannHypothesis, SieveMethodsAndPrimePatterns, AnalyticNumberTheoryPartI, QuadraticCharactersAndReduction (the first, at its head, again this round; the others as in the previous review); the Riesz remainder is shared and owned by RiemannHypothesisStatementsAndConsequences §8.4a (b), cited here; nothing else shared.

Source independence: changed passages only: 6 changed passages (four README sentences, two docstrings) compared with 1 source (the announcement), none shared; no source holds a share of the locators (Gallagher1970 one page range, Announcement one footnote, FormalProof none); the diff adds, removes or reorders no layer, so the arrangement was not compared again; the formal proof and Gallagher 1970 could not be read.

Research link: 2.7a rests on Gallagher's 1970 prime number theorem in Linnik's range and on the log-free zero density of Jutila (1977) and Montgomery (1969); 2.7c–2.7d select the auxiliary primes used in the family that follows Alpöge's formal proof (announced 2026). README overview and References, and the supplier sections read.

## Not verifiable

- Every attribution to [FormalProof], including the repaired one (that it proves 2.7d (ii′) at one pair of progressions, and 2.7a (i′), (iii′), 2.7b (ii′), (iv′), 2.7c (a′)–(c′)): neither the archive nor the repository could be read as a document.
- Gallagher 1970, pp. 329–339: paywalled, cited by its locator without the text.
- The description's paragraph on the versions of the family index that other pull requests carry: the heads of those pull requests were not available to this review.

## Source issues

- none

## For the human reviewers

- **Scope.** The roadmap's main source is [FormalProof], a Lean archive announced on 20 November 2026 and not refereed; the announcement (Announcement lines 5–53) states none of the targets. The general statements are the roadmap's own, with routes through roadmap sections.
- **Scope.** 2.7a (iv), stated as `abs_sum_jacobiSym_primes_le`, rests on AnalyticNumberTheoryPartI §0.34 (uniform exclusion of Landau–Siegel zeros); 2.7b–2.7d do not use it. QuasiRiemannHypothesis §10.7 is cited in remarks only.
- **Licence.** The formal proof's repository and archive carry no licence class in the sources service; whether `Suggested.lean` resembles declarations of that formalisation could not be compared.
- **Not tested.** Wording and arrangement were not compared with [FormalProof] or with Gallagher 1970, neither being readable; no other source carries a locator.
