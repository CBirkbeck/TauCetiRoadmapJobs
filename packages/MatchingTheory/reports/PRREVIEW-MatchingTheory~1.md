# Review of MatchingTheory (pull request #2706 at e039b8a)

**Verdict:** accepted

**Summary.** Accepted: every statement of the README and of `Suggested.lean` was recomputed on small and degenerate graphs and none failed, the proof routes of 1.2, 3.2, 4.2, 4.3, 4.4, 5.1 and 5.2 were checked step by step, and the file elaborates with `sorry` as its only warning. There is one small correction and no format note, none blocking. The locators into Goemans' notes were read and agree; the locators into Schrijver's notes and Diestel's chapter could not be read from a legal place in this review, so they are unchecked, and that is left to the human reviewers together with the comparison of the arrangement against Schrijver.

## C01 — With `n = Nat.card V`, the Conventions sentence "the identity `ν + ρ = n` of 1.2 … hold[s] on every vertex type" is false on an infinite vertex type

A reader who takes the first Conventions bullet at its word gets a different statement from the one 1.2 and the Lean file make. The bullet (README line 47–48) says the identity `ν + ρ = n` holds on every vertex type and then fixes `n` as `Nat.card V`. On the complete graph on `ℕ`, `ν = ⊤` and `ρ = ⊤`, while `Nat.card ℕ = 0`, so the identity as written there reads `⊤ = 0`. Section 1.2 (line 110) and `matchingNumber_add_edgeCoverNum` state it correctly with `ENat.card V`.

The smallest change is in that bullet: write the identity as `ν + ρ = |V|` with `|V|` the `ENat.card V` of 1.2, and keep `n = Nat.card V` for the theorems that assume `[Finite V]`.

## Questions for the author

