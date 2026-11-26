# Review of GlobalGaloisDeformations (pull request #3181 at a37cbe8)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 50 changed lines since `13a2ad8`. The change makes Mathlib's `continuousCohomology` of `TauCeti.ofDiscreteModule k G M` the cohomology object of the roadmap, in "Scope and ownership" and in the Mathlib and Tau Ceti supplier contracts, and keeps the explicit `Z1`, `B1`, `H1` as its degree-one presentation; every declaration it names was opened at the pins and has the stated shape, the convention agrees with the supplier ArithmeticGaloisDuality on `main`, and no layer, item or Lean declaration is touched. Accepted with no finding, one small correction (the `k`-linearity of the class map needs one more pinned input than the sentence names) and no format note; nothing is left for a human to decide.

## C01 — Naturality in `r • ·` alone does not give `k`-linearity of the class map; the linearity of the cohomology functor is the second input

In the Tau Ceti supplier contract (README lines 2121–2123): "applied to the equivariant endomorphism `r • ·`, the naturality makes the class map `Z1 → continuousCohomology 1` `k`-linear". An implementer who applies `TopRep.explicitH1AddEquivContinuousCohomologyOfDiscrete_map` with `φ = id` and `F = r • 𝟙` obtains that the class of `r • c` is the image of the class of `c` under `ContinuousCohomology.map id (r • 𝟙) 1` (`CohomologyComparison.lean`, line 502), not yet `r •` the class. The missing identification, that this map is multiplication by `r` on the `k`-module `continuousCohomology 1 X`, is at the pin: the instance `continuousCohomologyFunctor_linear` in `TauCeti/RepresentationTheory/Homological/ContCohomology/Additive.lean` (line 383), for a commutative coefficient ring, which `k` is.

The conclusion is true as stated. The smallest change is to name the second input, for example: "…the naturality, with the `k`-linearity of the functor (`continuousCohomologyFunctor_linear`, in `…ContCohomology.Additive`), makes the class map … `k`-linear".

## Previous findings

- The previous review of this folder read another pull request's head and had no finding and no open small correction; there is nothing to check as repaired.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Scope: `Hⁱ(G, M)` is `continuousCohomology i (TauCeti.ofDiscreteModule k G M)`, an object of `TopModuleCat k` | probe elaborated: `k` discrete field, `G` topological group, `M` discrete with continuous `k`- and `G`-actions | `Module.finrank k (continuousCohomology 1 (ofDiscreteModule k G M)) : ℕ` and `Submodule k` of it both elaborate; `ofDiscreteModule` asks `[ContinuousSMul k M]` (`SmoothDiscrete/Basic.lean` 223) | agrees | none |
| `H1 ≃+ continuousCohomology 1` for a discrete object with continuous action | signature at the pin; trivial `G`; `G = ℤ_p`, `M = 𝔽_p` trivial | hypotheses `[DiscreteTopology X.V] [ContinuousSMul G X.V]`, any `Ring k`; trivial `G`: `Z1 = 0` both sides; `ℤ_p`: `Z1 = Hom_cts(ℤ_p, 𝔽_p)`, rank 1, `B1 = 0` | agrees (`CohomologyComparison.lean` 486) | none |
| Class map `Z1 → continuousCohomology 1` is `k`-linear via naturality in `r • ·` | `_map` at `φ = id`, `F = r • 𝟙`; noncommutative `k` | gives `[r•c] = map id (r•𝟙) 1 [c]`; `= r•[c]` needs `continuousCohomologyFunctor_linear` (`Additive.lean` 383, `CommRing`); `r • ·` not `k`-linear for noncommutative `k`, the roadmap's `k` is a field | true; one input unnamed | C01 |
| `restrictScalarsIntIso`: finiteness and cardinality independent of the coefficient ring | `k = 𝔽₄`, `M = k` trivial, `G = ℤ₂` | `H¹ = Hom_cts(ℤ₂, 𝔽₄)`: 4 elements over `k` and over `ℤ`; `finrank` 1 over `𝔽₄`, 2 over `𝔽₂`, so only cardinality transfers, as written | agrees (`RestrictScalars.lean` 304) | none |
| Tangent bullet: class of a cocycle is `H1pi` then the comparison; `Def_ρ̄(k[ε]) ≅ H¹(G, ad ρ̄)` | `H1pi` at the pin; trivial `G`; Kisin line 87–96; Gee lines 598–608 | `H1pi : Z1 G M →+ H1 G M` (`LowDegree.lean` 834); trivial `G`: one deformation, `H¹ = 0`; Gee Cor. 3.12: `h¹ + n² − h⁰`, the README's count; both on the stated pages | agrees | none |
| `B1` is the range of the differential, `B1_le_Z1` gives the quotient | `LowDegree.lean` 184, 506, 706 | `B1 := (d0 G M).range`; `Z1 := C1 ⊓ ker d1`; `B1_le_Z1` needs `[ContinuousSMul G M]` | agrees (text of `main`, reworded) | none |
| Agreement with the supplier of Selmer groups and of the first-order comparison | ArithmeticGaloisDuality on `main`, Conventions and §D8.1 | its `Hⁱ(G, M)` is `continuousCohomology i M` with discrete modules through `TauCeti.ofDiscreteModule` (lines 58–70); §D8.1 uses continuous cocycles `c ∈ Z¹` (line 6440) | one object on both sides | none |
| 8.2 (untouched, affected): `L¹_v ⊆ Z¹(F_v, ad ρ̄)` with image `L_v` in `H¹` (README line 1536) | against the new scope bullet | `L¹_v` is a subspace of the explicit `Z1`, `L_v` its image under the class map; a `k`-subspace exactly because that map is `k`-linear | consistent | none |
| Headlines 4.10 and 5.6 in `Suggested.lean` (untouched) | elaborated at this head | two `sorry` warnings, lines 50 and 65; `exists_primes_jointly_injective` takes an abstract `k`-space `H`, so it does not depend on the carrier chosen for `H¹` | agrees | none |

