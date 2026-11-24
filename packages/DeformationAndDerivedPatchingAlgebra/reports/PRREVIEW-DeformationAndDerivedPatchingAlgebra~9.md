# Review of DeformationAndDerivedPatchingAlgebra (pull request #3027 at 477bb48)

**Verdict:** needs changes

**Summary.** A review of the change against `main`: 34 changed lines since `aecb53a`. Checked: the new §3.12a (statement, sum over primes, both Checks, route), the changed Layer 3 dependencies, scope and Mathlib-contract sentences, and the added Fulton reference. Stacks tag 02MI was read at its locator. The mathematics of §3.12a holds on every instance computed. There is one finding (P2): the determinant form `length_O(M/aM) = v(det_E(a | M⊗E))` is already proved in the pinned Tau Ceti, and this pull request also plans it in GeometryOfNumbersAndQuadraticArithmetic §2.5.7, yet §3.12a sets it as a target with its own Smith-normal-form route. There are two small corrections (one on the description, one on untouched text), one format note and one question for the author; nothing is left for the human reviewers.

## R01 (P2) — The determinant form in §3.12a is a theorem of the pinned Tau Ceti, but the section sets it as a target with its own Smith-normal-form route instead of citing it

An implementer who follows the route bullet "For `M` free over `O` the first equality is Smith normal form" (README line 758) and the *Needs* line ("… and the Smith normal form over a principal ideal domain", line 763) proves again a statement the library already has. The roadmap also becomes a second planned owner of an object that is already settled.

Tau Ceti at the pin (`2fd255d`) has `Matrix.length_quotient_range_mulVecLin_eq_ord_det` (`TauCeti/LinearAlgebra/Matrix/SmithNormalForm/Length.lean:58`). Over a domain that is a principal ideal ring, for a square matrix `A` with `det A ≠ 0`, it proves `Module.length R ((ι → R) ⧸ range A.mulVecLin) = Ring.ord R (det A)`. To apply it, take a basis of `M`. Then `a` acts by such a matrix, `det_E(a | M⊗E) = det A`, and injectivity on `M⊗E` is the condition `det A ≠ 0`. Mathlib's `Ring.ord_eq_addVal` (`Mathlib/RingTheory/OrderOfVanishing/Noetherian.lean:89`) identifies `Ring.ord O` with `v`. Finite length and injectivity of `a` on `M` follow at once.

In this same pull request, ReducibilityIdealsAndUltrafilterPatching already cites that declaration as "the free case" of its 3.17 (1) (its README line 892). GeometryOfNumbersAndQuadraticArithmetic §2.5.7 (its README line 500) states `idx(A, gA) = v(det g)` for lattices over a discrete valuation ring, from the same Stacks lemma. With `A = M` and `g = a`, that is the same equality.

The smallest repair has four parts:

- In §3.12a, present the first equality as supplied. For example: "In a basis of `M` this is Tau Ceti's `Matrix.length_quotient_range_mulVecLin_eq_ord_det` with Mathlib's `Ring.ord_eq_addVal`; Stacks 02MI is its form for lattices."
- In the route bullet and in *Needs*, replace "Smith normal form" by that declaration.
- List the declaration with its file under `### From Tau Ceti`.
- List `Ring.ord` and `Ring.ord_eq_addVal` beside `LinearMap.det` and `Algebra.norm` under `### From Mathlib`.

The section's own target is then the sum over primes. No library declaration states that sum. In the roadmaps, it appears only inside the more general 3.17 (1) of ReducibilityIdealsAndUltrafilterPatching, which consumes §3.12a.

## C01 — The description's account of the added sections does not describe §3.12a

The description says the general roadmaps receive sections "each a theorem published before 20 November 2026 and stated in the generality of its source". §3.12a does not fit this:

- By its own words (line 763), its sum over primes is "an elementary adapter, proved from the determinant form".
- Its determinant form is stated for a discrete valuation ring and a free module. Stacks Lemma 10.121.7 (Stacks line 13794) holds for any one-dimensional Noetherian local domain and any lattice.

A sentence that would be right: "DeformationAndDerivedPatchingAlgebra receives §3.12a, the free case of ReducibilityIdealsAndUltrafilterPatching 3.17 (1): the determinant form (Stacks 02MI over a discrete valuation ring; in Tau Ceti as `Matrix.length_quotient_range_mulVecLin_eq_ord_det`) and the sum over primes derived from it."

