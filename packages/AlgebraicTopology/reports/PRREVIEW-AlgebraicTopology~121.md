# Review of AlgebraicTopology (pull request #1652 at db70d31)

**Verdict:** needs changes

This is an incremental re-review of the 36 lines of `TauCetiRoadmap/AlgebraicTopology/README.md` changed since 971f80a. `Suggested.lean` is unchanged.

The folder itself has no open finding. One P3 from the previous review is carried, and it is about the pull request's title and description, not the README. Nothing blocks.

## R01 (P3) — The title and description are stale, no order is stated against the conflicting pull requests, and DGFloerPartII §1.0 still owns §4.8's coreflection identification

**Location.** The pull request title "AlgebraicTopology: compact Cech pairs and relative cup modules" and its description ("Add a compact-metric Čech construction … This amendment changes only README mathematics; existing Lean modules are unchanged"), quoted in `scratch/pull-request.md`. The description is unchanged since the previous review apart from the paragraph "Carries #1663".

**Claim.** The text describes a different head; it names no order with the pull requests that conflict in this folder; and the double ownership of the compact-generation identification is resolved only on this roadmap's side.

**Witness.**
- `README.md:189`–`:190` puts "Compact closed-pair Čech theory, continuity and cube-module extensions" outside this roadmap, and `git diff --stat origin/main...HEAD` shows nine files changed with 5648 deletions, seven of the folder's Lean modules among them.
- The overlaps list (index of 2026-11-09) reports that #1187, #1797, #1807, #1808 and #1854 conflict with this head in `TauCetiRoadmap/AlgebraicTopology/README.md` or `Suggested.lean`.
- DGFloerPartII at the head of #1799 (9de4d712), `README.md:484` (§1.0) and `:503`–`:505`: Mathlib's `GeneratedByTopCat.adj` "transports to a right adjoint" named `compactlyGeneratedToTop_isLeftAdjoint`, declared at its `Suggested.lean:106`. This head owns the same identification at `README.md:161`–`:164` and §4.8 (`:1765`–`:1790`). DGFloerPartII consumes this roadmap (its `:443`, `:511`, `:664`, `:693` cite Stage 4.4), so it is the one that must cite §4.8.

**Repair.** In the pull request text, not the README (which rightly names no pull-request numbers):
1. Retitle, and rewrite the description to what the head does: the Layer form at Tau Ceti 2fd255d9 and Mathlib 1b1ccf4b, the seven deleted modules, §§6.6 and 8.13–8.16, the two Hurewicz headlines, Mathlib's coreflection consumed in §4.8, Hausdorffness of Mathlib's projectivization owned in §4.6.
2. State the order: this pull request first; then #1797, #1807, #1808 and #1854 rebased onto it (they edit the modules this head deletes); #1187's Tau Ceti revision is an ancestor of 2fd255d9 and is superseded for this folder.
3. State that DGFloerPartII §1.0's coreflection identification, convenient products, exponential law and pointed suspension–loop adjunction become citations of AlgebraicTopology §4.8 when this merges, and that its `compactlyGeneratedToTop_isLeftAdjoint` is then the transported `GeneratedByTopCat.adj` of §4.8.

I found no repair report for the previous round on the board, so I cannot tell whether this was answered as not actionable in the package. If it was, with the reason that a folder repair cannot edit the pull request text, that reason is correct and the finding is settled; the three sentences above are then all that is left for whoever can edit the description.

## Previous findings

- R01 — not repaired: title "compact Cech pairs and relative cup modules"; description still says "Add a compact-metric Čech construction … existing Lean modules are unchanged"; no order against #1187, #1797, #1807, #1808, #1854; no DGFloerPartII §1.0 sentence. Carried as R01.
- R02 — repaired: `README.md:1656`–`:1665` "Prove that Mathlib's quotient topology on `Projectivization ℝ (Fin (n+1) → ℝ)` is Hausdorff … the Hausdorff criterion for open quotient maps (`t2Space_iff_of_isOpenQuotientMap`) applies"; named in *Needs:* `:1638`–`:1640` and the supplier bullet `:716`–`:722`; two Checks `:1691`–`:1698`. No new problem introduced.

## Verified sound

**The changed passages (36 lines, four hunks, all for the previous R02).**
- Supplier bullet `:716`–`:722`. At Mathlib 1b1ccf4b: `Projectivization.isOpenQuotientMap_mk'` is at `Topology/Algebra/Projectivization.lean:83`, under `variable [ContinuousConstSMul Kˣ V]` (`:77`); `t2Space_iff_of_isOpenQuotientMap` is at `Topology/Separation/Hausdorff.lean:171`, stating `T2Space Y ↔ IsClosed {q : X × X | π q.1 = π q.2}` for `h : IsOpenQuotientMap π`. "Mathlib states no Hausdorff instance on this topology" is true: the Mathlib file has no `T2Space`, and a scratch probe `example (n : ℕ) : T2Space (ℙ ℝ (Fin (n+1) → ℝ)) := by infer_instance` with only `import Mathlib` fails to synthesize.
- §4.6 proof route `:1656`–`:1665`. In the same probe, `rw [t2Space_iff_of_isOpenQuotientMap Projectivization.isOpenQuotientMap_mk']` elaborates on Mathlib's instance for `Fin (n+1) → ℝ`, so the `ContinuousConstSMul ℝˣ` hypothesis is found and the route's first step is available at the pin. The remaining goal is closedness of the same-line relation, which is the common zero set of the continuous minors `v_i w_j − v_j w_i` on pairs of nonzero vectors: for nonzero v, w all minors vanish exactly when w is a multiple of v, and that multiple is then a unit. "Tau Ceti's argument repeated on Mathlib's instance" matches Tau Ceti 2fd255d9 `Topology/Algebra/Projectivization.lean:188`–`:197` (`instT2Space`, same criterion, minors `f v * g w = f w * g v` over `StrongDual`, hypotheses `[T2Space K] [ContinuousMul K] [ContinuousConstSMul Kˣ V] [SeparatingDual K V]`); coordinate functionals separate points of `Fin (n+1) → ℝ`, so replacing the separating dual by them loses nothing.
- *Needs:* line `:1638`–`:1642` names both declarations; the homeomorphism sentence `:1665`–`:1668` now maps "onto that Hausdorff space".
- Remark, no change asked: the bullet paraphrases `ContinuousConstSMul Kˣ V` as "a continuous action of the units on V"; the pinned hypothesis is continuity of each unit's action, which is weaker and is what the route uses.

