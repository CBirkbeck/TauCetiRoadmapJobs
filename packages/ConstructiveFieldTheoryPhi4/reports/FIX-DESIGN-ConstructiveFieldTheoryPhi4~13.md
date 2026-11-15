# FIX-DESIGN-ConstructiveFieldTheoryPhi4~13

This round settles the findings of REV-DESIGN-ConstructiveFieldTheoryPhi4~12: two findings, both P3. Three files were edited: `packages/ConstructiveFieldTheoryPhi4/design/README.md` (4.3), `packages/ConstructiveFieldTheoryPhi4/design/plan.json` (target 4.3) and `packages/ConstructiveFieldTheoryPhi4/sources.toml` (one `cited_for` list). The review's "For the human reviewers" section lists no finding, so nothing was changed because of it.

## F01 (P3) — applied

In 4.3, first API bullet:

- Old: "S(x) ≤ S(0) = ⟨φ_0²⟩ when finite (Cauchy–Schwarz), and S is positive definite: …".
- New: "S(x) ≤ S(0) (Cauchy–Schwarz in V_R and translation invariance when S(0) is finite, trivially otherwise); and, when S(0) < ∞, every S(x) is finite and S is positive definite: …, the sum being `lim_R ⟨(Σ c_xφ_x)²⟩_{V_R}` (4.1)".

The plan's 4.3 `basic` entry was changed to match. I also added one Check and plan test, `positive_definite`.

Why the finding is right: S takes values in `[0, ∞]` (4.3 defines it there, and 4.1 proves finiteness only under a uniform moment bound). With c = δ₀ − δ_x the quadratic form is `2S(0) − 2S(x)`. That is `∞ − ∞` when both values are infinite, so the claim has no meaning without S(0) < ∞.

Under the new hypothesis the claim is proved as follows:

- Each S(x) ≤ S(0) < ∞.
- By translation invariance (4.1), `S(x − y) = ⟨φ_xφ_y⟩`.
- So the sum is the finite limit of `⟨(Σ c_xφ_x)²⟩_{V_R} ≥ 0`.

The new Check shows that positive definiteness is an independent law. With the same c = δ₀ − δ₁ + δ₂:

- the Ising chain gives `2(1 − t)² + 1 > 0`;
- a function that is nonnegative, even and bounded by its value at 0 gives `−1/5`.

Pattern sweep: the README and the plan were searched for every other signed combination of `[0, ∞]`-valued infinite-volume quantities:

- 4.1 and 4.2 state Griffiths II in product form `⟨φ_Aφ_B⟩ ≥ ⟨φ_A⟩⟨φ_B⟩` (3.1).
- The Lebowitz, Gaussian and Simon–Lieb inequalities in 4.1 and 4.3 have nonnegative sums on both sides.
- 4.4 states only inequalities between values.
- The quantities of 5.4 and 5.5 that involve subtraction are finite-volume torus quantities, which are finite.

None has a subtraction of possibly infinite values, so no other place needed a change.

## F02 (P3) — applied

In `sources.toml`, entry `aizenman-duminilcopin-2021`, `cited_for`: "2.3" was inserted between "2.2" and "3.4" (old list 24 entries, new list 25). README 2.3 cites "Aizenman–Duminil-Copin, (2.3)–(2.4) and the paragraph around them, p. 9", and plan entry 2.3 cites the same lines (`lines 392–406`), so the finding is right.

Pattern sweep: I compared all 14 manifest entries with the README section by section, using a script that matches each work's citation form in every `### k.n` section. After the edit:

- Every section that names a work appears in that work's `cited_for`.
- Two lists name a section whose own text does not name the work. I checked both and left them unchanged:
  - `sokal-1982` lists "4.4". Sokal's Remark after (2.29)–(2.30) (`sokal-1982 lines 458–464`, p. 329) states the reflection inequalities for the infinite-volume state. That is the content of 4.4, which reaches it through 3.6, and 3.6 cites the Remark.
  - `simon-2020-twelve-tales` lists "0.2". The Conventions cite Simon, Section 3, p. 25, for the opposite sign convention of the φ⁴ measure that 0.2 defines.

