# FIX-DESIGN-ConstructiveFieldTheoryPhi4~15

This round settles one review, REV-DESIGN-ConstructiveFieldTheoryPhi4~14, which has two P3 findings. Its "For the human reviewers" section lists no finding, and nothing was changed because of it. That section covers:

- the seven uncertified texts;
- the licence class of `frohlich-1982`;
- the goals of the PartII roadmap.

## F01 (P3) — applied

**Verified.** Aizenman–Duminil-Copin state (5.2) for an arbitrary common distribution (`aizenman-duminilcopin-2021` lines 1007–1009, 1023–1032). The README assumes ρ even but had no Check showing why. Recomputed on the reviewer's instance:

- V = {−1, 0, 1}, R(x) = −x, V₀ = {0}, V₊ = {1}, J = 0.
- ρ = (2δ₋₁ + δ₁)/3 is admissible, since `∫e^{cφ²}dρ = e^c`.
- A = 1_{1}, B = 1_{0,1}, so R(B) = B ∘ R = 1_{−1,0}.
- Left side: `⟨φ₁²φ₀⟩ = 1·(−1/3) = −1/3`.
- Right side: `⟨φ₁φ₋₁φ₀⟩ = (−1/3)³ = −1/27`.
- The inequality fails.

**Change.** Added a fourth Check to 3.6 with this instance. Under ρ_I both sides are 0.

The Check also contains a general remark. The flip leaves H unchanged, so it carries μ_ρ to μ_{ρ⁻}. For odd |A| + |B| this reverses the inequality: ρ⁻ = (δ₋₁ + 2δ₁)/3 satisfies it, 1/3 > 1/27.

In plan.json, 3.6 gains the test `evenness_needed`.

**Pattern sweep.** Every other target that assumes evenness already has a non-even control:

- 1.2: `(δ₀ + δ₁)/2`
- 3.1 and 3.2: `(2δ₋₁ + δ₁)/3`
- 7.3: `(δ₀ + δ₁)/2`
- 3.5 and 3.7 assume membership of the Griffiths–Simon class, and 3.5 has a class-needed control.

## F02 (P3) — applied

**Verified.** Sokal's properties (a)–(b) are stated for the limit state after V ↑ ℤ^d (`sokal-1982` lines 402–409). `aizenman-duminilcopin-2021` lines 228–230 only define the finite-volume Ising state. Neither source states the finite-volume invariances.

**Change in 1.2.** The locator "(Aizenman–Duminil-Copin (1.17), p. 5; Sokal, Section 2.2, properties (a)–(b), p. 327)" becomes:

- a sentence saying both invariances follow by changing variables in the defining integral of the finite-volume state (Aizenman–Duminil-Copin (1.11)–(1.12), p. 4, for φ⁴ fields and (1.17), p. 5, for Ising spins);
- "Sokal, Section 2.2, property (b), p. 327, states the same invariances for the infinite-volume state of 4.2".

The plan.json locator of 1.2 was changed to match.

**Repaired the same pattern elsewhere.** Sokal states every correlation inequality of Section 2.2 for the infinite-volume μ (`sokal-1982` line 412: μ satisfies the inequalities that follow). The following finite-volume citations now add "for the infinite-volume φ⁴ state", in both the README and plan.json:

- 3.1: (2.19)–(2.20)
- 3.3: (2.25)
- 3.5: (2.23)–(2.24)
- 3.7: property (j), (2.27)

Left unchanged:

- 3.6 already cites Sokal's Remark (lines 455–466), which says (2.29)–(2.30) first hold in finite boxes.
- 3.2 cites the sentence on monotonicity of the finite-volume correlations, a finite-volume statement.
- 4.1 and 4.2 are infinite-volume statements.
- 2.1 cites property (i) only as the inequality family it names an instance of.

`sources.toml` needs no change: `sokal-1982` already lists 1.2, 3.1, 3.3, 3.5 and 3.7, and `aizenman-duminilcopin-2021` lists 1.2.

