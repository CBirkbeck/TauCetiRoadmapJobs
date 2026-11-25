# Review of LengthBoundsInPadicFamilies (pull request #3027 at f0da4ff)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/LengthBoundsInPadicFamilies/`
**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of the 35 lines changed since `3f8c596`, all in the README's sentences about the formal proof (headline 3, the labels of 1.7a and 1.8c); no statement, layer id or Lean declaration changes. Each new sentence agrees with the declarations it cites at the cited commit: in the setting of 1.8e the formal proof does prove the bound of 1.8c (1) over every residue field, by a finite free extension with ramification index 1 and a large residue field, and the last sentence of 1.7a (4) is the case `Z′ = Z`, `α = 1`, `A_α = 1` of the statement the proof uses. There are no findings and one small correction (a docstring of `Suggested.lean` that the change leaves out of date); the status of the formal proof as a source remains for the human reviewers.

## C01 — The module docstring of `Suggested.lean` still says, without exception, that the formal proof assumes a large residue field for the Ribet-type bound

The README now says that the formal proof assumes more than `g·n` elements in the residue field "except in the setting of 1.8e", where it proves the bound over every residue field (headline 3; 1.8c, *The form of the formal proof*). The module docstring of `Suggested.lean` (lines 32–34) was not changed and still reads "the formal proof assumes there a residue field with more than `g·n` elements", so the two files describe the formal proof differently, and a reader of the Lean file alone would take the bound over small residue fields to be absent from the proof in every setting.

The declaration `Formalism.RepresentationBoundsCohomology.ringDataObjects.LemmaFiveThreeAnyResidueField` has no cardinality hypothesis. Adding to the parenthesis the README's clause, "except in the setting of 1.8e, where it proves the bound over every residue field", would make the two agree.

## Previous findings

The previous review (at `3f8c596`) had no findings, no small corrections and no format notes; there is nothing to account for.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| 1.7a Method: "the last sentence of (4) is its case `Z′ = Z`, `α = 1`, `A_α = 1`" (`Formalism.NG.StatCongBoundGood`) | `Zg = Z`, `a = 1`, `A = 1`; `O = ℤ_p`, `A = M = {(a,b): a ≡ b mod pⁿ}`, `Z = {1}` | hypothesis on `Z ∖ Zg` empty; bound `finrank·(vcc + addVal 1) = finrank·vcc`. Example: `η = n`, `cc = pⁿO`, bound `1·(n + 0) = n` | agrees; equality |
| 1.7a Method: `congBoundGood` "from `Formalism.NG.QuotientPowerLengths.congMod_le`" | proof of `congBoundGood` | `refine congMod_le hsum L hL Zg (image of c ↦ a * act c on the ideal of Z) (x ↦ vcc + addVal A)`; `congMod_le` rests on `core` | matches |
| 1.7a Method: "also states and proves that last sentence separately … its main theorems do not depend on these two" | `StatCongBound`, `congBound`; the declaration list of the proof's kernel export (1,484,733 names) | `StatCongBound` at line 145, `congBound` at line 590 of their files; the export lists `StatCongBoundGood`, `congBoundGood`, `congMod_le` and neither `StatCongBound` nor `congBound` | agrees |
| 1.8c form of the formal proof: bound over every residue field in the setting of 1.8e (`…ringDataObjects.LemmaFiveThreeAnyResidueField`) | hypotheses read; blocks `c = 1, 2, 3` | `PrimHyp`: `IsLocalRing T`, blocks `c ≠ 0` of size 1 with diagonal `χ₁·ε^{−(c−1)}`, i.e. `χ, χε^{−1}, χε^{−2}`; block 0 with `AbsIrr` reduction; `eB`, `e₁`, `s`; no cardinality hypothesis; conclusion `vcc T Z π ≤ Σ_k length Hom(NN, ρ_k)` | agrees with "local `A`", the idempotents and `s`, every residue field |
| 1.8c: "every finitely generated module in place of `Y_s` with a nonzero homomorphism to `K^n` at every point over `X ∖ Z`" | the module `NN` of that declaration | `span (range n) = ⊤` for `n : Fin g → NN`; `∀ x′, p x′ ∉ Z → ∃ φ : NN → EvalSp …, φ ≠ 0` | agrees |
| 1.8c: "a finite free extension of `O` that keeps the valuation … more than `g·n` elements, over which the lengths are the same" | proof of `lemma_five_three_any_residue_field`; `O = ℤ_2`, `g·n = 3` | `StatBigResidueExt O (g * card d)` gives `O′` free, finite, `addVal′ = addVal`, `#k′ > g·n`; applied with `e = 1`, lengths `e·length`. Example: unramified quadratic extension, `#k′ = 4 > 3`, `e = 1` | agrees |
| 1.8c: "the form that [FormalProof] applies to the Hecke algebras of the family" (`Formalism.MainNotions.N.K.normalized_ring_data`) | proof of `normalized_ring_data` | it calls `displayFree` with `T = D.nd.T i`, and `displayFree` ends with `exact lemma_five_three_any_residue_field …` (`…/RamifiedBlockProofs/CompositeOfChainHolds.lean`, line 80) | supported |
| Headline 3 and the *Origin* of 1.8c: over every residue field the roadmap's own only "outside the setting of 1.8e" | general blocks `d_b` against one block plus characters | general: `globalConcrete` has `card g * Σ_k card{a : bl a = k} < #k`; setting of 1.8e: no bound on `#k` | consistent with both declarations |

