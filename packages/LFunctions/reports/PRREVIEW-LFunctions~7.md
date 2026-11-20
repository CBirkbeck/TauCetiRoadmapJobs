# Review of LFunctions (pull request #2626 at 1afcbdc)

**Verdict:** needs changes

**Summary.** Changes are needed: one finding. Two statements of §6.8 on the Grossencharacter kernel, `unitaryPartialCompletion_eq_mellin` and `heckeMellinTotal_congr`, divide by the unitary weight of the presentation at ideals that are only assumed prime to the conductor, and are false for a presentation at a larger modulus (over `ℚ`, the trivial character presented at `(2)`: `π/8` on one side, `0` on the other). Everything else that was recomputed holds. There are two small corrections, both carried over from the previous review of this same head, and no format note. One item is left for a human: Neukirch's book, the source of 55 of the 70 source mentions, could not be read.

## R01 (P2) — The per-class Mellin identity and the independence of the total kernel from the class representatives are false for a presentation that is not at its conductor

An implementer cannot prove `Grossencharacter.unitaryPartialCompletion_eq_mellin` (`Suggested.lean` lines 1745–1753) or `Grossencharacter.heckeMellinTotal_congr` (lines 1773–1778) as stated. Both take a presentation `χ` at an arbitrary modulus `𝔪` and ideals prime to `primitiveConductor K χ`, and both use the factor `(χ.unitaryWeight.1 𝔞)⁻¹`. The unitary weight of a presentation vanishes at every ideal not prime to `𝔪` (the field `unitaryWeight_eq_zero`), so at an ideal prime to the conductor and not to `𝔪` the factor is `0⁻¹ = 0`.

The instance: `K = ℚ`, the trivial Hecke character presented at the finite modulus `(2)`, whose conductor is the trivial modulus, and `𝔞 = (2)`, which is prime to the conductor.

- `unitaryPartialCompletion_eq_mellin`: the left side is the continuation of `Γ_ℝ(s) ∑_{n odd} n^(−s) = Γ_ℝ(s)(1 − 2^(−s)) ζ(s)`, which is `(1/π)(3/4)(π²/6) = π/8` at `s = 2`. The right side is `0⁻¹ · mellin(…) = 0`.
- `heckeMellinTotal_congr`, with one class: `rep = (1)` gives `(1/2)(1 + 2 ∑_{n odd ≥ 1} e^(−π u n²)) > 0`, and `rep' = (2)` gives `0⁻¹ · … = 0`. Both systems satisfy `IsClassRepresentatives` for the conductor.

On main the factor was the weight of the primitive presentation, which is nonzero at ideals prime to the conductor; the hypothesis was lost when that chosen presentation became `χ` itself. The neighbouring statements `unitaryCompletion_eq_sum`, `unitaryCompletion_eq_mellin` and `heckeMellinTotal_inv` carry `hχ : primitiveConductor K χ = 𝔪`, and the description says the kernel theorems "are stated for a presentation at its conductor".

The smallest change is to add `(hχ : primitiveConductor K χ = 𝔪)` to these two theorems. Asking instead that `𝔞`, `rep` and `rep'` be prime to `𝔪` also works: with `𝔞 = (1)` in the instance above both sides are `Γ_ℝ(s)(1 − 2^(−s)) ζ(s)`. In the README, §6.8 line 1302 would read "for a presentation at its conductor, `𝔞` prime to it and `Re s > 1`", and lines 1298 and 1306 would say the same of the total kernel and of its independence of the representatives.

## C01 — The series for the Mertens constant in step 3 of §8.2 is consumed by another roadmap as a Layer 8 result, but here it is only a step of a route

ExplicitNumberFields, an open new roadmap, takes the identity `M_K = γ + log κ_K + ∑_𝔭 (1/N𝔭 + log(1 − 1/N𝔭))` from "LFunctions Layer 8 (step 3 of Mertens' product for `K`)" (its README lines 2725 and 2751). Here that identity is step 3 of the route of `tendsto_prod_one_sub_inv_absNorm_div_log` (README lines 1717–1722), and a route does not bind the implementer: someone who proves the product another way owes the consumer nothing.

One sentence in §8.2 would make it a target: "Prove that `mertensConstant K` equals `γ + log κ_K + ∑_𝔭 (log(1 − N𝔭⁻¹) + N𝔭⁻¹)` (Lebacque, Proposition 3)", the name of the new statement in prose. Listing the identity under Downstream consumers would also do.

