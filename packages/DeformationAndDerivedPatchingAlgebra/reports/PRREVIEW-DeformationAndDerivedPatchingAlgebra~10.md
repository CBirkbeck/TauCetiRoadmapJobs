# Review of DeformationAndDerivedPatchingAlgebra (pull request #3027 at cd123f8)

**Verdict:** accepted

**Summary.** Accepted. This review covers the 17 lines changed since `477bb48`. They repair the only finding: §3.12a now takes its determinant form `length_O(M/aM) = v(det_E(a | M⊗E))` from Tau Ceti's `Matrix.length_quotient_range_mulVecLin_eq_ord_det` and Mathlib's `Ring.ord_eq_addVal`, and keeps the sum over primes as its own target. The new route step, the two supplier contracts and the scope sentence match the declarations at the pins, and every case computed agrees. One small correction remains: it is carried from the previous review and is in text this pull request does not touch. There are no format notes, and nothing is left for a human to decide.

## C01 — Untouched text: §3.2 (line 522) cites a regular-local bound by a name no library declares

The sentence reads "PurityOfBranchLocus §0.3's `IsRegularLocalRing.globalDimension_le`". A reader who searches for that name finds nothing at either pin. PurityOfBranchLocus records the name as realised by `TauCeti.IsRegularLocalRing.globalDimension_eq_ringKrullDim` (its README line 442). That declaration is in `TauCeti/RingTheory/RegularLocalRing/ProjectiveDimension.lean`, line 222. Naming it in place of the unknown name would fix the sentence.

## Previous findings

- R01 — repaired: "This determinant form is Tau Ceti's `Matrix.length_quotient_range_mulVecLin_eq_ord_det` read in a basis of `M`, with Mathlib's `Ring.ord_eq_addVal` … The target of this section is the expression of `θ(a;M)` by primes" (line 744). The route (line 758), *Needs* (line 763) and both contracts (lines 1941, 1953) are changed to match.
- C01 (previous) — repaired: the description now reads "DeformationAndDerivedPatchingAlgebra §3.12a from a Tau Ceti determinant formula".
- C02 (previous) — not repaired: line 522 still cites "PurityOfBranchLocus §0.3's `IsRegularLocalRing.globalDimension_le`". It is carried as C01 above.
- N01 (previous) — repaired: the README no longer cites Fulton, neither in §3.12a nor in the References. Main's README never cited it.
- The previous question for the author no longer applies: it asked about Fulton's generality, and Fulton is no longer cited.

## Verified sound

Here `O` is a discrete valuation ring with uniformizer `π`, fraction field `E` and normalized valuation `v`.

| Statement | Instances tried | Computed left side | Computed right side | Result |
|---|---|---|---|---|
| 3.12a determinant form via Tau Ceti, non-diagonal matrix | `O=ℤ_(p)`, `B=O[X]`, `M=O²`, `X` acting by `[[0,p],[1,0]]`, `a=X` | `range A=⟨(0,1),(p,0)⟩`, `M/aM≅O/p`, length `1` | `det A=−p`, `Ring.ord O (−p)=length(O/p)=1=addVal(−p)` | agrees |
| 3.12a, rank 0 and units | `M=0` (empty index); `a=u∈O^×`, `M=O^r` | `0`; `0` | `ord(det of empty matrix)=ord 1=0`; `ord(u^r)=0` | agrees |
| 3.12a, equal characteristic | `O=𝔽_p[[t]]`, `B=O`, `M=O²`, `a=t` | `length(O²/tO²)=2` | `addVal(t²)=2` | agrees |
| Route: `det A≠0` from injectivity | `a=X` on the first Check's `M` (hypothesis fails) | `M/XM≅O`, infinite length | `det[[0,0],[1,πⁿ]]=0`, `Ring.ord O 0=⊤=addVal 0` | the theorem's `hA` hypothesis excludes this case, as the route says |
| Route: `a` injective on `M` | first Check, `a=X+π^m`, `m≠n` | `M` free ⇒ `M→M⊗E` injective, so the kernel of `a` on `M` is `0` | `det=π^m(π^m+πⁿ)≠0` | agrees |
| Sum over primes, on row 1 | `P=(X²−p)`, `κ(P)=E(√p)`, length 1; also `p=2` | `θ=1` | `v(N(√p))=v(−p)=1` | agrees |
| Mathlib contract `Ring.ord` | `Basic.lean:37`: `Module.length R (R ⧸ Ideal.span {x})` | README: "the length of `O/dO`" | same | agrees |
| Mathlib contract `Ring.ord_eq_addVal` | `Noetherian.lean:89`, context `[IsDomain R] [IsDiscreteValuationRing R]`, all `x` | `ord R x`; `x=0` gives `⊤` | `addVal R x`; `x=0` gives `⊤`; `addVal π=1` (normalized) | agrees |
| Tau Ceti contract | `Length.lean:58`: `[IsDomain R] [IsPrincipalIdealRing R]`, `Fintype ι`, `hA : A.det≠0` | `Module.length R ((ι→R) ⧸ range A.mulVecLin)` | `Ring.ord R A.det`; namespace `Matrix` only | matches the README's name, file and hypotheses |
| Stacks 02MI, as now cited | Stacks line 13794; Definition 10.121.5, line 13786 | `d(M,φM)=ord_R(det φ)`, for any lattice and any 1-dimensional Noetherian local domain | `φM⊆M` gives `d=length(M/φM)` | supports "its form for the lattice `M` and its image `aM⊆M`" |

