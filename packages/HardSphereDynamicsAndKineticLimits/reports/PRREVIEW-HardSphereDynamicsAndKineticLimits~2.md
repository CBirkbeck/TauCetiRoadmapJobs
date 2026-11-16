# Review of HardSphereDynamicsAndKineticLimits (pull request #2448 at 5372027)

**Verdict:** accepted

## Previous findings

- R01 — repaired: README line 947 now reads "for `d ≥ 2` it is BGSS2023 Theorem 1 restricted to continuous data", adding "BGSS2023 Theorem 1 assumes only (1.1.5), lines 167–168, … and not continuity; the proposition adds continuity". The same repair is at README line 19 and at `Suggested.lean` lines 33–34 and 479–482.
- R02 — repaired: the description now reads "On that flow it builds the transport of densities, the weak Liouville equation with specular reflection and the marginals (Layer 8); …" and "Dependencies: ClassicalErgodicTheory §3.5, items 1, 3 and 4 (…), consumed in §7.2, §7.5, §8.1 and §9.4".

## Verified sound

| Statement | Instances tried | Values computed (roadmap / check) | Result | Change |
|---|---|---|---|---|
| §10.4: (1.1.5) implies the two bounds | `d = 2`, `f⁰ = (1 + ½cos 2πx₁) M_{1,0}(v)`, `C₀ = β₀ = 1` | (1.1.5) ratio `(1 + √(¼ + π²))/2π ≈ 0.6655 ≤ 1`; first bound `1.5/2π ≈ 0.2387`; Lipschitz constant `π/2π = 0.5`; `∫ f⁰ = 1` | holds | none |
| §10.4: the two bounds give (1.1.5) almost everywhere with `2C₀` | `g(x₁) = 1 − ‖x₁‖` on the circle, `C₀ = 1`, at `x₁ = 0.01` | `sup g = 1`, Lipschitz constant 1; `g + |g′| = 0.99 + 1 = 1.99`, which is `≤ 2` and `> 1` | holds; `2C₀` cannot be lowered below `1.99 C₀` | none |
| §10.4, Conventions line 19: "restricted to continuous data" | `d = 2`, `f⁰ = π⁻¹ 1_{v₁>0} e^{−|v|²/2}`, `C₀ = β₀ = 1` | `∫ f⁰ = π⁻¹·π = 1`; (1.1.5): `0.3183 ≤ 1`, `∇_x f⁰ = 0`; jumps from `0.3183` to `0` at `v₁ = 0` | in BGSS2023's class, excluded by `Continuous f₀`: the restriction is strict, as the text says | none |
| Conventions line 19: false for `d = 0` | `f⁰ = 1`, `μ_ε = toNNReal (ε⁻¹ ^ 0) = 1`, `g = 1`, `t = 0` | `Z = 1 + 1 = 2`, `F₁ = ½`; empty sphere gives `Q = 0`, `f(t) = 1`; `½ ↛ 1` | holds | none |
| §10.4 GST2013 locators | Theorem 4, line 668; Definition 5.1.1, lines 1314–1316; space of Theorem 8, Definition 5.1.2, lines 1334–1335 | continuous density assumed at line 668; `X_{0,s,β}` are spaces of continuous functions; `X_{0,β₀,μ₀}` consists of sequences in them | locators hold | none |
| `LanfordStatement.tendsto_empirical` (cites the two bounds of §10.4) | `f⁰ = M_{1,0}`, `d = 2`, `C₀ = β₀ = 1` | first bound `(2π)⁻¹ ≈ 0.159 ≤ 1`; Lipschitz constant 0; Lean `exp (-(β₀ * ‖v‖ ^ 2) / 2)` equals the README's `exp(−β₀|v|²/2)` | holds; Lean code unchanged since 55781a9 | none |

The rows for untouched statements stand as in the previous review, of `55781a9`.

- Source locators checked against the cached texts: 7 in the changed passages. BGSS2023 lines 167–168 and 316–321; GST2013 line 668, lines 1314–1316 (with 1319 and 1334–1335) and 2069–2080. None of the 15 seeded targets falls in the changed passages (Conventions line 19, §10.4 line 947, two docstrings).
- Lean: `git diff 55781a9..HEAD` changes only docstrings. The types of `LanfordStatement` and `LanfordStatement.tendsto_empirical` are as reviewed at 55781a9.
- Cross-roadmap citations resolved: 2. ClassicalErgodicTheory §3.5 items 1, 3 and 4, and §0.2, both checked at `e3c5108`, the head of its open pull request. `roadmaps grep BBGKY` matches only this roadmap.
- Gate: every check 0, OK. Dependency check: `depcheck: 257 roadmaps, 2447 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. No changes outside the folder.
- Elaboration: `lake env lean Suggested.lean` gives 11 `declaration uses sorry` warnings (lines 262–515) and nothing else. This matches the description's "eleven headline theorems with `sorry`".
- Pull-request text: checked against this head. The title, the summary block and the prose all agree with it: "restricted to continuous data", the contents of Layers 8–10, the Dependencies paragraph, the merge-order entry #2231 and the absence of a BBGKY roadmap.

Overlap check: on main and at the open heads, `hard[- ]sphere|Lanford|Boltzmann.Grad` appears only in ClassicalErgodicTheory (lines 72, 1160 and 2440, which leave the hard-sphere flow to its consumers) and MathematicalBilliards (line 971). The scopes of PointProcesses, RelativisticQuantumFieldTheory, CompressibleEulerEquations, DimerModelsAndLozengeTilings, OptimalTransport and RandomMatrices stand as read at 55781a9. The diff adds no object. Owners are unchanged: ClassicalErgodicTheory §3.5 owns conull flows, and MathematicalBilliards §10.5 owns `ℂ/Λ` as a translation surface.

Source independence: changed passages only. I compared 4 passages (README line 19, README line 947, and the module and `LanfordStatement` docstrings) with 3 sources (BGSS2023, GST2013, DengHaniMa2024), scanning for shared 6-word runs. One run is shared, "in the sense of measures", a stock phrase that was already present at 55781a9. No layer was added, removed or reordered. GST2013 still has the largest share (52 of 136 locators at 55781a9; the diff adds 3 GST2013 and 2 BGSS2023 locators). Contents compared with GST2013 at 55781a9: independent.

## Not verifiable

- Lanford1975, cited in the changed passages as the canonical, fixed-`N` statement: it is uncertified and was not read. That description rests on BGSS2023 lines 313–315, which I checked.
- The published versions of GST2013 and BGSS2023 were not read. Numbering was checked in arXiv v2 only.

## Source issues

- none

## For the human reviewers

- The law of large numbers `HardSphere.LanfordStatement.tendsto_empirical` assumes `HardSphere.LanfordStatement d` as a hypothesis. The proof of that proposition is assigned to a roadmap on the BBGKY hierarchy (README lines 11 and 987). That roadmap is neither on main nor among the open roadmap pull requests: `roadmaps grep BBGKY` matches only this roadmap.
