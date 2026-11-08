# FIX-PKG-AnalyticNumberTheoryPartIII~2

Repair of the one finding of `REV-PKG-AnalyticNumberTheoryPartIII` (package, round 1). One file
was edited: `packages/AnalyticNumberTheoryPartIII/README.md`, in the third Check of §9.4.
`Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged. The repair
cites no new source: its values are computed, and no supplier gap is needed.

## REV-PKG-AnalyticNumberTheoryPartIII/R01 (P3) — applied

Verified: the finding is right. With `ν ∝ (x − 1/2)²(2 − x)²` on `[1/2, 2]` (raw `dx/x`-mass
`0.2144194`) and `s = 1.3 + 2i`, `|mellin ν (s/ε)/s|` is `0.50593, 0.76245, 16.3705, 19133.6` at
`ε = 1/2, 1/4, 1/10, 1/20`. It diverges and does not tend to `0`.

Changed: the sentence "the limit as `ε → 0⁺` would be `0` … instead of `1/s`" → the wrong model's
value `0.49617 + 0.09889i` at `ε = 1/2`, the correct side's limit `mellin ν 0/s = 1/s` (with its
`ε = 1/20` value), the wrong side's moduli at four values of `ε`, and its growth
`≍ 2^{Re w}/|w|³` (Watson's lemma at the double zero `x = 2`).

The reviewer's wording was not used exactly. "Grows like `2^{Re s/ε}`" leaves out the factor
`(ε/|s|)³`, so the new text gives the exact order instead.

Pattern sweep: I recomputed every other wrong-model or limit Check in the README, and all of them
are true, so nothing else changed:
- 7.1: the bound `V/(4π|ξ|)` gives `1/π < 2/π`.
- 7.3: the limit `f(x₀)` would give `1`.
- 8.1: the clockwise convention gives `−2πi`.
- 8.3: `f′/f = 1/ε` against `CM/R = C log((R+ε)/ε)/R`.
- 9.2: the opposite sign gives `−1/30`.
- 9.3: without `ε⁻¹` the mass is `ε`, and the wrong-direction support is `[1/4, 4]`.
- 10.2: `η(x) log x = c₀`.
- 11.2: the `d^{−ν}` model gives `σ(6)` value `2`, and `Ring.choose 2 2 = 1`.
- 11.3: without `ζ(2s)` the `p²` coefficient is `10`.

The words "opposite normalization" and `s/ε` appear nowhere else in the README or in
`Suggested.lean`.

## Checks run

- `lake env lean packages/AnalyticNumberTheoryPartIII/Suggested.lean`, run from the content
  checkout: exit 0. There are exactly 24 warnings `declaration uses sorry`, at lines 58, 69, 82,
  98, 113, 125, 151, 160, 173, 194, 215, 243, 249, 258, 266, 274, 285, 296, 302, 314, 324, 342,
  349 and 367, and no other output. Both `TauCeti.*` imports have object files at the pin, so
  nothing was built.
- `#check @name` for all 32 declarations, in one scratch copy of the file: exit 0, and every type
  elaborates.
  - The file has no `variable` block, so no binder can be dropped.
  - I compared the 9.3 and 9.4 declarations (`deltaSpike`, `smoothCutoff`, `mellin_smoothCutoff`,
    `norm_mellin_smoothCutoff_le`) with the README. `mellin_smoothCutoff` concludes
    `mellin (smoothCutoff ν ε) s = mellin ν (ε * s) / s` under `ν ≥ 0`, support in `[1/2, 2]`,
    `dx/x`-mass `1`, `0 < ε` and `0 < Re s`. The Check's bump satisfies all of these, so the Check
    is an instance of the Lean statement.
  - Nothing changed in the Lean file. The 33rd entry of the worker's `signatures.md` (";",
    "lemma, line 25") is a parse of the word "lemma;" in the module docstring, not a declaration.
