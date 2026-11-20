# Review of LFunctions (pull request #2626 at 1afcbdc)

**Verdict:** accepted

**Summary.** Accepted: this head has no finding. §7.3 now splits the cancellation of the unitary weight on the angular frequencies, so `χ₄·N` over `ℚ` goes through a ray class character of `(4)·∞`, and every finding of the previous review is repaired. Three small corrections remain:
- §8.2's step 3 is consumed by ExplicitNumberFields as a Layer 8 result but is only a route step here;
- the same step does not cite Tau Ceti's asymptotic for `log ζ_K`;
- the description says that no declaration was added, but two were.

There are no format notes. One item is left for a human: Neukirch, the source of 56 of the 76 source mentions, could not be read.

## C01 — The series for the Mertens constant in step 3 of §8.2 is consumed by another roadmap as a Layer 8 result, but here it is only a step of a route

ExplicitNumberFields, an open new roadmap, consumes from LFunctions Layer 8 the series `γ + log κ_K + Σ_𝔭 (1/N𝔭 + log(1 − 1/N𝔭))` for the Mertens constant of `K`, for its bound (M2). See its README lines 2725, 2751 and 3025. Here that identity is step 3 of the route of `tendsto_prod_one_sub_inv_absNorm_div_log` (README lines 1717–1722). A route does not bind the implementer, so someone who proves the product another way owes the consumer nothing.

One option is a sentence in §8.2 that makes it a target: "Prove that `B_K = mertensConstant K` equals `γ + log κ_K + ∑_𝔭 (log(1 − N𝔭⁻¹) + N𝔭⁻¹)` (Lebacque, Proposition 3)", with the name in prose. Another is to list the identity among the downstream contracts.

## C02 — Step 3 of §8.2 re-derives an asymptotic for `log ζ_K(1 + δ)` that Tau Ceti already proves

Step 3 obtains `log ζ_K(1 + δ) = −log δ + log κ_K + o(1)` "from the Euler product of `ζ_K` and the residue". The *Needs:* line (README lines 1726–1729) names only `EulerProductData` and Mathlib's residue, so an implementer would prove this again. Two declarations at the pin already supply it:
- `TauCeti.tendsto_log_dedekindZeta_re_sub_log_one_div_sub_one` (`NumberTheory/ArithmeticDirichletSeries/Prime/IdealZetaSum.lean:117`) states that `log ζ_K(s) − log(1/(s − 1))` tends to `log κ_K` as `s → 1⁺`.
- `TauCeti.log_dedekindZeta_re_eq_tsum_neg_log_one_sub` (`…/EulerProduct/Logarithm/DedekindZeta/Basic.lean:121`) writes `log ζ_K(s)` as `∑_𝔭 −log(1 − N𝔭^(−s))`, the series that dominated convergence acts on.

Name both in step 3 and on the *Needs:* line.

## C03 — The description says that no declaration was added, but this head adds two

The Suggested.lean paragraph says: "No declaration was added; the 180 remaining are the old ones with the changes listed above." The head declares `Grossencharacter.unitaryCompletion_congr` (`Suggested.lean` line 1387) and `Grossencharacter.rootNumber_congr` (line 1394). Neither name occurs in the `Suggested.lean` on main; the same paragraph lists both among the proved corollaries. The text would be right as: "Two declarations were added, `Grossencharacter.unitaryCompletion_congr` and `Grossencharacter.rootNumber_congr`, corollaries of `grossencharacterData_congr`; the other 178 are the old ones with the changes listed above."

## Earlier findings

These are the remarks of the review of `966e5f8`.

- **R01 (the cancellation route split on the order of the Hecke character): repaired.** §7.3 now reads "Split on the angular frequencies `k_w` of the infinity type at the complex places, not on the order of the Hecke character" (README lines 1502–1503).
  - With every `k_w = 0`, the unitary part is trivial on Tau Ceti's `raySubgroup` of `𝔪⁺` (`Ideles/Ray/Subgroup.lean:65`, the image of `ideleCongruenceSubgroup`), so `mem_range_ofRayClassCharacter_iff` (`HeckeCharacter/Basic.lean:146`) applies.
  - The Landau step now goes through the same `η`.
  - The docstring of `Grossencharacter.unitaryCancelling` (`Suggested.lean` lines 2031–2039) and the description's §7.3 sentence agree with the README.
