# Review of SpecialFunctionsStruve (pull request #2129 at 9961786)

**Verdict:** needs changes

Previous findings: the previous review, of `83a3d1d`, had none; nothing to re-check. This is a full review of the reorganized folder.

## R01 (P2) — Parameter holomorphy of `𝐅₁₂` has a second owner

**Location:** `TauCetiRoadmap/SpecialFunctionsStruve/README.md` 97 and 334–339: "the holomorphy of `𝐅₁₂(b₁, b₂; x)` in the parameters (1.1)", listed under "Auxiliary results owned here".
**Claim:** The same object is owned by the open roadmap SpecialFunctionsGeneralizedHypergeometric, so it has two owners and neither cites the other.
**Witness:** Pull request #2136, `TauCetiRoadmap/SpecialFunctionsGeneralizedHypergeometric/README.md` 411–413 (1.3: `𝐅 = regularizedHGFun` for `p ≤ q`) and 422–428 (1.4: joint holomorphy in parameters and argument, `differentiableOn_regularizedGeneralizedHypergeometric`); `p = 1`, `q = 2` is this target.
**Repair:** Delete the bullet at 97 and the first bullet of 1.1 with its Check at 347–349. Add `### From SpecialFunctionsGeneralizedHypergeometric`: "1.3–1.4: `regularizedHGFun {1} {b₁, b₂} x` is jointly holomorphic in `(b₁, b₂, x)`. For 1.1–1.3." Put "SpecialFunctionsGeneralizedHypergeometric 1.3–1.4" in the `*Needs:*` of 1.2 and 1.3, change "six roadmaps" (53) to "seven", and name #2136 under the description's "Depends on". (That roadmap does not consume this one, so no cycle arises.)

## R02 (P2) — Statable headlines absent from `Suggested.lean`; the non-statable one is not named

**Location:** `TauCetiRoadmap/SpecialFunctionsStruve/README.md` 81–83: "it is not an exhaustive acceptance test, and the other headlines are targets of the same standing, stated in prose"; `Suggested.lean` 9–12: "the statements here are a selection of them".
**Claim:** The description names Lommel's recurrences (2.2), the `S_{0,ν}` integral (3.3) and Olver's uniform expansion (7.2) as headlines. The first two are statable with the file's own definitions and are absent; the third is not statable simply and the docstring does not say so.
**Witness:** Both statements below elaborate at the pins in a copy of the file (exit 0, 28 `sorry` warnings). Values: `S_{2.35,0.72}(1.9) = 1.5069370486 = 1.9^{1.35} − 1.3041 · 0.6683849031`; `S_{0,0.4}(1.3) = 0.6431285317` on both sides.
**Repair:** Add, in Layers 2 and 3:

```lean
/-- Lommel's recurrence in `μ` for `S_{μ,ν}`, at all parameters (2.2). -/
theorem lommelCapitalS_add_two (μ ν : ℂ) {z : ℂ} (hz : z ∈ slitPlane) :
    lommelCapitalS (μ + 2) ν z =
      z ^ (μ + 1) - ((μ + 1) ^ 2 - ν ^ 2) * lommelCapitalS μ ν z := by
  sorry

/-- `S_{0,ν}(z) = ∫₀^∞ e^{−z sinh t} cosh(νt) dt` for `Re z > 0` (3.3). -/
theorem lommelCapitalS_zero_eq_integral (ν : ℂ) {z : ℂ} (hz : 0 < z.re) :
    lommelCapitalS 0 ν z =
      ∫ t in Ioi (0 : ℝ), cexp (-z * Real.sinh t) * Complex.cosh (ν * t) := by
  sorry
```

Name them in 2.2 and 3.3 under *Suggested names*. Replace the docstring's "the statements here are a selection of them, and discharging them finishes neither a layer nor the roadmap" by: "Not statable at the pins: Olver's uniform expansion of 7.2, which needs the implicitly defined map `t(α, w)` and its Taylor coefficients `q_s(α)`." Replace README 81–83 by: "`Suggested.lean` states the headline theorems, each with every conclusion the README attaches to it; the uniform expansion of 7.2 is not statable at the pins and is named in its docstring."

## R03 (P3) — The Summary says the arrangement is that of two sources

**Location:** `TauCetiRoadmap/SpecialFunctionsStruve/README.md` 7–11: "Its organization follows the structure of the subject rather than any one text. … as Dingle (Ch. XVIII) and Magnus–Oberhettinger–Soni (§3.10.2) arrange them."
**Claim:** A roadmap does not say whose arrangement it follows or does not follow; the first sentence also answers a discussion a later reader cannot see.
**Witness:** The two quoted clauses at README 7–8 and 10–11; the order of 1.2–1.5 is not forced by the `*Needs:*` lines (1.3 needs only 1.1), so it is stated as taken from the sources.
**Repair:** Delete the first sentence and end the second with a plain citation: "…the Anger and Weber functions combine the cases `μ = 0` and `μ = −1` (Dingle, Ch. XVIII; Magnus–Oberhettinger–Soni, §3.10.2)."

