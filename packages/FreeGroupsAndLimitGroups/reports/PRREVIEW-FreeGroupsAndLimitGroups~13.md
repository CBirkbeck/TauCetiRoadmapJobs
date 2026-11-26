# Review of FreeGroupsAndLimitGroups (pull request #3170 at f17d28c)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 22 changed lines since `87e7f72`. Checked: part (4) of §5.12 with its route, its new Check and its *Needs:* entries, and the new target `coordGroup_iso_iff_wordMap_iso`; the folder's text is identical to the head the previous review read. The anti-equivalence and the isomorphism criterion hold for an arbitrary coefficient map, empty algebraic sets included, and the four cited Tau Ceti declarations exist at the pin with no nonemptiness or injectivity hypothesis. Accepted, with no findings, three small corrections and two format notes, none blocking; the three corrections and the first format note are those of the previous review and are not yet taken up. One licence question about a source host is left for the human reviewers.

## C01 — The new target is stated on the file's own copies of `G[X]`, evaluation, algebraic sets and coordinate groups, not on the Tau Ceti carriers that the route of (4) cites

An implementer cannot apply the cited declarations to `coordGroup_iso_iff_wordMap_iso` as it stands. The route of §5.12 (4) (README line 1359) works with `TauCeti.GroupAlgGeom.CoordGroup`, `V` and `wordMap`; the Lean statement (Suggested.lean line 777) uses `GX`, `evalAt`, `algSet` and `CoordGroup` as defined locally at lines 677–698. Tau Ceti has the same objects at `GroupTheory/GroupAlgGeom/Basic.lean:319` (`wordMap`) and `AlgebraicSet.lean:96` (`V`), with `CoordGroup` and its coefficient map `CoordGroup.coeff` in the same file. The two revisions of this roadmap that precede this one in the stated merge order (#2205 and #2221) remove the local copies: at both heads `Suggested.lean` imports `TauCeti.GroupTheory.GroupAlgGeom.AlgebraicSet`, opens `TauCeti.GroupAlgGeom` and defines none of `GX`, `evalAt`, `algSet`, `CoordGroup`. So the statement has to be rewritten when this pull request is rebased onto them.

The smallest repair is to state it on Tau Ceti's carriers. With `import TauCeti.GroupTheory.GroupAlgGeom.AlgebraicSet` and `open TauCeti.GroupAlgGeom`, the following elaborates at the pin with only the `sorry` warning:
`(∃ e : CoordGroup ι T ≃* CoordGroup ι S, (e : CoordGroup ι T →* CoordGroup ι S).comp (CoordGroup.coeff ι T) = CoordGroup.coeff ι S) ↔ ∃ (w : Y → GX G X) (w' : X → GX G Y), Set.MapsTo (wordMap ι w) (V ι S) (V ι T) ∧ Set.MapsTo (wordMap ι w') (V ι T) (V ι S) ∧ Set.EqOn (wordMap ι w' ∘ wordMap ι w) id (V ι S) ∧ Set.EqOn (wordMap ι w ∘ wordMap ι w') id (V ι T)`.

## C02 — The Tau Ceti declarations that §5.12 (4) consumes are missing from the README's Tau Ceti supplier contracts

`### From Tau Ceti` (README lines 126–133) lists every other Tau Ceti name the README uses, so a reader of the contracts concludes that Layer 5 takes nothing from Tau Ceti. The change adds four inputs in the route and the *Needs:* line (lines 1359 and 1372): `CoordGroup.exists_wordMap_representation` and `CoordGroup.homOfMapsToWordMap_eq_iff` (`TauCeti/GroupTheory/GroupAlgGeom/WordMap.lean`, lines 36 and 64), and `CoordGroup.homOfMapsToWordMap_mk` and `CoordGroup.gHom_ext` (`AlgebraicSet.lean`, lines 575 and 522).

One bullet would repair it: name the four with their files and say what is assumed, namely that for any coefficient map and possibly empty algebraic sets every coefficient-preserving homomorphism of coordinate groups comes from a tuple of words, and two tuples give the same homomorphism exactly when their word maps agree on the source algebraic set.

## C03 — The description says data is listed in `Suggested.lean` as not statable, which is not so for this folder

The description reads "data (categories, functors, equivalences) is listed there as not statable". For this folder, the module docstring of `Suggested.lean` (lines 4–24) does not mention the category of algebraic sets with word maps or the contravariant functor `Γ` that §5.12 (4) plans: its list of heavy constructions (lines 21–23) names graphs of groups, Bass–Serre trees, generalised equations, JSJ decompositions, Makanin–Razborov diagrams and infinite words. The author could add "the category of algebraic sets with word maps and the coordinate-group functor `Γ` (§5.12 (4))" to that bullet, or the description could say that for FreeGroupsAndLimitGroups these stay README targets.

## N01 — In the route and the *Needs:* line of §5.12 (4) (lines 1359 and 1372), `homOfMapsToWordMap_mk` and `gHom_ext` appear without a namespace

`gHom_ext` exists at the pin in more than one namespace of `TauCeti.GroupAlgGeom` (two in `AlgebraicSet.lean` alone, lines 522 and 682). Writing `TauCeti.GroupAlgGeom.CoordGroup.gHom_ext` and `TauCeti.GroupAlgGeom.CoordGroup.homOfMapsToWordMap_mk` removes the ambiguity.

## N02 — Untouched text: the heading `### From Tau Ceti (commit a91d3aa)` (README line 126) names another commit than the pin

The pinned Tau Ceti is `2fd255d`, which is also the commit the description names, and the four declarations §5.12 (4) now cites were checked there. When the bullet of C02 is added, the heading would name the pin, or no commit.

<details><summary>What was checked</summary>

- Previous review: it raised no findings, so none carries forward. Its three small corrections and its format note stand unchanged (C01–C03, N01 above): the folder has not changed since the head it read. No layer, item or heading of the README at `87e7f72` is removed or retitled; the *Needs:* line of §5.12 keeps its three section citations.
- Seeded sample: no sampled target lies in the changed passage. The later sections whose *Needs:* lines cite §5.12 (README lines 1605, 2103, 2593, 2636, 2717, 2765) use parts (1)–(3), which the change leaves as they were. The source the changed section cites, IFT §2.4, pp. 5–6, was read at IFT lines 214–235.
- Automatic checks: `Suggested.lean` elaborates with exit code 0, 87 warnings, each "declaration uses `sorry`", no error. The dependency check (every supplier this roadmap cites is earlier in the merge order, and no roadmaps cite each other in a cycle) reports 113 roadmaps, 1292 edges and 0 problems: no upward supplier, no cycle. Nothing is changed outside the pull request's own folders.
- Untouched text the checks flagged, not raised: the proof fields left as `sorry` in fourteen `SerreGraph`/`SurfaceModel` definitions, six theorems concluding `Nonempty (… ≃* …)` or `Nonempty (… ≃+ …)`, and the Mathlib pull-request link at README line 26. All of it is on `main`, and at the heads of #2205 and #2221, which precede this pull request in the stated order, `Suggested.lean` (289 lines) has none of these declarations and the README no such link.
- Order: #2205 and #2221 conflict with this head in `Suggested.lean`; the description fixes the order #2205 → #2221 → this pull request.
- Automatic checks set aside as false positives: the check that every backticked name the README presents as this roadmap's own is declared in `Suggested.lean` flagged `TauCeti.GroupAlgGeom.CoordGroup.exists_wordMap_representation` and `TauCeti.GroupAlgGeom.CoordGroup.homOfMapsToWordMap_eq_iff`; both are Tau Ceti declarations at the pin (`WordMap.lean` lines 36 and 64), and the README introduces them as Tau Ceti's.
- Not verifiable: ALG §3.5 (Theorem 4, Corollary 9), cited for part (2); the changed passages add no ALG locator.

</details>

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `coordGroup_iso_iff_wordMap_iso`, both systems inconsistent | `ι g ≠ 1`, `S = {g}` in `G[X]`, `T = {g}` in `G[Y]` | Both radicals are everything, `Γ(S) = Γ(T) = 1`, isomorphism exists; any `w`, `w'` work, all four conditions vacuous on `∅`. True ↔ true | holds | none |
| same, one side empty | `S` inconsistent, `V(T) ≠ ∅` | `Γ(S) = 1`; `g` with `ι g ≠ 1` is nontrivial in `Γ(T)`. No function from nonempty `V(T)` into `∅`. False ↔ false | holds | none |
| same, trivial `ι` | `Y = Unit`, `T = {y}`; `X = ∅`, `S = ∅` | Both algebraic sets are one point; both coordinate groups are `1` (`ker ι = G`). True ↔ true | holds | none |
| same, automorphism | `G = H = F(a,b)`, `S = T = {[x,a]}`, `w = x a`, `w' = x a⁻¹` | `V = ⟨a⟩`, `a^k ↦ a^{k±1}`, both composites the identity; `x ↦ x a` an `F`-automorphism of `F ∗_{⟨a⟩} ℤ²`. True ↔ true | holds | none |
| same, negative control | `S = ∅` in one variable (`V = F`), `T = {[x,a]}` (`V = ⟨a⟩`) | `Γ(S) = F ∗ ⟨x⟩` free, `Γ(T) ⊇ ℤ²` not free; no bijection `⟨a⟩ → F` by a word (`Γ(T)` has a non-cyclic abelian subgroup, a free group has none). False ↔ false | holds | none |
| Proof of the criterion from the two cited lemmas | `e`, `e⁻¹` coefficient-preserving | Fullness gives `w`, `w'`; `hom(w)∘hom(w') = id = hom(variables)`, so faithfulness gives composites `= id` on `V`; converse the same backwards | holds | none |
| Check of (4), `X` empty | general `ι` | `H^∅` one point, terminal; `Γ = G[∅]/ker ι ≅ ι(G)`; `ker ι ⊆ Rad(S)` for every `S`, so a unique map to each `Γ(S)` | holds | none |
| Check of (4), inconsistent system | `S = {g}`, `ι g ≠ 1` (`V_singleton_inl_eq_empty`, AlgebraicSet.lean:234) | `V = ∅`: one function to each `V(T)`; `Γ = 1`, terminal under `G`, coefficient map not injective when `G ≠ 1` | holds | none |
| (4): restriction gives (2) | `ι` injective, `V(S) ≠ ∅` | `CoordGroup.coeff_injective` (AlgebraicSet.lean:529) makes `Γ(S)` a `G`-group; full subcategory | holds | none |
| Route of (4): hypotheses of the cited declarations | `#check` of the four names at the pin | Binders are `[Group G] [Group H]`, `ι`, `S`, `T` (and `w`, `hw`, `φ`); no nonemptiness, no injectivity | holds | none |
| One-tactic probe of the new target | `first \| simp \| rfl \| infer_instance \| aesop` on a copy | Unsolved goal remains (the iff with both existentials) | not padding | none |

- Changed lines read: 20 inserted, 2 deleted, in `README.md` §5.12 and `Suggested.lean` lines 772–786; no layer added, removed or renumbered.
- Library declarations opened at the Tau Ceti pin `2fd255d`: `GroupAlgGeom/WordMap.lean:31–32, 36, 64`; `AlgebraicSet.lean:96, 234, 522, 529, 568, 575, 583, 682`; `Basic.lean:319`. The four cited names elaborate under `#check`.
- Source locators read: IFT lines 214–235 (§2.4, pp. 5–6: solutions as `G`-homomorphisms from `G_{R(S)}`; `R(S) = G[X]` when `V = ∅`).
- Elaborated signature: `#check @coordGroup_iso_iff_wordMap_iso` shows `G`, `X`, `Y`, `H`, `ι`, `S`, `T`, none lost, matching README (4). The restatement proposed in C01 elaborates.
- Cross-roadmap citations: the change adds none.
- Elaboration: exit 0, 87 `sorry` warnings, no error. Dependency check: 113 roadmaps, 1292 edges, 0 problems.

Overlap check: read SurfaceTopology, FinitenessAndDualityOfGroups and GeometricTopology (open), and SequentCalculusAndCutElimination, GraphConnectivityAndFlows and RandomGraphs (main); nothing shared. A search of main and the open heads for "coordinate group" and "word map" finds algebraic sets over groups only in this roadmap and its two open revisions; FreeGroupsAndLimitGroups Layer 5 is the single owner.

Source independence: changed passages only. 5 passages (statement (4), route (4), the new Check, the extended *Needs:* line, the docstring of `coordGroup_iso_iff_wordMap_iso`) compared with 1 source (IFT §2.4, lines 214–235), none shared; ALG §3.5 not read. Largest share IFT, 59 bracketed citations, unchanged by the diff; no layer added, removed or reordered, so the arrangement was not compared.

Research link: §5.12 is the Baumslag–Myasnikov–Remeslennikov correspondence between algebraic sets and coordinate groups (ALG, 1999), which underlies the README's results on coordinate groups of irreducible algebraic sets as limit groups (Layer 8) and Kharlampovich–Myasnikov's implicit function theorem (IFT, §2.4; Layer 11). Rests on the README summary and references and on IFT lines 214–235.

## Not verifiable

- ALG (Baumslag–Myasnikov–Remeslennikov 1999), §3.5, Theorem 4 and Corollary 9, cited for §5.12 (2): not among the texts recorded for this roadmap, and its only cited copy is on a host the previous review found the sources service does not accept as an author's page. No other copy was sought. The changed passages cite no ALG locator.

## Source issues

- none

## For the human reviewers

- Licence: ALG, VAR-II, SUBGROUPS and MRS-REGULAR (README lines 2788–2801) are cited from copies at web.stevens.edu/algebraic/alexeim/…, described as authors' copies. The previous review reported the sources service refusing that host; this review did not retry it.