## C02 — Step 3 of §8.2 re-derives an asymptotic for `log ζ_K(1 + δ)` that Tau Ceti already proves

Step 3 obtains `log ζ_K(1 + δ) = −log δ + log κ_K + o(1)` "from the Euler product of `ζ_K` and the residue", and the *Needs:* line (README lines 1726–1729) names only `EulerProductData` and Mathlib's residue, so an implementer would prove it again. At the pin, `TauCeti.tendsto_log_dedekindZeta_re_sub_log_one_div_sub_one` (`NumberTheory/ArithmeticDirichletSeries/Prime/IdealZetaSum.lean:117`) states that `log ζ_K(s) − log(1/(s − 1))` tends to `log κ_K` as `s → 1⁺`, and `TauCeti.log_dedekindZeta_re_eq_tsum_neg_log_one_sub` (`…/EulerProduct/Logarithm/DedekindZeta/Basic.lean:121`) writes `log ζ_K(s)` as `∑_𝔭 −log(1 − N𝔭^(−s))`, the series the dominated convergence acts on. Name both in step 3 and on the *Needs:* line.

## Questions for the author

- The folder's `PROGRESS.md` records that the multi-parameter theta transformation, the volume of a unit fundamental domain and the transformation law of the Mellin kernel (`latticeTheta_inv`, `surfaceHaar_of_isUnitFundamentalDomain`, `mellinKernel_inv` of §§1.2, 1.3 and 3.3) are proved in Tau Ceti. At the pinned Tau Ceti they are absent (`NumberTheory/LFunctions/Theta/` holds only `UnitFundamentalDomain.lean` and `SurfaceCoordinates.lean`), so they are correctly targets at this pin. Are they meant to move to the supplier contracts when the pin moves? Only the pin was read.
- §5.3 and §6.8 call Neukirch's closed form `W(χ) = [i^(Tr p) N((md/|md|)^p)]⁻¹ τ(χ_f)/√N(𝔪)` of VII (8.5) "the evaluation" of the root number pinned by the kernel law. Does his normalization of `τ(χ_f)` and of `md` match the Gauss sum of §5.3 without a further constant? The book could not be read.

## Earlier findings

The previous review read this same head and had no finding; its three small corrections stand as follows.

