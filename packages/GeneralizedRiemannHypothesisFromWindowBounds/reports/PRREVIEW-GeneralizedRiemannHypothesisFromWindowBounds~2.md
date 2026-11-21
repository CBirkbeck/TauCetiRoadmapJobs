# Review of GeneralizedRiemannHypothesisFromWindowBounds (pull request #2887 at 5a61ad4)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/GeneralizedRiemannHypothesisFromWindowBounds/`
**Verdict:** needs changes

**Summary.** Changes are needed for two findings, both in Layer 6, where the README cites AnalyticNumberTheoryPartI §1.9 for things it does not state. First, 6.5 credits that section with a square-root error and a bound uniform in the modulus, but the section gives only the fixed-modulus `x^{1/2+ε}` form. Second, 6.6 rests on a clause §1.9(iv) that does not exist. Layers 0–5 check out against their suppliers: the windowed Landau reduction, the window-bound form of the Riemann hypothesis and the eleven Lean statements are stated correctly. There are three small corrections and no format notes. The human reviewers have scope and licence questions to decide: the headline theorems rest on a formal proof announced the day before this review, and the source of that proof was published without a licence.

## R01 (P2) — The square-root and uniform bounds of 6.5 are credited to AnalyticNumberTheoryPartI §1.9(ii), which states neither

No supplier gives the `Suggested.lean` headline `psiAP_isBigO` or the uniform bound of 6.5. An implementer who follows the route will reach only a weaker statement. The route (line 1143) reads "§1.9(ii) at `σ = 1/2` (`psiAP_isBigO_of_generalizedRiemannHypothesis` and the uniform form)". On main, AnalyticNumberTheoryPartI §1.9 (its README line 1054) has two clauses. Clause (ii) fixes `q` and, under GRH for every character modulo `q`, gives `ψ(x; a, q) − x/φ(q) = O_{q,ε}(x^{1/2+ε})`. Its Lean form is `psiAP_isBigO_of_dirichletGRH` (its `Suggested.lean` line 489), with the bound `x^(1/2 + ε)`. The section has no parameter `σ`, says that the constant depends on `q`, and has no uniform form. A bound `x^{1/2+ε}` does not give `√x log² x`. A search of every README on main and at the open heads finds the bound `C √x log²(qx)` only in this roadmap, so nothing owns it. RiemannHypothesisStatementsAndConsequences itself says, in its scope, that its §9.9 sharpens AnalyticNumberTheoryPartI §1.9.

The smallest repair has two parts:
- **Fixed-modulus bound.** Route it through RiemannHypothesisStatementsAndConsequences §9.9(ii) at the modulus `(q)∞` and `σ = 1/2`, with 5.1, as 6.4 already does for the prime count. Cite `psiAP_isBigO_of_dirichletGRH` only as the weaker form.
- **Uniform bound.** Either give it a route of its own, naming its inputs (orthogonality, and an explicit formula for `ψ(x, χ)` with constants uniform in `q`, as in Davenport, chapter 20), or drop the clause.

## R02 (P2) — 6.6 rests on a clause §1.9(iv) of AnalyticNumberTheoryPartI that does not exist

Without that clause, nothing in the route turns Littlewood's bound for `L(1, χ_D)` into the stated bound for `h(D)`. The heading (line 1148) and the route (line 1153, "§1.9(iv) with 5.1 at `χ_D`") cite a clause that AnalyticNumberTheoryPartI §1.9 on main does not have: it has clauses (i) and (ii) only, and no open pull request revises it. The other half of the route, 6.2(ii), gives `L(1, χ_D) ≥ (C log log |D|)⁻¹` (RiemannHypothesisStatementsAndConsequences §9.7(ii)(d)). It still needs the class number formula, which neither the route nor the *Needs:* line names.

