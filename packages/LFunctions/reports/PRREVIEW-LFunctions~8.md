# Review of LFunctions (pull request #2626 at a38b2e4)

**Verdict:** accepted

**Summary.** Accepted: no finding remains. The one finding of the previous review is repaired: the per-class Mellin identity and the independence of the total kernel from the class representatives (§6.8) now assume a presentation at its conductor, in the README and in `Suggested.lean`, and the instance that refuted them (the trivial character of `ℚ` presented at `(2)`) is recorded as a Check whose values were recomputed. Both small corrections on §8.2 are taken up: the series for the Mertens constant is a target, and step 3 cites Tau Ceti's two statements on `log ζ_K`. There is no small correction and one format note, not blocking. One item is left for a human: Neukirch's book, the source of most locators, could not be read.

## N01 — The series for the Mertens constant of §8.2 is a target in prose only, although it is statable at the pins

`mertensConstant K = γ + log κ_K + ∑_𝔭 (log(1 − N𝔭⁻¹) + N𝔭⁻¹)` uses only Tau Ceti's `mertensConstant`, Mathlib's `dedekindZeta_residue` and `Real.eulerMascheroniConstant`, and a sum over `HeightOneSpectrum (𝓞 K)` (README line 1714). ExplicitNumberFields cites it as a Layer 8 result; a statement in `Suggested.lean` next to `tendsto_prod_one_sub_inv_absNorm_div_log` would give that consumer a name to cite. Offered, not required: it is not one of the headline theorems.

## Questions for the author

- The folder's `PROGRESS.md` records that `latticeTheta_inv`, `surfaceHaar_of_isUnitFundamentalDomain` and `mellinKernel_inv` (§§1.2, 1.3, 3.3) are proved in Tau Ceti; at the pinned Tau Ceti they are absent, so they are correctly targets at this pin. Are they meant to move to the supplier contracts when the pin moves? Only the pin was read.
- §5.3 and §6.8 call Neukirch's closed form of VII (8.5) "the evaluation" of the root number pinned by the kernel law. Does his normalization of `τ(χ_f)` and of `md` match the Gauss sum of §5.3 without a further constant? The book could not be read.

## Previous findings

- R01 — repaired: both theorems carry `(hχ : primitiveConductor K χ = 𝔪)` (`Suggested.lean` lines 1750 and 1780); README §6.8 reads "for a presentation at its conductor, `𝔞` prime to it and `Re s > 1`" and the same for the total kernel.
- C01 — repaired: §8.2 reads "Prove also the series for the Mertens constant: Tau Ceti's `B_K = mertensConstant K` equals `γ + log κ_K + ∑_𝔭 (log(1 − N𝔭⁻¹) + N𝔭⁻¹)`" (Lebacque, Proposition 3); see N01.
- C02 — repaired: step 3 and the *Needs:* line name `tendsto_log_dedekindZeta_re_sub_log_one_div_sub_one` and `log_dedekindZeta_re_eq_tsum_neg_log_one_sub`; both are in the supplier contracts with their statements.

The repairs introduced no new problem. The description states all three changes (the kernel theorems at the conductor, the new Check of §6.8, the series as a target, the two Tau Ceti statements among the suppliers) and its count of 66 Checks in 27 blocks is the head's.

## Verified sound

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 6.8 `unitaryPartialCompletion_eq_mellin`, at the conductor | trivial character of `ℚ`, conductor one, `𝔞 = (2)` | scale `2² · 1 = 4`; `θ_χ(2ℤ, u/4) = θ(iu)`, kernel `½θ(iu)`; Mellin of `½(θ − 1)` at `s/2`: `Γ_ℝ(s)ζ(s)`; left `1 · Γ_ℝ(s) · ζ(s)`; `χ_u((2)) = 1` | sound |
| 6.8 the same, negative control (new Check) | the same character presented at `(2)`, `𝔞 = (2)` | left `Γ_ℝ(2)(1 − 1/4)ζ(2) = (1/π)(3/4)(π²/6) = π/8`; `χ_u((2)) = 0`; now excluded: `primitiveConductor = 1 ≠ (2)` | sound; Check true |
| 6.8 `heckeMellinTotal_congr`, at the conductor | `ℚ`, conductor one, `rep = (1)`, `rep' = (2)`; odd mod `4∞`, `ℤ` and `(3)` | `1 · ½θ(iu)` both; `F` and `(−1)(−F) = F`; weight nonzero at ideals prime to `𝔪` by `unitaryWeight_apply` | sound |
| 6.8 statements without the hypothesis | `continuousOn_heckeMellinTotal`, `heckeMellinTotal_sub_const_isBigO` at `(2)`, `rep = (2)` | total `0 · kernel = 0`, constant `ε a₀ · 0 = 0`; difference `0` | sound at any modulus |
| 8.2 series for `mertensConstant K` | `ℚ`; term bounds, `x = N𝔭⁻¹ ≤ ½` | `γ + ∑_p(log(1 − 1/p) + 1/p) ≈ 0.5772 − 0.3157 = 0.2615 = M`; `−x²/(2(1 − x)) ≥ −x² ≤ log(1 − x) + x ≤ 0` | sound |
| 8.2 step 3 | `ℚ`; general `K` | `∑p^(−1−δ) + log δ → −0.3157 = B − γ`; `g − log ζ_K = ∑(N𝔭^(−1−δ) + log(1 − N𝔭^(−1−δ)))` by the pinned Euler logarithm; limit `B − γ − log κ_K` | sound |
| 8.2 Mertens headline (cites the series) | `ℚ`; `ℚ(i)` | `e^γ ≈ 1.781`, `κ = 1`; `κ = 2π/(4 · 2) = π/4 = L(1, χ₄)` | sound |

