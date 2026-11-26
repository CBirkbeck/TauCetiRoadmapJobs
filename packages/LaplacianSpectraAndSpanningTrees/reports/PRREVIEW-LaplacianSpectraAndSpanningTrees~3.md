# Review of LaplacianSpectraAndSpanningTrees (pull request #3063 at 4391d5a)

**Verdict:** accepted

**Summary.** Accepted: this is an incremental re-review of the 95 lines changed since `78f553d`, and the three remarks of the previous review (one small correction, two format notes) are all repaired without introducing a new problem. The two minor statements of 11.3 now elaborate with no finiteness or decidability assumption on the ambient graph and remain true at that generality; `Suggested.lean` elaborates with `sorry` as its only warning. There are no findings, no small corrections and no format notes. The questions left to the human reviewers are those of the previous review (unread sources, the status of two sources, the two prospective owners of graph minors).

## Questions for the author

- [BH] page numbers (carried over, untouched text). This README cites Proposition 3.9.1 at p. 50 and Corollary 3.9.2 and Proposition 3.9.3 at p. 51; LaplacianEigenvaluesOfGraphs 4.1 and 4.2 cite the same two results at p. 58 and §3.9 at p. 57. Do the two roadmaps use different printings? No legal copy of either could be read.
- 6.2 (carried over, untouched text) says that [NP, Remark 2.7.6, p. 92] prints `2π` for `π`. The bound with `π` is right (equality on `P₄`); whether the book prints `2π` could not be checked, the text being paywalled.

## Previous findings

The previous review, of `78f553d`, had no finding (R); its small correction and format notes are accounted for here.

- C01 — repaired: `omit [Fintype V] [DecidableEq V] [DecidableRel G.Adj] in` now precedes `IsMinor.of_injective` and `IsMinor.trans` (`Suggested.lean` lines 750 and 756); both elaborate as `∀ {V} (G : SimpleGraph V) {W} …` with no instance argument.
- N01 — repaired: Conventions now reads "A definition of a minor as a contraction of a subgraph, proposed for Mathlib, is prior art for 11.3"; no pull-request number and no claim about argument order remain in the README.
- N02 — repaired: the closing heading of `Suggested.lean` is the plain comment `-- Library declarations consumed` (line 865).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 11.3 `IsMinor.of_injective`, now for arbitrary `V` (sampled) | `K₂ →g` two-way infinite path; empty `W`; `C₆ →g K₂` (not injective) | branch sets `{f 0}`, `{f 1}`: disjoint, singletons connected, edge by `f`; empty model exists; `C₆` needs 6 nonempty disjoint sets in 2 vertices: none | true | none |
| 11.3 `IsMinor.trans`, now for arbitrary `V` | `K₃ ≤ C₅ ≤` Petersen; infinite `G`; `W` empty with `U` nonempty; `W = U = ∅` | unions `{v₁}`, `{v₂}`, `{v₃,v₄,v₅}`; union of branch sets over a connected `C_k` is connected, no finiteness used; hypothesis `H.IsMinor K` false; empty model | true | none |
| 11.3 minor monotonicity (cites the changed definitions; statement untouched) | `2K₁ ≤ K₂`; `K₃ ≤ C₄` | `μ = 1 ≤ 1`; `μ(K₃) = 2 ≤ μ(C₄)` with `μ(C₄) = 2` | true | none |

The rows for all other statements stand as in the previous review, of `78f553d`; the diff changes no other statement.