## R04 (P3) — Description: "every headline cites them with printed pages"

**Location:** Pull request description, first paragraph: "The roadmap is synthesized from several sources, and every headline cites them with printed pages".
**Claim:** The head contradicts it: six headlines cite DLMF alone, with no printed page.
**Witness:** `README.md` 572 (`hasDerivAt_besselJ_struveH`), 658 (`struveH_relative_bound`), 807–808 (`struveH_mellinBarnes`), 1027 (`isBigO_weberE_large_order`), 1050 (`isBigO_struveK_scaled`), 1056 (`struveL_isEquivalent_besselI`).
**Repair:** Write "…and the headlines cite them with printed pages where a book states the result; six headlines (10.22.2, 11.4.14–11.4.15, 11.5.8, 11.6.6, 11.6.9, 11.11.6) rest on DLMF alone."

## Verified sound

| Statement | Instances and values computed | Result |
|---|---|---|
| 1.1 series, Check | `𝐅₁₂(3/2, 3/2; −1) = 0.5686566270 = 𝐇₀(1)`; `𝐅₁₂(·; 0) = 4/π` | agrees |
| 1.2 `s`, `S`, `a_k = 4ᵏ(a)ₖ(b)ₖ` | `s_{0.5,0.2}(1.3) = 0.5829001517`, `S = 0.8316246006`; `S_{−1,0}(1)`: `μ → −1` gives `0.44223650`, `ν → 0` gives `0.44223639` | agrees |
| 1.3 Struve functions (`hasSum_struveH`) | `𝐇₀(1) = 0.5686566270`, `𝐋₀(1) = 0.7102431859`, `𝐇_{0.3}(2+i) = 1.0479605148 + 0.2213705975i`; `𝐊₀(1) = 0.4803996628` | agrees |
| 1.4 equations (`struveH_ode`, `struve_general_solution`) | `ν = −½`: right side `0`, `𝐇_{−1/2}(1) = 0.6713967071 = (2/π)^{1/2} sin 1`; `ν = 0`: forcing `2/(πz)` | agrees |
| 1.5 Anger, Weber, `𝐀_ν` | `𝐉_{1/2}(1) = 0.8551653097`, `𝐄_{1/2}(1) = 0.0995075426`, `𝐀_{1/2}(1) = 0.1837686025`; `𝐀₁(1)`: limit `0.1467846936`, integral `0.1467846936` | agrees |
| 2.1 relations | `𝐄₁(1) = 0.4381624362 = 2/π − 𝐇₁(1)`; `S_{0,0}(1) = 0.7546100258 = (π/2)𝐊₀(1)`; `s_{ν,ν}`: `a = ½`, `b = ν + ½` | agrees |
| 2.2 recurrences (`struveH_recurrence`, Lommel) | `ν = 0`: `𝐇₋₁ + 𝐇₁ = 2/π`; `s_{2.35,0.72}(1.9) = 0.7058148349 = 2.378578 − 1.3041 · 1.2826953192` | agrees |
| 2.3 primitives (`hasDerivAt_besselJ_struveH`) | `ν = ½`: bracket `(2/π)^{1/2}(1 − cos z)`, derivative `z^{1/2}J_{1/2}`; 11.7.6 at `ν = 0`: both sides differentiate to `z𝐇₁` | agrees |
| 2.4 half-odd orders | `𝐋_{1/2}(1) = 0.4333156538`; 11.4.1 at `n = 1`: `(2/(πz))^{1/2}(z/2 + 1/z) = 𝐇_{3/2} − Y_{3/2}`; 11.10.19 at `0`: `2/π` | agrees |
| 2.6 bound (`struveH_relative_bound`) | `ν = 0, z = 1`: `ϑ = −0.10676 < 0.12091`; `ν = 1000`, `y²/4 = 1001.5`: `ϑ = 1.0294`, DLMF bound `0.6667`, corrected `1.1455` | corrected bound holds, DLMF's fails |
| 3.1 Poisson (`struveH_eq_integral`) | `ν = ½`: `(2z/π)^{1/2}(1 − cos z)/z`; `𝐌_{1/2}(1) = −0.5043592345 = −(2/π)^{1/2}(1 − e⁻¹)` | agrees |
| 3.2 Hankel representation | Wronskian `2/(πx)` gives the stated signs; `S_{0.2,0.3}(2) = 0.5337777882` | agrees |
| 3.3 (`struveK_eq_integral`, `angerWeberA_eq_integral`, `lommelCapitalS_eq_laplace`) | `𝐊₋₁(1)`: `−0.3430502` (limit) vs `−0.3430503851` (integral); `z = 0`, `Re ν > 0`: both sides `1/(πν)`; termwise Laplace gives `4ᵏ(a)ₖ(b)ₖ = a_k(−μ, ν)` | agrees |
| 3.4 Barnes (`struveH_mellinBarnes`) | residue of `π csc πs` at `k`: `(−1)ᵏ`; integrand `O(|y|^{−2−Re ν−2c})`, integrable iff `Re ν + 2c > −1`; clockwise, factor `−2πi` | agrees |
| 4.1 (`isBigO_lommelCapitalS_sub_sum`) | `S_{2,1}(2) = 2.000000001`; `μ = ν`: `F(½, ½−ν; ½; −t²) = (1+t²)^{ν−1/2}` | agrees |
| 4.2 (`isBigO_struveK_sub_sum`) | terms `(2/(πz))(1, −z⁻², 9z⁻⁴)`; at `z = 10`: `0.0630254`, `0.0630827` | agrees with README |
| 4.3 Anger–Weber | `F_k`: `(−4)(½−ν/2+j−1)(½+ν/2+j−1) = ν² − (2j−1)²`; first terms `1/(πz) − ν/(πz²)` from `e^{−ν asinh u}(1+u²)^{−1/2}` | agrees |
| 4.4 integrated | `∫₀⁸ 𝐌₀ + (2/π)(ln 16 + γ) = 0.005457`; first term `0.004974` | agrees |
| 5.1 (`integral_struveH_mul_struveH`) | `μ = ν = ½`: right side `1`; cross term `t^{−Re μ−3/2}` oscillatory, so `Re μ, Re ν > −3/2` is needed and suffices | agrees |
| 6.1 (`isBigO_weberE_large_order`) | `z = 1`, `ν = ½ + 10i`: error `· |ν|² = 1.05 × 10¹³`; divided by `e^{10π}`: `0.238` | corrected form holds |
| 6.2 (`isBigO_struveK_scaled`, `struveL_isEquivalent_besselI`) | `c₀ = 1`, `c₁ = 2λ⁻²` from `struveScaledCoeff`; `d = λ − t + t³/2 − …`; `u′ ≥ λ − 1 > 0` | agrees |
| 6.3 (`isBigO_angerWeberA_scaled`) | `λ = 0.1`: `θ = 0.5665`; `|𝐀_ν(λν)|` at `20e^{2.9i}`: `3.786 × 10⁹`; at `20e^{2.4i}`: `0.0144684` vs leading `0.0144686`; `(½)b₁ = −U₁(p)(1−λ²)^{−1/4}` | corrected sector confirmed |
| 7.1 (`isBigO_angerWeberA_transition`, `angerJ_self_isEquivalent`) | `𝐀₋₁₀(10) = 0.2366940285` vs `0.2397408488`; `|𝐉_ν(ν)|`/leading at `20e^{0.3i}`: `2.80 × 10⁶` | agrees |
| 7.2 uniform expansion | `Qi₀(0) = 0.4099510850`, `Qi₁(0) = 0.2988589049`, `Qi₂(0) = 0.3183098862`, `Qi₂(1.7) = 0.7086292570` both ways; `q₀ = 1.4238037975`; `𝐀₋₄₀(20) = 9.281227 × 10⁶` vs `9.276108 × 10⁶` | Checks agree; bound itself not verifiable (below) |
| Local copies in `Suggested.lean` | `besselY`, `besselI`, `scorerHi`, `fresnelC`, `eulerIntegral`, `IsEulerContinuation`, `gaussHypergeometric` against the suppliers' files | identical bodies (Gauss: two definitions merged) |

