# Review of HilbertModularVarietiesAndShimuraCurvesPartII (pull request #1745 at 2fc7d25)

**Verdict:** accepted

Incremental re-review of the 54 lines changed since 5fc1730, and of the pull request's title and description against this head. No finding. The acceptance is conditional on the five declared supplier gaps (tame-types, single-type-rings, breuil-mezard-pbt, power-series-cancellation, quaternionic-component-realization).

## Previous findings

- R01 — repaired: line 74 now reads “with Henniart's types σ(τ) as in the supplier contract with PadicLocalLanglandsForGL2Qp: every irreducible smooth E-representation … becomes isomorphic to σ(τ)”; the correspondence is no longer asked of LocalGaloisDeformationRingsPartII.
- R02 — repaired: lines 464, 563, 811 carry “DeformationAndDerivedPatchingAlgebra §3.1, 6.1” once, and lines 1119, 1148 “GlobalGaloisDeformations §3.3–3.4” once; no *Needs* or Dependencies line repeats an item.
- R03 — repaired: the description says “`Suggested.lean` states no declaration: none of the roadmap's headline theorems is statable at the pins” and “the targeted Lake build succeeds with no warning”.

## Verified sound

| Statement | Instances | Values | Result |
|---|---|---|---|
| gap:tame-types, image statement (line 74) | GL₂(𝔽₂) ≅ S₃; GL₂(𝔽_p) with scalar τ = χ⊕χ | S₃: trivial = σ(scalar), sign = cuspidal type (dim q−1 = 1), 2-dimensional = Steinberg, excluded; χ∘det = σ(χ⊕χ) in the BHHMS23 normalisation | holds; matches BHHMS23 line 4706 |
| gap:tame-types, constituents indexed by P_τ with multiplicity one | f=1 principal series, 0<c<p−1; f=1 cuspidal, c=0 and 0<c<p−1; GL₂(𝔽₄) | principal series: dims (c+1)+(p−c) = p+1; cuspidal: c+(p−1−c) = p−1, and c=0 gives one constituent of dim p−1; 𝔽₄: 5 = 1+2+2, 3 = 1+2 | holds; EGS15 lines 569, 605, 628 |
| gap:tame-types is minimal against its supplier | LocalGaloisDeformationRingsPartII head 83a2083, README lines 15, 63, 154 | §0.5 proves constituents only when μ − sw⁻¹ν − η is 1-deep; σ(τ) imported from PadicLocalLanglandsForGL2Qp §4.4; no image statement, no lattices | the three clauses ask for nothing the supplier or §4.4 states |
| New contract “From TauCetiRoadmap.PadicLocalLanglandsForGL2Qp” (line 68) | §4.4 at its open head; scalar τ, p=3 | §4.4: K = GL₂(ℤ_p), supercuspidal types over any local field; scalar τ: σ(τ) of dim p = 3, σ^cr(τ) = χ∘det of dim 1; BHHMS23 line 593 takes χ∘det | contract describes §4.4 as it is; the GL₂(O_K) extension is the supplier's gap:tame-types-unramified |
| Line 13 and line 205: split of the type inputs | every use of “tame-type gap” or gap:tame-types (lines 13, 74, 80, 205, 225, 368, 399, 738, 791, 892) | σ(τ) → §4.4; 1-generic constituents → T.0; image, other constituents, lattices → gap | the ten passages agree with line 74 |
| Line 791: `P̃_{σ_v}[1/p]` ≅ ⊕_τ σ(τ), each once | f=1, σ = Sym^r, 0<r<p−1; σ a Steinberg twist | generic σ: every lift constituent is principal series, cuspidal or (r=0) one-dimensional, each σ(τ) by the image statement; Steinberg weight excluded by genericity | attribution to MP.5/projective-adjoint with the image statement is right |

The rows for untouched statements stand as in the previous review, of 5fc1730.

- Gate at 2fc7d25: every check 0, `OK` (rerun; the worker's run also has `build=0`). Outside-folder diff against `origin/main`: empty.
- Dependency check: `depcheck: 234 roadmaps, 2228 edges, 0 problem(s)`; no UPWARD or CYCLE line. PadicLocalLanglandsForGL2Qp, the supplier this change adds, is earlier in the merge order.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output; the file has no declaration, so there is no signature to compare and no padding to probe.
- Source locators checked against the text in the changed passages, 9 of 9 confirmed: BHHMS23 line 591 (§2.2, p. 13), line 4706 (Remark 8.2.5, p. 93); EGS15 line 569 (Lemma 3.1.1, p. 12), lines 605 and 628 (§§3.2–3.3, pp. 12–13), line 946 (§5.1 opens on p. 19 and runs to p. 27), line 954 (p. 20), line 3239 (Definition 10.1.4, p. 60), line 3324 (Proposition 10.1.11, p. 62).
- Seeded sample in the changed passages: 0.2 (paragraph of line 205 and its *Needs*), 1.1, 3.4 and 4.2 (*Needs* lines and the attributions of lines 791, 892); each resolves as in the table.
- Cross-roadmap citations resolved at open heads: PadicLocalLanglandsForGL2Qp §4.4; LocalGaloisDeformationRingsPartII “Tame inertial types”, “Weights of a tame type” and its definition of N-generic (README line 120); ModpRepresentationsOfGL2OverLocalFields MP.5/projective-adjoint, MP.6/diamond-box, MP.6/adjoint-tensor (label table, lines 2697–2701).
- Description against the head: it presents the pull request as adding the folder, states that `Suggested.lean` has no declaration, and its dependency block lists PadicLocalLanglandsForGL2Qp; nothing the head contradicts.
- Overlap check: read ModpRepresentationsOfGL2OverLocalFields, LocalGaloisDeformationRingsPartII, CompletedCohomologyAndLocalGlobalCompatibilityPartII; σ(τ) and σ̄(τ) are owned by PadicLocalLanglandsForGL2Qp §4.4 and cited here; constituents of 1-generic tame types by LocalGaloisDeformationRingsPartII and cited here; nothing else shared.
- Source independence: changed passages only; 5 passages (the gap sentence's two new clauses, the new supplier contract, lines 13 and 205) compared with 2 sources (BHHMS23 lines 591–600, 4706–4713; EGS15 lines 560–638, 946–957), none shared beyond the 8-word name of the excluded class; largest share BHHMS23, 177 of 444 source-id citations; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- CompletedCohomologyAndLocalGlobalCompatibility and GL2ModularityLifting (closest-roadmap lists): no checkout under those names was listed, so their scope was not read again this round.
- The items of the earlier reviews' lists stand: none of them lies in a changed passage.

## Source issues

- none

## For the human reviewers

- The README's gap:tame-types sentence (README.md line 74) no longer matches the `needs` recorded for the same slug in `packages/HilbertModularVarietiesAndShimuraCurvesPartII/design/plan.json` (line 3307), which still asks the supplier for the correspondence τ↦σ(τ) itself.
