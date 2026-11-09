# Review of SpecialFunctionsConfluent (pull request #1995 at dc84305)

**Verdict:** needs changes

This head repairs all eight findings of the previous review (table under `## Verified sound`). The full review finds 2 new defects: 1 at P2 and 1 at P3. The gate passes, and all 42 statements of `Suggested.lean` hold on the instances computed this round.

## R01 (P2) — 6.2 states 13.2.23 and 13.14.20 without the polynomial-case exception

**Location.** `TauCetiRoadmap/SpecialFunctionsConfluent/README.md:972–975`: "13.7.1 along the positive real axis for `a ∉ {0, −1, …}`; 13.7.2 … unless `a` and `b − a` are both nonpositive integers; 13.2.23 and 13.14.20 for `|ph z| ≤ π/2 − δ`."

**Claim.** 6.2 gives 13.7.1 and 13.7.2 their parameter conditions, but gives 13.2.23 and 13.14.20 only a sector. DLMF excludes the polynomial cases from both: `a = 0, −1, …` for 13.2.23 and `μ − κ = −½, −3/2, …` for 13.14.20. In those cases the right side is `0`, because `1/Γ(a)` (respectively `1/Γ(½ + μ − κ)`) vanishes, while the left side is a nonzero polynomial times an elementary factor. So the asymptotic equality is false as written.

**Witness.**
- `a = −1`, `b = 1`: `𝐌(−1, 1, z) = 1 − z` (`−4` at `z = 5`, `−29` at `z = 30`), and `e^z z^{a−b}/Γ(a) = 0`.
- `κ = 1`, `μ = ½`: `M_{1,1/2}(5) = 5e^{−5/2} = 0.4104249931`, and the right side of 13.14.20 is `0`.
- DLMF-13.2 line 966 and DLMF-13.14 line 811 state the exceptions.

**Repair.** In 6.2 write: "13.2.23 for `a ∉ {0, −1, …}` and 13.14.20 for `2μ ∉ {−1, −2, …}` and `½ + μ − κ ∉ {0, −1, …}`, each for `|ph z| ≤ π/2 − δ`." Add the instance `a = −1`, `b = 1` as a negative-control Check.

Tested on the repaired form at `a = 0.3`, `b = 0.45`: the ratio `𝐌(a, b, z) Γ(a) e^{−z} z^{b−a}` is `1.0036222` at `z = 30`, `1.0017795` at `z = 60` and `1.0009037 − 0.0024866i` at `z = 40e^{1.2i}`. These agree with `1 + (1 − a)(b − a)/z` to `O(z^{−2})`.

## R02 (P3) — Layer 5 lists Layer 6 as a dependency, and no target of Layer 5 uses it

**Location.** `README.md:943`: "Layers 1–4, 6; SpecialFunctionsEiLiErfIncompleteGamma; SpecialFunctionsBessel;". Also `README.md:1085`: "Layers 1–2, 5–6; SpecialFunctionsBessel 7.1; …".

**Claim.** The layers are in build order, so a layer should not depend on a later one unless a target says why. The `*Needs:*` lines of 5.1–5.3 name only 3.1, 4.1, Layers 1–4, 1.5 and 5.2, so the "6" has no target behind it. In Layer 7 the only use of Layer 5 is the counterexample of 7.2 through 13.6.10, and the `*Needs:*` line of 7.2 (README:1069) reads "Layers 1–2, 6".

**Witness.** `README.md:870` "*Needs:* 3.1, 4.1; …", `:909` "*Needs:* Layers 1–4; …", `:932` "*Needs:* 1.5, 5.2; …". None names Layer 6.

**Repair.**
- Delete "6" from the Dependencies of Layer 5. If a target of 5.2 does use 6.1 (for instance to identify a recessive solution), name 6.1 in that target's `*Needs:*` line instead.
- Add "5.2 (13.6.10, for the counterexample)" to the `*Needs:*` line of 7.2, or delete "5" from the Dependencies of Layer 7.

## Verified sound

