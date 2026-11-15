# Repair of DiracScatteringAndNonlinearFourierTransform (design, round 16)

This round answers the one finding of `REV-DESIGN-DiracScatteringAndNonlinearFourierTransform~15`, F01 (P3), on the order of the quantifiers in §9.3. Files edited:

- `packages/DiracScatteringAndNonlinearFourierTransform/design/README.md`, §9.3: the route gains a closing passage (union over `m`, monotonicity in `C`, reduction to integer `C`), and one Check is added.
- `packages/DiracScatteringAndNonlinearFourierTransform/design/plan.json`, target 9.3: the statement is copied from the README; the hypothesis "a.e. s, C > 0" now reads "a.e. s, one null set for every C > 0"; test `monotoneInBoxSize` is added.
- `sources.toml`: unchanged. No new source was needed, and `needs-references.toml` was not written.

No hypothesis, conclusion, id, Lean name or supplier changed. There is no `Suggested.lean` at the design stage, so nothing was elaborated and the `#check` comparison does not apply. The review's "For the human reviewers" section asks for no edit, and none was made for it.

## F01 (P3) — applied

Old → new. The route of §9.3 ended "… `lim sup ℓₙ(s)/2ⁿ ≤ 1/m` at almost every `s`, for every `m`." It now goes on to say four things. First, the union over `m = 1, 2, …` of these null sets gives `ℓₙ(s)/2ⁿ → 0`. Second, that null set depends on `C`. Third, `ℓₙ(s)` is nondecreasing in `C`. Fourth, so the case `C ∈ {1, 2, 3, …}` gives every `C > 0`, by comparing with `C′ = ⌈C⌉`. A Check witnessing monotonicity is added.

**Verification.** The finding is right. The route fixes `C` in three places:

- the sets `G_N` (through `K(t) ≥ 4C`);
- the threshold `ε₁(s)`, which depends on `C`, `m`, `w(s)`, `w̃(s)`;
- the constant `c_{m,C}`.

So for each `C` the route yields its own null set. The `m` were already countable, but the statement says "for almost every `s` and every `C > 0`", with the `C > 0` uncountably many.

The statement itself is true, by monotonicity:

- `Q(s, C) = {z : |Re z − s| ≤ C, |Im z| ≤ C}` (README Conventions), so `Q(s, C/t) ⊆ Q(s, C′/t)` for `C ≤ C′`.
- The function `K` is "a function `C(t)` as in §8.8 at `s`". The sets `T₁(s, K)` and `T̃₁(s, K)` (§8.1) involve `K` and not `C`.
- So every interval `I ⊆ [2ⁿ, 2ⁿ⁺¹] ∩ T₁(s, K) ∩ T̃₁(s, K)` with a zero of `E(t, ·)` in `Q(s, C/t)` at every `t ∈ I` also has one in `Q(s, C′/t)`. Hence `ℓₙ^C(s) ≤ ℓₙ^{C′}(s)`.
- Let `N_k` be the null set of the route for `C = k`, with `k = 1, 2, …`. Off `⋃ N_k`, for real `C > 0`, we have `ℓₙ^C(s)/2ⁿ ≤ ℓₙ^{⌈C⌉}(s)/2ⁿ → 0`. The case `C ≤ 1` is covered by `⌈C⌉ = 1`, and the statement already notes that no interval occurs there for large `n`.

The comparison has to round up. The added Check shows that `ℓₙ` really depends on `C` and that rounding down would not bound it.

The suggested text was used in substance. It was extended in two ways: it makes explicit the union over `m`, which was only implicit before, and it names `C′ = ⌈C⌉`.

**The same pattern elsewhere.** I read every "for almost every `s` and every `C`/`D`" statement of the README.

- **§8.2–§8.5, constant boxes `Q(s, C/t)`.** The admissible `s` are chosen by conditions that do not involve `C`: `w(s) > 0`, a Lebesgue point of `√(M_1 P[|log w|])`, and the existence of the nontangential limit of `G`. §8.3–§8.5 work at the same points. So one null set serves every `C`, and the conclusions (suprema over `Q(s, C/t)`) are monotone in `C` anyway.
- **§8.6 ("every `D > 1`").** It rests on §8.5 at `s`, whose null set does not depend on `D`.
- **§8.7(3) ("for every `D > 0`").** It is stated at an `s` where §8.5 holds and `w(s) > 0`, also independent of `D`.
- **§8.8.** It quantifies no constant.
- **§9.4–§9.6.** They quantify over every `C` at a resonance-free point, which is not an almost-everywhere statement in `C`.

