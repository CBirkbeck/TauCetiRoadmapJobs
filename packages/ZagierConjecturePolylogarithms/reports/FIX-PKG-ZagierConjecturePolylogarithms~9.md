# FIX-PKG-ZagierConjecturePolylogarithms~9

Review settled: `REV-PKG-ZagierConjecturePolylogarithms~8`, one finding.

## F01 (P3) — applied

`packages/ZagierConjecturePolylogarithms/README.md`, §3.13, Checks, "Weight three, single symbol". Old: "six vanish, because `u(0) = u(−1) = 0` and …; the two survivors give `Cor_∞(0,1,y)∧u(y)`". New: "seven vanish": four with a factor `Cor_∞(0,0,1)` or `Cor_∞(y,0,0)` (first shuffles `2⟨X₁,X₀,X₀⟩ = 2⟨X_y,X₀,X₀⟩ = 0`), two with `Cor_∞(0,0) = u(0) = 0`, one killed by `Cor_∞(0,1) = u(−1) = 0`. The one survivor is the cut through `y` and the arc between the zeros, `Cor_∞(0,1,y)∧Cor_∞(y,0) = Cor_∞(0,1,y)∧u(y)`.

**Verification.** Cut rule of §3.4: the cut through letter `vⱼ` and the arc between `v_{i−1}` and `vᵢ` gives `⟨vᵢ,…,vⱼ⟩∧⟨vⱼ,…,v_{i−1}⟩`. Both factors need at least two letters, so a word of length ℓ has `ℓ(ℓ−2)` cuts (8 for ℓ = 4, 15 for ℓ = 5). On `p = (0,0,1,y)`:

| letter `vⱼ` | first factor length | cut | value |
| --- | --- | --- | --- |
| `p₁ = 0` | 2 | `⟨y,0⟩∧⟨0,0,1⟩` | 0 (shuffle) |
| `p₁ = 0` | 3 | `⟨1,y,0⟩∧⟨0,0⟩` | 0 (pure) |
| `p₂ = 0` | 2 | `⟨0,0⟩∧⟨0,1,y⟩` | 0 (pure) |
| `p₂ = 0` | 3 | `⟨y,0,0⟩∧⟨0,1⟩` | 0 (shuffle) |
| `p₃ = 1` | 2 | `⟨0,1⟩∧⟨1,y,0⟩` | 0 (`u(−1) = 0`) |
| `p₃ = 1` | 3 | `⟨0,0,1⟩∧⟨1,y⟩` | 0 (shuffle) |
| `p₄ = y` | 2 | `⟨1,y⟩∧⟨y,0,0⟩` | 0 (shuffle) |
| `p₄ = y` | 3 | `⟨0,1,y⟩∧⟨y,0⟩` | `Cor_∞(0,1,y)∧u(y)` |

That is 4 + 2 + 1 = 7 zero cuts and one survivor, so the coefficient of `Cor_∞(0,1,y)∧u(y)` is 1. Under `a∧b ↦ a⊗b` this is `[y]₂⊗u(y) = δS₃(y)`. With two survivors the value would be `2δS₃(y)`. The conclusion `S₃(y) ↦ Cor_∞(0,0,1,y)` and its sign are unchanged. I partitioned the zero cuts differently from the review's suggested wording so that the three classes are disjoint: `⟨y,0,0⟩∧⟨0,1⟩` has both a shuffle factor and the factor `Cor_∞(0,1)`, and it is counted only among the shuffle cuts. I also named the second shuffle relation, `2⟨X_y,X₀,X₀⟩ = 0`, which `Cor_∞(y,0,0) = 0` needs and the old text left out.

**Same pattern, repaired in the same Check list (§3.13):**

