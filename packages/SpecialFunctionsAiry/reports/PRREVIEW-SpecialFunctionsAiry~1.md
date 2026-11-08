# Review of SpecialFunctionsAiry (pull request #1928 at 0223c33)

**Verdict:** needs changes

## R01 (P2) — Second owner of the Airy function and the Airy kernel (RandomMatrices §8.4 on main)

- **Location.** `TauCetiRoadmap/SpecialFunctionsAiry/README.md` lines 1503–1506: "RandomMatrices §8.4 consumes the Airy function `TauCeti.airyAi` with Airy's equation (1.2), the value `Ai(0)` (1.1), … and the Airy kernel (8.5)."
- **Claim.** On main, RandomMatrices §8.4 still plans these objects itself. After this pull request merges, the Airy function, its equation, decay, integral representations, real-line asymptotics and `K_Ai` have two owners, and the Downstream bullet states something RandomMatrices does not say.
- **Witness.** `TauCetiRoadmap/RandomMatrices/README.md` lines 1034–1036 on main tell RandomMatrices to build the Airy function, its equation, decay, integral representations and uniform asymptotic estimates, with `K_Ai` defined there. That section never cites this roadmap.
- **Repair.**
  - Keep this roadmap as the single owner; it sits just before RandomMatrices in the merge order.
  - Under Scope and ownership, record that 1.1–1.2, Layer 2, 3.2, 3.4–3.6 and 8.5 take over the Airy objects that RandomMatrices §8.4 plans.
  - Open the companion revision of RandomMatrices §8.4 that replaces "Build the Airy function…" with citations of these subsections, and name it in this pull request's merge-order paragraph so that the two merge together.

## R02 (P2) — Statable headlines absent or weakened in `Suggested.lean`; carriers defined but never used

