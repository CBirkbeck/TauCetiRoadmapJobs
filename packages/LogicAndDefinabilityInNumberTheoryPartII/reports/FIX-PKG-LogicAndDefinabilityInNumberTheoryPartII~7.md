# FIX-PKG-LogicAndDefinabilityInNumberTheoryPartII~7

Findings of REV-PKG-LogicAndDefinabilityInNumberTheoryPartII~6 (one review, so plain ids). Files changed: `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md` and the top-level `gaps` entry `finite-field-divisor-adapted-fibration` of `packages/LogicAndDefinabilityInNumberTheoryPartII/design/plan.json`. `Suggested.lean`, `metadata.toml` and `sources.toml` are unchanged.

## F01 (P2) — applied differently

The witness is confirmed: `(x/y)|_C = ω` is algebraic over `𝔽₂`. Contract route: "no `k`-multiple … `f/g` not constant" → "ratios `g/f` generate `k(C)`, so pick `(g/f)|_C` transcendental; then `C` dominates". The §5.4 negative-control Check is added with explicit projections. The review's "lines through the origin" is wrong: the base `𝔽₂(t/s)` works, since the residue `t/ω` is transcendental.

## F02 (P3) — applied

"with smooth geometrically integral generic fibre onto which … maps dominantly" → "whose generic fibre is smooth and geometrically integral over `k(B)` and under which the strict transform of `C` maps dominantly onto `B`". Changed in the README contract, in §5.4 (over `κ(B)`) and in the gap's `needs` in `design/plan.json`. The slug, supplier and section are unchanged.

## F03 (P3) — applied

The four locators are confirmed against the page markers and fixed: §0.12 → "pp. 9–10", §0.15 → "p. 10", §4.8 → "pp. 14–15", §5.2 → "p. 15". The same pattern was fixed in three more places: §6.1 Proposition 5.1 "pp. 15–16" → "pp. 16–17", §6.8 Lemma 5.3 "pp. 16–17" → "p. 17", and §3.2 Proposition 3.4(2) "p. 9" → "pp. 8–9".

### Evidence and pattern search

- F01: the old argument occurs only in the contract (searched "multiple of", "not constant", "nonconstant", "dominat"). `plan.json`'s `needs` carries the requirement, not the route. The review's "lines through the origin" (`t = λ s`) have base field `𝔽₂(t/s)`, on which `v` is trivial. What the review meant is the projection `(s, t) ↦ s`.
- F02: no other "onto which" remains.
- F03 page markers:
  - `poonen_uniform`: page 11 starts at line 496; Lemma 4.7 is at line 420 and Proposition 4.10 at 482–487.
  - `dittmann_pop`: pages 14–17 start at lines 606, 648, 691 and 734. Theorem 4.2(2) is stated at 622 and proved from 652; Recipe 4.3 is at 665; Proposition 5.1 runs over 694–736; Lemma 5.3 over 737–762; Proposition 3.4(2) is stated at 353 (p. 8) and proved over 390–398 (p. 9), consistent with §3.1's "Proposition 3.4(1), pp. 8–9".
- F03, other locators checked and found to agree:
  - Poonen: all others.
  - Dittmann–Pop: Facts 2.1–2.3, §3, Notations/Remarks 4.1, Remark 4.4, Proposition 5.1 Case 2, the Claim of Lemma 5.3, Remark 5.4.
  - AKNS: all thirteen.
  - Pop 2017: all six (journal pages 2093–2109).
- `sources.toml` carries no pages for these items and is unchanged.

## Checks

- `lake env lean packages/LogicAndDefinabilityInNumberTheoryPartII/Suggested.lean`, run from the content checkout: exit 0. The only output is eight "declaration uses `sorry`" warnings, at lines 54, 62, 73, 81, 93, 113, 128 and 139. The file itself was not changed.
- `#check @name` for all ten declarations in one scratch copy: elaborated once, exit 0. Every type is identical to the worker's `signatures.md` and to its README statement (§§0.1, 0.2, 0.8, 0.10(e), 0.13, 0.14(b), 5.7, 6.9, 8.4, 8.5). No binder was lost, and nothing changed.
- Dependency check:

```text
depcheck: 246 roadmaps, 2260 edges, 0 problem(s)
```

  No UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: no cross-roadmap citation or `TauCetiRoadmap` Lean name found nowhere.
- LefschetzPencilsAndVanishingCycles §3.5 ("Characteristic two, low dimension and finite fields") still exists at its open head, README line 2458. It is line 69 of the merge order; this roadmap is line 392.
- No gate failures were listed for this round.