The pinned Tau Ceti has that formula as `TauCeti.NumberField.classNumber_eq_LFunction_one_of_discr_ne` (`TauCeti/NumberTheory/NumberField/Quadratic/DedekindZeta.lean`, line 288): `h = √|D| L(1, χ_D)/π` for `D ≠ −3, −4`, which covers every `D < −4`. At `D = −7`, `L(1, χ₋₇) = π/√7` gives `h = 1`. Route 6.6 as 6.2(ii) together with that declaration, drop "§1.9(iv)" from the heading, and update the *Needs:* line.

The same numbering error appears under "Not owned here" (line 2313). It credits "AnalyticNumberTheoryPartI §1.9(iii)" with the converse "`ψ(x) − x = O(x^{σ+ε})` for every `ε` gives a zero-free half-plane". That clause does not exist either, and 1.3(a) of this roadmap already proves the converse at `ℚ`, from the lower bound alone. That bullet would drop the citation.

## C01 — Ten backticked Lean names are credited to suppliers that do not declare them

A reader who searches for these names finds nothing and cannot tell a supplier declaration from a name proposed here. In each case the cited section does state the result in prose; only the name is missing.

- **RiemannHypothesisStatementsAndConsequences, at its open head:**
  - `zeroFreeRightOf_iff_forall_gt` (lines 425, 608, 687)
  - `NumberField.extendedRiemannHypothesis_rat_iff` (lines 427, 652, 2405)
  - `generalizedRiemannHypothesis_iff_dirichletData` (lines 809, 2397)
  - `GeneralizedRiemannHypothesis.LFunction_ne_zero` and `GeneralizedRiemannHypothesis.re_eq_half` (lines 787, 2399). The supplier's Lean file has `generalizedRiemannHypothesis_iff_LFunction_ne_zero` and `generalizedRiemannHypothesis_iff_re_eq_half` instead.
  - `toPrimitiveRayClassCharacter_of` (lines 712, 2414)
  - `DirichletCharacter.gammaFactor_ne_zero_of_re_pos` (line 2411)
  - `NumberField.eulerKroneckerConstant` (lines 110, 2383). The supplier writes it in italics, as a name it proposes.
- **FrobeniusRestrictedRieszSums §0.5:** `DirichletCharacter.cyclicFamily` (line 166). FrobeniusRestrictedRieszSums names no declaration there, and ThetaChainsAndFrobeniusPrimeSums declares `PrimitiveDirichletCharacter.cyclicFamily`.
- **AnalyticNumberTheoryPartI §2.42:** `NumberField.extendedRiemannHypothesis_iff_of_isAbelianGalois` (lines 825, 2474).

Use the suppliers' own names where they exist, and otherwise write the result in prose or in italics, as the suppliers do.

## C02 — Two clause locators point to places where the clause is not

- **6.25.** The heading and route (lines 1969, 1974) and the supplier contracts (line 2554) cite QuasiRiemannHypothesis §5.5(c). At that roadmap's head, §5.5 has clauses (a) and (b) only. The statement of 6.25 is true and follows from 5.6, as the route's second sentence shows. Cite QuasiRiemannHypothesis §5.4 (the factorization for norm-composed characters) or present 6.25 as a corollary of 5.6.
- **DGLSWSmallFieldGRH.** The supplier contracts (line 2562) list *DGLSWSmallFieldGRH* under ExplicitNumberFields §0.5. That roadmap defines it in its list of named propositions before §0.1, not in §0.5.

## C03 — The description's dependency list omits ThetaChainsAndFrobeniusPrimeSums

The generated "Depends on" block, and the merge-order paragraph built from it, list eight open suppliers. They omit the open pull request that adds ThetaChainsAndFrobeniusPrimeSums. That roadmap's §10.11 is the input on which 4.2, 5.1–5.6 and all of Layer 6 rest, and the README cites it as a supplier (lines 2458–2463). The block looks to have been generated before that pull request was opened. Regenerate it, so that the merge order places that roadmap before this one.

## Verified sound

