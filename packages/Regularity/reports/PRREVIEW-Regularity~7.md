# Review of Regularity (pull request #2631 at 55e57c2)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired, and the repair is correct. The example of Layer 7 now says that pair regularity of a small cell with itself fails when some color has density greater than `ε` there, which recomputes on two- and three-vertex cells; the antitone sentence of §9.2 carries its sign condition, the description now states what happens to `Suggested.lean`, and the new theorem numbers for Zhao and Tao are at their locators. There are no small corrections and two format notes, neither blocking; one licence fact remains for the human reviewers.

## N01 — The page given for Tao's Theorem 2.11 is that of the arXiv version

In the References, the entry for Tao gives the journal reference, then the arXiv link, then "Theorem 2.11 (p. 8)". Page 8 is where the theorem stands in arXiv:math/0504472v2 (Tao2006 line 349, on the page that begins at line 315). Writing "p. 8 of the arXiv version" would stop a reader from looking for it on page 8 of the journal volume.

## N02 — The Zhao entry is headed "ch. 2" and then cites a theorem of chapter 4

In the References, the entry for Zhao reads "ch. 2: graph regularity, counting, and the strong-regularity exposition", and then cites Theorem 4.6.3, which is in §4.6. "ch. 2 and §4.6" would match what follows.

## Previous findings

- R01 — repaired: "pair regularity on `(A, A)` fails as soon as some color has density greater than `ε` on `(A, A)`, for instance when there is a single pair color" (Layer 7 Examples, second bullet). Recomputed below; the repair introduces no new problem.
- The small corrections and the format note of the previous report: C01 (description and `Suggested.lean`) is repaired, the description now says that the file states the two headline theorems with the definition of §8.1 and that the other 163 declarations are removed; C02 is repaired, "For `ε ≥ 0` the schedule is antitone in `n`" (§9.2); N01 is repaired, §3.2 cites Zhao, Theorem 4.6.3, and §4.2 cites Tao, Theorem 2.11, and Zhao, Theorem 2.8.3 and Remark 2.8.6.

## Verified sound

| Statement | Instances tried | Values computed (roadmap / library or source) | Result | Change |
|---|---|---|---|---|
| Layer 7, second example (changed) | `|A| = 2`, `ε = 1/2`, one color; same cell, two colors swapped by reversal; `|A| = 3`, `ε = 1/3`, two colors | one color: `d(A, A) = 2/2 = 1`, `d({u}, {u}) = 0/0 = 0`, deviation 1 > 1/2, fails; swapped: 1/2, 1/2, not > `ε`, regular; `|A| = 3`: deviation 1/2 > 1/3, fails | holds | none |
| Size thresholds in that example | `ε|A| ≤ 1`, box `{u} × {u}` | library test: `ε · #s ≤ #s'`, here `ε|A| ≤ 1 = |{u}|`; conclusion `≤ ε`, so failure needs deviation `> ε` | matches | none |
| §9.2 antitone sentence (changed) | `k = 3`, `ε = 1/10`; `ε = 0`; `ε = −1`, `k = 2` | `1/3240` at `n = 1`, `1/25920` at `n = 2`; constant 0; `−1/96` then `−1/192` (excluded by `ε ≥ 0`); library lemma assumes `0 ≤ ε` | holds | none |
| §3.2 against Zhao, Theorem 4.6.3 (sampled) | `ε = 1/2`; `ε = 2/3`; `ε ≥ 1` | source: `0 < ε < 1`, at most `4^(1/ε²)` parts; 256 both; 4^(9/4) ≈ 22.6 against 64; `ε ≥ 1`: one part, deviation ≤ `|A||B| ≤ |V|²` | supported; the README bound is the weaker | none |
| §4.2 against Zhao, Theorem 2.8.3 and Remark 2.8.6 (sampled) | source statement | refining pair, coarse regular at `ε₀`, fine at `ε_{|P|}`, energy gap ≤ `ε₀`, bounded size; remark: nearly equal parts. README: positive `F` in place of the decreasing sequence | supported | none |
| §4.2 against Tao, Theorem 2.11 and §3 | source statement and proof | growth function `F`, coarse and fine closeness in `L²` by `ε`; outer loop gains `ε²` energy, at most `⌊1/ε²⌋` times; README: gap `ε`, `⌊1/ε⌋ + 1` rounds, energy in `[0, 1]` | supported, as "a probabilistic form" | none |
| Description against the change | `Suggested.lean` | description: two headline theorems and one definition kept, 163 removed; change: 163 removed, 3 restated | agrees | none |

