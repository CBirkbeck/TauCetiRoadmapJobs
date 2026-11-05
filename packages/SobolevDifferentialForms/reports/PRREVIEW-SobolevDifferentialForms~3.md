# Review of SobolevDifferentialForms (pull request #1609 at dfa3517)

**Verdict:** accepted

Incremental re-review of the 25 lines changed since 3407de6 (17 in `README.md`, 8 in `Suggested.lean`; nothing outside the folder). Gate at this head (worker's run, data): every check 0, `build=0 OK`. My own run of the plain gate call reports `depcheck: NOT IN ORDER: SobolevDifferentialForms (insert it after its last supplier)` and nothing else; with the candidate merge order, which lists this roadmap at line 374, the dependency check prints `depcheck: 204 roadmaps, 1655 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. `lake env lean TauCetiRoadmap/SobolevDifferentialForms/Suggested.lean`: 5 `sorry` warnings (lines 123, 162, 173, 179, 187), exit 0; the file now has the single `import Mathlib`. Pins: Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf` (the branch manifest); Tau Ceti names were also checked at main's pin `358314d4` and at the newest Tau Ceti commit held locally, `fd581815` (2026-10-17).

## R01 (P3) — the Tau Ceti contract is Tau Ceti's main branch, not the pins, and the sentence saying so will go stale

Location: `README.md` lines 90–91 ("All as Tau Ceti implements them on its main branch, most later than the pinned revision; `Suggested.lean` uses none of them."), and the `*Needs:*` lines that cite these names (§1.1, §1.2, §1.3, §2.1, §2.3, §3.2, §3.3, §3.5, §3.6, §4.1, §5.1, §5.3, §5.4, §7.1, §7.2, §7.3).

Claim: a README is timeless; a library citation is checked where it says it lives.

Witness, by pin. At the branch pin `a91d3aaf`: only `TauCeti.HasWeakFDerivOn`, `TauCeti.HasWeakLineDerivOn` (`Sobolev/WeakDeriv/Basic.lean`), `TauCeti.W1p`, `TauCeti.W1p0` exist; `Wkp0.extendByZeroₗᵢ` exists from `358314d4` (`Sobolev/Wkp/Extension.lean:112`); `HasWeakFDerivOn.integral_inner_gradient_eq_neg_integral_smul_trace`, `W1p.compL`, `Wkp.dense_contDiffOn_representatives` and `Set.IsLipschitzDomainWith` exist from `fd581815` (`Sobolev/WeakDeriv/Divergence.lean:59`, `Sobolev/W1p/ChangeOfVariables.lean:277`, `Sobolev/Wkp/MeyersSerrin.lean:291`, `Sobolev/LipschitzDomain/Basic.lean`); the remaining ten (`TauCeti.alternatingFormEquiv`, `alternatingFormInner`, `alternatingFormInner_eq_sum`, `Orientation.formHodgeStar` and its three laws, `TestFunction.extDerivCLM` and its two lemmas, `TestFunction.divergenceCLM`, `IsLipschitzDomainWith.exists_contDiff_partitionOfUnity`, `W1p.isCompactOperator_valueL_of_isLipschitzDomainWith`, `W1p.frontierTrace`, `W1p.ker_frontierTrace`, `ContinuousAlternatingMap.wedge`) exist at none of the three local revisions. As data, read on Tau Ceti's `main` on GitHub today: every one of the nineteen is there, in the file the README names (`InnerProductSpace/AlternatingForm.lean:71,154,194`; `InnerProductSpace/HodgeStar/AlternatingForm.lean:76,111,128,138`, with `α.wedge` at 113; `Distribution/TestFunction/ExtDeriv.lean:67,74,86`; `Distribution/TestFunction/Divergence.lean:58`; `Sobolev/LipschitzDomain/PartitionOfUnity.lean:65`; `Sobolev/LipschitzDomain/RellichKondrachov.lean:53`, hypotheses `p ≠ ∞`, `IsLipschitzDomainWith L`, bounded; `Sobolev/LipschitzDomain/Trace/Frontier.lean:219,448`, same hypotheses, kernel `= w1p0Submodule`), with the shapes the README describes: charts are affine isometries onto `WithLp 2 (ℝ × E)` followed by a Lipschitz graph, so the cube `Q` of §7.1 qualifies. So the contract is the library's as it exists, and restating these as targets would duplicate it; the previous review's blocking objection (a revision hash that no checkout has, and a Lean docstring tied to it) is gone. What remains is wording: "most later than the pinned revision" describes this repository's manifest at one moment and reads as false once the pin moves, and until it moves the gate's pinned tooling cannot resolve these nineteen names (the worker's citation check lists them as found nowhere, as leads).

