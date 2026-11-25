# Review of RiemannHypothesisStatementsAndConsequences (pull request #3027 at 2ac59b9)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RiemannHypothesisStatementsAndConsequences/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 32 lines changed since `7b5fe43`: the size clause of 8.4a (b), whose linear bound is now a remark, and the new origin and method labels of 9.2. Both changes are mathematically correct and their citations of the formal proof say what the cited declarations say, so there is no finding and the folder is accepted. Two small corrections (the description, and a list in the reference entry that the change leaves one section short) and one format note remain, none blocking; one decision of the human reviewers was applied, and nothing new is left for them.

## C01 — The description does not say that the linear bound of 8.4a (b) became a remark

The description lists the places where "the formal proof's form is the statement and the stronger form a remark", and for the Riesz remainder it names only "the bound `C·y²` for the remainder of the Riesz sum (GeneralizedRiemannHypothesisFromWindowBounds 0.4)". This head makes the same change in this roadmap: the size clause of 8.4a (b) (README line 286) now states only `‖rieszRemainder ψ y‖ ≤ C_ψ y²`, and the bound `C′_ψ y`, which the clause stated on `main`, is the remark of line 295. A reader of the description does not learn that a clause of 8.4a lost a bound.

Text that would be right: "… and the bound `C·y²` for the remainder of the Riesz sum (RiemannHypothesisStatementsAndConsequences 8.4a (b) and GeneralizedRiemannHypothesisFromWindowBounds 0.4)". The description's sentence on this roadmap could also say that its 9.4 and 9.5 cite the new AnalyticNumberTheoryPartI §§1.6a and 2.42a; the new supplier AnalyticNumberTheoryPartIII §8.2a is now named there.

## C02 — The reference entry for [FormalProof] lists the sections that record its form, and now omits 9.2

The entry (line 2010) says: "The form it has of each statement of 8.4a, 8.8a, 9.3, 9.4, 10.2 and 10.3 that cites it is recorded at that statement." With the new method line of 9.2 (lines 591–597), which records the form of `GlobalTheory.Lin.zeros_eq_zeros_primitiveCharacter`, 9.2 is a seventh such section, so the list sends a reader past it. Add 9.2 to the list.

## N01 — `Deduction.ch_balance` is cited without its file

In the method line of 8.8a (line 454) `Deduction.ch_balance` is still the only [FormalProof] declaration cited without a path; the two declarations this change cites carry theirs. It is in `Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChBalance.lean`.

## Questions for the author

- 9.5's origin and the reference entry for Belabas, Diaz y Diaz and Friedman (2008), §2, pp. 1187–1188, say that the hypotheses are there "read as the absence of zeros right of `1/2`". Is that reading on those pages, or only in Bach (1990), §3, p. 360? Neither paper could be read from a legal place, so the attribution is unchecked.

## Previous findings

- The previous review (at `7b5fe43`) had no finding (no R-numbered remark). Its other remarks:
- C01 (description) — partly repaired: the description now says this roadmap "cites them and a new supplier, AnalyticNumberTheoryPartIII §8.2a, which now hold some of its routes and Checks"; the change of 8.4a (b) is unstated (C01 above).
- C02 (label of 9.2) — repaired: "*Origin:* this roadmap's own formulation: the predicate is that of QuasiRiemannHypothesis §1.1, and the four clauses this section adds …", with a method line; the Labels paragraph reads "The definitions of 10.3 carry the first label only." The repair leaves the reference entry one section short (C02 above).
- N01 (`Deduction.ch_balance` without its file) — not repaired: line 454 is unchanged (N01 above).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| 8.4a (b) size clause `‖rieszRemainder ψ y‖ ≤ C_ψ y²`, `y ≥ 1` | `K = ℚ`, `ψ = 1`, `y = 1, 2, 3`; a field of degree `d`, `m = p^k` | Remainder `1.577`, `1.768`, `1.782`; norm coefficient at `p^k` at most `∑ f_𝔭 log p ≤ d log p ≤ d m`; term `≤ d y`, at most `y` terms; main terms `≤ c y²` | holds |
| 8.4a remark `‖rieszRemainder ψ y‖ ≤ C′_ψ y`, `y ≥ 1` | same values; zeros with `0 ≤ Re ρ ≤ 1` | `1.577/1`, `1.768/2`, `1.782/3`; `‖y^ρ‖ = y^{Re ρ} ≤ y`, zero sum summable, `E_ψ` continuous on `[1, 2]` and `A + B log y + O(1/y)` beyond | holds |
| Remark: the formal proof has the linear bound only at `ζ` | `Formalism/StatementU.lean` line 35; `Formalism/ZetaNonvanishing/GzLipschitz.lean` line 220 | `GzLipschitz`: one `K` with `|Gz t| ≤ K t` and `|Gz t − Gz t′| ≤ K |t − t′|` for `t, t′ ≥ 1/2`; `Gz` is the level-one remainder (`StatementOC.lean` line 13); proved by `zetaPrimeSumErrorLipschitz`; no other file states it for a character | supported |
| 8.4a method and corollary lines (`C′_ψ y` "of the remark") | ZerosOfLFunctions §8.6a at this head | §8.6a states the zero family summable in norm for `x > 1`; times `(y − 1)` and `‖y^ρ − 1‖ ≤ y + 1` gives `O(y)`; consistent with the remark | holds |
| Consumers of the size clause | GeneralizedRiemannHypothesisFromWindowBounds 0.4 and its contract (lines 301–316, 1274) | The contract takes `C_ψ y²` for the statement and `C′_ψ y` "for the remark to 0.4": no statement there needs the linear bound | consistent |
| 9.2 change of level, with its new method line | principal character mod 2 against level 1; `s = 1` | Factor `1 − 2^{−s}` vanishes at `2πik/log 2`, `Re = 0`; on `Re s > 0` orders agree; at `s = 1` both have order `−1`, the point the formal statement excludes (`χ ≠ 1 ∨ s ≠ 1`) | holds |
| 9.2 method line against the declaration | `DirichletLZerosEqPrimitiveCharacterZeros.lean` line 11 | Hypotheses `0 < s.re`, `χ ≠ 1 ∨ s ≠ 1`; conclusion: values vanish together and `Lin.ord` (the analytic order of the L-function, `ZerosDisc.lean` line 13) agrees; proof through the product over `q.primeFactors` | supported |
| 9.2 origin label | the four clauses | Each an equivalence with hypotheses; label now "this roadmap's own formulation", predicate attributed to QuasiRiemannHypothesis §1.1 (present at its line 130) | holds |

