# Review of ZerosOfLFunctions (pull request #3027 at f3b4ab1)

**Verdict:** needs changes

**Summary.** A review of the change against `main`: 443 changed lines since `74a09b7`. The change adds five sections: 8.4a (Selberg's formula), 8.5a (Ingham's theorem), 8.6a (the Ihara–Murty–Shimura formula), 8.7a (independence from the reciprocity dictionary) and 9.1. I recomputed their residues, series identities and Checks and found them correct. Two findings block: the Euler–Kronecker constant is now defined both in 8.6a and in RiemannHypothesisStatementsAndConsequences §8.4a(b), and the overview now names the Ihara–Murty–Shimura formula as a result, yet `Suggested.lean` neither states it nor accounts for it. There are also three small corrections and no format notes. The human reviewers have one decision to apply and one source note.

## R01 (P2) — The Euler–Kronecker constant now has two owners: 8.6a defines it, and RiemannHypothesisStatementsAndConsequences §8.4a(b) still defines it.

8.6a (README line 2301) introduces *NumberField.eulerKroneckerConstant* `K`, written `EK(K)`, as the constant term of `logDeriv ζ_K` at `s = 1`. In the same pull request, RiemannHypothesisStatementsAndConsequences §8.4a(b), lines 230–232, still opens "Define the *Euler–Kronecker constant* *NumberField.eulerKroneckerConstant* `K`, written `EK(K)`, by" the same expansion. That roadmap's own supplier contracts (line 1777) say that ZerosOfLFunctions §8.6a supplies this constant. So one proposed name is defined twice, and an implementer cannot tell which definition is the one to build. ZerosOfLFunctions is that roadmap's supplier, so it is the owner. GeneralizedRiemannHypothesisFromWindowBounds (line 116) and ConsequencesOfTheRiemannHypothesisForDirichletLFunctions (line 92) take the constant from §8.4a(b), so they follow whichever text owns it.

The smallest repair is in RiemannHypothesisStatementsAndConsequences §8.4a(b), in this pull request: replace "Define … by …" with a citation such as "the Euler–Kronecker constant `EK(K)` of ZerosOfLFunctions §8.6a". Nothing in this folder needs to change.

## R02 (P2) — The overview now presents the Ihara–Murty–Shimura formula as a result, but `Suggested.lean` neither states it nor lists it as unstated.

The overview's sentence on explicit formulas (lines 37–39) now pairs the formula of 8.6a with Weil's formula. `Suggested.lean` states Weil's formula (`dedekindZeta_weilExplicitFormula`, `heckeLFunction_weilExplicitFormula`, line 416), so it treats it as a headline. 8.6a appears neither in the file nor in its docstring's list of statements left as README targets (lines 59–68). A reader of the acceptance test cannot tell whether 8.6a is a headline left out or a step.

Every carrier of 8.6a exists at the pins: `TauCeti.LFunctions.heckeLFunctionC` (`Hecke/Basic.lean:74`), `PrimitiveRayClassCharacter` (`Hecke/Primitive.lean:91`), `RayClassCharacter.toMultiplicativeIdealWeight` (`Character/Weight.lean:42`), `TauCeti.IdealArithmeticFunction.vonMangoldt` and `TauCeti.meromorphicContinuation`. The Weil statements already show how to sum over ideals and how to read `m_ρ`. `EK(K)` needs either a one-line definition as a limit at `1` or a `Tendsto` form of the first identity.

Two repairs would fit:
- state both formulas of 8.6a beside the Weil formulas; or
- if the author means 8.6a as a step of the plan rather than a headline, add it to the docstring's sentence listing 3.4, 8.3 and 8.6 as README targets.

## C01 — The route of 8.7a proves again a pinned Tau Ceti lemma.

The route's last step, at lines 2600–2603, says that a character and its induction to a multiple of its modulus have the same primitive source. It derives this from `RayClassCharacter.conductor_dvd_iff` and `RayClassCharacter.induced_primitiveCharacter`. The pin has exactly this statement as `TauCeti.LFunctions.PrimitiveRayClassCharacter.of_induced` (`NumberTheory/LFunctions/Hecke/Primitive.lean:169`, `of (χ.induced h) = of χ`), and QuasiRiemannHypothesis already cites it. Cite it in the route, the *Needs:* line and the Tau Ceti contracts. The route then ends: both characters induce the same character at `𝔐`, so `of_induced` applied twice gives the theorem.

