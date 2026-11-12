# Review of SpecialFunctionsGamma (pull request #2191 at 5d705b1)

**Verdict:** needs changes

## R01 (P3) — The new 5.9.18 route cites 5.9.16 for the integral of 5.9.14

**Location:** `TauCetiRoadmap/SpecialFunctionsGamma/README.md:757–758` "the integrals of `(1/(1 + t) − e^{−t})/t` and of `e^{−t}/(1 − e^{−t}) − e^{−t}/t` are 5.9.16 and 5.9.13 at `z = 1`, with `ψ(1) = −γ`."

**Claim:** At `z = 1` the integrand of 5.9.16 vanishes identically, so 5.9.16 gives `0 = ψ(1) + γ` and not the first integral. The integral of `(1/(1 + t) − e^{−t})/t` is 5.9.14 at `z = 1` (`README.md:730`, `Complex.digamma_eq_integral_one_add`).

**Witness:** The roadmap's own Check at `README.md:765` says "5.9.16 at `z = 1`: both integrals vanish". 5.9.14 at `z = 1` gives `∫₀^∞ (e^{−t} − 1/(1 + t))/t dt = −0.57721566490153 = ψ(1)`.

**Repair:** "… `e^{−t}/(1 − e^{−t}) − e^{−t}/t` are 5.9.14 and 5.9.13 at `z = 1`, with `ψ(1) = −γ`."

## R02 (P3) — The 4.4 *Needs:* line omits the input of the new route

**Location:** `README.md:760–762` "*Needs:* AnalyticNumberTheoryPartI §1.8a; AsymptoticExpansions 4.1; Mathlib `Real.eulerMascheroniConstant_eq_neg_deriv`, the cotangent partial fractions `cot_series_rep`, `hasDerivAt_integral_of_dominated_loc_of_deriv_le`."

**Claim:** The route at `README.md:754–756` now starts from the first equality of 5.9.18, which is an input. The *Needs:* line does not list it. The old route derived it from 5.9.19 and `Γ′(1) = −γ`.

**Witness:** `README.md:111–112` and `:294` name the input `Real.eulerMascheroniConstant_eq_neg_integral_log`. It is at Mathlib `NumberTheory/Harmonic/GammaDeriv.lean:97` and is absent from lines 760–762.

**Repair:** "*Needs:* AnalyticNumberTheoryPartI §1.8a; AsymptoticExpansions 4.1; Mathlib `Real.eulerMascheroniConstant_eq_neg_integral_log`, `Real.eulerMascheroniConstant_eq_neg_deriv`, the cotangent partial fractions `cot_series_rep`, `hasDerivAt_integral_of_dominated_loc_of_deriv_le`."

## Previous findings

- R01 — repaired: `README.md:58–59` "(DLMF §§5.7–5.8 without 5.7.6 on `Re z > 0`, 5.8.1, 5.8.2 and 5.8.3), and DLMF 5.15.1."; `:164–166` "…the continued fraction of §5.10, the Weierstrass product 5.8.2, the decimal values 5.4.7–5.4.10 and the extrema 5.4.20."
- R02 — repaired: the description's **Build.** reads "with `sorry` as the only warning (73 theorems)". `Suggested.lean` has 73 `theorem`s, and `lake env lean` gives 73 `sorry` warnings.

## Verified sound

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| 4.4 route, 5.9.18 by parts on `(0, 1)` (changed) | antiderivative `1 − e^{−t}` | `∫₀¹ e^{−t} log t = −0.79659959929705` / `−∫₀¹ (1 − e^{−t})/t = −0.79659959929705`; boundary term `−1.8·10⁻⁷` at `t = 10⁻⁸`, `0` at `t = 1` | holds |
| 4.4 route, 5.9.18 by parts on `(1, ∞)` (changed) | antiderivative `−e^{−t}` | `∫₁^∞ e^{−t} log t = 0.21938393439552` / `∫₁^∞ e^{−t}/t = 0.21938393439552`; boundary term `0` at `1`, `e^{−50} log 50 = 7.5·10⁻²²` | holds |
| 5.9.14 `digamma_eq_integral_one_add` (R01) | `z = 1` | `∫₀^∞ (e^{−t} − 1/(1 + t))/t = −0.57721566490153` / `ψ(1) = −0.57721566490153` | holds; it gives the route's integral |
| 5.9.16 `digamma_add_eulerMascheroni` (R01) | `z = 1` | integrand `(e^{−t} − e^{−t})/(1 − e^{−t}) ≡ 0`, integral `0` / `ψ(1) + γ = 0` | holds; it does not give the route's integral |
| 5.9.13 `digamma_eq_log_add_integral` (changed route) | `z = 1` | `log 1 + ∫₀^∞ (1/t − 1/(1 − e^{−t}))e^{−t} = −0.57721566490153` / `ψ(1)` | holds |
| 4.4 `eulerMascheroni_eq_integrals`, with Mathlib's first equality | the four integrals | `0.57721566490153` (Mathlib's), `0.57721566490153`, `0.57721566490153`, `0.57721566490153` / `γ = 0.57721566490153` | holds |
| Scope items 1–2 and the boundary sentence (changed) | 5.8.2 at `z = 1`, as GlobalHolomorphicFunctions 6.1 states it | `e^{γ}(N + 1)e^{−H_N}` at `N = 10⁶`: `1.0000005` / `1/Γ(1) = 1`; the owner is on main (`README.md:1873–1875` there) | holds; not owned here |
| From Mathlib, `Complex.Gamma_nat_eq_factorial` (added) | `n = 0…3` | `Γ(n + 1) = 1, 1, 2, 6` / `n! = 1, 1, 2, 6`; at `Gamma/Basic.lean:325`, in namespace `Complex` | holds |

