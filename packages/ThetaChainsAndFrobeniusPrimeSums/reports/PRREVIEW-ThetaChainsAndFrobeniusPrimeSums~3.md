# Review of ThetaChainsAndFrobeniusPrimeSums (pull request #2924 at f3ac2c8)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaChainsAndFrobeniusPrimeSums/`
**Verdict:** needs changes

**Summary.** Changes are needed, for three findings. (1) The README calls the weight datum fixed in 10.6 adapted in the sense of ThetaChainsOnDefiniteUnitaryGroups §2.3b and says it is the datum built in §2.3a. It is neither: off the tops `u_0(τ)` is about `2Sc`, while §2.3b requires every entry to lie in `[−Sc, Sc]`. So the claim in 10.9 that the construction gives chain data is false as the suppliers define them. (2) The exponent of the letter step is chosen after `ε` (it depends on `c_H`), but the range in ThetaChainsOnDefiniteUnitaryGroups §2.3 and its predicate `SizeSc` fix that exponent before `ε`, and 10.6b asserts both. (3) No claim about what [FormalProof] establishes carries a locator. There are also six small corrections and one format note. The scope, and the status of the formal proof as a source, are left to the human reviewers.

## R01 (P1) — The weight datum of 10.6 is not adapted in the sense of ThetaChainsOnDefiniteUnitaryGroups §2.3b, and it is not the datum of §2.3a, yet 10.6b, 10.6d and 10.9 treat it as both

Chain data must have an adapted weight datum (10.0 (D3)), and 10.9 concludes that the construction gives chain data. With the datum of 10.6 that conclusion fails as the supplier defines adaptedness. Worse, the README claims at this one datum the hypotheses of ThetaChainsOnDefiniteUnitaryGroups §§2.3a–2.3b, of RowTowerAndRallisIdentities §5.8e (o) and of BesselPoincareSeriesAndGramBounds §5.20a, and as those roadmaps are written no single datum satisfies all of them.

Here is the computation. Off the tops, 10.6 (line 966) puts `u_0(τ) = v_0(τ) + 4kΔ_w + ½`, and `v_0(τ) = 4(k − 2)Δ_w`, so `u_0(τ) = Sc + 4(k − 2)Δ_w + ½ > Sc` for `k ≥ 3`. At its head, ThetaChainsOnDefiniteUnitaryGroups §2.3b requires that "at every other place all entries of `u(τ)` lie in `[−Sc, Sc]`". Its §2.3a builds the datum with `u_0(τ) := v_0(τ) + ½`, and RowTowerAndRallisIdentities §5.8e (o) takes "the weight datum … of ThetaChainsOnDefiniteUnitaryGroups §2.3a". Under §2.3b, off the tops `u_0 − v_0 ≤ Sc − 4(k − 2)Δ_w = 8Δ_w < Sc`. So the "cloud gap" that the route of 9.4 (line 485) attributes to §2.3b, "`u_0(τ) − v_0(τ) ≥ Sc` (the cloud gap of ThetaChainsOnDefiniteUnitaryGroups §2.3b", is in fact excluded by §2.3b.

Several other passages repeat the claim:
- The statement of 10.6b (lines 1083–1085) calls the datum "the adapted data of ThetaChainsOnDefiniteUnitaryGroups §§2.3a, 2.3b".
- Its route (lines 1098–1100) says that §2.3a constructs a datum with `u_0(τ) − v_0(τ) = Sc + ½`.
- 10.6d (lines 1173–1174) applies clause (o) of `Size_□` "at the weight datum of 10.6 (ThetaChainsOnDefiniteUnitaryGroups §2.3a)".