**Gate and dependencies.**
- I re-ran the gate with `--base origin/main` and the candidate merge order. Every counter is 0 and the result is `OK`.
- The dependency check prints `depcheck: 236 roadmaps, 2264 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- `scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id and no id defined only by a revision.

**Lean.**
- `lake env lean` on `Suggested.lean` gives 42 warnings, all `declaration uses 'sorry'`, and no errors. The pins are Tau Ceti `2fd255d997` and Mathlib `1b1ccf4b`.
- The file has no `variable`, `include`, `set_option` or `lemma`, so no declaration can lose a section binder. The worker's elaborated signatures report 0 lost binders, and I compared the five new statements with their README text.
- One-tactic probe on a scratch copy: each `sorry` replaced by `first | rfl | simp | norm_num | infer_instance | fun_prop | positivity`. All 42 theorems stay unsolved, so none is padding by that test.
- All 55 declaration names occur in the README.

**Library declarations opened at the pins (12).**
- Mathlib `Analysis/SpecialFunctions/RegularizedHypergeometric.lean`: `regularizedHGFun` (192), `regularizedHGFunCoeff_eq_zero_right` (82), `analyticOnNhd_regularizedHGFun_of_card_le` (282, in `z` only), `regularizedHGFun_zero_singleton_neg_nat_add_one` (382, the `₀F₁` analogue of 13.2.5, not 13.2.5 itself), `regularizedGaussHGFun` (428), `radius_regularizedGaussHGFunSeries_eq_top_of_left` (468).
- Mathlib `Complex.differentiable_one_div_Gamma` (`Gamma/Beta.lean`, used at 590) and `Complex.digamma` (`Gamma/Digamma.lean`).
- Tau Ceti `Complex.hasSum_regularizedHGFun` (`RegularizedHypergeometric.lean:53`), `TauCeti.Real.erf` and `erfc` (`Erf.lean:61, 64`), `TauCeti.lowerIncompleteGamma` (`IncompleteGamma.lean`), `TauCeti.Contour.residue` (`Analysis/Contour/Residue/Basic.lean:80`).
- Neither pin has Kummer's `U`, Whittaker functions or a joint-holomorphy statement for `𝐌`.

**Cross-roadmap citations resolved (all present).**
- **AutomorphicSpectralTheory (open head):** §0.26 (556) defines `M_{μ,ν}(y)` by the regularized series and `W` by the integral over `(1, ∞)` for `Re(ν ± μ + ½) > 0`, then continues; it has the symmetry and the equation. §0.27 (585) has both Bessel comparisons. §0.28 (594) has the behaviour at `0` and `∞`. After `t ↦ t − 1` its `W` integral is 13.16.5, as 4.4 says. Its Check `W_{0,1/2}(y) = e^{−y/2}` matches `0.3678794412` at `y = 2`.
- **QuantumFoundations (open head):** §9.4 (996) has the Laplace definition, 13.3.7, 13.2.34, 13.2.41 with the half-plane signs the README quotes, 13.2.9–13.2.11, `U ∼ z^{−a}` and 13.6.19. §9.5 (1014) defines `F_ℓ` and `H_ℓ^±` through `M` and `U`. Its `Suggested.lean` has no Lean name for `U`.
- **LaguerreJacobi (open head):** A1 (225, `Polynomial.laguerre` over a general ring) and B3 (294, `Polynomial.integral_laguerre_mul_laguerre_laguerreMeasure` for `−1 < α`).
- **SpecialFunctionsBessel (open head):** 3.1 (784, 10.32.9), 4.3 (852, 10.39.5), 7.1 (1098) with the Sturm auxiliary row (162). It leaves 10.16.6–10.16.8, 10.39.6–10.39.8 and 9.6.21–9.6.24 to other roadmaps (190–194) and names this roadmap as consumer (1567). `besselI` and `besselK` here are verbatim copies of its `Suggested.lean:82, 88`.
- **SpecialFunctionsAiry (open head):** `TauCeti.airyAi`, `TauCeti.airyBi` (143); `airyAi` here is a verbatim copy of its `Suggested.lean:64`. It leaves 9.6.15–9.6.24 to Chapters 10 and 13 (1653).
- **SpecialFunctionsHypergeometric (open head):** line 1119 assigns 13.4.8, 13.4.12, 13.4.15, 13.10.3, 13.10.7, 13.16.9 and 13.23.4 to a roadmap that consumes it and this one, as the README says.
- **On main:** SpecialFunctionsParabolicCylinder §§1.1–1.6 (312–359), §6.7 (854), its four `𝐌` names (`Suggested.lean:52–66`), `parabolicCylinderU` (107), and 12.7.14 left to Chapter 13 (1304). SpecialFunctionsEiLiErfIncompleteGamma §2.2 (587), §4.1, §11.4 (1310), the function names (167–249), and its deferral list (1660). AsymptoticExpansions §§4.2, 4.3, 8.1, 8.2, 8.6, 10.2–10.4 and `Asymptotics.HasAsymptoticExpansion` (125).
- **Ownership by object.** `roadmaps grep` for `kummerU`, `kummerULog`, `whittakerW`, `whittakerM`, `regularizedWhittakerM` and `buchholzCoeff` finds no declaration outside this folder. "Tricomi" occurs only in QuantumFoundations (owner), RelativisticQuantumFieldTheory (consumer) and one mention in SpecialFunctionsHypergeometric. The automorphic roadmaps that say "Whittaker function" mean Whittaker models, except AutomorphicSpectralTheory §§0.26–0.28, which this head cites.

