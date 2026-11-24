# Review of ZerosOfLFunctions (pull request #3027 at 6f088b9)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 537 changed lines since `b8f3652`. I checked the five added sections (8.4a, 8.5a, 8.6a, 8.7a, 9.1), the two added Lean statements of 8.6a and the rewritten routes of 8.5a and 8.7a: I recomputed the residues, the archimedean series, the constants and the Checks, and opened every library declaration the new text names. No finding: the earlier finding on `Suggested.lean` is repaired, and the deferred one on the Euler–Kronecker constant is settled in the other roadmap. One small correction and no format note, none blocking; two questions for the author; the human reviewers have one decision applied and one note on sources not read.

## C01 — The module docstring of `Suggested.lean` does not say where 8.4a, 8.5a and 8.7a stand.

The docstring lists what is stated (now with 8.6a) and, under "Not stated here", the sections that stay README targets: 3.4, 8.3, 8.6 over a general field, and statements of Layers 0–2, 4, 7.1–7.3, 9 and 6.4a (lines 56–69). The three other new sections of Layer 8 appear in neither list, although each is statable at the pins: 8.5a on `Chebyshev.psi`, `Nat.primeCounting`, `TauCeti.Real.logIntegral` and `riemannZeta`; 8.4a on `riemannZeta` and `ArithmeticFunction.vonMangoldt`; 8.7a on `PrimitiveRayClassCharacter.of`. A reader of the acceptance test cannot tell whether they were left out on purpose.

If they are steps and not headlines (the overview names none of them), adding "8.4a, 8.5a and 8.7a" to the sentence that begins "The convexity bound 3.4 and the truncated explicit formulas 8.3 and 8.6" would say so. If Ingham's theorem is meant as a headline, it would be stated instead.

## Previous findings

- R01 — not repaired: deferred (D01)
- R02 — repaired: `dedekindZeta_rieszMeanExplicitFormula` and `heckeLFunction_rieszMeanExplicitFormula` state both formulas of 8.6a (`Suggested.lean` lines 457 and 493); the README names them at lines 2326–2331 and the docstring lists 8.6a as stated.
- C01 — repaired: the route of 8.7a now ends "`of (ψ ∘ Φ) = of ((ψ ∘ Φ).induced) = of ((ψ ∘ Φ′).induced) = of (ψ ∘ Φ′)`" with `PrimitiveRayClassCharacter.of_induced`, which is also in the *Needs:* line and the Tau Ceti contracts.
- C02 — repaired: the route of 8.5a now uses `Chebyshev.abs_psi_sub_theta_le_sqrt_mul_log` and `Chebyshev.primeCounting_eq_theta_div_log_add_integral` on the carriers of the statement; the transfer through `primesEquiv` is gone.
- C03 — not verifiable: the description reached me cut off after its section on wrong statements on `main`; the part I read does not name this roadmap (see the first question).

## Deferred findings

- D01 — resolved: RiemannHypothesisStatementsAndConsequences §8.4a (b) now reads "Write `EK(K)` for the Euler–Kronecker constant of `K` (ZerosOfLFunctions §8.6a: …)"; the constant has one owner.

## Questions for the author

- Does the description say that ZerosOfLFunctions is revised? The part I could read (up to the section on wrong statements on `main`; the text was cut off for me there) does not name this roadmap. If the rest does not either, a sentence such as this would do: "ZerosOfLFunctions gains §§8.4a, 8.5a, 8.6a, 8.7a and 9.1; its `Suggested.lean` gains the two statements of §8.6a; no section is removed or renumbered and it gains no supplier."
- 8.5a and the References cite Ingham by chapter only. Is the statement Theorem 30 of Chapter IV, and on which page? I found no legal copy to give the locator myself.

## Verified sound

