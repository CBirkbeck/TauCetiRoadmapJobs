# Review of TaylorBoundsAndDepthsOnHeightTwoFormalGroups (pull request #2914 at 6f00aad)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/TaylorBoundsAndDepthsOnHeightTwoFormalGroups/`
**Verdict:** needs changes

**Summary.** Changes are needed for four P2 findings. First, reading the Gauss norm at radii as Mathlib's `gaussNorm` makes 4.1 (a), (b), (d) and its Agreement Check false for series with unbounded terms. Second, 4.8b′ (1) asserts that every framed point has an integral chart, which fails when `E = ℚ(i)`. Third, the block depth `ν_bl` never says at which level its plans are admissible, so "`ν ≤ ν_bl`" in 4.19f (a) is unsupported on a fixed number of copies. Fourth, no NEW target has a locator into the formal proof that is its only source. There are three small corrections and no format notes. The human reviewers have to decide the standing of a single, unrefereed formal proof as the source of every new target.

## R01 (P2) — Taking `‖f‖_r` to be Mathlib's `gaussNorm` makes "weight `≥ w`" hold for every series with unbounded terms, so 4.1 (a), (b), (d) and the Agreement Check are false as stated

4.1 (line 59) defines `‖f‖_r := MvPowerSeries.gaussNorm |·| (p^{−r_i})_i f`, and "weight `≥ w` at radii `r`" as `‖f‖_r ≤ p^{−w}`. Every later section reads weights this way (4.3, 4.5, 4.5a, 4.19a, 4.19b). At the pin, `gaussNorm` is a real `⨆` (`Mathlib/RingTheory/MvPowerSeries/GaussNorm.lean:58`), and a real supremum of an unbounded family is `0` (`Real.iSup_of_not_bddAbove`, `Mathlib/Algebra/Order/Archimedean/Real/Basic.lean:184`). I checked in Lean that `¬HasGaussNorm v c f` gives `gaussNorm v c f = 0`. So a series whose terms are unbounded at `r` has every weight.

Counterexamples, all in one variable at `r = 0` with `p` odd:
- **(d) fails.** Take `D = T/p`. The terms of `exp(D) − 1` have absolute value `p^{n + v_p(n!)}`, which is unbounded, so `‖exp(D) − 1‖_0 = 0 ≤ p^{−1/(p−1)}`. But `‖D‖_0 = p`.
- **(b) fails.** Take `f = Σ_n p^{−n}T^n` and `g = 1 − T/p`. Then `fg = 1`, so `‖fg‖_0 = 1`, while `‖f‖_0‖g‖_0 = 0`.
- **(a) fails.** Take the same `f` and `a = 0`. Then `‖f(a)‖_0 = 1 > ‖f‖_0 = 0`.
- **The Agreement Check (line 81) fails one way.** Its "exactly when" fails for `exp(T)` at `r = 0`. For the same reason, `exp(T)` does have `‖exp T‖_r ≤ 1` at every smaller radius.

Mathlib's own `gaussNorm_mul_le` (`GaussNorm.lean:138`) carries `HasGaussNorm` hypotheses for this reason.

The smallest repair is in 4.1. Define "weight `≥ w` at radii `r`" coefficientwise: `|coeff_n f|·∏_ip^{−n_ir_i} ≤ p^{−w}` for all `n`. This is the right side of the Agreement Check, and the form "up to `κ`" already uses. Then say that it agrees with `‖f‖_r ≤ p^{−w}` when `f` has a Gauss norm, and state (a), (b), (d) for weights. Alternatively, add the `HasGaussNorm` hypotheses to 4.1 (a), (b), (d).

## R02 (P2) — 4.8b′ (1) is false when the relative trace `𝒪_E → 𝒪_{E⁺}` is not onto, because an integral chart contains a `w₀ ∈ 𝒪_E` with `w₀ + w̄₀ = 1`

In 4.8b (line 477), an integral chart includes "an element `w₀ ∈ 𝒪_E` with `w₀ + w̄₀ = 1`". The same line notes that this exists when the trace is onto. Yet 4.8b′ (1) (line 517) says without hypothesis that "`y` has an integral chart", and 4.8b′ (2) then concludes that the supremum defining `ν_𝔩` runs over all algebraic framed points.