## Adversarial pass on the changed text

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 3.6, new non-even Check | V = {−1,0,1}, R(x) = −x, J = 0, ρ = (2δ₋₁+δ₁)/3, A = 1_{1}, B = 1_{0,1} | mean −1/3, `E φ² = 1`; `⟨φ₁²φ₀⟩ = −1/3`; `R(B) = 1_{−1,0}`, `⟨φ₁φ₋₁φ₀⟩ = −1/27`; −1/3 < −1/27 | evenness is needed | Check added; plan test `evenness_needed` |
| 3.6 hypotheses on the instance | V₊ = {1} is a singleton | `J_{Rx,Ry} = 0 = J_{xy}`; the condition `J_{xy} ≥ J_{x,Ry}` over distinct x, y ∈ V₊ is vacuous; A and B are supported in V₊ ∪ V₀ | every hypothesis except evenness holds | none |
| 3.6, even control | ρ_I, same V, A, B | `⟨φ₁²φ₀⟩ = 1·0 = 0`, `⟨φ₁φ₋₁φ₀⟩ = 0` | 0 ≥ 0 holds | in the Check |
| Flip remark | `H(−φ) = H(φ)` (quadratic); `\|A + B\| = \|A + R(B)\| = \|A\| + \|B\|` | `⟨φ_C⟩_{ρ⁻} = (−1)^{\|C\|}⟨φ_C⟩_ρ`; at odd degree `X ≥ Y` for ρ iff `X ≤ Y` for ρ⁻; ρ⁻ = (δ₋₁+2δ₁)/3 gives 1/3 ≥ 1/27 | both can hold only with equality | in the Check |
| Flip remark, even degree | A = B = 1_{1}, J = 0, ρ = (2δ₋₁+δ₁)/3 | `⟨φ₁²⟩ = 1 ≥ (−1/3)² = 1/9` | holds; the even-degree case without evenness is not claimed either way | Check says "general multi-indices", not "even degree is free" |
| 1.2, change of variables | φ ↦ φ∘g with `J_{gx,gy} = J_{xy}`; φ ↦ −φ with ρ even | `H(φ∘g) = H(φ)`, ρ^{⊗V} is permutation-invariant; `H(−φ) = H(φ)`, ρ^{⊗V} is flip-invariant | both invariances hold in finite volume | locator reworded |
| 1.2, existing Checks | chain {0,1,2}; `(δ₀+δ₁)/2` | `tanh J`, `tanh² J`; mean ½ | unchanged and correct | none |
| 3.1, 3.3, 3.5, 3.7 locators | `sokal-1982` lines 412–435 | "μ satisfies the following correlation inequalities" covers (d)–(k); the finite-volume sources of each target (Peled–Spinka Thms 2.1 and 2.3; Glimm–Jaffe Ch. 4; Aizenman–Duminil-Copin (3.11)) still carry the finite-volume claim, and 3.7(c) is derived in the README from 3.1 and 3.5 | locators are now accurate | qualifier added |

## Checks run

**Dependency check (gate), after all edits:**

```text
candidate: ConstructiveFieldTheoryPhi4 is not in the merge order yet; checked as if placed after RelativisticQuantumFieldTheory (the intake inserts it when its design is accepted)
depcheck: 241 roadmaps, 2250 edges, 0 problem(s)
```

The output has no UPWARD, CYCLE or `moved:` line.

**Other checks.**

- `plan.json` parses after the edits.
- The README has no `$`, `\(` or `\[`.
- The design has no `Suggested.lean`, so there was nothing to elaborate and no `#check` scratch file.

No gate failures were listed for this round.

## Notes for the maintainer

- No statement, hypothesis, supplier, name or section number changed, so no other roadmap is affected.
- The repairs add no object. Ownership against open pull requests was therefore not re-checked this round.
- No new source was cited, and `sources.toml` is unchanged.
- The review text contained no suspicious instructions.
