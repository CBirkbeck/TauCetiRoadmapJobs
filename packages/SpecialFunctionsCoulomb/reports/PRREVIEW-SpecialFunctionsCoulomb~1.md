# Review of SpecialFunctionsCoulomb (pull request #3074 at c554ebc)

**Verdict:** needs changes

**Summary.** Changes are needed: six findings. The mathematics first: 6.2 asks for real analyticity of `h` in `ε` at `ε = 0`, which is false; the continued fraction and Barnett's formulas of 2.2 lack the hypothesis `F_ℓ(η, ρ) ≠ 0`; the limiting form of `F_0` for `η → −∞` in 5.2 is false as an asymptotic equivalence; 4.2 cites an expansion of `G_ℓ` that DLMF 33.9 does not contain; one Check value in 5.2 is wrong; and three results the README calls headlines are statable at the pins but absent from `Suggested.lean`. All 30 statements of `Suggested.lean`, and every correction the roadmap makes to DLMF, were recomputed and hold. There are seven small corrections and two format notes; four points are left for the human reviewers.

## R01 (P1) — `h(ε, ℓ; r)` is not real analytic in `ε` at `ε = 0`, so the prose target of 6.2 that says it is cannot be proved.

In 6.2 (line 526) the README sets as a target that "`h` is real analytic in `ε` in a neighbourhood of `ε = 0` for fixed `r ≠ 0`" and calls this the purpose of `S(ε, r)`. An implementer is asked for a false statement, and the Conventions already list `ε = 0` among the junk values of `coulombEnergyH`.

By the series of 6.4 (recomputed: it reproduces the definition at seven points), `h` is a sum of terms with polynomial coefficients in `ε` minus `(A/2π) g(ε) f`, where `g = 2 ln|2r/κ| + Re ψ(ℓ + 1 + κ) + Re ψ(−ℓ + κ)`. For `ℓ = 0`, `ε > 0`, `κ = iε^{−1/2}`, Stirling's series for `ψ` on the imaginary axis gives `g − 2 ln|2r| ∼ ∑_{k≥1} (−1)^{k+1} B_{2k} ε^k / k = ε/6 + ε²/60 + ε³/126 + …`, whose coefficients grow like `2(2k − 1)!/(2π)^{2k}`: the radius of convergence is zero. A function analytic at `0` has its Taylor series as asymptotic expansion, so `g`, hence `h` wherever `f ≠ 0` (for instance `f(0, 0; 0.5) = J_1(2) = 0.5767`), is not analytic there. Numerically at `ε = 0.3`: `g − 2 ln|2r| = 0.0518284`, and the partial sums are `0.0500, 0.0515, 0.05171, 0.05178, 0.05182, 0.05185, 0.05189, 0.05194`, passing the value and moving away. The cited source says the same: `h` is analytic in `r` and `ε` except at `r = 0` or `ε = 0` (DLMF33 §33.14 lines 386–389), and 33.20.7 gives `h` only an asymptotic expansion in `ε` where 33.20.3 gives `f` a convergent one.

What `S` does achieve is the removal of the poles at `ε = −1/n²`: at `ℓ = 0`, `r = 1.4`, `h → −0.65568733` from both sides of `ε = −1/4`, the value of the series of 6.4 there. The smallest change: "`h` is real analytic in `ε` on `ε < 0`, the factor `S` removing the poles of `Γ(ℓ + 1 − κ)` at `ε = −1/n²`, and on `ε > 0`; as `ε → 0` it has the limit of DLMF 33.20.1–33.20.2 and the asymptotic, not convergent, expansion of DLMF 33.20.7."

## R02 (P2) — The continued fraction for `F′_ℓ/F_ℓ` and Barnett's formulas in 2.2 need the hypothesis `F_ℓ(η, ρ) ≠ 0`.

