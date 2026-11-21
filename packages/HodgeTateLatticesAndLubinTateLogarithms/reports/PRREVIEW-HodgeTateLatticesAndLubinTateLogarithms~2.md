# Review of HodgeTateLatticesAndLubinTateLogarithms (pull request #2904 at 9f0abc7)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HodgeTateLatticesAndLubinTateLogarithms/`
**Verdict:** needs changes

**Summary.** Changes are needed for four findings: the nefness of dominant weights in 0.17a/0.17b and headline 3 is stated without saying which line bundle a weight denotes, and is false under the README's own notation; headline 3's clause at primes ramified in `E` drops the local freeness of the eigen-quotients that 0.17b assumes; the remark after 0.5e makes a false comparison with 0.5f; and almost no target carries a locator, with 0.18a (a)–(b) and 0.5h (4′) supported by neither a source nor a route. The two Lean statements are true as far as I checked (the proof sketch of 0.5b (a) is valid at `p = 2`), and the build and the dependency check are clean. There are four small corrections and two format notes; the human reviewers have to decide on scope, since the new statements rest on a formal proof announced on 20 November 2026, and on the licence of that formalisation.

## R01 (P2) — The nefness of dominant weights in 0.17a (c), 0.17b (d) and headline 3 depends on a sign the README never fixes, and is false under the reading its notation suggests

An implementer of 0.17b (d) cannot tell which line bundle to prove nef, and the obvious choice is not nef. 0.17a (c) (lines 328–332) names the graded pieces `x_{σ,0}, …, x_{σ,N−1}`, those of the sub-flag first, and asserts that "the line bundle of every weight dominant for `GL_N` at each `σ` (non-increasing …) is nef". 0.17b (d) (line 402) and headline 3 (line 9) repeat this. No section defines the line bundle of a weight, and neither does HodgeTateAndCanonicalSubgroups, whose conventions the README imports.

Suppose weight `λ` means the line bundle with `c₁ = Σ_i λ_i x_{σ,i}`. Take `N = 2` (`E = ℚ`, `g = 1`) on the flag variety `P¹ = P(T_σ ⊗ k)` that the route maps to. The dominant weight `(1, 0)` then gives the tautological sub-line `O(−1)`, which is not nef. So the route's step "dominant weights for `GL_N` give nef line bundles on its flag variety" fails. On `S` this line bundle is `Lie^{HT}_R ⊗ μ_p(Ω)`, which has negative degree on the exceptional curves of the normalised blow-up in the first Check of 0.17a (there `ω^{HT}_R = 𝓘O_{X′}·g^*ω`, with `𝓘O_{X′}` relatively ample). With `c₁ = −Σ_i λ_i x_{σ,i}` the statement holds. That is the convention of the consumer ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (its Conventions: `c₁(L_λ) = −Σ_{τ,i} λ_{τ,i} x_{τ,i}`).

Smallest repair: state in 0.17b (d), and refer to it from 0.17a (c) and headline 3, that the line bundle of weight `λ` is `⊗_i gr_i^{⊗(−λ_i)}`, so `c₁ = −Σ_i λ_i x_{σ,i}`. Add the Check: for `N = 2`, `E = ℚ`, the weight `(1, 0)` gives `ω^{HT}_R ⊗ O_S`, which is nef, while `Lie^{HT}_R ⊗ O_S` is not.

## R02 (P2) — Headline 3's clause at primes ramified in `E` omits a hypothesis that 0.17b needs

A reader of the summary will take local freeness of `ω^{HT}_R` to be enough at ramified primes, and no target of the roadmap says that. Headline 3 (line 9) assumes only `R ≥ 2`, a principal polarisation and `ω^{HT}_R` locally free near the special fibre, then says: "At primes ramified in `E` the same holds with a twist by the different (0.17b)". But 0.17b (line 390) also assumes that all eigen-quotients `ω^{HT}_{R,σ}` are locally free at the points over `ℓ`. The README itself treats this as an extra condition: 0.5c (b) (line 201) modifies the model separately for the eigen-quotients. The condition holds automatically only where `ℓ` is unramified in `E` (0.5a (b)).

