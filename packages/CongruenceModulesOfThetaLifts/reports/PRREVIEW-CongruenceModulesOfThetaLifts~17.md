# Review of CongruenceModulesOfThetaLifts (pull request #3027 at 3f8c596)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/CongruenceModulesOfThetaLifts/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 26 lines changed since `c832fa9`: accepted, with no finding. The three small corrections of the previous review are repaired (the status of the general form of 7.16a (2), the description's sentence about it, and the generality attributed to Horesh–Karasik's Proposition B.5 in 7.15), and the new wording of the formal proof's form in 7.10c agrees with 7.8a and 7.11. Two format notes remain from the previous review, neither blocking, and there is one question for the author. The same three points are left for the human reviewers: the main source is unrefereed, and the formal proof could not be opened.

## N01 — Two arXiv preprints from 2026 are called "nearest published results"

The Origins of 7.8a (line 1277) and 7.16 (line 1793) use that phrase for Čoupek–Gazaki–Marmora (arXiv:2603.26035) and Bhatt–Gee–Kisin (arXiv:2607.08660), which the References list as arXiv preprints. "Nearest results in the literature" would be accurate.

## N02 — "and on main" in the Dependencies of Layer 7 (line 2028) is process wording

"And outside this family" says the same and does not go out of date.

## Questions for the author

- 7.10c (lines 1600–1604) now says that the formal proof's base-level sum carries the factor `d^{Z,P_0}_j`, which equals `D_0` by a separate statement. The route of 7.11 (line 1681) still writes the formal proof's bound with `D_0`. The two agree in value (7.8a, line 1295), so nothing stated is affected; is the factor in the formal proof's statement behind 7.11 `D_0` itself, or `d^{Z,P_0}_j` as in 7.10c? The repository of the formal proof could not be read, so I could not compare.
- The Origin of 7.9 cites Dieulefait–Wiese, Proposition 6.1, with the Trans. Amer. Math. Soc. reference. In arXiv:0905.1288v1 the statement is numbered 6.1. Is the number the same in the published version? The published text is paywalled.

## Previous findings

- The previous review (of `c832fa9`) raised no finding. Its small corrections and format notes:
- C01 — repaired: the Labels paragraph (lines 195–197) and the Origin of 7.16a (lines 1878–1882) no longer call the general form of (2) this roadmap's own; the remark says only that it "is not a statement of this section".
- C02 — repaired: the description now excepts the case, "except where, as in CongruenceModulesOfThetaLifts 7.16a (2) and BaseChangeAndGaloisRepresentationsForUnitaryGroups 16.1, it is only a remark".
- C03 — repaired: line 1692 reads "Proposition B.5, for the projection of `ℤⁿ` along the span of a primitive sublattice, and for a lattice in a real inner-product space GeometryOfNumbersAndQuadraticArithmetic §0.2.5"; the References entry (line 2379) agrees.
- N01 — not repaired: "nearest published results" still stands at lines 1277 and 1793; written again as N01.
- N02 — not repaired: "and on main" still stands at line 2028; written again as N02.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 7.10c, the form of the formal proof (changed) | level `P = P_0` in the level form; the extra term | Level form at `P_0`: factor `d^{Z,P_0}_j`; 7.8a (line 1295) has `d^{Z,P_0}_j = D_0`. Extra term `C·(log x)²·N_c ≥ 0`: the formal form is the weaker one | holds | none |
| 7.11 route, against the changed 7.10c | `f·m·b·L² = x^ε·B₀`, `(log x)² ≤ x^ε`, `V ≤ b ≤ B₀` | `C·(x^εB₀ + x^εN_c) + B₀ ≤ (C+1)·x^ε·(B₀ + N_c)`: the bound of line 1681 with factor `D_0 = d^{Z,P_0}_j` | holds | question |
| 7.15, Origin: Horesh–Karasik B.5 (changed) | `ℤ²`, `Λ = ℤ(1,1)`; `Δ = 2ℤ²`, same `W` | `π(ℤ²) = ℤ(½,−½)`, dual `ℤ(1,−1) = ℤ² ∩ W^⊥`: B.5. For `Δ`: `π(Δ)^* = ℤ(½,−½) = Δ^* ∩ W^⊥ ≠ Δ ∩ W^⊥ = ℤ(2,−2)`: needs §0.2.5 | holds; attribution now exact | none |
| 7.16a (2) and its remark (changed) | setting of (2); setting of (3) | (2) assumes `E/F` unramified at every finite place and `V` standard; (3) lies in it (remark, lines 1933–1934). General form: remark only, in three places consistently | holds | none |

