# FIX-PKG-SpectralSequencesAndConvergence~4

The review `REV-PKG-SpectralSequencesAndConvergence~3` raises one finding (F01, P3). Its "For the
human reviewers" section says "none". Its "Source issues" section lists misprints in Stacks and
Helle–Rognes. Those are not findings, and the review says the package does not inherit them.

## REV-PKG-SpectralSequencesAndConvergence~3/F01 (P3) — applied

In `packages/SpectralSequencesAndConvergence/Suggested.lean`, the docstring of
`convergence_of_hasConvergenceBounds` said "the source of the first is the page object". It now
says "the target of the first is the page object". The displayed arrows, the second clause (the
target of the second map is `EInfty q n`) and every signature are unchanged.

**Verification.** The finding is right.
- `mapFourδ₁Toδ₀' i₀ i₁ i₂ i₃ i₄` maps `E^n(i₀ ≤ i₂ ≤ i₃ ≤ i₄)` to `E^n(i₁ ≤ i₂ ≤ i₃ ≤ i₄)` (pinned
  Mathlib, `Mathlib/Algebra/Homology/SpectralObject/EpiMono.lean:142`).
- The theorem applies it with `(i₀, i₁, i₂, i₃, i₄) = (⊥, q − r + 2, q, q + 1, q + r − 1)`. So the
  map goes from `E^n(⊥ ≤ q ≤ q + 1 ≤ q + r − 1)` to `E^n(q − r + 2 ≤ q ≤ q + 1 ≤ q + r − 1)`.
- The recipe `coreE₂Cohomological` (`HasSpectralSequence.lean:143`) has `i₀ = q − r + 2`,
  `i₁ = q`, `i₂ = q + 1` and `i₃ = q + r − 1`. So `spectralSequencePageXIso`
  (`SpectralSequence.lean:488`) identifies the page object with the *target* of that map.
- Tau Ceti's `EInfty q n` is `E^n(⊥ ≤ q ≤ q + 1 ≤ ⊤)`
  (`TauCeti/Algebra/Homology/SpectralObject/Stabilization.lean:45`). This is the target of
  `mapFourδ₄Toδ₃'`, so the second clause was already right.

**Computed witness.** Take `K = (ℤ →(×2) ℤ)` in degrees 0 and 1 with its stupid increasing
filtration: `G_j = 0` for `j ≤ −2`, `G_{−1} = ℤ` in degree 1, and `G_j = K` for `j ≥ 0`. Here
`H^n(i ≤ j) = H^n(G_j / G_i)`, and `E^n(i₀ ≤ i₁ ≤ i₂ ≤ i₃)` is the homology of
`H^{n−1}(i₂ ≤ i₃) → H^n(i₁ ≤ i₂) → H^{n+1}(i₀ ≤ i₁)`. Look at `n = 0`, `q = −1`:
- At `r = 2`, the source is `E^0(⊥ ≤ −1 ≤ 0 ≤ 0)`, the homology of `0 → ℤ →(±2) ℤ`, which is
  `0`. The target is `E^0(−1 ≤ −1 ≤ 0 ≤ 0)`, the homology of `0 → ℤ → 0`, which is `ℤ`. This
  target is the page-2 object at native `(1, −1)`. So the source and the page object differ.
- At `r = 3`, with `a = −2` and `b = 0` (the hypotheses of the theorem hold), the source is
  `E^0(⊥ ≤ −1 ≤ 0 ≤ 1) = 0` and the target is `E^0(−2 ≤ −1 ≤ 0 ≤ 1) = 0`. The latter is the
  homology of `0 → ℤ →(±2) ℤ`. Both are `0`, and so is `EInfty (−1) 0`, because `H^0(K) = 0`.

**The same pattern elsewhere.** I searched the package for every statement about the direction of
`mapFourδ₁Toδ₀'`, `mapFourδ₄Toδ₃'`, `isoMapFourδ₁Toδ₀'` and `isoMapFourδ₄Toδ₃'`, and for every
"source of" or "target of" label. That covers README lines 194–195, 257–266, 1086–1098 and 1164,
and `Suggested.lean` lines 51–54 and 138–142.
- README 1091 ("The left object is the page object …, the right one is Tau Ceti's `EInfty q n`")
  and the supplier contract at README 257–266 are correct.