| Statement | Instances tried | Values computed (README or Lean side / my side) | Result |
| --- | --- | --- | --- |
| 8.6a first formula (`dedekindZeta_rieszMeanExplicitFormula`) | residues of `(−ζ_K′/ζ_K) x^s/(s(s−1))` at `1`, `ρ`, `0`, `−j`; subtraction of the value at `x = 1` | `EK+1 = x log x/(x−1) − Φ + zero term + (R(x)−R(1))/(x−1)`; coefficient of `log x`: `x/(x−1) − 1/(x−1) + …` gives `log x`, as stated | holds |
| 8.6a second formula (`heckeLFunction_rieszMeanExplicitFormula`) | same, `χ ≠ 1`: residue `−x L′/L(1)` at `1` | `(x−1) L′/L(1) = −S + ∑ m_ρ(x^ρ−1)/(ρ(1−ρ)) + R(x) − R(1)`, as stated | holds |
| 8.6a archimedean series | `x = 1.2, 2, 3.7, 50`, 4·10⁵ terms | all `j`: `∑ − (x−1)log(x/(x−1)) = −2.5·10⁻⁶`; even: `−1.25·10⁻⁶`; odd: `−1.25·10⁻⁶` (the tails); `F₂ − (F₁+F₃)/2 = 0` | holds |
| 8.6a at `x = 2` by hand | even, odd, complex place | `0.95477 = F₁(2)/2`; `0.43152 = F₃(2)/2`; sum `1.38629 = F₂(2) = 2 log 2` | holds |
| 8.6a Check `K = ℚ`, `x = 2` | both routes; first 10 zero pairs | `γ+1−log 2−F₁(2)/2 = −0.070703`; residue route `−0.024512 − 0.046191 = −0.070703`; 10 pairs give `−0.0480` with `0.0271` of `0.0462` of the weight; variant `−1.225134` | holds |
| 8.6a supplementary constant | functional equation of `ζ_K` as `s → 0` | `−ζ_K′/ζ_K + n₀/s → EK + log|d_K| − n(γ + log 2π)`; at `ℚ`: `−log 2π` | matches line "`c_K = …`" |
| 8.6a Lean form | `ψ ≠ 1`; `a = r₁ − a′` in `ℕ`; cutoff `𝔑𝔞 = x` | `infinitePart : Finset {w // w.IsReal}` (`RayClass/Modulus.lean:104`), so `a′ ≤ r₁` and the subtraction is exact; term at `𝔑𝔞 = x` is `0`; cast to `ℝ` precedes `/ 2` in the elaborated type | holds |
| 8.6a, `EK` in Lean | uniqueness of the limit; value at the pole | `𝓝[≠] 1` is nontrivial, so `EK` is determined; `meromorphicContinuation` is in normal form (`Meromorphic/Continuation.lean:72`), its value at `1` unread | holds |
| 8.4a signs | residues at `w = 0`, `1−s`, `ρ−s`, `−2q−s` | prime sum `= −ζ′/ζ(s) + k_x(1−s) − ∑ m_ρ k_x(ρ−s) − ∑ k_x(−2q−s)`; rearranged, the four lines of the display | holds |
| 8.4a Check `s = 2`, `x = 2` | prime sum, pole, trivial zeros, 10 zero pairs | `0.223950`, `0.360674`, `−0.006004`, `−0.007812`: total `0.570807` against `0.569961` (tail of the zeros) | holds |
| 8.5a route | 8.3 at `T = x`; Mathlib bound | error `x log x log(x²)/x = O(log² x)`; `|ψ−θ| ≤ 2√x log x` (`Chebyshev.lean:442`, `x ≥ 1`); Abel identity at `Chebyshev.lean:668` (`x ≥ 2`) | holds |
| 8.5a Check `x = 10⁶` | known values | `ψ − x = −413.40`; `π − Li = 78498 − 78626.50 = −128.50`; bounds `190868`, `13816` | holds |
| 8.7a | `ℚ(i)/ℚ`, kernels `{1,5}` and `{1,3}` in `(ℤ/8)ˣ` | `1,−1,1,−1` is `χ₋₄` mod 8; `1,1,−1,−1` is `(−2/·)`: `(−2/3)=1`, `(−2/5)=−1`, `(−2/7)=−1` | holds |
| 8.7a route | `of_induced` at the pin | `of (χ.induced h) = of χ` (`Hecke/Primitive.lean:169`) | holds |
| 8.8 (changed *Needs:*) | citation of 8.7a | 8.7a states the independence the sentence uses | consistent |
| 9.1 | principal character mod 2; `χ₋₄`; `q = 1` | zeros `2πik/log 2` on `Re s = 0` with `Gammaℝ` regular: (i) fails; `Λ_{χ₋₄}(0) = 1·½`; order of `ζ` at `1` is `−1 ≤ 0` | holds |
| 9.1 functional equation | Mathlib at the pin | `completedLFunction χ (1 − s) = N^(s−1/2)·rootNumber·Λ_{χ⁻¹}(s)` (`DirichletContinuation.lean:291`); `completedLFunction_modOne_eq` at line 238 | as quoted |