The rows for the untouched statements stand as in the previous review, of `c832fa9`.

- Source locators checked against the text: HoreshKarasik2023 Proposition B.5 (line 1534: for `Λ` primitive, the dual of the projected lattice is `Λ^⊥`) and Remark B.7 (line 1552). Of the seeded sample, 7.10c, 7.15 and 7.16a fall in the changed passages; 7.15 was checked at its source, 7.16a loses one sentence and gains no locator, and the two locators of 7.10c are into the formal proof (below).
- Cross-roadmap citations resolved at this head: GeometryOfNumbersAndQuadraticArithmetic §0.2.5 (`(π(Δ))^* = Δ^* ∩ W^⊥` for any `ℤ`-submodule, README line 129); 7.8a for `d^{Z,P_0}_j = D_0`; GluedTargetAndDivisionInequality's notation table and line 485, which use the same identity.
- Record: no heading, layer or section is removed, renumbered or retitled by the change; `Suggested.lean` is unchanged since `c832fa9`.
- Automatic checks: all passed. Dependency check: `depcheck: 124 roadmaps, 1420 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: exit 0, no output. The file declares nothing (a single `import Mathlib` and the module docstring naming the four headlines as not statable), so there is no `#check` comparison and no one-tactic probe to run.
- The pull request's text: the title and the description agree with this head for this folder; the sentence that C02 concerned now names 7.16a (2) as an exception. Outside this folder the pull request changes only the roadmap folders and family indexes it declares as its own.
- Overlap check: read ThetaChainsAndFrobeniusPrimeSums, ThetaChainsOnDefiniteUnitaryGroups, SelmerLengthBoundsAndLocalLifting and LengthBoundsInPadicFamilies (their scope as cited here; unchanged in what they share since the previous review). Shared objects and owners: congruence modules of an algebra, PadicFamilies §1.7a, and of modules, LengthBoundsInPadicFamilies §1.7a; the dual of a projected lattice, GeometryOfNumbersAndQuadraticArithmetic §0.2.5. Nothing is owned twice. No other open pull request changes this roadmap or drops an id it cites.
- Source independence: changed passages only; 3 passages compared with 1 source (HoreshKarasik2023), none shared; largest share [FormalProof], 129 of 140 locators (the previous review's count of 128 of 139, plus the one locator the change adds), not readable; contents not compared, since no layer is added, removed or reordered.
- Research link: the targets bound congruence modules of theta lifts between definite unitary groups, after Hida (1981, 1986), Ribet (1976), Bloch–Kato (1990), Bellaïche–Chenevier (2009) and Emerton–Gee–Herzig (2013), as steps of Alpöge's announced proof of GRH for Dirichlet L-functions (2026). Rests on the README's summary and References.

## Not verifiable

- The two [FormalProof] locators of the changed passage of 7.10c (`Formalism.MainNotions.TwistedPlaces.aux₃` and the new `Formalism.MainNotions.SmallLevelRankEq`): the repository's host is in no licence class of the sources service, so no file was read. The passage was checked only for agreement with 7.8a, 7.10c's level form and 7.11.
- As in the previous review: Yamana (2014), Bloch–Kato (1990), Iovita–Marmora (2015) and the works cited without locators in the Origins were not opened; none is in a changed passage.

## Source issues

- none

## For the human reviewers

- Scope: 11 of the 20 sections are labelled "particular to this proof"; their only references are [FormalProof] (a Lean repository) and [Announcement] (Alpöge, 20 November 2026), neither refereed (README, References).
- Licence: the [FormalProof] repository on GitHub could not be classified by the sources service, and its licence was not read.
- Not tested: [FormalProof] holds nearly all the locators and was not opened; the wording and arrangement checks and the Method labels were not compared against it.
