# Review of SpecialFunctionsCoulomb (pull request #3074 at 83762fa)

**Verdict:** needs changes

**Summary.** Changes are needed: three findings, all in the two series the README calls "a headline without a Lean name". The power series of `h` in 6.4 is `0·∞` at `ε = −1/n²` with `1 ≤ n ≤ ℓ`, where `h` is defined and the literal reading gives a wrong value; the logarithmic series of `H^±_ℓ` in 3.2 is `0·∞` at `η = 0`; and both series are statable at the pins but absent from `Suggested.lean`. The six findings of the previous review are repaired, and all 33 Lean statements and the sampled Checks were recomputed and hold. There are two small corrections and one format note; four points are left for the human reviewers.

## R01 (P2) — The power series of `h` in 6.4 is undefined at `ε = −1/n²` with `1 ≤ n ≤ ℓ`, where `h` itself is defined; the item needs that hypothesis or a limit reading.

In 6.4 (lines 678–688) the series is given for `ε < 0` with `κ = (−ε)^{−1/2}` and both signs of `r`, with no exclusion beyond the junk values of `h` in the Conventions (`ε = 0`, and `ε = −1/n²` with `n > ℓ`, `r > 0`). At `ε = −1/n²` with `1 ≤ n ≤ ℓ` the factor `A(ε, ℓ)` vanishes and `ψ(−ℓ + κ) = ψ(n − ℓ)` is at a pole, so the last term is `0·∞`; these are not junk values of `h` (the Check of 6.2 uses `(−1/4, 2, ±1.4)`). An implementer who reads the product as `0`, which is also what the library's total functions give, proves a false identity.

At `(ε, ℓ, r) = (−1/4, 2, 1.4)` the definition gives `h = 1.96223692382825`; the series at `ε = −1/4 ± 10⁻⁹` gives `1.96223692483284` and `1.96223692282366`; with the `A`-term read as `0` it gives `1.94825275164612`. At `(−1, 1, −0.9)`: `h = −0.143794602353125`, against `−0.428559028300522`. The product has a finite nonzero limit because `A = Γ(1 + ℓ + κ)κ^{−2ℓ−1}/Γ(κ − ℓ)` and `ψ/Γ` is finite and nonzero at the poles.

The smallest change: add "for `ε ≠ −1/n²`, `1 ≤ n ≤ ℓ`" to the item (or write the term as `Γ(1 + ℓ + κ)κ^{−2ℓ−1} · ψ(κ − ℓ)/Γ(κ − ℓ)`, read by continuity), and the point `(−1/4, 2, 1.4)` as a negative-control Check.

## R02 (P2) — The logarithmic series of `H^±_ℓ` in 3.2 is `0·∞` at `η = 0`; it needs `η ≠ 0`.

3.2 (lines 321–331) states the series "for `ρ > 0`", for every real `η`. At `η = 0` the prefactor `1/Γ(−ℓ ± iη)` is `1/Γ(−ℓ) = 0`, and in the finite sum `(1 − a)_k = (−ℓ)_k = 0` for `ℓ + 1 ≤ k ≤ 2ℓ + 1`, a range that is never empty (for `ℓ = 0` it is `k = 1`). The right side is undefined, and with the library's conventions (`Γ(−ℓ) = 0`, division by zero is zero) it is `0`, while `H^±_0(0, ρ) = e^{±iρ}`.

For `η ≠ 0` the series is right: at `(ℓ, η, ρ) = (1, 0.7, 2.3)` it gives `1.21976098813861 ± 0.657526749516749 i`, and at `η = 10⁻⁶` it gives `0.456021179244666 + 0.990495436539165 i`, equal to `H⁺_1` from the definition. Add "and `η ≠ 0`" to the item; the case `η = 0` is 3.3.

## R03 (P2) — The two series the README calls headlines (3.2 and 6.4) are statable at the pins, and the reason the module docstring gives for their absence is not a missing carrier.

The docstring of `Suggested.lean` (lines 14–15) says they "need the digamma coefficients written out as named sequences, which the README describes but does not name". The series of 3.2 needs no sequence at all: written on a copy of the file as a `HasSum` over `k : ℕ` with `ascPochhammer`, `Complex.digamma`, `Complex.log`, `Complex.Gamma` and the finite sum over `Finset.Icc 1 (2 * ℓ + 1)`, under `η ≠ 0` and `0 < ρ`, it elaborates. The series of 6.4 needs three short recursive definitions (`γ_k`, `β_k`, `δ_k` of DLMF 33.19.4–33.19.7, in the shape of `coulombEnergyCoeff`); with them the statement `HasSum (fun k => δ_k r^{k+ℓ+1}) (…)` under `ε ≠ 0`, `r ≠ 0` and the exclusion of R01 elaborates as well. The copy has 35 `sorry` warnings and no error.

