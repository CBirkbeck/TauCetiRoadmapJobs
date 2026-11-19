# Review of LinearAlgebraMethodInCombinatorics (pull request #2560 at 2f2779c)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every stated theorem, Check and proof route was recomputed on degenerate instances and read against its source at the cited locator, and all twelve headline theorems are stated in `Suggested.lean` at the README's generality. There is one small correction (a one-member case that the route of 1.3 skips) and one format note, neither blocking. Three slips in the cited sources, which the README already works around, are recorded for the errata register; two facts about the sources are left for the human reviewers.

## C01 — The second case of the route of 1.3 does not cover a family with a single member smaller than `t`

In the route of 1.3 (README line 132), "Otherwise every member has more than `t` elements" is used to make the diagonal part of the Gram matrix positive. It holds as soon as the family has two members, since then `#A ≥ #(A ∩ B) = t` for every member; but `t` is a free parameter of the statement, and for the family `{{1}}` with `t = 5` no member has size `t` and the only member has fewer than `t` elements, so an implementer following the two cases finds a diagonal entry `1 − 5 < 0`. The theorem is unaffected (`1 ≤ n` because the member is nonempty). Starting the route with "A family with at most one member satisfies the bound, since a nonempty member forces `n ≥ 1`; assume two members, so that every member has at least `t` elements" would close it.

## N01 — The attribution of the bound `C(n + 2, 2)` to Blokhuis is on the page after the cited Remark