- Source locators checked against the text: 2, in the one changed bullet that carries any (Kisin, Lemma (1.3.1), p. 3: Kisin lines 85–96; Gee, Exercise 3.11 and Corollary 3.12, p. 13: Gee lines 577–608).
- Library declarations opened at the pins: 12 (`continuousCohomology`, Mathlib `ContCohomology/Basic.lean` 131; `TopRep`, `TopModuleCat`; `TauCeti.ofDiscreteModule`, `SmoothDiscrete/Basic.lean` 223; `Z1`, `B1`, `H1`, `H1pi`, `B1_le_Z1`, `LowDegree.lean` 184–834; `TopRep.explicitH1AddEquivContinuousCohomologyOfDiscrete` and `_map`, `CohomologyComparison.lean` 486, 502; `restrictScalarsIntIso`, `RestrictScalars.lean` 304), each also by `#check`.
- Cross-roadmap citations resolved on `main`: ArithmeticGaloisDuality Conventions and §D8.1 (*First-order Galois cocycle comparison*, line 6435).
- Record: no heading, layer, item or Lean declaration removed, retitled or added; all four hunks lie in "Scope and ownership" and "Exact supplier contracts".
- Seeded sample (3.4, 3.8, 4.2, 4.5, 4.6, 4.7, 4.9, 5.4, 5.6, 5.8, 6.2, 6.3, 6.7, 7.2, 7.3): none lies in a changed passage; those that count dimensions (3.8, 5.4, 5.8, 7.3) read `hⁱ` of the object the change now names, with no change of value.
- Automatic checks: all passed. Dependency check: `depcheck: 94 roadmaps, 1060 edges, 0 problem(s)`. No change outside this folder and `TauCetiRoadmap/EllipticCurves/`.
- Elaboration of `Suggested.lean`: two `sorry` warnings (lines 50 and 65), nothing else; no section binder lost in its 3 declarations. The one-tactic probe was not repeated: the file is unchanged.
- Pull request text: its paragraph on this roadmap matches the head sentence by sentence (the two places changed, `TopModuleCat k`, `restrictScalarsIntIso`, the degree-one presentation, the three additions to the Mathlib list); it states that the roadmap is revised and removes nothing.

Overlap check: read ArithmeticGaloisDuality (main; also the subject of two open revisions), LocalGaloisDeformationRings (main) and GlobalGaloisDeformationsPartII (open); nothing shared is owned twice. The cohomology object is Mathlib's, with Tau Ceti's `ofDiscreteModule`, cited here as in ArithmeticGaloisDuality; the change adds no object. The other open pull request that changes this README (adding §3.6a) touches lines 66, 306, 414, 1921 and the References of `main`'s text, disjoint from these hunks.

Source independence: changed passages only; 5 passages compared with 2 sources (Kisin, Gee), none shared: four are supplier contracts with no source wording, and the tangent bullet shares only the formula `h¹ + n² − h⁰`. Largest share of locators: KW, as in the earlier reviews. Contents not compared: the change adds, removes or reorders no layer.

Research link: the roadmap's headlines are the presentations and Taylor–Wiles generator counts of global deformation rings used by Khare–Wintenberger (2009) and Allen–Calegari–Caraiani–Gee–Helm–Le Hung–Newton–Scholze–Taylor–Thorne (2023), with the tangent-space dictionary of Kisin's lectures and Gee's notes; rests on the README's overview and References and on Gee lines 598–608.

## Not verifiable

- The text of the other open pull request that changes this roadmap was read only for this folder's README; whether the two heads merge without conflict elsewhere was not tested.

## Source issues

- none

## For the human reviewers

- none
