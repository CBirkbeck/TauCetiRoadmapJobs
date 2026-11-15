# FIX-DESIGN-ConstructiveFieldTheoryPhi4~14

One review (REV-DESIGN-ConstructiveFieldTheoryPhi4~13) with one finding. Its "For the human reviewers" section (seven uncertified texts, the licence class of `frohlich-1982`, the PartII goals) lists no finding and changed nothing.

## F01 (P3) — applied

Verified: Layer 5 assumed J > 0 throughout, yet the third Check of 5.2 evaluates reflection positivity at J = 0, a case the stated theorem did not cover. Every statement of 5.1–5.3, the quadratic-form infrared bound and the sum rule hold at J = 0. Only `E(p)Ŝ_L(p) ≤ 1/J` and 5.5 divide by J.

Change: the Layer 5 standing sentence "ρ is admissible, J > 0, L ≥ 1" → "ρ is admissible, J ≥ 0, L ≥ 1 …; the bound `E(p) Ŝ_L(p) ≤ 1/J` of 5.4 and the statements of 5.5 assume J > 0". The repair is the reviewer's, narrowed so that only the J-dividing bound and 5.5 keep J > 0.

The other places with the same pattern were repaired in the same way:

- Conventions: the infrared-bound sentence now reads "for p ≠ 0 and J > 0".
- 5.4: it now asserts the 1/J bound for J > 0 and the quadratic form for J ≥ 0. The identity `(h, −Δh) = Σ_xΣ_j(h_x − h_{x+e_j})²` was added, together with a new J = 0 Check.
- 5.3: the existing constant-h Check gains the J = 0 case.
- 5.5: the admissible-ρ clause now names J > 0 explicitly.
- plan.json: in 5.1, `J > 0` → `J >= 0` (5.2 and 5.3 already had `J >= 0`). In 5.4, the hypotheses are now `J >= 0`, plus `J > 0` for the 1/J bound, the statement matches the README, and a new test `zero_coupling` was added. In 5.3, the test `constant_h` was extended. In 5.5, the statement now says J > 0 in its second clause.

Not changed:

- The source sentence of 5.2 already restricted the edge-reflection representation to J ≥ 0. Peled–Spinka's vertex argument (`peled-spinka-2017` lines 1331–1349) uses only the domain Markov property, so it covers J = 0.
- Gaussian domination at β = 0 is the trivial equality (`peled-spinka-2017` lines 1563–1591, W ≡ 1).

Pattern sweep: only Layers 4 and 5 have a "Throughout" sentence. Layer 4 assumes J(z) ≥ 0, and its J = 0 Checks are inside that hypothesis. In plan.json only 5.1, 5.4 and 5.5 carried `J > 0`. The remaining Checks that leave a target's hypotheses do so on purpose and say so. These are:

- the antiferromagnet in 5.2;
- the Lebesgue Gaussian-gradient example in 5.3, labelled as outside the a-priori setting;
- d = 1, 2 in 5.5, labelled as a non-example;
- the non-even and J < 0 controls of Layers 2–3.

