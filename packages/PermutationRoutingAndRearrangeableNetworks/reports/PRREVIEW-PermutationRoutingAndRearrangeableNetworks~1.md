# Review of PermutationRoutingAndRearrangeableNetworks (pull request #3126 at aa82f12)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, Check and worked example was recomputed (Clos, Slepian–Duguid, Beneš with Waksman's settings, the butterfly, the switch reading of sorting networks) and agrees with the Lean signatures; both suppliers are on main and are cited for what they state. There are two small corrections and two format notes, none blocking. Left to the human reviewers: Giaccone's lecture notes (the most cited source) and the 2018 revision of the textbook could not be read from a legal place, so their slide, theorem and page numbers are unverified, and the scope and the context preprint are theirs to judge.

## C01 — "One output switch of every subnetwork held straight" is true only for subnetworks on at least four wires

A reader who takes the Summary (line 21) or the docstring of `IsWaksman` ("at every level of the recursion the output switch `0` is straight", `Suggested.lean` line 90) literally also holds the single switch of each two-wire subnetwork straight; then the four-wire network has 3 free switches, `2^3 = 8 < 24` settings, and does not realize every permutation, and the count `N log₂ N − N + 1` is off by `N/2`. The definition is right (`IsWaksman 0 = True`; with it I get 32 Waksman settings realizing all 24 permutations on four wires and `2^17` realizing all 40320 on eight). Saying "of every subnetwork on at least four wires" in the Summary, and "at every level `k + 1`" in the docstring, would remove the ambiguity; 2.1(a) is already safe because a two-wire subnetwork has no output column.

## C02 — "agrees with the theorem …, except `r = n = 3`" reads as an exception to Clos's theorem

In the first Check of 1.1 (line 121) the phrase means that the case `r = n = 3` was not searched, but as written it can be read as a case where the theorem fails. It does not fail there (the proof of 1.1 covers it, and the blocking state of the route exists for every `r ≥ 2`). "for `r = 2`, `n ≤ 3` and for `r = 3`, `n ≤ 2`, with `m ≤ 5`" says what was computed.

## N01 — Two theorem names describe one third of what they state

`benesPerm_surjective` is a conjunction of the Waksman realization, the count of settings and the count of Waksman settings; `butterflyPerm_injective` of injectivity, a count and "surjective iff `k = 0`". An implementer looking for the switch count will not search under "surjective". Separate names for the counts would help; the statements themselves need no change.

## N02 — The Slepian–Duguid theorem has no published reference

1.2 cites only lecture slides that, as the README says, omit the proof, and the reference list has no work of Slepian or Duguid or a monograph stating the theorem. The route is complete here, so nothing rests on it; a refereed or book reference for the statement (for example a monograph on connecting networks; I did not check a locator) would let a reader check the attribution.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 Clos, `strictSenseNonblocking_iff` | exhaustive states and calls, `r=2,3`, `n≤2`, `m≤4`; route's blocking state by hand | `(r,n,m)=(2,2,2)`: blocking, `2n−1=3>2`; `(2,2,3)`: nonblocking; `(2,1,0)`: blocking, `1>0`; `n=0`: nonblocking, `0≤m` | agrees | none |
| 1.1 hypothesis `r ≥ 2` | `r=0`; `r=1`, `n≤3`, `m≤4` | `r=1,n=m=2`: nonblocking though `2n−1=3`; `r=1`: nonblocking iff `n≤m` in all 15 cases; `r=0`: always | hypothesis needed, Check true | none |
| 1.2 Slepian–Duguid, `rearrangeable_iff` | all permutations, `r≤3`, `n≤2`, `m≤3`, `rn≤6` | `(2,2,2)`: all 24 routed; `(2,2,1)`: identity fails; `(1,2,1)`: fails; `r=0` or `n=0`: true | agrees both directions | none |
| Conventions: two notions differ; `m=0` | `(2,2,2)`; `(1,1,0)` | rearrangeable yes, nonblocking no (state of the Check blocks `(0,0)→(1,0)`); `m=0`: neither | Checks true | none |
| Conventions: `switchCol`, `subnetworkPair` | four wires, in Lean (`decide`) and by hand | `[1,0,2,3]` and `[2,1,0,3]`; Lean `benesPerm 1` on one setting gives `[1,3,0,2]`, as computed by hand | agree | none |
| 2.1(a) Beneš with Waksman | `k=0,1` all settings; `k=2` Waksman settings | `k=1`: 64 settings → 24 perms, 32 Waksman → 24; `k=2`: 131072 Waksman → 40320 | agrees | C01 (wording) |
| 2.1(b),(c) counts | `k=0,1,2`; induction step by hand | settings `2, 64`; formula `2^1, 2^6`; Waksman `2, 32, 2^17`; exponent step `2M+(2k+1)2^(k+1)=(2k+3)2^(k+1)`, `2M+k2^(k+2)+1` | agrees | none |
| 2.1 counting Check | `k≤7` | `⌈log₂ N!⌉` vs `k2^(k+1)+1`: 1/1, 5/5, 16/17, 45/49, 118/129, 296/321, 717/769, 1684/1793 | Check true | none |
| 2.2 butterfly | `k=0,1,2` all settings | 2, 16, 4096 settings, all distinct; `N!` = 2, 24, 40320; `(N!)²>N^N` since `(i−1)(N−i)>0` at `i=2` | injective; surjective only `k=0` | none |
| 3.1 `switchPerm_surjective` | all networks of length 3, 4, 5 on 2, 3, 4 wires | 28, 192, 16 sort `Bool`; each realizes `2, 6, 24` perms; exchange record on the 5-comparator sorter returns `σ` for all 24 | agrees | none |
| 3.1 converse | comparator `(1,0)` on two wires | realizes 2 perms; sends `(0,1)` to `(1,0)`: not sorting | Check true | none |
| 1.2 route against the supplier | signature of `exists_edgeColoring_iff` on main | colours `G.edgeSet → Fin k`, hypothesis `incidenceCount ≤ k`; here every count is `n ≤ m`, no loops | route's input exists as cited | none |
| One-tactic probe | the five theorems with `rfl`, `simp`, `decide` | none closes | no padding | N01 (names) |