- **C01 (sign in step 3 of §8.2): repaired.** The step now reads "the difference `∑_𝔭 N𝔭^(−1−δ) − log ζ_K(1 + δ)` of the two left sides tends to `∑_𝔭 (log(1 − N𝔭⁻¹) + N𝔭⁻¹)`" (lines 1719–1721).
- **C02 (removed Layer 1 names still cited elsewhere): repaired.** Scope and ownership (lines 1837–1840) maps the three names. `covolume_mixedDual` (`PoissonSummation.lean:250`) states `covol(mixedDual L) = covol(L)⁻¹`, which is the old statement.
- **C03 (§§7.3–7.5, 5.4 and 6.9 without a locator): repaired.** Hecke's *Zweite Mitteilung* is now cited at the claim:
  - §6 (45) at §5.4 and §6.9;
  - §7 (46) at §7.3 and §7.5;
  - §9, p. 44 at §7.4.

  All three locators were checked against the text. The `ζ_K` case of §7.3 (`meromorphicOrderAt_dedekindZetaC_one_add`) still has no source; it is a standard fact.
- **N01 (`UnitaryIdealWeight.imaginaryNormTwist` in a docstring): repaired.** Line 1052 now reads `imaginaryNormTwist`.
- **The question on Neukirch's closed form of `W(χ)` in VII (8.5):** the text is unchanged and the book is still unreadable (see Not verifiable).

