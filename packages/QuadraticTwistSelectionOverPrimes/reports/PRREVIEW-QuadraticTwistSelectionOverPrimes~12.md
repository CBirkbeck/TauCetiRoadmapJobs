# Review of QuadraticTwistSelectionOverPrimes (pull request #3027 at f0da4ff)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/QuadraticTwistSelectionOverPrimes/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 4 lines changed since `3bddf73`: one sentence added to the *Method of the formal proof:* label of 2.7a, saying that the formal proof's prime number theorem in progressions and its lower bound (α) of (iii′) use Siegel's bound for real zeros. I checked the sentence against the formal proof's source and against the section of RieszSumsOverPrimesAndExceptionalZeros it cites, and it is correct. Accepted with no finding and no small correction; the two format notes of the previous review stand, neither blocking, and nothing new is left for a human to decide.

## N01 — The *Corollary of:* line of 2.7c names a step of its route, while the convention it follows says the line names the clauses it covers

Lines 371–373 say that AnalyticNumberTheoryPartI §1.7 gives one step of the proof of 2.7c, the count of the primes whose twists have a zero in the box. The convention at lines 57–59 describes the line as naming "the clauses it covers", and no clause of 2.7c follows from §1.7 alone. Adding "or the step of the route that it supplies" to the convention sentence would keep a reader from looking for a clause deduced from §1.7.

## N02 — The *Origin:* of 2.7b refers to "the classical mean values of real character sums over prime moduli" without a source

Line 240. The family's convention asks a *particular to this proof* label to give the nearest published result where one is known; as written a reader cannot find it. You could name one with a locator, or drop the clause.

## Previous findings

- The previous review (of `3bddf73`) had no finding. Its two format notes N01 and N02 are repeated above: the passages are unchanged at this head (lines 371–373 and 240).

## Verified sound

| Statement | Instances tried | Roadmap side (computed) | Source / library side (computed) | Result | Change |
|---|---|---|---|---|---|
| 2.7a method label, new sentence: Siegel's bound `β ≤ 1 − c(ε) q^(−ε)` | formal proof, `Formalism/LandauZeroFreeBounds/LogDerivRegionChiOf.lean` | real zeros `β` of real nonprincipal characters modulo `q`, every `ε > 0` | `ExcBound`: `χ² = 1`, `χ ≠ 1`, `L(β, χ) = 0` gives `β ≤ 1 − c·q^(−ε)`; proved from `SiegelLower` (`excBound_of_siegelLower`) | agrees | none |
| New sentence: the lower bound (α) of (iii′) uses it | `MSqCount.lean`, `count_a` | (α): `|P| ≥ U^(9/10)` under `(1/4)(log Y)² log m₀ ≤ log U` | `count_a` takes `ExcBound` as hypothesis, used at `ε = 1`; concludes `X^(9/10) ≤ |PPset|`; with `m₀ ≤ U^(4/(log Y)²) ≤ U^(1/100)`: `c₀U^(1−2/100)/log U ≥ U^(9/10)` | agrees | none |
| New sentence: the formal proof's prime number theorem in progressions uses it | `PNTFinal.lean`, `PNTEOf.lean`, `DeuringHeilbronnFinishTuran.lean` | relative error with exceptional pair, `log U ≥ C log M·log(log M + 2)` | `pnt_progressions_relative_weak_holds` built from files calling `excBound` (`etaOf_lower` at general `ε`; the repulsion at `ε = 1/2`) | agrees | none |
| New sentence: citation of RieszSumsOverPrimesAndExceptionalZeros, Scope and ownership | that README at this head, line 1181; its 1.7b label, line 640 | cited for Siegel's bound in the formal proof's twist selection | names `SiegelLower`, `ExcBound`, and the three uses: progression theorem, repulsion, count of primes of a class | resolves | none |
| 2.7a (iii) against the new sentence (the roadmap's own route) | line 134, supplier contracts line 575 | `c` "absolute and effective"; route through §1.7b (ii) and the effective gap of AnalyticNumberTheoryPartI §0.12 | the Siegel sentence is about the formal proof's route only; the next sentence says the route below differs | no contradiction | none |

The rows for the statements the change does not touch stand as in the previous review, of `3bddf73`.

- Formal-proof statements opened for this round: `SiegelLower`, `ExcBound`, `excBound_of_siegelLower`, `count_a`, `twist_bound`, `PNTAPRelW`, `pnt_progressions_relative_weak_holds`, `etaOf_lower`, `deuring_heilbronn_finish_turan`.
- Cross-roadmap citations resolved at this head: 1 new (RieszSumsOverPrimesAndExceptionalZeros, Scope and ownership, line 1181); §1.7b (ii) of the same roadmap, line 626, unchanged.
- Seeded sample: 2.7a contains the changed passage and was checked as above; 2.7b–2.7d are untouched and stand as in the previous review.
- Record: README only, 3 insertions and 1 deletion since `3bddf73`; no heading, layer, item or Lean declaration removed or renamed; `Suggested.lean` unchanged; every file the pull request changes against its merge base lies in a folder that is the pull request's own.
- Automatic checks: all passed. Dependency check: `depcheck: 122 roadmaps, 1387 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives five `sorry` warnings only (lines 105, 127, 151, 180, 220).
- Pull request text: its general statements hold for this folder (section numbers unchanged, both labels on every section, `Suggested.lean` unchanged, no supplier added); the new sentence is within "checked against the Lean source", and the head contradicts nothing it says of this folder.

Overlap check: read RieszSumsOverPrimesAndExceptionalZeros, FrobeniusRestrictedRieszSums, GeneralizedRiemannHypothesisFromWindowBounds (main, at this head) and AnalyticNumberTheoryPartI; nothing shared: the log-free density estimate is owned by AnalyticNumberTheoryPartI §1.7, the one-modulus prime number theorem by RieszSumsOverPrimesAndExceptionalZeros §1.7b, both cited, and twist selection is owned only here.

Source independence: changed passages only; 1 passage compared with 1 source (the formal proof's Lean statements), nothing shared beyond the formula of the bound; largest share of source mentions [FormalProof], as in the previous review. Arrangement not compared: no layer added, removed or reordered.

Research link: 2.7c–2.7d select the auxiliary primes of the formal proof of the Riemann hypothesis for Dirichlet L-functions announced by Alpöge (2026); their analytic inputs are Gallagher's 1970 prime number theorem in Linnik's range and Jutila's 1977 log-free zero-density estimate. Rests on the README's summary and References and on the Announcement.

## Not verifiable

- Jutila 1977, *On Linnik's constant*, Math. Scand. 41, 45–62, Theorem 1 (the *Origin:* of 2.7c and References, untouched by this change): not readable from a classified host; as in the previous review, the estimate was confirmed only through its restatement in Thorner–Zaman, arXiv:2208.11123v4, and the theorem number was not.

## Source issues

- none

## For the human reviewers

- Neither recorded decision applies to this folder: it removes or moves no section.
- Licence: Jutila 1977 is cited in 2.7c and References but is not in this roadmap's sources manifest; its text could not be read from a classified host.
- Licence: the manifest records Gallagher1970 as paywalled and uncertified, while an open GDZ scan of the same paper (DOI 10.1007/BF01403187) is recorded for RieszSumsOverPrimesAndExceptionalZeros; the previous review read that scan.