Smallest repair: "At primes ramified in `E`, if moreover the eigen-quotients `ω^{HT}_{R,σ}` are locally free near the fibre (as on the model of 0.5c (b)), the same holds with a twist by the different (0.17b)."

## R03 (P2) — The remark after 0.5e, that its bound improves on 0.5f whenever `r⁻ < r⁺`, is false for wildly ramified `E_w`

GluedTargetAndDivisionInequality §8.20a uses 0.5e alongside 0.5f, and a reader who trusts the remark would pick the 0.5e bound even where it is the weaker one. Line 243 says: "For `r⁻ < r⁺` this improves the bound `n·r⁺/(p − 1)` that 0.5f gives". The bound of 0.5e, `n·r⁻·(1/(p − 1) + vd/2)`, lies below `n·r⁺/(p − 1)` only when `vd < 2(r⁺ − r⁻)/(r⁻(p − 1))`.

Counterexample: take `p = 3`, `E_w = ℚ_3(ζ_9)` (`n = 6`, `v_3(disc) = 9`, so `vd = 3/2`), `r⁺ = 2` and `r⁻ = 1`. This occurs at a place `w ≠ w̄` of the CM field `ℚ(ζ_9, √−2)`, because `3` splits in `ℚ(√−2)` and complex conjugation swaps the two primes above `3`. Then 0.5e gives `6·(1/2 + 3/4) = 7.5`, while 0.5f gives `6·2/2 = 6`.

Smallest repair: "When `r⁻·(1/(p − 1) + vd/2) < r⁺/(p − 1)`, for instance when `r⁻ < r⁺` and `E_w/ℚ_p` is unramified, this improves the bound `n·r⁺/(p − 1)` that 0.5f gives".

## R04 (P2) — Almost no target cites a source, and 0.18a (a)–(b) and 0.5h (4′) are supported by neither a source nor a route

An implementer who finds one of these targets false, or cannot prove it, has nothing to check it against. This also falls short of the rule that every statement carries an exact locator into a legal source.

Among the targets of Layers 0, 2 and 3, only 3.2 has a locator (Hazewinkel I.2, II.10, §2.2). [FormalProof] is credited only for steps (i)–(iii) of 0.5b and for the modules of 2.4, with no file or declaration named. The Checks cite Katz–Mazur and Schneider–Teitelbaum without locators. Where the route also stops, the statement has no support at all:

- 0.18a (line 434) gives a route for (c) and (d) only, then says "The remaining steps of the route are not given here". So (a) and (b) have nothing: the finite flat model `𝔊_n`, its uniqueness, and the `p`-divisible group `𝔊`.
- 0.5h (line 301) says "The route of (4′) is not given here".
- 0.5d (line 226) and 0.5e (line 245) list the steps their routes leave out.

Smallest repair: give each target a locator. Where a published theorem exists, cite it; for example, the Lubin–Tate value in the third Check of 0.5d is Schneider–Teitelbaum, Appendix, Theorem (c), with `e = 1` and `q = p^h`. Otherwise cite the file or declaration of [FormalProof] that proves the target. For 0.18a (a)–(b) and 0.5h (4′), one of these, or a route, is needed before the statement counts as supported.

## C01 — In 3.1, "it is also a right inverse" should say left inverse

At line 498, `λ_x(g) = T_x` already makes `g` a right inverse of `λ`. The other identity, `g_x(λ) = T_x`, which the Lean statement asserts (`MvPowerSeries.subst (twistedLog K p ς q) (g x) = MvPowerSeries.X x`), is the left-inverse property. Write "it is also a left inverse: `g_x(λ) = T_x`".

## C02 — The route of 2.4 (a) rests on a functor nobody owns, for a fact the supplier already states

The paragraph "The composite is zero" (line 472) derives `α_G∘(α_{G^D})^∨ = 0` from an additive functor `M` whose existence is "not proved here". HodgeTateAndCanonicalSubgroups §2.4 states this vanishing integrally, and the exactness over `C`, with no restriction on `p`. The README's own supplier contract for §0.5 (line 683) records the same. Citing §2.4 there removes the unowned input; alternatively, name an owner for the modules over `A_inf`.