The gap itself is needed elsewhere: the route of BesselPoincareSeriesAndGramBounds §5.20a, Lemma (b), uses "Off the top places `a_eff = u_1 − v_0 ≥ 4kΔ_w`". By contrast, 9.4 (c) does not need it: without the gap the factor at `l = 1` is at most `1 + Δ_w`, and `log Δ_w` is negligible against `k`. Downstream bounds that use Lemma (f) of §2.3b (off-top entries at most `Sc + (k − 1)/2`), such as LocalGainOfThetaChains §4.16c (c), survive with `2Sc` in place of `Sc`.

The smallest repair is to say which datum the chain uses. If the gap stays, add a declared gap under "What ThetaChainsOnDefiniteUnitaryGroups must provide":
- widen the off-top window of §2.3b to `[−2Sc, 2Sc]`, with Lemma (f) restated for `2Sc`;
- have §2.3a construct `u_0 = v_0 + Sc + ½`;
- record the same change for RowTowerAndRallisIdentities §5.8e (o);
- then correct the citations at lines 485, 1084, 1098–1100 and 1174.

If instead the datum of §2.3a stays, set `u_0 = v_0 + ½` in 10.6, and drop the use of the gap from the verification of (St) in 10.6b and from 9.4.

## R02 (P2) — The letter step of 10.6 is chosen after `ε`, but ThetaChainsOnDefiniteUnitaryGroups §2.3 and `SizeSc` fix its exponent before `ε`, and the route of 10.6b defends the order with a sentence that `SizeSc` contradicts

`SizeSc` and the range of `Δ_w` are hypotheses wherever they are cited: 9.1 (d), 9.4 (c), 10.2, and ThetaChainsOnDefiniteUnitaryGroups §2.3a, §2.3b (f) and §2.3c. If they are not shown at the parameters of 10.6, the thresholds of those targets are unsupported as stated.

The quantifier order is as follows:
- 10.6 (lines 962–963) sets `Δ_w := ⌈x^{c_Δ}⌉`, with `c_Δ` "chosen after `ε`, the constants and `c_H`".
- 10.6b (lines 1072–1073) lets `c_Δ⁰` depend on `ε` and `c_H`, and 9.6 (b) lets `c_H⁰` depend on `ε`.
- The bound `Δ_w ≥ k^{C}(C·m)³·(x^{c_H}/6)^{C}` recorded in 10.6b forces the exponent of `Δ_w` above `C·c_H`.

On the supplier side:
- ThetaChainsOnDefiniteUnitaryGroups §2.3 says the chain takes "`(k f x^ε)^{C_Δ} ≤ Δ_w ≤ (k f x^ε)^{C_Δ + 1}`, `C_Δ > 4` a constant fixed before `ε`", the range that §2.3a assumes.
- §2.3b defines `SizeSc` as "`Sc ≤ x^{C_S}`, `C_S` a constant fixed before `ε`".

With `Sc = 4kΔ_w ≍ x^{9/2 + 10ε + c_Δ}`, neither holds unless `c_Δ` is bounded independently of `ε`. The README does not show that; it says the exponents behind `c_H⁰` "are not claimed independent of the constants chosen with `ε`" (line 590). Still, 10.6b asserts `SizeSc` and the hypotheses of §2.3a, and its route (line 1097) says "no condition bounds them above by a fixed power of `x`".

There are two ways to repair this:
- show that `c_H⁰`, and hence `c_Δ⁰`, can be fixed before `ε`; or
- declare a gap on ThetaChainsOnDefiniteUnitaryGroups: the range of §2.3 and `SizeSc` are used with `C_Δ` and `C_S` chosen after `c_H` and before the scale, and the thresholds of §2.3a, §2.3b (f) and §2.3c may depend on them.

Either way, replace the sentence at line 1097.

## R03 (P2) — The README says repeatedly what [FormalProof] establishes, but gives no locator for any of it, so none of it can be checked