- **Location.** `TauCetiRoadmap/SpecialFunctionsAiry/Suggested.lean` line 329: "**3.5** The error bound of DLMF 9.7.17 in the sector `|ph z| ≤ π/3`." Also lines 133, 138–147, 155 and 161.
- **Claim.** Several headline results are statable at the pins (with `deriv`, `IsBigO`, `Set.ncard` and the file's own definitions) but are missing or stated only in a weak form:
  - **9.7.17 (3.5).** The bound has four regimes, and the deep part (π/3 < |ph z| < π, Nemes) is the headline of 3.5. Only the trivial regime `m = 1` is stated, and the multiplier `Real.airyChi` that the other regimes need is defined and never used.
  - **5.3.** `airyBiComplexZero` and `airyBiDerivComplexZero` are defined, but no theorem states the enumeration of the complex zeros.
  - **6.7.** The real-zero theorem for `Gi`, `Gi′` is absent: simplicity, interlacing, no zero of `Gi` on `[0, ∞)`, and exactly one zero of `Gi′` there. Only the auxiliary energy identity is stated.
  - **6.6.** No statement of 9.12.25–9.12.29.
  - **Unused definitions.** `airyRemainderAiDeriv`, `Real.airyAiDerivZero`, `Real.airyBiZero`, `Real.airyBiDerivZero` and `incompleteAiryAi` are defined and used by no statement.
- **Witness.** A grep of lines 206–514 finds 0 uses of `airyChi`, `airyBiComplexZero`, `airyBiDerivComplexZero`, `airyRemainderAiDeriv`, `airyAiDerivZero`, `airyBiZero`, `airyBiDerivZero` and `incompleteAiryAi`.
- **Repair.**
  - State 9.7.17 in all four regimes: `R_n` with σ = 1/6 for n ≥ 0, and `S_n` with σ = 0 for n ≥ 1, through `Real.airyChi`.
  - State `airyBiComplexZero_spec` once 5.3's route supports it (R09).
  - State the 6.7 theorem, and 9.12.25 and 9.12.27 as `IsBigO` statements.
  - Delete every definition that no remaining statement uses.

## R03 (P3) — Gate `tex` (36 hits): code spans broken across lines

- **Location.** `TauCetiRoadmap/SpecialFunctionsAiry/README.md` lines 633–634, 980–981, 983–984 and 986–987. For example, line 633 opens a code span "`|Bi(x) − e^{ζ}/(√π x^{1/4}) ∑_{k<n} u_k ζ^{−k}|" that closes on line 634.
- **Claim.** Each of the four formulas is one code span split over two lines. The line-based scanner therefore reads the second half as TeX outside code.
- **Witness.** The gate at this head reports `tex=36`, and every hit is on these eight lines.
- **Repair.** Put each formula on one line, or move it into an indented `text` block as at lines 617–620, then rerun the gate.

## R04 (P3) — Gate `readme-ids-missing` (25)

- **Location.** `TauCetiRoadmap/SpecialFunctionsAiry/README.md` lines 352, 471, 759, 809, 832, 1110 and 1172; `TauCetiRoadmap/SpecialFunctionsAiry/Suggested.lean` lines 85 and 421.
- **Claim.** The 25 hits are of two kinds:
  - **Seven own names not declared.** These are backticked as this roadmap's declarations but are not in `Suggested.lean`: `airyBi_ode`, `airyBi_eq_ray_integral`, `airyPhase_expansion`, `airyAiZero_strictAnti`, `airyBiComplexZero_spec`, `airyAi_neg_laplace_complex` and `airyAi_repeated_integral`.
  - **Eighteen library names misread.** These are genuine pinned names, for example `Complex.Gamma_add_one` (Mathlib, `Analysis/SpecialFunctions/Gamma/Basic.lean:312`) and `Real.besselI_eq_rpow_mul` (Tau Ceti, `Analysis/SpecialFunctions/BesselI.lean:92`). The gate counts them as this roadmap's own because `Suggested.lean` opens `namespace Real` (line 85) and declares `Complex.Gamma_mul_Gamma_add_third` (line 421). That makes `Real` and `Complex` own namespaces.
- **Witness.** The gate lists the 25 names. Its rule treats any README identifier whose prefix is a namespace declared in the Lean file as an own declaration.
- **Repair.**
  - For the seven own names: state those facts in prose without the names, or declare `airyBiComplexZero_spec` as part of R02.
  - For the eighteen library names: rename the Lean-side `Real` sub-namespace and the `Complex.` prefix, for example `gamma_mul_gamma_add_third` and `realAiryAi`, or a `RealLine` sub-namespace. Update the README's backticked own names to match, and keep the intended Tau Ceti names (`TauCeti.Real.airyAi`, …) in the Conventions prose.

## R05 (P3) — Padding in `Suggested.lean`; a Check names Lean counterparts

- **Location.** `TauCetiRoadmap/SpecialFunctionsAiry/Suggested.lean`:
  - lines 219–230: `airyAi_zero`, `deriv_airyAi_zero`, `airyBi_zero`, `deriv_airyBi_zero`;
  - lines 396–397: `scorerGi_zero`;
  - lines 425–426: `integral_airyAi_Ioi`;
  - lines 298–301: `airyU_succ`.

  Also `TauCetiRoadmap/SpecialFunctionsAiry/README.md` lines 341–343.
- **Claim.** These declarations compute small values, restate a definition, or mirror a Check:
  - the four origin values are exactly the 1.1 Check, and that Check names them in Lean;
  - `integral_airyAi_Ioi` is `airyAi_mellin` at α = 1;
  - `airyU_succ` is the definition of `airyU` rewritten as a recurrence.
- **Witness.** One-tactic probe on a copy of the file: `airyAi_zero` and `airyBi_zero` each close with one `simp [airyAi, Complex.regularizedHGFunCoeff, div_eq_mul_inv]` (with `airyBi` for the second). The copy elaborated with no error on either.
- **Repair.** Delete the seven declarations from `Suggested.lean`; the README keeps them as targets and Checks. Remove the Lean names from the Check at lines 341–343, since a Check never names a Lean counterpart.

## R06 (P3) — Module docstring: catalogue framing; the statements that are not statable are not named

- **Location.** `TauCetiRoadmap/SpecialFunctionsAiry/Suggested.lean` lines 7–12: "suggested target signatures … The statements here suggest Lean forms for particular subsections, so that contributors and reviewers converge on names and signatures".
- **Claim.**
  - The file is the roadmap's acceptance test. Its docstring must say it states the headline theorems, and must name the headlines that cannot be stated at the pins.
  - 9.10.15–9.10.16 at complex `p` need `TauCeti.Complex.upperIncompleteGammaLog`, which does not exist at the pinned Tau Ceti. Only the real form (`airyAi_neg_laplace`) is stated, and the docstring does not say why.
- **Witness.** `upperIncompleteGammaLog` occurs in 0 files under the pinned Tau Ceti `TauCeti/`.
- **Repair.**
  - Retitle the docstring "Airy and Scorer functions: target signatures".
  - Say that the file states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti.
  - Name 9.10.15–9.10.16 at complex `p` as not statable, and the missing carrier: the logarithmic-plane incomplete Gamma function of SpecialFunctionsEiLiErfIncompleteGamma §1.5.

## R07 (P3) — Kummer's equation for `𝐌` is derived inline; SpecialFunctionsParabolicCylinder §1.3 owns it

- **Location.** `TauCetiRoadmap/SpecialFunctionsAiry/README.md` lines 438–439: "the left side by Kummer's equation for `𝐌`, which follows from `Complex.regularizedHGFunCoeff_add_one`".
- **Claim.** The route to Kummer's second transformation uses Kummer's differential equation for `𝐌`. That equation is not a target here and no supplier is named for it, yet an open roadmap owns it, and the pull request's merge-order paragraph already places that roadmap first.
- **Witness.** `TauCetiRoadmap/SpecialFunctionsParabolicCylinder/README.md` lines 332–336 at the head of #1801: "### 1.3 Kummer's equation … `regularizedHGFun_kummer_equation`, for all `a, b, z`", proved by the same coefficient recurrence.
- **Repair.** Add a "From SpecialFunctionsParabolicCylinder" subsection to Exact supplier contracts citing §1.3. Cite it in the 1.7 route and its *Needs:* line, in place of the inline derivation.

## R08 (P3) — Most definitions have no `**Checks.**` list

- **Location.** `TauCetiRoadmap/SpecialFunctionsAiry/README.md`. Only 1.1 (two bullets), 4.5 and 5.4 carry Checks. None appear at:
  - 3.1 (`u_k`, `v_k`, `χ`);
  - 3.5 (`R_n`, `S_n`, `p`, `q`, `p̃`, `q̃`);
  - 4.1 (`M`, `N`, `θ`, `φ`);
  - 5.2–5.3 (zeros);
  - 6.1 (`Hi`, `Gi`);
  - 7.8 (`Ai(a, z)`);
  - 8.5 (`K_Ai`);
  - 9.1 (`A_n`, `B_n`);
  - 9.4 (`U_m`, `V̄_m`, `W_m`, Smirnov's `U₁`, `U₂`);
  - 9.5 (`A_k`, `B₀`, `B_k`).
- **Claim.** Every definition needs at least three discriminating Checks: a computed value, a degenerate case, and a non-example or a plausible wrong model it excludes.
- **Witness.** `grep '^\*\*Checks'` finds three occurrences (lines 340, 773, 879).
- **Repair.** Add a Checks list to each defining subsection. Examples:
  - **6.1:** `Hi(0) = 3^{−2/3} Γ(⅓)/π = 0.40995…`, twice `Gi(0)` (this excludes a normalisation without `π⁻¹`); `Gi′(0.60907…) = 0`; `Gi(x) ∼ 1/(πx)` as `x → +∞` (this excludes `Gi = Hi − Bi`).
  - **9.1:** `A₁ = Ai`, `B₁ = Bi`, and at `n = 2` the reflection `A₂(−z) = ½ B₂(z)`.
  - **8.5:** `K_Ai(0, 0) = Ai′(0)² = 0.0669874…`.
  - **1.1:** add a third bullet.

## R09 (P3) — 5.3: the route does not prove that `β_k` is well defined for the first zeros

- **Location.** `TauCetiRoadmap/SpecialFunctionsAiry/README.md` lines 829–837: "the epsilons defining `β_k` and `β′_k` are attained and unique, `‖β_k‖` and `‖β′_k‖` are strictly increasing … Rouché's theorem on discs around the zeros of the leading terms".
- **Claim.**
  - 3.3–3.4 are `O`-statements with unspecified constants. The argument principle and Rouché built on them separate zeros only beyond some radius that the route never makes explicit.
  - For the first zeros, attainment and uniqueness of the epsilon (that is, distinct moduli) need explicit bounds. Only 3.5, through 9.2.10, supplies those, and *Needs:* omits 3.5.
  - DLMF §9.9(i) (DLMF-9.9 lines 96–102) only orders the zeros by modulus; it presupposes that the moduli are distinct.
- **Witness.** The *Needs:* line at 839 reads "3.3–3.4, 5.1–5.2; Tau Ceti `TauCeti.rouche` and `TauCeti.Contour.argumentPrinciple_divisor`", with no explicit-bound input.
- **Repair.** Either:
  - make the route effective: 9.7.17 (3.5) with 9.2.10 on the arcs, plus an explicit count in the initial region, and add 3.5 to *Needs:*; or
  - break ties in the definition of `β_k` (by modulus, then by argument), and state strict increase of `‖β_k‖` only from some `k₀` on.

## R10 (P3) — README and Lean differ in generality (Layer 9 `n`, the 7.6 half-plane)

- **Location.**
  - Layer 9: `TauCetiRoadmap/SpecialFunctionsAiry/README.md` line 1315 ("Throughout, `n ≥ 1`"), while `TauCetiRoadmap/SpecialFunctionsAiry/Suggested.lean` lines 480, 484, 492 and 500 quantify over every `n : ℕ`.
  - 7.6: README lines 1161–1163 ("with `±Im w > 0`"), while `Suggested.lean` line 448 takes `0 < w.im` only.
- **Claim.**
  - The four Layer 9 Lean statements include `n = 0`, which the README excludes. They are true there.
  - `tendsto_cauchyIntegral_Ioi` states only the upper side.
- **Witness.** At `n = 0` (`p = ½`):
  - `A₀(z) = e^{−z}/√(2π)` and `B₀(z) = e^{z}/√π`;
  - `𝒲 = √2/π = (2/π) · 2^{−1/2} · sin(π/2)`;
  - the integral form is `π⁻¹ z^{1/2} K_{1/2}(z) = e^{−z}/√(2π)`;
  - the 9.13.9 difference vanishes identically.
- **Repair.**
  - **Layer 9:** either add `(hn : 1 ≤ n)` to the four theorems, or say in Layer 9 that the statements hold for `n ≥ 0` and add the `n = 0` values as a Check.
  - **7.6:** either state the lower side in Lean (limit `L − πi f(s₀)`), or say in 7.6 that it follows by applying the upper case to `conj ∘ f`.

## R11 (P3) — 9.5: the finite-part remark depends on an unstated convention

- **Location.** `TauCetiRoadmap/SpecialFunctionsAiry/README.md` lines 1477–1479: "With a Hadamard finite part at `0` they define functions for which 9.13.36 holds only in the form `B₃ − B₁ = 2πi (A₂ + B₀)`".
- **Claim.** The form depends on how the finite part treats the `c₁/t` term:
  - With the standard Hadamard finite part (discard `−c₁ ln ε`), every ray gives the same finite part of `c₁/t`, and all three of 9.13.35–9.13.37 change, each by `(2πi/3) B₀`.
  - The README's form holds only if the logarithm is taken on DLMF's branch, `ln(εe^{iθ}) = ln ε + iθ` with `0 ≤ θ < 2π`.
- **Witness.** Write `g = t^{−p} e^{zt − t³/3} = c₁/t + (other Laurent terms) + (entire)`, with `c₁ = B₀(z, p)`.
  - With the real logarithm: `FP_θ − FP_θ′ = 2πi A − i c₁ (θ − θ′)`, hence `B₂ − B₃ = 2πi A₁ + (2πi/3) B₀`.
  - With the branch logarithm: the `iθc₁` term cancels for 9.13.35 and 9.13.37 and adds `2πi B₀` to 9.13.36.
  - Both conventions give `A₁ + A₂ + A₃ + B₀ = 0`.
- **Repair.** Name the convention in that sentence, or drop the remark (the material is under "Beyond").

## R12 (P3) — Locators

- **Location.** `TauCetiRoadmap/SpecialFunctionsAiry/README.md` line 657: "Nemes (2017b, (26) and Propositions B.1, B.3, B.4)"; line 1042: "DLMF 5.5.6 with `m = 3`".
- **Claim.**
  - "2017b" is DLMF's bibliography key and matches no entry of the README's References, which list one Nemes 2017 paper.
  - "(26)" is the journal's equation numbering. The open version, arXiv:1606.07961v2, numbers its equations (1.1), (1.2), …
  - DLMF 5.5.6 is stated with `n`, not `m`.
- **Witness.** Nemes2017 line 5 (arXiv v2); Propositions B.1, B.3 and B.4 at Nemes2017 lines 1734, 1833 and 1990. DLMF-5.5 line 302.
- **Repair.** Cite "Nemes (2017), Propositions B.1, B.3, B.4; arXiv:1606.07961". Give the arXiv equation number of the remainder representation, or record the journal's "(26)" as uncertified. Write "DLMF 5.5.6 with `n = 3`".

## Verified sound

**Gate and build.**
- **Gate at 0223c33:** fails on `tex=36` (R03) and `readme-ids-missing=25` (R04). Every other check is 0, including set_option, sorry-data, imports, statement-hygiene, depcheck, stray-files and outside-folder.
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SpecialFunctionsAiry'` is empty.
- **Dependency check:** `depcheck: 245 roadmaps, 2465 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- **Elaboration:** `lake env lean TauCetiRoadmap/SpecialFunctionsAiry/Suggested.lean` exits 0 with 51 warnings, all "declaration uses `sorry`".
- **Signatures:** I compared the elaborated types of all 85 declarations (51 theorems, 34 definitions) with the README. The file has no `variable` lines, so no binder can drop. The casts are as intended: `4 * ↑k - 1` is computed in ℝ in `airyAiZero_expansion`, the factors of `airyU_succ` are cast to ℝ, and the powers in the sector statements are `zpow`. Mismatches are only those in R10.

**Library declarations opened at the pins.**
- **Mathlib:**
  - `Complex.besselJ` (`Analysis/SpecialFunctions/Bessel.lean:55`) and `besselJ_def` (:59), as `(x/2)^a · F₀₁(a+1)(−(x/2)²)`;
  - `analyticOnNhd_besselJ` (:79), on the slit plane;
  - `regularizedHGFunCoeff` (`RegularizedHypergeometric.lean:67`), `regularizedHGFun` (:192), `regularizedHGFun_zero` (:195), `regularizedHGFunCoeff_add_one` (:93), `analyticOnNhd_regularizedHGFun_of_card_le` (:282), `analyticAt_regularizedHGFun_zero` (:296, `fun_prop` for `AnalyticAt` only);
  - Gamma: `Gamma_add_one` (`Gamma/Basic.lean:312`; the real one at :410), `Gamma_eq_integral` (:319), `Complex.Gamma_ofReal` (:419);
  - `Gamma_mul_Gamma_add_half` (`Gamma/Beta.lean:580`), `Gamma_mul_Gamma_one_sub` (:398), `Gamma_mul_Gamma_eq_betaIntegral` (:124, which needs `0 < re s, re t`);
  - `convexOn_log_Gamma` (`BohrMollerup.lean:111`) and `eq_Gamma_of_log_convex` (:307). The same file at line 36 records the general multiplication formula as a TODO, which confirms that 7.1 is not in Mathlib;
  - `integral_rpow_mul_exp_neg_rpow` (`MeasureTheory/Integral/Gamma.lean:26`, with `0 < p` and `−1 < q`);
  - `mellinInv_mellin_eq` (`Analysis/MellinInversion.lean:92`), `digamma` (`Gamma/Digamma.lean:48`), `eulerMascheroniConstant` (`NumberTheory/Harmonic/EulerMascheroni.lean:131`);
  - `integral_boundary_rect_eq_zero_of_differentiableOn` (`Analysis/Complex/CauchyIntegral.lean:313`), `eqOn_of_preconnected_of_eventuallyEq` (`Analytic/Uniqueness.lean:224`), `integral_integral_swap` (`MeasureTheory/Integral/Prod.lean:481`), `hasDerivAt_integral_of_dominated_loc_of_deriv_le` (`Calculus/ParametricIntegral.lean:569`).
- **Tau Ceti:**
  - `Complex.hasSum_regularizedHGFun` (`Analysis/SpecialFunctions/RegularizedHypergeometric.lean:53`, namespace `Complex`, `a.card ≤ b.card`);
  - `Real.besselI` (`BesselI.lean:81`, the real part of `(x/2)^ν 𝐅(ν+1, (x/2)²)` as the README says), `Real.besselI_eq_rpow_mul` (:92), `Real.hasSum_besselI` (:102, `0 < x`);
  - `TauCeti.regularizedGamma` (`IncompleteGamma.lean:120`, junk value 0 for `s ≤ 0`; used only at `s = ⅓, ⅔`);
  - `TauCeti.wronskian_eq_of_hasDerivAt` (`Analysis/ODE/Wronskian.lean:31`);
  - `TauCeti.rouche` (`Analysis/Complex/Conformal/Rouche.lean:294`) and `TauCeti.rouche_exists_eq_zero_iff` (:359);
  - `TauCeti.Contour.argumentPrinciple_divisor` (`Analysis/Contour/Argument/Divisor.lean:62`).

**Cross-roadmap citations resolved.**
- **AsymptoticExpansions at its open head:** every cited section exists and says what the README uses: Conventions (`Asymptotics.HasAsymptoticExpansion`, generalized expansions written out), §1.5, Layer 2, §3.1, §3.2, §4.2, §4.3 (logarithmic coordinates, gluing, the expansion on `−α₂ − π/2 < Im ζ < −α₁ + π/2`), §8.2 (line shift with simple poles and its iteration), §8.6 (`exists_norm_Gamma_le`), §10.2.
- **SpecialFunctionsEiLiErfIncompleteGamma at its head:** the Conventions and §1.5 exist; `upperIncompleteGammaLog_log` gives equality with `Γ(a, z)` on the slit plane.
- **RandomMatrices §8.4 on main:** read; see R01.
- **Ownership:** checked by object with `roadmaps grep` over main and all open heads for Airy and Scorer functions, the Gauss multiplication formula, Sokhotski–Plemelj, Kummer's second transformation and the `J₀` integral. Only RandomMatrices (R01) and SpecialFunctionsParabolicCylinder (R07) overlap.
- **Overlap listing (`roadmaps overlaps`):** no dropped ids and no other pull request changes this folder.
- **Outside the brief's checkout list:** SpecialFunctionsParabolicCylinder, AsymptoticExpansions and SpecialFunctionsEiLiErfIncompleteGamma are not in the brief's list of open checkouts. I read them through `roadmaps show`.

**Sources sample** (DLMF version 1.2.8, read at dlmf.nist.gov; square roots checked in the MathML, which the text extraction drops). Each target was checked against the source at its locator: the equations, the hypotheses, and that the source supports the statement as written.

| Target | Locator checked | Result |
|---|---|---|
| 1.5 | 9.2.16 (DLMF-9.2 lines 741–767): `W′ + W² = z`, `W = w′/w` | matches |
| 3.3 | 9.7.7–9.7.8, sector `|ph z| ≤ π/3 − δ` (DLMF-9.7 lines 405–455) | matches; route via 9.2.10 checked (value of `ζ` at `z e^{∓2πi/3}` is `−ζ`) |
| 3.5 | 9.7(iii)–(iv) (DLMF-9.7 lines 750–761, 770–809, 887–953); σ = 1/6, n ≥ 0 for `R_n`; σ = 0, n ≥ 1 for `S_n`; `√(2π(n+σ))` in the third case | matches; Nemes Propositions B.1, B.3, B.4 exist in arXiv v2 |
| 5.1 | §9.9(i) (DLMF-9.9 lines 90–102) | matches; simplicity is proved in the README, not in DLMF |
| 6.1 | 9.12.1–9.12.3 (DLMF-9.12 lines 84–159); `−Gi` is DLMF's particular solution | matches |
| 6.7 | §9.12(ix) (DLMF-9.12 lines 1365–1372) | matches, including the unique positive zero 0.60907… of `Gi′` |
| 7.1 | 5.5.6 (DLMF-5.5 line 302) | matches; see R12 for `n`/`m` |
| 7.5 | 9.10.13–9.10.16 (DLMF-9.10 lines 508–611); 9.10.16 has `1/√3` | matches |
| 7.6 | 9.10.17–9.10.19 (DLMF-9.10 lines 664–765) | matches |
| 7.8 | §9.14 (DLMF-9.14 lines 42–46): definition only | matches; the properties are the README's own, checked below |
| 8.2 | 9.11.5–9.11.14 (DLMF-9.11, MathML of E5–E14) | all ten match |
| 8.3 | 9.11.3 (x ≥ 0, DLMF-9.11 lines 157–161) and 9.11.4 | matches |
| 9.2 | 9.13.4–9.13.7 (DLMF-9.13 lines 179–289) | matches; the `|ph z| < 2pπ` condition is the README's own and correct |
| 9.4 | 9.13.13–9.13.24 (DLMF-9.13 lines 497–852); `√(2π)` in 9.13.15, `√π` in 9.13.16 | matches; the sector of 9.13.18 is corrected in the README (see Source issues) |
| 9.5 | 9.13.25–9.13.37 (DLMF-9.13 lines 905–1345); the branch `0 ≤ ph t < 2π` | matches for `p ≤ 0`; see R11 and Not verifiable |

**Adversarial table** (values computed by hand, with exact rationals, or in floating point from the Maclaurin series; DLMF values quoted where they exist).

| Statement | Instances | Values (left / right) | Result | Change |
|---|---|---|---|---|
| 1.1 pinned `Ai`, `Bi` | `z = 0`, `z = 1` | `Ai(0)` 0.3550280539 / `3^{−2/3}/Γ(⅔)` 0.3550280539; `Bi(1)` 1.2074235950 (DLMF 1.20742 35950); `Ai(a₁)` with `a₁ = −2.33810741` gives `−2·10⁻¹⁷` | holds | — |
| 1.1 `Ai′` formula | `z = 0` | `−3^{−1/3} 𝐅(⅓, 0) = −0.2588194038 = Ai′(0)`; uses the contiguous relation `𝐅(b−1) = (b−1)𝐅(b) + x𝐅(b+1)` at `b = 4/3` | holds | — |
| 1.2 constants `c₁, c₂` | `w = Ai`, `w = Bi` | `(c₁, c₂) = (π·𝒲, 0) = (1, 0)` and `(0, 1)` | holds | — |
| 1.4 9.2.14–9.2.15 | `z = 0`; derivation from 9.2.10, 9.2.12 at `−z` | `2cos(π/3)Ai(0) = Ai(0)`; `−ω^{−1} = e^{πi/3}`, `−ω = e^{−πi/3}` reproduce DLMF-9.2 lines 672–701 | holds | — |
| 1.7 9.6.7 | `z → 0+` | `−(z/3)(ζ/2)^{−2/3}/Γ(⅓) → −3^{−1/3}/Γ(⅓) = Ai′(0)` | holds | — |
| 1.7 9.6.25–9.6.26 | `z = 1` | `Bi(1)` 1.2074235950 / Kummer form 1.2074235950; `Bi′(1)` 0.9324359334 / 0.9324359334 | holds | — |
| 1.7 Kummer's second transformation | `2a ∈ {0, −1, …}` | the right side is 0 since `Γ(2a)⁻¹ = 0`, but `𝐌(a, −n, x) ≠ 0` in general, so the hypothesis is needed; it is present (`ha`) | holds | R07 (route) |
| 2.3 9.5.6 | `z = 0` | `(√3/2π)·3^{−2/3}Γ(⅓) = 3^{−2/3}/Γ(⅔) = 0.35503` | holds | — |
| 2.4 9.5.8 leading term | `ζ → ∞` | prefactor `× 2^{−1/6}Γ(5/6) = e^{−ζ}/(2√π z^{1/4})`, since `(96ζ)^{1/6} = 2z^{1/4}` | holds | — |
| 3.1 `u_k`, `v_k`, recurrence | `k ≤ 5` exact | `u₁ = 5/72`, `u₂ = 385/10368`, `v₁ = −7/72`, `v₂ = −455/10368`; recurrence exact for `k < 6` | holds | R05 (padding) |
| 3.5 9.7.17 | `z = 5e^{0.9i}`, `5e^{1.8i}`, `6e^{2.3i}`, `4e^{2.6i}`; `n = 1, 2, 3` | e.g. `4e^{2.6i}`, `n = 2`: `|R₂|` 1.27e−3 ≤ 1.36e−2; `5e^{0.9i}`, `n = 1`: 9.12e−3 ≤ 9.32e−3 | holds | R02 |
| 3.5 `S₀` excluded | `x > 0` | `S₀ = 1 + 7/(72ζ) + … > 1 = |v₀|`, so `n ≥ 1` is needed | holds | — |
| 3.5 `p̃` at `N = 0` | signs of the terms of `P′` | `+1`, `−v₂ > 0`, `v₄ < 0`, … : the first two have the same sign, so `N ≥ 1` | holds | — |
| 3.6 tail bound | `x ∈ (0, 6)` | `−Ai′(x) > √x Ai(x)` at all sample points; `h′ = −(W − √x)h + 1/(2√x)` rechecked | holds | — |
| 4.5 9.8.20–9.8.23 | exact, `k ≤ 4` | from 3.4: `M²` has coefficients `−5/32`, `1155/2048`, `−425425/65536 = (−1)^k a_k`; `c₁…c₄` and `d₁…d₄` equal the printed values | holds | — |
| 5.2 9.9.1–9.9.5 | Wronskian at zeros | `Bi(a_k) = (−1)^k M` gives `Ai′(a_k) = (−1)^{k−1}/(πM)`; `φ(a′_k) = (k−1)π` (DLMF-9.9 line 128); `−da/dt = π²M²` | holds | — |
| 5.4 `T`, `U`, `V`, `W` | `n = 1…5` exact reversion | all 20 printed rationals equal the reversion; `t₁ = 9π/8` gives `T ≈ 2.3384` against `−a₁ = 2.33811` | holds | — |
| 5.3 enumeration | small `k` | uniqueness needs distinct moduli; the route gives only ineffective `O`-bounds | gap | R09 |
| 6.2 9.12.6 | `Gi(0)` | 0.2049755425 / `1/(3^{7/6}Γ(⅔))` 0.2049755425 | holds | R05 |
| 6.3 9.12.12 | derivative at 0 | the README form gives `½(e^{−πi/3} + e^{πi/3})Hi′(0) = Gi′(0)`; the swapped form would give `−Hi′(0)` | holds (matches DLMF) | — |
| 6.3 9.12.13–9.12.14 | `z = 0` | `Ai(0) = (√3/2)Hi(0)`; `e^{2πi/3} + √3e^{−πi/6} = 1` | holds | — |
| 6.5 9.12.24 | residues | `Res_{s=n} Γ(−s) = (−1)^{n+1}/n!`, so `∫dy = 2π∑Γ((n+1)/3)(3^{1/3}z)^n/n! = 2π²3^{2/3}Hi(z)` | holds | — |
| 6.6 9.12.29 (uniform in `|ph z| ≤ π − δ`) | `π/3 < ph z ≤ π − δ` via 9.12.14 with `ε = 1` | `ζ(ze^{−2πi/3}) = −ζ`, `2e^{−πi/6}Ai(ze^{−2πi/3}) ∼ e^{ζ}/(√π z^{1/4})∑u_kζ^{−k}` | holds | R02 |
| 6.6 9.12.31 | `X = 12` | integral 1.0301478142 / expansion (3 terms) 1.0301478149 | holds | — |
| 6.7 | `Gi′` near 0.6090754 | `Gi′(0.5) = +0.0199`, `Gi′(0.6090754) ≈ 3·10⁻⁹`, `Gi′(0.7) = −0.0143`; `E′ = −Gi²` by algebra | holds | R02 |
| 7.1 | `z = ⅓` | `Γ(⅓)Γ(⅔) = 2π·3^{−1/2}` (reflection) | holds | — |
| 7.3 9.10.7 | `x = −10, −20, −30` | integral −0.0150404, 0.0390617, 0.0158727; README leading term −0.0123989, 0.0394981, 0.0160867; DLMF's sign gives the opposite | README correct | Source issues |
| 7.5 9.10.15–9.10.16 | ODE `L′ = p²L − py(0) − y′(0)` | `L_B = 3^{−1/2}e^{P}(Q(⅔,P) − Q(⅓,P))`, `L_A = ⅓e^{P}(Q(⅓,P) + Q(⅔,P))`; at `p → 0`: ⅔ and 0 | holds | R06 |
| 7.6 9.10.17–9.10.18 | `α = 1`; boundary jump | `Γ(1)/(3Γ(1)) = ⅓`; `G₊ − G₋ = −i t^{−5/4} e^{−(2/3)t^{3/2}} Ai(t)` via 9.2.11 | holds | R10 |
| 7.8 incomplete `Ai` | `∂²_z − z` | `(2πi)⁻¹∫(t² − z)e^{t³/3 − zt}dt = (2πi)⁻¹ f_z(a)` | holds | R08 |
| 8.1 | Taylor coefficients | `(k+1)(k+2)(k+3)a_{k+3} = (4k+2)a_k` | holds | — |
| 8.2 9.11.14 | `d/dz` | `(π/2)·2AiBi𝒲/(Ai² + Bi²)² = AiBi/(Ai² + Bi²)²` | holds | — |
| 8.3 auxiliary `Ai²` integral | `x = 1, 0, −1.5, −3` | 0.018304037912 / 0.018304037916; 0.126044919047 / …051; 0.215534169983 / …986; 0.143500269095 / …097 | holds | — |
| 8.3 9.11.3–9.11.4 | `x = 0`, `z = 0` | both sides `4π·3^{−5/6}/Γ(⅔)²`; `4Ai(0)²` 0.5041796762 / 0.5041796762 | holds | — |
| 8.4 9.11.15 | `α = 1` | 0.0669874838 / `Ai′(0)²` 0.0669874838 | holds | — |
| 8.5 kernel | closed form, diagonal | `∂_t(…) = (y − x)Ai(x+t)Ai(y+t)`; L'Hôpital gives `Ai′² − xAi²` | holds | R01 |
| 9.1 | `n = 1`; `n = 0` | `p = ⅓` gives `Ai`, `Bi`; at `n = 0`, `𝒲 = √2/π` = 9.13.8 | holds (also at `n = 0`) | R10 |
| 9.2 | series, even `n` | `p z^{1/2} I_{−p}(ζ) = p^{1−p}𝐅(1−p, p²z^{n+2})`; `A_n(−z) = p^{1/2}B_n(z)`; `2√(p/π)cos(pπ/2)` and `−(2/√π)sin(pπ/2)` match the MathML | holds | — |
| 9.3 | `n = 0`; leading term | `π⁻¹z^{1/2}K_{1/2}(z) = A₀`; `n = 1`: `√(1/3π)·sin(π/3) = 1/(2√π)` | holds | R10 |
| 9.4 `W_m` | from 9.13.20–9.13.24 | gives exactly the README formula; 9.13.16 consistency `√(2π)m^{−1/2}(m/2)^{(m−1)/m} = √π(m/2)^{(m−2)/(2m)}` | holds | — |
| 9.5 connection sum | `p ∈ ℤ` | the rays at `2π/3`, `4π/3` cancel, `0` and `2π` coincide; the arcs give `−∮`, so `A₁+A₂+A₃ = −B₀` | holds | R11 |

**Headline theorems** (from Scope items 1–9).
- **Stated:** Airy's equation with uniqueness, Wronskian and connection formula; the `J` and Kummer forms; the ray, cosine and Laplace integrals; 9.7.5, 9.7.7 and 9.7.9; the `M²` expansion; the enumeration and phase of `a_k` and its expansion; the complex-zero sector; the Mellin–Barnes integral; the triplication formula; the Mellin and Laplace transforms; Sokhotski–Plemelj; product uniqueness; 9.11.3; the kernel; the generalized ODE, Wronskian, integral and asymptotics; Reid's connection sum.
- **Absent or weakened (R02):** 9.7.17 beyond `|ph z| ≤ π/3`, the `β_k` enumeration, 6.6 and 6.7.
- **Not statable at the pins (R06):** 9.10.15–9.10.16 at complex `p`.

## Not verifiable

- **Nemes (2017), *Acta Appl. Math.* 150, equation (26):** the journal version is behind a paywall. I read arXiv:1606.07961v2, which numbers its equations differently (R12).
- **DLMF Figures 9.13.1–9.13.2 (the paths `ℒ_k`, `ℐ_k`):** images; neither the PNG nor the PDF could be rendered here. I checked the README's paths `C(α_k, β_k)` and the rays of `B_k` against 9.13.28–9.13.30 and 9.13.33 instead.
- **Not fetched:** Olver (1974), Vallée–Soares (2004), Laurenzi (1993), Reid (1972, 1995), Drazin–Reid (1981), Swanson–Headley (1967), Olver (1977, 1978) and Smirnov (1960). Each statement the README draws from them is quoted from DLMF and was checked against DLMF.

## Source issues

- **Error** in DLMF at 9.10.7 (§9.10(ii), Version 1.2.8): the source says the leading term of `∫_{−∞}^x Bi` as `x → −∞` is `+π^{−1/2}(−x)^{−3/4} sin(ξ + π/4)`; it should be `−π^{−1/2}(−x)^{−3/4} sin(ξ + π/4)`, since the derivative must reproduce 9.7.11 (at `x = −10` the integral is −0.01504); affects a stated result.
- **Misprint** in DLMF at 9.13.18 (§9.13(i)): the source gives the recessive sector as `−(2j−1)π/m ≤ ph z ≤ (2j+1)π/m`; it should be `(2j−1)π/m < ph t < (2j+1)π/m` (the printed one degenerates to a ray at `j = 0`); affects a stated result.
- **Gap** in DLMF at 9.12.24 (§9.12(vii)): the source states the Mellin–Barnes integral for `Hi` with no sector of validity; it converges and holds only for `|ph(e^{πi}z)| < 2π/3`, which should be stated; affects nothing.
- **Gap** in DLMF at 9.13.22 (§9.13(i)): the source relates Smirnov's functions to `W_m` for every positive integer `α`; `W_m` is defined only for even `m = α + 2` (9.13.17), so only even `α` is meaningful; affects nothing.
- **Gap** in DLMF at 9.13.27 (§9.13(ii)): the source defines `B_k(z, p)` for all integers `p`; reading the paths as rays from `0` (as 9.13.30 implies) the integral diverges at `t = 0` for `p ≥ 1`, so it should restrict to `p ≤ 0` or define a finite part; affects nothing.