## C02 — Untouched text: README §3.2, line 522, names a regular-local bound by a name no library declares

The line names `IsRegularLocalRing.globalDimension_le` as "PurityOfBranchLocus §0.3's". No declaration of that name exists at the pins. PurityOfBranchLocus records that name as realised by `TauCeti.IsRegularLocalRing.globalDimension_eq_ringKrullDim` (its README line 442; `TauCeti/RingTheory/RegularLocalRing/ProjectiveDimension.lean:222`). A reader who searches for the cited name finds nothing. Naming the realising declaration would fix this, in a separate pull request.

## N01 — The Fulton citation names all of Appendix A

The citation in §3.12a (line 763) and in the References names Appendix A of *Intersection Theory* as a whole. Giving the lemma or example would let a reader find the statement.

## Questions for the author

- ReducibilityIdealsAndUltrafilterPatching 3.17, in this pull request, attributes to Fulton (1984), Appendix A the statement for `M` finitely generated over `O`, with `θ(a; M) = length(M/aM) − length M[a]`. It keeps that form as its own. If that is Fulton's generality, would §3.12a state the finitely generated form, with 3.17 (1) citing it? That would follow the description's rule that a general roadmap states a published theorem in its source's generality. I could not check this: Fulton's book has no open copy, and the citation resolves only to the publisher's paywalled page.

## Verified sound

Here `O` is a discrete valuation ring with uniformizer `π`, fraction field `E` and normalized valuation `v`.

| Statement | Instances tried | Computed left side | Computed right side | Result |
|---|---|---|---|---|
| 3.12a determinant form | `B=O`, `M=O²`, `a=π` | `length(O²/πO²)=2` | `v(det diag(π,π))=2` | agrees |
| 3.12a determinant form | `M=0`; `a∈O^×`, `M=O^r` | `0`; `0` | `v(1)=0`; `v(a^r)=0` | agrees |
| 3.12a determinant form, first Check | `B=O[[X]]`, `M=B/(X(X−πⁿ))`, basis `1,X`, `a=X+π^m` | `M/aM=O/(π^m(π^m+πⁿ))`, length `m+min(m,n)` | matrix `[[π^m,0],[1,πⁿ+π^m]]`, `v(det)=m+min(m,n)` | agrees; `m=0` gives `0=0` |
| Determinant form against Tau Ceti | `Matrix.length_quotient_range_mulVecLin_eq_ord_det`, `R=O`, matrix of `a` | `length((ι→O)/range A)` | `Ring.ord O (det A)=v(det A)` by `Ring.ord_eq_addVal` | same statement after a basis: R01 |
| Sum over primes, first Check | primes `(X)`, `(X−πⁿ)`, both `κ=E`, length 1 | `θ=m+min(m,n)` | `v(π^m)+v(πⁿ+π^m)=m+min(m,n)` | agrees; `m=n`, `v(2)>0` would give `2n+v(2)`, so `m≠n` is needed |
| Sum over primes, nonreduced `B` | `B=O[X]/(X²)`, `M=B`, `a=π+X` | `det [[π,0],[1,π]]=π²`, `θ=2` | one prime `(X)`, `length_{B_P}(M_P)=2`, `v(π)=1`: `2` | agrees |
| Sum over primes, inseparable `κ(P)` | `O=𝔽_q[[π]]`, `B=O[y]/(y^q−π)`, `M=B`, `a=y` | `B/yB=O/π`, `θ=1` | prime `(0)`, length 1, `N(y)=±π`, `v=1` | agrees |
| Route: `B⊗E` need not be Artinian | `B=O[X]`, `M=O`, `XM=0`, `a=X+π` | `M/aM=O/π`, `θ=1`; `B⊗E=E[X]` | `Ann=(X)`, one prime `(X)`, `κ=E`, `ā=π`: `1` | agrees; `B̄⊗E=E` Artinian |
| Second Check | `a=X` on the first Check's `M` | `M/XM=O`, infinite length | matrix `[[0,0],[1,πⁿ]]`, `det=0` | hypothesis fails, as stated |
| Remark on completeness | `O=ℤ_(p)`, `O[[X]]/(X−p)` | `p`-adic completion of `ℤ_(p)`, i.e. `ℤ_p` | uncountable, so not finite over countable `ℤ_(p)` | true |
| Route: `B̄` finite over `O` | `B̄⊆End_O(M)≅M_r(O)` | `O`-submodule of a finite free module | finite since `O` is Noetherian | true |
| Stacks Lemma 10.121.7 (02MI) | Stacks line 13794; Definition 121.5, line 13786 | `d(M,φM)=ord_R(det φ)`, `R` any 1-dim Noetherian local domain | `φM⊆M` gives `d=length(M/φM)` | supports the first equality, more generally |
| GeometryOfNumbersAndQuadraticArithmetic §2.5.7 | `A=M`, `g=a⊗E`, `aM⊆M` | `idx(M,aM)=length(M/aM)` | `v(det a)` | same equality: R01 |

