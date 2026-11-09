# Review of QuadraticFormInvariantsPartII (pull request #1834 at 43253eb)

**Verdict:** accepted

This is an incremental re-review of 13 changed lines since 4871d00 (7 insertions, 6 deletions), all in `README.md`. Two passages changed: the Scope paragraph on `QuadraticFormsOverABase` (lines 118–123) and its Downstream-consumers bullet (lines 2028–2030). `Suggested.lean` is unchanged and nothing outside the roadmap folder changed. No finding remains; the gate passes.

## Previous findings

- R01 — repaired: lines 119–121 now read "its §0.2 extends a form by coefficients along any ring map (`mapCoeffs`) and proves, from 0.2 here, that for a field `K`, a commutative `K`-algebra `L` … `mapCoeffs (algebraMap K L) Q` is `extendScalars Q L`". The repair introduced no new problem.

## Verified sound

**Gate, build and elaboration.** I re-ran the gate at 43253eb:

    gate QuadraticFormInvariantsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

The worker's run on the same head also reports `build=0`. `lake env lean` on `TauCetiRoadmap/QuadraticFormInvariantsPartII/Suggested.lean`, run from the worktree, gives 19 messages, all "declaration uses `sorry`", and no errors.

`git diff 4871d00..HEAD` touches only `README.md`, so `Suggested.lean` is byte-identical to the file the earlier reports probed: the padding probe (19 sorried theorems, none closing in one tactic), the 25 elaborated signatures and the section-binder check stand. `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` only.

**Dependency check** (with `--movable`):

    depcheck: 235 roadmaps, 2262 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line. The change adds no `*Needs:*` line and this roadmap consumes nothing from `QuadraticFormsOverABase`; the edge runs the other way (their supplier contract "From QuadraticFormInvariantsPartII. §0.2: `extendScalars`", their README line 258, and their §0.2 *Needs*, lines 332–334).

**The changed passages, claim by claim, against `QuadraticFormsOverABase`.** That roadmap was read through the roadmaps tool at the head of its pull request, 12a2c9e (index of 2026-11-09), the same head the previous report read; line numbers are of its `README.md`.

- "its §0.2 extends a form by coefficients along any ring map (`mapCoeffs`)": true, §0.2 lines 314–319.
- "and proves, from 0.2 here, that for a field `K`, a commutative `K`-algebra `L` and a form `Q` on `Fin n → K`, `mapCoeffs (algebraMap K L) Q` is `extendScalars Q L`": true. Their §0.2, lines 320–321, has the target "Prove the comparison with QuadraticFormInvariantsPartII §0.2: for a field `K` and a commutative `K`-algebra `L`, `mapCoeffs (algebraMap K L) Q = extendScalars Q L`". "From 0.2 here" matches their *Needs* (lines 332–334) and Dependencies (line 358).
- "commutative": now agrees with 0.2 of this README (line 493, "a commutative `K`-algebra `L`") and with the Lean `extendScalars` (`[CommRing L] [Algebra K L]`, `Suggested.lean` lines 101–102).
- "its §§2.1–2.2 define smoothness over a base and prove the unit criteria": unchanged wording, still true (their §2.1 at line 500, §2.2 at line 538).
- "0.1 and 0.2 stay over a field, on arbitrary finite-dimensional spaces": unchanged wording, only reflowed; still true of 0.1 and 0.2 here.
- Downstream bullet (lines 2028–2030), "… with `extendScalars` (0.2) on `Fin n → K`, in its §0.2": true, same target at their lines 320–321; their Check at `[1, a]` is at lines 347–348. Their own Downstream consumers (lines 976–980) are no longer cited for anything.
- Ownership: one owner, one direction. Their Scope owns the comparison (lines 39–43) and defers `extendScalars` to this roadmap (lines 84–87). This roadmap states no target naming `mapCoeffs`: the only two occurrences of `QuadraticFormsOverABase` here are the two changed passages, and `Suggested.lean` mentions neither name.

**Sample.** None of the seeded targets (0.3, 0.5, 1.2, 2.5, 2.9, 2.10, 3.4, 3.7, 3.9, 5.6, 5.7, 6.1, 6.5, 7.1, 7.2) falls in a changed passage, and the diff changes no locator. The one section the changed text names, 0.2, keeps its locator "EKM, §7, scalar extension before Lemma 7.15, p. 42", verified in the previous report at ekm lines 2367–2368 (printed p. 42), Lemma 7.15 at ekm line 2377. The README flags no locator as unverified.