**Adversarial table.** The changed statement and its Checks are computed here; every other row is carried unchanged from the report on 971f80a (its "Adversarial table", 45 rows from "1.3/1.4 native presentations" to "8.15", all "holds" except the 4.6 Hausdorffness row replaced below), since the diff touches none of those statements.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 4.6 Mathlib's projectivization topology is Hausdorff | n=0; n=1 with v=(1,2), w=(2,4); v=(1,0), w=(0,1); v=(1,0), w=(−1,0) | n=0: no minor with i≠j, relation is everything, ℙ is one point, Hausdorff; (1,2),(2,4): 1·4−2·2=0, same line; (1,0),(0,1): 1·1−0·0=1≠0, distinct; ±(1,0): 1·0−0·(−1)=0, same point | holds |
| 4.6 Check "needs the nonzero vectors" | ℝ^(n+1) modulo ℝˣ with the origin kept; n=0 | a saturated open U∋0 contains a ball B(0,r); for v≠0, (r/2‖v‖)v ∈ U and lies in the class of v, so every saturated open set about [v] meets U: not Hausdorff; n=0: two classes, {0} and ℝ∖{0}, with opens ∅, {ℝ∖{0}} and the whole space: the Sierpiński space, not Hausdorff | holds |
| 4.6 homeomorphism RPⁿ → ℙ ℝ (Fin (n+1) → ℝ) | n=1; wrong model without T2 | v↦[v] on S¹ identifies exactly ±v (unit vectors on one line), so it is a bijection from the compact quotient; with the target Hausdorff the closed-map argument applies; onto a non-Hausdorff target a continuous bijection from a compact space need not be open | holds |
| 4.6 RPⁿ incidences (untouched text in the changed paragraph) | RP², k=1,2 | 1+(−1)^k: 0 for k=1, 2 for k=2, the ±2/0 pattern stated | holds (carried) |

**Sampled locators.** None of the fifteen seeded targets (1.4, 1.6, 2.1, 2.5, 3.2, 4.1, 4.8, 5.1, 5.5, 6.6, 7.3, 8.5, 8.7, 8.8, 8.10) lies in a changed passage, and the diff adds no source locator; the previous report's locator table stands. The one locator inside the edited paragraph, Hatcher Example 2.42 p.144, is untouched text.

**Gate, dependencies, build.**
- The worker's gate on db70d31 printed every counter at 0, `build=0` and "OK" (`scratch/gate.md`); my run of the gate from the worktree printed the same counters and "OK".
- Dependency check output: `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `lake env lean TauCetiRoadmap/AlgebraicTopology/Suggested.lean` from the worktree: exactly 16 "declaration uses `sorry`" warnings (lines 108 to 371), nothing else, 45 s. The file is byte-identical to the one the previous review probed (one-tactic probe: none of the 16 closes; `#check @` on all 24 declarations matched the README), so those results carry.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AlgebraicTopology'` is empty; `git merge-tree --write-tree origin/main HEAD` returns a tree with no conflict; the branch manifest pins Tau Ceti 2fd255d9 and Mathlib 1b1ccf4b.
- Headline theorems: unchanged; the 16 stated and the docstring's list of unstatable ones are as verified at 971f80a. The Hausdorffness of §4.6 is a route step, not a headline, and is rightly not added to `Suggested.lean`.

**Library declarations opened at the pins (4).** Mathlib `Topology/Algebra/Projectivization.lean:44`, `:47`, `:56`, `:77`–`:84`; Mathlib `Topology/Separation/Hausdorff.lean:171`–`:178`; Tau Ceti `Topology/Algebra/Projectivization.lean:163`–`:197`.

**Cross-roadmap citations and overlaps.**
- The diff adds no cross-roadmap citation. The worker's resolve run lists no missing citation; its one lead, `Singular.BrouwerFixedPoint` at README 393, is a module name (`Singular/BrouwerFixedPoint.lean` exists at the pin), as the previous review found.
- Overlaps: no cited id is dropped by an open pull request and none is defined only by an open revision. The four `stage-k` anchors that other roadmaps cite are mapped by the README's "Stage k is Layer k" table, verified in the previous review and untouched. The conflicting heads are R01.
- ComplexKahlerGeometry K7, named in the edited paragraph as taking the topology from Mathlib, is on main; the sentence is untouched.
- Ownership against #1187, #1797, #1807, #1808 and #1854 was not checked beyond the conflict facts of the overlaps list: the brief gives no files for them.

## Not verifiable

- **May, *Simplicial Objects*** (4.7, 8.2): image-only scan, no OCR on this worker; carried from the previous review, not touched by this change.
- The other items of the previous report's list (Conway–Friedl–Herrmann published pages, the uncertified manifest entries, the chapter-level citations without a manifest copy, Moore 1955 legibility) stand unchanged; none is in a changed passage.
- Whether a repair report answered the previous R01 as not actionable: no repair report is on the board for this round.

## Source issues

- none