- In 4.1 (line 296) the README says that Diestel "also asks that the graph itself have no perfect matching". Is that a condition of his definition on p. 45, or a remark he makes after it (that such a graph has odd order and hence no 1-factor)? If the latter, "Diestel notes" would be the accurate verb. I could not open the chapter file to check: the address I tried on the author's site returned "not found".
- The locators into Schrijver's notes (1.1, 1.2, 1.3, 2.1, 2.2, 3.1, 3.2, the second half of the proof of Theorem 5.1 used in 4.2, Exercise 5.2) could not be read: the address `homepages.cwi.nl/~lex/files/dict.pdf` does not contain the author's surname, so the sources service did not accept it as an author's page. Is there an address for the same file that shows it is the author's own (for instance a page that links to it under his name)?

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `matchingNumber`, `IsMaximumMatching`, `edgeCoverNum` | empty type; `K_(1,3)`; triangle; edge + isolated vertex; `K_ℕ` | `ν,ρ`: `0,0`; `1,3`; `1,2`; `1,⊤`; `⊤,⊤` | as README | none |
| 1.1 `2ν ≤ n`, equality iff perfect matching | `n=0`; path `abcd`; triangle | `0=0` (⊥ spanning); `4=4`; `2<3` | holds | none |
| 1.2 `ν + ρ = ENat.card V` | `K_(1,3)`; triangle; Petersen; empty; infinite no isolated; edge + isolated | `1+3=4`; `1+2=3`; `5+5=10`; `0+0=0`; `⊤=⊤`; `1+⊤≠3` | holds; hypothesis needed | C01 (Conventions wording) |
| 1.2 route | star forest counting | first half `ν+(n−2ν)=n−ν` edges; second half ≤ `2|F|−n` discards, leaves ≥ `n−|F|` | sound | none |
| 1.3 `α = ρ` bipartite | `K_(1,3)`; `C_6`; `K_(2,3)`; triangle | `3=3`; `3=3`; `3=3` (`ν=2,n=5`); `1≠2` | holds; bipartite needed | none |
| 2.1 `IsAugmentingPath` | `abcd`, `M={bc}`; `K_(1,3)` leaf–centre–leaf; length 0; parity flipped | edges idx 0,1,2: out,in,out ✓; both out ✗; excluded by `u≠v`; flipped forces `u∈M.verts` | determines object | none |
| 2.2 Berge | `n=0`; `abcd` three 1-edge matchings; infinite pendant path | vacuous both sides; each has an augmenting path, none maximum; `⊤`-edge matching with augmenting edge `w0` | holds; finiteness needed | none |
| 3.1 inequality | `K_(1,3)`, centre; 16-vertex cubic, centre; `U=V`; `K_ℕ` without `Finite` | `2+3=4+1`; `14+3≤17`, `ν=7` built (1+2+2+2); `2ν≤2n`; `⊤≤0` false | holds; `Finite` needed | none |
| 3.2 Tutte–Berge | `n=0`; `abcd` at `∅,{a},{b}`; `K_(1,3)` at `∅`, centre; route with `d=0` and `d>0` | `0=0`; `4=4,5=5,5=5`; `2<4`, `5=5`; new graph even, Tutte holds in both cases | holds | none |
| 3.2 edge cover formula | `K_(1,3)`, `W` = leaves | `3+3=6=2·3` | holds | none |
| 4.1 `IsFactorCriticalOn` | single vertex; triangle; `P_3`; `∅`; one edge | ⊥ has verts `∅` ✓; ✓; middle deleted leaves 2 isolated ✗; excluded by nonempty; ✗ | determines object | none |
| 4.2 Gallai's lemma (iff) | `n=0`; `n=1`; edge; 2 isolated; triangle; `P_3`; two triangles | F/F (`Connected` needs nonempty); T/T; F/F; F/F; T/T; F/F; F/F (not connected) | both directions agree | none |
| 4.2 route | exchange step | `|cov M∖cov N| ≥ 2` gives `x≠t`; new matching shares one more edge with `M`, still misses `t` | sound | none |
| 4.3 `D, A, C` and theorem | `n=0`; `K_(1,3)`; `K_(2,3)`; `abcd`; edge + isolated; 3 isolated; `C_5` | all empty, `0=0`; `2+3=4+1`; `4+3=5+2`; `D=A=∅`, `4+0=4+0`; `D`=isolated, `2+1=3+0`; `D=V`, `0+3=3`; `D=V`, `4+1=5` | holds | none |
| 4.3 stability-lemma route | path case analysis | `a` has degree 1 in `N△M`, so an endpoint; `d∉P`; result has `|M|` edges and misses `u` | sound | none |
| 4.4 structure of maximum matchings | `K_(1,3)`; `K_(2,3)`; counting `o ≤ (o−|A|)+|A|` | centre→leaf, 3 singleton components each count 1; two of three; equality forces all four clauses | holds | none |
| 5.1 Petersen | `n=0`; two `K_4`; 16-vertex cubic; `K_(2,4)`; count `3|K| = 2e + e(K,U)` | ⊥ perfect; perfect; 3 bridges, `o=3>1`; `ν=2<3`; `e(K,U)` odd, `≠1`, so `≥3` | holds; hypotheses needed | none |
| 5.2 vertex-transitive | `n=0`; two triangles; `C_5`; `C_6`; `K_(3,3)` | vacuous (not connected); no p.m., not connected; odd; p.m.; p.m. | holds; hypotheses needed | none |
| Bridges convention | non-edge across components; loop `s(v,v)` | `IsBridge` true at the pin; false | README's description matches the pin | none |