- **C01 (step 3 of §8.2 consumed as a Layer 8 result): not addressed**, the head being unchanged. Raised again as C01.
- **C02 (step 3 does not cite Tau Ceti's asymptotic for `log ζ_K`): not addressed.** Raised again as C02.
- **C03 (the description says no declaration was added): withdrawn.** The description is right. `unitaryCompletion_congr` and `rootNumber_congr` are in `Suggested.lean` on main at lines 1906 and 1910, inside `namespace Grossencharacter`; the head states the same two after `grossencharacterData_congr` under their qualified names. The set of declared names at the head is a subset of main's (180 against 274).

## Verified sound

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 2.2 change of modulus | `(5)` under `(10)` over `ℚ` | `Cl_(10) = {±1},{±3}`; only `{±1}` maps to `{±1 mod 5}`; `ζ(s,[1]_(5))` also counts `4, 6, 14, 16` | sound |
| 2.1 residue of a ray class | `(4)∞`; `(5)`; `ℚ(√−5)` | `1·(1/2)/2 = 1/4`; `(4/5)/2 = 2/5`; `κ = 2π·2/(2√20) = π/√5`, per class `π/(2√5)` | sound |
| 1.3 volume of a unit domain | `ℚ(i)`; real quadratic; cubic `r₁ = r₂ = 1` | `∫_1^√e dy/y = 1/2`; `2 log ε`; `(1/2)(2 log ε) = log ε = 2¹R/2¹` | sound |
| 3.3 kernel and unfolding | `ℚ`; `ℚ(i)` | `Γ_ℝ(s)ζ(s)`; `(1/4)·2·π^(−s)Γ(s)·4ζ_K = 4^(s/2)Γ_ℂ(s)ζ_K` | sound |
| 3.3 `mellinKernel_inv`, dual ideal | any lattice; `traceToEuclidean` | `N(y)^(−1/2) = u^(1/2)V_L`; `N(m²) = 16^r₂`, `V_J = V_I⁻¹4^(−r₂)`, `16^r₂/V_{L∨}² = V_J⁻²` | sound |
| 3.5 Dedekind headline | general; `ℚ(i)` | `√|d|·π^(−r₂)·κ = 2^(r₁+r₂)hR/w`; `2·(1/π)·(π/4) = 1/2`; class residue `2a₀ = 2^rR/w` | sound |
| 3.6 value at `0` | `ℚ`; `ℚ(i)`; real quadratic | `(2/s)^r ζ_K ~ −2^r hR/(ws)`: `−1/2`; `(−1/2)(1/2) = −1/4`; slope `−h log ε/2` | sound |
| 4.1 quadratic | `ℚ(i)`, `p = 2, 3, 5` | `(1−2^(−s))⁻¹·1`; `(1−9^(−s))⁻¹ = (1−3^(−s))⁻¹(1+3^(−s))⁻¹`; `(1−5^(−s))⁻²` | sound |
| 4.2 cyclotomic | `n = 4`; `n = 2`; `n ≡ 2 mod 4` | `ζ_{ℚ(i)}(1−2^(−s)) = L(χ₀)L(χ₄)`; `F = ℚ`, product `ζ`; characters of `2m` have conductors dividing `m` | sound |
| 5.1 presented series | trivial at `(4)∞`; odd mod `4∞` | `ζ(s)(1−2^(−s))`; weight `−1, 1, 0` at `(3), (5), (2)`; `heckeLFunctionC_eq_primitive` at `Hecke/Basic.lean:130` | sound |
| 5.3 Gauss sums | `χ₄`, `y = 1/4, 1/2`; mod 5; conductor `𝔪∞` only | `2i`, `0` (excluded by coprimality); `τ(2/5) = −√5`; primitivity forces the sign product over all of `𝔪∞` | sound |
| 5.4 completed function, root number | nontrivial `ψ`; trivial | `W = Λ(2)/conj Λ(−1)`, `Λ(−1) = W·conj Λ(2) ≠ 0`; trivial: `Λ_K(2)/Λ_K(−1) = 1` | sound |
| 6.1 presentation pins | `‖·‖^(−m)`; `χ₄N` at `(4)` | supplier shift `−m`, ideal-side `m`; `a = −3`: `(−1)·3·(−1/3) = 1` | sound |
| 6.3 sign of the shift | `‖·‖` over `ℚ` | `χ(π_p) = 1/p`; with supplier shift `1` the equation reads `1/p = p` | sound |
| 6.4 unit relation | angular, `a = 2+i` | finite `((3+4i)/5)^(2k)`, archimedean `((3+4i)/5)^(−2k)`, product `1` | sound |
| 6.6 card and completions | angular `k`; `N^m`, `m` odd; CM type `(1,0)` | shift `|−4k|/2 = 2|k|`, conductor `4`; real shift `0`; shift `1/2`, `2·shift ∈ ℤ` | sound |
| 6.7 finite character, harmonic factor | unit `u`; odd mod `4∞` | `χ_f(u)N(u^p) = ∏|u_w|^(P_w)·(∏‖u‖_w)^shift = ∏|u_w|^(P_w)`; `χ_f(−1) = −1` | sound |
| 6.7 Hecke's lemma | real `p = 1`; complex `z̄^k` | `−i y^(−3/2) ξ e^(−πξ²/y)`; `(−i)^k y^(−1−k) ξ̄^k e^(−π|ξ|²/y)` | sound |
| 6.8 kernel constants | odd mod `4∞`, `𝔞 = ℤ, (3)`; `ℚ(i)` angular | `F = (1/2)∑χ₄(m)m e^(−πum²/4)`, `(3)` gives `−F`, class factor `−1`; `2^(1−2k)π^(−s−2k)Γ(s+2k)L = 4^(s/2)Γ_ℂ(s+2k)L` | sound |
| 6.8 per-class identity, total kernel (R01) | trivial character of `ℚ` at `(2)`, `𝔞 = (2)` | left `π/8` at `s = 2`, right `0`; totals `(1/2)(1+2∑_{n odd}e^(−πun²))` and `0` | R01 |
| 6.9 functional equation | odd mod `4∞`; angular `k ≥ 1` | `F(1/u) = u^(3/2)F(u)`, `W = 1`; `F(1/u) = u^(1/2+2k)F(u)`, weight `1/2 + 4k/2` | sound |
| 6.9 `completed_one_sub` | shift `σ`; `N^m` | `Λ_u(s−σ) = WΛ_u^∨(1−s+σ)`; poles of `Λ_K(s−m)` at `m`, `1+m` | sound |
| 7.1 nonvanishing headline | `χ₄`, `t = 0` | `L(1,χ₄) = π/4`; `3-4-1` orders `−3+4−1 = 0`; Mathlib's quadratic case by positivity (Loeffler–Stoll p. 54) | sound |
| 7.2 cancellation package | `χ₄`; trivial; Liouville, `n ≥ 3` | square trivial on good ideals; excluded as norm twist; `1/2+ε < 1−1/n = 2/3` under RH | sound |
| 7.3 route | `χ₄N/ℚ`; square not trivial | `η = χ₄` on `(4)∞`, `Cl_(4)` trivial; `χ_u² = χ²‖·‖^(−2·shift)` algebraic, norm twist only for `u = 0` | sound |
| 7.3 Landau step | `ζ_K L(χ_u)` | coefficient at `𝔭^k`: `k+1`, `(1+(−1)^k)/2`, `1`; at least `ζ_K(2s) → ∞` at `1/2⁺` | sound |
| 7.4 angular characters | `ℚ(i)`, `𝔣 = 1` | `g = 4`: `(α/|α|)^(4k) = (α/ᾱ)^(2k)`, unit `i` gives `(−1)^(2k) = 1`; `Γ(s+|ga|/2) = Γ(s+2|k|)` | sound |
| 7.5 boundary datum | Hecke (46) | `∑_{N𝔭<x}λ(𝔭) = O(x e^(−c√log x))`; deleted factors `|χ(𝔭)N𝔭^(−1−it)| = 1/N𝔭 < 1` | sound |
| 8.1 cards | `ℚ`; ray class against Grossencharacter | Mathlib `Λ(0) = Λ₀(0) − 1`, canonical `0`; complex shifts `0/2 = 0`, polar clauses equivalent | sound |
| 8.2 Mertens headline | `ℚ`; `ℚ(√−5)`; `ℚ(i)` | `e^γ ≈ 1.781`; `π/√5 ≈ 1.405`; `2π/(4·2) = π/4 = L(1,χ₄)` | sound |
| 8.2 step 3 (C01, C02) | `ℚ` | `∑p^(−1−δ) + log δ → B − γ ≈ −0.3157`; pin: `log ζ_K(s) − log(1/(s−1)) → log κ_K` | C01, C02 |

- **Source locators checked against the text:** `hecke-zetafunktionen-ii` §6 (45), p. 35 (lines 1014–1035), §7 (46), p. 35 (lines 1036–1055), §9, p. 44 (lines 1375–1393); `lebacque-mertens` Theorem 5 (NF), p. 5 (lines 193–223), Proposition 2, p. 8 (lines 369–373), Proposition 3, p. 9 (lines 457–486); `loeffler-stoll-lean` §6, p. 54 (lines 425–440). The 55 Neukirch mentions and Washington's Theorem 4.3 were not read.
- **Library declarations opened at the pins:** Tau Ceti `LFunctions/Data/Basic.lean:82–197`, `Data/Series.lean:44–55`, `Analysis/Meromorphic/Continuation.lean:52–84`, `ArithmeticDirichletSeries/Cancellation.lean:97,168,282,322,481`, `Cancellation/Nonvanishing.lean:84–138`, `Weight.lean:428,508,514,924`, `Global/RayClass/Modulus.lean:504–549`, `RayClass/Basic.lean:182`, `HeckeCharacter/Shift.lean:80,209–274`, `HeckeCharacter/Algebraic.lean:60,141,192`, `HeckeCharacter/Basic.lean:146`, `LFunctions/Hecke/Basic.lean:130–140`, `Prime/IdealZetaSum.lean:117`, `EulerProduct/Logarithm/DedekindZeta/Basic.lean:121`; a further 35 cited declarations were found by name at the pin.
- **Cross-roadmap citations resolved:** AnalyticNumberTheoryPartI §§2.2a, 2.3a and 2.18a on main (lines 1309, 1356, 1676); ZerosOfLFunctions on main maps the three removed Layer 7–8 names to Tau Ceti's (lines 486–487); ExplicitNumberFields, QuasiRiemannHypothesis and HilbertModularForms at their open heads cite Layers 0, 3, 5, 6 and 8 and `gaussSum_mul`, all present.
- **Automatic checks:** all pass at this head, and a re-run gave the same. Dependency check: `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`, no UPWARD or CYCLE line. Nothing changes outside the folder.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 111 `sorry` warnings and no other message.
- **One-tactic probe:** every `sorry` replaced by `first | (simp; done) | (with_reducible rfl) | infer_instance | sorry` on a copy; 111 `sorry` warnings remain, so the probe closes none.
- **Signatures:** the elaborated types of the 180 declarations were compared with the README; each keeps `K`, `[NumberField K]`, its modulus and its hypotheses. The two statements of R01 match the README, which has the same gap.
- **Form:** no `set_option`, `lemma`, `#eval` or sorried data; 65 Checks in 27 blocks, 180 declarations, as the description says.

Overlap check: read ZerosOfLFunctions, AnalyticNumberTheoryPartI, ThetaSeries and AutomorphicLFunctionsAndLocalFactors (main), GlobalNumberFields and ArithmeticDirichletSeries (completed, on main), and QuasiRiemannHypothesis, ExplicitNumberFields and HilbertModularForms (open heads). Shared objects and owners: the mixed-space theta series of an ideal lattice, this roadmap (ThetaSeries keeps the upper half-plane); Hecke L-functions with real frequencies and Artin L-functions, AnalyticNumberTheoryPartI §§2.3a and 2.18a, which cite Layers 1, 5 and 6 here; Mertens' third theorem over `ℚ` with an error term, AnalyticNumberTheoryPartI §0.26, a different statement from the product over `K` of §8.2; explicit Mertens bounds, ExplicitNumberFields (C01); power-residue Gauss sums, QuasiRiemannHypothesis, which cites §5.3. Nothing is owned twice.

Source independence: 12 passages compared with 3 sources (`hecke-zetafunktionen-ii`: §§5.4, 6.9, 7.3, 7.4, 7.5 and the References entry; `lebacque-mertens`: the statement and steps 2–4 of §8.2 and the docstring of `tendsto_prod_one_sub_inv_absNorm_div_log`; `loeffler-stoll-lean`: §7.1), none shared beyond forced formulas; largest share `neukirch-ant`, 55 of 70 source mentions; its text and contents page could not be read, so the arrangement was not compared with it. By the README's own equation numbers Layers 1, 3 and 6 draw on its VII §§3, 5 and 6–8, and Layers 0, 2, 4, 7 and 8 have no counterpart; the *Needs:* lines force 1 → 3 → 6 → 5.4.

Research link: the headlines are Hecke's continuation and functional equation for Größencharakter L-functions (Hecke 1920, §6 (45)), the input of his prime ideal theorem for them (§7 (46)), and Rosen's Mertens product over a number field (Rosen 1999; Lebacque 2007, Theorem 5). ZerosOfLFunctions and AnalyticNumberTheoryPartI §2.3a consume them. Rests on the README and the Hecke and Lebacque texts.

## Not verifiable

- J. Neukirch, *Algebraic Number Theory* (`neukirch-ant`): uncertified and not read; its locators in Layers 1, 3, 5 and 6 and the docstring pages 454, 471, 489 and 497 were checked by computation only (table).
- L. C. Washington, *Introduction to Cyclotomic Fields*, Theorem 4.3 (`washington-cyclotomic`): uncertified; checked by the `n = 2`, `n = 4` and `n ≡ 2 mod 4` computations only.
- M. Rosen, J. Ramanujan Math. Soc. 14 (1999): not read; only its form in Lebacque was read.
- R01's two instances were computed by hand from the definitions in `Suggested.lean`; no Lean term for the presentation of the trivial character at `(2)` was built.

## Source issues

- **Misprint** in lebacque-mertens at Proposition 3, proof sketch, p. 9: the source defines `f(δ)` as `g(δ)` minus the logarithm of the Riemann zeta function at `1 + δ`; it should be the logarithm of `ζ_K(1 + δ)`, as two lines later; affects nothing.

## For the human reviewers

- Not tested: Neukirch, *Algebraic Number Theory* (`neukirch-ant`), holds 55 of the 70 source mentions in `TauCetiRoadmap/LFunctions/README.md`. Its text and contents page could not be read legally, so wording and arrangement were not compared against it.
