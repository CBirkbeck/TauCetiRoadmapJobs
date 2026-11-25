# Review of CongruenceModulesOfThetaLifts (pull request #3027 at f0da4ff)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/CongruenceModulesOfThetaLifts/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 2 lines changed since `2ac59b9`: accepted, with no finding. The change adds one word to the route of 7.4: the Jacquet–Shalika bound behind (6) is now cited for unitary generic *unramified* local components, which is the hypothesis under which AutomorphicLFunctionsAndLocalFactors AL.3.3.8 states it and the only setting in which the Satake parameters of (6) exist. Two format notes remain from the previous review, neither blocking, and two questions for the author stay open. The same three points are left for the human reviewers.

## N01 — Two arXiv preprints from 2026 are called "nearest published results"

The Origins of 7.8a (line 1289) and 7.16 (line 1805) use that phrase for Čoupek–Gazaki–Marmora and Bhatt–Gee–Kisin, which the References list as arXiv preprints. "Nearest results in the literature" would be accurate.

## N02 — "and on main" in the Dependencies of Layer 7 (line 2040) is process wording

"And outside this family" says the same and does not go out of date.

## Questions for the author

- 7.10c says that the formal proof's base-level sum carries the factor `d^{Z,P_0}_j`, equal to `D_0` by a separate statement, while the route of 7.11 writes the formal proof's bound with `D_0`. The two agree in value (7.8a). Which of the two is in the formal proof's statement behind 7.11? The repository of the formal proof could not be read.
- The Origin of 7.9 cites Dieulefait–Wiese, Proposition 6.1, with the journal reference; the number is 6.1 in arXiv:0905.1288v1. Is it the same in the published version? The published text is paywalled.

## Previous findings

- The previous review (of `2ac59b9`) raised no finding and no small correction. Its format notes:
- N01 — not repaired: "nearest published results" still stands for the two preprints, at lines 1289 and 1805; written again as N01.
- N02 — not repaired: "and on main" still stands, at line 2040; written again as N02.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 7.4 (6) and its route sentence (changed, line 439) against AL.3.3.8 | AL.3.3.8 at this head (AutomorphicLFunctionsAndLocalFactors README line 1455): hypotheses unitary, generic, unramified; conclusion `q^(−1/2) < |α_i| < q^(1/2)` | (6) reads `N w^{−1/2} < |α| < N w^{1/2}`, unitary normalisation: same bound, `q = N w`; the route's three adjectives now equal the supplier's three hypotheses | holds | none |
| 7.4 (6), the hypotheses for a cuspidal constituent `π` of `BC(Π)` | `π` conjugate self-dual cuspidal on `GL_m(𝔸_E)`; central character `ω = ω₀·|·|^s`, `s` real | `ω^c = ω^{−1}` and `|·|∘c = |·|` give `s = −s`, so `s = 0`: unitary; cuspidal on `GL_m` is generic; Satake parameters exist only at unramified `w` | holds | none |
| 7.4 (6), why "cuspidal constituents" and not `BC(Π)` itself | Speh block of the trivial character on `GL_2`; Steinberg of `GL_2` (ramified, unitary generic) | the block has parameters `q^{1/2}, q^{−1/2}`: `|α| = q^{1/2}`, the strict bound fails; its cuspidal constituent has `|α| = 1`. Steinberg has no Satake parameters, exponents `±1/2` in its support (AL.3.3.8a Check) | the restriction and the added word are both needed | none |

The rows for the untouched statements stand as in the previous review, of `2ac59b9`.

- Source locators checked against the text: none in the changed passage (its only citation is a supplier section); no target of the seeded sample falls in it. 7.5 and 7.5a of the sample name AL.3.3.8 in their `*Needs:*` lines only, which are unchanged and still resolve.
- Cross-roadmap citations resolved at this head: AutomorphicLFunctionsAndLocalFactors AL.3.3.8 (heading at README line 1455, statement at 1457, unchanged since `2ac59b9`) and its Check in AL.3.3.8a (line 1475); the six places of this README that cite AL.3.3.8 (lines 439–440, 497, 550, 643, 2044, 2282) agree with it.
- Record: no heading, layer or section is removed, renumbered or retitled by the change; `Suggested.lean` is unchanged since `2ac59b9`.
- Automatic checks: all passed on this head. Dependency check: `depcheck: 119 roadmaps, 1380 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: exit 0, no output. The file declares nothing (a single `import Mathlib` and the module docstring naming the headlines as not statable), so there is no `#check` comparison and no one-tactic probe to run.
- The pull request's text: the description does not speak of this sentence, and a one-word precision of a route needs no mention; nothing in the title or description is contradicted by this head. Outside this folder the pull request changes only the roadmap folders and family indexes declared as its own; since `2ac59b9` nothing outside `TauCetiRoadmap/` changed.
- Overlap check: read ThetaChainsAndFrobeniusPrimeSums, ThetaChainsOnDefiniteUnitaryGroups, SelmerLengthBoundsAndLocalLifting and LengthBoundsInPadicFamilies (their scope as cited here); the change shares no new object with them. Owners as before: congruence modules, PadicFamilies §1.7a and LengthBoundsInPadicFamilies §1.7a; the dual of a projected lattice, GeometryOfNumbersAndQuadraticArithmetic §0.2.5; the Jacquet–Shalika bound, AutomorphicLFunctionsAndLocalFactors AL.3.3.8, cited and not restated. No other open pull request changes this roadmap or drops an id it cites.
- Source independence: changed passages only; 1 passage (the route sentence for (6), one word added) compared with 0 sources, since it cites a supplier section and no source text; it shares only the three standard adjectives with AL.3.3.8; largest share [FormalProof], 130 of 141 locators, not readable; contents not compared, since no layer is added, removed or reordered.
- Research link: the targets bound congruence modules of theta lifts between definite unitary groups, after Hida (1981, 1986), Ribet (1976), Bloch–Kato (1990), Bellaïche–Chenevier (2009) and Emerton–Gee–Herzig (2013), as steps of Alpöge's announced proof of GRH for Dirichlet L-functions (2026). Rests on the README's summary and References.

## Not verifiable

- The source behind AL.3.3.8 (Cogdell's Fields lectures, Corollary 7.1.2; Jacquet–Shalika 1981) was not opened in this round: the change cites the supplier section, and the comparison made is with that section's statement.
- As in the previous review: [FormalProof] could not be read (its host is in no licence class of the sources service), and the published works cited without a readable text (Yamana 2014, Bloch–Kato 1990, Iovita–Marmora 2015) were not opened; none is in the changed passage.

## Source issues

- none

## For the human reviewers

- Scope: 11 of the 20 sections are labelled "particular to this proof"; their only references are [FormalProof] (a Lean repository) and [Announcement] (Alpöge, 20 November 2026), neither refereed (README, References).
- Licence: the [FormalProof] repository on GitHub could not be classified by the sources service, and its licence was not read.
- Not tested: [FormalProof] holds nearly all the locators and was not opened; the wording and arrangement checks and the Method labels were not compared against it.
