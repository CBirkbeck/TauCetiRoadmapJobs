# GATE-QuaternionArithmetic~1: answers to human review

One unanswered comment, one point (H01). Commit `0b75fee5` on the pull-request branch (not pushed).

## H01 (mycaule) — applied differently

The overlap with LeanPool's CompositionAlgebrasOverRings is real, but it lies in the field-level theory of quaternion algebras. This roadmap does not own that theory: it consumes it from Tau Ceti at the pin. The repair is therefore not a LeanPool citation, which cannot be a supplier and shares no target with the roadmap. The repair is to the one field-level item that README §0.6 claimed as "proved here" although the pin already has half of it. In `TauCetiRoadmap/QuaternionArithmetic/README.md` lines 613–617, "embeds … iff it splits it ([V, 5.4.7], p. 73), proved here" becomes: for `E` of characteristic not 2, the embedded-splits direction is Tau Ceti's `TauCeti.Algebra.isSplittingField_of_finrank_eq_deg`, and only the converse (a splitting `L` embeds) is proved here. That declaration is added to the §0.6 *Needs* line (632) and to the Tau Ceti supplier contract (231–233).

### Evidence for the scope of the overlap

- **Different carrier.** LeanPool works with its own `ConicAlgebra k A` (the norm is data) and the Cayley–Dickson doubles `Cay₄ k μ₁ μ₂`. Its only link to Mathlib's quaternions is `ConicAlgebra.realQuaternionAlgEquiv : Cay₄ ℝ (-1) (-1) ≃ₐ[ℝ] ℍ[ℝ]` (`Composition/ComplexQuaternion.lean`). `Conic/Recognition.lean` never mentions `QuaternionAlgebra`. The project's own overview (trap 3) says that `QuaternionAlgebra` and its rank-four composition algebras are not comparable in general. This roadmap's carrier is `ℍ[F,a,b] = QuaternionAlgebra F a 0 b`.
- **Field-level results it shares are already supplied at the pin, on `ℍ[F,a,b]`.** Each LeanPool theorem below has a counterpart at Tau Ceti `2fd255d` (or Mathlib `1b1ccf4`), which Layer 0 already consumes:

  | LeanPool `ConicAlgebra.IsComposition.*` | At the pin |
  | --- | --- |
  | `isSplitOfRank_iff_not_anisotropic`, `isDivision_iff_anisotropic` | `QuaternionAlgebra.anisotropic_normForm_iff` (`Algebra/Quaternion/NormForm.lean:158`); `forall_isUnit_or_nonempty_algEquiv_matrix` (`Algebra/Quaternion/SplittingCriterion.lean:223`) |
  | `norm_mul` | `QuaternionAlgebra.normForm_mul` (`NormForm.lean:130`) |
  | `isomorphic_splitQuaternion_of_finite` | `TauCeti.Algebra.isSplittingField_self_of_finite` (`Algebra/CentralSimple/Splitting.lean:240`); Mathlib `littleWedderburn` |

- **The field-level lemma §0.6 keeps as its own is not in LeanPool.** That lemma is the converse of [V, 5.4.7] (`voight` line 3517): a quadratic field that splits `B` embeds in `B`. LeanPool's `Composition/QuadraticSubalgebra.lean` (GPR 19.8, the subalgebra `k[u]`) and `Composition/RankTwoSubalgebra.lean` (existence of a regular rank-two subalgebra) produce a quadratic subalgebra from a chosen element. Neither says that a splitting quadratic extension embeds.
- **At the ring level the overlap reduces to `discrd O = R`.** Every order is a conic `R`-algebra: `x² − trd(x)x + nrd(x) = 0` with `trd, nrd ∈ R`. But LeanPool's `IsComposition` (GPR 19.5, `Composition/Defs.lean`) also needs a nonsingular norm, and on an order `O` this holds exactly when `discrd O = R`:
  - On an `R`-basis the polar form of `nrd` has Gram matrix `(trd(α_i ᾱ_j))`. Its determinant is `−det(trd(α_i α_j))`, which generates the ideal `disc O = (discrd O)²`. For `M₂(ℤ)` the trace determinant is `−1`, so the Gram determinant is `1`.
  - In residue characteristic 2, a degenerate rank-4 polar form has a radical vector with `nrd` zero over `k̄`.
  - These are the Azumaya orders of `voight` lines 10972–10975. Over `ℤ` the only one is `M₂(ℤ)`; the Hurwitz order (`discrd = 2`) and every Eichler order of level `> 1` are excluded.
  - LeanPool's ring-level classification also assumes an LG ring, and by its own overview `ℤ` is not one.
