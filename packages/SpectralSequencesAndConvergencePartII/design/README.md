# Roadmap: spectral sequences and convergence, part II — the standard constructions and their products

**Summary.** SpectralSequencesAndConvergence builds, over an arbitrary abelian category, the
language in which a spectral sequence converges: limit pages, convergence structures in a set of
total degrees, morphisms of converging sequences, the comparison theorem, the classical
spectral sequence of a decreasingly filtered complex with its convergence theorems, and the
spectral sequence of an exact couple. It constructs no particular spectral sequence beyond these,
and it has no products. This Part II constructs the standard spectral sequences of homological
algebra inside that language and proves that they converge: the two spectral sequences of a double
complex for the direct-sum and the product totalisation, with the half-plane convergence theorems,
the comparison of totals and the acyclic assembly lemma; horseshoe and Cartan–Eilenberg
resolutions, the right derived functors of Mathlib's bounded-below derived category compared with
the classical ones, and the two hypercohomology spectral sequences of a left exact functor, with
their duals for right exact and contravariant functors; the composition theorem for right derived
functors and the composite-functor spectral sequence of a complex; the balancing of Tor, the
universal-coefficient, Künneth and change-of-rings spectral sequences over rings; pairings of exact
couples, filtered complexes and double complexes with the Leibniz rule on every page; and the
Bockstein spectral sequence of a torsion-free complex with its higher Bocksteins, limit page and
convergence.

## Scope and ownership

This roadmap owns:

- the product totalisation of a double complex, the column and row filtrations of both
  totalisations, the two spectral sequences of a double complex as spectral sequences of filtered
  complexes, their first and second pages in any abelian category, their convergence for finitely
  many terms on each antidiagonal and in the half-plane cases, the comparison of totals and the
  acyclic assembly lemma;
- the horseshoe lemma for injective resolutions and its relative form, the right derived functors
  `RⁿF` of Mathlib's `CategoryTheory.Functor.rightDerivedFunctorPlus` with their comparison to
  `CategoryTheory.Functor.rightDerived`, Leray's acyclicity lemma, Cartan–Eilenberg resolutions
  with their existence and the lifting of chain maps, the two hypercohomology spectral sequences
  with their independence of the resolution and their naturality, and the hyper-left-derived
  functors and hyperhomology spectral sequences obtained through opposite categories;
- the canonical transformation `R(G ∘ F) ⟶ RG ∘ RF` on `D⁺` with Grothendieck's criterion for it
  to be an isomorphism, the composite-functor spectral sequence of a complex, its low-degree
  exact sequences and its naturality in the functors, and the right exact and mixed-variance
  composites;
- the balancing of Tor in a monoidal abelian category, the universal-coefficient spectral sequences
  for Tor and Ext, the Künneth spectral sequence over a commutative ring, and the change-of-rings
  spectral sequences;
- Massey's conditions for a pairing of exact couples, pairings of filtered complexes and of double
  complexes, and the Leibniz rule and convergence of the induced pairings on pages;
- the Bockstein exact couple of a complex of `f`-torsion-free modules, its pages, higher
  Bocksteins, higher universal-coefficient sequences, limit page and convergence.

It leaves to named owners:

- **SpectralSequencesAndConvergence** (the base of this Part II): Mathlib's carrier as used there,
  cycle and boundary towers and limit pages (§§1.2–1.4), bidegree assignments and boundedness
  (§§2.1–2.2), filtered objects and convergence structures (§§3.1–3.3), finite filtrations, the
  comparison theorem and the vanishing, two-column, two-row, edge-morphism and five-term
  consequences (§§3.4–3.6), spectral objects indexed by `EInt` and their convergence (Layer 4),
  the classical spectral sequence of a decreasingly filtered complex and its convergence (§§5.1–5.4),
  exact couples, their towers and the couple of a filtered complex (§§6.1–6.3), lim, lim¹ and the
  complete convergence theorem (§§7.1, 7.4, 7.5). Every spectral sequence of this roadmap is one of
  the base's filtered-complex or exact-couple spectral sequences and carries one of its convergence
  structures; no convergence theory is restated.
- **DerivedModuleAlgebra, §S.1**: the first-quadrant double complex with its second page, abutment
  filtration, stabilisation bound, edge morphisms, five-term and extended sequences, exact-rows
  comparison and homological form. Layer 1 states the second page and convergence for an arbitrary
  double complex whose totalisation exists; on first-quadrant double complexes, read in §S.1's
  convention of anticommuting differentials through `d′ = d₁`, `d″ = (−1)^p d₂` (1.2), it is §S.1's
  statement, and the edge morphisms and low-degree sequences of double complexes are not restated.
- **DerivedModuleAlgebra, §0.2**: the derived tensor product on `D(R)` for a commutative ring `R`,
  computed by `Tot(P ⊗ L)` when `P` is a bounded-above complex of flat modules. Layer 4 consumes it
  as the abutment of the universal-coefficient and Künneth spectral sequences.
- **ArithmeticGaloisDuality, §D7.1**, target *Derived composite spectral sequence*: the
  composite-functor spectral sequence `E₂^{a,b} = R^aH(R^bF(X)) ⇒ R^{a+b}(H ∘ F)(X)` of an object
  `X`, with finite filtrations and edge maps the canonical maps. Layer 3 states the sequence of a
  complex in `D⁺`, of which §D7.1's is the case of an object, and adds the composition theorem,
  the low-degree sequences, naturality in the functors and the right exact and mixed-variance
  forms.
- **ArithmeticStatisticsPartVIII, §5.16** (*Tor spectral sequences over graded algebras*): the
  balance, universal-coefficient, hyperhomology and change-of-rings sequences for graded modules
  over a nonnegatively graded, possibly noncommutative algebra over a field, on its own graded
  carrier. Layer 4 states the ungraded Tor forms over commutative rings, on Mathlib's
  `CategoryTheory.Tor`.
- **Mathlib** (at the pin): `CategoryTheory.Abelian.Ext` is computed both from a projective
  resolution of the first variable and from an injective resolution of the second, so the
  balancing of Ext is a Check of Layer 4, not a target.
- **Tau Ceti** (at the pin): the row- and column-filtration spectral sequences of a first-quadrant
  homological bicomplex with their first pages and convergence, the quasi-isomorphism of totals
  induced by a quasi-isomorphism on rows and the exact-augmentation form, the Künneth short exact
  sequence over rings whose modules have projective dimension at most one, the universal
  coefficient sequence for cohomology, K-flat complexes, `Tor` from presentations of length one,
  and the first-order Bockstein maps of continuous cohomology. These are instances of Layers 1, 4
  and 6 and are consumed as they stand.
- **AlgebraicTopology, §5.1** (the Künneth spectral sequence of singular chains),
  **DGFloer, Layer 1 item 2** (the multiplicative Serre spectral sequence),
  **SchemeAndStackFoundations, §§2.2, 2.7, 2.15** (`leray_spectral_sequence`,
  `cech_to_cohomology`, `localToGlobal`, `hochschildSerre_galois_covering`) and
  **SchemeKTheoryOperations, §6.7** (the hyperhomology spectral sequence of a group acting on a
  chain complex): instances of Layers 2–5 that stay with their owners and are compared in Checks.

The spectral sequences of fibrations (Serre, Eilenberg–Moore), the Adams and Atiyah–Hirzebruch
spectral sequences, the coniveau and descent spectral sequences, the spectral sequences of group
extensions, graded Tor over graded algebras and Tor of one-sided modules over noncommutative rings
are not part of this roadmap. Neither are the
uniqueness of Cartan–Eilenberg resolutions up to homotopy of double complexes (no statement here
needs it: Layer 2 obtains the independence of the hypercohomology spectral sequences from the
existence of lifts), Grothendieck's comparison of the composite-functor sequences of a commuting
square of functors with resolving functors, Douady's products of spectral systems, products on the
hypercohomology and composite-functor spectral sequences, the extension of the hypercohomology
sequences to unbounded complexes for functors of finite injective dimension, and the resolutions of
unbounded complexes with exact kernel or cokernel complexes (stacks-012K Lemmas 26.2 and 26.3).

## Conventions

- **Categories.** `𝒜`, `ℬ`, `𝒞` are abelian categories. Every further hypothesis is stated at the
  target that uses it. For derived functors, `𝒜` (and `ℬ` for composites) has enough injectives,
  and every category involved has a derived category in Mathlib's sense (`HasDerivedCategory`). The
  half-plane statements use the classes of the base: countable coproducts with exact sequential
  colimits (`HasCountableCoproducts`, `HasColimitsOfShape ℕ`, `HasExactColimitsOfShape ℕ`) for the
  direct-sum totalisation, and the class of base §7.4 (countable products and coproducts,
  `CountableAB4Star`, exact sequential colimits, lim-acyclic epimorphic towers) for the product
  totalisation. `ModuleCat R` belongs to both classes; module categories are `ModuleCat.{u} R`
  with `R : Type u`, where Mathlib's `AB5` and `AB4Star` instances live.
- **Indexing.** Cohomological throughout, as in the base: `E_r^{p,q}` with `p` the filtration
  degree, `p + q` the total degree and `d_r` of bidegree `(r, 1 − r)`; filtrations are decreasing.
  The spectral sequence of a decreasingly filtered complex is the one of base §5.1, whose classical
  term `E_r^{p,q}` is page `r + 1` of Tau Ceti's `CochainComplex.spectralSequence` at the native
  position `(2p + q + 1, −p − 1)`. Homological sequences are read through the homological bidegree
  assignment of base §2.1: `E^r_{p,q}` with `d^r` of bidegree `(−r, r − 1)`.
- **Double complexes.** A double complex is a Mathlib
  `HomologicalComplex₂ 𝒜 (ComplexShape.up ℤ) (ComplexShape.up ℤ)`: a complex (in `p`) of cochain
  complexes (in `q`). Write `K^{p,q}` for its terms, `d₁ : K^{p,q} → K^{p+1,q}` (horizontal) and
  `d₂ : K^{p,q} → K^{p,q+1}` (vertical); the two commute. The column `K^{p,•}` is the cochain complex
  `(K^{p,q}, d₂)_q` and the row `K^{•,q}` is `(K^{p,q}, d₁)_p`. The total differential on `K^{p,q}`
  is `d₁ + (−1)^p d₂` (Mathlib's `TotalComplexShape (up ℤ) (up ℤ) (up ℤ)`, with `ε₁ = 1` and
  `ε₂(p, q) = (−1)^p`; the same convention as stacks-012K line 2154–2164 and grothendieck1957 line
  1266–1268). `K.flip` has `K.flip^{q,p} = K^{p,q}`, and `HomologicalComplex₂.totalFlipIso` multiplies
  the summand `K^{p,q}` by `(−1)^{pq}`. *Witness:* in the unit square `K^{0,0} = K^{1,0} = K^{0,1} =
  K^{1,1} = ℤ` with every map the identity, the total differential sends `1 ∈ K^{0,0}` to
  `(1, 1) ∈ K^{1,0} ⊕ K^{0,1}`, and sends `K^{1,0}` and `K^{0,1}` to `K^{1,1}` by `−1` and `+1`; the
  square of the total differential vanishes, while the unsigned sum `d₁ + d₂` squares to `2 ≠ 0`.
- **Iterated cohomology.** `H_II^q(K)` is the complex (in `p`) of vertical cohomologies `H^q(K^{p,•})`
  with differential induced by `d₁`, and `H_I^p H_II^q(K)` its cohomology. `H_I^q(K)` is the complex
  (in `p`) of horizontal cohomologies, which is `H_II^q(K.flip)`, and `H_II^p H_I^q(K)` its cohomology.
- **Shifts, singles, connecting morphisms.** Mathlib's shift `K⟦n⟧` has terms `K^{m+n}` and
  differential multiplied by `(−1)^n`. `A[0]` is `A` placed in degree `0`. Connecting morphisms are
  Mathlib's, with no additional sign, as in the base.
- **Derived functors.** `RF` is `F.rightDerivedFunctorPlus : DerivedCategory.Plus 𝒜 ⥤
  DerivedCategory.Plus ℬ`, and `RⁿF(X)` is the `n`th cohomology `DerivedCategory.Plus.homologyFunctor
  ℬ n` of `RF(X)`; for an object `A`, `RⁿF(A)` means `RⁿF` of `DerivedCategory.Plus.singleFunctor 𝒜 0`
  applied to `A`. For a left exact `F`, an object `B` is `F`-acyclic when `RⁱF(B) = 0` for `i > 0`.
- **Opposite categories.** A bounded-above cochain complex `K` of `𝒜` corresponds under Mathlib's
  `CochainComplex.opEquivalence` to the bounded-below complex `K°` of `𝒜ᵒᵖ` with `(K°)^n = op K^{−n}`.
  Right exact functors, left derived functors, projective resolutions and contravariant functors
  are treated by applying the right exact or contravariant functor's opposite to `K°`. *Witness:*
  for `K = (ℤ →(×2) ℤ)` in cohomological degrees `−1, 0`, `K°` sits in degrees `0, 1`, and its
  cohomology `H^1(K°) = op H^{−1}(K) = 0`, `H^0(K°) = op H^0(K) = op ℤ/2`.
- **Tor and Ext.** `Tor` and `Tor'` are Mathlib's `CategoryTheory.Tor` (left derived in the
  second variable) and `CategoryTheory.Tor'` (in the first). Statements with Tor over a ring take
  `R` commutative, Mathlib's monoidal structure on `ModuleCat R` requiring it; statements with Ext
  hold for any ring. In cohomological indexing a Tor term `Tor_k` sits at filtration degree
  `p = −k`. *Witness:* for `R = ℤ`, the universal-coefficient sequence of 4.2 for `K = ℤ/2[0]` and
  `M = ℤ/2` has `E₂^{0,0} = ℤ/2 ⊗ ℤ/2` and `E₂^{−1,0} = Tor_1(ℤ/2, ℤ/2) = ℤ/2`, giving
  `H^0 = H^{−1} = ℤ/2` for `ℤ/2 ⊗^L ℤ/2`.
- **Products.** Pairings are over a commutative ring `R`, bilinear on the terms and graded by
  adding bidegrees; the Koszul sign of a homogeneous element is that of its total degree.

## Exact supplier contracts

### From Mathlib

- `HomologicalComplex₂`, `HomologicalComplex₂.flip`, `HomologicalComplex₂.HasTotal`,
  `HomologicalComplex₂.total`, `HomologicalComplex₂.ιTotal`, `HomologicalComplex₂.totalDesc`,
  `HomologicalComplex₂.total.map` (`Mathlib/Algebra/Homology/HomologicalBicomplex.lean`,
  `TotalComplex.lean`): the direct-sum total complex, which exists when the coproducts over the
  antidiagonals exist. `HomologicalComplex₂.totalFlipIso` (`TotalComplexSymmetry.lean`) with the
  signs `σ(p, q) = (−1)^{pq}` of `TotalComplexShapeSymmetry (up ℤ) (up ℤ) (up ℤ)`
  (`ComplexShapeSigns.lean`). There is no product total complex at the pin.
- `HomologicalComplex.mapBifunctor`, `CategoryTheory.Functor.mapBifunctorHomologicalComplex`
  (`Mathlib/Algebra/Homology/Bifunctor.lean`): the double complex and the total complex of a
  bifunctor applied to two complexes.
- `HomologicalComplex.stupidTrunc` (`Mathlib/Algebra/Homology/Embedding/StupidTrunc.lean`),
  `HomologicalComplex.homologyOp` (`Mathlib/Algebra/Homology/Opposite.lean`),
  `CochainComplex.opEquivalence` (`Mathlib/Algebra/Homology/CochainComplexOpposite.lean`).
- `CategoryTheory.SpectralSequence` and `CategoryTheory.SpectralSequence.Hom`, whose field `comm`
  determines the page-`(r + 1)` component of a morphism from its page-`r` component
  (`Mathlib/Algebra/Homology/SpectralSequence/Basic.lean`).
