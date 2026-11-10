# Repair of CompletedCohomologyAndLocalGlobalCompatibilityPartII (package, round 3)

Review settled: `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/reports/REV-PKG-CompletedCohomologyAndLocalGlobalCompatibilityPartII~2.md` (two P3 locator findings, R01 and R02; no P1/P2). Both are correct and applied. The pattern search found three more locator slips in the same EP §3.4 citation family. They are repaired too and listed under R02.

## R01 (P3) — applied

`packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md`, Exact supplier contracts, From Tau Ceti: "`TauCeti.IsCompactModule.completedGroupAlgebraModule` in the adjacent `Module.lean`, line 344" → "… line 322". The sentence names only the module structure, so the scalar-tower lemma at line 340 is not added.

Evidence at the pinned Tau Ceti (`2fd255d9…`, confirmed by `git rev-parse` in the pinned checkout): `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Module.lean:322` is `noncomputable def completedGroupAlgebraModule : Module (completedGroupAlgebra R Γ) M`. Line 340 is `theorem isScalarTower_completedGroupAlgebraModule`, and line 344 ends that theorem's proof term. The README's description of the binders matches the section `variable` block at lines 83–85 and 195–197: compact-module witness `hM`, `[CompactSpace R]`, `[CompactSpace Γ]`, `[SMulCommClass Γ R M]`, `[ContinuousSMul Γ M]`.

Pattern check: I reopened every other library line locator in the README at the pins:
- Mathlib `Mathlib/RingTheory/Ideal/Maps.lean`: 869 `Module.annihilator`, 871 `Module.mem_annihilator`, 895 `Module.comap_annihilator`, 901 `Module.annihilator_eq_bot`.
- `Mathlib/Algebra/Module/Submodule/Ker.lean`: 59 `LinearMap.ker`, 63 `LinearMap.mem_ker`, with 64 ending its statement.
- `Mathlib/Algebra/Group/Action/Faithful.lean`: 47 `FaithfulSMul`.
- `Mathlib/RingTheory/Spectrum/Prime/Basic.lean`: 137 `zeroLocus`, 157 `vanishingIdeal`, 302 `zeroLocus_eq_univ_iff`.
- `Mathlib/RingTheory/Spectrum/Prime/Topology.lean`: 159 `zeroLocus_vanishingIdeal_eq_closure`.
- Tau Ceti `…/CompletedGroupAlgebra/Basic.lean`: 145 `completedGroupAlgebra`.

All are correct. Line 344 was the only wrong one.

## R02 (P3) — applied

§3.3 proof sketch: "simple-type dimensions and counts are Lemma 3.20 and Proposition 3.25" → "simple-type invariant spaces, dimensions and counts are Lemmas 3.20–3.21 and Proposition 3.25". The suggested repair is correct as written: Prop. 3.26 uses Lemma 3.20 for the depth bookkeeping and Lemma 3.21 for the dimensions.

Evidence: EP line 844 (Lemma 3.20, p. 356) says U^{n+1}(𝔄) acts trivially on V(α,θ) and that the U^n(𝔄)-invariants are zero. EP lines 848–850 (Lemma 3.21, p. 356) give the dimension formula. EP lines 923–928 (proof of Prop. 3.26, p. 358) use Lemma 3.20 to place i in I(n) and then Lemma 3.21 with Prop. 3.25 for the growth.

Same-pattern repairs (EP §3.4 locators):
- **Gap contract `gap:minimal-stratum-types`** (README "Exact supplier contracts", plus the `detail` of the same slug in the top-level `gaps` list of `design/plan.json`). "Lemmas 3.20–3.25 (EP lines 783–850)" → "Lemmas 3.20–3.24, pp. 356–357, and Proposition 3.25, p. 358 (EP lines 783–916)". EP has no Lemma 3.25: line 902 is Proposition 3.25. The old line range stopped at Lemma 3.21, but Lemmas 3.22–3.24 (intertwining, lines 865–895) and Proposition 3.25 (lines 902–916) are inside the cited span. The slug, `needs`, `supplier` and `section` are unchanged.
- **§6.5 statement**: "EP §3.4, pp. 354–359" → "pp. 354–358". §3.4 runs from EP line 750 (page header line 731: printed p. 354) to line 928. §4 starts at line 929, still on printed p. 358 (header line 898). Printed p. 359 (header line 939) opens with Proposition 4.1 of §4.
- **References, EP entry**: "§§2–3, pp. 342–359" → "pp. 342–358". §2 starts at line 260, on printed p. 342 (header line 229), and §3 ends at line 928, as above.

