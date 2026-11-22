# Review of CompetitiveAnalysisOfPagingAndListUpdate (pull request #2996 at c64e4ff)

**Verdict:** accepted

**Summary.** Accepted: no finding. All eight theorems of `Suggested.lean` and every Check of the README were recomputed from the Lean definitions (list update on about 12 million small cases; paging, Belady, LRU, FIFO and the marking rule exhaustively on up to five pages in exact arithmetic), and every locator was read in the three sources; nothing false was found. There are two small corrections and one format note, none blocking. One question of scope is left to the human reviewers.

## C01 — The lower bound `OPT_h(σ) ≥ number of distinct pages` in 2.1 is stated without `h ≥ 1`, and fails for the junk value at `h = 0`

The second bullet of 2.1 (README line 210) says that `OPT_h(σ)` is at least the number of distinct pages of `σ`, with no restriction on `h`, while the bullet before it carries `h ≥ 1`. With the definition as given, `pagingOpt 0 [1] = sInf ∅ = 0 < 1`, which the Check of the same section (line 217) itself records. An implementer who states the bullet as written gets a false lemma. Adding "for `h ≥ 1`" to the bullet, as in the one above it, is enough.

## C02 — The description lists insertions among what is not treated, while the head treats them in 1.2

The description's sentence "Not treated here: … and also insertions and deletions in list update" contradicts both its own first bullet ("a request outside the list acting as an insertion") and the README, whose scope section excludes only "deletions in list update (requests outside the list act as insertions; only 1.2 allows them)". The text that fits the head is "deletions in list update". In the same paragraph family, the description says 1.2 was checked "on all lists of at most four items with at most six requests", whereas the exhaustive Check of 1.2 (README lines 150–154) gives at most five, four or three requests according to the length of the list; one of the two ranges should be made to agree with the other.

## N01 — The parenthesis of 1.3 says "no source was opened"

