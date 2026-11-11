# Review of AlgebraicCurves (pull request #1807 at b566a4c)

**Verdict:** accepted

No findings.

## Previous findings

- none: the review of `78bda3b` raised no findings.

## Verified sound

| # | Statement | Instances | Values computed on each side | Result | Change |
|---|---|---|---|---|---|
| A1 | `finite_algEquiv_of_two_le_genus_of_genus_constantCompositum_pos`: is `hK` load-bearing? | `y⁵ − y = a x⁵`, `a ∉ k⁵`, `k` separably closed of char 5 | `g(F/k) = 4·3/2 = 6`. `w = y − a^{1/5}x` gives `w⁵ = y`, so `F′ = k̄(w)` and `g′ = 0`: `hK` fails. Aut is infinite, one `α` for each `β ∈ k` | holds (excluded) | none |
| A2 | Same theorem, its conclusion | `y² = x⁵ − 1` over `ℚ`, exact constants | Hurwitz: `2g − 2 = 2·(−2) + 6`, so `g = g′ = 2`. `Aut_ℚ̄ = ℤ/10` (`y ↦ −y`, `x ↦ ζ₅x`). `Aut_ℚ = ℤ/2`, finite | holds | none |
| A3 | `finite_algEquiv_of_two_le_genus`, a case the pin misses | Hermitian `y³ + y = x⁴` over `𝔽̄₃` | Partials of `Y³Z + YZ³ − X⁴` are `−X³, Z³, Y³`, so the curve is smooth and `g = 3`. Gaps `{1, 2, 5}`, with `5 ≡ 2` mod 3, so `hgaps` fails. `|PGU₃(3)| = 27·28·8 = 6048`: finite | holds | none |
| A4 | Same theorem: is `hg` load-bearing? | `ℚ(x)`; `y² = x³ − x` over `ℚ̄` | `g = 0`: `PGL₂(ℚ) ∋ (x ↦ x + n)` for every `n`, so Aut is infinite. `g = 1`: translations by `E(ℚ̄)` give infinitely many. Both fail `2 ≤ g` | holds (excluded) | none |

The rows for statements this diff does not touch stand as in the previous review, of `78bda3b`.

- **Gate.**
  - The worker's PR-aware gate passes every check, including `build=0`.
  - My standalone rerun reports 0 on every scanner except `outside-folder=24`. Those 24 files are exactly the README and `Suggested.lean` of the 12 sibling folders this pull request owns: `git diff --name-only origin/main...HEAD` lists 2 files in each of 13 folders.
  - The excluded `diff --stat` is empty.
- **Dependency check.** It prints `depcheck: 206 roadmaps, 1922 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration.**
  - `lake env lean` gives only `declaration uses 'sorry'`, at lines 80 and 104.
  - I ran `#check @` on both declarations in a scratch copy. Every binder survives (`[IsAlgClosure k K]`, both scalar towers, `[PerfectField k]`, `hex`), as README §11.4 states them.
- **Change since `78bda3b`.**
  - The diff of this folder is empty.
  - The one changed file, `TauCetiRoadmap/CharacteristicClasses/README.md` (C7.6), and this README mention each other 0 times.
  - None of the fifteen seeded targets falls in a changed passage.
- **Pull request text against this head.** Four claims hold:
  - The summary sentence: main has `[IsAlgClosed k] [CharZero k]`; the head has `[PerfectField k]` and `0 < TauCeti.genus K F′`, both with `IsIntegrallyClosedIn k F`.
  - "drops two declarations now proved in Tau Ceti": main's `Suggested.lean` lines 55 and 73 are proved at the pin.
  - The EllipticCurves loop: the head names EllipticCurves only as a consumer (lines 62, 1747, 2417).
  - The merge order (this, then #1808, then #1854) matches `overlaps.md`.
- **Pinned declarations opened (4).**
  - `TauCeti/FieldTheory/Separable/Regular.lean:142`.
  - `TauCeti/FieldTheory/FunctionField/ConstantExtension/Genus/Basic.lean:243, 273`.
  - `TauCeti/FieldTheory/FunctionField/Automorphism/HigherGenus.lean:124`, with `[IsAlgClosed k]` at line 57 and `hgaps`.
- **Source locators checked (3).** The three Rosenlicht1955 locators of §11.4, its Checks and the docstring all hold:
  - line 140: §2 Theorem, p. 4;
  - lines 188–199: the §3 corollary and the extension to `k′K`, p. 5;
  - lines 425–429: the exceptional field, p. 10.
- **Overlaps.**
  - No id is dropped in either direction.
  - No cited id is defined only by an open revision.
  - #1808 and #1854 change this folder after this pull request, in the order the description gives.

Overlap check: read CanonicalModelsAndGonality (lines 23, 29, 86), FunctionFieldArithmetic (5, 29, 36), HyperellipticCurves (27, 97, 183), CurvesOverFiniteFields (6, 321, 330) and JacobianChallenge (open), and RamificationOfCompleteDiscretelyValuedFields, NumberFieldArithmetic and EllipticCurves (119, 358, 368) (main). AlgebraicCurves owns the shared objects: places, divisors, constant extensions, model classes, automorphisms and the curve dictionary. The four open roadmaps listed with line numbers and EllipticCurves cite it for them. JacobianChallenge is its supplier. RamificationOfCompleteDiscretelyValuedFields and NumberFieldArithmetic share nothing with it.

## Not verifiable

- none: the rows cite only `Rosenlicht1955`, which I read in the cache. No seeded target falls in a changed passage.

## Source issues

- none
