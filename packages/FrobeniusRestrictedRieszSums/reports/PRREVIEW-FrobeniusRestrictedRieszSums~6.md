# Review of FrobeniusRestrictedRieszSums (pull request #2920 at 801a05b)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/FrobeniusRestrictedRieszSums/`
**Verdict:** accepted

**Summary.** Accepted, with no findings: this is an incremental re-review of the 67 lines changed since `cebce56`. The identity 1.2, now stated in the README and in `Suggested.lean` for every abelian CM host, holds in that generality with the Lean definitions as they stand (ramified primes, a modulus `N` larger than the conductor and scales `a/w < 1` recomputed); the new sentence of 0.9 on the places above `q` in `ℚ(μ_{2^∞})` is correct, and the title and description agree with this head. There are no small corrections and two format notes carried from the previous review, neither blocking. The humans who approve have the same five things to decide as before: the main source, an announced and unrefereed formal proof, still could not be read here, so the file and declaration locators added at this head were not compared with it.

## N01 — Layer 1 has no 1.3

The subsections run 1.1, 1.2, 1.4, …; other roadmaps cite 1.4–1.9 by number, so a line saying that the number is unused would serve better than renumbering.

## N02 — The display of 1.9 has `4o·x^{1/2+ε}` where its route gives `3o·x^{1/2+ε}`

Line 1033 against line 1055 (`Σ_χ |G_{χ*}(x)| ≤ 3o·x^{1/2+ε}`). Both are true; one of the two could be aligned.

## Previous findings

The previous report (of `cebce56`) had no finding (no R01, …). Its small corrections and format notes at this head:

- C01 — repaired: the Conventions now read "the values of particular constructions appear only in Checks, except the coset law of the tops in 1.7 and 1.9, which is the fixed law `ν₀` with shares `4 : 3`".
- C02 — repaired: `frobRieszSum_sub_main` no longer has `hd`, `hsplit`, `hId`; the README theorem reads "For every abelian CM host, `a > 0`, `τ ∈ Φ` and `w : Φ → (0, ∞)`", with the formal proof's case named beside it.
- C03 — repaired: 1.1, 1.2, 1.7, 1.8 and 1.9 each name files and declarations of [FormalProof] (for instance `Deduction.ch_balance` in 1.2, `Deduction.ch_core` in 1.9). The locators themselves could not be opened (Not verifiable).
- C04 — repaired: "`ρ` a real element of `𝔛_n⟨ψ⟩` (its conductor divides `8f_ψ`)".
- C05 — repaired: "Each condition except `v₂(q + 1) ≤ a` has a use in Layer 0", followed by the use of that bound for the places above `q` in `ℚ(μ_{2^∞})`.
- C06 — repaired: the description says three headline theorems, 25 definitions, and that the docstring calls the other targets steps of the routes; its validation sentence describes this head.
- C07 — repaired: the family index reads "the implication from the averaged inequality at every translate on a host to the square-root bound for the cyclic family".
- N01 — not repaired: Layer 1 still has no 1.3 (format note N01 above).
- N02 — not repaired: `4o` at line 1033, `3o` at line 1055 (format note N02 above).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.2, `frobRieszSum_sub_main` (hypotheses dropped) | `ℚ(√−3, √−7)`, `K = ℚ(√−7)`, `p = 3` (outside split ramification) | `I_3 = Φ`, `Fr(3) = G∖Φ`; `Σ_χ conj χ(g)χ*(3) = 1 + 0 + 1 + 0 = 2`, over `|G| = 4` gives `1/2` = mean of the indicator | holds | none |
| 1.2, modulus larger than the conductor | `E = ℚ(i)`, `N = 12`, `p = 2, 3` | `Fr(2^i) = art{5, 11}` or `art{1, 7}` = `G`, mean of `χ_K` is `0 = χ₋₄(2)`; `Fr(3) = art{7, 11} = {c}` | holds | none |
| 1.2, scales below 1 and junk values | `y = a/w < 1`; `n = 0, 1`; `N′ = 1` | empty sums; `y log y − (1+γ)y − yΣ(L′/L) + G_1 + Σ_{χ≠1} y(L′/L) = 0`; `Λ(0) = Λ(1) = 0`; coset nonempty | holds | none |
| 1.2, constants and context | `χ = 1, χ_K`, others; `c ∉ Φ` | `Σ_{g∉Φ} conj χ(g) = ∣Φ∣, −∣Φ∣, 0`; `ℭ` has `−a(L′/L)(1, χ_K)`, `𝔐` has `+a`; `K` totally complex gives `cgτ ∈ Φ`, so `w > 0` there | holds | none |
| 0.9, the bound `v₂(q + 1) ≤ a` | `q = 3` (`k = 2`), `q ≡ 7 mod 16` (`k = 3`), general `k ≥ 2` | `−q ∈ 1 + 2^kℤ₂` exactly; closure of `⟨q⟩` contains `1 + 2^{k+1}ℤ₂` with index 2; index in `ℤ₂^×` is `2^k/2 = 2^{k−1}`: 2 and 4 places | holds | none |
| 1.4 (a), reworded | `ψ = 1`, `n = 2`; general real element | real elements of `𝔛_2`: `1`, `χ₈`, giving 8 real characters; 2-part of a real conductor `≤ 8`, so conductor divides `8f_ψ` | holds | none |
| Conventions, constants | 1.7, 1.9 against the sentence | `ν₀(A₀) = 4/(3o + 1)` is now the named exception | consistent | none |
| Family index entry | 1.9 as stated | one direction: inequality at every translate ⇒ bound for `𝔜_{ν₀}` | agrees | none |