2.2 (lines 255–261) states `F′_ℓ/F_ℓ = S_{ℓ+1} − R²_{ℓ+1}/(T_{ℓ+1} − ⋯)`, "convergent", for every `ρ > 0`, and Barnett's formulas with `u = F′_ℓ/F_ℓ`. At a zero of `F_ℓ(η, ·)`, and there are infinitely many for every `η` and `ℓ`, the left side is undefined and the fraction diverges. At `η = 0`, `ℓ = 0`, `ρ = π` (`F_0 = sin ρ`) the approximants of depth 5, 10, 20, 40 are `−1.1·10³`, `−2.5·10¹⁰`, `−3.9·10³⁰`, `−2.8·10⁶⁸`. The supplier agrees: Pincherle's theorem in SpecialFunctionsEiLiErfIncompleteGamma 4.1 is stated for a minimal solution `f` with `f(0) ≠ 0`.

Add "and `F_ℓ(η, ρ) ≠ 0`" to the continued fraction and to Barnett's formulas, and the point `η = 0`, `ℓ = 0`, `ρ = π` as a negative-control Check. Away from zeros the statement is right: at `(ℓ, η, ρ) = (1, 0.7, 2.3)` both sides are `0.757107891228786`.

## R03 (P2) — `F_0 ∼ (πρ)^{1/2} J_1((−8ηρ)^{1/2})` as `η → −∞` is false as an asymptotic equivalence.

5.2 (line 470) states this limiting form with `∼`. The right side vanishes along a sequence `η → −∞` where `F_0` does not, so the ratio does not tend to `1`. At `ρ = 0.3` and `η = −113.0340226…` (the fifth zero of `J_1`, `−8ηρ = j²_{1,5}`) the right side is `0` and `F_0 = −6.944·10⁻⁴`; at the eleventh zero, `η = −520.155`, `F_0 = −2.212·10⁻⁴`.

DLMF 33.10.8 states the additive form, and that is what holds: `F_0 − (πρ)^{1/2} J_1` times `|η|^{1/4}` is `2.2·10⁻³`, `−3.9·10⁻⁴`, `−2.0·10⁻⁴` at `η = −80, −320, −1280`. Replace the sentence by `F_0 = (πρ)^{1/2} J_1((−8ηρ)^{1/2}) + o(|η|^{−1/4})`.

## R04 (P2) — 4.2 cites DLMF 33.9.2 for an expansion of `G_ℓ` in spherical Bessel functions; DLMF 33.9 has no such expansion and the README states none.

The last sentence of 4.2 (lines 393–394) reads "The companion expansion of `G_ℓ`, DLMF 33.9.2, with its extra logarithmic part, is stated in prose." DLMF 33.9.2 is the recurrence of the `a_k` (DLMF33 §33.9 line 101), the one the README displays two lines earlier; §33.9(i) contains 33.9.1, 33.9.2 and a convergence remark and nothing about `G_ℓ` (DLMF33 §33.9 lines 44–131). Since the Scope section gives prose targets the standing of the others, this is a target with neither a statement nor a source.

Remove the sentence, or state the expansion with its coefficients and a source that contains it. The expansion of `F_ℓ` itself is right: with the displayed recurrence the sum gives `0.657526749516749` at `(1, 0.7, 2.3)` and `0.735868466687587 = F_0(−1.3, 4.1)`.

## R05 (P2) — The negative control of 5.2 has the wrong value: without the `π/4` the difference at `η = 80` is `+0.7844`, not `−0.786…`.

The Check (line 482) says "without the `π/4` the difference at `η = 80` is `−0.786…`". `σ_0(80) − 80(ln 80 − 1) = 0.7843564913`, that is `π/4 − 0.0010416721`, in agreement with the first Check of the same list. Replace the value by `0.784…`.

## R06 (P2) — Three results the README calls headlines are statable at the pins but are not in `Suggested.lean`.

The README marks the spherical-Bessel expansion (4.2) and the expansion for large `ρ` (5.1) as "a headline without a Lean name", and 2.2 gives the continued fraction. The module docstring explains their absence by coefficient sequences that "the README describes but does not name" and by supplier notions "which this file does not copy". Neither is a missing carrier. All three were written on a copy of the file and elaborate at the pins with `sorry` as the only warning: 4.2 with a three-clause recursive definition of `a_k` shaped like `coulombBesselCoeff` and a `HasSum` over `Complex.sphericalBesselJ (ℓ + k)`; 5.1 as `=O[atTop] ρ^{−N}` for the difference between `coulombHPlus` and the `N`-term sum with `ascPochhammer`; 2.2 as `Tendsto g.convs atTop` for a Mathlib `GenContFract ℝ` with head `S_{ℓ+1}` and partial numerators and denominators `−R²_{ℓ+n+1}`, `T_{ℓ+n+1}`, under `0 < ρ` and `coulombF ℓ η ρ ≠ 0`.