- Dependency check (`gate --depcheck … --movable`): `depcheck: 238 roadmaps, 2348 edges,
  0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- Citation lead (`citations.md`): `IsCompletelyAdditive.powOfAdditive_mul` at README line 344 is a
  target of ProbabilisticAndMetricNumberTheory §0.1a (that roadmap's README line 313 at its open
  head), not a library name. The README attributes it to that roadmap and section, so it is
  correct as it stands.
- Overlaps (`overlaps.md`): no open pull request changes this roadmap, and no cited id is dropped
  or defined only by a revision.
- Ownership: no new object, target or citation was introduced. The edit corrects a Check on this
  roadmap's own `smoothCutoff`, so no ownership question arises.

## Adversarial pass on the changed statement

Quadrature: composite Simpson's rule with 4·10⁴ to 2·10⁵ nodes, in a scratch script. The bump is
`ν = (x − 1/2)²(2 − x)²/0.2144194`, and `s = 1.3 + 2i`.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Correct side `mellin ν (εs)/s` at `ε = 1/2` (the Check's first sentence) | Lean `mellin_smoothCutoff` against a direct Mellin integral of `smoothCutoff` (`∫_0^{2^{−1/2}} x^{s−1} dx` plus quadrature on `[2^{−1/2}, 2^{1/2}]`) | right side `0.3077244084 − 0.3285289455i`; direct `0.3077244084 − 0.3285289455i` (agreement to `10⁻¹⁰`) | true | none |
| Wrong model at `ε = 1/2` | `mellin ν (2.6 + 4i)/s` | `0.4961729 + 0.0988908i`, modulus `0.50593` | true as now stated | new sentence |
| Correct side → `1/s` | `ε = 1/2, 1/4, 1/10, 1/20`; `mellin ν 0 = 1` (mass hypothesis) | `0.45014, 0.43613, 0.42634, 0.42284` in modulus; at `ε = 1/20` `0.23536 − 0.35129i` against `1/s = 0.22847 − 0.35149i`, `|1/s| = 0.41922` | true (`mellin ν` is entire by 9.2, so it is continuous at `0`) | new sentence |
| Wrong model unbounded | `ε = 1/4, 1/10, 1/20, 1/50, 1/100` | moduli `0.76245, 16.3705, 1.91·10⁴, 7.27·10¹⁴, 3.44·10³³` | true | new sentence |
| `|mellin ν w| ≍ 2^{Re w}/|w|³` in a sector | Watson's lemma: `x = 2e^{−t}`, `ν(2e^{−t}) ~ 9t²/0.2144` as `t → 0`, so `mellin ν w ~ 2^w · 18/(0.2144 w³)`; ratio of `|mellin ν (s/ε)|` to `16c·2^{Re w − 1}/|w − 1|³` (`c = 2.25/0.2144`) | ratio `0.7205, 0.8503, 0.9377, 0.9684` at `ε = 1/10, 1/20, 1/50, 1/100`, tending to `1`; the endpoint `1/2` contributes `O(2^{−Re w})` | true; `arg(s/ε) = arctan(2/1.3) ≈ 57° < 90°`, inside the sector | new sentence |
| Degenerate: symmetric bump | same formula, `ν(1/x) = ν(x)` | `mellin ν (−w) = mellin ν (w)` (substitute `x = 1/y`); a symmetric bump has `dx/x`-mass `1/2` on `(1, 2]`, and if it vanishes to order `m` at `2`, Watson's lemma gives `|mellin ν w| ≍ 2^{Re w}/|w|^{m+1}` in the sector, so the wrong model is again unbounded | the Check's discrimination does not depend on asymmetry | none |
| Cutoff at `1` (first Check, same bump; recomputed because it uses the same object) | `∫_1^2 ν(y) dy/y` | `0.7064685`, matching `≈ 0.706` | true | none |

## For the maintainer

- No Lean name changed, and no id that other roadmaps cite moved. The edit is confined to one Check
  of §9.4.
- Ownership against open pull requests was checked only for the one name the citation tool flagged
  (above). No new object was introduced that needs an owner.
- No suspicious instructions were found in the review or the other data read.