- One more passage had the same direction slip. It is the module-docstring bullet on README 4.5
  (`Suggested.lean` line 53). It said the page object is identified with
  `E^n(⊥ ≤ i₁ ≤ i₂ ≤ ⊤)` by `spectralSequencePageXIso` "followed by `isoMapFourδ₁Toδ₀'` and
  `isoMapFourδ₄Toδ₃'`".
  - `isoMapFourδ₁Toδ₀'` (`EpiMono.lean:191`) goes from the `⊥` version to the page version. To
    leave the page object you need its inverse.
  - `isoMapFourδ₄Toδ₃'` (`EpiMono.lean:224`) runs forward, from `E^n(⊥ ≤ q ≤ q + 1 ≤ q + r − 1)`
    to `E^n(⊥ ≤ q ≤ q + 1 ≤ ⊤)`.
  - The bullet now reads "followed by the inverse of `isoMapFourδ₁Toδ₀'` and by
    `isoMapFourδ₄Toδ₃'`".
  - The vanishing hypotheses are unchanged and correct: `H^{n+1}(⊥ ≤ q − r + 2) = 0` for the first
    and `H^{n−1}(q + r − 1 ≤ ⊤) = 0` for the second.

No README text changed. No README target, Check or worked example uses the corrected label in a
computation, so nothing had to be recomputed beyond the rows below.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `convergence_of_hasConvergenceBounds` docstring: the target of the first map is the page object | stupid `×2` complex, `n = 0`, `q = −1`, `r = 2` | source `E^0(⊥≤−1≤0≤0) = ker(±2) = 0`; target `E^0(−1≤−1≤0≤0) = ℤ`; page-2 object at `(1,−1)` is `ℤ` | target = page object, source ≠ page object | "source" → "target" |
| same, inside the theorem's range | same complex, `a = −2`, `b = 0`, `r = 3` | source `0`, target `E^0(−2≤−1≤0≤1) = 0`, page-3 object `0`, `EInfty (−1) 0 = 0` | consistent with the theorem; the label still names the target | none |
| same docstring: the target of the second map is `EInfty q n` | pinned `EInfty q n = E^n(⊥ ≤ q ≤ q+1 ≤ ⊤)`; `mapFourδ₄Toδ₃'` with `i₄ = ⊤` | target of the second map `E^n(⊥≤q≤q+1≤⊤)` = `EInfty q n` | correct | none |
| module docstring, README 4.5 bullet: page → `E^n(⊥ ≤ i₁ ≤ i₂ ≤ ⊤)` | pinned types of `isoMapFourδ₁Toδ₀'` with `(⊥, q−r+2, q, q+1, q+r−1)`; the `×2` example at `r = 2` | forward direction is `E^n(⊥≤…) → E^n(q−r+2≤…)`, here `0 → ℤ`; from the page you need the inverse, which exists only when the vanishing holds | the forward wording had the arrow reversed | "followed by the inverse of `isoMapFourδ₁Toδ₀'` and by `isoMapFourδ₄Toδ₃'`" |
| same bullet, vanishing hypotheses | first quadrant, `n = 0`, `q = 0`, `r = 2` | `H^1(⊥ ≤ 0) = 0` by `isZero₁_of_isFirstQuadrant` (`j = 0 ≤ 0`); `H^{−1}(1 ≤ ⊤) = 0` by `isZero₂_of_isFirstQuadrant` (`n = −1 < i = 1`) | the hypotheses match the two isomorphisms | none |

## Checks

- **Elaboration.** I ran `lake env lean` on `packages/SpectralSequencesAndConvergence/Suggested.lean`
  from the content checkout. Exit 0. The only diagnostics are eight "declaration uses `sorry`"
  warnings, at lines 99, 111, 150, 175, 194, 224, 250 and 270. No `TauCeti.*` module needed
  building.
- **Binder check.** I wrote a scratch copy of the file with `#check @name` appended for all 11
  declarations and elaborated it once (exit 0). I compared every elaborated type with the README
  statements and with the signatures supplied before this round. Nothing changed, which is
  expected because only docstrings were edited. In particular:
  - `isIso_homologyMap_of_isIso_page_of_exhaustive_of_boundedBelow` keeps `HasColimitsOfShape ℕ C`
    and `HasExactColimitsOfShape ℕ C`.
  - The two repleteness and Mittag–Leffler declarations keep `HasCountableProducts C`.
  - `sum_negOnePow_homology_eq_sum_negOnePow_page` keeps `P.ContainsZero`,
    `P.IsClosedUnderKernels`, `P.IsClosedUnderCokernels`, `P.IsClosedUnderExtensions` and
    `AddCommGroup G`.
- **Dependency direction.** Output of the depcheck command:

      depcheck: 240 roadmaps, 2170 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line.

## Gate failures

None were listed for this round.

## Ownership and sources

- No target, definition or citation was added. Ownership and the supplier contracts are unchanged,
  including the declared gap `gap:exact-couple-morphisms` (StableHomotopyKTheory §7.22).
  `design/plan.json`, `README.md`, `metadata.toml` and `sources.toml` were not edited.
- No source was fetched and none is missing. `needs-references.toml` was not written.

## For the maintainer

- The only edits are two docstring wordings in `Suggested.lean`.
- No Lean name changed, so other roadmaps are unaffected.
- No untrusted text contained instructions.
