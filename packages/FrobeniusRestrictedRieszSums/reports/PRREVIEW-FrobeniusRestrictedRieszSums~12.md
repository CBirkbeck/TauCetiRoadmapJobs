# Review of FrobeniusRestrictedRieszSums (pull request #3027 at c832fa9)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/FrobeniusRestrictedRieszSums/`
**Verdict:** accepted

**Summary.** Accepted with no findings. This is an incremental re-review of 15 changed lines since `71bbefa`. They rewrite one paragraph, "Corollaries of general theorems", which now makes the deduction from the general roadmap's section the proof of what a `*Corollary of:*` line covers. I checked the paragraph against the two sections that carry such a line: 0.2, deduced from QuasiRiemannHypothesis §5.4, and 1.4 (b), deduced from AnalyticNumberTheoryPartI §1.4e through RieszSumsOverPrimesAndExceptionalZeros §1.4i. I also checked it against the family index. It holds for both sections, and their `*Needs:*` and Dependencies lines name what it says they name. The previous review's correction to the description is repaired. Two earlier remarks remain and are carried as one small correction (the conditional Check of 1.4) and one format note (no locator for the method label of 0.7); neither blocks. One scope fact is left for the humans who approve.

## C01 — The third Check of 1.4 presents a theorem of AnalyticNumberTheoryPartI as a hypothesis

The Check (line 1026) opens "If the bound of AnalyticNumberTheoryPartI §0.34 holds (`(1 − β) log q ≥ c_LS` …)". A reader takes this to mean that the supplier only assumes the bound. At this head AnalyticNumberTheoryPartI §0.34 (line 772) states the bound as a theorem, `landau_siegel_exclusion`, with a route through §§0.34a–0.34c. The implication itself is true. With `(1 − β) log q ≥ c_LS` and `log q ≤ (log y)^α`, the exceptional term is at most `(2/c_LS)(log y)^α·y·exp(−c_LS (log y)^{1−α})`, which is absorbed with `y₀` depending on `α` alone.

One repair would assert it: "AnalyticNumberTheoryPartI §0.34 (…) gives the conclusion of (b) …", keeping the clause "which assumes no such bound". Another would keep the conditional and state its reason, if the reason is that §0.34 rests on work that has not been refereed.

## N01 — The method label of 0.7 gives no locator into [FormalProof]

The Sources line of 0.7 (line 628) names no file of the formal proof, unlike every other section with a method label. The argument the label describes is in `topsGroup.lean`, and its single-functional step is in `select.lean`. Both are under `Development/AutomorphicArithmetic/ThickFrames/`: the declarations are `UpperTheory.BernoulliSumsFrobeniusOrbits.topsGroup` and `UpperTheory.BernoulliSumsFrobeniusOrbits.select`. These names were read at commit `e50d098`, not at the commit `40e56ba` the README cites. Naming them would let a reader check the label.

## Previous findings

The previous report had no findings (R); its remarks were two small corrections and one format note.

- C01 — repaired: the description now reads "Each section that states something to prove now carries `*Origin:*`, and `*Method of the formal proof:*` if the proof states it". This agrees with 0.1, 0.3, 0.5, 0.6 and 0.9 here: the formal proof supplies only their definitions.
- C02 — not repaired: line 1026, "If the bound of AnalyticNumberTheoryPartI §0.34 holds (`(1 − β) log q ≥ c_LS` for every real zero `β` of every primitive real `L(s, χ)` …)". Carried as C01.
- N01 — not repaired: line 628, "*Sources:* (Bernoulli selection; Chebyshev and Markov inequalities)", with no file of [FormalProof]. Carried as N01.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Corollaries paragraph, on 0.2 (deduction from QuasiRiemannHypothesis §5.4) | `E = ℚ(√5)`, `N = 5` and `N = 10` | §5.4: `f_E = 5`, `H = {±1}`, `X(E) = {1, (·/5)}`. 0.2: `ker art₁₀ = {1, 9}`; nontrivial `χ∘art₁₀` is `−1, −1, 1` at `3, 7, 9`, as `(·/5)`; `χ* = (·/5)` at both levels | agree | none |
| Corollaries paragraph, on 1.4 (b) (deduction from AnalyticNumberTheoryPartI §1.4e) | `α = 1/2`, `log N ≤ (log y)^{1/2}`, `1 − β ≥ c_ex` | exponent `≥ (c/2)√log u`; exceptional part `≤ 2y^{1−c_ex}/c_ex`; error `≪ y(log y)^{5/2}e^{−(c/2)√log y}`; together `≤ y e^{−c₁√log y}` for `c₁ < c/2`, `y ≥ y₀(c_ex)` | holds | none |
| Integral identity used by that deduction | `χ ≠ 1`, `y < 2` and general `y` | `G_χ = y∫_1^y ψ_χu^{−2} + y(L′/L)(1, χ)` and `−(L′/L)(1, χ) = ∫_1^∞ψ_χu^{−2}`, so `G_χ = −y∫_y^∞ψ_χu^{−2}`; at `y < 2` both sides are `y(L′/L)(1, χ)` | agree | none |
| §1.4e uniformity (threshold) | supplier at this head, line 943 | "the threshold is absolute", absolute `c, c₁`; `χ ≠ 1` primitive has conductor `≥ 3`; so `y₀` depends on `α, c_ex` only, as 1.4 (b) states | agree | none |
| Paragraph's clause on routes and *Needs:* | 0.2, 1.4 | 0.2: route via ArithmeticGaloisRepresentations §2.3 and the Galois correspondence; the label says it differs; *Needs:* lists §5.4. 1.4: route is §1.4i (b), itself a corollary of §1.4e; §1.4e at lines 1259 and 1355 | agree | none |
| Family index on the same convention | index lines 184, 200–204 against README 127–134 | both: the general theorem is proved in the general roadmap; the covered part is deduced; the proof of GRH needs only that case | agree | none |
| 1.4, third Check (C01) | `(1 − β) log q ≥ c_LS`, `log q ≤ (log y)^α` | `1 − β ≥ c_LS(log y)^{−α}`; term `≤ (2/c_LS)(log y)^α·y·e^{−c_LS(log y)^{1−α}}`; §0.34 stated as a theorem at line 772 | true; wording | C01 |
| Description, "if the proof states it" (old C01) | 0.1, 0.3, 0.5, 0.6, 0.9 | each carries only *Origin*; its [FormalProof] items are definitions (0.3 `HostFactsS`, 0.6 (c) `placeOf`) | agree | none |

