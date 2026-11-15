# Review of PolynomialGaloisGroupsPartII (pull request #1419 at 285e665)

**Verdict:** accepted

:robot: Independent AI review, incremental: the folder is unchanged since the previous review of 285e665 (0 lines). This round read the pull request's title and description against the head. No finding; the gate passes.

## Previous findings

- R01 — not repaired: `packages/PolynomialGaloisGroupsPartII/design/plan.json` on the board still lists `mertens-prime-product`. Not written again as a finding of this folder: no file of the pull request can repair it, and the README cites AnalyticNumberTheoryPartI §0.26, now on main, as an ordinary contract. Passed to the human reviewers below.

## Verified sound

The title and the description's prose (the summary block and the five paragraphs after it) were read sentence by sentence against `TauCetiRoadmap/PolynomialGaloisGroupsPartII/README.md` and `Suggested.lean` at 285e665. No sentence is contradicted by the head, and the text leaves no change unstated: the pull request adds one new roadmap folder (three files, 1767 insertions, no deletion, nothing outside the folder), which the title and the "Roadmap folder" sentence say; no section, headline or declaration is removed.

| Statement (as the description cites it) | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| `ramified_merging`: "merging equal degrees, in blocks no larger than the largest factor multiplicity", any prime | X³−2 at p = 3 and p = 5 | p = 3: reduction (X+1)³, M = 3, degrees {1,1,1}; S₃ types {1,1,1}, {2,1}, {3} are all 3-mergings. p = 5: (X−3)(X²+3X+4), discriminant 3 a non-square, M = 1, degrees {1,2} = type of a transposition | Description agrees with `Suggested.lean:69`; none. |
| "identifies it with multiple transitivity", over arbitrary fields (`kfold_iff_multiplyPretransitive`) | X³−2 and X³−3X+1 over ℚ, k = 2 | S₃: orbit on ordered pairs 6 = 3·2, quotient quadratic irreducible over ℚ(root): true, true. C₃: orbit 3 < 6, quotient splits: false, false | Both directions agree; `F` is any field at `Suggested.lean:81`; none. |
| `generalized_luczak_pyber`: "measure at most B(log n)²n^(−κα), with B uniform in the law and the merging exponent" | δ = 1/10, κ = 1, ε = 1/50, θ = 0 and θ = δ/2 − ε = 3/100 | α = δ/4 − θ/2 = 1/40 and 1/100 = ε/2; exponents −0.025 and −0.01; Lean bound `B * log n ^ 2 * n ^ (-κ * (δ/4 − θ/2))`; B and N bound before n, ν, θ | Description agrees with `Suggested.lean:266–274`; none. |
| `galois_merging_certificate`: "links this bound back to polynomials" | X⁴+1 at p = 2 (y = 4) and p = 3 (y = 1) | Root group V₄, regular, order 4 ≠ 12, 24. p = 2: (X+1)⁴, M = 4, {1,1,1,1} → {2,2} by two blocks of size 2 ≤ 4. p = 3: (X²+X+2)(X²+2X+2), M = 1, degrees {2,2} = type of a double transposition | Witness in `BadTransitive` at both primes; none. |
| "The large-prime estimate uses Mertens's exact e^γ coefficient" (3.4, `nonsmooth_harmonic_mass`) | γ ≈ 0.5772157 | 1/2 − e^γ/8 ≈ 0.277366 > 1/4; with an unspecified coefficient c the margin 1/2 − c/8 is not known to exceed 1/4 | Agrees with README lines 44–48 and 265–273; none. |
| "neither Jordan's prime-cycle theorem nor an order bound controls support" | README 4.4 and 4.6 | README line 1100 rules out an order or base-size bound; lines 1157–1160 rule out the prime-cycle theorem alone | Agrees; none. |

The rows for the roadmap's statements stand as in the previous review, of `285e665`: no statement changed.

- Gate at this head (the worker's run): every scanner 0, `depcheck=0`, `stray-files=0`, `outside-folder=0`, `build=0`, OK. Dependency check rerun: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration rerun: `lake env lean` on `TauCetiRoadmap/PolynomialGaloisGroupsPartII/Suggested.lean` exits 0 with 13 `declaration uses sorry` warnings (lines 56, 69, 100, 106, 200, 208, 227, 232, 237, 244, 255, 266, 277) and nothing else.
- Cross-roadmap citations resolved again (3): AnalyticNumberTheoryPartI §0.26 on main, README line 691 (Euler product with coefficient e^γ, additive O(1), real x ≥ 2); ErdosProgressionPowers §0.9 at the head of its open pull request, README lines 901 and 924–927 (τ(n) ≤ n^ε eventually, nonsquarefree n included); PolynomialGaloisGroups Layer 1 under `Completed/` on main.
- Library declaration opened (1): the worker's lead that `TauCeti.GroupTheory.Perm.CyclePower` is found nowhere is a false positive; `Equiv.Perm.IsCycle.pow_apply_eq_self_iff` is at `TauCeti/GroupTheory/Perm/CyclePower.lean:60` of the pinned Tau Ceti.
- Description's process claims checked against the board: two red-team rounds (reports 1a, 1b, 2a, 2b) and no independent review before the port; outside-folder diff empty; the two suppliers named in the description's dependency block are the README's two roadmap suppliers that were open when it was written (AnalyticNumberTheoryPartI has merged since, as the block's ticked box shows).
- Source locators checked this round: 0 (no passage of the folder changed, so no target of the seeded sample falls in a changed passage).
- Overlap check: read PolynomialGaloisGroups (main), ProbabilisticAndMetricNumberTheory (main), PolynomialGaloisGroupsPartIII, CertifiedPermutationComputation, ArithmeticDynamicsPartII, ArithmeticDynamics; nothing shared. Greps by object over every open head and main (equal-part merging, Łuczak–Pyber, Bochert, minimum support of a permutation group, orbital distinguishers, higher irreducibility, maximum factor multiplicity) return this roadmap only; PolynomialGaloisGroupsPartIII names this roadmap as a separate continuation (its README line 67).
- Source independence: changed passages only; 0 passages of the folder changed; the description's 5 prose paragraphs compared with 1 source (bskk lines 8–38, abstract and contents), none shared; largest share bskk, 28 of the 33 README lines carrying a locator; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- The board's `packages/PolynomialGaloisGroupsPartII/design/plan.json` still declares `gap:mertens-prime-product`, although AnalyticNumberTheoryPartI §0.26 on main states that bound and the README cites it as supplied. Whether to delete the entry is the board owner's decision.
- Sources `babai` (an author-hosted exposition dated 2018, cited for 4.2–4.4) and `schomburg` (arXiv:2209.12049v1, cited for 4.5) are not journal publications; the results they present are older published theorems of Babai and Bochert.
- The description says "The route follows Bary-Soroker, Koukoulopoulos and Kozma"; the README itself makes no such statement, and its 5.2 and 5.3 depart from the proofs in bskk §12, as the previous review recorded.
