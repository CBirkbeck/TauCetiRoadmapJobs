module
import Mathlib
import TauCeti.ModelTheory.RelationalConfiguration.Isomorphism
import TauCeti.Combinatorics.SimpleGraph.RelationalConfiguration
import TauCeti.SetTheory.Descriptive.EZero
import TauCeti.ModelTheory.Scott.Height
import TauCeti.Topology.Algebra.Group.Perm

/-!
# Countable structure spaces, Part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, on Tau Ceti's coding space
`TauCeti.RelationalConfiguration L ℕ`, its isomorphism relation `isoSetoid L ℕ` and its Borel
reducibility `Setoid.BorelReducible`:

* the Friedman–Stanley theorem: countable graphs, linear orders and trees are Borel complete, the
  linear orders through one continuous reduction of all codes of `Language.graph` (Layers 2, 3);
* the Becker–Kechris universality theorem for `S∞` (Layer 4);
* four characterisations of Borel completeness (Layer 5);
* the back-and-forth equivalence of ordinal multiples, and the consequences of Borel completeness:
  the isomorphism relation is not Borel, lies above `E₀` and has continuum many classes, the class
  has unbounded Scott height, and the Friedman–Stanley obstruction (Layer 6).

The only definitions are those the statements need: isomorphism restricted to a class, Borel
completeness, the three classes of graphs, linear orders and trees, the σ-algebra of `S∞` (which
neither pin provides; it is the Borel σ-algebra of Tau Ceti's topology on `Equiv.Perm ℕ`) and the
universal language. Every headline theorem of the roadmap is statable at the pins and is stated
below.
-/

namespace TauCetiRoadmap.CountableStructureSpacesPartII

open FirstOrder FirstOrder.Language MeasureTheory TauCeti TauCeti.RelationalConfiguration
open scoped Ordinal Cardinal

universe u v w

/-! ## Layer 0: Isomorphism relations of classes and two reducibilities -/

/-- Isomorphism restricted to a class: for a relational language `L`, any carrier `α` and a set
`K` of codes on `α`, the pullback of Tau Ceti's `isoSetoid L α` along the inclusion of `K`; the
subtype `K` carries the subtype σ-algebra (Paolini–Shelah, Definition 1.6). -/
def classIso {L : FirstOrder.Language.{u, v}} [L.IsRelational] {α : Type w}
    (K : Set (RelationalConfiguration L α)) : Setoid K :=
  Setoid.comap Subtype.val (isoSetoid L α)

/-! ## Layer 1: Borel completeness -/

/-- A class `K` of codes on `ℕ` is **Borel complete** when, for every relational language `L'` in
`FirstOrder.Language.{0, 0}` with countably many relation symbols of each arity and every
isomorphism invariant Borel class `K'` of codes of `L'` on `ℕ`, isomorphism on `K'` is Borel
reducible to isomorphism on `K` (Paolini–Shelah, Definition 1.6; Camerlo–Gao, §1). -/
def BorelComplete {L : FirstOrder.Language.{u, v}} [L.IsRelational]
    (K : Set (RelationalConfiguration L ℕ)) : Prop :=
  ∀ (L' : FirstOrder.Language.{0, 0}) [L'.IsRelational] [∀ n, Countable (L'.Relations n)]
    (K' : Set (RelationalConfiguration L' ℕ)), MeasurableSet K' → IsomorphismInvariant K' →
      Setoid.BorelReducible (classIso K') (classIso K)

/-! ## Layer 2: Every countable structure codes into a graph -/

/-- The codes of simple graphs on `ℕ`: codes of `Language.graph` whose adjacency is symmetric and
false on the diagonal (Tau Ceti's `IsSimpleGraph`). -/
def graphClass : Set (RelationalConfiguration Language.graph ℕ) :=
  {c | IsSimpleGraph c}

/-- **Countable graphs are Borel complete** (Friedman–Stanley, Theorem 1), through the tagged
incidence graph of a structure, one continuous reduction for each source language. -/
theorem borelComplete_graphClass : BorelComplete graphClass := by
  sorry

/-! ## Layer 3: Trees and linear orders -/

/-- The codes of linear orders on `ℕ`: codes of `Language.order` whose decoded structure, the
symbol read as `≤`, is a model of Mathlib's theory of linear orders. -/
def linearOrderClass : Set (RelationalConfiguration Language.order ℕ) :=
  {c | letI := c.toStructure; ℕ ⊨ Language.order.linearOrderTheory}

/-- The codes of trees on `ℕ`: codes of `Language.order` whose decoded relation is a partial order
with a least element in which every principal down-set `{y | y ≤ x}` is finite and linearly
ordered. -/
def treeClass : Set (RelationalConfiguration Language.order ℕ) :=
  {c | letI := c.toStructure
    ℕ ⊨ Language.order.partialOrderTheory ∧
      (∃ r : ℕ, ∀ x : ℕ, Structure.RelMap (leSymb : Language.order.Relations 2) ![r, x]) ∧
      ∀ x : ℕ, {y : ℕ | Structure.RelMap (leSymb : Language.order.Relations 2) ![y, x]}.Finite ∧
        IsChain (fun y z : ℕ => Structure.RelMap (leSymb : Language.order.Relations 2) ![y, z])
          {y : ℕ | Structure.RelMap (leSymb : Language.order.Relations 2) ![y, x]}}

/-- **A continuous reduction of graphs to linear orders** (Friedman–Stanley, §2): one continuous
map from all codes of `Language.graph`, simple graphs or not, to codes of linear orders, under
which two codes are isomorphic exactly when their images are. It orders the blocks
`ω + (χ_c(x) + 2)` along the finite sequences of rationals, where `χ_c(x)` is the colour of the
unravelled graph. -/
theorem exists_continuous_reduction_linearOrderClass :
    ∃ f : RelationalConfiguration Language.graph ℕ → RelationalConfiguration Language.order ℕ,
      Continuous f ∧ (∀ c, f c ∈ linearOrderClass) ∧
        ∀ c d, isoSetoid Language.graph ℕ c d ↔ isoSetoid Language.order ℕ (f c) (f d) := by
  sorry

/-- **Countable linear orders are Borel complete** (Friedman–Stanley, §2). -/
theorem borelComplete_linearOrderClass : BorelComplete linearOrderClass := by
  sorry

/-- **Countable trees are Borel complete** (Friedman–Stanley, §2), through the tagged unravelling
tree of a graph. -/
theorem borelComplete_treeClass : BorelComplete treeClass := by
  sorry

/-! ## Layer 4: Borel S∞-spaces and the universal embedding -/

/-- The σ-algebra of `S∞`: the Borel σ-algebra of Tau Ceti's topology
`Equiv.Perm.instTopologicalSpace` (pointwise convergence of a permutation and its inverse) on
`Equiv.Perm ℕ`. Neither pin puts a σ-algebra on `Equiv.Perm ℕ`. -/
instance instMeasurableSpacePerm : MeasurableSpace (Equiv.Perm ℕ) :=
  borel (Equiv.Perm ℕ)

/-- The universal language: relational, with exactly one relation symbol of each arity
(Becker–Kechris 1993, §2). -/
def universalLanguage : FirstOrder.Language.{0, 0} where
  Functions _ := Empty
  Relations _ := Unit

/-- **The Becker–Kechris universality theorem for `S∞`** (Becker–Kechris 1993, Theorem 2.1 and
Corollary 2.2): every Borel `S∞`-space, a standard Borel space with a jointly measurable action of
`Equiv.Perm ℕ`, embeds equivariantly and Borel-isomorphically onto its image into the logic action
on the codes of the universal language. -/
theorem exists_equivariant_measurableEmbedding_universal
    (X : Type u) [MeasurableSpace X] [StandardBorelSpace X] [MulAction (Equiv.Perm ℕ) X]
    [MeasurableSMul₂ (Equiv.Perm ℕ) X] :
    ∃ Φ : X → RelationalConfiguration universalLanguage ℕ,
      MeasurableEmbedding Φ ∧ ∀ (g : Equiv.Perm ℕ) (x : X), Φ (g • x) = g • Φ x := by
  sorry

/-! ## Layer 5: Characterisations of Borel completeness -/

/-- **Borel completeness is receiving the graphs** (Camerlo–Gao, §1; Gao, §13.1). -/
theorem borelComplete_iff_graphClass {L : FirstOrder.Language.{u, v}} [L.IsRelational]
    (K : Set (RelationalConfiguration L ℕ)) :
    BorelComplete K ↔ Setoid.BorelReducible (classIso graphClass) (classIso K) := by
  sorry

/-- **Borel completeness is receiving every whole space of structures** (Camerlo–Gao, §1). -/
theorem borelComplete_iff_forall_structureSpace {L : FirstOrder.Language.{u, v}} [L.IsRelational]
    (K : Set (RelationalConfiguration L ℕ)) :
    BorelComplete K ↔ ∀ (L' : FirstOrder.Language.{0, 0}) [L'.IsRelational]
      [∀ n, Countable (L'.Relations n)], Setoid.BorelReducible (isoSetoid L' ℕ) (classIso K) := by
  sorry

/-- **Borel completeness is receiving every Borel class, invariant or not** (Camerlo–Gao, §1). -/
theorem borelComplete_iff_forall_measurableSet {L : FirstOrder.Language.{u, v}} [L.IsRelational]
    (K : Set (RelationalConfiguration L ℕ)) :
    BorelComplete K ↔ ∀ (L' : FirstOrder.Language.{0, 0}) [L'.IsRelational]
      [∀ n, Countable (L'.Relations n)] (B : Set (RelationalConfiguration L' ℕ)),
        MeasurableSet B → Setoid.BorelReducible (classIso B) (classIso K) := by
  sorry

/-- **Borel completeness is receiving the orbit relation of every Borel `S∞`-space** in a fixed
universe (Becker–Kechris 1996, §2.7; Camerlo–Gao, §1). -/
theorem borelComplete_iff_forall_permSpace {L : FirstOrder.Language.{u, v}} [L.IsRelational]
    (K : Set (RelationalConfiguration L ℕ)) :
    BorelComplete K ↔ ∀ (X : Type w) [MeasurableSpace X] [StandardBorelSpace X]
      [MulAction (Equiv.Perm ℕ) X] [MeasurableSMul₂ (Equiv.Perm ℕ) X],
        Setoid.BorelReducible (MulAction.orbitRel (Equiv.Perm ℕ) X) (classIso K) := by
  sorry

/-! ## Layer 6: Consequences of Borel completeness -/

/-- **Ordinal multiples are back-and-forth equivalent** (Montalbán, Part 2, Lemma II.38 and
Corollary II.39, in the one-step convention of `TauCeti.BFEquiv`): for nonzero `δ` and `ε` the
well-orders of types `ω ^ γ * δ` and `ω ^ γ * ε`, as structures of `Language.order`, have
back-and-forth equivalent empty tuples at level `γ`. -/
theorem bfEquiv_omega0_opow_mul (γ δ ε : Ordinal.{w}) (hδ : δ ≠ 0) (hε : ε ≠ 0) :
    @BFEquiv Language.order _ (ω ^ γ * δ).ToType (ω ^ γ * ε).ToType
      (Language.orderStructure (ω ^ γ * δ).ToType) (Language.orderStructure (ω ^ γ * ε).ToType)
      γ 0 Fin.elim0 Fin.elim0 := by
  sorry

/-- **A Borel complete isomorphism relation is not Borel** (Paolini–Shelah, Fact 1.7; Gao,
§13.1): the set of pairs in `K × K` with isomorphic entries is not measurable for the product of
the subtype σ-algebras. -/
theorem not_measurableSet_classIso_of_borelComplete {L : FirstOrder.Language.{u, v}}
    [L.IsRelational] {K : Set (RelationalConfiguration L ℕ)}
    (hK : BorelComplete K) :
    ¬ MeasurableSet {p : K × K | classIso K p.1 p.2} := by
  sorry

/-- **A Borel complete class has unbounded Scott height**: for every countable ordinal `β` some code
of the class has Scott height greater than `β`. -/
theorem exists_lt_scottHeight_of_borelComplete {L : FirstOrder.Language.{u, v}} [L.IsRelational]
    [∀ n, Countable (L.Relations n)] {K : Set (RelationalConfiguration L ℕ)}
    (hK : BorelComplete K) {β : Ordinal.{0}} (hβ : β < ω₁) :
    ∃ c ∈ K, β < @scottHeight L _ ℕ c.toStructure := by
  sorry

/-- **`E₀` reduces to every Borel complete isomorphism relation** (Camerlo–Gao, §1, for `E₀`). -/
theorem borelReducible_eZero_of_borelComplete {L : FirstOrder.Language.{u, v}} [L.IsRelational]
    {K : Set (RelationalConfiguration L ℕ)}
    (hK : BorelComplete K) :
    Setoid.BorelReducible eZero (classIso K) := by
  sorry

/-- **A Borel complete class has continuum many isomorphism types.** -/
theorem mk_quotient_classIso_of_borelComplete {L : FirstOrder.Language.{u, v}} [L.IsRelational]
    [∀ n, Countable (L.Relations n)] {K : Set (RelationalConfiguration L ℕ)}
    (hK : BorelComplete K) :
    Cardinal.mk (Quotient (classIso K)) = 𝔠 := by
  sorry

/-- **The Friedman–Stanley obstruction** (Friedman–Stanley, §4; Hjorth–Kechris, §4–§5): a class
`K` of codes, not assumed Borel, with a rank `ρ` into the ordinals such that isomorphism has
measurable graph on each stratum `K ∩ {c | ρ c ≤ α}`, `α < ω₁` (for the product of the subtype
σ-algebras), and `ρ` is bounded below `ω₁` on every analytic subset of `K`, is not Borel complete.
For an analytic `K` the second hypothesis bounds `ρ` on `K` and the statement is the contrapositive
of `not_measurableSet_classIso_of_borelComplete`; its content is for classes that are not analytic,
such as the coanalytic class of coded well-orders stratified by order type. -/
theorem not_borelComplete_of_rank_bounded {L : FirstOrder.Language.{u, v}} [L.IsRelational]
    [∀ n, Countable (L.Relations n)] {K : Set (RelationalConfiguration L ℕ)}
    (ρ : RelationalConfiguration L ℕ → Ordinal.{0})
    (hiso : ∀ α < ω₁, MeasurableSet
      {p : ↥(K ∩ {c | ρ c ≤ α}) × ↥(K ∩ {c | ρ c ≤ α}) | classIso (K ∩ {c | ρ c ≤ α}) p.1 p.2})
    (hbdd : ∀ A ⊆ K, AnalyticSet A → ∃ α < ω₁, ∀ c ∈ A, ρ c ≤ α) :
    ¬ BorelComplete K := by
  sorry

end TauCetiRoadmap.CountableStructureSpacesPartII