**The previous review's findings, checked one by one (8 repaired, 0 partly, 0 not).**

| Previous | Passage at this head | Status |
|---|---|---|
| R01 Whittaker owner | README:55–59, 158–165, 192–194, 223–226, 379–391; 4.4 at 813–823 with `whittakerW_eq_integral`; `*Needs:*` at 610, 688, 833, 932, 967, 977 | repaired |
| R02 joint holomorphy | README:175 (auxiliary row), 494–497 `differentiable_regularizedHGFun_prod`, 472; `Suggested.lean:148` | repaired |
| R03 Hermite domains | README:889–895 (13.6.14 every `z`, 13.6.15 `z ≠ 0`, 13.6.18 split by parity), 918–920, Checks at 903–907 and 928–930 | repaired |
| R04 9.4 hypotheses | README:1179–1196 | repaired (conditions match DLMF-13.26 lines 73, 129, 161, 217, 267, 296, 325, 355, 383, 411) |
| R05 corrected counts | `Suggested.lean:341, 346, 354`; README:1030–1034 | repaired |
| R06 three Checks | README:518–525 (bracket), 1150–1157 (`A_n`), 1200–1204 (`p_s`) | repaired |
| R07 owners, "deferred" | README:41–42, 208–209, 1264–1267, 1285–1288; no "deferred" or "follow-up" in the folder | repaired |
| R08 13.2.5 order | README:498–499 (13.2.5 in 1.1), 549, 559 | repaired |