| Statement | Instances tried | Values computed (both sides) | Result |
|---|---|---|---|
| 0.4 size of `G_w` | `K = ℚ`, `w = single 1 1` | `G(1) = 1 + γ = 1.5772`, `G(2) = 2(1+γ−log 2) = 1.7681`; `∫₁^∞ y^{−σ} = 1/(σ−1)` = 1 at σ = 2 | holds; RiemannHypothesisStatementsAndConsequences §8.4a(b) size clause present |
| 0.6 residues | `ρ = 1/2 + 14.134725i` | `1/(ρ(1−ρ)) = 1/(1/4 + t²) = 1/200.04 = 0.0049990`; weights ±1 at `ψ, ψ⁻¹` give `G = 0` | matches |
| 0.2 cyclic family | `ψ = χ₋₄φ`, φ quartic mod 5 | `ψ² = φ² = (·/5)`, `(2/5) = −1`, imprimitive factor `1 + 2^{−s}`; conductors 1, 20, 5, 20 | matches FrobeniusRestrictedRieszSums §0.5 Check |
| 1.2 lower bounds | `w = 0`, `θ = 0`, `C = 1`; `ℚ`, `single 1 1` | `0 ≥ −1` holds, no member, conclusion vacuous; `ζ(1/2) = −1.4604 < 0` excludes real zeros | holds; Positivity §6.4(d) states both alternatives |
| 2.2 windows in mean | `C = 1`, `λ = 2`, `Y = e^{100}` | window integral `≤ C⁺(λ−1) log Y = 100`, against `Y^η = e^{100η}` (≥ 100 for η ≥ 0.047) | matches Positivity §6.9(b) |
| 2.3 large values | `ℚ`, `θ = 1/4` | zero at Re 1/2 > 1/4; oscillating term `2√y/200.04` | contrapositive of 2.1, quantifiers match |
| 2.4 lower windows | real pole `β = 0.6` | residue `1/(0.6·0.4) = 4.17 > 0`: the allowed alternative; ζ has none | matches §6.9(b) for `−G` |
| 3.3 equivalence | empty family; `θ < 1/2` | `0 ≤ y^{σ+ε}` both sides true; zeros on Re 1/2 > θ refute the windows | holds both ways |
| 3.5 / Lean `riemannHypothesis_iff_forall_exists_windows` | y = 1, y = 2, large y under RH | `G(1) = 1.5772 > 1`, `G(2) = 1.768 > 2^{0.5}`, both outside far windows; `G ≤ 0.0462√y + 1.84` | correct; `n = 0` term is `Λ(0) = 0` |
| 5.1 Lean | `χ = 1` mod 2 at `s = 1` | order −1 ≤ 0; zeros `2πik/log 2` have Re 0 | true under GRH |
| 5.2 `riemannHypothesis` | Mathlib definition | excludes −2(n+1) and 1 | statement exact |
| 5.3 value/strip forms | `s = 1` for ζ; principal mod 2 | `ζ(1) = (0.5772 − 2.5310)/2 = −0.9769 ≠ 0`; `χ ≠ 1 ∨ s ≠ 1` excludes junk | correct |
| 5.4 completed | `N = 1` | `completedRiemannZeta` order −1 at 0, 1; order 0 at −2 | correct |
| 5.5 abelian ERH | `ℚ(i)` | `ζ_K = ζ·L(χ₋₄)`, `L(1,χ₋₄) = 0.785 ≠ 0`, order −1 at 1 | correct; `(1).character` at `Modulus.one` (Primitive.lean:175) |
| 5.6 Hecke | `K = ℚ(i)`, `L = ℚ(ζ₁₂)` | `φ̃((2+i)) = (5/3) = −1`, Frobenius sends ζ₃ to ζ₃² | matches Check |
| 6.1 first consequences | exceptional zeros | cap `(log 3/2)/log 9 = 1/4`, window `[3/4,1)` | matches RiemannHypothesisStatementsAndConsequences §9.6(a), (c) |
| 6.3 argument | `T = 16` | `log 16/log log 16 = 2.773/1.020 = 2.72` | matches §9.8(i)–(ii) |
| 6.5 (R01) | `q` fixed, uniform | cited gives `x^{1/2+ε}`; claimed `√x log² x`, `C√x log²(qx)` | unsupported |
| 6.6 (R02) | `D = −7` | `h = √7·(π/√7)/π = 1` | true, route cites nonexistent §1.9(iv) |
| 6.14 regions | `t = 2`; `R = 0.7`, `t₀ = −20` | `1 − 1/(5.558691 log 2) = 0.7405 > 1/2`; `0.7 log 20 = 2.097`, boundary 0.4606 | matches EZB §§7.2, 7.3a |
| 6.16 Schoenfeld | `x = 100` | `ψ(100) = 94.045`, `|ψ−x| = 5.955 < 10·log²100/(8π) = 8.438` | matches ExplicitPrimeCounting §2.2 |
| 6.19 Trudgian, (d) | `x → 23⁻`; `T = 14.14` | `23 − ψ = 3.7343 > 23ε₀(23) = 3.7018`; `2Re(10^ρ/ρ) = 0.4110`; `2.168 > 2.091` | Checks correct |
| 6.22 Ramaré–Rumely | `q = 8`, `x₀ = 10¹⁰` | `X = 1.54503`, `ε(X) = 0.11219` against `0.00070275`; `1000/(32π) = 9.947 > e^{2/R} = 1.230` | correct |
| 6.28 nine fields | partial-sum maxima | `B_q = 1,1,1,2,1,2,3,1,2` recomputed; `π/6 = 0.5236 ≥ 2/√15 = 0.5164` | correct |
| 6.29 Mertens range | `x = 13.5` | `1.344022 − 0.956545 − 0.261497 = 0.12598 < 0.127871` | correct |
| 6.32 Weil positivity | `sinh(π(s−1/2))` control | `O(R)` zeros against `≫ T log log T` distinct ordinates | correct; repairs WPLC §5.2's count with multiplicity |
| 6.25 (C02) | QuasiRiemannHypothesis §5.5 | clauses (a), (b) only | statement true via 5.6 |