- Source locators read against the text: 5, all in Goemans-L3 (Theorem 1 at line 15, p. 3-1; Theorem 2 at lines 31–40, p. 3-2; (ii)–(iv) at lines 37–40; Claim 9 at line 128, p. 3-4; proof to p. 3-5 at line 174); all agree. Schrijver (about 15 locators) and Diestel (about 9) not read.
- Library declarations opened at the pin: 20, all where the README places them, among them `SimpleGraph.IsBridge` and `isBridge_iff` (`Connectivity/Connected.lean` 815–819), `IsTutteViolator` and `tutte` (`Tutte.lean` 34, 316, under `[Finite V]` line 56), `oddComponents` and `odd_ncard_oddComponents` (`Connectivity/Finite.lean` 87, 104), `vertexCoverNum` (`VertexCover.lean` 92), `indepNum` (`Clique.lean` 1044), `IsMatching`, `IsMatching.map`, `IsPerfectMatching`, `IsMatching.even_card` (`Matching.lean` 67, 202, 236, 247), `IsBipartite` (`Bipartite.lean` 288), `induce` (`Maps.lean` 225), `dist` (`Metric.lean` 211).
- Duplication: no matching number, maximum matching, edge cover, augmenting path, factor-critical, Tutte–Berge or Gallai–Edmonds declaration in the pinned Mathlib or Tau Ceti.
- Cross-roadmap citations resolved: GraphConnectivityAndFlows §6.7, §6.8, §6.9, §7 on main (README lines 753, 782, 798, 833), unchanged in numbering at its open revision; its scope line 1114 leaves general matching theory to others. ApproximationGuarantees §2.1, MatroidOptimization, StableMatching and MatchingPolynomial read at their open heads: none states a target of this roadmap, and MatchingPolynomial hands this subject to MatchingTheory.
- Dependency check: `depcheck: 178 roadmaps, 2027 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Automatic checks: all passed. Elaboration of `TauCetiRoadmap/MatchingTheory/Suggested.lean`: nine `sorry` warnings, nothing else. Elaborated types compared with the README statements: every binder (`[Finite V]`, `[Fintype V]`, `[DecidableRel G.Adj]`) is explicit in each signature; nothing lost.
- One-tactic probe on a scratch copy (`rfl`, `simp`, `simp` with all nine definitions unfolded, `infer_instance`, `aesop`): none of the nine theorems closes. No padding. All headline theorems of the Summary are stated; none is unstatable.
- Pull request text read against the head: 9 theorems and 9 definitions, suppliers and boundaries as stated; nothing contradicted.

Overlap check: read MatchingPolynomial, ApproximationGuarantees, GraphColouring, SpanningTreesAndShortestPaths, MatroidOptimization, GraphConnectivityAndFlows; nothing shared (Kőnig's matching theorem is owned by GraphConnectivityAndFlows §6.7 and cited, not restated).

Source independence: 5 passages compared with 1 source (Goemans-L3), none shared, and the route of 4.3 is not that source's; largest share Schrijver, about 15 of 27 locators; contents not compared, since neither Schrijver's text nor its table of contents could be read (nor Diestel's).

Research link: the Tutte–Berge formula and the Gallai–Edmonds decomposition (Gallai 1964, Edmonds 1965) are the base of the structure theory of matchings in Lovász and Plummer, *Matching Theory* (1986), named in the README's References; Goemans-L3 lines 22–24 ties the decomposition to Edmonds' algorithm. Rests on the README and Goemans-L3.

## Not verifiable

- Schrijver, *A Course in Combinatorial Optimization*: every locator of 1.1, 1.2, 1.3, 2.1, 2.2, 3.1, 3.2, 4.2 and 5.1 into it. The address in the README was not accepted as an author's page (it does not contain the surname); the text has been requested from the operator.
- Diestel, *Graph Theory*, sixth edition, Chapter 2: every locator of 2.2, 3.2, 4.1, 4.3, 4.4, 5.1 and 5.2 into it. The preview address tried on the author's site was not found; the text has been requested from the operator.
- For both, the statements themselves were checked mathematically (table above); what is unchecked is the theorem number, the page and the attribution of wording.

## Source issues

- none

## For the human reviewers

- **Not tested.** Schrijver's lecture notes carry the largest share of locators (about 15 of 27); neither the text nor its table of contents was read, so wording and arrangement were not compared with it. Layers 1–3 draw on its §3.1, §3.2, §5.1.
- **Licence.** Two of the three sources are unpublished lecture notes on their authors' pages (Schrijver; Goemans' notes, written by a scribe, on the lecturer's page); the third is a free preview chapter of a published book.
- **Scope.** The headline theorems are classical (1891–1965); the primary papers and Lovász–Plummer were not consulted (README References, last bullet), and the cited texts are lecture notes and a textbook.
