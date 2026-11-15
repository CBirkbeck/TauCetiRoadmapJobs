# Repair of DiracScatteringAndNonlinearFourierTransform (design, round 8)

This round answers the findings of `REV-DESIGN-DiracScatteringAndNonlinearFourierTransform~7`: verdict
`needs_changes`, three P2 and three P3 findings. Files edited:

- `packages/DiracScatteringAndNonlinearFourierTransform/design/README.md`
- `packages/DiracScatteringAndNonlinearFourierTransform/design/plan.json`
- `packages/DiracScatteringAndNonlinearFourierTransform/sources.toml`

There is no `Suggested.lean` at the design stage. Every finding was checked against the cited source lines,
the pinned libraries and the supplier roadmap before it was edited.

## F01 (P2) — applied

Verified with poltoratski2024 line 1134–1138 and 1160–1165, and with mauth2022 line 3264–3268 and 3292–3298.
Both print the factor `γ(ty)` next to the new height `y′`. Two forms with a common factor `κ` have determinant
`i|κ|² sinh(2ty′)` at a real point. So (2.2) forces `|κ| = γ(ty′)`. Computed values: `2.0820i` at `ty′ = 1.52`
and `2.4448i` at `ty′ = 1.6` with the factor `γ(1.5)`, and `2i` with `γ(ty′)`.

Old → new: in §8.9, `E(t, s) = α′ γ(ty) sin(…)` and `Ẽ(t, s) = α′ γ(ty) cos(…)` → `α′ γ(ty′)` in both. The
route now derives `|κ| = γ(ty′)`. The third Check is replaced by the determinant identity with the computed
values. A fourth Check says why the printed factor cannot be kept.

On the instance, the moduli of `(E(s), Ẽ(s))` cannot both be matched with the factor `γ(1.5)` and height `1.5`:
over real `x′`, the larger of the two modulus errors is at least `0.00125`. With `γ(1.52)`,
`x′ = 0.3, y′ = 1.52, α′ = 1` gives an exact match. The review's `0.0021` uses another measure of the mismatch.

Also repaired:

- §8.6, "Determinant consistency": the common height `p/t` of `z₀`, `z̃₀`, which the factor `γ(p)` needs, is
  now explicit, together with the value `2i sinh 2p′/sinh 2p` at another height.
- plan.json 8.6 and 8.9.

§8.7, §8.8 and §9.2 already pair `γ(t y)` with the same height. No other occurrence exists.

## F02 (P2) — applied

Verified. AutomorphicSpectralTheory §0.5 (README line 182–198 at the head of its open pull request, merge order
line 98, consumable here) states the subtracted-kernel representation with a unique triple
`a = Re F(i)`, `b ≥ 0` and Poisson-finite `ν`, converted from Tau Ceti's finite `ρ`.

Old → new: §2.2's derivation from the Tau Ceti Nevanlinna theorems → a citation of AutomorphicSpectralTheory
§0.5, keeping only the passage `u → F`, `c = b`, `ν = πν_F`, uniqueness, the mass formula and the vague limit.
§6.5 and the Conventions name the triple `(Re m(i), β, μ/π)`. Added: a supplier section, a Scope deferral, and
matching *Needs:*, Dependencies and plan.json entries.

Witnesses: `u = P[δ₀]` has `F = −1/(πz)` with triple `(0, 0, δ₀/π)`, so `ν = δ₀`. Reading `ν = ν_F` would give
mass `1/π ≠ 1 = πy u(iy)`. `u = Im z` has triple `(0, 1, 0)`, and `u ≡ 1` has `F = i` with
`ν_F = dx/π`, so `ν = dx`.

## F03 (P2) — applied

Verified. The four sentences tie Layers 7–9 to sections of poltoratski2024. poltoratski2024 line 579–581 states
Theorem 1 for real `f ∈ L²(ℝ₊)`.

Old → new:

- Scope: the "(Poltoratski §§6–8)" and "(Poltoratski §9)" parentheses are deleted.
- The scope paragraph now cites Theorem 1 (line 579–581) for the generality, without "as in the source" or
  "where the source's argument is written".
- Layer 7 opens "From here on the potential is real, `q = f`."
- Layer 9 opens "Locators in this layer are to arXiv version 14 of poltoratski2024 (References)."

Same pattern, also repaired:

- Summary: "The last three layers carry out Poltoratski's argument" → "For real potentials the last three
  layers develop …".
- The References note "§9 of version 14 … is the route of Layer 9" now only says where version 14 proves the
  absence of resonances.
- The `cited_for` entry of mnatsakanyan2022, "choice of route", is reworded.

No layer moved, and the locators at the claims stay.

## F04 (P3) — applied

Verified. poltoratski2024 line 1116–1117 states Lemma 8 for every `s ∈ ℝ` with `w(s) w̃(s) ≠ 0`. Its proof,
line 1141–1172, uses only these two numbers and (2.2) at `s`.

Old → new: "for almost every `s`" with `D = D(C, s)` → "let `s ∈ ℝ`, `w, w̃ > 0` numbers, `C > 1`". The new
hypotheses: `ε₀` and `D` depend only on `C`, `w`, `w̃`; `E`, `Ẽ` are entire and satisfy (2.2) at `s`. `√w`
replaces `√w(s)`. §9.3 and §9.6 apply the result where `w(s) w̃(s) > 0`, which by §6.8 is almost every `s`.

The route now names the derivative bound `|g′| ≥ t√(w w̃)/cosh²(5C)` and the translation of parameters. *Needs:*
is §8.1, plus §3.2 and §6.8 for the application. §6.8 was added to §9.6's *Needs:* line. plan.json 8.9 and 9.6
are updated to match.

## F05 (P3) — applied

Verified. Before this round, §6.6 stated only the isometric embedding and uniqueness, and the weak convergence
appeared only in its route.

Old → new: §6.5 has a new API bullet, "Truncations". It states:

- `m = Re m(i) + i H_ν((z − i)/(z + i))`;
- `ν_T(X) = Im m_T(i) → Im m(i)`;
- `ν_T → ν` weakly on the circle.

The measures are defined inline, so that §6.5 does not use §6.7's notation before §6.7. The route uses the
pinned `TauCeti.I_mul_herglotzTransform_cayley_eq`, `MeasureTheory.Measure.herglotzTransform(_zero)` and
Mathlib's Fourier density and weak-convergence lemma. Three Checks are added. §6.6 and §6.8 cite the bullet,
and §6.8 no longer needs §6.6.

The review proposed only `TauCeti.boundaryCayley` as the input. That leaves the route without its Herglotz
identity and density step, so the pinned inputs above are named instead.

## F06 (P3) — applied

Verified with Mathlib `HarmonicAt.differentiableAt_complex_partial` (`Analysis/Complex/Harmonic/Analytic.lean`
line 35, the function `fderiv f z 1 − I * fderiv f z I`). If `F = U + iu`, then `F′ = u_y + iu_x = i(u_x − iu_y)`.

Old → new: "`F′` being the conjugate complex partial of `u`" → "`i(∂ₓu − i∂ᵧu)`, `i` times the complex
partial of `u`". The primitive has imaginary part `u` after subtracting an imaginary constant. New Checks:

- `u = Im z`: `i · (−i) = 1`.
- `u = P[δ₀]`: `F′ = 1/(πz²) = i · (−i/(πz²))`. By finite differences at `0.3 + 0.7i`, both sides are
  `−0.378490 − 0.397414i`.

## Dependency check