The rows for the untouched statements stand as in the previous review, of `ed0a541`.

- Source locators checked against the text: 5. Zhao2023 lines 3248–3254 (Theorem 2.8.3), 3284–3285 (Remark 2.8.6), 5843–5844 (Theorem 4.6.3), line 17 (author's version, pagination differs); Tao2006 lines 349–365 (Theorem 2.11, page 8), 476 and 550–616 (§3, the double loop).
- Library declarations opened at the pinned Tau Ceti: `TauCeti/Combinatorics/Hypergraph/PairColor/Regular.lean` line 77 (`PairColorSystem.IsRegularPair`), `PairColor/Density.lean` line 36 (`pairColorDensity`, by distinct pairs, zero when there are none), `Triadic/CountingParameters.lean` line 125 (`inducedCountingSchedule3_antitone`, with `0 ≤ ε`).
- Cross-roadmap citations: the change adds none; none is unresolved at this head.
- Dependency check: `depcheck: 172 roadmaps, 2000 edges, 0 problem(s)`. The automatic checks all passed on this head. The pull request changes nothing outside the folder.
- Elaboration: `Suggested.lean` gives only the `sorry` warning on line 69; the file is unchanged since `ed0a541`, and its three elaborated types are as the previous review compared them.
- Headline theorems: the approximation theorem of §8.2 and its composition with counting of §9.4, both stated; unchanged.

Overlap check: read DenseGraphLimits (main and its open revision) and EquitableOperatorReduction (open); as in the previous review, the graph homomorphism and injective densities are owned by DenseGraphLimits and cited in §0.3, and the alignment at `r = 2` is this roadmap's by DenseGraphLimits Layer 9a; nothing else shared. The change adds no object.

Source independence: changed passages only; 5 passages compared with 2 sources (the citations of §3.2 and §4.2 and the three changed References entries against Zhao2023 lines 3248–3254, 3284–3285, 5843–5844 and Tao2006 lines 349–365, 550–616), none shared; largest share RodlSchacht2007Reg, 15 of 40 locators (the 31 counted in the previous review and the 9 this change adds, to Zhao2023, Tao2006 and FriezeKannan1999); the diff adds, removes and reorders no layer, so the contents were not compared again (independent in the previous review).

Research link: Layer 8 is the arity-3 regular approximation lemma of Rödl–Schacht (2007, Theorem 14 with Lemma 25), and Layer 9 the induced counting used with it (Rödl–Schacht 2007; Nagle–Rödl–Schacht 2006), the inputs to hypergraph removal. Rests on README §8.2 and §9.4 and on RodlSchacht2007Reg §1.

## Not verifiable

- Frieze–Kannan (Combinatorica 19, 175–220): paywalled and cited by its locator alone; the statement of §3.2 was compared with Zhao, Theorem 4.6.3, instead.
- The printed numbering of Zhao's book: the README says its numbers are those of the author's version, which is the text read.
- The page of Theorem 2.11 in the journal version of Tao's paper: only the arXiv version was read (N01).
- The Provenance table's descriptions of declarations in the external `regularity-lemmata` library: its files were not opened.

## Source issues

- none

## For the human reviewers

- Licence: the Provenance section of the README cites the public Lean libraries `cameronfreer/regularity-lemmata`, at two pinned commits, and `cameronfreer/graphon` as source references. Their files and licences were not opened in this review.