State these three, or say in the docstring for each what makes it not statable. The two logarithmic series (3.2, 6.4) were not tried.

## C01 — The Wronskian of 6.2 excludes more values of `ε` than it needs.

`wronskian_coulombEnergyH_coulombEnergyF` assumes `ε ≠ −1/n²` for every `n ≥ 1` and both signs of `r`. The Conventions say the junk values of `h` are at `n > ℓ` and `r > 0` only, and the computation agrees: `𝒲{h, f}·π/2 = 1.000000` at `(ε, ℓ, r) = (−1/4, 2, ±1.4)` (here `n = 2 ≤ ℓ`) and at `(−1/4, 0, −1.4)` (`r < 0`). The hypothesis would be exact as "not (`r > 0` and `ε = −1/n²` with `n > ℓ`)"; or keep it and say it is a simplification.

## C02 — Four DLMF numbers are off by one.

`F_0(0, ρ) = sin ρ` in the Checks of 1.1 is 33.5.5, not 33.5.4; Barnett's formulas in 2.2 are 33.8.4–33.8.5 (33.8.3 defines `a`, `b`, `c`); the recurrence displayed in 4.2 is 33.9.2, not 33.9.1; and the `δ_k` of 6.4 need the `β_k` of 33.19.7, so "33.19.3–33.19.6" should end at 33.19.7.

## C03 — Tricomi's `U` is owned by QuantumFoundations §9.4, and identifying the local copies with §9.5's functions uses SpecialFunctionsConfluent 2.1.

"SpecialFunctionsConfluent owns `M`, `U` and the Whittaker functions" (Scope, line 747) differs from what that roadmap says at its head: QuantumFoundations §9.4 owns `U`, SpecialFunctionsConfluent owns the bracket form `kummerU` and, in its 2.1, the agreement of the two; Kummer's transformation, which the proof of 1.3 cites as "SpecialFunctionsConfluent, Layer 1", is listed there as an input from SpecialFunctionsParabolicCylinder §§1.2–1.4. Since `coulombHPlus` and `coulombHMinus` are written with `kummerU` while §9.5 defines `H^±_ℓ` with §9.4's `U`, every use of §9.5's results for the local copies passes through SpecialFunctionsConfluent 2.1, which the `*Needs:*` lines of 1.1 and 1.3 do not list. Name the owners and add 2.1.

## C04 — The three Tau Ceti files named under "From Tau Ceti" are not in the pinned Tau Ceti.

The README says Tau Ceti "formalizes three inputs" and names `TauCeti/RingTheory/Polynomial/Laguerre/Basic.lean`, `TauCeti/Analysis/SpecialFunctions/Gamma/Log.lean` and `…/Gamma/ModulusProduct.lean`. At the pinned revision neither `RingTheory/Polynomial/Laguerre` nor `Analysis/SpecialFunctions/Gamma/` exists (there is a single `Gamma.lean`). The description of the pull request says "the latest Tau Ceti (not the pin)"; the README should say the same or drop the paragraph.

## C05 — The large-`η` forms of 5.2 are stated "with `ρ` fixed", which is the hypothesis DLMF withdrew.

DLMF 33.10(ii) and (iii) now read "with `ηρ` fixed", with an erratum saying that "`ρ` fixed" was incorrect (DLMF33 §33.10 lines 149–160 and 322–333). For `η → +∞` the README's regime is supported by its own numbers, which I reproduced (`F_1`/leading term at `ρ = 0.3`: `0.99632`, `0.99798`, `0.99895`, `0.99947` at `η = 80, 320, 1280, 5120`), but not by the citation. Either state the forms for `ηρ` fixed, or say that the `ρ`-fixed regime is this roadmap's own statement and that DLMF's differs.

