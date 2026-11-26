# Review of SpecialFunctionsGroupModels (pull request #2694 at e7f3c31)

**Verdict:** accepted

**Summary.** Accepted: no finding, no small correction and no format note. The only change since the previous review is the rename of the multiplicity-one theorem of 5.3 to `rank_invariants_restrict_le_one`, made consistently in the README and in `Suggested.lean`; the statement is unchanged and was recomputed on degenerate cases. As before, none of the six cited books could be read from a legal copy, so no source locator was verified; that is left to the human reviewers.

## Previous findings

The previous review had no finding and one format note.

- N01 — repaired: README 5.3 reads "**Multiplicity one** (`rank_invariants_restrict_le_one`)" and `Suggested.lean` line 1245 declares `theorem rank_invariants_restrict_le_one`; the old name occurs nowhere in the folder, on main or in an open roadmap.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 5.3 `rank_invariants_restrict_le_one` | `G = K = 1`; `H = 0`; `G = K` the circle, character `u ↦ uⁿ`; `G = K = S₃` | trivial action irreducible forces `dim H ≤ 1`, invariants `= H`, rank `0` or `1`; circle: rank `1` at `n = 0`, else `0`; `S₃`: ranks `1, 0, 0` for trivial, sign, 2-dimensional | holds | none |
| same, Gel'fand hypothesis as negative control | `G = SU(2)`, `K = 1`, the 2-dimensional representation | `L¹(G)` not commutative, so the pair is not Gel'fand; invariants `= ℂ²`, rank `2 > 1` | hypothesis needed and present | none |
| same, name against statement | elaborated type at this head | conclusion `Module.rank ℂ ↥(U.restrict K.subtype).invariants ≤ 1`; binders `μ`, `K`, `hK`, `hG`, `U`, `hU`, `hc`, `hirr` all explicit | name describes the conclusion | none |

The rows of the previous review for the untouched statements stand as in the previous review, of `d7697fa`.

- Source locators checked against the text: 0 (no legal copy of any of the six books; the change adds no locator).
- Library declarations opened at the pin: none new; the pinned Mathlib and Tau Ceti were searched for `rank_invariants_restrict_le_one` and have no declaration of that name (Mathlib's `finrank_fixedSubmodule_*` in `LinearAlgebra/Transvection/Generation.lean:72` are about transvections and unrelated).
- Cross-roadmap citations resolved: CStarAlgebras §2.2 on main (`TauCetiRoadmap/CStarAlgebras/README.md` line 430, irreducibility as a scalar commutant, line 437), which the changed bullet cites.
- Consumers of 5.3: SpecialFunctionsHigherSpheres (README lines 530, 536) and SpecialFunctionsRankOneSymmetricSpaces (lines 828, 848, 893) cite it by section, not by the theorem's name, so the rename breaks nothing.
- Dependency check: `depcheck: 106 roadmaps, 1222 edges, 0 problem(s)`; no UPWARD or CYCLE line; no change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean`, 80 `sorry` warnings, no error; the elaborated type of the renamed theorem compared with README 5.3 (Gel'fand pair, irreducible, strongly continuous, unitary, second-countable `G`): same generality.
- One-tactic probe: not run again; the statement is unchanged, and its conclusion fails without the Gel'fand hypothesis (second row), so no single library lemma or unfolding closes it.
- Description against the head: it names no theorem of 5.3 by the old name; the counts (76 theorems, 4 instances, 62 definitions, five sanity checks) are unchanged by a rename; nothing in the title or description is contradicted.

Overlap check: read SpecialFunctionsSU2MatrixElements, SpecialFunctionsHigherSpheres, SpecialFunctionsMotionGroupsBessel, SpecialFunctionsSU11MatrixElements, SpecialFunctionsRankOneSymmetricSpaces, SpecialFunctionsAffineHeisenbergGroups (open) and NoncompactQuantumSymmetry (main); the general matrix element, the multiplier machinery, the motion groups with their Haar measures and the Gel'fand-pair theory are owned here, and the five later roadmaps consume them by section (SpecialFunctionsMotionGroupsBessel README line 892 says so of `M(n)` and `ISO(1,1)`); the other boundaries are as in the previous review; nothing else shared.

Source independence: changed passages only; 0 passages compared with 0 sources (none of the six texts could be read; the change adds no prose, no locator and no layer); largest share Vilenkin–Klimyk Vol. 1, 32 of 90 locator citations; contents not compared with its table of contents, which could not be opened.

Research link: The `SU(1,1)`, Heisenberg and motion-group models with their weight and Casimir dictionaries are the concrete forms of the unitary duals that NoncompactQuantumSymmetry classifies; Layer 5 is the Gel'fand-pair harmonic analysis of Dieudonné 1980 and Wawrzyńczyk 1984 that the planned special-function sequels use. Rests on the README's scope and consumer sections.

## Not verifiable

- Vilenkin–Klimyk, Vol. 1 (Kluwer 1991): paywalled; every locator into it unverified.
- Klimyk–Vilenkin, Encyclopaedia of Mathematical Sciences 59 (Springer 1995): paywalled.
- Wawrzyńczyk (Reidel 1984): paywalled; this includes the locators of 5.3 (Theorems 5.2.1 and 5.3.1).
- Dieudonné, CBMS 42 (AMS 1980), Miller (Academic Press 1968), Edmonds (Princeton 1957): no legal copy found in an earlier round; not looked for again.
- The four misprints the README attributes to its sources, for the same reason.

Automatic checks set aside as false positives: the four `instance … := by sorry` declarations for the motion groups are instances of proposition-valued classes (topological group, local compactness), so they are theorems stated as instances and carry no admitted data. The remark that `multiplierRep` takes its value by choice is true but not a defect: the uniqueness statement determines the value and the docstring says so.

## Source issues

- none

## For the human reviewers

- **Not tested.** No text of any of the six cited books was readable legally, so neither wording nor arrangement was compared with a source; Vilenkin–Klimyk Vol. 1 has the largest share (32 of 90 locator citations).
- **Licence.** README "Prior formalization" says the names and statements of 0.1, 1.1–1.3, 2.1 and 3.1–3.2 are those of the author's own repository `bjbraams/lean-SFVK`, stated there as Apache-2.0; that repository was not opened.
- **Licence.** Three texts (Dieudonné, Miller, Edmonds) were asked of the operator in an earlier round; the other three resolve only to paywalled pages.