## C03 — The Lean docstring says Tau Ceti has finite flat group schemes only over an affine base

Lines 17–19 of `Suggested.lean` say that Tau Ceti has "finite flat commutative group schemes over an affine base … and nothing over a general normal base". The pinned Tau Ceti has `TauCeti.AlgebraicGeometry.FiniteFlatCommGroupScheme S` over any scheme `S` (TauCeti/AlgebraicGeometry/GroupScheme/FiniteFlat.lean, line 58). The conclusion still holds, because semi-abelian schemes and the quasi-finite `G[p^R]` are absent. Would read: "finite flat commutative group schemes over any base, … but no semi-abelian schemes and no quasi-finite torsion `G[p^R]`".

## C04 — The description says that sub-roadmaps of the family merge first, but this roadmap has no supplier in the family

The description says: "Sub-roadmaps of the family and other roadmaps that are still in open pull requests merge first." The README's suppliers are HodgeTateAndCanonicalSubgroups, LubinTateFormalModulesAndQuasiCanonicalLifts (both open) and roadmaps on main. The family roadmaps TaylorBoundsAndDepthsOnHeightTwoFormalGroups, LocalGainOfThetaChains, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties and GluedTargetAndDivisionInequality consume it (Downstream consumers), so they merge after it. Right text: "Its suppliers still in open pull requests, HodgeTateAndCanonicalSubgroups and LubinTateFormalModulesAndQuasiCanonicalLifts, merge first; the family roadmaps that use it merge after it."

## N01 — Layers 0 and 2 depend on each other

Layer 0's Dependencies (line 458) include 2.4 of Layer 2, which 0.5g, 0.17b and 0.18a need, and Layer 2's (line 488) include 0.5b of Layer 0. The item order given at line 458 has no cycle; it is only the layers, numbered after HodgeTateAndCanonicalSubgroups, that are out of build order. One option is to move 2.4 into Layer 0 after 0.5b; another is to put the targets that use it in a layer after Layer 2.

## N02 — Capitals for emphasis

"IMAGE", "NOT" and "TRIVIAL" (lines 61, 358, 364, 370) would read better in italics.

## Questions for the author