## Verified sound

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 1.1 Gaussian and theta at one parameter | `ℚ`; `ℚ(i)` | covol `1`, `θ(t)=t^(−1/2)θ(1/t)`; covol `1·2⁻¹·√4=1`, factor `t⁻¹`; trace dual `½ℤ[i]` would differ | sound |
| 1.2 `mixedFourier_archGaussian`, `latticeTheta_inv` | real, complex place; real quadratic | `y^(−1/2)`; `y⁻¹=(y²)^(−1/2)`; `unitScale ε: (ε²y₁, ε⁻²y₂)`, `N(y)` kept | sound |
| 1.3 `surfaceHaar_of_isUnitFundamentalDomain` | `ℚ`; `ℚ(i)`; real quadratic; general | `1`; `∫_1^√e dy/y=½`; `2 log ε`; Jacobian `1/m₀` × covol `2^(r−1)R/∏_{w≠w₀}m_w` = `2^(r−1)R/2^r₂` | sound |
| 2.2 change of modulus | `(5)` under `(10)` | classes `{±1},{±3}` mod 10; `{1,9}↦±1` mod 5; `ζ(s,[1]_(5))` also counts `4, 6, 14, 16` | sound |
| 3.3 unfolding, `mellinKernel_inv` | `ℚ`; `ℚ(i)`; any lattice | `½∫(θ−1)y^(s/2)dy/y=Γ_ℝζ`; `(2/4)·4π^(−s)Γ(s)ζ_K=4^(s/2)Γ_ℂζ_K`; `N(y)^(−1/2)=u^(1/2)V` | sound |
| 3.3 `mellinKernel_dualIdealLattice` | `traceToEuclidean` | `|2z|²=4|z|²=m_w²·|z|²`; `16^r₂/V_T²=V⁻²` with `V_T=4^r₂V` | sound |
| 3.5 Dedekind headline: residue, FE | `ℚ(i)`; per class | `2^(r₁+r₂)hR/w=½=√4·(1/π)·(π/4)`; class residue `2a₀=2^rR/w` | sound |
| 3.6 `dedekindZetaC_leading_zero` | `ℚ`; `ℚ(i)`; real quadratic | `−½`; `(−½)(½)=−¼=−hR/w`; `−h log ε/2=ζ(0)L′(0,χ_d)` | sound |
| 3.7 normalization | `ℚ(i)` | `2^s·2(2π)^(−s)Γ(s)=2π^(−s)Γ(s)`; `Γ_ℝ(s)Γ_ℝ(s+1)=2^(1−s)π^(−s)Γ(s)=Γ_ℂ(s)` | sound |
| 4.2 cyclotomic | mod 4; `ℚ(ζ₅)` | `∏L=ζ(1−2^(−s))L(χ₄)=ζ_(ℚ(i))(1−2^(−s))`; prime 5 gives `(1−5^(−s))⁻¹` through `ζ` alone | sound |
| 5.1 presented series | trivial at `(4)∞`; odd mod `4∞` | `ζ(s)(1−2^(−s))`; weight `−1` at `(3)`, `1` at `(5)`, `0` at `(2)`; route by `heckeLFunctionC_eq_primitive` (Hecke/Basic.lean:130) | sound |
| 5.3 Gauss sums | `χ₄`, `y=¼`; mod 5; order 3 mod 7 | `i+i=2i`; `τ(2/5)=−√5`; `ρ(−1)=ω³=1`; `a=5, y=1/25` would force `√5=0` | sound |
| 5.4/6.9 FE headline | odd mod `4∞`, `D={1}` | `F(u)=½∑χ₄(m)m e^(−πum²/4)`; Mellin at `(s+1)/2` is `4^(s/2)Γ_ℝ(s+1)L`; `F(1/u)=u^(3/2)F(u)`, `W=1` | sound |
| 6.1 presentation pins | trivial; `N^m`; `χ₄N` at `(4)` | weight `1`, type `0`; supplier shift `−m`, ideal-side `m`; archimedean `x⁻¹` odd, exponent `−1` odd | sound |
| 6.3 sign of the shift | `‖·‖` over `ℚ` | `χ(π_p)=1/p`; ideal-side `−1`: `p^(−1)` agrees; supplier shift `1` would give `p` | sound |
| 6.4 unit relation | angular, `a=2+i` | finite `((3+4i)/5)^(2k)`, archimedean `(2+i)^(−2k)(2−i)^(2k)=((3+4i)/5)^(−2k)`, product `1` | sound |
| 6.6 card | angular `k`; `N^m`, `m` odd | `|−2k−2k|/2=2|k|`, conductor `4·1`; real parity `0`, unitary part trivial, poles `{0,1}` | sound |
| 6.7 finite character | odd mod `4∞`; `‖·‖^(−m)`, `m` odd | `χ_f(−1)=sgn(−1)=−1`, `χ_f(3)=−1`; `|n|^m n^(−m) sgn(n)^m=1` | sound |
| 6.8 kernel constants | `ℚ(i)` angular, `k≥1` | `F=2^(−2k−2)∑a^(4k)e^(−πu^(1/2)|a|²)`; Mellin at `(s+2k)/2` is `2^(1−2k)π^(−s−2k)Γ(s+2k)L=4^(s/2)Γ_ℂ(s+2k)L` | sound |
| 6.10 finite-order case | odd mod `4∞` | `Tr p=1`, `θ(t)=2t(F(t²)−0)`, scale `1·4=4` | sound |
| 7.1 nonvanishing headline | `χ₄`, `t=0` | `L(1,χ₄)=π/4`; `3-4-1` orders `−3+4−1=0`; Loeffler–Stoll p. 54 gives Mathlib's quadratic case by positivity | sound |
| 7.3 route, frequency split | `χ₄N/ℚ` | no complex place, so all `k_w=0`; `χ₄` trivial on `raySubgroup((4)∞)`, `η=χ₄≠1` | repaired |
| 7.3 weighted count | shell `[X,2X]` | in the cone `|x_w|≍X^(1/n)`, Lipschitz `X^(−1/n)`, error `X^(1−1/n)`; geometric for `n≥2` | sound |
| 7.3 Landau step | `ζ_K L(χ_u)`, `χ_u²=1` | coefficient at `𝔭^k`: `k+1`, `(1+(−1)^k)/2`, `1`; at least `ζ_K(2s)→∞` at `½⁺` | sound |
| 7.3/7.5 Hecke (46) | `A(x)=O(xe^(−c√log x))` | `∑λ(𝔭)N𝔭^(−s)=s∫A x^(−s−1)`; at `Re s=1` integrand `≤ e^(−c√v)` | sound |
| 7.4 Hecke §9 | `ℚ(i)`, `𝔣=1` | `g=4`: `(α/|α|)^(4k)=(α/ᾱ)^(2k)`; `Γ(s+|ga|/2)=Γ(s+2|k|)`, shift `2|k|` | sound |
| 8.1 cards | `ℚ`; `ℚ(i)`; odd mod `4∞` | Mathlib `Λ(0)=Λ₀(0)−1` vs canonical `0`; coefficient at 5 is `2`; conductor `4`, shift `1`, `W=1` | sound |
| 8.2 Mertens headline | `ℚ`; `ℚ(√−5)`; `ℚ(i)` | `e^γ≈1.781`; `κ=4π/(2√20)=1.405`; `π/4`; reversed product `~e^(−γ)/(κ log x)` | sound |
| 8.2 step 3 | `ℚ` | difference `→∑(log(1−1/p)+1/p)=−0.31572=B−γ` | repaired |
| C01, C02: step 3 inputs and consumer | ExplicitNumberFields 2725; IdealZetaSum.lean:117 | consumer cites Layer 8 for the series; pin states `log ζ_K(s)−log(1/(s−1))→log κ_K` | C01, C02 |
| C03: description | `Suggested.lean` on main | neither `Grossencharacter.unitaryCompletion_congr` nor `Grossencharacter.rootNumber_congr` occurs; head declares both (1387, 1394) | C03 |

