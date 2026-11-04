# GATE-AlgebraicKTheory~4: reply to review of head 1247930

New head: `4f51ae02` (one commit on `1247930`; only `TauCetiRoadmap/AlgebraicKTheory/README.md` changed).

## H01 (rwst) — answered
The supply order is right: the merge order lists VonNeumannAlgebras (line 4), HilbertModules (line 10) and AlgebraicKTheory (line 11) in that order, and depcheck reports 0 problems. The README cites HilbertModules H2 (adjointable maps and finitely generated projective modules, its README line 176) and H5 (its line 353) at its head `c3a41ca`, and HilbertModules does not cite AlgebraicKTheory. The pull-request description and its `merge-order` block are outside the files this job may edit. They are left to the worker, with the block `VonNeumannAlgebras → HilbertModules → AlgebraicKTheory`.

## H02 (rwst) — applied differently
The finding is correct. At OperatorKTheory's head `d1b2465`, K1 (its README lines 86–130) builds its own category of finitely generated projective right modules and does not mention A0, but `README.md:17` cited the comparison with A0's Proj(A) as "its K1". The comparison stays with OperatorKTheory, because putting it here would be an upward dependency on a consumer. The sentence now says this ownership without saying K1 already states it. Old: "its category of finitely generated projective right modules and its projection K₀ with A0's Proj(A) and K₀(A) (its K1)". New: the equivalence of the category its K1 constructs with A0's Proj(A), which `TauCeti.SplitK0.mapEquiv` (pinned `TauCeti/CategoryTheory/GrothendieckGroup/Split.lean:342`, any `C ≌ D`) turns into the identification of its projection K₀ with A0's K₀(A); this is OperatorKTheory's comparison and nothing in A0 depends on it. The suggested follow-up in OperatorKTheory K1 is still needed there.

## H03 (rwst) — answered
The description is pull-request text, which this job may not edit. Facts for the new body at `4f51ae02`:
- A4 owns the covering-dimension predicate (`README.md:17`).
- A3 owns the relative group K₀(T) of an additive functor and its specialisation K₀(R,I) (`README.md:73`).
- `Suggested.lean` was last changed in `1247930` and is unchanged here.
- Weibel's K-book, Chapter I, Example 1.2.2 and (4.9.1), replaces the earlier Rieffel citation.

## H04 (rwst) — answered
The confirmations hold. One recomputation: with b=α⁻¹, `e₁₂(−b)e₂₁(α)=[[0,−b],[α,1]]`, then `·e₁₂(−b)=[[0,−b],[α,0]]`, then `·diag(1,−1)=[[0,b],[α,0]]`, which is the matrix used for the inverse in A3's exactness at K₁ᴮ(D).

## H05 (rwst) — answered
The Weibel locators are now checked against the author's Chapter I file (`Weibel-KBook`, fetched from the author's page). Example 1.2.2 (`Weibel-KBook` line 100) is the stably free, non-free kernel of the row (x,y,z) over ℝ[x,y,z]/(x²+y²+z²−1), with the hairy-ball argument. That matches A0's description at `README.md:31` and `:140`. (4.9.1) (`Weibel-KBook` line 1476) says the nontrivial real line bundle on S¹ is the Möbius bundle and every complex bundle on S¹ is trivial, which matches `README.md:43` and `:140`. roed-math's item 2 (R02) is about OperatorKTheory and needs no change here.

## Adversarial pass on the changed statement

| statement | instances tried | values | result | change |
|---|---|---|---|---|
| OperatorKTheory's category equivalent to A0's Proj(A); `SplitK0.mapEquiv` gives K₀(A) ≅ A0's K₀(A) | A=ℂ; A=0; right versus left convention | ℂ: both categories are finite-dimensional ℂ-spaces, both K₀ are ℤ with [ℂ]↦1. A=0: both categories have only zero objects, both K₀ are 0. A0's Proj(A) is `finiteProjectiveModules Aᵐᵒᵖ` (right modules), the same side as OperatorKTheory K1 | consistent | none |
| `mapEquiv` hypotheses | pinned signature | `mapEquiv (e : C ≌ D) : SplitK0 C ≃+ SplitK0 D`, with no additivity hypothesis beyond the equivalence | applies | none |
| direction of supply | depcheck | 0 problems; no AlgebraicKTheory statement uses OperatorKTheory | no cycle | none |

`Suggested.lean` is unchanged, so no declaration signature changed and the `#check` comparison was not rerun.

Ownership against open pull requests: checked only for OperatorKTheory (head `d1b2465`) and HilbertModules (head `c3a41ca`), the two cited in the review.

## Build and gate
- `lake build TauCetiRoadmap.AlgebraicKTheory.Suggested`: `Build completed successfully (8999 jobs).` The only warnings are `declaration uses sorry`.
- Gate: `gate AlgebraicKTheory: … dirty=0 outside-folder=0 source-material=0 OK`, with every counter 0.
- Depcheck: `depcheck: 207 roadmaps, 1460 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