- [FormalProof] gives `github.com/leanprover-community/riemann-hypothesis`, but the announcement's footnote (Announcement line 53) points to archives on the author's own page. Are these the same development? Which of its files prove 0.5d, 0.5e, 0.18a and 0.5h (4′)? I could not open the repository from a legal source here, so I could not check.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| 0.5b (a), finite level | `H = μ_{p^n}`, `𝒜 = O_C[T]/(T^{p^n}−1)` | `ω_H = O_C/p^n` generated by class of `T − 1` (group-like `T`); span is all; `κ = 1` works | holds |
| 0.5b (a) at `p = 2` | Oort–Tate `O_C[X]/(X²−aX)`, `ab = 2` | group-likes `1, 1−bX`; span `b·ω`, `ω = O_C/a`; cokernel `O_C/(a,b)`, killed by `κ = 2` | holds |
| 0.5b route (i)–(iii) | `p = 2`, `|c| < |2|` | `v_2(m!) ≤ m−1`; `t(m) ≤ K(|c|/|2|)^m → 0`; `‖e^l/l!‖ < 1`; last-maximiser contradiction uses no property of `p` | valid at every `p` |
| 0.5b Lean vs supplier | `farguesHodgeTateCokernel_finite` of HodgeTateAndCanonicalSubgroups | same binders except `p ≠ 2` dropped here | strict generalisation, cited |
| 0.5a (a), `κ₀` | height-one `𝔭 ∋ p` | `v_𝔭(ζ_p−1) = v_𝔭(p)/(p−1)`; qualifying `κ` ⇔ `κ ∈ κ₀O` by normality | holds |
| 0.5a (b) discriminant | `E = ℚ(i)`, `p = 2` | `det[[1,i],[1,−i]] = −2i`, square `−4 = disc` | matches text |
| 0.5c (b) generic fibre | `ℓ` invertible | `ω^{HT} = ω`; eigen-quotients are summands since `disc(E)` invertible | iso there, holds |
| 0.5d Check, height 2, `ℤ_{p²}` | `r = (1,0)`, conjugates `(0,1)` | `S(τ_0) = 1/p + 1/p³ + … = p/(p²−1)`; (b): `x(τ_0) = 1/(p−1) − 1/(p²−1) = p/(p²−1)` | consistent |
| 0.5d route product | same | `X(τ_0)X(τ_1) = |p|^{1/(p²−1)+p/(p²−1)} = |p|^{1/(p−1)} = |c_p|^g` | consistent |
| 0.5d Check, Lubin–Tate height `h` | `w ≠ w̄`, `r(τ∘c) = 1 − r(τ)` | `S = Σ_{m≢0 (h)} p^{−m} = 1/(p−1) − 1/(p^h−1)`; ST Appendix Thm (c): `1/(p−1) − 1/(e(q−1))`, `e=1`, `q=p^h` | agrees |
| 0.5e remark | `p=3`, `E_w=ℚ_3(ζ_9)`, `vd=3/2`, `r⁺=2`, `r⁻=1` | 0.5e: `6·(1/2+3/4) = 7.5`; 0.5f: `6·2/2 = 6` | false → R03 |
| 0.5e Check 3 | ramified quadratic, odd `p`, `r⁻ = 0` | `n = 2`, `vd = 1/2`, bound `2·0·(…) = 0` | holds |
| 0.5g (c) | ordinary elliptic curve, `Π = [[0,1],[c,κ]]` | `𝔟ᵀ𝔥 − 𝔥ᵀ𝔟 = c[[0,1],[−1,0]] = cE` for every `κ`; `det Π = −c`; `p = 2`: `c = −2` | holds |
| 0.5h (2), (3) | same | row span `(c) ⊕ O`, length `v(c) = g·v(c)`; `𝔄^∨ ∩ ker 𝔥 = c^{−1}O ⊕ 0 = c^{−1}E^{−T}𝔥ᵀ(O)` | holds |
| 0.5h (4) | `μ_p` discriminant | `v(disc) = p = |H|·len(ω)`; `(p−1)·g·v(c) = g = len(ω_{A[p]})` | consistent |
| 0.17a (c), 0.17b (d) nefness | `N = 2`, flag variety `P¹` | `c₁ = +Σλx`: `(1,0)` ↦ `O(−1)`, not nef; `c₁ = −Σλx`: `O(1)`, nef | sign unstated → R01 |
| 0.17a Check, primitive lines | `(ℤ/p^R)²` | `(p^{2R} − p^{2R−2})/(p^R − p^{R−1}) = p^{R−1}(p+1)` | holds |
| 0.17b (a) ranks | `E = ℚ`; Hilbert–Blumenthal (`c = id`) | `g + g = 2g = N`; `rk = N/2` each | holds |
| 0.17b Check 2 | quadratic ramified, `N = 1` | eigen-sublattice generated by `x − σ̄α`, image `(σα − σ̄α)B = 𝔡_σB` | holds |
| Headline 3, ramified clause | compared with 0.17b | headline: `ω^{HT}_R` locally free only; 0.17b: plus all `ω^{HT}_{R,σ}` locally free | overclaim → R02 |
| 0.18a Checks, Tate curve over `O_C` | extensions of `ℤ/p^n` by `μ_{p^n}` | classified by `O_C^×/(O_C^×)^{p^n} = 1`, so `𝔊 ≅ μ_{p^∞} × ℚ_p/ℤ_p`; kernel `ℤ_p(1)⊗O_C`, rank `1 = g` | holds |
| 2.4 (a) examples | `μ_{p^∞}`, `ℚ_p/ℤ_p` | kernels: all (rank `1 = dim`), `0` (rank `0 = dim`); annihilator of `0` is everything | holds |
| 2.4 (b) | `λ` bijective, `B_λ` alternating | `f = (λ^D)^*∘α_G`, so `ker f = ker α_G = (ker f)^⊥`; `ht = 2 dim` | holds |
| 3.1 sharpness | `S = {x}`, `ς = id`, `q = p²` | coefficient of `T^{p²}` in `g` is `−1/p`; `v = −1 = −(p²−1)/(p²−1)` | attained |
| 3.1 bound, induction | degree `N`, term `e` | `≥ −(N−1)/(q−1) + (q^e−1)/(q−1) − e`, and `(q^e−1)/(q−1) ≥ e` | holds |
| 3.1 Lean, `twistedLog` | `p = 3`, `q = 2`, `S = Unit`, monomial `T²` | elaborated `example`: coefficient `3⁻¹`; `simp` probe closes neither theorem; `HasSubst` holds (constant terms 0, `S` finite) | true, not padding |
| 3.2 (c) | `λ_s` with `ς: s ↦ s−2` | `λ_s − p^{−1}λ_{s−2}(X^{p²}) = T_s`; combination minus twist `= Σ_{s even}σ^s(c)(L_s − p^{−1}L^{σ²}_{s−2}(X^{p²}))` | holds |
| 3.3 Checks | `Ψ = X`; Artin–Hasse | `X^p − pX ∉ pO[[X]]`; `Ψ(X^p) − pΨ = −pX`; `v_p(p^k/k!) ≥ 1` gives the criterion | holds |
| 3.4 (e) | `π^{p²−1} = p` | `v_p(π^{p^{2j}−1}/p^j) = 0, 0, p²−1` for `j = 0, 1, 2`; `Σ(−s)^l t^{p^{2l}}` inverts `t + st^{p²}` mod `p` | holds |
| 3.4 Checks | `g₀`; `s = −1` | `T^p`-coefficient `1/p` vs `0` in `ℓ_s`; `ℓ_{−1}(εY) = εℓ_1(Y)` from `ε^{p^{2j}} = (−1)^jε` | holds |
| 3.5 Check | `d = 2` | `λ_0 = Σ T_0^{p^{2e}}/p^e = ℓ(X)` with `T_0 = X`, `ω = ω* = 1` | holds |
| 3.6 (o) and Check | `α = 2` (unit, `p` odd); `ζ^{p+1} = 1` | `φ([2]x) ≃ 4φ` gives `β₀(x,x) ≃ 2φ(x)`; `δ*δ = ζσ(ζ) = 1` | holds |