```
candidate: DiracScatteringAndNonlinearFourierTransform is not in the merge order yet; checked as if placed after AutomorphicSpectralTheory (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2231 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. `roadmaps resolve` on the README found no unresolved cross-roadmap
citation and no unresolved Lean name. The tool did not check names outside TauCetiRoadmap, so each new pinned
name was opened by hand at the pin:

- Tau Ceti:
  - `MeasureTheory.Measure.herglotzTransform`: `Analysis/Complex/Herglotz.lean` line 138.
  - `MeasureTheory.Measure.herglotzTransform_zero`: same file, line 150.
  - `TauCeti.I_mul_herglotzTransform_cayley_eq`: `Analysis/Complex/Pick/Nevanlinna.lean` line 404, in namespace
    `TauCeti`.
  - `TauCeti.exists_isFiniteMeasure_eq_nevanlinnaKernel_add`: same file, line 436.
- Mathlib:
  - `span_fourier_closure_eq_top`: `Analysis/Fourier/AddCircle.lean` line 244, root namespace.
  - `AddCircle.homeomorphCircle'`: `Analysis/SpecialFunctions/Complex/Circle.lean` line 421.
  - `MeasureTheory.FiniteMeasure.tendsto_iff_forall_integral_rclike_tendsto`:
    `MeasureTheory/Measure/FiniteMeasure.lean` line 748, inside `namespace FiniteMeasure` (lines 96–1025).

No `Suggested.lean` exists at this stage, so there was no elaboration and no `#check` comparison.

README and plan.json agree, compared by script, paragraph by paragraph and Check by Check. The only difference
is the 6.7 statement, which differed before this round and is untouched.

## Adversarial pass (changed statements)

Computed with plain Python, using closed-form constant-coefficient propagators and midpoint quadrature in
`x = tan u`.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §8.9 exact forms | `w = 0.7`, `w̃ = 0.9`, `t = 1`, `s = 0`, `x = 0.3`, `ty = 1.5` | factor `γ(1.5)`: det `2i`, `2.0820i`, `2.4448i` at `ty′ = 1.5, 1.52, 1.6`; factor `γ(ty′)`: `2i` each; `2 sinh 3.04/sinh 3 = 2.0820` | old statement false; new holds | factor `γ(ty′)` |
| §8.9 instance | `E(s)`, `Ẽ(s)` from height `1.52`, factor `γ(1.52)` | distances from the height-1.5 forms `0.00225`, `0.00203`; best `x′` at height 1.5, factor `γ(1.5)`: max modulus error `0.00125` at `x′ = 0.30752`; `γ(1.52)`, `x′ = 0.3`: exact | new Check | added |
| §8.9 route, derivative | `C = 2`, same data, grid on `Q(0, 6)` | `g′` by finite difference `0.018463 − 0.127210i` = formula; `min |g′| = 9.7·10⁻⁷ ≥ t√(ww̃)/cosh²(10) = 6.5·10⁻⁹` | bound holds | none |
| §8.9 degenerate | `w w̃ > 1` (`w = 2`, `w̃ = 1`) | no real `Φ` with `cos Φ = √2`: hypotheses empty | vacuous, not false | none |
| §8.9 degenerate | `ε → 0`, exact data | conclusion with `x′ = x`, `y′ = y`, `α′ = α` (first Check) | holds | none |
| §8.6 determinant | `z = 0.1 + 0.4i`, `−1.2 − 0.7i`, `2` | same height: `2i` at all three; height `1.52` with factor `γ(1.5)`: `2.08202i` at all three | identity is entire; Check holds | heights explicit |
| §2.2 derivative | `u = Im z`; `u = P[δ₀]` at `0.3 + 0.7i` | `i(u_x − iu_y) = 1`; `−0.378490 − 0.397414i` both sides; conjugate partial gives `i` for `Im z` | old wording false; new holds | F06 |
| §2.2 dictionary | `P[δ₀]`, `Im z`, `u ≡ 1`, `u ≡ 0` | triples `(0, 0, δ₀/π)`, `(0, 1, 0)`, `(0, 0, dx/π)`, `(0, 0, 0)` → `(c, ν) = (0, δ₀)`, `(1, 0)`, `(0, dx)`, `(0, 0)`; `ν = ν_F` would give mass `1/π` against `πy u(iy) = 1` | holds | Check added |
| §2.2 uniqueness step | `Re` at `i` of `cz + (1/π)∫((x − z)⁻¹ − x/(1+x²))dν` | `Re (x − i)⁻¹ = x/(1 + x²)`, cancels: `0` | holds | none |
| §2.2 non-example | `u = Re z` | `−1` at `−1 + i` | positivity needed | none |
| §6.5 triple of `m` | free case; `f ≡ 1` | free: `(0, 0, dx/π)`, `m = i`; `f ≡ 1`: `m(i) = 0.414214i`, `Re m(i) = 0` | holds | none |
| §6.5 Herglotz identity | `f ≡ 1`, `μ = w dx`, `w = √(x² − 1)/|x|` on `|x| > 1` | `z = 0.3 + 0.5i`: `m = 0.127392 + 0.248147i`, `i H_ν = 0.127392 + 0.248147i`; `z = −1.5 + 0.2i`: `−0.580174 + 0.676978i` both; `H_ν(0) = 0.4142136 = Im m(i)` | holds | added |
| §6.5 masses | `f ≡ 1`, truncations | `Im m_T(i) = 0.537329, 0.443190, 0.415910, 0.414219, 0.414214` at `T = 0.5, 1, 2, 4, 8`; limit `√2 − 1 = 0.414214` | holds | Check added |
| §6.5 weak, not pointwise | `f ≡ 1`, `x = 2` | `1/|E(T, 2)|²` over `T ∈ (0, 20]`: min `0.5000`, max `1.5000`; mean over period `π/√3`: `0.8660254`; `m(2 + i0) = 0.5 + 0.8660254i` | pointwise false, weak true | Check added |
| §6.5 free case | `q = 0` | `μ_T = dx`, `ν_T = σ`, `H ≡ 1`, `m_T = i` | holds | Check added |
| §6.5 sign witness | constant `c = 0.5`, `z = 0`, `T = 2`; `det M` | `A = 2.718282 = e¹`; `det M = 1.000000` | propagator agrees with the Conventions | none |
| §6.8 route | uses §6.5 bullet | `ν_T(X) → ν(X)` from the masses; free `σ` fixed | holds | §6.6 dropped from *Needs:* |

