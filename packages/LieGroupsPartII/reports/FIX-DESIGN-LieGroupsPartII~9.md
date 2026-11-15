# FIX-DESIGN-LieGroupsPartII~9

Repair of the round-9 design review (`REV-DESIGN-LieGroupsPartII~8`, three P3 findings). Files edited: `packages/LieGroupsPartII/design/README.md`, `packages/LieGroupsPartII/design/plan.json`. `packages/LieGroupsPartII/sources.toml` is unchanged; no source was added and no `needs-references.toml` was written.

## F01 (P3) — applied

§5.1 *Needs:* "§1.1; LieGroups Layers 3, 9" → adds LieGroups Layer 1; §2.2(d) and §2.5 (component-condition clause); §§3.1, 3.5 and RealSemisimpleLieGroups §4.1 (comparison). Layer 5 Dependencies "Layer 1" → "Layers 1–3", plus LieGroups Layer 1 and RealSemisimpleLieGroups §4.1. Plan 5.1 gains the same six prerequisites.

Beyond the requested repair: §3.5 is added because the Conventions define `L_{Π'}` as RealSemisimpleLieGroups §4.3 applied to the minimal parabolic datum of §3.5. RealSemisimpleLieGroups §4.1 is added because it defines `𝔞_{Π'}`, which the comparison uses (`𝔷(𝔩_{Π'}) ∩ 𝔭 = 𝔞_{Π'}`). LieGroups Layer 1 is added because the definition paragraph's "the action on `V` factors through `L/L⁰`" uses it. None of 2.2, 2.5, 3.1 or 3.5 has 5.1 in its prerequisite closure, so the plan stays acyclic.

Pattern: a script compared every `###` section's internal `§` references with the closure of its *Needs:* line under the plan's `target:` edges. The only other hits were false positives: references to examples inside Checks (§1.1→§1.2, §2.4→§§2.5, 3.2, §6.3→§2.5, §8.1→§1.2), RealSemisimpleLieGroups references the regex missed (§6.2→"its §§4.3, 4.4", §6.3→"its §3.1"), and the source locator "Wallach 1988, Ch. 2 §2.1" in §7.1. No other *Needs:* line was incomplete.

## F02 (P3) — applied

Downstream consumers: three bullets asserting uses → two bullets stating what this roadmap provides. "Archimedean representation theory": `P = MAN` of §§3.3, 3.5, the same recipe as AutomorphicFormsOnReductiveGroups §2.3a. "Rank-one geometry": `P` stabilizes a boundary point and contains the parabolic elements. Plan `consumers`: QuantitativeOrbitMethod entry deleted, the other three reworded.

Evidence, read at the open heads: QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups mentions parabolics only for nonarchimedean groups. KleinianGroups mentions only "the parabolic elements and the cusps they fix". FuchsianOrbifoldsPartII mentions only parabolic words, elements and cusps. AutomorphicSpectralTheoryPartII §1.5 takes "a minimal parabolic P=MAN" with *Needs:* AutomorphicFormsOnReductiveGroups §§2.1–2.4. `roadmaps grep --fixed LieGroupsPartII` finds no match. AutomorphicFormsOnReductiveGroups §2.3a defines `M = Z_K(𝔞)`, `A = lieExp 𝔞`, `N = lieExp 𝔫`, `P = MAN`: the same recipe as §3.2 here.

## F03 (P3) — applied differently

§6.1 gains a clause: RealSemisimpleLieGroups §4.4's type uniqueness, with its §4.2 self-normalization, is the second statement for `(P, N_G(𝔞))`; §6.1 is for arbitrary Tits systems, and statements 1 and 3 are not stated there. Added: an `SL_3(ℝ)` Check, a §4.4 contract sentence, a Scope sentence, plan 6.1 text and test `SL3_comparison`.

Why "differently": the suggested text listed "the membership conclusion `g ∈ P_J`" as missing from RealSemisimpleLieGroups. For the second statement it is not missing: RealSemisimpleLieGroups §4.2 states `N_G(Q_{Π'}) = Q_{Π'}` (`TauCeti.TitsSystem.normalizer_standardParabolic`). So `gQ_{Π'}g⁻¹ = Q_{Π''}` and type uniqueness give `Π' = Π''`, and then `g ∈ Q_{Π'}`. What RealSemisimpleLieGroups really lacks is the containment form (statements 1 and 3), and the text says exactly that. Tau Ceti at the pin (`GroupTheory/TitsSystem/Parabolic/{Basic,Classification,Normalizer,DoubleCoset,TitsSystem}.lean`) still has no conjugation statement. `roadmaps grep` finds no other owner.

