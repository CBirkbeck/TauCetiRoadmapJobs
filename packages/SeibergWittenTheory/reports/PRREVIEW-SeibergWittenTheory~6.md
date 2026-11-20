# Review of SeibergWittenTheory (pull request #2651 at 8312f64)

**Verdict:** accepted

**Summary.** Accepted, with no findings. This is an incremental re-review of the 5 lines added since a831557: five rows (SW5.2, SW6.3, SW7.3, SW8.2, SW11.3) in the table of former labels in `Scope and ownership`, which complete it; every label that another roadmap cites, on main or at an open head, now has a row, and each new row points at the section of the same number and topic. The description was read sentence by sentence against this head and agrees with it. No small correction; three format notes carried from the previous review remain, none blocking. Nothing is left for a human to decide.

## N01 — §10.1 still writes `η′_s` for a derivative where §6.2 writes η′ for the real form of η

In the Check of §6.2 "η = iη′" makes η′ a real two-form; in §10.1 (line 1262) "`η′_s = −iω_g`" is the s-derivative of η_s. `∂_s η_s = −iω_g` would remove the clash.

## N02 — §10.3 names "a positive chamber of Baldridge" (line 1338), a work the References do not list

Citing it, or dropping the clause, would do.

## N03 — §1.3 uses the Levi-Civita connection (line 202) without naming Mathlib's `CovariantDerivative.leviCivitaConnection`

Its *Needs:* line would name it, as SpinGeometry §6.1 does.

## Previous findings

The previous report, of a831557, had no findings; it carried two small corrections and three format notes. Each at this head:

- Previous C01 — repaired: the table (lines 1530–1564) now has the rows "SW5.2 | §5.2", "SW6.3 | §6.3", "SW7.3 | §7.3", "SW8.2 | §8.2", "SW11.3 | §11.3"; all 31 labels TaubesGromov's open revision cites have rows.
- Previous C02 — repaired: the description now reads "`How to read the build` states this map, and a table in `Scope and ownership` lists each label other roadmaps cite."
- Previous N01, N02, N03 — not repaired: unchanged at lines 1262, 1338 and 202; they are N01–N03 above.

The change introduced no new problem.

## Verified sound

| Target | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Five new table rows | each label against the old README on main and the headings at this head | old SW5.2 weak maximum and energy bounds, SW6.3 Sard–Smale, SW7.3 determinant and slant, SW8.2 full H₁ insertions, SW11.3 symplectic interface = `### 5.2, 6.3, 7.3, 8.2, 11.3` topics | all 5 correct | none |
| Table against the labels other roadmaps cite | main: FourManifolds, YangMillsConnectionsAndCaloricGauge, TaubesGromov; open heads: TaubesGromov, DGFloer; ranges expanded | main cites 8 labels, 8 have rows; TaubesGromov's open head cites 31, 31 have rows; DGFloer's SW3.3a has a row; table has 33 rows | complete | none |
| Table against the rule of `How to read the build` (lines 68–69) | the five new labels | rule: SWk.n ↦ §k.n; table: §5.2, §6.3, §7.3, §8.2, §11.3 | agree | none |
| §5.2 maximum bound (row SW5.2) | maximum of f = \|ψ\|², η = 0 with Scal > 0, ℂP² with l = 3h | 0 ≥ Scal·f/4 + f²/4 − √2\|η\|f/2 gives f ≤ 2√2\|η\| − Scal; η = 0, Scal > 0: f = 0; 4π²·9 = 36π² | agrees with Witten1994 line 465 and lines 483–484 | none |
| §8.2 full insertions (row SW8.2) | degree count; r = d, r = 0, d odd | deg = r + 2m = r + (d − r) = d = dim M; source exponent (w_c − r)/2 with r ≡ w_c mod 2 | agrees with OkonekTeleman1996 lines 237–245 | none |
| §6.3 dimension and §7.3 classes ν (rows SW6.3, SW7.3) | locators opened | compact manifold of dimension (c² − 2e − 3σ)/4 at OkonekTeleman1996 lines 231–232 (p. 7, before Definition 6); ν in Lemma 5, line 210 (p. 6) | locators right | none |

The rows of the previous review, of a831557, stand for every statement the change does not touch: the diff changes no statement.

- Source locators checked against the text this round: 4 (Witten1994 eq. (3.1) for §5.2; OkonekTeleman1996 Lemma 5, the paragraph before Definition 6, and Definition 6 for §§7.3, 6.3, 8.2), the sections the new rows point at; the rest of the seeded sample falls in unchanged text.
- Library declarations opened at the pin: 14 named in the description, all present (for example `TauCeti.isMeagre_image_criticalPoints_of_isFredholm` at `TauCeti/Analysis/Fredholm/SardSmale.lean:409`, `cupInsertionForm` at `TauCeti/AlgebraicTopology/Cohomology/InsertionForm.lean:74`, the six `quadraticEnd` theorems in `TauCeti/Analysis/PDE/SeibergWitten/QuadraticEnd.lean`, `DividedPowers` at `Mathlib/RingTheory/DividedPowers/Basic.lean:77`).
- Cross-roadmap citations resolved: the change adds none; citations of this roadmap's former labels were collected on main (3 roadmaps) and at the open heads of TaubesGromov and DGFloer.
- Description against the head: 59 Checks in 38 sections (counted); 11 numbered conventions; 11 layers, each with Examples and Dependencies; every one of the 42 sections has a *Needs:* line; the 11 sections listed as without a published locator are exactly those with none; the per-source list of locators matches the citations section by section; the 14 supplier roadmaps are the 14 `### From TauCetiRoadmap.…` subsections; the old Lean file's 7 declarations, `#check` and `#print axioms` lines and 3 Mathlib submodule imports are as described; the docstring's four headlines and the wall-crossing range are as described; nothing outside the two files changed.
- Dependency check: `depcheck: 182 roadmaps, 2075 edges, 0 problem(s)`; no UPWARD or CYCLE line. The change adds or drops no supplier.
- Automatic checks: all pass at this head. Elaboration: `lake env lean` on `TauCetiRoadmap/SeibergWittenTheory/Suggested.lean` exits 0 with no message; the file is unchanged and declares nothing, so there is no `#check @name` comparison and no one-tactic probe to run.

Overlap check: read SpinGeometry, IndexTheory, FourManifolds, TaubesGromov, SpectralManifolds, InstantonFloerTheory (as the previous reviews; the change touches no ownership statement). Owners as recorded there: generic Dirac operators, SpinGeometry §6.1; the Euler non-zero-divisor property, IndexTheory §6.3; Spinᶜ(n) and its lifts, FourManifolds §4.1; the homomorphism U(2) → Spinᶜ(4), this roadmap §11.1. Nothing else shared.

Source independence: changed passages only; 1 passage (the five table rows) compared with 0 sources, since it cites and paraphrases none; the 4 locators opened for the sections the rows point at share no wording with 2 sources; largest share OkonekTeleman1996, as in the previous review; the change adds, removes and reorders no layer, so the contents were not compared again (previous result: independent).

Research link: Layers 8–10 are the full Seiberg–Witten form and the universal wall-crossing formula of Okonek–Teleman (1996, Definition 6, Theorem 16), after Witten (1994); §5.1 is Booß-Bavnbek–Marcolli–Wang (2002, Theorem 2.7); TaubesGromov builds Taubes's SW = Gr on these invariants. Rests on the README and the three texts read.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- none
