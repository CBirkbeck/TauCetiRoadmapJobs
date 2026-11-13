# Repair of PerfectoidQuotientsPartII (package, round 5)

Findings settled: the two P3 findings of `REV-PKG-PerfectoidQuotientsPartII~4`. I checked both by
direct computation and against the cached Stacks text (Stacks line 11208–11237, Lemma 10.99.16, tag
0H7N), and both are correct. F01 is applied as the review asks. For F02 I took the review's second
option: the Check is replaced by one that keeps `f` regular on `M`, so it tests regularity on `A`
alone. Only `packages/PerfectoidQuotientsPartII/README.md` changed. `Suggested.lean`,
`metadata.toml`, `sources.toml` and the plan's `gaps` list are unchanged. Neither finding touches a
Lean declaration, a locator or a supplier.

## REV-PKG-PerfectoidQuotientsPartII~4/F01 (P3) — applied

Verified: the Worked-examples tower used `f` both for the series in `p − f` and for Q10.4's
defining element. At `p = 2`, `f = x`, `n = 1`, the displayed `A/(φ_A(f))` is `ℤ₂⟦x⟧/(x²)`, which
is nonreduced. The intended stage is `ℤ₂⟦x⟧/(2 − x²)`.

Old → new: in that example the series is now `g` (`g = x_1`, or `g ∈ (p, x)²`); the defining element
is `f := p − g` of `R = A/(f)`, which for `g = x_1` is Q10.4's `x_1 − p` up to sign; the stages are
`A/(φ_A^n(p − g))`. Added the computed `p = 2` witnesses: `ℤ₂[√2]` with class `(1, 0)`,
`ℤ₂[2^{1/4}]`, and the nonreduced wrong models.

Pattern: the same notation appeared in the PerfectoidSpaces P7.17 contract line under "Exact
supplier contracts", where it was written `W(k)⟦x^{1/p^m}⟧/(p − f)` with `f ∈ (p, x)²`. I renamed it
to `g` so that `f` means the defining element throughout the README. That line gives no stage
formula, so only the letter changed. PerfectoidSpaces itself (main, P7.17) keeps its own `f`; the
contract is a paraphrase, and its content is unchanged. Q10.4 already used `f = x_1 − p` and
`f = p − g` with `g ∈ (p, x)²` and was left alone. Its Checks use the defining element
`f = p − x_1`, with stages `p − x_1^{pⁿ}`, so they were already consistent. In Q10.2, `f` is the
defining element throughout.

## REV-PKG-PerfectoidQuotientsPartII~4/F02 (P3) — applied differently

Verified: in `A = 𝔽_p[ε]/(ε²)` with `M = 𝔽_p` and `f = ε`, multiplication by `ε` on `M` is zero, so
`f` fails to be regular on both `A` and `M`. The Check therefore did not isolate regularity on `A`.
That example also cannot be adjusted: if `ε` is injective on `M`, then `ε·(εm) = 0` forces `m = 0`.

Old → new (Q7.4 third Check): the dual-number example → `N = ℤ[1/p]/ℤ`, `A = ℤ ⊕ N` with `N² = 0`,
`f = p`, `M = A/N = ℤ`. Here `p` is regular on `M` but kills `(0, [1/p])`. Both fibre conditions
hold (`A[1/p] = ℤ[1/p] = M[1/p]` and `A/pA = 𝔽_p = M/pM`), yet `Tor_1^A(M, M) = N ≠ 0`.

Why this is the mathematically right repair: if `f` is regular on `M`, then `A[f^∞]` kills `M`.
Over a noetherian ring the attempts I made collapse (for example `k[x,y]/(xy)` with `f = x` forces
`M/xM = 0`). A separating example therefore needs a non-noetherian `A`, with `f`-power torsion that is
`f`-divisible. Q7.4 assumes no noetherian hypothesis, so this example is in scope. I make no claim
about the noetherian case.

## Adversarial pass on the changed statements