- Source locators checked against the text: 2 (Milne, *Class Field Theory* v4.03: Theorem 0.8, p. 9; cotrained characters and the unique primitive one, p. 165, before Theorem 3.27).
- Mathlib declarations opened at the pin: 10 (`Chebyshev.lean:442, 668`; `DirichletContinuation.lean:238, 266, 291`; `Nonvanishing.lean:404`; `RiemannZeta.lean:139, 154`; `Dirichlet.lean:439`; `Gammaℝ_ne_zero_of_re_pos`).
- Tau Ceti declarations opened at the pin: 14, among them `meromorphicContinuation`, `heckeLFunctionC` (`Hecke/Basic.lean:74`), `PrimitiveRayClassCharacter.of` and `of_induced`, `idealClass_mul` (`RayClass/Basic.lean:187`), `idealClass_surjective` (`RayClass/Integral.lean:161`), `logIntegral_eq_div_log_sub_add` (`LogIntegral.lean:180`), the five contour lemmas. Neither library has an Euler–Kronecker constant.
- Cross-roadmap citations resolved: the citations of §§8.4a, 8.5a, 8.6a, 8.7a and 9.1 in RiemannHypothesisStatementsAndConsequences (lines 194, 232, 374, 432, 658, 1353) and GeneralizedRiemannHypothesisFromWindowBounds (lines 310, 367); internal 1.4a, 4.5, 5.6a, 6.4a, 6.5, 8.2, 8.9 exist.
- Record: the merge base has 10 layers; the head keeps all with their ids and titles, removes no heading and no Lean declaration.
- Automatic checks: all passed. Dependency check: `depcheck: 129 roadmaps, 1437 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: exit 0, 25 `sorry` warnings and nothing else; one `import Mathlib`, nine `TauCeti.*` imports, no `set_option`. A `#check @name` sweep of the 30 declarations printed each type; none lost a binder. One-tactic probe of the two new theorems (`simp`, `rfl`, `infer_instance`, `exact?`): none closes.
- Overlap check: read RiemannHypothesisStatementsAndConsequences, ExplicitZetaBounds, AnalyticNumberTheoryPartI, LFunctions and AnalyticNumberTheoryPartIII, and searched every roadmap of this head and of `main` for the five added objects; LiCoefficientsArithmeticFormula's head was not available to me. The Euler–Kronecker constant, Selberg's formula, Ingham's theorem and the dictionary independence are owned here and cited by RiemannHypothesisStatementsAndConsequences; AnalyticNumberTheoryPartIII §10.2 (a transfer theorem for a zero-free width) and the bounded-height agreement in ExplicitZetaBounds are different statements; nothing shared. The other open revision of this roadmap merges cleanly with this head.

Source independence: changed passages only; 2 passages compared with 1 source (Milne, at p. 9 and p. 165), none shared beyond 4 consecutive words; Titchmarsh, Ingham, Ihara 2006, Ihara–Murty–Shimura 2009 and Davenport could not be read, so 8.4a, 8.5a, 8.6a and 9.1 were not compared; largest share in the added lines Ihara 2006 with Ihara–Murty–Shimura 2009, about 10 of 20 source mentions; contents not compared, no layer being added, removed or reordered.

Research link: 8.6a is the explicit formula of Ihara (2006) and Ihara, Murty and Shimura (2009) for Euler–Kronecker constants and `L′/L(1, χ)`; 8.4a is Selberg's formula (Titchmarsh, Theorem 14.20) and 8.5a Ingham's theorem (1932). This rests on the README's references and on the roadmaps that cite these sections.

## Not verifiable

- Ihara–Murty–Shimura (2009), Theorem 1, (2.2.1), p. 257 (8.6a, in the seeded sample): the publisher's page returned HTTP 502; the formulas were checked by computation.
- Ihara (2006), (1.2.1) and (1.4.1) (8.6a): no legal copy.
- Titchmarsh, Theorem 14.20 (8.4a) and Ingham, Chapter IV (8.5a): no legal copy.
- Davenport §§9, 12 (9.1) and Lagarias–Montgomery–Odlyzko (8.8): cited by locator only, as settled.
- The other sampled sections (0.1, 1.2, 2.1, 3.1, 3.3, 3.4, 4.2, 4.4, 4.5, 5.4, 5.5, 7.2, 7.6) lie in text the change neither touches nor affects and were not checked against their sources.
- The description after its section on wrong statements on `main`: cut off in the copy I was given.

## Source issues

- none

## For the human reviewers

- The decision on published sections moving from the family to general roadmaps was applied: this folder states §§8.4a, 8.5a, 8.6a, 8.7a and 9.1, and each states what the family's citing passages name.
- Not tested: the sources with the largest share of the changed passages (Ihara 2006; Ihara–Murty–Shimura 2009) and Titchmarsh, Ingham and Davenport could not be read; the wording of 8.4a, 8.5a, 8.6a and 9.1 was not compared with them.