The rows for the statements the change does not touch stand as in the previous review, of `71bbefa`.

- Source locators: the change adds or alters none. The external texts cited by the Origin labels of 0.2 and 1.4 (Washington, Davenport) were not re-read.
- Cross-roadmap citations resolved at this head: QuasiRiemannHypothesis §5.4 (line 834); AnalyticNumberTheoryPartI §1.4e (line 939) and §0.34 (line 772); RieszSumsOverPrimesAndExceptionalZeros §1.4i (line 389, *Corollary of* §1.4e); the family index (lines 184, 200–204). None of the supplier sections changed since `71bbefa`.
- Library declarations: the change cites none. `Suggested.lean` is unchanged since `71bbefa`.
- Record: README at the merge base `74a09b7` against this head: 0 layers or items removed, 0 ids retitled.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1469 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean`: three `sorry` warnings (lines 113, 236, 366), nothing else. Diff against the base, excluding this pull request's own folders: empty.
- Ownership: the change adds no object.
- Overlap check: read UniformWildKernelBounds, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties and ThetaChainsOnDefiniteUnitaryGroups (closest lists). Each cites this roadmap for the hosts (§§0.1, 0.3, 0.4) and defines none of them itself, so the owner is this roadmap. SidonSetsAndLinearEquations and FourierAnalyticAdditiveCombinatorics share nothing with the change, as in the previous review.

Source independence: changed passages only; 1 passage compared, the Corollaries paragraph, which quotes and paraphrases no source (it states this roadmap's convention, in the same terms as the family index), so nothing is shared; largest share [FormalProof], 29 of 42 locators as in the previous review (the change adds no locator); contents not compared (no layer added, removed or reordered).

Research link: this roadmap is the analytic frame of the formal proof of the Riemann hypothesis for Dirichlet L-functions announced by Alpöge on 20 November 2026 ([Announcement], [FormalProof]). Its 1.9 reduces a square-root bound for the cyclic family to the Frobenius-restricted inequality of ThetaChainsAndFrobeniusPrimeSums, with tools from Behrend (1946) and from de la Vallée Poussin, Landau and Page. This line rests on the README.

## Not verifiable

- Washington, *Introduction to Cyclotomic Fields*, chapters 3 and 14 (Origin label of 0.2): a Springer book with no legal open copy; not re-read.
- Davenport, *Multiplicative Number Theory*, chapters 19–20 (Origin label of 1.4): a Springer book with no legal open copy; not re-read.
- The paragraph's claim that the proof of the Riemann hypothesis for Dirichlet L-functions needs only the cases on the `*Corollary of:*` lines. It concerns the formal proof as a whole and was not checked against its export of dependencies.

Automatic checks set aside as false positives: the check that a pull request changes nothing outside the roadmap folder under review, which keeps edits to other roadmaps out of a review that does not cover them, counted the files of the other roadmap folders this pull request owns as outside changes when it was rerun with this folder alone; the comparison against the base that excludes those folders is empty.

## Source issues

- none

## For the human reviewers

- Scope: the principal source is [FormalProof], a Lean proof announced on 20 November 2026 ([Announcement]) with no refereed publication. The Origin labels mark 0.4, 0.8b, 1.1, 1.7, 1.8 and 1.9 as resting on it alone.