All other rows stand as in the previous review, of `64d932a`.

- Gate:
  - The worker's run reports every check 0, the build included.
  - My run reports the same except `depcheck: NOT IN ORDER`. The configured order lacks this roadmap; the candidate order lists it at line 277, right after ExplicitNumberFields.
  - The dependency check with the candidate order gives "depcheck: 206 roadmaps, 1899 edges, 0 problem(s)".
  - Nothing changed outside the folder.
- Elaboration: `lake env lean` of `Suggested.lean` gives 73 `sorry` warnings and nothing else. The file has 73 theorems and 6 definitions, and is unchanged since `64d932a`.
- Pinned Mathlib declarations opened:
  - `Complex.Gamma_nat_eq_factorial` (`Analysis/SpecialFunctions/Gamma/Basic.lean:325`);
  - `Real.eulerMascheroniConstant_eq_neg_deriv` and `Real.eulerMascheroniConstant_eq_neg_integral_log` (`NumberTheory/Harmonic/GammaDeriv.lean:92`, `:97`);
  - `Complex.digamma_one` (`Analysis/SpecialFunctions/Gamma/Digamma.lean:56`).
- Cross-roadmap citations resolved:
  - GlobalHolomorphicFunctions 6.1 on main, for 5.8.2;
  - ExplicitNumberFields 1.1a at its open head (`README.md:1315`);
  - ExplicitZetaBounds 1.1–1.3, 2.4 and 2.5 at its open head (`README.md:832`, `857`, `881`, `1028`, `1046`);
  - AnalyticNumberTheoryPartII `barnesG` at its open head (`Suggested.lean:138`).
- Description: checked against this head. The counts (73 theorems, 6 definitions), the eight layers, the suppliers, the list under "Outside the roadmap" and the overlaps all match the head. No sentence is contradicted.
- Seeded sample: none of the sampled targets falls in the changed passages (the scope list, the boundary sentence, the Mathlib contract and the 4.4 route).
- Overlap check: read SpecialFunctionsGeneralizedHypergeometric, SpecialFunctionsStruve, SpecialFunctionsBessel, SpecialFunctionsConfluent, SpecialFunctionsAppell, SpecialFunctionsHypergeometric, SpecialFunctionsAiry, SpecialFunctionsParabolicCylinder and SpecialFunctionsEiLiErfIncompleteGamma.
  - These lists are unchanged since `b0ab817`, when their scope was read.
  - Shared objects and their owners:
    - 5.12.3 for complex parameters and 5.13.3: SpecialFunctionsHypergeometric 6.3;
    - 5.4.3 and 5.8.3: SpecialFunctionsParabolicCylinder 6.6(a);
    - 5.5.6 at `n = 3`: SpecialFunctionsAiry 7.1 (this roadmap proves the general case).
  - The change adds no object, and no open pull request changes this roadmap or drops an id it cites.
- Remark on untouched text, no change asked: scope item 1 still counts 5.4.3 (SpecialFunctionsParabolicCylinder 6.6(a)), and item 2 counts all of 5.15.1, although ExplicitNumberFields 1.1a supplies it on `Re z > 0`. Item 2 excludes the consumed 5.8.3 and 5.7.6 on `Re z > 0`.

## Not verifiable

- DLMF §5.9 (5.9.13–5.9.18, which the changed route numbers): the sources service again resolves `https://dlmf.nist.gov/5.9` to the Figure 5.9.1 PDF. R01 rests on the README's own numbering (`README.md:728–736`), the docstrings of `Suggested.lean` and the values above.
- Widder, *The Laplace Transform* (1941); Titchmarsh, *The Theory of Functions* (1939); Andrews–Askey–Roy, *Special Functions* (1999); Temme, *Special Functions* (1996): the change touches none of their passages. They are not verifiable, for the reasons given at `b0ab817` and `64d932a`.

## Source issues

- none