In 3.1 (line 289) the Remark of Miniature 15 on p. 51 gives the improved bound without a name; Blokhuis is named in the Sources paragraph on p. 52. Citing "Remark, p. 51, and Sources, p. 52" would let a reader find both.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 Oddtown mod `p` | `n = 0`; singletons; `p = 2`, `n = 6` unions of pairs | `n = 0`: family empty, `0 ≤ 0`. Singletons: `n` members. Pairs: 8 > 6, even sizes excluded | true; source: Matousek33 line 339 (p. 7), SudakovVieira lines 30–41 | none |
| 1.2 Eventown | `n = 0, 1, 2`; pairs construction | `n = 0, 1`: 1 ≤ 2⁰. `n = 2`: `∅, {1}, {2}` gives 3 > 2, odd sizes excluded. `2^r` attained | true; SudakovVieira lines 24–25 (p. 1) | none |
| 1.3 Fisher, nonuniform | `t = 0`; Fano; `{1},{1,j}`; `∅` + singletons; one member with `#A < t` | `t = 0`: ≤ `n`; Fano 7 = 7; `n` members; `n + 1` with `∅`; `{{1}}`, `t = 5`: bound holds, route case fails | statement true; Matousek33 lines 373–382 (p. 9) | C01 |
| 2.1 Nonuniform Frankl–Wilson | `L = ∅`; `s ≥ n`; all sets of size ≤ `s` | `L = ∅`: ≤ 1 = `C(n,0)`. `s ≥ n`: bound `2ⁿ`. Sets ≤ `s`: intersections ≤ `s − 1`, equality | true; ABS line 105 (p. 2), route ABS lines 289–326 | none |
| 2.2 Alon–Babai–Suzuki | `r = 0`; `r > s + 1`; `K = {0..n}`; `n = 4`, `K = {2}`, `L = {0,1,5,6}` | `r = 0`: sum 0, `F = ∅`. `r > s+1`: full sum. Six 2-sets > `C(4,4)=1`, excluded as `2 ≤ 3` | true; ABS line 133 (p. 2); `#L < k + #K` equals `k > s − r` | none |
| 2.2 Ray-Chaudhuri–Wilson case and note | Theorem 1.1 as printed | ABS line 77 lacks `s ≤ k`; proof at line 368 needs `k ≥ s` for Lemma 2.1 | README note correct | none |
| 2.3 Modular Frankl–Wilson | `p = 2`, `L = {0}`; `p = 5`, `L = {0,2,3}`, `n = 3`; `L` all residues | bound `n + 1`; three singletons: 3 ≤ 8, 3 > `C(3,3) = 1`; all residues: `F = ∅` | true; ABS line 427 (p. 8) with all `Lᵢ = L`; note on Theorem 1.2 (ABS line 90) correct | none |
| 2.4 Forbidden intersection | `p = 2`, `n = 4`; `p = 3`, `n = 7` | 3-sets meet in 2, 4 ≤ 5; 5-sets meet in ≥ 3, 21 ≤ 29; `2p−1 ≡ p−1 ∉ L` | true; Matousek33 line 1743 (p. 56); `range p` is `0..p−1` | none |
| 3.1 Blokhuis | `n = 0, 1, 2, 3`; `a = b`; count of spanning functions | 1 ≤ 1; 3 = `C(3,2)`; 5 ≤ 6; 6 ≤ 10; spanning set has `(n+1)(n+4)/2` functions, minus `n + 1` gives `C(n+2,2)` | true; Matousek33 lines 1503, 1603 (pp. 50–51) | N01 |
| 4.1 `IsBicliqueDecomposition` | stars; `n = 4` double cover; `m = 0` | stars: edge `{i,j}`, `i<j`, only in biclique `i`; double cover: edges 03 and 12 twice; `m = 0` forces `#V ≤ 1` | definition excludes "at least one" | none |
| 4.2 Graham–Pollak | `n = 0, 1, 3` | `0 ≤ m + 1`; `n = 1`, `m = 0` equality; triangle needs 2 = `n − 1`; `xᵀ(J − I)x = −∑xᵢ²` | true; Matousek33 line 840 (p. 24) | none |
| 5.1 Bollobás | `m = 0`; `m = 1`, `A = B = ∅`; splittings; skew pair `({x},∅),(∅,{x})` | 0 ≤ 1; `1/C(0,0) = 1`; splittings sum to 1; skew pair sums to 2; `choose` never 0 | true; ONeillVerstraete line 28 (v1 p. 1) | none |
| 5.2 Skew set pairs | `k = 0`; `k = l = 1`; padding | `k = 0`: `m ≤ 1 = C(l,0)`; `({1},{2}),({2},{1})`: 2 = `C(2,1)`; padding keeps both conditions | true; Matousek33 line 5247 (p. 169), exact sizes there | none |
| 6.1 `IsSunflower` | three disjoint sets; `{1,2},{1,3},{2,3}`; ≤ 1 member | kernel `∅`; intersections `{1},{2},{3}` differ, not a sunflower; vacuous for one member | excludes "equal intersection sizes" | none |
| 6.2 Sunflower lemma | `p = 0, 1, 2`; `k = 0`; `k = 1`, `p = 3`; `∅ ∈ F` in the route | `p=0`: `S=∅`; `p=1`: one set; `p=2`: `#F≥2`; `k=0`: vacuous; two singletons: `2=1!·2`; route: `k!(p−1)^k > k!(p−2)(p−1)^(k−1)` | true with strict inequality; ALWZ line 45 (p. 2) prints `≥` | none |
| Summary and conventions | `Ico (s + 1 − r) (s + 1)` with `r > s + 1`; `C(n,i)` for `i > n` | truncated subtraction gives lower end 0; `choose` gives 0 | agree with layers | none |

