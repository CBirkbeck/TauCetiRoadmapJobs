# Review of SobolevDifferentialForms (pull request #1609 at 577b469)

**Verdict:** needs changes

Incremental re-review of the 13 lines changed since dfa3517 (all in `README.md`: the Scope bullet on the Gram inner product and star, the `### From TauCetiRoadmap.ComplexKahlerGeometry` subsection replaced by a paragraph at the end of `### From Tau Ceti`, and Layer 1's `### Dependencies`; nothing outside the folder; `Suggested.lean` byte-identical to the previous head). Gate at this head (worker's run, data): every check 0, `build=0 OK`. My dependency check with the candidate merge order (this roadmap at line 380): `depcheck: 240 roadmaps, 2344 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. `lake env lean TauCetiRoadmap/SobolevDifferentialForms/Suggested.lean`: 5 `sorry` warnings (lines 123, 162, 173, 179, 187), exit 0. Pins: Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`.

## R01 (P3) — the sentence about ComplexKahlerGeometry K5a describes a construction K5a does not plan, and a "comparison of two stars" that are one map

Location: `README.md` lines 116–117: "ComplexKahlerGeometry K5a specialises the same Mathlib star to `⋀ᵏ V*`; this roadmap does not use K5a, and the comparison of the two stars is K5a's to state."

Claim: a citation of a roadmap section states what that section says; a README assigns no new target to another roadmap.

Witness: `TauCetiRoadmap/ComplexKahlerGeometry/README.md` on main, lines 581–583 and 597–603. K5a's carrier is the alternating bundle `V_x = T_xM [⋀^Fin k]→L[ℝ] E_x` with `E_x = ℝ`, and its star is "constructed", with `vol` the native `Orientation.volumeForm`, characterised by `α ∧ ⋆β = ⟨α, β⟩ vol` and `⋆² = (−1)^{k(m−k)}`, with increasing wedges of an orthonormal coframe orthonormal. The words `exteriorPower`, `hodgeStar` and `V*` occur nowhere in that README. Tau Ceti's `Orientation.formHodgeStar` (main, data) lives on the same carrier `V [⋀^Fin k]→L[ℝ] ℝ` and satisfies the same law, `Orientation.wedge_formHodgeStar_apply`: `α.wedge (⋆β) v = alternatingFormInner V k α β * o.volumeForm v`, with the same inner product (`alternatingFormInner_eq_sum`). The law determines `⋆β` (the wedge pairing with `vol` is perfect), so K5a's planned star and the library's are one map on one carrier: there is no "`⋀ᵏ V*` specialisation" in K5a and nothing for K5a to compare.

