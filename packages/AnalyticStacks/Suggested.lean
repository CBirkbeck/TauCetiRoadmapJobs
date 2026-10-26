import Mathlib

/-!
# Analytic stacks and their six-functor formalisms: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs, where their carriers exist.

Stated below: the restricted-diagonal theorem of Liu and Zheng (README 0.3(1); LZ12b
Theorem 4.27, SixFF Theorem 4.8), on Mathlib's simplicial sets, quasicategories, internal Homs
and homotopy categories. The few definitions it needs (the bisimplices, the subobjects `Cpt_n`,
the restricted diagonal and the restriction map) have real bodies on these carriers.

The other headline theorems are not statable at these pins, for the following missing carriers.

* README 0.3(2), the gluing theorem for restricted multisimplicial nerves (LZ12b Theorem 5.4):
  it needs pullback squares in a quasicategory, to define the nerves `C^cart_{E_1, ..., E_k}`;
  Mathlib's quasicategories carry no limits.
* README 0.5, the construction principle (HM Proposition 3.3.3, Man22 Proposition A.5.10), and
  README 0.6, the extension of a sheafy formalism to sheaves (HM Theorem 3.4.11): they need the
  ∞-category `Cat∞`, its commutative algebras, ∞-operads, the symmetric monoidal ∞-category of
  correspondences `Corr(C, E)` and ∞-topoi of sheaves of anima.
* README 0.12 and 0.13, the Künneth criteria for !-descent and the ∞-topos of D-stacks
  (RCSolid Proposition 6.3.7, Corollary 6.3.15): they need presentable ∞-categories with
  Lurie's tensor product and left exact localizations of ∞-topoi.
* README 3.3, the quasi-coherent six-functor formalism on the ∞-topos `AnStk(C₀)` of analytic
  stacks (RCSolid Corollaries 6.3.4 and 6.3.19): it needs light condensed animated rings,
  analytic rings as full subcategories of stable module ∞-categories, the !-able class and
  the localization at !-equivalences.
* README 3.8, the realization of algebraic stacks as analytic stacks (ALRS Remark 2.9.1): it
  needs the ∞-topos of algebraic stacks in the !-topology and its quasi-coherent ∞-categories.
* README 4.2, the duality for classifying stacks of locally profinite groups (HM Proposition
  5.1.12 and Examples 5.3.21–5.3.22): it needs the ∞-topos of light condensed anima, its
  six-functor formalism `D(-, Λ)`, suave objects and the derived ∞-category of smooth
  representations.
* README 6.6, solid Serre duality `f^! 1 ≅ det(L_f)[n]` (RCSolid Theorem 7.7.21): it needs
  solid Huber rings, the cotangent complex of analytic rings, the exceptional inverse image
  on their module ∞-categories and determinants of perfect modules over them.
* README 7.6, stacky Cartier duality for vector bundles and their gerbes (RC26a Theorem 3.2.37,
  Proposition 3.3.3): it needs kernel categories of Künneth formalisms, bialgebras in linear
  presentable ∞-categories, ring stacks and transmutation.

Mathlib's 1-categorical shadows of these objects, such as the span bicategory
`CategoryTheory.Span.SpanBicat` and the morphism properties stable under base change, do not
carry the coherences these statements are about, and no weaker substitute is stated here.
-/

namespace TauCetiRoadmap.AnalyticStacks

open CategoryTheory

universe u

/-! ## Layer 0: Abstract six-functor formalisms -/

/-- The cosimplicial bisimplicial set `[n] ↦ Δ^{n,n}`. The `(p, q)`-bisimplices of `Δ^{n,n}`
are the pairs of monotone maps `([p] → [n], [q] → [n])`, so that `Δ^{n,n}` represents the
`(n, n)`-bisimplices; a monotone map `[m] → [n]` acts by postcomposition in both coordinates
(LZ12b Notation 4.1). -/
def bisimplex : SimplexCategory ⥤ (SimplexCategoryᵒᵖ × SimplexCategoryᵒᵖ ⥤ Type u) where
  obj n :=
    { obj := fun pq => ULift.{u} ((pq.1.unop ⟶ n) × (pq.2.unop ⟶ n))
      map := fun f => TypeCat.ofHom fun x => ⟨(f.1.unop ≫ x.down.1, f.2.unop ≫ x.down.2)⟩ }
  map θ := { app := fun _ => TypeCat.ofHom fun x => ⟨(x.down.1 ≫ θ, x.down.2 ≫ θ)⟩ }