- Source locators checked against the text: 1 of the 2 in the change (Stacks tag 02MI); Fulton Appendix A is not readable. Of the 15 seeded-sample targets only 3.12a lies in the change; the other 14 are in untouched, unaffected text and were not reopened.
- Library declarations opened at the pins: Tau Ceti `Matrix.length_quotient_range_mulVecLin_eq_ord_det` (`SmithNormalForm/Length.lean:58`) and `TauCeti.IsRegularLocalRing.globalDimension_eq_ringKrullDim` (`ProjectiveDimension.lean:222`); Mathlib `Ring.ord` (`OrderOfVanishing/Basic.lean:37`), `Ring.ord_eq_addVal` (`Noetherian.lean:89`), `LinearMap.det` (`Determinant.lean:164`), `Algebra.norm` (`Norm/Defs.lean:61`), `Module.length` (`Length.lean:31`) and `Module.length_eq_add_of_exact` (`Length.lean:169`).
- Cross-roadmap citations resolved: ReducibilityIdealsAndUltrafilterPatching 3.17 and its contract for §3.12a (README lines 101–172, 855, 892; main's 3.17 already cited the Tau Ceti declaration); GeometryOfNumbersAndQuadraticArithmetic §2.5.7 (line 500); the three untouched names the citation tool could not find (IntegralHeckeAndGaloisDeterminants `Suggested.lean:365, 371`; PurityOfBranchLocus README line 442).
- Automatic checks: all passed on this head. Dependency check: `depcheck: 132 roadmaps, 1468 edges, 0 problem(s)`. The change adds no cross-roadmap supplier.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 18 `sorry` warnings and nothing else. The pull request leaves `Suggested.lean` unchanged (no declaration added, removed or restated), so the headline list, the one-tactic probe and the `#check` signatures were not redone.
- README record: the merge base has 9 layers and the head keeps all 9 with their titles; every section and id of the merge base is present. The only addition is §3.12a.
- Other open pull request on this roadmap: #3036 edits other lines of this README (the *Needs* lines of Layer 2). Its order before this pull request is stated in the description's merge-order block.

Overlap check: read HilbertModularVarietiesAndShimuraCurvesPartII, PurityForFlatCohomology, CompletedCohomologyPartII, AutomorphyLiftingBeyondTaylorWiles, GlobalGaloisDeformations (open), and DirectSummandsAndBigCohenMacaulay, LocalGaloisDeformationRings, DeformationAndDerivedPatchingAlgebraPartII (main). None states the order of an element or the lattice determinant formula. That object is shared with Tau Ceti (owner, proved) and with GeometryOfNumbersAndQuadraticArithmetic §2.5.7 (R01). It is generalised by ReducibilityIdealsAndUltrafilterPatching 3.17, which consumes §3.12a.

Source independence: 7 passages compared (changed passages only) with 1 source (Stacks §10.121: Lemma 10.121.7 and Definition 10.121.5); the longest shared run is "with fraction field", 3 words. Largest share of the change's locators: Stacks, 1 of 2 (Fulton, the other, not readable). Arrangement not compared: no layer is added, removed or reordered.

Research link: The roadmap is the commutative algebra of Taylor–Wiles–Kisin and derived patching (Kisin; Khare–Wintenberger 2009; Calegari–Geraghty 2018), used in modularity lifting (Boxer–Calegari–Gee–Pilloni 2021; Allen et al. 2023). §3.12a is the order function of intersection theory (Fulton 1984, Appendix A), which ReducibilityIdealsAndUltrafilterPatching 3.17 consumes. This rests on the README's summary and References.

## Not verifiable

- W. Fulton, *Intersection Theory* (Springer, 1984), Appendix A, cited in §3.12a as "see also": no open copy; the sources service found only the publisher's paywalled page (uncertified).

## Source issues

- none

## For the human reviewers

- none