- `DerivedCategory.Plus`, `DerivedCategory.Plus.Q`, `DerivedCategory.Plus.homologyFunctor`,
  `DerivedCategory.Plus.singleFunctor`, `DerivedCategory.Plus.isIso_iff`
  (`Mathlib/Algebra/Homology/DerivedCategory/Plus.lean`); `CochainComplex.Plus`,
  `CategoryTheory.Functor.mapCochainComplexPlus` (`CochainComplexPlus.lean`);
  `CategoryTheory.Functor.rightDerivedFunctorPlus`,
  `CategoryTheory.Functor.rightDerivedFunctorPlusUnit` and
  `CategoryTheory.NatTrans.rightDerivedFunctorPlus`
  (`Mathlib/Algebra/Homology/DerivedCategory/RightDerivedFunctorPlus.lean`). The unit is an
  isomorphism at bounded-below complexes of injective objects, and `RF` is a triangulated right
  derived functor. Assumed: nothing about left derived functors on `D⁻` (there are none at the
  pin) and no comparison with `Functor.rightDerived` (the file's documentation records that one as
  missing).
- `CategoryTheory.Functor.rightDerived`, `CategoryTheory.InjectiveResolution.isoRightDerivedObj`
  (`Mathlib/CategoryTheory/Abelian/RightDerived.lean`), `CategoryTheory.Functor.leftDerived`,
  `CategoryTheory.ProjectiveResolution.isoLeftDerivedObj`,
  `CategoryTheory.Functor.leftDerivedZeroIsoSelf` (`LeftDerived.lean`), `InjectiveResolution`,
  `ProjectiveResolution`, `CategoryTheory.Injective.injective_of_adjoint`,
  `CategoryTheory.Adjunction.map_injective` and the instance giving `EnoughInjectives 𝒜ᵒᵖ` from
  `EnoughProjectives 𝒜` (`Mathlib/CategoryTheory/Preadditive/Injective/Basic.lean`).
- `CategoryTheory.Tor`, `CategoryTheory.Tor'`, `CategoryTheory.isZero_Tor'_succ_of_projective`
  (`Mathlib/CategoryTheory/Monoidal/Tor.lean`, which records `Tor ≅ Tor'` as missing).
- `CategoryTheory.Abelian.Ext` (`Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean`),
  `CategoryTheory.ProjectiveResolution.extEquivCohomologyClass` and
  `CategoryTheory.InjectiveResolution.extEquivCohomologyClass`
  (`Mathlib/CategoryTheory/Abelian/Projective/Ext.lean`, `Injective/Ext.lean`),
  `CochainComplex.IsKInjective`, `CochainComplex.IsKProjective`.
- `CochainComplex.isKInjective_of_injective`
  (`Mathlib/Algebra/Homology/HomotopyCategory/KInjective.lean`): a cochain complex indexed by `ℤ`,
  strictly bounded below, with injective terms is K-injective, that is, every map into it from an
  acyclic complex is null-homotopic. `CochainComplex.IsKInjective.Qh_map_bijective`
  (`Mathlib/Algebra/Homology/DerivedCategory/KInjective.lean`, under `HasDerivedCategory`): for `L`
  K-injective, homotopy classes of maps into `L` are in bijection with maps into `L` in the derived
  category. `CochainComplex.Plus.exists_quasiIso_injective`
  (`Mathlib/Algebra/Homology/DerivedCategory/DerivabilityStructureInjectives.lean`): with enough
  injectives, a complex strictly bounded below by `n` has a quasi-isomorphism into a complex of
  injectives strictly bounded below by `n`. `CategoryTheory.InjectiveResolution.desc` and
  `CategoryTheory.InjectiveResolution.descHomotopy`
  (`Mathlib/CategoryTheory/Abelian/Injective/Resolution.lean`): a morphism of objects lifts to their
  injective resolutions, uniquely up to homotopy. Assumed: nothing beyond these statements; Mathlib's
  injective resolutions are indexed by `ℕ` and are extended to `ℤ` where K-injectivity is used.
- `ModuleCat.restrictScalars`, `ModuleCat.coextendScalars` and `ModuleCat.restrictCoextendScalarsAdj`
  for any rings, `ModuleCat.extendScalars` and `ModuleCat.extendRestrictScalarsAdj` for
  commutative rings (`Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean`).
- `HasCountableProducts`, `HasCountableCoproducts`, `CountableAB4Star`, `HasExactColimitsOfShape`
  and the module-category instances, as fixed in the base's Mathlib contract.

### From Tau Ceti

- `CochainComplex.filtrationFunctor`, `CochainComplex.filtrationFunctorMap`,
  `CochainComplex.spectralSequence`, `CochainComplex.spectralSequenceFirstPageXIsoCokernel`
  (`TauCeti/Algebra/Homology/SpectralSequence/Filtered/SpectralObject.lean`, `Naturality.lean`) and
  `CochainComplex.spectralSequence_first_page_d_eq` (`Filtered/FirstPage.lean`), through the base's
  §5.1.
- `CategoryTheory.SpectralSequence.Hom.isIso_hom_f_of_le`
  (`TauCeti/Algebra/Homology/SpectralSequence/Comparison.lean`): a morphism of spectral sequences that
  is an isomorphism at every position of page `r` is one on every later page.
- `HomologicalComplex₂.rowFiltrationSpectralSequence`,
  `HomologicalComplex₂.columnFiltrationSpectralSequence`,
  `HomologicalComplex₂.columnFiltrationSpectralSequenceFirstPageXIso`
  (`TauCeti/Algebra/Homology/SpectralSequence/Bicomplex.lean`), and
  `HomologicalComplex₂.quasiIso_total_map_of_rows`,
  `HomologicalComplex₂.quasiIso_totalAugmentation_of_rows`
  (`TauCeti/Algebra/Homology/TotalComplex.lean`): first-quadrant homological bicomplexes indexed by
  `ℕ × ℕ` in an abelian category.
- `TauCeti.ExactStructure.abelian` and `TauCeti.ExactStructure.abelian_conflation`
  (`TauCeti/CategoryTheory/Exact/Abelian.lean`): the exact structure of an abelian category whose
  conflations are the short exact sequences; `TauCeti.ExactStructure.abelian_isInjective_iff` and
  `TauCeti.ExactStructure.exists_conflation_of_conflation_of_injective`
  (`TauCeti/CategoryTheory/Exact/Injective.lean`): its relative injectives are the injective objects,
  and the one-step injective horseshoe: for a conflation `X ↪ Y ↠ Z` and conflations `X ↪ I_X ↠ C_X`,
  `Z ↪ I_Z ↠ C_Z` with `I_X` injective, `Y` embeds by a conflation into a split extension of `I_Z` by
  `I_X`, with cokernel an extension of `C_Z` by `C_X`, compatibly with the given conflations.
- `CochainComplex.IsKFlat`, `CochainComplex.isKFlat_of_boundedAbove_flat`,
  `CochainComplex.quasiIso_id_tensorHom` (`TauCeti/Algebra/Homology/Monoidal/KFlat/Basic.lean`).
- `HomologicalComplex.homologyCross`, `HomologicalComplex.homologyKunnethShortComplex_shortExact`
  (`TauCeti/Algebra/Homology/Monoidal/Homology/Cross.lean`, `Kunneth/Sequence.lean`) and
  `TauCeti.ChainComplex.exact_extToHomology_kronecker`
  (`TauCeti/Algebra/Homology/UniversalCoefficient/Basic.lean`): compared in Checks.

### From TauCetiRoadmap.SpectralSequencesAndConvergence

- §1.3 (stabilisation, regularity, degeneration) and §1.4 (the limit page).
- §4.3 (the canonical comparison of the limit page with `EInfty`, through which weak convergence of
  the filtered-complex spectral sequence is read in 5.2).
- §2.1 (bidegree assignments, including the homological one) and §2.2 (bounded below implies
  regular).
- §3.1 (decreasing filtrations: exhaustive, separated, complete, finite), §3.2 (weak, ordinary and
  strong convergence in a set of total degrees), §3.3 (morphisms of converging structures),
  §3.4 (finite filtrations, weak Serre classes), §3.5 (the comparison theorem, with its finite and
  strongly convergent cases), §3.6 (vanishing, two columns, first quadrant with edge morphisms and
  the five-term and extended sequences).
- §§5.1–5.4: the classical spectral sequence of a decreasingly filtered complex with its first page
  and first differential, functoriality in filtered morphisms, the induced filtration on cohomology,
  convergence under degreewise finite filtrations (§5.3) and the classical convergence theorem for
  exhaustive filtrations bounded below in categories with exact sequential colimits (§5.4).
- §§6.1–6.3: the spectral sequence of a cohomological exact couple (degrees `(−1, 1)`, `(0, 0)`,
  `(1, 0)`), its towers `Z_{r+1} = k^{−1}(im i^r)`, `B_{r+1} = j(ker i^r)` and limit page, and the
  exact couple of a decreasingly filtered complex identified with §5.1.
- §7.4, for its class of categories only (countable products and coproducts, `CountableAB4Star`,
  exact sequential colimits, lim-acyclic epimorphic towers), in which 1.3(c) is stated; its
  conditional-convergence theorems enter only through §7.5.
- §7.5: complete convergence for exhaustive complete filtrations with regular spectral sequence,
  strong under its half-plane criterion, in the class of §7.4.

Assumed: the cited sections with the statements and hypotheses they have in the base; this roadmap
uses the colimit side of the base's exact-couple convergence and §7.5, not the limit side of §7.4.

### From TauCetiRoadmap.StableHomotopyKTheory

- §7.22: bigraded exact couples in an abelian category and their derived couples, the carrier of
  the base's §6.1 and of the pairings of 5.1.

### From TauCetiRoadmap.DerivedModuleAlgebra

- §0.2: the derived tensor bifunctor on `D(R)` for a commutative ring `R`, symmetric monoidal with
  unit `R[0]`, with `P ⊗^L L ≅ Tot(P ⊗ L)` naturally for every bounded-above complex `P` of flat
  modules.
- §S.1: the first-quadrant double complex spectral sequence and its consequences, for double
  complexes with anticommuting differentials, compared with Layer 1 through `d′ = d₁`,
  `d″ = (−1)^p d₂` (1.2).

### From TauCetiRoadmap.ArithmeticGaloisDuality

- §D7.1, target *Derived composite spectral sequence*: for left exact `F : 𝒜 → ℬ`, `H : ℬ → 𝒞`
  with `𝒜, ℬ` having enough injectives and `F` sending injectives to `H`-acyclic objects, the
  natural convergent first-quadrant spectral sequence `E₂^{a,b} = R^aH(R^bF(X)) ⇒ R^{a+b}(H ∘ F)(X)`
  of an object `X`, with finite filtrations, whose edge maps are the canonical maps
  `R^aH(F(X)) → R^a(H ∘ F)(X)` and `R^b(H ∘ F)(X) → H(R^bF(X))`. Assumed: its construction is the one
  of 3.2 (an injective resolution of `X`, a Cartan–Eilenberg resolution of `F` applied to it, and
  the second spectral sequence of `H`), so that 3.2 and 3.3 apply to it.

## How to read the build

Layer 1 totalises double complexes, filters the totals by columns and by rows, and identifies the
two resulting spectral sequences of base §5.1 through their second pages; it proves their
convergence when every antidiagonal is finite and in the half-plane cases, by base §§5.3, 5.4 and
7.5, and deduces the comparison of totals and the acyclic assembly lemma. Layer 2 builds horseshoe
and Cartan–Eilenberg resolutions, compares Mathlib's two right derived functors, and obtains the two
hypercohomology spectral sequences as the two spectral sequences of Layer 1 for a Cartan–Eilenberg
resolution; opposite categories give their duals. Layer 3 composes right derived functors on `D⁺`
and obtains the composite-functor spectral sequence of a complex as a second hypercohomology
sequence. Layer 4 applies Layers 1–3 to modules: balancing Tor, the universal-coefficient sequences,
the Künneth sequence and the change-of-rings sequences. Layer 5 constructs products on the pages of
exact couples, filtered complexes and double complexes. Layer 6 constructs the Bockstein spectral
sequence as an exact couple and as the spectral sequence of a filtered complex, and computes its
pages and its limit page.

## Layer 1: double complexes and their two spectral sequences

### 1.1 Total complexes

Define the *product total complex* `Tot^Π(K)` of a double complex `K` in a preadditive category with
the products over the antidiagonals (for instance with countable products): its term in degree `n`
is `∏_{p+q=n} K^{p,q}`, and the component of its differential with target `K^{p,q}` (`p + q = n + 1`)
is `d₁ ∘ π_{p−1,q} + (−1)^p d₂ ∘ π_{p,q−1}`, where `π` are the product projections (stacks-012K
line 3400–3409, the complex `Tot_π` in the proof of Lemma 26.3, tag 09J0; weibel1994 §1.2,
uncertified). The direct-sum total complex `Tot^⊕(K)` is Mathlib's `HomologicalComplex₂.total` for the
shape `up ℤ`. *Needs:* Mathlib `HomologicalComplex₂`, `HomologicalComplex₂.total`,
`HomologicalComplex₂.totalFlipIso`, `HasCountableProducts`, `HasCountableCoproducts`.

- The differential of `Tot^Π(K)` squares to zero; `Tot^Π` is an additive functor from double
  complexes to cochain complexes, and a morphism into `Tot^Π(K)` is determined by its composites with
  the projections.
