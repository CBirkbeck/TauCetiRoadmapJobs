# Review of ComplexMultiplicationAndExplicitReciprocity (pull request #1254 at fa8fcda)

**Verdict:** accepted

Incremental re-review of the 8 lines changed since `c9fe5ac`, plus the pull request's title and description. No finding.

## Previous findings

- R01 — repaired: main is merged, `lake-manifest.json` pins Tau Ceti `2fd255d`; `Suggested.lean:61,63` “`TauCeti.NumberFieldArithmetic.principalIdealAway K m.support a`” elaborates, `sorry` at lines 70 and 93 the only warnings.
- R02 — repaired: `README.md:496–498` add three `g = 2` Checks (transcendence degree `3`; `f = ψ₄³/ψ₆²` at two product CM points; `U = diag(2,2,1,1)` on `ζ₅`); each fails for the constant-field model.
- R03 — repaired: description now reads “exact fields of regular CM level values … imported from ImaginaryQuadraticClassNumber §H3.1, on main” and “the author's red-team passes are applied”; the validation sentence names main's pins.

## Verified sound

| Statement | Instances tried | Computed values / two sides | Result | Change |
|---|---|---|---|---|
| Check, `README.md:496`: transcendence degree of `F_1`, `g = 2` | `g = 1, 2`; constant model `ℚ(ζ_N)` | `g(g+1)/2 = 1, 3`; constant model `0`; `ℚ(j)` gives `1`; three distinct values | Pass; discriminates | None |
| Check, `README.md:497`: `f = ψ₄³/ψ₆²` on the diagonal | `diag(√−2,√−2)`, `diag(ρ,√−2)`; identity `E₄³/E₆² = j/(j−1728)` | With `x=E₄³`, `y=E₆²`: `j=1728x/(x−y)`, `j−1728=1728y/(x−y)`, ratio `x/y`. `8000/6272=125/98`, square `15625/9604`; second point `0·(125/98)=0` | Pass; weights `12=12`; values `15625/9604 ≠ 0` refute a constant | None |
| Same Check: restriction `ψ_k(diag) = E_k⊗E_k` | `k=4,6`; limit `τ₂→i∞` | `dim M₄ = dim M₆ = 1`, so restriction is `c·E_k(τ₁)E_k(τ₂)`; `Φ` gives `c·E_k(τ₁)=E_k(τ₁)`, `c=1` | Pass | None |
| Same Check: regularity and the pole of `1/f` | zeros of `E₄`, `E₆` | `E₄` vanishes only on the orbit of `ρ`, `E₆` only on that of `i`; `j(√−2)=8000≠0,1728`; denominator nonzero at both points, numerator zero at the second | Pass; `1/f` has a pole there | None |
| Check, `README.md:498`: `U = diag(2,2,1,1)` on `ζ₅` | `J` block form and antidiagonal form; `U`, `U²`; wrong models | `UᵀJU = 2J` in both forms, `ν=2`, `det = 2·2·1·1 = 4 = ν²`; `ζ₅→ζ₅²`, `U²`: `ζ₅⁴`; no action: `ζ₅`; `det`: `ζ₅⁴` | Pass; three models give three different images | None |
| API `ζ_N ↦ ζ_N^{ν(U)}` against the reciprocity formula (`README.md:500`) | `U=(M mod N)⁻¹`, `ν(M)=N(a)⁻¹` | `ν(U)=N(a)`; `Art(a)` sends `ζ_N` to `ζ_N^{N(a)}`: both sides agree with the new Check's direction | Pass | None |
| Supplier name `TauCeti.NumberField.complexConjugationAt_eq_complexConj` (`README.md:59,113`) | pin `2fd255d` | `TauCeti/NumberTheory/NumberField/ComplexConjugation/CMField.lean:60`: `complexConjugationAt K⁺ w hw = IsCMField.complexConj K`; old name absent at the pin | Pass; statement matches the prose | None |
| `canonicalGrossExistence` (now elaborates) | `D = −3, −4, −7, −8, −20` | RHS false, false, true, true, false; `(i)=(1)` would force `1=±i`; `ζ₃` likewise for `−3` | Pass, as in the earlier rows | None |
| `classPolynomialHeightBound` (elaborates at the new pin) | `D=3`, `D=4` | one reduced form each, `a=1`: `M=e^{π√3}+2114.567≈2345.3 ≥ |j|=0`; `e^{2π}+2114.567≈2650.1 ≥ 1728` | Pass | None |

Rows for the untouched statements stand as in the previous review, of `c9fe5ac`.

- Gate at `fa8fcda`: OK, every counter 0 (`build=0`, `depcheck=0`, `outside-folder=0`).
- Elaboration (`lake env lean` on `Suggested.lean`): no error, 2 `sorry` warnings (lines 70, 93). Elaborated types of the 5 declarations compared with the README statements: no binder lost, nothing changed.
- One-tactic probe on a scratch copy (`simp`, `rfl`, `decide`, `aesop`, `tauto`, `simp` unfolding the three definitions): neither theorem closes; no padding.
- Dependency check output: `depcheck: 246 roadmaps, 2254 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Library declarations opened at pin `2fd255d`: 4 (`ComplexConjugation/CMField.lean:60`, `:66`; `GeometryOfNumbers/RankTwoDoubling.lean:51`, `:64`); `principalIdealAway` resolved by elaboration.
- Source locators: none in a changed passage, so the seeded sample falls outside the change; cross-roadmap citations in changed passages: none added. Overlap facts: no other open pull request changes this folder, none drops an id cited here, none dropped here. No file outside the folder differs from main.
- Overlap check: read ComplexMultiplicationAndExplicitReciprocityPartII, NonordinaryCMSpecialValues, GrossZagierAndArithmeticHeights, PELModuli, ShimuraVarieties, ImaginaryQuadraticClassNumber as in the review of `615f9de` (the change touches no ownership statement); nothing shared beyond the stated imports from ShimuraVarieties §5 and ImaginaryQuadraticClassNumber §H3.1.
- Pull request text: title, summary block and prose agree with the head (adds a roadmap; 3 files; 5 declarations; build and gate sentences true at this head; 13 open suppliers).
- Source independence: changed passages only; the 3 new Checks and 2 renamed supplier citations carry no source locator and were not set beside a source text (they are computed examples, recomputed above); largest share MilneCM, 18 of 72 locators; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- Deuring, GZ, BKO and Kato Lemma 15.11: as in the review of `615f9de` (paywalled, unreachable deposit, damaged extraction); no changed passage cites them.

## Source issues

- none

## For the human reviewers

- none
