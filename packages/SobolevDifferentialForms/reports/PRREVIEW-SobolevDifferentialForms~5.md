# Review of SobolevDifferentialForms (pull request #1609 at e8a0ed0)

**Verdict:** needs changes

Incremental re-review of the 9 lines changed since 577b469: all in `TauCetiRoadmap/SobolevDifferentialForms/README.md`, namely line 90 (the opening sentence of `### From Tau Ceti`) and lines 115–118 (the K5a sentence). Nothing changed outside the folder (`git diff --stat origin/main...HEAD` outside the folder: empty), and `Suggested.lean` is byte-identical to 577b469. Gate at this head (my run): every check 0, `OK`. Dependency check with the candidate merge order (this roadmap at line 397): `depcheck: 239 roadmaps, 2349 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. `lake env lean TauCetiRoadmap/SobolevDifferentialForms/Suggested.lean` gives 5 `sorry` warnings (lines 123, 162, 173, 179, 187) and exit 0. Pins: Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`.

## R01 (P3) — the new K5a sentence says K5a plans the star, but both open revisions of ComplexKahlerGeometry make K5a consume Tau Ceti's star

Location: `README.md` lines 115–118: "ComplexKahlerGeometry K5a plans this pointwise star on alternating maps of an oriented real inner-product space, characterised by `α ∧ ⋆β = ⟪α, β⟫ vol`; … so this roadmap consumes the library directly and does not cite K5a."

Claim: a statement about what another roadmap plans has to hold at the heads where that roadmap is being revised, and the README has to stay timeless. This wording is the previous report's own repair, which was checked against main only.

Witness: main K5a (lines 598–601) constructs the star. At open head `4f5ca96`, K5a lines 1026–1030: the star "is Tau Ceti's `Orientation.formHodgeStar`", "No second pointwise star is constructed". At open head `06e0a3f`, line 826: "consumed, not restated".

Repair: delete the sentence from "ComplexKahlerGeometry K5a plans" to "does not cite K5a.", so the paragraph ends at "…along `TauCeti.alternatingFormEquiv`." No `*Needs:*` line, supplier table or other passage cites K5a (grep finds only lines 115 and 118), and the Scope bullet at lines 34–35 already gives the star to Tau Ceti. If you want to keep a pointer to K5a, use instead: "ComplexKahlerGeometry K5a's pointwise star is characterised by the same law `α ∧ ⋆β = ⟪α, β⟫ vol`, which Tau Ceti's `Orientation.formHodgeStar` satisfies (`Orientation.wedge_formHodgeStar_apply`); this roadmap consumes the library and does not cite K5a." I tested that wording on main (lines 600–601), at `4f5ca96` (line 1032 lists `α∧*β=⟨α,β⟩vol` among the pinned identities) and at `06e0a3f` (line 832, "equivalently `α∧*β=⟨α,β⟩vol`"). It holds at all three.

## Previous findings

- R01 — repaired: lines 115–118 now read "ComplexKahlerGeometry K5a plans this pointwise star on alternating maps … characterised by `α ∧ ⋆β = ⟪α, β⟫ vol`; Tau Ceti's `Orientation.formHodgeStar` satisfies that law". This is the requested text and it is true on main, but it is false at both open revision heads; that is new R01 above.
- R02 — repaired: line 90 now reads "All on Tau Ceti's main branch, which `Suggested.lean` does not import; file paths under `TauCeti/Analysis/`." It no longer compares main with the pin, and it is true (checked below).

## Verified sound