The rows for untouched statements stand as in the previous review, of `477bb48`.

- Source locators checked against the text: 1 in the change, Stacks Lemma 10.121.7 (tag 02MI), with Definition 10.121.5 (Stacks lines 13779–13797). None of the 15 seeded-sample targets lies in the changed passages.
- Library declarations opened at the pins:
  - Tau Ceti: `Matrix.length_quotient_range_mulVecLin_eq_ord_det` (`TauCeti/LinearAlgebra/Matrix/SmithNormalForm/Length.lean:58`) and `TauCeti.IsRegularLocalRing.globalDimension_eq_ringKrullDim` (`RingTheory/RegularLocalRing/ProjectiveDimension.lean:222`).
  - Mathlib: `Ring.ord` (`RingTheory/OrderOfVanishing/Basic.lean:37`), `Ring.ord_eq_addVal` (`Noetherian.lean:89`), `IsDiscreteValuationRing.addVal` (`DiscreteValuationRing/Basic.lean:402`) and `addVal_eq_top_iff` (`:440`).
- Cross-roadmap citations resolved:
  - ReducibilityIdealsAndUltrafilterPatching cites §3.12a at README lines 7, 134, 172, 193, 842, 844 and 856, and all of these agree with the head. Line 856 writes the form with `M[a]`, which is `0` under §3.12a's hypothesis.
  - PurityOfBranchLocus README line 442, for C01.
- Automatic checks: all passed on this head. Dependency check: `depcheck: 132 roadmaps, 1468 edges, 0 problem(s)`. The change adds Tau Ceti and Mathlib declarations and no roadmap supplier.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 18 `sorry` warnings and nothing else. `Suggested.lean` is unchanged since `477bb48` and against the merge base: no declaration is added, removed or restated.
- README record: the 9 layers of the merge base are all kept with their titles. Since `477bb48` the change touches §3.12a, the Layer 3 dependencies, the scope paragraph, two supplier contracts and the References. The only thing removed is the Fulton entry, which this pull request had itself added.
- Pull request text: the title and description agree with this head. The other open pull request that changes this roadmap does not conflict in this folder.

Overlap check: searched all open and main roadmaps for the object (the order of an element on a module, its determinant form, the Tau Ceti declaration). Only ReducibilityIdealsAndUltrafilterPatching names it, as the consumer of §3.12a and with the generalisation 3.17. Owners: the determinant form belongs to Tau Ceti (proved). The sum over primes belongs to this roadmap (§3.12a). The scopes of the closest roadmaps (HilbertModularVarietiesAndShimuraCurvesPartII, PurityForFlatCohomology, CompletedCohomologyPartII, AutomorphyLiftingBeyondTaylorWiles, DirectSummandsAndBigCohenMacaulay, LocalGaloisDeformationRings, DeformationAndDerivedPatchingAlgebraPartII) are unaffected by the change and stand as in the previous review: nothing shared. GeometryOfNumbersAndQuadraticArithmetic §2.5.7 (its README line 500) states the general lattice index. This roadmap no longer states that object.

Source independence: 5 passages compared (changed passages only).
- Three passages (lines 744, 758 and 763) were compared with 1 source, Stacks §10.121 (Definition 10.121.5, Lemma 10.121.7 and its proof). The longest shared run is "with fraction field", 3 words. The route uses the Tau Ceti declaration, not Stacks' reduction to elementary matrices.
- Two passages (lines 1941 and 1953) were compared with the docstrings of the library declarations they describe. Only the statement is shared. The largest share of the change's locators is Stacks, 1 of 1. Arrangement not compared: no layer is added, removed or reordered.

Research link: The roadmap is the commutative algebra of Taylor–Wiles–Kisin and derived patching (Kisin; Khare–Wintenberger 2009; Calegari–Geraghty 2018), used in modularity lifting (Boxer–Calegari–Gee–Pilloni 2021; Allen et al. 2023). §3.12a is the order function of Stacks §10.121, which ReducibilityIdealsAndUltrafilterPatching 3.17 consumes. This rests on the README's summary and References.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- none
