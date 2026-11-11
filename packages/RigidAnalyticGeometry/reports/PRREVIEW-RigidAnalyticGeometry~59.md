# Review of RigidAnalyticGeometry (pull request #1807 at 6fcc928)

**Verdict:** accepted

This is an incremental re-review: 0 lines of `TauCetiRoadmap/RigidAnalyticGeometry/` changed since `096aff5`. Between the two heads, the pull request changed AdicSpacesPartIII (commit `9eacb178`) and six other folders. This README cites only AdicSpacesPartIII among them. I found no finding.

## Previous findings

- The review of `096aff5` raised no finding of its own.
- R01 and R02 of the review before that one were recorded there as repaired, and they stay repaired at this head:
  - README lines 64–65 still read "AdicSpacesPartIII R3.6 *affinoid-completed-field-extension*, downstream, cites it".
  - AdicSpacesPartIII line 11036 still reads "RigidAnalyticGeometry §1.3 owns this theorem and its proof".
  - *proper-cohomology-adic-completion* (Part III line 10941) has the same statement as at `096aff5`. Only its Checks were reformatted.

## Verified sound

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §1.3, faithful flatness of `A→A_L` and `A_L⊗_A M≅L⊗̂_K M`. Cited by Part III *affinoid-completed-field-extension*, whose *Needs:* changed. | `L=K`; `A=K`, `L=ℚ_p(√p)`; `A=0`; `A=K⟨T⟩`, `M=A/(T)` | `A_K=A`, both maps are identities. `ℚ_p→L` is free of rank 2. `A_L=0`, `Max 0=∅`, so faithful flatness is just flatness. `L⟨T⟩/(T)=L=L⊗̂_K K`, and `T·L⟨T⟩` is proper. | true | none |
| §1.3, wrong carrier (algebraic `A⊗_K L`) | `K=ℚ_p`, `L=ℂ_p`, `A=K⟨T⟩` | `Σ pⁿαₙTⁿ` with K-independent units `αₙ` lies in `L⟨T⟩`. It is not in `A⊗_K L`, whose coefficients span a finite-dimensional K-space. The pinned `CompletedTensor` is a `Completion`, so it excludes this carrier. | excluded | none |
| Line 74 (§7.5 → Part III *proper-cohomology-adic-completion*) | `A=K⟨T⟩`, `a=T`, `X=Spa A`, `F=𝒪`, `i=0`; `J=0`; `J=A` | `M=A`, `R_k=TᵏA`, `TR_k=R_{k+1}`, `Q_k=0`, `M^∧_T=K⟦T⟧=lim A/Tᵏ`. For `J=0` both sides are `M`; for `J=A` both are `0`. | true; Part III's statement unchanged | none |
| Line 74, degenerate `a` | `a=0`; `a=1` | `a=0`: `R_0=M`, `R_k=ker(id)=0` for `k≥1`, `aR_k=0=R_{k+1}`. `a=1`: `F/aᵏF=0`, `R_k=M=aR_k`. | true | none |
| Line 75 (§8.4 → Part III R3.7 *proper-gaga*) | `X=P¹_K`; `F=𝒪(−2)`; `F=𝒪(1)` | `𝒪(−2)`: `H⁰=0` and `H¹=K` on both sides. `𝒪(1)`: `H⁰=K²` on both sides. | true | none |

The rows for statements untouched by this change stand as in the review of `096aff5`.

- **Gate.**
  - The worker's gate passes every check, with `build=0`.
  - My own run reports `outside-folder=24`. All 24 hits are the README and `Suggested.lean` of the twelve folders that the brief names as this pull request's own.
  - `git diff --stat origin/main...HEAD`, excluding those folders, is empty.
- **Dependency check (verbatim):** `depcheck: 230 roadmaps, 2072 edges, 0 problem(s)`.
- **Elaboration.**
  - `lake env lean` on `TauCetiRoadmap/RigidAnalyticGeometry/Suggested.lean` exits 0.
  - Its only output is twelve `declaration uses sorry` warnings, at lines 94, 110, 127, 136, 154, 169, 190, 204, 229, 242, 264 and 282.
  - The pins and the file are unchanged since `096aff5`, so the earlier `#check @` comparison and padding probe still hold. `signatures.md` reports 0 dropped binders.
- **Cross-roadmap citations: 18 resolved against AdicSpacesPartIII at this head.**
  - All 16 Part III target names in README lines 44–75 are present, each in the section the table gives: R3.3 (line 9794), R3.6 (lines 10637–11032) and R3.7 (lines 11218–11448).
  - The headings R3.1–R3.7 are present (lines 9046–11175).
  - Part III's mentions of RigidAnalyticGeometry are unchanged except the §1.3 *Needs:* line (line 11041).
- **Library: 6 Tau Ceti declarations from §1.3 opened at the pin.**
  - `Huber.CompletedTensor` (`RingTheory/Huber/TensorProduct/Completion.lean:73`)
  - `Huber.BanachModule.CompletedTensor` (`RingTheory/Huber/BanachModule/CompletedTensor.lean:201`)
  - `CompletedTensor.weightedRestrictedEquiv` (`RingTheory/Huber/TensorProduct/Restricted.lean:184`)
  - `AffinoidPushout` (`RingTheory/Affinoid/Pushout/Basic.lean:108`)
  - `IsAffinoidAlgebra.finite_quotient_of_isMaximal` (`RingTheory/Affinoid/MaximalSpectrum.lean:46`)
  - `exists_continuousLinearEquiv_prod_of_countableType` (`Analysis/Normed/Module/Bases/Splitting.lean:87`)
- **Source locator: 1 checked.** [Conrad] Lemma 1.1.5(1) is on p. 6 (Conrad lines 274–276), and its proof runs over pp. 6–7 (lines 287–300). Its hypotheses match §1.3.
- **Overlaps.**
  - `overlaps.md` lists no dropped id and no id that only an open revision defines.
  - The open pull request for AdicSpacesPartV (README lines 15 and 90) cites §§7.3–7.4. The table at README lines 69–75 maps those sections to Part III, so the citation stays valid.
  - #1808 and #1854 are ordered after this pull request in the description's shared-folder block.
- **Description.**
  - The RigidAnalyticGeometry paragraph and the summary sentence match this head: the twelve headlines, the seven not-statable items in the docstring, the §§7.1, 7.3–7.5 and 8.4 table, and no CompactOperators supplier.
  - Remark for AdicSpacesPartIII's review, with no change asked here: the sentence "AdicSpacesPartIII's and ComplexKahlerGeometry's change only in comments" is now false for AdicSpacesPartIII. Its `Suggested.lean` changes by 90 insertions and 466 deletions against main.
- **Earlier remarks now resolved.** Part III's duplicated line in the formal-functions Checks is gone. The merge-order block no longer lists pull requests that have already merged.

## Not verifiable

- [BGR] 6.1.1 and 6.1.1/12, cited in §1.3: the manifest records them as `uncertified` (paywalled), and they are settled.

## Source issues

- none