## C06 — The expansions of 4.3 are Buchholz's expansion of SpecialFunctionsConfluent 6.3 at the Coulomb parameters, which 4.3 does not cite.

SpecialFunctionsConfluent 6.3 plans `𝐌(a, b, z) = e^{z/2} ∑_s A_s (z/2)^s 𝐅(b + s, −(b − 2a)z/2)` for all `a`, `b`, `z` (DLMF 13.11.3). At `a = ℓ + 1 + iη`, `b = 2ℓ + 2`, `z = −2iρ` the argument is `2ηρ` and this is `F_ℓ = C_ℓ (2ℓ + 1)! ρ^{ℓ+1} ∑_s A_s (−iρ)^s 𝐅(2ℓ + 2 + s, 2ηρ)`, with `b_{2ℓ+1+s} = (−i)^s A_s/(2η)^s`: the recurrence of the `A_s` becomes 33.9.5, and `A_2 = ℓ + 1` gives `b_{2ℓ+3} = −(2ℓ + 2)/(8η²)`. Both theorems of 4.3 then follow by substitution, the sign `(−1)^{k+1}` for `η < 0` comes from `t^k` at `t = 2ηρ < 0`, and no separate argument through the differential equation is needed. Citing 6.3 in the proof and the `*Needs:*` line would say so.

## C07 — The large-`ℓ` form of `G_ℓ` in 3.3 is stated for `ρ ≠ 0`, but `G_ℓ` is used for `ρ > 0` only.

"for fixed `η` and `ρ ≠ 0`, … `G_ℓ ∼ ρ^{−ℓ}/((2ℓ + 1)C_ℓ)`" (line 340) contradicts the Conventions, where `G_ℓ` and `H^±_ℓ` are used for `ρ > 0`. Write `ρ > 0` for `G_ℓ`.

## N01 — A pull-request number stands in a heading.

"From SpecialFunctionsConfluent (open PR #1995)" (line 768): name the roadmap only; the number will mean nothing after the merge.

## N02 — Form of `Suggested.lean`.

