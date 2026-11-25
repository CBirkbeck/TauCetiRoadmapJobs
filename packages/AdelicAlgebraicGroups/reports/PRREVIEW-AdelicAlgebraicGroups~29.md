# Review of AdelicAlgebraicGroups (pull request #3027 at 59b3c66)

**Verdict:** accepted

**Summary.** An incremental re-review of the 7 lines changed since `6ff5aef`, and a check of the pull request's title and description against this head. The verdict is accepted, with no findings: the two unimodularity targets of 1.5 now cite Oesterlé, Chapter I, Proposition 5.3 and Corollary 5.4, p. 23, which was read at the text and gives both statements, including groups with a rational character. There are no small corrections and no format notes; one question for the author is carried, and nothing is left for the human reviewers.

## Questions for the author

- *tamagawa-torus-ono* (4.1a): are ClassFieldTheory layers 5 and 10 needed as well as 0 and 11? The route cites Oesterlé IV 2.7, where the map `Λ_T` is defined through the local invariants `H²(F_v, G_m) → ℚ/ℤ` and their sum (oesterle lines 1643–1649), which this README elsewhere attributes to layers 5 and 10. What stopped me: I could not tell whether layer 11 is meant to carry the invariant maps for this purpose. (Carried from the previous review; the passage is unchanged.)

## Previous findings

- none: the previous report raised no finding. Its one small correction stands as follows.
- C01 (README 1.5 cited [Borel] §5.5 for unimodularity of groups with a rational character) — repaired: both targets now read "([Oesterlé], Chapter I, … Proposition 5.3 and Corollary 5.4, p. 23)"; the local one cites the proof of 5.3, where the local modulus is stated.

## Verified sound

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| 1.5 *Local unimodularity of reductive groups* (locator changed) | `GL₂(E)`; split torus; control: Borel `B ⊂ GL₂` | Oesterlé: modulus of `G(K_v)` is `‖det Ad‖^{-1}`. `GL₂`: `Ad` is conjugation on `M₂`, `det = 1`. Torus: `Ad = 1`. `B`, `diag(a,d)`: `det Ad = a/d ≠ 1` | true; source gives it (oesterle lines 472–477); `GL₂` has the character `det` and is covered |
| 1.5 *Adelic groups of reductive groups are unimodular* (locator changed) | `GL₂(𝔸_F)`; `G(𝔸_{F,f})`, `G(F_∞)` as partial products; control `B(𝔸_F)` | 5.3: modulus `g ↦ ‖(det Ad)_𝔸(g)‖^{-1}`; reductive: `det Ad = 1`, modulus `1` on every factor, so on each partial product. `B`: `‖a/d‖ ≠ 1` on ideles | true; Corollary 5.4 states the reductive case (oesterle lines 470–477) |
| Consumers of 1.5 (cite the changed targets) | 2.3 split-centre remark; 2.6; Scope paragraph; OrbitMeasuresOnAdelicGroups, ShimuraVarieties | each cites AA.1.5 for the statement, none for the locator; statement text unchanged | no citation affected |

The rows for the untouched statements stand as in the previous review, of `6ff5aef`.

- Source locators read at the text: 1 (Oesterlé, Chapter I, 5.3 and 5.4, printed p. 23; oesterle lines 454–477; the standing notion of algebraic group, a smooth affine group scheme, at oesterle line 151). The reference entry for Oesterlé is in the README's References.
- Seeded sample: none of the sampled sections (0.1, 0.2, 1.2, 2.2, 2.4, 2.5, 3.2, 3.3, 3.5, 3.7, 4.1a, 4.2, 4.6, 4.7, 5.3) falls in the changed passages; no locator is flagged unverified by the changed text.
- Library declarations of the changed passage: none added or changed (the `*Needs:*` lines keep `MeasureTheory.Measure.modularCharacter` and the supplier sections they had).
- Record: against the merge base no layer, heading or Lean declaration is removed; 6 headings added (1.5a, 2.6, 3.4a, 4.1a, 4.2a, 4.5a); `Suggested.lean` is identical to `main`'s.
- Title and description read against this head: the sentence naming this roadmap ("AdelicAlgebraicGroups (Tamagawa numbers of tori, strong approximation for any finite set of places, the mass)") matches 4.1a, 4.2a and 4.5a; the added text names no new supplier roadmap and does not mention the family or the formal proof (0 occurrences in the added lines), as the description says; no section is removed or renumbered. No sentence about this folder is contradicted. The description is longer than the part quoted to this review; the part after the cut was not read.
- Dependency check: `depcheck: 122 roadmaps, 1391 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. Elaboration of `TauCetiRoadmap/AdelicAlgebraicGroups/Suggested.lean` exits 0 with 19 warnings, all ``declaration uses `sorry` ``. The diff changes no Lean declaration, so the one-tactic probe and the signature comparison had nothing new to test.

Overlap check: read OrbitMeasuresOnAdelicGroups, ReductiveGroupsPartII, ArithmeticLocallySymmetricSpaces (main) as in the previous review; the change adds no object; nothing shared beyond what that review recorded (class-set integration and the mass: owner AA 4.5a).

Source independence: changed passages only: 2 passages compared with 1 source (Oesterlé), none shared (the roadmap's sentences are statements of a dozen words with a locator); largest share in the changed passages Oesterlé, 2 of 2 locators; no layer is added, removed or reordered, so the arrangement was not compared.

Research link: 2.6, 3.4a and 4.1a are the Tamagawa measure and number of Weil (1961), Ono (1963) and Oesterlé (1984); 4.2a is the Kneser–Platonov strong approximation theorem as in Rapinchuk (2014); 4.5a is the mass of Gross (1999). Rests on the README's citations and on Oesterlé and Rapinchuk as read.

## Not verifiable

- none in the changed passages. (Bourbaki, LIE III, p. 160, which Oesterlé's proof of 5.3 cites for the local modulus, was not opened; the README cites Oesterlé, not Bourbaki.)

## Source issues

- none

## For the human reviewers

- none
