# Roadmap: cohomology of groups

**Summary.** This roadmap develops the homology and cohomology of an arbitrary group `G` with
coefficients in `k`-linear representations, `k` any commutative ring, on Mathlib's carriers
`groupHomology`, `groupCohomology` and `tateCohomology`. Starting from those carriers and the
operations Tau Ceti already provides (corestriction, transfer, inflation–restriction, the Tate cup
product, cyclic periodicity), it builds conjugation and the quotient action on the (co)homology of
a normal subgroup; hyperhomology and hypercohomology of complexes with their two spectral
sequences; complexes of permutation modules, groups acting on trees and the Mayer–Vietoris
sequences of amalgams and HNN extensions; cup and cap products for arbitrary equivariant
pairings; the Künneth and universal coefficient theorems and the Pontryagin ring of an abelian
group; the Hochschild–Serre spectral sequence of a group extension with its edge maps,
transgression, products and low-degree sequences, and Hopf's formula; the double coset formula
for a subgroup of finite index; and, for finite groups, stable elements, Tate duality, the
periodicity theorem, periods (cyclic, generalised quaternion, Swan's `p`-period) and the
periodicity forced by an exact sequence of cohomologically trivial modules from `ℤ_χ` to `ℤ`.
The end theorems are the Hochschild–Serre spectral sequence (6.2–6.7), the tree sequence (3.5),
the Künneth theorem (5.1), the double coset formula (7.1), the stable element theorem (7.2), Tate
duality (8.1) and the periodicity theorem (8.5).

## Scope and ownership

This roadmap owns the general theory of the (co)homology of discrete groups with coefficients in
representations over an arbitrary commutative ring, on the existing carriers. Finite groups enter
as instances wherever the statement holds for every group; only Layers 7.2 and 8 are theories of
finite groups.

**Carriers and operations consumed, not rebuilt.** Mathlib's `groupCohomology`, `groupHomology`
and `tateCohomology` on `Rep k G`, with their compatible-pair maps `groupCohomology.map` and
`groupHomology.map`, inflation, coinflation and homological corestriction
(`groupCohomology.infNatTrans`, `groupHomology.coinfNatTrans`, `groupHomology.coresNatTrans`),
Shapiro's lemma (`groupCohomology.coindIso`, `groupHomology.indIso`), the resolution comparisons
(`groupCohomologyIso`, `groupHomologyIso`, `groupCohomologyIsoExt`, `groupHomologyIsoTor`) and the
Tate comparisons (`TateCohomology.isoGroupCohomology`, `TateCohomology.isoGroupHomology`).
Tau Ceti's corestriction `TauCeti.groupCohomology.corestriction`, transfer
`TauCeti.groupHomology.transfer`, inflation–restriction `TauCeti.groupCohomology.HInfRes_exact`,
Sylow injectivity `TauCeti.groupCohomology.eq_zero_of_pow_nsmul_eq_zero_of_map_sylow_eq_zero`, the
Tate cup product `TauCeti.TateCohomology.cup` with `cup_assoc`, `cup_gradedComm`,
`cup_projection` and `cup_res`, cyclic periodicity `Rep.FiniteCyclicGroup.periodicIso`, the
continuous cup product `TauCeti.TopPairing.cup` and the continuous Mackey formula
`TauCeti.ContinuousCohomology.corestriction_mackey` are used as they stand.

**Owned elsewhere and imported by section.**
- DerivedModuleAlgebra §S.1 owns the spectral sequence of a first-quadrant double complex in an
  abelian category: the identification of `E₂` with iterated cohomology, convergence, the edge
  morphisms, the five-term and extended sequences, the exact-rows comparison and naturality. Every
  double-complex spectral sequence here is an instance of it; no spectral-sequence machinery is
  built here. The homological edge morphisms and five-term sequence are recorded as what §S.1 must
  provide (Exact supplier contracts).
- ProfiniteCohomology owns continuous cohomology of profinite groups: its explicit low-degree model
  and comparisons (§§3.1–3.2), the profinite five-term sequence with transgression (§5.5), the
  continuous Mackey formula (§§6.4, 10.5), the finite-quotient colimit (§10.1) and the continuous
  cup products (Layers 8, 12). Here they enter only through the comparisons of 1.5, 4.7 and 6.9.
- ClassFieldTheory Layer 0 owns the Tate-cohomology interface (Herbrand quotient, Tate–Nakayama,
  Nakayama–Rim, cohomological triviality written out as vanishing on all subgroups); class
  formations stay there.
- FreeGroupsAndLimitGroups Layer 4 owns graphs of groups, `G`-trees (§4.6), the Bass–Serre tree
  (§4.7) and the identification of one-edge splittings with Mathlib's `Monoid.PushoutI` and
  `HNNExtension` (§4.5). Layer 3 consumes them.
- AlgebraicTopology owns cellular chains (§§4.1–4.3), the Cartan–Leray spectral sequence of a
  finite regular cover (§5.3), torus homology (§5.4) and the non-freeness of `C_p × C_p` actions
  on spheres (§8.15). The algebraic statements 3.3 and 8.3 are the group-cohomological inputs of
  those topological statements; `G`-CW complexes and the `G`-module structure on their cellular
  chains are not constructed here, and the topological forms (a free cellular action on a
  finite-dimensional complex with the homology of a sphere) are instances that a roadmap owning
  `G`-CW complexes obtains by applying 8.3 to the cellular chains.
- The algebraic Künneth and universal-coefficient spectral sequences of complexes over an
  arbitrary ring are statements about complexes of `k`-modules, owned by a spectral-sequence
  roadmap; this roadmap supplies the chain-level identification of 5.1 to which they apply, and
  proves the two-term sequences over rings of global dimension at most one.
- Finiteness conditions, cohomological and virtual cohomological dimension, duality groups, Euler
  characteristics and Farrell cohomology are not planned here; no target uses them, and the
  finiteness hypothesis of 5.2 is stated directly on the homology of a factor.
- Non-goals: the Evens norm and finite generation of cohomology rings; equivariant Tate cohomology
  of complexes; realising periods by finite complexes.

**Local restatements in roadmaps under review.** SchemeKTheoryOperations §6.7 and K3BlochGroups
§4.1 (integral group hyperhomology), K3BlochGroups §§4.15 and 5.2 (extension sequences, stable
elements, homology duality and periods with `ℤ_(r)` coefficients),
MappingClassGroupsAndCanonicalRepresentations §1.1 (the cohomological Hochschild–Serre and
five-term sequences for discrete groups), InductionRestrictionPartII RS.0.1 (the low-degree
sequence of a central extension) and ModularCurvesPartII §15.4 (the sequence of one amalgam) are
instances of targets here. Each is listed under Downstream consumers with the target it imports.

## Conventions

- **Universes and rings.** `k G : Type u`, `[CommRing k]`, `[Group G]`; representations are
  objects of `Rep.{u} k G`, the generality in which Mathlib's carriers and its monoidal structure
  on `Rep` are stated. Subgroups `H ≤ G` carry the restricted representation `Rep.res H.subtype M`,
  written `Res M` or `M` when no confusion arises.
- **Notation.** `Hⁿ(G, M) = groupCohomology M n`, `Hₙ(G, M) = groupHomology M n`, and, for
  `[Fintype G]`, `Ĥⁿ(G, M) = tateCohomology M n` for `n : ℤ`, with `Ĥ^{−n−1}(G, M) = Hₙ(G, M)`
  for `n ≥ 1` through `TateCohomology.isoGroupHomology`. For an abelian group `A` and a prime
  `p`, `A(p)` is the subgroup of elements killed by a power of `p`.
- **Maps of groups.** A compatible pair is a homomorphism `f : G' →* G` with a morphism
  `Res_f M ⟶ M'` (cohomology) or `M' ⟶ Res_f M` (homology), as in `groupCohomology.map` and
  `groupHomology.map`. In cohomology, *restriction* is the pair `(H.subtype, 𝟙)`, *inflation* the
  pair `(G → G ⧸ N, M^N ↪ M)`, and *corestriction* is Tau Ceti's
  `TauCeti.groupCohomology.corestriction` (finite index). In homology, *corestriction* is the map
  `Hₙ(H, M) → Hₙ(G, M)` induced by the inclusion (Mathlib's `groupHomology.coresNatTrans`),
  *coinflation* is `groupHomology.coinfNatTrans`, and *transfer* is Tau Ceti's
  `TauCeti.groupHomology.transfer : Hₙ(G, M) → Hₙ(H, M)` (finite index).
- **Conjugation.** For `g ∈ G` and `H ≤ G`, `c_g : Hⁿ(H, M) → Hⁿ(gHg⁻¹, M)` is induced by the
  pair `(x ↦ g⁻¹xg : gHg⁻¹ → H, m ↦ g·m)`, and `c_g : Hₙ(H, M) → Hₙ(gHg⁻¹, M)` by
  `(h ↦ ghg⁻¹, m ↦ g·m)`. Witness: in degree `0`, `c_g(m) = g·m` sends `M^H` into `M^{gHg⁻¹}`;
  for `G = S₃`, `H = ⟨(12)⟩`, `g = (13)` and trivial `𝔽₂` coefficients, `c_g` sends the nonzero
  character of `H` to the character of `⟨(23)⟩ = gHg⁻¹` taking the value `1` on `(23)`.
- **Cup product.** For a pairing `μ : M ⊗ N ⟶ P` and inhomogeneous cochains `φ` of degree `p` and
  `ψ` of degree `q`, `(φ ∪ ψ)(g₁, …, g_{p+q}) = μ(φ(g₁, …, g_p) ⊗ (g₁⋯g_p)·ψ(g_{p+1}, …, g_{p+q}))`,
  with `d(φ ∪ ψ) = dφ ∪ ψ + (−1)^p φ ∪ dψ` and, for connecting maps, `δx ∪ y = δ(x ∪ y)` and
  `x ∪ δy = (−1)^p δ(x ∪ y)` (MilneCFT Ch. II Prop. 1.38, p. 73). This is Tau Ceti's sign for the
  Tate cup product. Witness: on `G = ℤ²` with `x, y ∈ H¹(G, ℤ)` the two coordinate projections,
  the cocycle `x ∪ y` takes the values `1` at `(e₁, e₂)` and `0` at `(e₂, e₁)`, so it pairs to
  `+1` with the class of `[e₁|e₂] − [e₂|e₁]` in `H₂(G, ℤ)`; the homogeneous convention with a
  factor `(−1)^{pq}` (Loh19 Outlook 3.2.28, p. 139) gives `−1`.
- **Extension classes.** For `1 → A → E → Q → 1` with `A` abelian and a set-theoretic section
  `s` with `s(1) = 1`, the class `c ∈ H²(Q, A)` is that of the factor set
  `(x, y) ↦ s(x)s(y)s(xy)⁻¹`. Witness: for `ℤ/3 ⊂ ℤ/9` and `s(x) ∈ {0, 1, 2}`, `c` is the carry
  cocycle, nonzero at `(1, 2)`, `(2, 1)` and `(2, 2)`.
- **Spectral sequences.** Indexing is classical: a cohomological sequence has
  `d_r : E_r^{p,q} → E_r^{p+r, q−r+1}`, a homological one `d^r : E^r_{p,q} → E^r_{p−r, q+r−1}`.
  The translation to Mathlib's numbering, where the first page is numbered `2`, is the one fixed by
  DerivedModuleAlgebra §S.1 and Tau Ceti's `CochainComplex.spectralSequence`.
- **Total complexes.** The total complex of a bicomplex is Mathlib's `HomologicalComplex₂.total`
  with its sign convention; isomorphisms with other sign conventions are stated where used.
- **Groups.** The generalised quaternion group of order `2^s`, `s ≥ 3`, is
  `QuaternionGroup (2^(s−2))` (order `4 · 2^(s−2)`); `Q₈` is the case `s = 3`. A representation is
  *cohomologically trivial* when `Ĥⁿ(S, Res A) = 0` for every subgroup `S` and every `n ∈ ℤ`,
  written out as in ClassFieldTheory Layer 0.

## Exact supplier contracts

### From Mathlib

- `groupCohomology`, `groupHomology`, `groupCohomology.map`, `groupHomology.map`,
  `groupCohomology.cochainsFunctor`, `groupHomology.chainsFunctor`, `groupCohomology.functor`,
  `groupHomology.functor`, `groupCohomology.resNatTrans`, `groupCohomology.infNatTrans`,
  `groupCohomology.HInfRes`, `groupHomology.coresNatTrans`, `groupHomology.coinfNatTrans`,
  `groupHomology.H1CoresCoinf` (`RepresentationTheory/Homological/Group{Co}homology/Functoriality.lean`):
  the carriers and their functoriality in compatible pairs.
- `groupCohomology.coindIso`, `groupHomology.indIso` (`…/Shapiro.lean`): Shapiro's lemma for any
  subgroup.
- `Rep.standardResolution`, `Rep.barResolution` (`RepresentationTheory/Homological/Resolution.lean`),
  `groupCohomologyIso`, `groupHomologyIso`, `groupCohomologyIsoExt`, `groupHomologyIsoTor`: the
  carriers computed from any projective resolution of the trivial representation.
- `tateCohomology`, `TateCohomology.isoGroupCohomology`, `TateCohomology.isoGroupHomology`
  (`…/TateCohomology/Basic.lean`): Tate cohomology of a finite group, defined for `[Fintype G]`;
  the comparison `isoGroupCohomology n` needs `n ≠ 0`.
- `continuousCohomology`, `TopRep.homogeneousCochains` (`…/ContCohomology/Basic.lean`): continuous
  cohomology of a topological group as the cohomology of invariant iterated function spaces; its
  module docstring records the comparison with `groupCohomology` for discrete groups as missing.
- `Rep.ihom`, `Rep.quotientToInvariantsFunctor`, `Rep.quotientToCoinvariantsFunctor`, `Rep.res`,
  `Rep.ofMulAction`: internal Hom, the quotient actions on invariants and coinvariants of a normal
  subgroup, restriction and permutation representations.
- `HomologicalComplex₂`, `HomologicalComplex₂.total`, `DerivedCategory`, `QuaternionGroup`,
  `Sylow`, `IsPGroup`, `DoubleCoset.Quotient`, `Monoid.PushoutI`, `HNNExtension`, `FreeGroup`, `IsCyclic`,
  `GroupExtension`.
- `AlgebraicTopology.DoldKan.homotopyEquivNormalizedMooreComplexAlternatingFaceMapComplex`,
  `AlgebraicTopology.inclusionOfMooreComplexMap` (`AlgebraicTopology/DoldKan/HomotopyEquivalence.lean`,
  `AlgebraicTopology/AlternatingFaceMapComplex.lean`):
  the normalized Moore complex is a deformation retract of the alternating face complex, used for
  normalized cochains in 6.1.

### From Tau Ceti

- `TauCeti.groupCohomology.corestriction` with `map_subtype_id_comp_corestriction`,
  `map_comp_corestriction`, `δ_comp_corestriction` and `corestriction_trans`
  (`RepresentationTheory/Homological/GroupCohomology/Corestriction.lean`): corestriction for a
  subgroup of finite index, `cor ∘ res = [G : H]`.
- `TauCeti.groupHomology.transfer`, `TauCeti.groupHomology.transfer_comp_map_subtype_id`
  (`…/GroupHomology/Transfer/Basic.lean`): the transfer `Hₙ(G, M) → Hₙ(H, M)`, with
  `cor ∘ tr = [G : H]`.
- `TauCeti.groupCohomology.HInfRes_exact`, `TauCeti.groupCohomology.mono_HInfRes_f`
  (`…/GroupCohomology/InflationRestriction.lean`): exactness of
  `Hⁿ⁺¹(G ⧸ N, M^N) → Hⁿ⁺¹(G, M) → Hⁿ⁺¹(N, M)` and injectivity of inflation when
  `Hⁱ(N, M) = 0` for `0 < i ≤ n`.
- `TauCeti.groupCohomology.eq_zero_of_pow_nsmul_eq_zero_of_map_sylow_eq_zero`
  (`…/GroupCohomology/Sylow.lean`): for finite `G`, a `p`-primary class restricting to zero on a
  Sylow `p`-subgroup vanishes.
- `TauCeti.TateCohomology.cup`, `TauCeti.TateCohomology.cup_assoc`,
  `TauCeti.TateCohomology.cup_gradedComm`, `TauCeti.TateCohomology.cup_projection`,
  `TauCeti.TateCohomology.cup_res`, `TauCeti.TateCohomology.cup_left_unit`,
  `TauCeti.TateCohomology.cup_δ_of_flat`, `TauCeti.TateCohomology.δ_cup_of_leftInverse`
  (`…/TateCohomology/Cup/`): the Tate cup product of a finite group in all integer bidegrees, for
  the pairing `M ⊗ N`, with the sign `x ∪ δy = (−1)^p δ(x ∪ y)`.
- `TauCeti.TateCohomology.characterConnectingClass`,
  `TauCeti.TateCohomology.cup_characterConnectingClass_eq_groupCohomologyπEven`
  (`…/TateCohomology/Character.lean`, `…/Cup/Cyclic.lean`): for a finite cyclic group (in `Type`,
  commutative), the class `δχ ∈ Ĥ²(G, ℤ)` of a character with `χ(g) = 1/|G|`, and cup product with
  it on degree-zero classes.
- `Rep.FiniteCyclicGroup.periodicIso`, `Rep.FiniteCyclicGroup.periodicIsoOfGenerator`
  (`…/TateCohomology/Periodic.lean`): two-periodicity of Tate cohomology of a finite cyclic group,
  built from the periodic resolution.
- `TauCeti.TateCohomology.cup_bijective_of_forall_isPGroup_of_lTensor_injective`
  (`…/TateCohomology/Cup/TateNakayama.lean`): the Tate–Nakayama theorem, as recorded by
  ClassFieldTheory Layer 0.
- `TauCeti.ContCohomology.nonempty_continuousCohomology_addEquiv_groupCohomology`
  (`…/ContCohomology/DiscreteGroup.lean`): for finite `G : Type` with the discrete topology, an
  unnamed additive equivalence between continuous cohomology and `groupCohomology` in each degree;
  naturality is not proved there.
- `TauCeti.ContCohomology.explicitH1IsoGroupCohomology`, `TauCeti.ContCohomology.explicitH2IsoGroupCohomology`
  (`…/GroupCohomologyIso/Basic.lean`), `TauCeti.ContCohomology.transgression`,
  `TauCeti.ContCohomology.IsTransgressionLift`, `TauCeti.ContCohomology.fiveTerm_exact_H1N`
  (`…/ContCohomology/Transgression.lean`): the explicit comparisons in degrees `1, 2` and the
  profinite transgression.
- `TauCeti.TopPairing`, `TauCeti.TopPairing.cup` (`…/ContCohomology/Cup/Graded/Basic.lean`,
  `…/Cup/Cohomology.lean`): coefficient pairings of topological representations and the
  continuous cup product.
- `TauCeti.ContinuousCohomology.corestriction_mackey` (`…/Corestriction/Mackey/AllDegrees.lean`):
  the Mackey formula for profinite `G`, an open subgroup `U` and a closed subgroup `V`.
- `TauCeti.ContCohomology.continuousFiniteQuotientColimit`
  (`…/ContCohomology/FiniteQuotient/AllDegreeColimit.lean`): continuous cohomology of a profinite
  group as the colimit over its finite quotients.
- `CochainComplex.filtrationFunctor`, `CochainComplex.spectralSequence`,
  `CochainComplex.spectralSequenceFirstPageXIsoCokernel`, `CochainComplex.spectralSequence_first_page_d_eq`,
  `CochainComplex.filtrationAbutmentIso`, `CochainComplex.filtrationSpectralSequencePageXIsoGradedOfFinite`,
  `CochainComplex.filtrationFunctorMap` (`Algebra/Homology/SpectralSequence/Filtered/`): the
  spectral sequence of a filtered cochain complex, its first page and differential, convergence for
  a finite filtration, naturality.
- `HomologicalComplex₂.rowFiltrationSpectralSequence`, `HomologicalComplex₂.columnFiltrationSpectralSequence`,
  `HomologicalComplex₂.columnFiltrationAbutmentIso`, `HomologicalComplex₂.quasiIso_totalAugmentation_of_rows`
  (`Algebra/Homology/SpectralSequence/Bicomplex.lean`, `Algebra/Homology/TotalComplex.lean`): the
  two spectral sequences of a first-quadrant homological bicomplex and the comparison of a
  bicomplex with exact augmented rows to its augmentation.
- `HomologicalComplex.homologyKunnethShortComplex_shortExact`, `HomologicalComplex.homologyKunneth`
  (`Algebra/Homology/Monoidal/Homology/Kunneth/`): the Künneth short exact sequence for chain
  complexes of modules whose second factor has projective cycles and boundaries.
- `TauCeti.ChainComplex.extToHomology`, `TauCeti.ChainComplex.exact_extToHomology_kronecker`,
  `TauCeti.ChainComplex.extToHomology_injective` (`Algebra/Homology/UniversalCoefficient/`): the
  cohomological universal coefficient sequence.
- `TauCeti.indTrivialIso`, `TauCeti.indResProjection` (`RepresentationTheory/Induction/Permutation.lean`):
  `Ind_H^G k ≅ k[G ⧸ H]` and `Ind_H^G Res M ≅ k[G ⧸ H] ⊗ M`.
- `Rep.dimensionShiftUp` (`RepresentationTheory/Induction/DimensionShift.lean`) and
  `groupHomology.isZero_indBot_succ` (`…/GroupHomology/Induced.lean`): dimension shifting
  and the acyclicity of modules induced from the trivial subgroup.
- `TauCeti.SerreGraph`, `TauCeti.SerreGraph.IsTree` (`Combinatorics/Graph/Serre/`): Serre graphs
  and trees.

### From TauCetiRoadmap.DerivedModuleAlgebra

- §S.1 (*The spectral sequence of a first-quadrant double complex*): for a first-quadrant double
  complex in an abelian category, the column-filtration spectral sequence
  `E₂^{pq} = H^p_I(H^q_II) ⇒ Hⁿ(Tot)`, its convergence and stabilisation bound, the edge
  morphisms, the five-term and extended sequences, the exact-rows comparison and naturality; and
  the homological form with `E²_{p,q} = H_p(H_q(C))` abutting to `H_{p+q}(Tot C)`.
- **What §S.1 must provide** (`gap:homological-low-degree`): in homological indexing, the edge
  morphisms `H_n(Tot C) → E²_{n,0}` and `E²_{0,n} → H_n(Tot C)` and the five-term exact sequence
  `H₂(Tot C) → E²_{2,0} → E²_{0,1} → H₁(Tot C) → E²_{1,0} → 0` of a first-quadrant homological
  double complex. §S.1 states these in cohomological indexing only; its homological form stops at
  `E²` and convergence. Targets 6.3, 6.5, 6.7 and 6.8 use them.

### From TauCetiRoadmap.ProfiniteCohomology

- §3.1 and §3.2: the explicit low-degree models and their comparisons with `groupCohomology`
  (discrete groups) and with `continuousCohomology`, in degrees `0, 1, 2`.
- §5.5: the five-term sequence and transgression for profinite `G` and closed normal `N`.
- §6.4 and §10.5: the Mackey double-coset formula and its `S₃` Check.
- §10.1: the all-degree finite-quotient colimit description of continuous cohomology.
- Layer 12: the graded cup product in all degrees, `TauCeti.TopPairing.cup`.

### From TauCetiRoadmap.ClassFieldTheory

- Layer 0 (§0.1): Tate cohomology with restriction, corestriction and the Tate cup product,
  cohomological triviality written out, Tate–Nakayama, and the Nakayama–Rim theorem
  (`Rep.isZero_res_of_projective`, `Rep.projective_of_isZero_res`).

### From TauCetiRoadmap.FreeGroupsAndLimitGroups

- §4.5: the segment and loop graphs of groups are Mathlib's `Monoid.PushoutI` and `HNNExtension`.
- §4.6: `G`-trees, Serre trees with an action of `G` without inversions.
- §4.7: the Bass–Serre tree of a graph of groups, its vertex and edge stabilisers and its quotient
  graph; for a graph of groups with trivial groups, the universal cover of the graph.
- §§4.1–4.2 and §2.2: graphs of groups and their fundamental groups; the fundamental group of the
  rose with trivial groups is free on its petals.

### From TauCetiRoadmap.AlgebraicTopology

- §5.3: the Cartan–Leray spectral sequence of a finite regular cover, compared with 3.3 in a
  Check; §8.15: free actions of `C_p × C_p` on spheres, compared with 8.5 in a Check.

## How to read the build

Layer 1 adds to the carriers what every later layer uses: conjugation, the action of a quotient
group on the (co)homology of a normal subgroup, additivity, permutation modules, and the named
comparison of continuous and discrete cohomology for a discrete group. Layer 2 extends the
coefficients to complexes and produces the two hyper(co)homology spectral sequences from
DerivedModuleAlgebra §S.1. Layer 3 applies Layer 2 to complexes of permutation modules: orbit and
free complexes, and the exact chain complex of a tree, which gives the sequences of amalgams, HNN
extensions and free groups without a spectral sequence. Layer 4 builds cup and cap products for
arbitrary pairings and compares them with the library's Tate and continuous cups. Layer 5 treats
products of groups and abelian groups (Künneth, universal coefficients, Pontryagin ring). Layer 6
builds the Hochschild–Serre spectral sequence (cohomology through the filtration of the cochains
of `G`, homology through Layer 2), identifies its edge maps, transgression and products, and
derives the low-degree sequences and Hopf's formula, using the free groups of Layer 3. Layer 7
proves the double coset formula for any group and, for finite groups, the stable element theorem.
Layer 8 proves Tate duality and the periodicity theorems for finite groups, using Layers 4, 5
and 7.

---

## Layer 1: conjugation, quotient actions and permutation modules

### 1.1 Conjugation

Define, for `H ≤ G`, `g ∈ G` and `M : Rep k G`, the conjugation maps
`c_g : Hⁿ(H, M) → Hⁿ(gHg⁻¹, M)` and `c_g : Hₙ(H, M) → Hₙ(gHg⁻¹, M)` as the compatible-pair maps
of the Conventions, and for finite `G` the same map on `Ĥⁿ(H, M)`, `n ∈ ℤ`, through the Tate
complex. Prove that conjugation by an element of `H` is the identity on the (co)homology of `H`
(HS53 Ch. I §2, corollary to Prop. 2, p. 113, HS53 line 154–160, as used at HS53 line 345–354;
Loh19 Prop. 3.2.13, p. 124). *Needs:* Mathlib `groupCohomology.map`, `groupHomology.map`, `tateCohomology`; Tau Ceti
`TauCeti.groupCohomology.corestriction`, `TauCeti.groupHomology.transfer`.

- `c_1` is the identity, and `c_{gh} = c_g ∘ c_h` (after the equality `g(hHh⁻¹)g⁻¹ = (gh)H(gh)⁻¹`).
- For `g ∈ H`, `c_g` is the identity of `Hⁿ(H, M)`, of `Hₙ(H, M)` and of `Ĥⁿ(H, M)`.
- `c_g` commutes with coefficient maps, with connecting maps of short exact sequences of
  representations, with restriction to `K ≤ H` (landing in `gKg⁻¹`), with corestriction and
  transfer for `K ≤ H` of finite index, and with the homological corestriction.
- In degree `0`, `c_g(m) = g·m` on `M^H` and `c_g[m] = [g·m]` on `M_H`.

**Checks.**

- For `G = S₃`, `H = ⟨(12)⟩`, `g = (13)` and trivial `𝔽₂`: `c_g` sends the nonzero element of
  `H¹(H, 𝔽₂) = Hom(H, 𝔽₂)` to the character of `⟨(23)⟩` with value `1`. For `g = (123)`,
  `gHg⁻¹ = ⟨(23)⟩` while `g⁻¹Hg = ⟨(13)⟩`: the model conjugating by `g⁻¹` lands in the cohomology
  of the wrong subgroup.
- For `G` abelian and trivial coefficients, `c_g` is the identity for every `g`, since `gHg⁻¹ = H`
  and the pair is the identity.
- Inner triviality fails for `g ∉ H` normalising `H`: for `G = S₃`, `H = A₃`, `g = (12)` and
  trivial `𝔽₃`, `c_g` acts by `−1` on `H¹(A₃, 𝔽₃) = Hom(A₃, 𝔽₃) ≅ 𝔽₃`.

### 1.2 The quotient action on the (co)homology of a normal subgroup

Define, for `N ◁ G` with quotient `Q = G ⧸ N` and `M : Rep k G`, the representations of `Q` on
`Hⁿ(N, M)` and on `Hₙ(N, M)` given by `qN ↦ c_q` (well defined by the inner triviality of 1.1).
Prove that in degree `0` they are `M^N` with Mathlib's `Rep.quotientToInvariantsFunctor` and `M_N`
with `Rep.quotientToCoinvariantsFunctor` (HS53 line 345–354; Loh19 Prop. 3.2.13, p. 124).
*Needs:* 1.1; Mathlib `Rep.quotientToInvariantsFunctor`, `Rep.quotientToCoinvariantsFunctor`.

- The constructions are functorial in `M` and send the connecting maps of a short exact sequence
  of `G`-representations to `Q`-equivariant maps.
- They are natural for morphisms of pairs `(G', N') → (G, N)` with `f(N') ≤ N`, through the induced
  map `G' ⧸ N' → G ⧸ N`.
- When `N` acts trivially on `M`, `H¹(N, M) ≅ Hom(N^ab, M)` as `Q`-representations, with
  `(gN · φ)(n) = g·φ(g⁻¹ng)`.

**Checks.**

- For `N = G` the quotient is trivial and the representation is the `k`-module `Hⁿ(G, M)`; for
  `N = 1` it is `M` in degree `0` with the action of `G = Q`, and zero in positive degrees.
- For `G = S₃`, `N = A₃` and trivial `𝔽₃`, the transposition acts by `−1` on
  `H¹(A₃, 𝔽₃) ≅ 𝔽₃`, so the invariants vanish, as `H¹(S₃, 𝔽₃) = Hom(S₃, 𝔽₃) = 0` requires through
  6.7.
- A plausible wrong model letting `g` act by `φ ↦ φ ∘ c_g` without the coefficient action differs
  for `G = ℤ/4`, `N = 2ℤ/4`, `M = ℤ` with the generator acting by `−1`: on
  `H⁰(N, M) = M^N = M` the correct action is `−1`, the wrong one `+1`.

### 1.3 Additivity

Prove that for a family `(M_i)_{i ∈ ι}` of representations, `ι : Type u`, the canonical maps
`⊕_i Hₙ(G, M_i) → Hₙ(G, ⊕_i M_i)` and `Hⁿ(G, ∏_i M_i) → ∏_i Hⁿ(G, M_i)` are isomorphisms, and that
for finite `ι` cohomology also commutes with direct sums. The inhomogeneous chains of a direct sum
are the direct sum of the chains, the cochains of a product are the product of the cochains, and
homology of modules commutes with direct sums and products. *Needs:* Mathlib
`groupHomology.chainsFunctor`, `groupCohomology.cochainsFunctor`.

**Checks.**

- For `ι` a single point both maps are identities.
- Cohomology does not commute with infinite direct sums: for the free abelian group
  `A = ℤ^{(ℕ)}` with trivial action, `H¹(A, ℤ^{(ℕ)}) = Hom(A, ℤ^{(ℕ)})` contains the identity,
  which is not in `⊕_ℕ Hom(A, ℤ)`.
- For `G = ℤ/2` and `M_i = ℤ` with trivial action, `H₁(G, ℤ^{(ι)}) = (ℤ/2)^{(ι)}`.

### 1.4 Permutation modules and Shapiro's lemma

Prove, for `H ≤ G` and `M : Rep k G`, natural isomorphisms
`Hₙ(G, k[G ⧸ H] ⊗ M) ≅ Hₙ(H, M)` and `Hⁿ(G, Hom_k(k[G ⧸ H], M)) ≅ Hⁿ(H, M)`, and, for a
character `χ : H →* kˣ` with `k_χ` the corresponding rank-one representation,
`Hₙ(G, Ind_H^G(k_χ) ⊗ M) ≅ Hₙ(H, k_χ ⊗ M)` and its cohomological dual. For a `G`-set `X` with a set
`Σ` of orbit representatives, combine these with 1.3 into
`Hₙ(G, k[X] ⊗ M) ≅ ⊕_{x ∈ Σ} Hₙ(G_x, M)` and `Hⁿ(G, Hom_k(k[X], M)) ≅ ∏_{x ∈ Σ} Hⁿ(G_x, M)`.
Route: `TauCeti.indResProjection` (for the trivial character) or the projection formula for
`Ind_H^G`, Shapiro's lemma `groupHomology.indIso` and `groupCohomology.coindIso`, the isomorphism
`Hom_k(k[G ⧸ H], M) ≅ Coind_H^G M`, and the orbit decomposition `X ≅ ⊔_{x ∈ Σ} G ⧸ G_x` (SerreArbres
II §2.8, p. 168). *Needs:* 1.3; Mathlib `groupHomology.indIso`, `groupCohomology.coindIso`,
`Rep.ofMulAction`; Tau Ceti `TauCeti.indTrivialIso`, `TauCeti.indResProjection`.

**Checks.**

- For `X` a point (`H = G`) the isomorphisms are the identity.
- For `X = G` with left translation (`H = 1`), `Hₙ(G, k[G] ⊗ M) = 0` for `n > 0`.
- For `G = ℤ/2` acting on `X = G ⊔ pt`, `H₁(G, ℤ[X]) = H₁(1, ℤ) ⊕ H₁(G, ℤ) = ℤ/2` and
  `H₀(G, ℤ[X]) = ℤ²`; the model summing over all points instead of orbits gives `H₀ = ℤ³`.

### 1.5 Continuous cohomology of a discrete group

Construct, for `G` with the discrete topology, `k` with the discrete topology and a topological
representation `A : TopRep k G` whose carrier is discrete, an isomorphism of `k`-modules
`Θₙ : continuousCohomology n A ≅ Hⁿ(G, A)` (the underlying representation), for every `n`. Every
function on a discrete space is continuous, so currying identifies the invariant iterated function
spaces of `TopRep.homogeneousCochains` with the homogeneous cochains `Hom_G(k[G^{n+1}], A)`, and
the comparison of the standard and bar resolutions gives the inhomogeneous cochains. Prove that
`Θ` is natural in compatible pairs of discrete groups and in `A`, commutes with the connecting maps
of short exact sequences of discrete representations, and agrees in degrees `0, 1, 2` with the
explicit comparisons of ProfiniteCohomology §§3.1–3.2. *Needs:* Mathlib `continuousCohomology`,
`TopRep.homogeneousCochains`, `Rep.standardResolution`, `groupCohomologyIso`; ProfiniteCohomology
§3.1, §3.2; Tau Ceti `TauCeti.ContCohomology.explicitH1IsoGroupCohomology`,
`TauCeti.ContCohomology.explicitH2IsoGroupCohomology`.

- `Θ₀` is the identification of both sides with the invariants `A^G`.
- `Θ` is natural for every homomorphism of discrete groups with a compatible equivariant map.
- For `k = ℤ`, finite `G : Type` and `A` a discrete `G`-module, `Θₙ` is an additive equivalence
  `continuousCohomology n A ≃+ Hⁿ(G, A)`, which `TauCeti.ContCohomology.nonempty_continuousCohomology_addEquiv_groupCohomology`
  asserts only to exist.

**Checks.**

- For the trivial group both sides are `A` in degree `0` and zero in positive degrees.
- For `G = ℤ` with the discrete topology and trivial `A = ℤ`, both sides of `Θ₁` are
  `Hom(ℤ, ℤ) ≅ ℤ`. For `ℤ` with the topology induced from its profinite completion, continuous
  homomorphisms to the discrete `ℤ` have finite image, so `H¹_cont = 0 ≠ H¹(ℤ, ℤ)`:
  discreteness of `G` is used.
- In degree `1` with trivial action, `Θ₁` sends the class of a homomorphism `f : G → A` to the
  class of `f`. A comparison using the homogeneous cocycle `(g₀, g₁) ↦ f(g₀) − f(g₁)` instead of
  `f(g₁) − f(g₀)` sends it to `−f`, which differs for `G = ℤ`, `A = ℤ/3`; the agreement with
  ProfiniteCohomology §3.1 excludes it.

### Examples

For `G = S₃` and `N = A₃`, the quotient `ℤ/2` acts on `H¹(A₃, 𝔽₃) ≅ 𝔽₃` by `−1` and on
`H²(A₃, ℤ) ≅ ℤ/3` by `−1`, and on `H⁴(A₃, ℤ) ≅ ℤ/3` trivially; these three actions are used again
in 6.7 and 7.2.

### Dependencies

Mathlib's carriers, functoriality, Shapiro's lemma and continuous cohomology; Tau Ceti's
corestriction, transfer and permutation-module isomorphisms; ProfiniteCohomology §§3.1–3.2 for 1.5.

---

## Layer 2: coefficients in a complex

### 2.1 Hyperhomology and hypercohomology

Define, for a chain complex `C` of representations indexed by `ℕ`, the *hyperhomology*
`Hₙ(G; C)` as the homology of the total complex of the first-quadrant bicomplex whose `(p, q)`
term is the module of inhomogeneous `p`-chains with coefficients in `C_q`, obtained by applying
`groupHomology.chainsFunctor` to `C` degreewise. Define, for a cochain complex `D` indexed by `ℕ`,
the *hypercohomology* `Hⁿ(G; D)` as the cohomology of the total complex of the bicomplex of
inhomogeneous `p`-cochains with values in `D^q`, from `groupCohomology.cochainsFunctor`. Every
bounded-below complex is a shift of one indexed by `ℕ`. (HS53 Ch. I §4, p. 114, for the cochain
bicomplex `C(Π, U)`, and Ch. I §2 Prop. 1, p. 111, for independence of the resolution.)
*Needs:* Mathlib `groupHomology.chainsFunctor`, `groupCohomology.cochainsFunctor`,
`HomologicalComplex₂.total`.

- Functoriality: chain maps of complexes of representations, and compatible pairs consisting of
  `f : G' →* G` and a chain map `C' ⟶ Res_f C` (homology) or `Res_f D ⟶ D'` (cohomology).
- Independence of the resolution: for any projective resolution `P` of the trivial representation
  `k`, `Hₙ(G; C)` is canonically isomorphic to the homology of the total complex of
  `(P_p ⊗ C_q)_G`, and `Hⁿ(G; D)` to the cohomology of the product total complex of
  `Hom_G(P_p, D^q)`; two resolutions give compatible isomorphisms.
- Invariance: a quasi-isomorphism `C ⟶ C'` induces isomorphisms `Hₙ(G; C) ≅ Hₙ(G; C')`, and
  likewise in cohomology.
- Concentration in degree `0`: for `C` the single complex on `M` in degree `0`,
  `Hₙ(G; C) ≅ Hₙ(G, M)`, and `Hⁿ(G; D) ≅ Hⁿ(G, M)` for `D` the single cochain complex.
- Derived category: for any choice of derived category of `Rep k G` (Mathlib's
  `DerivedCategory`), `Hⁿ(G; D)` is naturally isomorphic to the morphisms from the trivial
  representation `k` to the shift `D[n]`; for `D` concentrated in degree `0` this is
  `groupCohomologyIsoExt`.

**Checks.**

- For `G = ℤ/2` and `C = ℤ` in degree `0`, `H₁(G; C) = ℤ/2`.
- For `G = S₃` and `C` the complex `ℤ[S₃ ⧸ A₃] → ℤ` (augmentation, degrees `1 → 0`),
  `H₀(G; C) = 0` and `H₁(G; C) = ℤ/2`: `C` is quasi-isomorphic to the sign representation in
  degree `1`, whose coinvariants are `ℤ/2`, although the complex of coinvariants `ℤ → ℤ` is
  acyclic. The model taking homology of the coinvariant complex gives `0`.
- For the trivial group, `Hₙ(1; C) = Hₙ(C)`.

### 2.2 Long exact sequences

Prove that a degreewise short exact sequence of complexes of representations gives natural long
exact sequences in hyperhomology and in hypercohomology. The functors of inhomogeneous chains and
cochains are exact, so the sequence of total complexes is short exact. *Needs:* 2.1.

**Checks.**

- For complexes concentrated in degree `0` the sequences are Mathlib's long exact sequences of
  `groupHomology` and `groupCohomology`.
- For `0 → C' → C → C'' → 0` with `C` acyclic, the connecting maps are isomorphisms
  `Hₙ(G; C'') ≅ Hₙ₋₁(G; C')`.
- For `G` trivial the sequence is the homology sequence of complexes of modules.

### 2.3 The two spectral sequences

Prove that for a chain complex `C` indexed by `ℕ` there are natural spectral sequences
`E¹_{p,q} = H_q(G, C_p) ⇒ H_{p+q}(G; C)`, with `d¹ = H_q(G, ∂)`, and
`E²_{p,q} = H_p(G, H_q(C)) ⇒ H_{p+q}(G; C)`; and for a cochain complex `D` indexed by `ℕ`,
`E₁^{p,q} = H^q(G, D^p) ⇒ H^{p+q}(G; D)` and `E₂^{p,q} = H^p(G, H^q(D)) ⇒ H^{p+q}(G; D)`. All four
converge, with filtrations finite in each total degree. They are the two spectral sequences of the
defining bicomplex: filtering by the degree of `C` gives the first, and since inhomogeneous chains
are exact in the coefficients, filtering by the bar degree gives the second (HS53 Ch. I §5,
Lemmas 1–2 and Prop. 5, p. 116). *Needs:* 2.1; DerivedModuleAlgebra §S.1; Tau Ceti
`HomologicalComplex₂.rowFiltrationSpectralSequence`,
`HomologicalComplex₂.columnFiltrationSpectralSequence`.

- If `Hᵢ(C) = 0` for `i ≤ t`, then `Hₙ(G; C) = 0` for `n ≤ t`; dually for cochain complexes.
- If `C_p` is acyclic for `H_*(G, −)` in positive degrees for every `p`, then
  `Hₙ(G; C) ≅ Hₙ((C)_G)`; dually `Hⁿ(G; D) ≅ Hⁿ(D^G)` (the exact-rows comparison of
  DerivedModuleAlgebra §S.1; HS53 Ch. I §4 Prop. 4, p. 114).

**Checks.**

- For `C` concentrated in degree `0` the second sequence has a single row and recovers
  `Hₙ(G, C₀)`.
- For the `S₃` complex of 2.1, the first sequence has `E¹_{1,q} = H_q(A₃, ℤ)` (Shapiro) and
  `E¹_{0,q} = H_q(S₃, ℤ)`, with `d¹` the corestriction: an isomorphism `ℤ → ℤ` for `q = 0` and zero
  `ℤ/3 → ℤ/2` for `q = 1`. So `H₁(G; C) = E²_{0,1} = ℤ/2` and `H₂(G; C) = E²_{1,1} = ℤ/3`, as the
  second sequence gives through `Hₙ(G; C) = Hₙ₋₁(S₃, ℤ_sgn)`. Taking `d¹ = 0` on `q = 0` would
  give `H₀(G; C) = ℤ`.
- With `S₃ ⧸ ⟨(12)⟩` in place of `S₃ ⧸ A₃`, `d¹` on `q = 1` is the isomorphism
  `H₁(⟨(12)⟩, ℤ) → H₁(S₃, ℤ) = ℤ/2`, so `H₀(G; C) = H₁(G; C) = 0` although `H₁(C) ≅ ℤ²`: the
  vanishing statement has no converse.

### Examples

For `C = (ℤ[S₃ ⧸ A₃] → ℤ)`, `Hₙ(S₃; C) = Hₙ₋₁(S₃, ℤ_sgn)`: `0` for `n = 0`, `ℤ/2` for `n = 1`
and `ℤ/3` for `n = 2`, read off either spectral sequence of 2.3.

### Dependencies

Layer 1; Mathlib `groupHomology.chainsFunctor`, `groupCohomology.cochainsFunctor`,
`HomologicalComplex₂.total`, `DerivedCategory`; Tau Ceti's bicomplex spectral sequences;
DerivedModuleAlgebra §S.1.

---

## Layer 3: complexes of permutation modules and actions on trees

### 3.1 Equivariant homology of a complex of representations

For a chain complex `C` of representations indexed by `ℕ` and `M : Rep k G`, write
`H^G_n(C; M) = H_n(G; C ⊗ M)` (2.1) and, dually, `H_G^n(C; M) = Hⁿ(G; Hom_k(C, M))`, with the long
exact sequences and naturality of 2.2. Prove that if every `C_p` is flat over `k` and `C` is a
resolution of the trivial representation `k`, then `H^G_n(C; M) ≅ Hₙ(G, M)` and
`H_G^n(C; M) ≅ Hⁿ(G, M)`. The augmentation `C ⊗ M → M` is then a quasi-isomorphism of complexes of
representations (and `Hom_k(C, M)` is quasi-isomorphic to `M` when every `C_p` is projective over
`k`). *Needs:* 2.1, 2.2.

**Checks.**

- For the complex of the standard resolution the isomorphism is `groupHomologyIso`.
- The resolution hypothesis is used: for `C = ℤ[ℤ/2]` in degree `0`, `H^G_1(C; ℤ) = H₁(1, ℤ) = 0`
  while `H₁(ℤ/2, ℤ) = ℤ/2`.
- Flatness is used: for `k = ℤ/4`, `G` trivial, `M = ℤ/2` and `C = k ⊕ (ℤ/2 → ℤ/4 → ℤ/2)` (the
  exact sequence placed in degrees `2, 1, 0`), `C → k` is a quasi-isomorphism but
  `H^G_2(C; M) = ℤ/2 ≠ 0 = H₂(1, M)`.

### 3.2 The orbit spectral sequence

Let each `C_p ≅ ⊕_{σ ∈ Σ_p} Ind_{G_σ}^G(k_σ)` with `Σ_p` a set, `G_σ ≤ G` and `k_σ` given by a
character `G_σ →* kˣ` (a *monomial complex*: the cellular chains of a cell complex on which `G`
permutes the cells, `Σ_p` the orbit representatives of `p`-cells, `G_σ` their stabilisers and
`k_σ` their orientation characters). Prove that the first sequence of 2.3 for `C ⊗ M` is
`E¹_{p,q} = ⊕_{σ ∈ Σ_p} H_q(G_σ, k_σ ⊗ M) ⇒ H^G_{p+q}(C; M)` and dually
`E₁^{p,q} = ∏_{σ ∈ Σ_p} H^q(G_σ, Hom_k(k_σ, M)) ⇒ H_G^{p+q}(C; M)`, with `d¹` the map induced by
`∂` transported through the Shapiro isomorphisms of 1.4 (HS53 Ch. I §5 Prop. 5, p. 116; Brown82
Ch. VII). *Needs:* 1.3, 1.4, 2.3.

**Checks.**

- If every `G_σ = G` with trivial `k_σ`, `E¹_{p,q} = H_q(G, M)^{(Σ_p)}`.
- For the augmented chains of a tree (3.4), the sequence has two columns and degenerates at `E²`,
  recovering 3.5.
- Take the circle with two vertices and two edges, both oriented from the first vertex to the
  second. For `ℤ/2` acting by the reflection fixing both vertices, `E¹_{0,q} = H_q(ℤ/2, ℤ)²`, which
  survives to `E^∞` in odd degrees `q ≥ 3`, so `H^G_n(C; ℤ) ≠ 0` for infinitely many `n`. For
  `ℤ/2` acting by the rotation of order `2`, every stabiliser is trivial, `E¹_{p,q} = 0` for
  `q > 0`, and `H^G_n(C; ℤ)` is the homology of the quotient circle.

### 3.3 Free complexes

Prove that if every `G_σ` is trivial (each `C_p` free over `k[G]` on a basis), then
`H^G_n(C; M) ≅ Hₙ((C ⊗ M)_G)`, the second sequence of 2.3 is
`E²_{p,q} = H_p(G, H_q(C ⊗ M)) ⇒ H_{p+q}((C ⊗ M)_G)`, and, if moreover `C` resolves `k`,
`Hₙ((C ⊗ M)_G) ≅ Hₙ(G, M)`. This is the algebraic form of the Cartan–Leray spectral sequence
(HS53 Ch. I §5 Prop. 5, p. 116). *Needs:* 3.1, 3.2, 2.3; Tau Ceti
`groupHomology.isZero_indBot_succ`.

**Checks.**

- For the singular chains of a finite regular cover with deck group `G` (AlgebraicTopology §5.3),
  the abutment `Hₙ((C ⊗ M)_G)` is the homology of the base through §5.3's quotient-chain
  comparison, and the `E²` term is the `E²` term of §5.3.
- For `G = ℤ/m` and the free resolution `⋯ → ℤG →N ℤG →(t−1) ℤG → ℤ` (Loh19 Prop. 1.6.11,
  p. 48), `Hₙ((C ⊗ ℤ)_G)` is `ℤ/m` in odd degrees and `0` in positive even degrees.
- Freeness is needed: for `C = ℤ` in degree `0` with trivial action (not free),
  `H₁((C)_G) = 0` while `H₁(G; C) = G^ab`.

### 3.4 The chain complex of a tree

Let `X` be a `G`-tree in the sense of FreeGroupsAndLimitGroups §4.6 (a Serre tree with an action
without inversions), with vertex set `V`, a `G`-invariant orientation `E⁺` of its edges (which
exists because no edge is inverted) and `t, o` the terminal and initial vertices. Prove that
`0 → k[E⁺] →∂ k[V] →ε k → 0`, with `∂e = t(e) − o(e)` and `ε` the augmentation, is an exact
sequence of permutation representations, split over `k` (SerreArbres II §2.8, p. 168). Exactness:
a contracting homotopy along the reduced paths to a base vertex, which exist and are unique in a
tree (`TauCeti.SerreGraph.IsTree`). *Needs:* FreeGroupsAndLimitGroups §4.6; Tau Ceti
`TauCeti.SerreGraph.IsTree`; Mathlib `Rep.ofMulAction`.

**Checks.**

- For the one-vertex tree, `E⁺ = ∅` and the sequence is `0 → 0 → k → k → 0`.
- For `X` the line with vertices `ℤ` and `G = ℤ` translating, `∂` is `t − 1` on `k[ℤ]` after the
  identifications `k[E⁺] = k[V] = k[G]`, injective with cokernel `k`.
- For a graph that is not a tree, the circle with one vertex and one loop, `∂ = 0` and the sequence
  is not exact at `k[E⁺]`: acyclicity of the graph is used.

### 3.5 The tree sequences

Let `X` be a `G`-tree, `Σ₀` and `Σ₁` sets of representatives of the orbits of vertices and of
oriented edges, and `M : Rep k G`. Prove that there are natural long exact sequences
`⋯ → ⊕_{e ∈ Σ₁} Hₙ(G_e, M) → ⊕_{v ∈ Σ₀} Hₙ(G_v, M) → Hₙ(G, M) → ⊕_{e ∈ Σ₁} Hₙ₋₁(G_e, M) → ⋯`
and
`⋯ → Hⁿ(G, M) → ∏_{v ∈ Σ₀} Hⁿ(G_v, M) → ∏_{e ∈ Σ₁} Hⁿ(G_e, M) → Hⁿ⁺¹(G, M) → ⋯`
(SerreArbres II §2.8 Prop. 13 and Remarque 1, p. 169). The vertex maps are homological
corestriction (respectively restriction). For `e ∈ Σ₁` with `t(e) = a·v` and `o(e) = b·w`
(`v, w ∈ Σ₀`), the edge-to-vertex map is `c_{a⁻¹} ∘ cor` from `G_e ≤ G_{t(e)}` into the summand of
`v` minus `c_{b⁻¹} ∘ cor` from `G_e ≤ G_{o(e)}` into the summand of `w`, and dually in
cohomology. Route: tensor 3.4 with `M` (exact since it is split over `k`), take the long exact
sequence of group homology and identify the terms by 1.4; in cohomology apply `Hom_k(−, M)`.
*Needs:* 1.1, 1.3, 1.4, 3.4; Mathlib's long exact sequences of `groupHomology` and
`groupCohomology`.

**Checks.**

- For `G = ℤ` acting on the line (one vertex orbit and one edge orbit, trivial stabilisers, `t(e)`
  the translate of `o(e)` by the generator `t`), the sequence gives `H₁(ℤ, M) = ker(t⁻¹ − 1) = M^ℤ`
  and `H₀(ℤ, M) = M_ℤ`, and `Hₙ(ℤ, M) = 0` for `n ≥ 2`.
- If `G` fixes a vertex `v₀` and acts on the tree with one vertex, the sequence reduces to
  `Hₙ(G_{v₀}, M) = Hₙ(G, M)`.
- With the edge map defined as a sum instead of a difference, the line example gives
  `H₀(ℤ, ℤ) = ℤ/2` instead of `ℤ`.

### 3.6 Amalgams, HNN extensions and free groups

Prove the following, each from 3.5 applied to the Bass–Serre tree of FreeGroupsAndLimitGroups
§4.7 for a one-edge graph of groups, identified with Mathlib's group by §4.5 (SerreArbres II §2.8,
example after Prop. 13, p. 169; Brown82 Ch. II §7).

- *Amalgams.* For injective `C →* A` and `C →* B` and `G` the amalgam (`Monoid.PushoutI` over
  `Bool`), with the edge oriented from the vertex of `A` to the vertex of `B`, there are exact
  sequences `⋯ → Hₙ(C, M) → Hₙ(A, M) ⊕ Hₙ(B, M) → Hₙ(G, M) → Hₙ₋₁(C, M) → ⋯`, the first map
  `x ↦ (−cor x, cor x)`, and the dual cohomology sequence.
- *HNN extensions.* For subgroups `A, B ≤ H` and `φ : A ≃* B`, and `G = HNNExtension H A B φ`
  (`t a t⁻¹ = φ(a)`), there are exact sequences
  `⋯ → Hₙ(A, M) → Hₙ(H, M) → Hₙ(G, M) → Hₙ₋₁(A, M) → ⋯`, the first map the difference of the map
  induced by `A ≤ H` and the map induced by `ι_B ∘ φ` (with its coefficient map `m ↦ t·m`), and the
  dual cohomology sequence.
- *Free products and free groups.* `Hₙ(A ∗ B, M) ≅ Hₙ(A, M) ⊕ Hₙ(B, M)` for `n ≥ 1`. For a set
  `S` and `F = FreeGroup S`, `Hₙ(F, M) = 0` and `Hⁿ(F, M) = 0` for `n ≥ 2`, and
  `0 → H₁(F, M) → M^{(S)} → M → H₀(F, M) → 0` is exact, from the action of `F` on its Bass–Serre
  tree for the rose with trivial groups (§§4.1–4.2, 4.7, and §2.2 for the identification with
  `FreeGroup S`).

*Needs:* 3.5; FreeGroupsAndLimitGroups §2.2, §§4.1–4.2, §4.5, §4.7; Mathlib `Monoid.PushoutI`,
`HNNExtension`, `FreeGroup`.

**Checks.**

- `ℤ/4 ∗_{ℤ/2} ℤ/6` (the amalgam presenting `SL₂(ℤ)`, FreeGroupsAndLimitGroups §4.8) has
  `H₁ = ℤ/12`: the cokernel of `ℤ/2 → ℤ/4 ⊕ ℤ/6`, `1 ↦ (−2, 3)`, is cyclic of order `12`, and
  `H₀(C) → H₀(A) ⊕ H₀(B)` is injective.
- For `BS(1, 2) = HNNExtension ℤ ℤ (2ℤ) (×2)`, `H₁ = ℤ`: the map `H₁(A) → H₁(H)` is
  `1 − 2 = −1`, an isomorphism, and `H₀(A) → H₀(H)` is `1 − 1 = 0`; the sum would give
  `1 + 2 = 3` and `1 + 1 = 2`, hence `H₁ = ℤ/3`.
- For `F = FreeGroup S` and trivial `ℤ`, `H₁(F, ℤ) = ℤ^{(S)}` and `Hₙ(F, ℤ) = 0` for `n ≥ 2`; the
  free product `ℤ/2 ∗ ℤ/2` has `Hₙ = (ℤ/2)²` for odd `n` and `0` for even `n ≥ 2`.

### Examples

The infinite dihedral group `ℤ/2 ∗ ℤ/2` acts on the line with two vertex orbits (stabilisers
`ℤ/2`) and one edge orbit (trivial stabiliser); 3.5 gives `H₁ = (ℤ/2)²` and the even groups zero.

### Dependencies

Layers 1–2; FreeGroupsAndLimitGroups §§2.2, 4.1–4.2, 4.5–4.7; Tau Ceti's Serre trees;
AlgebraicTopology §5.3 for a Check.

---

## Layer 4: cup and cap products

### 4.1 The cochain cup product

Define, for `M N P : Rep k G` and `μ : M ⊗ N ⟶ P`, the cup product of inhomogeneous cochains by the
formula of the Conventions, and prove the Leibniz rule `d(φ ∪ ψ) = dφ ∪ ψ + (−1)^p φ ∪ dψ`
(HS53 Ch. II §1, pp. 118–119, HS53 line 389–395; MilneCFT Ch. II Prop. 1.38, proof, p. 73). Define
the induced `k`-bilinear map `∪_μ : Hᵖ(G, M) × H^q(G, N) → H^{p+q}(G, P)`. *Needs:* Mathlib
`groupCohomology.cochainsFunctor`, the monoidal structure of `Rep.{u} k G`.

- The cochain product is `k`-bilinear and natural in `μ`: for `f : P ⟶ P'`,
  `φ ∪_{μ ≫ f} ψ = f ∘ (φ ∪_μ ψ)`.
- Cocycles multiply to cocycles and a coboundary times a cocycle is a coboundary, so `∪_μ`
  descends to cohomology.
- In degree `(0, 0)`, `∪_μ` is `(m, n) ↦ μ(m ⊗ n)` on invariants.

**Checks.**

- For `G = ℤ/2`, `k = 𝔽₂` with trivial action and `x ∈ H¹(G, 𝔽₂)` the nonzero class,
  `(x ∪ x)(g, g) = 1` for the generator `g`, and `x ∪ x` is the nonzero class of `H²(G, 𝔽₂)`.
- The witness of the Conventions: on `ℤ²` the product of the two projections pairs to `+1` with
  `[e₁|e₂] − [e₂|e₁]`; the convention with the factor `(−1)^{pq}` gives `−1`.
- A model omitting the action `(g₁⋯g_p)·` on the second factor does not send cocycles to
  cocycles: for `G = ℤ`, `M = ℤ` trivial, `N = P = ℤ[ℤ]` with `μ` the scalar multiplication,
  `φ = id` and the cocycle `ψ` with `ψ(1) = 1`, its coboundary at `(1, 1, 1)` is `2(t − 1) ≠ 0`.

### 4.2 Identities

Prove that `∪` is unital (`1 ∈ H⁰(G, k)` with the unitor), associative for compatible pairings
(`μ ∘ (μ₁₂ ⊗ 1) = ν ∘ (1 ⊗ ν₂₃)` up to the associator gives `(x ∪ y) ∪ z = x ∪ (y ∪ z)`), graded
commutative (`x ∪_μ y = (−1)^{pq} y ∪_{μ'} x` with `μ'` the composite of `μ` with the braiding), and
natural for compatible pairs `f : G' →* G` with coefficient maps commuting with the pairings; in
particular for restriction to any subgroup, inflation from any quotient, and coefficient maps
(MilneCFT Ch. II Prop. 1.39(a), (b), (c), (e), pp. 73–74). Associativity and naturality hold on
cochains; graded commutativity holds in cohomology, by the uniqueness of 4.3. *Needs:* 4.1, 4.3.

**Checks.**

- For `G` trivial, `∪` is `μ` in degree `0` and there is nothing in positive degrees.
- On `H*(ℤ/2, 𝔽₂)` graded commutativity is commutativity, and `x² ≠ 0` for `x` of degree `1`; on
  `H*(ℤ², ℤ)`, `x ∪ y = −y ∪ x` for the two projections, by the witness of the Conventions.
- Graded commutativity fails on cochains: for `ℤ²` the cochains `x ∪ y` and `−y ∪ x` differ at
  `(e₁, e₂)` (values `1` and `0`), and are cohomologous.

### 4.3 Connecting maps and uniqueness

Prove that for a short exact sequence `0 → M' → M → M'' → 0` whose tensor product with `N` is short
exact, and compatible pairings, `δx'' ∪ y = δ(x'' ∪ y)`; and for `0 → N' → N → N'' → 0` whose
tensor product with `M` is short exact, `x ∪ δy'' = (−1)^p δ(x ∪ y'')` (MilneCFT Ch. II Prop. 1.38(c),
(d), p. 73). Prove that the cup product on the pairings `𝟙 : M ⊗ N ⟶ M ⊗ N` is the unique family of
bilinear maps natural in `M` and `N`, equal to the product of invariants in degree `(0, 0)`, and
satisfying these two rules for the coinduction sequences `0 → M → Coind M → Coind M / M → 0`, which
stay exact after tensoring because they are split over `k` (MilneCFT Ch. II Prop. 1.38, p. 73).
*Needs:* 4.1; Tau Ceti `Rep.dimensionShiftUp`.

**Checks.**

- The exactness hypothesis is used: for `k = ℤ`, `0 → ℤ →2 ℤ → ℤ/2 → 0` tensored with `N = ℤ/2`
  is not exact, and the rule cannot be stated for it.
- In bidegree `(0, 0)` the rule says `δ(m'') ∪ n = δ(m'' ⊗ n)` for `m'' ∈ (M'')^G`, the definition of
  the connecting map applied to `μ`.
- The family `(−1)^{pq} x ∪ y` (the convention of Loh19 Outlook 3.2.28) satisfies
  `x ∪ δy = δ(x ∪ y)` and `δx ∪ y = (−1)^q δ(x ∪ y)`; it agrees with `∪` in bidegrees `(0, q)` and
  `(p, 0)` and is its negative on `H¹(ℤ², ℤ) × H¹(ℤ², ℤ)`. The left rule excludes it.

### 4.4 Diagonal approximations

Define a *diagonal approximation* of a projective resolution `P` of `k` as a chain map
`Δ : P ⟶ P ⊗ P` of complexes of representations (diagonal action) lifting the isomorphism
`k ≅ k ⊗ k`. Prove that the Alexander–Whitney map
`(g₀, …, gₙ) ↦ Σ_{p+q=n} (g₀, …, g_p) ⊗ (g_p, …, gₙ)` is one on `Rep.standardResolution`, that any
two diagonal approximations of resolutions are chain homotopic after the comparison maps, and that
`(φ ∪_μ ψ) = μ ∘ (φ ⊗ ψ) ∘ Δ` on `Hom_G(P, −)` computes `∪_μ` for every `P` and `Δ` (Brown82
Ch. V; HS53 Ch. II §1, pp. 118–119 for the cochain formula). *Needs:* 4.1; Mathlib
`Rep.standardResolution`, `groupCohomologyIso`.

- A diagonal approximation exists for every projective resolution and is unique up to chain
  homotopy; the comparison theorem gives the homotopy.
- The cup product computed with `(P, Δ)` is independent of the choice and equal to 4.1 through
  `groupCohomologyIso`.

**Checks.**

- For `G` trivial and `P = k` in degree `0`, `Δ` is the unitor.
- For `G = ℤ/2` and `𝔽₂`, the cup product computed with the Alexander–Whitney map on the standard
  resolution and with any diagonal approximation of the periodic resolution (Loh19 Prop. 1.6.11,
  p. 48) both give `x² ≠ 0` for the nonzero `x ∈ H¹`.
- The map `(g₀, …, gₙ) ↦ (g₀, …, gₙ) ⊗ (g₀, …, gₙ)` raises degree from `n` to `2n` and is not a
  diagonal approximation.

### 4.5 The projection formula

Prove that for `H ≤ G` of finite index, `x ∈ Hᵖ(H, M)` and `y ∈ H^q(G, N)`,
`cor(x ∪ res y) = cor(x) ∪ y` and `cor(res y ∪ x) = y ∪ cor(x)`, for any pairing `μ`, with
`TauCeti.groupCohomology.corestriction` (MilneCFT Ch. II Prop. 1.39(d), p. 74). Route: degree `0`
by the norm formula, then dimension shifting with 4.3 and Tau Ceti's `δ_comp_corestriction`.
*Needs:* 4.2, 4.3; Tau Ceti `TauCeti.groupCohomology.corestriction`,
`TauCeti.groupCohomology.δ_comp_corestriction`.

**Checks.**

- For `H = G`, both sides are `x ∪ y`.
- For `x = res z`, the formula gives `cor(res(z ∪ y)) = [G : H] (z ∪ y)`, consistent with
  `map_subtype_id_comp_corestriction`.
- For finite `G` it agrees through 4.7(a) with `TauCeti.TateCohomology.cup_projection`.

### 4.6 Cap product and evaluation

Define, for `μ : M ⊗ N ⟶ P`, the cap product `∩ : Hᵖ(G, M) ⊗ Hₙ(G, N) → Hₙ₋ₚ(G, P)` (zero for
`p > n`) through a diagonal approximation (4.4), and the evaluation pairing
`⟨−, −⟩ : Hⁿ(G, Hom_k(M, A)) ⊗ Hₙ(G, M) → A` for a `k`-module `A` with trivial action, as the cap
product with evaluation followed by `H₀(G, A) = A` (Brown82 Ch. V). *Needs:* 4.4, 4.2; Tau Ceti
`TauCeti.groupHomology.transfer`.

- `1 ∩ z = z`, `(x ∪ y) ∩ z = x ∩ (y ∩ z)` for compatible pairings, and naturality in coefficients.
- Projection formula for `f : G' →* G`: `f_*(f^*x ∩ z) = x ∩ f_*z`.
- Finite index: for `H ≤ G` of finite index, `tr(y ∩ z) = res y ∩ tr z` and
  `cor(x ∩ tr z) = cor(x) ∩ z`, with `tr = TauCeti.groupHomology.transfer`, the second `cor`
  homological and the first cohomological.
- `⟨x ∪ y, z⟩ = ⟨x, y ∩ z⟩`, and for `M = k` the evaluation is the second map of the cohomological
  universal coefficient sequence of 5.3.

**Checks.**

- For `G = ℤ/2` and `𝔽₂`, the evaluation `H¹(G, 𝔽₂) ⊗ H₁(G, 𝔽₂) → 𝔽₂` is a perfect pairing of
  one-dimensional spaces.
- In degree `p = n = 0`, `x ∩ z = [μ(x ⊗ n)]` for `x ∈ M^G`, `z = [n] ∈ N_G`.
- The degree-`0` case of the finite-index formula: for `x ∈ M^H` and `z = [n]`, both sides of
  `cor(x ∩ tr z) = cor(x) ∩ z` are `Σ_{gH ∈ G/H} [μ(g·x ⊗ n)]`, because the inverses of
  representatives of `H\G` represent `G/H`; for `G` trivial both sides are `[μ(x ⊗ n)]`.

### 4.7 Agreement with the library's other cup products

Prove:

- **(a) Tate.** For `[Fintype G]` and `p, q ≥ 1`, the isomorphisms
  `TateCohomology.isoGroupCohomology` carry the cup product of 4.2 for `𝟙 : M ⊗ N ⟶ M ⊗ N` to
  `TauCeti.TateCohomology.cup M N p q (p + q)`; in degree `0` the quotient `H⁰ → Ĥ⁰` intertwines
  them. Route: both satisfy the axioms of 4.3 in positive degrees.
- **(b) Discrete groups.** For `G` with the discrete topology and discrete coefficients, the
  isomorphisms `Θ` of 1.5 carry `TauCeti.TopPairing.cup` of a pairing to the cup product of 4.2
  of the same pairing.
- **(c) Profinite groups.** For profinite `G` and discrete `M, N`, under the finite-quotient
  colimit `TauCeti.ContCohomology.continuousFiniteQuotientColimit` (ProfiniteCohomology §10.1) and
  `Θ` for each finite quotient `G ⧸ U`, `TauCeti.TopPairing.cup` is the colimit of the cup
  products of 4.2 on the groups `G ⧸ U` with coefficients `M^U, N^U`.

The abstract group cohomology of a profinite group is not compared with its continuous cohomology.
*Needs:* 1.5, 4.2, 4.3; Tau Ceti `TauCeti.TateCohomology.cup`, `TauCeti.TopPairing.cup`,
`TauCeti.ContCohomology.continuousFiniteQuotientColimit`; Mathlib `TateCohomology.isoGroupCohomology`;
ProfiniteCohomology §10.1 and Layer 12.

**Checks.**

- For `G = ℤ/2`, both cups send `(x, x)` to the nonzero class of `H²(G, 𝔽₂) = Ĥ²(G, 𝔽₂)`.
- In bidegree `(0, q)` with `q ≥ 1` the Tate cup uses `Ĥ⁰ = M^G / N_G M`: an element of the norm
  image multiplies to zero in `Ĥ^q`, as it does in `H^q` by the projection formula; the comparison
  in degree `0` goes through the quotient, not an isomorphism.
- For `G = ∏_ℕ ℤ/p` with the product topology, `H¹_cont(G, 𝔽_p) = ⊕_ℕ 𝔽_p` is countable while
  the abstract `H¹(G, 𝔽_p) = Hom(G, 𝔽_p)` is uncountable; (c) compares the continuous cup with the
  finite quotients only.

### Examples

`H*(ℤ/2, 𝔽₂) = 𝔽₂[x]` with `x` in degree `1`, and `H*(ℤ², ℤ) = Λ(x, y)`; the cap product with the
fundamental class `[e₁|e₂] − [e₂|e₁]` of `ℤ²` sends `x ∪ y` to `1 ∈ H₀`.

### Dependencies

Layers 1–2; Tau Ceti's corestriction, transfer, Tate and continuous cups and finite-quotient
colimit; ProfiniteCohomology §10.1 and Layer 12.

---

## Layer 5: products of groups and abelian groups

### 5.1 The Künneth theorem in homology

Prove, for groups `G, H : Type u`, `M : Rep k G`, `N : Rep k H` and `M ⊠ N` the tensor product of
`Res_{pr₁} M` and `Res_{pr₂} N` in `Rep k (G × H)`, that the inhomogeneous chains satisfy a natural
homotopy equivalence `C(G; M) ⊗_k C(H; N) ≃ C(G × H; M ⊠ N)` of chain complexes of `k`-modules:
the tensor product of the standard resolutions is a projective resolution of `k` over `G × H`,
because each is contractible over `k` (Loh19 proof of Cor. 3.2.23, p. 136). Define the natural cross
product `× : H_p(G, M) ⊗_k H_q(H, N) → H_{p+q}(G × H, M ⊠ N)`. Prove that if `k` has global
dimension at most one and `N` is projective over `k`, then
`0 → ⊕_{p+q=n} H_p(G, M) ⊗ H_q(H, N) → Hₙ(G × H, M ⊠ N) → ⊕_{p+q=n−1} Tor₁^k(H_p(G, M), H_q(H, N)) → 0`
is exact, and split (not naturally) when also `M` is projective over `k`; and that over a field the
cross product is an isomorphism (Loh19 Thm. 3.2.22 and Cor. 3.2.23, pp. 135–136; Brown82 Ch. V).
*Needs:* Mathlib `Rep.standardResolution`, `groupHomologyIso`; Tau Ceti
`HomologicalComplex.homologyKunnethShortComplex_shortExact`, `HomologicalComplex.homologyKunneth`.

- The cross product is natural in compatible pairs on both factors and bilinear.
- It is associative and graded commutative under `G × H ≅ H × G`, with the sign `(−1)^{pq}`.

**Checks.**

- `H₂(ℤ/2 × ℤ/2, ℤ) = ℤ/2`: the tensor terms give `H₁ ⊗ H₁ = ℤ/2` and the `Tor` terms in total
  degree `1` vanish.
- `H₃(ℤ/2 × ℤ/2, ℤ) = (ℤ/2)³`: two tensor terms `H₃ ⊗ H₀`, `H₀ ⊗ H₃` and one `Tor₁(H₁, H₁)`; the cross
  product alone is not surjective.
- `Hₙ(ℤ/p × ℤ/p, 𝔽_p) = 𝔽_p^{n+1}` (Loh19 Example 3.2.25, p. 137).

### 5.2 The cross product in cohomology

Define `x × y = pr₁^* x ∪ pr₂^* y` for `x ∈ Hᵖ(G, M)`, `y ∈ H^q(H, N)` with the pairing
`Res M ⊗ Res N ⟶ M ⊠ N`. Prove that for a field `k`, trivial coefficients `k`, and `H` such that
`H_q(H, k)` is finite-dimensional for every `q ≤ n`, the map
`⊕_{p+q=n} Hᵖ(G, k) ⊗ H^q(H, k) → Hⁿ(G × H, k)` is an isomorphism. Route: over a field
`Hⁿ(−, k) = Hom(Hₙ(−, k), k)` by 5.3, 5.1, and `(V ⊗ W)^* = V^* ⊗ W^*` for finite-dimensional `W`;
the evaluation of `x × y` on `a × b` is `(−1)^{|y||a|}⟨x, a⟩⟨y, b⟩`. *Needs:* 4.2, 4.6, 5.1, 5.3.

**Checks.**

- `dim Hⁿ(ℤ/p × ℤ/p, 𝔽_p) = n + 1`.
- The finiteness hypothesis is used: for `G = H = ℤ^{(ℕ)}` and `k = ℚ`, `H²(G × H, ℚ)` contains
  `(ℚ^{(ℕ)} ⊗ ℚ^{(ℕ)})^*`, larger than `ℚ^ℕ ⊗ ℚ^ℕ`.
- For `H` trivial, `x × 1 = pr₁^* x` and the map is `pr₁^*`, an isomorphism.

### 5.3 Universal coefficient sequences

Prove, for `k` of global dimension at most one, any group `G` and a `k`-module `A` with trivial
action, natural short exact sequences, split but not naturally,
`0 → Hₙ(G, k) ⊗_k A → Hₙ(G, A) → Tor₁^k(Hₙ₋₁(G, k), A) → 0` and
`0 → Ext¹_k(Hₙ₋₁(G, k), A) → Hⁿ(G, A) → Hom_k(Hₙ(G, k), A) → 0`, the second map being the
evaluation of 4.6 (Loh19 Cor. 3.2.21, p. 135, and Outlook 3.2.26, p. 138). Route: the chains with
trivial coefficients are free `k`-modules, `C(G; A) = C(G; k) ⊗_k A` and
`C(G; A)^* = Hom_k(C(G; k), A)`; apply Tau Ceti's Künneth sequence with `A` in degree `0`, and
`TauCeti.ChainComplex.extToHomology` with `TauCeti.ChainComplex.exact_extToHomology_kronecker`.
*Needs:* 4.6; Tau Ceti `HomologicalComplex.homologyKunnethShortComplex_shortExact`,
`TauCeti.ChainComplex.extToHomology`, `TauCeti.ChainComplex.exact_extToHomology_kronecker`,
`TauCeti.ChainComplex.extToHomology_injective`.

**Checks.**

- `H¹(ℤ/2, 𝔽₂) = Hom(ℤ/2, 𝔽₂)` and `H²(ℤ/2, 𝔽₂) = Ext¹(ℤ/2, 𝔽₂) = 𝔽₂` for `k = ℤ`.
- For a field `k` the `Tor` and `Ext` terms vanish and `Hⁿ(G, A) = Hom(Hₙ(G, k), A)`.
- `H₂(ℤ/2, ℤ/2) = H₂(ℤ/2, ℤ) ⊗ ℤ/2 ⊕ Tor(H₁(ℤ/2, ℤ), ℤ/2) = 0 ⊕ ℤ/2`; the sequence without the
  `Tor` term would give `0`.

### 5.4 The Pontryagin ring of an abelian group

Define, for an abelian group `A` (`CommGroup A`, in `Type u`), the Pontryagin product on
`H•(A, k)` (trivial coefficients) as the cross product of 5.1 followed by the map induced by the
multiplication `A × A →* A`. Prove that it makes `⊕ₙ Hₙ(A, k)` a graded-commutative, associative,
unital `k`-algebra, natural in `A`, in which degree-one classes square to zero; that the
resulting algebra map `ψ : Λ_k(A ⊗ k) → H•(A, k)` extending `H₁(A, k) ≅ A ⊗ k` is an isomorphism in
degrees `≤ 2` for `k = ℤ` (so `H₂(A, ℤ) ≅ Λ²A`), in all degrees for torsion-free `A`, and in all
degrees when `k` is a `ℚ`-algebra; and that for a field `k` the cross product
`H•(A, k) ⊗ H•(B, k) ≅ H•(A × B, k)` is an isomorphism of graded algebras, so that for finitely
generated `A` the algebra is computed from the cyclic factors (Brown82 Ch. V). Routes: for
torsion-free `A`, Künneth for `ℤⁿ` from `H•(ℤ, k) = Λ(k)` (3.6) and the colimit over finitely
generated subgroups; for a `ℚ`-algebra, the torsion subgroup has trivial positive-degree
homology; in degree `2`, Künneth for finitely generated `A` (`Λ²(A ⊕ B) = Λ²A ⊕ Λ²B ⊕ A ⊗ B`)
and colimits. *Needs:* 5.1, 3.6; Mathlib `groupHomology` of finite cyclic groups
(`RepresentationTheory/Homological/GroupHomology/FiniteCyclic.lean`); Tau Ceti
`groupHomology.exists_map_subtype_eq` and `TauCeti.groupHomology.isZero_groupHomology_of_directed`
(`…/GroupHomology/DirectedUnion.lean`).

**Checks.**

- `H₂(ℤ/2 × ℤ/2, ℤ) = Λ²(ℤ/2 × ℤ/2) = ℤ/2`, and `H₂(ℤ/n, ℤ) = Λ²(ℤ/n) = 0`.
- `H•(ℤⁿ, ℤ) ≅ Λ(ℤⁿ)`, with ranks `C(n, i)`, as for the torus in AlgebraicTopology §5.4.
- In degree `3`, `Λ³(ℤ/2) = 0` while `H₃(ℤ/2, ℤ) = ℤ/2`: the restriction to degrees `≤ 2` for
  `k = ℤ` is needed.

### Examples

`H•(ℤ/2 × ℤ/2, 𝔽₂)` is the tensor product of two divided power algebras on degree-one generators;
`H•(ℤ/2 × ℤ/2, ℚ) = ℚ`.

### Dependencies

Layers 3–4; Tau Ceti's Künneth and universal coefficient sequences; Mathlib's finite cyclic
computations.

---

## Layer 6: group extensions

Throughout, `N ◁ G`, `Q = G ⧸ N` and `M : Rep k G`; `Q` acts on `Hⁿ(N, M)` and `Hₙ(N, M)` by 1.2.

### 6.1 Normalized cochains and the extension filtration

Define the normalized cochains `C̄ⁿ(G, M) ⊂ Cⁿ(G, M)`, those vanishing when some argument is `1`,
and prove that they form a subcomplex whose inclusion is a quasi-isomorphism (HS53 line 368–379;
the dual of Mathlib's deformation retraction of the alternating face complex onto the normalized
Moore complex, applied to the standard resolution). Define the decreasing filtration
`A_j ⊂ C̄(G, M)`: `A_j ∩ C̄ⁿ = C̄ⁿ` for `j ≤ 0`; for `0 < j ≤ n`, the cochains vanishing whenever
`n − j + 1` of the arguments lie in `N`; `0` for `j > n` (HS53 Ch. II §1, p. 118). Prove that each
`A_j` is a subcomplex, that the filtration is finite in each degree (`A_0 = C̄`,
`A_{n+1} ∩ C̄ⁿ = 0`), multiplicative (`A_r ∪ B_s ⊂ C_{r+s}` for a pairing), and natural for
morphisms of pairs `(G', N') → (G, N)`; and that the second filtration `A*_j` (cochains depending
only on the first `n − j` arguments and the cosets mod `N` of the last `j`) has the same spectral
sequence from `E₁` on (HS53 Ch. II §1 Prop. 1 and Lemma 1, pp. 119–121). *Needs:* Mathlib
`groupCohomology.cochainsFunctor`,
`AlgebraicTopology.DoldKan.homotopyEquivNormalizedMooreComplexAlternatingFaceMapComplex`,
`AlgebraicTopology.inclusionOfMooreComplexMap`; Tau Ceti `CochainComplex.filtrationFunctor`.

**Checks.**

- For `N = 1`, a nonzero normalized cochain has no argument equal to `1`, so
  `A_j ∩ C̄ⁿ = C̄ⁿ` for `j ≤ n`: the filtration is the filtration by degree, `E₁` is the row
  `q = 0` with `E₁^{p,0} = C̄^p(G, M)`, and `E₂^{p,0} = Hᵖ(G, M)`.
- For `N = G`, every argument lies in `N`, so `A_j ∩ C̄ⁿ = 0` for `j > 0`, and the spectral
  sequence is the column `p = 0` with `E₁^{0,q} = E₂^{0,q} = H^q(G, M)`.
- For `G = ℤ/4`, `N = 2ℤ/4` and `n = 1`, `A_1 ∩ C̄¹` is the normalized cochains with `f(2) = 0`,
  while `A*_1 ∩ C̄¹` also requires `f(1) = f(3)`: the inclusion `A*_1 ⊂ A_1` is strict, and only the
  spectral sequences agree from `E₁` on.

### 6.2 The cohomological Hochschild–Serre spectral sequence

Prove that the spectral sequence of the filtration `(A_j)` (Tau Ceti's `CochainComplex.spectralSequence`
of `CochainComplex.filtrationFunctor`) has `E₁^{p,q} ≅ C̄^p(Q, H^q(N, M))` through restriction of
the first `q` arguments to `N` (HS53 Ch. II §2 Thm. 1, p. 121, and §5 Prop. 3, p. 125), with `d₁`
equal to `(−1)^q` times the coboundary (HS53 Ch. II §4 Thm. 2, p. 125), so that
`E₂^{p,q} ≅ Hᵖ(Q, H^q(N, M)) ⇒ H^{p+q}(G, M)`, converging with
`E_∞^{p,q} = F^pH^{p+q}/F^{p+1}H^{p+q}` (Tau Ceti `CochainComplex.filtrationAbutmentIso`,
`CochainComplex.filtrationSpectralSequencePageXIsoGradedOfFinite`). Prove naturality for morphisms
of extensions `(G', N') → (G, N)` with compatible coefficient maps (HS53 Ch. I §7 Prop. 7, p. 117,
for the existence; Loh19 Thm. 3.2.12(2) and Remark 3.2.14, pp. 123–125). *Needs:* 1.2, 6.1; Tau Ceti
`CochainComplex.spectralSequence`, `CochainComplex.spectralSequenceFirstPageXIsoCokernel`,
`CochainComplex.spectralSequence_first_page_d_eq`, `CochainComplex.filtrationAbutmentIso`,
`CochainComplex.filtrationSpectralSequencePageXIsoGradedOfFinite`, `CochainComplex.filtrationFunctorMap`.

**Checks.**

- `N = 1`: `E₂^{p,q} = 0` for `q > 0` and `E₂^{p,0} = Hᵖ(G, M)`; `N = G`: `E₂^{p,q} = 0` for
  `p > 0` and `E₂^{0,q} = H^q(G, M)`.
- For `G = S₃`, `N = A₃`, `M = 𝔽₃`: `E₂^{p,q} = Hᵖ(ℤ/2, H^q(A₃, 𝔽₃)) = 0` for `p > 0` (order prime
  to `3`), and `E₂^{0,q}` is the invariants of `ℤ/2` acting on `H^q(A₃, 𝔽₃) = 𝔽₃` by `(−1)^{⌈q/2⌉}`;
  so `H^q(S₃, 𝔽₃)` is `𝔽₃` for `q ≡ 0, 3 mod 4` and `0` otherwise.
- For `G = ℤ/4 ⊃ N = 2ℤ/4` and `𝔽₂`, `E₂^{p,q} = 𝔽₂` for all `p, q ≥ 0` while
  `Hⁿ(ℤ/4, 𝔽₂) = 𝔽₂`: the spectral sequence does not degenerate at `E₂`, and `d₂` is the
  transgression of 6.6.

### 6.3 The homological Hochschild–Serre spectral sequence

Define the complex `C_N(M) = (P ⊗ M)_N` of representations of `Q`, for `P = Rep.standardResolution`
(through `Rep.quotientToCoinvariantsFunctor`), and prove that `Hₙ(Q; C_N(M)) ≅ Hₙ(G, M)` (its terms
are induced from the trivial subgroup of `Q`, so the augmented rows are exact:
`HomologicalComplex₂.quasiIso_totalAugmentation_of_rows`) and `H_q(C_N(M)) ≅ H_q(N, M)` as
representations of `Q`. The second sequence of 2.3 is then the natural spectral sequence
`E²_{p,q} = H_p(Q, H_q(N, M)) ⇒ H_{p+q}(G, M)` (Loh19 Thm. 3.2.12(1), p. 123; HS53 line 355–362).
*Needs:* 1.2, 2.3; Mathlib `Rep.quotientToCoinvariantsFunctor`, `Rep.standardResolution`;
Tau Ceti `HomologicalComplex₂.quasiIso_totalAugmentation_of_rows`,
`groupHomology.isZero_indBot_succ`; DerivedModuleAlgebra §S.1;
`gap:homological-low-degree`.

**Checks.**

- `N = 1` and `N = G` give a single row and a single column.
- For `G = ℤ/4 ⊃ N = ℤ/2` and `M = 𝔽₂`, `E²_{p,q} = 𝔽₂` for all `p, q ≥ 0`, while
  `Hₙ(ℤ/4, 𝔽₂) = 𝔽₂`: the differential `d²` must be nonzero.
- For `G = ℤ/2 × ℤ/2 ⊃ N = ℤ/2 × 0`, all differentials vanish and
  `dim Hₙ(G, 𝔽₂) = n + 1` agrees with 5.1.

### 6.4 Edge maps

Prove that in cohomology the composite `Hⁿ(Q, M^N) = E₂^{n,0} ↠ E_∞^{n,0} ↪ Hⁿ(G, M)` is inflation
and `Hⁿ(G, M) ↠ E_∞^{0,n} ↪ E₂^{0,n} = Hⁿ(N, M)^Q ⊂ Hⁿ(N, M)` is restriction (HS53 Ch. III §1,
p. 126); and that in homology `Hₙ(N, M) → Hₙ(N, M)_Q = E²_{0,n} ↠ E^∞_{0,n} ↪ Hₙ(G, M)` is the
homological corestriction and `Hₙ(G, M) ↠ E^∞_{n,0} ↪ E²_{n,0} = Hₙ(Q, M_N)` is coinflation.
Route in homology: naturality of 6.3 for the morphisms of extensions `(N, N) → (G, N)` and
`(G, N) → (Q, 1)`. *Needs:* 6.2, 6.3; Mathlib `groupCohomology.infNatTrans`,
`groupHomology.coresNatTrans`, `groupHomology.coinfNatTrans`; `gap:homological-low-degree`.

**Checks.**

- For `N = G`, the restriction edge map is the identity of `Hⁿ(G, M)`.
- For `N = 1`, the inflation edge map is the identity.
- For `ℤ/2 ⊂ ℤ/4` and `𝔽₂`, inflation `H¹(ℤ/2, 𝔽₂) → H¹(ℤ/4, 𝔽₂)` is an isomorphism and restriction
  `H¹(ℤ/4, 𝔽₂) → H¹(ℤ/2, 𝔽₂)` is zero, as the edge maps must be.

### 6.5 Multiplicativity

Prove that for a pairing `μ : M ⊗ M' ⟶ P` the pages of 6.2 carry pairings
`E_r^{p,q} ⊗ E_r^{p',q'} → E_r^{p+p',q+q'}` for which every `d_r` is a derivation
(`d_r(u ∪ v) = d_r u ∪ v + (−1)^{p+q} u ∪ d_r v`); that on `E₂` the pairing is `(−1)^{qp'}` times the
cup product of 4.2 on `Q` with coefficients paired by the cup product on `N`; and that on `E_∞` it
is induced by the cup product on `G` with the filtration `F^p ∪ F^{p'} ⊂ F^{p+p'}` (HS53 Ch. II §5
Thm. 3 and the remark after it, p. 126; HS53 line 397–400). *Needs:* 4.2, 6.1, 6.2; Tau Ceti
`CochainComplex.filtrationFunctorMap`.

**Checks.**

- For `N = 1` the pairing on the row `q = 0` is the cup product on `G`.
- For `G = ℤ/2 × ℤ/2 ⊃ N = 0 × ℤ/2` and `𝔽₂`, `E₂ = 𝔽₂[x] ⊗ 𝔽₂[y]` with `x` from `Q` and `y` from
  `N`; the sign is invisible mod `2`, and the product is the cohomology ring of 5.2.
- The sign `(−1)^{qp'}` is visible for `G = ℤ × ℤ ⊃ N = 0 × ℤ` and `ℤ`: for `y ∈ E₂^{0,1}` and
  `x ∈ E₂^{1,0}` the formula gives `y ∪ x = −(x ∪ y)` in `E₂^{1,1} = ℤ = E_∞^{1,1} = H²(ℤ², ℤ)`, as
  graded commutativity in `H²(ℤ², ℤ)` requires; without the sign the two products would be equal.

### 6.6 Transgression

Define, for `n ≥ 1`, a class `x ∈ Hⁿ(N, M)` to be *transgressive* if some normalized cochain
`f ∈ C̄ⁿ(G, M)` restricts on `Nⁿ` to a cocycle representing `x` and has `df` inflated from a cocycle
`c ∈ C̄ⁿ⁺¹(Q, M^N)`; and the *transgression* `τ(x)` as the class of `c` in the quotient of
`Hⁿ⁺¹(Q, M^N)` identified with `E_{n+1}^{n+1,0}`. Prove that the transgressive classes are exactly
the image of `E_{n+1}^{0,n}` in `Hⁿ(N, M)`, and that `τ` is `d_{n+1}` (HS53 Ch. III §3 Prop. 1 and
the paragraph after it, pp. 128–129). Prove that for `n = 1` every class of `H¹(N, M)^Q` is
transgressive, so that `τ : H¹(N, M)^Q → H²(Q, M^N)` is defined for every group, through a
set-theoretic section `s : Q → G` with `s(1) = 1`: the cochain
`f(g) = h(s(gN)) + s(gN)·c(s(gN)⁻¹ g)` satisfies the identities of Tau Ceti's
`TauCeti.ContCohomology.IsTransgressionLift` (with `G` and `M` discrete), for a cocycle `c` on `N`
and a choice `h` of elements with `g·c(g⁻¹ ν g) − c(ν) = ν·h(g) − h(g)`. Prove that when `N` acts
trivially on `M`, `d₂ : Hᵖ(Q, Hom(N^ab, M)) → H^{p+2}(Q, M)` is `u ↦ −c ∪ u`, where
`c ∈ H²(Q, N^ab)` is the class (Conventions) of `1 → N^ab → G ⧸ [N, N] → Q → 1` and the pairing is
evaluation (HS53 Ch. III §6 Thm. 4, p. 133). *Needs:* 1.2, 4.2, 6.1, 6.2, 6.5; Tau Ceti
`TauCeti.ContCohomology.IsTransgressionLift`.

**Checks.**

- `ℤ/2 ⊂ ℤ/4` with `𝔽₂`: `τ` sends the nonzero character of `ℤ/2` to the nonzero class of
  `H²(ℤ/2, 𝔽₂)`.
- The split extension `ℤ/2 ⊂ ℤ/2 × ℤ/2`: every character of the kernel extends, and `τ = 0`.
- Sign: for `ℤ/3 ⊂ ℤ/9`, `M = 𝔽₃` and `u : 3ℤ/9 → 𝔽₃` with `u(3) = 1`, lifting `u` by
  `f(i) = ⌊i/3⌋ mod 3` gives `df(2, 1) = 0 − 1 + 0 = −1`, so `τ(u) = −[carry] = −c ∪ u`; the model
  `d₂ = +c ∪` gives the other generator of `H²(ℤ/3, 𝔽₃) = 𝔽₃`. This agrees with the sign Check of
  ProfiniteCohomology §5.5.

### 6.7 Exact sequences of low degree

Prove:

- **Cohomological five-term sequence.** `0 → H¹(Q, M^N) → H¹(G, M) → H¹(N, M)^Q →τ H²(Q, M^N) → H²(G, M)`
  is exact, with inflation, restriction, the transgression of 6.5 and inflation (HS53 Ch. III §4,
  remark after Thm. 2, p. 130).
- **Degree `m`.** For `m ≥ 1`, if `H^q(N, M) = 0` for `0 < q < m`, then
  `0 → H^m(Q, M^N) → H^m(G, M) → H^m(N, M)^Q →τ H^{m+1}(Q, M^N) → H^{m+1}(G, M)` is exact and the
  transgressive classes are all of `H^m(N, M)^Q` (HS53 Ch. III §4 Thm. 2, p. 129). This extends
  `TauCeti.groupCohomology.HInfRes_exact` by the transgression term.
- **Homological five-term sequence.**
  `H₂(G, M) → H₂(Q, M_N) → H₁(N, M)_Q → H₁(G, M) → H₁(Q, M_N) → 0` is exact, with coinflation, `d²`,
  corestriction and coinflation (Loh19 proof of Thm. 3.2.18, pp. 129–131). Its last three terms
  are Mathlib's `groupHomology.H1CoresCoinf`.

*Needs:* 6.2, 6.3, 6.4, 6.6; Tau Ceti `TauCeti.groupCohomology.HInfRes_exact`; Mathlib
`groupHomology.H1CoresCoinf`; `gap:homological-low-degree`.

**Checks.**

- `N = 1` and `N = G`: the sequences reduce to isomorphisms between the outer terms.
- `G = S₃`, `N = A₃`, `M = 𝔽₃`: `0 → 0 → H¹(S₃, 𝔽₃) → H¹(A₃, 𝔽₃)^{ℤ/2} = 0`, so `H¹(S₃, 𝔽₃) = 0`.
- The hypothesis `m ≥ 1` is needed: at `m = 0` the first three terms are `M^G → M^G → M^G` with
  both maps the identity, and exactness at the middle term fails whenever `M^G ≠ 0`, for instance
  for `M = ℤ`.

### 6.8 Hopf's formula and central extensions

Prove that for a free group `F` (`FreeGroup S`), `R ◁ F` and `G = F ⧸ R`,
`H₂(G, ℤ) ≅ (R ⊓ ⁅F, F⁆) ⧸ ⁅F, R⁆`, naturally in presentations (Loh19 Thm. 1.5.1, p. 30, and
Thm. 3.2.18, p. 129). Route: the homological five-term sequence of 6.7 with `H₂(F, ℤ) = 0` (3.6),
`H₁(R, ℤ)_G = R/⁅F, R⁆` and `H₁(F, ℤ) = F^ab`. Prove that for a central extension
`1 → A → E → G → 1` (Mathlib's `GroupExtension`), `H₂(E, ℤ) → H₂(G, ℤ) → A → E^ab → G^ab → 0` is
exact. *Needs:* 3.6, 6.7; Mathlib `FreeGroup`, `groupHomology` in degree `1`.

**Checks.**

- `G = ℤ/n` with `F = ℤ`, `R = nℤ`: `R ∩ [F, F] = 0`, so `H₂(ℤ/n, ℤ) = 0`.
- `G = ℤ²` with `F` free on `a, b`: `R = [F, F]`, and `[F, F]/[F, [F, F]] ≅ ℤ` is generated by
  `[a, b]`, so `H₂(ℤ², ℤ) = ℤ`.
- For `Q₈` as a central extension of `(ℤ/2)²` by `ℤ/2`, the sequence
  `H₂(Q₈) → H₂((ℤ/2)²) = ℤ/2 → ℤ/2 → Q₈^ab = (ℤ/2)² → (ℤ/2)² → 0` forces
  `ℤ/2 → ℤ/2` to be an isomorphism and so `H₂(Q₈, ℤ) → ℤ/2` to be zero, consistent with
  `H₂(Q₈, ℤ) = 0`.

### 6.9 Comparison with the profinite theory for finite groups

Prove that for finite `G` with the discrete topology, the five-term sequence of 6.7 corresponds
under `Θ` (1.5) and the explicit comparisons of ProfiniteCohomology §3.1 to the explicit five-term
sequence of ProfiniteCohomology §5.5, and that the transgression of 6.6 is
`TauCeti.ContCohomology.transgression` under `TauCeti.ContCohomology.explicitH1IsoGroupCohomology`
and `TauCeti.ContCohomology.explicitH2IsoGroupCohomology`. *Needs:* 1.5, 6.6, 6.7;
ProfiniteCohomology §3.1, §5.5; Tau Ceti `TauCeti.ContCohomology.transgression`,
`TauCeti.ContCohomology.fiveTerm_exact_H1N`.

**Checks.**

- The `ℤ/3 ⊂ ℤ/9` sign Check gives `−[carry]` on both sides.
- For `N = G` both transgressions land in `H²(1, −) = 0`.
- For a finite group the section of `G → G/N` is continuous, so the profinite and discrete lifts
  coincide as functions.

### Examples

For `ℤ/2 ⊂ ℤ/4` with `𝔽₂`, `d₂ : E₂^{p,1} → E₂^{p+2,0}` is cup with the nonzero class of
`H²(ℤ/2, 𝔽₂)` (6.6), an isomorphism for every `p`; so `E₃` is the column `p = 0` and the row
`q = 0` in degrees `≤ 1`, and `Hₙ(ℤ/4, 𝔽₂) = 𝔽₂`.

### Dependencies

Layers 1–4 and 3.6; Tau Ceti's filtered spectral sequences, inflation–restriction and
transgression lift; DerivedModuleAlgebra §S.1 with `gap:homological-low-degree`; ProfiniteCohomology
§§3.1, 5.5 for 6.9.

---

## Layer 7: subgroups of finite index

### 7.1 The double coset formula

Prove that for any group `G`, `H ≤ G` of finite index, any `K ≤ G`, `M : Rep k G` and `n ≥ 0`,
`res^G_K ∘ cor^G_H = Σ_{KgH ∈ K\G/H} cor^K_{K ∩ gHg⁻¹} ∘ c_g ∘ res^H_{H ∩ g⁻¹Kg}` on `Hⁿ(H, M)`,
each summand independent of the representative `g` (by 1.1); there are finitely many double cosets
and each `K ∩ gHg⁻¹` has finite index in `K`. Prove the homological form
`tr^G_H ∘ cor^G_K = Σ_{KgH} cor^H_{H ∩ g⁻¹Kg} ∘ c_{g⁻¹} ∘ tr^K_{K ∩ gHg⁻¹}` on `Hₙ(K, M)`. Route:
through Shapiro's lemma corestriction is induced by the trace `Coind_H^G M → M`, and the restriction
to `K` of `Coind_H^G M` decomposes over `K\G/H` (Brown82 Ch. III §§8–9). *Needs:* 1.1, 1.4;
Tau Ceti `TauCeti.groupCohomology.corestriction`, `TauCeti.groupHomology.transfer`; Mathlib
`DoubleCoset.Quotient`.

**Checks.**

- For finite `G` with the discrete topology, the formula agrees under `Θ` (1.5) with
  `TauCeti.ContinuousCohomology.corestriction_mackey`, and with ProfiniteCohomology §6.4's `S₃`
  Check: for `H = K = ⟨(12)⟩ ≤ S₃` there are two double cosets, the nontrivial one contributing a
  map through `Hⁿ(1, M) = 0`, so `res ∘ cor = id` on `Hⁿ(⟨(12)⟩, M)` for `n > 0`.
- `K = 1`, degree `0`: `res^G_1 cor^G_H(m) = Σ_{gH ∈ G/H} g·m`.
- `K = H ◁ G`: `res^G_H cor^G_H = Σ_{gH ∈ G/H} c_g`.
- Degree `0` in homology: the elements `g⁻¹s`, `s ∈ (K ∩ gHg⁻¹)\K`, run over `H\G` as `KgH` runs
  over `K\G/H`, as the transfer requires; `c_g` in place of `c_{g⁻¹}` would land in the homology
  of `gKg⁻¹ ∩ g²Hg⁻²`, which is not a subgroup of `H` in general.

### 7.2 Stable elements

Let `G` be finite, `p` prime and `P` a Sylow `p`-subgroup. Call `z ∈ Hⁿ(P, M)` *stable* if
`res^P_{P ∩ gPg⁻¹} z = res^{gPg⁻¹}_{P ∩ gPg⁻¹}(c_g z)` for every `g ∈ G`. Prove that for `n ≥ 1`
restriction maps `Hⁿ(G, M)(p)` isomorphically onto the stable classes; that for `n ≥ 1`
homological corestriction maps the classes `z ∈ Hₙ(P, M)` with
`tr^P_{P ∩ gPg⁻¹} z = tr^{gPg⁻¹}_{P ∩ gPg⁻¹}(c_g z)` for all `g` isomorphically onto `Hₙ(G, M)(p)`;
and that in Tate cohomology restriction maps `Ĥⁿ(G, M)(p)` isomorphically onto the stable classes of
`Ĥⁿ(P, M)` for every `n ∈ ℤ`. If `P` is abelian, the stable classes are the invariants of `N_G(P)`
acting by conjugation (Brown82 Ch. III §10). Route: injectivity is Tau Ceti's Sylow theorem; for a
stable `z`, 7.1 gives `res cor z = [G : P] z` with `[G : P]` prime to `p` (MilneCFT Ch. II Prop. 1.30
and Cor. 1.33, pp. 70–71; Hutchinson13 §3, p. 11, Hutchinson13 line 482–491). *Needs:* 1.1, 7.1;
Tau Ceti `TauCeti.groupCohomology.eq_zero_of_pow_nsmul_eq_zero_of_map_sylow_eq_zero`; ClassFieldTheory
Layer 0 (Tate restriction and corestriction); Mathlib `Sylow`.

**Checks.**

- For `G = P` every class is stable and the statement is `Hⁿ(P, M)(p) = Hⁿ(P, M)`.
- `G = S₃`, `p = 3`, `P = A₃` normal: `ℤ/2` acts on `H²(A₃, ℤ) = ℤ/3` by `−1` and on
  `H⁴(A₃, ℤ) = ℤ/3` by `+1`, so `H²(S₃, ℤ)(3) = 0` and `H⁴(S₃, ℤ)(3) = ℤ/3`, consistent with
  `H²(S₃, ℤ) = ℤ/2` and `H⁴(S₃, ℤ) = ℤ/6`.
- Degree `0` is excluded: for `M = ℤ`, `H⁰(G, ℤ)(p) = 0` while every element of `H⁰(P, ℤ) = ℤ` is
  stable.

### Examples

For `G = A₄`, `p = 2`, `P = V₄` normal with `N_G(P)/P = ℤ/3` permuting the three involutions,
`H¹(A₄, 𝔽₂)` is the invariants of `ℤ/3` on `Hom(V₄, 𝔽₂) = 𝔽₂²`, which are zero.

### Dependencies

Layer 1; Tau Ceti's corestriction, transfer and Sylow theorem; ClassFieldTheory Layer 0;
ProfiniteCohomology §6.4 and Tau Ceti's continuous Mackey formula for a Check.

---

## Layer 8: Tate duality and periodicity of finite groups

Throughout, `G` is finite and representations are over `ℤ`; the Tate cup product is Tau Ceti's.

### 8.1 Tate duality

Let `M : Rep ℤ G` and `M^∨ = Hom(M, ℚ/ℤ)` with the contragredient action. Prove that the Tate cup
product with the evaluation `M^∨ ⊗ M → ℚ/ℤ`, followed by
`Ĥ⁻¹(G, ℚ/ℤ) = {x ∈ ℚ/ℤ : |G|x = 0} ⊂ ℚ/ℤ`, induces isomorphisms
`Ĥⁱ(G, M^∨) ≅ Hom(Ĥ^{−1−i}(G, M), ℚ/ℤ)` for all `i ∈ ℤ`. Prove that for `M` free as an abelian
group, cup product into `Ĥ⁰(G, ℤ) = ℤ/|G|` induces `Ĥⁱ(G, Hom(M, ℤ)) ≅ Hom(Ĥ^{−i}(G, M), ℚ/ℤ)`, and
that `H^{d+1}(G, ℤ) ≅ Hom(H_d(G, ℤ), ℚ/ℤ)` for `d ≥ 1` (Brown82 Ch. VI §7; CE56 Ch. XII). Route:
degree `0` by the exactness of `Hom(−, ℚ/ℤ)`, then dimension shifting with Tau Ceti's
`cup_δ_of_flat` and `δ_cup_of_leftInverse`; the integral form from `0 → Hom(M, ℤ) → Hom(M, ℚ) → M^∨ → 0`
(exact for free `M`) and the vanishing of `Ĥ` on the uniquely divisible `Hom(M, ℚ)`. *Needs:* 4.7(a);
Tau Ceti `TauCeti.TateCohomology.cup`, `TauCeti.TateCohomology.cup_δ_of_flat`,
`TauCeti.TateCohomology.δ_cup_of_leftInverse`; ClassFieldTheory Layer 0.

**Checks.**

- `G = ℤ/2`, `M = ℤ`: `Ĥ⁰(G, ℚ/ℤ) = 0 = Hom(Ĥ⁻¹(G, ℤ), ℚ/ℤ)` and
  `Ĥ¹(G, ℚ/ℤ) = ℤ/2 = Hom(H₁(G, ℤ), ℚ/ℤ)`.
- `H²(ℤ/2, ℤ) = ℤ/2 = Hom(H₁(ℤ/2, ℤ), ℚ/ℤ)`; the corollary fails at `d = 0`:
  `H¹(G, ℤ) = 0` while `Hom(H₀(G, ℤ), ℚ/ℤ) = ℚ/ℤ`.
- Freeness is used in the integral form: for `G = ℤ/2` and `M = ℤ/2` (not free),
  `Ĥ⁰(G, Hom(M, ℤ)) = 0` while `Hom(Ĥ⁰(G, ℤ/2), ℚ/ℤ) = ℤ/2`.

### 8.2 Finite `p`-groups whose abelian subgroups are cyclic

Prove that a finite `p`-group in which every abelian subgroup is cyclic is cyclic if `p` is odd, and
cyclic or isomorphic to `QuaternionGroup (2^(s−2))` for some `s ≥ 3` if `p = 2`; and conversely that
every abelian subgroup of a cyclic or generalised quaternion group is cyclic (Loh19 Cor. 1.6.18 and
Cor. 1.6.19, p. 53, and Outlook 1.6.20, p. 54; Brown82 Ch. IV §4). Route: a non-trivial `p`-group
whose abelian subgroups are cyclic has a unique subgroup of order `p`; for odd `p` such a group is
cyclic, and for `p = 2` it is cyclic or generalised quaternion, by induction through a cyclic
subgroup of index `p`. *Needs:* Mathlib `IsPGroup`, `IsCyclic`, `QuaternionGroup`.

**Checks.**

- `Q₈`: its abelian subgroups `⟨i⟩, ⟨j⟩, ⟨k⟩, ⟨−1⟩, 1` are cyclic.
- The dihedral group of order `8` and `ℤ/p × ℤ/p` contain `ℤ/p × ℤ/p` and are excluded.
- For odd `p`, the Heisenberg group of order `p³` and exponent `p` contains `ℤ/p × ℤ/p`; there is
  no odd analogue of the quaternion groups.

### 8.3 Periodicity from cohomologically trivial resolutions

Prove that if `0 → ℤ_χ → C_n → ⋯ → C_0 → ℤ → 0` is an exact sequence of representations, with
`χ : G →* ℤˣ` and every `C_i` free as an abelian group and cohomologically trivial, then cup product
with the class `e ∈ Ĥⁿ⁺¹(G, ℤ_χ)` obtained from `1 ∈ Ĥ⁰(G, ℤ)` by the `n + 1` connecting maps is an
isomorphism `Ĥⁱ(G, M) → Ĥ^{i+n+1}(G, M ⊗ ℤ_χ)` for every `i ∈ ℤ` and every `M`; hence the cohomology
of `G` is periodic of period dividing `2(n + 1)`, and dividing `n + 1` when `χ` is trivial. Prove that
such a sequence exists when there is a bounded complex of free `ℤ[G]`-modules with homology `ℤ` in
degree `0`, `ℤ_χ` in degree `n ≥ 1` and `0` elsewhere (truncate at `n`; the boundaries in degree `n`
have a finite free resolution, hence are cohomologically trivial). This is the algebraic form of
the periodicity of a free cellular action on a finite-dimensional complex with the homology of
`Sⁿ` (Loh19 Thm. 4.3.7, p. 165, and its proof, pp. 165–167; Brown82 Ch. VI §9). *Needs:* 4.7(a);
Tau Ceti `TauCeti.TateCohomology.cup_δ_of_flat`, `TauCeti.TateCohomology.δ_cup_of_leftInverse`;
ClassFieldTheory Layer 0 (`Rep.isZero_res_of_projective`, `Rep.projective_of_isZero_res`).

**Checks.**

- `G = ℤ/m` and `0 → ℤ →N ℤG →(t−1) ℤG → ℤ → 0` (Loh19 Remark 1.6.12, p. 48): period dividing `2`.
- `G = ℤ/2`, `n = 0`: `0 → ℤ_sgn → ℤG → ℤ → 0` gives `Ĥⁱ(G, M) ≅ Ĥⁱ⁺¹(G, M ⊗ ℤ_sgn)` and period
  dividing `2`.
- `C_p × C_p` admits no such sequence, since `dim Hⁿ(C_p × C_p, 𝔽_p) = n + 1` (5.2) is unbounded.

### 8.4 Periods

Define the `p`-period of `G` with `p ∣ |G|` and `p`-periodic cohomology as the least `d > 0` such
that `Ĥ^d(G, ℤ)(p)` is cyclic of order `|G|_p`. Prove:

- **Cyclic groups.** For `G` cyclic of order `m` and a generator `g`, cup product with
  `δχ ∈ Ĥ²(G, ℤ)` (`TauCeti.TateCohomology.characterConnectingClass`, `χ(g) = 1/m`) is an
  isomorphism `Ĥⁿ(G, M) → Ĥⁿ⁺²(G, M)` for every `n ∈ ℤ` and every `M`, for every finite cyclic
  `G : Type u` (`[Group G] [IsCyclic G]`); in degree `0` it is
  `TauCeti.TateCohomology.cup_characterConnectingClass_eq_groupCohomologyπEven`, which this extends
  to all degrees. Route: `Rep.FiniteCyclicGroup.periodicIsoOfGenerator` and the compatibility of
  the Tate cup product with connecting maps.
- **Generalised quaternion groups.** For `Q_{2^s}`, `s ≥ 3`, there is `u ∈ Ĥ⁴(Q_{2^s}, ℤ)` with cup
  product an isomorphism in every degree, and the period is `4`, from a periodic resolution of
  period `4` and 8.3 (CE56 Ch. XII).
- **Swan's theorem.** For odd `p ∣ |G|` with a cyclic Sylow `p`-subgroup `P`, the `p`-period is
  `2·|N_G(P)/C_G(P)|`; the `2`-period is `2` for a nontrivial cyclic Sylow `2`-subgroup and `4` for
  a generalised quaternion one (SwanPPeriod60 Thms. 1 and 2; Hutchinson13 Thm. 3.1, p. 12,
  Hutchinson13 line 499–504). Route: 7.2 for abelian `P` (stable classes are the
  `N_G(P)`-invariants), and `N_G(P)/C_G(P)` acting faithfully on `Ĥ²(P, ℤ) ≅ P^∨` through a cyclic
  group of order dividing `p − 1`.

*Needs:* 7.2, 8.3; Tau Ceti `TauCeti.TateCohomology.characterConnectingClass`,
`TauCeti.TateCohomology.cup_characterConnectingClass_eq_groupCohomologyπEven`,
`Rep.FiniteCyclicGroup.periodicIsoOfGenerator`; Mathlib `QuaternionGroup`, `Sylow`.

**Checks.**

- `S₃`: the `3`-period is `2·|S₃/A₃| = 4` (7.2's Check: `H²(S₃, ℤ)(3) = 0`, `H⁴(S₃, ℤ)(3) = ℤ/3`)
  and the `2`-period is `2`.
- `SL₂(𝔽_q)`, `q` odd: `2`-period `4`, and `H_k(SL₂(𝔽_q), ℤ_(2))` is `ℤ_(2)/q(q² − 1)` for
  `k ≡ 3 mod 4` (Hutchinson13 Cor. 3.3, p. 12).
- The hypothesis `p ∣ |G|` is needed: for `p ∤ |G|` every `Ĥ^d(G, ℤ)(p)` is `0 = ℤ/|G|_p`, so the
  least such `d` is `1`, not `2·|N_G(1)/C_G(1)| = 2`.

### 8.5 The periodicity theorem

Prove that the following are equivalent: (a) for some `d > 0` and `u ∈ Ĥ^d(G, ℤ)`, cup product with
`u` is an isomorphism `Ĥⁿ(G, M) → Ĥⁿ⁺ᵈ(G, M)` for every `n ∈ ℤ` and every `M : Rep ℤ G`;
(b) `Ĥ^d(G, ℤ)` is cyclic of order `|G|` for some `d ≠ 0`; (c) every abelian subgroup of `G` is
cyclic; (d) every Sylow subgroup of `G` is cyclic or generalised quaternion. Prove the `p`-primary
form for a prime `p`: (a_p) cup with some `u ∈ Ĥ^d(G, ℤ)`, `d > 0`, is an isomorphism on
`p`-primary parts; (b_p) `Ĥ^d(G, ℤ)(p)` is cyclic of order `|G|_p` for some `d ≠ 0`; (c_p) every
abelian `p`-subgroup is cyclic; (d_p) a Sylow `p`-subgroup is cyclic or generalised quaternion
(Brown82 Ch. VI §9; CE56 Ch. XII; Loh19 §4.3.2, pp. 167–168). Route: (a)⇒(b) from
`Ĥ⁰(G, ℤ) = ℤ/|G|`; (b)⇒(a) since a generator has an inverse for the perfect pairing of 8.1;
(a)⇒(c) since restriction of `u` is invertible and `ℤ/p × ℤ/p` is not periodic (5.2); (c)⇔(d) by
8.2; (d)⇒(b) by 8.4 and 7.2 prime by prime. *Needs:* 5.2, 7.2, 8.1, 8.2, 8.3, 8.4; Tau Ceti
`TauCeti.TateCohomology.cup_assoc`, `TauCeti.TateCohomology.cup_res`.

**Checks.**

- `C_p × C_p` is not periodic: `dim Hⁿ(C_p × C_p, 𝔽_p) = n + 1` is unbounded, consistent with
  AlgebraicTopology §8.15.
- `SL₂(𝔽_q)` for odd `q` has generalised quaternion Sylow `2`-subgroups and cyclic odd Sylow
  subgroups, so it is periodic (Hutchinson13 Cor. 3.3, p. 12).
- The trivial group satisfies all four conditions, with every `Ĥⁿ = 0` and `u = 0`; `S₃` satisfies
  them with `d = 4`, and `A₄` fails (c) through `V₄`.

### Examples

`Q₈` acts freely on the unit quaternions `S³`; 8.3 with `n = 3` and trivial `χ` gives period dividing
`4`, and `Ĥ²(Q₈, ℤ) = (ℤ/2)²` is not cyclic of order `8`, so the period is exactly `4`.

### Dependencies

Layers 4, 5 and 7; Tau Ceti's Tate cup product, cyclic periodicity and character classes;
ClassFieldTheory Layer 0.

---

## Downstream consumers

- **SchemeKTheoryOperations** §6.7 and **HomologicalStabilityOfGeneralLinearGroups**: group
  hyperhomology and its two spectral sequences with the permutation-module form (2.1–2.3, 3.2).
- **K3BlochGroups**: §4.1 imports 2.1–2.3; §4.15 imports Layer 6; §5.2 imports 7.2, 8.1 and 8.4
  for its `finiteGroup_stableElements`, `finiteGroup_homologyDuality`, `quaternionPeriodicHomology`
  and `finiteGroup_period_fromSylow`.
- **InductionRestrictionPartII** RS.0.1: the low-degree sequence of a central extension (6.8).
- **MappingClassGroupsAndCanonicalRepresentations** §1.1: the cohomological Hochschild–Serre
  sequence and five-term sequence for discrete groups (6.2, 6.6, 6.7).
- **ModularCurvesPartII** §15.4, **AutomorphyLiftingBeyondTaylorWiles** and
  **ArithmeticLocallySymmetricSpacesPartII**: the amalgam sequence (3.6).
- **InverseGaloisAndArithmeticFundamentalGroups**: Schur multipliers through Hopf's formula (6.8).
- **ArithmeticLocallySymmetricSpaces**: equivariant homology and extensions (Layers 3 and 6).
- **NoncommutativeAndEquivariantIwasawa** §F.3 and **ArithmeticGaloisDuality** R02.2: the
  finite-group comparison of 6.9.
- A roadmap on finiteness conditions and duality groups consumes products and cap products,
  extensions, trees, stable elements and periodicity.

## References

- [HS53] G. Hochschild, J.-P. Serre, *Cohomology of group extensions*, Trans. AMS 74 (1953), 110–134.
- [Loh19] C. Löh, *Group Cohomology*, lecture notes, Universität Regensburg, 2019.
- [MilneCFT] J. S. Milne, *Class Field Theory*, course notes, version 4.03, 2020.
- [SerreArbres] J.-P. Serre, *Arbres, amalgames, SL₂*, Astérisque 46, 1977.
- [Hutchinson13] K. Hutchinson, *A Bloch–Wigner complex for SL₂*, arXiv:1107.0264v2, 2013.
- [Brown82] K. S. Brown, *Cohomology of Groups*, Graduate Texts in Mathematics 87, 1982.
- [CE56] H. Cartan, S. Eilenberg, *Homological Algebra*, Princeton, 1956.
- [SwanPPeriod60] R. G. Swan, *The p-period of a finite group*, Illinois J. Math. 4 (1960), 341–346.