## Adversarial pass on the changed text

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 4.3: S(x) ≤ S(0) | d = 1 Ising, t = tanh J | `t^{|x|} ≤ 1`; for each R ≥ \|x\|, `⟨σ₀σ_x⟩_{V_R} = t^{|x|} ≤ (⟨σ₀²⟩⟨σ_x²⟩)^{1/2} = 1` | holds |
| same | ρ = δ₀; J = 0 | 0 ≤ 0; for x ≠ 0, `S(x) = (∫φ dρ)² = 0 ≤ ∫φ² dρ` | holds |
| same, S(0) = ∞ | any x | the right side is ∞, so the inequality is trivial | holds, as now stated |
| 4.3: positive definiteness under S(0) < ∞ | Ising chain, c = δ₀ − δ_x | `2(1 − t^{|x|}) ≥ 0`; equals 0 only at t = 1, which no finite J attains | holds |
| same | Ising chain, c = δ₀ − δ₁ + δ₂ | `3 + 2(−t − t + t²) = 2t² − 4t + 3 = 2(1 − t)² + 1 ≥ 1` | holds |
| same | J = 0, even ρ | `Σ_x c_x² ∫φ² dρ ≥ 0`, because the off-diagonal terms vanish | holds |
| same | ρ = δ₀ | 0 ≥ 0 | holds |
| identity `Σ c_xc_y S(x − y) = lim_R ⟨(Σ c_xφ_x)²⟩_{V_R}` | Ising chain, c = δ₀ + δ₁ | left side `2 + 2t`; right side `⟨(σ₀ + σ₁)²⟩ = 2 + 2t` for every R ≥ 1 | agree |
| same | J = 0, c = δ₀ − δ₁ | left side `2S(0) − 2S(1) = 2m₂`; right side `⟨(φ₀ − φ₁)²⟩ = 2m₂` (with `m₂ = ∫φ² dρ`) | agree |
| hypothesis S(0) < ∞ needed for the form to be defined | c = δ₀ − δ_x with S(0) = S(x) = ∞ | `2S(0) − 2S(x) = ∞ − ∞` is undefined | the hypothesis is used |
| new Check, non-example | f(0) = 1, f(±1) = 4/5, f = 0 elsewhere; c = δ₀ − δ₁ + δ₂ | `3 + 2(−4/5 − 4/5 + 0) = −1/5`; its Fourier symbol `1 + (8/5)cos p` is `−3/5` at p = π | not positive definite, while f ≥ 0, f is even and f ≤ f(0), so positive definiteness is an independent law |
| plan 4.3 matches README 4.3 | API `basic`; test count | the same statement and hypothesis; 5 Checks and 5 tests | agree |
| F02: manifest matches README | all 14 entries, every section | 0 sections missing from any list after the edit; the 2 extra entries are explained above | holds |

## Checks run

Dependency gate:

```text
candidate: ConstructiveFieldTheoryPhi4 is not in the merge order yet; checked as if placed after RelativisticQuantumFieldTheory (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2244 edges, 0 problem(s)
```

The gate reports no UPWARD, CYCLE or `moved:` line.

- **Lean:** the design stage has no `Suggested.lean`, so no `#check` scratch file was elaborated and no Lean command was run.
- **Ownership:** no new object, construction or supplier was introduced. The repair adds a hypothesis and a Check to an existing target of this roadmap, so it needed no ownership search against open pull requests.
- **Citations:** no cross-roadmap citation changed.

## Notes for the maintainer

- No name that other roadmaps cite changed.
- No supplier gap is declared or changed.
- No source was fetched, and `needs-references.toml` was not created.
- No suspicious instruction was found in the review text.