- **Source locators checked against the text:**
  - `hecke-zetafunktionen-ii`: §6 (45), p. 35 (lines 1014–1035); §7 (46), p. 35 (1036–1059); §9, p. 44 (1375–1393); pages 11–51 (lines 108, 1681).
  - `lebacque-mertens`: Theorem 5 (NF), p. 5 (193–223); Propositions 2 and 3, pp. 8–9 (369–373, 457–490).
  - `loeffler-stoll-lean`: §6, p. 54 (423–458).
  - The 56 Neukirch and 2 Washington locators were not read.
- **Library declarations opened at the pins:**
  - Tau Ceti: `HeckeCharacter/Basic.lean:98,110,146`; `Ideles/Ray/Subgroup.lean:65`; `Ideles/Congruence.lean:193`; `ArithmeticDirichletSeries/Cancellation.lean:97,481`; `RayClass/Character/Cancellation.lean:81`; `LFunctions/Hecke/Basic.lean:74–138`; `TraceDual.lean:187,200`; `PoissonSummation.lean:250`; `Prime/IdealZetaSum.lean:117`; `EulerProduct/Logarithm/DedekindZeta/Basic.lean:121`; `LFunctions/Mertens.lean:375,545,564`.
  - Mathlib: `NumberField/DedekindZeta.lean:50–78`.
  - A further 70 cited declarations were found by name at the pins.
- **Cross-roadmap citations resolved:**
  - Suppliers: ArithmeticDirichletSeries and GlobalNumberFields are completed on main.
  - Owners of deferred objects: AnalyticNumberTheoryPartI on main owns §§2.3a, 2.18a and 2.2a; ThetaSeries on main (lines 122–126) cedes the mixed-space theta.
  - Consumers: ZerosOfLFunctions on main (486–487, 1164) and at its open revision cites layers only. ExplicitNumberFields cites Layers 3–5, 7 and 8 (C01). QuasiRiemannHypothesis cites `gaussSum_mul` and Layers 6 and 8, both present. HilbertModularForms cites `ArithmeticLFunctionData`, which is now in Tau Ceti.
