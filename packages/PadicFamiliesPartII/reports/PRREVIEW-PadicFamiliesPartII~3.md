# Review of PadicFamiliesPartII (pull request #2280 at 9604938)

**Verdict:** needs changes

## R01 (P2) — The source-based arrangement remains (previous R01)

**Location:** `TauCetiRoadmap/PadicFamiliesPartII/README.md:263`: “Layer 4 supplies both Layer 5 and Layer 6, which do not use each other”; layer headings at lines 585, 766 and 929.

**Claim:** Layers 4–6 still reproduce the consecutive Hida, doubling and Coleman divisions of BCGP21; their order is not forced by the dependencies.

**Witness:** BCGP21 lines 55–80: Layer 4 ↔ §4; Layer 5 ↔ §5; Layer 6 ↔ §6, including §§6.2–6.5 in order. The diff changes no layer or section ordering.

**Repair:** Regroup the special-fibre amplitude and divisor geometry, the partial-ordinary families and derived control, the analytic comparison, and the doubling conclusion around their prerequisites. Keep each result's prime and weight hypotheses, and map every moved id. Incorporate the independent treatments in P20 §7.4, p. 42, and §§13.3.3–14.7, pp. 90–100, and AIP15 Propositions 7.2.3 and 7.3.1, pp. 34–35. Update the build paragraph and Lean docstring to the resulting numbering.

## R02 (P2) — The reduction argument assumes more than lci total spaces

**Location:** `TauCetiRoadmap/PadicFamiliesPartII/README.md:499`: “through `f^!K ≅ Lf^*K ⊗^L f^!O` for the lci projections”.

**Claim:** The new proof route treats both projections as lci morphisms, although the contracts only supply schemes that are lci over ℤₚ. These are different hypotheses; the cited lci formula cannot be applied on that evidence.

**Witness:** P20 lines 1705–1707 assert lci over Spec ℤₚ. `TauCetiRoadmap/SchemeAndStackFoundations/README.md:5232` requires f itself lci. P20 lines 701–702 instead supply the tensor formula for perfect coefficients without that assumption.

**Repair:** Replace the reduction clause with: “Reduce the integral maps by derived tensor with ℤₚ/p. The models and bundles are ℤₚ-flat, so reduction uses the perfect complex `[O →ᵖ O]`; the perfect-coefficient projection formula and Tor-independent base change identify the reduced correspondences (P20 Proposition 4.1.2.1, p. 16, and §7.4, p. 42; SchemeAndStackFoundations §§2.18–2.19).” Add §2.18 to the Needs line. For p = 3 the complex has H⁻¹ = 0 and H⁰ = O/3, giving ordinary coefficient reduction as required.

## Previous findings

- R01 — not repaired: “Layer 4 supplies both Layer 5 and Layer 6, which do not use each other” (`TauCetiRoadmap/PadicFamiliesPartII/README.md:263`); the three layers retain their former sections and order.
- R02 — repaired: “§9.6 … is not a prerequisite of any target of this roadmap” (`TauCetiRoadmap/PadicFamiliesPartII/README.md:92`); the numbering table and source-issues paragraph now identify its use as a comparison Check.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Fundamental-class contract, line 167 | f: t ↦ t² over ℚ; boundary t = 0 | With τ(t)=1, τ(1)=0: Θ=2tτ, trace(1)=2, trace(t)=0; tΘ=2t²τ lies in the pulled-back boundary ideal | agrees | none |
| Hartogs/divisibility contract, line 171 | X=Spec ℤ₃[x], remove V(3,x); s=9x | Quotient s/9=x extends uniquely; across V(3) instead, 1/3 is regular on the open but does not extend | agrees | none |
| §3.1 reduction route | Perfect coefficient O/3 on a ℤ₃-flat model | [O →³ O]: H⁻¹=0, H⁰=O/3; multiplication by 6 reduces to 0 on both descriptions | coefficient route works; lci premise unsupported | R02 |
| Layers 4–6 arrangement | Three layer divisions; Needs edges between them | Three consecutive source divisions match; edges 4→5 and 4→6, zero edges 5→6 | order not forced | R01 |
| Hilbert polarization convention, line 587 | Two split places; valuations of x_w are (1,0) | vₚ(Norm(x_w))=1; vₚ(Norm(x_w)³/p³)=3−3=0 | agrees | none |
| §4.6 divisibility Check | p=3, two places; r=2,4 | 9g∈9A gives no restriction; 9g∈81A gives g∈9A; source bound is gap>9 | agrees | none |
| §5.2 partial Frobenius | p=3; d=1,2; x_w=p when d=1 | d=1: deg π=9, deg(3λ)=81, quotient=1; d=2: deg π=729, polarization degree=729² | agrees; factor 3³ would give quotient 3⁸ | none |
| §5.3 boundary trace using new contracts | Frob₃ on two coordinates; Norm(x_w)=3 | Normalization 27/27=1; trace(x²y² dx∧dy)=dx∧dy; function trace=0; target twist A² | agrees | none |
| §5.4 second divisor operator (sampled) | p=3; trivialized twists and δ=1 | deg(F²)=9²=81; successive traces send x⁸y⁸→x²y²→1, equal to F²-trace; L→LA²→L | agrees | none |
| §5.9 nonzero module and refinements | M=𝔽̄₃, α=1, β=2; also M=0 | T=0, U=2, C²=1; (C−1)(C−2)=0; eigenvector matrix determinant=2; M=0 gives the zero ring | agrees | none |
| §6.1 coefficient rank | Weights (2,2), (4,2); two places with (4,2),(6,2) | Sym⁰ rank=1; Sym² basis x²,xy,y² gives rank=3; tensor rank=3·5=15 | agrees | none |
| §6.4 parity and §9.6 comparison | Gaps 2,3,4; one Klingen place, k=4 | Gap 3 excluded; reflected bounds −3+3=0, −3+5=2; H⁰ bound=5; inverse twist gives −8 | agrees | none |
| §6.5 continuation Check (sampled) | (6,2), (4,2), one Klingen place | min(6+2−3,6−2−2)=2 admits slope 0; min(4+2−3,4−2−2)=0 excludes it | agrees | none |

