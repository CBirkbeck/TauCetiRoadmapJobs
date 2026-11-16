# Review of RigidAnalyticGeometry (pull request #1807 at 618bc24)

**Verdict:** accepted

No findings. Incremental re-review of the 17 lines changed since `f58ded6`.

## Previous findings

- R01 — repaired: README lines 65–70 "The Runge-immersion predicate of §4.3 … and the Gerritzen–Grauert theorem for locally closed immersions are owned here"; lines 2268–2272 list F1.6; the description names F1.6 as to cite §4.3.
- R02 — repaired: description "is rewritten in the house shape … replaces main's 33 declarations (28 pinned in Tau Ceti or Mathlib, the Banach function algebra bound restated as `exists_norm_le_mul_supSeminorm`, four moved to AdicSpacesPartIII R3.6) by twelve headlines".
- R03 — repaired: README lines 2320–2321 "Locators use the numbering and the pages (1–38) of the author text, not the journal pagination."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §4.3 Runge immersions and Gerritzen–Grauert for locally closed immersions (cited by the new Scope sentence) | identity; `U={|T|≥|ϖ|}` in the unit disc with covers at `|ϖ|` and at `|ϖ|²`; dense-image test on `K⟨T⟩→K⟨T,ϖ/T⟩` | identity: one-member cover, `W=Sp A`. Cover at `|ϖ|`: circle in disc `Sp K⟨Z⟩`, `‖Z⁻¹−p(Z)‖=max(1,‖p‖)≥1`, not Runge. Cover at `|ϖ|²`: `∅` and `{|ϖ/T|≤1}`, Weierstrass. `‖ϖ/T−p(T)‖≥1`: image not dense | theorem and criterion agree with the README Checks (lines 1391–1402) and with the Checks of AdicSpacesPartIV F1.6 | none |
| §4.3 `exists_eq_iUnion_rationalDomain` (the finite-union form the new sentence says is derived) | `U=∅`; `U=Sp A`; annulus `|ϖ|≤|T|≤1` | `n=0`; `g=1`, no numerators; `R(ϖ/T)` with `(T,ϖ)=A` | true; elaborated signature unchanged | none |
| §5.3 `isGRing_stalk` (a [Conrad] page locator, for the new pagination sentence) | Theorem 1.1.3; Lemma 1.1.4; Lemma 1.1.5 | Conrad line 201 on page 5; line 263 on page 6; line 274 on page 6, running to page 7; last page marker 38 | README pages 5, 6, 6–7 are those of the author text | none |

The rows for the untouched statements stand as in the previous review, of `f58ded6`.

- Source locators checked against the text: 5 (Conrad lines 201, 263, 274 and the page markers 3–7 and 38; Bosch lines 2750, 2756–2783 for Definition 5, Remark 6 and Proposition 7 of §4.2). No sampled section is in the changed passages.
- Description's count of main's 33 declarations checked one by one: 28 have a pinned counterpart (opened: `TauCeti/RingTheory/Affinoid/SupSeminorm.lean:279, 302, 360, 385`, `MaximumModulus.lean:156`, `ValueGroup.lean:79`, `PowerBounded.lean:135, 169, 197, 250`, `Polyradius.lean:68`, `KrullDimension.lean:77, 97`, `MaximalSpectrum.lean:46, 53`, `FiniteQuotient.lean:43`, `TauCeti/Analysis/Normed/Unbundled/Slope.lean:64`, `TauCeti/Analysis/Normed/Operator/SlopeDecomposition.lean:89`, `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Basic.lean:216`); one is restated; four (`exists_fg_smul_le_of_presentation`, `isNoetherian_of_presentation_of_discrete`, `scalarImage`, `stable_filtration_cofinal`) are AdicSpacesPartIII R3.6 *almost-noetherian-integral-affinoid-modules* and *proper-cohomology-adic-completion*.
- Cross-roadmap citations resolved in the changed passages: AdicSpacesPartIV F1.1, F1.6 *rigid-locally-closed-immersion-runge* (its README lines 4148–4161) and R5.7, on main; AdicSpacesPartIV is not in this pull request and its line 4160 still reads "Part IV owns this Runge theorem".
- Dependency check: `depcheck: 235 roadmaps, 2237 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate at 618bc24: every check passes (the worker's run; a rerun shows only the pull request's own sibling folders as outside the folder). `Suggested.lean` is unchanged since `f58ded6` and elaborates with twelve `sorry` warnings and nothing else.
- Pull request text against the head: the RigidAnalyticGeometry paragraph and the sentence on AdicSpacesPartIV F1.6 agree with the README (suppliers Mathlib, Tau Ceti, RestrictedPowerSeries, PadicFunctionalAnalysis, SchemeAndStackFoundations, AdicSpaces; twelve headlines; seven named not statable). Pull request #1808 also changes this folder; the merge-order block places this pull request first.
- Overlap check: read AdicSpacesPartIV, AdicSpacesPartII, AdicSpacesPartIII; Runge immersions and Gerritzen–Grauert for immersions are shared with AdicSpacesPartIV F1.6, owner this roadmap (stated in Scope and ownership and in the description); nothing else shared in the changed passages.
- Source independence: changed passages only; 3 passages compared with 2 sources (Bosch §4.2, Conrad), none shared; largest share BGR, 29 of 127 locators, text and contents page not readable; no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- [BGR] locators: the manifest records the book as uncertified; none is in the changed passages.
- [Prestel] 4.17 and [Matsumura] Theorem 102: no readable text; unchanged since the previous review.

## Source issues

- none

## For the human reviewers

- **Not tested.** BGR has the largest share of the locators (29 of 127) and is uncertified; wording and arrangement were not compared with its text.
- **Licence.** The cached Bosch text comes from a seminar page at `math.purdue.edu` and the cached Huber-CV text from a seminar reference page at `virtualmath1.stanford.edu`; neither host is the author's or the publisher's.
- **Licence.** `TauCetiRoadmap/RigidAnalyticGeometry/README.md`, last section, names the repository WilliamCoram/PhD at a fixed commit as secondary implementation references; its licence was not read, and `Suggested.lean` was not compared with it.
- **Scope.** README lines 84–93 exclude the composition law for Kiehl-proper morphisms and the inner-cover form over every affinoid of the base; no roadmap is named as their owner.
- **Scope.** `TauCetiRoadmap/AdicSpacesPartIV/README.md` line 4160, on main and outside this pull request, still says Part IV owns the Runge theorem; the description asks that F1.6 cite §4.3, which needs a revision of that roadmap.
