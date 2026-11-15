# GATE-ArakelovGeometryAndAbelianHeightsPartII~1: answers to human review

One unanswered comment. It makes one point (H01).

## H01 (mycaule) — applied

`TauCetiRoadmap/ArakelovGeometryAndAbelianHeightsPartII/README.md` lines 2138–2143 add a secondary section, "Existing formalizations outside Tau Ceti", placed before References. It cites AxiomMath/Mordell (Apache-2.0) at commit `82a30cb`, and states which targets its `NeronTate` (23 files) and `AbelianVariety` (19 files) directories meet and how far: the `NeronTate` results are the d = 0 (number-field) case of §6.3, and `Faltings.multiplication_pullback` is the ℚ ⊗ Pic form of the [2]^*M ≅ M⁴/M² relation behind §5.1(3) and §7.1. No target is removed, for two reasons. First, the repository is built on AxiomMath/Stacks with Lean v4.35.0 and its own `IsAbelianVariety`/`Stacks.Picard` carriers, not on the pinned Mathlib and Tau Ceti, so it cannot be a supplier. Second, everything in it sits at d = 0, over a field algebraic over ℚ, or in ℚ ⊗ Pic, whereas the targets here concern positive transcendence degree, Moriwaki polarizations, integral line-bundle isomorphisms and metrized identities.

### Evidence (read at the commit the comment links)

- `Mordell/NeronTate/Basic.lean`: `Faltings.IsNeronTateHeight` takes k algebraic over ℚ, an abelian variety `A : Over (Spec k)` with `[GrpObj A] [IsAbelianVariety k A]`, and c in `ℚ ⊗[ℤ] Stacks.Picard.ofScheme A.left`. A function f qualifies if it is within bounded distance of a height of c and equals b(x,x)/2 + ℓ(x).
- `Mordell/NeronTate/Existence.lean`: `exists_isNeronTateHeight_of_isAlgebraic` (any K algebraic over ℚ) and `Faltings.exists_isNeronTateHeight` (number field k, points over an algebraic closure).
- `Mordell/NeronTate/Functoriality.lean`: `Faltings.IsNeronTateHeight.comp`.
- `Mordell/NeronTate/Northcott.lean`: `Faltings.IsEvenClass.finite_setOf_neronTateHeight_le_of_numberField` (A over a number field k, points in A(K) for a number field K).
- `Mordell/NeronTate/PositiveDefinite.lean`: `Faltings.neronTateBilinear_posDef`. Its hypotheses are K algebraic over ℚ, an ample even c, and a finitely generated Γ with an injective map Γ → A(K). It concludes that the form extends to a positive-definite symmetric form on ℝ ⊗ Γ.
- `Mordell/NeronTate/MumfordFormula/Delta.lean`: `Faltings.IsHeightOfClass.exists_abs_add_neronPairing_le`, which says |h(z,w) + ⟨jz, jw⟩| ≤ B over a number field. It is a bounded-error statement, not an identity of classes.
- `Mordell/AbelianVariety/ParallelogramRelation.lean`: `Faltings.multiplication_pullback`, over any field, in `ℚ ⊗ Pic(A)`.
- `Mordell/AbelianVariety/TheoremOfTheSquare.lean`: its cube identity is for f, g, h : B ⟶ A with A a single abelian variety.
- `Mordell/AbelianVariety/GoodReduction.lean`: number fields only.
- `Mordell/Height/Machine/Northcott.lean`: `Faltings.ProjectiveEmbedding.finite_setOf_pointDegree_le_height_le`, for smooth projective X over a field algebraic over ℚ with an embedding defined over a number field.
- Toolchain and dependencies: `lean-toolchain` is `v4.35.0`; `lake-manifest.json` pins AxiomMath/Stacks `c496df0` and Mathlib `56a0058`. The pins here are Lean `v4.36.0-rc2` and Mathlib `1b1ccf4`.
- Neither pinned library has a Néron–Tate height or `IsAbelianVariety`: grepping the pinned Mathlib and Tau Ceti finds no match. Tau Ceti's carrier is the structure `TauCeti.AlgebraicGeometry.AbelianVariety` (`TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95`).
- Precedent for the section's form: main's `TauCetiRoadmap/CFSGBasicProperties/README.md` has "## Existing formalizations and model comparisons" citing AxiomMath/CFSG.

### Pattern

- No roadmap on main or in any open pull request cites AxiomMath/Mordell (`roadmaps grep` finds no match).
- The repository's `Height` directory, which the comment does not name, also meets this roadmap (§6.2 at d = 0 for smooth X). The new section's intro paragraph cites it in one sentence.
- The d = 0 Néron–Tate overlap mainly concerns the supplier: HeightsRationalPointsAndObstructions §§0.18–0.21 (open pull request, earlier in the merge order) plans the number-field Néron–Tate height, kernel and bilinear form, and does not cite this repository either. That roadmap is outside this job's edit scope.

