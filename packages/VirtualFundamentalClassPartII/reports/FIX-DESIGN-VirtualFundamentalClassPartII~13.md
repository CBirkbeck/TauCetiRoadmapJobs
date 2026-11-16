# FIX-DESIGN-VirtualFundamentalClassPartII~13

Findings of REV-DESIGN-VirtualFundamentalClassPartII~12: one, P3.

## F01 (P3) — applied differently

Changed: in 3.5, the single *Needs:* line → two lines. Homotopy invariance: 2.2; 2.3; 3.1; **3.2**; 3.3;
SchemeAndStackFoundations §§5.2–5.4. Gysin maps: homotopy invariance; **2.1**, 2.2; 2.3; 3.1–3.3;
VirtualFundamentalClass §1.5; the normal-cones gap; SchemeAndStackFoundations §§5.2, **5.3**, 5.5. The
plan's 3.5 gains `target:2.1`. Layer 3's Dependencies and "How to read the build" gain one clause each.

Verification. The finding is right in substance. Homotopy invariance on algebraic spaces needs no
normal cone, no Gysin map of a local immersion, VirtualFundamentalClass §1.5 or SchemeAndStackFoundations
§5.5. SchemeAndStackFoundations §5.2 says `chow_affine_bundle` "precedes and uses no Gysin map". Its
injectivity uses only §5.4, which uses §§5.2–5.3. Yet the old line put homotopy invariance behind
gap:normal-cones-of-local-immersions.

The proposed repair is wrong in two places, so it was applied as corrected below.

1. **3.2 stays on the homotopy-invariance line.** The review says the statement "and route use no
   immersion, no cone and no pushforward". The route does use 3.2's proper representable pushforward,
   three times:
   - Lemma 27.1 (stacks-chow-spaces lines 1907–1911) is a statement about
     `π_*(c_1(O_P(1))^s ∩ π^*α)` for `π : ℙ(N ⊕ O_U) → U`.
   - The first Chern class is defined through `i_*` along the closed immersion `W → X` (its Definition
     18.1, line 1109).
   - The injectivity step writes `π^*α = i_*β` for `D ⊂ P` (Lemma 27.3, lines 2001–2005).

   The review's witness uses pushforward too. For `U = Spec k`, `N = 𝔸¹`:
   - `P = ℙ¹` and `D = {∞}`.
   - `p^*α = 0` gives `π^*α ∈ i_*A_1({∞}) = 0`.
   - Then `α = π_*(c_1(O(1)) ∩ π^*α)`. On `α = [pt]` this reads `π_*(c_1(O(1)) ∩ [ℙ¹]) = π_*[pt] = [Spec k]`.

   Listing 3.3 alone does not cover this: the `π_*` of Lemma 27.1 is not the localisation sequence.
2. **The Gysin line needs SchemeAndStackFoundations §5.3**, which the proposal drops. Vistoli's proof
   of Theorems 3.11–3.13 rests on Lemma 3.15. That lemma's proof uses "the projection formula for
   divisors" (vistoli1989 line 1155), i.e. intersection with Cartier divisors and its projection
   formula. In the scheme supplier this is §5.3 (`proper_pushforward`, `eq_cartier_divisor`). The same
   proof uses the deformation to the normal cone (lines 1151–1154), which is §5.5.
3. **The Gysin line also gains 2.1.** Its route names "étale descent of cycles (2.1)". The plan's
   prerequisites therefore become the union of the two lines plus `target:2.1`. The review's "stay as
   they are" is otherwise kept.

The plan's `vectorBundlePullback_bijective` api entry gains one sentence giving its own needs.

Same pattern elsewhere. The pattern is a single *Needs:* line that holds one separately proved statement
of a section behind an item that neither it, its route nor its other needs use. Every section was read
for it.

Repaired (each line now reads "base items; for statement X, also Y"; each union is unchanged):
- **1.1.** The existence of a finite cover (rydh2015 Theorem B) and of a proper cover of a stack
  separated over a Noetherian scheme sat behind gap:closed-substacks-of-stacks. That gap now stands only
  on proper coverings of integral stacks and passage to closed substacks. Witnesses:
  `Spec k → BG` and `L → B_{𝔸¹}G` use no closed substack.
- **5.2.** The Keel–Mori statement needs only §1.23. The gap and 1.1–1.3, 2.3, 4.1 now stand on the
  first three statements only.
- **5.4.** The closed formula needs 1.2–1.3, the gap and §1.20. The agreement on proper schemes and
  algebraic spaces needs §5.2. Only the moduli-space computation needs 5.2 and VirtualFundamentalClass
  §7.7.
- **8.3.** The smooth case uses neither 8.1–8.2, VirtualFundamentalClass §1.6 nor a non-closed graph.
  Its route is the cone-stack sequence of §5.5 and the comparison bundle of 6.1. Those items now stand
  on the second case and the choice of `Z′_0`.
