# Review of NonabelianLevelStructures (pull request #2273 at 92f0a3b)

**Verdict:** accepted

No finding. Incremental re-review of the 2 lines changed since `896aaa4` (one paragraph of `TauCetiRoadmap/NonabelianLevelStructures/README.md`, the proof route of §3.3; `Suggested.lean` is unchanged), and of the pull request's title and description against this head.

## Previous findings

- none: the review of `896aaa4` had no finding.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 3.3 `combinatorial_congruence` (cited by the changed paragraph) | brute force over all generating pairs of S₃, D₁₀, A₄, S₄, SL₂(𝔽₃), A₅ | (\|c\|, m′, d′, modulus, orbit): S₃ (3,3,1,1,3); D₁₀ (5,5,1,1,3); A₄ (2,2,2,1,4); S₄ (3,1,1,3,9); SL₂(𝔽₃) (4,2,1,2,16); A₅ (3,1,1,3,18), (5,1,1,5,10) | modulus divides the orbit size in every case; agrees with the Layer 3 Examples | none |
| 3.3 proof route, the cancellation | 12·\|c\| ∣ m·d·deg with m ∣ 12 m′, d ∣ d′; S₄ and SL₂(𝔽₅) trace −2 | 12\|c\| ∣ 12 m′d′·deg ⟹ \|c\|/gcd(\|c\|, m′d′) ∣ deg; S₄: 36 ∣ 12·9 = 108; SL₂(𝔽₅): 120 ∣ 24·40 = 960, modulus 5 ∣ 40 | the reduction as reworded is valid | none |
| 3.3 proof route, smooth versus cuspidal groups | SL₂(𝔽₃), c of order 4; S₃ | Z(G) ∩ ⟨c⟩ = {±1} ≤ A ∩ ⟨[u⁻¹, h⁻¹]⟩ = {±1}, m′ = 2; S₃: Z = 1, A ∩ ⟨c⟩ = C₃, m′ = 3; Z(G) ≤ A(G, u, h) by the exact sequence of §2.2 | "sits inside every group of that form" holds | none |
| 3.3 proof route, supplier inputs | ArithmeticDynamicsPartII §6.0 at its open head, README lines 777 and 794 | supplier states 12·ord(c) ∣ m·d·deg for ord(c) > 1; vertical group Z(H) ∩ ⟨c⟩ at a smooth ramification point; full exponent ∣ 12 × vertical exponent; components = determinant-one orbits | each input the paragraph attributes to §6.0 is stated there | none |
| 3.3 proof route against its source | CHEN2024 lines 3450–3468 (proof of Theorem 4.10.5, pp. 386–387) | same inputs (Prop. 3.5.2, Thm 4.10.3(d), Prop. 3.2.2, Thm 3.5.1, Thm 2.5.2(4)); different order of steps; longest shared run 4 words, a standard term | supported; not the source's wording | none |

The rows for untouched statements stand as in the previous review, of `896aaa4`.

- Source locators checked against the text: 2 in CHEN2024 (Theorem 4.10.5 at line 3429, p. 386, with the orbit paragraph at lines 3440–3446, p. 387; its proof at lines 3450–3468), both correct. No target of the seeded sample falls in the changed paragraph.
- Cross-roadmap citations resolved: ArithmeticDynamicsPartII §6.0 at its open head (4 statements, above); §0.1, §0.3 and §2.3 of this README exist under those numbers.
- Pull request text: the title, the summary block and the four prose paragraphs were read against this head (README Summary, Layer 7 standing hypotheses p ≥ 5 and p ≥ 13, §7.6–7.7 Meiri–Puder condition, "From Tau Ceti", Downstream consumers, the imports of `Suggested.lean`); no sentence is contradicted. It adds a roadmap (0 headings and 0 declarations removed); the rewording changes no section, declaration or supplier, so nothing is left unstated.
- Gate: every check passed (the worker's run includes the targeted build; rerun here, all counters 0). Elaboration of `Suggested.lean`: `sorry` the only warning (4 theorems, lines 122, 136, 260, 278). `Suggested.lean` is unchanged, so signatures and the one-tactic probe stand as in the earlier reviews.
- Dependency check: `depcheck: 241 roadmaps, 2247 edges, 0 problem(s)`; nothing changed outside the folder.
- Declared gaps: the changed paragraph cites none; the 7 declared slugs are untouched.
- Overlap check: read ArithmeticDynamicsPartII, InverseGaloisAndArithmeticFundamentalGroups, ModularCurvesPartII, GroupActionsOnRiemannSurfaces, AdelicImagesAndModularCurves, NoncongruenceModularForms, BelyiMaps; the coarse degree congruence, the level stacks M(G) and the sign blocks Y* are shared with ArithmeticDynamicsPartII, which owns them (§6.0 and §7.2 cited); nothing else shared.
- Source independence: changed passages only; 1 passage compared with 1 source (CHEN2024), none shared beyond standard terms; largest share CHEN2024, 63 of 79 locators; no layer added, removed or reordered, so the comparison of contents with CHEN2024 stands: independent.

## Not verifiable

- ASADA2001, §7: uncertified, cited by locator.
- VDOVIN1999, Theorem A: uncertified, cited by locator.
- The description's count of earlier review and red-team rounds: a statement about the job board, not checkable against the head.

## Source issues

- none

## For the human reviewers

- none