### Adversarial pass on the added sentences

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| [n]^*c = ((n²+n)/2)c + ((n²−n)/2)[−1]^*c gives [2]^* = 4 on even, 2 on odd | n = 2, 1, 0, −1; even and odd c | n=2: coefficients 3 and 1, so 3c + c = 4c (even) and 3c − c = 2c (odd). n=1: 1 and 0, so c. n=0: 0 and 0, so 0 (consistent with [0] factoring through Spec k and Pic(Spec k) = 0). n=−1: 0 and 1, so [−1]^*c | holds | none |
| ℚ ⊗ Pic(A) does not give the integral isomorphism | E: y² = x³ − x over ℚ with T = (0,0) of order 2 | O(T) ⊗ O(e)⁻¹ ≠ 0 in Pic(E), since T ≠ e; its image 1 ⊗ (2-torsion class) = (1/2) ⊗ 2·class = 0 in ℚ ⊗ Pic(E) | holds: a nonzero torsion class is invisible after ⊗ℚ | none |
| Positive definiteness on ℝ ⊗ Γ gives "height zero ⇒ torsion" | P of infinite order; P of order n | Infinite order: Γ = ⟨P⟩ ≅ ℤ, ℝ ⊗ Γ = ℝ and 1 ⊗ P ≠ 0, so B_c(P,P) = ĥ(P) + ĥ(−P) = 2ĥ(P) > 0 (ℓ = 0 for even c, since ℓ(−x) = ℓ(x) = −ℓ(x)). Order n: ℝ ⊗ ℤ/n = 0 imposes nothing, and n²ĥ(P) = ĥ(nP) = ĥ(0) = 0 | holds in both directions | none |
| These are the case d = 0 of §6.3 | k₀ = ℚ, empty polarization tuple | §6.3 at d = 0 is [k₀:ℚ] times the absolute Néron–Tate height. Its kernel (torsion) and Northcott do not depend on that factor; the factor itself differs (2a versus a over a quadratic field), so the section requires comparing normalizations before use | holds, with the normalization caveat stated | "height normalization" added to the comparison clause |
| §6.2 at d = 0 versus `Height/Machine/Northcott` | X = ℙ¹ over ℚ, O(1) | §6.2 Check: h([1:n]) = log n, a bounded set of bounded degree is finite. Their theorem covers smooth X with an embedding defined over a number field | holds for smooth X only | wording narrowed to "for smooth X" |
| Their cube is not the cube-for-products of §10.9a | A × B × C, three curves of genus 0 | `schemePullbackClass_cube` takes f, g, h : B ⟶ A into one abelian variety, while §10.9a needs Pic(A × B × C) for three curves. For curves of genus 0 there is no abelian-variety target at all; their identity has nothing to say about O(d₁,d₂,d₃) | holds | none |
| Mumford formula versus §9.2(2) | — | Theirs: h_{Δ−P×C−C×P}(z,w) = −⟨jz,jw⟩ + O(1) over a number field. §9.2(2): j^*Θ̄ = 2D + p₁^*w + p₂^*w exactly in P̂ic(·/k)_ℚ; at g = 2 the coefficient of D is 2 and the difference pairing is 8w + π^*P (§9.2 Check) | different statements, as the section says | none |

The added text introduces no target, Check, API bullet or Lean name of this roadmap. All backticked names in it are AxiomMath, Tau Ceti or Lean-version names, and `roadmaps resolve` finds no unresolved citation or Lean name.

## Suggested.lean

Not changed. It declares no theorem or definition; its docstring says why no headline is statable at the pins. With no declarations, the `#check @name` scratch comparison has nothing to elaborate, and nothing changed.

## Ownership

The repair adds no construction, carrier or theorem, so it creates no ownership question. The overlap it records is with a repository outside Tau Ceti that cannot be a supplier. The number-field part of that overlap belongs to the supplier HeightsRationalPointsAndObstructions §§0.18–0.20, which this roadmap already imports. No dependency was added and none was moved.

## Build

`lake build TauCetiRoadmap.ArakelovGeometryAndAbelianHeightsPartII.Suggested`: `Build completed successfully (18239 jobs).`

## Gate

`gate ArakelovGeometryAndAbelianHeightsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

## Dependency check

`depcheck: 239 roadmaps, 2255 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.

## Commit

`e2a71792 ArakelovGeometryAndAbelianHeightsPartII: review repairs (cite AxiomMath/Mordell Néron–Tate and abelian-variety overlap)`. Not pushed.

## Sources

No new source text was needed: the cited repository is a code citation, not a manifest source, so `sources.toml` is unchanged and nothing was added to `needs-references.toml`. No suspicious instruction appeared in the review text.