Repair (the author's to take or leave): write the paragraph as "All on Tau Ceti's main branch, which `Suggested.lean` does not import; file paths under `TauCeti/Analysis/`." The human approver should know that acceptance of this contract rests on Tau Ceti main, verified today as data, not on the pins.

## Previous findings

- R01 — partly repaired: "All as Tau Ceti implements them on its main branch, most later than the pinned revision; `Suggested.lean` uses none of them." No revision is named, the Lean import and docstring sentence are gone; the remainder is R01 (P3) above.
- R02 — repaired: `Suggested.lean` line 1 is `import Mathlib` and nothing else; elaboration unchanged (5 `sorry`, exit 0).
- R03 — repaired: `hasWeakExtDerivOn_top` is deleted; §3.5 reads "and `WᵖΛⁿ(Ω) = LᵖΛⁿ(Ω)`." with the `(n+1)`-form Check kept in prose (line 360).
- R04 — repaired: §4.1 "Picard, Chapter 3, pp. 161–162, proves `p = 2`; the `Lᵖ` case is this roadmap's, by the same estimate: pointwise `|Φ^* u| ≤ L^k |u ∘ Φ|` and the change of variables with `|det DΦ| ≥ L^{−n}` a.e."; §5.3 "for every `(n−k−1)`-form `φ` smooth on a neighbourhood of `closure Ω`, not necessarily compactly supported in `Ω`"; §1.2 "`vol(e₁, …, eₙ) = 1` for the standard basis, and `⟪vol, vol⟫ = 1` in the Gram inner product."

## Verified sound

**Changed passages against their sources.** `picard1984` (cache `e5a9e531`, GDZ scan) lines 420–481, printed pp. 161–162: `Φ : B → G` a bi-Lipschitz homeomorphism from the unit ball, (3.3) the pullback, (3.6) `Φ^* : L²(G) → L²(B)` a bijection, (3.7)–(3.8) the `L²` homeomorphism of `R_q` with the two-sided pointwise estimate; nothing there is `Lᵖ`, so §4.1's attribution of `p = 2` to Picard and of `Lᵖ` to this roadmap is exact. `afw2006` (cache `692fda1d`) line 712: `HΛⁿ(Ω) = L²Λⁿ(Ω)`, §3.5's top-degree identification. Mathlib `6b7abb3c`: `Orientation.volumeForm_robust` (`Analysis/InnerProductSpace/Orientation.lean:198`) gives `o.volumeForm = b.toBasis.det` for an orthonormal basis `b` of orientation `o`, hence `vol(e₁, …, eₙ) = 1` exactly, as the Convention and the §1.2 Check say.

**The `Lᵖ` estimate of §4.1, computed.** For a linear `A` with `‖A‖ ≤ L`, `(α ∘ A^{×k})(v) = ⟨a, Λ^k A (v₁ ∧ ⋯ ∧ v_k)⟩ = ⟨(Λ^k A)^* a, v₁ ∧ ⋯ ∧ v_k⟩` where `a` is the multivector of `α` under §1.1's musical map, so the Gram norm satisfies `‖α ∘ A^{×k}‖ ≤ ‖Λ^k A‖ ‖α‖ ≤ ‖A‖^k ‖α‖` (the norm of `Λ^k A` is the product of the `k` largest singular values). With `A = DΦ_x` a.e. (Rademacher) this is `|Φ^* u|(x) ≤ L^k |u(Φ x)|`; the change of variables `∫_{Ω'} |u ∘ Φ|^p = ∫_Ω |u|^p |det D(Φ⁻¹)| ≤ L^n ∫_Ω |u|^p`, since `‖DΦ⁻¹‖ ≤ L` gives `|det DΦ⁻¹| ≤ L^n`, i.e. `|det DΦ| ≥ L^{−n}`; together `‖Φ^* u‖_p ≤ L^{k + n/p} ‖u‖_p`, and for `p = ∞` the pointwise bound alone. Against the affine Check `B = 2·Id`: the bound gives `2^{k + n/p}`, the exact value is `2^k 2^{−n/p}`, consistent.

**Lean file.** The elaborated types of the 17 declarations (worker's `signatures.md` at this head, and my elaboration) agree with the README: `harmonic` and `CompactProperty` carry `[CompleteSpace W₀]` and the four theorems all three completeness instances; no binder lost. No `set_option`, no sorry'd data, `theorem` throughout, one module docstring naming each unstated headline with what it lacks at the pins. Every backticked name of the roadmap's own in the README (`Covector`, `toCovector`, `ofCovector`, `Covector.toExteriorPower`, `injective_toExteriorPower`, `HasWeakExtDerivOn`, `HasWeakExtDerivOn.ae_eq_zero`, `rangePMap`, `kerPMap`, `harmonic`, `hodge_decomposition`, `isClosed_range_iff_poincare`, `CompactProperty.isClosed_range`, `compactProperty_iff_weight`) is declared in the file; `hasWeakExtDerivOn_top` no longer appears in either. Padding: the one boundary-case theorem is gone; the one-tactic probes of the previous report (none of the remaining sorried theorems closes by `simp` with the unfolded definition) carry forward, the statements being byte-identical.

**Suppliers.** PDE (Lane A.6), GeometricMeasureTheory (G6) and ComplexKahlerGeometry (K5a) are on main and are earlier; the candidate order places this roadmap at line 374 after them; the dependency check reports no problem. Ownership against the 441 open heads was settled in the previous report (no second owner of the Sobolev spaces of forms, the weak `d`, the abstract Hilbert complex or Picard's compactness); the diff adds no object.

**Adversarial table** (statement; instances; values on each side; result; change). Rows for untouched statements are the previous report's, cited as such.

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| §4.1 `Lᵖ` bi-Lipschitz bound (changed) | `A = DΦ_x`, `‖A‖, ‖A⁻¹‖ ≤ L`; `p < ∞`; `p = ∞` | `‖α ∘ A^{×k}‖ ≤ ‖Λ^k A‖‖α‖ ≤ L^k‖α‖`; `∫_{Ω'}|u∘Φ|^p ≤ L^n ∫_Ω |u|^p`; total `L^{k+n/p}`; for `p = ∞` the pointwise `L^k` | true as stated, attribution to Picard for `p = 2` exact (lines 436–443) | none |
| same, against the affine Check | `B = 2·Id`, `L = 2` | bound `2^{k+n/p}`, exact value `2^k 2^{−n/p}` | consistent | none |
| §5.3 zero-trace identity (changed wording) | `n = 1`, `k = 0`, `u = 1`, `φ = x` smooth on `ℝ ⊇ closure (0,1)`; `u = x(1−x)` | `0 + ∫₀¹ 1 = 1 ≠ 0`; `[x(1−x)φ]₀¹ = 0` for every `φ` | `1 ∉ W₀`, `x(1−x) ∈ W₀`; `φ` of degree `n−k−1 = 0`, no support condition needed | none |
| same, `k = n` | `φ` of degree `−1` | no `φ`, condition empty, `WᵖΛⁿ₀ = LᵖΛⁿ` for `p < ∞` (test forms dense) | consistent with §3.2's Check | none |
| §1.2 third Check (changed) | standard basis, `k = n` | `vol(e) = b.toBasis.det e = 1`; Gram `⟪vol,vol⟫ = ∑_{|I|=n} vol(e_I)² = 1` | true; the plausible wrong normalisation `n!` is excluded | none |
| §3.5 top degree (prose now) | `k = n`, any `L¹_loc` `u`, `ℓ = dψ_x` | `∑_j (−1)^j u_x(removeNth j v) ℓ(v_j) = (ℓ ∧ u_x)(v)`, an `(n+1)`-form on `ℝⁿ`, `= 0` | `WᵖΛⁿ = LᵖΛⁿ`, `afw2006` line 712 | none |
| §7.1 use of Rellich on `W^{1,2}(Q)` (contract changed) | hypotheses of `W1p.isCompactOperator_valueL_of_isLipschitzDomainWith` on main: `p ≠ ∞`, Lipschitz, bounded | `p = 2`, `Q` bounded, `Q` Lipschitz (charts are affine isometries plus a Lipschitz graph, so corners qualify) | hypotheses met | none |
| §5.3 `k = 0` via `W1p.ker_frontierTrace` (contract changed) | hypotheses on main: `p ≠ ∞`, Lipschitz, bounded; kernel `= w1p0Submodule` | README: bounded Lipschitz `Ω`, `p < ∞` | hypotheses met | none |
| `HasWeakExtDerivOn` identity, both instances | previous report rows 1–3 | as there | agrees | none |
| converse of alternatization | previous report row 7 | as there | correct | none |
| Gram inner product, transport, star convention, `δ` sign, §1.3 adjointness | previous report rows 8–13 | as there | correct | none |
| §3.4 adjoints, §3.5 norms, §3.6 divergence | previous report rows 14–16 | as there | correct | none |
| §5.1, §5.2, §5.4 | previous report rows 18, 19, 21 | as there | correct | none |
| `hodge_decomposition`, `isClosed_range_iff_poincare`, `CompactProperty.isClosed_range`, `compactProperty_iff_weight` | previous report rows 22–25 | as there | correct | none |
| §6.2 interval, §7.1 Gaffney and core, §7.3 degenerate degrees, §7.4 annulus, §7.2 chart map | previous report rows 26–31 | as there | correct | none |

**Policy scan of the diff**: no LaTeX delimiters, no pull-request numbers, no links, no revision hash; the one time-bound clause is R01.

## Not verifiable

- The nineteen Tau Ceti declarations of `### From Tau Ceti` at either pin (`a91d3aaf`, `358314d4`): absent there; verified on Tau Ceti's `main` on GitHub today, as data (R01).
- J. Brüning, M. Lesch, *Hilbert complexes*: paywalled (DOI 10.1016/0022-1236(92)90147-B); cited as a work without theorem numbers, unchanged since the previous report.

## Source issues

- none
