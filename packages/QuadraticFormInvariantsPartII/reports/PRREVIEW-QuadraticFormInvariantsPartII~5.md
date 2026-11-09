# Review of QuadraticFormInvariantsPartII (pull request #1834 at 4871d00)

**Verdict:** needs changes

This is an incremental re-review of 13 changed lines since 9aebbec (7 insertions, 6 deletions), all in `README.md`. Two passages changed: the Scope paragraph on `QuadraticFormsOverABase` (lines 118–123) and its Downstream-consumers bullet (lines 2028–2029). `Suggested.lean` is unchanged, and nothing outside the roadmap folder changed. The push gate passes, `Suggested.lean` elaborates with 19 `sorry` warnings and nothing else, and the dependency check reports 0 problems.

The previous R01 was repaired word for word. Since then the cited roadmap has moved. At the head of its pull request (#1930, 12a2c9e), `QuadraticFormsOverABase` states the `mapCoeffs`/`extendScalars` identification as a target of its §0.2, names this roadmap's §0.2 as a supplier, and no longer mentions the identification among its downstream consumers. The clause the repair added is therefore now wrong (R01 below, P3). The Downstream-consumers bullet is correct at that head.

## R01 (P3) — the Scope paragraph places the `mapCoeffs`/`extendScalars` identification among `QuadraticFormsOverABase`'s downstream consumers; at its head it is a §0.2 target

**Location.** `TauCetiRoadmap/QuadraticFormInvariantsPartII/README.md` lines 119–122: "for a field `K` and a `K`-algebra `L` its `mapCoeffs (algebraMap K L) Q` on `Fin n → K` is the coordinate polynomial of `extendScalars Q L` of 0.2 here, an identification that roadmap records among its downstream consumers".

**Claim.** `QuadraticFormsOverABase` records the identification `mapCoeffs (algebraMap K L) Q = extendScalars Q L` in its Downstream consumers.

**Witness.** `QuadraticFormsOverABase` at 12a2c9e, `README.md` §0.2 lines 320–322 has a target: "Prove the comparison with QuadraticFormInvariantsPartII §0.2: … `mapCoeffs (algebraMap K L) Q = extendScalars Q L`". Line 258 names this roadmap's §0.2 as a supplier. Its Downstream consumers (lines 976–980) list only ArithmeticStatisticsPartIII.

**Repair.** Attribute the identification to `QuadraticFormsOverABase` §0.2, as a statement it proves from 0.2 here. Also restore "commutative", which this roadmap's own 0.2 (line 493) and the Lean `extendScalars` (`[CommRing L]`, `Suggested.lean` line 102) require. Lines 118–123 become:

> Quadratic forms on `Fin n → R` over an arbitrary commutative ring belong to `QuadraticFormsOverABase`: its §0.2 extends a form by coefficients along any ring map (`mapCoeffs`) and proves, from 0.2 here, that for a field `K`, a commutative `K`-algebra `L` and a form `Q` on `Fin n → K`, `mapCoeffs (algebraMap K L) Q` is `extendScalars Q L`; its §§2.1–2.2 define smoothness over a base and prove the unit criteria. 0.1 and 0.2 stay over a field, on arbitrary finite-dimensional spaces, which is the generality Layers 0–2 use.

Tested on the instance that refuted the original: at 12a2c9e every claim in the new wording has a source in `QuadraticFormsOverABase`. `mapCoeffs` is defined in §0.2 (lines 314–320). The comparison is in §0.2 (lines 320–322), its supplier citation is at line 258, and its Check at `[1, a]` is at line 347. Smoothness is in §2.1 (line 500 ff.) and the unit criteria in §2.2 (line 538 ff.). Downstream consumers are no longer cited for anything. The Downstream-consumers bullet at lines 2028–2029 is true as written and needs no change.

## Previous findings

- R01 — repaired: lines 119–122 no longer say that §0.2 identifies the field case with `extendScalars`; they now read "an identification that roadmap records among its downstream consumers". That was accurate at 464f81f. The cited roadmap has since moved the identification into a §0.2 target, so the repair's clause is outdated and is raised again as this report's R01.

## Verified sound

**Gate, build and elaboration.** I re-ran the gate at 4871d00:

    gate QuadraticFormInvariantsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

The worker's run on the same head also reports `build=0`. I ran `lake env lean` on `TauCetiRoadmap/QuadraticFormInvariantsPartII/Suggested.lean` from the worktree. It produced 19 messages, all "declaration uses `sorry`", and no errors.

`git diff 9aebbec..HEAD` touches only `README.md`, so `Suggested.lean` is byte-identical to the file the r3 and r4 reports probed. That covers the padding probe (19 sorried theorems, none closing in one tactic), the 25 elaborated signatures and the section-binder check. `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` only.

**Dependency check** (with `--movable`):

    depcheck: 235 roadmaps, 2262 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line. The change adds no `*Needs:*` line, and this roadmap still cites nothing from `QuadraticFormsOverABase`. At 12a2c9e the edge runs the other way: `QuadraticFormsOverABase` names "From QuadraticFormInvariantsPartII. §0.2: `extendScalars`" (line 258) and cites it at §0.2 *Needs* (lines 332–334) and Dependencies (line 358). Its other suppliers sit after this roadmap in `ORDER.txt`: `GeometryOfNumbersAndQuadraticArithmeticPartII` at line 392 and `HyperellipticCurves` at line 394, against this roadmap at line 389. Listing it under Downstream consumers is the right direction.

**The changed passages, claim by claim, against `QuadraticFormsOverABase` at 12a2c9e.** That roadmap was read through the roadmaps tool, which lists #1930 at head 12a2c9e (index of 2026-11-09). The previous report read 464f81f.

- "Quadratic forms on `Fin n → R` over an arbitrary commutative ring belong to `QuadraticFormsOverABase`": true, Scope lines 34–37.
- "its §0.2 extends a form by coefficients along any ring map (`mapCoeffs`)": true. §0.2 is at lines 312–320, and Conventions line 131 says `mapCoeffs f Q` applies `f : R →+* S` to the coefficient matrix.
- "`mapCoeffs (algebraMap K L) Q` … is the coordinate polynomial of `extendScalars Q L`": true as mathematics (see the table). It is a §0.2 target there, lines 320–322.
- "an identification that roadmap records among its downstream consumers": false at 12a2c9e. This is R01.
- "its §§2.1–2.2 define smoothness over a base and prove the unit criteria": true. §2.1 (lines 500–537) defines `IsSmooth Q` through `(mapCoeffs f Q).radical = ⊥` at every algebraically closed `K`. §2.2 (lines 538–566) proves `isSmooth_iff_isUnit_halfDisc` (`n` odd) and `isSmooth_iff_isUnit_det` (`n` even).
- "0.1 and 0.2 stay over a field, on arbitrary finite-dimensional spaces": unchanged text, only reflowed. It is still true of this README: 0.1 (line 452 ff.) works on `F²` and on even-dimensional spaces, and 0.2 (line 491 ff.) defines `extendScalars Q L` on `Fin n → K` and transports it along a basis.
- Downstream bullet (lines 2028–2029), "`QuadraticFormsOverABase` identifies its base change by coefficients along `algebraMap K L` … with `extendScalars` (0.2) on `Fin n → K`": true at 12a2c9e, §0.2 lines 320–322.
- Ownership: one owner, one direction. `QuadraticFormsOverABase`'s Scope says it owns the comparison with "QuadraticFormInvariantsPartII §0.2's `extendScalars`" (lines 39–43). Its Scope also defers characteristic-two forms over fields and `extendScalars` to this roadmap (lines 84–87). This roadmap states no target that names `mapCoeffs`. Nothing is owned twice, and nothing is handed over in both directions.
- `QuadraticFormsOverABase`'s `Suggested.lean` (lines 39–40) names the comparison as not statable there because it lacks `extendScalars`. That is consistent: it cannot import a roadmap module. That file is not this roadmap's text.

**Library and own declarations behind the changed text.**
- `extendScalars` is at `Suggested.lean` line 101, with `{K} [Field K] (Q : QuadraticForm K (Fin n → K)) (L) [CommRing L] [Algebra K L]`. Its body is `∑ᵢ algebraMap K L (Q eᵢ) • proj i i + ∑_{i<j} algebraMap K L (polar Q eᵢ eⱼ) • proj i j`, which is the coordinate polynomial the changed text names.
- `algebraMap` is Mathlib's, in `Mathlib/Algebra/Algebra/Defs.lean`.

**Sampled locators in the changed passages.**
- 0.2 cites "EKM, §7, scalar extension before Lemma 7.15, p. 42". At ekm lines 2367–2368 (extraction page 50, printed p. 42, header at line 2324), EKM defines the extension of a form along a field extension as `x ⊗ v ↦ x² ϕ(v)`, with the extended polar form. Lemma 7.15 follows at line 2377 (p. 43). The coordinate definition for a commutative algebra is this roadmap's generalisation, and it agrees with EKM on field extensions.
- 0.1, named in the reflowed sentence, cites "EKM, Notation 7.3, Remark 7.4, Examples 7.5–7.6, pp. 40–41; Proposition 7.19, pp. 43–44". In ekm: Notation 7.3 is at line 2257 and Remark 7.4 at line 2273 (extraction page 48, p. 40). Examples 7.5–7.6 are at lines 2279–2281 (page 49, p. 41). Proposition 7.19 starts at line 2411 (page 51, p. 43) and continues past the page break at line 2417 (p. 44). All correct.
- The other seeded targets (0.5, 1.2, 2.1, 2.3, 2.6, 3.1, 3.3, 5.4, 5.5, 5.6, 6.1, 6.5, 7.1) are untouched by the diff and were verified in earlier rounds.

**Citations.** The worker's resolve tool lists one lead, `IsCi.exists_common_zero` (README line 1591). It is this roadmap's own declaration in `Suggested.lean`, not a library name. The overlap tool lists no other open pull request changing this roadmap and no dropped ids. I grepped all open heads and main for `mapCoeffs (algebraMap` and `QuadraticFormInvariantsPartII`. The only other roadmap that cites this one's §0.2 is `QuadraticFormsOverABase`, and every citation there resolves to 0.2 here (`### 0.2 Coordinate scalar extension`, line 491). `QuadraticFormInvariants` names this roadmap only as its continuation, at the heads of the pull requests that revise it.

**Adversarial table.** The first three rows are new, for the changed statements. The others are carried from r4 (9aebbec), which carried them from r3 (eda79c7) and r2 (04296f6); each concerns a statement this diff does not touch.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| New (Scope): `mapCoeffs (algebraMap K L) Q` is `extendScalars Q L` on `Fin n → K` | `[1, a]`, `K → L`; `x² + y²`, `ℚ → ℚ(i)`; `x²`, `𝔽₂ → 𝔽₂[ε]/(ε²)`; `n = 0` | `[1, a]`: both `x² + x y + a y²` (Check line 517 here; their Check line 347). `ℚ(i)`: coefficient matrix `!![1, 0; 0, 1]` on both; value at `(1, i)` is `1 + i² = 0` on both. `𝔽₂[ε]`: both `x²`; value at `ε` is `ε² = 0` on both. `n = 0`: both are the zero form on `Fin 0 → L`. | true as a polynomial identity, also for a non-reduced `L`; at 12a2c9e it is stated in their §0.2 (lines 320–322), not in their Downstream consumers (lines 976–980) | R01: attribute to their §0.2 |
| New (Scope): their §§2.1–2.2 | `x² + y z`, `x² + y² + z²` over `𝔽₂`; `x y`, `x² + y²` over `𝔽₂` | `x² + y z`: polar radical is the `x`-axis, `Q(1, 0, 0) = 1 ≠ 0`, so smooth; `δ′ = 1`. `x² + y² + z²`: `δ′ = 0`, not smooth. `x y`: polar determinant `−1 = 1`, smooth. `x² + y²`: polar determinant `0`, not smooth. | matches their 2.1 and 2.2 Checks (lines 524–536, 561–564) | none |
| New (Downstream bullet): `QuadraticFormsOverABase` identifies its base change along `algebraMap K L` with `extendScalars` | direction and location at 12a2c9e | their §0.2 target at lines 320–322; supplier "From QuadraticFormInvariantsPartII. §0.2" at line 258; their suppliers at `ORDER.txt` 392 and 394, against this roadmap at 389 | true; consumer direction | none |
| 7.1 route, base instance | `F = ℚ`, `w` 7-adic, `E = ℚ(√2)`, `B = ℤ_(7)[X]/(X² − 2)` | `2X · (X/4) − (X² − 2)/2 = 1`; `η ≡ 3, 4 mod 7`; `x = 3`: `p(3) = 7`, `p′(3) = 6` | matches the 7.1 Check `{ŵ(7) > 0, ŵ(6) = 0}` | carried from r4 (9aebbec) |
| 7.1, `E ⊊ F(η)` | `η = ⁴√2 ≡ 2 mod 7` | `p = X⁴ − 2`, `p(2) = 14`, `w₇ = 1`; `p′(2) = 32`, `w₇ = 0` | locus still a neighbourhood | carried from r4 (9aebbec) |
| 7.1, cofactor step | `f = (X² − 2)(X − 3)` over `ℤ_(7)` | `η ≡ 4`: `f′(η) ≡ 1`; `η ≡ 3`: `f′(3) ≡ 0 mod 7` | `w(p′(η)) = 0` exactly when `f′(η)` is a unit | carried from r4 (9aebbec) |
| 7.1, non-example | `η′ = 1 + 7√2`, `p = (X − 1)² − 98` | `p mod 7 = (X − 1)²`, `w(p′(η′)) = w(14√2) = 1` | the route takes the chart's `η` | carried from r4 (9aebbec) |
| 7.1, degenerate cases | trivial `w`; `𝔽₂(√t)/𝔽₂(t)` | trivial: `ŵ(0) = ∞`, `ŵ(1) = 0`; inseparable: `f′(η) ≠ 0` forces separability | consistent with the trivial-valuation Check | carried from r4 (9aebbec) |
| 2.8 locator and convention | `f = 2t₁ + t₂²`; EKM order versus `MonomialOrder.lex` | ekm line 3904: `(1, 0) > (0, 2)`, `f* = 2`; Mathlib `X 0 * X 1 < X 0 ^ 2` | README and Lean agree with EKM p. 75 | carried from r4 (9aebbec) |
| 2.8 statement | `n = 0`, `f = c`; `[1, 1]/𝔽₂`, `f = t` | `c⁻¹f = 1`, `f*f = c²`; `t ∉ D(q_{𝔽₂(t)})` by degree parity | all three clauses false together | carried from r4 (9aebbec) |
| `quadraticPfister a a₀` (1.1) | `m = 0`; `𝔽₂, a₀ = 1`; `ℚ, a₀ = 1/4`; `m = 1`, `2` invertible | `x² + x y + a₀y²`; values `1, 1, 1`; `(x + y/2)²`; `⟨1, −a₁, −b, a₁b⟩`, `b = 1 − 4a₀` | agrees with 1.1 and `pfisterForm_two` | carried from r4 (9aebbec) |
| Roundness without nonsingularity (1.4) | `ℚ`, `a₀ = 1/4`, `c = 4`, `c = 2`; `m = 1` singular | `4(x + y/2)² = (2x + y)²`; `2` not represented; values `c² − a d²` | as EKM Example 9.3, Prop 9.8(1) | carried from r4 (9aebbec) |
| Isotropic ⇔ `≅ dualProd` (1.5) | `𝔽₂`: `[1, 1]`, `[1, 0]`; `ℚ`, `a₀ = 1/4` | both false; `x(x + y) ≅ x y`; isotropic at `(1, −2)`, excluded by `1 − 4a₀ ≠ 0` | negative control holds | carried from r4 (9aebbec) |
| `extendScalars Q L` (0.2) | `[1, a]`; `L = K`; `n = 0` | `x₀² + a x₁² + x₀x₁`; `Q`; zero form | correct in every characteristic | carried from r4 (9aebbec) |
| Cassels–Pfister (2.2) | `n = 0`; `h = 0`; `⟨1, 1⟩/ℚ`, `h = t² + 1`, `h = 3` | `h = 0 = Q(0)`; `t² + 1 = Q(t, 1)`; `3 ∉ D(Q)` mod `3` | sound | carried from r4 (9aebbec) |
| Representation theorem (2.3) | `m = 0`, `Q = ⟨1⟩`; `Q = ℍ` | empty isometry; `ℍ` isotropic, `hQ` false | both anisotropy hypotheses needed | carried from r4 (9aebbec) |
| Springer (2.5) | `[1, 1]/𝔽₂` over `𝔽₈`, `𝔽₄`; `⟨1, t⟩/𝔽₃(t)`, `s³ = t` | degree 3 anisotropic; degree 2 splits; `−t = s²(−s)` anisotropic | inseparable case included | carried from r4 (9aebbec) |
| Norm principle (2.6) | `k = 0`; `E = K`; `𝔽₂(s)/𝔽₂(t)`, `s² = t`, `[1, 1]` | `N(c) = c²`; `s ∉ G(q_E)` by even `s`-degree | sound with zero trace | carried from r4 (9aebbec) |
| Subform theorem (2.10) | `m = 0`; `ψ = ⟨c⟩`; `q = ℍ`; `⟨⟨t, s⟩⟩_b ⊗ [1, 1]`, `ψ = [1, 1]` | `hirr` false for `0`, `cT₁²`; `ℍ` excluded; hyperbolic over `𝔽₄(s, t)`, `8 ≥ 2` | matches EKM 22.5 | carried from r4 (9aebbec) |
| Hauptsatz (2.11) | `n = 0`; `⟨1, 1⟩/𝔽₃`; `⟨1, 1, 1, 1⟩/ℚ`; `⟨1, 1⟩/ℝ` | `2 ≥ 2`; `4 ≥ 4`; `⟨1, 1⟩ ∈ I ∖ I²` | `[Nontrivial V]` gives `φ ≠ 0` | carried from r4 (9aebbec) |
| `kummerSymbol n a` (3.1) | `n = 0`; `n = 1` | `kummerClass (a 0) ∈ H¹`; `cup 1 1 (a₀)(a₁) ∈ H²` | left to right as documented | carried from r4 (9aebbec) |
| Milnor conjecture, cohomological (3.5) | `n = 0`; `ℝ`, `a = (−1, −1)` | `⟨⟨a⟩⟩ ↦ (a)`; `(−1) ∪ (−1) ≠ 0` | uniqueness from `fundamentalIdeal_pow_eq_addClosure` | carried from r4 (9aebbec) |
| 3.2 Check, plus-sign candidate | `⟨⟨2, −1⟩⟩`, `⟨⟨−1, 2⟩⟩` over `ℚ` | `{2, 1} = 0` versus `{−1, −1} ≠ 0` | candidate not well defined | carried from r4 (9aebbec) |
| 3.2a over `ℚ`, degree 3 | `{−1, −1, −1}` | signature `8 ∉ 16ℤ`; `K₃ᴹ(ℚ)/2 = ℤ/2` | bijective | carried from r4 (9aebbec) |
| Invariant-zero criterion (3.9) | `n = 0`; `ℚ`, `(−1, −1)`; `ℚ₂`, `(−1, −1, −1)` | `(a) = 0 ⇔ a` square; `≠ 0` over `ℚ`; `H³(G_{ℚ₂}, 𝔽₂) = 0`, `8⟨1⟩` isotropic | both directions | carried from r4 (9aebbec) |
| 3.6 Check `ē₂(⟨⟨t⟩⟩_b ⊗ [1, 1]) = [dt/t]` | `[1, t)` over `𝔽₂(t)` | `t` not a norm from `𝔽₄(t)` | consistent with 4.3 | carried from r4 (9aebbec) |
| Principal-unit criterion (4.2) | `m = 0`; `O = ⊤`; `ℚ₃`, `ε = 4`; `ℤ_(3)`, `ε = 7`; `𝔽₂((t))`, `ε = 1 + t` | vacuous; isotropic; zero at `(2, 0, 1, 0)`; `⟨1, 1, −7, −7⟩/ℚ` anisotropic; reduction lifts | both residue characteristics | carried from r4 (9aebbec) |
| Independent-value criterion (4.3) | `s = 0`; `O = ⊤`; `𝔽₂((t))`, `π = (t)`, `(t²)` | `[1, 1] ⊥ t[1, 1]` anisotropic; `t²` excluded; `v(1 + t + t²) = 1` | `hπ` is independence in `Γ/Γ²` | carried from r4 (9aebbec) |
| `IsCi i F` (5.1) | `𝔽₂`, `X² + XY + Y²`; `X^d`, `N = 1`; `ℝ`; zero polynomial | not `C₀`; `N = 1` excluded; sums of squares; any `x` | matches EKM §97, `d ≥ 1` | carried from r4 (9aebbec) |
| Lang–Nagata (5.4) | `r = 0`; `r = 1`; `r = 2, d = 2, i = 1, N = 5` | nonzero vector; the definition; `5 > 4` | sound | carried from r4 (9aebbec) |
| 5.3 Check | `x² + x y + y² + z²` over `𝔽₂` | four zeros, four non-zeros, `2 ∣ 4` | matches | carried from r4 (9aebbec) |
| Tsen–Lang (5.6) | `t = 0`; `𝔽_p(t)`; `ℝ(t)` | Cor 97.5; `C₁ ⇒ C₂`; `ℝ` not `C_i` | `Algebra.trdeg F E = ↑t` | carried from r4 (9aebbec) |
| `kroneckerDimension`, `constantField` (5.7) | `𝔽_p`, `ℚ`, `𝔽_p(t)`, `ℚ(t)`, `ℚ̄`; `𝔽₄(t)`, `ℚ(√2)(t)` | `0, 1, 1, 2, 1`; `𝔽₄`, `ℚ(√2)` | definitions determine the objects | carried from r4 (9aebbec) |
| Strict drop (5.7) | `w` nontrivial on `k`; trivial on `k` | `trdeg(κ/𝔽_p) ≤ dim F − 1`; `trdeg(κ/k) ≤ trdeg(F/k) − 1` | as dp p. 7 | carried from r4 (9aebbec) |
| 5.8 count | `e = dim κ ≤ r − 1` | `2^{r+1} ≥ 2^{e+2} > 2^{e+1}` | isotropic | carried from r4 (9aebbec) |
| Coefficient field (6.1) | `ℚ((t))`; `ℚ₂`; `O = ⊤` | section `ℚ ⊂ ℚ[[t]]`; `CharZero 𝔽₂` false; identity | sound | carried from r4 (9aebbec) |
| Transport along a section (6.1) | `ℚ((t))`, `ε = 1 + t`, `a₀ = t`; `a₀ = (1 − t)/4`; `𝔽₂((t))` | `[1, t] ≅ [1, 0]`; `1 − 4a₀ = t ∉ Oˣ`; `z² + z = t` solved | hypotheses exact | carried from r4 (9aebbec) |
| Dimension theorem (6.5) | `r = 0`; residue char `p`; `ℚ(x)^h_x`, `(−1, −1)`; `k ⊇ ℚ(i)` | vacuous; 5.8 concludes; `8⟨1⟩` anisotropic both sides; `Σ_{E′}` empty | hypothesis is Dittmann–Pop's | carried from r4 (9aebbec) |
| 6.2 bound | `t = 0`, `ℚ`, `v = 2`; `ℚ(x)`, `v = 3` | `cd₂ = 2`; `≤ 3` | `t + 2 ≤ e + 1 < r + 1` | carried from r4 (9aebbec) |
| 6.4 inverse system | `k ⊇ ℚ(i)`; `ℚ(√2)` | every `Σ_{E′}` empty; two real closures | finite nonempty fibres suffice | carried from r4 (9aebbec) |
| 6.0 Checks | `ℚ(√2)`; `ℚ(∛2)`, `ℚ(i)`; `ℝ/ℚ` | two orderings; one, two, zero real roots; real algebraic numbers | matches Kuhlmann 2.3, 2.5, 2.6 | carried from r4 (9aebbec) |
| Patch openness (7.2) | isotropic `q`; `⟨1⟩`; `⟨1, 1⟩/ℚ`; trivial `w` | `Spv F`; empty; contains `p ≡ 1 mod 4`, omits `3` | equals Dittmann–Pop's `V_a` | carried from r4 (9aebbec) |
| 0.1 / 0.3–0.6 Checks | `[1, 1] ⊥ ⟨1⟩/𝔽₂`; `⟨1, 1⟩_b/𝔽₂`; `⟨c⟩_b ⊗ [1, a]`; `⟨1, t⟩_b`; `4⟨1⟩/ℝ` | `ℍ ⊥ ⟨1⟩`; `W_b(𝔽₂) = ℤ/2`; `[c, a/c]`; degree parities; `4 ∉ 8ℤ` | agree with their sections | carried from r4 (9aebbec) |
| 1.1 Check (generation, char 2) | `t[1, 1]` over `𝔽₂(t)` | odd `t`-degree values, `1` not represented | unscaled one-fold forms do not generate | carried from r4 (9aebbec) |
| Worked example, `𝔽₂(t^{1/2})` | `dt` | `dt = 2 t^{1/2} d(t^{1/2}) = 0` | `[dt/t]` restricts to `0` | carried from r4 (9aebbec) |

**Remark on untouched text** (no change requested). The r4 remark is now settled on the other side: at 12a2c9e, `QuadraticFormsOverABase` §0.2 (lines 327–329) cites this roadmap's 0.2 comparison with `QuadraticForm.baseChange` for the field case of its `mapCoeffs_eq_baseChange`.

## Not verifiable

- `QuadraticFormsOverABase` was read at the head of its pull request (12a2c9e) through the roadmaps tool. The board holds no package for it, and its `plan.json` was not available.
- `kato82`, `arason75` and `milnor70` are uncertified (paywalled) and cited by locator only, as before. The diff touches none of them.

## Source issues

- none
