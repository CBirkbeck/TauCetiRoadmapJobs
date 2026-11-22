# Review of BaseChangeAndGaloisRepresentationsForUnitaryGroups (pull request #2890 at 6742668)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BaseChangeAndGaloisRepresentationsForUnitaryGroups/`
**Verdict:** accepted

**Summary.** Accepted: this was an incremental re-review of the 44 lines changed since `210ed5d`, together with a reading of the title and description against this head, and no finding remains. The three repairs hold: 14.0a is now stated over every number field with a route through strong multiplicity one that I checked step by step, and 10.0a, 13.0a and 14.0a each cite a publication whose locator I read (Deligne's Proposition 1.5, Hoffman's Theorem 2.2, Cogdell's Lecture 5). There is one small correction (the description counts four cited sub-roadmaps of the family where the README cites five) and no format note. The three questions for the human reviewers stand as before.

## C01 — The description says four cited roadmaps are not on main; the README cites a fifth

The description says "Four of the roadmaps it cites are sub-roadmaps of the family still in open pull requests" and then "Every other roadmap it cites is cited as it is on main." In 13.8a (line 594) the README also cites FrobeniusRestrictedRieszSums §0.4, for the cyclic hosts to which the formal proof's form of 13.8a is restricted. That roadmap is a sub-roadmap of the family (family index, line 95) and is not on main, so the second sentence is not true of it. It is cited to describe the formal proof's case, not as a supplier of a statement here, so nothing in the roadmap depends on the order.

It would be enough to add to the description: "It also names FrobeniusRestrictedRieszSums §0.4, a sub-roadmap of the family, to describe the case of 13.8a that the formal proof has; nothing here is derived from it."

## Previous findings

- The previous report, of `210ed5d`, has no finding (R01, …). Its small corrections:
- C01 (14.0a for totally complex fields only) — repaired: line 705, "For a number field `E` and a cuspidal automorphic representation `π` of `GL_n(𝔸_E)` … The form of [FormalProof] is the case of a totally complex `E`."
- C02 (no publication for 10.0a, 13.0a, 14.0a) — repaired: "Deligne 1973, Proposition 1.5" (line 106); "Hoffman, Theorem 2.2" (line 560); "Cogdell, Lecture 5, Proposition 5.3 (iii) with the remark after Proposition 5.1" (line 708); References lines 1190, 1198, 1199.
- C03 (description silent on what was added) — repaired: the description's fourth paragraph names the three published results, §R16.1.7, Layer 6 and the two Tau Ceti declarations; its fifth describes "When a roadmap is wrong".
- C04 (family index omits `src/`) — not repaired: deferred (D01).

## Deferred findings

- D01 — stands

## Verified sound

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| 10.0a Brauer in degree zero, with Deligne's route | `G = 1`; `G = S₃`, `ρ` standard; the claim "`H` then contains the centre" | `0 = 0`; `ρ − 2 = Ind_{C₃}(ω − 1) + (sgn − 1)`; `Ind_H χ` vanishes off conjugates of `H`, a central `z` has trace `ω(z)·dim ≠ 0`, so `z ∈ H` | holds; Del73 lines 225–242 (printed p. 510): `H` elementary, `x` of dimension 0 a combination of linear characters, i.e. of `χ − 1` |
| 10.0a route, second step | `Ind_H χ − dim·1` with `Z ⊂ H` | `= Ind_H(χ − 1) + (Ind_H 1 − [G:H]·1)`; second term inflated from `G/Z`, `|G/Z| < |G|` | route closes; inputs at the pin: `Monomial.lean` line 81, `Elementary.lean` line 441 |
| 13.0a, reduction from Hoffman's setting | field `K ⊃ ℚ`; infinite alphabet with all letters in degree 1; one letter in characteristic `p` | shuffle algebra over `K` is `K ⊗_ℚ` that over `ℚ ⊂ ℂ`; Lyndon property depends only on the order of a word's letters, a relation involves finitely many letters; `a^{ш p} = 0` | holds; Hof99 lines 81–84 and 119–120 (subfield of `ℂ`, locally finite); characteristic zero needed and stated |
| 14.0a over every number field | `n = 1`; `n = 2` | `χ(g⁻¹) = χ⁻¹`; `ᵗg⁻¹ = w g w⁻¹·(det g)⁻¹`, so `φ(ᵗg⁻¹) = ω⁻¹(det g)·φ(g w⁻¹)`: the space is `π ⊗ ω⁻¹ = π^∨` | holds; no step of the route uses the infinite places beyond `θ` preserving `O(n)`, `U(n)` |
| 14.0a route | unramified `π_v` with parameters `α_i`; non-unitary `π` | `θ` inverts the torus: parameters `α_i⁻¹`, those of `π_v^∨`; `|ω_π| = |·|^s`, twist by `|det|^{−s/n}` gives a unitary central character, then `π̄ ≅ π^∨` | holds; AL.3.4.3 and AL.3.7.1 on main give equality of the two cusp realizations (AL.3.7.1 says so in terms) |

The rows for untouched statements stand as in the previous review, of `210ed5d`.

- Source locators checked against the text: 3 (Del73 line 225, Proposition 1.5 on printed p. 510; Hof99 line 119, Theorem 2.2; Cog04 lines 1805–1813 and 1941–1946, the remark after Proposition 5.1 on printed p. 38 and Proposition 5.3 (iii) on p. 39; Cog04 line 1764 for "unitary").
- Seeded sample: 10.0a and 14.0a fall in changed passages and are in the table; the other targets of the sample are untouched since `210ed5d`.
- Library declarations opened at the pin: `FDRep.exists_character_eq_indClassFun_of_isNilpotent` (`TauCeti/RepresentationTheory/Induction/Monomial.lean` line 81: `IsAlgClosed`, `CharZero`, finite nilpotent `G`, simple `W`); `TauCeti.IsElementary.isNilpotent` (`TauCeti/GroupTheory/Elementary.lean` line 441). Both say what the new "From Tau Ceti" contract says.
- Cross-roadmap citations resolved on main: AutomorphicLFunctionsAndLocalFactors AL.3.4.3 (line 1461) and AL.3.7.1 (line 1575); InductionRestriction Layer 6 (line 661, Artin and Brauer induction).
- Dependency check: `depcheck: 133 roadmaps, 1488 edges, 0 problem(s)`; no UPWARD or CYCLE line. No new supplier roadmap: AutomorphicLFunctionsAndLocalFactors and InductionRestriction were already suppliers and are on main.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output; the file is unchanged: single `import Mathlib`, no declaration, no `sorry`, no `set_option`, so there is no signature to compare and no one-tactic probe to run. The automatic checks all passed.
- Nothing outside the folder changed since `210ed5d`; against main the pull request changes only this folder and the family index.
- Title and description read against this head: one sentence fails (C01); the rest agrees (new folder, three published inputs with their locators, §R16.1.7, Layer 6 and the two declarations, the family index's three files and its section, `Suggested.lean` declaring nothing).

Overlap check: read LocalFactorsOfTwistsAndTypes, CongruenceModulesOfThetaLifts, HeckeIdealsAndTaylorWilesRelations, UniformWildKernelBounds, ThetaKernelsForUnitaryDualPairs (open) and AutomorphicGaloisRepresentationsPartII, EndoscopicTransferAndUnitaryTraceComparison, PotentialAutomorphyInfrastructurePartII (main) as in the previous review; the change adds no object. Owners unchanged: Brauer induction, InductionRestriction Layer 6, with the degree-zero form here (10.0a); multiplicity one and strong multiplicity one, AutomorphicLFunctionsAndLocalFactors AL.3.4.3 and AL.3.7.1, cited and not restated (14.0a).

Source independence: changed passages only: 6 passages compared with 3 sources (Del73, Hof99, Cog04), none shared; the route of 10.0a names the three steps of Deligne's French proof in one English sentence without its formulas, and the route of 14.0a is not in Cogdell; largest share [FormalProof], as in the previous report; the arrangement was not compared again (no layer added, removed or reordered). Radford 1979 is cited by its title alone (paywalled); Kudla 1994, Harris–Kudla–Sweet 1996 and Labesse 2011 could not be read.

Research link: Layer 10 is the explicit depth-zero local Langlands correspondence (Henniart 1992; Bushnell–Henniart 2005) with Kottwitz's 1986 matching extended to functions from the residue field; Layers 14–16 apply Caraiani's and Labesse's (2011) results to definite unitary groups. Rests on the README; the family index says the family follows an unpublished formal proof.

## Not verifiable

- Radford 1979 (13.0a): paywalled; the statement was read in Hoffman's Theorem 2.2, which attributes it to Radford.
- The attribution of 14.0a to Gelfand–Kazhdan: no text of theirs is cited or was opened; Cogdell states the fact without proof, and the README's own route proves it.
- The items of the previous report (the outline of the formal proof's construction in Layer 14, the declarations of the formal proof not unfolded, Kudla 1994, Harris–Kudla–Sweet 1996, Labesse 2011, the published numbering of Caraiani–Scholze, the steps of 13.8a not given) stand as they were.

## Source issues

- none

## For the human reviewers

- Scope: the family index says the family follows a formal Lean proof of the Riemann hypothesis announced on 20 November 2026; I found no refereed source for it. Targets 10.33c, 10.33d, 13.8a and 15.1 cite no literature besides it.
- Licence: the README cites file paths and declaration names of that proof's repository, published without a licence; no code is reproduced. The paragraph of 16.1 on the formal proof's weak base change renders one formal structure clause by clause in prose.
- Governance: the family index's section "When a roadmap is wrong" (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 45–75) says what a review of a library contribution may not block. Whether a roadmap index sets that rule is yours to decide.
