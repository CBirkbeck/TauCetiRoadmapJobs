# Review of SorgenfreyLineAndClassicalCounterexamples (pull request #3209 at 011fcad)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement and every step of the routes was recomputed (the two topologies, the key identities `kiki = ki` and `ikik = ik`, the three orbit bounds, all finite counts in the Checks), and every source locator was read at its place and supports what it is cited for. There is one small correction (the Urysohn sentence in the Examples of Layer 1 omits T₀) and one format note (two Mathlib names without their namespace), neither blocking. Two questions of scope and prior formal work are left for the human reviewers.

## C01 — "A second countable regular space is metrizable" needs T₀ in the sense of "regular" the README uses

In the Examples of Layer 1 (README line 179) the sentence "a second countable regular space is metrizable (Urysohn, Mathlib's `metrizableSpace_of_t3_secondCountable`)" uses "regular" without T₀, whereas 1.3 uses "regular" in Mathlib's sense, which carries no separation axiom (it proves T₀ and regularity separately). In that sense the sentence fails for the indiscrete two-point space, which is regular and second countable and not metrizable. The Mathlib instance takes `[T3Space X]`, and the supplier contract (line 440) already says "second countable T₃ space". The argument itself is sound, since the line is T₀ by 1.3. Writing "a second countable T₃ space is metrizable; the line is T₃ by 1.3" makes the sentence agree with the contract.

## N01 — Two Mathlib names are given without their namespace

`metrizableSpace_of_t3_secondCountable` (Examples of Layer 1 and the supplier contracts) and `instSeparableSpaceProd` (supplier contracts) do not resolve at the pin under those names; they are `TopologicalSpace.metrizableSpace_of_t3_secondCountable` (`Mathlib/Topology/Metrizable/Urysohn.lean`, line 128) and `TopologicalSpace.instSeparableSpaceProd` (`Mathlib/Topology/Bases.lean`, line 429).

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 topology of `Sorgenfrey` | `Ico a b` with `b ≤ a`; complement of `[a, b)`; open-interval variant | empty set; `⋃ [a−n, a) ∪ [b, b+n)`; variant gives usual `ℝ`, `[0,1]` compact uncountable | sound |
| 1.2 hereditarily Lindelöf | countability lemma for `x < y` in `V \ W` | `y ≥ b(x)`, intervals `(x, b(x))` pairwise disjoint; Ga30 Example 3 (lines 82–110) proves Lindelöf | sound |
| 1.3 `T6Space` | Mathlib class at pin; closed `F = univ`, `F = ∅` | `T6Space` = `T0Space` + `PerfectlyNormalSpace` (GDelta.lean 66, 131); `F = ⋂ (C n)ᶜ`; Ga31 Example 2 line 82 | sound |
| 1.4 paracompact | disjointified cover `D n`; universe of index | `D n` clopen, disjoint, locally finite; `ℕ : Type` matches `ParacompactSpace.{0}`; So lines 18–56; Ga41 lines 101, 111–114 | sound |
| 1.5 compact ⇒ countable | `K = ∅`; `x < y` in `K` | `x ≤ y − δ(y)`, intervals `(x − δ(x), x)` disjoint; `[x, y)` uncountable so not locally compact | sound |
| 1.6 plane not Lindelöf, not paracompact | boxes at `x + y > 0`, `< 0`; box at `(x, −x)` | sums `≥ x + y > 0`; sums `< x + y + 2δ = 0`; `u ≥ x`, `−u ≥ −x` ⇒ `u = x`; Ga30 lines 111–122, Ga41 111–117, So 60–79 | sound |
| 2.1 tangent-disc topology | `r = 0`, `r < 0` in family 2 (excluded by `0 < r`); `r = 0` in family 1 | `D(t, r)` ⇔ `|q − (t,0)|² < 2 r q.2`, forces `q.2 > 0`; `r ≤ 0` would open `{(t,0)}`; family 1 gives `∅` | sound; README = Lean |
| 2.2 `T35Space` | `g` at `p`, at `(t′, 0)`, on `E`; class at pin | `g > 1 − ε` on `{p} ∪ D(t, εr)`; `g = 0` off closed disc; class wants `f p = 0`, `f = 1` on `K`; Ch line 47 | sound |
| 2.3 separable, not normal | finite intersection at axis point; `L ∩ ({(t,0)} ∪ D(t,1))` | `{x} ∪ D(t, min r)`; `{(t,0)}`; `#L = 𝔠`; Jones' lemma signature at pin; Jo lines 12–13, Ch line 47 | sound |
| key identities | `y = k i x` | `k i y ≤ k y = y`; `i x = i i x ≤ i k i x` ⇒ `k i x ≤ k i k i x` | sound |
| 3.1 bound 14 | all 1, 2, 7, 61, 2480 closure operators on `n ≤ 4` points; trivial algebra | max orbit 1, 2, 4, 8, 10; 14 left products of `W` reduce inside `W`; Bo lines 22–25, 97–99 | sound |
| 3.2 bound 7 | same operators; fourteen-set in `ℝ` | max 1, 2, 3, 5, 5; seven distinct sets `s, ks, is, kis, iks, kiks, ikis`; Bo line 87 | sound |
| 3.3 bound 10 | all 1, 1, 4, 29, 355 topologies on `n ≤ 4`; indiscrete two points | 1, 1, 4, 26, 255 extremally disconnected, max orbit 1, 2, 4, 6, 8; `kik = ik`, `iki = ki`; Bo lines 417–418, 2791 | sound |
| Urysohn sentence (C01) | indiscrete two-point space | regular, second countable, not T₀, not metrizable; instance needs `T3Space` | C01 |