- Source locators checked against the text: 42 DLMF locators (11.4.14–15, 11.5.1–9, 11.6.1–9, 11.7.6–12, 11.9.5–9, 11.10.4, 11.10.22–23, 11.11.5–19) with their sectors and hypotheses, in the fetched DLMF-11.x texts; 0 book locators.
- DLMF's own source lines agree with these book pages: Olver pp. 84, 103, 274–277 (Ex. 15.5, p. 277), 352–360 (DLMF-11.6 line 60, DLMF-11.10 line 73, DLMF-11.11 lines 374, 833).
- Library: no Struve, Lommel, Anger or Weber function in the pinned Mathlib or Tau Ceti; the 13 `#check` lines elaborate.
- Cross-roadmap citations resolved: 45 section citations (SpecialFunctionsBessel at its open head 20; AsymptoticExpansions 12 with 7 declaration names; SpecialFunctionsHypergeometric 6; SpecialFunctionsAiry 3; SpecialFunctionsEiLiErfIncompleteGamma 2; ZerosOfLFunctions 2), all present.
- Gate: every check `0`, `build=0`. Dependency check: `depcheck: 254 roadmaps, 2401 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. Nothing changed outside the folder.
- Elaboration: exit 0, 26 `declaration uses sorry` warnings, no other message. The 46 elaborated signatures were compared with the README; no binder lost, nothing changed.
- Padding probe (`rfl`, `simp`, `infer_instance`, `exact Complex.hasSum_regularizedHGFun`): 0 of 26 theorems close.
- Overlap check: read SpecialFunctionsBessel, SpecialFunctionsGeneralizedHypergeometric, SpecialFunctionsAiry, SpecialFunctionsParabolicCylinder; shared: parameter holomorphy of `regularizedHGFun` for `p ≤ q` — owner SpecialFunctionsGeneralizedHypergeometric 1.4 (R01); Struve, Lommel, Anger–Weber functions — owner this roadmap (both open roadmaps say so).

Source independence: 7 passages compared with 1 source (DLMF Chapter 11), none shared; largest share DLMF, 83 of about 172 locators; contents compared with DLMF Chapter 11: independent (Layer 1 draws on §§11.2, 11.9, 11.10; Layer 2 on 11.4, 11.7, 11.9, 11.10; Layer 4 on 11.6, 11.9, 11.11; no layer maps to one section). The six books could not be read.

## Not verifiable

- Every page and equation locator into Olver, Magnus–Oberhettinger–Soni, Gradshteyn–Ryzhik, Dingle, Wong and Duverney: the sources service found no legal copy (two resolve only to paywalled pages).
- 7.2, the uniform bound with `C (1 + ζ)^{(N+1)/4} ν^{−(N+1)/3} Qi_N(y)` for all `α ≥ 0`, `ν > 0` (Olver (12.20), (12.23), §13.3): only its consistency with 6.3 and 7.1 was computed.
- The description's account of earlier local reviews and their finding counts.

## Source issues

- **Error** in DLMF-11.4 at 11.4.15, §11.4(ii) (DLMF-11.4 line 484): the source bounds `|ϑ|` by `(2/3)` times the exponential of `¼|z|²/|ν₀+3/2| − 1`; it should be `(2/3)(exp(¼|z|²/|ν₀+3/2|) − 1)`; affects a stated result.
- **Misprint** in DLMF-11.4 at the sentence after 11.4.15 (DLMF-11.4 lines 505–506): the source lists `|ν + 3/2|`, `|ν + 5/2|`, `|ν + 9/2|`, …; it should be `|ν + 3/2|`, `|ν + 5/2|`, `|ν + 7/2|`, …; affects nothing.
- **Error** in DLMF-11.7 at 11.7.6, §11.7(i): the source writes the last numerator as a principal power of `z²/2`; it should be `z^{2ν+2}/2^{ν+1}`, which differs where `|ph z| > π/2`; affects a stated result.
- **Error** in DLMF-11.7 at 11.7.12, §11.7(ii) (DLMF-11.7 line 413): the source requires only `Re(μ + ν) > 0`; it should also require `Re μ > −3/2` and `Re ν > −3/2`; affects a stated result.
- **Error** in DLMF-11.11 at 11.11.6, §11.11(ii) (DLMF-11.11 line 264): the source puts `O(ν^{−2})` in the bracket for complex `ν`; it should be `O(e^{π|Im ν|} ν^{−2})`; affects a stated result.
- **Error** in DLMF-11.11 at 11.11.8, §11.11(iii) (DLMF-11.11 line 355): the source gives the sector `|ph ν| ≤ π − δ` for every fixed `λ > 0`; it should be `|ph ν| ≤ π − arctan(−μ(λ)/π) − δ` for `0 < λ < 1`; affects a stated result.
- **Error** in DLMF-11.11 at 11.11.18–11.11.19, §11.11(iii) (DLMF-11.11 lines 847, 891): the source states them in `|ph ν| ≤ π − δ`; they should hold only as `ν → +∞` through real values; affects a stated result.

## For the human reviewers

- **Licence.** README 1286–1312 names the author's `lean-DLMF` (Apache-2.0) as prior formalization with a per-layer counterpart table; whether `Suggested.lean` is adapted from it, and the attribution owed, was not compared.
- **Not tested.** Wording and locators were compared with DLMF only; Olver, Magnus–Oberhettinger–Soni, Gradshteyn–Ryzhik, Dingle, Wong and Duverney (about 89 locators) could not be read. Target 7.2 rests on Olver, Ch. 9 §§12–13, alone.
- **Scope.** The supplier SpecialFunctionsBessel is the same author's open pull request #1987 and is not in the merge-order file; the dependency check passes with it.