The Conventions make [FormalProof] "the reference of every *NEW* target" (line 144) and say that "every target states what that proof establishes". 10.6a leaves several clauses unverified on the strength of "[FormalProof] establishes the size conditions of 10.6a–10.6d for one choice of constants" (line 1013). Its constants are recorded as `ε₀ = 1/52`, `C_t = 401`, `c_T = 1/2` and `c_box = 1/400`. The Summary and 10.10 add that [FormalProof] uses the per-translate inequality with exponent `5`.

Without a module or declaration name, a reader cannot confirm any of this. The README cites [FormalProof] 22 times and names no file, module or declaration; the reference gives only a repository URL. The sibling IntegralWeylModulesOfGeneralLinearGroups §3.2 shows that locators can be given, for example "HookBound (`Formalism/PeriodIntegrals/HookBound.lean`)".

For each sentence that says what [FormalProof] establishes, name the declaration and its module, and drop the attribution where none can be named. These sentences are in the Summary (lines 21–22), 10.0 (H5) (line 681), 10.6a (lines 1013–1021), 10.6d (lines 1180–1183), 10.9 (c) (lines 1369–1371) and the route of 10.10 (lines 1459–1461).

## C01 — The Check of 10.1 counts the term at `d` for every pair `(j, τ)` but the inert sum for one pair

The Check (line 727, repeated in the Examples of Layer 10, line 1492) adds `D_ℛ(d)` to the inert sum of a single pair. But `D_ℛ(d)` sums over all `m·|Φ_top|` pairs `(j, τ)`. With `m·|Φ_top| > 1` and `y > d`, the two sides differ by `(m|Φ_top| − 1)·log d·Σ_{i≥1}(a/d^i − w)₊`. Write the term at `d` for one pair, `log d·Σ_{i≥1}(a/d^i − w)₊`; this is FrobeniusRestrictedRieszSums §1.1 (iii) for one `ℛ(a, τ, w)`.

## C02 — `SizeQD` of ThetaChainsOnDefiniteUnitaryGroups §2.1 does not bound `(L′/L)(1, χ_K)`

At its head, ThetaChainsOnDefiniteUnitaryGroups §2.1 defines `SizeQD` as `log q ≥ x^{ε/(6J)}` and `log d ≥ x^{19ε/(100J)}`, and nothing more. The Table of symbols (line 209) and 10.7 (iii) (line 1257) describe it as also bounding `(L′/L)(1, χ_K)`. That bound is a separate clause of (h4) in 10.6; say so in both places.

## C03 — 10.6d gives the symbol `vd` a third meaning and attributes it to GluedTargetAndDivisionInequality §8.20, which defines it differently

10.6d (line 1160) speaks of "the number `vd := log₂ Q` of GluedTargetAndDivisionInequality §8.20". At its head, §8.20 takes `vd` to be the number of `SizeDep` from ThetaChainsOnDefiniteUnitaryGroups §2.1, which it describes as "at least `v_ℓ(f_E)`, hence at least `v_ℓ(Q)`". This README's own Table (line 210) uses `vd` for the largest mean different exponent.

Use a separate symbol for `log₂ Q`, or state the bound for the number that §8.20 uses. The computation of 10.6a, with `v_ℓ(f_E) ≤ n + 2 + log₂ f_ψ`, already proves that bound, so it need not be left "not given here".

## C04 — The docstring of `Suggested.lean` lists carriers as missing that are definable at the pins

Lines 22–24 name the abelian CM host and the Frobenius-restricted Riesz sum with its main term among the carriers that 10.4 lacks. But the `Suggested.lean` of FrobeniusRestrictedRieszSums defines them with real bodies against the same pins (`cyclicHost`, `frobRieszSum`, `frobRieszMain`). What makes 10.4 unstatable is chain data, and the sentence reads correctly with its first clause removed.

## C05 — The coefficient of `ε` in the binding lower bound for `T_O` is `1015.0625`, not `1015`

