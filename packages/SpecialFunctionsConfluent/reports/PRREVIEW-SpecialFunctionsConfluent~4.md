# Review of SpecialFunctionsConfluent (pull request #1995 at af5a60b)

**Verdict:** accepted

This is an incremental re-review of the 20 lines changed since `dc84305` (all in `TauCetiRoadmap/SpecialFunctionsConfluent/README.md`; `Suggested.lean` is unchanged). Both findings of the previous review are repaired, the repairs introduce no new problem, and the gate passes. There are no findings.

## Previous findings

- R01 — repaired: README:974–978 now reads "13.2.23 for `a ∉ {0, −1, …}` and 13.14.20 for `2μ ∉ {−1, −2, …}` and `½ + μ − κ ∉ {0, −1, …}`, each for `|ph z| ≤ π/2 − δ`", with three Checks at 980–987, two of them negative controls.
- R02 — repaired: README:943 reads "Layers 1–4; SpecialFunctionsEiLiErfIncompleteGamma; SpecialFunctionsBessel;" and README:1081 reads "*Needs:* Layers 1–2, 6; 5.2 (13.6.10, for the counterexample)."

## Verified sound

**The repair of R01 (6.2).**
- The conditions agree with the source: DLMF-13.2 line 966 excludes `a = 0, −1, …` from 13.2.23 (line 968), and DLMF-13.14 line 811 excludes `μ − κ = −½, −3/2, …` from 13.14.20 (line 813). The README's `½ + μ − κ ∉ {0, −1, …}` is the same set. The extra condition `2μ ∉ {−1, −2, …}` is where `Γ(1 + 2μ)` and `M_{κ,μ}` are defined.
- The sentence on the excluded cases is right: there `1/Γ(a) = 0`, respectively `1/Γ(½ + μ − κ) = 0`, and the left side is a nonzero polynomial times an elementary factor.
- I recomputed the three new Checks in double precision (series of `𝐌`, `math.gamma`); the values are in the table below and match the README to the digits it prints.
- The second-order term `(1 − a)(2 − a)(b − a)(b − a + 1)/(2z²)` accounts for the gap between the computed ratio and `1 + (1 − a)(b − a)/z` (1.0036140 against 1.0036222 at `z = 30`), so "in agreement with `1 + (1 − a)(b − a)/z + O(z^{−2})`" is correct.
- Text that cites the changed passage stays consistent: the scope table (README:120), the supplier contract for AutomorphicSpectralTheory §0.28 (README:163, 387, 989, at `y > 0` "in the ranges stated there"), and the Layer 6 example "13.2.23 at `a = b`" (README:1007), where `𝐌(a, a, z) = e^z/Γ(a)` holds for every `a` and gives `0 = 0` at the excluded `a`.
- The Checks are prose and name no Lean declaration; no backticked Lean name was added.

**The repair of R02 (dependencies).**
- No target of Layer 5 names Layer 6: the `*Needs:*` lines read "3.1, 4.1; …" (5.1), "Layers 1–4; …" (5.2) and "1.5, 5.2; …" (5.3), so the Dependencies line of Layer 5 now equals the union of its targets' needs.
- 13.6.10 is a target of 5.2 (README:884, "modified Bessel functions 13.6.9–13.6.10"), and at `ν = i` it is the identity quoted in 7.2. Layer 7's Dependencies line ("Layers 1–2, 5–6; …", README:1097) now has a target behind the "5".
- The new edge points to an earlier layer, so the build order is unchanged.