**Source sample (DLMF Release 1.2.8; cached sections cited as `DLMF-13.x line N`; §§13.4 and 13.7 read on the public DLMF pages, because the fetched copies resolve to figure files).**
- **1.1:** 13.2.42 (DLMF-13.2 line 1632), 13.2.5.
- **1.4:** 13.2.12 (line 602), for `m ∈ ℤ`.
- **1.5:** 13.14.1–13.14.13 (DLMF-13.14 lines 106–611): the definitions, 13.14.6 with its terminating Gauss form, 13.14.7, 13.14.8–13.14.9 with their conditions on `κ − ½n − ½`, 13.14.10–13.14.13, and "entire in `κ` and `μ`" after 13.14.13.
- **2.2:** 13.2.24–13.2.25 with the sectors `−½π ≤ ph z ≤ 3π/2` and `−3π/2 ≤ ph z ≤ ½π` (lines 1026–1062); 13.2.26–13.2.32 with their case conditions; 13.2.33–13.2.38 (lines 1304–1461). 13.2.35 follows from 13.2.41 and 13.2.34 for every `z ≠ 0`, which I checked by hand.
- **2.3:** 13.2.40, 13.2.41, 13.2.43–13.2.44 (lines 1565–1711).
- **3.1:** 13.3.1–13.3.29 (DLMF-13.3 lines 69–849); the split between `M` and `U` relations is as the README says, and 13.3.22 is at line 663.
- **4.1:** 13.4.1 (`Re b > Re a > 0`), 13.4.2 (`Re b > Re c > 0`), 13.4.3 (`Re a > 0`), 13.4.4 (`Re a > 0`, `|ph z| < ½π`), 13.4.5 (`|ph z| < π`, `Re a > max(Re b − 1, 0)`), 13.4.6 (`−Re b < n < 1 + Re(a − b)`), 13.4.7 (`Re a > max(Re b − 1, 0)`). I also read the conditions of 13.4.9–13.4.11, 13.4.13–13.4.14 and 13.4.16–13.4.18; they match 4.2 and 4.3.
- **6.1:** 13.7.3 in `|ph z| ≤ 3π/2 − δ`; 13.14.21 (DLMF-13.14 line 847); 13.19.3 (DLMF-13.19 line 123).
- **6.2:** 13.7.1 (`a ≠ 0, −1, …`), 13.7.2 with its sector and exception, 13.19.1–13.19.2. For 13.2.23 and 13.14.20 see R01.
- **6.3:** 13.8.1 with `|b + n| ≥ δ` (DLMF-13.8 lines 68–73); 13.20.1 in `|ph μ| ≤ ½π − δ` (DLMF-13.20 lines 73–78).
- **7.1:** 13.9.1–13.9.7 (DLMF-13.9 lines 105–226), the parabolic regions (319–327) and the `b`-zero sentence (363–364).
- **7.2:** the finiteness sentence and 13.9.11–13.9.15 with "`a`, `b`, `a − b + 1` nonintegers" and "`b ≤ 1`" (lines 395–502), the reduction for `b ≥ 1` (519), Wimp's theorem (521–523). DLMF 10.45.7 is the formula for `K̃_ν` the README cites.
- **8.1:** 13.10.1–13.10.2 ("when `a ≠ 1`"), 13.10.4 (`Re b > 0`, `Re z > 1`), 13.10.5, 13.10.6 (`Re b > ½`, `Re z > 0`), 13.10.8–13.10.9 (`Re z > 0`, `y` real), 13.10.10 (`0 < Re λ < Re a`), 13.10.11 (DLMF-13.10 lines 68–440).
- **9.4:** 13.24.1 with `2μ, κ + μ ≠ −1, −2, …` (DLMF-13.24 line 92), 13.24.2–13.24.3 (126–155), 13.25.1, 13.26.1–13.26.12 with their conditions.
- **10.2:** 9.6.21–9.6.24 (DLMF-9.6 lines 849–944), 10.16.6–10.16.8 with "principal branches correspond at least when" `|ph z| ≤ ½π` (DLMF-10.16 lines 284–390), 10.39.6–10.39.8 (DLMF-10.39 lines 230–300), 12.7.14 (DLMF-12.7 line 517).

**Adversarial table.** Computed this round in pure-Python complex arithmetic (Lanczos `Γ`, the series of `𝐌` and `₀F₁`, the bracket form of `U` with a Richardson-averaged limit at integer `b`, double-exponential and trapezoidal quadrature). Zero counts are sign-change counts on a geometric grid; complex zero counts are winding numbers.