The factor `1/m` contributes `ε/16`, exactly as it does in the exponent of `n_W`. So the exponent is `352 + 1015.0625ε`, not `352 + 1015ε` as written in the Check of 10.6 (line 1001) and the route of 10.6a (line 1043). The margin `371.6 < 377` and the constraint `c_TO > 352 + 1016ε₀` are unaffected.

## C06 — The description miscounts the declarations of `Suggested.lean`

It lists `cyclicWindowedBound` "and others" among the "5 definitions with real bodies". The file has exactly five definitions and two theorems (`cyclicWindowedBound`, `cyclicWindowedBound_forEveryEpsilon`). It should read "(`PrimitiveDirichletCharacter`, `rieszRemainder`, `cyclicFamily`, `familyWeight`, `HasWindows`)".

## N01 — One supplier citation is missing from the bookkeeping

SelmerLengthBoundsAndLocalLifting §3.25b (2), cited in 10.9 (c) (line 1378), is absent from the *Needs:* line of 10.9, the Dependencies of Layer 10 and the supplier contracts.

## Questions for the author

- BesselPoincareSeriesAndGramBounds §5.20 says "There are absolute constants `C_Δ > 4`, `C_b > 0`, `c_T > 0` with `c_TC_b > 1`", and it defines `c_Θ` through `C_Δ`. 10.6 and the Table choose `c_T ≤ 16` and write `c_Θ` with `C_l` in place of `C_Δ`. Are these constants free choices in §5.20, any values with `C_Δ > 4` and `c_TC_b > 1`? If §5.20 only asserts that they exist, then the choice `c_T ≤ 16` and the identification `C_Δ = C_l` need it to say which values are admissible. I could not settle this because the sibling's wording is existential.
- Did you consider stating the existential form of 10.9 together with 10.7 (b)? In FrobeniusRestrictedRieszSums' carriers it would say: the scales at which some cyclic host data satisfy hypothesis (i) of FrobeniusRestrictedRieszSums §1.9 with `C = 3` have windows of exponent `3/2`. That looks statable at the pins, while 10.4 as stated, quantified over chain data, is not. I left it open because whether that form is a headline is your call.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| 9.1 (a) `c_λ` bounds | `λ⁰ = (1,1,0)`, `(2,1,0)`; IWM §3.2 | `c = 2`, `3/2`; bound base `λ⁰_1 + k` (1-indexed) = IWM's `λ⁰_0 + N` | matches |
| 9.1 (b) slope of `L_𝒸^∨` | index `T^f`, rank `k` over `𝒪_E` | `μ̂ = f log T/(2f·k)`, `μ = log T/k`; dual Schur sign `−|λ|μ(Λ)` | matches |
| 9.1 (c) frame term | trace bound `2fk²rd_E²` | `mean_σ log Σ_a ≤ log(k³rd_E²)`; plus `log k` gives `log(k⁴rd_E²)`; twist `−Σ s_τ log T` | matches IWM §3.4 |
| 9.1 (d) off-top size | 10.6 datum, `u_0 ≈ 2Sc` | `λ⁰_0 ≈ 2Sc`, `|λ⁰| ≤ 2kSc ≤ 3kSc` | holds |
| 9.2 (a)–(c) | ideal `I_u`, sublattice `N_u` | shift `+Σ2ϱ⌊e𝔊⌋`; sublattice `−Σ2ϱ·len/d_u`; rounding `< 2ϱ`/place, `Σ ≤ 2θ(X″)+…`; `τ_N` integer | matches LocalGain §4.16 (i), Glued §7.13 |
| 9.3 formal degree | `U(r)`, `r = 3` | `∏_{a<b}(b − a) = 2 = 0!1!2!` | matches DSC §8.3, ThetaChains §2.8 |
| 9.4 Check `m = 2` | `r = k + 1` | `r(r+1)/2 + k − k(k+1)/2 = m(2k+m−1)/2 = 2k + 1`; `(k!)^f` cancels | holds |
| 9.4 (c) two words | `s_ij ∈ [−¼, ¼]` | drift `≤ 3k/4`, `Σs² ≤ kπ²/96`; inner `≤ e^{2k}`; without gap `≤ (1+Δ_w)k^{1/4}e^{2k}` | holds; gap mis-cited (R01) |
| 9.5 (a) separation and cut | words differing at `l` | `|u_l − u′_l| = Δ_w`; consecutive `≥ 3Δ_w`; cut `u + 2 ≤ −Y ≤ u′ − 2`, length `Δ_w − 4` | matches Bessel §5.18a |
| 9.5 (b) count | `M = ⌈3Γ₀²x^{c_H}⌉` | `log₂M ≤ 1 + log₂3 + 2log₂Γ₀ + c_H log₂x`; `C_W ≥ 4C_Γ/log 2 + 1` | holds |
| 9.6 (a) | SHVB §§5.5–5.7, `ϖ = x^{−c_H}` | `η = 5ϖ + 3√ϑ_T`, `e = 2e_diag ≤ 1/800`, `κ_e = 4`; `μ = 2μ̂` homogeneous | matches the recorded form |
| 10.1 (b) | FRRS §1.1 (iv) | inert odd powers weight `2`; `d`, all powers, weight `1` | matches; Check mis-scoped (C01) |
| 10.2 short orbits | `p ≡ ±1 mod 2^{n+2}/J′` | `Σ log p/p ≲ 16x^{11ε/12−2} ≤ 1/x` | holds |
| 10.2 prime `d` | `d ≥ x²` | `2x log d/d ≤ 4 log x/x ≤ 1` | holds |
| 10.3 identity | expand `ph`, `log Ω` | LHS − RHS `= 0`; `+a log(rd_E/2π)` cancels per lift | exact |
| 10.4 ledger | Glued §8.22, §8.23 (a) | division line identical; `F_tot`, `mA_top log(g₀g₁)` cancel; `u log(1+H/u)` increasing | holds |
| 10.5 budget | `e_D = 1`, `200Q ≤ y` | `𝔈₁..₇ ≤ C x^εℰ + 17(1+C)yℰ`; `𝔈₈ ≤ 120Qy²ℰ`; total `≤ (y²/200 + 3y³/4)ℰ ≤ y³ℰ` | holds |
| 10.6 Check | `ε₀ = 1/52`, `C_l = 40`, `c_T = 16` | `T_O` exp `352 + 1015.0625ε < 371.6`; `n_W` exp `21.5 + 58.0625ε`; `t ≤ x^{399.62}`; `C_lc_Θ⁰ = 75` | holds; C05 |
| 10.6a margins | SizeW, SizeK, SizeDep | `≥ x^{21ε/16}/64`; `≥ x^{5ε}/2`; `log(2f_ψ)(5log x + log₂f_ψ + 4) ≤ 11x^ε` | holds |
| 10.6b datum | off-top `u_0 = v_0 + Sc + ½` | `u_0 = Sc + 4(k−2)Δ_w + ½ > Sc`; §2.3b needs `≤ Sc` | fails (R01) |
| 10.6b exponents | `c_Δ ≥ c_Δ⁰(ε, c_H)` | `Sc ≍ x^{9/2+10ε+c_Δ}` vs `x^{C_S}`, `C_S` fixed before `ε` | unsupported (R02) |
| 10.6d `f² ≤ rd_E` | `rd_E ≥ d^{1/2}` | `log d ≥ x^{19ε/(100J)}` gives `d^{1/2} ≥ 16x^{2A_n}` | holds |
| 10.7 Check pairs | `(19, 526679)`, `(3, 71)` | `526679` prime, `≡ 7 (16)`; `d+1 = 2³3²·5·7·11·19`; `(−d/p) = 1`, `p ≤ 13`; `v₂(72) = 3` | holds |
| 10.7 (a) `L′/L` bound | `c_box = 1/400`; general | `200ε < 4` for `ε < 1/50`; `2.25(ε/5)/c_box < 4` as `c_box ≥ ε₀/8` | holds |
| 10.7 (b) windows | UWKB §7.6 | `[Y′, Y′^{3/2}] ⊂ [Y′, Y′²]`; `x ≤ X^{3/4}` so `Y₀ ≥ x^{1/J}`; `v₂(q+1) = 2`, `v₂(d+1) = 3` | holds |
| 10.8 (a), (b) | `e_diag < 1`, `T ≥ 3` | `‖K−1‖² = d^{all} > e_diag·d^{all}`; `d_u(T−1)^f = d^{all}(T−2)^f > 0` | holds |
| 10.10 weights | `o = 4`, `ω₀ = 3/4` | `ν(A₀) = 4/13`, others `3/13`, sum `1`; `ν̂(χ≠1) = 1/13 = familyWeight` | holds |
| 10.10 exponent | FRRS §1.9, `C = 3`, `C′ = 4` | `(3+4)ε ≤ 9ε`; recorded [FormalProof] count `5+3+1 = 9` | holds |
| 10.11 | `ε′ = min(ε₁/2, ε/10)` | `9ε′ ≤ 0.9ε`; `y^{1/2+9ε′} ≤ y^{1/2+ε}` on `[1, ∞)`; weights `1`, `1/(3o+1)` | holds |
| Lean 10.10/10.11 | `ψ = 1`; `ψ` of order 4 mod 5 | family `{1}`, weight `1`; four members, weights `1, 1/13, 1/13, 1/13`; types = README | matches |
| Lean `rieszRemainder` | Perron residues | `Σ ≈ −yL′/L(1,χ) + Σ_ρ y^ρ/(ρ(1−ρ))`; `G_1`: `y log y − (1+γ)y` | normalisation right; = RHSC §8.4a |
| Conventions `log Ω` | `K = ℚ(i)` | both sides `4logΓ(¼) − 2log2 − 2logπ ≈ 1.4763`; `L′/L(1,χ₋₄) ≈ 0.2456` | holds |
| Conventions slopes | `𝒪^n`; `λ = (2, 0)` | `μ = 0`; `μ(Δ_ℤ) = −(log 2)/3` (IWM Check) | holds |

