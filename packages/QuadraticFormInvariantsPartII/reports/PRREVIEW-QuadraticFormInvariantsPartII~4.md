# Review of QuadraticFormInvariantsPartII (pull request #1834 at 9aebbec)

**Verdict:** needs changes

This is an incremental re-review of the 8 changed lines since eda79c7 (8 insertions, 0 deletions), all in `README.md`: a new Scope paragraph on `QuadraticFormsOverABase` (lines 118–122) and a new Downstream-consumers bullet on the same roadmap (lines 2027–2028). `Suggested.lean` is unchanged. Nothing outside the roadmap folder changed. The previous report had no findings, so there is nothing to carry. The push gate passes, `Suggested.lean` elaborates, and the dependency check shows no problem. One P3 finding: the new passages cite `QuadraticFormsOverABase` §0.2 for a comparison that section does not state at the head of its pull request.

## R01 (P3) — `QuadraticFormsOverABase` §0.2 is cited for a comparison it does not contain

**Location.** `TauCetiRoadmap/QuadraticFormInvariantsPartII/README.md` lines 119–120: "its §0.2 extends a form by coefficients along any ring map (`mapCoeffs`) and identifies the case of a field `K` and a `K`-algebra `L` with `extendScalars` of 0.2 here"; and lines 2027–2028: "`QuadraticFormsOverABase` compares its base change by coefficients with `extendScalars` (0.2) in its §0.2."

**Claim.** Both passages locate the identification `mapCoeffs (algebraMap K L) Q = extendScalars Q L` in `QuadraticFormsOverABase` §0.2.

