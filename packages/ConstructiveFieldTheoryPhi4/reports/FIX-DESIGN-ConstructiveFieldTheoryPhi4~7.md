# FIX-DESIGN-ConstructiveFieldTheoryPhi4~7: repair report

One review: `REV-DESIGN-ConstructiveFieldTheoryPhi4~6`, one finding (P3). Its "For the human reviewers" section (seven uncertified texts, the licence of `frohlich-1982`) lists no finding and was not acted on.

## F01 (P3) — applied differently

**Verified.** A section with several targets carried one `*Needs:*` line, so an implementer of one target appeared blocked by inputs only another target uses. In 2.1 only the Lee–Yang property uses the maximum modulus principle and ZerosOfLFunctions §5.5. The README line and plan 2.1 also disagreed (README had 1.2 and lacked `Measure.map`; the plan had `Measure.map` and lacked 1.2).

**2.1 (as asked, with two additions).** Old: "0.2; 1.1; 1.2; Mathlib `Complex.norm_le…`; ZerosOfLFunctions §5.5" → new: "0.1; 0.2; 1.1; Mathlib `MeasureTheory.Measure.map`; for the evenness of the block measures and for the Lee–Yang property, 1.2; for the Lee–Yang property only, also Mathlib `Complex.norm_le_of_forall_mem_frontier_norm_le` and ZerosOfLFunctions §5.5". Added 0.1 because the admissibility API uses 0.1's bounded-support fact. Scoped 1.2 because only the spin-flip invariance of the Ising Gibbs measure uses it: it gives evenness, and through E(−h) = E(h) the Lee–Yang property. The block-spin representation uses only 1.1 (decoupling and relabelling) and `Measure.map`, and the Lee–Yang theorem uses only ρ_I and the Hamiltonian. Plan 2.1 gains `target:0.1` and `target:1.2`. Layer 2 Dependencies gain `MeasureTheory.Measure.map`. The reviewer said those Dependencies already contained every name, but `Measure.map` appeared only under Layer 0.

**3.7 (not applied as written: the suggested repair is flawed).** The review suggested "for Newman's bound only, 2.3 and 3.5". But Newman's bound is stated for every member of the Griffiths–Simon class, so it needs the class (2.2) and the Gaussian inequality (3.5). It does not need the theorem that φ⁴ measures are members (2.3). Nothing else in 3.7 uses 2.3 either: its Checks use ρ_I, which is a member by the API of 2.2. New line: "0.2; 1.1; 1.2; for Newman's bound only, 2.2 and 3.5". Plan 3.7: `target:2.3` → `target:2.2`.

**Consequence in 4.2.** 4.2 shows the uniform exponential moment condition for φ⁴ measures by combining 3.7(b), membership of φ⁴ measures in the class (2.3) and Newman's bound (3.7(c)). It used to reach 2.3 only through 3.7, so it now lists 2.3 itself. Plan 4.2 gains `target:2.3`. Layer 4 Dependencies: "Layers 1 and 3 (and Layer 2 through 3.5 and 3.7)" → "Layers 1 and 3, and Layer 2 (through 3.5 and 3.7, and 2.3 for the φ⁴ case of 4.2)".

**The same pattern elsewhere, repaired.** I checked every `*Needs:*` line against the targets in its section. Where an input is needed by only some of the section's targets, it is now scoped to them. The union of each line is unchanged, so each still matches its plan entry:
- 2.2: the tail-control inputs (the Lee–Yang property, tightness, Young, the Gaussian mgf) and the transfer inputs (1.1, 1.2, 1.4) are scoped. The definition needs only 0.1 and the Ising-block measures.
- 3.5: the Ising inequalities need 1.1, 3.1 and 3.4. The class extension and the corollaries also need 1.4, 2.1 and 2.2. Before, the Ising part looked blocked by the Lee–Yang chain.
- 3.6: checking the hypotheses for nearest-neighbour couplings needs only the Conventions.
- 4.1: 3.5 is only for the Lebowitz, Gaussian and Simon–Lieb inequalities of the limits. Before, 4.2–4.4 looked blocked by Layer 2.
- 4.3: 3.5 is only for the Simon–Lieb bound, so 4.4 no longer looks blocked by Layer 2.
- 5.4: 5.3 is only for the infrared bound.
- 6.1: StochasticCalculus §1.1 and the projective-limit names are only for the realisation.
- 7.1: 3.2 is only for monotonicity in R. The vanishing criterion needs only positivity of the Gibbs density and the variance of an independent sum.
- 7.2: 1.2 and 1.5 are only for the automatic-stability API.
- 7.4: RelativisticQuantumFieldTheory §7.1 is only for the kernel representation. The reachability inputs are 1.5, 7.2, 7.3 and the characteristic-function names. This matches the plan's existing split into 7.4 and 7.4.1, and the reachability route works entirely in Fourier space.

Lines left as they were, because every input is used by every target of the section: 0.1, 0.2, 1.1–1.5, 2.3, 3.1–3.4, 4.4, 5.1–5.3, 5.5, 6.2–6.4 and 7.3. In 0.1 and 5.1 the only inputs not shared by all targets are pinned Mathlib declarations, which block nobody.

### Adversarial pass on the changed lines