The rows for the untouched statements stand as in the previous review, of `1afcbdc`.

- **Source locators checked against the text:** 3, all in `lebacque-mertens`: Proposition 3, p. 9 (lines 457–486: the series with `+γ + log Res`, the two asymptotics in `δ`), Proposition 2, p. 8 (lines 369–373), and the consequence after Proposition 3 (lines 487–490). Seeded sample in the changed passages: §6.8 (Neukirch (8.3), not readable) and §8.2 (read).
- **Library declarations opened at the pin:** Tau Ceti `NumberTheory/ArithmeticDirichletSeries/Prime/IdealZetaSum.lean:117` (limit `log κ_K` along `𝓝[>] 1`, `κ_K` Mathlib's `dedekindZeta_residue`), `…/EulerProduct/Logarithm/DedekindZeta/Basic.lean:121` (real `s > 1`, sum over `HeightOneSpectrum`), `NumberTheory/LFunctions/Mertens.lean:545` (`mertensConstant`); both statements agree with the supplier contracts' glosses.
- **Cross-roadmap citations resolved:** ExplicitNumberFields at its open head cites "LFunctions Layer 8 (step 3 of Mertens' product …)" (README lines 2725, 2751, 3025); the series is still step 3 and is now a target.
- **Automatic checks:** all pass at this head, and a re-run gave the same. Dependency check: `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`, no UPWARD or CYCLE line. Nothing changes outside the folder.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 111 `sorry` warnings and no other message.
- **One-tactic probe:** the two changed theorems tried with `simp`, `rfl` and a contradiction from `rfl` on a copy; neither closes (111 `sorry` warnings remain).
- **Signatures:** `#check @` of the two changed theorems shows `primitiveConductor K χ = 𝔪` after `χ` and before the ideals, with `K`, `[NumberField K]`, `𝔪`, `hD` kept; they match the README.
- **Form:** no `set_option`, `lemma` or sorried data; no declaration added or removed by the change.

Overlap check: read ZerosOfLFunctions, GlobalNumberFields and ArithmeticDirichletSeries (main) and QuasiRiemannHypothesis, ExplicitNumberFields and HilbertModularForms (open heads), as in the previous review; the change adds one shared object, the series for the Mertens constant of `K`: owner this roadmap (§8.2), consumer ExplicitNumberFields, which keeps the explicit bounds. Nothing is owned twice.

Source independence: changed passages only; 4 passages (the statement of the series and step 3 of §8.2, the new Check and the two bullets of §6.8) compared with 1 source (`lebacque-mertens`, Proposition 3), none shared beyond the forced formula; largest share `neukirch-ant`, 55 of 70 source mentions, its text and contents page not readable; no layer was added, removed or reordered, so the arrangement was not compared again.

Research link: the headlines are Hecke's continuation and functional equation for Größencharakter L-functions (Hecke 1920, §6 (45)), the input of his prime ideal theorem for them (§7 (46)), and Rosen's Mertens product over a number field (Rosen 1999; Lebacque 2007, Theorem 5). ZerosOfLFunctions and AnalyticNumberTheoryPartI §2.3a consume them. Rests on the README and the Hecke and Lebacque texts.

## Not verifiable

- J. Neukirch, *Algebraic Number Theory* (`neukirch-ant`): uncertified and not read; the locator (8.3) of the two repaired statements of §6.8 was checked by computation only (table).
- M. Rosen, J. Ramanujan Math. Soc. 14 (1999): not read; only its form in Lebacque was read.
- The instances of §6.8 were computed by hand from the definitions in `Suggested.lean`; no Lean term for the trivial character presented at `(2)` was built.

## Source issues

- **Misprint** in lebacque-mertens at Proposition 3, proof sketch, p. 9: the source defines `f(δ)` as `g(δ)` minus the logarithm of the Riemann zeta function at `1 + δ`; it should be the logarithm of `ζ_K(1 + δ)`, as two lines later; affects nothing.

## For the human reviewers

- Not tested: Neukirch, *Algebraic Number Theory* (`neukirch-ant`), holds 55 of the 70 source mentions in `TauCetiRoadmap/LFunctions/README.md`. Its text and contents page could not be read legally, so wording and arrangement were not compared against it.
