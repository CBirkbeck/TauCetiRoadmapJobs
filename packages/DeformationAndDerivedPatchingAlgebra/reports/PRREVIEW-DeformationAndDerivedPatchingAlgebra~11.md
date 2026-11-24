# Review of DeformationAndDerivedPatchingAlgebra (pull request #3027 at 7c341e7)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 35 changed lines since `74a09b7`. Accepted: the change adds §3.12a (the order of an element on a module free of finite rank over a discrete valuation ring, with its expression by primes), one clause each in the Layer 3 dependencies and the scope paragraph, and two supplier contracts; the statement, both Checks, the route, the Stacks locator and the three library declarations were recomputed or opened at the pins and all agree. There is no finding, one small correction in text the pull request does not touch, and no format note; nothing is left for a human to decide.

## C01 — Untouched text: §3.2 (README line 522) cites a regular-local bound by a name no library declares

The sentence reads "PurityOfBranchLocus §0.3's `IsRegularLocalRing.globalDimension_le`". A reader who searches either pinned library for that name finds nothing. PurityOfBranchLocus (its README, line 442) records the item as realised by `TauCeti.IsRegularLocalRing.globalDimension_eq_ringKrullDim`, which is at `TauCeti/RingTheory/RegularLocalRing/ProjectiveDimension.lean`, line 222. Naming that declaration in place of the unknown name would fix the sentence. It is a remark for a separate pull request and does not block.

## Previous findings

- The previous review (of `cd123f8`) had no finding. The folder is unchanged since that head.
- C01 (previous) — not repaired: line 522 still cites "PurityOfBranchLocus §0.3's `IsRegularLocalRing.globalDimension_le`". It lies in untouched text and is carried as C01 above.

## Verified sound

Here `O` is a discrete valuation ring with uniformizer `π`, fraction field `E` and normalized valuation `v`.

| Statement | Instances tried | Computed left side | Computed right side | Result |
|---|---|---|---|---|
| 3.12a determinant form | `B=O[X]`, `M=O[X]/(X²−π)`, `a=X` | `M/XM=O/π`, length `1` | matrix `[[0,π],[1,0]]`, `det=−π`, `v=1` | agrees |
| 3.12a determinant form, degenerate | `M=0`; `a` a unit of `O` on `O^r`; first Check with `m=0` | `0`; `0`; `X+1` is a unit of `O[[X]]`, `0` | `v(1)=0`; `v(u^r)=0`; `0+min(0,n)=0` | agrees |
| 3.12a sum over primes, nonreduced | `B=O[X]`, `M=O[X]/(X²)`, `a=X+π` | matrix `[[π,0],[1,π]]`, `det=π²`, `θ=2` | one prime `(X)`, `length(M_P)=2`, `κ=E`, `v(π)=1`: `2·1=2` | agrees |
| 3.12a sum over primes, residue field larger than `E` | `M=O[X]/(X²−π)`, `a=X`, `P=(X²−π)`, `κ(P)=E(√π)` | `θ=1` | `length(M_P)=1`, `N(√π)=−π`, `v=1` | agrees |
| First Check | `n=1`, `m=2` | `M/aM=O/(π²(π²+π))=O/(π³(1+π))`, length `3` | points `X=0`, `X=π`: `v(π²)+v(π+π²)=2+1=3=m+min(m,n)` | agrees |
| First Check, why `m≠n` | `m=n`, characteristic `2`; `m=n`, `v(2)>0` | `a=X−πⁿ` vanishes at `X=πⁿ`: hypothesis fails; `v(2πⁿ)=n+v(2)` | `min(m,n)=n` | `m≠n` is needed and present |
| First Check, `ℤ_(p)[[X]]/(X−p)≅ℤ_p` | `f(p)=0` in `ℤ_p`; solve `f=(X−p)g` coefficientwise | `g_i=−(f_0+…+f_i p^i)/p^(i+1)`, in `ℤ_(p)` since `p^(i+1)` divides the partial sum | `X↦p` is onto `ℤ_p` by digit expansions | true; `ℤ_p` is not finite over `ℤ_(p)` |
| Second Check | `a=X` on `O[[X]]/(X(X−πⁿ))` | `M/XM=O[[X]]/(X)=O`, infinite length | matrix `[[0,0],[1,πⁿ]]`, `det=0` | hypothesis fails, as stated |
| Route: `B⊗E` need not be Artinian | `B=O[X]`, `M=O`, `XM=0` | `B⊗E=E[X]`, not Artinian | `B̄=O`, `B̄⊗E=E` | agrees |
| Route: multiplicity of `κ(P)` | `P∩O=0`, so `π` is inverted in `B_P` | `M_P=(M⊗E)_P` | multiplicity of `κ(P)` in `M⊗E` is `length_(B_P)(M_P)`, finite | agrees |
| Mathlib contract `Ring.ord` | `OrderOfVanishing/Basic.lean:37` | `Module.length R (R ⧸ Ideal.span {x})` | README: "the length of `O/dO`" | agrees |
| Mathlib contract `Ring.ord_eq_addVal` | `OrderOfVanishing/Noetherian.lean:89`, `[IsDomain R] [IsDiscreteValuationRing R]`, every `x` | `ord R x`; `⊤` at `x=0` | `addVal R x`; `⊤` at `0`, `addVal(uϖⁿ)=n` (`addVal_def`, `Basic.lean:406`) | agrees; file as the README names it |
| Tau Ceti contract | `SmithNormalForm/Length.lean:58`, `[IsDomain R] [IsPrincipalIdealRing R]`, `hA : A.det ≠ 0` | `Module.length R ((ι → R) ⧸ range A.mulVecLin)` | `Ring.ord R A.det`; namespace `Matrix` | name, file and hypotheses as the README states |
| Stacks Lemma 10.121.7 (02MI) | Stacks lines 13794–13797, with Definition 10.121.5, lines 13779–13786 | `d(M,φM)=ord_R(det φ)` for a lattice in a one-dimensional Noetherian local domain | `φM⊆M` gives `d=length(M/φM)` | supports "its form for the lattice `M` and its image `aM⊆M`" |