These are the two targets in which the roadmap departs from the printed formulas (33.6.5 as corrected online, 33.19.3 as corrected here), and stating them is where the hypotheses of R01 and R02 have to be written down. State both, or stop calling them headlines in 3.2, 6.4 and the docstring.

## C01 — The last negative control of 2.2 gives the depth-20 approximant with six wrong digits.

The Check (line 282) has `−3.90485668259691·10³⁰` at `η = 0`, `ℓ = 0`, `ρ = π`. The denominator cancels to about `10⁻³⁰`, so the value needs more than 30 working digits: at 60, 120 and 200 digits it is `−3.90485668249007·10³⁰` (at 30 digits one gets `−2.535·10³⁰`). The depth-5 and depth-10 values are right. Replace the digits, or give `−3.9049·10³⁰`.

## C02 — 6.2 and 6.4 name each other in their `*Needs:*` lines.

6.2 needs "6.1, 6.4 (for the limit `ε → 0`)" and 6.4 needs "2.1, 6.1–6.3". Item by item there is no cycle (the Wronskian of 6.2 does not use 6.4; only the series of `h` in 6.4 uses 6.2; the limit in 6.2 uses that series), but an implementer reading the two lines cannot tell. Say in 6.4 which item needs 6.2, or move the limit `ε → 0` of `h` into 6.4.