The section comment "Library declarations consumed" has only `#check` lines under it, and the three proved `example`s (`σ_ℓ(0) = 0`, `A(ε, 0) = 1`, `A^ℓ_{ℓ+1} = 1`) close by `simp` or `rfl` and test nothing a wrong definition would fail.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 core, Checks | `(ℓ,η,ρ)=(1,0.7,2.3)`, `(0,1,1)`, `(1,−1,2)` | `𝒲{G,F}=1`, `𝒲{H⁻,H⁺}=2i`; `F_0(1,1)=0.22752621051056`, `G_1(−1,2)=−0.345746410383545` | holds | C02 (33.5.5) |
| 1.2 `coulombPhase_spec` | `σ_0(0.5)`, `σ_2(−3)`, `σ_0(−20)` | product formula `−0.2440582989`, `−3.2851902667`, `−40.6958766`; equals continuous `Im ln Γ`; phase residual `3·10⁻⁶⁹` | holds | none |
| 1.2 `coulombC_sq`, `coulombC_succ` | `(0,0.8)`, `(2,−1.5)`, `(3,10⁻³)`, `(1,5)` | residuals below `10⁻⁶⁴`; `C_1(1)=0.0511108628=(√2/3)C_0(1)` | holds | none |
| 1.3 Whittaker forms | `(1,0.7,2.3)`, `(0,−1.2,0.4)`, `(3,2.5,7)` | both forms of `F` and the form of `H⁺` agree with the definitions to `10⁻⁶⁴` | holds | C03 |
| 1.4 cross-product | `(0,0.7,2.3)`, `(2,0.7,2.3)`, `(2,−0.9,3.1)`, `(0,0,1.1)` | `0.81923192051904`, `0.973841209741793`, `0.957826285221151`, `1`; equal `(ℓ+1)/((ℓ+1)²+η²)^{1/2}` | holds | none |
| 2.1 recurrence, ladder | same four points, `F,G,H^±` | recurrence residuals below `10⁻⁴⁴`; ladder below `10⁻²⁸` (numerical derivative); wrong sign in `S_L`: `−1.47744400493967` | holds | none |
| 2.2 minimality, continued fraction, Barnett | `(1,0.7,2.3)`; `(0,0,1)`; `(0,0,π)` | CF `0.7571078912=F′/F`; `cot 1=0.6420926159`; at `ρ=π` approximants `−10³…−10⁶⁸`; `G_1=1.2197609881`, `G′_1=−0.5973600042` | false at zeros of `F_ℓ` | R02, C02 |
| 3.1 `hasSum_coulombF` | `(1,0.7,2.3)`, `(0,−1.2,−1.5)`, `ρ=0` | `0.657526749516749`, `−13.5122029357791`, `0`; `A^1_4(0.7)=−0.051` equals the Gauss sum | holds | none |
| 3.2 `tendsto_pow_mul_coulombG`, log series | `ℓ=2,0,1`; `η=0.7,−2,0`; `ρ=10⁻³…10⁻⁸` | ratio `0.99965, 0.9999965, 0.9999999965`; `ℓ=0, η=−2`: `1.0213, 1.0004, 1.0000007`; series gives `1.2197609881 ± 0.6575267495 i` | holds | none |
| 3.3 `η = 0` | `(2,1.7)`, `(0,0.3)`, `(3,−2.2)`, `ρ=0` | `0.265117664379567=1.7𝗃_2`, `G_2=1.74509260862806=−1.7𝗒_2`; `F_3(0,−2.2)=0.1693170044` | holds | C07 |
| 4.1 integrals | `(1,0.7,2.3)`, `(2,−1.1,−0.8)`, `ρ=0`; 33.7.4 | Euler `0.65752675`, `−0.19434503`; Laplace `1.21976099−0.65752675i`; 33.7.4 `1.21976099+0.65752675i` (quadrature, 8 digits) | holds | none |
| 4.2 spherical expansion | `(1,0.7,2.3)`, `(0,−1.3,4.1)` | `0.657526749516749`; `0.735868466687587` both sides | `F` holds; `G` sentence unsupported | R04, R06, C02 |
| 4.3 `I_k`, `J_k` expansions | `(1,0.7,2.3)`, `(0,1.5,4)`; `(0,−0.7,1.2)`, `(3,−1.1,2)`, `(0,−1.5,4)`, `(1,−0.4,5.5)` | corrected sums equal `F`; printed 33.9.4 off by `−0.1105`, `−0.0068`, `2.1549`, `−0.8459` | holds; DLMF wrong | C06 |
| 5.1 expansion for large `ρ` | `(1,0.7,30)`, 12 terms | `0.712646695823513+0.719372168230009i` against `H⁺=0.712646695823506+0.719372168230038i`; `(∓2iρ)^k` gives `0.7520+0.6426i` | holds | R06 |
| 5.2 phase, `C_0`, `F_ℓ` | `η=20…5000`, `−20`, `−320`; `ρ=0.3` | difference `−0.0041670, −0.0010417, −0.00026042, −0.0000166667`; `F_0` at zeros of `J_1` nonzero; without `π/4`: `+0.78436` | Lean target holds; two prose claims fail | R03, R05, C05 |
| 6.1 Kummer form, equation, `A` | seven `(ε,ℓ,r)` with both signs of `ε`, `r`; `A` at seven points | Kummer minus series below `10⁻⁶³`; equation residual below `10⁻²⁸`; `A(0.3,2)=2.86`, `A(−1/4,2)=0`, `A(−0.3,4)=−0.9044` both sides | holds | none |
| 6.2 Wronskian, analyticity | eight points incl. `ε=−1/4` with `ℓ=2,0` | `𝒲π/2=1.000000` at all; `h(−0.13,2;3)=1.1022812692`; near `ε=−1/4`: `−0.6556873` both sides | Wronskian holds; analyticity at `0` false | R01, C01 |
| 6.3 connection formulas | `(1,∓0.8,2.1)`, `(0,2.5,0.7)`, `(2,−0.3,−1.9)`; `ε=0.3,1.7`; `ε=−0.13,−2,−0.7` | `0.8932040313`, `−0.2611919778`; `s=8.8867059599`, `c=−0.0196166797`; `s=0.7479846406`; `r<0`: `16.3461015329`, `−0.0094965690`; printed forms differ | holds; DLMF wrong | none |
| 6.4 recurrence, `ε=0`, series of `h` | `(0.3,1,1.7)`, `(−0.4,0,−2.2)`; `f(0,1;±2)`; seven points for `h` | residuals `10⁻⁶⁷`; `0.860342947751244=2J_3(4)`, `6.67455155684069=2I_3(4)`; series `=h` at all seven; printed: `0.0670`, `2.5267` | holds; DLMF wrong | C02 |
| 7.1 Laguerre form, bound-state condition | `(n,ℓ,r)=(1,0,1)`, `(3,1,2.2)`, `(5,2,−0.7)`, `(4,0,6.5)`; `ν=2`, `2.3` | `0.7357588823`, `−0.1780925226`, `−0.0023137572` both sides; `f e^{20}=−1520`; growing case `2.51·10⁻⁴` | holds | none |
| 7.2 orthonormality | `(m,n,ℓ)=(3,3,1)`, `(2,2,0)`, `(2,3,1)`, `(1,2,0)`, `(4,6,2)`, `(5,5,4)` | exact rational arithmetic: `1, 1, 0, 0, 0, 1`; with `L^{(2ℓ)}`: `1.5` and `0.36864` | holds | none |
| Padding probe | all 30 theorems, `rfl`, `simp`, `norm_num` | none closes; 30 `sorry` remain | no padding | N02 |
| Statability probe | 4.2, 5.1, 2.2 written on a copy | three statements elaborate; 33 `sorry` warnings, no error | statable | R06 |