The rows for the untouched statements stand as in the previous review, of `cebce56`.

- Source locators checked against the text: 0 new. The eleven file-and-declaration locators into [FormalProof] added at this head (1.1, 1.2, 1.7, 1.8, 1.9) could not be opened.
- Library declarations: none new in the diff; the definitions `frobCoset`, `inertia`, `primitiveChar`, `logDerivLAtOne`, `rieszRemainder`, `frobRieszSum`, `frobRieszMain`, `frobRieszCharAverage` were reread against the widened theorem.
- Cross-roadmap citations resolved: UniformWildKernelBounds §2.3 at its open head (its route gives the index `2^{v₂(q+1)−1}` and its Check the counts 2 and 4, as 0.9 and Downstream consumers now say).
- Automatic checks: the worker's all passed at this head. Dependency check: `depcheck: 168 roadmaps, 1963 edges, 0 problem(s)`; no upward or cyclic edge. Outside the folder the pull request changes only the family index, which is its own.
- Elaboration of `Suggested.lean` with `lake env lean`: three `declaration uses sorry` warnings (lines 109, 232, 362), nothing else. One import, no `set_option`, no sorried data.
- One-tactic probe on a copy of the restated theorem: `rfl`, `simp` and `infer_instance` all fail. `#check @frobRieszSum_sub_main`: binders `N`, `L`, `E`, `K`, `hK`, `IsTotallyComplex K`, `χK`, `hχK`, `a`, `τ`, `w` with their hypotheses, as the README states; nothing lost.
- Headlines: three (1.2, 1.9, 0.8), all stated; the docstring names none as not statable, correctly.
- Title and description read against this head: 3 theorems and 25 definitions counted in the file; the account of 1.2, of the index entry and of the validation agree; no sentence contradicted, no change left unstated.

Overlap check: read ThetaChainsAndFrobeniusPrimeSums, QuadraticTwistSelectionOverPrimes, LocalGainOfThetaChains, ThetaChainsOnDefiniteUnitaryGroups, RiemannHypothesisStatementsAndConsequences (open) and QuadraticCharactersAndReduction (main) as in the previous review; nothing shared, and the diff adds no object. No open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only; 7 changed passages read, compared with 0 sources (the one source they cite, [FormalProof], could not be read); largest share [FormalProof], now with a file at every citing target; no layer added, removed or reordered, so the arrangement was not compared again; wording and arrangement against [FormalProof] remain untested.

Research link: 1.9 is the analytic frame of the proof of the Riemann hypothesis for Dirichlet L-functions announced by Alpöge (2026): chains of theta lifts of length `√X` for the normalised von Mangoldt sum (Announcement lines 32–38, 125; README Summary). 0.8 extends Behrend (1946) and Ruzsa (1993); 1.4 rests on Landau–Page. Rests on the README and the Announcement.

## Not verifiable

- [FormalProof] (all its locators, among them those added at this head in 1.1, 1.2, 1.7, 1.8 and 1.9, and the sentence of 1.2 that it states the case of split ramification): the repository the References name, and the author's page, are on hosts the sources service does not classify.
- Behrend 1946, Ruzsa 1993, Washington, Neukirch, Davenport, Chebyshev 1852: as in the previous review; no changed passage cites them.

Automatic checks set aside as false positives: a rerun of the checks without the candidate merge order reported this roadmap as not yet in the merge order (it is placed after its last supplier) and reported the three files of the family index as changes outside the folder (they are the pull request's own).

## Source issues

- none

## For the human reviewers

- Scope: targets 1.1 and 1.7–1.9 rest on [FormalProof] alone, a Lean formalisation announced on 20 November 2026 (Announcement, 4 pages), with no written exposition; no refereed source states them.
- Licence: docstrings of `Suggested.lean` say five definitions are "as in [FormalProof]" (lines 77, 88, 100, 136, 149). The repository's licence and the agreement of names and statements could not be read.
- Licence: the References give a GitHub repository for [FormalProof]; the Announcement (line 53) gives a 14-part archive on the author's page. Which was read is not said.
- Not tested: [FormalProof], the source with the largest share of the locators, could not be read; wording, arrangement and the declaration names added at this head were not compared with it.
- Scope: the third Check of 1.4 rests on AnalyticNumberTheoryPartI §0.34 on main, an unconditional exclusion of Landau–Siegel zeros; no target here depends on it.