## N01 — The section comment "Library declarations consumed" at the end of `Suggested.lean` has only `#check` lines under it; a plain comment would do.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 consumed core, Checks | `(1,0.7,2.3)`, `(0,1,1)`, `(1,−1,2)` | `𝒲{H⁻,H⁺} = 2.0 i`; `0.227526210510560`, `2.04309716210354`; `0.831877152552468`, `−0.345746410383545` | holds | none |
| 1.2 `coulombPhase_spec` | `σ_0(0.5)`, `σ_2(−3)`, `σ_3(7.5)`, `σ_0(−20)` | `−0.244058298905428 = Im ln Γ`; `−3.28519026671420`; phase residuals `≤ 5·10⁻³²`; `−40.6958766` against `arg = −2.9968` | holds | none |
| 1.2 `coulombC_sq` | `(0,0.8)`, `(2,−1.5)`, `(3,0.001)` | residuals `≤ 2.5·10⁻³²`; `C_0(0.8)² = 0.0331991272860696` | holds | none |
| 1.2 `coulombC_succ` | same; `C_1(1)` | residuals `≤ 2.5·10⁻³²`; `0.0511108628318419 = (√2/3)C_0(1)` | holds | none |
| 1.3 `coulombF_eq_whittakerM` | `(1,0.7,2.3)` | both forms `0.657526749516749` | holds | none |
| 1.3 `coulombHPlus_eq_whittakerW` | `(1,0.7,2.3)` | `1.21976098813861 + 0.657526749516749 i` both sides; `e^{−1.4π} = 0.0122990935428127` | holds | none |
| 1.4 `coulombF_mul_coulombG_sub` | `(0,0.7,2.3)`, `(2,0.7,2.3)`, `(2,−0.9,3.1)`, `(0,0,1.1)` | `0.819231920519040`, `0.973841209741793`, `0.957826285221151`, `1`; equal the right side | holds | none |
| 2.1 `coulomb_recurrence` | `(2,−0.9,3.1)`, `F,G,H^±` | residuals `≤ 5.5·10⁻³⁰`; wrong sign in `S_L`: `−1.47744400493967` | holds | none |
| 2.1 `hasDerivAt_coulomb_ladder` | same | both relations, residuals `≤ 4.1·10⁻³⁰` | holds | none |
| 2.2 `tendsto_convs_coulombF` | `(1,0.7,2.3)`, `(0,−1.3,9.7)`, `(0,0,1)`, `(0,0,π)` | Lean-shaped convergents: `0.757107891228786`, `0.303399955247087`, `cot 1`; at `π`: `−1090.09945891328`, `−2.47499339243593·10¹⁰`, `−3.90485668249007·10³⁰` | holds | C01 |
| 2.2 Barnett | `(1,0.7,2.3)` | `q = 0.520790396737899`; returns `F_1`, `1.21976098813861`, `−0.597360004200212` | holds | none |
| 3.1 `hasSum_coulombF` | `(1,0.7,2.3)`, `(0,−1.2,−1.5)` | `0.657526749516749`; `−13.5122029357791`; `A^1_4 = −0.051`; wrong sign `1.64177749615809` | holds | none |
| 3.2 `tendsto_pow_mul_coulombG` | `ℓ=2, η=0.7`; `ℓ=0, η=−2` | `0.999650248217158`, `0.999996500024833`; `1.0213`, `1.000049` | holds | none |
| 3.2 logarithmic series | `(1,0.7,2.3)`, `η = 10⁻⁶`, `η = 0` | equals `H^±_1`; at `η=0`: `1/Γ(−1) = 0`, `(−1)_2 = 0` | `0·∞` at `η = 0` | R02, R03 |
| 3.3 `coulombF_zero_left`, `coulombG_zero_left` | `(2,1.7)`, `(3,−2.2)` | `0.265117664379567`; `1.74509260862806`; `0.169317004438809`, both sides | holds | none |
| 3.3 small `η`, large `ℓ` | `η=0.01`; `ℓ=10,40` | `0.999930586620975`; `1.00391715697770`, `1.00029281507895` | holds | none |
| 4.1 `coulombF_eq_integral` | `(1,0.7,2.3)`, `(2,−1.1,−0.8)` | `0.657526749516749`; `−0.194345030296473` both sides | holds | none |
| 4.1 `coulombHMinus_eq_integral` | `(1,0.7,2.3)` | `1.21976098813861 − 0.657526749516749 i` both sides | holds | none |
| 4.2 `hasSum_coulombF_sphericalBesselJ` | `(1,0.7,±2.3)`, `(0,−1.3,4.1)`, `(2,−0.9,−3.4)`, `ρ=0` | `0.657526749516749`, `0.0968886051511807`, `0.735868466687587`, `−11.0769198447575`, `0`; `a_k/C`: `1,3,5,14/3` | holds | none |
| 4.3 `hasSum_coulombF_besselI` | `(1,0.7,2.3)`, `(0,1.5,4)` | `0.657526749516749`, `1.11855596881179` | holds | none |
| 4.3 `hasSum_coulombF_besselJ` | `(0,−0.7,1.2)`, `(3,−1.1,2)`, `(0,−1.5,4)` | `0.619453592307231`, `0.320594428929110`, `0.826142012196660`; printed form off by `−0.110492211106306`, `2.15488800509365` | holds | none |
| 5.1 `coulombHPlus_sub_sum_isBigO` | `(1,0.7)`, `N=4`, `ρ=30,60,120`; 12 terms | `0.784482772149829`, `0.777865444724296`, `0.774173060982327`; sum `0.712646695823513 + 0.719372168230009 i` | holds | none |
| 5.1 real form | `(1,0.7,30)` | `f ĝ − g f̂ = 0.99999999999998` | holds | none |
| 5.2 `tendsto_coulombPhase_zero_atTop` | `η=20,80,5000` | `−0.00416701413737145`, `−0.00104167209225612`, `−0.0000166666667`; without `π/4`: `0.784356491305192` | holds | none |
| 5.2 `F_ℓ` for `ηρ` fixed | `x=6`, `η=±10,±80,−640` | `I_3` ratio `0.976470977852675`, `0.99962884176556`; `J_3` miss·`η²`: `−3.23192`, `−3.33795`, `−3.33963`; `F_0` miss·`|η|^{5/2}`: `4.566`, `4.610`, `4.611` | holds | none |
| 5.2 `C_0`, zero of `J_1` | `η=±20,±80`; `η=−113.034022613697` | ratios `1` to `10⁻²⁹`; `F_0 = −0.00069443987242113` | holds | none |
| 6.1 `coulombEnergyF_eq_kummer` | `(0.25,0,1)`, `(−0.25,0,1)`, `(0.3,1,2.5)`, `(−0.13,2,±3)` | `0.526601295756430`, `0.606530659712633`, `0.705763928861392`, `−4.94405637561829`, `0.671880706850393` both sides | holds | none |
| 6.1 `coulombEnergyF_equation` | `(0.3,1,2.5)`, `(−0.13,2,−3)`, `(0,3,1.1)` | residuals `≤ 2.4·10⁻³⁰` | holds | none |
| 6.1 `coulombEnergyA_eq_gamma` | `(0.3,2)`, `(−0.3,4)`, `(−1/4,2)`, `(−0.13,1)` | `2.86`, `−0.9044`, `0`, `0.87` both sides | holds | none |
| 6.2 `wronskian_coulombEnergyH_coulombEnergyF` | `(0.3,1,±2.5)`, `(−0.13,2,±3)`, `(−1/4,2,±1.4)`, `(−1/4,0,−1.4)`, `(−1/9,1,−1.4)` | `𝒲π/2 = 1.0` at all eight | holds | none |
| 6.2 regularity, limit `ε → 0` | `ε=−1/4±10⁻⁶`; `ε=0.001,−0.0011`, `r=±1.4`; `ℓ=1` | `−0.655687359`, `−0.655687308`; `−0.660115`, `−0.660094` near `−0.660105`; `0.0283686`, `0.0283343` near `0.0283523`; partial sums pass `0.0518283934` | holds | C02 |
| 6.3 `coulombF_eq_coulombEnergyF` | `(1,∓0.8,2.1)`, `(2,−0.3,−1.9)`, `(0,2.5,0.7)`, `(3,1.1,−0.4)` | `0.893204031324914`, `0.503700805561556`, `−0.671192863505117`, `0.00420235561216671`, `3.24508192279652·10⁻⁵` both sides | holds | none |
| 6.3 `coulombG_eq_coulombEnergyH` | `(1,∓0.8,2.1)`, `(0,2.5,0.7)` | `−0.261191977826202`, `1.44673925810598`, `46.6171207049469` both sides | holds | none |
| 6.3 `coulombEnergyS_coulombEnergyC_of_neg` | `(0.3,1,−2.5)`, `(1.7,2,−0.6)` | `8.88670595989257`, `−0.0196166796892146`; `−0.0547680626354939`, `0.669890058408385`; printed `0.0286907427107813` | holds | none |
| 6.3 `coulombEnergyS_eq_whittaker` | `(−0.13,1,3)`, `(−2,0,0.8)`, `(−0.7,1,1.3)`, `(−1/4,1,1.3)`, `(−0.3,3,1.5)`, `(−1/9,0,4.5)` | `0.747984640574983`, `0.584110944570288`, `0.248633402230625`, `0.360180060082094`, `0.00393096595404299`, `−0.709995821976878` both sides | holds | none |
| 6.3 corrected 33.16.18 | `(−0.13,1,−3)`, `(−0.7,0,−1.1)` | `16.3461015328751`, `−0.00949656898516834`; `−4.47114619722553`, `0.0215728972917501`; printed `1994.68443306155` | holds | none |
| 6.4 `coulombEnergyF_recurrence` | `(0.3,1,1.7)`, `(−0.4,0,−2.2)`, `(0,2,0.9)` | residuals `≤ 4.7·10⁻²⁹`; wrong coefficient `−0.0830844856265771` | holds | none |
| 6.4 `coulombEnergyF_zero_left` | `f(0,1;±2)`, `f(0,0;0.5)` | `0.860342947751244 = 2J_3(4)`, `6.67455155684069 = 2I_3(4)`, `0.576724807756873` | holds | none |
| 6.4 power series of `h` | five generic points; `(−1/4,2,1.4)`, `(−1,1,±0.9)` | equals `h` at the five; at `n ≤ ℓ`: `1.96223692382825` against `1.94825275164612` | `0·∞` at `n ≤ ℓ` | R01, R03 |
| 7.1 `hydrogenRadial_eq` | `(3,1,2.2)`, `(5,2,−0.7)`, `(4,0,6.5)`, `(1,0,0.3)`, `(7,6,3)` | `−0.178092522565691`, `−0.00231375716492343`, `0.00770788702581521`, `0.444490932409031`, `4.00874164558862·10⁻⁷` both sides | holds | none |
| 7.1 `memLp_coulombEnergyF_iff` | `ε=−1/4`; `ν=2.3`; `ε=0`; `n ≤ ℓ` | `f e^{20} = −1520`; `0.000251247840811957` growing; amplitude `r^{1/4}`; `a = ℓ+1−n ≥ 1` grows | holds | none |
| 7.2 `integral_hydrogenRadial_mul` | `(3,3,1)`, `(2,2,0)`, `(2,3,1)`, `(1,2,0)`, `(4,6,2)`, `(5,5,4)` | `1.0`, `1.0`, `2.7·10⁻²⁵`, `8.4·10⁻²⁴`, `2.4·10⁻²⁴`, `1.0` | holds | none |
| One-tactic probe | 33 theorems; `rfl`, `simp`, `norm_num`, `simp` with the definitions | none closes; 33 `sorry` remain | no padding | none |
| Statability probe | series of 3.2 and 6.4 on a copy | both elaborate; 35 `sorry` warnings, no error | statable | R03 |