- Source locators checked against the text: the 73 DLMF locators of the README (§§33.2–33.20) read in the online edition, and the errata page for 33.6.5, 33.10, 33.11.1 and 33.14; 25 book locators not readable.
- Library declarations opened at the pins: the 15 Mathlib declarations of the `#check` block elaborate; no `Coulomb`, `whittaker`, `kummerU`, `sphericalBessel` or `laguerre` declaration in the pinned Mathlib or Tau Ceti; the three Tau Ceti paths of the README are absent at the pin.
- Cross-roadmap citations resolved: QuantumFoundations §9.4–§9.5 (main); SpecialFunctionsConfluent Conventions, 1.4, 1.6, 2.1, 3.4, 4.1, 5.1, 5.2, 6.2, 6.3, 6.4 (open head); SpecialFunctionsBessel Conventions, 1.5, 3.1–3.2; LaguerreJacobi 1.1; AsymptoticExpansions Conventions, 4.3; SpecialFunctionsEiLiErfIncompleteGamma 4.1; ZerosOfLFunctions 1.2. The ten copied definitions agree with their suppliers' text.
- Dependency check: `depcheck: 132 roadmaps, 1466 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates at the pins, `sorry` the only warning, 30 theorems; `#check @name` types compared with the README statements, no lost binder, nothing changed.
- Automatic checks: two failed, both about form (N01, N02); neither set aside.

Overlap check: read SpecialFunctionsConfluent (open), SpecialFunctionsBessel and SpecialFunctionsEiLiErfIncompleteGamma (main), and QuantumFoundations §9.4–§9.5; Tricomi's `U` is owned by QuantumFoundations §9.4 (C03); the Bessel expansions of `𝐌` by SpecialFunctionsConfluent 6.3 (C06); the Whittaker forms 33.2.3, 33.2.7 and 33.14.4–33.14.7 by this roadmap (SpecialFunctionsConfluent leaves them to QuantumFoundations §9.5, which does not state them). A search of the open heads and of main for the Coulomb functions found no other owner.

Source independence: 8 passages compared with 1 source (DLMF33), none shared beyond a 7-word standard phrase on the singularities in the Summary; largest share DLMF33, 73 of 98 locators; contents compared with DLMF Chapter 33: the layers regroup its sections (Layer 2 ↔ 33.4 and 33.8, Layer 3 ↔ 33.5 and 33.6, Layer 4 ↔ 33.7 and 33.9, Layer 5 ↔ 33.11 and 33.10, Layer 6 ↔ 33.14 and 33.16–33.20), not one to one; the five books could not be read.

