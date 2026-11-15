# FIX-DESIGN-CompressibleEulerEquations~16

The review `REV-DESIGN-CompressibleEulerEquations~15` has one finding, F01. It is correct, and the
repair was applied as the review proposed.

## F01 (P2) — applied

**Verdict.** The finding is correct. LorentzianGeometry §12.6 defines `futureDomainOfDependenceIn`
for any `S ⊆ M` and proves `S ∩ D ⊆ D^+_D(S)`. Take `n = 1`, the field `(1, 0)`,
`D = [0, 2) × ℝ` and `S = {(1, 0)}`. Then `(1, 0) ∈ D⁺_D(S)`, but the causal curve `x ≡ 0` on
`[0, 1]` ends at `(1, 0)` and starts at `(0, 0) ∉ S`. So the description "all curves on
`[t₀, t_p]` start in `S`" is false for this `S`. Computed exactly, `D⁺_D(S) = S`, while the
start-point description gives `∅`.

**Changes.**

- `packages/CompressibleEulerEquations/design/README.md`, §3.3 *Slabs*:
  - Old: "`D⁺_D(S)` is the set of `p` all of whose causal curves on `[t₀, t_p]` start in `S`".
  - New: "for `S ⊆ Σ_{t₀}`, `D⁺_D(S)` is the set of `p ∈ D` all of whose past causal curves in
    `D` on `[t₀, t_p]` start in `S`".
  - The route gains one sentence: curves on `[t₀, t_p]` are exactly the past-inextendible ones,
    and such a curve meets `S ⊆ Σ_{t₀}` iff it starts in `S`.
  - New Check: the point datum `S = {(1, 0)}`.
  - The Layer 3 `### Examples` paragraph now lists this Check among the negative controls.
- `packages/CompressibleEulerEquations/design/plan.json`, target 3.3.3:
  - the statement changed in the same way;
  - `hypotheses` now lists `D = [t₀,t₁) × E`, which the statement already assumed, and
    `S ⊆ Σ_{t₀} (for the description of D⁺_D(S))`;
  - new `non-example` test `point_datum_off_slice`.

**The same pattern elsewhere.** I searched the README and the plan for other descriptions of
`D⁺` by start points ("start in", "all of whose", every use of `D⁺` and "slab"). There are no
other occurrences. Every consumer uses the statement only with `S = Σ_{t₀}`, or with data
`{t₀} × S ⊆ Σ_{t₀}`, so none of them changes:

- §6.2 slab uniqueness;
- the uniformly-local-data uniqueness in §7.3;
- §8.1 to §8.3, including the uniqueness criterion and §8.3's `D⁺_O({t₀} × S)`;
- §8.4, developments inside a slab.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §3.3 slabs, start-point description, `S ⊆ Σ_{t₀}` | `t_p = t₀`; `t_p > t₀`; `S = Σ_{t₀}` | `t_p = t₀`: only the one-point curve, and both sides read `p ∈ S`. `t_p > t₀`: the curve meets `Σ_{t₀}` only at `(t₀, x(t₀))`, so "meets `S`" iff `x(t₀) ∈ S`. `S = Σ_{t₀}`: every start point `(t₀, x(t₀)) ∈ Σ_{t₀}`, so `D⁺_D(Σ_{t₀}) = D` | holds |
| Same, `S ⊄ Σ_{t₀}` (point datum) | field `(1, 0)`, `D = [0, 2) × ℝ`, `S = {(1, 0)}` | `p = (1, 0)` is in `D⁺`, since every curve contains `p ∈ S`; `x ≡ 0` starts at `(0, 0) ∉ S` | without the hypothesis the description fails; the hypothesis is needed, now a Check |
| New Check: `D⁺_D(S) = S` | `t_p < 1`; `t_p = 1, x_p ≠ 0`; `t_p > 1, x_p ≠ 0`; `t_p > 1, x_p = 0` | Each instance has a causal curve that misses `S`, so `p ∉ D⁺_D(S)`. For `t_p < 1`, `x ≡ x_p` never reaches `t = 1`. For `t_p = 1, x_p ≠ 0` and for `t_p > 1, x_p ≠ 0`, `x ≡ x_p` has value `x_p ≠ 0` at `t = 1`. For `t_p > 1, x_p = 0`, `x(t) = (t − t_p)/2` (slope `1/2 ≤ c = 1`) has value `(1 − t_p)/2 ≠ 0` at `t = 1`. Start-point set: every start point has `t = 0`, so none is `(1, 0)`, and the set is `∅` | holds |
| Route sentence (no proper extension) | a curve on `[t₀, t_p]`, `D ⊆ H_{t₀}` | An extension ending at `p` needs a parameter interval strictly larger than `[t₀, t_p]` with maximum `t_p`, so it has points with `t < t₀`, outside `D`. Conversely, a past-inextendible curve equals its extension to `[t₀, t_p]` (first clause) | holds |
| Existing Check, unbounded field `(1, x²)` | `S = Σ₀` | `x(s) = 1/(1/4 − s)` is `−4` at `1/2` and tends to `−∞` as `s ↓ 1/4`; the boundedness hypothesis is not met, and the Check is unaffected by the new hypothesis | unchanged |
| Consumers (§6.2, §7.3, §8.3) | `S = Σ_{t₀}` or `{t₀} × S` | `{t₀} × S ⊆ Σ_{t₀}` in every use | unchanged |

## Checks run

**Dependency check** (the brief's command, run after the edits):

```text
candidate: CompressibleEulerEquations is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 239 roadmaps, 2251 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

**Other checks.**

- `design/plan.json` still parses.
- The README has no LaTeX delimiters or process words.
- The locators used were reopened:
  - BarGinouxPfaffle2007 line 1006, Definition 1.3.5: unchanged and correct.
  - LorentzianGeometry §12.6, read at the head of its pull request. `futureDomainOfDependenceIn`
    is defined there "for any `S ⊆ M`", and `S ∩ D ⊆ D^+_D(S)` is proved there. The new Check
    relies on both facts.

**Not run.**

- No `Suggested.lean` exists at the design stage, so there was no `#check @name` elaboration to
  compare against the README.
- No sources were fetched and `sources.toml` is unchanged. No new citation was added, and no text
  is missing.

## For the maintainer

- No name or section number changed, so other roadmaps' citations are unaffected.
- No new construction was added, so ownership is unchanged; the review's by-object search still
  stands.
- No supplier gap was added (`gaps: []`).
- No text read contained instructions.