**Line 90 (changed).** The 24 Tau Ceti names under `### From Tau Ceti` were read on Tau Ceti `main` at `fa7523a` (2026-11-08) through the GitHub contents API, as data. All 24 are in the files the README names (paths under `TauCeti/Analysis/`):
- `InnerProductSpace/AlternatingForm.lean`: `alternatingFormEquiv` line 73, `alternatingFormInner` line 156, `alternatingFormInner_eq_sum` line 196.
- `InnerProductSpace/HodgeStar/AlternatingForm.lean`: `formHodgeStar` line 85, `wedge_formHodgeStar_apply` line 120, `alternatingFormInner_formHodgeStar` line 137, `formHodgeStar_formHodgeStar` line 147.
- `Distribution/TestFunction/ExtDeriv.lean`: `extDerivCLM` line 67, `extDerivCLM_apply` line 74, `extDerivCLM_extDerivCLM` line 86. `Distribution/TestFunction/Divergence.lean`: `divergenceCLM` line 62.
- `Sobolev/WeakDeriv/Basic.lean`: `HasWeakLineDerivOn` line 211, `HasWeakFDerivOn` line 250. `Sobolev/WeakDeriv/Divergence.lean`: `HasWeakFDerivOn.integral_inner_gradient_eq_neg_integral_smul_trace` line 79.
- `Sobolev/W1p/Basic.lean`: `W1p` line 374. `Sobolev/W1p/Zero.lean`: `W1p0` line 158. `Sobolev/W1p/ChangeOfVariables.lean`: `W1p.compL` line 278.
- `Sobolev/Wkp/MeyersSerrin.lean`: `dense_contDiffOn_representatives` line 291. `Sobolev/Wkp/Extension.lean`: `Wkp0.extendByZeroₗᵢ` line 112.
- `Sobolev/LipschitzDomain/Basic.lean`: `IsLipschitzDomainWith` line 482. `Sobolev/LipschitzDomain/PartitionOfUnity.lean`: `IsLipschitzDomainWith.exists_contDiff_partitionOfUnity` line 65. `Sobolev/LipschitzDomain/RellichKondrachov.lean`: `W1p.isCompactOperator_valueL_of_isLipschitzDomainWith` line 53.
- `Sobolev/LipschitzDomain/Trace/Frontier.lean`: `W1p.frontierTrace` line 219, `W1p.ker_frontierTrace` line 448.

At the pin `a91d3aaf`, 5 of the 24 are present (`HasWeakFDerivOn`, `HasWeakLineDerivOn`, `W1p`, `W1p0`, `dense_contDiffOn_representatives`). `Suggested.lean` imports exactly `import Mathlib` (line 1) and no `TauCeti.*` module, so "which `Suggested.lean` does not import" is accurate.

**Lines 113–118 (changed or adjacent).** At Tau Ceti main:
- `Orientation.hodgeStar hkl := exteriorPower.hodgeStar (innerₗ V) TauCeti.bijective_innerₗ o.volumeEquiv hkl` (`HodgeStar/Basic.lean` lines 176–177).
- `formHodgeStar hkl := ((alternatingFormEquiv V k).symm.trans (o.hodgeStar hkl)).trans (alternatingFormEquiv V l)` on `V [⋀^Fin k]→L[ℝ] ℝ` (`HodgeStar/AlternatingForm.lean` lines 85–87).
- `alternatingFormEquiv V k : ⋀[ℝ]^k V ≃ₗ[ℝ] V [⋀^Fin k]→L[ℝ] ℝ` (`AlternatingForm.lean` line 73).

So the unchanged first sentence ("Mathlib's `exteriorPower.hodgeStar` on `⋀ᵏ V`, transported …") is exact. `wedge_formHodgeStar_apply` (line 120) states `α.wedge (o.formHodgeStar hkl β) v = alternatingFormInner V k α β * o.volumeForm (…)`, which is the law `α ∧ ⋆β = ⟪α, β⟫ vol` with the Gram inner product, as the new sentence says. §1.1 and §1.2, which consume these names, are consistent with the paragraph: §1.1 says the inverse of `Covector.toExteriorPower` is `alternatingFormEquiv`, and §1.2 transports `formHodgeStar` with the three laws named.