- Source locators checked against the text: 2. SchneiderTeitelbaum2001 lines 1230–1234 (Appendix, Theorem (c), arXiv v1 p. 33) and Fargues2010HN line 1284 (§9, Théorème 7, p. 26, `p ≠ 2`, the odd-`p` input of 0.5b through HodgeTateAndCanonicalSubgroups §0.5). 14 of the 15 sampled targets carry no locator.
- Library declarations opened at the pins: `TauCeti.Bialgebra.CotangentSpace` and `TauCeti.Bialgebra.cotangentMap` (TauCeti/Algebra/AlgebraicGroup/Tangent/Cotangent.lean, lines 68, 81); `TauCeti.AlgebraicGeometry.FiniteFlatCommGroupScheme` (TauCeti/AlgebraicGeometry/GroupScheme/FiniteFlat.lean, line 58); Deligne's theorem `pow_eq_one_of_finrank` (TauCeti/AlgebraicGeometry/GroupScheme/KilledByRank.lean, line 121); `MvPowerSeries.gaussNorm` (Mathlib/RingTheory/MvPowerSeries/GaussNorm.lean, line 58); `FormalGroup` (Mathlib/RingTheory/FormalGroup/Basic.lean, line 57, one-dimensional). Neither library has abelian schemes, semi-abelian schemes, `p`-divisible groups, Dwork's lemma or a functional-equation lemma.
- Cross-roadmap citations resolved: HodgeTateAndCanonicalSubgroups §§0.1–0.5, 0.13, 0.17, 0.18, 2.4, 2.5, 5.5–5.7 (head e1c1e91); LubinTateFormalModulesAndQuasiCanonicalLifts §§0.3, 4.1–4.3 (head 02dd5c9); on main FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 and R07.1.24a, ShimuraCompactifications §§7.3, 7.19, NeronModelsAndSemistableAbelianVarieties §§3.3, 3.5, 3.6, NashBlowups §§1.2–1.5, AlgebraicModuliForArithmeticGeometry §1.3, SchemeAndStackFoundations §0.14. All present with the cited subjects.
- Automatic checks: all passed. Dependency check output: `depcheck: 171 roadmaps, 1995 edges, 0 problem(s)`. No change outside the folder other than the family index.
- Elaboration: `lake env lean` on `Suggested.lean` gives only the two `sorry` warnings (lines 63, 99). The elaborated types of the 3 declarations match their README statements and no binder is lost; nothing changed.
- Ownership against open pull requests: searched the open heads and main by object and by name. No other roadmap declares these names or owns these objects.