Research link: The Coulomb functions are the radial eigenfunctions in the spectral representation of the hydrogen Hamiltonian of QuantumFoundations §9.5 and in Coulomb scattering (Chadan–Sabatier 1989); Layer 6 is the `(ε, r)` theory DLMF §33.14 attributes to Seaton (2002). Rests on the README and DLMF33.

## Not verifiable

- Buchholz 1969, Temme 1996, Olver 1997, Chadan–Sabatier 1989, Hall 2013: no legal copy found (publisher pages paywalled or unclassified); none of their 25 locators was checked.
- The printed pages of the NIST Handbook (pp. 742–753) and the two misprints said to be in print only (33.6.5, 33.11.1): only the online edition and its errata page were read; the errata confirm both.
- The formulas cited by number only (33.6.6–33.6.8, 33.7.3, 33.16.3–33.16.7, 33.16.10–33.16.13, 33.17.2–33.17.4): read in the source, not recomputed.
- The statement that a later Tau Ceti has the Laguerre polynomials, a holomorphic `log Γ` and `|Γ(1 + iy)|²`: only the pin was read.

## Source issues

- **Error** in DLMF33 at 33.9.4, printed page 746: the source says the `J_k` series for `η < 0` has coefficients `b_k`; it should be `(−1)^{k+1} b_k`; affects a stated result.
- **Error** in DLMF33 at 33.11.7, printed page 747: the source says `g f̂ − f ĝ = 1`; it should be `f ĝ − g f̂ = 1`, the Wronskian of 33.11.2–33.11.3; affects a stated result.
- **Error** in DLMF33 at 33.16.15, printed page 751: the source says `s`, `c` for `r < 0` equal `(πτ)^{−1/2}` times `F_ℓ`, `G_ℓ`; it should carry the factors `(−1)^{ℓ+1} e^{π/τ}` and `(−1)^ℓ e^{−π/τ}`; affects a stated result.
- **Misprint** in DLMF33 at 33.16.17, printed page 751: the source says the prefactor is `(−1)^ℓ/(2ν^{1/2})`; it should be `(−1)^ℓ/(2ν)^{1/2}`; affects a stated result.
- **Error** in DLMF33 at 33.16.18, printed page 751: the source says `K` multiplies `ζ` in `s` and in `c` and divides `ξ`; it should be `K` on `ξ` and `1/K` on both `ζ` terms; affects a stated result.
- **Error** in DLMF33 at 33.19.3, printed page 752: the source says `2πh` equals the finite sum minus the rest, with `κ` of 33.14.6; it should have twice the finite sum, and `κ = +(−ε)^{−1/2}` for `ε < 0`, `r < 0`; affects a stated result.
- **Misprint** in DLMF33 at the sentence after 33.14.15, printed page 749: the source says the functions `ϕ_{n,ℓ}` are indexed from `n = ℓ`; it should be from `n = ℓ + 1`, since `A(−1/ℓ², ℓ) = 0`; affects nothing.

## For the human reviewers

- **Scope.** Seven targets (4.3, 5.1, 6.3, 6.4, 7.1) state forms that differ from DLMF Chapter 33, and no published source is cited for the corrected forms; each was recomputed here and holds (the list is under Source issues).
- **Licence.** The description of the pull request says an unpublished Lean development (`lean-DLMF`, `DLMF/Coulomb/`) was consulted for the list of formulas and that nothing is copied from it; it was not available to compare with `Suggested.lean`.
- **Not tested.** DLMF Chapter 33 carries 73 of 98 locators and almost every target of Layers 1–6 is one of its formulas; its sections were compared (regrouped, not one to one). The five books cited for the synthesis could not be read, so the wording and arrangement were not compared with them.
- **Scope.** The Summary's sentence on the singularities of the equation shares a 7-word standard phrase with DLMF §33.2(i) (DLMF33 §33.2 lines 100–102); I took it as forced by the mathematics.