The rows for the untouched statements, and for the four declarations of `Suggested.lean`, stand as in the previous review, of `3f8c596`.

- Source locators checked against the text: 5 this round, all in [FormalProof] at its first commit and all in the changed passages (the three newly cited files exist there, of 89, 81 and 64 lines); the seeded sample falls in them at 1.7a (Method) and 1.8c (the form of the formal proof and Sources); the sampled 1.8b, 1.8d and 1.8e are untouched.
- Formal proof declarations opened: 9 — `StatCongBound`, `StatCongBoundGood` (`Formalism/CharacterColumnKernels/StatementN.lean`, lines 145, 157), `congMod_le`, `congBound`, `congBoundGood` (`…/IdempotentNormalForms/LengthQuotSmulRangeFree.lean`, lines 559, 590, 605), `LemmaFiveThreeAnyResidueField` with `StatBigResidueExt` (lines 74, 46 of its file), `lemma_five_three_any_residue_field` (line 79), `normalized_ring_data` (line 20), with `PrimHyp` and `IdemHyp` (`Formalism/WachLatticeTwists/RamifiedBlockRings/Statement.lean`, lines 30, 40).
- Cross-roadmap citations: none added, dropped or changed by the diff.
- Record of the roadmap: no layer, section or item removed or renumbered; the 11 deleted lines are rewordings of labels.
- Lean: `Suggested.lean` unchanged; `lake env lean` on it gives four `declaration uses 'sorry'` warnings (lines 77, 102, 134, 160) and nothing else.
- Automatic checks: all passed. Dependency check: `depcheck: 122 roadmaps, 1391 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line.
- Pull request text: the description's account of the origin and method labels, and of results "that the source states and to which its main theorems do not refer", agrees with this folder at this head; the change adds no section, supplier or declaration that it would have to state. Every file the pull request changes lies in a roadmap folder it owns or in the two family indexes.
- The family index changed since the previous head in one row naming this roadmap (Ribet's lattice argument "in an adapted form with lengths"), which agrees with the *Origin* of 1.8c.

Overlap check: read AutomorphicCongruences, IntegralIwasawaTheoryPartII, ModularIwasawaMainConjectures (open) and CongruenceModulesOfThetaLifts, SelmerLengthBoundsAndLocalLifting, WachLatticesOverTheCyclotomicTower (on `main`) as in the previous review, the change touching no ownership; the congruence module of a commutative finite free algebra along an idempotent is owned by PadicFamilies §1.7a and cited here, the module form by this roadmap; nothing else shared.

Source independence: changed passages only; 4 passages compared with 1 source ([FormalProof]), none shared beyond declaration names and standard terms; largest share [FormalProof], 33 of 61 locators (the previous count plus the four added here); no layer added, removed or reordered, so the arrangement was not compared.

Research link: The bounds are length forms of the lattice method bounding congruence ideals by Selmer groups (Ribet 1976; Urban 2001; Bellaïche–Chenevier 2009; Berger 2009), on Hida's congruence modules (1986) and Johnston–Nickel's Fitting invariants (2013); they serve the formal proof of GRH for Dirichlet L-functions (Alpöge 2026). Rests on the README and on Hida, JN13, Berger09.

## Not verifiable

- [Urban01], Theorem 1.1 and p. 519: no open copy; read only as Berger09 restates it (untouched by this change).
- The journal versions of JN13, Berger09 and OW24: numbering compared on arXiv only (untouched by this change).

## Source issues

- none

## For the human reviewers

- Licence and scope: [FormalProof], the most-cited source (33 of 61 locators), is an unrefereed formalization announced on 20 November 2026; I read it at the cited commit in a copy the operator holds, its repository's licence not checked.
- Decisions applied: neither recorded decision touches this folder; no section leaves it, and 1.7a keeps its statements beside the citation of PadicFamilies §1.7a.