| Statement | Instances | Left side | Right side | Result | Change |
|---|---|---|---|---|---|
| `kummerUBracket_intCast` | `(a,n,w) = (0.3+0.2i,3,0.4−0.9i), (0.7,−2,1.1+2i), (1.3−0.5i,1,−0.3+0.2i)` | `2.8e−16`, `1.2e−15`, `0` | 0 | holds | — |
| 1.1 Checks of `U` | `U(1,1,1)`, `U(½,½,1)`, `U(0.3,2,1.7)`, `U(1.2,0,0.8)`, `U(0.7,−1,2.5)` | 0.5963473623, 0.7578721561, 0.9498530205, 0.3574093373, 0.3322969198 (integral 13.4.4) | README: 0.5963473623, 0.7578721561, 0.9498530204, 0.3574093372, 0.3322969198 | holds | — |
| `kummerU_kummer_equation` | `(0.3, 0.45, 1.1+0.7i)` | residual `1.3e−9` | 0 | holds | — |
| `differentiable_regularizedHGFun_prod`, `differentiable_kummerULog`, `differentiable_regularizedWhittakerMLog`, `analyticOnNhd_kummerU` | terms `(a)ₙzⁿ/(n!Γ(b+n))` jointly entire, series locally uniformly convergent; the bracket vanishes at integers (first row) | — | — | true; the route is owned (1.1) | — |
| `regularizedHGFun_neg_nat` (13.2.5) | `(0.3+0.4i,2,1.3−0.4i)`, `(1,10,1)`, `(−1.5,0,2+i)` | 1.9771524171+0.5664224406i; 2.7182818285; −1.8671148087+0.4595661598i | same | holds | — |
| `kummerU_neg_nat` (13.2.7) | `m=2, b=0.4+0.3i, z=1.2+0.5i` | −1.4−0.38i | −1.4−0.38i | holds | — |
| `kummerULog_add_two_pi_mul_I` | `(0.3, 0.45, 1.1+0.7i, m=1)` | 3.9363968583+4.0373700133i | same | holds | — |
| `kummerULog_intCast_add_two_pi_mul_I` | `(0.3, n=2, 1.1+0.7i, m=1)` | 1.2658113704−1.9838414490i | same (diff `2e−12`) | holds | — |
| `tendsto_kummerULog_intCast` | the two rows above use the limit `b → n` on both sides | — | — | holds | — |
| `whittakerW_equation` | `(0.3, 0.35, 1.1+0.7i)` | residual `8e−11` | 0 | holds | — |
| `tendsto_kummerU_nhdsWithin_zero` | `a=0.7, b=−0.6, z=10⁻⁷e^{0.4i}` | 0.7658405210 | 0.7658406032 | holds (error `O(z)`) | — |
| `kummerU_eq_cpow_mul_kummerU` (13.2.40) | `(0.3, 0.45, 1.1+0.7i)` | 0.8156415343−0.0986299628i | same | holds | — |
| `regularizedHGFun_eq_kummerU_add` (13.2.41) | `(0.3,0.45,1.1+0.7i)`, `(0.6+0.3i,1.3,−0.8)`, `(1.1,0.6,0.5−1.5i)` | 0.9455825546+0.6023584360i; 0.7893979196−0.1430374387i; −1.0049946762−1.8404311425i | same | holds on the cut and in both half-planes | — |
| `whittakerW_neg`, `whittakerW_eq_whittakerM_add` | `(0.3, 0.35, 1.1+0.7i)` | 0.6386051605−0.1291882571i | same (both) | holds | — |
| `hasDerivAt_kummerU` (13.3.22) | `(0.3, 0.45, 1.1+0.7i)` | −0.1145765097+0.0722838334i | same | holds | — |
| `regularizedHGFun_eq_integral` (13.4.1) | `(0.7+0.2i, 1.9−0.1i, 1.3−0.8i)` | 1.9168586936−0.3447760735i | quadrature same | holds | — |
| `kummerU_eq_integral` (13.4.4) | `(0.8+0.3i, 1.7−0.4i, 0.9+0.6i)`; `(0.7,−1,2.5)` | 0.6886295354−0.7228899026i; 0.3322969198 | quadrature same; `z²U(2.7,3,z)` same | holds | — |
| `whittakerW_eq_integral` (13.16.5) | `(κ,μ,z) = (−0.4,0.35,1.1+0.7i), (0.3+0.2i,0.9,0.8−0.5i), (0,½,2), (0.2,−0.1,1.5+0.3i)` | 0.3473787322−0.1726466911i; 1.0959366588+0.4145201418i; 0.3678794412; 0.4926457638−0.0517891668i | quadrature same | holds | — |
| `regularizedHGFun_neg_eq_barnes_integral` (13.4.16) | `(1.3+0.2i, 2.1−0.5i, 0.8+0.5i, c=−0.4)` | 0.7337907897−0.1312600452i | line integral same | holds | — |
| 4.2, the prefactor of 13.4.10 | `(e^{2πia} − 1) e^{−aπi} Γ(1−a)/(2πi)` | `sin(πa)Γ(1−a)/π` | `1/Γ(a)` | returns 13.4.1 | — |
| 4.1, the coefficients fixed by the proof | `c₁ = Γ(1−b)Γ(b)/Γ(a−b+1)`, `c₂ = −c₁Γ(a−b+1)/Γ(a)` | `−π/(sin(πb)Γ(a))` | `Γ(b−1)Γ(2−b)/Γ(a)` | equal: 13.2.42 | — |
| `tendsto_convs_regularizedHGFun_div` (13.5.1) | `(0.3+0.2i, 1.4, 2.5−i)`, 80 levels; Check `(−2, ½, 1)` | 0.4767000252+0.2346938109i; `(−5/3)/(1/3)` | same; −5 | holds | — |
| `kummerU_half_half_sq` (13.6.8) | `x = 0.7` | 0.9321872517 | 0.9321872517 | holds | — |
| `kummerU_one_sub_one_sub` (13.6.6) | `s=0.6, x=1.3` | 0.7456488604 | 0.7456488604 | holds | — |
| `kummerU_airyAi`, `airyAi_eq_whittakerW` | `z = 0.6+0.9i` | 0.2727658251−0.6338207217i; 0.1491905827−0.1992497397i | same | holds | — |
| `kummerU_parabolicCylinderU`, `parabolicCylinderU_eq_whittakerW` | `(0.7, 1.1+0.3i)` | 0.8145637285−0.1446806481i; 0.3888010245−0.1378763639i | same | holds | — |
| `whittakerW_zero_eq_besselK`, `besselK_eq_kummerU` | `(ν,z) = (0.3, 0.8+0.4i)` | 0.3932570522−0.1561245294i; 0.4596744641−0.3211004026i | same | holds | — |
| 5.2 Checks | 13.6.18 at `n=2, z=−1` by 13.2.40 and 13.2.7; 13.6.14 at `(0.7, −1.1+0.3i)` | `U(−½,3/2,1) = ½`; 1.7946152197−0.7026920297i | `−½`; same | the Checks are right | — |
| 5.3 Check 13.18.16 | `n=2`: `z = 0.8+0.3i`; `z = −0.8+0.3i` | 0.0554557467+0.3342630922i; 0.0554557467−0.3342630922i | same; 0.3342630922+0.0554557467i | the Check is right | — |
| `isBigO_kummerULog_sub_sum` (13.7.3) | `a=0.4+0.3i, b=1.35, N=2, Im w = 1.3π`, `|z| = 6, 10, 14` | ratio 0.388, 0.102, 0.137 | bounded | holds | — |
| 6.2, 13.2.23 | `(0.3, 0.45)` at `z = 30, 60, 40e^{1.2i}`; `(−1, 1)` at `z = 5, 30` | ratio 1.0036, 1.0018, 1.0009−0.0025i; `𝐌 = −4, −29` | 1; right side `0` | **fails at `a = −1`** | R01 |
| 6.2, 13.14.20 | `κ=1, μ=½, z=5` | 0.4104249931 | 0 | **fails** | R01 |
| `isBigO_regularizedHGFun_sub_sum_cobounded` (13.8.1) | `a=z=1, n=2`, `b = 30, −20.5, 25i, −30.1+0.5i` | `|b|²|rem|` = 0.9989, 0.9975, 1.0016, 0.9989 | bounded | holds | — |
| `ncard_pos_zeros_regularizedHGFun_of_neg` (13.9.1) | `a ∈ {−0.5,−1,−2.3,−3,−4.7}`, `b ∈ {0.01,0.5,1,2.5}` | counts on `(0, 65]` | `⌈−a⌉` | 20 of 20 agree | — |
| `…_of_pos_of_neg`, `…_of_pos_of_lt_neg_one`, `…_of_ceil_lt` and 13.9.5 | `a ∈ {−5.5, −5.25, …, 3}`, 18 non-integer `b ∈ [−5.75, −0.25]` | counts on `(0, 65]` | the Lean formulas | 567 of 567 agree (36, 180, 135 and 216 pairs) | — |
| 13.9.3, 13.9.4, 13.9.6 as printed | the same grid | counts | printed formulas | fail at 36 pairs: `a = 0` (9) and `a = −1, …, −5` (27) | corrections right |
| `regularizedHGFun_ne_zero_of_nonneg` (13.9.2) | all terms `≥ 0`, first term `> 0` | `> 0` | `≠ 0` | holds | — |
| 7.1, the `b`-zero counterexample | `𝐌(1, −n, 1) = e` by 13.2.5; residue `(−1)ⁿe/n!` | sign of `M(1,b,1)` as `b ↑ −n`, `n` even: `−∞` | `M(1, −n−½, 1) → 1` | a zero in each `(−n−½, −n)` | — |
| 7.2, `P(a,b)` (13.9.14–13.9.15) | 19 pairs with `a < 0`, `b ≤ 1`; 4 pairs with `b ≥ 1`; `a > 0` by positivity of the integral 13.4.4 | counts on `(0, 26]` | `⌈b−a−1⌉` or `0` | all agree | — |
| 7.2, `T(a,b)` (13.9.11–13.9.13) | `(−2.5,−0.6), (−1.5,0.3), (−0.5,0.3), (0.4,0.3), (−1.5,0.9), (−3.6,−1.7), (−0.5,0.9), (−2.5,0.3)` | winding 3, 1, 0, 0, 2, 3, 1, 2 | 3, 1, 0, 0, 2, 3, 1, 2 | holds | — |
| `kummerU_ne_zero` (Wimp) | `(a,b) = (−0.4,0.1), (−1.2,−1.6), (0.1,1.15), (−2.3,−3.7), (0.5,1.9), (−0.45,0.05)`; grid `0.05 ≤ |z| ≤ 14`, `|ph z| ≤ π/2` | `min |z^a U|` = 1.0006, 1.0053, 1.0000, 1.0168, 1.0006, 1.0006 | `≠ 0` | holds; control `(−0.5, 0.9)` with `2a−b = −1.9` has a positive zero | — |
| `integral_cpow_mul_regularizedHGFun_neg` (13.10.10) | `(a,b,s) = (1.6, 2.3, 0.7)` | 1.73746472 (quadrature to `t = 200` plus two tail terms) | 1.73746476 | holds | — |
| `hasSum_regularizedHGFun_buchholz` | `(0.2−0.5i, 1.4+0.4i, −1.2+0.3i)`, 26 terms | 1.1852922839+0.4678121627i | same | holds | — |
| 9.1 Check of 13.11.1 | `a=½, b=z=1` | `𝐌(½,1,1)` = 1.7533876544 | README 1.75338 76543 7709 | holds | — |
| `kummer_quadratic_relation` (13.12.1) | `(0.3+0.2i, 0.45, 1.1+0.7i)` | 1.0000000000 | 1 | holds | — |
| 9.4 Checks of `p_s^{(μ)}` | Taylor expansion of 13.24.3 with `c = 1 − 2μ`: coefficients `−z/6`, `z²/72 − c/6`, `−z³/1296 + z/90 + cz/36` | `p₁ = z²/6`, `p₂ = z⁴/72 − (1−2μ)z²/6`, `p₃ = z⁶/1296 + (μ − 7/10)z⁴/18` | README: the same | holds | — |
| 9.4, 13.26.1 at `2μ = m ∈ ℕ` | `(−2μ)_n Γ(1+2μ−n)` for `n > m` | finite nonzero limit | the literal finite sum drops these terms | excluding `2μ ∈ ℤ` is needed | — |
| Examples | 13.3.22 at `a=b=1`; 13.15.24 at `n=1, κ=½, μ=0`; 13.6.16 at `n=1`; 13.13.1 at `y=−x` | `e^zE₁ − 1/z`; `−e^{−z}`; `1 − 2z²`; 1 | same | hold | — |