Other EP §3 locators checked and correct:
- Lemma 3.10 (line 728, p. 353) and Proposition 3.11 (line 747, p. 354).
- Definition 3.12 and Example 3.15 (lines 753, 761, p. 354).
- Definition 3.17 (line 815, p. 355).
- Propositions 3.19 (line 824, p. 356) and 3.26 (line 919, p. 358).

## Frozen design text

Two layer fields of `design/plan.json` still carry the old locators. The `proofSketch` of target 3.3 says "Lemma 3.20 and Proposition 3.25", and the §6.5 `where` field says "EP §3.4, pp. 354–359". At the package stage only the top-level `gaps` list may be edited, so they are left as they are. The package README is authoritative.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Tau Ceti action locator | pinned `Module.lean` lines 322, 334, 340, 344 | 322: type `Module (completedGroupAlgebra R Γ) M`. 334: `@[simp]` smul lemma. 340: type `IsScalarTower R (completedGroupAlgebra R Γ) M`. 344: final term `⟨hM.smul_completedSMul⟩` of the line-340 theorem. | 322 is the named object | 344 → 322 |
| EP Lemma 3.21 dimension (what §3.3 now cites) | rank one: E=F, m=1, n=4 | J^2=U_E^2·U^{[(n+1)/2]}=U_E^2 and H^2=U_E^2·U^{[n/2]+1}=U_E^2, so dim η=1. Lemma 3.21: (U^2:U^3)/(U_E^2:U_E^3)·1 = q/q = 1. An irreducible V of an abelian group has dim 1, so they agree. | holds | cite 3.21 |
| EP Lemma 3.21 growth (∼ part) | rank one, fixed m, n→∞ | (U^{m+1}:U^{n+1})^{1/2}·q^{−n/2} = q^{(n−m)/2}·q^{−n/2} = q^{−m/2}: constant in n, matching dim V = 1 | holds | none |
| EP Lemma 3.20 (invariant spaces) | rank one, n=4 | ψ_α is trivial on U^5 and nontrivial on U^4, so the U^5-invariant space is 1-dimensional and the U^4-invariant space is 0. These are invariant-space facts, not dimensions of V(α,θ). | the two lemmas supply different inputs | cite both |
| Prop. 3.26 growth = Lemma 3.21 × Prop. 3.25 | rank one, fixed m | \|I(n)\| = #characters of U^{m+1}/U^{n+1} nontrivial on U^n = q^{n−m} − q^{n−m−1} ∼ q^n. Σ(dim)^2 = \|I(n)\|·1 ∼ q^{n−m}·(1 − 1/q), against (U^{m+1}:U^{n+1}) = q^{n−m}; the ratio 1 − 1/q is bounded. | holds | none |
| Gap contract locator span | EP lines 783–916 | 783: hereditary-order setup. 815: Def. 3.17. 824: Prop. 3.19. 844/848: Lemmas 3.20/3.21. 865/875/883: Lemmas 3.22/3.23/3.24. 902–916: Prop. 3.25 and proof. No "Lemma 3.25" exists. | span covers every cited item | 3.20–3.25 → 3.20–3.24 + Prop. 3.25 |
| §3.4 and §§2–3 page ranges | EP page headers at lines 229, 731, 898, 939 | Printed 342 (§2 starts at line 260), 354 (§3.4 starts at line 750), 358 (§4 starts at line 929), 359 (Prop. 4.1 of §4) | the sections end on p. 358 | 359 → 358 (twice) |

No mathematical statement, hypothesis, Check or worked example changed. Every Check that uses V(α,θ) or the I(n) count still agrees with the corrected citations. I re-read the §3.3 Checks: the d=1, 2 principal-family counts, the anisotropic filtration and the tame e=2 cumulative count. None of them cites Lemmas 3.20 or 3.21.

## Checks run

- **Elaboration.** `lake env lean packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/Suggested.lean`, run from the content checkout: exit 0, no output, about 29 s. `Suggested.lean` is unchanged. It has one `import Mathlib`, the module docstring and the namespace, with zero declarations, so the `#check @name` binder comparison had 0 declarations to compare, and nothing changed.
- **Dependency check** (exact output):

  ```text
  depcheck: 236 roadmaps, 2144 edges, 0 problem(s)
  ```

  There are no UPWARD, CYCLE or moved lines. The reviewer counted 2143 edges. These edits add no citations, so the extra edge comes from elsewhere in the board.
- **`roadmaps resolve`** on the README: no cross-roadmap citations and no Lean names found nowhere.

## Notes for the maintainer

- These edits are locators only. No declaration names, section ids or gap slugs changed, so no other roadmap is affected.
- The edits add no constructions, so there was no new ownership question. Ownership against open pull requests was not re-checked beyond what the review records.
- No source was fetched and no missing reference is requested. All locators were read in the cached EP text and the pinned libraries.
- No suspicious instructions were found in the review text.