- *Fifteen cuts of `(0,0,0,1,y)`.* I recomputed this case cut by cut. Among the ten cuts of types `(1,3)` and `(3,1)`: four have a factor `⟨0,0,0,1⟩` or `⟨y,0,0,0⟩` (zero by `3⟨X₁,X₀,X₀,X₀⟩ = 3⟨X_y,X₀,X₀,X₀⟩ = 0`), four have `⟨0,0⟩`, one has `⟨0,1⟩`, and one survives, `⟨0,0,1,y⟩∧⟨y,0⟩`. Each of the five `(2,2)`-cuts (`⟨1,y,0⟩∧⟨0,0,0⟩`, `⟨y,0,0⟩∧⟨0,0,1⟩`, `⟨0,0,0⟩∧⟨0,1,y⟩`, `⟨0,0,1⟩∧⟨1,y,0⟩`, `⟨0,1,y⟩∧⟨y,0,0⟩`) has a three-letter factor with a repeated letter. Such a factor is zero, either as a pure word or by `2⟨X_a,X_b,X_b⟩ = 0` after rotation. The old sentence had the right result but gave only the `X₁` shuffle and no reason for the pure and `u(−1)` cuts. It now gives the count 14 + 1 with every reason.
- *Four-letter formula ("Double symbols").* The old formula `Σ_k Cor_∞(b_k,b_{k+1},b_{k+2}) ∧ u((b_{k+2}−b_{k−1})/(b_{k−1}−b_k))` was stated for any word. It has a zero denominator when two adjacent letters coincide, as in `(0,0,1,y)`. It now reads `… ∧ (u(b_{k+2}−b_{k−1}) − u(b_{k−1}−b_k))` for finite points, indices modulo four, and keeps the quotient form for four distinct points. Derivation: the 3-letter factor `⟨b_k,b_{k+1},b_{k+2}⟩` occurs in exactly two cuts. One is `⟨b_k,b_{k+1},b_{k+2}⟩∧⟨b_{k+2},b_{k−1}⟩`. The other is `⟨b_{k−1},b_k⟩∧⟨b_k,b_{k+1},b_{k+2}⟩ = −Cor∧u(b_{k−1}−b_k)`. A two-letter word is `u(b₀−b₁)`, symmetric because `u(−1) = 0`. On `(0,0,1,y)`: `k = 1, 4` have a shuffle-zero factor, `k = 3` gives `Cor_∞(1,y,0)∧(u(0) − u(−1)) = 0`, and `k = 2` gives `Cor_∞(0,1,y)∧(u(y) − u(0)) = Cor_∞(0,1,y)∧u(y)`, the same as the corrected single-symbol count. The new clause says so. On `(0,x,1,y)` the two forms agree, so the existing comparison with `−δD₂₁(x,y)` and its numerical values are unchanged.
- I checked the other cut counts and found them right, so they are unchanged: the three cuts of `(0,1,y)` (§3.8 Check and the §3.13 weight-two Check, two killed by `u(−1)`); the `5 + 5 + 5` split for length five (§3.4); and the single surviving `(2,2)`-cut `⟨0,x,1⟩∧⟨1,y,0⟩` of `(0,0,x,1,y)` (j = 1, 3 have the factor `⟨0,0,x⟩` and j = 2, 5 the factor `⟨y,0,0⟩`, each with a repeated letter), together with the Layer 3 Example `D₃₁(3,5)` that uses it.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Cut count of `(0,0,1,y)` | all 8 cuts, ℓ(ℓ−2) with ℓ = 4 | 4 shuffle-zero, 2 pure, 1 `u(−1)`, 1 survivor `Cor_∞(0,1,y)∧u(y)` | coefficient 1, equals `δS₃(y)` | count 6/2 → 7/1 |
| `Cor_∞(y,0,0) = 0` | shuffle with `v₀ = X_y`, `p = q = 1` | `⟨X_y,X₀,X₀⟩ + ⟨X_y,X₀,X₀⟩ = 0` ⇒ zero over ℚ | holds | relation added |
| Cut count of `(0,0,0,1,y)` | all 15 cuts | (1,3)+(3,1): 4 shuffle, 4 pure, 1 `u(−1)`, 1 survivor; (2,2): 5 zero | 14 + 1, survivor `Cor_∞(0,0,1,y)∧u(y)` = `δS₄(y)` image | reasons listed |
| `Cor_∞(y,0,0,0) = 0` | shuffle `v₀ = X_y`, `(X₀)` with `(X₀,X₀)`, 3 shuffles | `3⟨X_y,X₀,X₀,X₀⟩ = 0` | holds | relation added |
| Four-letter formula, difference form | `(0,0,1,y)`; `(0,x,1,y)` | k = 1..4: `0`, `Cor(0,1,y)∧u(y)`, `Cor(1,y,0)∧(u(0)−u(−1)) = 0`, `0`; distinct points: `u(a) − u(b) = u(a/b)` | total `Cor_∞(0,1,y)∧u(y)`; D₂₁ comparison unchanged | quotient → difference |
| Degenerate: two-letter word sign | `⟨s,t⟩` vs `⟨t,s⟩` | `u(s−t) − u(t−s) = u(−1) = 0` | rotation-invariant | none |
| Degenerate: two punctures `S = {∞,0}` | word `(0,0,0)` | pure word, zero; every cut has a pure factor | consistent with §3.4 Check | none |
| Weight-two Check (same pattern) | 3 cuts of `(0,1,y)` | `u(y)∧u(−1)`, `u(−1)∧u(1−y)`, `u(1−y)∧u(y)` → `(1−y)∧y` | 2 zero, 1 survivor | none |
| `(2,2)`-cuts of `(0,0,x,1,y)` | j = 1..5 | zero factors `⟨0,0,x⟩` (j = 1, 3), `⟨y,0,0⟩` (j = 2, 5); j = 4 `⟨0,x,1⟩∧⟨1,y,0⟩ = −[x]₂∧[y]₂` | one survivor | none |

## Checks run

- **Elaboration.** `lake env lean` on `packages/ZagierConjecturePolylogarithms/Suggested.lean` from the content checkout: two warnings, `124:8` and `133:8`, both `declaration uses sorry`, nothing else. This round does not change the file.
- **Binder check.** I wrote `#check @name` for all ten declarations in one scratch copy and elaborated it once. Each elaborated type matches `signatures.md` and README §6.4: `[Field F]` on `unitVector`, `trilogCyclic`, `TrilogRelationFunction` (with `[AddCommGroup V] [Module ℚ V]`) and `IsCycle4`; `[Field F] [NumberField F]` on `periodMatrixFour`, `zagierDeterminantFour` and both theorems; and the hypothesis `∀ j, IsCycle4 (c j)` on `zagier_four_everyFamily`. No binder was lost and nothing changed.
- **Dependency check** (`gate --depcheck … --movable`):

```text
depcheck: 240 roadmaps, 2263 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

- No gate failures were listed for this round.
- I scanned the changed lines for LaTeX delimiters, machine paths and process words and found none.

## For the maintainer

- The only edits are two Check bullets of §3.13 in `packages/ZagierConjecturePolylogarithms/README.md`. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged. No target, Lean name, section id or supplier citation changed, so no other roadmap is affected.
- No new source was cited, and no `needs-references.toml` entry was written.
- Ownership was not re-examined: the change is internal to a Check and adds no object.
