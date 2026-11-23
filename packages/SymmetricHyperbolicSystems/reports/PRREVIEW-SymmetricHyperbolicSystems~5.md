# Review of SymmetricHyperbolicSystems (pull request #2246 at 3c07b5d)

**Verdict:** accepted

**Summary.** Accepted: every statement of the README and of `Suggested.lean` was recomputed on degenerate and worked instances and none is false, and the one finding of the previous review (the description's Layer 7 line) is repaired. There are four small corrections (a time node just beyond `T + 1` in §6.1, a Tau Ceti lemma missing from Layer 3's dependency lines, the constant of §7.1 in Lean, an unneeded hypothesis in §2.3) and three format notes, none blocking. For the human reviewers: the texts of John 1982, Lax 2006, Friedrichs 1954 and Rudin 1976 could not be read, so their page and equation locators, and the arrangement against John, are untested.

## C01 — In §6.1 the interpolant at times up to `T + 1` uses one iterate that the bounds of §5.2 "with `T` replaced by `T + 1`" do not cover

An implementer who takes the opening of Layer 6 literally (line 619) has the bounds of §5.2 only for `m k ≤ T + 1`. For `t_m ≤ t ≤ T + 1 < t_{m+1}` the interpolant `U_h(t, ·)` of line 625 is built from `u^{m+1}`, and `(m + 1) k` can be as large as `T + 1 + k`. The support radius `R₁ = R + 3 + (T + 1)/μ` already allows for this iterate (it gives `R + (T + 1)/μ + 3h`), so only the range of the bounds is short by one step. Fixing the hypotheses of §5.2 with `T` replaced by `T + 1 + μ` (so that `(m + 1) k ≤ T + 1 + μ` for `h ≤ 1`), or saying that the last iterate is bounded by one more application of §4.2, makes the sentence exact.

## C02 — Layer 3 says "Mathlib only", but the Leibniz rule of §3.1 is routed through a Tau Ceti lemma

The Leibniz bullet of §3.1 (lines 344–347) takes the one-direction iterate from `TauCeti.fwdDiff_iter_smul`, and the supplier contracts list it under "From Tau Ceti" for §3.1; yet the `*Needs:*` line of §3.1 (line 369) names only Mathlib declarations, and Layer 3's Dependencies (line 437) read "Mathlib only". A reader planning the build from the dependency lines misses the Tau Ceti import. Add `TauCeti.fwdDiff_iter_smul` to the `*Needs:*` line of §3.1 and write "Mathlib; Tau Ceti's `TauCeti.fwdDiff_iter_smul`" under Layer 3's Dependencies. (The lemma is at `TauCeti/Algebra/Group/ForwardDiff.lean:102`, over any ring; the coefficient-shifted form claimed in the bullet does follow from it with step `−eᵢ` at `j + αᵢeᵢ`: `Δ_{−e}^n G(j + n e) = (−1)^n Δ_e^n G(j)` turns its sum into `Σ_i (n choose i) Δ^i a(j + (n − i) e) Δ^{n−i} v(j)`.)

## C03 — The Lean form of §7.1 lets the bound depend on the family `A`, while the README states a constant depending only on `m`, `N`, `c`, `Λ`, `C`

README §7.1 (lines 711–712) asserts a bound "by a constant depending on `m`, `N`, `c`, `Λ` and `C`", which is what the compactness proof gives and what the Conventions promise for every estimate. `exists_bound_iteratedFDeriv_sqrt_comp` binds `X`, `A`, `c`, `Lam`, `C` first and then concludes `∃ C'`, so its `C'` may depend on `A` and on `X`. The two agree for §7.2, which needs only boundedness, but the Lean statement is weaker than the prose. Either state the Lean with the quantifiers in the README's order (`∀ N m c Lam C, ∃ C', ∀ X A, …`), or say in §7.1 that the statement in `Suggested.lean` records boundedness only.

## C04 — Continuity of `F` on the closed slab is not needed for the integrated identity or the energy estimate of §2.3

Both statements assume `F` continuous on `[0,T] × ℝⁿ` (README line 263; `hFc` in `integral_dotProduct_A0_sub_eq` and `integral_dotProduct_A0_le`). On the open slab `F = S.apply u`, which is continuous there because `uncurry u` is `C¹` on the closed slab and the coefficients are continuous, and it vanishes for `‖x‖ > R` because `u` does; the values of `F` at `t = 0` and `t = T` do not enter the interval integrals. So `∫₀ᵗ ∫ ⟪F, u⟫` and `∫₀ᵗ ∫ ‖F‖²` are already well defined and the hypothesis can be dropped, which makes both theorems apply to any `F`. If it is kept for readability, a clause saying so would stop a consumer from proving continuity of `F` at the end times for nothing.

## N01 — `Matrix.dotProduct` is not a name at the pinned Mathlib

The `*Needs:*` line of §1.2 (line 179) and the first Mathlib contract (line 826) cite `Matrix.dotProduct`; at the pin the declaration at `Mathlib/Data/Matrix/Mul.lean:76` is `dotProduct`, in the root namespace (`#check @Matrix.dotProduct` fails, `#check @dotProduct` succeeds). Write `dotProduct`. The description's sentence that every cited declaration "was checked by name against the pinned revisions" holds for the others, which were all found at the files and lines given.

