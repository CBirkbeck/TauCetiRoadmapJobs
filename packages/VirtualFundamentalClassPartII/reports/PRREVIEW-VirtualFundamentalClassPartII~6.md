# Review of VirtualFundamentalClassPartII (pull request #2446 at 42d80b4)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 25 lines changed since `c5f07fa` and of the pull request's title and description. The three small corrections of the previous review are repaired (the account of what VirtualFundamentalClass §9.5 states, the sentences on AlgebraicGromovWittenTheory, and the description's list of open suppliers), the repairs introduce no new problem, and the description agrees with this head. One format note from the previous review remains (a page number in 8.1), not blocking; the three bookkeeping questions on ownership are still left for the human reviewers.

## N01 — One page for two line ranges in 8.1

In 8.1 (lines 1625–1626), "vistoli1989 Lemmas 3.16 and 4.6 (p. 641, lines 1172–1174 and 1451–1470)" still gives p. 641 for both ranges; lines 1451–1470 lie seven pages later (p. 648, as the citation of Lemma 4.6 (ii) in 3.5 has it).

## Previous findings

The review of `c5f07fa` had no finding (no R-numbered remark). Its small corrections and format note:

- C01 — repaired: the description now reads "StableReductionPartII is an open pull request that merges first (listed below); VirtualFundamentalClass, StackPointsAndResidualGerbes, SchemeAndStackFoundations, EquivariantIntersectionTheory, StableReduction, EnhancedDerivedSheaves and DerivedModuleAlgebra are on main"; all seven folders are on main.
- C02 — repaired: "AlgebraicGromovWittenTheory states for stable maps the obstruction theory and virtual dimension that Layer 9 states for every space of maps" (line 52); Downstream consumers drops deformation invariance and says 5.4 "would compute" (lines 2242–2245).
- C03 — repaired: "which states the first case over a base of pure dimension and the second over a base smooth over `k` with `Z′` of finite type over it, for separated stacks with the resolution property" (lines 1852–1856); same clause at lines 2314–2316 and 2464–2465.
- N01 — not repaired: "vistoli1989 Lemmas 3.16 and 4.6 (p. 641, lines 1172–1174 and 1451–1470)" (lines 1625–1626); written again above as N01.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 8.3, closing sentence on VirtualFundamentalClass §9.5 (changed) | §9.5 on main, lines 1412–1434, against 8.3's hypotheses | supplier: smooth `v` over pure-dimensional `Y`; graph case needs `Y` smooth over `k`, `Z′ → Y` finite type. 8.3: any pure-dimensional `𝔜`, quasi-compact open `Z′_0` | sentence true of main | none |
| Scope paragraph and supplier contract for §§9.2–9.6 (changed) | same supplier lines | both clauses list the two cases with base smooth over `k` and `Z′` of finite type in the second; §9.5 says the same | agree with 8.3 and with main | none |
| Overview and 9.5 (sample), virtual dimension against AlgebraicGromovWittenTheory §§4.1, 4.3 | `b = 3g − 3 + n`; `ℙ²`, `g = n = 0`, degree 1 | `b + δ + dim X(1 − g) = (1 − g)(dim X − 3) + n + c_1·β`; `−3 + 3 + 2 = 2`, its Check gives `−1 + 3 = 2`; its rank `d(1−g) + c_1·β` | agree | none |
| Downstream consumers and "Not part of this roadmap" (changed) | AlgebraicGromovWittenTheory at its open head, §§4.1–4.3 | §4.1 obstruction theory over the prestable stack, §4.2 resolution and resolution property for §7.3, §4.3 virtual dimension; target smooth projective, characteristic 0; no citation of this roadmap | sentences true of that head | none |
| 8.1 citation of vistoli1989 Lemmas 3.16, 4.6 (sample) | page markers of the cached text at lines 1172, 1451, 1470 | extraction pages 30 and 37: seven pages apart, so p. 641 and p. 648 | one page number wrong | N01 |
| Pull-request title and description | each sentence against the head and main | adds a roadmap (2677 lines, 62 headings); three files; no declaration, twelve headlines in the docstring; one open supplier, seven on main; GromovWittenTheory, ImplicitAtlases named once, in the exclusions | agree with the head | none |

The rows for the statements the change does not touch stand as in the previous review, of `c5f07fa`.

- Source locators checked this round: 2 (vistoli1989 lines 1172–1174 and 1451–1453, with their page markers); the changed passages add no locator.
- Library declarations opened this round: none; the change touches no library citation and `Suggested.lean` is unchanged.
- Cross-roadmap citations resolved: VirtualFundamentalClass §9.5 on main (lines 1410–1434); AlgebraicGromovWittenTheory §§4.1–4.3 at the head of its open pull request; the seven suppliers the description says are on main are on main, StableReductionPartII is open.
- Automatic checks rerun at `42d80b4`: every check 0, `OK`. Dependency check: `depcheck: 199 roadmaps, 2190 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file changed outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output. The file declares nothing, so the `#check` binder comparison and the one-tactic probe are empty; no headline is statable at the pins, and the docstring names all twelve with the carrier each lacks.
- Duplication and ownership: the change adds no object; it only rewords what two other roadmaps state.

Overlap check: read VirtualFundamentalClass (main, §9.5), AlgebraicGromovWittenTheory (open, §§4.1–4.3); StackPointsAndResidualGerbes, EquivariantIntersectionTheory, SchemeAndStackFoundations, MotivicStructuresInModuliOfCurves and StableReductionPartII as in the previous review, the change not bearing on them. Shared: the stable-map obstruction theory, stated for stable maps by AlgebraicGromovWittenTheory §4.1 and in general by 9.3 here, which names the difference in one clause (owner of the general statement: this roadmap); integral closed substacks, owned here in 1.0. Nothing else shared.

Source independence: changed passages only; 4 passages compared with 1 source (behrend-fantechi1997 Proposition 7.5 at lines 1721–1739), none shared; largest share vistoli1989, 80 of 175 line locators; contents not compared again, the change adding, removing and reordering no layer (previous result: independent).

Research link: Layers 1–5 are the intersection theory of Vistoli 1989 and Gillet 1984 with the comparison of Edidin–Graham 1998; Layers 6–8 the virtual class of Behrend–Fantechi 1997 with Kresch 1999's rational equivalence and the deformation invariance of Li–Tian 1998; Layer 9 the obstruction theory of Behrend 1997. Rests on the README's sources, read at their locators.

## Not verifiable

- gillet1984 §4 (2.1, 2.2): settled as uncertified, cited by locator.
- fulton1998 Propositions 1.8, 8.1.1 and 10.2, §1.10, Chapter 3 and Corollary 6.3: settled as uncertified, cited by locator.

Automatic checks set aside as false positives: the tool that lists the Lean declarations of `Suggested.lean` read the docstring phrase "theorem with the carrier it lacks" as a declaration named `with`, so the computed change summary counts one declaration added and the signature listing failed; the file declares nothing.

## Source issues

- none

## For the human reviewers

- StackPointsAndResidualGerbes on main (`README.md` lines 54–62 and 2171) names a roadmap VirtualFundamentalClasses, §1.2, as owner of integral closed substacks; no open pull request carries that roadmap, and 1.0 here states them.
- AlgebraicGromovWittenTheory (open, another author) builds the stable-map obstruction theory in its §§4.1–4.3 from VirtualFundamentalClass alone; 9.3–9.5 here state the general case and now say so. Neither text settles which cites the other.
- The two supplier gaps declared at the design stage are no longer in the README: one became 1.0 here, the other is VirtualFundamentalClass §1.5 on main. The plan's gap list may need the same change.
