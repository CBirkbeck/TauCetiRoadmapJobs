# FIX-DESIGN-VirtualFundamentalClassPartII~8

One finding of REV-DESIGN-VirtualFundamentalClassPartII~7 (P3), checked against the cached text of
stacks-chow-spaces. It holds and is applied as asked.

## F01 (P3) — applied

Verified against stacks-chow-spaces lines 151–173. Lemma 4.1 (Tag 0EE1, lines 151–158) says that the
length of a quasi-coherent module at a point of an algebraic space is the length on any étale chart
from a scheme (conditions (2) and (3) are equivalent). Lemma 4.3 (Tag 0EE3, lines 169–173) compares
lengths on a closed subspace with lengths of the pushforward. So the étale-invariance claim in 2.1
rests on Lemma 4.1, not Lemma 4.3. Lemma 10.3 (line 516, coefficient `1` on every component of an
étale pullback) is cited correctly and stays.

Changes:
- `design/README.md`, 2.1: "stacks-chow-spaces Lemma 4.3, line 169" → "stacks-chow-spaces Lemma 4.1,
  lines 151–158".
- `sources.toml`, stacks-chow-spaces `locator`: "Lemmas 4.3 (0EE3)" → "Lemmas 4.1 (0EE1)".
- `sources.toml`, stacks-chow-spaces `cited_for`: "Lemmas 4.3, 10.3, 13.2, lines 169, 516, 667" →
  "Lemmas 4.1, 10.3, 13.2, lines 151–158, 516, 667".

Pattern: I searched the README, `plan.json` and `sources.toml` for "Lemma 4.3", "0EE3" and "line 169".
2.1 and the manifest entry were the only places they appeared. `plan.json` cites stacks-chow-spaces
only for Definitions 3.1 and 15.1 and Lemma 15.2, and does not repeat this locator. The other
stacks-chow-spaces locators in the README (Lemma 13.2 at line 667, Lemma 15.2 at lines 813–818, Lemma
27.3, Definition 32.1 at line 2224, Definitions 3.1 and 15.1) were reread at their lines. Each still
has the item number the README gives.

No mathematical statement changed. `plan.json` is unchanged and still parses.

## Adversarial pass (the changed citation)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.1: `m_𝒱` does not depend on the étale chart (Lemma 4.1 (2) ⇔ (3)) | `𝒵 = [V(x²)/μ₂] ⊂ [𝔸¹/μ₂]`, `char k ≠ 2` (Convention 1); charts `U = 𝔸¹` and `U ×_ℳ U = μ₂ × 𝔸¹` | On `𝔸¹`: the local ring of `V(x²)` at the generic point of `{0}` is `k[x]_(x)/(x²)`, length `2`. On each of the two sheets of `μ₂ × 𝔸¹`: `V(x²)`, length `2`. Lemma 4.1 applied to the scheme `U` and the étale map `U ×_ℳ U → U` gives the same value. | holds; agrees with 2.1's second Check (`2·[Bμ₂]`, reduced support gives `1`) | locator only |
| 2.1: `m_𝒱` does not depend on the component (Lemma 10.3) | `[BG] ⊂ BG`, chart `Spec k`, `U ×_ℳ U = G` | The pullback of an integral `𝒱` along an étale map is reduced, so every component has coefficient `1`. `[BG] ↦ [Spec k]` with coefficient `1`. | holds | none |
| Lemma 4.3 (the old locator), used instead | closed immersion `i : Y → X`, module `G` on `Y` | It equates the length of `G` at `y` with that of `i_*G` at `x`. This says nothing about changing the étale chart. | does not support the claim | replaced by Lemma 4.1 |

## Dependency check

    candidate: VirtualFundamentalClassPartII is not in the merge order yet; checked as if placed after StableReductionPartII (the intake inserts it when its design is accepted)
    depcheck: 245 roadmaps, 2233 edges, 0 problem(s)

There is no UPWARD and no CYCLE line. Last round reported 2232 edges and this run reports 2233. The
difference does not come from this package: this round changed one source locator and added no
cross-roadmap citation, `*Needs:*` line or supplier.

## Gate failures

None were listed for this round.

## Notes for the maintainer

- This is a design. There is no `Suggested.lean`, so no `#check` pass or elaboration was run.
- No target, name, section number or supplier citation changed. No other roadmap's citation of this
  one is affected, and the two declared supplier gaps (`gap:closed-substacks-of-stacks`,
  `gap:normal-cones-of-local-immersions`, both owned by VirtualFundamentalClass) are unchanged.
- Ownership: this round adds no construction, so no new ownership question arises.
- No source was fetched. The text used was already cached under the existing manifest key
  stacks-chow-spaces, and no `needs-references.toml` was written.
- The review had no "For the human reviewers" items. It contained no instructions that needed to be
  treated as suspicious.