## Not verifiable

- **Gautschi (1967, SIAM Rev.).** It supports only the minimal-solution route of 5.1. The text is paywalled and I did not open it; no statement depends on it.
- **Wimp (1965, Proc. AMS).** I checked the statement only as DLMF reports it (DLMF-13.9 lines 521–523), plus the numerical row above.
- **Tricomi (1954), Slater (1960), Buchholz (1969), Olver (1974), Temme (2015).** No sampled target cites a locator in them, so I did not open them.
- **DLMF §§13.4 and 13.7.** The sources service resolves both to figure files, so I read the conditions on the public pages. That reading does not show square roots or bold type, so the arguments `2√(zt)` of 13.4.3 and 13.4.7 and the choice between `M` and `𝐌` there are taken from the README and checked only for consistency (13.4.3 against the series, termwise).
- **The interior form of the parabolic zero-free regions for partial sums.** It has no source beyond DLMF's closed form. I checked only the vertex counterexample `1 + z` at `−1 ∈ P₁` this round.
- **Loop integrals 13.10.8–13.10.9 and the Hankel transforms of 8.2.** I checked hypotheses and branches against the text and by analyticity in `z`, not numerically.
- **Ownership against open pull requests.** I checked this through the `roadmaps grep` and `roadmaps show` index of 2026-11-09 and the heads named above.