- Previous findings: R01 repaired ("It is not analytic at `ε = 0`", 6.2); R02 repaired (`F_ℓ(η, ρ) ≠ 0` in 2.2 and in `tendsto_convs_coulombF`); R03 repaired (additive form with `O(|η|^{−5/2})`, recomputed); R04 repaired (the sentence on `G_ℓ` is gone from 4.2); R05 repaired (`0.784356491305192`); R06 repaired for 2.2, 4.2, 5.1, and R03 above is its remainder; C01–C07 and N01 applied; N02 half applied (N01 above).
- Source locators checked against the text: the DLMF locators of all fifteen sampled subsections, read in §§33.2, 33.4–33.11, 33.13, 33.14, 33.16–33.20 of release 1.2.8 with their errata notes (for example DLMF33-10 lines 149–160 and 333–338, DLMF33-14 lines 386–389 and 718, DLMF33-19 lines 117–119); 18 book locators not readable.
- Library declarations opened at the pins: `Complex.regularizedHGFunCoeff` (`Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean:67`), `Complex.besselJ` (`Mathlib/Analysis/SpecialFunctions/Bessel.lean:55`), `Complex.digamma` (`Mathlib/Analysis/SpecialFunctions/Gamma/Digamma.lean:48`); Tau Ceti's `Real.besselI` (`TauCeti/Analysis/SpecialFunctions/BesselI.lean:81`) is real-variable and is related to the complex `I_ν` by SpecialFunctionsBessel, whose definition is the one copied here; no Coulomb, Whittaker, Tricomi, spherical Bessel or Laguerre declaration at either pin.
- Cross-roadmap citations resolved: QuantumFoundations §9.4, §9.5 (main; definitions, Wronskians, asymptotics and the radial normalisation are there); SpecialFunctionsConfluent Conventions, 1.4, 1.6, 2.1, 3.4, 4.1, 5.1, 5.2, 6.2, 6.3, 6.4 (open head; the seven copied definitions agree character for character); SpecialFunctionsBessel Conventions, 3.1–3.2 and LaguerreJacobi 1.1 (main; copies agree); SpecialFunctionsParabolicCylinder 1.4; AsymptoticExpansions 4.3; SpecialFunctionsEiLiErfIncompleteGamma 4.1; ZerosOfLFunctions 1.2.
- Dependency check: `depcheck: 129 roadmaps, 1438 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates at the pins with 33 `sorry` warnings and nothing else; the file has no `variable` line, so no binder can be lost; `#check @name` types of the 33 theorems compared with the README, nothing changed.
- Automatic checks: one failed, about form (N01); none set aside.
- The pull request's description was read against the head: its counts (33 headlines, four sanity checks), suppliers and list of DLMF corrections agree with the files.

