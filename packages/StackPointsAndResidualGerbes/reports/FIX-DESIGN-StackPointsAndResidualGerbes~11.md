# FIX-DESIGN-StackPointsAndResidualGerbes~11

Repair of the findings of the round-10 design review (three findings, all P3). Every finding was
verified against the plan, the cited sources and the supplier roadmaps; all three are applied. Files
changed: `packages/StackPointsAndResidualGerbes/design/README.md`,
`packages/StackPointsAndResidualGerbes/design/plan.json`,
`packages/StackPointsAndResidualGerbes/sources.toml`.

## F01 (P3) — applied

Verified by script on `plan.json`: the direct layer edges of the target prerequisites are
1→{0}, 2→{0}, 3→{0,2}, 4→{0–3}, 5→{0,2–4}, 6→{0–5}, 7→{0–4,6}. No *Needs* line of 2.1–2.6, 3.1–3.5
or 5.1–5.5 names a 1.x target. (5.3's last API bullet mentions finite type points, but only through
4.1, so the dependency on Layer 1 runs through Layer 4.)

Old → new: build paragraph "Layers 0–3 are linear; Layer 4 uses 3; Layer 5 uses 3 and 4; Layer 6
uses 4 and 5" → "Layers 1 and 2 each use Layer 0 only …; Layer 3 uses 0 and 2; Layer 4 uses 0–3; Layer
5 uses 0 and 2–4; Layer 6 uses 0–5". Dependencies lines: Layer 2 → "Layer 0", Layer 3 → "Layers 0
and 2", Layer 5 → "Layers 0 and 2–4".

Pattern: the Layer 1, 4, 6 and 7 Dependencies lines already equal their direct edges; the plan has
no layer-level dependency field.

## F02 (P3) — applied

Verified. ahr2020 lines 475–476 assume `𝒳` quasi-separated. The design never uses it:
- 4.5 rests on Lemma 101.51.4, which needs only local Noetherianity (stacks-06RD lines 4870–4878).
- 4.1 rests on Lemma 101.18.7 (stacks-06RD lines 1609–1616).
- The Rim–Schlessinger condition holds over any locally Noetherian base (stacks-artin lines 292–293).
- AlgebraicModuliForArithmeticGeometry §§8.1 and 8.3 assume only a locally Noetherian `S`.

Old → new.
- Layer 7 standing paragraph: adds that the source assumes quasi-separatedness, why no statement or
  route uses it, and that the Checks of 7.4 include a stack that is not quasi-separated.
- 7.4 locator: "under the affine stabilisers of line 476" → "under the quasi-separated stack with
  affine stabilisers of lines 475–476; quasi-separatedness is not used".
- New 7.4 Check, plan test `nonQuasiSeparated`.
- Plan locators of 7.2, 7.3 and 7.4 now say the same.

Applied differently in one detail: in the reviewer's instance `N_x = 0` (a 0 = 0/0 witness). I used
a variant where both sides are nonzero. `G = ℤ` over `ℚ` acts on `V = (ℤ × 𝔸¹) ⊔ 𝔸¹` by shifting the
index and by translation, with `x = (0, 0)`. Then `[V/G] = 𝔸¹ ⊔ 𝔸¹/ℤ` and `N_x = ℚ·∂_t = T_{V,x}/0`.

Pattern: 6.4 cites alper-moduli Proposition 4.5.16 (2). Alper's "Noetherian" stacks are
quasi-separated by definition (alper-moduli lines 6234–6236, Definition 4.3.21). 6.4 also cites
ahr2020 §3.1. Its list of unused source hypotheses lacked quasi-separatedness. It now reads
"Noetherian, hence quasi-separated … ahr2020 lines 475–478, for quasi-separated `𝒳`" and adds "nor
quasi-separatedness of `𝒳` (neither 4.1 nor 4.5 assumes it)"; the plan locator of 6.4 says the same.
The manifest's alper-moduli `cited_for` now lists Definition 4.3.21. Other sites checked:
- 5.3 and 6.2 already name "for Noetherian stacks".
- 6.3 cites alper-moduli for comparison only.
- The Luna Check of 7.4 keeps quasi-separatedness, which Theorem 1.2 really needs.

## F03 (P3) — applied

Verified. The worked example cites (0.3, 0.5), (3.3, 4.5), (6.4) and (1.4; …). Old → new: in the
README consumer line, "0.3, 0.5, 1.4, 4.5 and 6.4" → "0.3, 0.5, 1.4, 3.3, 4.5 and 6.4". In the plan
`consumers` entry, "(0.5, 1.4, 4.5, 6.4)" → "(0.3, 0.5, 1.4, 3.3, 4.5, 6.4)". Pattern: the other three
consumer entries (LanglandsParameterStacks, MotivicStructuresInModuliOfCurves,
VirtualFundamentalClasses) already list the same targets in the README and in the plan.