**Witness.** `QuadraticFormsOverABase` at the head of its pull request (#1930, 464f81f), `README.md` §0.2 (lines 300–329): it defines `mapCoeffs f Q`, proves the evaluation, composition, identity and coefficient-matrix laws, and proves `mapCoeffs_eq_baseChange` against Mathlib's `QuadraticForm.baseChange` when `2` is invertible. The name `extendScalars` does not occur in its Layer 0 (lines 274–339). It occurs only in its Scope (line 80, as the deferral of characteristic-two forms over fields to this roadmap) and in its Downstream consumers (lines 961–964), which say that `extendScalars Q L` on `Fin n → K` "is `mapCoeffs (algebraMap K L) Q`, both being the coordinate polynomial with the coefficients mapped into `L`; it cites 0.2". That bullet is a remark, not a target: neither roadmap states the identification as a target with hypotheses. (`QuadraticFormsOverABase` is later than this roadmap in the merge order: it is not listed yet, and its suppliers `GeometryOfNumbersAndQuadraticArithmeticPartII` and `HyperellipticCurves` are at `ORDER.txt` lines 392 and 394, after this roadmap at 389. So this roadmap cannot own the comparison, since it cannot name `mapCoeffs`; the only accurate statement here is where the other roadmap records it.)

**Repair.** Do not locate the identification in §0.2. Lines 118–122:

> Quadratic forms on `Fin n → R` over an arbitrary commutative ring belong to `QuadraticFormsOverABase`: its §0.2 extends a form by coefficients along any ring map (`mapCoeffs`), and for a field `K` and a `K`-algebra `L` its `mapCoeffs (algebraMap K L) Q` on `Fin n → K` is the coordinate polynomial of `extendScalars Q L` of 0.2 here, an identification that roadmap records among its downstream consumers; its §§2.1–2.2 define smoothness over a base and prove the unit criteria. 0.1 and 0.2 stay over a field, on arbitrary finite-dimensional spaces, which is the generality Layers 0–2 use.

Lines 2027–2028:

> - `QuadraticFormsOverABase` identifies its base change by coefficients along `algebraMap K L`, for a field `K` and a `K`-algebra `L`, with `extendScalars` (0.2) on `Fin n → K`.

Tested on the instance that refuted the original: with these wordings every section cited (`QuadraticFormsOverABase` §0.2, §§2.1–2.2) states what it is cited for at 464f81f, and the identification is attributed to the place that states it.

## Previous findings

The previous report (eda79c7) had no findings; nothing is carried.

## Verified sound

**Gate, build and elaboration.** I re-ran the gate at 9aebbec:

    gate QuadraticFormInvariantsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

The worker's run on the same head also reports `build=0`. `lake env lean` on `TauCetiRoadmap/QuadraticFormInvariantsPartII/Suggested.lean`, run from the worktree, gives 19 warnings, all "declaration uses `sorry`", and no error. The Lean file is byte-identical to the one the previous report probed for padding (19 sorried theorems, none closing in one tactic; 25 signatures printed), so that probe stands. `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` only.

**Dependency check** with `--movable`:

    depcheck: 235 roadmaps, 2261 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The change adds no `*Needs:*` line: `QuadraticFormsOverABase` is named only in Scope and in Downstream consumers, and this roadmap cites nothing from it. Direction: `QuadraticFormsOverABase` has no `*Needs:*` edge to this roadmap either (its only mentions are its Scope line 80 and its Downstream bullet, lines 961–964), and its suppliers place it after this roadmap, so listing it under Downstream consumers is the right direction.

**The changed passages, claim by claim, against `QuadraticFormsOverABase` at 464f81f.**
- "its §0.2 extends a form by coefficients along any ring map (`mapCoeffs`)": true, §0.2 lines 302–304 and Conventions line 123 (`mapCoeffs f Q` for `f : R →+* S`, applied to the coefficient matrix).
- "identifies the case of a field `K` and a `K`-algebra `L` with `extendScalars`": not in §0.2; see R01.
- "its §§2.1–2.2 define smoothness over a base and prove the unit criteria": true, §2.1 (lines 480–517, `IsSmooth Q` by the radical of `mapCoeffs f Q` at every algebraically closed `K`) and §2.2 (lines 518–546, `isSmooth_iff_isUnit_halfDisc` for `n` odd, `isSmooth_iff_isUnit_det` for `n` even).
- "0.1 and 0.2 stay over a field, on arbitrary finite-dimensional spaces": true of this README. 0.1 (line 451 ff.) works on `F²` and on even-dimensional spaces over a field; 0.2 (line 490 ff.) defines `extendScalars Q L` on `Fin n → K` and transports it to a finite-dimensional `V` along a basis. The Lean `extendScalars` (`Suggested.lean` line 101) takes `[Field K]`, `Q : QuadraticForm K (Fin n → K)`, `[CommRing L] [Algebra K L]`, as the README says.
- Ownership: the two roadmaps keep distinct objects. This roadmap owns scalar extension over a field on arbitrary finite-dimensional spaces in every characteristic; `QuadraticFormsOverABase` owns base change along any ring map on `Fin n → R`. Its Scope (line 80) defers nonsingular and quasilinear forms over fields of characteristic two to this roadmap, which matches this Scope. Nothing is owned twice and nothing is handed in both directions; only the location of the comparison is misstated (R01).

**Sampled locator that falls in the changed passages.** 0.2 cites "EKM, §7, scalar extension before Lemma 7.15, p. 42": ekm line 2367–2368 (extraction page 50, printed p. 42, footer at line 2324) defines `ϕ_K(x ⊗ v) = x² ϕ(v)` with polar form `(b_ϕ)_K`, and Lemma 7.15 follows at line 2377 (p. 43). The other sampled targets (0.5, 0.6, 2.4, 2.9, 2.10, 5.1, 5.3, 5.8, 6.0, 6.1, 6.3, 6.5, 7.1, 7.2) are untouched by the diff and were verified in the previous reports.

**Citations.** The worker's resolve tool lists one lead, `IsCi.exists_common_zero` at README line 1590: it is this roadmap's own declaration, `Suggested.lean` line 301, not a library name, so nothing is missing. `QuadraticFormsOverABase` resolves to pull request #1930 (a new roadmap folder by another author); the board holds no package README for it, so its open head is the only copy, and it is the one checked above.

**Adversarial table.** One new row for the changed statement; the rows for untouched statements are carried from the previous report (eda79c7), which carried most of them from 04296f6.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| New: `mapCoeffs (algebraMap K L) Q` versus `extendScalars Q L` on `Fin n → K` | `[1, a]`; `[1, 1]` over `𝔽₂` to `𝔽₄`; `n = 0`; `2` invertible | `[1, a]`: both are `x² + xy + f(a) y²` (this README 0.2 Check, `QuadraticFormsOverABase` 0.2 Check line 327), not `x² + f(a) y²`; `[1, 1]/𝔽₂ → 𝔽₄`: `ω² + ω + 1 = 0` at `(ω, 1)`, isotropic on both sides, nonsingular on both; `n = 0`: both the zero form on `Fin 0 → L`; `2` invertible: both compared with `QuadraticForm.baseChange` through `Fin n → L ≅ L ⊗ (Fin n → K)` (`mapCoeffs_eq_baseChange` there, the "comparison" bullet of 0.2 here) | the identification is true as a polynomial identity; no target states it in either roadmap | R01: cite where it is recorded |
| 7.1 new route, base instance | `F = ℚ`, `w` 7-adic, `E = ℚ(√2)`, `B = ℤ_(7)[X]/(X² − 2)` | pair `(X² − 2, 1)`: `2X · (X/4) − (X² − 2)/2 = 1` over `ℤ_(7)`. `η = √2 ≡ 3` or `4 mod 7`. `p = f`, `f′(η) = 2√2` of value `0`. `x = 3`: `p(3) = 7`, `p′(3) = 6`. | matches the 7.1 Check `{ŵ(7) > 0, ŵ(6) = 0}` | carried from r3 (eda79c7); statement untouched |
| 7.1, `E ⊊ F(η)` | `E = ℚ(√2)` through `η = ⁴√2 ≡ 2 mod 7` | `η² ≡ 4`, a square root of `2` mod 7; `p = X⁴ − 2`, `x = 2`: `p(2) = 14`, `w₇ = 1`; `p′(2) = 32`, `w₇ = 0` | the locus is still a neighbourhood | carried from r3 (eda79c7); statement untouched |
| 7.1, the cofactor step | `f = (X² − 2)(X − 3)` over `ℤ_(7)` | root `η ≡ 4`: `p′(η) ≡ 1`, `(f/p)(η) ≡ 1`, `f′(η) ≡ 1`; root `η ≡ 3`: `f′(3) ≡ 0 mod 7` | `w(p′(η)) = 0` exactly when `f′(η)` is a unit | carried from r3 (eda79c7); statement untouched |
| 7.1, the earlier non-example | `η′ = 1 + 7√2`, `p = (X − 1)² − 98` | `p mod 7 = (X − 1)²`, `w(p′(η′)) = w(14√2) = 1 > 0` | the route takes the chart's `η`, never an arbitrary generator | carried from r3 (eda79c7); statement untouched |
| 7.1, degenerate cases | trivial `w`; inseparable `𝔽₂(√t)/𝔽₂(t)` | trivial: `p = X − η`, `ŵ(0) = ∞ > 0`, `ŵ(1) = 0`; inseparable: `f′(η) ≠ 0` forces separability | consistent with the trivial-valuation Check | carried from r3 (eda79c7); statement untouched |
| 2.8 locator and convention | `f = 2t₁ + t₂²`; EKM order versus `MonomialOrder.lex` | EKM line 3904: `(1, 0) > (0, 2)`, `f* = 2`; Mathlib `X 0 * X 1 < X 0 ^ 2` | README and Lean agree with EKM p. 75 | carried from r3 (eda79c7); statement untouched |
| 2.8 statement | `n = 0`, `f = c`; `[1, 1]/𝔽₂`, `f = t` | `f = c`: no irreducible divisor, `c⁻¹f = 1` and `f*f = c²` similarity factors; `f = t`: `[1, 1]` not hyperbolic over `𝔽₂`, `t ∉ D(q_{𝔽₂(t)})` by degree parity | all three clauses false together | carried from r3 (eda79c7); statement untouched |
| `quadraticPfister a a₀` (1.1) | `m = 0`; `𝔽₂, a₀ = 1`; `ℚ, a₀ = 1/4`; `m = 1`, `2` invertible | `m = 0`: `x² + xy + a₀y²`; `𝔽₂`: values `1, 1, 1`, anisotropic; `ℚ`: `(x + y/2)²`, polar determinant `0`; `m = 1`: `⟨1, −a₁, −b, a₁b⟩ = pfisterForm ![a₁, b]` with `b = 1 − 4a₀` | agrees with Conventions, 1.1 and `pfisterForm_two` | carried from r2 (04296f6); statement untouched |
| Roundness without nonsingularity (1.4) | `ℚ`, `a₀ = 1/4`, `c = 4` and `c = 2`; `m = 1` singular | `4(x + y/2)² = (2x + y)²`; `c = 2` not represented; `m = 1`: values `c² − a d²` | true, as Example 9.3 + Prop 9.8(1) | carried from r2 (04296f6); statement untouched |
| Isotropic ⇔ `≅ dualProd` with `1 − 4a₀ ≠ 0` (1.5) | `𝔽₂`: `[1, 1]`, `[1, 0]`; `ℚ`, `a₀ = 1/4` | `[1, 1]`: both false; `[1, 0] = x(x + y) ≅ xy`; `a₀ = 1/4`: isotropic at `(1, −2)`, not hyperbolic, excluded by `h` | negative control holds | carried from r2 (04296f6); statement untouched |
| `extendScalars Q L` (0.2) | `[1, a]`; `L = K`; `n = 0` | `x₀² + a x₁² + x₀x₁`; `L = K`: `Q`; `n = 0`: zero form | correct in every characteristic | carried from r2 (04296f6); statement untouched |
| Cassels–Pfister (2.2) | `n = 0`; `h = 0`; `⟨1, 1⟩/ℚ`, `h = t² + 1`, `h = 3` | `h = 0 = Q(0)`; `t² + 1 = Q(t, 1)`; `3 ∉ D(Q)` mod `3` | sound | carried from r2 (04296f6); statement untouched |
| Representation theorem (2.3) | `m = 0`, `Q = ⟨1⟩`; `Q = ℍ` | empty isometry, right side vacuous; `ℍ` isotropic, `hQ` false | both anisotropy hypotheses needed and present | carried from r2 (04296f6); statement untouched |
| Springer (2.5) | `[1, 1]/𝔽₂` over `𝔽₈`, `𝔽₄`; `⟨1, t⟩/𝔽₃(t)` over `𝔽₃(s)`, `s³ = t` | degree `3`: anisotropic; degree `2`: splits; `−t = s²(−s)`, anisotropic | inseparable case included | carried from r2 (04296f6); statement untouched |
| Norm principle (2.6) | `k = 0`; `E = K`; `𝔽₂(s)/𝔽₂(t)`, `s² = t`, `q = [1, 1]` | `N(c) = c²`; values of `[1, 1]` over `𝔽₂(s)` have even `s`-degree so `s ∉ G(q_E)` | sound with zero trace | carried from r2 (04296f6); statement untouched |
| Subform theorem (2.10) | `m = 0`; `ψ = ⟨c⟩`; `q = ℍ`; `⟨⟨t, s⟩⟩_b ⊗ [1, 1]/𝔽₂(s, t)`, `ψ = [1, 1]` | `hirr` false for `0`, `cT₁²`; `q = ℍ` excluded; `F(ψ) = 𝔽₄(s, t)`, `q` hyperbolic there, `8 ≥ 2` | matches EKM 22.5 | carried from r2 (04296f6); statement untouched |
| Hauptsatz (2.11) | `n = 0`; `⟨1, 1⟩/𝔽₃`; `⟨1, 1, 1, 1⟩/ℚ`; `⟨1, 1⟩/ℝ` | `2 ≥ 2`; `4 ≥ 4`; `⟨1, 1⟩/ℝ ∈ I ∖ I²` | `[Nontrivial V]` supplies `φ ≠ 0` | carried from r2 (04296f6); statement untouched |
| `kummerSymbol n a` (3.1) | `n = 0`; `n = 1` | `kummerClass (a 0) ∈ H¹`; `cup 1 1 (a₀)(a₁) ∈ H²` | left-to-right as documented | carried from r2 (04296f6); statement untouched |
| Milnor conjecture, cohomological form (3.5) | `n = 0`; `ℝ`, `n = 1`, `a = (−1, −1)` | `⟨⟨a⟩⟩ ↦ (a)`; `⟨1, 1, 1, 1⟩ ↦ (−1) ∪ (−1) ≠ 0` | uniqueness from `fundamentalIdeal_pow_eq_addClosure` | carried from r2 (04296f6); statement untouched |
| 3.2 Check, plus-sign candidate | `⟨⟨2, −1⟩⟩`, `⟨⟨−1, 2⟩⟩` over `ℚ` | `{2, 1} = 0` versus `{−1, −2} = {−1, −1} ≠ 0` | the candidate is not well defined | carried from r2 (04296f6); statement untouched |
| 3.2a over `ℚ`, degree `3` | `{−1, −1, −1}` | `8⟨1⟩` signature `8 ∉ 16ℤ`; `K₃ᴹ(ℚ)/2 = ℤ/2` | bijective | carried from r2 (04296f6); statement untouched |
| Invariant-zero criterion (3.9) | `n = 0`; `ℚ`, `(−1, −1)`; `ℚ₂`, `(−1, −1, −1)` | `(a) = 0 ⇔ a` square; `(−1) ∪ (−1) ≠ 0` over `ℚ`; `H³(G_{ℚ₂}, 𝔽₂) = 0` and `8⟨1⟩` isotropic | both directions | carried from r2 (04296f6); statement untouched |
| 3.6 Check `ē₂(⟨⟨t⟩⟩_b ⊗ [1, 1]) = [dt/t] ≠ 0` | `[1, t)` over `𝔽₂(t)` | `t` not a norm from `𝔽₄(t)`: division algebra | consistent with 4.3 | carried from r2 (04296f6); statement untouched |
| Principal-unit criterion (4.2) | `m = 0`; `O = ⊤`; `ℚ₃`, `ε = 4`, `a₀ = 1/4`; `ℤ_(3) ⊂ ℚ`, `ε = 7`; `𝔽₂((t))`, `ε = 1 + t` | vacuous; isotropic; zero at `(2, 0, 1, 0)`; `⟨1, 1, −7, −7⟩` anisotropic over `ℚ`, henselianity needed; reduction `[1, 1] ⊥ [1, 1]` lifts | sound in both residue characteristics | carried from r2 (04296f6); statement untouched |
| Independent-value criterion (4.3) | `s = 0`; `O = ⊤`; `𝔽₂((t))`, `π = (t)`, `(t²)`; `(1, t)` | `[1, 1] ⊥ t[1, 1]` anisotropic; `π = t²` excluded; `v(1 + t + t²) = 1` | `hπ` is `𝔽₂`-independence in `Γ/Γ²` | carried from r2 (04296f6); statement untouched |
| `IsCi i F` (5.1) | `𝔽₂`, `X² + XY + Y²`; `X^d`, `N = 1`; `ℝ`; zero polynomial | `N = 2 > 1`, no nonzero zero: not `C₀`; `N = 1` excluded; sums of squares; any nonzero `x` | matches EKM §97 with `d ≥ 1` | carried from r2 (04296f6); statement untouched |
| Lang–Nagata (5.4) | `r = 0`; `r = 1`; `r = 2, d = 2, i = 1, N = 5` | a nonzero vector exists; the definition; `5 > 4` | sound | carried from r2 (04296f6); statement untouched |
| 5.3 Check | `x² + xy + y² + z²` over `𝔽₂` | four zeros, four non-zeros, `2 ∣ 4` | matches | carried from r2 (04296f6); statement untouched |
| Tsen–Lang (5.6) | `t = 0`; `𝔽_p(t)`; `ℝ(t)` | Cor 97.5; `C₁ ⇒ C₂`; `ℝ` not `C_i` | `Algebra.trdeg F E = ↑t`, no finite generation | carried from r2 (04296f6); statement untouched |
| `kroneckerDimension`, `constantField` (5.7) | `𝔽_p`, `ℚ`, `𝔽_p(t)`, `ℚ(t)`, `ℚ̄`; `𝔽₄(t)`, `ℚ(√2)(t)` | `0, 1, 1, 2, 1`; `𝔽₄`, `ℚ(√2)` | definitions determine the objects | carried from r2 (04296f6); statement untouched |
| Strict drop (5.7) | `w` nontrivial on `k`; trivial on `k` | `trdeg(κ/𝔽_p) ≤ dim F − 1`; `trdeg(κ/k) ≤ trdeg(F/k) − 1` | as dp p. 7 | carried from r2 (04296f6); statement untouched |
| 5.8 count | `e = dim κ ≤ r − 1` | `2^{r+1} ≥ 2^{e+2} > 2^{e+1}` | isotropic | carried from r2 (04296f6); statement untouched |
| Coefficient field (6.1) | `ℚ((t))`; `ℚ₂`; `O = ⊤` | section `ℚ ⊂ ℚ[[t]]`; `CharZero 𝔽₂` false; identity | sound | carried from r2 (04296f6); statement untouched |
| Transport along a section (6.1) | `ℚ((t))`, `ε = 1 + t`, `a₀ = t`; `a₀ = (1 − t)/4`; `𝔽₂((t))`, `ε = 1 + t` | `[1, t] ≅ [1, 0]`; `1 − 4a₀ = t ∉ Oˣ` needed; `z² + z = t` solved by `t + t² + t⁴ + ⋯` | hypotheses exact | carried from r2 (04296f6); statement untouched |
| Dimension theorem (6.5) | `r = 0`; residue characteristic `p`; `K = ℚ(x)^h_x`, `ε = (−1, −1)`; `k ⊇ ℚ(i)` | vacuous; `hreal` vacuous and 5.8 concludes; `8⟨1⟩` anisotropic on both sides; empty `Σ_{E′}` | the Lean hypothesis is Dittmann–Pop's | carried from r2 (04296f6); statement untouched |
| 6.2 bound | `t = 0`, `E′ = ℚ`, `v = 2`; `E′ = ℚ(x)`, `v = 3` | `cd₂(ℚ₂^h) = 2`; `cd₂(ℚ(x)ℚ₃^h) ≤ 3` | `t + 2 ≤ e + 1 < r + 1` | carried from r2 (04296f6); statement untouched |
| 6.4 inverse system | `k ⊇ ℚ(i)`; `k = ℚ(√2)` | every `Σ_{E′}` empty; two real closures, transition maps well defined | finite nonempty fibres suffice | carried from r2 (04296f6); statement untouched |
| 6.0 Checks | `ℚ(√2)`; `ℚ(∛2)`, `ℚ(i)`; `ℝ` over `ℚ` | two orderings; one, two, zero real roots; real algebraic numbers | matches Kuhlmann 2.3, 2.5, 2.6 | carried from r2 (04296f6); statement untouched |
| Patch openness (7.2) | isotropic `q`; `⟨1⟩`; `⟨1, 1⟩/ℚ`; trivial `w` | `Spv F`; empty; contains `p ≡ 1 mod 4`, omits `3` | equals Dittmann–Pop's `V_a` | carried from r2 (04296f6); statement untouched |
| 0.1 / 0.3 / 0.4 / 0.5 / 0.6 Checks | `[1, 1] ⊥ ⟨1⟩` over `𝔽₂`; `⟨1, 1⟩_b` over `𝔽₂`; `⟨c⟩_b ⊗ [1, a]`; `⟨1, t⟩_b`; `4⟨1⟩` over `ℝ` | `ℍ ⊥ ⟨1⟩`; `W_b(𝔽₂) = ℤ/2`; `c[1, a] ≅ [c, a/c]`; degrees of different parity; signature `4 ∉ 8ℤ` | all agree with their sections | carried from r2 (04296f6); statement untouched |
| 1.1 Check (generation in characteristic two) | `t[1, 1]` over `𝔽₂(t)` | values of odd `t`-degree, `1` not represented | unscaled one-fold forms do not generate | carried from r2 (04296f6); statement untouched |
| Worked example, `𝔽₂(t^{1/2})` | `dt` | `dt = 2 t^{1/2} d(t^{1/2}) = 0` | `[dt/t]` restricts to `0` | carried from r2 (04296f6); statement untouched |

**Remarks on untouched text** (no change requested). This roadmap's 0.2 compares `extendScalars` with Mathlib's `QuadraticForm.baseChange` when `2` is invertible, and `QuadraticFormsOverABase` §0.2 proves the same comparison for `mapCoeffs` over any ring with `Invertible 2`; the field case of the latter is the former. As the later roadmap, `QuadraticFormsOverABase` is the one to cite this roadmap for the field case; that is its text, not this one's.

## Not verifiable

- `QuadraticFormsOverABase` was read at the head of pull request #1930 (464f81f) through the roadmaps tool; the board holds no package README for it. Its `plan.json` was not available, so I could not check whether the identification with `extendScalars` is planned there as a target.
- `kato82`, `arason75` and `milnor70` are uncertified (paywalled) and cited by locator only, as before; none is touched by the diff.

## Source issues

- none