In 1.3 (README lines 165–166) the attribution of the bound `2n/(n + 1)` to Karp and Raghavan ends with "and no source was opened", which is a remark about how the text was written and not about the mathematics. Either give a reference that states the bound, or keep only "Proved here".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 definitions and Checks | `[1,2,3]` on `3,3,2`; action `([1],0)`; `moveForward [1,2,3,4] 4 1`; optimum on `3,3,3` and `3,2,1` | mtf `7`, costs `(7,0,4)`; `(2,1,0)`; `[1,2,4,3]`; `listOpt` `5` and `6`, mtf `5` and `9` | agree with README | none |
| 1.2 `mtfCost + F + m ≤ 2C + X` | all lists of length ≤ 3 over 3 values (repeats), requests over 4 values, ≤ 3 requests, swap lists incl. indices with no neighbour; 12,475,720 cases | max of `lhs − rhs` is `0`; `[1,2,3]`/`3,3`: `8 = 8`; `[1,1]`/`2,1`: `7 ≤ 8` and `10 = 10` | holds, equality attained | none |
| 1.3 rule pays `≥ n m`, `2·OPT ≤ (n+1)m + n(n−1)` | DP optimum over all orderings, `n ≤ 4`, `m ≤ 5` (`≤ 4` for `n = 4`); 300 random rules against the adversary; `n = 1`; duplicates `[1,1]` | 0 violations; `n=3,m=3`: rule `9`, `2·OPT = 12 ≤ 18`; `[1,1]` request `1` costs `1 < 2` | holds; `Nodup` and `L ≠ []` needed | none |
| 2.1 `fetchCost`, `pagingOpt` | `1,2,3,1,2,3` at `h = 2, 1`; `1,2,3,4,1,2` at `h = 3`; `h = 0`, `σ = [1]` | `4`, `6`, `4`; junk `0` while one distinct page | Checks agree; distinct-pages bullet fails at `h = 0` | C01 |
| 2.2 Belady, every tie-breaking | all sequences of length ≤ 7 on ≤ 4 pages, `h ≤ 3`, against DP over all caches (prefetching allowed); `h = 0` | cost set of all tie-breakings `= {OPT}` in every case; `1,2,3,1`: `{3}`, other eviction `4`; `h = 0`: no schedule for `[1]`, `0 = 0` for `[]` | holds, vacuous at `h = 0`, `σ ≠ []` | none |
| 3.1 `lruCache`, `fifoQueue` | `[1,0,2,2,1].dedup`; LRU after `1,2,1,3` and `1,2,1,3,2`; FIFO on `1,2,1,3,1` | `[0,2,1]`; `{3,1}`, `{2,3}`; queue `[3,1]`; LRU `3`, FIFO `4` | agree; reversed-dedup variant gives `{3,2}` | none |
| 3.2 LRU and FIFO | all sequences of length ≤ 8 on ≤ 3 pages, 7 on 4, 6 on 5, `1 ≤ h ≤ k ≤ 3`; `k=1,h=2`; `h=0` | 0 violations; `k=h=2`: `6 ≤ 8`; `k=2,h=1`: `12 = 12`; `k=3,h=2`: `16 ≤ 18`; `k=1,h=2`: `4 > 2`; `h=0`: `k+1 > 0` | holds; both hypotheses needed | none |
| 3.3 lower bound | bound on OPT for every sequence of length `kN ≤ 8` on ≤ `k+1` pages, `h ≤ k ≤ 3`; `k = 0`; `h > k`; route counted by hand | 0 violations; `OPT_2 = 4 = 1·3+1`; `OPT_2 = 5`, `OPT_3 = 4`; `k=1,h=2`: `2 ≤ 3`; `k = 0` hypotheses contradictory | holds | none |
| 4.1 `markSet`, `marking` | `markSet 2 [1,2,1,3,4]`; all four branches at `k ≥ 1`; `k = 0` | `{3,4}`; each branch sums to `1`, caches contain request, size ≤ `k`; `k = 0` gives `{r}` of size 1 | a rule of capacity `k` exactly for `k ≥ 1` | none |
| 4.2 marking `≤ 2 H_k · OPT_k` | exact rational expectation, all sequences as in 3.2, `k ≤ 3`; `k = 0` | `7/2 ≤ 9`; `13/3 ≤ 44/3`; max ratio `7/5` (`k=2`), `29/24` (`k=3`); `k=0`: `1 > 0` | holds; `k ≥ 1` needed | none |
| 4.3 `H_k` lower bound | `k = 0`, `k = 1`; nemesis against marking, `k = 2`, `N = 1, 3`; subphase arithmetic | `k=0` vacuous; `k=1`: `N+1 ≥ 1+N`, `OPT = N+1`; `7/2 = 2 + H_2`, `OPT = 3`; `13/2`, `OPT = 5`; cycle sum `1 + 1/k + … + 1/2 = H_k` | holds | none |
| Uniformity step in 4.2 | binomial identities | `(c+1)/(C(s,c)(s−c)) = 1/C(s,c+1)`; `(1 + c/(s−c))/C(s,c) = 1/C(s−1,c)` | correct | none |
| 3.2 route inequality | cases `d ≤ h`, `d > h`, `q = 1` | `kh − gd ≥ h(k−g) ≥ 0`; `(k−g)d ≥ 0`; `g d ≤ k d` | correct | none |