## Adversarial pass on the changed text

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §5.1 clause "component condition ⇒ components fix `V`" with its new needs | `GL_n(ℝ)`, `n ≥ 1`; `ℝ ⋊ C₂` (inversion); `ℝ² ⋊ C₂` (swap); `O(1,1)` | `GL_n`: `M` = sign matrices, both components, `V = F = ℝ·1`. `ℝ ⋊ C₂`: `M = 1`, `M·L⁰ = ℝ ≠ L`, `F = 0 ≠ V = ℝ`. Swap: `M = 1`, `F = {(u,u)} ≠ V`. `O(1,1)`: `Ad(d) = −1` on `V = ℝY`, `F = 0`. Characters `χ(exp tY) = e^{st}` need `e^{st} = e^{−st}`, so `s = 0` and `⁰L = L`. | The clause holds where the condition holds and its conclusion fails where it fails; it needs §2.2(d) (`V ⊆ 𝔞_L`) and §2.5 | Needs completed |
| §5.1 comparison `𝔷(𝔩_{Π'}) ∩ 𝔭 = 𝔞_{Π'}` | `GL_3`, `Π' = {α₁}`; `Π' = ∅`; `Π' = Π` | `𝔩 = 𝔤𝔩_2 ⊕ 𝔤𝔩_1`, `𝔷 ∩ 𝔭 = {diag(s,s,t)} = ker α₁`. `Π' = ∅`: `𝔞_∅ = 𝔞`, `L = MA`. `Π' = Π`: `𝔞_Π = 𝔷_𝔭`, `L = G` | Holds; uses RealSemisimpleLieGroups §4.1 (`𝔞_{Π'}`), §3.1 (datum on `L_{Π'}`) and §3.5 (datum) | Needs completed |
| Plan graph after the new 5.1 edges | 33 targets | forward or missing `target:` edges: none; DFS: no cycle | Acyclic | — |
| §6.1 clause: type uniqueness plus self-normalization gives the second statement | arbitrary Tits system; `S = ∅` | `gP_Jg⁻¹ = P_{J'}` ⇒ `J = J'` (type) ⇒ `g ∈ N_G(P_J) = P_J`. With `S = ∅`: `B = G`, both trivial | Holds | Clause written |
| §6.1 new Check, `SL_3(ℝ)` | `Q_{{α₁}}`, `Q_{{α₂}}`; `n_{w₀}` = antidiag(1, −1, 1) | `𝔮_{{α₁}}` adds `e₂−e₁`, giving `Q_{{α₁}} = {g₃₁ = g₃₂ = 0}` (stabilizes a plane). `𝔮_{{α₂}}` adds `e₃−e₂`, giving `{g₂₁ = g₃₁ = 0}` (a line); not conjugate. `det n_{w₀} = (−1)·(1·(−1)·1) = 1`. `n_{w₀}Pn_{w₀}⁻¹` is lower triangular, and the entries `g₂₁ ≠ 0`, `g₃₂ ≠ 0` exclude it from both. `w₀ ∉ W_{{α_i}} = {1, s_i}` | Holds; statement 1 is not in RealSemisimpleLieGroups §4.4 | Check added |
| §6.1 statement 3 (re-derived) | general | `gBg⁻¹ ⊆ gP_Jg⁻¹ ⊆ P_{J'}` ⇒ `g ∈ P_{J'}` (statement 1), so `P_J ⊆ g⁻¹P_{J'}g = P_{J'}` and `J ⊆ J'` (`standardParabolic_le_standardParabolic_iff`, `Classification.lean:139`) | Holds | — |
| Consumers: `P` is a boundary-point stabilizer containing the parabolic elements | `SL_2(ℝ)`; `SO₀(2,1)`; `SO₀(3,1) ≅ PSL_2(ℂ)`; `PU(1,1)`; `SO₀(1,1)` | `SL_2`: Möbius stabilizer of `∞` is `c = 0`, which is `P`. `u = ((1,1),(0,1))`: `z + 1 = z` has no finite solution, and `±u ∈ MN ⊆ P`. `K/M`: `SO(2)/1 = S¹`, `SO(3)/SO(2) = S²`, `U(1)/{±1} = S¹ = S^{2·1−1}`. `n = 1`: `P = G`, no parabolic elements, so `n ≥ 2` is needed | Holds | Bullet written |
| Consumers: same recipe as AutomorphicFormsOnReductiveGroups §2.3a | its §2.3a text at its head | `M = Z_K(𝔞)`, `A = lieExp 𝔞`, `N = lieExp 𝔫`, `P = MAN`, equal to §3.2 here | Holds | — |

## Checks

Dependency gate, verbatim:

```text
candidate: LieGroupsPartII is not in the merge order yet; checked as if placed after ArithmeticLocallySymmetricSpaces (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2244 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

`roadmaps resolve packages/LieGroupsPartII/design/README.md` (main 1a19c9f, 477 open heads, index of 2026-11-15T16:56:54Z): no cross-roadmap citation and no Lean name found nowhere. The two leads in the worker's citations file, `LocallySymmetric.realPoints_lieGroup` and `LocallySymmetric.IsCartanInvolution.transposeInverse`, are ArithmeticLocallySymmetricSpaces API names at its open head (README, ALS.F.1 and ALS.0.1). They are not pinned declarations, and the contract cites them as that roadmap's. Unchanged.

Lean: the design stage has no `Suggested.lean`, so nothing was elaborated and no `#check` comparison was run. No backticked name of this roadmap's own was added, renamed or removed.

Ownership against open pull requests was checked with the `roadmaps` tools on the 2026-11-15 index: RealSemisimpleLieGroups, AutomorphicFormsOnReductiveGroups, AutomorphicSpectralTheoryPartII, QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups, KleinianGroups, FuchsianOrbifoldsPartII and ArithmeticLocallySymmetricSpaces were read at their heads. No new construction was added, so no ownership changed.

## For the maintainer

- No section, target id or declaration name changed, and no id that other roadmaps cite was dropped. `roadmaps grep` finds no roadmap citing LieGroupsPartII.
- The plan's `consumers` list now has three entries, not four: QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups is gone, since it uses only nonarchimedean parabolics. The remaining entries describe what this roadmap provides and claim no use by those roadmaps.
- The §6.1 clause depends on RealSemisimpleLieGroups §§4.2 and 4.4 as they are at its open head. A later head that renumbers them breaks this citation, like the existing ones.