| Statement / line | Instance tried | Computed | Result |
|---|---|---|---|
| 2.1 evenness needs 1.2 | N = 2, K = (ln 2)/2, q = (½, ½) | Spin flip σ ↦ −σ preserves `μ_{Fin 2,K,ρ_I}` (weights `¼e^K, ¼e^K, ¼e^{−K}, ¼e^{−K}` swap in pairs). The law of t = (σ₁+σ₂)/2 is uniform on {−1,0,1}: P(±1) = `¼e^K/Z` with `Z = ½(e^K + e^{−K})`. At e^K = √2: `(√2/4)/(½(√2 + 1/√2)) = (√2/4)/(3/(2√2)) = 1/3`, and P(0) = 1/3 | evenness comes from spin flip (1.2); scoped correctly |
| 2.1 block-spin representation without 1.2 | V = {x, y}, N = 1, q = (s), coupling J | Image of the Ising pair at coupling Js²: ⟨φ_xφ_y⟩ = `s² tanh(Js²)`, computed with 1.1 alone (Z = cosh Js²) | needs only 1.1 and `Measure.map` |
| 2.1 Lee–Yang theorem without 1.2 | one site | `Z^I(h) = cosh h`, zeros at Re h = 0; uses only ρ_I and the Hamiltonian | needs only 0.2 and 1.1 |
| 3.7(c) needs 2.2, not 2.3 | ρ_I (a member by the 2.2 API) | `cosh a ≤ e^{a²/2}`: at a = 2, 3.7622 ≤ 7.3891 | Newman's bound for a member needs no φ⁴ input |
| 3.7(a)–(b) without 2.2, 3.5 | one site, b = 0, J = 0 | ⟨φ⁴⟩ = 1/(4λ); M(λ,0,0) = `(0 + √(16λ))/(8λ) = 1/(2√λ)` ≥ 0.338/√λ | identity and bound use only 0.2, 1.1, 1.2 |
| 4.2 φ⁴ case needs 2.3 | ρ_{1,0}, d = 1, nearest-neighbour J = ¼ | ‖J‖ = ½ (row sum of the restriction ≤ Σ_z J(z) = ½). M(1,0,½) = `(½ + √(¼ + 16))/8 = (0.5 + 4.0311)/8 = 0.5664`. Newman (with 2.3) gives ⟨e^{|φ_x|}⟩ ≤ `2e^{0.2832} = 2.655`, uniformly in R | 2.3 is a real input of 4.2; M increases with ‖J‖, so the bound is uniform |
| 4.2 bounded-support case | ρ_I, any J | ⟨e^{a\|σ_x\|}⟩ = e^a | needs neither 3.7 nor 2.3 (the line scopes 3.7 to φ⁴ and the class) |
| 4.1 without 3.5 | d = 1 Ising | Monotone limit `tanh^{\|x\|} J` from 3.2 alone | definition needs 3.2, not 3.5 |
| 4.3 without 3.5 | ρ = δ₀; J = 0 | S ≡ 0, χ = 0; χ = ∫φ²dρ | S, χ, β_c defined from 4.1 only |
| 5.4 sum rule without 5.3 | L = 1, d = 1 Ising | `½((1+t) + (1−t)) = 1 = ⟨σ₀²⟩` | needs 5.1 only |
| 6.1 definition without §1.1 | T_f = \|∫f\| non-example; T ≡ 0 | `T_{−f} = T_f ≠ −T_f`; zero field linear | definition and transport need no extension theorem |
| 7.1 vanishing without 3.2 | ρ = δ₀; ρ_I, J = 0 | Σ = 0; Σ = (2L+1)^d > 0 | vanishing criterion uses only the positive density and the variance of an independent sum |
| 7.2 definition without 1.5 | ρ_n = ρ_I, J_n = 0 | white noise `2^{−d}∫fg` | definition needs 1.1, 6.1, 7.1 |
| 7.4 reachability without §7.1 | d = 1, m = 1 | `C_1(1_Q,1_Q) = 2 − (1 − e^{−2}) = 1 + e^{−2} = 1.1353` from the Fourier/position formula of the Conventions witness | the reachability route works in Fourier space; §7.1 only for the kernel |

No Check or worked example uses a changed object: only dependency lines changed, and every statement, hypothesis and value is as before.

## Checks run

**Dependency check (gate):**

```text
candidate: ConstructiveFieldTheoryPhi4 is not in the merge order yet; checked as if placed after RelativisticQuantumFieldTheory (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2232 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The suppliers are unchanged: StochasticCalculus §1.1, StandardDistributions §5.3, ZerosOfLFunctions §5.5 and RelativisticQuantumFieldTheory §7.1.

**Citations:** `roadmaps resolve` on the edited README lists no cross-roadmap citation and no Lean name found nowhere. `MeasureTheory.Measure.map` (Mathlib/MeasureTheory/Measure/Map.lean:96) and `Complex.norm_le_of_forall_mem_frontier_norm_le` (Mathlib/Analysis/Complex/AbsMax.lean:404) were reopened at the pin.

**plan.json** parses. The only changes are three prerequisite lists (2.1, 3.7, 4.2). `gaps` stays empty.

**Lean:** the design has no `Suggested.lean`, so no `#check` file was elaborated and no Lean command was run.

**Ownership:** no new object was introduced, so there was no new ownership question. Ownership against the open pull requests is as the review recorded it.

## For the maintainer

- No name, section number or target id changed. Other roadmaps' citations are unaffected.
- The dependency graph inside the roadmap changed slightly. 3.7 now depends on 2.2 instead of 2.3, and 4.2 depends on 2.3 directly. Among the scoped lines, the Ising half of 3.5 and the definitions of 4.1 and 4.3 no longer depend on Layer 2 (the Lee–Yang chain and ZerosOfLFunctions §5.5).
- `sources.toml` is unchanged, and `needs-references.toml` was not written: no new source is cited.
