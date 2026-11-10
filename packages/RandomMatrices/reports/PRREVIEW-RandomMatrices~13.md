# Review of RandomMatrices (pull request #1971 at 4b81714)

**Verdict:** accepted

This is an incremental re-review: 0 lines have changed since 42067c4. The new head 4b81714 is an empty commit, so the roadmap folder and every file outside it are byte-identical to the head the previous review accepted. I found no finding. The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with `sorry` as its only warning. Every cross-roadmap citation still resolves against current main and the open heads. The folder is ready for a human's final approval.

## Previous findings

- None. The report at 42067c4 raised no finding, so nothing carries forward.

## Verified sound

**Diff.** `git diff --stat 42067c4f..4b817142` is empty, and the commit "Re-run CI after the auto-merge check failure" has no file changes. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/RandomMatrices'` is also empty. The pins in `lake-manifest.json` are unchanged: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`. The README carries no pin line that could go stale.

**Gate.** I reran it at this head:

```text
gate RandomMatrices: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's run, which includes the targeted build, also ends `build=0 OK`.

**Dependency check.**

```text
depcheck: 236 roadmaps, 2277 edges, 0 problem(s)
```

**Build.**
- `lake env lean TauCetiRoadmap/RandomMatrices/Suggested.lean` exits 0.
- It gives 18 `declaration uses sorry` warnings and nothing else. They are at lines 53, 68, 98, 116, 150, 168, 219, 244, 266, 301, 318, 355, 367, 382, 408, 428, 445 and 461, the 18 headlines.
- The three Hermitian auxiliaries are proved: `sampleCovariance_isHermitian`, `gaussianEnsemble_isHermitian` and `isHermitian_smul_vecMulVec_star`.
- All eight `TauCeti.*` imports have their `.olean` at the pin.

**Signatures, padding and headlines.** These are carried. The file and the pins are byte-identical to 42067c4, where the previous report compared all 30 elaborated signatures and ran the one-tactic probe on all 18 headlines; every probe failed. The module docstring still names the only unstatable headlines, `ν ⊞ SC_t` and `ν ⊠ MP_y`.

**Cross-roadmap citations, resolved again this round** (main `ed7c546`):
- **SpecialFunctionsAiry.** Every cited section is present on main:
  - 1.1 at line 347 and 1.2 at line 370;
  - Layer 2 at line 481;
  - 3.2 at line 585, 3.4 at line 620, and 3.6 at line 708, whose tail bound `0 < Ai(x) ≤ Ai(0)e^{−(2/3)x^{3/2}}` matches the contract;
  - 8.5 at line 1382: `K_Ai = ∫₀^∞ Ai(x+t)Ai(y+t)dt`, the closed forms, and `|K_Ai(x,y)| ≤ C²e^{−x−y}` for `x, y ≥ s`.

  The planned names `TauCeti.airyAi`, `TauCeti.Real.airyAi` and `TauCeti.airyKernel`, which `scratch/citations.md` lists as leads, are SpecialFunctionsAiry's own naming convention (its README, line 142). The local copies here are in namespace `TauCetiRoadmap.RandomMatrices` and the Airy file's are in `TauCetiRoadmap.SpecialFunctionsAiry`, so no fully qualified name clashes.
- **StandardDistributions.** Layers 0 and 3–6, `wishartGramMeasure` and target 12.1 (`cond volume (ball c r)`) are present on main and at the head of its open revision.
- **No supplier drift.** Since 42067c4 (2026-11-10 13:51 UTC), no supplier README has changed on main. Only STATUS/PROGRESS files of StandardDistributions and OptimalTransport changed, and those predate it.

**Ownership against open pull requests.**
- `scratch/overlaps.md` lists no other pull request changing this roadmap and no dropped id in either direction.
- **MathematicalStatisticsFoundations** (new) cites RandomMatrices §2.5 as a supplier under "From RandomMatrices". §2.5 is Gaussian integration by parts here (README line 558), so supply runs one way.
- **DysonBrownianMotion** (new) cites §§1.2, 3.1–3.3, 4.3, 5.1, 5.3, 6.3 and 7.1, and Conventions 4 (resolvent sign) and 5 (normalisation). All exist here with that content. RandomMatrices names DysonBrownianMotion only in its Scope deferral, so there is no cycle.

**Pinned library.**
- I grepped Tau Ceti `2fd255d` for a large-deviation predicate. There is no `HasLDP` and no `Probability/LargeDeviations` directory, so `LargeDeviationPrinciple` duplicates nothing at the pin.
- I opened `wignerMatrix` (`TauCeti/Probability/RandomMatrix/Wigner.lean:64`): its entries carry the factor `(√n)⁻¹`, the normalisation of Convention 5.
- `gaussianEnsemble` gives GUE off-diagonal real and imaginary variances `1/(2n)` and diagonal variance `1/n`.

**Seeded sample.** None of the sample falls in a changed passage, because nothing changed. I nevertheless read 9.2 and 9.4 this round against the author-posted AGZ (Zeitouni's `cupbook.pdf`):
- **9.2:** AGZ lines 3531–3540 give (2.6.1)–(2.6.2). Density `|Δ|^β e^{−N∑V}` with AGZ's `V` equal to the README's `βV/2` turns `liminf V/(β′ log|x|) > 1` into `liminf V/log|x| > 2β′/β`, as stated.
- **9.3:** lines 3587–3595 give the rate `(β/2)(E_V − min E_V)` in this normalisation.
- **9.4:** lines 3626–3641 give Lemma 2.6.2(e) on printed p. 73 (PDF p. 87), and the capacity definition at lines 3618–3625.

The other targets in the sample stand as earlier reports read them:
- 0.2, 7.2 and 6.5 in the review at afc9d39 (Tao lines 350–352; Bai Theorem 3.4; AGZ Theorems 5.4.2 and 5.4.10, Corollary 5.4.11);
- 0.3, 4.3, 8.2 and 10.1 in the review at 1259170 (Tao §2.3.2; Bai Theorem 2.1; AGZ Lemmas 3.2.2–3.2.3; Rudelson–Vershynin 2008 Theorem 1.2);
- 6.4 in the review at 80b4a22 (AGZ Lemma 5.3.32);
- 3.3 in the table rows of the reviews at afc9d39 and 1259170;
- 5.3, 6.1 and 7.1 in the review at 5d55d20, carried by the review at 0df60c1.

**Adversarial table.** Rows marked "this round" were computed at this head. The carried rows cite the reports at 42067c4 and at 1259170, whose rows of the same names hold the values.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.2 transport (this round) | `X = Y` Rademacher versus `X, Y` independent Rademacher | same marginals; `P(X = Y)` is `1` versus `1/2` | the README's "marginals insufficient" is right | none |
| 5.3 Checks (this round) | Laguerre `β = 2`, `p = n = 1`; Jacobi in dimension 1 | `|x|² = a² + b²`, `a, b ~ N(0,1/2)`, gives `½χ²₂ = Exp(1)` with mean 1; `a/(a+b)` with `Gamma(m₁)`, `Gamma(m₂)` gives `Beta(m₁,m₂)` | true | none |
| 6.1 Checks (this round) | `φ(p) = p(1) − p(0)`; `φ(x²) = −1`; `A = diag(1,−1)` | `φ(1) = 0`; `φ(x*x) = −1 < 0`; `tr₂ A² = 1 = ∫x² dL_A` | true | none |
| `wigner_extreme_eigenvalues_ae` (this round) | `ν` uniform on `{±1}`; `ν = δ₁`, excluded by `hmean`; diagonal law | limit `2σ = 2`; the mean-one case contains `(J−I)/√n`, so `λ_max ≈ (n−1)/√n → ∞`; `max |ηᵢ|/√n → 0` a.s. under a finite second moment | true; hypotheses needed | none |
| `wigner_asymptotically_free` (this round) | `k = 0`; `k = 1`; `k = 2`, word `s₀s₁s₀s₁` | empty word only, `trₙ I = 1 = ψ 1`; `E trₙH² = n⁻²(n(n−1) + n) = 1 = ψ(s²)`; `ψ(s₀s₁s₀s₁) = 0` and `ψ(s₀²s₁²) = 1` | true | none |
| `haar_conj_asymptotically_free` (this round) | `Aₙ = Bₙ = I`; `Aₙ = Bₙ = diag(±1)` balanced | all moments `1`, law `δ₁`; `E[U B U*] = trₙ(B) I`, so `E trₙ(AUBU*) = trₙA · trₙB = 0 = ψ(s₀)ψ(s₁)` | true | none |
| `gue_largest_eigenvalue_tracyWidom` (this round) | series terms; `s → ∞`; normalisation | `k = 0` term `1` (empty determinant on `A⁰`); `k = 1` term `−∫_s^∞ K_Ai(x,x)dx`, so `F₂ → 1`; `n^{2/3}(λ_max − 2)` with `λ_max` of `H/√n`, as in AGZ Theorem 3.1.4 | true | none |
| 9.2 growth and energy (this round) | `β = 2`, `V = c log(1+|x|)`; `V = x²/2` | admitted iff `c > β′` for some `β′ ≥ 2`, i.e. `c > 2`; `E_V(SC) = 1/2 − (−1/4) = 3/4` | true | none |
| 9.4 Checks (this round) | `U(x) = ∫log|x−y|dSC(y)` computed numerically (400 000 nodes) | `U(0) = −0.499997`, `U(1) = −0.25`, so `Φ = x²/2 − 2U = 1` on `[−2,2]`; `Φ(3) = 2.429255`, matching `1 + 3√5/2 − 2log((3+√5)/2) = 2.4292547`; `cap[−2,2] = 1`, `cap[0,1] = 1/4` | true for `V = x²/2` | none (remark below) |
| `sampleCovariance`, `marchenkoPastur_ae`, `sampleCovariance_extreme_eigenvalues_ae`; 1.2, 2.4, 7.4 | unchanged | rows of the report at 42067c4 (e.g. `X = (1, i)`: entry `1`; `Δ(0) = 1 − 1/y` at `y > 1`) | carried | none |
| 0.3; 1.1; 1.3; 2.2; `hanson_wright`; `matrix_bernstein`; 3.1, 3.3, 3.4; `wigner_semicircle_ae`, 4.3; `gaussianEnsemble_eigenvalue_density`; 5.1; 5.4; 6.2, 6.4; 7.1, 7.2; `gaussianEnsemble_spike_ae`, 7.3; 8.2; `fredholmDet`, `gue_bulk_gap`; `goe_largest_eigenvalue_tracyWidom`; 8.6; `LargeDeviationPrinciple`; `gaussianLogEnergy`; `gaussianEnsemble_largest_eigenvalue_ldp`, 9.4; `least_singular_value`; `circular_law_ae`, 10.2 | unchanged | rows of the same names in the report at 1259170 (e.g. 1.3: `½((1+i)/2 + (−1+i)/2) = i/2`; GUE density `n = 2`: `¼·2π·2 = π`; 0.3: `1 ≤ 2`) | carried | none |

**Counts.**
- 9 table rows computed this round and 2 carried groups covering 37 statements.
- 3 pinned objects opened: `wignerMatrix`, the eight import `.olean`s, and the absence of `HasLDP`.
- 12 cross-roadmap citations resolved: SpecialFunctionsAiry 1.1, 1.2, L2, 3.2, 3.4, 3.6 and 8.5; StandardDistributions L0, L3–6, `wishartGramMeasure` and 12.1; MathematicalStatisticsFoundations → §2.5.
- 1 source read (AGZ §2.6).

**Remarks on untouched text (no change asked).**
- **§9.4 strictness.** README line 1397 says the effective potential "exceeds `C` at every `x` outside the support" for the general potentials of §9.2, following AGZ (2.6.10). This fails in that generality. Take `V′ = x²/2 − (Φ(x) − 1)h(x)`, where `h` is a continuous bump with `0 ≤ h ≤ 1`, support in `[2.5, 3.5]` and `h(3) = 1`. Then `semicircleReal 0 1` still satisfies equality on `[−2,2]` and `≥ 1` everywhere, so it is the unique minimiser, yet its effective potential at `3` is exactly `1`. The Check at line 1407 is correct for `V = x²/2`. See Source issues.
- **Carried from the report at 42067c4.** §2.1's "V Proposition 2.7.1(v)" is lettered (e) in the author's posted edition. The docstring of `hanson_wright` says "variance proxy `K`" where §2.4 says `K²`.
- **Generated STATUS.md.** It describes a Tau Ceti `HasLDP` contraction principle that is not at the pin `2fd255d`. Once the pin moves past it, `LargeDeviationPrinciple` should be compared with it.

## Not verifiable

- **BLM** (Oxford University Press, 2013), **PB** (Cambridge University Press, 2020), **Johansson 1998** and **Simon 2005**: no open copy, as the earlier reports record. None is cited in a changed passage, and there are no changed passages.

## Source issues

- **Error** in AGZ at Lemma 2.6.2(e), (2.6.10), printed p. 73 (proof printed p. 76): the source says the effective potential is strictly above `C` at every point off the support, deducing strictness from uniqueness of the minimiser; it should be `≥ C` off the support: uniqueness makes only the quadratic term positive; `V = x²/2 − (Φ − 1)h`, `h` a bump at `3`, attains equality; affects a stated result.