**Citations and overlaps.** The worker's resolve tool lists one lead, `IsCi.exists_common_zero` (README line 1591): it is this roadmap's own declaration in `Suggested.lean`, as before. The overlap tool lists no other open pull request changing this roadmap, no dropped id and no id that only an open revision defines.

**Library and own declarations behind the changed text** (2 opened). `extendScalars`, `Suggested.lean` lines 101–106: `∑ᵢ algebraMap K L (Q eᵢ) • proj i i + ∑_{i<j} algebraMap K L (polar Q eᵢ eⱼ) • proj i j`, the coefficientwise polynomial their §0.2 (lines 317–318) gives for `mapCoeffs f Q` at `f = algebraMap K L`. `algebraMap` is Mathlib's (`Mathlib/Algebra/Algebra/Defs.lean`).

**Adversarial table.** The first two rows are new, for the two changed statements. The others are carried from the previous report (r5, at 4871d00); each concerns a statement this diff does not touch.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| New (Scope, lines 119–121): their §0.2 proves `mapCoeffs (algebraMap K L) Q` is `extendScalars Q L`, `L` commutative | `[1, a]`, `K → L`; `x² + y²`, `ℚ → ℚ(i)`; `x²`, `𝔽₂ → 𝔽₂[ε]/(ε²)`; `x y`, `ℚ → ℚ × ℚ`; `n = 0`; `L` non-commutative | `[1, a]`: both `x² + x y + a y²`. `ℚ(i)`: both `x² + y²`, value at `(1, i)` is `1 + i² = 0`. `𝔽₂[ε]`: both `x²`, value at `ε` is `0`. `ℚ × ℚ` (not a domain): both `x y`, value at `((1,0),(0,1))` is `(0,0)`. `n = 0`: both the zero form. Non-commutative `L`: `extendScalars` does not elaborate (`[CommRing L]`), so "commutative" is needed | true; stated at their §0.2 lines 320–321 with the same hypotheses | none |
| New (Downstream bullet, lines 2028–2030): the identification is in their §0.2 | location and direction at 12a2c9e | target at their lines 320–321; supplier contract at line 258; their Downstream consumers (lines 976–980) list only ArithmeticStatisticsPartIII | true; consumer direction | none |
| Scope: their §§2.1–2.2 | `x² + y z`, `x² + y² + z²` over `𝔽₂`; `x y`, `x² + y²` over `𝔽₂` | `x² + y z`: polar radical is the `x`-axis, `Q(1, 0, 0) = 1 ≠ 0`, so smooth; `δ′ = 1`. `x² + y² + z²`: `δ′ = 0`, not smooth. `x y`: polar determinant `−1 = 1`, smooth. `x² + y²`: polar determinant `0`, not smooth. | matches their 2.1 and 2.2 Checks (lines 524–536, 561–564) | carried from r5 (4871d00) |
| 7.1 route, base instance | `F = ℚ`, `w` 7-adic, `E = ℚ(√2)`, `B = ℤ_(7)[X]/(X² − 2)` | `2X · (X/4) − (X² − 2)/2 = 1`; `η ≡ 3, 4 mod 7`; `x = 3`: `p(3) = 7`, `p′(3) = 6` | matches the 7.1 Check `{ŵ(7) > 0, ŵ(6) = 0}` | carried from r5 (4871d00) |
| 7.1, `E ⊊ F(η)` | `η = ⁴√2 ≡ 2 mod 7` | `p = X⁴ − 2`, `p(2) = 14`, `w₇ = 1`; `p′(2) = 32`, `w₇ = 0` | locus still a neighbourhood | carried from r5 (4871d00) |
| 7.1, cofactor step | `f = (X² − 2)(X − 3)` over `ℤ_(7)` | `η ≡ 4`: `f′(η) ≡ 1`; `η ≡ 3`: `f′(3) ≡ 0 mod 7` | `w(p′(η)) = 0` exactly when `f′(η)` is a unit | carried from r5 (4871d00) |
| 7.1, non-example | `η′ = 1 + 7√2`, `p = (X − 1)² − 98` | `p mod 7 = (X − 1)²`, `w(p′(η′)) = w(14√2) = 1` | the route takes the chart's `η` | carried from r5 (4871d00) |
| 7.1, degenerate cases | trivial `w`; `𝔽₂(√t)/𝔽₂(t)` | trivial: `ŵ(0) = ∞`, `ŵ(1) = 0`; inseparable: `f′(η) ≠ 0` forces separability | consistent with the trivial-valuation Check | carried from r5 (4871d00) |
| 2.8 locator and convention | `f = 2t₁ + t₂²`; EKM order versus `MonomialOrder.lex` | ekm line 3904: `(1, 0) > (0, 2)`, `f* = 2`; Mathlib `X 0 * X 1 < X 0 ^ 2` | README and Lean agree with EKM p. 75 | carried from r5 (4871d00) |
| 2.8 statement | `n = 0`, `f = c`; `[1, 1]/𝔽₂`, `f = t` | `c⁻¹f = 1`, `f*f = c²`; `t ∉ D(q_{𝔽₂(t)})` by degree parity | all three clauses false together | carried from r5 (4871d00) |
| `quadraticPfister a a₀` (1.1) | `m = 0`; `𝔽₂, a₀ = 1`; `ℚ, a₀ = 1/4`; `m = 1`, `2` invertible | `x² + x y + a₀y²`; values `1, 1, 1`; `(x + y/2)²`; `⟨1, −a₁, −b, a₁b⟩`, `b = 1 − 4a₀` | agrees with 1.1 and `pfisterForm_two` | carried from r5 (4871d00) |
| Roundness without nonsingularity (1.4) | `ℚ`, `a₀ = 1/4`, `c = 4`, `c = 2`; `m = 1` singular | `4(x + y/2)² = (2x + y)²`; `2` not represented; values `c² − a d²` | as EKM Example 9.3, Prop 9.8(1) | carried from r5 (4871d00) |
| Isotropic ⇔ `≅ dualProd` (1.5) | `𝔽₂`: `[1, 1]`, `[1, 0]`; `ℚ`, `a₀ = 1/4` | both false; `x(x + y) ≅ x y`; isotropic at `(1, −2)`, excluded by `1 − 4a₀ ≠ 0` | negative control holds | carried from r5 (4871d00) |
| `extendScalars Q L` (0.2) | `[1, a]`; `L = K`; `n = 0` | `x₀² + a x₁² + x₀x₁`; `Q`; zero form | correct in every characteristic | carried from r5 (4871d00) |
| Cassels–Pfister (2.2) | `n = 0`; `h = 0`; `⟨1, 1⟩/ℚ`, `h = t² + 1`, `h = 3` | `h = 0 = Q(0)`; `t² + 1 = Q(t, 1)`; `3 ∉ D(Q)` mod `3` | sound | carried from r5 (4871d00) |
| Representation theorem (2.3) | `m = 0`, `Q = ⟨1⟩`; `Q = ℍ` | empty isometry; `ℍ` isotropic, `hQ` false | both anisotropy hypotheses needed | carried from r5 (4871d00) |
| Springer (2.5) | `[1, 1]/𝔽₂` over `𝔽₈`, `𝔽₄`; `⟨1, t⟩/𝔽₃(t)`, `s³ = t` | degree 3 anisotropic; degree 2 splits; `−t = s²(−s)` anisotropic | inseparable case included | carried from r5 (4871d00) |
| Norm principle (2.6) | `k = 0`; `E = K`; `𝔽₂(s)/𝔽₂(t)`, `s² = t`, `[1, 1]` | `N(c) = c²`; `s ∉ G(q_E)` by even `s`-degree | sound with zero trace | carried from r5 (4871d00) |
| Subform theorem (2.10) | `m = 0`; `ψ = ⟨c⟩`; `q = ℍ`; `⟨⟨t, s⟩⟩_b ⊗ [1, 1]`, `ψ = [1, 1]` | `hirr` false for `0`, `cT₁²`; `ℍ` excluded; hyperbolic over `𝔽₄(s, t)`, `8 ≥ 2` | matches EKM 22.5 | carried from r5 (4871d00) |
| Hauptsatz (2.11) | `n = 0`; `⟨1, 1⟩/𝔽₃`; `⟨1, 1, 1, 1⟩/ℚ`; `⟨1, 1⟩/ℝ` | `2 ≥ 2`; `4 ≥ 4`; `⟨1, 1⟩ ∈ I ∖ I²` | `[Nontrivial V]` gives `φ ≠ 0` | carried from r5 (4871d00) |
| `kummerSymbol n a` (3.1) | `n = 0`; `n = 1` | `kummerClass (a 0) ∈ H¹`; `cup 1 1 (a₀)(a₁) ∈ H²` | left to right as documented | carried from r5 (4871d00) |
| Milnor conjecture, cohomological (3.5) | `n = 0`; `ℝ`, `a = (−1, −1)` | `⟨⟨a⟩⟩ ↦ (a)`; `(−1) ∪ (−1) ≠ 0` | uniqueness from `fundamentalIdeal_pow_eq_addClosure` | carried from r5 (4871d00) |
| 3.2 Check, plus-sign candidate | `⟨⟨2, −1⟩⟩`, `⟨⟨−1, 2⟩⟩` over `ℚ` | `{2, 1} = 0` versus `{−1, −1} ≠ 0` | candidate not well defined | carried from r5 (4871d00) |
| 3.2a over `ℚ`, degree 3 | `{−1, −1, −1}` | signature `8 ∉ 16ℤ`; `K₃ᴹ(ℚ)/2 = ℤ/2` | bijective | carried from r5 (4871d00) |
| Invariant-zero criterion (3.9) | `n = 0`; `ℚ`, `(−1, −1)`; `ℚ₂`, `(−1, −1, −1)` | `(a) = 0 ⇔ a` square; `≠ 0` over `ℚ`; `H³(G_{ℚ₂}, 𝔽₂) = 0`, `8⟨1⟩` isotropic | both directions | carried from r5 (4871d00) |
| 3.6 Check `ē₂(⟨⟨t⟩⟩_b ⊗ [1, 1]) = [dt/t]` | `[1, t)` over `𝔽₂(t)` | `t` not a norm from `𝔽₄(t)` | consistent with 4.3 | carried from r5 (4871d00) |
| Principal-unit criterion (4.2) | `m = 0`; `O = ⊤`; `ℚ₃`, `ε = 4`; `ℤ_(3)`, `ε = 7`; `𝔽₂((t))`, `ε = 1 + t` | vacuous; isotropic; zero at `(2, 0, 1, 0)`; `⟨1, 1, −7, −7⟩/ℚ` anisotropic; reduction lifts | both residue characteristics | carried from r5 (4871d00) |
| Independent-value criterion (4.3) | `s = 0`; `O = ⊤`; `𝔽₂((t))`, `π = (t)`, `(t²)` | `[1, 1] ⊥ t[1, 1]` anisotropic; `t²` excluded; `v(1 + t + t²) = 1` | `hπ` is independence in `Γ/Γ²` | carried from r5 (4871d00) |
| `IsCi i F` (5.1) | `𝔽₂`, `X² + XY + Y²`; `X^d`, `N = 1`; `ℝ`; zero polynomial | not `C₀`; `N = 1` excluded; sums of squares; any `x` | matches EKM §97, `d ≥ 1` | carried from r5 (4871d00) |
| Lang–Nagata (5.4) | `r = 0`; `r = 1`; `r = 2, d = 2, i = 1, N = 5` | nonzero vector; the definition; `5 > 4` | sound | carried from r5 (4871d00) |
| 5.3 Check | `x² + x y + y² + z²` over `𝔽₂` | four zeros, four non-zeros, `2 ∣ 4` | matches | carried from r5 (4871d00) |
| Tsen–Lang (5.6) | `t = 0`; `𝔽_p(t)`; `ℝ(t)` | Cor 97.5; `C₁ ⇒ C₂`; `ℝ` not `C_i` | `Algebra.trdeg F E = ↑t` | carried from r5 (4871d00) |
| `kroneckerDimension`, `constantField` (5.7) | `𝔽_p`, `ℚ`, `𝔽_p(t)`, `ℚ(t)`, `ℚ̄`; `𝔽₄(t)`, `ℚ(√2)(t)` | `0, 1, 1, 2, 1`; `𝔽₄`, `ℚ(√2)` | definitions determine the objects | carried from r5 (4871d00) |
| Strict drop (5.7) | `w` nontrivial on `k`; trivial on `k` | `trdeg(κ/𝔽_p) ≤ dim F − 1`; `trdeg(κ/k) ≤ trdeg(F/k) − 1` | as dp p. 7 | carried from r5 (4871d00) |
| 5.8 count | `e = dim κ ≤ r − 1` | `2^{r+1} ≥ 2^{e+2} > 2^{e+1}` | isotropic | carried from r5 (4871d00) |
| Coefficient field (6.1) | `ℚ((t))`; `ℚ₂`; `O = ⊤` | section `ℚ ⊂ ℚ[[t]]`; `CharZero 𝔽₂` false; identity | sound | carried from r5 (4871d00) |
| Transport along a section (6.1) | `ℚ((t))`, `ε = 1 + t`, `a₀ = t`; `a₀ = (1 − t)/4`; `𝔽₂((t))` | `[1, t] ≅ [1, 0]`; `1 − 4a₀ = t ∉ Oˣ`; `z² + z = t` solved | hypotheses exact | carried from r5 (4871d00) |
| Dimension theorem (6.5) | `r = 0`; residue char `p`; `ℚ(x)^h_x`, `(−1, −1)`; `k ⊇ ℚ(i)` | vacuous; 5.8 concludes; `8⟨1⟩` anisotropic both sides; `Σ_{E′}` empty | hypothesis is Dittmann–Pop's | carried from r5 (4871d00) |
| 6.2 bound | `t = 0`, `ℚ`, `v = 2`; `ℚ(x)`, `v = 3` | `cd₂ = 2`; `≤ 3` | `t + 2 ≤ e + 1 < r + 1` | carried from r5 (4871d00) |
| 6.4 inverse system | `k ⊇ ℚ(i)`; `ℚ(√2)` | every `Σ_{E′}` empty; two real closures | finite nonempty fibres suffice | carried from r5 (4871d00) |
| 6.0 Checks | `ℚ(√2)`; `ℚ(∛2)`, `ℚ(i)`; `ℝ/ℚ` | two orderings; one, two, zero real roots; real algebraic numbers | matches Kuhlmann 2.3, 2.5, 2.6 | carried from r5 (4871d00) |
| Patch openness (7.2) | isotropic `q`; `⟨1⟩`; `⟨1, 1⟩/ℚ`; trivial `w` | `Spv F`; empty; contains `p ≡ 1 mod 4`, omits `3` | equals Dittmann–Pop's `V_a` | carried from r5 (4871d00) |
| 0.1 / 0.3–0.6 Checks | `[1, 1] ⊥ ⟨1⟩/𝔽₂`; `⟨1, 1⟩_b/𝔽₂`; `⟨c⟩_b ⊗ [1, a]`; `⟨1, t⟩_b`; `4⟨1⟩/ℝ` | `ℍ ⊥ ⟨1⟩`; `W_b(𝔽₂) = ℤ/2`; `[c, a/c]`; degree parities; `4 ∉ 8ℤ` | agree with their sections | carried from r5 (4871d00) |
| 1.1 Check (generation, char 2) | `t[1, 1]` over `𝔽₂(t)` | odd `t`-degree values, `1` not represented | unscaled one-fold forms do not generate | carried from r5 (4871d00) |
| Worked example, `𝔽₂(t^{1/2})` | `dt` | `dt = 2 t^{1/2} d(t^{1/2}) = 0` | `[dt/t]` restricts to `0` | carried from r5 (4871d00) |

**Headlines.** The diff changes no headline, no Lean statement and no docstring; the headline list and the not-statable list of the module docstring are as the earlier reports checked them.

## Not verifiable

- `QuadraticFormsOverABase` was read at the head of its pull request (12a2c9e) through the roadmaps tool. The board holds no package for it; it is not in the merge order yet, and this roadmap does not consume it.
- `kato82`, `arason75` and `milnor70` are uncertified (paywalled) and cited by locator only, as before. The diff touches none of them.

## Source issues

- none