None needs a change.

## Checks run

**Dependency check** (the command of the brief):

```
candidate: DiracScatteringAndNonlinearFourierTransform is not in the merge order yet; checked as if placed after AutomorphicSpectralTheory (the intake inserts it when its design is accepted)
depcheck: 236 roadmaps, 2242 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

**README and plan agree.** A script normalises whitespace and checks that every target statement and every test statement of `design/plan.json` occurs in the README. All 55 targets in 9 layers pass, including the new test, with 0 problems. `plan.json` still round-trips through the JSON serialiser byte for byte (indent 1, UTF-8).

**House style.** The added text uses no LaTeX delimiter, no machine path, no process word and no backticked Lean name of this roadmap. The new Check bullet is wrapped to the README's width.

**Citations and ownership.** No cross-roadmap citation, supplier, library declaration or source locator was added or changed. The suppliers are still AnalyticNumberTheoryPartI §0.23, AutomorphicSpectralTheory §0.5 and OperatorTheory/UnboundedOperators §4.8, and `plan.json` keeps `gaps: []`. The repair adds no object, only a step of a proof route inside §9.3, which this roadmap owns (the review's duplication audit records no other owner). Ownership against open pull requests was not re-checked this round.

## Adversarial pass (changed and added text)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Monotonicity of `Q` in `C` | `C = 2.5`, `C′ = 3`, point `s + 2.7/t − 2i/t` | `|Re − s| = 2.7/t`: `≤ 3/t`, `> 2.5/t`; `|Im| = 2/t ≤ 3/t` | in `Q(s, 3/t)`, not in `Q(s, 2.5/t)` | Check added |
| `ℓₙ` nondecreasing in `C` | that zero at every `t ∈ [2ⁿ, 2ⁿ⁺¹]` (one `n`), `K ≥ 2.7` there, `Ẽ` zero-free in the box | height `−2/t < −1/t`, so every `t` is in `T₁ ∩ T̃₁`; `ℓₙ^{3} = 2ⁿ`, `ℓₙ^{2.5} = ℓₙ^{2} = 0` | `ℓₙ^{2.5} ≤ ℓₙ^{3}`; `ℓₙ^{2}` does not bound `ℓₙ^{2.5}` from above | round up |
| Reduction to integer `C` | `C = 0.4, 1, 2.5, 3` | `⌈C⌉ = 1, 1, 3, 3`, each `≥ C` | covered by `C′ ∈ ℕ_{≥1}` | none |
| `C ≤ 1` degenerate | `C = 0.4` | zero in `Q(s, 0.4/t)` has `|Im| ≤ 0.4/t < 1/t`, so `t ∉ T₁(s, K)` once `K(t) ≥ 0.4` | `ℓₙ = 0` for large `n`, consistent | none |
| Union over `m` | `m = 1, 2, …` | `lim sup ℓₙ/2ⁿ ≤ 1/m` for all `m`, and `ℓₙ ≥ 0`, so `lim = 0` | countable union null | made explicit |
| Union over `C` | `C = k ∈ ℕ_{≥1}` | `Σ_k 0 = 0` (countable subadditivity of outer measure) | one null set for all `C > 0` | added |
| New Check against the theorem | the Check at one `n` against `ℓₙ/2ⁿ → 0` | `ℓₙ^{3}/2ⁿ = 1` at that `n` only | no contradiction: the limit concerns `n → ∞` | Check says "one `n`" |
| §8.2–§8.5, §8.6, §8.7(3) quantifiers | null set as a function of `C` (or `D`) | conditions on `s`: `w(s) > 0`, Lebesgue point, nontangential limit, all independent of `C` | one null set | none |

## For the maintainer

- No Lean name, target id, section number or supplier changed, so no other roadmap is affected.
- §9.3's *Needs:* line is unchanged. The added step uses only the definition of `Q` (Conventions) and §8.1, which the statement already depends on.
- Untrusted text: the review contains no instruction outside its findings, and nothing in it was treated as one.