- Source locators: [Announcement] read in full (4 pages); [FormalProof] has no locator, and its only readable copy is a kernel export, so 0 claims about it were checked; the classical references carry no theorem or page locators.
- Cross-roadmap citations: every section id cited from 24 sibling roadmaps resolves to a heading at its open head (scripted); I read the text of about 45 cited sections: FRRS 0.4, 0.5, 0.7, 1.1, 1.7–1.9; LocalGain 4.9e–4.9f, 4.16, 4.16c, 4.17–4.17d; Glued 7.13, 8.20, 8.22–8.24; ThetaChains 2.1, 2.3, 2.3a–2.3c, 2.8, 3.8; SHVB 5.5–5.7; IWM 3.2–3.4; Bessel 5.18a, 5.20, 5.20a; UWKB 7.6; QTS 2.7c (′); RHSC 8.4a, 10.3; PDS 6.9; GRHFWB 4.2; ArithVol 8.18f (c), 8.19a; RowTower 5.8a, 5.8e; Congruence 7.16a.
- Roadmaps on main resolved: AnalyticNumberTheoryPartI §0.11, ExplicitPrimeCounting §§0.2, 4.2, GeometryOfNumbersAndQuadraticArithmetic §4.4.13, AdelicAlgebraicGroups §2.4, AutomorphicFormsOnReductiveGroups §2.4, ClassicalGroups §5.1, ClassFieldTheory §13.1 (with both declaration names), NumberFieldArithmetic §5.10.
- Library declarations opened at the pin: `Mathlib/NumberTheory/Chebyshev.lean:191` (`theta_le_log4_mul_x`), `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:313` (`primitiveCharacter_isPrimitive`), `Mathlib/NumberTheory/Harmonic/EulerMascheroni.lean:131`, `Mathlib/NumberTheory/LSeries/Nonvanishing.lean`; `TauCeti/NumberTheory/Height/Arakelov/` has heights of vectors and subspaces but no slopes of Hermitian lattices (the docstring's claim holds); no library match for the five definitions.
- Dependency check: `depcheck: 171 roadmaps, 1994 edges, 0 problem(s)`; every family supplier precedes this roadmap in the family index, and GeneralizedRiemannHypothesisFromWindowBounds appears only as a consumer.
- Elaboration: `lake env lean` on `Suggested.lean` gives two `sorry` warnings only; `#check @` of the 7 declarations matches the README; there are no section variables; the one-tactic probe `simp [HasWindows]` leaves both theorems open.
- Overlap check: read GluedTargetAndDivisionInequality, ThetaChainsOnDefiniteUnitaryGroups, LocalGainOfThetaChains, CongruenceModulesOfThetaLifts and BesselPoincareSeriesAndGramBounds (open; no roadmap on main is listed as close). Nothing is shared: each names this roadmap as the owner of Layers 9–10 and the consumer of its cited sections. The word code is defined in ThetaChains §2.3 and its count in 9.5; the formal-degree formula is DiscreteSeriesCoefficientsAndAutomorphicMetrics §8.3, of which 9.3 is a stated instance.
- Source independence: 6 passages compared (Summary, the Conventions on routes, the Check of 10.4, "Why `m ≈ √x`", the head of 10.6a, the route of 10.10) with 1 readable source ([Announcement]); no shared run of five or more words except its URL; largest share [FormalProof], 22 of the 22 attributions to a named source (the other references are not located); contents compared with [FormalProof]: not possible (no readable text or table of contents).
- Research link: Layers 9–10 are the last steps of Alpöge's announced formal proof (2026) of the Riemann hypothesis for Dirichlet L-functions. They assemble Bost's slope inequality (1996), the Chowla–Selberg formula (1967), the Gan–Hanke–Yu mass formula (2001), Harish-Chandra's formal degrees (1966) and Banaszczyk's transference (1993). This rests on the README's Summary and References and on [Announcement] pp. 3–4.

## Not verifiable

- [FormalProof]: the sources service does not classify the host of the README's URL. The operator's local copy is a compressed kernel export (no source text, 2.7 million constants), and the README names no declaration to search for, so no claim about [FormalProof] was checked.
- Harish-Chandra (1966), Bost (1996), Gan–Hanke–Yu (2001), Banaszczyk (1993), Chowla–Selberg (1967), Linnik (1944) and the other works of the References are cited without a theorem or page locator, only as provenance of *KNOWN* ingredients, so there was nothing to check at a locator.

Automatic checks set aside as false positives: the rule that a pull request changes nothing outside its roadmap folder, which keeps it from editing other roadmaps, flagged the three files of the family index, but this pull request carries that index as its own; and the rule that a roadmap is listed in the merge order after its suppliers, which keeps supply flowing one way, reported this roadmap as not yet listed, which is no defect before its design is placed. A second run of the same checks passed both.

## Source issues

- none

## For the human reviewers

- Scope: the only provenance of the *NEW* targets is [FormalProof], an unrefereed Lean formalization announced on 20 November 2026 ([Announcement], p. 2, says only Lean is presented). No refereed source states 9.6, 10.4, 10.10 or 10.11; their consequence is the generalized Riemann hypothesis for Dirichlet L-functions.
- Licence: the README's [FormalProof] URL is on a host the sources service does not classify. The announcement's own footnote (p. 1) points instead to tarball parts on the author's domain. The locally held copy is a kernel export without source text.
- Not tested: [FormalProof], the source with the largest share of the attributions, has no readable text or table of contents, so wording and arrangement were not checked against it.