For `E = ℚ(i)`, `Tr(a + bi) = 2a`, so the trace of `ℤ[i]` is `2ℤ` and no `w₀` exists. Framed points do exist there: for example, the curve `y² = x³ − x` with `ℤ[i]`-action at a prime `p ≡ 1 (mod 4)`, a point of signature `(1, 0)`. So (1) fails. The same happens for any CM field in which a prime of `E⁺` above `2` ramifies in `E`.

GluedTargetAndDivisionInequality and ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties both take 4.8b′ as stated.

The repair would be either of two options, whichever the formal proof uses:
- add to 4.8b′ (1) and (2) the hypothesis that the trace `𝒪_E → 𝒪_{E⁺}` is onto;
- let `w₀` lie in `𝒪_E ⊗ ℤ_(p)`, where `w₀ = 1/2` works for odd `p`.

## R03 (P2) — The block depth `ν_bl` does not name the level of its plans, so 4.19c (iv) and "`ν ≤ ν_bl`" in 4.19f (a) are unsupported

4.19 (line 681) defines a plan "*admissible at level `N`*", and then `ν_bl` as "the least value bound over the admissible plans", with no `N`. A plan with levels `< N` needs `n_o·n·N + 2(n + j_t)` copies (4.19c (iv), line 779). There the `N` occurs only in the copy count, and the conclusion compares with the unindexed `ν_bl`.

In 4.19f (a), `ν` is the depth on a fixed number `n_cp` of copies, while the depth only decreases as copies are added (4.8b, Check). If `ν_bl` ranges over all levels, its minimising plan may need more than `n_cp` copies, and nothing gives `ν ≤ ν_bl`. 4.19e (c) has the same gap: there the depth is "on the copies the plan uses".

The repair is to write `ν_bl(N)` for the least value bound over the plans admissible at level `N`, and to use it consistently:
- 4.19c (iv): "an admissible plan at level `N` … at most `ν_bl(N)`";
- 4.19d and 4.19f (a): `ν_bl(i₀)`;
- 4.19e (c): fix the level `N` of the plan.

## R04 (P2) — No NEW target has a locator into [FormalProof], its only source, so none of them can be checked against it

There are 22 NEW markers, and the References (line 1033) say that [FormalProof] "is the reference of every target marked *NEW*". The roadmap gives no file, declaration or statement name in it. Several routes are explicitly incomplete: 4.4a, 4.7, 4.8b′, 4.8c, 4.18 (a), 4.19a steps (1)–(4), most of 4.19e, and 4.19f (g1), (g3). For those, the formal proof is the only support.

The repository is public and readable, but its `src/Formalism` alone lists about 100 directories. The one file I opened (`Formalism/GaussValuationBounds/Statement.lean`) states none of these targets. So no sampled target could be compared with its source: neither its hypotheses nor its generality. The sibling roadmap IntegralWeylModulesOfGeneralLinearGroups §0.1 shows the expected form: it names `Formalism/GradedWeylDivisibility/StatementD.lean` and the declaration.

The repair: after each NEW target, name the file and the declaration of [FormalProof] that proves it, and say where the README's statement is more or less general than the formal one.

## C01 — 4.7 (ii) assumes `c(s) ≤ w_s + c` with a constant `c` that is introduced nowhere

The hypothesis is on line 360. The route of (ii) uses only 4.6 (d1) and (d4), and neither needs this bound. Either define `c`, or drop the hypothesis if the corollary does not need it.

## C02 — The Check of 4.3 lists three torus-invariant monomials of degree 8, but there are five

With `a ≡ 3b (mod 8)` and `a + b = 8`, `x₀⁸` and `x₁⁸` also qualify (line 133). They are excluded from `β` by (B3), so the conclusion about `β` stands. Saying "of positive degree in both letters" would make the list right.

## C03 — The product inequality of 4.1 (b) is Mathlib's `MvPowerSeries.gaussNorm_mul_le`