- So nothing that §§1–10 own (orders with nontrivial discriminant, ideal classes, mass, embeddings, Brandt matrices, Shimura curves) is in LeanPool. The README's rule to cite existing work concerns a roadmap that independently develops the same mathematics, and that does not apply here. Main's Isoperimetry and GeometricMeasureTheory cite LeanPool only where they plan the same results.
- **Ownership of the half §0.6 keeps.** Main's `RepresentationTheory/SemisimpleAlgebras` Layer 6 owns "a maximal subfield of degree `deg D` splits `D`", which is the direction now cited at the pin; Tau Ceti's `Subfield.lean` docstring names that layer. `roadmaps grep` over main and the 461 open heads finds no other owner of the converse.
- **Also checked, no edit.** The §2.6 statement "`(O|𝔭) = ∗` and `k` finite iff `O ≅ M₂(R)`" needs the finite-field splitting from the table above. Its *Needs* line does not list it, but the roadmap does not claim to prove it. This is noted here and not repaired, to keep the scope unchanged.

### Adversarial pass on the changed statement

| Statement | Instance | Embeds? | `L ⊗ B` split? | Result |
| --- | --- | --- | --- | --- |
| [V, 5.4.7], char `E ≠ 2` | `E = ℚ`, `B = ℍ[ℚ,−1,−1]`, `L = ℚ(i)` | yes, `i ↦ i` | yes: `ℍ[L,i²,−1]` has a square parameter | agree |
| same | `L = ℚ(√2)`, same `B` | no: `μ² = 2` for pure `μ` needs `nrd μ = −2`, but `nrd` is positive definite | no: `B ⊗ ℝ = ℍ` at both real places of `L` | agree |
| same | `B = M₂(ℚ)`, any quadratic `L` | yes, companion matrix | yes, `M₂(L)` | agree |
| same | `E = ℝ`, `B = ℍ[ℝ]`, `L = ℂ` | yes | yes, `ℂ ⊗ ℍ ≅ M₂(ℂ)` (Tau Ceti `Algebra/CentralSimple/Quaternion.lean`) | agree |
| same | `E = 𝔽₃`, `B = M₂(𝔽₃)`, `L = 𝔽₉` | yes | yes | agree |
| degree hypothesis of the Tau Ceti theorem | `B = ℍ[E,a,b]` | `deg = Nat.sqrt 4 = 2 = [L:E]` | | matches |
| degree hypothesis | `L = E`, degree 1 | | `1 ≠ deg`, so the theorem does not apply; `E` does not split a division `B` | consistent |
| characteristic | char `E = 2` | `ij = −ij = ji`, so `ℍ[E,a,0,b]` is commutative, not a quaternion algebra; Tau Ceti `instIsCentral` and `instIsSimpleRing` need `[Invertible (2 : K)]` | | hypothesis "char ≠ 2" added |
| instance context | `TauCeti.Algebra.isSplittingField_of_finrank_eq_deg` | needs `[Algebra.IsCentral K A] [IsSimpleRing A] [FiniteDimensional K A]` (`Subfield.lean:323, 339`), supplied for unit parameters and 2 invertible | | in scope |

The §0.6 Checks (`ℚ(i)`, `ℚ(√2)` and `ℚ(√−7)` in Hamilton; `ℚ(√−2)` and `ℚ(i)` in `ℍ[ℚ,−1,−3]`; `M₂(ℚ)`) agree with the edited bullet.

### Suggested.lean

`Suggested.lean` is unchanged: §0.6 has no Lean statement, and the new backticked name is a Tau Ceti declaration that exists at `2fd255d` (namespace `TauCeti.Algebra`, `Subfield.lean:339`). The elaborated signatures in `signatures.md` are therefore still current, and the `#check @name` comparison was not rerun.

## Build

`lake build TauCetiRoadmap.QuaternionArithmetic.Suggested`: `Build completed successfully (18920 jobs).` The only warnings are `declaration uses 'sorry'`.

## Gate

```
gate QuaternionArithmetic: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
  depcheck: NOT IN ORDER: QuaternionArithmetic (insert it after its last supplier)
```

Dependency check (`gate --depcheck … --movable --pr 1722`):

```
NOT IN ORDER: QuaternionArithmetic (insert it after its last supplier)
depcheck: 248 roadmaps, 2377 edges, 1 problem(s)
```

No UPWARD or CYCLE line. The only problem is that the roadmap is absent from the merge order, which the brief treats as no defect before intake places it after its last supplier. The edit adds no cross-roadmap dependency: the new supplier is Tau Ceti at the pin.

Ownership was checked against main and the 461 open heads with `roadmaps grep`. The review text contained no instructions.
