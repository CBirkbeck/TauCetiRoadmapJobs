# Review of MotivesAndAlgebraicCycles (pull request #1313 at 38cb422)

**Verdict:** needs changes

## R01 (P3) — The description names a consumer roadmap that does not exist

**Location:** PR description, `<!-- roadmap-summary -->`, “Why Tau Ceti wants it”: “StandardConjectures builds on its correspondences, Weil cohomology and equivalence relations”.
**Claim:** No roadmap `StandardConjectures` exists on main or at any open head; the consumer of this shared core is `LefschetzStructures`, the folder of #1061, which the same description names as the recipient two paragraphs later.
**Witness:** `roadmaps grep --fixed StandardConjectures` returns only this roadmap's own README (lines 9, 35, 1711). #1061 adds `TauCetiRoadmap/LefschetzStructures`; its README §2.4 is “Comparison with MotivesAndAlgebraicCycles §7.3”.
**Repair:** Replace the sentence's subject: “LefschetzStructures builds on its correspondences, Weil cohomology, equivalence relations and standard-conjecture predicates”. The same name and locator in `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md` lines 9, 35 and 1711 then need the matching `LefschetzStructures` Layer 2 (§§2.1–2.4) citation.

## Previous findings

- R01 — repaired: the description now reads “Neutral reconstruction produces a commutative Hopf algebra over any field K from an essentially small K-linear abelian rigid symmetric monoidal category with End(1)=K and an exact faithful K-linear strong symmetric monoidal fiber functor”; README lines 7, 15, 553 no longer say “arbitrary category”.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| Scope, line 15: neutral reconstruction “starts from the category and fiber datum of §6.1” (`neutralTannakian_recognition`) | `Vect_K` with identity fiber; `Rep(𝔾_m)`; comodules of `K[t]`; super vector spaces; finite free ℤ-modules | `H=K`; `H=K[t,t⁻¹]`, `S(t)=t⁻¹`, `t·t⁻¹=1=ε(t)`; `tS(t)=1` at `t=0` gives `0=1`; odd-line symmetry `−1≠+1`; `2` mono and epi, not iso | The three non-examples fail `RigidCategory`, `ω.Braided`, `Abelian` respectively; the description's hypothesis list equals §6.1 and the Lean binders. |
| Scope, line 7 and Layer 3 Dependencies, line 553: “neutral and relative” reconstruction in Layer 6 | Identity `A→A`; finite-support ℤ-graded spaces over `Vect_K` | Unit coalgebra; pieces `K^S`, duals assemble to `K[ℤ]` with `Δe_n=e_n⊗e_n`, `e_m e_n=e_{m+n}`, `S(e_n)=e_{−n}` | Both forms are targets with hypotheses (§§6.1–6.2, §6.4); no third, hypothesis-free form is promised. |
| R01: consumer of §§0.1–0.2, 0.5, 2.2–2.4, 7.3–7.4 | Roadmap names on main and at 476 open heads | `StandardConjectures`: 0 folders; `LefschetzStructures` (#1061): cites this roadmap's §§0.1–0.2, 2.2, 7.3, 7.4 | Description names the wrong roadmap. |

Rows for untouched statements stand as in the previous review, of `855578d`.

- Remark (untouched text, no R-number): README lines 9, 35 and 1711 name the same consumer `StandardConjectures`, line 1711 with “§§2.1–2.5”; `LefschetzStructures` at its head has §§2.1–2.4.
- Description against the head: 14 sentences of the summary block and prose checked; hypothesis list against README §6.1 line 1118 and `Suggested.lean` lines 118–134; bitorsor (line 79), Temkin p-alterations (§0.5c, line 173), arbitrary field and coefficient ring (§4.1), heights and unitary theta (§§7.17–7.19), no tensor generator (line 1138), three folder files, 0 removed headings or declarations, 0 dropped suppliers. #1002, #1021, #1062, #1235 resolve to the four reconstruction and torsor consumers of README lines 1713–1717; MotivicEtaleKTheory and PeriodsAndSpecialValues cite this roadmap at their heads.
- Changed passages: 3 sentences (README lines 7, 15, 553); every reference they make (§6.1, Layer 6, ReductiveGroups Layers 0–1) resolves; no statement, supplier, section number or Lean declaration changed. No target of the seeded sample falls in them.
- Source locators: DeligneMilne Theorem 2.11 (line 931, p.20) and Definition 2.19 (line 1116) read; both require rigid abelian tensor, `End(1)=k`, exact faithful `k`-linear tensor fiber, as the description and §6.1 state.
- Gate at this head: every counter zero, `OK`. Elaboration of `Suggested.lean`: 4 `sorry` warnings (lines 88, 102, 118, 141), nothing else. Dependency check: `depcheck: 247 roadmaps, 2240 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file changed outside the folder.
- Headlines: unchanged, the 4 Lean targets of the previous review; no Lean line changed, so signatures and padding probes stand.
- Overlap check: read MotivicEtaleKTheory, SchemeKTheoryOperations, EtaleDualityAndPerverseSheaves, KTheoryFiniteLocalFields, LefschetzStructures, SchemeAndStackFoundations, EtaleCohomologyFoundations; nothing shared (LefschetzStructures imports §§0.1–0.2, 2.2, 7.3–7.4 from here and owns only the Lefschetz data and operators).
- Source independence: changed passages only; 3 changed sentences and the description's reconstruction sentence compared with 1 source (DeligneMilne lines 931–934, 1116–1118), none shared beyond the forced hypothesis list; largest share among changed passages DeligneMilne, 0 new locators; no layer added, removed or reordered, so contents were not compared again.

## Not verifiable

- Grothendieck1969, pp.299–303: settled as uncertified, outside the changed passages; carried from the previous report.
- DelfsHomology, Chapter III §9, Theorem 9.3, and KunnemannPicard, §7.17: outside the changed passages; carried from the previous report.

## Source issues

- none

## For the human reviewers

- none
