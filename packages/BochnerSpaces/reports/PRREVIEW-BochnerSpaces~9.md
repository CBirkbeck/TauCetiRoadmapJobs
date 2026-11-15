# Review of BochnerSpaces (pull request #2249 at 9bfecd1)

**Verdict:** accepted

Incremental re-review of the 8 lines changed since `1812565`. No finding.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/BochnerSpaces/README.md:111–115` lists `lp.dualPairing` and `lp.norm_dualPairing` under **From Mathlib** with `[ml-lp-holder]` defined at `:1353`; `:1176` reads “*Needs:* §3.2, Mathlib `lp.dualPairing` and `lp.norm_dualPairing`, scalar lp.dualEquiv …”.

## Verified sound

| Statement | Instances tried | Left / input value | Right / output value | Result | Change |
| --- | --- | --- | --- | --- | --- |
| Contract bullet `:111–115`: pairing `(e,f) ↦ ∑' i, B i (e i) (f i)` has norm ≤ K | I={1,2}, 𝕜=H=ℝ, B i = 2·mul (K=2), p=1, q=∞, e=(1,−2), f=(1,−1) | Pairing value 2·(1·1+(−2)(−1)) = 6 | K‖e‖₁‖f‖∞ = 2·3·1 = 6 | Bound holds and is attained; formula is `lp.dualPairing_apply` | none |
| Same bullet, p=q=2 and K=0 | B i = mul (K=1), e=(3,4), f=(3,4)/5; then B=0, K=0 | 9/5+16/5 = 5; zero pairing has norm 0 | 1·5·1 = 5; bound 0 | Holds in both; `K ≥ 0` is forced by `K : ℝ≥0` in the pinned signature | none |
| Same bullet, hypotheses against the pinned signature | “conjugate exponents `1 ≤ p, q ≤ ∞`”, “continuous bilinear maps”, “complete target” | `[Fact (1 ≤ p)] [Fact (1 ≤ q)] [p.HolderConjugate q]`, `B i : E i →L[𝕜] F i →L[𝕜] H`, `[CompleteSpace H]`, `hBK : ∀ i, ‖B i‖ ≤ K` | Bullet states exactly these; (p,q)=(1,∞) admitted; I=∅ gives the zero pairing | Bullet neither adds nor drops a hypothesis; it claims the bound only, and hands surjectivity and the isometry to §8.3 | none |

The rows for untouched statements stand as in the previous review, of `1812565`.

- Gate at `9bfecd1`: every check passed in the worker's record, targeted build included. Run again here without a merge-order file, it reports only `depcheck: NOT IN ORDER: BochnerSpaces (insert it after its last supplier)`, which is the placement of a roadmap not yet listed and no defect.
- Dependency check against the merge-order candidate: `depcheck: 246 roadmaps, 2242 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/BochnerSpaces/Suggested.lean`: exit 0, 25 `sorry` warnings and nothing else. The diff changes no Lean statement.
- Pinned declarations opened: `lp.dualPairing` (`Mathlib/Analysis/Normed/Lp/lpHolder.lean:264`), `lp.dualPairing_apply` (`:269`), `lp.norm_dualPairing` (`:275`). The commit in the new link definition, `1b1ccf4`, is the Mathlib pin of `lake-manifest.json`.
- Consistency of the changed lines with their neighbours: scalar `lp.dualEquiv` in the `*Needs:*` line is the Tau Ceti declaration of `TauCeti/Analysis/Normed/Lp/Dual.lean:175`, listed under **From Tau Ceti** at `README.md:165`; it is built on the same `lp.dualPairing`, so the two contracts use one pairing convention.
- Cross-roadmap citations: the change adds none; BanachSpaceTheory B3 and B5 in the changed `*Needs:*` line exist on main. Overlap tooling: no conflicting head, no dropped or revision-only id. No file changed outside the folder.
- Pull request text: the title “Add roadmap BochnerSpaces” and the description agree with this head; the change adds a Mathlib citation only, no roadmap supplier, section or Lean declaration.
- Sources: 0 locators certified against the text; no seeded target and no source locator lies in the changed lines.

Overlap check: read BanachSpaceTheory (main and open); VonNeumannAlgebras, StochasticCalculus and UnboundedOperators were read in the earlier reviews and not again, since the change adds no owned object; nothing shared — `lp.dualPairing` is Mathlib's, and BanachSpaceTheory cites it too without owning it.

Source independence: changed passages only; 1 passage compared with 1 source (the pinned Mathlib docstring of `lp.dualPairing`), none shared beyond the formula; largest share HvNVW, 47 of 49 citation groups, text not readable; no layer added, removed or reordered, so the earlier contents comparison stands.

## Not verifiable

- HvNVW locators (all seeded targets, including §8.3's Proposition 1.3.3, pp. 39–40): the earlier reviews found the DOI paywalled and no legal copy of the body; not fetched again, as no changed line carries a locator.
- hvn-errata, entry for p. 39: the author-hosted PDF was unreachable in the earlier reviews; not fetched again.

## Source issues

- none

## For the human reviewers

- **Not tested.** HvNVW has 47 of 49 literary citation groups. Its public contents were readable in an earlier review, its main text was not; wording and the seeded locators remain uncertified.
- **Licence.** The author-hosted hvn-errata PDF was unreachable in the earlier reviews; its version and reuse status were not established.