- Source locators checked against the text: 19 of 19 (Sleator–Tarjan 10, Fiat et al. 7, Lee et al. 2); the page numbers of the arXiv and HAL versions are the ones the README says it uses.
- Library declarations opened at the pin: `Nat.sInf_mem` and `Nat.sInf_le` (`Mathlib/Order/Lattice/Nat.lean` lines 75, 86), `harmonic` (`Mathlib/NumberTheory/Harmonic/Defs.lean` line 25), `ENNReal.tsum_mul_left` (`Mathlib/Topology/Algebra/InfiniteSum/ENNReal.lean` line 198), `List.dedup` (`Mathlib/Data/List/Defs.lean` line 251, last occurrences kept by `dedup_cons'`).
- Cross-roadmap citations resolved: 1 (RegretMinimizationAndEquilibria on main, online algorithms on the simplex, README line 78); no supplier citation.
- Duplication by object: no hit for paging, competitive ratio, move-to-front, least recently used or k-server in the pinned Mathlib or Tau Ceti; among roadmaps only MultiArmedBandits, OnlineConvexOptimization, OptimalStopping (open) and RegretMinimizationAndEquilibria (main) share vocabulary, none the objects.
- Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; no change outside the folder.
- Elaboration of `Suggested.lean` at the pins: 8 `sorry` warnings, nothing else; elaborated types compared with the README, the six definitions that drop `[DecidableEq α]` do not use it. One-tactic probe (`simp`, `rfl`, `omega`, `infer_instance`, `exact le_rfl`): none of the eight theorems closes.
- Headline theorems: the seven targets 1.2, 1.3, 2.2, 3.2 (LRU and FIFO), 3.3, 4.2, 4.3 are all stated; no padding found.

Overlap check: read RegretMinimizationAndEquilibria, OnlineConvexOptimization, OptimalStopping (the three closest-roadmap lists are empty); nothing shared

Source independence: 12 passages compared with 3 sources, none shared beyond short phrases the mathematics forces; largest share SleatorTarjan1985, 10 of 19 locators; contents compared with SleatorTarjan1985 (§2 lists, §3 general costs, §4 paging, §5 remarks): independent (its §3 is absent, Layers 2 and 4 rest on other sources, 3.2 and 3.3 reverse its order, 1.3 is not in it).

Research link: The targets are the theorems of Sleator–Tarjan 1985 and Fiat–Karp–Luby–McGeoch–Sleator–Young 1991; the latter treats paging as the uniform k-server problem of Manasse–McGeoch–Sleator and adapts the task-system algorithm of Borodin–Linial–Saks (FiatEtAl1991 §§1–2). Rests on the source, not the README.

## Not verifiable

- The displayed inequalities of Sleator–Tarjan's Theorems 5 and 6 are missing from the text extraction; their content was read from the proofs and the remark on the additive term (SleatorTarjan1985 lines 593–604, 628–646).
- The published paginations (J. Algorithms 12, Inform. Process. Lett. 116) were not compared with the arXiv and HAL versions read; the README cites the versions read.
- The attribution of the bound of 1.3 to Karp and Raghavan: no text was read.
- The author's computations beyond the ranges above (the spacing lemma for `k = 4`, the nemesis sequence against seven rules) were not repeated.

## Source issues

- **Misprint** in SleatorTarjan1985 at §4, remark after Theorem 6, p. 208: the source says the lower bound "in Theorem 4" grows by the smaller memory size for different initial memories; it should be Theorem 5, the paging lower bound; affects nothing.
- **Misprint** in FiatEtAl1991 at proof of Theorem 4, p. 7 (arXiv v1): the source says the probability that the requested vertex is uncovered becomes 1 after the request; it should be 0, the vertex then being covered; affects nothing.
- **Gap** in FiatEtAl1991 at proof of Theorem 1, p. 4 (arXiv v1): the source says the unserved stale vertices are uniformly distributed among the stale ones, without argument; it should be proved by induction on the requests of the phase; affects the proof.

## For the human reviewers

- Scope: the subject is competitive analysis of online algorithms (metadata topic `math.OC`); its three sources are refereed computer-science articles (Comm. ACM 1985, J. Algorithms 1991, Inform. Process. Lett. 2016). Whether this lies in the project's scope is yours to decide.
- Target 1.3 has no source locator: the README proves it and attributes it to Karp and Raghavan without a reference (README lines 165–166).