## Adversarial pass on the changed text

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Layer 5 standing hypothesis, J ≥ 0 | J = 0, any admissible ρ | `μ^{per} = ρ^{⊗T_L}` (density `e^{0}`, Z = 1) | defined | standing sentence |
| 5.1 at J = 0 | L = 1, d = 1, Ising | `⟨σ_0σ_1⟩ = tanh 0 = 0`, `Ŝ_1(0) = Ŝ_1(π) = 1` | the existing Check holds at J = 0 | plan hypothesis `J >= 0` |
| 5.2 edge form at J = 0 | f on the open half, R fixed-point free | independence of the disjoint halves under the product measure and R-invariance give `⟨f·conj(f∘R)⟩ = E f · conj(E f) = |E f|² ≥ 0` | holds | none (Check now inside the hypothesis) |
| 5.2 vertex form at J = 0 | d = 1, L = 2, `T_2 = ℤ/4`, R(x) = −x fixes {0, 2}, f = σ₀ | `E[|E(σ₀ | σ₀, σ₂)|²] = E[σ₀²] = 1`; `|E σ₀|² = 0` | Check correct; the forms differ | none |
| 5.2 chessboard at J = 0 | product measure, `|T_L| = (2L)^d` even | left `Π_v |E f_v|^{|T_L|}`, right `Π_w (E f_w)^{|T_L|} = Π_w |E f_w|^{|T_L|}` | equality | none |
| 5.3 at J = 0 | any h | `ρ̃ = e^{0}ρ = ρ`, `Z(h) = ρ(ℝ)^{|T_L|} = 1 = Z(0)`; the equivalent form is `⟨e^0⟩ = 1 ≤ e^0 = 1` | equality | Check extended |
| 5.3 two-site Check at J = 0 | L = 1, d = 1, Ising | `−4J + e^{−4J}(32J² − 4J) = 0 ≤ 0` | holds | none |
| 5.4 quadratic form, identity | any L, d; reindex `Σ_x h_xh_{x−e_j} = Σ_x h_{x+e_j}h_x` | `(h, −Δh) = Σ_jΣ_x(2h_x² − 2h_xh_{x+e_j}) = Σ_jΣ_x(h_x − h_{x+e_j})²` | holds | added to 5.4 |
| 5.4 quadratic form at J = 0 | L = 1, d = 1, h = (1, −1) | `(Δh)_0 = 2h_1 − 2h_0 = −4`, `(Δh)_1 = 4`, `(h, −Δh) = 4 + 4 = 8 = 2·(1 − (−1))²`; left side `0·⟨…⟩ = 0 ≤ 8` | holds | new Check, plan test `zero_coupling` |
| 5.4 quadratic form at J > 0 against the 1/J bound | L = 1, d = 1, Ising, h = (1, −1) (the p = π mode) | `(φ, −Δh) = 4(σ_0 − σ_1)`, `⟨16(σ_0 − σ_1)²⟩ = 32(1 − tanh 2J)`; `32J(1 − tanh 2J) ≤ 8` iff `4J(1 − tanh 2J) ≤ 1`; at 2J = 0.64, `tanh 0.64 = 0.5649`, `4·0.32·0.4351 = 0.557 ≤ 1` | agrees with the existing first Check | none |
| 5.4 derivation needs J > 0 only for division | Gaussian domination with h ↦ εh, second order | first order `⟨φ_0⟩Σ_x(Δh)_x = 0`; second order `J²⟨(φ,Δh)²⟩ ≤ J(h, −Δh)`, divided by J > 0; at J = 0 the claim is `0 ≤ (h, −Δh)` directly | J ≥ 0 suffices | 5.4 scoped |
| 5.4 1/J bound at J = 0 | any p ≠ 0 | `1/J` undefined | excluded | kept J > 0 |
| 5.4 sum rule at J = 0 | L = 1, d = 1, Ising | `½(Ŝ(0) + Ŝ(π)) = ½(1 + 1) = 1 = ⟨σ_0²⟩` | holds | none |
| 5.5 | J > 0 kept; J ↓ 0 | `1 − I_d/J → −∞`; `−I_d/J` undefined at J = 0 | J > 0 needed | the clause now says J > 0 |

## Checks run

Dependency check (gate), after the edits:

```text
candidate: ConstructiveFieldTheoryPhi4 is not in the merge order yet; checked as if placed after RelativisticQuantumFieldTheory (the intake inserts it when its design is accepted)
depcheck: 243 roadmaps, 2237 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The design has no `Suggested.lean`, so there was nothing to elaborate and no `#check` scratch file. `plan.json` parses, and its 5.1–5.5 entries agree with the README text.

## Notes for the maintainer

- No supplier, citation, name or section number changed. No other roadmap is affected, `sources.toml` is unchanged, and no new source was cited.
- Ownership against open pull requests was not re-checked this round. The repair adds no object, only scopes the coupling hypothesis of Layer 5.
- No suspicious instructions were found in the review text.