/-- The cosimplicial bisimplicial set `[n] ↦ Cpt_n`, where `Cpt_n ⊆ Δ^{n,n}` is the
sub-bisimplicial set spanned by the vertices `(i, j)` with `0 ≤ i ≤ j ≤ n`: a pair `(α, β)` lies
in it when `α a ≤ β b` for all vertices `a` of `[p]` and `b` of `[q]`. For `n = 1` it omits
exactly the vertex `(1, 0)` (LZ12b Notation 4.1). -/
def compactificationBisimplex :
    SimplexCategory ⥤ (SimplexCategoryᵒᵖ × SimplexCategoryᵒᵖ ⥤ Type u) where
  obj n :=
    { obj := fun pq => {x : ULift.{u} ((pq.1.unop ⟶ n) × (pq.2.unop ⟶ n)) //
        ∀ a b, x.down.1.toOrderHom a ≤ x.down.2.toOrderHom b}
      map := fun f => TypeCat.ofHom fun x =>
        ⟨⟨(f.1.unop ≫ x.1.down.1, f.2.unop ≫ x.1.down.2)⟩, fun _ _ => x.2 _ _⟩ }
  map θ := { app := fun _ => TypeCat.ofHom fun x =>
    ⟨⟨(x.1.down.1 ≫ θ, x.1.down.2 ≫ θ)⟩, fun a b => θ.toOrderHom.monotone (x.2 a b)⟩ }

/-- The restricted diagonal `δ*₂∇ X` of a bisimplicial set `X`: its `n`-simplices are the maps
of bisimplicial sets `Cpt_n → X` (LZ12b Definition 4.26). -/
def restrictedDiagonal (X : SimplexCategoryᵒᵖ × SimplexCategoryᵒᵖ ⥤ Type u) : SSet.{u} :=
  compactificationBisimplex.{u}.op ⋙ yoneda.obj X

/-- Restriction along the inclusions `Cpt_n ⊆ Δ^{n,n}`, from the simplicial set
`n ↦ Hom(Δ^{n,n}, X)`, which is the diagonal `δ*₂ X` by the Yoneda lemma, to the restricted
diagonal `δ*₂∇ X`. It forgets the bisimplices that leave `Cpt_n` (LZ12b, before Theorem 4.27). -/
def restrictedDiagonalMap (X : SimplexCategoryᵒᵖ × SimplexCategoryᵒᵖ ⥤ Type u) :
    bisimplex.{u}.op ⋙ yoneda.obj X ⟶ restrictedDiagonal X :=
  Functor.whiskerRight
    (NatTrans.op (F := compactificationBisimplex.{u}) (G := bisimplex.{u})
      { app := fun _ => { app := fun _ => TypeCat.ofHom fun x => x.1 } })
    (yoneda.obj X)

/-- **The restricted-diagonal theorem of Liu and Zheng.** For every bisimplicial set `X`, the
restriction `δ*₂ X → δ*₂∇ X` is a categorical equivalence: for every quasicategory `Q`,
precomposition with it induces an equivalence between the homotopy categories of the
functor simplicial sets `Fun(δ*₂∇ X, Q)` and `Fun(δ*₂ X, Q)`. Quantified over all quasicategories,
including the functor quasicategories `Fun(K, Q)`, this is equivalent to restriction being an
equivalence of quasicategories `Fun(δ*₂∇ X, Q) → Fun(δ*₂ X, Q)` (LZ12b Theorem 4.27;
SixFF Theorem 4.8). -/
theorem restrictedDiagonalMap_isEquivalence_hoFunctor
    (X : SimplexCategoryᵒᵖ × SimplexCategoryᵒᵖ ⥤ Type u) (Q : SSet.{u}) [Q.Quasicategory] :
    (SSet.hoFunctor.map
      ((MonoidalClosed.pre (restrictedDiagonalMap X)).app Q)).toFunctor.IsEquivalence := by
  sorry

end TauCetiRoadmap.AnalyticStacks