Overlap check: read SpecialFunctionsConfluent (open), SpecialFunctionsBessel and SpecialFunctionsParabolicCylinder (main), and QuantumFoundations §9.4–§9.5; the core of the Coulomb functions is owned by QuantumFoundations §9.5 and consumed; Tricomi's `U` by QuantumFoundations §9.4; Buchholz's expansion by SpecialFunctionsConfluent 6.3; the Whittaker forms 33.2.3, 33.2.7 and 33.14.4–33.14.7 by this roadmap (SpecialFunctionsConfluent leaves them to QuantumFoundations §9.5, which does not state them). No other open or merged roadmap states the Coulomb functions.

Source independence: 8 passages compared with 1 source (DLMF Chapter 33), none shared beyond a 7-word standard phrase on the singularities in the Summary; largest share DLMF Chapter 33, 75 of 93 locators; contents compared with DLMF Chapter 33: the layers regroup its sections (Layer 2 ↔ 33.4 and 33.8, Layer 3 ↔ 33.6 and 33.5, Layer 4 ↔ 33.7 and 33.9, Layer 5 ↔ 33.11 and 33.10, Layer 6 ↔ 33.14 and 33.16–33.20, Layer 7 ↔ part of 33.14(iv)), not one to one; the five books could not be read.

Research link: The Coulomb functions are the radial eigenfunctions of the hydrogen Hamiltonian of QuantumFoundations §9.5 and of Coulomb scattering (Chadan–Sabatier 1989); the `(ε, r)` theory of Layer 6 is the one DLMF §33.20 attributes to Seaton (2002), and the continued fraction of 2.2 the one of Barnett et al. (1974). Rests on the README and DLMF Chapter 33.