- Source locators checked against the text: 1 in the change (Stacks, Algebra, Lemma 10.121.7, tag 02MI, with Definition 10.121.5). None of the 15 seeded-sample targets lies in a passage the change adds, alters or affects.
- Library declarations opened at the pins: 5. Tau Ceti `Matrix.length_quotient_range_mulVecLin_eq_ord_det` (`TauCeti/LinearAlgebra/Matrix/SmithNormalForm/Length.lean:58`) and `TauCeti.IsRegularLocalRing.globalDimension_eq_ringKrullDim` (`TauCeti/RingTheory/RegularLocalRing/ProjectiveDimension.lean:222`); Mathlib `Ring.ord` (`RingTheory/OrderOfVanishing/Basic.lean:37`), `Ring.ord_eq_addVal` (`RingTheory/OrderOfVanishing/Noetherian.lean:89`), `IsDiscreteValuationRing.addVal` (`RingTheory/DiscreteValuationRing/Basic.lean:402`).
- Cross-roadmap citations resolved: the change adds none. ReducibilityIdealsAndUltrafilterPatching cites §3.12a (its README lines 134, 172, 193, 842, 856) as the free case of its 3.17, in agreement with the head; PurityOfBranchLocus README line 442 for C01.
- Dependency check: `depcheck: 132 roadmaps, 1468 edges, 0 problem(s)`; no UPWARD or CYCLE line. The change adds Mathlib and Tau Ceti declarations and no roadmap supplier.
- Automatic checks: all passed on this head. Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 18 `sorry` warnings and nothing else. `Suggested.lean` is identical to the merge base, so no declaration is added, removed or restated, and the one-tactic probe has no changed declaration to test; §3.12a is an adapter of Layer 3, not a headline.
- README record: the 9 layers of the merge base are kept with their titles; the headings differ only by the added `### 3.12a`. Nothing is removed.
- Pull request text: the description's sentence on this folder ("DeformationAndDerivedPatchingAlgebra §3.12a from a Tau Ceti determinant formula") agrees with the head. The pull request changes nothing outside `TauCetiRoadmap/`. The other open pull request that changes this roadmap does not conflict in this folder.

Overlap check: read DirectSummandsAndBigCohenMacaulay, LocalGaloisDeformationRings, DeformationAndDerivedPatchingAlgebraPartII (main) and searched HilbertModularVarietiesAndShimuraCurvesPartII, PurityForFlatCohomology, CompletedCohomologyPartII, AutomorphyLiftingBeyondTaylorWiles and every other roadmap for the object; nothing shared with those. The only other roadmap naming it is ReducibilityIdealsAndUltrafilterPatching 3.17, which owns the form for a module finite over `O` (with the kernel term) and cites §3.12a for the free case; the determinant form itself is Tau Ceti's.

Source independence: 5 passages compared (changed passages only) with 1 source and 1 library file: lines 744, 758 and 763 with Stacks §10.121 (longest shared run 3 words, "with fraction field"); lines 1941 and 1953 with the docstrings of the declarations they describe (the statement only). Largest share of the change's locators: Stacks, 1 of 1. Arrangement not compared: no layer is added, removed or reordered.

Research link: The roadmap is the commutative algebra of Taylor–Wiles–Kisin and derived patching (Kisin; Khare–Wintenberger 2009; Calegari–Geraghty 2018), used in modularity lifting (Boxer–Calegari–Gee–Pilloni 2021; Allen et al. 2023); §3.12a is the order function of Stacks §10.121, consumed by ReducibilityIdealsAndUltrafilterPatching 3.17. Rests on the README's summary and References.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- none