- Source locators checked against the text: 18 of 18 (Bo 7, Ga30/31/41 6, Ch 2, So 2, Jo 1), plus the definitions cited in the References (Ch p. 37, KP §3.1 lines 248–253).
- Library declarations opened at the pin: 22 Mathlib names by `#check` or `#print` (two resolve only with their namespace, N01); `Counterexamples/SorgenfreyLine.lean`, `Counterexamples/Omega1Space.lean`, `Archive/Kuratowski.lean` and `Archive/Examples/Kuratowski.lean` read, their contents as the scope section says; both imports fail at the pin as stated.
- Cross-roadmap citations: none in the README; nothing to resolve.
- Elaboration of `TauCetiRoadmap/SorgenfreyLineAndClassicalCounterexamples/Suggested.lean`: ten `sorry` warnings and nothing else. Elaborated signatures compared with the README statements: no binder lost, no difference.
- One-tactic probe (`infer_instance`, `simp`, `simp_all`) on all ten theorems: none closes. All ten headline theorems of the README are stated; none is absent, none is a stand-in.
- Dependency check: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no UPWARD or CYCLE line. The automatic checks all passed.
- No change outside the roadmap folder.
- Overlap check: the three closest-roadmap lists are empty; a search of main and the open heads for Sorgenfrey, Niemytzki, tangent disc and closure–complement finds only this roadmap; pinned Mathlib (outside `Counterexamples` and `Archive`) and Tau Ceti have none of the objects; nothing shared.

Source independence: 20 passages compared with 8 texts (Bo, Ch, Ga30, Ga31, Ga41, Jo, KP, So), none shared; largest share Bo, 7 of 18 locators; contents compared with Bo (its Sections 1–5 on the boundary and border extensions): independent, Layer 3 corresponds to no run of its sections.

Research link: Layer 1 is Sorgenfrey's 1947 answer to Dieudonné's question on products of paracompact spaces; Layer 2 is the space studied by Chodounský 2007 and used by Kalemba–Plewik 2017; Layer 3 is the base case of the Kuratowski-monoid classification of Gardner–Jackson and Bowron 2024. Rests on the README's references and the texts read.

## Not verifiable

- none

## Source issues

- **Misprint** in Bo at §2.1, p. 2 (the list of Kuratowski's four closure axioms): the source says closure is below the identity operator; it should be the identity below closure; affects nothing.
- **Misprint** in Ga30 at Example 3, p. 5: the source says the set `C` is a union of intervals whose left endpoint is written with a capital letter; it should be the lower-case endpoint `a_α` of the cover; affects nothing.
- **Misprint** in KP at the abstract and key words, p. 1: the source says "Songefrey plane"; it should be "Sorgenfrey plane"; affects nothing.

## For the human reviewers

- **Scope.** The headline theorems of Layers 1 and 2 are textbook facts; 6 of 18 locators are to lecture notes on Munkres' textbook (Ga30, Ga31, Ga41), the rest to refereed papers (So, Jo, Ch, Bo). Whether this is within the project's scope is yours to decide.
- **Licence / reuse.** Mathlib's `Counterexamples/SorgenfreyLine.lean` and `Archive/Kuratowski.lean` (not importable at the pin) formalise the Sorgenfrey line and the bound 14; names, carriers and statements in `Suggested.lean` differ from both (new type without order, `Set.encard`, any `ClosureOperator`).