- Supplier text read at its locator: RiemannHypothesisStatementsAndConsequences §§8.4a, 9.2–9.6, 9.8, 9.9, 10.2, 10.3, 11.1 and its scope; PositivityOfDirichletSeriesWithKernels §§6.4, 6.8, 6.9; FrobeniusRestrictedRieszSums §0.5; ThetaChainsAndFrobeniusPrimeSums §§10.10, 10.11 and their Lean forms; ExplicitZetaBounds §§7.2, 7.3a, 8.1, 8.3, 8.3a; ExplicitPrimeCounting §§2.2, 3.1(a), 6.1; ExplicitNumberFields §0.5, 3.5 and its named propositions; WeilPositivityAndLiCriterion §§3.2, 4.2, 5.1, 5.2; QuasiRiemannHypothesis §§5.5, 10.7, 11.1–11.3; AnalyticNumberTheoryPartI §§0.16, 1.9, 2.41, 2.42, 2.49; RieszSumsOverPrimesAndExceptionalZeros §2.41a; the four pages of `Announcement`.
- Library declarations: 45 `#check`s over Mathlib and Tau Ceti names in the README, all resolved at the pins. Opened: `TauCeti/NumberTheory/LFunctions/Hecke/Basic.lean:74` (`heckeLFunctionC` is `meromorphicContinuation 1` of the L-series), `Hecke/Primitive.lean:91, 175, 183`, `ArithmeticDirichletSeries/Prime/PrimeIdealTheorem.lean:39` (`ψ_K ~ x`), `NumberField/Quadratic/DedekindZeta.lean:288`; `AnalyticOnNhd.sum_divisor_le` is Jensen's bound.
- Cross-roadmap citations resolved: every section cited above, plus the names of C01 searched in the suppliers' README and Lean files.
- Elaboration: `lake env lean` on `Suggested.lean` gives 11 "declaration uses `sorry`" warnings and nothing else. All 11 elaborated signatures were compared with the README statements; they agree, with no binder lost.
- Dependency check output: `depcheck: 171 roadmaps, 1999 edges, 0 problem(s)`.
- The worker's automatic checks all passed at this head.
- One-tactic probe, decided by reading: no declaration restates a definition or closes from the library. The four value and strip forms of 5.3 are corollaries of the two order forms but need the reflection argument, which is not one step.