- Source locators checked against the text: 22 of 22 (Matousek33 8, ABS 10, SudakovVieira 2, ONeillVerstraete 1, ALWZ 1); printed pages agree with the README in every case.
- Library declarations opened at the pin: 29, among them `Set.IsIntersectingOf` (`Mathlib/Combinatorics/SetFamily/Intersecting.lean:214`, pairwise over distinct members), `Matrix.rank_diagonal` (`Mathlib/LinearAlgebra/Matrix/Rank.lean:423`), `Matrix.PosDef.isUnit` (`Mathlib/LinearAlgebra/Matrix/PosDef.lean:587`), `exteriorPower.finrank_eq` (`Mathlib/LinearAlgebra/ExteriorPower/Basis.lean:174`), `Finset.exists_lt_card_fiber_of_mul_lt_card_of_maps_to` (`Mathlib/Combinatorics/Pigeonhole.lean:234`), `Configuration.HasPoints.card_le` (`Mathlib/Combinatorics/Configuration.lean:239`); all exist in the files the README names.
- Duplication by object: no declaration on sunflowers, biclique decompositions, oddtown, eventown, Frankl–Wilson, two-distance sets or set pairs in the pinned Mathlib or Tau Ceti; none in any roadmap on main or at an open head.
- Cross-roadmap citations: none made, none needed. Dependency check output: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`.
- Elaboration: `Suggested.lean` elaborates with 12 `sorry` warnings and nothing else; `#check @name` on all 14 declarations shows every binder of the README statement present, nothing changed.
- One-tactic probe (`simp`, `rfl`, `simp_all`, `omega`) on a copy: closes none of the 12 theorems; no padding.
- Headline theorems (oddtown, eventown, Fisher, nonuniform and modular Frankl–Wilson, Alon–Babai–Suzuki, forbidden intersection, Blokhuis, Graham–Pollak, Bollobás, skew set pairs, sunflower lemma): all 12 stated; the two definitions have real bodies.
- Pull request text against the head: title, declaration counts (12 theorems, 2 definitions), suppliers, source versions and the three source adjustments all agree with the head.

Overlap check: the three closest-roadmap lists name no roadmap, so there was no scope to read; a search by object over every roadmap on main and at the open heads found no other owner; nothing shared.

Source independence: 16 passages compared with 5 sources, none shared beyond statements the mathematics forces; largest share ABS, 10 of 22 locators; contents compared with ABS (§§1–5) and with the order of Matoušek's miniatures: independent (only 2.1–2.3 draw on ABS §§2–3; the miniatures 3, 4, 17, 15, 8, 33 are used out of their order across five layers).

Research link: The layers state the intersection theorems of Alon, Babai and Suzuki (1991) and the Erdős–Rado lemma that Alweiss, Lovett, Wu and Zhang (2021) improve; Sudakov and Vieira (2016) and O'Neill and Verstraëte (2018) extend 1.1–1.2 and 5.1. Rests on the sources read (ABS §1, ALWZ §1, SudakovVieira §1, ONeillVerstraete §1).

## Not verifiable

- The journal version of Alon, Babai and Suzuki (J. Combin. Theory Ser. A 58) is behind a paywall; the README cites the authors' preprint by its own page numbers, and that is the text read.
- The original papers named in the last References bullet, and the monograph of Babai and Frankl, carry no locator and were not opened.

## Source issues

- **Error** in ABS at Theorem 1.1, preprint p. 1: the source says a `k`-uniform `L`-intersecting family with `|L| = s` has at most `C(n, s)` members; it should be assumed that `s ≤ k`; affects a stated result.
- **Error** in ABS at Theorem 1.2, preprint p. 2: the source says the uniform modular bound `C(n, s)` holds with only `k` outside `L` modulo `p`; it should carry a further hypothesis such as `n ≥ s + k` of its Theorem 1.5; affects a stated result.
- **Misprint** in ALWZ at Lemma 1.2, p. 2: the source says a family of at least `w!(r − 1)^w` sets contains an `r`-sunflower; it should be more than that many; affects a stated result.

## For the human reviewers

- **Not tested.** ABS, the source with the largest share of locators, was read in the preprint on an author's page; the journal version was not compared, so whether the two errors above persist in print is unknown.
- **Scope.** Seven of the twelve theorems are cited through Matoušek's expository *Thirty-three Miniatures* (author's preliminary version, publisher's permission printed on each page); the original papers are attributed without locators (README References, last bullet).
