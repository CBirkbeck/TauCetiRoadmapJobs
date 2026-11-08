# Review of SpecialFunctionsConfluent (pull request #1995 at 948a9c2)

**Verdict:** needs changes

The push gate fails (`tex=7`, `statement-hygiene=2`; R05, R06), so this folder cannot be accepted in this round whatever else is fixed. There are 12 findings: 1 P1, 3 P2 and 8 P3.

## R01 (P1) — The Layer 8 example for 13.10.11 is false

**Location.** `TauCetiRoadmap/SpecialFunctionsConfluent/README.md:927`: "13.10.11 at `a = b = 1`: `∫₀^∞ t^{λ−1} e^t E₁(t) dt = Γ(λ) Γ(1 − λ)` for `0 < Re λ < 1`."

**Claim.** The README treats its `### Examples` as targets to prove (README line 393). This one is false. DLMF 13.10.11 has right side `Γ(λ)Γ(a−λ)Γ(λ−b+1)/(Γ(a)Γ(a−b+1))`. At `a = b = 1` the factor `Γ(λ−b+1)` equals `Γ(λ)`, so the value is `Γ(λ)² Γ(1−λ)`.

**Witness.** At `λ = ½` the integral equals `π^{3/2} = 5.56833` (quadrature: 5.5683279968), but the README's value is `π = 3.14159`. At `λ = 0.3`: quadrature 11.61693, `Γ(λ)²Γ(1−λ)` = 11.61693, README 3.88322. The closed form follows from `e^tE₁(t) = ∫₀^∞ e^{−tu}(1+u)^{−1}du` and Fubini, which give `Γ(λ)·π/sin πλ`.

**Repair.** Replace the right side with `Γ(λ)² Γ(1 − λ)`, equivalently `π Γ(λ)/sin(πλ)`. Recomputed at `λ = ½`, this gives 5.56833, which matches the quadrature.

## R02 (P2) — Kummer's `U` has a second owner: QuantumFoundations §9.4

**Location.** `TauCetiRoadmap/SpecialFunctionsConfluent/README.md:176`: "No open roadmap pull request specifies Kummer's `U` or the Whittaker functions of DLMF Chapter 13". The same object is owned here in Layers 1–3 and 6.1 (`kummerULog`, `kummerU`, 13.2.9–13.2.11, 13.2.34, 13.2.41, 13.3.7, 13.7.3).