Overlap check: read RiemannHypothesisStatementsAndConsequences, ExplicitNumberFields, QuasiRiemannHypothesis, RieszSumsOverPrimesAndExceptionalZeros and QuadraticTwistSelectionOverPrimes (open); ExplicitPrimeCounting, ExplicitZetaBounds and ExplicitMultiplicativeFunctions (main, at the cited sections and scope). Shared objects:
- the predicates, Riesz remainders and consequences of a zero-free half-plane are owned by RiemannHypothesisStatementsAndConsequences, which names this roadmap as the owner of the proof of the hypotheses;
- the conditional statements discharged in Layer 6 are owned by the cited roadmaps, and only their unconditional forms are stated here;
- the half-plane `Re s > 11/12` is owned by QuasiRiemannHypothesis and is not restated;
- weighted families and every zero-free conclusion drawn from them are owned here, and PositivityOfDirichletSeriesWithKernels' scope agrees.

Nothing is owned twice.

Source independence: 7 passages compared with 2 external sources (`Announcement` and the challenge file of the formalization's Comparator repository) and with 9 supplier roadmaps; none shared beyond forced formulas. The largest share of external locators is `FormalProof`, 5 of about 25 (most locators are sections of other roadmaps). The contents of `FormalProof` (a 14-part Lean archive) were not read, so the arrangement was not tested against it. The layers follow the dependency chain transform → Landau → windows → cyclic families → headlines.

Research link: Layers 1–3 are Landau's theorem (Landau 1905) and a windowed form in the line of localized oscillation theorems (Kaczorowski–Pintz 1986–87, Pintz 1980), applied to Riesz remainders. Layer 5 states the Riemann hypothesis and GRH for Dirichlet L-functions as proved in Alpöge's formal proof, announced 20 November 2026. This rests on the README's references and the `Announcement` text.

## Not verifiable

- The `FormalProof` archive (`alpo.ge/lean.tar.gz`, 14 parts) was not read. The Comparator repository was read only for its five challenge statements.
- The closed forms (4.72)–(4.73) and Table 1 of Kadiri–Lumley–Ng (2018), used in the Check of 6.14 (`C₇ = 17.7457`, `C₈ = 0.3181`), were not fetched. Only their internal consistency was recomputed (`C₂ = 6.686`, zero at `σ = 1.2768`).
- The proof of ThetaChainsAndFrobeniusPrimeSums §10.10, the arithmetic input of 4.2 and 5.1, lies outside this folder.

## Source issues

- none

## For the human reviewers

- Scope: the headline theorems (RH, GRH for Dirichlet L-functions) rest on ThetaChainsAndFrobeniusPrimeSums §10.11 and on a formal proof announced 20 November 2026 (`Announcement`, the author's page). The announcement says no written account exists yet, and no refereed source states these results.
- Licence: the formalization cited as `FormalProof` (README line 2584) is mirrored at leanprover-community/riemann-hypothesis, whose README says the Lean source "was published without a license".
- Formalisation match: `riemannHypothesis : RiemannHypothesis` agrees in name and statement with `riemannHypothesis` in `src/Challenge.lean` of that repository. `LFunction_ne_zero_of_one_half_lt_re` and `re_eq_half_of_LFunction_eq_zero` state what its `LFunction_ne_zero_of_half_lt_re` and `LFunction_eq_zero_re` state.
- Not tested: the arrangement against `FormalProof`, the source with the largest share of external locators, since its archive was not read.