| Statement | Instances | Values computed | Result / change |
|---|---|---|---|
| Worked tower, stages `A/(φ_A^n(p − g))` | `p = 2, d = 1, g = x, n = 1` | `φ_A(2 − x) = 2 − x²`; `ℤ₂⟦x⟧/(2 − x²) ≅ ℤ₂[√2]`, rank 2 over `R = ℤ₂⟦x⟧/(2 − x) = ℤ₂`; class in basis `([2],[x])` is `(1, 0)` | Regular, agrees with Q10.4 (2) for `n ≥ 1`. |
| Same | `p = 2, d = 1, g = x², n = 1` | `R = ℤ₂⟦x⟧/(2 − x²) = ℤ₂[√2]`; `φ_A(2 − x²) = 2 − x⁴`, Eisenstein, stage `ℤ₂[2^{1/4}]`, rank 2 over `R` = `[k : k^p]·pⁿᵈ = 1·2` | Agrees with Q10.4 (1) and (2). |
| Same, wrong model `A/(φ_A^n(g))` | `g = x`, `g = x²`, `n = 1` | `ℤ₂⟦x⟧/(x²)`, `ℤ₂⟦x⟧/(x⁴)`: `x ≠ 0` with `x² = 0` resp. `x⁴ = 0` | Nonreduced; recorded as the contrast in the example. |
| Same, sign of unramified relation | `g = x_1`: `p − x_1` vs Q10.4's `x_1 − p` | `f(0) = p` resp. `−p`, both of valuation 1; equal ideals | Same `R`, same stages; "up to sign" stated. |
| Same, `d = dim R` | `g = x_1`, general `d` | `A/(p − x_1) = W(k)⟦x_2, …, x_d⟧`, dimension `1 + (d − 1) = d` | Matches Q10.2's `d = dim R`. |
| P7.17 contract line (renamed `f → g`) | `p ∈ 𝔪²` case at main P7.17 | supplier writes `R ≅ W⟦x⟧/(p − f)`, `f ∈ (p, x)²`, stages `W⟦x^{1/p^m}⟧/(p − f)` | Same objects; letter only. |
| Q7.4 new Check: `p` zero divisor on `A` | `(0, [1/p]) ∈ A` | `p·(0, [1/p]) = (0, [1]) = 0`, `[1/p] ≠ 0` in `ℤ[1/p]/ℤ` | Hypothesis on `A` fails. |
| Same: `p` regular on `M` | `M = A/N = ℤ` | `p·m = 0 ⇒ m = 0` in `ℤ` | Hypothesis on `M` holds. |
| Same: `M[1/p]` flat over `A[1/p]` | localize at `p` | `N[1/p] = 0` (every element killed by a power of `p`), so `A[1/p] = ℤ[1/p] = M[1/p]`, free of rank 1 | Holds. |
| Same: `M/pM` flat over `A/pA` | quotient by `p` | `pN = N` (`[1/pᵏ] = p·[1/p^{k+1}]`), so `pA = pℤ ⊕ N`, `A/pA = 𝔽_p = M/pM`, free of rank 1 | Holds. |
| Same: conclusion fails | tensor `0 → N → A → M → 0` with `M` | `N ⊗_A M = N/N·N = N` (`N·N = 0`); the map to `M` is `n ⊗ m ↦ nm = 0`; `Tor_1^A(A, M) = 0`, so `Tor_1^A(M, M) = N ≠ 0` | `M` not flat; the regularity of `f` on `A` is necessary. |
| Same: Q7.4 proof route uses regularity on `A` | `Tor_1^A(M, A/f)` from `0 → A → A → A/f → 0` | the route needs `f` injective on `A`; here the kernel of `p` on `A` is `N[p] = ⟨[1/p]⟩ ≅ 𝔽_p ≠ 0` | Consistent with Stacks Lemma 10.99.16 (1) (Stacks line 11209, 11213). |
| Q7.4 retained Checks | `A = ℤ, f = p, M = ℤ_p`; `M = ℤ/p` | `ℚ_p` flat over `ℤ[1/p]`, `𝔽_p` over `𝔽_p` ⇒ flat; `M[1/p] = 0`, `M/pM = 𝔽_p`, `Tor_1^ℤ(ℤ/p, ℤ/p) = 𝔽_p` | Unchanged and still correct; the second isolates regularity on `M` (`p` regular on `ℤ`). |

## Checks

- Elaboration: `lake env lean packages/PerfectoidQuotientsPartII/Suggested.lean`, run from the
  content checkout, exited 0. There were fifteen warnings, all "declaration uses `sorry`" (lines 89,
  107, 118, 128, 137, 146, 157, 168, 186, 199, 222, 243, 266, 280, 315), and no errors. No `TauCeti.*`
  object file had to be built.
- Signatures: `Suggested.lean` is unchanged this round. The elaborated types in the worker's
  `signatures.md` are therefore those of the current file, and none of the 18 had lost a binder. No
  README statement with a Lean counterpart changed, so nothing needed comparing again.
- Dependency direction (`gate --depcheck … --movable`), complete output:

  ```text
  depcheck: 236 roadmaps, 2137 edges, 0 problem(s)
  ```

  There are no UPWARD, CYCLE or moved lines.
- Citation leads (`citations.md`): there are no unresolved cross-roadmap citations. The three Lean
  names flagged as found nowhere are roadmap targets, not claims about pinned declarations.
  `RegularTower.exists_perfectoidTower` is named in PerfectoidSpaces P7.17 (main). The two flatness
  criteria `DerivedDeRham.ordinaryFlatnessFromCompleteFlatness` and
  `DerivedDeRham.ordinaryFaithfulFlatnessFromCompleteFaithfulFlatness` are in DerivedDeRhamCohomology
  §1.10, in both its README and its `Suggested.lean`.
- Overlaps (`overlaps.md`): no open pull request changes this roadmap, and none drops a cited id. No
  new construction was added this round, so the ownership picture is the same as in the previous
  round.
- Sources: no new citation; `sources.toml` is unchanged and no `needs-references.toml` is needed.

## For the maintainer

- Nothing renamed: no Lean name, section number or target id changed, so citing roadmaps are
  unaffected.
- The review's "Source issues" section (CS24 and BS22 misprints and gaps) needs no action here. The
  README already states the corrected forms: positive-degree polynomials, nonempty finite products,
  the compatible-cover hypothesis and root transport in Q10.5.
- No text in the review asked for anything outside this package.
