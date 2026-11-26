# Review of FreeGroupsAndLimitGroups (pull request #3170 at 57376f9)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 22 changed lines since `87e7f72`. Checked: the new part (4) of §5.12, its route, its new Check and *Needs:* entries, and the new target `coordGroup_iso_iff_wordMap_iso`. The anti-equivalence and the isomorphism criterion are true for an arbitrary coefficient map, empty algebraic sets included, and the cited Tau Ceti declarations exist at the pin without nonemptiness or injectivity hypotheses. Accepted, with no findings, three small corrections and one format note, none blocking. The corrections: the new target is stated on the file's own copies of the coordinate-group carriers, which the two earlier revisions of this roadmap delete; the supplier contracts omit the new Tau Ceti inputs; and one sentence of the description does not hold for this folder. One licence question about a source host is left for the human reviewers.

## C01 — The new target is stated on the file's own copies of `G[X]`, evaluation, algebraic sets and coordinate groups, not on the Tau Ceti carriers that the route of (4) cites

An implementer can't apply the cited declarations to `coordGroup_iso_iff_wordMap_iso` as it stands. The route of §5.12 (4) (README line 1359) works with `TauCeti.GroupAlgGeom.CoordGroup`, `V` and `wordMap`. The Lean statement (Suggested.lean line 777) uses `GX`, `evalAt`, `algSet` and `CoordGroup`, which are defined locally at lines 677–698. Tau Ceti has the same objects at `GroupTheory/GroupAlgGeom/Basic.lean:215`, `:229` and `:319` and at `AlgebraicSet.lean:96`, `:305`, `:470` and `:477`. The two revisions of this roadmap that come before this one in the stated merge order (#2205 and #2221) remove the local copies: their `Suggested.lean` opens `TauCeti.GroupAlgGeom` and defines neither `evalAt` nor `algSet`. So the statement has to be rewritten when this pull request is rebased onto them.

The smallest repair is to state it on Tau Ceti's carriers. With `import TauCeti.GroupTheory.GroupAlgGeom.AlgebraicSet` and `open TauCeti.GroupAlgGeom`, the following elaborates at the pin with only the `sorry` warning:
`(∃ e : CoordGroup ι T ≃* CoordGroup ι S, (e : CoordGroup ι T →* CoordGroup ι S).comp (CoordGroup.coeff ι T) = CoordGroup.coeff ι S) ↔ ∃ (w : Y → GX G X) (w' : X → GX G Y), Set.MapsTo (wordMap ι w) (V ι S) (V ι T) ∧ Set.MapsTo (wordMap ι w') (V ι T) (V ι S) ∧ Set.EqOn (wordMap ι w' ∘ wordMap ι w) id (V ι S) ∧ Set.EqOn (wordMap ι w ∘ wordMap ι w') id (V ι T)`.

## C02 — The Tau Ceti declarations that §5.12 (4) consumes are missing from the README's Tau Ceti supplier contracts

`### From Tau Ceti` (README lines 127–133) lists every other Tau Ceti name the README uses, so a reader of the contracts would conclude that Layer 5 takes nothing from Tau Ceti. The change adds four inputs in the route and in the *Needs:* line (lines 1359 and 1372): `CoordGroup.exists_wordMap_representation` and `CoordGroup.homOfMapsToWordMap_eq_iff` (`TauCeti/GroupTheory/GroupAlgGeom/WordMap.lean`, lines 36 and 64), and `CoordGroup.homOfMapsToWordMap_mk` and `CoordGroup.gHom_ext` (`AlgebraicSet.lean`, lines 575 and 522).

One bullet would repair it. It would name these four with their files and say what is assumed: for any coefficient map and possibly empty algebraic sets, every coefficient-preserving homomorphism of coordinate groups comes from a tuple of words, and two tuples give the same homomorphism exactly when their word maps agree on the source.

## C03 — The description says data is listed in `Suggested.lean` as not statable, which is not so for this folder

The description reads "data (categories, functors, equivalences) is listed there as not statable". For this folder, the module docstring of `Suggested.lean` (lines 4–24) does not mention the category of algebraic sets with word maps or the contravariant functor `Γ` that §5.12 (4) plans. Its list of heavy constructions (line 21) names graphs of groups, Bass–Serre trees, generalised equations, JSJ decompositions, Makanin–Razborov diagrams and infinite words. The author could add "the category of algebraic sets with word maps and the coordinate-group functor `Γ` (§5.12 (4))" to that bullet. Alternatively, the description could say that for FreeGroupsAndLimitGroups these stay README targets.