Overlap check: read TaylorBoundsAndDepthsOnHeightTwoFormalGroups, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties, LocalGainOfThetaChains, HeightsForLogSingularMetrics (open), ShimuraCompactifications, FiniteFlatGroupsAndIntegralPadicHodgeTheory, ArakelovGeometryAndAbelianHeights (main), and the supplier HodgeTateAndCanonicalSubgroups. Shared objects and owners: the finite-level cokernel bound at odd `p` is owned by HodgeTateAndCanonicalSubgroups §0.5 (`farguesHodgeTateCokernel_finite`), and 0.5b states the every-prime generalisation and cites it. The formal-model lattice `ω^mod` at `p ≥ 3` is owned by HodgeTateAndCanonicalSubgroups §5.5, which is a different object from the algebraic `ω^{HT}_R` of 0.5a/0.5c; the README states the comparison. The family consumers cite 0.5a–0.5h, 0.17b, 0.18a, 2.4 and 3.1–3.6 and own none of them.

Source independence: 4 passages compared with 3 sources: the 0.5b route and the 0.5b docstring with Fargues2010HN §9, Théorème 7 and its proof (a different argument, no shared wording); the 0.5d Check with SchneiderTeitelbaum2001, Appendix, Theorem (c) (formula only); the References entry with the Announcement. None share wording. Largest share: Hazewinkel 1978, with all 3 of the README's section locators (all in 3.2). Its text and contents could not be read; it is cited by one subsection of one layer, so the layers cannot map onto a run of its chapters. The Layer 0 numbering follows the roadmap HodgeTateAndCanonicalSubgroups, not a source.

Research link: 0.5b extends Fargues' cokernel bound for the Hodge–Tate map (Fargues 2010–2011, through HodgeTateAndCanonicalSubgroups §0.5) to `p = 2`. 0.5a–0.5c are integral Hodge–Tate lattices of the kind behind Pilloni–Stroh's modified Hodge bundles (HodgeTateAndCanonicalSubgroups §5.5). Layer 3 extends Hazewinkel's functional-equation lemma (1978) to several variables. The family follows Alpöge's formal proof announced in 2026. This rests on the README and on HodgeTateAndCanonicalSubgroups.

## Not verifiable

- Hazewinkel, Formal Groups and Applications, 1978 (the locators of 3.2: I.2, II.10, §2.2): the sources service found no legal copy.
- Katz–Mazur, Arithmetic Moduli of Elliptic Curves, 1985 (the Checks of 0.17a and 0.5c): the sources service found no legal copy.
- [FormalProof] (0.5b steps (i)–(iii), the modules of 2.4): the repository's host is not a legal place the sources service knows. The Announcement (read on the author's page) points to archives on that page, which I did not fetch.

## Source issues

- none

## For the human reviewers

- Scope: the statements new to this roadmap (0.5b at `p = 2`, 0.5d–0.5h, 0.17b, 0.18a, 2.4, 3.1–3.6) rest on [FormalProof], a Lean formalisation announced on 20 November 2026. Announcement lines 45–49 say no written account exists yet. HodgeTateAndCanonicalSubgroups notes that every written proof of the cokernel bound assumes `p ≠ 2`.
- Licence: [FormalProof] is cited at `github.com/leanprover-community/riemann-hypothesis`, whose licence I could not read; Announcement line 53 points to archives on the author's page instead.
- Not tested: Hazewinkel 1978, the source with the most section locators (3, all in 3.2), could not be read, so the wording and arrangement checks were not run against it.