## C02 — The route of 8.5a reaches `π` at `ℚ` through the number-field library, although Mathlib has the step on the carriers of the statement.

The statement uses `Chebyshev.psi` and `Nat.primeCounting ⌊x⌋₊`. The route (lines 2152–2166) moves them to `TauCeti.primePsi ℚ Set.univ` and `TauCeti.primeCount ℚ Set.univ` through `Rat.HeightOneSpectrum.primesEquiv` and `absNorm_asIdeal`, then applies the Tau Ceti identities. The pinned Mathlib already has the passage:
- `Chebyshev.psi_sub_theta_le` (`ψ x − θ x ≤ 2√x log x` for `x ≥ 1`, `NumberTheory/Chebyshev.lean:526`);
- `Chebyshev.primeCounting_eq_theta_div_log_add_integral` (`π ⌊x⌋₊ = θ x/log x + ∫_2^x θ t/(t log² t) dt`, line 668).

Citing these (with `TauCeti.Real.logIntegral_eq_div_log_sub_add` for the main term) removes the transfer and the four Tau Ceti counting lemmas from the *Needs:* line (lines 2168–2176). The route is correct as written.

## C03 — The description does not say that this roadmap is revised.

ZerosOfLFunctions appears only in the generated merge-order block. The prose ("49 existing roadmaps receive 196 sections", and the list of largest additions) does not tell a reader that this roadmap on `main` gains five sections. A sentence such as this would do: "ZerosOfLFunctions gains §8.4a (Selberg's smoothed formula for `ζ′/ζ`), §8.5a (Ingham's prime counts at `ℚ` under a zero-free half-plane), §8.6a (the Euler–Kronecker constant and the Ihara–Murty–Shimura explicit formula for the first Riesz mean), §8.7a (the independence of primitive characters from the reciprocity dictionary) and §9.1 (the completed and uncompleted hypothesis for a primitive Dirichlet character); no section is removed or renumbered, its `Suggested.lean` is unchanged, and it gains no supplier."

## Questions for the author

- 8.5a and the References cite Ingham by chapter only ("Chapter IV … Cited by chapter"). Is the statement Theorem 30 of that chapter, and on which page? I could not open a legal copy to give the locator myself.

## Verified sound