## N01 — In the route and the *Needs:* line of §5.12 (4) (lines 1359 and 1372), `homOfMapsToWordMap_mk` and `gHom_ext` appear without a namespace

`gHom_ext` exists at the pin in three namespaces (`CoordGroup`, `SystemGroup`, `GX`). Writing `TauCeti.GroupAlgGeom.CoordGroup.gHom_ext` and `TauCeti.GroupAlgGeom.CoordGroup.homOfMapsToWordMap_mk` would remove the ambiguity.

<details><summary>What was checked</summary>

- Previous review: the previous AI review of this folder raised no findings, so nothing carried forward. No layer, item or heading of the README at `87e7f72` is removed or retitled. The *Needs:* line of §5.12 keeps its three section citations.
- Seeded sample: no sampled target lies in the changed passage. Sections 6.x, 10.x, 11.1, 11.3 and 11.5–11.6 cite §5.12 for parts (1)–(3), which the change leaves as they were. §11.2 does not cite §5.12. The cited IFT §2.4, pp. 5–6, was read at IFT lines 214–235.
- Automatic checks: elaboration of `Suggested.lean` exits 0 with 87 warnings, each "declaration uses `sorry`", and no errors. The dependency check, which confirms that every supplier this roadmap cites comes earlier in the merge order and that no roadmaps cite each other in a cycle, read 122 roadmaps and 1390 supplier edges and found no problem: no upward supplier and no cycle.
- Untouched text flagged by the checks was not raised. This covers the `sorry` proof fields of fourteen `SerreGraph`/`SurfaceModel` definitions, the six theorems that conclude `Nonempty (… ≃* …)` or `Nonempty (… ≃+ …)`, and the Mathlib pull-request link at README line 26. All of it is on `main`, and #2205, which precedes this pull request in the stated order, removes all of it (checked at its head and at the head of #2221).
- Order: #2205 and #2221 conflict with this head in `Suggested.lean`. The description fixes the order #2205 → #2221 → this pull request.
- Automatic checks set aside as false positives: the check that every backticked name the README presents as this roadmap's own is declared in `Suggested.lean` flagged `TauCeti.GroupAlgGeom.CoordGroup.exists_wordMap_representation` and `TauCeti.GroupAlgGeom.CoordGroup.homOfMapsToWordMap_eq_iff`. Both are Tau Ceti declarations at the pin (`WordMap.lean` lines 36 and 64), and the README introduces them as Tau Ceti's.
- Not verifiable: ALG §3.5 (Theorem 4, Corollary 9). The sources service did not accept the README's link as an author's page, so the changed passages were not compared with it.

</details>

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `coordGroup_iso_iff_wordMap_iso`, both systems inconsistent | `ι g ≠ 1`, `S = {g}` in `G[X]`, `T = {g}` in `G[Y]` | Both radicals are everything, so `Γ(S) = Γ(T) = 1` and an isomorphism exists. Any `w`, `w'` work because the maps are vacuous on `∅`. True ↔ true | holds | none |
| same, one side empty | `S` inconsistent, `V(T) ≠ ∅` | `Γ(S) = 1`; `g` with `ι g ≠ 1` survives in `Γ(T) ≠ 1`. No map from nonempty `V(T)` into `∅`. False ↔ false | holds | none |
| same, trivial `ι` | `X = Unit`, `T = {x}`; `X' = ∅`, `S = ∅` | Every system is solved by `1`, so there are no empty sets. Both sets are single points and both coordinate groups are `1`. True ↔ true | holds | none |
| same, automorphism | `G = H = F(a,b)`, `S = T = {[x,a]}`, `w = x a`, `w' = x a⁻¹` | `V = ⟨a⟩`, `a^k ↦ a^{k±1}`, and both composites are the identity. `x ↦ x a` is an `F`-automorphism of `F ∗_{⟨a⟩} ℤ²`. True ↔ true | holds | none |
| same, negative control | `S = ∅` in one variable (`V = F`), `T = {[x,a]}` (`V = ⟨a⟩`) | `Γ(S) = F ∗ ⟨x⟩` free, `Γ(T) ⊇ ℤ²`. A word map on `⟨a⟩` reaches `O(n)` words of length `≤ n`, `F` has about `3ⁿ`. False ↔ false | holds | none |
| Check of (4), `X` empty | `G = H = F`; general `ι` | `H^∅` a point, terminal. `Γ = G/ker ι ≅ ι(G)` maps uniquely to each `Γ(S)`; not initial under `G` (target `id_G`) for non-injective `ι` | holds | none |
| Check of (4), inconsistent system | `S = {g}`, `ι g ≠ 1` (`V_singleton_inl_eq_empty`, AlgebraicSet.lean:234) | `V = ∅`: one function to each `V(T)` (constant tuple `1`). `Γ = 1`, terminal under `G`, its coefficient map non-injective | holds | none |
| (4): restriction gives (2) | `ι` injective, `V(S) ≠ ∅` | `CoordGroup.coeff_injective` (AlgebraicSet.lean:529) makes `Γ(S)` a `G`-group, so this is a full subcategory | holds | none |
| Route of (4): hypotheses of cited declarations | WordMap.lean:30–31, 36, 64 | The variable block has only `[Group G] [Group H]`, `ι`, `S`, `T`. No nonemptiness or injectivity | holds | none |
| One-tactic probe of the new target | `first \| simp \| rfl \| infer_instance \| aesop` on a copy of the file | Leaves an open goal (`simp` only regroups the existentials) | not padding | none |