## Ownership

I searched by object, with `roadmaps grep` over main and the open heads, for "herglotz", "nevanlinna
representation", "pick function", "positive harmonic" and "nonnegative harmonic".

- AutomorphicSpectralTheory §0.5 is the only planned owner of the subtracted-kernel representation on `ℂ₊`.
- Completed/OneParameterSemigroups mentions Herglotz only as Tau Ceti results, in its progress file.
- ConformalMappingPartII (main) uses the pinned disc Herglotz formula.
- ClassicalErgodicTheory (open) uses Tau Ceti's Herglotz theorem for positive-definite sequences.
- PDE and ExplicitNumberFields cite Harnack's inequality only.

None of these states the half-plane representation, its uniqueness or the harmonic form.

This roadmap owns:

- the harmonic form in §2.2;
- the truncation convergence for Dirac Weyl functions in §6.5, which is specific to Layer 6. Its generic inputs
  are pinned.

The overlap report: no open pull request changes this roadmap, drops an id it cites, or defines an id only in
an open revision.

## For the maintainer

- New supplier: AutomorphicSpectralTheory §0.5, an open pull request at merge order line 98, in this
  roadmap's consumable list. The gate now places this roadmap right after it. If that pull request renumbers
  §0.5, the citations in §2.2, §6.5, the Conventions, Scope and the supplier contracts follow it. The
  human-review question whether the Herglotz section should move to a common supplier remains open.
- Source issues confirmed: poltoratski2024 (8.5) and mauth2022 (58) both print `γ(ty)`. The README states the
  corrected factor and records the misprint at the locator.
- plan.json keeps the target name `diracE_exact_form_at_point` for 8.9, although the statement is now about
  general entire `E`, `Ẽ`. No Lean declaration exists at this stage and no other roadmap cites the name.
- No other roadmap cites a name changed in this round. No section was renumbered.