**Claim.** QuantumFoundations is an open new-roadmap pull request (#1771) at merge-order line 208; this roadmap is at line 396. Its §9.4 constructs the same function and states the same formulas. RelativisticQuantumFieldTheory (#1772, line 210) consumes that §9.4 interface. That gives one object two owners. The README sentence above is also untrue as written, and it is process narrative ("open … pull request").

**Witness.** `TauCetiRoadmap/QuantumFoundations/README.md:997` at #1771 says: "Construct Tricomi's `U(a,b,z)` … on the principal slit plane and then on the logarithmic cover … extend … to entire dependence on `a,b`; prove the Wronskian … (DLMF 13.2.34), the connection formula … (DLMF 13.2.41) … (DLMF 13.2.9–13.2.11) … `U ~ z^(−a)` for `|arg z| ≤ 3π/2 − δ` (DLMF 13.7)". The same §9.4 also proves 13.6.19, the Laguerre comparison, which this README defers.

**Repair.** Settle one owner and say so under `## Scope and ownership`:
- (a) Under the rule (owner earliest in the merge order), consume QuantumFoundations §9.4 for the definition of `U` on the logarithmic cover and for 13.2.9–13.2.11, 13.2.34, 13.2.41, 13.3.7 and the 13.7 asymptotic. Keep here only what §9.4 does not state, plus one comparison target identifying `kummerULog` with §9.4's `U`.
- (b) Alternatively, arrange that QuantumFoundations §9.4 cites this roadmap's Layers 1–3 and 6.1, with this roadmap and its suppliers placed before QuantumFoundations in the merge order.

In either case, replace the README line 176 sentence (and the matching paragraph of the pull-request description) with the settled ownership.

## R03 (P2) — Sturm comparison is owned twice (SpecialFunctionsBessel, a supplier)

**Location.** `TauCetiRoadmap/SpecialFunctionsConfluent/README.md:147`, auxiliary-results row "Sturm comparison on an open interval `I ⊆ ℝ`: for `p > 0` of class `C¹` and continuous `q₁ ≤ q₂` … | 7.1". Lines 64–66 also claim it as built here.

**Claim.** SpecialFunctionsBessel (#1987), which this roadmap already consumes, owns the same result word for word, so the result has two owners.

**Witness.** `TauCetiRoadmap/SpecialFunctionsBessel/README.md:147` at #1987 has an identical row, "Sturm comparison on an open interval `I ⊆ ℝ`: for `p > 0` of class `C¹` and continuous `q₁ ≤ q₂`, … simple and isolated | 7.1". `roadmaps grep 'Sturm comparison'` finds no other owner.

**Repair.**
- Delete the row from this roadmap's auxiliary table and the phrase "Sturm comparison" from lines 64–66.
- In 7.1's `*Needs:*` and under `### From SpecialFunctionsBessel`, cite "SpecialFunctionsBessel 7.1 (auxiliary: Sturm comparison)".

The continuity-of-zeros row (README 148) has no other owner and stays.

## R04 (P2) — The continued fractions are statable at the pins but the docstring says they are not

**Location.** `TauCetiRoadmap/SpecialFunctionsConfluent/Suggested.lean:15–17`: "the continued fractions of 5.1 need `contFrac` of SpecialFunctionsEiLiErfIncompleteGamma §4.1".

**Claim.** The file names 13.5.1 as a headline that cannot be stated. But Mathlib's `GenContFract` (`Mathlib/Algebra/ContinuedFractions/Basic.lean:109`, with `convs` at :320) states it directly. The README's own Mathlib contract (README 375) already lists `GenContFract`. So a statable headline is absent.

**Witness.** This statement elaborates at the pins, in a scratch copy of the file, with only a `sorry` warning:
```lean
theorem tendsto_convs_regularizedHGFun_div {a b : ℂ} (hb : ∀ n : ℕ, b ≠ -n) {z : ℂ}
    (hz : 𝐌(a + 1, b + 1) z ≠ 0) :
    Tendsto (fun n => (⟨1, Stream'.Seq.ofStream fun k : ℕ =>
        ⟨(if k % 2 = 0 then (a - b - (k / 2 : ℕ)) else (a + ((k + 1) / 2 : ℕ))) /
          ((b + k) * (b + k + 1)) * z, 1⟩⟩ : GenContFract ℂ).convs n) atTop
      (𝓝 (𝐌(a, b) z / (b * 𝐌(a + 1, b + 1) z))) := sorry
```
Its partial numerators are `u_{k+1} z` from 13.5.2. The terminating case `a = −2, b = ½, z = 1` gives `−5` on both sides (`M(−2,½,1)/M(−1,3/2,1) = −1.6667/0.3333`).

**Repair.**
- State 13.5.1 in `Suggested.lean` in this form.
- Delete the "continued fractions" clause from the module docstring.
- Name the new theorem at 5.1 in the README.

## R05 (P3) — Gate `tex`: code spans broken across lines

**Location.** `TauCetiRoadmap/SpecialFunctionsConfluent/README.md:382–383` (`` `z^{1−b} 𝐌(a − b + 1,`⏎`2 − b, z)` ``) and 494–495 (`` `M_{0,1/2}(z e^{πi}) = … =`⏎`−M_{0,1/2}(z)` ``).

**Claim.** The gate reads each line separately, so the `_{`/`^{` parts of these spans count as bare TeX. Seven hits; the gate fails.

**Witness.** Gate output: `tex: line 383 …`, `tex: line 494 …` (×4), `line 495` (×2).

**Repair.** Re-wrap each paragraph so that every code span starts and ends on the same line. The mathematics does not change.

## R06 (P3) — Gate `statement-hygiene`: choice in the bodies of `kummerULog` and `besselK`

**Location.** `TauCetiRoadmap/SpecialFunctionsConfluent/Suggested.lean:76–77` (`(-1 : ℂ) ^ h.choose * deriv …`) and 117–118 (`(-1 : ℂ) ^ (h.choose - 1) / 2 * …`).

**Claim.** Both bodies use a chosen integer, which the rule forbids. The integer is not needed: at `b = n ∈ ℤ`, `(−1)ⁿ = cos πb`.

**Witness.** Gate: "line 77: P3 def `kummerULog` chooses its datum (`h.choose`)", and "line 118 … `besselK`".

**Repair.**
- In `kummerULog`, replace `if h : ∃ n : ℤ, (n : ℂ) = b then (-1 : ℂ) ^ h.choose * …` with `if ∃ n : ℤ, (n : ℂ) = b then Complex.cos (π * b) * …`.
- In `besselK`, replace `(-1 : ℂ) ^ (h.choose - 1) / 2` with `-Complex.cos (π * ν) / 2`. Make the same change in the README Conventions wording.

A scratch copy with both edits elaborates with no error and no `.choose` in any definition.

## R07 (P3) — 16 declarations of `Suggested.lean` are not named in the README

**Location.** README layers 1–10, compared with `Suggested.lean`.

**Claim.** Every Lean name must appear in the README. These do not: `kummerUBracket`, `kummerUBracket_intCast`, `kummerULog_intCast_add_two_pi_mul_I`, `differentiable_regularizedWhittakerMLog`, `tendsto_kummerU_nhdsWithin_zero`, `whittakerW_eq_whittakerM_add`, `kummerU_sub_one_add`, `regularizedHGFun_eq_integral`, `regularizedHGFun_neg_eq_barnes_integral`, `isBigO_regularizedHGFun_sub_sum_cobounded`, `kummerU_ne_zero`, `integral_cpow_mul_regularizedHGFun_neg`, `kummer_quadratic_relation`, `airyAi_eq_whittakerW`, `besselK_eq_kummerU`, `parabolicCylinderU_eq_whittakerW`.

**Witness.** A word-boundary search of README.md for each of these names returns 0 hits. The other 35 names are present.

**Repair.** Add each name in parentheses at its target, as the README already does for the others:
- 1.1: bracket and its vanishing.
- 1.4: integer form.
- 1.5: entire `𝐌_{κ,μ}`.
- 2.1: 13.2.20/13.2.22.
- 2.4: 13.14.33.
- 3.1: 13.3.7.
- 4.1: 13.4.1.
- 4.3: 13.4.16.
- 6.3: 13.8.1.
- 7.2: Wimp.
- 8.1: 13.10.10.
- 9.2: 13.12.1.
- 10.2: 9.6.21, 10.39.6, 12.7.14.

## R08 (P3) — Whittaker Checks: one is mislabelled and does not tell `κ` from `μ`; `buchholzCoeff` has none

**Location.** `TauCetiRoadmap/SpecialFunctionsConfluent/README.md:493`: "`W_{0,1/2}(1) = e^{−1/2}` … (13.18.2 at `κ = ½`, through `U(0, 2, z) = 1`)". Also 9.1, README 954–955.

**Claim.**
- The cited route is wrong. 13.18.2 at `κ = ½` gives `W_{½,0}(z) = e^{−z/2}z^{½}`. `W_{0,½}` is 13.18.2 at `κ = 0`. And `W_{0,½}(z) = e^{−z/2} z U(1, 2, z)` involves `U(1,2,z) = z^{−1}`, not `U(0,2,z)`.
- At `z = 1` the two functions agree, so the Check cannot catch a `κ ↔ μ` swap, the likeliest wrong definition.
- The Whittaker definitions have only two Checks, and the definition `buchholzCoeff` has none.

**Witness.** `W_{0,½}(1) = 0.6065306597 = W_{½,0}(1)`. At `z = 2`: `W_{0,½}(2) = 0.3678794412 = e^{−1}`, but `W_{½,0}(2) = 0.5202600950 = √2 e^{−1}`.

**Repair.**
- Replace the Check with "`W_{0,½}(2) = e^{−1}` (13.18.2 at `κ = 0`, through `U(1, 2, z) = z^{−1}`), while the swapped `W_{½,0}(2) = √2 e^{−1}`".
- Add a third Whittaker Check, for example 13.18.1 `M_{0,½}(2z) = 2 sinh z` at `z = 0.6+0.3i`, both sides `1.2164368+0.7006579i`.
- Add `buchholzCoeff` Checks: `A₃ = (2a − b)/3` and `A₄ = b(b + 2)/8`. Both were recomputed from the Lean recursion at `a = 0.3+0.1i`, `b = 1.7`: `A₃ = −0.36667+0.06667i`, `A₄ = 0.78625`.

## R09 (P3) — The Mathlib contract cites the Gauss function for 13.23.9–13.23.12, which contain none

**Location.** `TauCetiRoadmap/SpecialFunctionsConfluent/README.md:361–364`: `regularizedGaussHGFun` "for the terminating and in-disk Gauss values of 13.14.6, 13.23.1 and 13.23.9–13.23.12".

**Claim.** DLMF 13.23.9–13.23.12 are Hankel transforms whose right sides are Whittaker functions. No `₂F₁` appears in them, so the supplier is cited for statements it does not make.

**Witness.** In DLMF §13.23 (fetched text), lines 411, 441, 472 and 502 hold 13.23.9–13.23.12, and none of them contains `F12` or `𝐅`. The only `₂F₁` values are in 13.23.1 and 13.23.4.

**Repair.** Change "13.23.1 and 13.23.9–13.23.12" to "13.23.1".

## R10 (P3) — A sentence relies on an unpublished draft

**Location.** `TauCetiRoadmap/SpecialFunctionsConfluent/README.md:846–847`: "The NIST draft of §13.9 dated 2026-11-06 adds this hypothesis; it keeps `a ≥ 0` in 13.9.3 and 13.9.4".

**Claim.**
- The draft is not in `## References` and cannot be read.
- The dated mention is process narrative.
- The corrected target does not need it: the README's own counterexample, `M(−1, −3/2, x) = 1 + 2x/3`, settles it.

**Witness.** The live DLMF §13.9 (Release 1.2.8, 2026-09-15) still prints `⌈−b⌉ > ⌈−a⌉ > 0` for 13.9.6, at DLMF-13.9 line 201.

**Repair.** Delete the sentence.

## R11 (P3) — Laguerre material: an existing open roadmap is described as "planned", and its orthogonality is restated

**Location.** `TauCetiRoadmap/SpecialFunctionsConfluent/README.md:149`: "… the polynomials `M(−n, b, ·)` are orthogonal for the weight `x^{b−1} e^{−x}` …". Also README 1056–1058, which places 13.6.19–13.6.20 under "Planned for follow-up roadmaps".

**Claim.** LaguerreJacobi is an open new-roadmap pull request (#117). It owns `L_n^{(α)}` and its orthogonality for `α > −1`, which is the claim restated here (with `α = b − 1`). The README should cite that roadmap instead of describing it as planned.

**Witness.** `TauCetiRoadmap/LaguerreJacobi/README.md` at #117 has A1 (`Polynomial.laguerre`) and B3 (`integral_laguerre_mul_laguerre_laguerreMeasure`, "for `-1 < α` … `if m = n then Real.Gamma (n + α + 1) / n ! else 0`").

**Repair.**
- In the line 149 row, keep the zero count as this roadmap's auxiliary target, but cite LaguerreJacobi B3 (with 13.6.19) for the orthogonality.
- In `## Beyond this roadmap`, name LaguerreJacobi as the owner of 13.6.19–13.6.20 instead of a planned Chapter 18 roadmap.

## R12 (P3) — Two statements are narrower than the source

**Location.**
- `TauCetiRoadmap/SpecialFunctionsConfluent/Suggested.lean:196`, `tendsto_kummerU_nhdsWithin_zero … (hb : b.re < 1) (hb0 : b ≠ 0)`.
- README 778–779: "`U` is the only solution of 13.2.1 with `U(a, b, z) ∼ z^{−a}` along the positive axis, when `a ∉ {0, −1, …}`".

**Claim.** Both statements hold without the extra hypothesis:
- At `b = 0`, DLMF 13.2.21 gives `U(a,0,z) → 1/Γ(a+1) = Γ(1−0)/Γ(a−0+1)`.
- The pair `U`, `e^z U(b−a, b, e^{πi}z)` always has the nonzero Wronskian `e^{(a−b)πi} z^{−b} e^z` (13.2.38), and the second solution dominates on the positive axis. So uniqueness holds for every `a`, including `a = −m`, where `M(−m, b, ·)` is proportional to `U` (13.2.7). DLMF states it without restriction.

**Witness.** At `a = 0.7`, `b = 0`, `z = 10⁻⁵`: `U = 1.1004615`, against `1/Γ(1.7) = 1.1005474`, with the `O(z ln z)` error of 13.2.21.

**Repair.**
- Drop `hb0`, and cite 13.2.20–13.2.22 in the docstring and the README.
- Drop "when `a ∉ {0, −1, …}`" at README 779.

## Verified sound

**Gate and dependency check.** The gate at 948a9c2 fails only on `tex=7` and `statement-hygiene=2`. Every other counter is 0, including `stray-files`, `outside-folder` and `depcheck`. The pull request changes nothing outside `TauCetiRoadmap/SpecialFunctionsConfluent/`. The dependency check reports `depcheck: 239 roadmaps, 2349 edges, 0 problem(s)`: no UPWARD or CYCLE line.

**Lean.**
- `lake env lean` on `Suggested.lean`: 14 s, 38 warnings, all `declaration uses 'sorry'`. No `set_option`, a single `import Mathlib` plus three existing `TauCeti.*` modules, and no sorry'd data.
- A `#check @name` file for all 51 declarations elaborates. The types match the README statements, and no section binder is lost.
- One-tactic probe (`rfl | simp | norm_num | infer_instance | aesop`) on a scratch copy: all 38 theorems remain unsolved, so none is padding by that test.
- The four roadmap-local copies agree verbatim with the suppliers' pinned definitions: `besselI` and `besselK` with SpecialFunctionsBessel `Suggested.lean:80,85`, `airyAi` with SpecialFunctionsAiry `:64`, and `parabolicCylinderU` with SpecialFunctionsParabolicCylinder `:73,77,108` (inlined).
- Fully qualified names differ from all of them, because the namespaces differ.

**Library declarations opened at the pins (11, plus the 30 `#check`s that pass).**
- Mathlib:
  - `GenContFract` (`Algebra/ContinuedFractions/Basic.lean:109`) and `convs` (:320).
  - `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` (`Analysis/Analytic/Uniqueness.lean:224`).
  - `mellin` (`Analysis/MellinTransform.lean:91`).
  - `Complex.besselJ_def` (the `𝐅` form, used by my numerics).
- Tau Ceti:
  - `Complex.hasSum_regularizedHGFun` (`Analysis/SpecialFunctions/RegularizedHypergeometric.lean:53`) and `regularizedHGFunCoeff_zero_singleton` (:47).
  - `Real.besselI` (`BesselI.lean:81`, real order and argument only).
  - `TauCeti.Contour.residue` (`Contour/Residue/Basic.lean:80`, namespace :72).
  - `TauCeti.Real.erfc` and `TauCeti.lowerIncompleteGamma`.
- No `U`, Tricomi or Whittaker function exists at either pin (grep).

**Cross-roadmap citations resolved at the open heads (all present).**
- AsymptoticExpansions: §4.2 (README:553), §4.3 (563), §8.1 (905), §8.2 (920), §8.6 (1053), §10.2 (1202), §10.3 (1212), §10.4 (1230), and `Asymptotics.HasAsymptoticExpansion` (126).
- SpecialFunctionsParabolicCylinder §§1.1–1.6 (309–362). The four `𝐌` lemma names are at its `Suggested.lean:53–67`. Its §1.6 is the `a = −n` polynomial case, so 13.2.5 is not owned twice.
- SpecialFunctionsEiLiErfIncompleteGamma: §2.2 (586), §4.1 (701), §11.4 (1309). The names `TauCeti.Complex.upperIncompleteGamma`, `upperIncompleteGammaLog`, `iteratedErfc`, `expIntegralE` and `sinIntegralAuxF/G` are all in its Conventions. It defers 6.11.2–3, 7.11.5, 7.18.10, 8.5.3–5 and 8.19.16 to this roadmap (1657).
- SpecialFunctionsBessel: §4.3 holds 10.39.5 (785), §3.1 holds 10.32.9 (731). It defers 10.16.6–8, 10.39.6–8, 9.6.21–24 and 12.7.14 to a Chapter 13 roadmap (1474–1478).
- SpecialFunctionsAiry names `TauCeti.airyAi`/`airyBi` (145).

Ownership was searched across the 466 open pull requests (`roadmaps grep`) by object (Kummer `U`, Tricomi, Whittaker, Sturm comparison, Laguerre). The only second owners are those in R02, R03 and R11.

**Source sample (DLMF, Release 1.2.8, read at dlmf.nist.gov).** Every seeded target was checked against the text, its hypotheses and the README statement:
- 1.2: the bases follow from 13.2.33–13.2.34, which are nonzero iff `b ∉ ℤ` and `a ∉ −ℕ`, respectively.
- 1.3: 13.2.5 and 13.2.7–13.2.11, with the conditions of 13.2.9 (`a ∉ −ℕ`) and 13.2.10 (`a = −m`).
- 1.4: 13.2.12.
- 1.5: 13.14.1–13.14.13, including the 13.14.7 limit. The Check is in R08.
- 2.1: the 13.2.13–13.2.22 case split, and 13.2.19 at `a = 1` gives `−ln z − γ`. See R12.
- 2.2: 13.2.24–13.2.38.
- 3.1: 13.3.22 (text) and 13.3.7 (numeric).
- 4.1: 13.4.1–13.4.7 conditions.
- 4.4: 13.16.5 (`Re μ + ½ > Re κ`, `|ph z| < π/2`) and 13.16.10–13.16.12 (13.16.11 in `|ph z| < 3π/2`).
- 5.1: 13.5.1–13.5.4 and 13.17.1–13.17.4. The README drops DLMF's `a ∉ {−1,−2,…}` and `a − b ∉ ℕ`. That is harmless, because those cases terminate (checked at `a = −2`, `b = ½`, and `a = b`).
- 5.3: 13.18.1–13.18.16.
- 6.1: 13.2.6, 13.7.3, 13.14.21 and 13.19.3, all in `|ph z| ≤ 3π/2 − δ`.
- 6.3: 13.8.1 is stated in DLMF for `|b + n| ≥ δ`, the same region as the Lean statement; 13.20.1 for `|ph μ| ≤ π/2 − δ`, bounded `|z|`.
- 7.1: 13.9.1–13.9.7 as printed. The README's corrections are confirmed (table).
- 8.3: 13.23.1–13.23.12 hypotheses (13.23.1 is in the disk since `Re z > ½`). See R09.

The README flags no locator as unverified. Also checked analytically: the contours of 4.2 for 13.4.9 and 13.4.10. With the README's choices — `ph(t−1) = −π` on the outgoing segment, and `ph t = 0 → 2π` — collapsing the loops returns exactly `𝐌(a,b,z)`. Starting 13.4.9 at `ph(t−1) = +π` would instead introduce a factor `e^{2πi(b−a)}`.

**Adversarial table** (pure-Python complex arithmetic: Lanczos Γ, series, tanh-sinh quadrature; integer-`b` derivatives by Richardson; agreement to about 1e-9 unless stated).

| Statement | Instance | Left side | Right side | Result | Change |
|---|---|---|---|---|---|
| `kummerULog`/`kummerU` def, 1.1 Checks | `U(1,1,1)`; `U(½,½,1)` | 0.5963473623; 0.7578721561 | `eE₁(1)` = 0.5963473623; `√π e erfc 1` = 0.7578721561 | holds | — |
| 1.1 integer-`b` form | `U(0.3,2,1.7)`, `U(1.2,0,0.8)`, `U(0.7,−1,2.5)` | 0.9498530204, 0.3574093373, 0.3322969198 (derivative form) | average at `b ± 10⁻³`: 0.94985306, 0.35740939, 0.33229693 (O(h²)) | holds; `(−1)ⁿ` needed | — |
| `kummerUBracket_intCast` | `n = 1`; `n ≥ 2` and `n ≤ 0` via 13.2.5 | `𝐌/Γ(a) − 𝐌/Γ(a)` | 0, and `(a−n+1)_{n−1}/Γ(a) = 1/Γ(a−n+1)` | holds | — |
| `regularizedHGFun_neg_nat` (13.2.5) | `𝐌(1,−10,1)` | 2.7182818285 | `(1)₁₁·𝐌(11,12,1)` = e | holds | — |
| `kummerU_neg_nat` | `m = 1` | `U(−1,b,z)` | `z − b`; single-valued across sheets (`Γ(1−b)/Γ(1−m−b) = (−1)^m(b)_m`) | holds | — |
| 13.2.12 (`kummerULog_add_two_pi_mul_I`) | `a=0.3, b=0.45, z=1.1+0.7i, m=1` | 3.9363968583+4.0373700133i | 3.9363968583+4.0373700133i | holds | — |
| 13.2.12 integer form | `b = 2` (and `b = −1, 0, 1, 3`) | 1.2658113702−1.9838414486i | 1.2658113704−1.9838414490i (others: diff ≤ 6e-10) | holds | — |
| 13.2.12 sanity | `U(1,1,ze^{2πi})` | 12.62596495−14.63621213i | `U − 2πi e^z` = 12.62596495−14.63621213i | holds | — |
| `tendsto_kummerU_nhdsWithin_zero` | `a=0.7, b=−0.6`; `a=0.7, b=0`; `z=10⁻⁵` | 0.7658317; 1.1004615 | 0.7658406; 1.1005474 | holds, also at `b = 0` | R12 |
| 13.2.34 Wronskian | `(0.3, 0.45, 1.1+0.7i)`; `(1,1,0.9)` | −0.8044150567−0.3836002921i; −2.7328923 | same; −2.7328923 | holds | — |
| 13.2.40 | 5 points incl. `z = −2, −1.5, −0.8` on the cut | — | max diff 2e-12 | holds | — |
| 13.2.41 upper, every `z ≠ 0` | `(0.3,0.45,1.1+0.7i)`; `z=−2, b=2`; `z=−0.8` | 0.9455825546+0.6023584360i; 0.7928652489; 0.4129010689 | same; 0.7928652488; 0.4129010689 | holds | — |
| 13.14.31, 13.14.33 | `(0.3,0.35,1.1+0.7i)` | sym diff ≤ 5e-12; 0.6386051605−0.1291882571i | 0.6386051605−0.1291882571i | holds | — |
| 1.5 Check | `W_{0,½}` vs `W_{½,0}` at `z = 1, 2` | 0.6065306597; 0.3678794412 | 0.6065306597; 0.5202600950 | value right, route wrong, swap not detected at `z = 1` | R08 |
| 13.18.1 | `M_{0,½}(2z)`, `z=0.6+0.3i` | 1.2164367959+0.7006578526i | `2 sinh z` same | holds | — |
| 13.3.22, 13.3.7 | `(0.3,0.45,1.1+0.7i)`, `(0.7,−1.5,−1)` | −0.1145765097+0.0722838334i | same; 13.3.7 residual ≤ 2e-12 | holds | — |
| 3.2 example (13.15.24) | `z=0.9+0.2i` | −0.3984653351+0.0807729222i | −0.3984653351+0.0807729222i | holds | — |
| 13.4.1 | `(0.7+0.2i, 1.9−0.1i, 1.3−0.8i)` | 1.9168586936−0.3447760735i | quadrature same | holds | — |
| 13.4.4 | `(0.8+0.3i,1.7−0.4i,0.9+0.6i)`; `b = 2` | 0.6886295354−0.7228899026i; 0.8966260194−0.5030121656i | same; same | holds | — |
| 13.4.16 | `(1.3+0.2i, 2.1−0.5i, 0.8+0.5i)`, `c=−0.4` | 0.7337907897−0.1312600452i | line integral same | holds | — |
| 4 example (10.32.8) | `ν=0.3, z=0.8+0.4i` | 0.4596744641−0.3211004026i | same | holds | — |
| 13.6.8, 13.6.6 real forms | `x=0.7`; `s=0.6, x=1.3` | 0.9321872517; 0.7456488604 | 0.9321872517; 0.7456488613 | holds | — |
| 13.6.11 (`kummerU_airyAi`) | `z=0.6+0.9i`; `z=−0.5+1.2i` (ph 0.63π) | 0.2727658251−0.6338207217i; −0.4446329772−0.4152847945i | same; same | holds | — |
| 13.6.12 | `a=0.7, z=1.1+0.3i` | 0.8145637285−0.1446806481i | same | holds | — |
| 13.18.9 (`whittakerW_zero_eq_besselK`) | `ν = 0.3`; `ν = 1` (integer branch); `ν = 0` | 0.3932570522−0.1561245294i; 0.5208338380−0.2832363373i; 0.3819970616−0.1461035652i | same; same; same | holds; `K₀(1)=0.4210244382`, `K₁(1)=0.6019072302` | — |
| 10.39.6, 9.6.21, 12.7.14 | `ν=1, z=0.8+0.4i`; `z=1`; `a=0.7, z=1.1+0.3i` | 0.5855167600−0.5238887310i; 0.1352924163; 0.3888010245−0.1378763639i | same; same; same | holds | — |
| 13.7.3 (`isBigO_kummerULog_sub_sum`) | `Im w = 1.3π`, `N = 2`, `a=0.4+0.3i, b=1.35` | `|rem|/|e^{−(a+2)w}|` at `|z| = 6, 10, 14` | 0.39, 0.10, 0.14 (bounded) | holds | — |
| 13.8.1 (Lean region) | `a=z=1, n=2`; `b = −10.5, −20.5, −40.5, −20.1, −40.9, 30, 15i` | `|b|²·|rem|` | 0.990, 0.998, 0.999, 0.997, 0.999, 0.999, 1.004 | holds near the negative axis too | — |
| 13.9.1–13.9.6, printed vs corrected | grid `a ∈ {−5.5,…,3}` step ¼, `b ∈ {−5.5,…,−0.25} ∪ {0.3,1,2.7}`, sign changes on `(0,60]` | printed differs at 33 points | all with `a = 0` (13.9.3–4) or `a ∈ {−1,…,−5}` (13.9.6); corrected forms agree everywhere | README corrections right | — |
| 7.1 Checks | zero of `M(−0.5,0.01,·)`; `b`-zero of `M(1,·,1)` | 0.0199014758; −10.000000823266 | README 0.01990 14758; −10.00000 08232 66 | holds | — |
| 7.2 counterexample | `K_i(x)` on `(2e−15, 0.7)` | 4 sign changes on a log grid | oscillates as `x → 0⁺` | holds | — |
| Wimp (`kummerU_ne_zero`) | `a=−2, b=−4.5` | zeros of `U(−2,b,·)` | `−3.5 ± 1.87i`, outside `|ph z| ≤ π/2` | holds | — |
| 13.10.10 | `a = b`; `a=1, b=2` | `Γ(s)/Γ(a)`; `−Γ(s−1)` | `Γ(s)/Γ(a)`; `Γ(s)/(1−s)` | holds | — |
| 8 example 13.10.11 | `a=b=1`, `λ = ½, 0.3` | 5.5683279968; 11.61692660 | README: 3.1415926536; 3.8832221 | **fails** | R01 |
| Buchholz entire form | `(0.2−0.5i,1.4+0.4i,−1.2+0.3i)`; `(0.3,1.7,2.1)` | 1.1852922839+0.4678121627i; 1.8516687739 | same; same (printed form: 2.8335966305−3.3899270140i; 1.8516687739) | holds; README counterexample confirmed | — |
| `buchholzCoeff` recursion vs 13.11.4 | `a=0.3+0.1i, b=1.7` | `A₀…A₉` | DLMF recursion, diff ≤ 1e-16 | holds | R08 (Checks) |
| 13.11.1 Check | `a=½, b=z=1` | 1.7533876544 | `e^{½}I₀(½)` = 1.7533876544 | holds | — |
| 13.12.1 | `(0.3+0.2i,0.45,1.1+0.7i)`; `(1.7,−2.3,0.8−1.1i)` | 1.0000000000; 1.0000000000 | 1 | holds | — |
| 13.5.1 via `GenContFract` | terminating `a=−2, b=½, z=1` | −5 | `M(−2,½,1)/M(−1,3/2,1) = −5` | statable and true | R04 |
| statement-hygiene repair | `cos(πn) = (−1)ⁿ`, `−cos(πn)/2 = (−1)^{n−1}/2` | elaborates | — | holds | R06 |

## Not verifiable

- **The "NIST draft of §13.9 dated 2026-11-06"** (README 846). It is not public and not in References. I read the live DLMF §13.9 (Release 1.2.8), which still prints the old hypotheses (R10).
- **Gautschi (1967, SIAM Rev.)**, used for the minimal-solution route of 5.1. It is paywalled and was not opened. It supports a proof sketch only, and no statement depends on it.
- **Wimp (1965, Proc. AMS).** I checked the statement only as DLMF §13.9(ii) reports it (DLMF-13.9 lines 521–523: `a, b ∈ ℝ`, `2a − b > −1`, `|ph z| ≤ ½π`), not in the paper.
- **Tricomi (1954), Slater (1960), Buchholz (1969), Olver (1974), Temme (2015).** No sampled target cites a locator in them. Not opened.
- **DLMF §13.4 and §13.7.** The sources service resolved both pages to their figure PDFs, which are image-only. I read the equations through the public DLMF HTML instead. The 13.4 and 13.7 statements in the table were confirmed numerically (13.4.1, 13.4.4, 13.4.16, 13.7.3) or analytically (13.4.9, 13.4.10).

## Source issues

- **Error** in DLMF at §13.9(i), 13.9.3–13.9.4 (Release 1.2.8): the source says the count holds for `a ≥ 0`; it should be `a > 0`, since `M(0, b, x) = 1` has no zeros while the formulas give 1 (e.g. `b = −½`, `b = −5/2`); affects a stated result.
- **Error** in DLMF at §13.9(i), 13.9.6 (Release 1.2.8): the source says the count holds whenever `⌈−b⌉ > ⌈−a⌉ > 0`; it should also require `a ∉ {−1, −2, …}` (at `a = −1, b = −3/2` it gives 1, but `1 + 2x/3` has no positive zero); affects a stated result.
- **Gap** in DLMF at §13.9(i), 13.9.1–13.9.2 (Release 1.2.8): the source allows `b = 0`, where `M(a, 0, x)` is undefined; it should say `b > 0` (with `𝐌(a,0,x)` the count drops by one for `a < 0`); affects a stated result.
- **Error** in DLMF at §13.9(i), final sentence (Release 1.2.8): the source says `M(a,b,z)` has finitely many `b`-zeros for fixed `a, z`; it should restrict to `|b + n| ≥ δ`, since `M(1, b, 1)` has a zero in `(−n−½, −n)` for every large even `n` (e.g. `b ≈ −10.0000008233`); affects a stated result.
- **Error** in DLMF at §13.9(i), paragraph after 13.9.9 (Release 1.2.8): the source says the closed parabolic zero-free regions also hold for the partial sums of 13.2.2; it should say their interiors, since `1 + z` vanishes at the vertex `−1` of `P₁` (`a = b = 1`); affects a stated result.
- **Error** in DLMF at §13.9(ii), first sentence (Release 1.2.8): the source says `U(a,b,·)` has finitely many zeros in `|ph z| ≤ 3π/2 − δ` for fixed complex `a, b`; it should require `|z| ≥ r > 0` or real `a, b`, since `U(½+i, 1+2i, 2x) ∝ K_i(x)` has zeros accumulating at `0⁺`; affects a stated result.
- **Gap** in DLMF at §13.11, 13.11.3 (Release 1.2.8): the source leaves the branches of `(b−2a)^{(1−b−s)/2}`, `(½z)^{(1−b+s)/2}` and the square root unspecified; with principal branches the printed form fails when `ph z + ph(b−2a) ∉ (−π, π]`, e.g. `a=0.2−0.5i`, `b=1.4+0.4i`, `z=−1.2+0.3i`; affects a stated result.
