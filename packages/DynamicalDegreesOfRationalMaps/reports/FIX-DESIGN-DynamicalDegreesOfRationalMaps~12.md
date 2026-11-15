# FIX-DESIGN-DynamicalDegreesOfRationalMaps~12

Findings of `REV-DESIGN-DynamicalDegreesOfRationalMaps~11` (two findings, both P3).

## F01 (P3) — applied

Verified: `truong2020` lines 1529–1533 only lift `X` and `f` to the algebraic closure, note that the lift may be reducible, and define the degrees through it. `dang2020` lines 18–20 only say that it passes to the algebraic closure. Neither source states an equality.

- §1.4: "`Γ_{f_{K'}} = (Γ_f)_{K'}` (truong2020 §6.3, line 1529)" → the identities are proved in this section; truong2020 §6.3, lines 1529–1533, only sets the convention (degrees through the possibly reducible lift to an algebraic closure).
- §4.3: "(dang2020 lines 18–20; truong2020 §6.3, lines 1529–1533)" → proved here from §1.4 and CyclotomicClassGroupsAndStickelberger §4.3 (field-extension compatibility); the two sources pass to an algebraic closure by convention.
- §5.3: "§6.3, line 1529" → truong2020 Theorem 1.1 (2) is cited for birational invariance, and §6.3, lines 1529–1533, for the convention; field invariance is proved here from §4.3.

Pattern repair: the same three locators in `plan.json` (`where` of targets 1.4, 4.3, 5.3) are reworded the same way. The prerequisites already list `target:1.4` and `roadmap:CyclotomicClassGroupsAndStickelberger §4.3` (4.3) and `target:4.3` (5.3). `dang2020` lines 18–20 and `truong2020` §6.3 are cited nowhere else. `sources.toml` makes no claim about §6.3 beyond the locator, so it is unchanged. CyclotomicClassGroupsAndStickelberger §4.3 at its open head does list "field-extension compatibility" among its intersection-number facts.

## F02 (P3) — applied

Verified: ArakelovGeometryAndAbelianHeightsPartII has its own §2.2 ("Analytic arithmetic divisors and continuous metrized line bundles"), so "§0.3 (1′) read through §2.2" can be read as that roadmap's section.

- §3.3: "read through §2.2" → "read through §2.2 here", twice (the nef-real-class remark and the Route).

Pattern repair: I checked every bare local `§` that directly follows a supplier's section. §3.5 (the reduction to a surface in the proof) had "(CyclotomicClassGroupsAndStickelberger §4.3), with §2.1, turn" → "with §2.1 here, turn". The other hits were already unambiguous:
- §§3.1 and 4.1 already say "§2.2 here".
- §6.1 says "§0.26 there".
- In §1.4 ("…§0.7), so … and §1.1 gives") and §3.1 ("…§4.3), … and §2.1 writes"), the local section starts a new clause after the parenthesis closes.

`plan.json` has no "read through" wording. Its target 3.2 statement says "this target adds … (through §2.1) … (through §2.2)", which is local by its subject.

## Adversarial pass on the changed passages

No statement, hypothesis or Check changed: only locator wording and the disambiguation "here". I recomputed every Check that uses a statement whose citation changed.

| Statement | Instances tried | Values on each side | Result; change |
| --- | --- | --- | --- |
| §1.4, `Γ_{f_{K'}} = (Γ_f)_{K'}` and `e(f_{K'}) = e(f)` | `ℙ¹_ℂ` over `ℝ`, `id`; Cremona over `ℚ → ℂ`; `z ↦ z²`; projection `ℙ² ⤏ ℙ¹` | base change of the diagonal is two diagonals, so it is not a graph (geometric integrality needed); `e = 1 = 1`; basis `{1, z}`, `e = 2 = 2`; `dim` difference `1` on both sides, `e = 0 = 0` | holds; locator reworded |
| §4.3, extension of the field | `ℙ¹_ℂ` over `ℝ`, `id`, `O(1)`; cuspidal cubic, `id`, `O(1)|_X` | `χ(O(n))` over `ℝ` is `2(n+1)`, so `deg_1 = 2`; over `ℂ`, `1 + 1 = 2`; `ν^*O(1) = O(3)`, `deg_0 = 3 = 3` | holds; locator reworded, route named (§1.4, CyclotomicClassGroupsAndStickelberger §4.3) |
| §5.3, extension of the field | `ℙ¹_ℂ` over `ℝ`, `id`; Frobenius of `ℙ^d` over `𝔽_p → 𝔽̄_p` | `λ_1 = 1 = 1`; `λ_k = p^k` on both sides (from `deg_{k,H}(F^n) = p^{nk}`) | holds; locator split into birational (Theorem 1.1 (2)) and convention (§6.3) |
| §3.3, (1′) through §2.2 here | `A = O(1,1)` on `ℙ¹ × ℙ¹` | `h⁰(mA) = (m+1)²`, `2!·(m+1)²/m² → 2 = (A²)` | holds; wording |
| §3.3 Route, (2′) through §2.2 here | `A = O(1,1)`, `B = O(1,0)`, `p = 3`, `q = 1`, `r = 2`; `p = q = 1` | `p(A²) = 6 > rq(A·B) = 2`; `vol(3A − B) = vol(O(2,3)) = 2·2·3 = 12 ≥ 3·(6 − 2) = 12`; `vol(O(0,1)) = 0 ≥ 2 − 2 = 0` | holds (equality); wording |
| §3.5, "with §2.1 here" | `V(x²) ⊆ ℙ²`, `H = O(1)` | `(H · V(x²)) = 2 = 2·(H · line) = 2·1` (length-weighted law of §2.1) | holds; wording |

## Checks run

Dependency check, full output:

```text
candidate: DynamicalDegreesOfRationalMaps is not in the merge order yet; checked as if placed after ArakelovGeometryAndAbelianHeightsPartII (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2247 edges, 0 problem(s)
```

The output has no UPWARD and no CYCLE line. `plan.json` parses as JSON after the edits.

Lean: the design stage has no `Suggested.lean`, so nothing was elaborated and there was no `#check` comparison to run. No Lean command was run.

## Notes for the maintainer

- No target, Lean name, section number or supplier changed, so no other roadmap's citation is affected. No supplier was added; `gaps` stays empty.
- This round added no new construction, so no new ownership question arises. Ownership against open pull requests stands as checked in earlier rounds.
- One tool call was refused by a worker hook ("Executing content fetched from the network is not allowed"). It was a local in-place text replacement on the README, refused before it ran. I made the same edits with the editor instead. Nothing fetched was executed.
- No source was fetched and `sources.toml` is unchanged; `needs-references.toml` was not written.