- `Tot^⊕(K)` exists (Mathlib's `HasTotal`) when the category has countable coproducts, and in any
  preadditive category with finite coproducts when each antidiagonal has finitely many nonzero
  terms.
- When both exist, the canonical comparison `κ : Tot^⊕(K) → Tot^Π(K)`, the identity on each summand,
  is a natural chain map; it is an isomorphism when each antidiagonal has finitely many nonzero
  terms.
- `Tot^Π(K.flip) ≅ Tot^Π(K)` with the signs `(−1)^{pq}` of `HomologicalComplex₂.totalFlipIso`, and
  `κ` commutes with the two flip isomorphisms.

**Checks.**

- In the unit square of the Conventions, `Tot^Π = Tot^⊕` and the differential has the components
  computed there; a definition with `+d₂` in every column has a differential of square `2`.
- *Column sign.* For `K` concentrated in column `1` with `K^{1,0} = ℤ →(×2) K^{1,1} = ℤ`, both totals
  are `ℤ →(−2) ℤ` in degrees `1, 2`, with `H^2 = ℤ/2`; a sign `(−1)^q` or `(−1)^{p+1}` in place of
  `(−1)^p` would give `+2`.
- *The staircase.* Let `D_p = K^{p,−p} = ℤ` and `O_p = K^{p+1,−p} = ℤ` for `p ≥ 0`, all other terms
  zero, with `d₁ : D_p → O_p` and `d₂ : D_{p+1} → O_p` the identity. In degree `0` the total
  differential sends `x = (x_p)` to `(x_p − (−1)^p x_{p+1})_p` in degree `1`. On `Tot^⊕` it is an
  isomorphism `⊕ D_p → ⊕ O_p`; on `Tot^Π` its kernel is spanned by `(1, 1, −1, −1, 1, 1, …)`, so
  `H^0(Tot^⊕ K) = 0` and `H^0(Tot^Π K) = ℤ`. The comparison `κ` is injective and not surjective in
  degree `0`.
- The zero double complex has zero totals; a double complex concentrated in column `0` has both
  totals equal to that column.

### 1.2 The column and row filtrations and the two spectral sequences

For a double complex `K` and `Tot(K)` one of `Tot^⊕(K)`, `Tot^Π(K)`, define the *column filtration*
`F_I^p Tot(K)` as the subcomplex formed by the columns of index at least `p` (the total complex of the
truncation of `K` to those columns, through Mathlib's `HomologicalComplex.stupidTrunc`), a decreasing
filtration by subcomplexes. Define the *first spectral sequence* `′E(K)` as the spectral sequence of
base §5.1 of `(Tot(K), F_I)`, and the *second spectral sequence* `″E(K)` as `′E(K.flip)`, whose
abutment `H^*(Tot(K.flip))` is identified with `H^*(Tot(K))` through the flip isomorphism of 1.1; the
filtration it transports to `Tot(K)` is the *row filtration* `F_II^p`, formed by the rows of index at
least `p`. Prove (stacks-012K line 3241–3265, §25 and Lemma 25.1, tags 012X and 0130;
grothendieck1957 line 1226–1235, (2.4.1)):

- `gr^p_I Tot(K) ≅ (K^{p,•})⟦−p⟧`, the sign of the shift matching the column sign `(−1)^p`;
- `′E_1^{p,q} ≅ H^q(K^{p,•})`, with `′d_1 = H^q(d₁)`; hence `′E_2^{p,q} ≅ H_I^p H_II^q(K)`;
- `″E_1^{p,q} ≅ H^q(K^{•,p})`, with `″d_1 = H^q(d₂)`; hence `″E_2^{p,q} ≅ H_II^p H_I^q(K)`;
- a morphism of double complexes induces morphisms of both spectral sequences and filtered maps of
  the abutments (Tau Ceti `CochainComplex.filtrationFunctorMap`, base §5.1), functorially;
- the induced filtrations `F_I^p Hⁿ(Tot K)` and `F_II^p Hⁿ(Tot K)` are those of base §5.2, and when the
  limit page exists `gr^p_I Hⁿ` is a subquotient of `′E_∞^{p,n−p}` (base §5.2).

*Needs:* 1.1; base §§5.1, 5.2; Mathlib `HomologicalComplex₂.flip`,
`HomologicalComplex₂.totalFlipIso`, `HomologicalComplex.stupidTrunc`; Tau Ceti
`CochainComplex.filtrationFunctor`, `CochainComplex.filtrationFunctorMap`,
`CochainComplex.spectralSequenceFirstPageXIsoCokernel`, `CochainComplex.spectralSequence_first_page_d_eq`.

- `κ : Tot^⊕(K) → Tot^Π(K)` is a filtered map for the column filtrations and an isomorphism on every
  `gr^p_I`, so it induces an isomorphism of first spectral sequences from page `1` on; whether it is a
  quasi-isomorphism is decided by convergence (1.3).
- A morphism of double complexes that is a quasi-isomorphism on every column induces an isomorphism
  of first spectral sequences from page `1` on.

**Checks.**

- *First differential.* For `K^{0,0} = ℤ →(d₁ = ×2) K^{1,0} = ℤ`, the column filtration is the stupid
  filtration of `ℤ →(×2) ℤ`, `′d_1 : ′E_1^{0,0} = ℤ → ′E_1^{1,0} = ℤ` is `+2` (the base's witness),
  `′E_2^{1,0} = ℤ/2` and `′E_2^{0,0} = 0`.
- *Sign of `″d_1`.* For the column-sign complex of 1.1 (`K^{1,0} →(×2)
  K^{1,1}`), `″E_1^{0,1} = H^1(K^{•,0}) = ℤ`, `″E_1^{1,1} = H^1(K^{•,1}) = ℤ` and `″d_1 = +2` here, while
  stacks-012K Lemma 25.1(4) gives `(−1)^q H^q(d₂) = −2` for the row filtration of `Tot(K)` itself.
  `HomologicalComplex₂.totalFlipIso` has component `σ(1, 0) = +1` on `K^{1,0}` and `σ(1, 1) = −1` on
  `K^{1,1}`, and intertwines the two. Both give `″E_2^{1,1} = ℤ/2 = H^2(Tot K)`.
- A double complex with exact columns has `′E_1 = 0`.
- *Dictionary with DerivedModuleAlgebra §S.1.* §S.1's double complexes have anticommuting
  differentials `d′` (in `p`) and `d″` (in `q`). A double complex here gives one there by `d′ = d₁`,
  `d″ = (−1)^p d₂`: then `d′d″ + d″d′ = (−1)^p d₁d₂ + (−1)^{p+1} d₂d₁ = 0`, the total differential
  `d′ + d″` is `d₁ + (−1)^p d₂`, the column filtration is the same, and the vertical cohomologies, hence
  `H_I H_II`, are unchanged. On the unit square of the Conventions, `d″` is `+1` on `K^{0,0}` and `−1`
  on `K^{1,0}`, matching the total differential computed there; taking `d″ = d₂` instead would give
  `d′d″ + d″d′ = 2` on `K^{0,0}`. For a first-quadrant `K`, `′E_2 ≅ H_I H_II(K)` is then §S.1's
  identification, and for a first-quadrant homological bicomplex the first page agrees with Tau
  Ceti's `HomologicalComplex₂.columnFiltrationSpectralSequenceFirstPageXIso`.
- For the staircase, `′E_1` of both totals is `ℤ` at `(0, 0)` and zero elsewhere, and `κ` is an
  isomorphism on it although it is not a quasi-isomorphism.

### 1.3 Convergence

Prove (stacks-012K line 3284–3291, Lemma 25.3, tag 0132, for (a); weibel1994 §5.6, uncertified,
for (b) and (c)):

- (a) *Finite antidiagonals.* In any abelian category, if for every `n` only finitely many
  `K^{p,n−p}` are nonzero, both spectral sequences converge strongly in every degree to `H^*(Tot K)`,
  with finite filtrations (`F_I^p Hⁿ = Hⁿ` for `p` at most the least column meeting the antidiagonal
  `n`, and `0` for `p` beyond the largest), and every position stabilises. `Hⁿ(Tot K)` lies in
  every weak Serre class that contains `′E_r^{p,q}` for all `p, q` and some `r` (stacks-012K line
  3289–3290, Lemma 25.3 (4); base §5.3), and in every weak Serre class that contains `′E_r^{p,n−p}`
  for all `p` and some `r` from which every position of total degree `n` stabilises (base §§1.3,
  3.4); similarly for `″E`. Route: the filtrations are finite in each degree, base §5.3 and §3.4;
  for the first weak Serre form, closure under kernels and cokernels carries the hypothesis from
  page `r` to every later page, hence to a page from which total degree `n` stabilises.
- (b) *The direct-sum totalisation.* Let the category have countable coproducts and exact sequential
  colimits. If for every `n` there is `b(n)` with `K^{p,n−p} = 0` for `p > b(n)`, then `′E(K)` converges
  strongly to `H^*(Tot^⊕ K)`. The left half-plane (`K^{p,q} = 0` for `p > b`) and the upper half-plane
  (`K^{p,q} = 0` for `q < a`) are instances. Through the flip, if for every `n` there is `b(n)` with
  `K^{n−q,q} = 0` for `q > b(n)` (the lower and the right half-planes), then `″E(K)` converges strongly
  to `H^*(Tot^⊕ K)`. Route: `F_I` is exhaustive on `Tot^⊕`, since coproducts commute with sequential
  colimits, and bounded below by `b(n)`; base §5.4.
- (c) *The product totalisation.* Let the category be in the class of base §7.4. If for every `n`
  there is `a(n)` with `K^{p,n−p} = 0` for `p < a(n)` and `′E(K)` is regular at every position, then
  `′E(K)` converges strongly to `H^*(Tot^Π K)`. The right half-plane (`K^{p,q} = 0` for `p < a`) and the
  lower half-plane (`K^{p,q} = 0` for `q > b`) are instances, and the flip gives the row statement
  for the upper and the left half-planes. Regularity holds when for every `n` there is `p₁(n)` with
  `H^{n+1−p}(K^{p,•}) = 0` for `p ≥ p₁(n)` (base §2.2: bounded below implies regular). Route: `F_I` is
  complete on `Tot^Π`, since products commute with limits, and exhaustive by `a(n)`; `′E_1^{p,n−p}`
  vanishes for `p` below `a(n − 1)` and `a(n)`, which is the half-plane criterion of base §7.5.

*Needs:* 1.1, 1.2; base §§1.3, 2.2, 3.2, 3.4, 5.3, 5.4, 7.5, and §7.4 for its class of categories
only; Mathlib `HasCountableCoproducts`, `HasExactColimitsOfShape`, `CountableAB4Star`.

- In (a), the stabilisation page in total degree `n` is bounded by the number of columns meeting the
  antidiagonals `n − 1, n, n + 1`, plus one.

**Checks.**

- *The staircase separates the cases.* It is right and lower half-plane, its rows are exact and
  only column `0` has cohomology. (b) applies to `″E` (rows exact, `q ≤ 0`): `H^*(Tot^⊕) = 0`. (c)
  applies to `′E` (right half-plane, `′E_1 = ℤ` at `(0, 0)` only, hence regular): `H^0(Tot^Π) = ℤ`.
  Applying `′E` to `Tot^⊕` would predict `H^0 = ℤ`, and `″E` to `Tot^Π` would predict `0`; both
  predictions are false, and neither is licensed by (b) or (c).
- *Finite case.* For `ℤ →(×2) ℤ` placed horizontally, `′E` converges strongly with `F_I^1 H^1 = H^1 = ℤ/2`
  and `F_I^2 H^1 = 0`, the base's Check of §3.2.
- *One antidiagonal on an arbitrary page is not enough.* In abelian groups let `P` be the
  ℚ-vector spaces, a weak Serre class that is not closed under subobjects, and let `K` be
  `K^{0,0} = ℚ →(d₁) K^{1,0} = ℚ/ℤ` (the quotient map). On antidiagonal `0`, `′E_1^{0,0} = ℚ` lies in
  `P` and every other `′E_1^{p,−p}` is zero, yet `H^0(Tot K) = ℤ` does not. Neither form of (a) is
  contradicted: the first fails its hypothesis at `′E_1^{1,0} = ℚ/ℤ` on page `1` and at
  `′E_2^{0,0} = ℤ` on every later page; the second cannot use `r = 1`, since `′d_1` leaves `(0, 0)`
  nonzero, and fails at `′E_2^{0,0} = ℤ` for `r ≥ 2`.
- The zero double complex converges to zero in every case.

### 1.4 Comparison of totals

Let `f : K → L` be a morphism of double complexes that is a quasi-isomorphism on every column. Prove
that `Tot(f)` is a quasi-isomorphism in each of the following cases: both `K` and `L` have finite
antidiagonals; the category and `K`, `L` satisfy the hypotheses of 1.3(b) for `′E` and
`Tot = Tot^⊕`; the category and `K`, `L` satisfy the hypotheses of 1.3(c), both first spectral
sequences being regular, and `Tot = Tot^Π`. Through the flip, the same holds for quasi-isomorphisms
on every row under the row hypotheses (weibel1994 §5.6, uncertified; stacks-012K line 3293–3315,
Lemma 25.4, tag 0133, for an augmentation). Route: by 1.2 `′E(f)` is an isomorphism on page `1`,
hence on every page (Tau Ceti `CategoryTheory.SpectralSequence.Hom.isIso_hom_f_of_le`); the filtered
map `Tot(f)` gives a morphism of converging structures (base §3.3), and the comparison theorem
(base §3.5, its finite case for the first case and its strongly convergent case for the others)
makes `Hⁿ(Tot f)` an isomorphism. *Needs:* 1.2, 1.3; base §§3.3, 3.5; Tau Ceti
`CategoryTheory.SpectralSequence.Hom.isIso_hom_f_of_le`.

**Checks.**

- *The hypotheses are needed.* The projection of the staircase onto its column `0` (identity on `D_0`,
  zero elsewhere) is a morphism of double complexes and a quasi-isomorphism on every column. On
  `Tot^Π` it is a quasi-isomorphism (`H^0 = ℤ` on both sides), as (c) asserts; on `Tot^⊕` it is not
  (`H^0 = 0` against `ℤ`), and the staircase fails the hypothesis of (b) for `′E`.
- For first-quadrant homological bicomplexes and quasi-isomorphisms on rows, the statement is Tau
  Ceti's `HomologicalComplex₂.quasiIso_total_map_of_rows`.
- The identity of `K` gives the identity of `Tot(K)`.

### 1.5 The acyclic assembly lemma

Prove (weibel1994 Lemma 2.7.3, uncertified, for modules; stacks-012K line 3293–3303, Lemma 25.4,
tag 0133, for finite antidiagonals in any abelian category; stacks-012K line 3354–3358 and 3433–3438,
Lemmas 26.1 and 26.4, tags 0E1Q and 0E1R, for resolutions of complexes of abelian groups):

- `Tot^⊕(K)` is acyclic if the category is as in 1.3(b) and either the columns of `K` are exact and
  for every `n` the terms `K^{p,n−p}` vanish for `p ≫ 0`, or the rows are exact and for every `n` the
  terms `K^{n−q,q}` vanish for `q ≫ 0`;
- `Tot^Π(K)` is acyclic if the category is as in 1.3(c) and either the columns are exact and for
  every `n` the terms `K^{p,n−p}` vanish for `p ≪ 0`, or the rows are exact and for every `n` the terms
  `K^{n−q,q}` vanish for `q ≪ 0`;
- `Tot(K)` is acyclic in any abelian category if its antidiagonals are finite and its columns or
  its rows are exact;
- *augmented forms:* for a complex `M` and an exact complex of complexes `0 → M → A_0 → A_1 → ⋯`, the
  map `M → Tot^⊕(A)` (with `A^{p,q} = A_p^q`) is a quasi-isomorphism when the category is as in 1.3(b);
  for an exact complex of complexes `⋯ → A_1 → A_0 → M → 0`, the map `Tot^Π(A) → M` (with
  `A^{p,q} = A_{−p}^q`) is a quasi-isomorphism when the category is as in 1.3(c).

Route: the spectral sequence whose first page is the cohomology of the exact lines is zero from
page `1`, hence regular, and converges strongly by 1.3; the augmented forms apply this to the double
complex with `M` adjoined as an extra column, whose total complex is the mapping cone. Stacks
proves the half-plane forms only for abelian groups and does not write the general case
(stacks-012K line 3348–3351); the generality here is the one in which base §§5.4 and 7.5 hold.
*Needs:* 1.3; base §§5.4, 7.5; Mathlib mapping cones.

- *Dictionary with Weibel.* Weibel's double complexes are homological, `C_{p,q} = K^{−p,−q}`: his
  upper half-plane is the lower half-plane here and his right half-plane the left half-plane. His four
  cases (`Tot^Π`: upper half-plane with exact columns, right half-plane with exact rows; `Tot^⊕`:
  upper half-plane with exact rows, right half-plane with exact columns) are among the eight cases
  above.

**Checks.**

- The staircase has exact rows and vanishes for `q > 0`: `Tot^⊕` is acyclic. `Tot^Π` is not
  (`H^0 = ℤ`), and indeed the staircase is not upper or left half-plane: the row condition for `Tot^Π`
  cannot be weakened to the lower half-plane.
- `K = (ℤ →(id) ℤ)` placed horizontally has exact rows and finite antidiagonals, and `Tot(K)` is
  acyclic.
- For a resolution `0 → A → I^0 → I^1 → ⋯` of an object, regarded as a complex of complexes concentrated
  in degree `0`, the augmented form gives `A[0] → I` a quasi-isomorphism, which is the definition of
  a resolution.

### Examples

The unit square pins the total sign, the column-sign complex pins the flip sign, and the staircase
separates the direct-sum and product totalisations, the two convergence theorems and the two
acyclic assembly statements. First-quadrant double complexes are DerivedModuleAlgebra §S.1's
instances, through the dictionary `d′ = d₁`, `d″ = (−1)^p d₂` of 1.2, and Tau Ceti's row- and
column-filtration spectral sequences their homological form.

### Dependencies

Base §§2.2, 3.3–3.5, 5.1–5.4, 7.5; Mathlib double complexes, total complexes and their flip; Tau
Ceti's filtered-complex spectral sequence and comparison. DerivedModuleAlgebra §S.1 enters Checks
only.

## Layer 2: Cartan–Eilenberg resolutions and hyper-derived functors

### 2.1 Horseshoe resolutions

Let `𝒜` have enough injectives. Prove (stacks-05QI line 3402–3448, Lemma 18.9, tag 013T; weibel1994
§2.2, the horseshoe lemma, uncertified):

- (a) *Horseshoe.* For a short exact sequence `0 → A → B → C → 0` of bounded-below complexes and an
  injective resolution `A → I₁`, there are injective resolutions `B → I₂` and `C → I₃` and a
  degreewise split short exact sequence `0 → I₁ → I₂ → I₃ → 0` compatible with the augmentations; if
  `A`, `B`, `C` and `I₁` vanish in negative degrees, `I₂` and `I₃` can be chosen to. For objects
  (complexes in degree `0`), given injective resolutions of `A` and `C`, the middle one can be chosen
  with terms `I₁^n ⊕ I₃^n`.
- (b) *Relative horseshoe.* Given a morphism `(f₁, f₂, f₃)` from a short exact sequence of objects
  `0 → A → B → C → 0` to `0 → A′ → B′ → C′ → 0`, a short exact sequence `0 → R₁ → R₂ → R₃ → 0` of
  resolutions of `A`, `B`, `C` compatible with the augmentations, a degreewise split short exact
  sequence `0 → I₁′ → I₂′ → I₃′ → 0` of injective resolutions of `A′`, `B′`, `C′`, and chain maps
  `α : R₁ → I₁′` over `f₁` and `β : R₃ → I₃′` over `f₃`, there is a chain map `μ : R₂ → I₂′` over `f₂`
  restricting to `α` and inducing `β`. Route: choose any `ν : R₂ → I₂′` over `f₂` (stacks-05QI line
  3301–3310, Lemma 18.6, tag 013P); the two maps `R₂ → I₃′` over `f₃` differ by a null-homotopic map
  (Lemma 18.7, tag 013S), whose homotopy lifts through the split epimorphism `I₂′ → I₃′`; correcting
  `ν` by it makes the right square commute, after which the restriction to `R₁` differs from `α` by
  a null-homotopic map, whose homotopy extends along the degreewise monomorphism `R₁ → R₂` into the
  injective terms of `I₁′`. Neither homotopy touches the augmentation, so `μ` lies over `f₂`. The
  lifting and homotopy-uniqueness steps (Stacks Lemmas 18.4, 18.6, 18.7) are, for complexes extended
  to `ℤ`, the K-injectivity of bounded-below complexes of injectives (Mathlib
  `CochainComplex.isKInjective_of_injective`) and the bijection between homotopy classes of maps into
  a K-injective complex and maps in the derived category
  (`CochainComplex.IsKInjective.Qh_map_bijective`); between injective resolutions of objects they are
  `CategoryTheory.InjectiveResolution.desc` and `CategoryTheory.InjectiveResolution.descHomotopy`.
  For objects, (a) is the iteration, one degree at a time, of Tau Ceti's one-step injective horseshoe
  `TauCeti.ExactStructure.exists_conflation_of_conflation_of_injective` for the exact structure
  `TauCeti.ExactStructure.abelian` (whose conflations are the short exact sequences and whose relative
  injectives are the injective objects). For complexes, push out along `A → I₁` to reach a degreewise
  split sequence `0 → I₁ → E → C → 0`, resolve `C` by `C → I₃` (Mathlib
  `CochainComplex.Plus.exists_quasiIso_injective`), and lift the connecting map `C → I₁[1]` through
  `C → I₃` to `I₃ → I₁[1]` by K-injectivity of `I₁[1]`, the homotopy being absorbed into the
  augmentation, as in Stacks's proof of Lemma 18.9.

*Needs:* Mathlib `InjectiveResolution`, `EnoughInjectives`, `CochainComplex.isKInjective_of_injective`,
`CochainComplex.IsKInjective.Qh_map_bijective`, `CategoryTheory.InjectiveResolution.desc`,
`CategoryTheory.InjectiveResolution.descHomotopy`, `CochainComplex.Plus.exists_quasiIso_injective`; Tau
Ceti `TauCeti.ExactStructure.exists_conflation_of_conflation_of_injective`,
`TauCeti.ExactStructure.abelian`, `TauCeti.ExactStructure.abelian_isInjective_iff`.

- The dual statements hold for projective resolutions, through `𝒜ᵒᵖ` (Mathlib's instance
  `EnoughInjectives 𝒜ᵒᵖ`).

**Checks.**

- For the split sequence `0 → A → A ⊕ C → C → 0`, the direct sum of resolutions is a horseshoe, and
  with `f` the identity, `μ = α ⊕ β` works.
- For `0 → ℤ →(×2) ℤ → ℤ/2 → 0` in abelian groups with `I₁ = (ℚ → ℚ/ℤ)` and `I₃ = (ℚ/ℤ →(×2) ℚ/ℤ)`
  (the resolution `ℤ/2 → ℚ/ℤ` by `1 ↦ 1/2`, then `ℚ/ℤ →(×2) ℚ/ℤ`), the middle resolution has terms
  `ℚ ⊕ ℚ/ℤ` in degree `0` and `ℚ/ℤ ⊕ ℚ/ℤ` in degree `1`, and its cohomology is `ℤ` in degree `0`
  only. A middle resolution with zero twisting (the plain direct sum) would have `H^0 = ℤ ⊕ ℤ/2`.
- *The off-diagonal part of `μ` is needed.* Let the target horseshoe be the source one transported by
  the graded automorphism `φ(u, v) = (u + h(v), v)` of `I₁ ⊕ I₃`, for a family `h` of maps
  `I₃^n → I₁^n`, and let `f`, `α`, `β` be identities. For the source differential
  `d(u, v) = (d₁u + t(v), d₃v)`, `φd − dφ` sends `(u, v)` to `((h d₃ − d₁ h)(v), 0)`, so the identity of
  `I₁ ⊕ I₃` is a chain map between the two middle resolutions exactly when `h` is a chain map, while
  `μ = φ` always is. Instance: the split sequence `0 → ℤ/2 → ℤ/2 ⊕ ℤ/2 → ℤ/2 → 0` with
  `I₁ = I₃ = (ℚ/ℤ →(×2) ℚ/ℤ)` (the resolution of `ℤ/2` of the previous Check), `t = 0`, and `h` the
  identity in degree `0` and zero in degree `1`: `d₁h − hd₃` is `×2 ≠ 0` from degree `0` to degree
  `1`, the transported differential in degree `0` is `(u, v) ↦ (2u − 2v, 2v)` against `(2u, 2v)`, and
  the identity is not a chain map. For `h` the identity in both degrees the two differentials agree,
  but the identity still does not lie over `f₂`: the transported augmentation sends `(a, c)` to
  `(ε₁a + ε₃c, ε₃c)`, where `ε₁`, `ε₃` are the augmentations of `I₁`, `I₃`, and `ε₃c ≠ 0` for `c ≠ 0`.

### 2.2 Right derived functors of objects and complexes

For an additive `F : 𝒜 → ℬ` with `𝒜` having enough injectives, define `RⁿF(X)` for `X` in
`DerivedCategory.Plus 𝒜` and for objects of `𝒜` as in the Conventions (stacks-05QI line 2893–2896,
Definition 16.2, tag 015A). Prove:

- (i) *Comparison with the classical functors.* For `n : ℕ`, a natural isomorphism
  `RⁿF(A) ≅ (F.rightDerived n).obj A`, natural in `A` and in natural transformations of `F`. Route:
  an injective resolution `I` of `A`, extended to `ℤ`, is a bounded-below complex of injectives
  quasi-isomorphic to `A[0]`; the unit `F.rightDerivedFunctorPlusUnit` is an isomorphism there, and
  `InjectiveResolution.isoRightDerivedObj` computes the classical side from the same `I`.
- (ii) *Computation by injective complexes.* For a bounded-below complex `K` and a quasi-isomorphism
  `K → T` into a bounded-below complex of injectives, `RⁿF(K) ≅ Hⁿ(F(T))`, naturally.
- (iii) *Vanishing and truncation* (stacks-05QI line 2872–2924, Lemmas 16.1 and 16.3, tags 05TC and
  05TD). If `Hⁱ(X) = 0` for `i < a` then `RⁱF(X) = 0` for `i < a`; `RⁱF(A) = 0` for `i < 0`; `R⁰F` is
  left exact, and `F(A) → R⁰F(A)` is an isomorphism for all `A` if and only if `F` is left exact; for
  `i ≤ a`, `Hⁱ(RF(τ_{≤a}X)) ≅ Hⁱ(RF(X))`.
- (iv) *Long exact sequences.* A short exact sequence of bounded-below complexes gives a long exact
  sequence of `RⁿF`, natural in the sequence; on objects the `RⁿF` form a δ-functor (stacks-05QI line
  2952–2959, Lemma 16.6, tag 05TE).
- (v) *Acyclic objects and Leray's acyclicity lemma* (stacks-05QI line 2925–2935 and 2966–3011,
  Lemmas 16.4 and 16.7, tags 015C and 015E). For `F` left exact, `B` is `F`-acyclic if and only if
  `RF(B[0]) ≅ F(B)[0]`; for a bounded-below complex `L` of `F`-acyclic objects the unit
  `F(L) → RF(L)` is an isomorphism in `DerivedCategory.Plus ℬ`. Route: Stacks's induction over stupid
  truncations, with (iii).

*Needs:* Mathlib `CategoryTheory.Functor.rightDerivedFunctorPlus`,
`CategoryTheory.Functor.rightDerivedFunctorPlusUnit`, `DerivedCategory.Plus.homologyFunctor`,
`DerivedCategory.Plus.singleFunctor`, `CategoryTheory.Functor.rightDerived`,
`CategoryTheory.InjectiveResolution.isoRightDerivedObj`, `HomologicalComplex.stupidTrunc`.

- `RⁿF` commutes with finite direct sums and is functorial in natural transformations of `F`
  (Mathlib `CategoryTheory.NatTrans.rightDerivedFunctorPlus`).

**Checks.**

- For `F = Hom_ℤ(ℤ/2, −)` on abelian groups and `A = ℤ`, the resolution `ℚ → ℚ/ℤ` gives `R⁰F(ℤ) = 0`
  and `R¹F(ℤ) = Hom(ℤ/2, ℚ/ℤ) = ℤ/2 = Ext¹(ℤ/2, ℤ)`.
- An exact `F` has `RⁿF(A) = 0` for `n > 0`, and `R⁰F(A) = F(A)`.
- *Left exactness is needed for `R⁰F = F`.* For `F = − ⊗ ℤ/2` on abelian groups, `R⁰F(ℤ)` is the
  kernel of `ℚ ⊗ ℤ/2 → ℚ/ℤ ⊗ ℤ/2`, which is `0`, while `F(ℤ) = ℤ/2`.
- The complex `ℚ → ℚ/ℤ` consists of `F`-acyclic (injective) objects and computes `RF(ℤ)` by (v),
  consistently with (ii).

### 2.3 Cartan–Eilenberg resolutions

Let `𝒜` have enough injectives and `K` be a cochain complex with `K^p = 0` for `p < a`. Define a
*Cartan–Eilenberg resolution* of `K` as a double complex `I` with a morphism of complexes
`ε : K → I^{•,0}` such that (stacks-05QI line 3621–3629, Definition 21.1, tag 015H): `I^{p,q} = 0` for
`p < a` and for `q < 0`; for each `p`, the column `I^{p,•}`, with `ε^p`, is an injective resolution of
`K^p`; and the complexes (in `q`) of horizontal cycles `Ker(d₁^{p,•})`, horizontal boundaries
`Im(d₁^{p−1,•})` and horizontal cohomology `H_I^p(I)`, with the augmentations induced by `ε`, are
injective resolutions of `Z^p(K)`, `B^p(K)` and `H^p(K)`. *Needs:* 2.1; Mathlib `HomologicalComplex₂`,
`InjectiveResolution`.

- *Existence* (stacks-05QI line 3630–3654, Lemma 21.2, tag 015I): every such `K` has one. Route:
  decompose `K` into the short exact sequences `0 → Z^p → K^p → B^{p+1} → 0` and
  `0 → B^{p+1} → Z^{p+1} → H^{p+1} → 0` and choose horseshoes (2.1(a)) by induction on `p`.
- *Split rows.* Each row `I^{•,q}` is a complex of injectives whose cycles, boundaries and cohomology
  are injective, so every differential splits; hence any additive functor `G` commutes with the
  horizontal cycles, boundaries and cohomology of `I` (stacks-05QI line 3682–3689, in the proof of
  Lemma 21.3).
- *Total complex.* `Tot(I)` (finite antidiagonals) vanishes below degree `a`, has injective terms,
  and `K → Tot(I)` is a quasi-isomorphism (1.5, finite case, applied to the columns), so `Tot(I)` is an
  injective resolution of `K` (stacks-05QI line 3667–3668).
- *Lifting.* For a chain map `f : K → L` of complexes bounded below by `a` and Cartan–Eilenberg
  resolutions `I`, `J`, there is a morphism of double complexes `f̃ : I → J` with `f̃ ∘ ε = ε′ ∘ f`;
  it induces on columns, horizontal cycles, boundaries and cohomology chain maps over `f^p`,
  `Z^p(f)`, `B^p(f)` and `H^p(f)`. Route: by induction on `p`, the relative horseshoe 2.1(b) applied
  to `0 → Z^p → K^p → B^{p+1} → 0` and to `0 → B^{p+1} → Z^{p+1} → H^{p+1} → 0`, whose resolutions in
  `J` are degreewise split because their first terms are injective (weibel1994 Lemma 5.7.2,
  uncertified; cartan-eilenberg1956 Ch. XVII §1, uncertified). The relative horseshoe needs only
  resolutions on the source side, so the same induction lifts `f` from any double complex satisfying
  the conditions above with "injective resolution" replaced by "resolution" on the source side.
- Projective Cartan–Eilenberg resolutions of bounded-above complexes are Cartan–Eilenberg resolutions
  of `K°` in `𝒜ᵒᵖ` (2.6).

**Checks.**

- For `K = A[0]`, a Cartan–Eilenberg resolution is an injective resolution of `A` placed in column
  `0`: `Z^0 = K^0 = A`, `B = 0` and `H^0 = A`.
- The zero double complex is a Cartan–Eilenberg resolution of the zero complex.
- *Column resolutions are not enough.* For `K = (ℤ →(×2) ℤ)` in degrees `0, 1` over abelian groups,
  the double complex whose columns are both `ℚ → ℚ/ℤ` and whose `d₁` is multiplication by `2` has
  columns resolving `K^0` and `K^1`, but its horizontal cohomology `H_I^1` is `ℚ/2ℚ = 0` and
  `(ℚ/ℤ)/2(ℚ/ℤ) = 0`, which does not resolve `H^1(K) = ℤ/2`; it is not a Cartan–Eilenberg resolution.
- For `K = (A →(id) A)`, the double complex with both columns the same injective resolution of `A`
  and `d₁` the identity is a Cartan–Eilenberg resolution: `Z^0 = 0`, `B^1 = A` and `H = 0` are resolved
  by `0`, the second column and `0`.

### 2.4 The first hypercohomology spectral sequence

Let `F : 𝒜 → ℬ` be left exact, `𝒜` with enough injectives, `K` bounded below and `I` a
Cartan–Eilenberg resolution of `K`. Define the *first hypercohomology spectral sequence* `′E(F, K)` as
the first spectral sequence (1.2) of the double complex `F(I)`. Prove (stacks-05QI line 3655–3681,
Lemma 21.3, tag 015J, first spectral sequence; grothendieck1957 line 1236–1252, (2.4.2)):

- `′E_1^{p,q} ≅ R^qF(K^p)`, with `′d_1 = R^qF(d_K^p)`, and `′E_2^{p,q} ≅ H^p(R^qF(K^•))`;
- it converges strongly in every degree to `R^{p+q}F(K)`, with finite filtrations, and
  `′E_1^{p,q} = 0` unless `p ≥ a` and `q ≥ 0`; the abutment is identified through
  `Hⁿ(Tot F(I)) = Hⁿ(F(Tot I)) ≅ RⁿF(K)` (2.3, 2.2(ii));
- *independence and naturality from page 1:* for `f : K → L` and any lift `f̃` (2.3), `F(f̃)` induces
  a morphism of converging spectral sequences (base §3.3) whose page-`1` component is `R^qF(f^p)` and
  whose abutment component is `RⁿF(f)`. Two lifts give morphisms with the same page-`1` component,
  hence the same morphism (the field `comm` of `CategoryTheory.SpectralSequence.Hom` determines each
  page from the previous one). A lift of the identity between two Cartan–Eilenberg resolutions of `K`
  is an isomorphism of spectral sequences (Tau Ceti
  `CategoryTheory.SpectralSequence.Hom.isIso_hom_f_of_le`);
- (grothendieck1957 line 1348–1354, Remarque 3) if `K` is a resolution of an object `A`
  (`K^p = 0` for `p < 0`, `H^0(K) = A`, `H^p(K) = 0` for `p ≠ 0`), the sequence is
  `′E_1^{p,q} = R^qF(K^p) ⇒ R^{p+q}F(A)`.

*Needs:* 1.2, 1.3(a); 2.2(ii), 2.3; base §3.3; Mathlib `CategoryTheory.SpectralSequence.Hom`; Tau Ceti
`CategoryTheory.SpectralSequence.Hom.isIso_hom_f_of_le`.

- Natural in `F`: a natural transformation `F ⟶ F′` induces a morphism of first hypercohomology
  spectral sequences whose page-`1` component is `R^q` of it at `K^p`.

**Checks.**

- For `F = Hom_ℤ(ℤ/2, −)` and `K = (ℤ →(×2) ℤ)` in degrees `0, 1`: `′E_1^{0,1} = ′E_1^{1,1} = Ext¹(ℤ/2, ℤ)
  = ℤ/2`, `′E_1^{p,0} = 0`, and `′d_1 = Ext¹(ℤ/2, ×2) = 0`. The abutment is `ℤ/2` in degrees `1` and `2`,
  agreeing with `K ≃ ℤ/2[−1]` and `Ext^{n−1}(ℤ/2, ℤ/2)`.
- For `K = A[0]` the sequence is concentrated in column `0` with `′E_1^{0,q} = R^qF(A)`.
- If every `K^p` is `F`-acyclic, `′E_1` is concentrated in row `0` and gives `RⁿF(K) ≅ Hⁿ(F(K))`, as
  Leray's acyclicity lemma 2.2(v) asserts.

### 2.5 The second hypercohomology spectral sequence

With `F`, `K` and `I` as in 2.4, define the *second hypercohomology spectral sequence* `″E(F, K)` as
the second spectral sequence (1.2) of `F(I)`. Prove (stacks-05QI line 3655–3689, Lemma 21.3, tag
015J; grothendieck1957 line 1236–1252 and 1291–1299):

- `″E_1^{p,q} ≅ F(H_I^q(I)^p)`, where `H_I^q(I)` is the complex, in the resolution degree, of horizontal
  cohomologies, with `″d_1` induced by its differential, and
  `″E_2^{p,q} ≅ R^pF(H^q(K))`; the first identification uses the split rows of 2.3;
- it converges strongly in every degree to `R^{p+q}F(K)`, with finite filtrations, and `″E_2^{p,q} = 0`
  unless `p ≥ 0` and `H^q(K) ≠ 0`;
- *independence and naturality from page 2:* for `f : K → L`, the morphism induced by any lift has
  page-`2` component `R^pF(H^q(f))` and abutment component `RⁿF(f)`, so it does not depend on the
  lift. A quasi-isomorphism induces an isomorphism from page `2` on. Hence, restricted to its pages
  `r ≥ 2`, `″E(F, −)` factors through the localisation `DerivedCategory.Plus.Q` and is a functor on
  `DerivedCategory.Plus 𝒜`; it is natural in `F`;
- *F-acyclic Cartan–Eilenberg resolutions* (grothendieck1957 line 1295–1298). If `L` is a double
  complex satisfying the conditions of 2.3 with "injective resolution" replaced by "resolution by
  `F`-acyclic objects", then `F` commutes with the horizontal cycles, boundaries and cohomology of `L`,
  and the second spectral sequence of `F(L)` is isomorphic from page `2` on, compatibly with the
  abutments, to `″E(F, K)`. Route: lift the identity of `K` from `L` to a Cartan–Eilenberg resolution
  (2.3, lifting from resolutions); on page `2` the induced map is the identity of `R^pF(H^q K)`, the
  two sides being computed by Leray's acyclicity lemma 2.2(v);
- (grothendieck1957 line 1352–1356, Remarque 3) if every `K^p` is `F`-acyclic, the sequence is
  `″E_2^{p,q} = R^pF(H^q(K)) ⇒ H^{p+q}(F(K))`.

*Needs:* 1.2, 1.3(a); 2.2(ii), 2.2(v), 2.3; base §3.3; Mathlib `CategoryTheory.SpectralSequence.Hom`,
`DerivedCategory.Plus.Q`; Tau Ceti `CategoryTheory.SpectralSequence.Hom.isIso_hom_f_of_le`.

**Checks.**

- For `F = Hom_ℤ(ℤ/2, −)` and `K = (ℤ →(×2) ℤ)`: `H^0(K) = 0`, `H^1(K) = ℤ/2`, so
  `″E_2^{0,1} = Hom(ℤ/2, ℤ/2) = ℤ/2` and `″E_2^{1,1} = Ext¹(ℤ/2, ℤ/2) = ℤ/2`, in total degrees `1` and
  `2`; all `d_r` vanish for degree reasons, and the abutment agrees with 2.4's Check.
- For `K = A[0]`, `″E_2^{p,0} = R^pF(A)` and the sequence degenerates at page `2`.
- *The Cartan–Eilenberg conditions are needed.* For `F` the identity of abelian groups and the column
  resolution of 2.3's third Check, the second spectral sequence of that double complex has its only
  nonzero class `ℤ/2` at `(1, 0)` (horizontal kernel of `×2` on `ℚ/ℤ`, in row `1`), while
  `″E_2^{p,q} = R^pF(H^q K)` has it at `(0, 1)`. Both converge to `H^1(K) = ℤ/2`, with different
  filtrations.

### 2.6 Right exact and contravariant functors

Let `F : 𝒜 → ℬ` be right exact with `𝒜` having enough projectives, so that `Fᵒᵖ : 𝒜ᵒᵖ → ℬᵒᵖ` is left
exact and `𝒜ᵒᵖ` has enough injectives. Define, for a bounded-above complex `K` of `𝒜`, the
*hyper-left-derived functors* `L_nF(K) := unop R^nFᵒᵖ(K°)`. Prove (grothendieck1957 line 1304–1308;
stacks-05QI line 3449–3478, §19, the dual statements; weibel1994 §5.7, uncertified):

- for an object `A`, `L_nF(A) ≅ (F.leftDerived n).obj A` naturally (a projective resolution of `A` is
  an injective resolution of `op A` in `𝒜ᵒᵖ`; Mathlib `ProjectiveResolution.isoLeftDerivedObj`);
  `L_0F(A) ≅ F(A)` (Mathlib `Functor.leftDerivedZeroIsoSelf`);
- *projective Cartan–Eilenberg resolutions* of `K` are the unop of Cartan–Eilenberg resolutions of
  `K°`; they exist, their rows split, their total complex is a bounded-above complex of projectives
  quasi-isomorphic to `K`, and chain maps lift;
- the two *hyperhomology spectral sequences* `E^1_{p,q} = L_qF(K_p)` and `E^2_{p,q} = L_pF(H_q(K))`,
  with `K_p = K^{−p}` and `H_q = H^{−q}`, are the unop of 2.4 and 2.5 for `Fᵒᵖ` at `K°`; they converge
  strongly with finite filtrations to `L_{p+q}F(K)` in the homological bidegree assignment of base
  §2.1, with the same independence and naturality;
- a contravariant left exact functor `G : 𝒜ᵒᵖ → ℬ` has hypercohomology spectral sequences at `K°`:
  `′E_1^{p,q} = R^qG(op K^{−p})` and `″E_2^{p,q} = R^pG(op H^{−q}(K))`, converging to `R^{p+q}G(K°)`,
  computed from projective Cartan–Eilenberg resolutions of `K`.

*Needs:* 2.2–2.5; Mathlib `CochainComplex.opEquivalence`, `HomologicalComplex.homologyOp`,
`CategoryTheory.Functor.leftDerived`, `CategoryTheory.ProjectiveResolution.isoLeftDerivedObj`,
`CategoryTheory.Functor.leftDerivedZeroIsoSelf`, the instance `EnoughInjectives 𝒜ᵒᵖ`; base §2.1.

**Checks.**

- For `F = − ⊗ ℤ/2` on abelian groups, `L_1F(ℤ/2) = Tor_1(ℤ/2, ℤ/2) = ℤ/2`: the projective resolution
  `0 → ℤ →(×2) ℤ → ℤ/2` becomes `ℤ/2 →(0) ℤ/2`.
- *Index witness.* For `K = (ℤ →(×2) ℤ)` in cohomological degrees `−1, 0` (homological `1, 0`) and the
  same `F`: `E^1_{0,0} = E^1_{1,0} = ℤ/2`, `d^1 = 0`, so `L_0F(K) = L_1F(K) = ℤ/2`, in agreement with
  `K ≃ ℤ/2[0]` and `Tor_n(ℤ/2, ℤ/2)`. Indexing `E^1_{p,q}` by `K^p` in place of `K^{−p}` would put a term
  in homological degree `−1`.
- An exact `F` has `L_nF(A) = 0` for `n > 0`.

### Examples

`Hom_ℤ(ℤ/2, −)` on `ℤ →(×2) ℤ` computes both hypercohomology spectral sequences with the same abutment
and different pages. SchemeKTheoryOperations §6.7's hyperhomology spectral sequence of a group acting
on a chain complex is the homological first sequence of 2.6 for coinvariants, and
TopologicalSheafCohomology §1.4's Čech hypercohomology sequences are first and second sequences of
double complexes (1.2) on a fixed cover.

### Dependencies

Layer 1; base §3.3; Mathlib derived functors on `D⁺`, classical derived functors, resolutions and
opposite complexes, K-injective complexes and the lifting of maps to injective resolutions; Tau
Ceti's one-step injective horseshoe in an exact category.

## Layer 3: composite functors

### 3.1 Composition of right derived functors

Let `F : 𝒜 → ℬ` and `G : ℬ → 𝒞` be left exact, with `𝒜` and `ℬ` having enough injectives. Define the
*composition transformation* `t : R(G ∘ F) ⟶ RF ⋙ RG` of functors `DerivedCategory.Plus 𝒜 ⥤
DerivedCategory.Plus 𝒞` as the transformation given by the universal property of the right derived
functor `R(G ∘ F)` (Mathlib's `IsRightDerivedFunctor` for `rightDerivedFunctorPlusUnit`) applied to the
composite of the units of `RF` and `RG`. Prove (stacks-05QI line 3696–3717, Lemma 22.1, tags 015L and
015M): `t` is an isomorphism if and only if `F(I)` is `G`-acyclic for every injective `I` of `𝒜`.
Prove also (grothendieck1957 line 1338–1342, Remarque 1) that this holds if and only if every object
of `𝒜` embeds into an object `M` with `R^qG(F(M)) = 0` for `q > 0`, and that it holds when `F` has an
exact left adjoint (then `F` preserves injectives: Mathlib `CategoryTheory.Injective.injective_of_adjoint`).
Route: at a bounded-below complex `A` with injective resolution `A → J`, `t` is the map
`(G ∘ F)(J) → RG(F(J))`, an isomorphism by Leray's acyclicity lemma 2.2(v); conversely evaluate `t` at
`I[0]`. *Needs:* 2.2(ii), 2.2(v); Mathlib `CategoryTheory.Functor.rightDerivedFunctorPlus`,
`CategoryTheory.Functor.rightDerivedFunctorPlusUnit`, `CategoryTheory.Injective.injective_of_adjoint`.

- `t` is compatible with the units, natural in `F` and `G`, and the identity when `F` or `G` is the
  identity functor.

**Checks.**

- *The criterion is sharp.* For `F = G = Hom_ℤ(ℤ/2, −)` on abelian groups, `F(ℚ/ℤ) = ℤ/2` is not
  `G`-acyclic (`Ext¹(ℤ/2, ℤ/2) = ℤ/2`), and `t` fails at `ℚ/ℤ`: `G ∘ F = Hom(ℤ/2 ⊗ ℤ/2, −) = Hom(ℤ/2, −)`
  gives `R¹(G ∘ F)(ℚ/ℤ) = 0`, while `H¹(RG(RF(ℚ/ℤ))) = H¹(RG(ℤ/2)) = ℤ/2`.
- For `F` the identity, the condition holds and `t` is the identity.
- For a ring map `R → S`, `ModuleCat.coextendScalars` is right adjoint to the exact restriction of
  scalars (`ModuleCat.restrictCoextendScalarsAdj`), so it preserves injectives and satisfies the
  condition for every `G`.

### 3.2 The composite-functor spectral sequence of a complex

Let `F`, `G` satisfy the equivalent conditions of 3.1, and `X` be an object of
`DerivedCategory.Plus 𝒜`. Define the *composite-functor spectral sequence* `E(F, G; X)` as the second
hypercohomology spectral sequence `″E(G, F(J))` (2.5), for a bounded-below complex `J` of injectives
representing `X`, with abutment `RⁿG(F(J)) ≅ Hⁿ(RG(RF(X))) ≅ Rⁿ(G ∘ F)(X)` through `t⁻¹`. Prove
(stacks-05QI line 3718–3730, Lemma 22.2, tag 015N; grothendieck1957 line 1309–1337, Théorème 2.4.1):

- `E₂^{p,q} ≅ R^pG(H^q(RF(X)))`, and for `X = A[0]`, `E₂^{p,q} ≅ R^pG(R^qF(A))`;
- it converges strongly in every degree to `R^{p+q}(G ∘ F)(X)`, with finite filtrations, and
  `E₂^{p,q} = 0` unless `p ≥ 0` and `q ≥ a` when `Hⁱ(X) = 0` for `i < a`;
- from page `2` on it does not depend on `J` and is a functor of `X` on `DerivedCategory.Plus 𝒜`;
- *computation by F-acyclic resolutions* (grothendieck1957 line 1343–1347, Remarque 2, and line
  1506–1529, Proposition 2.5.4): for any bounded-below complex `L` of `F`-acyclic objects
  quasi-isomorphic to `X`, `E(F, G; X)` is isomorphic from page `2` on to `″E(G, F(L))`. Route: `F(L)` and
  `F(J)` are isomorphic in `DerivedCategory.Plus ℬ` (2.2(v)), and `″E(G, −)` is a functor there (2.5);
- for `X = A[0]` this is ArithmeticGaloisDuality §D7.1's *Derived composite spectral sequence*, built
  by the same construction, with its edge maps.

*Needs:* 2.2(v), 2.5, 3.1; ArithmeticGaloisDuality §D7.1; Mathlib `DerivedCategory.Plus`.

**Checks.**

- If `F` is exact, `R^qF(A) = 0` for `q > 0` and `R^pG(F(A)) ≅ R^p(G ∘ F)(A)`; if `G` is exact, only the
  column `p = 0` survives and `G(R^qF(A)) ≅ R^q(G ∘ F)(A)` (ArithmeticGaloisDuality §D7.1's Checks).
- *Acyclicity cannot be dropped.* For the pair of 3.1's first Check at `A = ℚ/ℤ`, the would-be page
  `R^pG(R^qF(ℚ/ℤ))` is the single row `q = 0` with `E₂^{1,0} = Ext¹(ℤ/2, ℤ/2) = ℤ/2`, which would survive
  and force `R¹(G ∘ F)(ℚ/ℤ) ≠ 0`; in fact `R¹(G ∘ F)(ℚ/ℤ) = 0`.
- For `ℤ/4 → ℤ/2`, `F = Hom_{ℤ/4}(ℤ/2, −)` (coextension of scalars) and `G = Hom_{ℤ/2}(ℤ/2, −)`, at
  `A = ℤ/2`: `R^qF(ℤ/2) = Ext^q_{ℤ/4}(ℤ/2, ℤ/2) = ℤ/2` for every `q ≥ 0` (`ℤ/4` is self-injective, and
  `Hom_{ℤ/4}(ℤ/2, −)` of the injective resolution `ℤ/2 → ℤ/4 →(×2) ℤ/4 →(×2) ⋯` has zero
  differentials), `G` is exact, so
  `E₂^{0,q} = ℤ/2` and `E₂^{p,q} = 0` for `p > 0`, and the abutment is `Ext^n_{ℤ/4}(ℤ/2, ℤ/2) = ℤ/2`.

### 3.3 Low degrees and naturality in the functors

For an object `A` of `𝒜`, prove (base §3.6, first quadrant, applied to the sequence of 3.2, which
for an object is the spectral sequence of grothendieck1957 line 1330–1337, Théorème 2.4.1):

- the five-term exact sequence
  `0 → R¹G(F(A)) → R¹(G ∘ F)(A) → G(R¹F(A)) → R²G(F(A)) → R²(G ∘ F)(A)`, whose first, second and
  fourth maps are the edge maps of ArithmeticGaloisDuality §D7.1 and whose third map is `d₂`;
- for `m ≥ 1`, if `R^qF(A) = 0` for `0 < q < m`, then `R^jG(F(A)) ≅ R^j(G ∘ F)(A)` for `j < m` and
  `0 → R^mG(F(A)) → R^m(G ∘ F)(A) → G(R^mF(A)) → R^{m+1}G(F(A)) → R^{m+1}(G ∘ F)(A)` is exact;
- *naturality in the functors:* natural transformations `α : F ⟶ F′` and `β : G ⟶ G′`, between pairs
  satisfying 3.1's condition, induce morphisms of composite-functor spectral sequences (base §3.3)
  whose page-`2` components are `R^pG(R^qα)` and `R^pβ(R^qF)` and whose abutment components are those
  of `Mathlib`'s `CategoryTheory.NatTrans.rightDerivedFunctorPlus`; the morphisms are natural in `A`.

Route: base §3.6 applied to the first-quadrant convergence of 3.2, with ArithmeticGaloisDuality
§D7.1's identification of the edge maps; for naturality, `α` gives a chain map `F(J) → F′(J)` and 2.5's
naturality in the complex, and `β` gives `G(I) → G′(I)` and 2.5's naturality in the functor.
*Needs:* 3.2; base §§3.3, 3.6; ArithmeticGaloisDuality §D7.1; Mathlib
`CategoryTheory.NatTrans.rightDerivedFunctorPlus`.

**Checks.**

- For the coextension example of 3.2, the five-term sequence reads
  `0 → 0 → ℤ/2 → ℤ/2 → 0 → ℤ/2`, with the middle map an isomorphism.
- If `F` is exact the hypothesis holds for every `m`, and `R^jG(F(A)) ≅ R^j(G ∘ F)(A)` for all `j`.
- The identity transformations induce identity morphisms.

### 3.4 Right exact and mixed-variance composites

Prove, by 3.1–3.3 applied in opposite categories (2.6) (weibel1994 §5.8, uncertified;
cartan-eilenberg1956 Ch. XVI, uncertified):

- *Right exact composites.* For right exact `F : 𝒜 → ℬ`, `G : ℬ → 𝒞` with `𝒜`, `ℬ` having enough
  projectives and `F` sending projectives to objects `B` with `L_qG(B) = 0` for `q > 0`: the composition
  transformation of 3.1 for `Fᵒᵖ`, `Gᵒᵖ` is an isomorphism, and for an object `A` there is a spectral
  sequence `E²_{p,q} = L_pG(L_qF(A)) ⇒ L_{p+q}(G ∘ F)(A)`, converging strongly with finite filtrations
  in the homological bidegree assignment, with the exact sequence
  `L₂(G ∘ F)(A) → L₂G(F(A)) → G(L₁F(A)) → L₁(G ∘ F)(A) → L₁G(F(A)) → 0` and naturality as in 3.3.
- *Mixed variance.* For right exact `F : 𝒜 → ℬ` (enough projectives in `𝒜` and `ℬ`) and a left exact
  `G : ℬᵒᵖ → 𝒞`, with `R^qG(op F(P)) = 0` for `q > 0` and every projective `P`, there is a spectral sequence
  `E₂^{p,q} = R^pG(op L_qF(A)) ⇒ R^{p+q}(G ∘ Fᵒᵖ)(op A)`, with the low-degree sequences of 3.3.

*Needs:* 2.6, 3.1–3.3.

**Checks.**

- For `ℤ → ℤ/2`, `F = ModuleCat.extendScalars` and `G = Hom_{ℤ/2}(−, ℤ/2)`, at `A = ℤ/2`:
  `L_qF(ℤ/2) = Tor^ℤ_q(ℤ/2, ℤ/2) = ℤ/2` for `q = 0, 1`, `G` is exact, so `E₂^{0,q} = ℤ/2` for `q = 0, 1`,
  and the abutment is `Ext^n_ℤ(ℤ/2, ℤ/2) = ℤ/2` for `n = 0, 1` and `0` otherwise.
- If `F` is exact and preserves projectives, `L_pG(F(A)) ≅ L_p(G ∘ F)(A)`.
- With `F = − ⊗ ℤ/2` and `G = Hom_ℤ(−, ℤ)`, projectives `ℤ^{(X)}` go to `(ℤ/2)^{(X)}`, which are not
  `G`-acyclic (`Ext¹(ℤ/2, ℤ) = ℤ/2`): the mixed-variance hypothesis fails, as it must, since
  `G ∘ Fᵒᵖ = Hom(− ⊗ ℤ/2, ℤ) = 0` has zero derived functors while `R¹G(op L₀F(ℤ)) = Ext¹(ℤ/2, ℤ) ≠ 0`.

### Examples

SchemeAndStackFoundations §2.2's `leray_spectral_sequence` is 3.2 for a direct image, which has the
exact left adjoint inverse image and preserves injectives, followed by global sections (as obtained
at grothendieck1957 line 2421–2425 and Théorème 3.7.3, line 2443–2456); its `cech_to_cohomology` is a
second hypercohomology sequence of the Čech resolution, or 3.2 for the Čech complex of a covering
followed by `H⁰` (grothendieck1957 line 2493–2509), and its `localToGlobal` and
`hochschildSerre_galois_covering` are composite-functor sequences of sections with supports and of
invariants. The local-to-global Ext sequence `E₂^{p,q} = H^p(X, ℰxt^q(F, G)) ⇒ Ext^{p+q}(F, G)` is 3.2 for
`Γ ∘ ℋom(F, −)`. For a group `G` with normal subgroup `N`, invariants under `N` are right adjoint to the
exact inflation, so invariants under `N` followed by invariants under `G/N` satisfy 3.1.

### Dependencies

Layer 2; base §§3.3, 3.6; ArithmeticGaloisDuality §D7.1; Mathlib derived functors on `D⁺`.

## Layer 4: Tor and Ext over rings

### 4.1 Balancing Tor

Let `𝒞` be a monoidal abelian category (Mathlib `MonoidalCategory`, `MonoidalPreadditive`,
`HasProjectiveResolutions`) in which, for every projective `P`, the functors `P ⊗ −` and `− ⊗ P` are
exact. Prove that there is an isomorphism `Tor 𝒞 n ≅ Tor' 𝒞 n` of functors `𝒞 ⥤ 𝒞 ⥤ 𝒞` for every
`n` (weibel1994 Theorem 2.7.2, uncertified). Route: for projective resolutions `P → X` and `Q → Y`, the
first-quadrant homological double complex `P ⊠ Q` (Mathlib
`CategoryTheory.Functor.mapBifunctorHomologicalComplex`) has exact augmented rows `P_• ⊗ Q_j → X ⊗ Q_j`
and exact augmented columns `P_i ⊗ Q_• → P_i ⊗ Y`; Tau Ceti's
`HomologicalComplex₂.quasiIso_totalAugmentation_of_rows`, applied to `P ⊠ Q` and to its flip with
`HomologicalComplex₂.totalFlipIso`, gives quasi-isomorphisms `X ⊗ Q ← Tot(P ⊠ Q) → P ⊗ Y`, whose
homologies are `Tor_n(X, Y)` and `Tor'_n(X, Y)`; naturality comes from the lifting of maps to projective
resolutions. `ModuleCat R` for a commutative ring `R` satisfies the hypothesis, projective modules
being flat. *Needs:* Mathlib `CategoryTheory.Tor`, `CategoryTheory.Tor'`,
`CategoryTheory.Functor.mapBifunctorHomologicalComplex`, `HomologicalComplex₂.totalFlipIso`,
`CategoryTheory.ProjectiveResolution.isoLeftDerivedObj`; Tau Ceti
`HomologicalComplex₂.quasiIso_totalAugmentation_of_rows`.

**Checks.**

- `Tor_1(ℤ/4, ℤ/6) = ℤ/2` both ways: resolving `ℤ/6` gives the kernel of `×6` on `ℤ/4`, which is
  `{0, 2}`; resolving `ℤ/4` gives the kernel of `×4` on `ℤ/6`, which is `{0, 3}`.
- In degree `0` both sides are the tensor product (Mathlib `Functor.leftDerivedZeroIsoSelf`).
- For a projective `X`, `Tor_n(X, Y) = 0` for `n > 0`, which by definition is a statement about the
  second variable and follows here from `CategoryTheory.isZero_Tor'_succ_of_projective`.
- *Ext needs no balancing at the pin.* `Ext¹_ℤ(ℤ/2, ℤ)` is `ℤ/2` both from `ℤ →(×2) ℤ → ℤ/2` (Mathlib
  `ProjectiveResolution.extEquivCohomologyClass`) and from `ℤ → ℚ → ℚ/ℤ` (Mathlib
  `InjectiveResolution.extEquivCohomologyClass`); the double complex `Hom(P, I)` is first-quadrant and
  its two augmentations are quasi-isomorphisms by 1.5.

### 4.2 Universal-coefficient spectral sequences

- (a) *Tor form.* For a commutative ring `R`, a complex `K` of `R`-modules (no boundedness) and an
  `R`-module `M`, there is a spectral sequence `E₂^{p,q} = Tor^R_{−p}(H^q(K), M) ⇒ H^{p+q}(K ⊗^L M)`,
  converging strongly, with `E₂^{p,q} = 0` for `p > 0`, natural in `K` and `M`. It is `″E` of the double
  complex `K ⊠ P` on `Tot^⊕`, for a projective resolution `P` of `M` in degrees `≤ 0`: its rows vanish
  for `q > 0`, so 1.3(b) applies; `″E_1^{p,q} = H^q(K) ⊗ P^p` since `P^p` is flat, so
  `″E_2^{p,q} = Tor_{−p}(H^q K, M)` (Mathlib `CategoryTheory.Tor` resolves the second variable); and
  `Tot^⊕(K ⊠ P) = K ⊗ P` computes `K ⊗^L M` (DerivedModuleAlgebra §0.2). If `K` is bounded above, the
  first spectral sequence `E₁^{p,q} = Tor^R_{−q}(K^p, M)` converges to the same abutment by 1.3(b).
  If `Tor^R_i = 0` for `i ≥ 2`, the two columns give
  `0 → Hⁿ(K) ⊗ M → Hⁿ(K ⊗^L M) → Tor^R_1(H^{n+1}(K), M) → 0` (base §§1.3, 3.4)
  (stacks-more-algebra line 7121–7134, Example 63.1, tag 061Z, for `K` bounded above; line 7413–7422,
  Example 65.5, tag 0H80).
- (b) *Ext forms.* For any ring `R`, an `R`-module `M` and `K` with `Hⁱ(K) = 0` for `i ≪ 0`, with
  `Extⁿ(M, K) := Hom_{D(R)}(M[0], K[n])`, there are spectral sequences
  `E₂^{i,j} = Ext^i_R(M, H^j(K)) ⇒ Ext^{i+j}_R(M, K)` and, for a bounded-below representative,
  `E₁^{i,j} = Ext^j_R(M, K^i) ⇒ Ext^{i+j}_R(M, K)`: the hypercohomology sequences 2.4, 2.5 of
  `Hom_R(M, −)`, with `R^iHom(M, −)(N) ≅ CategoryTheory.Abelian.Ext M N i` through
  `InjectiveResolution.extEquivCohomologyClass`, and `RⁿHom(M, −)(K) ≅ Hom_{D(R)}(M[0], K[n])` since
  bounded-below complexes of injectives are K-injective (stacks-more-algebra line 8115–8127, §69, tags 0AVG, 0AVH,
  0AVI).
- (c) *Contravariant Ext form.* For any ring `R`, an `R`-module `M` and `K` with `Hⁱ(K) = 0` for `i ≫ 0`,
  there is a spectral sequence `E₂^{p,q} = Ext^p_R(H^{−q}(K), M) ⇒ Hom_{D(R)}(K, M[p+q])`, the second
  hypercohomology sequence of the contravariant `Hom_R(−, M)` at `K°` (2.6); for `K = P` a bounded-above
  complex of projectives the abutment is `H^{p+q}(Hom_R(P, M))`. If `Ext^i_R = 0` for `i ≥ 2`, the two
  columns give `0 → Ext¹_R(H^{1−n}(K), M) → Hom_{D(R)}(K, M[n]) → Hom_R(H^{−n}(K), M) → 0`.

*Needs:* 1.2, 1.3(b), 2.4–2.6; base §§1.3, 3.4; DerivedModuleAlgebra §0.2; Mathlib `CategoryTheory.Tor`,
`CategoryTheory.Abelian.Ext`, `CategoryTheory.InjectiveResolution.extEquivCohomologyClass`,
`CochainComplex.IsKInjective`, `CochainComplex.IsKProjective`.

**Checks.**

- `ℤ/2 ⊗^L ℤ/2` over `ℤ`: `E₂^{0,0} = ℤ/2` and `E₂^{−1,0} = ℤ/2`, so `H^0 = H^{−1} = ℤ/2`, as
  DerivedModuleAlgebra §0.2's Check computes from `ℤ →(×2) ℤ`.
- *Unbounded complexes.* For `K = ⊕_{n ∈ ℤ} ℤ/2[n]` (zero differential) and `M = ℤ/2`, every
  `Hⁿ(K ⊗^L M)` is an extension of `Tor_1 = ℤ/2` by `ℤ/2 ⊗ ℤ/2`, and indeed `K ⊗^L ℤ/2 = ⊕ (ℤ/2 ⊗^L ℤ/2)[n]`
  has `Hⁿ = (ℤ/2)²`.
- *Contravariant form.* For the chain complex `X = (ℤ →(×2) ℤ)` in homological degrees `1, 0` and
  `M = ℤ`: `E₂^{1,0} = Ext¹(H_0 X, ℤ) = ℤ/2` and `E₂^{0,0} = Hom(ℤ/2, ℤ) = 0`, so `H¹(Hom(X, ℤ)) = ℤ/2`,
  which a direct computation of `ℤ →(×2) ℤ` confirms. Over a hereditary ring the two-column sequence
  is Tau Ceti's `TauCeti.ChainComplex.exact_extToHomology_kronecker`
  (`0 → Ext¹(H_{n−1}X, M) → Hⁿ(Hom(X, M)) → Hom(H_n X, M) → 0`).
- For an injective `M` the contravariant sequence is concentrated in column `0` and
  `Hom_{D(R)}(K, M[n]) ≅ Hom_R(H^{−n}(K), M)`.

### 4.3 The Künneth spectral sequence

Let `R` be a commutative ring and `K`, `L` complexes of `R`-modules with `Hⁱ = 0` for `i ≫ 0`,
represented by bounded-above complexes. Prove that there is a spectral sequence
`E₂^{p,q} = ⊕_{i+j=q} Tor^R_{−p}(H^i(K), H^j(L)) ⇒ H^{p+q}(K ⊗^L L)`, with finitely many nonzero terms in
each total degree, converging strongly with finite filtrations, natural in `K` and `L` from page `2`
(stacks-more-algebra line 7399–7412, Lemma 65.4, tag 0H7Z, proved there for bounded complexes;
cartan-eilenberg1956 Ch. XVII, uncertified; weibel1994 §5.6, uncertified). Route: let `P` be a
projective Cartan–Eilenberg resolution of `K` (2.6), with resolution degree `s ≤ 0`, so that `Tot(P)` is
a bounded-above complex of projectives quasi-isomorphic to `K` and `Tot(P) ⊗ L` computes `K ⊗^L L`
(DerivedModuleAlgebra §0.2). Filter `Tot(P) ⊗ L` by `F^s = Tot(rows of P of index ≥ s) ⊗ L`; the
filtration is finite in each degree, so its spectral sequence (base §5.1) converges strongly (base
§5.3). Its graded pieces are the rows `P_s` of `P` tensored with `L`, and each `P_s` is a split complex
with projective cohomology `H_I(P)_s`, so `E₁^{s,m} ≅ ⊕_{i+j=m} H_I^i(P)_s ⊗ H^j(L)` (the Künneth
isomorphism for split complexes below). Each `H_I^i(P)` is a projective resolution of `H^i(K)`, so
`E₂^{s,m} ≅ ⊕_{i+j=m} Tor'_{−s}(H^i K, H^j L) ≅ ⊕ Tor_{−s}(H^i K, H^j L)` by 4.1. Naturality from page `2`
follows from the lifting of 2.6. *Needs:* 2.6, 4.1; base §§5.1, 5.3; DerivedModuleAlgebra §0.2; Tau Ceti
`CochainComplex.isKFlat_of_boundedAbove_flat`, `HomologicalComplex.homologyCross`.

- *Künneth isomorphism for split complexes.* For a complex `S` of `R`-modules whose differentials split
  and whose cohomology is projective, and any complex `L`, the cross product
  `⊕_{i+j=n} H^i(S) ⊗ H^j(L) → Hⁿ(S ⊗ L)` is an isomorphism: `S` is the direct sum of its cohomology,
  with zero differential, and of contractible complexes.
- *Edge map.* The edge map `E₂^{0,n} = ⊕_{i+j=n} H^i(K) ⊗ H^j(L) ↠ E_∞^{0,n} = F^0 Hⁿ ↪ Hⁿ(K ⊗^L L)` is the
  cross product (Tau Ceti `HomologicalComplex.homologyCross` on representatives).
- If `K` is a bounded-above complex of flat modules, `Tot(K ⊗ L)` computes `K ⊗^L L`, so the sequence
  abuts to `H^{p+q}(Tot(K ⊗ L))`.
- If `Tor^R_i = 0` for `i ≥ 2`, the two columns `p ∈ {−1, 0}` give
  `0 → ⊕_{i+j=n} H^i(K) ⊗ H^j(L) → Hⁿ(K ⊗^L L) → ⊕_{i+j=n+1} Tor^R_1(H^i K, H^j L) → 0` (stacks-more-algebra
  line 7413–7422, Example 65.5, tag 0H80).

**Checks.**

- `K = L = ℤ/2[0]` over `ℤ`: `E₂^{0,0} = E₂^{−1,0} = ℤ/2`, and the two-column sequence gives `H^0 = H^{−1} = ℤ/2`.
- *Non-degeneration at two columns.* Over `R = k[ε]/(ε²)` with `K = L = k[0]`, `E₂^{p,0} = Tor_{−p}(k, k) = k`
  for every `p ≤ 0`; the page is concentrated on the row `q = 0`, every `d_r` with `r ≥ 2` leaves it, so
  `H^{−n}(k ⊗^L k) = k` for every `n ≥ 0`: infinitely many columns, one term in each total degree.
- `K = R[0]` gives `E₂^{0,q} = H^q(L)` and nothing else.
- With `L = M[0]` the page and abutment are those of 4.2(a) for the bounded-above complex `K`.
- Over a ring of global dimension at most one, for complexes of projective modules indexed by `ℕ`
  placed in non-positive degrees, the two-column sequence is Tau Ceti's
  `HomologicalComplex.homologyKunnethShortComplex_shortExact`.

### 4.4 Change of rings

Let `f : R → S` be a ring map. Prove (stacks-more-algebra line 7135–7140, Example 63.2, tag 068F;
weibel1994 §5.6, the base-change spectral sequence for Tor, uncertified; cartan-eilenberg1956
Ch. XVI, uncertified):

- (a) For `R`, `S` commutative, an `R`-module `M` and an `S`-module `N`, a spectral sequence
  `E²_{p,q} = Tor^S_p(Tor^R_q(M, S), N) ⇒ Tor^R_{p+q}(M, N)` (homological bidegrees, `N` restricted to
  `R`), converging strongly with finite filtrations. Route (Stacks): for a projective resolution `P` of
  `M`, `P ⊗_R N = (P ⊗_R S) ⊗_S N` with `P ⊗_R S` a complex of projective `S`-modules whose homology is
  `Tor'^R_q(M, S)`; apply 4.2(a) over `S` to it and `N`, and 4.1 to pass from `Tor'` to `Tor`.
- (b) For any rings, an `S`-module `N` and an `R`-module `M`, a spectral sequence
  `E₂^{p,q} = Ext^p_S(N, Ext^q_R(S, M)) ⇒ Ext^{p+q}_R(N, M)`: 3.2 for `F = ModuleCat.coextendScalars f`
  (which preserves injectives, 3.1's third Check) and `G = Hom_S(N, −)`, with `G ∘ F ≅ Hom_R(N, −)` by
  `ModuleCat.restrictCoextendScalarsAdj` and `R^qF(M) ≅ Ext^q_R(S, M)` as abelian groups.
- (c) For `R`, `S` commutative, an `R`-module `M` and an `S`-module `N`, a spectral sequence
  `E₂^{p,q} = Ext^p_S(Tor^R_q(S, M), N) ⇒ Ext^{p+q}_R(M, N)`: 3.4's mixed-variance sequence for
  `F = ModuleCat.extendScalars f`, which preserves projectives, and `G = Hom_S(−, N)`, with
  `G ∘ Fᵒᵖ ≅ Hom_R(−, N)` by `ModuleCat.extendRestrictScalarsAdj` and `L_qF(M) ≅ Tor^R_q(S, M)`.
- Each has the low-degree exact sequences of 3.3 and 3.4.

*Needs:* 3.1–3.4, 4.1, 4.2(a); Mathlib `ModuleCat.extendScalars`, `ModuleCat.coextendScalars`,
`ModuleCat.restrictScalars`, `ModuleCat.restrictCoextendScalarsAdj`, `ModuleCat.extendRestrictScalarsAdj`.

**Checks.**

- *A nonzero differential.* For `ℤ → ℤ/4`, `M = ℤ/2`, `N = ℤ/2`: `Tor^ℤ_q(ℤ/2, ℤ/4) = ℤ/2` for `q = 0, 1`,
  and `Tor^{ℤ/4}_p(ℤ/2, ℤ/2) = ℤ/2` for every `p ≥ 0`, so `E²_{p,q} = ℤ/2` for `p ≥ 0`, `q ∈ {0, 1}`. The
  abutment `Tor^ℤ_n(ℤ/2, ℤ/2)` is `ℤ/2` for `n = 0, 1` and `0` for `n ≥ 2`; as only `d²` can leave
  `E²_{p,0}` (into `E²_{p−2,1}`), every `d² : E²_{p,0} → E²_{p−2,1}` with `p ≥ 2` is an isomorphism.
- For `ℤ/4 → ℤ/2`, `N = M = ℤ/2`, (b) is the coextension example of 3.2: concentrated in column `0`,
  abutting to `Ext^n_{ℤ/4}(ℤ/2, ℤ/2) = ℤ/2`.
- For `ℤ → ℤ/2`, `M = N = ℤ/2`, (c) is 3.4's first Check, abutting to `Ext^n_ℤ(ℤ/2, ℤ/2)`.
- For `f` the identity, all three sequences are concentrated in one column or one row.

### Examples

AlgebraicTopology §5.1's Künneth spectral sequence of singular chains of `X × Y` is 4.3 for the
bounded-above complexes of free modules of singular chains (in non-positive cohomological degrees),
whose two-column collapse over a hereditary ring is Tau Ceti's Künneth sequence.
ArithmeticLocallySymmetricSpaces ALS.1.7's coefficient-change sequence for `RΓ(X_K, V)` is an instance
of 4.2(a).

### Dependencies

Layers 1–3; base §§1.3, 3.4, 5.1, 5.3; DerivedModuleAlgebra §0.2; Mathlib Tor, Ext and change of rings;
Tau Ceti K-flat complexes, cross products and first-quadrant bicomplexes.

## Layer 5: products

### 5.1 Pairings of exact couples

Let `R` be a commutative ring and `C₁ = (D₁, E₁; i₁, j₁, k₁)`, `C₂`, `C = (D, E; i, j, k)` cohomological
exact couples of `R`-modules (base §6.1, StableHomotopyKTheory §7.22). A *pairing* `φ : E₁ ⊗ E₂ → E` is a
family of bilinear maps `E₁^{s,t} × E₂^{s′,t′} → E^{s+s′,t+t′}`, written `xy`. For `n ≥ 0`, `φ` *satisfies
Massey's condition `μ_n`* if for all `x ∈ E₁^{s,t}`, `y ∈ E₂`, `a ∈ D₁`, `b ∈ D₂` with `k₁(x) = i₁ⁿ(a)` and
`k₂(y) = i₂ⁿ(b)` there is `c ∈ D` with `k(xy) = iⁿ(c)` and `j(c) = j₁(a)y + (−1)^{s+t} x j₂(b)`; it
*satisfies `μ`* if it satisfies every `μ_n` (may-primer line 249–266; massey1954, uncertified). Prove:
`μ_0` holds if and only if `d = jk` satisfies the Leibniz rule
`d(xy) = d(x)y + (−1)^{s+t} x d(y)`; under `μ_0`, `φ` satisfies `μ_n` if and only if the induced pairing
`φ′` of the derived couples satisfies `μ_{n−1}` (may-primer line 267–279, Proposition 4.1); hence if `φ`
satisfies `μ`, every induced pairing `φ_r : E_r(C₁) ⊗ E_r(C₂) → E_r(C)` on the pages of base §6.1 satisfies
`μ`, satisfies the Leibniz rule for `d_r`, and `φ_{r+1}` is the map induced on cohomology by `φ_r`
(may-primer line 280–287, Corollary 4.2). *Needs:* base §6.1; StableHomotopyKTheory §7.22; Mathlib
`ModuleCat`.

- The pairings `φ_r` are natural in morphisms of exact couples compatible with the pairings.
- `μ_0` for a pairing on `E₁ = E` is exactly that `φ` is a map of complexes for `jk`.

**Checks.**

- The zero pairing satisfies `μ` (take `c = 0`).
- For the Bockstein couple of `ℤ` (base §6.2's Check: `D = ℤ`, `i = ×ℓ`, `E = ℤ/ℓ`, `k = 0`) with the
  multiplication of `ℤ/ℓ`, `μ_n` holds with `c = 0`: `iⁿ(a) = 0` forces `a = 0` in `ℤ`.
- *A non-example.* For the couple of the stupid filtration of `ℤ →(×2) ℤ` (`E₁^{0,0} = E₁^{1,0} = ℤ`,
  `d₁ = ×2`) and the pairing multiplying `E^{0,0} × E^{0,0} → E^{0,0}` and zero elsewhere, `d(1·1) = 2` in
  `E^{1,0}` while `d(1)·1 + 1·d(1) = 0`, so `μ_0` fails.

### 5.2 Pairings of filtered complexes

Let `R` be commutative and `A`, `B`, `C` decreasingly filtered cochain complexes of `R`-modules, and
`φ : A ⊗ B → C` a chain map from the tensor product of complexes (Mathlib `HomologicalComplex.mapBifunctor`
with the sign `d(x ⊗ y) = dx ⊗ y + (−1)^{|x|} x ⊗ dy`) with `φ(F^pA ⊗ F^{p′}B) ⊆ F^{p+p′}C`. Prove
(may-primer line 295–324; mccleary2001 Ch. 2, uncertified):

- there are pairings `E_r^{p,q}(A) ⊗ E_r^{p′,q′}(B) → E_r^{p+p′,q+q′}(C)` for every `r ≥ 1`, each `d_r`
  satisfying `d_r(xy) = d_r(x)y + (−1)^{p+q} x d_r(y)`, the pairing on page `r + 1` induced on cohomology by
  the one on page `r`;
- the pairing on page `1` is the one induced by `φ` on `H(gr^p A) ⊗ H(gr^{p′} B) → H(gr^{p+p′} C)`;
- at every position where the three spectral sequences converge weakly through the comparison of
  base §4.3 (in particular under base §5.3 or §5.4), the pairing of limit pages is the one induced on
  graded pieces by `H(A) ⊗ H(B) → H(C)`, which respects the induced filtrations;
- the pairings are natural in filtered maps compatible with the pairings.

Route: the exact couples of the three filtered complexes (base §6.3) carry the pairing induced by `φ` on
`E₁ = H(gr)`, which satisfies `μ` (may-primer line 310–311): for `k₁(x) = i₁ⁿ(a)` choose a representative
`x̃` of `x` with `dx̃ ∈ F^{p+n+1}A` representing `a`, likewise `ỹ`, and take `c` the class of `d(x̃ỹ)`;
then 5.1. *Needs:* 5.1; base §§4.3, 5.1–5.4, 6.3; Mathlib `HomologicalComplex.mapBifunctor`.

**Checks.**

- *Leibniz on page 1 with a nonzero differential.* Over `𝔽₂`, `A = 𝔽₂[x, y]/(x²)` with `|x| = 1`,
  `|y| = 2`, `dx = y`, filtered by the powers of the ideal `(y)`. Then `E₁` has basis `y^p` at `(p, p)`
  and `xy^p` at `(p, p + 1)`, `d₁(xy^p) = y^{p+1}`, and `d₁(x·y) = y² = d₁(x)·y + x·d₁(y)`. `E₂ = 𝔽₂` at `(0, 0)`,
  which is `H(A)` with its product.
- The trivial filtration `F^0 = A`, `F^1 = 0` of a differential graded algebra gives `E₁ = H(A)` with its
  cohomology product and all differentials zero.
- For multiplicative filtrations of the zero complex all pairings are zero.

### 5.3 Pairings of double complexes

Let `R` be commutative and `K`, `L`, `M` double complexes of `R`-modules. Define a *pairing of double
complexes* as a family of bilinear maps `K^{p,q} × L^{p′,q′} → M^{p+p′,q+q′}` for which the induced map
`Tot^⊕(K) ⊗ Tot^⊕(L) → Tot^⊕(M)` is a chain map. Prove (cartan-eilenberg1956 Ch. XV, uncertified):

- the condition holds if and only if `d₁(xy) = d₁(x)y + (−1)^{p+q} x d₁(y)` and
  `d₂(xy) = (−1)^{p′} d₂(x)y + (−1)^q x d₂(y)` for `x ∈ K^{p,q}`, `y ∈ L^{p′,q′}`;
- the column filtrations, and the row filtrations, are multiplicative, so `′E` and `″E` carry pairings
  satisfying 5.2; on `′E₂ = H_I H_II` the pairing is the one induced on iterated cohomology;
- `″E`, being `′E` of the flip, uses the flipped pairing `x ·_{flip} y = (−1)^{pq′+p′q} xy`, the unique
  sign making `HomologicalComplex₂.totalFlipIso` multiplicative, and on `″E₂ = H_II H_I` its pairing is
  the one induced by the flipped pairing on iterated cohomology.

*Needs:* 1.1, 1.2, 5.2; Mathlib `HomologicalComplex₂.totalFlipIso`, `HomologicalComplex.mapBifunctor`.

- The tensor product `A ⊠ B` of two differential graded algebras, `K^{p,q} = A^p ⊗ B^q` with product
  `(a ⊗ b)(a′ ⊗ b′) = (−1)^{|b||a′|} aa′ ⊗ bb′`, is a pairing of double complexes with itself, with
  `Tot(A ⊠ B) = A ⊗ B` as differential graded algebras.

**Checks.**

- *The sign in the vertical rule.* In `A ⊠ B`, for `x = 1 ⊗ b ∈ K^{0,q}` and `y = a′ ⊗ 1 ∈ K^{p′,0}` with
  `p′` odd, `d₂(xy) = (−1)^{qp′} a′ ⊗ db = (−1)^{p′} d₂(x)y`; a rule `d₂(xy) = d₂(x)y + (−1)^q x d₂(y)` would
  give `(−1)^{(q+1)p′} a′ ⊗ db`, the wrong sign.
- *Graded commutativity.* For `A = B = ℤ[ε]/(ε²)` with `|ε| = 1` and zero differentials,
  `(ε ⊗ 1)(1 ⊗ ε) = ε ⊗ ε` and `(1 ⊗ ε)(ε ⊗ 1) = −ε ⊗ ε`, the Koszul sign of two elements of total degree `1`.
- A double complex concentrated in column `0` with its pairing is a differential graded algebra, and
  `′E₁ = H` with its product.

### Examples

DGFloer Layer 1 item 2's multiplicative Serre spectral sequence is 5.2 for the product-filtered cup
pairing of the Serre filtration. May's Example 4.3 (may-primer line 288–294), the Bockstein spectral
sequence of the singular cochains with the cup product, is 5.2 for the filtration of 6.1.

### Dependencies

Layer 1; base §§4.3, 5.1–5.4, 6.1, 6.3; StableHomotopyKTheory §7.22; Mathlib tensor products of complexes.

## Layer 6: the Bockstein spectral sequence

### 6.1 The Bockstein exact couple

Let `A` be a commutative ring, `f ∈ A`, and `M` a cochain complex of `A`-modules on every term of which
multiplication by `f` is injective. Define the *Bockstein exact couple* of `(M, f)` as the cohomological
exact couple (base §6.1) with `D^{s,t} = H^{s+t}(M)`, `E^{s,t} = H^{s+t}(M/fM)`, `i : D^{s+1,t−1} → D^{s,t}`
multiplication by `f`, `j` the reduction and `k` the connecting morphism of `0 → M →(f) M → M/fM → 0`, of
degrees `(−1, 1)`, `(0, 0)`, `(1, 0)`; and the *Bockstein spectral sequence* as its spectral sequence
(may-primer line 136–150, Example 2.3, for torsion-free chain complexes over `ℤ`; stacks-more-algebra
line 12960–13006, §97, the Bockstein operators, and line 13013–14, footnote 18; mccleary2001 Ch. 10,
uncertified). *Needs:* base §§5.1, 6.1, 6.3; StableHomotopyKTheory §7.22; Mathlib connecting
morphisms.

- Exactness at the three vertices is the long exact cohomology sequence.
- *Periodicity.* `(s, t) ↦ (s + 1, t − 1)` is an automorphism of the couple; the pages `E_r^{s,t}` depend
  only on `n = s + t` and are written `E_r^n`.
- `E_1^n = Hⁿ(M/fM)`, and `d_1` is the connecting morphism of `0 → M/fM →(f) M/f²M → M/fM → 0`, the
  Bockstein operator.
- *The filtered complex.* The couple is isomorphic to the exact couple (base §6.3) of `M[1/f] = M ⊗_A A_f`
  filtered by `F^s = f^sM`, `s ∈ ℤ`, through multiplication by `f^{−s}` on `D` and `f^sM/f^{s+1}M ≅ M/fM` on
  `E`; so the Bockstein spectral sequence is the spectral sequence of that filtered complex (base §5.1),
  as stacks-more-algebra footnote 18 records.

**Checks.**

- *Sign of `d_1`.* For `M = (ℤ →(×p) ℤ)` in degrees `0, 1` and `f = p`: `k(1) = [1] ∈ H^1(M) = ℤ/p` and
  `j([1]) = 1`, so `d_1 : E_1^0 = ℤ/p → E_1^1 = ℤ/p` is `+1`, an isomorphism.
- For `M = ℤ[0]` and `f = p`, `k = 0` and every `d_r` vanishes: `E_r^0 = ℤ/p` for all `r` (base §6.2's
  Check).
- *Torsion-freeness is needed.* For `M = ℤ/p[0]` and `f = p`, multiplication by `p` is zero, so
  `0 → M → M → M/pM → 0` is not exact and there is no couple.
- For `M = (ℤ →(×p²) ℤ)`, `k(1) = [p] ∈ ℤ/p²` and `j([p]) = 0`: `d_1 = 0`.

### 6.2 Pages, higher Bocksteins and the limit page

With `M`, `f` as in 6.1, write `T[f^r]` for the `f^r`-torsion and `T[f^∞]` for the `f`-power torsion of a
module `T`, and `H̄ⁿ = Hⁿ(M)/Hⁿ(M)[f^∞]`. Prove, for `r ≥ 1` and every `n`:

- *Towers* (base §6.2): `Z_{r+1}^n = k^{−1}(f^r H^{n+1}(M))` and `B_{r+1}^n = j(Hⁿ(M)[f^r])`; the limit page
  exists, with `Z_∞^n = k^{−1}(⋂_r f^r H^{n+1}(M))` and `B_∞^n = j(Hⁿ(M)[f^∞])`.
- *Higher universal-coefficient sequences* (may-primer line 147–150, Example 2.3, in homological form):
  `0 → (f^{r−1}Hⁿ(M)) ⊗_A A/f → E_rⁿ → (f^{r−1}H^{n+1}(M))[f] → 0` is exact.
- *Higher Bocksteins.* A class of `E_rⁿ` is represented by `x ∈ Hⁿ(M/fM)` that lifts to `x̃ ∈ Hⁿ(M/f^rM)`,
  and `d_r[x] = [β_r(x̃)]`, where `β_r` is the connecting morphism of `0 → M/fM →(f^r) M/f^{r+1}M → M/f^rM → 0`.
- *Stabilisation.* If `Hⁿ(M)[f^∞] = Hⁿ(M)[f^a]` and `H^{n+1}(M)[f^∞] = H^{n+1}(M)[f^b]`, the sequence
  stabilises in total degree `n` from page `max(a, b) + 1`, and `E_∞ⁿ ≅ H̄ⁿ ⊗_A A/f`.
- *Convergence.* Let `Hⁿ(M)[1/f]` be filtered by the images `F^s = f^s H̄ⁿ` of `f^sHⁿ(M)`; this filtration
  is exhaustive and every `gr^s = f^sH̄ⁿ/f^{s+1}H̄ⁿ ≅ H̄ⁿ ⊗_A A/f`. The canonical comparison
  `gr^s ≅ ker k / B_∞ ⊆ E_∞^{s,n−s}` is an isomorphism at every position of total degree `n` if and only if
  `⋂_r f^r H^{n+1}(M) ∩ H^{n+1}(M)[f] = 0`, which holds under the bounded torsion of the previous item;
  then these isomorphisms are a weak convergence structure (base §3.2) to `Hⁿ(M)[1/f]` in degree `n`,
  which converges (base §3.2) when moreover `⋂_s f^s H̄ⁿ = 0`.

Route: the towers are base §6.2 for this couple. The higher universal-coefficient sequence comes from
`0 → ker k/B_r → Z_r/B_r → k(Z_r) → 0`, with `ker k / B_r ≅ Hⁿ/(fHⁿ + Hⁿ[f^{r−1}]) ≅ f^{r−1}Hⁿ/f^rHⁿ` (by
`x ↦ f^{r−1}x`) and `k(Z_r) = f^{r−1}H^{n+1} ∩ H^{n+1}[f]`. The higher Bockstein formula is base §6.2's
description of `d_{r}`: if `k(x) = f^{r−1}y`, `d_r[x] = [j(y)]`, and a cocycle `u` of `M` with `du = f^r w`
gives both `k(u mod f) = f^{r−1}[w]` and `β_r(u mod f^r) = w mod f`. Stabilisation: for `r ≥ b`,
`f^rH^{n+1} ∩ H^{n+1}[f] = 0`, so `Z_{r+1} = ker k`, and `B_{r+1}` is constant for `r ≥ a`. Convergence: in
modules, the kernel of `D^{s,n−s} → Hⁿ(M)[1/f]` (where `D^{s,n−s} = Hⁿ(M)` for every `s`) is `⋃_r ker i^r`,
so the image filtration of the colimit `Hⁿ(M)[1/f]` of the tower `i` has
`gr^s ≅ D^{s,n−s}/(iD^{s+1,n−s−1} + ⋃_r ker i^r) ≅ ker k / B_∞` through `j`, a submodule
of the limit page `Z_∞/B_∞`, equal to it exactly when `Z_∞ = ker k`. *Needs:* 6.1; base §§1.3, 1.4, 3.1,
3.2, 6.2.

- *Multiplicativity.* If `M` is a differential graded `A`-algebra, the filtration `f^sM` of `M[1/f]` is
  multiplicative, so every page carries a pairing with `d_r` a derivation (5.2; may-primer line
  288–294, Example 4.3).

**Checks.**

- *The ℤ/p^r complex.* For `M = (ℤ →(×p^r) ℤ)` in degrees `0, 1` and `f = p`: `H^0 = 0` and `H^1 = ℤ/p^r`;
  the higher universal-coefficient sequences give `E_s^0 = E_s^1 = ℤ/p` for `s ≤ r` and `0` for `s > r`, so
  `d_1 = ⋯ = d_{r−1} = 0`, `d_r` is an isomorphism and `E_{r+1} = 0`, matching `H^1 = ℤ/p^r`; stabilisation
  is from page `max(0, r) + 1`.
- *A limit page reached by no page.* For `M = ⊕_{k ≥ 1} (ℤ →(×p^k) ℤ)`, `H^1 = ⊕_k ℤ/p^k` has unbounded
  torsion, `E_r^0 = ⊕_{k ≥ r} ℤ/p ≠ 0` for every `r`, while `⋂_r p^r H^1 = 0` gives `Z_∞^0 = ker k = 0`
  (`H^0 = 0`) and `E_∞^0 = 0`, consistent with `H^0(M)[1/p] = 0`.
- *Weak convergence can fail.* For `M = (ℤ → ℤ[1/p])` (the inclusion) in degrees `0, 1`, `H^1 = ℤ[1/p]/ℤ` is
  `p`-divisible with `H^1[p] = ℤ/p`, so the criterion fails; indeed `M/pM = (ℤ/p → 0)` gives `E_r^0 = ℤ/p`
  for every `r`, while `H^0(M)[1/p] = 0`: no isomorphism `E_∞^0 ≅ gr^s` exists at all, canonical or not.
- *Hatcher's Bockstein cohomology.* For `A = ℤ`, `f = p` and `M` the integral singular cochains of a space
  with finitely generated integral cohomology, `E_2ⁿ` is the Bockstein cohomology `BHⁿ(X; ℤ/p)`, and the
  `r = 2` sequence reproduces hatcher-at line 13330–13337, Proposition 3E.3: a `ℤ` summand of `Hⁿ`
  contributes `ℤ/p` to `E_2ⁿ`, a `ℤ/p^k` summand with `k > 1` contributes `ℤ/p` to `E_2^{n−1}` and `E_2ⁿ`,
  and a `ℤ/p` summand contributes nothing; `E_∞ⁿ = (Hⁿ/torsion) ⊗ ℤ/p` (may-primer line 155–168).

### Examples

The Bockstein spectral sequences of torsion-free complexes over a principal ideal domain with a prime
`p`, and of torsion-free abelian groups, are the cases `A` a principal ideal domain and `A = ℤ`. The
first-order Bockstein maps of Tau Ceti's continuous cohomology are `d_1` of 6.1 for continuous cochains.

### Dependencies

Base §§1.3, 1.4, 3.1, 3.2, 5.1, 6.1–6.3; Layer 5 for multiplicativity; StableHomotopyKTheory §7.22.

## Downstream consumers

- **CohomologyOfGroups**: group hyperhomology and hypercohomology as Layer 2 (2.4–2.6 for coinvariants
  and invariants), the extension spectral sequences as Layer 3 (invariants under `N` followed by
  invariants under `G/N`, and the homological form through coinvariants), the Künneth and
  universal-coefficient sequences of group (co)homology as Layer 4, and the multiplicativity of the
  extension sequence through the filtered-complex pairings of Layer 5.
- **InverseGaloisAndArithmeticFundamentalGroupsPartII** (the change-of-rings and hyperhomology
  sequences of its declared gap on graded Tor spectral sequences), **K3BlochGroups** (group
  hyperhomology sequences), **EtaleDualityAndPerverseSheaves** (hypercohomology sequences),
  **TorsionCohomologyInfrastructure** (Künneth and universal-coefficient sequences), and
  **HilbertModularVarietiesAndShimuraCurvesPartII** (change of rings for Ext along `A → A/x`): they state
  these sequences, or instances of them, for their own use.

## References

- stacks-012K: The Stacks Project Authors, *The Stacks Project*, chapter Homological Algebra, §18
  (Definition 18.3, tag 012Z), §25 (tags 012X, 0130–0133), §26 (tags 0E1P, 0E1Q, 09IZ, 09J0, 0E1R).
- stacks-05QI: The Stacks Project Authors, *The Stacks Project*, chapter Derived Categories, §16
  (tags 05TC, 015A, 05TD, 015C, 05TE, 015E), §18 (tags 013R, 013P, 013S, 013T), §19, §21 (tags 015G–015K),
  §22 (tags 015L–015N).
- stacks-more-algebra: The Stacks Project Authors, *The Stacks Project*, chapter More on Algebra, §63
  (tags 061Y, 061Z, 068F), §65 (tags 0H7Z, 0H80), §69 (tags 0AVG–0AVI), §97 (the Bockstein operators and
  footnote 18).
- grothendieck1957: A. Grothendieck, *Sur quelques points d'algèbre homologique*, Tôhoku Math. J. 9
  (1957): Chapitre II, §2.4 ((2.4.1), (2.4.2), Théorème 2.4.1, Remarques 1–3), §2.5 (Proposition 2.5.4);
  Chapitre III, §§3.7–3.8.
- may-primer: J. P. May, *A primer on spectral sequences*: §2 (Example 2.3, the Bockstein spectral
  sequence), §4 (Proposition 4.1, Corollary 4.2, Example 4.3, pairings of filtered complexes).
- hatcher-at: A. Hatcher, *Algebraic Topology*, §3.E, Proposition 3E.3.
- douady1959: A. Douady, *La suite spectrale d'Adams : structure multiplicative*, Séminaire Henri
  Cartan 11 (1958–1959), exposé 19, §II A (products of spectral systems, not used).
- weibel1994: C. A. Weibel, *An Introduction to Homological Algebra*, §§1.2, 2.2, 2.7 (Theorem 2.7.2,
  Lemma 2.7.3), 5.6–5.8 (uncertified).
- mccleary2001: J. McCleary, *A User's Guide to Spectral Sequences*, 2nd ed., Ch. 2 and Ch. 10
  (uncertified).
- cartan-eilenberg1956: H. Cartan, S. Eilenberg, *Homological Algebra*, Ch. XV–XVII (uncertified).
- massey1954: W. S. Massey, *Products in exact couples*, Ann. of Math. 59 (1954) (uncertified).