Rows for untouched statements stand as in the previous review, of `40706dd`.

- Source locators checked: 30 across P20 (11), BCGP21 (17) and AIP15 (2), including changed supplier contracts and the affected seeded targets §§5.4 and 6.5; BCGP21 p. 126 was also inspected visually to confirm the fraction p²/x_w.
- Pinned declarations opened: 1, `IsLocalRing` at `Mathlib/RingTheory/LocalRing/Defs.lean:30`, which extends Nontrivial. Suggested.lean has 0 declarations: signature comparison and one-tactic probes have no subject.
- Changed supply resolved: AlgebraicModuliForArithmeticGeometry §7.5 at #853; SchemeAndStackFoundations §§0.6, 2.18–2.19 on main; HigherHidaAndColemanTheory §§9.6–9.7 in its package. The new fundamental-class import matches its owner; the remaining reduction premise is R02.
- Gate: every counter 0, OK; targeted build succeeded without warnings. Separate `lake env lean` elaboration: exit 0, no output.
- Dependency-check output: `depcheck: 239 roadmaps, 2175 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Scope/text checks: 0 outside-folder changes, 0 changed Lean declarations; the PR already names the added supplier #853 in its merge-order block. No title or prose contradiction found.

Overlap check: read the scopes of GSp4NonregularModularityLifting, AutomorphicBundlesPartII, AlgebraicModularFormsAndSerreWeightsPartII, OverconvergentAutomorphicForms and PerfectoidShimuraVarieties; their lifting applications, classical coherent comparisons, integral spherical operator, general analytic coefficients and period towers remain with those owners. The changed fundamental class is owned by AlgebraicModuliForArithmeticGeometry §7.5; Hartogs by SchemeAndStackFoundations §0.6. No new duplicate ownership found.

Source independence: changed passages only; 10 passages compared with 3 sources (P20, BCGP21, AIP15), no copied expression or reused material found. Largest share: BCGP21, 84 of 221 explicit source-citation labels before References. No layer was added, removed or reordered; the previous contents-comparison finding remains R01.

## Not verifiable

- HigherHidaAndColemanTheory remains absent from main and the supplied open-PR index; §§9.6–9.7 were checked in `packages/HigherHidaAndColemanTheory/README.md`.
- Unchanged source passages, headline statements and their earlier sample checks were not repeated in this incremental review.

## Source issues

- **Error** in BCGP21 at Remark 5.8.7, p. 135: the source says every finite-dimensional M satisfying the operator conditions generates a local Artinian algebra; it should be nonzero finite-dimensional M, since End(0) is the zero ring; affects a stated result.
- **Error** in BCGP21 at §6.4, proof of Corollary 6.4.3, p. 154: the source says the operator after the differential equals p to the differential order times the reverse composite; it should be the differential after the operator equals that factor times the reverse composite; affects the proof.
- **Misprint** in P20 at Proposition 13.3.3.1, p. 90: the source says the equivariant operator on the reflected term is p^(−k−1)U; it should be p^(k+1)U, consistent with AIP15 Proposition 7.2.3 and the ensuing slope bounds; affects nothing.

## For the human reviewers

- **Scope.** BCGP25 is cited as arXiv:2502.20645v1 (2025), without a journal reference (`TauCetiRoadmap/PadicFamiliesPartII/README.md:1487`); Layers 7–9 use this preprint.
- **Scope.** HigherHidaAndColemanTheory exists only as a board package under review; LocallyAnalyticRepresentationsOfLocalGroups and LocallyAnalyticDistributionsPartII are open pull requests. This pull request cannot merge before these suppliers are on main.
- **Licence.** P20 locators use the author's university-hosted PDF, not Duke pagination (`TauCetiRoadmap/PadicFamiliesPartII/README.md:1485`); BP26 is cited as an author version (line 1489).
