# Review of PadicFunctionalAnalysis (pull request #1807 at ed37e7d)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: "**PadicFunctionalAnalysis** is rewritten in the house shape, keeping §§0.1–5.6. It drops AdicSpacesPartII and LocallyAnalyticDistributions (completed tensors are pinned) and PadicMeasuresIwasawaAlgebras (§5.3 owns the Amice comparison on ℤ_p; a table maps the clauses it cites) … drops 46 of 48 declarations."

## Verified sound

| Statement | Instance | Left side | Right side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| `amiceTransform_completedGroupAlgebra_compat` (§5.3, named by the description's new paragraph) | `μ=δ_(−1)` | transform `(1+X)⁻¹ = 1−X+X²−…`; `X↦[γ]−1` gives `[γ]⁻¹` | `map ofAdd δ_(−1) = [ofAdd(−1)] = [γ]⁻¹` | equal | none |
| same | `μ=δ_1−2δ_0+δ_(−1)`, `p=2` | `(1+X)−2+(1+X)⁻¹ = X²/(1+X) ↦ ([γ]−1)²[γ]⁻¹` | `[γ]−2+[γ]⁻¹ = ([γ]−1)²[γ]⁻¹` | equal | none |
| §0.4 ring gauge (cited by the rewritten AdicSpacesPartIII, lines 575 and 10364, with `a=r⁻¹`, `a=q⁻¹`) | `A=ℚ_p`, `ϖ=p`, `a=1/p` | gauge of `pⁿu`: `aⁿ = p⁻ⁿ` | `‖pⁿu‖ = p⁻ⁿ`; `x=0`: both `0` | equal | none |
| §2.4 splitting (cited by AdicSpacesPartIII lines 671, 10704) | `E=c₀(ℕ,ℚ_p)`, `M={x : x₀=0}` | section `s(y)=(0,y)`; `E ≃ ℚ_p × M`, `x↦(x₀,(0,x₁,…))` | inverse `(a,m)↦a·e₀+m`, norm `max(‖a‖,‖m‖)=‖x‖` | holds | none |

The rows for untouched statements stand as in the previous review, of `2faed4d`.

- **Folder:** `git diff 2faed4d ed37e7d -- TauCetiRoadmap/PadicFunctionalAnalysis` is empty; `lake-manifest.json` and `lean-toolchain` are unchanged, so the pins and the earlier padding probe stand.
- **Description against the head (5 claims checked):** sections 0.1–5.6 are the same 32 on main and at the head; main's lines 43–44 name AdicSpacesPartII §R0.3 and LocallyAnalyticDistributions §0.0 as suppliers, the head names them only as consumers (lines 1669, 1680); the completed tensor is the pinned `TauCeti.Huber.BanachModule.CompletedTensor` (`RingTheory/Huber/BanachModule/CompletedTensor.lean:201`, README lines 171, 209–210); PadicMeasuresIwasawaAlgebras is a consumer only (lines 44, 1691), with the clause table at lines 1704–1718; main's `Suggested.lean` has 48 declarations, of which 46 are removed and 2 restated.
- **Loop sentence:** on main PadicMeasuresIwasawaAlgebras and AlgebraicVectorBundles cite each other, and AlgebraicVectorBundles and StableReduction cite each other; none of the three is cited as a supplier here.
- **Sibling citations resolved (AdicSpacesPartIII rewritten since `2faed4d`, 20 citing lines; RigidAnalyticGeometry, 7):** they cite §0.4, §§1.2, 2.1–2.4 and Layer 1 (§1.4), all present here; line 1673 here ("AdicSpacesPartIII §R3.6 consumes the splitting of §2.4 … `countable-type-closed-subspace-section`") matches AdicSpacesPartIII lines 671 and 10704–10711.
- **Pinned declarations opened (3):** `TauCeti.exists_continuousLinearEquiv_prod_of_countableType` (`Analysis/Normed/Module/Bases/Splitting.lean:87`), `AbstractMeasure.completedGroupAlgebraEquiv` (`NumberTheory/Padics/Measure/CompletedGroupAlgebra.lean:449`), `TauCeti.Huber.BanachModule.CompletedTensor` (above).
- **Gate:** the worker's gate at `ed37e7d` has every counter at 0, `build=0`. My run of `gate … --base origin/main` has every counter at 0 except `outside-folder=24`: the `README.md` and `Suggested.lean` of the 12 sibling folders this pull request owns; `git diff --stat origin/main...HEAD` outside the 13 folders is empty.
- **Dependency check:** `depcheck: 206 roadmaps, 1898 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean TauCetiRoadmap/PadicFunctionalAnalysis/Suggested.lean` exits 0; the only warnings are eleven `declaration uses sorry` (lines 74, 84, 98, 142, 166, 175, 189, 202, 218, 237, 263). The file is unchanged, so the `#check @` comparison of the 13 declarations stands as in the previous review.
- **Overlaps:** #1808 and #1854 are ordered after this pull request in the merge-order block; no id is dropped or defined only by an open revision; ownership against open pull requests stands as in the previous review, the folder being unchanged.
- **Remark on untouched text** (asks for no change): Downstream consumers (line 1673) lists AdicSpacesPartIII only for §2.4; AdicSpacesPartIII line 129 also cites §0.4 and §§1.2, 2.1–2.2.

## Not verifiable

- [Sch], [BGR] and [Bel] are settled as uncertified and cited by locator; no source locator changed, so none was re-read in this round.

## Source issues

- none
