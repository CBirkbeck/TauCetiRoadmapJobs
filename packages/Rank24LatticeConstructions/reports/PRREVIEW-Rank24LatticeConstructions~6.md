# Review of Rank24LatticeConstructions (pull request #2632 at d1269aa)

**Verdict:** accepted

**Summary.** Accepted, with no findings. The folder is unchanged since the previous review of this head; this round read the pull request's description against the head and the README on main, and every sentence of it agrees with what the change does, including the rewrite of `Suggested.lean` that the earlier description left out. There are no small corrections and two format notes carried over, neither blocking. The human reviewers decide on the reuse of the Conway–Sloane generator column and on *SPLAG*, which could not be read.

## N01 — The last sentence of §2.1 uses `|H|` for two different numbers

"With `|H|² = |A_R|` it gives `|H_r|² = |A_R|`" (README line 321) reads as a tautology until one sees that the first `|H|` is the displayed table entry. "With (displayed order)² = `|A_R|`" would say it.

## N02 — §3.3 and §3.4 carry no locator

Both are facts about the table; a pointer to Conway–Sloane 1982, Table V, for the 23 component lists would do for §3.4.

## Previous findings

The previous review, of this same head, had no findings (no R-numbered remark). Its other remarks:

- C01 — repaired: the description now says "`Suggested.lean` is rewritten as the roadmap's acceptance test", names the 150 declarations removed, the three imports and the eight theorems; all agree with the head.
- N01 — not repaired: README line 321 still reads "With `|H|² = |A_R|` it gives `|H_r|² = |A_R|`"; carried as N01 above.
- N02 — not repaired: §3.3 and §3.4 still carry no locator; carried as N02 above.

## Verified sound

| statement | instances tried | values computed (description or README / independent) | result |
| --- | --- | --- | --- |
| §5.3 item 2, as the description restates it (`A₅⁴ D₄`) | `H` enumerated in `(ℤ/6)⁴ × (ℤ/2)²`; `ρ`; `ρ` with `τ: 1↦2↦3↦1`; `ρ` with `τ⁻¹` | order 72; `[30301] ∉ H`, `[00003] ∉ H` (norm 1); `ρ` alone fails, `ρ` with `τ` preserves `H`, `ρ` with `τ⁻¹` fails; least `μ` on `H∖0` is 4, all `μ` even | holds |
| §6.1, as the description restates it (`K^∨/K`) | classes of `2e_∞`, `s`, their sum under `(∑xᵢyᵢ)/2` | `B(2e_∞,2e_∞) = 2`, `B(s,s) = (9/4 + 23/4)/2 = 4`, `B(2e_∞,s) = −3/2`; sum `(1/2,…,1/2)` has norm 3, value `1/2`; two isotropic order-2 subgroups | holds |
| Description: the ten remaining targets | sections of the README with no *In Tau Ceti:* line | §2.1, §2.2, §2.3, §3.1, §3.2, §3.3, §4.3, §5.3, §5.4, §6.1: ten, the ten the description lists; eight are in `Suggested.lean`, §3.3, §4.3, §5.3, §5.4 are not | agrees |
| Description: `Suggested.lean` | head file and the file at the merge base | head: `import Mathlib` and two `TauCeti.*` modules, 8 theorems, no definition; merge base: 153 declaration keywords (71 `def`, 16 `abbrev`, 6 `instance`, 55 `theorem`, 5 types), imports of the two completed roadmaps' `Suggested` modules, 69 `sorry` | agrees |

The rows for the statements of the folder stand as in the previous review, of `d1269aa`: no line of the folder changed.

- Description against the head, sentence by sentence: the opening paragraph (overview and scope section, README lines 3–26 and 990–1000); the list of sections per layer (29 numbered sections, all present under those numbers); the kept layers (6 of 6, one retitled only by a dash); the added Checks (ten named, each found: lines 155, 209, 239, 365, 410, 495, 516, 519, 760–767, 876–886); the four changed statements (main's "cyclic shifts and the even permutations occurring in the table" at its line 300, "identify its dual quotient" at 331, the record name `niemeierGlueTable` at 161). None contradicted.
- Changes the description must state: it says the pull request revises a roadmap on main and keeps its six layers; that `Suggested.lean` is replaced and 150 declarations removed; the suppliers are unchanged (Mathlib, Tau Ceti, IntegralLattices and AlgebraicCodingTheory, both now completed on main). The four headings of main that the head lacks (standing conventions, library material, ordering and completion criterion, the two unnumbered Layer 6 headings) have their content in Conventions, the supplier contracts, the overview and scope section, and §6.1–§6.4.
- Library declarations checked at the pin: the two imported modules exist; none of the eight theorem names of `Suggested.lean` is declared in the pinned Tau Ceti (searched by name; only row-by-row forms).
- Cross-roadmap citations resolved on main: 7 (the two completed foundations, RootSystems, CFSGBasicProperties, LatticePackingsAndPerfectForms, IntegralLattices 6E at its README lines 109 and 145, ThetaSeries Layer 8 at its line 942).
- Dependency check: `depcheck: 133 roadmaps, 1474 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: eight `sorry` warnings and nothing else.
- Source sample: no passage changed, so no locator was re-read; the nine locators of the previous review stand.

Overlap check: read IntegralLattices, LevelOneAutomorphicFormsForClassicalGroups, ThetaSeries, BoundsOnCodes, SphericalCodesAndKissingNumbers, AlgebraicCodingTheory, OrthogonalTamagawaAndLatticeMass; nothing shared. The 23 row lattices and the Leech lattice are owned here; IntegralLattices 6E owns their separation by root systems and says at its head that it does not construct them. No open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only: 0 passages changed, so none compared in this round (the previous review compared 9 passages with 2 sources, none shared); largest share *SPLAG*, 30 of 47 locator sites, text and contents not readable; no layer added, removed or reordered, so the arrangement was not compared again.

Research link: the 23 glued lattices and the Leech lattice are Niemeier's 1973 list in the Conway–Sloane (1982) glue-code form; Chenevier (2020, §5.3) takes exactly these Lagrangians as input for the characteristic masses of Niemeier lattices. Rests on the README's References and on CS82 §4 and Che20 §5.3, both read.

## Not verifiable

- *SPLAG* (Conway–Sloane 1999), Chapters 4, 7, 10 and 16: paywalled, no legal open copy; its locators were checked by computation and against the pinned library in the previous review.
- Niemeier 1973 (§3.1), Wilson 2009 §5.4 (§6.3, §6.4) and Ebeling 2013 Chapters 1 and 3 (§1.3, §5.1, §5.3–§5.5): paywalled; cited by locator only.

## Source issues

- none

## For the human reviewers

- Reuse: the generator column of the Layer 2 table (README lines 273–295) carries the 23 generator entries of Conway–Sloane 1982 Table V (CS82 lines 357–379), in its notation and row order; main already has the table in this form.
- Not tested: *SPLAG*, the source with the largest share of locators (30 of 47 sites), could not be read legally; its wording and table of contents were not compared.
- Scope fact: the `Suggested.lean` docstring (lines 38–51) says its six Layer 2–3 statements follow from pinned row theorems by case analysis; the other targets not yet in Tau Ceti are §3.3, §4.3, §5.3, §5.4 and §6.1.
