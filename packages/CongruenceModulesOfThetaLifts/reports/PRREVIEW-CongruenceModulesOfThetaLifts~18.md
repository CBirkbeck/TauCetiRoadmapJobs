# Review of CongruenceModulesOfThetaLifts (pull request #3027 at 2ac59b9)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/CongruenceModulesOfThetaLifts/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 32 lines changed since `3f8c596`: accepted, with no finding. The change restates the exceptional set of 7.6 (a) in the formal proof's form (a one-sided window around the base sizes, the top base size taken with a floor, a new count) and adds one hypothesis on the step weights at the top places, which 7.10a now carries; I recomputed the window, the count, the positivity and the bound `3b`, and they hold. Two format notes remain from the previous review, neither blocking, and two questions for the author stay open. The same three points are left for the human reviewers.

## N01 — Two arXiv preprints from 2026 are called "nearest published results"

The Origins of 7.8a (line 1289) and 7.16 (line 1805) use that phrase for Čoupek–Gazaki–Marmora and Bhatt–Gee–Kisin, which the References list as arXiv preprints. "Nearest results in the literature" would be accurate.

## N02 — "and on main" in the Dependencies of Layer 7 (line 2040) is process wording

"And outside this family" says the same and does not go out of date.

## Questions for the author

- 7.10c says that the formal proof's base-level sum carries the factor `d^{Z,P_0}_j`, equal to `D_0` by a separate statement, while the route of 7.11 writes the formal proof's bound with `D_0`. The two agree in value (7.8a). Which of the two is in the formal proof's statement behind 7.11? The repository of the formal proof could not be read.
- The Origin of 7.9 cites Dieulefait–Wiese, Proposition 6.1, with the journal reference; the number is 6.1 in arXiv:0905.1288v1. Is it the same in the published version? The published text is paywalled.

## Previous findings

- The previous review (of `3f8c596`) raised no finding and no small correction. Its format notes:
- N01 — not repaired: "nearest published results" still stands for the two preprints, at lines 1289 and 1805; written again as N01.
- N02 — not repaired: "and on main" still stands, at line 2040; written again as N02.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 7.6 (a), the window of `Exc` against (P5) of WachLatticesOverTheCyclotomicTower §6.9 (changed) | low type, window `[⌈c−η_s⌉, ⌊c+η_s⌋]` shifted to `[1, η_i]`, `c = (t−1)/2`, cloud at `c + W₀ + δ`, `0 ≤ δ ≤ Sc+η_s+1` | `u − y` ranges in `[W₀ − η_s − 2σ − 3, W₀ + Sc + 2η_s + 2σ + 4]`: both ends equal the stated window (`σ ≤ σ⁺`) | holds | none |
| 7.6 (a), the top places with `⌊b′/x⌋` and the new hypothesis (changed) | `W₀ = a⁻_τ + ⌊b′/x⌋`, `w_j ≤ a⁻_τ + b′/x + η_s`; without the hypothesis | `w_j − W₀ ∈ [0, η_s + 1)`; with only §2.3c's `[w₀, w₀+η_s+1]` it is `[0, η_s + 2)`, one too many. With `η_s = ϑ` the top window of §2.3b gives it | holds; hypothesis needed | none |
| 7.6 (a), the count (changed) | closed window of length `Sc + 3η_s + 4σ⁺ + 7`, `W₀` not an integer (`b`, `w″`) | at most `Sc + 3η_s + 4σ⁺ + 8` integers; `4σ⁺ ≤ 8b/ℓ*`, `8 ≤ t + 9`; at most `|Φ_top| + 2` numbers `W₀`; one prime `> ℓ*` each since `ℓ*² > 8b > 3b` | holds | none |
| 7.6 (a), positivity and the bound `3b` (changed) | lower end `W₀ − η_s − 2σ⁺ − 3`, `W₀ ≥ w″`; upper end at `W₀ ≤ b` | `SizeThin` with `x·r ≥ m`: `Sc + 2η_s + 2σ⁺ + 4 < w″ ≤ W₀` (`a⁻_τ ≥ b′ ≥ w″`), lower end `> 0`; upper end `≤ b + w″ ≤ 2b` (`a⁻_τ + b′/x ≤ 2b′ < b`) | holds | none |
| 7.6, Remark (new) | symmetric window `|n − W₀| ≤ B`, `B = Sc + 2η_s + 2σ⁺ + 4` | contains the window of `Exc` (`η_s + 2σ⁺ + 3 ≤ B`); at most `2B + 1 = 2Sc + 4η_s + 4σ⁺ + 9` integers, positive by `SizeThin` | holds | none |
| 7.10a, hypotheses (changed) and 7.10c's use of `#Exc` | the new count in the sum over `Exc` of 7.10c; the consumer's parameters | `(|Φ_top|+2)(Sc+3η_s+t+8D_*/m+9)·log 3b`: a power of `x·e^{x^{ε/4}}` (`log ϑ ≤ x^{ε/4}`), below `b`; ThetaChainsAndFrobeniusPrimeSums line 1511 takes `η_s = ϑ`, so the top bound holds | holds | none |