## Checks run

Dependency check (`gate --only StackPointsAndResidualGerbes`), output:

    candidate: StackPointsAndResidualGerbes is not in the merge order yet; checked as if placed after AlgebraicModuliForArithmeticGeometry (the intake inserts it when its design is accepted)
    depcheck: 246 roadmaps, 2242 edges, 0 problem(s)

No UPWARD or CYCLE line.

Consistency, by script:
- 38 targets, 139 README Checks against 139 plan tests, equal per target (7.4: 6 and 6).
- Every *Needs* line equals its plan prerequisites in target numbers and gap slugs (0 mismatches).
- `plan.json` round-trips; `sources.toml` parses with 25 entries.

Gate failures: none were listed for this round.

Lean: a design has no `Suggested.lean`, so no `#check` comparison applies. No Lean was run.

## Adversarial pass on changed statements

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| Build paragraph and Dependencies of Layers 2, 3, 5 | target prerequisites per layer | 2→{0}, 3→{0,2}, 5→{0,2,3,4}; Layer 5 reaches Layer 1 only via 4.1 → 1.1 | text equals the edges | F01 |
| Layer 7 standing paragraph (quasi-separatedness unused) | 4.5 on `[𝔸¹/𝔾_m]` at `0`; 6.4 on `𝔸¹ ⊔ 𝔸¹/ℤ` at the origin; RS for `𝔸¹/ℤ` | `B𝔾_m → 𝒳` closed immersion (locally Noetherian, Lemma 101.51.4); `𝒵_x = Spec ℚ = B1`, closed; RS holds over the Noetherian base `Spec ℚ` (Lemma 98.5.2) | holds without quasi-separatedness | F02 |
| 7.4 on a stack that is not quasi-separated | `G = ℤ` on `(ℤ × 𝔸¹) ⊔ 𝔸¹` over `ℚ`, `x = (0, 0)` | `Stab = 1` (affine); orbit `ℤ × {0}`, one closed point per component, closed; `𝔸¹ ×_{𝔸¹/ℤ} 𝔸¹ = ℤ × 𝔸¹ → 𝔸¹ × 𝔸¹`, `(n,t) ↦ (t, t+n)`, not quasi-compact; image of `x` = origin of `𝔸¹`, closed; `𝒵_x = Spec ℚ = [ℤ × {0}/ℤ]`; `N_x = ((t)/(t²))^∨ = ℚ∂_t`, `T_{V,x}/T_{G·x,x} = ℚ∂_t/0`; both of dimension 1 | holds | new Check |
| 7.4 reviewer's instance | `ℤ` on `(⊔_ℤ Spec ℚ) ⊔ 𝔸¹`, `x` of index 0 | `[V/G] = Spec ℚ ⊔ 𝔸¹/ℤ`; `𝒵_x = Spec ℚ`; `N_x = 0 = 0/0` | holds (degenerate) | replaced by the nonzero variant |
| 7.4 hypotheses in the new instance | `G = ℤ` constant over `ℚ` | étale, hence smooth, locally of finite presentation, not quasi-compact; the groupoid is flat and lfp, so `[V/G]` is algebraic (SchemeAndStackFoundations §1.21 `quotientStack_algebraic`); `V` locally of finite type | all standing hypotheses hold | none |
| 6.4 without quasi-separatedness | `𝔸¹ ⊔ 𝔸¹/ℤ` at the origin; `Bμ_p` over `𝔽_p(t)` | `p ∘ x = id`; `𝒵_x = Spec ℚ = BG_x`, closed immersion; `𝒵 = Bμ_p = BG_x` | holds; Alper's Noetherian = qc + qs + locally Noetherian (lines 6234–6236) | 6.4 prose and plan locator |
| Consumer line (F03) | worked-example citations | {0.3, 0.5, 3.3, 4.5, 6.4, 1.4} = listed {0.3, 0.5, 1.4, 3.3, 4.5, 6.4} | equal | F03 |

## Ownership and overlaps

No new target, carrier or supplier edge was added, so ownership is unchanged. The new 7.4 Check uses
SchemeAndStackFoundations §1.21 (on main), which 7.4 already cites. The overlap file lists nothing
dropped and no second copy.

## For the maintainer

- No name that other roadmaps cite changed. No target was renumbered, added or removed.
- One test name was added to the plan: `nonQuasiSeparated` (7.4).
- No source was fetched; every locator used is in the cached texts (ahr2020, alper-moduli,
  stacks-06RD, stacks-artin). `needs-references.toml` was not written.
- The review's "For the human reviewers" section (two licence notes and two ownership notes about
  VirtualFundamentalClasses and FunctionFieldArithmeticPartII) lists no finding; nothing was changed
  because of it.
