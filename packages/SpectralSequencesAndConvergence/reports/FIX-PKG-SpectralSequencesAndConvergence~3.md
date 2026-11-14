# FIX-PKG-SpectralSequencesAndConvergence~3

The review `REV-PKG-SpectralSequencesAndConvergence~2` raises one finding (F01, P2). Its "For the
human reviewers" section says "none". Its "Source issues" section lists misprints in the sources.
These are not findings, and the review says the roadmap does not inherit them.

## REV-PKG-SpectralSequencesAndConvergence~2/F01 (P2) — applied

In the `Suggested.lean` module docstring, the convergence bullet said "under bounds on the bottom
and a monomorphism condition at the top". It now spells out `HasConvergenceBounds`: `H^n(⊥ ≤ i)`
and `H^{n+1}(⊥ ≤ i)` vanish for `i ≤ a`, and `H^n(⊥ ≤ j) ⟶ H^n(⊥ ≤ ⊤)` is an isomorphism, not
merely a monomorphism, for `j ≥ b`. The comparison bullet "under the same bounds" now reads "that
both have these convergence bounds". No signature changed.

**Verification.** The finding is right. Take `K = ℤ` in degree `0` with `G_j = 0` for every
integer `j`. Each `H^0(⊥ ≤ j) = 0 → H^0(⊥ ≤ ⊤) = ℤ` is a monomorphism, and the bottom vanishing
holds for every `a`. If a monomorphism were enough, the theorem's second conclusion would say that
`abutmentFiltrationι j 0 : 0 → ℤ` is an isomorphism, which is false.

At the pin (`TauCeti/Algebra/Homology/SpectralObject/Abutment.lean`, `abutmentFiltration`,
`abutmentFiltrationι`), `abutmentFiltrationι j n` is the inclusion of the image of `H^n(⊥ ≤ j)`.
It is always a monomorphism, and it is an isomorphism exactly when `H^n(⊥ ≤ j) → H^n(⊥ ≤ ⊤)` is an
epimorphism.

For the comparison theorem: the map from the zero filtered complex to this `K` is an isomorphism
`0 → 0` on every page, but `0 → ℤ` on `H^0`. The definition at `Suggested.lean` lines 120–130 and
README 4.4 already require the isomorphism, so the fix only affects the summary.

**The same defect elsewhere.** I checked every passage of the package that states the condition
at the top (README lines 66–68, 260–265, 1025–1027, 1060–1066, 1067–1069, 1112–1123, 1172–1175,
1185–1190, 1272–1282; `Suggested.lean` docstrings of `HasConvergenceBounds`,
`convergence_of_hasConvergenceBounds` and `isIso_hom_app_abutment_of_hasConvergenceBounds`;
`design/plan.json` item 4.3). One more statement was wrong:

- **`convergence_of_hasConvergenceBounds`, docstring (was the last sentence).** It said: "The top
  condition is weaker than the vanishing of `H^{n-1}(j ≤ ⊤)` that Tau Ceti's
  `spectralSequencePageXIsoEInfty` assumes." This is false for the same witness. For `K = ℤ` in
  degree `0` with `G_j = 0`, `H^{−1}(j ≤ ⊤) = H^{−1}(K / G_j) = 0`, so the vanishing holds while
  the isomorphism fails.
  - The true statement: the second canonical map `mapFourδ₄Toδ₃'` is an isomorphism once
    `H^n(⊥ ≤ q + r − 1) → H^n(⊥ ≤ ⊤)` is a monomorphism (README 4.3, boundary side). That
    condition is strictly weaker than the vanishing of `H^{n−1}(q + r − 1 ≤ ⊤)` assumed by
    `spectralSequencePageXIsoEInfty` (hypothesis `h₃`, `TauCeti/Algebra/Homology/SpectralObject/Stabilization.lean`).
  - The isomorphism at the top is needed for exhaustion, and neither the monomorphism nor the
    vanishing gives exhaustion.
  - The docstring now says exactly this.
- **README 4.4, Check "An isomorphism, not a monomorphism, at the top".** I added one sentence:
  in the same example, `H^{−1}(j ≤ ⊤) = 0` as well, so Tau Ceti's top vanishing does not give
  convergence either. This Check now witnesses the corrected docstring.

All other passages are correct and unchanged:
- The monomorphism criterion of 4.3 (boundary side) and its supplier-contract remark at README
  line 265 are correct; the proof is in the table below.