The rows for the untouched statements stand as in the previous review, of `3f8c596`.

- Source locators checked against the text: none readable in the changed passages; of the seeded sample only 7.6 falls in them, and its locators, among them the new `GlobalTheory.NLink.ExcBound.excOK_at`, are into [FormalProof] (below).
- Cross-roadmap citations resolved at this head: ThetaChainsOnDefiniteUnitaryGroups §2.1 (`w″`, `b′`), §2.3b (the three windows and base sizes, README lines 734–736; untouched since `3f8c596`), §2.3c (`η_s`, `SizeSep`, `ℓ*² > 8b`, lines 773–778); WachLatticesOverTheCyclotomicTower §6.9 (P1)–(P5) (lines 569–579); ThetaChainsAndFrobeniusPrimeSums line 1511, which supplies the new top bound.
- Record: no heading, layer or section is removed, renumbered or retitled by the change; `Suggested.lean` is unchanged since `3f8c596`.
- Automatic checks: all passed on this head. Dependency check: `depcheck: 122 roadmaps, 1403 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: exit 0, no output. The file declares nothing (a single `import Mathlib` and the module docstring naming the headlines as not statable), so there is no `#check` comparison and no one-tactic probe to run.
- The pull request's text: the description names "the exceptional set (CongruenceModulesOfThetaLifts 7.6)" among the sections where the formal proof's form is the statement and the other form a remark, which is what this head does. Outside this folder the pull request changes only the roadmap folders and family indexes declared as its own.
- Overlap check: read ThetaChainsAndFrobeniusPrimeSums, ThetaChainsOnDefiniteUnitaryGroups, GluedTargetAndDivisionInequality and LengthBoundsInPadicFamilies (their scope as cited here); the change shares no new object with them: `Exc` and `SizeThin` are defined only in 7.6 and cited from ThetaChainsAndFrobeniusPrimeSums. Owners as before: congruence modules, PadicFamilies §1.7a and LengthBoundsInPadicFamilies §1.7a; the dual of a projected lattice, GeometryOfNumbersAndQuadraticArithmetic §0.2.5. No other open pull request changes this roadmap or drops an id it cites.
- Source independence: changed passages only; 4 passages (the statement of `Exc`, the Remark, the route, the locator sentence) have [FormalProof] as their only source, which was not readable, so 0 were compared; largest share [FormalProof], 130 of 141 locators (the previous count plus the one the change adds); contents not compared, since no layer is added, removed or reordered.
- Research link: the targets bound congruence modules of theta lifts between definite unitary groups, after Hida (1981, 1986), Ribet (1976), Bloch–Kato (1990), Bellaïche–Chenevier (2009) and Emerton–Gee–Herzig (2013), as steps of Alpöge's announced proof of GRH for Dirichlet L-functions (2026). Rests on the README's summary and References.

## Not verifiable

- That [FormalProof] defines `Exc` with this window and the floor at the top places, and proves the count `(|Φ_top| + 2)·(Sc + 3η_s + t + 8b/ℓ* + 9)` (the locators `BaseSizes.Exc`, `NLink.ExcOK`, `NLink.ExcBound.excOK_at`, `NLink.StarE`): the repository's host is in no licence class of the sources service, so no file was read. The statement was checked by computation only.
- As in the previous review: the published works cited without a readable text (Yamana 2014, Bloch–Kato 1990, Iovita–Marmora 2015) were not opened; none is in a changed passage.

## Source issues

- none

## For the human reviewers

- Scope: 11 of the 20 sections are labelled "particular to this proof"; their only references are [FormalProof] (a Lean repository) and [Announcement] (Alpöge, 20 November 2026), neither refereed (README, References).
- Licence: the [FormalProof] repository on GitHub could not be classified by the sources service, and its licence was not read.
- Not tested: [FormalProof] holds nearly all the locators and was not opened; the wording and arrangement checks and the Method labels were not compared against it.