- Source locators checked against a text: 3 (the two-colouring recursion, the lemma, the unique-path remark), in the 2015 revision of Lehman–Leighton–Meyer only; 7 not checkable (below).
- Library declarations opened at the pin: 14 (`finProdFinEquiv` `Mathlib/Logic/Equiv/Fin/Basic.lean:330`, `Equiv.prodCongrLeft/Right` `Logic/Equiv/Prod.lean:240,258`, `Finset.card_le_card` and `card_le_card_of_injOn` `Data/Finset/Card.lean:66,430`, `Fintype.card_le_of_surjective` `Data/Fintype/Card.lean:270`, `Fintype.card_perm` `Data/Fintype/Perm.lean:156`, `Fintype.card_fun` `Data/Fintype/BigOperators.lean:202`, `Nat.card_prod` `SetTheory/Cardinal/Finite.lean:227`, `Fin.consEquiv` `Data/Fin/Tuple/Basic.lean:184`, `Monotone.strictMono_of_injective` `Order/Monotone/Defs.lean:238`, `StrictMono.orderIsoOfSurjective` and `OrderIso.subsingleton_of_wellFoundedLT` `Order/Hom/Set.lean:157,211`, `Graph` and `Graph.Inc` `Combinatorics/Graph/Basic.lean:90,191`, `Graph.incidenceCount` `TauCeti/Combinatorics/Graph/Incidence.lean:45`); the two Mathlib theorems named as unused exist (`Combinatorics/Hall/Basic.lean:116`, `Analysis/Convex/Birkhoff.lean:164`).
- Cross-roadmap citations resolved on main: 4 (GraphConnectivityAndFlows §6.7 `IsBipartition`, §6.9 `exists_edgeColoring_iff`; ComparisonSortingAndSelection §4.1, §4.2 `Network.sorts_of_sorts_bool`); the four copied definitions agree with the supplier's `Suggested.lean` word for word.
- Duplication: no file of the pinned Mathlib or Tau Ceti mentions Beneš, Waksman, rearrangeable or sorting networks; no other roadmap, open or on main, states a Clos, Beneš, Waksman or butterfly result.
- Dependency check: `depcheck: 122 roadmaps, 1385 edges, 0 problem(s)`; no change outside the folder.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (five); single `import Mathlib`, no `set_option`, no sorry'd data; the 20 elaborated signatures agree with the README statements, none lost a binder.
- Automatic checks: all passed. Pull-request text read against the head: consistent (5 theorems, 15 definitions, both suppliers named).

Overlap check: read ComparisonSortingAndSelection, GraphConnectivityAndFlows; comparator networks and the zero–one principle are owned by ComparisonSortingAndSelection (cited, definitions copied), bipartitions and Kőnig's edge-colouring theorem by GraphConnectivityAndFlows (cited); nothing else shared.

Source independence: 5 passages compared with 1 source (Lehman–Leighton–Meyer, 2015 revision, lines 12690, 12762–12765, 12787, 12859–12861, 12896–12909), none shared, and the README's route (edge-colouring) is not the source's (two-colouring of a constraint graph); largest share Giaccone, 6 of 10 locators; contents compared with Giaccone: not possible, text and contents page unread.

Research link: The targets are the classical theorems of switching-network theory, Clos (1953), Beneš (1964) and Waksman (1968), as the README's references give them; the README's scope section says a 2026 preprint on the matrix multiplication exponent uses a rearrangeable-network factorization and sorting networks. Rests on the README; none of these texts was read.

## Not verifiable

- Giaccone, *Multistage switching fabrics*, slides 7, 22, 24, 26, 36, 38: the notes are on an institute host that is not shown to be the author's own page, so the text was not read.
- Lehman–Leighton–Meyer, 2018-06-06 revision, Theorem 11.3.2 p. 490, Lemma 11.3.3 p. 492, §11.3.2 p. 488: the copy on an author's page is the 2015-05-18 revision, where the same results are Theorem 10.9.1 (p. 383), Lemma 10.9.2 (p. 385) and §10.8 (p. 380); the mathematics supports the README, the 2018 numbers and pages are unchecked.
- Waksman (1968), abstract: the publisher's page refused access; the count `N log₂ N − N + 1` was checked only against the roadmap's own computation.
- Beneš (1964) and Clos (1953): cited without locators and not read.
- The exhaustive search of 1.1 for `r = 2, 3` with `n = 3`, and of 1.2 with `n = 3`: not rerun (size); smaller cases and the proofs were checked.

## Source issues

- none

## For the human reviewers

- **Scope.** The located sources are lecture slides (Giaccone) and an undergraduate open textbook; the refereed primaries (Clos 1953, Beneš 1964, Waksman 1968) are cited without locators. The subject is switching-network theory; README References.
- **Licence.** Giaccone's notes: no licence seen and the host could not be classified; the README quotes nothing from them that I could compare.
- **Not tested.** Giaccone has the largest share of locators (6 of 10); wording and arrangement were not checked against it.
- **Context citation.** The README (Scope and ownership, last paragraph) names a 2026 preprint and the repository `openai/math`; neither was opened, so similarity of the Lean declarations to that formalisation was not checked.