**Gate and dependencies.**
- Gate re-run on this head with `--base origin/main` and the candidate merge order: every counter is 0, result `OK`. The worker's gate, with the targeted build, also reports `build=0 OK`.
- Dependency check output: `depcheck: 234 roadmaps, 2265 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- No file outside the folder is changed, against `origin/main` or since `dc84305`.
- `scratch/overlaps.md`: no other open pull request changes this roadmap, no cited id is dropped, and no id is defined only by an open revision.

**Lean.**
- `lake env lean` on `TauCetiRoadmap/SpecialFunctionsConfluent/Suggested.lean`: 42 warnings, all `declaration uses sorry`, no error. The file is byte-identical to the one the previous review probed, so its binder comparison, one-tactic probe and name check carry over (previous report, "Lean").

**Carried forward from the review at `dc84305` (not redone).**
- The 12 library declarations opened at the pins, the cross-roadmap citations to AutomorphicSpectralTheory, QuantumFoundations, LaguerreJacobi, SpecialFunctionsBessel, SpecialFunctionsAiry, SpecialFunctionsHypergeometric, SpecialFunctionsParabolicCylinder, SpecialFunctionsEiLiErfIncompleteGamma and AsymptoticExpansions, and the source sample. The diff adds no cross-roadmap citation and no library name.
- Of the seeded sample, only "6.2 `M` and `M_{κ,μ}`" falls in the changed text; it is checked above. The diff does not touch the other sampled targets.

**The pull-request description.** It matches this head: 42 warnings, the ownership paragraphs and the list of corrections are unchanged by the diff. The generated `depends-on` block lists the eight suppliers the README cites.

**Adversarial table.** The four rows marked "new row" were computed this round. Every other row is carried from the review at `dc84305`, which computed it on the statement as it still stands.

| Statement | Instances | Left side | Right side | Result | Change |
|---|---|---|---|---|---|
| `kummerUBracket_intCast` | `(a,n,w) = (0.3+0.2i,3,0.4−0.9i), (0.7,−2,1.1+2i), (1.3−0.5i,1,−0.3+0.2i)` | `2.8e−16`, `1.2e−15`, `0` | 0 | holds |  carried from the review at dc84305 |
| 1.1 Checks of `U` | `U(1,1,1)`, `U(½,½,1)`, `U(0.3,2,1.7)`, `U(1.2,0,0.8)`, `U(0.7,−1,2.5)` | 0.5963473623, 0.7578721561, 0.9498530205, 0.3574093373, 0.3322969198 (integral 13.4.4) | README: 0.5963473623, 0.7578721561, 0.9498530204, 0.3574093372, 0.3322969198 | holds |  carried from the review at dc84305 |
| `kummerU_kummer_equation` | `(0.3, 0.45, 1.1+0.7i)` | residual `1.3e−9` | 0 | holds |  carried from the review at dc84305 |
| `differentiable_regularizedHGFun_prod`, `differentiable_kummerULog`, `differentiable_regularizedWhittakerMLog`, `analyticOnNhd_kummerU` | terms `(a)ₙzⁿ/(n!Γ(b+n))` jointly entire, series locally uniformly convergent; the bracket vanishes at integers (first row) | — | — | true; the route is owned (1.1) |  carried from the review at dc84305 |
| `regularizedHGFun_neg_nat` (13.2.5) | `(0.3+0.4i,2,1.3−0.4i)`, `(1,10,1)`, `(−1.5,0,2+i)` | 1.9771524171+0.5664224406i; 2.7182818285; −1.8671148087+0.4595661598i | same | holds |  carried from the review at dc84305 |
| `kummerU_neg_nat` (13.2.7) | `m=2, b=0.4+0.3i, z=1.2+0.5i` | −1.4−0.38i | −1.4−0.38i | holds |  carried from the review at dc84305 |
| `kummerULog_add_two_pi_mul_I` | `(0.3, 0.45, 1.1+0.7i, m=1)` | 3.9363968583+4.0373700133i | same | holds |  carried from the review at dc84305 |
| `kummerULog_intCast_add_two_pi_mul_I` | `(0.3, n=2, 1.1+0.7i, m=1)` | 1.2658113704−1.9838414490i | same (diff `2e−12`) | holds |  carried from the review at dc84305 |
| `tendsto_kummerULog_intCast` | the two rows above use the limit `b → n` on both sides | — | — | holds |  carried from the review at dc84305 |
| `whittakerW_equation` | `(0.3, 0.35, 1.1+0.7i)` | residual `8e−11` | 0 | holds |  carried from the review at dc84305 |
| `tendsto_kummerU_nhdsWithin_zero` | `a=0.7, b=−0.6, z=10⁻⁷e^{0.4i}` | 0.7658405210 | 0.7658406032 | holds (error `O(z)`) |  carried from the review at dc84305 |
| `kummerU_eq_cpow_mul_kummerU` (13.2.40) | `(0.3, 0.45, 1.1+0.7i)` | 0.8156415343−0.0986299628i | same | holds |  carried from the review at dc84305 |
| `regularizedHGFun_eq_kummerU_add` (13.2.41) | `(0.3,0.45,1.1+0.7i)`, `(0.6+0.3i,1.3,−0.8)`, `(1.1,0.6,0.5−1.5i)` | 0.9455825546+0.6023584360i; 0.7893979196−0.1430374387i; −1.0049946762−1.8404311425i | same | holds on the cut and in both half-planes |  carried from the review at dc84305 |
| `whittakerW_neg`, `whittakerW_eq_whittakerM_add` | `(0.3, 0.35, 1.1+0.7i)` | 0.6386051605−0.1291882571i | same (both) | holds |  carried from the review at dc84305 |
| `hasDerivAt_kummerU` (13.3.22) | `(0.3, 0.45, 1.1+0.7i)` | −0.1145765097+0.0722838334i | same | holds |  carried from the review at dc84305 |
| `regularizedHGFun_eq_integral` (13.4.1) | `(0.7+0.2i, 1.9−0.1i, 1.3−0.8i)` | 1.9168586936−0.3447760735i | quadrature same | holds |  carried from the review at dc84305 |
| `kummerU_eq_integral` (13.4.4) | `(0.8+0.3i, 1.7−0.4i, 0.9+0.6i)`; `(0.7,−1,2.5)` | 0.6886295354−0.7228899026i; 0.3322969198 | quadrature same; `z²U(2.7,3,z)` same | holds |  carried from the review at dc84305 |
| `whittakerW_eq_integral` (13.16.5) | `(κ,μ,z) = (−0.4,0.35,1.1+0.7i), (0.3+0.2i,0.9,0.8−0.5i), (0,½,2), (0.2,−0.1,1.5+0.3i)` | 0.3473787322−0.1726466911i; 1.0959366588+0.4145201418i; 0.3678794412; 0.4926457638−0.0517891668i | quadrature same | holds |  carried from the review at dc84305 |
| `regularizedHGFun_neg_eq_barnes_integral` (13.4.16) | `(1.3+0.2i, 2.1−0.5i, 0.8+0.5i, c=−0.4)` | 0.7337907897−0.1312600452i | line integral same | holds |  carried from the review at dc84305 |
| 4.2, the prefactor of 13.4.10 | `(e^{2πia} − 1) e^{−aπi} Γ(1−a)/(2πi)` | `sin(πa)Γ(1−a)/π` | `1/Γ(a)` | returns 13.4.1 |  carried from the review at dc84305 |
| 4.1, the coefficients fixed by the proof | `c₁ = Γ(1−b)Γ(b)/Γ(a−b+1)`, `c₂ = −c₁Γ(a−b+1)/Γ(a)` | `−π/(sin(πb)Γ(a))` | `Γ(b−1)Γ(2−b)/Γ(a)` | equal: 13.2.42 |  carried from the review at dc84305 |
| `tendsto_convs_regularizedHGFun_div` (13.5.1) | `(0.3+0.2i, 1.4, 2.5−i)`, 80 levels; Check `(−2, ½, 1)` | 0.4767000252+0.2346938109i; `(−5/3)/(1/3)` | same; −5 | holds |  carried from the review at dc84305 |
| `kummerU_half_half_sq` (13.6.8) | `x = 0.7` | 0.9321872517 | 0.9321872517 | holds |  carried from the review at dc84305 |
| `kummerU_one_sub_one_sub` (13.6.6) | `s=0.6, x=1.3` | 0.7456488604 | 0.7456488604 | holds |  carried from the review at dc84305 |
| `kummerU_airyAi`, `airyAi_eq_whittakerW` | `z = 0.6+0.9i` | 0.2727658251−0.6338207217i; 0.1491905827−0.1992497397i | same | holds |  carried from the review at dc84305 |
| `kummerU_parabolicCylinderU`, `parabolicCylinderU_eq_whittakerW` | `(0.7, 1.1+0.3i)` | 0.8145637285−0.1446806481i; 0.3888010245−0.1378763639i | same | holds |  carried from the review at dc84305 |
| `whittakerW_zero_eq_besselK`, `besselK_eq_kummerU` | `(ν,z) = (0.3, 0.8+0.4i)` | 0.3932570522−0.1561245294i; 0.4596744641−0.3211004026i | same | holds |  carried from the review at dc84305 |
| 5.2 Checks | 13.6.18 at `n=2, z=−1` by 13.2.40 and 13.2.7; 13.6.14 at `(0.7, −1.1+0.3i)` | `U(−½,3/2,1) = ½`; 1.7946152197−0.7026920297i | `−½`; same | the Checks are right |  carried from the review at dc84305 |
| 5.3 Check 13.18.16 | `n=2`: `z = 0.8+0.3i`; `z = −0.8+0.3i` | 0.0554557467+0.3342630922i; 0.0554557467−0.3342630922i | same; 0.3342630922+0.0554557467i | the Check is right |  carried from the review at dc84305 |
| `isBigO_kummerULog_sub_sum` (13.7.3) | `a=0.4+0.3i, b=1.35, N=2, Im w = 1.3π`, `|z| = 6, 10, 14` | ratio 0.388, 0.102, 0.137 | bounded | holds |  carried from the review at dc84305 |
| `isBigO_regularizedHGFun_sub_sum_cobounded` (13.8.1) | `a=z=1, n=2`, `b = 30, −20.5, 25i, −30.1+0.5i` | `|b|²|rem|` = 0.9989, 0.9975, 1.0016, 0.9989 | bounded | holds |  carried from the review at dc84305 |
| `ncard_pos_zeros_regularizedHGFun_of_neg` (13.9.1) | `a ∈ {−0.5,−1,−2.3,−3,−4.7}`, `b ∈ {0.01,0.5,1,2.5}` | counts on `(0, 65]` | `⌈−a⌉` | 20 of 20 agree |  carried from the review at dc84305 |
| `…_of_pos_of_neg`, `…_of_pos_of_lt_neg_one`, `…_of_ceil_lt` and 13.9.5 | `a ∈ {−5.5, −5.25, …, 3}`, 18 non-integer `b ∈ [−5.75, −0.25]` | counts on `(0, 65]` | the Lean formulas | 567 of 567 agree (36, 180, 135 and 216 pairs) |  carried from the review at dc84305 |
| 13.9.3, 13.9.4, 13.9.6 as printed | the same grid | counts | printed formulas | fail at 36 pairs: `a = 0` (9) and `a = −1, …, −5` (27) |  carried from the review at dc84305 |
| `regularizedHGFun_ne_zero_of_nonneg` (13.9.2) | all terms `≥ 0`, first term `> 0` | `> 0` | `≠ 0` | holds |  carried from the review at dc84305 |
| 7.1, the `b`-zero counterexample | `𝐌(1, −n, 1) = e` by 13.2.5; residue `(−1)ⁿe/n!` | sign of `M(1,b,1)` as `b ↑ −n`, `n` even: `−∞` | `M(1, −n−½, 1) → 1` | a zero in each `(−n−½, −n)` |  carried from the review at dc84305 |
| 7.2, `P(a,b)` (13.9.14–13.9.15) | 19 pairs with `a < 0`, `b ≤ 1`; 4 pairs with `b ≥ 1`; `a > 0` by positivity of the integral 13.4.4 | counts on `(0, 26]` | `⌈b−a−1⌉` or `0` | all agree |  carried from the review at dc84305 |
| 7.2, `T(a,b)` (13.9.11–13.9.13) | `(−2.5,−0.6), (−1.5,0.3), (−0.5,0.3), (0.4,0.3), (−1.5,0.9), (−3.6,−1.7), (−0.5,0.9), (−2.5,0.3)` | winding 3, 1, 0, 0, 2, 3, 1, 2 | 3, 1, 0, 0, 2, 3, 1, 2 | holds |  carried from the review at dc84305 |
| `kummerU_ne_zero` (Wimp) | `(a,b) = (−0.4,0.1), (−1.2,−1.6), (0.1,1.15), (−2.3,−3.7), (0.5,1.9), (−0.45,0.05)`; grid `0.05 ≤ |z| ≤ 14`, `|ph z| ≤ π/2` | `min |z^a U|` = 1.0006, 1.0053, 1.0000, 1.0168, 1.0006, 1.0006 | `≠ 0` | holds; control `(−0.5, 0.9)` with `2a−b = −1.9` has a positive zero |  carried from the review at dc84305 |
| `integral_cpow_mul_regularizedHGFun_neg` (13.10.10) | `(a,b,s) = (1.6, 2.3, 0.7)` | 1.73746472 (quadrature to `t = 200` plus two tail terms) | 1.73746476 | holds |  carried from the review at dc84305 |
| `hasSum_regularizedHGFun_buchholz` | `(0.2−0.5i, 1.4+0.4i, −1.2+0.3i)`, 26 terms | 1.1852922839+0.4678121627i | same | holds |  carried from the review at dc84305 |
| 9.1 Check of 13.11.1 | `a=½, b=z=1` | `𝐌(½,1,1)` = 1.7533876544 | README 1.75338 76543 7709 | holds |  carried from the review at dc84305 |
| `kummer_quadratic_relation` (13.12.1) | `(0.3+0.2i, 0.45, 1.1+0.7i)` | 1.0000000000 | 1 | holds |  carried from the review at dc84305 |
| 9.4 Checks of `p_s^{(μ)}` | Taylor expansion of 13.24.3 with `c = 1 − 2μ`: coefficients `−z/6`, `z²/72 − c/6`, `−z³/1296 + z/90 + cz/36` | `p₁ = z²/6`, `p₂ = z⁴/72 − (1−2μ)z²/6`, `p₃ = z⁶/1296 + (μ − 7/10)z⁴/18` | README: the same | holds |  carried from the review at dc84305 |
| 9.4, 13.26.1 at `2μ = m ∈ ℕ` | `(−2μ)_n Γ(1+2μ−n)` for `n > m` | finite nonzero limit | the literal finite sum drops these terms | excluding `2μ ∈ ℤ` is needed |  carried from the review at dc84305 |
| Examples | 13.3.22 at `a=b=1`; 13.15.24 at `n=1, κ=½, μ=0`; 13.6.16 at `n=1`; 13.13.1 at `y=−x` | `e^zE₁ − 1/z`; `−e^{−z}`; `1 − 2z²`; 1 | same | hold |  carried from the review at dc84305 |
| 6.2, 13.2.23 with `a ∉ {0, −1, …}` (changed) | `(a,b) = (0.3, 0.45)` at `z = 30, 60`; excluded case `(−1, 1)` at `z = 5, 30` | ratio `𝐌 Γ(a) e^{−z} z^{b−a}` = 1.0036222237, 1.0017794777; `𝐌(−1,1,z)` = −4, −29 | two-term value `1 + (1−a)(b−a)/z` = 1.0035, 1.00175 (three-term 1.0036140, 1.0017785); excluded case: right side `0` | holds; the excluded case is now excluded and is a negative-control Check | new row |
| 6.2, 13.14.20 with `2μ ∉ {−1, −2, …}`, `½ + μ − κ ∉ {0, −1, …}` (changed) | `(κ,μ) = (0.3, 0.35)` at `z = 30, 60`; excluded case `(1, ½)` at `z = 5` | ratio of the two sides = 1.0182340, 1.0088593 (tending to 1 like `1/z`); `M_{1,1/2}(5) = 5e^{−5/2}` = 0.4104249931 | 1; excluded case: right side `0` since `1/Γ(0) = 0` | holds; the excluded case is now excluded and is a negative-control Check | new row |
| 6.2 Checks (new) | the three Checks at README:981–987 | 1.0036222237, 1.0017794777; −4, −29; 0.4104249931 | README: `1.00362 22…`, `1.00177 95…`; `−4`, `−29`; `0.41042 49931…` | the Checks are right | new row |
| 7.2 `*Needs:*` (changed) | 13.6.10 at `ν = i`: `ν + ½ = ½ + i`, `2ν + 1 = 1 + 2i`, argument `2x` | `U(½ + i, 1 + 2i, 2x)` | `π^{−1/2} e^x (2x)^{−i} K_i(x)`, the form in 7.2; 13.6.10 is listed in 5.2 (README:884) | the new edge names the target the counterexample uses | new row |

## Not verifiable

- Unchanged from the review at `dc84305`: Gautschi (1967) and Wimp (1965) were not opened (paywalled; DLMF's report of Wimp's theorem was checked), and DLMF §§13.4 and 13.7 were read on the public pages. No changed passage depends on any of them.
- Ownership against open pull requests was checked only through the worker's overlap report for this head (index of 2026-11-10).

## Source issues

- none
