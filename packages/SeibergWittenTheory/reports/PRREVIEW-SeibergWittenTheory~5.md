# Review of SeibergWittenTheory (pull request #2651 at a831557)

**Verdict:** accepted

**Summary.** Accepted, with no findings. This is an incremental re-review of the 33 lines added since e8d937f: one table in `Scope and ownership` that maps 28 labels of the former numbering to their sections. Every row was checked against the old README on main and the headings at this head, and all 28 are right; no statement, locator or supplier changed. Two small corrections (the table is five cited labels short; the description does not mention it) and three format notes carried from the previous review remain, none blocking. Nothing is left for a human to decide.

## C01 — The table of former labels omits five labels that TaubesGromov's open revision cites

The table is introduced by "Other roadmaps cite sections of this roadmap by the labels of its former numbering:" (line 1528), so a reader takes it as the list of cited labels and looks up a label there. The open revision of TaubesGromov cites SW5.2 (its README line 759, "SW5.2 (weak maximum and …"), SW7.3 (line 2671), and SW6.3, SW8.2 and SW11.3 as the ends of ranges (lines 1979, 2221, 727); none of the five has a row. Nothing breaks, because the sentence in `How to read the build` (lines 68–69) maps every SWk.n to §k.n; the labels cited on main (SW1, SW4, SW4.5, SW5.4, SW7.1, SW7.2, SW8.3, SW11) all have rows.

Adding the rows SW5.2 → §5.2, SW6.3 → §6.3, SW7.3 → §7.3, SW8.2 → §8.2 and SW11.3 → §11.3 would complete it; or the lead sentence would say that the rule of `How to read the build` covers every label and the table lists the ones most cited.

## C02 — The description places the map of the old numbering in `How to read the build` only

The description says "`How to read the build` states this map for the roadmaps that cite the old numbering." That is still true, but at this head `Scope and ownership` also carries it, as a table of 28 labels. The sentence would end: "…, and `Scope and ownership` lists the cited labels one by one in a table."

## N01 — §10.1 still writes `η′_s` for a derivative where §6.2 writes η′ for the real form of η

In the Check of §6.2 (line 843) "η = iη′" makes η′ a real two-form; in §10.1 (line 1262) "`η′_s = −iω_g`" is the s-derivative of η_s. `∂_s η_s = −iω_g` would remove the clash.

## N02 — §10.3 names "a positive chamber of Baldridge" (line 1338), a work the References do not list

Citing it, or dropping the clause, would do.

## N03 — §1.3 uses the Levi-Civita connection (line 202) without naming Mathlib's `CovariantDerivative.leviCivitaConnection`

Its *Needs:* line would name it, as SpinGeometry §6.1 does.

## Previous findings

The previous report, of e8d937f, had no findings; it carried one small correction and three format notes. Each at this head:

- Previous C01 — repaired: the description now reads "The sections without a published locator are §§1.1 and 2.1–2.3 (pointwise algebra cited by Tau Ceti declaration) and §§3.1, 3.3a, 4.4, 4.5, 5.3, 9.2, 11.3".
- Previous N01, N02, N03 — not repaired: unchanged at lines 1262, 1338 and 202; they are N01–N03 above.

The change introduced no new problem beyond C01 and C02.

## Verified sound

| Target | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Table of former labels (lines 1528–1559), all 28 rows | each label against the old README on main and the headings at this head | 11 layer rows: old `## SWk.` titles = `## Layer k` titles, k = 1…11; 17 section rows: old `SWk.n —` topics = `### k.n` topics, including 3.3a | all 28 correct | none |
| Table against the rule of lines 68–69 | SW3.3a, SW4.5, SW11 | rule: SWk.n ↦ §k.n, SW3.3a ↦ §3.3a, SWk ↦ Layer k; table: §3.3a, §4.5, Layer 11 | the two agree | none |
| Table against the labels other roadmaps cite | main: FourManifolds, YangMillsConnectionsAndCaloricGauge, TaubesGromov; open heads: TaubesGromov, DGFloer | main cites 8 labels, 8 have rows; main and open heads together cite 32 labels, 27 have rows; missing SW5.2, SW6.3, SW7.3, SW8.2, SW11.3 | incomplete, covered by the rule | C01 |
| §11.2 twists and dimension (cited by the row SW11.2) | ℂP², e = h, κ = −3h, χ = 3, σ = 1 | l = 5h, d = (25 − 6 − 3)/4 = 4; e² − κe = 1 + 3 = 4; δ = (25 − 1)/8 = 3 = 4/2 + (9 + 3)/12 | agrees | none |

The rows of the previous review, of e8d937f, stand for every statement the change does not touch: the diff changes no statement.

- Source locators checked against the text this round: none; the change adds, alters and removes no locator, and the seeded sample (§§1.1, 1.2, 2.1, 3.3, 4.3, 5.1, 7.1, 7.2, 8.2, 9.3, 9.4, 10.1, 10.2, 11.1, 11.3) falls in unchanged text, where the table only points at §§1.2, 7.1, 7.2 and 11.1 by number.
- Library declarations opened at the pin: none needed; the change names none.
- Cross-roadmap citations resolved: the change adds none. Citations of this roadmap's old labels were searched on main and at the open heads: 3 roadmaps on main and the open heads of TaubesGromov and DGFloer use them.
- Old numbering: every one of the 42 old subsection labels SW1.1–SW11.3 and SW3.3a on main has a section of the same number and topic at this head.
- Dependency check: `depcheck: 182 roadmaps, 2075 edges, 0 problem(s)`; no UPWARD or CYCLE line. The change adds or drops no supplier.
- Automatic checks: all pass at this head. Elaboration: `lake env lean` on `TauCetiRoadmap/SeibergWittenTheory/Suggested.lean` exits 0 with no message; the file is unchanged and declares nothing, so there is no `#check @name` comparison and no one-tactic probe to run. Nothing outside the folder changed.
- Description against the head: the sentence on sections without a published locator now agrees with the head; the numbering paragraph is true and leaves the new table unstated (C02).

Overlap check: read SpinGeometry, IndexTheory, FourManifolds, TaubesGromov, SpectralManifolds, InstantonFloerTheory (as the previous review; the change touches no ownership statement). Owners as recorded there: generic Dirac operators, SpinGeometry §6.1; the Euler non-zero-divisor property, IndexTheory §6.3; Spinᶜ(n) and its lifts, FourManifolds §4.1; the homomorphism U(2) → Spinᶜ(4), this roadmap §11.1. Nothing else shared.

Source independence: changed passages only; 1 passage (the table and its lead sentence) compared with 0 sources, since it cites and paraphrases none; largest share OkonekTeleman1996, as in the previous review; the change adds, removes and reorders no layer, so the contents were not compared again (previous result: independent).

Research link: Layers 8–10 are the full Seiberg–Witten form and the universal wall-crossing formula of Okonek–Teleman (1996, Definition 6, Theorem 16), after Witten (1994); §5.1 is Booß-Bavnbek–Marcolli–Wang (2002, Theorem 2.7); TaubesGromov builds Taubes's SW = Gr on these invariants. Rests on the README and the three texts read.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- none