## Adversarial pass (changed and added statements)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Old route: "no `k`-multiple" ⇒ `C` dominates `B` | `𝔽₂`, `ℙ²`, `C: x²+xy+y²`, `f = y`, `g = x` | `(x/y)² + (x/y) + 1 = 0` on `C`, so `g|_C = ω f|_C` with `ω ∉ {0, 1}`; image of `C` is the point `t² + t + 1 = 0` | false | replaced |
| New: ratios `g/f` generate `k(C)` | same `C`, `d = 1` | ratios `x/y = ω`, `1`, `z/y`; `𝔽₂(ω, z/y) = 𝔽₄(z/y) = k(C)` | holds | — |
| New: some `(g/f)|_C` transcendental | same | `z/y` transcendental, `x/y` algebraic | `g = z` is chosen, `g = x` is excluded | — |
| New: `g` does not vanish on `{f = 0}` | `g = c f` | `(g/f)|_C = c ∈ k` is algebraic, contradicting the choice; `g = 0` is the case `c = 0` | holds | wording made precise (reduced zero scheme, `H⁰ = k`) |
| New: base points finite | `g = z`, `f = y` | `{y = 0} ∩ {z = 0} = {(1:0:0)}`, one rational point; `(1:0:0) ∉ C` since `1 ≠ 0` | holds | — |
| New: dominance | `g = z` | `(f/g)|_C = y/z`, transcendental; `C → ℙ¹` of degree 2, since a line through a point off a conic meets it twice | holds | — |
| New: degree `d` generality | any `d ≥ 1`, `x_0` nonvanishing on `C` | `(x_i x_0^{d−1}/f) / (x_0^d/f) = x_i/x_0` | holds for all `d` | — |
| F02 sentence on the §5.4 Check | `C = {t = 0} ⊂ ℙ¹_s × ℙ¹_t`, `B = ℙ¹_s` | `C → B` of degree 1; `C` is not in the generic fibre `ℙ¹_{𝔽_p(s)}` | new reading true, old reading false | rephrased in 3 places |
| New §5.4 Check, projection to `s` | `K = 𝔽₂(s,t)`, `v` the `(s²+s+1)`-adic valuation | `v(s²+s+1) = 1`; residue of `s` is `ω`, with `ω² + ω + 1 = 0`; image of `C` is a degree-2 point | `v` nontrivial on `𝔽₂(s)`: negative control | added |
| New §5.4 Check, projection to `t` | same | `v(t) = 0`; residue field `𝔽₄(t)`, `[𝔽₄(t) : 𝔽₂(t)] = 2`; generic fibre `ℙ¹_{𝔽₂(t)}`; `δ(𝔽₄(t)) = 1 = 2 − 1` | `k₁ = 𝔽₂(t)` works, is relatively closed in `K`, and `v` is a geometric prime divisor | added |
| Review's suggested wording "lines through the origin" | `t = λ s`, base `𝔽₂(t/s)` | residue of `t/s` is `t/ω`, transcendental, so `v(t/s) = 0` | this pencil works, contrary to the suggested text | wording not used |
| §5.4 conclusion `k₁ = κ(B) ⊆ O_v` | the old witness in §5.4 form | projection to `s` gives `v(s² + s + 1) = 1 > 0` | the dominance hypothesis is needed and is now actually delivered by the route | — |
| Locators | 7 page ranges | page markers: Poonen 496 (p. 11); Dittmann–Pop 606 (p. 14), 648 (p. 15), 691 (p. 16), 734 (p. 17), 373 (p. 9) against statement lines 482, 487, 622, 652, 665, 694, 736, 737–762, 353, 390 | 7 corrected | — |

## Ownership and overlap

- No new target or construction was introduced. The two edits change only the route and the requirement wording of an existing gap, plus one Check.
- The gap's supplier (LefschetzPencilsAndVanishingCycles §3.5) is unchanged and earlier in the merge order.
- `overlaps.md` reports no other pull request changing this roadmap and no dropped ids.

## For the maintainer

- The `needs` sentence of `gap:finite-field-divisor-adapted-fibration` changed wording only (the slug, supplier and section are unchanged). Whoever writes the LefschetzPencilsAndVanishingCycles §3.5 statement should read the new sentence: the strict transform of `C` dominates the base `B`, not the generic fibre.
- No names that other roadmaps cite were changed. No source text was requested; `needs-references.toml` was not created.
- Nothing in the review text was treated as an instruction beyond its findings.