## Source issues

- **Gap** in DLMF at §13.6(v), 13.6.18 (Release 1.2.8): the source gives `U(½ − ½n, 3/2, z²) = 2^{−n} z^{−1} H_n(z)` with no domain; it should require `−π/2 < ph z ≤ π/2` for even `n` (fails at `n = 2`, `z = −1`); affects a stated result.
- **Gap** in DLMF at §13.18(v), 13.18.14–13.18.16 (Release 1.2.8): the source gives no domain, and its principal `√z` differs from a power of `z²` when `Re z < 0`; it should require `−π/2 < ph z ≤ π/2`; affects a stated result.
- **Gap** in DLMF at §13.6(ii), 13.6.8 (Release 1.2.8): the source gives `U(½, ½, z²) = √π e^{z²} erfc z` with no domain; it should require `−π/2 < ph z ≤ π/2`, since principal `U` is even in `z` and `erfc` is not; affects a stated result.
- **Error** in DLMF at §13.9(i), 13.9.3–13.9.4 (Release 1.2.8): the source allows `a ≥ 0`; it should require `a > 0`, since `M(0, b, x) = 1` has no zero while 13.9.3 gives `1`; affects a stated result.
- **Error** in DLMF at §13.9(i), 13.9.6 (Release 1.2.8): the source requires only `⌈−b⌉ > ⌈−a⌉ > 0`; it should also exclude `a ∈ {−1, −2, …}` (at `a = −2`, `b = −4.5` it gives `1`, the count is `0`); affects a stated result.
- **Error** in DLMF at §13.9(i), last sentence (Release 1.2.8): the source says `M(a, b, z)` has finitely many `b`-zeros for fixed `a, z`; it should restrict to `|b + n| ≥ δ`, since `M(1, b, 1)` has a zero just below every large even `−n`; affects a stated result.
- **Error** in DLMF at §13.9(i), paragraph after 13.9.9 (Release 1.2.8): the source says the closed regions `P_α` are zero-free for the partial sums; it should say the interior, since `1 + z` vanishes at the vertex `−1 ∈ P₁` when `a = b = 1`; affects a stated result.