- **Automatic checks:** all passed at this head, and a re-run gave the same. The dependency check output is `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`, with no UPWARD or CYCLE line. Nothing changes outside the folder.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 111 `sorry` warnings and no other message.
- **One-tactic probe:** two copies replaced each of the 111 `sorry`, one with `first | (simp; done) | infer_instance | sorry` and one with `first | (with_reducible rfl) | sorry`. Each still gives 111 `sorry` warnings, so the probe closes none.
- **Signatures:** `#check @` on all 179 declarations elaborates. Each keeps `K`, `[NumberField K]`, its modulus and its hypotheses. The headline types match the README statements, and nothing changed.
- **Form:** there is no `set_option`, `lemma`, `#eval` or sorried data, and no data definition has a `sorry` body. The file has 32 Tau Ceti imports, all built. The README has 65 Checks in 27 blocks, matching the description.

Overlap check: read ZerosOfLFunctions (main and its open revision), GlobalNumberFields (main and its open revision), ArithmeticDirichletSeries, ThetaSeries and AnalyticNumberTheoryPartI (main), and QuasiRiemannHypothesis, ExplicitNumberFields and HilbertModularForms (open heads). The shared objects and their owners:
- the mixed-space theta series of an ideal lattice: this roadmap, which ThetaSeries cedes;
- Hecke L-functions of non-algebraic characters and Artin L-functions: AnalyticNumberTheoryPartI §§2.3a and 2.18a;
- explicit Mertens bounds: ExplicitNumberFields, which consumes Layer 8 (C01);
- power-residue Gauss sums: QuasiRiemannHypothesis, which cites §5.3.

Nothing is owned twice.

Source independence: 13 passages compared with 3 sources, none shared beyond forced formulas.
- `hecke-zetafunktionen-ii`: the sentences of §§5.4, 6.9, 7.3, 7.4 and 7.5, the References entry, and §5.3 against Hecke §4.
- `lebacque-mertens`: the §8.2 statement, steps 2–4 and the docstring of `tendsto_prod_one_sub_inv_absNorm_div_log`.
- `loeffler-stoll-lean`: the §7.1 sentence.

Largest share: `neukirch-ant`, 56 of 76 source mentions. Its text and contents page could not be read, so the arrangement was compared through the README's own equation numbers:
- Layer 1 ↔ VII §§3 and 5 (parts);
- Layer 3 ↔ VII §5;
- Layers 5–6 ↔ VII §§6–8;
- Layers 0, 2, 4, 7 and 8 have no counterpart.

The *Needs:* lines force 1 → 3 → 6 → 5.4. The arrangement is independent by the locators; it was not checked against the book.

Research link: the headlines are Hecke's continuation and functional equation for Größencharakter L-functions (Hecke 1920, §6 (45)), the input to his prime ideal theorem for them (§7 (46)), and Rosen's Mertens product over a number field (Rosen 1999; Lebacque 2007, Theorem 5 (NF)). ZerosOfLFunctions and AnalyticNumberTheoryPartI §2.3a on main consume them. This rests on the README, the `hecke-zetafunktionen-ii` and `lebacque-mertens` texts, and those roadmaps.

## Not verifiable

- J. Neukirch, *Algebraic Number Theory* (`neukirch-ant`) is settled as uncertified and was not read. Its locators in Layers 1, 3, 5 and 6, and the Lean docstring pages 454, 471, 489 and 497, were checked by computation only (table). That includes the closed form of `W(χ)` cited as VII (8.5).
- L. C. Washington, *Introduction to Cyclotomic Fields*, Theorem 4.3 (`washington-cyclotomic`) is uncertified; it was checked by the `ℚ(ζ₅)` and mod-4 computations only.
- M. Rosen, J. Ramanujan Math. Soc. 14 (1999) is paywalled and was not read; only its form in Lebacque was read.

## Source issues

- **Misprint** in lebacque-mertens at Proposition 3, proof sketch, p. 9: the source defines `f(δ)` as `g(δ)` minus `log ζ(1 + δ)`, with the Riemann zeta symbol (line 474); it should be `log ζ_K(1 + δ)`, as line 476 has; affects nothing.

## For the human reviewers

- Not tested: Neukirch, *Algebraic Number Theory* (`neukirch-ant`), holds 56 of the 76 source mentions in `TauCetiRoadmap/LFunctions/README.md`. Its text and contents could not be read legally, so the wording and the arrangement were not compared against it.