That lemma is at `Mathlib/RingTheory/MvPowerSeries/GaussNorm.lean:138`, under `HasGaussNorm` hypotheses. The untruncated product clause should cite it under *Needs* and in the Mathlib contract. The truncated form "up to `κ`" remains this roadmap's target.

## Questions for the author

- 4.19f (g1) and (g3) bound `T·ν` with no remaining-degree term, while (a) and (g2) carry `T·R_w^{tot}/(ℓ − 1)`. Can the depth at orbits of types (C) and (O) really be bounded independently of the remaining degree of the weight, on a number of copies that does not grow with it? The routes of (g1) and (g3) are "not given here", and the formal proof has no locator (R04), so I could not check.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| 4.1 (a), (b), (d), Agreement Check | `r = 0`, `p` odd: `D = T/p`; `f = Σp^{−n}T^n`, `g = 1 − T/p` | `‖exp D − 1‖_0 = 0` (junk), `‖D‖_0 = p`; `‖fg‖_0 = 1 > 0 = ‖f‖_0‖g‖_0` | false as stated: R01 |
| 4.1 (e), (f), Checks | `n = 0`; `e = 0, 1, 2`; `κ = (1,1)`, `f = X₁²/p` | `0 ≥ −1`; equality at `T`, `T^{p²}`, strict at `e = 2`; `2/p` at `Y₁Y₂` | true |
| 4.2 | `p = 3`, `|n| = 4`, `v(c) = 0`; `T^{p+1}/p` | `0 ≥ 1/2 − 1/2`; `−1 ≤ −1/(p−1)`, conclusion `≥ 0` fails, as stated | true |
| 4.3 Check | `n′ = 2`, `p = 3`, degrees 4, 8, 12; `E(p, 3)` | bound `1/2 − 1 − 1/2 = −1`; degree 8 also has `x₀⁸`, `x₁⁸`; `E = 1 + p` | C02 |
| 4.4 (i) | `A(x^p, y^p)` termwise; `𝔇G_𝔠`; torus | `= 𝔰p(g₀ℓ − A(y,x))`; `𝔇G_𝔠 = 𝔰σ𝔠·g₀(x)ℓ(y) − 𝔠ℓ(x)g₀(y)` if `σ²𝔠 = 𝔠`; `G_𝔠(ζx,y) = G_𝔠(x,ζ^py)` | true |
| 4.4 (ii), (iii) | rescaled valuations `(i,j) = (0,0), (0,1)`; letters | `1/(p−1) − 1`; `(p³−2p²+3)/(p²−1) ≥ (p+1)/(p²−1)`; `υ_s = 𝔠` (odd), `−𝔰σ𝔠` (even) | true |
| 4.5 headline, one letter | `σ = 1/(p+1)`; `y² = 4x³ − 4x`, `p = 7` | `γ − 1/(p+1) = ρ`; `G₄ = 1/15`, `G₈ = 3/7·G₄²`, `v₇ = −1` | true |
| 4.5a | bi-power, `α ≥ α′`, `e = α − α′` | `e` odd; `p^ασ_z + p^{α′}σ_{h^ez} = p^{α′}(p^eσ_z + σ_{h^ez}) ≥ 1` | true |
| 4.6 (a)–(d) | `n′ = 2`, `p = 3`, `D = (1,1)`, `(1,0)`; `D = (1,δ)`, `E = (0,4δ)` | flow `1/2`, `𝔉 = 1/4 = 2ρ`; `𝔉 = 3/8`; loss `4δ(1 − γ)` with `σ = (0,1)` | true |
| 4.6 (e)–(g), Checks | `n_o = 3`, `p = 5`, `D = (1,0,0)`; `n_o = 1` | `𝔉 = 5/24`; `126x ≤ 1`, `𝔉^{full} = 5/24 − 1/126`; `ρD`; (e) by LP duality | true |
| `Suggested.lean` (4.6 (a)–(c)) | `x = 0` feasible; weak duality; odd `i ≥ n′` | `Σx ≤ Σσ_sD_s`; flow `≤ ΣD/(p+1)`; `i` reduces to `i − n′`, parity kept | true; 27 probes fail |
| 4.7 (ii) | `p = 3` | `2γ ≤ 9/(4p)` iff `p ≥ 3`; `9/4 + 12 ≤ 15`; `c` undefined | C01 |
| 4.8a Check | `ν = (n)`; `ν(0) = (2)`, `ν(1) = (1,1)` | jet `n!(−S)^n`, `c_t = n` both ways; one matched pair `= ν(1)_0` | true |
| 4.8b Checks | ramified `w`; `x_{τ00}x_{τ̄00}` | `Lie_τ = R(X+ϖ)`, index `|2ϖ|^{−1}`; Laplacian `1`; `x_{τ00}x_{τ̄01}` harmonic | true |
| 4.8b′ (1) | `E = ℚ(i)`, CM curve at `p ≡ 1 (4)` | `Tr ℤ[i] = 2ℤ`, so no `w₀`, so no chart | false: R02 |
| 4.8c | `E_w = ℚ_{p²}`, ranks `(1,0)/(0,1)`; ordinary | `S(τ₁) = γ`; `S(τ₂) = ρ` on a rank-0 space; `S = 0` | true |
| 4.18 (b), (c) | columns `(p,1)`, `(1,0)`; alternating ranks | order `(2,1)`, minors `1, 1`; `δ_{i+1} = δ_iμ′`; `S = (pA + B)/(p²−1)` | true |
| 4.19 | definition of `ν_bl`; height-two check | level `N` unbound; `∂_yA(y,x) − ℓ′g₀`: valuation `i − j − 1 ≥ 0` | R03 |
| 4.19a | `ℓ = 3, 5`, `i = 1`; defect | `3·(1/12) = 1/4 < 1`; `5·4/15 = 4/3 ≥ 1`; `(i+3)/2 + (i−1)/2 = i + 1` | true |
| 4.19b | exponent identity; `n₀ = 2`, `h₁ = 0`; step (4) | `ℓ^i/(ℓ−1) − E = (ℓ^i+1)γ − 1`; `(Ly+1)^{−1}ΣC(y,k)/C(Ly,Lk) ≡ y + 1` | true |
| 4.19c | bi-block cost; copies | needs `(L+1)γ ≥ 1`: `ℓ/(ℓ−1)`; `n − n₀ ≤ (i+1)j_t`; `2n + 2j_t` one-side copies | true |
| 4.19d | rounding; `θ₀ = 1` | `n(γΣW − Σy) ≤ 𝔉(nW_θ) + ℓ^{−i₀}nΣW_θ + nγΣ(W − W_θ) + n·#pairs·S_int`; `n ≤ 5j_t` absorbs | true |
| 4.19f, headline 3 | `ℚ(ζ₇)` at `17`; (o); (g2) | `3³ ≡ −1 (7)`, `{1,3,2}` a CM type; `Σn_o = f` | R03; question on (g1), (g3) |
| Headline 1 (4.5) in Lean | docstring | carriers named as missing (letter inverses, torus, `Δβ`, `β_M`) | not statable, correctly named |

