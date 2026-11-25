# Review of FrobeniusRestrictedRieszSums (pull request #3027 at f0da4ff)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/FrobeniusRestrictedRieszSums/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 16 lines changed since `cd123f8`, all in the third Check and the `*Sources:*` line of 1.4. Accepted with no findings: the Check again asserts the bound of AnalyticNumberTheoryPartI §0.34 as the theorem it is, and the five declaration names the new `*Sources:*` line cites exist in the cited files of the formal proof at the cited commit and state what the line says of them. Two format notes are carried from the previous report, none blocking; the scope fact for the humans who approve stands.

## N01 — The method label of 0.7 has no locator into [FormalProof]

The `*Sources:*` line of 0.7 (line 628) still names no file of the formal proof, unlike every other section with a method label. At the commit the README cites, the argument is `UpperTheory.BernoulliSumsFrobeniusOrbits.topsGroup` in `Development/AutomorphicArithmetic/ThickFrames/topsGroup.lean` and its single-functional step `UpperTheory.BernoulliSumsFrobeniusOrbits.select` in `ThickFrames/select.lean` (as read for the previous report). Naming them would let a reader check the label.

## N02 — The family index and this README describe the labels of the definition sections differently

The family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, line 194) says every section that states something to prove carries two labels, the method label reading `none` where the formal proof has no such statement. Here 0.1, 0.3, 0.5, 0.6 and 0.9, which state facts with routes, carry `*Origin:*` only, as the Labels paragraph (line 122) says. Either wording is fine; one of the two could follow the other.

## Previous findings

The previous report had no findings; its remarks were one small correction and two format notes.

- C01 — repaired: line 1026, "AnalyticNumberTheoryPartI §0.34 (`(1 − β) log q ≥ c_LS` …) gives the conclusion of (b) for every finite abelian `E/ℚ` without the box hypothesis"; the clause "which assumes no such bound" is kept.
- N01 — not repaired: line 628, "*Sources:* (Bernoulli selection; Chebyshev and Markov inequalities)". Carried as N01.
- N02 — not repaired: family index line 194, "Every section … that states something to prove carries two labels"; this README's line 122 gives five sections the first label only. Carried as N02.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.4, third Check (reworded) | real zero `β` with `(1 − β) log q ≥ c_LS`, `log q ≤ (log y)^α` | term `y^β/β ≤ 2y·e^{−(1−β) log y} ≤ 2y·e^{−c_LS (log y)^{1−α}}`; supplier §0.34 (its line 772) is a theorem, used as a fact at its lines 60, 473 | true; assertion matches supplier | none |
| 1.4, `*Sources:*`: `PropTwoSixThinScales` as "the form at the thin scales" | formal definition against the first Check of 1.4 | formal: box hypothesis with `log N_E ≤ 2x^{ε/5} log² x` gives `‖G_χ(y)‖ ≤ y·e^{−c x^{ε/8}}` for `y ≥ e^{x^{ε/3}}/3`; Check: same `X`, same conductor bound, `31/150 > 1/5`, `19/150 > 1/8` | agree | none |
| 1.4, `*Sources:*`: `FamilyPropTwoSixCongruenceForm`, "for a family" | formal definition | `∃ c > 0, ∃ x₀ > 1`, for all `x ≥ x₀` and every member of the family, `PropTwoSixThinScales` with that `c` | agree | none |
| 1.4, `*Sources:*`: "from the three statements on zeros by … `LitThin`, `prop_two_six_congruence_family_of_literature`" | formal definition and theorem | `LitThin` is a conjunction of exactly 3 statements (zero-free region with exceptional real zero and count near `1`; truncated explicit formula; zeros in unit windows); the theorem is `LitThin → FamilyPropTwoSixCongruenceForm Fm` | agree, and matches the method label's three steps | none |
| 1.4, `*Sources:*`: `UpperTheory.Top.ThinH` beside `RealBox` | formal definition | `ThinH`: `∃ c > 0`, for hosts with a conductor bound and `RealBox H`, the `ChebyshevCharacterBound` holds for `x ≥ x₀`; in the same file and namespace as `RealBox` | agree | none |
| 1.4, `*Sources:*`: `Conclusion6` no longer cited | formal definition | `Conclusion6` assumes the prime hypothesis `PrimesAsPropTwoFive`, not the box hypothesis; `PropTwoSixThinScales` assumes the box hypothesis, as 1.4 (b) does | the new name is the right one | none |

