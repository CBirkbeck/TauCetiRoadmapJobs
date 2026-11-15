# FIX-DESIGN-Varifolds~13: repair of the Varifolds design

The review REV-DESIGN-Varifolds~12 has one finding, F01 (P3). It is right and is applied with the
suggested wording. I also made two supporting edits so that the citations in the new wording point
to statements that exist:

- The "(1.3)" citation for spt‖V'‖ = spt‖V‖ ∩ U needed 1.3 to state the support of a restriction
  to an open set. Before this round, 1.3 only said that restriction commutes with weights.
- The stationarity step relies on 4.1's restriction bullet, which is now cited at the claim and
  listed in 9.1's *Needs:* line.

Files edited:

- `packages/Varifolds/design/README.md`
- `packages/Varifolds/design/plan.json`

`packages/Varifolds/sources.toml` is unchanged: no new source is cited.

## F01 (P3) — applied

**Verified.** The parenthesis in the last bullet of 9.1 coordinates three predicates: "extends by 0
to W", "has support spt‖V‖ ∩ U" and "is nonzero". All three attach grammatically to "a field with
compact support in U". A field has neither of the last two properties (X = 0 has compact support in
U). Only the restriction of V to U can have them, so the finding is right.

**Change (README 9.1).** Old: "(6.4 in U, where the restriction is stationary, since a field with
compact support in U extends by 0 to W, has support spt‖V‖ ∩ U, and is nonzero because
x ∈ spt‖V‖)". New: "(6.4 applied in U to the restriction V' of V: V' is stationary in U, because a
field with compact support in U extends by 0 to W (4.1); spt‖V'‖ = spt‖V‖ ∩ U (1.3); and V' ≠ 0
because x ∈ spt‖V‖)". This is the reviewer's wording plus the "(4.1)" locator. The 9.1 *Needs:*
line gains Layer 4.1.

**Supporting changes.**

- README 1.3, restriction bullet. Added: for open W' ⊆ W, the weight of the restriction V' is
  ‖V‖ restricted to W', so spt‖V'‖ = spt‖V‖ ∩ W', with the support taken in W'.
- README 1.3, new Check. The restriction of the horizontal lift of H¹⌞([0, 1] × {0}) to the open
  disc of radius ½ has support [0, ½) × {0}. This set is closed in W' but not in ℝ².
- `plan.json`:
  - 1.3: the "restriction" API statement now includes the support clause, and the new test is
    added.
  - 9.1: `target:4.1` is added to the prerequisites.
  - 9.1's API entry carries no parenthesis, so it needs no other change (as the review says).

**Pattern.** I searched the README for the same construction: an argument that applies 6.4 or
stationarity to a restriction and lists properties after "since"/"because". The only other use of
6.4 is in 7.3 ("6.4 gives C = Θ(x) v(T, 1)"). Its subject is unambiguous: C is stationary in
T_xM, spt‖C‖ ⊆ T, and C ≠ 0 because Θ(x) > 0. It is unchanged. 9.2 already lists "support" among the
notions that commute with restriction, which agrees with the new 1.3 clause.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 1.3: spt‖V'‖ = spt‖V‖ ∩ W' for open W' | W' = ∅; W' = W; V = 0; δ_{(x,P)} with x ∉ W' and x ∈ W' | ∅ = spt ∩ ∅; spt = spt; ∅ = ∅; restriction 0, support ∅ = {x} ∩ W'; restriction δ_{(x,P)}, support {x} = {x} ∩ W' | holds | none |
| 1.3, same (proof) | x ∈ W'. Open neighbourhoods of x in W' are open in W (W' open), and every neighbourhood of x in W contains one inside W' | ‖V'‖(N) = ‖V‖(N) for N ⊆ W' open, so x ∈ spt‖V'‖ ⇔ every small open N ∋ x has ‖V‖(N) > 0 ⇔ x ∈ spt‖V‖ | holds | none |
| 1.3, wrong model "closure in W of spt‖V‖ ∩ W'" | H¹⌞([0, 1] × {0}) lifted horizontally, W' = B_{1/2}(0) ⊆ ℝ² | relative support [0, ½) × {0} ⊆ W'; the closure in ℝ² is [0, ½] × {0}, which contains (½, 0) ∉ W' | excluded | new Check |
| 1.3, open hypothesis | A = closed half-plane {y_2 ≥ 0} and V the horizontal lift of H¹ on the x-axis | V⌞A = V, but "V⌞A is a varifold on A" is not claimed: the clause is stated for open W' only | not claimed | none |
| 9.1 constant multiplicity (reworded) | V = v(L_1, 1) + v(L_2, 2) crossing at 0, x = (1, 0), U = B_{1/2}(x) | V' = v((½, 3/2) × {0}, 1); δV'(X) = δV(X̃) = 0 for X ∈ C¹_c(U) (4.1); spt‖V'‖ = segment = spt‖V‖ ∩ U; V' ≠ 0; 6.4 gives θ_0 = 1 | holds | wording |
| 9.1, same witness, U = B_2(x) | 0 ∈ U | spt‖V‖ ∩ U is a cross, not a submanifold: the hypothesis fails, and V' carries multiplicities 1 and 2 | hypothesis needed | existing Check |
| 9.1, non-stationary control | V = v((0, 1) × {0}, θ), θ(t) = 1 + t, x = (½, 0) | x ∈ reg^2 V and the multiplicity is not constant; δV(ψe_1) = −∫ψθ' dt ≠ 0, so V is not stationary | stationarity needed | none |
| 9.1, k = 0 | spt‖V‖ ∩ U = {x} | V' = ‖V‖({x})·δ_{(x,{0})}, with θ_0 = ‖V‖({x}) > 0 because x ∈ spt‖V‖ and U ∩ spt‖V‖ = {x} | holds | none |
| 4.1 restriction bullet (cited) | X ∈ C¹_c(U) extended by 0 to X̃ on W | spt X is compact in U, hence closed in W. X̃ is C¹ because it is C¹ on U and 0 on the open set W ∖ spt X. δV'(X) = ∫_{G_k(U)} div_S X dV = ∫_{G_k(W)} div_S X̃ dV = δV(X̃) | holds | none |

The 9.1 Check on crossing lines and the existing 1.3 Checks (equal weights with different lifts,
mass 2 on the disc, Dirac support, V⌞∅ = 0) use the changed objects. I recomputed them and none
changes: none of them restricts to a proper open subset whose closure leaves it.

## Checks

Dependency check:

    candidate: Varifolds is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
    depcheck: 241 roadmaps, 2247 edges, 0 problem(s)

There is no UPWARD or CYCLE line. The only references this round adds are internal ones (Layer 4.1 in
9.1's *Needs:*, and 4.1 and 1.3 cited at the claim), so no supplier was added.

Other checks:

- The README has no LaTeX delimiters, the added text has no backticked names, and no machine path
  or process word was introduced.
- There is no `Suggested.lean` at the design stage, so the `#check` comparison does not apply.
- Ownership against open pull requests: the change adds no construction that another roadmap could
  own. Support of a restricted measure and the first variation of a restriction are properties of
  this roadmap's own carrier.

## For the maintainer

- No name that another roadmap cites has changed. No roadmap cites this one.
- The review's "Source issues" (Simon1983 41.1 connectedness, and the 42.8 proof misprint) and its
  "For the human reviewers" items (licences of Simon1983 and of the arXiv preprint) are not
  findings. Nothing was changed for them.
- No source was fetched, and no `needs-references.toml` was written.