## N02 — The letter `N` is the size of the system and also a count in two places

In the second Check of §3.2 (line 389, "the indicator of `{0, …, N−1}` with `N` fixed") and in the Space step of §6.2 (line 648, `N = ⌊s/h⌋`), `N` is a number of grid points, while everywhere else it is the dimension of the unknown. Another letter (`J`, `q`) would avoid the clash.

## N03 — "follows John 1982" in §6.1 and "as in John 1982" in §5.1 read as following a source

Lines 624 and 547 describe the argument as following a source; the locator alone, as at §5.2 and §6.2 ("(John 1982, Ch. 5 §3 (b))"), carries the same information. Also, Métivier's `K` in Lemma 4.2.1 is the negative of the `K` of §2.1 (as the text already says of John's `C`); a word to that effect at line 198 would save a reader the sign check.

## Previous findings

- R01 of the previous review (the description's Layer 7 line described an earlier head) — repaired: the description now reads "7. General A⁰: uniform bounds for the derivatives of the square root of a positive definite matrix-valued function and of its inverse (smoothness from Tau Ceti’s Matrix.contDiffOn_sqrt and Matrix.contDiffOn_rpow), and normalization."
- The change since that head is a reordering only (Scope and ownership, Exact supplier contracts and the build guide moved; 98 lines out, 98 in); no statement and no line of `Suggested.lean` changed.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 `contDiffOn_one_of_hasDerivAt_single` | `f = x₁x₂`; `f = x₁x₂/(x₁²+x₂²)`; `ι` empty | `g = (x₂, x₁)`; partials at `0` both `0`, `f(r,r) = ½`; one-point space trivial | holds; continuity needed | none |
| §1.2 predicate, speed, Checks | `A⁰ = 1`; `A⁰ = 0`; wave `n = 1`; Jordan block; `T < 0`; `M = t x₁σ` | `λ ≤ 1` iff; fails at `e₁`; eigenvalues `±1`; `A⁰A¹ = [[0,a],[0,b]]` forces `a = 0`; slab empty; `matDx M 0 = tσ` | holds | none |
| §1.2 speed `√n M/λ` | general | `|ξ·ΣωⱼAʲξ| ≤ Σ|ωⱼ| M|ξ|² ≤ √n M|ξ|² ≤ (√n M/λ) ξ·A⁰ξ` | holds | none |
| §2.1 energy identity | general; transport; Jordan block, `u = (1, x)` | `⟪(∂A)u,u⟫ + 2⟪F − Bu,u⟫ = ⟪Ku,u⟫ + 2⟪F,u⟫`; `K = 0`; `1 ≠ 2` | holds; Métivier `K` is `−K` | N03 |
| §2.2 `eq_zero_of_isClassicalSolution_of_cone` | transport `a = 1`, data on `(−2,−1)`, `c < 1` and `c = 1`; `c = 0`; `R ≤ 0`; `n = 0` | `E' = ∫ψ'(c⟪A⁰u,u⟫ + Σ∂ⱼρ⟪Aʲu,u⟫) + …`, first term `≤ 0`; support `(−2+t, −1+t)` meets cone iff `c < 1`; cone empty | holds | none |
| §2.3 uniqueness `eqOn_of_isClassicalSolution` | `M < 0`; `n = 0`; `T < 0` | hypothesis forces `N = 0` or `n = 0`; linear ODE; vacuous | holds | none |
| §2.3 identity and estimate | `B = −β`, `u = e^{βt}u₀`; constants; `u = 1`; Jordan with `χ sin(mx)` | `K = 2β`, `e^{2βt} ≤ e^{(2β+1)t}`; `E' ≤ ((κ+1)/λ)E + ‖F‖²`; junk `0`; growth `tm‖χ‖/√2` | holds; `hFc` unused | C04 |
| §2.3 time reversal | general | `A⁰(−t)∂ₜv − ΣAʲ(−t)∂ⱼv − B(−t)v = −F(−t)`; reversed `K` is `−K(−t)` | holds | none |
| §3.1 parts, Leibniz, restriction bound | `v = w = δ₀`; `a = j•1`, `v = δ₁`; `h ≤ 1` | `−1 = −1`; `h⁻¹ = h⁻¹`, wrong shift gives `0`; `(2R/h + 1)ⁿhⁿ ≤ (2R+1)ⁿ` | holds | C02 |
| §3.2 `dotProduct_self_le_sum_gridNormSq` | `δ₀`, `n = 1, 2`; `n = 0`; indicator block | `1 ≤ h + 2/h`; `1 ≤ h² + 4 + 4/h²`; equality; `Nh → 0` with sup `1` | holds, constant `1` | N02 |
| §3.3 `interp`, `norm_interp_sub_le` | `δ₀` `n = 1`; `j₁j₂`; centre of cell; `n = 0` | hat `max(0, 1 − |x|/h)`, slope `1/h`; `x₁x₂/h²`; `¼`; `0 ≤ 0` | holds | none |
| §4.1 `friedrichsStep`, `friedrichs` | `n = 1` scalar `a`; `μa = 1`; `δ₀` | `½(1−μa)u_{j+1} + ½(1+μa)u_{j−1}`; pure shift; `½(δ₁+δ₋₁)`, norm² `h/2`; `P = 1 + (h²/2n)ΣD₊D₋ − kΣAD₀` | holds | none |
| §4.2 `dotProduct_sum_mulVec_le` | scalars `2, −1`, `v = (1,−1)`; empty `s` | `9 > 1` without positivity; `0 = 1` hypothesis false unless `N = 0` | holds | none |
| §4.2 `sqrt_gridNormSq_friedrichsStep_le` | rotation `A¹`, `h = k = 1`, 8-point `v`; constants | weights sum `1 + Δ(y)`, `⟪Δξ,ξ⟫ ≤ nkL|ξ|²`; `‖v‖² = 8`, `‖Qv‖² = 12 + 4·½ = 14` | holds; symmetry needed | none |
| §5.1 difference identity | constant coefficients; `α = eᵢ` | `R = −BD^αu + D^αF`; `β = α` term is `P^{(α)}`; `D₀D₊^β = ½(1 + τ⁻¹)D₊^{β+eᵢ}`, order `≤ |α|` | holds | none |
| §5.2 uniform bounds | `r = n + 3`; `∂ₜu − x∂ₓu = 0` | `|α| ≤ 3` pointwise; `u^{m+1} − u^m = k((h/2nμ)ΣD₊D₋ − …)`; `∂ₓu(t,0) = eᵗu₀'(0)` | holds | none |
| §6.1 compactness | support of last iterate; `arzela_ascoli` signature | `R + (T+1)/μ + 3h ≤ R₁`; last node at `(m+1)k ≤ T+1+k` | holds after C01 | C01 |
| §6.2 `exists_isClassicalSolution_of_A0_eq_one` | transport `a = μ = 1`; extension to `t < 0` | exact at grid points; `∂ₜ = G`, `∂ᵢ = wᵢ`, both continuous at `t = 0` since `wᵢ(0) = ∂ᵢu₀` | holds | N02 |
| §6.3 `tendsto_friedrichs` | `T < 0`; `T = 0`; arbitrary classical `u` | vacuous; `m = 0`, difference `0`; equals the constructed solution by §2.3 (bounded `Aʲ` from `hbd 0`) | holds | none |
| §7.1 `exists_bound_iteratedFDeriv_sqrt_comp` | `[[2,1],[1,2]]`; `2 + sin x`; `sin²x + ε` | `½[[√3+1, √3−1],…]`; `|derivative| ≤ ½`; second derivative `ε^{−1/2}` at `0` | holds; quantifier order | C03 |
| §7.2 `normalize`, `isClassicalSolution_normalize_iff` | `A⁰ = diag(1,4)`; `A⁰ = e^{2t}`; `A⁰ = λ•1` | `A¹' = diag(1,¼)`; `B' = −1`, `v' − v = e^{−t}F`; `Aʲ/λ`, `B/λ`; `PA⁰P = 1` | holds both directions | none |
| §7.3 `exists_isClassicalSolution` | example of §7.2; cone at `x₀`, radius `‖x₀‖ − R` | supports `[−1+t, 1+t]`, `[−1+t/4, 1+t/4]`; `u(t,x₀) = 0` iff `‖x₀‖ > R + ct` | holds | none |

- Source locators checked against the text: 4 (Métivier, Definition 4.1.1, Lemma 4.2.1, Proposition 4.2.3: its text, lines 21–22, 108–113, 130–133; Courant–Friedrichs–Lewy 1928, Part II §2, pp. 61–62: its text, lines 1196–1258). All four support the statements they are cited for.
- Library declarations opened at the pins: 27 Mathlib (all at the files and lines the contracts give, except the name of N01) and 3 Tau Ceti (`Matrix.contDiffOn_rpow` and `Matrix.contDiffOn_sqrt` at `TauCeti/Analysis/Matrix/Exponential/Log.lean:98,106`, stated on `{P | P.PosDef}`; `TauCeti.fwdDiff_iter_smul` at `TauCeti/Algebra/Group/ForwardDiff.lean:102`).
- Cross-roadmap citations resolved: PDE (on main, Layer 8 is Strichartz estimates) and OneParameterSemigroups (on main); neither is a supplier.
- Automatic checks: all passed. `lake env lean` on `Suggested.lean`: 0 errors, 14 `sorry` warnings, nothing else. Each of the 31 elaborated signatures was compared with its README statement; no section binder is lost. One-tactic probe (`rfl`, `simp`, `infer_instance`) on a copy: none of the 14 theorems closes.
- Dependency check: `depcheck: 133 roadmaps, 1474 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changed outside the folder.
- Headline theorems (existence §6.2 and §7.3, uniqueness and domain of dependence §2.2–§2.3, energy estimate §2.3, convergence §6.3) are all stated in `Suggested.lean`; none is forced through a stand-in.
- Overlap check: read CompressibleEulerEquations (open), PDE (main and its open revision), QuaternionicAnalysis (main), HamiltonJacobiAndConservationLaws and OneStepMethodsForODEs (open); nothing shared. CompressibleEulerEquations cites this roadmap's §1.2, §2.1–§2.3 and §7.3 as the owner of the linear classical theory and states only the Sobolev-class and periodic variants, saying how they differ.
- Source independence: 7 passages compared with 2 sources (Métivier's notes, Courant–Friedrichs–Lewy 1928), none shared; largest share John 1982, 11 of 26 citations; contents not compared with John 1982, whose text and table of contents could not be read.
- Research link: the linear theory of Friedrichs (1954) with the difference scheme of Courant–Friedrichs–Lewy (1928) and Lax; §1.2, §2.1–§2.3 and §7.3 are the linear inputs of the quasilinear theory (Kato, Majda) and are consumed by the open roadmap CompressibleEulerEquations. Rests on the README's references and that roadmap's text.

## Not verifiable

- John 1982, Ch. 5 §3: (3.1a) p. 163, (3.5a)–(3.5b) and (3.6)–(3.8) p. 164, (3.9)–(3.12a) p. 165, (3.20a)–(3.21) pp. 167–168, (3.24) and Problem 3 pp. 169–170, §3 (b) (§1.2, §2.1, §2.3, §3.2, Layer 4, §4.3, §5.1, §5.2, §6.1, §6.2): Springer, paywalled; not in the sources cache.
- Lax 2006: Theorems 4.3, 4.5, 4.6 (pp. 41–45), (8.9)–(8.11), Theorems 8.1 and 8.3 (pp. 84–87), (8.69)–(8.70) (p. 104) (§2.2, §2.3, §4.1, §4.2, §4.3, §6.3): no legal copy in the sources cache.
- Friedrichs 1954: p. 348, §7 Theorem 7 p. 361, §15 pp. 373–374, §19 pp. 381–382 (§1.2, §2.3, Layer 4, §4.2): paywalled; not in the sources cache.
- Rudin 1976, Theorem 9.21, p. 219 (§1.1): no legal copy.
- Of the sampled targets, §2.2, §3.2, §4.1, §5.1, §5.2, §6.1, §6.2 and §6.3 carry locators into these four texts only; their mathematics was recomputed (table above), their page and equation numbers were not checked.

## Source issues

- none

## For the human reviewers

- **Not tested.** John 1982 has the largest share of the README's citations (11 of 26); its text and table of contents could not be read, so wording and arrangement were not compared with it.
- **Not tested.** The page, theorem and equation locators into John 1982, Lax 2006, Friedrichs 1954 and Rudin 1976 were not checked against a text in any round.
- **Licence.** Métivier's Chapter 4 is an unpublished set of lecture notes read from the author's own page (`README.md` line 904); it supports §1.2, §2.1 and §2.3 only alongside published sources.