Repair (tested against K5a lines 597–603 and the two Tau Ceti statements): replace the two clauses by "ComplexKahlerGeometry K5a plans this pointwise star on alternating maps of an oriented real inner-product space, characterised by `α ∧ ⋆β = ⟪α, β⟫ vol`; Tau Ceti's `Orientation.formHodgeStar` satisfies that law (`Orientation.wedge_formHodgeStar_apply`), so this roadmap consumes the library directly and does not cite K5a." The first sentence of the paragraph (`formHodgeStar` is Mathlib's `exteriorPower.hodgeStar` transported along `TauCeti.alternatingFormEquiv`) is correct and stays.

## R02 (P3) — "most later than the pinned revision" is time-bound

Location: `README.md` lines 90–91: "All as Tau Ceti implements them on its main branch, most later than the pinned revision; `Suggested.lean` uses none of them."

Claim: a README is timeless.

Witness: the clause compares Tau Ceti's main with this repository's manifest at one moment; it is true at `a91d3aaf` (sixteen of the nineteen names are absent there) and false once the pin moves past them. The previous review (r3, R01) raised it with the same repair; the passage is unchanged at this head.

Repair: "All on Tau Ceti's main branch, which `Suggested.lean` does not import; file paths under `TauCeti/Analysis/`."

## Previous findings

- R01 — not repaired: lines 90–91 still read "All as Tau Ceti implements them on its main branch, most later than the pinned revision; `Suggested.lean` uses none of them." Carried as R02 above.

## Verified sound

**The changed passages.** (1) Scope bullet (line 35): "the Gram inner product on alternating maps, their identification with exterior powers and the pointwise Hodge star to Tau Ceti" — `TauCeti.alternatingFormInner`, `TauCeti.alternatingFormEquiv`, `Orientation.formHodgeStar` are on Tau Ceti main (data, files named in `### From Tau Ceti`), none at the pin `a91d3aaf` (grep of `.lake/packages/TauCeti`: no match), consistent with lines 90–91. (2) Line 115: "`Orientation.formHodgeStar` is Mathlib's `exteriorPower.hodgeStar` on `⋀ᵏ V`, transported to alternating forms along `TauCeti.alternatingFormEquiv`" — exact. Mathlib `6b7abb3c`, `LinearAlgebra/ExteriorPower/HodgeStar.lean:48`: `exteriorPower.hodgeStar B hB vol hkl : ⋀[R]^k M ≃ₗ[R] ⋀[R]^l M`, with `B` a bijective bilinear form, `vol : ⋀[R]^(finrank R M) M ≃ₗ[R] R`, `hkl : k + l = finrank R M`, characterised by `B.exteriorPower l (⋆x) = wedgePairing vol hkl x` (line 53). Tau Ceti main, `Analysis/InnerProductSpace/HodgeStar/Basic.lean` (data): `Orientation.hodgeStar hkl := exteriorPower.hodgeStar (innerₗ V) TauCeti.bijective_innerₗ o.volumeEquiv hkl`, under `[InnerProductSpace ℝ V] [FiniteDimensional ℝ V] [Fact (finrank ℝ V = n)] (o : Orientation ℝ V (Fin n))`; `HodgeStar/AlternatingForm.lean` (data): `formHodgeStar hkl := ((alternatingFormEquiv V k).symm.trans (o.hodgeStar hkl)).trans (alternatingFormEquiv V l)`. So `alternatingFormEquiv V k : ⋀[ℝ]^k V ≃ₗ[ℝ] V [⋀^Fin k]→L[ℝ] ℝ`, and §1.1's "`Covector.toExteriorPower` … is `TauCeti.alternatingFormEquiv` inverted" has the right direction. For `V = E = EuclideanSpace ℝ (Fin n)` the `Fact (finrank ℝ E = n)` instance is `finrank_euclideanSpace_fin`, and the standard orientation is that of `EuclideanSpace.basisFun`. (3) Layer 1 `### Dependencies` (lines 209–210) names exactly the suppliers of §1.1–§1.3's `*Needs:*` lines (Mathlib exterior powers and `extDeriv`; Tau Ceti's inner product and star). (4) The deleted `### From TauCetiRoadmap.ComplexKahlerGeometry` subsection: K5a is cited nowhere else in the README (grep: only lines 116–117), so no `*Needs:*` line dangles; the dependency check confirms the edge set has no problem.

**Citation leads** (worker's `citations.md`): `Covector.toExteriorPower` is `Suggested.lean:74` inside `namespace Covector` (line 44); `HasWeakExtDerivOn.ae_eq_zero` is line 123. Both are the roadmap's own, declared; not findings.

**Lean file.** Byte-identical to dfa3517 (`git diff --stat dfa3517 HEAD` lists only `README.md`), so the previous report's checks carry: 17 declarations, no lost binder (worker's `signatures.md`, 0 flagged), single `import Mathlib`, no `set_option`, no sorry'd data, `theorem` throughout, the module docstring naming each unstated headline with what it lacks (§1.2 star: `Orientation.formHodgeStar`, absent at the pin, confirmed by grep). One-tactic probes carry forward unchanged.

**Suppliers.** PDE (Lane A.6), GeometricMeasureTheory (G6) on main and earlier in the order; ComplexKahlerGeometry no longer a supplier. Ownership against the open heads was settled in the previous reports; the diff adds no object. The dependency check output is quoted above.

**Adversarial table** (statement; instances; values on each side; result; change). Rows for untouched statements are the previous reports', cited as such.

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| line 115: `formHodgeStar` = Mathlib's `hodgeStar` transported (changed) | `n = 2`, `k = 1`, `B = ⟪·,·⟫`, `vol(e₁∧e₂) = 1` | Mathlib law `⟪⋆e₁, y⟫ = vol(e₁ ∧ y)`: `y = e₂` gives `1`, `y = e₁` gives `0`, so `⋆e₁ = e₂`, `⋆e₂ = −e₁`; transported: `⋆e¹ = e²`, `⋆e² = −e¹` | equals the §1.2 Check; `⋆⋆ = −1 = (−1)^{1·1}` | none |
| same, against `wedge_formHodgeStar_apply` | `α = e¹, β = e¹`; `α = e², β = e¹` | `e¹ ∧ ⋆e¹ = e¹ ∧ e² = vol = ⟪e¹,e¹⟫ vol`; `e² ∧ e² = 0 = ⟪e²,e¹⟫ vol` | the law `α ∧ ⋆β = ⟪α,β⟫ vol` holds, same convention as the Conventions' `δ` | none |
| lines 116–117: K5a "specialises the same Mathlib star to `⋀ᵏ V*`", "two stars" (changed) | K5a main lines 581–583, 597–603 vs Tau Ceti `formHodgeStar` | K5a carrier `T_xM [⋀^Fin k]→L[ℝ] ℝ`, law `α∧⋆β = ⟨α,β⟩vol`, no Mathlib declaration named; Tau Ceti carrier `V [⋀^Fin k]→L[ℝ] ℝ`, same law; the law determines `⋆` | same carrier, same map; the sentence misdescribes K5a | R01 |
| Scope bullet line 35 and Layer 1 Dependencies (changed) | the three Tau Ceti names at `a91d3aaf` and on main | pin: 0 of 3 present; main: 3 of 3, files as listed | consistent with lines 90–91 and the docstring's "not statable" entry | none |
| §4.1 `Lᵖ` bi-Lipschitz bound, affine Check, §5.3 zero-trace (two instances), §1.2 third Check, §3.5 top degree, §7.1 Rellich hypotheses, §5.3 `ker_frontierTrace` hypotheses | previous report (r3) rows 1–8 | as there | correct | none |
| `HasWeakExtDerivOn` identity, converse of alternatization, Gram inner product, transport, star convention, `δ` sign, §1.3 adjointness, §3.4 adjoints, §3.5 norms, §3.6 divergence, §5.1, §5.2, §5.4, the four Hilbert-complex headlines, §6.2 interval, §7.1 Gaffney and core, §7.3 degenerate degrees, §7.4 annulus, §7.2 chart map | previous reports (r2 rows 1–3, 7–16, 18, 19, 21–31) | as there | correct | none |

**Seeded sample.** The sample's targets (§1.1, §2.1, §2.3, §3.2–§3.5, §4.1, §5.1–§5.4, §6.2, §7.2, §7.4) fall outside the diff except §1.1's supplier names and §1.2's star, checked above; their locators were verified in the previous reports and the text is unchanged.

**Policy scan of the diff**: no LaTeX delimiters, no pull-request numbers, no links, no revision hash, no process words.

## Not verifiable

- The nineteen Tau Ceti declarations of `### From Tau Ceti` at the pin `a91d3aaf`: absent there; read on Tau Ceti's `main` on GitHub today as data (`HodgeStar/Basic.lean`, `HodgeStar/AlternatingForm.lean` quoted above).
- J. Brüning, M. Lesch, *Hilbert complexes*: paywalled (DOI 10.1016/0022-1236(92)90147-B); cited without theorem numbers, unchanged.

## Source issues

- none
