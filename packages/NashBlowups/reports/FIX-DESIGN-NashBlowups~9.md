# FIX-DESIGN-NashBlowups~9

Findings of `REV-DESIGN-NashBlowups~8` (two, both P3). Both verified and applied. Files changed:
`packages/NashBlowups/design/README.md`, `packages/NashBlowups/design/plan.json`. `sources.toml` unchanged.

## F01 (P3) — applied

Verified: in §7.2 `Y` named an arbitrary scheme in the Setting and then, in the same sentence, `Y_m` named the
normalised iterates of an `X` that §7.2 never introduced.

Old → new (README §7.2 and `plan.json` target 7.2 `statement`/`hypotheses`/`tests`): "for `Y` in the Setting, an
open `U ⊆ Y` … Consequently, if `Y_m` contains …" → "for `W` in the Setting, an open `U ⊆ W` … (both taken with
the `d` of the Setting) … Consequently, for `X` in the Setting with normalised iterates `Y_i` (§7.1), if `Y_m`
contains …; likewise for the Nash iterates `X^{(i)}` (§2.7) when `X^{(m)}` contains …". The route now spells out
the consequence: `W = Y_m`, `Z = X`, evaluation §7.1, induction on `j`. Checks: `U = Y` → `U = Z = W`;
`U = Y_sm` → `U = Z = W_sm`. Since the statement now names `X^{(i)}` with its section, `*Needs:*` and the plan's
prerequisites gain §2.7 (Layer 2, already in Layer 7's Dependencies).

Pattern: every other `Y` in README and `plan.json` was checked. §0.1 (`f : X ⟶ Y`) and the Mathlib contract at the
normalisation bullet use `Y` for a local morphism target, and §7.1 and §7.3 introduce `X` before using `Y_i`. None of
them conflicts.

## F02 (P3) — applied

Verified: the sentence "ResolutionOfSingularitiesCharacteristicZero is earlier in the merge order and is not a
consumer" is about scheduling, not mathematics. The roadmap cites nothing from that roadmap: no other occurrence in
the README, `plan.json` or `sources.toml`.

Old → new: the sentence is deleted from "Downstream consumers". The paragraph still lists its three consumers: the
toric roadmap, the Part II and the polar-variety/Whitney roadmaps, each with the sections it uses. Pattern: I
searched the README, `plan.json` and `sources.toml` for "merge order", "pull request", "round", "review", "current",
"removed", "deferred", "optional", "intake" and "gate". There are no other matches.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 7.2 main statement | `i = 0` | `W^{(0)} = W ⊇ U ≅ Z = Z^{(0)}` | holds | none |
| 7.2 main statement | `U = ∅` | `Z = ∅`, all iterates of `∅` are `∅` | holds | none |
| 7.2 main statement | `W` = cusp, char 0, `U = W_sm = 𝔸¹∖{0}`, `i = 1` | `W* = 𝔸¹ ⊇ ν⁻¹(U) = 𝔸¹∖{0} = U*` | holds | none |
| 7.2, the `d` of `Z` | `Z ≅ U` of pure dimension `d`, iterated with `d' ≠ d` | `Z_sm^{(d')} = ∅`, so `Z^{(1)} = ∅` (as in §2.7 Check 4); trivially contained | true but meaningless | pinned "with the `d` of the Setting" |
| 7.2 consequence, Nash | cusp char 2, `m = 1` | `X^{(1)} ≅ X`, so `X^{(1+i)} ⊇ X^{(i)}` and `X^{(j)} ≅ X ⊇ X` for all `j` | holds | none |
| 7.2 consequence, normalised | cusp char 2, `m = 1` | `Y_1 = 𝔸¹`; its open subschemes are smooth, so none is `≅` the cusp; hypothesis false (agrees with §7.3 Check 3) | vacuous, consistent | none |
| 7.2 consequence, induction | `j → j+1` | `Y_{(j+1)m} = Y_{m+jm} ⊇ O ≅ Y_{jm} ⊇ O' ≅ X`; image of `O'` is open in `O`, hence in `Y_{(j+1)m}` | holds | stated in route |
| 7.2 consequence, `m = 0` | any `X` | `Y_0 = X ⊇ X`, `Y_i ⊇ Y_i`; true but trivial | `m ≥ 1` harmless, as §7.3 needs it | none |
| 7.2 Check 1 | `U = Z = W` | identity: `W^{(i)} ⊇ W^{(i)}` | holds | renamed |
| 7.2 Check 3 | `U = Z = W_sm`, open in `W`, so in the Setting, smooth of relative dimension `d` (§0.3) | iterates `≅ W_sm` (§7.1); `ν⁻¹(W_sm) ≅ W_sm` | holds | renamed, §7.1 cited |
| Consumers paragraph | after deletion | three consumers, sections §1.2, §§2.1–2.6, §3.2, Layer 6, §7.3; §§1.2–1.5, Layer 2, Layer 6; §2.1, §3.1 | equal to `plan.json` consumers plus prose | none |

I re-read the locator of §7.2, castilloDuarteLeytonLiendo2026 lines 58–67: items (i)–(iii) and the "Consequently"
sentence. It still supports the citation as worded.

## Checks run

Dependency check (`tauceti-roadmap … gate --candidate packages/NashBlowups/design/README.md --only NashBlowups …`):

```
candidate: NashBlowups is not in the merge order yet; checked as if placed after AlgebraicModuliForArithmeticGeometry (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2235 edges, 0 problem(s)
```

The check reports no UPWARD or CYCLE line.

`plan.json` parses after the edit. It is written back in its existing format (indent 1, UTF-8, trailing newline),
and the diff touches only target 7.2.

There is no `Suggested.lean` at the design stage, so no `#check` comparison or elaboration was run.

## Notes for the maintainer

- No declaration name changed, and no cross-roadmap citation was added or removed. No supplier or ownership
  decision changed, so the ownership checks are unaffected. No sources were fetched, and no `needs-references.toml`
  was written.
- The review's "For the human reviewers" items (the `alperModuli` licence, the share of `nashModificationNotes2024`
  citations) raise no finding, so this round changed nothing for them.
- The review text contained nothing suspicious.