- **9.4.** The two-term resolution of `Rπ_*V` needs 9.2 and StableReduction Layer 2. 6.2 and 9.3
  stand only on the global resolution of the obstruction theory.
- **2.3.** Tau Ceti and §5.1 stand on the scheme comparison; VirtualFundamentalClass §2.1 on the
  separated comparison.
- **5.1.** §5.6 stands on the comparison on smooth schemes; VirtualFundamentalClass §2.5 on Poincaré
  duality.
- **8.1.** VirtualFundamentalClass §§1.6, 9.1 stand on the compatibility with smooth factorisations
  and the two invariance statements. The definition of `β` and its smooth base change need neither.

Checked and unchanged:
- **3.3.** Push–pull needs images of integral substacks (the gap, through 3.2); localisation needs
  closed substacks. The needs are identical.
- **4.3.** Homotopy invariance on stacks needs 1.1, 4.1, 4.2 (its inverse `s^!`) and §5.2. The extra
  items for Chern classes are needed by it anyway:
  - §5.4 through `chow_affine_bundle`'s injectivity;
  - §5.5 through 4.2 → 3.5.
- **6.3.** Both formulas need 4.3, 6.2, VirtualFundamentalClass §§3.3, 9.1.
- **9.2.** Its route takes every statement from the same chart-level inputs (SchemeAndStackFoundations
  §§2.19–2.20 "give these statements there"), so no separation would be exact.
- **All other sections** (1.2, 1.3, 2.1, 2.2, 3.1, 3.2, 3.4, 4.1, 4.2, 4.4, 5.3, 6.1, 6.2, 7.1, 7.2,
  8.2, 8.4, 9.1, 9.3, 9.5) prove one statement, or statements with the same needs.

## Adversarial pass on the changed text

The changes are dependency lists. Each row instantiates the statement and checks that every item on its
line is used and that nothing it uses is missing.

