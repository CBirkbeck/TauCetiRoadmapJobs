# Review of Rank24LatticeConstructions (pull request #2632 at d1269aa)

**Verdict:** accepted

**Summary.** Accepted, with no findings. Every row of the glue table was recomputed (orders, isotropy, shortest norms, root counts, pattern symmetries), as were the `K^∨/K` classes and the Leech congruence cases; all agree with the text. Every layer and item of the README on main is present under its id with its statement. There are one small correction (the description says `Suggested.lean` is unchanged, but the pull request replaces it) and two format notes, none blocking. The human reviewers decide on the reuse of the Conway–Sloane generator column and on *SPLAG*, which could not be read.

## C01 — The description says "`Suggested.lean` is unchanged", but the pull request replaces the file

A reader of the description would not learn that the Lean file on main is rewritten. Against the merge base, `TauCetiRoadmap/Rank24LatticeConstructions/Suggested.lean` loses about 150 declarations (among them `GlueTableRow`, `niemeierGlueTable` and the sorry'd `rootfulNiemeierTypeEquivFin`) and its imports of the two completed roadmaps' modules, and now holds eight theorems over `import Mathlib` and two Tau Ceti modules.

The sentence would be right as: "`Suggested.lean` is rewritten: the declarations that the pinned Tau Ceti now provides are no longer restated, and the file states the eight uniform theorems of §2.1–§2.3, §3.1, §3.2 and §6.1."

## N01 — The last sentence of §2.1 uses `|H|` for two different numbers

"With `|H|² = |A_R|` it gives `|H_r|² = |A_R|`" (README line 323) reads as a tautology until one sees that the first `|H|` is the displayed table entry. "With (displayed order)² = `|A_R|`" would say it. Carried over from the previous review.

## N02 — §3.3 and §3.4 carry no locator

Both are facts about the table; a pointer to Conway–Sloane 1982, Table V, for the 23 component lists would do for §3.4.

## Previous findings

The previous review, of `18f250a`, had no findings and no small corrections. Its one format note is N01 above: line 323 still reads "With `|H|² = |A_R|` it gives `|H_r|² = |A_R|`", so it is not repaired.

## Verified sound

| statement | instances tried | values computed (README / independent) | result |
| --- | --- | --- | --- |
| §1.1 root lattices | `A₁`; pinned definition of a lattice root | Gram `(2)`, roots `±α`, `2 = 1·2`; root coordinates are coroot coordinates (`RootLattice/Roots.lean:74`, `:156`), as the contracts say | holds |
| §1.2 glue alphabets | `D₇`, `D₈`, all 12 rows with a `D` component | `2s − v = (1⁶, 0)`, sum 6, in `D₇`; nine even-rank rows 1, 2, 5, 7, 9, 13, 14, 18, 19; three odd-rank rows | holds |
| §1.3 ordered lists | `A₁₁ D₇ E₆`, `A₅⁴ D₄` | orders `12·4·3 = 144 = 12²`, `6⁴·4 = 5184 = 72²` | holds |
| §1.4 coset minima | `A₂₄` label 5; `A₁`; `E₇` | `5·20/25 = 4`; vector norm `20/25 + 80/25 = 4`; `5ϖ₁` norm 24; `1/2`; `3/2` | holds |
| §1.5 patterns | `E₆⁴` `[1(012)]`, whole-word rotation | three words, sum zero, order 9; `[0121]`: `b = 1`, `a = 2`, third label 1 ≠ 2 | holds |
| §2.1 order (headline) | all 23 rows by enumeration | 2, 2, 1, 5, 4, 6, 4, 8, 8, 13, 12, 9, 20, 16, 27, 32, 49, 72, 64, 125, 256, 729, 4096: all as displayed | holds |
| §2.1 Checks | `D₁₂²` in `ℤ/4`; `D₆⁴` all 24 permutations | 16 elements (`det = −3`, a unit); order 64 containing `[1100]` of norm 3 | holds |
| §2.2 Lagrangian (headline) | all rows: `|H|² = |A_R|` and isotropy; `A₂₄` | squares equal in all 23 rows; `H^⊥ = {a : 25 ∣ 5a} = H`; `[1]` has norm `24/25` | holds |
| §2.3 bound (headline) | every nonzero word of every row | minimum of `μ` is 6 for `D₂₄` and exactly 4 in the 21 other nontrivial rows; `A₁₁ D₇ E₆`: 6 at `k ≡ 5, 7`, else 4 | holds |
| §2.4 isotropy | every word of every row | `μ(w)` an even integer for all words of all 23 subgroups | holds |
| §2.5 root counts | all 23 rows; `D₇` with `2n²` | sums equal the displayed counts and Conway–Sloane 1982 Table V; `132 + 98 + 72 = 302` | holds |
| §2.6 row `D₄⁶` | additive closure; `𝔽₄`-span; scalings `[ω, ω, 1, ω², ω², 1]` | order 32, `[222222]` absent; with `[222222]` order 64, equal to the `𝔽₄`-span, `ω`-closed; image has 64 words | holds |
| §3.1 unimodular (headline) | `A₂₄`; pinned criterion | `25/5² = 1`; `isUnimodular_lattice_iff` is "iff the order is the displayed one" (`Rank24/Niemeier.lean:169`) | holds |
| §3.2 roots (two headlines) | `D₈` with spinor glue; five root-count ties | `μ = 2`, 240 against 112 roots; 720, 432, 288, 240, 144 each shared by two rows | holds |
| §3.4 distinct root systems | (rank, roots) of every component type in the table | `n(n+1) = 2n(n−1)` only at `n = 3`; `E₆, E₇, E₈`: 72, 126, 240 against 42/60, 56/84, 72/112 | holds |
| §4.3 `A₂¹²` lattice | weights 0, 6, 9, 12; sign `−1`; pinned `p`, `ε` | `μ = 0, 4, 6, 8`; labels 1, 2 both `2/3`; `p`, `ε` as displayed (`Rank24/A2Twelfth.lean:112`, `:125`) | holds |
| §4.5 row `A₁₁ D₇ E₆` | `k·[111]`, `k = 1…11`; Klein reading | `μ = 4, 4, 4, 4, 6, 4, 6, 4, 4, 4, 4`; order 12; `[2 0 2]` gives 3 | holds |
| §5.3 pattern symmetries | block rotations in nine rows, even permutations in `D₆⁴`; `A₅⁴ D₄` with `ρ`, `τ` | all preserve `H`; `ρ` alone fails, `ρ` with `τ` holds, `ρ` with `τ⁻¹` fails, `ρ⁻¹` with `τ⁻¹` holds | holds |
| §5.4 Golay automorphisms | `u ≡ −1`; convention of `monomialEquiv` | `−1` swaps labels 1, 2 of equal norm; scale at source, then move; reindexing isometry at `ConstructionA/Naturality.lean:161` | holds |
| §5.5 hexacode automorphisms | scalar of the pinned isometry | `c(σa)⁻¹·u(a)·c(a)` at `Rank24/D4Six/CodeAutomorphism.lean:177–181`, as stated; `ω²` acts as `1 ↦ 2 ↦ 3 ↦ 1` | holds |
| §6.1 `K^∨/K` (two headlines) | classes of `2e_∞`, `s`, their sum | norms 2, 4, 3; `B(2e_∞, s) = −3/2`; `4e_∞`, `2s`, `𝟙 ∈ K`; isotropic order-2 subgroups: exactly two | holds |
| §6.2–§6.4 Leech lattice | `s`, `𝟙/2`, `(2,2,0,…)`, `(2,0,…)`; four cases | `B(s,s) = 4`; sums 20, 24, 8, 4 mod 8; least `∑aᵢ²`: 32 in each case; pinned model at `Rank24/Leech/Minimum.lean:98` | holds |

- Source locators checked against the text: 9 (Conway–Sloane 1982 §2 at CS82 lines 77–105, the cyclic-shift convention at 262–264, Table V generators at 357–379 and root counts at 398–420, §4 at 428–435; Chenevier 2020 §3.1 at Che20 lines 658–679, §5.1 (a), (c) at 1065–1092, Table 4 at 1106–1111, §5.3 at 1118–1126). All support the statements they are cited for.
- Library declarations opened at the pin: 24, among them `RootfulNiemeierType.isUnimodular_lattice_iff`, the `…_of_ne` and four identified-row theorems (`Rank24/Glue/EnumeratedRows.lean:205–221`, `Rank24/Glue/IdentifiedRows.lean:94–340`), `natCard_closure_d4SixPrintedDigits`, `d4SixHexacodeAutIsometry`, `leechShift`, `mem_leechLattice_carrier_iff_exists`, `DynkinType.glueMinimum_D_of_even`. All 192 names on the *In Tau Ceti:* lines and every name on a *Needs:* line exist at the pin; the 20 file pointers of the contracts exist.
- No uniform form of the eight `Suggested.lean` theorems exists at the pin (only row-by-row forms); none closes with `simp`, `rfl`, `decide` or `exact?`.
- Cross-roadmap citations resolved: 7 (the two completed foundations, RootSystems, CFSGBasicProperties, LatticePackingsAndPerfectForms, IntegralLattices 6E, ThetaSeries Layer 8). The one inbound link by anchor, to the Layer 6 heading, still resolves.
- README on main against the head: 6 layers, all kept with their subjects; every item of Layers 1–6 found with its statement (§1.1–§1.5, the table and §2.1–§2.6, §3.1–§3.4, §4.1–§4.5, §5.1–§5.5, §6.1–§6.4).
- Dependency check: `depcheck: 133 roadmaps, 1474 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: eight `sorry` warnings and nothing else; the eight elaborated types were compared with §2.1–§2.3, §3.1, §3.2 and §6.1 and agree, no binder lost.
- Pull-request description against the head: the list of sections per layer, the ten remaining targets, the added Checks and the four changed statements all agree with the head; one sentence does not (C01).

Overlap check: read IntegralLattices, LevelOneAutomorphicFormsForClassicalGroups, ThetaSeries, BoundsOnCodes, SphericalCodesAndKissingNumbers, AlgebraicCodingTheory, OrthogonalTamagawaAndLatticeMass; nothing shared. The 23 row lattices and the Leech lattice are owned here; the others consume them by Layer 3 and Layer 6 or through the Tau Ceti declarations, and IntegralLattices 6E owns their separation by root systems.

Source independence: 9 passages compared with 2 sources (Conway–Sloane 1982, Chenevier 2020), none shared; largest share *SPLAG*, 30 of 47 locator sites, text and contents not readable. By the README's own locators Layers 2–5 all rest on its Chapter 16 §1 and Layer 6 on Chapters 7 and 10, so the layers do not run in the book's chapter order.

Research link: the 23 glued lattices and the Leech lattice are Niemeier's 1973 list in the Conway–Sloane (1982) glue-code form; Chenevier (2020, §5.3) takes exactly these Lagrangians as input for the characteristic masses of Niemeier lattices. Rests on the README's References and on CS82 §4 and Che20 §5.3, both read.

## Not verifiable

- *SPLAG* (Conway–Sloane 1999), Chapters 4, 7, 10 and 16: paywalled, no legal open copy; the locators of the sampled §1.1, §1.2, §1.3, §1.5, §2.6, §3.1, §4.3, §4.5, §5.3, §5.4, §5.5 and §6.1 were checked by computation and against the pinned library instead.
- Niemeier 1973 (§3.1), Wilson 2009 §5.4 (§6.3, §6.4) and Ebeling 2013 Chapters 1 and 3 (§1.3, §5.1, §5.3–§5.5): paywalled; cited by locator only.

## Source issues

- none

## For the human reviewers

- Reuse: the generator column of the Layer 2 table (README lines 273–295) carries the 23 generator entries of Conway–Sloane 1982 Table V (CS82 lines 357–379), in its notation and row order; main already has the table in this form.
- Not tested: *SPLAG*, the source with the largest share of locators (30 of 47 sites), could not be read legally; its wording and table of contents were not compared.
- Scope fact: the `Suggested.lean` docstring (lines 38–51) says its six Layer 2–3 statements follow from pinned row theorems by case analysis; the other targets not yet in Tau Ceti are §3.3, §4.3, §5.3, §5.4 and §6.1.
