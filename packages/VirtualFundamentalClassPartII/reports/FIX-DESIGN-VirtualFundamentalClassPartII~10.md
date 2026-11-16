# FIX-DESIGN-VirtualFundamentalClassPartII~10

Findings of REV-DESIGN-VirtualFundamentalClassPartII~9 (two, both P3).

## F01 (P3) — applied

Correct: the 1.2 API bullet "`e(𝒱)` is the sum of the degrees `deg(ℐ/𝒱)` of 1.3 …" and the Check
"The inertia formula counts degrees, not components" need 1.3's `deg`, while 1.3 needs 1.2. Moved
the bullet (dropping "of 1.3") to the end of 1.3's API and the Check, unchanged, to the end of
1.3's Checks. In `plan.json`, `genericStabiliserOrder.eq_sum_deg_inertia` and the test
`inertia_sumOfDegrees` moved from target 1.2 to target 1.3. 1.2 now has four Checks and 1.3 seven.

Same pattern elsewhere: 1.1's last Check computed the degree of `L → B_{𝔸¹}G` as
`2 = (e(B_{𝔸¹}G)/e(L)) · [k(t) : k(t)]` "(1.3)", so it used both 1.2 and 1.3. It now reads "finite
étale of degree `2`, the rank of `Q → 𝔸¹`". The formula check moved into 1.3's Check "Separatedness
is asked of the morphism, not of the stacks", where it is `(2/1) · 1 = 2`, and the formula without
the stabiliser ratio would give `1`. `plan.json` test `BG_nonseparatedGroup_finiteCover` (1.1) and
`separatedMorphism_notStacks` (1.3) were changed to match.

To look for the pattern, a script listed every reference from a section to a later section of
this roadmap. The rest are pointers to consumers and compute nothing with the later section:
- 1.3 API, "the integer used by 3.2";
- 3.1 API and Check, 3.3 and 3.5;
- 3.2 API, 3.3;
- 4.2 API, "(8.4)";
- 5.1 Check, "through `∫` (5.4)", where `∫` is VirtualFundamentalClass §2.1's degree;
- 7.2, 9.1 and 9.2 statements, the sections that use them.

None needed an edit.

## F02 (P3) — applied

Correct: 9.2 cited no source. behrend-fantechi1997 lines 1592–1597 read as the review says:
- a dualising complex of `C`;
- `π^! = π^* ⊗ ω_C` for the projection `C × X → X`;
- adjunction;
- duality `Rπ_*(f^*L_V ⊗ ω_C) = (Rπ_*f^*T_V)^∨`.

After 9.2's Serre duality I added "(behrend-fantechi1997 lines 1592–1597, for a product family
`C × M → M` with `C` a projective curve with a dualising complex, which for Gorenstein `C` is the
complex written `ω_C[1]` here; the statements for flat proper Gorenstein families of curves are
those of SchemeAndStackFoundations §§2.19–2.20)". `plan.json` 9.2 locator: lines 1583-1599 →
1592-1597, with the same scope.

Same pattern elsewhere: a script found no other numbered section without a source key (all 33 now
carry one).

## Adversarial pass on changed text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.3 API, `e(𝒱) = Σ deg(ℐ/𝒱)` over dominating components of `(I_𝒱)_red` | `BZ/2`; `BS₃`; `Bμ₃` over `ℚ`; `[𝔸¹/μ₂]` | `1 + 1 = 2`; `6/|Z(c)| = 6/6, 6/2, 6/3 = 1, 3, 2`, sum `6`; `(3/3)·[ℚ:ℚ] = 1` and `(3/3)·[ℚ(ζ₃):ℚ] = 2`, sum `3`; only the identity component dominates, `1` | holds; every `ℐ → 𝒱` is separated (closed in a base change of the separated diagonal) and dominant, so it lies in 1.3's domain | moved from 1.2 |
| 1.3 Check, `L → B_{𝔸¹}G` | `e(L) = 1` (a scheme), `e(B_{𝔸¹}G) = 2` (1.2 Check), `k(B_{𝔸¹}G) = k(t)` (both pullbacks to `𝔸¹ ×_{BG} 𝔸¹ = G` are the structure map) | formula `(2/1)·1 = 2`; generic rank of `O_Q` over `𝔸¹` is `2`; 1.3 API étale formula from the integral scheme `L`: `e·[k(t):k(t)] = 2`; without the ratio, `1` | agrees three ways; finite, hence separated and representable | moved from 1.1 |
| 1.1 Check, degree of `L → B_{𝔸¹}G` | base change along the atlas `𝔸¹ → B_{𝔸¹}G` is `Q = 𝔸¹ ⊔ 𝔸¹ → 𝔸¹` | rank `2` | holds without 1.2 or 1.3 | formula removed |
| 9.2 Serre duality against behrend-fantechi1997 lines 1592–1597 | smooth genus-`g` curve `C`, `M = pt`, `V = O`; `C × M`, `V = F^*T_X` | `(RΓ(O))^∨ = k^g` in degree `−1` and `k` in degree `0`; `RΓ(ω)[1]` gives the same `k^g` in degree `−1` and `k` in degree `0`; the source's complex `ω_C` is `ω_C[1]` for a Gorenstein curve (dimension `1`), so `Rπ_*(F^*Ω ⊗ ω_C[1]) = (Rπ_*F^*T)^∨` is 9.2's formula | holds | locator added |

## Checks run

- **Dependency check:**

      candidate: VirtualFundamentalClassPartII is not in the merge order yet; checked as if placed after StableReductionPartII (the intake inserts it when its design is accepted)
      depcheck: 246 roadmaps, 2242 edges, 0 problem(s)

  There is no UPWARD and no CYCLE line.
- **Citation resolver** (`roadmaps resolve`) on the README: no cross-roadmap citation and no Lean
  name is unresolved.
- **`plan.json`:** it parses, and it re-serialises byte-for-byte in its original format apart from
  the edited entries.

## Notes for the maintainer

- There is no `Suggested.lean` at the design stage, so no elaboration or `#check` comparison was
  run.
- No source was fetched and `sources.toml` is unchanged. behrend-fantechi1997 was already
  recorded, and no `needs-references.toml` was written.
- No name another roadmap cites changed. Nothing on main or at an open head cites
  VirtualFundamentalClassPartII.
- No gate failures were listed for this round.