- Source locators checked against the text: 0 new; the diff adds or changes no locator. The sampled sections other than 11.3 are untouched, and 11.3's locators ([BH], [NP]) are unreadable as before.
- Library declarations opened at the pins: none new; the 61 `#check` lines still elaborate.
- Cross-roadmap citations resolved: the diff turns the plain names GraphSpectra, LaplacianEigenvaluesOfGraphs, KernelsAndSpectralMethods and ElectricalNetworksAndRandomWalks into relative links (three each); all four folders, and the nine other linked roadmaps, exist on main with a `README.md`, and the sections 1.1, 1.5, 2.1, 7.1 named beside the new links exist there under the cited subjects.
- Dependency check: `depcheck: 101 roadmaps, 1129 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration: `sorry` the only warning (48 declarations, as the description says). `#check @` types of the two changed theorems compared with README 11.3: the README states both without finiteness ("Minors in steps" alone says "For finite `V`"), and the Lean now agrees.
- One-tactic probe: not repeated; the diff changes binders only, and the previous probe (none of the 48 closes) stands.
- Pull request text against the head: title and description still describe the head (new roadmap, 12 layers, 30 subsections, 48 `sorry`, suppliers on main, minors defined in 11.3). The description still names the Mathlib pull request as prior art, which the README no longer does by number; nothing in it is contradicted.
- Headline theorems: unchanged; all stated, as in the previous review.

Overlap check: read LaplacianEigenvaluesOfGraphs, GraphSpectra, SpectralGraphBounds, CharacteristicPolynomialsAndStarComplements, ElectricalNetworksAndRandomWalks (scopes as in the previous review; the changed passages add no object); nothing shared. No open pull request changes this roadmap or drops an id it cites. Outside the lists, SurfaceTopology's open head carries a signature for minors of simple graphs; see the human reviewers' section.

Source independence: changed passages only: 3 passages compared (the Conventions sentence on minors, the two rewrapped supplier paragraphs) with 1 source (Sp), none shared; they are bookkeeping prose with no source counterpart. Largest share NP, 23 of 94 locators, text not readable; no layer added, removed or reordered, so the arrangement was not compared again.

Research link: The README's sources place the targets in Fiedler's algebraic connectivity, the nodal domain theorems of Davies, Gladwell, Leydold and Stadler, the minor-monotone Colin de Verdière invariant (BH Theorem 7.3.2) and Kurasov's 2024 spectral geometry of metric graphs; expander graphs are named as a consumer. Rests on the README.

## Not verifiable

- [BH, Theorem 7.3.1 and §7.2] and [NP, Definition 1.1.25 (c)], the locators of the sampled section 11.3: no legal copy readable (unchanged from the previous review, as for [Ba], [Ch], [CRS], [GR], [Bi], [Mo], [Ku]).
- That the definition "proposed for Mathlib" in Conventions is a contraction of a subgraph: the proposal was not opened in this round; the sentence no longer asserts anything about its argument order.

Automatic checks set aside as false positives: three mentions of SurfaceTopology were read as citations of a roadmap that may not supply, but they are two boundary sentences and one line of "Beyond this roadmap", and nothing is consumed from it; two Mathlib names ending in a prime (`SimpleGraph.lapMatrix_mulVec_apply'`, `SimpleGraph.lapMatrix_toLinearMap₂'`) were read as names this roadmap claims to declare, but they are library declarations and both elaborate.

## Source issues

- none

## For the human reviewers

- **Not tested.** [NP] has the largest share of the locators (23 of 94); its text was not read, and wording was compared with [Sp] only. [Ba], [BH], [CRS], [GR], [Ch], [Bi], [Mo], [Ku] were not read either.
- **Licence.** [Sp] is an unpublished author manuscript ("Incomplete Draft", Sp line 6); it is the only source for the edge-probability theorem of 3.2.
- **Licence.** [Ku] is cited by locator only; whether the publisher's copy is open access was not settled.
- **Scope.** SurfaceTopology's open head gives `SimpleGraph.IsMinor` as a signature in its Layer 10; this roadmap defines minors in 11.3 (`Suggested.lean` line 747). Which of the two keeps the object is the project's decision.
- **Scope.** SurfaceTopology is still named as a boundary (README lines 1261–1263) and in "Beyond this roadmap" (line 1388); whether that name may appear at all is the project's decision.
