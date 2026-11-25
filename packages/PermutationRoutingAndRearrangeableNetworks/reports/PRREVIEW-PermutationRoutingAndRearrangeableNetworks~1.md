# Review of PermutationRoutingAndRearrangeableNetworks (pull request #3126 at aa82f12)

**Verdict:** accepted

**Summary.** Accepted: no finding. The five headline statements were recomputed on small and degenerate cases against the Lean definitions (Clos for `r ≤ 3`, `n ≤ 2`, `m ≤ 4` including `m = 0`, `n = 0`, `r = 0, 1`; Slepian–Duguid for the same range with `m ≤ 3`; Beneš, Waksman and butterfly on 4 and 8 wires) and the proof routes were read step by step; all agree, and both supplier citations resolve on main. There are no small corrections and three format notes, none blocking. Left for a human: the slides that carry most of the locators could not be read, the textbook could be read only in an earlier revision with other numbering, and the scope questions listed at the end.

## N01 — Two theorems named for one property state three

`benesPerm_surjective` is the conjunction of the Waksman surjectivity and two cardinalities, and `butterflyPerm_injective` of injectivity, a cardinality and the surjectivity criterion (`Suggested.lean`, lines 99 and 119). An implementer who needs only the switch count must project it out of a theorem whose name says something else. Separate names for the counts would make each usable alone; the statements need no change.

## N02 — Section 3.1 has no source locator, and the Slepian–Duguid theorem has no primary reference

3.1 is proved in full in the README, but no text is cited for the statement that a sorting network, read as switches, realizes every permutation; 1.2 cites only a slide that omits the proof, and the References list no work of Slepian or Duguid. A locator for 3.1 and a primary or textbook reference for 1.2 would let a reader place both.

## N03 — The switch counts of 2.1 and 2.2 differ from those of the cited textbook, which counts vertices

The README counts two-by-two switches: `(2k + 1) 2^k` for Beneš and `(k + 1) 2^k` for the butterfly. The cited textbook's switches are graph vertices, so its counts for `N` inputs are `2N log N` and `N (log N + 1)` (in the 2015 revision, the comparison table of its Beneš section). The README already says the model differs (lines 195–196, 253–254); one clause saying that the counts therefore differ would stop a reader from taking either figure for a misprint.

## Questions for the author