| Statement | Instances tried | Values computed (README side / my side) | Result |
| --- | --- | --- | --- |
| 8.4a Selberg's formula, signs | Residues of `(−ζ'/ζ)(s+w) k_x(w)` at `0`, `1−s`, `ρ−s`, `−2q−s` | `I = −ζ'/ζ(s) + k_x(1−s) − Σm_ρk_x(ρ−s) − Σk_x(−2q−s)`; rearranged, matches lines 2028–2031 term by term | holds |
| 8.4a kernel at `0` | `x = 3`, `w = 10⁻⁵` | `k_x(w) − 1/w = 1.647933` / `(3/2) log 3 = 1.647918` | holds |
| 8.4a Check `s = 2`, `x = 2` | weights, prime sum, pole term | `0.41504`, `0.223950`, `0.360674`, total `0.584623`; `−ζ'/ζ(2) = 0.569961`; difference `−0.014662` | holds |
| 8.4a Check, zero terms | trivial sum; bound on nontrivial terms | trivial `−0.006004`; bound `0.75·0.047/log 2 + 0.006 = 0.0569 ≥ 0.0087`; opposite pole sign gap `0.70669` | holds |
| 8.4a degenerate `s` | `s = −3` (`ζ(−3) = 1/120`), `s = 1`, `s = −2q` | `c > 4` puts every pole left of the line; `s = 1` and the zeros are excluded by hypothesis, `ζ(1)` junk unread | holds |
| 8.5a Ingham, `x = 10⁶` | sieve to `10⁶` | `ψ − x = −413.40`, `π − Li = 78498 − 78626.50 = −128.50`, `ψ − ϑ = 1102.42`; bounds `190868.3`, `13815.5` | holds |
| 8.5a range and main term | `σ < 1/2`; `x/log x` in place of `Li` | first zero `1/2 + 14.1347i` breaks the hypothesis; `x^(1−σ)/log³x → ∞` refutes the variant | holds |
| 8.5a route | Abel identity with `ϑ = t + O(t^σ log² t)` | `π − Li = 2/log 2 + O(x^σ log x) + O(x^σ/σ)` | holds |
| 8.6a residues | `χ = 1` at `1`; at `0`; at `ρ`, `−j` | `x log x − (1+EK)x`; kernel `−1/s − (1+log x)`, residue `n₀(1+log x) − c`; `m_ρx^ρ/(ρ(1−ρ))`; `−n_j x^(−j)/(j(j+1))` | match lines 2347–2350 |
| 8.6a supplementary constant | functional equation at `s → 0` | `c_K = EK + log|d_K| − (r₁+2r₂)(γ + log 2π)`; at `ℚ`, `−log 2π` | matches line 2366 |
| 8.6a archimedean identities | `x = 1.2, 2, 3.7, 50` | `E − ((x−1)F₁/2 − log x)`, `O − (x−1)F₃/2`, `A − (x−1)log(x/(x−1))`: about `−10⁻⁶` (series tail); `F₂ − (F₁+F₃)/2 = 0` | holds |
| 8.6a Check `K = ℚ`, `x = 2` | both routes | `γ + 1 − log 2 − F₁(2)/2 = −0.070703` / `γ − log 2 + Σ4^(−k)/(2k(2k+1)) = −0.070703`; variant `−1.225134` | holds |
| 8.6a Checks `ℚ(i)`, `ℚ(√5)`, `χ₋₄` | archimedean terms; omitted residue | `F₂(2) = 1.386294 = 0.954771 + 0.431523`; omission gives `F₁ − log x/(x−1)`; `n₀ = 0` | holds |
| 8.6a, `EK(ℚ)` | `ζ = 1/(s−1) + γ + …` | `ζ'/ζ = −1/(s−1) + γ + O(s−1)` | holds; definition duplicated (R01) |
| 8.6a statability | carriers at the pins | `heckeLFunctionC` `Basic.lean:74`, `PrimitiveRayClassCharacter` `Primitive.lean:91`, weight `Weight.lean:42`; not in `Suggested.lean` | R02 |
| 8.7a dictionaries | `ℚ(i)/ℚ`, `Φ` at `(4)∞`, `Φ′` at `(8)∞` with kernel `{1,5}` | `ψ∘Φ′` takes `1,−1,1,−1` at `1,3,5,7`: `χ₋₄` mod 8, primitive source `χ₋₄` | holds |
| 8.7a splitting law | kernel `{1,3}` surjection | `3 ↦ 1` against Frobenius = conjugation; values `1,1,−1,−1 = (−2/·)`, odd, conductor `(8)∞` | holds |
| 8.7a degenerate | `L = K`; non-abelian `G` | trivial `ψ`, both `1`; no surjection from abelian `Cl_𝔪`, so the statement is vacuous there | holds; route C01 |
| 8.8 (changed *Needs:*) | fibre sum, trivial character | `#ker Φ/#Cl_𝔪 = 1/#G`; independence now cited to 8.7a | consistent |
| 9.1 equivalence | principal character mod 2 | zeros `2πik/log 2` on `Re s = 0`, `Gammaℝ` regular there: (i) fails, (ii) and (iii) equivalent to RH | Check holds |
| 9.1 at `q = 1`, `χ₋₄` | Mathlib `completedLFunction_modOne_eq` (`DirichletContinuation.lean:238`) | `Λ = completedRiemannZeta`; `Λ_{χ₋₄}(0) = Gammaℝ(1)·½ = ½` | holds |
| 9.1 functional equation | `IsPrimitive.completedLFunction_one_sub` (`DirichletContinuation.lean:291`) | `N^(s−1/2)·rootNumber·Λ_{χ⁻¹}(s)`, as quoted in the route | holds |