- Source locators checked against text: 0. No NEW target has a locator into [FormalProof]; one repository file was opened, and it did not match.
- Library declarations opened at the pin: `MvPowerSeries.gaussNorm` (`GaussNorm.lean:58`), `HasGaussNorm` (`:63`), `gaussNorm_mul_le` (`:138`), `Real.iSup_of_not_bddAbove` (`Algebra/Order/Archimedean/Real/Basic.lean:184`), `MvPowerSeries.subst` (`MvPowerSeries/Substitution.lean:217`), `PowerSeries.exp` (`PowerSeries/Exp.lean:50`), `FormalGroup` (`FormalGroup/Basic.lean:57`), `Algebra.traceForm` (`Trace/Defs.lean:167`).
- Cross-roadmap citations resolved: HodgeTateLatticesAndLubinTateLogarithms §§0.5d, 3.1–3.5, LubinTateFormalModulesAndQuasiCanonicalLifts §4.3 and IntegralWeylModulesOfGeneralLinearGroups §0.1 at their heads; PELModuli M1.3, M1.7, ShimuraCompactifications 6.1 and AbelianSchemesAndArithmeticModuli A2.3 on main. The consumers' citations of this roadmap (LocalGainOfThetaChains, GluedTargetAndDivisionInequality, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, ThetaChainsAndFrobeniusPrimeSums) resolve.
- Dependency check: `depcheck: 171 roadmaps, 1992 edges, 0 problem(s)`. No UPWARD or CYCLE line. Suppliers come before this roadmap in the family order, and consumers after it.
- Gate: the worker's run passed. My rerun failed two checks, both expected (see below).
- Elaboration: `lake env lean` gives only the three `sorry` warnings. The `#check @` types match the README statements (no binder lost). All 27 one-tactic probes (`simp`, `rfl`, `norm_num`, `positivity`, `linarith`, `aesop`, …) fail.
- Duplication: no Mathlib or Tau Ceti statement of the flow programme or of multivariate weight bounds with substitution and `exp`, beyond C03.
- Overlap check: read LocalGainOfThetaChains, HodgeTateLatticesAndLubinTateLogarithms, GluedTargetAndDivisionInequality, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties and ThetaChainsAndFrobeniusPrimeSums. Nothing is shared: each cites this roadmap's §§4.1–4.8c and 4.18–4.19f, which this roadmap owns. 4.8c is an instance of HodgeTateLatticesAndLubinTateLogarithms §0.5d, owned there and cited as such.