**Citation leads** (worker's `citations.md`): `Covector.toExteriorPower` is declared at `Suggested.lean:74` (inside `namespace Covector`, line 44) and `HasWeakExtDerivOn.ae_eq_zero` at line 123. Both are the roadmap's own declarations, so neither is a finding.

**Lean file.** Byte-identical to 577b469 and dfa3517. The previous reports' checks carry forward:
- 17 declarations; the worker's `signatures.md` flags 0 lost binders.
- single `import Mathlib`, no `set_option`, no sorry'd data, `theorem` throughout.
- the module docstring names the §1.2 star as not statable at the pin; this is consistent with 0 of the 7 inner-product and star names being present at `a91d3aaf`.
- the one-tactic probes carry forward unchanged.

**Suppliers and ownership.** PDE (Lane A.6) and GeometricMeasureTheory (G6) are on main and earlier in the order, and the dependency check output is quoted above. The diff adds no object and no supplier edge. The worker's `overlaps.md` reports no open pull request that changes this roadmap and no dropped or revision-only id. ComplexKahlerGeometry's two open heads were read for R01 only.

**Policy scan of the diff**: no LaTeX delimiters, pull-request numbers, links, revision hashes or process words.

**Seeded sample.** Of the sampled targets, only §1.1 and §1.2 touch the diff, through the supplier names checked above. The others (§2.2, §3.1–§3.5, §4.1, §5.4, §6.1, §6.2, §7.1, §7.2, §7.4) are untouched, and their locators were verified in the previous reports.

**Adversarial table** (statement; instances; values on each side; result; change). Rows for untouched statements are the previous reports' rows, cited as such.

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| line 90: "All on Tau Ceti's main branch, which `Suggested.lean` does not import" (changed) | the 24 names, at Tau Ceti main `fa7523a` and at pin `a91d3aaf`; the import lines of `Suggested.lean` | main: 24 of 24 found (files and lines above); pin: 5 of 24; `Suggested.lean`: 1 import (`Mathlib`), 0 `TauCeti.*` | true and timeless | none |
| lines 116–117: `formHodgeStar` satisfies `α ∧ ⋆β = ⟪α, β⟫ vol` (changed) | `n = 2`, `k = 1`: `α = β = e¹`; `α = e², β = e¹`; `α = β = e²` | `e¹ ∧ ⋆e¹ = e¹ ∧ e² = vol = 1·vol`; `e² ∧ ⋆e¹ = e² ∧ e² = 0 = ⟪e², e¹⟫ vol`; `e² ∧ ⋆e² = e² ∧ (−e¹) = vol = 1·vol` | the law holds; same convention as the §1.2 Check `⋆e₁ = e₂`, `⋆e₂ = −e₁` | none |
| same, against a wrong model `⋆α ∧ β = ⟪α, β⟫ vol` | `n = 2`, `k = 1`, `α = β = e¹` | `⋆e¹ ∧ e¹ = e² ∧ e¹ = −vol` vs `⟪e¹, e¹⟫ vol = vol` | excluded when `kl` is odd; the stated law pins the sign | none |
| same, degrees 0 and `n` | `n = 2`, `k = 0`, `α = β = 1`; `k = 2`, `α = β = vol` | `1 ∧ ⋆1 = vol = ⟪1,1⟫ vol`; `vol ∧ ⋆vol = vol ∧ 1 = vol`, so `⟪vol, vol⟫ = 1` | agrees with the §1.2 Check `⟪vol, vol⟫ = 1` | none |
| lines 115–116: "K5a plans this pointwise star on alternating maps …" (changed) | ComplexKahlerGeometry K5a on main, at `4f5ca96`, at `06e0a3f` | main lines 598–601: "construct the pointwise Hodge star …" (true); `4f5ca96` lines 1026–1030: the star "is Tau Ceti's `Orientation.formHodgeStar`", "No second pointwise star is constructed" (false); `06e0a3f` line 826: "consumed, not restated" (false) | true at 1 of 3 heads | R01 |
| R01's alternative wording: "K5a's pointwise star is characterised by the same law" | the same three heads | main line 601 `α∧*β=⟨α,β⟩vol`; `4f5ca96` line 1032, same identity listed as pinned; `06e0a3f` line 832, "equivalently `α∧*β=⟨α,β⟩vol`" | true at 3 of 3 heads | proposed |
| line 114–115: `formHodgeStar` is Mathlib's `exteriorPower.hodgeStar` transported (untouched sentence, re-read) | definitions at Tau Ceti main | `HodgeStar/Basic.lean:177`; `HodgeStar/AlternatingForm.lean:85–87` | exact | none |
| line 115 star = Mathlib's star, `n = 2` computation; Scope bullet line 35; Layer 1 Dependencies | previous report (r4) rows 1, 2 and 4 | as there | correct | none |
| §4.1 `Lᵖ` bi-Lipschitz bound, affine Check, §5.3 zero-trace (two instances), §1.2 third Check, §3.5 top degree, §7.1 Rellich hypotheses, §5.3 `ker_frontierTrace` hypotheses | previous report (r3) rows 1–8 | as there | correct | none |
| `HasWeakExtDerivOn` identity, converse of alternatization, Gram inner product, transport, star convention, `δ` sign, §1.3 adjointness, §3.4 adjoints, §3.5 norms, §3.6 divergence, §5.1, §5.2, §5.4, the four Hilbert-complex headlines, §6.2 interval, §7.1 Gaffney and core, §7.3 degenerate degrees, §7.4 annulus, §7.2 chart map | previous reports (r2 rows 1–3, 7–16, 18, 19, 21–31) | as there | correct | none |

**Remark (untouched text, no change asked):** the Tau Ceti contract is stated against Tau Ceti main rather than the pin. 19 of the 24 names are absent at `a91d3aaf`. The previous reviews accepted this, and `Suggested.lean` uses none of them.

## Not verifiable

- The 19 Tau Ceti declarations absent at the pin `a91d3aaf`: I read them only on Tau Ceti `main` at `fa7523a`, as data, with the file lines listed above.
- J. Brüning, M. Lesch, *Hilbert complexes*: paywalled (DOI 10.1016/0022-1236(92)90147-B). It is cited without theorem numbers, unchanged.

## Source issues

- none