- Source locators checked against the text: 2. Milne, *Class Field Theory* v4.03: Theorem 0.8 on printed p. 9; "cotrained" and the unique primitive character on p. 165, just before Theorem 3.27.
- Mathlib declarations opened at the pin: `differentiableAt_riemannZeta` (`RiemannZeta.lean:139`), `ArithmeticFunction.LSeries_vonMangoldt_eq_deriv_riemannZeta_div` (`Dirichlet.lean:439`), `Chebyshev.psi` (`Chebyshev.lean:70`), `Complex.Gammaℝ_ne_zero_of_re_pos` (`Deligne.lean:69`), `riemannZeta_def_of_ne_zero` (`RiemannZeta.lean:154`), `Rat.HeightOneSpectrum.primesEquiv` (`Padics/HeightOneSpectrum.lean:109`), `LFunction_eq_completed_div_gammaFactor` (`DirichletContinuation.lean:266`), `LFunction_ne_zero_of_one_le_re` (`Nonvanishing.lean:404`), `riemannZeta_one` (`ZetaAsymp.lean:420`).
- Tau Ceti declarations opened at the pin: the five contour lemmas, `RayClassCharacter.conductor_dvd_iff` and `induced_primitiveCharacter` (`Character/Conductor.lean:90, 106`), `idealClass_mul` and `idealClass_surjective`, `PrimitiveRayClassCharacter.of` and `of_induced` (`Hecke/Primitive.lean:135, 169`), `ratDirichletEquiv`, `dirichletData`, `Rat.HeightOneSpectrum.absNorm_asIdeal`, `TauCeti.Real.logIntegral`, `higherPrimePowerTheta_le`. Neither library has `eulerKroneckerConstant`.
- Cross-roadmap citations resolved: 14. Internal 5.6, 5.6a, 6.4, 6.4a, 6.5, 8.2–8.4, 8.6; RiemannHypothesisStatementsAndConsequences lines 230, 373, 431, 657, 1352, 1777; GeneralizedRiemannHypothesisFromWindowBounds line 61; ExplicitZetaBounds §6.1a; AnalyticNumberTheoryPartIII §10.2.
- Record: the merge base has 10 layers and the head keeps all of them with their ids and titles. No heading or item is removed. The 17 deleted lines are rewrites, each kept with additions.
- Automatic checks: all passed. Dependency check: `depcheck: 131 roadmaps, 1448 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean` (unchanged by the diff): exit 0, 23 `sorry` warnings and nothing else. A `#check @name` sweep printed every declaration's type; none lost a binder.
- Overlap check: I read the scope of RiemannHypothesisStatementsAndConsequences, LFunctions, ExplicitZetaBounds, AnalyticNumberTheoryPartI, AnalyticNumberTheoryPartIII, ExplicitPrimeCounting, LiCoefficientsArithmeticFormula and ArtinRepresentations. The Euler–Kronecker constant is shared with RiemannHypothesisStatementsAndConsequences, and its owner is this roadmap (R01). Selberg's formula, Ingham's theorem, the dictionary independence and 9.1 are owned here, and that roadmap's §§8.4b, 9.9, 8.8 and 9.3 cite them. The first-order Perron kernel belongs to ExplicitZetaBounds §6.1a; the route of 8.6a re-derives it because that roadmap consumes this one. AnalyticNumberTheoryPartIII §10.2 is a different statement.

Source independence: changed passages only; 3 passages compared with 1 source (Milne), none shared beyond 4 consecutive words. Titchmarsh, Ingham, Ihara 2006, Ihara–Murty–Shimura 2009 and Davenport could not be read, so 8.4a, 8.5a, 8.6a and 9.1 were not compared. Largest share in the added lines: Ihara 2006 with Ihara–Murty–Shimura 2009, 10 of 20 source mentions. Contents not compared: no layer is added, removed or reordered.

Research link: 8.6a is the explicit formula of Ihara (2006) and Ihara, Murty and Shimura (2009) for Euler–Kronecker constants and `L′/L(1, χ)`. 8.4a is Selberg's formula (Titchmarsh, Theorem 14.20) and 8.5a Ingham's theorem; RiemannHypothesisStatementsAndConsequences consumes all three. This rests on the README's references and the citing roadmaps.

## Not verifiable

- Titchmarsh, Theorem 14.20 (8.4a): the sources service found no legal copy.
- Ingham, Chapter IV (8.5a): the sources service found no legal copy.
- Ihara (2006), (1.2.1) and (1.4.1) (8.6a): only a paywalled page (Springer), so uncertified.
- Ihara–Murty–Shimura (2009), §§2.1–2.3, (2.2.1), (2.3.1), pp. 256–257 (8.6a): the publisher's landing page returned HTTP 502 and the EuDML record's certificate had expired. I checked the formulas by computation instead.
- Davenport §§9, 12 (9.1): recorded as uncertified in the manifest.
- The sampled targets 3.1, 3.3, 4.3, 5.2, 5.6, 6.1–6.3, 8.2, 8.4, 8.5 and 8.7 are untouched by the change, so I did not check them against their sources.

## Source issues

- none

## For the human reviewers

- The decision on published sections moving from the family to general roadmaps was applied. This folder now states §§8.4a, 8.5a, 8.6a, 8.7a and 9.1, which the family cites, and each states what the citing passages name.
- Not tested: the most-cited sources of the changed passages (Ihara 2006; Ihara–Murty–Shimura 2009) and of the whole README (Davenport) could not be read. The wording of 8.6a and 9.1 was not compared with them.