## Not verifiable

- Buchholz 1969, Temme 1996, Olver 1997: no legal copy found by the sources service; Chadan–Sabatier 1989 and Hall 2013: paywalled. None of their 18 locators was checked.
- The printed pages of the NIST Handbook (pp. 742–753) and the two misprints said to be in print only (33.6.5, 33.11.1): only the online edition and its errata notes were read; the notes confirm both.
- The formulas cited by number only (33.6.6–33.6.8, 33.7.3, 33.16.3–33.16.7, 33.16.10–33.16.13, 33.17.2–33.17.4, 33.18.1): read in the source, not recomputed.
- The negative controls of 3.2 (printed `Γ(−ℓ + iη)`) and of 6.2 (wrong `κ`, `S = 0`) were not recomputed.

## Source issues

- **Error** in DLMF33-9 at 33.9.4, printed page 746: the source says the `J_k` series for `η < 0` has coefficients `b_k`; it should be `(−1)^{k+1} b_k`; affects a stated result.
- **Error** in DLMF33-11 at 33.11.7, printed page 747: the source says `g f̂ − f ĝ = 1`; it should be `f ĝ − g f̂ = 1`, the Wronskian of 33.11.2–33.11.3; affects a stated result.
- **Error** in DLMF33-16 at 33.16.15, printed page 751: the source says `s`, `c` for `r < 0` equal `(πτ)^{−1/2}` times `F_ℓ`, `G_ℓ`; it should carry the factors `(−1)^{ℓ+1} e^{π/τ}` and `(−1)^ℓ e^{−π/τ}`; affects a stated result.
- **Misprint** in DLMF33-16 at 33.16.17, printed page 751: the source says the prefactor is `(−1)^ℓ/(2ν^{1/2})`; it should be `(−1)^ℓ/(2ν)^{1/2}`; affects a stated result.
- **Error** in DLMF33-16 at 33.16.18, printed page 751: the source says `1/K` multiplies `ξ` and `K` multiplies both `ζ` terms; it should be `K` on `ξ` and `1/K` on both `ζ` terms; affects a stated result.
- **Error** in DLMF33-19 at 33.19.3, printed page 752: the source says `2πh` equals the finite sum minus the rest, with `κ` of 33.14.6; it should have twice the finite sum, and `κ = +(−ε)^{−1/2}` for `ε < 0`, `r < 0`; affects a stated result.
- **Gap** in DLMF33-19 at 33.19.3, printed page 752: the source says the series holds for `r ≠ 0`; it should exclude `ε = −1/n²`, `1 ≤ n ≤ ℓ`, where `A = 0` meets a pole of `ψ(−ℓ + κ)`, or read that product as a limit; affects a stated result.
- **Gap** in DLMF33-6 at 33.6.5, printed page 745: the source says the series holds with no condition on `η`; it should require `η ≠ 0`, since `1/Γ(−ℓ)` and `(−ℓ)_k` vanish there; affects a stated result.
- **Error** in DLMF33-8 at the sentence after 33.8.3, printed page 745: the source says the continued fraction 33.8.1 converges for all finite `ρ`; it should exclude the zeros of `F_ℓ(η, ·)`, where it diverges; affects a stated result.
- **Misprint** in DLMF33-14 at the sentence after 33.14.15, printed page 749: the source says the functions `ϕ_{n,ℓ}` are indexed from `n = ℓ`; it should be from `n = ℓ + 1`, since `A(−1/ℓ², ℓ) = 0`; affects nothing.

## For the human reviewers

- **Scope.** Seven targets (4.3, 5.1, 6.3, 6.4, 7.1) state forms that differ from DLMF Chapter 33, and no published source is cited for the corrected forms; each was recomputed here and holds (list under Source issues).
- **Licence.** The pull request's description says an unpublished Lean development (`lean-DLMF`, `DLMF/Coulomb/`) was consulted for the list of formulas and that nothing is copied from it; it was not available to compare with `Suggested.lean`.
- **Not tested.** DLMF Chapter 33 carries 75 of 93 locators and was read; the five books cited for the synthesis (18 locators) could not be read, so wording and arrangement were not compared with them.
- **Scope.** The Summary's sentence on the singularities of the equation shares a 7-word standard phrase with DLMF §33.2(i) (DLMF33-2 lines 100–102); I took it as forced by the mathematics.