- README lines 66–68 and the 4.6 bullet ("isomorphism in degree `n` in place of vanishing in
  degrees `n − 1` and `n`") are correct by exactness of
  `H^{n−1}(j ≤ ⊤) → H^n(⊥ ≤ j) → H^n(⊥ ≤ ⊤) → H^n(j ≤ ⊤)`.
- The last Check of 4.4 ("not a monomorphism") is correct: a map that is not a monomorphism is not
  an isomorphism.
- The 5.3 hypothesis is an isomorphism.

### Adversarial pass on the changed text

| Statement | Instances tried, values on each side | Result, change |
| --- | --- | --- |
| Module docstring, convergence bullet (top condition is an isomorphism) | `K = ℤ[0]`, `G_j = 0`, `n = 0`: top map `0 → ℤ` is mono, not iso; `abutmentFiltration j 0 = 0`, abutment `ℤ`. Under the old (mono) wording the conclusion `IsIso (abutmentFiltrationι j 0)` would assert `0 ≅ ℤ`. `ℤ →(×2) ℤ` in degrees `0, 1`, stupid filtration, `n = 1`: `H^1(G_j) = ℤ/2 → ℤ/2` iso for `j ≥ 0`; `H^1(G_{−1}) = ℤ → ℤ/2` not iso, so `b = 0` is sharp; `H^1(G_i) = H^2(G_i) = 0` for `i ≤ −2`, and `H^1(G_{−1}) = ℤ ≠ 0`, so `a = −2` is sharp. | Old wording false; corrected. Matches the definition and README 4.4. |
| Module docstring, comparison bullet | Zero spectral object → spectral object of `ℤ[0]` with `G_j = 0`: pages `0 → 0` iso, `H^0` map `0 → ℤ` not iso; the target fails `HasConvergenceBounds` (top `0 → ℤ` not iso), so the theorem does not apply. Identity of the `×2` object: pages iso, `H^1 = ℤ/2 → ℤ/2` iso. | Agrees with the theorem's signature; wording corrected. |
| `convergence_of_hasConvergenceBounds` docstring: second map iso under the mono | Proof: for `x ∈ H^{n−1}(q + 1 ≤ ⊤)`, mono of `H^n(⊥ ≤ j) → H^n(⊥ ≤ ⊤)` makes `H^{n−1}(⊥ ≤ ⊤) → H^{n−1}(j ≤ ⊤)` epi (exact sequence of `⊥ ≤ j ≤ ⊤`); lift the image of `x` to `z`; `x − z|` comes from `H^{n−1}(q + 1 ≤ j)`, and `δ(z|) = 0` because `H^{n−1}(⊥ ≤ ⊤) → H^{n−1}(q + 1 ≤ ⊤) → H^n(⊥ ≤ q + 1)` is zero. So `B_r = Bᵗ` for `j = q + r − 1`. | True. |
| Same: "weaker than the vanishing of `H^{n−1}(q + r − 1 ≤ ⊤)`" | Vanishing ⇒ mono by exactness of `H^{n−1}(j ≤ ⊤) → H^n(⊥ ≤ j) → H^n(⊥ ≤ ⊤)`. Strictly weaker: `K = ℤ` in degree `−1`, `G_j = 0`, `n = 0`: top map `0 → 0` mono (indeed iso), `H^{−1}(j ≤ ⊤) = ℤ ≠ 0`. | True, strict. |
| Same: "neither the mono nor that vanishing suffices for exhaustion" | `ℤ[0]`, `G_j = 0`: `H^{−1}(j ≤ ⊤) = 0`, top map mono, filtration of `H^0 = ℤ` is zero at every finite `j`. | True. |
| README 4.4 Check, added sentence | `H^{−1}(K / G_j) = H^{−1}(ℤ[0]) = 0` for every `j`; pages zero; abutment `ℤ`. | True; agrees with 4.3 (page identifications survive) and with the corrected docstring. |
| Old docstring sentence "top condition weaker than vanishing of `H^{n−1}(j ≤ ⊤)`" | Same `ℤ[0]` witness: vanishing holds, iso fails. Conversely `ℤ` in degree `−1`: iso holds, vanishing fails. The two conditions are incomparable. | False; replaced. |

The context of the changed docstrings is unchanged: only prose changed, and every binder is in
the declaration's own signature (see the `#check` record below).

## Checks

- **Elaboration.** I ran `lake env lean packages/SpectralSequencesAndConvergence/Suggested.lean`
  from the content checkout. Exit 0, about 9 s. The only messages are the 8 expected `declaration
  uses 'sorry'` warnings, at lines 99, 111, 150, 175, 194, 224, 250 and 270. These are the same 8
  theorems as before, moved down by the added docstring lines. There are no errors. The five
  `TauCeti.*` imports already had object files, so nothing was built.
- **Signatures.** I put `#check @name` for all 11 declarations in one scratch copy and elaborated
  it once (exit 0). I compared each elaborated type with its README statement:
  - The definitions `BidegreeAssignment`, `HasConvergenceBounds` and `IsMittagLeffler`.
  - The theorems `dFrom_eq_zero_of_boundedBelow`, `dTo_eq_zero_of_boundedAbove`,
    `convergence_of_hasConvergenceBounds`, `isIso_hom_app_abutment_of_hasConvergenceBounds`,
    `sum_negOnePow_homology_eq_sum_negOnePow_page`,
    `isIso_homologyMap_of_isIso_page_of_exhaustive_of_boundedBelow`,
    `isReplete_iff_countableAB4Star_and_epi_towerDifference` and
    `epi_towerDifference_of_isMittagLeffler`.

  Every type is unchanged from the previous round, and no section binder was lost. Only
  docstrings changed this round.
- **Dependency check.** `tauceti-roadmap … gate --depcheck packages/SpectralSequencesAndConvergence/README.md
  --name SpectralSequencesAndConvergence --order merge-order/ORDER.txt --movable --content …`
  printed:

      depcheck: 240 roadmaps, 2170 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line.
- **Citations.** The two leads in the worker's citation list are `DoubleComplex.edgeBottom` and
  `DoubleComplex.edgeLeft` (README line 365). They are names in DerivedModuleAlgebra's
  compatibility table on main (`TauCetiRoadmap/DerivedModuleAlgebra/README.md` line 65, mapped to
  §S.1), and README line 365 attributes them there. They are not this roadmap's names and not
  library names. No change.
- **Ownership.** This round adds no construction, target or Lean declaration, so there was no new
  ownership question to check. The worker's overlap list reports no pull request that changes
  this roadmap, no dropped cited id and no second copy.
- **Sources.** No source was added or fetched, and `sources.toml` is unchanged. There is no
  `needs-references.toml` request.

## For the maintainer

- No Lean name, target number or section id changed, so roadmaps that cite this one are not
  affected.
- The changes are prose only:
  - the module docstring of `Suggested.lean`;
  - the docstring of `convergence_of_hasConvergenceBounds`;
  - one added sentence in a README 4.4 Check.
