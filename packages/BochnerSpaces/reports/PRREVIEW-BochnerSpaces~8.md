# Review of BochnerSpaces (pull request #2249 at 1812565)

**Verdict:** needs changes

Incremental re-review of the 3 lines changed since `039c077`.

## R01 (P3) — The new Mathlib input is in neither the supplier contracts nor the §8.3 `*Needs:*` line
**Location:** `TauCetiRoadmap/BochnerSpaces/README.md:1148–1149`: “Use Mathlib's `lp.dualPairing` … and `lp.norm_dualPairing` … for the sum pairing and its norm bound.”; `:1171`: “*Needs:* §3.2, scalar lp.dualEquiv and BanachSpaceTheory B3 and B5; no RNP input.”
**Claim:** The added sentence makes two pinned declarations inputs of §8.3, but `## Exact supplier contracts` (**From Mathlib**, `:88–140`) does not list them and the target's `*Needs:*` line does not name them. Every other Mathlib declaration a layer uses by name is in the contracts.
**Witness:** `README.md:391` uses `Convex.integral_mem`, listed at `:101`; `:881` uses `VectorMeasure.le_variation`, listed at `:112`. `lp.dualPairing` occurs only at `:1148`.
**Repair:** Add a bullet to **From Mathlib**: “[Hölder pairing of sequence spaces][ml-lp-holder] supplies `lp.dualPairing` and `lp.norm_dualPairing`: for conjugate exponents `1 ≤ p, q ≤ ∞`, a family of bilinear maps of norm at most `K` and a complete target, the pairing `(e,f) ↦ ∑' i, B i (e i) (f i)` is bounded with norm at most `K`. Section 8.3 supplies surjectivity and the isometry.”, with the link definition `[ml-lp-holder]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Analysis/Normed/Lp/lpHolder.lean`. Change `:1171` to “*Needs:* §3.2, Mathlib `lp.dualPairing` and `lp.norm_dualPairing`, scalar lp.dualEquiv and BanachSpaceTheory B3 and B5; no RNP input.”

## Previous findings

- R01 — repaired: the description now says “The roadmap also uses BanachSpaceTheory B1–B5 and VonNeumannAlgebras V2. Chapter coverage includes results supplied by these roadmaps and the existing libraries.”

## Verified sound

| Statement | Instances tried | Left / input value | Right / output value | Result | Change |
| --- | --- | --- | --- | --- | --- |
| §8.3: `lp.dualPairing` as the sum pairing | I={1,2}, X=ℝ, B=id on X*, e=(2,−3) in ℓᵖ(I;X*), f=(a₁,a₂) | `dualPairing_apply`: `∑' i, B i (e i) (f i)` = 2a₁−3a₂ | The functional Φ of §8.3 with coordinates (2,−3) | Same pairing, same direction | none |
| §8.3: `lp.norm_dualPairing`, K=1 | Same e; p=q=2, f=(2,−3)/√13; p=1, q=∞, f=(1,−1) | √13 ≤ 1·√13·1; 5 ≤ 1·5·1 | Bound `‖dualPairing‖ ≤ K` with K=1 | Bound holds, attained in both; it gives the contraction only, as “norm bound” says | none |
| §8.3: hypotheses of the pinned declaration | 1<p<∞; p=1, q=∞; I=∅; X=ℂ, one index, e=i, f=1 | Needs `Fact (1 ≤ p)`, `Fact (1 ≤ q)`, `p.HolderConjugate q`, complete target H=𝕜; X need not be complete | README range `1<p<∞` and the pair (1,∞) are covered; I=∅ gives 0; complex value i, not −i | Covers the README's generality; bilinear convention agrees with `exists_lpDualEquiv` | none |

The rows for untouched statements stand as in the previous review, of `039c077`.

- Gate at `1812565`: every check passed (worker's record, targeted build included). Elaboration of `Suggested.lean`: exit 0, 25 `sorry` warnings and nothing else. The diff changes no Lean statement.
- Dependency check: `depcheck: 245 roadmaps, 2232 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Pinned declarations opened: `lp.dualPairing` (`Mathlib/Analysis/Normed/Lp/lpHolder.lean:264`), `lp.dualPairing_apply` (`:269`), `lp.norm_dualPairing` (`:275`). The commit in both new links, `1b1ccf4`, is the Mathlib pin of `lake-manifest.json`, and both line anchors land on the declarations.
- Pull request text: title “Add roadmap BochnerSpaces” is right; the description names both roadmap suppliers; no sentence contradicted by the head. No file changed outside the folder.
- Cross-roadmap citations: the change adds none. Overlap tooling: no conflicting head, no dropped or revision-only id.
- Sources: 0 locators certified against the text; no seeded target and no source locator lies in the changed passage.

Overlap check: closest lists are BanachSpaceTheory (main and open), VonNeumannAlgebras (open), StochasticCalculus, SobolevMapsBetweenManifolds; their scopes were read in the previous reviews and not again, since the change adds no owned object; nothing newly shared.

Source independence: changed passages only; 1 passage compared with 1 source (the pinned Mathlib docstring of `lp.dualPairing`), none shared; largest share HvNVW, 47 of 49 citation groups, text not readable; no layer added, removed or reordered, so the earlier contents comparison stands.

## Not verifiable

- HvNVW locators (all seeded targets, including §8.3's Proposition 1.3.3, pp. 39–40): the previous reviews found the DOI paywalled and no legal copy of the body; not fetched again in this round, as no changed passage carries a locator.
- hvn-errata, entry for p. 39: the author-hosted PDF was unreachable in the previous reviews; not fetched again.

## Source issues

- none

## For the human reviewers

- **Not tested.** HvNVW has 47 of 49 literary citation groups. Its public contents were readable in an earlier review, its main text was not; wording and the seeded locators remain uncertified.
- **Licence.** The author-hosted hvn-errata PDF was unreachable in the earlier reviews; its version and reuse status were not established.