- Changed lines read: 20 inserted, 2 deleted, in `README.md` §5.12 and `Suggested.lean` lines 772–786. No layer is added, removed or renumbered.
- Library declarations opened at the Tau Ceti pin `2fd255d`: `GroupAlgGeom/WordMap.lean:36, 64`; `AlgebraicSet.lean:96, 101, 234, 305, 470, 477, 522, 529, 547, 568, 575, 682`; `Basic.lean:215, 229, 290, 319, 330`; `ChangeOfCoordinates.lean:102`. This last is the only `≃*` of coordinate groups in Tau Ceti and covers only bijective changes of coordinates, so Tau Ceti does not already prove the new target.
- Source locators read: IFT lines 214–235 (§2.4: points ↔ `G`-homomorphisms from `G_{R(S)}`; `R(S) = G[X]` when `V = ∅`) and 252–253.
- Elaborated signature: `#check @coordGroup_iso_iff_wordMap_iso` shows `G`, `X`, `Y`, `H`, `ι`, `S` and `T`, with none lost, matching README (4). The proposed Tau Ceti restatement in C01 elaborates.
- Cross-roadmap citations: the change adds none, and none of the README's is unresolved on main or at the open heads.
- Dependency check (every cited supplier earlier in the merge order, no cycle): 122 roadmaps and 1390 supplier edges read, no problem found.

Overlap check: read SurfaceTopology, FinitenessAndDualityOfGroups and GeometricTopology (open), and SequentCalculusAndCutElimination, GraphConnectivityAndFlows and RandomGraphs (main). None of them owns algebraic sets, coordinate groups or word maps over groups. A search of main and the open heads for "coordinate group" and "algebraic set" finds only unrelated uses (FunctionFieldArithmeticPartII, SpecialFunctionsGroupModels, ExponentialSumsAndCircleMethodPartII). Nothing is shared, and FreeGroupsAndLimitGroups (Layer 5) is the single owner.

Source independence: changed passages only. 5 passages (statement (4), route (4), the new Check, the extended *Needs:* line, the docstring of `coordGroup_iso_iff_wordMap_iso`) were compared with 1 source (IFT §2.4, lines 214–253), with no shared wording. ALG §3.5 was not read. The largest share is IFT, 59 of 294 bracketed source citations, unchanged by the diff. No layer was added, removed or reordered, so the arrangement was not compared.

Research link: §5.12 is the Baumslag–Myasnikov–Remeslennikov correspondence between algebraic sets and coordinate groups (ALG, 1999). It underlies the README's headlines on coordinate groups of irreducible algebraic sets as limit groups (Layer 8) and Kharlampovich–Myasnikov's implicit function theorem (IFT, 2005, §2.4) (Layer 11). This rests on the README summary and references, and on IFT lines 214–253.

## Not verifiable

- ALG (Baumslag–Myasnikov–Remeslennikov 1999), §3.5, Theorem 4 and Corollary 9, cited for §5.12 (2). The README's link is on web.stevens.edu, and the sources service refused it as not shown to be an author's page. No other copy was sought. The changed passages cite no ALG locator.

## Source issues

- none

## For the human reviewers

- ALG's only cited copy is at web.stevens.edu/algebraic/alexeim/… (README line 2788). The sources service could not classify that host as an author's page, so the licence of the copy is unsettled. It is cited 15 times in the README, §5.12 among them.