| Statement | Instance | Values computed | Result | Change |
|---|---|---|---|---|
| 3.5 homotopy invariance, injectivity | `U = Spec k`, `N = 𝔸¹`, `j = 0` | `P = ℙ¹`, `D = {∞}`, `A_1(D) = 0`; `A_1(ℙ¹) = ℤ → A_1(𝔸¹) = ℤ` iso; `π_*(c_1(O(1)) ∩ π^*[pt]) = π_*[pt] = [Spec k]` | uses 3.1, 3.2 (`π_*`, `i_*`), 3.3, c_1; no normal cone | 3.2 kept |
| 3.5 homotopy invariance, other degree | same, `j = −1` | `A_{−1}(Spec k) = 0 = A_0(𝔸¹)` (`[1] = div(x − 1)`) | holds | none |
| 3.5 homotopy invariance, degenerate | `c = 0`; `U = ∅` | `p = id`, `ℙ(O_U) = U`, `D = ∅`; `0 → 0` | holds; only 3.1 used | none |
| 3.5 homotopy invariance on a non-scheme | `X` of 4.2, `N = X × 𝔸¹` | `A_0(X) = 0 = A_1(N)`; `A_1(X) = ℤ·[X] → A_2(N) = ℤ·[N]` | holds; route through 2.3 on spaces | none |
| 3.5 Gysin: Vistoli Lemma 3.15 | `{0} → 𝔸¹`, `q : z ↦ z²`, `d = 2` | `q_*[𝔸¹] = 2·[𝔸¹]`; cone of `V(z²)` in `𝔸¹` has cycle `2·[line]`; `h_*` gives `2·[C_{X/Y}]` | proof uses §5.3 (projection formula for divisors) and §5.5 (deformation space) | §5.3 added |
| 3.5 Gysin: non-closed local immersion | `Spec k → BG`, `Y = Spec k` | `f^![Spec k] = [G]`, pushforward `\|G\|·[Spec k]` | needs gap:normal-cones-of-local-immersions | kept |
| 3.5 Gysin: cycles on an algebraic space | 4.2's codimension-`0` regular local immersion `f : X → 𝔸¹_ℝ`, `Y = 𝔸¹_ℝ` | `f^![𝔸¹_ℝ] = [X]`, a cycle on the non-scheme `X` given on its chart `𝔸¹_ℂ` as `[𝔸¹_ℂ]` with equal pullbacks to the chart overlap | uses 2.1 (descent of cycles); for algebraic-space `Y`, the route also descends the rational equivalence in `W_*` (2.2) | 2.1 added |
| 3.5 plan union | the two lines | {2.1, 2.2, 2.3, 3.1, 3.2, 3.3, VFC §1.5, gap, SAF §§5.2–5.5} | equals the plan's 12 prerequisites | `target:2.1` added |
| 1.1 existence without the gap | `BG`; `B_{𝔸¹}G` | `Spec k → BG` finite étale of degree `\|G\|`; `L → B_{𝔸¹}G` of degree `2` | no closed substack used | gap qualified |
| 1.1 integral case uses the gap | `[𝔸¹/μ₂]`; `Bμ₂ ⊂ [𝔸¹/μ₂]` | `𝔸¹ → [𝔸¹/μ₂]` integral proper covering; base change to `Bμ₂` is `{0}` | needs integral and closed substacks | gap kept there |
| 5.2 Keel–Mori bullet | `[𝔸¹/μ₂]` | `M = 𝔸¹`, `p : x ↦ x²`; orbits `{a, −a}` ↔ `a²` bijective on `Ω`-points | uses §1.23 only | qualified |
| 5.2 bijection of substacks | same | `Bμ₂ ↦ {0}`; `({0} ×_M ℳ)_red = [V(x)/μ₂]` from `[V(x²)/μ₂]` | uses the gap | kept |
| 5.4 closed formula | `[Spec ℂ/(ℤ/4)]` over `ℝ` | `[ℝ : ℝ]/2 = 1/2 = 2/4` | uses 1.2–1.3, gap; not 5.2 | qualified |
| 5.4 agreement on schemes | `P = V(t² + 1) ⊂ ℙ¹_ℝ` | `∫[P] = [ℂ : ℝ] = 2` | uses §5.2; not 5.2 or VFC §7.7 | qualified |
| 5.4 moduli space | `[ℙ¹/μ₂] → ℙ¹`, `t ↦ t²` | `∫[𝒫] = 1/2`, `p_*[𝒫] = (1/2)·[0]`, `∫_{ℙ¹} = 1/2` | uses 5.2 | kept there |
| 8.3 smooth case | `v : 𝔸¹ × Z → Z`, `X = Z = 𝔜 = Spec k`, `E = 0`, `F = Ω_{𝔸¹}` | `v^![pt] = [𝔸¹] = [𝔸¹, Ω_{𝔸¹}]^vir` (6.3, `H^{−1} = 0`); `B T_{𝔸¹} → 𝔠 → 𝔸¹`, dimension `0` over dimension `1` | uses 3.1, 6.1–6.2, VFC §5.5; no 8.1–8.2 | qualified |
| 8.3 second case, non-closed graph | `𝔜 = Spec k`, `Z = BG`, `Z′ = Spec k` | graph `Spec k → Spec k × BG = BG`, finite étale of degree `\|G\|`, not a closed immersion | needs the gap and 4.2 | kept there |
| 9.4 resolution alone | `V = O`, smooth genus `g` fibres, `L` relatively ample | `RΓ(C, O) ≅ [H¹(C, H) → H¹(C, G)]`, `χ = 1 − g` | uses 9.2, StableReduction Layer 2 | qualified |
| 2.3 algebraic-space comparison | line `L` with doubled origin | `A_0(L) = ℤ²/ℤ·(1, 1) ≅ ℤ` in both theories | no Tau Ceti, §5.1 or VFC §2.1 | qualified |
| 5.1 duality | `T = 𝔸¹ ⊔ 𝔸¹ → 𝔸¹` | `A^*(T → 𝔸¹) ≅ A_*(T)_ℚ`: `ℚ²` in dimension `1`, `0` in dimension `0` | no §5.6 | qualified |
| 8.1 definition of `β` | plane example | `∂β = [ν = 0] − [η = 0]`, `β = c·ν/η` | uses the gap, 2.2, §5.5; no tangent action | qualified |

## Checks run

- Dependency check:

      candidate: VirtualFundamentalClassPartII is not in the merge order yet; checked as if placed after StableReductionPartII (the intake inserts it when its design is accepted)
      depcheck: 243 roadmaps, 2247 edges, 0 problem(s)

  There is no UPWARD and no CYCLE line.
- Citation resolver on the README: nothing unresolved (no cross-roadmap citation and no Lean name
  found nowhere).
- `plan.json` parses. Its diff is two lines: `target:2.1` in 3.5's `prerequisites`, and one sentence in
  the `vectorBundlePullback_bijective` api statement. Formatting is unchanged.
- The cited supplier sections are on main: SchemeAndStackFoundations §5.3 (`proper_pushforward`,
  `inter_comm`, `eq_cartier_divisor`) and §5.5 (`deformationToNormalCone`).
- No `Suggested.lean` at this stage, so no elaboration and no `#check` comparison were run.
- No source was fetched. The locators added are vistoli1989 lines 1151–1155 and stacks-chow-spaces
  Definition 18.1 and Lemma 27.1, lines 1907–1911, read in the cached texts. No
  `needs-references.toml` was written.
- Ownership: no construction was added or moved, so ownership is as in the previous round.

## Notes for the maintainer

- No name that another roadmap cites changed. No section number changed. The two gaps keep their
  slugs, suppliers and `neededBy` lists.
- Homotopy invariance on algebraic spaces now depends on nothing outside this roadmap's Layers 2–3 and
  SchemeAndStackFoundations §§5.2–5.4. It can be built before the normal-cones gap is filled.