The rows for the untouched statements stand as in the previous review, of `7b5fe43`.

- **Source locators checked against the text:** 4 declarations of [FormalProof] in 4 files, read in a copy the operator holds (`StatementU.lean` 34–35, `GzLipschitz.lean` 220, `StatementOC.lean` 13, `DirichletLZerosEqPrimitiveCharacterZeros.lean` 11–15 with `ZerosDisc.lean` 13). The seeded sample falls in the changed passages at 8.4a and 9.2 only; both are rows above.
- **Library declarations opened at the pin:** none new; the change names no library declaration that the previous review had not resolved.
- **Cross-roadmap citations resolved at this head:** 4: QuasiRiemannHypothesis §1.1, ZerosOfLFunctions §§8.2 and 8.6a, ExplicitZetaBounds §6.1a (the last two paragraphs unchanged). Of the suppliers, only the `Suggested.lean` of ZerosOfLFunctions changed since `7b5fe43`.
- **Record:** no heading, layer or Lean declaration is removed, renumbered or retitled by this change; `Suggested.lean` is unchanged. The linear bound of 8.4a (b) is kept, as a remark with its route.
- **Automatic checks:** all passed. Dependency check output: `depcheck: 120 roadmaps, 1388 edges, 0 problem(s)`. Every file the pull request changes lies in one of its roadmap folders or the two family indexes; the family index says nothing of the passages changed here.
- **Elaboration:** `lake env lean` on `Suggested.lean`: 13 `sorry` warnings, nothing else.
- **Overlap check:** read ZerosOfLFunctions, GeneralizedRiemannHypothesisFromWindowBounds and LFunctions at the sections the changed passages cite or that cite them; nothing shared beyond what the previous review records (the explicit formula and the Euler–Kronecker constant, ZerosOfLFunctions §8.6a, cited here). No open pull request changes this roadmap or drops an id it cites.
- **Source independence:** changed passages only: 3 passages (the remark of 8.4a, the origin and the method line of 9.2) compared with 1 source ([FormalProof], Lean code, 4 declarations), none shared; largest share [FormalProof], a code repository cited by file and declaration name; arrangement not compared, no layer being added, removed or reordered.
- **Research link:** 9.2–9.5 and the Riesz remainders of 8.4a are the statements in which the formal proof of the Riemann hypothesis for Dirichlet L-functions (Alpöge, announced 20 November 2026) is stated; 9.7–9.9 are the classical conditional consequences (Littlewood 1928; Titchmarsh 1986, Ch. XIV; Lagarias–Odlyzko 1977; Carneiro–Chandee–Milinovich 2015). Rests on the README's Summary and References.

## Not verifiable

- Belabas–Diaz y Diaz–Friedman 2008, §2, pp. 1187–1188, and Bach 1990, §3, p. 360 (9.5): no legal copy read.
- That no file of [FormalProof] states the linear bound for a nontrivial character: searched by the name `GzLipschitz` and for bounds on `Gchi` and `gChi` only, not read file by file.
- The other sources of the sample (Robinson 1944, Ihara 2006, Ihara–Murty–Shimura 2009, Lagarias–Odlyzko 1977, Littlewood 1928, the books): outside the changed passages; as in the previous review.

## Source issues

- none

## For the human reviewers

- Decision applied (a section stated in full in a general roadmap may leave the family): unchanged since the previous review; the routes and Checks of 3.2a and 8.8 and one definition of 8.4a (b) are in AnalyticNumberTheoryPartIII §8.2a and ZerosOfLFunctions §§8.6a, 8.7a; statements stay.
- Not tested: the source cited most is [FormalProof], a code repository; its wording was compared at four declarations only, and the paywalled sources of 9.5 (Bach 1990; Belabas–Diaz y Diaz–Friedman 2008) were not read.