Source independence: 0 passages compared with source text. No NEW target carries a locator into [FormalProof], and the classical references (Lubin–Tate, Honda, Hazewinkel, Katz, Mumford, Breen, Mazur–Messing, Cartier, Capelli, Doubilet–Rota–Stein, De Concini–Eisenbud–Procesi) are cited without locators and were not fetched. The largest share is [FormalProof]: 22 of the 22 NEW-marked targets, and no other locator is given. Contents were not compared, because the formal proof has no expository contents to set beside the layer; the layer's order is the one forced by its *Needs* lines (4.1 → 4.2 → 4.3 → 4.4 → 4.5, 4.6 → 4.7, and 4.8b → 4.8c → 4.18 → 4.19 → 4.19a–f).

Research link: the README presents these local bounds as inputs to the formal proof of the Riemann hypothesis for Dirichlet L-functions announced by L. Alpöge (2026). LocalGainOfThetaChains applies them to the gain along chains of theta lifts. Their classical ingredients are Lubin–Tate (1965), Honda (1970), Katz (1981), Mumford (1969) and Mazur–Messing (1974). This rests on the README alone.

## Not verifiable

- The 15 seeded targets (4.2, 4.4, 4.5a, 4.6, 4.8a, 4.8b, 4.8b′, 4.8c, 4.18, 4.19, 4.19a–d, 4.19f) against [FormalProof]: there is no locator. I listed `src/`, `src/Formalism` and `src/Development` of the public repository and opened `Formalism/GaussValuationBounds/Statement.lean`, without a match.
- 4.19f (g1), (g3), and (g4) at orbits of types (O) and (C): the routes are not given, and there is no locator.
- Classical references: cited without locators, so there is nothing to check against.

Automatic checks set aside as false positives: the dependency check's note that this roadmap is not yet in the merge order (a sub-roadmap not yet placed, with no upward edge), and the check that every change stays inside the roadmap's folder (so that a pull request touches nothing it does not own), which listed the three index files of the family folder directly above this roadmap; this pull request carries those files as its own, so the changes to them are not edits outside its scope.

## Source issues

- none

## For the human reviewers

- Scope: every NEW target (22) rests on [FormalProof]. This is a Lean development by one author whose announcement (author's page, `alpo.ge/remark.pdf`) is dated 20 November 2026, one day before this review (README References, line 1033–1034). It is not refereed.
- Not tested: [FormalProof] has the largest share of the sources. Wording and arrangement were not compared with it, because no target locates its statement there.
- Licence: the formal proof repository's licence was not read. Whether `flowProgramme` and `IsDualRadiusVector` in `Suggested.lean` are adapted from it could not be determined.