The rows of the previous review, of `cd123f8`, stand for every statement the change does not touch.

- Source locators: 3 cited files of [FormalProof] read at commit `40e56ba` under `src/` (`CharacterBoxes/PairGood.lean`, `GlobalSchurBounds/ShortIntervalPrimes.lean`, `GlobalSchurBounds/MainSup.lean`); 5 newly cited declarations and the removed one found there, each in the namespace the README gives. The seeded sample falls in the changed passage at 1.4 only.
- Cross-roadmap citations resolved at this head: AnalyticNumberTheoryPartI §§0.34, 0.34a, 1.4e; RieszSumsOverPrimesAndExceptionalZeros §1.4i; ZerosOfLFunctions §6.3; RiemannHypothesisStatementsAndConsequences §8.4a.
- Record: no heading, layer, item or Lean declaration is changed since `cd123f8`; against the merge base, 0 headings removed or added, 0 layers retitled.
- Automatic checks: all passed. Dependency check: `depcheck: 122 roadmaps, 1390 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean`: three `sorry` warnings (lines 113, 236, 366), nothing else. `Suggested.lean` is unchanged since `cd123f8`; no padding probe was rerun.
- The pull request's text: its sentences on the family (section numbers unchanged, the two labels, `*Corollary of:*`) agree with this folder at this head; the change since `cd123f8` alters nothing they describe.
- Ownership: the change adds no object.

Overlap check: read ThetaChainsAndFrobeniusPrimeSums, QuadraticTwistSelectionOverPrimes, ThetaChainsOnDefiniteUnitaryGroups, SidonSetsAndLinearEquations; nothing shared (as in the previous review; the change adds no object and no citation of them).

Source independence: changed passages only; 2 passages (the third Check and the `*Sources:*` line of 1.4) compared with 1 source, [FormalProof], which is Lean code without prose, none shared; largest share [FormalProof]; contents not compared (no layer added, removed or reordered). Davenport, Washington, Ihara–Murty–Shimura, Behrend and Ruzsa could not be read.

Research link: the roadmap is the analytic frame of the formal proof of the Riemann hypothesis for Dirichlet L-functions announced by Alpöge on 20 November 2026 ([Announcement], [FormalProof]); 1.9 reduces a square-root bound for the cyclic family to the Frobenius-restricted inequality, with tools adapted from Behrend (1946), Ruzsa (1993) and Davenport (2000). Rests on the README.

## Not verifiable

- Davenport, *Multiplicative Number Theory*, ch. 19–20, and the Landau–Page attribution on the changed `*Sources:*` line of 1.4: a book with no legal open copy; that part of the line is unchanged.
- Ihara–Murty–Shimura (2009), Behrend (1946), Ruzsa (1993) and Washington, as in the previous report: not in the changed passages and not read.

## Source issues

- none

## For the human reviewers

- Scope: the principal source is [FormalProof], a Lean proof announced on 20 November 2026 ([Announcement]) with no refereed publication. The Origin labels mark 0.4, 0.8b, 1.1, 1.7, 1.8 and 1.9 as particular to it.
- Not tested: the wording of the Origin labels against Davenport, Washington, Ihara–Murty–Shimura, Behrend and Ruzsa, none of which could be read legally here.
- Licence: the sources service puts the host of [FormalProof] (the public repository the README cites) in no licence class; its three files were read there directly at the cited commit.
- Decisions: this folder removes no section or layer, so neither recorded decision was needed for it.