- The README cites Lehman–Leighton–Meyer in the revision of 2018-06-06 as Theorem 11.3.2 (p. 490), Lemma 11.3.3 (p. 492) and §11.3.2 (p. 488). The copy on A. R. Meyer's own page is the revision of 2015-05-18, where the same statements are Theorem 10.9.1 (p. 383), Lemma 10.9.2 (p. 385) and §10.8 (pp. 379–380); there the content supports the README's description. Are the 2018 numbers as cited? What stopped me: the host of the 2018 revision is one the sources service does not classify.
- Do slides 22 and 26 of Giaccone state the asymmetric thresholds, of which the README takes "the symmetric case"? If so, which hypotheses on the sizes does the asymmetric statement need (the README's scope section says only "further hypotheses")? What stopped me: the slides could not be read from a classified host.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 Clos's theorem, `strictSenseNonblocking_iff` | all routed states and calls, `r ≤ 3`, `n ≤ 2`, `m ≤ 4`, `rn ≤ 4` | `(2,2,2)` blocking, `(2,2,3)` nonblocking, `(2,1,0)` blocking, `(2,0,0)` nonblocking; 0 mismatches with `2n − 1 ≤ m` | true | none |
| 1.1 necessity of `r ≥ 2` | `r = 0, 1` | `(1,2,2)` nonblocking though `2n − 1 = 3`; `r = 1` matches `n ≤ m`, `r = 0` always | Check true | none |
| 1.1 "only if" route | `g = min(n−1, m)`, groups on switches 0 and 1 | group sizes `g ≤ n−1`, `m − g ≤ n−1`; middle switches `0..g−1` and `g..m−1` cover all `μ < m` | route sound | none |
| 1.2 Slepian–Duguid, `rearrangeable_iff` | all permutations, same range, `m ≤ 3` | `(2,2,2)` rearrangeable, `(2,2,1)` not; 0 mismatches with `r = 0 ∨ n ≤ m`; `n = 0`, `r ≥ 1` true both sides | true | none |
| 1.2 route against the supplier | `exists_edgeColoring_iff` signature | needs `IsBipartition G L R`, `Fintype` vertex and edge sets, gives `c : G.edgeSet → Fin k`; degrees all `n`; `k = m = 0` forces no edges | matches | none |
| Conventions: `switchCol`, `subnetworkPair` | 4 wires, evaluated in Lean | `[1, 0, 2, 3]` and `[2, 1, 0, 3]` | Check true | none |
| Conventions: blocking state, wrong variants | `r = n = m = 2`; `m = 0` | call `(0,0) → (1,0)` blocked: switch 0 busy at input, 1 at output; without output condition `n − 1 = 1 < 2` free | Checks true | none |
| 2.1 (a) `benesPerm_surjective` with `IsWaksman` | 4 and 8 wires | 64 settings → 24 permutations; 32 Waksman → 24; Waksman on 8 wires → 40320 | true | none |
| 2.1 (b), (c) counts | recursion in `k` | `2M + 2(2k+1)2^k = (2k+3)2^(k+1)`; `2M − 1 + 2(k 2^(k+1) + 1) = (k+1)2^(k+2) + 1`; `k = 0`: 2, 2 | true | none |
| 2.1 counting Check | `N = 4, 8` | `⌈log₂ 24⌉ = 5 = 1·4 + 1`; `⌈log₂ 40320⌉ = 16 < 17` | true | none |
| 2.2 `butterflyPerm_injective` | 4 and 8 wires | 16 settings → 16 permutations (`< 24`); 4096 → 4096 (`< 40320`); `N^N = (2^((k+1)2^k))²` | true | none |
| 3.1 `switchPerm_surjective` | route read; `n = 0`; comparator `(p, p)`; reversed comparator `(1, 0)` | `y ∘ π = σ` gives `π⁻¹.trans σ` monotone, hence identity; `(1,0)` gives both permutations, output `(max, min)` not sorted | true; converse Check true | none |
| One-tactic probe, all five theorems | `simp`, `simp` with unfolding, `aesop`, `rfl`, `exact?` | none closes (1.1 `simp` only rewrites to `2n ≤ m + 1`) | no padding | none |

- Source locators checked against a text: 3 (Lehman–Leighton–Meyer, in the 2015 revision: Theorem 10.9.1, Lemma 10.9.2, §10.8 unique path); 0 of the 6 slide locators; the context-only preprint's use of a rearrangeable-network factorization, Batcher's networks and Beneš (its reference [9]) read in its text.
- Bibliographic data checked on Crossref: Waksman 1968, Beneš 1964, Clos 1953, all as in the References.
- Library declarations opened at the pin: `finProdFinEquiv` (`Mathlib/Logic/Equiv/Fin/Basic.lean:330`), `Equiv.prodCongrLeft`/`Right` (`Mathlib/Logic/Equiv/Prod.lean:240, 258`), `Graph` (`Mathlib/Combinatorics/Graph/Basic.lean:90`), `Graph.incidenceCount` (`TauCeti/Combinatorics/Graph/Incidence.lean:45`), `Fin.consEquiv` (`Mathlib/Data/Fin/Tuple/Basic.lean:184`), `OrderIso.subsingleton_of_wellFoundedLT` (`Mathlib/Order/Hom/Set.lean:211`), `Fintype.card_perm`, `Fintype.card_fun`, `Nat.card_prod`, `Fintype.card_le_of_surjective`; `Finset.card_le_card_of_injOn`, `Monotone.strictMono_of_injective`, `StrictMono.orderIsoOfSurjective`, the Hall and Birkhoff declarations by `#check`.
- Cross-roadmap citations resolved on main: GraphConnectivityAndFlows §6.7 `IsBipartition`, §6.9 `exists_edgeColoring_iff`; ComparisonSortingAndSelection §4.1 (the four copied definitions agree character for character with its `Suggested.lean`), §4.2 `Network.sorts_of_sorts_bool`, §4.3.
- Dependency check: `depcheck: 122 roadmaps, 1385 edges, 0 problem(s)`; no UPWARD or CYCLE line. Both suppliers are on main.
- Elaboration: `Suggested.lean` elaborates with five `sorry` warnings and nothing else; `#check @name` types of the five theorems compared with the README statements, no binder lost, nothing changed. The worker's automatic checks all passed.
- Change outside the folder: none. No name of `Suggested.lean` coincides with a fully qualified name of another roadmap (the copied definitions live in this roadmap's namespace).
- Headline theorems (README summary): Clos, Slepian–Duguid, Beneš with Waksman's count and the butterfly, sorting networks as permutation networks; all stated in `Suggested.lean`, none through a stand-in.

Overlap check: read ComparisonSortingAndSelection, GraphConnectivityAndFlows (the only roadmaps on the three lists); comparator networks and the zero–one principle are owned by ComparisonSortingAndSelection §§4.1–4.2 and Kőnig's edge-colouring theorem by GraphConnectivityAndFlows §6.9, each cited and not restated; the switch reading of a comparator network is owned here and stated nowhere else, on main or at an open head.

Source independence: 6 passages compared with 1 source (Lehman–Leighton–Meyer, 2015 revision: the Beneš induction and its two-colouring lemma, the butterfly recursion and unique-path argument, the two switch counts, the summary), none shared, the README's route being an edge-colouring of ports where the source colours a constraint graph; largest share Giaccone's slides, 6 of 10 locators, text and contents not read; contents compared with Lehman–Leighton–Meyer (binary tree, array, butterfly, Beneš): independent.

Research link: Layers 1–2 are the theorems of Clos (1953), Beneš (1964) and Waksman (1968) (README references); the 2026 OpenAI preprint on the matrix multiplication exponent uses a rearrangeable-network factorization by edge colouring and sorting networks in its routing (its text, read). Rests on the README and that text.

## Not verifiable

- Giaccone, *Multistage switching fabrics*, slides 7, 22, 24, 26, 36, 38: the only copy found is on a Politecnico di Torino host the sources service does not classify and whose address names no author.
- Lehman–Leighton–Meyer in the revision of 2018-06-06 (theorem numbers and pages as cited): only the 2015 revision is on an author's page; the content was verified there under other numbers.
- Waksman (1968), abstract: the publisher's page refuses the fetch; Crossref confirms the bibliographic data and that the abstract gives a cell count and a counting argument from `n!`, not the exact formula.
- Beneš (1964) and Clos (1953): cited without locators; texts not sought.

## Source issues

- none

## For the human reviewers

- Scope: every locator is to a textbook or to lecture slides; the refereed papers (Clos 1953, Beneš 1964, Waksman 1968) are cited without locators, 3.1 cites no source, and the only named consumer is an unrefereed 2026 preprint (README lines 362–366).
- Scope: only the symmetric Clos network and Beneš networks on a power of two wires are stated; the README's own citations call slides 22 and 26 "the symmetric case" of the source (lines 99, 139), and its scope section lists the rest as not treated.
- Not tested: Giaccone's slides carry 6 of the 10 locators; neither their text nor their contents page could be read, so wording and arrangement were not compared with them.
- Licence: the slides are lecture notes on a departmental host with no stated licence class. The repository `openai/math` has Lean files on sorting networks; they were not compared with `Suggested.lean`, whose four network definitions equal those of ComparisonSortingAndSelection on main.
