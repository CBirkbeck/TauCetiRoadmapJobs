# Review of AlgebraicCurves (pull request #1807 at 78bda3b)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired. The summary now reads "AlgebraicCurves, rewritten throughout, extends automorphism finiteness in genus at least two from algebraically closed characteristic-zero fields to perfect fields in every characteristic and, with positive geometric genus, to arbitrary fields, assuming exact constants". The prose adds "rewritten in the house shape; its Suggested.lean drops two declarations now proved in Tau Ceti".

## Verified sound

| # | Statement | Instances | Values computed on each side | Result | Change |
|---|---|---|---|---|---|
| A1 | §9.3 comparison `μ`, cited by the changed consumer sentence (README 1648–1666) | `y² = x³ − x` over `ℚ` | `μ(dy) = ((3x² − 1)/(2y))·δ(x)`. `(dx) = P₀ + P₁ + P₋₁ − 3O = div y`, of degree `0 = 2g − 2`. `(dy) = div(3x² − 1) = Z − 4O` with `deg Z = 4` | holds | none |
| A2 | §9.3 separating hypothesis, degenerate case | `y = x²` on `k(x)`, char 2 | Kähler: `d(x²) = 2x dx = 0`. `y` is not separating, so it is excluded, and `μ(dy) = 0·δ(x) = 0` agrees | holds | none |
| A3 | New consumer sentence: DiophantineApproximationAndTranscendence uses §9.3 in its Layer 5 | DAAT on main, lines 38, 96, 3920 | Line 96: Layer 9 "supplies the function-field comparison with Weil differentials". Only Layer 5's Dependencies (3920) cites AlgebraicCurves. That use is in char 0, where `Algebra.IsSeparable k⟮x⟯ F` is automatic | holds | none |
| A4 | Description summary against both headlines (R01) | `y² = x⁵ − t` over `𝔽₅(t)`; main's statement | Over `k`, Hurwitz gives `2g − 2 = −4 + 6`, so `g = 2`. Over `k̄`, `y² = u⁵` has geometric genus 0, excluded by `0 < genus K F'`. Both signatures carry `IsIntegrallyClosedIn k F` ("exact constants"). Main assumes `[IsAlgClosed k] [CharZero k]` | holds | none |

The rows for statements this diff does not touch stand as in the previous review, of `a877716`.

- **Gate.** The worker's PR-aware gate passes every check, including `build=0`. My standalone rerun reports 0 on every scanner except `outside-folder=24`. Those 24 files are exactly the README and `Suggested.lean` of the 12 sibling folders the brief names as this pull request's own. The excluded `diff --stat` lists no other file.
- **Dependency check.** It prints exactly `depcheck: 206 roadmaps, 1922 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` gives only `declaration uses 'sorry'`, at lines 80 and 104. `Suggested.lean` is unchanged since `a877716`, and `signatures.md` keeps both binder sets.
- **Pinned declarations opened (6).** `Differential/Comparison.lean:91, 115, 156`, whose docstring at 153 cites Thm. 4.3.2; `Differential/Independence.lean:253`; `Separable/Regular.lean:142`; `ConstantExtension/Genus/Basic.lean:243`.
- **Citations resolved.**
  - DAAT on main, lines 38, 96 and 3920.
  - Supplier links, main against head. JacobianChallenge, FormalLaurentPuiseux and LocalFieldsRamification are suppliers on both. At the head, EllipticCurves appears only as a consumer (lines 62, 1747, 2417), as the description's loop sentence says.
  - The description's merge order (this, then #1808, then #1854) matches `overlaps.md`. No ids are dropped.
- **Seeded sample.** Of the fifteen targets, only §9.3 is cited by the changed text (rows A1–A3).
- **Remark.** The previous review's remark, that DAAT was absent from `## Downstream consumers`, is resolved by the changed line.

Overlap check: read CanonicalModelsAndGonality, JacobianChallenge, FunctionFieldArithmetic, HyperellipticCurves, CurvesOverFiniteFields (open), RamificationOfCompleteDiscretelyValuedFields, NumberFieldArithmetic, EllipticCurves (main); shared: places, divisors, constant extensions (Layer 8), model classes (Layer 10), automorphisms and Hurwitz bound (Layer 11), curve dictionary (Layer 12), owner AlgebraicCurves, cited by the first five (HyperellipticCurves README 92–96, 184; CurvesOverFiniteFields 1078) and consumed by EllipticCurves; HyperellipticCurves' `automorphismGroup` is of a model, its own; the other two share nothing.

## Not verifiable

- `Stichtenoth2009` Thm. 4.3.2, the locator of §9.3: the source is settled as uncertified. The pinned docstring at `Comparison.lean:153` cites the same number.

## Source issues

- none
